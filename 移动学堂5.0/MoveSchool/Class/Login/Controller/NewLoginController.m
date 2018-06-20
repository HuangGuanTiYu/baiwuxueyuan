//
//  NewLoginController.m
//  MoveSchool
//
//  Created by edz on 2017/9/5.
//
//

#import "NewLoginController.h"
#import "TBCityIconFont.h"
#import "ShareButton.h"
#import <UMSocialCore/UMSocialCore.h>
#import "AFNetWW.h"
#import "WebViewJavascriptBridge.h"
#import <AdSupport/AdSupport.h>
#import "MJExtension.h"
#import "ColorTypeTools.h"
#define PWD_CODE_KEY @"iglobalview"
#import "NewForgetPwdController.h"
#import "CountDownButton.h"
#import "UIButton+Extension.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "MainWebController.h"
#import "SelectIdentityController.h"
#import "CompanyController.h"
#import "MenusModel.h"
#import "MenusModelTool.h"
#import "MJExtension.h"
#import "MianTabBarController.h"

typedef enum
{
    TopViewLogin = 1,
    TopViewRegist
} TopViewType;

typedef enum : int {
    ThirdLoginQQ,
    ThirdLoginWeChat,
    ThirdLoginSina
} ThirdLoginType;

@interface NewLoginController ()<UIWebViewDelegate,CountDownButtonDelegate>

//登录按钮
@property (nonatomic, strong) UIButton *loginButton;

//注册按钮
@property (nonatomic, strong) UIButton *registButton;

//登录手机号
@property (nonatomic, strong) UITextField *phoneNumber;

//邮箱注册邮箱
@property (nonatomic, strong) UITextField *mailNumber;

//验证码
@property (nonatomic, strong) UITextField *translate;

//注册手机号
@property (nonatomic, strong) UITextField *registPhoneNumber;

//密码
@property (nonatomic,strong) UITextField *password;

//注册密码
@property (nonatomic,strong) UITextField *pwdPassword;

//邮箱注册密码
@property (nonatomic,strong) UITextField *mailPassword;

@property(strong, nonatomic) WebViewJavascriptBridge *bridge;

@property (nonatomic, strong) UIButton *remberButton;

//注册View
@property (nonatomic, strong) UIView *registView;

//登录View
@property (nonatomic, strong) UIView *loginView;

//邮箱注册View
@property (nonatomic, strong) UIView *mailView;

@end

@implementation NewLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
}

