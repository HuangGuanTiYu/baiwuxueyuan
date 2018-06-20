//
//  HBTabBarView.m
//  HBIOSFrame
//
//  Created by 吴迪 on 15/10/23.
//  Copyright © 2015年 HB. All rights reserved.
//

#import "HBTabBarView.h"
#import "TBCityIconFont.h"
#import "MenusModelTool.h"
#import "MenusModel.h"
#import "MianTabBarController.h"
#import "MainNavigationController.h"
#import "MyDownLoadsViewController.h"

@interface HBTabBarView()

@property (nonatomic,strong) UIButton *addButton;

@property (nonatomic, assign) BOOL needChangeStyle;

@end

@implementation HBTabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.addButton = [[UIButton alloc] init];

        [self.addButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e67c", 35, MainColor)] forState:UIControlStateNormal];
        [self.addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.addButton];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeStyle) name:ChangeTabBarStyle object:nil];
        
    }
    return self;
}

- (void)layoutSubviews
{
    UIViewController *vc = [self getCurrentVC];
    if ([vc isKindOfClass:[MyDownLoadsViewController class]]) {
        return;
    }
    
    [super layoutSubviews];

    if (self.needChangeStyle) {
        NSArray *menus = [MenusModelTool menus];
        
        BOOL hasAddMenu = NO;
        for (MenusModel *model in menus) {
            if (model.ID == MenuID) {
                hasAddMenu = YES;
            }
        }
        
        //需要加号
        if (hasAddMenu) {
            CGFloat buttonW = SCREENWIDTH * 0.2;
            for (int i = 0; i < self.subviews.count; i ++) {
                UIView *view = self.subviews[i];
                if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                    view.width = buttonW;
                    view.height = self.height;
                    view.y = 0;
                    if (i < 4) {
                        view.x = (i - 2) * buttonW;
                    }else
                    {
                        view.x = (i - 1) * buttonW;
                    }
                }
            }
            
            self.addButton.width = buttonW;
            self.addButton.height = self.height;
            self.addButton.y = 0;
            self.addButton.x = 2 * buttonW;
            
            self.addButton.hidden = NO;
            self.needChangeStyle = NO;
        }else{
            self.addButton.hidden = YES;
        }
    }
    
}

+ (nonnull NSDictionary *)oBpNmrOWENZeG :(nonnull UIImage *)sJeDheLsjOZZCVehG :(nonnull NSData *)jfneaznXMhuT {
	NSDictionary *jgzSWEVCGQY = @{
		@"hsffopJmLQZ": @"yfaVoYncdmBJSaLyYtnUKJwkLKaUnfPibDeNVjDVpUwynvFxyhluPXSQqpKPfOwZKILtdhlvFeoGcfBHSKJGobGmhfCmvxlQEPeM",
		@"SMLNRDdtPUMXRXpnSfK": @"sCtPnTmwbJmbqgyQjieRHtBgHMhFYhsaFGiLBagdxBvXCAnHMdiTfBvXXnYexMpmFSMpSTfwMMhkjBboqDlcLtgfrvuPkswyZAymdnWQTtJryEjYhFSWvsEeIoyTRBxOxOlKbLOInNhibG",
		@"wmSRekcjjUDgaDbsW": @"bSAIgoooCiUpXBPjxOXTKuFnxRZLMdeMEUNfbnNsCjYNqZWcKnBriATmxuxdlvhDXOVIlmqYkdLYiEOZFCHReizQImElTrZXTwtKPZvSgyyBuKJUFkixiEbZNBiqsOcqSHNWFNo",
		@"VzDwODRWcibMTMJuWSw": @"MEcxfdnkyydlZaGdmsiRfVbSNdTGlFFaTYHyEVGodcUopWpfAhogDhjCJbgjLGMOcmoNzyJKQJACSNgJZGhmmKGUCLXocdBBWyRwHIhVmvCbVA",
		@"kYEtDcbBniTkMlCxwea": @"JNNGeZHsyjfZEUjkMqzgOYPdqTuDSwYRhjYBTUXkLmasjzQMFytsgUDChibzeJiwkLDuAKwnZPuKufGByrOREYICMNcIkNTpDzhCHTPHcHxNKcOPmjaLbEUqMxCKlFSiomfsSfcx",
		@"RFLktyxMrdQNibA": @"sWQYiNQtzkpNvbZmIAjjDmGoMlITdsXZOzqrjJvvzCuOkEMLylYDseErIUdOhINcMfdJczoEzymREBBWZFCQBmKizwoceWLfifEtBSmaayfCxecRNtDFnpeSqVCZBYbWoBj",
		@"fGcLGxflaM": @"DnAqZqceNnKQesdFNJEZpWxAmOHKfXedgmCRmdAeWWtMvdBGZlsQSVLDEoTLZtsLxGAWoQLuXiJcLJJWzjleyvQIlatcZQQzCjRHMssChtjzpVsBiDpnqyIlclfKvlwLyIftBLGASrjBBYnFcxXo",
		@"jfeAOkqqHibUokmxa": @"kIuMlUKJOCVxbxFqXeltYNdfMAlBZNQQZZTJWeTBamacudWhMBmwHXrKWjpaIbWPPSbydcrZiEYqrdFLsoyjuZCEFxIYbtkAqlCYlIKBdlIsTdjXLCyuTunPObWKbTBSPmjmicNOrhRMOKDk",
		@"OgaMDfAbpvZaoKgF": @"cwukZbGirjpKSisxjXkGCqeYzRWwUJasLYRpKusFCLGHWgCibRSabSfKsqXtAxAVCNYXQcRlRQQzmvGOtlfDBwdazCxXyMajiUnrHTvPRcmYrIFInaWkrXcXQyDXBza",
		@"trknSnZdWM": @"usefYfhGFvGclgGuZlQRhjcFewKqFrIgVjGYuuWJYiMmkaOgpKRgkjsyIRlsMAyGchpGshSbEljDjyiuSWDzjfnOngCswxpfJiTkioUqfCiEprzpUcIitJiOkJdKfByXsBKqDLpcWimA",
		@"mAffYcmCkgxKAqv": @"zIlzaNfAbAhLjgjkgrLoHNzqtrDGCtnXFGzJEgilCqljUnyQbVpmUeTcsYNiabBypljCdPBvQaFmSwNYhdqiklxnHDtzYabUFXVFHcrPpiKEoTDkcuBxJnA",
		@"rrXBzvAPevru": @"AXQzLqULgRNhQTsAymlXKxoxfEPbnwRYlmqNCaVHYBLoJBvpRapwivFJoovaNynQqoRNTAjFTYKTEvJcSJFcMhZDxpFEALADpauJIowZFqKAIFLAmrPeCmqyJfrOctcuJfWsmkdoYnYNokdr",
		@"AEmYaRFIpH": @"mGYcVrIPAmfYAgUMiFrayWymnCmpjjjrsERJxlPSmcwkMPVnLUHSGiPvIJeHmDPSYrqhUTGdXguBkoAcaWbRkbUmKIomOtblTpYRaf",
		@"EMfCbPfgqiqszSs": @"UKZiSIqGzpNrEOCSGuxoarLtPuwlVGRWFBneAkoIXVMATQzejFFjqEYGKbFIMepIoUNSENwKpSgdyAYeVqMjOroRBFNhHlXEXCOfYCqkyFCDDeBEIQKOxmplOlhVKqiQYiZPhdWDFQqIrnvf",
		@"EOsrItpfPweKRPr": @"xhjnrUeoEzTomHFebMSDZpCdJydaUaKlAoNTIJYMSWMTQfvjhmfBJGsQbohPhfloJqKhXAfIccGMxDHgsquQjgrzSVTTbMKMHkSLlsQgyXYpjaPyTSNpjEZTHNnvSjVTzd",
		@"ygbZynwdqzHUCBc": @"rQNBPbiOagEruKJIjnRaNJeuDWdnlqSeyDXEVbXpHvVQzzLRAADGpfObcgwbuhFWXdLESStHgtwdHtrERiZIdjPjigmPxjdSifyRIrgaxobFESugjZTzMBPGlohxXmvdNGMWIWzsmjiOiA",
	};
	return jgzSWEVCGQY;
}

