//
//  StudyCircleDetailController.m
//  MoveSchool
//
//  Created by edz on 2017/11/24.
//
//

#import "StudyCircleDetailController.h"
#import "AllTitleButton.h"
#import "StudyCircleModel.h"
#import "NSString+Extension.h"
#import "UIImageView+WebCache.h"
#import "NSDataEx.h"
#import "StudyAttachs.h"
#import "StudyPraises.h"
#import "TBCityIconFont.h"
#import "PraiseUsers.h"
#import "NSAttributedString+Extension.h"
#import "AFNetWW.h"
#import "CommentModel.h"
#import "MJExtension.h"
#import "CommentCell.h"
#import "CustomLabel.h"
#import "ChatKeyBoard.h"
#import "IQKeyboardManager.h"
#import "XLPhotoBrowser.h"
#import "NewCourseDetailController.h"
#import "NewCourseModel.h"
#import "NewVideoCourseController.h"
#import "CourseBean.h"

//图片间距
#define imageSpacint 4

@interface StudyCircleDetailController ()<UITableViewDelegate, UITableViewDataSource, CommentCellDelegate, ChatKeyBoardDelegate, XLPhotoBrowserDatasource, XLPhotoBrowserDelegate>

//点赞按钮
@property(nonatomic, strong) UIButton *goodButton;

//删除
@property(nonatomic, strong) UIButton *deleteButton;

//评论按钮
@property(nonatomic, strong) UIButton *commentButton;

//评论数组
@property (nonatomic, strong) NSMutableArray *comments;

@property (nonatomic, strong) UITableView *commentTableView;

@property (nonatomic, strong) UILabel *praiseListView;

@property (nonatomic, strong) ChatKeyBoard *chatKeyBoard;

//是否是回复
@property (nonatomic, assign) BOOL isReply;

@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, strong) PraiseUsers *selectedUser;

@property (nonatomic, strong) UIView *centerSpeaView;

@property (nonatomic, strong) UIView *tableViewHeaderView;

@property (nonatomic, strong) UIView *commentView;

@property (nonatomic, strong) UIView *sepaView;

//点击回复的索引值
@property (nonatomic, assign) int replyIndex;

@property (nonatomic, strong) UILabel *noCommentLabel;

@property (nonatomic, strong) NSMutableArray *imageViewArray;

@end

@implementation StudyCircleDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.imageViewArray = [NSMutableArray array];
    
    [self setUpUI];
    
    //拉取评论
    [self getComment];
}

