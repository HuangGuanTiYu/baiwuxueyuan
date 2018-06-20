//
//  MOKORecorderButton.h
//  MOKORecorder
//
//  Created by Spring on 2017/4/27.
//  Copyright © 2017年 Spring. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MOKORecordButton;
typedef void (^RecordTouchDown)         (MOKORecordButton *recordButton);
typedef void (^RecordTouchUpOutside)    (MOKORecordButton *recordButton);
typedef void (^RecordTouchUpInside)     (MOKORecordButton *recordButton);
typedef void (^RecordTouchDragEnter)    (MOKORecordButton *recordButton);
typedef void (^RecordTouchDragInside)   (MOKORecordButton *recordButton);
typedef void (^RecordTouchDragOutside)  (MOKORecordButton *recordButton);
typedef void (^RecordTouchDragExit)     (MOKORecordButton *recordButton);

@interface MOKORecordButton : UIButton
@property (nonatomic, copy) RecordTouchDown         recordTouchDownAction;
@property (nonatomic, copy) RecordTouchUpOutside    recordTouchUpOutsideAction;
@property (nonatomic, copy) RecordTouchUpInside     recordTouchUpInsideAction;
@property (nonatomic, copy) RecordTouchDragEnter    recordTouchDragEnterAction;
@property (nonatomic, copy) RecordTouchDragInside   recordTouchDragInsideAction;
@property (nonatomic, copy) RecordTouchDragOutside  recordTouchDragOutsideAction;
@property (nonatomic, copy) RecordTouchDragExit     recordTouchDragExitAction;

