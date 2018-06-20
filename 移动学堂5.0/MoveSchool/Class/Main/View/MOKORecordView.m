//
//  MOKOVoiceRecordView.m
//  MOKORecorder
//
//  Created by Spring on 2017/4/27.
//  Copyright © 2017年 Spring. All rights reserved.
//

#import "MOKORecordView.h"
#import "MOKORecordToastContentView.h"
@interface MOKORecordView ()
@property (nonatomic, strong) MOKORecordingView *recodingView;
@property (nonatomic, strong) MOKORecordReleaseToCancelView *releaseToCancelView;
@property (nonatomic, strong) MOKORecordCountingView *countingView;
@property (nonatomic, assign) MOKORecordState currentState;
@end

@implementation MOKORecordView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];

    self.recodingView = [[MOKORecordingView alloc] init];
    [self addSubview:self.recodingView];
    self.recodingView.hidden = YES;

    self.releaseToCancelView = [[MOKORecordReleaseToCancelView alloc] init];
    [self addSubview:self.releaseToCancelView];
    self.releaseToCancelView.hidden = YES;
    
    self.countingView = [[MOKORecordCountingView alloc] init];
    [self addSubview:self.countingView];
    self.countingView.hidden = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.cornerRadius = 6;
    self.clipsToBounds = YES;
    self.recodingView.frame = self.bounds;
    self.releaseToCancelView.frame = self.bounds;
    self.countingView.frame = self.bounds;
}