- (void) setUpUI
{
    
    UIView *tableViewHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 0)];
    self.tableViewHeaderView = tableViewHeaderView;
    tableViewHeaderView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(mainSpacing15, mainSpacing15, 35, 35)];
    headerView.layer.cornerRadius = headerView.width * 0.5;
    headerView.layer.masksToBounds = YES;
    [headerView sd_setImageWithURL:[NSURL URLWithString:self.studyCircleModel.headpic] placeholderImage:[UIImage imageNamed:@"mineNormal"]];
    headerView.userInteractionEnabled = YES;
    [tableViewHeaderView addSubview:headerView];
    
    // 昵称X
    CGFloat namex = CGRectGetMaxX(headerView.frame) + mainSpacing;
    CGSize size = [self.studyCircleModel.nickname returnStringRect:self.studyCircleModel.nickname size:CGSizeMake(SCREEN_WIDTH - namex - mainSpacing, CGFLOAT_MAX) font:[UIFont systemFontOfSize:ys_28]];
    
    AllTitleButton *nameLabel = [[AllTitleButton alloc] initWithFrame:CGRectMake(namex, mainSpacing, size.width > SCREEN_WIDTH - namex - mainSpacing ? SCREEN_WIDTH - namex - mainSpacing : size.width, 20)];
    [nameLabel setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    nameLabel.centerY = headerView.centerY;
    [nameLabel setTitle:self.studyCircleModel.nickname forState:UIControlStateNormal];
    nameLabel.titleLabel.font = [UIFont systemFontOfSize:ys_f24];
    [tableViewHeaderView addSubview:nameLabel];
    
    CGFloat timeW = [self.studyCircleModel.indate returnStringRect:self.studyCircleModel.indate size:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) font:[UIFont systemFontOfSize:ys_f24]].width + mainSpacing;
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - timeW, mainSpacing15, timeW, 20)];
    timeLabel.centerY = headerView.centerY;
    timeLabel.textColor = AuxiliaryColor;
    timeLabel.font = [UIFont systemFontOfSize:ys_f24];
    timeLabel.text = self.studyCircleModel.indate;
    [tableViewHeaderView addSubview:timeLabel];
    
    CGFloat contentY = CGRectGetMaxY(headerView.frame) + mainSpacing;
    
    if (self.studyCircleModel.content.length > 0) {
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(headerView.x, contentY, self.view.width - headerView.x * 2, 0)];
        contentLabel.textColor = MainTextColor;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[self base64DecodeString:self.studyCircleModel.content]];
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:LineSpacing];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [[self base64DecodeString:self.studyCircleModel.content] length])];
        contentLabel.attributedText = attributedString;
        contentLabel.font = [UIFont systemFontOfSize:ys_28];
        contentLabel.numberOfLines = 0;
        [contentLabel sizeToFit];
        [tableViewHeaderView addSubview:contentLabel];
        
        contentY = CGRectGetMaxY(contentLabel.frame) + mainSpacing;
    }
    
    CGFloat goodButtonY = contentY;
    
    if (self.studyCircleModel.attachs.count > 0) {
        //计算 图片宽高
        CGFloat imageWH = ((SCREEN_WIDTH - nameLabel.x * 1.5) - 2 * imageSpacint) / 3;
        
        //9张图片时的宽高
        CGFloat nightWH = SCREEN_WIDTH - nameLabel.x * 1.5;
        
        //行数
        int row = 3;
        if (self.studyCircleModel.attachs.count == 4) {
            row = 2;
        }
        
        CGRect oneImageFrame = CGRectZero;
        
        if (self.studyCircleModel.attachs.count == 1) {
            
            StudyAttachs *attach = [self.studyCircleModel.attachs firstObject];
            
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:attach.thumbnail]];
            UIImage *image = [UIImage imageWithData:data];
            
            CGFloat baseSize = (SCREEN_WIDTH - 2 * mainSpacing15) * 0.6;
            
            if (image.size.width >= image.size.height) {
                oneImageFrame = CGRectMake(0, contentY, baseSize, (baseSize / image.size.width) * image.size.height);
                
            }else
            {                
                oneImageFrame = CGRectMake(0, contentY, (baseSize / image.size.height) *image.size.width , baseSize);

            }
            
        }else if(self.studyCircleModel.attachs.count != 4)
        {
            int count = (int)self.studyCircleModel.attachs.count;
            CGFloat imageH = 0;
            
            if (count < 4) { // 一行
                imageH = imageWH;
            }else if(count < 7) // 二行
            {
                imageH = imageWH * 2 + imageSpacint;
            }else //三行
            {
                imageH = imageWH * 3 + 2 * imageSpacint;
            }
            
            oneImageFrame = CGRectMake(0, 0, imageWH, imageWH);
        }else //4张图片 特殊处理
        {
            oneImageFrame = CGRectMake(0, 0, imageWH, imageWH);
        }
        
        for (int i = 0; i < self.studyCircleModel.attachs.count; i ++) {
            StudyAttachs *attach = self.studyCircleModel.attachs[i];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:oneImageFrame];
            [self.imageViewArray addObject:imageView];
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)]];
            imageView.tag = i;
            imageView.userInteractionEnabled = YES;
            [imageView sd_setImageWithURL:[NSURL URLWithString:attach.url] placeholderImage:[UIImage imageNamed:@"circle_portrait153"]];
            
            imageView.x = (i % row) * (imageWH + imageSpacint) + mainSpacing15;
            imageView.y = (i / row) * (imageWH + imageSpacint) + contentY;
            
            [tableViewHeaderView addSubview:imageView];

            if (i == self.studyCircleModel.attachs.count - 1) {
                goodButtonY = CGRectGetMaxY(imageView.frame) + mainSpacing15;
            }
        }
    }
    
    CGFloat goodW = [NSString returnStringRect:self.studyCircleModel.praise.num size:CGSizeMake(SCREEN_WIDTH, CGFLOAT_MAX) font:[UIFont systemFontOfSize:ys_f24]].width + 25;
    UIButton *goodButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - goodW - mainSpacing, goodButtonY, goodW, 20)];
    self.goodButton = goodButton;
    [goodButton addTarget:self action:@selector(headerGoodButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [goodButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    [goodButton setTitleColor:MainColor forState:UIControlStateSelected];
    [goodButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e62e", ys_f24, AuxiliaryColor)] forState:UIControlStateNormal];
    [goodButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e62d", ys_f24, MainColor)] forState:UIControlStateSelected];
    goodButton.titleLabel.font = [UIFont systemFontOfSize:ys_f24];
    goodButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [goodButton setTitle:self.studyCircleModel.praise.num forState:UIControlStateNormal];
    if ([self.studyCircleModel.praise.isPraise isEqualToString:@"1"]) {
        goodButton.selected = YES;
    }else
    {
        goodButton.selected = NO;
    }
    
    [tableViewHeaderView addSubview:goodButton];
    
    //评论Frame
    CGFloat commentW = [NSString returnStringRect:self.studyCircleModel.commentcount size:CGSizeMake(SCREEN_WIDTH, CGFLOAT_MAX) font:[UIFont systemFontOfSize:ys_f24]].width + 25;
    
    UIButton *commentButton = [[UIButton alloc] initWithFrame:CGRectMake(goodButton.x - mainSpacing - commentW, goodButton.y, commentW, 30)];
    self.commentButton = commentButton;
    commentButton.centerY = goodButton.centerY;
    [commentButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    [commentButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e63c", ys_f24, AuxiliaryColor)] forState:UIControlStateNormal];
    commentButton.titleLabel.font = [UIFont systemFontOfSize:ys_f24];
    commentButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    [commentButton setTitle:self.studyCircleModel.commentcount forState:UIControlStateNormal];
    [tableViewHeaderView addSubview:commentButton];
    
    //自己发布
    if (self.studyCircleModel.isself == 1) {
        CGSize size = [@"删除" returnStringRect:@"删除" size:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) font:[UIFont systemFontOfSize:ys_f24]];
        
        UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(commentButton.x - mainSpacing15 - size.width - 15, 0, size.width + 25, size.height)];
        deleteButton.centerY = goodButton.centerY;
        [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
        [deleteButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
        [deleteButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e61b", ys_f24, AuxiliaryColor)] forState:UIControlStateNormal];
        [deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
        deleteButton.titleLabel.font = [UIFont systemFontOfSize:ys_f24];
        [tableViewHeaderView addSubview:deleteButton];
    }
    
    tableViewHeaderView.height = CGRectGetMaxY(goodButton.frame) + mainSpacing * 2;
    
    UIView *centerSpeaView = [[UIView alloc] initWithFrame:CGRectMake(headerView.x, CGRectGetMaxY(goodButton.frame) + mainSpacing15, tableViewHeaderView.width - headerView.x, 0.5)];
    self.centerSpeaView = centerSpeaView;
    centerSpeaView.backgroundColor = SepaViewColor;
    [tableViewHeaderView addSubview:centerSpeaView];
    
    NSMutableString *praiseContent = [NSMutableString string];
    for (PraiseUsers *praise in self.studyCircleModel.praise.praiseUsers) {
        [praiseContent appendString:[NSString stringWithFormat:@"%@  ",praise.nickname]];
    }
    
    if ([praiseContent containsString:@"  "]) {
        praiseContent = (NSMutableString *)[praiseContent substringToIndex:praiseContent.length - 1];
    }
    
    NSMutableAttributedString *praiseAttribute = [[NSMutableAttributedString alloc] initWithString:praiseContent];
    
    //图片名称
    NSTextAttachment *textAttach = [[NSTextAttachment alloc] init];
    textAttach.bounds = CGRectMake(0, -2, 20, 15);
    textAttach.image = [UIImage imageNamed:@"dianzanming"];
    
    //把附件转换成可变字符串，用于替换掉源字符串中的表情文字
    NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:textAttach];
    
    [praiseAttribute insertAttributedString:imageStr atIndex:0];
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:praiseAttribute];
    
    for (PraiseUsers *praise in self.studyCircleModel.praise.praiseUsers) {
        NSRange range = [praiseContent rangeOfString:praise.nickname];
        [attributeString addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(130,130,130) range:NSMakeRange(range.location + 1, range.length)];
        [attributeString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:ys_f24] range:NSMakeRange(range.location + 1, range.length)];
    }
    
    CGSize sizes = [praiseAttribute returnAttributedStringRect:praiseAttribute size:CGSizeMake(SCREEN_WIDTH - mainSpacing - mainSpacing15, CGFLOAT_MAX) font:[UIFont systemFontOfSize:ys_f24]];
    
    UILabel *praiseListView = [[UILabel alloc] initWithFrame:CGRectMake(mainSpacing15 + 5, CGRectGetMaxY(centerSpeaView.frame) + mainSpacing, SCREEN_WIDTH - mainSpacing - mainSpacing15 - 5, sizes.height)];
    self.praiseListView = praiseListView;
    praiseListView.attributedText = attributeString;
    praiseListView.numberOfLines = 0;
    praiseListView.font = [UIFont systemFontOfSize:ys_f24];
    [tableViewHeaderView addSubview:praiseListView];
    
    if (self.studyCircleModel.praise.praiseUsers.count > 0) {
        praiseListView.hidden = NO;
        centerSpeaView.hidden = NO;
        
        tableViewHeaderView.height = CGRectGetMaxY(praiseListView.frame) + mainSpacing * 2;

    }else
    {
        praiseListView.hidden = YES;
        centerSpeaView.hidden = YES;
        
        tableViewHeaderView.height = CGRectGetMaxY(goodButton.frame) + mainSpacing * 2;
    }
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tableViewHeaderView.frame) - mainSpacing, tableViewHeaderView.width, mainSpacing)];
    self.sepaView = sepaView;
    sepaView.backgroundColor = ViewBackColor;
    [tableViewHeaderView addSubview:sepaView];

    if (self.studyCircleModel.comments.count > 0) {
        //评论
        UIView *commentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView.frame), tableViewHeaderView.width, 45)];
        self.commentView = commentView;
        commentView.backgroundColor = [UIColor whiteColor];
        [tableViewHeaderView addSubview:commentView];
        
        UILabel *chapter = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, commentView.width - 30, commentView.height)];
        chapter.text = @"评论";
        chapter.textColor = MainTextColor;
        chapter.font = [UIFont systemFontOfSize:ys_f30];
        [commentView addSubview:chapter];
        
        //分割线
        UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, commentView.height - 0.5, commentView.width, 0.5)];
        sepaView.backgroundColor = SepaViewColor;
        [commentView addSubview:sepaView];
        
        tableViewHeaderView.height = CGRectGetMaxY(commentView.frame) + mainSpacing;

    }
    
    if (self.studyCircleModel.comments.count == 0) {
        UILabel *noCommentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView.frame) + 65, tableViewHeaderView.width, 30)];
        self.noCommentLabel = noCommentLabel;
        noCommentLabel.textAlignment = NSTextAlignmentCenter;
        noCommentLabel.text = @"还没有人评论，赶紧来抢沙发吧~";
        noCommentLabel.textColor = AuxiliaryColor;
        noCommentLabel.font = [UIFont systemFontOfSize:ys_f24];
        [tableViewHeaderView addSubview:noCommentLabel];
    }
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.backgroundColor = ViewBackColor;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [[UIView alloc] init];
    tableView.height = self.view.height - 64 - 55;
    self.commentTableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = tableViewHeaderView;
    [self.view addSubview:tableView];

    [self setUpToolView];
}

