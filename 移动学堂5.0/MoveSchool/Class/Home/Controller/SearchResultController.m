//
//  SearchResultController.m
//  MoveSchool
//
//  Created by edz on 2017/9/20.
//
//

#import "SearchResultController.h"
#import "SearchResultModel.h"
#import "CourseListController.h"
#import "TBCityIconFont.h"
#import "UITextField+Extension.h"
#import "AFNetWW.h"
#import "SearchModel.h"
#import "MJExtension.h"
#import "UIImageView+CornerRadius.h"
#import "SearchResultModel.h"
#import "SearchResultController.h"
#import "MyStudyLiveController.h"
#import "MyStudyShalongController.h"
#import "SearchModelTool.h"
#import "IFlyMSC/IFlyMSC.h"
#import "ISRDataHelper.h"
#import "IATConfig.h"

@interface SearchResultController ()<UITextFieldDelegate,IFlySpeechRecognizerDelegate>

@property (nonatomic, strong) UIView *tagView;

@property (nonatomic, strong) CourseListController *courseList;

@property (nonatomic, strong) MyStudyLiveController *liveVc;

@property (nonatomic, strong) MyStudyShalongController *shalongVc;

@property (nonatomic, strong) UITextField *searchField;

@property (nonatomic, strong) UILabel *historyLabel;

@property (nonatomic, strong) NSMutableArray *historyView;

@property (nonatomic, strong) UIButton *clearAll;

//不带界面的识别对象
@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;

@property (nonatomic, strong) UIView *maskView;

@end

@implementation SearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置buttonBarView属性 选中文字变大 文字颜色
    [self setButtonBarView];
    
    [self setData];
    
    [self setUpUI];
    
}

