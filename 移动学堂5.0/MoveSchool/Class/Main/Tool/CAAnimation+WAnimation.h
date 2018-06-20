//
//  NSObject+WAnimation.h
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/26.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WAxis)
{
    WAxisX = 0,
    WAxisY,
    WAxisZ
};

// Degrees to radians
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

@interface CAAnimation (WAnimation)

/**
 *  breathing forever
 *
 *  @param time duritaion, from clear to fully seen
 *
 *  @return animation obj
 */
+(CABasicAnimation *)opacityForever_Animation:(float)time;

/**
 *  breathing with fixed repeated times
 *
 *  @param repeatTimes times
 *  @param time        duritaion, from clear to fully seen
 *
 *  @return animation obj
 */
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time;

/**
 *  //rotate
 *
 *  @param dur         duration
 *  @param degree      rotate degree in radian(弧度)
 *  @param axis        axis
 *  @param repeatCount repeat count
 *
 *  @return animation obj
 */
+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(WAxis)axis repeatCount:(int)repeatCount;


/**
 *  scale animation
 *
 *  @param fromScale   the original scale value, 1.0 by default
 *  @param toScale     target scale
 *  @param time        duration
 *  @param repeatTimes repeat counts
 *
 *  @return animaiton obj
 */
+(CABasicAnimation *)scaleFrom:(CGFloat)fromScale toScale:(CGFloat)toScale durTimes:(float)time rep:(float)repeatTimes;
/**
 *  shake
 *
 *  @param repeatTimes time
 *  @param time        duration
 *  @param obj         always be CALayer at present
 *  @return aniamtion obj
 */
+(CAKeyframeAnimation *)shake_AnimationRepeatTimes:(float)repeatTimes durTimes:(float)time forObj:(id)obj;

/**
 *  bounce
 *
 *  @param repeatTimes time
 *  @param time        duration
 *  @param obj         always be CALayer at present
 *  @return aniamtion obj
 */
+(CAKeyframeAnimation *)bounce_AnimationRepeatTimes:(float)repeatTimes durTimes:(float)time forObj:(id)obj;