-(NSString *)base64DecodeString:(NSString *)string
{
    //1.将base64编码后的字符串『解码』为二进制数据
    NSData *data = [NSData dataWithBase64EncodedString:string];
    
    //2.把二进制数据转换为字符串返回
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.comments.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"CommentCell";
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.delegate = self;
    CommentModel *model = self.comments[indexPath.row];
    cell.model = model;
    
    if (indexPath.row == self.comments.count - 1) {
        cell.sepaView.hidden = YES;
    }else
    {
        cell.sepaView.hidden = NO;
    }
    return cell;
}

- (void) getComment
{
    //获取评论
    NSString *url = [NSString stringWithFormat:@"%@%@?businessid=%@&businesscode=%d&token=%@",NetHeader,GetCommentList,self.studyCircleModel.ID,BroadcastType,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             self.comments = (NSMutableArray *)[CommentModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
             
             if (self.comments.count > 0) {
                 [self.commentTableView reloadData];
             }
         }
         
     }fail:^(NSError *error) {
         
     }];
}

- (void) goodButtonClick : (CommentCell *) cell
{

    NSIndexPath *indexPath = [self.commentTableView indexPathForCell:cell];
    CommentModel *model = self.comments[indexPath.row];
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,PraiseAdd,[UserInfoTool getUserInfo].token];
    
    NSDictionary *dic = @{
                          @"businessid" : model.ID,
                          @"businesscode" : teacherQuestionType
                          };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        
        NSInteger code = [responseDic[@"rescode"] integerValue];
        
        if (code == 10000) {
            
            if ([responseDic[@"data"][@"err"] intValue] == 0) {// 1取消点赞 0点赞成功
                [cell.goodButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e62d", 15, MainColor)] forState:UIControlStateNormal];
                [cell.goodButton setTitleColor:MainColor forState:UIControlStateNormal];
                
            }else
            {
                [cell.goodButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e62e", 15, AuxiliaryColor)] forState:UIControlStateNormal];
                [cell.goodButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
            }
            
            [cell.goodButton setTitle:responseDic[@"data"][@"num"] forState:UIControlStateNormal];
            
        }else if(code != 20002)
        {
            [MBProgressHUD showError:@"网络错误"];
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"网络错误"]];
    }];

}

