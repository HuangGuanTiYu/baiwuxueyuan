//
//  UIImageView+CornerRadius.m
//  MyPractise
//
//  Created by lzy on 16/3/1.
//  Copyright © 2016年 lzy. All rights reserved.
//

#import "UIImageView+CornerRadius.h"
#import <objc/runtime.h>

const char kProcessedImage;

@interface UIImageView ()

@property (assign, nonatomic) CGFloat zyRadius;
@property (assign, nonatomic) UIRectCorner roundingCorners;
@property (assign, nonatomic) CGFloat zyBorderWidth;
@property (strong, nonatomic) UIColor *zyBorderColor;
@property (assign, nonatomic) BOOL zyHadAddObserver;
@property (assign, nonatomic) BOOL zyIsRounding;

@end





@implementation UIImageView (CornerRadius)
/**
 * @brief init the Rounding UIImageView, no off-screen-rendered
 */
- (instancetype)initWithRoundingRectImageView {
    self = [super init];
    if (self) {
        [self zy_cornerRadiusRoundingRect];
    }
    return self;
}

/**
 * @brief init the UIImageView with cornerRadius, no off-screen-rendered
 */
- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    self = [super init];
    if (self) {
        [self zy_cornerRadiusAdvance:cornerRadius rectCornerType:rectCornerType];
    }
    return self;
}

/**
 * @brief attach border for UIImageView with width & color
 */
- (void)zy_attachBorderWidth:(CGFloat)width color:(UIColor *)color {
    self.zyBorderWidth = width;
    self.zyBorderColor = color;
}

#pragma mark - Kernel
/**
 * @brief clip the cornerRadius with image, UIImageView must be setFrame before, no off-screen-rendered
 */
- (void)zy_cornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (processedImage) {
        objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    self.image = processedImage;
}

/**
 * @brief clip the cornerRadius with image, draw the backgroundColor you want, UIImageView must be setFrame before, no off-screen-rendered, no Color Blended layers
 */
