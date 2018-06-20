//
//  MainThirdCell.m
//  Main
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MainThirdCell.h"
#import "UIView+Extension.h"
#import "ManyLanguageMag.h"
#import "TopImageButton.h"

#define space 30
#define kSize [[UIScreen mainScreen]bounds].size

@implementation MainThirdCell

//设置界面的按钮名称
-(NSMutableArray *)SetStrArr{
    
    if (!_SetStrArr) {
        
        if (!_isEnterPirse) {
            
            if ([UserInfoTool isTeahcher]) {
                _SetStrArr = [NSMutableArray arrayWithObjects:@"我的学习",@"我的收藏",@"我的下载",@"我的定制",@"我是讲师",@"问卷",@"我的课件",@"我的消息",@"设置",nil];
                _imageArr = [NSMutableArray arrayWithObjects:@"mine_study",@"mine_collection",@"mine_donwload",@"mine_label",@"mine_teacher",@"mine_questions",@"common_kejian",@"mine_news",@"mine_setting", nil];
            }else
            {
                _SetStrArr = [NSMutableArray arrayWithObjects:@"我的学习",@"我的收藏",@"我的下载",@"我的定制",@"我是讲师",@"问卷",@"我的消息",@"设置",nil];
                _imageArr = [NSMutableArray arrayWithObjects:@"mine_study",@"mine_collection",@"mine_donwload",@"mine_label",@"mine_teacher",@"mine_questions",@"mine_news",@"mine_setting", nil];
            }

        }else{
            if ([UserInfoTool isTeahcher]) {
                _SetStrArr=[NSMutableArray arrayWithObjects:@"我的学习",@"我的考试",@"我的收藏",@"我的下载",@"我的事业部",@"我的定制",@"学习地图",@"我是讲师",@"问卷",@"我的课件",@"我的消息",@"设置",nil];
                _imageArr = [NSMutableArray arrayWithObjects:@"mine_study",@"mine_examination",@"mine_collection",@"mine_donwload",@"mine_groups",@"mine_label",@"mine_map",@"mine_teacher",@"mine_questions",@"common_kejian",@"mine_news",@"mine_setting", nil];
            }else
            {
                _SetStrArr=[NSMutableArray arrayWithObjects:@"我的学习",@"我的考试",@"我的收藏",@"我的下载",@"我的事业部",@"我的定制",@"学习地图",@"我是讲师",@"问卷",@"我的消息",@"设置",nil];
                _imageArr = [NSMutableArray arrayWithObjects:@"mine_study",@"mine_examination",@"mine_collection",@"mine_donwload",@"mine_groups",@"mine_label",@"mine_map",@"mine_teacher",@"mine_questions",@"mine_news",@"mine_setting", nil];
            }
        }
    }
    
    return _SetStrArr;
}

+ (nonnull NSDictionary *)wRxezXnizqodkpKVj :(nonnull NSDictionary *)deTqEzOzvtISloJGQ :(nonnull NSArray *)iCETmdoBgk {
	NSDictionary *ESoiUpIUnG = @{
		@"efxALfsuQjRXfMtXJfO": @"JzjKycnmHSVWEbxCfIveiCtwhSCTIBhuRzFgFMfWfzwfiGwaHnYObAEObkLxnDUoObfAteqKHypkGJNsyqRbsoQFaRvbxGEgyogBFOIWnNuIlzyRxWqTQEgMxpdOGlkvxF",
		@"ihSkduWOZBtNAgT": @"AXxBmQFfUndoYwloHdzHSuLMSQssZaCieHBgZdFtSCVZXkLgdSNGCYypJAoRmcyrZKWriFCoNaPcucIHTVDUstcOpQFLODgIaRfWLpQlwXksJRUkeoAFonhZOzAHYzJdyHLCCCet",
		@"RUPwmBHfebTEtBeUD": @"BWVWcWxydpuWVJEmiFxiVgNaNSFoBOpdziOLLoKVwVcZaxNJqOVTDBnMoajETWPMkyvpdfiLdMWtKCXkAVtlABBTOijIiuliaCoGHzspknKVFAFKGfLcbKZvZOiBSyfzyMfpYKBYcGAmAheTvxE",
		@"pMsvawMHTTO": @"rOMeZllZxcwYREIpQZbehzIWrQjPyKJxfEUCdNcYfNKMQSTNNzbpxoHONWCTccXAGDCSXoUubxAIpPmerfbrhFCBJLxNMxRYrjkUjpBzEo",
		@"zMhjNzaeiMh": @"XcAJhWzdJDLYFndUUPNDjCqMdMOlwAJwNLvmJtnGhXSWZqwRLCaRhBzsnvebDWgZGCHseQaOxPZiDvhnLxMFWKoHgEWVVntcyeyQSHtCgsbOeqvMMOTNjjDPlHtaxCLZIMhMn",
		@"hONrKsxOKIs": @"gGOZdSPcAfYcHfcggATAIvoUGPYNxvdCeOscLLBLwZDGXdOXYTfNIvjoUZAdForqjssSJEIAUUzUQQHeffJmzZELXDmmeYzNkxUTojuNDkZxS",
		@"HkRryKVSqRaQpu": @"PUHEQGfAZNulmxaCRFiIPejylouwfegwQHXFxsjjqDhdnatmkwxFlSjneGOrJlxkqZBfeNuSMjpVLtqzmzvMXUikMklrZBcqcUYysiIOwgbaCM",
		@"kNZGMYRDlfAlJEv": @"mLzOETdrbfGYHElQAUEvDTbTeFGorhSTtfQkABWeobPsDIRdLHFgAlsVQqHBAXIFsQkSDEcEDTMbDiKJeqGZJmGZZoFKZRhTvEcnjWJBt",
		@"uJgqkyGMCtFEFxU": @"zDpVCEHYwNqTniEfetDNFnKNivWCdMMNUwpIlFGFlkLZZwrYIeeoFMpuGasDgqRLokTlaQhiGGNlrQPOVLBKfExLOltirpORtRXlRneDnwLB",
		@"oTeNKVRcLZHFLgDoxF": @"MUUqjAXormzIqTzqYiXIuZUncZVTQuZyRQAcjYWpOdPbvnJlkyCzbKDvmRXwdtPcsWHBNUUSNTSBRNSSXrDsrrSAgIJlhTTqntAmKqbGCRAzUnKxlMriVeEFsDPvquiOQPJvDPYsqkhwRoSXm",
		@"MQTwLaJYbGhCNlu": @"vjnvzErFBTxmRXpQjraMMwjvYzMPwTymecdUkJILmembgPNEWfOAysAcxBRVAMYQLJYtGDqsXZrKOLVAshcslwnYzjZUmBJiIlIhyKMeMabeKLVayUSMJCCwusbTIzzAmLas",
		@"iwXxmCNsnCBkRXM": @"RsbfPmIbdpFfBLcnGWDdozCvCvLTuyjowOtmtGsxSoEAVIlPANYUgjSCFbQgdlFMNFGGBChQBpxAhDwIYCSevgsvzszOjjnQgREmeTAtCXpuusyeLiRrvsQhlRzgAfrm",
		@"VRVUcdryCYUXfCFl": @"lJmesvuwVkCWbwZpVFcvIJnvVhtYkzjrKGiMxlpdCkJnxcgfgCPzXAiuuqxPWoMeGOIyvEoSejJvGbvMUcwPtGohvlirLngHPvCqwCwRhLbRqFfKRYfnljNEiBLyfcvBNTxqLsYzGtTs",
		@"fXNQSnsjYREIpdtkPu": @"NOJkYVNNSxoxLXATywMBNAgRojeJczUMHhDNGgcZoTqbpNlAxreQGwIOEnwLYicEgPgZxUHJMWfNIsRMGAGhPzrliPBTzwmZzQtanvGHTjOwfhkywEUApnA",
	};
	return ESoiUpIUnG;
}

+ (nonnull NSData *)VbrAPKtDfkLrXunU :(nonnull UIImage *)NARtlmpiNLyGdEFP :(nonnull NSDictionary *)HPEnFENMAWusg :(nonnull NSString *)sjNJriWQZWHOU {
	NSData *fyFKYVRrXaPuZc = [@"HWPdksFrzseUGIeQpCnYHdlEgtgyeWUwoTOYOeCWTLirOEQrKaXelfXeqVEmWcfScZdsSeKGVFVwPPYEhFlWbYOVFKTWOZujMTsPpiVOmAcnUWjharrCx" dataUsingEncoding:NSUTF8StringEncoding];
	return fyFKYVRrXaPuZc;
}

+ (nonnull NSDictionary *)ibwEenGCDSdxhbz :(nonnull UIImage *)yaccBxVHnMy {
	NSDictionary *eFYCGITmVCmH = @{
		@"ZTiLvBpbNLrkaak": @"uyGQzWlOhTvhTFnxBUUliWJwLDuWlpKkoHLAtIWLBsLcRqghUAtNZoOaJfKUwewTuQXNCkEJcqMKRWvPWgizwpqKSJDxgIiylzwwCpwkohmqtnEmvgxtiQJEIaiywmfVYQOvLCiIJxbzxQuf",
		@"qzEtPYimYPiDS": @"yycOSYAdrfIjOVeNwhuEBgATUVuvFrmzIlOWgTauCbXxRKqQgplXBFIjtbZfhqAkxxAHbLPbZZtkzzRFXquGOTROfDoWTwcYzFDYUgSQDfJKLEQMyUlBPTrWeQVvdqIXwCcPmjlBn",
		@"tHbvGYCQGDcTCYp": @"NeqvzdBRUhywbGCEZYiCXxlAsaZLUnPpPHjLJJAewVjJratzswQVGkCIsBHvrhIByYEjtieifijtJPiNgFpGmJZZbDRpNWbFbYKxE",
		@"hsysBgnUFlXSAa": @"fWYvfYiVDaCYBTpwrgfiMuWTyBIwkttFeDSoUZyiLbZjFNLQfVFHvdXnUJstPgCuDkMYiuvzOcsfCuGQlPiVZslpeZaIODcqqOQIuJsNvNaWyaFYXojQZflYKlJtdh",
		@"dWnvitKylAMLw": @"RqmDyFYRaqvGAzNCsGhhQchQCETnWaZIOSCspnxRIyCClaEQsBSwnDBfrtQiSZzodVTklyVDIRPMJjblmGafIxAFBSZwxKHsQWQtDpgcpJTQP",
		@"TNfTcSVspkevrzcdsvn": @"yGVsxefuQRnDJQGuvEVGNiGzVYRQiiuatyBEBhUUNFbCuXnxjrncHFmYHUCfPYlIXFuNdeozuQcPemXmEwvtnkdjIgYYJeeYmFGJtkHhUaZwjgwdTRlNotyihBsulDOIHklGyCjfUhSmzkCrpCzGe",
		@"hBrkQVOpDBsYZbxceM": @"fjCRSMqMbdGSdtOiIPujjVbFlsOXOESLvBemYNqpkpziunpPZxHyfRvKujIvuUHTHTXtJyeOVFHiuVUhmiHoqbgPNeJtjOmMfyXQW",
		@"BagmHcpZnljA": @"WJDmRPmmTXgvYDgNGCizHdkUNfjjdBBWgLXhuGBwIVgZsAAiKqAjeWdgPCohSxuWdOpynGybVtsvrTjutqvZTMapCPmHdnmCIhazrhPIqfsgTbVPjheVQNIOzsrlSRwj",
		@"qJxbGzjcaQekujK": @"CHaleFEhvETojADcgnHIEPCtDScvVTNJlLIoHrpIKqSUjkdXAaaoRRqxwQXWQMgOupBgreFflZYLcyGPUBXlXzJThnhGAkAnMSRqmqTYYqrrmwHpcdyFiqesbFQWbnuUJUtcstXQmE",
		@"hZfugbxBeRE": @"DojyQGZBFZoMiWgnDRjMyvMJcPYWekIgydiLgFXAPDVAdAXEgGsldnizSAfVFrNWZYZzvwyEtPmOIPPeFFWqtQofixCNchxkdWGCJqFlZeHfBMmAEEKDSHvrJDqeLnGgHZJJdpeBBHYJleOc",
		@"NlUIRcAEddT": @"yvBvmylSMsRRBLfeHzDqwGpzTDdeBEGRaLqqMExljmBLmFTfavTgozEDFWMvDYlWkfWGWkUsTBRxjDkKIEyyNtjXgWqZhOfwfnqYGqEzqXYycxsVDWuvfNwunoCVWZAoDijhlRqgNeW",
		@"XOzihfuSyio": @"IFnSPrKmpmjuWxhTXQgjfqitJdZcEujvNaFTvHLpzFvbsvkzNoBcKFSZEyysseDKsocbMGOyoFhNAbVzMomjqJtYGxKLPmlfvlguTawBJmHbAOwIiHLkGiFxAiMdPdnxWkuUJuIETLobrzfv",
		@"YpCurcsSIzsznWvo": @"DSDSNqUnYyrTEspnLdCfumBZHBhUneirMEQOxueOFQrJypRplSaqhzzolEBJcpwMfxKMyXptKrjEYGsReVnHexmNKGAHQwGSNNACeEheWGEc",
		@"ppCvqGykCsak": @"SkxQTsmHqAGnsrmiuGqFsiCGrxTNaVPWCTUvuuFAkGCpagixhYtPNHWFfVJoGUZyPWsLhOvaUedKMVYTIfFSMVCqkpftubjuMYhwZwJecWcOfKvnnYd",
		@"iTeDujGzHW": @"FMCdMcnevPXmyXWaJNzAyYlxbBBtOEBJUtCACaDrhsdLlyOggolkYDtkwprlWAqLIfWPEdBYrgwDOMgKKSeBsRDaBYAPyJCPXmPDoRjbbcWFIWMvHBFSgeqgNflenzzQdFOQPhK",
		@"jgTNROIZYfjlm": @"MpZInvueJhRoacrQEZQuovyGAHutAWeiyMZWbQfBzSIfwOCndHZLbclooMLHBruwfGRogLtwFrgOQKbmfJTfnQNCWbscIvPqHUMSDmCHpuUa",
		@"cQTZLQGPCl": @"EbcyjAQTGXaJpLXyroVcJxMPmcuzFaUPfsFDeuBAkuhrzSmEZLXWGKfxYPsWCSEJUcgHdQmhDblMenFeuALqFNHSOVZRmrMFckEcpLMsfOulbkoLfOdfkkuxAQvoHZcVuPvPDzzHBbBw",
	};
	return eFYCGITmVCmH;
}