//删除评论
- (void) deleteComment : (CommentCell *) cell
{
    
    NSIndexPath *indexPath = [self.commentTableView indexPathForCell:cell];
    CommentModel *model = self.comments[indexPath.row];
    NSDictionary *dic=@{
                        @"id" : model.ID
                        };
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,CommentDel,[UserInfoTool getUserInfo].token];
    
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        int rescode = [responseDic[@"rescode"] intValue];
        if (rescode == 10000) {
            [MBProgressHUD showSuccess:@"删除成功"];
            [self.comments removeObject:model];
            
            if (self.comments.count == 0) {
                
                if (self.noCommentLabel == nil) {
                    UILabel *noCommentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.sepaView.frame) + 65, self.tableViewHeaderView.width, 30)];
                    self.noCommentLabel = noCommentLabel;
                    noCommentLabel.textAlignment = NSTextAlignmentCenter;
                    noCommentLabel.text = @"还没有人评论，赶紧来抢沙发吧~";
                    noCommentLabel.textColor = AuxiliaryColor;
                    noCommentLabel.font = [UIFont systemFontOfSize:ys_f24];
                    [self.tableViewHeaderView addSubview:noCommentLabel];
                }
                
                self.commentView.hidden = YES;
                self.noCommentLabel.hidden = NO;
                self.commentView.height = 0;
                self.tableViewHeaderView.height = CGRectGetMaxY(self.commentView.frame);
                self.commentTableView.tableHeaderView = self.tableViewHeaderView;
            }
        
            //刷新评论列表
            [self.commentTableView reloadData];
            
            self.chatKeyBoard.chatToolBar.textView.text = @"";
            
            [self.commentButton setTitle:model.commentcount forState:UIControlStateNormal];
            
            if ([self.detailDelete respondsToSelector:@selector(reloadData:)]) {
                [self.detailDelete reloadData:self.comments];
            }
            
        }else
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD showError:responseDic[@"msg"]];
            });
        }
    } fail:^(NSError *error) {
        
    }];

}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentModel *model = self.comments[indexPath.row];
    if (model.touserid > 0) { //有回复
        if ([model.userid isEqualToString:[UserInfoTool getUserInfo].zttid]) { //自己评论的 有删除
            return model.contentHeight + 51 + 50 + 20 + mainSpacing;
        }else
        {
            return model.contentHeight + 51 + 50;
        }
    }else
    {
        if ([model.userid isEqualToString:[UserInfoTool getUserInfo].zttid]) { //自己评论的 有删除
            return model.contentHeight + 51 + 20 + mainSpacing;
        }else
        {
            return model.contentHeight + 51;
        }
    }
}

