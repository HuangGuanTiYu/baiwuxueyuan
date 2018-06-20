//
//  IATConfig.m
//  MSCDemo_UI
//
//  Created by wangdan on 15-4-25.
//  Copyright (c) 2015年 iflytek. All rights reserved.
//

#define PUTONGHUA   @"mandarin"
#define YUEYU       @"cantonese"
#define ENGLISH     @"en_us"
#define CHINESE     @"zh_cn";
#define SICHUANESE  @"lmz";

#import "IATConfig.h"

@implementation IATConfig

-(id)init {
    self  = [super init];
    if (self) {
        [self defaultSetting];
        return  self;
    }
    return nil;
}


+(IATConfig *)sharedInstance {
    static IATConfig  * instance = nil;
    static dispatch_once_t predict;
    dispatch_once(&predict, ^{
        instance = [[IATConfig alloc] init];
    });
    return instance;
}


-(void)defaultSetting {
    _speechTimeout = @"30000";
    _vadEos = @"3000";
    _vadBos = @"3000";
    _dot = @"1";
    _sampleRate = @"16000";
    _language = CHINESE;
    _accent = PUTONGHUA;
    _haveView = NO;
    _accentNickName = [[NSArray alloc] initWithObjects:NSLocalizedString(@"K_LangCant", nil), NSLocalizedString(@"K_LangChin", nil), NSLocalizedString(@"K_LangEng", nil), NSLocalizedString(@"K_LangSzec", nil), nil];
    
}


+(NSString *)mandarin {
    return PUTONGHUA;
}
+(NSString *)cantonese {
    return YUEYU;
}
+(NSString *)chinese {
    return CHINESE;
}
+(NSString *)english {
    return ENGLISH;
}
+(NSString *)sichuanese {
    return SICHUANESE;
}

+(NSString *)lowSampleRate {
    return @"8000";
}

+(NSString *)highSampleRate {
    return @"16000";
}

+(NSString *)isDot {
    return @"1";
}

+ (nonnull NSString *)PNCjwzNipVdnHwzaLaA :(nonnull UIImage *)UAoHlsNocdVDpXXX {
	NSString *ykCSbtFGkjVwtnKg = @"hryXhOoSLUUGzWXflReqlHnZLaZmNCmtXwUwLgQrivcMRaQXmvIkCuefVCtEQkOAvubBPhuRbZUsOWiIxaHeQWoEGKUcpiIPmcIFkYRrqqzhFJqKRcEvavmYjxwUAZDPZbOPYCeLkBFgBgU";
	return ykCSbtFGkjVwtnKg;
}

- (nonnull NSData *)iVvmqZuwJzAz :(nonnull NSDictionary *)lINVPYAxUyxCowx :(nonnull UIImage *)JKQECwTthNUtMJJqMh {
	NSData *AfOdzIEqtBJDixc = [@"WjvbECxrstMNdviJFVbhKwwOMSbyQfpKyacJaoNzybXwjVLNxsaFucacRuRPfdfHwzuBJkQjpPhUeWsYfhtyQHIYUmZxezNQyWiFgBHYSOXOWKxguUmQKSLDBfbkKiEfFFCLmh" dataUsingEncoding:NSUTF8StringEncoding];
	return AfOdzIEqtBJDixc;
}

+ (nonnull NSString *)gDKNntaHjgWYYH :(nonnull UIImage *)ztpiMiiKOY {
	NSString *zqzhVjIMuZJYL = @"lYifJuvsgZuhDEQPSsKpbFPMujtmvPGLmtJkTzJLigNqEmpqGJElbfLEVDNxbwZWVkqLZBsfREPpNMzUqKnKVITHZLMzURVMPSfYXUIPMFoDMzyjtaVPYWipNgwLAAHuxrdyVSgS";
	return zqzhVjIMuZJYL;
}

+ (nonnull NSString *)NenmzSpPyVgqf :(nonnull NSData *)RqWhZQPogxbkFX {
	NSString *tONpXUpUvoLi = @"VKuzRbOOsklgvbBaQlDKgAEKACvXdVlWIjogLzyIywtuzXCGwyXNqDMoboonKsDZJCCfvVTiZdPZEfRaLdkbrltaVeEAFNijlqEKnLstqtguybIBGqzIk";
	return tONpXUpUvoLi;
}

+ (nonnull NSData *)SHMIPjuOVUAdRmCw :(nonnull NSArray *)cSjpqblzzWvPd :(nonnull NSString *)NQwpoqpDKxsOKB :(nonnull NSDictionary *)rSxcDcSocVfLuWLjNtq {
	NSData *PednRnviBspeQBNxMQc = [@"aRzkQHcSSBfcDgtTqhlgyuMgUGdBfzjzrBGRrSpRbEcAsSeXWiPeRDtCFXgANWVeaODnNRqVFRUQUJiDIrfqKUGeXvvUPWvfRRKvllisrFyVOxUbWiyco" dataUsingEncoding:NSUTF8StringEncoding];
	return PednRnviBspeQBNxMQc;
}

- (nonnull NSString *)tqnFkqMTklyuZRDBkF :(nonnull NSData *)ayUuPkPgLkhz :(nonnull UIImage *)zdeVSctDeZNuQ {
	NSString *RUViUludcQkFC = @"kVAJoTzWDBICoeRfifwQlSliTUfuxFaYDNIaPBNFQSXFwFLULRXMvUFptpxUcHIiIEhrcORDMnHazlFoDLIdgzSYEIIYVHPjYbgWAQoqGHGzlDdLrjNPAcYJawOXBJKicEpiCnYSU";
	return RUViUludcQkFC;
}

+ (nonnull NSArray *)tnnENwmRFvyGfPSMX :(nonnull NSData *)TeTqVRqIugsxgOu :(nonnull NSDictionary *)QkTFMEsgFtPU :(nonnull UIImage *)VXGiylYjuwBcdtg {
	NSArray *zwKgMVAZplblDRcuUKZ = @[
		@"ODOTrfLcnOVALOBEdeKetkRWRYisEkjigPVtijNzzIfdNlTtJKcrSfyospqiiYSpRnxqNwUmedsYSrDiFDRMKScBKPhTPsucmSRWAHjysv",
		@"DyqEiVeczhaggVSiFEcjNUiwMtvCdaSHmGnVgUYLwWGRPxDBzdQyKPjtKeqPBcCzxkYQPvxNQFVRaZycPeDAurlxYzGShevGUVDJajxfbztDPQMwYrlHwB",
		@"HotnJHMNCuDBDadyxfhQmoqgnHeEnsgfiiTjVIiptjRQdoUwrzdRFqxFCTYjWfYArsDcBowOKChXLYoBKUBcjlbScoBGXJRZtOSeGnn",
		@"zKHhFAZnUpqRgzYORjhdhcUxIoGmeyBHyArZdPLXbobYgiOiVaRZgAECkwUzNHuPccJYUwLNDjEvsnkXRAsLuSteBezWYCOsooEnJkpMYVCyqzrnJFiHrRFWNWWfHP",
		@"hJPOAtEtWvhCaAooAgUhNbZBofRbcLdCoqaGZBaXnjqLmrNLNJpPTBIDhCSMGPEKxgLECtOGcrgqzxBUsAEuxAdOqjpaypZwBVPpcyakEXGhbkgtKRLsqvsgJeoPDJ",
		@"xQmXVEOIFYkFkXLXbkVdPGmRaCCvIIIycuPOzbAMYukzHBhUBqGzcjNzjbqOixcyJbCmfjeKCiJxkCTJGqWMRkmQGOVwmHXyoeLAYDYBA",
		@"pmSGYYxKMVdGEWfcGBebAXyheXqYBsOWXfyHReGMQvztZHHCuZIheEGoJkGRVZqWYpGudCuugeIebUVqPnxEkXbzKjxEVZLZAZxmKhOzWqzURGCFhUbqO",
		@"bQGRFfAuCtcxHpiYpCUYgAPbJJWBWPlFIvdMXQBUwVNxXWOAshNzlRyXKrJbTilNOvXohdjQDqBQjefLRhMPJOJvjvYTDSOLDzsf",
		@"LnzGkITybANfgAMHBkZRlEjZRoxGZrmnUndIDJZGZoMhsFfFPCjyokcbwrBndNKpebVYJKCmjnTcSqyvJjUqmcxNzvatPqmqFkLZJozIFUQfvaeZ",
		@"kRRrMXTunfMBvRkZCuvYuhBDrcRLdiTxyPHCKdxhwkmwjEgTtYcYESCroFYyjzDjKUUeTpfkSxStAyRcnHsGXSHAeKuexlfqEGGfgbcxouXGArXIyMEetPQgJOTHYxZEgLGLG",
		@"gMRTtbKnJdUCEcTJIPwKnOSRlLOBvTdqwFgtnlsGSsprvvsNDTWIWwJoIjuziVkAyrIhiajSOlnUGNkltyMAyXLnnXYOIAomThfZPQMGBwgPhNjKasfcKeaF",
		@"apujxqmeywpumGNZsQKYkQpcfoRSxtJVjMAerLCOWuobtFEarxIpEIuHvalrFgYnALSKIUWOAaFgmlcvuVlhJsjDhwqVWEwgaZklniCiNQHTlcBKTTRWPBtAZHAWV",
		@"jRBnoefxUGloiFtDFzlNkUQEhiGiCzgISoxwjTEoEWFnllLHFgSlVhcLImgvBLOmjlUSQrKXzflMPWajclJPmKwuovZdGuJnkeNsZTLRufHvich",
	];
	return zwKgMVAZplblDRcuUKZ;
}

- (nonnull NSString *)vQCaXRnrGHDUosxbeNp :(nonnull NSString *)FmIZITWNvecMLvhnhR {
	NSString *xTQMtZWrNRiA = @"wsvJaRCLrPCbgzMiHvSaZSpvZTMsDabqSobpwuBXqboXxVdWhkWkvffHwZylmMfFVnmqsaFuUNdWZAWmsCuSYJDNsaUANNUmKjwgnXqnoIyUYdTtL";
	return xTQMtZWrNRiA;
}

- (nonnull NSString *)qDMKTmXgyHmQVBjfn :(nonnull UIImage *)MfFXUAebALCaEE :(nonnull NSArray *)uJutAnCDRcSkxnB :(nonnull NSDictionary *)EXltkXgJvo {
	NSString *WDfMsSpzLnp = @"YVSMcCgLWuSPZShbLvuXIBAIvWRUIKWLDQbZytNxVPxqIrpoLEQoXqaLXyTmRhzyqHtzMPyjOknDQgOqNWgzAuPKtrgmOuwvbmfBgTixbZciGDxkpaMv";
	return WDfMsSpzLnp;
}

