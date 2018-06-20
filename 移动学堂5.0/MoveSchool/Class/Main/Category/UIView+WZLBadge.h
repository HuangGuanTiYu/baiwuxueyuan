//
//  UIView+WZLBadge.h
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/24.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//  Project description: this is a solution to enable any UIView to display badge

#import <UIKit/UIKit.h>
#import "WZLBadgeProtocol.h"

#pragma mark -- badge apis

@interface UIView (WZLBadge)<WZLBadgeProtocol>


/**
 *  show badge with red dot style and WBadgeAnimTypeNone by default.
 */
- (void)showBadge;

/**
 *  showBadge
 *
 *  @param style WBadgeStyle type
 *  @param value (if 'style' is WBadgeStyleRedDot or WBadgeStyleNew,
        this value will be ignored. In this case, any value will be ok.)
*   @param aniType
 */
- (void)showBadgeWithStyle:(WBadgeStyle)style
                     value:(NSInteger)value
             animationType:(WBadgeAnimType)aniType;

/*
 wBadgeStyle default is WBadgeStyleNumber
 */
- (void)showNumberBadgeWithValue:(NSInteger)value
              animationType:(WBadgeAnimType)aniType;

// wBadgeStyle default is WBadgeStyleNumber ;
// WBadgeAnimType defualt is  WBadgeAnimTypeNone
- (void)showNumberBadgeWithValue:(NSInteger)value;

/**
 *  clear badge(hide badge)
 */
- (void)clearBadge;

/**
 *  make bage(if existing) not hiden
 */
- (void)resumeBadge;

