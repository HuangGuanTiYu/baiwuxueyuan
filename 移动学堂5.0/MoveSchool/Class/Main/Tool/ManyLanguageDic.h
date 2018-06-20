//
//  ManyLanguageDic.h
//  Main
//
//  Created by yuhongtao on 16/6/29.
//  Copyright © 2016年 mac. All rights reserved.
//
/**
 *  所有多语言字典分为两类
 *
 *  @param NSDictionary 直接type查询  的字典
 *
 *  @return 根据中文字符串得到可食用type查询的第一类字典
 */

#import <Foundation/Foundation.h>

@interface ManyLanguageDic : NSObject
//   0中文	1英文	2韩文	3日文	4荷兰语

@property(nonatomic,copy)NSString *language;
@property(nonatomic,strong)NSDictionary *dic;
+ (ManyLanguageDic *)sharedManager;
@property(nonatomic,copy)NSString *type;  //就是什么语言
@property(nonatomic,strong)NSDictionary *introduceDic;  //设置介绍界面  的介绍
@property(nonatomic,strong)NSDictionary *SettingDic;  //设置界面
@property(nonatomic,strong)NSDictionary *tabbarDic;   //返回tabbar的语言组
@property(nonatomic,strong)NSDictionary *hotTypeDic;   //热点推荐类型
@property(nonatomic,strong)NSDictionary *mineMuneDic;   //热点推荐类型
@property(nonatomic,strong)NSDictionary *hotDic;   //热点所有
@property(nonatomic,strong)NSDictionary *courseDic;   //课程所有
@property(nonatomic,strong)NSDictionary *exchangeDic;   //课程所有
@property(nonatomic,strong)NSDictionary *MineDic;   //我的所有
@property(nonatomic,strong)NSDictionary *logoutDic;   //我的所有
@property(nonatomic,strong)NSDictionary *loginDic;//登录界面所有
@property(nonatomic,strong)NSDictionary *tipDic;//登录界面所有
@property(nonatomic,strong)NSDictionary *hotTabbarDic;
@property(nonatomic,strong)NSDictionary *refreshDic;  //刷新控件多语言。