- (nonnull UIImage *)wczfAqBgqcrTAkAmy :(nonnull NSString *)ZPJkoiftQtqW :(nonnull NSString *)JZAwhocNYrXEIceHOj {
	NSData *CNTAxZOwXZmBzZVt = [@"zvNswbYUxibRcxntPLJJXCupcetQoHsKJReNCEFlYgZLHaLvEmuTOAGWJzZLiIYGpEttOvUzClmPcQuaVIkgizoyvqOePBwJESnQSRqwlrVFmwErmgBBbJNpIWzDhtUXP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DIuybVBkIrW = [UIImage imageWithData:CNTAxZOwXZmBzZVt];
	DIuybVBkIrW = [UIImage imageNamed:@"ROJekpYkEDiqWUvlbrVdiPaPKnyfgXCSteMKqUVqXXpgmEyqLQuGnhiclkleTNihZSgrzbOiwpEztIUnjKOklBEwFmhNvGCoPwcFxifGxKfxleYsMpwJYNvgUoNftwNDSZvJgldDhe"];
	return DIuybVBkIrW;
}

- (nonnull NSData *)JzgbKuKHIbIZzEd :(nonnull NSData *)fwdIoDZOvRRql {
	NSData *OHYRLIQAMMWJFxUaTd = [@"OkAKeLGoBoyNChvNDcTRtVbHDomtLzoELQQtOBXhRPyWhsxIuTiIUuHInOBbpLgCxBOoGTmdmFVhobvJVJRQVwOvSbIIGIhrRlnPtJIGgXRkHAl" dataUsingEncoding:NSUTF8StringEncoding];
	return OHYRLIQAMMWJFxUaTd;
}

+ (nonnull NSDictionary *)cfHRzjSDYHnlCP :(nonnull UIImage *)cGSjLFHYrER :(nonnull NSString *)TfvTprFIXaXiPUkMHnI :(nonnull NSDictionary *)nUQorjFlBvuleiIzI {
	NSDictionary *BtJQFjfsbvIUZXlzms = @{
		@"QwzdJEgFzqBrDDiHr": @"gMvcVHRCtJJjCegDKviTTZjohjtAofsPFMoWHAyPcprYdRFcXusJwwybaDBYJHgQAfgULqBbUfSGqSBpeNvbfAJEAJxqUUNPFTdiJNrwPdDmbBXcd",
		@"VuqjzqfaNCa": @"xKgJreWSVOaLlrOcCSwuwZcNKZaTYOVlIGglhSInOxNZZabkZMoXjhUbzQnNKQFQBTqMiTuIMFlxsHdcUosEgSOEhXPcpBUTzLTqxajnCJqzyohPkys",
		@"fXaJjvEHoYRrZtpaXr": @"PFVLFegqUnzZLDafcBhMjLFQOArHYAAESaRZSWsvkCsmHMlEEBoOkOyGrAuVcnsMMDFFCGtlVAGXGPkmotdIQxEczNhBzJCXUzSrwkakiYusLHxioEMqznFAksxKmyVrrVwelMFEgBNTPkUaBivcr",
		@"aLzMmgvhNDJMG": @"PJsFFrbBvHMAhRxgvhuEmqGsRHdtOTbTToflaqmGOxQLlxwrPAfwsnKIwnvSKAXqigYrOGfGrsXYxzRQXmGxXIJJsSWIQgeYpsqmuScviFJzGganYrKuUJOEveesMzdgzaZvFATHFU",
		@"BBtDksqYKqu": @"tKMidUxxjODDuBzIoKHWnxeRgmhNNJfXhlXTOwTozxkzFTUFjWDVtInYlfwctkcGzaOCnvLIDpMmZAlHJpiPhTlgiKnLOQMSpiLJwpXllWwhreCWpCyUjVIXuimWGgbC",
		@"LkDHyqZMFsqge": @"WGfEVZPGeLUOQZcPagGGjAtKBtGIAolllUruWqCQFePmPMuyHXAyOHLSzGXlXiyEcmUHaMKxccqZWshtMtrezJsXcvUuEoFGnqQvcymMJvQaIELHQBLhkKaflBppVVBoEBZBpwlaPWz",
		@"SpOJCWlgynGKGSnwAZ": @"bPOAQwbatKqrQWHTVbhxppsYBHhnbqisasLZoXRsMsnJmsoVURjmrkfZJiMrwcMuUTbzwNIIxHrsntbKVcjEeZfjVRugOfQmxICiZtOGmmtBCJkInjYGlq",
		@"TdYvCGlnACCHYaDl": @"mIhboDFhgHgyiWcyRprBYYkmdCElwspoYUKfSAgzOwTKkaSBGpjVPlPkfIpypHkqgVjomwyfRuSksSyyuInSjmCEjvZuQaEZlHrpjlxtJUPVKnw",
		@"rocbpdLhvoPbfDcfU": @"dmHFugjpRvxeayGSomgqXEbADfUOfQkPbrTzwqQOdvmIuSwkTqUfoKWicHGnfJjaIqcHOtFbDunZQXmoZltguXhaAOpBmTbRyBavxwcP",
		@"TKSjLbPVoTvTLgSRhx": @"UZUgaqfatJPbzPsTDcpogPXMToGhDbYGovWmFYDOtOsVFUAtgIgheqTRzgpCrpwsrXxBWsZcWefBMoXQMXtmfURkfwHhgQJEeOFKjRNhENOZJlhvoATatwxUAwepwURXutMSA",
		@"kieDIerykWcjvY": @"PAdywYCAtIizQzOFSorTEtBomXJYFCoyeoHulvFKokHhqGRWJmJPJDTGjawHGDOtfJEHcdleDKJrbryJkEsQHSxzPZuISKsuBUiNAIQrkZZtfxBHaCxFTvzXiFeiICqXTPEItzDGZIgleV",
		@"CYAIZBsvbZo": @"DJyoYYaEIKbjuotWFwOkBvvejmcumKYigWqZUKLqSMbdjRDDcQrSnABeyGupsbNvFPIClUazeTsqjbbCsUaecTnkXBVpqaGgjkZiPEVOCMtDAEOeWGvgvFwRPlIxsbIBEXgSQ",
		@"kscRmkCrgkuC": @"ucjleBYEaqIOPvXkruUkICnPeXfTPjmcAuhgzxVBNBiCWmRtquSdPHUfKcXHguqFWmlvaGgiFpZDVcNjFzLeFBbJBqxEviTTNMjkCEtvlL",
		@"uaoPFAIXANyzGoDua": @"ojwNTLpnyxAXQqZUGIBFpdoQRALufqisTPTpWkVhMcFNpZmHYQoZljZPUBBShIeauxupfpjCVInpzyCmmdtmMqiVHjjRELUwUqLnkGxmDLMhJtYFAWKqvgEuOeRqPwIRXBZryg",
		@"klDkvfRFfgQ": @"ePLuKjWPQSbtEDLFUjeZoTqQZemifOFUizUKNIzTszCeaixiinguyvpSuZNQMEBQEqQCtrcSOMIAfnLhyJqIkdDbqXuyNQzCPxFhgzUvHUHGBJoiptWNJFMSMgHOaI",
		@"knaIkbYiNdC": @"XGOiaTIHXTyzbXlHNpQIZFzRFCWmtuyvoePQBqmdIrhHsQfJuZUVyItJHhVMSGqcAPBmNvgwnILHPjnEJzXHJmQFOjLVbxNhyUqSjZGCzKDDtYUbNrNGALfQpWUUEkaepSCuynEofmqXtGBIH",
		@"eEMKnwhUYIGg": @"XWhaCslVEqBjJjPnLHhTqSlVJaWOsLEXvMHQZSpOGHJHMAXZrTvjcvGQQhmXSqPJruYnDdkLIGNPLHvwJIgbTzhnUbAalIbInwmPJrWnryvmXkqREQzuXJXtVCJygDyfnRMgKVrznLfVVv",
	};
	return BtJQFjfsbvIUZXlzms;
}

+ (nonnull NSString *)gbIsuuucVDo :(nonnull NSData *)fCqdxMHRvDUFpExi {
	NSString *PifraeKUICbJ = @"VKTtagRUGubwLqIWkqZNTZKOjAKLmrNFXgLIzjsSBlOaOSXuETrltsKiGByvceKrWJWqwGcFQXwDMroOeHKAPtdJPIykaMTlNuUrTo";
	return PifraeKUICbJ;
}

- (nonnull UIImage *)jKPSPvDyIFnKk :(nonnull NSDictionary *)nvGHsWYFXMgZPdfUltz :(nonnull NSString *)pUgDTDEBhyBoiyJW {
	NSData *VzCzPALrHRxhmPMrU = [@"yRdhlFkojujyYeHAhXWLUJoJyBRYDgSbZNRoRbGWWYpGyaPtQcCjGcFtAoahClUMvMaRaUVoowaSicCqhwPIhMjceQzGZRyFFVJZjYYROoGKPxkiNWbeevPEJsaiFslCvipcGkSgVwLdHGTNQc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FYojAlBcShmZ = [UIImage imageWithData:VzCzPALrHRxhmPMrU];
	FYojAlBcShmZ = [UIImage imageNamed:@"nsIvareeqBqWKCVYUStRkulPfIuufimzxgIcgZtRSiKZcIFApWDpYGEEFePRCLgItTYtzjarOAWcKiPYazHCuPNycgtLSOifxJuKmX"];
	return FYojAlBcShmZ;
}

- (nonnull NSDictionary *)uyoZuDmegfoWnb :(nonnull NSDictionary *)NuEswfffBcCkJyZGga :(nonnull NSArray *)ZTOWxkyINQKM :(nonnull NSString *)oVTtdNfsHN {
	NSDictionary *XfDCTLRFziGWrhBZ = @{
		@"UDPUTwLkxgfoRfw": @"jLTjNrgOjlVplFXSayLRbCXuQleOIQFiMgiFInpAJXVqZkxKQdxkdevaoGhIYYwHaFEWWtRWPmQBzqmtkHnqDcApjPHOvVxLqeFnHmBJOlHErmKLipeOPbKAYUPYzEuJlYipAUJWURRSMJBFViFci",
		@"LgeOJzXYGUg": @"suhSCIEuURsYqosdboJzMzhNHJRbAKICGuaPOKFBGgSIqwRDdCwHoDDcmZXmnWPrVexZNckXkQoagAPZjNFUxPnniNhFGgnQnmiAbaHWeRACGdM",
		@"qSEsDLbHyUEdXOQF": @"IDPXILwnEdWwMfpOcQGKIWdiJcfeCLXOoJSGXQbNFWyWXLWKNmxnUxtbYgSOQlbeXrMxovBDBlbKISbDeJGAcUQkRPqjFqCTbvMFPYbKeOzxkepwGELHhiaPDKQZPstcwqYMvLOZ",
		@"ANNTSPndQQJUjYvumK": @"FJUIIeCmWiHGVtnsDkgSfslRskDCyEkggBnmdRkYaePgvLMKIcNERBXkTOpUHXDadQUooRXGJjunNqcdAtoaVQoKDofWHbAAyYttRuALpaAtajgmZMylMTTW",
		@"SOGKzFRkxdtHGEXQre": @"sxjftbbRhdRsJTbBDobuujfoOKfBcLJHmiivwAriDrxrvuJIeKGxtnUPTHytOYNLwDVxxTcYhRvqnYTvGLfaCSIfpcfdiWTPiLWPrFqlKuHwvwLUiKZfMsakLXOQnIEVKFzREljSBHMPundsnyCT",
		@"wnxkWanMcTy": @"ZYuewjfAlUopyxfQWDayKxOEVMIOyhaiBqUobHMqFqZDOUtiCPXMyFZwwpxLtvBrmwRYkHQFZqhSNHcqoQnSHZQvKTLHaQPkkwPkDqmzNLEArXwpkwyzdmEfQTAJho",
		@"MHuVgcxCacClTtTsCDU": @"xdDgnJlAXQKiVHhOMTFPHQHBceudQYFcfHhvcLbzBHimSPfGyCJKqhlCjZvXgCrZkTgHkpZjvBMSlpvcgIcoTogMDVUzOrvpsBMyAPNgfquQhljldchqivQsczSQxALkBrPupFwyokhfGtGkvcBXB",
		@"LCluFFHYKGtBJy": @"HRzXDHOtImyTxMLeuzYlnESkfezIGoGXkTZkvPHsrTaPUahFUPeaijtYUAzDnnQvYmxBZflIvzrByQtiCOlMgAdCjDFVYmNYfhkcHUFdmbBtBzWscAcQoLdhGCSlgXmIwdcbfHYOqlqEK",
		@"AjvqpdQBdQzrQcj": @"rTTbJMKtlfLVzCFkINEUEAeKjaZFJvJAblGKTUcbFrvBPKDrqdytgqaLSOpHVjKVKFvspjcLOUTEMNMkeBAtnebTUUvbuGYPeXVrmPUMEGrPFVWJZmfXWPGYvENTQnz",
		@"ItnUknMIdDGSEz": @"LVMXiSPrAQSlYgdyeHqsuwvADgfWcmGlMIjLTrDuTftitNeFiLqeItUQRhHkXrCGszcHwOoDZQNHKwDUyzjXdMfHXaRamsalcrgRCFFQxOsDdsTRiWnV",
		@"CvecINxdDaILTKvg": @"oAnOMLYIxyiEYpcwtDHpNtumQYdjUfodRHLsYRJHRGgiErcxoFEoZiDSVmoCxsHntbPmlzejbPswYeuedWUFsVTuhACEfVwjFyHiaqafrpyDqEwKcfS",
		@"ZilQbKoklOQMaNba": @"EJfQxFUytEVauYQuqnhVuJAsXfcWxZUeHDLmHPboaubLkzeNDhVEyyFBBdoZkECHbMUFTVDolGyFkPybUrktVFcRRMTBYTmGGdtVSMrybsAhjyxGuSzaudefljJgMmZOHKAnwcw",
		@"ZQZzUVxOpjj": @"WOYsFevcZkiCSNSpaFMUTUzYlVWZFjYFEvYHVAPuswciNXwFXsbWPHznEGfyjSMhsNIfhXkMrTSMkOjZNjDjiLbGozBVUgZRUgYZNzqnDHMplcsvPeLFVkmxDnxXUMssPhnfqRVCdkZoIbf",
		@"IgVIUfOGsRQpfz": @"RQZyqbnPRJHYdqnNQXcxyTSYIoAbSeXHeRgswcwqfvHDFCraRFtrhbnPIJnhSTvXknjlLjOlseyCcNXWXgKASTROqnPUTlzoUvuKMm",
		@"LZLuTMZZjxD": @"LbveWFihDAwkkoKbQfBPYDtzscaJlVgPMQhmMfpsyAZqkhRGcXXhKvbfqtfRftsvEdBoPJCNpGLuMTAChfMByrnMBOnPmLXVwMIuGkLBgBlmUpUvLxX",
	};
	return XfDCTLRFziGWrhBZ;
}

+ (nonnull NSArray *)dfjXEkJCDQY :(nonnull UIImage *)ZYLdfHyxfgdHKyzK {
	NSArray *pZJxMfGBjkkTYYyt = @[
		@"hMjUqyOgGLZiyVxaSRPwtSltqbXTMiwUFPfFhxOfpYsnIiNJtEkdzZLkQHhzEfEzvfjtaTEvxwPbtKYJECHpFxsDczisiWMuwyrINnvYdJOWyIckhWTpX",
		@"knMPMyItnmhkMgbVRjxNMcknIpJhLTxDvaTcMQTAPspoUayqUwBvDWaLWDhkNIHTokMaLJapbkbEKZpDecmPzwiZVNDlVrJuybZhlFOHCGtrH",
		@"kKxoCajDesNHWtOmjmAeuIuihtRITcAJBThKnEnlgOdSoujqRABMVJKRjIQzuUkexWmqjIbHBSOECgQAQausALELlIqdscvEdrnjsapMDUVBBFWLsGmvNBsP",
		@"BVrwpYoDmhLzFWJifCirBExADZvZDpQUoTZPLigEVNvTDFxEKbVHrfPDLMvINVgDNIHcphUYpIHzvpAueYPGHgJWQMETicYEsjtXkspiDIMQznHPHnRMaEHChOiEDVLCOvOaqSMUISo",
		@"jauVFdRljeLSmZwwWPphhCyoOijrLGSDxFkQCGajEHQHgRNCoXSEdIUJUvwzDnNqmlgKvEzlPuTbrcAgInovsukzYoWYljCVhpbPHzHIHJExlsyLTdZxpaTIAehKXyjsgpkEMlP",
		@"CPXSnEPeMHHKbpyOcSRWwqQAZTHFlLFDiIxAonSLqEZoPhbjEXYIFYCuGBLsPSrBJeOztXNpnLDCFKYEDEIIpIKGqPrWgjebxcvXPywVMJqAaUaFzcQEnreDelEgd",
		@"sbooJTRTyOLZxmIsXodhDOglNMxAAjwDcKepiPntWorjrvWwhzxypHoYfLYfSCeHYnGCKTBRxyixVRsFAWfNnDEziGVjwtNCoiwvmXUKWiejPFwhtRUAUpOslYLItfIqVgphORsC",
		@"vxfzTQEqSTkbjfaDKtKDlROVnBzOTeYdbVaIqneEkNfYLiHqzyjshTHCZiAocymsWKBIWMzDUQapMXoPCPQVptMIfLYSZWwnjlCaFF",
		@"AlZIbjpAWDiiXztgXayRcJKMhhFnLXHHwTfsLkKXktHHdpPsyatjRLBVHYhLExXfbpRVAEoTdgQzgfQBicarOpzuXxRgLfTHclfcMxnuuuhwcbxvpRVaDeutAVbtmYixTvrNcClGzuclwcZcbnipw",
		@"ifdzZyOzcCNoifLmcXkbMoyVpCPFptIPflgEDiLMBBqdSaohDBUsCGyydjhpxkBVfLWDalbAsPQfyVmxrVthZIvjBySBVfvcBNgMeoHUdLmsaS",
	];
	return pZJxMfGBjkkTYYyt;
}

- (nonnull UIImage *)ZhcemRyaQjpjRgSctS :(nonnull NSString *)MDkVsBPVFs {
	NSData *FqHmfHsZpOyr = [@"UEQRhStXauvpvahVNHyVhCXSKqIqeNfshgifeJLWJIbIWAKpvMWxUUeOjLHeuaxVsnGxtDQNtvgqmlAoGcVhohgqtFEwWmleJvrrKLmvmXarPpsgIwQzoycwLYMkqZyiatrFACrGlqaoLmfgn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kHxMRyulmDBWVX = [UIImage imageWithData:FqHmfHsZpOyr];
	kHxMRyulmDBWVX = [UIImage imageNamed:@"lmoGGcuhILwBbEjZfaNmpifOloRCGLpZYTlFpzfXdlkDmkCJsiUSbRZUcbMtuKREdrgmTrVSvLXTiDSjQmgmiIXqlHreiuQqDhjfMnxzWmDWBVGfnlIsPcgsuzGAPJudMITDytGZLSvS"];
	return kHxMRyulmDBWVX;
}

- (nonnull UIImage *)IMyVbBYClADNkqrX :(nonnull NSDictionary *)tcWDRCwEtgJNXgTe :(nonnull NSString *)MVVHSVtSYbF :(nonnull NSDictionary *)HRXoerVsIIbIqZgMjnb {
	NSData *DXIACLQdBOnjuntusV = [@"DTuLQhQumdaOFhZxnqLfZNegTeqYOZNGvqwjefteVKVpdzovamyawbILyARpQvtCgsajfTJVrHiSSJkJlDTBbPmltNkqbvBsmNcGIynzOpYOuPZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DRiVcQtpQGnhMFa = [UIImage imageWithData:DXIACLQdBOnjuntusV];
	DRiVcQtpQGnhMFa = [UIImage imageNamed:@"eDEOEJNvQPAapZqPXYQcVnGdTBhfFnvWVZwUbNnWwlcSJOilTeTXLBHZspfTNMlyFNoFlARDqRaTkmODqDORdCsZVMXQccDZbKftqSFfUVyKAGIlJkkfTpWeLFEsmA"];
	return DRiVcQtpQGnhMFa;
}

+ (nonnull NSArray *)tSUcjgAQfzJepRVXxW :(nonnull NSArray *)BgmdpEKqZw :(nonnull NSString *)fswrvppxuhSIKTUXFES :(nonnull NSString *)WHEVzyQnwiZ {
	NSArray *kpDTisylNaTN = @[
		@"CaJuOKIzWTFdLzhioZRYKIwKhvKqxHKrYmSBBRwzNKpNScQMITIUnUCXKWTzhNNQivUQJcNFEENMNGlgFpwTBzwpAoNicvYtwtXGaeylkoUizvocoKWkhCZSILopkodLkxQN",
		@"wHdQehiyjCYJzWdPRwKfhOAVajfXIThEQFzucAWxbnSsMPdOmTXAYmUXuVOotegPVRJRffXRQqWCXNRGQdNCoRqOaiEXvLBOZmoEwXBttRGwnwJSaVeYpwTbmfRZacPXJVPpzPsEzUFzqs",
		@"swtmmpVAPUuIzSpnRTjIMuIGLUnSMofCNVBcjHoddprkqGGExmkFXjjEGpfojcsxpAzBiufJlxMbrWEXMgoIwoNIJnWlNwBlOGIjWwOsPwpYNjMxBoyfAVWpTHhyeJOgquiYSMdqvOiKoHv",
		@"dPyVVAmzwLMHfqeuXknyFfXHZVPjpCZUJflyUrSbZBATAVlyCUmBvyRwhdZSNQZkZrCKLptsyamOjprRNbSuyjwssFWLwMCJxQgwKxtbYCKaPvspvFGBXZJwuvmfrTXZrjnSflSRbCodE",
		@"RuDuDeaHJAVAjeyehLNFsHbnHCDKTEWFadrGQzKWHjLDplMIjqocCkaqzosohdEuLtczZtDFptoAlZGESLRiuHHYvWsWneYYuqhkMpCVtSrptrXyLAbUsapvjobIPJAwxgZBPSOHXSy",
		@"uUBJzoKphMBiPPOVOhrGiGIENYLQHPrKuXeHVZuuvAEzSDczNuyAWWBogjPkMLHojGJdvoDkhkuExEvxRCNIgwZbcuJrNGpkOpLFPuC",
		@"uQaCHIjadPdNMMKLCxCDWFNPPxKyQvMvvNnfsHcYEiFRdQXElhjaDnkufhGUvEarUJVQidzrXMbsiTQDgTxBnHGyfPiQvJMlFgOzrGsvkSiIaxSZbHKpCeWYoHjGDgUWuzy",
		@"vwngdUfKODkTJvIgmfPMfyMWQDJFHlZOgxWPkACvkCMsgwmGIPJtzyQLuFibbNgvMBxirGOmPIHZePKxPRHYrBZBcgYslgbYOxBcafW",
		@"pMMOURXfVXMSxddlUkaWKIBCzSfWIayVPbXAXlSCdvmVXMrVaZyfhkskXqONwHFxxIxmQYZtHJqEfbHQwCurNNCtKEnkHIpjNpJACqgVYYEHxExEkguJywXpyOPgzyWSWHQNXsBcQhgXRSV",
		@"RlefujlykEfjKWBfVdHmqbWsBzAtpwyXSezGPQqeUVEIoVLomYkNZLXTTVNkKoJKNLLsBGtHlMDOjSUbgODVzLQoslMxZlxwpkvkCjcRYcmUSZp",
		@"XJfRoEGZANdMuOREPqHrtbOEvGIQwobjEagItxoUXkOaruYyWBraSXDNWCUSTWYVzXgBkVmhjFeCLaWTkcPmzwahMLFiicNArsyIA",
		@"ubGgXXrfEIaekbDFrfjZcUQjmnLJtWlhKIMbLXhBwjJvqwqNBDtnSrKOOVxXRVRcEZjNNJtsuswsGtHUVLwTtZYEEoALZeBedTetIpRkFpeMAgFlpmBmap",
		@"FPfkjnNoarQggoEdbhnHcocUGWFuwKNNpGzMnMYBQIWFeKWdfIwBUrDfCDiiDAriftvcoKTDKdTHQeQXLcdSnSvSoNHAZmlthXlzzdgLYDRLrtmaIuCPRcKsMDzCDwWAJFhnWiWYIzljkbwAD",
		@"FRZChhfAEjyFXVrISQefbPAQrslsUlPHEyefBPjZAtGCOJuCuzhJHhnKVYwzLzwzlKvonrHpToNTnGEBXsLiIIXXEUdQrpQqRvJnemBjQxlOGKCFsLotftLoVHmaWYVEDo",
		@"dbJZpVfUQlDFuTCNDsnmrMWKsJzUnvrjHcHAJEgHWoUbavWDIDObhKBZucqVCWqkonUXXqocFBabikDEhETFWeVVXqahRjeybGzIMKpvFNGHOrNVoJtk",
		@"JGuxISbapzdhAkjNVMUfSrrgMOCuvjSFBrihLmXajlxdfvMWjXFGPBovOXxkYzSVZBUBHvSjFGoLxXMSHpejvJayPXLfquupqmBMfGckgFUoEiAbAdagsqNljKDgnTbTiSDSklCwmXxPCkYwtpB",
		@"brZOAYKqeKqQcLchfOcHYCIxfjxrevsORzWQoXkrqnmwWYJuXNjjUpTTUrTfYaMyhSRzyyPstayDLhsWzpkaZHQSeHnueVtAJphSiqKKmrMBHETYUpNwCvvcDZGavnQEMdvprSuALnUuqob",
		@"ULYuAvzQIIeFcRFumKcaMOPLhnaFnOJubsfHqoWgUXCvCcnNyqeCGNeMABKdEIskFNyOmjZLJQLMzwEqcvQExsesvWMjpzwsTjCLOFFZcRFQLKUQvlvEEWyTGVrbsHfEeO",
		@"IkJfUOPabmVBoZqWzpCxNIcwEphqHIDSyFPpufgfdnzLbkhrcKDakpCPyAhUGnrzeUCBFPOeWffSSuKhzsTQHcLquBxqJNytWRYGlGJUboDSgOVRYNPXj",
	];
	return kpDTisylNaTN;
}

- (nonnull UIImage *)whqHNGRJcVRNMXSKmUc :(nonnull NSDictionary *)gJTFdLJPgsT {
	NSData *NrkUMNokejyiZDmhAZN = [@"mwpOPVvlMZEtkPtuELeqncyGkrLxsZGcPXYCWTUytrJgCiaAZWMFiauOhAwNvFhnhBLmgmMNvssKCSGgOQmSRqBfvgLBLOaGjKpeRjKXReEkDLGrwtbYLXkJw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *woogVPtGXWvjYIJXyRO = [UIImage imageWithData:NrkUMNokejyiZDmhAZN];
	woogVPtGXWvjYIJXyRO = [UIImage imageNamed:@"nUzjdvCkqXbzOpjbZFdLSpILKuiXoXwUpyhznCbSZXPYuzOTEkyjuQRfwRMwPgmivxHBcUFOBcrFYrIjhYRPylUmphyRhYbExmvfEYyiSWvsPMgAeUrGUfgOUAJPQzhZnULRWwLaYOKXNCMRNrP"];
	return woogVPtGXWvjYIJXyRO;
}

+ (nonnull UIImage *)XSyZIhMmYDbzsmuXHdb :(nonnull NSData *)uMWXDutNXylbxGE :(nonnull NSDictionary *)UXOzAUgSLMZUxqtoeq :(nonnull UIImage *)kQKTjccyiKfYLxVNbR {
	NSData *ahdlnSyEtaJBQyYl = [@"qlWjYaxPvBSSYtmFRuQOiyDQqrTxjLbVkZNzzTCRRyMSyteQOKHrFAfwhubdTikrEgqCYWDIEnmCcghPIehPrdKMvnjzEtZWpOqysyE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ifkpXRqMBHVqhE = [UIImage imageWithData:ahdlnSyEtaJBQyYl];
	ifkpXRqMBHVqhE = [UIImage imageNamed:@"vnHMFGdvUVeWbsAKJRlPWGifkWuWmeygBiSyIDqevxBwdGhwwvPoPuTfGnYsHSzPsysFPJQYNmHNKbLICsaomjEnExlMTLVQKJgb"];
	return ifkpXRqMBHVqhE;
}

- (nonnull NSDictionary *)PEXFIjQesRP :(nonnull UIImage *)TkqgEFFVQChm :(nonnull NSArray *)AkmJWfeGdXdKmJgkM {
	NSDictionary *yNDgZNcpSJYCbYj = @{
		@"wulJYEuoQYXH": @"toYswythgzIoXbrMicpIFpSXvuZnbqMDGhgRzfxIjpnHUpgGAGiRHbBRQQRsJUPPNlcbfYFJuWdQKfbWCwBwfuBGORSeOdUrcdTdLqLTXLMtnLKVhgHaZXnZPLgIozPAF",
		@"vODKuAXJZzRCZXbcX": @"dNBTCOyOtqWfPUlEwMQdghfXoWxjEyxSrYPfHaAiKCsKxpUqcqLVaNpdbbBUeQCDRdSQXyddyJoFxgMCdDMmEMowMKKXmzEQgajunoZhEtQrdtTJKqxnRlFRYACvemKRqwr",
		@"mJEOcfGIRliFWpaD": @"SovKwXMoLRbGlngDxxzPHOZqJaYrDemkwbmxAjlWNUnpITxMCLGYxqVXZSRUtPEroEvVQmJdIReQgTZrtnXVZYORKtFjtFARMuCLkuoDyxjxMZdoGKBVXvgnSBRmHzLKCnpnccNxpuBHbOv",
		@"mMvDNElYaQTrYRXaEd": @"RNwAjSAHnassNXXspwfEztOmIASiIcTsepswbjgCLrWlRXRGZErthQTGktalKttgiXjixJhHRaLhoSHetshxpERYXUENGEvPJHPAqFcuIkAKaCvAkvSmXdICoaujbtDwkTQtfywQmKJUj",
		@"DwbKqSHJHe": @"HBmDMbXSlwEcrfVjsUDwqVnVlGtiynKMLggtUoIvbWWnTeCBAniuDzLUgMeuXzClZxHgOkcxMAQBiFCdhxAGgKbOhAVDBKibRqZhywHBOCKqhKGmdvUvaxVhwieXAvJnxwRHDhSiEpA",
		@"nrJrZmOsVLh": @"CMGNxHTNrGbersUMarlfSzWmpFbhkTrRUkxkSVjZrFlgmKSTXrZRMDkRFcAdHTfheScsrnHwRvHCUygDeyTcEjRALyqMKvDmazOPJBCYUAIukzscGPJN",
		@"yrvZqKlgUUMg": @"LQNRZLjOltVtvhauqtbdvJbBGaSJDyWtYyIeqynPUCArMsnQuQdWGvADfjjCkDYQxeflZYKaoGQnPkOJPyEQyrSbFCmqnCEsoPZJkvpGcNbfkjRsTDxjrbkFVcNIcIxjnHxVnBdhbnmFyyhclYN",
		@"nOTNUNjMgwyEiZbBWMO": @"xfTIboyhTaUwDeNxzsLfrnuvQFLNTUuzxElyaUcnUxJeFiedYbSGDjFhncAMNFpRXgPjwsMeplDIKktPJujJByycdaRfRxUpIiptjXZxUCPRuaJ",
		@"iSYBflqwKRzaRgayGu": @"mFyRSHlqBONXZWitcAViAnzZHFjcAPVnSMGBvRujvucYDjXLVUcntfWIiwOIqBazUbLezXfLqQOTWBWpiMgpOVxXDZmYonjeKUTczfKaz",
		@"XbllEIbMyKdazTPJO": @"hjwUGlMTzsntGjHMBiQKIFaTztbNjQbZhcQDEhqKfeCkoxfTGsRfslSGcHyszgUtmXTPmbIyTLFcrzvsRmFoMqhkHxaBkFHDiJMmvCyjyHvoStAlWtTSndtRobtolfhzmNgcwd",
		@"EPELvPEGEYR": @"SHzbJsRnwcGjoEGznOUODupppdhTrTajiUiQrGOULAEdfWpQMuTyYytIYOelKJypbLxhzCReZqxeAxggPhEuRqSyJNCaiefnACqmyBYssGJdkKEvRseYykjsPZueARGChdvQU",
		@"shCGyJiQpKpHyg": @"TuqdKZeMdoNAYGpUqdFcNnDuLBVLXxCpWtbZvLaNTeYHnZBnhAgYwQuAOAgdEPPMzskYGtyqrKTsFRqtvEDuZxvSVCJEbrbWKuxNNlMeLPKExODRgSlndiMYdEVlOsVbdaHMK",
		@"jgpqSqyWzLXYMqEb": @"BoNxKqQGsXYePNhlGiDMknVmREPDTbZaqwafojWfyvsrFYpUvcaqXMIfGVOvMaNbjJQrgOoIsHRFwoPCCembVBYqzxmbViFkMRFvOqiKAdlXrTesRQpZuFf",
		@"cirHojVXdB": @"HfgUJlFqfPJBNYCQxApfWPRVClIJReKdaskCkHgOqCuJtszknVYjbODXetsTfDzUZZAutMnDtEeSHzgZBKjPEkmpdqSxrmwveRwPrUfpnxAXdsMUbpceJkOMrHljbAi",
		@"RIKkvCiEmEHHlhLm": @"gmDEJespkEXaDfvoLYPEnzmVCgGUiRWPgjKkJmPfkXrfPcimaFCSCZEahZmuzgmvaRbwadZDbRuzKVKldmeJGRwJgGGUqCGRazVQhwFdzARRfnTIyPOvAuJpMQMfk",
	};
	return yNDgZNcpSJYCbYj;
}

- (nonnull UIImage *)YhKukOVozhYUSxbzm :(nonnull NSData *)bbvfHOzbsKWwwBlKm {
	NSData *dNEvcHSTrovkjKbba = [@"yLNDPjPByqcjrDxLQoBvbPwPKNNTXDggpijyZMgxFKRkRQeigpYEmTKSxqOuakZHOlAWutgxgyJTZtQQjydvYzncaltngUrfaJDGFmGNbjwWwyIgJScexJrKrrdqujObvQAmxvg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vaapvsdrSUPcbwXKXO = [UIImage imageWithData:dNEvcHSTrovkjKbba];
	vaapvsdrSUPcbwXKXO = [UIImage imageNamed:@"AQYXzPFkPKVDoUtUDCDVtwOxrovwWWlgkqTugjtwHlpnlEQJUyojcdEysaXzRXlbmUHzIrItiUYRmGZGuWtMrhQGOWqMShcFXMquWTLBOeVjVtyACMhvzGYndzMmnNsj"];
	return vaapvsdrSUPcbwXKXO;
}

- (nonnull NSData *)VVGUQlFQfvYlzGIcO :(nonnull NSArray *)ZhFcddLJFgHQKNEW {
	NSData *RKpLLzqriMVgtz = [@"IoJIiDJAwqSqarWXvZtNCpWDDtajxyJuSNeMaEDlTxemIaIlMxiUttaDeLkCTjNJBSLNzHXPGZCpgJTyzShkMYhiEGugYGDahKGTSBRuSmMnzcswlFXxLWKkFsruotOkjiTAGnMsgM" dataUsingEncoding:NSUTF8StringEncoding];
	return RKpLLzqriMVgtz;
}

+ (nonnull NSArray *)BMpnxoyUDgkZN :(nonnull NSData *)qmzXTotaxTW :(nonnull NSArray *)ufNSKIGTCvpO {
	NSArray *bqCUzlZvuiNEi = @[
		@"iyRtCPLfRaHsNebcWisilvfixuUMfHRNWVUuDsFgdyUsoJBWdDuRkrCYYVUmKJozfxgvHvdaNOWLEuYyCEMzHnkeIhYZjbwEtOyAKpyDJmqhzMSfYfyBbWlTRQIFCWKBNrVpguICL",
		@"gGESTbYSMEqGIteEfQkmHzbwjfmssZWlHPNgSVKMiVqXJWerXdKPyIDBfXtpyhQXFfGVeYcmCdsAWKUrGCdoGDkyLeMsHlOXsxdsKNgtaNfJgCahmBJNzXctYX",
		@"NZWvuMVshSBzLqCOPNriJgLhUFiOsJrOpmIOqUuQLnkKsjGTHYhrXeLfXbcSWVnPoeLUdaMLGKkQhbvCKwgpLCnAjTkoUyBRNPVduOTbRpvCZq",
		@"GbFwfvFQzztCnecBGWGvMzfCHksESVfHZelodsTbvYIFAXaJgeMTVQLUPUmwnGSzFlspiNaUXAYZGlBBQqvcpDyFnSkqyfDHrtfkwGknWEKeHagrrSFSnGaQIcMvlUopSCDyUtcYYpFCZJqzTkcil",
		@"QPcRrjIqoNVxYMCVweEYSJbBBCeSowvEjfFQwKxGjsBXupRMydAnruKvRZDVMBodSEJNevFpAXsjHVMYkTBEXEeCRVueVrnnnMAiOoQZtpcxYdCTFSMMtpKluawcWik",
		@"snPvfGufsDXpTskOcukdqdsShBFIzMWRyRHIQuuTXPHspYQJYDZanYEkJeGlIqAEbeRXXLWFnFPUlAwaFpEoAeWbFNJYYAAqLxLyyedIFYVdaEixrGYopileVvMURULtMPpC",
		@"KAHaArGmFslPIqolmLJUCIGNRabLfrrGjNyrLWezXJQqipEtePJFmUqZepADDtIouffxqEQktxMugRyICAyVNDllaRjvMPgFtPtmecCZjDpjwVqWVEZwZSYGa",
		@"XodXplyvHsfGVcwTVRyCqakERVgdHyCPJRtSsZHUEcjdXioTjGEhIVKKwdBCgyNpUENtRGSGSQzjBmhBPAIQrxQEKrLukGkWpzZYcfmR",
		@"poRMpHieRvgjkeSPvnUPvWCZBjZyacKBxOIqBGzghZpBlkERbwHqpgOaMbAqRxDdCCMwonZWkuGmciGHkytzaxHWNIHfXRqWKJzeCsZZUVIn",
		@"cjlaTxLHzbYKhnPpQnGcAQbRRmWcZjFNkKpURWYFsESqQTGTtfZtAcrMFsfGpWOOvjFUSZRSdvWZnqUQihfbphejYbAVInZnPVBSoeIwzsRfURBpf",
		@"TKxSTvoicWAjQFweHkHJZTHHfsFtzyHaJEZFHUBQNcolBTTQMxXYVBMMxbqzSVvildmIRojfONRMDMYwxQsykacGgqGsQkylaQPrmIDxQGLkgaTgzNYKmHrGeIT",
		@"BfgjxRmCPyIcIDxmvSQgHqQOOqXNNkGCEBaXglYSckPUBkvGzJOXXHGTOTWKDLIPTyqnEiwObCvPAubwAFRkhxtgATrBZVovCHpWxCCQauWaE",
		@"kNngMCLZmqutubIpKkFkZEyuGzXPHRdNbFLkgAlCZtUPHfZPLzMPqUvrFwhJoIGDBEoEOuJAKXbrrzqjeZdPBoyOajvbbsgjWmOzyZlEmroYnzMjFWLQKUmEqtIifkN",
		@"UAcAZAKoCmOpcSzUCgAOeOZdmJxBZYvHBgHQhUUlTYFRXeVScbZUqZdxxflJLQhJPdjhbWozYScEztpwMQuqkJhhQqyzKurpnzPeHTsNXDZGuyQseZoghtxYfE",
		@"XKbMiDkAoVRuxdzGPZNXgJApnMMexDSzBWuruWkTSvxAikStbfKkURKQboOuDTDLatpVgQtLOmAcdTJpkifezhbxTAStRmPggQcGqBkyqznKwKMUNzyhKpihmHJdsYpHApdxSEcKAOEuC",
		@"fsycVzrMZkeMkMZuEFTemFMYNWpGxjBUssrShcoIIqgZGrfwUQtlpPaORFGxXZLvrShBtljgGBwUWwzFPrYJUvxoagLLiFhxBwQcVboNPHELYgXNPNlyUJDLvdcNsXtkwMrBkmgMvXD",
		@"NLvuXkwsDbQxONyuZMMsIbbDdlbQxCSjvXvJyDmufzbBvBRyrvhmmGEZPoirNuekLCczmoOTQxLtQngYuBXufETpliDTKMukZofrqJrKzZZKwemWodghEBpsgZtXlfAacuyFNpYFJQDeyvAJQ",
	];
	return bqCUzlZvuiNEi;
}

- (nonnull NSString *)qlUspvMLKQ :(nonnull NSData *)DUVgAWgYtZdxpJapa :(nonnull NSString *)VFrNJkFBzNPCz {
	NSString *dHvpjPEwrXGqNGaDpsG = @"ehlZoMsNRWvodSptFRIgigPgiDOBPowJZYgAnxWHWePHGGAcIYDjkWlzpuqfCITruhWDmjJPNRuHioqGwVIUlCDpxPYxcERhLimbzGHkidTMelzSrvpCuQagmkberfRCYgtU";
	return dHvpjPEwrXGqNGaDpsG;
}

+ (nonnull UIImage *)HjRgNvGWiRJ :(nonnull NSData *)sSAASDZTRYGNw :(nonnull NSString *)bKBxHSecUhVgghwMGub {
	NSData *NQqvJtxeOhiMjBr = [@"nZhhoKgaMveSgxloqADSxSMSNmDMRkabvhRlNgkOGdrhdRyEcVLSVdIzGSqRNEiyTzFtXvpoPTDhJbPQQzuUsudjhiUqfsozUdVcQoVwvwOoYBrzbXdnCvRRTK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FbHhibzUrLPkyN = [UIImage imageWithData:NQqvJtxeOhiMjBr];
	FbHhibzUrLPkyN = [UIImage imageNamed:@"qBvznQJxzbrosQtVmVEYZcMdpLxVqVwyxgWOVqVGWVLCcaBLAEBpgSjFCEtZOuuPjUniiTOaxkjIBuZbuxZdGYEZZeVwBKVMjRajnUFJxUxkJAboYaFMubLPLtuT"];
	return FbHhibzUrLPkyN;
}

- (nonnull NSDictionary *)beknIanZtuq :(nonnull NSDictionary *)kgAlQbHqOp :(nonnull NSString *)RZBpAwsAqRnfcm :(nonnull UIImage *)CbsUFDLyOBdnEpzJ {
	NSDictionary *HskbiLqUejAoVZqeO = @{
		@"NjuLBUNKShCE": @"lnMHwEkbWvipIFswSdDzOZsWjsveDUEZciYEqEABDvKwHaybiyfDepyMMgeAhwGPpHDHSgPdaxyNldCbkyWRQskYGppeoBwBqyHzyTFkWpuyCvUMUPLphCgmIFAzahGq",
		@"jyItwGvsgVpgpq": @"rPhdrvaZOKhEKPjIoxlzffQkHGBlaYvSPbXfGPvgqpeQECpueKiBCzAFTPwBBxFWqiKtiFnkcwTHOcnSBKhUCZUHQvmMCQtBVmoBNHbRb",
		@"kNULhSTQXUTWAMfIDcT": @"cPTCzPUtVyxDbagGnCsHrRBQYJDLPefmrfmhyNnRHqFQDQoMGNBnFKvfSAHwcbeluyjrEaRsloJmxQJHeAHQFpAhDmqdmeyhSrgowOOVNf",
		@"NEMOLIfNVTOUzGZA": @"OpLycCqmXpbnaqRllqIQnONgsQyJbLdlqEoalUkKnwJkVdCqJuorZKrLunPuyegZhqecRrDrjQVXEBUhjbcYQKJwPQzRhhOKQtWtWnzqsGiREEyFKQFYbYswWzZIluieav",
		@"QIQrCkTmwRdaSVybJ": @"BRbKOrmptJUCBDhhBUZoiqIeePUXxygZvGEaWigJMQTvMANLAujCFnobDhSpFuVgFShuedcSHEEqsECEKfAvytIEoSGBXENWMroQyMqSGtK",
		@"lPdKWgNlAz": @"zzPiHNUNfCMumJKUtyKDVjSkAEzAylZzrJpcbWpUZoJGUNrkEAslRzQAJEwYzQVelDXcKhINdOuKGWLwsMZGiQdZsHoCTGbCQKOlpX",
		@"lKTfvtlysXFxWg": @"qcKAUDlUpGHSaUtiaCnRMQdcrMDPeNfbnscsAZUGZuiVkcJSHQfxzIZFJdqVCyetpdNZzKSIgScQWYCqOkZUQFPWlYiMWdCHZLmsEMHuzMBGxGtnrTsvrDJ",
		@"vOyImmqoxQXj": @"XBHsIiXNlAVxUDOkqSCxXPCOmTmsgLBFizPKGlfNsRcgFVJWNOVFqBWefBatsvZYmeWAqHmUPZunPPhxwcwbwHJawKdyaHKQuCoZoFoWYskWIykHYSGkgzfK",
		@"WgwXjTQiyxpwBmnCk": @"fiXTkNSfjGhyYbwyBcfNyeCxaxrHJSJoSeduMfxjjyRPOUXiQYkEypbwSFlikQJsaqUznYRvCAoYvargyVdhyhdQnjxTzqYgjzkBLWRWitL",
		@"mwDcGcSIzviRbLsaDOZ": @"kMmaNgNEPiIAXbbOqeloHANOGfoZyHYCDnkqSHQKdnZyvCvnUiifLOOLXlZkqGXKdsVzrfQGGNwUFuCMwPOQUQKxrMNiBhNDhgLYFnVQuibDcfkROVQVWjkMZIDzBNNiaPuejSEcsdaWMDgKazOUf",
		@"cxqmKklIWcgGULo": @"vISrXXqcuxBmBrFliIcuLaHbVOQJvTWIBzFTNcuWJwMVhkaVGUinvCbFYotYtnbzUUkSgKHsslpkktRVgoxHVZvXcHDpiRttuGeTMuhBWfEtxlCZCJKagFMSobqvqnusBiaHVyV",
		@"FpDYQrrvJgYsKCzYcSy": @"TfhoyOzIIDsTyxcMbtrPpqqGkBolWpstDItGSBWekmHScRwlcBvVkaRlYmsrpCZgWOyQTmgvBzafkltQqpUYsdSngZAIfjvUoWATJ",
	};
	return HskbiLqUejAoVZqeO;
}

- (nonnull NSString *)ABHDtCcmHP :(nonnull UIImage *)uuZPbFkNqMJgN :(nonnull NSArray *)OwGJPldGwKdTbLV {
	NSString *YBujRyIcfluCiagSt = @"KKnwIEeEQitgJnbsjIOYPiDDZxcWZbuOTAECcDPTiIhtDxAlhbQRNphLjoBdUJYjnkaOOMFLgkwZvobhHxZLJBQCyfPezzDhNESdQhsCorOieNCFWKmFgSpahbzyKkcNYPciIYZwDkvvtRXsjQAs";
	return YBujRyIcfluCiagSt;
}

- (nonnull NSData *)GJliOuDGUmfmrVa :(nonnull NSDictionary *)DFQXoDXBRFTCO {
	NSData *rOPBiMmvVAcWEwr = [@"ZVnaVmWEPMdvMPSBFOiGLZEwjXZoJJMqINKCkhcbjtygKoMQpMKXzrYehiKuUeOhmpeEFvKqZakQdzlBtJXZqcoHnSBXZwRrQqcrgXoQVGwYnWDyRBOxiySpKpxTuFyUwjpchDqiEpjqVVuZfmAi" dataUsingEncoding:NSUTF8StringEncoding];
	return rOPBiMmvVAcWEwr;
}

+ (nonnull NSDictionary *)dtHdeqYstuWjbMh :(nonnull NSArray *)goeCfYsAeEaPEKugKs :(nonnull NSArray *)YSskbcTpYgBgvxQi {
	NSDictionary *GpPXuCxxgfwiDrQyCyM = @{
		@"xyWUnrezuFlyBYbI": @"XIDAcyokxBNOxJSXxqYIgUwJPXJZbcdYYGdHmzHvgAurRNBofiDrrdfLrqTFgTHvuSQAPwMTSGopGGOBoiJMrYxlmjQAnneyuzTwbmehdHsXHzqzpbSFldGYToxtS",
		@"JPbAeHbZOf": @"nxHzAYfIRZLQIBbYKamdMKxXtwIExTOhQUmBgmPPmPzgjHVILOoZuLLeeYPbJevvJCtWPVWEDDPWOnhiicIliGjbmbixOAVcwSoFRbiZrmv",
		@"OdXnDExpcIAc": @"SUjxUeDhsRPyheFWKaLYqSpIhdgnhxpmsWgEimZOOHQSXTHxCwuTelBhamYaXFDeKToImheDYKuppCAAqOzGaUQYMVnfDzJEEoywminf",
		@"yyMVBhlHwly": @"lAgjeeKGJMQbijfAmELCAJFiRViwAZgLQzUHpFyLhRoAAAOVUCVrLpoYgmqaRZIXrHksOxsRwtvwVDAGauTHWyvhODTQjmGqzIzfgJbuvuGWeJoJ",
		@"AtwEXeMxKFX": @"onUaPNyuWKXRplKWZoroCrqrGYkyAvmALQdyIWRCztwCqkQgSkUqrdwjDCqFdmuaUDryqbhULilnHHWGbiEJDdwYFFnoiiWEuMRTBIwDGXeTUvmDoPEEIeTisVhRHOeaMICXcnbgalEN",
		@"oSvdKFmaqTaMho": @"XxBXKZYweBbYFXlMmrXucqePAQJDYfNZAHweidlBPImxIYfrpzbghaNCGySHZESzwVZOAYNflGDwOdHMiXEFFMEJCmRbIOJDnNacGOjTXreyQIpdCnuiAglDQblhvVcJjq",
		@"SwBNVtkpiigZTVStg": @"TOTHXHqpRurEZyjckdXtGNoQPMYlQzfDBsMNJRnmfXGcGeVSbFbmUrRAaQCIICzjIUtQtQMnSCYsYnTdVpLozAqtvpECMsgbejaylLVqXhkioUymwqWmnBPQfxUiwvcMDiXOoG",
		@"RIHBUMFnUpNxfX": @"gCbKnlPzkYElAeeHJNKeucsSsAOquojxoSIxFOewJzbqbePIRqfmuWCsGUhvpkLyviRiuUavSmfEJufoxBrvfKatkizAGaLDBZgJKAoTgs",
		@"ObhexreoQtjStt": @"fHhWGNTJzfYMDUbnDFwIphsvruzHJoMnDWXtMbzofNaoTzRrTpjcKXiZyTRaRMpPgJbWExPyntybKYIqhaxUGJEcWHcVcrgssgeXrXeRtMVXjnqiWnoTlFoBqoPgxofedIBzTAPIXqeL",
		@"RmOjjWcdnYrOgQlxqg": @"yGcvTHpglTtGvcWEOWSEKDrkVqgVGBMKeAbMaIIIMCqoUiLHiHTmVlisFlUiNgwuWIWQBfFnFQqyJcuNrFfrGyCAlyIMeghKIVTIxEeGeRCOBMiTGgvTRTAEBsoAaDllVImH",
		@"WVJrrJvFbuXdxe": @"groejjCxzKqzifnKxkfOVQnwjKIBEwPTaEgvtSISvqQSAhguykHYOiAXmNZcrbIAGsPGgRjuDzfUTvGHOFQQyyMYaHZYxrFoEZjMbNMBBFoFeodjsxPXahleKVJqEIldyt",
		@"PJtZAlXAETR": @"fTPzCYvATLfOcqKmryJslntrFMbspJHNjiSdIYUBWuRHKWIOHOHctJhkGqETayQOiROqgArbVakFiyQMPFbvZFyzvNOtmxoSwZgtzCpTsuswCXSpQwoFOULKQcNKgjNYuXCiS",
		@"AosdZNXmocys": @"wSiswYcoyFFXkGvmumwqSPidvYCtoOqxPhpsvCaKTPmQdGJmPVLgpPhAubVFFzadwUSAeslqvtiNmypPHAgelCbWyBZfhktCerJtZaNDloVtkdLfNqSuOyijDvJlMYJujgvLOs",
		@"asMeMVrRWK": @"ltbakjkzaQBsTbPPxPEPYHpqErCVnZPKfWiDmUAbMSzKmBBaknjSIXywqSfEXSEksPVuEHmFHlwtVwZdGzCeUIFNGjRCtgJXQVsutoIXtFwU",
		@"TRzvdYbRXICsnTvJeVi": @"DdJNEvXTTdiiDKajiFynLmrjmLLhSdwkLNENUEPHPhKimmSVDczTgEppRUrIbbwxABJWRHJWyLbcIRLlbWfhFuthlMZzKGKjCrEplb",
		@"edUIZvTjVlWAulHa": @"kUAIzsZKfHFLrTsBNWuNnoMnQqhUZmrwTSnffsSptJyQiHyMRHDWksaWaFdrwAVbUsImSKRtCulHhfNhhBdILjovHhBWhbzFtRxhnB",
		@"xDDqPxidLbU": @"wWUeXtjfhFtSxlMpPPMNMvLprkFOPHgYLImVexgdMqmXQHfFYBkXNVEPyInnFiDeJnJEZPeOsfCiyiIZXIlHbVBfDFSVvaNnloVlksbH",
		@"laiMRnBKMKrVPWB": @"MCLdgtcCmwIYUkHuVnhFtcuXuzkqKBItZGhGksALvawgrhCVtxviVIiHtUoVHQUHXMlUJCTCgkiCvfGmbphcJLzEDHZDlHFoFQzRViGQSgwRAkrQVWPpaHoNeNRtdtwJSGcnGDJQCyqMRVogle",
	};
	return GpPXuCxxgfwiDrQyCyM;
}

- (nonnull NSDictionary *)CtiTGwqghcVzjpGlh :(nonnull NSArray *)HuBtJtsmeenIk {
	NSDictionary *IMYoKFRWFxCSE = @{
		@"wxIqKvFmrDACocBWDNb": @"vvPByjeXUTkovuWxPvZnlsAalTnYQApaBQxXVuHZGMSSWIWOGnDRAypAnrTuuJQDoEAzChMSfFWhJbJCOxanCyftedkTMywvoYPrQIpqyAFGWGiiKmzkXikxlhvcJAEfNIauUYPXWPPYGxYs",
		@"JuimqRIWgU": @"VHjlyVRrkmuJfFgKqdzdrzVXHVsbDsnDPIKYlDtwhJPMogLRtSiHZjXnicnWdWGpKToOCgZLBbRkqWbHbawJAxgiiMQPouCYSLlmOtIchjJpcO",
		@"isAXWfpOysn": @"xTKXJyBfHYURdDVQeQdkkkPiSkOeCYcyryNxcpBOesclWbeIvwHvImSwGqQPyVSnxciLrEzSYQqEbwrgilIstmaVLsTBdpLzPxeoWfGYuGVA",
		@"cELHAjzgzyGwf": @"jzGxNMStswjASqbSAQPTFouKSsBfjQYOTCGhBbsLZvThbVeGCWnPXUdqwciFTndtRdcayXTiiSEWRJyWjkwsceRLssbYXptyaSDwUFEoHlLoqRyLoUYaUvucASXrODOEoTLCpz",
		@"svjrtYzqUZtwKj": @"afYgFhHrxuDjiiKodvoipcCTWPwtLdaSbArQIbIDpFFEHouHafhTQdMJjLNzVlzbWaDogNEeqxwACZMWKFcCsGwYflgiBuqWIlVCJGmgYcpruwHpVGcvLXkLNOCMPGVMz",
		@"LWRWVFZyKFixA": @"kknsNXDknPDYdfDFIbYhFfsGJFvaQFwoiAaaIRQYthqviitCmhFPfLXudtsifiAYUpKdNbnRTDpUCwCEMqFcOJmDIcbEDTRzmKRaOdKccNYrZpFyknyp",
		@"DuqSWAaDQQbNi": @"wJsyPAFsACSMuGWMITQWqZtOvRPWtXyHeshiDlfHeALAsRapCMWjYoTYpakCMIpIEsdpcJJABqfcLcGOWHZbpvqgUKrrLHscqHHmZGswWKWGf",
		@"nKDPqdqazpZKSd": @"JJJWVKZwLQYKiKkfXETiKnpmvOyRHJCNfBmjRLrfUFmuTiovQQebCqhXhMZzvNkKZYciIcMbQSlMZojjfPvgBiYglTFoToSMQCwauUQnJkrsMvVSvhqTwbivSxeooZttFvjyAzgWgbIrsNIhaSQ",
		@"dFkMzAixEiYdwCB": @"tcgaQeUVjJNLyLqLkMVDPCJLWgSyiIoXfkfHkMytzxstZLngJlMTBqdoXGPBcsaRNTjoVhXwSshpXlZQmhdUbpopezDCSaYsibQKx",
		@"hGEmMyTegSL": @"wPgHiDkZLbvhNcqvLCoqHPYIMDUhAmBsrVKLXqNdQYbYDEhtRzWaVCOXBdNVDzuyjilrqkfCnATQTQcvCJdndoaIPoDYdOpKdwrzPFpULjfQaVhRjNHYeqpyIOSYNsgVTBWccpzhumsFjPTQZopk",
		@"DdBgMeFAIUYXeTkdV": @"QjEEnlFRXbvfjJWprprDLUOWhVTIidRSKoDiFHVbBeGcmVxYwPMgPmlHgubUAlFdFSJcsoBNTYJKxVagFEnzofNdoQzUaQgKnXpWVaODQanGTiySHilcSdpZrt",
		@"iBDSTrZWhNEwJiUGQpa": @"CcGAxKrtWdAbaczczpYqQUhwgCxVxhtZhemxpLRqqepvyAGIKpnKXUZvtvGpkCXCrOIZrCxbwowEEgIoWtbKaJgODdAfigNDymdDNoiUxBBLcAdcUPaWbwlDJXIgbmlIclu",
		@"iVrBwqEMqhOb": @"gUXviGPoUPaTrbnYxXbVfPLSDglgJmzgeViVahcpbrArYekasQsAIkSszqgKwCwllTzRIZBXOiIsgISkLqXrnyHXTVnBNnAthpAxV",
		@"vXhMgezbGtcO": @"puFEGsoUtsNPcXqKYoonwMJEwpTGNodkDPUiyIEGapqZsllUfCxROkYHKyvKsRaOipqqOOwhaLUReAcRgZRAMKnjccyHqQHHMfjjxuqdLkcEieKzHiiiDVSmXPsF",
		@"ssPRVFVPhhqw": @"ZnEaaYpByrgEjUymLOgzBErafbVpgGWDgrcbSqpSrASojaXpcNpxsuRMPOmHEoXUdLCccqZKjlscjNLckhZVBmNhroPXEfuyEfrjicszaIegvGxEeqLvAKYo",
		@"BZyyfomWqOvrDjXRogG": @"uQtgrRWwztZYYgyYDJEfZHbcIYelKFgnSPNZBDwokjFhqUmKAmiRGmobwlIhDCqEYmLjIrrKdZorOlxbiscEEnvkWLebDtPbkVmsFiqlhdenMlWmCcobzFhCMzMsFwMeDxwUyuCODZNuSZNjM",
		@"AIFUXYrdnGpIagOTM": @"PQGkozcIovdUKdChkmuYFblGXYuRWtRayafZyJgNuMnTNokajUsrRjAOuutxmybdimkNgBRowBPnTALTUsUFmfqzcPPOdByvbFNLYryt",
	};
	return IMYoKFRWFxCSE;
}

+ (nonnull NSDictionary *)XyyQSsstbzxTNTLkMlM :(nonnull NSDictionary *)eCIfyzUEDMQ :(nonnull NSData *)gboyBItPkYRJreODs {
	NSDictionary *BeFrgNcZTVd = @{
		@"bEdfARIlyGkHhizdSb": @"NdQSaIzgdIMKXsIbxZjPInviRXheijjysSfCpCeubWyBcNEPagxkEpqmPAYkCgfttgWNKXpZJKahJqVXDFnLskuoGctbyrFmOGCKVadOaSkIlbQaVixagCmlXwwWXtfSkYomxepNuAaU",
		@"hUGMmqnKCMcjBvRJ": @"ePAmsBdgjlwuAfeGAUNUGCOASuKCeEJwgosjNKVcsVzYsbxUoDLBMQoTeVenpCWGghqhzTBbeYNuMiRVLYLGwJzxpmZiZFEgIiZmsDfmitujRUcwyZ",
		@"EnLTALHGNknHlTiVvv": @"VueuhdVUqtqvSOnYfarTDwINIWsVaOjLiSvppwQbdDkGINNXdhACwvJlAfBqVgttUXSavoWkpUTzfgFtompHNtrMNpRaFZtzTjsbRrBSWbuPYYbpHsWmaGXSXgPz",
		@"QMEBbVVoqkLRApC": @"wSWTouJfqtyHqqSpNYHUecPkZcKMVTytkPxRPRbBnRKaCUUnhOAkthlcDTvqrQRKtDbzKccryDKOLPhHQXjqdicVxGgzFRIgjivLWLfJ",
		@"FEPEqeQrilSBBsLS": @"KiddUjNIfNJOeirfXtfgHjWjRsJIdMiZkTqvFzjNWoaCfTPOyGCvslQbIZbuqAIMajfOTmAfancUGTxYQDBwUJELDxduQVQUMijjyYmC",
		@"lwGupfyhKaDjRK": @"QeDRxIkkIOiGwcACOjEFhlzcZRQKNjcLBYoCqKRzPrWxKMGlKCMMiVByDVJmkFbfWfWcTMQYJEFmUsbwxeqVbQkvMcYprjxHhKfUoHZvAVjXjouTxi",
		@"bJDINezjSXe": @"XdBimxfMvbweSCnhxMsTUVfipdivMAmFLfdkypJXWBZOTBkFPakxhvaIWESERGjQvBJieOyyLJWKJGtocNOMxlUonphpDnkWnuglajmgJtNU",
		@"XvmzPtaEjWhBIo": @"ToETtxgBFyGXjIhNDOZQBjVaVvPmOKEdCRTanXMhMDcNvYDAsGLMUGMdCGtnQVmtruYYHfoUrBUhazqqljVHMaJpsuqCWFdmEyaKnSwR",
		@"cqcphBPlmkR": @"IsZNZtcgUCjBDMoxymOkDVyyHSIbErdIxLguIdUAmWYIuwqFIjaBofmBEqmVRCXIRboDErFWmwgwZXEVDVJXwEvvinYnWrElvEzTq",
		@"IFQzvYJvaupELXafUr": @"VcLoKXKSwEQdPIeLnUxLIPZCJsfJsJhJlITarvtztQwXQnGwASMkXpjGvzcnIUsqViDLsFwWAghOOypwbPaKEoiOCPxoxkOBJBelSWiMjBaCdoiiRqkeYnASvVwNaMIhQDGGtPvbrhwtF",
		@"nXdyhJgqmovwS": @"YkFdzeoGNxseEbnIaXUbojlIklYhezzkFuYYFOfqhTQnVNNvBcFfOGhyRlTagUrWPrPWHdwuOFsONcQNbXXJqNhPbngCXhKSREmNFHFQWqZq",
		@"fFhWJYRWlnAuCUj": @"ZGnNBzAIkmtlsSKQQZcJOnwHICdqZcCxtMPYDfeAkLtDLmYlvcEGcUMdfwwDvyKzkjIjjEDwYMrdoZizQPzUUtvQlJAAWFkQsLrVfmKVlCmUKTbbOcRNbrNzHKOqx",
		@"kghZupYEuoEN": @"YbvlBOFzUSCoNvwibHOrTsgyaGcGPoiSeQVsqEcdECecjaXeupnnBQSpAkpZSzjzOFDZGQpsMrVCKeRMBtEbaoXUQcaGPIwKmRwqogSbzLNkHSEQ",
		@"YPIQfWjzMZmQrM": @"pjaQjvYbWmXSWShYyOsqRGrDmfFyOylLmXYkDoWcSvGiwoqaYGssuAMzggyEkFKshHTlygDjmShCmHOqZeSjUbUXWZzPVINbeYzEDS",
		@"SnBdIRrJhh": @"fNniLqxuXSDHXgsAGsLniNnymUpEeNSePyAtjGMADUSDRcGFIZblyZJWoGXydFUKYkhhXwtrGbqTPMDeasGEJgRIoEOZWXwXmNzuJxbcySsjDJKhRURNxHkKVRSXwbYRTASApWbL",
		@"ZViPrEnSHWxzq": @"rGdSRRzkbRREXnMGTfTduesKlldNkHZjbckaCjCBaEqhwJnlWahEqGmtyPQozzDKOsloycqOdJoXWtgBLmXoCIwGRAtErQxbmaNWmXVYJpzrW",
		@"ukbYRAniyKiwsnRH": @"KEZOBFWKoSpVhlScrQsAryxcgrMFIzqkvSaMuCuqYwjCMbnzpLjEDZRcXlEMECzETeyuQQRMFfwhfhTnbvSmQykEqPZUjAjYJSLAWycjWehIuZP",
		@"NJzHydfHCVCxbHQX": @"qrobOUeDCqTarkBPWuxSBIKVLHQycbmMJNnzigyOdbfhCKXGLpdCldWBpWXIzcfpaluCmyKWERYwSxAMusEEZTzsSjEUFsvqBMeCvLccPehCrjVszmaaSkQbDBdnS",
	};
	return BeFrgNcZTVd;
}

- (nonnull UIImage *)EMoaEzOaDkXKqkgs :(nonnull NSDictionary *)bwUZVKFEmPUH {
	NSData *LHAMjGlJpFYGFha = [@"AkOKNsKVuRaAyzgATopAUtMSTrOAeEJkkiYnUeSBNKvKiPszpsgWMynlQVEEucgpwJXrLPVcsatoWHyLZaOjtAtTsMvjCmvuUlcWVfQLsMvWIkll" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ptSSJOFHfrZNXkY = [UIImage imageWithData:LHAMjGlJpFYGFha];
	ptSSJOFHfrZNXkY = [UIImage imageNamed:@"RtfMaidKaLDQiaiZzPFWSbAeinKZNwZpiBpDnXxCELSBbdOOHPyFiUWrEEJXJnFXorPKjuTDQuxaGWCSTxFuJCyXfkMnWTCqOYvWeDcNKAJNKuOfWyQlhKspeeryvesKFoeHxFmHlmlWaEfYt"];
	return ptSSJOFHfrZNXkY;
}

- (nonnull NSString *)EoPfOocZDYo :(nonnull UIImage *)fWlygutBsQjIdmYofh :(nonnull NSString *)DFKwCBQBxuwq :(nonnull NSArray *)mltFKuFxxjwcVNquh {
	NSString *bPPNyKRBbjVQ = @"grxgUffakRGcTcZNJNDcNKsNvHvFadznipVtDTqzSlGmEosJxOKhsZlqLEHqRzzLEexCINgQldwfBIBHlDZKtLCDaiKHAtHQJAlEqEvNUNzKTeKibEwFPDGdBSRWRVGoRjsjjVgAshadTXHnHMM";
	return bPPNyKRBbjVQ;
}

- (nonnull NSString *)nWMjEpGfjUYBKtBLJ :(nonnull NSData *)jTFffusAMXnLFW {
	NSString *iyyrFmnSdFgOIjvdZPY = @"dgdsdAEjmKklnndpLJxQKmAOpBzBRIPKLKxrmaejgdKLlTDYLRiROeJKpJsPqMBPCwNIzhrlTorrVVgCYBQRxbsGhuincXgKbUTO";
	return iyyrFmnSdFgOIjvdZPY;
}

+ (nonnull NSData *)mEuGxJsgkgEoZktwU :(nonnull UIImage *)rVCyMZBhrZealdyR :(nonnull NSDictionary *)ElDLQlRjlfnmaglhb :(nonnull NSDictionary *)LSYIcygFqgks {
	NSData *fkuKHwCWhWmuldA = [@"lPtSSgnbQPRoBWKRGhROkndSVXmXOrbQwWsVwKEaSdDMbZJimCPFTmyZExgFpTVkxZVyORojFTGEizUovHxvuSgxCMhFnkwxoRrFdWMlz" dataUsingEncoding:NSUTF8StringEncoding];
	return fkuKHwCWhWmuldA;
}

+ (nonnull UIImage *)SbNFvQLIkvMBuXrN :(nonnull UIImage *)CarDxtNhgJr :(nonnull NSString *)XBukECAgbW {
	NSData *qQPEHMAXFrmVXPxx = [@"lLbXgRWoHMTMmrSwiuBgAXEqUUJhtbyhdOfpVChrUrNtbTMbLHDDIXGFNxUviAKpMSFSibgCyRnHGJoXGVYAONtdVFnbpDmywiKeLWlhyveldzBWtezQZFFnjhpQtPzgFaXaULevVsdQoznfNnxhN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JhlREmUTERkwI = [UIImage imageWithData:qQPEHMAXFrmVXPxx];
	JhlREmUTERkwI = [UIImage imageNamed:@"xoSUxvlEXkIvBRDGTTouobugZpSNAmuGgmvECKrclaOaVchGZmIKjQuKiYQRUCeIKOUoFMNAbyVDRCSrrloyLRIcEKwxHKkMXtratXxbWKlctPbLlplznhEFPoEiqLlPOfdMBrkLR"];
	return JhlREmUTERkwI;
}

+ (nonnull NSString *)mQdOcrJHBTbXoWVteV :(nonnull UIImage *)BrfUhQJeDh {
	NSString *DILwvPhowfyfZX = @"xakFooGpGeszoVxBWJJOOzhmciFODmfOEcGRnxtCCvWDnZSQcbwUrGxuyaEvSCtahEsPhBOvihuobNHQGXocwCLZPkgNYFuuVpLcJjGGHkQYJVLTyHXuHpnyWOucPSVcElaRHYWbTzlM";
	return DILwvPhowfyfZX;
}

- (nonnull NSArray *)vItgWRjdYsY :(nonnull NSData *)iVKwUqAdlgunUfroaS :(nonnull NSData *)HtvzlCwcWiSdla {
	NSArray *vZfZsdPiINPozWOHS = @[
		@"NLSjWHdnszOBiKIKkxPpkhHCgZauqiYLaePKJzMvyCjYZeLEUJNkGbQiqzzlOuPSmNDzCYzakQjuyBOFcakQNIdfpWBMGbHjUhQhkURFwu",
		@"PEaEgDZmzeWApYatAJPRBESnsViwJCDeAGPHiVbjEqaePAPaaQiOAQMSvwLeTwWZJqnDINKgVOIqcJljHCozvLSwDQyIIJpOvEGsBvcuwKFLPOhmJXAtOQqbHMKp",
		@"aowkbeQMyCaciBRebAlrSPGmuISmYItohJXQvoJRKUngxXKryHySuvwDeFYzudLQFHGzLssJpjfdzurkRHpgoiVJSpwZSbeMTZRsmOuG",
		@"LlfKajOLREbanwIYZBZgCTNPTMTTjMkejmJCjGddcefqKiKRpJvvMRFNPaLXNVlvamZKHXdXroFZkvXgBgIpRFBwPrlcKZpCLIdcxDjigNyqqoAafQtVRVTNrdKJqLrastKxdhAg",
		@"MjLRlKlQgdoWBIxGrZkSsWWZXpNxRBRrjJCZlwupOiMjYbaFrEsydLszggMmwzAlJGUHKbdBQXxltZJlwPOIDeJxQCgszNkGpEsCUEdGCfRKUcMCQAZqKKLmMGqJsIClLUIgZ",
		@"FpbBynpEFYfLpkEIANVkDTchwvQXIWdMohxmXeReENxUWWDgxFtElWapAVBEnHBgQZRzMWhqvIvgzlpiccLYOfgMhsBdcKUPkSNXtTcQNopUvBsmDuQAvhy",
		@"ZrxzjETqwvgFKhItdzIZRinIxSdxyPUcmAcqKolHCpZMirwIybSvvvWDVooZGSrlItnOxjfdmDFaxPhCfIVUlngZSPZsiwpqPcZPzxMSLkkhBKMvFnSyVPrKSurpdbWKoQT",
		@"vrvxZSVKgCqGFlthVdHBJSCpNyzpLkPDZfTGMSmCJWNijxYLEIRvUzYQglktVvojFrXZpTxruTMGirRIOLpmYviEsiJyZldqRgHWpjSUGMLPawnuflsnAQPlvenOKZRsnlfwdagAlAvJ",
		@"ZLfpfTaQXaNMkRmbGmqwdsQPHAEgvZSWmWebCrZiIXPHaBtNZrxOdIcStKUztOgYsupRzRMdkarNwvEqMjfgtiyfajTKjSDakcIYP",
		@"zaGqAVPngbmbhJzqtMziJMmEyVTqmlqdFRzqkjjGCiObVMOtuMcARvRSSdcHhJIFeUbgifvpQMbsgLaDbOTUAocLMwPIXovfaLOdytyEddbGCaOou",
		@"WOoTUXDvWpPsFvYpoGzmvOvULDmqQzUpISsQvzSSADOehYgEnkIiFACehCQOaKTznwxTIUpXxMChqbRUchHFDrfVecgihMGDwSNVLdAkWqiKGnKlOenfNmUMqyIjMZbXH",
		@"owsvtXgywzcvwOVMIUsbhluWiyxCANQIbbPHlcZbpptaDAlcfpyoHCUCDwoBWxsrwiPXqWAZlYZvwrCkRPZwoXxxsAgjpVmGjiEEGKuIyJNJkQCfjRDgSZRn",
		@"tCThXlljVFgTTOBMmYbaXvGKSizBrZBsiTHwjoGqcTNlDyAIKXtRJumVFJcIudnkpjphcZQrUGLzjcXiDrTgawqOUHPgewrkYFrEjJzAedYKPBakmMurOZkZIveNWJUJdgXwQotxsexkhcOtU",
		@"RMkGdUhvAQQuwjlsNGjTwXKhQyUCnzYtGLgBnMpBqGvLGXYkiWrnFMuKwyJQEOcYRwXERKcQpBFWNWjkbSjGWpdeJeaYdUVeSuEmGiltnPSBCBggZVKLBbUPUDMLFRmwNPpsaRohyuEYPXveD",
		@"BipYHqNPjUKiRMltkKmpPbgSoaYEctyEDJqlGdEDSdTZrwYqoSVgAAbQfZckBeEtudtFjrPPJIBTsWXmMbOFGlixmBeBHWPNyYgvXZcwCNGMfAMOpYoIMTT",
		@"emfHgmsMXVqquaNmbcyqXXlSUXzeQyFEXubZcQJMiLowjwMTlwvYGlPWBRroNEeoOZPAlqoftwLWgGUzesUIIiYvBghuHkNyknPmUymwFs",
		@"wuccfuHTQDsyumSewJbJRJXiAfVIclrhuidZTDKJeycsKKAOWexEVjtMiNhkhkqlrjHSkFRKokyvfEgtnqGQSPhDvkhcVDacjxYDlBusjFFbXMHeYjxVRN",
		@"JeBqtGWQMSqJrvTHigiYlFKgGjqShoHjQlsAqSjnGmjmnKGNHMxzBKlodJdmnfkVvvjzODgygBcdmDDNXPgZJrXWVqgnMTjjIhUgzKAHQMTdhvrLimfLwRmNlN",
		@"uuvMYWVPlYWeHgxFvfIAMaxzQjdXYhIxshsgEHWKLJsvrsDDXUHLawDyHieUKndUaEVlpMPFVvSezbDfswNaeqVKmQDaAOoqkcIPBLZZmAOYRvAZGtnTlhu",
	];
	return vZfZsdPiINPozWOHS;
}

- (nonnull NSDictionary *)WabCnvFVrogxUqpwB :(nonnull UIImage *)WcOifGzrcpbHZsDdFc :(nonnull NSData *)lzLjItWPfavXOJtpDC {
	NSDictionary *GkhMCVUKhriiGFqCG = @{
		@"VUGAiFtNGwYLgOqwhP": @"PaIFGMRmMWjzdiDcICPHxueCWIQDTBnZvvwdxgQjmEkhLrwivvnWNHbVxxaxjglwjWYlJeHcSKxVwukdgVogCzSMSAmFZJXLEWreJWiSVFtKoYVVszFbsOwCohfyINfdSOOks",
		@"sxCLPSgAOXt": @"nBzNGiRZhFQvIQjosSuIGLIFamBFRmwADcmibaGbBLDFwIVvOUDkpefULqRxvQVrVHVvfdmUiIHxXyoXIURYGOseBIWpwvTDNZCTsutxbcjibBaWRGxvwhxNZ",
		@"FQgyKRqZKIIpUg": @"hTtTQioTUooFNcTKeRHUGuslxpcszpqlkYTxSUlakvnvEwoboZCIYHbHffAVysRmHGmvGRDQgjrzpproCUamBoCviqAeUxNXlSwGUv",
		@"BueNmYiSmNKevfleMO": @"sNIJjVXyiWwdzGkRroSZdvLrxlUAFUnOoTLsbOpsorlOGnEBPCqcLFkioEWLLwqxXdvGJCpAMFDqcLvclIkCvhYwUEoywMDAWRLKBfVNhJFKsknzjeTCNvRnVzhiiEwksv",
		@"OmGUicrNLMzHGDOLGhh": @"rkZHZGbSqfgsuUmabwwMAakbjhBTeFnOEArhVJZOOdamQRuRdJCADvvEGLpFmkZFZAarvVfVErmxxdCJykHaQrWXJqmqtUjXaDxNYoLHpbxlhmoVYXbXLqC",
		@"HJAxDstHEo": @"cTzMsdEieQZoTengIHBPSQJekDbZKgIbgpwgSHWvSJzNXCMMPTDWMfquCoAPRiHUrmXVYsmDksKzATXBKadVSQtDKvmRmCeNXYHoIVCQ",
		@"RRBwjzRkmhzrIFYGA": @"WBdcuVkWUSqkcGiKSOQJUpTPTKcMaTDWNMJOSORNFLUJwyTsFVmMGVCDqNONUAQsYMwDhlzoBLUTDYswZmVfxeEvmXEGgkktbymkqzzlWVPqwMXyeumnz",
		@"vcHIuIulcQiP": @"HlNeqPdQTGHAiOGCAGqdMVDjCDERJIXmFMOOyyuRFoEnJpLCtCIikZeyroemELpKHlRsJSaLMRdIydJDDiHQSZipZaGbnOYrUEybyMGxIs",
		@"ojakIiPZtInSLXMvTVS": @"ewPnzJYlfHSyQXVnnIkeFDDVmIynxfOMEzdRsfmGoFcHvokEnMIrjdFslGRcRgauSNfEHXdnzPGCOeSLQEaYjOFSJWSYQrQiTaDStyrbQNkpUVbTfNPayYqXmwLjVUayvPBqmhDbEZwENZPshsU",
		@"zPWEHVARTlTGJT": @"BRbuHqoGDbpveRRFgtYcXWCkJSjxPbQFBzVnpjmUvrsGqCyPVmKMowTncFbWsfCiEkvphLLlsKjqVgcXCyJYokekyZYBGHZJDAqUBzFxtaaPrsItlABFgCjwNaizsKCxoxrKV",
		@"TLHLHkiAkTyHHXz": @"zuRPZPFdiPunspBztIRQiHdbKQYZxoocGpdrqdQQlMWLbMFsrqgYqchkpnvZUcXWrCgPmboUBrKMJDdOTwkPyUGYAbPqzfqUJskVNGXqaYu",
	};
	return GkhMCVUKhriiGFqCG;
}

+ (nonnull NSDictionary *)jTcMIaHOuoupXcdgCs :(nonnull NSData *)mEkBVjoZHS {
	NSDictionary *IiBBFzrZFIc = @{
		@"XpAcpkWEAViOuKnVe": @"IwNtZkIVujubBzZlhcRGSiVHoeIwCQgcwHCNNhpotVQSMuStmAqodIfbImZqBlMhEYxxwlNqSDmDJMGoNlWuKzbYvVUprjLZALnMagbRsWEQIkDWkOLaoNOSYFAG",
		@"UCOsXMBdEDdpLe": @"OEzvamKXXvysUDmQFrkHVuzJSLZOEVdhqXfiSxbYLNlZhAkckcVYLSEbUmPjjEOigiKAoHrHGBqktgHqNCQxfQwIdfWXpmNsDMEAfSyaIBUpkwkXXLduaqsrfdSNPPHIIDIONDheZFETFWudUF",
		@"GedJqMpwlNmoluNO": @"QPdBqhBuUYNutLKRcYucISgiHBhZUIKJkZOzaTMRlOGESlofjQtddHSJOsWawIABDEoItKkGRQJnNLtcQCEYKTJpLMRSkzgqdIsdtKlSKnQTLYeZpVJZSknUyesU",
		@"BRsmRVRdIME": @"ZKOLBAQjrsEwhCyFdIZqGBrOspPQgUlzUzFaQFqCYcyQpujrvAMCCsFcDjjWeENYjAswXEsTVGYrGzIpRdyMDyeLDeBkgnfFGxnnbjmSXGHZcvjcAosREXCezGFYUSitP",
		@"xKRsSWqduxdOG": @"mNMuyocHdroomKECzPVSyEsHFDQlwDJojYrfkmeIjvHFUTrjaHjOFEDirbaojuyEKjVjcGHLQEvjSBFFWeifxThgmDYssBEoBKWBcLrpfbRsrQQmeKI",
		@"PAQHcfkbMbsnMrmH": @"ulmavMLfoBClryGqpgtlxjfWqOPMxHkQUdCztSMVwYeQyttuczofKJXBalTLELxwEKgrLCZkKUZDRAursnaGPVBKHYlKPguwOLKfXalJ",
		@"oMBXTvcKNSnkcdwSDWP": @"cTIiWarkXKxflxrCTjOMFaZZPzheRpmGsefTHRkjHtCAmedHxtYMBzWJEhgqRaGFTrJNbxdsPzpfdTsBlHJGLoHtglLJzkWtQnmdOqntEjDiExDcbVTTKXJvIICMUbzUfKhggZhCivRiBHSukg",
		@"MhmQlOHCyNGSDgSLwcW": @"SLCoSqYjBSfcqMiqIUnxnPLoXwJOGtpPrRZSwKFaajNUpzNMJSVPiICSSofxPuQOSGCZBcQZWfugsKFEBMPBCVbGXUjCVBXtsYMxwKqdEPrJuJpMdabrIJkSTDiyEYQxMQBHJptHqUGtBxhPBcYoP",
		@"YlXMCdGxvViAgSWZsoZ": @"wKdddzfViHNIqNEGtsmdnDqeyApfzPTwROXAdeirGeIwZbsylwgeDdRnlpZqcJlWcAdlkBPOkvrqbsEAQDPaerHKIfVKHHDRzCWkOYviuqxUoTIXzibJSOFoxOrEEfvaQHM",
		@"jztKrVuMtNLSgfCDuoN": @"BfaaHfhwcEAVtnbGedXehXTPFLPBjuvPzfxhzKwLGLmTUYUQpoVzjdqKvNnwzXywWrzHumGTUYNLYkTTKGImGHznCgSnoJExMTisplGRhjwgmJjQqfOsOsqzqkk",
		@"kFYrzUQzflGZMOiECRS": @"gqzZpPtsjzxNMCSnudGpmHckvQcoBASCgIWoDXZXITvCyIgQqkTBVYgYkCmkOrldwtwMwDCvGwBxHnYhwPIjoVfbpzrPNfmYIxYJEGogBsIZwMMXywVGpcHEGVZLlaWdP",
		@"JdXGqnMYdmwyeoG": @"QdqXZJyvJMQEDidOftLhcHrLWnDrSXKcBVtaGhQkxELboDmwtwfkmdGsEiOLVBCKqMIcAUyqTumoqZjvCBchXycjUAFtRtsAkGgqAYHSSqwNNumFgjNeQPu",
		@"LRGxfFAenPGx": @"DWCGfDbHJFWTVGQnMajGcmvyBZKSjJYJixadbXZXxVsqyHeWyXcpAZnCMtVKVxiMlBnhWNyBoPxWIreLVmRHhieJJeshsqXptUNFMKkgAxlbfaQhsrHGgSoCMDjOhQtxsFbQezp",
		@"lTASblJvhhXW": @"IjthJFOEfDYKUeSFhMmpEbfnvlDjgmZcTzJGfksebXmlqSrPCrRnnhIrEYYCYjCqGBcxqXCeCLPDQkppxPqwAIluHRbZgVMIsMsQVCHC",
		@"vtCThErZDyVm": @"LUZakMjeFxvYHUpisoNzGBreCknAPnoxnGICKGzWdDSUkNmWbRnvNvdUjQLcjlPnCkASyxeNnGjikymqrVYObMKszYOusrWZJVQzUkUYbJTMbFPnIjoOtXukwrQcuISibhts",
		@"zQZQoHVbvEdVJBJN": @"wqDXLpsajSrJIiLbJKpMvDyZiLqJAEhvbiElKpCzjdUNSuGubFiEEiNftCAqNFOvUOkPNCNhnOAtQywgqpYFhRaVdcjEMeHUFbejEgSiVDsYbCPWmvKmz",
	};
	return IiBBFzrZFIc;
}

- (nonnull NSData *)WmwgDeTiiUJcTSezX :(nonnull NSData *)qopVPMoHhNOJWxKauh :(nonnull UIImage *)nDBdGNeNWFkxm {
	NSData *ORhVICrgHr = [@"XsMRmaVbwLXwgKsQcECsApvDhkJfdetSNaKPBChaInzDQGSJnMfsWLqkUpaqLggVURwlAqxnIbleXFEzKYfolWOAxiESGXCCyXwpWtzPSaYOaHEFMytAWKMeqBobKjhcmfpKQTVFyznRDV" dataUsingEncoding:NSUTF8StringEncoding];
	return ORhVICrgHr;
}

- (nonnull NSDictionary *)gGCEiyRxtVYA :(nonnull NSArray *)HAUVjXDTWtUlqtKPQ {
	NSDictionary *esUzkHSdVTFRXqQ = @{
		@"tBivISDLYq": @"yMDiCMyAUVMqoqKutYibSbSZKQZMAWHzRGLQbcMfhmCtNHNYoBRpZvffNMzPHTrxrtKpJUlGIfBEkORdNsyaxQXPpFDfLOyOfmVhiOqqjxSjCaxsfBDMCgMnL",
		@"KZxDVdDWpXSv": @"DuijXtqRVjZTnWNspkZsiXIvNiERTEqmjNDJVwrdMHJyMBPSJXjYlbhGJZwmyHFCNkeMJbqkFQRJcwJXYENiiZVowUfvVWJoOAPRPkwjTiliywtsb",
		@"JiwVSekmuwF": @"aKEWvryjvbbMepjSnyXqbAwnTOUQjhTLciwPcABWABYDHsXjwkfyiLHfkvYRafzFYLOsXcJUgPrdaYQrvFhVDKAqjKTJnrFNuAnBiafuBnnWhSabpRGPlWzJZCBKPjzUvhTQMiKrJcTwuxjaiatMH",
		@"VpazLtywyUDnPMGw": @"sxOAtLQbRaddOAyhSvxutEFpiMMdJjxVeqeNUsCOULGQTkWNOrLWKxuCkBaynxnnfOWVcggvaAgOeAFrugDRQSGwhEdMoRFIFlwRfQP",
		@"YGhxDSsudyVNah": @"xdBWgILIxQYuewEVrdKPpltqRiOIrZTmJJLUXHCveGyvyXHmBBVANymtyhlpsUTaCUArWofOxiVzvBEkDtukjQmGeDwlqHNSXHKyJOJUrslpySbcmGzWmikvAtCocctMkFtTibGrHvUpYt",
		@"hFQJlEXbjcre": @"syjbtfJwoTUCVjiQfqLGyFzkeTtXEnZUMsWQcLVLcVywkTruPpPmUsuatRjaSPHgQpCsAuvExQRjTjnDxoVzJcQFlPxFulodwzPfZBdDhRcvvcLEMUYIlWexzuzSYYuzCvwQdwXRinvdgcJuIhLMp",
		@"JteWkOsSfJVlYJfXbVN": @"kuKGjhvfwlABQgaPgTwLIkpxXxEwclTaTkpaZyQHNIQKVQqFfYPwTcsDfCIVTavKIGFDnwICbOBGIkkbyaynmuwJTzfRleFqyiYG",
		@"yLJYazeySWOUgGyxvx": @"KCSBipBEzcZiatCUkhBQToOMDrqfsVDTTwSRgaBZqPjQpxfZNYVTOeVKSsqRBAfIfroRkwUAglhMLVAdwkQDrxSJbRLacSdSVRKtzCql",
		@"PhsOdObNQORtwNHgop": @"FJtwndFQxjlyRVuiwdfBZhtuehIwLZFFCpMjcfZrbDmAXTIVuyUgFICJLrBlpmyJlFDSrPmFvAfravNhNhFNyjeqpoolqJJXwKwDatvpzFKpgPtPDwtKPpinXNThXlmGoiDbPewdvMxOyDQfMqt",
		@"GmDXNOvAdD": @"ATbLtOBQuywqGxrurqmHpyGbbQcTvvtUizjoZvNBHKbRpkCUGbBcJCIdrvCuLHzmgjwmmSUqXtuwegQJPHywZLjceANJtNfGcfyzaNDxvBlHxprxVyzfISFXPFbJqiTWoRM",
	};
	return esUzkHSdVTFRXqQ;
}

+ (nonnull NSDictionary *)JoQuHrULcaRAUnHdzq :(nonnull NSDictionary *)YZkKDPLBVor :(nonnull NSString *)EyZgPoqVkwiN :(nonnull NSArray *)QlgXgsxwjo {
	NSDictionary *HpVuGAmnhlJ = @{
		@"VlMbtxtLCDhRpfRGtA": @"kTEBgFvVntIWlLjXSoZajFUfotHBKPoiJEvbdHxFuqwxzndjYFHQehEyxVabokMyhumsTMkTyZmYhgKMGNXkOKFPTGnPzLBjIMyEbwUrfsamudXHbdVvNYyJGQhdVoXQF",
		@"VYcuLjocEAStsvjfxY": @"CcIqeTThvaiPdPTXGalQkqCCVhtbmeIiOuawRxtdmcbjcIrxOuxVgJPtlguJASgRXAWYPDyhJaJiDACznQiUtFSMVVAGpGNKGioVDjaTrDDIIpDV",
		@"FAGZVUTUBxgguqa": @"nlORxcRlQZpWGRkIFNYiaxfxjqpxgyUjyrzHBVDUTMgUFeMpQrdwIQuNQZSUmlrsFTTsJUGaXnuXAYYlsNdtzvVXocQubmaPSCZnafvWnKMjogNFxCFDYHyxFsnyVmBnODwAHgW",
		@"rwhtMaNKjrs": @"raNBQcJrQgjExmXQJtoYnjDWEQAYamyHWyDMZtYpFALZYKgWQDYEMPEQXhzTUFYHuvLzhHtJdCLPBKfWMVDspsHIrSwmgoqeEGvvawQivRDulkzQTkuzbokURulwHQTtAX",
		@"EbQxWlFsDKW": @"FMPJGpDHtIaxzSSbkwnGROmHlCDAWziZbFmvwnpfPPFHbasnaCumEKCgxilrIcPdVmFlXDojNaZImXEIsxmPtteRvashqwfJCnxFpTpkPkXoRVrMznTyPNLrpCESgiSlBIMRwrdpeEALBpI",
		@"LHzuhnsigcOpWhMhJ": @"QOmDoYLKzJzuAhbtJgEiwlUSDYOZdSntPzokNlUaEFrZntvWHNnFvLOHztricImTfjrRIhTUHbKrMGtKyPoKcOADdYgoputxIvXrkdqoQYqoqagsSfHkeolpAweCXmUe",
		@"sibYDNVymmevnhfkjV": @"dfgFLbadjDCgdIFYdByflXiwVRxPOtryMfWTkQURYHWqWOHYvaMZXlWVDwmfiFfjPciqjGOLxwgvKeiuotwEBGHumWQPebFvXvifszdNawaHmSSrzWquPES",
		@"AIZcmwmnRFCuhDq": @"dPusChwPGjdUwZdyDsbqVxhxATVOVbnmXxTwlbgjcIulpbkomQfqpOmNwHATNFgoWjBRwPVyimQFoUVAmuvJubvXrjDjUAPaLQEhlcKAQLxeoUBnOxpkfLCLhtkUqLySSwnScK",
		@"yibKXWltrkNvWUlnCev": @"eoCrhrzrbFHPOFlpiqZvIxHiTEVmBYHSQDouxYNbyBCsirVefPBjTlXMnOQFQdlswxQMlfarTfTuWCGjMjfDUIkMCmUyTFljEFPChvMnmjxMcynskXugaYbHbFPykIiZrwnWgsbvLrzeV",
		@"InBvyrGMBfcJEiuAY": @"hbFEuzqYytOYCLacUlqMPbKvflhKDjntVapaMqYZQJnEVQTMCEqiIumIjvFufmwvVSAtbzbwNFhEWwmKMchGAGSWkqgruGkdfQClrrdY",
		@"YIJAuyKgzvtbRUSuIuN": @"YuNValcZUNJYRClHcVJfMbegNQCbtsWKBKpIKYGHNZmseuFZVVePTSZzPzZcfkhpSwOfTgxlkejMWyRQsqpJvKrWBHnWoFjJUTJhKDyRndBrhMvBpo",
		@"stVlgOQTsyzOSZUeMLn": @"aWuxwdpnsPtldDsBKWhmLXulYUIhWYbPEeqqFPyFZbSSqFotpMqgBlUhjSWrkEdmLALRKIPqpIKsXeDcwWTSWmWUkoaTJBmlBjigbnFnHeCyJrqbXHizzsswOzmDLnxNV",
	};
	return HpVuGAmnhlJ;
}

+ (nonnull NSArray *)fvWuBoyurlGcszjICw :(nonnull UIImage *)kshcoDBdggumUxnGj :(nonnull NSString *)FNQLeBbgGONOjh :(nonnull NSArray *)GCTYtJRgnKX {
	NSArray *BtaXRdOERWt = @[
		@"iEiZZzREonuKYZbIMSOGZWctxpjWhAmTQpzhEoIKmDWnlZHbFNDvrpREbCEfTCFYxfnQQotJRnIvyRLvvXGHbYJFKwWwYfdMxlYdrFLNsCCoGQzQcARaZbRppGmiHAHpHAhBnCVNwpRyOcJcsA",
		@"jQALhUOPTgXLwOUMITkpKZyxdaBYdumqLaqTieenjjBcHSyEFsatxcxbpRizoWhNwobTtyyWMxbZeSZLwlyoOYVrGyAUVLERKAsHqMALRdUpAvjuIlPqLfbAqbAdRuCMOvjFiDrRZMNGPeKyhcgVM",
		@"XhFclGLToEfcJhrnYPyzTqfVoVDUpVTtOkhsXUAANoyFxJIojWEjxsdzmeFLJItlIwUUbwCoWMyDqeXfqoNzNHYTIOeBUWHsjeNDDJAlfyPPiIEQnnaIRxKdnGnumtYjvpeyqbVGeidZtwR",
		@"konZSooTXmOPZpevImetdsfOiLJHOdYvEOXHFCGqrByybfPLvfOvTfQuHtmAPkxMYipCJGSqFNxQDzobJcwhhyNoxSQcyWeRTCxeCLvqznbXfjeTJMuCHsaD",
		@"gdrvseZkfkHxYLjngneRCHMlfyfKBoFKljbDuhgcoYWYpkFqmemzVAjKeXQnXMaWoWiAolAbSmEAFWMXhowcUHdyhZrsuEhUkxEEypYYHevlMjFmzhMZeXel",
		@"tiLQbfSjHKQAXhFAJNjoaYAteGpAlvHQyaojLtHgobKoBJjLpFdiNwLZSsgRlsXkfqzGoSGtxHxnIjQmGdZumqXVyIhBvccODjiCstRnSonfmRCbUObZbqKQFEDlIbfshIVVwzLlDPeZNAaWfJ",
		@"EGdmcNTJDwlJrVAZUaLIbHCUXedPbGvcBqSDaAXiUElUOyYaHARXlRfIsxnZqHqiIttvYBUVUjRRghtnLomANBSBmwdwKbMeYNevOKVdrwHOwFVFukEXjYcNvWICdW",
		@"fBoWdVStpLYeQVhkKuBDDwCvWrFRNiyjHxIUFYwiOQrHvCzAfdQEXMttTCpGWqhfMVbnAtEFfiyJXBoaIBapcGuSjJogyvlgdgJBAMpklbARqzjusIeYoWP",
		@"AiuFKStNjJqDkOhsATdKuyjnkjUkSlnXnGJierLlJDTGZHpnDGwZqZkUvfBAvHZAtMfvesgpMpfjDyeURHkhYVqSHmMsdRMaZRdeyNlUojPFVAekIBkcnYaMhAvJxRGvHXHInCCA",
		@"cabnzaUTvYeDkmECbIbbZdCCCvzwphLqZwrXOZwkmHcdUnHmHiHpplxbHqxRxWehMPsEXVMCJygaQbkgoAjWnlKQYMaCfcvDBowlggGRuUvKTfinKJxtOjJQdwwzYNCrMXsrFFkHlVsftibjfOu",
		@"bzvipmBeXdUHswvGZeLVEuhQXEFdoOXcYtPoiuBGoSsxvKcHiUoCqgWXDxJKoGqANqROIhgmAKISblzCuBNpzBEAbxrPdUzbNvkpTIIGcG",
		@"WDsUyPRiEyKyqKrymkcsDJPOLYWWCNhBRbkOXkdRIaoiYTqZjvccuCTjLTmnYHDbyickqfBRpDAKmVZcuUAWZhUPbTvtgmPBgAeLIVGk",
		@"SFTgtMHCaUKVYyWVYPITqSoXECdElhxOvFdUlYAOkouTGYlMyfyXkhPtscMtcrZmmPKKbaErdqiYeeUSVLOAneZRemmRtbIToUhPwxiwNXsxEJmUIKElPizKFUlzhiSZxZEOVZjKHQWXwLvRpRMb",
		@"AbnMlFpHycgwXmVpsHSBjPmPgyjHWlobNbdRTAFIPJHkpYkwbuOkMMKQKgnbGLsXdnfIqTNeFPLaSEIIciZOtquBqBQXBcWemTFEdpjpEqATgWECAtpbFWYdyQMaJtLX",
		@"KIRFGqiqoVuOYbPezdEgvmvooSeBOpOoBlRXthKPrGtBDAXEbcpypkmCSEyVeogaxDIpnoqOiTvcsaHWJScKKWLIOOEskSydcmQRrX",
		@"BfXAAyXSMaDLCvZggeOHvhzQoEBshJbZqJsJuxOptcPveYJssRYbrqgUBKBfTMZjojtgLjZTfMNxtyyZnvQLDxVEmwMSpnZFFGqmPRBHCuKfCZZSBROqEHFCthLiOWqMRAAXJ",
		@"PHwURbBHtIDXhttPJQKBAhGtpDqTKhtwWQzcuxRpZkGmGpadhZtTHPspPGYuoMxYfXmSvIVzRzkTDtgDhHtssjrPSCRtmLIyCKKNuomIW",
	];
	return BtaXRdOERWt;
}

- (nonnull NSString *)TgIsftOnyJYpvC :(nonnull NSString *)KTHnVjFmRVyMINls {
	NSString *IyZjYkzzbKPhgRgOlyI = @"bZcazWZOFazynfXXZMNxRudZoHSqiiVnSKXhcQHTtVwJnDRcHaNNkGGSgfbBiwgsKViiNZmsSBSEvrjmpKaGLhgtDJtBKMaDDIJFAuSdaHhMUMflOSHxPWYXxugtGGtblAkwOYvMwZSnjZoZ";
	return IyZjYkzzbKPhgRgOlyI;
}

- (nonnull UIImage *)CfjPPOnAACibuf :(nonnull NSDictionary *)QZWeAidgfHdWLrRPbf :(nonnull UIImage *)hdvnPUOLkHALiCcO {
	NSData *kHJpOtobBArNtMAKw = [@"FHSCyooVFLHPGUowgBAnBMwciMaciPlDWnhpeELpGOclZiewlnrHOhNPTMEFqQnXypRUtEzqmaLYcHXVlOkEJjTpgvxeKyDkZBzjpnKr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CuckTGZjKOOGIztei = [UIImage imageWithData:kHJpOtobBArNtMAKw];
	CuckTGZjKOOGIztei = [UIImage imageNamed:@"PpfhgSGnLkqCUsxOVWttbhoOapuBBPJnSLIopycXvwOhGmeLpPHnPuYmbdaUPNWhtzgvHiDFjjHrjcwZJrQJlntwlbDWovkwROiNWoslMRzXPFXOoJnxXj"];
	return CuckTGZjKOOGIztei;
}

- (nonnull UIImage *)QWCKXKubRffrib :(nonnull NSArray *)XERQICgVJyGmnAsR :(nonnull NSString *)egQzpXxobaKYrjm :(nonnull NSArray *)mLTucuiQzDh {
	NSData *lXpQlxhLQCtFLx = [@"rrkrDkEwFljXSHJwdZXadpPGRGKZOPDqxzggcujpMlafyzXpWxTfwmwMqVIsTfNFzaDWeFYSzVBuRbrSSFNtUOOjxvUrJrGZkxtPkygGfvKaXzAINIFwvworVLugEQjFnrDalbgxBrTsKB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FfXbenMQqydnFbNLR = [UIImage imageWithData:lXpQlxhLQCtFLx];
	FfXbenMQqydnFbNLR = [UIImage imageNamed:@"ifCAEVJejQYyHaBBIBqepcNSLlsXQOTOoZqAKvbVBOJEDOHOMHuYRPNylExnpYaTuWZNYKNwxNypKrTgaMhkeEYLZAhvGBmLCHCXebotlRuoXO"];
	return FfXbenMQqydnFbNLR;
}

+ (nonnull NSString *)aXAIgCZZmeEMMMDv :(nonnull NSString *)VlodZxypnZ :(nonnull UIImage *)MejcyQMGoiNal :(nonnull UIImage *)nUeVruhelnVsGmk {
	NSString *bvynGCJFEglXeh = @"hsaniJeuBSUDSvSYAnpcgPpTncFBEboZrkGxlfHvVySBLdTGuFrpdWsIiCqOTpkrMqsgLyHFlurzXfPlDjUoDklNrYreVDDShxAMGUkiXovgsqDoAVsxlZXSgMgjSiBvhcuho";
	return bvynGCJFEglXeh;
}

+ (nonnull NSDictionary *)NqTpIZwlAzIAFTrH :(nonnull UIImage *)OeFoeiMrnhbLNwyHgFP {
	NSDictionary *hpDsYKZZMPHfYFefNK = @{
		@"ojGphylGlxCCAuogq": @"gqPixRFWUrihiOPJpfmLDrnDZiRHmlMUwuVxUjgBNxBAasCRYbYZjwyXRglJvSxsirRPoqDRMRycptOAoWMLTxRAHSXepQlOGYmkwL",
		@"KkFAAfpSBDAOXnqU": @"nbdEnASqPqDigZaAwzqRxjqXZWiMtzDzOfTIfmvRTVxDfrcyoqNleskqEwCiKiubmukcIZsSVZvpDEpNlOKqukZcISWUJmZDmQyLCMTpFeiFCtOtCIagcwoijdNhWhkFrEHCgPEr",
		@"VyxxyEZzNldiGOwa": @"VdDrTdKDdovlFfjsccQJVqKrBJDDpNrvWWnXODZGjPJRGTslmsoszcPafttBabPKgRXhDEgYuDdBNPlolteLAdnNqJwYtPqVSIrNpdmNZeQdXyadujufRplmKlqGADTZwrejXycobKhOvHSmLzPRm",
		@"sLhEkCjnXjQ": @"OhKCjutGfnHCLOAokPDHRtykscRKmdLhTYaKyZArkDmFfZFTrDTRWPwyhuhMPbjKLIiilHkJgAzpkrOwzefPGDKIdPDJteUBDFiSnbHMBJgCyTHqGySwpXvSODvALQceQjHtYVAUYdAyOKt",
		@"dbAHUoUUBkk": @"QBnGeCfDTseYhSTSoLADcmXxkbkiWCpiaQoQFjiNnVdmNfunzgnySsecEBwqpTApFVYqiwRnIUTWcrvnivhCjiCrXkZMdFtPUEMybVFENYwJA",
		@"VbtrEVNBJKQjpKItZL": @"HLCxwtHWXjtIfecVAItSyNLYdmcbNqhHxydjXrKsfJCOBXymBHgFkrWvkUOsErWqjaNTZZgamtsEjqbLqSmcYSpHOHezIKYJDmigwHUxjKkFTLnHeRnxDLBZjlvMTTWdQmDXdGYqW",
		@"LeyQEFqoeJgGa": @"YYTVEvAWGzjkgtoJswJEoiCGpOXalPLHkcxeTpVJdhNiJbjyyerPLixHyIKKXRYLmVCbdGugqVYVyiUrrkNxsLFxHoPUiidEmEKtsb",
		@"dFCNnlNkbyFpXfb": @"ztfJWMyVnXxeEqZmkbDOCYMdxgVzJPFBvYjObLHrtaSZDXtlvyLguvNYxBvQdKuwLqFIyhEQSlMhTFTAKMukSWMQDayyUrUHrECmFsgGUh",
		@"rfwFjShJiKUpH": @"EYTQlVKyYepEhVeioAeeERbWLdBZsJkZoMVVCKzFobRCyIGprFoAeWBUOoDUkCYHQZUWKsGUbIjhCQGaueEGJdneEnvhYkSvqGjLpCVfffwnaqxNkh",
		@"BxiQtUWiIYPCmcvr": @"tuzojygVWNEufSjvkdrfMFSoRnLwZluEdnblwdENEFoXKAnXoyCmYhLtcTBnoBWGMhqkWUuTayHEckEbQqITwDLCfkCAAqUwowfpopNAVkUCCnQazsEHrfFt",
		@"SzqGWphGYsgN": @"abwZsMPevfJxLHavvJWKjPacXZIGwbzyWDYwfYIgwDPrQruDNFnfBeKgwbNGktTnkmKqtPkvBSTPhMagTsYaoQNuhojIemxgHtoRzAuUQtBIxPvYcNEdPLMVbuWUEJXBKY",
		@"NbvcxvigYqYHqwuTg": @"fljXtgxNmWoGtzgimbvPNvbcaoOjuNNRURiHeNZngaHjEMqjsREAmkQJwjKwlRrLBQVmeVFgoRSZNXEnJXKmqmzNJyAWdNKClijpjhtGOTlhZdVmmsIdl",
		@"pocflcydLtDsMADz": @"TmLNFlEqJSFWrSwcNlxJiUvHYoteeNRgocSwJNDiMeRxDBvAJRNztzMEvcqaiJtHeYJeaLJHbHBFpyHkXDaUUIjHUooEIavmGOxvIwNQdpuEHRKmWEcDKTHotkUvFzHnQmDEmQgsOuI",
		@"DrPlUgAQSirbwZsiC": @"kpQoCcZeahBGrRktTQXoPDqHhjxNAPGvxbVGwnaiRhhCfwspvPYcwEsVWaDaiuOBKZnCMjXHBVYBZdwbUZBSqypKOYSpbsuQgfGuviSLWDcDYVWjhXVwAsDfrpNBtZ",
	};
	return hpDsYKZZMPHfYFefNK;
}

- (nonnull NSData *)SYiZUVaCWNW :(nonnull NSArray *)futBtWGuemOxXgD :(nonnull NSArray *)EfJFYIEernxhJHFf :(nonnull UIImage *)niUhfRloGkStNQ {
	NSData *vJKaCofwUxFlUf = [@"xAUFVzOMBSDRuzJUNpSxGuthqejLOPamgaGoXcFLGnXQjlgxsBfFEUUffRlylNQEIuXWUwQtyRHIuNbyjfeysElIfsIYlSvYFfcEbTgAnrFVbFvysdV" dataUsingEncoding:NSUTF8StringEncoding];
	return vJKaCofwUxFlUf;
}

- (nonnull NSData *)cJXbmETGfLFt :(nonnull NSData *)brcMUeiYwBiIkik {
	NSData *WZPiiHjVDBO = [@"jPfwLbcyTBrlSjGvBwHVCCNYkuIIEXsWRGeWfVLjWRMeiyJsloajnnrcuiSEPGEctNOZGvVUfZKAqdwUUfWpUplmIgVCIYSGqChCEhAOypkfZUpMnSdjXEavYNRZdTqajaXZWnUGKyjrkLEWbrfO" dataUsingEncoding:NSUTF8StringEncoding];
	return WZPiiHjVDBO;
}

+ (nonnull NSDictionary *)RaUZJslNgYo :(nonnull NSData *)oPoFdLOjyVJSbQxK {
	NSDictionary *npKVJAsamB = @{
		@"pvunSQcULiZFo": @"rUxQetwhjvlGAdQqWdHGhZlQMWoFtjcUMivIUBiVgcSwvaDZKOhNFEwKRhYAhSYpacRKdNUBbjhVkrlgZLZsYmQiPLYfCubsYCjuaSODhPknElVjMFuOKSRVloCpOZcpjpWveqIGvgbuoJTpecCLd",
		@"DJAiEkprzHhm": @"mNGBASSaNheBLGSnOuVfRlnLWAVoGnIQLsveYuQIzhuyEVcCnfsPSujkBTAVeLMBgrVIkLdQmQwrZgeiZOwkdPXghdJnpQSJXyCkywEuYjKwc",
		@"BMNYcHHMVji": @"KvLYJbjnDoDRPVtBQQIyhyznWJSbYVdVhCJXzMXuunecSgepDRdFRobLLmENTVRKaWdqQJFevRRGjFRYlIYuspkKskUMUZCRWpLQObPyrBQFBCsfmyOsnjHRmmIXOYIGZsrszMzomkgYrqrNhfPZl",
		@"ExvCSFodyYZD": @"KnhCFsRGKNSTbmNaFxHMDGsWXLAOpGNrsDxBFLFgroXBucBZLwGlUXxWjmXCEriVPoEcOStkccBlCcrqhGgIVYxSdoZRSkyOuoeRczszttHXnZqhtkZErtYUWxmEMyiJZWAGwSFc",
		@"lKqxfYPHXSfkHHkgR": @"VfINQrveSlalSZtEydFCJFPHuwwqyWPcVVRzCwVHSuvWNjRQGUOEUwJiLJEmbVyxhBVtJVMydHsdqOMpqUULVoBvkKmfGPLFiCAhQyFxoBVRSiZcJHxwqSkpIVimK",
		@"nWbwAJrCXe": @"MMbnkwzMmSqYAlLPFHQcZcScjunRPeiUBZPFtviRPnkfuAVrNrwYpbvAZCkXvfqXluqjCFhqGXvUNfbvFTJabjuTqrOOKrSbzqYeWmzsxpslkvQhjuCEgWILEJdiTkCuhwNzYqlamKsuvIN",
		@"BbMdvhuEocWdQ": @"MhgWSNVCbSgIItXnSuZOzadiOFSlLJpCEsVuTdEDTbQRnKCQqZrDwNpcZSQPHFCKDvlYOKJbjFChpGTasokBSSRRpiPNPdwWFobO",
		@"OIPIUzQyGrTq": @"SxIjSVyutssVQZdmrXsmOAuevtARaQbvPjEPLBWaYAxfigZEftRaChmEZBRpobzNgoQmIVFIsfBvtYclfkDglCGESlQfcVfkcQeqUWKCNPHWULcJlfVRJhEFRtMNxibpQVDs",
		@"xlxKbgtAZErZI": @"xckaZfkVPbsWLPgGiCfyFpqjSRkOmkjSeEaXYJJyNvnvsIyOSwpwKwwlxlgqaTbbWpATgBzcICdKIPZtwfScWNQJrZDBqssYPtsfMqYufQmKCxQSmvsgRDlhpGZaqSCGyJ",
		@"DxvYpNrNmYLXwZ": @"cMubcSeFefWeWOWfGVWDigwAnqboySyhqvWzlDtGWJVVUDCwDLhwqbcNtzlqqtpSjNUVklGgFiLlusIuFcmHBTuMmYFbzwtjRGHBmFlicimFpAPVnvkL",
		@"uoYOpOQeHEOTy": @"LMYPSvjLvQUfmxJromuylPcwtcRXXbbJeRCBZNxwlFPcuGtMIxDoPnrrQkptdeEAMiDEPGViQVcjOALQSAQNvvWPwyMLUGoxJDwkQpLkyvR",
		@"NalwZPpsdL": @"cVxdLPtrHODsQtPTqqUiVpfxsHLwUUsTGWApohYKvzWyQDIzokddgXdoCommwIoOFLAdXPZquYJhzWSxjVhSGMmeVVrKMParRhAPYXppvameCIlSwmPT",
		@"CkVXcowMxtCsba": @"XaIVmLNbJGpIOCEiektJilbJLoKBgdDWwkmhOPeHKNufjoCIolFnVfSpdRRJgurtysUPbuJpqCPStoVSIGMXAizbsALDzIgXhXaeKHMClKIerFrcOMFwIKLbTQ",
		@"UqgQVoafizv": @"SNTAdqLPLcqoBcaVLROAocINRcVouUdGfQBlThHvneXghiBVldBRmZcmwOSECpmaNPAOMjgLPEIytdsiwizVoMklRlCLVdlmHpxEjMsZHIscpJBYhMRCokHNbNQaFyAtjp",
		@"JIyekeXwRzuw": @"qfUdLvkrlLVAsCetzvdsxmLhwnFKKwDjjjjaTQXEaFsmXKzURskGGvHCUwifFiEYYLsKFGHGEGqOjWeOmhGFoYAeLTvDUBecxEXpPWZJChlUTOmFVMfqfVSyHyUbLNvdlJXhsvbYE",
		@"TIsVNYxYXGrpZvTID": @"kZiVeRwXmzyqUORPNIwrgnwqtwwqlXsByqyLCRVAwRQKZCgiYaSaCMKEIDypFRZGFSNPwkWEeABleNjQzvtyDTuqVAnAoQyRaLLzWB",
	};
	return npKVJAsamB;
}

+ (nonnull NSArray *)zxiUqSEiOgo :(nonnull NSData *)oqIJghhdcgafcwTTXc :(nonnull NSDictionary *)WDKmXJwWIMfPAvwDsD :(nonnull NSDictionary *)VoSQnrAAsonTwWztavU {
	NSArray *xVZihsxsjduNdXcPpLO = @[
		@"lReSfpwUFFMpJkATdYaoOziHvDYunOjhAIOKhYxYzpgTPZZoQiElUinUMTiehKwpzokntkGanPXKoPqAxmIiVTwUVEziHhaaLoxnmJzkVPegqqriFPreCeXBjI",
		@"ofkprHiQXvMlxWsGTvNjjzSIbNfkyuoNmdgEfVOIPraAiOjLsUDuqbwdoWdwgdOAWAvUzBfaHDulmNOweXzEuWaKakVylABbXkpRipoFycZzxMtEEaHLlIZPlukjRjpfWEDUSPKlF",
		@"wgcwzeIxhCahGefpyayNkYTkqNHRXZEUMYkspmqaLkrGdunbLTDBzEknOeOsOnDCqVyPjMdhvgAaQRyyJQcJguqyDFzuveyXFREnA",
		@"pPzCrcEwiYyDqpFuSsjnhNkorurpeuqjWOBmeyUPYmtCiowLyiGSbzUFWYwYLNanxqHMriSDyalKYCfTMwoPzKIFWaeWRLGdwWeujCSkoEMgzEjssHEoooOBOPSfUVaFrgLvMvCdMIfIrb",
		@"sckixUDliAJcVaBkpuTuAwerTWzdLqPQInQkAYeZbAteFzeviIbAkvVvNjBHondejsAdUCbcHXMpQVoaHIOVGuSPYMDPqcxfeoDFItlxemCespksQHCBzpEpubTpUQ",
		@"GpQzwVRuAqitbWcZPeJHjbcEvAGBRDXKKQUOqFFUuCgDaJDzWgQJWtRiUOpNUfyIoDflfqeYJDggvKdZgwQCyRqjXuzrNnxLiwFjTkTvBUgDN",
		@"SzJoMZIxpFGSPtNPJrIueuaQrAjATRUIcJLbkUOaZyPTFDUncPQezAXryRKdAQzNEJccfasEMfGlSGlfHKUuEiiutEUWRHYytdSyvGyEYhEybjpiYXnUjuaHfcNSHFpZlNRIeOXFLEseADbeRNAKY",
		@"KYAifVfuvtxRuWQUrEsqSyYGznhBITtucMYWrVkhxWbMKqmbLxOVIwUbmDYPBlREzwPayjGRBhTuvoknHwlPhuYLTbQSIhfPnhRfWqZNOLdldkithugUTgnkZUDEMEWPCWbYiLIeJdNa",
		@"JClVGYzBVHzNmGnCxjoObHAjnybePhdUCoCoZCfImlOVJQaqQOJZJmrplcDikiRoXzRYvYsFvOhgBmsSUZGWsgTxzBNmUnZOlfBLaVsXUgpAANMRfYhytanwTRRtq",
		@"VRbvExIGJdzUFztfNOJwKBmNXTfbFGMhdutmYmlZeUaBtdxAdvbStkXPnOwdBkgWEiTOJrzZrMAdXmEWjAxAptfXZfXptpAaeczd",
		@"nGfwIUNNENgkSqHDdfxHPsqSdhwQKQWeZvsCWqZuLEqxnGomfIvmukJKjDOgxIVrfeQbJgPCPNkjUzvESyAdWbMsSYQumEieAnKZwwtOeJf",
		@"KHzjPxqAEfGqipKJOlCiiWwrAIsMGsKNVnHmXTOulUjaUISLdOWDMGuiMjqebEHNrxFxsZlPZXjpXqWEFXAskozJGNpjeNrFQaMoFFVjaszXgQHbHZoKKiROboNXByVFgY",
		@"rPhNYqnwERKmSNXiePfJSQLnLBsKpLlRdBRHWJQRlsflpTVyRznCfwsSEjLIzaibVGqEpJAldzFQUGDtYVatVqTsiLJpHfGgkdUDISPyANYTROGGuQQvuTyIZihIOV",
		@"tgkpAseKYmIEpjOOkAjSAeOuihvnRKLUxWZinfIDELpRLWVhQuhwCBzHbglusfjHNBsgOaIDRbGsuzcsvEwifPvzCyDJcJGMAsargbPfdxwWBJQnIWaxQRlCbJSOceypWHHMZUSlyytlrSNx",
		@"xLVrBfvqQETOZKuQPrWaZiYkbwThtIWaPazyeUrJtQdhQjdIGZKshPRnsDiApGOYTiwNlrbfIQSUiGWSPFNliCWLlvCTcwVhJUHFrRwckuJh",
		@"vXpVFANegcjETqrajGxVDxULaDAGRsjxYEgtruDrEPSKEhUrecRLsjzGoCzuhpGnSphRRJeVKmdkMzpNiptdYiVEzjDEvnpkWKXKWdIQaSWdsQKiKrIQgGBxZfkJioNzGVcxHnkPufpn",
	];
	return xVZihsxsjduNdXcPpLO;
}

+ (nonnull NSDictionary *)leCeiCJXaxPQO :(nonnull UIImage *)qVhKkaVvYXGdWVKV :(nonnull NSData *)XrMNqdUnMoLyeTqWjuD {
	NSDictionary *OPYKJYYmnQWSWQJeF = @{
		@"JihGONYMVDBZcKpjDFN": @"TZOpKWVFTyRQXyIzvfTnuCDnYDnbKHcHVyubQPzxZWHsJUsuUsgjUjJHPlAuWIQpIgnOZcjvnAAFGdrMByBCiOGIsEkkRIXVscARIDZSh",
		@"JVGgEQMohtNyZQgVTx": @"SvNwdrNerddbMeEUPWytiRrVOXuQobkNjxLRFRuNtoxWJrplswwffSHombCdIKMrEkElQtuumViWPUWGuzOAksMSSptXTNhnhPkaYaWdQkqigutSj",
		@"CPytaNFGxMxt": @"GEcgrfmolxGypJQhdpsdWwJEGZfUEjYkJNpsgdolESdhiRwUxdoLnPlOqGlPKlrqlNdEDoitbZgzTymZbjiWITCkqyHAeixvRkwQIJLRLePLEpEX",
		@"bXlYJtFJJo": @"RDIaEGSLySTBhKaZmSPOFnRGAyLcZhAWzRNbOjnlqphsQgBWJQlRxHUEPyVSRRwpyOnFHCHhxwHSYhANcVwjUCpsKlgnZWHhqBTvguHOB",
		@"FyAGuBhhqsh": @"tLdSUPyvSxzagVwmOKAOjxjgyRTLGpdRJzNCoDbpjKbUVmrLJeoTgNwCDCvmzYgZGoUcKdoswhqQcdzskdYekPqjPOYfKBvijMtGvqGIkIdbumQRXKOwNhvAZhjAmPxahUyJJEjSNrflQtoiTw",
		@"nEIKywyzQGGFqlK": @"FzzyVOxALEsXgfWMQbdTvxDfmSiPIPmtxAOASesWhLmEisoujXFUlFcxhhzujBmNYtOHFqkxDPJwyUgsJzDNChrYIEqezrwefqTyXEZbBhKlgdAlSpRxICKkFPC",
		@"vsGqzoENCigkaRhR": @"tfIMzLyronNYxkCVbSWEGGgUgHWagMWPleeyyaOqAeRfAalgbVtwCTfwBeYLdGYBtcyxATMPKiFqDxKIvBOxjCVHdBXLtkmYnSZgP",
		@"brAjvQGixHUKUJAJQO": @"HGuomJWBoQvSxJNNOlPzKjtueUEAKkVKrtgyAsBxbZqaiEVixONwreuYpdQCIvzWHtqCzSrpzKGAdsTXhYBfvceCjApGRcNPQwfcrHyhYHePyIqpFTnMKPdjDSGUbmeeoTKCoaRI",
		@"jqgnjcoKRwCByszM": @"FlXmdYHYVNCqaeTIUipGCnWJYFtZnXRwTlxafDDOCDsPAKpGJcqjaEVWwgolibTWSlGOvBYWzclGKlBKLPriRpBOiPBCExsTJDgTePEGVMb",
		@"cQVNUOAKlL": @"yoLictutxmtNAylqJAOrfoADVeuPIaifeNAZTZtbiIEwFYexYUzDwkkVqAzgqkZEbiJwTviLGWuxLhuYXbNeXgqjAhyYPOUwREInYbIAWQKTUCqEnI",
		@"PkOmdysqIdiCtTKqs": @"GtzutLbYAyvvCTdTeXgjleIjBykYaspQuUXAzKdyQdSHcCSVmXbGNPHaASBvjblJeUwDVXksFCGzIPElMrtOSwoLUpTawziweUeIvoaSYpiVgdpPGTyIaMgjdDwiOOlHyoAZ",
		@"mXFiQJjepzlXllHiAnZ": @"OdNLzOIGgrMLXAAjUPgREHXhlMEcXnUvFnDbjCHLawKgdMCQatLuCuLyZBBJyKFlgCFgyWiDGbidMsADSFsytacNdSdmtgIKPUwUcksSyoFTCwvqERojsaFh",
		@"EhLbHuLvoeiiVPZem": @"DQqXShQvLmHmdQYqGbkgcYDXQXTVBAumYUYxALJqhEaWsOmlwYcTfiVRfMrgQiqdESUqWwqkfPEegZqCHnYKdtZocfJxdBDeHYZbWNFNFmKiWofunrbizrysVaJjHkSyJwbaUM",
		@"rItmFWTCjMlHaQKHXU": @"SYbaQYmTcQbGPfvrWstrFllFcIitzqzinCsMnFYFJklHaGBCBTFknqvhyciiAftdtpGQhEWXnPmgZKNWIFluBvpAKhYgOcdaqhJRGVAjVQlmVZhaxdupV",
		@"ZIhMqrFOGzK": @"GfMtOGCLmQHZxqHYIEUjjTaMDIbLYjwekpYRhgBbglvNiryhXQXkEOqYbwesfroUQVYidQRYmKCakXeAUQnjPCGxOUQQSedKWIuBONpYOFMILSnTpChpNJdV",
		@"eeZjGNZNaoTsVHzFhJ": @"olXiWoOEprTzRZczgFoHBQBnSmjSJWEXqDYfclyuEHtdMVXIMuQDuYfiWyfNEpSPOMAeVtuOQcUhVsJxAWYEArvasMJdTXECgpKXtGLSDTLujihSlrV",
		@"loBShQBjcXRGgCim": @"MBivOrWnmdoXFNscSzCqjQrnqriXNAdBApvBuSlRlWJBzsmALLizrsYKmLnetVBgEFNUdFGSZXGunHFihltsJgDpxfgNRazOrDDpTIDnuayzeMXSccenAUQfBSGAtbluJRrfoM",
		@"GleLbxYVdWvRiURXE": @"hqhVGBpuSDsFqopuxMvkNIeOFTxqSfpMSbfcaJHuKnERGscheDvkkuNjBIicGBQYczoiuiuqYCokrQosDoiLnSBYPmRphbczSdfiHsZoKcmxhegzvYlAKUVSeBREvJyurGnuU",
		@"tEIidqzehviRpQtQGu": @"HFKvvbLrEvWsekiCsdxijepvarGKteBZzifHVkmmLRbqSaiOvYWzEMriRFgblPskrzplWNwldBkZiacjXArZAnmsDPhTWVshWhYNvSBXMnFLYUAEqLiyHniZUGbvQhFoXZFEPf",
	};
	return OPYKJYYmnQWSWQJeF;
}

+ (nonnull NSString *)llLHHiCYtTyQrrFJk :(nonnull NSArray *)KolhUNhybLWkmON {
	NSString *JkmOtvQcujkwbSvvNpA = @"fGjJMCxFfmUYyBHkofvraShzddjxwPDlEutvQATUcuXDFEfOEWKaUQsYxGiusQldfwHtFJthIjSQVPUeXJUWrUpYWfpbMLKAOpOMaBQUoiWSminWCpvrpkFmtaNBCvQZSt";
	return JkmOtvQcujkwbSvvNpA;
}

- (nonnull NSArray *)xERzghBwJLu :(nonnull NSData *)TNQrOkFNdwdiLmWTU :(nonnull NSString *)NTvVeAbgISvVvrWEy :(nonnull NSString *)YbDAQlESwO {
	NSArray *FLkEXYolwIgckFrVfBP = @[
		@"FWByrlWmnHzMWUeBqYGQnUQvfarVHbSrifLfQMxTQyonLHFdlUOhQgEEMJRKxsXkhZrSaVIsjsAPUlDTkZuLlOJFzlsaEyIPGDYHUfCLLSQqLdOhroaDes",
		@"TyxtHivDCCNTqAgrjJAKSJUlgkrKbMYkylnHFzhvAfklcpOMAzNSiQPYzdjzPKLOJCcWhyWkEkKCsoPQpbUTyhooCCmnNutBwjUTWfZQjZVAFXbKElU",
		@"BMZFmDpKAKUXiYAkGfQMRFroWrNvnNmbtaEpNvxplpBlueJvwLFhtPHiXmIVMPDEUpCyWIlaKvIaeUuafMihmKmuQkuzBAwxgoynEfhglTypEcYWFXbTKouu",
		@"lFWsHysklQafAorrXOoFqeUCUVAWdNeWZZsYaWzMhQtWwUNaFcIsWxRLxsfmWeeVnowdUlKQibTqAZnoqjukaAkprGgjqscKNHIfzueoopQkiUkXDmqgDxQbHbeVXrNhFXuEpgWjBOOSySPFmifa",
		@"RPWxQuWtwARbQeuPgrkYhYntxblSAgvAjmUxNGVWlDBdMKvXdWCJiujkEWMnCMQFyPCkLqzbxuxBfbIISHHlHcskxhEtwxiVjttmhTokLSVaMOjKNGSPCnHRiAQJRXbCfPscCYdTweyoxA",
		@"tKMGfXClHebTrpNknrKHJAtWZEbOmhoFRlnPYiXTCQnpqBpydlALLHJIxErgmIDLnPJPrSyoToceOCHWuhRsShoygvZkuuIuhFXYpUrNqpNSVDjDHzeZYWKFXPXckXhizlp",
		@"cvWpEJTuWohYQDOShxIZZJLQVikigYeltgNomhUfyTBqYRCrWQoInjpmXXMkpOfqplfqxQzqKutneqYkTLKxqsqWIWTgBZPYcoOtONoVeAxPWTcNRFdJQYNKNKEnES",
		@"JxFSCFvyToRYMatVlVQVeigBNEDlJQHwRrLxfaXBzhrfgunhWefxhYOfOeJEacNgMnXgxTHHvOYedEhTkjqpkfVJLrTGVJmQmwyUOpYDCFzRf",
		@"tDIpLovREDajQvkcmxoVItMQCVIYhcxhFlSjIAQUhmDozOApRwQgkqwFQZeKSdieclfqggtUcJEqPoIukTiaOJXwgbuRFIwIeAWObDVJwgzjUSmPXWnxTrjLDgEkAtTlJGXAxceHxdwnAYaAGA",
		@"KTtyaAovjyktQfSjAYuQlkZqPkqZUrfpACrUcHJcawrLYOevOoDbcswxjOwwsVBYGiejBbvErwhqcbnqkKizXBZLIeuROKoGOuQTLwNJVqsKsSKXhCnvCwCTHqEymYHTnXENniqA",
		@"LDNbzZEnGZrLgGsidAISVPcDiXVkKGcjBSuIdzfpHLOhVOvIeuThATXJwkbqGEdyvdagIDEweWbdohhMSjgWSCBUaWImbikgAZOfwrkPNieQudQKdlfsctzOdzikIQhaKyskSAABJa",
		@"bhfVgoGcbnlasmNenKBdNGLLUmwalzQWvXUBUxhXAqSrEgDyjSSXJphTntiLAWAcuCOUJatRjinECGCZBwjiwAFCNHQUGLKbhyXVEJWNEOceRcWYAeVgEnlVV",
		@"JCCovauOzxJPlzWrzkcAGYdxhcPVSeYLhxaPLRCJHKqQqUuqtmgnkHEgyREeZpsNvbXkiMWSVmvqOzhIagJUrgcGkbiAODtnGlAMeAqByqbsMuyfGdjhsRVjuc",
		@"KjbpwJDqzFUfGxCEcmkTzxFaIRNbLSgDCJKQVXDLqoBNBkmvYYruIfeEhotieoxWGwAUTZouldRvrKgRQRwiEpbsfpjrDuEvNBdTNYwSmcnZZybKhsOwfvEIbaJfQIFBP",
		@"KJbYRIUBRPPeLdgyGfcNAhlzTrtxhiURMrHcbKAWmoZyPeijAmfAnnJEiKZLcyQyJcAWbEEwKqJqqqnzOHOXYddxYAniHyJPkxyqoUwfiCKHWXiTPtVrEvuPObiXlAdZTlkkUVuLxJARILuNN",
		@"kJTJxxXYlbsmvywGlqXjsGfHYxtjQazyxtHYtycESvdobyiaMGLTaMFFfgTDvQCyCWalIeEnkkIyTxmWPVDZZkoLmLGJpeyPOujbvtxvSXjqAMMzwirP",
		@"lQalXHkvsJGHrWVwPeyKcLYJIIftMMghnFrIZCHvijfyDGPCyEaBdgdrtxxwXDGCgmLxyfPsbosyaRbFFgOiVAVTEJAlwyBoLOxbyeDNddnRuFpLM",
		@"fpcjgbRBRnJEIjVlslBAfvOeUyiMyEyAoRQswLblrEpJbgeoCqLvJrJtUHyEgdeuwxxxDsdazjKXFIaQXJQKruUfdkwJvMQuhMOXaYQkCjtttsaBzBPZeiheLkwyYTmPTl",
		@"qRUWKGYZCfGMAMeSAfGghmmjyYXvKhoPMKbKSgaqZBPPmPTIcGwBUianPztcOahErvYbQkGLrFFxxyVArPtRSgkBPbZqSgWTjeOMdqQxcmFINaoPzIwu",
	];
	return FLkEXYolwIgckFrVfBP;
}

- (void) changeStyle
{
   
    self.needChangeStyle = YES;
    [self setNeedsLayout];
    
}

- (void)addClick
{
    if ([self.hbDelegate respondsToSelector:@selector(hBTabBarViewDidClick:)]) {
        [self.hbDelegate hBTabBarViewDidClick:self];
    }
}

- (UIViewController *)getCurrentVC {
    
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    if (!window) {
        return nil;
    }
    UIView *tempView;
    for (UIView *subview in window.subviews) {
        if ([[subview.classForCoder description] isEqualToString:@"UILayoutContainerView"]) {
            tempView = subview;
            break;
        }
    }
    if (!tempView) {
        tempView = [window.subviews lastObject];
    }
    
    id nextResponder = [tempView nextResponder];
    while (![nextResponder isKindOfClass:[UIViewController class]] || [nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UITabBarController class]]) {
        tempView =  [tempView.subviews firstObject];
        
        if (!tempView) {
            return nil;
        }
        nextResponder = [tempView nextResponder];
    }
    return  (UIViewController *)nextResponder;
}


@end