- (void) headerGoodButtonClick
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,PraiseAdd,[UserInfoTool getUserInfo].token];
    
    NSDictionary *dic = @{
                          @"businessid" : self.studyCircleModel.ID,
                          @"businesscode" : radioType
                          };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        
        NSInteger code = [responseDic[@"rescode"] integerValue];
        
        if (code == 10000) {
            
            NSMutableArray *newArray = [NSMutableArray arrayWithArray:self.studyCircleModel.praise.praiseUsers];
            PraiseUsers *user = [[PraiseUsers alloc] init];
            user.nickname = [UserInfoTool getUserInfo].nickname;
            user.userid = [[UserInfoTool getUserInfo].zttid intValue];
            
            if ([responseDic[@"data"][@"err"] intValue] == 0) {// 1取消点赞 0点赞成功
                self.studyCircleModel.praise.isPraise = @"1";
                [newArray addObject:user];
            }else
            {
                self.studyCircleModel.praise.isPraise = @"0";
                for (PraiseUsers *praiseUser in newArray) {
                    if (praiseUser.userid == user.userid) {
                        self.selectedUser = praiseUser;
                    }
                }
                
                if (self.selectedUser != nil) {
                    [newArray removeObject:self.selectedUser];
                }
            }
            
            if ([self.detailDelete respondsToSelector:@selector(reloadData:)]) {
                [self.detailDelete reloadData:self.comments];
            }
            
            self.studyCircleModel.praise.praiseUsers = newArray;
            
            if ([responseDic[@"data"][@"err"] intValue] == 0) {// 1取消点赞 0点赞成功
                
                self.goodButton.selected = YES;
                
                if (self.praiseListView == nil) {
                    
                }
            }else
            {
                self.goodButton.selected = NO;
            }
            
            [self.goodButton setTitle:responseDic[@"data"][@"num"] forState:UIControlStateNormal];
            
            
            NSMutableString *praiseContent = [NSMutableString string];
            for (PraiseUsers *praise in self.studyCircleModel.praise.praiseUsers) {
                [praiseContent appendString:[NSString stringWithFormat:@"%@  ",praise.nickname]];
            }
            
            if ([praiseContent containsString:@"  "]) {
                praiseContent = (NSMutableString *)[praiseContent substringToIndex:praiseContent.length - 1];
            }
            
            NSMutableAttributedString *praiseAttribute = [[NSMutableAttributedString alloc] initWithString:praiseContent];
            
            //图片名称
            NSTextAttachment *textAttach = [[NSTextAttachment alloc] init];
            textAttach.bounds = CGRectMake(0, -2, 20, 15);
            textAttach.image = [UIImage imageNamed:@"dianzanming"];
            
            //把附件转换成可变字符串，用于替换掉源字符串中的表情文字
            NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:textAttach];
            
            [praiseAttribute insertAttributedString:imageStr atIndex:0];
            
            NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:praiseAttribute];
            
            for (PraiseUsers *praise in self.studyCircleModel.praise.praiseUsers) {
                NSRange range = [praiseContent rangeOfString:praise.nickname];
                [attributeString addAttribute:NSForegroundColorAttributeName value:RGBCOLOR(130,130,130) range:NSMakeRange(range.location + 1, range.length)];
                [attributeString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:ys_f24] range:NSMakeRange(range.location + 1, range.length)];
            }
            
            self.praiseListView.attributedText = attributeString;

            
            if (self.studyCircleModel.praise.praiseUsers.count > 0) {
                self.praiseListView.hidden = NO;
                self.centerSpeaView.hidden = NO;
                
                self.tableViewHeaderView.height = CGRectGetMaxY(self.praiseListView.frame) + mainSpacing * 2;
                
            }else
            {
                self.praiseListView.hidden = YES;
                self.centerSpeaView.hidden = YES;
                
                self.tableViewHeaderView.height = CGRectGetMaxY(self.goodButton.frame) + mainSpacing * 2;
            }
            
            self.sepaView.y = CGRectGetMaxY(self.tableViewHeaderView.frame) - mainSpacing;

            if (self.studyCircleModel.comments.count > 0) {
                
                self.commentView.y = CGRectGetMaxY(self.sepaView.frame);
                self.tableViewHeaderView.height = CGRectGetMaxY(self.commentView.frame) + mainSpacing;
            }
            
            
            self.commentTableView.tableHeaderView = self.tableViewHeaderView;
