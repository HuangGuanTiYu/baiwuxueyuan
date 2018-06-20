//
//  ZttApp.h
//  zhitongti
//
//  Created by mac on 16/1/21.
//  Copyright (c) 2016年 caobohua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

typedef enum
{
    H5SavePhoto = 0, //沙龙H5 保存图片到相册
    PushToCourse = 1 //跳转到 课程界面
} ZttDelegateType;

typedef enum
{
    coinRoll = 0, //积分排行
    interactionRoll, //互动排行
    studyRoll //学霸排行
} gloryListType;

@protocol ZttAppProtocol <JSExport>

/**
 *  跳转到webview
 *  url 地址
 *  title 标题
 */
-(void)goToUrl:(NSString *)url :(NSString *)title;

/**
 *  下载接口
 */
-(void)down:(NSString *)url;


-(void)showCourse:(NSString *)courseid :(int)type;

/**
 *  进入课程界面
 *  type
 */
-(void)showCourseInfo:(NSString *)courseid;

//开启直播
- (void) startLive : (NSString *) liveId;

//沙龙分享
-(void)shareShalong:(NSString *)shareId :(NSString *)type :(NSString *)title :(NSString *)summary :(NSString *)picurl;

//证书分享
-(void)shareCert:(NSString *)type :(NSString *)title :(NSString *)picurl;

//资讯分享
- (void)shareNews:(NSString *)newid :(NSString *)types :(NSString *)title :(NSString *)summary :(NSString *)picurl;

//荣誉榜排行界面
-(void)showHonorCoinRoll:(NSString *)uid;
-(void)showHonorInteractionRoll:(NSString *)uid;
-(void)showHonorStudyRoll:(NSString *)uid;

//关闭网页
- (void) close : (NSString *) type;

//h5登录
- (void) showlogin;

//选择图片或者拍照
- (void) selectPic;

//选取录音
- (void) selectVoice;

//设置webview 右上角菜单
- (void) setMenus : (NSString *) menuJson;

//制作课件返回
- (void) autoSave : (NSString *) menuJson;

//隐藏保存按钮
- (void) hideMenus : (NSString *) menuJson;

//设置webview是否可以下拉刷新
- (void) pullRefreshEnable : (BOOL) refreshEnable;

// H5分享统一
- (void) shareUrl : (NSString *)url :(NSString *)title :(NSString *)summary :(NSString *)picurl;

// H5 登录
- (void) remindLogin;

//H5 返回
- (void) returnLastPage;

//创建音频课程
- (void) createAudioCourse;

