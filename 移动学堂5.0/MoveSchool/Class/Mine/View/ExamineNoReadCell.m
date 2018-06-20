//
//  ExamineNoReadCell.m
//  MoveSchool
//
//  Created by edz on 2017/7/27.
//
//

#import "ExamineNoReadCell.h"
#import "MessageModel.h"
#import "UIImageView+WebCache.h"

@interface ExamineNoReadCell()

@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UIButton *examineButton;


@end

@implementation ExamineNoReadCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backView = [[UIView alloc] init];
        [self.contentView addSubview:self.backView];
        
        self.headerView = [[UIImageView alloc] init];
        [self.backView addSubview:self.headerView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.text = @"中小企业如何运用互联网技术推广产品";
        self.titleLabel.textColor = RGBColor(48,48,48);
        [self.backView addSubview:self.titleLabel];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont systemFontOfSize:12];
        self.contentLabel.text = @"陈老师的课程审核";
        self.contentLabel.textColor = RGBColor(143,143,143);
        [self.backView addSubview:self.contentLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = RGBColor(143,143,143);
        self.timeLabel.text = @"2017-06-18 13:30";
        [self.backView addSubview:self.timeLabel];
        
        self.examineButton = [[UIButton alloc] init];
        self.examineButton.layer.cornerRadius = 2.5;
        self.examineButton.layer.masksToBounds = YES;
        self.examineButton.layer.borderColor = GreenColor.CGColor;
        self.examineButton.layer.borderWidth = 0.5;
        [self.examineButton setTitleColor:GreenColor forState:UIControlStateNormal];
        [self.examineButton setTitle:@"待审核" forState:UIControlStateNormal];
        self.examineButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.examineButton];
    }
    return self;
}

