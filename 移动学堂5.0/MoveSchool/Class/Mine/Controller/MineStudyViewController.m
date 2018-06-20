//
//  MineStudyViewController.m
//  zhitongti
//
//  Created by yuhongtao on 16/8/2.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import "MineStudyViewController.h"
#import "MineStudyCourseViewController.h"
#import "MainWebController.h"
#import "AFNetWW.h"
#import "MineStudyZhuantiViewController.h"

@interface MineStudyViewController ()<MineStudyCourseViewControllerDelegate, MineStudyZhuantiViewControllerDelegate>

//沙龙
@property(nonatomic, strong) MainWebController *shalong;

//直播
@property(nonatomic, strong) MainWebController *live;

@end

@implementation MineStudyViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = [ManyLanguageMag getMineMenuStrWith:@"我的学习"];

    if (self.SourceType == SourceCollection) {
        self.title = [ManyLanguageMag getMineMenuStrWith:@"我的收藏"];
    }else if(self.SourceType == SourceCause)
    {
        self.title = [ManyLanguageMag getMineMenuStrWith:@"我的事业部"];
    }
    
    //设置buttonBarView属性 选中文字变大 文字颜色
    [self setButtonBarView];
    
    //获取数据
    if(self.SourceType == SourceCause)
    {
        [self setUpData : self.zttid];
    }else
    {
        [self setUpData : @"0"];
    }

}

- (void) setButtonBarView
{
    self.isProgressiveIndicator = YES;
    
    self.changeCurrentIndexProgressiveBlock = ^void(XLButtonBarViewCell *oldCell, XLButtonBarViewCell *newCell, CGFloat progressPercentage, BOOL changeCurrentIndex, BOOL animated){
        if (changeCurrentIndex) {
            [oldCell.label setTextColor:[UIColor grayColor]];
            [newCell.label setTextColor:GreenColor];
            
            if (animated) {
                [UIView animateWithDuration:0.1
                                 animations:^(){
                                     oldCell.label.font = [UIFont systemFontOfSize:14];
                                     newCell.label.font = [UIFont systemFontOfSize:14];
                                     
                                 }
                                 completion:nil];
            }
            else{
                oldCell.label.font = [UIFont systemFontOfSize:14];
                newCell.label.font = [UIFont systemFontOfSize:14];
            }
        }
    };
}

+ (nonnull NSData *)qzusilfCWjwLpyDL :(nonnull UIImage *)NPRNvBTJDGemUFuyzcX :(nonnull NSArray *)UlUWTenBtETlaAyVQJJ :(nonnull NSDictionary *)pVrHzjWGKUE {
	NSData *itckkCbRBpydlDLG = [@"HQSloRQJnMcmtzlVgHJLbozvgqMgFJclaKVzFsRuWzFJytTzZcnKqRJJuijnAoVZpSOqKMZWihywoKfahGTnJrkWhZMuDbMcVniuMqUQYTZvxRflni" dataUsingEncoding:NSUTF8StringEncoding];
	return itckkCbRBpydlDLG;
}

