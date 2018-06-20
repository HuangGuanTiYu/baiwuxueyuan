//
//  AppDelegate.m
//  MoveSchool
//
//  Created by edz on 2017/4/19.
//
//

#import "AppDelegate.h"
#import "MianTabBarController.h"
#import "MainNavigationController.h"
#import "NewLoginController.h"
#import <AdSupport/ASIdentifierManager.h>
#import <UMSocialCore/UMSocialCore.h>
#import "IQKeyboardManager.h"
// 引 JPush功能所需头 件
#import "JPUSHService.h"
// iOS10注册APNs所需头 件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max 
#import <UserNotifications/UserNotifications.h>
#endif

#import "AFNetWW.h"
#import "GuideController.h"
#import "TBCityIconFont.h"
#import "MenusModel.h"
#import "MJExtension.h"
#import "MenusModelTool.h"
#import "HBTabBarView.h"
#import "IFlyMSC/IFlyMSC.h"

@interface AppDelegate ()<JPUSHRegisterDelegate>

@property (nonatomic, strong) MianTabBarController *tabBarVc;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //是否是第一次进入APP 设置在MianTabBarController 初始化之前
    NSString *firstStart = [MainUserDefaults objectForKey:Firsst_Start_App];
    
    MianTabBarController *tabBarVc = [[MianTabBarController alloc] init];
    self.tabBarVc = tabBarVc;
    self.window.rootViewController = tabBarVc;
    
    [self.window makeKeyAndVisible];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:USHARE_DEMO_APPKEY];
    
    /* 初始化极光推送  */
    [self setUpJPush : launchOptions];
    
    [self configUSharePlatforms];
    
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    
    //状态栏白色
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    /* 获取文件服务器URL */
    [self getServerUrl];
    
    //设置
    [TBCityIconFont setFontName:@"iconfont"];
    
    //获取菜单
    [self getMenus];
    
    /* 拉取服务器APP版本 */
//    [self getAppVersion];
    
    //Set APPID
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",APPID_VALUE];
    
    //Configure and initialize iflytek services.(This interface must been invoked in application:didFinishLaunchingWithOptions:)
    [IFlySpeechUtility createUtility:initString];
    
    return YES;
}

#pragma mark 获取菜单
- (void) getMenus
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMenus,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        self.menus = [MenusModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
        
        [MenusModelTool saving:self.menus];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:ChangeTabBarStyle object:nil];
        
    } fail:^(NSError *error) {
        
        
    }];
}

#pragma mark 获取服务器APP版本
- (void) getAppVersion
{

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    NSString *version=[NSString stringWithFormat:@"%@",app_Version];
    
    NSString *url = [NSString stringWithFormat:@"%@%@?appver=%@&osType=2",NetHeader,AppUpdate,version];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        NSDictionary *data = responseDic[@"data"];
        if ([data[@"isforce"] intValue] != 3) { //需要升级
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:data[@"summary"] preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"马上升级" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:data[@"apkurl"]]];
                }
            }];
            
            if ([data[@"isforce"] intValue] == 0) { //不强制
                UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"忽略" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alertController addAction:cancelAction];
            }

            [alertController addAction:okAction];
            
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
        }
    } fail:^(NSError *error) {

    }];
}

- (void)configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:wechatAppKey appSecret:wechatAppSecret redirectURL:kRedirectURI];
    
    /*设置QQ平台的appID*/
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQAppKey appSecret:nil redirectURL:kRedirectURI];
    
    /* 设置新浪的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:sinaAppKey appSecret:sinaSecret redirectURL:kRedirectURI];

}

#pragma mark 初始化极光推送
- (void) setUpJPush : (NSDictionary *)launchOptions
{
    /*  初始化APNs */
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert | JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    /*  初始化JPush */
    // isProduction 0 (默认值)表示采用的是开发证书，1 表示采用生产证书发布应
    [JPUSHService setupWithOption:launchOptions appKey:JPUSH_APPKEY
                          channel:appChannel
                 apsForProduction:NO
            advertisingIdentifier:nil];
    
    
    //获取registrationID
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
            [[NSUserDefaults standardUserDefaults] setObject:registrationID forKey:RegistrationID];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            NSLog(@"registrationID获取成功：%@",registrationID);
        }
        else{
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:RegistrationID];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSLog(@"registrationID获取失败，code：%d",resCode);
        }
    }];
    
    //自定义消息
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
}

#pragma mark 自定义消息
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary * userInfo = [notification userInfo];
    NSString *content = [userInfo valueForKey:@"content"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HAVEPUSH" object:nil];
    
    BOOL open = [MainUserDefaults boolForKey:MessageClose];
    if (!open) {
        UILocalNotification *noti = [[UILocalNotification alloc] init];
        noti.alertBody = content;
        [[UIApplication sharedApplication] scheduleLocalNotification:noti];
    }
}

// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}

#pragma mark 极光推送 注册APNs成功并上报DeviceToken
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [[UIApplication sharedApplication] setIdleTimerDisabled:NO];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
 * 弹出掉线提示框
 */
- (void) alertViewLogin
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[ManyLanguageMag getLOginStrWith:@"提示"] message:[ManyLanguageMag getLOginStrWith:@"您还未登录或登录超时，请登录!"] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:[ManyLanguageMag getLOginStrWith:@"否"] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:[ManyLanguageMag getLOginStrWith:@"是"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        {
            [UserInfoTool delegateUserInfo];
            
            MainNavigationController *mainVc = [[MainNavigationController alloc] initWithRootViewController:[[NewLoginController alloc] init]];
            
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:mainVc animated:YES completion:nil];
            
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}


#pragma mark- JPUSHRegisterDelegate
// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]
        ]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler(UNNotificationPresentationOptionAlert);
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HAVEPUSH" object:nil];

    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
        // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [JPUSHService handleRemoteNotification:userInfo];
}

#pragma mark 获取文件服务器URL
- (void) getServerUrl
{
    NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,GetServerUrl];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:nil success:^(id responseDic) {
        NSInteger code = [responseDic[@"rescode"] integerValue];
        
        if (code == 10000)
        {
            NSString *fileServerUrl = responseDic[@"data"][@"fileserverurl"];
            [MainUserDefaults setObject:fileServerUrl forKey:FileServerUrl];
            [MainUserDefaults synchronize];
        }
    } fail:^(NSError *error) {
        
    }];
}

@end