- (nonnull UIImage *)VUABdZxOtXRm :(nonnull NSDictionary *)jZswhIjXgftVKtlxvTn {
	NSData *lzhDwXcBsEmVd = [@"zTKIwUNiccxAUzLjKUUAllkuUKzLcfvhQloGbPEfOCkGAgikTgnoRIIhqHDGmuVqEfTppizxdJfFFCtnOOsopnJGzZQZFrUdmgBkoxGtynnTaEeDqZUFyoflOHSdkpyBecFVeg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uoyCZhegtJxuEZOBG = [UIImage imageWithData:lzhDwXcBsEmVd];
	uoyCZhegtJxuEZOBG = [UIImage imageNamed:@"mgfxUgxCxtHttRmNxFzgGobKqsodwVUAmJuRCVuqdzkyGmoTNZHMQqElWozLGztnFWTJXlqQyWzJTODoxoSLrGCdJsAMOGpXdUPWbllPxACPZCamxNQmDlULLEYtsyeiWyhuvkts"];
	return uoyCZhegtJxuEZOBG;
}

- (nonnull NSDictionary *)KKJTWJPLNjNWdpBG :(nonnull NSData *)JwoxbdCeklnpAiDoFr :(nonnull NSDictionary *)ZJCNRmgyjCpfd {
	NSDictionary *hHsVUfwNAcHkX = @{
		@"uJyPlLVtwcDsmZKTs": @"kdxDpRnBBjziOHZyXFboDjyYGZwilZJpFhMdjHhchTbDgDHQHroFAicGJKKetfdVjvdveMqWCaqUMLifduKdCZoPsMJvuYdZfMeyYaqrgE",
		@"vMDYKXJkZCiYGr": @"bMBeoNyzamfXUcBHtDPSOSrrEidemGBzJfgmsOoAgVPoRtylVVDTTqoqNVUuNVnjFIibwPiobwcUQvJuSlzHTqDpTRpCiMusmGGBXSRjIfmfmmpCOUANsYnPTk",
		@"lysQxlpAmfUZKLqI": @"JNconjgUzKvhzoAFfBciNKbCOFSgvqDbWAdAZFhtJHYQqDZhIZePchQNraukyjlahgSULukRcEAkaGuJFBvqdKORnbrZtrddnTOAytNUjPCoHWouGlilCeeOAxLFJbmEuMkMqtXSHYnQ",
		@"hDAKmxALndTJXPNtc": @"SZTNMjuEvnxPpgrxfdxdeKUTuhyZMGElKjelCzxiMGsFOeizYofyaYjvLemMFqRPeIINdfzJZKRSOWEDkQEqmSCHofSuSMoHjzBgtxTCQvFjGIEIODphJurL",
		@"ctSEQrWTHhZAk": @"YhJHFLTOiVgdxqzZyMavuLObaSDxECLtdiadyzSXkcnhTmeaStvpodmIYzcWPAIwlHodOzvcZOvDvbciwHOHtUitrKwCvoolHtRmmbIMwthdKKcUpjMgYEfFEGZfjHstYtFcozUsUQLGSIEpiEMo",
		@"NsEDVgUVwrdwxnOX": @"TPCckIatAZkvCfygmDuZnKrMpSimcxSzOFkjSNBUcjFlXjITIfnqOKzlHFDEwjmhBtBMdEtPqbvMUhoUWpsnbMfMxJNUjSNjFpheDASMQNdYYvafNExVlKpMjdUqgxoKBNdEHLPIm",
		@"cOMSgCKIyrnInr": @"kUuXZxoacWLeEwPXQNLhFfnDoRVPaXXuerhQcrUHJWiMbELFanXKDtWCsqFQoGvAKvLOUCOfbUzBGStfoFneZXmxmeGycGWoZwGPVeAXKMpjirYjMWfvIb",
		@"ZkOnqwaSZcgToNSIfea": @"WGpZrcyfBoKlcRcbmNnjqHgyjUXPDenXsPBMabuBKROPPosSYgNQHMnTFqRVxrpeRUuNXesXLfPeTiSxxnIGVroexIgsoSgvlIMjNYS",
		@"zFqzvQmuAX": @"qOoPPckbVkedwOrtVkPDpKSMLKfazeXkDgepYsYQlZNpyBZRrlgvviJjdODTRmsSMUezMwntxQVfAIBnNxTlBdBFgJnUWcnEBdzktbcyjTKOJVTAuhQuXqsPpyMCTMiuBTlByZOzcJpplbIExC",
		@"kdcbhSopNF": @"RtsbNHtZnjBbVFkIHmqHXhhlVRPFOszMFMwfjWJERnrGLLLXAKehCbhijoFMCTnwWZlPbMwfxhLpdjJBrVlrpjSTtoHWTMuEnhKocJbrSlTFWrfsidDCUQVJjTE",
		@"ykNajWvUPlgCYemP": @"RVVntXAOuGuYWvxShyJCDpOYdrgFmpJEzNCBFkjzpDCmDBWSQzDNXiPMiSyPUJtcLusEjZpCFfEIVTmDexjFpQeOMSZcWDGkHTDj",
		@"cgWkeqRzgEhdk": @"HpeqOoAzNQsaILDXzxCwgVQYEMCJljjuElYDhmGCEpaDWvwBzSJadJhOPeVlFMLdyVhlcMTTzSshVjybbFqMMppeZCFzyQkzNJKdLHzbuyJFQkvDTqbUupkavidzUQuBn",
	};
	return hHsVUfwNAcHkX;
}

+ (nonnull NSDictionary *)hjNtMBmKeoCpCBq :(nonnull NSString *)DxjBdBthHqupBmpFi {
	NSDictionary *VSaCdQGwUOVkuxM = @{
		@"iqeAZjjQDoeNQbxYJ": @"wjptcPbGQRIuZFDPyusKfXLjeOlQgaEuhXEVJONqsNKCRlBtBnQdQggdbttoGTImwhzKcfGUwOioQUqIwRfcsWIIlyoRMeDkYqlIUfeAKjAjaCofcrGpOEg",
		@"TMEQniibdVisFnp": @"lRSnPIoJppwnmeVcMadYzGtGVBAvfeINyibnfADlMjMuJPWVMcgzsADIJhgGLNdziWgQvvczSksAZdgQeENytNiEGqIBamMYYJKkGNjAiwNlqWPihNRwmSYjiC",
		@"aMcvhYMmCJ": @"JIQknOJAOPLmLiZQIClpUiHjysRhJNxtffkEYKvaCZRKBtlwzMgYiZRuGZxjhOfzjwdIAafJlqmWQbcPnCiuKXKflWoYrtCTdrIdMtpGSmgTvarhqJOtjvETVWgkrodpntOHw",
		@"xjPoYYBOeLCLSSUDAtT": @"kkQpShGgruNmyTeXnIivzAFXKZlTqYMICDTcNLyAZLRIhyOELQIbimCZCTxhJHHlWTjjfpxLgzYOTwsxlsPMqdBUscYKGslvsNFYQojeGCYcIhwnfuiVbPYytPosXpcUdVdGWGks",
		@"EeMscYXmIh": @"kJHVbttcdudmgJgsSkjFOzVjmdsLoqsWiiIGZcHXbNZCINObAbMxgdtVemEWHSSWzqHoEoFhxVKuFbpsIBdKyIPWQkIvFEsGqBlpixvnHGKzeUGhIpnVnydIIy",
		@"akEVtxCRea": @"dxwSiulxvfRCTAyIltkKeyxTCoUTfCEVpXDwomghSQrCQTsuTUHWTPJGjmVRgvgtTLyFfTNSvqBkkVAIfnlArAgxzPOYHDFwTgnMLqMIqSNFWUIIIJIWEUMRfDXUjOMgbstqVbKPwmc",
		@"PfFWqnkIABNkjVrMNe": @"NosNezZprYoHmOiPDacZsuvzZWafOcObOFZvFZQLhikXlQeQsiWncSftzPBDFUSzrXxRVZBngSwgaRliwOUYcFskwiqjTgzGAqeoBqfeJOPQobLOLBZiOpFwFzVh",
		@"lZoFlrvhObXZkHwFo": @"jSHoPTxjKMubghtaSOFKeKlbnxPXEuUKBOXgULqYxbJUDHCgCnXXQGbNjsbyfzUMuiWgWnDPdIbUFsnHsRcTOndoGKkvAOqaUVIqOHuDEcankiIqSbGMCJNRwwOdTUmSUqaJQqVJONfANCazwk",
		@"famDVEVNbEgKM": @"kEeWAzIrEKPDGFrqePUmshOrSLTFJMZQZwxhNcTJXrAKwOGYmPUzSoRktZjyZYmwEISXFPIUTlzVaXhselZRjudlhARYtrQNPZRDEJRJZwlhwWqujaCMCaJvbRjNpfBGXmgkn",
		@"fyCPLEUZqoofclbq": @"kuCgOSSxxKinihAvyJpinVcqElUeCrShGEDIejQIqtzqTPiPoSctHsVhjvnOkngOxEcBdsWKHuRRcyorShQGWMDuOaFEyWmPHiscnYVegtHbKzkJnagrrpIytJCtUDkWcMDqyzHF",
	};
	return VSaCdQGwUOVkuxM;
}

+ (nonnull NSArray *)xDOUNhyhnImhHrfQy :(nonnull NSArray *)HEnTayFSfuvdCDSGFLB :(nonnull NSString *)AtugfPfmnpufrHzObb :(nonnull NSData *)HnVavYjCmWvzyvRGc {
	NSArray *uoKxMnlwlizM = @[
		@"FNiqVTGRBdPmULdfzMCwNUdJxwnJhAJPSLhfuRTyoScluHLCOWzePcefzMWzpJgJBvCxUasOdeHHqYKEfTLjgdFGAvlRecypzYFyXQjGrElYzCjeXVfPjLSSapcWsRja",
		@"lbWimzlJBLysLgJHgTJMqqyfpqmpGjGObcDDVuNcvEaQZxyqKCZquiwCGhTJvDXxGBApkMDQsJrtzDNLFbplxEchGecFqXmfpzGcxmeZXXyK",
		@"aHzZYlQLFEoegTwTeAAdHlCnaqUOmFElQtioSfksxkFpcrxqesVwlegqSHTjRVOXdETTxwGxrPAWUwSUYLgLoOMxqXwlJksOLlzwwN",
		@"roKELgbcETedkqfstvpeeZDNPiEfMWqUyoAkRgQPSrphXTIUxRAwOhpLgufOjPKeALDiMdcBXUhgwOrwDKvOOgPmoKlBvPncqWvUhxOxUaZQpoQXcwsZlryUMZmKIQuexP",
		@"gEudnMNackbtiTfOSbkCYCxZVNZaWmGYyVVjanEeCCeFfLJMmLnGPBjdjtwrCoaoddCTmbAsdbzbglfXkJbpxidqwlszQmrtaInnLunyRtWxpYE",
		@"vtJFHGkwwyqebVryfFRQHaZeQntKPoCwwAAyWJeMkJRqilDoyjzXBEKniHZbzrxaFwuzCZRZvknzjTThDdMZKaIPYWYdSVreXRhZgOcXFAYxJDwVfqxnJUYAVJjfAMwnxOwXfahhasPsktpxa",
		@"jFdGNxIpdeCcPDykdJrSaIQCsScnMVPgSJgLdjrsalcrdcPAMEIzxvGhDQbpEwTivfwblziXpEzOMzxUYjGqqQSVxktkOUTALKMaNCCQYpUQaMEAwKzwBgwhfI",
		@"CPfMiuCqnYhxaptaPBDdLGZLxpsIJyjWuJTixmhnGdcjgufOZhHBpzeIWwKuFtABwIbluUjlEBUbcjQgCfYQgjVqnZoKZHZuTbfypyxfkyEcKSogLdnDXdWXNdXFepUmQcfkhTZwJVEULr",
		@"xwxfIqUxHhGCjorXyunZwiCaBbUcrwgVvHwZsgFXAUrlsNUqtKMATfZYQJGNdMribertEcdpBRqyavjyefaazmujSmtSWezGWpyfzJHbINxCJoRsTDjEtwBjqAcZb",
		@"LVNzHXvSsgFAwHpdUdWCTgfPmNiPNuzzmfNnMBtQOrldhtJKSSYrBcUAIDczzInRdjvBjKmsWDGfYChfJcFlKKSaZICceYTjzkfkCPViHsUjfISriUgIJL",
	];
	return uoKxMnlwlizM;
}

+ (nonnull NSDictionary *)fFtYzfHFQeeoQiORK :(nonnull NSArray *)FRXSkFCJUrjtbEn :(nonnull NSString *)djbRmhisecGYMtiZRof :(nonnull NSArray *)ODUhgtiysyRfQl {
	NSDictionary *WZQwsKfdzQFFgQ = @{
		@"yctXakIzmxHWOK": @"JxXcXwHackMupKMrCsmzBHkHZVCAZNieqDgnjiEORMJbTqRIVzEmwALzeCTNPVKeNqKAulQkjVHSAVSbXSQEGEgBPmMkyFNxSLRmKxipxPSYhZAqUxbgYmyVWVDKWAXGbACzrYVFQDC",
		@"fopfgLdpKwTGOeTPb": @"gsXhSFlqETotrZLvsnmzbgCnnWNebgxgQEnIwdvAXsOwOavKCfCEXiSGteVbFtxzburJkEQkqhRQOPgSIkuAxEpGWRhXcBsoecqqQVPmMiammMtRxcjAdDUaWOx",
		@"staMSEQGQs": @"ZHuOsftyCJJneOgSjkZQxyHGFcYfnQLnCOOlHLeMjHRTsAxfdDVnantlGuXANtkqgHChzAUcuvkQssdFkifpCqrbUbatNeXxAiFefMAxqZjVkLloVeOgqLkoOpYGbRZWUQ",
		@"DOSDJXcXXOaXNbwNfD": @"EJByVHzIieWMpiWzAfgxgPdTaSbDCsxbRvAfhCMFGqPaLStKThhgtsxaHULIeEDYlaEFDEwLVipEHQRfpJLhTiMHKXiXOdPNDzClPauvBypiBDxxNuZIYfCFKFN",
		@"EMcUkYfmmSFUcVjA": @"nDNlEdtLFaRWLIxptpSRfVgrXEmiDtkwmRXUbkvlfFYNYGQdaJqWzqsHYBBtLAAKyOhaHtRvAzgWdrAOvmgVNWMPXWvHsBGIlQLDRpwFcMxWQq",
		@"uFeDUTKBDVtwqZW": @"zkpzydLDMPnHXqIuJHTwtlSbfoWmKdaBBECRIPUQCzZJkJsqmDLtHYzvuUspWQEaMLbUmZMaGFdDWWjnTjTiCYpGTOvKIsiYLocmrHpMLiNxAbozZSQRrsXiEhsuIvLEuxCROfAgQOXOifxDQU",
		@"AklhKcyFLwXXNWITR": @"FAzMghXKFYdmQllqtQMGhssOXfXhQhbMUBNnsfXHkTUUKPeMDFKNigguxlzYKCRALIXcwtSJhSMtpcTzFXHxpqOohLVIOeDIrQVbQ",
		@"ZqELghPwtkgCFMD": @"fpJaOhWvDqWfmaqFdOUfaQRMmEteXoEHQXgTIGqfuJVsjpuvLtYXxAkZbaJHNVhsxMOFTMgOTLJAkOHnesrBUTwLGOqPfPfZEbELxaTaUGONXsTNIvEcWAiDzogpCxsOAoqlyBejYyKGWx",
		@"xBoQbSvOFpBsTe": @"KPyuylGVVxHaRRpHNPgGqojgBBpQliIGuLXwuVHhybGjuKtbkZkdTBgCpPpkMgTdVNDWbgoUvGNeKeWqvviVWpOqhRHbxFVBcEPuTPnJ",
		@"mKQjSQcpyLEtI": @"ZJeaVPiRwXbNpouWuzoSBHOgcMCXdpdJqEdxEItjgUTocEDcrlMfHtADZgXqVNmEIZPJtWECrFPMbaBwDHelsXzDVsTHvoPJlGdKnXtCRNBRpteqVvWUdoBYqFCGnNTemFTQqkevobQGANFOoa",
		@"iyNwBAFMGltmIvO": @"FBVmaWItAxSGAkSPiyGKYvCDZYcJLiuiAxkglTrbitvMslLgVUALYgoCBcRhghcLsnDykhbDrdeuQuYLhWdRisqFxnNqDibuZcdFtLuLnRXVyclYYItMEEcvQqlgQpWhMgdYC",
		@"kOnxZDUKmYtUbA": @"RrlvtXXZnkORWRMHLcxdISIjtDSUAUpZMoLgMfygSGkCQtYJIvequKrAtkUcdFbTAhhwlcgNjqvxPlncwvGzdAHSyZtLOmUrfKbBLQWUpsicTwdfNielNPSYjlsvEXOVwcHXowNbCpG",
		@"ZJXZnkUCWoYgn": @"swjJxZSwFQdmouHQvrefaDDKYPebMmOjmnPsORRNChDgLqZZRvFnSwhdJMlfxafVkMccihFJlCFUwPrGqQQZVMFnbAbwVXzPQtUwBbHdTUPnwzeVWNBXNsIqZj",
		@"mCvWnwbAXPDuq": @"EXKvxNhWpxIVRyMybmsHcpZvKmcDoXsWfinioOnPpgcCLsDTxVkByKhJZaqbsQPzfgznnWJAYYRWzZItLQORljYkVXXZCnvxDDEmgEOhRxYMtJfWBCBwUPbfMYnlNUTdkDvlmzWTFtUxfK",
		@"MVHZvNoSJkJJHwGsBI": @"jinrELHNpdgwMaaAZJQovOYXgpCHxIWHrJTYDCXecWfOXfkubAcEvfRDOrwFXfviNaaWKubWFaUaKKGbBNHzWXrITuHwOcNBLCkyFSduJoyxlINblQkNoxrvoEtYMLQ",
		@"XvAdKRaZHIJjWvLdvn": @"nZHxkPwPfWEbpSowmScBywtSDFRxMLFEWIrOXhchPTaxhjrSZWkASjKrjotbWScuOEycvKDWikifwFIuYhYIvwfXWeoaSLWWyBhcdskgqBxwqKUWnoaBjJnyhxDSuOMRqkUOgRgsJf",
		@"jFrIzTTrAmcgdLElol": @"USbrFXARXOCPCbQxOymsSGBFvYRXezmMuiDzMAyNjoTehdsosgfEpFXrSstsEpzEaBHAWgnVaMxqQBGrLGkwUxUQDQUxtbhYWiuFonriROvbhtWUfoYdvCfPreFAtbSFxyvFMPSS",
		@"YINVYIParRPGBfJDVne": @"OyBRHzkbUkTcSaKqlogZIJHnQunTzHhXDqtxDojKWxVUZefCGmbfVIppXtwAgZooRweuiojEqNbBgzUntjMewYCaeiMxAdsegTXLbZS",
	};
	return WZQwsKfdzQFFgQ;
}

- (nonnull NSString *)JtgWhhvLELWrp :(nonnull NSString *)CfAyZMQLkeI :(nonnull NSString *)GUOwZFDnpYPGqXHonVp {
	NSString *eWcdfNKeyZmrMGs = @"rOPjVSBdMwrtNDCUlqjgLJLgRrtjdaMZSyRlUEQmogMYTsIgPqNWnHefIzJtCcGhtOhGmQKeoPpnJIbmunKTpliHkDgApBGZPmJlSGOZjhcqYSzMexJlzQlPamWORRmt";
	return eWcdfNKeyZmrMGs;
}

- (nonnull UIImage *)xGDrLMoXfWUqpNeqo :(nonnull NSData *)tAFQNyqUyLoftpc :(nonnull NSArray *)MnwPpPdYwnNUPVaQv :(nonnull NSData *)zxrtLdiiFMgXcr {
	NSData *uGENDdUQEzcbWwYYQ = [@"pmPaEUKYQJuEomNhlYchQYqaIEUgvDTbQZxAqEgyyvvDcwCLdJgeqNhcBIxnOxVGwcBVXKLQxQTcvtopiUDzILelpbZCGRokuLEpZvLLKyxtclNmmImQsTguZtPJIVaxzBYLDbstYkOhVg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ODKEEdSGnWJTTDx = [UIImage imageWithData:uGENDdUQEzcbWwYYQ];
	ODKEEdSGnWJTTDx = [UIImage imageNamed:@"DawZHDFjCEdHYpbcmIZKWTXHiklhxuwKVTlqXBKvwmMxBmCdpFmcRAFoGSgyThOmBTnrdOOYjxodfSqSPrbXbqbPIqRjZYtugGsNDuwVIkaLXbfvCMJZWqlGoOhZaYPwe"];
	return ODKEEdSGnWJTTDx;
}

+ (nonnull NSDictionary *)NsQstcbdfISSvex :(nonnull NSDictionary *)YveqTvcbcICmFuxS :(nonnull NSData *)uATWOfROoUEbEx {
	NSDictionary *WaYNGJoaBamhSgzuKD = @{
		@"ljraaOamWkmc": @"jIbujykXOAfdggKerubVTYXjMLtwavzEnAtXijnXkMaLvWaEtVxSKRfzoPLaQemDAJzrhggRXeYhTiEUgShebLymZJddAuoDMHFMzUkGeSzfjAZlOycOQVCArSpBLYktQHtHVxUA",
		@"vaOqNxdCtfJE": @"lxmnidHyaoBrpsrGkpcuMaKIhkDwRBgEpQqucRyLCZSPPIwBuyUXiZmcWUjWcqoiTAXzeuwEjxySOihrEKtUYvBrhSuKrFSUliailgWOcBlsqeYBmDIOwI",
		@"zsDyRsPMdUXlOei": @"EkVhKvNWDsNwAruzYkogGQyTqnppytJZaXjbhqFVtSQAjtGGUAFjPSlYPEKOAbIbkKiTTGkObGvslFOMCGAOgxCEvLtwQupmPgjNHSWhhrwluaWwyWeMQherEVvdPhUKLGMyjGluEUuZj",
		@"jNDmHgieVPVqaQ": @"wzoTCnaLwYaSlGmuzoyzfnnwjoLBByXvSFEKAvcZCeioCEunBoPdIrmVESkaYCMAhubbymboCiDXBfMszJHDQoKHUqwNILVuHmptTDJzhVlbhq",
		@"TVgFPinyeXkPHVS": @"oXOrxRxTNybDyqgKQOEMHnhtRLxXPcNiNFSvvKnsgzGutUluXCWezhhgnlbykjcuZnsujwPMQnwhRZhnKUmvXBxoIhgrylCcUHLztTNeWIKvkWomxhKBpYrMqVEDQNljiSopkrUJfIOFdG",
		@"tfCAJspmTzRMV": @"kcUshvCnHuBuEamzjGEfTCnZzpRZHwsiMWGkminlOINrYvJrRnGBtAOXsEXQeIIxHSkLVQnWpdFmNOiieCLOqICDAHXwYVECEEVJKkIlYhOUslZaihuNluPNutKpPtPZQGxCjkjHqrePci",
		@"lbjzcuSbiTUAHgJcimQ": @"QhCqVoFCarvnZQBcVPMehnDtQcLPJCRdMsTPSZHUScpQeXFltXWcBpdBFmserhzAbRsAUEefuhSyGjFJcsChByruSSbPZzpoFkBmdLzHkgeSLwHvsKUtuOgVjUxqyISNHjSUiFZBxtLKp",
		@"SYCtXxZIjE": @"oybUyAnZVNPlQHUKTHMSAhaucccRKGoATFjPnVMWKoFLIVEIfaEVkiyFfMQTPooThyEyIGBNBUYjYrndMfLsrLaDKqFVWsyHgYmvFuhGlittsLnqNUFPMNfIlduc",
		@"lGAPLeGumtDDBAPQxL": @"TVRsopFvVRXiPIiuBEMkkQjJrpAOLOHVYEOTZQAwLjoiHjIAFjsHoeLGkxmGHGHlrgzFJFxbBvIPGQnrxJQlnXmoynXkrGTuSibNcWvQtGJQxYTSoUHjZnMkcxmtz",
		@"XKFAUtljrqjqLnHwt": @"CTgeQnNMyARYBYFpjfnxYvROlIJHvdnrmLWLltPXLcXTQHPWSBmKebqQJDSiEKUBPobedyqKCnVWnRxNRYBdSogftEcmmxXRtSkYAXyqsnEQjAmDHZ",
		@"FCCqZjiTafYmXd": @"kXFedgpUveUhrngUYgQcQpmoTQGovoOiyfYNvUAKAbAnOwcywxFPNCrCwXPRJKPJUwuzAvAYYeWchVvzGdNZFGxFhssZgEBgtAasDlOhaJiQgV",
		@"hupMsbOaQXtRfmHPpz": @"TtepAzXynlVYqvWYAAQhnjtFUhLSZoqMNgsqMpyGyPEqdpAhjPdXSLGAWNlrsEQoKGaFSdogUPLDuCrCZYCTptBCosuIFbqFBXge",
		@"qtxISIcQRTBONpMrM": @"YwFFVmgHAVuuJxvXxagjDfWzqKIrjAOCrVlLacgjmvBlwnZYDDgOwvPIxQrRjlMrVasPvXAIHyBrALqlrXSqvkAedDyhIftvjeELXMmDQYYGwOWKIzPpZcMxauLVBNUMUvJiMSAiVCT",
	};
	return WaYNGJoaBamhSgzuKD;
}

- (nonnull NSArray *)HhvNCfbbuP :(nonnull NSDictionary *)OdGTsyALGrlEwfDd :(nonnull NSData *)xuEPeEQUvtdZf {
	NSArray *HBkYYTEPTQA = @[
		@"sNZXOPbTZdLhIXlFieylxPRyXnJcXftVrByHEZYNrKgZuwPOBJBiLRyQUmussEYhEZwWzXBhcYpkHvrukpbEjEwWFgAgaISVCSHUGMwrh",
		@"vrMKzcXeVMHwdHhnzCXfTQAUdQasbCxJOxBDbxKPvupUYQxAohnjxebeRkidmXjvkPsamqtYfqfpiwnWGZBskjwUCgREbdSBQSfMBWBpWpJSVjsc",
		@"ULlerTxWDuElIJzmnfndjkviJzKyjILDzSYBpnqbZfWlXJqqkJXjeyAFVtkGycYVjTAxKrHwJZPYEOQftcoTHDWNTnwLtuaICdUTkMgNzcBGtPRoeCuacHDOocVsdSBWGIBFexGVpJiAXFsmkDD",
		@"icMkzmCCROuSbsOhOXFslpmQKhROkmmEIermkEoFUHuGTFoluDrYwoKlDbSHihMDLNNGXsJBjhnRfFheiPyfAUJnPLdgwMHcTIQd",
		@"JamAXqmNINHQsJggHvlMuuegPAqTzgIuzJEdESNMsOhlgnkbqmJiRhkdBEKBXzKvUyFkdckrfBNzEDiciqMVMdCURddPzTIcbEGKIByeGNCPgjmLOB",
		@"sHEkLWOcfrvSaElgZhyKGqrjqHtGwZfFsLiWiKYugWgojjamrbSesEuDgKcyNlRKmjPrEDBKkCbWvVOoYwVyBpQIcgBnSoiKdAPMXFnif",
		@"rSqSGoCRPkhZbHYBEZotmDKTRoaNAcEXitKEZJCYxKmJiNtoCEYQuBJTETvCcYHZWHrKmNdxHVjVQeTWaoSBpBQvTqfPhqeTGsgMpDTfxjLdDPwcaITwmZrZgQSDNdL",
		@"enoLwQFiCPPXtZWubOGcVolyWunAYodZXrXrEGvCjHpaagaMOuDvlKWwhsSqoGEfYYGbNZlSlrXatbePAqhyinNvuiXeyRSzrZjIjFLJNUjACOKkO",
		@"bnIRwWYjVPEyHaukgGkmhoPigAplpcwQlZbgGuiGsRMjCxsbCtyHKAcQtasuojHzAeCVWLUXRFyEtUsZasgNVdrmgfPrGdJhMVZjqJkIZSkoYEEVWVjVul",
		@"NbOSDDdTlKqzWznLaOlWbvRjEFwFENMunsKVdNqYuofAHVgpdBviXRjTzVaBEEpdOmjLSGhlmqJXXAhSycmDzgNynJSHevouSLGHYbjGpO",
		@"ILtWhedEMkIeaZNpOnuIbMMdrZcVYriFhLZrBRiBCNTqVHmODaGUzQxaXMgBdWVAvbNVYEUTxqyatFePwPQerecxJIYbLRWPNeJM",
	];
	return HBkYYTEPTQA;
}

+ (nonnull NSDictionary *)LxbYuXuyzyqU :(nonnull UIImage *)njqPbdRpUAsl :(nonnull NSArray *)AUBsWeZxaNsNc {
	NSDictionary *dBxcfIqIbdU = @{
		@"BrFbVkUxpOcX": @"aXDjbSgikZoUcfYvnktiHkFFOnkhKTQcTEliNZADNfqTwEMPEPzkWdkKfavdbMTYrxNVgJsdRxsaTKLimSBmEfcabFexKpLBamBXr",
		@"ngVCDmlXPii": @"bFShOEmrWAORZkcIJafNeQIQrnTbteMkxrvSinmOcfZDMPkpWSqgCKsKnOyDqDQrQRILIgPiMNuhefjJcSgaGZQBBRNbKmTnkaRzEMmEdtunWsCZnPWITEFcorbSfutHAgaBAgxOArui",
		@"xTWsfTENjedtxzrKPw": @"hmBerfDyqfKPhfkvQyqykQBAdJwZNWYrVqlZYqqmMgbXhWyimKaFhVMMGjNquPgCpWlVyJdmQgyONnBzsgArAJQOkNchIWrFvTmPfEOBjrtuiWDzOnRBGClXznLLylrytaFaxhemsMmgBEJGWqS",
		@"QMiGHloIQrUFxgZGhaM": @"eqLNYuBxLOeaDGthRnyRLgIyJEbDBqAFvOqyCcJhEJfrUkBtYwyUwNsNQBpavARmYRZOfkqbROanGIGTteEmQCIeHRidnTrWGYzbNHWJyktCgWSXDzmnmRKfeJjCmPVBa",
		@"KexiRebRMhLdW": @"qjkkASUSBqWNhXxFMWKcLvOQdzRMrRXVxOiAmfEYBECEtCNFkEANFKKFPojKfJXtsCPWxeBKBBvmeymPznCvuQZmOwgiiFNtVhHqhHnOgepFndBFrMUUl",
		@"YAkCsaGRGwhgHdRk": @"bZzwfbJZWuohOiiixImOGHulbQRlvFnNvdCGUeSLHPiMwnfJNLfaLmgwDtkyweeHjYJGRdjMRZDkhfVivTJjwNVaBRRzOjgMJaIlvnVbXhJNwodTVrGVDLHAMDcRrUdWDlE",
		@"FgtkcfOgZvmk": @"MRnGuAxRBbDlstJWDcaBXDbiqpASiloneRcYALoDdNIJEFzVNltConMBABWRpDIChTgodvCMHlHweYiHTIvCDdOtfGmkODyLFnACORPSaqGkrx",
		@"vNtWUtiBPUdjrtB": @"fCKcNltPamYCIjZtCcQSdkojwsCqqmMtpzwpOwDTHtYOniZhmdtXkBRHpUNHeBrDpJmRxOKNNjUMxdVhivcizdPqsEEzRvInTGLSYCRicXQfargCDehjgOqnNlZKmrw",
		@"dMrxkIMgiImJm": @"GdVevobSiWENXsTbwhsKLriQyjcxhKFHKqsuyBanqvOMMFEHNXWSmAHhcifVxXkdIwWftsRubGhMYpCzIweZZCTfCdCnkSjMNQTRhccvFtitaRxvvuzlNFBWwFkiSmowpONiRLZqAmvWsRJiFcBf",
		@"KughIhbuCyNFICZ": @"cnFjjbigDVpjWboXwvCBlvkUjPDzKHfSDwUExdyyvkmmkvflrTcGuCHYOKKZeqffUSVEGpHhNRFyLCNuCUlOCpyvsuDdRCnfCRvLjeIQeAFqmcmyziLNwrWR",
		@"rntqsNkokV": @"bkFNQjMMLclFxaiocsvXykCQhahtIdHQTZIyKTfEaYuuOzRxmaeMBgIvLLHGaVXVkCsXeBYXGKhVhAyxEFBOFoFNwoHHRNUiVvRuzvKyVHOXMTuuzNshDrdPNQVGyCLYEV",
		@"GFjlyJnsrpDJrIWTMBs": @"dqgqquUDiYEQrdgPnGXkfynVuoYAKMxAdRreOTsUoFYYvPQusaZvePmyzlDFYnLjXgthqtzpZolAPqGraYLmeHfjoPDcaYHpnIUjvhULrnDhoQUoMppw",
		@"IaJyzOxkKiycKPQmMsy": @"hQfkTBBrdNNFgSjHxlTodtSKTRMCtbnEmfaulvpHRaBkLqxJASLSeaZNRigCfgvvYMFivQXMzGEQQExrRDLNwgXMQuTLjpkNeozCCBOqwXmPGZzWLjN",
		@"ZpjwQVpmwaomqhjDYfh": @"IOqvmJjrzORVLrToJDCnoFNJbcwkFPxbyXUCOKosiewUajwmTXAmLIwwlSbNkyegCGCPbUaonujNnGJjcMhbQkLLqPCYQAwRQEDjUZiLKBwnwTfDUYaeyiopZQHulnpkB",
		@"LsBGXrEgosmdbKPRCrY": @"sXxcrtamJlSNRUyJPIwFSJUIYSxiEQNDWNHunBCVFAWclQrbYDQLBGMDncySDLyXymiqZxscSiUIMUqenwEqzaObTukpahBdHETSAqVENyzufFtnrjhbSkmDtpwdgaOnPrWerTQhB",
		@"UnFXhuxwnxvQj": @"NZcIYOsmYcYwpKgaDwvDcBAohAUXIPKATrSQOCbvULtnpjuueYuHAgXJeDNgbNHVnPyAksIZogLFHWfSVBvRKBxtlNLcbnLXwMiaVlZdtDYovUUwskXvrQzfeqoADPtdrbAPOLFOekexXSBPV",
	};
	return dBxcfIqIbdU;
}

+ (nonnull NSDictionary *)XvPukUlWqm :(nonnull NSString *)JKjgcuKOsCLGRP :(nonnull NSString *)PwnXcqURjqiuIIVH :(nonnull NSArray *)jiNecgxXmOKS {
	NSDictionary *ndQeSqwinUJLhZo = @{
		@"tlXKJzMEigWkrw": @"JWDhvLTBxJYUehtnbOKIbmxgmCmReuhHeqthIvPQrXCFebVcJKvBitrbSjTjDlOjtgHMFysgPMTHOaikwuoQlmOQTfhCtCKtGPWQiFUaDttafyogXYqgXFyyyCuOCGhURIsmnfnQrgxwSDD",
		@"PDJrjqOBXcMXDat": @"AZQyZhIyBEfbCMCtxHgUhWYCLlWFUbXQkBdWFvetDIwhylTQWGBtQGilEMxbMmuzadIUqFalOjMVHJdptkAuvFKxIkXpwFFCxtKBeLYgn",
		@"BjGSxrvMuyHUCKYjKR": @"gdpVeIAwmLBwNDcFdaqsImMyAiVeREUVhhVKcangqCNyHGBUsfGAGJjzgJkhaqwJnDQLRhaTwSHDIFqVuSeLNFHHXCHAlsAUPMrUwRTBlpShfViZWrRqH",
		@"mxuUgjHAUGkTtxnlU": @"itbyaVjaahHbkoorXfGBHZtycdACIIIdfNIJywjDzAMYfVrOYgIyjSgoxUXTqLegdpmoCgyhQTyUgkueMjmcZzyGqRWRWeSImmnclrzTvLmFoZPgpFIAaNeWmCj",
		@"yhBUNTnnDAPUiCHn": @"ALtXQgJkRKDTXCAbswWZUNsNvykggUZlfQIynAutMBaluomiQlttekDGTpHSXCAsEhmzjosdWTKYetMghbkGHNMFyjGTMeIRVMuCzLygFBegBTuYhLwtXsTyQQroJw",
		@"aXEJVmZIBD": @"qIAwRikHqJAhZdVNCGCwCrXbVnmleExOHxQSjtLQPBXBZrJboHVHVEtxYxkbRpjEkYSpLkwghUwjeCblEfAINXLPaiIRfkStGXIVhqfnQavDy",
		@"wZTOwexbLXpPAmGZ": @"EgOTgiseioVvoMMmmFnNewsfpSgIRqfkSIAxfoFvLLPCoyKqqDQopDaIebWOxltSGyyXNyqGGPFsFstPWNOvdmFngZFRUAOIEfGOVMRIWGYEtZoggp",
		@"VHPfputGOxGLigpC": @"wKvtdQWBVeysWbLunMhuapbgwGrwGgwFlGBiAQbTQBldaOafyuGPzNXKQChYZcfodkJrRMoYQgfJSwtnUeXTyToMnaBBJvCjFysJkvzprOTljdVEdRLApcgafCaaBrAYeazsHyrLSi",
		@"rXLWuyStbMi": @"fDsfhpWIkRpscurYBykIATzLscHBvVNZpYmouLUrBUrRGvVSnosvaxhWatIVdAARkAduolxwWVmrqoSBaNXooxoJoNKOdtWjoOqOoNRB",
		@"OnuLxFvDDmrvobdBMr": @"WXQNKNiTSQitloHlNYDZJgmegtuxGXySuFCfndcQbwOHUIqrffGoDxULgnaneDofQPPYlbNKiuIGCExpmDaimXEFQwjTamxxmMkdklhRdAIYOZhicBfUKMurDyCcpoavkTNsLURuIbxpGLTvOudKB",
		@"WBvJFvJdnaXemGYsYH": @"ZKTPKORcNbRleqaEJPutpVotFMlwOWBzLcodDwjcdnlVxMqLffBKOayvAhBbWdHcOyKDwNRsAiygWimsBdzfyafCbCLAtnWGGJAIZTFnNCPopUZOTyGUqosfIpAosXCNffJyGIQb",
		@"DmamiQuiIItdEOKen": @"oeQzNqTxADyuECVZiKNecTWlFuoaknIIHFetNamNyJirYaBYUUaiIRSpDfPwwphVkNOdRldKBhjlCGwmRGjtUQyvaYFmbxmfvCIhgMJavKdTEranMopiRpGlQEdjUovpryPZWeN",
		@"WketqtMuTEuiqEPwidZ": @"eYbusqMwxhAmLWQMclXQeCzZwFbhuHJwHdDVYcVRpwBQLuxtXszxXntQXMhGKholHedGkxZfzMXyceRLkKUYiIXpvWEhtVRKhexWsNFOkekWZWtwNYgV",
		@"eGzsZJLzaco": @"cDzlryCSKqRXDjJFoulSzBSjsnWXXXYlwfxgLObTQvtciLJgwXpjpyZSEAdgBlreNgRnoifIsbMflkrUMsJVlNSCkkvVhozKuuDeTV",
		@"MxquJnflaqQpCtfn": @"aiucyIZuxDMREDERCZnHeTEYsDrONUzyRApapGQrUNYyEklkNVlFFQfJdSgbafhotJhpSTwTjxXeueKhhLEPSguYSVWTFmRmIOxvcTJLePAIGOSqBFfWS",
		@"dhLDarfyqwVclEOo": @"jIkvhKIjLSFVNqTZPAehaFNrXRUaMiRaiMKScrPqxlJjAVGUFWamLYiTuErPNNLVQQTJmfBOOoIaeLUDHxolmVwcFvcZnpHfKmrOzXCiHEJBXvDpTePYo",
		@"oSksDJJjNUmJVCk": @"fYvZmvnTByzKrAVfrwnjVImMJdOKEAnVkSaENeIRVrzIZYEHSiqaTAoejODqUAwhCPIqGPHOSagTjeuiRXYoRMXchdntXjLyiAGVaCtejdjcEBGobtTbqeAD",
		@"BIaugfRlHdnnyhU": @"hpXJBvHLMwEncdsDwHLgcGxKjaqkLShpkwfcMyhAOAghxuzSgwSgclWacdrTMKHXywniHGJHHrGwCmLqlBUaLBHBIbPYJyHivCXjyqVqZUXCgljtAVXbaRZifASaKSgZlGbAvdTjbbUo",
		@"XBlHVzejrmgb": @"uQpGHfAcylbvwIdqQfZqQbYiUJHSSWguvqHsaxqEDomZmIBsGCSRQjbgirQrkrpLxKQpJWZcIcCUiXjohDfNFFasANsxDSjqsXGfaesevAWbxwLRncqauuDiZZbgZucZppRrjNZBLl",
	};
	return ndQeSqwinUJLhZo;
}

- (nonnull NSArray *)xbTiDTcNTmGyYjWIhvp :(nonnull NSData *)RJLeseCRbMCHHR :(nonnull NSArray *)vuUKwIVNSYahHNYBF :(nonnull NSData *)wRtplUlnXnsNU {
	NSArray *lXIiPVDnxrb = @[
		@"MYKakpWumsFWqtAwWPPQmyHbbbhawHupomaCVcquAEoIRVbogTqXELXvOwynTiBneWrtevnkLqObNoESqLDolTpMflRefFKFVYmIjLwJfrLYlPbzEOiiwy",
		@"SlkbhHTaJKmVIjDaxwLxDBVDthySHonOlPQtlwDnwLpKcqCKwJNdluwWJPzWTbXaRMUZTldOLUnyUkSsNMEpbuPxNjvFlJoRkTPSSYbxlkxRVcuIbLWdMEqzBGrSIKyPlPlBlQRNnnktmXGAoPT",
		@"tKxYeEYRSTalfskbLxizkWybjsfcBEHZtmDoFtiLYwxUpfocFkQdXPPRDUsHCeFieHahnUJCeZVhGkljaSWhqaCtcReeTXIXZUFwdbHntdSTlbeBrcoiheifzGcufKvbu",
		@"YluzBJZWuLSHoYgWObBzgoBimvlaTnlFSEXQyPuyIqAKCrUzkyxNnFNInPchiQQAfucoAUxbdFOLZiICCRguFdgYrhMJPPZTrJsZhHqkNNAKuhl",
		@"zRjmMgRCmaUyWXhSEjsjrxpGhuGoydjULMjMmMPslhaDyWUvETiAWRpcYQRKcxGUxvLEwrWHXgUxaTRiklFhAPgANABPFaHCnoLldlKlEEpPqgBPomti",
		@"GPlwVxlWOpwOYuEPOSqtfMaitsfwYDatNzzTniIzxXMELdUNTcTGILWhhmIUtXYUDGDuiqhPEIgckfcOurhrGCtevsIhJROzEKxkNqJFPYBRppnsgd",
		@"YgvllwaxROaIhCgZCTVOHFLKIqUatXlJXCQBfveHyfKFervWuQyXBpPQLaZYamkyJXHFpWQmacAADWXJUPVLzemxzpKeioRUFsFnciLWdTKTTZCGuLoeXkKGAFJLMnMjLJBQDPRdnOufJZNz",
		@"rIYsxDlPlTDawDlpKLtsbBOSZHJDSbBvxTiiCCOkZDKrhHlQpTchDGqFJsXGZJHgeCUgrtPBSBiPNelDxtxkzIVnxTUhLDvZyTrJECJBnBWeJmIFrxjPYRfcEiRUuczETMzdbMnexYk",
		@"jWYQEMvAmGLkmLroofzBgkcXlNPVQSdbcvJOIrzHmnRDkXQSqYQrkGzzWpgSwXXJlQHpaeTMaPZHgIhvtQGUsDqBizyZunAwpEHMGqlAjpYUXvzGjJVPgBTMShskGqkkyBxUTCFpdqCMozMa",
		@"JHPLdGozIFslLmPRibWNdACXqShHTDmvMuMQdHyXiIDugHHYvTlmLLqkJkyLmSlVRAblkkShdomjfrLYQgSsTJSCBAFapMcfTkNjzHyuRFUqDVxrHYAWoyShuQPRQAADEDaeF",
		@"GUaeGNnOjKDgweWwxcKPyyOdENKtXrdItPdvXOSLVQMFcnBuyvFDbqqefunnKeuabnNyzwZvMnOpAJlPHXpwNTqjXZGUlLVWKPkywMZthspyesHCUHVjKO",
		@"NMiCwtQZbvIUrkDvNFoBeXTzIwrdVKETjDAbHhGzTNDVEiFprsvRXfknYBexqtGaHXTdSrGtRmxzmOEVxlMQytNGeZLVwucrxPpVxgDFyzKZrZhUYBznwngnUoRak",
		@"TemDWOEERhIYBHBsJOQbFVxJENcgxcmkAyqdHpEqLugaTmgDrxqpaAuINDllCNMVTXJXVrbGJIUtxNzecMMELbOCpbxlcCZVaSGbjdKEEvKSvPTvgwuFUmmUToiuHxXghmoUP",
		@"SEwjDRTSlPjNNKxGaeMfQyYjWZkkOuOZexhwtQsFXIeOHadhNisUXySdWwgCCslaQEZEWkxHEJsWnjjOvGKAiRyFbfumWktYwTZWadUoVi",
		@"ruSPZAIlFWqPhbpaUWOnJYgUbETyrmhmHCrRgCtnBHykRzHvrhcKctJIEtQcRvzOJeIqeiTdTPjeMJrEIItjdsKZsZhkgCPtQqTcUhftbPsLMKDzBrBiGwUmZESYAPMmdlJY",
		@"neYXHeoOJLYFhgwdSVwiuJMJziADQfsxSyFnPXMSWmdBekdEVxcieAcwCncgpBjGddHLIJindMElGwFxJFWXzMzUoBItwJfBRVrXmFbPMTlyxEYtrMuj",
		@"LwUtuwqqNEaBMymulRVOCiKNyoBEAKbmUAPYOATTjACVRoZBEOxCQSkQylEYXMdBnjllpIDDkiHCYKElodhkdjmpbXFAtcTsXeVBpETNYxaLPjGSCaZlykLH",
		@"GgzmbaeEfgOmEneZbxVKWWWcimmhRlhCEsPtBfBGHDezCuZrCOKKAQPKlkpACmCBHENZUUsFNMUKvqmVZLCxGkCpTqiigyabyCtNHOIDiHqOthmyUdRQTcUaILKYfYneExM",
		@"lSIJRGGfdAqggHgNsDXRXLPWfSHHJclsbfOyZMaZejxFcZnglLHUraPaIfpeCMqcNRdWBYyjnuWXaZgebcYdwMvEPPMVNLvMwtlUdokMHbkodyjzEVfv",
	];
	return lXIiPVDnxrb;
}

+ (nonnull NSString *)eHLVGCzpKgXvT :(nonnull NSArray *)KbabiNhMguxADQF :(nonnull NSDictionary *)RzGFgqRDwj {
	NSString *DBFCkDSVOutSZU = @"bYhgrhLmtHbGkXYYKXKFIJjpxYKuWeAbdoTMYXmalcJzEqxDHNzUbVitsxEiEoMLwiCnUqvkJrkrZSMJNvlVKyYGKCkEqBtJAEQBYlGhhRpXbIQpqqysDPiYUTbIcGQRygThUBFWrnRglcUm";
	return DBFCkDSVOutSZU;
}

- (nonnull NSArray *)unqSVbccKUx :(nonnull NSString *)vkPZpUZXnyGnjyrrMa {
	NSArray *lqcbhvwlXXoDfA = @[
		@"bcrlDFVAuwfFuJcvkVAemUqXSlsTjUUHWJTXfpzQhTMQyeRtlnHPnovPoOuyZcUWmJYXmLfHXAtGGDuIOhwDCniSNUgYoZoNboRotkxaD",
		@"CaySvvdUjHWBsxRIrOlroRNoeIwGOXniMMiwdyQUmZvYyJfMwsByfPbteQOqPPqYquCiTtyPLXNjquqoFomsdEJqmgGPuMbYXPBdrfoHPYoHdWmfn",
		@"jOHrdhXYJTcWQRaBaFHWBpMClFtcpWGmCcLRlioRCSLKpmDwoQKvHvbAjWzPHQxPXbZTiJSodDmcCPcwZBWBOMXfoxZByCXWSQKUohUszltHJhotLvuEzNCbE",
		@"SCNCbKDQfajQOsPMyaTLdpksUyuFZCGXioueTGhZamlKSyYTcuxUSEmDZpQYvXtADggZiyVsDpauIQkNazpaWlJHDHIhHfNJhyJQRImFEAHvs",
		@"lJeagdumCqkuXHBbFCVkQyFrrezkHPNINPtLCosOIihrvzVCRvebFpOxnBrlvcDQGCAdsJYXYXULjeYLLABptywdASAnSsAvWGqTioqwHUcQLiJfAjCBleqMTFVNkWruY",
		@"hNPeBuftUgMuZjooxNfGGreoYmUsXATQfzPPKoynLpNTHDzKCzcAuVduDQlJrqlGPLERouLlMxKRDwzpjaThncqXEoErJWVlvuifQiClYN",
		@"IGLHmOldTwxxeERRjwTgJtVOEWLmNsMyjJSpiroSccqeTHzrJMBJbdytrmnmGuJbhIzGxroZGUspRJNaWoFWdEMuCDWylMfJoLClFDEfUADtfmBRA",
		@"qwthKnzogUjggFsugCjakhzOJaUicOdtKTLpSLCNVFhUTcjfOeVZWCJDSVCwnBYFHeGJUEnxibSpWuxRvgdeUBRYVUWWYWjdyvPFGHjxIUNrPGSRbHNXapdffmHC",
		@"QyCsgRgHmYLFAVtzwVnnviVtuFTIuEKojiYWPywlXLoVrEYDoseHIFVWkjAjkJtMwyLLiUQEzuDkoDwbQCLHYKtswHGfqOKRLINXIYLQuvFhYGuIwnUcQVtcqVeGJTUHjpHZLJHCsDRXhSYs",
		@"ufXcWcVTFRiYdrdorBcqVjJqBNAtVXRVywBgMqQnPlQUEdZisGQwjQijWWIUydXPkoCBeGkCOrOOSvbqfoyofuosjjhijEWofxaplAvYOaikkbGpnQGUwTUObQkNRatbHMtWzB",
		@"GSyeGwdSZfrjwABRmBGJpGNzoiDKDqNmFvExZUnUTwrNjHjeirYXdglejAGYCGQhIdfiZyhJqChwhWXLNntmVtLJmktUNiPfxRJndlTzMErKyE",
		@"TpScwNIREyyEFsqvFvSqyxBRzmvjSTEGpammSVMEZlxFMcWDngTzwnyqoFlsJfZvcGVxzfzEijKYQPVSkbxOsflhXSCKGgEdBXkRTTESdiPAyC",
		@"LsyfEvuZMXnzfcRcloGukLmSUvlzFZsRGypnXDCwIpodieStREhmkVakxmfBHIGHuwVfTJAylvnRhDuznFaHyKpiXuDhGMRWLMOFZKagjgqeFTjWxHMPLnlrYkxvXcqFtGEVfB",
		@"xVGBmFLrOReWRkcTghTcKGnbRmeQZUVuudskyhrorhEtskPJQTzILKSmxIfzcOSCheeIbRqXdyrCdCsShclCAYtOsFWrXBzVGwBFEFqBTKwZ",
		@"ItzwgBmfYuUnfCVDBmYFfGJHtkmXkUvMWyqZOTCqnsihgcOBYGhJDVIcdSjfrmRhNZYfwtODfERqqhnQuEKUnuOEmIsftEEJdAuHdkKPvmpnrWYJBuQuVdZDLoDmWzwViLlzvn",
	];
	return lqcbhvwlXXoDfA;
}

- (nonnull NSArray *)aSTzFrkfWJqSScV :(nonnull NSString *)lLzCdhFhCPHAQO :(nonnull NSArray *)DITgDDfecPsJN {
	NSArray *xITlotdhMwca = @[
		@"EtfvoJNlSxkPYKkREcroQQkZCkoygeDzaiVvpdUMRLpzKsxXXzUJsAFLQwcSIucBYnLmtFWFHsQHcfsUHGvKEmIxpRnHOYmvqRZvNklzjABmvOJZNZRyiBoUZUgnxNfwQckGcqvDt",
		@"usALqvTscPQtpWevmABEIEuVnxWQsxbwfdxjbzbHWzlvxdtmHuBEtAubWiltSypObabqZXDRkcipNllvfTwfFLYRDpoJPBWBiRWjAMEilYpgopXsfdDeGxuEgeRbwrtOjpZxEgjmiImZrhefGb",
		@"yMUxpoishnnxaOXaUFENWVRJENRAeOCvTFgkSzTRDFhUTfSOGVZARJahLcbiptMLYzSLUBzqXCPblRWAKTPFyaaxacRydtXmpgpWWcuTymf",
		@"GTJSdguNrFpFFMtCdUhAPnYTFxqyxzlAhVbsqcyEyNwNCrhULLqQuTmtLYGgqaaxDgpVyRDWDhIuxRaEbbjTLrJaMtRGkcvWqGbxgajKSEHPf",
		@"XNHBQMofntfuGFRFMjetLObBDVrhOFxKNmLTNXMqqrzmUbHjEHlfcyMlJvrogMiHqAdTcpMSmVsUZenADOkeMVyfGClgxGxFCanFBiRPJa",
		@"eHlalsOZNkSPfqBkUirUTmIXKFGJjxlSWytwBIIOWKXQVFKvOxgQLdrTyHjXUFXFqJPAQxjuUqJgQbTyDRRAnChWOKkkztSXKLfRqvmkRnMLqK",
		@"kMtnsFsQTrMTZEeWjtrzqhsIyDEhRfDgsigoWvEarwPklZqdEVctHHRfOchPnyGjicXAyiLpfqtthOhZwLGavVhLrpmLQwyraXQLBDIBPplQfrwFypxVhcazWheifUkGdLXZgxYXtgLsNZI",
		@"bfXKQifRQXYaEhcFFPNqljIbJvLzbTXOWeSmulYguUymiFjMTlKCYocQfjNxQJZbVzewRtkrpgzvOGJFTzDKtRguwTeKrOVXfXnddBrVCilJEMokIOfvkrTQSB",
		@"aQLJNEdSLuiHvXHZgtJCEdhykjHJOzOJixGzYRTBHOVnshmPJIdeMAtkpsDmdLUZmhMxaHJlDzEtRhyjPpHsGHdjSVMCZcVXxtmBuUkvESxhgsLIyVjucuuiV",
		@"dZOEljdRRVRfoIUvRchBIVJiZxhingrrypLrGZhRTvUUsAompWvpElkMleAXfZtzRbWXqTKNmzRBPiwnhcuvADiiLnHtUxtHBNwieGgacCBsAdRxOwDGLIwoyFtZZrTOpdoJm",
		@"jhOFpTMNuststjtmVoBMyjNZwPBXFJvLZGJAawXOTvpqDlyPmibwmCqwEpMdJrZzNiOdoSNXZRpxyHSOINbIzrYxzLHRskjMjiviFszJkZMvpWTWVfodFrVVVpqoXYGKof",
	];
	return xITlotdhMwca;
}

+ (nonnull UIImage *)agOZTpRVypw :(nonnull NSDictionary *)vXDZmbJgcaoq {
	NSData *RVfwCJCgVbRcQj = [@"KNEzSKkImQeTUdzdUZpXqrwoRmRQDddahtuLeSFzagIuPUEPbhpgddOJPbMVxzwLaEPWyTroOPOsfrWUIUXCLEKMvcyaGgcaOXcPPiRvGXfplAZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aPJAbuyINabwGxyhlYf = [UIImage imageWithData:RVfwCJCgVbRcQj];
	aPJAbuyINabwGxyhlYf = [UIImage imageNamed:@"MfQFMRguHwpIpXICtwSLkJRWjRugUdSOlLhUqZnPnaquumrYpaaWtGSWYYwNzOewFMRIoNYoRLTpBVUdNnNMVtjAlubmoFhYARuTYEpqdJPKkeGWqEalPhpzxSfEvgWBMEPBqeNHLdo"];
	return aPJAbuyINabwGxyhlYf;
}

+ (nonnull NSArray *)tasMpIdLDeZTo :(nonnull NSArray *)FFvDZVxuLlY :(nonnull NSDictionary *)YSWOVSAeVn :(nonnull NSString *)pWyDrbGkMFwEZnBP {
	NSArray *rNrDvcxQOnBYYy = @[
		@"nGZxmgLRCYvFsFumpUtHSUFbCyYfNBfiTNLGOplqdAJBQuQSAdCtFryYLvyXfTRaUUEcxFReRGtaoBDzzFMTketooaMSGAIgkiFwlYzcV",
		@"BgQwBioVacqYpoHAOIReSzjGGiKoMKlEJhhdtyvLXWJICfhDCiAmyDaXoWMOpOCiDFAuwtUPrSKKHCfXpGuFlmTyPCLNPjHRVnFfuwAcaQqAKwtxSY",
		@"VauFwJfIpJHFMOxeDmruDzLJfatvBnGAJNYQYssZXmQOuHqemDZDZgqKlwiFSMaXeBoYZvFLoslgJtttXgrObIRmiBfcRwlNCUqQjzTjn",
		@"CfMXdhbEBqyXYLUwmBYZZIlddOsXLXdsDlwyfkwItnMIGMuITMZRbsQqkZYHxwRlytxJBwNYIkPdFlfulkNPmxMkNcfdjPtvLhxDoWvbedPWVCVGINhvyDPZptaWrvh",
		@"egyWFgcYdQJraFtrTvNZXtTyOBhYiKzRzZrHaZaxAQSzyrWMPLKrPCpdFUFOCAoMTUCVmHHctYVvUSItMotZQoTqvOPKmrkvOXLnaxXxPdxfGGdlywWSiWgwOauUIFqLEusRkXQfZcaVvaMy",
		@"JRUSuLODmGfXPzjOCvXIyHqVGmBthabNqyoAUmUSFffifTjutmOtBbpAywxMJioscAvhVZiGdUSsssRTsTGYMlaUqoFTcIUyEOaMxBTTvaGdDbBiFdhvNVTZnLJBnvUcMdUiaMTtmEXsdC",
		@"VRRdnbqlfxMxaQfuLkyTrCBgJPEjtgATxFZzLubRiYDZxofRZXysRDFnWGDTSBRZxggziDxBPaVOMyqCwHXgEgRWrEGSCAYbHnmxYtSsOEtVwrOgbOFvqrDiYhrpJZfsxeqHPexWWcG",
		@"yPlxyQxnNnSzaJRZmgJOYDMFRVSNIJsaMaDcQbaMgQbOMGEoDtVKSDbrlAFjaLZfbqxdFrjgDRTHAcpgAdeIKWWiDDSKTEMQPzYJiFFVxkzbvIsenomiNysCDqUffsOSiFVDVelixzS",
		@"wCyPLaykSxgGLhXXWldDvlSbTqnWdFSNZKrNIEvnSplHggCmTlsJZjdikzjIeHNNjrkXzvhPtztITiDMKCsmqlxNyHnHRrlHIlPdCohWiZyxOMIbOlYNROGAypOoRHAXQRkcl",
		@"IIwuPUPiYvainTcrbsazlQlKVYlZAmKdXAKKAptfgWMClpPDZnFApbosmiAPROFcrpyjLyHxjYEvwOPVnjpopawLWDzNYxsnPFwkxmulyNwItftEHvxFDVjwJBSbBaEevlyHvYZPDo",
		@"cXVCGWCsPDgfxIHZytXkLNUsjupfMPnURJLZcsvZPHzpSVViOYfQkXTmwpnrVlPTzwCBNjYFmMGBSHstBcMrSpLeZDZLYUEIezEvyAJYmREWZIolwDbiKzBbKRYZUtxbKFYrmDCCQpjrOaleDX",
		@"EjDvQUyUciRZClcixdOiydoJCpflbMIFrOebwkMGKZHBkRGXOaZrAxgeuQSUZheTyWvyjTxRcGfyVvIqyQpukpIhjIeOqJktRMVElUZSqjeZIprsCedGkAbhMXfRsUjhfLlIwkmOHouUvfGY",
		@"LCPLrpDGhIHWmpOYHovcjKedpAIRfAOsRPngNUIaGcBiNyGjQxEHaVJjecYpbzwahrRKrVjIrPyGTHpWanuFEKTdgGtORDGRcHamWshYJxVppPTAXQoXcsImUgJcuxBlkVnwDzRFqfUizUVYR",
		@"JiAhPrvZKZYckVMKytpvFkrIndQwBYlVJiLUVXjTKSuJgoPLVXIAVhLhmEEHlXlCiRTuQBhFUktLbnKDUosrljDqCJNtyNSAvrBPUYWLjaKFPBahlODJwcdmveAV",
		@"DnXoqjbXtXVtSafKJqhyMLRTOnpIWNyJycWEzaNLgyUJGRlzJxgdjVoBggTGmjglgGgCOrIeZgcqumyzEIIzhkfmQFUQtBTUjqPNTVTopZnkiJDblDUkGHwEvtuYJ",
		@"vcFGsTIUKvxHrjPufJLfOuIvRvpMQHTHRqARrARnPkaCodqYzruzovdmphFpwkoZfIntuAuLAxzEFMYCdSspjgqxpZhJVyZrRsRtcGJCaJpmBwVsrA",
		@"dJXIgcEGbjhYzwDaijYUyBpqHwhpmWxVAlFKADfSWnirQrUKzXeIELGHfpBGXIUWZOhyCdvhNVKecEvXyntMyXgIzzmvHlEzugLheQJJgGsCtFLUEiNEyjhYPdGERwDotv",
	];
	return rNrDvcxQOnBYYy;
}

+ (nonnull NSData *)DXwjUWXZryLknp :(nonnull NSArray *)EeBUESMntnRs {
	NSData *YbxVLZZxGxvSof = [@"nRCIxwOXnbYDUPIRzrnDsWhJeMaUrYMSAFGUctsoHjCvBRKkVmubxBdTrfQqQJysoslNSMzyGAVOTtWUlNugIbavraQABnftkwXMqLwocazShoqzYZEWPgsk" dataUsingEncoding:NSUTF8StringEncoding];
	return YbxVLZZxGxvSof;
}

- (nonnull NSDictionary *)pavPlKECXtWB :(nonnull NSString *)YmYxlfWGwuVo {
	NSDictionary *RwKjnQaKhngwtESflo = @{
		@"trXBLzkrBHDscAl": @"VDLlYzczLJSbpsavBINHptkNJkvJoPjOjfMxTSmruqNPQyaaCdKhmfBUXNalJPuebsFaQoAlUKDVmLqeYCWKIaigAOSkgdoUYovKpEBzfVcWiuRcNQEfWsdb",
		@"ncMkdsTGHOcs": @"zhQDASBPxixSnCUridbweGFGlFpsuRxTplWHlnnXWzBDeJvItoSfAMvFsEjRQrbxXEIUqZfYZmrErlJuhkGfcPfkikwsJtNLrQRkfpyKsJIPUzLOMCltynCmQdrZhrpImZyGeeCAKwXxOwviB",
		@"KukoHkkUxxWvucwG": @"EZuZvIFibTAxvODpLdfuKIpmCALElkRvAgDJYbdQzVDGEIiroaFvsAXOeQfoBaTtkaGvcElmuaJImCAdabacRTlVSlRHlgXKMiBLOGNVpR",
		@"vdiItZXRrFc": @"MjzLMhTsugfIsGOSzwStmdzVMsWzFALJSJfppNbExvTlxyHWlJCDdpMUpPXNJvEuxRKaIBnCxWdlwLRmIAQpZGsQCieAWfjMFxOMfMJoRFMnGIvFfqhwKMGLNisXo",
		@"CpEdqOQmDsmvUk": @"iApRwbALQshTQXPyxnGeCJOVkbjoMVOZFECemYnUmwoiAoDRhCeNLkyCqLgshrfBbKaaxQPGqTXlkjqbfvPjMoYIwFmbJVhGMzstaQolthvlsfyvkIAiOofvclcIzSMdlAwTZOmHLzHoV",
		@"fTqCVKDUYcRoBGs": @"XjwnYbWRYjBrpsqTQsuAHViYtstWCaEefeajQPaRbiBfpKJPAOsgGkwNVYELmyjftbfJIhHOifmTNNdraaScuXKtIeudrEqaOogKPGHPcqXXeeptbyxRlxY",
		@"XWqEoOiNcTAQ": @"DtiangMjzYvvmovyEbwBBihOgksIausdOmMJcVUFbpMPsXYEbkyKxSBQxGAprPRcRYMaLowOMhslhLLxesnUoLqWScjZfhesMsJJumRIkYQC",
		@"xqaknaCurcMXQd": @"udMeCbghmFfIRaKVLoBUrcDzYPQCDlcqiuMNNdIEbjRSSYfZItWgvUvscQPFDqbunJDcYFGnGwYCHCMDtAppMrCXniHZOkWSZAWTucykMFtpFrPtkQcjXjEAkIjhUHThEZQUSaziEzP",
		@"ImfgwyJBBZmNXsGcU": @"AYdvDDqOdnPjFXUshdRIkGZXDClEggOmejSrgeMtGZkeyTIIZWPumQHXSeSdxFPWsDKTCJhhunjKQXXhgYeBTLRsBKLsnCozJYVyaNRVUHNxnQeDlcEcASYMksWClTPRV",
		@"UforkhKhLZnsogguq": @"ZIQgxQlQWDQSRjiCUDklCoLMwXEkmWdytRqqOyCxDBGHoENXRpfjgWXVCXMaeSNODYJicTSoADQikOKFwXVDdCriRKnwOXNnPPOwkTCqMsnWCFAZZGtWDIBzmMApTlnId",
		@"IQKxVCSITrAfwTUC": @"cRtEPeUmhCkngZaeVZEnvuFAnXazcGwRZdvqVryoDHDlkSaoCsfClRniZtNvttcloAYABKPgsHijVJxhWeRkgnYyqrUMIkzaBCxVBclGOVXBsMSiVOyiqkwgWmXKgRotmc",
		@"lNdOReMDSZXx": @"hjBOUlIzxSPidnXApqgOobLimwNJsFEICKAlNQSbgZjQZgToYnmXRsLtOGrnNIlmqPiYZSIblBYmGkADOYYEDsqUoJSlPTCvbwedtujWgvNkTrryiUeiSBZgLgRegdepAHZmN",
		@"eYLmoxfsEeVyr": @"kOKMZmbajuGslmXYVuRwVJcuXyxmnBjPPbGKQpVOAuzkHYZFdUurEXcSZvBKmTgxopnkGgsRiQDYUULovGaRMOUWyCBXrFjKfqtLKlOM",
		@"CSCAJuaJYvtNaLyzg": @"CuygLykqvZzZCbcEEwYrIGhMRatlSzCsAnTFOKcSbXRdiTKbqDvYoohjcepGSKsmqiXfnAXSFdlTZpBsQOFdzDEnGUunmArdvLDXylgIJWNgBEEapiNnPcpSdNDpArnUgMQeRiSwc",
	};
	return RwKjnQaKhngwtESflo;
}

- (nonnull UIImage *)ZYgVsIpMjywfHVn :(nonnull UIImage *)sbeQTlmOFMA :(nonnull NSData *)nXIzPDZcQMAQz {
	NSData *nWsGyTuRfLEqnNi = [@"lFOtPPfEeOseMocfEpVUmCgAtdKmUPDaevNGLpKPiQzGVYpVMGtyFFPCfgiBVhsaLjNUALbzdgUUvbwnaAlKgPbPUIvOvxyGgvOKPjmHcPRoqAmcDaLzab" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mBikzCsbAOtlXY = [UIImage imageWithData:nWsGyTuRfLEqnNi];
	mBikzCsbAOtlXY = [UIImage imageNamed:@"QzVBesPOYPPrOFGMgUaziWXjxACKDgjBqffNjFpVXrcTeIUqtKDoaFkDhTVPpWfngoGLduLdayVEvVjvrXxgAWtWXHSUzyoVaAfPLZzBFPeUjWhqDKWxVgiOzhYtcExoZBuNlVlGUlVRXS"];
	return mBikzCsbAOtlXY;
}

+ (nonnull NSString *)JvmxaaCCRk :(nonnull UIImage *)DNxgKbksYayBNwQRjk {
	NSString *ILkDuRGFbSHeettTfh = @"GQIOCOhrKCSBeKNDsheFubEmQWWCGegAPlWvebhAfldFObppBSMgjbyHBxjrKTIDtIomYILLrBkRbdUWkqwjoBigLvMnCIUxNwvvQtVFjtZxCImnQIClvKHmnq";
	return ILkDuRGFbSHeettTfh;
}

- (nonnull NSData *)jCWaAiwfQzikvFzO :(nonnull NSArray *)VGtnLkFwKZsyGNfXo {
	NSData *XHJMAjlVdb = [@"yXaLLllfFUGZrWmWDFQvqKkROqQJKrdKdEjYOJGyVlrPUZqeFiDXirDaAXncDzPfvFKrlFOsKyqlfWkgDPoiNXkQqMCZiULljqNUIIdGlBUgfsVKjvRIbJNACwLLcJAzzeuunXUY" dataUsingEncoding:NSUTF8StringEncoding];
	return XHJMAjlVdb;
}

- (nonnull NSData *)yyguOhBsfylN :(nonnull UIImage *)uahrCHzZafbovndfA {
	NSData *STQBvnjmtLz = [@"pamiIXLsgIEnizuqtMjPbyZpZALBvWKKyDvjAiLIivRMEqklQfsmcjKecNvIrmYugHqwCJnWGRgskUCvDToLVaPqOkpDiCONTYqNMdaOR" dataUsingEncoding:NSUTF8StringEncoding];
	return STQBvnjmtLz;
}

+ (nonnull NSString *)hRUiDYJCCeN :(nonnull NSDictionary *)MpSHSUTfKRQtzNnu {
	NSString *oykzYcYheK = @"jszpwBFnRKsOMxFInpOqNJklymgakeFRQtmGLHNesNrrXBDEwIUFOyFIiBZOSEzZHtHhHxpioIYROSqkSlPzpXanJWKwaKEFQOGcEJPBZzvJpcoluofiqGlywuyrqP";
	return oykzYcYheK;
}

+ (nonnull NSArray *)iKpmamEIMfDVq :(nonnull NSDictionary *)ZNUDaIhrsRnjHVYYIQ :(nonnull NSData *)eTOhAMNSNaiZ :(nonnull NSString *)vsLZBMSJRDei {
	NSArray *HBzBKeBNUnCiqiBXROc = @[
		@"xoCWUIAFPvsfODkWoTHMcQeKsqhYLmEYhoqCOOhrbUVyfreKNhyDTYUsyIvuacSDcEFxSzfEkyEdjJagqzDmmrvltyDhWAJKsPxAPHrhVxXlEHZpSNgpTCUzN",
		@"AzcVotaNIkTetxcHdBZowRhsLZjjJzNItrSjsNsmRCAhOdjErJMmjeBgQQrEPKdIGWprrapKlvhfXbcThXXBKJOJaRWXkOMNbOrjtRTHrxUNlpbkVyQbITbpgnZehlgZdSUKlNoGwMRyHegRvfdHw",
		@"eOWphchreLejSGIOjZJHXggpKZAzPAlLkFegiuFkMYycOoKDsRSyBNMjPhWRZGnCIqhCWDUteXwHrgzJRMTXXnICEZQMvlUGzTyVzVbiUWhTn",
		@"PuwaYhxvMKnoXggBjipGalPFhNfEuOoRftINEFRDbtFPKACyOZjWGQrzjtxIKLvfQlnCcvdkYkZObYdbqjcgzmAbEbtOeuNMKqtteeuQPdhrZGIpBfhhClUsQ",
		@"fTCEpwGpDGenVEdyyuakcKHuShLSIYwOffFrHxMuQhfjjivnJYdijnZYsEfzDPwIezwPlyoGOcfnVsDDzZviuBvcdAgBRNvqriNmVthByxEw",
		@"pUgUhqRsXEXWuGIWghMlOzuZeAmrAiHgZeVMNSjJXyFUPViwdqcqtKZHhamJVegdxGSBOuKZSmqppPOozLFHfzmUMoeNXbOXUxBUExHDSV",
		@"CjerxhFXwrbcSYRmfDPRlttwGtnHNXDpDbLKjntMookufgUcNFdGBpONbfmhmClyUbrDWllWWcqQBjbXGJxAGWBQDvVAYoJHjjCyMOtOhTFPBJFJtwSJgMLiLyeqYy",
		@"XMxxaDGtaLvcoOdLQTVrDKQZRJzVNsrSxdBWcqCUARuNxVgsybgVCKlwZBovrrdluNdtkmjhGBvhHRtmNlzwqIkCCzkFDLsmlYesEafXRNwpwPQQwxpHdbrIfLYY",
		@"eEasCDgOcJriMYYFwWNNudOxHLpOFSOHmgaPJagolcpBubwonUKtgJRuZclNcBDmxoNvzdbtzAXYRVcvcQLsUsuRjzrVfmorxhcDXgcKNHgdxekENnd",
		@"snoqVcRlEkNDvENRMCmJjVszLxHuPKtNnWWNMlQiFAhmVGXZKOwAjYVyUULUjAfWKqiRlwtCFxKrfHrHMPeadgFJWIfpMzrtkkkQgVaQREpHxrPYIEEdSgNLAnLIBCdKHTTasveoyVUh",
		@"IyVnFbeKuowUbgdoFVjZwAyxPkXrtBsuvxTdEEeHRJgvFceiUAHxjjWcMmLdFHPgSybgqoRPpNCuNSDtFpjsNTVfBotkCcWnXZWeIOgIWwFymqwVxEnxGFwYQAtQbnyv",
		@"tSobVUJEyACSKUfeRXFlKoBJKYwZRxhkqXixnTUVGqlmWlEDUNaSesjcGpAmqyuKWODICKgXGqKoOvTNpoBZWSsgAbvssQVYhxEHDoMRCqXL",
		@"ZhLbCSqHRPMjRWYWvQbjSXiEAewLETDhuvomuYwPGZdhZxTkDjbVaOdQzsRaYtNSSrbhrVUiNyezucpyZznmYnivJBQFJyKNtuYfChYGjiteWzhmpgnqjItfQnsmVbEopfpuYy",
		@"KjUbMGDRtehQkpBEtLKGvfKDvgMrwPqkYNasNuirZgTGBWCWJTyFIaugmXNnYHzDtUQpeIcdkftLJjVMWVGZPbqblVYKsGJrOBoqECWEliUidfBYODwSjDauhThCvxlWyNbuqxFPQgqF",
		@"aNbloBviUaULrCPfBSTUcUBYZCBhExrGPEgXiFWVBQAbsDVJdQjMXXOpcLJCRVJCNOMvIxiNYplgoauFmGrrEHFNUePnXYbAnsJZdeKQjkXLSXHwEugNlzTVJBfxuNSxJan",
		@"zivYYFPVCCmwKQQvWrzTnhZJkoyfQHRnbVqebKjVBvTQsQkzuzxlLOsbsaJUmKzDrsrAbRvrnQGzEMpMTShlDPEmIbckDIamxwqqRzKbrMcqBxnujLICmPwfznluMoT",
		@"ovmdFtFNcDwEWNXLncjGJTTuqRXbYxfHOHYZDIGMBLGYkqlosJIdLwIqiqdpoNipflkKayOVsNXHtYGBrNMAomnvyerODOvRxDkznBYvkazbvYWyKcTqYvVDBQXklDHnHX",
		@"WctSURyudNbvktpWlhmYreYGuBuNOIuOQlbZKWXjnnePtmRUGPiqoUwhWxqaQTDThxVaQzOjkJYvTuGiNQdOqIBHqoMDpbucQPvojWqwsifOEFTkJbHnsGxfdhtzNlbXitBcUvQoLBiQZggznlk",
	];
	return HBzBKeBNUnCiqiBXROc;
}

- (nonnull NSArray *)PErKlipdqu :(nonnull UIImage *)HoSOKMrlYdPVidYkKV :(nonnull NSData *)HEMascaVaKOcXIUYWFq :(nonnull NSArray *)ECsvNJzURhhZJEe {
	NSArray *yzcDfjdoQj = @[
		@"WBXcorkhQmAJOBZfyXoGVimBdIQgBRFmFQicithnOSSHVLzfEPPmgcXHGyyslIZEFfuSqYiFXSnjmhvErseLKBWliCYcGqrSwZjIivgAwZtMuCaDPNqSXQMuUMRjWlNYM",
		@"HNiHHorCjFxythqTMncMEXYlBZrNtyUwPOcxROxiPueDpyoXrSUilCVZVFlbKhWayXMQQSnxridXzNTHHvvRcyXsoBcZoBxyZaXpTAaIrmGfVzRzRcIaBjAmZTtiqYbOfEIuT",
		@"zlWySqosnMmKgKupHhOBNaMCzUWeLiNNurKpUIzQlRvQSvRVTHQzgApHdQAvCjgfRueVzXagqEtnxWkhQcLSbZBzDPEqKiRZDOqoivKRyxNYraejhZJcHyutNzUkcRRwWhsMWya",
		@"GxDUYAgWDNwzBJBCZHouPaDoWknzSbDSDsjEyHJXlqPIcyZaTdjdSxrOWXlBVlWcPwYUEUEIwSRChiYMmEWPmFvkSOmEsmTOIDYStdinZPCUsEwBmuFbDnfqfJmUyDiOZsSmZQKTXCBMxBgaJCDl",
		@"OFkwOxTpYfhaemnigvmOVpwAvMNwgiOyZRhozGciCVBsuvwtLeRHGRGjNRrvnGrZwMoeOCuMFVMQPedxjPyuTVjzZQcplcPgWhyTtZUpLqqdmturwpIkGirIXYtF",
		@"UYaRyBztZuLpepuPzNZPRXERBwNXVcXSLgdNCUGMtozzQVFjGGKenfFqeiqpHZUXVXCnbTivinIgEKBqHbzQIRiQddWiTbNSBLeGgovAAs",
		@"sfzWowesqHKsAYUdfpvIQPAXFKQGphWnuDvTVsQiMfyqthLdWJYEauCySNsZhJmiuCLOqzVQpDmjbUjOsWuPzwwPggmPehYAcqPijQ",
		@"lCQmZVTXSTkRNmiMZdoWeGpzglpfrybFuSomsWUDWuGbBUlKbcnsTlxxYHoXYRkdRgVVjqiBznuGuHpNPiossxaJyLbkHeXJBWaHdxsNwsPIxyFAGfunxiEhsTRco",
		@"UqCPIBnRfmZzQdCYLmBOBqJbJRgFJhvgHoDNsBLnsZjgqXmlmZZDNhnyLnbfFIvsFhSApFMhLIpBBSzFBUQKZlvvDBcCihdFmsOmiWrdjDsXzVpbFZtyEOOcpAXkBeactPoekOTMShAUy",
		@"UjMrZVBoLQbVztVTSUbcLmlvInUJjuPeuKtMXidNowaevhVbRJGURhwDsaEBSMmYGpcClGpkCRBNLwKVYiNPNGKgfFfZIeSUsahJZelZHb",
		@"KvCbDKZhVmqjDFzLuFpQguzAHgeMLUMcSnqggkfhJGDxtWqWqcgZYrAuDOlyMUsYduwNBiXlTzMQshyGfMdVrolZBnBuHPdpeLxlHMVUAulxyNlyVeDMGcjYzIiaSHwbgnOqPyBdXQjx",
		@"HlsugmcIoGHFboDCXhshecToqSJDqeBIjACJFXeKamzfwWaVvalsSHJgaktedcSAmDpplIhSChubhFJsZDwQZzEHSxUcNXWOVDMJMOYECoEcsgyRMGlmoBTBxCNPLI",
		@"idtQqNzfflMbjPuIHlKLoElYXQJQAPgZWXuFsmKiDQyoRNDMECYueecSkkLLxydfraGIXHBLnKDRkdmuateIjrszIypTnoQpBeclmBdTDJGMzjGLWGfituQAN",
	];
	return yzcDfjdoQj;
}

- (nonnull NSString *)JWxQhXkdQK :(nonnull NSString *)DXHXbgGZDVbD {
	NSString *foGjZbDlwp = @"HrVLuuMUViEngXbPWBLdcpXrfYNcarAWVvdCgDIbgqYUaViWdEnOnoeXSicpsBellUmSTgrFRgyCYorIIrqjcxwVxSfwEgrYGyibqBZwvfQiZ";
	return foGjZbDlwp;
}

+ (nonnull NSString *)RZjylNVuuGj :(nonnull NSString *)TPSRXpgWpkeIuoLnQ :(nonnull NSData *)NraMlmsHZyRlc {
	NSString *CjYrKjKedUsTR = @"aZJqSjosdbHRTloJvWwlBvhdBfWVFzMdoJpGNuYCDCfRXEpAlUWSvvMVGmNmtUPNblBYBAdHHAASkVzPWmRrVlDjHEywcwjaFfrNTKOrgHzVSyThhECaUquVgPEESb";
	return CjYrKjKedUsTR;
}

- (nonnull NSData *)LYkPzNTklHeI :(nonnull NSArray *)JJIWWVXJVGnXnIaBo :(nonnull NSDictionary *)krFwytIcXP :(nonnull NSString *)vxTCzFtFOmEgNWmfgA {
	NSData *ZnXGqOAhVOuyPepCJim = [@"xzZgKzMSUqcAQfYpMRIxyYOvfodjoqzxzprYckVQtVYqpbHrksPIOBPMIsIiJZLJJUsDbBxDLMvvPZvASOhUSmvJCTNOFwbmyyeTmFntLvgtwzDRfNdhgUEDdIemCz" dataUsingEncoding:NSUTF8StringEncoding];
	return ZnXGqOAhVOuyPepCJim;
}

+ (nonnull NSArray *)jMsILSfNpRtfAZ :(nonnull NSData *)irzFGyFLCexR :(nonnull NSArray *)PzvjopisaWVs :(nonnull NSArray *)khhbCixZSQxZC {
	NSArray *DZtMgZiyidNCfC = @[
		@"xESTnyDPYHKhEXlzCCbOfxwKQKFlLYfRcxWvIUnZryzHKkOZGzAXPYgYPmmTQhaSDexOcIwJHWKmDqkOScbtwoxFMrnZFFNSydhlxGFSeyRoluxlpbmXjLpmKmllNmPqtE",
		@"snEgxfMURPbHZbfKsIFexbjOPlHTdaRdlBWqhwZPsiSYLkyJBqnDwqztGcfPwvemwquoKRioMgXVeKAgDdnCmOZtrrmDxcBAMvVZQDbpuGZqObZiAlysooMIDWPbUeKCIjtpZIcXbIH",
		@"VuWpeFlOaISyvJgRZwBrVcpcdLdXLEXcPQajwEjblQMGcfHndsYvZMpTVhJdQqNalfWZKgLhwXKxWTvzOloGEVvSGtDNqtUWsdEBjmbKYBhEtnqHVegfpmHeNUrnQgrEGFkS",
		@"vEJLVGySKXGiupOWAhvQojUZrMLHOZCHfuaIAVlyJdtDYhsRNmksIkUPlZVvQniJDnevZmEgtOovIVmXbngwDHqBEIHCmJNNdNEfqBsRhcWBIGLbaZQmNkBCiSrKNXkFXHEW",
		@"XtjnbEJljsvdZFYaeJNbYNcDcqjWKhrCCBnCjaLMBnyhIYKIonHwwGDHnNMhjLUuYtXbvVdtShNsEpPizNdDNfDVZaJTaoDoWmjjEoOPTYITPwlgBiCxjuFjCBJJFaGvxZVAUXYamKXAcZdMHHfY",
		@"uTcINfZJdOwBdoaIZbbsYhedicyurPnKiZkQanfPgOwxWTfhdXrAYiYaxmmxFNabpAtXgeviwxeGsLQxsZwnMVDAQRMhriqJQYPDZuHcOTZhBqpPDVVzNCu",
		@"fSXBcHrgvvbaSBysvvpfMlmFFSaYbOxwXcIgfTIXuWYYWcHKemvZYfRnLYjWdvjoUXFPourdCXauxURKvQjPlDvOgPyXXjlTsZXAOiCbOcRcpaxAoPAYHzTAaNAR",
		@"qhsCdzcEngZTQkDwDuDKKMEwNvgNRSuWWewoQWdYFgEIPayAjoWqdNibADnfBZrmQgBbtweDuKaZPuNSSJVfNXlHbVFpjWcuLjXbuZaIg",
		@"ZsjcGCSKWPtOaDKSGeITysHatNiCuPUdDtobcMScgSDMVqPYxxGrhlLogIRnUTspMYCUnxCInZYaybkEEDCptkDVlwreohTnwUUUEXCwtbNSBeeMsOOm",
		@"lFnevITzAthBkvDPUEcaDTXRCfJKcEQnqrYMltlLESKzJXkxyFmZDZpjQdlzRDmuVTiwKErGZygKRfOddKUkjzFNmAXgKWYUqYIdmWxVUDc",
		@"aXELijGinTuzjSywAipwVlGcaRffJrdZTLLWFOzIUglMDVwFpSETgdOuqsisBdAbHKoQOQwZlwwCsALWyEJaPVSCxsInetSkUJhwrkQRQhnGcl",
	];
	return DZtMgZiyidNCfC;
}

+ (nonnull NSArray *)ynNJpeZXconovp :(nonnull NSArray *)jpdJWLSZSykLcf :(nonnull UIImage *)pHZpJOxRwzebgVv {
	NSArray *tmSxbmkVyQisbxF = @[
		@"eXiYqgGGRooiLsGdJIdqQSSMjxHwMlZUJKmOoNnYdPrrYePOwAUrPytioiMcBkwWGgqrHwMqKprQochWoUPYYFJXHkgmxaAgWsFPxMwVkIDwJQwhIbqtcNGz",
		@"rgcPpwojptYeGBpnGyTyjSSoFrQtvEKbBZugeKKdPBFZGgGIsBmLOOpvOYrjtvvrJwwWkVeuGvfFRKbdwIcojzFMxwwHeIxzgidqHuJYitfVAKLMFeTecBaPLcEgprhaEAjairP",
		@"uGhLpyGecOkSXxUQXLIeqJyQMHXddTyMsbjprxoAAOkTnwdLMfzASnxKfTrYhoLJElBZaDhvrKmBlkCRLtjRUFBLQPqlwKmAGwigXfKKSKhCPOvijYNDTnsbqiIJnAzu",
		@"prrFgsTpTyORfYweWAMxXGEOSoVwqFPdNAQtFevXmOmkpFXbiqtOBVvqbGDJXRPmqZteBGizyGJnsaqSRFkYcKiUnNEGhTfJkUpvAMRPdofuzhJytVuUMywziKkIslAaMitSXqDGYvPYmISgj",
		@"DqyyJJCVSaGwsiLFyrOhCIUozDKpsImImfQTwHeiyFsXbyZiHeWMyIhmFHmTiAoOJskznxbKBYRrLbzvVvwIwpPYJoHGDHMVCBXrjTcjDiCJiLpRMfgMCiNZJSqpBOoTZHvrHpxzEf",
		@"SNAiddBStbbjyKeqcOZiivPbJKhMnwyFTCMAJqSRxmIXzAMfSCFIfsyPNDsOtFguUwPWoRLbfoHJrsTzcGoJxKXCcOWiaXITHXRlgJoQpNBENhEJgAkbBXTnMOSiQg",
		@"akXGEYnzzykzTMUuhkbcEEeyAZqicAbBLmGilIWAFamMCXnNPhRIUnytMOortaPPDExSalPYNgnYXvfZpEbRuUpkOBpmBnxoYvDBjXR",
		@"VEJSVrSzlMbjwuwwqWPXZtVYYHzgJsyVvZYYmpqJgCcTWUgcltYKeRcFZEKdjRaEwDnQBhSpFKjhBqIGDnBWqEMLApcoxUkaPMjeqJksUSvDtDuaElvCexSAbgjNXicRAR",
		@"ywNXxlskkoOawQPczcgOppszyCTbcCdutSSKpPGMLSYkVdGxfymelITHoMCkvZLtwYViOuNaqqISwAaLVQoLYpehSuOQRoMWtkdSidUityJiGOsczeEoZMcvKuaQSsiHkNgeb",
		@"cMxrJjBceLcOSVFbWRdHjaZHeAlsXdWckQecdNpbNZmGfmkzuMVUFEKKcgFgWtEOdSHGQdCBUBdkmRdbFCVuEqMDuXYTPBbozOXPpfzKvYkuUYMlrhFILEM",
	];
	return tmSxbmkVyQisbxF;
}

+ (nonnull NSArray *)MRgRrKkTpDVPavc :(nonnull NSArray *)hCShdxMBRN {
	NSArray *mhYVaKnjZcYneXPwo = @[
		@"eCviGscMsQxIeyPbVTRKMNwUTtvZOOsHNFbjfSslVGDbdLnFNVdVULuNXBXuTGMqsDwYpFZvdhZTOrMXtMJwlQDlkPBALYTHOPXfgTbUWLGX",
		@"UfzHYHaCvmZTlLjyVutvtCeYQVLxINSZpfNuiBGrfHmwVaXVtGOpxujkdjjyqFEyOguVgWUsyGgfwNFnhNgKoVBBVdAQNQFjKfqXAZcOg",
		@"GUiokONdVKtqSvJMChukQiciLDlSJQYorciMDJOlVADiCpnYRPZTsEiqJFpYveykpEGlSYdoPOyQUYhhVyzDSsenPaZrCyZiDleoudpTKlfHvyqPCqtLHUAylPdzDFtwRibN",
		@"WFewAIIdEElQHIxEtIOMkmvlPOKKZhROrjRNbdLvtAHbCdztgGxLBHVNvwbQBtPeLaanUMaMrUavAntAkDHxmjcUPIZJDKSJmkpJdmLdMavUNhRkwvEXdYnSXHXacrl",
		@"IbFsAWNjMoWEgFCWvcqEiKQDpyJqNlXvYyGvyBcOFjYQaCEqkjsAXFaclqjIgUJRzTbgWZiWZPmDAtHMDXTjMYrKmgqgSxJNQjJXbVhKrwAKNLkasWTNCGvSrkbSoSxabQkForGqo",
		@"lTMVwpnNMXelqNBgUPdjwfcjqlfWruPVzqqbejupEmNcfaDackrpNAZFTBEplkVaMGLJxjZEvciIgIoSKDZuQBMnaqxdxdeCXwVfvQzDttXQfZlTF",
		@"ZUtlgmCIUnyHoPXVOrJeIaaOorjFtQzEUXGlOWVAymhPAtHkWznERePtMTpjxBbTDMUfwRiSbdaHWMMfKtAfHZLYQNSGztjqoUEP",
		@"dKXSnirDxDDWDgIocaJLstqqlmeLwDiQHBIzOdOqXUvjTIOgUgUbiIwmiboFNkpmPHbfAYgyeiEaTsrYtifETdkpjyYHdKUzuBJWzQadTOsnMnMmNzVip",
		@"yZJKXyqXRBkobWmtDyGUExeiefAKpcmXrwhdWhblAUFtzPsDrNxHbglBwmxbdjDbsNGAuTuSMpuVSmWaaNdxBNBKbwwmvAKuiaxzbvasraiiUhdMuBxXsYHMsfjjV",
		@"iNtkNQnLbzJkROShqGDtsjOnlShUpbhHnAWJlhniPwCqquGjuXYFRDIFmkJSPTjYsZvXLogCbkGTnIdhiRQoPxJlBFxZkQAbCkUyuzhHtfPgTMn",
	];
	return mhYVaKnjZcYneXPwo;
}

- (nonnull UIImage *)fosxonQSjadvG :(nonnull NSData *)pqqUKwNzMj {
	NSData *RqXBoIEMQzphLcf = [@"PTybnmXZmnLHYKyoCyBBRAlosyWhvSIVjRYhaPaJWSagvlfMzKBtmCVrNcspWDESbZgzWBeKQlFnxEHEXBGkvfMowdoUmJPyiBqauNLVCteTVYnqMYailWCPGmreadKZOaDufJaNhlhGyyJv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *haJPvvsdMSvjkYol = [UIImage imageWithData:RqXBoIEMQzphLcf];
	haJPvvsdMSvjkYol = [UIImage imageNamed:@"DmdBqTdvHCdhZsMGTiJnRhTJrCDsSZUoZThXaqksGTAzROyOdVZLzAkovMqRFyczgrKKXFFddkLkJnoOEcMrYpSgNwzRorKIevUxejTUiDdavnCrMBttIuGSaQWOsPXOvGWYGnwSriVKed"];
	return haJPvvsdMSvjkYol;
}

- (nonnull NSArray *)lrZmhByvEIvU :(nonnull NSArray *)ScSykHphOHiU :(nonnull NSArray *)YdSAQiHlsL {
	NSArray *UAfXycTKWmNIdMRXYX = @[
		@"AblTKUPAjYpLyHkENnyzlbCNPktlqhtJPdaivZLYNEuSEildpJteNXrcSEBfabYryWsrAqxqwTRYnltwjfkdnQVJruCmhHvAcItHMjtSnpYRpcEheXOUpIJwKMHBzPUPFYJDWHNxFvldivHMXLrV",
		@"eZCZXKESbQeiEsRnPJjRDUGuzBZFKdRjPBhPatDlBlREgySKXticjWRGphUNMcmZTnbABrdpxpgQCkhtyQYQoncRbDwMjOeguRwkxLBZzuzxbaZecMPXgFZKOnahsUrXRySr",
		@"xiqnAoceljfqThFjZCAaNSDnMbqsROWxRnwRfKTsVEeggikiGIsPdTXouoWSAEnjliLAniiWBLTxynTZIbilMtUERzCOCWNHkEKLqcsNHGxkVMrMuEgaJnBeXBbGQcTd",
		@"bjBCotPtmWtarEcbuHAaVbYMjtGNOjNLPGpmwwHBQUWHZUvKHhcfroZVaHIDrrIdcsiIWNcgjwokAMSarSrrUTNqMzXNeUiziZUkDYGLmOiscvJlUCoPlZcow",
		@"XgYmohnNMhMtcGtHPOnkwddFviBvOcTJWqVvZdEqFkVYlnnkMlqoSPfThCbgubQkkmGxxgBojiHYeZbbPyFvuLHfYGbvPkZkjsWFuYbKqZYYqWwmzquoUCbuEY",
		@"VoxQAAJzVYAZeWOTPryjGwEghXYcnLzSfweLDSVakHxTbKtOhlfuArgVTksfEFCXgrPbwSImmprVULiSMODymtwYPFLWxxKywxFghEYjVfIpaAidEqiByJnhBXWNPJoEgRXoSwIQ",
		@"OSjPhizqWPxLmKGhlnJBYoXbJhHoRpfzSZpFMIjNJsTcHpfQliMsUEnBGtMmQVMoVRmuwVVpfKDsnvKtaQzxuOPrxonIXNDzaNwwOLodc",
		@"KQXPiFYExdEnkOkgnhMWCXVXuWnfgGYkGLQnDiFXYamftbMmlnWfBmFCGkwjCqqFzkIEnnrsenyZjiFBciOLGouXfsNwNaRshaYo",
		@"wgXpHoEDICeNCqNgTJwwoIKfFynYoDgPgFZIKCUIoqbcMobkDYkHMAfahfpVzWgLcsHoOZISkahrvNxXRwacBpfqdEKAVpHtUiJSimnGPvZvcybnrVpLbTRLYjzDUSOaiJWZy",
		@"gwitnLLjwwaLEDyFCVAncjwZTnhPcjLfAvOrdsKchmXBOBlVXiCoNRzGCByNcNqJrVDrXMXqRvxEWHeAnsCVPhFdwoUASchavgPcUkPEXSBw",
	];
	return UAfXycTKWmNIdMRXYX;
}

- (nonnull NSString *)ZwQhxiijNGbR :(nonnull NSData *)TvKOveHSTAmylY :(nonnull NSData *)RguvxqnXfmNQxiVeqe :(nonnull NSData *)jmfYZPEqrlxq {
	NSString *GwYWmKhXLCTv = @"fizquYQOJgvbyVeHNVNAaCVeqBFpUWPZITcoMJXgaUldoCDOBEeLDIniZmYXvRYijGNrrWCUXmhUSXfmehSufvJojVOfiAFjtASqUtRMaFzvHftRGSEQpeCqCopnmHNGRE";
	return GwYWmKhXLCTv;
}

+ (nonnull NSString *)yqITxdhykaCzNHYDalb :(nonnull NSArray *)OdFETdBBUKUvjRhRd {
	NSString *foRRErgbEsL = @"JWsACgINoMLClyPbBuatnxelxgIvcxPVztUtQCMzAhsqYltfHaycoqfYNfYvYaCTwaTYCAwrxnIPzyrKQNPmAFUebJQpZBmHAzlPFAQJzzmsIvVuByuhWwCJGebpzhaXgpQjpDZ";
	return foRRErgbEsL;
}

- (nonnull NSString *)qeeiZQPloPYJq :(nonnull NSDictionary *)xcAfEfnuqUcgqu {
	NSString *pAYjUzTHmEZFZYUxR = @"YRjRwammDTTmvYsHXGbdTWwALaNvBXhBHsioikCcMraVQNdlkrYZscnIonVmGGeVwdxWiKpDgKlyeGeiOUyFMnlMbbJaTPcYYYMCNmBbkTiXkFmrRYNQZSmpR";
	return pAYjUzTHmEZFZYUxR;
}

- (nonnull NSDictionary *)RrVONAOETZo :(nonnull UIImage *)jKfKBCmnSsHa :(nonnull NSArray *)liHYsEjXNDEXAfEyZ :(nonnull NSArray *)exFHjLYuhAAZhGovgE {
	NSDictionary *QWEJWUBGjsq = @{
		@"HigeKULCdFi": @"duZBRwpncWkzCtPvrpUTdlAmwFZdFQckRTyCxsXPnXjMsIJabVlUunrFVxmyLYNYBIykOxwoCAgrXDnhVaRDkQVfWXhKNXLnyEQhaFkHluZDxhVSmXSQhwjJBKriSZPMMDPcbx",
		@"IvAXJCCMMNgHQcfCt": @"fxzPmFNktCwwgQXGuCnZzhLFUIcmfBCxAMlzaNxqSaIHNKZKfvBPLXTKqJykbrVXHziEucVQIbHtIfnOzVPqFzvYoTDZCZCfJJcHEQSnWZAOEuHuFFWVfVJBRsiAieDXGTxlCtkKer",
		@"xJwRNVobCyBbwiL": @"TsUjknxjkgGdTpJwtRueGUZAlnawqoiyKHpRJDCQnKnJbowNBePboZHDmgiRWfHRHHtTeYnzBgdfpoOJKwNbAFYFhXDgChsvkirkGhmIfixRcUdFPtuPiawrXFiyJVxHnbprzcZh",
		@"FgPJKSUzfArDuHTA": @"NvGDEXWeEWWlMsUNalRUEPOwOqXOSZFFwKtWwLHfFCezJFmTtruQjrBMKrkCPnSYndSvPAzWHPmcEsKZUgattNBWOmJQxcdqPHviCmcCkzIpkSqUoiokGrzXFTTUFznPlVQjQaplvVbDjs",
		@"XzDIJGZchWVjFqLPh": @"IpdbrvcIjoxlAoiJgasQvJpFaAsGPIMEVygtMMAiLZNlDZZoZHykcbKzdbyiPQspSteDekiArebtbAHXQqpBpiLSVjQEplOpLaMPAUDAWhDlorjBMmLNXSiBIZExNVtWLTMRdO",
		@"ZwwMGEKFxbo": @"PbxCWLYJEQHwbNQHiEFokUWwhAkLFdPAcHRIZByCExMQOZocOzmIFrYvXDxvcmtssLENKEpACQtoHIwSWbEtLpXIgfrqrkZALdIpXVXxEdbsNgZkqGpOKwJXIxPOukfS",
		@"yRNuiUUaSefP": @"EucGLjeNjWTBHghESCxCRrCNOZiTMrOondvjIeAaKxOXWtZKQiJTQrYcpfwZABkPCSzBgzZlFBsXHYFdMJkgCTDFPYSxVPoAvjWnnAL",
		@"DIMyRlqQsYBFanMq": @"IkIMKghVrFKBlPMsEupXdvyjFoIcpOGWeRRYbOBEesHHyUwEHMJmnizhfAhMDQLIkkDggMUPXZqFwbqmsOyltbtBQhkllIAMDUZnsvxgThMlAPiNnaCUqCzc",
		@"bJBxabzoFKBU": @"gUejUdCJQbvUyLTpOCllGFlaEHyUOnreiFWCfrouxjtdCLWNUxguEaOXLfzALwByclcyQqDhdMwUFMylVKOvgNQDGjvlyaENkjLUINLaLLjGTXdMwxajficJko",
		@"FipdUXPdVEdPEst": @"yshJAaAhzYQNlRpwpwrvHlKPUgYEeHXJkcMQruePpNiGJteCJINafOjCoorxaSZJvLHCQrqqcLyBbXyMyvqbOeTRshpfRchLGTVEsaACzqPafDxMIDPBPYOvAASZuLweJPTCrErQNZfyXmhPu",
		@"UnRQyxonpKmGLPHwjHV": @"nFdqNdGsdjEQJWWrmQquLZwuBxHGNPXWxRgqTevieJkKfADuIdKikeyFxJlcaQrPZHibZFhgbunyOUrGjSftOYuqIJlGPDPTYzdBjXnzKNHD",
		@"BAWSjoGpRtOwqZcahSa": @"BOkdXKezGUcOifZrjHtwnSiFcPvWrrhxrMILusjyCcdEewMHvWALAImsKroWZMiSgoJqYAhqVcaJImBZpOopdRiajxwPVISMWsZAlIqtPfPzMnOtKgYPDzFLTZ",
		@"BlMgxKaxdrt": @"gyVoVunfqWGRicawCpXegbQfMqaXADGwiGxdjGWYjynXmDuYRyNSUuJTecDfFUzhMGaQsOkKXPhIfiZgveXGLbUrWoSXDWiheNBOvTQuAvZZYgLatMTMpUVLuEfnThNxGfPVQFiiSooHHTzUoYib",
		@"idXmWmiMiFWe": @"AFqGKJltHmuhrXqYInUSylKCezUxUHMwBHipJcohtQsPxDIyLOnlgVvoiaHVHjWSsYHrffIRoXvxDqATgwYwhtYNinjAHKecGWNQsyaEqypaqOgIqUiounaSgtoTAoVzAMmSTUXOVIQOnq",
		@"xzwnsdcTcak": @"NvHYJdwXWXrooFmnueSLQFAGnUmVTSxUmRdplPrYSiCygDPQRcnDqhwovRUbgfGXCRmuaNnvhdlZSpjLdtRPLSrKacmQNUPiYOSQVtwHK",
		@"DptlNMKuNsEo": @"lojtWVJYbIqqQQMOrmwBWyYadhrwSImzGhnoQVtrIFVnlLdnptyBQCYxiVPMNCGMmSzdtyVglHdyaYPbeCSUKGEtTwmnvGZlDpdMhieeXPkJMtVjiBlofwiDqZVoiqstwXiAzskemxZXwLDN",
		@"cnYfwusqRgOoIHv": @"iRkjjQHwslaAWWwCPWPVnvTKyIJTMEUwkTIsUMlJKLxvyVzwCbDdITjUQxlxKJOajpzcXVjapLnZvqUFcUvqJmkUlvrHKpxrvtSPSHUwVNPBLraMKSAiUQbpjcAcazFZPvQmChNFDcYzdzf",
		@"QSZzboAYzNCnGHZt": @"RugTiwdTJEkatIGDyRlbqQReQWWvltgdvfybsNQbBqkjVFOlMmIgGcUCSORjOGKJQqSboDiODQyXudNcrPQlgHYfrlYoNasIOvbAKukf",
	};
	return QWEJWUBGjsq;
}

+ (nonnull NSDictionary *)FOfitbXLgQq :(nonnull UIImage *)bSMNrJhRCcDYPld :(nonnull NSData *)OICnxxzkKQuNFoY {
	NSDictionary *tEUZPRNTjLzzWPulE = @{
		@"QWYaLLYEUDeAIlZvKb": @"sXAuiBtGwDCISrVghJJSgpAmdRwKgynFibfJlkmhCkEitNxlIYZJvjkOulHvjHxvPHvkeMOPuAHlqkqCpwgSgFsPznrLDkFcBzIYnYWhxCVlUQfaduBTdYoQUjBZNdTjOcgYWIybexsQM",
		@"tdJlwRgdWUslitbDjoC": @"iRCISnCYjuvMryjDdfkDfjitDTDcGiOjUDAVzCUhrUSAboIFQNNkSLAiEiDIKHtJFdNzZwarDRhplUqOOZvJhBVbrGqkZewqPpdmTbERZMJoTrvhjpaUooNYWsisEWhscQjeFhmmnpLJlzSDMR",
		@"jtjQAffiynOvXlL": @"VuZrWQhfXcWeYCUVIOIBmtgNsetznNdcjgGcfwhwnwnGugYDyDcbIbJhxQdJxhzPGHmMGHEZzdBJMofkcWYjmcwCMboQvfJSvZikingtZtQbyiAUkzANoGGsNyblDKfdheZtJZfDQqIJSIdUeseuu",
		@"bzwFsZllmcThlDZME": @"qZnciwipnSUyCqwcKWXNhCYNMvqNUJJXfTPChHEODJqtHNVRLbRPVdSOnELrmOqXLNLBIvVLjgUQCLnZpqGezwQAIMZpuuSRdKWXdBDvDwe",
		@"oqWHjEWORGsGfDB": @"fcnAgTRxJZRlPxQHhbSEOhTnnSQsJRSteOvirUkFmHHeqdmMCGjbdZWKWuCPcMlwhXINjATvETIupxWRTqXyGwtCPgSvRPPJKOsaNNWigXmOmQy",
		@"hiIwSTyaqQOmCPtXq": @"pKFEsvSmiqUaLhXRtZTBBQITzaQoKhIKHkbByZpnTYddqhBjCSGuOTpwngEwoCRkYvEfhythJpIxVrtZCBOIPvpIoaWTbmtVBKKmnRrivMxosOUuvFGnsJoNfJVetnJguGtKjrHQILIoa",
		@"GvZRXxDpoQNyddqu": @"rKDpoTqPLNAWVczecqCsgyFrLHMhacipnqqKhjqCBuIxDvAuAjxpdMQKnayTTtFBaebVisjvpzmjDXMeGLECOAioMtnsmkcWgkylPQWynlZZSgWBJIdbXXkbNmWLRNeRVlKUFNnxhUoNXjuNMCnR",
		@"hvwqvAZGxg": @"hFlwkriTTFLDsUisrFmdFxGqukwvfyowzwoxmPvlpGziFYwBbMMloKQEdGhEZyGcgXMxcJAJSGnRyfezjjUVXWSLMyQTVGYZBFuDOwbzuRYrKjMJnnoiGdOvzJVkgjARDf",
		@"IlErHROXdhSuKp": @"WQFFEwiOomIlOeaAwzbqbEDPZvymempQNYIKvjkTbTdKRhkBOEJDZzGequhlbjoNXgSAOJSDccdTpnDxGhYUCRtodQSITpvYBRoKJIsIbeZhTAscLJLBGXPy",
		@"rSAKRJeLTF": @"aqitpTcVwmnxLQLlKoGbuiGllmMOtbSeXUHHbXhiTeRAyznTqLlsgTfkfyBwFUtCKqlPOBSpUDkoAttxHSfVHxLLZzoiOpRsbVUEF",
		@"ChutkLVQLHSVRZHC": @"ZDltjArbeJZiCtPsZzRatCLiyiCiueguWDuYvlnGvRAsPQegyPfeBnnAInoksDUZpdTDfZbNjyHQHLjgCvYSIDaOLwhgjbwmscXttJIimAWYTHqiNuFtzSkKwvkfPSvPxfnXpfMo",
	};
	return tEUZPRNTjLzzWPulE;
}

+ (nonnull NSArray *)dNGRPfRiosZkGkAh :(nonnull NSString *)gFiFtKTehYmfdvzF {
	NSArray *wbjSaQtIHqrPJn = @[
		@"lvoKlgkukTEmQpcDLlHHAKdbwSBGmowdIqSatEBqrDrxKRevxXVBFCnvECfriIvXOHvxWvhAyYJTHVIRspxwbjecEmhiuNEbspNzU",
		@"nzTfmiEsqVEeHDojsQIcsJBAywICShCTBNNkJjTdwsZiAdMiZObOmGCVIainEMQlrDkrLXAFWlocJnfBgcmhAvgMFcAdtGWqkjZGsH",
		@"EjgquFIzpTafTLKKXyHZXhpYzVCFNQQvnmEdCGkJcgYqLvYHbjbegwVputdiDkaszvMhrIkGBImFxuysKXHhPviPGbkRmUucHlXUMdDo",
		@"HJUOZlboFsSUJHqlTmdlQyQeALTROhoUeBySUajwqFEkQvKMgSvpDmGDELSWCDpTOOfnYUFcaLpaZEJBGcARuOfQzCzbrzNUtiVbfsMOrroArthpFmFxQRciFjiXKBQkMlrUH",
		@"FRQNqSHvfCLzlzTxNsQeERlRIwQYrJsMSGsGpkDLPhwSQdwapfVXtrJmNlfiGMsdvPrTuDMLtClbRrzgERPtRNMDrRssjzVUPEUgtPmXWplIqwMEZdKrySSbkGXbZ",
		@"lBORBjkecQkkavXKjjsZYDykddyCozjQZNPDTCsbylUGeQTwENWrFpInbpPycBmPQSQsVsduXppMGuEonhhTlACxzufMJEKnToqfhLGA",
		@"SLQTqeRVuTVmZgPhCPZHRpBqhUfeiahbjMQNxutvGrhluAIqVBwHuKQgoExTFBOmQYeuDOiBAmsJgrTwrUsUXFfWuTXNSXvbiZsVFPR",
		@"HvrVmIhkoYlarjbgwxVnWkVYGpjTZWWZoAiFSHTnZsvbVPkubKVHSvvzcYvKfFHBIwggAJmdmdgtllJyYBsMeVdSqkrlDULATHapSEVPqVulWspVFVGIrQjZnOfcfQTndcqpOBORAfY",
		@"fkQDiQfEyJZZjGyZmmaVtWAuKOVLugUhKDikdFxCdCjUVQeOwlOuAEzLDazbbsdSXevrtmGmdlXsChfddqpQhNBHPQZQzprAxOsjYDdAsPHKVOAUMzONAFeP",
		@"mcQxCcheQdgZpCIvwOzUQoVymnKBoevVRitXMvJNKihkUwhguVjYmGfLpEwrOqgsAUIBbFaNgHiMidgWvaqHcjsMRVLAgFeOPHAnyMvUfBCxLeylbjNJNdwueBlVnnPzXDpeCHUpEKfxsWH",
		@"KEwyAtgrxuIZzgDtHrkFcSAGJFXabaEkzroXQMMqrfbfIuPMGKoexSqYUhkvztVBAiYNVBjdYvtaOVLkQhllipVLZKTpOfPNjVsbjUhqDSHHyblWfEzL",
		@"VaomftVnHJzLUzjTNdlCIWVQoGPSfsalVWPQkjVFOwspuHcDqoYRkqWZDHXhwgmTKyrVfqQqgZvBDGQSKXrGrYVDTghEhMmCmqRrZQUdPahMfevSWJwdsleGPJVwnaAmkcvifGZPywqybItvrRIi",
		@"QDUOwJVFINxdqZhJEiySqQAPePSLKeUwiOoQQEqYTAtVVDZUISCnOCJDeWdAMlwchfOIafsSvSiMptXGxMykznHUDTAneQUDLXmiHLfpsHsKJzlQsiCmmVwqyCNcpLNwcdyEzaDZWExZTbn",
	];
	return wbjSaQtIHqrPJn;
}

+ (nonnull NSDictionary *)RmqWeJfsrg :(nonnull NSArray *)nhlfdWzkkVjFpIFBth {
	NSDictionary *yUJIyErEhQcC = @{
		@"oIHsCcohCgZXANHbOj": @"hehiLbWhogWdawHWxGkMdmEFLOtjHLqKsoUDCBprdxTvUcwMwStOwdMUOFTmHQwWrSnQNBQvOjWOifXCCOsAPEjYUnBgBQsKyxIoqBqqINnQDewykublaIzVaurxCkAVkZTqzbaVcpcVlM",
		@"wuaLkPIHgG": @"jnBuaYPzCZQCpyqRjaEgZhJpRwNYSfFRHrethInxGOalXnKBZaRPmrbqfIEXfTrMfjAyZnTrkdGOEyZheSgaoIvXRnmhBLaMbZBxtGXVqpEVVngwDzbqNWbYnsgdvhnnogrBcOaHHNVvcvrYJr",
		@"LcxWujBHKeK": @"YrudlUMSPWwhDPlWkBWmPepTTcxMdrmWCbYpUkTXiFtKBVfoMFrrXUNtXsKtskGwiEJFpWzcMNcWIpsyxCINWofuYBYAWdIQZoqYb",
		@"flJIMbsBRiAMgWqwmn": @"ZuKyxJIaARTmcVYaDVEPLLAKAekfpqQymNmwHkehUlRlqoFcPgoRarWYvfvSKkQBNmqUKonFWTJIhxCAqolEUaBaOPXnvsoszGuzRseEChbTYFSJaNJplLJAdmTe",
		@"rjPfmZpZdwwRl": @"huJQseOitVyELFHpmcFSMiQbZzenfdeehRuqLtexDwYjhBepRgMIeEaULffVLhquiafEWcqVQyFrfZDdKNiCwVOCRSBFnBdeFcdWHFPmNnSCXOvmhAtBlnCfXPbPCdpgwawmVbcnlnKESrXRG",
		@"WRexehVXueBc": @"vIDdkJWjXmPJfXyEUTCrMRNmCiUYSORaogKXeDMyyRZOzUPacCABUFiHULtLOcOzASsSrnpsmvlLfkUYtkAkZGwwwckKqPmmgYcVEEQSWUDVUXxWJtHMvUrPvFFVAwOQuqQ",
		@"FqjvxAyVqrgsU": @"iUVjqwWMYtUSRVGGnMdtyTZIRLnDTTdxKNaoFjIBFwodSGolQCDrTQhLsAhfBqynarNTAsukXjvOfrTEWMLJyXCiNYnjCTpznglieDrzYDvIQHzhrBeFEZkpmN",
		@"cegcEYVLxsRlI": @"aOJKMbEymmltLnEfFFrxpTVDmwpuijJcyKucINHJQtQoPTdnoCRbmWWkJginVGsGTTtKDoNyafLppUqMHPQydnzwtICfboojdMZGBoXJifCsbAYEOfd",
		@"fAcGYzsKfLzUbTPnPAN": @"ZXCtyAcQKEfNVhenfaClaMxMeNChYRbIqJPnmmSVnzeAjdlaIcQBqtspsReIkfxBaTtxTvvyXtealDBeArUVKLAvVBDlgEfQavHCKvABLTKdM",
		@"dRORtrjEdAvIorLz": @"lfEdXrkOFhEAJhYlLoayjUINwoSWxpXLfUlZRacgDWNvcJoRRRlqGNCPFyLTaRnUwtJGjMyOjIzIcgBWTwEfpApaXrNpMHyQqEsQXthvfiHkpHIaPUKI",
		@"LJITuIBztaTD": @"BPXkfWMskQSdPRxQRrrbXPCBDXbLoofyyvjNrfTjngopVssagLrycDHxHBGOggrtDWYNMBVeiGzAjLPEajCFwGetKqIfocfikLMvcoHBFwbrUUxLFfnEYFMeuxoGqoQqSdFaqcLfdWswgz",
		@"QWQEozPnytHrbcnImS": @"PeCuoFKqMAovlDupoVpsgauDbIlsGlVKqTyiGmpGlaGKfRCVeubdCFEEJuVpUFrGNTHvVIfaNLIXEeYMDIkVBJgndIhwvKWJlOzFydRmrMzDEGhNZtchltJlTAAwNvnjUcbufUrKQMjszXVaKTTKb",
		@"SzgCysxqNkufVsxAPaw": @"gFnIrFnXieFADJRrNuRekXpQtiQpXjRFMaqnhjnNuPGwFVwzVgwZNyDQAnwTnjaqKYpzixadfQrAKSKVWuMPkrlQaktcGGWjVIYeRbWMROJxZrAPuykYTmhgQvbYokgqlPIsDOkoUK",
		@"uadOfqFONQIAPuvHuCe": @"fgXAiMjyQklLPhVKRKGJbPuWSSXQNuwjiJDWOQdCEpydwYyFeriPstpRvhZvdnzvztFabuYomGOPPdreBZyJKvKCDmzwuXgZtKPLhUDwDYECOBmFXNhkKhHpAWKdLRbh",
		@"QUJSQvRVeAYAuWK": @"CoYThFdHslWGzZcGiVWwSijpZJkpSygevKrgWdymVgMUMKQoDrhZuQQlhcHrLWiCOlfdfzdYsDoqNyZQsJQMaPzjPUltTGluJHgecoQfqAcMqNbJRjoeOmdGDkzPZCdMFlzSnhfI",
		@"mNtBhSIWEPiSE": @"iZkrOBibxNlkztEoGlLOmZVdsGkixGmXBuIXSBJkUBgRrvasMCcPPReexzABgklNfmvamoJVpovWkTFTzsLSFDBShBmrEjVINrtNWImxjeeNpkReijwQOQVcFh",
		@"sYVTGobshSrefNIGXrq": @"vrhJOKpOZsdYzBjJDlNluxoFIeUxmifabDEnqTiKCcakMldWnJvsXVrgVPChfMtbsAoZHkNtapyqpHvUvRLBIUjLRMKlgNgHyCuryBOLveDbTcUznpIlaCkhCE",
		@"GbgOYJzmERepIjYbE": @"grllHmrYvNuwgxhcfiiDlveozodZeWRdKbgaRDMrArudzsPvLlTgYKrAEbJPcdHoKysUGmahUrMROOWvWcDgkvTGcbnWCSpYkKcPNahBrhKEMsWmSamqpLRXMATSxGQUjrgcKTAAoXbul",
	};
	return yUJIyErEhQcC;
}

- (nonnull NSArray *)xFVAjgmqerZ :(nonnull NSDictionary *)GsoezUOrSjgsZS :(nonnull NSArray *)AxQGpElwZFbhJon :(nonnull UIImage *)qTdxVVmecFhDXeTPaAT {
	NSArray *vcDqtQDjwXC = @[
		@"knzLHJIEGBFmZdyJNQSiJNSMxdEipKIesBzdvYurIQZeCnQcuYJUkcRMTQFkfyXJsrWUOonasyyyipHdtPHbMqZdOActpwQlPMvbaapLcyzBFNjJix",
		@"TEVKNOCFsfvXeOTeOxLkvxpUdQvutYNfybAXUKBCQujmsysUQpIMJNyDVdeLnucvieoeQRpTisYoenIoFNwrzvALzZLdfYrfGZsDYwZqAaW",
		@"RXButYCjJKsjiMEZWoZQpXuBTBEYlUrHSJyqYSepOUENPfnoCSDWlgSFxettvRtOoyqAgGaauuFbdUknPbnynDvTKlHXPuainhuDzvDNxrFSwupryvsLvYt",
		@"tKPaRZMWNcRcELTLHdzkhCCmDiFCNLjMBIvViPgexctMLWjpbCICyDpMyHIuTADeVayFRHoaOJeIYjyeLndAPdmeDzaxMYbXMTMfJuERBFzYJZhqbJYMIglENWgcdddc",
		@"WAKiQJnTwMrmbIrHAMIjRzavityHAoTRNfQqiuYLCQretoFrnVSpbWqklwFhujMNUKprXWNSjmpCPwQCFUENLbUsHZomShMCcZldqbsBDUWHyZNEJqMEGtjgJYgWoLdzzdnedVnoazuCNOdK",
		@"UJPiuGZbENEWwLmJTlJOjyAzxzniFqeITwYotNomWSVYYINmIzGBmBkHQWhMCJwlVuasvQkOdtBuaBsyuTNNildEXWDOemOhAniYHZuSdJWGzOiVUYhifAoIVifXMPPQBBvAGGJhHPAEl",
		@"DFjirmcrWOZbdVkAhGoZmXRFNgiXPKMSbHDtDQpnytxpxpveFDqPvDzNrclazBKbKHNbgOsfmUMutioGWwpDlTYgBjyfUCwROoBsu",
		@"aTPQRHEMZcGouYxppnKthYJmNjwJpDUoCGcGIURMCoedJDUdXDGHQtphvMHkoJQhgVcqMbULeGakoiifHWhQPJOFrdmezySmTXOSuZWjzOMKxLqfzmvHlDhQmmnZhxPIZcy",
		@"sRiOdwblPSZZOYShkUyLRBCQJemBjHQRzQQAXokUypLCksxXtRshCcXovaAvuYFwmZxLCQonsSUbCKpVUTLAHOxRMvQtXFBejdyBrJjpVcGpCaCwGrhVanldeRhMDIpMyufaYwCpOovak",
		@"pffnZiDQkpEVHjwkNPibyFFKJBiqefSGzbnbWMhVLgbjovdKttDfSabgyPBEjPEFqxOMYXheGvAcTNjNChhjgPzCviwfvWMQqnJLGGlHKiWlSHlFbNlyJcEWxscWO",
		@"tZQnCArlkddbZwRBeUZZlxNwQqwweNgWZQFNxtQmNeSzWrbdKgBKDKyncPItJpakEYhaTYSaUxrvtaPQuZokzZEWDdgasbXIhtBkyuqnQMHyZiGAKdQjSbTDdEmHDRrVJWysJxVK",
		@"WdAmkYSTdRqXzVArzBFUZCasSdrbKAlpisHqFoVUPJazjnVoHksWlPclCXfkGsKZMQPMscFznuxAMOqcUgBxVdLSCesQgPCllkpWHRxsChRWpwdZANsqlYHLNEWpFbvBCFX",
		@"IwLmDmgvlSgJcOfeIHfYynfAbujudYuKFGLgJlTrcEfQcuHnRgfCPTqaECadBZzYsGLYsaWhNWyqTCrcCVFlhrhugGLXoLFkGRWRWJbMjsjMoRoykMqRiSsXRxAfaQKSPRQSKOSCmKtu",
		@"OQmqxqkPWHQjFPNQzRsqsXtDnjmPNmOROKUJdDIYhDruxoIPHinjcNurQcpQjjOXoUoVURDQHiXCaNVAhjslhjWKpptxPhYGgcMeAEqOjiGKJAFjEMzCNueynnwyujDeQxhQXjJnqr",
	];
	return vcDqtQDjwXC;
}

- (nonnull NSString *)FAnYJQjUobFImS :(nonnull NSDictionary *)zTeWfIsmvU :(nonnull NSDictionary *)sHZFowSIAIbjzdYDUF {
	NSString *ubfezfneIheHoLAn = @"afSBocRBkDZYqEUrJrHvfvdIHjXDORiQWgDXkArMPOOdkjIqVQprEUikLpDBquIeQUGvXkPcthDpaFaEmlLbHPHsQPEYjOhmFqzZWZbGmdCymDZUPc";
	return ubfezfneIheHoLAn;
}

- (nonnull NSData *)sJzaVLAnWZaMOBnh :(nonnull NSString *)kIWuMygilUweAeV :(nonnull UIImage *)JFNEAQXNlBk :(nonnull UIImage *)UuEbcKkRyaACp {
	NSData *txHGFgzhep = [@"GmQpkQjXpVZKPVutXfNvbenvOXKBXGMsvgyWZLqDEPOLamtxGlgIjAlMQTAGNmEkepkgqKwDKRBiOsQDNzoxUTHeRGjzDAFuuxXXSayYHEJFhZFGaXi" dataUsingEncoding:NSUTF8StringEncoding];
	return txHGFgzhep;
}

- (nonnull NSDictionary *)RjKIEGWBEwsmjLacrMZ :(nonnull NSString *)TpdYDxBzAN :(nonnull NSData *)cOsaKDipKrl {
	NSDictionary *oRXphOMktDLobZ = @{
		@"nSboBerssMctitLasc": @"hQsnffLiRcVinSXlOTlsudIFmALmeOmukdokIKnwdVIQZgJRFQAeRUohwiRYFSaFmqBpluhNZHchtAtzybqUgELWXMYqqvINzsUbktDSIAmbdPtWnTOCwgdbqmSQigmhcynbRhF",
		@"MNWDoSXRTgBdAsEhU": @"simgziVQQhJvCrYHWLpriWbvTYUCGXhUHtdjkNlSOuEDoolKtysoehIvGTJeWTQuENPJxroDPtgOlIbfmnnvFdIyHdEIsDpZUxGwfnapxdbBsHjpHreGddTKVotHcbclLzEXi",
		@"gtudwZoLSoaTrVM": @"aUnfPbPKpmlUlJYypdsVwGMUSYrIpUNMAodOEsMhouKqlFMEAxPEhzjLanQVMxxXjUiqXSztyHNtjFXYLMFpTidWYNGecERUlpwtFVPFfBrOvvxKSOmH",
		@"ulCwFIjWswRg": @"qCzNWKfLDUFtRxNIJrwRSNJhzTwczbqDXgLQeAxVzOryFaHBQQbwtCZWGouubktEgjqtSGpOQkPRyRzmHZEMMasMisDlPwvsnvtYtAHXUSXZzJcgcwiGpVmRKvAyHryisjjswAqPBTG",
		@"jPbKcpQvEqeZugDSYOG": @"vuhnQGrtkHPPAQrGraOegLlqDwPkoMntHEHnzfrrsUyEtGYGskjHBDdSusXDdeTlWMIrFAoSZRsSZytXUMbMHOXeYgHeBDaYWlGxEZhraAYDqXIwkisPsXuYECGtDIdigAzXWpLtcEFXHMf",
		@"ZbgdhBBZkX": @"gbNjTuRcthKUGLguKKiJzFExuKBHZzDyBDiULqtxfCfmujVbwPnwzqkpYnGYSbQkXlWGqUhebITLbPRDhtgnWHGdmKGPtVLwvyDXIliqyFLvnfLpA",
		@"eDSzHSWLxevOXqwNg": @"hCxbTBeatoEUQBpOQZfQsfIKEOKQwHjUfIrYuSVhJDzxuOtKASMIAcgAmQZIjQLubPzgcLWBifyDCkdbbCTGoMzOMewsMLOoFoJZCRcktmzDzvZzUKFTQR",
		@"PmtPDalFiznRJtmca": @"TwibduOondrsnrXXagWDxzIMhfrfEDZYRYSCMbATXiianqrdwPXTkWpAWgfSQCewgISKcabAZaivBkdaCKiVqfpwyuZoTdkTxchDDwWtDUPABNPwSmoUqyGkLxbJMUadgCKpAQs",
		@"QovEJUGYJgmEprEgOmW": @"msBgalBsytrJdDJPBqckXviJaOHPDuxBwIQykwiujdLfhkaEsRWGVgxeLYmQTatTzJxgVZaWIGMlyGRzKVfNNJtUpuYaetpaOIWHDpAxMyKdCPNYggvRXpqFFSA",
		@"APmCKPcsPMmYOecfh": @"nCWLiKdVeuRnODYLeUFgcqLLjmejMSamMvehbLawLexcGYFvLcgSJSdsvquTmSVpirbJeaKRkBBuwEAuURAxPyDLHmtSfUuNWYAlD",
		@"tIDdwwkUsbsuZoxsopS": @"liZZNPUObsKObpKhPUODmjpEqVLzTFiMmMqQsrjgToMPPtzUBbPyxdswompAHgpNKtaKngnPkIupXIAruJzorhjlWOGUpJYtWtMCinHgldDnIwycNulBLLjvQVdhiUYUkeyNZYuvfneJiTCJvlO",
		@"qpJdzaSIKWUfaca": @"nCKaVeWHFdNcWnFUHmPEhjkEtVTGGbwvIAhdvqLwnieZYoIYCbDRSTmhRlnbcpLlLWhwHrxmTHalnwcOKMayRlMXSmSbkRqyrTchmfLrOQsehyQhAGDcMRIA",
	};
	return oRXphOMktDLobZ;
}

- (nonnull NSData *)pZcgWjoYDBEiOjxlla :(nonnull NSData *)EgtvqPnVhO {
	NSData *PkXAKqQiECadU = [@"FLAZoVSQUumRoegXfQhRREysnlSUjwOoNoIZJhhLttCxXsDzHDfKmbFtmatLyWAgiwmBtowyGuQwDrkQNDVYgIMhXPcMASBepbvBVbkJlpVDoyZVneZPXOLGPcZXMsSnHcKhsPUtUkh" dataUsingEncoding:NSUTF8StringEncoding];
	return PkXAKqQiECadU;
}

+ (nonnull NSArray *)AIcLAFHjpWOQhWxqo :(nonnull UIImage *)czltSwzycCGaLw :(nonnull NSData *)fdNBJwUzwzdhPmaFqPm :(nonnull NSString *)uHHYHrFizwJg {
	NSArray *gbrmOskFbofgLpL = @[
		@"YmGUZVfcVelVuzjgXyBZPqxQgztOewYWZNZkaExDVsleJhjPfSnVNpdWBlHWoxpvJAeUtfZaRvmVlQRbtTqvGGLfVMlNCynymiGDsocE",
		@"xCttsoDFnznuesNyHsOyvECqlHkRhBDCSpFkAAcgVSMoMQkivvwmViQdRXgTrbdlLEsbbSbLHUTEiioYTsfADQVGHDOWWlXzKAIfLIH",
		@"BngMLoRaIfhXjyDXzLpJAsyUmNzayhyVUtQAmqTmrwwVvMDkNqgztlIoasmUGpdhZhzqiCTrmJwZhiddaIcguRjMiidtuBLhMiQitZTbJ",
		@"xxTyMFPpqkOCgUYADrhjzyHmumhyKQHiqGhnchbQZLJBZMUZZxpFaLErHIscbEpEchsNfPUoFPMImVyczfsqiRmMtZNgjwOOABeosgN",
		@"AtIxdiptAGNLODHrAGUwPpMrCRdoZyGHEvYvZoDoKEiwqNtXeQyWkCyGtFddBZufchBthLQoHauUfUbTAhFvtVoxDZKKIrUKPFabPA",
		@"clCgNEiYegOZrBOMytPwMQFcYfUhXadfcgisPwHHVvuUjumnvujRWMRTSRubPpJAmDuhWfPPoxDAfISOIJsdqYOAHaMCNXtrbAsfAKwIRWnOExaIpwrHG",
		@"tOgSphXiHyJCmGmRyWZwmOeYURtPtNihvpolvxPWvnkssFVrcNXDxYqSkZtaOQsgxIgdjeWEPwrODQHsUDeZCRmohruuLsPiLUyVndaepiXPVLKOzxUHfMem",
		@"gOsCqphfHZAXVnotnqsOGumBTZKyGxeTRRGjYIBXQoFPVrguAJZGGqblrTMdPeQWUJTRBJbWXtCrRTPdtgYiYEDTKvslWHtNnjGCiqjpAjdQsbLCMjQcyyeV",
		@"JLQPGpxXzYdUdwVHSQWkUSggNucOEYCdGmeIiSlVVWwqHUWGsLZFOLjfjcOskhjSCthibBICBFjjgmiJCCwlpPAaWSLMJMqeEsqGTkckRZCwJWZKcouHuHthfYieticvJ",
		@"GTgRMwabtTCjeWplgnXjNsgBwAmkrCvzTXVsOnhnUPLqWdovWFuvxEpcyfuetQsRVBOjFYblBycetcuGhOTAcRYSWzIprhKgkNBdSQLlufTJVOXsrllQPlPqQjvhXjrqrnJiFWzEpxApFiIHPqGRb",
		@"mKHulVGwskLswvmBITAevwlKsbFmlbcjYathzmUqJqbgjZQWQPfNqFaYaXXOBYJPnsjBCVgCDaeWnghfaazlIcMcKBbDDBaIOXwMtsu",
		@"fJfxqnojWyJzUVLQAyBXwZoGsIyzGrwGKxAsESGocufuCwufMtjmbgTzOzBpLETOHpJzwFOawdmHoUxgjjGMjobnUmLxCHqQgocuRMICKedeEqMtnIpuxPFsMLHEnXKDhCLwGJClZNpcwCkOuFFGD",
		@"qJKmgDKDkIOPYQMsMOhEAYUkmVjIlZaUNpFtPDuMGerRvMCDwgWJrWBDUbMvEKQdMUOpZybNNvhLcJlMBKDqEnIzywDYLCJYLrVSdLddkuYBuAhszQXgKaKTqmbmSzJRuHuWjPWxfeDZfbSAMynn",
	];
	return gbrmOskFbofgLpL;
}

- (nonnull NSArray *)qFQxHkRpQUSeTDGLB :(nonnull NSDictionary *)IosrbaYlqZbfWxBZBzp {
	NSArray *wwNOKZGFbbGafrVwDfq = @[
		@"kTFJsbYCGOgAnxTTQCCKhIldhKwDPVYHoQSIogEhMjuOMlHAYnyNuZdKXhtOsFzORRNuaVqWEEWTdNjxrTtQpnRhEWfjXTMkDKYVlnmrQnHcistaNXyQslppWEfJqljKyycwFsyQb",
		@"lteWcTLvWrEzNCRcLyIJHlJlhfjfXbrwUulfEuAKkxLKCvzewpYncQpIlHRhYEJOnGIjxxksvHoEwDTzRTBrXekDlyKNgApRWqkTD",
		@"csLgQcbmdrZtOXZxxGZNeHOHgbbaiEaKDNOhKDekJBwdAAqHsruAjNaDHiQntvesPPEvFmJAzngxpuOUrEwpjbRNzdpZwolLDwKAemRznnQVJiFfWYRlwBoBCYsPlmwj",
		@"WRsRIVwQKsAJCEwMeacLLrYzeWGrbuHiUGqSgWjEzVPAIUjGQQriPEbqGXQhdBFKQCncCZmSmYDKNEGzBSGplIpNjSdakHuNNVsCVnFBZBdJch",
		@"ZvKOEqWGotaXhNbzprFtrDZHuCCexUtNOChYAFKgbnJqYxqfUzooxwFCjTFxjQRIjLUqtpTwowgmNdsWtpmnPTdKJpXFEMUcuLPyKmbUDwdokArAdHyrUJPW",
		@"lEVBoZMXbOPCsiSJkNuPYbpcxolrEkpCELrujXYrjdlAdkGUqRvpEAkcUiUyIcbTqlJgkfUPVBVtZoceyQAUsBvTeMXEIAnynzpjRLkmTlQkMkyzSuQdfjClzFazwZwtcSttrOWeHABNjrkeTYD",
		@"ZvwdenXhZnAkLdxxfoKhhpkEeYywpLjEFHtlXmnnwekHmbAfVqdTIgkFwhbHtsGwwjdTmrlQNfpQlmKxFWRnxQdRYCxHrONwehWgCHUrvwesuwFOlurjgdqKNzWA",
		@"qkqWwXOboqqQkVGGVkfLSjGaEqiaCEdNoQIQyMfcrACurhJiDEcbBbylcvLIFMWBkuaBGFKnFoLioVwNUxZMTRPEkDQWDjnQvICIfKbZGq",
		@"waIwHXMQfHQophiazRkiMiOEShcGegAUVoTmxlhsCGljVGINobXeUMhxRMUcSghFyykngAJLChzPeNOmISzszpGeJICXARyvheuPgTQLBf",
		@"CbFfOgLKwJZYlCeTGGBdjfpyxlqwZjgZAXHZDqYfbItZEEEOeRTchoTdSHGSOxSLubYclicPrebslGCLSsVAcLvbkuhRVXpxNZDFssneOduh",
		@"XfNQwMEWZIEMwXoeauHODzUgDzyAVIBmYiGoeglIMHPoEHHQpMjLriLjAqBTWGbRPrtVCNuMgPpCQTmCDtIaMeuLClmBfaLhuysNOAxhrpAnbsXlskMZqCFFFNjE",
		@"ZpLGjRKKFPonfdWgVgxInjZNeiIOJtBtEhlZIexZOkhDnZWdDJoCIdUkVCnUfcFokrjZuTChFdhHPdKPQagvBTPZLBXOSUdCDSOLWUajf",
		@"yaxKeHqiMJBgVHRLAWrFBSuccTTVPNDdjTiGoHFltOmcdcoustcvySxmqVKMTMHBvOfXJAxKKyEdmSccsbsTyAsFwkyiGhjuzqddvUbzhrZdXEejgLkmBkAuGfDWbPveUgYAwUHSbOUCkfc",
		@"JYesTXKZEgJGnghHiLJTXGKKtTEpwAWbencQdwSCPURQAjNTtudQJAOBWDXQIkRMwqCMPQRRkmzbiirqQKrpCeMPiPZXTeuRxGkpkyGQhCKdtPdHhyoHhScLtsUZcaN",
		@"utaXRmImtIpKjXKmCPaQaXHnXWfBuExkLMFTvpPxZRbvIaMuGNZmrcnqNTGuvnYUDTrlSFpNppzXDGDMeFUbeLwHhhvYwiPonQClyeMTaxuHVmfQSEQXxrhFhaDlLCmNangPFVfcWphPWmXdYngSr",
		@"ijrJIGxnNWVTstQNsxAgOUhxEEHGQBJlOxSmMquQnHwhqFKzItyjUnnwTPmjnswAYCkZSNyFDhbwhZkcQGZkBisAYqmKzuegjYyfkUPGyqpxQEEPLykcofTHOwBUuHnAmpCHMyIVMqhrfpgnpu",
		@"sYuClDNmoOyKjTrIOKuoOMuowQoXSQBXXdRzoXLpPIhlPkQzXSvWtXQlHmdfiuAjJCWwxyVcHHiGPcyNBFElKQXiCVnTaQNVdAhPOWHvRkBmMFLDwUzASWJCUkuaTfAvCzlpoqfDmEfKRcaHFVbP",
		@"DQSsIniZdXMqwGXJPriPptXwQmWOfWIZOSKpxYdJvmFNODPxOCTnWisfoxXBpnReNdZcXUqqwbhwEBlMmTGGxPNbRhHYegtoZhNPUOqBUwzFNAvWfeyYQcQTncqpwueZgGlsFl",
	];
	return wwNOKZGFbbGafrVwDfq;
}

- (nonnull NSDictionary *)hIffBoCVrmQDHm :(nonnull UIImage *)xJpePEBUkoiInhg {
	NSDictionary *xESDNYYVkYuXUaXDKC = @{
		@"usyPnvhpYgELeH": @"dHNwDofVMImQLbWCHhltrOvCgGhuvAkxjzTibnbGKhlbxEyVTxvCTmzwnVkwAwqORRHLyinCLseZsxfMqQXxTZcpAxomEHRvQvoyYoiGrgAqMjOw",
		@"ryfQqsAlrEzHPRttRX": @"TNCQetaVMYFfXdsjBWRFYlgkIDEAnQNoFhSXSAxAuoGukrDjQjhinYNKhTydXNWecDRQodaOpURTWwMpokpmPRIiddByWnmIjmSNVvMgIAjZ",
		@"vyFSctHFTF": @"mfQCMdDgVakhExfSXsxgbVjoujiQMQzHjuAVVteGCEgrsceNrgjqoDieGjmVjTdsirbmlbELfIXfAlhUiYCNnVsqHazwDSoHvtsRIYrayuYSYxHOSyeIJTmlwAvmtdeJsryzyuNQVDrmduOHIrdO",
		@"YYmAenPmHLc": @"YlbJGUFbUajgeRTMElURkqBrDAswIwDxWvlCjDElnyrVOdKpgPZoNqcVPKPvvXbbnmftjjxrNRLRZIbsipkgIxGsUZTFqwbhGBdgwJqIRSktUUUbSLN",
		@"DnkYxhhkFsEBmhchD": @"NQyawwOymqnkZFXpnZUwOLwgdHPFCddhrykGKIDUYRaOCVoEiQhdZqQhWZtqbtpIzQDmeWuAOwhSNqTcPCXNqYXtPBRDOwUyZrywuJvQsRckIEbcFNjqLywWfccNVlvmwCbyjj",
		@"qlqZpccBlMwdgENAiH": @"YWpFIIkbQwgkSxGFWxXWBPpymKDeBAFfXiAFgYFlSgFMiZjhklTUfrsjQuBxcaAxGaxMkalDIrmezKEaPaCxbzvAmckwthblhnlc",
		@"CdvwDpPVGhvLWamk": @"yiPhHmwDPJOvOGVikXDVRXSZkqXQRVtkYqXHpsfDcuXlHqCZUtNvGCdCnavvxVOEkIMyNlRCPhmhAlBdTAlmsXhUDYSgNiRvFbafZdnPdCui",
		@"dILmIgsUzLjsUhQwE": @"gJtLkQrljfmCHXSLifpUBFCbyiGAodDMoPGAFlkXCjJHHLGlEkovQlQUeuZrmyDrNskhKZchvNRrlMBaiUCXPMEZscfwzBfQHTPxZtfohRVnQnvZHzxIWCUysYAwpEFxxElrtclYxQiCLgwUU",
		@"AXHMgzrWAxEg": @"HqGbErIlkOaEnRFpUiDtRlIqSASMyWUfyzXdnqlUFBFHFfFComCICikxQhFDKdtbvirvEAKJqzTMBPpdsUPkVcFOlRzTvhFJYmDbOsUGS",
		@"GjPrIjKiVrLm": @"vDzIIuaaxpzTXPpIzLvYCupmwDgzAimQFCvDHbbexXXNrplmbFSYsEPVZGwgroQSrtoyQMePGkDHSosoJUmlxZiUlynATHzsUwTRjVlFBlXQXokUDqDFqvYGtiKTQmjeGSN",
		@"pPuATouTlecLFiEPeDc": @"WJWdECudommayZEZdJrLSkWiFhoRGPGkdvKvmfUIizlWNxJhfvoJPKccaXDHpakCUkbSDHBxSpGDJHwCzjIMyupFOMtLkqfgNmYMfQoNxl",
		@"kePMursNXNAoZypQ": @"wrDxzicTtBUBYSRTGnbGUbhLSSobUlxZRLPGfUrMhGRvteQVFFlgbBrEEuSIEWhrMAYkiurpjWmNgxOZWArcpkplMSUOJrYGqmAljIYvgXaUnmZC",
		@"GXTTmvBSuKAeVImq": @"OGXdXJSZZwCieEzAvVZufLHWMMLVuRenjiirClrqLbqgROnsiVEoCPHLPlyHTEeHohghZxMAMuUsiepSDtjHdtYFYlnBWsgfrtVLKRAHUMywu",
		@"HQFJcgiAZnZCISQwL": @"GgRziecpKTZDJuCZZgZoXtCbRlAMoaotLOurmvurCedoAojZpVQVLHJcADbOYLcxpoXMdVYhWRYPlMiFdTWUjkSzFitJHoWQoDOoVPiCnDSQGStxtcdJIQFKDQPvVkQEwgsddAJoZUgxROIPHDDY",
		@"tkBJdBcrLlsolZ": @"IwYPBtzFfeVrBKbugOcBFQTeDvWnJbpZKqCHiTUMDPWEhlfUbeumvVkSrXLFiFoAHMERhqdbgHYugXbgWiQwhxtIzhhZLGoasnoLZnfHchJPsTmzGMYUTMuPdAeMRrwMjiQanpkNWHtnbzRWGv",
		@"taFAjfxCyaWeLMW": @"RPtMfJZMUCwJokpbOsdtksGliEgesXcGBVoCzXBwKzgZmaMeZsapJRnEsjyuQiUsQdIVjnyxbXTUedRzaXRCcUdiuITjlaTgtwkMeqBYQpfPSWYgreAuvTvyZcpqFcgyFTKBMwulJBspMjjf",
		@"CsHooiCeZorzhW": @"CAcdFdgMADdbdtAJTzvVFeGHMdnuPFXGXptLeCbrYiXmAIFWjOwcJklZaMnAZozJuCFbIWMTShRFTDjrOPlUgtZyoOXAwMFcafzelsLKDrvoGh",
	};
	return xESDNYYVkYuXUaXDKC;
}

+ (nonnull NSDictionary *)iGmSqNUOzTsY :(nonnull NSString *)fyXIHvTrsS :(nonnull NSDictionary *)hdYIxPiqkU {
	NSDictionary *upTGWWwisAUSnmZGoi = @{
		@"WmxxzDwmJZsKbI": @"iCZurWwwzWiSuAcpErBgMiPCbzAFnQNrpKtZBmOLfCtIHDrsdkyAaIWrTZTLCCfzFOIZsfWPAzotyphrkhvvKfQdzUngloMMwkJgUbNbVMjahOVxzSZvtHlDebYNDPRyKx",
		@"SazxsZnreCAR": @"dUldNlsWNjwJSsddgjtzCKpEzYaYBuFdkzNbfTtjvDpdkNpfPrGKqaKFcoFjISUkmczTxCuXvIrQpCeSWbQLgtMCkOJSbiIzSpBQutakYYsdt",
		@"rTkaxYfzIuyhsQb": @"jSwVnjuYSpCQuKOUYTkNIHnlvSZlvbGATEGlJMxDrolqEZBdqlwhZueScDDbuHmzHzvIqkmNGlFCgBiLuauODwmEFJGwCqXIRdNSdJdX",
		@"hmscsCakeiEtPusCHA": @"FxmdWxDKCMfbUPnQFOmazYZmNWAKLDsuAoyIwBtTEyESAMwgaMvnFSYOnzOYUFVNlYPsDvxfdnqvFwlKZmKssxEyGHDmfasesyVzUDSThgyEbyolylqbETbmuKMnffRIV",
		@"ggniUUSImKYMtF": @"OdPvehUGxLzYhLImgAmtuTUVimcLkeEcVfARAKfAbFrwmxRfebSUskthXCnpLjkHpbPvPvWmfYpMwIhajtzdBwgvxNfpWfVdSAMvMsOfERwLfWItfHmwpoonwmCMv",
		@"xZLWXERgZNypaWCM": @"PBkirEsJALEYRFnoszWfCQOdQOIzpflDNWgDrPYUqeMdqSSdKitPLgmReGmtbNBWLsHFUJDcFMzgmbQSnbcSKsBnUJQLfsqfwnmjhQemPJZkwhaGvUtCgUeoZlQTzQxVDOmmErkwOjzHiYgXqcrnr",
		@"GRMyztYnFjtMgL": @"aftpFZmKZlMJMEnKiGWXsBoNQRFbRFXrTAIFwhGnEXvKuPqYwjVeAoyfmuodbacjIzxnVfPMHYJJkLniSVHBEvCyGoNYXVmnTsaqecQhmgloLzIrWBjdAkXZuh",
		@"IRfIOSOKJOLEzlmzx": @"HbxlGOqkFqxynvLzCOmszXYdIlObpoZevCFXqYymTsVtDbVERyCllEXVRTmwlJEWFaGVTcSJXQCoaJKdNOfxhBChIqsCtpLZHyEFnUiyeuLIGxWlaDcCTeGLlCdogAPLLvCPWeFpDLfJrqBx",
		@"tbjOlZXfpEi": @"zuiOzKGKolptdiISepwjRipjPlGbpzFyekMqFoDsXQfvjPzCHusZITUWoKagFsflUIYAKNuqJrIdDYDRbmQfpHRzlxeRbruxBKYyigK",
		@"XzraFUWemzQvPG": @"iepDUypjbFalcIapZGYlofnKLHFkZjWTatHxSrCmUWNxcKcyNUZVDoXWtHXYhjuZnVMSWRowbLRzLBUyZflPdnPbFHCeRDyLOeBtTPFhftQSkNEHuboXYXOWt",
		@"ivQyfYNrwZUjxHQsA": @"PSXKodNSyCMSYUyoIfxxvMvUuHaUTVatIUYrJgXSmgmVKRecizQqtKGXyrMVwSZTZJFlQvybLrtTlwTeiBcWgBFxwIphuWPsoOolovCcaYQJXSWJNFBLTeXNZWApoYsog",
		@"VWfsWxOrnfCSjfdPGTM": @"oAhVfPAtuTxbINljQMjZrpxJoFooxoDZPXSsCLWiSnAFlIgoPVAFVScjYohKoxQosWxqbDtXRkWefwKbtLsNpFZcyQEOwwTxoXLaRmPQjuqVnoYsCwnKQjJdhamioTPLQTFlPRQkg",
		@"asJVFqmKMqMlRXQ": @"SBLZbrFdwFNKMUPJRlVpAujHguBrMreOcSvqPQXWuRsXqHozhPWYCvSRRWOfzBqqCpKwGFnpNxWIFxdusueRvGnFObEIfDxNUBSSOjjxxmztnISgXPlmjCEhchDLdSyi",
		@"MDodgLwOYggSzHPJNQd": @"DdibjAIOvzKMIkDcXCPUJoYvXKMQeYQQCJPJVlTGCXRobAzFQoXMbhzDilFTBLVLPNluNzTdOuBetaUoTmUBDZMFRSdVKmMkoOLohceNvcrcZUHfyXYnYESSXvbfoYRjwml",
		@"cxzqJlRephiXs": @"uFLgJuhWpxIsEFvsBtdbgOKBkuFqxCqYOvKTBbyAvMjhIVeXcIOojJEvGNtnOEzrpWIKLnPZoQppIZsRehaXFXiqmbReFRXscvkzhHneSvgwUCKubJBvzURsqBMAHiPtzGEobTXxEKq",
		@"rADYQfQKfurYDCjJ": @"zzLPDbwVACqZhNCHcmNNhiifNNBiLYNtyyUrWaSNBMEOSBzhRzHGoEYZHSFLCYUNaGzHGkNZvzlbDRKfYSPCGpMNKlKavqZzzDqFrvhWJRgJKWJOIzsrVfITOAqJbbOEznAoeTE",
	};
	return upTGWWwisAUSnmZGoi;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backView.frame = CGRectMake(0, 0, self.contentView.width, 70);
    
    self.headerView.frame = CGRectMake(15, 15, 36, 36);
    self.headerView.layer.cornerRadius = 18;
    self.headerView.layer.masksToBounds = YES;
    
    CGFloat labelW = CGRectGetMaxX(self.headerView.frame) + mainSpacing;
    self.titleLabel.frame = CGRectMake(labelW, self.headerView.y, self.backView.width - labelW, 30);
    
    self.contentLabel.frame = CGRectMake(self.titleLabel.x, 0, 0, self.backView.height * 0.4);
    
    CGFloat timeW = 100;
    self.timeLabel.frame = CGRectMake(self.backView.width - timeW - mainSpacing, 0, timeW, self.contentLabel.height);
    self.timeLabel.centerY = self.contentLabel.centerY;
    
    [self.titleLabel sizeToFit];
    [self.contentLabel sizeToFit];
    [self.timeLabel sizeToFit];
    
    self.contentLabel.y = CGRectGetMaxY(self.titleLabel.frame) + mainSpacing - 2;
    self.timeLabel.centerY = self.contentLabel.centerY;
    
    self.contentLabel.width = self.timeLabel.x - labelW;
    
    self.examineButton.frame = CGRectMake(self.contentLabel.x, CGRectGetMaxY(self.contentLabel.frame) + mainSpacing, 50, 20);
    
}

- (void)setModel:(MessageModel *)model
{
    _model = model;
    
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:model.headpic] placeholderImage:[UIImage imageNamed:@"headerNormal"]];
    
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.info;
    self.timeLabel.text = model.indate;
}

@end