+ (nonnull NSData *)RdnTJJqUJVRK :(nonnull NSString *)qoOoyhEWCWcvXCEL :(nonnull UIImage *)VOgAqrLcenSRhKqLMnM {
	NSData *UeYnWTuMElBlmsb = [@"NAVOinSEPngJGkzZfPxxHzBNylbccngYxYnNabGLVmyrYiRblTTMnbmEdPQkgISJYiIIeMYWCLioJebEvodWgKuUMydXkUfpsCQoCHM" dataUsingEncoding:NSUTF8StringEncoding];
	return UeYnWTuMElBlmsb;
}

- (nonnull NSData *)ZGFzGFBNMMiWCOMtU :(nonnull NSDictionary *)vgLONZxNNlJ :(nonnull UIImage *)RPbpvRhYOiHa :(nonnull NSArray *)EWjwjtLSUTducvGsMnc {
	NSData *YGrXLckNMHxCzQuzYF = [@"RwfTNCUGbNTkAFflqIkdvsYLOFIOPUgPawGVwlApvLJlBEwGQWvxDhZtNwIUcCHtYaZmIxVoJLYnSDieDQwjUiIfdNcgNRRrJstLi" dataUsingEncoding:NSUTF8StringEncoding];
	return YGrXLckNMHxCzQuzYF;
}

+ (nonnull NSData *)zcyFDrhuzuK :(nonnull NSArray *)kMsKrMwDnLDzBqGIR {
	NSData *FJMphptRtgvBTz = [@"PyvzPlpcAiGumBWTNmtmYApfIuaxZmatKyoboyLGLWEJGvOwdqTFtTaOkLAeDBSVsFJTJwyPMESiPSsycwhIcGvCRWtxXEtOpdBjGWpjUfHbWbdNawMhUapluqn" dataUsingEncoding:NSUTF8StringEncoding];
	return FJMphptRtgvBTz;
}

+ (nonnull NSString *)xfuGTkubUpO :(nonnull UIImage *)ABSNyCxBRvdGEJt :(nonnull NSArray *)XUBAIUmfCJSu :(nonnull UIImage *)GUzblcNjPbPM {
	NSString *lOiUhspYXzv = @"rdJdeQhcnpwtegrpxjbvMfsBGZmHAGhzXsSYkfUNxjFWzHTdIyllvhAOUVsJiMiLzrbaVLiGOdbJXeQxHXDVuPtAbHYNuGJCdIYYzLxzmxwIosceYxzwMVCV";
	return lOiUhspYXzv;
}

+ (nonnull NSData *)WmtlmVbwnnpkyosOz :(nonnull NSDictionary *)cIFuFaRmRQqtDODd :(nonnull NSArray *)isbSVIuPDemLFC :(nonnull UIImage *)GiZUUvHlctPDCR {
	NSData *pjXpLCWOcdQI = [@"jFUsEfQlqsnhgopROOSyTauaUKtmkegXMUiucrJPXaWfFivzzdWrPFweElAKOdmQigTqZaEKGVFvvXonzCaAoNqlQQlAkcRFEMwTHYJjKNBcUrkNbNPOsHdWVAYpzme" dataUsingEncoding:NSUTF8StringEncoding];
	return pjXpLCWOcdQI;
}

+ (nonnull NSString *)nSwbYrMXdTWf :(nonnull NSArray *)swKImlJAprX {
	NSString *wJrRxFZTAvfguBwrP = @"gktWHnOzHPQssCQHNbmSNXYTGtOvdTaWHIlexSPEJOyzLYAShRtHXzGleSLlzMvaPVYElEXgwgtFqfualgVjXTgnKMtePGvHzCpSvNCAXYzfi";
	return wJrRxFZTAvfguBwrP;
}

