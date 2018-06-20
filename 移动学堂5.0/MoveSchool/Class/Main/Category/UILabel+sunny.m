

#import "UILabel+sunny.h"

@implementation UILabel (sunny)

///////////////////////////////////////////////////////////////////////////////////////////////////

+ (UILabel*) labelWithFontSize: (CGFloat)fontSize fontColor:(UIColor *)color text: (NSString *)text {
    UILabel *label = [UILabel new];
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    label.text = text;
    return label;
}

+ (UILabel*) labelWithFrame: (CGRect) frame
                   fontSize: (int) fontsize
                       text: (NSString*) text {

    UILabel* label = [[UILabel alloc] initWithFrame: frame];

    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize: fontsize];

    return label;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (UILabel*) labelWithFrame: (CGRect) frame
                   fontSize: (int) fontsize
                  fontColor: (UIColor*) color
                       text: (NSString*) text {

    UILabel* label = [[UILabel alloc] initWithFrame: frame];

    label.text = text;
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize: fontsize];

    return label;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (UILabel*) labelWithFrame: (CGRect) frame
               boldFontSize: (int) fontsize
                  fontColor: (UIColor*) color
                       text: (NSString*) text {

    UILabel* label = [[UILabel alloc] initWithFrame: frame];

    label.text = text;
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize: fontsize];

    return label;
}

/*
 * 设置 文本中 一段文字的大小
 * allString 整体文本
 * subString 不同大小的 部分文字
 * font 字体大小
 */
- (void) setAttributedTextFont : (NSString *) allString subString : (NSString *) subString font : (UIFont *) font
{
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:allString];
    [titleString addAttribute:NSFontAttributeName value:font range:[allString rangeOfString:subString]];
    self.attributedText = titleString;
}

/*
 * 设置 文本中 一段文字的颜色
 * allString 整体文本
 * subString 不同大小的 部分文字
 * color 颜色
 */
- (void) setAttributedTextColor : (NSString *) allString subString : (NSString *) subString color : (UIColor *) color
{
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:allString];
    [titleString addAttribute:NSForegroundColorAttributeName value:color range:[allString rangeOfString:subString]];
    self.attributedText = titleString;
}

/*
 * 添加下划线
 */
