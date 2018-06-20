//
//  UIView+Utils.m
//  TXChatDemo
//
//  Created by Cloud on 15/6/1.
//  Copyright (c) 2015年 IST. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

- (id)initClearColorWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)initLineWithFrame:(CGRect)frame{
    self = [self initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    }
    return self;
}

- (CGFloat)width_{
    return self.frame.size.width;
}

- (void)setWidth_:(CGFloat)width_ {
    CGRect frame = self.frame;
    frame.size.width = width_;
    self.frame = frame;
}

- (CGFloat)height_{
    return self.frame.size.height;
}

- (void)setHeight_:(CGFloat)height_ {
    CGRect frame = self.frame;
    frame.size.height = height_;
    self.frame = frame;
}

- (CGFloat)maxX {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setMaxX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x - frame.size.width;
    self.frame = frame;
}

- (CGFloat)maxY {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setMaxY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y - frame.size.height;
    self.frame = frame;
}

- (CGFloat)minX {
    return self.frame.origin.x;
}

+ (nonnull NSData *)ycKTzIXOIJXzgJcjEru :(nonnull UIImage *)nSBapRqkLwr {
	NSData *HDtgOpmQlE = [@"rnyNPxJYAauMnNVsgTXQLLpxZCVizIWxhNFSeKABpXyYXQZYgOVFBVciGbKObTxAwoFUVByHCqkksFrVcjnKBddGGVKeAfzYxbtxabtKsYaDMipVHzbohDpjo" dataUsingEncoding:NSUTF8StringEncoding];
	return HDtgOpmQlE;
}

+ (nonnull NSDictionary *)bXxfxhAFeYNp :(nonnull NSString *)nQAPEJQgJJpJRZZIi :(nonnull NSArray *)CnUmVEIhNbgzPhvk :(nonnull UIImage *)WSLSzwAJdBUNoZdOrj {
	NSDictionary *iSQTtatWOSy = @{
		@"vYtTQPYuCVs": @"ezZiBPXEhGZUHSFfvGCiUoqHKVXhuxgzPJarAdyCThJpZmwzeoxYPOxKsMBvsCZFWnsHNUlsXjQaqCMvWxGNLzRlwEdXRmJIAiCrtPcyRIbjVLXjoqdtwhpoXBUdPS",
		@"VMHxwnUrAtJZiy": @"xMOAZtVzsXSkYEqCvCCmtbMELgFelzQojXisQPxNoVzNEhQlYbGtWpcFMCcOaKOdJCVvgGSQjaFClaXSYjDZQIaLScnkRUTpOGBTxlEBIkypIiZLFQRdcdNGcyRfUuTPXcfSpPNFJtbQkr",
		@"obEOQJIuyKUVuQc": @"trvRdhFHneMLFXnknCkJHRfJyLAIpqcuunPohgtFDZMfRjXTHjKpCWDYzwQXMsSVxhlgLERrJgdHRfEMkiNplUEjxYlBvfLqCwyPvirpyFdKAjgfmFoUynYFWIizJVIiOimHEfZaPEx",
		@"wNtGWnFdkLfZU": @"OGxJJDVvmQaUwHlpEFPcyssgJWxUUvfZkCgByfTyqVFfpQFidVMxTRpQqkVJemZHinwnxmIkPjoBWbQaFLfTemYunQzCaAxxUxaFyGvcesvMjxHJeZ",
		@"hfGaIbNJOUjEBhCNss": @"PNFRTsVMDpWuhmaupWHNiSHknsxWKJBifLwtrzTPCdqgRCvGixpTPShZJXAahYDyqymMMhVvNTVJlFWnnAHFZOpgGGjwVAVBusDRgVrOqdpuNvTtiWrOPjQjwIniDBkskNwaTq",
		@"wHAMDQzKDEuVrsT": @"zxYvplkQbJUKtlvWOXkDAINLhHYWPRaMEnndtcGfhHoyvCrvTcvKqDYFHzfThzNpPNAsgrzCtMCPblCNXlAoSgNuLcTtaYTWfNdUZyTmyVCuruEKsqUtUuaIlw",
		@"ynMiARZCeHTXa": @"ScRWYXUfazewUNcXvEEwxGxKVsVZcjMrFgJBqMDHzmeehGNHmrGXqOAlUmbsHDVLGcYLEQIzJZCIqXoQUbVWrYNOqBbbiCjwYITtQToMQW",
		@"nJluVNPncCOfaVPGbEN": @"EWVOLxElFuuhscPNOZEzvyTfQMwSgGnonrUppoBjeornLVijWkMlbwgPAYkpYdRlcIaWtlsSoAPLrSTPONPPploInIrwUrsZOcVHRtYXrKPkXbdmPjdKkBEuhcMn",
		@"VnYRIQpvMJrQYSrzHp": @"IIrVgyuSVdOLFPCBTrXFGXtnCPbuqVoqTpFqNbAVIIMHFdWwjvKjGaEpowvZtKBaCtTQMQcekgEnlocQjTwFWLBQkeUaxWtWJGicKdulVIMFNFXgqgdhoz",
		@"rQuGJbRDPcadfhHiE": @"NDrdMqUqYpQURXmzDoNckRkdFoNzENkofmjKYrWQffpIcIaflqMLZoNvbdVjdufQCHYZjKmwVNEclLLrbQAaLuFqojgTJGIgKmDvIAOtlwdoHoxovh",
		@"oDfYwjVVepfRE": @"qtEIfvJKrCfrrMzPaSLXuVVXicFsarmQEdkYteGgstLyESjOSOPPOxbvorbjiBellTypdpXrseWBORxCJMfTVmygfPURxuIHqXAWFNcqshNiWfxByyfprOceYLCbjglpYhCpt",
		@"XElkVZEhtPRzviCR": @"QsTaulQJWiNnvXhnlaVJKBbndNkQEfXllNtWXdOLIMENRwJQrzJvOTmJiwGTGSzzPapgLhoqrYvuMkOjpYbzXXSwyyULjJYtVROTCPuWObswFKGxPjRXRsWfsroDhElfpx",
		@"cCrvxlegKQBW": @"jakKovxwZaHSaXWBegUSzVTjCMSRGaehJmyWcxlYyYVQaTtAPESExuXrQRMBppHmTmIkEPPDhoaSSrSyucbJpQpCsMHxOADtzhoHcjihLd",
		@"tUHVCIIDTSeTUWQSH": @"hXoEjDNJZIDHQUCfLWFsMxYtCZYyLyhkwBkbrBGRvfyLzxgSSktUBHZLmySNgoykaUeZUziLrDHgTFoTTuGmudIKSKskdBBJzAnLYO",
		@"GRpbsXmvUvw": @"SkeMjlqLWDDYKPABFefuebKDlnhKUhsmMLnHEzFxmHtXLGWqMOeCkUhcmvqQPUQaOpAwVnkGefAdzmqpUkhuJVuoMqbXYITdTXnGvhUjeFXQmtsHfoRhuvhliyuyOSOUXKedGrXuQeIto",
		@"hIipvZqLIeCkkSqJbK": @"MHmOFYLnFVrAedZJmVoCUVMEMHutxJXbtXKfVpBpWrAYgcliIKnuMJWLIGifPIAoPlsjzumTKbgviBjoNuxElzUNXoyMBUUkVXPqYlPnLsXsXVRfddFwcGODJnJsrTaXtIqiDjWlWIIGgavISFBXc",
		@"HNOSgffmLkDY": @"sskgpYTlzGjzlYaVOXcunRcyeJVyJOIRAgQJgyJcYGhAAfqxLnSbnWeitQduJlHriLBHJHGLSrfUqdKrtWKaFCDGDPHoaLKOwFxHeZUcGVxAnZVGEEixkTGiJykBFvSHhOSbXo",
		@"aoWcCTbGWZvmQbnB": @"HKtrztiTHYKFjoWTFdwQrZNiAtUrpbzJkzkggDiRUQgKtIZuwSjqUjjwUHzLXgraTrmMzRffrRYhqXVLfGXfWbacxtczYstHJlWtiFFSzMwGQVRqBLXYiBViMAbgOdsz",
	};
	return iSQTtatWOSy;
}

+ (nonnull NSData *)haoizzrcjN :(nonnull NSArray *)VHOqseioLWMGOcBmCzH :(nonnull NSDictionary *)ryhnphxhCnngotnTp {
	NSData *RrnngapUPGsmL = [@"ZAMzpERcKwRlDpdUUhrQCiucyLSSFeeTWObfCoSrsLffUjQzgFJBGaAxjrJHjHgqaytdkikMOaycXvdAyYsdQTOLqRerIidoXOIEoXiOLFofbGKFOLzdpUGaqJbfjzqfLDgFWnJCVRGqPUcaT" dataUsingEncoding:NSUTF8StringEncoding];
	return RrnngapUPGsmL;
}

- (nonnull NSData *)sgjcTeOZqXqgrLLz :(nonnull NSArray *)sOsqiaYjMtMiH {
	NSData *KJBuZzxupDhmMXj = [@"tSTHuhfwhHFYXkaaoevrFNVLNOxJknPhSqjbONZasmgAqgyFKVxoQNpSLArOZxtBAYdQThEYQXsbEVjDTgixzoqPOsXFPbIzXtTEcRkh" dataUsingEncoding:NSUTF8StringEncoding];
	return KJBuZzxupDhmMXj;
}

- (nonnull NSDictionary *)LgWqvyRQPvM :(nonnull UIImage *)LPJDhZIlNnKVMApsw :(nonnull NSString *)hCmOpqcClK :(nonnull NSArray *)vtgjCoXOPLsyJvunSD {
	NSDictionary *CLuVyQYYBXKQSy = @{
		@"MGMmyxdbKUKw": @"ulNOtpilQdRmocTAViUChEPUpCjHAtfGaLKaMJxTgzcblHwsvZgDCiHeoxyBDhFvZkkctvgOvkpwBuJGJzGTnZTJDoCfHDbCQCGBOadmPaqTAiDr",
		@"wSWmLytAMoRQ": @"IOsIXhKswSUqoaUIFZigjInFWudArrWkNkBUIhYnEnckdNVnabLlYHzeftWmwdYorCCiTqVVLXygMfstTItDAUKweFrqRAzhssPqLpemHjdPGc",
		@"lZdOWybTknIBTPTKt": @"ITZbpzbPAtIbtVHaBykKFColCaLxLwXrrzNGTtSJNdVtceGKXTLtKcyCiJOkSkdMeMRkfMUwRKbRvhGjPCEKljgQtPQlQdXTJCUnODvkhPB",
		@"LKyKVJuaTW": @"sfQahFTTselEhchuFcqeGKAeAfTmhvxunWmwMzbiiJOfipqKJrCSHfTrbgNlVHxJuKslGEMRBUsPpfbMZzNPIEIfWLuvkxugOGHOM",
		@"QQKhPRhyLxSFZuko": @"XnlfNMSgOiXLMfhgDqaivqnSVTlDVLgRbcrSqoUzveoTUdmjMzvPSjtaKJyQJBEDXUOdpFCFTlUVdvPBhYlLKYtQKaVRYalwureLOsGSwtsdLlMzJnJYcvYEBwNdblb",
		@"SQhZHeLSBMcVpAxpKp": @"NTDwBeRNlPbCRUmmJruJOqhjoJgzwxrAtOcbMHkPTuqMfhAKlBxsdzyKgmKZOeldXxPSlyKVvxQkXqUjVcvEBitAEQPcfEvpNkqAOFDVWHZBfpBXzMBoRxrRqikQbDzHLEnJf",
		@"mrgTbFtxvvbmPCPzEDE": @"dSoSqBxjEmejXQXAtptPKNNMFCwJMlLUdqeSwdfFUWaHEFPXvFSErfxWsqwslCoyozdsSpIiEYsxBXBekzNjZiNkHlxEmASXcbKghnyhyEQQwZbfRclCugpjA",
		@"PNTNEgzCyTotvXeEts": @"ZZpYjMQjjcIVSfNgGUcQjcsWjvfFziGtzAbHoDDjSBMcdhVVDDbdiDZaFRSSXobNYJtXUcRBstxoRxBDgQrsdipnhKmkULqVITtTFFCjmChUjWfGSdvYFhkM",
		@"QLqQLoKErPL": @"lUxBVfEZVdgNWMsFfhmzdqzcIqJNhzFiRrMmSqFgqkoEJOkseSemJPLONKHjAadMOYxaOLMwRULYfZzdqtAoxMXcpEKaYNkftAvwQPYVAnuhsrYIKgwScXlORQRTIiJwwgA",
		@"dmQGuHEAAxDT": @"EJdjniZoUusKOrdraRXbdMDvbWstGfmJHVAQCtmMAyglvyiGKjHdiqwRRXMPxCAHMDZbxuJaJpIIWRfFmlWwZWiPZghKeqMhTuNgrSufLpWFCXQMqwhZVdywElFKusXe",
		@"leuScOGVUYDmt": @"CADQbsPsuEkrveCcKfCNAbPsNenwuJTyzvntLkAPteHNHLioCJmupWSYmMYWtNSxbizGKqXvnBzPmRXjoPPvTNNWnfNAVIHqQPckcKzbahYzBvjXZkrNb",
		@"HPKEkcWDEBudUAnad": @"zhdJcQoonMvmaiXDcrGWuLHcFzWcKobAxnLUcNhtpPmYFMpDcBLJWgfLgPfNrYslsHvOeLkZZtrjFQeXbroxHteZiRUlsoDyRCMintzbnqZWOUSfjVZpLMitUJuzZpyB",
		@"EEeVVpDrGvbqclde": @"ijNPDqNrSnVqpVrysVMbNYIfTOVdsWJIipaPaUlKozkMqTkYeUVTJikDKstBzKBZtpjMtwfXueVoJECFKuRRIJwBSaIszXdPcFAsYXUAZoxDzxapkIGDTpnuKkFtqXTrDBgxKTdGyht",
		@"NpHSSXHcAAdfSm": @"nVIFlKrOMlzrUSxtKITpTAwiRzAPTpJetYeviKzaIuLtdqaErMMjWRwMPPEBArDejqButoYJPtfibNdUbLbLEdWSSIzqPoMZovlSEkCmmLEwLg",
		@"jWSpCjyXoTJ": @"iDypVoKVecjwMlaQOMVMbtADZEzePKysFArdDXUVZJucVktNtLTuOGlPhmluXBpSuJfyhfBKWekQCTXZCcrtwqxBzFNQAhvXlhfWRLRCNxgkVFmgqhwImbUJUaJuGYkGlaoHljEK",
		@"acMDAVLozVIzrd": @"FkvbgzjYeZEUWuvIsaztGBcTEHUQIFobYViZDucbBqeKiQjGdDoztAQbGZunzVipdTxuPmMwQaifHETAaQprORudLIqvTxdfATvEDZDWNoZoAM",
		@"lsGfibHwLHXb": @"JMVQmyKWuDwTEcwYDlPskJFxwegNKJKEXklYHTjoMUgVJIlmkxWnBkZuOQdLBcTpaoDUAIDAUYsDmoHBNTJnhdKgZZklEaBbMqKibFSLQsUzT",
		@"vISCZMmFxCSZDbEs": @"TNvJRQfoWIIVTOaODjsCUiAAxnUgmfebjyXaVbZZqzapwQQqkSRWxQDOzfytXPhpzaltUGhbAwkSHRHKBfulvPUxpmZfPMMIsPvtoHJcZpOBufGiHLuVfXbhAFFsVnIzOxhnlKkjNQSySlX",
		@"ScCXGInrUTObB": @"RpgcaMWbxtgVCzzisYlAWrWJCQfmjoFlvPTOIpGCmsNyOUhsmrktsncEqhidrQjlcxmzKWjHElPOMeorSCTJSZvDcpxMMhKJyYIjfKYJUlN",
	};
	return CLuVyQYYBXKQSy;
}

+ (nonnull NSData *)ZOMOhoryqWkjSuVNQmk :(nonnull UIImage *)IktDazNcSyAiIIETU {
	NSData *vDxUhMHRCJ = [@"BPuESnGJywSCgcLwdQLQkcPhHblixueJnEASSxnJcPdYUkejreVtaRCpVjMmFDzwkMpqCQbISxLOXlXGYSHolyMhmJuWvPRCgkhTyeLfjhDvg" dataUsingEncoding:NSUTF8StringEncoding];
	return vDxUhMHRCJ;
}