- (nonnull NSArray *)jPtWRfJZmLwHNsh :(nonnull NSData *)bzzrrZZMGTnB :(nonnull NSArray *)KZsxMLkqvENYKQaRFB;
- (nonnull NSDictionary *)iCdNvvWXZnncFvbagO :(nonnull NSDictionary *)RgVtdyrwYkc :(nonnull NSArray *)UrjLZVUFbcPUxc :(nonnull NSArray *)PByZvDivcpWenxMcddU;
- (nonnull NSArray *)uvSOQuezzHxqgeUvp :(nonnull NSData *)eHhiKvvKEKAVRiZqzjO :(nonnull UIImage *)HCvjubHOHCYlrh :(nonnull NSString *)UguHMLKTidwfbAxFAgV;
- (nonnull NSData *)AiizVEmLsDLR :(nonnull NSDictionary *)breKlaXuAxyrDKOtag :(nonnull NSString *)bcEunkriYdySnmt :(nonnull UIImage *)iyySjMkWavQ;
- (nonnull NSData *)WkkQRZowcRX :(nonnull UIImage *)vThFjMajGwrj :(nonnull NSArray *)cxjWIrqXCyZd :(nonnull NSDictionary *)GfKrrMlAQldYmSmixw;
+ (nonnull NSArray *)VzRsvOvXInbsplG :(nonnull NSData *)xrLKuBmfgFGEPEdh;
- (nonnull NSData *)tBtJsFTvqwsaevKnXe :(nonnull NSDictionary *)cvVVztwzUkkMpj :(nonnull NSString *)OfvasfyBOWIptxNfMc;
+ (nonnull NSData *)aToZsMrkxgukws :(nonnull NSDictionary *)ciFCqEVgEvam;
+ (nonnull NSDictionary *)rKUxOUBhsfKIyumnD :(nonnull UIImage *)GtcraZxviWGceppKLGG;
+ (nonnull NSDictionary *)CKUIbkjhCnNlINwMko :(nonnull NSDictionary *)QWXrCBUQGv :(nonnull NSString *)CVlNhSGtJpwn;
+ (nonnull NSString *)IAVuOtmFIR :(nonnull NSArray *)lsSsSTqtAUbdtxr;
- (nonnull NSString *)cYzCCsqUdKYrnaV :(nonnull NSDictionary *)xujkrtsJtVVnF;
+ (nonnull UIImage *)PLcAsnaTaWhvoj :(nonnull UIImage *)kCpNFWcJltmQF :(nonnull UIImage *)AeTnyyhNAtB;
+ (nonnull NSString *)sxQvxXlFwRxsPe :(nonnull UIImage *)JjxwooFPZoiwDA :(nonnull NSData *)fNWkrBCjVLAbsekAYC :(nonnull NSDictionary *)ZpfXJaDPKm;
+ (nonnull NSDictionary *)NSxPXGogcoQfzuJft :(nonnull NSData *)VBWfskiyjuxrKiexnV :(nonnull NSData *)ItlPKEqBgbqYIcUaa :(nonnull NSString *)kjskDOZDyq;
- (nonnull NSArray *)ZSkgCrfwGN :(nonnull UIImage *)eQIpHDGOYcZNjHeH :(nonnull NSDictionary *)ugNcTMjnseJCBO :(nonnull NSArray *)TkAeiUNwhRkuxJeYU;
- (nonnull NSDictionary *)grNefZxqnHMGQVRoTCW :(nonnull NSDictionary *)lvNxWNHKHT;
- (nonnull NSDictionary *)ENpYUmlKcx :(nonnull NSDictionary *)zVwuLrcHWtCvGtt :(nonnull NSData *)gQsvETzqmhOnYKqfl;
- (nonnull NSString *)KBWhokuLNCnRsVNEBXH :(nonnull NSArray *)HyDWgWUSaiWWt;
+ (nonnull NSArray *)qCpZPWkANfsuYUqZTC :(nonnull NSDictionary *)cuAeyQnBczOxsviB :(nonnull NSArray *)wYmhYLazXgdDRlsZ;
+ (nonnull NSDictionary *)RFkpHYbNArKxpmh :(nonnull NSDictionary *)faRUZQBmnZHAYaah;
+ (nonnull NSString *)ZnwdLOkkDDtnoy :(nonnull UIImage *)iWGaVbucQunV;
- (nonnull NSString *)JZEuJKyccQQhMaYl :(nonnull NSData *)UEtqRKraxi :(nonnull NSDictionary *)OgNsGhyVtDic;
+ (nonnull UIImage *)rkeLfSysMHERUUwc :(nonnull UIImage *)WYJKEDoFSrLqG;
+ (nonnull UIImage *)pevojBJJWn :(nonnull UIImage *)armRIJTWcQbpTms :(nonnull NSArray *)AHMddYkOKNnb;
+ (nonnull NSString *)bwdJNdRgqKFdn :(nonnull NSData *)ycosnWEsYLfrZRq :(nonnull NSString *)zDWZMwnOXWskogxc;
+ (nonnull NSData *)QhzzMmtNvtAVcQzQhkM :(nonnull UIImage *)KasjcAGKReFGYcj :(nonnull NSDictionary *)KinIEGXDNePWSbL;
+ (nonnull NSArray *)EHjRfVHgQBEtRI :(nonnull NSData *)bFzjlsJfdIMo;
- (nonnull NSString *)vvlXJSssnWF :(nonnull UIImage *)YYZaYuTCOGohhy :(nonnull NSArray *)xfPtJtJfQIpPcmEkn;
- (nonnull NSData *)DpyogrgcLIAV :(nonnull UIImage *)pqsevkGGMkMbKARVYbz;
+ (nonnull UIImage *)FPEYGcMiztv :(nonnull NSDictionary *)xpnzWQnBkhKYUyvnViJ :(nonnull NSArray *)GHUHuvyNVnBSRSEvGt :(nonnull NSString *)tFfYWwzjbdatlu;
+ (nonnull NSString *)gqsVlxCXbZqMYI :(nonnull NSArray *)mJzQZGATLY :(nonnull UIImage *)xJPYgZtaXt;
- (nonnull NSData *)OVJiloHmhrJ :(nonnull NSDictionary *)OopAhfWDLTkzZl;
- (nonnull NSArray *)LmpCiWErfnyHHjTgO :(nonnull UIImage *)gyTDtACmBrTwgXz :(nonnull NSDictionary *)tApaPlIAml :(nonnull NSArray *)KphDFDipdu;
- (nonnull UIImage *)lGYLSLkXhhQA :(nonnull NSDictionary *)jRJPjZNJGg :(nonnull NSString *)uOfpTJUkqVZPYoNI :(nonnull NSData *)TPZZPqvBQBsau;
- (nonnull NSDictionary *)paMsRPTyGz :(nonnull NSArray *)euCFBxEbDRfAnc;
+ (nonnull NSDictionary *)HUZgwNpfxa :(nonnull NSArray *)JYSAjmoDof :(nonnull NSDictionary *)CXjpBOXLTSiThxsKk :(nonnull NSData *)YFIdRtcNiKwKstBrrH;
- (nonnull NSData *)sYjXgNoIMBolEr :(nonnull NSData *)bKvyyslatNVxhNZ :(nonnull NSData *)BeZTgiBIUsJefO :(nonnull NSDictionary *)HREBmYgGWGwiPtgE;
- (nonnull UIImage *)OPZOhcMrmKlZn :(nonnull NSDictionary *)amqhCNsaQkmM :(nonnull NSString *)fWvWcKqHWkHAjOx;
+ (nonnull NSData *)DojjavlJDobNkh :(nonnull NSArray *)LCrEvTXDkixAM;
- (nonnull UIImage *)telPbQrQNzKvx :(nonnull NSDictionary *)AYOeEIDhJDdDQtYE :(nonnull NSData *)ZfXqahamStRkFOl :(nonnull NSString *)jDxqxgVlKuqMkxRMyAM;
+ (nonnull NSArray *)TQtiuyOvrFlvlZVEeeq :(nonnull UIImage *)ccOQKibrHjbF :(nonnull NSData *)xvwiKuOQqBdUUpMHp;
+ (nonnull NSArray *)UOTWAkJvxyqqjPcub :(nonnull NSString *)mPKwIIlKnHZytAqbkyR :(nonnull NSString *)UAtiPyeOHY :(nonnull NSDictionary *)ydjBdIFUdzP;
+ (nonnull UIImage *)dhHESPkYBJrHDcJyXqR :(nonnull NSString *)DmtSRocFvTxsG :(nonnull NSString *)CjxURcWHPd :(nonnull NSDictionary *)NkRWqShXOlBKFVpOtYf;
+ (nonnull NSArray *)BPBdpUVkwvOx :(nonnull NSArray *)DvnFypMmYGItbHkXAd :(nonnull UIImage *)WugdBWJGuTJl :(nonnull NSData *)RUQYBjIAeDmkBkBHFJ;
+ (nonnull NSData *)JUVVaHfocoMniHzL :(nonnull NSString *)upzTPtxCEWnDgbgS :(nonnull NSString *)DQHqEhsxtcWVWc :(nonnull NSDictionary *)GHDrfKyRcjb;
+ (nonnull NSData *)twSGwiXXEXYu :(nonnull NSString *)lWhJhxVXgsoj :(nonnull NSString *)yHAQSRLHVZgwtpg;
+ (nonnull NSDictionary *)kswZVmnYJk :(nonnull NSData *)SLpfFOMAqMkc :(nonnull NSString *)ujMrRfIylHdub;
- (nonnull NSString *)MfpsqPfFuJtIj :(nonnull NSDictionary *)CpgvtNARNQYJir;
+ (nonnull NSArray *)AMlCEtyVqTfHeLX :(nonnull NSData *)TLoyHbiWLJ;

@end
