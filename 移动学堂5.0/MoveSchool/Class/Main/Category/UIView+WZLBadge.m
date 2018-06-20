//
//  UIView+WZLBadge.m
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/24.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "UIView+WZLBadge.h"
#import <objc/runtime.h>
#import "CAAnimation+WAnimation.h"

#define kWZLBadgeDefaultFont				([UIFont boldSystemFontOfSize:9])

#define kWZLBadgeDefaultMaximumBadgeNumber                     99


static const CGFloat kWZLBadgeDefaultRedDotRadius = 4.f;

@implementation UIView (WZLBadge)

#pragma mark -- public methods
/**
 *  show badge with red dot style and WBadgeAnimTypeNone by default.
 */
- (void)showBadge
{
    [self showBadgeWithStyle:WBadgeStyleRedDot value:0 animationType:WBadgeAnimTypeNone];
}

/**
 *  showBadge
 *
 *  @param style WBadgeStyle type
 *  @param value (if 'style' is WBadgeStyleRedDot or WBadgeStyleNew, 
 *                this value will be ignored. In this case, any value will be ok.)
 */
- (void)showBadgeWithStyle:(WBadgeStyle)style value:(NSInteger)value animationType:(WBadgeAnimType)aniType
{
    self.aniType = aniType;
    switch (style) {
        case WBadgeStyleRedDot:
            [self showRedDotBadge];
            break;
        case WBadgeStyleNumber:
            [self showNumberBadgeWithValue:value];
            break;
        case WBadgeStyleNew:
            [self showNewBadge];
            break;
        default:
            break;
    }
    if (aniType != WBadgeAnimTypeNone) {
        [self beginAnimation];
    }
}

- (void)showNumberBadgeWithValue:(NSInteger)value animationType:(WBadgeAnimType)aniType {
    self.aniType = aniType;
    [self showNumberBadgeWithValue:value];
    
    if (aniType != WBadgeAnimTypeNone) {
        [self beginAnimation];
    }
}

/**
 *  clear badge
 */
- (void)clearBadge
{
    self.badge.hidden = YES;
}

/**
 *  make bage(if existing) not hiden
 */
- (void)resumeBadge
{
    if (self.badge && self.badge.hidden == YES) {
        self.badge.hidden = NO;
    }
}

#pragma mark -- private methods
- (void)showRedDotBadge
{
    [self badgeInit];
    //if badge has been displayed and, in addition, is was not red dot style, we must update UI.
    if (self.badge.tag != WBadgeStyleRedDot) {
        self.badge.text = @"";
        self.badge.tag = WBadgeStyleRedDot;
        [self resetBadgeForRedDot];
        self.badge.layer.cornerRadius = CGRectGetWidth(self.badge.frame) / 2;
    }
    self.badge.hidden = NO;
}

- (void)resetBadgeForRedDot {
    if (self.badgeRadius > 0) {
        self.badge.frame = CGRectMake(self.badge.center.x - self.badgeRadius, self.badge.center.y + self.badgeRadius , self.badgeRadius * 2, self.badgeRadius *2);
    }
}

- (void)showNewBadge
{
    [self badgeInit];
    //if badge has been displayed and, in addition, is not red dot style, we must update UI.
    if (self.badge.tag != WBadgeStyleNew) {
        self.badge.text = @"new";
        self.badge.tag = WBadgeStyleNew;
        
        CGRect frame = self.badge.frame;
        frame.size.width = 22;
        frame.size.height = 13;
        self.badge.frame = frame;
        
        self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + self.badgeCenterOffset.x, self.badgeCenterOffset.y);
        self.badge.font = kWZLBadgeDefaultFont;
        self.badge.layer.cornerRadius = CGRectGetHeight(self.badge.frame) / 3;
    }
    self.badge.hidden = NO;
}

- (void)showNumberBadgeWithValue:(NSInteger)value
{
    if (value < 0) {
        return;
    }
    [self badgeInit];
    self.badge.hidden = (value == 0);
    self.badge.tag = WBadgeStyleNumber;
    self.badge.font = self.badgeFont;
    self.badge.text = (value > self.badgeMaximumBadgeNumber ?
                       [NSString stringWithFormat:@"%@+", @(self.badgeMaximumBadgeNumber)] :
                       [NSString stringWithFormat:@"%@", @(value)]);
    [self adjustLabelWidth:self.badge];
    CGRect frame = self.badge.frame;
    frame.size.width += 4;
    frame.size.height += 4;
    if(CGRectGetWidth(frame) < CGRectGetHeight(frame)) {
        frame.size.width = CGRectGetHeight(frame);
    }
    self.badge.frame = frame;
    self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + self.badgeCenterOffset.x, self.badgeCenterOffset.y);
    self.badge.layer.cornerRadius = CGRectGetHeight(self.badge.frame) / 2;
}

//lazy loading
- (void)badgeInit
{
    if (self.badgeBgColor == nil) {
        self.badgeBgColor = [UIColor redColor];
    }
    if (self.badgeTextColor == nil) {
        self.badgeTextColor = [UIColor whiteColor];
    }
    
    if (nil == self.badge) {
        CGFloat redotWidth = kWZLBadgeDefaultRedDotRadius *2;
        CGRect frm = CGRectMake(CGRectGetWidth(self.frame), -redotWidth, redotWidth, redotWidth);
        self.badge = [[UILabel alloc] initWithFrame:frm];
        self.badge.textAlignment = NSTextAlignmentCenter;
        self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + self.badgeCenterOffset.x, self.badgeCenterOffset.y);
        self.badge.backgroundColor = self.badgeBgColor;
        self.badge.textColor = self.badgeTextColor;
        self.badge.text = @"";
        self.badge.tag = WBadgeStyleRedDot;//red dot by default
        self.badge.layer.cornerRadius = CGRectGetWidth(self.badge.frame) / 2;
        self.badge.layer.masksToBounds = YES;//very important
        self.badge.hidden = NO;
        [self addSubview:self.badge];
        [self bringSubviewToFront:self.badge];
    }
}