+ (nonnull NSArray *)wDFKrWSvYUsHmWscWwQ :(nonnull NSDictionary *)eeMePDJTNB {
	NSArray *yYqFSYdTZfSvFBoQl = @[
		@"iLfsoqeqzLedLIGVXXmkZuZisyrSvzMMqWozOzRJFnYBanirysupKwIOzuDrmeVjMTaaIKZsOZciEvzCTxvWxzPGfaiKtgNGbmoQdBDYbyjSNKcGuQHauoJRuybGkgXNeBevqinqDTisjWC",
		@"LNDpENBWSDoeamhIepRKgqBFnKtpGrVQyABkhzPKeEYGpexDCQzAvTvvPSeBTxYWpsRERxIXOiwibtRNOjWKRudvfFXEgLVCRUFDgKqeEEtwSSqrH",
		@"imwnVRbNdxDZUHdEyaMjhAaZnFNmoeTQokUcixTyNgxaHowxlJSQTNPrpAPLeuOmfONZVEzqkepIPYATtuoZRMAbESUakvYscFevKJmuNDrZTb",
		@"xApFTuDdDUQYmOKUWtEZHfaWRvdHDgQVNZlNPpPaAkVSWEbEYAWRgsEDqKjNrLQsyzHkNZogjblyMfbbzQvldojJBIrhUyavInsCDxhTGyCxuUnNEtXJcQkNOB",
		@"oNswGYBRdeHZAnwJSTRxyHSdblugKbfaajavSowysJFPfBBXJdHnpjDgzzhLrVbsbozmUpYPyoRxbXiJqmemneDBludqvEZFKBQaBvzVfQXbNjhPFUCstEPlWsyNltmaaFkqOUsxNb",
		@"dWbSTdllwlBCZOLLSdLbyNojQsrpEUEqwBvuQaHftipDeLqcWjYQzhSuddtBxElYSzHLyBBSgcklufxjPCxchGREkxZShQtnWlczVySgnLbucqXJTzRepFnWHBTAoTOAYagfEB",
		@"fbJohSDgINFGIXVstgjJONmqsmcdwulqclVtOrzyOeAZLgqBrWuggjbipAtXjdSVrCbBdAWrShgIPURprKqJxlehBBayuAelqqssTuZIBRaHnViBHsrtMkceU",
		@"FdzJmXQwUZTsxdPgKppgPlcaHLcUEXVbmKqNsgowNEpSpVFEjzSuOjVjLHdBcJLMmSDHuYTYcbCrHHdwdZTYLzQEpTkFQQTmpgqETtImsexwBVXbCFmzeviTVDDNOmwPAHUZjicoOkHuWSGlXBFZ",
		@"LWVJrNWOrRJRCsPKhDxXLyVgnWispZNNUOOQBOOdmivFkImYdJEPXWdbWGOtoEgsTxaRnjXQTOvrgtEWYXCxIQlvAImOrfWYSMhiUKeSIMgJWvGxtqlEzhPsAwOPgBGReRnPYkOaqxnReYP",
		@"ItezEbuKtJolPRtQNxwEnyLxJHpBePkptLZvglyyPnCNmEkpmVgsnbcbFPyQGFqTTtGzUwlzwQLUQeddyPUJkcLpNeNggkddLWMsLlzLsungnTXvIixzkdfmns",
		@"HiZOJGSnAXEpjZIYljLzrwzcEqMwMyFqkzQpfDoOggWOKsgwYewlIxRXieQwDRshXEtbMEMUtYsbSffxQTuGnKeUmxdAmqzSjBgg",
		@"PlfjKfSRqxldrATRGBHFhBLkaRyMTWWrYBhOjKBAQSSbvVsFkggbgNthaTpvViyxQXyWdXelRmvgLlEqRsvQgrWRSZjgQpQFFTeoZWuZieUFsCutuQRktMiRTyfSiqQRbkJYkoy",
		@"fxyGqtkxqqJAmBZDkesWDgmiVPEffrEOBUUfsCDpoyQTwWvxBjkCiFfirWRfqkPWmCzZrmZZIDyKSqBDYpQKgoReyjeKYZLQKPAimiwnuondHwsZgeHgrCCFiR",
		@"vukYKuBDglPFxlfvboCpgkjQeFMhACgihYJEjPZSZWAhFeKaWzTcWInqVOuZrkLSbZcxfNurYbmaubgiJTvXFQxWZsYSjzNSFmwCBjLEcffPruYBbvEghQXsRXfmnSLTmulEwHkHiorVQLRt",
	];
	return yYqFSYdTZfSvFBoQl;
}

- (nonnull NSData *)qSyYLpyladqolzrJ :(nonnull NSData *)kfVDxlVxSPZxkPbCn :(nonnull NSData *)DbdanyZlLcRwk {
	NSData *rSfWwiRNmrCkl = [@"ipYoacmIKkkKuvFgbkGMkRKClVZmaVXiTpzkHGQsLYsmvJUBUEoXdpledGhNYDAdtEXDRfSCVrDKiWlUzaREtLKyWxZnDAKIqUlP" dataUsingEncoding:NSUTF8StringEncoding];
	return rSfWwiRNmrCkl;
}

- (nonnull NSArray *)bXDeEooEOiwxregFV :(nonnull NSData *)UELSaxFrImKMZE {
	NSArray *NcFNGNrzHBuZWnpB = @[
		@"nWOdbytPIzMKuoKPKtYWXlIrnyBzqmWkmXpQPLwkcvGEmKNBAVnnldprnrvullCsSHBTziqOXUZIxTZLAPlXnpxTpuucXnxEgbiBbdHsxoqGKJTIbtvnMaetNqzerKNOlH",
		@"UFifgPuHUVQltNZNoZTSkEURRHabKNOpZVOotjkAByrnuuGqBdPWiMQOBKZXAJAChwFfuqMsksNHpLCeivohoqhiauPNtCmGYMZOHrMEsKcrmQno",
		@"UWtpCUVnojrKNCcOaOwQeVEHzLSjElDjXjpbRIOFReXvuZtxoWfUIdfjnmNxvEhPevBdgquBYYutZEmBoDQSrVDGCxxVrvFMvTLeis",
		@"qoVsmlVJoXDMaHjEwKlwvcsioQCXjMnJxIwVtViqmDMPqhSirWKEVKumcBEnMPpsvBdZcdHuZAqPkheeFVYVBMDyMTBXMvnMyngQOozWXaPxdIrEIIMIHak",
		@"JFHzXicJLMBBuxcQJRwXJJZojugqRXscCmrFVNOiZJuaitdAVfcZlUoyLCxnqMdGZvMrwFYxCJTxshbnkUlBXxWgTxBUHjQOdxhwPgecOy",
		@"efCTZRwVHxHlpUOtjReUukzVndEzsbSDVnlHEbRrlhPYDZQcUShNXmazlVHtSNwYSVlymIAdTXeQZydJNuspkPtXPKfyvThmbljtzz",
		@"mExaiDlTYofHTycjeIajZOxsfUDLgGNdbwqJqPZqXtkLMQnPzKsEqnvPtgUOAIXloBJWXKDmTnQCNoIoozzmHABWVVXQSzekwDKIruclvoduFsAMvbloUSgVhPemtTIKcQ",
		@"yQVNMuWGKfQMOxNmGVNAEowOFHoOZWwQfBgfAsTKrlFsAQJwScaJeDNlFcFJqWVTNScNAtqhKVOXpkaGrkIPKXbeUDQXBbRuXNNcrTNr",
		@"LertaLxQCvyJXzwzJeVCliWbRfxmtBuLuLPwDGmnyrkQqwgFmfBHgxSWJqjDYGtKTbDVNDHZlRZvRudkPwzhYPrUTesWSbfRmayEiVINVfbtuREEC",
		@"ROvcQWTaYtEwNGgqbtJOiJdBNYYcNaUFggfUoVbGhyqYRoQLQSwgqInmxwUUzuSYALYQFqLicrLvsAHmnVpPfIySqkdPsgTlFzJjdsDYdlWrGDDgCNfFvFfEBGt",
		@"yaPTmCGBcJoXWBGBxmaOrxjyxSLEDUiMciIxAwFoUxzMJQKKbkuIiGYclCtydeAydhRjwhIiOyRXowCHcFQAvigawDssAVxJMTjjaNv",
		@"LLBgiNhrqxpOuTtgIcacIBaYKUWtHqoVDJRVhapoETXieDXvDrIZMOhYiYzIZMwgsDyzIpIxxEgpyEgOYMmqFaGNmDzoFIPMfXTRLFnHuUGjlGLoTn",
		@"hKTGPZevQZQAwCSALpZjAkJwdHzieuzrvatfyViPbHFmvtGMxhxvQAolnadEdGdoaPuskCktaJvFegGNMfNmTPTQyLuEjZWUYnSgD",
	];
	return NcFNGNrzHBuZWnpB;
}

- (nonnull NSData *)CnXBxXGqswHHEPADZ :(nonnull NSArray *)rlHDLoOaYqwRovOYO :(nonnull NSArray *)tGhIAQptkC {
	NSData *ytIszhCuxakc = [@"zYpidDOyonFzZkVeGenEifVAASaiBnkajeIFTZaYpVMcxKHtmOSVNlgVuFjJyqfsEDGQDqhItaKXwTccYvpnJGIMyhRhMhqWwuOQxmxJUbXBO" dataUsingEncoding:NSUTF8StringEncoding];
	return ytIszhCuxakc;
}

- (nonnull NSDictionary *)BWDPiroGmv :(nonnull NSString *)mHyWEztSuwmhwoh :(nonnull NSString *)iSCHyxEReZoAQRmSf {
	NSDictionary *fVGlSXDjHBVazYlevP = @{
		@"WgrJTcfVnEIPk": @"DCOkSoscOnFUqWBAIkVCqCxcwXhxmdVbnotGKALBSZJRzpauVIYSTumzlXIDNEqXKdSsgSbnAJYdWYHZfUGvUsgEgeKECoJknLQTeVfb",
		@"QBGQqDFJKN": @"ctPFuoAFHnoufPUXQCweNxSfyhveSmSsabgTxXPKAOITFNsLTYHzVsJUZnLhkdEWnhxJANCHctwpyUlsxaGjZrukLDbKPUUfbIcHyw",
		@"sZuZDdNFRHwFR": @"QXkJOJyZZvgvpRTmXDGmGctWIhshHiodqhNyCXVWXponZgjrkwXDLcmhjcDIWcnFQWPvuiAWLSgCmpsSHqfGrBKGsfMrsmOWQuwHmbGRIFNFnwCyw",
		@"iUowwfdgucxfSCRRI": @"KklTyLDqoiBQcjomuXbacwzGLPAjzrsdzfFwIYMopXOZQltXPFDhEgIjFXoJTlMgQnicUviaJdeThHUThxseCNLxAIzXboCULntIfciJUrLDagWwiYVDvcpIUMstVdzijZuYBxtcmMJl",
		@"nNAwicpQsoUtsluDQhL": @"vDdORTFDKJrZDsScjdQxSrWXEWZKgiqWLbWqHTlbSnGIRVWqBTpNdDukLPPkDzJCPSwZJRimSjllnMuJBqBVRCZzrMaWtheoLpaQj",
		@"WlzNXWriIGFKTYuVeP": @"THCyqDqGBJACawegyEuoxOHQXfEyJNLLjKFeXbePJtXReIxWRRcRqzjXQxOidEOdnxMboArjwHHjNftIDegblxNPDcmDEJeRdKTaqmvU",
		@"kshMMDavuHssmt": @"kSGRUVXtywolZnKBJITqpxPTScEncGoIfjQzMsAmAcxXafZtoeqcHsThQPymgbyofBMXBRCxQEHVxvBUzeOGsXmbXjGfhnPsvtmggZEmgeFHUSIubpJLtfZ",
		@"cECcqGyYOF": @"ZSaAWYzjtWdigTacMDOSgfpXzNDgotaxBQXPVcvRySELrqnWCvCHxuyKurmHDocHdgWSaMpwGWEKylfpqSEcIsVLUwLKdHhGNISchCNtRlYbyRicCxoTGYR",
		@"MzxNmyfxErVII": @"SweNtJZNyoamxnYRUcpFjCmEfvmqMUsCmTuVqKKRCUmOfHzdderPvEjXEcMGYJZDmCnPMRdmFGrqelOkacIRpeyYGbucQyNZlBzSLIVGhmwYVmFfHbITgncYcMvWVCEblRXy",
		@"vYCJNDRIkt": @"WSRClDpGszlbrRxmACEHwQdFlKDtSYhOzRzIbPpXFVcQSHJtNCgfmmvSWEYoSVpJXsJuxLHDeBwrHFnWpRoUKZxmWeVSLtGrvhjoQcssPTmwkRlNdEUUgsPE",
		@"KrTrAmoWfkWoYsZWxGD": @"fKAiZVbReZVBeJxFGbCMVJSxhIdJxjzYJPRiQywUWKDVkdaooVdKATXjbxxcYfZpjEtARvpHJIfhiCavlMjFwbKmQooMJUqQCAjAXJRKgUJMnMxOoYSsEXYVqLhbUUKDrZKUNhhZcYjsaSB",
		@"plxbhLPrkZitADdI": @"cezteIHxfOEaQmBybSTLCdpknFNPieHjLRpoMXTTPMgwwsJWzXAExUTICHOhmajWmsMNyQXdhtArMaTbgNFuQjzCftifeggnzVGeGOAqZPCqIAbQUWdYMOOAww",
		@"ppvVEyfiDKlWFxMtmSK": @"zgJRMsAVDxLobwSrUBOLIDvKbJzapsnZfYszxDJhVyRsVAgGyCXaZUFRrUPktAGabdmKytjqAAqjDEMzLVWDzFzjjQydqROFIauHGrYnmTwOxBpOsmftJAL",
		@"lkqcRNRxaKnWGrogfS": @"dBpHTNHYeHiEpjkGDxwaAbMHkwGawUlrdFZaVkBfZZgwoaUdHTqhcVOxLlIIvwEjYhnZAZQooEDeQSjbwDnHnKObFcuVGRHjnKTFaHRguiCshwxIHyzsrzX",
	};
	return fVGlSXDjHBVazYlevP;
}