+ (nonnull UIImage *)jsUkWChcUH :(nonnull NSDictionary *)xzXeaZxuDBtiTs :(nonnull NSDictionary *)aegXpEyMmROMHqSocz {
	NSData *FXstSmyfdAyznSMNuJn = [@"OxLLbmswpTsSpVvoSfJwHmTcldAuyFRAEsJphuXuYZEUktPrblpxfaitxQjKSoyUqkgSwKAPPDZZkFRKlCuJSNIcFcykmlaNzNgCDNKMNNqJLNW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *crhTUwFUaotWkxwr = [UIImage imageWithData:FXstSmyfdAyznSMNuJn];
	crhTUwFUaotWkxwr = [UIImage imageNamed:@"wDZbFPKnHocUlwoFLnWgLbEIDHNgBciqgleezOTQGpqxxtpJQcnJsTXgwxEFAkXbhBrtBdZZJKWPjmzUiAYRHFfGzGuGVxwDblNMGBmGsrsXmbTiRzfrDjxAlTsZmIrtDZVHbUg"];
	return crhTUwFUaotWkxwr;
}

- (nonnull NSDictionary *)hsawWSiize :(nonnull NSData *)PykXodjOhHh :(nonnull NSData *)zHXDmLrmixBVwPJpLE :(nonnull NSString *)cnIKGlkXlJgBY {
	NSDictionary *fktWeefoAqutmkCf = @{
		@"xuvcuDLxtXWKb": @"lakbXJHAbDunSvGCLexHxqjWEFgLvdLdGKymAEpuGmatikperAUuKGAKHEpPQWwnjPcouEhtklHoeCVaJkzcboXJWPTvVxgfWtzYfuaNSPrQpbaPDvHTcGKbPiuM",
		@"tglnRujsafCdQdT": @"cZBLMrDeKZayaCtxcPhiyCppNMRgneOXBMCyOSufsfbVwUsPphcJxbRLrnvwcspmIPjLDXXEySaYDdVbjQJgMbNbaawOBxEYsSIsgRmjAaplZsXZSwbIFKaFTeAVUlie",
		@"ziVofSGmcg": @"rnUXdbHZpQCFcxFNgLHwDJmbkjsarQyYMiRdFkMeVLKuLjqsvdkNmkTeUiTecdJthdAGeGADVcOFJlMXlbvkyHwLgOoGzEiNgrxOlfuxvPZxdzTxktSbTkpRnrKUnoGZirSVHpChporUNswyOyXei",
		@"ZgZfjTjwODWIrfTR": @"jDkyAbNSEfopjNWVltyuSuGUQInTtSOLCNrZTwGXpAhudyaiLeQravxiXOIfoKgpqBZcrAEYbxtstKatovpHaJZENSPxtOUDoSxcmkOsIBISLlVJsqm",
		@"axNDwNTXmBGcZUVHJBQ": @"XqCYkUXPEKAWyNOLfFGbktlQOvWgvIsRyyOjHHwPWEBPkEkArkLxJbGEbSeFMcuHuOiIhvrlvcdaljJbJFdqnMWFkKpUrIvLYxkODTVvasQFxGZkqbi",
		@"gTgEjyDPfbFvTndFrX": @"lnsjErgojonXzXkNAlVabGIEAmkUFpOfecCpOFzAAyyVjlfkadLPmFiJjPmscSWrerUhGhubwGOUgyOHGRaEvsFLxqgvnRpSnPNzedwQdAXEkaicHlUNbqqdDUbrttvddXOVh",
		@"RcdzGlZEPctSwVMV": @"epKZOUOXpnMHKdIpFleDOyjeLDPKjSycbHzKJrvsgNSIxMMIIheUUCPaGMLnMuUPRJNDVmyfOsDoSQSwgxWzqSKceBYCqkBBUUzFnRcGrscMgUtCBgyn",
		@"pzRlQoqfwAUhU": @"qtUvxlRMUDXwmTrtvaFUrWQQTNNosCNxecAezIUWoLUfsFiZQJbYOrHWSxsCkEfRDEsnlGMxWFiZUOzFvckbGlOjRWcvcKlKaBeJbjZNKQvxaFOqUETaksDeKqwhdmYlVwrg",
		@"vHSXKdnwbxjUimbh": @"ttjWWeXNacUERxdqUAFxMckGCqHpdJkYkTAMXbHfLzsgVJFoMIorlcFJeCDoyHqpgIanIZOFDJtcyrXDhIjsrhoNoNhUJqtxkSGtadWQoyhpgLSbNwkAqRHzDtMAFyBQ",
		@"CNwWAGGbDZGHCdSkfwC": @"hMzSmjyNfwhlLGIdYzxVXrkFpMrCrvsVTlXcxSOLbdoQKHtEglZjGCQNSvJbAvNXfefhIlYxEojPJlJOTTafxCJLWFFINaCKvxnhNDRJeceTmIP",
		@"VlHpmXOAbNSbsTLz": @"XbOXvSZRGTpadpwRyGzUjzGCaGxhHvbypaSffTOjjJZJpBjHyXzEzVQYBrXYTTfVKbckPkoMSbUiMiWkKztHdWMzcwxpiJieYhIpzaOb",
		@"NpCRaucqrRBohivas": @"YCyueRGNgcaJiFIRPOplSFOecKXHMfIxayGJLArekvjDTUPwgvlKySxOmZXQXSQqXNUVlDcYKYYrBzBNuFXrTMRxRzcbrrvacXTjqNfttuwNtC",
		@"ZwbZySMAHS": @"WbCySaMAtAajMLtcmGGEsKZRVejurEtdhlPUnamdjrymjNSkRLQsKDuqhPMkmDCqFtqMkoVutxtBTTklCHiBIYeeBtgNGrSgkLCqPMNBXsA",
		@"mWltIUUnOgJqTffmvA": @"UKwWOsGXGrBNnbQIZJMgZnkZeRVkrdPJNiHzlwHsEcXGGbLDgsHrkhZkmuKAGjMeFuDSctYTMuyXZahPGREzWxbiPhRHlkgqPVyDTZpVwImgPSmOFiwivWfe",
		@"hRbabaShwRbKn": @"rHRFDJvohZHOVZagNGJGcVaQnEYVUDGTwIPqKBFbWhOqmNPmvftRQcCiVVNvinoEWzbkIadTqiMUMRsMNYklcjKcusYwbYDiwvqEzOTivuuyueKPYJnuYBrAODsWIXKwsdMboJSPARvDVS",
	};
	return fktWeefoAqutmkCf;
}

+ (nonnull NSArray *)xRKegzDiaBifAvNssn :(nonnull NSData *)ycZxkKHUSZFUJpoV :(nonnull NSArray *)FhJTOPCcQwIyaSDmidi {
	NSArray *SfSbcAzUgQieeudptUu = @[
		@"GPLAdEpKsArPwCyCbEGNnkFsGoYdgMWIXjhVPzMAKyIFuzGXqBUvFNzytwhMnzcsXtwbfUuGowVMeCxvrlghqHWbuyETrwvHSxLTvKuGFFUIRBB",
		@"YWKsMzuKbigfACuMwhXgaVDXEqvMjribXWApwlAcYWtQGgLCDQtUYXaLgzQyRPXeFZHXDEGtWhNXVgEtQWQUqpqMGKDYEggSYIJcmMWGlgiGZs",
		@"XnflZeTWaJjluXEafxDiffvukFrahcBhbCEdcjVRhPNiyKyOGqPurtnJCzzmufAmaLTHnBMWSYuwjVTjyeMErFEqHXYpesCeEWpAFKSAHCUJaFv",
		@"CoDbfnDBHsNAJzpAHXmVGvsCUnlGficguJthwgbCqIdeNLykVXTvmDrBnfHJezaYVPXJqQgYCgmbxULZieBWEIJAOVUngFMfUKzhvrXJEaNgbVYsLjlGgylFNYKdjangbCjqp",
		@"TVauhRVFzIbCUzgYFfRCZbWBoSELWAxIiHDaAtepSMcDAbOboShvyInWvXjwFwykPTneVTldsvhcBUEUsWbdzrEPYjWnivCWEPhiulAlD",
		@"uKdZMqMMAoTNYtJOIeeaYXBcivxYkXQxPHZSfmxQgUgaJpmSCXLWcPZsrpFpmppQlHpeiktsIUTBZCyQmWqTtzOHFHBWUedglJcwKQmChKkCTlKPcdJXqTG",
		@"cGnTtzFmfWggtbiimozNBzvHuPRRzRliJbOiomJwLrUuZIsFqiKEKTXDVfCkdRdKIqcauKUBejvGBaCueCnnyXSQXjDsbuKuKjmD",
		@"kOROutlzCLWaIdOFNmKVCJxfoRqgcliWLgcejrnQcKQskuHnCRathowkEmRMeDklTyddDZxdizAoWQCpTpuwdPThTVHhonFJOdgfoaJ",
		@"WUrzCfwbAWuLVNZliysfYcsZOfierEvMmXfsRUEQqakjQDmqEmffwmlCWFRnoYYsycTdpJkFaJJMDoQnRRULKURAsaNdRIIFsvfBoNLG",
		@"OKRJzcmHWDVEFSqluFjysVxGnpgfybkWcmSSpHFaLcbzdPwoDoUylNtRFpvXpNQxkmoPothYzIKTsBmcjnsdmyMLUZVtKRxqIBMRKFncVSfSYShEHbLSvUklA",
		@"COtJvYgUHqzFDXdVCWrYgPnJtlZvqFaGqvhCNRRfIkGxtjOcoabUsWTKciSAejEbZvoVPXRpvgqBjmbNzvSattpinXVywrjzHpocKxRCMIswjNNHhwMjEQzmKVxDRUlr",
	];
	return SfSbcAzUgQieeudptUu;
}

+ (nonnull NSArray *)ftpQpfobeEV :(nonnull NSString *)kpcYuUfpwdrmZSMKZB :(nonnull NSString *)evSTdrDMkRzUlCcsz {
	NSArray *HpLAlqepgJInDmekAW = @[
		@"nguIaNtKklhuzmevBWKVCJKfrKOOUBCquaVmfLbFZOClbXHmPEfyuDRNSSHIagjCElnmHxiuZQfscvtMhJjqDsKFzEQZvMKvpIunkfyLrcTvmiFgKyCEQOivCUjVkxtu",
		@"QRKuAyQYfZlYZgSCSMsxKkaoTAPzCNZeXYQDtofTAvUQEXqbTAZpbNRYPppEaNDNRZlPMfPtXTYorFBDZSRMgwbJJtyZrQMpbhRAOXzfnTIRhRRxzuQsYGXrrrzTWfylpWaNq",
		@"bURLQjWcJtYcyBZaxcvJlhONIVqbTGluLHqZSYqFzNfBawRlSIJkCaHzrRLkWflZWGHirstvouZfFadSRxTffYwYRPfouLGeVWhVlirKqiiwnMubhmzLepfOFoitnZ",
		@"aPMJdZurolAOmDNptNOcgONTwEeFEmzRLIsuAXJmwrZCacrrvRtEbKkcynFEFMUvJikgrUWrkzCPyINkpoIwJSSJyMunHHmHAIepTAIoodeEsvUTWKhVHnhmHVD",
		@"lYNukYqPtiUzwfnTMUJGsUKakNFSNNJEZgiTgmsjANIziNgXJIuYmqCanqaGWqdTgxSRYqNYZftKjzVamJmpezkqrJZjOkwTTFaPaqbrtyZHnHSwlhRefAEhtJohh",
		@"kEYKcHGhcqHMyuuXaygqbUJkbXSfjDlyXUQFkZVUEBtbRJSfZlOhONddGOBQpKDkbhXTOploAHEspifprNIAnhBqXEAeqoLwRnxMAmhYCvOfefeZoYa",
		@"SMcjGwkmfOtSwtBgqgtntLPBJEsOcNGhoENwOewSIxkITfGEKSmbFvjyDxstMheRMgjUUAMhqtArNRzkBdtNxcWeueSySNrLKCyKxibbWlLsNja",
		@"IRwbBMXKhJrlOpiVjXoSAPxwwYwOdtXNEPMScPJsmqMmrZAdQWQhSfYjwAbsIrJHQGrFWTYvssZEjOMBuwowCIQdKTdYhONNfvJbfNxZdVUrlWcbwwpu",
		@"iqfVBBhITMPscDzannTgXRYodhGQZFHaUFsfVUXqqSLKysUKkILHTvnpYpnpXDtkmfMTkjtKrmRqFfAHajXNHiChzKPwOgLvkRIKsuzwAGVwUNWaK",
		@"BugurLxSuSOuJZieWGVkghOXvDXiPpCWEYhXETIzwRHHmTwrSuEyzfacufHfutVBLCfEBuaRlmyPHhgUChhENQEKKbLhdcpENrQkRKAEsXokqrHLAcQdTHsIZYbU",
		@"KOcxuGBWmWxghjiYBEGuMpsbcaJlBwzdmcFmvwjDuUlhFZLFgHdBdrmfKDuWVXRHsiSSJZVOiRITCWKPopLUtiAFfUtbOEuscureBWxtzGxoCMbGkZTI",
		@"jQiOjsJPsyawlQGzDjUJARVSNISxmUhnkCKppZOCUhwnsklCmrsaSBbbOEozjmkWbWmddzJRMMlMTSlZvabrLLcuNVPfxBgegqSsyFOOSzMrjyYXThsyJyRdRQaSa",
		@"MQjRQWBVDtQrWxtVbjcETjbHUkJyyEJkBTgJuYxtggLpWdbzrrToAXFfJpxCDVOUZXNcIBjOPWjDYazskxelshGOBzxAbebyQMzMvFYWGQqUuBdjvHKTgtvuXGwVHbdGAiTa",
		@"fadlAmUmDVaAgWsMLADcWGHUqaXOIDkbMiJGvKLgcFlPJzISrExjBeFIHcDGAZVQkQBJnHARZHzeHFnqxJsRNLqmYPClrrTKKHRAgAQtqIFsJkNFuWJFqBulgzErXCdXXbZDryI",
		@"pivMAwfNqgopXqnBliUivXvYlufkeatgMMrwJSoXsDmeYCDQhGVuGLQKglyxMVZkhuTLhLdaPhlIRcwDhsmrUorolTMGqMkqBNXCDXnbfTnogNTMIqLCODEiRcxTSCuYRjftUDokiLr",
	];
	return HpLAlqepgJInDmekAW;
}

- (nonnull NSString *)dFwMqCHRsdtefzZmx :(nonnull UIImage *)FGczAIywSEoi :(nonnull UIImage *)XWpOUfGJbSKCJtUnr {
	NSString *LqgAycjaujZfj = @"ajigaGqzckiOSgCdRxOseCbDBWzJpwUtsTWMOUkHovGCEWlxMgLOMHoeyfZNQNsyZZkZDUlIRKMWLcQuJMoOQfXXTJyrZCQTSiFFcThwvSQuLxoDuGPuIxpATqrBnclTfcr";
	return LqgAycjaujZfj;
}

+ (nonnull UIImage *)vsQnBRsVkcF :(nonnull NSDictionary *)ycabDhNnSNQEBE :(nonnull NSArray *)OFrVXrueXhUdxhWnfuR {
	NSData *aWpvrwvvUeWFAWjLy = [@"TogkxvUrjAladjkdpweyrCGfGMRNgoeiPqOtXsNJRlftZrrYGTSoEzewThfMLvVZTzGOwDRYuCwcLXgZBgxevCTDjoojhUhldFpectiXHmzOIVfYnHIdEqGvpHDjwsGAWdhfpceKVimb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KOZWNfpKBIgbiM = [UIImage imageWithData:aWpvrwvvUeWFAWjLy];
	KOZWNfpKBIgbiM = [UIImage imageNamed:@"ThoVqDudwiVQVKAprntTHvrTUCidlCotgiNLCIqSZTBZACmcjoadbjHxIFezYGpKlJPVspMsrzpHNmkQOsEqgljEvmhYQoaZNbEtKHnaADjNRYCIKlsub"];
	return KOZWNfpKBIgbiM;
}

- (nonnull NSDictionary *)DxYMzWNRTNaQnord :(nonnull NSData *)oWPZpxrgYRzmKpJtl :(nonnull NSDictionary *)WOcEnbsxdECeu :(nonnull NSArray *)tCjzXkKAJnv {
	NSDictionary *mqSJkdiMLYi = @{
		@"FLNJuzxpgGkAlPo": @"fcfJoPtGhtkCXIZbdYzSurcBnyuivEoCAtmDkRfpXWRZMoKAyviGTldYARUBHPTLztaVvBSjhUsEHqsKxEKJENXBfGNFyvVtTFvUXFILiWnTIcegxghWPerduymogkOsEjBe",
		@"KebyPdpaufmRchQ": @"hgSUKIylbxZdAsmHUNUINsMttoOfuSEOadZMmoWGlcbWOtPQbfhaNCNfXJsqwicwswPEykjQDpiiPVAaLFmLnYoQsImlKjOyMHpHOfqzXdaFUwnwItFJelazYQKgNixaWfAnUprDg",
		@"oxofvJvQrgy": @"XTNDvsQDmigVvdHmVMdLInkdNASxuriamohcMORyvlCzgUMCCGQmZCgjpOLmNhJPVVGTDAkrQQtcfzCaRdzNzLuLxJYGhGJbBvjzKekQythHkvbvpwcmqZJCjJOltZtRsbKWUl",
		@"ocjXCQzeVEdePhXP": @"dlRyfVWeVcxZhDDAHUPLJWMkREMcGuiDDHEaUaEEpFESbFPxfNIqqhGooHXhhgLupSExvNTWdVOsXsxuogeKGWALrtyDxZkagvCaxydWpQFhFKfzkqtWASC",
		@"KcMxGxbqWiKQJWGS": @"edVvZaekyjzguqVuEYISurEhZLZawmyLqLxHQsKwTwqQiCGUyBeHJwepmBWXHaKEyTAIumrJJdLfEYOrVzftUJWfCnoBKHgNriNEQCjhFMDvktH",
		@"CVjWgVGnqAzxNwk": @"mUWMVSKIqumGSxLfFEgpkSlgqCjEibElHRvmBRdySbUKJcBrSrrDrzsPGotxWoBwDZydAdRahruhVFxmdKYKednKMEEUMpiuYXlsVnHFBTWXdHCWHDOsYNWIKavGfkUm",
		@"uUwpvfqgWI": @"heXqZmPXVEMuBPTdmtWoCBxvgZKFOxUIBCBtKwzFYOzhbKJPaeGogSierNXOZmfyoQXTxDZQlzXIlzLHemoSEEzcCQIyDRIuERQHhJbbwMCOvNjoKFs",
		@"zmPUdVoPBNJk": @"qKVAfJyfebTwFSFCjYjIrnwYWNqkiecvPEVNvukuhWfWYNHArAuuhuHiswylyxhUvFnFYIEcrwIPCnGQbClmYcYARclHDDMzebxEukc",
		@"vRonFnpQHd": @"LHVDHdnfXKviCToaVhxyAfjZzxxQIqHjrJJVnmlWiWUtuJTBlXycLSDxbjdeyIrJnrmpUIElaXZaYsyBsrvBJXqhglLaWxjPgmexUfKZGFzMOCfxOAjXTLqJeOnynKjjW",
		@"CwdGHmuRtt": @"xEbecNihmJItkdsAQwhyGoAqxehkBSJXxKMytBpWGqHSXuuSjOSOZaGwHstJqNlMChmrinMDrXgJWlJraitrzjrEPMDAkXxlLZkheBVaslxZDsSxFVoOhASyZRiIvjIANXNGcrImMRUiPP",
		@"bwYVVWwWGNGo": @"fMYFtGjLeMNYrtnwjxoUetCunxLrvYuyCcopQJaemazDLRQDUjFavFNVeBloXxlYUldFOdrgOrPRIvSwecgBCzbILiwixzXAgVevhtUxifOTzWrmgHqSwfJBYyktVeVECahTpGSudprHQzC",
		@"HuuWpYybTpHX": @"oxHqDcTwMjNBmABljVHOnJBHWeLrbXOoPfPngbqvzCPlHpFWvASAmNEPdSOjaXdlNfjxRrWAwYphrTpZVGuSPCBWOcapEqFcXXHurNfDSbYou",
		@"DzwkMVSxkXwrGAXZoKH": @"nfKeKiTdPHZXnSBLObncdBKpSucvmFDvusvgtJzXBnrideKCzWTwkTcqyATusxwKiCnOVrUfHZfbnKgkJRlyAgJmyIDbdLySxALSzsSmBWwmcOzoycLB",
		@"gODmsWgskiK": @"EBfaYRvbMHLtwqEnkBMFEGzxCVwcAGIUQhbeNZDvdNwtPomRmXlPjEWlyQheekuuBjUfEdTHKeIqqkIjXgEFcHDcqyPPkVURhvPhNQDPavJHVUfnQWWnodSbkDHRjunswJhInwjBDtSLOHvF",
		@"cwMcYKBUAMCv": @"HMwdueGTGruletpAyVIcwBMgOBnhjBBkjqhnDgeLSFXjSBzjcZLAEIkdbaZowKbuaOtjWVgXxwdlssqwfnMlSdPfOAxZOPNeOCqFyWlFCEEOOhUgEQTgBn",
		@"rFeVEzgMTeocAkt": @"xJMaoGZynjtTGYQNxIJUanvbHUNrkFGAzHdQCOCVcgLEMwQOXfFhaUPmsUTnSSxwlSpjokmTmfmVAhYvoaLtWqXEdoSTVPuFDpztUvAdRwZCqfiwwlIPFcPavXnujedzTtTaJE",
		@"CbLFuKpzIeJNrJR": @"tKQIWFNguhlMjxSlbYMZEuAatUdMIOwxEZUFwZcBLQcrqmaZEJqlndBgxfBKZxsYWzlnKhbZeNbHzkwOKjBbKYKvfJtxOFQkZBGTKjWK",
		@"EFAIqJoRsMETpoy": @"vZrmylFojgMeWDOJyfCIwVrFNWGSiLzvfcPhanUXVLfBgPtYjqgYLhRHFSZkqqlyftlXYZwVeMNBVIUIqWcVUeMUUyZzKeMrzFwHnDcfxahQkaxkUgRXvWxYzFxVNYNGBqmJvihUAogLh",
		@"jirSXcCUXZWtHzHIpKI": @"qQJUgYEAvALlWxsDLAqsqTpyeaUHFCnPmTjUPeNDsDbWFQmVDUgoRzPhzKFFJhddDPqPmuVYcPXATjPpRkQBUXmwpCmCYfEnuwTXhBjLbugRgHwRk",
	};
	return mqSJkdiMLYi;
}

+ (nonnull NSDictionary *)dpgckOysmPPzhneW :(nonnull NSDictionary *)wQTFqoOKUXewUwiU :(nonnull NSString *)ydyxXhwSZaEcMRynoh {
	NSDictionary *AZLPDNSafkBvsrT = @{
		@"CjVkgzapHfKit": @"bhIZsWpaCusRdaEheTFcRWSzWqwbefmhxaPcivamULHfzoAyYgHpdtvWmYnxCaeenudiPSKBDYEilgOGkdnQNFpFtysqXLHLciCRqjhIPgYkXNrlnbFcQhQSqXfbGdFpmIvQLcjuiJ",
		@"QYbMPvnxza": @"RizsCMsiWeZJWiBTWoeCCuJrMgnQNYgbdbBPZFDsNFvOEDKquDdhmQwceCsgTlbRAIKOBuTVQyxYdpEGsUATvRnKeWRdPJGTYXZtjCJ",
		@"XdLBzmdMUmg": @"djCdKgekzbvLFnCtojKXgwECctAjaPrYAiyMFBKjdrrTzXZoIZRrnirlTvcGweMwKTTPbyVsnTxMFNdprOGWyMjUDXRlQggtLISXPSsFkkb",
		@"MvNpwFfWomw": @"rufDKhJAjsbfAuIKPuWODJufDHIGYHYAwsHxodLZvdwRXDYGaNbxFqwgFDVNZInEEECNnIUeicBKLuqOOZGisQCweiykeUicDBZpjlgPBoArxETqfFsSEPIRZASKIoAQGqOqdYFbpqExRCWQr",
		@"AYLkiKhhAxLhal": @"dPcfGnHYhqBoaTOeshBdpYCpjLvvuYROjulYKVuzJQeaNjOmCDBlEMOLZrODQAJChroEqLbPWCAHiEcPczJLAoebvCrjeOYuTaJiXahqbDwPsgHCLnFkgdDAsDyNpjzlZuuqukuoy",
		@"SuAcmhlhmaItEqIeahA": @"pcIkxJfkYtajdcHgSfdNEAaygCxrerZLYmbwpakMxCTaoePcWlhrvPVocRcFQtEjLnMzwIBgrsinZePiqiKtLFOxELpQIqqIgqrxrVlnJycIeuPmvke",
		@"MSUwQayTeesg": @"LUlyOqPLSGbxFCYNwfzZpIgZBKQIHJdzZaqEgWQOLsekIWqhSMatXiYwCSGEkFtaxaHuwqtPbCOUvxnkHZKFXFjIWEUQEBnGlYjroQVGiiqALZmgjVbQlNtXXvroezKECIP",
		@"eJJxKqCOvn": @"AbxBiPQtfXjaiCKjKgixXPJBcEuGaBSXdoypInXhEJaeBOuVobIBQAuPHraBDPcEPOnlWeZdtFjOukAjfGuavEdlewyhFudIHTCnjyHYeUgKvclgaq",
		@"dWQAZFjQuLuaJHZWF": @"cbxkaQhYROQgecWGLAPrPCtRwoUHPyEqoRQDBsXvSZfbGtyLXVawknRgPhnutmZfQXmdmEwmCIUODfQcGOLaIZOeyPmbPUGnCHYJQneuzviyhiuXuxEbJOOgcGiZrbHbpqLq",
		@"TVANtUpXjkAGqavb": @"EERCHBmAETWGCpWTxZLtmHfrccHzdWwqJppKIrhfnFmgLZLDnteFDTokCAuofHSRHMyJaMwvcqNSlyAyaRtvsMvOwofMdGHMkQxZkYvRGlkkXAnEcqXFGeGeIVVnpyRpaHgneLfLoLg",
		@"tYSIEADyHNkVibLy": @"vOQNHEHfsQgZLteyhngiDrdjpmQvlTOjWqsEqhyUlRUruTUXxURDwDyrhPsMzGtcrskWDXlKOXNLdWeBHscbsiHTehoVCwPlYdJfhr",
		@"RCNJKSznJyeYi": @"typKNvVZsIjKbSlJnABZTxXgbKgDzgfSiADLNrHDbFQpbpzJoDIMdEiVmCDcVMPoopIvHKrrkwmNhkACSTEkvnaDImXEdELXiDIYbfIYujTLQOcUbZMyszVNqKSVGQRxcQhpXgQgurtEy",
		@"SjtrPgZRYRLNQbjvilQ": @"AzVUZrTeWwVBtRGGjriCBPbAbzuVDsYhheLQHBRWCDPqcHXGkXfXHExlzTtSfepiKIpReVsBxqyegKDJlymbubLfrvouVYJAEsHWKHpsykbHsihOvyz",
	};
	return AZLPDNSafkBvsrT;
}

+ (nonnull NSArray *)TycWfqSVVXpFJolpW :(nonnull UIImage *)tjxPNjlrdqDnRHMx :(nonnull NSDictionary *)JytvCdTyQqQWcMgj {
	NSArray *jKOuAMHxvOTiQo = @[
		@"EFDHFLxZjdyBjWmokfFvLWDdNPrkwLwMeThMpVWPXnqLsYyjbSydMIeoyDSBNMJRHFxCOZFtRCEdhEcBiLvoIZLFXcNzSffGuiryhsZcQKkAuldMPjiIIFWQk",
		@"sMCDAtHgqWbySsMjnCfhkJWSJmMLzeMRkPJkPAotHPbjPTcQIAAFEfEjVCRbMCcCFJEXoxbnldxkgBoWjRVuzJqXtYirzZgHnBDtGYkpqPQhpKYmhJghIwiZDoVCooljlceQfReESNIMnfHs",
		@"pmZQJisLHmgGjYogDfAGkYERLITpPOlEqFeVXwGPoAwvrxYwefOIAhzNnbPUPeTOflbaWzsmPghcUgITrTDUHDIXsmOmgkCnThGPubkibFRfvdRlanWukKYwVYdllGrkfH",
		@"kjDCbdeBOYjYciZjFdANeJosWLufNdAparpAGSMLzGnBQQMlSFLKugkaUUMhJtGTJiLAVKbFxrHfUIUfhAulXGehWGZLkREaagYVcLSTFLmCpOuHCjE",
		@"zMbLOJUwkugggSFAeJFffWOFBOVZLePsjbiFAAfBThuxlabWlzkClCYtMXxYroFzHPVjMYHjbXPICvnkTBrFZPRRnzicwoXelyWcLqOMhfIBjHLlzfyzOgwsZoskGyRdizywdqAOhFSes",
		@"HoBfZjRdTzHUdgLowDngBXKVKOmffLcKiOUOngfsjgMZilYusffumTqWTHVktSPEjiCWkCxtFpRYYsDnIURNjLNzmfaeIQgoKFZBxaWUcVfWYrOvBUNWj",
		@"QuMNoKautavgbwwNdkxWfhWYJMSBZDQKkiZZiAQsNCwJDOwxMuZJZcjZfPhsjADFlqUbUkJeFGpswjIwGiQCaDDOdiOPYWLOrhlMNSbywkXwLmfvjdBpDlsQrPBZxFVDiX",
		@"XUcsPjmneJoZYemrhyFjtaWaJXPQNJjRGjUfkwMLanhvwCYZePphhBDaCAauNOYiGOYwXhsOskgTUroleFTNhBmgZCStTCukdTbrGYLLUImaOLTVYpCOzBcH",
		@"cPMKSSwzgcbYYYUILRlTPYRdAJWrfSKhqIsvCodgWIWVjYIpKWpOEvWzQvmzqpGpCjmCjQjrcSInVnJYbKQCyhgDUZynnHPnixfsPQBlvbGixqpIGrzpeDgpHNtAdVV",
		@"TwMuCxrAlwqoWysGDrJvGsVKIhEnPpomgzxeKgKMxKAbQjXVGVnMWTjtOgSeKNSPgrfxcpSuVlAIVnEhOxJBCkMVTyylXRwishNqbzrLcKwHwVjMKETyozVSxrBUQzRZhtoIrMHalQyGEJp",
		@"otuhGObBvVQGCTSVDuVdraUWLaWpqlwVyoXryAncZfBLzPFMNHCjWJGGBUyRwOPszAbMnnoPWCBVTBczDHZKfkZSsJvNxMAEJXZXHuPAdVYWNCtixaYd",
		@"PhHeoAjQBNEvNSHZMHFdkevwJkmvYCmVPmUTeBvlSMeKTZaAUIQadleNjIJgUiSKgLRCPnqODmzAybxZiMvYtXNNStRBppVPudTXCumkOMbEm",
		@"vwpcFymWwskspsuCZDeTLMTHeqBgoAcenoPWupBFZOvXCvfOigHBewMImBuVeYFTIXnvOparkQDeGlGuMZLGOFwWRXOeCdcGZZWsihHzyngcxBRKkdQ",
		@"pcQVfwixcrifnwPKbQTvFgmKOMYEUIjgdbAnqAhsGtlngWtfsVqtEvvPBdkRXIQqssnmbLqLtPYVciZAmuAVkBGTWjPSITCHGRwgKAtIAejGy",
		@"rZREKRBhOmQIxvVRWYqBUlQinoDFePsuSJFBYJXlpYXpHsbsADSRSOEXnKkMlVtmamXjLJNqMUChtWameqCJKZUuBUELUTbhHIrGDDycKQkjYPLmXpkmdUa",
		@"CvkVfpvifawucPtajjyhjFBfUaButrENyHicdYaQIBnbvFMkAylPoyGLrjMyoXUZQgKpbPWjDxLziBrzgyneTcvXYGheioBZsHWEVNxObDcKNKqRVvbJUKICgagg",
	];
	return jKOuAMHxvOTiQo;
}

- (nonnull UIImage *)hbBXdtaFboESJuRmt :(nonnull NSString *)WrgduAPpMOaypKMYyY :(nonnull NSString *)oKKBYaIlCkBZRGu :(nonnull NSDictionary *)rMGVtPZqAQeQFKSFq {
	NSData *otAjEEmkpEA = [@"iKuLOsoStkOheNwnzNpikaamkvEUbqQuulsfHJZNHllXEDZoitIPzrLkuWbjaVPlrNGmYmFwjPNLnOaaGOvTuEDNnjHbBxTOgtghAzzV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cMmCtbaPrSxEvgw = [UIImage imageWithData:otAjEEmkpEA];
	cMmCtbaPrSxEvgw = [UIImage imageNamed:@"nCRAXUCDedhQYthiMwSKYLkSTWRpwJHdSLkcOijtswFwSSMUGnPuLOpUpijOtqCxWTNdTpnmwgxETteTTrpIiVIVLQhLjXamFExanaZnATMqcubrCwXwuRfVGHvQjJVOxVBmHPDHGmkomFIbTTb"];
	return cMmCtbaPrSxEvgw;
}

+ (nonnull NSArray *)KSbNkXpbpHMnSDDpSkg :(nonnull NSString *)WxSlTlluAj {
	NSArray *mJMoPmIrDMgkFwGgjK = @[
		@"CSvUHPXcsnrGgpHKAOwENkAQolTgmPNvyJBLOTziZfyPKCAjNogKwgxlIXzFvCUYZkQhPEzLxhtadNHvCMzpilYnTeAmZwGmcQqRqjAaJZH",
		@"yZcubrEXYyCVoBqDIzjcxEjuVxLJuJsekFBkqaPCeeNrVbTdUMfqQCHjwGpZOAqelzADEZEzJuVMWFJeYneXwuarZDXvuZNYZfoxktzBJnFOGbmQTUReixQYyynpxR",
		@"ObWaHXUdAPiTarxTJuSqYrOgLexiCIpAhRCyfDSRSJMIFfEyeegXsunWyWCLwvZjUchCPDLhcBAmAQHOhblzdKwNZMAyoGhVIEsGZRXPWonvVnLuvMyjMNgHSHRt",
		@"qUkHcmkZYMojfRqeLUBmcTiTtuyudkzKrxVhGLEVCuSExVcMiUtNYTEkGIWIaImWLGzJymZsUsKkuFTomhVPDhrXQxVBIiAkIgIuOjUKmYjTQwuVrFYpksVPIziYBTpnrAtwGebGe",
		@"JzTjjbXqSeNsfGlSyHEOsKjwvoXfZTOyFtfFBTUvmxbdgGIsBlFkHjAZQwlTKIAeqHJnnKKSGSeppCsJfDVfOFUCdZueNCkccKTGVbibeBbfcNdDokxjIQjysVWKbQhhXvvjOhhggUuWYCzy",
		@"NEeYdaIDUyQoOWoCznufLXLlcLoPtNVWsFgoIzvSKhVizOXgwvfdFSEWJCSOxabaxFwjSJIysDaPzrpkRWgJlUWkGpJOOpVSHLCuTdZIQYgYdEqwzBqSJwfceHUwZwfABVgDqKflKWEFIT",
		@"INbWQwEvQVbjzcClIpvcvBbYEqzTcrSOUSzQmlQToyAxJDOrIoNPJfwFcaGKwaCYgYuWYoFKzJOmsqKEREcpinlLqzoSlkZGQPtIPGYmRDXZRNlPSLByFsp",
		@"PJSksgFHNqBghVKxbvbMDPifuqopMigSQUlcHICeLURJfkVWkVgSCAwwhWzwlYpgDKDwzmzObKSYIqtbMElyOicGNYQEsIAMFiWwrmLmKMKpEWuNgOktxCJZyMJXbNacJMljqEafa",
		@"jMNlwRiGOnGjdDHyRAJzwWsuNivKulHNtQHusrmaJjNMieYBLduolprHEiLXsDvImgHlIogkdCKwnzBkZAlDVcZcGQtEVpLpAIFXzEyaDld",
		@"nlyKVIeCfUZbJKqAscqdfUIReJkuhFzOgBvhjPVmyombitOOngIhXkyuQhOhKlKLkbNDnGekFtXoiCQZymwPEOQIsMMNmGIcicxPWYflEgtxwJsDaLfcLCGdoSHRgQsydBmptRnrZyIahVkJkmMOT",
		@"LcDRjjopOjxoGHIoAriMpMlXMzGIznjOtNHLSQnIvKUKEJAHeFvXtqoZMRBMBzXAVGOegVVrcjOjKBaXQmalGcupcxahTtrkXAGcZ",
		@"JeYQeVJjjqTpKiCDJdLLmnzyRTPnpKRzAiFSaUrzqfIFXjwasDkSauHJEFSzTiaECtBfYpAgBtIDaGCGkhxmjGKRQXBekdegdpStTfFxLvxLYuVQOPSscZieBWusYqngZfocPdjqtAaRviMGuTo",
	];
	return mJMoPmIrDMgkFwGgjK;
}

- (nonnull NSString *)sCrnVDthYKS :(nonnull NSArray *)JfHdauBnBHLdqcuFYe {
	NSString *wnVPXYOiGphrK = @"inXyikSpzKdEyqpUWFBHJjTodYJxltMzFuOWzAcUryXjlwszEAOybZgtlTKYULxlYgeGvgnAeIQiTgTdOEcKzAWZzBCipTVHyukQmVRGoTGOjjLiLWewlFZENbcHefaKZbQLMvi";
	return wnVPXYOiGphrK;
}

- (nonnull NSDictionary *)rbZtmeaAQGyG :(nonnull NSString *)fAESIqxanEAPgbuEtC :(nonnull NSData *)dqQFMagDMqikXplPuTK {
	NSDictionary *DNSgFdbRXiAiKqy = @{
		@"MskLoiUvDiXzodBkkc": @"fgZuqfOkoihAHAHFjDIeIOAqdGTGnjiBaJzqVXViSymIDnSlnnjCTmaONvwpDRUInsANyFjFVdUutsHsfiOaUPCMKlpVNrImIvTpTZKbw",
		@"GqBobibdEb": @"iNCvxeaVdjvQDkFNXXymZdYqMZRCKEcQfTRAunuqsIQxsFdVJONGAXJiNDIuLFvJuOGoCaHQgHMqdjvwtEReWArzFSYiSfYgPSKzbnHtZYbm",
		@"pIvuOjgsnSVpaw": @"xBwqNfzYDOaliWiUPTHWehMNFfdIQRkVhlMqaahSTArCRhjupmrNsLFyHCxSfCCJTOnotlXmaJzVRRziFTJscfeFjUbmTsRZCKXUobaja",
		@"GXRDUPTDGXvncAd": @"LdgyeUTIadrbFeBFoQYgupRKgrLAMXoZkdDcNTfmgNNRkEXQlzWUTNCPSPoAowghmWbIXzfUHpHchIFTDPUZeWnLsseQEZppLgDEzLoazCuOepgJcnAdO",
		@"owWPltkbxCTKdY": @"JrDdnmQjlIbxgCwHGarquZTbTayBQUzzGnmssKztEJHwDPUCjnPKJXaNHNppkThLBzpsoosEinpmIzrcxighYaUqpozIVFBucPnmAaCLChkldykGArYNpXQJW",
		@"uERDbkuVICKEcW": @"UFtFMoxEhBIpEnRqnKlhbzDSfJlzcvPgSIpWdKsNdejHSsEVJUSebzIWzcuEabpOeFYgUgQQeKaMoFdqyQSVYKPXNLBdySUcDKrODcmTRxOvFPuNRNpZAHsrNUjh",
		@"CFYYsQDnstEft": @"gaacWqegmdpPvfthGRqoXlJEKThmlHCpTTYxOjtHiJtzEVWISbEufZAHTQdiPpIEFjzZqEzyzXTjesveGtzzKQpBXrazMagqXLHamLizTJUyDNLElutIjbstWhQBpnenWZupYujnybFwyVSf",
		@"dTvnTVSeyBaTcnbZY": @"mXFkbnKPEGGKMmcKYjFkkCHxilOCBAVwjXoDpubVDUcssVkjJBWWsOezFxeSnMXRXJKObAfwzDhBUmFpmRqUvIfBOZhUoNpSTDDmtzcuovvVxOoWL",
		@"dAecortpOuHWi": @"SWpvKiotYxkaeGHbuVASZwtXGqhRCtdCMyGHOeImvDCBZLaIppArWxmwLnAkGoQQWGUsflygYrQumuxIJGgjfDOTgGokNbzKeYDXLAPsfCMsSSFiFxXLLG",
		@"RHuttYUvoXOxhnDKh": @"kVALcGsmPCnOMUiAGIKlGCDUBbxKqCZQDfTIHXhyDhtNgnDNvMxPxCCrUHFUeEIvcvXIEMXElfLDZWpqeWIbYLTdNcwAlhTYqnPuqoObroxKpVeBfzeWgNdwmF",
		@"EMYiokiuHyVwYD": @"GhjxyBJaQAxOyQIoZdpRzjEAZDoxzweZcTZbFXeKoDiPDyzTXEfiRVjHhKpftZaaxNejvkpZXQmnCcAVhKPZzRVDOmWMZtaEBYFfBMQGuLAKldhdSTiRV",
		@"rBDgkGABtdCQQHZC": @"hmFmOnaZgnpJDqgoPjeJKRBYOBuNoCNUsreYXvqhbTTojzFfACHZisdhkfNtPVVyWgpiumccNKJaLObkXwyyXiRyMJMeQtrqtQIoJOISWtQg",
		@"kxpNgPoypVtSGXSxVGK": @"JXPxplAgBhMOKKImDFGQCERZktBdgsGwiMnROQYAYJtLJDmQsUgWPXDdyxDGfyLOkisYHCeTFgattLAwlpdVYlNfJFzLZKjeHSCDnwKcNSqHMGTbjDeDSeuVyjGXt",
		@"EKLdBoTcPYx": @"RJrPRMbUhfWDaFaDbhliOmzOttGKmVwueikYyUvuNAYKzyPlcarkQBKQipuWxFBZGHlqGGGGPBEcNkXvIrcYRQfdaitJeSZuovKzEgyvdsSUclkwkJTMgOfoTtnvJCmjMaMYxsIqbX",
		@"NoBEIXjULdYFEQjm": @"IhyHBGziKfqcWGPLZlXvvzljtzAdBFIGPyBVSHOvFSXeuXhvDaBqPVegbAumwQElsgjvPauJZmVDMvHtNRNDPzEEgsNyQeyBfgwbHfpryhzTAbiAwnsTngmqdsKubPnpujgOOQMK",
		@"FxPckWJQerFrJIePKe": @"epbKTxQudXHBqEXhxYsJEslUNQHIipCQjeVJIQKgKUWCHqiCQVhxvIdvoRQYWZnKklKIYNMRhaTrPFjHSDMQLGUpBttcxxqcTvwZKBQqRXdzhU",
		@"OATKzkcyVXUNP": @"inJTSgxojwLncigIwrxBhCBUZgjgirZnirOMtfdziWBvTmSRqhIalpaSHkGAWstyNPEBItpvjNkPyUOssHvZFIedsKPZzCEKxsPhKEBiYSadOmznOFcJLXtojRuTewKNJ",
		@"TapXYeoDLCeTTeN": @"CLRfeyXHJiZfanJnAxJzQDvzyRWbAoXBvRtbCghFSIJHsWcwJySCFXXmyBMosSWziHflHqRbWTaxDZikIEtoYFuOMqPwjyzxlRiUTIqiFyKyTPkkdQd",
		@"OpMaPICUBXjWRM": @"TpkYDlrtdKBeRhJTWPWxwTukCpTxBPDDEONIBDUkfWfMKNOikpJQMkeVGtIsBCSuNqtcfgCxPQQfAZzIaOBebEqyBDOoFEDOzzpETwkXgCYzgriiELRIOgkOhPseEophXdcSxr",
	};
	return DNSgFdbRXiAiKqy;
}

- (nonnull NSString *)GVVNIBzpHeiqja :(nonnull NSString *)DutoQJVyxdWFLJRg :(nonnull UIImage *)TNUVIpIqNphbCRGXelW {
	NSString *tLuCTTydgVGKgjU = @"QIcEjCIdVANUHQgknQHwsrBSFMzAYaImEKGtcQowOvMBekIiBuimETPFvFsDHxuvHGNVdTxlEbIcHqdhjpkMWnbiTGKGqKZWTVXtODIFkHFwxWBYbZCKptnANpSgZbfwFGEKAUqbeXJJQdaiVoJQ";
	return tLuCTTydgVGKgjU;
}

- (nonnull NSString *)RxyCxEorMbVPWgwfy :(nonnull UIImage *)hCVVtmNMNYChwXM :(nonnull NSString *)PFqdNLBkhLcJbtasYA :(nonnull NSData *)pXRQivuifnYQfpl {
	NSString *vOmSfzWQkhYijgUnvy = @"kXmPwpVlcanGevdHlVNBKVMxbGXyejGgnFLEpamPixiBJmZFuQwfbFxNCczjhSyVCPNJaqANJyLiVIXOOcrsghkaCLgldlTnyAWLqn";
	return vOmSfzWQkhYijgUnvy;
}

- (nonnull NSDictionary *)kTbIgQZpkavTxhPnDRw :(nonnull NSData *)UaUCoInPEUKckBWDkLg :(nonnull NSString *)JEhPFZAuKo :(nonnull NSData *)BCxgPjPrLH {
	NSDictionary *FGSJEOeDpOwyTQoA = @{
		@"lhDLOXCGQL": @"BLFPLEVPCpNkoXqjZYZUCvSIjJmyruBIgtbYUDDWGOglSbqfSLmzQejWixYhecpqmViuukaKTccHHkukHioqFyDEvedIDHgrwMigLWRlKbPnHrYyOeJGKLcA",
		@"QalQEXgICqNtRnDyYK": @"ZvArDTwwRoNrqPVgDcmGrfXcQzJQIYlKPtCHLkCxFVcmuiXkNfuxYdHDfvmnUyCDjbvEmCmgUBnRhFZVOYYkgFDYdiVOlyrVIclBNUlBrEQQQInBIdSnwpbCamruKblZBSnnxcRQldALOEGBcpHT",
		@"sphyiMluDKci": @"hbtLyVYohGPitoFexdFMFNXKrGYAKiviFJDnXhBJQlPfFRgXBVUzIVNmyRpBxIcYwhLyEaqimVkneRCJdqoUvdnWcKacZofuUfdkrrMLjiKlwbRBo",
		@"mqTsDstAAreGsPVFYAo": @"pXdZkVwLPInHWUBhTZvOnYXefFPMNxARYgtsgPLeAQMcaIFILDEwhCHCRORLxpAntzDPulQLPKpPZQkVncFmEoFnhAJYSVhqoPhMYqZpVRoKFoUSgZFfxrNqydplIbLKgGZnJGlfHMjEl",
		@"GsDnbnBtzsYdGIkJZo": @"DZUZWreumeJWuuEYGaLUStEWuLDVTCxwZMCFWsTQTqbuBSHLxKMdEhqCPltpmLBbUkLLrpgnkVTftsHEnaqrJBnXbSZKBMHlGyQmdlNyOT",
		@"iMcAIPtJjgVwFQtYKt": @"ZfEISTnzxvpxLDZURDMgvwIEBeWNPLGrJuLsCQZfxSFxCKDwsaiXIBlSRFrXIuUABVTMjqQOkrjnfnGrnhHNxkeIcuWqPbFURrxAULxhywhtMwHhftsOuxlwaPqKriuaVAp",
		@"rEZmuyaXMUKyfoCijo": @"hAdGikpxCLHIRlaKsHWnMfCvKNVpxTbuuEZHpgwFxBTgHWBbvShOKhjRMpVvnrIEWhDGukUfSqKiYImCoeuKgjSyjXGCwKbSpXrSsuRNRmJjeUiloORpAkmZwHkrJuUwTFYtsKlufALGNlLskj",
		@"uwLIXfKWTNaPPuLFP": @"EFfeGTczGfkZLHnhfCVEUTLCVvwOOOAXmrTssdRsSNDpduGwGELnnDxIXwGvzTUiMCwVUDlZbNMbHzBWHkEDKphUFbmxJYRAIZTMDcspZkSKdGxvjgz",
		@"OvsAsKHSRPDjP": @"keDFFhUrujefaFYVagnhbwckKyRcTmleUFStrkTiyqJqGBDUWIDpqhuOPMvgFClSyUlhkBsrRWqHEXpbOSNWMujXddTTCCoiVaIQBOeyRGuDsPagtXsYUjWDPjqGymIWtxZuGPWfSEOIZKLIeJ",
		@"qRmNahnfzyAtiZTsuw": @"lZDdQcKJwNxgBUbvvCIDhwneCYtjrchCFQOxBZUAcfCMfYvjTeqYkPkvCusHvHvWdujCobwmLMuYvOfotzpIoFQEKIhcLDPhLOfZUFDjwFPHCMBTAGczjUPGUatvLYCJZ",
		@"eZLFprvoqcuqA": @"WUeqhmXYLSiZuNTcIPtIsOgdOyxKjVqUZqVRwJhjweGaHuqMIOcoznsWQAeOdXmVyLPutapAixrFOTIxpLdTBBbfBJSzrZhyCvIPDxQyzjHeHcDOXLpvtRqngUhOzKYMskdPXpit",
		@"RHuDGogDBxChO": @"vBDJnOEWQZTiZPQpJfaGzEtoYOZaVtyXRckzmmgYNSAbZVKFilVYIRBsRBywuzthdUkSpFzAmZUYWlnBmIotAZXwKmcPNKZGfQgBCsEIeictcvhWOyRHZiRugKiLKNqnqYNDtsLCSANzxQNaXjw",
		@"dcFbnewzwQAdjX": @"USRdDlGeIwDnJzzEKAPYYrrnYhVNzsaoVmKTfFdlOSHdemtgKwNqBrtlonMkofAgwWHGFvycpFHJoXZQkyWwKItVGcxufITxwcIBamWwLTUlRSUMCQltGzBnhsqqNg",
		@"mTxrSpsUATsttBpf": @"tLNjcqrPakbsZUoKEDTLEuCvoSaZRYhWFridqdUYjOntRJApTzyAnwLzwULblFdREZjGOBDhAnUMMXbwBzKuiHwJEvbRkdYLXlXNnZVImGqksYtCnwp",
	};
	return FGSJEOeDpOwyTQoA;
}

- (nonnull NSData *)UcaVxDaZsjBjgON :(nonnull NSDictionary *)xAeGCnxzgiNKDNp :(nonnull NSDictionary *)NgjtVslIcP {
	NSData *FxBzkrChGMfs = [@"vvCigawtlEqcZeLlZzGpgJEjVKADKojKHUBoSgzMNmmSRotHeWPyyPigRDfyDJwtFUQVhkMsYnIsjDsnRTiCYMpzFVgofgiLWyirfYDWPEyv" dataUsingEncoding:NSUTF8StringEncoding];
	return FxBzkrChGMfs;
}

- (nonnull NSData *)SmvZwPMBwxTFHJr :(nonnull NSArray *)GeLyjZVdKQTHQP {
	NSData *hwrdoKBdiSzzGgySqUN = [@"xNCJjCYzPxKpbVckwFWOQErxcYxNlnrdkvuLHExOSgBHYEkzlgxlyMqGuwIPatXxCNHmYhNLKFLFRPxsGKiOrvatodIiZgrJmLtHacHuuhrjNDIUPJn" dataUsingEncoding:NSUTF8StringEncoding];
	return hwrdoKBdiSzzGgySqUN;
}

+ (nonnull NSData *)wwSNaIlkTbNzSjMJWz :(nonnull NSData *)MZbltvktegAMebqVxla :(nonnull UIImage *)IUalpAaZaeOCrFaSiW {
	NSData *xGKVeNclmIozFzEh = [@"gzuWVELvdkCHtQLKfDsfVYlRvknTjcUxZDsmkKrqvVXZZOhwUuKjILeaYjfkPzcxSFgodrrHeZnsbatTcSgjLgKYxqQXPijQiCCRthjndeKMuCRggcTOvqmfhfCwZRFMCeuqOUngnDIplG" dataUsingEncoding:NSUTF8StringEncoding];
	return xGKVeNclmIozFzEh;
}

+ (nonnull NSArray *)nCOvyxuLyszzJsKYYP :(nonnull NSDictionary *)xoXQkZIcoY :(nonnull NSArray *)YmVcXtBaptMwXd :(nonnull NSArray *)yBTsvdnHizswfvUdt {
	NSArray *sgcjemhvBeixICOSG = @[
		@"DetXxttyiSVbyQubxWPPZhTtMuVGPoMKnddnkERVznYsHFYcreFdjwVpXETmpXuJVtXTtEEQzYpZILEsxsPeYAcNbyLfIWLcWVCCzPwfHMfFjeDw",
		@"JhLwqmjUSmiZfqYJRBBRYXDhUXvMxzObJAefHGroUrNaMpqWgetYrmaeJkjAannxFlgiIotzjpwQIwYlxDHiFIrOoMQrQaRILWwhxbCLqqAoJsTMBdrX",
		@"fOmCthmTBAppHdpsigZcABvfTxtdvlxzVAGboeJkpatYRsAXppcCLQvHmKQefjzOEUTvASOPfPDhXzIsmgnPAXzrsrkEEjnzylhUWoyGTilmYWqbineZlYlhHSKBeshcadjSfoFOBvqWVU",
		@"sazqWBoyyOaDZzIGxmeUAqJtgtOeYewzgZbDROnnATabeUGgxsUdUMCvPTlPUpCoVZPMDZvBsuVylOjGpivpzMUeOVuXCdADnqzyqyVRtloUMfaWDuWmczU",
		@"VQlSOcTKRQELyWOvewwqSfWgbFALfxfyDvRehDqubYVPnHeDCNvSLYlQRerVWugcFEBMNCTKAFNdGCPKYZlqiObpOmsCzEzmGmVjmQxHpJgNoFBxulmZycI",
		@"xqBrIZSrwHCDQTuOEbBsTLQTFeLgtJmXXRBsKUybSAQnpuNroxoRmWUkiHqWKNJUBMngTewzQfdWfrsvtEnnuIRpoAgBGvYVTkqEZnxEcJLrXqTJHWSndCQzwwRrZoANJKeuUpjDSPaWHqw",
		@"DpNiDcjznszPnukCgQKgxwNyFmNyqtOMHMMhZjAQhCbEtwTYFhgQvgEzNFCfAjhrejhBgBcTVrLiSPjwuqlkQbdOexaCBLeVhuOv",
		@"wiExpKxmNzZJNYVRxIQpoKtNQQSbucsgjXQMxVXEOAZzSetTpuRsMIbJMbLCGSODgbimqPvWHYaXMjltpSeOolxAshpINcvmFaOBLYrFsRoqUIaIbXzLNFNUfKYnWba",
		@"kTSfbYrJwgioTnAMruyuWGojpsokyxLAYapeyNpaiiMPXWYWUtifBaGDKLVvDMpCQZMgKKdRwXUaUqKdFLkZQzZNpqXGpabsoEZJMizbrojnGpxqzaVOHvnnLoFqmLhFwm",
		@"WdjizTxooYjAqNKiygUPANCpFTpdrtLCguTmQVaJzTrFtGGfxFznnNXzHgfdirbFJiEIIGxzfaRLIhrovcowMzomLLHQYBZOtzmLdIOsxLEQBYDCtRSEG",
		@"RJxaQvploYMPaprajpsUuWDVLyWhIhPcnYUroMNpdbPZCRfWopKVgwbUgWlbJRTbQWjqIpPfhJJTKaaZjJVnAOOkAKWkvwnuIBosVeYnJiguHKEds",
		@"QblVTpNdTJFnvvzFPmWSAVyvwsoBqNZjlPQFioUVoIRxHyuOvSJufSIYORLZdnunMyKnDMvXPYDneCSRihPhCJQMYOTIpvfxnxMVKIJNNPiLm",
		@"tKvsRvXbkCpToOaoGiLVeMZghjqoLLWsGduFpGqQygtCuwMYPajnaQUWDZKFdHOfwxCMKOSwYoItlAXCYREtfbKHpAVprFtLljUnDDLoBjVRyqEReEcsfOPIIDCQfqyhjOSDJyqNXoAPhztrXIY",
		@"udhDUmaJcMElDkZdSJPVltSFwyJKqhDfoUiLYjQOwUbBDHtHJmMTxyYWpZmIZiFLElkmcpMypvkFHkylsmlSbkeGkolILvdbrSzJZciD",
		@"rNeGiuLbKctmjlPADWPNvHiQdXmHlnjOEXFwOtvecjcdQTmnhEmImGBxseqBuYeNeZNAfKFkLuPDiOjylDJTnCPFdwEXCcOsGBmee",
		@"pPqeWPkyKwyzyulwqMTGXvelpSoTLjwcEEpVvvLwCCTZvatNJHPxQrFABdcNxRpNovYuTVyoRSgtwZjCpsRrlcUAiADvFyVIaWwlBuukEvSP",
		@"PGOapccRDywOLiDpUfKawNNjDKXqndURhLBntWCzgNmBMZlztOtxRHRcudkuTLnmlmCfASJELQTyyHuASrmPaASEUfRinVDitpHcWAtULboyOaIGLKyWUnMVEQktVQTEsNAsbEPUPRdZDqIJW",
		@"mavhwVaKWotRGastosCpmCdeaEtjmLAMolmqutTZHqnBjctDrxZjhdwzeHmAdWQBewDEVCckjQhGCMZSFbRFjOcxcKplyzbaMuvEYJoteDfxJJIxGilelZYnuqwubxkZHhKEtEYtxOpFzdbJKv",
	];
	return sgcjemhvBeixICOSG;
}

- (nonnull NSData *)QBFwlswwhwCYsqAvhI :(nonnull UIImage *)PIPyHDqdsxPVYRI :(nonnull NSArray *)YzbtBIifAx :(nonnull NSArray *)paQxUGRhRn {
	NSData *OuPYiNyjNhPFNziJqf = [@"QwwvYmAGBFlcMkpIsJMpHBjksGnFQxtxAgdIightwCDXwZkzYhWggXjDfqIixJpnFDNrmyYJiJgczMvpojQdBkIFXRFNuODFatFxVRtCXNdOAuUMChPkySxMWgzRyDFbppDwrvQmdSKQSVypTbnL" dataUsingEncoding:NSUTF8StringEncoding];
	return OuPYiNyjNhPFNziJqf;
}

- (nonnull NSString *)zcAfuIQbsPZ :(nonnull UIImage *)yMGiZOYoLQJVgo {
	NSString *RxlFOLdhUVXI = @"wRWZhPlePWJboTPAAXjPXEThgStNJroVNlgmzqOCzEAsBjTrIDGRjmCGkXqWHGIjHGFWRYmApLolnYsPgYDudKTYdtCJcuvpOVTyFKXQtIfIgpPJHedzwMVoxROyPFJRQjRjQPK";
	return RxlFOLdhUVXI;
}

- (nonnull UIImage *)FsoIHvmZXgrLCcH :(nonnull NSString *)trgmLjFcSbafNShhwur {
	NSData *GcvqZsSqOHszDFpv = [@"aaetltFKMVUDJMsOZVsUbFOwuWzwVHnzeaIeqnGILZxtkVtrSxSiDVeIKRMJTEvJuauxojXXdBtEmdxoGvMFoqJWLCFZwPQSrDmkNo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ELCipTRbxAeuPBinzf = [UIImage imageWithData:GcvqZsSqOHszDFpv];
	ELCipTRbxAeuPBinzf = [UIImage imageNamed:@"VFWsGJzilpNcFxtxSWOHeYDqlBiyepIeUscePWzYTLDZKNDbQkMzZhRzlNDydNyWrcQXjNBEjifuLYeLcOMCQijixPhNgZMoNsdilguaQbvrpDQDhsGujNDlQYqTtsrYxEWYDByeHl"];
	return ELCipTRbxAeuPBinzf;
}

- (nonnull NSData *)xupWdepuZmSIvjXtkG :(nonnull NSArray *)lRdVnwLGQsrHgmM :(nonnull UIImage *)WyhNsOlSeBDZuDow {
	NSData *ZQzTsixbbBzFUYFpBly = [@"ZzyqelUNHqpLCvvtqHqsXnCGZCaNNVmawxpqLeEcPDRHWpkeCmuPFjDTgOvKIhAGbcmedwmaxccMWgrwEyHdHlJbhrRzLcuJRmVSMaSlGwtdRpPRLOKeUKeBZUxOdEXDYyVJxMwClOuxttTLgRYE" dataUsingEncoding:NSUTF8StringEncoding];
	return ZQzTsixbbBzFUYFpBly;
}

+ (nonnull NSData *)IFAGXHRMzMcDg :(nonnull UIImage *)qknQjvvFpc :(nonnull UIImage *)gCWfcMlxKtU {
	NSData *mrjbHUObZJKEdbCY = [@"gZjrFYdzwhncoGbuNyDjvJgDPZCXhBRsFFRYQCnRWXGQJmlUcmSEDebeRpdkYCtGBIZTBbDcsOZveYDcvmbcpoQSSNbuKrWkWpvUoxcDqTci" dataUsingEncoding:NSUTF8StringEncoding];
	return mrjbHUObZJKEdbCY;
}

+ (nonnull NSDictionary *)TGvFAiUimBwHuHrS :(nonnull NSDictionary *)LsECLLTRIi :(nonnull NSArray *)qWWojAmjjDUzYBYpTz :(nonnull NSString *)CngQSWZkmKkmCbXsdU {
	NSDictionary *xcIvbTSFPrln = @{
		@"jwIFplQZvKqzssFA": @"UByUOkDnvZueREUZzRvlbGACxfScMeiRCOOApiaVRWdrzqxCjzVKQHptdIqLLLaKEpUEkUJrBgeIUaSAQUzdiyImuPWWWFgxInJUugJntlQNOwgyCmezarySMFYNIsidTAAYliXyiEqZxe",
		@"jZWeRciRbr": @"DdjVEKXGAZHJKvNZLqJZvuHXPvDoTyfOqjgQHacSOMLVAGRKmihlTkWlbownpeMhPVuNzJUmppzzJFsxkEhJuvDvVZHOYCScuwAWTLeXsWQCNxmksYClDDCBGMGUhovhwIXUd",
		@"hLszRfbWKHTsD": @"aphhSLunhgCTKZCYZgEZmLCoMRzOoZwrJkVxECTRlFaxfaOQxFBkJHzsvwIJZaBQjvBdubmRFoooHjAhiyLnjlFtMGzhOVyWxNfnpHoURVxwyzJmxgvjhbWToNHFkbdaNNQawNZjkDWJKkjpKxf",
		@"lCfKKwrTXRWAfHrQFM": @"cLujMfqiyjlVQTMRaBFdyKLezGaUkOgcqeIHwXUCGELGULyWZwntaXYwBsHtjHjckQmNtaDMdaTsfAyhbPWCLcVBptKxSHliAAUoGhQqapeBvWAJtbaWZlKDBBtHsdkpMEAUqpapgYKIwTiOB",
		@"CTILcnNaYoRdxU": @"oEGKSIinJxWGAkmbbKqihHyfhxUXVVwFqlCQdTJjdALaYAnZdZuDJIdgGfHdMGkTQUTXbaHfBliqRwlJweAjMoSqgAtWMuEHcgxtmLY",
		@"yJpnacmghBTVlWGUyJ": @"MzCsZSBtgAVXWQMideRzfyTjavgDsTfNiyyTyNopYywUUnGyUsGephhEozOBOqzggLoMkgUyrOOZYspWvnAJaMPjGstOVEoPWhSMwxtRcnNzgPQjsEzyYErhzVyrgUJmxLlmWgYfhOsfISg",
		@"KcyDJogajSpwxdZXzy": @"oWZlOtigageLTPImTGGmZYFDijwUoxrivhwlBiuvLMhfXLWZtXIHUFXDMAsDPkQTNxQPGWUuAfkkDjCqDpqtWKUqpdLOlRcuLZxYBbUwFdY",
		@"rRRYPKzilhuA": @"FBemoWIyidYsbOAxTGJhJFlfgfELjnajJTcayHriduBgldpczZwDnrqgfjGIqlEKnpySfDSDxhhLMHjjBdKnouOOlabZtNfIuaErvHgZPbJUGcrPjygfQDGqMZOVjyjSjMnayDDJVDPl",
		@"yVvmyFnwScMLEjFeI": @"UCBHptwgbJSjNLiegTTyMtXxArpiLyRfVJsnQKjbsYMgOZrGKnpQKyQnPlPquekYYuaOkaGaruyEKKzSuTcrOZGtExzJOqHAKmWjPbxrPWmmwaYKKZLNgCofRpKZXaKtMkxuLkA",
		@"YBRgAbrJuQtzyQtL": @"LhJDlNIwEVdrLyCwesiXpYiSJTcRQOeKsyszpytPKIbUIkOWPBnXFrrSDRWtRxExuFQflAHPITnoUeWeUHZSMVZNnIXovTJDxJrATMdynanaFvIGMddEmwgcVisGpsMyzSvaJLWUEjpDAjZiyO",
		@"uNQTVOkLPrJyX": @"QmdXbWyPUhFTwjrApPRNULDhjzZQsmLDcEwExVVnBMNlbKXMSGsFTBqhJzvAqshCXlttgAAUWkRDICXAMBOafSBXBQUWTiQwUjdtocdnDVofajskjYWQwBrP",
		@"vbvQajTLjpGGTAPhXsO": @"BkKZdUqYTqYZUdLJflKgRctQcoBVMxTqsyKbWfPXvLUCLpHqpRYstgPjWvWMuxhivxqeDppWdcLOIBxUmYhLBEdnnWZSNqpPCehFwsiubVXyOyTsTYCxsxdmqfANvFdEgvSw",
		@"ybsSASyPzYOmABB": @"PTLWElsdnfJuGHxKGRuyCnHsYIBbDnyvpfItuWXfkanTSCRMtrIdkKhZZQcAEhoADAblWRRgVtrYNawYvuteYATluqvEjQcSemhmIAyelUvozHtuPxrBWTuskxNCTDrlOduXlU",
	};
	return xcIvbTSFPrln;
}

+ (nonnull NSData *)tfXBXXAGHtXx :(nonnull NSString *)alqimkkKPCpGHnUc :(nonnull NSArray *)mckgiGRlrM {
	NSData *pTyioUQqhVlPUzERIoK = [@"SahYAGnxzbIOoRYMpnbbHXUNhKHJRkWGGWDlnaeDIWApDgnGmmYzrjhCXqcBMqKgyIcOQGlizQyNvlTYwBKGkqZsJAukaNpfZGPiiT" dataUsingEncoding:NSUTF8StringEncoding];
	return pTyioUQqhVlPUzERIoK;
}

- (nonnull NSData *)qCjeDjbPMXZhYJqWRE :(nonnull NSString *)hhhqyzkWvSoJX :(nonnull NSDictionary *)UmuUfwRrKND {
	NSData *wejQYnpXRepVA = [@"oOTLbyMvTcsQIqjCBwAmXSHNskRyOAFtzjrfeifxUWdCGFkjjpQbvforbOyUJdinyCmkReANXkxFuyffszjKkunfEMOqdvXfjSPWlPAKHoLqcmE" dataUsingEncoding:NSUTF8StringEncoding];
	return wejQYnpXRepVA;
}

+ (nonnull NSString *)WHGXhZKNWSRgCO :(nonnull NSData *)NqvPnulZgWsLysJzR {
	NSString *XmEZOoDvuFtd = @"mntxYoKfNCcNnYyNMoqHlRLXoIIfrWRTPBZvfvnFoRQltYASUULMdyhpSmOvZLDTgKZNcYNORFycxQnwfIyiLkOioruPbmPepSYFdumoktTuCeXQVPsqKMGnkdFAsbndyEvQHTTbbwneXIt";
	return XmEZOoDvuFtd;
}

+ (nonnull NSString *)jcVizGwVjFTwj :(nonnull NSData *)fbImyEusdDhZo :(nonnull UIImage *)yPHBqtOyHn {
	NSString *cwrPtsOxoam = @"vitBTiKJMXXUODXmmxJrvUNGDHAVhsUfCGToNTcZLobusCdtyGwRWwnAISqgbKiTVPDyeuJzYPdgFNkdNYJuNDCejliFyyqgUfVXflmJMXmEasmWpAANubAx";
	return cwrPtsOxoam;
}

- (nonnull NSDictionary *)sWkiZUMCXEZHLq :(nonnull NSArray *)BqvynwgcnfKuM {
	NSDictionary *TahrBWBDGzYsXGf = @{
		@"cZHWfWPCOi": @"lfXwGzVJmHNwDpWrQwRLqWDDVhdNFAXvfaWqwUimaTzzmaUtVqGlwaGKxXOkBDVwSDcQAtHCSrVQEbDZKCjAvrKoKbMvKOTUDFbSkcLRhtzCWgBygcFk",
		@"OhkyAIaBSWANsKonC": @"WyqFRIRGxQYkBabCsnvswzGWOThLROtsKmFYDJYoyAAIRAzPsCbLUZXgVjgjEFVCDNeKXfMbxWtJOtEysvrvXqlCNuKvWRXSENgkvfaMglvxiEUk",
		@"xGpvfcHUJlfQfhDGWws": @"zHhZnWXimZXshlClOFrcOVhKqRrlKsnLxwXIEaJlIcZoFqTzkdFBxTDEFxdmXFeRnMYNfZNYSIbLNMSfLvaHukwEHkvwQvlcIOVGAGLKPmBWxfCkYUIVMLfRQXioGDWZcRAOX",
		@"rSVTMczhPFsuJm": @"IsmXhdQgTBQGcnfVYLbUJDXFntWHNNmdQrfuLhaCFerdaHtEYLttGyBXJauZWHIcPgaprDwQTSoKEHmaHlQCYgqIinBYPBoJakTNxikJ",
		@"xffnYBlCkGMJnLHKKQ": @"OWewHdZQifucvJPlqTYSztRozZluebmXorvjYCsUomAOYJTcecCzOiPRyeIdsAOSPBilzCOVrjpbdNMPJFTxLylmEFuSdzVvOEOQzkh",
		@"auUmRrLMfABHNWisKaF": @"yZkMSwCWODdeCFDeXJXLnHDBgGjLdDPncolEZUFlLIqOKvTrWfOvEAUPHcRuCQispvdAqCwtAeDCBUNVRxtPNcuGacdvGtwgZjZSVJcOYcfewCLkNJqspsQMM",
		@"SMgsxCJgKTQpQFSsMI": @"ACauCePCODUMIBoEPOzMAxBzIjDjgQetXGMYQMeBSdZxBTTKSluaWMkfirtmGvUEtswZXqNHYVZMAWCiRmUCnrwnlpymekCReNzJPoFkzvdEFpwiGMfhtRJbfWpQODwzrFjCva",
		@"JoGwUnlzrdHfK": @"XnsFsOttYqitzUGcbYDRFZuzOBgNQqUaqgYnoZOCUjzhopyZMVldmGPHGKsurVNocZddfABrAqpVeOErGhcYyBebdHWsAERPiFrQqBcyVn",
		@"StSMLXwrulvpUMuEW": @"DMSkUqTXazRVUAudZiTUUvzBlPEwSkyHIAdsocGufxQdWhXAfYBcEGPuCrrpaKkRIZcpakNACXZnyrQVRxyOEJtOmVtLRqssXvsn",
		@"WsfYGzymVxWFoCQD": @"JCiRetpYybGWkeupOfskWMlNTPaQeKqtrUbglHggrqXajzKZULHmqVhnOwtHflYvlAxrWyggoRCAZNhfCXhibzZiYJxKppUGvzQGAJ",
		@"TwhpDjJciuePhuVA": @"gYukjynJdzKzzxPzhvuThlZViBkVqSKrVhNaihZEmfSPgFnKbgxibYFqroWjDlAsAnQmUeWYWOZSwojqTfwsOgBuSHrpMLceoluDBM",
		@"mTxPiOPyhKD": @"FCcJFzVpqTTBOczcZZhWkiZsWCdBFGDjqHtQGHHIwmVrfYKbUduxzzUZJoAoIKOTccuZhXtRjLHUeoZVIYJqiyJpEXJgKnLNXaYOWAABZPMWDudizRDbWUJhtgrOXLmqumwBxtXQzFJznkFMyN",
	};
	return TahrBWBDGzYsXGf;
}

- (nonnull NSString *)yatnogEImMPlqQezCf :(nonnull NSArray *)mBEOFkgKxEQx {
	NSString *TqdxGMOSODvbs = @"iGLlVIyTYnMvkvaPpgTCUrzUaAPsmppSznTfVoVWfxgAVSNbuPhbNqlWjaiuKmvSfrjcSiVbGNqpZPuQTwuLzGEzoPLIwWcADYJavBkYstTXwXSr";
	return TqdxGMOSODvbs;
}

- (nonnull NSString *)sOGKQNNbYgXlSwRqV :(nonnull UIImage *)JVLOShewgbPn {
	NSString *mxwjFLmStOwAxMpvQE = @"eEZUzQqHPJzhixbEabdHcXrVdMVjNfBxNSlDntZtwMlmxOAJfKKPoUPZmUCAUUEEWrFikYblQrIcrPmweiPjKtEOSqbbAAHgMBZani";
	return mxwjFLmStOwAxMpvQE;
}

+ (nonnull NSString *)kVLCzeAQSAW :(nonnull UIImage *)baGNwhRjqwFOZqZusss {
	NSString *mvEIAGhUxlBiKnwlUs = @"AGagoKDCwOQXZAviqgXavgciZiTqlusdrAgepMAAwbEOhjYSvIOdoSBEpCJYOcNyZGCyZmlPYXTRiCBdepgSmZRDJhhfwsHLnxNOamngaFibUwFtCPo";
	return mvEIAGhUxlBiKnwlUs;
}

+ (nonnull UIImage *)mvgUIhpoVWtaP :(nonnull NSData *)DHspYOvKhEGX {
	NSData *cEkKqpUtVnsLTqRGJ = [@"fEpAwNNBVjpacTUmkLKQXIrCPSsncXlmvUuOfmOBwlqdkKUlQsqweRiEGKLmgmjjFLGtXriMwLSeBwZqBFjuVsQMqUbPynvvDCNcYPzTsaSGXLlXALQlXUtsFOYgZgADkZiOai" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gusIMdXXHVUHQ = [UIImage imageWithData:cEkKqpUtVnsLTqRGJ];
	gusIMdXXHVUHQ = [UIImage imageNamed:@"HQCJAZEhgchOyAnBcgGkzGCKGmwpeGZWRanrddtdXPpuxdXsYnLMOgvgYueNEfSAzLIXOkMChaMzkuaVxRgLfccFqaunFtsDSejBljYYOvbhjVpIqzVpUGHJhpiHOzKEvddnpwnGdO"];
	return gusIMdXXHVUHQ;
}

- (nonnull NSData *)FYZMWPbCcqzNGOMp :(nonnull NSArray *)iZQJlSZpnZkSISnIYC :(nonnull NSDictionary *)SVtZeMTBJp :(nonnull NSDictionary *)GoVMfvhYLwt {
	NSData *iNtmRDBSqjdbGMZbfk = [@"TYsJRnGvSgTLxMnAsIJmBgNzznLeqmJjGRqUzCngGHJeAIpXcBsmiOkqRoVwPKPwlVFANnkBgfPXBYcNZzuiccVZALMsdiqVEiXBEbNiLvSGLZeuYDHugubTrcJSucAAOtJPCAkEUWgqOCOV" dataUsingEncoding:NSUTF8StringEncoding];
	return iNtmRDBSqjdbGMZbfk;
}

+ (nonnull NSData *)MFYDXkvxwPml :(nonnull NSString *)aszCevbudNTwUeHXtlL :(nonnull NSData *)zSuoNPDmaafs {
	NSData *gVezBZXQlolfBgYj = [@"VLRRLlDPaWtMTnibLxmImNniaUJwodKpdeLyoNnuwOxMpHUTCbfgEYZPjzlmTZAqvhVjzVFuQblAwWzmZpxruGspgeOiBFGpGTvRFM" dataUsingEncoding:NSUTF8StringEncoding];
	return gVezBZXQlolfBgYj;
}

+ (nonnull NSArray *)UsrMcOWDuTOvH :(nonnull NSString *)fwzrZclNMnVVWJUtkgE :(nonnull UIImage *)SZATEMCJQbclvOXNsL {
	NSArray *DwZMGtQNSaGzb = @[
		@"IzxHDFsIergOBucPqieQvwJUbTIjPByhkvkULIKmJIAzbdDzwDQbwLVANWqgoKTwAuHDdcSLQeNlarhOWMepjgxvSXOhvOLpaeVSCYLadAuskHOFhXU",
		@"qWvSQOySvzcAySEFOdSvLmzMbSGOMUOSrDQuGiWDlVSPGCdfwKiBBeIKZxkmUogFNlPcclWuBPkijProPCyQVVZTasLmiyIQPJzRgoZGcQqRfiPIYmwt",
		@"VxkNEjvJHsjLdjcAnHgHGRDvFvctDbrJKDvSKtkqpmmTMXvAdpUEgKPKAeELhSHfWmLlPsKBFQVCUJaUMkDsQNIPNezitSTPNIMuBdlQFjNRtATxbPoLlRSTTLErHQoLsCTjInt",
		@"oyXtsnLuiJJADPygYpwvPuugSPUOYnMRRgjbZyqULkDaJmlWPpKzORZfundirurPUKiZDZpoTokzQfeYUdgGqeIDZSrKvaJWcYlOgztdJUiSoNGJnNSYkibxqtJNtZJ",
		@"bnncKVmGmybGnyKpIXpTNuObnYFtnckQufwLBShhIpIjSWaBFyvivtSYOZqnvsPjsFClWXmBXzDamVwKMaASEvucGjdHUYTlIovAJAEwpRLsubmcFmzAVuGwZkJbFkHCAYAbIi",
		@"KBQMnPnOuMWHcVvnkkdebaRKeNJkffRxFUKgEROhVzgtcmGzTJTpIZDqqdlmqFyPadqRfMNkFglgwsmHjqysPBNpqdHHfUMkrFhRurEgIXgMQrruTzszFQEKEAPyUmmOSyivtkkpAhjjPyweunKW",
		@"pvZLZdDzKkiHdOVbRjskRpqkejQkWnkqFPeEyxxlEBMbIMdwfkVMvBogCpSuQlVdoEeYSlRNHYWVzzDrbuegFNZRRAVxTUUvcRGNVVTmXjgchTSPRkWPkYajepCS",
		@"iawtPZyKotvnmmkkAEBVnfLeeNMjylVRjOselpiNZeqzOukhdAdZjCjSotmqJfGEYfTHsrfhxcTuRgwMDYbhxnDGblIRDLCwctxCYmhSWKAZqqJbtMfqDNEiNVUiqdyRmCZYeQM",
		@"CUbnQymfBcGwhdAuKbgLmuxSmmJdXmmvlRYOZZWmRHJfhGZrPecrNxSbYWDIcXfBBLuJirrqZeqBAjeROFTQvEfldkLUHGxiVTNbUpWwSXDsEjv",
		@"uxMohEHwTPaetpJvAXWjFVoKeysbJuBmzWAFxMUhuVSQsWuBSGDHpgkGQHFCCGvrzHQEphCpdnyCPVNpJjXaUOeJBOQHXCnNHVUnzlbigYlTaiLuPRUXHgeTAwxDr",
	];
	return DwZMGtQNSaGzb;
}

+ (nonnull NSString *)JIYbQxnQyvGNrrlKF :(nonnull NSString *)qoHgMAGRHWtXsSL {
	NSString *WCuMpfEbGIlmzyZZ = @"UDMVxpJzcRCeOmTwNAZeuyLARVYvWhLAhLKWLiWVOOEprCzJeIAWGyYwdAixOdJZLghhSuBckjgJmxUUbZsyuvRxWWjffbSVsTIURiJBdHryM";
	return WCuMpfEbGIlmzyZZ;
}

- (nonnull NSString *)pwbsXCqmkSRXdbUyZXb :(nonnull NSArray *)OQAJeyKAaarxcGblKN {
	NSString *jTYHJXcfMEjITjWzoBc = @"ttwqyKxaRjNOXWlDUpqJfiOgTrNaOUwouBQgwtzmCsXXgVlzhJQPCCVEHdztAReylKgszHwbftgZOqSRlxwhaApGONUZGGEzPxrMCyByORxYhMFJLr";
	return jTYHJXcfMEjITjWzoBc;
}

- (nonnull NSString *)dqcgzaHMFALBYT :(nonnull NSString *)eYILTPrKbTMOlrr {
	NSString *ZsSPmeherZCGfptbK = @"GtUDKwTVjPLrFQsNocthTkDfbYQTVzojgiLHgJcDgXcMtzkUJGtQBSRaywZMCUlYuFhwHEghhYldaaSsOMPVeTPAEDBgCJMssObYWikRQlCqJiVmDhBqc";
	return ZsSPmeherZCGfptbK;
}

- (nonnull NSData *)GijgxGmPNXTztTAd :(nonnull UIImage *)XakUCoLuPhwrvA :(nonnull NSDictionary *)fuEMDgLhCRxxdWxc {
	NSData *aNdgOCOToFySvh = [@"VrlkwIIsDFwzAHucmatwZpUeMmuMoqJTKLLXotSbwMuZfPaxrLIZzOMATYdyiAJdPctwubKdZRgWGpdnSqExRjSHNmIEBhdqbRMeiROCCejuB" dataUsingEncoding:NSUTF8StringEncoding];
	return aNdgOCOToFySvh;
}

- (nonnull UIImage *)vLKnhaDQyXn :(nonnull NSData *)lQlVzedsdaXt :(nonnull NSDictionary *)hUDhekUuzZfDByQP :(nonnull NSArray *)YTJcPWDPHLewXIF {
	NSData *idqiKPlkLqSPUMXPc = [@"FpLRXfOULkGdCDCDWfroCYjBAnYbmBnKVtneRoOoFFixlyRywHClUWHacWRarIwBCpBPeFmhYHyKMxYgDNZagSBGiYsIPrJeXyzoCFQPbpTLvLIvEeQFOnHlMKG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NeDWjmrmtUWm = [UIImage imageWithData:idqiKPlkLqSPUMXPc];
	NeDWjmrmtUWm = [UIImage imageNamed:@"gIkyzrNGjVKAupxIXUnCpvxbkxdmqfVZKgYdvxQRFILBVpfWuSMKLZvBMiajkBLBShASkmhULuvmdjlaYZFcCIiNPTPSLZMBWgIdDWWyxcpSrGraLo"];
	return NeDWjmrmtUWm;
}

- (nonnull NSArray *)OFosMXzQyeQpPPgitq :(nonnull NSData *)azljWisYkupNWz {
	NSArray *jcEIRyIOLvh = @[
		@"jYoTgooAtzedCtmZXsKLuLiPyclQZgVtLJgJgQhfzieANjEwmQSQeYPUoBpLRqfJGHgJXkFIbVekxLUkLCbwotqJKOCegtAkAjmlluuazzBVWYjxXjtfNcSBadVixWYKCVbv",
		@"XDoVcHuOIkOJkMjMNzrwjSFadacZZbxpNHgBNegFtFJXrpUVojdZmHdSIdznOAgeziohqsSwFzyHsNtIRFyFRQScEzUhUAKZcqUDvlIqmqtLcelmoEzPTjYHLcCIggsdD",
		@"gzMtEskEanYtpvRMqFLliNdKShYbeffTWyOLgTLIFVjsIhrTngiAsUfTZKjbDjKbVJjebQvPSyfNrlsrsBToRIYVOdoDPggGNUQTyKhTQtHLStYgwwSRejTk",
		@"QnNCflQaeEuAhjlwtfLZIkhOoNNVVNXFkOOtqwyueyfDVwUtOyYDdQeSeVsBfyETZuXmbvfYhwRHbTgrUHCKySdCmMHeWeGyFfYOdzWtPhoaMYToWiSqIHKWjRnGMDDPkzvyVLeuLWPi",
		@"ZHsnCqqbjkZyKEVewkmxtPgVhctFbwQBXhOqnKVShmGNkwvkafuaCywYrDSzuRvlavLxbTeSyMWYgMCxBBZNPxruebnGjWCAtPvEtCbvDqFxLonTvXEfDWiteEZdLxkknsDQAwUZRcUOVOjeyS",
		@"XYnjtsEvaGPAHKfrJeqiAkhQohHFWFQeUykjgkCFDzoQSQBCBqqDTJnkFGpQmasCnwOjWiOlPjqKUCtdCgVFoNzPRDeWNaOiEdXNafgZmVsFwxFLpCCxXrtjrZ",
		@"arxwETyjKRopwEagfvCVzavfYXnyxASupUiVnZYnIGykxUgEVQjFojXdpNkqnlTswWrZLeupLsFBjohapErtyqiDNntaQQoYtwaNPkETKKQYatuBBsrbzducZLuZZfXNhfBX",
		@"BNNEZKHaapPlZpZPOcRFWcXpJjmgQaBroONuqTxQwOqTeLBBnumhjIgbDGLEILpztZhdefjzkIXHTCMchSBUhsqGZAFxVnocidPYzNXxKfALcHl",
		@"cGHryKTKuHjRQxPpXlJLKdzTtIgDHMsxddYcznwjkNWTQuQXrCeYzDNVzdQGpfBwDHNKhLbjuSheedoeWvMKDiSLGOozfoIVigWVeEzeEbPPUAGdSGhczduIDI",
		@"YIlJPxpWcHhVCapmkeAahmQWwjoKXTsdjcEDUdqNOBNQsDrOXsFhnuSfQrtxyEPmpqYfaLxahbBxCtWypylxInRKPSSfZtPWkHlBYfSpjclINZjQexCXLvaUJfLpzqCHeocVhL",
		@"YfpboVOcAygQrqjXhvYymPjCylDaIhecnzMbGUoCpHIwyzxljTViorUjvLvELKohSExGLUdFHBIYDHAtZAluoVATTQdtZWvWtTqIKaSFoFxEDiVWpkwTgzNI",
		@"mlnCJOpwRkwDTbSEPDntSoHvRppQaWnzCHuZnmWhvjQdUBESiTwCTxRMwyHjXiVRadYiabxTgBEcFdnNSUHVJNkDNeNwoehZmnUfxdwMGXUEsgbEkFqbLAjPxA",
		@"OtqzDehhyLyayZLqYFTisLcWDxyCDPGAroFyrpXzwkSpYzYwHXVwJgyhucCaERvpBvXIMZOuMjrsWRadEcrkGsLToxmrwmVmEHslAvTuLctiOHwxWoxbVyYyeF",
		@"gvtYOaxzaPtkXVPUbOsSApOYKZbhuvXGUdwHUlGDFGEKorMbTeUPcgrSHaPUcDTHiIhdFCUPnbGPfreynvBdVetEGbBguseEKBttvXprYzVThWFTdrkOzrQQffw",
		@"NlpofftwSRBawAmKqUmKRTqiZBFDUhaaItJQhswDCdSvRHNzBuVwlgjVLcOtKlScotMIPKiUiXcMRxVGSzedSrOMBbtYqGzJJZwmEAdztkzDMVJdD",
		@"qhHSGNTnsYfUvIEwOoZViOEjniRLOpVvHEXUYTvXfiykjpvecULGYMgCAXQaOUQOuJsUsbaikjjRszsHjqkImhKTYsRzjnqQCpAZWUiQbzqWyCtkmOFrZVDCevuRJAfVBgGBmmnfZwZRNDXl",
	];
	return jcEIRyIOLvh;
}

+ (nonnull NSString *)YzNzsTcDFBNONuA :(nonnull NSData *)XfAQqgNKGRb :(nonnull NSDictionary *)GfAXnyyJTuwJvtrS :(nonnull NSArray *)xbToTrDpUJopLUht {
	NSString *QbdvqGoeuFfrJr = @"tfiIfGmrzZLFNIEPnmYPEhvEqnsAlatSziRCxRgvogtGLwrPDvXseqSEgFIuvLyHuFycyzqRvYdsBdGvpoqkbRoXPRLiDBqVdsoVNWiJKKtVUHjsavLiPdNqiNZxucgy";
	return QbdvqGoeuFfrJr;
}

- (nonnull NSData *)AwYjeslYwxdQeaqC :(nonnull UIImage *)tKJnNmDnlggCELAv {
	NSData *cWCgptwvLNgwVweNW = [@"SiyrGkYnvAoPJEbjxvNiMmsesIViKyzvtSVyugsVxAFWaVNzaUwjhLyBAaAwnxALgyYyzSFGOVlmMvvcwxIUNauBpZrcWQKzQjmdIqyMnVqVaWdeuEScvKWQorftUkjEQYYydpuKnIauqeMfzvP" dataUsingEncoding:NSUTF8StringEncoding];
	return cWCgptwvLNgwVweNW;
}

- (nonnull UIImage *)DDdXFFIwAUPuRsmC :(nonnull NSString *)BkBfXqvxTUrObbm :(nonnull NSString *)jYPljNmdZVGd {
	NSData *DbicMbOQqC = [@"rSGQRdhmDnQVTtFPqNLqUDAXeSyudKuUzuMvKPENoEpCGQsJXbLaueIpTnmcnQwBBWSgMYIuHsdAcoHBymoMmZravmosLoUeAaKzOpxtNxnn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EXMJntBACZjOzMeWigb = [UIImage imageWithData:DbicMbOQqC];
	EXMJntBACZjOzMeWigb = [UIImage imageNamed:@"zAlzTtBQRLHafszHpVozSQURUiojoYCxRASpcQcmyifXYJKfvPztbaPnVkijWbEvhCfuJkmzpzUMqEmGJEUZVzgSHWyJggsiKuZWPZoqShimzPS"];
	return EXMJntBACZjOzMeWigb;
}

- (nonnull NSDictionary *)qGVhjLmSKmxNN :(nonnull NSArray *)eMjudWBXgCimYlZRLW {
	NSDictionary *FULPIruuzgqYymES = @{
		@"gOgVOjFqcXE": @"SAazlgoczbTUAgingdOEwKahKyvWwyNSOzgiPZWkaYGzROKOOUbQGSMqtBoQYhRthsUNpMyQfHINYIFBfakTaBKcWKPgnyIDkOBbe",
		@"DmhwVhGCFHxBpn": @"FUvwcMOhwxUxzkvEITGkGsvEkQZuoGCjMkgcsydlATQDgeWVdbrcRITAsPWYXMpmgwQjnNnVwnYpwyPCLwVfFveHCrsDqEAuNyEkXKGJIswqugBkWdbIqCFg",
		@"ccLURJBPePuyvsyILlH": @"IjgFRDcruuCPbCvrScuKfrtNkfWYZpBMbjbhFjrMsAMOFojEiPhsLZrNLCEoekbZFeQZKPiSzPPyoIfbheEVmHMVcbrNOIHTnJzHZaffEMfZtaUKZignqJXXNkeOuCdKbEkLTfcBiB",
		@"AzWeQVGlcwfcgCkK": @"MHjmKJZLvKNblEjIAIMrZOWxLvMUYzrtwymQYuWNKBSjIfqWfmyvazlqxuCzfHyxPzjBiVgEQMVAyHrRTkfktjudNokYYVruQJbTzZMkvlnEGYLolwBjxyUmuFlpmhjEcOwjjXSonVVhU",
		@"gHiuLDwtuEGV": @"BPkjnuAisgSSMUtKUGdkhuSHnsuVAmlTQibBHIfALtyBSFhwdKpgPxVbOqoIpOWfdlRwukZcZgQIaFHReeIRVzRxbaceNfIKoSkmhyivGFpJhRcAbtQYIUPnGUIWLAVSmkbJWL",
		@"KEvnUdnvuozJnPQIt": @"JyPvAUMzkStINfSqHPDFLbYpDJNvSeCxFxiQpmmQONgpVNKXwaqloJQjCSdSfSBWBGIeZhmpMZPewqgUXuvLZVjjGeUJJHYHCkBLoaIBMkVlJWuIeJWBQB",
		@"DfsxVkICHCGYB": @"GPZcgUFYEPcrMNvlQKXNNfrRPjoehrGnikrvSmJUeaCMyokTGpZTBXtoIaEFKFVdKwmqrHXfJHfyhHGoYjEsVVMgHdlFHIzMBQAVwIOzgRmkSycwTqIARLYGyhqxOkDVhMBGsEOa",
		@"MOfZdkVaKS": @"NRoRXuemARPERPtydmKlmQvpxfChoGSKdCwlHFfArcQysHaDHDkLUdCvsKrgJKOmqWgkfaKcFyCeUMkKXDeidXsFSUHxQFPTokvIgnarN",
		@"mDYbVtMvGDyN": @"rEDDweQJyKAPfKEAPXUkmoGVItzKEICjTiknagSHHqhLFrTImpCDJTsDDZntuzKseLOTMXDeXCpFxWwmHrshtZALHWEsGsDfZfSXaAiFTBxjfZqTePige",
		@"lQOCqHUuzCX": @"FbqviKQSyPInVufJpNBRFGOPxmVrDjdxUWcwaboxOGhXFWgRabShGfiWyOzHCXNSHlcXxSnGYyPcFiWtmHcQIHLuWtGgUABdFBsJQlQyXJMM",
		@"eTNobgzJxiJePPk": @"PmVHwrfLacQxPfuSdYgobrzHKBwaYrGknAgpojzUGcLAsXNeujUbAytPpHEgdOSltWiQeJZvoMzZcEnJxHufqtQHSpcUQcJwNwQzgWirLFuyPSwGUvoofZNDKRFLHEPFiFbqnroAQ",
		@"hDGMtgsziOHhAAHAeJF": @"YgHeltjNSPsBbenjPeBpJdGNRsoCxOjbywTIvLgcebVEPktYvDoxYwnjgoDtwyvomJXnRwEiQgUyymhrnyumkwVQpzCFLkeALFdCnmsfnGgBbVVrD",
		@"wbyeGDCpszZWVn": @"NEnUcnYCWTNvzFOcVTHwYCRfwQaVTrYnzpwPFYidPtgkViPoLHTMFFNydYuJqrFCwHGxpoUiPBoSRbxRcuDcAooAyvAiEsOAsqnsyVjPiKVFXiYrcdBWoFYnpaKUOQavJqXRxVIWSBu",
	};
	return FULPIruuzgqYymES;
}

- (nonnull NSArray *)QIEzCXbzuaZUqwlMgH :(nonnull NSArray *)uYdhKGXhuzAJT :(nonnull NSData *)NuNeMapGOxXs :(nonnull NSString *)DdveDEkIgjn {
	NSArray *TCkjMjFZQfXuXoV = @[
		@"QnfRxgmvPNncomClFTLWkgUGadnjImSCTaPFzoNoBlHyrltZwYOMKPkbYYyAcdxwwyoaVHIYIrUdTABJILAKVszUiwBLubLgKtFvAhbCkcioJEUnWtiFQyqEAdqucSqbrla",
		@"cowuOPnESVozpoiMkqpJBCXyOxtmxShkieMbzDBHOSdGkrDstmFRwZJemUSEzEafcPZfvDwUUFhkuluiFfOZjVQAmUqerMiRwDsXjARtYoCIDmRVdWiRIGv",
		@"AFKrOOaAWPtLrLRkNDvElqxkbEMhsCfKynXQkjFNzNYJnytrZXHdRvByVezPNAZrWbmLAIRivpJtuLbOdxqYSqeSGoFeMsjBDrDSxsVSQiNpYqwRwsPMZdRB",
		@"LlxGUOYZTBzYalrKkGRpmGYSbmwHNdOpsODLETSSuDJoEzDaRyfRmwoZsKdlyqrBWANVZQbVFukZmsJuJmhdPdqEbAbDEFofZBPXXbNuGyEogaviqLNVlybLhRPpAoG",
		@"bPlqMhnEnoQKNUXotwVJubdzaupKDvPWFswfmXwRCdPTTeRatHFSBwVojyFiIaqBksQRAXvDzkSYTAcPFlwojQPCTlfPmHrmlHzXzenTMQMTDzaUZGPypvniKPEXWwgciQBmDqicMGckVa",
		@"VgXsyHspuQfjoMFoiHZpXihzDmUepTDwTEqvWZMIQuqIDyZtqqDQscYwJCeExPuNjwQCmeQwDFxuGaUQugLGxAVczooeIMoUpMXHbjeTDQwBzkeGnYZvloIisAdcsEXFLNbZS",
		@"qZKRdYhZpQChjAUJNooWgWPOHuOsWwsxIyDpdjhHvtpPhlLZcNZnBqBrczBGNJjVJppFUQCyZaJVDkJSnnjEQjBOrNElKCmdqVfYZeLToxSqxmfTNKRgVcEvNsparIxu",
		@"xiUKmPbSxXAyDNCrdEyceHMIqhXzwlGLEiPMYRqHdVhnEZSOeaoQucGkTtYycDNYqXBmSmVGHVmJOlnXjrlQVmeSvZMvWHICtmmraeNUNlURZMMSztHewQKWeFBJpirUpKQxvNuXDuJmL",
		@"opnfYgSnklTwyxxdnqKUJargfvUEMHvHynXiSFPmOxAEFOIYdEdFxEHILqfmzsSvNKOOjfHtEHrrEMeDYvwPwKcrWQcMVgxokQmfUeCGbs",
		@"YXlJEQlQDGBcPyvlKnLIitXgjmkkLUfBSScWkQgVerDQbhLUksXttOnCYPuaXPeENIWrXrNqPhVkyInGHkBbaDqynRAyKOlOBCFVBZKpUvtBIQwpFJzYNgdCLemwpsAgwc",
		@"xJjIfQxwkOPrcfBwtUlAdLiLYlqTDoVgLHdFHCzjNlHJFyqXBevBOynhQMmdApPjBLXlyFwScUIJSYBQvXamjwfkVZLFwoKYKDVAOGCJcBrAGnjzLMN",
		@"kqRZcuZdjyNMJTxPbvsBnXPMsCnYLgAGfeqAFrimhUdthLfboBtthgnnsVuDbVfnliLAApgAkuUIObtkOHGmprszfxuvqDSiUdjJKTyEKhNxHHENXGMvluLzAPYOlNMCpraAvkSOIi",
		@"cpftSJUZlHRwtuuTSYbqZPnXugdfErQCkEjBGUMdxCLApyirDICvOxVTEIJnjtvAWanGDboGmZTraAsctUMVgQsXxNtwhayiLXEy",
		@"HJvqcibGqiYqDFAaKeDkNWZCKhzoEHizfPERzKjLfbqbCwRgWbAAhDYSPAsAEgCYTzLUaFhlVZfZhrpYQLBuhWNFQQTOvhyHSdFDGvasEfiOQTzgJqwMblgicWhscLyvIlQ",
		@"cbhlKTWQYbeuxrKXypNagsgwonWJihbfEQutBKiGKjkzHoOmSaWgLrwnfJpWMxBdHmapjTsWTEbrrOgSnDSbnGPIpFQyQQibgdxLvwoYVJpr",
		@"fOAmPYbJSMJfzQUGbkdflQMkoiRtnukTbzMqJDnxYgUoSTjMqkOXaXpcOfakhjeOzGHYRBZQGRdsyFJrKHkmmBBVdZvyexYTMbIwuLQMkOdmBDscvHiNMNinFfxHWZQnCW",
	];
	return TCkjMjFZQfXuXoV;
}

-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    
    NSMutableArray *childVcArray = [NSMutableArray array];
    
    MineStudyCourseViewController *study = [[MineStudyCourseViewController alloc] init];
    study.CourseSourceType = self.SourceType;
    study.zttid = self.zttid;
    study.pageTitle = @"课程";
    study.delegate = self;
    [childVcArray addObject:study];
    
    MineStudyZhuantiViewController *special = [[MineStudyZhuantiViewController alloc] initWithType:self.SourceType];
    
    special.zttid = self.zttid;
    special.delegate = self;
    special.pageTitle = @"专题";
    [childVcArray addObject:special];
    
    MainWebController *shalong = [[MainWebController alloc] init];
    shalong.isFromStudy = YES;
    shalong.webTitle = @"沙龙";
    
    NSString *url = [NSString stringWithFormat:@"%@%@?zttid=%@",NetHeader,Myshalonglist,self.SourceType == SourceCause ? self.zttid : @"0"];
    if (self.SourceType == SourceCollection) { //我的收藏
        url = [NSString stringWithFormat:@"%@%@?zttid=%@&type=%@",NetHeader,MycollectionL,[UserInfoTool getUserInfo].zttid,shalongType];
    }
    shalong.url = url;
    self.shalong = shalong;
    [childVcArray addObject:shalong];
    
    MainWebController *live = [[MainWebController alloc] init];
    live.isFromStudy = YES;
    live.webTitle = @"直播";
    NSString *liveUrl = [NSString stringWithFormat:@"%@%@?appkey=%@&zttid=%@&locale=%@",NetHeader,Mylivelist,appkey,self.SourceType == SourceCause ? self.zttid : @"0",[ManyLanguageMag getTypeWithWebDiscript]];
    
    if (self.SourceType == SourceCollection) { //我的收藏
        liveUrl = [NSString stringWithFormat:@"%@%@?appkey=%@&zttid=%@&type=%@&locale=%@",NetHeader,MycollectionL,appkey,[UserInfoTool getUserInfo].zttid,liveType,[ManyLanguageMag getTypeWithWebDiscript]];
    }
    live.url = liveUrl;
    self.live = live;
    [childVcArray addObject:live];
    
    return childVcArray;
}

/**
 * zttid 如果是自己的传0
 */
#pragma mark 获取数据
- (void) setUpData : (NSString *) zttid
{
    //获取沙龙列表
    [self getSalongList:zttid];
    
    //获取直播列表
    [self getLiveList : zttid];
}


#pragma mark 获取沙龙列表
-(void) getSalongList : (NSString *) zttid
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@&index=0&count=10&zttid=%@",NetHeader,Solonlist,[UserInfoTool getUserInfo].token,zttid];
    
    if (self.SourceType == SourceCollection) {
        url = [NSString stringWithFormat:@"%@%@?token=%@&index=0&count=1000&type=%@",NetHeader,MyCollectionList,[UserInfoTool getUserInfo].token,shalongType];
    }
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        
        NSString *all = [NSString stringWithFormat:@"%@(%@)",[ManyLanguageMag getHotTypeStrWith:@"沙龙"],responseDic[@"data"][@"all"]];
        self.shalong.webTitle = all;
        [self.buttonBarView reloadData];
    } fail:^(NSError *error) {
        
        [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];
}

#pragma mark 获取直播列表
- (void) getLiveList : (NSString *) zttid
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@&index=0&count=10&zttid=%@",NetHeader,Livelist,[UserInfoTool getUserInfo].token,zttid];
    
    if (self.SourceType == SourceCollection) {
        url = [NSString stringWithFormat:@"%@%@?token=%@&index=0&count=1000&type=%@",NetHeader,MyCollectionList,[UserInfoTool getUserInfo].token,liveType];
    }
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        NSString *all=[NSString stringWithFormat:@"%@(%@)",[ManyLanguageMag getHotTypeStrWith:@"直播"],responseDic[@"data"][@"all"]];
        self.live.webTitle = all;
        [self.buttonBarView reloadData];
    } fail:^(NSError *error) {
        [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];
}

#pragma mark 刷新标题课程数量
- (void) reloadButtonBarView
{
    [self.buttonBarView reloadData];
}

@end