- (void) setUpUI
{
   
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:@"\U0000e807" target:self selector:@selector(back) imageColor:[UIColor whiteColor] imageFont:18];

    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.3, 30)];
    
    //登录
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, topView.width * 0.5, topView.height)];
    self.loginButton = loginButton;
    loginButton.tag = TopViewLogin;
    [loginButton addTarget:self action:@selector(topButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    [topView addSubview:loginButton];
    
    //注册
    UIButton *registButton = [[UIButton alloc] initWithFrame:CGRectMake(topView.width * 0.5, 0, topView.width * 0.5, topView.height)];
    self.registButton = registButton;
    registButton.alpha = 0.6;
    registButton.tag = TopViewRegist;
    [registButton addTarget:self action:@selector(topButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    [registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [topView addSubview:registButton];
    
    self.navigationItem.titleView = topView;
    
    //登录View
    [self setUpLoginView];
    
    //注册View
    [self setUpRegistView];
    
    //记载本地webview 加密
    UIWebView *webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webview.hidden = YES;
    [self.view addSubview:webview];
    
    [WebViewJavascriptBridge enableLogging];
    
    self.bridge = [WebViewJavascriptBridge bridgeForWebView:webview];
    [self.bridge setWebViewDelegate:self];
    [self loadRSAPage : webview];
    
}

#pragma mark 注册View
- (void) setUpRegistView
{
    //注册View
    UIView *registView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.registView = registView;
    registView.hidden = YES;
    [self.view addSubview:registView];
    
    //中间内容View
    UIView *registContentView = [[UIView alloc] initWithFrame:CGRectMake(15, 25, registView.width - 30, 125)];
    [registView addSubview:registContentView];
    
    CGFloat textFieldHeight = 45;
    
    //手机号
    self.registPhoneNumber = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, registContentView.width, textFieldHeight)];
    [self.registPhoneNumber addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    self.registPhoneNumber.keyboardType = UIKeyboardTypeNumberPad;
    self.registPhoneNumber.placeholder = @"手机号";
    self.registPhoneNumber.font = [UIFont systemFontOfSize:ys_28];
    [self.registPhoneNumber setValue : AuxiliaryColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.registPhoneNumber setValue:[UIFont systemFontOfSize:ys_28]forKeyPath:@"_placeholderLabel.font"];
    [registContentView addSubview:self.registPhoneNumber];
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.registPhoneNumber.frame), registContentView.width, 1)];
    sepaView.backgroundColor = SepaViewColor;
    [registContentView addSubview:sepaView];
    
    //验证码
    self.translate = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView.frame), registContentView.width - 20, textFieldHeight)];
    self.translate.secureTextEntry = YES;
    self.translate.placeholder = @"验证码";
    self.translate.font = [UIFont systemFontOfSize:ys_28];
    [self.translate setValue : AuxiliaryColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.translate setValue:[UIFont systemFontOfSize:ys_28]forKeyPath:@"_placeholderLabel.font"];
    [registContentView addSubview:self.translate];
    
    //倒计时按钮
    CountDownButton *coutDown = [[CountDownButton alloc] initWithFrame:CGRectMake(registContentView.width - 90, 0, 100, textFieldHeight)];
    coutDown.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [coutDown setTitleColor:MainColor forState:UIControlStateNormal];
    [coutDown setTitle:@"获取手机验证码" forState:UIControlStateNormal];
    coutDown.delegate = self;
    coutDown.centerY = self.translate.centerY;
    [registContentView addSubview:coutDown];
    
    UIView *sepaView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(coutDown.frame), registContentView.width, 1)];
    sepaView2.backgroundColor = SepaViewColor;
    [registContentView addSubview:sepaView2];
    
    //密码
    self.pwdPassword = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView2.frame), registContentView.width - 20, textFieldHeight)];
    self.pwdPassword.secureTextEntry = YES;
    self.pwdPassword.placeholder = @"密码（6-16位数字或字母）";
    self.pwdPassword.font = [UIFont systemFontOfSize:ys_28];
    [self.pwdPassword setValue : AuxiliaryColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.pwdPassword setValue:[UIFont systemFontOfSize:ys_28]forKeyPath:@"_placeholderLabel.font"];
    [registContentView addSubview:self.pwdPassword];
    
    //查看隐藏密码按钮
    UIButton *lookPwd = [[UIButton alloc] initWithFrame:CGRectMake(registContentView.width - 20, 0, 30, 30)];
    [lookPwd addTarget:self action:@selector(pwdLookPwdClick:) forControlEvents:UIControlEventTouchUpInside];
    lookPwd.centerY = self.pwdPassword.centerY;
    [lookPwd setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e67d", ys_28, AuxiliaryColor)] forState:UIControlStateNormal];
    [lookPwd setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e67e", ys_28, AuxiliaryColor)] forState:UIControlStateSelected];
    [registContentView addSubview:lookPwd];
    
    UIView *sepaView3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.pwdPassword.frame), registContentView.width, 1)];
    sepaView3.backgroundColor = SepaViewColor;
    [registContentView addSubview:sepaView3];
    
    //用户协议
    UIButton *rememberButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView3.frame), registContentView.width, 35)];
    [rememberButton addTarget:self action:@selector(rememberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    rememberButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    rememberButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rememberButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e625", ys_28, AuxiliaryColor)] forState:UIControlStateNormal];
    [rememberButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e624", ys_28, MainColor)] forState:UIControlStateSelected];
    rememberButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];

    NSString *allString = @"我已经阅读并同意《白吾学院用户协议》";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:allString];
    [string addAttribute:NSForegroundColorAttributeName value:MainColor range:[allString rangeOfString:@"《白吾学院用户协议》"]];
    [string addAttribute:NSForegroundColorAttributeName value:AuxiliaryColor range:[allString rangeOfString:@"我已经阅读并同意"]];
    [rememberButton setAttributedTitle:string forState:UIControlStateNormal];
    [registContentView addSubview:rememberButton];
    rememberButton.selected = YES;
    
    NSArray *strings = @[@"《白吾学院用户协议》"];

    [rememberButton.titleLabel yb_addAttributeTapActionWithStrings:strings tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        [self gotoAgreement];
    }];
    
    registContentView.height = CGRectGetMaxY(rememberButton.frame);
    
    //登录按钮
    UIButton *registLogin = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(registContentView.frame) + 25, self.view.width - 30, 40)];
    [registLogin addTarget:self action:@selector(registClick) forControlEvents:UIControlEventTouchUpInside];
    registLogin.layer.cornerRadius = 5;
    registLogin.layer.masksToBounds = YES;
    registLogin.backgroundColor = MainColor;
    [registLogin setTitle:@"注册" forState:UIControlStateNormal];
    [registLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registLogin.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [registView addSubview:registLogin];
    
    //邮箱注册
    UIButton *mailboxButton = [[UIButton alloc] initWithFrame:CGRectMake(registView.width - 100 - 15, CGRectGetMaxY(registLogin.frame) + 5, 100, 30)];
    mailboxButton.tag = 0;
    [mailboxButton addTarget:self action:@selector(mailboxButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    mailboxButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    mailboxButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [mailboxButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    [mailboxButton setTitle:@"邮箱注册" forState:UIControlStateNormal];
    [registView addSubview:mailboxButton];
    
    //邮箱注册界面
    [self mailboxView];
}

#pragma mark 邮箱注册界面
- (void) mailboxView
{
    //注册View
    UIView *mailView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.mailView = mailView;
    mailView.hidden = YES;
    [self.view addSubview:mailView];
    
    //中间内容View
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(15, 25, mailView.width - 30, 125)];
    
    CGFloat textFieldHeight = 45;
    
    //邮箱
    self.mailNumber = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, contentView.width, textFieldHeight)];
    self.mailNumber.placeholder = @"邮箱";
    self.mailNumber.font = [UIFont systemFontOfSize:ys_28];
    [self.mailNumber setValue : AuxiliaryColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.mailNumber setValue:[UIFont systemFontOfSize:ys_28]forKeyPath:@"_placeholderLabel.font"];
    [contentView addSubview:self.mailNumber];
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.phoneNumber.frame), contentView.width, 1)];
    sepaView.backgroundColor = SepaViewColor;
    [contentView addSubview:sepaView];
    
    //密码
    self.mailPassword = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView.frame), contentView.width - 20, textFieldHeight)];
    self.mailPassword.secureTextEntry = YES;
    self.mailPassword.placeholder = @"密码（6-16位数字或字母）";
    self.mailPassword.font = [UIFont systemFontOfSize:ys_28];
    [self.mailPassword setValue : AuxiliaryColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.mailPassword setValue:[UIFont systemFontOfSize:ys_28]forKeyPath:@"_placeholderLabel.font"];
    [contentView addSubview:self.mailPassword];
    
    //查看隐藏密码按钮
    UIButton *mailLookPwd = [[UIButton alloc] initWithFrame:CGRectMake(contentView.width - 20, 0, 30, 30)];
    [mailLookPwd addTarget:self action:@selector(mailLookPwdClick:) forControlEvents:UIControlEventTouchUpInside];
    mailLookPwd.centerY = self.password.centerY;
    [mailLookPwd setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e67d", ys_28, AuxiliaryColor)] forState:UIControlStateNormal];
    [mailLookPwd setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e67e", ys_28, AuxiliaryColor)] forState:UIControlStateSelected];
    [contentView addSubview:mailLookPwd];
    
    UIView *sepaView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.password.frame), contentView.width, 1)];
    sepaView2.backgroundColor = SepaViewColor;
    [contentView addSubview:sepaView2];

    [mailView addSubview:contentView];
    
    //用户协议
    UIButton *rememberButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView2.frame), contentView.width, 35)];
    [rememberButton addTarget:self action:@selector(rememberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    rememberButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    rememberButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rememberButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e625", ys_28, AuxiliaryColor)] forState:UIControlStateNormal];
    [rememberButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e624", ys_28, MainColor)] forState:UIControlStateSelected];
    rememberButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    
    NSString *allString = @"我已经阅读并同意《白吾学院用户协议》";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:allString];
    [string addAttribute:NSForegroundColorAttributeName value:MainColor range:[allString rangeOfString:@"《白吾学院用户协议》"]];
    [string addAttribute:NSForegroundColorAttributeName value:AuxiliaryColor range:[allString rangeOfString:@"我已经阅读并同意"]];
    [rememberButton setAttributedTitle:string forState:UIControlStateNormal];
    [contentView addSubview:rememberButton];
    rememberButton.selected = YES;
    
    NSArray *strings = @[@"《白吾学院用户协议》"];
    
    [rememberButton.titleLabel yb_addAttributeTapActionWithStrings:strings tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        [self gotoAgreement];
    }];
    
    contentView.height = CGRectGetMaxY(rememberButton.frame);
    
    //登录按钮
    UIButton *registLogin = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(contentView.frame) + 25, self.view.width - 30, 40)];
    [registLogin addTarget:self action:@selector(mailRegistLoginClick) forControlEvents:UIControlEventTouchUpInside];
    registLogin.layer.cornerRadius = 5;
    registLogin.layer.masksToBounds = YES;
    registLogin.backgroundColor = MainColor;
    [registLogin setTitle:@"注册" forState:UIControlStateNormal];
    [registLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    registLogin.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [mailView addSubview:registLogin];
    
    //手机注册
    UIButton *mailboxButton = [[UIButton alloc] initWithFrame:CGRectMake(mailView.width - 100 - 15, CGRectGetMaxY(registLogin.frame) + 5, 100, 30)];
    mailboxButton.tag = 1;
    [mailboxButton addTarget:self action:@selector(mailboxButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    mailboxButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    mailboxButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [mailboxButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    [mailboxButton setTitle:@"手机注册" forState:UIControlStateNormal];
    [mailView addSubview:mailboxButton];
}

#pragma mark 登录View
- (void) setUpLoginView
{
    //登录View
    UIView *loginView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.loginView = loginView;
    
    //中间内容View
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(15, 25, loginView.width - 30, 125)];
    
    CGFloat textFieldHeight = 45;
    
    //手机号
    self.phoneNumber = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, contentView.width, textFieldHeight)];
    self.phoneNumber.placeholder = @"邮箱/手机号";
    self.phoneNumber.font = [UIFont systemFontOfSize:ys_28];
    [self.phoneNumber setValue : AuxiliaryColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.phoneNumber setValue:[UIFont systemFontOfSize:ys_28]forKeyPath:@"_placeholderLabel.font"];
    [contentView addSubview:self.phoneNumber];
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.phoneNumber.frame), contentView.width, 1)];
    sepaView.backgroundColor = SepaViewColor;
    [contentView addSubview:sepaView];
    
    //密码
    self.password = [[UITextField alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView.frame), contentView.width - 20, textFieldHeight)];
    self.password.secureTextEntry = YES;
    self.password.placeholder = @"密码";
    self.password.font = [UIFont systemFontOfSize:ys_28];
    [self.password setValue : AuxiliaryColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.password setValue:[UIFont systemFontOfSize:ys_28]forKeyPath:@"_placeholderLabel.font"];
    [contentView addSubview:self.password];
    
    //查看隐藏密码按钮
    UIButton *lookPwd = [[UIButton alloc] initWithFrame:CGRectMake(contentView.width - 20, 0, 30, 30)];
    [lookPwd addTarget:self action:@selector(lookPwdClick:) forControlEvents:UIControlEventTouchUpInside];
    lookPwd.centerY = self.password.centerY;
    [lookPwd setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e67d", ys_28, AuxiliaryColor)] forState:UIControlStateNormal];
    [lookPwd setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e67e", ys_28, AuxiliaryColor)] forState:UIControlStateSelected];
    [contentView addSubview:lookPwd];
    
    
    UIView *sepaView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.password.frame), contentView.width, 1)];
    sepaView2.backgroundColor = SepaViewColor;
    [contentView addSubview:sepaView2];
    
    //记住密码
    UIButton *rememberButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView2.frame), 100, 35)];
    self.remberButton = rememberButton;
    [rememberButton addTarget:self action:@selector(forgetButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    rememberButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    rememberButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rememberButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e625", ys_28, AuxiliaryColor)] forState:UIControlStateNormal];
    [rememberButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e624", ys_28, MainColor)] forState:UIControlStateSelected];
    rememberButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [rememberButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    [rememberButton setTitle:@"记住密码" forState:UIControlStateNormal];
    [contentView addSubview:rememberButton];
    
    self.remberButton.selected = [MainUserDefaults boolForKey:remberPassword];
    
    //如果选择了记住密码
    if (self.remberButton.selected) { //记住密码
        self.phoneNumber.text = [UserInfoTool getAccount].loginId;
        NSString *pwd = [ColorTypeTools aes256_decrypt:PWD_CODE_KEY withString:[UserInfoTool getAccount].loginPwd];
        self.password.text = pwd;
    }else
    {
        self.phoneNumber.text = [UserInfoTool getAccount].loginId;
    }
    
    
    //忘记密码
    UIButton *forgetButton = [[UIButton alloc] initWithFrame:CGRectMake(contentView.width - 100, rememberButton.y, 100, rememberButton.height)];
    [forgetButton addTarget:self action:@selector(forgetButtonClick) forControlEvents:UIControlEventTouchUpInside];
    forgetButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    forgetButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetButton setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    [contentView addSubview:forgetButton];
    
    //登录按钮
    UIButton *login = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(contentView.frame) + 25, self.view.width - 30, 40)];
    [login addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    login.layer.cornerRadius = fillet;
    login.layer.masksToBounds = YES;
    login.backgroundColor = MainColor;
    [login setTitle:@"登录" forState:UIControlStateNormal];
    [login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    login.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [loginView addSubview:login];
    [loginView addSubview:contentView];
    
    //第三方View
    UIView *thridView = [[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(login.frame) + 106, self.view.width - 30, 175)];
    [loginView addSubview:thridView];
    
    //分割线
    UIView *sepaView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (thridView.width - 84 - 50)  * 0.5, 1)];
    sepaView3.backgroundColor = SepaViewColor;
    [thridView addSubview:sepaView3];
    
    UIView *sepaView4 = [[UIView alloc] initWithFrame:CGRectMake(thridView.width - sepaView3.width, 0, sepaView3.width, 1)];
    sepaView4.backgroundColor = SepaViewColor;
    [thridView addSubview:sepaView4];
    
    //其他方式登录
    UILabel *loginTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    loginTitle.font = [UIFont systemFontOfSize:ys_28];
    loginTitle.textAlignment = NSTextAlignmentCenter;
    loginTitle.centerX = thridView.width * 0.5;
    loginTitle.centerY = sepaView3.centerY;
    loginTitle.text = @"其他方式登录";
    loginTitle.textColor = AuxiliaryColor;
    [thridView addSubview:loginTitle];
    
    //第三方登录
    BOOL isInstallQQ = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ];
    
    BOOL isInstallWecha = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession];
    
    
    NSMutableArray *shareArray = [NSMutableArray array];
    
    if (isInstallQQ) {
        
        ShareButton *qqButton = [[ShareButton alloc] init];
        qqButton.tag = ThirdLoginQQ;
        [qqButton setTitle:@"QQ" forState:UIControlStateNormal];
        [qqButton setImage:[UIImage imageNamed:@"login_qq"] forState:UIControlStateNormal];
        [shareArray addObject:qqButton];
    }
    
    if (isInstallWecha) {
        
        ShareButton *weChatButton = [[ShareButton alloc] init];
        weChatButton.tag = ThirdLoginWeChat;
        [weChatButton setTitle:@"微信" forState:UIControlStateNormal];
        [weChatButton setImage:[UIImage imageNamed:@"login_weixin"] forState:UIControlStateNormal];
        [shareArray addObject:weChatButton];
    }
    
    if (shareArray.count > 0) {
        
        //按钮宽高
        CGFloat buttonSize = 55;
        
        int count = (int) shareArray.count + 1;
        
        for (int i = 0; i < shareArray.count; i ++) {
            ShareButton *button = shareArray[i];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake(0, 0, buttonSize, buttonSize * 2);
            button.centerY = thridView.height * 0.5 + mainSpacing;
            button.centerX = (thridView.width / count) * (i + 1);
            [thridView addSubview:button];
        }
    }
    
    [self.view addSubview:loginView];
}