- (void) setUpUI
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width - 30, 44)];
    
    UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, titleView.width - 35, 30)];
    searchView.backgroundColor = RGBCOLOR(130,130,130);
    searchView.layer.cornerRadius = 3;
    searchView.layer.masksToBounds = YES;
    searchView.centerY = titleView.height * 0.5;
    [titleView addSubview:searchView];
    
    //搜索按钮
    UIImageView *searchImgae = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(searchView.frame) - 20 - mainSpacing, 0, 16, 16)];
    searchImgae.userInteractionEnabled = YES;
    [searchImgae addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(videoClick)]];
    [searchImgae setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e694", ys_f24, [UIColor whiteColor])]];
    searchImgae.centerY = searchView.height * 0.5;
    [searchView addSubview:searchImgae];
    
    //输入框
    UITextField *searchField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, searchView.width - searchImgae.width - 2 * mainSpacing, searchView.height)];
    self.searchField = searchField;
    searchField.delegate = self;
    [searchField setLefSpacing:15];
    searchField.returnKeyType = UIReturnKeySearch;
    searchField.textColor = [UIColor whiteColor];
    searchField.font = [UIFont systemFontOfSize:15];
    [searchField setPlaceholder:@"请输入要搜索的关键词"];
    [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    [searchField setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(-20, 0, 31, 16)];
    
    UIImageView *imageViewPwd = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 16, 16)];
    imageViewPwd.userInteractionEnabled = YES;
    [imageViewPwd addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchImgaeClick)]];
    [leftView addSubview:imageViewPwd];
    imageViewPwd.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e627", 15, [UIColor whiteColor])];
    searchField.leftView = leftView;
    searchField.leftViewMode = UITextFieldViewModeAlways; //此处用来设置leftview现实时机
    [searchView addSubview:searchField];
    
    //取消
    UIButton *cancleButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(searchView.frame) + mainSpacing, 0, 25, 30)];
    [cancleButton addTarget:self action:@selector(cancleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    cancleButton.centerY = searchView.centerY;
    cancleButton.titleLabel.font = [UIFont systemFontOfSize:ys_f24];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [titleView addSubview:cancleButton];
    
    self.navigationItem.titleView = titleView;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.hidesBackButton = YES;
    
    //创建语音识别对象
    _iFlySpeechRecognizer = [IFlySpeechRecognizer sharedInstance];
    _iFlySpeechRecognizer.delegate = self;
    //设置识别参数
    //设置为听写模式
    [_iFlySpeechRecognizer setParameter: @"iat" forKey: [IFlySpeechConstant IFLY_DOMAIN]];
    //asr_audio_path 是录音文件名，设置value为nil或者为空取消保存，默认保存目录在Library/cache下。
    [_iFlySpeechRecognizer setParameter:@"iat.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    [_iFlySpeechRecognizer setParameter:@"0" forKey:@"asr_ptt"];
    
    if (self.needSearch) {
        [self videoClick];
    }
}

- (void) cancleButtonClick
{
    [_iFlySpeechRecognizer stopListening];
    [_iFlySpeechRecognizer destroy];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void) setButtonBarView
{
    self.isProgressiveIndicator = YES;
    
    self.changeCurrentIndexProgressiveBlock = ^void(XLButtonBarViewCell *oldCell, XLButtonBarViewCell *newCell, CGFloat progressPercentage, BOOL changeCurrentIndex, BOOL animated){
        if (changeCurrentIndex) {
            [oldCell.label setTextColor:AuxiliaryColor];
            [newCell.label setTextColor:MainColor];
            
            if (animated) {
                [UIView animateWithDuration:0.1
                                 animations:^(){
                                     oldCell.label.font = [UIFont systemFontOfSize:14];
                                     newCell.label.font = [UIFont systemFontOfSize:14];
                                     
                                 }
                                 completion:nil];
            }
            else{
                oldCell.label.font = [UIFont systemFontOfSize:14];
                newCell.label.font = [UIFont systemFontOfSize:14];
            }
        }
    };
}

-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    self.buttonBarView.backgroundColor = [UIColor whiteColor];
    self.buttonBarView.selectedBarAlignment = XLSelectedBarAlignmentCenter;
    
    NSMutableArray *childVcArray = [NSMutableArray array];
    
    CourseListController *courseList = [[CourseListController alloc] init];
    self.courseList = courseList;
    courseList.isFromSearch = YES;
    courseList.studyTitle = @"课程";
    [childVcArray addObject:courseList];
    
    //直播
    MyStudyLiveController *liveVc = [[MyStudyLiveController alloc] init];
    self.liveVc = liveVc;
    liveVc.isFromSearch = YES;
    liveVc.studyTitle = @"直播";
    [childVcArray addObject:liveVc];
    
    //沙龙
    MyStudyShalongController *shalongVc = [[MyStudyShalongController alloc] init];
    self.shalongVc = shalongVc;
    shalongVc.studyTitle = @"沙龙";
    shalongVc.isFromSearch = YES;
    [childVcArray addObject:shalongVc];
    
    return childVcArray;
}

- (void) setData
{
    self.historyView = [NSMutableArray array];
    
    UIView *tagView = [[UIView alloc] initWithFrame:self.view.bounds];
    tagView.backgroundColor = [UIColor whiteColor];
    self.tagView = tagView;
    [self.view addSubview:tagView];
    
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,SearchLine,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             //热门搜索
             UILabel *searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 25, self.view.width - 30, 15)];
             searchLabel.text = @"热门操作";
             searchLabel.font = [UIFont systemFontOfSize:ys_f30];
             searchLabel.textColor = MainTextColor;
             [searchLabel sizeToFit];
             [tagView addSubview:searchLabel];
             
             //中间间距
             CGFloat spaing = 10;
             
             //两边间距
             CGFloat lrSpaing = 15;
             
             //按钮宽度
             CGFloat buttonW = (self.view.width - 2 * lrSpaing - 3 * spaing) / 4;
             
             NSArray *searchs = [SearchModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
             
             //历史搜索
             UILabel *historyLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.view.width - 30, 15)];
             self.historyLabel = historyLabel;
             [historyLabel sizeToFit];
             historyLabel.text = @"历史搜索";
             historyLabel.font = [UIFont systemFontOfSize:ys_f30];
             historyLabel.textColor = MainTextColor;
             [historyLabel sizeToFit];
             [tagView addSubview:historyLabel];
             
             for (int i = 0; i < searchs.count; i ++) {
                 SearchModel *model = searchs[i];
                 
                 UIButton *button = [[UIButton alloc] init];
                 button.adjustsImageWhenHighlighted = NO;
                 [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                 button.layer.borderColor = AuxiliaryColor.CGColor;
                 button.layer.borderWidth = 0.5;
                 button.titleLabel.font = [UIFont systemFontOfSize:ys_f24];
                 [button setTitle:model.tag forState:UIControlStateNormal];
                 [button setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
                 [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                 button.width = buttonW;
                 button.height = 25;
                 button.x = lrSpaing + (i % 4) * (spaing + buttonW);
                 button.y = lrSpaing + (i / 4) * (spaing + 25) + CGRectGetMaxY(searchLabel.frame);
                 [tagView addSubview:button];
                 
                 UIImageView *normalImage = [[UIImageView alloc] initWithFrame:button.bounds];
                 [normalImage zy_cornerRadiusAdvance:fillet rectCornerType:UIRectCornerAllCorners];
                 normalImage.image = [UIImage createImageWithColor:[UIColor whiteColor]];
                 [button setBackgroundImage:normalImage.image forState:UIControlStateNormal];
                 
                 normalImage.image = [UIImage createImageWithColor:MainColor];
                 [button setBackgroundImage:normalImage.image forState:UIControlStateSelected];
                 
                 button.layer.cornerRadius = fillet;
                 
                 if (i == searchs.count - 1) {
                     historyLabel.y = CGRectGetMaxY(button.frame) + 20;
                 }
             }
             
             NSMutableArray *historyList = [SearchModelTool searches];
             if (historyList.count > 0) {
                 historyLabel.hidden = NO;
                 //清空
                 UIButton *clearAll = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(historyLabel.frame) + 5, 0, 30, 15)];
                 self.clearAll = clearAll;
                 [clearAll addTarget:self action:@selector(clearAllClick) forControlEvents:UIControlEventTouchUpInside];
                 clearAll.centerY = historyLabel.centerY;
                 [clearAll setTitle:@"清空" forState:UIControlStateNormal];
                 [clearAll setTitleColor:MainColor forState:UIControlStateNormal];
                 clearAll.titleLabel.font = [UIFont systemFontOfSize:ys_f24];
                 [tagView addSubview:clearAll];
                 
                 for (int i = 0; i < historyList.count; i ++) {
                     NSString *model = historyList[i];
                     
                     UIButton *button = [[UIButton alloc] init];
                     button.adjustsImageWhenHighlighted = NO;
                     [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
                     button.layer.borderColor = AuxiliaryColor.CGColor;
                     button.layer.borderWidth = 0.5;
                     button.titleLabel.font = [UIFont systemFontOfSize:ys_f24];
                     [button setTitle:model forState:UIControlStateNormal];
                     [button setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
                     [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
                     button.width = buttonW;
                     button.height = 25;
                     button.x = lrSpaing + (i % 4) * (spaing + buttonW);
                     button.y = lrSpaing + (i / 4) * (spaing + 25) + CGRectGetMaxY(historyLabel.frame);
                     [tagView addSubview:button];
                     
                     [self.historyView addObject:button];
                     
                     UIImageView *normalImage = [[UIImageView alloc] initWithFrame:button.bounds];
                     [normalImage zy_cornerRadiusAdvance:fillet rectCornerType:UIRectCornerAllCorners];
                     normalImage.image = [UIImage createImageWithColor:[UIColor whiteColor]];
                     [button setBackgroundImage:normalImage.image forState:UIControlStateNormal];
                     
                     normalImage.image = [UIImage createImageWithColor:MainColor];
                     [button setBackgroundImage:normalImage.image forState:UIControlStateSelected];
                     
                     button.layer.cornerRadius = fillet;
                 }
             }else
             {
                 historyLabel.hidden = YES;
             }
         }
         
     }fail:^(NSError *error) {
         
     }];
}

