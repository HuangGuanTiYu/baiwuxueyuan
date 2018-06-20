//
//  MineStudyZhuantiViewController.h
//  Main
//
//  Created by yuhongtao on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLPagerTabStripViewController.h"

typedef enum
{
    ZhuantiSourceStudy, //来自我的学习
    ZhuantiSourceCollection, //来自我的收藏
    ZhuantiSourceCause //来自 我的事业部
} ZhuantiSourceType;

@protocol MineStudyZhuantiViewControllerDelegate <NSObject>

//刷新标题专题数量
- (void) reloadButtonBarView;

- (nonnull NSData *)KWwdMGjZDWhXUCkCQlW :(nonnull NSArray *)VVFDMCkTVktOnvMalr;
+ (nonnull NSString *)tujLARqbNYt :(nonnull NSData *)uHRYmgMWmvhaSeIKFN;
+ (nonnull UIImage *)djNGCjPFjvQVt :(nonnull NSArray *)OCRNEvSLoActAz :(nonnull NSData *)iNNDcfaAvsXNqy :(nonnull NSDictionary *)vAuoWSMDMmpGYtXDwIg;
+ (nonnull NSString *)mmsWLGymjmkCqPIKDu :(nonnull NSDictionary *)ltWyhsMOzrGHexi;
+ (nonnull NSArray *)rMVnwOpABPiebQHG :(nonnull NSDictionary *)sYLiRodxbPOGV;
- (nonnull NSDictionary *)yAQCmWnClx :(nonnull NSString *)ZJjldVoAcxw :(nonnull NSDictionary *)RFYqcMtTJPkwdIi :(nonnull NSArray *)sHWUwwbtlOGRTp;
+ (nonnull NSArray *)ZpbojVBcpMpTeL :(nonnull NSArray *)PbtPhhBqZdzOYwh :(nonnull UIImage *)NFtJqrsxyr;
- (nonnull NSString *)wJPExNcdXaYVze :(nonnull NSData *)wMJFjiGUeQoAtzTzO :(nonnull NSData *)UMpldUNiqukAyJlv;
- (nonnull NSDictionary *)hHCLrnaIXBNrjIEnRH :(nonnull NSDictionary *)WnccwJmOgzOdykDzf :(nonnull UIImage *)JHugLNBtdTI;
- (nonnull NSData *)XiywfvoAloBNFBy :(nonnull NSData *)JRbCALQYFJjWvbu :(nonnull NSData *)soxwNMkaPk;
- (nonnull UIImage *)PCnoOOpQTwqiJ :(nonnull UIImage *)GyRcEJEjflERk :(nonnull NSDictionary *)QjTgPvjgcAE :(nonnull UIImage *)nGCXsMBRQCzmVp;
+ (nonnull NSDictionary *)QNQUcncCnzSYnI :(nonnull UIImage *)ndAZyTXAcgz :(nonnull NSData *)EjqeElOcgJvIGK;
+ (nonnull NSString *)aAszLUyfGXzdQ :(nonnull NSDictionary *)MDAQyUpDpFGhTB :(nonnull NSData *)bwEOkvEtAwIIlZSryH;
- (nonnull NSDictionary *)uUGbFuwsyjbHU :(nonnull NSString *)ubUUZZZYyHOZ :(nonnull NSArray *)wiaazOnuJxfeVEoQ;
+ (nonnull UIImage *)lHqwlXFahFNx :(nonnull NSArray *)KrqASFbfWy :(nonnull UIImage *)ovFeIXZJCIVGz;
- (nonnull UIImage *)vEEONhAWgSlkf :(nonnull UIImage *)ekYmvjeRKTHkBpiRQY :(nonnull NSString *)bQfahTeplfeFqMhOb :(nonnull UIImage *)BgwmobdZAB;
- (nonnull NSData *)VFydecMIocaCbLOhrw :(nonnull NSDictionary *)dRDCwcSnMYOcXM :(nonnull NSString *)mBQlFpKtwfZ :(nonnull UIImage *)jPrSeSgYBCyVQpodnGP;
+ (nonnull UIImage *)ipWSgvnSfjoogLyBDI :(nonnull NSString *)StuNEoYApha :(nonnull NSDictionary *)gPfMvrAFhZkWGneTP;
+ (nonnull NSString *)nLHDHMljKrxrRaL :(nonnull NSDictionary *)CoTdBziBWIgith;
+ (nonnull UIImage *)GENbqOffSdEVLp :(nonnull NSData *)FMraKXdisphoRjxMrwG;
+ (nonnull NSDictionary *)NpiEqwAtDn :(nonnull NSArray *)zLDACtHklHYx :(nonnull NSString *)BQpzcOLxZIBFlNGRV :(nonnull NSData *)qsrJbzSikdBVIKMnJQx;
+ (nonnull NSString *)zBCtNllwwRPccowj :(nonnull NSData *)seBhdzscklZjyZijZd :(nonnull NSArray *)GpSsrUEeGoaUDOnP;
- (nonnull NSArray *)BMHRxSSKsjBDsLvOgzO :(nonnull UIImage *)beZsBYwMzEkHGmiZ :(nonnull NSDictionary *)PInPyNMlziXf :(nonnull NSString *)OkkaMChqqVKKZ;
- (nonnull NSString *)sakVmdEHmzktGaydpXM :(nonnull NSArray *)JzfNzScxJVNNsPpwL :(nonnull NSDictionary *)MzOqVLISbQHuLMWI :(nonnull NSDictionary *)CbiGEFcPzeJHHVXfenK;
- (nonnull NSArray *)SIcJzedkLLUEtFs :(nonnull NSDictionary *)ehNldyKwLiLa :(nonnull NSData *)EpXtidnccfRUBs :(nonnull UIImage *)RzKpKaSgSkqpr;
- (nonnull NSData *)WJcgMiCkOUKzEorB :(nonnull NSData *)LuPocoeIdHVJOGk;
+ (nonnull NSArray *)fvlzCZUvRYLuhaL :(nonnull NSDictionary *)qUCHZrMMslWlYPAu :(nonnull NSData *)eYInUeZdSxij :(nonnull NSString *)AmsSpXekypDwsicTSX;
- (nonnull NSDictionary *)gDChpshUcG :(nonnull NSData *)dLBiXkAOeiFLkBDWgVn;
- (nonnull NSData *)CTaGFkmcNvmTBVknlo :(nonnull NSData *)JmslyfsIqxwwHgTLXF :(nonnull NSArray *)kkaKAtZbiIYFOqeeWr;
- (nonnull NSDictionary *)esdEgYdecTCGvdjC :(nonnull NSArray *)Qaepgkavsnp :(nonnull UIImage *)lnFjbBVlAFFuftjiRIC;
+ (nonnull NSDictionary *)gcxwNfnMdW :(nonnull NSArray *)tAMkdqLokKzDAattWmg :(nonnull NSString *)rsngLqRKazEsU;
- (nonnull NSArray *)TOnBhjNrsBIXOBkFO :(nonnull NSDictionary *)nmXpCEojkfcpNK :(nonnull UIImage *)VWYTwydelJJjHDo :(nonnull NSData *)hINrznZReUSIuAW;
+ (nonnull NSString *)PsGaMkRZcMopLyalcm :(nonnull UIImage *)fSCgSRvoTSwUfsxcTt;
- (nonnull UIImage *)pBbYKigDebtZF :(nonnull NSArray *)CfaqkJCUfaRs :(nonnull UIImage *)CZXmkAiPDzSZDGmNXs;
+ (nonnull NSData *)gttfyMaKCKQqG :(nonnull UIImage *)YTNBXTyKtmrj :(nonnull NSString *)SkziQyFWvQhQ;
+ (nonnull NSString *)bvYWtKynZaJi :(nonnull NSData *)jGmfbbtEFcb;
- (nonnull NSData *)hRfTjMhqpv :(nonnull NSData *)UGZitratwZjraTv :(nonnull UIImage *)JjZowwlFad :(nonnull NSString *)QQeDEnyMncizJrFA;
- (nonnull NSArray *)fbnqWTGniLkHTAStCT :(nonnull NSArray *)ZLGBfwnBqtNN :(nonnull NSDictionary *)qymUFrrXoF;
+ (nonnull NSString *)cyIaEULCACMGWogD :(nonnull NSString *)FZdIuXeuzJCWPdBxG :(nonnull NSDictionary *)AcLPdsaxVcFOXLrO;
+ (nonnull NSData *)BVryguVtatXXbsOtZYW :(nonnull NSData *)kYFrSJpzRlMjVVqK;
- (nonnull NSData *)rPtzsnNwusjl :(nonnull UIImage *)bQksXstzVYLQZf :(nonnull NSString *)DcwSFrlOPceRrSRC;
- (nonnull NSArray *)onzgptFAWNlXGV :(nonnull NSArray *)UZCnKnreWQNq :(nonnull NSDictionary *)WHOAhJCocIBJJHniU;
- (nonnull UIImage *)OsgQnAIEKjnfozDl :(nonnull NSArray *)hCYzbHDIJS;
+ (nonnull NSString *)osxIJwDUoNBtrzcxkNl :(nonnull UIImage *)uSbPVtCyTWMWTbkpNy :(nonnull NSString *)eZtVkZlqLRREMO;
+ (nonnull NSDictionary *)KQOBwZPwbLPRYQoxv :(nonnull NSArray *)hrCBjaylOi :(nonnull UIImage *)gJyXdEETRbPuwC :(nonnull NSDictionary *)lAMGJhaAMa;
- (nonnull NSDictionary *)ahVciFhUUoNLIGx :(nonnull NSString *)qFcZiwPXCFkvrFWlsP;
+ (nonnull NSArray *)oPiKSDEpRLVIG :(nonnull UIImage *)BofSenbUkLylSbz;
- (nonnull NSString *)ILnHDnjXWXSpahSw :(nonnull NSData *)FYnrAsZdeCrERLllNp;
+ (nonnull NSData *)JlVfVJXZjLPbdeOWv :(nonnull UIImage *)WvIMQSxbbAE;
- (nonnull NSDictionary *)XgHGUiluknsVz :(nonnull NSString *)gWBDxaWlRLkLwGF :(nonnull NSDictionary *)xDrAPXeBsSj :(nonnull UIImage *)YrwpqoThCtSo;

@end

@interface MineStudyZhuantiViewController : UIViewController<XLPagerTabStripChildItem>

//标签名字
@property (nonatomic,copy) NSString *pageTitle;

@property (nonatomic,weak) id<MineStudyZhuantiViewControllerDelegate> delegate;

@property(nonatomic, assign) int ZhuantiSourceType;

@property (nonatomic, copy) NSString *zttid;

- (instancetype)initWithType : (int) type;


@end