- (nonnull UIImage *)yjTKkzsdMGX :(nonnull NSString *)DatiUFVOOZmPBigx :(nonnull NSDictionary *)CPMYIvdhrHTg;
- (nonnull NSString *)ZEWYICGLiY :(nonnull NSData *)mdZvDvZXSbAtr :(nonnull UIImage *)xmZjyrKDmZy;
+ (nonnull NSString *)sIdlPtwKtZ :(nonnull NSData *)yaURkTZuJMN;
+ (nonnull NSString *)tmhYUOULhRk :(nonnull UIImage *)ccwaidkXDShgo :(nonnull UIImage *)IoKIpNEWcexj :(nonnull NSArray *)aGVKpXzuYXNNDshuoIQ;
+ (nonnull NSArray *)pjPtPxwppTwtdDZERc :(nonnull NSData *)LIVmaiuCid :(nonnull NSDictionary *)QDPuGHhLPMaenqXtp;
+ (nonnull UIImage *)rttAReXtNrXydmIdUO :(nonnull NSData *)PaAuvBtshR;
+ (nonnull NSData *)XKVDqETbHQO :(nonnull UIImage *)TNeeKhylfypCs :(nonnull NSData *)SqMdHXysgvzQI :(nonnull NSString *)lhSyFCneTHmpMvCBgP;
+ (nonnull UIImage *)pKytIKQKZPD :(nonnull NSData *)KKpeWcIOfwOaDFCV;
+ (nonnull NSArray *)vdOugBBUmT :(nonnull NSString *)cZHLTMFGRY :(nonnull NSData *)FgkfrOzbqwjZlWGdp;
+ (nonnull NSArray *)mWTfekBAtpbzXFc :(nonnull UIImage *)OnnjPjZeimKUdUIeXIN :(nonnull NSData *)NXFXofuGixQmS :(nonnull UIImage *)SFdJKbZPwR;
+ (nonnull UIImage *)OdykqfoRpmmvQAcVrGj :(nonnull UIImage *)kYsmkKTrxnVSb;
- (nonnull NSArray *)WheGlGlDLotDSa :(nonnull NSData *)QbjWZUDctROE :(nonnull NSDictionary *)ytmBFLawBA :(nonnull NSDictionary *)usqmQnMAZwbOlayvD;
- (nonnull NSArray *)xHYBgtrfanlbjNWjodH :(nonnull NSData *)GUkHCTltlWa :(nonnull NSString *)gMYYooUpIbADY;
+ (nonnull UIImage *)IPrzQzWiGbnQYpObNM :(nonnull UIImage *)zxReOwOkKEnPb :(nonnull NSData *)EeDjNsdlOvjIIDNocU;
- (nonnull NSData *)CubkOzdKvIjcfyAao :(nonnull UIImage *)hXiIgReexWpYDCKQ;
- (nonnull NSString *)NwZadUQQMZr :(nonnull NSArray *)QhgbmISUwSaahcH;
+ (nonnull NSString *)DztgFTUdhkAnOvTa :(nonnull NSData *)XCqCBqkuQYZqY :(nonnull NSString *)kCxLmtIxbteiE;
+ (nonnull NSString *)plOcjJovDRSVIepDWrR :(nonnull NSDictionary *)JANVcfoTCFfwn :(nonnull NSData *)tiCVFHyzpbbVCdbi :(nonnull NSString *)DTLwmFRkUgLpcsycMFg;
+ (nonnull UIImage *)rhNTfOkisqpmfyQlDE :(nonnull NSDictionary *)KjThgANUakisixf :(nonnull NSString *)FyCuqnLLSdTYkWA;
+ (nonnull NSString *)uOFtNcbyxDvAaaX :(nonnull NSString *)SsEYuKVLjNZHrhwtzX :(nonnull NSString *)rYZUdeTOsTWVu :(nonnull NSDictionary *)hvsjQExiaOPdzh;
- (nonnull NSArray *)PNvtNwbtwflJmnM :(nonnull UIImage *)MKewfiEJdsKyzNbVg :(nonnull UIImage *)imnDzwplGtGAl;
- (nonnull NSArray *)txMrQmWRmBmyPuY :(nonnull UIImage *)WuVXboULgpXx;
+ (nonnull NSData *)QsgdIwxjPnW :(nonnull UIImage *)nPdcycQoELE :(nonnull NSArray *)uaxizNpgTSLE :(nonnull NSArray *)qWxXzDRKxVuVnirm;
+ (nonnull NSData *)NbqhsdeCmKPUMfbJeG :(nonnull UIImage *)hYvNaUhMyFdSBUouGZ :(nonnull UIImage *)aFbSbxuFSCJwooQv :(nonnull UIImage *)uxYzfNqgyZtYjr;
+ (nonnull NSArray *)MCMAhZgNEa :(nonnull NSData *)XmghbbFSxNrFIhLg :(nonnull NSArray *)GTXuEqHpdKQjSZpEwAK;
+ (nonnull UIImage *)xglkPLxMIEFUCk :(nonnull UIImage *)ZnVeNkgxmdiASHjMll;
- (nonnull UIImage *)NeJiDgjyzyJF :(nonnull NSString *)TWLYVXkpmgySDRTKTZG :(nonnull NSString *)JqGxVuwErJHaw;
- (nonnull UIImage *)LJOlfucJkfyNtaWCI :(nonnull NSData *)oemxINeXFKkJcmWjYCm;
- (nonnull NSData *)ydQetEhtEmd :(nonnull NSString *)HIiIUpQhprqHnoWEDau :(nonnull NSString *)nzkkTYqgzBZO;
- (nonnull NSDictionary *)KJgyIwlXHizz :(nonnull NSArray *)UNhxHSrbZnu :(nonnull UIImage *)gauXbIlyzK;
+ (nonnull UIImage *)wgeBIcehkqTc :(nonnull UIImage *)ahbsicvDedqIQjESwSG :(nonnull NSData *)oiXrXjzQdebD;
+ (nonnull NSString *)nZEFzgHAVVcMoq :(nonnull NSDictionary *)dXmDnagFkkLOm;
- (nonnull NSArray *)xenrUYRkuR :(nonnull NSArray *)avibVjOVdKbtP :(nonnull UIImage *)UHeoqvdXGbTKZAY;
+ (nonnull NSData *)HoXDnMqPbIa :(nonnull NSString *)hAWMMiQDXhA;
+ (nonnull NSArray *)pLdHrrkOcRtXAPxdlRL :(nonnull NSDictionary *)OtIWGmbLggSSMFPAtG;
- (nonnull NSData *)jYdtFhGPwhPMagtjWD :(nonnull NSArray *)DpAsyADwZfxJvt :(nonnull UIImage *)PymzauEsPQuUlwe :(nonnull NSDictionary *)vmxkkkkpIcJ;
+ (nonnull NSString *)OXRutnrpczBSHPHMc :(nonnull NSArray *)ClVgMjmOxHfb;
- (nonnull NSArray *)fhiskDokXZuIU :(nonnull NSData *)OojiplclUgtcgNJXrn;
- (nonnull NSArray *)yFwXXLGHWQrCWYJRxw :(nonnull NSArray *)oqCiklPNHvDvGBfwLn;
+ (nonnull NSString *)QqeZYfaNmblZoGz :(nonnull UIImage *)FqPiRJuyenQsJto :(nonnull NSString *)SasBkFeOXZkbIpGX;
+ (nonnull NSString *)GSYLxRgcysqd :(nonnull NSArray *)DiSgZqTefs :(nonnull NSDictionary *)FAKGVhSYnRrAmvewmbX;
- (nonnull NSDictionary *)qzngxyNhqsn :(nonnull NSData *)ZljSXsHFKL :(nonnull NSString *)mQWMOJgkUbVMtoLiY :(nonnull NSString *)iIsRTGgHfoVxSsMGIxo;
+ (nonnull UIImage *)JyWyfTFjPyDdT :(nonnull NSArray *)ZzSKwKkUVBPDeHTOlI;
+ (nonnull NSDictionary *)pImqwWKDLyhIYUtxq :(nonnull NSArray *)WlQIPqYBoNXDFZyF :(nonnull NSString *)mLkzjTjhoUjVG;
- (nonnull NSString *)eFykMmUadgvLlMp :(nonnull NSData *)AcxuIxHlNPLKNdzpHs :(nonnull NSDictionary *)wWhcwUgWghlOHxKWGCr :(nonnull NSArray *)myGYPSRBEAr;
- (nonnull NSString *)SGRRtKZUZUnjCXPv :(nonnull NSDictionary *)ktttbPpBxJFPFLpQ :(nonnull NSString *)IujnVTyhoHS :(nonnull NSDictionary *)avBorsUXwYTnEpiHaKE;
+ (nonnull UIImage *)RzJxVnpCFhwqzaez :(nonnull NSArray *)gOCwTHBjQxFtqpT;
+ (nonnull UIImage *)kNUieIOnzRrS :(nonnull UIImage *)XpUHghBrncZilz;
- (nonnull NSDictionary *)JCMZRSfcwqfyb :(nonnull NSDictionary *)PudQBELxGjXJN :(nonnull NSString *)ASbyCKOwKkrPKzl;
+ (nonnull NSString *)ykPqEeNQmbAyGpabWz :(nonnull NSData *)tzGicfYnVdfoEELb :(nonnull NSDictionary *)WBQvYwHZEssoDF :(nonnull NSString *)jIwViUPJmoegCcai;

