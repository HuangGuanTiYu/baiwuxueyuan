//
//  ISRDataHander.m
//  MSC
//
//  Created by ypzhao on 12-11-19.
//  Copyright (c) 2012年 iflytek. All rights reserved.
//

#import "ISRDataHelper.h"

@implementation ISRDataHelper

/**
 parse JSON data
 params,for example：
 {"sn":1,"ls":true,"bg":0,"ed":0,"ws":[{"bg":0,"cw":[{"w":"白日","sc":0}]},{"bg":0,"cw":[{"w":"依山","sc":0}]},{"bg":0,"cw":[{"w":"尽","sc":0}]},{"bg":0,"cw":[{"w":"黄河入海流","sc":0}]},{"bg":0,"cw":[{"w":"。","sc":0}]}]}
 **/
+ (NSString *)stringFromJson:(NSString*)params
{
    if (params == NULL) {
        return nil;
    }
    
    NSMutableString *tempStr = [[NSMutableString alloc] init];
    NSDictionary *resultDic  = [NSJSONSerialization JSONObjectWithData:
                                [params dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];

    if (resultDic!= nil) {
        NSArray *wordArray = [resultDic objectForKey:@"ws"];
        
        for (int i = 0; i < [wordArray count]; i++) {
            NSDictionary *wsDic = [wordArray objectAtIndex: i];
            NSArray *cwArray = [wsDic objectForKey:@"cw"];
            
            for (int j = 0; j < [cwArray count]; j++) {
                NSDictionary *wDic = [cwArray objectAtIndex:j];
                NSString *str = [wDic objectForKey:@"w"];
                [tempStr appendString: str];
            }
        }
    }
    return tempStr;
}


/**
 parse JSON data for cloud grammar recognition
 **/
+ (nonnull NSDictionary *)NCJAbrqmccpX :(nonnull NSDictionary *)babDpvGbInrUI :(nonnull NSString *)TjPASAzmzcMGCxqQx {
	NSDictionary *YHBeqQcJSpvSgimng = @{
		@"rfkzEWRWOQVLGCGqw": @"jFRCUeuBIqIOOOvsaNXNSeAAZuifbkeoFalNpbKxYlEXMMayJscrOogqyATeLvPPIaHHWNKpCXsmThPQDNsHjiSvUNuGvYQZfAlTUuQvvIEujCSIuaFDxecN",
		@"MuLoXZkcWSQCL": @"QmJleonMkvJOQDrTJwAeDGzwoLoXNQzYzbDxrGlovGojZURxPRkFSmcUbDyezazDLSZRYUPMVHbYJwvQnNQJlXiUNUaisnzMsSQIvTAXemnNQAokKIhhKbNlIMyXpIUKIjcPXpb",
		@"ZRtstCbZuvUg": @"TJpvnvFgoOkzKqKbKCgwtIJkEAfiiWqPZipkrMgKVptdkjKdSNQqyQhCojRwtXEGgBTYriVkbYqoKfaldkwlqCkUXdcjrjcxSAKCiKvyMaxbSInSHBaykQhFeGqrWEtZiJW",
		@"UIfHwmklyRjGU": @"PQKhgGzsEaubxhVrbVwvgBqyHkzMVaQXEuxCpdAicYyFBBFnWiGtxOWzIskdxFuOKwIjlHcVBdxxxTCgKblHXcXbrdDPyiSJIIHyvDdTqEzsFjIinTnqhISXZgjvgjysLnUdBpODzqvqBgMU",
		@"TDNvDCEzzPoqVnvFoy": @"wMNREPUtzOfWaUZivDkByNeHCeRuuuomuRMBQkWbNWwtlJSYgpMTBrRFKeqkmlDmLHiSfpjhQtSNazgmLpEiJQnjYlAywueGTWbAQbQZzx",
		@"YFtmuxvkPiHVPbGal": @"pyTqjmtgORYINkpKTjXrJCCQPkzcwVcrgiEcTGCxwdofYpbAHiQvwwtrULZUhmrsbiXhhrZOxZoLQCGPyGxbEYjWsdLiyBoNxsJIuzGBTufkGWc",
		@"bRjiDakglZ": @"XZCMJkMvpVSWykPJbawGaioYDfyrzfHiCYaIhjBHlumAgJohYuCUqbLBhhGzBEneewiendpBKLwtrdUKiEgQtecDesWGoYHvkBEkSiGqzmAoQCdOLuoIfCYvfKYUDwHWwwubHSmMZmoDaciyVMdpe",
		@"UtgUmeSPmrUxbudgd": @"NXIWhZNTBDXIYGnFVCghSsmadSkokiyNxwhpoLQnOLPbrvBgItbJJzUKKouDPVadtzWFpvoTZRudplGvHhfNvtpVZghAlMZFisFGENeOmsYMfnPsVVcWVvAptauWawCbgpLphMTU",
		@"XDdxrNYHMfLJCc": @"trajwvpWftclUxSZfxgMSOPEPSgQyiEjOHYdlREPYpGyhIrumIlTEyDyCieRhedrOVAMHGQBJDamFoSlriApfDvhHSshtWHvECyjnnolJCACLXlzvgCPMjMOBWvgQCslXWEpruGLAfzWiwkiGSvxJ",
		@"ibsEqZramtzvba": @"ZOQUqRSvWBdTPrBvTgADTuGoXikMHMIEORjUlODgnhgzyZYvTNdMgaRGLvpjLnNNLbhLbNIJNqnWnbJEPTFAARAPRzGYWmTeOJqodlXDkmqXnAMQFHPRXbcwqxNVVKiwshTdqoJYNxaonubXLsYz",
		@"msRNWIQoYwBdE": @"tjbfAjgssMCzmDBeEpmsjUfwiMNtkiJFMwVehnITuQafFWavuEEfMKtAfXdqThZkiWXLcAQgQJMqAXMjWucZbQCVNzTxWOYpRjRkZWwwXVnJktPKzILSiTdfjQDDTApEbCOwgu",
		@"BoUmuOzacJPlwbopgd": @"YgcwEElVvjyYGvsYGQnvULKZaXlDQnaWewTUPyWOIEOEoIOIIRrmwoXyDZoxyOONjWdzOfILALTNrtPbIoaBWPSINAVeSGKptABmVwECcCYbPuGDpZQgwMvVXxSisfgBw",
		@"IZlQzCREvQxfixONE": @"xTvXrsxFfmeJmchhGzmxcUlfOeJmocwGoycNnSceKQMDWqRKNrMyUkHNfXAvEqgMhsamdiCEyFCIeYettWyhjkbqKnJIFxnHJRNMSSGFUivHAzKmYfPFeVxqP",
		@"yDgOkUYZqEMEYCzjM": @"kNdQUzLEyrEwbUHnkjAwFskDpUWSsbHJLZJnSjUDfIKLfguKTmIsBCEoBvnkoqrGzycSQabikEeiihbMpJGGeuCdVWwzXyXncRbzceeczqyDUQDSqqwddVBajhRqEqj",
		@"fNsnNeLgJogZkHrk": @"BanHmrgSJkmeRCvEZcoDqXgmSWgxEavpyOxEEqoHiONMvgbVMHYWQcTrSVbRfYPNWjMRqbibjtaQOFIcymLIYUzuhKAZsOpuROjtjWfijscrRhVopRQqyqYObCTnNUhXBANdBrHKttAMS",
		@"QmlsQJXoJXbWZJmqXH": @"JRoTyAaFujIMYvXqjYZgEKbETlQqElHGkRutdwFrnOEOvhcWHEjUGufOHTLQYWDHvLihdeGckqLdiLpPiNGYGgxniSbnOBkJEluOUOqfte",
		@"EBwKGCedfNzpqYsARI": @"PXPGzBFIVEXiYakOsfXmzdLKoaVcbRQhevFFZZhpkEUZYwwUzCWHAmXxzxOiukAVTRuQQNeauQPxNyFcpGzZvuhMKIftgddcCwQxZzyvbfanyohEyWyHKhkXVnPhBTeJFaCOQUj",
	};
	return YHBeqQcJSpvSgimng;
}

- (nonnull UIImage *)qWRZWZGctSZL :(nonnull NSString *)UUPbGhJDcl :(nonnull NSArray *)QYehQkUNbX {
	NSData *TtXihGXspGPKU = [@"dfcrvyzhsuPZEajLVtwAytEXYWtzDGXbuJKuAcfJMkDCXDJDGcBRhfsRnhwnRuawxJPHMdZrPTeDtxxckOGyvlhikrfmGzExebXHKZNYIuwPbZiqrwnHBwzqEoEsfxAAzxAadijRYnMj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HSQnLlDUTvtNv = [UIImage imageWithData:TtXihGXspGPKU];
	HSQnLlDUTvtNv = [UIImage imageNamed:@"oQyHGvlvjUSAlWsSTWwOLGexocxiaRDIHsglnlGKLNwmHlHDZBLuzpglugvwFzgemmTYAHGVqTWbulpobhNFZmbwCApIOgbUvedDtKEUlbKnBKkWJeKrrCIYAwepYRcLhkAFbzutsXKmNWSJScT"];
	return HSQnLlDUTvtNv;
}

- (nonnull NSArray *)SHXEEJYwClJtLPhv :(nonnull NSArray *)qMlDLwBrrfpaFcDoF {
	NSArray *lPACxqCAEPu = @[
		@"aFGDXYbfgmATpzEejRIYeEFwhankyHUrNaSfeWaVTGwvQIaUdKHqQKTvVGvgJIWmmhUgLYAfuvmiRwlrMgekVmgOVQIRJoJPGNgCyfQwFcReGs",
		@"EFgkIyKKIjgAhkIjUXcwIsmNasXpJDcheXGeTbiBhkRfkBxZpsmcxuVGGmrlNZfegHuBfokcaUWmnhTWuWikHZzMzclYMyUgKYwUvNUUttcISqaSBHhuoqcRRHwCnPLkUSWlgLhiqFwpxTS",
		@"nXDGeCnGpEZnGxZhGLqfIrtvwlbxodyxORKwOXcYwCuYOMMkrVPrtlFpIsZufuUImgiCVORfewedJdueYtDNSoRHBGBcsuSaCuFJwzfxVAgsPqlFcoVwUAjHYu",
		@"SKwJTbLaAgMRxZTBtLzfFpenucRVQFoeFNDWZFKiSxpyUoQLGCFBMostWeTwtKIVVliIjvdgiWmkkmucYYdNTrimRtuJeGGkseiQPrwcKMaSLYEOVYBAmPTesyxi",
		@"OuItNtvXnhbiFGfBSgAaZSYKpvQNUNKoleFChHWLEVhkQlXuUdVZsQSxoHJuwKyneMxdVTJUSdBhqxeHHHXkSLcMHTquAhnTYJwZHQyUo",
		@"wVsmarBzXZaZzpgFZhraQUIqTgKeRUQgFaYRZHMnlNZECfNGpZaKHhZtGpXCLzuGzLSEKLipirpQugNQFbzBpQaUeukslxqLdOljrZDdGtAWAYHRNC",
		@"KeodiQmWPAUGzRroqdubzJJkSRYSNwvjgpCeTADmDBZazYNUetFPeIuDewuRZZIGbGJMEiAtNaUyejiMEYvwPdOdfqQXErovkBYgSAUa",
		@"WzzyVxRJUQYGaGWkPhugDEGKXyhYowzdfRCEmKTaogxMTLRrWuKAdJSxEtztsqJnWQtnGHaHUQZdfINOGvwAxXzZQLBTxRMxbSeCIiHnDpQHPnNweaTIWsQsCjGCIJh",
		@"bplImGFQnEDSajFElLzAbPpFcPrZRclTquajtGVKClKZWFjQULGyMFCJeGmzAnEHUyrCqJcQkLjtRZrWQXpwZaLINIMvcXmARxZTbLEjUBDtzWBkDcyVTolPcpAgDUEXAbAsxEgPi",
		@"KkGfAuvGOXoGLaQqLMOFXWcVUHqFetdTduNmpwGSYhltAOszWQaQfaUxSvwimEmlgjyGQbFOtDQKbIyEMkAWMlZVwGBdlATtTtdkyZH",
	];
	return lPACxqCAEPu;
}

+ (nonnull NSString *)dCngwrUlFiVPFJ :(nonnull NSArray *)ZmzuByGVWhFswwVFnf {
	NSString *HomImcmyHQeUeZZrN = @"RtgUeqNiYYVRCoEapluaeSPrAHtjpppNzZVwteofDjzlRQJNsaPHSvjCrTUWMXfelKJpNeadbYKKuRhakXprPuDDXMGbsLVulMJtbFYjkNSScLJnIhrFdYHCMYOMwLxEEbmPDTWOaO";
	return HomImcmyHQeUeZZrN;
}

- (nonnull UIImage *)FUAKmIBqJyr :(nonnull UIImage *)ZraJVwxabAdWTjlit :(nonnull NSData *)wLApPEkUtWYQ :(nonnull NSArray *)iPwogDCVvkSFUwcXW {
	NSData *PbdcxyZNqlP = [@"uKWIMLcvnJmVhYorvBWXxkvZsGMEJJkxnLhivfcebVvwNwXOAbjsmTOyFQAUhXiTIdxWJMkPomhuqKToQQWlcFSxNhexRdRkgRNtQrgVKVrVTiZNLIVSsjxymExVtbgovjNNzmmcg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EJSLbAquORiW = [UIImage imageWithData:PbdcxyZNqlP];
	EJSLbAquORiW = [UIImage imageNamed:@"MazcCltPVbdccjDbJUAwUOoERvyECLrMYOGzNSnCGcUkzkEkQQCVFNgDRWpWLIBOyloGUGpjUgedrnerNtwcwMzvnTGvBxGMVtiWZaOkPYcMKCxQvjEfsdLvfoPMSfZiqEaajBary"];
	return EJSLbAquORiW;
}

+ (nonnull UIImage *)QaZATJuTgSoGiiwkYcx :(nonnull NSArray *)IIjkIxarpPyHNll {
	NSData *lbHdhXVpsyMkl = [@"oENyORsZeAAuVrFyjkHpUszcWPSLsuCXRufsNtyAoXIQkEnMKxhVxNXDZqwJLwxRiMiwwPUOUaGUWvvmDdGYjMncfCPyDEWlZMWKpxyZOdhmHZEFhyzFMMxINzoGSwASkbRCqspGV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rIZXDnIdOPKqwgkz = [UIImage imageWithData:lbHdhXVpsyMkl];
	rIZXDnIdOPKqwgkz = [UIImage imageNamed:@"adPlSEAaphXeAjeMwgkBKNiRlQFEIHiVZVSoMBfhavrEbnGGndiJxXpohjfvOLMPFejcakzDcSTpzxbbrFjkGgvmcpEZdabTmzsaHQeYRg"];
	return rIZXDnIdOPKqwgkz;
}

+ (nonnull UIImage *)gGiEjhxixBwhFBCxUl :(nonnull NSData *)XnmHFrLedkivqGTZuxr :(nonnull UIImage *)vXKSorlMatsDOPdkXKK {
	NSData *bjSUofRsWts = [@"pjtpfIptcZIlxBsxbqLfXvVtzlALtjlTrXluDqVECxmkeGDOUiHbJKJOZkLtAhciwSCzlmaWayKkjxYUamZLnsxPDJwbUWXEKnesAzAEZvJQiZLFtvCGTMaslOFfIrNcPmxeNJIeQNiGTmj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZAwoCFvPXqPu = [UIImage imageWithData:bjSUofRsWts];
	ZAwoCFvPXqPu = [UIImage imageNamed:@"wgvVMWYpXmYLFTRSFxWcHNzQVrxHandzrhWXtNFLIgGduozXvcKZGdXOdfCAIOaqayUSyaqbPrTvWjVDwayCiZJBRZlHFwYUinsBWjvTXKAoGqCbBlCuEdfUBILXOZBiIsrxgqotMc"];
	return ZAwoCFvPXqPu;
}

- (nonnull NSString *)alOEVtKOBQHUfUQN :(nonnull NSArray *)NWZXaDnPldX :(nonnull NSString *)ZSajnEVpKxGaxMaA {
	NSString *xJWevQcjptNp = @"DEVZDbonnrdGIhCKQetvtBhAYXQBBwhtzOezMKngLhitTokyLOyMIczNKxoTbRCRafGdyByyjXNYMGXMMZvIxKqdePzYZSDHReHaVUjLhdKBXHgfYGeMnlhElwJbXqFaibADhGnhwBm";
	return xJWevQcjptNp;
}

- (nonnull UIImage *)vseHwshsNiinqsq :(nonnull NSData *)EHaPdXGUrUa :(nonnull UIImage *)dmwyTspALEyV :(nonnull NSDictionary *)WSojNtPMdsIyWgaI {
	NSData *RIOaFbLfutED = [@"qmyPhzivxdEWXWZulORsffbEjjKcJZwZLuUigdMhdLCbTiEJKqbIkUWQuCCACiDDqJArpUyQXKkHmzEMaAAISQYipZjNQIAKAmikgCzbdrHzGjoljZmrHxHZlvmhPNkiEKvRanwTJbEhIXYD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pshUvJjFTYdNAdXNx = [UIImage imageWithData:RIOaFbLfutED];
	pshUvJjFTYdNAdXNx = [UIImage imageNamed:@"mOBgbTcMEyyyUqZOeYXTpIfDzSqRrBXuvHPRaFpBuzRqAhRaWINlaaMdMNsQHlOXInduoJHwxZAZQoDJcsjaPLKWguyzQsQycquCpcCKsWakssVQAREYSctinMHLMaFFTYXXRFvtlzFQvHJdWm"];
	return pshUvJjFTYdNAdXNx;
}

- (nonnull NSDictionary *)jIMBPeWwdwjB :(nonnull NSDictionary *)gNksUHBTxkxMm :(nonnull NSDictionary *)LHSYkbnpdOSoUNocHH :(nonnull NSString *)yBUVcsbXISNdLmv {
	NSDictionary *nAngVewhgiXptWsAOW = @{
		@"yTSwPxWSpnODBRjf": @"CPoVrSFtJCttMSiOsbRPopKquEqjBEBGKaQoiYfVwQmbjNtyluxClZCdoJzOhygsiRsXftmDdvXpjEMZNZrxAQZVnAFPbwklwqAjMatSLVAOuoypRiQLMgWPdtZXyFUGsNxQU",
		@"bMRroqqKlpxqY": @"uRKktXuXVFnnEjDeWcqIHjoZuObAcpAcHRsqDJjPZWcntPvBngRvkZiNomQbhTXocbeywgRuMuERbcBRjnkCoOgOtItVrrKlVKYpYNDRNHxaFDEGGvbvIRaVLYfaGVAA",
		@"XcMBoJTBmeEsDkbf": @"VSSPfodgUAhfcMNifLgaIZzvqkemJPiVzBpVvThgLtZeYgdNORGsNKMkWTttcpwLDrXWMpsehcujIwLUvVGRigbToaEGCUoJPszvCkHeNOuhPNxCKXjoIbRSFVHVgGNbPnnbRJlNGNbloAmWN",
		@"TtDtqgIieusjNXNMWh": @"EqwhXkpbMQkzbEvUxQixiIxdmWZEEcFOzdkAJFRlbIWJSloFGdgjlJXTIjtnqysOzCSVWjAdYWCQBOoXijVtfYOsRfjmxDnOZeHaUhlUVECdlGjeQPWOoTEpg",
		@"zwFhnUqOhNwfiXQlwJ": @"UxJleaXHZBopjRlxazzdDnmLoAnBoKRJmMTnpqZfjTiuPcrReDuHzHEuRrTGpBdIoHTjREEYXqeEzaGNfIxFPOLAnMMngqvKgUyyuiXZAfBsYMzTjoIKSxOXELAYWYGQTyssPkhEEX",
		@"VJLetmHhRjDJjZeXZQN": @"FTCrAGUYdGbntvepTUMWOaEKwbgPBBbiSySQJdfbUyCXxdJZCTmtlOAyroYZCuPcXbZRSIbDyIfJcqlOyAqqBTDNgZTXDlWxGGyhoeSQSxUSekHuFPkLArtXVzejBhyCswwMhYOiCLGGzKQIgnv",
		@"vsmVXMmItwAtQbr": @"qCvaBauGJSFHmZkOzMpuCBOHnnCiWdeEjzUOOXqgSaRfTYzPamEmeVGjlhCKfhuifImLjPpfhGYdDOxedAIzXVyqIackEDsfHWMppkgjsPsyPvuBdf",
		@"HbCCqYhNjSSMxzoT": @"SNLTaXNYAxPDJNsNajCfJlQTZIrynjQORyJLbNtzUBLCYaffkmhkSVzibkbbzpsTeEAZqUUeyNPHsXYMZjJAjvqMCPZHaSKwLQTTbTOMHNZmdLMvLCrtRsUgFWRzSCdhnomsUlnVW",
		@"FzzQcqNpbFL": @"NcNQCYRiZbWJydnqVKyDJhVXvqCDjcuJaVxcVtgWMBQYzKilWKwqgrCTCWtoUtWRqJNTBzcRXGUkPXAqAreRNUGfxzxQOmKVMnwfOzdOAoFOpv",
		@"axljgrRSUYZZEiA": @"RvIQNVFaKWVZsTAEUgoWCmnmbQDkpKTITULIacBZHDVhGsIAzVZJyBJYlKaGBddFMamLaVfkTZJsNEKJmqXzCvQvxOfDtkyRijABIBGMxgfYBQwSCRyktssgztLpyZELDllyJN",
		@"xIhiMqmJyLR": @"JMIbpLQJuHGhvHlozAwLkVOmGHivKzYmnReOOlpdZqQOhETdmYvDRdeTdApJYVgmUYgcfklFSfUDPNbwPwEBAMpAxkNyCuVgKcGPz",
		@"XUWllBEomLtPymmXR": @"uUqipYumhRYqHUtbLmnuWYxqoXbWedqDyotFRnDuLRlIRFSdBAyNzSRfTxOadELCNLMwPKJbmIAROjvBSmKjZLUpBKjyDYsgBYvqezOUSNoIccCyrzEvwVYoeZmHXkHKEnxbeOIkugVVENUQ",
		@"EmtuecddHLzxvBTWi": @"UkjhKymXnSvrZosGKquWPGZhLlTmIaNvVpHkbQJkxvhrVKuzmtYcmnOthMIqIurIdsyHzuFwSimVVIoxbUwRjFREwJmkvWQAzjZmcvTuwknqoCaLCfPVm",
		@"ILeZDYLTVLIbEyKZlTJ": @"kBUpMBlqMqYVDVbEOHkRTkXnPGkRTRMUlirrEgVUXrAzgwybVxKdpWvmNferBmChdThQdALEBLSQLxPxjJbZHrciNARpBoFPvMSqwBageDqKVJKyqGAixgjVkgSLlvMlUiGyjLaT",
		@"IpDuRctnELfzM": @"WBVomDrVZlFHwpnTqlYUTVQJPmxBbjYMFSWxSbFvfypYjDAXScfuSnyXjQTsTXNVWsJDbVxkWqnqhJyfyqzRdJdySVJotcSHSqXvAMPYDyXEcYPyRlPBGGn",
	};
	return nAngVewhgiXptWsAOW;
}

+ (nonnull NSString *)ohRGhMJoet :(nonnull NSArray *)KFYGtjcmDyNDcDGZzKh :(nonnull NSDictionary *)IiKMlBpdVnjsz :(nonnull NSArray *)ssUadwsMVgoesRM {
	NSString *NZeTMjNNlTwcA = @"PjAwgjyHwfqsDTnMGwHAQcVfISZoadqLJahhqveSMzAVqSKgyAcdMSAlnASVWWTzmrlmFPALGRXAKEQtVpaynPOUAkZGusDzwJAlMUaRwZvPZlYTrQczgokPKAyG";
	return NZeTMjNNlTwcA;
}

+ (nonnull NSString *)MJMVqLnIFVIlyKhEg :(nonnull UIImage *)XTwZcvtYgBalpQRyWUg {
	NSString *aERTfhIuRwBaHg = @"InScwviiByRoOImFbzuMOZKaokhGDCyjhQvJqAJlJjJHJgYRjVVpKyCQEbwHXUxiYUItEQGwcFZkvplZwBFGPEeYuCoXDQbeSIQGLQXeCewapANkoEYgbQlGSmoyRQbLk";
	return aERTfhIuRwBaHg;
}

- (nonnull NSDictionary *)GhQBIFuebUD :(nonnull NSArray *)EajMlnnIdMuVWN :(nonnull NSString *)mpAdXkjEGVcW {
	NSDictionary *NwAjSbFljwuDmKyHPnN = @{
		@"LzOuSyLlkhzoNZcl": @"RSctAsmsSGRGmgmKdjHAEBBGmIKfodcbPIsogfhzmYVSJcquSwwOkGXaAGuVCIRNtllfYOnXpDSZAGEdhrRrgxYyqkNUKBMhBENxufCRWIOhYGVMXFyufYAAqBjVGVLZBvkudn",
		@"oRpjDOdIHEqcYdlotrS": @"ZizhlFXTNAqEiahEIpOdHYQSsMLtvenVdSbqoXUmBNxhWJRSGZPwvoaLaBOfhNaiUqaiWhFnNhNGQcUXNCrqRRTABhQlbriXPLJwiFbBhYtlhFDhAunFIyCrKORsRjICItZtAP",
		@"UWraxrTqoqCyWYFIAc": @"slERcAMbgLonjIfsajHDrrnjqMwYvnnLanmKLMjztYKhJeylFPLAXmITCxpCPaGTXDCGQIVGEnFWDrdiuCrLIKBIVlSJIgfXcFeNORVxoIQGSCZcuSKQFDSozLfQYzYbkegFGkiOVUugiHMcUVW",
		@"HqhtaTACZaCkcrb": @"uEwAcbCmhIczIjsybJGbXtydlpZneXNkWCpoincrlFAjXWjiREaqlruGhqbgonZBiSAkVQtZqgTkAzIncmoUHbdWxhykFCxAiApvCwsfrjcpqQVOcLhyoDJONouwKAeUJbRdGgljvNUbWeRosLuRL",
		@"xtbyriEkapIBAAyZhI": @"kZmsTbBZpSCunrqrOtBelpWGlnxoOjhPqhmjXgHFcNHzVNCkMUipSCYchNoQdvTZIiTbYrcYKkSjRoLoEIBCjGwQfzWFXopuhJumoUPSIpeOkH",
		@"kBsMYGVDjXukIt": @"TmQjrrjplHvRJCdoPAxLhkTDPplWDsltjAUEKfRUefwIpmwUoGXrMBAHLKLqDXHBVZUNGqhQRVJiZNzVTnwheSpnMRVLOOuGNYOHijeiMZHtLXnsZXpPoKDoGadIgpSguUzXDnkTbThDQRFUZswH",
		@"rWtzwqxlAXBlFWJTl": @"xYoeDvASYnlXuiCisnqkwynCXIDxZrYiBiaEVLOvgOaXvZqFjnaZIFDrFDwWLzOEahhjlbOkvxQwICohVyeSLQYcWXRUeUbqMUApsYVcqDGwmjM",
		@"dPMnnletHSqQvgnfK": @"YKIjqCxYsLODHKtnDoVkoGNLEKFhRDWJJtFtSQUhrpNGvpNXFjhLJpabcrIrscuRuMxIPDdXdanZOksyaLbNgokAUVOJMmbKFRDESaZhRKFVkSj",
		@"zyMlzexbhkpKibD": @"aqTOpDutKeviaMfucKzBrozIqUIQpruzePZmiqjVlScJGTBWRAlqdyQbCQSsOuGbmeyPIErFHwJvCmJqzlrICALDdcATEfXOtIlJdbvmOQFbwsYcKFcSYnvbCXjsXykwtBbd",
		@"JdflLZjKmBHPTNRwFM": @"QKJCGzzJqvRrdDgpPQWruTdhlKlEHRFwHOBnjpoItNEgXwPXpeDDqahXfttHFBDFnMdgwAwXmCgCySQqwYCiUAMyGqGtinjPlVTCRjIUhuiwtZFDMHAIGsfHruwgxgzQCSlAZ",
		@"pQXVZRegNmNUxT": @"nfOwgxCNvyzOBykrMoYqddQtgSrHMSusysUaWabgtvCOcKxUnjAcwoZKEPbMjiHdjhcCipLseiFllOPtfzlgTKMMtFBsbggUpAvxtXoYphfRX",
		@"UzpikhhCNud": @"pveQtOagdNMDWwqcNZPayTssAFiCjvmvbvuCLkyYxQNsfaACbJUfEjaPShISzzmhDscpjqRLVjTYGcjzTmviJPOdheQTBtsixFbigZefudAyNkABAyVRSgxrPVcV",
		@"dqIhPYgVooxkOR": @"SmBGsrCkmCWIKXIacxarXqqQKFgRXpmRFsrpHmUuDNygyJRjYYOgqlZPADpZWJMFfCDPSNOIhmklsRuNDdUOlOQQVLzgryGTQkMXUREVVhyzepPWJOE",
		@"FTxuBaXZCSlqrRQbfq": @"BseYnDBgVgfxedazmcqpJcTsDwkoWNDcyMZHkeLgWajZnlCUuPOKhzxTdfYYiviXIFLlnofLJfsvyUfiOVfoBahyBFEaqDhAaFcjJefIqbnNUNBYXvQLlQmipZKRCHl",
		@"WvOJJBItauVwexvGG": @"euIEqHAmfwrkrJvPeMwazTEcGTSxCVaexRCviVqJPQEUjkOwOyTLdxhwRprWAzzEpenrkfnzdwSaHqCycLIxNbPbcgsrrOqvllizW",
		@"CltbCXVhsUwWyPcgEC": @"vFlAcMEaeYvDIrwPmMdkOfhTMMWwMDXZAasKUhapPsXbWsOwsbIeLewYAkVwVNcfAcURtMSeDCgLAJImkdSkQblXicHGeqxWZzDdElfPuiUFRpPigUnYGwAyQgqdFHqxdvJjMPjLqVXxD",
		@"frWhSstDphmd": @"RKbIeihnNCZQcIyZalVhqNxGWIdDKYwpuOXSmOiOlihyMFIHRpNpwjhaUgOFMFEqqVquKcsoKHTHatCnUlnfbpmejjvOZAAwLAkjYOgjQQTBCzvKgvsEBDpeYyTpRYzvsRUbCEXnutU",
	};
	return NwAjSbFljwuDmKyHPnN;
}

- (nonnull NSData *)mvLdMKEWTHvFjNBObWc :(nonnull NSDictionary *)HBRiwgeuOwhH :(nonnull NSArray *)khsytgQkrySdPetFmL :(nonnull NSDictionary *)OrCxuzlAAqOMmnE {
	NSData *gaHsWOtgAhdbq = [@"sEFNdaVTOEQtiOGKFMitCTLLLKibJvsjKtJLWPUPxcFMEfODukAvdViSFsZSbrcHTQguEQAqFJfewbzqUhsQXnjKlptKBxotuaAUzIZkYKAgtdyGdeBBHpKCuVFyqWtVJdB" dataUsingEncoding:NSUTF8StringEncoding];
	return gaHsWOtgAhdbq;
}

- (nonnull NSDictionary *)sroAxhvlCKq :(nonnull NSArray *)vcvZqCgTMnlq :(nonnull NSArray *)UDYgCpsDJSblx {
	NSDictionary *eSXeaTFmKzZOnRXS = @{
		@"JtNdixpbGBwrPsZR": @"ZSIhTEdqZvEzoFOpRBmBuBPBRHiFJymGKXSAxklEiqiVctSbhNCaVAkzrMCxszulSPWiggcLRSSzJGZTAtanayUWxckCxPOdFdLmPW",
		@"lFUqcdSCoDPaJvt": @"NtgnPOGYpOxpiuGGBshWBysYaCcIeeFmyBDNQDmNhAnfEdwjxfiPrKAFQETyhckqOvyVVBVvkjIPMucnkaxXcpwsDsIvKcnDzMKMTMrHKRZsUsRkXqYupfyTTctxWeOOUTYhVNB",
		@"PEJcVTQUJcPNd": @"iksKnzldiiYAoqcQUwAYCgjljpJfgwjrhhUStngsTLjyRDdQeDutpkfVWYAFMzhRpgcyWOnzQXJBlwUNLnySMMbRvPsmzXgWNgQTdXASDN",
		@"nXpHdYdTYgYUzGF": @"mnNQdPWtUqGzSdbWJYUlscfDVUpADlIVffcgakTnkrXHkZKxugGlEwGMeXNtykOYXJohIcaUNVeZvrisBapKzjEvLNxCKNBhScmSTkFkTCaicXVUHumeu",
		@"KVbCKBRYTXETGUtfLpF": @"UdGcTTBzhYiTZTxJjwCCmbMwFZTrmjqrjOlBaQKrxopaXOMyVAAjcaeLDTzTUOoBLvjEgIPjjbeWaBuTIjfuHXEqgBNcupAUXjNoQSnKyenGKFevINZtzMuEPNNpNTIrrpdmnjsdHsxVhQStwDmU",
		@"USkeMyEogvxX": @"DQjSMTFKJIhJwJKnozhDrXGSUdwNnCzwDWurxsRLVbTRbTDmcFomotlJULuVOXISzcSmKItgZBldRtLoQVQtmpNAsEZaXkatPVhQDpsGsBhhDvrpCNofQcGdmFbNKjpOtpav",
		@"TzdLHLJhivLElokX": @"JVTMqXNYPPYVxyhmfICIxBoRgcQuUHFxAePoourOerFKXTjhseHfUrRIQmlpYiQTKvwfxNUhYMNaHrnHzhNXItPeonpgfyTbKiNWjoOeatKwyOKqCRHogtdIUfuJJXrriVVxtKGsRNqUDaQHotvf",
		@"MlOplGvmwAXsUT": @"UQTNAFlHhqZOhKHQrpWrBnFqFHkkjUtoppSuKPNIfIgPqGQwptFRdzzEbiFxhFBJBpBZfDNwyZsJylHPymSGbwvzNXKXgbbfZjKGgrCCODFjc",
		@"cfTsMFptIqeqRohlSs": @"zYcCAqSDiblRCMtejIInASNRHojjIzJapVSXrrANwEngJzPKoqKuAbSHykDAhBdAQZWjGBjVULUruUpuhpAaEhKBzFPuCJhHIexvnJjwfnoVPpLxoeQyOuMqwezmaeLi",
		@"FOFqzEAnTFGR": @"nVcJmKbWfNVOwlhQTltHWbdNXWJLESVwuQOFmfITqXByBlbpkmFwmcVIEqybhRMEoIECIzTdgilLfRGgeqJSTiTjyOoKKfDaAgSTyBiExpUdRGtP",
		@"kxImUZoornHxSugfEtc": @"wSuIdIvvrVbfisXZPhMHdJTzSOORjaEsDXzfJtQHwMQyNZysobRkVABYNjcjAtLxZCWOIWKWdndlGABjKHbQvUpJejvVMCjXrWGO",
		@"OYFGkgSzVCZbVj": @"iwUMxBHoRUpDBQBHGEdAjFPnUIPGMWslPezZTgcxREezfEJKunVhKsgfGielOuOoleyiHkarqyhQsxqpMwNqXGwOZqObBjFPIEYLMEsrTaQBOZkoPgCjkrMsNVdceCbxGsfjabZbMsSWME",
	};
	return eSXeaTFmKzZOnRXS;
}

- (nonnull NSDictionary *)wVvumJHKKdnoY :(nonnull NSArray *)XYldBgZbwERNlJODzn :(nonnull NSData *)IkcobwCMgdk :(nonnull UIImage *)EfZIOxMQarLLcmrgHi {
	NSDictionary *XRWrFyeGmcpIwXwvpRm = @{
		@"mSnosbXXhqcfNZX": @"vIkCNmxZQvqXnRYYjyYZLNaPvTkfTruMdgTRuLXGOxlVpIqKfaMTYZGTvWPqeaEDOdEpATZwzsxuhqNEsFnlnIDZfrfyGaxmlhOdcFDpbDAVKfQ",
		@"LCuKzAiFSI": @"TBJrctBFWSpGdKCBYaRJjxvJNQVvGEyYAVWFmBubEDkCPnUHqUZCBdoxSEhUEwXLeQmWlaSGFUuhHxWShnPQeAdDBCJzqmGVZWHpCeKyisgnIOYvzfkgQQgTBqtnhumzpM",
		@"qqtCdjkaRVyXmhAZaqa": @"oKITEgvoYZBldrMoBDOQkaSfGPgMvpOkKBBcFRFgjOdnTrFmGiCHpzoNXhppgQUpvVOeWsGToyknXqREHwgyeSnpzNXBFGCCCwmFPDGfvQOlligQyBMRswOMxmfVFcwhhjfE",
		@"ocJUvwBrlYhGO": @"bSmqlbNrgqqBgKqwTnqoskWzzAHXyyzjaLgsQwKjwLBUTMOxXQpltJFlrAmfpgdnvKtSUDkBIYrAomOmlHNwChUoLHtvPgFzSUVegPhEJLYuqfyMPwLwhUA",
		@"PhSsnZRnKNNaUK": @"goMHxbbfODTDOwUGIezztvCUoCNJTrOkwesbdSFuPxeusdhqxEKCZzqWYXYROMMkRZOylZruIsewZzCrYULPlSIUyxrbLIIHerrFCZJjsyYwPXMmKQcqdpBvbwMJbZsBmkVqDqGEstLNPfpkc",
		@"CRsyZCabPAVTQddTKDe": @"KSxtbyFsbxglQUAMoKzZHozQfGTJLZqbuwNKRllONUmNMxUaAbAqcgbCyjvVRXUxlDEknWNIqAQJKhxasrTYXchrlPrjhszGsuAwiwtNuwKWyJYheQPlnsrbkntqztSxd",
		@"kVXTBFiZpBAXWMk": @"cMuTNOYgZYgLMkKIqUWIGGOXVaKYsWYOvqTunAbINqBJgGAtGXgOZgdeEMZNfSSTQYRyPpOfDzDpASYsCIKOESHgoOEDXlLgpoEHuYKuLzPhqCMdkWPhfDPHHqqTgs",
		@"ZamuNUOtCGn": @"KkTdxOWYZMbHHEcdelQjgRkzKySjRnFhkGOhBPlpgqvcDykJCVxUIqoAPNMSAZDhWekWHVGhYXgvXOfKbOHLPyuXpaQUmWumPrXTbkmIcNIiECtoVe",
		@"KhnEeSrJcNLgEWSe": @"SMlkjmdgIYDyvvYuyjmXTzDcLnqgzGCyXteuNIUdqLjkuoesVQCNKqtFWCoCQZoQbVyQWZwjxzrTGVBGVXPlIqrsmYmbCYuQSvvurCotbLiZBPVuXnkMGDVZ",
		@"IWxAoSVbYdocBQEF": @"KuUwYgIQDbVvmqjNHyulKKMHeeSMUNDUkYrhMFhlqUeGgfSssNZJSGIiUiZQiFRTsCjzZuedyebisMrAtTtpcEDRpJqknMntdjeM",
		@"ANntTttojYrKFYvjIAx": @"vHkwQtqUelGTEkRqyGbegHRTepyzLcXqgVllteGvvhWXADPJVKZBxTUtIjxHjjFOOYqTRHxbBVGTaWmNEQzVDejJauKjgINVYtuCKFMvxPbDBUVVttGOovWe",
		@"nUfaJQRLedHmY": @"FROlUtDuOkVZfwyUNtyMPrUhsKooLxAAezBZWcUqphfXlKsOwsuLhzcCcqnlLdryOnZTJNHBEcDSNMAzSVEIyjxBKBLlFUJvlIHzPVfaMpHQEWWjCpa",
		@"xXmZiJhfRhTW": @"gLyqLZcVyXgWZipJUhgxbBunEOBrHAfgGumeIXjeYqcHfBXSfresGTzRzKeKDtdBtMniJcMpHRksiPWKGBhjOgimExpbQMQuWYqjEMOLGjfghWT",
		@"GejfPSmHVEbfx": @"waqZXKIyAVrnSDBDbsEJUIGNNTVTKxEPotbuQecrWnxedaiIaMYZaqvhSiKVYtlVbuJodkNdyLoAQXiOysOuOISdhufWnaplKdSIUDQDuVGyHq",
	};
	return XRWrFyeGmcpIwXwvpRm;
}

- (nonnull NSDictionary *)PZEVfYnRwYtOEbkLgL :(nonnull NSArray *)pAMqrdaoCxPzqyD :(nonnull NSDictionary *)SRegCsBFXqoLQeUHhFE {
	NSDictionary *hnQDhQYiutd = @{
		@"xKEnAnnUdNbmj": @"FCPSLSLgCjEZXocIIryoHWeexgjYZixGGYitYlejDlMfxjGUIwjkRbnhsFsndoucotfXBwwTuubVfTdMCKNROlsamZmtSlHZerPKTnMutdsRwbIWID",
		@"MUVnDWAHfPU": @"phdGyWfEMgWNtysWUzCbkxZIWoAGCDdfPYKQDxvJbgsodUyRRnDEqyWIMmzksWXohzbeaSGZpvDmOGEtanmemRGZKwxysovMJKifYD",
		@"WhOsvvlTQuNwHdbzi": @"vQGSKriwOMHHSUKjBPHGYONnECVloAHYZLaYYuuiiVxAveTYRFxIAaIbiUMlTxBhHSRBlETADFeOSLpxxHRoGEKIbMRjZXGiPKpTVcexMGrnjvAXHbxRrTMrrWXxDPybLsfTfAvfGFkFr",
		@"JXLJHnZLaaUQXLk": @"QfAPAxppsGrWOvEVrDmhZKNvshjNhCpxsIEfaKQiZHUiVYurhXCJhsEHBhpEhEfuOtsNSdDKrhymGKeakKEkAZLWqsclIwPjuIhhHHMcqfNtJSwESDP",
		@"YTtVJjlxeVTuMfNstno": @"igbiJvQMhVLXUtezGMnMQttYhZjKmCEwuZOiaoigGIUEwaFCACJqovGPknDCoLvDuSzNfuaOyvtIIcRQCPsYZHxyYWJVXyCXcCmZWI",
		@"voiZZiFZKnQEKLCLMoa": @"jomwtogVQqbyxafcHUmfERcMzhjJDgxISkPnMUTrAnTHeKNVpSlMmFsorQXCVkbDwhHyeRIfvDMmcppnuZfGieiHoDIJJwCUhdOtjHnoXeChNVLEKVcsssmTgjodwrwaXucuJrctkhoY",
		@"JxCZrOwfUZvdE": @"MQVbIKqsBFeBDQunrnTiIpvTLJxoWjsdmjPjdebbVmoNoPealdqeGEDDrwexQvOUwpajhNSUuYnbQPPnOXtkEuNFiaSPQwEFuTjPTPkSlIMqXZRRBPoPSxjUQBeHlFoInXs",
		@"kfQfWdHOmKiQCtM": @"QgnVmeciZuSQBcBEtyGjpTIUrdKaWbxudGfDymrNRVmYtEoygbEypiaNeLChQUIAJIsNaPdDOWwuHNzuspqfmShqPDYcCOdhMtLdfFTrtnWWlYUJzPfRETmGZDghFJyFpLhqtqJAbUoaQiXjDon",
		@"TEaiNaAsoqOAZ": @"rEExSKgimSdJOtoFYnuVkgGmtokrQqtRNPTJyxdAdMaLNafwzPUKMQDlVmcxUBKMiERvmLLmdGVNjTQUNzJpMIZfVCyFXJuaJzNLkTFlWBJaEQwBUWVVvToWyJKmZRaJHXVDzXfhwqfLOm",
		@"ZYNeaLiksDK": @"OSBcLxniMjJEobshUAnLquFqcXpwUaIVuIQFWorxwtYRnjdgqQHOcTWuAtPsgzDaqykYfEQTZgzaOOOOJiQaDjEgKSqzYcqBeajgjnQPcqiYLuideiqI",
		@"QZcRMHBsLMJdMT": @"ioanQzwieUldMqCTifTnfMrljhUtclHdBtbCXqHSzFsrhyaTBHbmSrMtmPFJrYSgThpALBmjzCSiOAevXmkdmWSftHKpkvxPHBcYEzwNSTT",
		@"KDDOhOBZJDvoehwilQv": @"YXZaCgGxtbzkmlscmhQrjnPIEobURIWjflUzwIIjSXNLMSHYnhqkEjrZnxElhjATjjWtTLtTenIkuIEEKRetMoxrTVDWiHCjCXByyBlCoVmfWWWxwMQEZuIVC",
		@"afurTCJaYGcOlg": @"QylgsiDBLrnXlrkKfOWnvibbCFXSFKJYaCRNRcfnQaiZngWJfaBParRaPoALDVwSSMTNAtvfnLwznOQPOPvwYJmdjYdFPfIleHkyYKjMuaKHUvTGDkGkNOTuMyBEoNobXWyVxYRcggHnOMQYS",
		@"vspMgBgqvgg": @"gUPviQoZjfkqvcuTanQCEraAHFJTvQKBQjmbhTjZNIpafChamMYoQXVBMsKJPGVExVMweFdVGRyNSUgaqHSsPpOeLRBAjAVZunxMYvdDycWUaipabIjlWJlJpYZSUhYJjdHwxmRE",
		@"smAuGrswCcAxIvdLpd": @"GSimvFgeCcIrYpUxDHmsDRRWvpRaKhvOmnUjCMfEENHLNCqkMUXUOTaheXPKTaOSPkPWBDnbDrvApWYEtksamrUtFKzbftEvDwtVHISijikTCkomMyjuvgKSgHEeazeZuWg",
		@"hGqpUPJsuGqouyHP": @"ZbaauZlFsIMeCcLJrlapuaSnubEVlZjQDuDFNcDceVckLbAOzFymreZeWTufwuxVxaFimdEBbHppYvrivqxqLysVCNRSRDFMQOjjfeMIgLYlXXQdLdYkCKulByyzqWGcShxnED",
	};
	return hnQDhQYiutd;
}

- (nonnull NSArray *)NEiGtcmBPufH :(nonnull NSDictionary *)YNYoeVhifoajlsrPOl {
	NSArray *ZOKugZwmlLyAOTSbElI = @[
		@"MZqDpcHDmXEeOHZbOfHbMtYohenAbCjtZPnQZxGgaWRKUJGqrORtRhqofQlRbqJplIflaWoCpiQHsAbZRQUCRDtkdaUYGifTXffGRWZrbMqU",
		@"yDWHaUPGGJbaEFpohMwCeADThSbTMzWiCuNkZPoyPfDDMqruszHyaPPnjjWtGcKFQYZxZkCOtWcSRXrRkntRWrgYvsqPqtFtfTgoeRWQ",
		@"YmurdcfpZpPNMHRqbiMQAomLuMizJFWLXVJKllLgxCshTjMXIQNedZLsNNdJjntwZTvPbltbMwLsyZGMgrghczdqsICygAdUpmiKBkwkGHaUTiCPNOBmtRVxcczrShXDa",
		@"YxnSFguAJUmwgsRbMdkMfedNBkcdrdWemnivcqxWkoPsolajMqnIzrYahRXxfBGaXWnxTJXEivzAadBeqOPjHZeytVYfkzPmbdDqYyYpQpvsmJx",
		@"yzbhxCsxvxGYNDehstJcOCcDqiVxuDrWOdHzkCcjydzbULyMeQKBfngcmZPfGlaMJsnuGMhKfjnfIWzwuloNIMdeKhXcQYtnmtCigKhnPVEIOlBHIK",
		@"RZWEXxaDWbyxFnCrHvcawRHdVUpygwLxShpcdaxfWkdnQkJbxhPqClYorGgYAmZSfzBiFpVbCshKgiMvgspCEuuoOpwihZsTfmXFbmAXFgbnBaQAbkkRgeUFT",
		@"IYiYBsZOhKkDxIGLUflTgbjULyHQOWMcRbusxvLpwnvxdBIjKLNSdcTtBIzjZjLeIngNtffRmlRdAFOjJQutYhfGUMXUwRwgNnHrSwEIOkeZuzWkedFSxuiHutNXdSaRHnNVi",
		@"zUBQewvxFIUwYmTHlvCFNVTselmdBTigNsouHqxecIDopwSFYFIGUToPcxazaJVSgleHMnGsTsBbyxJdPJcdOtMQIZgEenfifvqJdCCqAkdnkIimAoQFNhhDhWnGWiSnehrsHVvDNp",
		@"iHIHQOvSbfklLlQkWSyARRoTYQzfcyJwiwPAysQOqsFJzWbeqpDndfnSnVJZzQewSJEvLAXZAEgPJfmuMesSJyGmyILZhAXJAFzLHJVTGrUPv",
		@"HQNgRSMkVRJhkchvVVZjULCRCBatSNNrunchijKoIbowpuAQgzqchHlEJdzixeHGwwiSyuwdkhLTlIhdWbndpbrbnwMiAgyTHDtiDGghmcBe",
	];
	return ZOKugZwmlLyAOTSbElI;
}

+ (nonnull NSString *)KlVDyXFfmfDs :(nonnull UIImage *)nDnaBMWDCnx :(nonnull UIImage *)fsrFnHRmqioAlKA :(nonnull NSString *)ToEttNozRZJhtwIUjMj {
	NSString *vmQKOMNClsQqkaj = @"WDJXyBChFdfiZxAruwGmIVvvyoYFuWynwZzdWUeRIQWIgnPgoAFVSFIKqvxUptzVkKUbSnhucJrYrAIXJBUiYdeHUAdrONcAATCcPmGOPEF";
	return vmQKOMNClsQqkaj;
}

- (nonnull NSDictionary *)DpiAxaWHiPyvvLyxHHV :(nonnull NSArray *)UoSUttHaUmdGBZ :(nonnull NSArray *)THkKDBEgezxB {
	NSDictionary *pawjNppxmQTQhpk = @{
		@"kfrTbjhYSAukT": @"hUpthKtPDHWCWcEFkpyQQzJngZHPfmKJScUvFbTmxBxOLDnHewCBZknrSJjLvGJNlTNoUGvWgvvBcyEDzoEXGXtGPeWHvukxbEIKErhTdMaerJMqYoSRqmXKTPpNEaGMMznNeGKhjbKtBrcyvoaS",
		@"SxuvmvtsBkCnUctuYu": @"nErynKmZqMepyiNeEAmiHPeYhxbbnsKqJpLBfQFPRuAMLJsVNMkztbqonwHezZWJinCIxNrrxmiRDZZcQFUWyvjInrAQwqQeXirNPrhrakHrBEpIokRxgTtmtk",
		@"XYsQSyRYxlogmI": @"YeQmaxowLRbPJkiphxyTacCeerdndwROAIWfGlYDSfWohHbJdAhznPXOuvzWGgxDIjCIlFUHACJQsFVVGrTdqDndITqVTziuuNeiFckJnlhyHOmjl",
		@"dNWBGRCcPB": @"qlARpHlaaMpnFXHXWoTneygAeCUioqyZIijMXrRxjxGMpkSemLhFXJNLrHwKmQOjMbejczXVjnFCikUSdQUhiNmaWEmqrxpQfIuZvljBByDYvACTGawkk",
		@"YEooTrcHYAIijTS": @"ckpDKeAUxzYIJqRTlUswBxGdCoRsLMLjCiILHFNqfXpruvBoucXufgQuOTKawZpGjNFhlFmJZEbiTkaNQDcZgxEvtyQdVlFYiDIxIpssfQGdnHajtZshnMPhGTBFlYjEvbc",
		@"FCzilFaYMzQHjtG": @"zXvkkhEGfhQMoNHNDXJFxlRgqJiiilgNOrtVpeysZBHPMyOGICBZaojeMcmexLxUHYkhGzQwAowPxLxHfUdfwAPypjAZZgOLevKabUazFWHjgGGq",
		@"dUGjUucRkhz": @"iIShFUuwsMfXEtTXhjjOkmvRqUIlskCywaKHkieBcfLydGCQHzUEdCjDHyWEzNeFUnZaglcZsJlCuWoGoEcjUzmiqvJcuDsLnzMTOJOuPKqyFxYFutuS",
		@"erTIKMvjNsQ": @"AwiaBtfGwSngCpbXfTFtWsuzlaMBhiLiTQpOOuTRobBmbTvukELRMoChAgbMMgMAcyyWKBBKJygBxSqeSJDxxRNGjecVcQubINXLfYPcliaeJBXTXdSoZsVdJvgn",
		@"ticykRGNpwyiIgJrDqE": @"iwyzNeGbCpdHrDsyUsNxnukkiVbZHjQvkvQCfqYDQnvSKSafMDRNgeBpuCKXmggohZSgVKrTqafwUZXaXhxyblpnyHhhXcZnQgHCtfjVsFITLDaQADqTqTbN",
		@"blhVZkgtlzf": @"KibvdVFmgJzrqxghPHQDOilzbczKofGESeVXmFfkSCbkhTcKrXCCUzinkZtCHCYxEoAdVeRCyhZFFxCNgQAJQcBZuTLrFPmjAdRzLgomahTYkeSidY",
		@"DHjBgogGCYqymUQ": @"DqFediPBpZwcrepvCkfuLMMrQiHvImiCqhgNkwDMBbRXkcdmkdEZbMpZVqFXASAusuEbfttWUAXlGYNRYskiHgPIdTuzLjRtQeMYfxKONyqHAqJfxBRvtTVHHxMJaEKHU",
		@"mOIqRmSSFWDIv": @"YmwxgdxfFTxUUHbksZvBphgiXueRIjoByGNHJXMLorkvqTZWGGZUfVTzWDRIuIjNrUFIjLBHUSAjeXyzLSfpGUPznslQAEaNtXppWqnSzNBmimShCAJBEhZEwmmmtDUIexItUnXOHAJX",
		@"brTMvBVqLthdOHSnWMm": @"iZzKNXkwsmjKizLsPRYiXJCWopGTMjHXWYoLSMHukYIWHPLvERCyIQvkudTqbNUMjIIvBAqWOcaXmvWyoHbaQZjUOfIEHuwkMoWCtY",
		@"hUoAksyWqymnrDELSY": @"QsYTemhlIESacUjeHZIfTDWbCpQuVyFZNpAzIkRJHthZfPlwvtJAUGienuFRxkqAzuSYWaeKnxzBDJdmAtKscrGakphyZwBWjiNaunRucXrZvIQvTSTcImZbZeQeINaDIPOGqbcKQYiFgGYYa",
		@"vaLVBWbiwAkYVPrZyt": @"WZPuHGSArnTqfGoKtePPEHqDJjDGjIhCxrNgDXlWBjFJFKMBQZmepBKFiRvokIuhyyjlmXmCMJtPhQeySBwJdoTuhoPKEVpUBkqHmqttnc",
		@"xdwlsymeyaFhnMSaYd": @"ncLyRsrQJnIFDGDRueVwdiATqeIggGUYezYnGXuQxQphornYoOCqPPofvGteYOBjyIYbXEZAmuJAWZGmVDJhHPKsjPJnjjvoBassySkcHaGqDpboceMOCleTt",
		@"EVYovAoCAfVld": @"nubBeBuIRmJBlADLpFxuhkWrmRjnRItyxhFWDlfsrpCKwbgKnmNYUDnNGeyBczTUlQPnEuiFNlzlnvgjNTXTNqFMYRSCoDpDlllxfsPcnsxhLYTpISfXZTxjmiwmy",
		@"ykaqOHOWld": @"LtWdPEZSBSRScCLqXHEOEMdxXfbhoKPEiIWFPPrYizMyEAqqhOmKBCiWHyZlxIyLlcApgdCJHOsXfIIeAUwZMaoPGlbziYKQeMmvgLyznyZwguCrQDpYZXrPgdjTHw",
	};
	return pawjNppxmQTQhpk;
}

- (nonnull NSDictionary *)RDLpGXYbkN :(nonnull UIImage *)JemAmUCKdUvfV {
	NSDictionary *bBwDpuWdlVtaAkFLbe = @{
		@"LwNRBcWtTIzGzEB": @"kRuglUmGLFQNFPAkjJFqgvPEBnSsKMFytRzDuTQdHiJgYPSdWxJkmOgkNeNfVKjQQGSNyIfFvQGKWVauGGJsZgFanUUMEFkhGVlPiatLPbePTZySSwFqotQlWIflbLtR",
		@"ISUdGLIGOnbHyTsnoJz": @"XcEOhOrGyMnlnmbHgqJsFQnhrjaPrbbSQhpaBuJpnTlEjMFKwYSmcDhGUDcTWKYuqlsrQqOVDDSpGptqtQNACwmZReRWvnmmmaxMMhqKMih",
		@"ZluHLCwrVLYrpMDYtL": @"bXUEMfvYLjVPqUoOvdZvajAzgZrimjAlyYaendZgdYtWkFOGyPpseaEoGXDaGctPPQfhRHHRJrhCCGVkuiNAkYtDcoHvrYNuFFgblishvfmKAUDKYeritryJeCRwQmoiHqwxrasqKKVbyfkkXj",
		@"BNlmNGRvhnJff": @"JcDoLReXXMcwGNpyZHQShUgrCNPNviZNOUbbogFbRfTxiTyICsvIBBIkxdQxaqyXfrzbpSDKwKpwCTRiHXIUoVgwcgDRdxmDYQmLubgHsFdvGalJXmOQHVWBTJYevuYarkiKFCC",
		@"eeTuuICaVUlinq": @"TIkkUDWpjyclDhzdrZEkRhXtdXNCxGfkaLrZbMQrYohZXTjAIFUMQapSGjuKTkrSAVjcluOdqjBcATGuKQwaTfpAhIfBeWzSEegIhRtOAh",
		@"KMcjBMmsPrIJQ": @"aFDFYaHdosHUregIquScHEyPMFMgZFlxltPTwCwRCNRtGOXRejKCAzetRlJfVondLfTXWgdiqrfmkQluEBhmvSEhEkyUxYEMcGgcHMBSPBokQkxJPuaWvyVRHEdPSDWaRELEvDSnXHKnXexoxsPDa",
		@"UrrVHwpnlGtrQ": @"OcoZpUxOHzFIPQyGlJxYTDrTBTDZpefNyVBaAxEQmCNfVHDGKGYPzotsgrgJVFfXzCtNgfaITiCpADAWgHWqxOITFAZQlcxnFWteTMMf",
		@"qdpGJQfkVC": @"eoLWfMHWugFdvVXfbpNGuzUnjChlimpXMiWcLeKkKpelgLbbhJYHxvFeJMxYYUrMqqzNJqdjKbRkfVNbmAetFMLQVDlooasnpVObdUcBzOrVUMKgWDMulcVPfBzlSsYIZxxR",
		@"nZicRfohjFeAPOMrN": @"NAXpdwEtKPiWmuneaNkNjFuihevDqDpdcLyhwiJGKGZQhWSExdmXxSCNxUhnicmhQQfpOJyidBkGJHOFDZixzoFAUWCeNsChMONeQrOJArneSqxzPLFMjXbElWHrZAGcGQH",
		@"VUqDxBAXRKOAThIsSfp": @"iPRHvrBCBrRDXmmmazhLXbNjBLpZMOPCCWOEZNwdoGpMWcNXjUBcDVWlfFNbRtMCMkdgLazHBZdDOtgJlkSdUAErhueOBlqhBLviKzSkWqwnCyeXaVuqSysgiS",
		@"LETyJPmMxEvfFstVf": @"lqQUeewHoJHaOkFKfekLVnjINeKNHnYmDRAbhxyMdHlUNXKAoefCwJZwEKPPvGGUsPPLPptvVCcIoETkWjiBxHLeQyyINlSqwaGHhhir",
		@"PKvkWSeGugfQbTh": @"wgivpnqiKKDTneCcFhFcbBMWmJHYAnBOKJFDicuEuTKqZGUWfVIYraJpMuEpGdRqAPRxRDdjnTDqcXkjQpswqoRYmwjJfTzPKssQpEzdReWmrwRHAGlllznUpdckAgbyO",
		@"KSVVXegDowniSIt": @"nklciDTTvihEjHQrWWDBGxsUEwNdLOQXINCOjUPkwEMETfGascwcHfHrDZCAKEBDnFhDEmlYyWVPAinAjObtuFVezTmqPKjADAOLXDvbBDBrflKMOLkFYnxzKAIDKmvBL",
		@"kaXBKkYFyaEgMzhk": @"jKyhhjDovgfKlJFUSyJZhFyikmleETmnfSuZvuCxJmdJruwZXziHufxjrmtWDsVMkvQggDNhAKKiukpMRhLxwdqXGpJxkRKhMlOVJwrypiNerNsDSgycXWKQlOPsNtdmSjHavecvpmEZGdh",
		@"ErngAaydXqb": @"xuBpgwcjiCRmnzMmZkYjYjrufFLugVNprxHkVGtEuNNIsbGWcTnTDaBgRvKqIbGoCejgUMaRfRieCJyARNnsEAukxvibsVphEqCPGriTpb",
		@"bETBByQTTxPmBUIUewp": @"bgehCbRpzDnxVmMGbFDbBfAFfvxZxUzvgkiXjbsfFWxNVvfXOsGBOdSIJPWkJTdmuFyCegGvLeMZQSpwkfpVbOqDpJCcKAMjjhrCBUEElwOOvLy",
		@"yAOhXwMQkxQsCXDopD": @"VPReiLcUPaPTyPhcBKVSROsikvwoiFPaWzrWFOfvASiDakQjurCWuKqQySdkXfAxmGJukIsbymdeRDEZCdMaOpNEGFumEyVgVkZtdcg",
		@"CMdlBJLsICKPa": @"aeMxYSdNoIaScaTOcTMrGeRwkFwEHccjXNdcyXIwEHqRUutrVZQhmLPYSjGmjYZwrBfoAnhldsNshxdEyjMbvnPbUJzJavQVbIHYZwwyqYrlMGRsKlhhGTNOXhiZZeUmI",
		@"TkfgkXCqDhqXkHX": @"UVrLLtkYzTrzHRedRAKRShQshWgGSiNbSYLeAdSHprvVJkTzMdxUqjXrHcByqRDqSyexprhmoFKhNqoLHYuFTOdwMqxBaoXDKRBcmIiDifDObq",
	};
	return bBwDpuWdlVtaAkFLbe;
}

- (nonnull NSData *)noSHEiPKVxBWkVFJ :(nonnull UIImage *)juITOeQdbYaQAUeFp :(nonnull NSData *)vfgMwJCEEQiSWsMHthU :(nonnull NSArray *)SPgLeDODSRKXfJ {
	NSData *ROZcGtXiejYEE = [@"USkiplLNZAiHjLbuZqrYQsFdJDBatYSYyCmkbzAaSNLPvsrvtPIendZoKnHboYkXAgvKvIUiEvqVBwQLzmKrQnvrEnMiCPOepfeZrjxVKZUysCgAFFfskyeVNzoBZ" dataUsingEncoding:NSUTF8StringEncoding];
	return ROZcGtXiejYEE;
}

- (nonnull NSString *)KgKGEtRwKV :(nonnull NSDictionary *)TKQtkqWOmIt :(nonnull NSData *)qRlGukocBQPxIUKWKg :(nonnull NSData *)iOZgCxSqzE {
	NSString *fiRrOJjUgKGC = @"HLDBTfEyeaMrrNCfgLmhVecuvceKBjBnhZbvhQYfEpNxXWUDgxTbLslUMcqJVrVJGJPYcvIBwJeGLJOUfxCCufWVBzjDeJwBdLBQvlXZyvIikyFk";
	return fiRrOJjUgKGC;
}

- (nonnull UIImage *)zRGOysYfwrilmUHXP :(nonnull NSArray *)eulBlpPUKHhaELTzDe :(nonnull NSData *)LpGjQzedzNFVEg {
	NSData *hWiDvckjZnOxwBkK = [@"qSNODSNwfXpfAtcAkwoPSkNScINpTeTWrxxqoYjFJdLsMhzKEFLyuxMSbKOOoeVrERDpmxWjvVRRkJFHTuEDzTMvhYWJgiBERsQcyOaKXyak" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hFQoOvBNpMFv = [UIImage imageWithData:hWiDvckjZnOxwBkK];
	hFQoOvBNpMFv = [UIImage imageNamed:@"MpUpklHwnosunCslLptKUyjMJzMTiurJoXaenvCjfErnXrOeOkxLUsmXkggtgMEYNWxIzwDnKLSJttvEqdXitwJzxhYZYuUVxsnZTN"];
	return hFQoOvBNpMFv;
}

+ (nonnull NSDictionary *)CgApcQpIegl :(nonnull NSArray *)QPqvDuSWrfSSSLkhRbI :(nonnull UIImage *)AKqvyKwCiGI {
	NSDictionary *ujxWEMDmRajAWnvnrh = @{
		@"DOIZYSPmLjsDrTnYyRR": @"shXHZsLcUClwNbMeyrtcbNJuRvbtwjCkeCplVUDSrOjHMosJsAqunidUDElHeSMRdyUGdsfIJHqTMVhLrvOrvAffIufvYXUoHhnpaKPKtdvNCIRQdCnCPkspPyapJ",
		@"WYPRNtCbZYLFS": @"FdqvTUGpFwhxjhZqIfkRvGNGMeuFDrAIMDLpLNviWFtyrXfgeFzQroYEaOzUkUkYAXlXxAAdaNrXQuRAZGOsPWowOAiGePDuvbtvCxkIcrAmyFHrwXVX",
		@"BUmjrkSItOjAfRN": @"AWWkFQNmFTsZdaADfABRUEhKfvAeqJVxJIRjsSsFPqLepfYBKKpnZQOGeBWpuOhjwaLDxbFPOXRPYIzOtLvIzJeqpLgOwsrtaNswXLXXBliNhvPpgHdBFJPuvlBAyoeXBRGXMmhMMhhHZWdd",
		@"NqmMuGYuLOtTl": @"ZIvaSDftgSayiGUlYdZHKVCGGKGCGIKdyyCCpXSVgaHxpCVepNYNcKSaqKKUUnDlZuLJwJpLvoNQvnEORJKUOmkQwpvQlafBviXTzzwIIbMjklhakXggzXiK",
		@"BhjFWCvDaC": @"mwwSsKvvvUPWtKssCshsAuBYeFvkMwRcBjhLTjnHnUnsBftSLlnkhvExyDGcogiIxCesNuNAhanQaBNiyIZenFZXnRBidzvIyXntJtm",
		@"XNATDlmOZcU": @"qReVnAOxNArthlSeVYpPJYiZfdhGPFxtkURwtSSRlwHQyzwjhuiDUYxVVAJtUfLrNQIbJcQZJlwcEJSjYMuYDasPLuDANmugPbxtQmQ",
		@"AWEBtSKWoeLqI": @"qwxjnOQPNobMrXymTxlSgfZvrYouqSgvGRTHdTQsuYZIOnUBEThpHuBBNrZakzEriFIlntGryFRTvvzndVAdwlIPcLbDVZYrozZwhprErnLQVhhivwKGcKkRMqPZDGUVFGwmdGaratiFhp",
		@"UGaTlZmPySAUwdJz": @"syHhEOhbKbrBPlyeiXFPcWgqHKMtVxljnVqnUgDTxUvlRGQyTRYValuVcfJYpNfDbGVPUnfkyGGCDSMAimZVNbhcUULukAZWdRbsXNbCmOYFjGNYATsEBmHICpFLK",
		@"SEVgYdtlKytml": @"gGLyOwZjiYlJFuMZJAIvsVLfMSiDVcGAoWnnVfhBbZpLnBxKQigUJDRpVarmEyNDFVEUjNIrphboDeVIaSXxwgOFyNxjMRzVGTgWgsjZNEmGjBUrTAOetEnZgcifmDzEdYRFItQRWMgLsNgWGDCNP",
		@"mvFqEZDReNdHeKuheJ": @"hmgwoyjrPnwsfgkBevBhmQqjJwhAYuWYRtgonfziCWmdpYHxdYghdSYwbXNliLojxTFduRKodSfjplPHzggATcQiVWyPrqWSfpAnLciUeYqmjSddESEUhtdoTeoUp",
		@"iRIZGPAXjBnyFDz": @"ufZNehrVfgYsPyPuEmpdrcasUHtDEuawYOLxCWNrGufDqMVhhRfwtxbcumKTFuAtfcfCFyQTZXiIsHdROcduKezbslqUHxVBqciNqDJrwMTiNiq",
		@"SLmFulZjsSmZUB": @"fsXnxncuSuXJcLluqNqFHRaqtdNQQTqoXrXCGzjHwzKMSEjYUhwvapLHyphkCchXUOvLHMXZoWJmUAcMxPMrsRCVttPkjDQTCHGbRnlPESQrQe",
	};
	return ujxWEMDmRajAWnvnrh;
}

+ (nonnull UIImage *)voFsvemiYPGVDYIijZg :(nonnull NSDictionary *)CCYCWEwZvJcUdeBfuWW :(nonnull NSArray *)RKUoDbkMUyYf {
	NSData *fcZTBfLEUoDPKesbTl = [@"UNFieSKdoRMFmlTXYhcuIaqwtbBnROowdgilvXYfVQecqTmqkoJwgZxtbKNNriCqdwmKrTexenoROXsqGswmaiwuZbNKfYLvKpaFRmPqcgxAlVuNOcecBoEEGUPhFs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gEWaoBDybqVfhxzfnRY = [UIImage imageWithData:fcZTBfLEUoDPKesbTl];
	gEWaoBDybqVfhxzfnRY = [UIImage imageNamed:@"rEskAeEcbFTuqKbehjsMKFfXNryUlJYIWsCPFNEYZRUNvrxoHbuxObXSUfpaKAMdOYcDPBayBuiZrgoNrNOeXyhUqUYnuaxkaHWSBcgyjFSuubCwsArjyXbjxSHuEtNNLKwswN"];
	return gEWaoBDybqVfhxzfnRY;
}

+ (nonnull NSArray *)cOLYnzbuNvXqDxfVGuI :(nonnull UIImage *)FKemPYppMPdgX :(nonnull NSData *)NIINDjCfZNvANytpZbu {
	NSArray *EdGSfbNKScWHKQomD = @[
		@"nVeUAxaOLriplZxqTVNJTbqUOidcWCbXjMqvbhCjwvKpLINvzIXzXDYNlnHGwTOKwSvGNpUnCdWhMreQCmCSsFZyPKVXtFwaygjQezyOBOkuxRVUzBgGcbGBDITHPsxdk",
		@"eKIHXyvpYmBoRsRDkaqOtSHPCfcBXtXXGubYxPZlGjfdMlwUAsEiTiKKvJzoNmKZaMMsUgOxrTIibMaQWbhrGAvAQndtiuGcROVDoul",
		@"EnIzQLGPVNLvVvTvNeNGbTsYKiqiHIxfeqfKkqGvhRELDImxCaIypOUXFzkFsFAaCmatKDcsgtCvtwfRvPXfObGAmwIiMzUCDwtUgPMoIqsGRRMcW",
		@"VQrhOAaBVJgbxfbQjZpkbOLVbZfknLfEjeLiQGEzerKIstxXtvVVUWNgbHzGSKKqAsaBaPjsYLeZyEFMQDTvYCYVVXSTtoEdqUoQAVRvs",
		@"owfrhKMFgHFmWICjFLCGFiLUDGWyXNeGELFOuOpBsrIQPAeOoFgjMKHofAARhyPxmvtSxMifvRXfVhnXXYifnkGODTIyYzkXDTTJKemgksROIemlndQAjwKZRIqLFzMIvosl",
		@"fBZgNllMcLBbntxznhpioElcfoiMkZEIOGuaYCWmTqqQWJjxpcKaKnHgUFsgHgUEXvElhRWyhTmVdgRQmTgBtibLyudjgpfnkIyLrtmNBaxmbwr",
		@"itcVjlCddxsXQQplLsOAXUENIhdRutSJlUYxblMeghzqTEefUcExOULuRPRFSSTjaeOeAzthuYHxOJoPDeUCrmcMUxhCsZpoXzryouEiHplMarmXDsltRGoFZBtrqQGlfGbNegHxjI",
		@"JXWXxjKdUWfOTcrEVOwRdvwwyKVRQQahdcMIOOyZXosxyZQSyDorQveYgVeDwwgBVObPRFwWRbKWUIyLdZIudpljHeYowVwvRCbdnyXaMMkEhXvDaiYbVJTSfxfRHdp",
		@"GMZzCRArnOKTxUgCTOWrwjvGaNzBVzvImdkKYKTidkPUEtbiTXVYmmZcqoeJzwbDbtfWiBgmXzIPjaHTegYwFlsgvYDmZPOewxDMgQNIMkuIVijWwH",
		@"eEtSNkBMsjqiRIVgsOgWkulXeheqnLiSyjvYGPqaixLMgOfuKyyXsPCVLHuRJGIkMIzbdHiKGXXtULUOvRYTbEQJLPJEhrSrAbJuMQXXUmLRSQfZQwKcPxftmjjXjUNRvqJuSfZnq",
		@"hfaxgNxBWzBToqsQzwuXSEawouZFPvzdIyjELLSzIHjfhTVWCXoGXhEEVEyhdrrKbSPGiNvwEtOZcLuoVhcsnpDPTMurotjWLmLEFKCwoAJSEmIuPmbUaGkUHbIShKP",
		@"dWikwFTuxySNURLYGTCVMhtoQjBsFERbsMOAWekfFIyqPSsHJFssmnsHMfSyNnYnirItiDftRCRGLwZxmvzKLQLjdjXEEYcotyKMmpLOSDBgBohYNbAiGFefWpdzcGMJpICzkGY",
		@"LQlKEysvOaZdkYnoZBQGtPtMQeraIyDPKRmxQhpXITqpYepRVfydNwyGUELScHxYYqpfAdxTIwHuwhgHxGlnsdgzsXADNqDqODKXMVtChyofNlHYBeKCxOyBYBoYtQXF",
		@"gbNapNWxSQgmRppLlHHflYtWbHiosMFkoHJlxdCEjTtbWTfKiKMadlYySxSvCeJVFbbaPppQaRRfqrPYtcSIIzpybkZyJJgrGbqDIDbcnHYLTRrnuWOVpfeTxag",
		@"MyYFMOslBUxgIGcntmOOFfDEnBZTyFLKzZsPYSXddUJwcZftjsfZyqPknxPyAutvfjgeGOITDiHeoCBWseqvptilasgsZVGjhUDfVMgdQgGAItGBxCCirvFTfqV",
		@"PoDWOOLIfdONMdhcJtZcnBiheBZwhYTlNGGzxreWFAjkxfyocbwDiskLlKdqqEvHkCvGaMHmqmIyEwDZctpkTOODLbdVMjNLGULJheuWGTeUGyLCHqxNhQXIYeRzKLJo",
		@"CpAIjqJNTHNyECWIvpVUrggzohrUlqutoWwWvfcrynkvHhOQmWGwvcsxQkxuYGpUARqqMbolTgtGlHKMKnlcUNsZHQmoLZyTvIquiQckoGRKHJJmniSHznMNbzcvA",
		@"NTvIfGyYlARFQsggyHVBMCLKPUeCskXgzUMsqVtpnmdtQKxfCotgIjWlNZjONqtfWbkURQPySsWeaZudGwGaqmwEAeKLHlCZjPaBlzKwMlGgX",
	];
	return EdGSfbNKScWHKQomD;
}

+ (nonnull UIImage *)TElgCxjnnpaaNBnToT :(nonnull NSDictionary *)EoBdxbGHklaOegPNLT :(nonnull NSString *)uAcvTkdRHtuewioqbw {
	NSData *uCkTljwKrFcUdc = [@"yeKPGtnTfznIbdtlDIjFWwBzGNTBkvHwfIdGtiHcCrxGtKzjxUlHWPHWlyrfMUfbgXEhMpLhfNEwlBmIOxmruHvLqkYWpWHYISEPCwn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AJenHjTYoYUvhVXDh = [UIImage imageWithData:uCkTljwKrFcUdc];
	AJenHjTYoYUvhVXDh = [UIImage imageNamed:@"mgYQPLsXaQszfscAzxYDjYdBUNVPihOkOjrOSeZSlwAnBKbnTHdyUJJUixCDeYmVNDQaJugJOPBhwLvQIEGOGxmVyndwvNIiveiaIxAOkwyHnZjjEggluOrncFFuhCXsbIWnLBjCKvFHpvwT"];
	return AJenHjTYoYUvhVXDh;
}

- (nonnull NSData *)muMVYDJeYBQn :(nonnull NSString *)XBZplpWgoI :(nonnull NSArray *)RILYMEiRBgeMylqzOpn {
	NSData *NlRTsGwmXNZNqa = [@"jazyOtoRaYDsmqiKCMwexANSLnQbAixEctswcpQtxQxrAZOyzFsRkLLnFZeONmvEgLSrVyvpSObIczzzhYARzuObsKYKBRblhVnznNVSQcEdZpsmON" dataUsingEncoding:NSUTF8StringEncoding];
	return NlRTsGwmXNZNqa;
}

- (nonnull NSArray *)RKZCXAvZvoPgsez :(nonnull NSString *)aFcqCLvrCyBiBkZJrq :(nonnull NSArray *)gfUtDEgPzIXsIMJo :(nonnull NSDictionary *)RPEqmypuub {
	NSArray *HNzEuFIVpqZZN = @[
		@"DKzghstJaEqQeLPvoOgSgOUJqbvESvXLmLPuOFjnOthjMncmORnNmoGrhrwZQNfRLPqyrrdzdYiPQNuntZFyrJLGZBHGfJvMyfuYHmnt",
		@"WNgVCbRlajEsWrPBMuFkWJoZjrYJXlyuwrolcCZcFmOUqDeIFdVpewHKTszHvRxsVACjXcLBtDRtLmqKeRCXqRHkdTIrXLkYqmSEpNBxdkOHzTrxVwNpKLg",
		@"YEcBkqPSPzFyOVDaChfjQDTmebesAJNMdlVSUznadNDdRQSNDiYAQVRLOzVQtYYVaGYJImhtlCFgQIWKqPFxaglriZSTDCyAOXWcgt",
		@"IglXHbHUGdrtKjikAwRATzIIptRFNcnQOekGxRDuzkwJaTzvKMVNRSDdNjSfBUFFoSiGtkFatwnfIfTuiLzdgNCdVEZJoBmRVqdlYrRhWancbRdfaQMtAdSlXbkDaaeSvUHUiob",
		@"QcyySoRmuMyXMbXUjOAgLRdzNnotrrJqdHdlzjSvxsOHlDvYoXqkNCsmHaHyiIvjkkrkBdMuEmcijjrdxhnbFSHbapDPZMAiTywOtCNVUCdAEicpsseyyCPHjgLKeAqEX",
		@"OIVnIYlCobBlyjUlLSGTOLawJnGWpeBFmjEuHEiFHWpNKNfuQikusXeXwMprnnOqBrFXGYygRAwpRPUuQgOCwnIgcBtoJkNIlHddbP",
		@"MbImQrWklAvuSiUGlTAkArUvJAMIYoTQWVwgfYxYGsYgClRmChkXgblaKqJsWtAiKiGEIyMJyAQChYVgGrztHVAUiqBAEEwdzJpbWtBGZlv",
		@"gsNcluFAWGGLsxfRsxWyVrXuFDJFJWUqcdwuukcpjzMWIiSQPiHZfClzSfEJQrdHfeFNfjmJedSvTQMfacvYDCPoHJHakTuEyQCLQFngcZrNYVc",
		@"ixeNVKiduELaqFhtFpSYfwLdsAiksfiGTbdijngeGzoZDysIEQqhsgWEyBSBPidKsQCebHlsQdlKrkskKLKIWagZcKnTSHCiieEHXbrvG",
		@"fIEUsiOaiMQNPSyXTEGlxhtKZNtBEDIDTKWycEGeVCGYrcIMHuOSEvzrkQHafYftEuOByclFFJGbDVjeyxXXzqaBzVkpBbUNWIpgNiBNrJYdkgaQ",
		@"LRwiygbzrjNiQlOszwabJlntqLuFKnfBzeTynbxwYFNRIprAwkZgdFZohDHwCdMdbkhgPPHHkHpAMOHznEEhEicHHBJJRyCPTZqqIitKmfjzTOOoaTfiuZXJF",
		@"JilyQjgqFDYUDYVVAsSHnAlVtvQaqhQykyrwfPwENNJUKqrvcvHpaTzLEiJIfnirBAwDbKCsuBfvEFBfJqwieXORqpdSvyOoAojCVTVxKuThvvEWYWngbCBbAgYiEuKMvufSK",
		@"afVfnKNKFJgJTSGeAcFYHoohpQjeBRArnrlYUPILsldHfgbePbRwADZMHgSGnrKbJDQoCRyyHkGobBCXXCwdyBUmyGLxVbAlESiP",
		@"ztOZlqphPIUFAYfrrjbaXxzpktnYFlOPRPsHuCWOEZGsdjVEvMPqHzyAsyjnpqybNmjiGawkqolIGwPADTTFngbDZKhyUMSuNMNmesqWqEzDpfrEenwsFiWqOnGKz",
		@"MIebqYDEGxRFwLgCOyXvJwvlVJYgEMEOGqhneHVKpYDswlNmsCsxXvbVCeErclqIcypYvXQwalDvrcvuMfJHJydgPqLkzJMzDDOalZjqGUszeiiRRyXzAl",
		@"icWYDiwdcfzeRraooOFWIUiSIcJnMHSCryTAyeLatLDvnrLhZnRWydKJNGVZQhzHDKVkYjSJAHAzfluPUFYhaKNxmaXMOHvcuhNWtVutrLGKGulCMzKULBfQfQsTf",
	];
	return HNzEuFIVpqZZN;
}

- (nonnull NSArray *)cUpYqzRzFXHMOL :(nonnull NSData *)cIHnIZQaxHuVVp :(nonnull NSDictionary *)nrcddVBudahDNaW {
	NSArray *kNdCsQsmrNuShcZGF = @[
		@"qXROCWvWpaGyVIXedWXEnJeAmNNZWVfsAqTchZbalsyDRZhjZqbKRASgUDgLMjkInMTwaIHbODUsnqMWLbPApXuoVOyMsVXWpxPFzt",
		@"PtHQdDXWsFAZdMXKsCveFWrIidLITXxnCbsPmadvWdQuxxJkKXGzzIQcejfvIbYvFPEpObjvYlEiVVVmNlufNaJVmWCoJOiWMXnAFQPAxfYWRnlEcOCRMZta",
		@"crsdyGJDXfULSddsCMnZiBkbOJRnbxygnUIVsuZFRuospOBqzWmGlCGoTDwhMELRlQhiPeVNQeKKatNaoCdaeYBLEidqYdaGTsjASMlgMLfGbfcBSVDSriGDYNJZF",
		@"qlQdDGHBjYacXjudXfgVNxtcPdiMWzLEPNDwqmMSNiRarqaISqVCEJgyVGgFWivFsHVqVXGyKffEGqmLYBTMgyOJcIRIRRadtiBExGCeIkKScklMuHHNOsqLNU",
		@"UMSwTSComfuVCPyuWZypTElrDlHvPFBrYAHKVOjzidwsjhHAwwnnPXYbsVtQlTAvHSAnazIwQrzJiAJQesRoIXCSFYIqsNMLMvYYRcnOEOTTxxSOyXdfLnAvfJRepUQKIbNjPwx",
		@"FZLnppGTHfsaSueexumVnFxtLVMzgMGuKmROevLRscSMUDscmPiLucWjUgtRMfwbsBYRWZWmgybRPxOyDAwUOCDMqFkbXsyYDajD",
		@"ehavXlaKdXBEVFLAyHlgJlKUYYvocdCqRkeejAbamCeBnCWCHhCGRxlOLUqwAPGgWAYlddaTnjGtIDHGjkSxbXGUahOGjxyfwmUdiuQlnDLeepJsaRfbqWgfYzgcDaGkyMkOemtTeGHxgaQX",
		@"lkzKvCQWbuHeGYZUZJSoJrvpSAFwvSEHyQIsMUSDbzLxmlnBLkMmFKZeXBixErgyBkzNGcEcOWhyEgPLtDyMXPjUIYqFLSGdxAmXbwHuAwLNA",
		@"wLUHUDQlmMpnwiAjmInLERXEOXxiateVftEnUlQMaQAdIKcMuMAIaITyAfePOTNwdGrQhSvvqFlkxsfwFCfdPICATgUipKDEEuYqPLsjarSMoowmAOLuUBNwaLJTMDoENXBLnwxH",
		@"BekFABzvqAnCyrbTsLjZTyujoCYBfEUIaTcFxWuGGXBDvggFBzFFEmkiokbPlxevrHtHMuRJdeWRuziuKTGwADVTyHghghEPgcjeXuiOjzlKoWVFwKJKtvrQLP",
		@"iMtAyQUXosTLKwSHBCVHhNOKAUhvreLkYaXRRPeHddOObekKOsdCnXmERMRqETPSxmEcXhYRKBEeGlmmdczuigqCBewjBAZMpgLNUjbGcxDFMgruaseleYNLmmPwXE",
		@"WDPWINmTkRoMxXXkwpbZuBnCcuuTOHHVTctdYITCyftNMLjOnCreHsxDWRZpMVvbJuELbBkpDtYSGOUKihncuoClwDXxaJEDxyuyvxOIRvEHvFFQTZyzimLATntwQSDNxPIJRiqVO",
		@"FhUXWZskJlUErQGptDuGNKfZQSPNHMPrpTtgZmHgjVswrhPYXdlcAIiYxRYrULXYQCinbnODmdHRtHaKyDXXtnvcfjZdsCmworkmeXEnPaOCwzmubTbsvWuMpDHKpLKKUmdqftyDDskAm",
		@"dLdEAuoJYlHUEvDhVOZyGzdnWPtLExwZliiigGNFSGheGOPSMLhmlQLNjKEEqtCZtSsIQmcCvMHXCWzxwhngfMviNGtcqMlhXaRWoDXnONDSXKTWYirLVAJnvutEwBKg",
	];
	return kNdCsQsmrNuShcZGF;
}

+ (nonnull UIImage *)XaeRCNJIMVy :(nonnull NSString *)pdTChqGmVxP :(nonnull UIImage *)gwkrGMOQHa {
	NSData *xyOKrONQUh = [@"uPnmVdsIqERgrCifinTFOiGSBGqpTFxrFWVkVJRbeJepuGRZsbrPaQjNWysCGzYyNwrQWoSuIcQTtXzJrcvvTBKaEOHlswfdiwFbYziFTZtkxYAZpXBtAZUISlBJUXereGQpYijBH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WTodpbpAgQ = [UIImage imageWithData:xyOKrONQUh];
	WTodpbpAgQ = [UIImage imageNamed:@"dNkqMtaLMWXgVSrttPPGQpaHyMCJIBuMseduTVyOMCbJklNVgonvrcgJzguTUewNtArGrOKKJjvypFTwtyGazqHWGSMbptoZMQurhlZaUzDlxoFDHNoCEydHHCohzLMABhomiAmYsSHGqrUwyNV"];
	return WTodpbpAgQ;
}

+ (nonnull NSData *)TNfDpoygQeXgdn :(nonnull NSString *)ptyzqCNuAz :(nonnull NSArray *)WxncErlcUWEFrVkDibU {
	NSData *oTfiDwZEkkQkVoE = [@"atREziAPdqUpiFUxbyHBoMixrrrhJeyoymBlKZrkNGFayhnpwileZgdTfhDwYpLdWdeGlXmLrgQKLiEyEkAbxzvfsKkvoBvnEWyXwVNeAuZgTQbXZeZiExXjMXnTJEjgbEhgxdtWUzJLcvnEWsTm" dataUsingEncoding:NSUTF8StringEncoding];
	return oTfiDwZEkkQkVoE;
}

- (nonnull UIImage *)yguNsXDYkTLYbTt :(nonnull NSData *)FQQttcxwcOmluLnDay :(nonnull UIImage *)WdjeGSjFsuwXtTBsLPC {
	NSData *VDXHSFqwtQa = [@"SeQxMnGvGolHBziUscNkqhdXUEroDLrPUswMYEGFkAxYXxnKYukqLFhJsKSryUmtFDzXxQzfyXyvlDNDWPoMNjTdjAZnOdoMRcMPubYZkYLFzIeEXxAMxkTwJWmuEajqpwoRX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UCCTdvjADbAi = [UIImage imageWithData:VDXHSFqwtQa];
	UCCTdvjADbAi = [UIImage imageNamed:@"UseipTtsbWzVTwFLuFTYbRDpdDPUqBDCCxcZRGrKJHvvvsiXOSgFyWiCtoBrloKmaSlqogMjDSYljxsMeLcjILHbFcMUJcVXTKcRJbskvNZjZsLTcKvdncIyJftpWTFahLxESPJmVbkbw"];
	return UCCTdvjADbAi;
}

+ (nonnull NSString *)NbNRBuEtnnzZnB :(nonnull UIImage *)yrPHryDubtudzVIrjoo :(nonnull NSString *)YhXtoAUaDWKjYrWH {
	NSString *TiOOpNqcROa = @"NifrJflXTOnDIaoojliNuskdYuKdQBPaTOIGetvZAerXfyZnlCiIoVRkjbjqMTOcbDnRPmxVwGwTqNBgyijJzwwjpbpMJCmQUTpfCqdqPbfDIUPsfqqAynlVAMOsVnWUhieGfKTqhoBbIJ";
	return TiOOpNqcROa;
}

+ (nonnull UIImage *)mgMcBzDpisPdhNIDVMv :(nonnull UIImage *)HznYnbnNgalFLDi :(nonnull NSData *)tfReKlwXdQW :(nonnull UIImage *)aLgBHyzyETyfaUlwvz {
	NSData *JUwGITZwIwBMihevg = [@"UXiIeUPEgbktyowjCusJjDseIJUORzzmMspGSufesrroYuHClxKwhPqBJpovGdQJuFWbPnHeetbmLTsDJERIFJxTSOetxYxwjPFpVKkTqiMwgnyoSWWyHmbkXgwiUrpYKyBemFUfDVNGlWq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pjjbthwCuNAIwXwAK = [UIImage imageWithData:JUwGITZwIwBMihevg];
	pjjbthwCuNAIwXwAK = [UIImage imageNamed:@"dcVWfLMXIvuxYPSXkFTNHeMOwvmYVoJNMRiIwFmQpjlpSrxQghSUUjUcBYTVoBUwXxAQFOiYJWfYQCYCeckDzmojwOQYaizdlKZSQoIATRUstUIFmsHhlXOaKWJksRmo"];
	return pjjbthwCuNAIwXwAK;
}

+ (nonnull NSString *)CQRxHkJmAs :(nonnull UIImage *)cXnUIOnnOrzkHMCXJ :(nonnull UIImage *)EmoXZrYAgmOjdBOPP {
	NSString *raRgWidINtLtVqOgRA = @"rlyWygKSavdkyUXalWGbfwgPKGimCBBvwvOxaXRulRkLdmGDcxxRSabjokEtoHexuQHEOZNRJLsvwpilAglNmEPEnZzbShvFgCVGqjsIGurCLcwfEwZJnCJyTkYqUGpdREujeClOvOU";
	return raRgWidINtLtVqOgRA;
}

- (nonnull NSString *)wpQTjCjByUx :(nonnull NSDictionary *)gVyUBWOvQVI :(nonnull NSData *)uwmpsCeBTutU {
	NSString *JTpRlhWpZJUmIC = @"WequQWNanVFIkOLNHbAeoeupDPhIQxEjPavIQOvVcaeoTuxAXxJhrPLkXapjusnMJxLTqPLFuiKKPqgpQFinzVxPKIFqSaXMrxnTRrkTJZ";
	return JTpRlhWpZJUmIC;
}

+ (nonnull NSArray *)CYKFHSUtkbWzDetBAFO :(nonnull NSData *)BCulWXNDbkVVGiRZ :(nonnull NSDictionary *)CjYJdtzvsVEelgfCKo :(nonnull NSData *)nMhGDFUKPe {
	NSArray *SJVmVpfTbrzFWSP = @[
		@"TmJpAOOgNKGgTYGocklUFuRpgaHzbatoILDLQhmRRyTEujnYgLnbzmvZDNXKGgsRmChtsDyIqxeoRFvLTXkwvHifBUCKLNeXEfsLXcHgfQCbapChOy",
		@"OJdccaFPXzwNGMBZDBxpBPrOdJPbdTjEPCzLNrEGqubmSPUmpktCggazlqsJJUUHetXjodOFpecajapgqIMecxaHjfEvVqhanYwsyTmUEiJLCpdJqMLBHjVUpUrORxTrZlqPmwrmRZNdnUiIK",
		@"YrYehSldwheTPHspWhecVLSxaxkXfcpRPaTBPBaENyiDaxSkeagzKjniZNqBEJSHyXSleHpmZsDQQpzWwHwsPprvsXjzQKSvKqtXWxJcf",
		@"TKZiyPKsGbQssDbRoBHzQBJVtEUAbuUDYlCaMQaAjfhtKFOGmCrPgQHFbWsyFnynejKubTHkGLxcoYytGgGkjSpWbBvWKZOrCIVkEuuNrilwiwpehATxHZFaBlrVpMpjAkQpPXGajH",
		@"OALfXavnelMwockQesOEdnHiVlLWXzIHYKNKhpIfSXkdcGnQbryhmHVLhhaFxKEeHkqWVLxcYNXtrbplyHtKeQnIXoEdaTpGyHtKDvFmgCdcuHvZjBAZHdlJG",
		@"isPAuQYrMKuKxWyaHSDEOFtXKpOODmJCySOxMwCYgcTjBCmVGDzdEixmGgKjvpmgwHoUJaWgcOiNsYVQBvBEKWsLHPVZxZYmqHClnkElBysZZqFHwcHkfPFpQjNiCl",
		@"TflckcssiUMotIeuTbkgHYaqMedSDRaqdPodbiicPCMhsiBeMkBbCktwEHAOTePFqHeMesJEmaVThoGyDfkQZNDqvyTSTxeoacWpTjHlr",
		@"VMADiNYQmMImQxrztNTJyNBwLOJEmkEbmirmuwYHpwRofIQEnYHwfDPxNPdTXzIKtohiEvaQEftJFUMPSArmcESnyHouBZzWZLKN",
		@"zdiDSNsyAdbNjdRhWumJxbTsykuEVePfYyzEwVQcXHdeuXLTZVaekEPgonbzbNeEASitAYfWgcUMLwUGUhfRaDkzodkddFOUCbJVcnjHMbSAMmOZoLWEqBQEHtpZXgLxDYnWWlMIc",
		@"JCfcLMjOELLYxraKLSctOWNLASWMVutxFFYqTWSqTZqGqcUweOYOjqgHAdZAGvoWoDTduMqGmbIRPSmBpywNEdudZjyklWMiWQdcEuiCachWwhtXFCEYJgjadlKznjyUXI",
		@"YHqVQsvgpcLQKSzCidjTFtsBRhfvdAIeCckVGFsOMwModufcEOMKzTkTabknTnjxRsWBomtSqAHCXrgblHEyIMpCeBhhQypKyGPmWvk",
		@"pgFsTaoudNOtNKmitJuXXYhRdSuIzZCsfdWychwLeFlsrBhkFnxnqXifzJKpIVkYyLhZNUdPLciDEkporukXpqnLDrjQOgYDpAmwkKnLKdzLf",
		@"yAkTWsEfDCrYcqUDSnMwzJVeZBnVDMqROSwEvztlcaAChOPIsHwcKBkMqFoBWYvyitnWGCJEYMFCdvuzesiMghKSIlzsUUHdNsaxVfyjTSuZrHSMohJsFudgqyKDBbbSxCddixfDWuRXsfiGeh",
		@"DWmIuWQBjEbxLYJrGvdLotcjCuXdMmgiHSEKXBQdzGTQWMaDqBkucQHOAJlrKaXSgUUjqavxGcTJKijQgjjNQXqJNPLCaQHrTAhziZSaHiEnHwtAgWONqDrLZDH",
	];
	return SJVmVpfTbrzFWSP;
}

+ (nonnull NSData *)zZDQeBrepENCevN :(nonnull NSData *)NvUUCOAinIBmhPP {
	NSData *UkrlYQrDkIUbTDiUo = [@"ckfhEhuLbFqDPMEMBKDRTIuSeCRdJyNEMshVkqCSBhEtMrOcsqLvrPYDwiRcTJCXzAOfBRKbETkUXRgnVqaSnVzkOCyxwziYLgcPXBGMfifEaXJRNyyLeFzRfZlUiqSwgMzbhX" dataUsingEncoding:NSUTF8StringEncoding];
	return UkrlYQrDkIUbTDiUo;
}

- (nonnull NSDictionary *)cciIsKlKnBSfIShoMi :(nonnull NSDictionary *)IylnQTVhCJghH :(nonnull NSDictionary *)JikoArJegDfhCiiA :(nonnull NSData *)yLpaLBPJGb {
	NSDictionary *rSmubqfOjmMIgKcp = @{
		@"WLQMyMbxxBQFhWHyw": @"gppCdEpPofBmYrNKHgoKxEsvFIMFVMfvpFprUyFGqAMWWxGFabnASnNGvxOMddMUefgAkRYKSwGFkeHnaozDuzVPdzjFvHbQhOsVBiEZwFBKTMWhOYFgCTJah",
		@"YEQBowgvTJzm": @"mRhwKjutUqkjkmdaWDgQcnFLUuPGvFqLomcuXPyQEuWvPjParUzweTetitvXSOAuBZujNKDxOrHPiVXosTKvuFskkSlcXqlSpSKOmthcNSPSTGBEKiBoFdLMRAKAuO",
		@"SRoRJvRkrRAwZnaoA": @"XpIIUQeVBZzvSxxUQTdnfDVFrMgPzbzaEmjaNGBGrOvhlEsqfWyjIaisEKOOLxPQkpmLJZzTyaPDGAbQReNqUzjpuJXVlKSfRznPIJLvz",
		@"XLvJAGHIyQWw": @"BEvKEFkLswoNzlIDFlPXJIQQXcuDCqovBfcGPUHYsQVLxpycignaPzWFNeRXtePomwdLrmNzBhEvMCFsXnEoRyjnqrUTLxTmwCleWjvYxfRmtpfpIwWMxgHongTRWJAlmZSwPQVNxramlpSzEFk",
		@"KyKpWnZXgDJVHdCDKfb": @"shZCmWavnAXweTqXWilYcrHGesBFdeVscSvqzHgtZnbLhFzJCTyjpkpJXuGFxajuXaHjIOYljaTwCNnuKsxUopqowLkddbeNWuRUqIAtLkviAjxeXCSXsdQGuvG",
		@"ageHDCvUKyjttdeFoYt": @"wMWuXRegDBBiebNkvZIfvZoenYNlJvfsvNOHirQHMZpjukWcPZWMZUqCWiTZanitIIhKbSvMgNaxChYBPQZGpxsMZgkjiCoNKoeOHMqeywaQwxOgAIbgxc",
		@"oZuZHzhNrYWnpWhf": @"IvhisMBgCBDArxcPRfKiFzgXdYyRjgtQgwdvcguzzAGOpVrmlrdjBzKlnvUOHcZswabgZlpsKmPTXRNqHizqsJRuooTQBhpkLIObazWUEpYXOavWgOVNPiTYmvzWwo",
		@"ihbqEGeGPi": @"ZWZDnSqvcYZSWaPRoCBDhJMdFEJJBcRpYXZSPVLtSklMUQGsFrJBfeFZuLWjgvujkPCkRJPITgnkUXuvGGewUxYChThihUKKPvXXjrWWLSExclcrSpMQYNOLkGPiVXjNVbIHOeAdbEVHkIqCchoXS",
		@"cSEUuOoNNIw": @"IhbbVgkLjZAinjwcQanxtmFKCyCKuOntXiRrWWYOdUeYAsmaeiqMPYfEHVlMPdVREvKuAXDRHZATZISWCqUFbtvRqwpiYLyUUKEsBSQXHchUPiTTpVPsbudgtyomqHmXjDHGeaLiI",
		@"WUUnscPJRhlmnT": @"ZGxXopkOBAQLhcsrTQoVywJvphkHZJbaEtxfONcwZSpsvhUkgWjFoyLTBHBruzBQHZICdPcVuQLmOGTnqFJgHpUlsxhNqnpxGnsWMkEDfXGLEeeGITTUOOsZgUVqHJfI",
		@"ojMsjQXfWtbYJxNhu": @"ltAPZkNBFPZnVBayHNxmWKakdXYGxKPZzkwzxcIWyfqCwTQZhMJGrbDSSjTOionTvfrqvhtSpHrQsiSkJOwTdPErzhWgNLJeXSlLPRL",
		@"LpNpFxPAxwo": @"pPfLbTtVjwBZWPGWdUzVpJZOjrjqYiMTZdyADpcIlJxNiuihEVacgJgcLYyQBzgMvVVTcuicszjYJowPwVTABNFsyvNCkPngVKFdKOxCmFwrWpn",
		@"DNoMXkIVIcqHUFLNNh": @"WiezvIRqNnjxlRSlhSrKnWIRQXbLxTHSDFneLKetwkigObxnLHIZDBGHJKMmsNEEZRcDzXAZpCfJQxFloPRrFmlkAPtqzIZvFtZVtdZByhYjNPLGLrAbPcF",
		@"OtChunTfXDiiNJZRECw": @"pjThuHzICWdvkLYGlcumSMvSAgzshNeeMDrNiXVNNPZROzfLNEZSchRtIOYaTiCKjkIvAinGeTXXMHwctDnPAckBGiMSqBWiTWNMvlEZdudGJYCXSZlPGsgPZq",
		@"fnTxdDjzNeMkFUNSigI": @"ohIYDDVsdVvLwmtfpzPNJFCmVBDrRhXurwODHPqeDbDqIuvmkJvNZqLQaWAXJCZqZtliIDrpTXuuWYWxtpeMXMfRlwZpYYvBVXqEqvtxyyWlaKEzewkYasSmZmhCCosCBLSgiPwnRoUdOtJUchA",
		@"zjfxrBJRYc": @"NbJgCgIdhcEmaYKADmevsyzNHXIeMxZZfftUXxxUWsAtNCReaIKLGRBBlRUQvAidqufljvLGwSOOLLcaaIlIXOqllYGWAgMwhfKGfpfckbHmQPDtBdpPtRPyBVjcEbtogKovacn",
		@"IMLsrJssUKaqMgQyX": @"KwVkThMqZVnhtEKVKHazoNBlrzhYjJTKRCttATVoCQbBLqbsJiJHbKXOWegtTINRVNmJayAYWKVsZHYegezmFNlKnnbuGgxJLQyBTnbNNGCF",
	};
	return rSmubqfOjmMIgKcp;
}

- (nonnull NSData *)fwcLvVwngAhUnPKK :(nonnull UIImage *)aLEYCWcJaIsvCGASrxJ {
	NSData *fcZoQPOqom = [@"YYdHTDALppUMTtyUwbvtmVjDFHetSMlFfijZEZDzhVEjBZlEChcOWxBpKKeGFOYIEydTEDmxkSSvYuaIkYXxepTIMQdRWkBEqNOmeGeRujGMOjCngNFbtobUtBhKScKEqmxQILcHGiBlAPUov" dataUsingEncoding:NSUTF8StringEncoding];
	return fcZoQPOqom;
}

+ (nonnull NSData *)cVFTfekEMTrEs :(nonnull NSArray *)jTqhTmhDElPToBmgzTV :(nonnull NSDictionary *)gCXomenDtuouSgRXbhD :(nonnull NSDictionary *)shKZWvvpoIF {
	NSData *lvXDSAecFWlyOEZPp = [@"XJqcPjtEnEZHwvednWPTpeCDGxdgzzhhKUrMTSheCScdXlugCdxyMCsTTlopkAUnZWXXxhfoTmaHwzsuJnEkajhezkkDKXWIIeDPzPkIQQsiGekqkbqaKmymghPNkqoo" dataUsingEncoding:NSUTF8StringEncoding];
	return lvXDSAecFWlyOEZPp;
}

- (nonnull NSString *)DWpEflFpswQaJ :(nonnull NSArray *)FtnjffkYpXH {
	NSString *KuFISLfJAlXIaLgnwP = @"nbEyUxzZYXiMgkFienExBaGUrLmbixlISyxyeZXUlQAfDjdgQxTEvCBPPhMwxURRvZrUhpzBkArHZCcnseNMNajSfpCxRWoXEstfrRaxRpPtnFgq";
	return KuFISLfJAlXIaLgnwP;
}

+ (nonnull NSString *)FMhgQynORNymLQI :(nonnull NSData *)cZefJGoMFog :(nonnull NSArray *)AHwaQRJDjTqPW {
	NSString *yFPAokuREabTnTaT = @"sraCDQRnbMCiqLhZUOWxqcZlTwNapTRthSPqbjDZAojaDIsffvvfDGSiDawPwQuCOZTPJEDqrkRuenXTbqmgtQVysnJvrGFZNvILliCIpAKBOaBkxBLuZyqRuxtrYRxVBaCGzjZjnkvbWXCHnTBOj";
	return yFPAokuREabTnTaT;
}

- (nonnull UIImage *)eRhIQocNPTIMzYfAM :(nonnull NSString *)VDrKqWURdJ :(nonnull NSDictionary *)vnNPXpXLeafsmFs {
	NSData *ydqryQrVOKlu = [@"QPTgcWvNaiRoKbLACaBYtmAKnkAQmCiACgpNRoOMwXKUJNEJBUrPygSIvuUXduJdZrGXIeEkpBEooYNHVuOEtDlgJgehvGIScYanfUnTzuRzGTvLdGiErmpEnHVSWFTzJZLZrQC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pfiPFepgaiBScnc = [UIImage imageWithData:ydqryQrVOKlu];
	pfiPFepgaiBScnc = [UIImage imageNamed:@"PWjkbYsNZyKviCgrHVrwdblbDxfCKEzZyKyyybRVDPuKyFdfyDltlvBgzbAQXvceuacXLvrvFenekHqqdjSXwhQUKMoIKUWOwfbKSZSl"];
	return pfiPFepgaiBScnc;
}

- (nonnull UIImage *)TROJuqttLaRMZIQhPzZ :(nonnull NSArray *)AiPNpNylSIL :(nonnull NSData *)ECAflDgbBwQLxpoQH :(nonnull NSDictionary *)aPBORInxlYJiDBHRkqX {
	NSData *wZfiDdhqBhLdKhY = [@"GPXQzUpwATdsVHDjtyJvnhXFIvuPqsdscxIsIehJIcFlymFvCXhEJuaOPTcbRGSCevdPNgeBlillFBXjOksIhELCXrJShGylPzJwCLMuMBcbpsaPBZFlgsWtZdGbIjKBipkzKqRdOmkZt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PcAMVvedeIAckb = [UIImage imageWithData:wZfiDdhqBhLdKhY];
	PcAMVvedeIAckb = [UIImage imageNamed:@"yYHutTwAQnXBKstZerovgMZwuxLqDZdpGGYrBTQbXEMHtsjnqwnsGtYxWXjhlDIWeYOrGUoTlhfpIwUlVUfHCwNMCufXCeawNKIyMlRcSBucaeWoUPWDMDhNkEp"];
	return PcAMVvedeIAckb;
}

+ (nonnull NSDictionary *)urEmdFFAmdoVbcFb :(nonnull NSData *)LoHMBuqdeAJLBd :(nonnull NSArray *)WbXunnepjYDLI :(nonnull NSArray *)ecosspplazQOy {
	NSDictionary *fZGcJXavmOyjEqyZK = @{
		@"ajphhjdccFYFcU": @"CCCKyTIGHlWMREORXvCxOxDDMvQWvDdxXoZpUXINMVLVJUequpZyvHybpcYrpFXqPPXwEguiKNBLNPcziPBziqvQnkcgoTpnnecBNAXcsiBmM",
		@"iKCiKyFdecFFBCuM": @"UCbIjNYaUOZPqtWmyhyCHoyNHSnvlPJOusgIHLNaZKDBCWamvcoHkeBlLRiEjKFfbKKRSGxHuavmuJyvmJIktKhWgBbGXmbhjjdxkXcKqBDGVOGzhQxHlbutKkccXEQBDa",
		@"bWWRrEayexjwZZ": @"klFManfKguqhACtyesSTbgtSLvIkdEIIhEMhTpHGSCethtLDQeLuhrIuZBHKFvWkFzhysqVDtScWUSEpPszZRYpDhDmJCwCVOVBaRxFRy",
		@"sPMNRpZTQxytAsxBqoy": @"fmvqbAlAOHjAdSgRoqUfmsdwbVyZmFBaeEgtGXYwDmVYesLUvTpYLYdsupZtLXgvgQuwknnFOntbmXQlXWYtjczWBCCIWghllQzYTSgsdWwXDjYFcUGlkoZPQayyIw",
		@"VhodfSpaNc": @"SiWwxxJPAyMnPiOoyQKlfFCMKYSkmGUExNYxyLWKzxORqzUFunxjJcFWVKBGehTnWQxNgdBFQLWJvAYSSDGCjDKoyuhUCGdnKqTtBPavpavWvptMtEkWlb",
		@"uybhjGYPcdG": @"CzxODkDkMwxResbiIkCnufYlxBNRAuYNkyDFOGSOwkyAriqazjWoFmpVOwTzGFmXoPuoLqRfkFPkEdXXoyxfQKiokkpMFOMUeotwqNkbEoCDpAJFR",
		@"FSCGxQNZLHBHY": @"ZqtAadEZHWCPCsguBwLOplZLeGKYsFjkBdqemyJJOSRTdqtDlLrGJCHOhdofIBwPGfCcEOvomcqvBMeKBtOWpVOJRRyiyBoDIFTDPIhlGKYPIkYfVLCXSUlzcqizbeyyOceouFIpH",
		@"GTrYpjZokVb": @"vVkWPvtuvpNcOcOKNVACNrUdupozIhXlkFrOeXvlxabsfkvLornZDqkUBHsseXbatJcvxqHuyHspaXuweynyVKahsyUpUFcgAEnLmWGRHUUiMFqFSjSeQgkBEsAqKsHWedwslZBHNe",
		@"ughlqaLpDf": @"DKWKJWNlYkfdFjSrLHnmgwRBezdCdxehAixVjZAAAEqSyrENdNZcFsWTSEQnqmGTKRFSnCSbIrGmkCAqGheaMuZivLfzcMDLZaKoGUHZE",
		@"veZHdJQIjew": @"BtkaYlzPJpdqlnrPAsStaxyEHMCPwdMVRgDNrriOwRxOrWJRFozMsRQlnWZvvPtdkVEaVKDiVbQxgEWicTPoTCUqlmzHIBpvxbePttKezyfVqjkaDuWTCdEtBgTOMeGBoEhkfoAPnsFTduOfQtJ",
		@"woPjyDyAbXBfeYjgZgk": @"jdipKpwhamvNgJjkQDIwMkvqcnZchvrqjrOjsZdJmZOQxVeaWXYHsTLjXMzHNnRYhVeezMUCzdLpcfohnQwEEVxGpaeUjHlOJNzJDGcePknKCsczHzzhJTFyvndJC",
		@"DhutcXYNnuvQBl": @"WrxkcXDNCSnFASodzPSFwFKghKwewBdTOaXxyIdRkSJvuIftqIyksHPyNedibBmRfEooWdIKsvpsZqbEFdhHLLraCZTaLWNHwlJhl",
		@"NTCrnbOstRsbFy": @"enkLjXQcADiPVwXScBxeDXDAmflcobapgQGBobmxxcQpejHRojxHikqUNRptMpzsYVuCodPbHbaHWuxRsJoqCxZaDBzCngAMrIkCEyhWAuJNqHEQIjFhhtwslaaoXUWSNICdGTrCcbZ",
		@"CXXnHTHNoNgrsktzLs": @"sjSTcezPtzxquNfrvUGjkeXgPeAwaEtciaRqsxyQbgHbCRDVeYbyZomXRPoWfvxsCCdknFikHxHKvGALVTmUaakuKyglSKeiBkiBZLCeGnX",
		@"KmGqRJVUrBZQaq": @"kCDjUWfODXKrVFeDFHUOMNwdvIqmYHCzonDTNrsIFgIYqeDyZrmuIFgedYBlHEYigyxCFISKDyqExdxVgPOMihFsHHBSXZtQVrxECkQjaUtIjiktndNeXEfWlXmARmADSqTHQzSGEhvnMg",
		@"QIFpwdDjclgOpY": @"DCLHozeVFdNhOfIfUfjxHQhaivlbhgipVSpKJGOLYugNWXeqApwJEtmZNJHqTAkcpYUJAmrGmOaTQYMRwtSjeBGydKWshsWGLFrKDJGVkPVQHDEKxmvfULaPXhXSphptJCCDsxVekHblbfblUvAHK",
		@"pMFnmAbLpzT": @"okvQPzCuSfCnapkfvEkHrViSTMtaRNJbCZrCLyopQjiTBvwtkFVfJmKitVSQhGdQrcoeMxctjBbJoAvEaGguRJjyYLpWeWYesuMPhEdmAnVKCzQgjhuFKqcLDdnzGGiBTXWljwO",
	};
	return fZGcJXavmOyjEqyZK;
}

- (nonnull NSDictionary *)REOBlkqeEiTZZETT :(nonnull NSArray *)APsnCyoIbINArkwnO :(nonnull NSString *)zAqRaVZKppYanXdZSW {
	NSDictionary *KYXdFazUpJWtUEJ = @{
		@"OPwMpeIiluyyoMobKXT": @"FQhvlcdJfIdvbhagLBdYmBJsDUijPCtyBEafCdfojQAnrGPCVyOkDgnAFtHVcXZpmdzoqeyzNRViNdzhNyYbzLgTiWlgaMdfnefjXLSGLyMmOQxmnOkMMeNMGNmDPHzvRTBJoiEbSJQp",
		@"ccZQBZpXQYJimavGuGh": @"caFGKFEVohkOWARnZrmXFEOedkqXltpQmookaQhiAwBjLILoROIEvOYyvRWvXgUOHMqWdbHVFanQGidymOyFMoQAwQIOqDvvgzZnow",
		@"QYmcHnipec": @"trLxUoyuwXzBEjaXaZMhouYoAZyXZGCvTWjqZPWQtvqlVAJWCNSnbzNRPVtzmSJFdYsCKvXcUpWHZsxTHUpayEyUHrPeNNKoFXKLKRNERSqMfxFHNUpwLwtVG",
		@"rDtdatXqLEuoliZviJ": @"ModFjnCSIrNRrRwhoEGNllWtzmohBNYfMozGSCRlxzbUVyFvDRqjampZMKlNqATMzpAUENEAQmaZNkbuOhXoZwmubRILWsIXaYJSXAfoF",
		@"umYOBVgbMz": @"ArbbrncelhbFaNaoFJjjHzQayOyFDHRuYjxZcoHYmxcIzprHEgCVrcWlCHgkuunOFrRsPWYkfcYtNvLWJhjJdqdpNlRlQgIbOMniUySyOcPlXSTkMbHfBWwQCsZNkgfraIQisWWUotHYsALdgmADt",
		@"nltyexxjpr": @"HXcuHllSMIqUCyXyYdySRpQrGjXVAlIXNvXUKAgDQZGJjIuByPuhHaVLSoekfZrQtcCqJmsIsrzIWiujiwUsfeulHneXWKjLDVkheOvCMqeTcAADSmKCEF",
		@"NuzgNKuvNA": @"zzgdziQBEkLewOrrHCelKXCoQLaDRohfjWJntDTFMMEMbuOReYcjVYfSWJMokjsYdKPULwIbUWtTZBYnPxMSCpyBqdofAjJFufrTjLVmVrVWrtKFdBmWBCeacl",
		@"EqRMRDoWxtCLDWGO": @"enYyEynPFFXORqatyItPeUtaugbPcifAWMlPJbKcfzUOBdHBeKRbAFQTqXEapPLWqSzHzzLODWAtJpkoudaLMrCZInjnpEmXmmOfBPzyyDgFZGwQIsrIqLPeQiRFFRhhOe",
		@"XBejrLfCmeny": @"DlxFjZWYCLiGDUXZGFUPKEZIBQHrdduFwotODgtLYOfXwZEZSnDTasCckPVZCpviqkfvJsTxqciuMMTDaTWzNjSTOtldOahIijPCEoeMMQPihtGawXyKClzPsyTVvPH",
		@"jEEbjcTdccUYyWRYV": @"zKgJJHsavhDQZCsMoRoXbOnXQkuuXhakWcqWTWGNHLuZGbcuKSxPFXpqdtzhrAZRQzoieLLzOWEXedyIcQTzrYkFprtIhMCAKDOvkgELDcbBeJsxAKTiGjkqkFhaf",
		@"JnQvohkJrZqNFIQA": @"hyxcUsaOHOTflmkqmxhcqRCoDGgcxfegNmLDIKFzolzByNObNNnkuUyQrTwtBgYffFYPdLjxJskszagZxZtHSynmDWJAmxqDvIOfQtG",
		@"BpubcTNkjOCmGzpP": @"asWCWjtPhKmUeXNnftcZwFwhCVhDdNxPmpvzktDKLeXXzYumquNpztaBtUbTARztFzURfRrLDtqLZBcJMgCQCpziIwrZHxGthnXOScYbSkynqUJdeyRdlHUCmJFzwSDfhiDMZDvx",
		@"YKybyMIxoSzLD": @"TBpKLEXrzZZKHUHgVekGBembBGnYvIEBLYiPAGycLdtLWRjWVsdlfXnrCWHtWJrOgRaPUHtqZtORQwXPBIiTVsyZyOElQCgDIhtTgxUA",
		@"vcAUkKEQcXEPuksAr": @"UCbvQnMjSoOiohFQmrSAZBYMvlYVNFQObMiqkjHnqOQqxRmCxBswgoPYdubmKBRIFsyejKMkVshOiSrDpcRJHyTVDkZlNJuOOwuaQdDAhQGygPZotRqKrfuVJIBmvjvCPsDLgCDnwqXSJQnU",
		@"oFoieKWoKowJ": @"GQHIIGYzqpqmfBQUFnMomlMXuvwXbHVuxshEEUyIVkPRfuiDjbkyMeCfmhOlChzXRFkBPGxqzngzrWxklcflnfFYYZGfDIjBjDDuZLMwNiewBOmbgJLLOZFtTaoEqdPlyuKwlVPbg",
		@"ufGgWBgXvrXVcFIWL": @"XYKbvNEZeQlWqdBacBcBscnIgpktxQyJsNRzUXsfWNZERLgIONWwzNvPvJzQkoNkhVqwYehKUKdahaKShYozrVISGWXvUjglAKDJYIJpRGEBoREALzAbK",
		@"rGbrVMbBpHCxbyoKZF": @"lboDUypVSYNtZenLsOVliqthJZkulIyQwfnMtKLRyEVMGsPSiJaFnNDfQwbxuORtyUPpfjMuGPBzrvcMTtDQfjjZIRYVlzkKzchJbaRKuXCJWFZKaTFDnbSqvzXr",
		@"EcOLpoORXzFIorUCs": @"UIjFdlCaZmzpgvIFhFXXxJEQxSrJzQpORkSRqZQNYHXtxndfrtaQtZiuzPVJChwZCfxcKHgtQMKfRBywuzFNlqlVpeiAWlwJXLmdKlKGxLNEaGfhPxRNfIXGezVEnmriLyEakenMTZYpiwyB",
	};
	return KYXdFazUpJWtUEJ;
}

+ (nonnull NSData *)POmIyJhwqkGD :(nonnull NSData *)LaqeCcdHmVkbkSAu :(nonnull NSDictionary *)zBGnEgohDrZk :(nonnull NSData *)IDQVMcwFVNcgflHk {
	NSData *sYhbGnGOimv = [@"qTUpWUqBBSCmypcbYPNCwzceUNlrKAnklKOIqSKgWGuniqrjJxdVMEWmRUlrQXMSSwzPkaKJEpahqkpdfUUGkzROvslPbjcUNFGINEQffdPAceVUoAKpLAoYzKrAsTRdGCKh" dataUsingEncoding:NSUTF8StringEncoding];
	return sYhbGnGOimv;
}

+ (NSString *)stringFromABNFJson:(NSString*)params
{
    if (params == NULL) {
        return nil;
    }
    NSMutableString *tempStr = [[NSMutableString alloc] init];
    NSDictionary *resultDic  = [NSJSONSerialization JSONObjectWithData:
                                [params dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
    
    NSArray *wordArray = [resultDic objectForKey:@"ws"];
        for (int i = 0; i < [wordArray count]; i++) {
            NSDictionary *wsDic = [wordArray objectAtIndex: i];
            NSArray *cwArray = [wsDic objectForKey:@"cw"];
            
            for (int j = 0; j < [cwArray count]; j++) {
                NSDictionary *wDic = [cwArray objectAtIndex:j];
                NSString *str = [wDic objectForKey:@"w"];
                NSString *score = [wDic objectForKey:@"sc"];
                [tempStr appendString: str];
                [tempStr appendFormat:@" Confidence:%@",score];
                [tempStr appendString: @"\n"];
            }
        }
    return tempStr;
}

@end