//            [self.commentTableView reloadData];
            [self getComment];
            
        }else if(code != 20002)
        {
            [MBProgressHUD showError:@"网络错误"];
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"网络错误"]];
    }];
}

#pragma mark 初始化工具条
- (void) setUpToolView
{
    UIView *toolView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height - 55 - 64, self.view.width, 55)];
    toolView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:toolView];
    
    UIButton *collectionButton = [[UIButton alloc] initLineWithFrame:CGRectMake(toolView.width - 50, 0, 50, 19)];
    [collectionButton addTarget:self action:@selector(writeCommentClick) forControlEvents:UIControlEventTouchUpInside];
    collectionButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [collectionButton setTitle:@"发布" forState:UIControlStateNormal];
    [collectionButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    [collectionButton addTarget:self action:@selector(writeCommentClick) forControlEvents:UIControlEventTouchUpInside];
    collectionButton.backgroundColor = [UIColor whiteColor];
    [toolView addSubview:collectionButton];
    
    //写评论
    CustomLabel *writeComment = [[CustomLabel alloc] initLineWithFrame:CGRectMake(15, 0, self.view.width - 15 - collectionButton.width, 35)];
    writeComment.centerY = toolView.height * 0.5;
    writeComment.userInteractionEnabled = YES;
    [writeComment addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(writeCommentClick)]];
    writeComment.layer.cornerRadius = fillet;
    writeComment.layer.masksToBounds = YES;
    writeComment.textInsets = UIEdgeInsetsMake(0, mainSpacing, 0, 0);
    writeComment.backgroundColor = ViewBackColor;
    writeComment.textColor = AuxiliaryColor;
    writeComment.text = @"写评论...";
    writeComment.font = [UIFont systemFontOfSize:ys_28];
    collectionButton.centerY = writeComment.centerY;
    [toolView addSubview:writeComment];
    
    self.chatKeyBoard = [ChatKeyBoard keyBoardWithNavgationBarTranslucent:YES];
    self.chatKeyBoard.morePanelHeight = 216 - 64;
    self.chatKeyBoard.delegate = self;
    [self.chatKeyBoard.chatToolBar.faceBtn setTitle:@"发布" forState:UIControlStateNormal];
    self.chatKeyBoard.chatToolBar.faceBtn.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    [self.chatKeyBoard.chatToolBar.faceBtn addTarget:self action:@selector(sendComment) forControlEvents:UIControlEventTouchUpInside];
    self.chatKeyBoard.y = self.chatKeyBoard.y + 20;
    self.chatKeyBoard.keyBoardStyle = KeyBoardStyleComment;
    self.chatKeyBoard.allowVoice = NO;
    self.chatKeyBoard.allowMore = NO;
    self.chatKeyBoard.allowSwitchBar = NO;
    self.chatKeyBoard.backgroundColor = [UIColor whiteColor];
    self.chatKeyBoard.chatToolBar.textView.backgroundColor = ViewBackColor;
    self.chatKeyBoard.chatToolBar.textView.textColor = MainTextColor;
    self.chatKeyBoard.chatToolBar.textView.layer.borderColor = [UIColor clearColor].CGColor;
    self.chatKeyBoard.placeHolder = @"写评论...";
    
    [self.view addSubview:self.chatKeyBoard];
}