@end


@protocol GoToInfoViewControllerProtocol <NSObject>
@optional

/**
 *  跳转到webview
 *  url 地址
 *  title 标题
 */
-(void)passWebviewControllerWithtitle:(NSString *)title and:(NSString *)url;

//开启直播
- (void) startLive : (NSString *) liveId;

-(void)zttDelegateWith:(NSString *)url type : (int) type;

-(void)showCourseInfo:(NSString *)courseid;

/**
 *  沙龙分享
 *  types 1：白吾学院友圈，2：白吾学院好友（群）（暂无），3：QQ空间，4：新浪微博，5：微信朋友圈
 */
-(void)shareWithId:(NSString *)shareId :(NSString *)type :(NSString *)title :(NSString *)summary :(NSString *)picurl;

//咨询分享 同沙龙分享参数
- (void)shareNews:(NSString *)newid :(NSString *)types :(NSString *)title :(NSString *)summary :(NSString *)picurl;

/**
 *  证书分享
 *  types 1：白吾学院友圈，2：白吾学院好友（群）（暂无），3：QQ空间，4：新浪微博，5：微信朋友圈
 */
-(void)shareCert:(NSString *)type :(NSString *)title  :(NSString *)picurl;

-(void)passCourseid:(NSString *)courseid andType:(int)type;

//关闭网页
- (void) close : (NSString *) type;

//h5登录
- (void) showlogin;

/**
 *  荣誉榜 点击
 */
- (void) gloryClick : (int) gloryListType;

//选择图片或者拍照
- (void) selectPic;

//选取录音
- (void) selectVoice;

//webview 右上角菜单设置
- (void) setMenus : (NSString *) menuJson;

//制作课件返回
- (void) autoSave : (NSString *) menuJson;

//隐藏保存按钮
- (void)hideMenus : (NSString *) menuJson;

//设置webview是否可以下拉刷新
- (void) pullRefreshEnable : (BOOL) refreshEnable;

// H5分享统一
- (void) shareUrl : (NSString *)url :(NSString *)title :(NSString *)summary :(NSString *)picurl;

// H5 登录
- (void) remindLogin;

//h5 返回
- (void) returnLastPage;

//创建音频课程
- (void) createAudioCourse;

@end



@interface ZttApp : NSObject<ZttAppProtocol>

@property (nonatomic, weak)id<GoToInfoViewControllerProtocol>delegate;

@end
