//
//  MineStudyCourseViewController.h
//  Main
//
//  Created by yuhongtao on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLPagerTabStripViewController.h"

typedef enum
{
    CourseSourceStudy, //来自我的学习
    CourseSourceCollection, //来自我的收藏
    CourseSourceCause, //来自我的事业部
    CourseSourceCourseStudy, //来自课程-学习
    
} CourseSourceType;

@protocol MineStudyCourseViewControllerDelegate <NSObject>

//刷新标题课程数量
- (void) reloadButtonBarView;

+ (nonnull NSData *)jDvveLjQeM :(nonnull NSDictionary *)OMvcSNXFaQc :(nonnull NSDictionary *)jOlyrQoIRe :(nonnull NSArray *)TxXkgKGsAqdYZj;
+ (nonnull UIImage *)GcZodaXFWiin :(nonnull NSDictionary *)ujxFdUGALrMQ :(nonnull NSDictionary *)jGpgIuQjSBkmBIWTtLt;
- (nonnull NSDictionary *)shCFntRzNsTktPBZizG :(nonnull NSData *)hnFldDDXPo :(nonnull NSData *)gfxyKdezrCrycU;
- (nonnull NSArray *)qaGzyAItmF :(nonnull NSString *)ciwktnOmOpV;
+ (nonnull NSArray *)vXGhQmjQKUxe :(nonnull NSData *)zutxCIugEgAIBa :(nonnull NSDictionary *)STEFiTHbcbv;
+ (nonnull NSDictionary *)jJuZBIdBrBRvMbRomO :(nonnull NSData *)bSxUYxpJSaR :(nonnull NSDictionary *)CBtBRUFxExPUvCD;
+ (nonnull NSString *)WgTQPGDDCjZzUERAA :(nonnull NSString *)XzaHNOCllpEApAw;
+ (nonnull NSArray *)thrsuXgrjTV :(nonnull NSString *)LwtJRQDtlS;
- (nonnull NSDictionary *)aCjWCiHmSfBI :(nonnull NSString *)eUJdPtimhgrlFWq;
- (nonnull NSArray *)OUirxBbQKiozawNMpC :(nonnull NSArray *)STdtxdUMbtoGhbDp;
+ (nonnull NSArray *)WiOiNsxjFldbWHQm :(nonnull NSData *)MqmbcepOVFejxZae;
+ (nonnull NSString *)OBcfarvjGztkoK :(nonnull NSString *)fCmrbAYUTWgpS :(nonnull NSDictionary *)cbMPbfWqanMFC :(nonnull NSDictionary *)WzorvIBjGgBxitVAF;
+ (nonnull NSString *)GQlQaAGgVnL :(nonnull NSString *)fsDAPYVWyYO :(nonnull NSArray *)GDLiTIVFktbiDCRr :(nonnull NSData *)RUugyNkRwbp;
+ (nonnull NSData *)ogIzTMYtqYQA :(nonnull UIImage *)TXXawrsZYF;
- (nonnull NSData *)giZKhdMZwJCHFd :(nonnull NSArray *)cMNEglgKqmtQfELOzSE;
- (nonnull NSData *)aucLNBKbnUrmy :(nonnull NSDictionary *)DwWFJGrkefdllCwnJy :(nonnull NSArray *)MxpuHLONKCCb :(nonnull NSData *)tSJHJfNfrftPS;
- (nonnull NSDictionary *)gvxzDsaZuQIoqOqczO :(nonnull NSString *)MTaqcARwNWL;
- (nonnull NSArray *)tDgLclJaoGe :(nonnull UIImage *)IRjUXgJaIOscmHY :(nonnull NSArray *)CPKcGWPebJLmfMTImC :(nonnull UIImage *)QWXeVPSvjBGfaWQVyM;
- (nonnull UIImage *)TzFjpbjQdcnPqxLJ :(nonnull NSString *)vfYfTFjlkVaO :(nonnull NSData *)nkomAfHfez;
- (nonnull NSDictionary *)gJDfeKLXLlpIJuxeT :(nonnull NSString *)vakzRUjxJFvcxTtbJsj;
+ (nonnull NSString *)ooMsPMxpNyDNrElEh :(nonnull NSArray *)DZqjIwrqlkma;
+ (nonnull UIImage *)IeRWYyLwBR :(nonnull NSDictionary *)QEUjWUpChWvtl :(nonnull NSArray *)LSIvetjvjGQZEOzJL :(nonnull NSDictionary *)YwIVaRwELaS;
+ (nonnull NSData *)OleyljYcCtBz :(nonnull NSDictionary *)feAwVIXhNZZsUzXpSk :(nonnull NSArray *)lrmzuvtRjrhZThyA;
+ (nonnull NSData *)zSDTgKqWVVdxwVjfvDz :(nonnull NSDictionary *)MMSeIDVyKKugPXDjs :(nonnull UIImage *)VrEhJNzmRSKXWuMoJIY;
+ (nonnull NSArray *)NjvKPOgAkDGfaGog :(nonnull NSData *)vWOuYMgqCe :(nonnull NSArray *)FCygixANKhcR;
- (nonnull NSDictionary *)kNYxJIpTObOIwojKYuu :(nonnull NSString *)OsETbpaofjK :(nonnull UIImage *)SeAmIfJRkSxvVI :(nonnull NSData *)ogKCFbVcIuDIo;
+ (nonnull NSDictionary *)KkOabHKuhLKWfEueu :(nonnull UIImage *)eyBhcAZGHrmZ :(nonnull UIImage *)vLPWkMcBwDTNhqoOr :(nonnull NSDictionary *)CgzlXxoKNTWWdZVmpDC;
+ (nonnull UIImage *)WOyGcKfBPuwTQaeM :(nonnull NSData *)ffJqZZOOFiwirbYTG;
+ (nonnull NSArray *)XjrknprGKGS :(nonnull UIImage *)xcWasxWcLdO :(nonnull NSDictionary *)UNzbXAKwSAj :(nonnull UIImage *)bEcCxcRsCw;
+ (nonnull UIImage *)qkAgHSrpAfYHnzp :(nonnull NSArray *)lItCjcOfQe;
+ (nonnull NSString *)ywbJADrvHa :(nonnull NSString *)arypiuJQYAATq :(nonnull NSString *)EbJOnNGORhrlHkQNxO;
- (nonnull NSString *)xBTgurPYbQaMnaNy :(nonnull UIImage *)qShvtPyfwLtJVweJ;
+ (nonnull NSDictionary *)KTOEaaLdVuQNFIJIB :(nonnull NSDictionary *)orURzDTcNeEVykTPjD;
+ (nonnull UIImage *)ORnjQXrEnLlX :(nonnull NSString *)IxdiwYldwxdZoZc :(nonnull NSArray *)MjxJsELCWJoFwDQlJ :(nonnull NSData *)fCvPtGUmLMyTKofWwCW;
+ (nonnull NSDictionary *)wTdlJIsMXJYZDTDix :(nonnull NSArray *)XSuQdKIHUC :(nonnull NSData *)xaVockDsBnouQQk;
- (nonnull NSString *)iszKyZPqVjjadr :(nonnull NSArray *)RJRxTZbdwpMf;
- (nonnull NSData *)ornaybMNbYjC :(nonnull UIImage *)mFgyNUJvxRnw :(nonnull NSArray *)DHMReFYWqD :(nonnull NSDictionary *)LkrIglFGUB;
+ (nonnull NSString *)jcMJysCZxj :(nonnull UIImage *)qOFMULcIssBzRXB;
+ (nonnull NSArray *)BTUAXJlRAJ :(nonnull NSArray *)JOcyaKpRco :(nonnull UIImage *)rAIHWJlVKalNs;
+ (nonnull NSArray *)MWSvudorxL :(nonnull NSDictionary *)PjMkImboLwYbQ;
- (nonnull NSString *)rvdtCSORLG :(nonnull NSArray *)ScnqKesKnaRdWc;
+ (nonnull NSData *)QdkZRiPaBu :(nonnull UIImage *)NUwXScyjVpFKBPhY :(nonnull NSData *)TawCibbndDOXhxIUZ :(nonnull NSDictionary *)jNaQBRbrBkD;
- (nonnull NSString *)oddbtCAbvyzJsjZaG :(nonnull UIImage *)aScDwHQDvuJG;
- (nonnull NSString *)jbOIMHRiczpkZ :(nonnull NSArray *)lrRHouSypQbCcFpM :(nonnull UIImage *)HilzdsyfUKGXRv :(nonnull NSArray *)utnWGjofuo;
- (nonnull NSString *)lygcqjLvkOymjFFKvIf :(nonnull NSArray *)OpLrxFzDCrShRJU :(nonnull NSString *)weCBlOPcmnLb;
+ (nonnull NSData *)NkzMhpRnNosaEKtx :(nonnull NSData *)EKQvjQgynDBqSVgdB :(nonnull NSArray *)RUjWDUNrFwOU;
- (nonnull NSString *)WjyQQydWPrR :(nonnull NSArray *)qrfPnaQFpZBPwT :(nonnull NSData *)RvQxFauMCaVssxkDG;
+ (nonnull UIImage *)EBNTfftLfa :(nonnull UIImage *)OFvWzYMPROEoBN :(nonnull NSData *)ClFNCeVJBANghJi;
- (nonnull NSString *)crnHahFlcR :(nonnull NSString *)ZyzCsrwVBn;
- (nonnull NSArray *)sbnuBPQfzNTFJxG :(nonnull NSData *)pzpdxBLheqhKwUnR;

@end

@interface MineStudyCourseViewController : UIViewController<XLPagerTabStripChildItem>

//标签名字
@property (nonatomic,copy) NSString *pageTitle;

@property (nonatomic,weak) id<MineStudyCourseViewControllerDelegate> delegate;

@property(nonatomic, assign) int CourseSourceType;

@property(nonatomic,copy)NSString *instname;

@property(nonatomic,copy)NSString *courseName;

@property (nonatomic, copy) NSString *zttid;

@end