- (void) loadRSAPage : (UIWebView *) webView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ZttRsa" ofType:@"html"];
    NSString *stingPath = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    [webView loadHTMLString:stingPath baseURL:[NSURL fileURLWithPath:path]];
}

- (void) topButtonClick : (UIButton *) button
{
    [self.view endEditing:YES];

    //登录
    if (button.tag == TopViewLogin) {
        self.loginView.hidden = NO;
        self.registView.hidden = YES;
        self.mailView.hidden = YES;
        self.registButton.alpha = 0.6;
        self.registButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
        self.loginButton.alpha = 1.0;
        self.loginButton.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    }else
    {
        self.loginView.hidden = YES;
        self.registView.hidden = NO;
        self.loginButton.alpha = 0.6;
        self.loginButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
        self.registButton.alpha = 1.0;
        self.registButton.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    }
}

#pragma mark 记住密码
- (void) forgetButtonClick : (UIButton *) button
{
    button.selected = !button.selected;
    
    [MainUserDefaults setBool:button.selected forKey:remberPassword];
    [MainUserDefaults synchronize];
}

#pragma mark 退出
- (void) back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 登录
- (void) loginClick
{
    [self.view endEditing:YES];

    if (self.phoneNumber.text.length == 0) {
        [MBProgressHUD showText:@"请输入正确的账号" inview:self.view];
        return;
    }
    
    if (self.password.text.length < 6) {
        [MBProgressHUD showText:@"请输入正确的密码" inview:self.view];
        return;
    }
    
    //RSA取得秘钥
    NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,URL_PASSWORDCODE];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        int rescode = [responseDic[@"rescode"] intValue];
        if (rescode == 10000) {
            
            NSDictionary *dataX = responseDic[@"data"];
            NSString *pem = dataX[@"pem"];
            
            NSArray *dat = @[self.password.text,pem];
            
            [self.bridge callHandler:@"testJavascriptHandler" data:dat responseCallback:^(id responseData) {
                //RSA得到加密后的密码（jS文件中取到）
                NSString *password = [NSString stringWithFormat:@"%@",responseData];
                
                NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,Login];
                
                NSString *jpush_regid = [[NSUserDefaults standardUserDefaults] objectForKey:RegistrationID];
                
                NSString *imei = [[[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];
                
                NSDictionary *dic=@{@"username":self.phoneNumber.text, @"password" : password,@"mobileinfo" : @{@"imei" : imei, @"ver" : [[UIDevice currentDevice] systemVersion], @"ostype" : @"2",@"jpush_regid" : jpush_regid}};
                
                
                [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
                    
                    int code = [responseDic[@"rescode"] intValue];
                    
                    if (code == 10000) {
                        //保存用户登录信息
                        UserInfo *userInfo = [UserInfo objectWithKeyValues:responseDic[@"data"]];
                        userInfo.loginId = self.phoneNumber.text;
                        userInfo.loginPwd = [ColorTypeTools aes256_encrypt:PWD_CODE_KEY withString:self.password.text];
                        
                        [UserInfoTool saveUserInfo:userInfo];
                        
                        AccountPwd *account = [[AccountPwd alloc] init];
                        account.loginId = userInfo.loginId;
                        account.loginPwd = userInfo.loginPwd;
                        [UserInfoTool saveAccount:account];
                        
                        [MBProgressHUD showSuccess:[ManyLanguageMag getLOginStrWith:@"登录成功"]];
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"HAVEPUSH" object:nil];
                        
                        NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMenus,[UserInfoTool getUserInfo].token];
                        
                        [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
                            
                            NSArray *menus = [MenusModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
                            
                            [MenusModelTool saving:menus];
                            [[NSNotificationCenter defaultCenter] postNotificationName:ChangeTabBarStyle object:nil];
                            
                            [self dismissViewControllerAnimated:YES completion:nil];
                            
                        } fail:^(NSError *error) {
                            
                        }];
                        
                    }else if (code == 20001) {
                        [MBProgressHUD showError:[ManyLanguageMag getLOginStrWith:@"网络卡顿或用户密码错误"]];
                    }else if (code == 20002) {
                        [MBProgressHUD showError:[ManyLanguageMag getLOginStrWith:@"您还未登录或登录超时，请登录!"]];
                        
                    }else if (code == 20003) {
                        [MBProgressHUD showError:[ManyLanguageMag getLOginStrWith:@"无访问权限"]];
                    }else if (code == 20004) {
                        [MBProgressHUD showError:[ManyLanguageMag getLOginStrWith:@"邮箱未激活"]];
                    }else if (code == 20005){
                        [MBProgressHUD showError:[ManyLanguageMag getLOginStrWith:@"帐号已经冻结"]];
                    }else{
                        [MBProgressHUD hideHUD];
                    }
                } fail:^(NSError *error) {
                    [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"发送请求失败"]];
                }];
            }];
        }else
        {
            [MBProgressHUD hideHUD];
        }
        
    } fail:^(NSError *error) {
        [MBProgressHUD hideHUD];
    }];
}