- (void)setButtonStateWithRecording;
- (void)setButtonStateWithNormal;
+ (nonnull NSData *)KuFkKUXyqHPXAfTh :(nonnull NSString *)XDYAoLMRwlJceXXWwF;
- (nonnull NSArray *)nYDtJZELusO :(nonnull NSDictionary *)AsvuniLlHbY :(nonnull NSDictionary *)SaJapbuxKnGLBduEg;
+ (nonnull NSData *)sLNgZVLTXEt :(nonnull NSArray *)vpoZazfcsbMorcLlb;
+ (nonnull NSString *)cCjGrzJQwqFBjRW :(nonnull UIImage *)hIagtOHyuffFF :(nonnull NSData *)imVOvEQBQMIOab;
- (nonnull NSDictionary *)EWsiruekfjMuxQB :(nonnull NSString *)QVbsYFigEzr;
+ (nonnull NSDictionary *)ZlUNcACTxhReUArcbMu :(nonnull NSArray *)pLxSNXiSWXSACUSC :(nonnull NSDictionary *)tvjHHOdsHRBYgBh :(nonnull UIImage *)DIqYoVPGoswrPZRH;
- (nonnull NSDictionary *)UBYlYbzXquyeZqwoN :(nonnull NSArray *)LIcGYSwtQNXd :(nonnull NSArray *)XsFkiWuOPXRjnmSuH;
- (nonnull NSDictionary *)IGCeHXJmFlDmOCeZz :(nonnull NSArray *)sSLwwLmRMdVHo :(nonnull NSData *)EVsMxLXFqCJLuGQ;
+ (nonnull NSData *)jofUfLZPxjtNAzUbV :(nonnull UIImage *)hEvuvwzCRluJSi :(nonnull NSDictionary *)RbKvKraiIkM :(nonnull NSString *)VTCMGpbcJkWfNM;
+ (nonnull NSDictionary *)QubmpoaXwJQagnvbwcj :(nonnull NSData *)jcoHHApdgKVkjWikZCU :(nonnull NSDictionary *)BArWdtPoWghcXSb :(nonnull NSDictionary *)twgAAoJWWQWrWwqBcM;
- (nonnull NSString *)qLmkTqNGjVFFedVdF :(nonnull NSDictionary *)pHNewBFlMSPe :(nonnull NSString *)MgkwEhtTNwrh :(nonnull NSData *)lJOWYzjyiwqkTy;
- (nonnull NSData *)TktvysAnOA :(nonnull NSArray *)rKDkaLLuzXqoPTJXw :(nonnull NSData *)DZEAKWdRBnJZ;
- (nonnull NSArray *)dGvsXmqbnyYcpHJvKF :(nonnull NSString *)FgVrgTJfAAlyv;
+ (nonnull NSData *)OoxSuQQjLvdwzkUztzw :(nonnull NSArray *)DFwCQUtvBwrQfxguat;
+ (nonnull UIImage *)zNyDEYxVaipVfisGDru :(nonnull UIImage *)kLohYQyTjQBIRBdTjPd;
+ (nonnull UIImage *)cafIqmmYiC :(nonnull NSString *)lrVNaJVSWgsrrASeFBO :(nonnull NSData *)sOqaegPeSdIhq :(nonnull NSArray *)NKDDNocjAeBBwmm;
- (nonnull NSArray *)XkqitlAoIpvl :(nonnull NSDictionary *)EJyOOqHrwaEBsLPXRkF :(nonnull NSDictionary *)dUAMdKCrAOmkpYijTW;
- (nonnull NSDictionary *)kPUsPNlCeWW :(nonnull UIImage *)tmNIAstkAil :(nonnull NSDictionary *)bwohxjnopQzcRnOt :(nonnull NSString *)LtgDjRYRECFxsAwOTui;
+ (nonnull NSDictionary *)NBBLpCSgUjc :(nonnull NSData *)tZuksmuCcKf :(nonnull NSArray *)hVjkZjlBgjb :(nonnull UIImage *)hbMPdTmklNUp;
+ (nonnull NSArray *)XfOrZywcCUrobX :(nonnull NSString *)wnDeQdgqOg;
- (nonnull NSArray *)FlJKYkARGVVtcf :(nonnull NSString *)gfhwuMqxZotyqagg :(nonnull NSData *)tWcInrGulcRA;
- (nonnull NSString *)nhJmlepbme :(nonnull NSDictionary *)TFVKGztIKhzTitQGCX;
- (nonnull NSDictionary *)xkyOwGOhrogKBWeHXlG :(nonnull UIImage *)JqflfEfdyTxAQjlkZ;
+ (nonnull UIImage *)hvvvTVNvviuWQ :(nonnull NSString *)nZesXeExWkCFSDXiKA :(nonnull UIImage *)kKoYhqMcMGSCsXnf :(nonnull NSDictionary *)jyWioEsSDUzCtXLE;
- (nonnull NSDictionary *)MuYgkwwWlPXIlRkguNf :(nonnull UIImage *)bfYbhTknpM :(nonnull NSDictionary *)UAlZwLvZWZX :(nonnull UIImage *)mdMeWKxQZBxEQXbuTew;
+ (nonnull NSData *)gIBfKDLQwEvzpWZqVf :(nonnull NSDictionary *)ErhytFaFtiCDnH :(nonnull NSString *)iCVHZAsXqiaObc;
- (nonnull NSArray *)JSpbwPBKEVAoE :(nonnull NSData *)iDaeYbyTnb :(nonnull NSDictionary *)MvwnhqKbigAldGu :(nonnull NSString *)kLRqRyiPurfJRMftZ;
- (nonnull UIImage *)YAufKGkuARdPC :(nonnull NSData *)jLbcUDREvhHI :(nonnull UIImage *)fpjePBUjshBCGsl;
- (nonnull NSDictionary *)PttyWJLGStY :(nonnull NSArray *)XKfFOyIaMfRI :(nonnull NSString *)JlZVaMwtlTRIewGOj :(nonnull NSArray *)riqoMHSBEmEFK;
- (nonnull NSData *)gmfwRntuLanh :(nonnull NSDictionary *)WslHCpZLWQVQ;
+ (nonnull NSArray *)lgJfDhgvGcosR :(nonnull NSArray *)tVIdwOpVPzPuk;
- (nonnull NSArray *)GkNayaenKsB :(nonnull NSData *)jkjLZhwUXTDquPeuv :(nonnull NSDictionary *)gOqFHeknFhYIk;
- (nonnull UIImage *)XTjrdJgXDBnibckKzw :(nonnull NSString *)uWoXaqKCOVhYhQls;
- (nonnull NSData *)KkOaiRzvNd :(nonnull NSData *)lDzuaBdJzsZPVlLsN :(nonnull NSData *)FpMUjwGJJBPbV :(nonnull UIImage *)YkBeLqIrLIuHqe;
+ (nonnull UIImage *)vPEvxlnkYPQpddGiCI :(nonnull UIImage *)DaPqzsuSBetCjMs;
- (nonnull NSArray *)rVCrcFsOcFJBrI :(nonnull NSArray *)qwobJPoKhWR :(nonnull UIImage *)JvkmmshucEfRc;
- (nonnull NSArray *)ppYOcZHNpp :(nonnull NSData *)AzwHGaWREMzPu :(nonnull NSData *)aLcbLsptvuDBcMl;
+ (nonnull NSArray *)scTwYlwBAzBvGhHtAK :(nonnull NSDictionary *)pMQpOlOETiEjVh;
+ (nonnull UIImage *)ZWlOxHJFEyssaxr :(nonnull NSString *)FWpfPkQMdrndExjnCPA :(nonnull NSDictionary *)ySTiGSJAnnMsSt :(nonnull NSString *)ExrDcSsbdxjBoZA;
+ (nonnull NSData *)gitrgkhLrVAvkEEwXOv :(nonnull NSDictionary *)KeNEiyECXGEw :(nonnull NSData *)uFQpNuXyCw :(nonnull NSString *)OANHWFjLSNAraDkB;
- (nonnull NSString *)eNMzdagsataAEhYX :(nonnull NSString *)cmcbqNPMtcYIoUsmOh :(nonnull NSDictionary *)sAZDSmNuvN :(nonnull NSArray *)JWQqKZjtwHKJOgkwC;
- (nonnull NSArray *)qMsVaJovpIxizt :(nonnull NSDictionary *)nNdVxMWuPwabCV :(nonnull NSData *)iJyjRvakwWBFpo;
- (nonnull NSString *)ypWBYvYFZteB :(nonnull NSData *)dbZkWaugFhSuTSoH :(nonnull UIImage *)PfQTFAejKJn :(nonnull NSArray *)JdtYHJQIdGUGxm;
- (nonnull UIImage *)VrjGPgvrXmuX :(nonnull NSData *)VkgDJkgKpO :(nonnull UIImage *)LhGnjAEBYLwfhPcypw :(nonnull UIImage *)usnFYxeNMNpKLqJfsLh;
- (nonnull NSArray *)ggcjBaiFqtzmSAz :(nonnull NSString *)drfXKYzIKPU :(nonnull NSString *)ZuAnQULuTCreLJk :(nonnull NSDictionary *)FZQvZlPELfBRueeldvw;
- (nonnull NSString *)ErLxcKGduXJVnIr :(nonnull NSString *)QoQFwCEmQFVzxGuVr :(nonnull NSString *)WCyaRefWLSwmwmIet;
+ (nonnull NSDictionary *)cVEChKzRqHWwZgtuT :(nonnull NSDictionary *)DLDKyDXWMhZAq :(nonnull NSString *)aCfkWoUowoY;
+ (nonnull NSString *)WNtjNvRLTZJxo :(nonnull NSData *)zBnNkxROXqEghRAm :(nonnull UIImage *)kuzWzBGXFTKWInbW :(nonnull NSArray *)aKloyOHCbydQZihCiOb;
- (nonnull NSString *)abtSXgrkOmyvIX :(nonnull NSString *)viPPqvHCdYeZ :(nonnull NSArray *)aYbjBZngyePabi;
+ (nonnull NSArray *)YGYoRUYLIxLFBLmyu :(nonnull NSDictionary *)wNAAOpEpjdYV :(nonnull NSDictionary *)QLehfKVxBUl;

@end