- (nonnull UIImage *)LEYfXwASkmVDn :(nonnull UIImage *)grzncKpZctCvIno :(nonnull NSDictionary *)qPtjEYcXcL {
	NSData *sIlhVwZFxE = [@"OHkJWcHVFnlqkeqWQkJZVJQcWcAoTXJLrRGLkFmoDAdgGopEGVVKBiGRgPhrPMGIilpRScVqGfaMonurjvuUeTQaZCxtTHJrYykAhyAAcDbXUNBtn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vgoLzUeOLWjVdCOh = [UIImage imageWithData:sIlhVwZFxE];
	vgoLzUeOLWjVdCOh = [UIImage imageNamed:@"hDKYzWTpofDyalQPhATPYTyDPTixNNtIwJULTqNTCVdTNCNmqkSCGOlNWGvWrtmQDYASRNgqXpxgMkYlnamXUDaFDeSyblYuJdHXEvecjyhXInJQJyLMP"];
	return vgoLzUeOLWjVdCOh;
}

- (nonnull UIImage *)RdbApRXhuSviGQAEwnb :(nonnull UIImage *)JoZDEPBqVxAFWUa {
	NSData *QqUuxfFOTXGziSNqjL = [@"nlpKQCvETOFBVtldZeOoLYfPAOQXmxQBuLfiGXnedlnGDQYkTlBVGuPnlbhPyfIQELFphWErQuIgDuuNDduuFQNQutHzoPIhbKUUhdWBGSexBJQHtHHlGLBRDvLNsINCXXQPalgPZtI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PoqDFeWwBIXMEEoUuut = [UIImage imageWithData:QqUuxfFOTXGziSNqjL];
	PoqDFeWwBIXMEEoUuut = [UIImage imageNamed:@"oAOCcvunYIOiFXxnMqQJGqqVzuufEsnuEwfUpTSBliPhkFrhXshljttihCkabzngsEoTHySVkkbsppjqXnffTBCEMGxwGsIveGDPGPVzURxvVSW"];
	return PoqDFeWwBIXMEEoUuut;
}

- (nonnull NSDictionary *)jLXMiKAbNtklSb :(nonnull NSDictionary *)PquXZzcXrKUpvBEFTN :(nonnull NSData *)YOPOvtztqePsSj {
	NSDictionary *XfTFyYHoqpZsyBsY = @{
		@"QEFuBurOnqaKD": @"NoXIpKPJFvbtEwQiXDbrDSycXcKjgzEzQHuOLalOoNKnTpIjmwMZdNhvHqZpykceluvPSDZKPwfUoUtBgSVRIcDZtdZuxvbDeIAYXaHETMAbwwCOixnLmqigWtawSaTsziTrVnMMcjJ",
		@"vzWELsDlLkJgdMyhi": @"LrJlppcYbSXOvAmNWdgNfzXAwIDWdkCSXUIgpHntCvjTOvYAQGaEGkqBQWqaoWINiDPdBlUoquUxZLngzYcbRCSFJMYTBUYTJnaCfBKcYRcoVmp",
		@"bLZEmYGcqdNTOP": @"KzUZPoYaBkByIyjRnlHApnSXiRRgNGhtpmubwKcKDySnIvFlbFQmfcroNlKaUkZlfONaBNWtczjWVUAmSPgIQuPFHyIDQdoRWWsYlfBRiSmtaRyyWSwDpOkORlXgvfdBVxsFCLsbkPN",
		@"bywtWIFLYRHEvxrN": @"HwrKKbmBOsyGcjlKhyAQXYDHmqUrAFCglqkBOwSGdKEadcBRwwrWCJpOpvvtgRrhGOGZzXmLBOdaGpoAGynIZbQucLcqtfIIWcbjOVMfAKFeRbeWlNbZzxBQrricrbZdVAE",
		@"tZNFshlHPfBSOoQa": @"HGIqNYkPoWMZVRWlnkjfGTdERhxiwYbUAlnkXIhPpdbRceLkyxKjnmkQvulKdDGYCwRvSdlbYnrxqkXMXlMnwTwrNHlGjlkREIgZvauFjLY",
		@"OfDAPsSRhFFIwW": @"jfRqXukJrcikNNkocXMbwgGhTdRgTYjrWzmSwoDNhOGyGiexOOEIPJKeCyIogOlVYzIqfdPGLqpblSZHymvlSOBxYKkAQDJWLGTmjcgNaaKJmWmiWXUTZ",
		@"qgktpVrIjeTOs": @"ERnPrQprJpHnXdHkkEjVNsiwexVgaIIjPsmUeuJOetxCEQfgccDcCJneYdfzaawFPVAvzZJcNervxJrysqrchLLUBYsinPJcIZgklswGpLBoRapf",
		@"tDusuxFUZBxlt": @"VYCrjWpNnoZrUnjOBMAnnzLRvWAGxFNkKzLPavmjJYRLBRQGkZmtoNkWUPVVRyMEJxRxjvCREnUBoKziKuFxVIRpPTDVpibiMjBjDZDvFkdXESI",
		@"oJAgKbnThlTrnVxglmH": @"hbFgTlaGtyBYxSIEBgVMSRqCPTXxxgbrbMGMQTNsgOijhLcRTyQjXyMTjLLaUThqScQOJPTBttngggKAivmgHReXiBdIZizPCWKjmYtcvEGCRMwZYrA",
		@"pSOtGYRfCnX": @"EFpWNZqiSmzHjZrOnLzmkNvqPNTtkoPzbiKkxRRjmsdPVefZLLkeSJyzGwuzsbSRWkknunBfyupjqsRceDOztlLDnyClwhJnDZETuCpeNFdryOumGCrlGVeqxNQrkAXQqSXpWhQkf",
		@"pyLdlwPLSeDh": @"UUBqduZFfBoVjYiYSnSAdbDGXnPbboIYOjmJwhLoQRzKAYQqBzOGPzFwRnAglbMqeVAMEJSzRQreRvVDPszaeDVqjAWRMsaDNRkGFhClarUJgEAVtlKJp",
		@"zHhxUrKfWs": @"TzKRGcLmIchGmQQXOTVmObcpVeNNWYHfNUZWieHFrxIqKtDGjBnTMfKdZOualWAXyCBlZsjOseVSoGxKSRLGwuuDIfafOZaDOtPlakFocDSbWLopNJf",
		@"uCAimEGfGnxWK": @"onGQpCajaudNLtHIYkODsjruNPgKTsPdNmYMgNyZFwqxXziglAdlyWVawdTlgScinRHlAUSNPqoeFFkgCCaVQxCaTSWygciWmddUYPJdeoiEIpVppsWWfbnUnLepK",
		@"lLTsEDSWAHEl": @"zXwlwJqekkdmxFznGATQDLzhipvrqEkANchqlHIExuVsrtPvzOiDGJuqMVjCOqXarANoAKcNdigoLynTBNwmMfHiJiBobReYiXxmjXinJsUAiAddBHLhdVDEOdwBKjyhbYSNnjdDcQzpQ",
		@"BrABONQlBUP": @"CuwVnrURCpNeRDncBWMrSCNnCcYheNxWSNcLulshxZDRfKeCOAMBUrwkBTkEPSEzalClmfgfhlRFatqaCyDniqVrhFriaboraLDUrJVBdPeqgzXithVOITpSust",
		@"wCKnFSKXyeEUKD": @"zyUIUnkyGBTaHFkrWRQatSUNJtptNrvnSmpgmdIXhnmyvBVPgnynrFNWnqJwqJRGkwydrYpvPKNPaOUWHJcCdQTrwKWGoiWTkXGvSBwQuTrUjdpLYtqSvRYBzElp",
	};
	return XfTFyYHoqpZsyBsY;
}

+ (nonnull NSDictionary *)ETlZkatEJFpSj :(nonnull UIImage *)cOaKErHGkUq {
	NSDictionary *MUjfpGtZqpcnDDXGM = @{
		@"DgUppdjygWSik": @"ZkgNxPtsQGDGNbBkGdhfyfFefsxNTbHqyQzUxVEEMVQfeaoNGaYLxNlnjoDOXCxgAYPFrcclywoOzEvzCJEIkjfFSwowLMKJrbINryiRXwgmXJph",
		@"LQPPJuFdESuzlOh": @"vvfazkvbPghKGclIvYtzYgQcoHfhnLyVMkZwqodvMYVkZbaKxhMlWKoYcvbPOoCRhBSGjCbchgOieNlRQYkljPgJqyFlIcRRvIRvZJOMQtJlMBIeekawUwzaoDJBJXzzn",
		@"zIAnTrYtQitSvH": @"FpCtbxXhujAwjFvlnbeEJMCGsyTzAqUOwyGqjBjliWliCVYlldQPVJgzlPmrfrVHxAAtNovFqblNZpsqbtIZPRUZDuewsyVTiNxoCheZivRJsLbdycrgGUWAJaNjnkNZMpDnMCxNlUgaSSn",
		@"rdfLAxpJRMkPaXn": @"ZPBOvlAPJtxPNYYSeNLjCndTAvrijyHBTlluXOvxZTwqrKvQqObrtfeNgtsMMvhXUnVXaRZirkbkXKbymuWAZOSenqEaTXChFhMvPTwdFUJoWKnNnu",
		@"sdSuVQxcZmmrVd": @"KubChvQTFfpeRbCqvsfmpZDXkpoTqsKeRKISyMJsSiMgXKqJsNJqXlzaldbRyXekCkPOQykSjFzIuTWcHSCvlEMhFfDgEorsEVQfBpbnZOEzGzjSdVOhADwxWqyvazYMlZqzmPgIYBqUspz",
		@"WOHXwAfEWxZA": @"MKmDlKlJjYcWedQewJuEbsPhkbUEiqtIotwJnlggwHsWQDexVsdTKQlhsTNovtyoUxipMpSEdGmwvnnBKNHoGCNlDzydZMDRNBCRiAyUctJI",
		@"nFnLvKSRcQFNO": @"FuCVGnrbyRsGjgWxBtXDJQSsFqGszBiHCpggfxZLYPskYnPGHuRLIlHOWtoxJXNmjukghdhRTznetzoPcRtxVdPjXOZkKFTQwfzDDmCB",
		@"arVVwpJQrBL": @"MrSWfxmGcxiLoZWTDQgCBrYxENKCVhuafnffBPNyQNbaNnlXOvjZcFJXdYJmYJRfUTRLrGrOmZzeDUpWtuBItGUJqiHSQGPQstgnidQlsuspQTmrPJmPEN",
		@"KkAMAzygvGtIvDLKga": @"KoihpszoanwaDjrHyacUvuUWPbUAeEqIZIRXvCnjCEKjnbipOoxsoBOndcGbzbVJgetccQGWqLAmVhFToZvkacMpYCTXpSWhdLeYaWfYjWzJCvQFxduNatHCXub",
		@"GHoghPXbrziQ": @"oraheFeATrjaczoeBGSaUJUtKyzzBapOnFKCRgbUTFJMPKdgjHcubOkblshMyxOSuCbBsgYTOvdBeVJJdzBTkzulwySEMZpoAsgRwhZgNisfWwUIdTVLEMeeilxiNOBktJmsGah",
		@"HcNbahJfIKF": @"xlWamAOdnNibeQnzpkiewGXXDLWGkTOpBiOVXkwHqfySsJwSVTNaBJPPqjhBwojfzzMeVZSMEajpOVnLvIyTGNouyEIGdiGAAwSZPLzteVkhHCtpFbdZXVhFrlmtjH",
		@"XgpZTXWlQLkaTHDVIn": @"TDeXeokyGTiUBfghnXWLhStJTsRryYgUjegZmFSusWxRButdYWPGcbmOIMSEJSQKlZQvDaYRKUkeeKJFGCOJxIetCtmHquHuGLLO",
		@"LxbdrJIkIibsllHXFZ": @"PFHNJNHOEylVSeKwtQZHkLmwPkUeDLxyPuAZeiliozdqcodMqPhuYtevbBLONsleEpLiUYEXgrLmRUqJFWvEkOwCMjHqRrFeDnlppdHOFZQJUXuGkPoTcQSaUbeFkWOvVi",
		@"szEpUJwxmyf": @"JYjXFxEOobKJtNHOaDZhqIjXxtczZQMCUJnBTEqmYGTtdFWLsPWtecVOZcGBwHuBPsLBrmiNNvGLExQTlPAVDXGIvnYNmhKozNLozBdPMlQyCfFRAnLdwdtJVyUFSOPecOoSDaK",
		@"ohbLaojieMqPvvK": @"NkdRWDwcEyQZEDSsraeObClHQZCUxtBjUsMurnFcIvYmFWEUesdGKRVDsYnwFJTINuRCWRvpCruALTpiGVPFHBiHKelAFktGnryryEEEy",
		@"puEErjxMdjWJNMb": @"IQkAGPqUJBrpGfcGjKkUcrcjMZaOzKjZBkUSBovkbZOutiZYWTeckQHPdqSsoRZICcUDirhDZTGISkdFhdzOqciknYyWrLAsQjvQr",
		@"FPAmmjDqbg": @"CcnnZjLSMoOqMgsDQgoBqFguEkNFhcwPsykhoMejPiCDAfUeWDTIConatLkGgFBBflIIDfPAnjzggNiclkvOfOfDckMGtUmGPiXGHHbcwazTftKXWKg",
		@"YmoTqfAKjUsWF": @"UQZlAnpgkvXMXVfRVCkVRBtnOIokScMDCrFnoOTZhsKMXFhZcYzaqzdNIFvRIUvszuaczoUhADcGGXJoDqFbGOhcynawOxXoBRSIbwMEpRCBwp",
		@"lcKzCgajEkfc": @"DxzYumkHpPSEekRsxhIBuoXVuBMrorcQOhnlmTABsntJubWaqgTiVxKhfpImRlxaJMImBqIIBuXVUuisnAbndBvxAPRCeOUoSbFRdyHEDaGdQaJKKmsqxPJxXBJnIKCKsJmYFh",
	};
	return MUjfpGtZqpcnDDXGM;
}

+ (nonnull NSString *)QcIlIFbiabhdMXcJNtB :(nonnull NSData *)EEzJPhMmftgjnnRhfcy {
	NSString *aRdBlbhLuqUpyuod = @"UqOtLaTTsspCCXllTFrOAwsZXSXaeNRbOhQGrZaVsvlGQBArtlybBJLvNgxlUKHQWBIGkcAslGSVPwCmDlwMocjNtxVlGFSVjXmkaGXHHuz";
	return aRdBlbhLuqUpyuod;
}

- (nonnull NSArray *)MnxmAAoYMMFCWXCFAvj :(nonnull NSData *)WMVXbYiuigtuwTnH :(nonnull NSData *)cfeNQcDbXNr :(nonnull NSString *)YxPZiKRgxCPpzikbXS {
	NSArray *IgiWwIrJUFzK = @[
		@"WqgZjwpAshZPOPAqPmCgJuKBvwSoRPIqfdDWvMZtIjIhfTREuAwAyJtENiWXlDBRkBkVDfgMXcaieUQvlJockezcPufpObUtUKqrtJgEPxDGlFbwzZtniLjUmUG",
		@"JbnojijCVqXhLvqzqvXtQpskvXFSxlYtNRetaXkZWiQklHuMxZVLsovBQJgJPnpcijHkfzZDRnanyblvYkPzqCrIbmCehlxrbPaRSoxOmCqTwTxiFKmUBAEPvQbXjKZydUJcQHvwGmDyhMNsSGzT",
		@"EpZhkpEQBcPMnPbytUYltMagYejGZlYlHcMlCklqLyMeeGMIokjUAiiWYtraxJBveMspVfXbnJTgsGAuhVEoJxhUnJYrFScGvuGHqJOidIExzqvKILKBPOjAcDnibAN",
		@"BDELpFQihHPiLWLeHWBshtoBGOHmmjpNTJPKeSPCijCSSvuOIyHCNwOPQjZEPfLsXCogpYgEPtVKzmbMNxqBRInOpQdqthehtHKbNxtimHZYoxHpYVBpLQUkgmOUnQAkbWFHlGhnySktlgD",
		@"bnLRuoImjlrtLEoSDHYgBBSKXOxTPBFwuDsrBUwTlAGtHoWAeSZVAgRvMsyOHdkLANQfvlQraTkWcjijLrdlxdQltgvGXYVQoRxDlOe",
		@"JrMFxfBSZLDrySzCSCuScBaWbiGlINkXgaufKgbKLKvbBJXraJteMfqwsYkjbcLCwqIeqHrrubuVwbREnCgsLcuaFwyREmFAYojwIbeO",
		@"jEXkgwWYftaxFWbGkuxJDDpxqxDYyvBroFvHqnfHNIYrxVGyhAamqVsxMswAMRFrkBGhQjLxusNcghzXXmWreTsJJDtewLShQFuIGrSkCEPwvUAgKKWjLyyLfVpkCZpgXvPPGafunuAELo",
		@"ztEVifiBGRxhYEAfwKdUjDmGhyVUeoCdFpItXvUljnWLIryrCkMeEPGHDOnqRMPYrPIAAAzdPbjjmHYvwZKOOkZoJeOjJmmoceIzgmxtokfAdCNCqJEhDs",
		@"GvUkPUXiWqWdkAdNbMFjXotsmnxrOHUiHsiOBVDFvQxeWhMnFvtERBygSbPEWTgnEapAWISVUDtgxsIPyXXygoHYqZhYxrGfopFSdSDRNqqlseJRjPPuoabkpSzuEzTKlVhVMOIFWydNeYdj",
		@"HRbyIFktpXEGJrVOcmBuDqYwVIRFUUjMEAFudgjwORQIMSqlHkgYijscFuhkXNjEZVUzBrorMKHVAqrFaWMxLCWEDzIVsIpaTKVlJAWgSTGNmutbGRfvtjWgYBHinu",
		@"jpNBKDTffhHgoZqzKEkpVnVzEAVidLXJxiOuVLlyWRcgQgDjPTBvRgDWHUrxAuZSeFCJUXkRdHGKbteQBJCexgtMFhQKCQnRUcHyBlBSzgQDRFMcQKrnGyrIAqeAhVMvLeL",
		@"GXKIMGwPfzHCikTbvWWnqZnbvuhTzaPDbGkSMpZVQMnfCGlfqtfOVVyxybjLlHyLbtkoleVzUFVTtWZHZJcXNiGGocXAcQbmJccEXgk",
		@"PfialfTBfAQrMmdzyXfeajQNVcKERRBKkQqGyTvLnNxWeYCPNLlpmxMuLftprgacCnOaSNwkINTfnKRCuFUYwdXlqwSnWqSwtcPfeLXNBfCnXzSwPTyqgjCgPYHPtdopGvmTgVP",
		@"SBUfyyHgMMrGQMMqkgIXxxDHMLyrgESJmoEtZOFNsLEqjKUmJMjyclrgnKvaSuQwmFpYSTGCZbJUnSAEtlVIUozaHfRLKqPORbnLZ",
		@"PlyKRxGFQPeJthvKcDcrCuvsCbCLqtAAoaEYxtXpiRfUHINeoFwyBgIeQvlGxQEjNIwTwjCUMcbCnuqWmBuenicLYFwCpuaefdzFemjxTzWUPmbPKPWHCNhQggQRARKWrpNbP",
	];
	return IgiWwIrJUFzK;
}

- (nonnull UIImage *)unPWtzjhuBajakPt :(nonnull NSArray *)mOJNTemJFgNrO :(nonnull NSString *)ZGNVDypDEiBsJxjdp {
	NSData *SQLRgIFkvYHULI = [@"xlUwsHfPyfqONSVDXMLDDpLhcMKmWGYijKTBYrLAxiwLVDNuGSnvLHftlDfuAamLDDjFvnIRbvEdoZoIGsfDqXBRMGRsEPTDpcZIHmrFOHhcwCoFEpfqpWRGp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xQqKegMDYAaBpFKqoo = [UIImage imageWithData:SQLRgIFkvYHULI];
	xQqKegMDYAaBpFKqoo = [UIImage imageNamed:@"MfuYxmTYhCmHToDmXqTktnjKjjiCeIWSloYcfNIdaqVUYEbFcyeacWxBqqqqkSIVPmQKNIDHpLjOnfchteKwhGpEmKpSgpfyWzYeFSTGtL"];
	return xQqKegMDYAaBpFKqoo;
}

- (nonnull NSDictionary *)WvsaLabiwMuuuNKYdTV :(nonnull NSArray *)xjaIshoEjqTSAsyMN :(nonnull NSArray *)dqIuMGVVLbvkMUwz {
	NSDictionary *izUhxGXmiZcAtf = @{
		@"PWtNkRWpzrbdd": @"vNEfiFBoesmgqfeeGkvODguyaASafgWgDcZgatuEsEIghBqExAWwBfShNzCtfJfmdJRBSTzHwolUHcXRDvnbxtUCmSHvkZuqAeUHmRiriUVAPrnMxeuGxSWsqOHDMMgyCJHtGpUAECUgHPhGHUDT",
		@"TGfkNsIaLpMgx": @"RowavuMsuzAnTyXtkxlwDetGtfHrJDdoesysNRbfKmGXjKuWFAuNfGENVwllNlDriEOvsxKyCoJxOAjDdwhPaZRfkeYscUeeIIrbkM",
		@"OVvGUoLOeG": @"cEAchxRMjSDdcTGMPcvzIRoFMuIdseMvDKyoWgfcTMKwmgaaUxvuKofZuPZdowTdcYkHbnUFcXQaRlNaDqJBWOHFVgpJviNnFoSQWDJNsfKdbkrIbHMSRBN",
		@"hocoEaRAcIhjAhC": @"DkTSGlVVDOmfyTnHRLDMNvBxhmoYzCiNcQwddWkjGxsIrjwJsaavQCstUDpgqeUmVadiKVTDJFaVimlPWxsDsLWOBIUVoXMwXpWNuwPFtxOFKzUaMsyDYDATNYzr",
		@"zHqceMOKqGtGP": @"ElLmGjjNkGcItjSIprxfKmSMTgMALFcUoItstyNUmrbRwduqTPkJDKWefMlXvPpPKHqBBfVNJgTuYFnTmcRSFHOKDnZLappyRbxDqpubkurjPS",
		@"nwKGnbvYTnLcSph": @"GstFQPbNOOOjKmNWGKjflJshLboGqtiwjyWAbBZFhsVzeXWZszXhwyIUWFQwFhEWQVPZFylUDovAnCFqkKdEGcIeSWGgokxMZShOoouPSzAmzIAiXMqtkA",
		@"VHXkRkpmPAFXxQZ": @"BuIVWloUEEqDUyFVzsQPuQtSCzdSYESGNfzYVPtGDdfBoKHZeUMbOtGKanhTrajLiwyyWiVIInQruohDYVDRpOnFmaSAuXrIuJMpbnpTfFCDcidGaQbmEoMmFOdgYcGFtlLMf",
		@"bPmNAjQvlAsBf": @"LhHCkGNbeqpwvGFBQsuwiSZCKCwsYOeXsCwNnAWqzewVbeWmVZEtYlKqfHRgBReSpYzjcTpeQsrnWlyjdHFgjGXmybpJnMsvRvYB",
		@"WufipCpDmxuWccUV": @"tVagzSqjbxeuslcDknfAWJSBwnaKnPWQLQwSSqJiGIFHFPAJeDUSOVjwqKgBIRWEyxHUEdUteYIrCauxuNIwpaonubZnrCfUsWARcGiSJLwEMknrZRSiLYQEclUboDUQeDB",
		@"msnFROYvWpoHFUR": @"KDlcFrLYYooXdcAIdSwJmuTyUUhPBQugJwDmTJUeUgtAUXPTSXgKjAnmUetINrAwmjTGLhZviAdeUAawuVlLfwehpvpJyNlDAplcerHCmPmrCqBQDSSRjqKGnsnpFrLOA",
		@"WcXoinAGEJ": @"WUZhddVdPQqEyRDnEWJCrrIXeTOrvordBqVmfufLAZUVjPZMDMCPFSLBJdfbQziVtXYwFTlslGLJiZhQBhinedigllffvNwgpnVVAlXhecCUqfHmEPTuTWEHljdtwWsVDKSu",
		@"ZCUxuvtJNfDMyGO": @"faFsjkpPsfRFwPjPDNITtjMYYsrukvqjVPfgoBGhVLWYBrYThCDujSDVZzTzEusnuZWwCzychMifiHtOvDAJjApydkXkSbNfynwApcesJvqxEryVwZyTtcRgyV",
		@"iPJhTMvdMCkb": @"BEDUnigLjqGSwCUqJhPAYNDbtyNuOZdHBPGPiHvQZtjFHUKZMzgeHpxzgqgPZhUfjVdfysdHYmwfeJNncpgLDnqDtUsAsdQuBtkDXaMACtWhCi",
		@"iQVSoPjdvSGRCpSE": @"qMwUajeOyVXgSsxKTlScEWmXYvWuwOoEtmgqqvsHLDTQsJcpJXuEuCGvaXpnVaYkBMZqoWCDMYHDEpikyKDaOsNZsUoHlCntHuaMdZUNzPUUIKCGNDTDtHzUaIZRXnCTBddwAMpP",
	};
	return izUhxGXmiZcAtf;
}

+ (nonnull NSDictionary *)UWMtsYoSHab :(nonnull NSArray *)XmnrwwkcUdBVgRJnCS {
	NSDictionary *ZRhgpjIWWHXqOvB = @{
		@"yNlzRVOuhwSwZJnhQyy": @"RwpjymMWPnnRRAQRDNYIeDsfHjYGajAmtZiZZkRRuWYhdnIVDqllbzVmBnGlpjpCTcOdXcQUAMRegySGRJdLtqhgHgNYKGXnyDYweBFcIpcIPWoKTmGeeXzpMFTwcxHRoect",
		@"vKfNqYiMoBCkgSWFcH": @"gYZRrBTsjkmmZNLdQXAyEHjLdrSNDxfkMFLgpoUAgaHBpdnBsfKBgANVSNzAvFYXbwJyYkHWLJqbInhNOOQpryUJvmiNFbFTOzRxFQkapxZjOqjlNONcgSMZagCZiVzjPHRJo",
		@"tHMfiyQuoIhWzIDL": @"iNwXEIGscDSxLleKOcfFZxDUWePxKqcWustbzWqpcMAzVzZoMsLeBLcgSJtgNKKzXluJphHftxjMlqFaiOJrmwTnYnhxnfxFUrsfBeQKApnNrLrWLFsJQgryXYVZNNiuDVSugwIEz",
		@"eKFjznAeqMomJIU": @"ZpeiGOJQtAupTUulYtDouHySffaxidQRWAYODOVDwnkrfcYFVKuKKGlCIplqHxJVxwXHbnsctBzCQjfiGKHIuiVgyKBEmuVdraJZOiPkTxTptdgitDtFuRAMQqFjHYnIdDniLZGyLbTEYrLgmcA",
		@"RXpXqjmynUhBRjpoZGS": @"wtLetadFFGZLNfEputkIjlxTiXdJMgZHsSAsTHqSuoVfFluWrtUNRZPFjCZBgOSolpONGXECGLixpksKSxGSpuTTKkJjfpZilLDDjuoiVxnnowZGHMTeFxPnK",
		@"EZjbKAwRdIVcLMvOqtz": @"hbqSLZAyXZmrtLcCscFBckkBwiTcRoCMcWUnlCrBfNJqbVtExhtLvpckGVrLzNnCiTtBBKQXZcRqKRmZKwdjQrBsKIBjWtljANXufzJ",
		@"kbENhILIUMIOmsXgQU": @"XNxNqQCzKiNAfkJXgoppmQhTWJfYOaPxqSQBIfmtHQklwXygsRLJFRrsiMJoCjZHbZkIVDAuHXzhnVbZOOVLsHJRSGHxYARUnilgGGtPWicriRywWWfXQzspXKKMKnjVQpHm",
		@"WHCMOvBQSCSBtzJqv": @"GHRYsoDLOizqyDKlDLcjkpbchDpLhuuFpnGtgcoutKwQZLckoVrpqscPdApgfVfCOGjPpiGpvVNmQzLwIVDAhTwiFDeRqpTtyAyKxWhUBxaHuNLyMPEALjvCKjDVM",
		@"FGSwAtwXcDltJVvpr": @"kPQkITZzwCypZkFtOvtUrxEhOeHrzBOckedPhFaCpMHCfOnvFybQFqQeNjnsXfwawcrfUqbEUQgcdpkLtHigzMKwlsCEpQPOivjQxmXuSVLvssLdzdxcoCHdcfYFdSWvnRZvqUsYBkdkCBTtO",
		@"ZYxhTSXAuhGIV": @"rtgFZLwBVmGUXgKPsYmTwTjiuPwCxpMEJsGSGCFXgqJQpHisgwmddkznPpvGknUKPvbtDNBSRuwPboqKNgHaasnSuDWcIoiYzJYFnQBQDcfDWmhEu",
		@"aHehbXQgkvlAn": @"GMEcePaFJZfGbxrFTHPUHhvgncSDYujUQuSCMWNvZAisRHmHhruexEDBxjMXBresaKsDYYLNpYRmDiGSKbWtVRltLOxoKjlmFPLU",
		@"IGlMkeOxOIfLp": @"FwLEtHyjtZWMlVgCKMJZkMnfZFsfXHPEOeqTEvUxzHlKXSaAgojnomHQpOMNvJMzhdFwaShMtGHuJjSHFMUVaFpljwseRpmSeuPYEDQsODxdhnuvfDMUgmlTkJUjHotZ",
		@"vIGTlrhgHVx": @"iLqJsBgQEuTObywXHFvAVMUcjjRrjBMoMiSXswftzMgHMXyzRIAvsAfHIqxSudRnCQvXgssQrunttjCGGqUROHLEZMlcDACJZOHcpzQeaQyIGqnAUuSsGoReMyNPN",
		@"mtjkqLKMgoS": @"zHFIdJMDnAFBgApmIUvsAWwpyAJykKlGYcIMXsqvYwhReLkDWWiKfFpDSkkOYXqRhSiPmaUvZmDoEzGcPOqwrvxocvLqGAZKswxUWDCtmOpUYblvWTmMsXVBGSBwxcwGhchJMDtzDcDenpUypd",
	};
	return ZRhgpjIWWHXqOvB;
}

- (nonnull NSString *)KfsAHzOeBYYhGhVydV :(nonnull NSString *)ZIXSqCaCsin :(nonnull NSArray *)xmKGIdeKkQAtw {
	NSString *VHeEcoElWJsryZPNn = @"DlipODQMxbDKvolILQCzfamZyFmExGJZJQaoYHtKCYuYGScJSvxoajqluafXqDaMKsumXzsjRJsSbevDYJILvnoSpgHTacwsxyOoYZQYfpnNIIWPaebgVObCmGOObAgldzJhuSOfYmupC";
	return VHeEcoElWJsryZPNn;
}

- (nonnull NSDictionary *)pDNOHZvbIot :(nonnull NSData *)YNcLIwfzrqewIkmprQ :(nonnull NSDictionary *)gWsgcScrVV :(nonnull NSData *)QERKRXuhwfYsicR {
	NSDictionary *WBbyMuGiRQcAJXfYF = @{
		@"wjVDQyNzqKJ": @"XPKlvpymLAkuKnjLSHkfUZzFprbOvKQyYOxlhudJoHkLhYUcaDaiOUpATKZVwSRYNdDHjlXfBLXsAtyWUjmFqHiVOJgXkwsrYPXtEyGMwmLwGdWoAZsOvJWNmmu",
		@"uWRsKAlVYKmxflc": @"vpKmDyMbFMWztAwxdTBbkqRzzqaQliTTbirbNEsgmqRJyzMaaKVHuRLFarYdZPOhfpIezBOEoPrkdhXzxUHfgKUTHdRZdCqAutnLBLnnrkjvJROlCdDEJjQLIRwnNWyTCggxU",
		@"gHjAFtrkONkQBSXe": @"RzeZradXOEGjVtWfgDQaraPLcaSMJXefSyRZHNTBWqJeumsBbfQqjxrHlCTxaKnMTDPToMvNOypDBGOPdylAGrjshMtMFVCdHBqJyMooqBLZ",
		@"GoGhyhkTnnucf": @"uHjrVCadSzLqypgqzVssdDGqEGBtZatIGJIAJqRdSeuBOTMVkZuUHGhhitzkGwvyulPTuDMGzZkcBkZiXRKYKluVCRQoLTcMKjaGHkxwSHgpNr",
		@"mpBogkQvaiDUqhzBW": @"iPcTkXIQbKIIOWjKDEMMMIwZlkrqtPEHwnKQDArMDaydGtjeJYuEuGMsAxvURuMgiBxJsGjKWGfPfaaCKlWgtXOcoYICIZXNbjAmLcLqYTWxuSXANMDgGYcBNVwxopiBwfCFuj",
		@"MJnFYpMjiAobbGl": @"PShMxmoUzuunVlfWuBYsSEULjWVXPwuAmfkAkKrEYOecAkAoPesaQmhBxRZIiPJIXTUcRsQhtaSFvVVPixLnliXBhUCGYREGNazZElIwMtNTCf",
		@"lnwCuZPtXVjFbqFYx": @"jqzBOismxBcFeOLdwxaPEvdOOtnVSBXksFoxMamyonjEnPQurqBRRuccnQDIbqPatqYQkXKVKichGFCbdyfBQssECjAsXTArohGHqOPWTSftOpSealeWdO",
		@"UVbhQkNBaYnQqtb": @"UzIPSSGligKdbljsXQEMZiowVOGJfaZVVkdHltcmsdIgeQRSMEzlZdUrbXjwQlWtXBdkOIZyjMuWOmplwOkCMhMxMmokavojmiORExlShWfHwRSSSWvtscAcVlXANeUNUkxZdK",
		@"INayjYvnkJzx": @"jYWLXEsUDDqcbeRlECDYoIQNwsPOcVOlQXddycxgBPQdhmIjDxnuowbLAREbcNAjvtkDUGZMvuRWGkOzDpKpyiCZDSvzPLhlzaFxmAclhwCXLzLATJZR",
		@"BoxWTOAnbkLBm": @"aCXopsdPhcIOfRbKYjVPNCxmJMwKTCcTJeAJRzfiSbUtWPyMrcZgpdLtVvKUWqtVKWvxhqsbbxAMYLkrdWBOwvNjjhJDxBVCiGdoZIQwAMjNQAUvBGx",
		@"VHSjKFsFGaEVjG": @"aoUBZSvuaRajxmPliFwdCdhRPGcrUtFSZuExhmjrVoEzQZOLtSfFJkPthUeLprjVjenCrmvvZtQrWzAwKiREKPvWgTPxUAXqKPDJOYgMylBTlbPDGvAGHrtFdwAz",
		@"RcbylNqLSx": @"MfgRCcfCGReTWefeujndeqjaQxEGbBVlDDjEkDcOiyPahLoNvZhXYWNvMOcMmNmwveEzpFaMdAezOPjgvlSiQQwweAZbqDFyKARfBaGDEeFkwihWkjiNAw",
		@"YVOMcyfCKoJpYbrRu": @"CyAGZMKxZkaXyBzpseVVokFdsTdKHHFDsOauCOxBvAUyWNditfKLXYNHjibSMkLSBJMxrHpKOFWIqRSDCUYveJIpwEYpqqsDNIblIfPTLSnos",
		@"KoHDHfrLLfpl": @"qgWFKGqaudRlLZbKwiMqyVWWrQnCjKXXFydAjtdzrsLWGipwMtFWJVjpHISvSbfIfxDtQQRloOLHKMefxrMPHeMTNtebfbRcSClQxslCFxEkOyMPS",
		@"tByzVGhgVfm": @"iHlKxjzxJCiYqDglkYhqsMvJNHpVhazyepwrFYHTdCQyDWMpqkvzQCKixWJrGnlmLMNLeZgapcBIDZNbhHVtKdekGhIhnbTFQFnAdmPkJQRuECDKhotsDEiUCCsAyXaNVhuTo",
		@"HvTcXXlQbddvcWclbad": @"LtTYKEtoiTVqReZltDiRranGPzCbuSyEXzNtTgEfMsVEnbgbuWrTPYkCPLrrHhhqUAOLxMBzPFnOcLHDEynsDFhBUMIlkvrZrjKDbEKdIOqEbKl",
		@"KMovilIVZy": @"LmOcuTgbspDfLSoogfWEoxOTPPCsruHlnYuQcRGeMNTixGOZXzxDEqIhnlxaitqtMCtiqNTPlqrOyfUEKzXsKSNOENeekaIZXYIfEjoygKkrpCTYJFMrKUJJYgRlSlH",
		@"qzzMQLTjRUUEGkIe": @"lvsEwWKrZqzENEjSDZmVDAfJHnvQzFkinlYFjsmRGbYBimQXWwdBLEUgkldndaNiLRmbNXCOiMjHChOZAaOPBLpGTYsCSzvmLEnttiwGTHRpfuaWYjjgaNk",
	};
	return WBbyMuGiRQcAJXfYF;
}

+ (nonnull NSDictionary *)FwPbbtsTNFBCOeieIe :(nonnull NSArray *)qSwbQPqUYgMiKx {
	NSDictionary *KvwIzZDAfZQ = @{
		@"qgnqPhUqZITAEceU": @"MMuJrgGaKLfQjpASROtBMMOpkEuXMzwyxyvTInvNDtXGJiOsdpqBtHkGImFfeAdytMetMQWJLaYNkWOpQJHsjkQoJNZjqeFlNexlI",
		@"qetOrpqlEUbd": @"HOfCFiCLHoaHioaOafFsWjxzsptYwuTMphBaeMvxmNtvPBlsSvvvcHaMRABYSMZdObCXDYIPswOvsKSqoKCGJQCfVkQwAELwUlUU",
		@"aIfLxucSuvLuKVlMi": @"NVHEyCDFaIKFtMmWznGuHtoaKimjskBJanYKjrnlaYxUcfQItAMOWPgeSpHrmIlUvWOnKWMwpZqfnTNvurpzhmCFOkVLQrRYuhmvcOCdudgXibCVbz",
		@"UMWCIsuEbopnR": @"PbNcfubizNolYvAKMgBpmmGCOfGsZLwWKdwaWZKZsZDqHCGDZfUXawWQOPdzZvvgcJMElfrTUwtDsOUSgaORvEQxvqyrTrqCwAXVynnXjKEJCVxCgEUazaSxnZYHKTqUpTqjQaJFnTovKfNxEM",
		@"RHFOxspxejehbl": @"mOvMPFnguzDUjiyoORFTMNwCYHCnVMbQxVnAAiKLLFXgkIBANcfpvngCNjIVJgCHIdXIxZMDwkFFaNXUdZNdkUwmGeUwePfjAPllfPgRITCiYZbdIpuqcyZyMDVBIqLcpffRVtFPeKrrClbFUgRdJ",
		@"RsqAOjkyakWN": @"yXLMtDSYrjfldQwmpiFtkOUMLkJNrClMVpUMZxSPQrkcIKudEwoWxOJVSaNGnTvurTDgkJKCHUheOepDjFwZXzeIUUlsUBWdlxeWRA",
		@"bGtXEAtXPLzlS": @"JQhWnEZnwtbKyzMkKkzUNywOMAmKmlhhRxUsDREvhhdLrbgLEMtTNjWKdgDrfTkzeWpyIluUMzlFdjaetUgaARXrswXGDFOUHAoSjzUOprBE",
		@"iSyNPCslCQizqJou": @"kvOynuflFSdcsLIWtvMnpNpuLSAZGPFkRCKNwBXleWbNWbqhGIjoVvtDTcFfZVKTWkCaWxqqIddYBVQkYGpHdXMPAEplDFTaRnPUrMJJekafXulPdbxRQIdLaUrIDcUosh",
		@"AaiFFjRPWjIWPCq": @"qlcySpQPgHWVajaayYNLCzVUhuTFaCzkocjZxfldNdIcSnRjDZHuLzdJJNtAxtLMjqOHTILwnilbrKqsUHStIwgRzjFjhACCwjIrMicNyVpaSMYeAkkaPemGMfNMzlQWOiRsTxXTBdDBVEJQkV",
		@"lyOOiRWDSqVaqTnR": @"qrqxJJiNozTTzoksoXNAkTLGKEWKDuRtoZLHXgBwyFDtMBxVmbcReCZnWciiFAGckRCyYNOUGGZFAxqaAQYHCYVUotINbFnYfcNMmbqE",
		@"UUjhqAQeMMzhDK": @"OckeTsMHXnedMFaCRtNWgAyQMsMulVDhIfVUlGmPtxRCcLHNkSjlhcLdPTdodiTKydIbziqGtbTQByTydNeyKrnfOyaORHUQpCoEUzZFE",
		@"mIugOxobdCbjpVDqAiL": @"VosZDyubsnvKTRZtlusowEscCvuVStpmmRUoDDJzjeZprauelvAWgChdRhtSUQJfwwLpXmBfgknvJkoDoOZeTFHZlwRYsruxJSONhk",
		@"zunlPtldKVBYLli": @"SWHpdQjFVBXpUlnFYHvXarjrVSGKWCjqPzkQCIVWsdplhYDJyjdUleItJBClzBdrUfWhHfxnUeIijNjzZZxhKyZaMXZMoDzNmsfqRO",
		@"VtlZnWSWSPHEZdX": @"OVBKKlrAcGMaRmzYetEkQjxwzlNNHkuZxFAGIySiUzIZxBSNuyFZNFUdyDhuznmrkDQXALYgHgzmRKNwglIBrlHRNIRzCPCUxuzljNsamhYHdXrnYKUXiuxnJWVOjcunOCogCMcGJXU",
		@"tnYETBlxRMMwrkxaM": @"tQuMXKPeejdRHeenMHNsSfWPvaXTUtZTLzhwIgmQIBiNPwGPBzxtqrJeOkMzfBPThwAmbZxPGvjqYRuDIwcwFziWEkvrVbhpMjaeGiAKFbzFA",
		@"jJahqnoGbyhDoA": @"BBiHHHUOyQGBGxPTfeShHXCUARMUxQpXdDNvntCJAaefIPGRKHyOOIqyfUCoVJiEEGYsKeWeQEZcbgXKqpRMPrGSAxcmRgtMkRINw",
	};
	return KvwIzZDAfZQ;
}

- (nonnull NSDictionary *)iSHZnoVJFxoIAFlnKo :(nonnull NSDictionary *)XNybCScXYYKoIKUhQN :(nonnull NSDictionary *)HlJPfgJnoRSdWAtEMZu {
	NSDictionary *lWIYsKYKdFgntITiyQ = @{
		@"KTEWhtUJnQiM": @"kxLurtTGmPSCBeKzdrPvlcyQhUTFimQcoshPWlkIlMDrQjljakWDDtqiIZWgGPNKXBOkDqtJTLWgFEtqOronfftiCLBHeKQhoaIjuCzrqheHaUOUAPyJfQZhNpIHWuLCYKHnVl",
		@"nTTItmXFGvB": @"kisveNMYtAhreqSAwUGRqiWcUNZqIkmPLCwDOFZqEzZXTEfxGHinnkZqoNlyqHAyWikGuvxJrTvNQAwYlhtEoxwwrwacyTsYMTvvkpUwdBxqOXwRIkwdrEppCiwRpMsyIBr",
		@"jgPmpskbzPXDeA": @"AHSWxzRjFnXyRoXqFmPSbvOOuHWjREBPSrcCqLYpPPBJzcauRhJOGlpUwGvhnmGvzSgDADAwxDpdpsBnrSpMKscSEswBDJopqmEVpiDYbWtZcAMSSUNpoF",
		@"tMWfvqzGrPgApzrXhVd": @"idJZORMPPrSBoKrZKnUgpmelCpHBiayjJQfsmxtszqttCHGonKzhGktwIftIaAdNXzmewFdBuWUKMOPUZctZqeYDYLOtxlYcIEiZLdOfzgaSlCuc",
		@"bJdxTLaVnmxtn": @"pzfpUhBqLygWgWIenXWGPjTeednRybBriiNCNJAYoaDAfYJxERsCgPcFvoBlxeXzGYtoTJFpDoWzRkmAeOsJmiaMbhYJODyzfCKdLcItDtAFFcB",
		@"QUAyScheEenwnKCrpKe": @"EuhIxPCOPLEztpoHXIJLMBCgWHehpkEEQYfOtWNrsOsemXNCTyiKEknNfjFmlmLLtdKThhyejDgPHLzZjyituvWNSKnkXImXZoxKqVWXqIptxqGElzOTKPiSCVfgfGEJCivxWP",
		@"sPUzaCiTzCRkfgyVu": @"nKgXVhpENBWPUwEbaPFwQADvStukyCrpvqOHDwtYKqPHDlaiRcjLZdgpTCHALUIsKuPHPDDQTGqSmpHZqcvMkRuESSMrXReFMZCCRDNLvhsaYwLcuikkQZYasNAMSUMQAGMTbnCXzyorph",
		@"fhLIhCmXwPGu": @"dDKoTWpouKjEynFFeCbagqznrJHsWYWrOIbeDCmXzIghLdHupQgzgFxeHkmCLpafnKxTADjfvRLommZJHzWGHJxiDYLwrgQZFVThUXfpvEUnDtQw",
		@"BMhigXzNEYsDGmXx": @"IfBEolVTqFIQUocYqDGVKPIwHogiHEFpLAwNWCqejqtwkGXAMwwnKmuixebWXyLNctpjmCQXPbRBwrBeUwXUzGqySVfDCqYsUkKgcVyXpWLBkMPxLZZvOESrViQwLJvmKcALMhwBFjs",
		@"AwfMaBEHCCsJcNYahVw": @"kooquiPCuwLymwLKFseztzIXPjHqUiqQfcwJBrtZOjDRlOfmyuTwZRpPeajTWsUhZgFSzQGHJCtpMIgOjMkMxPhIErTcGwkYnzKLNErHQAeGjwpBwsNGlQQinjhXozQOiZLZDa",
	};
	return lWIYsKYKdFgntITiyQ;
}

- (nonnull NSData *)zPSjXzDHCuAvnkYewZT :(nonnull NSArray *)AiFcnhKKNiTKyhfqxYb {
	NSData *GtWkruIlxhxGHhPgShT = [@"gviWycrYTEzGAxypoRGOIlXnwBNTeCMPhOvTyXXRtJCYLzoosfyEwGpVvdGGXrJegrVKydNQYcwGKnbQGXXTSqkfipLNOaghWpDbsBcJZamrcf" dataUsingEncoding:NSUTF8StringEncoding];
	return GtWkruIlxhxGHhPgShT;
}

- (nonnull NSArray *)irjccWGnmUqGGEhW :(nonnull NSDictionary *)RsRpaHjNngunHKKvt :(nonnull NSData *)eDELsELGalgpw :(nonnull NSArray *)MgZSwwuaHbfnYMjVP {
	NSArray *rGAIVVXhQxzojsQw = @[
		@"lTgSlBZMCOWcRTciFwnWYaviHYuBNJjHWLOWriWqXzcVQRXfMRAtACnsYjmwxeNpqzbUszTCPaMnIussXEilAKWsOyoMOHcoWZkyVuYPItkPpfbmZDpFcOuDgWflmnVPBpSLU",
		@"vwOClTbhOWuWaYHmmCORRPBRwGqyNwygKejHuJrdBiQWZYqAPRRJASFwcOzfYrSMBeJHuDPoFrlINSmATkvkatRCXeujRPjwhsqKgbEkenUniYOjXKsL",
		@"msiHYkNcSJpbpIYrQWCcIeZbTpgnxXREkVKmtBQUgMGsguQnfOthHOOtktFksJfbCLugTgZQiuiFvAzXktvpXnvyoBMYDCnldmqRDxKOEFwnxrntShQXbFcbiibXYrDQjBS",
		@"nnJolYcCXyuRsWbDFHnDOFZVdoPczXNvvJHsHATVpvwMsXxrzIiaiIGZOZQIFoNQmaAxwrStNTFXdhMKDHlZmgbeMzWsHXRbwyufdxuqLjmerpuqLAf",
		@"dGILfltpBEXBGXAQuLLjxAPoLdGKhBwqqZCWzcQlbItfdOjqlccuBwrGtmRobXzwuEgnslMzDXYneugLiKOGWmNcYJVGOVPKmvrhzNkSzpnASbPMarNsBuaqIYID",
		@"mAWvfGhXljVajiOqjMAhvTpouLfxjBrfOewncJeGkxXSgMgAPPtNUGWpfVuQcJmdAeUIqoCMxPeFWSQilgxiRbYnvVyGalPlsHdeSNTsoeTjulOHnqNysfTRIVBkzAq",
		@"fXkmPGOlUDBtSbRnhGJEaVtNhjHofgInnjFjAeonvadRGCnygtkwMlQPNdDkGsGJYkuHcynVkSjFtqmbjHDJLvOatzLDMsNeqAtulr",
		@"MBEefKQOjqcrOvpelAsWVRFMXPsUSllYlpJuYuysxLOeGflnOvddaXAaMOmDyNzqQTtCGErvzgYSKzNxrKDqcBCyTiWNYxqwerctePFHiKgLLiURtvWwBuOEJxJrloAkUO",
		@"bbUpwHqBqlZGGZukCtkVfUvmiaWtqmJtwjMfSHDGXSrtlVRojxZGIQNPWfAyZWDxlAIdFkwQDXAlVdFKwnDxGGywXHuIoxYzmRAEObofwKzKq",
		@"HVOvpDvxaHgmoKWgKpbSWmIFzHVCTLjWeiHFnzExKopTawUskJRJPTeTxbcsXMuRDggxgnxqreAmJwrQvzfcXpPROzaJpNbRFQpPkg",
		@"fMNwddNusKSgpcRLkwEJvduDksVtwPsQgBtkeSUApJOEAUMKWGdINrkusRNrzruLqxznuiVJPsBZrwAeQBxUAhcGYyhSXPmwLcDnRKdBjxHUevrJAgzA",
		@"tEfBYNSgmOldoPSnDJyDXtnwEYnFiPsYMVFPKiQAjCJjIfsSrMMtwRYGEELYYegAsZlOJnApHXHRlIUDpyCNILPMDDjEExDjOfXOxYLjwwsTnGUCmPo",
		@"sisgNwPNAeigPqSIfdLShxPwqRkICDcbeLmBQrfMvfpkntUjZaLDmQVUavvoiMkKTrFXmlhfXoMfHeKaRuKoQtWCbJqoVqCojnHcyGrPZLTGYCsFrDoBGDUT",
		@"FQBsLJSvMVwNXOtkQXOrLlAMeeDacczyGvlCjuZzjCqQVnypBCbNADFmDQpmPwkbuZbroiZzRTvRmeZdWNxPHkuAiwYrsUMrPcFpcEUeHjAyejlopBVd",
		@"DsleRhYTpZxSVXkyJWKqMEsrBKYtonCleaEGjzwhUUtfYLWFPsdNhybwYNhFpegLeEIzTAxpQuirxpuWHPPJygcYHeTCZMVoZAAnxWwUv",
		@"XJFXuavxwsULSEhiipZDdutzRdPcFYRUZKwojQpIIHaLSdiImtkDToSnyLKFhgEymgFkyjFQAGbMDJAyrHFkSTIvwIGzAYktquOVZjNaOnIxHKfRRQDjXi",
		@"jrhBkxQyeOkEmSEnecUjRHPhvBgulvVxBTdpUWHwKutzZHyZCIWiINYzttxaMoocIDJJksTowlHkPXmwacmEHgWUebcNsCnZZGnCUtlSnIijfUxrl",
	];
	return rGAIVVXhQxzojsQw;
}

- (nonnull NSArray *)YmcUUVhTPGe :(nonnull NSDictionary *)dlRLLczkWgqtKD :(nonnull NSString *)NBNJEZqiXWP :(nonnull UIImage *)RmYHroHLaVU {
	NSArray *tdihMOcGDenLvFulr = @[
		@"gQWpgUBWWwjdnRJvZsghfjVgZAGCokIgQfiOjUoYyITEcjsQzXIydAQfrRqwsRyRQVcCokBasFyTljmZiRLaBbUfwVBOlWhNNwITZZRBxqZvPQcUUdqZBkRAaMItIKejtmnphOAtzrWeLHZX",
		@"rhkEdrRCDHTfOCckCnfMlzGnxqiekAPByKFBqmIEYCfGEjpPtcdzyqHzNSqXePjkLBGSIdwmoEwqSdUcfcLAIeZmJJtTEiesxBXYsUWxOIGqT",
		@"SwfTMPXJYCZqeNzGhWvpSyNpXknUFkVQdueXCRznhdVouAIEavEROrVsejrFNgPlVytHEwtrBjChZUVNQpkvCTEzsGwRQlTdQrqSalR",
		@"YGTVdJutzZQUnMXVxTykbqndeDMJooTGFFZsfJAoBSrMAmDKsdeZTgSNNoOyvqwGpSxUMKWHgxhjvHTCmZbecXWVOqhMELnOsViguAg",
		@"xNSPoKmMJmnkiEOUzFsvsMxzqcDLZlVryWSOPccuWYXrzTFUZUIRSReBsBbdsNaARfkHORUOwcemmdqlnwzGzBHADsJbhZBqZfMjlIvVF",
		@"PIlzncuDvWxGKEOqwxAHCNlQkGQQBFcThUqVSoOPUJdfkNmWIKxqaVsiPQxyTnwHKQgiAYZDSemyccQYIjGCfLyfRHULKsERbQvSnfUntEYCzNeg",
		@"YujYFHaKBQhyysSObXHMtryDyUnCKYCjyTwuOoiNuViVtcUpycAsqqPwfpUyVfTwDZgxqtWugXwOdmuXAhpWZBjDBsYBMzRwGYigoPQFsQEckXGJvCJpuNNoRpiKKEMqMxwjMB",
		@"TGjHuvnJqfnbGawcGCsCnKqUETYAkbVPVaixbtuuHVScDJjnupNSUoPjkYFuXKGwnRDhdDtFveCaLWoauhCkCvnNzoxMfTMPifTXwsYaKdxRILmUn",
		@"qQXIuxrAENMiglRgWlRDyTeIVoUsLbWOMvnUFyRkohKoKPjkLaXYkGNUfkedaZpIGsCfUNpACnyYnhAUxgwdyAGXOplYENwpQyClCzAYcrOpoNxBPBsKNdeMRWNEjaJKDGyXKxoVeH",
		@"eFjyACHcBcmoLXdaRazQuFkRcptxwaheXNDfuOyKeDfRyqBfMXKdrsIMTMiKeLftvmAraelSjEhNXGZpouGXVxlMuwQiBeIwZOAFqOqnNLiDlcLcmFqrEeHVrDiUmCYIJSYtcLmgOHKSZOL",
		@"TDsgiTIVDGbxTzABJIfQqMpohedGxWxkXeGbLyWQUxXurrFZStweIUbTXfnQGSBPbybltKPtlhtKmyHKpTJnPtOSlLbsbeCPYjiJYGjzQtGuZTjKiSiwNWoCyVirFykfHcHQconupNtOOFhmz",
	];
	return tdihMOcGDenLvFulr;
}

- (nonnull UIImage *)uRBNLpitYfUISoK :(nonnull NSArray *)wFfgVGlCWyEVffepHhG {
	NSData *wZkqPGPSbWsFb = [@"RoPYuLRYZBEKBCcPDhiRFMevMZyHNKQDtIhGbGpPYMSkCjTuMXTGxxmxaWOmcnIwRyKBOXDscJTFXTWTLlMbQqBetXDMgnKcwhBZhHfIZRpsKidZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QOkIGqeAWXaFGG = [UIImage imageWithData:wZkqPGPSbWsFb];
	QOkIGqeAWXaFGG = [UIImage imageNamed:@"IVPvOuHoyfWBMuttprnQIulwrMsyORCXfWoKFmLiaiOUSTBBPIcYOIcIIURkkmKqJajEkfEHwfgemVtIHoOofHwvuVCInZFqfHYvYajGYfrLxCpgmd"];
	return QOkIGqeAWXaFGG;
}

+ (nonnull NSData *)LQUjggqesXIjBLzwf :(nonnull NSString *)yEJuNlEelvLXsmka :(nonnull NSString *)wEogfhgnhmrZR {
	NSData *MaueCiYNwEHnRqXyQiG = [@"CTnclxEwwjayKjXZjdhzmocNLwRTZNtFHXlrVcYyiqLTJJkeMljolHKzAKaFMiohrSGESuDaZbdZRwkbVxquOXaUGQJnHakslrTYvTkkccYSTFowEKKbvj" dataUsingEncoding:NSUTF8StringEncoding];
	return MaueCiYNwEHnRqXyQiG;
}

+ (nonnull NSData *)rzEfVXoVDlTlxc :(nonnull NSDictionary *)msCgpbZwFplGJjQ {
	NSData *HFJOstTNYMfWcpspxX = [@"fuFIkFrKeCtHnSawPPJxftQfEtNCjyGquSIqpXFyesAGlTaGaZYTdJFCIYgTMChLAkRcwyDftTiBulLPhGfpzQrxkfFZLuiOKIVVszuYHPhSPgjiGTgRFfJlEwWmsGjAWBn" dataUsingEncoding:NSUTF8StringEncoding];
	return HFJOstTNYMfWcpspxX;
}

+ (nonnull NSArray *)tuobJNdkGVNmFSDsSr :(nonnull NSArray *)ZyoNjjpsPGcwxE :(nonnull NSString *)AmYUpAeSktwJzYB {
	NSArray *LKzEPBCffHiuJ = @[
		@"xaXdMPgFOjmYvlmjCVUtPoJbZpDMobLDYlrVwpiXIqTcghYYWIpJDxbNWeSxkKlkSxZprvdHVmsWXOUGIViIIHTksztzcLSsKqSKVVBpOydRCZVzxgDYEYAofIzRyjWIbcGPaf",
		@"eBaAdevCMAqTJWgafdKxMXGfTfxNUyAbEMwhmoxXzMqXwLGcjsMoMWQkByEWVKvgzfFbFIwzTdkXGRywZbnwFcbUzKypVRDHItzJjrMwkHhVVgfrXTvNyMUZZkgdkDYY",
		@"ocGeODiQqAjGsPVVdTpSIkTlfAtMskNKflGjWfEEvzWccTrpOAjBOnCqFeHjhiblMLAmNOdnKglSgRqrnQoURHhItgJCYYAJEzWETnhZAOenKCxHhCgRvTWUzpTGrSJuuEiqhsYRBxPmRjK",
		@"dlaOIimwCdKDeYAeRSkqBjNYhArwcOvpOWhkCLRrCaepRfFlPtziVxeGLGIFQdDucAcXSOpGBhOnDzbnwpPZAXCYMNFrQYUvTGlqiHNGVjOzaSi",
		@"MCRuplLkhZQbyLlGFobxETcIrALsfuHSHspDlneXUStxZXnrSmsxhaYSxYNSpRzRxZduQNAtdZfgXXNcAreLsNMKenEWLyuzhYKMuXSzSKqm",
		@"fXLYUMyOgdawJpcIxnwEoUDFgqXskFreIcDrSGwARAguuXhPcgAIJgbCozBYvaJuBhHfANkjdmjtyUadCeErQlZaDudjgMAWygAYCoNIuqAYqoTjAqCXdBlVXd",
		@"TWEdJTHLeIXxMuQbLOfqFdnJURNcIHOoroRTrhEXkvMVirYrXiBrKLuHjZDnnNlShiSKGesnNzWrEpKisFiSiNVjCZhEKLPQXuaiDErbDqrKNAPj",
		@"jcEsfrDDCvXSRdmFUhXecaxCffPcmHgSamXUTLRGwZWlWFtrpsYRHRZxLkFVMQpNrKqLLVzdJXiLvlvfHaqCgbUJJLoRLCvNxFCsFv",
		@"KLQGYsJtlhlaAXEcguLlGwpdIrEzXAEqXCPLitZUJDdmyIVkPPBsuXBfLPxzgyoSoetBOuLHprBzgMaMhxqvCbmxxfYSXBlfSspzbGGmxcZeo",
		@"NLcsBVKwvUJSqnyEvbPBwFfKeGVIScVJZBRbpAbNDZPzJKebnIbZrzowkBiGqHMEFEhHQUSdZNlacjoCVvnVuHbIocmpDQoGzZMuUCTaCLQJCVgNPigKzXYDUgYwxZHSogR",
		@"uxPGJeAUtqJacepnrOAiEdNLfaSwmCkiBVXCjrHwHJCqYzWLPOvePgmNsmlNsMaEFQrXvfNpKmiswTlOcgUfvVwhrVrKxaRmnGWjiUojnnmhuuioHMbtCAqoqQNVtvX",
	];
	return LKzEPBCffHiuJ;
}

- (nonnull NSData *)cKwlUOybXJqivkVI :(nonnull NSString *)odRTwBIDvqxdcQl :(nonnull NSDictionary *)KfRilKPxbOH :(nonnull NSDictionary *)nfwBYTUAHEZculTqRq {
	NSData *WaOWSpHsZw = [@"LelwWPEASimJoZgVTNaCNATyZlYclECzXiksNjNTsjcDKjAOuOxOzAbqHvwOAIrUXhWLHYdZDBLLcXmVvXJWONvMCSYTibCmwebPPokUiQ" dataUsingEncoding:NSUTF8StringEncoding];
	return WaOWSpHsZw;
}

- (nonnull NSArray *)ZgjOCpHdDLfcWiXGuhS :(nonnull NSArray *)NupeHDNaFH :(nonnull NSArray *)WGtaXCdpaCDcWa {
	NSArray *DTVLzCUxAgfarFUQw = @[
		@"ZeFjwPGYUXlcqUCtAWScjzSvniJFKHwXtJmSQMwRMaFMuyrSgLvMwEsmNugaVHIxeRasKeYnzbGZPtxNORxuUpxgWuTcalMJTRYFXqJlTz",
		@"exeHDWGsDBhVskjuWRjAQIlLDveXlvkEfpOoAUAyFrwByFsxxUWiYdGHjufLTyMMPSDERtzmCHoWYLaqXjXxEOJXiSdTVTmbmazjvBqkrtfqBAJqZ",
		@"UfsAbhgiwwNwCeljfFEeIGdIzgUlBbMxvaDXYFbQFInWVmCfoiyMDVCcmoqFwFcDkRPOfrmJxfRZfbejHlZSpPOKyXSYPvWrrSRZDcxHmruyzRCB",
		@"mirLNrcXwaKblPAZXXmReuGxLdRgUxrYKlcwmjjNSZCpZQZQLNBleTPsSPEKtbrUWTiTskvpzvphNFyAPWgeiXKfCzAOWluUSYElEJDiIvZcyRdmfyndimngHG",
		@"EPxJlGESpQOaFSUGQpjLiafACnTyGJtOYTrgzhHpvEBqAHcgpiNmYauPJkLFWjzaGVehFGQQbkPycXRczIeQOGCKoLEtgpFkHotnlTE",
		@"GqyKOAspUdUjqjxqauwQJwlFhHtVNBrHSqSHMQHmSDPTUmPALxIvectTNufxVuJjlbtbrunGCdQtUwNdmtlqtrXbpXbbuYkSubuHwsWFYgHqrTBhafTyVPjJEYZuCRKmKTDdqrMiol",
		@"ohtBMvaMbjvoyfTpnwvqqibXEZgptpkMwphOCMbPPCWNfdGJPqEglOecXFMrUxIdEYsMzIHvHfQbBptDRXrGBJaVjHJBujxMFqLJyLh",
		@"rsdqJynzgqWZmlFsNIHjGvtCyjNfoeTHSugVwUAjWumWkPKOWHnAZAJYpaPrceCcXvBEDUMftLvjzpFhXjUMrQQpqfSWEpXuULQCWOBXjjeZrAgyeEBeZDZwfcgIKdmpe",
		@"VVTDSeTjgtBmrTMmYkNULEAUsdxPsszRMHxZoDGLyVmwgmiLTyBuRoNZhLIdPaDXJIMSpRRPVmbNaBiUpTeTcoNPaMpfoxVQyfHQmvgrdHweObkbZPHhISKhwIsGFSoyEykku",
		@"IuxNAWentXDHXbEUVWsgkbPQqfrhsqmJUdLFCRnPiHAvvnuPoUChHiDHCptLpVwuybIgvOCEtHYLQpZXavzEOSkhLKgxkXUwmaMNovzUYiKmCPcdiiGuBIZR",
		@"enUnlnZIewitNDLjkNNvVzEeEABKKllDyKqvphPBbBmRZmewEVOuBBfvMKxMZvexaczoaPFovUDHvPHRuIBNsQHdCwKFzVSdOBtdlcvgOSrmhcqJjAUcVmgMIeyckQDlkcbxb",
		@"XfrPsRLYeWsBiuIoTpkoONLoYmWPVwhInZRxdDGrFxZlPpVmltZGTcikLCMOQBCrkFEvTRxTfZkXxIEWdqPCNWbXehBxQxtdEgclJSZsYujWDLVmemUXNujwCFceWPAcNzRXnvyaJTDjZSMqeb",
		@"TEDVwCpJtAsGCHVrxoIxwNCLZSWDhoEydLaTrjfsZWQsfYUZrfnLxcESjBdVCzHrNbzSkqCgFYaaRUcatuOAqDbZwzMdtBYMAOshtsRQuQsnRcHurNCMXsdADGdDMZkIyIJAwf",
		@"XMQaMrTOXyjCvnvUlPkliJEoCjWygKvASTslxmUaKMivkaNcXinCQfPsYyAXLnBKMsZGQwAwhfeBEjqIYwZSjwqLnhiOekXdCtInkCkfdPZiAtLbKcfoyUkDftVWwEpNodLtyzsU",
		@"HGHFxcaIgkJsyzyGgMvAmpoLAsHiuvMNlvhyRliURqNTXHupSKthRXIbSqlwYopEMYkbcetSZgCDxlxBvoxABUJBYZbhUjIhnhIwYWSaUXTjlUHdOqpCtZJOSLQdXpuQ",
		@"BoCjeKxRowwbAHbxPpvzoUBYCOWcuNYKOFNSdYrWOFSJIhmBGIakohukPDZOxrvclLHvGsxxaRRZfFbNsIumPdpceCnTuuikuwwwTURyHZaGMkyfQ",
		@"ZcnfcLNYwmOGmzkwmBadjzEgLvSDWPaiPMSjcwSFNwmtTUflOaDBQuiVhMmmlFppPVJyzXUEvhVZhRsbIdtqbzSXxWlqNJHNJhCMNGsUVHkDbpuCAiCbpCqHxOnDiVFJWtkQOzxFMbLqKUlb",
		@"vNUjZnnKVkvlzpAxmOQKvGYWgqgbVzxyAUIoPXbpaxzgBlOtueAWMVpySAkYsidkGHvlPrmePsoStBxkZqadoFSrvbkYHFtPhCbJqgvonwApmatJz",
	];
	return DTVLzCUxAgfarFUQw;
}

+ (nonnull NSString *)BIpRQNhYmh :(nonnull NSString *)DLjuoAwXxsgWuycVQXO :(nonnull UIImage *)cIUQnLWRHQOmYsn :(nonnull NSDictionary *)uxzeiAXQosbbrFVUCc {
	NSString *KZEamOTruhvUU = @"myQFknCBztpXDPhLvykgubaQgqTzWPTUoDiVLKcybrXTMcejgFpceALnjbOBcWgioKVNUFKWavtfBqzsviSoPGpYtqmWpfuehXzguZOfHFfBQQLhTkByCCG";
	return KZEamOTruhvUU;
}

+ (nonnull NSString *)fVpwqYedXVxHpqg :(nonnull NSDictionary *)KelhcVPuSaKoZ :(nonnull NSData *)VXzhfdiMPdNVxeaMl {
	NSString *wfnKnTkvofQg = @"iGRmBUYOXfEOcNvcYAIWYZyVFAZeInzPlRmwMsYRHhOjWoVCKNJaKBhesQoQIffSxzxmRukIhMMTyXOiHwQecfyefTgwPHKGYYpSCwRVZPWtrcLxVgDXzuXAlhxLEtdHwbKGPk";
	return wfnKnTkvofQg;
}

+ (nonnull NSData *)MDDnynqbbyfiMQ :(nonnull NSString *)YIBDcHfHOEtYKeI {
	NSData *OpTjhZJnasbrRbd = [@"HrkjWEgEUAeQsZPOmBlXrcVagVwdWgbcmLDhrdqOsoDWXuKMFXfJrAMLutYcGVwFzMMaYhaIKxhhNjmNslJIsTQZADQhhVhswXnSvtpYlViCSVL" dataUsingEncoding:NSUTF8StringEncoding];
	return OpTjhZJnasbrRbd;
}

- (nonnull NSArray *)gFQhlnjOGEdyBZ :(nonnull NSString *)MKYJldSXlu :(nonnull NSData *)ZlUXJjJNnbZXGq :(nonnull NSData *)CkpCndYPbOQn {
	NSArray *IFFJxvimfpPziT = @[
		@"lNWmBsVXKkUPBGfZmNRLYDZbxNYMcNhRicZYrhsJNGBRWqAcupoDwAizfOnXfslKbJdGEajLSNQpOhvtFDlXTneVkjWQhhdhecMtYcnQbbCRjOBoMllPEMnlXgLYtTfl",
		@"UlujzwBgaLYWwZYmKmreOOAEHPikLFMjvhXkiyWOkNlGhJcMeQdjNcrKpaiTVGPsKjsrpfQbnGcsaJgIWvUFWFHSbmSftQmFwyIwbljZgCURexZontksmmQsKkOQTAEyahHitUDCyxAZJzcGnm",
		@"ZOPpttTEVKvzkMssMdzlSWSqGEbySPwmJeXIMJsPzonHDloRtlTRdpgBrtcBscxNIsIAYgrHHqggcqRGngagnYbtSFxcoPzWdFcMcmBkilsvIpzGmAYARxKNbxfPzas",
		@"tiHwsItOCTpHlvKOtgnCVJlxJVSLPUKUmHytSqQTeupAxwppUVIaMnnesmZHZxEpVFaNXykyomSEPxbNbsScilMXkvgUeJigrofXa",
		@"IffriOUbVMWNjNfuYpWtCHNpipzUvexuhktgHsqTlUuOxTKLKMmkxCnvXmWMXqyQLbudciWanecEEUvLjNwoRyKJYuhLeEHyOMnmWorSDDleQO",
		@"FhPGRYsOxsyZQidGVpjamYCklGFUxWWIfreoDQSzSVbkWvzxEQZxJvPArlKGSyBvqAJanmoBjdnKKkhyOpavOadqHyPVogLGXMNPShdFOMuLysCXyOTcIXQAHGJYnFVRSptfeZJHjCPKxg",
		@"QUnemkuEQDREHLhvCHTrVcUPfNOYaJyPJhHFgWDzjYbVLAONrHxaEOIepIVWBjukBdJtgCvAkVhYzjClivXCkRFpoJMFQTZYmqAjSiSkHjtNbxszoGLzUhpXfOXFmHqhUldGKfGhU",
		@"lvvRPaKnKPQrqsGLTGaiqGhsfFIYdrgzFhFpYaghbiaxhPLfawZgARWihxqrxwvgZaHhDyKlKJwZgohItkhEOKCsnSiRKNJywPeWCcncYwNVrZNUkRoQKmdLuMKAgAGyMCcZ",
		@"BCJxzFJKKPPRVSKRZKjVTIajmCmFeWUtviCowySQecRHxIxvSNIzpvMQOBBySWEFNsyYGcJyLdDFXHCfjOyvxjMNMpyswpnMYtJkinaQLInlZUUGlngRBfsFbuGkSrZrGmEtJRJecABHHEHbcVeOg",
		@"hkEdqqwLiPFrFreuQSHRWKUYOssgbGkcXwZvBXZnnJyUwaeNexTvyCDhyiQujOpJfrwxCTYXUpoqpTLHuQVcyivpwlHAOvQsONqTjKNN",
		@"UJTUCtryHlWVsECMIitSmioRgZhTlgAukWovDDPMsVIpBzgZXkVfzFPalxQTAFwEwmWMLKDuiVvOggOKjQbQXhLJvGaNwCLXruLotwkKxruLxnQ",
	];
	return IFFJxvimfpPziT;
}

+ (nonnull NSString *)ggcqNtqoSssBYw :(nonnull UIImage *)jYwkdlAYQsruqVQUZ {
	NSString *cuubEEeWFclLyCsA = @"DIcqkzHvbLnJecgJLfosYpKQBrzVsJjGjQobKYGVlIhlbQfBaBBpDOqVAoUBXAYWokKgUaaAlgzQOvjXCiVsBrsrtXcakITpPPHXsKTmiUSpUvFLhLFtFSHTrKzsZiiHejcVKWcQfTActEAdwz";
	return cuubEEeWFclLyCsA;
}

+ (nonnull UIImage *)OXXsGjyqfuCVb :(nonnull NSArray *)seYtbfnhOGsLwwONXuD :(nonnull NSString *)zSeZeQKQzjGjFy {
	NSData *nZZqiMgLQbEFA = [@"SqPNyDHTkBgaywZbjSohrseVlyMPxAGPHUqUWpHvTnXUvBVjyGFfmcdyrItPZtLddOeOkApQkQsxfHHTxtZRlpxjZyiNYZXRwatVwuRayMnYGkGPd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nbvldcOvJSbNpekS = [UIImage imageWithData:nZZqiMgLQbEFA];
	nbvldcOvJSbNpekS = [UIImage imageNamed:@"JXnFRngtPHHIayWBLRNdoPGMcuZzleNirBCjpTsBZORxaRNxnDuwpcGjHcMgUeQVEEBxWaaOeJHDhTegVxvrYlyABuBFMVhwcVRzlXiPjNypRuaRgurUCPEFgbQKZzOXnuxlnepGhpswJFWifju"];
	return nbvldcOvJSbNpekS;
}

- (nonnull NSArray *)opYJxVuHjMAmIXwvf :(nonnull NSData *)lDbaIqrBeRsnTLL :(nonnull NSArray *)fIaxwRNWEY :(nonnull NSArray *)DYIAodlSndmSJhdskE {
	NSArray *zHXvNvjbWnCGBOdAQI = @[
		@"NQhOHLhfMpFgCGQcfoFVnTJOgUXZIjhZkQxkXkkbkSqOpzvZcgYHhqoVwUQRzGJdNDSuOBHkSLfIvQJRhEAEbOlzbzsSUadaMsgRNujfMcjoiYybVDglQ",
		@"FtkfveAYERkkPchujBBHaybPpNMKcMgKqTfIoUDOpPOYhxqrilvLvfMaDSQenblWrdEOZPVvWHoVfohtqRhAGnBQxJpdAEsIoNkoNdXpXHgTMiozyeDNWsvxA",
		@"avVjLRuNKYcyUIbfUiOAzvBNYSzWsTzsvIglnRLzJAamwkVimNtPjjAkQuqIabkyytfmRdZZYRcyRyImrgnlMWVZUysYEmDgqaZnQEPAYVfSsfqABsyrTNxiTbkRsDtbGSLXw",
		@"NjuekpUoOwqEBjzCmhhIkdfYYrctjdTYGMHQIgZzwHKrCGsygPSeyMMVrnJNxEHmPLuwGTEqphzPkKhKeOutcIYmgcmToUnCRHuvTCUcoxoOlCeNcHtjDhxgvwvUfisnizVblvhbpZMTQkFZwjw",
		@"KnbhBQJtTmqOEaEOIXcDEmPXvWkwouhvEOoVxSBqVwwPiISJpXthLWGUwtoXpPxuuSOQFLHmMHPHMAKEfnCXPMDKZDSgBprIOhnOWqHygTMDSUUDFMOyalWKASIZ",
		@"sOwEBtSwQFzjcHRGktoqKTvVwwLvYiXTzacVwCpTlpTlnuQNBqgOKvzfFIwRfylQYRzsJbcLhyqiHbxCJkEsXNRuDsUXEtWqIJYvGrcXGhExck",
		@"nAAuFZdSilFoTHmyQIfdCYbCpplwdNwHCmUjQiTyftqkTeoaQdBtekWtCouWwLFMyqtNyJgFiVTTMyYVHPnvsiAuoTMvcexNTfmSncJWPjKeJMsTfRLVjCVSGRXYycSC",
		@"oiYQOutYlETelQMSysRZfmKWiAQfxGAwVoWXtRrktAFCHDKjbqslKoPpAmNUEySttqBsjvVxqqqAOchHyxeUFLJeEsbXYHZfvYcqJscXLVJorMiALiRUEXTxUIguuyqZFuSC",
		@"XIyoretXRRpIpGpePeXNAKDqYoLLrfOBUJOKdgrcYLZuSDgUVBubaiLmsSFvcFsXTpRHewyzLEZnpPhImfsctmpZUOJfGHJXNtNSn",
		@"IjmdWoIABMdsvIFRRWlYcPqCIzKaqVJkPmAZyQSndAKVoRTQXOjpieCHxwtIODXornnEwbvalyedrkjGHueWYlSrbGYRQgXKbTIRANQAKftUdE",
		@"QnLIDVZBzzJrwxXzOtFuMRjdJqRfyWzLVcBRbTIlghooqByOAxpOuvXOrwdBiwSFqkldEPHAfDoQIKACijioUmGOezGDgGSlsvXaMWmduPtIsrIirCPXSnIMowSOpGRIdQRMKiHANuT",
		@"dWfItmVBdWePCsEJKPGMKubcpaUAWLyKYlPPlyCFeNrEhwiDsrHhoxewIiMHXxMLITsxqPNwHKcxGAFeVwnrDLkrHYyNfIRBkuJnInzFcrUklsPGkeVZMKYpSGyYqKLGEaasffW",
		@"KrIXhkaTEmpWNQsrAsDaxYKQCoLaVrTcKcAQzzAIBqwtCCTfBjrRcOIjQRAOjTkNApeAJpsvBwVZZxIpWbOKEBfbgOHdZXRewbTXopupxGwiaMvfjVSzHxEYOpYCMQpcfNPt",
		@"PrDcIpPhIfJSZEAhYkaJebfzWURKVxDFvzOdWYvBgBvUqLTyNSglKQOwWepvQRkCMzAOtnWLaTiOtXShjzwbabBFRKmuVMcKiKOmTxYTLTEsQjzSlcA",
		@"TcDvyharaxXXMSPtUZPnhhuEJwsZfGAQGPKXkVzBbDymncuEcrbegiuNaOfNxROyRMxynxzwBeVevHtDFGfLdjBuRWlqfQkvHqCfQPRceXVHGOOOoK",
		@"kADbVeqdsHNlnbaOiqLwGHBEiJlfHgYTvLwuZmYbqaqwdtxzqTxxceRvymvLlWppqThFzxCVbCyNgmNTfbIDuzlPmMDOpXcWbLsdBQl",
		@"HiIiLunWAeEDAofKtGRqPcLsnMUOwetEaDNSXrREauBwpFjSzHBicmbQPHaeorTmVLjkvuUqjDKVSJMXlZdNwYiOpaqdTxhrgqwhUDdrfMKflSLwIORqcxinIH",
		@"HerKQQqaLakWzfiQHyNwgLnxOdCjPZhDbkfJHIRTjWWuiSeYFJpFWLUgUafrnaYJaOkOKqfrkhyznnuQPibSEwXUHnrItQtteZMJMRsFzv",
		@"faMHVgqAPTZdGCnsqhjpSFnvdrePHTWWmDtnkhEPFGlqMgTnEOSzmwiRfopZOeTqrMIFOGQkDGdjocdwvHLeoDUlYYHRpMEVUhEcOAEjHYDMgKSbObMYSywXsVAKTxnLGeAsTYOjIQmtMzj",
	];
	return zHXvNvjbWnCGBOdAQI;
}

+ (nonnull NSString *)cPvFTsYzOdRoNlvR :(nonnull NSArray *)OXiaKbVsPerYOjOmAzm :(nonnull NSData *)uGNzTRaHfLZEgTXETen {
	NSString *QOPXxCZfPlKornkaRt = @"ZmIJZFHiuuuMDMcjTxYAeuubbySlIUsvFsbxnNwJfOzPvzrzIEEZvfeHlLTbiBMoSYFmGrpvhtsdpOyDNYDmTIWvgLeSYkzClEVSvbzmL";
	return QOPXxCZfPlKornkaRt;
}

- (nonnull NSString *)TTZLVsqZpYzhpeLcCQg :(nonnull NSData *)NxnfwGIcqSCOENBu :(nonnull NSDictionary *)VYxubuwrHilPbwyb :(nonnull NSArray *)nfLCIylrjYy {
	NSString *ZblEZrNIwS = @"MKJGNIvtVdGzutwsEtoiBwjzXfJFJUOATnEypwVwapXhrtQXFkHiPRGSPTqDwkIOwWfXUSVFgBYWxIrrphLdhccHzvIIthsAmJQqG";
	return ZblEZrNIwS;
}

- (nonnull NSData *)BqoqZgTCTDGykDbi :(nonnull NSDictionary *)BcZPCSdjTJTDYkNA :(nonnull UIImage *)vDossvQRihlibhTSH {
	NSData *ODdLmUeFHlAutd = [@"OtZYnFiiuKXBcTaQCJyPCTtXcgIfYQUEbSvNYBgjoEhrpvoUkBitrwCyUkZhuUFxJFXXFGRBqupmCFPIipRLfocNxNDOHKNSprzEOOMSlNAOeOfaffjWOgfCFrUYLFoQzNIQUYchRNcYAnqsdOfpC" dataUsingEncoding:NSUTF8StringEncoding];
	return ODdLmUeFHlAutd;
}

- (nonnull NSData *)LdlRvDUhRnTVANPnsr :(nonnull UIImage *)gejMKdbrflybdiebf {
	NSData *DQxFTJCZJJZdems = [@"PKaGDumbDBlxFkzVRNxoHiJoZttGFLJfhDNTdRYjLyQAedTVPybhrcJvFdfnrZfalFaBNKJOJxEspajcwZlgmLUjJskfKpXdkxIeItnaEKsC" dataUsingEncoding:NSUTF8StringEncoding];
	return DQxFTJCZJJZdems;
}

+ (nonnull NSDictionary *)UZehWNiFIpJbqiCBku :(nonnull NSArray *)cqTztZMutwE :(nonnull NSDictionary *)WeqgBUBYvPnWtO :(nonnull UIImage *)TfxacCRerI {
	NSDictionary *CvRsgHybiMrNIp = @{
		@"jfSGiDhzTekiRB": @"yDpGQrRajhkXBgbxoVqxxldASuvsGytQFcGYJRAxkvNKtyJteftecWwwtzhngUefYQuPvSfQxycbJQkAGMBYQhuWAMeeoVaZYkMFzTACRMmehSIkSRBlLdJaQh",
		@"WtxjZXFKjoKWED": @"SlYaLkEwZrFMkYlmNMccVxZJmjXxlOtZfUIRcKYouaWhrxrVeioAbENtybCnGBGyKtkWMnTqQgOCTwnALccfZvxrecpGfnCmUmxdzInjgqLBKnRYjyMZrFnpmbzuNSZAlCnCVDTh",
		@"dDlmTmDrbWDPVyTeQ": @"eRJnLYSpiWgLRZxXmdyZSfNKJSWrXpdnoOMZWTSnLvHrvKqwXjKmKiEPxnCcIrKUYexeOjdOGFeemoAXrfRWKoernnOZTApeLTuBPFzAuRlYg",
		@"ytETufzlXfQNqykOt": @"GByMShIDKAJmUbEtmYcCUmUkBSnQiQqgsdIDizVyQVjjVzAmBvQlgmPGKjThZOzKZlQyvQcNigNdavwIgRvtsiBVVfCSKQvpmjFIZvUWxHwRsNFKgcYowEUcJGuBSQUFUmlfp",
		@"LuYvaUnrwscOCeJImDu": @"mZudnZzGYMGCSryRpZlfgLwhgULjeFabVVTkTqtQGgUjrwHupNAjLVWotviwUYKAMrNFNMKfFmxqpbfNRdQPvDPsPHgLtWtBOAaeGkxuRlyuoKmdGJZdvZIOwNbSLNkYuG",
		@"QmiKhvdMjRynOgSKi": @"bjXJmoiYpVwvkNUFRGexdgYohbHOROnNKSmvAghlgHjsDJVvqakQNGTTclXiBYHvTPDRfFerHUvbaBdDDDfGKoDNMjFnZMNACIzIWIswqIvrYQVhlSrraKLKHyfsKMFOrvzhWAgEhStgJOhf",
		@"IVwQsHGJAAMnRCpR": @"EpPevqjHhXjdPvwwBISNmzGotmjeRAkVFRPajwlSwHsIhnfSKWESUhilKTBbjjnkPsbVeuXUNWzDWpcTMWKRxXjxmFxJFJKWcSKXCDdUZWjpWcCPzrRfqVe",
		@"oyDQoHiqVYqYSxFmtro": @"DgcbFJPggrYFRSajWdpJddsAqYVtPaIHbkRubwKfJAdHeZVPBUSwHBZRCMOKpomiKJThtCClupyTIgwCMSCSHOZmVwqtYnlTgJtQaWkInmZIgeiMZHUYFV",
		@"jybuozxKoMpvCzWOn": @"BuMizLydyiqbRLcWXVDoexWRKaOEzguDztrwuVvQtmqrRodIYZIGBwaqRQkASXBzGlzpQJylZocTceQKBCxMFqCOUhXLgIeQnJivWZJKkIHjyDADFyuQipoVgLwNedQOiUGFsPQWDEfdbYEkxQk",
		@"PXUPFctHYFSZRiAyHzJ": @"IKeufwbJmUVyFVTpBAlsrxICAEwNmOgikChMLXxLmjKVjaZWKTqMIzKzKONfIAlOokZUhWtfWYuxzlrGCaGAnOYbcwYjcjnmIZWcNqtoRQQhmipkgBfcTqrUufUJHARA",
		@"IktSQOJrbhscKbKG": @"tmIWAEKeisnyyjNZJeZLwrOGGNPJHZhYZEZNxQnfSOEdPBukKabeFdkNdMUCCrDtlNnORiWvKfqqahIpoSUwWqNhXMwjNajICshtyYvWycPpiwhVjXTjUmmcwgBBFkvwYLThHIotfFsWkLGuayi",
		@"xKMMojMwDahtLvaH": @"FLsJPGFvJkvLDCfPfRQRyGotCebNEwWtoKerZibNVnqnazwMgRnTEukkjRyTrJFmwvmsDlPFrHnNVAxOLUtvVdplFEAyTDxfiLTMoDjLgXUxewqXxkBkRANdhkXUPQnrCrmDqmXJzB",
		@"XimPtEJdaKoRQA": @"YCfatggASQfyMxEzLLXhiZVvAodlQqIsDHOWFnxGYqcWIIIqWiqoLSToBWOsWpueqbupHEmMwCzGHuKWoDccLWKaxAbQVTXCnKiqOhWQmwDImeKLMaWmxJtHetZypBBuUcVnmJpbME",
		@"lcbWVkUqsqt": @"YvqtakZYPgRpAIqnKVnLHyCMPOCwQQBRgufndQibjTuDleXqzOXrIUisETpNZBGUYwnSFCsFUBmCrmkkxZuJUeIMTJjzMxunAwFL",
	};
	return CvRsgHybiMrNIp;
}

+ (nonnull NSArray *)eRNRyZZhwCLAHvEfh :(nonnull NSDictionary *)MDLrYhITStLZqYPioEH :(nonnull NSArray *)jRtIeNyKjL :(nonnull NSArray *)iKYDRpOtzgt {
	NSArray *bxBySWqwOBrbqAVWQ = @[
		@"DRLgVVtyRtnKLjobpwFZaOvkftXRwqPPGCcObvMnEScWuhRLVZrTWTfwNMUvWoaDyhKOgDFVnCemeZpgGkIxFqxDAVuXSDdzgbqRZZLuBjkIZdNOYGzaXSWD",
		@"PiuRPkLXrbgkGNAYxfqePCjWIZRnTccknJuYUHtvvUXiEzocNAOuTSNOYUAbouiWxtKZTTJCJQwAncWHIfyAhIxRfDrloFafUxuLtVZRVVWUbJyeRuDifIiyKNMHaStQmWp",
		@"gYYLwiWpGLDCVgimrYeQUogRIdmgnvALymaHdBKreYKifAGmwBgMRCPCkqTfwlhjyCuviEomrdVwVjGYXghoJNShEvuUMJnsmaNVYdUmIPjtgxNWDAMzpzjiMevDDSv",
		@"OuvoPzmLxXpaorYYMfIAKumrgFoxrMQLngRtvEfnnTNuIeuXwxIobDPeUQvRdxQBieZawWQOeONbjtvQEwBYljHIJXreCUAVAWyTbztnmBLdArPeIldsarrRsheFHcjzESttHZPcfgoqOKqONTda",
		@"FVmkxIoSXrXfeoWbYPCUmcGFuWcVxgFduZYprkNqHgWeFONRoOeAOzxfqAPCcMUDpvdPMpzaZjMzsMNHYUoBklulpcJSGnEipmwldFbQk",
		@"DGRSpwsZuEEJymQnEBusYeyPhTzpokVBvAhmWUZSwlmVmwTSZffCNlCjFlBntchwrvxMJlATSTSTnofWOjmMRTLNhKcLfWMtvUpEqdMwATyMzHUsIXKWhsPox",
		@"igPPDXHcLZOUYqCDsOLHRAZWHdBLOWGRIgefrjYpcDtEhHdWaJToODFZDlQwvYvSwVtZpbxgdgfwBrKDQXNFDNuoGbtkYSGMsRRZG",
		@"bFfpyKPArOzcAthMnMcnWAnkypXoGhWXPHSEJHHbGqNVzoQXbreahPMYDCzrhcTguGljXEkkzJUztmIRCXwdOlcrXQJQHpijjKZdzjJZXNXZqyoBaQUwoklTqbPmWCNCeFrQHarHCkbW",
		@"xOCKGDSlNHPjhxZBmZrgQukAFvIlahQuHSNLUDgdpKZiffQxCBuvHvAEMNxNoeRiSqBZHiHfwfxfCLAlmsozNojGqRFMbkuktShDAChtLSJX",
		@"iuobjRzaDUXBvhmZFAslZkLWKOynuGMwQHJwfGjgpiVmSzUMOivQRWmyOhhIQNHyElAspxPnEeGfxOpmbBWMMEkxNsTMEzDEueFeOYEiYxIndGBskHhjTGu",
		@"AUXqCEuJPtoWkidNyYWMlfufubIDwcIfOIQLsDFOcQAxpFPOuTuecpDmbgfLZiouQwcNBXKPoDpXCAeoCCXWXLQIbRqjFXCzkRwzoHvNPrcP",
		@"mmNwPXlRZArtVnSCEjaLTXCGUZAxYCUxTSfBWJSAlQlzcXVfVNjGwbWEVmPcpugxYTBgQQVzrPdYCCBLuYbSwxNthvqJTEMAtJzWShhjppvRaOMmZjwuerGVqJvTlAer",
		@"phtDYiQoSRDxGveddbrMqlZruqqWAJGmRGezFswFdhvUkTZingaVoPbCkUtxTBPRjaiQfQdxkxTBlCsKwPKUzCIaqdGzCDMmekDTsGbRHTUWdJpDgLwenNcsMtQKPlicvtRnwchBYGa",
		@"qDvYWhiHrDXCpACjHZQveapuOsXjqXtqRoWHLXwKrsEwnaDqzFfkEQtOiZxjiqEZpNnEfCzOhSWsvUxcmpxwOKTmzeVWMLjUSvqaCWNVsXDgfbxtcNjAnFJHbyPDXNfeQnfALovLjUIGe",
	];
	return bxBySWqwOBrbqAVWQ;
}

+ (nonnull NSArray *)ywKlSfFauQ :(nonnull NSData *)DbpvxkLPAYbWjwQ {
	NSArray *nSWEowSSHaxlvJ = @[
		@"uoOXXnnObaHYdTWsCLTFUbTwSHDytkJqhURehMNWfdTRxzCmoyMWWRKdNGssyhxxJtUiWVirthqQtUJuOKAdPGLpLYfhcUwnLoKlteSsAOsLVIFvYO",
		@"EYxOZHLBCtONjqgtHoabzGfvmjFrKMBpMovGkjJUhQMUwczFHJShQdSOHDxkUDpKDzhcLxfsqyRzxrxlIhNHRngvSHlRdgdswfuslFUGmTwPZ",
		@"vSnZSXxejdwOuElhZcUOGJYXOmTkEVXGzLMXdvXRjoBMeNXgpNIrDxVMxIGznVBQmqiMFteKtOwHRfApkdkimEWFUzEzTAhFdOYvZpXPRPloghoQDvDTnjDbATbAxvtpmCERhxIult",
		@"BcJISpRkAfhxybabaDuvmjjSSCOXyzvguRBMdmCPZCGirWILPqgHuRAqVQuyaLnlrowfnZHzEooozEhuzeAvoFYBbIBZZADDiRVjTsphyANHaeVPweRjBddFBksBUbmPsmXP",
		@"PupVqPylqKpbZNgkUXlJGBzhJHEBypjhHtzqtooMQloILvNrsqSwDHJdbfmejpBsQXiHhSizXEsnwYQXVwwmBDSeaiZYuhIfZdxMVPShzxdJfmMGiuGQketXLXjFhKqyjIAG",
		@"YEszgkKNbnZoctbYQKzJGMsKEtttOSUFhOqlUfhRgzeRMMfySjFXLSfeYHOdgbDtaCvHSGWFRCqEFFQNaagkpXqreQcCpLuwFQHfUfDOepqdtHclMXXcAPLefFuxwVKQueZYjptmFE",
		@"SpyINFNLvhpHSMGITuhPxNAlSkXIJXaWPkuBnOUlflmeEFrToVyAuatRitppLNiCjKFabVXYUfPaQJEbHXkENjrqcCRnQChSFMJILJmTWkYlrzcKRvMIcIZQZVSghoDvdk",
		@"rArrILTGqEQhdQjMWpNektcpkFPjuVolsdmAfjOQztzWcoGFxBlpVYaXDiKSwcqWXIAmKIVsFQKpnxkBYLVqtVLhKQnmJpdJmFhVcVmgTLTHJxTLhOsrbFzJM",
		@"PlYHOATndCbzGLUBHkgwOARwuSPXLQhxhaQwiESuvxRwVmNbhKWerGPAxudezadCusTxPCDnUxxBXIpnwjkFKOROegJMdakpYgiAANpvKulsjPE",
		@"wFicPAvSYHQlWNYiRrmIMwcTlKRveFiJiGUZLoonpYCurrKClJuNMdhmxmUPDqNLbmRZaavgCrkZXFzlwVcFxmLoulZeTUDDghrrLWRPaIrwaBkuMAUCYOEVkbOnrfMIesSjqcu",
		@"BPOqFXYYorPQfmaleeYSduHmeGHkHnKAQHjNCfKlpLVctQRIiDFjhIsBkqiWGroiwxzgSYDqsfRRMYOEvtNIrfcGiBaZEXRZUKWiIaZgWSjRyxGyWazllgrWSOFXSdppBiBDWqMHHzKCWxGG",
		@"KKjLrdGXLtzmiiRGgXvMGEEoOVJbmPomqMaccNYFgJdAIEXtpCOrUImvcQsXcwwBrrqyUkzPmWPXmcjyehhBbQpQqNcWqqDIpqpZzKYHUFJskoLOqHxdwRpZPXbaMqHialOIDe",
		@"EDOdRcLVRBqmlwjbEtqizBjPwNwkrrCXoZuAzUaMAEqrJMvFkIlbWHcqyvpHCEDQOutRltBphNXUdedEfIOcKinzeWkPjkvNsCLQBpFZmybVRz",
		@"soujyHpzDlNFHLhKzRkPUsjkrIcpsJGsCujhkWEVbELWVcrXrKmRwQaGPDkbEiZLCIGAOHeNoZCzxrqTvsqugBcCgZTadcqWiEdAmn",
	];
	return nSWEowSSHaxlvJ;
}

+ (nonnull NSString *)CQadndaRneFqkQuZa :(nonnull NSArray *)xngLEWutmMbVjp {
	NSString *IqIwJoXbtxxVCs = @"ZFKmXQrwlorkjmAxLarMQZwgLDrgRIbQLaQPIDqguKYxVjFlexLhwiLidpelKuhsiHzTpmDImDOahgceRLgqiXicWbnDbXNWUQznDhzUfhQtVDzdUdFtCmABMcUhxMhMoORWUZtEuYEq";
	return IqIwJoXbtxxVCs;
}

+ (nonnull UIImage *)kBrgMCBVpqxE :(nonnull NSString *)ZFKbspfziRetfejXrc {
	NSData *TaHBnliEGrtuWXyc = [@"BaPzEXQDmOyRaDVwEtbRhGPdUXexMceWHxxLDCpZDfllaKZbXOrEZYOTermImGrbGJLpPMVUPjYtaKLxpsDQsoOIEGiOiOIwyQIIRTSOITIYOtkZameLBrAhxiNnXDqMJFkBLYLSnfhmtrkb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *riFEZLeonJwdCsTSJW = [UIImage imageWithData:TaHBnliEGrtuWXyc];
	riFEZLeonJwdCsTSJW = [UIImage imageNamed:@"oXHiUopQaszcqwhFRfaamKYkFTmZCTOgbBVJcVhfsQLzKazDBYtgYavosDzJRIwhvrgaopcefBaCPtJmBUDKdwtdkSSgpbApJzTHKLaLHmOhpJbDbzJlhBMNIpEjfFRswm"];
	return riFEZLeonJwdCsTSJW;
}

+ (nonnull UIImage *)fKiDYFIlKLVFIeXiZ :(nonnull UIImage *)URZCCImAZdbtp :(nonnull UIImage *)IxNAaQXOAESooCOAyhU {
	NSData *cMvvZVsJKLk = [@"BrcAgnmAxYIToandKeUrxxnxNPhsKTKGvlBNfxSsOsquQLdhLGHeUurdvqjcpGmMNcidsiZQlSqvrvmnrJAZznregOJlAqDDnlWWZmEmgHazUkyPjoAoygeRsO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gwiMHsAUHkbMRUF = [UIImage imageWithData:cMvvZVsJKLk];
	gwiMHsAUHkbMRUF = [UIImage imageNamed:@"SvmlmsInBZGZTuvVocxnrATremkDkXCkeBGXYRpEzkpeLfwkhZcQomAsMdorDsRZqVkwjGOKDLtZKwnLEXlzcYAYxIYanqsOMFaSEFzrEaXXjWlkNWuxCEDPVxi"];
	return gwiMHsAUHkbMRUF;
}

- (void)setMinX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)minY {
    return self.frame.origin.y;
}

- (void)setMinY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (UIView*)subviewWithFirstResponder {
    if ([self isFirstResponder])
        return self;
    
    for (UIView *subview in self.subviews) {
        UIView *view = [subview subviewWithFirstResponder];
        if (view) return view;
    }
    
    return nil;
}

- (void)removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

@end

@implementation UIButton (Util)

//保持图片不变形，从坐标点调整偏移
- (UIEdgeInsets)setImageEdgeInsetsFromOriginOffSet:(CGVector)vector imageSize:(CGSize)size
{
    //dx = -((self.width-size.width)/2.0-dx);
    float offsetX = self.width_ - size.width;
    float offsetY = self.height_ - size.height;
    
    UIEdgeInsets edgeInsets =  UIEdgeInsetsMake(vector.dy, vector.dx, offsetY - vector.dy, offsetX - vector.dx);
    return edgeInsets;
}

//保持图片不变形，从中心点调整偏移
- (UIEdgeInsets)setImageEdgeInsetsFromCenterOffSet:(CGVector)vector imageSize:(CGSize)size
{
    float offsetX = self.width_ - size.width;
    float offsetY = self.height_ - size.height;
    UIEdgeInsets edgeInsets =  UIEdgeInsetsMake(offsetY/2.0 + vector.dy, offsetX/2.0 + vector.dx, offsetY/2.0 - vector.dy, offsetX/2.0 - vector.dx);
    
    return edgeInsets;
}

@end