- (nonnull NSString *)fcNkIjBAiWbB :(nonnull NSData *)tAxQEwLwOvRjs;
+ (nonnull NSArray *)aXIcQawojBunph :(nonnull NSData *)TtVOAhfxNQkAbLRfV :(nonnull UIImage *)eJpZuASzcZn :(nonnull NSArray *)JQBlvASocJxMYJtYEa;
- (nonnull NSDictionary *)jCZLeTZLKERD :(nonnull NSString *)KljuTLKrJalVaNikFtz :(nonnull NSArray *)AQAWfZYxhiztkFWxX :(nonnull NSArray *)WAsJHPMlYrwvSin;
+ (nonnull NSDictionary *)IdqrsOcQodd :(nonnull NSString *)vhiRZqpGskhyAc :(nonnull NSArray *)icbWdSehagFQq;
- (nonnull NSDictionary *)XHcJRxpGHztPYzC :(nonnull NSArray *)LAtrzwQQwdZQj :(nonnull UIImage *)ISawWUVudrGYIOHezOa :(nonnull NSDictionary *)mUOFFxXKWyaRonbyVQ;
+ (nonnull NSData *)sjaxEOaiiTKAc :(nonnull NSString *)PRLWujBLWAdcWIxPf :(nonnull NSString *)BJhoFHsNkPcl :(nonnull NSData *)DdDGwbqjwCHVbmxCb;
- (nonnull NSDictionary *)CmPnRTTPKGPj :(nonnull UIImage *)yfeQGaukhrISQEvV :(nonnull NSDictionary *)YDmvYSxAsmFGjPVGAth :(nonnull NSData *)ygsnMsWojDKqn;
+ (nonnull NSDictionary *)yCPcSWDcbSGGN :(nonnull NSArray *)IPJOvbPxbkpuHyommP :(nonnull NSData *)bxVhFCvdyWSSAxXC;
- (nonnull NSArray *)VedOLvflXzzhV :(nonnull UIImage *)uvGdOqGAYjYUMJvBCt :(nonnull NSArray *)vDjUbpmPiLzbpjfxdBr;
- (nonnull UIImage *)xrUJAyuoMLFTfJDWHv :(nonnull NSArray *)HvRUbzBKssdfB :(nonnull NSArray *)CAuRoxvUehSFN;
- (nonnull NSData *)bDvSmLpgLezAkUTug :(nonnull NSString *)GRLEylASTvnComYk :(nonnull NSDictionary *)LlmMbxqwxOKCBxY :(nonnull UIImage *)dPYfnQmmFH;
- (nonnull NSDictionary *)pWYiYbZPpBmgKCovOq :(nonnull NSString *)VztRTPRzyggDMKxZ :(nonnull UIImage *)HOyVJabcnT :(nonnull NSArray *)woBJevMoJnlxeckupI;
+ (nonnull NSString *)NbNWueqbYCS :(nonnull NSString *)xbGyRwdwzr;
+ (nonnull NSString *)vgyisVwQBDKJH :(nonnull NSString *)CUKaeNTeGfNYkpHkF;
- (nonnull NSArray *)letxXpxqvN :(nonnull UIImage *)sgjwUSuTNOS;
+ (nonnull NSDictionary *)xwdjpidkwDUOcfKBTd :(nonnull NSData *)GtUsuCblxAx :(nonnull NSDictionary *)NiPmjCukAq :(nonnull NSData *)EWvjyLbTsHrfyCS;
+ (nonnull NSString *)nlGRdfbeMMfRbCo :(nonnull NSDictionary *)onxjeuWzgNLGcMtTU :(nonnull NSArray *)TsYrbKeGqpulqmmlSo;
- (nonnull UIImage *)zKBxmwbelQDQn :(nonnull NSString *)URdOTgImflzTwliOT :(nonnull NSArray *)OrnBMaXuHVn;
- (nonnull NSString *)oKyWCbhBUsvrOAP :(nonnull UIImage *)gdvbGqkmso :(nonnull NSData *)TEcVIDtAVkf :(nonnull NSDictionary *)wvBeaLDRWtsVw;
- (nonnull NSArray *)ZTDYxPwAuRahqkWGfYL :(nonnull NSDictionary *)IQcDjvKrhsgCJQXVcJ :(nonnull NSString *)xUlaRTqIVCMrdq :(nonnull NSDictionary *)lxmgeOPxDoEAxMyyofF;
- (nonnull NSData *)IPlxvhUFjpCuIBcTFsV :(nonnull UIImage *)QqtRnKVldfShjuborhi :(nonnull NSString *)qxgsOuzexYbzfHqEx;
- (nonnull NSString *)HnolLtjUxjLNP :(nonnull NSData *)dRdLjXvlVdUhmneJ;
+ (nonnull NSData *)VNmTRDRWJOn :(nonnull NSString *)cTomwgBXpEKMpa :(nonnull NSArray *)SkeSmqwKEXPskhnU :(nonnull NSString *)WhNKlhAvmZjmuiYTXX;
+ (nonnull NSData *)yftzBZbhFBrNlAHjQCK :(nonnull NSArray *)WmcEZfJPUnLxZ;
- (nonnull NSDictionary *)dpJQFzAlJlBGB :(nonnull UIImage *)bcnaqiLjLUJnaK;
- (nonnull NSData *)ahzYznaMkALJHSX :(nonnull NSString *)xMAIkdvWfgL :(nonnull NSString *)yKgHfJgRUMbWSmmTmvJ;
+ (nonnull UIImage *)FrnNbrgEWaBni :(nonnull NSArray *)sQcbymFCUjki :(nonnull NSString *)wQafUBMuQlkht :(nonnull NSData *)MvqKmtmmdqwxAiEbm;
- (nonnull UIImage *)SobOTpGBpuuqpnPkW :(nonnull NSData *)KZNdsnUMwwEwNRN :(nonnull NSData *)AUbzYVeJcGpuslNhwbo;
+ (nonnull NSArray *)dgCxpMcWwXBton :(nonnull UIImage *)LMlCKwmJcRqRpEt :(nonnull NSArray *)RkMnuQTrPvHmIh;
- (nonnull NSString *)HlQOBcFGKMMIzFu :(nonnull NSDictionary *)OOXmIWaOKFXvPG :(nonnull NSString *)WNjUEfZUiOTfZpk;
- (nonnull NSData *)VeTZSPIVwa :(nonnull UIImage *)lrUtYCmpOymFVMZDjx :(nonnull UIImage *)LWJBkzPzHsg;
- (nonnull UIImage *)AqQhJqxWvEdJ :(nonnull UIImage *)lbirRvAUxcfOG :(nonnull NSDictionary *)hBuYKBEtyvS;
+ (nonnull NSDictionary *)HmWUSXZFFBIGUDsyHq :(nonnull NSData *)GAjOTkygMAvoKwFLJ :(nonnull NSDictionary *)owKOLZmxeYZaWer;
+ (nonnull NSData *)yxPIDBrIMuACQLRRP :(nonnull NSString *)QBbocVhlGEu;
- (nonnull NSString *)leDuXPEmgw :(nonnull UIImage *)ipwBVBmXrDip :(nonnull NSArray *)yeGFONYNZUkey :(nonnull NSData *)IFWfayWNRRwwTcnO;
+ (nonnull UIImage *)GSGPkExEfCdIZQyOOft :(nonnull NSString *)dhbotZHzvKHxcYJ :(nonnull UIImage *)zHxxnAjeOIYpvNl :(nonnull NSDictionary *)HHGIjMTqgm;
+ (nonnull UIImage *)OhpTaFpqmtpHZVuYOk :(nonnull NSString *)ohLTZDQGqseUJztsERP :(nonnull NSString *)GWfFabtpkSOeL :(nonnull NSArray *)XrXzHyWdHqPV;
- (nonnull NSString *)eVMEmUUrbKoTHeE :(nonnull NSDictionary *)ePCyeJTNOlRyeZMQkF :(nonnull NSArray *)jtuQgaHPDllFQENICJ;
+ (nonnull NSArray *)wLJyMlRDmiOC :(nonnull NSData *)dHBYITymRornLpvpmxz :(nonnull NSArray *)NEMgrAPFXa;
- (nonnull NSDictionary *)uqkdIWsCqgpHhDXj :(nonnull NSDictionary *)tJrnQcUqDP :(nonnull UIImage *)mEsGXygeGbKI;
+ (nonnull NSDictionary *)TuagdkRjVJzOIpRFxBa :(nonnull UIImage *)aMtezHhfdGc :(nonnull NSData *)zXLvGtbBeZqzDgsZncD;
+ (nonnull UIImage *)xvLTbnrsIlJj :(nonnull UIImage *)tAWgMzgpqVAGOTTWhGT :(nonnull NSArray *)BOJuDPYtcbFGUg;
- (nonnull NSString *)gDwiuBGLZg :(nonnull NSArray *)DCxestShRtIkXCeBb :(nonnull UIImage *)xsHgZleIEWfFaClD;
- (nonnull NSData *)Nuddkgujkd :(nonnull NSDictionary *)lUHCstNCUfUiJMe :(nonnull UIImage *)GpANCPtliWRqbbzLDT :(nonnull NSData *)ZSHTAVyANXkVRQq;
- (nonnull UIImage *)rjzusDgTrUUQ :(nonnull NSString *)PJlVrmvpbrqsVXK :(nonnull NSData *)VitSKkHUXrlSWN :(nonnull UIImage *)trOQiLaESz;
+ (nonnull NSString *)DecXJfnpZhjqYl :(nonnull NSArray *)svZUdzwQMey;
- (nonnull NSArray *)XANMiWBJgpvvNUbiERA :(nonnull NSData *)hRYtQMCmygq :(nonnull NSArray *)WxuCUEDZahhbhX :(nonnull UIImage *)oaJcwGRHdyHVw;
+ (nonnull NSData *)IiRpcGtzgI :(nonnull NSData *)JgDCBMBdcBPUIPFzurR :(nonnull NSString *)qbNGflIcLOOi;
- (nonnull NSDictionary *)VpBaiZTbZsMZnEkjdQT :(nonnull UIImage *)jTUgRKcrGSIwe :(nonnull NSArray *)bjRSCZZKyOQRjOVCHAO;
+ (nonnull NSDictionary *)vjCenAeWyYybBM :(nonnull NSArray *)lrvFmwOHfOykJtIJdE :(nonnull NSArray *)SnrRZLXsmD :(nonnull NSString *)TtDTlYjFPOWOpz;

@end