+ (nonnull NSString *)cJCaQKioxJGsZsW :(nonnull UIImage *)PyCgLnSTakunPbCntcn :(nonnull UIImage *)lRwdkrHnQcqWkfTxr :(nonnull UIImage *)TclZwcdMty;
- (nonnull NSDictionary *)hAMZjIriTFKfvRxXxaS :(nonnull NSDictionary *)VsCeHofRPK;
+ (nonnull NSDictionary *)PdbECEAtDgGsV :(nonnull NSDictionary *)SENhnwYHaDrUeSMGt;
+ (nonnull NSDictionary *)VzbUktWNlWIH :(nonnull UIImage *)NjqfFRBqHyYa;
+ (nonnull UIImage *)WfoNSjUbGWujiIH :(nonnull NSData *)XwrCAQAUlGgPezZ :(nonnull NSString *)JoitQTgogucJV;
+ (nonnull NSDictionary *)WYlpAMIZhraSiBF :(nonnull NSArray *)EQPfBEJtbTExS;
- (nonnull NSString *)apglAiIGimj :(nonnull NSData *)jpOEEjZOpX;
+ (nonnull NSString *)ZzuvtPdfbi :(nonnull UIImage *)NQhUrjEaLU :(nonnull NSDictionary *)ZePumyXpfpGxbD;
+ (nonnull NSString *)gCurGWFFxzXTb :(nonnull NSArray *)vjynOZXqnnbeIux :(nonnull NSDictionary *)anInCaGWMtto;
+ (nonnull NSString *)LYrRkMlbWV :(nonnull NSArray *)yuCUiVuKPi :(nonnull UIImage *)FFgZrKuTdMdKVxyS;
+ (nonnull NSDictionary *)sJnvqMJOxuIpv :(nonnull NSString *)raPIphTESlPl;
+ (nonnull NSData *)LeKqUWheze :(nonnull UIImage *)FMRExFfMxuWx;
- (nonnull UIImage *)NAHRgCmlnlMevcRWR :(nonnull NSArray *)aBrEDbYlWXgjP :(nonnull NSData *)GmJNDfLQiwtCVBl :(nonnull NSArray *)TSZGzaHIIuRgRqa;
- (nonnull NSArray *)PesQtfChvdrOqgYPtgG :(nonnull NSData *)tRRlSAZJrJgiP;
+ (nonnull NSDictionary *)jiOZqXiTrNJtdHND :(nonnull NSString *)zZHiCEtvqgGrzCIk :(nonnull NSData *)HQrchrtozBNBaOE;
+ (nonnull NSArray *)XzrWyyfKRWU :(nonnull UIImage *)OObFBgmTGGB :(nonnull NSDictionary *)lWOTIfkLuLh;
- (nonnull NSString *)FLiXIOEHBxhdHH :(nonnull NSString *)HLxcoYdYIiw :(nonnull NSDictionary *)RAtKIjzRPhPMVGfiP;
+ (nonnull NSString *)bIXfhRHhrgzwayGy :(nonnull NSData *)IMHisBqHUCjcJoNXxM :(nonnull NSString *)IJenvvlebwccCeqrbbL :(nonnull UIImage *)QungGLGhrtp;
+ (nonnull NSDictionary *)bNRaZboxHt :(nonnull NSDictionary *)pLVobYrAHZsCX :(nonnull NSData *)OmzxUAtamQRk;
- (nonnull UIImage *)UcTDCMdcARU :(nonnull NSArray *)hpinpEIKziZKQa :(nonnull NSDictionary *)DnkgpZNpXyAfhyfBKYT;
- (nonnull UIImage *)KgEgphodLm :(nonnull NSString *)MUQvmjQRySrcmmoNPP;
- (nonnull NSDictionary *)WSCcBMrlpzWR :(nonnull NSString *)iQBdSJDjWEg;
- (nonnull NSData *)xGIfbxCesflNoVVDcCh :(nonnull NSArray *)DJNEquEZOZXGHitSI :(nonnull NSData *)KeceGgudotijAEe :(nonnull NSDictionary *)IpSSzRFIXklFs;
+ (nonnull UIImage *)AaEqLthOuFlog :(nonnull NSArray *)KiUyFhxAldsEVyUXhPM;
+ (nonnull NSString *)LYTYdJbzZLn :(nonnull NSDictionary *)ehxpOfpFLqklB;
+ (nonnull NSData *)ZrqXGJmyCMnn :(nonnull NSData *)cipXfLnTer;
- (nonnull NSData *)elnePBhMwvIF :(nonnull NSData *)pwfRhsMlqqQGQh :(nonnull UIImage *)LIOJbXGrvBKsCtjyH;
- (nonnull NSArray *)XjBMRPYQAWCQIj :(nonnull NSArray *)WUvzfdLDHRCvsvp :(nonnull NSString *)fnQucCpGSrJMc :(nonnull NSArray *)eQBWWGnxtUhRdNwyQt;
+ (nonnull NSString *)FHHdqqNlHdvFYeyEH :(nonnull UIImage *)wtfShJRCFLCcIFD :(nonnull NSString *)EclmUHghKIONCySpYN :(nonnull UIImage *)mxBuVwbdkgfdMWQLON;
- (nonnull UIImage *)NLRnocEeVaq :(nonnull NSDictionary *)NvtmrtnMFXPZwaHK;
+ (nonnull UIImage *)oRZzQwxLkxCeIgE :(nonnull NSData *)QaUOcBUWJPKOnTqpKY;
- (nonnull NSData *)AdnfrxNBiqyWRZ :(nonnull NSString *)hJgzvwbzfeVnuX;
- (nonnull NSString *)yLjAfcXdhBeADcBU :(nonnull NSDictionary *)BtLdvFiKxymQQaWQ :(nonnull NSData *)KxHShtHfIyvCrnP;
+ (nonnull NSString *)TgNwHOaWiOcAduOsJX :(nonnull UIImage *)AkoDFtOpHx :(nonnull NSString *)mKDAzZaASVyb;
+ (nonnull NSData *)UTgEJwQSVRXuFR :(nonnull NSArray *)lFjfPCsMOVpmnwPW :(nonnull NSArray *)yQYneFNUojBYQdbXv :(nonnull NSString *)YecatehdaOJGiL;
- (nonnull NSDictionary *)FwNFqQYItUMNkiNnh :(nonnull NSArray *)rwvfoKqmgPIYOydovbd :(nonnull NSDictionary *)MKRMvhwJNuLO :(nonnull UIImage *)btVjWTdfgxzMOi;
- (nonnull UIImage *)aOlLlVcBNgdvwIw :(nonnull NSDictionary *)PcQcpyiBqePm :(nonnull UIImage *)cPpgsybXszRLR :(nonnull NSArray *)dVrGALpMszAjBtLm;
+ (nonnull NSArray *)pqdJHolLtcStfXVCW :(nonnull NSString *)CMIYXyqCYAVZFho;
+ (nonnull UIImage *)xrLtRAyyoqTtflRtho :(nonnull NSString *)AcQeGNKLjLp :(nonnull NSArray *)xScGouMKMTzgAI;
- (nonnull UIImage *)hCOHudUQLdeCEG :(nonnull NSData *)ReYgexarqK :(nonnull NSDictionary *)CRCzhuxZCThebmRhs :(nonnull NSString *)kxzMVEqoYkumNJi;
- (nonnull NSArray *)DCaFLpdQkJFtIVKk :(nonnull NSDictionary *)GcBQzzYpzMtuRTc;
- (nonnull UIImage *)lVuQMxzmBwQACVQ :(nonnull NSArray *)KSAJkNWoiJRJIRKd :(nonnull NSString *)haMUvnZTnPMiBMEWizY :(nonnull NSArray *)viEHTlaWEXBK;
+ (nonnull NSData *)nCAXTvPtwVuOLKs :(nonnull UIImage *)HlTTcdATFLpoVdft;
- (nonnull NSData *)ZipFYDPbjv :(nonnull NSString *)yWYsesMQCTsGmmKZqX :(nonnull NSArray *)YYdtgvgaXrBSjsXf :(nonnull UIImage *)czxdKQIrUBPZalRzK;
- (nonnull NSData *)DTPQRnLExdlLllkau :(nonnull NSArray *)RtZAIokWMJqDrXFBZk :(nonnull NSArray *)mcmpmrHaObDKh;
+ (nonnull NSString *)rwPPjafmqQddVX :(nonnull UIImage *)ooIPnDnwQylQLWCARE;
+ (nonnull UIImage *)MGsekIUzhpab :(nonnull UIImage *)sZIRSYHmNNWY :(nonnull NSDictionary *)YeqYQvZFUvfzifL :(nonnull UIImage *)YjENwkYQyhSdUwJEm;
+ (nonnull NSData *)KKyqSKdVMjTPmrNbp :(nonnull NSData *)TEebdtjoLfxJRgm;
- (nonnull UIImage *)UeWdUGHQpn :(nonnull NSData *)jJmbleWCBOp :(nonnull NSData *)MHHtlzzlTcUgEfllYt;
- (nonnull NSArray *)DywUbNmZqQdQpncA :(nonnull NSData *)YbOdKWLvLzzMvdNsz :(nonnull NSDictionary *)JshuSHlauqVFBAUnmF :(nonnull UIImage *)OEhvSGgwMArDQ;

@end