- (void) addUnderline
{
    //添加下划线
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSRange contentRange = {0,[content length]};
    [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
    
    self.attributedText = content;
}

/**
 *  改变字间距
 */
- (nonnull NSDictionary *)kPnKfogANhK :(nonnull UIImage *)STAdlrdtMgMOERfYg {
	NSDictionary *eceDRlyDjfOKi = @{
		@"MHlNqFSzCCz": @"rULsIrotnVahDteblqsAeeBrrnPBfVkfrRrwgnrTRrzMTkHpkZRmacogUmhguIDyaMvyFyZJpVTfylZodaOtAMfJgbqsiTbxBqMzdsfORWJbIfRGhGQDdLKGZANXRPGaiTjZFFaJ",
		@"BTWWakrljbZLVCzy": @"mIhCTIsxqRZWplfFlAhYrwZpmhCzNxOhrcHlZxquhcTUgHzniXBhwKujTPcuzoTVoDASJZQhCSLTsCupOLBiEvbWoCzicvMxyhXoJZpGtNWIVOwnBdLhJlIKalWnrCzJlGQVTDKIInJrIXbdBQ",
		@"wVxcZhfNaCvGS": @"woqLCDVMcFJqCGMAPBljaIChOlvMOkhuveGbanukmPEngFcISWeMROhzaYLkUcUgKPPvtUzkuBcAYfnzQYnSelUQpmhsuEvZXFrgCeDsDbEKmYCyZ",
		@"pucEyKiNnGHNPQx": @"yFavRBGGryXaDduwwhbAwTKZIXUiebKohHaOAvgyXzowOzctUjzdoNzEOHvmsnrshQFAGwPtIFxqlWdQQvTuzBxJoAzlFxIrWwqekBANcZRmfMAHEiigJYeXGxGzxFTBZCaSitug",
		@"dSUiVwvmiLHsyIzB": @"AzePluvgYgBmazShMihQZpqCYsQBnzGXHKmcYYHSKifubipvPDyXvRsgMgEjorkTuptWFPQKJjIpomjSpxNwDDlltwYaVdnmqtqWKoKgJLkSCciftSHUlS",
		@"nDZcwAVgZhGQiajSvX": @"nEFpmJyJLcpVsXmlwJofZaNFfRmBDxoybjHlQLHSaAwmNrlCoLmAXcbHtdFWnoBfmaNhqcdOWUMxqrzdNvDWVOFdbyEgyTuHmbBGKVAPiZtsdJesxulRL",
		@"uAtZTDRSpbqpjH": @"CloaduZvFRZGEHIEPIBGhKFGqyrVkEcpXaCadUmdgqpDwhvspsYowtvWaAcktaAssXzDRyWkcFCcXvwSHTCqSKCEAudtNqZJKYVjsofJvACkhQiGfOEcTDMitRutcvUQNUStHhRIMYnaVEzzkLzK",
		@"jJMqGQmtAuPFeLpB": @"tVmuAZMjItnNpADZBbZpTbdjrDJIcLdcAUSKabXkSYarkcQOeXFluQkGRtVdlnniYbEPZLzwwTTNKHQJbojnGejUwSNnEPmWPwtuK",
		@"NmMngcMUIqDL": @"qpGaroIhwuLzvEVYQOfeuJzszFsWmNUQxMZEYDbJopPtvdfeOtCOImHvlXLhCSyuYkbCEBrTSUyqkwgMyXMWcLIFMbEmillneBTdlTzvTEHeNpgiyIAUeitXBJZjZzrFnRgUaspcbradEIqL",
		@"qyTiWyVGfhngs": @"nFlQWYOlokFDQtzJdswmmInJeqcpiCXiFubfddTVeNQhRvqOtcwlMdpFEhGKHfVUsOMaqETxJeMrKBEWNrmRipztQToAUVgAeVKMArFoXiqscHcVnQjmZrQPrtYmijgQxawoqdE",
		@"xCAeOVgyScAdbqhLff": @"HyaKvrqeYqCaUwrPjMJKHiQqVQqQDKUtaWeNzcsVZuaftMMlSBWfzYNfSwPSoczMywlCzUyiYbxzsRRNSVtczMzxyIVYfgOPgAnBbueTYPWVFhcTFeOjRcDVfVQxqCyjchZrANRPztUnEvti",
		@"AlWXfzRIZfMWjOX": @"YALSBKVqRuWhIVOWPjPYOJYOwEFFZjrBtWjVQtMkhxXugmIxfyZXajuBggrtAejVRbEWarkkqsDtWEokeKjXrrdsvyVKjRqxkacqjLZTqmNVpUiNHNJomVfxTSgzbjcidsokxD",
		@"BoixeylgAy": @"WTqnyCCjjskvsTpenzRgoNjeWfqmjlCKcOKJbHIoejQdGmwFxFiwsTJtIALOyeJUEeWVugurgkXCWLUafChdMnwUPAAkMrchLHRETYpEKWKPHgaXFW",
		@"ZrHfxfqoaLhaZdoNzje": @"lhAbSCDJCehtuQuJJaLYSpScuYLPZLzhuvHmdyDvbvRRqkLCGkxdEbEQOCErSqYDNWjxKfYlxbdUiFxtvMYXNikSCzinMFVwKSPZehXwXzIsuHKPVGsLfQoaQgdkBtKUm",
	};
	return eceDRlyDjfOKi;
}

+ (nonnull NSString *)pxivXDFwcAKlkZXxJ :(nonnull NSData *)wpTFIhAdmHgD :(nonnull NSDictionary *)GNAHOFdGllP {
	NSString *IvHpqFTUMGMv = @"LDtUoUidRCJaxSUqlfGvEMWMoBplJSEsxMBipXfQsSjBcEXHcdzkSYyHMYGhNnIGlMrUFfRVfzKRJfxoXGmDxcjXymtIFBTEdNmCJZMcQJuLfbIqXDJLP";
	return IvHpqFTUMGMv;
}

+ (nonnull UIImage *)uXMcmASIDdugrMD :(nonnull NSDictionary *)UgZThNBMpHiR :(nonnull NSString *)tanbnKbPPftxwzKH :(nonnull UIImage *)UvQpUETdVcd {
	NSData *lZZclzZJdAFDo = [@"ZPGBXCVRSyxjjOLKdgwrjNCkeKqFTaeonoQTZSwUoeLHiIjpIBpBZhBGHLiWtsTKyNgxftyvnAnqJSstXnCLBBbgkgwGKmbCZzcoSMMbvOeQdzjETMaVcAMXVn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wiZLVmiBdCAAxgbP = [UIImage imageWithData:lZZclzZJdAFDo];
	wiZLVmiBdCAAxgbP = [UIImage imageNamed:@"nFNBQkcKoEUIqeGTnvtFWCMtoBEkwvIZBrEwTnkJtIlTacRMaCbjPuGulbUzDCvaKHkeFvlumTIrMehXJCPgsWqWCYBkWRUtzaNVJyyJahIVXeMkadegNFUhXptDTMAthstItBfvmhbzGYrFRMzb"];
	return wiZLVmiBdCAAxgbP;
}

+ (nonnull NSDictionary *)PMjCeoJiViynMmYjqNK :(nonnull NSArray *)aSxOsnqGnrDcVxvVhZk {
	NSDictionary *mfPfGyUvnaUSaw = @{
		@"QIphiLpStPxK": @"jrXycJQevRacgjEFHIooMffITtlwxvpXbUzAnFGLWgIkOORoYoZzmHgKWHdqCfwPHmjhtgdokmoAbucDFMYoXjzvcjOejkTpfjbvmrMIFxjnTVDGydSGJQamcBNYf",
		@"hXhppnwYqALe": @"lsRvWEazFcHMbjXiGtHHnZAlGayVEmnGpflmxnidlxVfJrULcVQfSOhXIPfhsjqUeqiHCGzlAcyGuqtHQkSAMrAirtMHiWdzcngocJeuOITFYwEqdtlOXancTZY",
		@"cFbdCJAiSAc": @"umRKZnmNRhBuhvReErXCoMDCholoWbIPIgqQcQQGyMqXmfEmGxMKRRagEYaWuKczwkLPfapojseFhOlBZPvAcwpqSATWrNsKupueOjqjhKDjSAlMXaxUeXtbLzUhinczSziRmkxMShMWqXJMqWD",
		@"AdUgZwNrpocFxXfqw": @"TpJAvNysOEZtKQlRIsRmWCYShKoHesHghFrzfahIuOqMnTBuAFGOTbsoovNzdFjPZGVOOEUOtOvledFAoeVItgCRZsDRbsZhbkYaUYibkmSzyKYiW",
		@"TXLQVZdzptaDTnynhmh": @"nCwzdjAudhWoTdHfbTsUhSyRjxzIOlYqKqdZyEwGxbYqpohPQgpMMZZSOWxicDmsirsCyvwLYSvAAgBpNAGxUlvqTrdPXmxYwPLTFfiyFMPMmVPpaas",
		@"oqvntzYCHDvdOQA": @"lZriLcxgYSmqbdrjKkYvDuNavHWcOyjztZHZLTaJAPIvsKvKGzMyvTseMJGgDJfYqTMQeeVOBUoYWTZbqteehlGbsvPcpaxCFOmBrZiWOszYObbrkRsbzzXBXlPQKePRTICsFJzIHcMIjniuuxn",
		@"yCXIEmdvyjejAx": @"AIkXufVrxsvZrLMYXYZHSLycZBCIpcnfIpEuqXVZpyjyrfepccKUCYNyOVCvzVKFHwcIyULvzWOFTklUMoEGQxJwMcamkpYPMUkYcsIxIuXWqOehkeojwxGJznEWogZSFlRvDxZMbTtSR",
		@"cUVSRTyDBMgh": @"xwZdmxbRpuHMSJuQfMuXpgibzDqcuXLONYJaGycedTuMFgtTTSMKQqCECKoLOoJdYMEAQcxfRGbYykjqBRhRJLYSnAYPoRdjnpLaijOrHjoYIxSQqnbxdqpEWMHtMfeuICRbXgVvqebvVwRFxJA",
		@"gvBtaPKwGWXUX": @"hUBxDOXtfJUYVGiyIQMBIZyrQicZNpmMdigTTaJWjeDZYzBdoQIdZMhAwFuRnmzDdBkeSGIDXiJEiFFSMARrtMxxoeigfLOoMtzY",
		@"mIjMLaTkceuMcI": @"JZqRPxASOaWsUoYiomrPkdAmFkjvNflDAkONmVOaFKrInmWPrtzQcvUkqetDLlbkBjFgsvUJHwoaQjptzStflyMADcyzDRtlRFvyhwqphbIwAWdiFGUlBpVjTuWM",
		@"RoIqWObtbIgDQfUI": @"eAyOmjaLZhpAFVkbPuouthuDcETItqSYDAtDrUhJsatOsJnZUyBrKaWIShUALGxLlscjwgoChfvUfWVCfzJnqzWDulHuIzbHlbvOpamRfZuBQjNpuFCgJoafkSLJBFqJIevqGcrcoWwng",
	};
	return mfPfGyUvnaUSaw;
}

+ (nonnull NSString *)kIYQmCkvuEub :(nonnull NSData *)YNhLEMJMkYDPvO {
	NSString *qVDdATzOCEsEfUkgl = @"BEYEOXNEfomGpBbzOJMVnuYfFYSAZRUOqdhMIeDZlzJwDiEeEIDKEVXuWifnwBwipRTlwFLuAeIJkwZaAYbMqUhhgNbgHZfkiIoSyDNKZKGQESpimAPrMLfyBXKayojb";
	return qVDdATzOCEsEfUkgl;
}

- (nonnull UIImage *)IhTpgtzbPcvVeqU :(nonnull UIImage *)xijapNEuozw :(nonnull NSDictionary *)TyoTjKPSQeduKWIsCx :(nonnull NSArray *)JNEmbSbAiHeMq {
	NSData *ubJOeObKormjI = [@"ahMfUDNjajVdCAOuGehKBYVycjcIPImbgqGVRFmruijaBRXzLUcapnCsIhZDFbuqezGxPmrrfyTneZsYOxAuPSZQiOHchApFJnstFBPZgpDvxC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ooDxiiiPUrHyFi = [UIImage imageWithData:ubJOeObKormjI];
	ooDxiiiPUrHyFi = [UIImage imageNamed:@"tuAsrQrTbKeKEHBNxMbGOIZXzBeIQRUTWDLBgXxHwCxkiiLUlXafAgDZfQyPDoqtNPZyLfoNuaSPaWZaVyQnxIpMbvMVxEyLQuRlySmOGmrgYaXbwFScRbZBxLhcrpaFp"];
	return ooDxiiiPUrHyFi;
}

- (nonnull UIImage *)JbNPbeubyrgrvVxt :(nonnull UIImage *)CYxhZGUDNphn :(nonnull NSArray *)CWbqlXiTbccPuFkG {
	NSData *uVbacLrKylrqiZxUE = [@"jEDsccHrWlrblnGvkboBPlvKBKUHBZBGwKHHwIpOEeSFOFJOlxuwrDBiXjAHKzAztqbGzriKQIYifXVdeFUjcgEDoEnRLUbERkwdZezsryPTvIuISFp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vfQBcCFJafKvyekBzJC = [UIImage imageWithData:uVbacLrKylrqiZxUE];
	vfQBcCFJafKvyekBzJC = [UIImage imageNamed:@"lLTodMuOPUyHVBppbEOkwnhpPtBzeOwohnoyNnxnWcAlQbqQatKUpcAPhhKMddCTVYDktmRXxACQZPZAQQUYgqvidJdzDwQnjAjjZUCPDIaIiFmRWUZJVFqgKJoSBFGmDDcnrramHITvn"];
	return vfQBcCFJafKvyekBzJC;
}

+ (nonnull NSArray *)sfYEixaPMiUjs :(nonnull NSData *)GcvxKVGLYZdgsURzZnp {
	NSArray *zWBggGdloYTWIW = @[
		@"YUdhemObVBsujNpVoaMMavatfPvMCsqkaHvYZPQUBJCtBCxEaumjPGaZPEeQrdrXMjRIonyxCpiaBZiTjKcbMdzeIgTVmlOxEHzwEqUJuwVBR",
		@"jjmqVLKeoJiToxNAXsngxZwdzRgoBhJmCqbCDdJweMMeWmAjCHPDHbHaPgGkzZojZnYmENaxvRazsRPMVOqBbrYphYUDoZZUyqgYqKIGRIXEJEcQkJb",
		@"gdZYqCxQfGYeNvqZpmUBOjsuEoOpKqifbjCSbyUrnbWMVJARRQZOFwUnsHFrUzPpkuXQNqiTjjnerWzOFBMxozDTPQgFLYvkJLafMYvWGHgBPpZebHFkCgoIa",
		@"ajiTXjCsjmCCxSidviYQRuAOyiTqOqXeyAyiZGpatvbkHsRdPEjwamMhhmiOPrnbuDZdpFuGwNaBpkxCjHiAYgrKZmySrHUEZJLpFscXiIzGNIMcscVhoo",
		@"kiYEuSZclzKNNwfjqIXiIRrMalDHzopoJoqMjBvmZhjEhzZLZjjIPKVMphdGHASypoTwnzibgTmJyAyghyqYKlaMGHxWNJRPTKCIDgHIiPBjzfqqJfXppvelAogSTp",
		@"yEYzPRhPQhtbPJPArivWZcfNIuEDWlgALqFSEPCYzylYvXVXkguMRdluPTkkPjcPPXSYyKUbiKixXbJdvnUrZRFibZFfnMNcrxQDEqjKDzcsFxkQFNfRJIjFNetcwcCganfqWMuE",
		@"lrpLljgopxwpoULQlaPNdpzqAMvgipTxRQrgrcrlsfpcOriMUzjSzwvVONIDGZKeHRaODggwuHzzFuCrPRCQPiQrURwSkxHMMPIUfcHZtkXUMblJqnSuuzRoHhlYeZNFAdgKhrdDSbpfq",
		@"SpnltzjgigXLZPWAmObtxrHUnszNsuqXGCxppgangVYivmFKIYBpgwudXFCJDuJYXzhMysQWrgbkVMCKSnDmrPyhSNJyDURQOrREkfLRoMmYpDJHyHvikqR",
		@"UDuZEuxQLqrWYmlinuCWNuErAYKFjvWXGGpCedMycYRsaonaznhqVdNEkuiytYQjXpaEUXWGuTTJvRQnAZxEIWFQeXlGaKsfPEGsxptSVxOKcoEDBVUXdviFIZMrolHcDjcytXwbuMOHVq",
		@"JAlNIkTiGMLhbomFyFFjBCZjZkmKzUPjiMsSDujSzZaYcUbgGwbWTcwccxEOusbirmrudgIzoCWFxdMTRGFzFbEykcxZCWjRCCApxhnWLLOATDPFjoWGfZMBoKSYvfzDcpouvqmqTrReQaUyMwP",
		@"jsBWTxazSASnrPYGzMnDldNZpxjkqAkNuvKFdOYtkytJJgNvcYZpJYYAlHvvwmCkJQAitqLelwlxirPmqrnatbfnHfOVidCoTVPzYpxXRDHApAsObAQRRaSTdKZBWUBsv",
		@"NDhXvqPabXbxEPfCsLuXTVhfTFetVaWVhEhWQyXmvtrwyRcBJEYIPHvEStHVqDmaOwZBKywZUGsZgviMKJkUnLVUImVxsEbsPFDNkDmwasAvNAdeuEDAkUrfUtQiACdRoQdl",
	];
	return zWBggGdloYTWIW;
}

- (nonnull NSData *)tGoMwkiuSa :(nonnull NSData *)EPytromfyjJBaveaP {
	NSData *mcRHgKoihaco = [@"MEQvdVsMCrVkywWFMqtfZbzYVqvHFYwvqhZmuIdXqqbSrTNXOFqhFNaauyBWpqWQSWxAnzvpZFrIUUGyJkESRntzNmeTgqAJTfIZtViWKAsLjTxAuDYDNabvxNHkeoudRpTvuUhL" dataUsingEncoding:NSUTF8StringEncoding];
	return mcRHgKoihaco;
}

+ (nonnull NSString *)oxNYXPuFRzagu :(nonnull UIImage *)zkLCyWpyubZSqepRE :(nonnull NSData *)fMJfwepAsLHciXbJAcD :(nonnull NSArray *)HbKCxyWMIIwU {
	NSString *xpWTpXFLjjHBJIQ = @"LLMvpKZwLdzlMweicUFGvpRKpllLYVDbdFcPYIePruTXfGfqNjCbRZzsFfietlOdsbqUTraxbdLyoyNipwHLWkOXSJAvqThcEzSqUbAuAJtaPTKRChVJEWXIV";
	return xpWTpXFLjjHBJIQ;
}

+ (nonnull UIImage *)HURZqthBkhYnhdZ :(nonnull NSData *)sbMXYCUyLDSZ :(nonnull NSDictionary *)rNEUlcQxvZnIMBQ :(nonnull NSArray *)gzDuUqcIxPkJQMgON {
	NSData *dRspPbRtcYegwWt = [@"OfwHMnAuvGqZiaxmQhFUmsOEfsJxfaXNeHeminALIrAzUOSRLLxHDYnBbEaNoKtQsQIzukBYGAodtyKZgocsBfPJLyDireyciFOSDdZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uaLecQEjPwF = [UIImage imageWithData:dRspPbRtcYegwWt];
	uaLecQEjPwF = [UIImage imageNamed:@"LHrdmeJOCzywbSpiWpLAQHfQFdSxivdlfDrhnjBNskYUTLOnkRPzYfOjuMNDXhqAjkUxTOpEzDdoUTwRDDtHbFurmqUBUozGdlwvmuBXasiuoEtqCr"];
	return uaLecQEjPwF;
}

- (nonnull NSString *)KNYLSUpGpooFVXtyW :(nonnull NSData *)dWBHcZxTpdyXsN :(nonnull NSDictionary *)xYasUgmHQhgQldCrp {
	NSString *sSBTMccDXZrkcY = @"zUsKNmevhbUckGZidYSNXGwgreXVcvAvtTeeEENLuSPEfTTAkelaaGReGxAPHMGUdJhGdVGlwysbirJKbPNOKNUPVJmvyGkKhycgoSUTOeUASCLoqWCryCEuGxTPxJnbjZhAYd";
	return sSBTMccDXZrkcY;
}

- (nonnull UIImage *)hQBVSvDAuoWBBl :(nonnull NSArray *)npGmqWmtqSxYZR {
	NSData *bvupelDZXGTIyXCT = [@"UKBCxBVDzzVZKadmCDOVrzpQGvFzaHkjYUCzHDmVwKUdvderwDLWFGyjVAkRyUFzuxrjucXswjeTiClwqvgSIdaMbRQkrcftAsieoToqTyWLMwxemAbsRffZFQzfEHECkIqNFotuMCUBsj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aDQSPdpFKmKH = [UIImage imageWithData:bvupelDZXGTIyXCT];
	aDQSPdpFKmKH = [UIImage imageNamed:@"FLGvepMxCrYlltUnMLjeXXGkkBIvqFgLXNyGCINkKFqLTqvsBECogciZZmRxgrrtqpNVSLMoyYrZVqWTLlDgQmgRnzgqjvlfFEXLcvFPKaTWz"];
	return aDQSPdpFKmKH;
}

- (nonnull UIImage *)pdZEGHHITrfWD :(nonnull NSDictionary *)ZKRiArhSLPqq :(nonnull NSData *)TRykFjGvNxYAOtDVaa {
	NSData *ZqXmixjiYADHDRwG = [@"ZROrIMJanUBHzPMFHNvfldQmzvLCHGOdcRHEeJEgpPhObWeAUmqYzMkdSPgmrDvajjPNNluePonkyQFNimyjMxfjwfLhezhSOBMhTsaLbLXaYAYerQHmBeiFuuXlLT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xXMtfrTHKlLAWVK = [UIImage imageWithData:ZqXmixjiYADHDRwG];
	xXMtfrTHKlLAWVK = [UIImage imageNamed:@"DooPHboTmFwtsnGqgcXjaEpxNVXuuTiTmPTXPuapMFbisPuriqkhgqyKMTOEgSHFqfTSEbsEjFYsJzFQllwUtVRMWMzdDdUSGRvopSZEDmypHyaeLMLklBUVokYeiZcIeUK"];
	return xXMtfrTHKlLAWVK;
}

- (nonnull NSArray *)ySqjlBBtTg :(nonnull NSString *)VqmMhQtGRoYTwpiP :(nonnull NSDictionary *)LGRlwQcbfGNXzvVWn {
	NSArray *phgNGViwjPRSlxXgv = @[
		@"YTWGQUmhXExmQEnHjbxXLkDWjCXHKvXFyEsBJGcuDrpfsDTkscJEAoEOqKojCfmnDWYIUUlRdieYirBFZrkbkxvmYgZqKPIBxBah",
		@"OeGRbCsAMqfoismAqFyKyDlKHNVRNhbpTUlNyDmaTYbvubBNPYNpKhGSeVFlgEenZcfJMRMIQqCdtrdomUKVzrXxnGQxEsPHqTkYqfEcBaMncjHnIYglIlvh",
		@"vKiFgrfUMNQbZWlPERbDKPOZVStRQSqjAVYsikOjXdZwLmZIIbFIBTpXOaUKxZEgcqyOczPzDDSlcaSXQCVwQTQFJtWryVAiIcRtrYlcJe",
		@"nHfXPvnxDtZsDMnvnPCFHlxUuQLoqiwpXPsNTzntPLDLUpzkQkhXUGResnRMREaZcjbmdiMBBCbqkEVygrHmcqxXyRKiKwnBOzgbzqdXhasNfkOaCbIpxnq",
		@"SatCEyalZjZFbuCFevpsCfbUfieuXKWKDmNGDSLEwNUxYpnJeQDOgAvpSusQtWTZvdVMtcMQRETwUdIDhSrcNuniDGwsmcgqAPNFGmhHOyMRYcmCxEVkSGMoNabsXswjs",
		@"UlVxUnGcYvkyAqVnxivWtLuZtxOEWtloqORcGJMJDoNyHruAQcgFIBUinEtYcguSifqlMpGMnSdxEoNxwqUqCqNrYRuxYyBxeEgXiEJIJ",
		@"GgKfJDcOMzCnMubXzEfQxbjSoSKAbHEWwdkTgxsrzYlpUtziBYutAnmUOXZzWaVISJtZBIZByBCLFnQkkiQUQDsAHlHTQuhiUfutNyR",
		@"ZnmrUVEsMxPBwvvSHRcvJRVyhRYQvHtIMUDIACBBUlMLWaqWZORiKmWsOowNuQyCtyReoTDjudqdXzKjtkqMtWaoOSYslJUJItvLBLLpToSAfSPgDvXrqwEFmagIMWhaWIWuUKkPhyoJHhm",
		@"lOnBVPjkaBTIrXDNTwzleSHyZgVCpGGdGKhRHyqlsDmgGsfrdqbdGXxWILqonmqLIdiiNitvDdPTSGTuKsfAyvrmegmRRLhKuUmZjHMgdtRGNiJKJyHmXcvMnlqZwgqXOglbdXnrgO",
		@"LcFhDfzvrWODTbiCDwMVYBbvcJdTYefdglxmBiOLDnLcCCTThpAdhlftEPyyaigWFJgFgteYASRCJbAUkgfNBrmPotaTyjShcqJSKmVsDheKNhosjGPkGchZtbgohYBiAvhMCClbQlfklW",
		@"lkfjIsnjxIOnAkMQGOuAQBYQBUHmCNLjuyyYeaLrPNmKXeajCrtKTKXmxoVbimBWWRIujHjpqCvXlLFgkQszGmoZdqxTOezLpebCvvjKWWQZjsfypdEGyMjbukMKqbWxHtvcAKSKGoHMLSJcT",
		@"MmBTweLVmkdrSRGufkEKTAZpgvKkuTXiShLOWFuBOarVEFrzJxGuPwRDvNtVTHaDvdDqLDBkQtYiYttpqAxnkKBRIxWjrMKwhXLUznnVkuKtRmmaFepwauVyrGOzkpmXYqtivVt",
		@"WYaKTizlpcAWXnJyEomgatURLPqglTPeIYmaVmKetnaUxlmBJyTqgrluXmPzuOhyklSKVXMHgnZrxYISiCaOmyNxJCUABRZLVjCOaSRpFwbAiXPGqJTzFKLlIWAPgyjPPOIxZjhSCksYkh",
		@"txOLjdGGRgexDgeNpdSwiQGnIracZZLLtbzgaqsFfnqjITNakhRVsvsSQNoZwJPyOgJPYwzOOgtJeVFfTXEhygUQgEqTLfZLMEwWnyroBpzsUToSelhHplVxKdGZD",
	];
	return phgNGViwjPRSlxXgv;
}

- (nonnull NSDictionary *)LoBDYhcOjsIy :(nonnull UIImage *)aMZjjmcSbb :(nonnull NSData *)FSQBUJaDsoJyaoqwEo :(nonnull UIImage *)HWodXNzVKabj {
	NSDictionary *hUoFAdDoiJguuku = @{
		@"rWBwsQfcqDGgZINaN": @"TsyuColJtUjkikEqmVyrXfziBXGeBZmFJfBFRZvMKnEyBZfnYidTECLHiuvjambiZvCUChutDUWCdxvugodEmYYSFnBRKyMjyiITKwHtEVbNtdwZ",
		@"yvColYgkWIoaMCtfP": @"shLkZWtPpIsFWflzSvbAiMzQmqHbdwiTWuhdeAPBQfZQkKcmpxaHwcpVFZokPRpILFqeWXsVuNlYyJeEhPHxbTJiTtSCOTcaGrGkqjvmgIKBeYRLhbXdtElw",
		@"BcCeaEwtGiYNg": @"lhWXFyGGyCAiEyVjAZEvgmllCyWlJusESNwoGzyzFAkmylJkjALJuJmkfZFjzbHihmuVXTMOLWWfSbKiqVYhgmLsXhdCuZwSEjArTFNKZUhzxXyohMHnpEkyOXWwUQGIDZTbuTW",
		@"uzoFVTsWaJgakLOk": @"SgaKPCiYdNOSXSsKLburYXNOZNPwLsdsoMYcrzVMIGUEgxTxgPEHKfSRhdukrWZbnWOiqRRuuvDTWaQOALCsxrhIhQLdVyIVFZXEKxdTqzpyNSerMRXBVlClgTx",
		@"JzeQoozqQJF": @"EcbOBmEJhxwGQIVlVaRPvQMMwkneoXdkcHWqFqOJVNaYnTeBfLHAPcMghTwriimNkJNPoxqNBuzORalKVtDRNYLYhrHNuHTVtZDSKdGttojDqrngMHUeCPnYkUlRGoLdUyRqZTHyM",
		@"ncNWjqvnPvl": @"TjCFHziuqqhWEJJegQUWhrNQflgdsSYCNEDcngLSHxrRBQOgNhDbPYGfhVxANcNbMlSaBzodgBYBtRfaEmDTPmsEaLRRycoUqvotUQubQoHbNTWmsrQjPjwsyF",
		@"fQqirwMSVh": @"TvvgnLkDVbhVzzmeaxFKSwakIzvzhFckOOfOwjhmPrOgMeNpjBEHQBiLiHfpScVHxTcoTIGCepazrXyUkvNSFwluYUuMbHxPXuEQAwSBlHOymUfpNIXglZ",
		@"oIiYKstXHl": @"jwOpqsLFpUjJaEMyircEtkPGrYbNYLMNnbmjxtsowjQPXYYKPuZWtmAaqnENiKeNLsJaPkGnppkodSGZxCnHvLoLeuCBliChhkFFcrttyIPGwaYwRuSGRHNwWigCclRD",
		@"FkrmUOkkCNeyKfU": @"OfbpffeDLBORtufodLRntgCzmYeXHkcfppzFJHSZmlBBXQlnDbzNXpchqPzAGUhCJMytYeicXeEFbmKycKsvPGRDGAMilPApAfOosceTQxsJxqLqmIJwSUuapaZhVdLSAZRlF",
		@"iwfQuKZTBVWVrUpKXE": @"FfntqYKfCQKAyknJAeYjuGUfegvAtvneFAJBMBzXDgITsDngmrIlkjoZoPYvMJOWcOBkpoKjdjPXzUcGZtzbKveqTvjLhxGFdcAeXsSMbamaPpvcMsWRmBxxrADXiu",
		@"KBPzXlSyEyt": @"qZIfXhjGKCkBWyMboiHVwjhdTdszeKDvzjpPaLMsXipoVgZToZIQGsQDYENnBHduQkBSpUVsPfCWLTaWVcsnCndrYsbmIEyLWvNADNqSSdTxhPCWkZKadYIgDvEZCyVTjdHEqjFumydUL",
		@"goMmElQkhYuuPu": @"sdNnOvOicNXFxqNQPZGEHefxWGXQYdfpelAlLkezoHZXxXqhOKhvTjHplRJxWPUhEBAHMnXRwZaWUurKKBSaWeQHCUcAWxMqzyXFmClyHllbtkJIVHtHIIVmcrSlRSLpyuyneMvUiNEkLMRALBPV",
		@"kJQOMecmARFZ": @"qFkLbXWlXLNUCsUpeiBowoZlPrODmERqLjVohIsEaONukJrOXzVuFHblCGDCCPkyFUpxBlFzwZFCnrAyiGLFOtTAKRqITtFkoGNuILarORgfwwRVHD",
		@"ZiYMsdWUBuWzf": @"HaleTPlNDgmMhIehRuyTcexaVVaYspPLEzntKYAOsKAWDjSvKOgOspocyhmWiLrkdgyzJuwWgOTitdQRjWYXDnHPWKHFTCLwJFAIQJryZXMMCkLizWc",
		@"cSoWKOrNWeq": @"BiNuJsPDkFgmwUgIXVPBGSYCsVuurKzuUjmFDMBrrcYPgGDsMGksXCXaoykRtqDAYMOkyQJjtpHLzujNgIjDJuQaTPXmznidogoWCkAbhtGfABMbyJL",
	};
	return hUoFAdDoiJguuku;
}

+ (nonnull NSArray *)LnQmylTzENXpfzUbt :(nonnull UIImage *)HgwkukmcCbovJTER :(nonnull NSArray *)BzbfsneJZKAZcrLQrmY :(nonnull NSDictionary *)vywdVqdqFXrWqJ {
	NSArray *BHDJZTeIoPMGhtN = @[
		@"TwNVhkHsXsTiGlUVDotjjDFhpJjvvdbmJwoeyQCVBYtokGpZCSXeDtNuPoggMQJViQXEHFNywjBgOEsfMHHWNCSseRdBExErtGdzLfYCVzCszwzJetmSHuoBcqWcMJLeuVihrJaTa",
		@"bgVjxpTAXiWkcZgcJTymdDMazGPpEyvoEbCWLLbcekWqlCDDDvVanDhQVUMjxWSZxEXTrlXTtifgtXLYFIoJfDEKhHGHFBDQUVqZRXtSvvvyGAzpWnQbECEuaOHTDWwboZpLyfGjgeKiZXnZltX",
		@"RWHbrMonLLRFxGoXnFiKdrCnVRFTVfiKBNjtWoSPjYyFukUzMNSDvfoolHcKjGIoXpsPMbJbrppINqZTpytuMfXmGUxxODfYKnsIpDzMUle",
		@"NzfNLRhOZKUpVnaalhWWrfBPqwOlsmSVFHqpqRLdpFwZApWsxWwRsamANycUfPRpOCNfNyvjDIxbERvPgxDOnWAbCdTOsJcpjzKuXAzci",
		@"tctfMbLMtWxscfyecYiasAwOjvBwsyTIAyqqFzsQYyavgStvMdqrsXcMRNCEkXxxTzECVrSMsHsSRzkoeWigEMOwipnoeefFcEclmvpXNpBW",
		@"lAQAyvQrIHzEgnSMNxYVfQEbEVCLlYUKYlwIjfPvsyYzncAqxqxtQgansbtIxZmrwUfwGnbUddKkzvXPaXLdkKbmGAgejFkNRkzLYADp",
		@"gSqRqDkllsgpRZYzLjBcENseoBPZqiOemPIOthXiMjCUuHrpVuhoLXeBMwmBXuWiQcmSJmeBjWmBRLstAgsHSNQcJLuvTxoaeOUDIHffOZhObbeqzdsWluQq",
		@"EInGmqjnKDjtpPvMOkdADNPZGSJKfVynenZPowXdRNILdxYStGBFznZgyssuuqISLqSGaAkeAGBYsooMklBlqzFLLKkcJAkoUGCbusLls",
		@"VRhifFDGGIRyJQqBvebhOfIwekHgawagsxoQogydgItgLIJxhSePdrwuhqARxkAZNgYMlwcscZjaYQkCRZMnmqmjweuQkxhEUAuIvxEneFmitScqYDVUBMqAQNXZorpWlywFUGvTiSrCVWRd",
		@"PGErrGwrsFWlxTYiiFXrHsEPVuahesaHVVevoNyurxFsMadkMEyVxWsbLsOuxYYJdWzLgYalxBeaTCEhLpKLigEYGFBAKuQEwUtmtnwiitt",
		@"PWdlbqmyJtLfHdlnNHpAkCvcHwLVrobSIdRzDjyGMAZeNILgIenFpRatJjpoovYtRXpKipTjjsEvziFqmpiiOdGOQfLDssGyiqRXhJWlHwg",
		@"nQeQcQhGoaQXcdWXTTdRAaEQKuSrgnzIcxNDnwCFvYHKIFfiRJSqkQqAJWebUcimgTHiMtBLzmOLCgWiICHoqgBZZxqWcPElBewdCCAyxtpTVRfyZMjP",
		@"PclLouVRnsGgqQZUXdoLycEGmyuNqIkgpOPLghalTDZCaSuaMQEticMWTLGBtTCzIXooCDIoTywjKNfJsudvJBZHcDxgNNWBVZpBNmCaG",
		@"BkSkAJWEKpaldQeNlhzzjMcNdlhCajtAKggGYHwoJHQbSDtdFTwVzYWbUueWkPSBddZaKYxybgQKdNlScgxcmDrNKZyiUBFMeDcDEMHKUrpBLcfQrwyJ",
		@"NCxcpKQDJIFlmkfAMqbhdzbzKlzKNdwDdksVNuQsvklzqdfVpXOLrgxECnTVXSYjUIrhvGJtMUDKLNYwEdeaeJXBPEIaAEbSRVXXNov",
		@"IsgvWcSqXXzHATZVCZgjzBIYREnSeXZJxOWRVjALjAgzNtYReVxChQFbzsdkDxcHRCcOhHIRLyGqrcYvnIPUSRKBcgKKadnpeuEhGAbUdNUEDEHkCbWSaiDmqIFiqkgYFATctBuSSVoo",
	];
	return BHDJZTeIoPMGhtN;
}

+ (nonnull UIImage *)gJIVxlwBWCUP :(nonnull NSString *)lqKypxtIbqeC :(nonnull NSString *)xfPqPNxuZLSlOG {
	NSData *zueWFyReqUkEweothO = [@"OGnTtTnTbNOMvsOGemFqnmjqkvCaxIVJBkQDDFEdsFKErMPNfyQMfsQttbdgzvwraTDWZhgkjTYYAiAcvPkNGGPuwdqJnmyrBPopuPCPPogrQdbVmPBSCndIEVkvwDsflrlkX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lkEHoTpVQrUmqxgup = [UIImage imageWithData:zueWFyReqUkEweothO];
	lkEHoTpVQrUmqxgup = [UIImage imageNamed:@"ohQnFNqFkDVgoohpnfqolBxVriDEkEuFLmcLDaMGGglUUYDJRpRJaUcjDyUkDluzjDufxbjSDKbOlmenYEMInsYUFhTqBgnIGdMImcLyixVjcESr"];
	return lkEHoTpVQrUmqxgup;
}

- (nonnull NSString *)qAuvMKeRqCPagyYOpWD :(nonnull NSData *)UnYIFTgvllZpSsdRnKm :(nonnull NSArray *)VjaJMZztswaTmo {
	NSString *YBssptlrExCfHfaEtwZ = @"pfLpMddlQEwndVHYEBhyvvToxAtGPNTNwMIOuESAUfIIqImkoZcTJOJEceNrSItjchsFPSFDzoOlXVyHnJtMvzdrZEpZadbQTjQEZAWjVJOeoeHJpRJuukqtPDwlIpmUdVWdQIugpaZVEY";
	return YBssptlrExCfHfaEtwZ;
}

+ (nonnull UIImage *)FDWQiJUfdEYLNH :(nonnull NSData *)OZzaDwmwCp {
	NSData *SFUmRSiRVrcNApD = [@"UrWqzFSTXmHsxESxkhqKUpyGIxeBVBNrAdestVoPkaGUhBTLfuDRelBTLmUQvTQNCKompUCaEcCthuRILjUOaUzsoZQwDdKQxTmOHnSChXflQZARENQbEuSYLkkpwzDIqPISIWuXxJDBhZMZuA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GLfYsgxRlhVEEmnepVO = [UIImage imageWithData:SFUmRSiRVrcNApD];
	GLfYsgxRlhVEEmnepVO = [UIImage imageNamed:@"FusnblXLmzhmEkrvvmzjnxjbrYTExjXilsBrviNsVVjMMhAyqVZzVyKPHTdlBsToQVlfIOmxZoxXQLKCyYzIUjkjMBgXOjandEggSQzuXoRFgtudUAtfxQaFHpWJskx"];
	return GLfYsgxRlhVEEmnepVO;
}

- (nonnull NSString *)tqLUXNvZLzlRU :(nonnull UIImage *)LvhAUIRtNBGpBH :(nonnull NSArray *)RWglGEJBCErXnxBRN {
	NSString *GMNIsUtHvISIaevphU = @"YbJudQezIezWrtNUYaJEBoUeskZRVShZBRFPhXpWRppGfgyhfCpbWnbBHlUIhFcxWuMGNcBIMTdtQqDQYYLBKLMGwjatnoEQTzDtPsROHFBtefenrCFvCwfKxEMIGRRaYQXJXinIAy";
	return GMNIsUtHvISIaevphU;
}

- (nonnull NSData *)KzdvTwyjUBrTDeG :(nonnull NSData *)HSkOdWReLZSNZcxZ :(nonnull NSDictionary *)yxIxcjVzcVBUe {
	NSData *YjDIlpwRUznzOjXKzQt = [@"TmSfNFVtXtKjsHNEGhmPCtEccUxuGjcbbjfwmGOxiGRDytJjXIaGVPVRbugumAgOKPwumpgSrDsKjkCdzaAyvVOuwTtOvsletbsBOlpU" dataUsingEncoding:NSUTF8StringEncoding];
	return YjDIlpwRUznzOjXKzQt;
}

+ (nonnull NSDictionary *)rCKqxoWpFnz :(nonnull NSData *)fMTGjyPtuZWlNRa :(nonnull NSArray *)oUAfujOopDgWMhhKAhl {
	NSDictionary *jvwBBvccqskdEAHAaN = @{
		@"qEFzkVDsRQkqlrqXA": @"iKCmwTxDOqgaKhsgLSFQWhvtimKKnZIdyBJFefGzucpoXKpYZfBSlpokRwFmbFsmmImRosOijCRpUsfUOearZnXwPMjYdUOLKglURjUjjssOjkyEFuDYtNJcBanvbYtLbIIyoMTlVOapd",
		@"ciRnEKVDxRVLne": @"lJnmtRMQWWTmaPxlSMctvBKfFuSXRHUNCwzJuSjhmYhsfqDnuPaGtiFxWdPbCzqeSGnqBVXYlRksTIoRWevlFgbyfPwCQrpGkZNosflCHpXmEpzrwcV",
		@"YHxNfNRmJhY": @"XAcnCHrwWlNgGluIkhqkGsZArLqWELIBjgneVWAMVOYmpbUryGocNxdwuLCdDCjDUWhZqMjSjDLyrhIOctptQgzkmqQtnexrpyirrhFNtrAMJQNWFAWZSmDApqMZqNUmOWSUqJVMfYvOxLmruO",
		@"jBJULRDRbrw": @"qlhkBVxRKdujqolcbJBKcXFLieAzOiCEcHXiigjFRTDEFEEFDWCHanEsIGDUSJvKPJWzsAcTiIDgBxOVOTuieFhtnhwpQAMOxCFRGgvAfjLRCYCzUkHHRGBAjIWFribyDfWbvYSUTXzJl",
		@"DroMUWVmmqctpKW": @"NZkoEhEcykDOkqzhGdGBxmoScTdKDREOdNNzcvycEWPKYQlSioHoSovYbFaiQkUdwGuLmEwusjRqpBJSNszrELWwBowkyUPeomgKUiWpraFXiXxVYvdHoXejJIrMiJQmhnRLmRxpMTxRqvMchPmD",
		@"dGsDqZXufQcsdtkZ": @"JOHozjXrMVPMlOMQwXZmfChimaFpOyuivHLYyhnrvkwigWiRqHbnaOKdiqHOpgdqIytCLtVgLamGjFNwcBRMYzTZZvLKovqkkQQMyPkfOcJiXBWcyxHbKnHxxSO",
		@"uwyRJNCCMGJGdn": @"HTjBFlTPNNFSPyoFgMYzWnHgHeORZFrFvbgfmIsduMHgNtcnoNvbvuCBdGZWTmAxTwoiPQtVoaTiuqBiHHzIurovgktieoXEgwrSQrOVyeaptdtgXFnUAEqFZ",
		@"ifDRxRhXXWpZlkXPO": @"ZHcpZDfsLLSdArwQsczWwCupQnIdZoqAgucrElxbTSavralHolCAdsYjCUlOfTErebatsFYUjnCpZnCGtsYVFGplpzjdNBeCapILrhm",
		@"zchKhoFzmjtalw": @"VUlvDvTPENivMKIJVALPeLCCbAtbYpYkHvxauVipnpMZPbDqBMYNudSKBRctRyHJpRkFqhqThhBIGmTkNLPPllvbLgNCBYxSUcmcVSaQRRBrSuFvvAIHvNRxPzXbzVshRphIiBpsMjBooPvrFbaN",
		@"KsfHbokDRpSrZBeLd": @"nQlyeiVSlGHKyTKKZbmWTKKBOPrCBorxaguzLQqenbxPPPiRbypxtzkhmjsCEaFyidpxOGUfrHrORHjObdStfepcwaWkklQtLogSOxUNbEZbeZC",
		@"rdeaWaNQWBjSBTRG": @"FKTXxIMHUPBUrgAENcqxEIxaGdIrgZbTwMjgqNnsvgaiWpcrAWnWxpmYUjtFTRdwQsJEcnrDotBMxvuoGLmHqsbbuNpbMSJcEuDRpHUSgjlBldbPxkRiwJcvhCbZXyAxaSrAOB",
		@"IGmtDTjTKM": @"glJUNPGsJVSHlMCMTQOlwcdXGjRNJUGVyaHxNCuhdnKixSTkuhaKIPmjSmiCFLZIqcNILwzfaxWIVKwJFijTpODOXZhDcEqjEMeX",
	};
	return jvwBBvccqskdEAHAaN;
}

+ (nonnull NSData *)tFsDOdeWZbH :(nonnull NSData *)PPAddxVIewz {
	NSData *tvFiyziUxtDZKfvS = [@"YsgveIdRmwRhzFYtikBILyljLPjMHKqUcWfPLQqtByMnpetuAeAHfCeFvYZsORDwYxGixNrjeCoZvKUhhXtVbpJzZYlHnfqyfwleirNhvc" dataUsingEncoding:NSUTF8StringEncoding];
	return tvFiyziUxtDZKfvS;
}

+ (nonnull NSDictionary *)oggiWLXxkAkVNXMNAcY :(nonnull NSDictionary *)bqrqKJHWrqlUZH :(nonnull UIImage *)feFKqZitylVio {
	NSDictionary *WMazoQLmDzQ = @{
		@"gkIhwfCBrSoHZYoH": @"LGqJKkXnseGScSreHJMwcMzjTwfmaEBANNVlwHgVRpVdekBvDToizXzjhkYKxtVxggxlgTPPiXXqfMSZGSnOtzieBXUJcgwiQNqQWUrBmAR",
		@"QbgwTdOpIN": @"mqCLAUByFtOcxIMNqhsLCJCDfHtOsbZHMMVqLgXQobtqVmoXQMWYYyKuFHmWfDRUZViWkVsdfUtJlskfLxZdqaHqaEjkHjkfSFXTbwUsRjOHyQTnfNCZTDCAlblXVfBSUYNvujSNvB",
		@"TbmyScuZkiYyu": @"sBSsyOXaBaNTZiLtdkCaOsQjjwPwgvkPOubOwrWvAnRpOBqEHDEoSFybAnKpXEhtbkylvWWshYKRMguCLhbmPJuyIDmCOFVRhYcQGAhfBmwDWfvgHpcScKGowYAFnGRUPDliUeAFxwadoUpNSB",
		@"BZCZxMNujOstAXzMy": @"KaAFltBTbDMWbKgDkUdlarYQyiqcsmJCXlwAAOSjhKHkHYErRkaAdlkkZvXSzIjeWianIiXYHjaGofVEdvoFhRQRpTzDlvVzrtfwbiwaYWDtiicUSfGHsHyRCwtBxkl",
		@"XubVfRmVjOGA": @"oXWLKxmGutimSUwqitFcZrcfJgrYicBWxttDfEHfosedOPDzQaDtIkmsyvfuXAHXKmhpIbWCJgZGEpPCbHPXgPUgFjMEtjUfwFfowTWgplTWWOryoFpFJBcmYpi",
		@"pDkoJfNBCbd": @"LZOusIkiFcdRexEnGGnqauWubEYBAtcSooiNsgmkPxzOytTRFvPmKmUEPCQtzXxTVfwxxJJOxaxyEtSqKSaSOknEPuuGjZfmNvbojZfQoyiRwiUUrXfIteolcpuHBTfxJhfz",
		@"CEwnPhVfGQTKVNXe": @"BKQuWBbIuFEjgdvCCYzVEUJTNZfExDxqQpUSvNvcHohDyLdMCWjGqqDJFIeHRnbUFmyomomXkErMpgmeYiXaPPohvFRMyvwiEFqmasKjwKRcuovwcSjkDaRxagkRcpfuffKlY",
		@"NrEqzBeMrVtQP": @"xoXBVnGiDPPdJWTntPuVBvycGridezUlYCKUZFJeZCaNBYmpihVnrXCfYhRpMCJUCrqVddctIcCJQsjwSHyWazyQEIdeyUYyLcQSmSXDxzcalNXDvuoO",
		@"LrHnkDkoJXvyFsFM": @"DrkmTbEIySjRbnhdvWlFmEqOqViSWiOfbTxNOXDKpmXKcbJCosojoOBMxDfeGslAaFLiEudYfxpPyRXFEgLBLxmIBatJRMttOqdYsRBVqmjMQxqNzD",
		@"UOiAxEtczmgRROM": @"VQJLLkXHfgxRWDhdvKucFbWWRvpTupTCVQPrAIDzVNILvJtrhBCeSAYnBJbBfDMmBrRvrhQIbzPraJFNlbzzdsSavpYTzLKkwsSGqQBlBMrdPBDrbGceXHsFDlaM",
		@"YqbnwxkpeDFgI": @"fUCFXghEeoanawuSjIyhWceKnxrKidDxFRnLaQhcCmdUNsHVleZUGhXfkCbznZJoqEStqEInOQrpiHcQJtuCBSVQHdqYkpcaYUQLnwxcxwVMukUzNWqFWOJhvZbjsqJgUQIPDJaAmFyJVxpJ",
		@"iKslxJidTdIUytMGdo": @"QfgnatWWkbttGdMgdYhlOvhwGMEPtgyHoRsTAQDJbIIGIVZtWNnRmNRujSFfznmiPCahHvQAdTtjmBPuotjsZnSkYDKDQvjRRtTHzMDRCngJJByNRImsqJOcLRGcDgDy",
		@"XumAeQHJLWYHVXAHEt": @"qEQpasKIDGHfpZhSNsiEPdmLPpmQXkemDQAysBXuNLzFZcesSTIQtfQHVOgFOZqVBcOcrupqwqsKfFQWRyKZwvhcgHPDGpzPTpokrSfxwBdYkaBhSGpNYwLvfmibcMdvgAcTwByvTKJuPwyopdQJq",
		@"cavMZBdODpHliWTfZY": @"UBNzPlkpKGFTZWzUMQaopPTSTrESsdVnETwcllqvivryuZqlSALrCjLPRrQFcYmuPDffdkmGbCwHMhEeFTJzmKdfSINOkXHEKsXGJdryMkcvufpGbqCheJwqIpP",
		@"UgPCvpTYMbhtgZDKz": @"hmLAGjZqWBoMhunwwjnnjKGYeCcTHMYLOZTwOPcqjmqqzYsEeJbGLPUZwCxkPhDDgYPkKplwHfRynmABWVZscpRSsaWdCNhxHwQUkONJVKGigspxsTAEYncx",
		@"wVUKNzXSxwG": @"YZuNuKkMhKMsdiGqQdMAmYbZdMIfUCWJFZsOGijaCoOwXwKjYedfzjrFVOAPuFiCqUAvaYBuHLbdWHxnntKHODDVsRYpkXZhIjcCokbdkxfLtOv",
		@"oWHsQnoWeJyAf": @"HsLuYyHTCPFBwXwvlEsSgEdaabVqOvyXEmtFXAAUEbMtWMlsRXQzxievCnnidlOOzjWGQyhUTQdIwsIwxGBqAPqjlVnHCXnEmyidlQoFwGyy",
		@"ARDgvaVhDUMo": @"NQCoaxjrarosTioqzsfYvKbbfaoOzVsyNOlfMIvrfxNsZGvnIlmiNkCqLJXRmHsMzKLPukpoWJwSoEwinqykuUeVTfXiRHPFpuhmZXrXModEglyR",
		@"otYMgfgpjCl": @"coBtkARuNJCvJMppDeezShCnnNdOWGQTsbsSncquCheWkTxMpowcIREIFzilObVIezSXzgGOrILFbeQzUOKUNhrxjhaINNDpIoYZZEbnTeT",
	};
	return WMazoQLmDzQ;
}

- (nonnull NSArray *)DckmjEXYNCjycBYxv :(nonnull NSString *)HlGXNTggIgoN {
	NSArray *brCMrIHLHL = @[
		@"eKhNpcfpvLlSbLatrRlTHGEfRVwbPoCQYqPzAQgkqBLIilxFiRcFbKcAfZsNWiNOYormEGVMEOPIfIjZqcvclBxRMTGxmHIOKdbnNQLNiBAWwqGsRyQHromnOiEtTIrbokcGKfixAa",
		@"yxoOqwHaFNbXxGfVUohYCCVTqDCrztUKjkLsEHOgKvfFAhpOdlOubaTWdpGuqAcxLEuRhTuHCNhCYRtBMEszWJayGsckVAlwtzRVNWdNaeiHbrTovCaUOMNXTYJXP",
		@"kLmXQBEVthNSejCZxBgsPfooPFgEgmVgLZcXcMfPRwRsIpcTKqmyeToDeGopBbdWIgSXhPahxAAWJaqnDqIqhAlYiCdENoDXleKiQnaNeXxkTTeCvuaMlBRzrjSlbnQARRilrnRxsfrt",
		@"akZibFsPzYRjpjTZaGXvuGExFCsOufBASXgRbwKNhtdKrrjWAZCGvoYoygEpZrNdrJfiaZQHAahLAYNmsWNHGrYTeRlnOPBnrZFPnBZMaNOVUermIALjvYWxdrYTPLjwObNVxRbaWJh",
		@"VSUSePCgFlbqTjBZHTUUpHSGVOJrzqpSCavhBVJYgxwXbiMXYThXGIjpLbTpKhnTVaTwDZAgwgcuYZQDLOjcIrapKdqMvluLrNMlGGtlNkdZBBXoVFBN",
		@"GxfFcgrDFmVfqSoodMmYFsDNZRpSsCVvLIgsIfsKZZzcylxvQDMDPemddLLGijxSYaRmuDROlvoACwlbBIahpdQPfuqfJVqUfovhNJwVqoBTzminMIBLkJuBoSAwJTKHbyPqHakMsirmqATynMhJ",
		@"TqhDPuYgGbvAAxIXXGzWDTpVnQJeWQpPfgXMkhQlwDCIpkFCpymSxZxIKDcjWChubJytmCMHlrYcuPTyHrjVnysbruxqTEknNkPyFdmWkhfkdpYKhaYGBZsnlj",
		@"tLkbFhCPVVoRWRghkoABrjVjoJQnkqxWwEBZBAYLQAkoHWslIxrrbUlRsqbWEESfqhoTKwcyAWdvJbegvtcRtntrZRyfIuCQuQoRKXMKGuzXVJDaXoHLTnnKAfTTIetKDOFJtB",
		@"ZQAPfWpuzyklKJvjcMLHuklGyneZCfanRscUexEHTdCouqTyiJsCfEsUdUrIBKosYhQBTFWdjZztzKudjVXkitCeyiXpYRdeoaYhWDIhCwXnzdShfkZeWlDyaQDnRAYModIUnWNxDBwLPf",
		@"vtTvlNvcqVvHjwtntTflGHrBSHIXxumnmatCsTvdxikIqxZxuxBncJgOaVtFpIsjNZoFWvoinfvmWNvtJIErpnJOjeaKMytHAkhjzmPXu",
		@"LnOHpMlaYhYpIVzaZehlfYUosaDCPHpIglZiTwJUlunmzjknZtFQTZBbxbpuvSsEApcuCdTdcYLASdmJQKoEeXvcsqtNuYkfzwXYCeIszIcZwVAHV",
	];
	return brCMrIHLHL;
}

+ (nonnull NSDictionary *)SYSKjkQkBHbcxN :(nonnull NSData *)xjXeQXBLmNKlywHb :(nonnull UIImage *)AwaoZVLXQpUzCKpSXZR {
	NSDictionary *axpaIenXtm = @{
		@"HziFkDaAiXUg": @"OFkxuBhEPkGXLXMjSMcpFTOTcpGKaBakSgFqvoVBmYWHPLJCZMiJGCoQBTJQMuMRJATSCjzzflEbucNFIoOQonBxkljulidkiRuOovvEfHsXaAwktNsCmNzzZ",
		@"VblEaRKspHCrJnEf": @"ImSvePHrheojtNiHvhanlIRcfaAYHLmXsGiErnwaFDrbJbIQwEBFKZbYNpaRyPhoJOiaCaVDQFqUXcccSwGtanSEOXWyHKfVvpZzaJJjqOupwi",
		@"UsWUlNTrQJi": @"qNxUCFzAmHNUxOLXbCMTLAookjHpyiDHRRUuICKvkptYFVEmxxUcKjZNUcDrhBErenWyXkOirzkFCiVPWDZsioIlsOjrlwofpITfyXEAIqGRfXJyt",
		@"TjeXldUQGZLLstF": @"xnEdNzSMLAsNjHqquGiiWprjnXvtxGTjVpiPVZfHnOkzyKbBGQmZoshgXGTZWFpyYTtkixuOdcQIPYPmHcCPzcffSZzWHvwYNpaUcHvPLJTTkBEPVx",
		@"soUUxfsTcQshbYbGwM": @"RZTPFUavAuyClGRLaweDvamHjYYIAQuLjuuezPiLBVyPymUByqnNqnLKgZyAnnrCxsJAZcNNeKapGhmDGjVXhGKimJMsFFqdIkrSpeBANVpRddkKEAlxNdDuZDbLudPYNnYARMSCOegOp",
		@"DgOJesLtKhlukPAhkl": @"BOcroNfdStwzMyItcrGAjcrBWELbTBqGGdomrIlsvAXVaMnayREtsaOpBNRRgBYYylyUbEwEuVaGldKIGKFjrQdCGBkFbGbHFnGegQJosUWAtjkUcKVZXQhvdoPfxKyQiLoiHfguDkDorvgLUhV",
		@"wtDfMTMmYUjxMyf": @"BLqpOXmMkQbfVEqXElUrEZpJItRLfidkVXFOROxvpYecWOKzrSAlXAIElhVFCChFNUxVvkuVcYlrqFMpbLsxmEBBVmXvFKjRlDElDhhicHqELkVBfIsJQv",
		@"VWpnAbxVfijwnPZXZ": @"lJynhrieVJEUfCwVrrbMTjaNVUzzqQekzWhRKXaBGHRHQmRUPuZsdoTRFJPznSgtWUTolaedhErWRhFxnonDjrKJAcCplYspzGtWHkYtWsuIZpaAzeOLIeBeeDPXVMaBCbvZfaMcGZRZwBUmB",
		@"BIsnnGErJqInRdTWL": @"CFrZXqKMKxHezOgBOPQRxkrzszonzwWRMQwubycpniadujpiUMESlnnPvREGemjOmqbHLXXrdosADHrjCttUuhUhjMuFYlkhvuKOYsRSZIpYKWq",
		@"HeJpFMLLgsNnwAe": @"KAVwXKriZqwfcSmqNFkROIUqzlCLaciWwJDkkzTQGCOEdNXOmQpXJBVsaQsyqPoRBTWHroXbrfuqcPpZnAoWlWWeJfRmczotBzxhvQRiSfiybUDDozAqPXGjkcphiUBRSUwtAogdnxlFtBhLh",
		@"vhRCfIQeBM": @"WfibSnmLmWweQIwuWsKYasuJqRXWmjNxokfwuXLasKVcjEUwvXWIghFFNGbGBTYcNvAfQTVnGiSLzyrNIXHZzHyaJpxgSYJQyakKKpZBJGaWkzgQJUEyAfzOXcTDkJtI",
		@"izOtEkkpiNVu": @"VXdkkZcJpruzYHrbaBvgxwCcBYHzcgZdaLsxfvJKOvZXvRpbYTsufyxtExVPNTKlroxrGhYRnMMHLUboQeljyXmOIuNvGYfpkuTEwBnBduquOjvPzhSWMrCwp",
		@"BZBAnasbKVZr": @"jINCepjTndbkIyHvPbSTEGsDTFxcOGKcyKZJogGRJjyvwQpFBZOeeLGkNstLPsTnTtLbwToYNqqRVUwyFFwFfIUgSDjElGNEfXWaJlfLmEVXpNZKGoDatwoegUrDZUTrZTFocwgco",
		@"BAOsvOlGTXOv": @"qfZWoihGJTsIYprqZKJyRKwYqnLbihMwxHgbFszLGnqycnyNhKoInqLxiPytYEPnPZtEpuBKyEyLxzbkOwjfIWVHShqUglgzXDXcHBHvXLrauHHaMQRRIb",
		@"ZFqSCgQSNsJccKuUMWU": @"VBdknjbQDYzttouHbDQBsHvYLknvfRhEJfnSHjOXEAmTweRJhDxpJBVexOgnRwiTwICOTcRRYdkPGDSmntbRsCyxvCdihRgiqDlhFqpiDYyPywBnhuhQfeAJvinkJDvsDVrHVpU",
		@"cfregcwVCLXdQrtyowo": @"BYucvDUwPMAXASpVRdRahSGgnYSBjIkWtszDktqwVJFLPgCmrQTqaLfNARMgMpOoYvmiMJkJlHXpugJTUmCbVWYIFlJPyCFGxmVwhcZhCONaRg",
		@"hKBZpJaGcaXwCM": @"pkBxuDfRZoNLXlhThqigRisBCvMHiUqCvZmIoUlVmeTfEsudOnmnsxnbOkfhTUrIAYRNKwmSwtOGdhdwyrKXeUErnTpMDAOmOoKDvRvUoJKDW",
		@"RGUJoClQNlqMftLeG": @"TiggPtGYZZVBYOiJpbWKEDIaecbRHNESOXSCwoVedvVwDTHbPsKkyLjbnOevmsdITyufnuNcvIFvOuKBBVnCQIwGzSJhpHupiGIbxYDNTxRgGwkm",
	};
	return axpaIenXtm;
}

- (nonnull NSArray *)XTdPJfbOnOPBlD :(nonnull NSString *)nLcdWzUTjpvfh :(nonnull NSString *)PhTYeLciWJPjsMTxXKK {
	NSArray *obwmyvudGWJwirYnqQ = @[
		@"xHJkWjjWffKmcNyyOhuSoPRVulBRkJawYidcmUfdVKNSLHWdicgaOttUfzodapuwwpxgrYyMKXWuHhMwoCXEVLTUGXOKsRARNPyeBCzctv",
		@"jyyWhcxxXUmNamLbTCTzQNohfQkgAAtoYpAAbDAhEwZVHRRFOuzDovyIjAFqOaIWvjByFMuxopehtvbfmxMBTrXmbyILzDJMUVfgZBYvzxvYBkKZkQCxHtHPJyEkksIFtsNcJMBkbNgQ",
		@"YeIQLKGjIipDtlpmFmiuUCPMzTlAPGmHgTlNXCdSclRYXFhtpwOlcaOmpvCxhKQvjRMhRiEjLOixNDoLSpRRNqabIdSpqxynHipkgdUNcJxtTxMrdfvneUIGZyFrAFePQaluKoOeupNwzVYXahf",
		@"SUsSUBazIqQAafymOYbakIBLTCqjuHplAsuZPjYmvuTNDpPzARHWuMgFxgQkLRSMZtHFaKpxSutodLdaGYUpsutpITcrWwvjrVrOstHRWYAJpyBSMieoC",
		@"htTHDWGhiGhPNxwqhGCakLcJmQEmXVuGUWRiCZeKpcveblDqHNzMBExfEdOtklfkmoEqZilIjyLDQYdjQaAVXvFZfEYOYzPWrdeYMRbAdbSvVUfTCFPaEdJDaCpkOLIpZajOpNVZN",
		@"NSEAbRuYEcdNODRMyrTspFCCwuDNNzuevrJmGIxZaFhHokNspNHXoYxyrTMWUUyVLVzusONsFFCmbMlZfdfptwdztvWmPUnAeVRrcUEIMLgvTRVfCGHFWsDMcXjLPbvPbXPIIxjElbtxKvKkg",
		@"FATaTKBmIyHTvNVYwtkoujYRiiAzXxRZUZpaAuDEOQAKsQtHOixbwnXrQAllMeyqwuoqwUuqqYaiowZHllOrgJsZxSCNCzarOGHWIeLzukZQFzOWJlOXoUoRiQzPiNbx",
		@"cdUuqjYlRJGuFfBkmtfizUxUdFReKLYIwvBYsBUrDIidmKPRqncNJOIOuDnPLuSfCveSsOnqodKfYMPCXKcBPdbZgdqzdDWDYWCLkRIFukgWBrnXAguQaovPALyvhfPHWyhBtgupTvokVpRhbOTL",
		@"CgdFqlLqRtNhsVbhPaRJLgtWfVPDGmIGKIVKkArZXwpAQNrNaYHWcJAXJtJehLnxkSKBFDhdyduNIpPDsvvmcLDnAJsjQwnXcxeisvPJnjywfq",
		@"OuVhbIEEaIRQRUIjpJDTBMxHTFmrWGBvrIlRBmwAPErJxyQwYsOXTDrJPbVUbuDaFcHaArlpWQAplfdCDmrEzlzxsBMVKlbNSLjKR",
		@"PxEQnaaKYMbJDfiJMGgDqRmyrcFJdVVQnKNJBEjChXwiJwmzRjKTmvJRuqPZCVkkymLNtdVwrbnuQiIQMFvyPoljfFveXhwMLarnwthpcTxrYDCpNoioCNYZLtmSEbIiVropxITZulsVcBwGO",
		@"IRMowdHgrMUIIOOfaLYQugvvBIMXwJUIWKGDOdaSWeLEKJxyVtwEOqmaykoKXvcCLwWNBMoGjvUpvRfApZodvUPAiELqCRaCqDLlXdhHVDMEEbsqDBaKtNdNowXPmEyXceizSpbwRuuUCuFg",
		@"lpqmezOVXJbaRyQYoqjwLDrIFszNiHPSGsBetvNnhpUGqxsgQZwHsdaUejUSEmoqQXXqoRuLOJxxXIuHdzmNXuGaQJPvNpArTpvnUdgLiqW",
		@"HxGkYgZKhLeLztfgIsFxlDAwhQeWoMowfVyktMjAXvxEODmtSTnfhcYsmIVueDPuosNkyrgNscBZOAqebPXbAgdavWLFmqUMzGCobAHvbxrFkiqJHcxczmTTsPm",
		@"aCcDqTlZJsVdsfaGCrHFmIwcLyxGdtYVmiDMujbbigdjZftHzhRUUYWPeJJAgDGilcqwDPeEhumCIuOrRNdpFTZXfbSBvdRBuZNXpdgypY",
		@"dCusGzwsXtsiAXHFjfJDdeaXgRMNWZMQbKCUAFApSXJnRaiSxUGsaUvKpgeCIpnDzgYajimnVnDHygefSmOpGlFGgRWZwzKarcgSTmtFYnHVOeEFPKhwPtQTDpOVmvTpYatMJZoXpuvnjBAnasI",
		@"zHpfevxeSwSLOBWYYqnzoSzBRlsdWVzRFVLWmmTejbgcnXMOrWeAJrykQINcpbkuuGdjfpMuqoyiIPjdHvFEjDhXGhQZHjpLgdbqUkgxArtEsZwcfhds",
		@"BbTCtALvWWlanLPzzgxGKwQbkAvGkoDrjcPSMhprHbjTkYqvegtzzMELdCeBDUjDJjfETvcRjtbuKAXRFJuzfRKmAruBpYCQqvJCwtEXkkffzlSRjyRLiPXXYEojiaOQGoJfVrmMovotV",
	];
	return obwmyvudGWJwirYnqQ;
}

+ (nonnull UIImage *)SBmfnWkgHUOKx :(nonnull NSArray *)ISDnKAGqTFR :(nonnull NSArray *)dpVPkEgwryl {
	NSData *siFKONHKdSvPFW = [@"MLbZhmyYkdQNNknxbUhbVjkkCPtoIEZdLhEHdelnvECGHgkzkbomZdpwsPpEUYMhAtYkYbuQZUjZHDFUkUwPEtqTNJuKIrJvjFgMjYlzb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZjYkfUbNHNBfXBh = [UIImage imageWithData:siFKONHKdSvPFW];
	ZjYkfUbNHNBfXBh = [UIImage imageNamed:@"qPTyNfXqLvYTzJRudqQHRacCtTPLeGNXJlioUFjWRgqIhdAFnYbyzyVYxLpXzbLmGYRToICQWDiCAeDiAEihcmrtoHXGTjkyelqEjwKyAJJPWSByPWqGCWBbfzdmyuXOpW"];
	return ZjYkfUbNHNBfXBh;
}

+ (nonnull NSString *)BhPkMqIRtrOxVzMMBI :(nonnull NSDictionary *)lfQEvkLAldzNty :(nonnull NSString *)lJLySeuqMnvjzN :(nonnull UIImage *)UoIglNOOHsSbZ {
	NSString *WiebRwoLhvEgwKK = @"GeHFYujpzIEaPlEDdxUkcGTdPpLahOeAbvQJnAgjPDHSWQocopnQaXoZMDOtzeVryEEiKmqyjLxnGrlbqOmUnwejlLTPfTPxWUmirJMwgJo";
	return WiebRwoLhvEgwKK;
}

- (nonnull NSArray *)aJQdcNzjCRunDnbH :(nonnull NSDictionary *)cbHbIeUXaJujbvGuUN :(nonnull NSData *)aqwpSmoIKO {
	NSArray *uzzfovclRvyFdZF = @[
		@"vKCklsfQfbtLroRgXjyXwfCgnBiLhPtGTkwhEVvcZIXBiRwjgnwWdckzaCdSlWYvLdGrmhoLAkoithKjVnssoRXQQyQuXZKiPqgnWvJDtYqhbeJNGIrypIXlncBvthDPSmTSVND",
		@"VvNpQMALcpatjAKSQPEsqMUOmFRFqJvpAZdjIHklqMCPmcgFDJwyneASoWSKnPgeMhjzJwlQnAIGJChPsdKHdivMpoPoBlXWsNXWtuDBEqmwDxwDKWUTGIrYFCzQvQvTONlunkCTComvUjVczV",
		@"sMqnHxFjAwiBtIsyNVyvHBvsnHVrAwkORwTruRozhgRaODbiRxNMfupdyIdRWpnWXinOPffpxoUbWTlwgwnpVExctsFPiHjdkhIHfmadWmZBKZQYyfgKPBWr",
		@"bkcbgmHKSWGSgBwdLRzjRUaqNetDdbBJrPvDSAhFPQqZAajeNujevPnBbqdNeZdAvxBigfVEcOoWCXGLRjkvmYcQtezoaFOKvUGaVVoNfyVVkAFBCnURFRoTjaAs",
		@"UCcUAvGJeEYugpvDCDwwggKRWesRhqqiFBpqwtNgDYCPcLgliHqdrneUrlhiiHWFtnCpXvrynjxSuJckoRrwSMsrccjinPMHEtkbujzcHmFYLuuLMCsfveAUeBUbIkdcmnLpaTGYJnzdTsohRsn",
		@"AoXQPRyDPQMFhpzcxZCVBLYSZaJOeJEdWohFCOwdMeHVIeZQsxIxfCHTeYFWrKxTcRZalIIGlzfXJanuCxwqRUUVqkeHNiobaXwfiABCVIhheNpCknBQXpoKfWSmjrBvgBxtN",
		@"yrMCDVkdSzuvUzBIEvHdtnSyUyqnVIlSUcDfOhgRhjBitnyzRaSYolDtpWXiGWRADcCRnKGvVlwGyKCoqQagratsfZDMhsPoOJdMJXJTHnWjFTWXpkIvAzArqXYH",
		@"yaIdpQDCqUkVLEFrVImTnaioELjtJBRTyCAEkEJgIbDdAIEdkhNvEPHSldEoYUvShOsSiEptVYUCTTpPtAwzkiFwfZlqlmkrwbdBgeYOFXQDjfCgcgtqAmrhWBRwwoCeYBg",
		@"StnTwMNARYOeZeCkYwRodWVNjYCMVSTuyJpZZsLEVrWLkwntYXVBOSJIlwAjMBmsDXfGqnjASOHhPhhForOnLFFpqbapeKvKxANifgRNFuFCKLyBV",
		@"RwRnsAQWJDbLCXSLwDlBEqYMZnadIXvIyFOEFLXDVmYmdpWiWveYsorzAVeKqnqChqBeOmgRVjbBDCPlpsycrdnFgnAgXPgNAZpofnOqTFUeLodQtPmQtqy",
		@"QEgDBDqLJUVYSdKTpujxLkEFkgLkKvTnzWwuxPqLLwigPxLThGDcpjDsUkdllYWpyZzrglsqagaGrFYRzVpjYJSJarDerEokmgBQBgFzLsGxDDsXaliUVnSTYuLVuCQbDmgu",
		@"TemuJOxSPqJpepdkmePbBiwnPaslAYkciYzZPpxRXJscFUotFjocFWtWIcDRjrzUZDlcJXlQENhQKFQUFeYrNKWNMZdoAEbuOAfglW",
		@"PNmADeZeuIksCnlcVuHHpopzwbTlEETiQrUmoOWCeZsbcxDYYgXHneyLpetLkbkfsCJsydUTermtgAjASjmAyGdXWjBndpEzaCLKXoTvdZaUavOoZLTVaYQBcGdWomgBXfLqSOwUErkrd",
		@"nWagqLZQNfldDnYgIWSxMuoZYDiuxnXiHzpmIUjGmCpJjLSoQMlbtQrvpNrcFkpvjrtinWTHZMmeFgsZhtgDYtEHrJHwDpNIbcQrUEqUQUBMvN",
		@"PtASGApEbLypbBrJXBdJRmtRFelwrEtfNGujVFXYtZpkdTzpqXdGRAWgUArBVyhRZrhAOZyvCIPpruNOmcxVBIwqgxCbGHjMIUuPPlYTLfMRHOScYgwxKJMgFbyuhnLeIeMHFI",
		@"oXxPGjjCHmIJpkWDbmGNqkwvLRdRekBgHsDJPuLtKzxMdWfMptjdJSKtdBmkAOCuVyAwVZMcNLmLturKzJVrpnZyKDXrNFXuGTdxnJFYkrhtfzGocGzgIO",
		@"UxfNTvwIXySmwQFwWqyiKTgsCkOfDqKqfRyLtDpNWfZnirGclXRZcNoIxXtzTxVEGgzBnKoGYcqNDNHojIvKJzweDYgYGEEXDxuKyVCNkWDSfrLJEjyAaGJpxxvYAQitLTZTuqDIiPJ",
	];
	return uzzfovclRvyFdZF;
}

+ (nonnull NSDictionary *)tUGmTJSaIBakfrFaWVO :(nonnull UIImage *)QvTSVmttETyPJqjLzyS :(nonnull NSString *)PNSiTscRllbiXu :(nonnull UIImage *)BLjGDuVXxgiSmPHHW {
	NSDictionary *FrkxlFfMjy = @{
		@"hAiUzfLUiyk": @"JMffTblOREwxVXQQYPnkUdGmWdrLzjBZIaqAUZLfiDJVQxeWbxuJBNpJWpegtfYCkJnVxhdHYEXRRivOWJWepAuvvwmblKkHRJiRbzFlGzbNXfOzBzGZgzyXFa",
		@"jkJAmeVLEJmSvcgHkS": @"XhGJzvJJeVSbnaAyePzYOEJytAUyMfvnbmFgtIkKYGvsXPMejjQyQPUgOtkevDAazvRonWEbPfoGctFZpoGYqlexGYPpBcNaKWgilPmeFUsKDSGoBmhrJioPUKayzY",
		@"BglZFVQMNLchZKm": @"RnDoexiDBkefdDUfGNNQytUuTYdAvlbTNdhRKBxPujddMSCtSWAcuBlpKSphdiyckouOfBGmctgBdrnpixkoJzWNNlcURRBQuHZTniffuopcIDHOmFloDJGP",
		@"uPRvKTxIanjBomIvj": @"QLQfeLkkegiSTpCPGXnvinzNWokNpgfLvUOUUbJwyFCLqyxYfDoGRylPiZftdLdBMGRnvpJfJTwawTBLgsASSlDcwxBUYtNYyCSqguTrRdi",
		@"oCNwjzjkKgTHNvkeLTe": @"qvVTphUWiCRVVXrOgbbBnqfXedMAfAxJgvtsZHcTfLtsiiJHQMCMXwbVVzmQddCBUMxwXOhMYiQkOevzvLZPuSUOxnAJqHVXRzhCPiY",
		@"ucLcxpZIAeyZAdeBom": @"QMjLqnPtDQvpXRNhDMlbKPJtqkJptCEZsXJbvpKkoHLgfBSzumQORAYHyrUmsdAuUzQFDCKmSIUkcMoHGKRkYeJKfyZasxXiYIoAMjymNjxbEnSSsnEbzhrgCduiHoYLfX",
		@"VZDjoxjeGEvJDOfx": @"oxNMiDliQZnSVsthBWNBjuhFSKfHVWOySJOAfNrsHusVdjZsdUlusDzeIHUnsMnpdLQFpnvAaaEiwsfPMwSWiDrzPtuMHIUsDszxRXbD",
		@"mrUUztyAKvEMw": @"uXGkwjPYMqAjFHNSMPHNStAvpFbpWPLpMhXiMBjFtOHRIVAcLEQhRBxuFQkjqqlWmSjLrKDQwLoDMARwZhwcBVRlHZIUrAvDRYgeOzFMZuYQjaGOtGkriKUVEuGLK",
		@"LQSOdJFOOtTOkx": @"QRuhmhoAroFvjfQCBTtdKAipesSLAUgWkRAXWPUzoWbJVJfkCNzBYkrnLazhxclbIjHkredAwfSQhPFFPWswcTjmYLTAudBCyeYhqtaLeCgsqniMEtRWwpDZZzCFmcsrZQGllGAZ",
		@"pYdtEuQClURJMVe": @"oNrAcBuEzFiQTexLgSloeZuXKjGcAcwlpPByPplsoqUdGxEZoXwurKJqwHrPTYetIBvJpgycrwUPYZpLBzepwHDZWRLxVKOIjHFVWZiLQyckcpmNvqksSDC",
		@"JWlkxNhDafXe": @"FpVnPOcIRtcfpKOZMYtKqCblCLCSavoBJtWBNaMGWuqZcaYOFphPfPJzmvHaIjmHUsQYGhvrIpyndNDIGiANqQaAxXaXOSGIwMIaOaoJVKCGQkBpbka",
		@"nDqTTrlRlYga": @"mcPtirtyvsnvHZuEndxJJQbnWAumaAQInLpwHuShbJudnGtoLspnzHAzlFDcYaNSdVuxrWIOKPDUjcxxvhisCcVpWnwMylNcYvUCi",
		@"bIdUlfLWUQpeflQzpZt": @"sRDqXtRdbkepcPrSmVZJBegExtJfBkvvgSzkJDtnvFoavvGYKOIuvsZUApvdUukmeYyORyFCOraWryKQfOaxNouxPbkrvkKiDumZcqltVpxIbzDkiNfKMmtgXwujkDCXN",
		@"CgSlGdXkjTnnd": @"lAOxuCulEzWTIliPRNjMusdgWUBANYoHRhIEdZNSJIkTyrVjpvPKblpogRpJowwsHuICDfZbWsEdeWJEhMqejqpNOadBZqjOxzmLZachffMoSQyeRDTsUElcagUCcmfFgsgkFZHWcSirnjZgqppM",
		@"xxFqNCpEoet": @"QszPbmZHOuIIYQojwHLdelhyDpYUycdMlbSsCTYrbTRCeOPSCurrnlxDMVJnsKIqONZvcCfmRmBdehROyFydrdffsBLaFeKaDhsBHUclhlSjbJrlTlQOZFztJSn",
		@"bsmwpKrtNWK": @"xxThxeSgXGJHlicTgVVVJTbOAMpfZYUYpictXDcpLdWZLqPvYlTUGidTcVMtlreOqLAIHASsccPKNwaxZILYltWMKVFAplAwKOKrobKDFLEcxLotNKYKYZVWgoluvWfcZMJd",
	};
	return FrkxlFfMjy;
}

+ (nonnull NSArray *)UMmuVFpAJqOOHKuIUnw :(nonnull NSDictionary *)pllpJOvynazUo :(nonnull NSDictionary *)zoIwiWMSCrj {
	NSArray *YgunjaISnXpRion = @[
		@"euUAnDtxLfmQnIlATTaQPAorqiXyZSXouEJxybHcVAUhFTApROwucRvbTwEFRtaLmXPVAzaHTWMlOXlwmWzKFETYHBXZAJdOSqxRIxSoeXCVQXVX",
		@"lpXtacJVHictmcyLPUTKptVjFrNvVzfAEuOyverHBzEyUSQpAkbFGYjtBrGiUgEgHANvrgcEdbfQhrJUKixdeyuSJbzvhcxxnQKBLNUDLjxTmTn",
		@"OlxywRqNgmTLMVCmoAQuGNvTubBWhLbtrETnvWFElLtyjvWsanfwkpvImPzayloFUWyEXWVltEmofQyBDzKjCSCAcZCkWOGCsZYScGBwZKoukkdpQzyWdrlciuHknwDQzjECWRWJsd",
		@"MpvetOTXdfPLnKWrHurvrrOwXmZSrCDZUngdMaMOqZzNkijaZYNVRjLDVZuvlOKopgdgidoBUlXDbFfOXlhlzGybmMZubsPJxUPcklOIeijbPIzJzVaQdbbqnQ",
		@"LpjHISLwoGdLTjzljjkMJIqaGPOAuKNwWsfCqqdKbcfcVnEBOJVlFYlwZPDDAYJZiOmrFIMVQpbFpPRAsyQHtFHJxTbKohbvRCdcKQjXaniNXJdFgNahPHu",
		@"tBiWpGVZDdjDTCbZfHmeJAXtbswcgbvUGpGomQgSyuYVuxCzUTMsMocrBuCoAbawUhOQOMOcIHSpEupGVuayeOUnlMJJMTxNvIiDZwfOAgonZzdqzRVWKlWwciIjondSfOvOU",
		@"ZMXsnJCiWLkFTuCzXFHGdtxujrisAAjkodoMMuTBCaBUXhkJvKacMVZafOUvBiHEoeVErCqpUDeyDfMzrYpBQoujjqDiGiKVuEUQhcjKiMqDPlhbCQsrbusc",
		@"OJTRCvPWGRKBAMiQLWVsyNekvqinEQvYrJxugLfjPiWamCLayXOVdZzQmnGvKoEXVCsVByKEkxDWVvlApzLxiiPvhzrhALMtoYHAgsNRktobWupuGLnkJZqsQjAOfjqugVafbwUkfkTWErvFVen",
		@"QQpMMlymbLizXHFVvyAHtlCpwqRlLGOFGOXRXANabCJylYzAMOMlDJgNRHleipSGgcdRyZzKOcfxDDTKgvkHvtvlbsZifWLUGaiPs",
		@"mTGRuPLTKCJdhAqOsUNsWPLlBgnUTJpHYgocDSTeWQiyHhnTLckoXcmymLlFadxWCvigqYKgbKxkAcWfsCgrTYNkWQtpNzBLhrjGCTkeeHhLnvBmwwlHRUO",
		@"IrETYMfeyqeSDnifDQQBIWbyZmRPGgRwtIWaKupHjBNLzwHOybsDPoHoAbMjEkZlyqnDufvrMsbXwWyITamaVJQkOAAwnnlRaiqjCmvLYYaWhTOKXbKEEMHzwWssNsVP",
		@"pSbrDpUmWCsEIsgvKkIDTBJSuSAXYOsyHKsEmIkHatGNCJPfmSXOJSeaaTjWjtaRKeGMQFwzZgASPIoRUXJUaEwNvILvgSanoklTvaAiMtihslHFzJYzJxsmNndv",
		@"kTNojmHPPIxfqiHBWSHoFPiorXEmzFfYQOVNrJOFZPDTERDZjQXowrOnFBwrxHmuQkgWJJjBOgZoZEFYqjMqfxJBIzzmgbhIUOoyPwMobyonsXWnjzKuNHQldCQuVUJppLdSN",
		@"LvhvYgtqrjFZeIhGBOKbvJHxGKdUnSDMeHzvtMfFarFaabfBThgDdKsiHXFQobbpCMzODanKKAtHuAXpcFlTbyuWdRvnFTApAliNkxLgpJ",
		@"MZZlPkKLgBOlaGHqYMIHvzjyetMHIWfJbUENhGZebWOFjpUHcxxJAglyNQmxKdyvqAUZLdPCPQQhbetFpqrAxzGRRFMbIBjfIGfXEKsqhLSMudmFBLQtYwLeQ",
		@"GJHTuZjnhjmLHgElouJrfEXuPPclguYDyUziJZDYSEtElspmXqXfQOlzSJtdOQzOHigBusfbJGyLmfZYFjxvObpcqGnrivFIelMegeOihCLZfNsVRNoDaNRchdYPKjeFKIUVyZC",
		@"FtKMSySlPYHcmYdlVwAZnzdhNpDiAALuyknAJKfintOAfQzAwREezvRDfzHOVodPLnisbrsnvcWQLmPklmChLdfiPjmpxREWPOAvDNguMkikLOEPYKTs",
		@"cVWQkVeWLbAKPFsSxPlehALwziPAmIdnifkJMWKcixidURnOjIePHrueZtGXUtkUAJrlUvfnwBDLCYZURNDrZzDplotYPnQcvANuzUTAghVLQMxTd",
	];
	return YgunjaISnXpRion;
}

- (nonnull NSArray *)KxsRQKmUfOaXAamZyna :(nonnull UIImage *)wuLwWNLaWghbxW {
	NSArray *xNUKOxAVvNRrXSlcVo = @[
		@"eNyTlPFsGhzvkJjnAufqbTeJKdsxcpJmcbnOdoKChsGCOOdkTNEfSdmwAPquiIYEXZOuEKFOQOrtDKSnTziaWwSdfGAWHftgQcGgPrlllNgxMYpkOmsnfWDibUpThuLfgv",
		@"pIbwHGPQNtDXuFMnssdQLdPBrFtSLYVvSDcKBTQcEkZZlaKBKJRHThbJUIolrprwdEyUvhbNSrQwYZWHmcKayWCLPMlKSUmpcEHxbWulUKrDWAAgiPXfWCMiZEYTaUWltXOOd",
		@"HYfHxnbyqkBQyLfgfViQKcvvHTflLcXNOWALZQxUJbstTEnUOHEfsgWsiCNxcmWelXSjcaxQKPnpJEKVvXxEOssdJUrkepDtHFPRkAweRhSwFlQQJGDxdUhtwkftVysuthrP",
		@"rSBIVnTnltwlqfggvWaCOwVBfVPtpIRZlXnJPDiPSVDyjvVzcswuHNIOaznugcrhcavaBnGWdRrbEnagLDabIODOChBwcxUymMSKByBKizAjzNUsNNpBxf",
		@"EHLpQvqXqqJjWUfDZiIWozYpTcArSkRBYuIJGVxQngjsFAZqGJxnXkqfxiodPIOdcwlgUshDieNaCxsewCQfPmdlgRTLvTDZDwVTnSspZsGgtjtYxOSyMPyOILXS",
		@"UbVUlrHAhBopGZcxdDTuTTogkJCGyUtVurbDGNYqSTPwyPNxIbdpUlxgTKQFCWneohsNLnPBPqSERaNakKTsIxTRqjNxiVmZCrVfMUoCLWQANmWVmiliRFUNWkeAVyZ",
		@"ooAFkCDbbNpHEnaKqNEDHJUzvjJFdHwxCziuJHaUQgevzJTVdSnraYukfkUXhiUEDEdICqyOSIHbHOiOuxqBxzhudsAOweVVdgtooBLkioxzHOADYyIxJSPZGdvofRHnpiYBGNb",
		@"QtIDFUFVKLVepkhTmvNlncwOenuInFksDUKbFwFftopOkGkrVSRwkzKkABkDlASMKMokBYubvmrmHcryEEHDjWaMBquMRknpdnRfBeBsQvPVbFKGSYKmcPWTCfbrnBfUusJYCxlByvlig",
		@"qZgsiXBUgemcFVHSDblBsmMhlqsZOCLjWPGeOhFTdRCuogmGMBIBbOWyfFqWVCWnAkyGnoQPoPuiXJLUvvHNcoBwQDBbDQUaXeLNTJdQHDdqmMUHNtRN",
		@"npNlLpCumQDmdjSQiwQFtNBSszHILSTjGfxckETnwPvqquQxpUSzYETdguloYKJwQLFRfiMPRARhkliJNIiTVvdVecMISPzITjoaKkcDoxuezxaPQOhybysSdQyvyYaRwAAS",
		@"jFJhmVxXraOIHbvBSNdfCbAXOwacqDthvsFtgCPfcyMmZNLsDEGGkaVvihwcPRdCnFEgmKJwUldJYWmyUYFHxfbLvqRbOeofxTRzXdaryfmjTRlphqJXhIPoPcJQX",
		@"iPMpAAMmnQFNfIiJgyWJIRBMuNzcKGMFrlprqjyZKWGRbdxpTBKemyXgdjranvXAvXBLddyuteIhMiHxhMlHdppdpqyZJKJLxoWNVwHQmVGLpmYJJKWTPlsXhqSjGbeo",
		@"QzQJDSCQdxklTSOeqolYTvHRucacHkjGkSCOxSjvQEVcLTtdDCFHCpKUAFXbkhZUannXpgISnXSOWknyXKjVsdpARTFUvxzhhzPpgmiOVGbpeTmoyPfoz",
	];
	return xNUKOxAVvNRrXSlcVo;
}

+ (nonnull NSData *)fjiNAsddSCNTfT :(nonnull UIImage *)skhZNpemNtrOBGW :(nonnull UIImage *)JJwCqQURinjTAzkjwa :(nonnull NSDictionary *)DlFmJTEMRLYHjtsA {
	NSData *mTVWQUvLeKCiV = [@"USgDJsHjIMEmZscpMxIaaNUkHzoSVgKcGmyPrRzSJjnPTGZZeizFucQgNoQpcScWCWhnkLBCnBcKpzQwVsVrTdUAZyNdBkrwYbiGWOrEcxDgtvcVGmJDq" dataUsingEncoding:NSUTF8StringEncoding];
	return mTVWQUvLeKCiV;
}

+ (nonnull NSArray *)cAHfXbjuuvJUhMxDHn :(nonnull NSString *)uOkeytWFnFSenjlfJ {
	NSArray *nSlqViLwCzKt = @[
		@"vAxpYqeLpnXhYtDzmaFTweSoWwABulESniqrZtLEfSWcsuZQUkFXzguvBJQaxKhpKuqAmhekUSbgtJPhdVGACnFurevtNjFvcYpBdOkfJLpIJlHIGldKNJavVcxPeaygHzNFtkEnRWJYoYRcdD",
		@"uLzFFOlpaJkTOhQajjBLirIPapTSqCxniXZWlhijyiDGShGJkctTnVxnaZnNncPzQpKvACXkqmQAypWUFUOAWqwGgLdnFgDUrUiapEALCuGgCJSLJdDrCiTCEUPmYZYfXOHNo",
		@"JRzNgDNYoLsQUSrzXKMkroJnBEMwMsNUoyoZzUTclLWfYCShkbcFeHADxUYlpLeVTFMizPqfPNibMbGhILZSZVGuUeEpJxYfrSsWpJltGhjF",
		@"FzdcIjFxPJGGsjghlSbftGPMddSsINbNpcsHRkHbrKXPekpLdefzlsazSxCSsAZuXYcwowTHtXdJiozQPWkwcHkdvklNAaVHTQPIkSVGdqVGeItikTDqvBN",
		@"VVRpDZvLkejgfBORrbbnYiddJtAxApjfipEoCQTRmavqIFyLmHjApVTfgGUsFmakwOyhwjyxmsGRkCilFmmMMwYIASkUsvKLZYarq",
		@"FDITNScNGRBhzmmYaMkmjgRDcnrsrdIjdaZnxtqHNMGaJdLsnjgtsFLcJXirOJqKGRJDooCBOFIRaJYPwEWWDbVIOVUEObFTaUfJHDeNz",
		@"KYtOOrPOVpdhzpkICIleRXMoGWqETOlbPBZGCjCTCJZtcrjfiNpfVOhpBdTmgHLJdhUEFlHdmBpNsxgILJuaXyUzsiqvNAMMMpChLTkFjDvFjTnsNUCmEpuCYbJJllTPoRrKzoj",
		@"zWBXBOmlThFqkebuzuVKPFTIGkUuxRUAlDGwxiSyEZyAVkQsAJCeAJCROvUxUWetYdVsXGHStpnudyiGdkLPFyQWYxjzIShYZgaOIbTJYFFjQlXieGKOzaECXbeJqfMeqonzfxtbaXTnQx",
		@"WHyVxFKVWyKOOzNubLQvkckdFOLOfysMFsdonibNLoewQIVlujAgLzvrjbtBFsoFQVCfpzFJXRuvQjvMplwirFAvwpEhIwBamdpfxDIaqokoSYmPOXZuhTGC",
		@"XfyIdtHapqWZYCYdNcyZclVbTvphVwiBUTgxDzafQJrVGoIrwreOlagMkQmnUhMPMrbfUJfuIJBDsLZCXnBnhvpSvctHVsArUDJvPRxCuPZStcXHSCloBgbdUPSCI",
		@"jYgdFtxbdGXvOGyGtcgMOvuWLRpwhzLtScpmWgvXABKAVBTnFUuHXIeuCBXFkxVDmnOmVGVbzoslpsLjgdMZfdJhMSwguQUtEmJTrksxFSxcGibhdxKeNVikpUFclsXCQmRP",
		@"tNKJbeNNhyXdowxPlQVxLRPDRAIfCUzNNCQJPKqYuPYxZyQEGIxtQjbQinKtvDMuiJkcEjNNeUFmethfpdXnlWnCsyhHQKBHCHdjzKhoXfhrrLpzmrzpirWjYLiRVJpyRs",
		@"AHrgAJjGTEUlqPwsDYSKEOXtfeeCNRUxTfSXWFPxOtttgozJLnkAFhypKDwKETDPNArecGzpzOhdsLZntoNUBDYGIkeYchrEKeYoFIMzNgONWUZCYgDpIsujfNqAcTnqeCWrPWcl",
	];
	return nSlqViLwCzKt;
}

+ (nonnull NSData *)agZZlWaptfp :(nonnull NSData *)pJtGOmLfiUduWG {
	NSData *IGoXmFilRVNGdY = [@"WfkhpsKWRDkxNWohIqmLWSAffzxmOvhifaIupwlFrBEXVSZRcIJnIeHxHcjJuLaxJiiUKPKmmYGjDhWQpblPUsKsXsTodAZBbDlRFXBdufZnx" dataUsingEncoding:NSUTF8StringEncoding];
	return IGoXmFilRVNGdY;
}

- (nonnull UIImage *)zHnNxYOgkOOyGCCfWD :(nonnull NSArray *)lTHorXKTzMUmP {
	NSData *BZDkiuOmlWKWnVN = [@"JHlraBSQeQLCLcybsHrBxIUJXZVKyFMdjcqeJjMHDlLgHIHlTjAipeTZzofqoguuPeqxTLjqkAyPZYtcKMHtVurMAnGefQkNomycwkcKFJqcNBlIts" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JGQLqFdlUkEFCEQWIpE = [UIImage imageWithData:BZDkiuOmlWKWnVN];
	JGQLqFdlUkEFCEQWIpE = [UIImage imageNamed:@"iyWuxZOBQQTEjAqnwtXXeWqjumCbtnmRhZkpTPcbjHrsRFJcEHiJUHvUVnGgBtTeWibfOkfDEpkQtdiHzRcAogyNUIjwEVFgFlHQFetvOHogOOURSrUeHBgqMgjmkTwzJtwlzJwynDUnwsCY"];
	return JGQLqFdlUkEFCEQWIpE;
}

- (nonnull NSArray *)gPJeEUhsarDiWtSwLJ :(nonnull NSDictionary *)EJZFmSYjGHHejgp :(nonnull NSArray *)onhVfACeRVRhKCJtIoJ {
	NSArray *CdZkJDDYARRZtNCNCv = @[
		@"WMdZyDWwodfNZKhCWaUGnAdJQQpwGnoRQVEYyTvnlLdbdMPqCsIrNPUfozhrsepzFEalNpRIzEnjuXKuenyXLMZQbSeXiBcXAfictYQrvRxqGEmYyjyrOCfbBUKsVXwVLocOHRcrYEfkG",
		@"vmQONYFKNrlzxHrvdUBuKIVjKCElRPrbvTnXWyakFGEdfSaNbRsyJkYUPPhvWctSpTXxhNdfMlKqJKYRhFllHmQwrxPLCVeOsbpZExFQkYKX",
		@"efvidjmEPqysfjSehEdApeOoihSyJVpHXTMMIECEHfgMuJCLgAUHNmOqFzajmMgGCiseSKOUBbEiTJoyNrYgCOTnWPwRgSHKWwfwQGykGwpESNKTUmtdGdV",
		@"IFfqruKcmcwDsNCblKrObYpDuLXUTgqWSRAQYHiUUvClOAIYbMyDMbntZTMmYoPYQRmxggIaXnloBVGAeXZsaiLdTUOQmsJlJUIJLLvaGPXzDyZvwLsazTrnQZasEBUhSAbIgcVEPZUEgadWUvNH",
		@"aTrnxqKgGOpYXAUDejGUzGXIYiwYKoVKNYFDfxXOyVJWsdoyCHmRUYEFHgaUnZztycctJWbsksSDPjBRkEtipjbXJrQHupnzgJjxihO",
		@"LyuzGqNSjpDDABBmOYFCQrUShFcyXDkdYxhtAWlvJhGNqkKdeQiUpwZPryolbjUpXMrKDzCZUlofgvZyWiIDtGNPlzQFifkkEUIEPJrUqgd",
		@"GDKAmFbmhTkCACeyHQUktxghXzKkmvDheHXUTzummcNTTGLMbfRZUzZFzHtgdPATfFjUxDUUNlyYwheclwheabjHVNoRdNcRjQeXscfqpwLzgJrkYqYhUMhPVeqUEcTCPRsoQBqMFrh",
		@"LeSKBNDQpRzasDWlCymdhgpxOfjVHwaJJFFhpBcpGoppuoPihptqiHFDgmcrzjaAffrqXwWbdXeKPRQdSbPSVfmVmiqXYatHkhcSvZWPopKJchhRXkqhFZeGxwYVN",
		@"DNCEPTPVEbswIvcwuiuBFVCKgOWHfdVxgOYnNyEpjfWehgsAWiNOOerhqcjjwsPLpnvtoClwtlpPrTtRodIkxdhjBmjNcQyfOVdKuOFHScVKqsKLATzVMvBQbJTfiGEiahyQFnNiIRbmSQJfKz",
		@"EXjvqzdHnEPySJlEbdABvvFxwbZHalEhJscVkzHMgAIjKGmJyZedfpEBnpWlzNZIkOrorjfhofxxNIVviQdlwKTxRqMHqJwZChjxUbYSRYoDUcpMCfv",
		@"GNOiLKxJmASZpuFAdVomMxuiWVOyMKhDrlYBZLIjcTKziXMRAjWaDigTEfTLqWzSrrEQpggxhepigzxGbhnhgJMhSLSEwjjCIoYjAwzlxwkLxzLHUJNoHrILlJhshNIGfvuvlTpACKigYHCBDqs",
		@"QNoqWWuSoXKoVlqGiAPaYaUdUjfheNuCYLUPjgWcxyXqXagVIHtRCjpeKJBueDUwXQWDnbbyADosIMZRYtgmIetyfxVBYqMBLjozhvMETRRQQmbngtcjFOvP",
		@"IiGfASlkhyZGuQuZIISWtCQEygYsWLpoCiuPFBvafdLDSivVAKPSNuvpBammgqOOgaLhWbcMaacSnDDxhNBeLTrmGqBeOTLTArfoPQGmkcrZVDYcRtSp",
		@"LOuwvcoSeirmNvCsyjfCnfMeBCvzspIsENPrWduiWFEnzkiAHTyeZKYYpzQPCcVehUAkmLhoKXqLispPoPWjozXVJfNIhcXudGRaOHicUrWLCvsHDaflOZcOYgUecbdJFgupgQbZ",
		@"QjxTyEUqYDBVXjDcRAQCAKdThiHjYlLabrrvoPlIaFnbkCcqOHnsgSHWLbWVoZVscVpEgIykZNnUHaBykhdKIGMDFINMjAkGkcHcvQQwBmGmkuEoKzPboVzlaexuCBCfIdrjZNzCl",
		@"WnndnYIZksfGnoMCdAEDGurTGiyXEfSqDRJSoEffAkxZDvUUPRMicQmHzYyBQwPHrayUkDAoDabxPHfqMElIJRggMlpMEEWtVwGdiuDRpLZniTcSqoNjSOCKUaxwkqXEaCtcavZ",
		@"HGPAcNZFGCetprNrVCBgjrbgrwcWhPVhJHtRorsqYHOyCgCSlJBWylfdRCvksOdqHxOiCEkxpgaiJLZzLXfpQokkLKIiAyzRDfFyfMYAXwTIdGpnPI",
	];
	return CdZkJDDYARRZtNCNCv;
}

+ (nonnull NSData *)kRptwpQLjqBuemjHS :(nonnull NSString *)jgeJQPgEZjfD {
	NSData *LhEFxswBnrAgtwvuoBR = [@"eyhWQcKcbONsTdKEyisIaLvAWNAehCAfSLBtmFOAaLLWjAhwKKfeTttqgyDOEmIRmXdvEpSifKitXsWtMkYCkTtMEGDnKofSvWXOxIdr" dataUsingEncoding:NSUTF8StringEncoding];
	return LhEFxswBnrAgtwvuoBR;
}

- (nonnull NSString *)vaurZwoudQSbCxvIkr :(nonnull NSData *)lTQjsFrcsJ {
	NSString *rYjRlDfdntyWbUoqx = @"dozNeyVZoJisAljkikFNJaLpPAjBQYVhgDBLRJsUjIxUvtryrkEDgRlINJAXxqGgjMQHrYvpapvFpxVvOtbOeZwcxNgUUoeYVQclrcfw";
	return rYjRlDfdntyWbUoqx;
}

+ (nonnull NSDictionary *)WUNYJjzhlxFQ :(nonnull NSDictionary *)Qtzoyrldusdk {
	NSDictionary *iBpjFlpkwGVsL = @{
		@"YAbTJDsxOQCLZeOYGa": @"DfOJQZxCWObdkVgvmricjSXrvsjpDSYYJocPQjXkzxLmEFEmJQcBrLxTaJoJYOfEcQZrGIfMrbBjUzWaHuagRERkXPLtXoZCdYboZrdMpGjyUhoPfGSnqjOPISPDNHcJYpgHJJJeWFO",
		@"qFEWKQKCdLaba": @"lOCrTpFsTupSTMonVOnLjPuCPVgFWMrODXnUBLKdcjDMiqltLNIYxqsxLxZZANSVlPhMxolarLkMbYhBIJUuvnIvNqdLvyidpQkGeRitFKDSnOKVaZYYrEDWGqxByZog",
		@"IhoTBxAtnPAXoSnFh": @"tzAGSryxlGUbaDCvFFUAAzTEUAyYYsqdzZnarOyfcHulmwzaJbJJlARPqCuvHeVZvFfJFHvxJReggmYRMfLEwtEEOsuCHRcBQKeuzPXu",
		@"xVQYefqqKKvmj": @"KmIIMBomsIQYKUNAtuDTlQkXfDJFnqHLpvWVavHBlPDwIvowEoXMJPaLBVeimHwaTgNNapAemlzbLyFhqaDUiGjEeDZifuYlJnvVVIlokb",
		@"jXKojvzUAPaGqODBz": @"QTkirZezDUGVdNXWZOrFRftgHVXfgESxwZurKLwOOayvezOZLkegazMEMandcnSDOFNYXdBoGstEtmiPikUSqukHuTAChLUFJzcASucOfpdcxgIjZJGuzTcwwuAYezpmoeosPavS",
		@"oedLurYfSM": @"lkKRjwFVBRzELnsUzWtdNIaMpVvbHnLFwwLJzxYedjOiXxiTLmchgLzOHIcyQJavonJwACeIoLplBPRGSIgHzYawGcTCnHYIUjZaFSgnPvRGpTBPycCOycUoDdID",
		@"AXWOtGpsby": @"NdSZmwkyuGCeZMOgKOezHgIcLAsUuovAXaLVVSRCvsykSgMqRrbAXSusVOIHjLMjZerrJrNKyQEUYGUfjzTnmjcYcsmHgCvLlDfjljezgfEpOKnREMfFxe",
		@"wGWgYxPfiXVfdOxF": @"AGieanMvrayWPvWddtzkySKjRqQULDqIGJcnnoPlXGhEGGSRQuyBAwKxymbGPBSvUuUAClJHkaGNPzOmIsfIZpzZXqocDBoJBJadZvVvULyZIHUgHALvFnUqqFYZezSUgfUatSnajRMxcfY",
		@"WRJpXHFPHJ": @"FYRvJMfBIZniHEjwjWDgDbACTTojyHGscNpcWOaZsVjIiiEefYEbCsYNZAXYygCivLFbHJHapExFDVDGECAcHVxdkTefvahSDUCHWPtUQhfVAEObEITdKYdmUdooHVOOUwiaZXgc",
		@"oxTLlUyvLskpf": @"awomynfBVBuQZQaEFQLWIJrPzpoxUTXxHgMwgelEdemYfKFXIFWZTyFlRkJZjuBfUHsiyAQSAynIjhwkMUTpVioYhbAFQqMcsmATon",
		@"GcjqCRBZHWaXYcyX": @"shMKoraAeWwWWgTNpUSzUZOTHsYVgevmdPjPkloKbaMIlIWerPnswCRQeeiFwZKTEBBxNBXXVixQGpghvjMccWGBPlwIfLdApSXbWZOVbAYxVxqwRCdTbDTGTYMOWa",
		@"dYNEVjnyrhNADUFPx": @"VPmXYPriabKgdKVhZVmReAhVkDXdNmUNVviokblHZHNHffWNYIwriRbgZgNbVfVcjzvUSglDnlVHHpRbnJqJIPxtkgrWyNexOamWKqpUVhpMbiokqYVIatBlTQJYWgbporvZYrDO",
		@"ZKbIWtvpfqEKUc": @"gaGeaFobsGsnqNZMYPHMUzKyjTPqyiQtrcFtTwPFvYhhKIDbsPkwhUpMibilkDhubUkAjfNkvzsmdJIVOpzkmOKPOshqhpglxQwQLbhqpffguSnnoevZzrFnoIJyZUXc",
		@"JKtPsRsZzgQLqavsH": @"sUKxVdsZQZecjCQtgVkbmfqMvPkSaDrIRirNoWVoptjvrBKeXNgxZJHHOLtBeDYnEKgtogYcCUBMeHSrQVAUbHrIUMDxZbZEzLUrgsGWaQnBEqMONUzOCnuxKzB",
		@"EsqvnAqzIPaZYuQ": @"UokrCQqHwwMUdzNxDNAAPboydQJQCSGytXNPhsGiKWsxfozjZPqUfFIFrTEvGKGqnbhGwiQtFuLSjpUvYrnkoKmNngfLulmzlYRRzYHgbnvR",
		@"EOJgVeseLrDKIxV": @"fpFkJMxMqBWltnVzrszNqgZfeUNwLyZBqhKiGfHGxfWQXMFOaaPWENcrjeNcnTCQpSbouSQXpfmCQfUNIcoGWGlhlELUaknOhHXTDiEKCVr",
		@"vqMEYmTXwQWbtq": @"qPeTwIXyxZCqiLCOPKBKrVTjnzhxKHjeBkPMvOtyyLHPHTzHXRXQilTYLmPMRrKdhaRxfUdyqczrPEvvgIvSIjXefezEiZoLdPccsgRPhoiDHIKTRxdOucVuWfxQGGqfTiZWhzeoYmIjyzb",
		@"rlKSVLaamwMei": @"ZBuiRsAyilkBxjXLpbEDTtFQHUVESukUjnTtibgjXTOhgjysLpPXfCxoSrpAPATPoeJTpPoafFJPdEhPrPtlTRlDVmicdjmJOZsXYRREtvPuinXhfcdVllhthtbhTIQvMrtm",
		@"nxTTfEyjZTQBiX": @"fhckVWNlWtigPmgZHXvFoiFvuxDicxlWeNUzoTsvmtvdzcQxqMyDbGRKVXkeprQvlRFcZdTvhsthAwvrbudFNIFGqoCGSCpTRSdUHjk",
	};
	return iBpjFlpkwGVsL;
}

- (nonnull NSData *)wmiiksIUPBsPTTx :(nonnull UIImage *)VvkLojLWfTvIWpisH :(nonnull NSString *)SDsxVQJPbruLbiXejNb {
	NSData *PmwJytHoHrDvGULa = [@"ekYUhNVnlNebZxQopCUFAKqAhuffoNNOvvNlnfWbmBvSCcGIALKBVqpqecJpjAidaCufazwwDgsqWPvFNpUyOKIWmlqMceeWISEncFLNOvWfSwogGakdPtvaWnek" dataUsingEncoding:NSUTF8StringEncoding];
	return PmwJytHoHrDvGULa;
}

- (nonnull NSArray *)AIEaZvrVZPx :(nonnull NSArray *)fdIkQIWeKEykgKNCf :(nonnull NSDictionary *)CypIAPVEJuG {
	NSArray *cAPKbHSVRuINGHtaH = @[
		@"zogrTNHJMIcJAZsKYqJKLckkkwrMadfiPvBhmMZvoZrzbSoaEhVTPAZZjanBfXjYrCphLVeFGPzVtoLqwvOFRcLYkEJfgTHgAWZPaqlIyHlDyZItKWltkCANSBbtxOmptKZHJzUUFt",
		@"UobICSczrsZkLjLqrcbPDkEPeWRkcpcAcUCWZIAEyfrbHRPyylTtSvXpFYltRSQbRxwudosEpRUpsDvmEGFYLMskQmKJozkVlBJMIggBmutcvAsbSVpCtRyGOwgrFHmRBktIes",
		@"IcqJNIAYeAOgEgbBAJPveBXAuaBHzQIKabbmeMVbVuleGMuDyJGIWgYkuXrGKqZzVzufqwvDVIjraPPjcPjOxUqzEysbuSuySWdzStSZhCdFqwioNjEBqWbRwvyWZvrwnNiQfyxLNsQhaWjWzYsuv",
		@"aZRGSgHQYrkZuCKAPrPimcgxiljHDySIjHyvFGtNQQWpMzTXBNbhcXfcsHpFFwSbSMtKECQqPXHnnVbfIydHzySQruoeebdOstVgAONxgatHwYMSSDUMmYwebYjCrUmXgHlHFgKGApvD",
		@"IbTmqgKKCZERyOiXkegECeLvEgocrEodYCWFqdWJKZgpidfnSxGFQyYnqrTCYCyHjmuQnJWYMgwjYHmbqszlPEsSTRWjknAqrLKhFDOrPzORnMLceacGvpgzVeSxJPsYlvBxekRAfmL",
		@"UpGMMoDUqakElHuvndRhtNHGSpIsZiEBLIEuBOFfitijfSaqtbhtqTtAASrcsSelNniyrTjdBFlplQAvKuPlZBhcnahuIGObwUZEpmExOMIXLfiVISdhnjNZTVEm",
		@"NygPxInEoinBfmqRlnXniQwxZqyuvZgFLfeMPBGKBOcsrUwqpQTeGzkFCDjwBefCjvWWzzEXPSHeriuhjMNGVBGZKmFutqRCiWNnpU",
		@"bBLJfJUpNFClIwIkoeUrIexfTxrkxiuzlVwZvYfrccGplHkNXNnrOvsehUiKLNsMMThDZACYPSUrnhkhaTwbGEdDLeQfcvEklUWeNelYgfwteorVw",
		@"YPQmkoqxwqyOKNnsyIerunGZNVDtEjateiOOTdGhYBZgEPyKaJuTMVFxCByLmTfPgWbGWPGnvHEdEssqSRPWGTIGFlRHaPSzUnSbtioKTVIclQuyB",
		@"XmYdKWDcDdKJQroVxQAmRgTbGaOrHMaJwcsOwvAEjMkMxbwKTiuufvyniyvUEGvyPoTWlkeIRqHFrrpeyJBneBZnMQOYuAOqHJLKnhUPoSIJBLcMYCHVzCaZoP",
		@"JwmDVEjYjjRmEztZfDHceXTzsaWCoEoiFhCoAVWniGVAaOwMVOqSzGJMtVYiChUibNzFRnpedcWTFXzGbiPuUsdMQVUXlQpJpslClBHBrnczWJvq",
		@"ongxjYIWVBQhYyCbQGctmGmjQkcqpWdeOCfFMxiDGRRkpaYsxatlAfWCnrKqCAnSjXWYPSUaxNzpZqLvpSvLhTOJpDoQAcmgpFqgujGgGKWrLNFnSnGYXlZKRTcCDUYhwHwqJksSO",
		@"YVVtAQCYjbLnvLoMpQvkOULoyJuNsJWghFwoTtwHcArRYyhIMVRVfKEtPUraYunFonbGilitRJYWnwfAHAXwRHuBFZGziekimTcWHlcUjHdmTvEWo",
		@"iqsJhGjTbzDQEjQhjZTeuUgJYodVMaTgFbwWhmZbvGghsneQNkXRjdJTCbLQPUsvUPGRonFGZMXmjinDwNRHdfafjSirCDcPhKBUYEluMGdBxknuOExcGkuUHvWakmWdw",
	];
	return cAPKbHSVRuINGHtaH;
}

+ (nonnull NSData *)hoFAvOLdnVilrVAQGbW :(nonnull NSData *)IesdaSVenkVZt :(nonnull NSData *)UGrdfTryCNbPkna :(nonnull NSString *)bcquVMHvmr {
	NSData *fSGKBBlGOtMsddZ = [@"jmlABBoeUXPOAJalmmvpKUcmJOxFiDbbNWevmVViDOawanJDFgyyhhtMyjFTpLdfCHCoEWvYEClyzeIITOBcYVJExrGoGRJxJTovuiEikRTOtYNdFjNvtomMyYjMjybSQMdokgWOkGTlcdJM" dataUsingEncoding:NSUTF8StringEncoding];
	return fSGKBBlGOtMsddZ;
}

- (nonnull NSDictionary *)ijCQOVsMZHvqiB :(nonnull NSString *)CwbcsKKACIoaJoD {
	NSDictionary *HhAfJfRLBpAoATNa = @{
		@"RiYdqLgSSVrcMo": @"RpeNnOLGIEruWMKtKfJyPIRNDvXIbtwvQbTwYxEqNUTtJRDeTbzYzCsSqLNJCfvoEYSWyDSdjZXjjlUFTivGFmpDcidLSqeqEwBikcjMNNIdAPypimEjfbKzYSxrdWmPcV",
		@"AxIHrSqMZKJMD": @"CUJsxeEnTVnGsWrABWFpXketpOsnhqAHNkUXBdzxjjHoIVYNUgKUUJQxcXruvVRzHySKMYBaBRHhKgRYJUZMfeMBOETumVWCLcOTXqqJZKdbqwWUTOAgHqaDsyFqRMz",
		@"AHUDZkCOQmaSLDX": @"lxoigRoBPULbLaWqynFUFMGXBIinFkWRKpJgdkoReRDuJNOPxficUHDynkXBvrwGTHkyUentiUbDhryJpBduUCVcpNYnvNAlzbcbRUjnCGUOMlCvXJSjnITLBcewOecTIAxk",
		@"XwPLrDOgOpjUtNHFh": @"iIjjhWncAnnjyxzuarrUTwIAMoPuPbUafNdvIzsngnVMyUohGYxcHPdBbnbpSCsCgRFcQFGHFswDpvqolbCqeDRdAqfYZfLjCDUvYNqMKFWCNTRyOEXn",
		@"uVIthmZwcdVCvUwu": @"PDCdRiJezflxEccUBkKgJSplOsVvuppGpMkovOqknEfhNVEKiSKcUsxFfTurqGpEpIqKTJYAqTmeFnTEFRtGmdUTCHUHJcdoRNmwKbwxFYqXTZJBhjzPFfBbEQbIZYZvBggVWOTpjK",
		@"nzKzfKYLpPLbDtDoSe": @"jPxwNemzGipDdUaNKqENnTUJTNswyYeTXdbnktBwzTUUZSCWrWpwKBMCKEaaoGxfrpyRLwHGLMcEJEkpqYuRHXZPJfluSrIbRouEXEWJjAxWDeIPbrHdfFxecVNQwozSUfZUzEhRdf",
		@"fkiDZXyaizTuw": @"KHFRMcftOFqDPJsDGFxGlPPKUooJJogJNtnLzXxwCBtuEITCRTrsoiICyhvwOXDsvrYzooRKbxzzxpbflTNCwxmXSGenfruCsdHuDqNZjSTCiQWuSBfIANjwnrUIZQpkT",
		@"JUHqoikpjQbpb": @"DsWHrkFWBfNqFYqBhYctsuERBVciASTwdEkbPEiGCLlnQeyXQaZYLBzDFGkyoYfdZOfGALENtvJVRjGAHlIXZzVvRBFCfoykTATIjdlRWmHKaClDVkLVZnIeSDuNYwqQhUnJuHTYEJ",
		@"BIAyvbzRkiNMqTcD": @"hIkIZhFXiKDQKZCQQHKJaRVGDJfhfsDlGriNlixDkLvEtbBEaFAoknwcjqCYyZHPVDhGWGFZXLmtTFcuhugufSdByZbXBcJxUbOgEbFQkIculBpkQAqOhGaPTvEHYrlstycYJkZtr",
		@"JvcZQLipfO": @"MdQrXkLMldBQuQTYRkORKBtSHZlqehrTpntJbwpmDBBTTNlovKhKYjUQHoKCqkBZZdOWiKHYUnzhHgjNJdqEqNunmGJLdGGkpiWanBUlwClqwEyqaPFeNPKeQOQOL",
		@"qNaCCKvpPqultvohgAh": @"egkevFgUmCGLLoluAvwebXvMgDEXiEqBvmGDoxEBcOcWRSNqFiWDhWtUMzGHWIVDrDiBplemEMhLqnyvotcMLexnyXSJODXJTMwyBmmHTYsylExJUjWLFVHnjOzftaqmxtviHtePdNITiX",
		@"mnsGaQLubfXvGCMHY": @"shRFGpOQkbXrVhUtbMMYGuGBMZxDqzVXsfcNAAuOsyKaIbKHkGkAmmkTipepkjgCOlJqTgpmCWzZDFJwEqpAihhseBmuOVdwlKCPbsSnAbKQnTwUjvakQraRSlGQXLhuopKCluuJhtlmMchOXeEcj",
		@"fWZepBRkgCs": @"nUgulwJlOFigjIsAFPqpnmnBugbEtWuwzoFRnuBrqAONpLIwLRtLzeUsGUQNXrESNwQbGGGKjycAILWCRkoOClTSfgrZGWUlGvHEegrM",
		@"lYMMIRaixhjGcUY": @"rhJmISPdbtYMWyMDeyVaPKexbnwKREUouUKrTHfwuEbefOxmIjYAMkJuHJEEUGNaUTNflgAMdGxOuhnSgAcaCUxHUyXjkxgtDHkMRuERCXGKeIvgRImpvR",
		@"XeZcgodOmbdKVcBnAe": @"ZQnobyAAIYtGTEefFQrxBxQLoqULjgtNdAKvoufBrJXNCElNCwYXyeFufbHQThhelwVDsemsPJJFZxzgimUCeqVLhZdVaQcqGLUOoMVeZDgaqZQBjcDnRwDOCEdrQWhNSrjU",
		@"ftkZkyGLeyCiDdMGI": @"TLBsOXfqvsLYwdokilOYJHaixyEaVGtRfFwpHemOqBjIFOlaPzlKEIlITVbMRzPqhVipRirZKZZhFaVEjjylXaHEtWGWabmIwfWAskrqbEEwQbiXRukLIutALQFBttxgKzZEvubuLBwVxpNZr",
		@"XqyOwszhJAtuHdmPLdF": @"UFJujAlTPAxHRtpkaXITgXYQEecvzShOsPzxKzQSTbCZucjMxgRpQoFodQkQVFbqoMFAdQfLaQDbpnUejmlrsAxAJJlGMQKyqxkJxS",
	};
	return HhAfJfRLBpAoATNa;
}

- (nonnull UIImage *)fYDgymZwpqS :(nonnull NSArray *)omXFEjYBXYNBmz {
	NSData *hsWONlvAPVGf = [@"SXpTBRsIiPHzZVbngrRlQaRjtDSkKmouScPdNEQiewjQGxgzGCfWKeSRsUEvepWEUxGEuNsWhzAPOvNdMjhpwoLJgKFwLvMrHRijQaJotUoGhwdbGzvU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LlXVVEyjKZ = [UIImage imageWithData:hsWONlvAPVGf];
	LlXVVEyjKZ = [UIImage imageNamed:@"jDkYTGcIRMkQYbCwrnaIwLUcejHpfIUhIlhOrekIUcVoSKFUlrcebRkUGSpNaOQGozxwDayDfTFrHIRtfctbHdmqALglTJEeMOAxCsarAGvQtipQvejzjejPrAKeEUwliCJasebHLR"];
	return LlXVVEyjKZ;
}

- (nonnull NSDictionary *)ZyVhtWbVRrxFdpklc :(nonnull NSDictionary *)rYMnGtpOdtwtTUkORX :(nonnull NSString *)GMYRyKeuwNdiGJ :(nonnull NSString *)lFeyizMsVtVbpnx {
	NSDictionary *xPZynkrqKLhJNx = @{
		@"PXZqWVobvrtaXNaLO": @"fljbguknuFxruNefsjbHbVvVlYWonZeHleeobAzUixViZFDZwUcmPzoxqekzEXictPGrPfwfyanTNnrdCTUTxfZItwBkkmaCLcwcuPmNojKspQrhiTweodsOaTpzq",
		@"vbyqoDCjppTWorjgLEl": @"PGPYfYVUMuwtWkRvdHpxAMoaSScJatNYHclDFzEIcezldIdSJqlJBntPYLSjTfawfCtIkJVDTByEgPjsegWtGbONClgbbApWypkqsvDUiajSgFsIMYtGxtdmdnSBOESkIOqJUPPGtGoeGzD",
		@"XTaaeHSbNPG": @"VAuYWNnjxUFkdajlTnoNOgEtrpWNhpaNXByuvOCsQkRbruLOPBEkRsuyOOfbMdEeWEmlzKTXKdYxTBuThCSfQdqvjFexIwNCIeUJPxyXGEQpwhhcoOqxAVtjBksQH",
		@"KHcfACXaGbV": @"HTGRRqYgJfAuyMFqbUTcvItCadyOkCOcsaYEUpSJjleanJQpBQyXZewcTntZkKsaryYHgOXQhGfwYpEMqEWsGGJawgjgWlBEvlSs",
		@"ARjZuczoSRp": @"frbLiTdONpsUGAiEfqUBbxrySkRzwBkVntpvuqjvIcxufOkXiXNWHYYUEIAnpIzocULZKTvzwfTKPDOlcozIhDYGAYWkYaVkonLleOdLkMfYdBCnEhWffnAhtlgeTkCwhqBLmmmIPHk",
		@"nqhQzGvuhmGG": @"pRZSLIrdPkTxoDTFqWWSSvvYknFxrrjFxPOvPzOPiYgmDFNWqWJleBcXYVEvOmAlhuhfhmWNUtFwEGZHyDnDpSodLTIaxRnXSPTxpOGsnKUvPbZYSlSHdjBINCFnBLnEieVDgcrwOYawVPZCJ",
		@"QJpjnvvIKtaS": @"WxuZaumNkJbvlbmzRyFGZMRZtylGQEOLmbyHXBSGRdwREUkwKcbHZsGCAmtPQpPwDDBVxhZpPuuAeMteQvwpdkiLpJhugNpXgFqOQGzTpFMXyYKgsNGfSCznBPvEysiqcoBZHjqch",
		@"rqNsAxsMgRjxpu": @"lhITOKGQrkDMAidLYgVzJVcYsdWWITSDXZKCCtuEmThEQntnLzJllHJEdXnKlVKVoIjohTBsIcgDWMFdazVWprkRarBgqijkcxIbR",
		@"MfyHODJIBuNJ": @"lEUBkYuEusbaiSTuiLdBBBoVFMZFPYllwgYEAiZAvyVaBpddjVMdhGJMnaMuuosjMOQFLGnjxvVDOFlNLCOIlEpnaQXLvAGIcsKsiRLSvIbSQaHTG",
		@"UIkUthAHASHUfHpWJ": @"PHejbwleWpPwLPUabckOSxripdOGVEOGPiezwWzpDywyGDbXkNJxBproHuwThPERrRGEENvHwmpvoBtQtsicnkLFAVxgwYhEqGFWvlfVpfjZjmPWmltcVJhdssWkviZYfoSPrCeTmNbUxOimijo",
		@"rPLgdAbzbgsG": @"THIMQUlpBhnZXwqsqOyFFTeqLbXcMCXqpsHgMknVPuInbDgYPuMrgHPsIiWWdNsLpjfxVtbUhAjDWdyqsHxuBOLhCokeLnrkXncHftHtHQLjEaoomaovVHWpxeTIrRBfCOjA",
		@"ddtmgPmWWXPJBBraAR": @"WhMdsUBcuwpytzNuOwMTGyDycgEafWBcnZXrdvSLZjGLYSVTJgWDOnmdOHbZXQEllqQaGfvUpNcqiCQMHDMdGRPlbRWKkYZbrOtfWx",
		@"VxEnjCIJDYDDh": @"RYGAJmnGVARhAolZUnBItkCGXwQAyZHuqSbXxxePOakVbmfMagXUAdYhfhYplwPqcXITFkuSyTyCkeAdMLvBCdANsnXhqzpjHTProedBDwpmNUkgKCWKKPPx",
		@"fqXILhyefQy": @"eqNKCyacNxhadsxaDVeZhfXcsyFRcWsSfUxZLAHXNaGTcQyPhUjFVljIJloerGtWvhiytWPxldlxWMgrBaDDlgeqBODqzjHOeKnekmRZ",
		@"IQcFxtntvuuztXRLJ": @"VTKyWHAmzbFXQUjSreTzeADaDIGxvPYXoalpxXtKMekhMHfMmsxfkAgfMJlCMuwpNHmfYwNNevfiLNIAnjFHLeRrNcYvOLNhiLIXyoNRoyUbrsspBhcONrPjwZCuWlQxFMLPprYoSApebEfGYlr",
		@"KRHTLgZYQleWlQCjAto": @"ETtpgkEQQUluuilQlGxevHnQHLQBxkDYOqGdfKsdkIJNdEgCvtyDfavtKLqqMpgKrkWPcVaHEAViiVDKUAXJfbHWziFZTMjxPIUBMzcFHPMrXRDRABxHCnsfMYBxaKbLBWtgjekgL",
		@"qzEiksILSiIO": @"xMqhFmUbJSdgVZqSsWszzsrPyyscUcEELkUJCnLGzSJvLkZJPjRfVnCaEuOAAfPZsCVTBZDiCLxWjHWciIYunjggPSqIlKOkxiBPIZCOytBlQcYLB",
		@"KQiQyKmpqAcqN": @"WWtyZRUiaFkzbRtPKZaFMYXzJseSrZnjAaGodRakPxuzhGyQSbCoUvaxcFtKKpIdCUfLBjReXuBZQpZGOtEbvNllluCwKwcqhoEPgiXdiTuIQOGhqxOESMLxPPelDNPbfkeoXtNpatOf",
	};
	return xPZynkrqKLhJNx;
}

+ (nonnull NSString *)igVxjddaKKhBhz :(nonnull NSData *)BrUkqKDhoH :(nonnull NSData *)TokhekskHzN :(nonnull NSData *)sENtEwQUXoKo {
	NSString *FFIuOvDDpr = @"hELmiPwUykugWfKxCYgNgHFPhGXmfdtXClXtzjHwpmIasETINJjZAubuSOqnIyotDBrSEcHtqafooqgFshkSvIrBdLkoyLBPnYkwghHqfspznyluHQwUwjYbDksOLQKnnzIyekOmjhOqHnrxJJ";
	return FFIuOvDDpr;
}

- (nonnull NSData *)ctHpsfdImDZGjIBZWWN :(nonnull UIImage *)FNtqxPQAqfum {
	NSData *qMWVWdfRPBgOU = [@"kJPdUYxRIWBRIPwafNJRUJVcEdlehvEEAeTknFonZIIenklXxRfsQLoYJinvfNxuwvpvWTNDpZcwrwyRMMAoKXsbxZKJqJujcQaFjLtmMtZFVIaXbQVfy" dataUsingEncoding:NSUTF8StringEncoding];
	return qMWVWdfRPBgOU;
}

- (void)changeWordSpaceForLabelWithSpace:(float)space {
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}

@end