#pragma mark 写评论点击
- (void) writeCommentClick
{
    self.chatKeyBoard.placeHolder = @"写评论...";
    
    self.isReply = NO;
    UIView *maskView = [[UIView alloc] initLineWithFrame:self.view.bounds];
    [maskView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskViewClick)]];
    self.maskView = maskView;
    maskView.alpha = 0.5;
    maskView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:maskView];
    
    [self.view bringSubviewToFront:self.chatKeyBoard];
    
    [self.chatKeyBoard keyboardUpforComment];
}

- (void) maskViewClick
{
    [self.chatKeyBoard keyboardDownForComment];
    if (self.maskView != nil) {
        [self.maskView removeFromSuperview];
    }
}

- (void) chatKeyBoardSendText:(NSString *)text
{
    [self maskViewClick];
    [self sendCommentWithText:text];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = NO;
    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
}

#pragma mark 发送评论
- (void) sendComment
{
    
    [self maskViewClick];
    [self sendCommentWithText:self.chatKeyBoard.chatToolBar.textView.text];
}

#pragma mark 发送评论
- (void) sendCommentWithText : (NSString *) text
{
    
    NSDictionary *dic=@{
                        @"businessid" : self.studyCircleModel.ID,
                        @"businesscode" : radioType,
                        @"toid" : @"0",
                        @"content" : text
                        };
    
    if (self.comments.count > 0) {
        CommentModel *model = self.comments[self.replyIndex];
        
        dic = @{
                @"businessid" : self.studyCircleModel.ID,
                @"businesscode" : radioType,
                @"toid" : self.isReply ? model.ID : @"0",
                @"content" : text
                };
    }
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,CommentAdd,[UserInfoTool getUserInfo].token];
    
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        int rescode = [responseDic[@"rescode"] intValue];
        if (rescode == 10000) {
            [MBProgressHUD showSuccess:@"评论成功"];
            CommentModel *model = [CommentModel objectWithKeyValues:responseDic[@"data"]];
            [self.comments insertObject:model atIndex:0];
            
            if (self.comments.count > 0) {
                if (self.commentView == nil) {
                    //评论
                    UIView *commentView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.sepaView.frame), self.tableViewHeaderView.width, 45)];
                    self.commentView = commentView;
                    commentView.backgroundColor = [UIColor whiteColor];
                    [self.tableViewHeaderView addSubview:commentView];
                    
                    UILabel *chapter = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, commentView.width - 30, commentView.height)];
                    chapter.text = @"评论";
                    chapter.textColor = MainTextColor;
                    chapter.font = [UIFont systemFontOfSize:ys_f30];
                    [commentView addSubview:chapter];
                    
                    //分割线
                    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, commentView.height - 0.5, commentView.width, 0.5)];
                    sepaView.backgroundColor = SepaViewColor;
                    [commentView addSubview:sepaView];
                    
                    self.tableViewHeaderView.height = CGRectGetMaxY(commentView.frame) + mainSpacing;
                }
                
                self.commentView.height = 45;
                self.tableViewHeaderView.height = CGRectGetMaxY(self.commentView.frame) + mainSpacing;
                
                self.commentView.hidden = NO;
                self.noCommentLabel.hidden = YES;
                
                self.commentTableView.tableHeaderView = self.tableViewHeaderView;
            }
            
            //刷新评论列表
            [self.commentTableView reloadData];

            self.chatKeyBoard.chatToolBar.textView.text = @"";
            
            [self.commentButton setTitle:model.commentcount forState:UIControlStateNormal];
            
            if ([self.detailDelete respondsToSelector:@selector(reloadData:)]) {
                [self.detailDelete reloadData:self.comments];
            }
            
        }else
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD showError:responseDic[@"msg"]];
            });
        }
    } fail:^(NSError *error) {
        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失

    self.replyIndex = (int)indexPath.row;
    CommentModel *model = self.comments[indexPath.row];
    //回复评论
    [self writeCommentClick];
    self.chatKeyBoard.placeHolder = [NSString stringWithFormat:@"回复%@",model.nickname];
    
    self.isReply = YES;
}