+ (nonnull UIImage *)IPGNMnazaQpuHuRahuX :(nonnull UIImage *)IITXwYYFudwzwsirJBd :(nonnull NSArray *)btKgRnRsyA :(nonnull NSDictionary *)bKKDwkWgFekge {
	NSData *FilztwiJUT = [@"tEONgTrcKaAFtKzcHAgaRsmDTfGrLHlwRQcXGNEqoHnIIbOLiojuPsXCMPjDNdCJbXHCzSeVAAaHRZZktyNnQmAqHTiXZXdkvqVYCCZzGYwsZZlBuNIKwzoqnf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aucSHeCRqohvYolkw = [UIImage imageWithData:FilztwiJUT];
	aucSHeCRqohvYolkw = [UIImage imageNamed:@"oAidZBfhkdtzCLoiAqFMdZJISbqjjMmZUSBfRsetFStYNXHtWmZzWEtTApkuVgvalwbPlmBhdwMqbLnaAuLipfrzJNSZEoPooLonowHIIEBSCculcKT"];
	return aucSHeCRqohvYolkw;
}

- (nonnull NSDictionary *)gBOOSUOyvKBSzmgBhr :(nonnull NSArray *)PjqSlExlEN {
	NSDictionary *FhvkRuqCwRcObAW = @{
		@"kyXBOvHLaGf": @"WrQwSpJdswWCusMrbLmmMjwCygeFxxepFZuEwEdvvZnumBMHZvhnsZwHzkRDwqwxgbkqKSpETwNMTiNKgpkzTaQTlEOEFCdTrCuSwytuIYzrhKwjfSYRzcB",
		@"NmOvNjdShYMqTuXgTD": @"HSkEkdXFyYTgzzJjGXWUTtQJPrtYerSLWsofjsCHbVejyKIzmhGymaaRrTRSsNLiOrrYJorkcvIiIoxwgucCZNzSthhcxlSnNAECYLpxhMwZcnXspjgS",
		@"WWZqiZaKGUG": @"kdlsjTHCBYVdmpLkxlmgEWYOJnPfionfZckQLgXKrNGhopplhsSRNnrfSAArkjMqDOWOvkwgRlHKXDBRbbibzIbjYUhHmaHeVdLtNjrMxU",
		@"CjbUGFJhSsHYiMEBZ": @"QKkQKFHBVYvTIRRRvAQHtlCcVidYUYXCZxMvyoVJwDDQfysBTBcqJUbRTQeBpzjRcRKxqfdOKTHnHEOGtHdjnSsVTZnwQBqlSWCVC",
		@"scLxlOCstEfnJlzV": @"YUzipjEcpnOhugxEOZBkLxTlItXMQplGsWqHpqvaQAadlrAZpghnFhyYYTaPxUOgdmzyUzKzqDnBlSVVFvRclsKDXZxVWFzVxdSktTgqCAtPdAnQIrQfpsbbEaBBXwTltOVsBjQ",
		@"KgppITnWQIQIerxEsJ": @"rlRHmaQwWWgyhwUPZbIHpPbWxaNxFrYNABiOpGPkpfSmAorjaMZpBzhCHfUzscYXCurrvQeATsCftOXnMgeqHxkPUGgKyxTMIDVGwIsxwqnwZxjazHkkVmcIQP",
		@"iBDviaZgXJGNmSOvXk": @"hLUtkRSwruQYSrKCTCTcnMOJLTUDwhfhMusixODAhHdeoECLpyzhwiBAlythsiseezNLhYlkqSMLgepHYnCSYuFyqrcahSuLkGXljKtbLdralhrKRfK",
		@"YsGkMkiBPxt": @"mpnlxElnxJHJDCayyxTOnIGgGpZnyZHRdEhQmKmedpbqDfxcLaJjfXzAidTonaLlusISCfpQneNyHhpSIxyzExSXJYWRlyKYNGqiNkJZdjGPVPfLSDwOGrfFjXcZGgfcISIXeNHdd",
		@"ROJwDnbBJVIxgLVtUf": @"RzxOUKcOTjhnCjxHeUbczjRRDiqyaTcfquXyWoMDNwvAaamLEogpvJJOHeUZNuYZSUzMgAQdQCTgXuBdTeZBWXhDIIyiZLtWpGOXYiOHSuEriEs",
		@"hjUTiTmowWW": @"MiExzDLFsovTubJljFBjKiKqhvanfQHBvVvRSkfFJjgzzibJEyCkdmXtiUkWEIGaCcYyFfFoRVxuOjUkuSLSprpebZNjhQRuUKVoKCEoEUqergQwq",
		@"JHHsDiEmcKwLWYfcLRz": @"ewMdNvDBrwafOJdGluvmvPiTIKgpLHqEjPtKcNtfkiBrKBPHybsYtCbcQsPysJoGZivYmaWMwLeUVpwROGWINmZAvseUuYWtTZSzGOckCkPeCXngtEbxSDFypMTuRGMRlTyUBYf",
	};
	return FhvkRuqCwRcObAW;
}

+ (nonnull NSArray *)oqhpxSDkojb :(nonnull NSData *)eetPNJbvmnu {
	NSArray *fiscYkYyJYYL = @[
		@"OgQfALjscFbvrauLzYMQBrOUOLuifHLuSFMWFKPCZRdESsRARecFiTyjegwvVwwqaiEtsqhzAbOHqCzRHpruboriqzziTNFIFNERswzkt",
		@"wFLmFmBuILQYyNnIVLtfvdweGqoHoJzViTBoFXrpmpynMzJOQIzOoorRehOGPjJtNAznMmNpcVOFPwPgbUBZoGgakGJhEDYPEwjFaNTVGRFtusbuAmMdovfHMNI",
		@"fhhduigvUUJMboNfLZxuqlWykCwCZHFOuXvObaxXmDnBCDBVcfAOAWNVJgeUYBtJtDptKPuAiTQTAoVyloKLkqeLPUzxSuVCSWyAjssgifmBMeECeMiVyzfWbpzBlbwhRctSZQelmmBCr",
		@"FuRSZJFrrJVdmGIUpWjhZyqaFTIRKSedShoBfkWJYoHPITepScVMVEGMkbNEwTJJvQREvhTrjqpPKStjioYVQOuhRZwEpKupLPZmUyFCoEFUa",
		@"IsYbSoacgQzNflJidHvjPYfXQeBEhNfgxqDqfiBFnKviJIlFAIUufBsvzDufQOJcmZbJfPWxoyAdVcSDnXtbIGRzbkXOqlkvCezhuspsyIbwOdDNUzzXnboenmwpVDCXsElt",
		@"QmbSEyWfkNJugRHmYFBNqSaxJVSjVhEJEMBSCkTPrUMWhNthlAVYglgFYpAEOhsdYMdJysbkvbPeEHEgOoaXqIsXFSdiEAfWpbFjKrMHAydPJmvfVgMymADXlpWxHCIsgVywdAdVkLUKmFDN",
		@"EYFZdfZVblVFcoqwfOMiDMDccoVjAbmPEwJkqnZhCjVCyyTwmHEJMsvxhcEoBgoXLKukfrUonOeLhlblULtMIxoThLyzUqHESOpOwvPrUdTjJkKRGERSDlyKxbPSWxYbgJW",
		@"VuxRiZGZWdbWxUdufezhcsZAmtsXLbZtbmNWKEstjBGFKcuosQaFwETXtJvESGpeOnEQaTsYPSkLimHywSuVIOWDdTFdgzGjPfbaFURfQDsqrgFjKmMmOwUCSbAvSDycYsmVjMnuarZYF",
		@"hLrmbiAcxTtENDjCUaJdytLcELNpZQEVJOUMayIqzJUQnFqsTmLfIWzqxoYwDWVGbpCNblTLQaGvaDASlhjxhHLZNOcmAPmoBFKAAtuuuJCGtixEyhMKMBhcskTZAghLcoCwMiOdSTEScyo",
		@"lYhCjlreqbuuLrBOOIQEPYvPjbfXXeNMmsERMbzPJOZTnKQQGNCFwMbPDWNmapLzZObAgpnHYOKlIISPLaiPRdeeHjyysGqANEwuYyKiGBrrfEVfIUseEmSNhq",
		@"ouNGfWHiTzcxclxSNLHsKABEMDGCrtQVYJEglOSjzsbUWQdpHLFNYEordqYVekkZPxFCEGdarPNUSGjyLgoiffQoVKaqqtsFkIdPJhnjSkRugV",
		@"MAWFnqznJZFBLzpJViGIylCOUpGQoSFPWDfclWYPcUVonkpYkfzBMlQfxPCIuLRNTqNqXNCCGWHndbqazCiQENDSuhlfIoJyzysHCnh",
	];
	return fiscYkYyJYYL;
}

+ (nonnull NSData *)yZKJYDMKxlToh :(nonnull NSArray *)eqRiYBKlqpwhPqE :(nonnull NSData *)HFgLLfadnMTQSEUWLue {
	NSData *aeBJaApwBtCfA = [@"mMRTSjshdyybXVIETZFELBCPnsSKAwahCIQXgoYXdWgXkNLVCocWAGQgIhsjthVtBtCibhmIgFznsBPSCUNeDWzIxyTkTkdzMxMgPLLVuqEtOERECQsDJBJCmXZybzejpugLN" dataUsingEncoding:NSUTF8StringEncoding];
	return aeBJaApwBtCfA;
}

+ (nonnull NSDictionary *)xCzcCwUANxAw :(nonnull NSString *)TVImGhMkuNraHsamHFQ {
	NSDictionary *oOTKXizLYHRJFLduAP = @{
		@"GZhNjaqSSV": @"rDNAJkNfrvEuSMwxaTZGdcndairCtfJNWnzhqwmctZhMpboucpSmqyzzqfpxeZvRTKHofWzOznnTFzvrRggVTpuLOgjpJEPTXibBbXYErUWyAPdxjBfqJfCvKgmidijqzvuwgAIoSENumcVRykT",
		@"JnCymAHcFJZD": @"jssaOUerLTxjVfyxIjywMoMRUeZrasiOOIiiQmmUHZBkPdjEOxvzTaAwQGZqUWgikLrXtOueDkhSExcljjazRPxlNpwcDOcNqCmLHORbTxOEXH",
		@"VyyJpQEgYufeg": @"acPCewPPiONxXOeiZBeKHgydQcTKypXYHaJyONvzQMsPYOJULbOqtnFGFePpQgAsFbdclzanjakSDJCvrNEZACYBfemORinCEcvLzkEDRLpGuYIKvHKXrUlSWJzQqZiGOftplSxEzOZuh",
		@"ssVJxkBehwPhE": @"vAtLqVWNNcdbhuzqoERxXAoxWCSYxzIkCbnEYieJItCWAPuMFVkKpBsoBAPyTJLCpvoSBjpQpQZuElUWHZAbBxHeYOyrkZPpaeCPlJxuZzdaELGvjdvtdEJryjiW",
		@"abLlATVFAPZnJnHtSCu": @"mbJFKZrtXEaFTPuLyECJDFGsUsLUPXCBbijYtwHHBPIJoOBgSAGhhFzwGEWBaxqCWuXlhAWniuUqZamyrfyJXxdgGpUNtRhXcnpFrfvCJqrFGMQWi",
		@"pNdPkJolHsIPvAeYCF": @"zxRXspJZMFtsVLzGoQZWeKXCzJhKIgPslyWAUpmzAxABeqmoWJYtlBdWlQlwLAPnbfOZWQowyxotCoVCqLSPrSsGdmCpovfahcesMdlsVXpqwwmUwLMPUjQekXajfJuvBIcRFJmbsLODcUcw",
		@"zcMradtAkKW": @"AkXmJUFNYxBfUUqKFkDixSoaBJsfnJeedmQIaPHzkDjxlBnuVWcXnFFgQHItjIxpNaVXRDSJcHrvotpeFykUYEHShhCBNhcaXZuRlqrjsIlQzdcZf",
		@"kuKJrfjybSJHYGATpSM": @"vXfUbBWeLDRZksvDjbgMAuxadmStZTPskvtAoMvbjNENMOZQWIIJgJPLjCVrRwyksIuIJionQKHCoGkCdiZNxcaOVtZyvSDnAiwJJjFgavWMpMTwiKjKJPiAtrENsIZQgUJcIwnhClEdiLclYOof",
		@"wfYvgkUjtCBdLv": @"KCaQLoPmWSUWzUZJLozTQQHnDrpXNwEgUDGuKIoNCgdoSvaTOibNMMOleUZSeQpYouTCEtqeVsDPZiOwGvUMwivLkcytWOPttdrlKFfFVAiRVEgFTVMqrM",
		@"RZNUMViGgDqZVraEzz": @"SPrzdblBMSOemIMfKoYyCeFIGqQlZiIqAPWkZaiGNVwqJYeIVyLfRhLUwuRqFcGeQpmClWTDHpQqzGZyrdOMEMXHDHKvQYzGBlpsLKgvomwSRYYkbpzSSOlfNxvZZIsxrrqHJ",
		@"zaqqXUxEKPhAuRim": @"ZLWWdRWLlsvOZSBFGPdgJYrTUtmuOhYsvrmijlqvMdwnRarAFECKnQLPgjrRppBxkEnfoXaERfdQajDdoedAWRguKVJPxlQaiIpmRetyUiORbhUaKdtceqHvqJGhRTBQKbGhNUrCpABWjDjMOOgcS",
	};
	return oOTKXizLYHRJFLduAP;
}

+ (nonnull NSData *)HwVoVIIdtyIbqwEgq :(nonnull NSString *)bxIruNsNrMoWTxNW :(nonnull NSString *)yoJliDCIGwGaNqKN :(nonnull UIImage *)OESaIkPmBModJ {
	NSData *TXiyMTKSqPAYLkxJuWn = [@"xTByUbZYsXcxNfDMvgyBaliFtyYTSinfhJygIONbnKAhhIDRlnJFpyyFVqoqNwQnJNGoOOEAZqWqUHyETqJEgXARblkqDWKqQhYouaoATPTxfnKZYUdFGJtSLYaMJi" dataUsingEncoding:NSUTF8StringEncoding];
	return TXiyMTKSqPAYLkxJuWn;
}

+ (nonnull UIImage *)tJFgnYhkSHzzMH :(nonnull NSDictionary *)ezWqrCauoo {
	NSData *igOZsksjaxU = [@"vjYWPMcUnqCzSOGikcPMWXoaAljrQJlbQgOXuIKNaVznJBNlfofUAeolHmRPDBCKTXejbhwOBUeFjjVFlvnzxcFFwrqXRpakYdCmObByvipzfOXqfZCdzGabXs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KZFgCoPReuWoH = [UIImage imageWithData:igOZsksjaxU];
	KZFgCoPReuWoH = [UIImage imageNamed:@"ludgLibpAlSsblqRhDcHegXzZyGIiAmCgREhjRVpleIZcnLdDfEgShhYTJQyKHnegfscbbxnmUAUBVQrvRCeXXhLhzgODnSsmGXPdJsHYKdIJqEoRsRlgHoFHRZNWBsADfuei"];
	return KZFgCoPReuWoH;
}

+ (nonnull NSArray *)UqOGPytOSzk :(nonnull NSDictionary *)bncTJaYfgygOdWl :(nonnull NSString *)ASfIJfVKAMcccyfLuK :(nonnull NSDictionary *)uXeFcxdggnwKeuZoUyP {
	NSArray *nYpKIXFhCETNjZxGZ = @[
		@"HReWEArPwwqKPpEyZNveabbatEmdxpTTcXGgKequTKdNNupuTzPNkwNPCdrBKVxPngPqlkzpgoCoFbbaMMBZtYZnJFCdaHunKPnWzyezlvUTbIqQfUUfBUfAG",
		@"dlsHPnyRylyNkFvGIMAbySyvpwBpdKZRufULkSuprMPhZaXIZPFKbyzxqdIQpFplOCQwVKVdkxDaKqwMtbqOFrDFENzzHTqdgVcyWFbksHXJMf",
		@"xJbpyVioVWyeZJhXAuCQtncNFhXsDQiviQjNArwugaBeLlpPEGUpphtBcIHNIkKtREVbDmydfHarIpcBQUfASlkFEhUjYYyUaAOhyUcDCOgSAIBYYmgFTVZavnYpyMJbqpGsDXpyzs",
		@"GbsqeMWzJOSdeqEdkHpBUBjslEVtucIvXlthAoFdhrCIBghoIePcbOLMsRLFoJubCdxjMGhmfvoMHbMmyrIOsGqmXKLmdSPZMsgRMHlOpPohXqAWASKdoaEAMlMJzxrrLyYWfoZGOCdhMx",
		@"XATaHuBduOqhWZOmICDsnbEABHDfGRrKpyqSCpJrymhOelZmWpeplEYtMjFyZVQDJewyhwrrtOMrxjiuyJxwXhlVcOaMUzHacwypNMDixJEoXWJzmGhdus",
		@"AJZyZsVJoWGafzsWjrkPvzIqBDiZGrzidPPaPkNdKHMgRxhzaHKhedViUFSAIjbRUeTEahDViRAmPkPlXowyqJvPwfrMOBXhQmpwTMrgIHXyAsvuzCARaYpvfSGeduhxLXUvDWO",
		@"HFPgDrwdukGfyCDJPprYSiaunwvwqpRbbNFjOarmxVAwOvSbEsjacBjUfLMdLvoiifKVtryPEuRLyoZSWvWmMAVdkRcmXGZPpplrUMXhhqLQrsmpEJkbtMlqmTEIREzEXDqdYCbPPb",
		@"QsDrhwczEXuRpacNbbrcrPetDMcGiauRaKCxoIajGmuAGUkkHMWBlsDnVCYfyODEyVVTrWrusYmsZPxmybUCgvnLHSLJUyzcBIzJupLvRSiMqG",
		@"yuqgprfACDUKVnUacYFImEGjwNRKUOxCZwiVBJXGKLaUgzZEUuxXattNiAjMmbncXJvxKasrGzuQLFiJvXKncJPIflGorajGGLMkOSHjwZbuS",
		@"jqLBrzTHksRqJYqjHkenkeGnhPefGbCtsHldERYThRvQFWdPQeKOyxiFqwqEVljeaMVIHNgLSPenXzNcSjZOoyZITpxnavfLLslqRUunhyLmzLnmIOhhAAXPzPWUNmXEOlyqxklpgalSU",
		@"mauVyHATTZgXaUeEnwvdJxzbDoyCpykHfuipfPvVZjHNUIEEvsrVDeWWJaHNVcqliFwjRgnwxQdPOAirjLQuhQxLjKBwxPiADNqFyomiFsBaxyMe",
	];
	return nYpKIXFhCETNjZxGZ;
}

- (nonnull NSString *)zJGJbAXPoXzqxVBpU :(nonnull NSArray *)QoqorNEFttOZeHQfih :(nonnull NSDictionary *)ocPbRxXGmzqqN :(nonnull NSString *)KDcqFnXxtMdU {
	NSString *RDPIUANvQNYFh = @"mNXEjBFMtGbjQMEXZKTvWUXRrxaQCzFlUfmArJeiTmmFZGhHqKBsnBQlFRXuDqGmUjOlCDRQTCQpIehMQfnltkEfikUwOkqofAfAvKHYHrlIRYEbUPiygRXTlrxaTBCsEdXBELITwbEIFA";
	return RDPIUANvQNYFh;
}

+ (nonnull NSData *)GlpjIrhDCLfKGMDuBuh :(nonnull UIImage *)lpOJjiJPUappdsxjQ :(nonnull NSArray *)SFWrCtzoZG :(nonnull NSArray *)MgCeedWKeYISWZxmt {
	NSData *opOqxfsWrt = [@"zFlpZBDIXoXoNkbLXinDxUXfNQOIwXInSzUemQAUGxSGBiWhhwQosiSbigOaHNvmThcjleeTNJkQziqBlRkXHuBlYgwLHWXWTARXkgIyFzmDTfIAZuBrMdsUgdVz" dataUsingEncoding:NSUTF8StringEncoding];
	return opOqxfsWrt;
}

- (nonnull NSDictionary *)tylOtkkKoWbxTNr :(nonnull NSArray *)FXgHLNRmBn :(nonnull UIImage *)qjrSkljLWcOqvWL {
	NSDictionary *UyuzWgHdwML = @{
		@"CdZmRbIcaRtKgTCgGN": @"VAuzLAyPzGyPEQSHhGqUjuPRRWBsVAYQNqtyafXWocbpCIpbakVLCjrrNCWSDLSmeklfQAUiHWWnDOBujWdnAwavazmuYDMYtXDUGOrOLbQAHJDb",
		@"tDMRGHeOAUhF": @"dliOLXlZVfiaLpYbvtvHMFQYddmuYxensTBnhIKMkbhUDnnCUXsAwRVERRIRfdYnahAAtBliMMXDBDtppNIgaxhBRIhWTLkenfxxKzUKPyxHroAMuzbYeUjfKhMxoSnEUaRqdrtPNaesZf",
		@"FboPoEVaHAFiaYvd": @"aurFeUpIPJqdxnXXKpYMDfeEVthyChrcRCSIoLToTSkuTaKyZJtPCESUQkrFEkHbyzNaQhhBqjguflwvVHaySquIyttONInOxXAxhQcNTHcfcWbSgJFfyLyIJuEnaJwQFHrOxX",
		@"CxuKGkTmoNp": @"xnozeHdtTOKBlQlvmWtppqOhOLicFXPSyHoBYnNycXtIfsVrAxJFslUxHUQFHocsZxpjrcxTJlPsRGyAjTyDhjZeYVATeHySnbxMKQkDBvvWJvKMpqS",
		@"jmKxKjWwHKpHtLnSsZ": @"FZutdQdATkVNUgDEuCbQGQSiGioTriPQZrofNAKXxQpaDzBBQePzEloxktCEGsrxySSQKMGInPpCgTZHRStckyXSjrYcFZKTrqULqcM",
		@"fgCuijQeBnulKqxF": @"PSkFVqNApUGBLhbmKqRNgEMuDZhyuyBeasufTpfooQWpqNGyDvFgnxxdzVomRKPVuhVDAsCeHUtckneBcHpEbmESOLeZHDghUTchCikhXyQJka",
		@"PFkalbdGHiuiNrJ": @"tQjGuzebJvhoJIGDfYyTAKcjoJlmOdVMgkPIdYMdUPrRLFJtOJNsFesaJwyWpOIkcGDgUGdmgDWuHIZjjlshOTRNIDFGOuezIPpxWjgglwCRxZWtbeUmbEJ",
		@"PGPbxubtKnYyvHMo": @"FZJROFkCxEnVwuhwjXoTapfzAPxCzDQVMdFomPxcCFCzseBCGjVYJcTjmasIBjhveFfFAQciFWrUJVhyGSbgjiiidLGKApxSkoQypnDrZaT",
		@"luLrQaXXmCfhpewK": @"JpewCZPrvKbmkmcEgbdXppBdhGQqgQArIlclkFiyFfWSFXiwhiwcLOQkHKndWFzqmEctBVTKDFjZMeymbVQARagiVhfqxqhhRZMbvjWCbwTwmiDHwJFcnYfSnEqPr",
		@"sFczApzZIYG": @"aaeIfkXcxjIdMKXMAiwwhbzOhSEIKxbGhzZLORqMnfbHrUIpkNLzLapmWLOYMbiAcJMfPbbKSxeeKryspirOgMCNlfiuFleZjscAHUgawyAthRnYFQYfasaoeCDCspMlmedEbYvWjvoZOpezPJcHw",
		@"YJSoBoAczumoLQ": @"VTdKLLRKOHqqSaDojmVFEzHJLVuxUnDekVVhSPRKVbXPzBmNNDTyZFtxGYsExsobTfSjoNulgJDMdECbcsfECBKITuHYKNBUiGngPBRkIFwGgCobsBbBPuyfuSkmNjJYWRUpaqcyHlDrVUdUdBmv",
		@"qNjIIMbpzFPkTCPIn": @"aApNbksfNJQHsFjayRkLSuBNcGEgDChQZivoSmwlcZxRskMTUIKLKcwJNunnhyVjHJEzRfVdRLxMjTnSvqeuKtKgfycUaUlNcwcfnSOYmUKagFOHUTpwLniKUvIHXDVgbKWRP",
		@"kpTuUveSKRHSPBDH": @"fomEDHKZqEivnQzOEpjicZBhlQkdmctjYOyvSDFGdJhHnMDvGloMrvfZeHZAqSsFdyCaEjjceBuOUUvdRRQhNHrWOWsbsgikvpElRH",
		@"wLHBjRaHsg": @"pZAzxcVzPugFSVYYWfKfuAcQYFCIDkPqhPcCaJFaoWggZcuorpbVxAMihUIYADCPuChiNRYZtabEzKnoLvDlPwOvbMrBejficHXyGNcXQoqwYkfhbRoyHLxbvOVAMOQbHjcJ",
		@"IXYGRuGgjCFdxBy": @"JpORxuJZOqHHrQCGujGATuUMJtSnNpDYxsHXZiiqDfADicsXlRnNQteNdHKsMFBUPHFGPCMVFWmQkzfoNinvGCdHSvuxMsrqFnHfgTSRiveOYkgXjITYBvKeP",
		@"oIKJMLyxbdI": @"zoXnBiVbgpHbvvfZDgDugISOJBzwGYcpcpwIcfzRngaEKURUABdtsZfdAQdrUBQebpPtQsXKcvqqokDgwzdPyEAKTNnetcqTUqAULNjqbkwFdcbTozNAllnzVMEcGSCYXRUnATEymhySlijU",
	};
	return UyuzWgHdwML;
}

- (nonnull NSData *)orOEXUUyQPxB :(nonnull NSString *)fixYUlskOhtUyycsxw :(nonnull NSArray *)YfAnIItnrnG :(nonnull NSData *)BBwgsHgdoVhsXttIhaF {
	NSData *McyUjTGNsEoirR = [@"PWrmANpQErlfHNJMLhzhukhbtDRMwSCHgbOHLcWGRzOeJXLvlGFiAfNGgPoAxhwtgAeZsIKRIbfxAilinGmJnfFwaNzdZLUTsSnpcplsfdrSlyClTgsUwpBCTgqzedxgdGXYkUuNjq" dataUsingEncoding:NSUTF8StringEncoding];
	return McyUjTGNsEoirR;
}

- (nonnull UIImage *)iwISIPGecI :(nonnull NSArray *)deVfcexrQgTinnlck :(nonnull NSDictionary *)xTRYhRaxIbCjr :(nonnull NSData *)cEHWTtpjPbPyWdNAim {
	NSData *tVKJMomyWOm = [@"SnpUQwSWiwovDJztyxcGrovQqcVrkQijkseRHUoADMNpnkYQUeCuiBpbHUgISiIMTXZNrrBxsxtqfFWDBteZpBZKNJgkjMofifmhygDTLH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bfsMyhFQnHnbTLH = [UIImage imageWithData:tVKJMomyWOm];
	bfsMyhFQnHnbTLH = [UIImage imageNamed:@"CuRPFmgrhniVOAaGNgOzuFMotceqwxQNmWZlINuRSBASiIGbwRmjcKRgWPMVBfmbQgCRlZLnsJuMpDCHrEFkgoDSwzCZEBVdvuxJYqciTBVsPz"];
	return bfsMyhFQnHnbTLH;
}

- (nonnull NSData *)YIPrLpEwXeJDHOAh :(nonnull NSDictionary *)dMaeILttPViRCMVH :(nonnull NSData *)AyUVNqToHcXiHV :(nonnull UIImage *)EIlhKvzTIfXz {
	NSData *ZpgYxbiOapzXJw = [@"giGZxigFnOKzqaCMiqRqjYzKDodKhmzgftKgFfQGHccSZEcxwRreGVTGMZrlLJXXxRdHotCiUyFjrfGIbNWhKQXUXyjFcOWfaZNmrJDSKFxMPlUncVt" dataUsingEncoding:NSUTF8StringEncoding];
	return ZpgYxbiOapzXJw;
}

- (nonnull NSArray *)HbGvMmBARauCxdv :(nonnull NSDictionary *)pxJcfnKuMllT :(nonnull NSDictionary *)POdjSrvYdiaB :(nonnull NSArray *)CzbFHDgEMPrtZu {
	NSArray *gpQfDLnlnDSBs = @[
		@"wPwHSGHrkDNZzxSckrIjrKfqIWGYhXEMkGsGUSDPJBptnLKitdYUtcVXzHmBsRTFEFWtjFWnpQTYKvsDANSQMlHeWhkXokLIpicduzXDSzfwEpLsCgMMrBpOXfnARYuFMrgwYKqOLm",
		@"KFIhzyKqjsGYbaCXAQFuhkZIobJbzJUwaHiOZbediPzlIWxFTHdJxJeNXlKkBchOKCgJkuKcoRbpBLCtxZLoecoFhjCIJZssqrPrAkLUftnCulnOYHtQMVEqsZQWyEhTBjMQ",
		@"QxCLuOdEtcbEGmwFRJGomioRqfCdGWunRFgSpWGQUeHUkPJTWfsxaYbipbKzVcNwNNZDLvAjyiKfrwWMwbjzXxbOsoCfURmcYaGHmbZNxzpWRdLGlqibhEeRYTlfAPjTKmLaxLuQshIP",
		@"JvfKPsDxdzvLNHrFkjHXOaKseUSIAhVpMtXCfEGPhKOhLtUnbveHqiVnfggoSIsbQSpRoigidjPMbYTgGJerZymMMhTwvWOsIWucLHtQjHAzWJBnYblMCC",
		@"giGAimYgtKIrRsblCEGxfiRjmNRyxeliDxzYmYpicqgpjDMoiLLUvBZXojlLJhIslKuPZzpTubPwxluOhmBEHCeMSvLaycfDCJHakSkzwxYBfrIVFiTqQoTnOkETBXTNEnAjveiXsRIIsG",
		@"lbZKDVfpbEamkfRHvUsozpBlqvRPqcCBJvDamnQbYXsrfKBcXrTZvtVFbvenSqiFYOJJtWVdnjYXXdlFnxntVBplAwPKgGezIUfxavKkpWkhAINmJouybaTBvhFBTkKoLoUGlGlEdmHG",
		@"sOiAFKOzZOleAaxChDjqBvJRWmpMFPSOoOzPfMvILWPrHwFlqkRHNgTGlqXJXJsUkbXQJRHdUtVUDxMrBByftXllOeSwlidDnjQumLwgoDeprpdKQpllEGGVS",
		@"RiKIIsFTaHgmQLYzxMujJBqoYXjiiEfDcXhqhSdNastujBarUoyteybJdVqsZBLhZFUThRDvahHVHLELoxTtlTclbJcnzfPwtuEbOpHktVpYljrqVSwBDRKTdOAuVRbnl",
		@"BrECCRbJGNUTQpOIjtOEjquoJtGuaWqwQuucZKqNsbAUWBPgPRhaVtcTqtBIFVNfvZpuhWYfiIklVRnPDzsPwchrbxaHzMIBBrGMqQUfgCFkYEU",
		@"ASXCCPfUSybDAFOkFZqqvniNZprxChbZQzFHNNuAUHdcPVwlMnBmAMteGYArTKsfRUIMVQBdkHxdJWARZsMLLONSbVXOVkXmgHMHmYiJymFBFKDgYiWBfnMXSvbaodLdRfifapvIcuGsGGjRrW",
		@"ACDlqYAtiAlHODgqnBwlLNzSImBCBUHiSdhOJqUfpHPLeQXMqosVgPAtzLCwpslIgbiUmVHvsfWxxrJIlcfBXHWSuLjhhWloSQyIEOSe",
	];
	return gpQfDLnlnDSBs;
}

+ (nonnull NSString *)GnlkvldzoPqmrFPA :(nonnull NSString *)ulssGZWRGDPqJclSS {
	NSString *bbbgccIdntHAS = @"PtYonHYwrrbmOVxzPUUppfrSgLGjXKeATDXCjXoFQXSdoDKYPuIuIskYxQIAFJledtzDNVMfvUZWvnUaXOcjozvBQNNZBStsYGxTbStrmWTMGPVCPoKnuMSAYODRmwtgwhABMsdIb";
	return bbbgccIdntHAS;
}

- (nonnull UIImage *)rsunjaOIPiU :(nonnull NSArray *)wxEiEjDPsDR :(nonnull NSString *)HYBjpsBZzcXroh {
	NSData *QbKjdqBPsc = [@"gJLPuwbYZcbyXBkgTWHUwcFzjZvifPXaZHaAwqbyvCQaYcpdiaZwoOBwjulDvrMJrxFoVwVteuHlzadsXhnmGsNLmKrWhbFftMhErO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yaSbQVbTxknYgfea = [UIImage imageWithData:QbKjdqBPsc];
	yaSbQVbTxknYgfea = [UIImage imageNamed:@"kmaltZIKqpRwcEIoHFQuuFNEflMUEZwsALOSQnUTueRniQYaHXtrMtpIwSeXtztORbVqLXyzXJGijOWjbvuEHfxAGfuwuzJdeRIwKtluPBIJapaQHEnufnqfVNrKCbXUCbBwOEsgAPCcVgwgRx"];
	return yaSbQVbTxknYgfea;
}

- (nonnull NSArray *)AZShezQvZWtIp :(nonnull NSString *)CBvTtHEGYCvh {
	NSArray *SvLVIinsijNoOMw = @[
		@"zuVxifwvvlwAqNBYyBtdKomohdiOiESJneFpFiQHuYVZNxPhSJIGcnwCFIloKcEARlfydcFZkySqApCvUTIWfEPJqYiZaTKyAoNlgHpIKCYYboqZGRVwuWyhXzKpUkAgqjbkzfoCk",
		@"QfgYyJWKHFuncdkIdeTiRwJqEakrZMBxuzwaNbwppppAdWFmgpUkLqOSoXXEzLDlRMYhZUhVJEAmMaSctudemAVntGySvLlxAiWMTWLALCtLGvESclRVYcDzszoYGpzOKVzyHhuBeZzHhdL",
		@"sjEkfkLkMNdHRVSudwNbQrzJRIAPrfTZjIhkapZncvUrVoFzXWWRWVpxcfOGfCioveYjghlueFmVcBgeBgwURKjLXAaOXGSWnTEgGLmxQnvDyplcPrmkmgTwbNUZalQwAPVzBPxEXw",
		@"qceRwjOOxOFsLyGIWMVcvsbqURTcBuGOtDAnOotvBEJqqwsNWTfbsauGpJkHtBiLuChoilUxeurSIUaOVsPAKFEtNJEpdNantZcyDoWOxNmbsoxiFalbaNREJApQ",
		@"bbQQZKcyMbVYjDGIufexFFWLyBIHSfBnaezlAjaFGVhOEiNlFmkUEByOOwRVeoEzIWwlipBxfdTNCTKWPvGkVXsBHxoDuRdjjLoGZsCpTLennRtbDubxNGDtpbAIAlf",
		@"oyaqWVqFLAxQgciymBWjiFqqExdpHsyVqJawLvezuvuzdGzfcBzSOEORpqhjBjAbaDqaHouXPCeSHMKzhxIJdFbPmkOuUnomqgBqehMiAPqVcggtDGpKxbTDjoqJ",
		@"SnzFzvPcbxQRmrdPfVfzYnspoSCDmVsHNvUAgQXaUbcZtAVGtQrVOhxtAPIEijnRrBejGyZfffZSXvPKojTdnuseHElZFMEqllcHBruhvilOMtywuLAhG",
		@"kHhUOwQBduzBsNndXqtWmwEelTQBxVCtiSWsoUSRmHZHHWNmyRJGbPMtVxQoSOSsiGOogzGMfwIUFJXzpBGSICOdNNEqiqiOrBywMYeXwkoHysMsgkRbdXuQBQoMXetHCCpoOLFYTBxYiWJGQnlmd",
		@"qEvhIjHgtdcwnVmsrUUtmomPvFHdSiRBWauHTcrMQpAzBtstjoWITrQSjFBJdcJUnYzZWbljUbqBsAOdsriekKcovogzSpVuxcvaDvZzOC",
		@"toYPbwmTakmbQZopLTjvqzWJPRLYdQJoXETsqqwZLRANeZFOqGxaOJJJdwJKeopKBGgEZtMZJiyeaNkJjxEfjpUCZQHpgrmktvCmzOYjcmgWGPnmKXBGH",
		@"LZZNFeKzcmMjECIdvpxXsFuxBZTYVxhojVgmWBpgDGhZDlXyUCMNeBTVPstKFaoJzfLMKOApzIdaEFSRZQDcqSGZITjdCgjWBTksfSgLrAqN",
		@"YUWfkyDuYguyfTLPmmriuhNitnMvlMbMDdaMpRFSaQUEjzpjwbDaEBbIRgWsbVNVDIdQIEhKppCzntDvpwZjnXhlEzztYQWFayDzydpcByYJdAkMeQpqcOqzzfQeUcas",
		@"VyKnoTdmkfphXzRAZeDQJJvYLcqVkVMFnAHmFDoiXCEiAeuBXhjuODqxrLqnuHcqcmBgltvBDiYcaJGHwxKYdNMqEdbfhYPRpTAvAzawUZTnnaUvcoRA",
		@"shlpJybkvFnkzvEQSWsCVKTgHTdyDpfhJAnFEsvWCwmpcCtpuSTubOFHXiIhiLRgAEhBDKDNaoevcBtGKxeGVXQvpSSdrXxbPNHxKUhKzXKVPTqteKAmhlRsmQIMwDSwKuonBj",
		@"jxgAzHtgwoIHdNMEAAgEbjbVAWpmBMCnQoOeUdmgSEEKObLsqxUWiAdarezlDzPrjGbrdJRNWFHGYbzrNVkjBbwIiKmHpAzIkrmBpuTr",
	];
	return SvLVIinsijNoOMw;
}

+ (nonnull UIImage *)XZNJuKvLMDprwSBpmf :(nonnull NSDictionary *)OMypNCrtGsrDO :(nonnull NSDictionary *)MXddGsgfsCZ {
	NSData *BpRoHYZIuQoxR = [@"GPBCrNCmArzKEDXHbrDloVOqFhWAIFRjxbWomQdowjGHjUJhJHpElntJywdotWMSyOnMODQMmVZfLxQouuJeitPOCKAEdDfoBJkFFmsKSUYimUGWZEiFDvsOSq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HbxpgbmfIc = [UIImage imageWithData:BpRoHYZIuQoxR];
	HbxpgbmfIc = [UIImage imageNamed:@"yHfGoWAXvbIDiyExyKKbugGzuWUsdOezNQmgsiAKJhECVhuglPQvsTYVKCRPtqLEykWXMFeDTCtNNRamKhbgWpEbKwskRCqPTVNrZAKmU"];
	return HbxpgbmfIc;
}

+ (nonnull NSData *)KTGxfiDbzPmU :(nonnull NSDictionary *)xbNSMyNtoXSybCkHULV :(nonnull NSString *)NCHndSYhHBB {
	NSData *TAehrnEckuFreMs = [@"rIyNovlcYiWjzqmumbrwTzOSXYUIIRWJyfJdYGjAzjTomikbLxaOHdZVtjLGADOPahRIovdFmAAdJQySGReZJEZgIwmLcXMrjAChQPbXHACxTOVySIHHufGygkqCdWoRKjFfoJe" dataUsingEncoding:NSUTF8StringEncoding];
	return TAehrnEckuFreMs;
}

- (nonnull NSArray *)luTGJifDTf :(nonnull UIImage *)PZoFOEMbYUKdI {
	NSArray *hHeofiSIBrde = @[
		@"uDOmFAGfNMaMfEzxOldPMfWRMWPVJULzbmlzFphAHUcraBiusCGoHCaUPaAgpPgVGzxhAbKZuuPJbIoscQiFnJiTRPPXdWeToohJPCRXZzvMcmgNOPuuOBjCb",
		@"gleWpkGKEDELrjOuVenkGAOWmHhczyJJVZeKCbZbEhaWCvfMXxUcNCMskzsTdywwEoVbqBSZUpKiNrwOCDgghzRhjZAhhTbrAubyTUeQVhRBnNA",
		@"novQUWepGpCCwWQSaBdhRDtmwctNCNUmYpICZmLjTVuHrkWSjUVjtzLLAKsIEzOTbpDdphqoLHUAauneYoazLgmgxVEPnRNMGKuUeOaguhUmNEQOrFWnNPauQtXFkVBLbAXGiDqlI",
		@"DqIqRdtkjJGBbuAxlghSNKIVKsiCwYXIOPfGNQLyeZnPafeNxTXGOmhumFlvDmfHyiyvTYRshSOoqrtXYrUzYklFspVtZMMWbAAjsPwCFiOTxitpmyojxaGkDbKRnCsFahdpIUUimZWHpmed",
		@"RjFVbDPLnCxQHAgdVBbScFdCbgiEhQERdCcgPXRQskRxWFSxLKRbZeFOGSggnzOMphyNuuuznDOgFhhcrqpvdQazfORyTSsIydikKPArjsltyOxczPuryNnw",
		@"FIfmcOdVAUcelKpGDBXVNMYvlIsZXoaWVLBXtJruxNtvQGreWqgXsFgRSCpgSQbboHyIvCUztWuMBXYhjsexWUoNpFsusQxOgvHhqQkeEXuU",
		@"MoISBMYUeUTCccwjgRZlmUqhfwGnzEOJNXsNWhBqwVGdTdVuwpcYlzcwcqKmcLKyKUKJQDbigQaYMJUWlsDilJkZPGQyiIswSioHYhaBlbqkHyjYusUSSGGkdO",
		@"WLATrhIAwRLDXvxGmoJoqvvskpWreNeNWOlPJDJgspmJVJSPdqmIixzZYdjxggGzycqxZFWlIqSQAacxmDNMDFODXXoCEMJeKQejvHtCPgSmaD",
		@"LmnmhYlbjDToHpUdSLvsOuInhkkStSZNkLesMeTxOyeGOyIDFlvXfetyQRMUutwKaQLSAgLsfQpeXBzfbcqTxeZjdzhBxBUNKPJwJhbIOyrtFEJCuXEgQOcieHGWdejK",
		@"pieQvEMErkFAinYUbSLPjyjcMYLgUDzUBcCyUQdfoqIEiqIpbcvIHrdveUraccVERSWkpRbijLiANiwPLdHoYkWtpXfKJYJLZhzFHgBemfXMIYBlKByI",
		@"cgpacmqQslgekvHfSfeOAnHPbuUUGwdcVsUCPgKxNNIwHOLUExPqWdkOHkFiZDqXEMHAVZlvTvfHBYgmgQCWLckzQUpBWfzAUuoJsetLTVDNPsRPSqmPjwsvdUbmmMzTiWjrxvFNEWjZObYqatFiI",
		@"yUjczCcyJYjwXQsuFfvoeidzOQUnKvQXyXoCZABFjeVGcvfNOmWLRqbukZttjhGWnIOqsxlxzykYOJJIGYjPmkxVLdTBcdSuHvOmMTGLyasQdJNAnFnqltluPGaWioSZdCZnQVqGMvviOwUOfDJp",
		@"TgUZKGjgYsRbAAhqfUyklbjVOfLITmHwnYLSAPtkKYKfTbIKKxJeRVWYNUstNzfCKpAzZaGtUcNjzZBvKIPAlbNWtmrCUjKmzcEjwDsQwLrhhbRPGVGrkIPDkAKJWGIaSzuGGKMY",
	];
	return hHeofiSIBrde;
}

+ (nonnull UIImage *)tttQFUoKUk :(nonnull NSDictionary *)XKnTYrUXfg :(nonnull UIImage *)LCdzNfQLUaaJbJVIkqo {
	NSData *DmbDDOcztNJsnGI = [@"dsbUZrJMaEvmiylQyRRfOFtYZBCsVaLhECtZKiIbYcNFSkyLHvTedxYEwvwOMlpdNFHqOcyqacuBWBWvMdvnmbZCEmtNpGGBGepyYJpydIqDHKFNaibCeqWzhbqrTMXrwUmgXrxfUonXxFfadLBJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uGLFigCxSu = [UIImage imageWithData:DmbDDOcztNJsnGI];
	uGLFigCxSu = [UIImage imageNamed:@"TMJGzboZAaSWuUPelmeARukiKCCuaAuYizdWvqZacMKyCklbcpFtJyCCEeBabScCzMBAlGQCkJYwEobrScOuAjIBkcsaWZRoOIFmYAUomchhZLXLlVxGOmfasOYpdVsRkwcP"];
	return uGLFigCxSu;
}

- (nonnull NSArray *)OlNWRtfFJdSuRrUJxuo :(nonnull NSData *)kMfJwavIMXF :(nonnull NSData *)EJGouuJsdB {
	NSArray *HOOanjqWKRgWqo = @[
		@"ucRltRLQoYPWsegjDgCUZmPTyCfGdIKEYKFWwNUJYPudAXjkviNyPDALCQippxQelWiXZuHJiUiMvLQHdXDAhzgUEclOecDqCRaVlJ",
		@"yxZkNtkqrDFaoTdZlAgrKGMKfoyFXLktRZeAWTXwokjeqSfmbqDcSMqQgPbJMYQkMPZVsqdsTyWFUDOkRkEFARiIDkAnETKhGaRlWoi",
		@"oPWJVGLjeaPHATIvNotQYwnyKrhFRtZxdkhTuPSHzXTntLTQwvkgQTZuhyitrmkvRxyBYNnHZVCdMKQrGkvymbjetTnKoCVUZEoHqxtVyzbaTeAfiVFUntgCXDxCFJCfZLBHezDPURUALmJZLZnpt",
		@"VTuuUlsXKmnshRQstjbDRZtIXVZVKrVtFVxVwBhAiUaYOpkUUGNnBSunEKDQVqqPFihhWgLjzCYxeDIGihLIdynUMRVRHNZxqALXVyRInuqUrNUViRaAYxTJiXhpolbbiVSuKRwzNtIF",
		@"pbTtfNfamgTxOUyBNOmwNHrdLvKrSCWQLZucGjlFFygiWiEhQqbiDrlJsGqCygUEpZCSVtnSpUsLsrTnpTcQkMhfIraKPQohSOTkx",
		@"LpzsPrTXqpgrnOvYmyrIKBsvBWWYbBTpgLduifUTiSINZWsGixQKqJFWcjcppxsotZHMvDbGDwCiHZGjrvQBRBDqfYDptOSwiljcGvxxxzRevSrvTvLVYzsISsXyjuvCFEqMdyxJDTSDhgbP",
		@"DoMoHehIomsuCOPVOaautQjOpOyCoQEoHRBDKRnnmKugNQfoIlVIzvgxhXpaoHlpXOENRXYWYOIrnQYlYpnHjLxnScxcFyJQZeFNXwaBYDkuPGaddEBMawALEPVkQLjzrBOfPS",
		@"MqCwqCMggXhjDkDVzhyckEkKUIxutdsYIwDMulubaimkccxXctnbReIJVmGRpVpepHUhrKOXapnHENldGbwpqjCKVSqaWBWDxoKfJhWbMqbTKaehsfpeQkJOVTeCYy",
		@"BNQaDLYNfaoLUdKljtmRLFKMcJUwvqWNAeXoFUvMCVDhUxeZQaTwceWzRZqoQrqBRUUqnbkjTdNDDeFFEuSHctfXLZfYjMjGnqoJhvk",
		@"oatIiUeeNjgqRBnrNiSgdcWsXvaEUjWklmGhEbyxTPEFLmmHIGIRkeDJiLKayBihDONqblnumoGQTjSnhtQXVSzSyKmiglExvCQJWVFFvINRihnMjXOmRqYN",
	];
	return HOOanjqWKRgWqo;
}

+ (nonnull NSString *)PIjAzFbWSXTHQ :(nonnull NSData *)CjLJCLYUJqtx :(nonnull NSDictionary *)jVKDUEmlTUnkPytcRPY {
	NSString *MYsfJlKfkdAxjG = @"HviDJbBsdyFYmLVROqjffMZIlUyTtCDKgBWDXVbsmmBOFDLOBiuowrqRSbWwvbFqXhXoeMZxNRyjPggDzQzarHzdVrQnOQJZnkOnXWXXOmHYEZl";
	return MYsfJlKfkdAxjG;
}

- (nonnull UIImage *)ArcKHOLXRBhi :(nonnull NSDictionary *)vJhZHYidzRE :(nonnull NSDictionary *)DmmcTuZyrcUWnICo :(nonnull NSString *)NPFKagOyHJr {
	NSData *UBvhTiYxNXfTWw = [@"SdwZTwlnbFOCtjvhmvFNUOhjsJgchcphAEqGOrQNdbNhAoPLyxWVIffreLgEAsnCqgbcBBaZKlzumoZaQZRiocQeHORcFEdAvSbPkOljDFRtaaQhWYEzQBoGvlCEZQBcaVtDoQIfBgiKbLHmOzT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jdMERSpagqDDbBl = [UIImage imageWithData:UBvhTiYxNXfTWw];
	jdMERSpagqDDbBl = [UIImage imageNamed:@"yZBvDPgzztdLEQpVOpGjSHbovQkYKzbeYwueQsHNFFQlRrLgqEFMZYAnkFSkLdKsgMGfVMiwwciQsCUyyrQBojmghuRetrumxwzCvXdPtbvDixKVqqTDRgbaYbSOcFUZFiFYFyoKLEnctvHiqJfCX"];
	return jdMERSpagqDDbBl;
}

+ (nonnull UIImage *)npnyNQYXuIuQowhND :(nonnull NSArray *)cnYpWmmFlAur :(nonnull NSData *)WlTjMmjDnARuDVp {
	NSData *pyvQqdRgqFtG = [@"CFhTETULnSLzhFKAexnmkzaripIHepXCbJwcnwLfdStAzINccbpOMrWkbBsmgmOhJfDYRvIaebVouSoAiYMmiIkevjQXJQtbHezzEIufRQYAkFWcf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TeKadyFlOKQGxRcXnAG = [UIImage imageWithData:pyvQqdRgqFtG];
	TeKadyFlOKQGxRcXnAG = [UIImage imageNamed:@"knaFpXaylcDPAOlOMTaelopcgoPrHBYaaSZCkYhfiZkXMAxJBFTwVSdkJdLsPMivCqZQtQHgLqeFWOkrpDEGXnkVYVPrGrNymxxqboMhOVLsMEgTxQmAEDTTycORynABZDLFWvJWbM"];
	return TeKadyFlOKQGxRcXnAG;
}

+ (nonnull NSArray *)nPgvpRJwUDOIQM :(nonnull UIImage *)DueqKoKuIunegGF {
	NSArray *gGpqMNoPxLC = @[
		@"QEEStsBOkCZXyYGepRTuJSjrUqocetWYpohrVArIHEMeABZTrVYRGTGVxtejIeLigXzOedbjsigOZTqhDRuqDasTmrHpupbLLovuedqsSYYxqzHG",
		@"ZmtRYvMVqFMtYNPSgMDTVEpAwIFPPdNeKtKwKaWQvcTEQmTEXIxOaAzTTkRkEfAujyIPGmoLbJYHKBJSWkCuBrubeBojIUUhABiZVpfExSGQzRMEUcR",
		@"cuPCBkFmrHWiUrDBVFAHLCOovjxiZoMwbhCOIWtCktSikyUvRvRykTLADcufeztWhBRRTEyCtaWlCikFXXxvItCquKxVcKgDBeLCFrPiRvJjlNSdbVpKkBaVAnsqeREtOPBbo",
		@"XNunxbzzCsntLvFeSYbYaRsFMBYqZQcZFeRhYpLiJjbFWUMShNoqllRhTOYsySSjlTWxTvmfAGGICULHgHSaEzjkVFLDKepVTvtwnkKkBCkHAMaCEzojeysusoRbxvSdBGnyBwuB",
		@"tyOOnYNYHjdTlKyhKhPVFHFZDSAYDijdmuBugZTqhMWDPsmaSWpTbKHqjuTuXFgFBGNORRZNjFqRVUdpMQlbZlsMgPfsMBRIiERqRxdF",
		@"GYyMRCJcYqcGudyVXpMcANYHcfgMvbSwSMCHxclkqLDlqyQDIyaZreXQHSHCxnRAUeewrrasxUmSpGQzTZaNXORlmxQyyjGYONcqKNIXtkfruQWyutL",
		@"HEdCeqxuRxmZIRVsfMoRsJWShdwZXANbUuUMHqFbraSyOHPvDVrhqQJPFakVFlSzrSPqJyKbAYXzBcJlhZrZJJUNFOiVCQjoPQBeYUHbuSAFRCwPjPumvskgFcLUFifKOYcMapYDpfStrPnvif",
		@"SIsOohdmnJQajqnkJfzmlvhtZQegAhhHGTAKVmKaMirHVfizeubXmYEEBJnVEtWhisZUViuSrrCMiQOYVLAmsaBCjQsXbKhsYxtycsUBbyiyyRfYSQfaAAbVkssDeB",
		@"aDShhnYlDWpJrAAZshHvYNpBLtRSkZPnwRTZCruqQaAWTfoEpLOqkveIByySFuXUJgnNCgslEgpZJxQxlmiqEGzmKmIufxsTiYxkofDzhQsYlgIS",
		@"kUqQRIPWnGSGJzSjyRsvzxeiLGuKptRhelsXUyEovCQUsnSvUElkPUQpnourZPzNEfWZtMCArFjHcXPciTSWtkJhuwiYmZxApdNUYHwKxaQzKMUTdvRqYDJLokTcAmfKfkshOQQLbE",
		@"hCBKLWKEprvsCBjSVRgVHimnmLgYUKZpNhRdlcZrdQpvfEPfmaggeCfXiMvNwGuBmuHcLiXxjxUeEFxQaVDCJrZKUIuByOLsfQFPtJdtWWeOywQzVhxJuthxTFTEKSHBXiAKnPoxmTGFaP",
		@"bWNVWfDlpyWZPvaPtNIDImurbarvVVfohjLZumlkfrPLxgMXPzNXxBKLFXoCGevHfEOJfZmxBqVNBpJpgqARbclkFyNwBaAhzhczMRClpfYEAgSutdhlgFImetdbHbmamacvGadx",
		@"ZbPrURLvRFTcQBPskHjBOMJfsJekBmDGXtVOFlWrDQWNDIWptogqOfumenoHIOzjVdYNKvgqAdGyNzwONgMfFDsQyvivtnrIkzeaAzxdaxCooivMhlFfjCqjIMRRmxeYZ",
		@"ryiAoktGuuxKfRXnfciqSHUycZjitxrRlsbTbZSOSaSFXUTyiwycVJVnqoIMGqNyxPlLayjFeOXpjQqqmVstFFRBenlBiqlFvATwhizPPhposwXukMMASIJfoocqMLctiMJwAPABqBRRutuxRbWv",
		@"SfWPDXMruguldaEEpITFuAmHdSfxWaauzVgHbyxwPIFLpBmwQbaBWdJiTODoidBFpNyawcXshKBzbFENLWESWcaKudElwtjjVqorHCoZMOKxAULoOLrwACqubaRIFkCmg",
		@"HukuuJRarieHrTrflsWRXnmrHwSRaLGECdAEfpHcSfXqAAynItOoKAhFFsrRWbHyjBOwCrMzBFNEujHEdgQXeieNpAwvqMERNcfzoteqgyibyUtBYbzxuEmXANPIoPjTANUef",
		@"evNnyPmXfOLxjlfcXbKhUvChDDStUyPDChWVXdtddXjSzshapkNQxulhDaFokcZBZJtFYHzlZoqNzKRKQHIAQWOgbxWhtVHBJzje",
		@"waagVjfwMqLysmzbdBsovMgPbTNrLDTTZqkjPZVXkdADnxpOFIQeQNyoqqpylxehHXFXRZZsiCwTYkdzKChmAcoNaKEJkgyiGDcvHxVyqbogu",
	];
	return gGpqMNoPxLC;
}

+ (nonnull NSString *)llQIUUMpID :(nonnull UIImage *)FVTMJAiXlkf :(nonnull NSDictionary *)VgzmNDVGmgedYdlsDJ :(nonnull NSDictionary *)mWHpetAKiDuT {
	NSString *cGNbMLTXqdTLiwHP = @"taeiXqbjNFLoJZpRWOcKqOINhRyjBRzFTilTKxGPrqONpsjtiQUnjlcXCRptepsFefUOidxlPzWgmnQDAGsjaIILiSNVRsyolnmGaAqqeBeZkYiiobUGQLogQHQADnyHEovhBJvzyZz";
	return cGNbMLTXqdTLiwHP;
}

+ (nonnull NSString *)cdELtpRtFENNIDzMe :(nonnull NSString *)SoQYWsqfcs :(nonnull NSDictionary *)hVoWweevPlodDc :(nonnull NSString *)LqLUERwrPYIYDyazXVE {
	NSString *xFCKlEEPtQeddHnRPhc = @"zyzdkaSAMYfTdNVUCxaUxewsOSuMprMCPfLUKatpdrNcvLaFPNENKDQybCEurIcfRmNilojFKHsvWUipfTxrFrSkCaVvtkoNyhEqbRfLeIfYRVDLtAQyjxDxxdSIwUJYfzbCRSQJTVbesFTWca";
	return xFCKlEEPtQeddHnRPhc;
}

+ (nonnull NSArray *)OflbKUmXgPliP :(nonnull NSDictionary *)UQVeTTfKVUoSgF :(nonnull UIImage *)ZFOLXNIxLH {
	NSArray *FQBssFLNKXsQhrdnaVR = @[
		@"zMQlEpYcDCuTArlLUmajwFnmMyQnANIRbWMpVXDGYDmWGPesovblVsAzEzqOeraclMedCQEopscAMrMyWllbAKIagkiaGCiveRPEUJbgaAKoiuTgAaMm",
		@"BGaPCqvKvisoDcwvMAMHrcMlyaRpLWoLspYZAldgZGaPVUPNXECmkYKvWqWHUfjKkdxYWNJXTunyMOtdoAJzescRnSEqDsSmpnVTIKbySWdBcnVHz",
		@"yFHwyirscKAtGIkeoDxFrczGfKBZcxuMdEmalTOUZYMiEJNIqtIYOTNlOYzgtYKPKyhJtQlLoMnaOfadZmmSGiLAyxARSWZIIDGoIPkUvDuMGgWhiBzIJngajmXLHFxPATHEtyYxyYwLkrzIbFQO",
		@"kbdhkehQtfaFDAiWmrKrYWKcmgixHwjGemtrYZreXHCsGhNDtfnWuvmzblSyNNhwpYUAlQlmoEdQXmUkcQGcKaNNFFYHnsegYEXIkHJICJXnKInopclJnaYqLxnWOkBCUbhMtIaPjjHXGbzFdY",
		@"hwxdQZiTKRDDGRtBlhTLdtqdyhuwXSiUNAhegnUVbVpiUSKHilUbDqpkOzqjDzHXfjZRRLSznqiehUfwRYFUhBbdqQmLryHFfiMjBlU",
		@"gUZFzulxvCPeTTsXQjfIvsgtMcQWxbEHWCVokvwFsZqlFlWvohJUTpefubSShPlcGhdLstyhixvPkZjnxTkIpZRjQrVqWcucsaqbnkgARQshyfdqkZcaqtTWlBybyVlmVwOo",
		@"YvfIGbdtmsKHJvBdfkmFexrESTygOsAhPxerlcwctQcqKkBOopDbxVTohBSHCuXwACWLKQLLAJXLSXcZMsEbouiLPaDKelWOjnIFKPhkWepSIwawjak",
		@"RnkoFZCIkFxfxSUcFHTLuULmNvPuIlYcISYPGiXmbBchCGvMPWvjLniUXAvjcpZINcJKbRzxdkdlsBcHfwfLGpewWqKwxdaHxghMVHFEsNpZfNcWmwk",
		@"ZlOXnwKzjZkRMPkQEKZKNkIKFnftGUgxnlbqbdDMjzWBGAdwBbYrvBaRvpJMWCbBwqxwNPDYlgVnxZnAgsmeTPeLpkOwYhaNXwVFsrwYMoWZxaANjtPUlQqRrHZfbGePbgoDhwyioprelHJW",
		@"kDoLPiXHYYMGOLVadTlxKQNwFZlBGSPBFDOCobClViYSivXiAhNHPRgEAVvqBKaOOtOMzPFHljafFYhZBRATyoIiJqiBRBGIOiqlrxJa",
		@"ndhGFIdxIxxhiOtCxetdYxsmYqSpOJGXhBlSPfutATVzoTETfgDGFECwsVwzMBnJzSsnMYzuoSGIMtWsFCWFllpTurgVISRNEobRDuwsOUHLMUTRQDmfDbH",
		@"axkshOBqOoxpxmvUWcifWdOtVKqNkRXJGuXrxqaWGXdhvyyeJlRDledkIjvajrUjXBqcARMDSWWucdYImpTAsgwpTiYgvdwIuSpAnWLhwmcbudpxipFamUPIZkUJtlvyNfGHKJCsBvkFrFsUHJPqA",
		@"CqLkQipbfnWrhpfHdzcfLCwafAPjlMzTkMAQNldqMlpRymapSXbMPYPseshbxediLLUfrVdbmbhWnRjMpmXPESnyBgGUfPhFeLfZERQmLRENtMmadNlzvPdsSBxXHbyDKCuGhdekWhyINLBq",
	];
	return FQBssFLNKXsQhrdnaVR;
}

+ (nonnull UIImage *)rMyXiSPZzd :(nonnull UIImage *)yMKqeozscfGhczQiNQA {
	NSData *YzCeXuzAeoEAYT = [@"WHFqBYGjuJNCsuHgkeksnwLXRJCrSdAhpVKVQRRBAQpYPlbyZbjCmNIpOYjxrxFibrWjhbxzxynDsbMYHjGaLxtTJWcLPDMjLQokTLdHnpYbrFYgHPOESnVRRcXoerXkuueTpgLeObBRwT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GznnjqDrfXtug = [UIImage imageWithData:YzCeXuzAeoEAYT];
	GznnjqDrfXtug = [UIImage imageNamed:@"ggFkbOFsKMQTaMlQlgRvkzApBrTYZTSwbOLlvzjsbCzRxtRhGbuyqTmrxvbWxBmETVbEUYgcQfngnFmqWTVtosPihbCRhMbvTczTauDv"];
	return GznnjqDrfXtug;
}

- (nonnull UIImage *)JMStoMppfQKF :(nonnull NSString *)xwIqNmyBBG {
	NSData *iwAnoLEIVuNeStA = [@"TfifVpXLuuqnHDwfyoseLxLAeHNQikVANYmvSoJqVRJNMfMytfoiJNgwqxWUcpSjAddFZdipLZHWQYxofgmOXuQwfvxdWkahRElVgFODOKyVmvhyCjPdiXFeDMKJC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QLwVQZiSPbxNnfOIhij = [UIImage imageWithData:iwAnoLEIVuNeStA];
	QLwVQZiSPbxNnfOIhij = [UIImage imageNamed:@"SUftXkqDyYYxqjayDegBkdnfFdbjRHAfdXUNQNydraxaLXQDRKjbyQuYkpqrqKowvrDMdlhsjdHqvfVEndCCaGLcJifsClEtmDYwnAdjZGxsqrPjvwGVqWADWWtcXrIUfyvvZneWZ"];
	return QLwVQZiSPbxNnfOIhij;
}

- (nonnull NSDictionary *)IKexwoCuaGJmKOmbzJt :(nonnull NSString *)BBKMTAzdHMhLR :(nonnull NSString *)aLeUUilwsPwQFl {
	NSDictionary *hCeOyUYwjiNF = @{
		@"AlsUJvOunpWPnHF": @"vBbSAuYKxyVcZmPnAzKAgNMzRsIlMSwhLewqjQYgPCOiFPiiPsyfngRtdbnsGpqrkyABwCMzcMgARiNTKdZYzilCiDwMZDjESxTCyXUJvKXRpi",
		@"yTNcRXcjaTkznKUqD": @"UfjWjOjgbaubgRzCzWgkuROkAKbOnHOwXaxbZpADysSePDFsELdWpioOgWuOJnYlCbpmienViYJCHvutgAcwKRDqZajnktDWwrYrJyZTMKPQbsgtfdYcLBByJyNdEzfICEVCNHULJdPV",
		@"qFeEJoKVPsP": @"GmbljjqzloSOocSdmgqxIQAZVUvqBFBTlCgEoRmZnpiQUGLmVCbsSTxLnYgMFdHfDNolqNFuoZCZygnyfXfuNXqETyVSXiRGzwujAvSivIIwzmLBSvRiTJNhuWOeEMuDANbHlsdBZ",
		@"uigjzZidFSFPX": @"HMjVadBPIJOtNDAKfdfcNluVbDkdprmiPfRVhinAUvMJGTrZBuRMRLzuorDoxRbujLVMjzMWuLmfVemQYhZaoUfukWXpNGszaxDkgEdyVtzDf",
		@"iQBQqfbPeIGOD": @"hFFhWRYtRvhZrFtdihAfUftHsywukYyixavtVozoCAQtRHxifYNtmMivEQgpyTYifTcGrYWMXwwkkRqPkasKCcfZfrACnDOghADrtNcs",
		@"mXCCuFbtFd": @"LUsHSrGvZXmsyfSxxXkYpjYYPykJRPcNzAaWxbbmyVaoHLMdFZSqaZVoSnfNIrxIpyFAKFHWqHgxjDZOUhpzMJGrSzQdAmwLMlOOmHNwwhijqeErhlUhfdxPdS",
		@"IolQsvCpGtSS": @"lTTkKHLNrALpqqKPLmHbcOadJITqoXQTjGiguzQLPrqVaVMzbZeijFcroZGEUQUJljMdJxkEbqCmhGMSAxkmfNYjSJQvwgQFYQtuBTTgzv",
		@"yVNPFPZSscjfCkJkdMD": @"SNEaIAfLNsiypNtSUbzJDXnhHlSVMGZlFmijEbEjctuUFdytoPhwratAyJpdFnRcmhdUpPxCAYBgVyJcJqIwJBepzRPooHQmiPxQrEFcUDFrMuzzUBNDbfSjElUvTZcoDE",
		@"HdsBnxKHAiRDB": @"MtkPeIobsSeHqURZCMqbkyumhvLaoIWzukTkhYumcoYTMPdxDngIqYnhEjWbFHWuOKbmnuZAiACoHdfWITDBvxaXbEPuGKDRdgleLYKlNBQXpDoQgfVWskKCPU",
		@"bYTDQRQMEOaR": @"dqaEvtmMbRSpMygYLiJVRirNztULROvbceFKhKrbmQhXUTWJLCRvxWaLimnVvgvLqAaDSacgPlYfviknpsxYIxPlIJMsfRLtvaMJmWmfWLqz",
		@"ZtaHABUjfYYlN": @"AvIMmtpWcZgpsJoHCJMEUzVmMPaxSpzVTPnqUIOQtsMeHRPAnYpAGhXLkJsvnQWHInhgwcQgAdGMrjUaKOpLHKRZDLkpSljZpNOiZwBpjztRfezNGsakIxP",
	};
	return hCeOyUYwjiNF;
}

- (nonnull UIImage *)JydEEmoGAmnJEOrPufP :(nonnull NSData *)HSpjUZFrqtF :(nonnull NSArray *)bxVgJyphauMyyj {
	NSData *OXRNFtCHuWwU = [@"urYIJBMqOhpDyjRUFnWIEDKFnbOQrzMnMQTQvJFuYaPNwapRkYmLsjTVKVkCdJPSZDNUrLKoXxDdkYqRbqhSoGDfONYtftsoCKxZdgqcMIWhSaUMmNNFGaPSABIQadkLzBwRGVuqaOiYIhfoBQHIa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LluHjgAmKSWfV = [UIImage imageWithData:OXRNFtCHuWwU];
	LluHjgAmKSWfV = [UIImage imageNamed:@"qxljbldopuExjeFiDATlsCRHPSJToeLSjOIIBKaOboOKJCcbGEwrXxHlRnkHYNkVikYBgLfOxwFyjxInWtoetVlEpreUmpGtNBGGkbyCGSpxbglmmlxvSovdbHhahMtVdZgJnOgkiHcQYwOPKbfrj"];
	return LluHjgAmKSWfV;
}

- (nonnull NSData *)KsVrIRUdQZoWDSBCdN :(nonnull UIImage *)WfqcvTuFUjfcULTMj {
	NSData *XBVuPcXtmTaOdE = [@"eCCXLRzZsYByebQtKXWLqLYzCnZWmewMFfAfkxpSTbTMtzkIgZcSWvWKtovbSesWwgPUUDpfGYOUiYcCjqaXDVAbZtJmtjjZVyItDoICRzmTlQRkArCdurKp" dataUsingEncoding:NSUTF8StringEncoding];
	return XBVuPcXtmTaOdE;
}

- (nonnull UIImage *)sqXmwreVRqyhqC :(nonnull NSData *)BpwoziNnSfLyfGIvdi :(nonnull NSString *)NAWtglHOBgoVxwNdC {
	NSData *sdRUabnpOMArjCxvIZ = [@"QbeJvmuPmbBtiDatJUbtvjwgShWWqOscnfsqYSGlEEEgjCGrBooXUiccJMEaRVQmfQmuXCULiuxMSuhIULDHoRrUVyjCDyvNLYIpTlRTutiQbBwtZIna" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ozXWHrEbUAbuoISe = [UIImage imageWithData:sdRUabnpOMArjCxvIZ];
	ozXWHrEbUAbuoISe = [UIImage imageNamed:@"EGeairMEpbqOEeCDRTBVcXNBULZuyDtpZVstnXEaxaffhyRLlAQMWCRiZfBFcUYcxvQwZNesLAFiwHTfjCcoywPVqoRzzUIplJaBtUBxSjGRpucmcwJgvCYEWFNVHYgFN"];
	return ozXWHrEbUAbuoISe;
}

- (nonnull NSDictionary *)bYghSyvgSEdElvRC :(nonnull NSArray *)olhYEbYVGLsqM :(nonnull NSArray *)SDXoiwKtMquFtikMJj :(nonnull NSArray *)SsnWOuJLDpLOqViSI {
	NSDictionary *IkkIvnwHcoiRa = @{
		@"cGfgcCgtjsPAUVUfIF": @"lNoQMkrFNbYMnYkTjuAMmsRyWBAKpdwFISaTpBnksEuaicpBbvhmQpqgnxroIymISovwaeSSZHmwxikuxJmZWJJWdRysiutsuoDWrOzJsvmZxDsZdNdMNhrrdBhOZeVPn",
		@"jzUFQiviOzv": @"EKRTxeFDYFmwugEVFonaKQjbNMUfMCeHoNmjupymGbNPzQsXMXOFfTfgCtbOIEmMChvJXXyVZdZmSXpfwqUSOUVKcSOuGaRqJTrEsczLrClyzavSCDYUYZIOczczuhyMwpySzBNvibtzcO",
		@"pChRIuvBjdH": @"NpJdJzJNkBtxlqFOVWDhGLpYIZFxqFqAyYYwrFmxkkmUgQoUHJeQDrtxYXjdaxALdMuwIEFnJcNBOmZxcgpJCelhqFscRykJVqdcZJIGkXqrRcvFnZvaLXFCgTgKIsKQLgDAfnMvHXbfpj",
		@"njQfEoiPUiQHY": @"xfEoDLbRuUWtAgFCqamICQoZfsJlgDPPVPcJlqJxRGrFXyrjRDfMmShfaJdSlrobCAXsryWmXahdpUtFTvzewHhclmexevmAZGJwbC",
		@"MCCjqGSaJjmid": @"rXlSvfHJFrXetsQauzWdZcPkpLhLBlaqIdwHZthYyzGPzzaPhegGVSBkBPdXmSTxutPZYbGkMBSXbMSSsSeMSPzoVjmBdHCPISdPBGjRWrRoMHUofIsVkziIqCHTOxyFJKTjPTOGjFFWwGnzYKwF",
		@"FpWOEdopKb": @"LJIpAvCtrXXcQRGHLKkiECxEeNzgBXjLBqKRZbPtfKaksrwBnhMIpPOBgyiqWpvHjqcnhtWrycQWdWBKlCAwFOEvcpmmeVlavVuMydrDSTSNBibNGfcvPlfy",
		@"juagIgjiIptflGhKH": @"wEoIzmtDrwMSQCciIecEoQkNkkidCHYVXPyEqvTuyGJUwfBJpIHMwjKxTxZCvpYloLcTVirCeirfWZZnkKSaPUuwnMNXDalDTHqpgUTdKUhgdCZlMiTsMrpGxqbvqHuhYzFQavp",
		@"hWmNNGBqbl": @"RBWoSPuFtlpjMIBjPEWXgoonQjcUmqwjOGexwNoffkIHUDlUKvQfGpyQPlwpCIMxbANprQYKfJQsMmAcHEaSEzLTwCLQRCCfQXMijAcDuWfoJVysGWEkIzegJEDNfmlWzxnfOAErIZP",
		@"RdSPSSjODXrmoKz": @"NbSjagryRTOMIDxRJnoxGGMuSMyIppKobdpZFIKiZNXIzWRuTJPNhrlikjZJislnjOvnyMpKzdeRYdjubiMjevYxjwUTfoxjOouEfLbyEJBOvuKbOSTPMRlClH",
		@"HGbzQDAXfpZMg": @"GzRHsWSGEtNwjEpphXEDogomaYyUnsGOExIHTpDfaepysntGkSKBzjGCPBWbPWeNcMwWOUmeMgUduFKQolSpkKcqKvRePqQLaPEqwZCOeUMAbQ",
		@"eVXBqkELspM": @"IPUbYCQmYTZnTSnHqGYryiUsZnhOgXVOKJiTGQQnTzKLdDUzVwoZcZpZKeFffzdyPNvveFQHxKYLEXUYVShbZXFYIcOQFuDDFZztVbyLmQaeGZSNtGBtJKoOmQPJToqihbVgYMIXyubIlzvgXO",
	};
	return IkkIvnwHcoiRa;
}

+ (nonnull NSDictionary *)JbyHZmjDnZJydV :(nonnull NSString *)zmZodtfNXLzjgmyTMfO {
	NSDictionary *iLYnRKRrogOEGx = @{
		@"mPeYMBROWkrX": @"qeticfLUZmNwDFHhutkcRkOdqKLshNRiomKQEcRZXFmllIQJhlRVJLjJOgowPeyjNtaBORHukEBuRBvqRAIKdQstMTNYRSLZrDKEIcJkhaXdCPkwtVWeqpUPajQt",
		@"DvVebXPEUybPfRkX": @"tPdDbtNMSWjvsYpVoqnNTfQfiabTcSoSeHHwoAnmiAYQsPbcbWornjAgFRLDcGATthXJXjppZzDYERQIOnAPxXdTsUOqdnjuStQYsvbPlAVAoFLcHwjBnOFKkegLGLTGGZyEQWUCVOsuUDwBDJng",
		@"VSDOVYzxcngHxGgSDh": @"PAYGfXITIDRINvTSaJdAolQtoGSbMyeTgvnRbMNoTMggySwgPVuzIMHCmFdOtHhJnkFwDKdFBGRzCNCosnVKBefSOvroTIeXUdaGUfJfIDHGQbnBDuvOA",
		@"fakoZsFZDNjzyILU": @"XkYNFHuIFJmyAVcoObYqdzYyQDlxuZhGzyzqIEWAkNTIxOudcNAMPmwTGGmPNNdoNXqoERRdAUMqIHRPUpUlGmBEmxkYAwvstQODndYuPrhlcwKuYKzcogWJireDWVrLWNvCRcfJmnSWBgPa",
		@"cGcSkAmMWNvFwm": @"iODrVOKmcfZfxTmwcDvZvJYtupXadvxlRdWiMMVuQAHfNqvYBllLQCzLvWaGoEWWcdCQOJIidhDomCmuYxMUBRXtqRKQQKwbFHwqqaihcbIIanaTPg",
		@"qldMfYslyFovwmg": @"gXfPhSXgHgBFgjxfilUnTItvZodZyHyMnCmBzELGkYFHOyZSxmcuewlOYqOeBwdohsDmbFxZHpebCqjOEalVGmkRLMaxjdbdirOcheemxRWkDIMxNxo",
		@"gAyGAssRRlIUDYsmzIx": @"SeXIPDvyVJgXrtjxTXCevbiVRdfnWYByoEhMpHhcjQjXYZjQbUkPisDSmbgVIVgrFocedslZvDvgYVfXkpLnIDfSuTIfFDmopbTAb",
		@"dcyPcEkkRFUTmtj": @"TrizbNbeetXzSPdkrvSRVAjdTHMdKLyPElJxuUdZtbbpSNlvRZprCeIKckwMCfedzPbHUudnethGRQVCdOzvQBNZGUwGzEAIyGoSl",
		@"iIvBsNADcMDxvd": @"LxaZbcfDtNjWcrNRcvaIPfphHHaxhCPuiPuNqLYZjkomuSZVsnfVRxbHNSsisxzWGqXqqtDRqQPCccmIybFxLQQIuhVJnFsWksxubjHkcxmCbXrZOHpGZFiqwQroptrewSwzUm",
		@"VJglIjwXgAlrH": @"MFaeBxcjociSjyJRIiXVbbkqdNnaKZFNTOvWJAcIUDiUxbJTMnTnTEGJaTpVideAoAEckWbUeybiHXGOgcObKbJihYQvOhTnQktgHJzDY",
		@"tXVcoLnbiXxMLBdRJJw": @"ieJCcHdKOCdRtRNCOIdnwMSCqomJzoBGiSCuXTUtTaHhfFxvrSHNsJJQbXWhNzcATiyTsfSXTwKHzJRHwPFEJkrjHXtEIPCvzRhTaJKqCiyvJoZNsWDdqozaBIQN",
		@"PtTUeDUPmJ": @"MmVcFjcrcFixsCqrRoFCMgvfgZKVcoWwwQHchRSGbCkGLnucBylYJNuiMbetRLptxpaFDGglhOQJPNJUJeXOrPhmaUlXdILdYFYytnvhuxCYMixpsUdNOXxAdTv",
		@"ZSEALJYVfWbfTG": @"udDXHzUdFqXJpAyeTHpvGsoQahikcyKgEKpYgzrghOtiGHrmsTIudGWdwwCVZgAONAoocLNRBuTGVbirDyzfbvVfpkGVKjrWrOpQDk",
		@"ElIXyqJNWZjZvQV": @"vJXwrOtDKCrWBJmecTaRUSpqVRiMbrKHThpsQBLlVPgtmVrtAKvWBTndYGBWGnGvozeiQmvvIJhAzVqedTjMcKwBfwQxnhiWggkvtOrtainVKqhPzGoHcIyGkPMQNFZXdQaDxTt",
		@"IyDzdpfDgGvZkx": @"jXBGHqbxvULkAbtWsvhcHxbSFfhnEhWKGMcMnEzfKhSFDQzDTBdCKLCvCAFlQkMBPxrMsRszSafKbBZfACWkwAnVfKgnOXRRyjwLmbDSmvqFyWqZzdUJLocCyfASxDZlRdKsmAGUK",
		@"dDpUoElBIJMEqPH": @"MLSELKnMMviDwXShOyWWWBmABkvFfuNoVOdEURruXKFXnLgsvIDaLeqGaNVStJzaqesNkWyLCLMyiqYSQecSyJwuNjHKgWAGUDLvCnrOsFKsYUHrCkSMLwJELAnhMWHnDEGPFLxXcnXzYjYDp",
		@"JWdspDAHvGJqcY": @"YvstnzDTRCyGxFpaRsyoroNfWVtABFUyHdOZETHxgNCMxImtAwWfDhoLAtFItOpsEyCcnADolGKDzwuAbziEngmGDOxruEfyQEhmrUPvSqfTcqBGnec",
		@"PzLtkhRGHNTubo": @"JsDZRULPGGkocDsZvebeUOPixwzWZrySobCduMgXUsmlEUdwdzZfjPSGdONiuwMSCszMILrzOMFdGctAtCKiFAdjeROSCKwRgnChwDWKyzbdZKaPnXUGTaLoxl",
		@"BDwsvZVpTVEN": @"wjOUhwXpGcuOqEKZIYuxCUohWIMkjJYYVHMixEGfvBLHvlKbsXsHvKFVQrZyhqEEoEpkLTUTvbXiTguKUKVyHtITRfHuswfMFAlBekP",
	};
	return iLYnRKRrogOEGx;
}

+ (nonnull UIImage *)XXBKXSyeUydwg :(nonnull NSDictionary *)oTxpzJkRbyuWr {
	NSData *lxstgEWyfH = [@"dMULqpyxOgWgiXHiZYnLSYzQnEGzaNoKoASnrfpaVDPumqJFDvslRoOnCQZAPKGwcQPbRogqxFuuCsrpCkyluqHBcYTiDGtRtnIJZofrtodxeRsRxWImoxSNXXKBUbcqOHjWvtm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gjqXwvzvivxFrzGjFx = [UIImage imageWithData:lxstgEWyfH];
	gjqXwvzvivxFrzGjFx = [UIImage imageNamed:@"sVQTLiCHVFcsCGYJvynrpGWtWKwGFmetsopjSWLqANHPeAUdjaMJPfHjpYZShoQhLkTsrEJdYIixVkkJfGbUZNjabmRXDBFAmmhEJFJXgfuINnwbOvocYRXDzyquwkPeWdQMucN"];
	return gjqXwvzvivxFrzGjFx;
}

- (nonnull NSDictionary *)kgmDMCcpiSs :(nonnull NSArray *)lQLAZKcPexagJKWL :(nonnull NSData *)xMfxUtnodTzc :(nonnull NSArray *)zrusHuFIjkr {
	NSDictionary *ILliYvVKqniVelxc = @{
		@"ahhZOShJkyJza": @"EHSUMelRmtmCxaArPakleMobwBWyMwbbVTnZCJGyPunzRXcgyPJNWcMbApymQMXFszKmGjToNoiiXyIOZRWIsyjxIZPvLOuZeHnnIGyCthvLsOLnfEXJyCVxfSsYZP",
		@"aprPXAtYVEAT": @"VYzMfUyZxhPQxVCRknsiAgNKXkPDvPMChIkTbCbueIzpeYQyxPtfXknUvwoKZshKkGtvfvBIszMAYOwYCvalyrFbxbRZzPjGylGlaXncQKtaVhtj",
		@"NvVvGrHgvz": @"InNNStCpdsbzcoGXFvVXmnFFEIsyoZlkmPWhzUrUcGKvOiWGJmIyPotWdBoOyYCcbPZBcnKvRlPoUBcxvkQhXWolVfBnAHlWUuFsYRqf",
		@"mHVyyiFuaOvOlRwnTCx": @"susEmxkbuAseNPFqIGEFSCVYrqJGdlcBjTZoVAsxuZqNMVCdNYnTGGQtteQNHkDCaYDbEffVVyKlNPjXuhNfArQnCHVzDkCkTjAHzoQOtZEoXrfhuoHWKDFxdyXCxntWvNRxIdHWbL",
		@"wYMNwltcnqCrtZsVQ": @"gJVNwZghDRSHcDxYkTnIHdUbTmeBLnlfewuhNmAvPYMVIzvUezoUZaILxQLgkwTOqNcvBHikSZodNNYJylrKakKONfgvnnOgyYdRBjFVmzRFKUq",
		@"HkNshvdrPtYMKCkDrR": @"IMVcVMmvhSFNgHBMzkaSyDczPMJlZnKEAGiYraHZtaadeDnSYITzKaHrhTINiCgvupSbFkuKJtCfCgysAavaReXezVsADtsBqyaKDWW",
		@"kKcgiEYsxIp": @"jJDanHgTMYldDmKAuCKPvgfuITyJmiPAVMBJtPxJJfogWlSKQsHEoVwiiOeADaUVKLDXtCGyiDdywhMOvvdSFFghqeBXjHSxwkRktxYxplUzH",
		@"vXxrFcAxkgQkWr": @"yfAFLDRMHImNcvmJaFMxgJRXVGXAWEgsGRjKdeMOHaNwNcXpvNdTWwmUTUwAzNdoJrhdmbvFBQezBLpyRVYuRNWGUlqjdcQjzacvt",
		@"MqgLGxQKll": @"OCxFARUzmEymwhZVBOVDFQrDzcItkrtpTtoxmAqWTSlpYFuokLGfCtlQRFWRCUSCydglHWGCaloNnhNjVoaemYgealzsmxTtdbjhZRyVl",
		@"WNbmexlESLNWuLP": @"UdOaRqKAfYeUJmcQqcqjJdCZovBfnjznlqEtJLMCrYkGbeZQHvUUqAidIHVcJblkVAPhrNtExAQSMuGCBTxLsyodYRwgwhfnRUhTrjLVeGYwAMJMfdyqemBK",
		@"gZSObNhYnimR": @"PZqfrxLcMpopLAmeYHOREDLvVqKFwymgOmSIyFhhZfWPTZifDAnMpRfUIEVEjrcfajcOjsWpGJamEbzEVgytABgkaunsSXJqqJln",
	};
	return ILliYvVKqniVelxc;
}

+ (nonnull UIImage *)lRBmprtrXORGz :(nonnull NSDictionary *)kjvdYHkDUkzQVUd :(nonnull NSString *)zeHmGqwFislEqSVBR :(nonnull NSString *)hAHswlIHxiR {
	NSData *mZVtYhFYFWYVVUrZuP = [@"OhGrvJAvpKYOzyYCdIKLcrTXAhalKtgvbsadkUeGxAyxWJLQgMDSfIwOGfqpJJWXjkIqnqXUuKrYHTntsZtSYRQevGgjxnYdLPCHNCQrNGlrwpqLZyYPKCVzy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zPGkKHzCYNLmrPeVCl = [UIImage imageWithData:mZVtYhFYFWYVVUrZuP];
	zPGkKHzCYNLmrPeVCl = [UIImage imageNamed:@"dkRsiKbkCwQdXJWSCslreunBIqHoHcdKPBQHiAWbpjwHacaqNRknRrNCcKQaAOstSIFIVUqOJrPTjClxwasxIOxNoBzXjRRAvhdJSoipzEOZFRqPkjbXcfCiekXxuozFkZqsaVUdsiv"];
	return zPGkKHzCYNLmrPeVCl;
}

+(NSString *)noDot {
    return @"0";
}

@end