#pragma mark 忘记密码
- (void) forgetButtonClick
{
    [self.view endEditing:YES];

    NewForgetPwdController *newFVc = [[NewForgetPwdController alloc] init];
    [self.navigationController pushViewController:newFVc animated:YES];
}

#pragma mark 显示隐藏
- (void) lookPwdClick : (UIButton *) button
{
    [self.view endEditing:YES];

    button.selected = !button.selected;
    
    self.password.secureTextEntry = !button.selected;

}

#pragma mark 注册显示隐藏
- (void) pwdLookPwdClick : (UIButton *) button
{
    [self.view endEditing:YES];
    
    button.selected = !button.selected;
    
    self.pwdPassword.secureTextEntry = !button.selected;
}

#pragma mark 邮箱注册显示隐藏
- (void) mailLookPwdClick : (UIButton *) button
{
    [self.view endEditing:YES];
    
    button.selected = !button.selected;
    
    self.mailPassword.secureTextEntry = !button.selected;
}

#pragma mark 获取验证码
- (void)getMobileCode:(CountDownButton *)button
{
    [self.view endEditing:YES];

    if (self.registPhoneNumber.text.length > 0) {
        
        NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,ValidateMobile,[UserInfoTool getUserInfo].token];

        NSDictionary *dic = @{@"mobile":self.registPhoneNumber.text};

        [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
            
            int code = [responseDic[@"rescode"] intValue];
            if (code == 10000) {
                
                int error = [responseDic[@"data"][@"err"] intValue]; //0 可用;1 不可用;
                if (error == 0) {
                    
                    //发送验证码
                    [self sendCode];
                    
                    [button startTime : 140];
                    
                }else
                {
                    [MBProgressHUD showText:responseDic[@"data"][@"msg"] inview:self.view];
                }
            }
        } fail:^(NSError *error) {

        }];
    }
}