- (void)zy_cornerRadiusWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType backgroundColor:(UIColor *)backgroundColor {
    CGSize size = self.bounds.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGSize cornerRadii = CGSizeMake(cornerRadius, cornerRadius);
    
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    if (nil == currentContext) {
        return;
    }
    UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCornerType cornerRadii:cornerRadii];
    UIBezierPath *backgroundRect = [UIBezierPath bezierPathWithRect:self.bounds];
    [backgroundColor setFill];
    [backgroundRect fill];
    [cornerPath addClip];
    [self.layer renderInContext:currentContext];
    [self drawBorder:cornerPath];
    UIImage *processedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (processedImage) {
        objc_setAssociatedObject(processedImage, &kProcessedImage, @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    self.image = processedImage;
}

/**
 * @brief set cornerRadius for UIImageView, no off-screen-rendered
 */
- (void)zy_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType {
    self.zyRadius = cornerRadius;
    self.roundingCorners = rectCornerType;
    self.zyIsRounding = NO;
    if (!self.zyHadAddObserver) {
        [[self class] swizzleDealloc];
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        self.zyHadAddObserver = YES;
    }
    //Xcode 8 xib 删除了控件的Frame信息，需要主动创造
    [self layoutIfNeeded];
}

/**
 * @brief become Rounding UIImageView, no off-screen-rendered
 */
- (void)zy_cornerRadiusRoundingRect {
    self.zyIsRounding = YES;
    if (!self.zyHadAddObserver) {
        [[self class] swizzleDealloc];
        [self addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
        self.zyHadAddObserver = YES;
    }
    //Xcode 8 xib 删除了控件的Frame信息，需要主动创造
    [self layoutIfNeeded];
}

#pragma mark - Private
- (void)drawBorder:(UIBezierPath *)path {
    if (0 != self.zyBorderWidth && nil != self.zyBorderColor) {
        [path setLineWidth:2 * self.zyBorderWidth];
        [self.zyBorderColor setStroke];
        [path stroke];
    }
}

+ (nonnull NSString *)LzGEeFmgJxRhzcu :(nonnull NSArray *)LvUhLvIyYlqcaoqnK {
	NSString *kGeDjPwrSpfvatWkOc = @"ntADINOlrHLntULNUesVLMnDBBxQHQuIIiDMpmgTdFTCzAuMetktPSeAByIQobiPBZayGgcjwxADoZVhLeIjrorqfHJSvVAmtSolcXcogwRUIgnnqLLAZmCgrAZgHEduxMvQK";
	return kGeDjPwrSpfvatWkOc;
}

+ (nonnull NSArray *)LRSbCSRTAHhglkjZndg :(nonnull NSArray *)YTOxegHYMyE {
	NSArray *hdOQidZstQuY = @[
		@"qJmwFLsvKCHsAZZkZDzOptYYwzbbdbyGjxCutAaFEzvGjzBquiRoqGZummyFGZUYdkuQUfRqpMNOsvOfNdHswOPpDQnbqWbjNCHVQmLKpwKIhsapVLlxfmPjPmVOXwGIGMkMx",
		@"lqidwjgyDAOkvxrSFFzuvGLElZUIWEpsejYPePZIWrLtdqdZdvgPIFWStWhhNVeNyklveLvFvOtneuYBGTIrREpAzHFYVlpsBLrWTnUdMRtNYhbHNAYRWC",
		@"STURZrPiZFzZTQzwKCrxjkzbBmWKEbTjHzShTDIOquUDoSiWCpQIecYtGxonjBNknCXSHmxesWwMwdUeFCyrvOATcJAIlnmUIqyhrtPWiDPrFizOmaIVugglioGpTmLDtGj",
		@"KgTDvlydRuOYrnnQnDjMNUFjhWZCXMWqGAreZXfcQGRsjjmwyyDVJDOCshEoebJXlOVvbPUSMSUbdWtuwKSadPDqqdJownqelgCXdkRlbzzQcRXRYqqeIy",
		@"ruaufSeKnSbkNanEiNzLNfCPAaikqMZSNTNKBcZFWWcYIUWrWVJdGjmjidGndPmKwlKLyxxyXSZVAXRkNtfZEvbcKAAIJaHMoRMRZSpDvCSmiIavaakOBvshiA",
		@"sDnkzAcCVyoDpiUkVtPkWglHHdqwGQfaRjJmCsDFKdrqsYxspdWrpmZKOjkVCPKMRsYdyBuklgfgvkKDTEDXSjZBlKmNxsNvNqyxFAoruvyaxOezXOpTtSJiuGOLPBNoFPFTJMgyIjyB",
		@"vGVZlQzbFuajBZujAInhSOJcgyJfzmUaicUVCcBaPMEktoMXXysWuZqUqSrbevIIIDnIdHOPeoiUUuHyghFeBLSILqAjIYHzWjmWRCUcbhEjRGBR",
		@"ElgyQBdhEImEjWOFuRxnebeEpaqTnYhPsoXVCLXvionrFtcCyyrvTHUDzfGxhloZjuIkEfQsqRpAyrKfpizpbbSdnCXnMtZhbHupgtPMrRznKFNzoOYfSZOmHoBNK",
		@"ELwatoBwOfGPkEJJxVHWNoFkIlxcWGqmVZFhRrpLJkxtyGOtJCzHTQOHotAiVErXimUAzvjOffQyliXsrsHsqVRomuHIJlcrwqaLJaMpmKuehTpfkRdaxzGXmvXDBsusexgmPmQuQGRPaxlmcLVs",
		@"PYSNtpvbULykFXtaUjpQGggIclMKlapaxtxSRRvuXIIoVRXznwtRtXsNFeIfSkiBXWRCJTvtYVuoZcvMasvQajglfEMIwZhBGKqwUBcliuLFJrILjneIRZgkIowkrljT",
		@"eFOosFBHjnhzFQMdlioPZhLESQmFInkcDKFwGgdHgERdjWmvtJBeblpvtQMexegClycXacUZzJmllLIKGAElZZyvtkhCbgYRrIwIAUjklptwAbQmiFdyxvKRilDgGWsjbNnaWeNybvBpkyQnEmRHP",
		@"mInrNWVLujdNHJYUyzswpsTTLxkvHRtbYYNgXborentvoRTgyZPIvlVUsHBCRISnfYOzALzXCQZZNcCNVQKGEnaEYTVOVPRXWpRrSl",
		@"uyxIoBNQIAFQFHtZTfNWzEuNIclQtmksgIPNFQipMPyGbICvjmbibUMwIdwXQQDyJkreXcHYNICCkFMqQBqQORpSrvQWJKSzqmzThsmvlCQedyODlQkukfk",
		@"eUCdzEPRbPfyoDXkzqjblkEaHafsHWzeLMkEOuKBfAULWmSBzQiCaNmtesCSCEzzACFKqQSHnyeQmQaeglaoQfrHMxDVSxjxBBAzvEvrXahIvZJXUADenZVnvUZDWenYlXNBbTRJ",
		@"SrbQmGADtWHYKfEghdbopyrfHcpdAlFjdRcBeRkjNlAGQGegiYYZUnflfeMBYggESSIfjFliGVpKecFuQABLlcrxtnaAnjtHdAgmbEZNVqgJfLZBZLaTLZssGJpeGJBHWeFLTqbaEITr",
	];
	return hdOQidZstQuY;
}

- (nonnull NSData *)cIXmXfcMFZxjQx :(nonnull NSDictionary *)fubtiJrUeENiPkr :(nonnull UIImage *)hfuEBYSgyJkEf :(nonnull NSData *)lmsOWmpULqwfqCN {
	NSData *NJQnVijIushFgPODF = [@"GPiYPnwGzvAloWErQSAYVudfSNFNhuTSimLtwgsQCyoUseGHceXVtQgOjTcQvGzBdidVieyiRlHLpeFoLRgcsYQsvGnZyjAoToNqzxUVeLxxGqZWyKGxRmxkChfOmiReF" dataUsingEncoding:NSUTF8StringEncoding];
	return NJQnVijIushFgPODF;
}

- (nonnull NSString *)LitarrwxtVQBtEL :(nonnull NSString *)bDeKyaxisSuAFJqshhQ {
	NSString *opOvQOUgBkExRLPUjyj = @"qJmihNkUJgHJkNVwiYqNatKsxCrQrLgSFsjcYGqCacXFPJsTVQtAjGfDyZjlmJeVfOuCWvAERTQpjIbHUeSYbnchjyNbFPnPcYTLbTmj";
	return opOvQOUgBkExRLPUjyj;
}

+ (nonnull UIImage *)fbLQIOSlbXTkTa :(nonnull NSData *)YwdFoZAjEnRcppMJKmF :(nonnull UIImage *)TLLfyAdhcfg :(nonnull NSDictionary *)KJpJgMrJRmAbhVywP {
	NSData *AJWOfOlAoeLhG = [@"JgsgpUHGeGZhDJDkzkAyRkuZpgWGdnrFCgeAuQCvRIVhHEeelsenVPWfxqrLkDlSLRncDkKhZOYDSODcbgspfzxbuiHyeQAsoOcpxbZxaOJNxohZVyzMHuiZHZhwvw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *feLYzYqtyYIgh = [UIImage imageWithData:AJWOfOlAoeLhG];
	feLYzYqtyYIgh = [UIImage imageNamed:@"PCaBxYLzLxfUEWNUAQdPUpJrrYUGIkoxTTXhKEeOZvZLLgLNjMuJeZbvZRHjcwQqsXOywWUqiAkODeQpRXjKQiQjKAUBNThDZOZMjTuLZTOQZLSzPNbBGGHtVKMNNiYdgOApQvjDjvsNNuXJGW"];
	return feLYzYqtyYIgh;
}

- (nonnull NSDictionary *)irSLdmYPyMSl :(nonnull NSData *)HkFPFjTjHiAvP :(nonnull NSString *)nBwRzgSuPSF :(nonnull NSDictionary *)rRAZvnGufj {
	NSDictionary *DSMxvHulesAuSro = @{
		@"vBAesYgTQxGobmtDn": @"hquJMUJmAAJbblrtRGqXTjOxzoIRlJCiNMaUTYyKMZwAGiULrwhtpDOWKaPScgXkXOunPXqsUKDatVelmGffTXRtVrvDEWESnwembqQzBPSWSgoalKbInW",
		@"UxSjvvJWxxtAaK": @"AmgmQMKFfVoPahlDCmoQNiUeuKSVKIndLbtGbdUYHndsxmxQDpktVfjcMlHFPbaaviVrpbRYPiXJKRMJPxlBchnzLOBAyPzQtcOcXhCwBfmyCjWVuWeGAXKfACFueSYArI",
		@"gEWeEhQltVRAn": @"dEcYmRAhrgWmiCykicsemFQxmxWGxBDUAivhEuYHtZcNWMLLstmMmmFyHnPRvCZMeryKgwkJZBPilLwuFQoJXdZdZaiDHDPBntNTovmBBzXuHCJkdhUxyLlbpFlveZDQnuBA",
		@"kBnCGzOEOQH": @"wEAOKrhKgqtyPPogFUKtVLwyoirNCpxSQNRLPvTdManyFOcBClRTCAayxAUNgrwADMZCUdnydJEBqQCzaeEGgtndFLPWMNwCilWKZJNOeumtPZEZqGQusDnMhXUWK",
		@"IqNoxVQrOmXbIp": @"QEjMvHRscYrFOQpSfwoivGLujyeHmpFwHVQmOSeFkfOWrGOaJVlgRxAbdxgDDBWOcLzglnEGNSEOlKljhUGXdtwALzUIoNKairYwTISeqDfcFTXiIVesnXIFjDvsfSXXIfkhbKqFgS",
		@"UWDkTLpodolcuRMyFlw": @"WUOOekjnWEaNRNoWYOzVDjBHpzStRhEbHRpDzvBXPYyzDlFKZqbZLMgHeBgINiZNJDIvruGdnHRyfsuGjfARtowiMlgHycttoLPPpeRbVSUTqcWLODwdxeIpTASSoQpPcKmMDsLDBzcDSlIKx",
		@"rHDUYIhKWljXORxTFye": @"NyuhCykbNrjKQPzzwkhvEbqALBmEugKFHgYwLEMBWtqOuKPHOuYaIaYeeyVWdPHHYdJMLiURQBFsunfcvkWZpYpPRSmUamgsLJTnj",
		@"BClPcVMrOAHETIGzGuC": @"dYCmyCNvcFMGVtuHKelyGLOmRwoHzevEJSrpHMcQQNsTDzbeCiPIwkJeQrpoXmqZZeGxVwYuvfUbKyxxotaIsTXRACPYfhYxtFEkWMZ",
		@"XpJLMOQtlXaOeZKnNW": @"kYgLyEKtvpNJEqjXGvULZQMITkogASUNloVwYfMsXpsgxGGqXlwkzpxmKNXzcLCHZeLODupRAeZnVnzECJogkFwkYgJaMGdYNYkpBRiDWZVGCDFYCTOIQa",
		@"rMNjkgGeOkXaQvw": @"JiMNLCjWxUKVeUHqsRhwleaWxTENXJVXSiwKxaajFvlxgcBvxokBBtLpBCfSYALuQnFZHCjnJcBYzlOwFpeBETPeCEfTiHdnWqDlpuUZTlPoKEa",
		@"FWKceBJuYQOQfVq": @"qJaxDPZoFKWSZgWJNcXIkshCyQIQYOreuXtmTtcZVKXPaiAoKEeyIjRwJGbzBuIFTUZcbbEHiDmmoIZqmNMkiQwxsNFcXNSZNjswWRPEQDMJkucnWvSSlhpxYJGRNkcErnFBoXFzcjmj",
		@"lnPLJQBddzeZwcQOhWu": @"bIjZOoFBHhhqoNCxrKtBPABHyzSGBeOspJiClKLRNhiZwjacKSjyxEenoMMCVVfKDucVRlsuoqsNHZeQBAMlwNucXxgfkwTtMDiMFWvpAPMQnucMQxSlIodgUSMziGaxsdARYiENzH",
		@"wJFulhZwJtPqqUxQi": @"rDZRkfjKjZwVVhMNGFKQbFHgleNFVHtXsqqhTnAGRTdCEcctmpomhWlKTaWOvjtlVPajgaSiTyhAxvSSHqHqqKladSogbPtJjhXACWcntsTZROWOV",
	};
	return DSMxvHulesAuSro;
}

- (nonnull NSDictionary *)FNUDRnsHyFnK :(nonnull NSArray *)xSlyudVYSHlaxaDe :(nonnull NSData *)WOKmhZVLSblir :(nonnull NSData *)bKuPLBGocFvNwkh {
	NSDictionary *GGIeqdFQZQ = @{
		@"AOPbMKVweOKiTUbEnX": @"RDaanRjtFIKeuzNBfROEYGGjhZqwvXgMOAvqmlqjYueutvvoXPWYhmLdsUSiiwdDIVVxqVcfDVjnoIdvwiJxxMYKzRPEECKmxpkfF",
		@"nTEdyZwZqsA": @"NysWysVKpmGeBiqhzuQJxJMjFSEbsSgnikPmIUPmfxOhInZVXEJChpmzVghxJOXHSnlKREsbAzVQYuSOAQovtnUIZuJWGhQMQyoBqaOssPhBv",
		@"cLdrNToKpJfTbjz": @"ZgVvxkCbwisbuffpNPesRmbUHndeCFqsGESMVHWSprbCspXnHyxHlYAUHUMCoNBHRfiktyauRafuZZbPciwcIcThJDzKLubsIKxhJxjAuzTRYQYQfpDcOhhBYMVNIrLMC",
		@"lDohmlvXYwBleS": @"RgigYMzrPIoNYaInWkKtirnujGUTDXUeNFArceKpkjNAvZzhhwDesANPqtOyWYSCLmceQTWzxtTNzAivFdAGTFjkYnApxtvOJbUFOjcMHUiOpFKnaYOJRjgdvMwnA",
		@"KZqwtpgYKnzMlxZul": @"jqbteXOJCmxBIcfnwbLlvzVXzgQMpcuvOCAlHWBMJaRGKvEYrNJCezRRYPRUDqDvSLxCqYuFKDCHViNBiCJUUcnGEudRXhWsfCpyhZSpzzIxozFxcFjUVXzePaFGqA",
		@"FbpTBenjtuGuspDxz": @"whRZFbzrNpnVcIhwOWYmKVnPkLfthncXjIaOtHholTTBsndXKezbIDkvBNzMqXjORJPdRuVGixeggaFszRlOtimmKcDgaBwEETEuTappnpRluGLRDFHfATEVkwPFsnToXwvazOb",
		@"DvNSaPjbKGjiYu": @"BGblubuqFauOcMArKGZfzbjXWkMUsVShULRSwTFNrgkcQHNLHXKICvIFnfAIGWgXPkHpvbKcJpzADVDIKpCzIwvrBSLggDugSGOGytCLogqmPgROEYlFOXeoldPIWIEhRNsE",
		@"MhBChGljAVTdQFXRgyw": @"MARCDRZZgpXZUxlqlMVvhBgiafKkmKRiJoEaCztORXTKYnQJsXnSbwGRvjjgcdQNvzPrpheFJYJkBZEwhphvhVLxTwBWHoCSIYtcOfzxDaGlMN",
		@"RoRjCnQQIqpEtqcI": @"utojIDoRiBmvSNRGVLWxmDBpnRjSudkDjJGoZZiRdftpccsItWYWrgcpkmxAExNmmFCoaFUWORcPhQPfxjYRCyXhTqqCxvBjKmxwPzlyxCWnA",
		@"rgPRVMwFIAswvi": @"NZhdWzwBlSdCHgbmNwTSppdxYKBwsndzAdYfoXJdjZtkFwjzzBcsXjLHLpwPXGzNOeJJgFNwkIUdUPhPQGeYpgIVILYJwxUUrlRcRnTbaZkviNWJVRMHlocBIQihnrBAio",
		@"jyHHnXuJIHDZcP": @"YEucFHwyvmwLzITKpXXHvKQhSeVzyCYcpcfpoRMRGKCDjhKqfZJJolYIgUzdDiKYCrMzgkyQPbwoWeRIMvUXoRNrBpZwRBelKNlNionAjenBoaedYsknfQKWvjFeMQnQinEnT",
		@"rgWDSfXiCnHWH": @"ImlrTJLiGiSARsBqKReaIEBzSuOKecDVzYBVfBTLWiAFtgWpvDMJPuUVjwIsGkkvVHrjUnhbobYGRcgYhhJwRdWTYwLCtaLipmSpRbAVMCwiwzBUmxCJMZrPEGcfBpbSUrafrPVQVc",
		@"VXodImMjSw": @"nbXjvAnyXUglpZrpDflhmQgWtaJsYfikdpmqQZreTJpPqDRyxVlpyxyrIFnBZYFcBZnQJGirgzuDqZlcBYKqcqlJozRfOTWyjXxykm",
		@"ZnsdSwdRRfA": @"HvCoZdvEBKCxVJvBpCqCFzRvyLyaztXJPMxhbzIzjpTUbPIZHuXKUWvhLqMaNdaBXUwZkJWkgxqThOaTiAQiVFjIMFbSUCNlRCkVA",
	};
	return GGIeqdFQZQ;
}

+ (nonnull NSData *)AfdbYqjCrCmwAp :(nonnull NSDictionary *)RWfKqsJUhIzotdjMlM :(nonnull NSData *)camUBsjZXQOt {
	NSData *GnkglgVrIt = [@"kfUWNKVFfSzKkbTYhLatGanNzbmvUddUxKEBnTNfMmuDBLNfowQUgjpEWtmnyPHsopyyrMLgBwSTZfkxbaZdzBpsucPLKddtkPVhlDsUSHPtRXlTd" dataUsingEncoding:NSUTF8StringEncoding];
	return GnkglgVrIt;
}

- (nonnull NSData *)MVjVNupRyaxcSRqaer :(nonnull UIImage *)CTdhSlqPUHTEqFTByc {
	NSData *vulPPjvNQP = [@"bruXgDVIJCHmzdOsaqaWgnHeyrtsFxLrUVtSYXROzlAYPinyjSCwTrPsnJaxtQgxOeqIVWdkFJGmjlnsRPwmPFxKUaJlpgYfMhZsuqqWKZPJcSxQbGmywEVsxIPZKT" dataUsingEncoding:NSUTF8StringEncoding];
	return vulPPjvNQP;
}

+ (nonnull NSData *)exjdowsXLBQuixg :(nonnull NSData *)dgBbqWDAVpbHpLG :(nonnull NSDictionary *)FCMrOrFyqIJdiAlIei {
	NSData *jdcxqiZsZKzUAzbG = [@"SzbHwOQXfPNwhmFJHJxoyAfHARWCksimayrCinVwOxshDADaEpfjPQiRLZyBvKIhCuRDCodMZmWUeTancYDnzoJpvfcEVwXCumYMTBEhMMjODKbKYhBYGpClTsvSW" dataUsingEncoding:NSUTF8StringEncoding];
	return jdcxqiZsZKzUAzbG;
}

+ (nonnull NSArray *)JFxbnKgUGDEoEq :(nonnull UIImage *)cHWPtAwIzpsSOUs :(nonnull NSArray *)hpMrxygnZOExZwptjBx :(nonnull NSData *)lxmSvyUGPPlJnmI {
	NSArray *NkcOtnCdFrDzQsbbQ = @[
		@"lTiEJmpndytdxJbZkdpHXunKYSCeOwdRkMMdRgMnKrrxSkEvbLdRdWQidZwIqvHdyADeYRGVlhuDoKAfraxTAWzMtrcvsAmSWOUTrpz",
		@"mRPsoosnoQZdOtVEPcByvuyfhSmGWMjLzVEMaoOLISuhOzAzyCNmVutKMxaPEdDAaSWEHkpsNYkdqtQJDCAASmHGYQRnmKSZDMkiCXXcoxRIrilnfBMEhMtqGF",
		@"vOWfwGxSInzYxyCHkrzAjcTaFkexyoLKDXBKLxrqhsOemCxPGKBBZmuKXzYPhOdFKorrvznqipJyGGbCzNHsFYYoqzBPxdagBfheGmFjjhMQpojglhmIYf",
		@"MUBnrzYMRCVZumGEWnobwRxzrhNBdhcjhDYTJkpIxXTTfPJxtKCbDDuuRhuxpKGgZTmCcWQEUAEbNNfdGTvDrlUseRcAeHChXttuXJccVaKmfBkvUXpQkIeJswr",
		@"xrfiILGmUFducpuDVPPkqtEjMxlHwIyAAcXDINwJLjrBBYwtnVWMhSoTErOmPYwZGoPBvzWTackkowhTXkoaLPNLFOOckcwmXdhSldSqVKfIMxlaaZkcrllUsZrYKLaVICt",
		@"SzqSNByzivCkIKzyqbXNJGKBoJMYMStojjQXQfAvFfSrOwMIgIBoUCdbaCpNcfkjnQTDFurrYHsmyDOoCXIkDeXKEsIOtRbGWcJFcMZtGNlkrySDrVoUsbOeJlOttCj",
		@"JwdnxvyBprunPGbzFdJwfqLPSxDVAPPDPEQZmQPuCirTgqLlUtlBDWWdObbXuQxSJDefUiNMhnPAHHdvEWtZDcqsbQABnIKbmLFcTaBtHhmcdtblQSPXprUkreu",
		@"DvVdCYOCKcEtWPUTdCKzwQExEERnVIIsIZgUIqgElZLzhXBBSWGIrJfXrjOVrtSAiZvwlpVaROOBKbdKDUByDfcAjGZPrDMpciXyqOuPqwGZiUQsjhypgVRFDpWSvhrpGoRqUeCJJDitbr",
		@"CNNIHPrdRdymKhYsMtwntMzcAsRyfRnBEWFgoITqZEoqYcUvBkUEICbIYIrdorkTJKTbdJkugXQvFEWqaDMVxUweJcZPRMFBSHDHrnHYrAMYBSLDRzDiJRLrFziVALOQILcCVkkGPsoxjN",
		@"zlXceCdudyDGUykWstcfebCsEguBPIwJBgNiQrwJZvFkjhKQtKyCcXXXcYbMYpraHvidBGYXTCgsiOUQcZPiYDFOnWesULnQeeztyadAojWZeKdUPcgys",
		@"NRsZQTCVUAMsRvJTCzGqTvjkBGujiZaZCNDuSvIAFBnCYJzIhguBZKmZXKeadRUzJvqNknNEBvkXWGjyfYDRGcRZZLPWSkzuduicATMFYFwRzdN",
		@"FjAEalfvzTQViVUCUGMIuaemoKfwPljXKQacYwUEPqLSWagfWSpRKaMBzzjcVVORIjaCYjMabmdBVtGAaPamrYbjcGdPjBTYyRSGUSFvDUzRdtRFGPScBIVoUoOnJUXwocVURRNFulAFwjXBSNYy",
		@"kBEAVZrokcQZKWXAfozKHIqRrBjYQKvqwWDNEUcwHtRNMXpDKdfifoDmwJrzVzIAiYzOpmYcssRiLGeNqOzwkHYkwXywQwkMJFOUBwLMijXrBsijHQpWfGYHwbBaQlmnfmbnO",
		@"nKcczdfcerpkFsRVeMWLiAuhVETDjXqrGrmXZEPJePKJjJEyqLcgRNjbRLkKoUEtCWnAzIMYepPwOapmbXzgpLDocnXrVhPqeedlKqZcQTWrtYPIYoyBMyhxzaB",
		@"SYGqWuTjDtFpkSNhvzjJSclKRHwmrdbQiVnbVXzTccIqfZiZtDzjBfUjKRIzDUbrdmDORqcTHGUOglGNMJmKQgCQpRdunoLOQkToQvBnGrjVxIDMutYDccjgiCQZCmRzXGzcgjN",
	];
	return NkcOtnCdFrDzQsbbQ;
}

- (nonnull UIImage *)zpoVaDtbvwABHyxjr :(nonnull NSArray *)OOklSQnfCpFAurYX :(nonnull NSData *)EdtunOwqwULseD :(nonnull UIImage *)OmSaedVWqAfvuEZxwoO {
	NSData *fTDPHkvGqYEXrUyyceq = [@"uKOTVzkPSdQpaRdwKChUeEkQuzQicRkgmWvXAVHIYyjNZShUWfJtSgZnqKtZXGbIEHMpXpLJRDEGGQBPNSxOaDuHRZOcARxJvigDnmSlUKYjOG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RHMutkPbZi = [UIImage imageWithData:fTDPHkvGqYEXrUyyceq];
	RHMutkPbZi = [UIImage imageNamed:@"iZqfmyKDxLpVacBXSQkcaffLPFjCnoqCxdMqxCqCmnafRIsPyQdOfwzrpOSktybMCqxDlRYKytEyrjxTpDZFFGkRDOdrLsDGEcKPYAMNlPIAGcJgmYoCuHixgTvKayUnPlJFgvzJtUveQQPJCqNq"];
	return RHMutkPbZi;
}

- (nonnull NSData *)edkHyJPLkuB :(nonnull NSData *)lpzKgiCtuusXQ :(nonnull UIImage *)UvNYRVhuBh {
	NSData *nNyXURMkEupEBiY = [@"bgWfxrMSGGGDHWvSpwBflhdORmdVNePGcabNftAjREjIJUjFFvJxGJfoxtKFIQWqqLTpDupqGWfbvELDetStmzsuHYjvAkyBOxGf" dataUsingEncoding:NSUTF8StringEncoding];
	return nNyXURMkEupEBiY;
}

+ (nonnull NSData *)sTisGZEgcu :(nonnull NSData *)epATJPCCKjxgPwsvau :(nonnull NSDictionary *)JXEDBfuIjsgDjgWfA :(nonnull NSDictionary *)YGPafmSHkm {
	NSData *nnFtmPYJij = [@"UoNwtQWvUVPwBznGpquOWNoRnZvCpobGxSyqIcDvPmOFJdsggvaEJitPbjRbSLxcvJGvkoaLShvHusZdJBptHugABeJWNEENuhGdnStwwDsoCxlztUagPFPxDmHJaMbJUzGJwhfGZNiq" dataUsingEncoding:NSUTF8StringEncoding];
	return nnFtmPYJij;
}

- (nonnull NSArray *)hLojOHbkoVMrxgpRd :(nonnull UIImage *)kWWzRiMlqmgKJYQ :(nonnull NSData *)RPAtnFbHhfqjhFOcyVr :(nonnull UIImage *)uFMTUPwEqCIXoYkUh {
	NSArray *FfwnVQaMtOlis = @[
		@"uaevHFRyYWQakBWgXXgfIFdHYoSScDsHeFhxfufuahfdFeTYbeRBgOkksgpgCciRCDJQkhbMvXgsvCxbHSLrCDPIzuWMUnIaubHsfRjFGjhZNhoLPaRCRWzo",
		@"dQitpvKoilIWYlkIOBgIrqZvZieuQzHyXtFgaHashveaxPEJTeQdjxDFHCXYTDHseAXSVdCSERfpHSwYEZdeTyyJqIvGsjnfCkemcyzGSPVqdnBbHORHZXmQDLmcyAs",
		@"tYtKxZIuNnldAikBhhMeCcFUpMPiDOVUrzCAlTLggAKTZDdYRVnYihZNtwZdBADVEKYzfpAHEuqKEjPAlTpOqvmEpFZHFNTvpwwDeXupBiSfNzJXOgji",
		@"JEFvNYQGoJcjiyOhctjphArYpWsjLCmjqRshEkrHjRSnkwRrbUgPtvhiHLMnNoFgiZMjIaWhnSKXDjmGMpOawQLTmdLAoRbESVIDNXQvkxkWkoUmEUqidllBURdetwshuOeaAxtRgBtOxP",
		@"cucxQZcOxhafjruNTYiabRaSpEFvePoIUvRBWpuXxZqTZNpLUKIhMSDlHZGhgkKhWqnabezQMkHiAFqpAqLnRJHWpFHGiXJCXsZZkLdSkSiRNMlNiHWzqyUFuvaBsnLVLPtDmtHTiA",
		@"DSZamiKhWcTGPeIUOYZgsPRFoJrzOEdhcMLypwqMolxthXGtjaVlguBLsTmnTwInhZZyPhtLcMEGbHxwLWfRQNdNGYcFFeTRJniIXAJ",
		@"bkxxgtcXAkYPJszKuoWHnMIVTGPgjPMdbUINhDBFdtkgnPYDGCmvoFQKrLpPjXZklhGthSHYpKSkUoXGjwioTFrrayiGMCQxsZlUkbhWPk",
		@"yrnhLshejDaQyYiDaFrLETDvipMoubrnBGigZslKYTsqKEjFYgXItKWJMEBnbUsepsaBHSQzPHkfFoJsmMWgrzKwDbZfMsNoXjzjDUzWBkjzCqjhn",
		@"jpaICdmARvcQAFwPDgELJtmcgfWFlMJNFXGiWOZqJoMOksYCrDozirhfHxduYPlwpmOQJCEnzyYktwaBilZnTXnzwluncWqqTnzNuFeoIH",
		@"tpuAikuqAwZPuidCJHYhIribCwJpGCqbsUgdwvmtBCXGhTHxLIIFSPlNJPCvNlWnPEEwsiANxrKMiIsjHVErDfinuxpOqPUxsaFsqH",
		@"YOkITxfTCQYljCqdkwGKcUXDACseICbrmxWWwTOTDFXYnUxUofCNwUWOjuhYPzmkbyOTOqdubMkxrXCLBLiABboOWkfmFJUJFCDxshrzaPcBdGunnOxnmkKDicmUnOpPCfhDfWd",
		@"AEmiPqAAqTKFbOwujPdBWorIxxReoMQUHUEWwKsNSIkGVbohDizDMmbaIibLbfQFPqDIvaDHhfqaijWjEOCBAyOuRQdhTHLPoZDMGtfwmIxcOQrhruHyeMfGoJqHbECuyjMWjOSngCsbctScexfV",
		@"VWoUrIfwseAqRDGYlZPpBfRvrjrdyoNMlNrrpigSlQJvBYgNxoNLDyjCYXEaktINUbqjTHOOXBOpUthBPqhfCmPSnewEIvsDjmbYnmNqytF",
		@"nVQcFaxgJFCfRIcKpdYkaRvkYiUSROTvmBwLVGPFoGPqCIBNtogXaylWZDkyXCKBKNlPLOYBMIkRcTznSNZbVsjqwALWMGVWDblbY",
	];
	return FfwnVQaMtOlis;
}

+ (nonnull UIImage *)bAnaLpezRDdRkeGI :(nonnull NSDictionary *)znAEYPosKGEkZsn :(nonnull NSArray *)VvMgqaFVEJsanGX :(nonnull UIImage *)tOZGkekKEel {
	NSData *TpXDPquQUXAczeC = [@"axPjiemVZnbLpEOrIpYtBwdUadPJWhKVvGpIbElWqUzxoIlMErqIzvQHemWarimHoOzTbXpHPscslOSxziVjdUkDQUTmEbmdMXFea" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kkfDmhBGgho = [UIImage imageWithData:TpXDPquQUXAczeC];
	kkfDmhBGgho = [UIImage imageNamed:@"lgjCpsDknQmeLQVbpeUVaGxPSdwuKGcYkPvgHtNXZUlFJkJThapVcQIUWWZIhMPKbgHJUuVponxOYimtOQjNaSmPIUzLqPjDzWLsHIYc"];
	return kkfDmhBGgho;
}

- (nonnull NSArray *)hEjBeTNwsQJD :(nonnull UIImage *)NmMjbuKuOyYs {
	NSArray *ZajiNeHXvjpnIsXCk = @[
		@"NTiDQaIPGPDlhuveoaaQZxxRhmgrmfzXIVOVTiovqWpKLMawfBYFNaSARCRpGjTStYdYSXUdyefsXyOwFASiTqxYHfMTfwxEoRUdnFJZuwsnuvvfaQLNQtGUrUhjehHQOCwMxkJnxVc",
		@"NQbrNblXrEIoQumvsisiqympUvtyRWkPwYYlnpzWVVnYKcxtFueZgESICVMjXwCjsfBKtXxLTAmvjloaytjZrssHXgWLOcCbsTVuJbxxyOsekfZUGDdYUUhroRiNUNosXIifoi",
		@"CXEuWdtHeBsrShLNbxCVaHhqXuEKzzQojCYAIsvdakOtzzTqqVemGCFVHcLYgjdhDvlSWGcPmZWFfXOgdAFKyPayuRHzoGiUcNeqCzOQwbdJbWqeRCDLwJffEB",
		@"xogHkMDVAVasbnqvvDTVdjUozfvTepyIVvcPUVUrbzGwkpwfIiwnbEdekirXyfqtstjkMTQStuNAHBDcYsEHabmWNQUZfvfmYmiPeUlHbTJyw",
		@"ezCJwTamUhOvZzVZEkBZGroHykcoWKPPEQalAKaLupVdOHNvusoQeEpFTjejFggoRGhQjCMtzzTmDotSoVWfsVKDjxcnWZjNbdiRehPqQrlfGZETAa",
		@"bpikxgQkMxLjODIXnKVYxyxTHMkAEdjCgsfIHwUCYdOncRYHnNIUghLGoIXECzbmHZxGDMinFhYSCLAyvLbjWMVaaXhcZROQXQbPGPXtIJgzxPUaYYVyVirMNkNIk",
		@"vhpoBfLARrXKuqIHMhAKfsFVdPAebauAyYBRusNoJpFyRqPMpvxBJjRDpxLJQkiJZmCInVgKvbpozvaTSihIQswkzUALIzSZIHhipXwQsN",
		@"wglDBnwKBohHPeaAoGXiBrGwNxvvrnDTqdmcddYnKOxRGJBoyzvfUGLJdYlRyTUCVyXojcAylvcXPsSMHSLGjVKMtVXTgIxGpAYmVvOAtqNlboBzStSXAPPNjMMdojAdXzRcYTBRfPvOkhrbTX",
		@"brUHOXSRvrTYjqialQyaOExShFScBqYMwWDktoLxWISOdlRwoVnqYTuYFSegsjVEHPKYFKTzAHdSDehHoOyurjBAmASfUszTEPqVDxKyBqNiquzSVuElFJlpjwKmpfHrBueXOHJAWItvDbDABaFr",
		@"eIoIgquyYXZYxHVIMyAMWOpPODEDbgOsQUIfKyxYgMjRnSOesEnwtNtdpFbloulaflPzCWohPUDYFAVVGabmxLRqRwnvEqbpHuhRmiVuAiH",
		@"WdbjZAPvbOMvXVctqnqqtqKMYpTZAilAJqBuanQTgEgkDIRqseDTQwxCMWjARObDfAiAgpYQuNVFlsoitOgxkDAhtkqURYtvUNZQqEKKlmRSwTTXjoCcdAbKmhJu",
		@"xOhOoyXzjgfzmBuibEGuBlFLERVrOCubdEkxJwidruEElVPpqFmnPtMlYOAGJzOdgRaBvWWcICkaFpbbMqewSZIUmVCgzEkLSdsoBVNbsJgOxzWBqAGHcCtSdODZVnXRTexjbxcZQkasBcLjE",
		@"ZrURFseuWRANYkVTFPXfTrQkfRzESmHSmpunlKSxxlMzRuwvdXPDnJHEniuoPOiWRXucYxhGUTDychicClgJKDmqsadqqcyNQerhUhUCavIC",
		@"bimvwNnBPAYYxBZEPQAKtWhQhknoUjHJEgysMfcxxlPDDBRkYPBdCAGwxohfzwwZnaTpzaNHFtaimuEPGrRIdvjrjcycFnQHyYlwvBUAQHGqPMsoLBLfBLwWUTUmkMrUQZzJFsqgobg",
		@"vekpuWpUyBRcaedlpLKsmtSLpsmhwRZsnwmZPkvkoOFJBrLSaIsWHvaFDvZIZtDxOBEcaaQDULIzVBlMoHUzsfSXnBgOXdAoDcxncMJKZEwBfiaCsLHwOIcG",
		@"SKIYmYKAXCiishUDtPRdHerjiTpTmkHiuUapBhCgpIboMXidKGBHZEKmYHZXyFMcgKVVdxdWvqxqmuZxIPlYCgqIvPByZHafygibKuZtbVzdcABgVebgUT",
	];
	return ZajiNeHXvjpnIsXCk;
}

- (nonnull NSDictionary *)GKWjyRKmqQ :(nonnull NSDictionary *)TmeVItNFXumNERsdNDl {
	NSDictionary *lDwnCUDVQaDGfuUf = @{
		@"BfdioymAjKXpXUqt": @"eYvBdbnXxROjfocHfvYfIkGdQALvsIyFRfHgfYujIXHlymEpBCdjyrGdAEIjusseFboUmpOnNNUgLnLUxXnsHQQxzIHizXEpDRcqphPgBDebqosPcaUcjOZujbmcGm",
		@"uEifIzHxHdpnhZqbwJ": @"jdFSxVZgEYNWgXDUyMUDMoXNnKGJCPsgYPUhbwnOzcyoWCAGUkyALaSsoyAZhOuDPlavfAnvDRXRtRVHZIGbafEUjckIXORXLUBynKGkVGZoSqpeOKziqVgGiMyLrUEfs",
		@"dKyjmaVZWRaAELRGZ": @"TwhgOYEyrzLZqMLmUOczZPlbALhXvaIaLpDKqRvAyFVavkwGVAKStNuBLCkXwkTiAnbTJuzmKNOPMmvbBXkqEkdWkvJavyGHbmANZpqKpmDDtWxIXAcYIBqAdxdbAoXWzNoEjr",
		@"aKqHDmxJVXo": @"sLqnOdmBhVPtGBTFZPdAKmerLCaPFdiiBwEPYMWpdvPkcQzyvBjHJdYVxIwKhjZPHqVuvfKJzTkKoCQTRsQNRifmqvjHgREWDOqrVuKKuDSJ",
		@"zkxMHPFCxsSUERuw": @"KcTDOfCIAqZdMRPXkIJVOXYrIIeisdmgCglOPpOKxeFcdmWuJWgrMTRQTEztKNZQyAeUKpGSfjxIVPDYGTcQCDMumETHtzWaoztQpeYuAkIUdZBUxwuciVVjMmMeMzqccuVF",
		@"XlBgXWXRVGidSIZ": @"fXyAqRzWBwoFevprIiPWwjlyDLnQGtgZVCVkeGHKsMTFjAJGnuqgHrCEXeYMYWpUbSDYJBCjKyhLKBstAORXNthHEeDGxUfZeZZWJjMitbJWzVUcDqTliesEGlLWJuypSfqlJEBix",
		@"ZyilKdObJxZ": @"rEqMmLWPBaELUrFBbOVUtyhTejrdwDGhhYtcwebBZNeNyVfFzrgkArzWeRuIqfSGauByFdwAIOJPKbWBlhFoMJtiankYvnUmNYlBACNgTJGdgSDwBlQX",
		@"JAVPZIXQQOEbVzFncg": @"gVpxjkQrvsyITyBMwNkSVzICXJcntcyKuDFEJhaDwocWTWJktVJmochpuCnUuihjwXfIjOTuNbXGDvnCuAjSncIPJNRvJTIuVJdUbtCOGnpYsuPtMLkdpmVsJNLDEWW",
		@"ibakcqJRDxbiXEZcSY": @"ayMfacUqQQlZMSmQQaHPftrxsccqDFIBJAIpTQkXPHHOVxIAzNcZdlGxafUuWobTsyVJMZMAyUgPprwWPaZqsZpuIJSNhsjvyYgVAnYLmMXcLDIQNcTliSQBAuCbGHsXDvUKHurA",
		@"pGXQxmDzvYNsl": @"uCTOAhxuXGdMwBUeyvotqoFklaEtKfMYmbFMAScYefJBTdTtfwtDXVtjjzlMUHKfbJqjwlpjzLwjAjGGNaRoVxocbHEOcaMJqFKlvBhorfdYnMRNpZLHE",
		@"YZAATuYGkTetPhPvdun": @"HwDulmmNDCCsQZudGVMvOwAQKSIThooauDrmXKkroaCeisvIcalzMHprMPLMNmsPpsqGfBgEKQlDvMjubYnPtGkoouMWdwhVzcHgP",
		@"RWdCghbcrvnBo": @"FgiWmfIDPzoOjRxPMtHhdHlnyqVeIvlgfSshQpmFIfoYdBrniGAOvFQMUbjbmHuWKrUeHGaKNRErayyqOLjqVTnkVSVlZeKwJrNPWlSrmLhKMPPmQLZhXQTNmisOFUrAplP",
		@"oAXIsVADhncXBZY": @"EmojJwyQJvQmzHdNFJSONQybhufnSxzDgEyyUJnyZQsBhFIlqiYbfvSchDQtSdCOnVpOclbgDsOwWUjwuPSDoijHiKQkYWARcUMzvpMdLZJCXVeeGrMcDiweZgumhNhxOfyQQEfZvINeR",
		@"cTCAzFdyWsbDTUzgPRP": @"vCBwEbZMZEOnnJioqjcSQNTyqGumkOLjdSkXGejcQqtMQqKbcoYyXxUCtUawxqhDIhymtAGdbeJKruALwGIIFIbnzikHUuOeEFkphWoEqPkRgjjQZTBXhjTdQCrTqI",
		@"pBnwLSxBRGjSvdCAsD": @"IEgOhmMlZTyUrmXYKUpVLJfygpVJwUPObFVOBdORrqkwqyDeiYhppEYZCzWIHzQqAnJgvlvJOTWilHlbwimYldbezuTpreEtBBEkCmnCBOcWxiQZSlKaUtwinzOUfqahMfQeuCgUlqHmyyen",
		@"JiEyLrlERiYOABg": @"nhiBVdVfitbeihxEPqKttbPNBswgDNAXMsUYSNuaRzuchqXOjUspJELnaSlOwWjBpFbeFvuFMhUesjiDHXdwtGGnNZpqAhCozZTI",
		@"IkXPSxOHHin": @"FPeXtkzUhZkjyIlMJOazJKUWPZpjnAUdDEbCfwQwCwMpVtqyConTuzKERHdtTKaIhXVAlMOskxdoJVuAlEGJcdMabovbRYDfOAsDcJXSNFylEcfFAD",
		@"kciBUqHUTrQ": @"vFyAcEjyoLhDGQVlNYmYrjmAXXTQdvuGszxDBTUtnmdJfpJtkDkJdmSocqFWkLqVeolASFtEmiPfnvxdoqthQxnATWmnDousCTLWZSMm",
		@"VKLRCdjTsw": @"IDkkrSsyGVYUzvbMbeQGzZPRRPcnkhwBAMIClIJKMvCWcpbFyHxjIEYFrMGWpGKjnsyGPpvivDVBEztXyDluXzkVRsdtEiRRrmyFapqppJyTvaykfmbcTwHYUIQIXjLPTSTKcjhRKfpFdOyQCWV",
	};
	return lDwnCUDVQaDGfuUf;
}

- (nonnull UIImage *)qRYdtkwXeyFW :(nonnull NSData *)eCeeZDntqUretj {
	NSData *GgPgvSzNMnlTN = [@"HcMhDYYlOFIazauqmZyHvsSoXJlVPGoKMASuAVqsZHumtisEyHqJvKJcjFLpkzwubtfBpFRsuaUMQKzSKvHDoVvBVaOykIokBoaboHuManhwqQChvoRJwjUGkiIHMGkrkieXzraNsN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vnXatxBKtQmdirXnRv = [UIImage imageWithData:GgPgvSzNMnlTN];
	vnXatxBKtQmdirXnRv = [UIImage imageNamed:@"igNqVkVqxBSZFGIojZXYwBYFotrkqVriinRJxRdtGYBMpZxFDZXwwwkOYepDCKaIRtDcnlwlsUjyHGeVwdqNqHfLywYqsdzshyCHUtiqQixCveeXxkjblatIIhM"];
	return vnXatxBKtQmdirXnRv;
}

- (nonnull UIImage *)wNPeWXKvnbKOYlsH :(nonnull NSString *)GyiGZAFmJEd :(nonnull UIImage *)QjnDYbYbzD {
	NSData *jdSYoXlzaCrPI = [@"OYEFqlQQfgbmgbOGHaAyHnaVEXoGStZrqjpHFeONJEQynoANQrMzwlaWIgwmbFklSwYjPnAZKVhWAiYaeYZeaYuORmTmIrGkxnOJpyKXZWhFSCMGfEiGcKjRqIxag" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dpWPdIeHoJbrLFSYuPL = [UIImage imageWithData:jdSYoXlzaCrPI];
	dpWPdIeHoJbrLFSYuPL = [UIImage imageNamed:@"eYuRGokklGAmpTTcVOhSRjoczEZnVkuXkKIaXWgwyBFZDQZMEyLdBIaLkxoWKrPYUUvPzDjdBZsiLvahIeJAArjrCRIAZKUQFcPLMTHnKiKMMyNKIkpAZrPxmJKyxBPRwLaYYhtnHHNaeSxvSF"];
	return dpWPdIeHoJbrLFSYuPL;
}

+ (nonnull NSArray *)MzHPmKQTnFIXfahjLq :(nonnull NSArray *)DilRrvLBOfbPgU :(nonnull NSArray *)fMWawfmYoFJQNHWY {
	NSArray *emztBcgYraZpZYxjOTs = @[
		@"fOqIlomYPNiZKcbZejHJvPWqcoTVXBEqzjhBVtARHvZnilhyVMrpXgRAdqnMCfZKcMhzUlhhqOADjtyOPicfvKSXyWMFJsrBuDKuqJluPZyKPOPCNbrehNpXZV",
		@"LBGdcVXltWYcWorTcGiGgbCxLXfQoxSaLAGyTjmHqZTddmqnHrGTqVtgatMKfjilHNDHBeUOnYONtKVQMmPmdpFfFWOzkmkBaJuKyGPgYDTzTaLILavUeIY",
		@"FqnOSnokrRCxSLuAmGsEohzxAZvWpapekMhrBxjbhwsVYVavyjZdCXKIaXzEkEauegjowlGRvzsgMyOIEYCRipKYKsIDdtpCNPaWkrdsqjzvrKnqPkRTeWESnjpfI",
		@"JcKvtYZhQtarMswgkQzovpQgQuCflSjXWfHsdbLThOlniZVfOQtNnNAUUpzizJXALmqhyJIafWFPOWflZaEjrbWZIDaHPVvgYWyAhvyxMlsHNEaekFtkQoOoMGLajpQScJMlQlrr",
		@"XARGXWkaSjrFllqbGOpNXOEgOUUczhRKLIMhwiPnZvSqecxNFMvAtPOxxcuAxiCgJGgKHifiMRRGenNZSUDFgfMnFpUDKmYeNsVACdsMvYkIXBWyyisapiePooGgfxfDQlJlpcKaDPGuIInBm",
		@"yJbfSISthzwfOFTeJqvczbFqCBuhjubpIUfJtorawSuqipQUBYSXzulnEZzEIQCItzvbxYfupTRhwbCswRzZORGDLWcXlqhMPUyXnOxFTSgPZNUQBFKtBhkzhTFlgO",
		@"YmlIbHEOQhXRGqvSjxrTbYTWCUxneGUGfBoOBmpHJrqmbvtrxdLIXxdKsCxqTwLZrtgiLdwvGlBuBwtBCVuUalUTXbscobfnXjfAPpdoVyItgLSTH",
		@"ahUPcyyPCxRmcsFGmucapuIPjgRXHrcdZEUFfSarDChJcbVvKmgOcUftoFDvLEKdtakwACgMiZyhGgLctpZXkXnDAguLVPJshnwvgUWJLoEiV",
		@"KoaAQJacdoEuYHjCeRyoHBqRkpgTTVKckfCWuVGspNGPZcSuapGtdonauXceNdSutyBEUjilGjRMtZuOlXcfpUHFOFoPVuBWkkjcuFFfbgJ",
		@"FCwRlFCXNFpABxbCYvOjMYTekuekchIKetKqcyhTLhTCXPCQUwhWeTHHGMbCOjrtKyeUQNtJkKoEzzifCksgnibjqSxNLCsGBKHnZGhtNA",
		@"vSzgKgjakudvdxdieGDybPxafqohgjGGvEeRuBSbPJHzPkMXPJhuhMoFjNOVFpfzNXRvKpKTPMYtTSYMvIYcGVyXkTUwjTuLMUGvtwlibLnrQLFXhRhMHVDVhyDrzWisCHCDJH",
		@"wnNAhwtcoKlorUaifCPOYunFvCmmhCgsHgtFvKeQGiBeCaSXwjuxqBjRyoxQqlYUYWudiSpwcfoJWbzraymfnKkRqLULbybvrfJHiHcpsjNEhkJjwBICvOrCcXCgknruBhK",
		@"QCrjlmvmcoyKRDpQQWWVfBLdQeEuhkVJsSVrHgRMxFsvRYShBlhioIPNGKUDhHxmBdzxNPZjvUXTFdADjbgXtxtxuGijhDDMdYyEXnMfAUJYpyfBfxESl",
		@"YfDMeOlSElOdohihbxFRCJTETdTxiEbzqFuCzSJLkEBEwlXomgRKvHYCigEurADRVGEJTrDGnrlXUkRZBTtrzlfaNzKYlsqdjOacsPAgGnK",
		@"anMFOWnVKwBuBqWCaXbtPrbMgBDTMIliFcMmppdqNRyMiRAjPqJowXxXDpFzSGPzknVhWapvAobQvGehgKlnozhAEzkmmgwbfEWbbRbMGBcQccIqCqfTezZgNfeuGgYvajHIWlkhMcdnB",
	];
	return emztBcgYraZpZYxjOTs;
}

+ (nonnull UIImage *)jgGcxlPEHuY :(nonnull NSArray *)SkBKyKPvXsGFvhhnexe {
	NSData *xaWEfeuNRDF = [@"UktXkHoyfyXkuctbEOfarPWfVUcwcrpNTyjFqnTQxaseQAYagozBYsDNCxNwSEbaEEavOBZDlIrFVzTUKbHnzjDpmbiZRSHblgXloOOhItG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tmthiiNpOiMtQ = [UIImage imageWithData:xaWEfeuNRDF];
	tmthiiNpOiMtQ = [UIImage imageNamed:@"jEyLhfcJQidawvloSrNTQLCcWAiAYszWDaOgNGXSMfumaaVXxohIMToZdxyuQrJspfKdYcxvWSlegLyPIjzbnbauKHDkCIPNvYdHNGCJh"];
	return tmthiiNpOiMtQ;
}

+ (nonnull NSArray *)PPOTyRhiJx :(nonnull NSDictionary *)dXeaSxZMsJOYYWklkJ {
	NSArray *etJJyTDmMoCWWzBPU = @[
		@"cFzXSeHHNTrvCHXXnnQcVLwcQJcPEZBTHtOfedciQyfIwqJbPHCZkPuoCBmHWGitRTvcCOeqjIoIjRumXxdiKrncfylfxuXzvJgTfUisuHnvtnnpbMaAqUFwsrZxU",
		@"vijGagXuYpfUXaDQydEMsFIsCcOUtLXdCmRilCddXshsXhxLyfAtcMihbItLxvIcTrxoHzLLMbaPxVoUJeJLjqBuqccHCZAnwwRvHqxFzOIqMBoiuwgxxIBFyfjDuoPacJyQyQ",
		@"gHkMWfPkGMLOKpMMLbIwmWhINZvVcESFuekmMiGuGlQSaWPTVZGSrHbIculYpIveDutNjcZxwGxVdLRWEedVCpIukPlvNvgBJoYNSXQKpKJXBBpkk",
		@"kGOTYQChcLQaOcocUsVXIcORYhBfcKpdPiZtmKwPLlXqIaMhAezHJSOzlUnbnxjJNjaKUKSezBBhhHdOZLbBrxxxVtcFJcjskXyicAwcfkomKoVT",
		@"laUubweKGTQaoLPJboZspGKrNWibbclGumsEhsolzAnkspfDIPKJecsoGrVnmQGLrkgInrUzwbgREJKQBeqlprkaEwJHwSqajVflVzDgdHMR",
		@"WlnnCaMYOZXkyNEZkzUgcKVBfcQHuocmPCgrVEVxOlumTArgHCWreywGmLeSKEKlkyHuZolqFXLQUbxZEhdALoYjVuFIljqzzZerkOmEqWpUEYcwKMXDpJySt",
		@"XyaXwlVZMhNHqmccuWnykByrTjoQKzcpDAtjXMwoGQqTDBZsqvCCCRJovAJTJRomrdrvfVfytYldkKpGGXFFyyofuLhxnXBYysQeu",
		@"wvYnsfCggaeptKnbXoCCAPIttqapRWTaJqoAabKnaYVyzZXavvRClzgIZanfJANKhEdzavioYdSwihtjZTqmWrwpARewPOLSiAAQ",
		@"KcAlOqRKXcBKDaogXMZrgGnwSooKkQkzJbMIANeCYfSZHwPQJTiqdTGPKGFwhcDaqArbGDPuCUXXZUzBYTIHDBMBeGKmmRFtoufezxZxEDpusLS",
		@"YxuypvRsXpmbOxQMBwdXcwuuZCaONxjmAKYyhtBBJhVOIzgIncemaGRkygZUMHlAWtdBwxJneYjaqJTeeZqzOMrJCqOHVkFLTREcHRgQqZujKjgmKLnaqnqocVfdAsTnhIHqXtHQSBCW",
		@"ZeoAEeqQzprfMioTNwnuaOBeYAmNNzpxzbWJOQTGGpRLocnHTBKUQAspDHdOAReABqinfjHMhHwvGlPlKdkZFuBNnilPvuPoRNDp",
		@"txCjoRnNhwvDKtUmCRWdJVRkYjIxicrSEXcbxExEZDAkLvVaMIGoagPGSlZMKxskvfpBRxXjrtefkNygtCPkQptcarbtzHTMnYDaNcCecsJBpUcJTcZPQiAYnADTGWzDkdvgzwdbz",
		@"jnEItAkcCnMzHcvTrYlzxbsbDSVEXtutZZXVEJxvztROatEIZFWHFAgnxzHlvXpimJTkzhUDwCQoerolIFcsdhhWiXDArzdmdyBHDYeursLJPad",
		@"ycNcvrxyYkbmVHQOZjwRMcxlOebwHDNAchbDsdnNNmmOWVRqfUMBHONMqNnxaQMgLBGOxLumZuhzBdLCvNXZYTXoSFjCEzMfNItOpjJHKGHjCITaezQTmKahHoTXRhoyJutUZnCfcvrnlWHqfRWY",
		@"FrQKOUevFlQUkPPdJjRlaNHfTGGyYQVkcimhYNkAkBxawFRIEJzrBOROOOjdrLdAWrQGRnVoYCKNvmkIrJCbPaRBEerpwnIyvXEUrNuILoTdwsMkVYSFRBkLFCADTv",
		@"RgGAjKnDpQoGaNVvsTklWGEsEExTtBYHRntTwOsPiITCCauPRUyuZznttXKFVGSAsUWhcAHVndKHjMNLdbRkTorkOyTDSOaDqwOiuNfvXwCTQhRAbJwGj",
	];
	return etJJyTDmMoCWWzBPU;
}

- (nonnull NSString *)ixraWlOlJWVmvxVq :(nonnull NSArray *)LNfOWLNhmDrtmNjQht :(nonnull NSData *)RXlTztJUjMpdUaAOtCD {
	NSString *yGkoAqXKVCOQxV = @"pIlbauPJgKcZhSVfgFyYdFEsRzEFXMiOcLFGwCqBERRQEJljlDblFZhcoNHglYKFIxojVlmsndSxRvOmOkqPYAOdxmEdKlYJkKkakvpJmTkQritUkUAxZCOfukPHDfnFYPOFYMpQtyPZKyAWuMRj";
	return yGkoAqXKVCOQxV;
}

+ (nonnull NSArray *)EQkvPKznneqOBT :(nonnull NSString *)HOaskGqHUeANAeeLdUk :(nonnull NSData *)AhySkOHMDOXhUxKBc {
	NSArray *knPMRIwyZAXnyIC = @[
		@"KNNOFWRAKDjAPmDDZzbjdZbbIdMpGqzJaoSvsQpaQHbXfvZxGiKUjBAZBngpdQFKzQfoVqGhEHKnheguDHnsxjseTvWaNxyVLFgZQGEscfvVJmPYhzIObQUJVNZfIqFyMTSBVOyuRUhHqseBz",
		@"PXheEgargcBYySLzvkOuBjFynpmPGFZVGMpsIovBYkrkxGUsuaLeHaSnXRfgcjywjxfqhTCsyyOcjGKcErHAsTIhpynIqWohcTgG",
		@"gbEHcUVHYgCCIzoOthneWeRyMzRdSKhLJyPHPhghmKECyxMovoPpMBaSGJNvOAycwUkXxRcjgVAfRiVYGkPcfmZsWpZWyMNBWPZbxWBGyQhNXEjlkWwsFjrdzOnncDWNuIcXNKiNtVj",
		@"yDvwQISmtenWLshuYGfSmLVptrphZfhnCHkAgQNHGLlAUIigbtLhvJijmnODRArkkcqFLUdVvKQPiYNFMMFKgcZcpszynnhBzBUZhbdOJSvCfeFtyNhJoWKEffxgFdrHemUwUJhiMHkPAXVQcp",
		@"jQIsdBMnMEPEeVjpcnqpRzKLYWbKciWkSPeYfegWvSTGOffEdPetLOXAKJibXJZRPiTfqYyOmZyaPsYbeGvBBoqqbRQQJFxfenmmzJgncRIABlhNCytj",
		@"lyMILXQYlKQgOLxCBUSlnygDTcPrhisOjAiwrcBTptYWhutXAMCtHcXvyUGLaidsauYOFxyCBnQEacKctplQXQkndHufQdzIeCdySGslYDqgLl",
		@"xZuSISGGSyReTgsIEYJaUYmQqmXRmHMabhzILEZlCEAImLSLSRkLuvgAgqJLHAxkHxHSUcCYtDSdQCllZNlcgFsMxUDpGKZxODwMGMoTuazhuWzdotePxWfjFDHrVsJyk",
		@"EOOscPwbiSKWeFcCCeIfUopRdPiFDCGsNcQsnrjsPKUXfRumjvkIpkPPZNQARXxPcUegaJSJNTNaJsjZLpobXcpglxoaEXbkIbthKXMdqjcXNoPkxneSL",
		@"hFMEHggMFGnvhqetdGlXCMNuJMSKHWkdnfynFNlpQrTRhZnwFnVUSfUgaVenLlzSYAysSPvRFEGadiNpGlKcjZFWTnsddewxFcEOCvYIZrfeZBrZCihlUNwaBfdYoDUjwYck",
		@"TwKUcRPnFydwMRBRoxQhNRjxmwqsBhArhcjibkdsdMiKiyfgJJclrsYodURDHStcuscAGrLiOPMtmJRQnHmZdfomQzkUthpqmGDLxLs",
		@"UBcuJbLvpLfGEHtsoItwcetJGwLrRVHYELVmlcCnQpGyoFqeRzPnkOEtSdciXHwbYZDOcaPvLtHtlWnNTXvvYdnfscSErdRxbfXCcNcQQuzRPmzGjNCkjFSLwWaFmhmSvEzIvOESuwXR",
		@"kFQWXRNYMLDeQhWYkAAcEFHNYYKzBqrboVSsyNMZZqZxDXnLSdVmZNTTmrFJhajMtcfjoGSAgjkqJYbErEGcNYPhZJKMznxlHPxk",
		@"EtaxywUuVxrUfhpANptchHQaoZLeFMZJDUXLrmioPiXCZlLkEtQKPhMpoFlAMMttCamOIaJTgQnVIUdYWwFqxBrNRPyTFPqbdDcWUjI",
		@"FphNgdaRJjjneVWlqcEYxLDfUcpMKvxYeIrThFxWQelKeVfsDxoRdtOiuyuLsTGThaDvjlUyoHzaNhyXkuPGzKwBuFitCFLpYeXYMgeWdU",
		@"UulzdLPLwvvrkEjbRUYJJOSBLkZuCiknEkrOHfWclVXaVqtrYiQjyYBkAeIRwBdXpmPSWPudktjsulxUvotRGWGjdGyGHhYpDRVXcSNdWVbCKLrSaefCZsWfpqDduDGTQzKMmbKxJGolXfclo",
		@"WMoffuvGpldqqjmuagbqlposhXnRfVGsgaRwLAmfXrCKSEHKkLljbzvqkwYejBErpglVRIjydtlaNswgCxUPLXsULynCpKTPSGwajPwtohedJItupccKXDGuNTVigi",
		@"zbzBVihHgWjligTBNFcHMVvPhCiQngsUxWWAZSdKkGYXYxPdACpggrlFOxBhmRbdTZoMVwuTWBqKmmPJUCgUDLECKUoqpgPdsSsOUWEnWTixtuzrSNNleaPTnReBVuDKbCsRfVMGvrYKm",
		@"GoxOgjGTccBrZVLyoWfbpmUjJEZiTGgRDyvLwjUeWYGtrSDsRLqxXcOYVJwJubAKplieUBRVXDuraZExZrKiOElAXNgBzRwOHkvymSwdkZQoAZM",
	];
	return knPMRIwyZAXnyIC;
}

+ (nonnull NSArray *)xqTYkgsehlx :(nonnull NSString *)WLCvKGfyWVi {
	NSArray *VZjNMpFCXuSNfpSjwqz = @[
		@"fgXwdTsuEpPDEbMreehdnHEBUJdEhPHVHAAidAeNCuiiIazmsWnNlvJbFPqUkrxTXbYpwbCOzQimmDPneaSswJGLJItBJtAPkQbBVtIGcDhqxuQcsuWdWEQ",
		@"gRpmNJLDOWLLZgwfVeDrLSfKFKJbYwecqMmOXmfRIsLIJooOnlmAVQMsrciTkONQVdeCLZmiXysjimiRAavFnCjxKGjjNpwCtQyaGDcwJXeEoVPIjedWRgePKbf",
		@"EEgZmokVbWnrGAurKoxHNDZybOwYdTPTkKHnEnyuCdSprgclnFnjhfQDSoMefYbjMBawjwtdeGOSNADVJAwTKqVoWJNpIXVLsZHdUDiI",
		@"dhVakhCdpbdnefxphJvZQFlKXYnwXzNqaRPTWwdFyIqQGILIQXvGyIgveDeIoAflvmqcjJyahkCHXbyKUwgcvjBlQHKZtuqmAwpAMLEQQsSh",
		@"MZEeoLskFRPtKHjEkUVNqnkPVgpRNXbriAhBpWoxaZbkBSHTMoKqiPeZYUPZvHqRfFhUFGjlUFTsWqJMSnkmJPkkgegHGOrPYHOXQQLxfIamkKJZyOAyjAYrsaqYvkJxFaSDdXSV",
		@"sBjBncNMmuYtWXlQQrbfLPuskgmQiEiQfBYkRdryDUeLVEYNckSAGcuyLosOtmikcdRfHPEgdPaVTWblJBNpFJMIDCTGqRCvwzhSMcQrK",
		@"CdUHHtfmZnFLtaWSvLGFaMEGxsKdPPwIppgmeWryLRACPuDSrGmwxrcpWkkUOEuOaEsmeJKjQigjMicSJBVWTguzmdYHHlNDyNiJkxokstXsNFLSFCkDtKvfxvefETDheFd",
		@"qIHdNCVWqggtHlmLobehpbxwRLwQIANENgrFvKJavZwWCYukJvCbNEayMEuLsHigdLhrJNtDKNEgLIznFqaHzsjcrZHIuwJaBPTETdUCXhNusqVDBXXaLDGoFPHBZeDAJLHhOqo",
		@"ybIiLAwkiNruAWQOpWiVMSoZuhFcsVqmZaVHTInePCTWLzKdTDgFUUToTSCebDQlkLUuRFMMBnHprTRbSgEnqcUadhwFdUIIJpWkGA",
		@"rbNMZQbvXwlYKNcLyAdmzXKUxGzvmmYpbQwcQlUuWXxpkEcrntrNIBxNzRyoyYTwVpmDORLrMbGtHRXbaCneHyxYBQkCbUhmpmXuCFgHreCk",
	];
	return VZjNMpFCXuSNfpSjwqz;
}

- (nonnull NSData *)ptDbbgoRCykkjfBc :(nonnull NSDictionary *)wcrlKokaHUONeMjFl :(nonnull NSArray *)KeSLqzZmdTcRPXqF :(nonnull NSDictionary *)kUbiSgdwcotkmgPXhV {
	NSData *nrUAPZKEnYXFN = [@"UFcaoIqLdqwwbrmKGEYGfSYUeHmGjVBlIfMKiKqtnhDdkvZiYHSrQrApJkQkziIiIvsGvLHAMJVrSljmrjzqrpIFbLvJiclrYFtJYCVpWbTWDIyifslGOoNYKR" dataUsingEncoding:NSUTF8StringEncoding];
	return nrUAPZKEnYXFN;
}

- (nonnull NSDictionary *)gYBRQagrTBZeCMi :(nonnull UIImage *)KNYalJUKgt {
	NSDictionary *QwckNhLEbwUVsbP = @{
		@"XyQhMSsbYpEOpNQVRcO": @"QQUZAPZPXxdwbmGzDDjztESxphSSDUqjKqyVSUfDKjvDuPOwdvDHTFcFuUaNzffyImkyFQetbaDyndADzqHiGcrwDpHghYvezsEVppZUmainpQxiTensfIUYAaCtoUBStNaYOCLkheOuzOmAIB",
		@"xxRDWBeCuZXv": @"oHNxBmBdjpnIxryItlsqImrXclARVgtzgbFJRNPHdrxfrVDpjdqHoBojoEddYHSUZErjxXgcSlFfXUlRbLIwXSzSmgJOQulvygkoYH",
		@"aNdPiWGmlkYdKqwT": @"EphifyfUUJlkZEpSosvtCRkfZPDcdJvftIzBMoCLPWHnhuawMylwanXQVYdZsCuujKpqkaNwsFDWAaZbiCQwPEtjUuiKwiyxQJMsBGiWhiNmhYV",
		@"DhWMbOMlylOcalwDaM": @"CVOMcFwGNPjoLerYMtHbgUoGeXLTiqMzirXmHfPCLLPAyeUVNHZRMsiVAlmjRhWFyhkuQKllDejrykAdbXpvhmtyYDpuOHcaWcebszibdaKnVUwpzYeavIBkxspHiYYJNendCPizeN",
		@"OEgPlxcLFxzHVctHsv": @"yLEeGxYDejuIGChsYzMPXRctMpXpZqMMcrOuuSMVCSXokywahMniwNingWFmhRGUPMtFjjUFIzHQYCLlVnBKyTyNinfXimzNYkoXcqOHcDjquuLhaFgKKcMclFRiAVlQptfS",
		@"nhILTFlIdDnDiIoCp": @"mGxtZbvHgjryBdosFJTleKtUXTfoSmevMhyvaOJrhaAJNjGISsnwnBssoJAXMEuWCMTEjonjXKXCysWEsBNyAyMfQJvwJBklUkHqfhlmOaezTbiSrezlZasCKGsC",
		@"CJcYwmFAxsrnkbOTK": @"hdqWecIVSAAFoLTFdnDtttjKCqJuAKeDgDeSRiHJEQCDOKpoAaqpnyCftOJrjKPznmXzZduKhnpDgfswDohMmyxLBJaofNvwKQZgFRdpTTfiLUCglMrPgEsfIyKiizCJp",
		@"TICCKRqYzVnCHEWba": @"QkItnLjBGNnQzimZidfeHEydNBExDFwrXnUlisMMoFiCxLAXoSiNwQHBBsHLNMTwuOLyToOXwBQnRKYjoBrfAxdoOZWcxnKOHkJzXABstWeqGaoaoETefPzaeg",
		@"EFDXucJRno": @"EkCcEgvQwFVbMtmVSnxqVunqqXXOyfSJAeUjgvtzsGDKqbZzUGhRVGFvnzWWHLIxtDKGABkQvIXuPxYDFJKhJnHIwOIaTeExrlxItbUfjzcIGYtbAZVnSPpnHyeoqCPtiDax",
		@"LimjuDSiBmanR": @"ouZfzQMzWeWOEnXdPYxirjjZerYxFoUormFTaABHFVvtYNidpTKlzzFIKSdyYdUxMcTLcTQgQQgZKzzdMJhLAckelWdDjQDGXIkQvc",
	};
	return QwckNhLEbwUVsbP;
}

- (nonnull NSString *)RzbwsmgiwXbWj :(nonnull NSString *)eoiZYcVKEwFrNxJg {
	NSString *SJXXqCDkwNjRxWb = @"bBqlGySGLraybPxFdpdjmPNFHyDHUzPjUKjdJoAuGRUbyLEXhQXeAxiFSoWGMwgPkQjgqBOWCiucUCMqphrqGKsyDqxIAPsrSVciqRrGp";
	return SJXXqCDkwNjRxWb;
}

+ (nonnull NSDictionary *)XcwPpTJVyOkGFLXSWr :(nonnull NSDictionary *)WHHQrmepgWYstvz :(nonnull UIImage *)AfTPPubdUrDoKuSAyr :(nonnull NSData *)BZnbgUBHolazVbeH {
	NSDictionary *PfoUxWGTtvjyvluM = @{
		@"ZGyVQMlvax": @"QlxjvLSVYwHSBrvoekkOvGEMOmQyjpNPxQFSVriGIbcXDpZQzTxTctuAUCNhkZJvYutFZZojwwcZsLWRivCXBxLgWYjWhFGWNnymQLttflMhwmPXVKxDgbl",
		@"dfMdnnVwrctiPoWvoL": @"TqveTNWtVShXmrCatKblDBPcGTjWxNrJipNahXQpkVOAJkzurIxjHgxumxgPrzjlhwWKfDNUBLBJfjdxutELNQqyDSvZEkATrGARInBEmzaRaHVazBqfgnPcDIskdpKlJaOCf",
		@"gxwcPKkDqFZUA": @"VQnCVDcczrdednXfSbTFaGmEgAOCgqOzkBjVVCCUOLlsfNbkaBGhyZgvXDNuMhGrqZwJUddZrydUWHTTZIBrzwYHFuTYdtlBJHMKrQOHBsTHAQfPUCYZHxCKQOaJMiKt",
		@"HSBCegLOoPRJmT": @"GmbodkgUtydAFhUDCkCWSefTFWRpzvOAjMveVHdvhPPkUXcFanmzvwiRkWfJvaaulmBRZNBBydjiXTrBXCdPoLlIQCcnXRGxynulu",
		@"ZqONlTnXzaH": @"OIngjDtYcxzXbZSotlMXzGPoRerqnnVGwsgvCCMFEcehzUHYbeBYNxsIFMXrwfaoVtCpWqhRsPQxmDccsUyThtjBafnuNCzlttdlGBLfKLKeAkgSHfEfv",
		@"JAwpwQphebtQhmP": @"LxyOyAwnWqdSJmBUPyGvRGtHZSAbgXToZLJYtwlmWFPiOHWShgagcoDzBwRxukdTYKXRuHnRutupMqUniwOBpLhISoEJgMbmQuPjzBLrtfevaqbcCaHuryXmFYNIMRHdq",
		@"OcXcVWNVJwI": @"hrxpUWNkImkBUunElEVTlhbIfpJqoIAAGUjkSkSfxDmjvddYVRxtSLBpNkEkZwVmivjfbfZxHxnjdbNjwrDkXKiYOVXsVSTJkcdQQdFYmVnNuJzdcDdiqePkmkrXxlfLUxbZsoaPXAl",
		@"zekyEsUzNqBboRG": @"mENnZxUeZzVvwAUfudcvytECSuRORakywlgUhZkkKMkKzHxzBjwVocQJSRFitYTBxuaSBJheIIxHlRRGvMLVEkCAxmJDPQdJJUFbFzxSrWVYqfOAkbnVAzzJCpkYkGAYvYIPSyD",
		@"eAXwNySPXOESp": @"uKkWBCjMchHQGUQTgvGhhyNPpjGDxckMyyARrCNTOZLWRqFgKsAJeueterkQEAOVtvlIKxsHaFMqcDgCmIqehVsZwqHwJYfHCBTwNpjasZdfjPVKInKGwlYOuJHvvpaZtmRlayEBNNfLWT",
		@"gSjKozAgzIiNFgvK": @"YZGdwZaziBvGxFJGvjLnnxkxqQeXVrUwHozOvORqEGcVBbLNLVAqnZsVXpSJNucsAREoDOwGvhwEPMxeEOvLBQBbpPtzGANTxJDtHuStGVwqm",
		@"DKdUywfnmLrDPej": @"UQFetKWeEMSdmEQMGAJeHHDnAejkXUtHqIzfIPXOJGnZkZxTZstsDYlwxFRSEAmkWiuUGZQEWjMPxdGwfUPEhOpNppKbSnereIRSREHNzfIMneaHJYWHxfRTTxRonZnRUABiYhHNDIbGE",
	};
	return PfoUxWGTtvjyvluM;
}

- (nonnull UIImage *)DHFVVAafqUsbVQRntf :(nonnull UIImage *)LFsDWiptSBsIJXihPZn :(nonnull NSDictionary *)RMFilvIWXf {
	NSData *oBBiBfPttpcqnRA = [@"XpSpNoEzjjRrTYCEbqMLLLCEMAJrWFUhuFLvSdjnyEijoiUsrkvlpXZhdOZMfBdyPmFzcDMVgbmfFpgWvNeGgSIOjoLvSeCTMGmVPmBhPozbPyfCmtZOHUCsaHNTJohdLhtTSkfPMCJYp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *McWFwtVKqIJQcH = [UIImage imageWithData:oBBiBfPttpcqnRA];
	McWFwtVKqIJQcH = [UIImage imageNamed:@"XVbPEHTYbltTKXWEWbmmjBeBaFBhwvxMDIxufGkUFeONyBXJvYmPFvGfTRwZuEBIoELWdGisDpSTdtSpevFZndYulmGhslwjwuOkvlqBLFfLFjPlyCzI"];
	return McWFwtVKqIJQcH;
}

+ (nonnull UIImage *)wwjPpltESFZyyTkRpx :(nonnull NSData *)iUqhQIEFABVxGv :(nonnull NSData *)ktklktPSAGqMv :(nonnull NSArray *)KHmamgmNuOX {
	NSData *GzWXfbgFpRKbokC = [@"LlHZyXvEKjXpvzdqdZiUiuyJkfbLvxjOUbkHTKdpxRQYIJArLLCwhnehZZNWtaPQTNltnlLMWHcrOsnrLBixPEtwzWLGzifJOLcBRsPQkbEVlteDjKjYTVlPcKvWTvUBQOFqBAPb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *biZRGFpbGI = [UIImage imageWithData:GzWXfbgFpRKbokC];
	biZRGFpbGI = [UIImage imageNamed:@"KPSdfDEeaDRqczQCyitmKhBsLFbpGWAbOXGRZnlSgdWdMnZnhYQQdwwJWlASCAqARpmjlIEGwmcjtBhcpIgEmJrGOZeQLSLgmJLMBisTlIDZGNJgIkirmWtqCaboRnUpGXgIKmgiyS"];
	return biZRGFpbGI;
}

- (nonnull NSDictionary *)shzHfObjIfxPjZscoI :(nonnull UIImage *)TuLDTOQOGRxvtdGJ :(nonnull UIImage *)IdUllGQBreLdyRjN :(nonnull NSDictionary *)UpkvuDwHDVuQmF {
	NSDictionary *SGOvRKvQvdP = @{
		@"pDJxwVtNUoEQThfZtG": @"yfOSNIfetvIjMLoWAwaYJKSpmlnSqrdkmPnPFyJwvsTNYlJNGUCiqMxQHNFttqohGPgefikaCgcdEaqJxbNVuDjErGCWFZAuVfWKXbRYcYodd",
		@"kNvvVARquXuWEd": @"NEAfdlZrgXHPhDYtHyNBfEJVKrijGjskHkyRypdLBbUjXvjGhghmJHfMmFfnXlfQcdAdDXuhTyKWjCuENeIZLehPNnaYpVIZeGPgELlmoRcqQShbITCEyUqdiOIxfoRkMl",
		@"hQFQiFrNTaWhFFb": @"xdASAjPndWjAhKflwSsaGtVJCwRsYNbhlRyeBcwAZsZIMvKDiFLHkBjLGjpXQOwfVkzMHTAAQcnuDxsBjXjvwasNEpmBJDKWbCEtTyVm",
		@"EozPtystbKZMqysw": @"LLmdmmVOrpgSyfeRIGIjIeMMAQaSmBsCKGuIuYUGUhdOLaZXuOahXNNHCNhlbfOxRlZFoLLrKYSwsMPzOCEkbAOnYPaENFGivZrOBhMXAvc",
		@"ihHjJEVSDrX": @"KFjMIcxBCXLuNYHuaaNqbvAUmbjVXkCndtyphjhDxoVBFsyxmCsRdQNOBllejlUKfuFGmSDSsecWFjCKVGitLczCMGTZZFEkuUoPzsPrGNvYqLiblFHjQQGmGPFjxhfgBbDmejnNCczEseoUuc",
		@"QkwBmdhaaSzRvAxdb": @"nBJvHyImfFAwdSsFXtueCkAtgAjixTDXkGkRUSPkXGHJXYBYVhetbezPTFlfzIbmpMMkisyYCqqObQBJmzoTiymmMmemclbgFwwbgmUOMLFWyHUmvFbVCMZcChiKyUQnTkQIpBbaQ",
		@"doJlbsHmSTDlPD": @"JdpuNeOWrwOasWvpdXlGjXBwvnHmzLiJznpKDGgwPZXPWoXEQXBdjyQzEVmrMuyozajoTLZIbWwCSZkRJOuCsRWYTKNHDmLpCxSWnFrGIvTiKVVJuOmovuQTegtCmXOTgkgsmmdknp",
		@"EitJUrPhSg": @"cmklUegdtBtLkqijkGKuejIxxqRRuKsbumrAUGybDooMtzneoJILqADWRjbzTsWgLZnYSDhTitZNnOTGgCZWOzQNHZgwbUvBFXSeNzGLlfDbaPpmWD",
		@"yHFUUapMOzGvsuXB": @"piOgBBwjZKYHxlFJUGIJQEEhuKLRwxfvxGVGZVRAjTZxHHCJrwKrLrbBAKnFnqCTRERIlTwskMjaPodgIkrVWmiEMmaaFaBfKJEeAXqv",
		@"CMnJhRyvuTPHmzAne": @"TmfHvbuUREICEPucUkMLxtBBwRTNdjIJUvToosFAQTEzbfMvspitQFSBnFeypCXaUUONSBEtVPgvIfWiqzicmwHvPrfmkgULpquSJGtfqPW",
		@"xUrmMggWLXFhB": @"zIOgJKEzydypTyEqOzCjSEeRgIokbDPqVwOUXsDwQeddrAcnUrwutnKmlumTkOoSXsoyPSoSdIlFFmznpLbQxZgpduHKLKtsdqtJLDALJoyFaVuLQflCIPOaNfBAnU",
		@"RYosCamAzZ": @"knAypPLXlGDYJMNmIRwhGgXlWoxaowJZihGKRrzslkoShSgCEZgPSsMstrjjWkuaahKKUpFEiPBbwpeYNsLamTxxJRLhExMOTjFuFXwdlchJKOlREpBkpsrZEiJZoSmcPWkzgPhzcMuLokbXtFJN",
		@"hdXmLDIlhQulgTbDL": @"QnBslDLDwjItyOuLNwTYQtlGAEXucuZzitxAfsbbvkLgSqJtKIuLfXfBYnUsKFcPgYDysOwIFGgzmtAceeIZukBrRniVXIuojDjFSaZxvxDDJcq",
		@"jnCcvJXbtmQORDVZTAU": @"ZUWbuvhFOjyLOypSxkxsNMNhjBRZzpddzuAshyTvXjDYKpFPFKwFpBSdRJPwOLwdzIlFayfbwleqLTWUXcenhIjBoAIyDLUTgnbITlBpd",
		@"TpoXWLfOJUnnECE": @"mtvPLuZkRJmtIfxLnfxQnEghGwDBuNPaoCsJxSaorWpFDGdvSVhzWALSXnbTnNajhDrwKFHqDgMCEjCXQWmZoXFuEQDqmAJLBVYaitCeynFrPiCMkivaSzgrosKRtGmYJtQLmLcjnbI",
	};
	return SGOvRKvQvdP;
}

+ (nonnull NSArray *)iSkUYGuEdkwjn :(nonnull NSDictionary *)grPdfDVCPwAyLGswNI :(nonnull UIImage *)baBVpreWnxF {
	NSArray *JoDcWCbrmrEqmkP = @[
		@"wVrpratsfWnWBGWVZyGOcwdqXfedjssFCJBKSpEtSavQnZQrRpIQhylaJEmZjjEShzcgZjRKofgZWTsgdMMoSFRoPtsNyqLprNvcLhPrwaQSSnLxZNaWYXRCXRigWBEspIdBhWEMpmigbmvFMiFwz",
		@"UxwEvVJzyxeGDxieIbfjCWdlASvwQtCYptiBJRmoLVdnwyyDhXqJdBoyEvQOMuhLpnasuhfsyESvUkPZNeBrGzbnuAKETyOOffUngP",
		@"haQySijHaahpqatWMxUgsuYlYFsShPKObBRFQBoMDCmrcWtJzTaZBlsSFdnHOAVGXLutklJvBCHvAMycQwcSjHGGHVvOKHAsnUzallgLZRRa",
		@"MjTMQZBTanagbHxqLUEmdFbUnXvCcGqryKIPmCNGSjmHsvsqKiCMCFRSevZumLlYMXJnFUOezUXyQnwdbvJrDgCMHDInzzluRWubzJFaHuhRh",
		@"bxWyreWKwrReJIKtfqkQoOIaRnkLxjdtENcNtvQaIxsYxmGFYCIWMvVuYiVIkUtOqwqYQEmMtuSjxPnnTyeabpfUizONsjAlKwnnyYoVeXAGFhLzJzaJHjfGAODFRMzzcsRxxX",
		@"ZNGKXugFlYYWSAORGBtEoLnidryyUpJINaRbzBskuMxtAAMCOOEmqXdSRtcDLGDPTikOmZQEaoAbZjRSJaInRVGQTIxKwXUhlqRkLVqFkACeOhMUvAkTBDWXLvMyHDBKw",
		@"qmskUEkoABrykBZaQJqVyZUBozIRMacBwVeeOclTwtFsYgSFSUAQszOsshugLbjsnJHejhPrACQcBKnYajIOZbsbRwVPsMPYdBYTmLbn",
		@"aHMwmRNMhIziAuKSFaEpmpOtJjnRYKotwEwZUJEzUApQIKRzaNWLKcFdUFUsxcFIvIlSEsTZhcoVpocVGiaiaGABusyPQCNcTYuAKwDQmUCQMumWquSkYLNikTYZepkKAiAiEErBsvKnDM",
		@"xZiAlRvQEwjNsdTTAflWTJKWbgWmQlhyxwzopJezuxWnwTkJVzXoQqgYItIyOeOOjfNMuHOyNuUEwsDMSOZWwDCpaxwBLjgwkHVRRNiOVOQQkbZBtpysTupM",
		@"XSkEcyzGQSwLXzjlHqeaSYlDymhoatVSRzPraryHFryKyOGzMcceBaCIVXbpIvqbZlIyWyGdJyThFxlZGtpMYrfOwrWraFOgdekiTHYrXoqhCxLcUNsNF",
		@"OspuWEEgXvIojwKLdYuEdiblavRPXwuoXRZpFlSYuAhrydOBrQiwwjJpMMJhTwLZvgsIyZpldkikTRzhlVcbktIPPxZofeYfCaeuqXfqpDvWwKWhlr",
		@"ZZtNWJwXnJaUhhHKGqNFFlUqosATBkEfwmXmKRzZAoABospzmArhstEboOCQDdeLgFikKynTpPTZioJvDAshnZzYjVbCPhIEOJxBKkiegbJdrHmhkajUqkGKOCGr",
		@"WxrAQmKeWBqcRGGwnUxcQvgueUwrmOOIqmmxVUAgMfPHpuPsWDJmiyKFLzIQPXMQUGesJmuvjAwvreTpLiYefCoMwAkVtHKioJcmBoiitbnlxbvaxKQ",
		@"MPRJinxLKEOjpWVMdVCBZZBegamoIBOJmrKnSRGYdqBrxRgeZPmMwYjIZMsHOTCyaClbgkJVgjMdfZpobqgISGDdMCOAeKgESPDdWfcOmsRCsNxhqQbRTMJNWMKwYtMLgqCZPUWQoGf",
		@"bQfgcsviOSAkOjruYYKdMmNfzXLdrLyzAPLCoPZiWNMjvQzUoQHtNIIOehFbLIoxELvvMJoWBsiszKUQzQflaUsrZsGYoRvaMPuFiinsLtsGxfrzTHcEQRChzvDGRZUnyxXqTsnSYTpuTIVdai",
		@"PcuFdccWgyFfeDLuyutaObWFswfKNotHgxmXkVSZhaxmLFveglyQNcdWnaGOEnbjVcSvGVSxEcRnWasuGhokVUoZBiRkfpFrjrhWJYXbXSZcHSIfpGhZYbaCSOTUofh",
		@"UmfulMjhrZndagyLdcPYXRdsbBPsdyOglGbBZjvgESQfjLThhIlXqKzOFpyDMBOmGesElyNeUyvvxjqllHmaTjibxJpMdyuxECXOlQwZcmqVtdaHiElTOxLGHuHfYyPqrvinmpDUv",
	];
	return JoDcWCbrmrEqmkP;
}

- (nonnull NSArray *)hlycvMruWfIDdmC :(nonnull NSString *)HhdjEjmZLu :(nonnull NSString *)SHCHxveqFjsKh :(nonnull NSString *)mNrkuWmZrR {
	NSArray *YUXvXFuNRL = @[
		@"uriSGclGzTniBeSThTcpsIdNgUMrHjXRkwJwzykMhFgfNSUwoPeKikUNuiEmuhaCxRpHUmZNCZoakUoKcMNSTPJHfzdjzHjxIaIhwHdypuQoQruqIEirxrLJLvx",
		@"BqQljvYBzwGBECmfXGaOQLQdNnlpReAQykOKEkZaPZGZisrHQLwSDTzMwHWJyHYJqeOmVKeRprlzCOxBcJwTDqBqOKFQexBaeASkwovGTPXBxTmuNLkWLeuPPPyYbBFXLMzct",
		@"jlKfvoWPbnDoDIXCWoYDOvYEWchUvPNsdlvnFFMxIUCzXJkTumjuxcsVdDZeWxUMcZeUPycBWerwjcavKEvssvzCOmRRkQbDNdsoUbJsbrHfITTQpKAmJMkKjoMuBLjnVqzDuj",
		@"WKXVoawMqJlunRAehIYmctOKPYxOmpFSAXXrPWZaIvSODSebPxMNkOCeteYsIeNaLIZWFJvICxpNOCbrJlKRYTEuCZdeLebRqbdpsPzELQRjbLyJNd",
		@"BjIlgrbobotDrYVSarQRigeyTzyZHzpoVImNZnKEuSlLJBWIsfdohfCyncQQqoSZeXMPgqsqjcPNIjkytUwRdwftBYQUfDEUGkXmbOxKAASzuiArEmdBhQrWsTtLxFmb",
		@"BqCzrGZhpHoimwwpYYjwoaPhomagUqZkXvDFPiWrdunbyCnOYsRixEgrHDFvtcUfdLQmVzMnueppVKwrdtGQTrxDWLQVNXTYWUjkRVUGCVgRndSazBPyPTzbnhpHPvkh",
		@"FUXJkqyWuCAcWHrVnGqKfTXbccukeSLRnGdsYKYxsVLtyQwLqQNaTCjbWHdMdWsUJSRwGDsPvNsxkGMSdBNKnJgAmBJbslOCLZKlSJxcmXSAjAtqkPXizSRiuhgwVMCTVu",
		@"mNcBRHWsDrBYGjnjHqxmcpJMuhJfRWvcBelnotgSTDDMDBQNfFRmvDKLFjrvGCSmPFrbkomRThxScDHOxPqFjXxuPmhhGvxGNWryydUkMjRSLoCpDylYpiumoHBZpfQYYZYtGsFIvWh",
		@"LSYBiNnxdKtnJBKMPgpQZiVvrqAOobcdCYhmyRtYtcWDCoztRFKtMIFsyfrIuFAFcUrYEPIYPRjfSBjMoEGfVXuCDFUiIxwoCQuWgQcKAnpToRqMmxVIRrkM",
		@"RuuEeEbVJphNmKjYbkFgfDAySSTnBfXHyktjipemhfKLzPgVtcJZrYhFPqMBHRIPZjEVWFohDEEGKjWJMKVbjZrtzfmxgIFDYWJbrKvGesrkDqXNJbqGBKTRkOOcoMh",
		@"BsomLxFksqiyuzUCdxgKEOiRdnZltkwgbDWQSWalGbqPndNFZWzHvulzLkkosquctfNAsdwJOYZMXmtVzsPucjhncvOBKRJjZIwRtpGwIrmUNbhiugQeOAuXedWCKXy",
		@"FHwqhDTtAdzCOvWOIwyKTxTLxEHbVeFyKPtXIlmLsDzCkVJTvwKgkmDfYfRfNBcfVOBFfWkhVwvyvXcbeVkAXskIulAYLchISRITM",
		@"NHkYyAWxBufDorMQHrpoKBlifWYYhDbXATPvDeGhaQbEkHmyiYMvwPzoMwgBqSbgGSXSmOQbdnjCPybCshrRsTGjfPdlYCIySPRDDeeOMmKB",
		@"BRJEvUrACTDdKOyooHboDCoVHwQGFniolxJJhFMcLIraPNfQelNSzfkwzNzSfMFNqbGmTPzzHMAeyCEyttTdhKindAfPqNoqOZsUFyKYHZzMtQl",
		@"CJRRVDCTICQPLrUorJJkqmhpfDSerfsudnJiBpdKVjYKiwxukXtgrKjFAxkhmNrTerMWkytNufgAEfubofKatptMhHlULmpwjkGQIMEHzLUtkOJkmAc",
		@"TsTPpksefCfUKuFKUnlsrDsEFVAgurEqcBxlXqivrvypSRUrkwZWNfdbkbfxNbHFcqVsioFrSBUwEfuFcowrxhscMsfFyEqCVFclcJgMsyDPRVQCdPzGBLMpqIsH",
		@"eRnaMLrHNwVubTzZGJCbTUEXSVowAFVylsMXfGRWHDgQduzqMwarwDcuOYEpAKGYWpGWqfsaLJCrJVgPZqYNyixiibgFXvCJkyiSu",
		@"vNaiWBuDkyGqRjZTLkDcSWPQqjGPpqfRWSOviljWXEEbcGRtkVhwnISViqLiQNriftkWYumYNCeEDDdWizyNOTUTdacyQvGUIaqKGHGojsNjZQXTyIeSgWifwOuVjBjAKBRmgm",
	];
	return YUXvXFuNRL;
}

+ (nonnull NSArray *)pHXMgnvEauwOMn :(nonnull NSArray *)wAjKGymRdAFraLbHZJ {
	NSArray *gyHTJzYoHiwstQ = @[
		@"FbSyirBrOoGqKbFitZRbEMBQhKLegiQlPuMOkrPZSIkDUDzfrtrYZxUmsOIPZqFyBZErIclnkHjOpPTiUcNWODGSOMqQOgzUkxfkZvnajXUVrwCxbcxNhpBCYpTunVImhCTsyJJpcQbWiseedXCGg",
		@"QCfTTDulOcKwTWMfyNZPVgzuqHYXTzSgUjECeKYGEXxMhYXDGezXtRSlrrshcwtUuctvwlVdLPMZJygauRfcTjKjZRXaTKEUfscpLXyTfzPuWsCkQDbt",
		@"DrVihjOvAIzDaSUlBrBRmsggrquEWxwYItwkzbLLPsDYRtcLeTfvLHDhKdNWyxfOPxyVeqEYnikRWagvFuqTNEtYVPIzwIdJYYnwOvwgqjCMUKOWxUrYJbaYwvqSCRevVVOMrUQPXTfEnJtOFxFb",
		@"kbPrnpMGGgpjHFPmgrkzmWaLIRGwupdLfIJSrDFAWTDjoyvdTYpEJLcAxFIUCHZAGDThjsDANgGljkxItGxhaEFjpMPfUCSkTQnBVIlkqxandlMQXxuLpTFTlYCOeixQVULJ",
		@"vGEWKsifuoXqPwkcpsLYttMxMLRQtbJPZwshrIPFWgWlYzwQnBzucjwsBbycQsWpLIjFSCcQvRoazLkPPcZZtJKukwvbraVwEwSvoKVUUQbmYNxbYkwYYsAlqVmShnsiVAbbICoB",
		@"JvEKXjSugUfVmbusoQKyLOySRVPuVzNLBmeMIPiiaKomqIsvIHrviMdbiAdOgyYvABexlLbsbuMMWASsLDdZXJotdvicCuXHGoSgCJgZNyuWBVdwtCIFhfhgWihyxDSvkpBTtJzOJaOrgPEWZXhw",
		@"kwWuGfkcBthXeDiIECVcxuzqlYLizcmEgvSPCqRolEMaHNOOmGbdbjdRdWDfwXklIDSJKLrgGMPkvscPWxiJsVbwaQQtZDRBVYhsXKPbeNoPwqvrYKZIKWVGRkF",
		@"JSENhUagBeubFyAYGlqWznpwTvixKtAYuNpUDGgCRMmOHATfMyqoWbbXEQPpDGtpgbQdNaXEsChnIOYYMAPYKspTxPhAKOySxOdGBrimKREAVEfEGsrQVAZrqBq",
		@"oQyTfZRByKaPmRGwwBmYqXAIfzepNzEaFbAWAtNbhyxWQcUyjCCrSoajLTSUdYnoyGeiLmrrzBwtRQVHJxcEMyPXwxHwmSjelPvrplHuSv",
		@"lRUWEBmJuOtniMTUALYPyYhgGaBJgytSVnzwXtpmUGlXziHdhIoENotlUewrfYFtvSVHkxAnBFAzcVQLqpmwYAtXCBsdHkbCZjQegrCtKpgaGvNySLObMYQlKKVxuoZmH",
	];
	return gyHTJzYoHiwstQ;
}

- (nonnull NSDictionary *)XTacxZRoThZwpZuGm :(nonnull NSData *)nfObUseWerwRjMfA :(nonnull NSString *)iPChRJBghZhyIh {
	NSDictionary *xaQQHeFXBoajCcO = @{
		@"hnzTCpCSAbF": @"RaTXyuQaNOpfgMdoghGNvXdqBQxcWavNcfHWjDobgSEWjPtBRDBhPdVyzWaqllcNfCmbTuTWlxONvDSYzrRNeHipHoospaxzHRHWhSgJBODpEQPJNvIgg",
		@"USogWiXuWFAnAhasoJI": @"BXyBZuYQEEnHxaOaThUFVPWSxHZCNvYrbfaPvmRjiodUcCZIQYydXvtpGTHULzcYguKMbxnklmWWpydYBjyaBqrPHOqgIRrNdYvdkaOyfOiVJyaOIMPqsYrtYQpudQcMFuBQBywzsYYBjGBX",
		@"uWQzEVjElPnQItJkvSH": @"tNRfREtuPxQbtpSXLVcPDUQZMNTbPcZGLAesjLcpszHAqdVTcGaOxuJNyKuOJbEnIojaEPXLtLUeKQKIhGlEHHPChOKIZkSqSboHwOIlMyUmnKuEKGBSWqGZuTlIsXUIvsKXUEvznUx",
		@"cKTrKVEPStT": @"NQMIqDLoTZGPbnnhAFSfthshrodyTVxEIVCLfNcWusLBznYWdePYjghrUqQjxmtOUiztYLNLwNpZnLUNwtADVluNMCTVSPsbeimENDGo",
		@"BBOdtQZtnBpb": @"WaZpncpVNpyeZPZHLxatzRbZLAkYgIFyblmPMauesFbfIQFGbWNrDdiNEHqpwpQvHVCtsiielhcdvkIQgPiNeatFMqDKsjSaRlXyGlpHMdzWfBtYkELKRoWbnGXrVSVLJKPBIVBKvymNIr",
		@"qDYjGfLfmIZtnLHPw": @"OYuuoFPpapXJlBaOWEoBqTASVjPoUVDyWyEFONvYCmnqtnoodfvWUhYutoDIjkeEENfDpxDUfhRCaLlZtojKkVAyBpkBiRzNdQQOlPoTMepgTyPlAoIsoBYkT",
		@"FawZxbdaHr": @"SSHjTlnPsBzzsTlKdhHCdxOgybpIoBqrUhwXBLkvllxObcPjblrVqGikilSxXnJSiwiSgeBYoDHGjuKtcoeQbuSnykYFQsIsGlYrkGcDPfkfsOuksePsWMNT",
		@"YVjyfBgtXhBGF": @"MtLqBZUBoTSTnQkZUkbJvZUxepwSYqAymwbRQaXEXVoPCxYLeJoaplKVEmkLBuNIkwZxzuGfHcVUbNonhxBDmztbQpMUflWVthjPNnctfFGHWuhqAWVyKxOzABcbwHqVIokdcQXrEvtyQeMAd",
		@"RkIzHhetmGTljZ": @"iZrZpyjuafHYvugOWfkVTUTtFDauVrehepygaAApilvNGLkhIDBiJYghOELrLWSWRplsclIkwBpEPZGrqVkvhpoUoobQxNQHnqSsKShXWxDSmasDVcUrPnywAZFhevXmOAbYRLuUSudqotOAL",
		@"IFsfYbaoNTpm": @"xlqHxJmyZlVEbGbJLUtmArupiCVSdeCXBssrLXsgNVbxXYqXhnENqsvTAdhLarixVXEmgSFEFTNinYllSAandusHWrRSAfJoQrWSUrxTETkqtNtAfaiQglRapN",
		@"eMflBHJAOkTY": @"xMYQkXKHbQmmDgbEqFwaIGxdoJJPzLTXTQdVFrPmgEygpIukisiWkdHOFeEfUnbVXJpYDonTkmDiODypwzEpujqyXeWyERvuZFKzrwhfUshKEGivqFIkV",
	};
	return xaQQHeFXBoajCcO;
}

- (nonnull UIImage *)WLFeymClakZMaOH :(nonnull NSArray *)bCCXmqRdqZL :(nonnull NSData *)kQSThjdifVUR :(nonnull NSDictionary *)kWsTrgpPQxV {
	NSData *FMAtxpvnzRi = [@"HceZMrMmPTHlGhAZJwbjeiSBCLkcxwnYgkSxYREkZDbWvFkADvLKKfuFJXRqlgRWszUnkYhxgvWwZlSmSHcYwbVAQmrJLRiGSjSPqm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sTMnoMxytLqeCLcW = [UIImage imageWithData:FMAtxpvnzRi];
	sTMnoMxytLqeCLcW = [UIImage imageNamed:@"SGtMfRfUorkdrJBmjvcOOfNzEVpSWGDnvAKEMjXbEyXboShPmNRNfNuVTphHuvXQlgBPXmevVFtYMYSJijHnnEOLNDLDbnjEhulypEkmoJqXdGYIMLJKhsOiFHinnZwybJ"];
	return sTMnoMxytLqeCLcW;
}

+ (nonnull NSArray *)MkOtHYcQRAwALVEeV :(nonnull UIImage *)cYrdiVLBjLNndIQSZYa :(nonnull NSString *)QRKVFLCdCKfQdRo :(nonnull NSDictionary *)DBlcAzrtdXk {
	NSArray *OSKUdNniRIn = @[
		@"byLGDJEUvgtMwUvqCdweOMsrIBoYSASDqLlZnysZoceYSAekiEDZGANHhHDYQBSqqooCRLzLBsRQpAtYFrTOlBeRZYITLUYtPVJmhTAqHLqLgWEzvqoZjGSlWiqeJLkLtSEKxNAztIkL",
		@"RrpyYGxHhuvFohRuvYUyxFkykFuanmjkRmXGHnLyvMDEecIgozwjGMsDpNqIQgcTMSMXKthFMmTULrcEeIVPcLXfySYxyjNkeityJaeIDYpzYeIdVFGDnFJbera",
		@"mQLdGyfnNrKaauGxXqLgEVjvPaPkfOngJwlmoEiZpypMvSLaxDxXObntzTtDYTpNYTmBtxCcdefRqUzFocLjOECaIrFgmfJDnniWoCMjNPpYQZdItcNkPYkGAgqOkdTOndihyaiBZIZmlkIpA",
		@"ZjaFGnntQPjksAxqhMsBDlOnXozLjKirjdoIHbSEiWFiuQrBMtYcjFQekNCezhtGQNgMaGwFMcVqnTcmEGcCDsptLaRzFTsAZhSyEIGXUnmNjUxrraInrptIFjkYRgiVVOqIRYupn",
		@"ZeJaGRlivqhMPiraHuPMiByLSSRTdmijrEgllISvvZtjhnOHIafCEsUpgESlkViVTVYcDsoUljOZBoPGFtZgaVdSfLiwnpyfjIRJviWhHghDCeSITNywKEJUxtRoePxOyxZsLhJaTgNqzsEueT",
		@"nDXJLwYjRcCzoaSjdTCwVqXqeRejpKBfIGZeyIMhjUcXoZgHkqmPDvoUUUrLQYzTxJQtbrwEmlBhRSzazEyVHcuYreJgctjbtHZshWUsZPofrfccxTYtErIBILJlvQgijBVGlqlNb",
		@"vYlXvmrbzeTOQulbukMDEuXFDbciCFcgOyCnGiNPnFYtDpjchqTwgfMuWchXafvAOOtDjqznJmfJnDhwFlaqnkRzSRlfTUbUHGeVcDcKzUSkTYKxImoGJcBPNzCUKdZFFueHrbGLZuauRddHWaut",
		@"xAbIXRUhdoBgwUWGpGDIWcIukCgxOsshjpJfjBmJvJRxRjLQLWvlEUNxcMGyQMTxPrQRzTTfkTVxrsktXMewPlpprdaCOCJunFpYaWfYXjAZdyGnSWJMOvfhwcUyJZLUxruryICJEK",
		@"qNZRNOzXizyKqHKMEVhIZryFRPeXbYrDnUIGLJNVTWarryNDMSgheSAOCFrpcGIAljzThOQtXUgWlCyuXoDHrJGWLKtIxwnjeiROepHhkqiMcqZckmG",
		@"bsgfKbOppkaQBkxknBfgKMxYecjwaSzSjvjZoTreBLrcrQoziNqiPPbNVZvgbyfULVGxQcxRmWVrJmioivkIyYKPuRuRUTzRsaWILRxGDoRhOJbejlKFrc",
		@"yODgPoNoizLCrjfoieVLjgMTljtrryHwIsDcnRQiGjQvctjGmIZtvdjTSabVvZLTTrxMGczHHevhQGMcqlIdqouRXOeFEpupfedHSpTGMADrKbLXMfLkFdSmamxvznERoGDvWoziDqNVhuW",
		@"pOnRkXEtsWLFSTTZqBRmvMyVLvwpDIRJTSMVbMLwClcVuKdnRPcvLPQeYGpvkDuPMSMlQsDvXqyGysGQujZBrEMXOrnvWbKceZfXJJrOpC",
		@"BsCanwxDrtvYQaTjPTvjhyRjHRWCYeTPBGwdzlBIPTtCOOkvhthLOLUQiLAbjXqpVFpwxKMdEGRBojbBuCPmNfBOftDEuCAvclfdsvdajOPGYPvdCL",
		@"jNekuIzMjMkBzQCmRqhToqMsplHjRLqeHuCVSnasHqkHqpHopLVUPZySFwUWFKjMdBkGLSLtRCHeXitTVftwXUoSWQoACsIlZRjZgISicncFuPZpKAYovDYqi",
		@"cqrhAspYJfIWlHeSXcowMFXsKkuQXyxnfgEUrmFITsCUkQhdVSqsyAXoIJYyNVLRDJKWeasQwbjXhMIhVISyiZnHkCJiMEtRkheSoSc",
		@"mWvSfeWSukZizIbLKfzzfweUrzkMkLPuljlXrmXTAEPUjmPMNQmDPbAWCyKuVXAYZVykgTYDKTbflEqGWEVuEdIwwPFERsDNbTUMs",
		@"JoamFlLqMvNHfSLKXMmJmDspPfAZkzwOWkUTOtHAFnTOADuCoVucflfIhHkPhrfyDpfiIHEeVvvBigvGmmPvUFffFKIghsXvJVDcBNTOXvCGuIxlGzQYHQzcgiwFRePMalTOuKaYaVQtmwdAfD",
		@"bYVaEUplBmQNKiJieBofccICJbYbrGKlibLNCGOcTFMeFOwOsqXQowIFlVgzxpfvOEohZKkZTyWtJKxKIPBRkxwejEJMVOvwuuBqdCmfPqyPNSTOdXALgczWYiFvXuvcWlPuKVKswwSB",
	];
	return OSKUdNniRIn;
}

- (nonnull NSData *)VQabANOpmIbPyQMufA :(nonnull NSDictionary *)TbubYiFxsTtDbvOwys :(nonnull UIImage *)FqZwkCFGvZDKWHiiQJH {
	NSData *PDZKDVpqYeRl = [@"bIxNdlVsZEKmflxXrkkDHhxFtiHwPBOTdzISGBfWoXfNTIgqAMJUfYQgTXTVmynjcKrHhQjWgXpnyTvbWKIAuKrRvUBmFhmfTiOvKFWFxDjnKkUTGDEJvVYYGIYEOkoKFuwbwCgULtGYHJRLko" dataUsingEncoding:NSUTF8StringEncoding];
	return PDZKDVpqYeRl;
}

+ (nonnull NSDictionary *)gMGeLZtLqRdE :(nonnull NSArray *)XHuSFAeaOPiqsJQLDv :(nonnull NSData *)TMfonpHqeqPhwru {
	NSDictionary *ObRcoSDPmtrAChhW = @{
		@"bvKTljKlkqQDja": @"mXHJUAqgpuUqNXiJZKuiUqTNsjBDnVpFhDVytUIsmWWHTLZiEaeQcGmVVmAorDyhVBnFYyCSvhLWNuhwjSRlcMjITaXWYiNGQdkrrSVKrkfUhJzucqQjyYUrQMmSkutMpygYZusVchkba",
		@"aBXFfzQPnPC": @"xpEwWjJDZFwvTtKfBLyQKFbVihXmpPIIYIakuUkgOgzJIskkdTaVqGSqawAgWYoWJCHDCYOhxkQFApjLkAxWrgvCCHWUJSUnotKUgLzDobnZPkYlYOD",
		@"bsJdSuwouzsb": @"QhoXeZyQgwftgLAKzoIWxeQcHVhhTqTQZgaMUHNLBsAikQSEogVqOviKuNbYzFxGcgxFIeFyNGEuLrNgOcBKfTkYeUJViuDyVJQthZVMkfmfdTaZGOsnKXfLllrfbNjcBSaoEb",
		@"bUyTmvuDWPWqASzZ": @"vmwBioIgJBPFWaXUsMvWVEojllKSPDiRwUadeKNOXrNtQjBNiqzDQpAvQmZBmeFShakvXXbwNggAHQaGELzkDfgrhUFSlajxMiyhIfQUwwULzMPKrjpnXoMYHKgNlxbWxlu",
		@"tQLeyReigPmbmjbTT": @"HGbsJjTAgKGmSxUHHQLWleWosRCQrnfaSaARyoNOZmMEHLjucNnRORQRamIzrpeHnLzWZgKrQlrRdNMEQVfEoRhUMUoIONpiTRiRv",
		@"GImusSutYHIPtrzRz": @"BiNfnKyPVOGYZvylvGOrQKjHSNlUENPtJCqkTnNHEglFdMTIysXyiBQhftXFfNoOiPHgtBNyPMALlNOLqDQxyxrfMIScvytCxtyCmxswqczWBbpvJYyRnAXx",
		@"WmkekakHYoMYJGEdQeF": @"nJjhrygxPoURdUJgBuDXClfIxlaEJQOoAWLgWLReaxbMNXyKwLhryLCPfbTgZSsJszAmWmNoZuvNRagmfeSouaOoLQCcBCltcycztb",
		@"cYqgoRkFEJnYyI": @"RszsUVCOihMajwYuIFMlWVnJOiPCYKjJcfJTbqigUJQxHNnyuiFabeOJuUWXeTIOptDnBXqPSvAUDHsEkWhUjBemIKjeskdSAJBqBeDzlZ",
		@"toalpytYko": @"UxyEqprJfmPYXNDdXfpkEwzUsIaLNviyoKUjJsuYnsMuYdtyVmtMAglYbBXeTfWJHJGfjSjLktjPkcBcyUQVaQHmnZBJtoUCSQtjoMndQD",
		@"VaLlONccBxR": @"zYSzchNzUqbhEZHQjCKtfySmfUAHNcmzEBrxSXttUljSHIYozWPLogUqTMIzGpGPRRlurQAziriKiMdFOyuVcLtdkdhZdGnbVaZVwrCELYkhYfHCvNNHnicckTlxySswTPawYeY",
		@"BulqxhuTAaiF": @"taJXPqZQWKILxecJnCpDghfWrynzWomYTqxHfvKEJNmhAxnvcXplljdROvGnvVuCvTKsOWKOuyETZNZpDwMZWEJeVARxhYTCUmehBlRHgiRwMEUADfjUiYPlB",
		@"WgEdCMwVnLYTHr": @"wsDeRMhZWXHwOCIwFXxyqZOnEwnghSxhzCxuEDqAESsurorWGUmsfcQnvAAhHNUkaWLkDEqoigfkEULITiDPOOYuBQSzUOHATHfBSAdeqpTJrXNqamqMPWgaURHhvInQLMCcJlxyZEsG",
		@"oZXqtvcyOjFca": @"niabZrAGTVnZtzWupEdDmKvZbDqxvdSUMZNoeluZZPakaksobhNCJJkURJNAqtzfiIFWRCroXgWPSrSkQNgocBYkOmmgKtcnPKxdPZPVSPHMaEJHNlBMUErvTBnqtGGTEIBuVEwDvl",
		@"lEAsNiMXDmTnsLjF": @"zKBRxaQbdtCxbZzQsLYZjJuSRZxHZuZAbHItzsLOupcnwuNmBVhjJXWSfTGRIhrNJrWzEKHVFFvXxLljHvWpnqKozBOTRuEhoqIobGFzqnXUgOXboJBaTSKyUNgpaQeIiuKRVtFNqlrsy",
		@"PnsunVYUrx": @"eAcOgywadZqOkRIwVjCNAsJsFDkyePhzkvSwssAFRigyrHjswNiagFCTqvRlfWpHsLUKMCwcHGRBmOqCBAfSVHQFsYfRUBigUkUUtcAZFWuF",
	};
	return ObRcoSDPmtrAChhW;
}

+ (nonnull NSArray *)YdNWpVpnfdztJg :(nonnull NSArray *)KwjmImoBfcm :(nonnull NSString *)KNAjszJDrEKVSSbwS {
	NSArray *TiTAeJUuJZlAsA = @[
		@"KvtSPnVbYoZcUrSfIVnWIXEMyTVSvIzoOCOvwYEDKeMNCkngoyBlXCpGLMzUfwGUpYnGxLJEOlVpsxgpKeYKUcrTXQgFIEIRSssrH",
		@"xapzpHyeBVuTNMblAtrgBsJAxqjZUJiXaltspmmIJoJbiZtmEPGoCKsdoIDTySFQgONYFPAsOlFQxHOjJvxuzgcvmBfsMXlplEAcuFMMaOSqKKCMSoTIrNMdWWWf",
		@"LRcwXgBYeYByZVZsMXEJUTYWcQBSEeXvdZakdlnKluaqRTQCZzzkcxMVOghdtdKifCSpUjeLZEcHZHsLUCyVqyLCwKPzmdAYfGbyIMTUiBIdGwUefPIieSUlDTDuOXOAZsolLXyAsKMAlOxlzYqx",
		@"vVKvrDzoYJmGLsLQosKaIiUGPtclnhvRKwluJlzRMcPIBVLBHNmNwiXyVhZigfbllSujtpTGgArOwJjmLIRARNjancGzQTgVkpmkSQZvgkISum",
		@"KopSePxzyRLeCLDyifXbElXHuqLIcMBVaiZOAHyeColuBJzXyLubGCKqKUwotFMUaFjPXAKfBzvJytxtOyJfngdDbmVuNLJyjTpfuEcmdLBAwsvSiZNAkDSb",
		@"pnUfldvhYfKlyRwoBFqvhJFUdmpyQcQWNTYdtIyQaCvgraonACblYJpzXmcyPSqbIhejLaDlwOJQsdUqOcOcejUBmOmytxuIMYZGyqCpwHEQpHXzPpBNsMiFZWbfVIeiZWtwoZ",
		@"irWumQztmguwbAdvQyqeCezKrEaTFzAxhDivgGLYrMtAkDEUJtJiKeBDnmXeaEJjhnfPUeFxzZxxlAYhdICYAfhFRamtOqWzkIsGIVaRCfciLkkOmyBOpWlsdWzstAwDPVcSxRtCLVS",
		@"xvFZpYMgIUmnSFTMaeVWgljYNlfkFRdiEjfeSsaoWdrZvFgvqITcipZFNQJNDpfzaTISpXywtruwMdCoJxMUjSmCWQUDTvBpNeLgPPsoBOzQbHLZNnBiMKxFTzqHB",
		@"LdYIubrMajEjveFPASkcyuMKNuhNHyvcORzxanShPpBcqucjonBLcuIvXfszCAdEAMoonsojNiMsxkisEbUgQCVRbMCNAZLpMJKHIeLt",
		@"fjEPUscWmJaylgFKerjHnNGvlyyenWAvDRLaIzzSbDoepaSgyOvmdhUATdOJNmlquQaSMeQeqoBWAvfErbQphGCDLquBGODqbFjFhWBhKceJAxmqpkbjZqlSUhDvoLGpYiWp",
		@"vgsAdrOowPBgqLrDyUrYIgCyRQZkszDWZcjxCaVawVGhpRQAsUOxgbjQeENHoSeUnuIHNnfYjfoelcTHMucIFAEMvOFmyZRJhzmAQyWWrzwY",
		@"bdLjRiBRndHXKfgOkwNaVNzVMzNePMflZRwWpIxyHsdwBkMSqMDtNScXaEgpraklqqCLvpdNgopsOedtbOvuPzCPEiMutoeTSuQAUXzQbfxSXuMFXJcZvdUgSfauaeYSJkaRjPMvjJkBVZtoobb",
		@"VDlrTJLLQEZFcWGctmzrMmDWOjqaRMXPWkQhHcHGzrIQUVuRIUKtyiboceawaKsjohoecMbxaeKCLCUzIFgCGzaRYhqMSxtASCYVflybMibPoPqCHUDVwosVcNtyXbQUxmsKQDCFaEV",
		@"rkEJcnISHxhhYZQQtnvkjBKEqhThhNZmLqiMjheFeobbjIZDuFrJCnyxImlXAJYELgIiWgyIOjLruFQFTxKUxjOpppGwAPcjNDJCEFHsyStuqZkPMSRmdwDhYWNkkKCYBvk",
	];
	return TiTAeJUuJZlAsA;
}

- (nonnull NSData *)AOiGfdKJmKxRtSaThd :(nonnull NSString *)URksKbvlCmsWR :(nonnull NSArray *)THVEhzUjfmGOiDSpsIW :(nonnull NSString *)imrhURwoDzaTwEItw {
	NSData *CiNtmAxdPwuvocwx = [@"vNPhesywyZgIVmsJNSyjQZdGufsGaOTuopvpEQcBlssTAJjJeqVlmIhuYRcfhxqOzVlpsbFMGyuvVOzdIFavssCpTppDbtPsyxUoRRnwFJNfBCaiuPmHyiFW" dataUsingEncoding:NSUTF8StringEncoding];
	return CiNtmAxdPwuvocwx;
}

+ (nonnull NSData *)RppSTxTDkQoVLa :(nonnull NSData *)PrfcGDHIarDixLEuHZA :(nonnull NSArray *)nuiHfztJavVNpFUG :(nonnull NSArray *)kbSRXJIAhsfBztv {
	NSData *FGlMKiDqBKMgKxM = [@"jhQnCeRVFPugnMCqahsAvvIRNDnfokwOcerTbHvyNqloIWRsPRCevGHKmYywTUTPmJWLkrYDrKMUXklvHjPuAScRMqodJSPUckwQMqVrCqxGJoYBumficSEYXfPnIsxvkAIbLbBj" dataUsingEncoding:NSUTF8StringEncoding];
	return FGlMKiDqBKMgKxM;
}

+ (nonnull NSArray *)dsnhkvezJvvvTD :(nonnull NSArray *)RGNQAOQQXPxgroAUB :(nonnull NSString *)NukrcHMwegwdUfvMhXg {
	NSArray *BpdZfmoYahVs = @[
		@"TkYMGoZruPNMpsMrbmrMhRHYAGFjjkvEKBbYDGPVqVOvorCDCJIDykYLKUWJXmJJtVzuzvIaWkjovPglAjTPYlSTxZADhMBjfOoFYBGLKXctnUmQDWzpdh",
		@"IxcMfcPPOwOtUhrdClbfxvubToDCBeXAOzPygrctiMycoFRLAMImeCbmdZDcreGZvZvvuyflexzEGVbsOFRgzgeRdmtYFMCvLLNCtPrdnBNLhLZKQPovf",
		@"ObUPczqsPfOzJCblrCvFKpjvFYxxuJRXJtEgKwURaYRdUrcuGyHzEDuonqRucIvkblIouXYPBgiSRcAPiCGCctYhIAsGlQrpndHXeWjnqQAGuFxDPlBxFNBfaWryZJIpZesiS",
		@"ZkjBhfTtcHwuUBzrxeBsMPbzOZZOvoqtrxKZXoAfXfoYZSpZGJkwaParklEeXPtWNConjOVRZSqSLxKBcjxDpgFrFQoCZXbfswaNsXJqdncfUKsLMlUBVtglvafURKkvynJRDYMstaUUCU",
		@"sSFIHgAkWADxyNxpDeMlPMYGKyVMsJHWCaoAYzVrSPpqwUhfJVxsqNVPfAwrBlSNJOBSCbwoFCtXcKShvwDAPOcmCskBstgZXQTTaYNqpNzgeyhlEgiFCYRfCBKvGYoEdschrCcoDFCjXZTLK",
		@"vUTMogzdjOevsoQKeSrkBggCvjtsYRcLdcYJyVgMVawmTkHIgzvupHdwBvJpypztXkXGNxPesvWeoLdsqiPXtmdboAAAMYJEIXQXuEibLMElgvHPLYMvSShSOaobHhdNNOtuPVcKQ",
		@"bRtMBBByteNCMiPbazHvJbnEQQPpvuqaKcBCYvUBJLQYUpjsPrPufDWVvakSMcQwAPUXFngCzDyLHOXTsgcQVOEiwqBUtBYMGMeRSHdHEXGCeXWZMufKdpoIuUeKoVPaOhGSJvEJYg",
		@"iYIrSlGElsJHVfoBZxNkPsErgbDbvjdqSOgBVPSvUJPgxSKuriIbRrVzvVxAbURsEVliBTttuQxlktyIJziBAxdQhkDbaBYkfDUnTJHcZOyzzZBNnfJTlWeaoObwCpVZVxOZWNwwtBU",
		@"RSspLHyharIvmgqRJyLHimIpnMeQIQUgYZigaKTHQzzfYwQLidmkdtbtPGYNjoxSZBRyBVNjRWwdMLeGSXiJgBPWsJBDYYCuFYAm",
		@"wGgnJAdUEqDlpNigIBOLrKtyRVqzBHYdWTTzlYECLJEBJNgpjwPEPClohdGqrkdLNgmyQMrRoTmRQNumnMyYdEyOrYKMQUZDlvMaTsuhGbYjAuMUsOyYUUKeuhBNxeUxPsqD",
		@"wrTHslaZVyBAvlzTsuwcDSwSZmSmfqPmASCmHirCZpTsaAvnHKolZLkrrgmhZBUUCjenNZMWkOtgHiaLOWOJiaYdDwywluhWYbjscFqxDIFRbSqnnaGBlUTzZFEMZQoOFdvroBWOsPyhrqb",
		@"EwjRWAicauwEzZCPophTgeMoxLpBOgmQytEBanHvVfnyMzdgvXwyJCjWhgYfIQLkORqcmaEJzBfdOkPmJimdXFaXaTAXzTZiGthAZnVKCtJoLryZwZsSNIswJeOFialTDijbonJnUg",
		@"lAqIMomddYduwZZNfdmURkEwlifBCQaVyKhYmHuZIOcAhnHQTkxAWMNcWCyyJlqzqxzAeQESkCJFkYjzSydzFayPGFyLizGGdvzBGWtnJoiHyyvkxlklmKGMxniy",
	];
	return BpdZfmoYahVs;
}

+ (nonnull UIImage *)fSntXZCZmPvduf :(nonnull UIImage *)KzqBQBVKhcpj :(nonnull UIImage *)cpozytDUFfMq {
	NSData *dFZdixVsko = [@"qGzJIArlOsbJpJdXnToOItnAVjeYHPQvHxMXCQzLDqwbeBUCnQaphNnOIFwUxtHkbBwqyrfVsNpspWslfpvuYbZHolGVjLZBYbEGvPuFJoGOzirMXo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eUwIeesYHEnmhSsQmE = [UIImage imageWithData:dFZdixVsko];
	eUwIeesYHEnmhSsQmE = [UIImage imageNamed:@"MPDFoYqiSnRoetwEMODAikZGMUxoxerHfXAEMLrIKknoICSdKHjupwJohETVnMdhuBJDFyCpRvJaSTFAlvAAIlCjqXFzYnICKFxkzLmrXmTrzaRrrHMGaWugjziUQHhAoDzDWtFz"];
	return eUwIeesYHEnmhSsQmE;
}

+ (nonnull NSData *)woLteFcRYYAKD :(nonnull NSData *)oHixeJesJT :(nonnull NSData *)ysxDYReJcleWrSny {
	NSData *RQnZzOsAgkMIYAJpKH = [@"gALfYsHbFqWgsucQHBzNpOGGzyZQQuKvKPDyqGfrinkwuTGEvEbSOEMpdqNJkFpjDVZEAcSNzQTxeBzbjhCljNoNNSXuQPaaPWozAnGrLnyShlzWiogmnhIrfyScMggfGQaQRMCkSBQsxOKOWx" dataUsingEncoding:NSUTF8StringEncoding];
	return RQnZzOsAgkMIYAJpKH;
}

- (nonnull NSData *)hbZTzlyVaNSZR :(nonnull NSDictionary *)mSgzACHziD {
	NSData *ihPMMGaDkZUMbNKacXX = [@"PdbRoetQGmkRNfDnkYwyFsqBGXouTcowkHFuKWfzHOrXqHMuuFLwpuMNgOCmwlnZAYLnZZqpxgPZacZYsrPqMrgBdllZfoMjgaSfBvSIQTcjtJWFtZXbJJkyPvKLzZVfOcLZtGrXuMK" dataUsingEncoding:NSUTF8StringEncoding];
	return ihPMMGaDkZUMbNKacXX;
}

+ (nonnull NSData *)dYSzDeOiIzFOox :(nonnull UIImage *)HBcntyweMCwSZABZ :(nonnull NSData *)oMvIolKKLQamLfsCm {
	NSData *jGZCMfkKJjghLvTyqsV = [@"gOmzuOCihYkNOPmCWDiRFTbtCAjBJcYIMpcRzpVnLuLDJccwvOYDaBLXvlCcRLPlSYNOewlWPNwGQjBqkhzXaYnMpQuZcTXFkQbsv" dataUsingEncoding:NSUTF8StringEncoding];
	return jGZCMfkKJjghLvTyqsV;
}

+ (nonnull NSDictionary *)zeOVQFwLErZwUgD :(nonnull NSData *)GJCUGiyRSBdBjPd {
	NSDictionary *OYjVoziPYImUOQwl = @{
		@"aeaDPxcGvDfjrCgVT": @"BDzPKYaOuXLpuCvjREOgXKrKUeGfUrPsgvBnEczNDDiJoBNsSOeRDSsKNOOVFXlEbrfBNEGSGPdASEKtJRqFilvONMrnzduwwmBQIacxYvlfxbQzRAfAIwdqenhwmFpqAidYLOmsBlkNXP",
		@"zejlDfQGhQVEyC": @"aXWYSHbZPXzqxzqwVxelxYaUIFCXfLERsFIfruzfAqjvbohmTymrtVdxrmRjTrMVQFzILlJAJPdLCVegXxaMkXAuLFOhxeAbEmnDaAOsfwZJgCWxwrnaBIBtp",
		@"cGatEUMHHE": @"yeymaxPnkebSVsZCLTNbFRedPYMvZzwtzuPfQoDKsLlPinBXOnuOQoWAShJhFNHuXCyjFBTCJBCPJwpkeGLVfsRMyUKLFbHdChHBjjaEZMWYlv",
		@"wnanWpvlUeYLB": @"ZumSlIZcXBBoRVvqEmhShDzQQSEvmnlTtZhuuuuFQbcMvZXBMUSAVmgEQkSknnmyfVhRTAtcgTuBUuoqDkoJZFAMzGaNbpLWZpdziRpInpHHKIdXOdJDTyEycuegEgoeqhsXewUCJyTvAg",
		@"pwOEbKinkXrZf": @"uBujjHTiziAIwLzXreOCVzSOfOStZlGWGJyQcWumJesIgXoqQzdKAIHcXjpSzkvxlrbLmtjlNrcuFXBrwLaBZlnwcFLGDuWrZcuqGHFLtvqIlparbFOhIespxhnjovkerLjGpwGqGoux",
		@"PWiahEnqxXG": @"ZwdloQWQVDugLxzpiecGBMVRtWXCcyaFnzzWTTGEYcdPKuDFTPQsrezEwcfdnLwysGNIvwSKTGZAShGQkjMFNVIbuHxnlQMWyOlePPFaJEIpbgTTFfCxUBrKnaP",
		@"AWVrUVroIC": @"CtqAamoCEIcTlnsNxeViKoVMtwtPMEQiCcvtLuhIYCdBDnVFgUUggffJYjQOQrIQyVoJgrBxFjHBMoMfQecvLfzuENOJGsdwuzARLmgjjuh",
		@"vGusZCpMwK": @"UiywkgevBcPLnMwepLsbutLKJgcdXBlDOeTnNqnCfvlGgKlhQnQmXPUmlujrcpZBbRkQgQvzjcZphuiSAZxRbbGFDeRDsyCoINNaVSfxrpWPjjz",
		@"uAONlxTYqbhV": @"FwiLoMuQUSdJOiRIuQwBChRhLFDYezNmRiUjwimjcuOatnjQteGHDSDwHlrJLGuprRpJsqmXlorUzfSHvONKYtSrBxroSqARtEsnooDQjTftMGnCSWlrfxGcSCgS",
		@"ROrMTjqmJWUkeFKVv": @"hGpfsygVBRQfJHhDwElJgKKCCeFUsqVandrEFOsldlrLlcUevOkkoEYgBMHsPMWLCXYQicIHXViyiOWMcONdAbvJMftqvfmRQLoGYkusukjkjiPaIMJlKlGRoXUODeYHCLR",
		@"CGcymeBhQrGDeQZyCb": @"WAighywuQlREcEjmpzjeRsyaZcNDPMtxNMvutHoDjUgOzpbRhbRHXQOYQDNAVhfZDCHqdKlGWfGPaOlvzqAxeyUQtkIOQcDRRMryjJnVzUKLEfSmuswsQritFhF",
		@"NyLfDsylDVmecvUwdW": @"GEqYthoEpGphguSEaSDtSJXpzSJDywuPFrvRmHrBFYLbyvcdkgWGfmKliawzIBqaqVBtJEXFqkipBBexTXQUPymTDQKbhqnwhXQuGFayJbFjcDmuGxby",
		@"iGbGhqHZnohyRmZUM": @"eIbdHyKIrKqOykBkfSpzCpNZJnSQhXTorGMKHmbqrFTrVVRPlBsRzyucnUldcdgCERBbDuOaYNVAiXXwSzVwnTvZvrOBnjSnOrjnThDYEbalP",
		@"AVsXQVwnyn": @"hRibWOyxZimHZxigbdudeiZwCoBDCEUPwRGWbENXWTOdaHmFkImESMJStzLhvKNhTclkWZtdBpVJVsjbwtFJmdYHvDzuPHYtarRTUrag",
		@"EpWEWNfbLkqzRLIiGEs": @"cQWXmrwrNfmZuVKYEFFYtMAAzxRgxmwwnMrwUOQlhzUBSpqAsJVNZYnPXeTOnHnlpIhxePirvQffMTIWqMLeCbuYeFbqDaWcjniagDePrutZLmtUOxtfIXaMRDluBDy",
		@"vVKEZzoSjEnDbNur": @"BTUrVBBNEDOLZsjgPxzQzNJXpxbKPZOoItlSCwDByAAaywIXefAkcOLpIDbxRFvajkqvpiRHeYERSpjWoeFWHTFLKyUVRVugewFMzfWodWAkderRZUnR",
		@"NyzKQlgkkSNj": @"OqCXUnPyciTxyKqrspSGdvDhscmJraWWzijdcLucFjrtAWuXswzxeEhghNJebEVgesGNEwSzclMzQXwmqdZIWLDCxjxsNIFtAgdwMvVnCSeibPPAXLcSAhcXzppxTjfdLXJf",
		@"XxegaOsFXePjRcE": @"KNDnoGAZUPciVFMBwjSwthYzWYjkBNWKskqzQZHDgqOgOozYgMuYrMRYKyETIGUEyGAQKonNKeFbcgJTMoWQWaFbGXSJsiplSVdSEYrCLCZR",
	};
	return OYjVoziPYImUOQwl;
}

- (void)zy_dealloc {
    if (self.zyHadAddObserver) {
        [self removeObserver:self forKeyPath:@"image"];
    }
    [self zy_dealloc];
}

- (void)validateFrame {
    if (self.frame.size.width == 0) {
        [self.class swizzleLayoutSubviews];
    }
}

+ (void)swizzleMethod:(SEL)oneSel anotherMethod:(SEL)anotherSel {
    Method oneMethod = class_getInstanceMethod(self, oneSel);
    Method anotherMethod = class_getInstanceMethod(self, anotherSel);
    method_exchangeImplementations(oneMethod, anotherMethod);
}

+ (void)swizzleDealloc {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:NSSelectorFromString(@"dealloc") anotherMethod:@selector(zy_dealloc)];
    });
}

+ (void)swizzleLayoutSubviews {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(layoutSubviews) anotherMethod:@selector(zy_LayoutSubviews)];
    });
}

- (void)zy_LayoutSubviews {
    [self zy_LayoutSubviews];
    if (self.zyIsRounding) {
        [self zy_cornerRadiusWithImage:self.image cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
    } else if (0 != self.zyRadius && 0 != self.roundingCorners && nil != self.image) {
        [self zy_cornerRadiusWithImage:self.image cornerRadius:self.zyRadius rectCornerType:self.roundingCorners];
    }
}

#pragma mark - KVO for .image
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        UIImage *newImage = change[NSKeyValueChangeNewKey];
        if ([newImage isMemberOfClass:[NSNull class]]) {
            return;
        } else if ([objc_getAssociatedObject(newImage, &kProcessedImage) intValue] == 1) {
            return;
        }
        [self validateFrame];
        if (self.zyIsRounding) {
            [self zy_cornerRadiusWithImage:newImage cornerRadius:self.frame.size.width/2 rectCornerType:UIRectCornerAllCorners];
        } else if (0 != self.zyRadius && 0 != self.roundingCorners && nil != self.image) {
            [self zy_cornerRadiusWithImage:newImage cornerRadius:self.zyRadius rectCornerType:self.roundingCorners];
        }
    }
}

#pragma mark property
- (CGFloat)zyBorderWidth {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setZyBorderWidth:(CGFloat)zyBorderWidth {
    objc_setAssociatedObject(self, @selector(zyBorderWidth), @(zyBorderWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)zyBorderColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setZyBorderColor:(UIColor *)zyBorderColor {
    objc_setAssociatedObject(self, @selector(zyBorderColor), zyBorderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)zyHadAddObserver {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setZyHadAddObserver:(BOOL)zyHadAddObserver {
    objc_setAssociatedObject(self, @selector(zyHadAddObserver), @(zyHadAddObserver), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)zyIsRounding {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setZyIsRounding:(BOOL)zyIsRounding {
    objc_setAssociatedObject(self, @selector(zyIsRounding), @(zyIsRounding), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIRectCorner)roundingCorners {
    return [objc_getAssociatedObject(self, _cmd) unsignedLongValue];
}

- (void)setRoundingCorners:(UIRectCorner)roundingCorners {
    objc_setAssociatedObject(self, @selector(roundingCorners), @(roundingCorners), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)zyRadius {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setZyRadius:(CGFloat)zyRadius {
    objc_setAssociatedObject(self, @selector(zyRadius), @(zyRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end








//ZYCornerRadius is available under the MIT license.
//Please visit https://github.com/liuzhiyi1992/ZYCornerRadius for details.
