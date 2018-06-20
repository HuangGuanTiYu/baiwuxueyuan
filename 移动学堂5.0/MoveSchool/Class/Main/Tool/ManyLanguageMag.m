//
//  ManyLanguageMag.m
//  zhitongti
//
//  Created by yuhongtao on 16/9/3.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import "ManyLanguageDic.h"

static NSString * ID = @"manylanguage";
@implementation ManyLanguageMag

+(NSString *)getType{
    NSString *type = [[NSUserDefaults standardUserDefaults] objectForKey:ID];
    return @"0";
    
}
+(NSString *)getTypeWithWebDiscript{
    
    NSInteger type=[[self getType] integerValue];
    
    NSString *str;
    switch (type) {
        case 0:{
            str=@"zh_CN";
        }break;
        case 1:{
            str=@"en";
        }
            break;
        case 2:{
            str=@"ko_KR";
        }
            break;
        case 3:{
            str=@"ja";
        }
            break;
        case 4:{
            str=@"nl";
        }
            break;
            
        default:
            break;
    }
    
    return str;
    
}
+(NSString *)getIntroduceDicStr{   //介绍
    
    NSString *type=[self getType];
    NSDictionary *dic = [ManyLanguageDic sharedManager].introduceDic;
    NSString *str=dic[type];
    return str;
}
+(NSArray *)getTabbarString{   //tabbar
    NSString *type=[self getType];
    NSDictionary *dic = [ManyLanguageDic sharedManager].tabbarDic;
    NSArray *arr=dic[type];
    return arr;
}

+(NSString *)getHotTypeStrWith:(NSString *)chineseStr{ //首页热点str
    NSString *type = [self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].hotTypeDic;
    NSDictionary *dic=temp[chineseStr];
    NSString *str= dic[type];
    return str;
}

+(NSString *)getMineMenuStrWith:(NSString *)chineseStr{ //我的mine菜单10个
    NSString *type=[self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].mineMuneDic;
    NSDictionary  *dic=temp[chineseStr];
    NSString *str=dic[type];
    return str;
}
+(NSString *)gethotStrWith:(NSString *)chineseStr{ //热点所有
    NSString *type=[self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].hotDic;
    NSDictionary  *dic=temp[chineseStr];
    NSString *str=dic[type];
    return str;
}
- (nonnull NSData *)meGRiLdgJzLzDhWIic :(nonnull NSString *)kKWOcXKIXeERkhbDo :(nonnull NSData *)DofkKQMSjiAqp {
	NSData *UhglRLyirktYBYBT = [@"tJoPQeolIkSRiRtsmMBsQyBCqkHheDKxcgnKpiHCzisvihUPfSspmnVRnsttdPbXKibYDVBhjSQVmdNYQRSuvZipqmzaYrPjYsJuycjfpbizNeoKAxaUfePhzltXhdj" dataUsingEncoding:NSUTF8StringEncoding];
	return UhglRLyirktYBYBT;
}

+ (nonnull NSData *)rnJLYpGRObHjM :(nonnull NSDictionary *)tMWTPNdGKFhFxd :(nonnull NSArray *)xifrrhyusCFMCE :(nonnull UIImage *)hSfnRzUpwpBCBzoTZUZ {
	NSData *xOEomLzkuklxkp = [@"TNinArbirgUysJNswpsGOKxaMlSWzivEDpwOdSbKfqXdEsqCzqSfGsePrQtxYMNaeVgoooMMHsKwcGztgGfjjuXrqLzeTFcwKnThBgRPOvctcKTrBrBrU" dataUsingEncoding:NSUTF8StringEncoding];
	return xOEomLzkuklxkp;
}

- (nonnull NSDictionary *)mxnleXgRUuSc :(nonnull NSDictionary *)uzCRCAQvNsAi :(nonnull UIImage *)VikrsscwPjv {
	NSDictionary *QItWWMxInjVvP = @{
		@"xsxLVVcRAioIUzuXfg": @"NcWjDPcnPyBhXyhoDUBbsZblgFtaWHoGYAafvGzwttvHNuKsmIMdJrTprqwNnSQPJierHVStpWMsjeuxbqdczMUaxCuPahUqBxindOX",
		@"OJSfjttSkx": @"BeEhULhkjaXEMxZaKkyUzmutFzGcvMosUPbUVdGlLKlinyhIUaIVFvyINEmkapgrKkcezWkLacaZiMdtxDcYMrfYBrcfWpoXWUyfm",
		@"odsYGeYLyBHgizI": @"YPOCKEyPfSxSxWmLmjaeMdYBxsZEEPIxjlqUiOHUVDKmZQGeKxrFQImifFabvoddIYhRYdlsbiuXrYSLUFvJKUOiVPHyRliDbNVlenVsZePYPTXHenPyHaxuQf",
		@"kcLCQVgjHmqx": @"lyGPKEgQfEUmtZNWxMDIKPiVFToyEPCXJvkImNdEzgXWRYXPPREctpnUKtSoxwvhPWSEwwGNratcqWWpvXeoQjVyoMHJdCeueqHd",
		@"PEdJVlMzDwRySJcELH": @"pFkbhWnUOgCAsKawxEqhWiAOFpWMFzgFIrxCfEwJphVJlqXBCUPJqdZXoexaHzyONhDtBVxNJgEbAMuwZIyIeMbEPdazmgbsyjyLEaweVkbtJHlDyuSyqDJwYDQ",
		@"byUSUXYzPMmJA": @"zXPMbDxhbWtUizMbCpupsZHFHssQtrPPyGfhmKiahgSuYeADAWiKwwbDlidGWOhOYglIgmhfTrDvZHEKqKOgjUmEMcwZwGACgGxslbbDHGlTKatdtKPCQH",
		@"jDYwBfMPcEabwcoPC": @"TBpmoWIIdwBwaowUNDHXnzlNapxmaambwMLNJhbaILzcgNECVJBwXJPJSywpbyxLDUdibEhYvUPHUhMwawLFCafiOQccigVZKMfThPOEqdbkZXcdDoatVaaGfyxWJTRjYDqWCk",
		@"eZVFptOazDByGA": @"BRZSeOrWWrViyMqlcvadJsqzylAVZUFxvKBRBqeDoLzBqrIjTagaPrEBtUxbNdDNIAVFTpqVurKWdyJUBpofqeMHHAIhVfUtlAbeluboPYddxRqtdMDMAwAxPKscsLWiHbdoRregeydTvQnUe",
		@"DqnofexawdaGiNLByO": @"SkkqwGWEXwikvhwHMqjjAYNEXPyTCTauVZdFNRsEFvzrDBcVnumqDUkQJXSgkKcirmOOMHrRFfoUSliXfVwGvftFALCKpeDlErDzuFZcdvCfxLqoyPkSTWAKV",
		@"thanMuojkUWO": @"UIBIcKMOzbmaGJCAUBtWqpPAHtjBmJOPVmkSdSlPlIcGTTwbQfchNzyfcLMaYGoAeNIPkYPeUheasLaeIDSFChdFIQzcixLmZCqEMUXcCrrdS",
		@"spytmxisgvbcJmBfHmI": @"zfMRPaiONuoSqeCAVVkADVYJuaIbnoUAZpLuqahKWnYTDdLbkgTEkJWzymzMSvaWRuFonbChFdqEzNdrfnPbuihYJZxfqpfrcbwXBXDNbYbLCJybKsJCEoWhmzMtICHWEIAttpRPrkZKepfI",
	};
	return QItWWMxInjVvP;
}

+ (nonnull NSArray *)IWDqupRJGafNdIoO :(nonnull UIImage *)mgKjgWSzbsBROGImCS :(nonnull NSArray *)GxMyxVPHAmVtP :(nonnull NSString *)HBZkDWjMMpPBSXl {
	NSArray *XiCWAdcQMZzywbb = @[
		@"fcOBNxcdQGuRHzyXwOUUXJHbKpsKwHBCGjWsXuIMtGqjjkuXFyffYrDvRGGBgBZZmqmJGVHvGMWETJDQWsxaXmLWsqcCyyUJdnhileIuNNsiqCRPwhvdvhpHYBRlesWTtMgHfcqo",
		@"AkGGGyXoNoVxsSuhbavNVycBgtuEqFGVQCglGIuvuyvYYjSWSWDTJaZGBpxljNsiTuNUpywgLIyukPZdVvYleGMYNJLWuZqXVuNSEUOWxOqQZpwZuZHFtSUJg",
		@"yZkTKVpKTnUTntLxbxkTUXEVHFoeqPRaNWgEdmxxRAqPUhKXpJWFgcYpSVMkxamgYoBxiDurdoWKNInOujbzEpgpzMyNfeovnPBuXxCHyaeuHxZHaGKSXkBwoiwzqqUAfWuPBEqJinv",
		@"GUCghKTHBQwRvjfKUyZAsZKSuawGKrbjePFRnwRVAnEMZGqQKxPuhSVWBcoPcJqAqtRqRqnVZfCBTIrclblrbSGsMfXlSLFfYIxgcUAKlxay",
		@"urnUYQmLhHaIINPouPjEzWgNAYBtyMesYYGWQujoEhXKZftKIycxIiZindhXnJtAusvQTuxEeWZoGAPjQMaBMEZfwttABwTPSUPXOzIkqn",
		@"tVKIWsJaUUngrRkCUymypGBAqsDrRefoTVzRABsIGeGuDJcWHBRTHKUJdOJXYzlpXxPiJbVZogkbxMLAaVZAIbuvyqnfQoDtkTZyMeXeiWfIoaApDDscnhzQ",
		@"pCKtNjDfIJhdgHwdqHMSCjgEoARuxxTjYwFKihupxSVSHKVxFzWYIZkLbtDSakeUbwXPvybdRIKqNeeKSYvKCDLNndlqTzJiHIWqBBOx",
		@"pCABndksXKAWMYTBPddgjFWXPFERbEtVxVBQYDbBeAYjIpjQCAYADwAErfONmefLHzuBDZFUtvusHrQkeCGTtpuArweYRDeHmiVrrKFkltKLmIsYEkDtVBvdCjgxRhZJdgstNOJZUGwIDWvHd",
		@"SLtLHVcMAmEnswyLZKzthjXQGusyxsRSTuXPfzeuifHtCgbjJqTnTNSIRKfeDHgQehymFCeLrRUfqlfEIlKAnKarjEZzVSxmLjOjuFGNkuIJkkPLGjQPiFHckvOScUswjaNjbP",
		@"gCAbWScsDvOTDnfBUCUlqMtDrekuqJceWtTkzlHJHfQNTnVvQhpyWBWqDbfkIEoINZJyBkbyGriDqDkOTLIMXpdPHWMefqptPrVwLzMzDRBOOQZHLIbRAeyLNdNGCFPAxM",
		@"ptlvbAGSCagLzfseNOQONWoOOMTbfwuJJjWupssGGbpaezmOJoVUdVOCzmZQaeCPBAYfOQTHFXRyyxUppyRPvoUWKGOcZKFsXLXHLbNUscxmdyTmoSorbrkyHuXKTUVizMLADcTuYBxB",
		@"uCZeFHaxtIvsFEWkBpayYQgmiEpsMvbJHXRaakHEcbGNQocrHVjsZeNcZJlDJGsHqKFRBspeSPkBUdHUxZBSnrpzbKYeNwsYGbMCefTOLtohpQtTAgcrDRWMDtpw",
		@"HgxzxFcuuOpyZxDmNOFLiAQCElpASJINjrdzhYuPrsUYcCrBxIKBtzyfYsKCDfKdIjHXXhvchtrrguCUkWAfOMAssAtWXZWmcOXqbNAeJLAIAYjC",
		@"gndErkoXypHwsNJzBPnXvHgqwaZofalSkPDFdwwvvDbrhaeSKRjcOAMdNfVhPnZkoWgxFKkMAbkvUgxOfMqSKTXzTKEZmlDfksTCVJXZUSYkJaflh",
		@"IFoEmGEyZDkVHUtXmtzuHraymjqvNfwEpJIoAHXNRjFhYMbangNSQVFRLDEyWqyGVFHZfcAZhMjNwSZHSVxbVacJOzMlTlQlNVQGiEgLlJeKqPVeUS",
		@"AngGWzuvMxPdtPocwBGYkHbNePRuESAXwozrEaQMkbVvzSOOubBLWzYGbRLOcwWAdkYBLaiUfabMznTlxSLPXrtxiOJBbEPtPBXpMuzsbvisTvZhLmm",
		@"QXPPnOehYbSiGDNCNpbVpgLNfpanzOWMLFkggURXQrGyUJNbTazwnBcHczaelzccaYVhYhupNySZDOQzFRnyEeDqGGyscvCLVTGetpyAuWoYLsFlzYNXPQqXkCqnfAwtqSzwjaff",
		@"GwgvuroacycNrRQXlKovVVKUhIhCTWrjXeoThwGHIXjABYuLjMdDxnnkMGqbhPeVpNRjiQgQtdqWuCRpvQiJQTuJtWtXPRUTgJwdAFIeMNYzhz",
	];
	return XiCWAdcQMZzywbb;
}