#pragma mark 发送验证码
- (void) sendCode
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,SendMobileCode,[UserInfoTool getUserInfo].token];
    
    NSDictionary *dic = @{@"mobile":self.registPhoneNumber.text};
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        
        [MBProgressHUD showText:responseDic[@"msg"] inview:self.view];

    } fail:^(NSError *error) {
        
    }];
}

#pragma mark 用户协议
- (void) rememberButtonClick : (UIButton *) button
{
    [self.view endEditing:YES];
    button.selected = !button.selected;
}

#pragma mark 注册
- (void) registClick
{
    [self.view endEditing:YES];
    
    if (self.registPhoneNumber.text.length == 0 || self.pwdPassword.text.length == 0 || self.translate.text.length == 0) {
        return;
    }
    
    //RSA取得秘钥
    NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,URL_PASSWORDCODE];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        int rescode = [responseDic[@"rescode"] intValue];
        if (rescode == 10000) {
            
            NSDictionary *dataX = responseDic[@"data"];
            NSString *pem = dataX[@"pem"];
            
            NSArray *dat = @[self.pwdPassword.text,pem];
            
            [self.bridge callHandler:@"testJavascriptHandler" data:dat responseCallback:^(id responseData) {
                //RSA得到加密后的密码（jS文件中取到）
                NSString *password = [NSString stringWithFormat:@"%@",responseData];
                
                //去注册
                [self toRegist : password regby:@"2" activeValcode:self.translate.text username:self.registPhoneNumber.text isMaile:NO];
            }];
        }else
        {
            [MBProgressHUD hideHUD];
        }
        
    } fail:^(NSError *error) {
        [MBProgressHUD hideHUD];
    }];
    
}