- (void) buttonClick : (UIButton *) button
{
    button.layer.borderColor = [UIColor clearColor].CGColor;
    button.selected = !button.selected;
    
    [self toSearch:button.titleLabel.text];
    
}

#pragma mark 搜索
- (void) toSearch : (NSString *) key
{
    [self.searchField resignFirstResponder];
    
    self.courseList.key = key;
    [self.courseList headerRefresh];
    self.tagView.hidden = YES;
    
    self.liveVc.key = key;
    self.shalongVc.key = key;
    
    //搜索记录 保存到 本地
    NSMutableArray *historyList = [SearchModelTool searches];

    if (![historyList containsObject:key]) {
        [SearchModelTool saving:key];
    }
}

- (void) searchImgaeClick
{
    if (self.searchField.text.length > 0) {
        [self toSearch:self.searchField.text];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self searchImgaeClick];
    return YES;
}

//清空
- (void) clearAllClick
{
    self.historyLabel.hidden = self.clearAll.hidden = YES;
    if (self.historyView.count > 0) {
        for (UIButton *button in self.historyView) {
            [button removeFromSuperview];
        }
    }
    [SearchModelTool removeAllSearches];
}

- (void) videoClick
{
 
    if ([_iFlySpeechRecognizer isListening]) {
        return;
    }
    
    if (self.searchField.text.length > 0) {
        self.searchField.text = @"";
    }

    UIView *maskView = [[UIView alloc] initWithFrame:self.view.bounds];

    self.maskView = maskView;
    maskView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:maskView];
    
    UIView *bjView = [[UIView alloc] initWithFrame:CGRectMake(0, maskView.height - 160, maskView.width, 160)];
    if (self.needSearch) {
        bjView.y = maskView.height - 160 - 64;
        self.needSearch = NO;
    }
    
    bjView.backgroundColor = [UIColor whiteColor];
    bjView.alpha = 0.9;
    [maskView addSubview:bjView];
    
    //图片控件,坐标和大小
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    // 给图片控件添加图片对象
    [imageView setImage:[UIImage imageNamed:@"yuyin_1"]];
    //图片控件添加到视图上面去
    imageView.center = bjView.center;
    [maskView addSubview:imageView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), self.view.width, 30)];
    title.text = @"语音搜索中...";
    title.textColor = AuxiliaryColor;
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:ys_f24];
    [maskView addSubview:title];

    //创建一个可变数组
    NSMutableArray *ary=[NSMutableArray new];
    for(int I=1;I<=4;I++){
        //通过for 循环,把我所有的 图片存到数组里面
        NSString *imageName=[NSString stringWithFormat:@"yuyin_%d",I];
        UIImage *image=[UIImage imageNamed:imageName];
        [ary addObject:image];
    }
    
    // 设置图片的序列帧 图片数组
    imageView.animationImages = ary;
    //动画重复次数
    imageView.animationRepeatCount = 0;
    //动画执行时间,多长时间执行完动画
    imageView.animationDuration = 1.0;
    //开始动画
    [imageView startAnimating];
    
    //启动识别服务
    [_iFlySpeechRecognizer startListening];
}