- (void) deleteButtonClick
{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"您确定要删除该条动态吗?" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:[ManyLanguageMag getLOginStrWith:@"确定"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        {
            if ([self.detailDelete respondsToSelector:@selector(deleteStudyCircle:studyCircleModel:)]) {
                [self.detailDelete deleteStudyCircle:self.studyCircleModel.ID studyCircleModel:self.studyCircleModel];
            }
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void) imageClick : (UIGestureRecognizer *) gestureRecognizer
{
    
    if (self.studyCircleModel.attachs.count > 0) {
        StudyAttachs *attach = self.studyCircleModel.attachs.firstObject;
        if ([attach.attach_businesscode isEqualToString:courseType]) {

            //根据format判断是课程 还是 音频课程
            NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=0&count=100&courseid=%@&token=%@",NetHeader,GetCoursesDetail,attach.attach_businessid,[UserInfoTool getUserInfo].token];
            
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
             {
                 if ([responseDic[@"rescode"] intValue] == 10000) {
                     
                     NewCourseModel *model = [NewCourseModel objectWithKeyValues:responseDic[@"data"]];
                     if (model.courseBean.format != 3) {
                         NewCourseDetailController *newCourseVc = [[NewCourseDetailController alloc] init];
                         newCourseVc.courseid = model.courseBean.mainid;
                         [self.navigationController pushViewController:newCourseVc animated:YES];
                     }else
                     {
                         NewVideoCourseController *newCourseVc = [[NewVideoCourseController alloc] init];
                         newCourseVc.courseid = model.courseBean.mainid;
                         [self.navigationController pushViewController:newCourseVc animated:YES];
                     }
                 }else
                 {
                     [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];
                 }
                 
             }fail:^(NSError *error) {
                 [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];
             }];
            
        }else
        {
            UIImageView *imageview = (UIImageView *)gestureRecognizer.view;
            // 快速创建并进入浏览模式
            XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithCurrentImageIndex:imageview.tag imageCount:self.studyCircleModel.attachs.count datasource:self];
            
            // 设置长按手势弹出的地步ActionSheet数据,不实现此方法则没有长按手势
            [browser setActionSheetWithTitle:@"" delegate:self cancelButtonTitle:nil deleteButtonTitle:@"" otherButtonTitles:@"保存图片",nil];
            
            // 自定义pageControl的一些属性
            browser.pageDotColor = [UIColor lightGrayColor];
            browser.currentPageDotColor = [UIColor whiteColor];
            browser.pageControlStyle = XLPhotoBrowserPageControlStyleClassic;///< 修改底部pagecontrol的样式为系统样式,默认是弹性动画的样式

        }
    }
    
}

#pragma mark - XLPhotoBrowserDatasource

- (UIImage *)photoBrowser:(XLPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    UIImageView *imageView = self.imageViewArray[index];
    return imageView.image;
}

- (UIView *)photoBrowser:(XLPhotoBrowser *)browser sourceImageViewForIndex:(NSInteger)index
{
    return self.imageViewArray[index];
}

#pragma mark - XLPhotoBrowserDelegate
- (void)photoBrowser:(XLPhotoBrowser *)browser clickActionSheetIndex:(NSInteger)actionSheetindex currentImageIndex:(NSInteger)currentImageIndex
{
    switch (actionSheetindex) {
        case 0: // 保存
        {
            [browser saveCurrentShowImage];
            break;
        }
    }
}

@end