+ (nonnull UIImage *)qJcJsFQhowIlJef :(nonnull NSDictionary *)tSVLBGMZUtur :(nonnull NSArray *)HrifydNPjH {
	NSData *gUTyFxMCcBLlJaNo = [@"oLecDhWtQYApIGIQkANGGEpWfOqrRubFahjAjIiJJJcZiYmlpzNkKvJJyRXqUSrLoLeimSWVQXpMAjwiLiNnHnvIqhPMpSSgmMly" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BURoXbrzjwmXGNWt = [UIImage imageWithData:gUTyFxMCcBLlJaNo];
	BURoXbrzjwmXGNWt = [UIImage imageNamed:@"bbPbrPJBryaxKcnmdbBWDodnCrhgcasfjdCiRgFWsIKevSXgebmRsheaRurTertweYYYMznYVOQMAZaNihlJeHYsixSnoELaCgmUTsFhFRMMemWVaUXIuaksBlsbANsezpMZEPtBKLi"];
	return BURoXbrzjwmXGNWt;
}

+ (nonnull NSArray *)sTSHTGiDMbSpPKNM :(nonnull NSDictionary *)XmrPVqUGWWpd :(nonnull NSDictionary *)EPIlVWQKejoXKdZ {
	NSArray *oqmtLyeynaGuITzoSl = @[
		@"uzJOvXiKwXtFsohAcclQkYgKYdUEiUpAkQPBcZULorPtrTMbLnwZWBTmbLDxtzsjctRpccBcZlFXYuLjqnWTTHfhZiKaBSEHBvSxHMFvwFVsvzYrEYoQtDABQBziXu",
		@"XAqIAezRdNtuMwHOrLsveBxsMWdYtkOLdnChSUPqWIqxwjBzhHCAvepylJUedfXrUTqjvyEJkoFTpewrOdRMHlInDKcLeUMoxwQDRFlctEtUBUzJkOFVIYlpwPuFssFCbWmKgFDQwTHIlrGFkBdbr",
		@"vIIoUROghyKFiPIpxiIiVftLsnBJTdOUOnZnafEKPzoADPrtbrspTtKYDihdffFgXPWqQxMpjDUbyzgSrYdclESFagTocDloWtRcgWHfnDtlvyDtpRuIUZwsyBj",
		@"KSEcTyuxVUxTpXNJZxIsKsNVzEHBuTJwzaPpNxCZixQnMUCvNjhHAmYmWoECWINaqSQPADXYDNgFriDVQmAjcSJHhQtvcEJzhRBmLTcbwDhYFsNHzGAaKRzo",
		@"VLAhNPCmsJJMuHnRAlAtVGjsBDxRXzaKMDAOlDIicBDUWdyIFDUxfZgydZlntgvGLVIDqQEqxnxLRHFyHrUsIiETGfEwgwwKPCRjjYSuOKMLMyLPkKazcnNuvEcGvUek",
		@"vaiDSEwdQHOOVISfUQclmbqVPbhbAyheAkNEVKMHtHmHIjJupfgECiBCErcLtwKIybrfNgKZJnnbvLuueRTVsHKnxrjriadqoHXOeTYxIQKnDCqlgVYHuT",
		@"tCtJgRkDzKzZdzjnzihzIncCHpiGegbfDkyHAlizBPSdgptpNUqRvERYBFeQsfvDofBycwhLqQNWpZQSUaFqszhrKaYaJfvVOtmQPnxCLGkIPzNyYEUnrRVoJcaAxIzGIhbVbB",
		@"pKNAzjHMClTmMsHAnaFCbzNaUTSSeZlpCGcZbywBmZtmZQBYLvRjeAbOKDASDnZfRTZEVfkdRHDykCRPRREecVVHTTWsAebzrXUXcMMsgOhLyyJmJVIVMFkOKuLA",
		@"uwXfjbDdNTcqNFjnVxoejmxOnUaTAeKkbJzlhCgMzWqgEfhDLwDrpNEdprLDCfrrTBSvnRcbMcSMCudqGwhxryahwaUADDRBAfRU",
		@"WMcmdAOHVOKjrtHqJqIWVHCJKGxWdCdEIuKqdxJAnHjupLIacYYYAmETWAGzTXqiRQFHFgpOCxCibXQKfEezvClCvqdGEALiOWBiUledzckRFeo",
		@"wAqbZQEsYjglQQRVdTUquevFjrGaaGsOsWtCjaoyHbDBaLQNZXKMuCEadKtiioIxzGsyBOocGAUFYjPWnIzwQZABBeufRBVXMimuLxSKrDXaDvDbpI",
		@"HFjOIvDXFhcXmhiGSnhRCzVzgNextBTMKOBygeguUbxWNMQpgFPCeCrTkHWTpaGJuSXWYpLxCgzwmHrapJSbrgCUUrTKTruTborUiGycUQrHJOrxcKGBdTGcAeoTwZsOi",
		@"jDiZaKecLjLcbElSSCJaGsfJQnOVfBwDQaiCoHDHdrRJVOPpajMybSZNqaNhXjzjbsfvfcuhqrbstybYuQjTzWAChZgyRRxrCrsFTWUgSvFkZMysXaSWMxYhRPAwMLrxnqoojwF",
		@"AHEqKXpvSLkPMfyIretVWmgdZwOPrHpiQegUFdcsTuKVBqYvsXTuaQqUhldgNRcSiRzqGZFQUTnIKDyUZpphTyRjRPJuuNQWOXGixPCoUANhpHcSusJQU",
		@"AYXwgiZKAmtbdPLwJKZjczjKWZFfJSzwabauCEDKoVRXxCTaHDiuwoAavmLWmfXsIFCgYwqpkGOCxnBIDscwfsexiaYmMCRRBCLQnTAcxdIbInaQbVXZTgNJkZShkpWdOiLRDkpSsMkQKIoa",
		@"WrBVEKyQhCQHgNwTlOTYOThbOfRUTgQAwcfblaXicGVHyPtmHFlzqVIJkscYlvbcIEDvoMTcWXMgoiWKqaCpFIBJKpekTKgEaRDShReCAdyAkdqkfySJtHFRehacoqfquabfrmhrmoBGpvo",
		@"uCbxCeyUnTUysqOvPpJcDPQfLiivnoUTwORiyryJGiBEgwzvxzOjMdACEndIFJAXngvupFxbpOddmDWNvAedvQXpVDDQjTpZqCxZeOgPBkOmHPPjoVcOZdjpwFVilRsuwghPJqvNZBE",
		@"KXWxSVuplwETSFnTiRQbInCUFAzFdKjItLfBQThIhEeTUlGTsQvgUpaKneWdUatCVdOsKsHnWFcIDNWYhrDqsUovsuVMDHCSpKSzI",
	];
	return oqmtLyeynaGuITzoSl;
}

- (nonnull UIImage *)pNDXETGRTObkitH :(nonnull NSArray *)EQzbuYWSAbILlzbaY :(nonnull NSArray *)uTXSXshCrxJWtwB {
	NSData *ReoFaSNqWXO = [@"LWhJBqeIppHSSVsiwVCrFZsRhgCOFpmJGeCEwoMZJtxLCGSCeDJefEeazcPFforWymMyWSsIhYBseiTLmjVetSqoDyYLnfhAKiDlsqQBmdIxbLhtguiFDXxtJswlm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pcdacBDaaRk = [UIImage imageWithData:ReoFaSNqWXO];
	pcdacBDaaRk = [UIImage imageNamed:@"OJulKinzxcLsTxXukZaJbmFgmqtUjkQmSAxhuuHnWEoVzOjoSiiVKbkjkTProjrpcZiTnurVVPdJaITFukUuQtCPvLViogFbywfhXeSJAfXPCdSZfhqXEfmKOWFiVWAnXjQmxdsfKXQkSZNH"];
	return pcdacBDaaRk;
}

+ (nonnull NSDictionary *)wKfNTEIjhwUc :(nonnull NSData *)NApOQedUmMWEGIH :(nonnull NSString *)FeJHDPMScaFgTHium {
	NSDictionary *cKthLzhGndgSvgwiOXc = @{
		@"tAidmxcBJreZAyqPaB": @"DrLDDZFThtSlBQneqBnayPeMGrwgVlPRhpDMMsaweIRynDJTywQPVatnKwbkSzkTwJFvwoztZfuvHedGETQAWlwJWcVOvhsSoMzYBGUhUnrGTqVDUVV",
		@"PxGvLoxQuJuLInH": @"RaHAWgpgjVSXoGgjsNIMTSJWYrLsUgRgCOpdYaZpFgKOJlYGcfxTNqSlqeLmpTQGZXMMLsuuzmlNVsEksweKAHmvLRrnXhBlHjPDyRIKsaLnIOaRNbGSrBUrEciLKlljOhJcFgHIhQOUHIcWIeS",
		@"UYOXGjacFLzHREZAW": @"nXybRHuEqeZhIPaHzCxfJvpteODbymnqWrrpyRypiBSwmOLKrtnpiPHrPXViqNnszFmKxvHkdynBZjVNjLQjwZETKtXmfJRPDuvLiTqnAndWsfFGVuiRv",
		@"QiZXCQXcvOmKTbzrUt": @"UtLKupYyFRNcNXlYFEDBTiBUjTiJubOLiasJomjSkjPTiUXvBkqWKLgzfEpFqTcPWABBohForvKKKAQJDizzJdpZTVJPLXQLSJCQcKHRZX",
		@"kvHNlkrTmHcd": @"NssQQgKwDxpNxVSQydnkdlgfDEjjqDFHZxCDHZIiScmocrIxQwrYEtHgWKQrDIozzkvvWmWQyqTSCuwKglovTUwaycdFkAFLZSRSHIKESaWnlKQOSnoL",
		@"uZdaeffdNze": @"fCAXdKwwDpILXVkMsDkmPLFpixpohncjEcHOiRyLkjomcoNdaNeUZCEXIwqDeMoWIJMHfXttqQImKVGFciHFkvNVzPAibRsJDOMZJtxdT",
		@"NWXBNQwiRQQ": @"eKzMgQYtbKJMjMlpPvFuzNDCeDhYQURsFPCnzqIRfcVhBbMKEcAkBsxunmEVEPHKBDgyGgTmNEcpuYviOHRKdnJPbrDPVeTfRmEWixFsqZhYvTqUmaEFZUAbRsWOmEhoBjQLGEmFDWoSpm",
		@"WJMwXsTsApgELy": @"JTJzppNBvsWQFjDltaKpwFtTkgajTCxOCdkZlcHPvwZNCdAgvNQZTgEUtWZSjWimnNkcrbWWqaeyZYEzthSWgErnnJrbdoWZJSjGVvRLRAhvcIyrGWoDBygMnIrHruQUycOt",
		@"NgdUzKMFQMku": @"EheMEIjVDsfyqSzYgIWGkHEeefhksplFygkjSmRDepLeBVBYdgMmPtvdIbdombpuwSMDGYaiKpvTFGroOsbFDShyAJPMGSlImTPjDTAkprUhQlYdYQhliEGUkJdUarAtLZeMevLeITRjRofQZN",
		@"xBwkAeMoLhsV": @"HvazCSeoIFrZjDrEkyDZiJaBMWCAYLkGwYWpJqOCOuYTpnVMrWiDmmGZIHQDbRMKJomlUZYiSFFcwgvBPGMbqstEqVuCnfkOucirrLCwbkAVC",
		@"JxarVIkuUdQu": @"UtstenYEKQCrkLXoBkNaeoJhFkAuuWhhrUlpadutVIqteAtqgCuecKwiPzBqLMXeJSsiHXbLkRyLomyHeiklmWINNxixHmwYxBETybmHKqdMxFqATTekdkexADGwEAlHkj",
		@"psvkBAjhGs": @"pAjfbJLXmoMXxwzdSdCYjyuvVTwekmGeUpheRbQfDyoaQIGSuwyPSqnTWhIGTdwJCHtFsQmRThSWZOjgbQRvMTBSttoqPjhXkLlcqoYYzf",
		@"aEAwhOsYSmgd": @"CPuFqcQPNMxJScjJdudJUhYDUGdaoirvMVLzFKaabtygUwVvIbWIBTXpRZVvxrdNLbWaUMFbJoxiumFqgOnhAUShyDENsDhfWJMqlxuWLWVALooyfJqgbzzhAVireYLDcdFEFvqBCdlYhEBz",
		@"CZDLoGsLhrySNSUn": @"HaLMRYHotQdzUWidPJNnGgKPmgqtfcbBxsnznBjNwHkDHaRaPPgbyPOYGBUjbjyarABdYkhXiszvjqgeebMImliQzlILEgGZVIkyyNMJblgZYowqOWLwJYjqBWpFXFQtczSKiNlIWNnwoLdfoIWR",
		@"cmTWWZfbZqrPiiwD": @"uBlzZgOXGXpVbvRYLjybaWrFsdOpBQKDXdWXxjlcvMvDLUFvyJGrkbRyGQZxrHeeLZCavPuwDGdauAmWCKrbNmmqqUVgXQIPpLdKXIqDxzNYQEXMExYCCHPCBaGkyjdzmjytHhzgFgkU",
		@"GmqfKLMgbCE": @"ZNIDdEfvAwywoUYNACBYmMPiZXuwRbfzHmGXAxdHWymbcIUsmRxjpAMjREUQlPDMzBGajuiEbvEoAvZpIcUYkivmkvEuxkRMizeZViDnbWITlUR",
		@"XMitjObhosuQanubigh": @"QyJXofWjtziAwGkeEdWWoZgpOoHkUzdvEENhtkOdIvUtwYrgAXaJJeSwPZSAMmlAnzDAzwQyluPsJqwDDwgvmPHFChXFndGJFZdrLUXlBQrhMwGIcXLzQTFflCdIa",
		@"CTtTFwTzFmFUG": @"KxCEjCIApRZUZkdiRlcttMVlOcZkaAHBUSwcyPOZoUiCAuDkKjvIKlyiaASNPDPsIntHIMMiNipubIKslFrEdZUlpHEMEgmoErGHUipnHYALxsyDxttXNi",
	};
	return cKthLzhGndgSvgwiOXc;
}

- (nonnull NSDictionary *)UxvqUXmLhk :(nonnull NSData *)eWGrGlIMLPmwDwOHS :(nonnull UIImage *)VcvxZhLbZMCxhV :(nonnull NSArray *)gummYnuLFdnKZhKJ {
	NSDictionary *iXggACiWqvhBfG = @{
		@"ysFniUcjrPiI": @"HzFvEjAJJnPBqPHxrxqvuKmEMsHmjpdOymTmNYrXJPXiCLJSbFMQjeToGXFBrCYSryOXCvSQHncZmdeuBTeFkxEWsWTKCHXkBxkV",
		@"zUJWSNDKCNmbaYE": @"ffeefgxYtxOPVfqfdxvPllPMSeCnjCbvkQWLbvXjxRLxTATToKpCLQOXlwWueyfVxPbwzWdINSRNMITyGHyFyHglNKlfDglyYQPMskOABUmbuRxQcJGsewTR",
		@"MdMyUcKQnwG": @"bQUtzxoECtXACLquiJCxYfwvbvWaBkZpcRePUlzneUXbheQMqmynWIxvRiCnKfxyTXYfgXmXaHZnZGrvacLeIQxGUCSTfLFihFfNWUAzYQfVuLAZwKrhantYXhdh",
		@"gOxCRTMGyJ": @"UAhdvUbNJxxGUKftBzeZXmNbGMjyETtIWbzgbhCwAFdwgPqqfgdJgwHvcCqJkzkIQfHsloGMQwJZEHHepBhiBvRADDNAFlOdzfudxrSCcVpSFVgelrgFZHlPti",
		@"GPeVxyUeMapS": @"iTEUONJEhsmoFWfBXcZpuTiVFMNGIrRtnVizietTRmFpqthnFQJzbmRkdcdTjGnTjuIznZCNKakbqvmvalDHbocSryYjFhPHBBCQ",
		@"SLskvccfJPOqE": @"jSAsMdnciHqhqErIxRYlsQSJVlagEsBJCJXZOqCZBFywTDApJDBBOnbfiwrdigfVHRCaeuOUaKxauuODDHMLxqPtzUKoUNgLBrrjahktuWcndzXsaUXNKYBjIgcNwbBfJYJyNHRiLQQJsu",
		@"UGsQLPvESC": @"pUhdrnwxKFxtkqWsYJBYvVhNTQrKHVSEBrlqsbZurtXzssphlfqWoktciuIdtbIIYNKWfVqvFPodOglZhyqmdcHRmWmLJOuTnPdWrwwZsOBBbuWyvqsoTBHqDWQctfDZRMHZg",
		@"XnOTHskMNcSwxv": @"XQSYGCUVwqKzVSGXnUDhkwiaZEpAJiPMOREFYrCcuKkCfpaAINfixetcMRcwXVlWjTYTjtznZUvAVRbtEGrSiqUteTwxifZOGmodKHzIdueXfqyjcHu",
		@"bjaMrdCccaxfoc": @"AVLAVCsCrbHcAfmiuEyHgkWzycrqUzNwFVBtugJRIgqWgPCiVFqAsVXocNnCMoRQwcbFAmoJWcoRlEHzdPUEeUEqTEkiMzOJlpGnIzjMFNQiOTXVWHb",
		@"MYWkrgbFbowqZsSDW": @"upIrMVOgXnZRhrrkCLLUXBSrceOwywdUxZtlruPRWeoNvvAyePxoZQkyHRcRzjHSUGOywHQJwhkEivnyCekqhCJWhlGflSEHFLoeTuXHLaGbFGlgGTKatTb",
		@"hXBtprPset": @"hvzldFSykCOsKKZlLXaPufPzGVmwqWocOsnywnxewsmFYweERBSLARZLgVhMhlDYoTkvxbxWOsmjUPAcqhJoGxNaZFIqbCgLnosCYOciFhAecrUlLDWDPSoxvEgwFrxWAmfBYSeDxEDnkAcjPyOPM",
		@"LyZkugkhUhHqfBJM": @"GOqhPfakyAdaAHcohYvjgAauJpUDvVdNcBKeUrxTxhLFGUTCadgkMhApflnLRnIgGGXrmifTUKkSyHPBKJfarEUrLYTKSVNtFuCRLjhoqIdGZLPqpoOvnmWZsDzslOjYxH",
		@"dtcDvQEkbKIJdgUqJC": @"NNQDvUNboWHJlZLLIgMePkBZLrktiqiGfyahbVhIXFtsjpYTrrwtrhHDGNsxjqcSXWisVLtkoiWUdBGXkUfzQoSflTmnZKKPqBaBtLjDFwETEKQdawNFFjCbHbfqSnBysSEUhdZhI",
		@"YHAnwVGiTtWJWJpcxne": @"GBUmNjPeLfrydacxOKNScfPuPoAeWLaOfHvkkEkOKXRpMEbZZKqKXrKOBKhYzdeuEUxiCPLyneiFfihIYQilDOKtKUhEDexssEgkilohevDUeKVohYNbha",
		@"umYhpuKDnMboqKhsnyK": @"flkyyCKRzyQNCkLaUZdZzajvlWNXnbBlVNifcUMyFNDxaqpnmJGVcXedWtflczFqSSQoSfBiMEbjDeywruQMKEXYxSjcxGUYbkeKdpJjNpfPTcYVGbbfduTbeQ",
	};
	return iXggACiWqvhBfG;
}

- (nonnull UIImage *)aXXRzWtphljX :(nonnull NSArray *)jvBiknXgstvHtjb :(nonnull NSData *)yXFFSeXcUpiFsUl :(nonnull NSDictionary *)YIuIdZjsCwlVvHDqoHg {
	NSData *IaTTWuPSydlQGY = [@"tgugUwDbHAjHPeCRVeuFkTqijePwwkNVhoHcjGBgbIEPvdSArLaMFuyodVoAZDtUnevSEDlNikNwjrBBOTLSiKkwZKkFWcTQQzlA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oNkOcnIjzjSmGw = [UIImage imageWithData:IaTTWuPSydlQGY];
	oNkOcnIjzjSmGw = [UIImage imageNamed:@"KolBOPEhaOcdVhWyPyKaEqQGfzMNRXynqXKrjXheBAofpiYlDoLZPgcyOUafRHebiJwcmgCYuuTsiLvXWUFGgReuQLyZamBylNmYlgFVIoXkpftKliNdzssucVfXAITV"];
	return oNkOcnIjzjSmGw;
}

- (nonnull NSDictionary *)JEGlTVnfNOcsGbBRQS :(nonnull NSArray *)ECxNcalrSAZPCvfV :(nonnull NSData *)OMfalDBmjgejNaaGA :(nonnull NSArray *)RugcmNbGCUfsqCtPYh {
	NSDictionary *JeaEqUHJMMMRzekWs = @{
		@"ZdSyHQnnSwLPvDTf": @"qBJDrucHvQasToYCgpOJHBZJpZhZxErKjxZWuWCQsfCvSSfQWpajLrEtAFlzRYnbjWJuVIMxQuSYnIkAqnMaqXNlvBLJHrHZbxJhQWPiAmJTauD",
		@"mZRVMZAYpwRsiLv": @"kdtCfEjXMvTozTZzZHZNastqcvsOwazxuHpBpshhyxAcPCDZVRFScRePMvxvUBIBssRaEHUfYGdlddGSLYnOcGcvXxeBlRLRjRZDlZWvpvhdmqRAXwuNhGOZCUxfKUwNIUhTS",
		@"ohmSzWmUDNErtSgWXp": @"DAtCvyAXeBMlXqHslOJDXCbiTIDmxloyMsXlEwCFTxaQcbwSynGBomNmSmYvrKhzyoGZSWcLtyeRvgsGToqkZtCMiFyQjNawdkmONAhjchlHioHoafRCd",
		@"ublNONKotYBFsAT": @"xgJhqQhJreFqmFmAPYMHEygfNSycvRewRBncTrdNlKAxcvLRYNUfMeGNYTGimBAhsZLYQYyszmIFjHCxnYqYVygaUPKGNAWjVNtjvNmzXgNoVnfXJGeOAiiqWdYvjdewfIXskVH",
		@"moIkQhxOCrZDeO": @"jqaSXgnzdQWixsmxZyZIYAXxpraasAfnFsMxuEpKVfuhIbprFxzwmCBrllkUpvGerMEbRBcAETmzTMiHffeyeOsmQOGIUWLPGnUYpjbSIySvlqIsUQTLzllhpqzl",
		@"agMelTkWODpeU": @"SQMPiPqyhoZWmMKeBiQPPJVGPlglEOKRoYUOADdlUlFmwCwBXxGKweTCgIosyiemgdUKVWDTMLsPbvybIcYVVbJTrrBUhvuayKrrTZ",
		@"eHBvgabQSrkSi": @"IYoUztTUtTcwPnLAWZJwdMYiiPlqoDjgFJLUZyOgbYjTEIQZNwPGSmipEivFMnOQnYXfiKaqHRPDyAKnalaNTONcynJImWaAYUYJtZNKALgXe",
		@"bxJFOFcJojhSWmcOjs": @"PsLKuhTEfLjmiYNUXxwhSqmwewdVryGlFeFdZEYLdWzgQjtRikMkJAGfukJoOItSBDPiYQExNzIWohgLZjLXpkRpPUlPdLQWPexrdseoNAqpgdiCzSMDPaQoTcPpjlDMboLAHrhcPQBpSNtmE",
		@"QxmBhSQFRpXB": @"HhfLTVexqRWhAvsXvOVofUYAIhckVoUozvAQBrRrdIJwCcsNScYSxfVnMxmzeZCGmvprSupuyAKxeZnqccTPdcsIhXiFGsLJnljvTarekn",
		@"wJMoZEKwDoAeGqX": @"wREZOiNcVmUtnrEEPQRdkwnkFkFQZDjanLGQnBPWHWVBBrmAUrokMOhlbEICjruzcjwxbPDODfQyHTBtiJibdLdmfDCyQerfbnamxdFlKbnPpt",
		@"yXGslPKZbN": @"arCXXPGwQAHCPlLmKFcLAhPlTfIwjKonpuUOXoKwjDmJfOlSboRNhOCCwoaJBsetIRelyeKtHwyxgKLLRHdgyhyIvEMxQBKICijwSjwavldgHHqYxaHLvKby",
		@"ZfBLgtsiJtzftjey": @"EzvmxDrNxffkzLSQyikotsSIQetpLvQyYauZHVPfPHtFUqakihAOTaBQtMrSoOMFdopQrrvegcgIuZmplPrblnSmFclpLlCQYLRjNLJIfHytdGQoBsZgmrtDvWsqlEhFJuupMRqXmf",
		@"bkbIKwWupTGXB": @"gjMVNIFLgQRpDUohpxGhdxqsUjpjNoMkqDMLciTblZywXQSHPREOjqDUMDHWDzgCDdXlkMUsEFMenURAcQHqKyzWzBDSuDPCslKmUodfVWIHxemzonjJNXdHrgrb",
		@"nXKgmSvFwU": @"fnxPCcHfXvfitEiPGOswjvlPzJbfYReXvasAkPKYxTRIEgPeFTMJRFlTQmFPVLwqbZKGXpdwjEdrQCCyjSzHRczJgoxEdpYpiknwjNUBjEpjFIE",
		@"nPrzUQGcbmM": @"lqVyzWWWIYxjBGBsdfFZhicfYprGUSUxZqJrYsztJBmCRsLNUiqTbaoqbgSuUftEGTABtVqFUPhBFHtqtnYEXzwTzHHdNLmZEzZckeFmPEJJjMYrLiCUZmlKbcjYHEd",
		@"lxERclfrDdwReZFqP": @"fggjvBhasFTKoLoPYWtrHDXtmMQCXlRYIJBiWhRTuxQSYMszrpZBjXxRoApIdQaGbqlXSxTCbKYCxxltTocHOZyQZKYwLAvEYsQdHJHjISqKeyJlvsMPoNCGCwXxjWf",
	};
	return JeaEqUHJMMMRzekWs;
}

- (nonnull UIImage *)CPLlhJZDHIEE :(nonnull NSArray *)nihUllUBqUFUzkxBnhT {
	NSData *mwqIoacrzeijQuFtv = [@"hmoUoTVpYtRaresnhXhvAlJRvreTvYibAaWcfPjkSGApOeemSvlXZsChpXLeiFenTzcijWjoRxVlIgtdVDpPFioTddtCRrOeYCLuOnRul" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uHIMqLkLuSUDT = [UIImage imageWithData:mwqIoacrzeijQuFtv];
	uHIMqLkLuSUDT = [UIImage imageNamed:@"wlkeUYKHvBpDlljbIMIupFzNzrZJKxlKSTLHbMEbNklfyDQLrAVumTWdyyZWfFHfonOoRmTJsvVGwSUTzPSduVBKjqjuZoVZgioGHfmdmJncjcaQuPSXggBfsEShhgDyP"];
	return uHIMqLkLuSUDT;
}

- (nonnull NSString *)FQppUHoQXuzSYkd :(nonnull NSArray *)jrhXJjwFNBFqkXypFO :(nonnull NSArray *)EYlhELievixXLu {
	NSString *fythmufOumIQRGVlkTd = @"XFkfPMGIRnuVvsQnfMYcGSVOiOKRfYdobIcQUwWTPkDjfYNdrNsgwNPjdKtabNjfOZABwwqeOjsxzBGGRWjqergFdTEBjoYUNrKFAONLtoMmZyZCgccrfPAkmpuaAsTKhiI";
	return fythmufOumIQRGVlkTd;
}

+ (nonnull UIImage *)hcGnfXoyFF :(nonnull NSArray *)BgtAzVcqHLcpJu :(nonnull NSString *)xXDyXtRjWqIJux {
	NSData *ZGLZvnSPmAzTbBNzl = [@"GWgiOLPVySEDxhxahkUFbTSNjXbJODmxCcebalkkeKQlnXuLBcpKEepGTujwiUJEDNGQXQHSlVOxaKeWuzgXxRRqfCIRccNsUOzELkzhANfivrWHFCQmwX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xfCDuUDyCFGasiHwH = [UIImage imageWithData:ZGLZvnSPmAzTbBNzl];
	xfCDuUDyCFGasiHwH = [UIImage imageNamed:@"BWcWJWQNFeBqjXDHaArpFvQyfFcEjFWOueRTWvEvMCfdwiICmicgfCVXcXnPfOLscpAjkMmxkiWhIQIpwEpsBAttBRNQOaDRxmGsFBuEyLPmmsCdfWfDzZWEhpZomyeNZLYeUFJZCEeprsUeKB"];
	return xfCDuUDyCFGasiHwH;
}

- (nonnull NSData *)usBHMrDrCmBFK :(nonnull UIImage *)UvVKiYecYnRgSLmC :(nonnull UIImage *)DoVMciNfYcwGIH :(nonnull NSDictionary *)JCdybLEUKw {
	NSData *HuAChHFiDKGfxjLLeU = [@"KqoWvEEphktHVazRkyzAfSGqOKdSspJIFjnGDsSkCSLnpDVnhicUaoYJUNwCadMwpDyglywFowsbFrzyJEMQZLTQhxqevHloOfbzUzMoKxuQy" dataUsingEncoding:NSUTF8StringEncoding];
	return HuAChHFiDKGfxjLLeU;
}

+ (nonnull NSDictionary *)JVbFJwVOgGidnDdy :(nonnull NSDictionary *)MQEWQvdNNfs {
	NSDictionary *NFHIHpzWvFZzND = @{
		@"VuEGEvQyQHvcDKE": @"vmTXRkaisfYGGUOLYBBiLpDxyXoIvMlmCpBrmloguwsRhDTZzCgVYxtKKABSZMqphljHUTcoSxHZqdeOghaCgGkxuSqLqSDjCvpesPhJwSQAyqAbvBzefmUby",
		@"HSDMjjXSTQjoxG": @"TyNSGKhVsqzRxJHYOzQgoCldVYDawPzGqtXUBRvalBJgVrLPTiFUTqIFStCFnuXqfKJfUxTCOLGDoGQMdBgnHTNTOQpvwmkaSeMvffHePUCoVfcTIoaTgnZOczzIerUwAFUkX",
		@"mOEMGIHHtuqanpVal": @"cBcBzNsuyKKAuhRoTHjRTcprNcbqklHLhwEhCbusxIrcgTpmEMLJyatUebERbmDnKkAyPGmRTRjpcnjoHtGUHNyzhXGtlJLtXPDYkbqkkozDGMRvjyWTnmuxROYZflaQwm",
		@"kOFHgwtBNruLsbUwl": @"XZHvvvWyBrXfHdFfIItmdkzMUaqWEmYwnexTbmpgpbVGAsEPgjJotkLHQogqzabkZCMTSkyMgrOCcMeDCnuLxNxWTdhxABPeXWshc",
		@"wQNoNdtWYhEGZgzbl": @"yytYtLhjWvWSTTdVGhdsgbIgCvxzTdNLzTHgxDInEDyyQXTZKbnAaEAEsNiMbCshWCPmDgPkESouLLqjgImUGrOjXuQzZAxNYwNDBlslUFSVNDDTXkN",
		@"tqUVrAhOVVQ": @"SYZLWqBvxIeleeuKNXgoFnYGaCcXlZiOyYmvjvpTKhKbkrTnfUGAmHjWPcxnkTBLjYeUTSgggiRcOsIuQRYiaqxMriOnFHzKgjFLsAIF",
		@"UdEjDhdWnXetLLcjxZl": @"opFpxqmdMDuLjpbkgGBvkUlCniJSKLmkNpeEDasdbfQUQjRYUErcvAImCLyiUDPtOZUnErDggxdubJGKPVCCnsFCyHSzSARKBCfBL",
		@"GIMwBAuvXtPzOeVKCig": @"MVBNkBGTqKQjkyfobVVwjHklfhXDRLXysKRhUlqPboXYVEySXDiSFEiszlXBIiIratuEhovMtQNQDYNpWkLGqBxdRJrHZjBysNSJRejqEdftHzJrZEUlrOQMWzLUiwTbfgrjAwCWoDMPBWto",
		@"jKnLGYVipCjhOYmcEz": @"uwqlOdyZYJZWTlwpDREvaYToCvTsJZQFdgXEDtVWugvuzQYumGxxFZCOglCRGyCpbrYsYBjwjAWPBpwDXxGbiZpNVoCLkDYUPqiVJMoIvVxaCoQTQSxrv",
		@"VOcaFgupWWJQlBUwYM": @"MJzasVqWhQMSXLoGbSKHvGViPEipHpwpBoVAAZKJYnJDRlGDJrZGXUDpVMNImKWHWwfkAHmmrosJtWIRvsNoPjuIXHmcwcJicRgsCjkeoaNhGrUYYByyaOYs",
		@"BkpgjKVlBuVYl": @"fcrFbrSmgXDvRSZETDJsVZAEDJcsjfkpeJVZCIyHNMGPEgAVADexorZycHUfBzDnXelwDGQJKoqUarrGGaTnyAnAGJbZCCECWohcrbsUHWnFViIiYJcTrzJkbFAqYreJ",
		@"dVpvZeEJRE": @"jfiOmbXDQEiLlZbjmtyIOVVWMfIXtADwfDdZkIkmKaxNsFLniSJwjYjrMjOUqfWOEtFKnkwwvlkxLIVIjklHCWQeyKExtRHknmqhNtXDgTFVvFMRqccRphpbacfqtRlHmBphQKcjDowX",
		@"RBiNTriNMaD": @"gwCBuZcFjPudBEiPZLZQAkTZEXQRskgGpXZqAuOZRcYtPKauizUYqEBZzcvAexOsDINfpCDOpGrcljhdvieizDzFkgCgxUobjCHvvyxrUAXRkoEjfWKpuJZXAxPmdMfOIxNNcATrUdjfjGxB",
		@"wRmGkLbfFE": @"YLayQVEPBcffpChTINphadXNrqgCimWsTtZLTyZSXroQpIxigbOTpXGnibzaEECjPTfeFmzPnETMWvFRMPoqRoxDnKIyzFGlTIPFrhOvDZVUOReejDccjYWZRpHYRywAMljcEldmbTXdqWdVSKG",
		@"ibIyJFNFcGqQ": @"MNhnCgtOANrZvZWwOufmOcfeGIwqiBfrfweURaVzaTFRBqiVkltkSpWREDRyNVngQRQdxagGmNbXdxPgeEZHUllBtnWIZzfsVUorReVTTKjYlnGdwImXNvZtOtv",
	};
	return NFHIHpzWvFZzND;
}

- (nonnull NSData *)yDxpfuhJefj :(nonnull NSData *)LzQLneJFOAyQwivlok :(nonnull UIImage *)kKFGQDgJSnuqAsMf {
	NSData *VJLlSHzIpnf = [@"bfcXZsofqqUJwFHGdhnAkGsPKNJxdktgwovdnIZwUfqFbzxnGPJuHSMOZZLCQjzltDVGddZnMtXaAzPFHijmtXBTRDOPhkyrWDEyDBb" dataUsingEncoding:NSUTF8StringEncoding];
	return VJLlSHzIpnf;
}

- (nonnull UIImage *)ZnFwqOebULOfWyJNLeH :(nonnull NSData *)PFilMlHWYEZRwcsN :(nonnull NSData *)NmgpJnVzfiy :(nonnull NSArray *)OefOiWRkxmdpbd {
	NSData *tuVYPZLVarDfonNoWa = [@"aTllzvgWHViovKUUfPGUwSCcHQiYIoPeLweNSgsQANvdRvAqtKREEkZYGLdcwqIyAUdAiLoYtfXryjBUAoJsutlmfaXbJSggggsPzAEiUIReXaKGdENLBNCsPmAJQPKKjgtosOSLapbG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rkmJNIYWVaJscgDq = [UIImage imageWithData:tuVYPZLVarDfonNoWa];
	rkmJNIYWVaJscgDq = [UIImage imageNamed:@"UTxWVUUlAnQiDwazaOtJUStSgCYWkQkJUGyAUMsdZQuvZZcSfztRoKXjqrlWnqvSSNEpzllQjFypCyUFCMYUtxwzTFZvgpefjebasvevzJiKkbcogWmtTahwFuTLiSqQlyhalQXajBZTLuXyKkkzd"];
	return rkmJNIYWVaJscgDq;
}

- (nonnull NSArray *)VwCgzGEgJul :(nonnull UIImage *)YWIgEzwULgwMgVYOQ :(nonnull NSArray *)wWTIZGFuqYlnpT :(nonnull NSString *)NHnndKnxrZStW {
	NSArray *QxkqZGlJmOTuT = @[
		@"xkSNBSbGXDDvjsgrWoBAkhYyHDkSGKbwKLMrbkhrOsEoiAiBfMUpTMCkMlNFneqoBCZgYEezMwsPWMboOvEgHpzDwDbTjGnQHZYzxbZAYfWcQnOerdBqaupKY",
		@"WgSRKrGsdgXnidtBGpajnnnJgSzooCNzkHQaQKyuiXuqfVtDqSydxNkeeEmbCaEXREPXIksRoaFgUYBaMIKougBgCzcgIDcjuEbDDnMuqGVvUGvQoIvTYRvqj",
		@"JMvHHxILvqXyQXjCwdtkLwAuoNbqzrptzAmSMmIqIuuCYsUYEnThfNXdkCyXbjiJdVlPBGZqaDmNmVBaalMtrWvWaAUshfKQnoWUrcjOuQqIrsmGYgbyr",
		@"QEPvpYfqPLtktkrnPikTmmGgNrapdstrFPZLsGHjKlagVdzknlJwAQWJVvBKuQEEexIbUqjGlyipwXaSvIpfXHtyOYQclZFppMroDYethqrNQhgNphvuSNClOXvaueHsoTvXsMslkhSNhdvNqSf",
		@"hxjLQaKqQHwNebqNhcePVgvEaKQNhUXWbczVWypKSXbPAcSswXULaTmtSFilpkmMVlafNEgnZJozWDjZrhCKGvZMzWOPNzMucZsLTikWpggENjsWooiu",
		@"LJpjapJALJZNxDJPLuuUGHEtgdiNDzYpZWaDDNkWuiETwqrwXKHqEAjCgWfufNDYbNsdClAvErATrCfpYCUwRKpIJZPsXfZMKMAixepLIUGcyiZRniJGrHXHWqaFJXDHEOcWtCEssFLhkxuFQVoKW",
		@"VoMpFeHipbdeMcOAxbqASPHsMAWlXpeFkebJOHSRghqHCbOkoRyfDjfiqMpunuFOPeqRHNItepHlKoMhmbRJkYsyRNnvtJxEkWKH",
		@"jJOuyDAYMpYsZlIBzHfAPGqeupNDbyxdiasqCNcswvrLYrIdixzsORfKYjknJMIqzPMHIgxqrSCZkvbILjNaYlWAaXjksMCSdobbeZjLFODpBvzEsE",
		@"PglImVWJIcjnlMHeIgeESesqqgESRJokNQemIJRxThMkIvjVqZzRzkEKQSzsGTXoqifjFdKrKkDcKjgJXtTnqLxTyeZeaLitiovNDPvKoiUEMKjsWPnrGcLhWspoWi",
		@"YrqMsLHTTbQQQYLoYRjiVsKacmtTwBPOFHgEzZlusydxQgkigCfIfYyWmyKtGYrvqNzvHMLFNIDqBTbMFszkmFQrdcwkmNFvdyvMzyvaMqlPxJfZYNMGlXeJFRlXBIRC",
		@"pCcLojmmmpIFTUwFxqTkrqZIVxxVanmkuoqIbsBCrbOwNhprBQbtvTSHcyDnlWCXsysCDpxRDYAuplyzAJxCckOdnPCIhQYbzHQpVVCe",
		@"wQazjybprHbUVBFOMLjViCsjsGxOieYgoblTObCLoSJxBpqBWpHUsTIpxVdeNWOjziqTfoLEhytnaOgBMCJgCvTESBlvsabzbInQNbyAaRGpDxxdFInuyqTqPLQOoecMnTl",
		@"SicFThHXgeaNqoiVXbPSrFYohuImLaarPIXsaFMWOojtEnNyIkeCDRcZFQGHTkePAszIiZdRKywQSZDcsptraWDatgXoNjEpnRweDdtZPOGEzMEWpQqGq",
	];
	return QxkqZGlJmOTuT;
}

+ (nonnull UIImage *)MBWdbnUGDlNtKjpDM :(nonnull UIImage *)TkSDzxcTta :(nonnull NSString *)WwHgmfpoGKzk :(nonnull NSArray *)OloIpYLqpjrmiMevlu {
	NSData *DfmlWXWFIVnIxY = [@"hczukaRWVnSCsypSdGQarhxMYkHmFcCEiiwvgFobzqeAGLqSlkWsbjiSFbBLRevgasHjyhCxPAcZjWjOBckfizpPyXBKDvKVsyrurBvXPaIDDmmqdtHsedtMcLLDBrQoQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JDlohxjxRTvMD = [UIImage imageWithData:DfmlWXWFIVnIxY];
	JDlohxjxRTvMD = [UIImage imageNamed:@"IlFKjtabrhviXoUVmScPkAExBUbdDspjmqLQOsfOhfTFTNzBKUMUzCWmpCYeXPyzUYpNQoVfYlcqkaoSgkfxZqJrDKZJuAGSyjgxiTJhbtOUJYpZKFLNOWLMSOWFGZGWULLHhNiNnYHWx"];
	return JDlohxjxRTvMD;
}

- (nonnull UIImage *)aHvkCINkRWB :(nonnull NSData *)RWGQbjcwYnXSiw :(nonnull NSArray *)xBQxedglteXGWpUNtak :(nonnull NSArray *)uErWRemMdkNMSQ {
	NSData *qbQvliukxhYtTdWizRq = [@"lcBRcyFFkUMKnaIaxAqiGenWWFieOVnhGnjAMJbDADqWthpnrPTeDLLPzbsdPQvYIkNWKgaDCxzMQxZkEOwUQefodBtvmDWVgzhscpmxmmgpOUQPMqphYLaNRxCnpWVrLrdDneKmnNjey" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oSJZDBdnIk = [UIImage imageWithData:qbQvliukxhYtTdWizRq];
	oSJZDBdnIk = [UIImage imageNamed:@"FvtSAcKXpscHVzYScQYMlTEGQIfltQUppCajMiPirwIlSylSvTPBOHNuYfiTvLpeYEWigPcCMeJNuCRThkxQgajrKfzTfKWOtXuflXpjXrFcDQoQuKXYFEcBQOcenyIbTaerlTYAOyWYklC"];
	return oSJZDBdnIk;
}

+ (nonnull NSArray *)jwlJCJzlXJGw :(nonnull NSData *)xUfmDXjHUWxJFr :(nonnull NSArray *)taVfEhfumbeMna {
	NSArray *LqmDuJCavNDhNL = @[
		@"ILQbuMEwImfDWXbRGOoxwSiZfQtBFYojjmTGMDSPqgJWRwKQFvsoPTDacpNklSWOrFoKFDvpDiWyfkxkYmNKTdlkLbutmcQJjMBnY",
		@"KCfzeiqkBJxjShAiNiDGVbLKcHWViwBAVFsYKPJZCtTfJKdjBIsyacahTOvenFPrVsJVrQZFssnTvPIWsYkdeyEDBBPBnIpmYSDvmcJNwWNXdyUtGVCnPAHRuNABktqReDCQHWNjR",
		@"KeGBwqXAKqppOPtghUilHkVxOxWlJDhCgtwYvFHcrZJADQqnNGJYjEnrphWKAGMnnltOYJGJWGwxRKAFnCFcbiQzZLSfHEciatqSQDcjiWswoYjobqJyXdXZf",
		@"hqtsEHmUIdzEHhdKzgoLdpUJaReetKClwnyREEXHgflwytgEAHfHAdDeGEutxzQyEXEnlLtagEeHOcrDyUgldJIsYOidZGgVvBIFQnCOngZhObZgGwwEkFDZImfPnXORGAUjEUw",
		@"FFXLJZkvhTPkHfEXAStBPbkGWYNdsmqUVYBoOjAjmKoJJQlmSYjqPLChbAnGcMOvNHVRHoXsVNHihugmvJyTEiCHXneYidYpYfHMcSELaEXCytXszOOAFrl",
		@"rHPmAHXoQkuIFwRopnHAGrhaUAIHJJxXZgdTeDrDKXtwvuTwLcjdudpGGmTyPosOierqwVeWtIEITeXSjDqGuALkzGCTSqmgtUOfPVMUhJLchIYkWUxrTqPXRvUAbpNKvjogaxgxKumzNjzCJZD",
		@"DfEPTqXhbviHCOjIxgYxyCxSGIgcADrwSoXjKYzRVbbhEZIvfJmZEXCczEUxWqKvOVRCcIRaaXSfYNcYFroVYNkkiHJcWwPsrOeIcVMY",
		@"aurZvNqkeJAgtSWFYfyjGCzDeLobCumtwtxJPeGhdEwGQdPbWwEARgcaXgmZXwcbJrzCxkzTdKgCxmlCMWOWpfSlWhZIEEoZXOlerjvFZsHUXbfeBwzvnZAPNuhHdlHLYnM",
		@"phviCbuuHNSIXoLVrmLaOkYxOBCZgbAJhMAUpZmxhcbjCoNdiBquBJQEYeRsZtmuzbZSkVMYHPVoGFXDyOSDatTxZnVPYQdNNNTivCeMvvGyKPpdNPSbrVqVlygIRKJUbze",
		@"EIEyoqdjIZjSubOyCJolexoWwkCWoqPSwCfHqGwgHxVHsqtSnMQYRuzYGqSCivmOQzFdFKCuCOUWTwYvAjzfgaWNKaYAuVGaezaLaOJgTwwHVTxHUJkwyLjUDiBGtKLkisBRKCK",
		@"dDZGyNNilnLOHMgjVLVXriSHzOKdHeAVfKRyEINKqxNaJobdMubjItlOXQhxrphmMCgYeZuPuCmLvhGwpGZmsChwNooCRHCoiXbQnOAMQ",
	];
	return LqmDuJCavNDhNL;
}

- (nonnull NSArray *)VIZcmIyflDHyBHPmAz :(nonnull NSString *)pgdHUxzYfRaoyxyiONb {
	NSArray *eDhJpnEdcqBGUgVzpWP = @[
		@"lxLDZVCkFAphzRwElCLZSZVAzFPZsRCZtunCNFuXBCptEZOUTGXXXtGFuveMumGZYCKxwEAHUMxFfiDHivmrKFyvuPfOmskHLzMoJintGmoXxQxpNH",
		@"pUWEMDSIGnobbdHfnrEktcoSvBeNsvivPMTcOYnAwlDcPylFaVGZfZkLyyfNYfBRnJuPBAZyKOblTRSowHNiMnjZAWLiJiocLdzEYHSeZhQCAksZQxCCHapIfGunT",
		@"MwizlFnbZTMInsKqFpenyYDKVctWKpjStDEqYtUjVxyZbHrAvufrsqmQopLmlvrhPhRbiZBlVUHvtRfGmZjnKgJYnkvecagEOEelGgyjEWwTOCFxfjXgXbzMmstsrSIkuCRikadJyZbaDm",
		@"ANqnqZCsOrpmvvZmgcIVeJIWsnCBZxPjDfbWENqQkywHdAJolUrpLOMYdEgTQBoIWZaBFuNbLtvrnyPbfjNATSstAFgKElOzufxIUvplupFgKxIXvZMKGWWxcSTtxDvDlZhntGHflAGodfrMdjGdz",
		@"gPHhdEVjFPzVlUhWDEckHGJXTnYAuqqPvZDIFmEaZXpJZpLPOkvwgYnsyBLUXvoAxBbwCJLRsWOEEBEzRnTcvlLVjILtvVReBINXgTGuAfTWTjWtzkTiuyyTRDbzHiKdxFs",
		@"xJUWCQCeRVDGiuKbOEiQOKlrWfVLcVsYVjupsRMIopGCzXitTlsyjEuvJQhqYpcOdYAVSthWMxxweYDwIRtRlcIguqrSnKxKSPVtwNEGayWnTuokRCbXNUkYxpusNGgbd",
		@"evRXpqDTBCySwodswmvEriKdbWLngAljZfCRKpJbthxIyAMFjFnRvZoOzPRuUmGgDoLDIcATssVSxPDJyITNwoZMfMTawecxBUKEhvUbdXhoGQygRDkTtmPNXEvlL",
		@"LBInYafWdmrqnoZiUuxJdsEttJcBCzsPWSiFRmLkXpnPKcsupXfhlkMnrDxyYjQXMvcTAQSuBmRAUEvihbIeBcRZaaFDtGrctBTnTOiUrmbQYSERrIZAJVp",
		@"VsWsefoPFzITlKNEMEBWWRBtNsCJbzesGUdHbfXIKBYIjsUWGWMkgiignBNdwrFhECCZJlPYLNkLovomNvTCsIubNMWIrUDOhmnFaCuEGaXDNpTCeqhUXSMqdRmjWabDaAZnOim",
		@"HreqpidTRwyUGIGzgrsolFAGiZjluzuKPVrqeNybQSgPwIAoIPJViSgKubPZwsGwTZnbErZIxEdrCKKaNFfpJvSWhOCadgYEkOgU",
		@"gKxWASCNVRwteqCLXTwvhrwZfurVYvIVtNQzXKWINvwQbEIcfiuUNepWkzGvikbOlYitNlWOfUuWbqmzkbiMkapXxjAMoEJrqLjewuwgnlCNyvHzVkIzzOOXcPajiFtOsMt",
		@"NSmODWYPXRRjbPonGYjNwZdEbQMoppTFmkkyNayIINUMUjGZDNUiRJNrEVgGGILVIhWGTAGaTYAAYikpkCzWwQdGTiUJGbTUldAtUdYGboCrEPFGxePVJkKsbliyPPPzNiKmP",
		@"XBbrmnFgtNVQjfiFoMxTNCySRUDJkxXKSVnJOVXSdSZwGUmtYyBXBPABAHDPbdnkslTKVThctamUwTxoKUjgoIEYYejomVNiUWjukgaDLC",
	];
	return eDhJpnEdcqBGUgVzpWP;
}

- (nonnull NSDictionary *)znjbbpNMEcbrFZDB :(nonnull NSData *)hgUvnHDYIq :(nonnull UIImage *)yjzyhmlihsflyUuMlGW {
	NSDictionary *QgQjuKXrpsyyWfG = @{
		@"sxLSnHUysNT": @"jNrDsQoiCiNqMYuNyFrSMazYkITsqOoPcdMZemkmyfmMHqGRVATPqLlmcezbBibFyPteBRiEHPQMnCgWxpIUcjfyCoXHwyCfkbeZbgJrVoWuJdWgNfzoDuxpRxTxBG",
		@"qrIAjplSGw": @"KsrdlgcALDGqkXZLsmmAMobmsnKhqeZDAYAIlGvoKDOYtblCXwzYAaKQaGfVmJTYwqIiuBReQcItJPxIpIbdOGbaZJJRIoeUxMztjoDWcAeYbBShydooqwgqvLeAYgUwADRHqgTJYFoGVyBsoQgNw",
		@"uVfEHXKpfuLXgbgE": @"nISWqLkicJnCgLBnqRCLQlKDIplymGTeVNfJYZSfqCmSPihfkWsdUAykXBOBdGpRnZSlMZttDvEzmVyDyxvMOYJgFJRPrytBnXnAcxmoEBckPSTWegqMTqBptEHYZKgbvDMWtgb",
		@"vZueCoanLxXR": @"nzOLnSMWnJNmOHOndKdXuOmOAnCYlvGkmZzmEvWgZGAgDPSBFsaDIyAsJHZsJcHlYnhOQoRcAumOpHayZitVmUTOwlNqhXyMNygmQgtJFvQIjwpHBIKgMgnNpijWFwVnY",
		@"rvSiTqBmzN": @"NRuXQtnkSrnmqiqaWvkNXhbxSWEokMMiJGwziJFUVoccyjiyqdWVkgvLHLzsOytBBVmzcHoGZOPEkQHhEjMwJeQDRNSkgiokUboQYfBtBSCv",
		@"bVdecZBTkWejdnM": @"uYveMpVdjOXJdTGytvbIqBhhGTJsWMRorpxSiJVRGphoPZYhNMuodXXEmRSiFmQkSjNwvFSgMELpBkMCaLgwwkPOpnIgQaTSZpnimbF",
		@"BhleezhvFFDvybiZ": @"oMEHSPcDJXYjIsMcjUqUwBDuwIFeBNZintZdTTlsfmaryVinUqIraSwWBNzbZLxPfOFRiyWTzDLRgmVycqZFsdtRGnklOZOVUtgBNXNisyhRz",
		@"REPFURJPEwPsJYo": @"VFHzPBTVfJGDwaRBnktbmgZGhXJIEsviKaCNVdNQqYVlbKdNCvofiTisYQiYMdyiXZBuKLTbNdTlISSbXyJOaLSfBGOUTdUGGvqXDIkUcMPfjCLPNwK",
		@"WQLCaelGdJpLpbDLZ": @"sgrGPiOLpcZTeReQtpSkbchHwaIsiDlJEMLoqxDWlbkcYSKogCnjCQyHmCosMcUJqrGbjJfhLUEAiJzIOBqZdPEAMscRKSnzPPsOOefHfxb",
		@"KeZHzJRbHjTKhXN": @"RQiacZBweqsNzOaqyKFXcdIlNobkjEOogrAsRKsUKCJsoYHdaCIWIEukUhKQkPLkZNDWltVVWKyzEcYRufknGOviKWazNRtaEEjPoDHovUdYELMbUQ",
		@"RgOSbeegmQaVjFXYb": @"lBNXGToyLNjUJTMzJHYIkXNAOfBrndavYDnribjFjJHLvmEEwDZkggBmgjAkQwZQbpNSiXHrwkXJcnbxfvdDQXZDrkmNUpvEIhnRdVeNmdivUwUamNIN",
	};
	return QgQjuKXrpsyyWfG;
}

+ (nonnull NSDictionary *)AaBuOrGAJtzrH :(nonnull NSData *)GyFloELbMXLJU :(nonnull NSData *)xwrVDFlPVMMUQ :(nonnull NSData *)aIAHVmnSXLuKhA {
	NSDictionary *RmIEdLeLvgHOzMVgr = @{
		@"ctvrVJNoGgifWyINlaN": @"wZFBEpfYndRqztfvWoIXWzDMTiMPKjWGLEtLXHUShXNCyrBaMAzhsYqKQHqSYcVmZsNjbrxkAZOMwNcigqMWyVCmRItdIHbLIVMwuyam",
		@"beTUDyZbJDFlhxEMwY": @"StyZurrtEdGmDAXkRYsQWkWywDjrXDsbTNzVSnxciALzDcprCPzniAKuKcZlvnMwsoRZRkWGTLHAHHCKSSoZmAvTRmvoXrWQUNrGLELEOsGuuTHkOD",
		@"MNxAuSBKZUjoqpRaybK": @"cHDUaiHfisEwCmzyslWmBLgXNxXCwrrXAcqAuvQtQTFqERippvKAnIVhkZuVsvuZTtAOKcrrKdxtMFlpcsJPmROdngvhyClEcSTMPXqjNOYDAHwWGWQ",
		@"yCuGHFBunCXd": @"BVENjSNWRJPxwClrkVQbTIQrdlEFZACnOhiAXgbMuQudptmqxRrNobqgiYkOtMoaEmURYgyzDixIzVlIKQnXGSNRfTXyvuswECNhOsmsZbVKIDhZeFpriDabdiDIhmjhhMWHkSl",
		@"AcRbFupjqlrDujzUi": @"FWIJEjNqSSgYqFgPTsvjtDxfrJYSFlSjImAERGWhJlgUrzTwowVSuHSFQoBMIUXTYUtlVvVKDisKaakfgYMlsPThTualzHAkxWdlHpBz",
		@"IDtrsIOtaEzqKoP": @"MEHjHlmVDvGRRCzdtSokRmgFnasTmYmawrHajDOfKOaoHlwXatXHRzGnugdODAUJpPrXfCNunKuMpqHyJstxABXmSKbrmCZKUlWCKizhJcdfMfPuBqsReEyDrQYLEd",
		@"eBmOwYERYyL": @"TzOCJCqtLuIjAzYmSJPURQDdGqdDJHUlNyHVvLaIPlPXqxlaMaVKfQXPViRhwKSJMasKLewRoWeIbKaJMpJkyRXAGlaAJgraOAyrnZeYZcXkuaOu",
		@"PZWiWmHvifBmjSb": @"QeUajnmqRFVCJIQobtqsUhgAQfxRhDyAqtGINMRChbkQnWRpINRStInxrprGPhEOnYTKEboLyBJitdlgLAqSRmktdFdqHRcChoyVrduBHpfBgsfOmvDFAgIlINWhp",
		@"KZnhcxWCSkj": @"yVLUygylHteNONsdPjlHRqVDGbLkqHwzgfuOBqSyTuiUBkPRmIbQCyMgaqfPrksutvfvHIzctykjRBqYUbShUaBHAjpbnwaoXOvfQCNKunTtsFplwZFTAoqvkjDX",
		@"fdvrFETjjiPIMpEls": @"vTocejYVwyBEdSCWWIZXnkwkVnuEZJOynzlCRqMgxrsEvclLBLnagmwJnZmCErYaEAJKpkAFJWsDCZAYnwdtIIujwffORAgerswrnAeLZIDmJVjml",
		@"ojwDRQVCpVrsWVjmNK": @"NaWQqnPGkeemPppLJwyXkZfWFsoTmzYUfQnydWJAEKfgqiRTEcpxHkpgKuHpXuyuzqlrFpaBpelYDImOVMFhgvHaHwElYprRVKztpdSuNANjfJuvknjf",
		@"FzEuWtpZAH": @"ZUCFhEroycdaBiFSvfWiyZzswCmpIcASODgwGqwIZxXfDnxlMnHAiVoHTKahfbpTfQcvkinAjvSYZECBJebVKXniedhlRGNIATEHEKjvBsmiZexJoxlFKdavJ",
		@"iWNRPNOmxPDjdKO": @"BUwKWPcCaOlfocXlkgOjsjmyjUeMamVnZXtboUqxVyjNwaZeyigXGoDWznboaygEXGiwxFMUoxdMFMCoVtXGfrCCtTscfJRpzqEgIqkfZpCrWrDFeEBWfJlEEhCvYBCKAZS",
		@"JruEWvbkZVGEiO": @"uIKZVykShWwTGDSZsDwuSieYSnZZIiSTkWvBUekTXpNdWrdbdhbKcvNMIdXjlRLxUQBNsbTdlfFbUhgBnOFNwwhdejimOmGcypgrHcdPCzOKLaJWAvFuNPETvteHNincZFkxQicNOoStgtPMUaxHU",
		@"ubZRctESblPvlZFlkB": @"LuuICTdpeqJHlCTTTTBZFjwuvdcQFwGEddpBlbLsTiZOQjlaqnSLvLTzWcCMpmdDHahYVbyKLTMBeeqnsqqQgCMHfeoVcILgMJMKwKgVtWBWKnWaxiwPUOYKj",
		@"kEUYuoOBMymH": @"cUmFNAKWBreKrSgtTjLyyrkGQroFblfzQYfKvdoNfaIjcjMhlrZmBqfJFFztnnhzByqmiRdYOvmSaUxVXHLwOpZiIPwoEbRzHVwKQZZV",
		@"qsgrBIQTwQjyDmqqe": @"zGleQfrktlxyXbTpVkGKPKSXTLapYGYZwkVhMundaBnULNieEhdAIBPGHwIUPCbojQUDALiFLrmufmQfbzlslrXMejpAdvXjncrKXnywmjdtjPB",
	};
	return RmIEdLeLvgHOzMVgr;
}

+ (nonnull UIImage *)bMVpgWEfPesA :(nonnull NSData *)nVdTdLwWCbgc :(nonnull UIImage *)tRGBmloJneyhunhOie :(nonnull NSDictionary *)ywoJOWMsvWRzifUgUqR {
	NSData *TQFgNxVNjMYfuwFXxM = [@"ayVmjPmufKfIbNrAbNuHSykvKuCyavQJAkTVZPHqcVERJouizECRkuBwKhwuyKWmbmmtlBhyyIeHbhAtflNbQwGjOaLHllUNcKVMFTKf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZRzuKypYMDkMveexT = [UIImage imageWithData:TQFgNxVNjMYfuwFXxM];
	ZRzuKypYMDkMveexT = [UIImage imageNamed:@"prjgDPkaaBMDVWvzCuHPQzEaPRuFYtUdasjglsyQncCxepCFWSRkmjKlxszmeWxSkKGQuxLyZijAUqrMGuIcBopuMEcUsCmJsZwEJvuHq"];
	return ZRzuKypYMDkMveexT;
}

+ (nonnull UIImage *)KakGnAQzSfaIyXlS :(nonnull NSData *)FEtyYubLmepm {
	NSData *fBYXwzQqCImxB = [@"vIpdleLHtFvxEaYLliZqPLjLRPfaUhFOIvPLqszeBMoCTxXlkMLwjVAOlVgqCoDavKvBIcGhYzzdGeWfXxyZUpVBOEvIZgUsfFUDSUvJzDdIndFBzvQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *olfQPWZBBcjGPtb = [UIImage imageWithData:fBYXwzQqCImxB];
	olfQPWZBBcjGPtb = [UIImage imageNamed:@"UjNiEoWpIkKmDpyPCwveHoCGRikIJXdnKcuQHqKxgXMKUgtKAIYqgVonfjJKWqomJisLAMopZelSVyvXFXFAwyofoESgAzbnHwIujNdwHuHvyuJaRisKHLtusEeuXh"];
	return olfQPWZBBcjGPtb;
}

- (nonnull UIImage *)KyXHopbMSktuywVMBEt :(nonnull NSArray *)mxZufxWKKhhYKLUdaFX {
	NSData *KleHRUySABykEDQeRr = [@"JuepIwBFeUMyYuqQkzjjwiQmTGnSBunjuPXifAqbQMAjWHjvQCingNfLzXkCxxFfqpjxJSOVoMWxuevNMtkzqmYGKnOpvBvnbPkoQBjaezSxktHwHxbXeIane" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QtHLrBPkAJlqN = [UIImage imageWithData:KleHRUySABykEDQeRr];
	QtHLrBPkAJlqN = [UIImage imageNamed:@"tRUkrVUHgnyYLvXpsxUHDvjlXdxHtGThQzLNJuGFWvncAsIOQitGfUpqciiixapnEYUepoiVVkrSjSqhQuZLyLvrLAkPHzNxblanpjmtSPTQRrSxMDly"];
	return QtHLrBPkAJlqN;
}

- (nonnull NSString *)NQWmbkqVaoOuwTWDTes :(nonnull NSDictionary *)aAgYNtbcjsuLp :(nonnull UIImage *)grUoxibjsWC :(nonnull NSData *)FHPbvsRltXsfPb {
	NSString *NfeIrkVdsO = @"dPptPtskjGSOkjYSQGewyUaCOSKcWOQeTHEGrUsHDXGFGNrrVfRiCPmerlewtczdWFFnUaLTYVHVlyoexOZzVWWfnrNvTnzzNMTLqNPztzqtNgQfRazbDsCyHK";
	return NfeIrkVdsO;
}

- (nonnull NSData *)ntuWMwNZozxXQGL :(nonnull UIImage *)REysobZNgwPFfkzZZKn {
	NSData *SbwAUQmHbTTu = [@"JNEplUdeiTExxLXnjujmEfkkwlRoxldoEkssNkHbHeIRIkzbCEyvbFVZondmqFWYbBWstCREjyrZMCGwnkAITYUjSNAAIJxMvZfIThjnoEsbqawFZgWdSpYOObzePDBXxjEFMuiSIhrabFT" dataUsingEncoding:NSUTF8StringEncoding];
	return SbwAUQmHbTTu;
}

+ (nonnull NSArray *)MTcLzHCKHr :(nonnull NSString *)loLNzyrHaAiTSGU :(nonnull NSData *)WJspSqzRdd :(nonnull NSDictionary *)enfbnUmywLeG {
	NSArray *cvzoJxYUyVZGolvb = @[
		@"rYIbgPVLgdPraFmollZmFNHtCnWSyaqfAtUZwnujrYyPCZimdFryKfRMBazHCmeyaWSODwWqzaRdiedsYmIIfDPkehdwrvbhuTztagGjlEJhGCccxvaMilpeiqCBNeErfeyZfFIpcPXtcjAh",
		@"WZVwneaNBVPLzvvvSIdwbxEYjFvgDJWuYWyKCbUJbcrdlWcmxIZIivsCAwnSieYBUjVoRJQGnPbjiJjCiyQPZRIUxrPXtTjApwJmLCEGybOQKp",
		@"RRKRezWqUDjlcbXFjiKGBxrZAXWeZwSqGLXITygRHlYpCOJeoPqPAzJqkPTXIKCGtQfxDebyuAzySgktzYmbKzHZrBAfiBGPZWscEIZTQDDgQPowKWxzRuKZRbprcpWduvJYrpGVQQEgKIR",
		@"wQyEODRqrzBzqEvYbqRhfoDJXLVlRAxiiWOjcIXRtWksuklSGXFwndXkmQMYHsFhFcLwQaUktRplVEijxjDQyLYsyljHXDGQJMkeyoEgCUoJSujIXkKrBJdpuAFUnZrPeerEfWLSbe",
		@"oHypVxBPrrkcKTDQMICcDcaeyDqGkGQaGsAwAwzegufdaehPBczcOSwGgNCZlZWLxXvTTkkMJXqTKlQVAKkAxPkZsaxEHYuUXrNKMWoNjrlRUqJzeldbF",
		@"QXFzDyCJJAIboVzNirIQEyfNZIoWFVjhNpsIQZvxMVyioZUvvFQPsimumRoTPDHuWGeXdnHsSftbrsAxGqViAvrnYcuigbVhvciHP",
		@"BDplcGQgHSPnNkqZUlERwiZwqfIBEeKpmjfoJZxwcrhXFSnHLIobhuTvyAhdIHGHqoklYmADDmILRNfqGtsARTTNbjbyJKOpgGAWvbsFJAyEAfuoXvFEFRLwuyeYkzIlCCfxZFYxYh",
		@"EmUsMzfQHJhFVTFVjaQGaRwpXVOSKQspzUFyRgyVUVVHSNlqusTYikvFaTispgHruFKzOOSZhjzBpYbMBfydVMaRNELKIcUOyGtfxrYEjXPfUSCPvsWzMiDpQdOu",
		@"PRhQuznBlnkVyDoGoeGOCTsTLxnlrzVwoeeYVIjjdGJLDgFuHwrraERAapcPFAiHLylnSxODWZvprPzRDpLMYNOZWSaOShJnXPoeuwMjKlQJhWzfGGXvWfQjkxDKeynAcwvzoIh",
		@"rxSwwjUVZApSSRSlsyZjhViKhCOOIooGEPgdSlxuyrdJOuJgKDaxkCRsdcPYMcYZaUAKgXGpfBYzKdZEkUxFUuApmiGRfBUyBZDuXggVUOoubsIAFsmbfzVCKjyxarfDLUAWQgxYtAsFzoUSG",
		@"DNajCLfKQENdnKYhxsRnzIvHYHBfPozJNgEspAWXaRvnHVkXScwgTXjXiBFLVPShotbnmHyAjyaZaUAHcoAhdiETuMJGDviUTJmMlzIYOTM",
		@"mpPBWRcAwRSmgyNuvZogALZvnSmvuAFiiFnKiPxjrjLKVfRuamKmLXDRJVlzcVvUCDOSFqOqCtAwbixvmyBcwazAoelSUqMxVuDZDWjvXzCSLjCGEBITUhigLrOpGMWATwZAqS",
		@"eTHvcyLSZxZgVjKsBFPArUCKIoTmIPzwsjrRjEDjuWidIowNwxsLxuijbesCkZJUvdTJGHjJJpEsSgkxBDueAVFyTroJxPwRvYIywhfGYapGPAIIIPOutXZmn",
		@"vQAKJywmfYSjSnjohHlCFaUADPLWVyXBfEMiecwBYkrgUKBulBwqxjBgGIwCFIABDoWWhshDhzTTpLwryqZVmmFZKyTICjXVQgtq",
		@"TDPhUGZztuBFEjPQkNvYbMtqGGHguUhunvuAdZronQnisefBMoHZhQQVhyTIinLomahYpEfMuNQffdQfGFiXSYFfPvqSqJgBYgGppCvBZBDFydhyWtdloHqNHByYgeCinMGZkNZoqnSkqhBCdn",
	];
	return cvzoJxYUyVZGolvb;
}

+ (nonnull NSData *)bMAvJDvNdzVVe :(nonnull UIImage *)RqnmOGbmRxOF :(nonnull NSDictionary *)OEwZWOrfbj :(nonnull NSArray *)ToausFNyJxyTvAhzgM {
	NSData *ZtSbjWXYZkdG = [@"YtthVWFJMcKQkEHYxanmHgfgkPfSuWuxUTHMCDCLthPbYcYqBvhUMVTcIHmVbWvdIQHDPOkayeVAgVGkhGYvVtRqeqOfBzeJtHwYOBHmUKKDBcUSUXcZxYUEvBMXs" dataUsingEncoding:NSUTF8StringEncoding];
	return ZtSbjWXYZkdG;
}

+ (nonnull UIImage *)RgmXTjDBeZSR :(nonnull NSData *)budAnrNfzVAUjeHT :(nonnull NSArray *)iQtKqKThRBLotKngFfl :(nonnull NSData *)VxwtolfDrHsxJLzY {
	NSData *muPubBruVLttPIP = [@"QjjDaqPiCcRZcUNcpleWEukUfrTVYRYFCZaVJUQaQShtdAykmgKbqAAIiaEizcYePieMeyrKXlFAXyObpFNoGIWcTybtWghoeocSLO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iJoiwZiWzroG = [UIImage imageWithData:muPubBruVLttPIP];
	iJoiwZiWzroG = [UIImage imageNamed:@"WebSpqMYhClyjLIAPZnKCMzmJWelBHVYBoMlUBrJlCjVMiNlmngGlcjKVZdOiuQVBHqKftYfUIjKLXePRKCzVFIQHOEvCJAsLJcyoaYxe"];
	return iJoiwZiWzroG;
}

+ (nonnull NSData *)JktpEaKObmUYzZkUvdg :(nonnull NSData *)WSNXvWphutCg {
	NSData *hqioCqFufyUMQXAv = [@"GnzGgEJKXCVQTYAilVhGDfCsvknnIYvMFdwsQAmbrYAfpZAalyycEiAPXhNjMzUkdNuRDJfztCiejrfhJBrpkHlrxltDMQGFsySOvigfyzmLuCdmpqqMTAiWU" dataUsingEncoding:NSUTF8StringEncoding];
	return hqioCqFufyUMQXAv;
}

+ (nonnull NSArray *)imjwfeQyWMMiueiuCQ :(nonnull NSString *)OHwAtelJqcPDrn :(nonnull NSDictionary *)QaVblvynPHqDMwdeHB :(nonnull UIImage *)tshYVFuHmlXdEkkt {
	NSArray *aCfpchhNajlLI = @[
		@"dNDMapjWHZuKmMGxInFYdhdpjMZHTiNgFNnXjSAdRZEVxDdnfHsVboqEWONrordRNzZHQaGnyTQUgKGpJjJorcFKKVrPRzBtpLvJecoedIAtiqLNqChuXH",
		@"xraISilaXZSOnygDoJFYNmfmnhjVuRlRsTKRSmSKTbkEaEENhoYYPLuhKElhnhBzQGLdJpETEThJvnKJEmqBQkIsKDavZfkKbeHEgaOZMDDHvlaeqKvyrCEsSx",
		@"vGEOPGhUNltrjjduvxEwvPpvhngkgaTtQirlaRSMOqIVyxxHGTJzqsWKHFEONmmkcfBeBxQCzfxVkoDChPxxUIYnzVEeVZksEnDncCccsZwORY",
		@"BHFrxZneToMQLRgbmhxVQmeqNSWqviHxwmNdplrFNkmiiBkRVLcWJPkrZuuUwrkVklMmrkbxztABwaMspKAdRfFPxaqhJEQDZtzSShRqbnzTJvHeicsrjSITX",
		@"OmCXIYvzhYkhrwhFWYwTjtwqnBwfGlVIIINJRKKQnCOqmavWKBrUkyEFLRMAhqRzMnuVeZkADxXuldBNGSUYCpPpWUSwAOJxGuQfOBDgIGa",
		@"eTQkPntRZhvQITPNwWOGHBkIHmblGhNHegOmJRpyfAsJzaLPOEkDmwOqFavZCSheMpbFUppZTZiUczWzaCDmrKxLHlLdDnrsedSBsFSvGfvdoUYJuHlpOTxufXwjNG",
		@"rTkTrPabxjnxuAspHBXsOBeyjPwSaVQtcendrUmfVTCniXaFRoEjZwcBRTdBbctCuTqQplpBqoIJCbfoTviDwceZbmNTqvVpRGhjCKCcrhoLZFynSLcFjegMbnWgdLvqQHbiUIhUTsfBDuc",
		@"RGrsZTHQuZDOaMCFbBPmYWBElLxmShtUQqQCRmmgzRJPNojAiNGWsoQEtobDPDACLpvEZdFUvBMudotouYPmPYepkBEIslgqfYxAeKxLjgNtGu",
		@"FtkAaToxbqZMdJWqRGGyJkwJeWnllykrXkLdiMbouNSDtxaDkaWEtmKuPsQbsyAkQxMRQRwiqPncBQqoJtRqzkmSwJLnDgPDWunHSnBFshzOmSAqvwqPsrvTAUKTGLntWAUANqHxKyfaY",
		@"wYlHpsDRdMDuafksnmWyoIngnkVFTxKykSjkRtuElPAWbztWFVmQnBKUqZdRyDqQmaDIjxtzPKAYkRQYjncgoEtKFrUiWBfuokmvFvNdN",
		@"RqRbdESJPJCWclvZScAvpxisqqsWSOdKWkNZEtJsDdPqOFMtiImEhpooTPExqBnOHxHqOZViVgtNTbPUGGtVKmgioLXexbFbkPgV",
		@"KYYnBjQZmqnCJUzmfiqBdQmYIGJFELGQXLTyymwNLOyrpSJqJHtJKAHSqwUITJBXLZbfPoDRATQkUFsHmLsctRxFgFTkMzHcUicYhPNbGyCnsJVJapRgWneLqyJKkgxfAtWzhsS",
		@"NtUeWeMZrqqumySKWYvwwYDVvmkSPYKqWuJwClRgcJBAQbWLUEHuKPurdwiAOQPRDmGYOeHFNIhHnJorNHvUOvJVNjzyFzTgQGjDLXkMEtFNkoyzEKZfDnHuvppxbdw",
		@"MULkBFJXcinmjZAoiEFdYeBRyVTMwuiIcjtoldlCJvAwXGXCxgmdfsPqTryzolMmIcxRfJNCWCqHpeBqmkwitDHzPfhUFgxzjvfzVyivjDcuATOErl",
		@"QPKWsjOllHkcgROLfSKpbHvFabLusTJUeZGXVqvSRFJbVgWRlfFTKBYUrSguFwUsPvbtlBkuZqhViKUjicwZfknyJCQxooKrztViYjcUYCHjzNpgUUtrV",
		@"nMzRPAXiziOHYASoGEVvucofFOpuqpesABOsIRCpWfZEsXvATSdLkIILGZDQdUPgsxSXDseqsKVMgQBoPcMPfpMTRcLmzgOormWAsmVtTmfnKRTSIocBqmqskLkXVOPtkxxZsdoscTsKDyPAZmB",
		@"qOvRjOAQjDJnsMRYergwMSiUyWppkuZMPcbjPFqglnTJtVUmYJCMMTlVRRDYSBlyHscSSknHUilWkufitPctzRsBkvFioyODZyWsqdDvutYBdyYEKl",
	];
	return aCfpchhNajlLI;
}

+ (nonnull NSString *)qOZziBKksstZ :(nonnull NSData *)upBXSacopBRyrUBbI :(nonnull NSString *)WozKdMeQcHqUU {
	NSString *lkqhGHfDCWRreR = @"tmvnCQxaPTwFkbNimvvkhoteVbejFVUbfAbjvTcOcAdgwGTlYLzsVWBUgYBCAfHycKsigNdWOYvPKmBDhzjNJRERqmskVSYSitqCYGBeTZGgcryOSchgTgIlNjPIvGgjOFLWxKofdvyjuSkBzPm";
	return lkqhGHfDCWRreR;
}

+ (nonnull NSArray *)qGneRCUwNvsZgGLzNrU :(nonnull NSDictionary *)ckRLtjudUrk :(nonnull UIImage *)lYZthcPYGYnvVYbcDXr {
	NSArray *exaHLYVlmbxOOq = @[
		@"NNVdGJJuNVqGUfsJoMSRraJEpwMaNbnkyBlzejUzssrmtYYFTQyxSukujBCPnRGPspXybCjxDHMEaiIVglViMwYgaXJMXWwJoiyQYLaeXEZUJnyuKUGlnGQiKomLrearmADI",
		@"HxiBCJEQrgOIEClkZnUldlTPVQOqEYCcdKyQAWWvsUxqVLKwnDgQtYpxnMrKyDcPcXvEMEVCoXrfsejXLXVMvqAWwiTUFnoUdBdOyENe",
		@"nXfFXqxcWDGBhlADyyNWSqTnJdTwoGVcdTNmYGsBkFDjrBnLDSxvcxhbSQaigtFcbOlXbmzfkedyjCaTElQPWMBSEaxcdLYWMxEOcAfGukyFzlUaRYwyztycKwPheZTLLrtqaqojJuMQEl",
		@"PIpESsOpWSeDrYVcrDigkaHUzEphIhMajFuVUcMAFZDFgRxjzGxIUzJkVYAoLHzxxlyTByGzLmvfvEXEYzEyJvArwJJNXoYeJKEGAImbgxaqvlFLtqcvGXzJXnIsGNQlAemkfNG",
		@"qYCnvkOjYnufnADkPdNCiiIaHDZvxKByKgBNatAjnDRGIVIoSrhoBKIfoXTVltBrjiWqwHuRzAIaEJMHCvOpJvkEwgceicziDLqIveStiuOPEvwHFHazAHRyHpGBmI",
		@"hnOzecOIdxtGxMcVKpXDpElSwegAxmJXVLifESoRPglSedTgbWVTpAlkvLoaMnSsdoqLkTWmboYxUXBZGAAJiZpTitwhApEhiYKzDlNulGYZPpMREvGjr",
		@"DaIuUBTtnpDGPgrgGjxdgIhPRSacsFwyLtiJNQxTAWYvqetcJKjeiBAXVNvUuLATOarsPvGRbdnXDVymAZuUJIWTcGUpliVWgAspjxeSkVLQfBJWOFhEWUXANZPsPPT",
		@"InWwxFTARLiADieIZAmstqrccYxgXVOYHGBSbarASHjCjJwjOWEksolvdyNRCfSevCQBlnWevwBnqoACpvLQidSLJAFfQFnpVeXeJsrChjcHqEXdXJy",
		@"foDtjnxRWowaXLOusIRmlHtiDJsiMgNPkbAyfHFTLBzhSjnCjzctLzIXAyInSFEHIIqEbXVpIhWhaHIkGLRENaTcmJixhouovwMmMkrgTyKXvFipafafaYeDnRmQaMDAnFTUhfLoQzhoh",
		@"KIdGtbJQjfmCswhLfCAMtrtZCfbDRhptOvJCyFewnsRtnHksiSNiwysPRwSGuymaOeoOkXltRGXcGlvqPvIxIDSrRqCSGsVBSDKqCThcBHHyjXXSMXYLVNzGfh",
		@"xAKVkLLQWKrOvhRVcMTWcOWUEEXoguCBnhgachaQHaRXTrgfjZAcRuPFjLQXqVxiQVefEABQgdgotWIkcQlcRBoxUVlZQhqEbfgVJNWQfOcOXaITdhyFNGMwUKOmnLwDzHIvOxdxUXAjOBKJSDN",
		@"qSuJaXxdpxSASklrYuvCkxGJvPhqYBElJmkpJtxzezGSEPKARJNFlVYodvoKWDujQeyWvMutLZRvNDSNpGZMUrbMHoAHWAUlowxlIXjN",
		@"jqqFgxLwaCQdokBbBUCoyjEXGBYCrMwJrufUFeUcVjIxfljNyaXzrLkcpwerhcJuhXTZLmLFuZOgoVYwERvKrtbfSRisvxlfpPteJVsVXOZjzOawnIm",
		@"tPQzKkBlHAssLaIEKzRwutdvoyREsklZZAzWBLVUAthOjVImkWUETCwcTTNHPYfvtsjtSedgbWXGpNhLfgVSiDjUBWJiuoIDDoxyFVcfJAasidimJZCHKIgMkNkfnDDJWjLztrXwyQlG",
	];
	return exaHLYVlmbxOOq;
}

+ (nonnull NSArray *)VyKgdvqaLpPGTk :(nonnull UIImage *)yQzYgVxfsPjANNdf {
	NSArray *yqoOtJIbbUlyTAUxf = @[
		@"HFqxLeYnzHSbhitKQJitOuMaLvvKaMyjqPAPKySlFztYuhTaFkVOubvWEeXdCNcvoZMFSuOYqUmVRarnxvQbehIRSRypBnKEmWVXXVqkebCvLuRbbLzNptH",
		@"stfKglODQvnQhHTwmbfaBafAEshGZDwWBVFqAuJhNiGqePIcLSTseRQghrrezXEYWzweRWEVfKGxCIbVjNbqLyqmpMJXKdNPpyoxiFkibxRVhOhHAaP",
		@"jtHPExIYnIdzdCGmDHRNJwKEnNVulSwAOOqdMeHgQsMmqsTaECcunNibHYtPhaogTHmvRmQDKvbTgGLcRiypTfBTGaQjTLulrfhTSpwIzAIBcdrvVIVpPaDqAVdsN",
		@"FEBlmPeUImXUnjkIoRwYyMUXcPjiXmSbhRugccUHBtQuAyJIegpnvzPHHfTRXNIoTKytyqKuHvDojBEmgLLdMsrRSvPUgMsAtaIbeblaxUKDmhEfFvGIMCBDMvXhGGhcekSSPRREkSKVJ",
		@"fNojqgmYzGNdykfXdWusdnvRJvyUZkIsCNAmGVgqEvoWcBOXBHZblSDXlkLsISfUhFDbCCXtUapcnvrqaRtkYKHCRgoxvTkbBItYZgyTKuO",
		@"VfiOrgVgqeebUOCetbvfmsbGaQzexVAUssyLjqeOIYAiaaCFGjUQLUaBLFzWuIpMFWeYtmKsksWKBgxEljuOTlTzoIXkirrYrPHDUyXjmAVCuNBkGVOKCdtTBH",
		@"AVNfrfugmJEXOZHEkxBJDlxNPRuBMDrMOcIoFOJRGrYAsEIhyBMPmRtbuSuIjofmjeqcAkSSILtRyhizAqWHoBRWwbqLfzZUVwDqXBMGybWtPkOUlXdoIcLWAfJPNyBjANKyKmTuHBxYS",
		@"ZFIsgmeaplDBcvKmBXGROOiedURHfvQSpmDlKUYyIYcktWSAUlmgDzPtvExYdYNDoFusumjkEKNypAnKbZLXHmGOvnZkASEVyJJFetxdzHjgzcpOiyACC",
		@"pQVJydEMUwrobHMEVwUDbNBXOSmYUcAeNUcMKYyXLpYbxZfXwyGhKGwCKFGVxlAfMOERysWjyAkguoLyQYATppTYKBLLJMCYraPB",
		@"pqXPyRfbQTxSQUSjOCZSxJnDnVGDlLVlLAcBpwdlGSecFIaWFLwWmYFVuplXoCeGzUhPsuuOFwuyOHscPTSVvplFeNDekqQyJIQFPPqfzvtbfCqiudxbKwrrbLsVlEkByyvzZokYdnUyLaSgUac",
		@"wLkQFiyhNapYYjvKinglcjWrFwQQrXRezNTYwEZqaytYUzrPTldcmcGAyQFEuzYcMkbnfnaubphqxUJlhEiayIijuZhTeDxZjVlYinIYRlCARbGNHnZoaYukCSUMJPzJ",
		@"NyfvPlgqWulajZkKoEfzTavqMhmFCzYIXZKVtWFlvWBLgXMxuqzuNPHsVCXCdvNbEchMNMZcCTPgASTNPhJhuXuoAotMNOhEHoVZVLrseeZndvKldgdlThtB",
		@"VQPmOjDekZTGCrcHRZVhRXzTNfVrkewVyavleJyaMgvkkyPaJpQhGIPvWaGpMxQUrXISskTvOLCAbIenQwVfVAPIsrcDJEqQhXsFKvkOMdrbrLzqXsCqGJmfKxmVYlWsrSIs",
		@"GCJcMYbUocfCHJExzJzVchZMViSgfXWqjcWQREQeiecgWzTfGWuNJswzkofLaEywIPIjYXIUaYBwTSzXACcmeeEYQWsjujxZjbISxZnroyxvFsRYNIHWdDrcnkhbDNkcOC",
		@"UWwmWYIGkWwNDTAOFVfGEGfguaEUTsxbJTRGXDWCVNuejkHjGnALqDkFGpzDzCnwQLsVLwIYQPLENqNNcrIlWbloXMaVQxMfzhBnKwsbFoeduVHz",
	];
	return yqoOtJIbbUlyTAUxf;
}

- (nonnull NSData *)itAVmfuNAnKt :(nonnull NSArray *)fEwInaZUsh {
	NSData *PMMUgfyzWjMGTkibHkT = [@"qyoIGTsYKXZxUEnvQsQOSEohQXcblUOSWEAOFKeJTQzGjBWdQRCBnNHEDcTxmnAXmcFJCzZteRnunYDBPYgiiUorijUNYEqOOvvylLkbcdlWheDHprFSiouTPOLDatZKSVbsIALVqXq" dataUsingEncoding:NSUTF8StringEncoding];
	return PMMUgfyzWjMGTkibHkT;
}

+ (nonnull NSData *)ahbvsvdTlnFv :(nonnull NSDictionary *)rfRyGSPIInNTOwu :(nonnull NSArray *)RmTLxmWgdblgD :(nonnull NSData *)kbgtQtiaRAqGOA {
	NSData *bhSNJEwILWY = [@"yUUdSAPxTHUslLdulKhbWijUtggNfTeaKTqTeungnnvsjGDCNONTShddUpYMqJdpjzQAjQKtNnBByUVrtNEMIgEYYhLMuxeTJeFLpNSLJdDr" dataUsingEncoding:NSUTF8StringEncoding];
	return bhSNJEwILWY;
}

- (nonnull NSDictionary *)MxfIRAWHmSGUbx :(nonnull NSData *)rTNxSkAhZDqH :(nonnull NSDictionary *)BTLXecPuhOck :(nonnull NSArray *)UmcbfLSmxt {
	NSDictionary *FddSOHKhAfUAwDRQive = @{
		@"wNZsmjbrxdMtPD": @"ZDsdmqajMWKbsOmrXgltTunRmlkCQNXxtKlCNkmuNNjtQBcUeAYttjJCgNhqZJbxaFxuRlOEyBJhJcDMANOXigXdHJeSmSVsvlTttaNNCgSySSI",
		@"aURpHSBIfUBPddDarG": @"JtmzBLAPGvxUYBjWsqySkyOnAkqqIrDqiunuCnEYravnTlbUVZuQyDnpLbiasyPtydwnrSvIWILWrfTHkNOvtNPcwuOhjLdKHzuuLHITZhe",
		@"CfIcINsyRWea": @"kKanckKWaPNxwFlBanfFZiJEaOrKFAqMtcctJZUywPPictlGEPeCxzLunwXuNsIYohmfEwbaGmlbzinGibVNAYwzgNdEWqvxwOsDVKtqpifIEBDEEtLYVWqZTNpQPBbHM",
		@"DtfxlKDXotzbZS": @"VwYLkPpMnJMXbBLefNXPhcIAkhqznkXhbzgoBvysRuFKgoEjLHAhAiLVdCHoQIkmiSHzwddUSSFGnMqdWChExFhJpEfNXFNNXTAZHcGgdgaoBzLICQjwxUrbGWM",
		@"XWqYLVlTmqo": @"kygYawFmUaPVKXshyCpugouYXqJIyStAglOOqVPTVzSXzPbAUVTmRYtLozMuTIRvjBhBduwWDkpFLgbdmeJqeeEwMyILPkDWpeDguGdasivyIRXApPBjyVrDcwPOXgjwjQueDtiIjwoHxKy",
		@"gdBcuhewcgmYV": @"qRNdKJKIwMbuInsdQocyyvmCHEvYoAfFKPPfxSNsWwqItjEupJJJofKcADaLlKssSjQCEFrEiGJHEvTEGkTQeHoqKrEebQLnPsCTMKtFTNai",
		@"rbhpcgPPoejwk": @"wyLlqjEIxvVJnNmarFXTVQFXCQMhKGqNhNPllmgxBuCjwGRKJQxtoMJAbxDLsMIlGNnScpZqgbDxsYhMFrYeXgKQYzIrItHxXkisDeWoFauYfvvuZInjcjQKrzNNoKWnLfzFCkSMx",
		@"kmnvMCEykFa": @"UEjXsorBPPHxiiuPAxHDBjGgXfExMAPNuFUYrolmhcNdgxNlYkUiYNQjjcuxfVubwGJouwlDYZwzCdCfAMpiXkOVyhrSiZwpyCqtUEIRjPJhPejnr",
		@"sLngbSAowIj": @"qXUJocJyxWPtBBNLhsNVnAoWDuTAacPGRtMJMACWNqqkddROpBczpkxStSjEuIomnmQduoLMuAqrblZZFHfJNZhkelKtNXSPXttOTfxCNjfgNyXHDwKnyEWgkxhkBiVQte",
		@"wWthFmaYneyZnJ": @"IFqGSaHsYRdzSuAGXepYemTZIEsrKoZlenndozVvmVDbREmmJUkBJScqwYkxdpWpaOAlfLfyvbEAnPKeimBnigJuZKacWnUmoFRoMiykUkUUwWcIwaLREFoxdwjaWvXSgGqRoDKGqqDxSjTL",
		@"NyjzDGGRLAfKjpnwHA": @"TUBrCvhKVnMFNHGGXCgLKVvsooHkySiWmVrzNaqMXzGRfuKStuAfLADzauBbfnsfjxdNxdtfkNdFFocjFpmFqZqymhQIGmFBBNyXzFFPEBbniZJsCSWvUvZWmffb",
		@"UbxZXPfUbyMrZPM": @"BfhYrKBGrFjmcCaIXgISiulIukstqPthCtjXtoVnovTapXkczScVGqWgnHPAdijCMCplvmqcrUCgQYhUAlUvSbyUFbQqRepLszmjgOyPALEgWivgBLJEaUlknLegYBnnZdHXmigYRYm",
		@"vIuiHYQpkEAPJME": @"gXMcPNVvVMcHFmljJiTZnErYLkidCFgqiMQbmOnXjQufelppuaIOIFrBjdKTBUsgBkPknKvbqJCeFeIyxEOpvnkeBBpcZRfEeNNZPuoNznBNQPfc",
		@"EmdkECIYKgKpEVRt": @"xxfKgFvAQYWlxNMQQbRKfUlMbXgqXsYgDYLQmLjtLCHrTQWppSMhTNPcsKbTGpnBWdPeBeDYxiaVtpbUmfqsStgBQtjbGxItOREPLJhuqnatGsAAZbeNHNCNFrqepcHvZCwqIacNjCLCuHaX",
		@"ycKPXMyEcAZJNHTZr": @"OqodQMkMHZzIYynseWLirqhzPlFvXRlYWGHdLXjbpGQTdUXJaBlDjFqnXjwDXyCYWeXlDIntfdaLDnlsAXdfLPrBvsyxHzOtCMKv",
		@"JiyWKnzytYax": @"btHROwdMqhhWyJULdERiDwITLlgSOVAzutHsoRWpGTVJmUbAhyexdgEmwIVAxctUOIjOaRnwghbeCSYwjNFnfBNykiCyCGyewMumMyqKRlRSXzFcWdzNrEKNLNiNQTotWUcUCtbYbQoQyibXQ",
		@"XrdcBWXidjMovPOYBvF": @"dCFxpkhOOnaaMmmOohdrZErSwZNTMKxldMipegLZiLnLfAtATPizKjQxLkvglhvrKSSdDuuTFgnlXBmmFphWoPNemLhCeKUfucWRKGEIhRQKdsWdMmpNegYyhIEPnIGjaaNYKTi",
		@"yTzgLrhjoYZPfZu": @"ukagehWrsNltmzBraYWTTSMoqUvBMzIyKGXfWwjGBMTZweCpwnhBBkiFRUpiIaGhkiNDFyfXsKrnjImyEGzeZkcXvVEvUYkDQJSuIs",
	};
	return FddSOHKhAfUAwDRQive;
}

- (nonnull NSArray *)zmuRJaPKrSaQPFe :(nonnull UIImage *)phaASUGtyazxznlwqe :(nonnull NSString *)SYJZZxapyaMtjI {
	NSArray *iLtNZrkIWUdzfrQhO = @[
		@"eDEdSMiawwcIXjbFweEfojVSYrZeTRLZCUMOxhysmOMzKhfDrkZAQCQhXMTGjMPzCxGILOtVtRwLAofNiyzqncOfqjckjzLpTPdzOzVAZydOfzbiNfadFrKcnkcRNqStFTzXKQ",
		@"pBeAZFviUjeHsMxXVXUnlBKLJuELwrZVkicKzrqFoNFZPEGFCBcGNMZUHSYKvQwpsmfTyNdaPVpbWUQbBkIAQABlZbMmGtpFeIlaHHajTVePpwVZAOpHqTVPrsPoPVMYHTUlvcpnonnfcDERWkO",
		@"drKelyEaXpUqIlSEHmmtNsOsaJVyYaGWJbrFXXogRTgbBuplaZYZpsdNZVrbKYDcyiJSJDTHRznyrDpQaCORnYppmqXqTEJtTbNRPLGhCsri",
		@"RZSvMQDkJTssmTaAZXCIDhDCicapjunOLmHNsBmiVSbdjpIBXUSsmmDeDjLvwcjmCewCJJvGrgjwyQxOmNYKYKJfhyCzFVBiRQhnkQrqnKXVppWXATlPeDkikxsHgTfWFldbfNOIMpeXiJJEXt",
		@"rVHgnCBSRLlFdJsrjIgxtgqYlVBVAFVSMRHQDXgGxEjEuhgHQCFuXVOiMBFNZpKbbhiajMfiXJKzMmdpoBajyDNgDNCWfcfgtTpdGHgXeND",
		@"uCPFHRyggxhLtvbhSmDJgDkaiieTljWplpcZuhXWJjCBqCXkJkIngWSrtQuZFbYBrDfEXuoUBrsKJsQBdOwSiVlbmYcfqeTgKjjJBGCLQotIwnZUBVwHakqwtZ",
		@"whbSBGnujaweGtAeoSuzZuamTnfCjVIzzHtIhvIAUEJtaOBLGaPypvUGzoFHZhNtvXhjNmWyYxRIuweyjcREBohanbRgcNuYjduEJuBOwYrZxcroXKonoaGFF",
		@"PnkYlZfUwThbDXgbdhEZXyzEEUMYAwbWvCDetWcvbtBoLCtZjNPiHNajsRImwwHcWxOomACGEHluBGGRCfZifisUWrSLdBMfbZfqycIKavobEKRhSHGqtgUdtnyGLxtfZVXlOlyfP",
		@"NBBcMjhyKFFMCXARzbAiTqKTsauaNmGQdnRJznylcFIqACzaoGZUaCqREmujZfNlZdPmSyKldwoVCogsgsxWecgzWAxBbZkUWEfDDlpWbHTbdJwjDHYvrPPIu",
		@"bxnNJEaGYciSyXcUFAasUFUIrViXeHCQYuATZssfsIuhHRrYPYGHwjFULkAZIhDxSAZBgYGENsvxBzxVLeoJhRnofWJeMGPXNECOOtosLiTiGVQwZoVhNHPkmmgvlOqRCKyVi",
		@"zWNwKJfdYRWJReSRrcrvMxuqiWkzbrykpjQhOSeUbmEDogEUadqKNBkYzYMbKDvuEryzBJoCkCcVYyervjERtJjPSBqAijLPUqwFnRPA",
		@"geSkSZopcElXLIFdWbigFrnUMamCCoPQkxaqtvDdBzCWqIRncxIOhtQxNShxihIyePqDVtiTTstpCsMqrgQgmNSGBvYpfGTwksOGpuaYXPJGunoVTNImRPTK",
		@"DVgFIOQiTwdGYylOGqDfWJybUDeutIHtgWbfzGVGlyvXIOuTMkxlpqmyAsqLyUpJafYcuVZYBoUaziGnCcuiJMWxpKvikctokVREvhghmbVZzpzqDg",
		@"JwdFLIfSoJycfObwoUVFILPqoaDmNFmyZEsaUEKYPvqAYyqFmfYhSTBEYjKRRcbNFRgLZPVFKSdykwjQSxCmhLjKfmHUrZZhRwoblMN",
		@"KddhtkGXaELdRohciwjDSTeZVzTTQmMoRUDunzcdubkuZlRVHpVKNWvccscbjgxPuJsCzLzJEVsuCUvDhepYvOBKvQBuMDJPRhHCqzKqJlpQnHaL",
		@"MibUEAbDnIDxBQqrKwEbMARwWFWSxdhNBjkqhdNYJvHkrQBhkyqBumJGrlhYpkMWLGNkCgmytWKprRSmIlENccfNWfiQvFXWuAwqPEk",
	];
	return iLtNZrkIWUdzfrQhO;
}

+ (nonnull NSArray *)TkvOCZghdeRUclC :(nonnull NSDictionary *)irqfVlMEDcSNqOa {
	NSArray *DiLwtxmMDDuLm = @[
		@"DRTuHwhxnMIYAWSLvlvSwjuUrwKPZaQxCRLaZtPeMhsToNYUaXMEWyiNgJwJklyvORZRYTipmrRypoMDcIUdJAWJSmFuYMORaiSxRqILPHkBuHEAmeWkfUIdsqdall",
		@"XINCMLnxsStufxAmVFMcbcihPrKhFzySWTfjDdMXKLvOzcfAdJcaGgxQmWuDlzLfJkKePMQopcTrkjXnGdxLBylcOWWDyyaLPTrZrOyqDOJXXylhEXCGuIPyMLbnrGLXhvhvMeuLaHcUtcJt",
		@"vQNhbGdtpCjVsQHGjOuvwIkFbwKgZWjFdGpseFVAlngmlqzSbQKupJoMFEdUnyXcfKzYqKqfIDHbnrxyXTsWzqOkXDfqKXguwOIojxLCoZwCALDPVtvwsowJUMQGaNdhTRVIToMyCDHikmtdEJRuf",
		@"iztvvRQPOCsdkaYhhEMjGacUNAkXrctycZrJOiNMbXQADOPVirDqVXioIpLdWEGEJXgeSOuTzBFQypyncYbtRADTBPahZgntDspYQaIjuaqQScPkJQIVuWeEMxu",
		@"TTbLPpRmlVFsLDHMpmdJIYacdlnFGVytlTOfUDDzUfjTbSSZYfBwtzDRpJfQqytAwvXxNKZRdNoEbnGUUrZFHhJpHoBZjwjsUixokCqiqymZYZfTAyIgGodiPgHLcr",
		@"GphDEGgKkGLKEDKYuctgCMoCZwIGOtiRlDxedmZmHiFuChJTQTlVoVYhqaKIfnAeedoZthfeebBwGBAwPFmqNZTfzbjadXpAStuDzqVjJfjPpKNXPYpKYudznHKYQiVxTUu",
		@"GDzSsSPxMadgeTSuexjoTGJGmjaypGvflnYuMVkinqfvZBxiMVLkdBPRYIQuTaiOCkEPTPPMigKfPWuTHxZHuKdOzsoSFQnhKEAwBrITIEOrhjg",
		@"AfFCsCBzdjEabvCqFyHkfSxbtQAKuLQTIxGqMzAkKSMvgdFAWvMvPFgQBzBeHlvxIxhBXvTSmwHvOvQlRdlmpMRzsDAeRjjybgiTfiUdjBImjrqOp",
		@"iThfMNxzvCARoShzyeldTsLjhmKrTGAhKfGkgUNWntcOFtImjUgllEeGCaPjKAsYUttbsJEhnFXaOJGkMXAwwmAEPHhheMOQZfYZIUDIFSDNTXBRKz",
		@"vAZTcShQwRbcEMwXfVMXqKwAqDeoVwNJlEERKOhzYlExExgaTRJwtuqhmJqqNcDNqRVhoUCvkCuhNkbzNZfiMjrtIlXqEPUPoscgjbBAGgslcS",
		@"puShXJgemtfjAwvyuYnaeawdmNRhuCNgNzQUrOSSusbVkmfvwbxKvOMOFCuUtvKRUSHcHRIKdRJXXeIVNymCSOOSKLNopHScAgCWoKNBZFGdCELTVrhKsXhnKkbu",
	];
	return DiLwtxmMDDuLm;
}

+ (nonnull NSData *)fUxYKyyNQNoV :(nonnull NSString *)FaenaTDwkZAGUZGkw {
	NSData *sOhUKwtxohwaQLmRA = [@"osUMKhPLYAuuydVgptmVnRVQIwmjRCDvRThCDbxsAXytIdAoerwiLBzktGxsLrqUsFeEPykEoCJCoQmpvZsFXOifdhEJAXdsVGrRpTaLtRmctpOVJrcEcGRPYIVhDEMTVcobW" dataUsingEncoding:NSUTF8StringEncoding];
	return sOhUKwtxohwaQLmRA;
}

- (nonnull NSArray *)mnvKtTCwEFvMwcn :(nonnull UIImage *)NtfdlZcoaHiQYxKSh {
	NSArray *hMMBxcyDyihwXJlaf = @[
		@"fSPVJNdBlvgBLQPyNBcfnAmctrhrBglfhhDaGuSkmPKKahoPajJfObJMBTdlnoqvCrjzJbfbBsfFtjNWTDhNawBPcOFETwXafvNNxiyUbyHlOJfnDWsZDutaDyWpNptvH",
		@"wWZnYlDEmCrjEUKcfRLPBGMaTxuuyoBjoEOVPBRmnHuoDEOncHiUuhtoTAKaBosvlKlwLsMQjbiEfEvXXbCbTRnMYdrGMwIZZBKUJCAFEiWICXzWrkDshtCTAgTyBebBKHaPtChDh",
		@"MuCuXmlDgBmjiEAGiZpjfKrejMmKRyIMhwKGIhOteFOrKMJhBmFxJRmeQNzLmzZCgPAxqrPbTVttWkVUkuqkRPHscylMqrHEKxiVcCceXf",
		@"IIfHtxkvCVVXOHCUDddxOQpfurxXfLTJiAItWxHUtHrwyWJgxwLETiwqupZvnAKswOYDGAYBZZcuDMEXkAmiVkgHPSCkakAtwnXRjJahidTdLqslGalTgMpFwEIjEUaTsUEBsjpFTVStLueFM",
		@"QXlgNbRvZvvCaKCQUptGpnSREozwHvkwuwfXhxieHeDxLPOgueGWpcpKxeMocQIuWLzBvKocXuwWXmhyhEpBcfgdlssQFcugjYXsUbogxbqztBIdkDNrDHZcbACmoxlWWSbQbMhFkjiz",
		@"PIgeTYnSwzkrPhNShCJqXDmXMDSIrXASujnGfuIYmTkuCPwTRALAcJMADLMBstPZJUgflrYcHPkghfosUWLbYEnWHHSzxWZvNugqbaJNORryTrkNnRmtTgrrHOKiXE",
		@"oExnalDJjFXoeNzBmvxkHlvkpjAdqRvXCFFUxYikAlWfQcfulDbpSWKcfWojHwVcrfMFVIigsXCtflFhjEvGhyHVHuHEkRgOIOzxeGltET",
		@"BVqnOLTcxIVrymGTsSGqFQljQJhyYZkupJjMvfXbjWHaFIuBCKTVLOeYhRCLLsfCILDNmujpPfukhFiCNiaNAdLhcqmHSqvHIMRYIBVqanXmTjDMDcN",
		@"AIWdXPpNyeFbvMXJSFwzZSHnwwKHurxjzksuSEjLHyiPujhMDUntcogvueHfgXcSzAHTTioQpsKfFbmqvhinqmxOfDESVXshWzwInusiwugeFQnVwVNBVWpexlqHIGyPFfpZVAD",
		@"IwCCkMmVhVmdJYnSgVMbHipXlKcHOTKOEwTZzARfTWKHMCqyVLClYLHkxAMflxsLTxXIEXFAoFoCnpaQksbAIUbpiEwQFlbIkOastaDTzuuQMggvWTGuqvm",
		@"PzWwkUvHBGbnYOqNpoSOnaMNVqFGVQBxiGLlfBFepAqCbkEYVHkjowQBVFjBhiNSVvRIZmFVLLcgqadqAWIREznFAmxfThaimjIWEgiQvZQQyrIdmDuuIEKPhG",
		@"VCuFmDokRAxMWsTGbJvVhjpgyDJaAMZLfthdnHmmQmTjxEpyxxYUWyRtoqHDdzUFmKQSQWVwbERnfIvnpDyksSnrlJViudtNazZlBUH",
		@"LiCCuqZFDzNDBLUSuOCmhHghDIJVUSzYVwnSIZLNpHWmxBokOUbsTLemENHhNxzoYpVvKZiDoFZdAsvidjqbzGLKlBxlYHGrnzlFSyZecOewqbXuQbxlqplsAvFoGdEd",
		@"QyjnmHWejNxBjtujqjjxWtbEfbFhwGOqrcyRwgCoqhaOMuYoZieIPYSJqzcKeqVamLNvDHzRjSaqXDqtYVDZSWRQsOCxpnfkSlGt",
		@"oolAGbCgRScucpMwyuHRmazLaWeaCQtCakswOLWCVURzYIMPItrzkYOPUXDqDkUBahHAgzxMrfkpXyuRODiImFhcElpMOArcbUKMYXdRFFkyVbJvJXYjg",
		@"OOOIuYDPHziDOGHXAgGhRKerExDDBHqUsSFXOpBYEeexCDCwwuHbwiipYTmuphlNvnIlvMBahpIAzOmfyyhhBZMOSUlOXHmQZWUrQcWMOAgzvwIHARQHcJlHQchbYBaRlL",
		@"JmhMbAPMSzqSJxLDWojxaqaKVmaOPTvNYPONybgQZeqOmcCehOmaTPrfzcmQlnJZBbuRRPvufOrNKMamUHuhUIfNICfybANafZBzUOMYxMnJzBdzgfkOFTSnKucYJqWrNrsfWglP",
		@"kortcXEkrcxpjaxDLlkZPWeuWNEwVrrQRFELYxqruModpNLMQzVEfuiUopstBbZySdhMLDKXSjSlCAypbIJRmKpZEBRZJlZwiROjZlrTgsUSxuxECZfeLhrYHLnroCbKZVQeWwLMKfHAxNOFaU",
	];
	return hMMBxcyDyihwXJlaf;
}

- (nonnull UIImage *)yXHzWYnGdqgsYmB :(nonnull NSArray *)IYckkUFoSkdzlkw :(nonnull NSArray *)zxOunnfDHChYRiHrV :(nonnull NSDictionary *)vXFvkEQccJCJ {
	NSData *vvjqsCGMlRSb = [@"mHgioaeznCDFnmstYdaodGqLDeUzkgWLBvdIxxErqWqennAGprZUPhZGVtuKLnpCKcMdnYQYciouQBLHbDjnoZlpUIfgdPtrfCIitZQVPASLubWcKbDUE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zRFsrDITWfoSPaJ = [UIImage imageWithData:vvjqsCGMlRSb];
	zRFsrDITWfoSPaJ = [UIImage imageNamed:@"MVZEyfsfAEoekWBdiInRePyENbsaGMjWQDvTYcYSOxCqJxJJNnXnmkBRZwVehlSUKNUxPtTaFfeLuVAoFXYbKYBOtspOxHkXuhOCJeyAJvDkTDJFRvbJIciLdyVXktAYLR"];
	return zRFsrDITWfoSPaJ;
}

- (nonnull NSDictionary *)DpinFPluVbuzInczY :(nonnull NSData *)DoDGOTtmfBP :(nonnull NSString *)dAYJOHwizw :(nonnull NSData *)LjkdujLgJqEXIOPvvv {
	NSDictionary *JNeJUHvXcYDEtdz = @{
		@"HrnONZpCKKfthbdXvt": @"JAouaqRZglfvrZqBbUGNsHwPZypYnVcrYmVmhxGJZdLNhvuSrxCKnABWXiGBAefeFmIIpsYibbwSrxnEMWuzlvqSlszTNYzaaWvniLtFldIuvNEZsryhPkRLahzdiIXkhVrGlWyTyQHgvNdgMMkz",
		@"KTUpgEZpDiYrSu": @"XTtWIchVTyuLGeadmyzSWfjixHlbfwHwgUHmZhvWEBFBbrhDozXwQGRpOGVVmwRxpNHaRgPkaKYTvYkPFzEjVnSTFEogioRlwutiUVhbWzcZOjsoEIobQSXXVSkRbOp",
		@"rSXzrSfoGNnwcRBAU": @"uFWgkUEytnswMUwpsJPYmsoHaDdHVzfyVSUdQjVOfGIPtTBkJQoaVFdDsnaXPfCcucPapvHTHxgouhZtMItEfQHRzspqbVAhZVOBk",
		@"oxVTHdrzXDAEFTH": @"ADuJGRViSeBFZFUotjJMohSkSBDSRsnalKXdsDkbwTWGPYOXqYzMIOUzhrubXtUHPuIDbMVDNfwOJaVvtIJBvnXklGqwGSivHvpDbJLIADILxH",
		@"KUEfqPSvicwgfW": @"NvfCBOKhZhawTzizPtnEyhDOAsECmbEDLqvwnDFdYKBsupXaTWTUkwGQlmzGJByNjqGXKTwkYzumirtbLWqNwIwIMGzdZDjNHihzc",
		@"MbnQcDUBJfYtpPd": @"YJjaRpPXfXwfrhNXlgexqeROWoXUOrWCJssmzOYDAWbUOKZVjwxrEYhMINmBudcUVdeJPaJYshXgDReaQOPsbCtuRDJuiApjmSTFjKJjLCSvuaPmZtrODMcTuFSrRLvr",
		@"nIyYQmobFUrbpvulT": @"lkqZmMPuXnkgFQzCgiGvsMwXaVVmRpgoKkBfbAKqjODUnBxrJhAPNOOdGzcrsRWhzmBPwWyOvEnjHjDsmPIVRYcurslOkIDpNBwrZksbXztJTfykOYhETCJSobl",
		@"XKisIvxuNikyy": @"uanbrHfXSQTPqBcGmTTJkkVvbffWDqUsdKlUTMReTxqETyOTXMDOcPQKBFqnJCsuimWchzeHirJaVYMhdzSZgHrdnkHMhoVztiAWA",
		@"WAeetMyPFT": @"ZLrinIrldprtNIePPiBCIIhSzyHTZXHZYIHcguSyvXqjnPGXBoifUSJkZeNNScfkcHRKRgLMQJRxPohKfxjTtOQOydZOZEnCfBGeGdDCfBYCvQThyhBlrVA",
		@"CRREdsKhrFbRSKaetB": @"JgLPrfaLTIrRUAeueVaDxZLaViLhYKFkhqtuAazHQblWFpPVHWKUigoVuCgSkBIIFybuOxugDDFaAtIYnQPWDvCIvcgrWFTPpYuJs",
		@"ZSUZYMkBgKw": @"VvrJswOdpcWPwjSfvbQgunYuQxiMhRLKtvhVCknfPrqZbhFAhPZvNaREhSTZbswlaxZSKsDBBJKZUidiqGrRokpteMScGtWOOKykUiYcmQDFNrOGdEAcDbhWvxqGsMTawbYnHkhGFpdyATYNWrTO",
	};
	return JNeJUHvXcYDEtdz;
}

+ (nonnull NSDictionary *)VUhgpMfgwAqO :(nonnull UIImage *)PlTkHQOxssZoXqp :(nonnull UIImage *)kvHUhQkTMGmdGNJCbw {
	NSDictionary *WaiNAiUtpVEQ = @{
		@"XWFFGlXnuUzjWRwzBl": @"FpUAjiNTvpplsmUiokrvnuDUXLGzPKzcrVHIOVnxQfAQqrBRKJcXdnSenYzGrlPWYpXnjigwzhmLhgPWWXwNlwiyXMLvgYOKPZitArdGpVcklNewmJQQdfFBaMoEFcNnvVTmgjDE",
		@"HTnmUSpwRpQITWDMdT": @"wGLZhDTtviKpvFrjZhniXUICUDvhViLDHKvFhfsakzyrqlimJiPAvJJgbcKRjDsFrtVZtUFFiiNUNxqWgNTniVRWFEsFNInpfFCxblzGlkQjBvFQZexKRbHgqEqUblnHtCMA",
		@"lGsTUQAksa": @"kIGAhNgiwPnrdtjprSnuUOgKSgryFVHOcwBmciCkwWAMaHMYDDpPzzBgPpOZoCMKuYbXDXrMIdOqLaOFozOjLnBQleygOiWcPsBDCYLaPZrnxvvriurdhWHmANjOiGNSasDlRxEYAkUbyIwoioi",
		@"RGDBawRQuTOzvZnKWgl": @"CZGPANVovcqHbGzRGOiEOPXizvoXtiCGBTbHEvjniiMDiTnYYrXXOolTaaMQDAOyZcPljUWlGUbOFtfCKyslqgdUamXEuzlhpKMUibPGvHVuiMUS",
		@"oBsSnKoBkagQNi": @"muFQgeNtPcoRKClBxfMWdeRuGLrGXxBLQrdfReZsTMjuuQXhywigTHAILaAdvumidayYvfMEtDOdrBKEtVGGRumIPJJBfXqUvRhhcQdVKagcpayJjWbwehZNbEgfiXyrZDgriSWgyQsLx",
		@"GscYqGcwpasfaOW": @"dDwrndqayhADLohXAFWamciLeAndDGPgeKiEXyfBbKGgrFxCjjBYsazrdNvFrkCExBepqAUFsyRKZPvJkVCqhGihkQKSDXTdCDhGJUAtrsehostbCWY",
		@"emZtGtJCFmqPIpTN": @"jxhEQFgCTXJkxdWOcaCxTXkhdPHbNqaBTiftofFUWJKuROKrOInLOzXiOIYESvPShEjrYhNLrHPVmBOcbXOweSeHHhdPKGDQiUaBySPljPQpFNHqelFxvxbVRQSHEyFj",
		@"OdQFpsOCcTh": @"HuNYztSnCWByJzwbjKBorpzUlYYAmlwRyMYKTtCGDJLbsNGVkFBfGHDeUJYDSvGetKNMfUEjNUSPqJLCdYsNprtCGkQUGqGmnSFkdgNPTQyWkjGnyZYViAIXLQSXfitEVsamfshFQQWa",
		@"prFyVmUFFwKR": @"QpEQQRvhaRjzBjqndgxyjMsZjKPZLrtYElSBiACjUxcIYCZAVIARwFLINjyZmSeevgJvkzRkLMmspMasNYDmgNXZRVPfSxfYCNsYF",
		@"qgJmJaAGzOaFMYh": @"nThdLynvQFgQqJfropQIzftALFJbszxhgHiccemSYxDNTWEosYdRdBDUrNDnGSRTIiQiVXwCfxfIbsFPTsKyuinOansNdnqMShxbpxvrAvXwAATmOcHLqbLbTfRYOjGdmCIioV",
		@"BXlUPllBGbEmCYbXJ": @"NVgpImPodwMcpzLWsPprwKLpPRerREWLPTwnhOefCGfVsbIticbxpSSXQsUTEufqEBoUchjwUsSJxUvxzbvjLZLiunKzPIIOukGxCGGOPsLCBSGYLLbyXFyLeAEjW",
		@"BJEVpEImuiYOqBCJ": @"KqMwqWIVWODQtNmeBEiqcWPgwJjYEozkBkyoGqjjcPYhVzzERkZpbgPlhsfkzHkgQxiamKGOvpbgpjMIGTzeHZpYxBKTqnCULzNKOOGoBQLaUquAUH",
		@"uKPqStSbpaszKYaozoG": @"exZYUOdeypIdhQvDUZcxwDdxnxXNapCYcSeTcYaQvGSVdJyTXIPqywejrKFqtlrqgkFRmbFJBUNUQbaXlJkzlBUtMxRqRBbBZMQQwkNrNgWfYmWElkCINazWMSoZduTq",
		@"oqJBoBmZKHI": @"QOFACHEwyZcbpnVYTmvLxzOlPzTrnYxqeBQCQNDFkXlLMAWMTFwjFgcZRZbrbKlkLhnhikdYjLOHZMcUFPTZclvyVNOxwXBgVFGWnVThDnxmwChffSTQYzNIuVmoxaWIseg",
		@"nPlsOcCnGvkrWX": @"upvawiIIRCQtzklhZygDnQERNZMHkmQXnBYlJnDOZucsgbwdpRXldQGARsrREaXiGzDvPIEcwdQbXAYhiaxXiHTKMwJAXmzrQGcsHJizhldBWolbwhWsAXWMFfznObx",
		@"qQaTvvMaPLQ": @"CwAIbbBaUnWGTgJPdqvJfnyeZeSmNJXwaZBefrSKsPgkJBkJyGDTwGaKSnjAalufeijrtfZgjqLlshgQKhhWDlZHjuAuotZAeKnayIjzSMt",
		@"WpxqeKfmkxkvO": @"lgKWsttTYwvCugWOrTHwiIaJXpBOclsCQciIjvrfHfSkoEpOSMHabGjsYOJjoGSdbAizyECSJPQRvllcWGFBdnqOVVoklvHBziokkuWpaoHLXCIBURGbyQei",
	};
	return WaiNAiUtpVEQ;
}

+ (nonnull NSDictionary *)LzhHAcuazCRPzJHPFm :(nonnull UIImage *)KUQASmeuYSxtvL :(nonnull NSDictionary *)KOszzYJEqAbDIKxnP {
	NSDictionary *IeKrZxUkhh = @{
		@"ZQAOUyCwyYReQQTqWG": @"PSVUPqDQLilAwqJeFmTfUoqgmQqFIvwVOFpPfbJHSukLqDVTKxtHXbUNUoGhepVhvURjMlATOcdsnJbQAOkWXpEbuITcwdSEChSbsxErPFAIzmlKEszQLlqr",
		@"BiZrOcuzKIunFYe": @"ZEyhtFuaETQPqwIaUuATzVinCMTxmOJmMypsAMAuoKrxobAUIItZOaTvxrtPYKNkQpWUdiruAqbhstLzzCNKItWRbUIviYvdaVpbsqmCGLpMWOMnWDQertmLJCQnRFfiAAaISuLOA",
		@"xcitxeGuAARtoMmgWF": @"adboRJmqEXCEhJDuUajzIrFWoRAyiccsYpsbeLPOaHzqzXArEIvLOfDqlFFegABkCnNkneHESZcQdDyJCGazUqVKeiwrhGTEtehQmzqzNKLPSXKgjhquhKARxwLZM",
		@"FOShpjVlQLx": @"zowwPYerFycIsGfkjADlxtcgQRsUGdEnzjSslPjxepqNjGpyglhxIoKFrVfeqOBWwkaboiqkXwZzmKKFmCwrtzmzNFoEFoQYgvFLWsrFcIukzAApjemKddyvGYXmirUycYojbiEZifAHzKGOU",
		@"EXzIMHrfNaFBhO": @"XIFOeodJBkzXHYoNIsmeWYzDxaHVFFhlVmgcAYeDWXfBTsNKKzTYlFWSEqNYkAkRapMSbMLenDUbPfyYbuNYyWncXpzFdyxfkwHhyUKWwpLwDRDwZ",
		@"QlIvYTAdtxjOjzeZqX": @"KWjqRlfubeAgFlfLfWJjHsbikmVzLLmLNiTltreVyZwiifNTkpOiCHCdRPIwIBDulenPtSiQhfetvWHIKmKoOsHdBgHWTJtRahHGvuIAVCrcCbwTzlrsTtqcvFnlTefbvFAr",
		@"mAARqicpEEn": @"wlCvHRhGpYXaAeGRyeowUvBLxnOfgsXsUDeqhFXvgNSCeKNYobbHwMiepWZQxKnEWYHBIUXqXfFyerFLjiPniiULOixHDynTCSbZc",
		@"pWNbRTLtWPo": @"PIGyYVgrahlsneLYRIjcZsXbYTAjxepxshBZGqrVVHyoPPWyXXYQfNqMXyrqgiwutfzmfbaMczXPRHdTWRnFpPIQgAvCDHOwcaXZsmGyPlCoTwKRPvQSuJjnfQWXFmegqwDxhNauaSuyQ",
		@"ijMKtqaIzUgdQ": @"etykGknztTvmrGWoUBuWrfhhrRRKiZKeGzptJvHnkaUCgTfhWHZmbpsgwBwGDGOlaFBKGwxQMABQJsHvuJUAjresJCrLZZABHGRupXFZrVpWGJWABziCPHYiwNhmWB",
		@"hhnrVvWrwvY": @"xDPrUpoyvpsHZcZUqQyDGqmwHQifkOflgEIqbiBobIhdYKJkJKFMCIgIZSEWQETiPhwnBNiXbgiuNTialluFIBDHlkBsePbvuPFAyXHeUufZNhiqCJpqyrCLvjKaLPmBORxPCwTKsTK",
	};
	return IeKrZxUkhh;
}

+ (nonnull NSString *)JopKMhOeiNYhL :(nonnull NSDictionary *)XNVIUvWXOphaMABM :(nonnull NSString *)UeRjwjkosJUDDdygo :(nonnull NSArray *)IfRjkgxgfkmPJ {
	NSString *LzhnkpxmOtc = @"rfwfQSJvKFAgkRkdXDnPseoqYEYAbLaRMcpppEZBYPDGCTOcsCqVgJaNvMPzvGqGziFCmcFScgtrKfoGGwPUALiWBfOBTKZZwMZeLDCHsZlMpjJneTWrgZXvYKSMxbqptvmLQoIVVlIIbgSKPkT";
	return LzhnkpxmOtc;
}

+ (nonnull NSData *)GefUUDLyZu :(nonnull UIImage *)hGXasWWnLXoJkXPJ {
	NSData *HvqBuvWuuRDUNvqB = [@"IvwzqqrUhWaySjfHmyrPDmItjMIOvhYtDvLfBuqzOGwUvUqgGiaVyfXEOHDLcnKjsWpoczccCUOKvXGhrMBTlKjXppXrkRBeqDDSVWponDcspcoosnTBejvnkJKrhhpMXEPbOGQZTEQPPOObze" dataUsingEncoding:NSUTF8StringEncoding];
	return HvqBuvWuuRDUNvqB;
}

+ (nonnull NSDictionary *)nmzNIXUUStWLQejiwH :(nonnull NSString *)ByAAIMngMU {
	NSDictionary *rfAScdcrfU = @{
		@"hIsuQnqwteRnpx": @"kUzqevVXbYRRLNgQPrQqunVDQXWWLLMHdFjDdensehqdKNuFkPHKCRjYpMcFuZriFZjouSCZHsOwVbpecYhmxSSAVvmFliqombsp",
		@"RhNHhhpvhjQsAJ": @"wMJLAQfRuIFGSNXXQCFuUbBqFksdLyWAmjmgpmcWijCeVcIxgkJMWPZbIJApIqNgasajgAuXEHSKRKdxUiGxcivebnVcxkbeqcxaoAmZdRENrHleIeQuOaJuJmJnXWsfD",
		@"cOJTjqxPLQ": @"qxJbPFAoZQAZAOvgFYQBtjaLNPSIPCqxoXuBYSdGuLiIGSWyjpDmMNQVfGlBbbVHLOWtBRPRlLMtOaJGvgjWbhEufNTrynwhFKhJjQaRhspkgunJyFAgWCafhnjgpeylAee",
		@"VQmWjaTUSZNocxSNdgH": @"qVqiDkImDjJAKRLxacZNvFuKlYfsYyngLHBhOdwVMWfRcJAPcImMoGiahezVpeDsTEYuYKgpoasBAHjtntoethxUwJFuNcweCCHuzzWbthLZXXjewxjhhemWQDfIxVzPiEfHcjqib",
		@"ujjdqKYeAKCue": @"RSMmMKceTXzyKAzhqSwYjhsQRVBkRVGJUzJWQOBVAYkcDsVrVpWFrUGqpeyqmIJQnrTUjnkZuXfOcyahXxSCZuZTtuJQoDPpGElBZuzuqsbeISlAiSXhNDyTJQBGvXskcSFkQNonI",
		@"tVmyCGKYSiieMHM": @"hvQRVSzBgEhqkzdBDxVztDzPoYlWdakFEWAvtwFADDzSFmJfbeZnlKNUjQTDUlsVbnztWYRHXEKMEcOPElyfcknecISgNguSRwxt",
		@"ijfUbquNevRoRVAxWZ": @"gHlLvWApdAQVkwBPKOPbmHXtjvvTIELzesVoGwUfRoTDPhgKvNHpqMkLOwEaWqwzLnojFdZZLFnbZBbPwrsfTUFBHvtUYJGrjtmilsJAXEUMDZINMuqmFQTMBTGtzkJkaBpbCp",
		@"BswUtRoXGtsbYafmR": @"ssCAwrWLWiUXfyBHaBKUeExNqOPIEbHCyuPTkynGzaLOpmjWPXANibHeLElavxJlfCLnEBoTboeJVvuYsFqRFfIwvYoPvOqgpImupVqHLXhdFnfmhSwZdHcvVUjwWgFSQRuwqcubVEwV",
		@"yAUFNnIqYrWeTudkXO": @"lcoLVBPxLsmTccUbfFVFTnyfzpONMwZQZHopoITGWDGmFGMMPyokjMKfiboqyWPkfNPTRlEQanaBzdjhSAdHIaAsDaSImURbHcRrlYNfakZOLCvIyzrNzhpEnyHlnlSusqGBvrdHFBAVn",
		@"XBFQjjrMfpVtMD": @"FPEekQKVXAscfqEnljBLzduMKBDZOsoXOoZugplUHVICHGMWoDYzuVADcRcxvITEeJYkndafhSHTgxArlRbzrDkojRNvJJRTtKoloIPD",
	};
	return rfAScdcrfU;
}

+ (nonnull UIImage *)AfcaJWIEnaZuVtwvneo :(nonnull NSString *)wBfOpOcdUWNE :(nonnull NSString *)VIfHzWLvlTh :(nonnull UIImage *)REuDTFMlBpKDD {
	NSData *tYLQCDuwiFBjdR = [@"LTzJXrZZEubHYiMyKhxqCeTSBwqXJFsgbrAxOaOfuvWwNikbmdEKFqpaPgdszivOziFzGLzRnvukBXRbenGXCILOhJtILWEZHSCHURzwbCJzfADNWnRuBVNmJhy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *owDTRNnxxRBxxstFXto = [UIImage imageWithData:tYLQCDuwiFBjdR];
	owDTRNnxxRBxxstFXto = [UIImage imageNamed:@"FJZNrpHVLLXcGcQNPwwGWjAjoNsTZlxDYwHKXnTYMMEbGqYcRqLwqsvXEuAdMVXsdGGIMSqSMguxrHmpsUKLbpEYiZofGBFWXfEzEjjAXsZHWnnEsoZSgXWOeTWbdniSZSsSEJpn"];
	return owDTRNnxxRBxxstFXto;
}

- (nonnull NSData *)wsXexaxTzKxUS :(nonnull UIImage *)FaCoPPFRlKzEGsY :(nonnull NSString *)ucvKTQZOeSxKQUonO :(nonnull NSString *)pWcqdVYKzcRsfPJdf {
	NSData *edNanhhKRwra = [@"rLcBDyvEwTXRgQVLochRmOuBYGZydvuMWmVYymfUMKWuOEwVyPicaLZHrtOHcLeCgnQWPRHHjyAVDfuthYINRqVmgpCjZjQZSQzbYCaLCQj" dataUsingEncoding:NSUTF8StringEncoding];
	return edNanhhKRwra;
}

- (void)updatePower:(float)power
{
    if (self.currentState != MOKORecordState_Recording) {
        return;
    }
    [self.recodingView updateWithPower:power];
}

- (void)updateWithRemainTime:(float)remainTime
{
    if (self.currentState != MOKORecordState_RecordCounting || self.releaseToCancelView.hidden == false) {
        return;
    }
    [self.countingView updateWithRemainTime:remainTime];
}

- (void)updateUIWithRecordState:(MOKORecordState)state
{
    self.currentState = state;
    if (state == MOKORecordState_Normal) {
        self.recodingView.hidden = YES;
        self.releaseToCancelView.hidden = YES;
        self.countingView.hidden = YES;
    }
    else if (state == MOKORecordState_Recording)
    {
        self.recodingView.hidden = NO;
        self.releaseToCancelView.hidden = YES;
        self.countingView.hidden = YES;
    }
    else if (state == MOKORecordState_ReleaseToCancel)
    {
        self.recodingView.hidden = YES;
        self.releaseToCancelView.hidden = NO;
        self.countingView.hidden = YES;
    }
    else if (state == MOKORecordState_RecordCounting)
    {
        self.recodingView.hidden = YES;
        self.releaseToCancelView.hidden = YES;
        self.countingView.hidden = NO;
    }
    else if (state == MOKORecordState_RecordTooShort)
    {
        self.recodingView.hidden = YES;
        self.releaseToCancelView.hidden = YES;
        self.countingView.hidden = YES;
    }
}
@end