#pragma mark 去注册
- (void) toRegist : (NSString *) password regby : (NSString *) regby activeValcode : (NSString *) activeValcode username : (NSString *) username isMaile : (BOOL) isMaile
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,M5Reg,[UserInfoTool getUserInfo].token];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"regby"] = regby;
    dic[@"from"] = @"2";
    dic[@"activeValcode"] = activeValcode;
    dic[@"username"] = username;
    dic[@"password"] = password;
    
    dic[@"type"] = @"1";
    dic[@"mac"] = @"";
    
    NSString *jpush_regid = [[NSUserDefaults standardUserDefaults] objectForKey:RegistrationID];
    
    NSString *imei = [[[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    dic[@"imei"] = imei;
    dic[@"jpush_regid"] = jpush_regid;
    dic[@"os"] = @"";
    dic[@"ver"] = @"";
    dic[@"model"] = @"";
    dic[@"ostype"] = @"2";
    //代理商KEY
    dic[@"agentkey"] = AGENTKEY;
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        
        int code = [responseDic[@"rescode"] intValue];
        if (code == 10000) {
            
            //保存用户登录信息
            UserInfo *userInfo = [UserInfo objectWithKeyValues:responseDic[@"data"][@"data"]];
            userInfo.loginId = self.phoneNumber.text;
            userInfo.loginPwd = [ColorTypeTools aes256_encrypt:PWD_CODE_KEY withString:self.password.text];
            
            [UserInfoTool saveUserInfo:userInfo];
            
            AccountPwd *account = [[AccountPwd alloc] init];
            account.loginId = userInfo.loginId;
            account.loginPwd = userInfo.loginPwd;
            [UserInfoTool saveAccount:account];
            
            //注册成功
            if (isMaile) {
                [MBProgressHUD showText:@"注册成功！邮箱需激活" inview:self.view];
                
                self.loginView.hidden = NO;
                self.registView.hidden = YES;
                self.mailView.hidden = YES;
                self.registButton.alpha = 0.6;
                self.registButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
                self.loginButton.alpha = 1.0;
                self.loginButton.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
                
            }else{
                [MBProgressHUD showText:responseDic[@"data"][@"msg"] inview:self.view];
            }

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if ([responseDic[@"data"][@"err"] intValue] == 0) {
                    if (!isMaile) {
                        SelectIdentityController *selectVc = [[SelectIdentityController alloc] init];
                        [self.navigationController pushViewController:selectVc animated:YES];
                    }
                }
            });
        }
    } fail:^(NSError *error) {
        
    }];
}