//IFlySpeechRecognizerDelegate协议实现
//识别结果返回代理
- (void) onResults:(NSArray *) results isLast:(BOOL)isLast{
    
    if (self.maskView != nil) {
        [self.maskView removeAllSubviews];
        [self.maskView removeFromSuperview];
    }
    
    NSMutableString *resultString = [[NSMutableString alloc] init];
    NSDictionary *dic = results[0];
    
    for (NSString *key in dic) {
        [resultString appendFormat:@"%@",key];
    }

    NSString * resultFromJson = [ISRDataHelper stringFromJson:resultString];
    
    self.searchField.text  =[NSString stringWithFormat:@"%@%@", self.searchField.text,resultFromJson];
    
    if (self.searchField.text.length == 0) {
        [MBProgressHUD showText:@"很抱歉，未能识别到语音" inview:self.view];
    }
    
    [self searchImgaeClick];
}

//识别会话结束返回代理
- (void)onError: (IFlySpeechError *) error{
//    [MBProgressHUD showText:error.errorDesc inview:self.view];
}

//停止录音回调
- (void) onEndOfSpeech{
    if (self.maskView != nil) {
        [self.maskView removeAllSubviews];
        [self.maskView removeFromSuperview];
    }
    NSLog(@"停止录音");
}

//开始录音回调
- (void) onBeginOfSpeech{
    NSLog(@"开始录音");
}

//音量回调函数
- (void) onVolumeChanged: (int)volume{}

//会话取消回调
- (void) onCancel{
    if (self.maskView != nil) {
        [self.maskView removeAllSubviews];
        [self.maskView removeFromSuperview];
    }
}

@end