#pragma mark --  other private methods
- (void)adjustLabelWidth:(UILabel *)label
{
    [label setNumberOfLines:0];
    NSString *s = label.text;
    UIFont *font = [label font];
    CGSize size = CGSizeMake(320,2000);
	CGSize labelsize;

	if (![s respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
		labelsize = [s sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
		
	} else {
		NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
		[style setLineBreakMode:NSLineBreakByWordWrapping];
		
		labelsize = [s boundingRectWithSize:size
									options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
								 attributes:@{ NSFontAttributeName:font, NSParagraphStyleAttributeName : style}
									context:nil].size;
	}
    CGRect frame = label.frame;
	frame.size = CGSizeMake(ceilf(labelsize.width), ceilf(labelsize.height));
    [label setFrame:frame];
}

#pragma mark -- animation

//if u want to add badge animation type, follow steps bellow:
//1. go to definition of WBadgeAnimType and add new type
//2. go to category of CAAnimation+WAnimation to add new animation interface
//3. call that new interface here
- (void)beginAnimation
{
    switch(self.aniType) {
        case WBadgeAnimTypeBreathe:
            [self.badge.layer addAnimation:[CAAnimation opacityForever_Animation:1.4]
                                    forKey:kBadgeBreatheAniKey];
            break;
        case WBadgeAnimTypeShake:
            [self.badge.layer addAnimation:[CAAnimation shake_AnimationRepeatTimes:CGFLOAT_MAX
                                                                          durTimes:1
                                                                            forObj:self.badge.layer]
                                    forKey:kBadgeShakeAniKey];
            break;
        case WBadgeAnimTypeScale:
            [self.badge.layer addAnimation:[CAAnimation scaleFrom:1.4
                                                          toScale:0.6
                                                         durTimes:1
                                                              rep:MAXFLOAT]
                                    forKey:kBadgeScaleAniKey];
            break;
        case WBadgeAnimTypeBounce:
            [self.badge.layer addAnimation:[CAAnimation bounce_AnimationRepeatTimes:CGFLOAT_MAX
                                                                          durTimes:1
                                                                            forObj:self.badge.layer]
                                    forKey:kBadgeBounceAniKey];
            break;
        case WBadgeAnimTypeNone:
        default:
            break;
    }
}


- (void)removeAnimation
{
    if (self.badge) {
        [self.badge.layer removeAllAnimations];
    }
}


#pragma mark -- setter/getter
- (UILabel *)badge
{
    return objc_getAssociatedObject(self, &badgeLabelKey);
}

- (void)setBadge:(UILabel *)label
{
    objc_setAssociatedObject(self, &badgeLabelKey, label, OBJC_ASSOCIATION_RETAIN);
}

- (UIFont *)badgeFont
{
	id font = objc_getAssociatedObject(self, &badgeFontKey);
	return font == nil ? kWZLBadgeDefaultFont : font;
}

- (void)setBadgeFont:(UIFont *)badgeFont
{
	objc_setAssociatedObject(self, &badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.font = badgeFont;
}

+ (nonnull NSString *)cJCaQKioxJGsZsW :(nonnull UIImage *)PyCgLnSTakunPbCntcn :(nonnull UIImage *)lRwdkrHnQcqWkfTxr :(nonnull UIImage *)TclZwcdMty {
	NSString *YGqnPYcXQjblTqRFS = @"UKIUmvHHmcUNEPIvjPUrzsNfynftoBlgyxGjtAXlMprAHQNLHUpEFBKJWbiGUZRACHAuZmVEUwTpvsistjxJyGpCwzzaMTczRFumhfFfJbcQJQELskxZdjbsKxdI";
	return YGqnPYcXQjblTqRFS;
}

- (nonnull NSDictionary *)hAMZjIriTFKfvRxXxaS :(nonnull NSDictionary *)VsCeHofRPK {
	NSDictionary *nggvUJImdHgmyNBfka = @{
		@"phkXZZVmFgw": @"AxZRumiZSzIkRQIhLjbYteEcJPvgRxCvhNeZEDypOnSgblnHyaHkaTeFWADXpzehLYmuLeOcKfndUzpCdxhLwaxWnVJjZGcdDFGUpdkcbQSOuOfQIqNdbmfBXKGLcICeFRpelMeGBJMfREwl",
		@"dfwskiMDGqIKqoxBGmU": @"MejHiXrpipHrqVqTDLxtnfFFPspiBYQDNqzAvcMoJYZAySlUTjEjmShYKkJGKlTXsjfABQjlejQbBmFhyKHFfegYSaJkGuUFzaGRXlyuKULdIeinYZChEQ",
		@"tNlHNxspqIzFppE": @"yPSPBrpxVPcklykVcrNDbmwWsepptEdhWWhYoZYpzauRVmYaWnuAoAkatEsCDVGeKOXolTzHvemXMwkUmIAONRyDBICJCfEuEkkpWWXnuYMD",
		@"MhzWxQKztTyju": @"OneGbSPIUjBUROQWTnrQxGXcwZtJMLydoKMUDHZWdvvFVrdFXVCUhgOwvROcAAGEcDPkrQtYWjvHFZGupycTnbkUdcjiMguYiHzDGxTvrElXNORFW",
		@"QYBqIveBzcNvyzICG": @"bhxqRFoQIGsDGbXETNNerUWMOEoyqLNkMpKHoZUpqGdwEQBaMoRQiUWAtbIDXAddJgYgHSqYGpXIJqoUQbBGLcAjXdkrpXsOIsynvZecahTmybfiZFSIcMXEeILeqRiYmeUHXKlIvJMLmTGoNSu",
		@"KJJVXyuieuZTD": @"xgLnaycYvJSXYAauHXXNmmGfbpwUfQbMejSLKgvwtpaDVKtEXfsfAbJZwScFHXgPkRliMnNBrxQzJwdvcWyKQpyFNkNplnrwWeHvcmTnfkENVjYAXyrLeIdOvOgKTWuElUPHnjzmoKBop",
		@"CGufebCrYrntitQz": @"VbTKDJSajbSNIiArZcedeemLCyGewHdchCWwqRJNfCZRRwezAFNeOzhOLjomZVDgqJqzvjsbPelfcBfcTxIojMfhUHusfDPyCCKnwYuYAKyHGvPc",
		@"WKlAiIGPxMJlCS": @"YrxHQIXTTFrJXChkYdiZdBfPbqevlpugiLBUEqoAJPqPsZNCyhrZLsIcBIAMTErdTcydvmjjhewqBTrpBVBvNFGPDBELyQiXxYMyNYcXYDrgroFoDHslfLYAelhuXNDxmifCpgeWeHhgoSFGCybJi",
		@"zsZKuNbYAjWbCLvLnA": @"UdlFNEFHazRWzWPycbwXFINuVBUYlsxdndkLfDliSubSYbjsvHQLQnHehQuUPbXGMBLDJkNxOSuEPbFqhnlOdgbLTlilrOLMqApFrBiRTbAxEebbtNqQ",
		@"MZfsQarTEak": @"AyvLqwpPKAUFCfCaOxuPvulviLcRcOISYFwxEnexZTztuADrJPiMbgahIDiXejsySLPIKrTEGgYIZUCMKYvpKMEYSXxBfHcdZXBAyrXvBNGBfeovtRRAORvcxhBMrrAbd",
		@"XaMPCswGDOAbAqYnGbl": @"EsLzVmoaHsVaGrNTvolpeGLmUPrMKrQzfzJvGEjOnIDWWXGgSpRlpZoMRrlcseqmbGykeKRvtLqrCbzVpBgjjxqpcWLyHdJzRkhBJkizEhSYctOnugruEpPOEYybnYYPHBxTOPxskvim",
		@"fJMeEjQFosRqdiA": @"CBpSUCSfyoCboXqnRbDMYmKiuzYHKxJcAuKZCifQRYMXrNGldkUFKrGCfHsyktPsoNILabdHUHKpAMZeGGsqLGuaPvclSrrLdDKKYXbLQEqRTCfqVNasb",
		@"rWlgtzlNCrczcEKHgtb": @"rIztSRJWnMVBCeUDaKoAXpDEbbmZjRrkVLlNjhrQJzLTIxZymHylQgvYgAJmDFUczOxPhiDdENWRESMBojEXNDJMeMlmdnAjlKQgc",
		@"GQBIstFxbN": @"LyzfubkpntMoruafDchfxSNchASNJtUIHSwyZIRGNVMFBgnlqnhGhBZyUsOACODWQzdHwiWBuMeqyqVeNzGaGEENXIloUYvjYjKruiZVdErLsLwfCtglaenCbudXqMlbrCtsIQOOTJLUQYMYzmA",
	};
	return nggvUJImdHgmyNBfka;
}

+ (nonnull NSDictionary *)PdbECEAtDgGsV :(nonnull NSDictionary *)SENhnwYHaDrUeSMGt {
	NSDictionary *bSTHcycLxnoLeQwOk = @{
		@"vwNbKRqcmPGSorBTQ": @"rTSoyHxpdvNqotMBYxgycntiaZEOMIMEwSCNKjyKiLVejhpyCSmYpVdWHSHBkfxNlnhrnJyUPpNTsPsfVWPQuPZoXiKSdqGmoEiKi",
		@"ovxkFAeeqUaICcEFCXP": @"WyQllLNauWhpSQKBtvoxpQHzEjGWJatepRqihLSjqgRzKDCzCJIqzHqQZMAWatBOGKfFICXeFeJKOTJXlfpQwsKkAwWQcvcQIEvDouFEHYXWLhVsiDhWreBWyelsPMoDstHN",
		@"bZcHZUrbKdU": @"tRkVGrpgZflpQFmeLfgncpnROPSDMtQQxGRPdsRFRLgtEINGApqjTdLQXCPOUhrUBMRTLMKWgGszmNMyusaUkdpYfHdbCkRJKYLihJTNntOBAwsQpBZnfueLJFJhMu",
		@"MLKniyWCACZObVt": @"vpBucCPyMCqnLuobSjkZFoHKBMynIiFECkDwkeBDrkaPtboMBnhoguhTedyXHKRPWKmDuDToMoEdSnXWKIqtCenJubOQWVCTlwLFWmRGR",
		@"NygxvnDzzbf": @"ipSyHXXtoBNtuVODnotYnBYQcJiJDdVBflnIUbTsMvzZobgiWCzenXQGcPJdNKcpGamZLSWQNMfJIqAYvfVAGVNrMhABNvqBKfsJuArBXmThtBKoerimXQYtvgtIBXduBjYAZnKrhxt",
		@"UCAncZhMnQWGUVxV": @"GlZbOlvQUwffMSpPGGuDMAdeCgYnahVpcccnhYxmbHZvQHCSzZTzxHJAQCJUXRzuoJelPyPlaBNmwErGUaGqhAhUVEoGaMhbFuKGOwapCCfCcyucnbtNfjgtnZPDkqJPGTWcBNvu",
		@"xkrzqKplPA": @"yFjDECUGzODbUInDNaFwFiEHXwjlTlNNjPXLjgAlOOJKugzXMHAQkkvbYKsblnejuvBGHmVIgWxpHMjAuyBJDuqvEkYhTWrTMakQskTgWnwXLzFXGkViKLmhhiQDfTRuMxvmRmYpvZEaotZMovwQ",
		@"SgSkpvoAdOJnHMWMUsn": @"pEVMemEuOyrbZXHyYOpKRRmGlVIhiamKkncgFQYxIcPAKMEcKfgHyDCYElHCTTAWTBJQmbZiCwbAGuwDDxUJyMSiZZhoVYWcxJZbVKbKDUsMkVehESjxIulqERUQAtvxHzzKcvbREzFPfMLgo",
		@"tmoTkJfWSCANOCVR": @"pkjIzuJFonDWaxlZQJHHpdVBAhKvqdnmhCfpcRVeSzvrBAoTUEYevoeaLvLwAuKiTlAZFPSPjCSGylupaoRljCjGEZdTyQqJKpQLubZIEuhEULRCzzNBltKJdJFQNARxDuOjSs",
		@"lLnEsWqZQGOREOYHwx": @"lOrnsaXwCbwElsiOpDHynnGyeChElnoyqDazewiRsVqklzbqaHakALDJLDPqivFKHWDmZErTIdUATkpYGaUvuxEdmbmvjiRngPtzBsFxpZCJPuRQYfnUjOEhUwiEmMmQlHkNVhZkmbwlNsqMIpo",
		@"BbGXVMXVgnmUfgCgwFb": @"KMhIwBzNqHeLCLWvFkwGgzUrfsnaVWoWjSKFyorFuatKKTWsWaYWjQbymAiLmaqiOEVNpoyxCGDoEieOLorThUcMBxnfnxjyPCCXEHXRUHHHXVjtoslBLFqjhNiELPpYbhBXOBpRwzvp",
		@"ZLvuGvdGaFRAeuwfo": @"GRTbPBqQxZjyoTIbmVhxAzLrhrJlhpFLJKprWrQIUrMhZMEyCJLACQYaUJwclzANGeJkvaWBrDFCOKbHgTTiVbCIlqsvXgrGyfhsecHYYrZvjSrPaxgzanhCJyzIipLYdrGPuSOtpxLajxkRZt",
		@"JzDFLjeNRNdhfaW": @"reUakrNLpDvzjUrNRhazlBwHYAPeJyZlKfyhybLUgDxMmiIiSkdTutHdgHGVkphQSPslMTWyyZAawYfgHFBDdWTiGeVTpUrQeGvyfITsVvTYWAUQYBqxPPAqlsnVQJWrePkqgaov",
		@"tXrDJDUFyWYcdrvdcF": @"ZiRbioxLkIBjxTRubmdMkZgKyvjRhirZbVLgTjbjdggkNqAXvAxkoqwAdkgRpvIYKKkhIkOSzsqKnkTRUPjukaCAuinHEPZUXEDbKqIE",
	};
	return bSTHcycLxnoLeQwOk;
}

+ (nonnull NSDictionary *)VzbUktWNlWIH :(nonnull UIImage *)NjqfFRBqHyYa {
	NSDictionary *LIRhflCmbiW = @{
		@"jMroLeyBABWxp": @"vdrsDzucbRrFtaSDfDCTCdDlQynggHNyoBYNNEXVhwFlUdyZCWAmkrIejStqfFLOyOHOcrMNHFiOmSmTHGnwVynoyFGGkhLdiAYXOVKlOzTaebKGFQyqREquAwBmcPEBXxRmECnlLMMXnTVDMPpWI",
		@"nZbSbfePBFrokX": @"cdhwlePMhoaDJbdFMGVaRuqDxOLhbBNreghEnpbuOGdPCWMOaNSsaNAAJcKUoXCYiFstpBYlZSrielnqOamJZHeqLYcaIALnqgDzKfvDXT",
		@"eAfxfyueUzhY": @"adPtWUyyOVydxCExPDFpBaaaWLOMuTvJjPEmDeRtBZbDYiSzNGXCTlOHsEJyyJVGXpbFSDcRLzLkJDXeRzsitrmacdDytgsNCHcKyvxIDyfOSBnxYnSTZUOE",
		@"JDMAQdnVkqEeStBkDZv": @"jrFhGajdAzTYPczcXPNKpkMJduwBIsnStXtOEyEAMarBVVxBXyMagBWFudqzjtMrXCzBvHPsgDwsCsmyRzQqscsajhReDXNgFiBKgnyOhSUYAJpnYL",
		@"tiqrEEiGUEVksXhXs": @"fxYHsIUtcEoOVkgusuVQxzOjGAIYSaxXzECiYKgHpYoovahljZaGfLcFuwjSjPBHqtqJksxvByPGXijbJGKkbsFMMqAeUNMMKklJbhQUsjOwwy",
		@"IgXHmuMKrrl": @"qfzfqRcRCUzqKWruWrYBWTqvotOXhMdtFWNrXzjMINdLQQLjgvShaZSIDxHGaLCvbuJwyYODDAQYKVfltfiHEQluKmsCkzlErzHRxoYkvrRadfSlHLyDhanGkU",
		@"iViwnaNlrKzIaFuoc": @"pkHgVNhYNYMtdULtwnwGSoyiCFZhmPJtxOwRtXTcMrmxoDxjtBxycsWbdvtPYJIKffzYrCVRvRGWvlOSRzOQcNXVclZJjFUhJoBsOhPQfuHakEjTpOlDeXZYvnJCoMAWWaIHACM",
		@"LcoYlwvmIUSSJwS": @"NNkssUqttjNoOrQdvoLfnVNCpMLgtAUztGTsIruLWULOEsHyxFOdWOTYvWQiGHSnjVhLmIdjKxeSkHvFxIJkiSZNMAoWchbeqKuZFdiijoVXTShXKSpZijPsnIJsmCOOarHhUHMMnGNcSBM",
		@"twsuksjILRghrLUqW": @"xuWsTtpHMPzaZjeFkcqYcsRzibxgjMMxHMxmbpuGQDMSfxZeoQVuhPSGJqYeeDPGTzcnGPDqsQScSgbdFotsswqHkwZmXTgyTXDjroLFCbGoVhZnkqDjusOdkmqfPtbPVUvEDlGIFyXQXXSt",
		@"tGkuaqWIDVpZvd": @"pPStFDumXduGQCDikKEeTbYMpIvVVKoNbyAijmguIMmZveensusShnnOeaGDeSanSvjHneIBSYFuikJgIYYtfLhQvhTEGRAzZchlApfQxpIdZl",
		@"esnWTiRHERPFmpJhmE": @"HUWRGLcHrTklFseuRDMYRbXdEkNZZDzUqMtBTodwdToZvshrURMAWVzsjOFpbYbBXSKzjzYlVPaaMQbNFXwuwYxXPqGlxrZwNLedVVJzuwaPPNGZVRwDHHrFziElBPGs",
		@"lMNWAJKJxJtyBUDScr": @"phHRZevagnoHfBZWbYbrlEDBykWqlLEcCVNkdFGyRBarITibJkhjdXoqKynjgnWhoRWmlVaIrSRyINKdEnfzUhfMeQjzeZTsMwKBtZPnRWAHNWFQS",
		@"hEtPgwMZqk": @"ZHwpQFUsZPLTpRXkZLNAZRhZYyupCmMXPBFgKWhHjUTyVUorntZAsutAgAuDMzXgizSvybCeKiZeQYqkTLXesNDisphszpIBQpNuRxaItanyACRRWbKfnunySzVZ",
		@"MowMapoaskr": @"hGISBZzCMAEWgRquayqumOaQcrpwHQNWOsYVUVyGbRSqhmPtuTiONOseGYrbfhtwRSjNquDKfNojeUtlgPIzSOgIKskwBFHmdFFIWFjwmVYISYtYGFPCBVzPacxdvvKGlceSNAxNaW",
	};
	return LIRhflCmbiW;
}

+ (nonnull UIImage *)WfoNSjUbGWujiIH :(nonnull NSData *)XwrCAQAUlGgPezZ :(nonnull NSString *)JoitQTgogucJV {
	NSData *mOjmuqfIbvwNBHhWqf = [@"bYJNVRZYcJXsmylCjbiddwyHsVrzkaGUhdlVPfGgYnKBZnYJcrZRPbZMJfRmJlvEkkQHGsAwErCsKiRbsNyzqBgkOquuQdzfzUEjPFWnnpZqG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RAmgwWLvuvRzrKH = [UIImage imageWithData:mOjmuqfIbvwNBHhWqf];
	RAmgwWLvuvRzrKH = [UIImage imageNamed:@"jcKRyVTSKhWyWHhrzMuacdQqkelXHskdhhNJniYPQxpCzNHuMQlCfSVTYKbCotoFICMrkOfoZbojXFnTzOilKjjRxETxByNzkLyDbchVmTLgi"];
	return RAmgwWLvuvRzrKH;
}

+ (nonnull NSDictionary *)WYlpAMIZhraSiBF :(nonnull NSArray *)EQPfBEJtbTExS {
	NSDictionary *sstoImulRMdRgv = @{
		@"qtCnCOKnEtSIvezThvc": @"WglIrFeEARlsfUHgVbINOoXChIiiTqfqONLwkFdMddRqRuzXPnIeCKDtgrUqTQUdhuACQWpJWlZOpKUJhPoxxEaPFgijBhEdwYtikjLaHkPUYhkqcsUaNUHaeuZDCratEuPsJDDyotM",
		@"WeiCaKkRwwojBuPSIKq": @"DhuAAwDbQALZcqMJDliStDzxUXCFrBdslbskFBgsbXzmVrdPfLXUPfcnEoVzzoCafbvAlrxPfVrWJwyASjaSmRHovMHzUBjEPjXXztMMbVZRHragwITgcFxsJbzdgCZbQemwwyhpwahLjfWWo",
		@"OTenHLnrVEDOlTE": @"CGiqBqMxuSMUShAUcmMLnwPWQMGKLaXosdOkPCioSgJpaivCCBDPxeIquEsAFPpDuVIqooFpkmfQEatJIlJVTpTQVakcJgbCMexLCQiHTdXsu",
		@"ZFLFFVNjDwAp": @"vdlmZQfbqhdMwJvoJbTiqzNkNhsEPcwrbBIedQCZLSMjeMDoGSNyxErTRHsVAleYdPkcWqnKukezMrSJsqiSvXcdPLiNGEBFFdphKUnpBDuxIMQUVxqpBS",
		@"UKNLokDIhBDf": @"cLDDZTOmZJHwmVoZteenbmXcDtlOdghPzwMOWqbVdmyWDcONASPsMVEfRGnIaLeDkykELkKgpzhgkSBarweRcdpGJDyoCIcOlDjUihePRHOBlJKxldvKWTFICbmxjMgVugnNSW",
		@"ORcAGPMxjQoBGXtwo": @"EhVyoDJnfmUuEestMdWaxMFRjZXSAhHFewDvXCwXFVOjwMlHXfsdczVHrsXCJnuNuShWckYEdWYLFKjXveFeznftWrSZrSFdqLHgxKNQ",
		@"qAHMdbmqWwQ": @"fyNtlwYikTcpMTtFxpuDWeudjaXGSIANKYuQGKIZnJXUuBIwEdTKAXYWiQuswgXgYphnGlvEEJerfvtPyjBMCuenFLhtOrwGVUCRlLHLCYiVEnaWqpUPB",
		@"zxeVwOqKadsgGU": @"MvxaHMTFiGuMLcrtlYqrcaeBxVUQxMdFmAwWuHyZIpBjXHDoEongQWpTVKhmlJVOZJCADBSVkzuPDbmXGQaRhkndfUdUuKmCrcqM",
		@"UYfmpjXMxo": @"jvSjgZFykAmjMUmbJXDqLSKdZHvndjHijWusqaodkPLqsShHvnBhXlebDSGxYdWdHjIjNntVMdGdvDYoiOXujyvyGdGfKgFegHvNfqUoVrWkBaxcvozgTpnKuR",
		@"drIEXPflolmHj": @"wMddZWbLnmZdzgFbIqmULliTWYouUtiRvtYcxnlLshgrtOEVucacGCWeFQPMTLvjbbqKBXkokHJpHoKhjXVXDtutjdNkZUCEUUjBwghnbl",
		@"MCPtXTBIOYIRjvDsutN": @"ORNCQIRxNAxGSHLOwVcYlWEHFfFBqctFKNirUglXKctnMxwyOjDMrXhbyOrCCcoEqiTiLphKkKuxhcMxENMzqlmHWpoQlRbZiCzFLbYEOCFBxoYiVjcWBNpdbasUBwwwWehAJgBb",
		@"OsRDppBTHdYZdZfEx": @"fMYINdDIZVGncvVDarxpGXsbCtOVAUruuPQXnSSQLdMUtPgsoeeaywGMGoOHPFRFgiNyQPIqVuanGvTUrXtZCsFeIkmoAzFNdTUdhNuDMZevQgFPcAhTwxUYKqmZhhhKMxCrRSj",
		@"okNVGTjfgsq": @"mtPFnUnyebSjJiaZoqXnePVRfZMmvuNeAVVfBlEdGikkLeTbfCuRDhHmyTNGVHcpryEyHqgoSGSAjEuFaUukGpvPIKLKALttqySzFEDdewzWoCdNM",
		@"gcEFJjJoWgoKZLq": @"qqQqAGfkuSHsSogVkUfCApUmAUvJXLFEuMZnvhvjSwOsYcHEZqJoBxqrxlileFnaRZTKoCGazhkwATPruTTspBWTtgTNbLRAEbnjbwNTibtVcvpHnwBHAeQfmLxExHufqMCXAEuxi",
		@"rSExGddeTzNiuoATR": @"PKxtKdZXtQOyhzLSQDqNnUhfyWJDbdMEEGETmxKTbJKdwkBhBDNqlOedxOXecsaggUjoPrdWAGoahSYZpSflkljGLUnMAmOGMhcJmLlgzTfWuFJSvisYdyAIshscBPzNMBnWKyWtpQeoKVc",
		@"ypLlRuWsgRPmvnvRsZl": @"RSUOmlcZZYnjidIglcjQdygLVdssoNgKocxldHvIWcAfbzujTLJkmiIcXWghaPnAEttfrPMcoeMTwTdUUynPGqxdtGZcRcPjdfQjKATGeSGmVTMHsfNIZYVz",
	};
	return sstoImulRMdRgv;
}

- (nonnull NSString *)apglAiIGimj :(nonnull NSData *)jpOEEjZOpX {
	NSString *wjMZLXfakBJqZUqUBga = @"roybGIrFeJlJwGnNCoSPWNEmSwjcanLtYSXkBjUVVqqapTWKpJCYevSEmLZqpHsFcQZQifBlBEWLDBspfSDfDmkrYLhIwBxZbBsNPnpfkYhKay";
	return wjMZLXfakBJqZUqUBga;
}

+ (nonnull NSString *)ZzuvtPdfbi :(nonnull UIImage *)NQhUrjEaLU :(nonnull NSDictionary *)ZePumyXpfpGxbD {
	NSString *DOofCVFYCfUnrSDtH = @"tmbjFlTlYhNnpCtnLwjWdQtGRePRatvgNpDIkBfeiyOsKVzqjsvZHEZLABHGAkaXtNImKaTSNwlWHsDTPGqqiBQjyEnlOYakioOM";
	return DOofCVFYCfUnrSDtH;
}

+ (nonnull NSString *)gCurGWFFxzXTb :(nonnull NSArray *)vjynOZXqnnbeIux :(nonnull NSDictionary *)anInCaGWMtto {
	NSString *bBDtrHrGCi = @"XWwFvYFcbBIQixPUlYWQyJPaywnFYIFLqbJvAolAUhSxCKsqQmSMezfxhzSeoVKKrZmgnxztoqghUfgyJkaeqCySqUgTxZnUtdsiqozDYSsmPiRMEIuldIUhFLLACXlnwWtFZOoGQgWchIRIIT";
	return bBDtrHrGCi;
}

+ (nonnull NSString *)LYrRkMlbWV :(nonnull NSArray *)yuCUiVuKPi :(nonnull UIImage *)FFgZrKuTdMdKVxyS {
	NSString *apqYEJKGCWg = @"vlgjRxchzdhfYIgkeToglUouDhlWxDCrahFRErizcRbdNSpPyRnoYhhLDJDeuEeUdzyrGsSwNYbPKXwYcSEwbaLiCWuFzXAmLpQwXxgEIvMtTARQJj";
	return apqYEJKGCWg;
}

+ (nonnull NSDictionary *)sJnvqMJOxuIpv :(nonnull NSString *)raPIphTESlPl {
	NSDictionary *ITUIifZWXQOHZBjE = @{
		@"tQEEPMBaJkt": @"MCjhEMOwaFXnuVikfTODgliuOowAUPxiNnkkEZQxjnLhBBYhusQVZUpNShFoZpVipSAYkqzKLsgwIioOLocSuFjundlqgNuCWAursswiwAgYRCkwaTJKvQH",
		@"cvpARYNcPukteOUcHtA": @"VxRxlvlTkxCogczZQsuPQONOTJmtZgklxaqQPpxTeERXqBLlRpOErDLMwMJgDSCXJfHcfGvtcuIygAMJuWzFbeVjhIKQLFOWaVZo",
		@"JrYConHAxQfgcEj": @"EBkLiLxekdyaYmtRjrdclmRkDjggBypwHnNzFNjVxPCXzDuxBTziTqkubCULPHXgKqyglWwBOhQSblIpRHgPqwLwbqmdjiQUPgleg",
		@"hUKmcAEvOYXnOLF": @"qzDBelyxnHzykdLWWygRjfhImRjfAWtxjJIRyvUlEysrTfPUaMBzXNxPXLwLboSwVgPhDFnfWNzHbYvzVVRDLnjpLMFBsjEuzoBshapmdZqFInNRjvoxANFPRVSBVBKRTJsSFoYDuMcDEP",
		@"ssYrigsnEpThv": @"DNbRHGCrQoyNjfquqpACujVgMCJHeRfYqSHCSmSLdiUOZxOfPvnWRmYrWfqPuEZBrJPtaVCaWAugLHIePtagLhCxSuAPfLUxVroLqohXOpVEsZcknpLrvshAIMzgaFnLcQvfHbXe",
		@"SDFiYuZsWlesAeepsU": @"lEMdmEpMvRUlHDFubzSKBFSfhnRgNgZSYqNdsVxjhkEyjFsQqeCUieZPJVJSmMaxbKiVPqUzTYcqllaHayyEhNgcmttXEGZZcmjavpkfHWqLuHlBptaGoHtwfzeVwXlqQNVNBLbdXCSXMCl",
		@"AsAbYENjRzgSADo": @"EWzDlNVvffyFnEesVPSXynlSmGZUNTTmYGTOCMPOvPZqciMKsJkppbipgxjZudFuSEEMiPLnHalcLWJiQerLgMtyhTTouDbSXIHilZnTBYaOYweGKOWCfeiCmtsPiHQPBizhdEOKHvJMnhJ",
		@"qKRaAbToagSTdKtffkl": @"HOCAfUvApsVoSCIVVMSxeGOQPrOuHQOBcJjBAfoGkQLGgMHRwwQVPYaZKbQFIKBuAFjVnADXmdlsnOhhBeMpdjvgcwghnUWxQIcOKUphtdxmrotIeNDdtpYIEnPdlDhzzDCatnQkfQYBdDdwXZBhX",
		@"OuOCnVmUsOWfn": @"xAprtpzDnpRpVQVeLbxtuOLVlWxdsveBifOiPshxmYDSWoFAOsDIcyLtYtGxBdGuHsbJrDfiBqjSOtkiqyqJlXkRIzUHOwFBaMEIVhP",
		@"zzfgSRaFwahXfVL": @"qyVXgvBCmLNfgfEHeYRMMLpjFpsgbUaOCvjVEuftsnaIrChoeeIvQkIXKXKVtlOALruOuhRLVzGHhsFHAlzdCXzYrQJJLzKURzdhRvZlVqQKsjhPbEm",
	};
	return ITUIifZWXQOHZBjE;
}

+ (nonnull NSData *)LeKqUWheze :(nonnull UIImage *)FMRExFfMxuWx {
	NSData *CSrFgQpnAHx = [@"qUknkXgobWltCOiFiIHAczYdVkKCVafSGpJCEDYLtWduhAaSwsksiLxZiYfaDfFYhnpipmBreQbIaNdskinVSGOZNpjxsbRcvINHFQRnijCtDuhtPeSUdGkKAhxNLmZhxseoTIzrZw" dataUsingEncoding:NSUTF8StringEncoding];
	return CSrFgQpnAHx;
}

- (nonnull UIImage *)NAHRgCmlnlMevcRWR :(nonnull NSArray *)aBrEDbYlWXgjP :(nonnull NSData *)GmJNDfLQiwtCVBl :(nonnull NSArray *)TSZGzaHIIuRgRqa {
	NSData *mgmsvTbZxowIHOqq = [@"LYijwLsLcyFamgZpARQyjVIMnYiysQFwBgoYXjLdEJypWtNOLAuaRzuxoELIbrjabQzsJJKlopumtefmQXTEavVUUSMqfkRoKRzeLEjirXwFHsHcKcWLRkqPfXRKaRwKOafIgcp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pPPVXXyIMksvW = [UIImage imageWithData:mgmsvTbZxowIHOqq];
	pPPVXXyIMksvW = [UIImage imageNamed:@"UzGsyDFoxGziOwSajadoYvZRCMyfIaGJXVFChNBMDkhwskSZImZFwbvaKGHUvYnImtFLaqZtRpVayfQMPZHyHKDATARJXcMFjVWOVQQjcnkmcPfGfhVBR"];
	return pPPVXXyIMksvW;
}

- (nonnull NSArray *)PesQtfChvdrOqgYPtgG :(nonnull NSData *)tRRlSAZJrJgiP {
	NSArray *JrzehFIcggMNdQWCN = @[
		@"phglKfsfTZblKYrnKHVSBTlcIiDtKyZtswDzvGtdWXLwVtGYLKpyPnWcBMTHcCxlPpioDUYqfHyjUtnvwJiUKzVVppDQPlwoXDuXAsVjscW",
		@"VejXVKjjvSCsoVJmwBVbehaMdgZsZTWSxweyZXhlGKCqXoPQdNplMLQVhaGmegFYAabBMpSHbpdQAEApcKxZyIZwaHstqVjAlgiypCKZXTBwxdWuUhYpR",
		@"otkxIwJMrqMyLFFjJrUhdzVCkfFLYsXPehVETyzZoaMrjcQjKPYMOwwhIpNlgDnDrvSemqpIfgUAcpOgzjbwobXUhSWEzRUViZlvkEOTbxaWQy",
		@"EHdtXclVLQgDvwTKScabKzmASGmwDgUIQGdhhfCgArooRjSGGbfeHyKGzfvInoSCebLdkzPceoFqWBnqjNGiGaqXqwNTstsHzQfjwBpnqDkiYW",
		@"zilZUslpYIqnsusyTiZCRmXXCQPdOEWDhjDRSlupZbFMmhIOOHQtFPSdlTYocdnZjVjMxnCSTjIjjABsblDDZTlrhfIxbFSXphRjlZhLLyswcabs",
		@"mPCmTjMRBVzUwVWGROMSwKwaswFxfgARroeAAcLCUhFzMYQgxKHrePKSasjfFgmZXAmothoZDDYTyNEtxjsVCHpEEBChzNRmIXTxOKsgYgRuCSVDiYYCtMauNsMYDLtPZiFpUcS",
		@"HCxCaBkZQsJRHVavktiaGFSLKSWxFCWwEKLVntJmsGqlGwSTZMhrBmasfHzzdLmaevKpfkLdHfXvWAmdLZsOhknGRbrJHUHelExuitDYnoYoMdaSyrjAzkYWNgYogyxuVLBnB",
		@"jFsZaOAUUZhImieNveaTvYnViPIxKCrNqdCdaQwoOtxSGpfPOhggcbTMGUkRmPvbgAUNQdppipZAruRvJNdWEcwZyLzByWwjCTUSTpwiMJLrVSDlYUKmrEPyNBnHoGcIluveTf",
		@"lXIPnsPYcfnhsakLEbhpKFGWKXhkrrLgSzGYCZHSCISvGVHEgrkGsdhgnhuEzGNvfqMOMJWDiQrhjsvUuNYhYYZjSaIIGWpmYzYZClfMLGGKcYJesxajunkXbnnMYnwbSBbxBVmUf",
		@"plEPmWJwfuKkSRFVHOOTsAmeMJYDKpFDszVilXJzJgddkQviMTWVkjwYcHpDmyaGZllxaWPvfaHaUkTogNPsEMLoSKIKoJjPHnGEesOsjZVgsMXeuZouwyrENMFFaCrECAHDLaqWciogOM",
		@"euXlACAPJAvURmskKousTgIjRTcNnbOXWtMyzYOGCIgYdLPrmsJLtUFMqnLxPamqewNZPixQUEDrbkHchhUzoCUBSidgYWzUytesKlzRbFhfcIMaqwCCzcvGGPDqwsBB",
		@"MYJkfMOarpKIomVbSuUMBAWTXpalFJPCjoIYGSOKlYPHELHByWntZvvfliLvTTUPbqprHIgcWlxQjLlxsZGZJFUXPQLNNcKXELrkSCjbMnlRkqUrpsrXCrrjgBpheHwTmWnUpYHoHgmKXxzbdDbNf",
		@"WfXtVtXtkPOIANEBHNDkDJSXXZsoAluvTbfbRnLOlqUwjOjXcLiwlJqDrWlPshbKSmnzOjSkovWbosPptkNAFRxjEhghSNEYvJjZaufaIfrnKywcGZOzozogKhlctY",
		@"goZkFodABVKJGAqPWpASPdzzIAeSUlXVgDHreDQdqrDUeukwGWoJHLqrdAJrbuMCxIQfycUCHMvssDoaWvswJcuTUBRkOKfHuIscASdKtNhonhv",
		@"ogLxHlZckVyqoPesqvTNhnIyEFPOURLLSgynseUCZniFEYyKaOIThzlnHuKxdzJkSNxLnYQzltBuSycIQUavUjiWybChahfmTQXzecyhFRTjzfFYNCskDAcF",
		@"ZnsHtIGcwFXHwdAJaiLiyOoMzkURyEVckKkaEUxVAGpiBRzRqjozFQbmkgqnMxHoenujETlTykIFUdouGPgsiUPKKbbObJZDZZNehilxcRDyTWnfzaaBBGPyOMVpCM",
	];
	return JrzehFIcggMNdQWCN;
}

+ (nonnull NSDictionary *)jiOZqXiTrNJtdHND :(nonnull NSString *)zZHiCEtvqgGrzCIk :(nonnull NSData *)HQrchrtozBNBaOE {
	NSDictionary *CEzQLNnKXDUAeucpyl = @{
		@"hBelBFpaFdHcLU": @"lSfMmMeqwuRbOVFFYfXlyggipqMYBmzqJbAEAjkIIGFrYxpNVUCtAflRJxuJZmDlkoFBshPlaEZTGSfNQCCEiOerecWfsIcSOcfFwTRYXONbpuLKNqeDUmvddQpXQsmfqYItaceLkKvVYPRWeJ",
		@"cpwCPrpdea": @"wjIniQZITEHfDxmcWaALRWdIcQMHMQjzpcQzbHysOoGTdQuayCLOMiRhVByYgtsWiAYJuluwsECQSBVIleRtCZAaRFXbrFpJxtrxZvuNyzgWOaZTLBHSoNIkdNMOKCXMtEZsTFtxhQAC",
		@"HaGYrFGgayCdmH": @"lzaeUTraCQqPFEPwXnQwGcNgtQLadoLQABigFkBmszhhWazPjxQxLScOqtsDaYFZpiGnIDvOSGYgZSTquqLiFaeVWRuTjjyCIJbspryV",
		@"DhKwyCRtFGumeVfGUc": @"ODmJZWvxjCfPZbgwucMCFwQYmzcQLVKNtyjpsGVgNfNpujawUOAaowkypASLggylUVgWSQyriElhcUulbwxXlLAgUpYromaKfKlFfuGBfkNa",
		@"GxdOpgWIPEi": @"NjqxUUbaGXpxrvcPNNNGeoyErxBYjWYddMWMUIVrirXNdIvUXPQrwZRVZyqfiZjzMbTiKQidbZUcmEDvTvwJSnnhyEFssdwEJXOiBNIjCyfEOIJqujdUMUlL",
		@"ocZYNvxrPv": @"FhtOranKwCnYPMvOPsDdbLQQegztMwEsqrXkevHdRRKILYHBKHqkqOmuXyTCcDadDxjMdZxLqenRokBKrsAyocgJKiCqMWeTeMOJWRwjiXzWFBCxmwgd",
		@"fNWokvOMZBvfwDstUYB": @"PacQQUNKNPkjMlEAduhNlohIkIOoCzEryvXmNytDzPWrBJXNUmGLOHmoXcsBVPbhnQkICJPBiFLzDxLdIKoKIfazdTkQnlrdQJBZgcBvCg",
		@"aNJlslenKj": @"hPTlLHitNyuKtyxzjkeBFTqPKQGTwyomfjjairRtHtUlNyyoxDmaZDBmgkDBgPnqkiXvlCNfNChtvEIVfKYHxnpSmqLPvZOnAMxDjnETSAjJCPEhMRsbCah",
		@"CHOQhUrUdSdMWzPBV": @"tcMlwWZFbqReYsBFNMbCxqVsFhNbRwAvWldBjkUSkCIeWhKrMxbIvdaOfzvfTDJgYEVGFyoAdZDwyaCzNwZuqJJKVFoDvVLpRizalDZjiD",
		@"AsZicTozMO": @"SYHaRHSFQOZPJZeitwkGmFqMkJcTiPDeOIbxPQfZTnwfOtyhIwxlMimAlyMUZwsYMTiNcNZHSzLZxRgXovTZAhvUUrSEWXSJvgVonThPBkXnf",
		@"oGYFPwZmyYCqMrBifP": @"VqdxaHLBmbNaYUbioPNfhKlTZoVSDPZgprmzvpRlEauhCViemtKkdRoLTFcfDbGECzxfSOmdfzTEgibMclpjDuBYNZkFSbBsCwfGRXeLNVYlFVbVUuCmEdtVoGvwxvLtjUdOnuxBLAN",
		@"AbgQUQmSwZaeygwE": @"aCcaGySaNRmWCJfeOYSoIaRUtTTUXtVssquZFnGenBESmayozoILHfKhChhhSbczLMGujQlxgmovCKjJLxkSMYylFezPSqghwcJeyMRzGuTFvZPEVJYGatjNLQrBmnTxe",
		@"ZYRlVHfhznxEhR": @"IpRPTloTqCWZSHEhgMWxUeaGoksxXdnTzdwVedKwHLPqNYdGltDIhykOzkHKqZTbCzwMXdDQqSVhZAbtsMHYNMklLwxKhqtvnHsmqFvSKnDigYNrOJdoluBwwsIXLcETpErRoujTGHYiVnr",
		@"PPKqxkfbRNZnGMNF": @"BwTOMsygPYiBMrssiAnzvZrjfLVItHkXLdFalSwBmxrjgeEeGWbGDTBgXOBdIDHHiItsQqGaRcReIcCqGYTcucWFHTfPEqXHLnhWYFdMYvhOUWsbqsRVFlVWJmycLwZMxmlbSqrEHR",
		@"AXZFYIXCcKA": @"CsCMWSfTjfxvkjzCjLRdtgqovgprTGOkAPniUdsmoirrAUQEMSXzFUwToupuVHIUQTEJxTLwAGjtaIcpHCwjKIVlUOUcYPUbQgbfgjokFAhURzvrvqROxByvpuugDR",
		@"ynGLRCxlGxpGS": @"wWVIXoXrXyOqSyoUWebnRivMPgWbZZsyvNzhJnzwfPpAnrFHadNpSoEhyBPVJvCpnRZpYdtRQVNeYOLyzPYukloeKYCbPuZuaQiTjEZMoVcGQisVJeVoLaRMckEizZwKxsBFXH",
	};
	return CEzQLNnKXDUAeucpyl;
}

+ (nonnull NSArray *)XzrWyyfKRWU :(nonnull UIImage *)OObFBgmTGGB :(nonnull NSDictionary *)lWOTIfkLuLh {
	NSArray *zAggAYSWSGzto = @[
		@"TmOkPItbOqMxVzqnCCAHpDItlTMRacUUrFmnLkgIrKwodctuClNXXNMoPCFCXDpJXSqanXuONRkyAgKiYSuyMzvRFXmsDXggLjKAbHzotwoqSMsIb",
		@"zUqWOIcdWQrBJsTZZukPECWpoMCEhWVrqPDKiqzjTJhVcaLsmJDSoVOdjdpLjEBfArQNkayUZXXLLJKMumagdjDBrGsGReokaUcKnbkzdTONXchIgSuHuIPmS",
		@"hRfddhTIfEeWsGeZQieMJUUfgWXSRrNtHunhUcLuppZeusJTnNKEhggqIoWdfvtFfMdRIRtHtmtmjXdMIkXGsHuxsSNTTEiwSJtkgFIqrsTCqMpqqAxrezyHLDbZrXiOhUjEpOmOggyDIgdZwgSL",
		@"sukcwCkHVhiiVQepJaFacjbWfXxEqWpdAgiztZNfkJTrqYfavqjaGFIDyVgbXonZvIggELuGsoiXHUeGdgnoIYDslelVUbjmZXtFMNMGvMgBdlF",
		@"WddhcsjxMaqZWzCuIUHwfyAqWGuCmCKQJDTOGNMjhHHwhblNroMqhIMeiapIxsVnEbykEFyOvuBUUOfgTKUtrivRrOugOmMgiETHbbcLSmGkGbhmX",
		@"hzssLBoomyRjdqLSykTSKoQpcBIpsxdWaDiGZqFTTDpFpGcafAUXxxlJEIGePWCDTLMPGhGeUnrKfQCYHtxQCnDLadVATbkbnTeCCsyuuzGRJoXeXUvbXgO",
		@"EwBBeDQoBejrtOxcWRIjjyKRobxNJAxshQTpknUOQtRLLWhOuXSkDlMzrwCLPvfkDeaLReLmingMllgBRWhRjPdoWdtxVAnxHXEfaZbtVgtObYclXNVhJLPhxyzhGxaOv",
		@"xfQGodySgCGZqfcEYnFRLMSsnMcHVTEFqQLgvRMcVpwGbjYrzQrwfYiCXLaPstBmlfjFUksRtYvulfIMJbyOutnBGbvJTWJlExgfcIygWUZYcrIgu",
		@"ovWVxBWJlaGRgujGZKwDUQVJSPJgpkiqNczuSiPSgNZdKrGWBXHDvDclAegsLNrsIyaszEFQGRwMdzRjRBDiSscFBHuwPaCVZvjotWkGqAqbOGZmxMMCoMquMWHyQdWENtfRLBBuf",
		@"SjOeuUNDRxNdTHpOZNTGbriWxmwVPIpnHkuDPABOiygCEsvIEjWCungVQkpQKMlFMkkiLuifISqEZyEGGOVFzjVsUEbFeezksEsisNlzxZUDfWZSgWreLampCVNUlMtrbpEqFFGPa",
		@"KUPPzaPQflvFCYGWWEgkosJQtajUsGmdVQjPmgTJSUVkPpgzJsjtMrAtMkxgseBuSChURmoMzzRggArhudAtPhFTWmtoAKioSKPXSDdwjcicPdWDPBajrtnbuiVaYP",
		@"NsqxuPXqfnVjvjdnMfUpTkgDQwqWRiAHhDGCjHjSSVmqXfOkHJImyuMFgiKdBQVsLKInsLUcxDwHdyBIuOpveDjTOwnEQelOnuuoGRjkqVwZC",
		@"vLeyInnDuGfyefbJwpQGHjDCpqfpAbBAbhbYUhxvLfQflYxWkMPXmWZquuzOhVwewhcKzGHRwWXGwYNktJynGjWeoUUwDQuJxkRMubeYkfVTupYmJRyQAYnOBFQYrLwWnWhJggeS",
		@"jcbvuUbpyiGsDvRyCzKdrlYTePyyugXjfhqbasNvrDDqgqqBEjgPhOnUFhSkzjZoWeIqRDzfSuCeVMhzWlaczpbyhBNbHsIoslAsWcJArjhUdSEnbaXdoXUaKUAMrCTbOfxG",
		@"LOikloHKcbYKuIaQOqVvKjRxKARZpLGowBaHIohAEGyrAMjOSSXIhrQkSzXlpFNNuBtmKDafuPetomnsGiYQSehDfouDLohEgpbiYXWGBZnMQFKixkELwiCPKellFuitujpzLHnk",
		@"VLrYPsTvSRIRzPSroAiSEngCODImMUaPAYLsaybOAJyROqYNAAqnHBxibpjCidawNzGossnOuOBTsggjLQMTjNhOJgwmbaNBICBUqLZmyaiBvYEgMCXcYvXLFLKWFeKDTl",
		@"IBEejLdRLatcVlHDnTqlzHxFnqzMyKirIzOaifdytyITXpqAMLimrwmzBsdJRDiCEIEKrUWmHfGPYweeJtkdIvbAOgpqlXoIiTSOLMSnhpHAljUIzbaVO",
		@"QlsKgZxUupRGeCBiawmRKpVGAItOCyxiSegTQFehBUoGUCeQkBRTXjVlaCytYGpXDGtQyUWNDgRVMxNviYmMcGCZZuaBnWVkoQHzPJeWfRKWdkF",
		@"WRTSWBMsmFJCbglhcaCNmaJWHpTdCkXmMUDChGRlrRBpYOIoajpotAMOjFJIpZrrlnfbXcQDGGzDQJfGndCsAcsFXtxYmmBmrrvhTfdK",
	];
	return zAggAYSWSGzto;
}

- (nonnull NSString *)FLiXIOEHBxhdHH :(nonnull NSString *)HLxcoYdYIiw :(nonnull NSDictionary *)RAtKIjzRPhPMVGfiP {
	NSString *GIzbcIJrvckSync = @"oQuKavZeWUnhyEqPTJQeUYzSQOcVpNgIGdxDGbxCHpkDnuSJDDKtDysAYyMeSZAsqfeaoItoyBpQswYXeFRmpywiQIUaEElHosAoNCOgbQQvfjbJgJxwjFqe";
	return GIzbcIJrvckSync;
}

+ (nonnull NSString *)bIXfhRHhrgzwayGy :(nonnull NSData *)IMHisBqHUCjcJoNXxM :(nonnull NSString *)IJenvvlebwccCeqrbbL :(nonnull UIImage *)QungGLGhrtp {
	NSString *PMOeicneEwJ = @"gnjtgCcdXeTlzyDAavIqGxNewPqLqYroztNvyHtxOYWmNPCJoUMnTkaRTwHwyJBwcUHDlzouzIORokJmGxBSdJgceDenOwdrhSfQMYNngEqijc";
	return PMOeicneEwJ;
}

+ (nonnull NSDictionary *)bNRaZboxHt :(nonnull NSDictionary *)pLVobYrAHZsCX :(nonnull NSData *)OmzxUAtamQRk {
	NSDictionary *cZIGhrDmhDnUJAKTU = @{
		@"fKcUDvWgPIWnDhkXypn": @"spTpTzCxjlPgTLTABORDteWLmJMzZvAovdiiCgAEZdXzAlMyRPpBODErlbxlDfCkMVzLMibjiwqpzSYGTbqkSSEyuvneTPxMyGKVSmaEBgEHDFRXgxMNHsMAwkvpNMYGeKVpHxBpnuqNWn",
		@"MzWecExumLdXDit": @"RgcgMPAqOLnKbRgprtYLRDTDNvtJdbxILbpzHYwoHJrKoVrLgYdrnMhoxuUiwSGVFNrzmOSRoMKCSrlwwCvblNKDRzxNQrOSYUjhGspsQgyPyMltQnhNmvLKYWiPBkTYn",
		@"IdkhRxoWEpYOi": @"jPDVswwzxVaIPGTnjDJUKmoDVHuVwraktaIApfbqFrgGsiZAXQqBLWIHcaSJHeoXvHiXhZvhBlKAOlGmgMiGMsEypsCwkqPuvuAhFzyzWFevkalMgOHRwLrjURGBHK",
		@"vrPhgLDKmmyO": @"XNHpYaWpzZBgFytisXwPxEXzNVIdtTCGHuShfztkiYivSitEgIapvMcEOiEFynNylClIvrwYWKmjVaPEHbdXPHfPpNMBuXMowyGoXRhKEvVIBYVIhsAPycDXVKMWnrYp",
		@"LFMQdNBmJvaof": @"YJzWaNblqTTsdolwNGlVwIHPbifhJdkVlINeUXGRHDavmJigLVWgKhNgmBEEvmRFcXDqXvLCkCmsqKbcTWWvPiAXyLnxdosRDFeOwlPMURRzIAewtSnBoxGfMnPkiNzSmYb",
		@"wcubUdHHcPgVS": @"jAvarTIGLqugADNKUdWJSnIKqAXYjMZbDnGoirwxpzOuIvgseLRHpytxLbvPLxsYglZXMECpFEgFVsFsHFjWtuxDhiQVGGdeIogiWBVEfgZbIbLOOjqvfBbzumGPpvFBUduWkvTElYvzMieWQMl",
		@"zrlCAhKakoLkaH": @"xPXCWMiTjIiRHFVdPBcBDkqdbXXlSqbVkgZukbmBBeZeucTunfaMjnnOyMgNyAjSfXnEyXniUsJLPlfrhqjXfWkSgrSzCfrDKJofpDwEQrIcpDsZgwCs",
		@"PdvnUzbKkez": @"sqTWWnBDEbyGiZJvySRrwXEKVQvPWBZEcIFsmftbzZjnvhphgfNYUcZNDfBZHPdvmvFeGAmzArCpPiLrkPpmsirWiyVrfjcOdsKgUvKtMQKtYjVwHti",
		@"JMrjgqTEVwnZcAAtt": @"kUusxEkZHaUWPwlYQAYhBkPOPqFylYEGoTbpxhAbnsVEpHklyVICAzPiRaAHOqmrADYgfBbANRhXrOFiUIEuLkOwSDKWnfAvJZLhnnApEMwFswb",
		@"VIMLWLjFXMKOlMeEyIE": @"aoFFQUunvTYuBhzOhdwwJbjFysflXgbTwzwcrfMkiBLcCbctBclnwbyshqihfGXtAxtezQpDjiMkhHAlctIKskuhUpMMmEURaZvYzWzOcvAlLBPBISNIYD",
		@"NematcCMejtoXguUebS": @"UjKiduQhhrwwjgnqxGpOyFmzhglGllkRNvChLpBJDkQrCVGukUWnSCTJtEbOWSkAfLfFkXtneAPZPhJCiuURuZTzSKJCFZPwdBAletAkqFyuDRVkKpvGsrzHWYigTdgkR",
	};
	return cZIGhrDmhDnUJAKTU;
}

- (nonnull UIImage *)UcTDCMdcARU :(nonnull NSArray *)hpinpEIKziZKQa :(nonnull NSDictionary *)DnkgpZNpXyAfhyfBKYT {
	NSData *ilzGJWJXbLv = [@"WKKaIboIgxflzjwqhpeomRhLfLFdZNuikbjYnXvkVWwTMojnzlIJyzLdCxrehvHgeTvmTGQRVHYJgrzoobGrXnVWtNUsVRbXrrsDsxQPUUtEDqpHhATJIqgrUnmVryDsyQYxzlKpNrpyKMAJEJOko" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hCcZIAzvAx = [UIImage imageWithData:ilzGJWJXbLv];
	hCcZIAzvAx = [UIImage imageNamed:@"MzSnoEMOdFUfLQgqpCXGpkTbtxUsAstraivhpDieZFxKFdSDLkwdsJJyNibeaJIkrtfDxItYjlUYRfrPMtiuuVWDEvGGPwlAHqyPhbgBLHCXJCVIZSnjTRLHnagSTKZbcLbZfoeqAxx"];
	return hCcZIAzvAx;
}

- (nonnull UIImage *)KgEgphodLm :(nonnull NSString *)MUQvmjQRySrcmmoNPP {
	NSData *YqYsmyfKVe = [@"UVoYucXZFEdDJoKlXxhauxhVeViNtCvaOQHtTxJnMOcAwiXKmlUebRQkWIayDCoSQQoEpMVUqWmEvIrERbOMerlxjiNgtbwzNRCOGCHZMBiOa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *keiKGwFqIPQTqols = [UIImage imageWithData:YqYsmyfKVe];
	keiKGwFqIPQTqols = [UIImage imageNamed:@"ObjsMievncmNnivTWEygxeZSyOKblDrykbsTirFJjALTNyveSXRKQhHGbmSlNdltOsSZyMOGjbAurYngWcSzrnWyAAIajncNlLiyhnjdHsJuegOAVKgrVJEDMNxDQ"];
	return keiKGwFqIPQTqols;
}

- (nonnull NSDictionary *)WSCcBMrlpzWR :(nonnull NSString *)iQBdSJDjWEg {
	NSDictionary *gOLXKCBEjMTb = @{
		@"AsKJlVLHwRasqjZvnSp": @"VPDtjXrDSqPlvFnQsReVJLNbHWKmVzMziJYWdygUoNbupiZtGWVSkkTyCQcmydrHPaBPqjxRDeBYeuaWGOsrBRmyZZAoNatQuGQqpJ",
		@"hOlUfaoVDOhjz": @"UYKfAkxxdNocrHZCzItFFIiNBpakeBoPdOWsFfxeRqLwzgRcAwXwyWsqLmhpsBIQzFNRCOhblpLfMjRPvFoCCqzhAKZDRJXhAigzqWApLCyFBklzJvJZtxDwOcJ",
		@"QEaYnKtHuRRXXyzCx": @"CLYgHcXGDvumcUODVRFHRzvubYTeAOCdjonzUghmoAIdeXpeBeYaSbFSUqGraUtyUWLvLUFgkXenqgxZpHBxjCCXeFLOSorvrBBtfvzmSdscaYLIjEGODOoSPkMRgFjeDzwxiMYpEJvXZI",
		@"KdRTEvzYBXdEABuqb": @"oGxTBYsgXUlfYtfeuweTzwwPrKoUlUqcLWrhjOjhncrylFRhfYxezLyFWSDYmayYWqeofPFhWpKapSNsfbAXadktbVmKIHftGydlyeRFFJoZaIxIsQ",
		@"FgzAUznezgN": @"YFammoVgiDkSqKMVgJvZfuKLXtXJfMdzpjGbrUYahRkGqLtqeZJxPpwwzlcoNuijAgWVcxryGWaxJfjDFyKSTJBZGCqUVeRAItPIUpSvOGHoYoEI",
		@"oGlpEoEMBEmEC": @"aHcXhkQcpyngPTqpLNAVPjuvbwwfOmLyvvAuLsWmdvFABDZFNFmNPiFbYfEzRylprYDwnNgwkQFqqGiZndgtIPhbNBWGuYtDeDmapXhmsTnWFu",
		@"qgdJXiIgQY": @"zpGChFQlfGxuDiHXOHcPRwmmUNxWeXBhZipqegbNQOkaKABddGondZeuPwjOAdxANcvuCoWNdqKSNPrYLdtazJzouOZncLrgezuILE",
		@"MFAagTNqLoiAArVAtQ": @"PisPpAerfmqSmZiwFnqMKCcnouxwefVgAEfcyAwMknRPdhIAyYEckvgOecVfOTVezfNTUpSBEtHgZcAkkHVgSKJEBKlCjzjfppELUIvlzfOpoYw",
		@"PYdtuMPOsd": @"MbfhUwfrIFnIsQTTQlfimjSRtFHeZotNehClmKHcMSWDctKEepBqAscFMuirYKUnOcajRDksvFdVeiUBpRKnIPVIYmPHAIzNudDXtAZyBlxWYoQibwdCopeLpLykfXjZLpWbEPIpQiqbBeVkcDAJv",
		@"ukDMmLDxqxoHeYBV": @"OPPcDhFfgtXybBVoxpOCNYLySlLzXXDCoXBeVrpyeNhzhqUnmiKDRjARDFXkTFxYkoNuwSrmqmJrdEGDZtdymkTcDDqdPepjOVkuR",
		@"SXZbwFvnaDITf": @"xHNjhunUTlyvEUcffNpEEWNClmiuVIYUgOrMSeSkkRPSODOwSPPTRWLDbHNQglRjLPWWqrhGzPcxXXHECgJgMISmWSNAxJkWvUrjdBKpo",
		@"SwwjmidxzmiNgVyn": @"slGBapUgYNHBNFFqkykmomikHMsRPlrBRhuapbLyUFvzROSGvTZHgzeGNHaLSpEBrUisvscfPexOdzdOPFMyiWtTgYANvQmhsFBySryUEwEhxjwDpBnftxunChQAZlqHZq",
		@"bUqyPBaKyQYoRp": @"LYpDqKrJoheaBPRmbsmOMyoOTEMLgTHSQGyKVBLJSRJHCqkJeKBIaeZacVIprPGXaaszolPRUrruhoQRbfnHvIKMpjemjyrgwGYdDtjlgyoURjSoWwrkfKFvtGqARpReXoCzyPyHalrIFDiQ",
		@"QiGVQQfJoHwKpsmE": @"YQTpYtkAaGKJRMssUQraOnHtLPkIFUoOpQqbjhDRUCKiCkhKHfnhSZhsxZFtsxhBAiCJpKvWEGKWmiRSfnDIxHoXIDNMeLGsdpLS",
		@"JMRbtqMxVKFwtQJg": @"gGHfSAFilNPwWGWFMQnxUxkQOksGMIyDtvodvTIGpQEhupzmKreWTXzmTLuSBmPDDuHeKKihaiLvWZMsyXzDPSsmpnMdxNDEkqmQfvAgeVttJOkMuKiqzkRnqJseGG",
		@"ZGhZyLXjQXLDTqAYHC": @"xxRCGToFoqmAhTZDTEonpNJhEmEGLssagdXpSEzzpAANQirqdpfZxDVOXjIKpIoJFhkuMLcDzgNVyzaTDceXoZnUtVoEqvnRgWxslBDKSycwAobEkDFenCmEdYFXmsEiLLvshq",
	};
	return gOLXKCBEjMTb;
}

- (nonnull NSData *)xGIfbxCesflNoVVDcCh :(nonnull NSArray *)DJNEquEZOZXGHitSI :(nonnull NSData *)KeceGgudotijAEe :(nonnull NSDictionary *)IpSSzRFIXklFs {
	NSData *AVhpjRyevLJyvVWzY = [@"BJfRczXwNbMaAlTwqzvEYGFfUwuXKNZNchjnOKwSgCufvqNJgZzamuaLSvsbZcKrBduoMzfzBmfhurRgLVysgdDPQOoPnfxaAjQuzAIIftCowQuooGPYSBlfcopjXZDtEh" dataUsingEncoding:NSUTF8StringEncoding];
	return AVhpjRyevLJyvVWzY;
}

+ (nonnull UIImage *)AaEqLthOuFlog :(nonnull NSArray *)KiUyFhxAldsEVyUXhPM {
	NSData *mhFlizgVCDtLtHnOZR = [@"dYiEeYczsTkKlFxPzhaiNgoINvsrXnynCfefbCSutWyCNomEjsESWEhJdZFIyPJzjipmbLTVmJkxYYxHhLhfXxveTMiHTSLWGUvbywzqEFTjVZUSHwmxGsggxQdpw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dURIaSOqZb = [UIImage imageWithData:mhFlizgVCDtLtHnOZR];
	dURIaSOqZb = [UIImage imageNamed:@"GwpqIGMiUpeOAMIaFtzqeAvrDOiDLROZmUntcrgRePEUMQxhoNAIzmkPSBPMZGzrQctgyQKrcjWVzDsIjauNumWRPoVcUKPWSyGrjGVDgQyURqPpReugipxhNEkCgpyFWaDKQTEONdFGOzpyYDls"];
	return dURIaSOqZb;
}

+ (nonnull NSString *)LYTYdJbzZLn :(nonnull NSDictionary *)ehxpOfpFLqklB {
	NSString *kZFquNehcfB = @"EYZfosWwhUliJrqhGfZctnPnhnrWkCkaObNRFHahfpyeEOyCUJVozHjwiDGEzHWBXjEoaajmbDDSrQaQtAEaSrbOOgqbPJQsBXoGNpRIwEf";
	return kZFquNehcfB;
}

+ (nonnull NSData *)ZrqXGJmyCMnn :(nonnull NSData *)cipXfLnTer {
	NSData *VVjffcMCZAVWqk = [@"rexFZPkKifULMKuKztsqDjmsZrcxYaqnNRQTUBbEOPvNdLQcIplqRPmdglKNmNnKbYSBbjhRomdFuRWYXORKnYnhsdMOMdznhotDhpEjRwMKPXNUKvzuOtgEubeoNwBCOCQORzhLN" dataUsingEncoding:NSUTF8StringEncoding];
	return VVjffcMCZAVWqk;
}

- (nonnull NSData *)elnePBhMwvIF :(nonnull NSData *)pwfRhsMlqqQGQh :(nonnull UIImage *)LIOJbXGrvBKsCtjyH {
	NSData *XOxhAXqtlo = [@"rwUHzCPaeZjUspWZbGxRjUNcFbAZhrnHOJbmHDkJPNLuZjfedWjDJJqcfYBOgQnWEnliWSUYPOzxnPGKvKWHKtgZCIGfcdbxIOMlPPsWCd" dataUsingEncoding:NSUTF8StringEncoding];
	return XOxhAXqtlo;
}

- (nonnull NSArray *)XjBMRPYQAWCQIj :(nonnull NSArray *)WUvzfdLDHRCvsvp :(nonnull NSString *)fnQucCpGSrJMc :(nonnull NSArray *)eQBWWGnxtUhRdNwyQt {
	NSArray *zpbCUUMPiSrp = @[
		@"drSfGhNLmDYmwUOCtAXnahbAJpoQpdJgdOSOyjdDXIdLBOripEjifZrWqatQoRurHritWpavIALfOoONVMommZPwmFCFRqVxbCAscr",
		@"TWYOxOEWiIvDuTLDtBxkShlQxXWnOWdatwdpSrkZTWyTsUkewCohnoSTVQEYcwNUtZcEUHdbBbYLyHNFPYHrBrIaECTHeoQpDrReDFKvnxdLNcqXELYvItyFKUXAoESBsDSTBav",
		@"pyYLYKbPAjalNMDpCRZINEaaokioQnIIxotyteaAdpEiaNKbqiSXedbdzzitqfuMaFOQCWUwjeLzeUlVtBKcdfylFMEysXpqvkjawdiYUKvkuJZSChJFHvfOHpvgJWONoajdWoDJRGldOPMc",
		@"MGjzrvdFXPdRchQZPnDLztQswhQYRZylWDcTGBJEtVhSlzMIcJlFFzRtlxyUqalBPhIiTWdqWpAHrtRFotkrPIJhHfIrgkeSVsEVMuAIDiWvvXvGvAjvWcVRROclErRaUSHXbnmxeCuYNPHc",
		@"iPQuGptRUlRICSZwmocpkatquxlmpuefWaeQrcDqmPPiLYOOAWaOIoNVSDJEQiUzGovtLDCruJLVdBdMLosoztfnSWpQRVhlGrNKmRKJfrefpMUa",
		@"iGXNMooKyDMAuZkumVwuOiJzwvqGEKbAffzcsLrTpkFcSxiYjMNJaRXWeByuusnzUMlaWxpjjBvgDjRFjQGGYGbXsSkztUZyFUrInsuIu",
		@"kFgGmQKPiwSFkIHrPslSxZnZxihfWEdvVzgpYpGIoTfhHbpWyFUINiQKQTROslZAOGvDYQsvJjqOOaBsLzSBvUNTzwNEfpgbjXWHTUncJyInDSUNkKzrVBqHIuXGbeJowvIgRpaPThBpoAJfY",
		@"KupwgBrcidTauzucGfGGxCgnwXYcCZEgeVPrgjjJeFpzRBQjSCpuAEPwYmwCSBlSFZnZQvPnCkPdTvzVMSZRhUguTjYHYZhqfVoQkJUhxkpMxrXvLYochUEB",
		@"BToGWGZjHPqyrJOfKEjEvFgQJjnXStaMPHHQeCGYhFCbXnouKnUxRaPJTmqheOunBxbgISyXSPDYJYmIMbebhROezCQcWRhijoUzkPCrrxEqUXmRUQsue",
		@"YivfgZftedMFELPnrlXeuaglNwQAlZecTHeSMiHDhOkdPUCxHgJFVyemMyNNRTRllXWCCAEgDLmOrdPsNLUotpAFSdQCXYIsGyELt",
		@"QoDOjeTAQEqhmSAjTHdgFaBLuHdjyMmaMwcubCwqeAeZApXDVURMqOPgQUvnWEgUQaCpqrPIyqZhnIIlvhHUvpbLVKTgTIkDdyzRXyLDkIVERqxeaHPxFWPKJEBmWPckTFMrJjkwNVJfyPUj",
		@"eukZNOoHqvHePfxxExYPviqrwjhstmZpAVqVcXuqLSgxfLmqRQqdeaTHhBDpXmXjyiCovgqVQfcLDFOtSPEzbIgZSYBVuNgoqeVpKGnjguHtQSeiciUZtAXsfpUUPmjbdAhrLDyVVxt",
		@"wLQmkBWeCjBvirSEkJUlexxQQnGPMyqoynHbnQyJaTnkISdDXezSXPECbNiMnXOSzjReJCzVIAbBuVNjhcHzUgfWGDrMNiAwbNYQbBwpQFjuginTbeSOxVbqVudEqWbbjvbJJblWIBYP",
		@"mHLbkzCXrpsAElzmXiRNvaOdZvKBBrSwQwsGbSdHumFIDWDBTZpGWPcUrZJgFouwOVOfcpeZLgLVesggQTqbSnXyvFrqUYLUCNMOvPLqivvabBljrXBkxMNLMjrdahuqtN",
	];
	return zpbCUUMPiSrp;
}

+ (nonnull NSString *)FHHdqqNlHdvFYeyEH :(nonnull UIImage *)wtfShJRCFLCcIFD :(nonnull NSString *)EclmUHghKIONCySpYN :(nonnull UIImage *)mxBuVwbdkgfdMWQLON {
	NSString *bXQbqSuRdgLMCmAijV = @"qxBAJTWTzUMZXBQEKPsGnsueIhTqCcpsWUvJTDHEClGveOANTvrchJzrHkssVAADkozwEsbbwPgnSdVAcbmKzbAmhvFXRNcoHhJPyphbztTJX";
	return bXQbqSuRdgLMCmAijV;
}

- (nonnull UIImage *)NLRnocEeVaq :(nonnull NSDictionary *)NvtmrtnMFXPZwaHK {
	NSData *VhYPezdekCJtCnz = [@"SoEiDxvnGEaXTxKswPkfZozjSTWgWVoVRFXnBgsVIpOgComWzExJgZpUpNKPMMuCxBAsmBCtfLTGyffvDsroScCtkoGuZIlKECKxJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HpIZsXokaFyCwice = [UIImage imageWithData:VhYPezdekCJtCnz];
	HpIZsXokaFyCwice = [UIImage imageNamed:@"cXWWxuELDpWZBZgLHJWZgDrYDjBbTOZbdNPbGrwcgFdhZfQgomplgfdkDEqhTFEutcHkopQHarMMcueoXKbAwhPCfWoAjvpFwRisvKhRXXKBd"];
	return HpIZsXokaFyCwice;
}

+ (nonnull UIImage *)oRZzQwxLkxCeIgE :(nonnull NSData *)QaUOcBUWJPKOnTqpKY {
	NSData *ZAokpedJDyCSQTL = [@"IrvwBgQCNyOFjJqubQcKIEXXvdQdaEtmFsiuFkrZVASowdbSCPnQIliurLufSEtsCQafWbcLSOddeViJLVPfaItkKcmPMFpyoQbpZHzwlnJcktPNqNavRDxFzVIgcCubWUrNFWPNlgrYs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eoIRClxObN = [UIImage imageWithData:ZAokpedJDyCSQTL];
	eoIRClxObN = [UIImage imageNamed:@"mcvcsapUhgOgmSchQKBxWEOtNAhriXTyjTokrWXYewLEuXLIbOPgbdsuTzKxupNVGmuPGdVJKiJGOnGouztPdgpUEqasVGzsgtVoDgVdHuaRPmHlqwx"];
	return eoIRClxObN;
}

- (nonnull NSData *)AdnfrxNBiqyWRZ :(nonnull NSString *)hJgzvwbzfeVnuX {
	NSData *wHZkLSyBnr = [@"ymXeTuplyyeSzBOFSsJFmenRZnlhGMQgOnZOAIyVCjUddTKVxDvnSiXoBorEXhUWRyFJNNCuGmGKzOtahVucqjKjvBpuHCsVFzuBWPJosAhWVGIRTysUcMOjpBYbotJq" dataUsingEncoding:NSUTF8StringEncoding];
	return wHZkLSyBnr;
}

- (nonnull NSString *)yLjAfcXdhBeADcBU :(nonnull NSDictionary *)BtLdvFiKxymQQaWQ :(nonnull NSData *)KxHShtHfIyvCrnP {
	NSString *LubRWRwESmidjnwH = @"IHZwQfAaIqjfShWZqVeaXAkOTNzunjhbykTmTKwsRqwrmQZAvHNTLJpYVvXyUJaWMdDlQwwcRFQqbjHNrwrJIQBgGbrXlQqEWaQftqjtQmMAIpzeFhKClPQmeLHvDXUCh";
	return LubRWRwESmidjnwH;
}

+ (nonnull NSString *)TgNwHOaWiOcAduOsJX :(nonnull UIImage *)AkoDFtOpHx :(nonnull NSString *)mKDAzZaASVyb {
	NSString *XPICKONaDJwzOmdjLC = @"ZvKSQkcdFEhHSDkcwrfwGxvtxoMzFuzNOkgvSMMZPbHSbrySdzPtqDcFXpWmDVWophvqMmwNAEeIxQImATGcftcpljFJShiDGDSrrkMMvXuKeMcdSmfNzmOZaqgVMSggSWyJmrzjmImvMqqihc";
	return XPICKONaDJwzOmdjLC;
}

+ (nonnull NSData *)UTgEJwQSVRXuFR :(nonnull NSArray *)lFjfPCsMOVpmnwPW :(nonnull NSArray *)yQYneFNUojBYQdbXv :(nonnull NSString *)YecatehdaOJGiL {
	NSData *NnKTAFBCVXOtu = [@"GqJlTeJViRBsXunZWrJWXXJXHeTeXzNgpMFSYzraRiVXpkQVBDvatwTCMQPiajFOuwBsJtgSElEQyJdhQZWcrKcBNbAwAakJYgqRBTMuMrcLw" dataUsingEncoding:NSUTF8StringEncoding];
	return NnKTAFBCVXOtu;
}

- (nonnull NSDictionary *)FwNFqQYItUMNkiNnh :(nonnull NSArray *)rwvfoKqmgPIYOydovbd :(nonnull NSDictionary *)MKRMvhwJNuLO :(nonnull UIImage *)btVjWTdfgxzMOi {
	NSDictionary *NlmswRTCRaWA = @{
		@"YxlITOQMhnNIotV": @"DLUtlLHlTifMDyNCNMSFbXdkMvVyCvkIEiiMgMhJEQKicWmgebpVCqIexxtiQYdVDilSyblBCIRFFOmkwSGXyIfBnKzvEmJcvIABZeddWxjrUIvqxKnC",
		@"mFQOOXRnwKeYqfTctB": @"efEgZbXRkqFmqCwcHeLihyWLjGkbrRYhxFWMKKsylJMbBzKdykdSyENzirNdszOjydsTEksYosScZNDgiORZIdaskphOjiuvZKhAok",
		@"FcxvHtbpqxZDjQxQsJ": @"UPQLoFeXRchtANlZgOXJaNfmKjTtJyLPYIDLkRdltVMEewAMaGMRgYXJYZtoctXhqRbiReSQbVnjlVuztbFFtnVAwPIHCwYoQdznTXN",
		@"CXrnhWJbxZNZkQW": @"EQtjtgyycIpNYaSzlthhAEFJCOQDGGeLqadPdeLpJOhXjhFOtqmjrynpRmuZyZclVhNrlEuyMKBEMejYIaOhFjsysFwvwWpxYyVFLGZNBQeqJjLbiATAGXnYtuqfJUtoSmypzzrUxGQLSNNNfKs",
		@"jlbkEMmJDLj": @"RsTqrbFhbaNgIYdiPuHBloFguHexvqnwVBEFHBMJcCuaiUiVEKkZyndinqRMJArpqVSsSObfOdGShzUurRiBDCKeqiHNSiXfaVQjGoRtAFLzaZhhcuqArNyDnEbATLPqVjyGbaLNcNQmSvtHi",
		@"SsASlRyNBDwplENTgD": @"xjAVdnsHczoTsEnFRgkxHsMqRdIycAgWRxsNrMnIYAkNyQAAaYOLPrBrMBeDifiPNuIgZCmTSvteUSThuVFCGlvaBZyQDSnCcMfryWqZqbMnavvKNpSurCfUBMsDEgFtNQyEGxzXN",
		@"hlqnPzUaIa": @"EyvweCLHycJlIzHwxeSRTfPZHKEvAGJTgSITXIMQZZZryoAEKKPzpqJafMuFVdzymhGIwbWFijjbXRpldBKswuEDZuOPFEKpNqYPnsO",
		@"HtAItkCNdmOlM": @"zJaECARFZiXBawcyCcjObzWHClYBlAmAkbbzbCWCNJoxjswuWJzOALFpCHyWjdPHnmDwNnwPwMRLvzOiTsAZaYeslLFHEoeNVebrzMMNHAuxvfgdXgnmqFwFRHRttsrbafVHaNtnoxGKNN",
		@"FcVHJmuMPiiB": @"DYYsSfgioHYlEBCMxrBpPzuHzSYmbMBclconZmjduxuSfyRafzsxonXbNAVmDXRYfoviuPVqXYAiwZJhTMHSOHdBPwNIcYxITJowDqXFeiEpf",
		@"FKRDBHcgQyVSyphVt": @"ZfjgXXwCIZNiDrjWkScbEEEAmiXEPvFWGitBmoOUILfdCGtJAeZfdiQhNSQFWiNtnILxhqsIHufdnkWSbKWgLrHWKsmUpaFbVIcKeEoTkccvFcFpBEyABRUkcZkzHitI",
		@"ssggyETtkCi": @"OadvCoSWpejICNhBLDKQmzihzEBxpxmYURSrREXFlciHQHIgjmaQcEOEwoSTlLcNFcltuwpnhYmBPDVMuXgzgXHUIAcGJoPrexNjBKFyuTMsJfpJi",
		@"XooZBDMwdPkF": @"KiGhzvySzPMJPNhiSzwooYVYAgEWHXWXWoEYQZnhWysScvQVJvMYaZJVavkwRJksOasQZhDzgeDwNOXgDaFlJxJdscyOcZrFjTuuRxunOrNt",
		@"mBtQvvHDJRVMvaYQ": @"bcqDEbherVlEGGQuIvoFoPqvEgFFxAHyVCRkZujPDvHBALuwxMFPmqPAZzzXxuZMGsjTjoVKWBEOTOPJlPZeMYQqwvcKJipnPuIXmnmeOnLzIsRDmHccLrtcPAUksaBjKzQfcPQtXrhkGxw",
	};
	return NlmswRTCRaWA;
}

- (nonnull UIImage *)aOlLlVcBNgdvwIw :(nonnull NSDictionary *)PcQcpyiBqePm :(nonnull UIImage *)cPpgsybXszRLR :(nonnull NSArray *)dVrGALpMszAjBtLm {
	NSData *GCCjwbDnhDoKjyF = [@"cAAaGOmVpNrLwoYLJObTpXrpTPoiALWBEKpjJSuTQVraJlYEqHTfApwoFMEPAPdeXUYsfZxbdnSWOQrqwtUltcqWRRBqBJjtoZWEGZIteKNMSFobaWgTjKyshgxZmDhhrLNnwvNA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qlMHBiJMJkGGwjlKLP = [UIImage imageWithData:GCCjwbDnhDoKjyF];
	qlMHBiJMJkGGwjlKLP = [UIImage imageNamed:@"yLiibdANnufSPoJXTqtUngGfVPBcgGqiyQGKIlfvgMwVpnSLKABOaExMKIMBjFrCOctfXRYccYVwlPEkzrcAHQJfEjtUrMlbioeknYdJxOrZUrDSPEsHPirCXMRCRKYFamSiQhiWUSKFkdHrzU"];
	return qlMHBiJMJkGGwjlKLP;
}

+ (nonnull NSArray *)pqdJHolLtcStfXVCW :(nonnull NSString *)CMIYXyqCYAVZFho {
	NSArray *heQcaNWwdMHIT = @[
		@"uynJmjohHfkeMPqjcawOYuJWjGHjGxNxLnjBmeszdBUxJzoQZnpxGlhoyDfCLKETMZplWMIclsJdprkVBfkedrjkgJULAvNEGuaRVHvwpRFbdZBfIpRoFnovzdFpxjhyVtTIyYxQBoKLMaURv",
		@"udJyZTCwTRVKrBMjEVxsBBgMRrpAyEjWaaUVhsndPrEGPsWjQjbIOlWoYrfBWdvBarlNyJIRmiUZgwWdPxrfglcdXSrhlptDXbkkybtVtpsQDy",
		@"SstOtOnYHJvSVcSwAbyZwSBKWIeYBQPfalJBIPsQwnGcLHqyUCOftGZBLlqGbIwbcRNzTlkdKdIUhImbnEdUobtvbyUeaakowcWDwZvcMNCZFzOVgFbluWPvTGuRGKvD",
		@"aXdzYmdlwJxTIdXAYrekdiaTOaxCeizyPiETlTpACWRMOQQMSBcvleQHeAaKCMvnNXDtqtSSxRrFzFnzlwpAAoiYfqlJHrZyEeoZblTZGPlAlZJfeJCPoBcRKyBLwxj",
		@"BUjqJxLZCjbotyKewTiZnpIwtLifyWDORqaJHqqbGRkqulkfZSKpMGVRyjZbAqJeiAApuTSCcJHcTBPDeLDuiaJOlqxAlCqmsOwgMDrqqNnEJnzPESMeCtaKtXogsSZhBwQGhRRdeuBllZJBt",
		@"rlsHXJFeHZtnZNUHcMHXXiNRaDhnLlcgIojxoPEynVkdNlWdalXTFjFksDduNcTmIxdNDqiRWfPktqWSEytLaFkvYkkYZMkjXHqFgnJkyZZDsFrjqPhN",
		@"JQKWtySMUiRtbakVFYjYEoWQWVzPBkXvRYVThwmKqjkLEOjnSAIRTMZLZEebvkBknTVpCgHPzfrKNBlScqeAMgNmlTRhFxRdEiWXvmijngSkuATTWwOqSGlzS",
		@"buuStjJKyzgfYkWIHVlyOpzHfuiAmwgCoUOxWGHPNyFBjsEdYplkPbrVxtMgNHiOgJwmXhoVDILeaREgWuPTsOySTUkJUNIvKWrEqSqlsEXpQksaktUhfnBDJkuqibFqCHtjgdMcHrESWzyb",
		@"xrpBfGpfctppdduxbpTnsWfGPOlZwirdqYoImIJCryHaftElRbjomWbHDDgawVOKgNijNXAsjkZpnEKvgSwcvrskwJokwKfPhpsWGBXkRLLgnIZYjdWANbAP",
		@"FNTeUdAGmnuVIdtnLRrpZZYEAPWRUirzUzaMmknvnIUYkGxpYZlHwmCmzQdmvynnDUijvYsChxMmiZIfcPYSAzfFahuWxGrDTBTXqjTJ",
		@"coTTlHlYjQvieUZGJgFzwjiTCJrmtDOBKYUpnOQILMbtwZFFnoJZpBiUOwOHxnwJATpwjLqGXCPNdbIqSrVWDFphEGSEyWsaXHXsLg",
		@"cLnEtRSLXnVDnpCthiouNDtyxnhUBKSFgoTkNcDZigldGWcxcGLptbqZLYjjkpYFScyzmSCnaFfaUHpUzPcIyVGKfqirZPFCeVFWeTMhtjpIRSyljNsYlfUlYyHpjmAfLTBo",
		@"fygyTFtaflKiubSrEdGBPLpVSTWcdvVUIzgBGXEolaPLgiwhGeEucmMlESliECrHYTvaVShaqxPyvcLFlFgcxLJMtAQTIDCqwkGOJQpXRAGisQJAsihwDdpnNGsYJLFlDxjB",
		@"iZAeEHcKRSUXvFVwrzRjBqBiVBsYWlBWUKxZlLRDXKapjQhDcFwAtxZTQblgqozzQBbRsYPZBsAlYERMwFPHxeVYWpfTWGEEGTABFhDaSHPYDMlNaUYGZNLwJSgKnHQrFvatCVunmwSUggQvsrLU",
		@"wJqCuXNTlBwaXhtBZIMwNdohtPqSZKgUAZuyGMLJyOhDtAvWwQVMQQCbCjoKGZqKeCjHvVdgWfWsoxaTXGmOMeAfzXIAwShXhAPiwopcZPlOA",
		@"JZKRRYqGPzNhnhPSlmeEfivIZpzhzSdAweyJYPFhdSxEXcGVwTrOssfuGDsKuxrFhVncVfFTQLsEOdOhBNgrmtoASODUzmePclTUz",
	];
	return heQcaNWwdMHIT;
}

+ (nonnull UIImage *)xrLtRAyyoqTtflRtho :(nonnull NSString *)AcQeGNKLjLp :(nonnull NSArray *)xScGouMKMTzgAI {
	NSData *riXXdLLlthTniGIlIFI = [@"RmpDVbJldMcsFuCXRvxtPhIArqRpMhKOwvIMDpZYTpNMUMIQKGHtXXULzUpqnrCUySRZFWwbcLFZSKQOnCpdHKJoQbjEPlqrWnPt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *upZeFDallI = [UIImage imageWithData:riXXdLLlthTniGIlIFI];
	upZeFDallI = [UIImage imageNamed:@"CdiyDcjsGBvJlJuDaFNrAYXUEKdsqoILWdoEqBlXsQUmRGAFbKpPKWfrRBWtemKVidTTIckMyTwFuaQLmfLUlcaAUWWMoZOGHqaVjm"];
	return upZeFDallI;
}

- (nonnull UIImage *)hCOHudUQLdeCEG :(nonnull NSData *)ReYgexarqK :(nonnull NSDictionary *)CRCzhuxZCThebmRhs :(nonnull NSString *)kxzMVEqoYkumNJi {
	NSData *KFrfBSJXCPSaTQqRvvp = [@"fqGaimVdoNMjWmjUdgAVHetOjYfPbFdSEynJXVvdkoZMHsBVkpqToFQAMUPsRtWBtOiqwHniYLmxhXtXUPbiuyPQUXCobtMnzvDKCPCMHlkjeITuJDYcDkedUvpTwEDOdOSNbl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EFEOGcHRiGCP = [UIImage imageWithData:KFrfBSJXCPSaTQqRvvp];
	EFEOGcHRiGCP = [UIImage imageNamed:@"gtXwjetcrJiEeyyeECeBFFtGeoKetmIRfnBnYKhbglsoxZbcjfnNWtMmYElVlVZzjMzNujqlIqosMHsICwgGjuirruoGZGritzJqKVHfvdHpvnSCFrdIcZ"];
	return EFEOGcHRiGCP;
}

- (nonnull NSArray *)DCaFLpdQkJFtIVKk :(nonnull NSDictionary *)GcBQzzYpzMtuRTc {
	NSArray *egEysjjUKtro = @[
		@"BGzJhQFChSIeZTGhzkcrIuLoGoaUlgYrDOquaLjJDFglbEOavcNDtCFNjPqZIlIJHIgQNbJEFxyGcDvSpbYuyiIzKLbKVGrtbLjphBnIoSVwKm",
		@"vjCqcqJNFThseZOhaSJniYXshLkhaVsFnNRCOmdwlYxkvnZyjkUHhvWcddoOFHCmrlEjhREuxwwvslmhojyykFLJtMzMfpoggkXSraInJnBFJmIMFzcsGCwYrKxMBNTYxTWCCnzIJzMysG",
		@"zQsjQgFOKphZNYiEAUVGIsPJavEexJRsThPTXXOrkiRxPyBoWKPBvbdLbrmMfWwEIVfkDHTqwDQqqyIPzMruQcZzCjRgfYLlLMSLoJfLiefVbiLNSsCop",
		@"mWwZJHotbdbXUuIxskstYzfwGFUyowVqYYrJbHxDnxtVRLzsssWCCSXtLEUsOyvFZpxJSnXiBjlgmCHFuAupNmCPSuPEMJBphANrzLIGNdBTOygQrRPTEdaTLqOggYS",
		@"DmwjyuQWUNBtDTEfFRVuTppcMrEgmxMTjuWAnESyHUBxeugtwZNZHhyyCfXPnCglumZGFjyvAaNDtxrhGBlUMiZiHIArbvsyWcVJqjSfxHjAnniOIVFoR",
		@"gFbjAvZqEjRweiZHfKfjRlqxdKrWkwYoSWQjdvrLcYAXSkstptDQknPfhJZwuXoSjceSpbrpZilleJOZicpxuWECCeIZAliGzVkGJQRzuwIAXQDwjtrsTAA",
		@"CbTDblLFDyeXAeSFkXWWeUkLRyrPBvaVYBbMiMVPFATtwgoIwYkvarGtfQMLlMAmndemUraCLOARlzOoAJcvLHSxLQDGcUTPQNMESQpGzEFlTGkXMNj",
		@"usEEEvLKpPeVglRDbVROYGtHXJgoQkhUFAlfkHrmltcWBiKkJtGuqwKvVaxIpYxFqEMxePMsDkehTOApGILmZMAVPDWPAvuoptruSDhxTIqmLbwlDwWgNfTtlVVtVONzXbm",
		@"KLfLSOugQaZvURmZQvOAhaVEFfDQetJYbyxLPTkDrvIeJFsEJmlfuPFQnGmSZMETVvQSDrTEXJlVYxINMVVuPHVpqhAMUatdqTNyDuPTkXEABiGtRHFNLXmYKofIWjpeErjCITESUWwyypxgMgR",
		@"UaGPbbbylmNPpuHhOVgtRsFUyECjToNFgBNrXDyZhovsQdanOTDAtvrHZfVJVwaSOtTAyUSzayaaOrKBRtDsUZtIIcPhEBnSalJcDYOVxhzRbQQQKC",
		@"fbnPJxqexjyrQNJCznglptYAMZRgNWwPZoujrQNlMrTDSLzuUGJhwVYVTZuQzmlTIVhXvaPGWxCVuJbEFvMgMJIhmyRoCJzaUZGKyuIzfrggugwNSDvsPo",
		@"uiifYobAVHOaboQnyawoVcZVZyXOBIMEwcIztyLnGXRQeDVIjfSmKdZRGHNoXCBqAvwvcDXWMqizlWywipqWqRIojpmIJykeVcNVKrmpdUDciAtnYZGsN",
		@"FfRcYwVqlhXIWTqBFACEiUpdjkiueOiNMiuvXUIBWDSGaGUMjmgBnMugQkqwhEkuoFsIBAajothcPlBiYNbLIzHFCPwaNBILqAzgrwjKAeCtpnloSNuFXVHsikHZMHJknIToVzbyvqggCZ",
		@"qIYgemRVDvDgeYrQRuPNoSatQkZzfxisuyHImRcwemicknXzAutHuJasWzRAjdFNjdLDNiZDSDAmghspLnhtEQHtmJkhRJPYzcCIVnyQPlrxEQ",
		@"haEReInkdXSMinSEkLMjOLZetsQgKvKjupQEsKXslBjVrCVUBqITgtwLQnreaxfOWKtmOZNNffNpkUDzgbPwGKDlrWKbDHjfzMHXMvPcawmCzlmZSeAYjydztpcNRT",
		@"DFuvdWdvVhqdQWWOAZbeYNgSzkMsspvotMNBTPXrFrhOORDAhRbgQnDTqdIzFJLNOLreZAekbzzVSJDPPOiMgIrgkQYSShmdnhloRBNccIslyvP",
		@"kgTWCwWiIokBwYMMjFRluTZtffRgmUhMaWHIRodqSyUSdwoMFsejWzcqeBjLROtghFMfiAZOdQQduguegNpBNRETsklvYhduhxYCOtDkRPexSyDBINnhs",
		@"jaCMaSyZDMKcgXjkpJFnJizmCafMbYbnmKdewLEyvQCYYOaPPaMEoiWbtNGTTaaryfNrHSTkteQscXjAHLdsvQrKxyYFFkzxvPauuaVKGaXmHQtpCjoebdgyQfjLFWxvglbwkaHHugLxopp",
	];
	return egEysjjUKtro;
}

- (nonnull UIImage *)lVuQMxzmBwQACVQ :(nonnull NSArray *)KSAJkNWoiJRJIRKd :(nonnull NSString *)haMUvnZTnPMiBMEWizY :(nonnull NSArray *)viEHTlaWEXBK {
	NSData *PjFRmdxrjTz = [@"OjiJFYRTljNpkovdRwrpGsVfjuFBCJqGwseZWIQejDozCGTeJetVeCXUjnjiAKqanJvyJUeiykJyWefwOrtxdcSsxJsntvpIIFKQtBTcdaTHSmClIhzcJEfSQDGWeativEElUQRJPLbpKxZFTZXz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RCVWuuRJnVGDN = [UIImage imageWithData:PjFRmdxrjTz];
	RCVWuuRJnVGDN = [UIImage imageNamed:@"tziqDcxjGAZFjNOfzoFEbqmYIEaMHHzyqOiKaYbJiMLIGHRQzgXJNfwCsXbTDCLrqIPIYEQAECdyuzPenSCVhccbecwzdsJoCtGSedblDyTTUZsYczYFuhbeDZNSdSnSYVnkLbIwKsMWQKO"];
	return RCVWuuRJnVGDN;
}

+ (nonnull NSData *)nCAXTvPtwVuOLKs :(nonnull UIImage *)HlTTcdATFLpoVdft {
	NSData *MzDKiTlFizGvsMy = [@"WWbINLiXytcWEiXYGBXwkzEVUhBnhTaynvuRsrbUpWgTFcrwpbVQBIutODjSrVWfOqxrPSxriUoXrZoKqfREDTNCAHDwRRtuNrPEtSnrAUyQlTjFqFZbGTKZXMgNfgeiGkXUJmojEunG" dataUsingEncoding:NSUTF8StringEncoding];
	return MzDKiTlFizGvsMy;
}

- (nonnull NSData *)ZipFYDPbjv :(nonnull NSString *)yWYsesMQCTsGmmKZqX :(nonnull NSArray *)YYdtgvgaXrBSjsXf :(nonnull UIImage *)czxdKQIrUBPZalRzK {
	NSData *epXyOfRUtfWganBNIeF = [@"omDNQcxkIBLQGCQdptQDxIDLyQmUXsNoBQrEwrkvRVllQJRtJTpEmGbDHcUCmbZYDxDOegkSPJQGyTLTZoknKilIWXFvtjPpVonJySzJKrSIvjV" dataUsingEncoding:NSUTF8StringEncoding];
	return epXyOfRUtfWganBNIeF;
}

- (nonnull NSData *)DTPQRnLExdlLllkau :(nonnull NSArray *)RtZAIokWMJqDrXFBZk :(nonnull NSArray *)mcmpmrHaObDKh {
	NSData *kRqmpeMyIZnrt = [@"atejhXsDMgwDoFNABqaTYEHAnHSVJFhkuQHchTkEfrlOlXxJHmNFzoAjQkSahMNiyfMlylnJxiiXZOVtbzJNNtWFNsKUPgwCjypNnktwUPbenyXhL" dataUsingEncoding:NSUTF8StringEncoding];
	return kRqmpeMyIZnrt;
}

+ (nonnull NSString *)rwPPjafmqQddVX :(nonnull UIImage *)ooIPnDnwQylQLWCARE {
	NSString *whtXctUGMsNXPTbGiXJ = @"FUDrseCfdVcAXChHGiLpyZxsYlnGFxwULAVjRNBBYRCQIvjJmGGcnmnMmxMxEPqpjeKYrfZETTYwGJTqgDayLRvTNHFIZfTkypvnrJQypoNlRzMW";
	return whtXctUGMsNXPTbGiXJ;
}

+ (nonnull UIImage *)MGsekIUzhpab :(nonnull UIImage *)sZIRSYHmNNWY :(nonnull NSDictionary *)YeqYQvZFUvfzifL :(nonnull UIImage *)YjENwkYQyhSdUwJEm {
	NSData *AyGlmAfyhBWjM = [@"lFXCxuyGPhTKyWLspdGzhMvGDcHalQztteLsZlgbChSpvWHbdrmBXQSMGcgPzRXAxLPWmehsNAgZEftcfgcfGnwCYtOLlbBLJgjzhIbkF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wGEnjhMEzVAtwuptSY = [UIImage imageWithData:AyGlmAfyhBWjM];
	wGEnjhMEzVAtwuptSY = [UIImage imageNamed:@"PGuDVvDvewryKVRyjvfEMMtOtbZCFDeWbkLdmiICGfEswxWbfYKULEqqoVkyCSvDHdjNbJksfWnbVwHDTFQIRBersstRyoIOGbhaQdPpbukwkgjANPXIdKpGSlngjimGoxztCtngIpqiglwjr"];
	return wGEnjhMEzVAtwuptSY;
}

+ (nonnull NSData *)KKyqSKdVMjTPmrNbp :(nonnull NSData *)TEebdtjoLfxJRgm {
	NSData *psxKbYFGYOyNtRNoAvL = [@"BfoJzvTuOWCsOnaCmSubieFHmSbwpqqvEnHoCAyUofmwBDxYFQZYUQMcWLushPbluuVCaBMPpasSozjedAhWDMGFaVdYIaBNobhNCUBXkQHioAqkt" dataUsingEncoding:NSUTF8StringEncoding];
	return psxKbYFGYOyNtRNoAvL;
}

- (nonnull UIImage *)UeWdUGHQpn :(nonnull NSData *)jJmbleWCBOp :(nonnull NSData *)MHHtlzzlTcUgEfllYt {
	NSData *FEkqagUMpXuVnLT = [@"xtTRRkjwIRbPffTNcCqaeiZRHbWeogTQZEuzXcVITzZmOqYXQUGiLNRISnmSREzXooAgedBYJMZNGfOaFwpyKxXsnESWRBBNRItiuysJIVTjFvNMurFfvYxXZDB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kuDWyfdCMHLFfYH = [UIImage imageWithData:FEkqagUMpXuVnLT];
	kuDWyfdCMHLFfYH = [UIImage imageNamed:@"umoxDhQsXuAVYAuafIWGAhGGwQsLFCpsSqDToFdDOgOoKzHCDFwcdSSasjFbXxolqeAGsEJNBDzPsQCkHrJuGLRuTuqJrdjTycOiLTQQxGKtKJYnTeZNQRPZnbmmNYYWkK"];
	return kuDWyfdCMHLFfYH;
}

- (nonnull NSArray *)DywUbNmZqQdQpncA :(nonnull NSData *)YbOdKWLvLzzMvdNsz :(nonnull NSDictionary *)JshuSHlauqVFBAUnmF :(nonnull UIImage *)OEhvSGgwMArDQ {
	NSArray *wOTmGGuDzEMbdBBuJ = @[
		@"sMaojFqVRNnMyUNmByOnLsJyhflSblwOHlqtgQmdnJJYuyNQujMWYXUbvjnzpKThGUsKjPcPhsdJxMKVZuoFVFTTpWZaipKJSSBIoyZVtRXKwjgoYuCyRDYqs",
		@"PgwVjohgxfKxAYoIssMUryuxAnQZIyfUrDJkagMhlzzBOyfukJPtSQIHOOMZJXAwovumDKwivHcGRudIsPcvIRpXlEsFWPjEqrmWYUjq",
		@"wVQdxAuETiuWWtIBagVWMDSmJutVmIDLkRTRCFVfnvnyOtEfjLpMznMslEKioPVmGpVbVFOLxNDmtSJSLLjdGLbAEhBtlyTmCjXSrsoBUHpszgnOJVnSvKQfs",
		@"WxyFkfHuMrccgAvKJNFRdNaDHcdzrSSncoRtZpZWLjIxTcUzxKtSxAUhSbaHIAoEMeWVxmueERKLdijEXBYtYfwgothXCiUIzxadLAkqEKKwbVT",
		@"eAijxEoGBEHymXaIqcenUzcbdmyPfuIItqNfwZgsYbebZNfHBOvIIoaEGsogmwLuHcDlUkCSUAEoAUcpeZRrDfRJxiNAdneAeLnsifwYwXJygxUsHkAXzCBJecCoh",
		@"eGpoEkMWpWBsbeeSoucRaDVFyzoEUzvsXYGWEXMGrnxuKcrZRwsBSKsqaCUoZhBLoOHpaYpVXLoDFjpgvmqvNQjBDqReTJqqTRTxgmuTUxUjWNSSElaOccbAMzrcnejKlppQHIdTjLrynIQl",
		@"zoBLSwiDQSEdxQdRcUZPUfjVpDuujqusLVUUCTkFOeXSIMbyIuaEemVtQGmAynItxmumvRVqHRzIeoWCvkazMmSRnWBMELWVVwxiQtXpmBFwVCDCdfZJdYpteHzWybgkSbDfYFoVzPiRDRh",
		@"iLIXWMABsLMwxZRhlZwuAYXncOuFcIYwRnXIJWieOTWZhEFpWKFXQXlzRJsKeijVhjPBdlVwcOYTwnAoFXJMggVkZSrwFqNSoqbKVJaETlReDqEOlGrYZu",
		@"BHZDlCybdxWRJzsAKJnOoSZmJheQbgIcJfbfYiyfYMbUPALJJdbOlMivbjthgGWIYZQOfIYCryvCYFzaffhJLBZcUrCVNjCfxAgtPRWYBJqmjTwCcxIAYvPKiLqwLtqMpqtLV",
		@"SFwWeSTHgtCWeKywUeLXhvaFkmIhLMcNdCmhvLhxJifvzuDVYHVsBchepbqHEGKeKMyrQTTqLxzzbGMAkIoTloyASrvwFGUKTnkjfplPDUqXzSAWKZyQAnvDwxizZZzKbxzLUSn",
	];
	return wOTmGGuDzEMbdBBuJ;
}

- (UIColor *)badgeBgColor
{
    return objc_getAssociatedObject(self, &badgeBgColorKey);
}

- (void)setBadgeBgColor:(UIColor *)badgeBgColor
{
    objc_setAssociatedObject(self, &badgeBgColorKey, badgeBgColor, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.backgroundColor = badgeBgColor;
}

- (UIColor *)badgeTextColor
{
    return objc_getAssociatedObject(self, &badgeTextColorKey);
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.textColor = badgeTextColor;
}

- (WBadgeAnimType)aniType
{
    id obj = objc_getAssociatedObject(self, &badgeAniTypeKey);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]])
    {
        return [obj integerValue];
    }
    else
        return WBadgeAnimTypeNone;
}

- (void)setAniType:(WBadgeAnimType)aniType
{
    NSNumber *numObj = @(aniType);
    objc_setAssociatedObject(self, &badgeAniTypeKey, numObj, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    [self removeAnimation];
    [self beginAnimation];
}

- (CGRect)badgeFrame
{
    id obj = objc_getAssociatedObject(self, &badgeFrameKey);
    if (obj != nil && [obj isKindOfClass:[NSDictionary class]] && [obj count] == 4) {
        CGFloat x = [obj[@"x"] floatValue];
        CGFloat y = [obj[@"y"] floatValue];
        CGFloat width = [obj[@"width"] floatValue];
        CGFloat height = [obj[@"height"] floatValue];
        return  CGRectMake(x, y, width, height);
    } else
        return CGRectZero;
}

- (void)setBadgeFrame:(CGRect)badgeFrame
{
    NSDictionary *frameInfo = @{@"x" : @(badgeFrame.origin.x), @"y" : @(badgeFrame.origin.y),
                                @"width" : @(badgeFrame.size.width), @"height" : @(badgeFrame.size.height)};
    objc_setAssociatedObject(self, &badgeFrameKey, frameInfo, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.frame = badgeFrame;
}

- (CGPoint)badgeCenterOffset
{
    id obj = objc_getAssociatedObject(self, &badgeCenterOffsetKey);
    if (obj != nil && [obj isKindOfClass:[NSDictionary class]] && [obj count] == 2) {
        CGFloat x = [obj[@"x"] floatValue];
        CGFloat y = [obj[@"y"] floatValue];
        return CGPointMake(x, y);
    } else
        return CGPointZero;
}

- (void)setBadgeCenterOffset:(CGPoint)badgeCenterOff
{
    NSDictionary *cenerInfo = @{@"x" : @(badgeCenterOff.x), @"y" : @(badgeCenterOff.y)};
    objc_setAssociatedObject(self, &badgeCenterOffsetKey, cenerInfo, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
    self.badge.center = CGPointMake(CGRectGetWidth(self.frame) + 2 + badgeCenterOff.x, badgeCenterOff.y);
}

//badgeRadiusKey

- (void)setBadgeRadius:(CGFloat)badgeRadius {
    objc_setAssociatedObject(self, &badgeRadiusKey, [NSNumber numberWithFloat:badgeRadius], OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
}

- (CGFloat)badgeRadius {
    return [objc_getAssociatedObject(self, &badgeRadiusKey) floatValue];
}

- (NSInteger)badgeMaximumBadgeNumber {
    id obj = objc_getAssociatedObject(self, &badgeMaximumBadgeNumberKey);
    if(obj != nil && [obj isKindOfClass:[NSNumber class]])
    {
        return [obj integerValue];
    }
    else
        return kWZLBadgeDefaultMaximumBadgeNumber;
}

- (void)setBadgeMaximumBadgeNumber:(NSInteger)badgeMaximumBadgeNumber {
    NSNumber *numObj = @(badgeMaximumBadgeNumber);
    objc_setAssociatedObject(self, &badgeMaximumBadgeNumberKey, numObj, OBJC_ASSOCIATION_RETAIN);
    if (!self.badge) {
        [self badgeInit];
    }
}

@end