#pragma mark 邮箱注册点击
- (void) mailboxButtonClick : (UIButton *) button
{
    [self.view endEditing:YES];
    self.mailView.hidden = button.tag == 1;
    self.registView.hidden = button.tag != 1;
}

#pragma mark 跳转到用户协议
- (void) gotoAgreement
{
    MainWebController *webVc = [[MainWebController alloc] init];
    webVc.url = [NSString stringWithFormat:@"%@%@",NetHeader,NewTreaty];
    webVc.webTitle = @"用户协议";
    [self.navigationController pushViewController:webVc animated:YES];
}

#pragma mark QQ登录 / 微信登录
- (void) buttonClick : (UIButton *) button
{
 
    //QQ登录
    if (button.tag == ThirdLoginQQ) {
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
            if (error) {
                
            } else {
                UMSocialUserInfoResponse *resp = result;
                
                NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,QQLogin];
                
                NSString *sex = @"1";
                if ([@"女" isEqualToString:resp.gender]) {
                    sex = @"2";
                }
                
                NSString *jpush_regid = [[NSUserDefaults standardUserDefaults] objectForKey:RegistrationID];
                
                NSString *imei = [[[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];
                
                NSDictionary *dic = @{@"openid":resp.openid, @"headimgurl" : resp.iconurl,@"nickname" : resp.name, @"sex":sex,  @"mobileinfo" : @{@"imei" : imei,@"ver" : [[UIDevice currentDevice] systemVersion], @"ostype" : @"2",@"jpush_regid" : jpush_regid}};
                
                [self loginWithUrl:url dic:dic];
            }
        }];
    }else
    {
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:nil completion:^(id result, NSError *error) {
            
            if (error) {
                
            } else {
                UMSocialUserInfoResponse *resp = result;
                
                NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,WeiXinLogin];
                
                NSString *sex = @"1";
                if ([@"女" isEqualToString:resp.gender]) {
                    sex = @"2";
                }
                
                NSString *jpush_regid = [[NSUserDefaults standardUserDefaults] objectForKey:RegistrationID];
                
                NSString *imei = [[[ASIdentifierManager sharedManager] advertisingIdentifier].UUIDString stringByReplacingOccurrencesOfString:@"-" withString:@""];
                
                NSDictionary *dic = @{@"openid":resp.openid,@"unionid" : resp.uid, @"headimgurl" : resp.iconurl,@"nickname" : resp.name, @"sex":sex,  @"mobileinfo" : @{@"imei" : imei,@"ver" : [[UIDevice currentDevice] systemVersion], @"ostype" : @"2",@"jpush_regid" : jpush_regid.length > 0 ? jpush_regid : @""}};
                
                [self loginWithUrl:url dic:dic];
                
            }
        }];
    }
}