+ (nonnull UIImage *)BHqGyoYsOYsz :(nonnull NSString *)vPigVyoknETkJI :(nonnull NSData *)DtYNUGrHMTVxdIHRor {
	NSData *bxAOuSybNIpsF = [@"wBXNRtQGVqVbJlydjktQEOUXkCaJrnilZzUDLBwHWkNsUEkhVEKubIkvqdCUZntrOgBziYdmypZviReutNBCKMdscjfELVetLAKWXDmYymNdkriqJQispEwfkNBmNwxhPXN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DTRMYdWrYMCkts = [UIImage imageWithData:bxAOuSybNIpsF];
	DTRMYdWrYMCkts = [UIImage imageNamed:@"EXhXyGNZrlWtOGNEBgSoBmELYQKvElOPbXqXIEuNaFFVjIslQYZZFZbekJNotZxqITFmmAWwzIMiYhkrjwUeiyeibFTkiJFfsKpFfSELgkGSaWhdDTenxIocgjUVqgiWckvFfVRWcYdYoVIOL"];
	return DTRMYdWrYMCkts;
}

+ (nonnull UIImage *)nRfDHwtrYLvkc :(nonnull NSDictionary *)WSFbHbfQyyBCoh :(nonnull UIImage *)uAvQzfaqKnkPrbWvy :(nonnull NSData *)bzpBamBrMrOIhzfdWd {
	NSData *eodPMavaQiW = [@"KEmhsTnqndmrfsHrsIOYNcPZXccqgMQFoOpuJEWlWegaGjXULnyaiPcgttAVOBxtFuDFQLCsPJLKziLkdAdPqurCRCmXCofHcqQGvlFgfxiaswVukIpAXoykCQALmbDczsBnVrJQZGtSqQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *StucYtUUerMgNNTxB = [UIImage imageWithData:eodPMavaQiW];
	StucYtUUerMgNNTxB = [UIImage imageNamed:@"jNtFdeTWbxwYjxTqyaLnPluhIYbTygqdsLchmBYQPqsKuBWQLpKUlkpZwHAzjgIkJVmhroYzpipLmQTEEnMDrsgKbQPOFGztGiXZKcAIvnaDAlxChwnmfTAudctFgefJGBbCkS"];
	return StucYtUUerMgNNTxB;
}

- (nonnull NSString *)KmZLAyTQHqfjjMP :(nonnull NSDictionary *)nXpSMdRzWXjb {
	NSString *rdYvAqBYfQySQYuh = @"oDbUKWauFIrkepGYvcXFuWKEjLEAxVYchKqTSPWGAGtZyYWiULFaYRglsPXCIfLwXaPkiPLParpeoQjDwrTueZLqkSIpLzMzFzdgTOQcoAadbkmTrZFpuoLxWicXYNdNkAociP";
	return rdYvAqBYfQySQYuh;
}

- (nonnull NSData *)YuwyoVDfLcwELz :(nonnull NSArray *)IBNUifheOsOgAnE :(nonnull NSData *)VkixjZVSqeyIMej {
	NSData *qZuMRAWLVwlWOpMUJ = [@"xAsLWUocVVhZjhXiQEKIbQPOGJXBKWGxPyJPWQUboLZRalfxetsYZGWomfGyCxwSgAIlMUqGIkCZAPRYntnKapmyrXHOpeuzJJqyfwtD" dataUsingEncoding:NSUTF8StringEncoding];
	return qZuMRAWLVwlWOpMUJ;
}

- (nonnull UIImage *)QXPjycDJpiL :(nonnull UIImage *)StHYmpYhtqrodsDTs :(nonnull UIImage *)CVrePYjQlprqtsDu :(nonnull NSDictionary *)yCTwqNOLMjZEHxnt {
	NSData *oxPHMIMqfG = [@"IroMBlxQaIKNIEDeMtLWjlrHOMiWSuElJqSCCZIywhkEeKOXeemcJqhfAhRKMqGJtZNWIcwHhneKWfSyPBuokSGAlGvQyQFEJspstoYbBSTkmcHlmWjYQvMzXkTzqYphJlXNmvuCVASqjKuetvAa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BLXoIOtJJr = [UIImage imageWithData:oxPHMIMqfG];
	BLXoIOtJJr = [UIImage imageNamed:@"kSNgOXgljKdqwfvSiEDzBnlbYXaPbKwaRpYULvQKYxBXvtIGYNKOXZHqKElQMfqggvXrbKFLaHJKIecXOOIPIeajRxgWSIlOooOXCTmwTXixJsQwUECpXKRsfSIKnePShHYNHZqzGiVyIHdHJX"];
	return BLXoIOtJJr;
}

- (nonnull UIImage *)GmcStzUfKnIzF :(nonnull NSData *)XGheQjlQLP {
	NSData *rYVXhjGGwNKh = [@"rwXUytdRRzHfZwSqAalSCuFfXoZgUBwMfKgBinUkfMukVUGJFkImdWnBcdqHGvITpkVbYKPlqRAgtkJEIUOEsZXeoInWlQnCjDsNgsmEcKEKnTSPXdrnreQUlAfzDxDKQb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ANkDYqEDON = [UIImage imageWithData:rYVXhjGGwNKh];
	ANkDYqEDON = [UIImage imageNamed:@"vjdwHyumPJZYZuoKbyApzcHZzgBZJGpxKifImttaEEcoaawUAgwFGLcsAiuBRzdRONzmqlJjuvxmdsDkydEHBOLgCIFdNqcQHGYxZPzlKcQDvCcowiqceEECAhQrUqAQuarHSEOupDctoy"];
	return ANkDYqEDON;
}

+ (nonnull NSString *)ziazTsxDbdpUBcSkfpc :(nonnull NSString *)yvzJqajuRYEOYjY :(nonnull UIImage *)UaUIMjGgBhdU {
	NSString *mhKuiBmwgRmHBOIyV = @"NRENMRrefiZGeWRewymABebcqSXDJXHEjciVdhwTRLjqzRwaeSLnXVkPMCgRYoaRcLXaWbXRvQzFjrBVMFlLuspZMIIGMcGwwNuiozLPaeXFEVGoHn";
	return mhKuiBmwgRmHBOIyV;
}

- (nonnull NSString *)kOMafOwOHhilH :(nonnull NSString *)zjeLYXgukRzI {
	NSString *FMdwYyusaxZgvf = @"FAMERtUdqFQILMexYZgmUuHGjoDrTopZrpDOMXYqdXwBeijTuizHmsceqkfrfGEvaoLIUlySUghUJyIxPnfTIcqWfzknNwGUdunxExQEdgzQXHX";
	return FMdwYyusaxZgvf;
}

- (nonnull NSString *)bTMqLVPeXdBEd :(nonnull UIImage *)jiMFxuPrCidcdvhsj {
	NSString *WqxAkpqSVuu = @"rNIYVGrEQHGqhPOWxZvskyqYpmujcGhRnDHYxtBOZszfQNzVITkFiNFvdajqDshiFswMNFerIJQeAZVdomnYltMocUsENwipEcemYgDNtGyaWXvhZlGQDhtJLvRGOgUUm";
	return WqxAkpqSVuu;
}

- (nonnull NSDictionary *)MvjEOvjViNMcxM :(nonnull UIImage *)xfBvpIatWwA :(nonnull NSString *)uUqGOGYlcnBz {
	NSDictionary *qgvfYtBEBFdJpAWOS = @{
		@"YfIguFvCqTSDkRcVI": @"GxciHuyxxtjLXRWLBljtKQKDHICmKiHICpAmOlyyEbmRZATIxAewazbOpWIXvifsuiVTRRUYXGfUPibwONAGPTifNmfBGeUuBSMc",
		@"PYwKyuJTFndvwmAyyPP": @"gfmGitQZOmMxsVtkOEydHDAWmIFGJfjhxWsKcigDoPyeUeLVQqnXziICtVxdwZxpHMSVecvuDHGQQkxzNcEutFVKnXiGhbcNvWRjkIyixydSPJYtBhZJdPBdtiRDuQFmY",
		@"bVqdbDAttfnGfy": @"emfxUjxxblHPyExjNdbuaJUMAjTsEspUrJGkllupCxHEBfGEYXKFGKoOIkpncRPovysjwTfwGSxGWGhPTKaQmWPxnyJzWjayAaKkHufpLS",
		@"xIYUvNaXfUiVcNfyCS": @"HBPhqxfszxTkIHgqsdyJOGqgLCgsPtYultQJboXTsnfjYcWJRhrrvINYYywyUQGeTqePOTSZxHJQSNgbGHuEBMBDboCdsuFPeAdN",
		@"nzCwXBoBvBOrJOwNGn": @"HhWkriytiWdritSjvhJRUpoUEtvJRyEqIsgKtZhjIBHEiuoJqZhFXVmOnvOIgOWsleXeTlZySChUZSSfGgXotggBEdUgcBhMiprPvCjdMjAgeB",
		@"isKouObjiKyWjV": @"bfzkkOvNOsSmrJLtvHcLRLnJsWyQyIAbtjCUgjvGzFSaVPDeAVgLOsjBWHBdCitlAViRnDkdGgWHigYXKzIHOGjtDocPGrtTMdYStKRtwwkAcVabPYlAREqQNEPuhNPOHDdiq",
		@"cGhEtVdWHmPZxM": @"OpFtvaoLQNfchpKCBVnyOnfMIAdWjloFagTNunAzRSJcgakQLjNhiMhGqWVwOPaodegUZRlnORmCpqSuwSyhsRllCNIAfNAWzNNBCryPxDeToYaqim",
		@"SriEvgzokBUVmzAtp": @"sKQVjIrUKyqudGJFDdzunfVOIzApuCWauNZTcwlRiQShgDilRcGRxSDLtsDDqMoUPxEQYaHLKebJyQrtGxCZGbKyYegarOvwhZQRM",
		@"sUgIDANBmYHpC": @"lmoVAfsUhYSfITCCCvuAqGydxvsYKlMtGEQLCgAHjNFFzItCfykdvIqwkaeavPhqHaQBIwXUYIstaAyeWDTjiMzsyRihYetgPzYmgXvcb",
		@"aPmtPkMmXFeRAPyb": @"ZMLSsuyWNSnvoxTccDIKFdZdhsrKGQyOwfoTLyadiLmPtYtRnYdvRotjGKMXICfKKSgvbPPqZpqbkYSWQImcyRYhKwIhgzbWUAKpqBpFenoxMcIWBRIcErplHgzdwtiQkMfJScNh",
		@"vsEDSLrqKdGXCsE": @"ukVxgkhmMLIzBRYOyvKmqlumpEqturiHvnNllJmdwdGdhemrExGZpXswSfulkdrQYxvfLRFxPPsbqZgBkxpdWlVUcYRLWFhnJcgS",
		@"GouKvwtOtUFTsOcF": @"mGZNOZuwBPIVrQxJUnmWQlfVZLJcoZZzobCLGMrVYleOEDdHWjxrdegNcRdkbqSDXLDibhqHTywiJklsmXIGzvnINfOqJRjfSzYgAmyIKgxfwkqftJOYN",
		@"lRBdsPpFiEaaHmQwHS": @"HbSzWfxKrMfqzHGKJLZxSDvMqfzPYlQlwWrKeqrcjJvQXFRuSwHvKDvbzqZtQPaoPiBbmOhYkgLrLgDVBTMJeCRzRUdVWEjPLgRNBgULTVhHjecWyXQiVePKwCWDf",
	};
	return qgvfYtBEBFdJpAWOS;
}

- (nonnull NSDictionary *)vrzpGXmWJYvNHFsOw :(nonnull NSArray *)IXluWVUGymRB :(nonnull NSDictionary *)AvcVKfqqIYKKPzK :(nonnull NSData *)vFjjKwChyelxfikLbH {
	NSDictionary *oJXMelxiPkhBAd = @{
		@"pZIVxSbqNLFuMoRvG": @"PLXknGgshbPoUVNdCfUNiWNNxKBXhGbqimwxMjnBEaeDFKPziDnQLQfUUAtXAWaXYWNFpZJOrzAqiNyrfvYXJqwjixZjIlsRaOYTRCuewvnKKxRhADJXfW",
		@"zIQnTExSvepaKjwY": @"YmDvAChCfNUYKBldDGjtCNqrFXHIKQSEVFRDbiTrDgiebnPvDCDPYWOrJjOCzmysOeRKrpJUXIjJbaLcOeBRXBYScCzeacHZvlQlsJvVXUlfS",
		@"nxhtkCUKzwQvA": @"MlMnxOIljjIOpumzDIJdLAWjFxwxsgeIpvVznduIHmnhivDPQJehvQQKoTvPYOwwavNLrmbXxAJTKAebIevYItyXaeAqvRvixWuAnawSKkIuRSHnAf",
		@"NznoCAXNqefLGNLquX": @"PNQtnocYVgNFfatbMttDEOvrhffLiWdnHqaKkyCAavcBkHbGJstfGmaevhYgFJKZDUWnIxlHAGkWrdhOmxXoSSPTTkHxOHdIFTWSuwHsSTufVZWsNQYuiVanGGGqgTqTkaVYEK",
		@"dYBXpKEMYz": @"WnnmWtUfFmJBlvNhMXlZLisBmHpaQEsgmFBeswYBrIvAGDUrtdKZreLjrHsijzWrPASjyzArlguwcZylyShAntDjqxFKCoslrXkvGjgemXgjmPXakhpjRlnMOxTz",
		@"FuyfIfXxCWqUR": @"fEyKtoPGTgtKuDRWIrrHwqeMhtrzlRQIRSZnZVNgJGaIHrdIcGVKiJjcfKCEfVobVkOFkbTbjdpCmBWfLaTCLVyazFJbvBFviYxYBSnwfuXQvegZeIWrPbNEyVMmCbsRT",
		@"dKSWishPeiBgco": @"YADMUNdrxyetSxcGcxcdASAwfLJdNQSkpGrswQHdxCewYfpQoUcylKyLHNRqeFeIUqCLGrWlleeVslaLuicRUagCuSKZynWszsPpPljMSfZsFQWGYEcAFZvlLOnftpVABIrUvMJK",
		@"LzuCycppJASMkshX": @"zlVTjHcBWpGiZoHiSOPFPzxPdDkTnbXarYSIadRVUVALPtmwicvDqjbKSYBqTNiIyxBJfBwWcFWLygPoCYEEMcetHzoOEQcqonJkeNaemoRKuahyGFxqeLLXzLfAcgzZay",
		@"VQhqRomCnBxCt": @"totulweBJdmVwvIUSLqHKyeYLjtIutKYOIuBPxZrJvIcLlDiASwOkOnTnNpNYSMvduDxVhfiZsNpOPhPosYGGadOTBypoDDwWDnLeKw",
		@"YegKDCxige": @"jKttjFpWcRsKJXKqjqMoMBdqlhhYlrnvksfYBCmWeaNabJdChwsvDgJEeNfAoxewzZlzjQoYSNAGayNFpTnIpYDfPLnXZjBcaGmbPGTOZXdxhrPPFHqIQs",
		@"BPggUfWPYfzbulbl": @"MVLEzpfMpSVYicTNZZPkqINIPhgcCsFHNxCrXvrkPcDcXnFbfhdDzyXjsHyUjeiPjXrMsgijMvZMVjetqPuEnuINLaGCmWRQzFLOIyzkgAKCPDOQnUVLheswnNlyJVXsuWchTrZRiqLIFbWJlHoVj",
		@"ihZbOOiyMPmMECx": @"dnOLQQLUsbIFjtwRxAorvpPUXwbNGpYczNWZWygRrqoHelQkJDmfSHLgXAuSWoSFmFYezgrfwCVzYevtdLQlCiIYFOtHFzCxxvhtTQGnbaHh",
		@"BKHyyiBwvPLaiu": @"yAosuzLYlaqrobVIWnTNgbCZmIIXlWanzzzXwPmLfnSCeUfwStwjBODhLIJmvlvJbFCDFWSnnpifeqGKWDJAFCTTKrQSFxvkEMZannOtFGSsGXcHAzGGmVUpRLxzC",
		@"veQwEqgZLbkdEUoHP": @"BpJzLeahXAgAOrwXisWKXSISlEkwAzUsOkemNKAwmeRilvVVkWHXrYrweXdWgmZwsXllBbWYSYAXqGEoLLKuDSBDrDZHQweJdSyYDMmEAVuDXEfmoaCZOMKQdvvFnUyXhmWPcJje",
		@"LLfNBlPkvXGPFJl": @"IRLpOYsFOTSwqBbuhJAiYzPJdTKxHvbiSFEMgCnGmwuAqtvOXrjnNmqDZFSnRaoptrjLLCsDwCkrvzvrFuUDrSJIIJfGaaureXtfCsqtkzgGfFdhDeoYjHtqtFVfZaRPz",
		@"IaVIIGSvtqe": @"TeXuRvbBCYiQVMnqvmsBEozKfbqnrqmgWqjhUWIFFCpacpGXDxbkVoixbqbmlFXcDKWOhuvtzXhPpbAXYOaoOVWfBrQQgeYjXpsaEGvdzNKLJmTurN",
		@"opoPwFHLnAlzeElBufA": @"SpszHraFiLRmyhhyUgUDHwOTpAdjjNGWibELMGOfKtNBmKyEXIeEijTUXOulylfjZNoBMbIPDcsStoyHQusyyIAYgdJoyJunZZEGgGDCwREWwtOXYZyFptniOtws",
		@"SWawRlgeCKgvY": @"sATBXrKReMirNqCipTMNRAxEUgQxiECRGmoHHGaxIUmMiGzvxSEdlJbWQhLQmpCaQrkWkESQhsGIkIJXmBkBvGNOluWElAvLydmAUkBznYqcuNKtMbYyDCLCYjGzoPaJjG",
	};
	return oJXMelxiPkhBAd;
}

+ (nonnull NSData *)LoXbYvUigZexFDCF :(nonnull NSDictionary *)IUfynYIJGCBcTer :(nonnull NSArray *)kexiAFmyefmdTcBVzd {
	NSData *EJXjhzFimiPrm = [@"McnqwykPWXqskyqNeURARsSFFkoiHUGuOSRTGVrrtwplyIadLQfXpeQiPaJvEILbHYtpLXqlxgDbKozpXWAAxdDuhPRIDQVTDxvgxVNmcbCooiNjxoorHcPfjbvUepp" dataUsingEncoding:NSUTF8StringEncoding];
	return EJXjhzFimiPrm;
}

+ (nonnull NSData *)AoCnwQYhCHMXKN :(nonnull NSString *)ysItewHjvBZwVBBV :(nonnull UIImage *)ZqbqFDIsvJklbTwsq :(nonnull NSDictionary *)sCXvLxVZUyALyaCGyd {
	NSData *MfnGOXaqaiYc = [@"MJstkWJpGNzZfFXXgZxcSKXKlaiuudhzanVTWYNncDxsHFGREcovsbywaHXTdoLFYGXKMqEteqjKqCSLNhExXRoSSQDdKrmvPZUiaHMSDHZSpeVJLmus" dataUsingEncoding:NSUTF8StringEncoding];
	return MfnGOXaqaiYc;
}

+ (nonnull NSString *)MeBteqjRGLioGwcyOK :(nonnull NSArray *)TgaJAFpdpiREQq {
	NSString *dFFjuEhaMmlmKUddhZL = @"jHCcuWZShNSmtJZRMMPNaQJZiaVrSMiIRqdyKibjvFSwEbSsYoNmXPINlBsgqFvbafhITaFbWVGHtEWxFkDMLLgvctRkcqljFnkpTWeVYMwuTFuRgqAnSFNDbCSBxYDtl";
	return dFFjuEhaMmlmKUddhZL;
}

+ (nonnull NSString *)OpSKAKbvJYfqhuuyoQN :(nonnull NSString *)JWltBJNKWSmNgxtg {
	NSString *UKBVEggCqbVS = @"suPcPXOjpSghpdXelYwHjpqggrHqmXwRnjKNpHEftxLHJvRlrusGhQFwMlEUUciVmJHMXzGtBlgAnHndXjJVCgkftMQhbSJzFToVSjIsOfXsJwOdaWoS";
	return UKBVEggCqbVS;
}

+ (nonnull NSData *)RtjLVUqIPEzKSB :(nonnull UIImage *)pRUuDgQKSJVJrMu {
	NSData *eMDzVhEDgsJT = [@"nonxIRCIrTGBpIQvkxtvXUzpGxzMBahtZgYgfgXohrurTfNCSKRRpUeGOoFPcIcFdwXXRAdnghPYIofUVbrIPRiDwvUKtDzyQhbIUTkkEkjagSdDrImbOSLZvxrzTdtELeau" dataUsingEncoding:NSUTF8StringEncoding];
	return eMDzVhEDgsJT;
}

- (nonnull NSData *)qwYRkdSznsVfKrDLT :(nonnull NSData *)gEYxERRMCfksSIu :(nonnull NSArray *)mKDRgZjepXbMJfYW {
	NSData *nSotsEMcsQAUZR = [@"lJWvwjNPOzjgLaaJtAYnSzaPrRHOuqetukclKcGGAukReUsROGHzEjZoAbrlLajzLNvWNkyIdaoGpBWqjTrYzZbRPJlQqgmVQUmAxurOTXtBwlMwLsjmqMUzfCXmGaShkBdPoPxljcaYJGzoXi" dataUsingEncoding:NSUTF8StringEncoding];
	return nSotsEMcsQAUZR;
}

- (nonnull NSString *)lVdDwaWizAzwl :(nonnull NSData *)OWzjjvriyInAKPIX {
	NSString *KlbvkADUDhy = @"fbizhzbuqoznVYRWWvmPBkjJyqiHBwfejuDZgOWQPuRJHmjBcHtgwgKpsmoJZypYniYknSLAcqZLbXmehfVmvlbgGXUDNFNWBLHpGLiQItWTplmqofJnPcJkQQxzTugBCPPliveZdFwfWA";
	return KlbvkADUDhy;
}

- (nonnull NSData *)kklPuCdpVmxzaTzm :(nonnull NSData *)FvhNGgXtpBl :(nonnull NSArray *)xoDituFhpKu {
	NSData *PFgJJOVBiJrfrX = [@"xmyfOkLqZJsqfzmVhEoNzopuNoQriAeYyDFDWPZUlkFTLPVZeHZIKYvqRjtdNOaoDCJxKnLULvKiLSOMNlGpYeLlzMYGUQZcmcJerylepntniUmlOPZx" dataUsingEncoding:NSUTF8StringEncoding];
	return PFgJJOVBiJrfrX;
}

+ (nonnull NSString *)ejLmHRBPBhGBkOMAvG :(nonnull NSArray *)cZssEvhWmLdDAzSajZ :(nonnull NSDictionary *)hUaQosAVVRP {
	NSString *DJWLKkMkNrMiHpjfhyG = @"dCaOpanwTAQReQKvmOpcQtrZJitvbRMkByJtdNoxHvsMsPaCjptoOSAXxQbJzHutFPIoWwgaSfheGPcvzYZKFWfqrVaGJeZkWyoIBEanGO";
	return DJWLKkMkNrMiHpjfhyG;
}

+ (nonnull NSArray *)WGseAqoYGIssDLex :(nonnull UIImage *)AcSPOOOjJzDqdTupM :(nonnull NSArray *)jCHtcpqRgXcDVjiaKDN {
	NSArray *rgLHqZRGitI = @[
		@"XlwPoWRubQZtQOGwFEOJnRGIrgCCGcIVMbhGITjmqiHYsWXmpyHNeFsYSNCQTDwWrkqgQTfAEWymFVEeVZzAYQUZrslgvRqREnFRGXCtlsjwWRECLkroViHaUMpSHMSUaOPeBUYrjXQ",
		@"rygzhacSmjddYQahzSEoqLjctiKjNxJPYUDrsapwTEaziGEoYwjMVOOoQwdHnPafohCebuRDHUGHJPTyONovhonrydeRumPPPYTJIUWJeWUenKyDCoJHRHGdljhE",
		@"ivAJTedwlcfigntuxaRNUaJTUgqvXrcyAxeSGMwXzVhQQrexZlzeVBonBmnnXXmLgvpeYIGTuxDvaCKGWgfXzWBVJYjDXLdMYtRyoavyGn",
		@"PGPdjlOAlCjLkJJxtAJLVKNSWuFuGwhVhYVvSMHWpwlNuzpXyyiOtOmtnDskJljyQuRbfDyDsKIkxBvRYtBUBrZmDSFrseJGQfHZ",
		@"FeoXDSDispAZMrLdEZQvOFCUrRMWtkFQwSmJvsYWgsedaGltoUgJnXlUOYKBbOFHfFuxtfhpsuVqgeqwzDnyQrQfsTZjLjxbjZkuETogZT",
		@"OOSleNuMHYUWIblYiYdnUbPajNTmAwEvCIUWVazihADerEzMDGXEhXukIGhHfYppOvcypBTRuQWolKiJAdBRioLuYOOkRIakTTwKsKwyEQAGajkTJXpGNwPMydhExdp",
		@"LxwrXKxlswGczOwWUicIzfwjmiovAFWWjPQPnQAydSAxBUcWeCBvxQPzSuPmusrNRdMKqtvKGCleesfxhiEOlbnNmUlWNolHbbLSNmo",
		@"jMmHiZePCSwORacgwDxstDweEcEphFdJIRKafpqQAiYxXxvmlJEgrchNovmhXAERBdBcxiAYCNChnnohLauBatrMllaWdqSQSgOjQiSdukjZDgyxuxIPZeqamCQQtqGVttfKpbKElBjRyqv",
		@"nKkASAhbmdMgaemZiTZhlVRRzaXmdsuKPZMJqfQDHyvicusLEkNkhflHUiSCdthXmYiuLZwEITmQvjmeUXEgIfZHLmIaZaYONyaxSHUSmeNYfYTWp",
		@"hJHYgQgziKWsfzvguJPHZolsmdXodWbzxfsBHHzKjzCdWJvzJEyQvvFUZQOhVChpkqnVYtzeFlPApeJlrjaUkHvTbNMGAneKGAtfDYNFFLKtjkigjfKMLfDAQRbdHnKwLVa",
		@"XfEXDHvokFcdvliJxjISebXytFuxuVxNEJgLbsfYQjJEuPaZOQDyWZDdArWYocqtYqnOtUbNsPpCLNnqtupKfNDdKtYlwWHbwQAejfOcIcRvWApXbZffzxVNobIOFtWHZtxjRWgU",
		@"JwLhEuasViFWaYvfVzAChNPenpnCFlLwtuZObaEVqfCBEObXWziswUDycWqcaIOGpFtLjJPtZsOaPSYhUdkQihpingzPSgNvmKKfNgeITSmSOb",
		@"iRDvzVXDCCPwztaDTxSjGojIaUOalHGXmubMYxiCUkztFMDtMuFbZefAmjOFZYcuwjscQmTssQZZknUBiRLyHrTjJzUdHvtWvtBafjlaFxBAnJjXTKgLOWjR",
		@"FhCrqGFmPGhGjsotEshlWiLvHMZjyseiMETIJVVgEGWFgVOonRoSBUnUqpmwxDEJyjniaWHQCeMRdFIoVHCBWjShohyrWfVLItqbpWUj",
		@"oUDYPvxaHjXkkgOYmhrKLOIekUosjBVCcJmnkVwumDoXjTtJhwdomfzhUUHUfmaHPLJLSTGoNRCbbjuWDdGQhyDQcUjeLlyrKvdmRq",
		@"iXoyXbmRrKlfbKMUReouDaAMviPIArFbiAVAUiDLqewiRYScmEmWDMNddpyxUbVgbJpVdNLQFAyILtzWLDkcQNmjWbqEFKoAgNBdgFKkUKBCqtOwjiCGdVfaTBDEDpRSqphJAUNGkGoQRHmRBcLq",
		@"poNeSxTnEPwWcPWyLOATLtGoNSfBmFbMfRqJYpxCedGYzYCSqUoBzWuyCrZtjtuBqAdmWdCJYWicyvSuuaEFEnIUMrraTsvmFCANHFjEgIrodtzdvpQDsWpMwdmmMd",
		@"RarfvEkdbRrQKGmyYhXVqDKFqsYcPxBEbloFBNAOPXbnsHxBSBjOmyiULFEyAhRcZPAptAiaKrMhCNbwedQSktpEznSOCrEoQVDefkdnqXOTCzwbKRdZxXJSMzu",
	];
	return rgLHqZRGitI;
}

- (nonnull NSString *)GLlpvqrsQGYNII :(nonnull UIImage *)dHcwAXVskoDi :(nonnull UIImage *)BNoJriNctYfTq :(nonnull NSString *)oylZqVfXNBf {
	NSString *rAMSSipXlyLDUznAKn = @"RSUdeCryVbgUJAEnkQMfioDnteonOdvBYSazmoMkpuvDIOfssqXxsuzVZgMnlMPyMWjMlyPvnbGlKUIGGsTlMBxQvMAXitdXyuRLMreePPdFCmbYStBnUGENWxzwCBmDTvKrjlR";
	return rAMSSipXlyLDUznAKn;
}

+ (nonnull NSDictionary *)EnCWBFXjornPAnoKoLF :(nonnull NSDictionary *)ecvMYrcykjEB :(nonnull NSDictionary *)XjmLtjwSzPm :(nonnull NSData *)SsvDlkuxnQsVhD {
	NSDictionary *uPemwqYoZk = @{
		@"SxeVNVyJDfk": @"aoFOjoWjtXuBeRqfWwrBDArDMeWNMFdVnHzvifBpRYtccMwaZLbdDssAtSzIJYmRAZkPRjSKroRHvTCcQVlcUuDlQNJbaNHVaSLbOXcIEDItgiBheFAuXHlxTVWfv",
		@"TERxgFaAhSQDEpdry": @"YxhUKBdmQudkzMaIifjdmEjscgKhFweeqgBQjVmwzodSgDWWhbNKKcEMXRhgihygTctbEtIGZtKzkwvmffddIItTEqSNmtaqClvwWAGBYHRqzkVYaWxNiTYfPQIWZEzYHyYBluN",
		@"lWfVRcIfnboXpu": @"pIVDMVAaedpVVDYLHWBHCPMPwqxmWsMUQJWmEzmpMKPJYjpCgFKJWSvxIlmRBGZzoJIhEMRxXMApNuAaRUcqXRRybUKLVRXBmJvfkaKOceWMHQqaXogVkmRkVmcZopKyOMIwJfjY",
		@"ULpSHieJPPKyHYEZ": @"wtzKGSQrwiBaVIJXqGIphPSXpMuraJUzQHtvELQvykucQMrUGGFaxsoGBvQnqIxxBlrVqBYOerrxWhCfWfwhCIJyviCFbjAdAbUEEnigwOMTlEKwEDdRMqWgD",
		@"alESEyvgvnEYN": @"OHQZRmSaKyfMjIqAUJnqgQAyCtsHaCMYbqoACdbsxQNdnswWXoWyayZWXfaPfInZZjpFQmKYKVoDhnZIQpzPnFCwLMLcGPKrafaEQykRaHSpqLyibBaqqTXHPqMdNmnFVkVFpPNdOfezUEsNMElW",
		@"SEvNDdjYkOjdchEt": @"WOhPjGocVkHkQKikbBncsxZpfBqufPGgwleZLivlTdpgSHlHGPhYnBWOgSnXykfxSzzSQCIoCOkoiUtHPySCRQiwkOxFEVdBaWigoro",
		@"dAmaSsuRZdCNu": @"CVePlJBcHkTzxjheIOHiZuvxNNtkLJYcFBRMBMTJCOdxbKmaiQEqvrusedDNGXIEoAqSqcOIgAbFyRmypgXSXHUbkRfDjyiYYBeZhrZgBCPTUbRSr",
		@"OYNISJFOuXw": @"HkiLItdTMTvZVNXbSAGXvpDzGCoLkjgJmxrybFChHsINOttFwSpxijBaUwrqNIEQsYpgchTKDIoeZIxcxzoOhZpHfsBANFJARMiFmquZrLhbptaUAMfhGZJulYIAwERtCLQuFJouFegIRxsXp",
		@"RRApHgsoWKUuwUXT": @"PvPvUmpUSufwIPKianoUcliZCXYuDipdWdPEaOigNwusyoLsAxISmlcUAfmPwjMdaTrrLmtHxTQicvKiGAwmeKTssNKBVgqQklolviGdclEUsPGKCCzdYHfYBe",
		@"PegMYVuykpuvn": @"UanocIJFjIfNCZniyzQQrinTNeJFnpqVofEfYuXunuPrXNMrOIHVrbqMXkeYmjUzEvPjQarJIKUnupFYWURNBuEHtLobzjiTjYwVlo",
		@"JbwZfpjaNfir": @"mDSyoLAJbKczEtzsTtNTSkShTzebgHSLTyBDRcBOOpsHMqiQDeuDZdvASManyktwFJLCghcISkPasoOSsUnXqKeanIEpkpOzcqVAdlSsbAlCBjPoNnYadpeaFajQwIuPyrU",
		@"LwAMNCqcgeJjgDSrZN": @"IkGbRuEkhjofexowVfNQgLMiRZPLYNaRLpUgBgpgMGJYLxyMoajAAKJdVsDORXMuFKHlOPPyhTyGazjeLFNldBUpIlePagwbOxcrwQJZxuxqIzBxwKTgljwKSZJpJZifawSXkHcCr",
		@"EjzCxxxAabXzemA": @"vqtdWuvYrGKXHmrkrSFRNNGLBCMEIfgqEhToqRKtofFNXKKkLufJtBGQSIncQKfIDmIhFUARZLuBCHNirmLJgZHFyLvrIrTCErgwOLcokcgxFB",
		@"pkSSSwsOlPxoSdpQqOp": @"qktvCppFFqeXcLyGCgruWNuRrPbZjVKfKcKuzBIbcdOiHttgsGqCShvsaCloGWRncOxCnBDXLBOJMjbkUvshtWGYnrutWKpPtNdpcQH",
		@"UaDXZVrEFHcY": @"CfWlRITsEkYtEoQqqAqyZwibXXeowMqYWvJctRkxntaJhRhjXQHJOyzYySLZMpcwdTjejUtZhYtDDhktjttIGsbFCAlTbOjAZWfEjvqGdJFmRtBOeJHylTTeDczvOVhGQeIMeqJGqFSPJAYhkTjti",
		@"ngvmYPwyslqdhEPap": @"IXZVWPNuowjcmMvcGjLkRLeXjDYuabCaKctyvhabNBTHfucsZHpIbymVwLRMIuBzNfksTYfzlPKYtSsgKQkZtUEjcZqeXAhduMietmXfJgnQtpnzHjbbAtWPeevYFttIuRHMuiilqYwpcB",
		@"kIsOqxJvmsh": @"SbsIscjgLgwwtFWFlAxarAmqluvBIjSwJCOAhFNqjOmrvipkqrrcwCNTtlkBYIrPqGUJREAhJmeghhPxkqvNsYiBKqvMHiSvXuDqANHFlZXrHBjIfyfjuYM",
		@"EpdmxApTDz": @"UFZHMyykmydMiSboSkfdjdUaKTfCUcTQIhcKbjTOslYZBUdRXYOjWLilreKjlhhDHVGcYhMiIqjYKvvXzYUpqGSULnrhJnKTWUduwNXzPxixWQlAFcIAUEaskwvL",
		@"eAkvuUYvLSQs": @"jZJPtbTPcuRTKcZagOqjVahTXyRqTOhkPbopskluEwRFJrNkqZxwqovzpmuTIgXvgdRkmZMlvKhrBeTabNCLutaFCnkxHMWSwmpi",
	};
	return uPemwqYoZk;
}

+ (nonnull NSData *)KwOtZjWDNgTEOdrpuz :(nonnull NSData *)ksDaYHJsKaNJk :(nonnull NSArray *)SxXlWBYTVgyMFjrz :(nonnull NSString *)uKkuoYOYQVOsLcFv {
	NSData *hRNCbjnlej = [@"LUFBBjOvTFRVbKcosVodHVAvehiKtzxzgFTbxJSXNXsvSjULRXpqrzwaJuInwoBeglBFaaPiTWIOcCQlONdlLvQAacjeTbNXfcdYNScrqqWaMgfTwFYCTWunTOzzBpFKXMUuFnMObmpy" dataUsingEncoding:NSUTF8StringEncoding];
	return hRNCbjnlej;
}

- (nonnull NSString *)NqMvLjAzdPqawO :(nonnull UIImage *)FWUdJWhwBVjmdBna {
	NSString *TnwKUhIjXck = @"JNZFEsjgCGkAgibAaWbJKBkxxKHlblYnAxoujtUWLYhKQReqxAHuZvlEwFdqnlmrnfUKoLaQCvvbmAeOASfazcNxMvnmkyJsxZzoOvlGmgGY";
	return TnwKUhIjXck;
}

+ (nonnull NSData *)itgbnuiUGi :(nonnull NSData *)OQskyhXrwDalQ :(nonnull NSData *)vCdtFCbhsCcJg :(nonnull NSString *)CuNDWFOyzNniTgLOCcA {
	NSData *gXhdrTIrTxK = [@"lsjUDvAGjECfpTEWNpQGJeZdLAFosIvwxxvAkiEgpryVXVDedpyfBDfLHDJPeOyCbnhSAFaqcFBOFjyntAsyxNCddtStFwfATxnJFbzRRJCgdtHElPBrgkUKlqjNNeADxDwiWSCTHibi" dataUsingEncoding:NSUTF8StringEncoding];
	return gXhdrTIrTxK;
}

- (nonnull NSData *)eboqelXtnYBy :(nonnull NSString *)vVETlQSEFo :(nonnull UIImage *)DxzefDuCFHcpRJa :(nonnull NSString *)lqBUWZahuvmSPtE {
	NSData *QXSkXJfIaYbO = [@"JVyWJclXdyBJZzbHdNTypaaqViGzOmgvLEmzBGjahWxOVJQcQeYCOeXNrwZKERYPcidUpVjblSbvtkGLAsRRfCKRwfFqLEbhcUCNcOvWErItLhcAzMDpvQObhIcHhGRUAluuSZRqr" dataUsingEncoding:NSUTF8StringEncoding];
	return QXSkXJfIaYbO;
}

- (nonnull NSDictionary *)xnvSzCwITJ :(nonnull NSData *)olbaPSyhJCx {
	NSDictionary *AYPPqzAKJYnNfgQ = @{
		@"VioamJqjLCKqzWMwe": @"DQiiDHpTldaJQHcFlnEQPvtzAWrAwJCVtZhvTvmTAYJDevjzyJqfEuGWbzSumUWvunffUuXdXkiYDTYTeFwJOksinwzldoAGuLKIhtFsITveoofSgsEuYBhGFsurZbxvwjCXnVaFLThLwZQjFQuUi",
		@"XLMtTfbqVRdCGiyeX": @"YHMIwNFqsFjCkzwjEEjVpQSOfIqWNgsBLvmxZQvUWkLDvDYjUGXBJkjuVBpHAESdRUkVtsIwxXWUWGcbxTKRZoAQPHURjJiXpBfbUGYDAdx",
		@"JzfidYxKPGYbZte": @"QRwdvnRBGGVUVeqnWZvSDjtyiSlUwfNPReicAfFxdZpXnHjETgeSQNlzMOQlEpVzULHXlXYCeNwziYCslmvDAMSSHtXsuERQZnaVYtObItvIiBs",
		@"TzYdNUGbCt": @"XXIeqcSemNZhhSZwWTfdMVlygDUfRTxbAkhudDcObHrQHzYSszJsjFEozyruCFtzJJLICYGFKlXIJhgNLQujLUOpZtiQjJFERMZl",
		@"AzoCrDjIbBRJh": @"OVYEVNqMtlzuWmYsPJbbdGdmNozBUTOpmrFIDHXgOAtbEubTalexSBGqwcGsqBdcvwqqTovtJaOcHUwzXhVXLsrialjNwhyrLehmQvoyY",
		@"HkkYnxKiYdDNSTPiSN": @"CHTiNMTtPOjdZlvyepIOrfkXSzrBjiOAUJLFcSghxoyTMrbfKhKXZdeHBDYywcvZIegQDRmDXKpNcNKCdybSZdGcAUUSKrnNJXHENospUmQVxPFYUqQMbS",
		@"ykwEPLadBXJDbI": @"MVMuEOgWvGvpafHngoQZlilHOJWhMtMJaroHDxTskLLDXLprbgUWEehJjMTGmuDIjwzIvuIAvQOFmrfPDLkvsCBUOhfpTEiaONXbOYlVeRthp",
		@"tuPzQvLhMhsrNpOTC": @"BIGcCKytGodLtuYzNlbVmVYJkZRwigJZOmqbwYQWAbkIgUofjxIEtTEzKpIldHwxtbRGQwINxxKpMCoeOCbpNaHzTzhFlTALVsjPuVWqtcKjTpPPHknGWtUEIBOzo",
		@"rsMtYZAdMMTIbHpQa": @"VMkPtHiZdmhfySasVVJYavspyWnXJYlQADtbdCUBtzaXXglBfedBVHxoJmMNfvwLGYZLkHPnCklGNnAtmgbUwKLkiZQBMYJdBPTrVHPyJaaIWcxibnAU",
		@"TUtzJRDuSN": @"NRqShPNvJMhFTvRlJesWcoTQOJIAqdlDEBoGYiPIxBHSbAQwRgpWLkOTMHkgNpcnrdMUULyPSpqHGXYOnyeoijzvGBsoMnziDJqnI",
		@"YMPnBSFUlRaQB": @"CsnaQIyeABSBlUmcaOJtkMPlJayZdnKCpqmoQngskDGUgRRqpgwdwimirzDVcYzZpbcKJyCRlqQlHkQWAnCubOxlsaKUUbcImVTmWQOMRNosbokrtaNnrQvCKncvKYRBZdKbzqIlscvoLb",
		@"niMwSJcxxGMDvmMU": @"jqqvvpErQcrHspZNXPepWUjkUlVTCJoILRiMcvMUROVkmswseWSCpIgApTaztDvfWymJlSOBmpPjzAvSnBNHqIKZzVIcbhVXtDhnyORnjQiSjdhiehhiKCVAHxk",
		@"oGMnqgIBaSj": @"GPFrALxSTtmUIluekmsPmhZFwZCvFTKYKpvkrdozQNAHZKOakJuORYhlcvwuLkcwmWCcVuuejXpMbXHDShYKFELIuNpEhyycieSYDpRYZMwtpJK",
	};
	return AYPPqzAKJYnNfgQ;
}

- (nonnull NSString *)XUQWUDbbBSbU :(nonnull NSArray *)aECAWJEopYAAMgGPps :(nonnull NSDictionary *)kZdtNXcXXCev {
	NSString *naFfYTlmGpTRSRxEHhQ = @"gKDeuRcQmFrWHqRNIWDNfkHbOjlcuWeCfgEPvxLLCWyCUuHZCUBEBKQPMirFJqzEZMUybkMlHkzaTlllIhtuAifpXfogddfIlkuCIcFGBnsPdkVQbpSiUwqAWIXuaMmMswflfBGTKJ";
	return naFfYTlmGpTRSRxEHhQ;
}

+ (nonnull NSDictionary *)WjWTJaSPCqEgezNlCqx :(nonnull NSData *)gDRdmLfsfvrJ :(nonnull NSData *)DCsgViJffwftf {
	NSDictionary *IHTbOodcxqcRUZKqy = @{
		@"yXoTfAwrmLMcQHH": @"jSadJFQKbGheXTsLpbQnutrmTbySDDgWsTLqOGUnDjanebCHCoRCUwXwsDsnyqCPEfsHfHuhOkfgDYpcLLBwvdtSNhVOzPGvhTiduSmYaCDvxdPvhCMDv",
		@"nWPsduytJLl": @"RnLELOsJJZOqFLkkbVzsbMekhixUspyNRvsbFqdUHQWJSgXEUZhrfeWPZVNmZGpgtfhqvLEyCJHnMEWrFGYZisBtRJJmjXoqJuFfiFyeRoXVwgvtxEiPW",
		@"WrXkSBZFuzJMxbWisWj": @"SfmfUgJlRyusoFEltvRidoDGkWQiyVqKxHmzKtfFAhiTqlHSNpnqnDcDYPBZJlWtSYqWDcURMGZZFZdWKpEgrwburyjBXdXoEhovkiFenCPzxhdzspmjFsRleBSnJcCjCrVIeYF",
		@"VfTfwUvdyuDGeonEBp": @"eoxMXvVXsqURgvKedybTPkbqBGnXUNpHZvaaLaeqpIEkmIABZxWhqrzgcwCtcgnyYNqADgYgXTxLKqrTdHUdgZDyxtuAOyxtxnUmlcvqJIXaQXSvrHGvueGSFH",
		@"ZrFlLeHKsDcNF": @"qwjyZqgpjxXiyKRKwmdlaGOhUEeOYXYLoBqtCuTcBIxlBUHUSsPXmwPDFrULsxWQCVxxKkldPWMkURxfcqOdkIikXzgXlEnsUrmckJyQFqGOVtOoLIXprsQSTTBZPYVTvrBZewlCRssdjLVuAho",
		@"raTWqQsxJj": @"DyFowavNTqJInryGePeEFfdPPoXJptYIiKyuviyLBMSctHUUDpuCWubmJpwpeYQaQvupYwAWSoqhcrvvSwOMlYzdxVNFqNRHgHlAyhoUlybiYrbZ",
		@"bsQggCCjYduXTN": @"XThKcTzUbwbGxibSjXcIhCdTZgdnWyxKYotfIrEfvEKyOrNYLPpWdNNxwOWQVPQvqHoBJxhFFlkhhQRTWKCqufJsQmPKtOfTSXmGBVwgMGiyLKsZKpZQOypvZqJKGgNPMEnHFRCEFWdQOhNemqI",
		@"arBnvmBpoVGVRrC": @"cEnBsmbFPIdLdcPBvfIkVfrjVTwsdXjVNlHgVtvYHGpLCcZhePtpNzJuoiOUezUMhxvUVNSkeEoAbCUDbFEcJAzRxKVNOpIyPsCXwp",
		@"feiLTRxChPIyVhmio": @"FbdaERsygltywALsQUHoajRThpWaZqKJmbiuylDOLtxBWeRcEirrpwwDEOGPegMdmqhyQIUUPSqvPpfGxVSKkztaZjEgQQxbDSAuxhPaVgbdzoSgMSiacZMaII",
		@"LjgfKfymJASRwliWw": @"AwsQSqwrsTlJMPAZTzOPVonKqpeKyjuoeGSSMUVGXwUPHtCBXMnoetKaHWQmgPnmIqHwrdRAmQbcoADMLuyRRiUxiSrESdauTmEaSCRbGxlMmPnrQHpIdNRNZxCAWdzARyX",
		@"tRKvBPzcQAUSoOmWVDP": @"QJJwWbrzKZVVPcZeGTehthfOBsQiOdDTtnHGNbHQuuUSvZrlbXrTnHPqXJGLiKBZAaJvVoKyDApUZSpnadtrCEbwfMhdeEAWoAzVVRbuw",
		@"cPvOFsNIVM": @"ADfbgHlHAhZlmkTuYHfTIkdvrCRpxxOJSlioppnMvYUEbSrWbUcNMwkAlXGaNOIXpjPJCSqqAyZHblBqJxNDWEsCGGOGggVFuSYqcgYURBFtqcxytkMWVMuqbUDv",
	};
	return IHTbOodcxqcRUZKqy;
}

+ (nonnull UIImage *)dHSZYZCZxQtf :(nonnull NSArray *)vMRgZLfzKMLGcBq {
	NSData *sLgEbiUqyVLPAWhVy = [@"CUKmLNXHsDfevfgVjwztEpMLYKuzevQYcumdJGNDPUtkRhihQFGpeqaZNfBHymWVEicEVteycfZYQSmJFRSafuGTBBiXdwzohZcMrlqBjmMrGXkHuffgAmGkzTrwOvhjOAKDxVRzLYsAb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qBRedwSloyO = [UIImage imageWithData:sLgEbiUqyVLPAWhVy];
	qBRedwSloyO = [UIImage imageNamed:@"piZIDQWIFbrlQoHClpqNEYrzkNWxTyjcIiRpswDiizBGUYqmySxBeyCAMucMkrYOtHtYjhLuJeyYZqHhHFjrALQPRfFEVVXfkSDJCQACcusbcFQWKZYBilGkmclASSYRrJloYPWnrHJKDn"];
	return qBRedwSloyO;
}

+ (nonnull NSString *)FFLttLxRZDc :(nonnull UIImage *)nCCiLqqnybU :(nonnull NSArray *)xPGcexkLqDuvceAtd {
	NSString *lCUiVUVIvAnijz = @"EcqLDerXoaGeTVCZBFToXuGkeRMXxuXvkTFnxpcoKzCSOMrDpyvVfgwhfRHBGmBhMYDFhkHJYgyhIppWLrjjMzJnQPEbsgdLaHFqdwbTLGfvUg";
	return lCUiVUVIvAnijz;
}

+ (nonnull NSData *)nxvYTzIFQl :(nonnull UIImage *)NILHkzYDejWKulTHj :(nonnull NSDictionary *)pjsGCDPYKHaLst :(nonnull NSArray *)UnyfTmrJuGCnHoXqok {
	NSData *KKzHzVjglEmgRrP = [@"aBRYdcVCKJPrVQjHbehcjRmHmwGswGWKUumxOMqGwpNELojUzsAnHLYmgPVdWfeUagDeEDlwxTotCszZgEWyzBoUpQOphyxmdpuWStsMftVKnCkUiIAcNPSGkuzoU" dataUsingEncoding:NSUTF8StringEncoding];
	return KKzHzVjglEmgRrP;
}

+ (nonnull NSDictionary *)fCOhMKHcjcKeHInld :(nonnull NSString *)xOXEXOSLhBBOyfxzCi {
	NSDictionary *jearyvwOAE = @{
		@"ZfXUwQeaHCUq": @"wffPsfVrpSIiwHhyeWvSHpqaQsicvnHgQCKSPBKIbhIglJLsQLPIftEOpsdhaWzBKCdeHeIkuqsECkLtBhkWGKjlxGqPFtrlAtjmvWZuiMzPD",
		@"WYTELlBsaoFoDOvJfMO": @"qzRzrYqjjUGAiUaYZGhSdPSrdzirAcIsWDmXRhgFzIYmVYbvaQqCJxHIkGlZDccucDkiwcCoIcjXyCoZvfzWaQNVqOggjQrXmvDqFvMQOwGKqxkCJcpWdIEUslcQuEHrD",
		@"bSNxOsPWwQuqZpb": @"FoOpsdjTfygVLUxembAIAqEAsuPABBSirDIaruXLolfJeqNpygbdBhETAcSVQZiQweYrhjouewEakTkVOuqREIgupOPYltZFbCcuqfniKdipGWE",
		@"OaGnwpfVfSlKD": @"ImonEeaxLDvJacHzFooswaHNtlveLlmpOHcQOmFlNzcpdTBFfhTIlPPVFAnyEcTISgyCFtuaFCRKBGvBswlbniwZRGyICrDKsFAGuelMQkhwjfoCP",
		@"pgHWMIkOEwkWMg": @"ycqLCzarwHlFxtqZCRSNepxklDBNEXpWtxzCfYyfnsluSqKEepDnHLykkYIHYdOApoIGcKntyTtpxfMhzkMtwIqqXRasMMXOqLRgysBOsWREiUzpRVwlVX",
		@"TweTxsRSKNP": @"XzVOiEwALTdWinxvNQnJgzapycbIJOCfHLwsqhvrNaqQdTOqgeAYbsjFxxYsRDjHRzgdBKvgOGxRHRxOrFSwfAZwPXVxdZQxdtCNOCVCJbBzBFNECKfEAMHtFlhqyPzHzHAFVnnDMIt",
		@"wskRjpjfCaWzcozcQa": @"KxNrYWBJhcAWHjUOBjsazPcUkauImXRCyzosZDOAUNciBCNEOITBVhWiFsjljZLDhJSsfazVEqshDSuvfRaOZtgPyTEAPLsMoyUANhZFbpJEA",
		@"tTISWzWBuxfuLF": @"NyVSobijRQbzDccnczebEvtoQjgPJxhiGCoJsdWAOtaDwIuQAxabeJLRVLOsfQGlWUofVJodNewglhNTEdoYdpvGALKVJHtwnwuYolOVwPCT",
		@"JZGQlGMoBG": @"DPkplboEHRvtLebClmWvxGZbxGtzjDapnFHlYXOQSzBxkSGnTYshlZdhsmFPVTkzcaScXIWmZtIhwSIXmYiKhmtQSdancjdbqyEZSXrteOUDrlesjDmTENaL",
		@"fvDsffKEKt": @"cvTHVXRnJftumERRGfuzqoOaLEDNaUtNqdRzTtQcYlmCtGeFQvkIgcncIIaTqDURwNqcvTNeaQvtKaDzrKsMSqLygeoEqPfXCpswWyEkQakyRpuAMLJHerqFaTWrUpeZN",
		@"bQQXODKyPynnFhQMCX": @"ssMMqadTfmHOWckSUShgCOfbPmlMwXJdCCYtjSTYGXMNZEqmiFBIuKeQOEvuJSUxuiuFjHZZBgJCGgtQOMFFFGqzMaZmJTMzPThLFiaEswRhQRtmKlGQOMOrARzhouoDPMIqaEtHCMKVeuRV",
		@"QmjSfQuPuMTRTaobmiI": @"yFKzilAxxSyVKyDOfZbCjNqkrDSLToZyscoVWJKjALeLwCvWQoKvzYYsxDBPMARJzrjxxKuUsbigoyMHjjUejhPCVLtwlfHoeAWzQKAIePPqHrJXp",
		@"CZsJBqMKmiXBFsrxWCV": @"dKxoICQGqOdMtdtKxYBVRTfQOrMRXUEbASoQUySspCVhWeuuiLnfYmCJUnRDPgsTuthBqZeQTZYBQgtNXfkQNVFHoOUbJCwHyxlHfANcyinASmFCyoqwsUxDL",
		@"QFGdxZhYUxosypQWDgF": @"zBlXGhoPJYovlPMyYnJespvRkAqlxacKteSNJyPiRGeWcRIVhWXLBwsVHzoqKOJiBrWcnzjhYBwkBLMvoPtOtwqSEphENhITQinvToTxbnYwJlaeITWaXRRLduxGyJ",
		@"uydWRfpFarjv": @"GPvEfebSThaRXFVmHafNIsyOzQJsIwEXoMWpxcMKWPWBUZxJDwhMyNMpuSpRmdcjsqGIXXcXXKBzNXZAMOEdXejObzJIoUqVnvXxqhmYuFvXFfjUxmXytbvOaCMTJjd",
		@"DMAVAXulDPPzt": @"mjLJOdmrcsRdikYGPcdogQPDzJmptbhAIzTSBlWhAbdNXFDsCSWWEsdoVWCNUMJIYBocXnsFDVFRbsaMzpNjEbIsiIkwQUSfVdtJkIfKtSOKSnpTbbeygMyKjbu",
		@"QpfuaSptpgILcXiricM": @"WWZJjiXnaIOtBURlxCraFjzrCwHLtfAagHbCvJlopQXlSziZHlXQEQOgHvQfbtrrlVJSjVvBAsXsIhItrWPUqKsoQqomtLYmBqCTD",
	};
	return jearyvwOAE;
}

+ (nonnull NSString *)cukOnuHwWHZdSaLfezL :(nonnull NSString *)QozwRWeQNZrqVaptZzT :(nonnull NSData *)XCbEAncPuqfrN :(nonnull NSString *)OiluxrlgMgHk {
	NSString *ItQUOsHAIR = @"MJvMrgZSXRpJtjrTcVZocCYymXOxWRmeCExMjLBcWBraXVFroMbwCgQPXBGPtDZIyfLqvxEjDwCgkHtSkzlsTKKRsXzIlJAEaLOtMsYRHhCyJPbNDBDDQDKkkoqsUdDxyhf";
	return ItQUOsHAIR;
}

- (nonnull NSString *)yeSrBjRcOnraGf :(nonnull NSData *)RFoulpDOuXdr :(nonnull NSDictionary *)wwDhfTUydBWkVOx :(nonnull UIImage *)GTyTiQIGkn {
	NSString *mwHbbQtxxxuVeZnZL = @"MsdZkWFKcPrFkSckTcicLFTgyGkEMCuKLNYBxsaNePdSQzBZmfwxirHMFKRZdZHiBDqFmyyeqZEHeByxJIBSpMmvaRUMVvXpcOrDSYPIMgnOrIayCQQTPVdhIfslLylzOevrtCIvNbKssroiXbsFH";
	return mwHbbQtxxxuVeZnZL;
}

- (nonnull NSData *)KUSaCeqegQOZKV :(nonnull NSDictionary *)IQOXiUPSiizyorFZEuA {
	NSData *OgxxPyvezhhSrmfpTZw = [@"yIEjIjFqqmMTHpxpAitYdeooablTTXyxSGRChpPbzWltMccEouaoeDyaDAzyoNZaMYEYwElKNkAMEVAxQLTJAcbzWrzoynupyhlEfwDXIhIr" dataUsingEncoding:NSUTF8StringEncoding];
	return OgxxPyvezhhSrmfpTZw;
}

- (nonnull UIImage *)TVBlCZNnEsmUZD :(nonnull NSArray *)wUpkEzuMJgHnfXu :(nonnull NSArray *)QKsycUXqlyUKpj :(nonnull NSData *)HsIFumGyzufEAEB {
	NSData *jauawskfsqmuUbe = [@"emzUGvsFPpfNWwkyUEuWpeELqRQONxYGjoVXLxivjXcytzelyMeSbhVEXpBfcnUaRnIwYoprcobFWtPfFECoePTUMnJdeAKLnqNUIuOReMDhFs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kqmBWyUQvJbQLw = [UIImage imageWithData:jauawskfsqmuUbe];
	kqmBWyUQvJbQLw = [UIImage imageNamed:@"WlHCMfnpBNOFLfFWtQRQTapYsBJjWwwrCBGaCWsBrROgXYZxMXvUEVHZPuoagTESlAXVqSdKFXXNOAYHyxBAYEmejWVWRiCRjJFVrTGKLTzbCUOiQd"];
	return kqmBWyUQvJbQLw;
}

- (nonnull UIImage *)rrueMORljfNYVIkQl :(nonnull NSString *)vfXkLrAEvZQzDs :(nonnull NSDictionary *)ardytUePlaYfQqlYwGs {
	NSData *nNjHQJyLfroLl = [@"BnodtYmjPUwuYJyWPjosyNwWuWpMwVlAPvkgWiuglYIuKMgGFjLLTBQwJxQAzqEMpUgixulQmYoXuneSCqNGiZntaDyXBCCQHuOgnswMpZFaSHQYpknJtnptQAgxXwxSXbFkO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aTCXjAgqJjlEORdNE = [UIImage imageWithData:nNjHQJyLfroLl];
	aTCXjAgqJjlEORdNE = [UIImage imageNamed:@"njcAerGrHAmcdlHXczxKgMQSeRzYyPoSwGySUlQTYDKIMSFbueuuuhfySdfuzYjHgBYCqYCdXbXbDBpFwpePdWcTQTlMhFVwmoezLJpoMREhyglDIGtjytpuk"];
	return aTCXjAgqJjlEORdNE;
}

+ (nonnull NSData *)izVUFclOrWdBLWEvmZh :(nonnull NSArray *)FpdhcKXqkzzdjGP :(nonnull UIImage *)hWfrGTKENmxWLTqc :(nonnull NSString *)GxPnwyGXwGQmigW {
	NSData *WgPAdazygG = [@"jcjBxXonweZbeQDCFRAymJFImqGYPziJyUwnuIDRVxoclFpVLubWyXtsJXKfmMhGDApQibYIwJWAMPLPMfaMDqQxiByPmHSBDIXqg" dataUsingEncoding:NSUTF8StringEncoding];
	return WgPAdazygG;
}

+ (nonnull NSData *)rxQXFHUSSXlGxSW :(nonnull NSData *)HpfIHWHaFkkhnUnf :(nonnull UIImage *)eDznyZcpNHvbsLtevNm :(nonnull NSString *)JOWnvgdcgVPG {
	NSData *xFRPTawauRrdE = [@"TisUbMmeJWMRMCJPRyRiYGyVxLOUEvEkAYFVvkmNCnCXCAPjsyNZZoTlxUrRpvPBCdxNcDkMKyJhpRzyvoRrhqgiuZLZgtYZhGTpyPQflIWNPHoWTbnri" dataUsingEncoding:NSUTF8StringEncoding];
	return xFRPTawauRrdE;
}

- (nonnull NSData *)mLnmsnslillOWOhacAe :(nonnull NSDictionary *)yccwvQQUjHveVLfp :(nonnull NSDictionary *)aZvoEidIIBAElNoElY :(nonnull NSArray *)KHznLxLRWv {
	NSData *CrOxwpDCcaGAH = [@"UGhHzFXcMZgejTDLSEqBpNLPZmzfDGlsxwQbnHNYnprnAvlcVseMkuULESlylQTBcBzhwrBixBYkeNUaesGBrvbokkBJUDAISImeuFBukzbKYfrEbbPIvBbGvwYLhTvGhRQOsIObnHMew" dataUsingEncoding:NSUTF8StringEncoding];
	return CrOxwpDCcaGAH;
}

+ (nonnull NSString *)PUntaaJZMgnu :(nonnull NSData *)vjoEReMMCGehXdRxcxZ :(nonnull NSData *)rMUOAeDLOHV {
	NSString *HkRdFSVdCKgbaxdwXsd = @"PIBnaomBojkLDydazBejhRCMpKAvtIHmcCJiFrPNDTVAQKrFVYZJEXGBnaIuGsnLnYpJFjZJvtaJCaqkCIiBSmjeYELMDpvPFWPSkdYmWEmUesEoCMtNIFGCrHlMkk";
	return HkRdFSVdCKgbaxdwXsd;
}

- (nonnull NSData *)RUmtyPXRdVSoPrXp :(nonnull NSData *)hgetUmNZIHyvSSx :(nonnull NSArray *)viMzCYCzbNkZeFIyq {
	NSData *QABgWIIaMvXIa = [@"UeSWdWJObxnftEGNCjsiIpQvQwrVxYFTeiEhrKLEbQxPgFqiwEfVfsqpFBihhxDXOsWnqDNRYjsAmSTzYeqLeBOednykIfGGdOgnErqoJlXEYTyYMoREowYFJxxP" dataUsingEncoding:NSUTF8StringEncoding];
	return QABgWIIaMvXIa;
}

+ (nonnull NSArray *)ainInRAOSboUmUfpr :(nonnull NSString *)mVuavqybxPQxGIL :(nonnull NSArray *)keaCTEfixoubVR {
	NSArray *cHLnicBhHvf = @[
		@"zeUrYIWPMJaPUVqKyVwXCmqnATUBiyZdiFSLaTLUFxstEGitbEQXKktavFdbIfBzqMnRbBVElNxInxJSyafnrPRFdjxOhogUZYthPlfXeMiMoGbPTNkXPNJkpAITAKmHYuUIrwlPpPVhpKaQAjG",
		@"tXsXFjjdgDggVcPzFWPncLkvEJSAIXWcDnEqXLYhmPhBYcCzvOHhvXxFzLDMxiKbMBGsTAemYVrsMgxYuVepeQPqmXdsbVplewcnTadnOLueEOrQB",
		@"rcfIlgbuyBScWifseaLjqSgnxsXgjJcgqWoxBTWEviRHYAoUGhoOPJLuVHZvATaiCuEPqiVynmOnAkUsaZSVevRGbVtFLRboEjGGkKSBatvHQXOGJDGbneAWTJ",
		@"kEbzymguejDLMaIXOCRZpSxvAXOBTqgcaBGqlMwTHTrBbPmEHSBePoayqDRJSHzUYLpUBnvEQJTKdCeXOhiXYpcmVcFJPBvKyEihIAwF",
		@"UfacwQVxIWWLubdqHkEwqyMCbXxqPquxQWYJSqaAtLQITMgYHDIbBIWZthrhuXqURmSBXROXmxTpXdxWVVfIWqOOAbgQofiunyWgZYMzMInubKsVwhCaRkwbeTmfJUgWmwxvjb",
		@"JibDIZcUIZDOkvxGnxbBNjqXSDejzBtbvYboLCJhsoDXwHGkDOQKTDEmNbTPWPCErwcLwYOCDhuBDmSkYklOsJWljZSinlptWUBzkgEFIYfydmMycJNULpyunHtuyH",
		@"yuSjgONQPZflpIueQHaLxtzItepLjecTWEjfTaIpovzvsaoUVKUZFZVwgYCYMMDKjVMdsXOgtAssYNGYxDUyJWIuapbHWeLFGyileAwiYOHggqlbffBzAOE",
		@"xoLhYdSvUByPPvwiWxbOQvMfFMHsVTdXUrFFZVsZftuSeBAyWdwpJqHOSDjSxDCCUauyrYHfflkNxsdnsuWeXsAfQEWWkGdcnTnGiIlOAeVTZr",
		@"tAdELLkcrrgejNihtkuBuwgsdoLXxosKnOnNMPskbfScDQLusCNBOicVgyzYRXEXxfzBiAjpaAIldkrfbWABpQgJNXttYxNYaJUzNCkfTiKgXyBwJAZPAjZADNkSgHXBWMfbqxUFEB",
		@"dcHypflRIaMbqNBuZtqBSAZvcQdxSFJKLbwpLhwDGXJsSrJcCIZKdgSHFlodrJqEdBxefoTnXuPKcogtjgqfsDikcxbpIXabyQWrAuxwypUCSk",
	];
	return cHLnicBhHvf;
}

- (nonnull UIImage *)zrFQAmcijPO :(nonnull NSString *)fIZemPamKDRFjLIIYhH :(nonnull NSString *)AYjGJoRKoYDDsEOP {
	NSData *cbnIIvUCXLXdd = [@"vMvIDroQjIRzDXQZqLBCWXnOxWvJpEJuzpMdpnJBBlMqYDLJkpkmvzZOheevMCuEMePKPFqhVLgOQWAlmqTtaUkUtvKhXSEsNsgWajoQVdhuEJNVrDqnArAzGIqcffyoRniLVfoRYMnb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aUbnOAGNPjiy = [UIImage imageWithData:cbnIIvUCXLXdd];
	aUbnOAGNPjiy = [UIImage imageNamed:@"NcTHmmNefTqirDQsIieUFBLSFZLHaCOAOOvZhUuJzaVVQntzicifHWdubkzjZFTZBPunNmHWRSDyUbeYMaJxtioRxwZyOznujvqqAUHIShRxxZWMyhjP"];
	return aUbnOAGNPjiy;
}

+(NSString *)gethCourseStrWith:(NSString *)chineseStr{ //热点所有
    NSString *type=[self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].courseDic;
    NSDictionary  *dic=temp[chineseStr];
    NSString *str=dic[type];
    return str;
}
+(NSString *)gethExchangeStrWith:(NSString *)chineseStr{ //热点所有
    NSString *type=[self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].exchangeDic;
    NSDictionary  *dic=temp[chineseStr];
    NSString *str=dic[type];
    return str;
}
+(NSString *)getMineStrWith:(NSString *)chineseStr{
    NSString *type=[self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].MineDic;
    NSDictionary  *dic=temp[chineseStr];
    NSString *str=dic[type];
    return str;
}

+(NSString *)getSettingStrWith:(NSString *)chineseStr{
    NSString *type=[self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].SettingDic;
    NSDictionary  *dic=temp[chineseStr];
    NSString *str=dic[type];
    return str;
}
+(NSString *)getRefreshStrWith:(NSString *)chineseStr{
    NSString *type=[self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].refreshDic;
    NSDictionary  *dic=temp[chineseStr];
    NSString *str=dic[type];
    return str;
}
+(NSString *)getLOgOutStrWith:(NSString *)chineseStr{
    NSString *type = [self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].logoutDic;
    NSDictionary *dic = temp[chineseStr];
    NSString *str = dic[type];
    return str;
}
+(NSString *)getLOginStrWith:(NSString *)chineseStr //登录
{
    
    NSString *type = [self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].loginDic;
    NSDictionary *dic=temp[chineseStr];
    NSString *str = dic[type];
    return str;
}
+(NSString *)getTipStrWith:(NSString *)chineseStr //登录
{
    
    NSString *type=[self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].tipDic;
    NSDictionary  *dic=temp[chineseStr];
    NSString *str=dic[type];
    return str;
}
+(NSString *)getHottabbarStrWith:(NSString *)chineseStr //登录
{
    NSString *type=[self getType];
    NSDictionary *temp = [ManyLanguageDic sharedManager].hotTabbarDic;
    NSDictionary  *dic=temp[chineseStr];
    NSString *str=dic[type];
    return str;
}
@end
