//
//  SalongCell.m
//  MoveSchool
//
//  Created by edz on 2017/8/24.
//
//

#import "SalongCell.h"
#import "UILabel+Extension.h"
#import "ShalonModel.h"
#import "NSString+Extension.h"
#import "UIImageView+WebCache.h"
#import "AFNetWW.h"

@interface SalongCell()

//图片
@property (nonatomic, strong) UIImageView *imgView;

//预约背景
@property (nonatomic, strong) UIView *timeLabel;

//预约
@property (nonatomic, strong) UIButton *orderLabel;

//标题
@property (nonatomic, strong) UILabel *titleLabel;

//日期
@property (nonatomic, strong) UILabel *dateLabel;

//副标题（讲师名，免费）
@property (nonatomic, strong) UILabel *subtitleLabel;

//底部View
@property (nonatomic, strong) UIView *boomView;

@property (nonatomic, strong) UIView *sepaView;

@end

@implementation SalongCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imgView];
        
        self.timeLabel = [[UIView alloc] init];
        self.timeLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        [self.contentView addSubview:self.timeLabel];
        
        self.orderLabel = [[UIButton alloc] init];
        self.orderLabel.hidden = YES;
        [self.orderLabel addTarget:self action:@selector(orderLabelCLick) forControlEvents:UIControlEventTouchUpInside];
        [self.orderLabel setTitle:@"报名" forState:UIControlStateNormal];
        self.orderLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        self.orderLabel.layer.borderWidth = 0.5;
        self.orderLabel.layer.cornerRadius = fillet;
        self.orderLabel.layer.masksToBounds = YES;
        self.orderLabel.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.orderLabel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.orderLabel.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.timeLabel addSubview:self.orderLabel];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.font = [UIFont systemFontOfSize:ys_28];
        self.titleLabel.textColor = MainTextColor;
        [self.contentView addSubview:self.titleLabel];
        
        self.boomView = [[UIView alloc] init];
        [self.contentView addSubview:self.boomView];
        
        self.dateLabel = [[UILabel alloc] init];
        self.dateLabel.textColor = AuxiliaryColor;
        self.dateLabel.font = [UIFont systemFontOfSize:ys_f24];
        [self.boomView addSubview:self.dateLabel];
        
        self.subtitleLabel = [[UILabel alloc] init];
        self.subtitleLabel.textAlignment = NSTextAlignmentRight;
        self.subtitleLabel.textColor = AuxiliaryColor;
        self.subtitleLabel.font = [UIFont systemFontOfSize:ys_f24];
        [self.boomView addSubview:self.subtitleLabel];
        
        self.sepaView = [[UIView alloc] init];
        self.sepaView.backgroundColor = SepaViewColor;
        [self.contentView addSubview:self.sepaView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //图片
    self.imgView.frame = CGRectMake(15, 15, 137, 77);
    
    //时长
    self.timeLabel.frame = self.imgView.frame;
    
    //底部View
    self.boomView.frame = CGRectMake(CGRectGetMaxX(self.imgView.frame) + mainSpacing, CGRectGetMaxY(self.imgView.frame) - 20, self.contentView.width - CGRectGetMaxX(self.imgView.frame) - mainSpacing15, 20);
    
    //标题
    CGFloat titleY = self.imgView.y + 5;
    self.titleLabel.frame = CGRectMake(self.boomView.x, titleY, self.boomView.width, self.boomView.y - titleY);
    
    [UILabel changeLineSpaceForLabel:self.titleLabel WithSpace:2.5];
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    self.dateLabel.x = 0;
    
    NSString *learnNum = [NSString stringWithFormat:@"%@人报名",self.model.learnNum];
    
    CGFloat subTitleW = [NSString returnStringRect:learnNum size:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) font:[UIFont systemFontOfSize:12]].width + 5;
    self.subtitleLabel.frame = CGRectMake(self.boomView.width - subTitleW - mainSpacing, 0, subTitleW, 15);
    
    self.dateLabel.frame = CGRectMake(0, 0, self.subtitleLabel.x - mainSpacing, 15);
    
    self.orderLabel.frame = CGRectMake(0, 0, 45, 20);
    self.orderLabel.centerX = self.timeLabel.width * 0.5;
    self.orderLabel.centerY = self.timeLabel.height * 0.5;
    
    if (self.type == 1) {
        self.timeLabel.hidden = self.orderLabel.hidden = YES;
    }else
    {
        self.timeLabel.hidden = self.orderLabel.hidden = YES;
    }
    
    self.sepaView.frame = CGRectMake(mainSpacing15, self.contentView.height - 0.5, self.contentView.width - mainSpacing15, 0.5);

}

- (void)setModel:(ShalonModel *)model
{
    _model = model;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"zwt_kecheng"]];
    
    self.titleLabel.text = model.title;
    self.dateLabel.text = model.indate;
    self.subtitleLabel.text = [NSString stringWithFormat:@"%@人报名",model.learnNum];
    
}

#pragma mark 报名
- (void) orderLabelCLick
{

    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,ShalongBaoming,[UserInfoTool getUserInfo].token];
    
    NSDictionary *dic=@{
                        @"shalongid":self.model.businessid
                        };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:likeUrl WithParameters:dic success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             [MBProgressHUD showText:responseDic[@"data"][@"msg"] inview:[[UIApplication sharedApplication].windows lastObject]];
             
             if ([responseDic[@"data"][@"code"] intValue] == 0) {
                 
                 if ([self.delegate respondsToSelector:@selector(signUpSuccess:)]) {
                     [self.delegate signUpSuccess: self];
                 }
             };
             
         }
         
     }fail:^(NSError *error) {
         
     }];
}

@end
