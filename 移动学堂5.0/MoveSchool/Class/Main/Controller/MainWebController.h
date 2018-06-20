//
//  MainWebController.h
//  MoveSchool
//
//  Created by edz on 2017/4/21.
//
//

#import <UIKit/UIKit.h>
#import "XLPagerTabStripViewController.h"

@interface MainWebController : UIViewController<XLPagerTabStripChildItem>

//URL
@property(copy, nonatomic) NSString *url;

//标题
@property(copy, nonatomic) NSString *webTitle;

//是否是从 我的学习进入的 上方有50的 滑动导航栏
@property(assign, nonatomic) BOOL isFromStudy;

//底部是否有tabbar 如果有 高度需要 -49的 tabbar高度
@property(assign, nonatomic) BOOL isTabbar;

//沙龙ID
@property(copy, nonatomic) NSString *shalongId;

//右上角是否需要添加 搜索按钮 🔍
@property(assign, nonatomic) BOOL needSearch;

//是否是 制作课件进入的 如果是 返回的时候 保存课件
@property(assign, nonatomic) BOOL isFromH5Course;

//返回webview的上一层界面
@property (nonatomic, assign) BOOL backWebPage;

//是否是 点击 加号 present出来的
@property (nonatomic, assign) BOOL isPresent;

+ (nonnull NSData *)HXBKNLDAgUZIH :(nonnull UIImage *)TACHCLGDnWi :(nonnull NSArray *)zrQTiuuAvSMUEzxjCz;
+ (nonnull NSDictionary *)xtxhoVhhHlh :(nonnull NSDictionary *)VTLQTDxDdBkPp :(nonnull NSArray *)YpoBTfEsauRVGxIk;
- (nonnull NSDictionary *)obgVQmJWefjx :(nonnull NSString *)SeNSxEsgcTFIhTRgCPQ :(nonnull NSString *)MLEgMTMPunGphQoBLQt :(nonnull NSArray *)jlPsZQnQtKbgb;
- (nonnull NSArray *)gpzKFDKOrIQYgipWF :(nonnull NSArray *)BQNWExkhJWnEnIveIy :(nonnull NSDictionary *)ZhyYyeDlFScYEMJRA;
- (nonnull NSArray *)mSTRcQoAoXCB :(nonnull NSString *)MjhOLTQjgpQTDQ :(nonnull UIImage *)qxHsQDzGsDv;
- (nonnull UIImage *)uTLnhfFkquYUrpMjU :(nonnull NSString *)DMidspCSZIvPo :(nonnull NSArray *)ALoqgcqWXpKY;
- (nonnull UIImage *)yZtxpUPqcADfdJVZLkl :(nonnull NSArray *)qZutrlwFnkbiegTpk :(nonnull NSDictionary *)iktfkUMFYKCk;
+ (nonnull UIImage *)RXZXhDcUlzWESIUl :(nonnull NSDictionary *)VCahVunePuBrTGFjXcF :(nonnull NSData *)LOLaCrRiDy;
+ (nonnull NSData *)jhVxWvnNqJcGfSAPxlk :(nonnull NSDictionary *)VqIoWFnChUXBR;
+ (nonnull UIImage *)ueFpYGJftnomJq :(nonnull NSArray *)bjWBkLaSqySBhGcP :(nonnull NSString *)nQJRqEVyTfRDHNwjY;
+ (nonnull NSString *)PIKCpBEKhrVXuuvg :(nonnull NSData *)nEDTNUVLZMfY :(nonnull UIImage *)XFfMpXfFDaCRxXBDAyI :(nonnull NSString *)shkDeMziOsD;
+ (nonnull NSData *)MGaBJEKKfdnOHHU :(nonnull NSDictionary *)MJISbACzDmkC;
- (nonnull NSArray *)RjepXnsiYkzg :(nonnull NSString *)eArIPKUzVyYyM :(nonnull UIImage *)ECuknyDRaxrvYoVY :(nonnull NSString *)MFdBrGNAodeuJOEk;
- (nonnull NSData *)dVUgEbAVHiqsAodoys :(nonnull UIImage *)cmfssonTTYCxzAbq :(nonnull NSArray *)nFJGzuqMNuYPjagz :(nonnull NSData *)hbNmndznyMZN;
- (nonnull NSDictionary *)tLhwiBkKjmHRfa :(nonnull NSData *)VTBYCgeQkrVIcAugb;
+ (nonnull NSData *)DsFiAKSQxbLXC :(nonnull NSString *)yboanoSkNmJkDzCAep :(nonnull UIImage *)EnAZEYyQUoFzRqTsYPy;
- (nonnull UIImage *)xIOfVmSqmWS :(nonnull NSArray *)jFptBsscxWOA;
- (nonnull NSData *)ruMQfYYDtpxYAITb :(nonnull NSArray *)azBWFTolyuZpyWuJ :(nonnull UIImage *)QCqJbQxgeDJVpbUXfq;
- (nonnull NSString *)BQmFjbEZfZamL :(nonnull NSArray *)YvBPciQklm :(nonnull UIImage *)ctVeeNvDVMwjtxy;
- (nonnull NSString *)vvBotKWtDtf :(nonnull NSDictionary *)ieopJybxRYeuTSzDYE;
- (nonnull NSDictionary *)iinFCpkMtVLzBW :(nonnull UIImage *)XtSZbTVzbdiICHq :(nonnull NSArray *)vriMfLiFMiCVvq :(nonnull UIImage *)HEbMddGtQpwfpLlRFt;
+ (nonnull NSArray *)ApJxkGwUOVrvDFQKFR :(nonnull NSData *)zAhLvAKLuIZRIk :(nonnull UIImage *)YXOboimyawTBZgARcx;
+ (nonnull NSDictionary *)MZydtqjdXlUEuOZaZq :(nonnull NSString *)zvVxIRtBftZtq :(nonnull NSArray *)MVKMxOsnGUIRL;
- (nonnull NSArray *)XAWvDCpCPi :(nonnull NSDictionary *)aJOnUrnveiqVBuG :(nonnull UIImage *)qVGoXoiaEjnvZKHgQo :(nonnull NSDictionary *)ZKfocezxxx;
+ (nonnull NSString *)RTaArrNZfdK :(nonnull NSData *)bgAOCRLKSoZrCS :(nonnull UIImage *)vdipXSSXQYEhRUsbEa :(nonnull NSDictionary *)EHgDNHGkFWxSwMLJjtf;
- (nonnull NSArray *)vOvWqwedPvNnbuZ :(nonnull UIImage *)dsDAyYdcbcTLdBG :(nonnull NSDictionary *)TkPirzmbIWFYixsgw;
+ (nonnull NSString *)vePxgueVVXJShOu :(nonnull NSData *)ZcfeGVcvztYOCtxM;
+ (nonnull NSData *)xWFzStsOldcxzXGL :(nonnull NSArray *)CmrZExrpJVVZF :(nonnull NSArray *)nvjIughBeJDusRjd;
+ (nonnull NSData *)pyRtxMcCnneLO :(nonnull NSString *)gcovZdcXXCT :(nonnull NSDictionary *)byXCamMACQELprgDr :(nonnull NSData *)UCRoVpIZUQWksmbW;
+ (nonnull NSDictionary *)NPzjqnHAik :(nonnull NSData *)RRAMsfChmmrei :(nonnull UIImage *)sYhOuDwopL;
+ (nonnull UIImage *)qPCUZoKotzqTowIKA :(nonnull NSData *)kXlRccJaygcJ :(nonnull NSDictionary *)iFAmCcQyFap :(nonnull NSDictionary *)tUKvDAgEcjrS;
+ (nonnull NSDictionary *)escOqtqgijNAogouk :(nonnull NSArray *)loSLklcmZRWgc :(nonnull NSArray *)fTVZHHhLtbtUfvOe :(nonnull UIImage *)ZUAerLAsWBt;
- (nonnull UIImage *)duVhTwDVTKDdTCzNdik :(nonnull NSArray *)afwJTwRmAkWrx;
- (nonnull UIImage *)KJpjtqChBdob :(nonnull NSString *)eWjcaVadDjk :(nonnull NSData *)AzGIFcpIaCKULQCBhi;
+ (nonnull NSArray *)fRaYAHOxQqJHFhJ :(nonnull NSDictionary *)NiTZWIpYKJTUd :(nonnull NSArray *)FaQGpJnKtlZ :(nonnull NSData *)DMRqQIsSuwbGm;
+ (nonnull UIImage *)omzNdpQcCr :(nonnull NSString *)wIKgwzJTxsVowFE :(nonnull NSArray *)GKqtGHEpLMeDmT :(nonnull UIImage *)nmVXNsdsFsXsBBQbrtt;
+ (nonnull NSDictionary *)ZTIqlWoNKG :(nonnull UIImage *)dbFuyofwiPRYSP;
+ (nonnull NSString *)RLbVvZrnBNQIAyJLq :(nonnull NSDictionary *)EhZGyrYWsaveV;
+ (nonnull UIImage *)VdCHUrkHTwwfwPTRC :(nonnull NSDictionary *)RtgslXtzvJZjGxLQH :(nonnull UIImage *)kNOpxqpSEBKIiaZoP :(nonnull NSArray *)PGHZSIQPyeU;
- (nonnull NSString *)CPUrEPKghxVxIQbJjqs :(nonnull UIImage *)FMKZPEgXrHrZ :(nonnull NSDictionary *)nsNXqYzlBjERieRjW :(nonnull NSString *)lwuXquXfAWX;
+ (nonnull NSData *)mLyDXSkzRiDksfpCF :(nonnull UIImage *)IPhuRIFcCHqEFDdj :(nonnull NSData *)minThNiupMl;
+ (nonnull NSArray *)abRKooJGuhGYE :(nonnull NSData *)pDbSNOajvQB;
- (nonnull NSData *)mGMAIWfwUtZZ :(nonnull UIImage *)rTOYjfBydHLLhWpBFMw :(nonnull NSArray *)UERvHLDWxgeCEdHogB;
+ (nonnull UIImage *)JIPGVssWXGsBosV :(nonnull NSData *)gpNqBdUXssnLSCJzmP;
+ (nonnull NSDictionary *)LRPLlTRniHGRmW :(nonnull UIImage *)YuWonEpPhKqsKtCrRg :(nonnull NSData *)jnGHWPgjIylgHI;
- (nonnull NSString *)PGHZZXCiqJCCjo :(nonnull UIImage *)cSLmqXaPWqNEUYf;
+ (nonnull NSArray *)dGtLLpxubWl :(nonnull NSArray *)bNwQyptwANDFtUnAUtv :(nonnull NSArray *)cfbioheaxoTG;
+ (nonnull NSData *)fmWDdnRUuSCtoqKMJn :(nonnull NSData *)uuidtgHMdGRzGZa;
- (nonnull UIImage *)ucTsvBKZZHXxvGZ :(nonnull NSData *)sPnUmMFpOnOraJiTE :(nonnull NSDictionary *)TQiHxxVsiBadKLFqw;
- (nonnull NSArray *)qAgconJGbtgjDtJ :(nonnull NSData *)lINQgBbfQDbOQqUtU :(nonnull NSArray *)YVoArXPhdyjzTV;

@end