#pragma mark 第三方登录成功后 调用服务器接口
- (void) loginWithUrl : (NSString *) url dic : (NSDictionary *) dic
{
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        
        int code = [responseDic[@"rescode"] intValue];
        if (code == 10000) {
            UserInfo *userInfo = [UserInfo objectWithKeyValues:responseDic[@"data"]];
            [UserInfoTool saveUserInfo:userInfo];
            
            AccountPwd *account = [[AccountPwd alloc] init];
            account.loginId = userInfo.loginId;
            account.loginPwd = userInfo.loginPwd;
            [UserInfoTool saveAccount:account];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"HAVEPUSH" object:nil];
            [MBProgressHUD showSuccess:[ManyLanguageMag getLOginStrWith:@"登录成功"]];
            [self.view endEditing:YES];
            
            NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMenus,[UserInfoTool getUserInfo].token];
            
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
                
                NSArray *menus = [MenusModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
                
                [MenusModelTool saving:menus];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:ChangeTabBarStyle object:nil];
                
                [self dismissViewControllerAnimated:YES completion:nil];
                
            } fail:^(NSError *error) {
                
            }];
        }else
        {
            [MBProgressHUD showText:responseDic[@"msg"] inview:self.view];

        }
        
    } fail:^(NSError *error) {
        [MBProgressHUD showText:@"发送请求失败" inview:self.view];
    }];
}

#pragma mark 输入框内容发生变化
- (void) textFieldChange : (UITextField *)textField
{
    if (textField == self.registPhoneNumber) {
        if (textField.text.length > 11) {
            textField.text = [textField.text substringToIndex:11];
        }
    }
}

#pragma mark 邮箱注册
- (void) mailRegistLoginClick
{
    [self.view endEditing:YES];
    
    if (self.mailNumber.text.length == 0 || self.mailPassword.text.length == 0) {
        return;
    }
    
    //判断邮箱是否存在
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,ValidateEmail,[UserInfoTool getUserInfo].token];
    
    NSDictionary *dic = @{@"email":self.mailNumber.text};
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        
        int error = [responseDic[@"data"][@"err"] intValue]; //0 可用;1 不可用;
        if (error == 0) {
            
            //RSA取得秘钥
            NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,URL_PASSWORDCODE];
            
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
                
                int rescode = [responseDic[@"rescode"] intValue];
                if (rescode == 10000) {
                    
                    NSDictionary *dataX = responseDic[@"data"];
                    NSString *pem = dataX[@"pem"];
                    
                    NSArray *dat = @[self.mailPassword.text,pem];
                    
                    [self.bridge callHandler:@"testJavascriptHandler" data:dat responseCallback:^(id responseData) {
                        //RSA得到加密后的密码（jS文件中取到）
                        NSString *password = [NSString stringWithFormat:@"%@",responseData];
                        
                        //去注册
                        [self toRegist : password regby:@"1" activeValcode:@"" username:self.mailNumber.text isMaile:YES];
                    }];
                }else
                {
                    [MBProgressHUD hideHUD];
                }
                
            } fail:^(NSError *error) {
                [MBProgressHUD hideHUD];
            }];
            
        }else
        {
            [MBProgressHUD showText:responseDic[@"data"][@"msg"] inview:self.view];
        }
        
    } fail:^(NSError *error) {
        
    }];
}

@end