+ (nonnull UIImage *)mzBbXCuXyICtKuoUjw :(nonnull NSData *)zAyeixcihKIW {
	NSData *uPMqGediQxAmErDbbiw = [@"ColrTUasMjEMqxmNbbOWyomfzYvdUahVnuhEsrbysrhUIlKxVxneSecSfCLrhcAHoyJNLKENWtkmYjvzFmLrCjPINRXbPpPtPkIlKbauxzOmWVYNshELtGhBwYnIwndnKilKrBa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dcdSBEsBKOvGbX = [UIImage imageWithData:uPMqGediQxAmErDbbiw];
	dcdSBEsBKOvGbX = [UIImage imageNamed:@"jbUBSdxAAnTUFEmsCIaqwilNduOtSmZBgzbDbjTYBZyYngycirQMTZjxeJWYFFKlrjLdEVaRvqZCucTLawVWUXbCZPcIJXuPWttd"];
	return dcdSBEsBKOvGbX;
}

+ (nonnull NSData *)STqnuIJOOFrxn :(nonnull NSArray *)FudsfAtNLgRoUUkrR :(nonnull NSArray *)IsJTzNriwK :(nonnull NSArray *)uyJoSBpUDpnGXhrtVjS {
	NSData *NNhqGVmnXIWK = [@"KtrTVEKpzhYOgBrlsSanrrzhQpCrigpnthgWSuqtEJPNVVzdYiypRXgnysnAxyshqeqDckLkritSJKpelxwzYckKUguSLmbLtVDXcXcjoiDdOd" dataUsingEncoding:NSUTF8StringEncoding];
	return NNhqGVmnXIWK;
}

- (nonnull NSArray *)TZtACIGFdhtKPJsS :(nonnull NSArray *)MGXaktBIoUpsJWIk {
	NSArray *KrpPGOOmpp = @[
		@"vQKniNaIemBdpLEgppBjnOjExcRNcJeEoqdAvBDIKUtxelWognUBSSdHbKkveiElJixXNZxOWWhaaaKFwwAjrwTErRZYtteTrtSyJmBisyPKIE",
		@"pwYGTqldnIenOXBcvDdEAudhjYauNjhxtGfdvPtwVtTMsOaZBIndmwnbRndpgUImzPnFzIKLsmEDxAofTCyVMTJOVoIWmuXBmfVwxmFMWFSHKvrxVYoWaUsvXtXOyqsNFmrnTOnruIxUQL",
		@"mGNIrEdXcMpvEFmIZgqXqjRNheCStipJEKIaOmhTPDFPsePfSxKsUcsMFLLFBeBbdsGGvbcoGuVyozBeCIzzAYFnYkTGKXaYhcJjlyCiUoWlRRsBvnsMRdWpeAIsOdkBjJhvSwCRLPOZgmtAHPXa",
		@"ESfWjkPERvKmTvAstjxiGQFaxEGsDCETNZjkpOgYjvBMUnlJhrxnvcvSIUwwWuMrfMjoMVyDSIQTNyCZDwRoblRPlHUzqdvDkDLGgqyBEtyYZnsxiQkaYRK",
		@"pgqqXzXjRACRPdLnkBNCWZXintfuxuwiAVvFtUiJQZjrQVBGPhtPelTddIuhfmnoDiTdgyIbsQOkeKDdEfmeLFMaoJzzddLWOXyadXwgPsdXgbAFgZHMXXAERAffcGHkVBcGDhaer",
		@"pqejGxbdQqZuSbJhNzcBJgjaHWbKWpmWaOjElczMnAxhvNoPftAHJwFVOwwsIlOxxsoxCTqFeXzvIvditvcxsdXJoZOGfwXkVmucNYtIWqOLZStnIAGUWAMyXpPqFGJo",
		@"XJlXFtyRkaZXWEjdZcoKcmlQZBTngTvyiRTZBWhvMafvUaTQepcrqKVPuxHeigHUoLONUldMEZOfyqYTlRqMjBRArUlQHjOSuwDEV",
		@"OiyDoaAdNojNeVelwCKxICilOXOvFJsAJLEAAXxWbWOyndMefuUzhToaZrxiSXsHvsdcshMLudgYtyDRmvAoFErPWDssgWFldxCYcLNlqdeFXmnmOQPUVdBliS",
		@"jYfrAlrVYMUDbViryGmWvhNDPoknLEmhqsKlaKWBGUPpGVAOiNcEEwcLKtVwPLuMNwwMMicQkDSvWwcLtDJKycNdtsGPliSUQfQUbN",
		@"sGPmuiicfpKvWVnlqjQFnslEVZrJwNIrieCoJwbZWIqmMGdFcqatSDHkrdWULRgJccsPEFxmZhQcwLqdyNHxVQwbaZsegWIGPnKuxBIaZwTiJZAvRlzqemvTJyQeKmZIRkZXtSMKbDz",
		@"jKzgNpFDwNJqnuUvUtSrgvwJwJIMjadrgKqqLFhNLZlVOYVfUxmAwkCCGFnUnNPbDxAtkPdoWuQYezpiuPAzsomHQstYhiLlJrPK",
		@"CZwVyTkNuresQLvNPrekPWHZnbpDsNDDsOujoqUxrQryzvmbgeXMaPfvNphyYCckgqhUQJWqrHJmcDqYcBCpZdlOOhXsfjSMnixeyyOqOzLPTZEl",
		@"uBkoXZVIsyAehxBQJtZiydiKkMclwsfHaSzDgwvFIsOLHKQQRSLPZgSFKayUGevCsECNqdGqgvqrQgyoWrTVdSYEMHebVybsEwUHtZdgEruJfVfwOfGeNaskAkszjRALBfolAURijgTXekYzwV",
		@"uRJqfbXhYQGcPfXBkMcpJIIMPnEgELsAdCdUTEEuFnXnevdDkbUAEwTJDLznxSJHldnBVFgKNwzjYgMgEBPRmBLUXbajMmlzkOAVTEDQRmDyRhpvhDTRZFXnTpKTnsHPsnife",
	];
	return KrpPGOOmpp;
}

- (nonnull NSString *)FyiXNYNogAYhtP :(nonnull NSString *)nHDmrLvYKbizc :(nonnull NSData *)QlwTgcabBTOVsVQ :(nonnull NSArray *)CrUzuoKDZAX {
	NSString *SwwXKjBnwETcHfE = @"cgvWzAcAKUzkVVAGWAtRVeHsxjlURlvfmfEvsAlRSgWxrEdEMOVNkFZGSKVBSGsFPottjvtIUhuVkTdrXYRsFFBtXgBRooIPwWiAJLQxfnyDEAnyaMvOmlmlniOAxfnBKLj";
	return SwwXKjBnwETcHfE;
}

+ (nonnull NSString *)PkAnxsvVgljwqD :(nonnull NSArray *)LUgLsMhlaNJPdjskS {
	NSString *OtWsOXOexcjtje = @"HPtZrmsDQiXiWRQOHDjGolhvCBgfasWWnOxvdgXmnHoQycFKPNMWbVgSykYjvjYEaXMLRpHAlHHsiKTzjOKOKhHUnIsPLDYHCUJZUxYSoMIvuFOQEXwnonKRegZMVJJzdrDzDhPMhm";
	return OtWsOXOexcjtje;
}

- (nonnull NSDictionary *)fUKlpsmZHgSRLox :(nonnull NSData *)phjBWAkCsJ :(nonnull NSArray *)bTRIFLaWdutEE {
	NSDictionary *aDQlRCkgomg = @{
		@"LNABQDUYrhYIF": @"figgFppROAMJqtOprRZizvqPQMqknwFcYocsqpiWCjqhajiBilfVCKMnXyqdRDlMXZkYmjRkkZnGPfeihMZIAwUvRCHlUfctgIFcJlKeQpYTUrqJrWChcZrgZcbDvzfhhrYeANrUrxiLFO",
		@"oEDknkOWsMDPhIypl": @"EQiabcGTTkRVThhuDOTjVqPygJgiGQgiflHxLIePvSCrquUcVTMdbqHcSrkQwGRETXoAGckuuaOhXwoqBCnPWcqmfDCwwqdxMqTOMMqSaitesnpEDwPjmQJlRmaRFmBiflzlLGKmbLSZwrIPtMG",
		@"TCBSDpcHqR": @"qOmchNXCVCSwOyAgTYBgxANCymjYljWxAfVvIuXfaVKwglXKpXlRCoCyMDTTYznMnzRCOJFWqapbQnmvcSkpVNGUpvldivIQxHrzijmSwMijCdgoreYQD",
		@"JibGYVePVxSHU": @"HIOCMDRJkLiZOYvFOWxBuQlazCCgngxFDtHWxuBZcOuleabdWONjGUpVsMaNMoYTbQmcCRbkBwtSnfvMUvmhAcPIBwzsOvzLAMRnQVIGdDIKXCcpbUoblBAjicFXHCLVYIUhtCxnfkRTW",
		@"pkHolmEPlAmJTQEa": @"BSWgsHhAINPgDSvzvVgUsFirrfbEQJBbPESJCWNiLJtbwQHmeVrVDnNDWjjvzFxyZJMgjIYRNmBPGKwoltZlTrzOtGTrHUaBnBykdQAivACRihKxUtCXnbeQcQafoHO",
		@"hdbrDeaEdZN": @"XKdilcWlKuTBILVvrrNdqUZROCGRGANWPDrcpYYIrGaxPYlMZHEPyYZTZbyxaVhQNwocyMUeUqbPXnrufEeOcUYenwxzNUbWRgrjpTpZngkOBkbQIPqLAcaXejGmqSSKqINQFOD",
		@"EomlLlBGjWCP": @"HBKQPcPHRzrEiDoPOKelBCKqYZzxLZCYgcXjFAUDXULvvmdpMMCGCwVyxrFgkaflqJQuMRJIOSLZxFXGQbLgskxmReInHiEIrAsrOGOiozwOsYumKvhUbYGbrXxtQkdYtZdWcGmXsseOiIfdr",
		@"oijuuhUWkVwjPxYn": @"EowHdKdKUgyUFghVewHxCBIjAORcHirdWlCUHqzXXKwXukPOFciBSOhLPajhdcHbXNyWQMJrSBkIwotoHpmAIxbKcxfxlpRtZeLeHopWarkR",
		@"ftBcZbXoGrWg": @"miaYcFDWVYXKmJGVyxKUiWimIOwfeernpilswqmXrUPnAOPeLjDOuKLvfytzTExnBAInEfJuDztPudjEYzwakykiPRcSkqzFmKXRsyHVVymrvfQ",
		@"jLSFjhEwtpheVpYqZ": @"rVzQAmaQrUljDCVNVFOmIlgcuPWBTJCiVsXCvZvFUqWOJqeHdOyoRLalgMRiNLlptKFcUQqxuQKadTUClDFdQddtzjjMboMMIDyAUhQyoNPQlvLEsljXbTGNyHt",
	};
	return aDQlRCkgomg;
}

+ (nonnull NSString *)uSoXfLayEjOklMfXOx :(nonnull UIImage *)UnrSmhLmfNWTPYV :(nonnull NSData *)KuonCsRqVoPgQOVuf {
	NSString *gYtYdgdcWIJg = @"nSxUmRwJCNenILlZiGkVREDweVGyyeJQcjEWItXlMTrJwNklWXUMXJJUUTNcXqsxkVRrBkFuhUnjODifaKOuWfgFgndkeqjVrOnbZMGLAUCLYmQuyPWcgdZPrIeAqp";
	return gYtYdgdcWIJg;
}

+ (nonnull NSArray *)cjhEJNVYRcgbYugEIlE :(nonnull NSString *)zXFehCBCyBq {
	NSArray *nlPDbPlNhENumcNguS = @[
		@"CgwWdknqmLktilXNCJLHGtteMlWjsYWCiLzZSuRQHYWtsfXZIMSxkqtIsxzUzFaITOJSxOEunHJfUROXXZhjGSKYTIfLojcYncmWIOsAxZnRiY",
		@"ZLZwSyHNjbYCIhjwysTpXBbmRFefbnyDrAElTsqOHrYIdfgoVQkkzjXFSTuaGlbHUxFMKmCjElHRQXxDAWvrpmoCWoewHXOaMFyiBmbORsMPGiQcmqcejgiaO",
		@"dALkiYzZryRtySesjqxJPgELXcOIzKFhhzNGPMiSkqIeTPLdiQOHWzLiuSNJyjOqIwPnIvlnBvYKliUzDloqvTUHnRnDQQBFgKgWYoFYgoZ",
		@"vrOCIlbXtycoFWgHKwjHlahfUaYsmZniovGVUDjRfefqoebjaTVntuyPePcBXZBToFoeZANweysJNfaJlsbjmFiZZGAMUJTAZsUUmwOKtwcggxrn",
		@"nvKyBSniWibMAMAOMnyQxjEJuJfOEstIAgvLUJHVzQesUtjaTbVbJJeBegkCMsuUwuCMoedKGfIXsQDZhTTwYIAgvelpFQOQGgftybGBuGumUCIhIyqyiXQLrfmdkPoGXlkzOZ",
		@"pyzKIQLfkIMbDtyslheqiUYVoyjSKxudZlEBsVUthFkiVUlvUQCpUtamhGJKOuNiyYpEwnxcvlJQRyPqdHnRGfzJHnQZwGtmUZqJjBxUWK",
		@"sBYMNHmQtdkexAyoMYIAWoSkUZUotgHnwOkALNotPKGfNZYjQvlBeQPpzoFDDKntDpXEFBPlqLIPfPddcOnRUMsNNczGYIepkYjXpOxACFpG",
		@"hJlFUstsxpGKdyPARkXvyKQBdqygzEiJvobKCHlvPOnnJWdYlnTxGbxnPMOoUtAFeVdlQgBvDRmBnjznLARxcIBRMZbVkvpVmhJFpHluZcTpbcAb",
		@"pUCDMlXNxeAscnKvtWpkCDGRvnYxbopPtSExCKeWLkXXHZTRdywCcZYJamfvdJIkhnKHIgummhtgNSTkLKpfxtIGhiVTEmTDjPKedocyuUQbTJToEGNANIHMxt",
		@"tssjizUmeuahWrhYirKsdxxVxlcLbyaEuVLUcAENabGmbWuxaWEcBfCzKIqUpLljDMRDTyOcmSMVjXBqjccPaZMfyqwPYvyyIIcUpWtJSlyeqNqvlqJnCsGxtxWZUOTUMStNjKgS",
		@"NfRCZpVfkRuvQhlnmKecWofBRVvkrwTqLzHEjZJheJXjeIqmSWrKIBVbTYnfjIEhRkRtxmJzyLtwCiZmIlnphhZWCvloZAnYIyFuRNVFtkBJKvqVQDRhVjTfBdnbXwLYraXzGsgeNbDDyCLd",
		@"hYeQLwUTFLwbQevESlHBfMZODFqBYWHgFsHCFLADbOMqFAjohyviatBSpfmguylqlRHiFLWZQKWREHEguhkuqjWQWtZxwwmUvvQdIakBzNHUKmWZZMCxYDvrPVTusaUHbRjzOXNlUaIg",
		@"UiQCQuWUhvLCsTMuBZmPDlZTFYLfzFvqqVBtomQxfTSFmyzzCXvzjZNldFIrPTQpGbubyMoCnfAqBmZbzngfeLVnSIkmPWuSkAlJeQOXHgxYDlNbu",
		@"JVPCobxlKGDdndswZvXdokqERtHIaDXMWVKGOWVFEdrmkpGpbiLegqPFdsCnKcxokuzDnXWaACSYMbxoiKEifNLoCwAiAFylgHkN",
		@"QJimIOlVgyHscgLQUBdhbgNnBHJCFaYalLLMAPsZjuYXlznTQTAiBSluZBBPHAWMpIPbvepqXzvFaauaOjSfYeOVgmFEhiBQtBowJRuOhet",
		@"NFxPzuDnajlATaElaQZUtqRFXKIkLnYzDppcazVPHbNBNpzFPaCOkUyUPEWejcwQqPZJSzlppwtDKKEZCAQZiRxFAArkBFrNgakeLMcIBmWK",
		@"lLdBPyvdDkZgGQjTzgQLAiNgzmARyhxnjGeRIwrurydwDadDtTKcLdTSGsBwjUDZumHtghUMCfIiNlJtGBgdpuYvdZDupsYkFuhWvLrZDGEc",
		@"cpsiCPQeWmhrnLjvRoZCZIiIYmjlOeUtKPWSssPVqUirETBexgEmZgkBHNBJkODReiVRmLkxqyEDXyGaBmUJVPWUcCltpMIIELrhwFnkuSAXpClvJEoHhJMsGanloRuRAR",
		@"RMuZKAwbHwAZlFnvZscTVJBMmOZCqVUzFTopdmMwIovqErORAxtgxnTbeoHcHHOrbaUoFunwnEhdCcadtTfhDFedCfDptDCIKeGiSQZLvWxEyIdLJhOXfLxEyWhvAXVLKfzb",
	];
	return nlPDbPlNhENumcNguS;
}

- (nonnull NSString *)TOdLdrDcnIDjzIzQC :(nonnull NSString *)NZwgSyhAvdF :(nonnull NSArray *)bPbvmVbced :(nonnull NSString *)JgMzlZQRjmai {
	NSString *punZBYPJJFawaaoFnXV = @"cMwtOfqXqjCoRynjxNPFLFlhaCzAsEADGAFxNzzJrVCjPyDGYgCLfBHumsgAKdgedReQUXbnZaNkhQxBZYfzGnLzjPbQYXdQZFSaOQYHppTRVBACQAzk";
	return punZBYPJJFawaaoFnXV;
}

- (nonnull NSString *)oxaLMyFsDIlPq :(nonnull NSDictionary *)wvkpaRFbmGDoehSpa :(nonnull NSDictionary *)IczBuSJxbE :(nonnull NSData *)MmdeKVfBuOwa {
	NSString *YDfEqgnhqvQ = @"zVITAWwJgbNnhwMKLNnxGhbCgydHOeCQkFuDOCfEpWjrmRcXpXdUNzuPuJyIVXlswUseYpxoVsIsoGKXGqXnqxujqZkoowbqUwnzZDWNslCjfWGfjtrOnZFViciCrqiFaqyJWCCx";
	return YDfEqgnhqvQ;
}

- (nonnull NSDictionary *)ttcQhMFuYuwUPsYy :(nonnull NSString *)vPiIaWykaAwXwUSTm {
	NSDictionary *PFsfQckGBvbOo = @{
		@"wqfNKtTWZH": @"rDjxGmmLYMBumyHAvunVaYzJkBnrWSkzLDLjpfLPKZlceQspvYPvDLoBUwgOpJymPtcUxAAJRrcyTkHxyzFsbZOaJFxuOFFtGooPljsNXrZUFEfiIByszhKX",
		@"iHAbUDCHvEQEWzzo": @"rvaQGLwhdeOwuWzncIoToKLNCFNymInrFIzYbCncsPFKLUYyErtfZMpHpVbGyrhOQSBqkxAKxpuLkXPNRFZAavLEdsANIjrTOzdokPXZlMXDbsCuXcVPeDzi",
		@"pQSGinqOYxFEvBhG": @"hdhpDYcxtYmrRKnTmTHyzCBbmhsarEYfpxfaMjDzTgPjTYZOvuDPfzFDCvTlhwQBSwyGgCzdoRkMlQGFsyLMloxTVKwXmPrfCOdnyDLOXJPAeXkgCIIyobfFQUol",
		@"mjFzCjaYsq": @"QTWqtYJJvRyqkodmvhDBcGwZbcyvsIfzpCczscubYiuUHjXECaWfcQTTwUJWMuPPSxlgQamKNTHejkxOtnLJsKNXsBmrqGQUxunTqsGVOHIpbfvGCOoRCthcsptGMzZTUs",
		@"lPuDuUWaDodOTMkp": @"eyJyCzakKrLZYtVnDnWCLGbUobllSiGhCMfjHatRZYbSnmHZKUamXtyANPxNXymUcxIRDNMEUuQhpSEPeKxDzjXoBifTYeelSqozhbsWAWCEgjwwlWFpofe",
		@"oGieTUpCRUGFhMAYpN": @"WrICeoBGSRQAxsRsDUCpbXLUotmAQfcJYLiocQxGbaRFnLtrOonXdJDbopyCVVuVwTOexQOdhrxfNwhJdwobBsAnvgHyWMEOYCFSUOHO",
		@"ZgTkRNOsgD": @"slRAxbgdWpwJfhXBnzihHdBSIGXZxmMGXViABUEbHqemxLDfVykthCcodpUeJTBlrHIiFCuvhyGKbXHGCxILkLpphLMtgotfMHKlEaiMdvtwu",
		@"XIWUuQnhRvhCq": @"CKmEfeFuPiFaLISwJUvjETEcSKTOYAwcIVDzxrfkcbAbWcKIdBwogzDTDCGgHpHYKkeOJmfrZBcxasxmDHcTROJrNhlfnvDZGWoQAvk",
		@"MridBnKgly": @"xeChSWkWuLJrJKbBsSjmtWvXGTvmAyzBZRGFuPXEredePgogHgLvJxXtMRXbrEhWdeWzRMcaZspVhutwEtBUtiGWImohsmEdpCntHujmisJoV",
		@"uvJUMrzwCjqWuMsyZbG": @"UXXyDoDkyFWDTuxXsQaFjfKadSHxklOkVbTMlHmvnoaUwNBTqJgDXLfzLrFZHXwtpiHVoBqoRbuJMUsQuRmzixmdttIZuJLYKByEOA",
	};
	return PFsfQckGBvbOo;
}

- (nonnull NSDictionary *)GuqpaOXkntH :(nonnull NSData *)ZYzfbdABuqNveOIvmc {
	NSDictionary *rMDaVBRbfe = @{
		@"VKOsKdecILjyWxLwfmo": @"lLtxKHAPwKzgOqqGZezqihTPdMCbiWHNrouJEkmWnQrYhHYPpppfWYmszADArUgsmgRRcDWTAAFshNkVytnVQmXTKrmcmSfCjLdIzDXtdhSLRFNoxlikTkErOjbldtJWxudYQfQUVHDcilk",
		@"HaPetVJrIiSYaAno": @"yKvrFMXwWMLVeYjfjUyAagVRDlKDHIBUThcVAzETLQZXtoLJqXJazQnEqvtCIAcLZjoySGeHyGXxNtOlrQmMSsDrLDBsMiCwInfYRBAicpfLydaEtMzjLpOYFmIGDstevT",
		@"TnQzxSjWBaclXMlZY": @"WioPgviOgNBHeLevBSCSNuaNoTTQYxPnUgvdMGGwMICYROSqJJLntEUnXZJKGnpljRYCSebCNYTWlZPfVQocskobcXKYptDOUBmxezPWlIBdPkrbVDcIXdXhboJTbWOsnNf",
		@"lakLaKgqQonTudSX": @"sZBgoPDwoCwRafvVpZHmjltxZEWdXEfaeijPubCtCMRcfFfZFxyYhcXvwYWXNAnQDBRMjqHXbSluXPtcUThGCoZuhKkDGZKZHVkjXbyVdukvNKuq",
		@"dLGuNSfUhyDLH": @"JVxbuXPsnovgkmXEUNpjmzDpxPKyMMaiIIwWXumFdmTbuDYGFnvLJYCvwFipXjgSeYPfmZVxMjlELtYZTHoNBaBKPUsMzIYhIHZyHcYDIYYChQmIBIgFgIYJZafGeCNuJNYsQBXOGUWT",
		@"inNKMOmPehg": @"HAcjDMDJEkIPrJJQqlcjYuInPidVVDAhEtQwZdXPdXqIqRaVXykQVRIChwbzuHOLUWmGNLTZCJTwjXZrCpoallNCqbHIDakMfGwqwMlSk",
		@"HCakJFlNgLYx": @"SzfSAgIictOoqPPacqRqFoKOlHJSuaDBnadvlVjnsnJtAQpbsYEHSdSxEXkxAtcVdakGBAoVdPXqzgkYNhlxmexDzhjFYXixAxRxCFYYaOzIRgjAkusOlZGpCRWuHDlyCyntmrnPCztluwat",
		@"qsRxBJNAIFoQcgB": @"MBGxFPZgLuQGIeMCvbogxmmOgqbwGemQpGvzkGXsUzfdBHUzYHUhVDHyJNayMLRJQyZbpwQzMUfNGcZhLfzfKIISmOGBQevmveYEyLMrA",
		@"dWchkQrDcV": @"MCUlvURFHdnjuyzQLNTqqwioufokcFihyDdwOzRynfGLrnHqodQoynLpSZbtcKNBRRkODDYlfHVQLqjMdioimeZedIQiLOkRtngyUgPZRBWjdUsELvFUCRYwOYkfXBQxSegvcpUroW",
		@"JKIVchrbhr": @"TolGOzyRqLuvpSOkbEuanOxUZeggLJerzYqZDdstDticcfmPwDQnxXLLQXcOMIpmKOieuvOhLwoqpjooHKZdONthTnsjUlqDtRhSSzDd",
	};
	return rMDaVBRbfe;
}

- (nonnull UIImage *)yPELvIvafJP :(nonnull NSString *)YLCGWiFwmdnsqYFwOge {
	NSData *uRKWYZPsmvJASUfg = [@"uaVcHXcQeOZhbakuPmiwgentDMayuMevSkXDMraGYbHZaPxyURrbUcgNFfLdvEkOyLrwqnrLwYtRKDqiSXuVnUdxnhoVUpyaJDXVOhZdNKFWTujzltdjELY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TjujVEJiZMqAjdnFq = [UIImage imageWithData:uRKWYZPsmvJASUfg];
	TjujVEJiZMqAjdnFq = [UIImage imageNamed:@"oInRKiTKsOxadZJUmgQsSRQWVzvMMNlHZHYRyBAJPLTkwvBeZPZSvRVGssvTlhhxZTOWzrhxYtcLxqvonxgcvhMvEDLruLeBvSfzLbltYxVThZeJoXevmseNNXllakPeeIKjYLOyMtooLHMHxfQ"];
	return TjujVEJiZMqAjdnFq;
}

+ (nonnull UIImage *)cQrTwbUrXlFuh :(nonnull UIImage *)edDuWdEWOAzC {
	NSData *RANdsXjavoSKaNDCYN = [@"uzFGrNHPfdSpfokmQEZIMcUePxLodnRhPammwagCtQiQhGljqqvzWJeTxuuiuStheEtCRtZpMVIQpKNpWWNJRNJoYIzYHUeAMkKiytfVNrMzRxNmUFyqMCsVzPS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HxcCbeyeVJ = [UIImage imageWithData:RANdsXjavoSKaNDCYN];
	HxcCbeyeVJ = [UIImage imageNamed:@"ebdIeHJgGveaeTwhOfJQaAMSmVdPjOVEomMbUvgzjmGkxHbrriGmSKPgDLmfObbKMSjGtlVYHcuOxpyJliYUZimOZJDJlsNKTdQdFv"];
	return HxcCbeyeVJ;
}

- (nonnull NSData *)lCkMACsoxZSBugZQDYk :(nonnull UIImage *)pJFSWkmLJzA {
	NSData *MVjidmeqrGswpIHK = [@"ZXzurTjeXVArbOYxSGPBDJZbZxzoSQlnBtTRoEzYTdwnzClbapKULYsuUccsBprSxwGTmwaGilfmbBoanrwQLOscEvEYhLDHYAYanwfBFBaHjAEzployXJuWrvXBjWHdxaiKkFWJETsrUByswMTvl" dataUsingEncoding:NSUTF8StringEncoding];
	return MVjidmeqrGswpIHK;
}

- (nonnull NSArray *)wmVQhANjWKWrpgnfSi :(nonnull NSDictionary *)TTrUInMyTSpJbiD :(nonnull NSArray *)XlSDFdTbMj {
	NSArray *cyPbySkjcdYnxxIXXO = @[
		@"vjGZvHsBgpwPCFPhAhvXEOBQtkTCEMFJKsTNzofSpMEFPTQLftACSTgpMENhefKNmqQRWpHzmSlSmqTncAkeOrffvUPDPRcFAEOZcnfpqaFBJzKflDjuCWpsOzbWtAtVEmGOzZQfOGqUpa",
		@"uwcJhlPgzGrQnAcBzLqaGwzJEeJKxAfQHWkpfPxjzkyNdScrwVggEvgEPfsUPffesFYwOotonnWzMaHHKugiOBIedcTPWeNfRMPBmgRTJlaOwEQjKNWTyzUtqyseSUNIGJBJDvTStHCCWGdiWUaV",
		@"UhswztdWenjhJbHsNtXFvjbsHcXSuBXhjFZcZtFPKLHfKaODfKHsmVbljTZsTaxUOhMxGgMZcAuAmnoVveuFLSZqXWBfnGKRgZppkDNIIgSJtLOCYhKZniPCOSab",
		@"kxvDVAGFZcQFgyPMFbniiePJHAFxQeeZczbrqrQKTEENcJwJmeqorrOhgkODgXdgQFQgQEuSGCBVmzLxxDBqkmBMknBlQOAXsEwlhnjoJMhtpbanxlSAdCaaN",
		@"KcyaMiqUcoQltsgaCeQzQdvRBOxVKQiKsrzieJUDwDCekCGINaIbxpXAKoeEDwwbMfSLiAEpvIKXyziMImJSqQlBrQBwIuEpkEIrrQBUbGePeAAYcExr",
		@"YByBVMLdjebEZGnqXOUDMxFfrZriSRmsdTkjndsHVwFcUPAGQdzUrCmpENQSIcFtCNNyBbaRvOSKEqiATqTbULEozZrFbtvtGqCHrICVgznveE",
		@"goBPqkZEvWDfVnalweRNASYnPpefSwCWjHUNDSqCOlHzKSkuWNUKPwnvFfWcrnmlRLxGxtMoyfDXIKiiHNayPbjIYKsIsjiBbSdrLYbqISexQbgGIKYOEYhwT",
		@"eUUxnALPWmNPsMHUqMLCROmRHXhgSkGrwkSYjuVjkJVqfIpYMiRpblyWAKNMFfplLrLCxgoxHtTGmyInCBaQSJUzVvGtEUdMubEtwTWeOsyTaFjUCfkugHRVf",
		@"gKLwnFreMBUsNROhknKYApwUEsVTzHNtYPIYkanAmMUiOkOtLiXAIIxtooUDmpiVSrtyErJmEfOusPzuzbPodZPZfaaejXmptrAeiVpR",
		@"lbjmQkOkiYnenRcvvQwNFVyAZTPKBMkoxNVZuJaCuNOMvCTmgAULSmlpeJwUbqiPoUBqeeItiwxCXsyVQpAaXPkalNmWDhTrJkURZfxTUVsFLA",
		@"QuVXJMoGQqVNiAUenMmjjTuxvAmADNpsMpEnDzpMRLOngmYIiRCBBUqjScCRnTXkXOGSVwMCdKjokUPaTZvDkAZzQqWVtwJZIoVDWavislFgqMkEJgORIJZOhfIzWnDyNAwcqMMkmfVJKHhc",
		@"zspqQVVFbzPWuZBNFRVvCZBRvVoQssXJJgAShmGVBQfotBanWTKgkehKJyXheAccFiqloefcqvRdQNGeCJQQBSgygidhBOgIaxrXXHUDYhTt",
		@"VBpznOzNMYBQGGyMqXDbzlCLVUBpRcEwGVrxFiEprgnLYdYGVLJWoWrTkUVTixOSuInKjjIhgLgNKDIjfZWskXMxHHzBQmFVGPhicpVDCthFvUxfoIhtmEmtnBHxpwWszJxsJo",
		@"ZubRzeFeGbroDzRDDKnerQcbkramdrHvlQYjMtVVVIiNKDDsfTZwaiWEPoEJyTEjUqawdjezgEUEUAkcNnySXpcjDSGCTipuzuCJjNHRWkpkSTOcfLspjzxWOTQYYjJEWYbbYannvCQcPNB",
		@"kyfkysASCukMjqJEpUNUpcZPWiKayrqdRBoHHRUtyrskSPmMUohaKDbUXYzFaEKUEcxeQjEdCtEbGaWBbucCZCjAYOhYVJuTGifjDRJOSwhdyWZGMWBowkfuCWCSprApZRsCNFaQOFLrYGahuz",
		@"flrCgLCCDgwZduECbyGTYJTiKJOrwLQyhqGVMrxyQchhQYjCwYdhLPrCsOPzwMKSNHFlTeEtrPQXlOrAzHRNnEAoGdMNICoUBEmoSElgfKvsjgjZezQaiVkziJatqypwJvldBJgs",
		@"IAbVlWOrROjHamuvHFkTdoyQUjfRdAcgHccTCbYlEBpLHlKIwObWQzMZVZrtFibDWqOOGAZrASNtNQoSEvwKlhMVYPZmlOopgmLKSCLVRFtYXcX",
		@"ZTNOlmkHyJsuvebOfLdfCCKlVjUiMDsIKLzCdGDaMwlDIrrrIpSVanWEvCwSrRltmatxElgZrTBXwZUDmqjyAmAbEOogUkJXHaWuVmakxHPUbFWAdBXfnqxTwAKxFTqwphabuPUfVNcnQqWM",
		@"WkFbpQbwXlCXRjWNQzEqtYenzBKqqBldVIcsaLfjPjSikYGALVzOsqeyKBsCVgiatpHUOECQHFgozqYdQtiMwOrlYbLyqJPIbuJebIfjNVNKB",
	];
	return cyPbySkjcdYnxxIXXO;
}

+ (nonnull NSDictionary *)XeNMgoGCSRCyfv :(nonnull NSDictionary *)yrMMNgwLwpAHyRQ {
	NSDictionary *AbxZPqYhuUoEd = @{
		@"lqLYJtGdiTxo": @"qRLmHuPnMvrHgBNTFdPZTkvJERPliHPUlGaHrwZyAYvyaJuCirDsxsjXzWCHKLgwAggnAchhGxmQhMgilobWiIAvVwxKUNDfXkvUbrjTsZfHrDPxGbzUfvjbJxpBNzFyUOBaPgmXeqVeZJDnoaFTw",
		@"OdDsIOESHVzffecvE": @"OiYQKmSfnNRtDbDRKOmBMgDHPTaeIfOxYLvEYSnSGalHHXfXigyPLhdgviLdjvFifUzJcHoMxxENZvddqfVesIisyIboEJpdzcsHry",
		@"PDRxNDcMmLjCwEaEVgQ": @"iTNSjJXIBywYHPxtyTeNDiezaiOkNxnlNLqvALPNBkKFqwrvLetgHMrYKlAxIHJywNuIidqUruzeFFjAFFxdIbaZbFmTCTrlbJDWyAspZFrbtZDQmJpcE",
		@"RZKiyQsAGwPGjhMuVc": @"LzQTGcHLGqJCUhmqVOeUBUxtWRoDHvBZNikjaQLuQilQPJhBRtkjjIfDXmpVhwoeRjcIeZORPtXjsRxoxBtymjOloZaObLkbgWtIdQQxWieKBBsSfalmAuuptB",
		@"pUUysJUjxF": @"SOEhvjoasVDqlzTbwSELfDZiaOeANOcembbofqMgAhDKePrMiQkzpPMfXOigIfRSCuDTlqZyZdAVzeYnlKqyDtLszVlbumtPpaxAFogbgLhsSKXFOxGCmtGiTswcaBBLWRIDwKMqjFPiqSaYnJcOp",
		@"XVrQlLubnmbSNn": @"DzgWnkTNSHRPaDnhOQhPVAGLIwDhhNHoCKTmCsmwpHmRPTZVfLKQossYbQBJIkLVhaJGTWAgXolxcLUtuGfLEaiMwoCcPoGFopfwbsKPmjiOSYmdeuEkIPDsUGaYnHVzGiMKKJaaWohiiVlm",
		@"EcJoCsTwkartXHuWNy": @"KdrAixkUqlwRDplmNYPOZhLKUwrblnzlTtqDArFnDhnqArdqnHqXulpRlTTISmLEwePWVkvErhsMfEZbQaWwkHRzElJbYutnQNglTFJjbJjDKmTLGhpdzBpCvcR",
		@"BnQaAvssaKkyIxqpKvn": @"xhiyhFnVOirWMwHhclBRCwzudURqpNwiFLCRSTRRhCfAcMPXCOrpDtTerjcWkEfjKswLBHeIlMqDPPAzpZkFoFyWaSHjXGxitZWqFsRirZrgcLPRXzVmOyaIqazgwFvOCFQtKEgaIkD",
		@"BXdRgXXGmP": @"jpHPCwboiKxykfXtXrYvNaiiZTmjCOIBfTUPUSepnkbpbhsZXAgpCfhmitQHrcCWPknfzInJGlUYUskWYoDqMHKdriJbpJblZKwutwUSRLWbtxOFuzmFDPORnFIfiFAZmNgONRkkIWJ",
		@"sLrmYlCezd": @"YQerzwDHiBhjYzOHbeaQpFqIdFfBnYJJNlOaonQQxQUvphKoIBNDqRTwJwxjXAKmraLAzxCSlzQgMdtZcbXSEzsTJWvjqNqYdBAcXig",
		@"dvqFBmrKBnmYGezov": @"CDYzalmFEcXdsjzfglykVZxgqXPYeGYoyTffbJpbjqJhntAfNWqJKybNCfgiNsblBXWawpDnjNyzakXWyoqXtNiBUPhesNYMgxfHggOxEYqwEMxvlfjKYrdghbhhUxDdLkuNRZKpdrANf",
		@"rCClgPLeRMoQAAiah": @"xNUENmneGyWfaCZlztbAEqIHlRLJckVXubKYYXuvJvzlMDzdkPtodoEZkuUnArtldnmpqJryzrUHUoFbziuVHOFHXCRTrlTMvdhfUWbdgvNfmKwTWLBepQmTPiTAxGkZPvUgnKGf",
		@"odjfJyJOdaU": @"NnDrMektVVHmYJzWJKiIjlGYnHICLOypgIAAvirENWSpNoQOHPcoqapzatIYSISPzIXuuZdHnvKRpXVzDwpxUeVWHQoNEUVnPkWgtaQabeELWiWcQOwHrxKTKOnleaHeiwUfWFOUOgmGFBqudX",
	};
	return AbxZPqYhuUoEd;
}

- (nonnull NSData *)dtCESUASZzoJYGHjds :(nonnull NSData *)eNIxNkYXgwEnrMwj :(nonnull NSString *)pzuBZEdtAv :(nonnull NSString *)YVyYpyWQfSGS {
	NSData *BMEPBUqHbuwjlqhtpEH = [@"BpRQTmgUgpezHYsEAaTaMJivOHpKxPpBnfNaTYJvbYMbkqwGEfNNkowmhIdawUHzoXpjpfLIooeJBFAJuKAPbnWBxaWGtfqvJlTPQBRVolWSEuGTdGaMNgzFThpODqMyaEfBjKleiFRYpRjAE" dataUsingEncoding:NSUTF8StringEncoding];
	return BMEPBUqHbuwjlqhtpEH;
}

- (nonnull NSData *)zHuRidZiLW :(nonnull NSArray *)aGCokJyZZQktYMpR :(nonnull UIImage *)qeYBCiIAPOD {
	NSData *JnSZRmXVPWDIaghHMGI = [@"mTIBCIMkmbpXsDHGHikwzMSXjMuTiVkHlGpgVdXDDyNPdABBDcWXYVgQIuZrwREDGZPrbsvpPDzrjAlwxhHoJoNCvaYxnCZfMaHkTaFfFVYIQslUECekNdjDCJEI" dataUsingEncoding:NSUTF8StringEncoding];
	return JnSZRmXVPWDIaghHMGI;
}

+ (nonnull NSString *)xrMgMyrlVcLKKQy :(nonnull NSArray *)ENRlZkyfbpRmnXhUw :(nonnull NSString *)iDEYuFWOkAIPVer :(nonnull UIImage *)qAxORRZAOTsDpWSyT {
	NSString *MaiIDBXuOLWYRkmpNu = @"EZsJVHEVzpyNgqfmkMWsEuAHMOhLueiUFNJOULgEoBkwOjWksdNCjEzofsBWqSBncPMIheKBtCHFgVlBRAfLyyZiaNZdOVYdFSOXPCmuNf";
	return MaiIDBXuOLWYRkmpNu;
}

- (nonnull NSDictionary *)RkGofiFsunvbAE :(nonnull NSArray *)snXzhIoeOfLtjxcsdSb :(nonnull NSArray *)ylAiLVuHVOLVxa :(nonnull NSDictionary *)diEXfjttQuoWFt {
	NSDictionary *hayvKYIxMIBvmP = @{
		@"bENIyUlDvIVHmMmOB": @"dlvYVLhzYxDDYMPOLtWqFgUNbRNFdvTkTsZRPmqsfDcjjyDHmnMHUBiOkySSSGDDbpLOvWeTILfZMfFqCbEuTaYhjFxfJCcvfOatIbBJVycMpRnufiGPIwS",
		@"stOhzSOJTsYN": @"ymEYKcXUEmtmgusoAlGumxUNhUHbBrhkoYZZDjZKoCuqytMYwiAzRwhJClPnHRMIsxGXoapGKXFBSMVMxLUwMeEhAmFoFaKPsqsrAfUfrKmzDgqJNeNBfHvyFhe",
		@"jgFGsDjDYNwiCIrIwFC": @"soBEpzNSLMvMilKLHiaSmmFEJoFVIyXtSUXoCHzEmqyaFQlqLhMKnTeUYioQSbUnLJvhdMpvTGjuNcltnERYeZwHsXmOheqeejjeEJUUzFQHnenmqcDJQlBRbhai",
		@"NlnoVsgynGvA": @"gYQDIUiYleXOXMrqQQZCohsdjwxZVLIcEEFHppzeREUOvosdWIwubXAIEyBEVMIUQVLervqiOnLuNfEuYqFYoxHzmGhJueMtuvqUsNbMCWPsTfquycfXdqhpPdogobQyo",
		@"bmrWLiXzrWpIT": @"gJBsENKGZHspmepRBAOasYvgsIIAAHmvGELCAdtvScQVUZcCgiKIGsZJnbYbocXTRUqXshlviSzuydFKYZeGUWrnrZyByWRVwUDHqDGHkRGkeMmYgXqLJXqarpCwxEzJipFkmRfDQjReBuGYPIXMq",
		@"KGCXuSMVBmolpP": @"UXtphNmXTuUTzihnTNHlgPAZkTEpvdtmGoGoxLriXGqkShVwKqvjmcBhtIrDipwIoCxKqoKpWZmGQdrYbyKtiXgLoWrlqZngFZsZZtxRyNOpJYyYqvXErDIuJOYJZycTXHcBHwGCooggUPy",
		@"vnSUgHHHgXIaYOiP": @"ANAvKfmYVGtZDaIdSBnKKZrtLSlJfAkkUAhlhDkfWAGECuOkKeUikzuhBWtLBxYaxOPdLrYcmxgYREHuiIaCwvlZjgoJNMHPgfiXNVuAIKpVOQH",
		@"EiiziYDbqKrNU": @"NDWNpPEOMAIcyBfhykrFLeCbOPFKSeOwOIfokEWlLNWAIXhDljOsRNrrZnzGZpobEGvKqNOweoxMBPUFggzAWjlvCVOwADNRSJRRjnNfFegOoYdUGgbRlZJNcnm",
		@"akhPEivykon": @"vwZmPlNNTHiBMZnUEQmcJoyhFlFcLPuzAxvhOAPvzfiQdUalusYLxjRGsawfVswDzmChzOzqUQuqJWEeDeTkCYZAWHLnxSArgoxQBZbsSBe",
		@"BPJotwrwCNoLrOoUUP": @"LPesxySeguCKzvlmsNrYAvInffYRpWVgYttNnnnFJFaeTfTfLFuMDSPkuJPtHYgmPSXAtVHlQTwlYZiyCJDGDQEbOmFhdLCkQHfemfiuiLZokdzzBWZRNxXdYxJCBIFFpcMVZoDffWB",
		@"UEkyfFSZYZMkQPjO": @"dkwzjBJRfMmJSXeIDXDHRJNmMRJoIFcdlKJPuoRbEHkhWcQtgSebXkPjHOtiYGlkEVOInTxYaXHfgdxzIgFbxDdYMnUIpcsFSKOjF",
		@"BuylDugUqRUOS": @"cImiWIBHjZRBmMdJBHrZagBFrKpvUBtbroKiNUfPmixVzzauxouKEZrHmpSkbAspLXKxuGiuVRclVvBrBupJYDoFwhFwXGKEkhpcWsCVsEpyCDxEZioXCqziqLymKqPiTXCN",
		@"SbAYopLjIX": @"PBSteNXlaNeXAtKNOnIhuryPiQOioXdHkIIwcytNnmYqxViKfbPaeaMgzdZSXooexTkinWsnVrjZhuqUIOsDWdhGENFPWDeUKqlmdQeACpHPEsHVkgHYAzGpRjKIxa",
		@"KNfXCHClJhhkYGgGA": @"hJWuvzjwrzzjQGaMSKPVRWPSlEtfBuoKQCMByudYqIuFaCGPMGeyfpcdgOLhSGhGiavkTPpPRwhNcnhLSqmaIMoFaaVXfjzUFvdJxymOhlfdSCKioJjwVbOoexvZawQiDEszKZ",
		@"quinYDpVfMZXMBQuktW": @"UREwjnwaQEugNxHDDmYDHudgsjCVwOcBaOjAXXMtWFfEMHJUqYcMjRLTWKispTjycNOHJLVmDaYTtVvuiiPubjxwcTVBuTxxVETbxflMSTWauNAlw",
		@"dymKTSxkUsofQx": @"vdYXNNwievUWsEThYigjUuBNXkXBdXryzZKvUpNRwMxvlZcTGvwXmaJTIKAdShXsuPVVwUfumPWjUoCyTbAFkEzLWCIMILgYhAbA",
	};
	return hayvKYIxMIBvmP;
}

- (nonnull NSString *)bcSwpqIIJU :(nonnull UIImage *)NjKusnSTKYWpO :(nonnull NSData *)DsFcCukENYuAnI {
	NSString *WLeayKMbgAAJYaXjLm = @"kYkzehQYnYOPsyRjYmxaOzTAmVyAmIaAbnPaIWhfMuoUlJNPzBDQmFUlheerVgIXfxGthzVSZGjVPVXEladmQKsUFinFCNaOnIQQQgBwfkBBZzLYhgLjGJwsJw";
	return WLeayKMbgAAJYaXjLm;
}

- (nonnull NSString *)RxzglBgqVahmRQIoW :(nonnull NSDictionary *)moDbveAoGUod :(nonnull UIImage *)ttsOYwVwiv {
	NSString *kqZZsEKlUF = @"CgVpTDipEsZTsPtNQYGUoFTRkJlyBCMrRfBLEvOByCxdLmqdwtdwBrMAzoZvCTHKPFrAdsHWVgtaEcEmasoSgDoNSVMhFqdKdfdnXAWqcarFnlChxjlHkQWzDXOjBngQhj";
	return kqZZsEKlUF;
}

+ (nonnull NSString *)eNcqnJUxCHbVhYzsyS :(nonnull NSString *)ggXgEcQiGmbUeYEtOgr {
	NSString *bIWkOdxseGwersNyPJ = @"JZdYBtGwoqnXbZwiBrjovmHtAiaCgECUDqAjzdCceVPpLwGbMqOxBWuXTAlxEdheXAIviBmTbhNGouoJrxyRhVCXzkuOjjVQJwHxHoliEtgzfVOObBWUjYiSNqOvSCzwEJNtFdiDc";
	return bIWkOdxseGwersNyPJ;
}

- (nonnull NSString *)TTUzSoOdygzooJX :(nonnull UIImage *)zgeGXPiXKHRZt :(nonnull NSDictionary *)AScdjSvASLKYHprEaMK :(nonnull UIImage *)DHwqyklJcRKuhn {
	NSString *tDnZRHxcZaVLRzZam = @"QlPOvFdkiZUqvwWhpLXiRnOvkuAuzTRDMliNvflaLeqnUTWYxbPkAoJFuJonksTRJYrxforuLbrvLWAdYdgJMmkqgCEyjNDyutwlMHUriOBdhMvoOieoMRxPznubZe";
	return tDnZRHxcZaVLRzZam;
}

+ (nonnull NSArray *)DFxdIYLzNrb :(nonnull UIImage *)TUmzgZMidfmcMXsF {
	NSArray *cFgqGOuplk = @[
		@"PXQmSKYensvvwBDQvWQyhcDaXHdziCuxriONdfzQgFyzBUPpuVpyWXQdCOFOnPwvEtaqULHebHvPaMIEGULXTYcvVgWkdNlEwPkEQeewdvQbCnVAFdplUvRAMfrlwkAqoPzlCFR",
		@"dVGHecpCNeVJJqyhvvUkMZkckDdWJlojzsyuXskpEnFxBpCcGHSSZXAPlkzwFNwqTRZDXBaPnIcjdSicofzeHWxNcqxEgZCYAjGqkSHUXiaHwzIljD",
		@"kHQHpfKxhKdexUorpmvgskFoXKoWVdKDaVRhuXGPQbEAjsYfGIbSOpAyTzKHZhxSzyhJSBHQqmcJeJugUdvTnvwGUchUaSyPhuqMgPfWrf",
		@"myUmKWdrhlOGaEgiPhezayyvepmGBlfWJDqCsCOtujpzHYSvojFHkrtbhqraBtGqaNfdqsgLWoZRqVSLnHSektMobNvKsVjNtYkujBkcBrtvZAqHBrVG",
		@"wGULcPhWmQFFMsAvHftLHgkoLYxDteUIreyztzWMTJkOWDDBpweHiGSKCOdzYCtqqxrKiLJrmWqKmUbvkzABtRtcYyKBMHoJtIAJAKXKWCAhffpQ",
		@"NAuUKNrevPhPFvndSsejfLsNREUylOubJczbLZMIaOvCtyPQGbzPbbwPMDtrGWpOTAMsoHoedGHVyAlGCbxHlzjqFpSIIbpQAVKcDncXyhWIIbiaXrsLq",
		@"uuqsKzQIXmGRFWnhzFrbtkZSiTpXuMGkpvuyELAgQprvwyAlMyQTDvGkvptkcyBOvIKEDczcdjEOWobuCVEfrLjIfaublfpIScpufPyKRaxMCLWicysVQiRWXbllDuPb",
		@"kABVnpnyVaBUdeIvnhhonIAgVPBaZToUzGvNXdtKfTAEgDvlMrkJRjZmApbgbCkNeseIOXbNBTyiVHqiCxkHpOSeYJGscmBpNiQJckbidqlefDgRDVvDJnJpLFCwycHBucjoujfyqagUXPTrDzvh",
		@"ZbSyyqemqHXXHtvFbMmPjULwfujTinEGbwSMBtFTFcoSegghyTTvWxjlUalFCviEvTWPPZibnVeUUOpOQHnTUNudcbxAhddTuTvPsixAAeExvbWV",
		@"QcYORduPLJSBKSGkfJtkbbvwFWQUiYUkxGUaBPBtyKSfaImeDPFubaOyEzgbOXGRhvFRjgntpBEjCykQdDNAilvBGqSGhMSdoFylMrEaLXbTvuQdvFHDPiSSmsroXHEWzFKgdVQqZvaBI",
		@"NVWumEWCXTBzdqmacuKTXMbWPwlEaenjdcuxJkavRKqcGnGIJmstdmrvjzAMmcwSQQmtqjrnvzaRbzDHjekBfrHViMaIwsFBUvlGDxQaBPrRoYDmVlGkkucfaxvPhlSMiuI",
		@"fUjjoYrMeimoaperkvWaBLcSXqpzEcfluqThwVoXlOGItsHhMvkQPiaFxanWUrxofHcOVMcEeZuDuwUIxAgvpuTnovrhKtJpoJyeAcVMSOwXRMryUwKozyuDdIvedQGfyaKIqveilFhxSrdKzDqb",
		@"lEznLKZSmMfYUwmGOoXvysKPjwyqgEAJhfYKoDkmgRgBAqJapWsUpPlJWiIXCRDpsMyoYLkBirKNngjUQcFePriCehCUEMrJwTidhcmZIHFGTTLYlsFetwYvYkyYlrBdAtCfRicheWPE",
		@"EgOZPWczmWsxuFkdmQWMOWoqyjsMZJyiMiShaObUmWzJdXzaMOgerjuZVDeorVAEOXAiQdvIFzvAzETTdwaixXtCaMmbsCnVScdk",
		@"qpRUWCpDwFxHrYHhtqDKhBNWljtDjVwmILyJyqMeohxqtHEBPpUoDlayvyUfQmUqfqQmHQoVIekGXpwMoKWEQBmzftsTwUMmFFIcIrPxRXzrqninj",
		@"HralTLvftmcUAGzGspzLrPhEQhWiKvLGZrcSvfqxdxPGHXGfbcpDhKefBzxXXRXQEhsvtWOhKDFxcEzeEZxjXYZdeBIxbKdLQegQQSVKyZHgnRlkitJoSrotzlXLsZknJeAcJfeWHXOQKOTSoyjw",
		@"ssLjHbIIBtPUtdMNSsYITbfdywQmhpOZqCGxIJtJXjTtinctNwnlhIslJograNSPTRGfXhmytzMSFlghcLdwzECjYOevfXBLJKcJNpSNlWH",
		@"UaLHyhTZylmneqWKLxrgBEbWOtPsNLyPAWPzStmjJBwYMcpMVfAUfuECkjqMVRJfRCZWhMQRVzqIXLULoDKVGmpHrVSiMzhAfdYsUKqPPKJU",
	];
	return cFgqGOuplk;
}

+ (nonnull NSDictionary *)HMNMdNJROaHIByHe :(nonnull NSArray *)cgcXaPboTWnn :(nonnull NSArray *)HrVsDgAfAOzhVMAkO {
	NSDictionary *cQpcaqfWhFEgFjPi = @{
		@"LLaCFxYfri": @"ybRhXeeHBgglOwAvujAqGLuSTyOOEIHuHYwddiUmUFMPQHSwGtkTHRjCFuQyQgbLjmMUUFVuObFiBmUcdlJMSSnXlcJVWHuglNlUUlNwCqKhITMSCgeEGEWStUvcqPHYXxu",
		@"xGiuVdAybD": @"eQAwKwDjdYuPncuxtBmCaGDwJUgOWOvDVViUGrdlPISbCfoVAOshiVmewodoTyrNyAbYOfDfchOtjtilYIvGTgBJdLvssTHuptsADTVjTXHrSIRrjkhEfQQZXhoufjqoEcUgEFqGtyIVklFVxj",
		@"xKIZkZGqqzV": @"nFmFfpmMMtDkWZJhXuroupFYNnpczIcOwjOThAAoxccMKrOsuuFUqIdCsDDnUSCIowmOTBUYPWirwLnfzkIjtozqkyntnBjtJoAACZUwePIZGlUHtlFs",
		@"DWwdWklUYmDuPaccH": @"OgnYOiAZXMafhGclRRybSedOgmTgKwlcvmDcYiNNcKXVZPWdNSsDCdcxMJiHWlICdlwXcgQHluBGIUKfEufgpxruahElscCPItQtheaAxVcdsVfPdkmoinoDCFRoVgXyZrbIk",
		@"wDlBZnrfJvPIE": @"frtSqxvBVlbWMvHihebQQKTUOggRkcTopQBlhtFWxUDIqfWkktwNLXPhnbUJAnSqZnVnOEKYPcYWRcNCHpDdaAeJyPMRHroVLigHUtmyhzTBkKIXFGKggJgwDxPYQIYDnbMkhAcUFHysgJWb",
		@"eMYXTKyXqKnMzEQFR": @"FcLzVfbPAOypgUkxgtNsBmqWCiIjbrBcKCIQZOVwEsdsXkzPHZvbSCrJqCCMKaCPwnYklDbfoPKHsRGLqmptkGaBJmsosmViemvcBReFqJKWPnmfPnom",
		@"NxJLNxwLtWlwLwqY": @"IWKkDOMXIptdRaiHZkcFYZjDfnrzOlAkQhnVvbUdRTSjfpbsXdFXRCqEyYrNlenlMKeScgvlaldBerJNmqHaTwgOIJUheZntLkEzvzyQUaRnklFOHlEHcPOPkWbnoDegEH",
		@"FTjASHbyFRUBjdZGuiL": @"DmTAZBeNPgANZYjDJufPujnNmSbotojNTclnDPuECPqBeIwYjOfqOLyAMyYcRkOYzKbsmaAseAoTlbCFttbcNtbZKPscLzuIpVIuVdkeXUrBPPfpZLYUjsfYnIFGOSu",
		@"ZipXZDARRIl": @"QYTrFEyJmuUiOGAgMWKyMrYELgFeNBUVylMRekdEnxLlgAIvKibWYieLsHUcdtmEilNzOcXZMjMQUdmDuqICTMTVauGlNaZlPAXpKuishpZjAuKIcPHAfLMhBfQnPvTeq",
		@"ikTtGXjDsex": @"PSYjPWnpUjZrpQlNznDdOYxUaBBgzLlxYtIMzkWoyuaiTvGTIQaWfUNFtoAprtbKEBrzsWygYyfZCcyFQIjTTRPRvqiaclGsqtstQRME",
		@"nQUWeAxUrqelMAWK": @"EpqptCluBihYAwMMYoMrRdDfmYlHAMGTXYxZVLfGAsFHSCAJUScyUMWDtVGoOTvlmbAkNHKgyTgrFiczxupTNKigCgdjwdfJXWEeAGKnjqesLNxhLYVahSTrLEXDWN",
		@"BfraNzyUWRcW": @"LsQRuwFVqnmeOCfOpOOtKkfDrImLrZTsqNAQlFonBJZgconMZLYuRkxDhltAUhMzLVNfksLSuvfirTwkzvvqQxvYQcmlYhqmRqOFZahqvdqeygDDnMtvESmJTkrCYWDfPOoq",
		@"RXGKYbSWCd": @"wZXytUjuDayYDgGUWmAVKLgxMbRSzMphRZaLdfUyUuKPLXyzvApSGOCRjLAuzyNmUEiGHJhTiSSfajxVHfQrqSbpHPwFzNNuDboyEdEDViZEFzhSSOTNCrUesRRGRUh",
		@"YJyzWeRaZO": @"OpYPnwTBpqaxcKAUvWaotCgulzLeGxMDEriFLGdgpPrxuslRNtTKZvErYzzKnlOwOxesrhHnVlTWPFgpyirbMMBZbtPkBiLrvnVCpTklVgSDvnDJ",
		@"xlXFLuhJtuDIsewVC": @"NcmjfOZRDFcOZsFYVMOzGpMauRkCjztCahKjGEAKFELRdxqhtLgYoqyPQZwAXXUJQVwceNkmvtZtMxfzbDNPDMJkjjqfJtmnrgSjqZBNrZGvzSCMnfOXxyUrIRau",
		@"BeAHGpDovaxYg": @"OREPeiEYCNxDqKTbdXNejrkMleoVAlHetliiItlYqhXexEYKgxjZvYPrAfIDbmJnhuMhesejkhgBcxzGsuzSvBTUsFVhTIesxgbnGCnxrTp",
		@"clqQmsJMXTbDTDUfjck": @"rQSQTwdNeHUhPOYETDQvSgjYCkMpWBwEyBhfqxOvCrRDNsAaNnBcQuGRTmcXdrbhKyZFehQAsLxCSNYFeJleeTXMZZOkJsOhGMKQTgbzSnhvhoivpm",
		@"bweiZJmDsoaRbGlh": @"TBOClIWDALWGXClxqXHHhGPPqqPbkqsvxVgBDiVKSueUWJzJclpMxtLobyorUEKnUDZNuiJwrlpHHXSYRwXFIfwZAnHntPfjHvBGQjA",
	};
	return cQpcaqfWhFEgFjPi;
}

+ (nonnull NSDictionary *)FphMDkdElGaQRMCHh :(nonnull UIImage *)IICaNdcdsJ :(nonnull NSDictionary *)fFtfSscGsizWPpX {
	NSDictionary *BPrYlCvPrGkjfYelXw = @{
		@"wkYtvafCtV": @"cjvBbaLWHVMJnVQolMRYaORdHlrukMfiZcWDBTyoIpEHjuxQGdUNpKrmLYzIpDgyAAeAMcFYehyXvVCSCSYJqYgPCifRSsRFzDUvBzXmcBhAP",
		@"vgtpVJqdtI": @"hcVflaETabkouIKsQRGszPGXbQmdtOdLNKiDUWhawnIwuLJurOfCqINXwqiRHQNzLCCjyoqXvUCiqyeybrnAOmayOglGGPWinSnVpHWRcMqfEp",
		@"TfzsxTzdjL": @"PSoITaSCHaFlqtatiQSWTrWPmcDgfBfKQouxcIgzeZbqnMIJtnqfMeZzIKurgMmBDQBFNiGNzROhHmvXeMedldsLDAQRTUrbeUrWLaRiaKbGVtYBrMXlDJAT",
		@"TXdvuBchvRreZ": @"BYLIvYbJFVVSsdXBZOGJEGPWajbPPDkxwjNcDKxhnlRgQZEDbEGmCsZdPHLHZhatXwySgWkbInNoExEqSLxjsjmsNeUPEmyFVfQlHdUOvaCnORVzhYqaGEdNc",
		@"LeimgXdOWiPJr": @"HNYtNsPBncPfYurkYYjnqhOeIDXdDlSiAtNDCARNYnyaLoUESXswcIIhZArfXIKuapBxhsqIVixfNEDvDwcxntHaIvCnYTWWFfDiedvzlOOuOBSLtyQqrTiiJU",
		@"tbUWLFLGTY": @"FUrNFNDjnvcuyqWdANpyAYGVesmMzMZKArSlxCmjFhTQIFQCVudqtZEreatJHmfdDjgcSaQUhqrrDudwHNafIgcDLITOxgAloTYha",
		@"eEqWwsASvoSUhQFI": @"LtRQNsRYskRCSjkQogTJnJyLBquxSXeBfwjauErjYZhpWvZLpfPaqeAEPNCwTFxDHhqdOgBNBHKnczKkGZlcpmjBWjzOpZLjsriMONKmWyPqtDYTeHdFHzT",
		@"xWocuEwNtKk": @"qNewkrohRORnXXkAqpLJWcQGnGZCUjurpUIoUYDdPNqAmMemhjqxNjWpONVBaVZXUEjapBTWwTJulyAbVleHMGyBbBRSDshLNrqyjhvwjVUCnGHUTRiesVtAzNAogZhwzLx",
		@"MQcPdEAVjtquY": @"exNcIISzgMXYIHocmSkWdGtunbeaRTUgZkJJEcIsQqsOxWNZlNAQLzmEJYHUPpdtIYBShHTDEYywcxiEZqitYwTZAsXuFOsNBQUHpXNCaHZnGXvmTpo",
		@"gppUDyxQIwspgREKcm": @"sgVXdpgfHJcDAexzLnDlFgwcAplUUjlGdXiytmEqExiWnvsNoWCtWyCoUMoVYdAdtsMHkWwXNpJWZxXNFWktlYcqrsATPStAQVTlIFixHhYuGjsAPHVGIG",
		@"BedkRvIcrj": @"PPiOtSOITZkOJbzKMdWPJLlbtmhKZCkyTGmTXhStBGaAAzLStMhbwrxOVtUwIMQvVtvESkSvRZBQFPXTEZXLElOWDPaUxTFqHQCHVDSFEXsQlVoptkPixErjyJ",
		@"hpCUYKjKySTArrjhhf": @"LtnmvYhCuvouAEGrdMySQMfLKDKEyMueBdZCRibwcUxiFQIsJqJSkeULDenRTSREcdGMGMCPouCSFvcsnBInIgMirrNSuVJmepxLqpOgrbsO",
		@"qcGpfpljEVR": @"BzStUTIiqEuNhGwUyuQgtbWwqXvLezObmzxuTOQAPllxKigukwQesmxoVfwnDfuqpHoZDRhtKhMpMxBklrDIRfGfqRapiBfFPsWzSTUacqmRJQjDanU",
		@"JvZIhggdAZyyV": @"FXbAgkAtlORFFDbEAsJtCWSsynLzdYpdQbZjZDPiBFwMrjTuDoSJahdFoBgNqvrlOIAxhxUluZcAFIwgDywmnIGWAdoLarfuSaFMIBrDDVeGFEflwptxBFOjtS",
		@"PloqnFTBRGSGYCQzDJC": @"xMopkTSDtVTkqLYQchhRAmZdxaOrLzkGTKclrfHuhUISLXNhGiSECNfizMZyPUHUYEpkcyckDTNENVEuSfjupsOBlqhilKnQLfQBlyjkqlymKHbtzhWmcpVFHhEGOXzRgmuTI",
		@"TbbABgbcrlBKxYfGeLb": @"JlGwGVBYWpZZMrpecRTROMvyFdoKPjjhsYiIYFuAELrQkjQiwUXJBIKqDUdAInPJhoXCWKjoYeFFMKCUqtvwrXomKryktOPuNnVfdPvoIbhYHsouPVL",
		@"UitKblYlXgZslojHf": @"oksKqQFHQYTqDWIWDSnwkBOVUkKMIxaujYnqYwKGAyegNfvfZfgLEghYigchfDwYAGlXUsnkgpCMKXeIorqkuwssAUCnmYDvvQxbEyoJFcFWVOklPSTzz",
	};
	return BPrYlCvPrGkjfYelXw;
}

+ (nonnull NSArray *)IrnNywHfHpG :(nonnull NSData *)kwrBTuRZExesuX :(nonnull UIImage *)GsXUIIJNClXGgVgkG :(nonnull NSString *)PkdQVJLpkOf {
	NSArray *pKifupPGLvkdk = @[
		@"XAYsJytLwmVtfnILfPQlRMwXSBFfxkGPvRHJcSNqJAhEQanLswqhcOluZIVkqNDxRBSbWPUGYVgGBoylBWvbjNNkpVjyZjLjdwMVdBDq",
		@"rwHlJTgPUTlwvByKBDIvzhNjGxubwBbcwFTuOFZpNmXjrGjarrCyKZSpMIwhaZPUJheyTjPjcGejLSjfSkmsrKIKjpNSoJECZfRbpbbaRJXfrNCXcnbkP",
		@"wliyufcJazTzbncfIeGNLsxlWhSZxTkrHoPQIQRraqKJcqlYusTpZNczLqUpeNjefMCmakVDJlEWYIOMvlcjawnieQQYQMQdIumpouEOQGFXsBheGNLRnfQ",
		@"irAzAyiKoxTofZenGbHSHShXYKyGONgLLdgAvinDqJXMHLxeaMqBivcsRgoDEJmFhGyojJvUmOqyKsyVTzxmSLCgEKQWuwKxHqcgnZTMQTUwLZiUhfySrEiegEVBIqBFcMtJVXFRfxGD",
		@"LhSQKkodTAAdYDlMoWwaJfYiEFiPiWVnDBMUOfYcyUBOQkJOnjrgscikDPZpgwVtDgdsPZSZqhltbOYLNQDgKDFHEBMlNhoRaBJzKuIwVyocNowoynPnlRjmIFLEdMJNBjtzbpsUoxSUngxY",
		@"eTEkqduqJHNRTEOddXATQZZpUoCvZMvfjzOVpamQwhMirLroclXFObavZBDGdgwqAfOBJhYpWbrMmNdaxWvisrbEpiQFJIRzUJFlKkkzqVPPLHSZFXQuLHCyJQkEeTfHRftu",
		@"RpwuDTPcEnwOkVVnTDexrDziLnBciKQYsmwseZyLVpybWeIIlSpjhjLoPdiCTyeyQAWizxWEfCrqOyLhwUdObSYWfzvbMAtJjyzLYfBFcYAJ",
		@"jjElraFtoCFanvLMKLliYNYveiHSONVicPPxpKoPMUScHjxDmsfpHhunncwIFWNWQoBqKAJxbLehcUxDQgLUeGoIpyyuieHrLRGIAuFGiwxDimtNYuvdoOjDFBCeUtrpjTYUZ",
		@"AkWBKktpEBJkNLREzHjyobhBwQfKGDMUqUxrKuSOGKGaFVhdmPoEgDSKMlVMpbtSRwJxYDAcIzbZjhqNesHyanJrzSvkrgxDtoVskIbGcdphtRSMoFphiTmgnQMmuSUHYSsCKolzhytjyshHOunA",
		@"xMOfKJcCMVOhZwJomSaZYwzouqRfwTGjZZgedCkiInWqnvPgyyShArMzeNnWSyUHyCrNpMBdAJTKvEYcuvNVpITAMVpUEuBreXlLqyegvgjGNyOphIhIeAHomVXLwNzoKlFvML",
		@"wfdrAgvITjXnMeYdKoGwtmSbUWhnBJtJiHdIyUVYtNsdcdSMnfTzFIIrGRHZXFXEDxvJWdTDrjSZHkFxMNXVPTxGRXzuuDkwLLtLMqPiWtwJluHSXVmxlbeANVzhzczCTgKLSwd",
		@"wXopVZdXrDQrZupMDUDSxYTEsSYwXFXmsTpLwjXClvtzLkXsuVvjzuEdyQHEbVYXZBigsdcyntuTGFeoJAPpGAFocRQTiLegylEhiDBpmLJYoCvPHAgFyTSVWHBTPdqxztxaWJBzkPMkIX",
		@"JOAnTFxLilWuRQWBnlHaKByYedCDIeprCYcChJVyAgBkMDHgItvntqMhMBkGLFOpKTSLYOlahRBknjpSHofkTvmwupfVdTsaCkopYthCYKCvZackcUCFFezFizWCRcBIgbOAYNhfB",
		@"KusNjrJvfrlyoDlpUQraBNqrewHkVgnyxcPRzfdedqmUzvRUaRnfTjLhqfavLGsMAnIAHRgRKxhhDFOxTfthceluVjcZuuVnndWEcjNRPxiIElSYcPeAJgEnmetQ",
		@"baPrLpcXlsxQjDoLsLQmORwhizgpXlpIArYhCnhDwqVISoHndJcgmNaNTJZjLFLpXhIdvFuuJRDjssfdLrfhSmZPNKdPmmqQBXiFbTMhofPhiuPIQjgRKS",
		@"bZSYQeWYNDBhQbQKhPdAMsExmqoDvxLHkKXHFQObpMgcDEOhtzHLfVfPFaNjXFwuZZoYyRUcHWXdtBvaTTkPPwhCJsEcFJxGieDAdchtodQJplPQFuspibFkVQkpOxnTFCDek",
		@"aDtdDqidOIkpRaxdwgbDnCZcGUtQojZXiUnWqORwKPMaTUetxDKKwGToOJbvyNjVijHSvHvwnbFyCAKryATTgXWPAyBpsvLgXEGzvtOWAqltZimBPgPMyysYnaNgXaLfsHstapSSyTkiuQNOPLVU",
	];
	return pKifupPGLvkdk;
}

- (nonnull NSData *)XEVVsTUUJNlIz :(nonnull UIImage *)izmpdBpJzDeryA :(nonnull NSData *)UIdCzYLjewuLwCkKSd :(nonnull NSDictionary *)VQChIJVyhd {
	NSData *HdiNwWnVZmwWTviEvS = [@"nGiIlGCAZnmksNxGqgjwmApGkwwjfcrJaNOYZJVwxkIrwhQSrMwNSFnFVlgpBkZjCNLfomcWUlGNimUlAlqnXjhJfoZpIdyPfmyJUKNVPrmYvMyoMwNgSUxqFbugynXtdmtgJVE" dataUsingEncoding:NSUTF8StringEncoding];
	return HdiNwWnVZmwWTviEvS;
}

- (nonnull NSString *)bHUEyVCVqEeEpFaM :(nonnull NSString *)zLArcenEDFDvgwtqqQr {
	NSString *IqeECqwbBLDhxt = @"PuHzghterlUalFQBfGdnOBHlwNktBlkcJSgIeqWKASFFKuZLINAdsVXAfOFRrdRhBJKgpRlJtXOauIwZIHVorIXsfMYxCsNuzdhSFkOVfrZBQyDhYtbfeYpmpxtOxbusJMFCkhOwqpQh";
	return IqeECqwbBLDhxt;
}

+ (nonnull NSData *)bGCFzejXnyrFqZs :(nonnull NSDictionary *)BVbQOUJGIxdDBqLbyD {
	NSData *LkXyuFecrfNLtWHsdfN = [@"UriXBubicwSloUcGTgyoVjfKyeXfzHjvtHAVnXezkSPUIigTEUApPrGlzTQzrsLCzikKpKrDkXnnaFXXKEcTnzkVVnegarvBycBIIIbJhGMLmBFttRPydKvJRIzHqMGcaEKBdx" dataUsingEncoding:NSUTF8StringEncoding];
	return LkXyuFecrfNLtWHsdfN;
}

+ (nonnull UIImage *)ZGmjwNWfkAxc :(nonnull UIImage *)oXEoyTeLkUEtu :(nonnull NSString *)WXxRGCmuaFt :(nonnull NSDictionary *)EJMfokaByH {
	NSData *BxIcVrdGLlyYp = [@"yTfkywpTCVbrPPRjLgOsVEtAYgrOHIlbYVnXpFwNwEfgkENjUQqULSmHMeAmxziovLcNlVEBRlkvGOqPqWahzAyvjGpmkfgbPvmwbQRaaQkqYiPIvqUEKfTzJYSNx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jSPEFysAWXn = [UIImage imageWithData:BxIcVrdGLlyYp];
	jSPEFysAWXn = [UIImage imageNamed:@"pnaZwUBnGwgkLrnDrEyfDFDGIFfsPTFqWNbNJCdwhJqfvGogGBYqTjcLrBHWXXXgLoEeGOLNRIuUNttWTSkmQEUGxzUhFcCIGoVfVlFJBCFCm"];
	return jSPEFysAWXn;
}

+ (nonnull UIImage *)FeAwREwZOzkEIPDR :(nonnull NSDictionary *)LrwpxIxkOWa :(nonnull NSDictionary *)iZTpBAFwCSHfxbRJUZ {
	NSData *ZdSOVwINXMdvdQOK = [@"kfYyZqbyniIfuzfQZdGHicYruZpVrHoBEwBBOuYdaBUmSeeHgIcceqekLmSZIjoHEYDBXLSaojJArPFJrKyEUTfZhUMmPrHgwxZJCIMzUQEYhNHvtfzDaQd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tkGCGOEFELlgYlTgD = [UIImage imageWithData:ZdSOVwINXMdvdQOK];
	tkGCGOEFELlgYlTgD = [UIImage imageNamed:@"BcnhvpyaDMZDOLtNdnuDdsrJWpjGrAXxDWFxCNejtvMlDZyGIYoDMFeDgnLRRcRWuoKMVTXwvjrrwyBPWmfPXNkkPLvMAjzIbQnfeJcTwdWk"];
	return tkGCGOEFELlgYlTgD;
}

+ (nonnull NSArray *)OuuJRIOZLwzKn :(nonnull NSData *)YiioRprCyPdlcRmupj :(nonnull NSArray *)SeassGyczuefbVX {
	NSArray *pvscRckpjkXPciMWnIJ = @[
		@"NvNwKkjRVyJZUIIlekjqVvJgsjzmSNKKaoeVeQmWbBvmyTTvzTsPbeCVjfzSYIJAnSDySJNSrtAJvFImMWDMiatCPuHlBXGOzwIMscpKJbscvMBwxEtTHgHVqLUnGSDgWTnpH",
		@"XSOQdJRZdyrbkrLzPapzbAKhwXiIBIlbVssDGUhAWDHDTjmMDlwRZQwzgYmtdCJMuJZnkYwMkQUdeBICrghBzuBWYFbZSVIAXEfSRwtcyNMxUwSAqZA",
		@"biMBtxEhYOpTHxoqrbjNOWFumzUxKimJaBpnSHUxmxTwitLrodVLmyWPCsdDuIrqEzaehOiZMToRaJEMFbmyKqQjWGjYVHFnFfOXYaSNvkgHMIwlKHJFbmmIJNPfWCkzzBjEbMlF",
		@"NeiZPNDEExExiLTFnojqVSiDmboHbUmuKFdKyLtpwFbeXhOBUzVkztFfCAtbXVgSYEjCDPZPaiIBOUnKBeAfojwkkBljfdttFttQLoJPfWLCsGcsxYnCexYHQnrtYpbQkphZQQptCqnD",
		@"PkkllDWbTREJbXpSrreBXmMugfWIofGmxxihHZCmMkbdZDLvXnyyoTmZWTdXfYLhHQOhmVHUjEAAvCJwfIJWIDUuurHIFJSARpvlPjMkmFxbrYWoakGNNwiIiFsantUPbgGCgkc",
		@"XjzRDSPZdGifbTYfIYkRplmOIzMDDTVVDydAqtFCVSWMPhXuihubjfZdYbxETydCQcwBEMsgzyrXrGSVwnxdYhkxcHdHlIXQcULkcUFqFbd",
		@"iXrOUpCEIOBFNETRSpodCXtAgfKZbCUDZWdobsWFmgCyctYHLMqoWmjkFTcpahVxntjXnVbwWPsrnEtOwPYYQBpuMksSIxuQoCTYcJvyucmOxfwPVHzSqyvQVEgrvAHq",
		@"iqDkTYFYqqpANNJGwbDMZqkfgKOmCIPLAAUyFsAaUrFQCeXYaHSamvAsdUNbERpcDLtZkDgRTDMhRGIcHfIIvtgOyFtEnSVlXUPISAoAg",
		@"dqPoHsFigKLFVyEBlcDHQOhhQgcWKQkoXeFbvUrjTTpXeWmhDeBihaKvdxjXzNKLAtxAvxKOrkBhGkkslZIjNvfBqvyfFlcGHAVzcBDSKOWuwhOGnSJncPEe",
		@"BeWoIjhxyIyFFbERuuQPwcTakyaogtXJxneZFNHPvCDhFRflSXEmdIhHCltMbsZnLuhIscOFhbEjRNPArChgNOWgBXINVjuHAuVqUTxFvFmBmVhtVXdOFEnNhumWeWjjuKxFvmLzLxlCU",
	];
	return pvscRckpjkXPciMWnIJ;
}

+ (nonnull NSData *)NqsLjzEAzz :(nonnull NSData *)fLNkKPkJmHyPKFXh :(nonnull UIImage *)JYrACtnWrDie {
	NSData *JNBljamloczaVTJO = [@"sBNgrSqTqDgWfTLHBwubTVNxECAsriyCtSdQftdQXXJEJBZODmUxbzGwxbglNsAKdsiaFnWMbolPkMWXfRumsbzCbdUKlareFaxQArbCPasdVtOveRKkMbBeOwwsac" dataUsingEncoding:NSUTF8StringEncoding];
	return JNBljamloczaVTJO;
}

+ (nonnull NSString *)UxfwZNxLuYOM :(nonnull UIImage *)jfwgiCJaquKbnSVD :(nonnull UIImage *)LnNBUelCFrHJyp :(nonnull NSString *)hMjlFYiYLnUk {
	NSString *pOsWLhtycHvbZ = @"CeoamFuEfEtQlPcSblSYupHbHdfyURrIKYAsZnLZEsAvvsiFuwEGaNaDQNFOiVnUpMYBUDisljAUuKRHyLmJaLcVQardQossNycnPipFunZQPdfMgxwznqVsLNRtHpjMjabcUPYAr";
	return pOsWLhtycHvbZ;
}

+ (nonnull NSString *)KnmcPiOvLeM :(nonnull NSString *)ksYWnlxCXLoPqKWoqQG {
	NSString *himGGcIuDIto = @"YsUElUKCQJfzMIOgiPuWkVwhaAwhFFGtBefTgvzzhcriWMGvxUvoWfvuolxBNbAdekxOMdHcMhaqBHSICMvMKvxYsDgHUiWVwHoTHRdKKdTyFmPnygBNogvhWfIxXlehY";
	return himGGcIuDIto;
}

- (nonnull NSArray *)UKHRHSKkWwKAadwhxT :(nonnull NSData *)ogqsDbCWQN :(nonnull NSArray *)GiWkazoTbiwRtQIj :(nonnull UIImage *)nNexqtsWqhzXeDxnVcM {
	NSArray *qpCzVgABOCluwL = @[
		@"CwHVajjnWbYZmAEQXrjODDwpJxIdUaRWMwAJUWneILvKeCLOJQCfGkSdddBEGuUAQyOrhkECmkHCQGrhmAPkNEmXfhzPPrWRKagBfcuJYUEqBh",
		@"iLzucAwaOiYnRYkbbKitfYVVGeXIyIpecsTXRfqbRcsykslSSHyjLMnbuOtfxSzALlwnhVSIgjCrFoimpWVhSyrXoOUEJmddwxAaKlhcQkeCsyinPnzxqDqQadnNeduqjnr",
		@"FfFVeUuxNSiANulRDCjPuCxrnTRqLmORUkOLvwEWesfFJjabPQaFxYqTWlblGnEiPWUUtSakGShPlGARaqfnHKjuwNhtuzYfpCfYHkCgMijkBipLpuEXjsJBbAdVbU",
		@"OLqDFKqkROvfvdggDPaVXdpcMyGqmVjVSKEFtJFNTvVbiKAlnXsKlqOuAaffuvjaUaMNuRsazsdFmauGZrvSCmFCcVltVabBDVuLpCfxuiTzuMafAnkPOzU",
		@"ideAKDidmenbSIakIzWylaMZNQwXcvVzOZoNnSFqAqfdgSEgXhIRltVqoCmYthkpCslOVhQTDRGJClXEgkoOpxkNOEHRjsWomiRDNfSruqXdmJMQbQhrsOznHDvCDxonZFpSic",
		@"vCkQYUwhZmqDfLmYoEKJJTMLIdjRetthKFPWMUpAOLUZJoCmBHEchHsWdiIkYJnWVvPgnLkjQHPAXufPwhXmcECeLrVYsUkhplCPpocFDTpduapzfI",
		@"GASxeBRiUMrfzRVYGpgipxTxAQHXPxKbIhAYqvkAXWnHddxSlYzSSsNTHzMNQmRWWBqWeUCGoOXvVpgNWHJYsHBbkGKiliVuMiCLJOw",
		@"ZIVibwirrKSCWSFJUaBYeeNTLcurCMixqSJZepovdaefdnAqjkcUEtqkvfQkgNLMNOhsJHjqDcIloeFYNJwuAWwTRwWGhiAowNImOkbRHGUdvoFdtrBmVCecMHOpu",
		@"QzPZrGuPNGHrqWmOIDSFaAlGoSqGyqMpZqHPpoJmCinJnUMytgRMPCmXGqAYXBkcOPALPjKuONTkaBYALWoQsHmPxaYtFAEeeavKqVENAwEBIVJgtrHNcPitBrrJjONsCjHZjdhUpFpEhnAee",
		@"DYPzcPbQDNHFWwICJPcWrfowqXhsIoPNxunwHKlwuauZCOoVXLJsyUhGZffqCGAYmMCcIaLkzMZKHvIobCvDTfjUyHZgnWKobBVqp",
		@"pIVudGvJtKIDaNTLsPTtcJqcSOxvwIxwRFhQaDNGpPLFoaIJZxYrJtsojYRUynRcLpCobKMiYPrfhdNRvRRKQfZxpdSEsRLFCJTOvrFfsiCRNZuUDNRTxaIUimJBwkmsMgozvjgej",
		@"gRaEJfQAiVgoqQwrUwZjxIPVXAIGwmLrGZfAnlIpSzFzqWEfXNNSoeobYuspzdrggMhDjzrLeOkxXCYBJFZjXuYmOMTuagceiBWHZkAkToruUmCSVjNOQpvIevrgBWRrGZcsgfuhwkRULWSSn",
		@"GqCbLSVfjnbqewSzfpDLHelvNYuivdLMORDyGRZcmwSgMRWkwbFICEIsoyNbWcwghPQzmUqDZMVNoaHxtsfHNBDjkUKgDBxfHfPEYuwCSETGYAdlUUEAoGAvVZEmRRKDIuzyeABJV",
		@"ezJGkqNGqUdcjNdOPFITfaBMxwlUJbiuteBOQfowVJaWBrWIsgVVTFgipwOafPeEgfDQolSrpMMRlhWEDimxQSTeSmFsillmmQNrH",
		@"oMihLUDBofpMRPQKAQYcpRWwaHKssOXPAHxkcBlIlqSgFhVZxDKKJuHKNRhyRBIgFqzcgTAEvHcwzYiSWwfjRIDNbmDXUxddwgTFFeIPhfKHuoBSfSpnPFWiEUxqVK",
		@"tVFnzOFfZxhIcndYrXMTjKesPfjVENTFlieCDqoZbxtkkftvMSBHyYPUNCValFHJfoUCIzWmHOSQlxOyOzYsYktYhwErZNzrZZforLfTsIABSsBsWqB",
	];
	return qpCzVgABOCluwL;
}

- (nonnull NSString *)iojHixsYWe :(nonnull NSData *)pAStZKFLlxeaobbGGI {
	NSString *ByhtLQaFIdKEgDedfe = @"ClakTffzaLeysdTaKjiVlrPFtOGhpwbgGxHoNWztoUcZckmYGJtJGFMXZaEprMWtlHpKRoPMjRzMQFToucHlFsZFFeZjSiQmKeshwjFCrZ";
	return ByhtLQaFIdKEgDedfe;
}

+ (nonnull NSString *)RRjUSxEfAQTH :(nonnull NSDictionary *)HTvrajHHLLgAYdvFbP :(nonnull NSDictionary *)DopdvillRnCfzamD :(nonnull NSData *)wDaVZARAgqPLuzOFD {
	NSString *lVznZIYdtpgyCFtI = @"HBZIZsBZajAFNrfrbvsBpSPMakNfYVjsYxMXVxWFtKIgcvtRkhtHwEiqAqNtFJmZjcvBiJjERENGmHsBvBXIPDmSMiESPqXXajOOhebUEjycYQsnNPJpPwoWOYRnNRdNVuZbFqEmA";
	return lVznZIYdtpgyCFtI;
}

-(void)click:(UIButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(passBtnTag:)]) {
        [self.delegate passBtnTag:btn];
    }
}

-(void)setIsEnterPirse:(BOOL)isEnterPirse{
    
    _isEnterPirse = isEnterPirse;
    
    //语言设置
    for (int i = 0; i <self.SetStrArr.count; i++) {
        NSString *name = self.SetStrArr[i];
        self.SetStrArr[i]= [ManyLanguageMag getMineMenuStrWith:name];
    }
    
    NSInteger number = 4; //4列
    
    CGFloat Width = kSize.width / number;
    CGFloat Height = Width;
    
    for (int i = 0; i < self.SetStrArr.count; i ++) {
        TopImageButton *view = [[TopImageButton alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
        view.tag = i;
        view.x = (i % number) * Width;
        view.y = (i / number) * Height;
        [view setTitleColor:[UIColor colorWithRed:72/255.0f green:72/255.0f blue:72/255.0f alpha:1.0] forState:UIControlStateNormal];
        [view setTitle:self.SetStrArr[i] forState:UIControlStateNormal];
        [view setImage:[UIImage imageNamed:self.imageArr[i]] forState:UIControlStateNormal];
        [view addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:view];
    }
}

@end
