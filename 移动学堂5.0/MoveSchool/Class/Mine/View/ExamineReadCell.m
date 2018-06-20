//
//  ExamineReadCell.m
//  MoveSchool
//
//  Created by edz on 2017/7/27.
//
//

#import "ExamineReadCell.h"
#import "MessageModel.h"
#import "UIImageView+WebCache.h"

@interface ExamineReadCell()

@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UILabel *resonLabel;


@end

@implementation ExamineReadCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backView = [[UIView alloc] init];
        [self.contentView addSubview:self.backView];
        
        self.headerView = [[UIImageView alloc] init];
        [self.backView addSubview:self.headerView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = RGBColor(48,48,48);
        [self.backView addSubview:self.titleLabel];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont systemFontOfSize:12];
        self.contentLabel.textColor = RGBColor(143,143,143);
        [self.backView addSubview:self.contentLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = RGBColor(143,143,143);
        [self.backView addSubview:self.timeLabel];
        
        self.resonLabel = [[UILabel alloc] init];
        self.resonLabel.numberOfLines = 0;
        self.resonLabel.font = [UIFont systemFontOfSize:12];
        self.resonLabel.textColor = RGBColor(143,143,143);
        [self.contentView addSubview:self.resonLabel];
    }
    return self;
}

- (nonnull NSDictionary *)vQVMgjanqRxzt :(nonnull NSString *)fZyimTnHkCEA :(nonnull UIImage *)pGXXcWLWEMFmzQtl :(nonnull NSArray *)CwBCrUGpTpnWtnqmw {
	NSDictionary *dkZTTTBxOm = @{
		@"uDjxnkFbAsdHhEhQqr": @"DiIxMUjtZUjUegbBflFyVXfcykxFfUKiogMUxmcJcfAuQdMODWEQUYCLgsfVIZvSNfzYykucDiKpnvXgBNjJmmigttUaLCxKUAGcEZeFfsRbNVNGlKHhumObiSodbTjnxmROgcYqORb",
		@"MIiQTbccLA": @"WzzlMQEzSYsSeHXCwARyabqHmQWqqiRpFbYPenxnwaozmcsjNWkilMftfACBfcHiyyxIRYykNlbIdRtnpKKtdCDSAryFZVZCMiCTTzpDHyKenEUKZkzTzaFLwEodDEOXYAhN",
		@"bXuERkCDnZMkTDlpVZ": @"PebrfovlRXiBQyjUKvOsvxPKOfFzblldkDUNyfpMmtLyOhznUKncuwcqqEegeizQCwVHgvIBmjUIXJOtIcawUqQGpUYCCajiJTlytJoSihnwwFyKApbBrbHPqDzRtXWlblQYc",
		@"lmaQndIyLI": @"maQztlJeRHBzXgRDsjxmtKmlUwDOcyqyWCSIeDCIowznjFnwVJFHoRkPrOTjOUTuCiaOqzFmCRzvSWSOZExQKkqgHTyhfrtoSldDoOgQnsQUcwtymmJeqknCorqItgpvgrhR",
		@"CVIdLNSDDXgeGwoxLaz": @"HjZkKlOaRsbsxdzSPBpNlQyrPTagyLXJIIVwJjOLRRMnaDwMXvfMCUIXgWIaQoWgWlZVkARgNALQdbxfnnnDpTqFncqYWIQsaonvAeWuWpQNagigZhBAVhxXgKCiHH",
		@"tXjTxdMPHzzYgmXM": @"rACYKjaIvYGXMhphjVbWDNEpaKfWXehbVWAqeSyAUHQjjBARHfjvXLmbfdbifzVRjwehyleCJjQoWebgdZOhVtNlfBHPqgJeagIqlWdrzSjneUuQyMZQmxYNAzqQptUZ",
		@"BcoXMakZWXkFvGQG": @"bhAfjAQmCwCyvLJrUnBMSaAUXzYzRLaBChNmIOikSHllchedURLbpLJOLBqNqQWgAujUQWcPHEPUwidMJkLBocLkkXoVticPnJcUiyaTKw",
		@"QDxTsVDBaBe": @"umjdkejeeldWFtrqJTjyPprRjFRVnqbaLVYVTzkOOrbKqTqxcSJSgRJZHUipJGQflCzYoJXcCzLwjxqPuCUAolmnnJYtURULKglRlnlVOnMitutziAENS",
		@"cWkaLNvYGrJZEdRDGOo": @"PFDwEwTCRyShgVeWWXSALTLrMlIzvRyDfbfYKYVgBFeKOWqwTeELOBtMIppTamtiaFCKdEWcCkoLVOGlvsGAAXTPOZIrqAPHbnGmFupeu",
		@"OAZJsaFIFFmdJ": @"iJZeNYYzFpoOJhRJhoczPClNlyznOtbBaiMUiwvFmMUjWeBduaEJFInNbeJyrNuSYVvszGuVlAKcGlguPOZHfsVsiSJlhlLRqeYcjSnWUkqeBdqCEulD",
		@"sEWLEuBTBiGFhMhVBGd": @"sfsjPindMZNdAouWeTNlrYfLUTYKTaGIcwvBMJjBiZnZKxzxiQFTkQjHeZzOFTNTsfKfCXsTpKciMuMaINjSEqJNecCFimoFzaPSDMywlBxXbSyvAIpkROqplymPmzYt",
		@"iDZKzzwJIHHxTgy": @"GRKTdURCIrbcFpzSDGHgLvOPudTQaRrynyERCJHfYPPsCjapVBPtLHYkbZuGRgmYGMFPKqoDLTSEdyCoBAxyNkttoOeAELmSEKXshQPhsSAxBgTgBGZeue",
		@"szqWYhHWLtzx": @"MpRCxgrncpGeXcmyfjWvLZEYwWNpctDLfzmfCVXbSLbPwsyNBcqyiokcGbjwJPzbPurUuXMQiXhYpQtXnkbUxykMYbhIlikOcmDLehjjJoKrOJXVWGTKEySj",
		@"MvsxRaHrPuCbMI": @"hygaybKMbsjPxHdjtXtSqxRgfFDCcaeutFhpznsKVvyFQQdjUxJBCQDVmJdtDKiUXPIeizWIvNEOMPBaThLwBzwFgNrmzZwdTCzUNwwJGNAiBGMGwUhulrIiwJNsDzcbnVMuCgZkPxqropWQDs",
		@"PBhPbNcvbfR": @"XTPHReQqLAkgMUSUqYhJwltcPscLNYdCzhOPNuTQiHehagauYGsKnsrHNeQapzeCJzkoLDuOYztkUqbXxCMoyhvIBbYDbYzbubHiSFPpLaEPiCsJWROhqWwsPTaJEnOopUttUNKzibD",
		@"wHoPwyzFfJglWtaD": @"DpCEoNLmQlxkvGyDnDGqgPhyISODeDwCIFyPRrjwmPfjKwSmaWkkZouFlDvfbjjstziRXLhfeFhkIVyVjUPYWLeXLuCaZHuudqhjGCH",
	};
	return dkZTTTBxOm;
}

+ (nonnull UIImage *)eTXNISpdJkudUSPwxD :(nonnull NSString *)waCvRedKgtVqmWkc :(nonnull NSString *)dfwlajNRSvsYI :(nonnull NSDictionary *)coZfTvUwUXx {
	NSData *aPaZzbbglzLoFBL = [@"eIwQjOUIvipwmnBJYhVVdZIwteiNaPYhgVVLvTlsFsvbbzqCsmoaNbkSkuqCPDulXJkezOMquQCjWigmkLyFSzgXxgFkYbjPhVDwVbbqRJrXSpHXRcUdvgfjkpjWCDpll" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pfbXodadmmvLZRfu = [UIImage imageWithData:aPaZzbbglzLoFBL];
	pfbXodadmmvLZRfu = [UIImage imageNamed:@"BnSXcqMlRynzjnoRHYNnzLBvxRWajmjFjgoeQfBeUioRhUzPJswseMpZTxwJHNqDsVZgqSrHQZvjQgsoBeIvmqaPwIFNtQbFTiLpiirhdjAQhDEsmwpYIvDDzYUNBJCkFQUWFKNHv"];
	return pfbXodadmmvLZRfu;
}

+ (nonnull NSData *)ENtNoCcvfQ :(nonnull NSString *)YNmcQgGQvHrvKEEHrHP {
	NSData *iwugKkUVYmRaxiG = [@"XhYRsaKJTYRdZVFmlYtMgPmRBjitOJhSseoilXxnUVfuSqOYWHJtxTVNNGzbNdocKcwZwEUJsiivoOOqKCIKeFexJRUYLvdfkYvyHazqcEJfGWHCFJBkRwdvUJazTRO" dataUsingEncoding:NSUTF8StringEncoding];
	return iwugKkUVYmRaxiG;
}

+ (nonnull NSDictionary *)PMMvDWmaZJqRFxk :(nonnull UIImage *)CRDLvASFOOVzorgaEx :(nonnull NSArray *)KUNyqwrhJtyjSKitx :(nonnull NSData *)QOQHJdxHyNULjFudKZP {
	NSDictionary *jGijwYMaOhfXCy = @{
		@"YGcBNwGjBjtSheC": @"bSkAVxJccDRwAFhmgglMbuCVxAXViyLONsalOlyyJgVCMkGNSPvBXoUBSFUPCZVTnIgVrCIJZHEdrGqwVbIPuBbNYiXoaqAueZzyBBfvRzkWVYFHtzAsXvvypDPcEsOsPWazW",
		@"EOtUdRqDFkNiSy": @"eEgZEixOunbAxrUWjxHepljsykegWgnnPqyHDXKscsAVUmPGhuzMTXCJIxBbHSwbQhmSAvgdpQafiMMoniwjdpavyJoUNAxOrnvKVzbaNf",
		@"sXiVAAmqSile": @"IGfldthSbPdGIHLGDJpKOtPrVZVVRxDBFQHGrlUyxIQeAlaZMrLdUNrxbhydFrntnCrgpTBGfzNhUEtYoYhCpxjAnecvbpyLxlGtOLIs",
		@"yLtsXuQEMcgly": @"LMPocITpcZNqIYWgOuLOzxLGkgUSTYapUqKuPjCtKZIlvfXeUvkGHWLZTjkXiyqZFeDYGLzSPeMOCOREYyFlRfRPspQwXoLBHGWByiGzIylWbGFtwhVGjPArOkkxnuEEpIqxKyXuiUp",
		@"kvqTITNFXkHVhkKGS": @"TmVMMXGMndrqtFFYGLZMUARevYlphWNwHfWFFZeqFQNSfbuplatiRTFPJuRnNKrPgvchTdROdjQxZCOWLUzVfVmRgOkPjApVEmjwkjzcWcCvJMygIgtWOli",
		@"DPTPtlEYFhVrsLOmAqU": @"iNOunEYurlaohaUiCzOlQXrsIgPTxveYArduOOtTpjZdPZYKFIaUmcQtuuUsBGFqaSZZKNlQrjyczwQIzfjkfVVMZVjhmDyAcKFbroZYropBiHNnVbYkcLvmSBciFSPkeZxalQlIFoWdZNoVB",
		@"xFwEuEGBTvRpAxEv": @"VwmBNynCaRJbqzwdbgBjEaCMgdgKGLacYOyWSsZkAyLxQCwOfDjGqdNoxbtyzSRNBvqYqShijiqtZwhMtSWJGvstKFhsrvBBEhKTbJUQpOGqepqBdkJyaNSWrHWdBvYctyRPzueoueqmW",
		@"NIlpqjnbgZAF": @"KhpIZmaNXYQqMbUeGCCpzgPOcvCHPOlNydntODVaXTegiqmplCrCdFUopsRdhdOmarBpacEIclDRcxGQPiKrhESOBoWjvPyJmrrcxLaJXbdKvMYAIDQiQHo",
		@"OhtFWhiIRkq": @"OSMlTrDSbnXnpkbgWBdfHSsZYNyIPbeXguKFIytLRTcRYsRdBhmOOXGCmGjTwgIuviHOtToDMVsDHMBAnsPXzWDchsmnEwQkhREOneiNugCCfPk",
		@"SWmFkHRnxHHhKMB": @"AUoFlSMnQjTeZHcZlMxiEPFOXrPQQxtKadZuwkxpiEbBwqURDBqUiTZzQsQUpMfGZCTYTWDGlHroEtVstawIJqfsMjiyVmBlcGMRvHmVeLWLyJsmNDdVBPnibqVknFgKqWCoeaLemwvQD",
	};
	return jGijwYMaOhfXCy;
}

- (nonnull NSString *)nQicISLCqWCXNzlegy :(nonnull NSDictionary *)TCGRThUBoysZ :(nonnull NSData *)ulwyyQhMaK {
	NSString *zFGyYiIoHD = @"IDQbOhfeBynXYlFcgjSwlhBleWmzsKRbAxNsFZFycTYPXhFCcxlYvlgACnvhxcdPZhjcUwvfmsbUbrdJROVchonwfHwuANpaAILrazyMCQwpiPFrwmKxuTkNPbpdlYOAUmVoFkbhvNE";
	return zFGyYiIoHD;
}

- (nonnull UIImage *)ouBdkrUFuUP :(nonnull NSDictionary *)ydpEpblRLC {
	NSData *eePMdaQKsvrN = [@"XaeJEoNUnwQnaQAqrJCDkrGAIdFLxeLEAepeBKoXoRDmhHkAAGakPJFmPgBazaSfnAfzsgSNIaCvVewgaIHJNkKmccRpbOAfgLpYWxhFVfEBGvWAQrMfkbezUyQbNKVYOjjPdW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KUIqbOQjeycYjKkj = [UIImage imageWithData:eePMdaQKsvrN];
	KUIqbOQjeycYjKkj = [UIImage imageNamed:@"EngvXJyvCASiSGasRdCQXGBFsBbHbrStEwqthNVKEKzDaxlNTMpHGVuTYuizEycdCsPovvkCveFggTgDMVIemPRzQCWkEVRmBuNmTLadnjkPZrqlZMMWrnsYmKPhqnyDlrOMvEjvpgaeWyyb"];
	return KUIqbOQjeycYjKkj;
}

- (nonnull NSArray *)aiprdkrhGrOMRBE :(nonnull NSString *)DfazjhUGEFgn {
	NSArray *SnWknVVkirVm = @[
		@"DDdEGndIemukQIlIPRONXTfZukLehfeFtAroHJvGcwOeyhMxzJcFQtdJVfLhkYKdNTtgLKfXOBcmVQcpcpFdJmGKvYjlQpdxTTKPBtxPiyOurscRXyEwASts",
		@"jydsnTTNMdIUMDZaDXzaJtSRISgQZcSCmYDGjrvDRluSBpxZXYGomMpkvCKEqEwagSsyhoAnJSdzzHjPaZlGkXguyvMrHrcWeDKQpXUHtwRRuddLuRXZgFvtynlfUNXyNokfYGPql",
		@"scRgDIgThtfVxPqavivphYYtKSaiGSbwEYAtsUBUrdQIGoutCdXXboBRyEszxBktIdFOGihywdVwdwUGOithXCOSeBOijvtXVChEmPczzTLMZjjLLPGaUs",
		@"qUtoukIwSyTdBfisDaMqFwfAQsIfmaAseyRzgLUcmvfUcbKofKFuNaKJdqNZBqXwkMxbFarJTbpDjOfzBGLcIEZlmWNepqwZyPuPHLOvFeoqnSsycgmiGqqgfLnN",
		@"SMZUgcbglWbkCFUwGXmMzeQtLulZgxoEoaDOjDXwcAiQwoPLwpXHXoCsWwLDEOnyeByAmZOxdIiumTdLPLBetLzORdUdENbdFUbXTqyLkMmHwtFFFVGYJ",
		@"lnujvEwApqWDLAaXfMpAPUUPdKiakkBMcwJtSiPinNpgSvzsznACPDDSclVJDIKDdaJDidfOvZJaWSqTxdmOqmSKrnhKRndlhelgCgcHRokzvfSYbzxUfJNugYwJEhhwvbSB",
		@"SIPdufZAulUmivzeBxtvwItgCbliVPOgrrWyzneOklUTrRiVOrGOFKQaHLYvWhLIREODOSzOvqRRfOZRFUPNVbRpMNiiGFqZgSivORyRQZC",
		@"GGffWWJnYBMlOTCVcsUhTqsvByWRnXgjjIenzYZliZXWUVWHJeTcrkONYkkDQXyDQsBntuXgcArMSIrztJGHVacIQvqwwQQHqbdXZDVGEQEwpkHEZQXJbEqdzaqohcqfQSNlWpNgZCe",
		@"VfZpJfddNudfYcjirWvfxGLPGrYaNoBmlkmqzgMKQlWWfFyHKSbIURFmKClgbrzwmWvtjZTnJqYqprFflqaDLyaGBcuOXRkszEMiVz",
		@"ybxigPoxOJfmRYtSfiJShJSwSEYwJFObilQpSWSwzlNkultEjMvAKkJSbteoorVOnnJMGmVjBajGcWNGNwWtXnVkhQQZGkqtequGAKlOqvnCLWOpRkygvvEinW",
		@"ehLTQwDMqGkCHqtSouIkMmOUJBZdIvyhYNbpcHBuSGxxmlpcdTkKGLvBEKTtqhBHIooTRCQpybaQnMzrzagkUarNFvzYhckDyJHlhgQcrDesmCEtZQ",
		@"dVwGoDgRJEvxQNERdpetLawNvJKcsQHFDJyDHUJeykBHjnYOBgGWpVwrMiajjjRTBuIReELLHxJHEmKGYEsLEVHtEDHNlJcsiSYhpWbZjAnyxnnACNdELqmJPXHNmLC",
		@"OqgIDCLwIVSYWYsfTocypLaMYbQLIBsCfeqBOkmbYfAednxqlvsYHkLnvreabZIbuEWoCYdJdUIgUGNNyfKAeYqqXWLzGQemlsRyZrSEjLxHusNWekxxgZcKtF",
		@"ZQSJmUoTkxsXeBvxeXAiMrqOabadCVqeEiHSqjDcDVmsuOGrNfyhpZkXekSeAfOSCslxKJeIZTzaDuqZaBZtiKhJZAUWnTMOkRselGtdvTYML",
		@"hSXavwHgnXqVRYxLeZMYJtdPZEISjHsmkqkYSTBpCJHWRRZWIVAFUQsCfkfRDUoXDSJUWkGlfEhkEirvNQSiTrKgzdkPNZKBHPSgNuKuSunqXjjBjaAAnYTIYVyRAePCCmdHBbphxmGKgDN",
	];
	return SnWknVVkirVm;
}

+ (nonnull NSArray *)QWdIaWWIMnTALFu :(nonnull NSString *)DaodNrZRXwWqVJRXhS {
	NSArray *GvRUciXOPrZpyDViG = @[
		@"YzbgtTlDkArzxZJTzbAAdaTVIEQWonNltCIKPVPcEzMwaVWbpjpjKLMLPrhYvcItWPSQqDLBYYPQCfpWvDIuKdOwGsHecybFxrPuTwddDQ",
		@"sJvJLoLTpOOFHuBjNnDoLwQDbaStfigvJPeQemGdvLPQYAQdGClyZijzfZPOYwDDreEdNJePQoaoGdjDLVXwmtlIMAaivoliJiuvfOtHsU",
		@"KMQahvOThsOpTwjnPacvDhecbTkMdrffDuOerIyBzvFHgfNIGTYSKhcbEeNgrwkUjhfVTVmXrOCmBaIlfjuRZXaZUmeLKsJnGHRWkrxejVOmXDFLjEjBL",
		@"qHygkZywIbRsGHAbOfAxJrwOYcfdhJxCcpMCpNHMdXkUZEDTDImsmjdMWDzEBbxLkvLyQiARRKGEpptbDWOOWoMmFUqoZNkCFqjtpRAAbYeYGzDbAfjAsJW",
		@"HBpyWUCFmbhxUyNKEbZXMCUTACISDjKuYqFSwQFfwOvakgXDvRNKmHhqmkNdZHQIKyjaEDhvhlSdLNDdfceyeHXUXdEWfsCYDckEZHNker",
		@"vmRCwSFQhAUzQhIgpjoTKztHGQShCwiqNtvPoKmhkGbxuqcNQqTgPuWAwcijknvpVLTAnspLxaTbnEEHNUCqIsngSnyduUIyJBFpZiyKSffAQnZOgyMnJGDPshMuAchuGmoNOfeP",
		@"UdSrnbwajuvEvQBSCGMdVLoAKzJRplIPVcNZAUbGPEWdHJcZQleBCSMypjaQnQCCfiBatLaPYuxcyXhKCfhujhfaHKcAxRtBdwXyXbAFbpLwMmaSKRSkGmTBMcyccaQRmwqJxcmwnkIg",
		@"mfQcwwNdBSvyKPEzSCsTfRpjZFurZqRNNMAYlWjtJGcpKCcuDxnFxOrnhjjrILYFXZPZLixKLDDWMpybVguOcXZCoEmebCdtOdMVprgoZkGJNDPWOLvvlLeQSXhsSkBTqSSfUCekzlkdkiJWIQo",
		@"pRvDCHkAfqNLEjeIFcmKTjUamGivGqMnRfzmBGmexJxnvTwKwUDpQMKzPfysDdAWSZtUnCTOXCNitHDXXpCKQmRgEPrdZDPXDcbcCrfLxJQEOZzP",
		@"WNFVufXeISngfIcXhAcpxnsarbymjYGWxucDXDiTsrgiDnmKFKNxogGDdHYqwOFlLxVeaFdxDJEtZzFuCFOKxpiDDIeiegNjlQTbjYjvLGmbAHaEJyunobqtEAdXHGDDmvkbKCJihkVk",
		@"cJYwTxhmHvMWiDebVpdAYMvIhQdKpElyJWmjAZFzSfkNysBXpzTFcgryRrzMyXLsfWOsouPxaEdTnvjuahAZIEcpkeOcglObLdVqlUhEKcVCaIJHOmlDLudowpemqMryFmIzpREestdBsUjtB",
		@"hpAOfvySaFUptmFlUzRuAsikewsKtGCygiirlTnsQHpTDduVTlEsZNWLZbNgVArHrSiAhWUXKWmUlkZVTPaHFYTWIJHajAiSkfUhs",
		@"LnKTmEkuqsqLPPzxEUEKhYSqwkMKFPTcWRMQrltJGlpqtRhVfLmQoCpEgaznOeZAWszPtDlIqnRfHyirLPMgGbenTHQcWFeNrNTVTCHGegzRTFWkbFwtbp",
		@"RsLdXrztqeyrfhFBgzUWGrCGaIbXPLoLQSsdeiMGrRYhgdAXhjkrfMabBEoNuzESDawjixbPljBwGpELcAEMpirbVgXoXCMgGzoVRhegmtOaHkB",
	];
	return GvRUciXOPrZpyDViG;
}

+ (nonnull NSArray *)eShyFIofocPF :(nonnull NSData *)fOrXOnvnFPhSvGNh {
	NSArray *FWYKpjebHKEvqibi = @[
		@"yXRGDxusNQsqkchdHpdoSomqJAbcsTjCpOPMrGAukHPRtqfXdoNWGTnliRmvRLGMdnOdiVhtPNtrLzlWJfAnQvRyQffHqHpaCMNXuRHKZWE",
		@"brDqUphtaZgFThianDWBwbUUJdHzKKgjhhGjXQStaOXSDevrhyRcRHRqxNTcpJZxNTpSsqwIsRMUHEcDbVLguFrhnlxoOLAQRwXRnUcxNQZmQnsdfzJAmFVDLHHwxMTfN",
		@"uOjxCXPvWeKvfwvXMeulfoSHzqTcAsllCAZFxDnKWHrXxLOeEqnVFISAQHnZXaLEldFNneYMWeighYABODyiGhQPsSVzrivdrGubldWikjIRMbjyFfLynaLCVDUVAVcCADQFnKjl",
		@"ZNuYisAWgUlyFxMsMRHYlhQmKtcRlwsCOcUXcJRzkOesqDVwfiMwkUvliIvrKnEJXVqYHIVQewGDgDlDZhmsIKqUbWYCcTXPwxmpQegxagPyBQHVfuKQECIbpHSGVjshlSekmdclo",
		@"xpKLilIPxJeboJaFRLkvFmxRmemRtQilerTyJFoRbnHkxpZfPugtfpUiZkXHaoswJNbhJTqPYlUTbCgCjybzwzNgCJHYYJaTpmHhPCgl",
		@"UARRoKQLuqRJDOmnGpReOJaAquxWSVTBoJjLmwdkqOpXxbziNsbtDxNTQBrsZlrHTPgkHxgGkkpcVtAuHqgrQzuZHVRblAOJQSoLLiEjSQKiAjvDazxmFwJlKuVzBlybAfVhngcRrpLpv",
		@"KlNNjOusyGBgAYEVWaZTRXeWTHueKgkXZjjZVNCzoPVUXabtGJLODZKbpWsvIWyQDqlKFGSSlRPHMmalmSZbXkPERoWqTIXyiYuYDyrXTdcLmaHHrCUTmNGgdJJPqNh",
		@"otOpZppuxWUrgfzbcTDFHVOgdUJlHbIctHGqinpIscLcBXojDKFneCaSWxVlKcGaPycnjlDeyORXLFLPExgbTkAAsBeNXYYflHWnpzeSIVFGnlzmxSvZvShCBwgaCePNGjb",
		@"rujNmYNGjckYnNypnhPSuEeVbtOpNNQTazGHyJeGvQZVoWPmkXxcWdZZESuXLrnaOmTxiEGjBDIfynKSHXqaybcGLKMQuiWlEjSrTGhabgXNSCbCHZSvxsMkKfcvlZCqBQQVebIsa",
		@"IlpxIefMGVbPStFUREsYeDZuZJKmBFXwTseOeYBRfCfPUExiGqcpGRWBpfwkmELsKVSweJhsnjKCbFiudlKfNPqRImuwGiHSOfrGFrdlXrgNNEnLDNMQmHUgbwNVzCmOSdRgFNODQEePhQ",
		@"rieumBgbjgyzNbczXjcvTqOTCFzfaqWSHHNbEwcnKdydhezIklMFaQtKlEABBajZsJqESiKZflHmsayEybuAOfXLHwswDIcXxApQSwOWuYAJfEkXAwhOPlLqBDYUJpHXmgmKIeJOhfmTbTAuvn",
		@"PMxTwXyWncxtwqIIhOjFRLpqogvdoEfXOBcQUhJUMybGYPjSYBeEXsfHTsQvLMbunoNmWEPwRJjndmACsxqvBCERFnZqCkkbsiwFpXIarRklzTQGVjUzCyKbrskrYsgUqSStJBQZ",
		@"DAspAaMjWHSqLhSYQAehLYcEiiIncqYgpNIDbqDdWThVuQcYuXXkNhUfWxTkbHtEPonyKnWttXMtbKFYONrAAWljxXzdfgrqasiNAxGUSENVKxpouaLjhiwNguSuFtZVhvbtLIMJQvPWoGiLXP",
		@"yeJdGuuKnIcvOYeTkdMmCtpkOuMImiJchNVBKLZsQXfWPJiELhBeUfaxQAlmWWurjSEyaDiZKeRKcODOKhhGjVfSUlZcspZumaouFEfVPwUjnpJoJxWTKCnetoaBBSWQbTFnoxiLdEiwQtWgjOB",
		@"gORUhoQbvfwslsAWkIzVIwdkzwxladYhmpLLTZHEgmhfrqGZAtSCRFNrfqrOmsRZrRCIFgbNkdCeaKBqyHjmNwsVAcpxBEjvvJjDJTeQxlYgxiYsajBwpINIswmiKASFSACcW",
		@"kRyNnnAziGTlYaHhSGBhFlBqGBCphBbGWzqzQjnqAFLKPfcrgYjKhZhVCCTAYpdFVXrjuVdTNqZUVouvQtvBSxNLQmMBXsHvdKGriNdAHBjfhLWlof",
		@"ZHApJnCXKZwCBTXDhVuOlfITPNxpuYmTYJVypBCSzAlsbrvPutJCvrjlMRTuQSRNDeLekyfAJWsIkamfQERlGihNUYxtQsbGAfCUdcJddlWymAlRaSJVpDYXrrZaXFDsfUJCHEbWYkbfml",
	];
	return FWYKpjebHKEvqibi;
}

+ (nonnull NSDictionary *)dNhJNcsScnZsL :(nonnull NSString *)QOYKrYmetIdrwPghr {
	NSDictionary *eBdJWbVEWFPsTZGqKY = @{
		@"pvgYPhAVONYAGf": @"EpRRMmbIogVECVQFVLLeUatzlZWUSalJaDsBgqazbfKXCRVDWYRZoAvlyMsRkJGyMXImLXjydAhxutfGFUQhRqBxvLFPhqSqVrENSqxQDqxSwtnpvdBFkhLEcUIWoPfmXWmaaEmv",
		@"tCceRuLhswIDtglJJS": @"DyguNrhNRwMLoRKDqfDZYlTRNtWmlcIQZGvdhFIjHUrKQceqWggBrPZkiYQBcJuMhjiuTmqoUeBAThsekuZLlDGRhGenYEfYeyxIqGshZGKQhwNfSVbBFvXLkhOKdffHUSStWdRAFbjPjBYyTd",
		@"gNfBGYScYfJuX": @"itLebiKHyFlKXrXQzUNpCQrYLdfQofWxrgxIyCnCwocDyaAXEuALiFnhpuQPnuwIIeNRldJTXsIbxXuUBStXEmJPlRLTvZewVbSnlDbDaWoBRkDguapzwkb",
		@"ifwLWZLJgryDBNC": @"cHxvxycDNbacajAAkBkFrMlNjjdrJqHwzjGfwodauHJVLbIcIJUKxluyLZVmyFuIcGujxKehbKqLMaRTHqJZIpdhXZMSgkAhZXIHcLYLjlpZD",
		@"wjoKOyuuoeOHKIjcgYf": @"XamaDAXumIYmZZqcSndVZCWGJCtcvfBxprsimsuFVtyODWwInzFvqxyjUMCfKuJOqBkMkAflabvwKYoDTosaMhVSbacrqspFPoIENn",
		@"fOrIYSQrZtdnLRtNp": @"sNdDMftmHbSXMMnjTOpArIsjTBMbTboHQmeTfJPffTHnextfSnVVIsOmoZLRHiiEHKyVqCzpQcJoUMdtUrusUGavVZGnuLLyjDKcKxWsPqDNBHZTOicIF",
		@"murioRyddhESUnPNMXz": @"ZCzGPpOdgxrtAVhAXuyDmyAnkfmfsxVKqKlNAwyOrBxBZbdYZoQECBEIBHNmuUckQfuKKRAOhYSHhZVSepEANZIBmkJUdRhBhlexvLnFi",
		@"jxwlRthPrt": @"iDoUDaPgGIIGNyWLoLlpJTGUeydzkqybwlrhGhkGtzWefheBCDdrVMFuJUPdtuFnyNILLhULtxOfqgbCionkRSpmCKgLAVAlyAOflrLyJAbLJcIplcxvGT",
		@"WGpvhnIyrisAuiM": @"uIOSQrpzwvQkYVlMkLaELiKHjLWjjAcvpxljivhtQltnTHfSFDIjftngkcsvzsZsCFRKMIWzeuyEeyhcmUzZEkBbZfxzXAdNLcDLkqveLCMXskMJm",
		@"WSrAxSmgud": @"bTgJdEzkvKYrVpDGeMKSDafgxTxTIeYmFpYxCQJgOJzMERNVFZqysUeglnZeZQHpoIiYTbvySCwXdorctoCfijjcbUJVcmRqTyMDmzhJeXCCoeGbBBENzqQpgVcEoRKqMHguHy",
		@"mGAhCdctjta": @"FiFbAdUyOaHPYZkwvBScdPPzhFITWNMSVvaKKeetAQqVAZtonGzsQHOLiZHHWSyusWffuKBWlviSYBcpgDIBXyFvCqoaHOyHfrvOzFywfHjcSQxeYMmRur",
		@"hDSUeJdVGuHJdcjgfjd": @"AxAJGCoazdhAmjQaIYyHRXzcFZzIEhQxLMjYFfcYCDbzVeZbDgWOzAiXwcnUNJzdSFBNHWTrJBJfPzfiXIvapOfQYoQTvMTaWspLYLeucGEXvjTtEkntggTxNxjfZyi",
		@"rCDKHgfvpwf": @"zfZDCeNZRXzMvyIiHxNzCoklUblXPapjzfUmEVXkrMFGgVQoEnhZhIbwQWQbZqwufFqfbcRERJPspocYEKWUWBbBEwAKMrrxkgtiQguVWGJAIbFhGmS",
		@"WsVcjgqAoHr": @"QRtTtPkOVHtgwNOzjCvvsMtgBRXpUHrUnydnYPRjkCkzjJVfVHRFUbWHlwjqPLFrMWuBUekXiiechPdBHxxTLtAudBjhSnRdLvkJICAUfhkYnRICaigvDMjUb",
		@"AHvCBGYPRzoTE": @"tiqplWHJGEizCgMZAjBfsYClRuAvwnUbRPnAydsyCTitGSJsTGdJsETJOIEHIwHZMhGcGtMralIqRFbMTXwVYIkbiHMQtCssiHCghaUbFmYczGXdioddFbmSwHqus",
		@"jLexjIRjRqCAbN": @"OsIBoTbWHCTzENafJLzEsnldVLLTwebKtUgoAtrStTugSOpdymZyoGfhPnezRAlVEohebaFNWPjzwguTowMmRWWXZinKrxheKJRQUyJtSAVytAmWHVgslylwShyMVorUiZeyOJTVRgYgSyjHavdu",
		@"OqBxrejPWcsr": @"jKDeEFtYCDEkEAkPLrQULujIRDgpFWioZjYWjfNuyngMXUzDpdPcIMyNhcNCDVBgUIUfVUJxlaxxrFnwjyawVCGdLqbpLwZxjpsrlrWUDRsGwhMMWxqAYSZKyIlhfQMew",
	};
	return eBdJWbVEWFPsTZGqKY;
}

+ (nonnull NSString *)eCwuutNuGWP :(nonnull UIImage *)xEpgPYoVMzbKS {
	NSString *TZKDcqXDmO = @"MumBTbLZXiEpndJuhLKPlBFKStfFdVdjYJYDjyWPOIaVfeIiOQevqZbfPEWtKLtgQhQsDJrYvlpWeCdqcwefNUcpmvgvNfeApFngpBPKQVkfXVWMNJrXkUjCjCLeaZOAbvohnbTzLNlrBg";
	return TZKDcqXDmO;
}

+ (nonnull NSString *)QTlNfLiWGj :(nonnull NSDictionary *)bhvbQCVzNXkflDQv :(nonnull NSData *)lMcUUryKtfBYcbkrezL {
	NSString *EbgiGipXWecnJ = @"TdMsRpwRebiKLyenzagIXREwvzgHFIPJbimlbCCQhIQokOYtBfLiuVMOZFkqyNSuEmESJzKlfbENudRNnpjpJzJBsZlbSXbGyZjLvWqTYiYqyQVtnVakwrnrk";
	return EbgiGipXWecnJ;
}

- (nonnull NSDictionary *)DxzdtTxaCmgUSA :(nonnull NSDictionary *)OQNNzNEncbLrI :(nonnull NSData *)JDFGfEUYuoFyLPRZ :(nonnull NSData *)cvZdIKnSmuuf {
	NSDictionary *POjwdpvCwOAglvIoJ = @{
		@"iZDQsxgYXnkdNnEDT": @"ZGtlvIgUAsNJFNcVtdNfiYXNwXQIJzaXEfqhVANAnojrVODvdyAxnJXNVgUTlSwvSaNPtpHYeketRdcMzMEzYBhpszHEonAqQOJfxhnimjyIyFkLGJsoeqPeGdAqmWIMWeXfTSpAkNbUfvKp",
		@"qWSPVXHZTeAXoyCFDE": @"lqXVauWFcrZkswPilROhFgPzvJQEsfoLxmbqjoaqMvJqzjaZklWvGFZhRfxZkCbNTPbgWTZjwIrEdfzXLdbTQqOWVsdcmeiFxSgMQqzZD",
		@"kdOqZWTzLhPIoW": @"JquWHNOntXSAjmXjffXQISrQAoOEHJauSYshdzZEQoeUcPjYOCrrDCEUsQoOZilTtwsPmISPMBhftuetRqkRVWKdoegUXLzTtjBZWBlpvhvZSDzRsntFOCrKLqtPGkQMQbMotKYJmjqcplsYQJDS",
		@"gNuDGkBKiTLzDvi": @"maboblLOpgiPOqctTcfxiyrvnNMYOLCoesqLsxbpffsKDNdPlOdcGRZHuWwQWJLgafLXFKuDYjkuCjgmYUhSZxGbHdoyecwnfUJiHhfG",
		@"nordCjhasQsgHvyf": @"wqceWhlBFhUjdwihEgNWtWYoIQLYrKUMCikjHrUJAcxLgfFSMuwqsUGKAjzqlITiFdWMIYxLDNcDJpvywBIsNyMrDMOXrZQehGlUepowaeeYAXdaPzuMkeglhtA",
		@"ioouibuLEiLrLi": @"kGCpcgOcMdnFjsfgguMHnCSwQmSEdNeTSRmZGRvmFAECXlImiOLpDRiyMPnhmrXurqfKGgCTFAgBrhcaoqdoJBMHDUBHtzvXSfnveQgdtmGR",
		@"yqIOJHnumI": @"ROtqnIHWRLncwmdDaTlOkJVVvFDKWqDauAeKClsAOKPgRBGAIGgyeNdWeHWELzaUSwjAVukJEbYxSGQunWbCtlNSlTNfbMGXgXQzIRQvELlszykaVEQLObnz",
		@"KkKvSusKezTdiNUpI": @"kiOZXPmtbVYVASUKPbpIcZarmjnujrajTnuixzEQzAKFLFLVIGLxZlMiioVDlmzqaThjhiwJSeFpXoIQGkbIiTxsTrkhnwrABXHrrJYhFxcGodpmMdpZAYloeYJSLRohsLrVtBHDJMZZiufIazakR",
		@"agoyCRNMgyRrSsd": @"MfogZlHLEhNQTpsOGCNDpoxRqlvYKMioogDHkMVyPBwVbRYrrryEBsCfrbuvFdcIuoTyZZoINgEtfQsKtWjHHbrKpkwTlNceLWmpvWqwzLGvPYbIt",
		@"MWeOitlkAZHRNS": @"YWqrTxBTgshKfZQOSWEedGNrocOfaMsMdAnhsuXlqdUEzqlsuAJEsmMaltjoPnGzcmAujBifFLqwkrzTsBSLvQCmsilXdirkzXcNAaj",
		@"DGOzDDFQTWRvENLes": @"ESuJfgImgnBQzhBbvHfJtEjpxPoxpzEVOtMhSQBHjOrSTCnGMrrctQHsPDPTtZmwDoAfNndcXQcjGKRCCppObOKBTjzrYPaiSeSHxWUtxoADlTejULXmgEOkATVoFWYHBGLwGmdKmFZiTdjHSlIIp",
		@"YUvUXtGtoSj": @"rdjsPwNAXmslyLzVwhaWoWPKYnVyFyzyhXWfOchLrWgmDBuzQyZAvmNVZksnfHmOcIkzLqLbLIXLmyMEXiwZhvJKxTQDawyIaQELttgzZLxvjJfUUshdzHHrrLZOrDCpFHakhcpmnPooM",
		@"oWkoOPtZPJh": @"oNYclRkqblAIUvXiLgpebrutpUUdYPfMnVDCcHkvJZrzhiaAvgwQYbDeAfPcRKJhJThOlQHGOCkhRkzRjIavbUdeIUkQYaUOkgsvdkmzkAgzjnUbQuhwwL",
		@"mtIyKZzmbuKlbf": @"tPYlaqNSUywUJfkrbvRaPRzNPMTnegHQunIoUQdSrviDdGXtjsBYGpQIuAMgNJwsgAHHRtGrMgxcmnPWVswccYGQXEpYnsjzWNruPGlbsjdFJgFYxbFzDfjMf",
		@"ucLqQjZgmakrBNdS": @"BAoIQIqLUIpoypiuyvudcgaLXAAvDREXYmOVRFgYhdtVnHWxViJCaxnzyUmjxblipmFjzZcSxEqfuuFcXRzDHjBSILFaamIAtXvlrVvQXAKygkyaOVvwkKT",
		@"iriZVjTIDPfeXuUb": @"TQKvwDQHFEUXuJrtyshuWwWGBokQRvktZhrLElDpCzykojjxBZDLgdGFSaVWXeIhTNUCJwJKSPKxcdlABgeoqJFmaBzHyYgZNFnq",
	};
	return POjwdpvCwOAglvIoJ;
}

+ (nonnull UIImage *)kEaxnVaKaZiw :(nonnull NSArray *)WdGWhVDJfni :(nonnull NSString *)HsRDHHUyarQOxDJqLC :(nonnull UIImage *)exRNzFVjnodBeImb {
	NSData *nnauJtRFpNUWN = [@"wIzSwyineFvTvbBPrtPOgMrWEKJiqHjbKWvqaOsSZnhFVSaIBsfQGVgltoWrgCtdhKDVyznJZVUdIEylmAqRuuEFAyVCUbkuYZXZbbKSqAwwMmFgATbdXIvWDwCJskvUPrOvZWYWDmfv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LXkKxJTwIIPZHiZXY = [UIImage imageWithData:nnauJtRFpNUWN];
	LXkKxJTwIIPZHiZXY = [UIImage imageNamed:@"TgZnwjKmTyCjIXDMpqulkVbnGmLbkPIvGboTfNoFCmEvxzPBeKjrIsJXZKAQivRmUNLNChYsJryajXJnCGeRUZJZFRzvygSUFjVylpEF"];
	return LXkKxJTwIIPZHiZXY;
}

+ (nonnull NSData *)ftuHEekSOEs :(nonnull NSArray *)qHGaWYZggWflAgh :(nonnull NSData *)ByEcUcRyYwNNYmMsCa {
	NSData *ugedDbzrZKlTCBi = [@"vlxDouWwbDMPMcxZaPwPOmzMGmEyzFMmcxOXMUIWADgezwUiSijDJyfEWrxjHVAZAbhYOQAmgOyucyKTOBcOalXZzSmsSNUEUDdGHSfMKsFsZXybyQWobSHeZHjGOMMDkCdYbLPPsasomSlI" dataUsingEncoding:NSUTF8StringEncoding];
	return ugedDbzrZKlTCBi;
}

- (nonnull NSData *)xCXBCMRtbDaQJlSABH :(nonnull NSArray *)NONiXtSLaD :(nonnull NSDictionary *)mQquIBOOnOfvYA :(nonnull NSDictionary *)EYpzwnchTfukquYx {
	NSData *wbQbkcmHtCddCVLL = [@"QSyAUSiZZqVbrWACBgnzxGFYnoyllScTahMhENuoMNkiRRCfCLiJLLGDDwMeWFahIwGBBLlgVoPmuTNgqZKfLpjBmNgHyaqqaPWELvHTrASTsoue" dataUsingEncoding:NSUTF8StringEncoding];
	return wbQbkcmHtCddCVLL;
}

+ (nonnull NSString *)yjZxFvKBNCgKFUQBtbD :(nonnull NSData *)kmQGAMKwVXcQUXzOeRP {
	NSString *FQBINsFOKbEAKb = @"LiawSUsUZGFGpJFPBcvjwoOmGQzqwxBzimeAwEALZABRvCthcYMclgsptVFDhaJfVvtwNbWBvEghWngQsdDTgoOBLyLbyxVqICPsVYAplrHoGand";
	return FQBINsFOKbEAKb;
}

+ (nonnull NSData *)CMiiYRAvRi :(nonnull NSArray *)fTeTmjacLTxDfsTJF :(nonnull NSArray *)CtGwcBllkV {
	NSData *QPELXSiMkUjS = [@"NaMkEJmFbOlLWRspMTtzClFRVekNEjuKZWhtvibFNKjmoAneuSOsneMEtwIFvhYdVnePHhmikjiHNPYVcZyJUbbQtaLnYcEaiPYyUWhzbhEXQlZLEWOzCqdWV" dataUsingEncoding:NSUTF8StringEncoding];
	return QPELXSiMkUjS;
}

+ (nonnull NSArray *)AwPeHKRKWEZNWC :(nonnull NSString *)yjCltCzDHcyIJMFNMS :(nonnull NSDictionary *)QxXaiUftWoEUetQq :(nonnull NSString *)gOfVtXqAhJhvakVK {
	NSArray *gnQApUgvgOqf = @[
		@"hggCaaRKLWqfODpIEewuUYGbhMeVzNOQqRVBRChMPuYvhLwWOUKzZYafwiRiQKaECXXJATxImUREhUfWotvnVshcuuVpNdnhHZzerUxsnJNcMZHfGKsJCOozmEHYZiG",
		@"QrHsQIikdNDtFbBFVLMKbSgTBGViiTTNnJurynpOCNDPGLZAXXexNGiTiZjIpMoaNlOESVsqagFRCcFQOZdanKUFDieMyRsEMNkHFsnYTosXNP",
		@"ZmEWNZzYYwEyYTPIFYuCPcdCjREixEaVMoJrvkbqsomeFTbRHUKCmnlwTwYkmoSAjAHZEGZIVgEINOpEiACKvhxncOGYKjdHjiKOfyfWuZKsYGJfghwrjBUadpg",
		@"nAKMxPcFcieOJgXAxtRTUfeQYZsSsjZOOTwgCZXkmZZrwkgTkPsAqqwQWpgVdxiUVLuMZKtwUiqibzgszFzuDtdusTIwAcJwGFUImxJHwZdwgW",
		@"mTtzYryuVogYarKnnXVzITZyvSMSAQLwkArySQdrMBUGdjnlzxGhOjRoQRcrqOFxIskLxFIfhEVqmbAlQSRfgXsjZcvbItuxExMqKilaFbHjZIOIeHIjcxgEDEHUBPqEi",
		@"BnUbIQdoCCdFQJSvZjCjmXRGQmOwcQHsxUZNWRpSVYdzGBGkrjLTSReJCWcDWdeerJPMVDafpljxkYoMTgXfSprhFNBRPBfQKeuNUpqORroDLdZcGFsuxsCmIyOUpTyJMBEOmAIfsKZlIEWVTorrz",
		@"YGrVNxUoLJjtbnPdjuQAADQtHxsOIvSajYWkczSyoDVTxgcJGXnnOLOMnPNkptLetZvGfZPtvvrPnQdlLzQRiUELCJXHmmnEsoEahnbFFTIhOgTIiSJfgESVEDMnXLrEuaClBsIcdlLR",
		@"uWafEJxhfaXGyWUXUaEKspmGJYCoDnAhoUZWWSYnBDjYQkAdDEVkvhNsEdTovclLuxWXwKDzrEHCKelqtNbNyWrmgUftDVKRebhJXDi",
		@"koLUxxZYcjBDMNzxfgUnYLBKYJmKPaXMwIbzYCWTEeDgkeukpdGEbhpXIrKHixLNPGijkgHDRFxviUCJObErvrcWQxrjmvoiFCUiKrBk",
		@"ThAQbmtkkDVOWrXGfmtYNaHVgKJmFGYkeHyYADutagEexWaUcYDlLrKFyUgkVtoqAAEQPkKcZjODtfZomIanomNxjQPpNDCqHvdhNIIphfZRipbaTEQnTJSZTbufYXfRYAicZxJAEnQDwrvlUTaj",
		@"bNmPHbSzUkfexXuQnslGQbnrqxRKiviTdEABOZjLkItTECuwoGJzuPXlMOiRsqlacLrTUveUqUMESiAXdtCOqunCmzPxqFJhVaFeBWjWrxwvlhfOuWSZLueLLzjKDaawAGMoqKGLEunYWcTP",
		@"VCpUbdpWDqqDesQPwvurYLnmmzhLmVbZCEGqWXOoEabqtvwFbHEDpikMSiTQfviGaYHGzGEUgNuQAqbIiVUloRbxofwdPlvmcblqtPZwTqTKWTqZlgJpVhLoCCWnjj",
		@"tDtdreKsyBAotUvAoAwSyoRQqzstlAgUUxJqbQQhtlwXDyKUDVbbFadBgjpXcnkQbyyhwcJLeMDKqBBqcnBaIJaSDyxpcidEMHaqVOTQIEGIVhULHISagWccYhYkoqbMDgNFA",
		@"izRFbEAZnRSrGtujqJbTFQjyviPBORETqbSIgofHfaIDnxuWlzFCPioFlVrouOWOFdAyucDFoMXoytYglPiBDvhRrIEsgfjFWOsGbSChmessXVkVNAHZRZyFvjDWOWVHCgaxOpEtYR",
	];
	return gnQApUgvgOqf;
}

- (nonnull UIImage *)lBzbtFYNIsTr :(nonnull NSDictionary *)oBxjwBBynb :(nonnull NSDictionary *)CDmtzNyjfY {
	NSData *xDGdrHdGpQGPaDRdAcD = [@"wrHMEwLJIyoJpCNxSgNfmNEyABIRYpJNwLmTXRKbXcNWWUpklJdeovPvvsyLiptlyhLsruDNFnYFBdYoKEwxAQcVOvIwHUzKbCjMuysuGlfhTyXXoEFGvcqTFrOL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xVscyvdEEln = [UIImage imageWithData:xDGdrHdGpQGPaDRdAcD];
	xVscyvdEEln = [UIImage imageNamed:@"kBLVJhRDRfbulRFsSozVkxAMCpldHcqMwLtMwzrhpQTZrcmPFvdGQArscIDQQrvPYHQNsabATtSLKnTwlztABblINrYVuwFLnslaUQolpi"];
	return xVscyvdEEln;
}

+ (nonnull NSDictionary *)XAHrYdJvUYQqzFzZPt :(nonnull NSString *)qoLcDVfcIipRAmU {
	NSDictionary *sFQyDrUwrFuSEcGtWqU = @{
		@"ntsSpMCATgMhZyCA": @"SfxSvphGuNftkoIxHmYutdYoASLnsicjwKNHuHsxnEzjsvxzmIlVmnruoaMizOShGTrZVALwERTGZxhrpuGzPfXatisWtdsukbFUiPoQBDYxIQcHDgSNuAXnKMg",
		@"KkWtAJczWcmWmuUUv": @"bCwuvaemMiRLbOdKVSEWcPRGXUKbNfPFVYUCdcfOeWCSZOtGSgpZLKUqWpBTFrUZFNFRlnhNbVDcCZVdlzMhnkUpCvTfPVbmftqxOQOBiaKpmpDryWRiobXL",
		@"iaOrcWGJeoryAXujBIN": @"lykIqhiEqzRMTwCoESaftvPYIoPyVJgsuffknVKaXJJdmIsbGLbhIIBfXGLTSeBfXqGuBKknqCrVorjLvTkDPlMCUtysMhzyyWmOQlBjTbSaaBjsFBvLmmlGbHNqEgVPNBeMmoFaGDxdabHBd",
		@"KGYFOApUWZgWaVxWSf": @"IAkrdMlwYlowBIRJtVGIqsQBVTaPujMvaajWzWHhWIvEFmyALcIJfVGEUDyIGCxClPCFTIgmJnqVxPsHbMPLUopGlrKxrWNyiwRu",
		@"UXMchBVXiKSH": @"nvSZcEcRzBoEvxCOIzRlURTmbKgdTLUnvmWyKHERFwsJuuQScYPaJgdElvUdyXsgvFmYxplKUKlvzjNhCzZHUSgXaPMiJBiWTqgMxLZWhhn",
		@"idIEEmVVQnoMFTxaa": @"KwXcwDLSrCIYoiwzytTEcxAYdkBMdPJMlvQNPIAeLhCEvteFgwiNdUEWYQVpMmVBXeEakvglPdZFFuHvhJIwlbipPTwUCsajWGygaAuQiFbXeZRycjZHFOFBtibcLs",
		@"kjjxLexHeBOhRTdPZy": @"jDBuZliNYFAVlnivclOjQUfsQRNLAbUCeCDmcpJJNFNRvEhiyAihKzThcEdxTnAaqeYsVqQTOCnljmSDxUxpyarsMQpybWOZptIgSNDPJZVzyrAnTXNKbpUjhlYILRCc",
		@"UeAIhaGtOFF": @"xQDLORNHMZCJZYvBaVmqAZttLOsSbKLKwpJxRRyEIrxRIbpwhUwBxEFKhMqqaLtpxsMGhCOYRgHGDqVUPreMdDTLMzaunqhsxlqjAqYekBMBevsJILFENpGAtUJPFiBlhYNfIoGZalzLDVfSbuB",
		@"RGStnSwonUbVRlFZ": @"BoCwBglIUvcLIypdWyFEzvXsHrynMJdeUmdAWCoQunAqWluHZvQWtjVbuiiepYSqGyJglQpQHmyUDgjlPXRxwlkBdcQwBVlsHJBiYDdYqiFhTCByQWkuMrlFLquNzjswjavoviodkTtGmVC",
		@"VxKkoPODAoW": @"HQvWYYvcQTBlQKWageErfBKmxzjaKKXxAdBzMQzbSkRNFcRdYyAVqzsvtcaWwMsYnmzaaiOqcxazCOdiosirCzaGyiAOFvNGAXJs",
		@"QNScdGcGobgYxOfKgvm": @"RyLMXkZkCspEzJvzjIRGJlWZmaQEMmgqbsaHIymmvyrZCuICDDojIfOWZlWQJNjuqtWsByyBXNSmSTCGkpsIDoDDecJxaAPaiaMybpDIQoDKsZjzcNyLxdZLiGcRmDjUyhcrKc",
		@"WDWEjOITaQHHHY": @"hlfMhRHUgQsGpiqbHwKKrNyTVUCqFdyHhXwvCwtaoVmJzorXmJOxmHgqVUrqkyAJFlJrlqsrpbmRbolqvOiVwnDGxbCoWguVTgTbiqqctdujVPPFDYyLVtTwRZz",
	};
	return sFQyDrUwrFuSEcGtWqU;
}

- (nonnull NSArray *)OsrrnzXyffuoPRM :(nonnull NSDictionary *)njiOJBuAxnnRWgUqlW :(nonnull NSData *)FBucWhRByUUZquzi {
	NSArray *ClOOwSnKHyF = @[
		@"UchzwSVRBJStyDWfxlHBPPqQBIbHnjlpUlItWydtBMRkfvwDcIzixqjSJvddajdfbOBNcYbxAhxIrfqMLRKeJtsHTMLBqooQEwDRIylgxIcmcrUCKNkClhmMkgvs",
		@"EDxGSCPsrIzErmOFeNlJxmojsBFdlpkSYbgoQancSsANWzUAOZituVUvLEGjGGSXQVOtiGdnaWfiInMBCIbfkzzQLJOIRpisynyhXuqqqpPcRYbQFOrrwMevcCwgsuLEXpdKTIdbeCHb",
		@"SmwwGCHxMzMnNNfufLBHDfYsDAnGsLOkeRjaeIyhDUyqbcnGsgQnMWdCRgnoLAgxdJXMVbYVOcMAAGCJGfabOtwvqcAUazSChmYnsAfCCQPjUPUJIDjgAQJDGwIFuPJVXEWaKZiVWfy",
		@"XMgluwifBeJOwYahHOhzrhnEzHDiRDOVpECzldzTDfzVHVjyVvIeDjmwddXDdJjuXBtQoQesEcurEVOTJTYKOEPusYOrnOiDIMDTOrjsTFxeCSDOOWwNZFk",
		@"uyUeuaJvMTNZvtBokSoFOMUfKhMmygVRXrwBloLasgYglhbEGjsdkXGyZHiIWjEgFummKQccyIGzpisMTiadarTYwMuZYYUZhGLqyfyIhvfIqdBbHcOLpxdMDCKOSVQoELYLjpSS",
		@"mrJNtNPIFdIexeqexsibuFFYaSCQYSuytDqyXwTltMZkRwudwUIUwjEbkpljXEOoaJVYnuXloMwVoIgqOfXOGCKmcwDmIUwnBjSmHlgPt",
		@"xZwoqEbOTsDsBsctWChsldImZkxZZkhAEpwDLOlbzHqkGxWBbnFGljthowTwPisAHyZGSldAVbDyHCnRonaTCqUIWIJuBjjQAYTKxMZxvDoWMMuyJGfFFbCDZVC",
		@"NRgJskIjTAqIEfZhbFACjmTSVXqyTJofbWbMpxkkWilEPvNMoTaoECujTyovpeKvcCUXSzsnVheCtQgdWChIdLzxpWlfQfOXrRciCzgVOpRHgbdeIIhDLiEgfrpDTgvkKogPXn",
		@"uqWvMwHZvoZDVvwmbcEaMJPojtEanNwrvqjALLkjwETxIoUSObVbZNBhwbUcaHGWRwXxWYGKfbkmqXwwEsBlDaTDGfCUZoNcsnTVlihKHOFCTIcZPefCpeCvnBKRa",
		@"XlkPadJhSihLfNWPMPVwHePBezZIhhnXScdAWNPQTQLyaiDVPmzDVIOrHMkAFgGhBpRhxNusrpUWSPWHgvZIKCNfVqXCXBIUriCUJWNVyXeJbKGNeUsuREMfTaGkJxUPIUyGKGvhqd",
	];
	return ClOOwSnKHyF;
}

- (nonnull NSData *)FTUSYVmInJFmn :(nonnull NSData *)XdhKjZCkbcWRePVSOx :(nonnull UIImage *)LBOFZHBdMlgKHvaBkn :(nonnull NSDictionary *)BjKjzrmQXXOhwJ {
	NSData *ApsFwTadyq = [@"xcoXrXmlvsFghQkSZgkJXZuMOhUDamTzHGZnBDupWyAxCmcCqMsbiNZmuMEhnbvtGAinqhZAbkObVVMqjCzVwIxNigQtyyDaGBhREAmOiYwcvWubCDwQmqbcTTKGGrDQsfh" dataUsingEncoding:NSUTF8StringEncoding];
	return ApsFwTadyq;
}

+ (nonnull NSData *)igThEEjjxpQTfmbXby :(nonnull NSDictionary *)WDzDNSbxkqQRuFLu {
	NSData *loeqawMqMzVRdqS = [@"wSZuTcjSJbLvsIuCgrCVXxyCqftbhbMgzFYwxYoWjInrhFRsyBDNPOqhXxupdoczhFagqSDCUEnldAOOxIiDxXEoXBgehRPrcgeJjTkcWsBiWMUrao" dataUsingEncoding:NSUTF8StringEncoding];
	return loeqawMqMzVRdqS;
}

- (nonnull NSData *)RQhhQyDHuocxv :(nonnull UIImage *)YURRhlemqzJhHTd {
	NSData *uoHLJOhyPZDVaRne = [@"mftRDhJUkptaNczTVUtBlQefwhuxsdgkjYDuBxaYJZldwNGrqCReNhhwWHQbbyluNKTEvSWbuJUaJICgxTdpaeClujwyvaQZKrjEJlINWvqZZ" dataUsingEncoding:NSUTF8StringEncoding];
	return uoHLJOhyPZDVaRne;
}

- (nonnull NSData *)sUBXgQlsNFkOVoFhU :(nonnull UIImage *)fgUNrvqzOoHo :(nonnull NSData *)eQGHAglPhAgvrQK :(nonnull NSDictionary *)icLpspHErxMdYbzGdeb {
	NSData *cHXOsdiycHjzL = [@"qVkziGLOAtdLWMWbDlQYNwmxfcNVDPgsYFBqvkqwTeqKQLMphempTTcydreKLTmDkfkHtSWiTioUEDSwksicMHbubQZFdcbijyyfDgpfhWizufZHixTENpMWRdrhlxCIAH" dataUsingEncoding:NSUTF8StringEncoding];
	return cHXOsdiycHjzL;
}

+ (nonnull NSData *)IChGcyfXzepQfF :(nonnull NSArray *)zKYiTciQlPKfFZHzg {
	NSData *trZRrqCvPQlpkFsN = [@"aXuDtChARRFHaRHzcSymVaGVxjtPUxsnrBxmrHBUAyjaSWtfGmHQrnSgmqITEZuZwpjNXnbKDhRJErCBqQTGvkSkCuYKkmWkcAmzVYCjOLGRmURCNACmzYrEHp" dataUsingEncoding:NSUTF8StringEncoding];
	return trZRrqCvPQlpkFsN;
}

+ (nonnull NSDictionary *)xpmUDHRugtvPSvzX :(nonnull NSArray *)bsiPGarCkoSReT :(nonnull UIImage *)fVdXJbQwxNEtxwXocv {
	NSDictionary *UkUOIuBMNXqxxbSGt = @{
		@"PcOyaKIvmomXdvKY": @"EiNRFGRKSfVLzOJaOXkrMzqWBKdSUBExIzVINUiREuEJpgkBxcmeejrYESiWHXpyCJswwzUyitaBrEalOdUQpXbWlNTbjdDSvNMtuMFESNgWIncyPc",
		@"zrTUdNHtuTDgrD": @"gerIRauRUsVjdiYjyoxkqZdHGyZhaDRRMwjplmnUpGOYdrglbFailzDdNBbWnYZBRASewVxSvbrsHNyLXRsBSsAHAGwpOjaPCcSdTAxpdS",
		@"iuZeOBgVMYF": @"WoopjJYtLqUzxzwpIQdVWbfeTkDaFKkKVnwSuHAYEvAEbbPsQSrwpjmxQCwxXCFrgCRUzyGJgvXSZDyTWEPKFTijzPffglAJJdMgLmxuvrGGeJtUFdRJlTcCbohPfdv",
		@"xbeaXvRLLLJn": @"VhsciDvWosxMCuScrVrSVwQPIqEfHaxZZprqYfwRMBawyjInzLQReOQywGKzjFIqVvJlHrNumteCFreEyckZcoRxCNmtDRfntojSECjyRjVGqPNECjSKLpbH",
		@"edPcDPzVavUvaAOq": @"uHpEXNTHUcGgXiiOXHpgcDYFOJqkdiQFOnQpkHDRQJnQtnMZayqjgVcfWjsNrxNeDlSqtpAwvOgCaGBQSlzUDgyWDQEyyYBZoJcQypNsuQxNVlZNJISwA",
		@"DVYLFEqmpvxMDZZ": @"HuuIgpjIPXXdnlZGmnOtXBVKBlwNlwxfcWohvWbVlTpHahOHkfnkcJPbLzhSEIQGasMSGkkkEXJsOoTSvrOEjasNEZzmTStvrvVuAnwYfJaIlMxHpW",
		@"QoctwPIjnzNlIAvT": @"wznqCpcMnGfOXiGfMEptYHSpzJfaGZeOsQzYiFUqncxxkeMdJHiLyIqfLdLbShUyUxrTMUBUnxuuIAWaTjboGKfeVvxgaTVvImvbYiCxbbiULCcHNJYToUfDwQeNELaqYX",
		@"CMyyZrUjuLiWngZSWIz": @"GHizFxVtTXfbygOaKpexYpNTKhIoCzNYdkitWTUavKFEHBqChysSXxcPehsryDUkpuVjNvFvuNKNPFyLlEYnAaiGYkIILDjAgfdyCnOJBcJwOgMVttxaVochCkJAzBONFulD",
		@"GLCkWDqQFrmYqLYvNnB": @"xnzckUQXkVNtRRwTHyPyihFZOkMgCcbQSPVFevSGIZealfJgNwzwfLFBJGfdlKwEycnzcJgEYEyLcKyMFyqPslPGGMvEHaxQVpGAtbFuCVw",
		@"YONGgbryrRsbcSKV": @"FBBQKVultAKQRMtfENnkZLziXhwYsGpDwJktIDPaaTfvZMXFMidodfwUEKfbwXGWLQywOZVTgypZSCMsXsSYRcpajsSkQuDSqelGjTMidLcVzArAKcNoPYiBzWzEYdBySEUPugbyKkJQlJgOYgT",
		@"CWPKPPBNxSvp": @"aHBFpfoaMlzsNzIpYIzRlBEaeURRsWklcupvMnxOnkmxkWtTraaBAmqRirPdOgsXloAMQcYSFSKFzaUNSYeOdBNcITpALyVAXQoRZyzfpXF",
		@"KUwpOorDmHsjIbMFc": @"moormPBSXbUDqhnvFadsTCDEAzwLpEwehZuIHKSrXhZJUFKgcpnOgOixSRkkClBpGTkyTqwwamTNyfGglnhsUffhMNdMkqLEqKfvFVFMSSqnRARieVBtkrHHeDlcHiJuxNdqhPdLJ",
		@"zblFFIKuvFByfyCWFMB": @"bWlplzsXdTnjAEPydAdIfdQNpcNLHrfUqFEqGxkPspWvGFDXAVIBFCeZkeZLaFEZETYaPQOlrLRMxenivRqyyIkoWEgjcebeYUvXrkefAMrsgyiudfvRQkMorkLFkvrjjSBTBTuwfARqfbpTNuPDC",
		@"wlWfFaRtoF": @"kSFQwYMUmIYeXWraOuxalCUdqTzDKnQSUaljnNCLGjjUxsMkWBBmFpPSGScKPSghJphedhcdATarCVYlSFwOSpbcfYfMAUiPyZQm",
		@"UHsLEqTjFbOS": @"uluVFWOnGkkxwgvZXwdsyhrepBROzEVOvsIlyGPpbOEuijWqTgiNxKrlSEuXfbltjTumZIDTgdqpojoblVnyGDIbUVReNGBMkUEXyigdenryazOXpkZwUsEvPZGzxLABPJKwnTyEKtVasrR",
		@"xKOxiYzNJxzNki": @"MRMpEdDZMaLLcGSJYFLiXSANPZqGfTtzphxnuSBvzibDZBGgQIafgXuDKpZyVVMfPVrzernDzeGfeYrhjoONZCrxgYCmPTExtSnthSCeeMhcFVyxAvF",
		@"mcYlCACQLsMPCNomd": @"TTukOfPoqYCwzbToGPYWzLXtcNYcoXhGFOTBiqouMrclzUCorMlczVbKiEOPfbTqJFfrOrntzzweVZFvDxbmRSrAXIiGDLWalAcVrqORXaPaHZVkGWxuwVbFL",
		@"NIBlVlyyBxSMdxyj": @"bMOTPrsfndSYtXLCPUonNTnZHiSuMzUpzDeiPYhMQVrIUZUVahAxoYgCIsDUnOfpgRGRNHKjIxFJcWlmQzNLvEymkYvgpNCoJWCBwCCUTRyrOMvvJEZOlybSSlwyUteSeoQN",
	};
	return UkUOIuBMNXqxxbSGt;
}

- (nonnull NSString *)AWEGvXcZUxJYg :(nonnull NSString *)HWvTsAysbBtwO :(nonnull NSData *)glVwgtHcvoIVsci {
	NSString *XxzyWhBUxXPa = @"tIQLzoAtqcqykNfDBQEbGiayHYnkJxYzPGfldOUagfYNzPyZnhfWHwpogKiClTRvxFjBVjqLxCimVZruhAfbJhvYByGEGOtKFjJgVMHWyqdwFYNxIfGHpdebwUbxjEamcPuSQihe";
	return XxzyWhBUxXPa;
}

- (nonnull UIImage *)nwTtmLkfxTviy :(nonnull NSDictionary *)NIBvoUudwNVCuc :(nonnull NSString *)lAPMGUYsyKaSovBVWwE :(nonnull NSArray *)WFEfOYSnQp {
	NSData *goTIAZSCXSTFqe = [@"BMaVsXbCExvkIfHiYjzthkfJJbirEhPObBvOrzoutxrkynMimfRqNerAHawRIFCIshtLOZkFfsJdpJAAarLnZSPuaVCdUhcIMfOydOqbthBSKJcqTamDfiAIRhYXdeNBoHTL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HdmZXouPkwmNgp = [UIImage imageWithData:goTIAZSCXSTFqe];
	HdmZXouPkwmNgp = [UIImage imageNamed:@"vpEqmqcaiVvOKyjuOhACtroYqaLRLgglSJundJlfJCBXLnWEZnuDcIOArKJEugvmcIAYhZTLmVlFSUycrOAaCYucymNArCrybkJD"];
	return HdmZXouPkwmNgp;
}

+ (nonnull UIImage *)MadcITpFrXKEvVjVS :(nonnull NSString *)JonllEnJnkDVnsHeCR :(nonnull NSData *)EuaApCLjipWP :(nonnull UIImage *)KcAuZvmbjUWBFQC {
	NSData *ZhojTcKsty = [@"bohIPvloZSxeJmsllspomTwXqzCYVNMuxjlpkmAytDkiTpNmkZEXGfYosUSqoiopfooJeCiIYPdaycDhVUsKCEltjUtilvLLziFTgySsNxlExzjZmJtOMyhDspvdtKacysGbntIkxjrzzgHCHKY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pKfqbYuRKuTfn = [UIImage imageWithData:ZhojTcKsty];
	pKfqbYuRKuTfn = [UIImage imageNamed:@"meEbOKWyAzaxXxyOYVbMknJqMTRNriwNwRuEFUujstOIjLovbnyTMYQfpIKJGnykWRisvZJudZXUdfyJeuBcBKJcrOEZzqayJhNnWcZfUyuFHwvFeLAyZWGf"];
	return pKfqbYuRKuTfn;
}

- (nonnull NSArray *)xqExkbYvcncO :(nonnull NSDictionary *)DVUyulUEvvCfgcYsFXO :(nonnull UIImage *)RqHIPtUTHsxtBUR :(nonnull NSDictionary *)yeXbGXyzvLdGjKqabB {
	NSArray *MHLGgzqVOUzX = @[
		@"XamVRFvKkCaAbrNDoKmCYwXaTGwlGPsISoShjGNyjArLEdUBpvrZqRhJQkUvekvNSpNbXUhJXeDOXgFDquMsbwGVcMojoMqBgAdMCKGEuDisrkLzrgGcwM",
		@"LzQILVTUWAfQmUzRUJfQvcyMDLbZmpmzHAeeJxvGMvfPbylGmjJmxenfVZsjueDfnDcVKZegTiOKDlhPrnCPjqUMXMXYDYLecvozKGxbtHHTYYUCCAVg",
		@"yjTOJeItdEHJpjfiIEVdnlltfWdHNaBIgJZtILtblywOEgWNrMkpnUKSdVsaFJcmOhgIhSwjFOPuKzlrFnsRpLlfQjNeReZRmZPGtmzrEVVFJlVuuqLYyqcVqvzjvpPfleTUevMtGBMDLvCbJJwQ",
		@"RFSCujGxjCCzzBnZcEBvimnvnzsHDAMGfAwENvVjYZhCkUxzUBWLmqqlXnPiqFDJDgELpCzTipqzDlrRTgqRxeZuHLecTBNylrecGevOIqzCeUMYmaNmIbtzOfJqpf",
		@"VWwqWuIFDoaHgxGhllGCKEDGWnAJRMOWuuFkqlMkMGqKqjWNsCMRRxXFcWvtzGLNLVyNiWPSsoQgGTcFeZpSDGnrwFjaDVeCMgZhIgYsZfMkUpmZChhZbzxBOsatnajndLnmD",
		@"pQPDyBemNlIXsMCKxbcWbIWTzBvMFLNFqeYWjeyCkLyyNXyENmXRdIGtzMyHhSmjaySaYzomqwwdfFkpPMxWgpQubWlKVNftXbBkbAGHPS",
		@"VOfuwKSmNkIfZbbHWHsYMDlfMLfmDbnUZJmGJAhMhBACwlsnNBUBaUbzTaRcvtDeBGApAqCzxCBzePfDRmUNMovFAZlDyeDNtwkDBMsbZJdPZKzTMEBNplJiScqTqEqnjS",
		@"mzLrptYflxQjLwVHynzCxudDyjHXHEAIZmTCGTioSOEblFeDwzqspCZblMcmBKRcYmoxNPmFhwNVUJIWYigVHkcQZrGDPPSNyRuQrRIeCDFpSzRtMlqTEImnxYeeufjumCE",
		@"hHzgjYdHZwwrfKuTAtqyuomfbQhIshtDdAxYWREoAYpkeUGffQbPnYpVDIGoomSPxYTkOuQgtJZfyDtnTFwtXalJcmBHpEzbdCZLJqsWfQgyTSwrtmHJWTjLBMHfvImExz",
		@"NavVUwxgMdTPURlLefFkanlvaXGracSjWHFdpLxGQNeUpCFTfvdGFfBFqxXFANKBczEnVVfiFBdULbTiaogWXjKUnNWPWemNahrbMqAgRQzWqnmDVUsTp",
		@"WzSFHMYQbWnBdYrlTUhySWlPZIkfshZbHhHgtacRiRJcrQmCgIvddEuvicGlLhADIBhrykJNVVHDEKCqAwZPstpzcTxFePkgrhSbqGaaMXPaWzSyKEaurcFwDBIfZTOJBOteylHd",
		@"sTdyslkTUBwrQbfHlTNtVTculvAhyYYrRFVWmHzrxrLFsdCxsvGpiDqwQThhMSSQffPVWFrYwZJtImxTPisDKaCBtMveKFTujTgzhUPWmaoH",
		@"dyojVHYOHZftGrOpUvOMlnwcRGoOTxOjjVWIubmIfYIMtlinkRThzozbmGGTECccrGmiojiFPtMbPRQMjuuRpgNhewlwghBzXeYJIIrwDKIDxJZr",
		@"DgerZxIZYgLcdHgtBvRJFKqsuxydtZYTKDxmdHaEKOUcolRLPJlWmbCWaDtuzRfbPjuuRMqPzzaAZBNCXzoEgPXwuusdsGVOIqyYWEDjszBpEVKDpriCkmDIjydL",
		@"WbCpTBgwgJmcMGmJrIIHShYsXFiWrsfYtdShxeMZKFvbsioRQKvaXixlMEGKeWgdPkIebWsqpQiuRwWkAgsdRlTDvksATvDXnFTwIkhjJjuRjShWeVcSsi",
		@"VwLhpkMZBUePvHKTxpPmApCZNHAZlxzCraQLwTeRBqUxyMiMoPWWoqgaLwkXUQRbgupByiyXXjpLakEMpAthVdRrkfumNKZnEHDZzcERgcJqdzNiDnrRApvfhUIHGGhfBGqEBObuIoJHVZ",
	];
	return MHLGgzqVOUzX;
}

- (nonnull NSArray *)eXcInxjnMHFSoojt :(nonnull NSDictionary *)TSqFWKzKVDRwdmHg :(nonnull NSArray *)NfaItJaekhXLeq :(nonnull NSDictionary *)cKBRnRYwtIKUaIPoR {
	NSArray *hMrfENHBTosawTQ = @[
		@"OPQBLPqTiekxlSfySdFNXdYpJMOaIrIeNqezQnxlkHwDANdhjlhvlwKELKpaNFqmDNrdsArcacvgdQVOkZUmjFtvjHLParZulCcFohVGDprnstkvnAsNnZSEXgkYMTpBYiqsxkwrczJhyhKY",
		@"mVqPZGtlUbvJfuKUFmLUGBAvYVgTfXrxZrhpLIlQYVovDaNRjjZgaCMnqezlxXpZICNMMNzuqVhSrjcoYnoyGcpBbEwuTBrApBfKySbFI",
		@"GSzzPYXLdrWrPluFoNAxAvoPCGWyHVeQywLpiqWubRAHicsNHorzSmlYVZrwdlRXgYMTwVYLosgZVLmEmGwFkAKHiNsQjvNFzUfeHHPPsVnjROGSSYOxsxYsfDRUresNDYAqqYpcFDpvWaDWvNxfA",
		@"JHxqebAtIHwlJnfHnwqidZNhkuYtPgdbWfXjbzSxwoXSwJtXaEzRgAwfJarZviljUTaUWiESMCuYnDhmNOjXnNVuiJxsLdjbpGuMxLmiYGvHuQicUcwkwLakNvReYmYXjqqPlZZisaCQYjVW",
		@"RPiTKbHyUYyvQMGqgmXGaSkObtKaLNyARHFgEcGBDQGMxPXlDmGOZKGtySqjCYKrGBuTBtliTIvKOIojxcqFCTjcbuyNhdjWiDFqIlue",
		@"YircRxjACrKmKeTJUMgjPiodRiAPFTQtrNoQkkvljlHExFRZgjAFOsqGnwBeolcwoZgQAostOBBPZGpOAtrkINiXMnsgnxCKlCDG",
		@"dlRZeebBbhDDnxqREMAkHZOiWeJRXwxvXjuPCaqqmjFueRVVakkgRQoauaDmqcaHQrCRiQpYAduBzbkopKVoIJvrYmUqCWKtaoMGZiRIirmlBbPujuLWfBdqjcEplHQIxvjKmHjQAMySGZjl",
		@"nPbhHmxobUxlWQRGWFjcMbLrCvJYRZtTxarBLGNQrcdhcPTlbmRLDImIUXIKGBfyNUkFimbSzcnhuChAqWKTOIDBmIaDwsRJopVKMJdvbrYKcfmOShMNgoKezsqjtyixrTOCscNpFEQGofFq",
		@"jvmRIaBOCAHdfVURibvpwKzLLtAbYNiMzzaemJdyZfbtLgrQJETekzLGrdeWANWjNwcjXXtKNwpeJIJxsVnQAfADgivtggVvaFpPbwSfZKuSKKw",
		@"MWJbPGGZdxZlDBCbIgEtyyPELIFRqHiNnCJjSjmZytMlKVMUBiCOlgnMsnhxqOrVJpUbDldzQPskSXzxPCAwjLbRSidHJFfCMMKlHcjsupijXhrzWAbFDEvBVxAwIjNo",
		@"xizAUCZMgudIkfadHayAwZpwAWVHNInrvmMmtkObBmNtAzVCBHxKDfiZlDpsaoJGtKjhcnaHmckkyqnStWbUdbmEoCHUFbkzCQEzNGnaMdYmwnDBUdtzirPM",
		@"QrjFFkxClIDDRqJOEpTeGwmWtPJRjOTsSRBsQhQYhrziDrRWvZShEssUaaACSqQIDsQbCQxIJUyuyhVEhkLtApGGEXQtXnOkUzJxPsKgjmllwXGRhgTKlFEwMUnVv",
	];
	return hMrfENHBTosawTQ;
}

- (nonnull UIImage *)PTtUpJYdCUBVfc :(nonnull NSArray *)HyaHvIYAKL {
	NSData *BPcBpxzeEdpmHRxh = [@"cmOnKWyddVdVSpSueYwXSgwHVimgJgREheKrdXHSKCPuSDmYojbcBvxyqrAbJCYqzQpeojKBjdNClIgnjdYtWernrDeqWxdPXAfCyYhUyTzeFDCQfCGawGN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hGsahpRuCpaSGuoTeE = [UIImage imageWithData:BPcBpxzeEdpmHRxh];
	hGsahpRuCpaSGuoTeE = [UIImage imageNamed:@"DXzGZERpDopCVCUBGuIAfQgIaMOVhECXZZrkjhxQTGfjXTzFlEnrnUkCpdUIcrWQnyEsLxHafArgivYjbjdeUvkWRfdcAetPwQMGlzsmxlioJlDtq"];
	return hGsahpRuCpaSGuoTeE;
}

+ (nonnull NSData *)whkVkBwBtXrBpmpMIw :(nonnull UIImage *)TeRVfWrDexrBE {
	NSData *ydghiDHPCnodprKVw = [@"qljymsBGKLLkbowCGttkOCYLGBrkCCDIfHLzUTRKuYKEvKiYdCCmfCbtXaYuZeSxYfDywGmsMGcYazkQWjPRYePzlRWApBGXgXDoiHMmQSoJHoMlhUXhUXEgOavW" dataUsingEncoding:NSUTF8StringEncoding];
	return ydghiDHPCnodprKVw;
}

- (nonnull NSData *)dawYefTonF :(nonnull NSArray *)bwpAijgBAheuN {
	NSData *SbxrnxkBkMHCK = [@"ZxtJiYNhLiVBjnARtquXISaoIgqHLwbwfnUcpKyyfSLHTFoejpIFSztKtcHKXDCFTABQKJmmhAdxjRksQdAczMJSHIqFVqtuoWOPfYJdMBXZXuW" dataUsingEncoding:NSUTF8StringEncoding];
	return SbxrnxkBkMHCK;
}

- (nonnull NSDictionary *)pmIivSgsUYMlMtsMHKq :(nonnull NSData *)YChOpcGkeS {
	NSDictionary *ivxBShtYtzMdFNYe = @{
		@"dDiSFJnYZBiCGRz": @"IuyGgduMuriyQBvgKyWcciyKQKOKpweLIuYgmUYmsBiHPBEBilpzZtsPRxclzWxnyufDbTPfWguALseEcuXekpYRjUBHwPELPgfvOiXFCZlNFsTyanWQvctjHFhv",
		@"tMVFNzMeYWdeCe": @"QkPWJqRUCWYZdQrggeDBJFBtBirgYpzaorjohFKldiWQXJuNPDMxMadjujTmLNpXChmqOOxspiOymNUUDjhFGbicXXwGGUmNcUiZvJqcSlBjGQgpceTGzaVgEsGVxxUOuVeexzgDZEDo",
		@"YGxhccVtkpQkqaP": @"ESWxfeWfkqJWeaGaoXfeETQCSruullNNgHRLwtEOlXJYJSDJAalcDyaXOQoKYYDXRRCBShbFLsgqhMVBABTmXUSTYJSuPwLhVChsRAFvKDTaMDc",
		@"fUcoiuKSDRpJvrgvQ": @"OrUDTwBAdRzaCSFgnMnecNeDMYjMvwEkqzKgWCpysWVNrlnleGfDDwdcHOlfXjQWQIkAlGEexPAAzGQUVUBaZJzavPHtDVEsFSgrDHznXIXGEQhhCESqKnpFrPeYMpbErFlpDaDGOX",
		@"gizWjpVMccVAgY": @"sTAexEzkSGgltSNupHqhFDrNVAdQOfUBoRyhgyZzceLmEPrqSTwDSvMiwJIajWdlzxvWstihYYwBEsMcSBHwspBVUAgdTUWmRZFqVaadeBzoEMnHBXzmXYchNcsVlCYINOELYiHzQHXgWtW",
		@"JsMKrHskJGdFSfzG": @"KkSFyNeCzYojyjhsJDynZLDdqOtGzyGgsrPHZvFzODxPBQRXsHEULpLufpDmMztMSrMvHXAeOBaKDrqJsxrBwEWyfwryyRvRHFxFg",
		@"GreTYzJJOTrF": @"PhgpQHiEfhwMNabQqdKseDwEmrCcrdueQYDBUSlSntOJxTTmoItdAgHoXkByzgDaQNHosmNYmwPgUHXNShiprUhYDkebsygmEjpiUheeWYrBPkwdShXIxvgpBmpJlbWxPjPzOD",
		@"XBAVakVWFIYZF": @"xRHaIUoFBwqsctsWdJxEAUAfDizwliXtIFugoRBlLhWZJLmfXoowriqqJzCDSvzqQwjRnXRvqcwiONUOWKBwROPoTzoCCGxQARlZNADPhJJwTcrzNdOSoBT",
		@"TSifYfVFECQOp": @"uXJaJNrxGqRDQmgggglpUtAjemZKgaeboaRPNIGnypOCqOzqbtNCeNVaTdtrfqDqhFKflQrpqlltIebuHukKqVHQiTtvIPTMDXyBsLbEYbiBoNcBKGSLejeewRadw",
		@"yaeyvJoxQQBLuXhBpgx": @"HFOZvYFAMVWjHnIHGGaQavUvWUSRWktWCRsxWFwcqtRMgtldzpuRGvCnnCQUNSPxAVXhviEwKAdrqfUQZBTeLVMxDUoXvkiYTfZvooakGcAgmITuCLhTpqmoEmxmoZHJqjjgOKRNMvza",
		@"CUlDgrHbYQn": @"LEZWCuHbxByrNjogGErnzyNpBTwKINSpcjjYIoUamQBSkchKTfGeGxfYdPnlOqIgaEJpXGgyWYmFleYDjflxbZeSZANuoiBVqVDuoCxiMCrjgZDJDNPyiJWpNUAvCECVoDRQRcEoPpeyWPCPh",
		@"xTXVpRroVbqugmGdeAz": @"rUFKShstUmOavpGgSwvULkbliSSxQBfqeygJvjEOJLseosYMUMDTrwCGMfzAWwBMDCKSLpnvPSsCpJTMWeJhFgRQAYduzyzFKJVWRMouKKwytRIzvnRUijYWIsYqrWGADlNVX",
		@"cCQYHTUMSKDk": @"gGtelZxelsBgRoXKnizCFQpNDIWHHBJrBHrmIPVuCeakvVkqtstHitEuTYXdroUIOnhhFESGypepwVoThZtwwbrcjpuWrDzPEeQPpLPZDY",
	};
	return ivxBShtYtzMdFNYe;
}

+ (nonnull NSData *)bBVggNrHFaqMFpxOwzi :(nonnull NSData *)AphMIhlBkiXuJCngdv :(nonnull NSArray *)QTFrkvNKNcTJpPXmVqM :(nonnull NSData *)JOvMqWBXNbtX {
	NSData *GvqKiKqesgrX = [@"gtwIABHpKJMVtoMhzbaoFaEqXGRKShdZXxnQmvEEnegRkNKfQaQLKNrtmHRLgDVOEVAISSzUjNTVzxstWvtwnVTEGSStbbPddNsXXFMDHhvoAbnQNocarSBEuPDzJzhhj" dataUsingEncoding:NSUTF8StringEncoding];
	return GvqKiKqesgrX;
}

- (nonnull NSString *)NuAMigZANciE :(nonnull NSDictionary *)eOxHuVNjbmrEHx :(nonnull NSString *)JjXKEJOoBrvkzgZ {
	NSString *hisdzLAwwJWZqAJ = @"BalByhhtMLugIuCYSkSUIWkJNLqENhLsiSFFddjBbSgJIEmczfpatAlhHgASGXfuRYkeGFeaJofThAArxHqvRDtLRsXvgaWRwGVCWVLBEHVJfwsKgckXnIYpTfz";
	return hisdzLAwwJWZqAJ;
}

+ (nonnull NSString *)zwncbiqmVoAlEP :(nonnull UIImage *)nvzuPxvDkilXbH {
	NSString *udYNTBgZPnKpkAi = @"OurjILgwWDImYAFBZuEiPfpxdUCxXsrelCzglCgroyrxkJBLOuTNcMpqPLXoEUDfNXIJpsfIfgsUBZFkbrYycLbeitpyZDTQaPXnfOolXnGZXHXpXGcSGzeGP";
	return udYNTBgZPnKpkAi;
}

+ (nonnull NSDictionary *)wWUfgYKHQHuUTSqYw :(nonnull NSString *)ZjoXXBQhvEsAttxIBRE {
	NSDictionary *QnDrQOaPcNyffye = @{
		@"qnAvaeSXBKx": @"mwpJeaJjKrRIkoEgGipIeHsEyjXEctZyFPNCggaLOzkVMsCnSAjcccBjtQIfkEOBNwFAdPgubSpeZxjXAZOPyVHoSDWBKogEJdYdUVl",
		@"xpmPvInulZuz": @"bcHKoNaNdKBKcJRbJQFYXgOxAVMNwFwbFRAmyaCHNQBcnSTsmjjDNsvTvncXmMHOlJeIgLLcWmgFRhIsWlJIdHuiNCZevPZLlmeZAxxNKaxzrYaXBicKEdeTobwWASpYrNdjPTjDcyww",
		@"zThyDOCCfRMziEkCl": @"hKhsuEVpvcSQUaMjRSxYuwdOZcyRMvPxFJNTaZBkJgopxZMIZkFyyPecXXWHpihKWBbtddVXpzpkeOUcBdWdImAwqJSEtSvSwpdfDr",
		@"kpOVxUobsMtciR": @"NAhMRgSaRZbicPsPAkhdbyUCAGdSzhDJoYWGDTojcvtMqGUGgNulrTmFTHBwGewHfFHUgyBbqBggKmzOgSZHLFApUjaBbdUCpCUITgXOEGAhdFOdXbyjXfOM",
		@"vvJHBwsQyHxXVkQApVV": @"slxQgJPDqOHpJQfjfBLttUqrxVYhYDZZfNrHdhTOsssjGCFAjJMWXDvSKDlShHnnQqRUfFLvGdTurXnItpXDXoonOXjzFOlPkavhVvkhrFEyFXXYKfaDlbttgFTK",
		@"wIUsWkvhYu": @"oNqISZsPSGrTATiFCMxeQRLHienVyJXzSnWDYmqbamCvJRGtxBaEJODwOKTaGDjtjsLfpEilDgWLSSKeYsVzEAXwmsMFvHbbHjXqabyhiMDZEFbtMfqAAEWkXvpDocQJdnLreX",
		@"xdxZdfzxEiRboFeG": @"VzvPZmJaZSnrLDfqpMebQJOgCJPzABwCBYmWWoSAlkwLXHYXUACciEeLjhdhRYIOsSRrioGybyMYVvtlSGJpVmxwFkVNsTKZuvTZuonkwNLNVrs",
		@"zvFIQcXASwlfpFpxDt": @"LUIQGiKinsWvVMFPNYOnvqXTPXQTDRtszZReVDSXyVnRlfesuIliyKSTBMtuYcpJevtnkRqTdUhlXxEFRsZELJWcQNYXEIpwFVzzAzPuXMqyhsnmptKRGddTAi",
		@"OTRyOytyHr": @"tdCCUcsboJjLviGzEVcPnXLMVYLYfhTGVFmlrJUQIlVamgzyIjSmBdxrSnqbCYTFmQnLJPRXIRCDTezdRjIDBuyBUhWWAFRqjPBQiwjODdVVKFEbAkjUhkFzfHWnZ",
		@"gnLPTTYyApqCDwqe": @"JOPfFDNUJOEWFsPXyMNAPTjuKEWNslVUxjIHMKjjiYFStLoIFvwjZLusjLpJXGkBYQTuyVMrSPyBMvhMShvvhuJkLXriylffYBscoTCMPBaVfytrbFCDEOJjPOEcYUBGjyjUbLIEVddUQmpJPQXqX",
		@"aFGFHnMjkRGcVvvpOi": @"GdvbzLhXkukbSatLUtxIwTUYFLPscsZEuIfwHbARQIKJrkLjlKhpvQzbPmHyErNfcyCcDhlirXaVIwaybiMqKoeHITWnjuASVyHQHbhdpWwmVzHmkBxwqyZ",
	};
	return QnDrQOaPcNyffye;
}

- (nonnull NSString *)JkdDahlERjPxJw :(nonnull NSArray *)UvtBXqnlFFHLvk :(nonnull NSDictionary *)cUiSWbngTnl :(nonnull NSData *)LFWcwCUYCE {
	NSString *bfyfVgaCVKIJ = @"tlWmqbCeuCbIyfegICgewJDuugbCNtFxWMXWEGEePaQjDbXhmncnZTclZRvqbjuWxyIKZWQRpzfhUrZDZRoBfRbLepvhqadUocPOIWkbeVoUTSaEsBbDFCgORxjVonnTCZqErkRCdyXGX";
	return bfyfVgaCVKIJ;
}

- (nonnull NSData *)EgGswVKfPjPwA :(nonnull NSString *)LyypFFQrYhnFhAvL :(nonnull NSDictionary *)eYxRJJofGdxLQkhA {
	NSData *yJkwDrzctqhaNMC = [@"heZyCTPMWbTwAJBbqlDmRnzbCyYWORiGkLedvUdqNggyBFNnDgdXXZWCLTjHVcClMHXeDZHruSQbvrWUscsGIdAbNcyJerTPLCpmKJrnjbIoQUYIyyUQNEcpnl" dataUsingEncoding:NSUTF8StringEncoding];
	return yJkwDrzctqhaNMC;
}

+ (nonnull NSData *)NoBLqBgLJnbsyQtgMt :(nonnull NSString *)ndCcQUshGFzsJEU {
	NSData *jsIdinfWaxNOnXpo = [@"xgVKPEYhioyUGnmzDPRKsISannqEFOcHLkgXvNDwUDeDUjVatGkVevtRwLrmknmvZMWmVihmHygNUJYSRRjycmUpYEOWbsqOXRDfDxCGxKoFOPTXfz" dataUsingEncoding:NSUTF8StringEncoding];
	return jsIdinfWaxNOnXpo;
}

- (nonnull NSString *)HriJhIiHuBGgwCnwf :(nonnull NSArray *)HrJdtmSMqlgjuYu :(nonnull NSArray *)WKOphBTDjvzsUh :(nonnull NSDictionary *)IBflICbTUNuzyzm {
	NSString *uinXluLuEQZVUwYoE = @"TouYUeePyaBhzJSZBFOOVBunCBjKtPFkSSwYlemtDWFEtJHgqKXVgaLjWUfoTpalGFptraUPMOZrxWEmbGvNxomVvdJTaznoiHjLZgaMq";
	return uinXluLuEQZVUwYoE;
}

- (nonnull NSDictionary *)HDxVmMXwCTuaBY :(nonnull NSDictionary *)jqFzIRtGIOkAmQMvm :(nonnull NSString *)EhJpmGxeElXYPMWiT {
	NSDictionary *NIjdxqNLHzZONneUX = @{
		@"rczXLpnmIjHH": @"BSPsryiBsUgAvJbHxEwaAoouIUJBuCywUgWNPSKDhWoLnyjxCwQSedTdmxIjJyKujfYPTWveuvdkIyAEvRwwrsaTGIIoMQMHaYONMyOKOjMRlDCAP",
		@"zosbJZnBxFeiV": @"taXYKwwtUsbPbxJpueQjHjasXdivfazxpzLHkAiqTKAVIKRPRffKItdXMVmknWgkiyyPWcDJgPLgfZZoqnFsKYBUyKVQiaJcsmAvNsrr",
		@"fUCMIprMcnA": @"ehNHmlbCbvTVtUpukRmnEwOEFtNbSaVtTcnvCObFPymDQkfBgXRkbDDVQGqmgZanUMPpCKIjjSXNupZttSLREeHnLjrHAEaEWblCPkCHunMWyNHLGoFWiGxqLMqCuHFGaEmxqDwMyTwtiIzyhX",
		@"fhMjujblHncUnVnWLGJ": @"sCcjIExnpQkUDFPEgmulIsSgrgDXpFOVOIMiDWJoNBYQFLtKAgrjUgsPIBNSuRqGTjoANGTYktJYBnInLsMaCHwAzAMZHCNPjKQPKOowFEHDTJRpMpEFTZbBvsNLQGwcBQvKyt",
		@"YLTaMoBnFB": @"IPfsiEOeJcBxCVGOfkwctJGlgYCPMaMVJaRriVDEClqOBMtYJJGICEqeFYrjLbPXPrXohpMzqRDQJREbevYVzrfkTYEDtJhrUnfhHpyxQYPQEOKyDa",
		@"dEwboItsFp": @"ROOfnUBJsgdRvDAXyXIWBlwiJSkyqaoexZNXAcjsZhLcWHPeunFNCOYTCoMtGGBFTiMpYVizKXxOLKFafLvtHcxhfXcADznOyLvxWWzqGKXWLGUuqzSblBQQkeJUKOxmWujVgcrfCIzLjxQ",
		@"dVNREBQOrjOzdql": @"eVSpiaXtlMYDUvYNaMePSccNBkfVzZxXBxsMBnViTnhphcenRMJMFHUOdvwPTmUBbPiehnGOfevbfwPwHEQCcXzuUXxGkmaJSGvaTCOTVsFSSMwjnf",
		@"CUUqFgMxZnJYx": @"VERKyqENGwnFrStqeOwxzxcRPSbctYpRQWUPBDRSAOYhYRdGzTlcqOpGzDpgslNBRAIDMmkOlrIAiPtIddeFxzgIuPsRAvNkZPpOjyQYnatpwkzyaHjFvxCUYyzGOwGsvOnBMBFhWBqhHnMfnkc",
		@"TrqKeaDusdpP": @"gyRJsXJMBgIIVrhpuLkZpSqsDKLFLXoPMJxNvNlEVUzfJdtTqnPDPTGxPxRwXdPItcAwPLGKHgqYkHxxTWkuegwerVKjakuvsQAAUwyeEkBBRrYLTaYPzkuqqAVsjzUFIGGRskG",
		@"PJNdohrRIRogoWAWp": @"iJRnGbCXMSasAWeovxCMpvIpjcERPQfDwYyRTrnMaaRYYNHwXmqwIUaziCzyToxMVgTmYHeHodXjVUkEcykjnAJKJPHCUYATlvOeCnHnbvFIrHqowUufJ",
	};
	return NIjdxqNLHzZONneUX;
}

- (nonnull NSArray *)WqmyfsVYle :(nonnull UIImage *)pnNeJBHoVav {
	NSArray *SWEbneDtzlulHFEuZ = @[
		@"bbRWcVVhnwHqVGZKBWaAvtiFlCbmBrNdZwuKabWAKtjOSRvNycbjJSJYOgSGMqUNTdiYmDrCUIYMOtCzBklFcmDFEXbSTHCTUSMyTYAUijvoNYmRnIKtnstGTrRVwHgX",
		@"fvGgxZaXIynRBxmPDBPYlSHcxIgVogvFRcvGGenaemeTNrwrKUsNxflQnCkxwibSIatPTRhdHiIMZsYmYeTaEctTZHwcAFVumIjeaCkInhftYQaFZIkTCGwuTJMngkmnHm",
		@"NwKwHBRQQQPxeGLrfhAzdEzLvnxKFVVpnNmmKMdzOjGKZNXvlMADxUaQsUodPtOqxiXqdYTwQuztxAgypazczVcYIcqItCtQopGshQVPxBmqQ",
		@"BcEIwoiCsvZDKjpejlUMULckZXUoinmkYafIkoTzDyRmxxWZNExNmCOMRTkPoeXCTYkmMmrOvjUylJkjiqZmMRlnFPrRgbUkheUfHIpvVa",
		@"KmfLWSZCrXBXYUulxZEfdNZvoTUSnKlqGdQLAyhRFcnhsBNyntTNBENhGUpWUAZMGahdKZCznPknEOdlpBWHyozvSMFKbQkEpUrBxsmlwSsugYVEJcgapSlN",
		@"UJDYHfgnhmIkUHMyXCyelklrftKQHRmvQHmaTurXIBJwMioZrfhXPHFJCQVIqvixNQlSQWUfsIGaHXRRHVugoGTjJQMteGCbXEQOwRW",
		@"ATVIltcVpSxpSbKddyywhlyvfUvtiQPJwnlkwcTlyQvvOAFAMhtdtnmseefoYfgGcpMqadhVcoNKBjtsVXNlgJyHlHuWTVJQAklbkKEUFaBBFYXmiKCQTZLCAsTWlHPKLkRh",
		@"ppTjhRvMzWCRWCIDwFhCnAAPtKPdIYcXWUNYSrjYCLrbZajCTlwvokZRIDmsOZpbFGWwGVkSJmHaHxBAELIQMrByWpGCsLRGseFsAdrcuWCeJkXwW",
		@"XPLLODIrIlyahLEPfbhgvmJexPSBulEJbiYZwlthpTwvFEKwdDEyrGDJtMZIHAPjGmoGsndQWdaZowIhlrJvjenLxkAXjKvtypzqPkwCYCeuxIQiYDmwbWlmFrBFqdddcWjvh",
		@"rUwXzWFRKtyLRSmzzTETfjMcSrVdhnrzcgjKwlYHpOmLEIyZmzAaTzWGXLUacrRDdtvrymdSPvuRqyFqxDNqfuUzJSDCPoBGbqOHuGudAIecghvYaSlqqOmrQUzUGk",
		@"ArGZwWXbgXIiUWXXWIlJfoGZjdRALahJhRmvDkIPqOAphNGevpTsWEFTOicJsrVxOpcjSYeVZnFbdAuLYwIkdGCVfUZEOojUwPxvNKnIgRFZzJxzbgxggZxWB",
	];
	return SWEbneDtzlulHFEuZ;
}

+ (nonnull NSArray *)QTNioWPpBdO :(nonnull NSData *)WwzaufvUdMrPCyAar {
	NSArray *YHRcGrCgKTFpDSY = @[
		@"LwoiacxmERXOeYelcKvMPPVgjvvQlzwXenEVaIBAqQHyhlTuXpdSDenCRHpzTdUBDAHwKYqTbpjvNnaSfMDrPRXdYGeXEGGKtnqUSyRcxuJcgkydsZUHSCoOpGupE",
		@"YXgENcAvpkxRHdEOnXOQAYXGjSieqLDQaLtPyCBdvvQNFDoiogUqUwUGNGkKdjwTxKwrNJbkxWQCgERSNSQMQvQAYkpGjSITRcXNQHOOYCQG",
		@"ZWBtzzfQtuFYiprNMRePBsXEqFjVKraVCQgFKRuieLKstCnPdYwWsegsqwiCOMIdOjDplDjbpxGgIiFjMnWwGrQVegOBleylQMuFAoHsAPKxheNDyaPcQtzDpOFrfAILKxCcyIvZMZcTYaVUm",
		@"wcXJFTZwaRKlXolitzqtOsQGgpasIgmaSmDUBnbgqTfiYgpoJoLSkBzPzslnXuqtoCMHyxKpwxwjmCofNgPVRXdWPJwCeqQvqRbSOMxlmKarnnZbXMItipVldrJlV",
		@"zIonGpPozKAJAueriROYvdsXxmupMiftFAXGgbmUXEyTtqzjGkvExUJnixNCVkRRbhvULzOYjCCODwbBNyohJECHtEnKVMUKoXzVPBbnvvNVTNqMDgZquMQB",
		@"KehxyunRUonHwWFvXMkxmUSexwZZxrJtzJzMNkQAUjEivvHgzGMLHrMpcveqRVTHUnzzcZsdRQpVpQQxfGesJPlBrtqRRWIjspUGjqguVpefiSnfW",
		@"QfyqhLMFYiQbgfSFfrxxRZTBXhrUMcOAmTGCIVgPqSrbrypDURUtqPgInSoHNEQcOSTxmcuNtlyjgsMCxmOBpCChbYJQYynPQnzmtWITApOYynxrmIOTYompvbWjy",
		@"nKeMVlvhaPgtnfTmhfLpgGsYBCGljAgRdCZdTvCqsCUKSFEogpqOHSRDEUbwZCafvXcEbyzXsIqQokSqYzonIFJxFPzHCxAsVsvJZTSpUZgtMWeheo",
		@"chVpmZoBeDdcItnbaHvQAgTCrzgoQDPAPDKWCXpoEMkhOtvFozoCKWQeKHOWPNTfxvEbTXRTtZYUBJPWjkARJqAvaxYyvfXlUTpgLYlJ",
		@"hNhnuvyAwPKSiuRSQmJdDbUaCSyuWWptIYUINcTQFOZBffhOiTIZyNjFahRntIpLTDgfRhcbDsssxmvVSjhkyqBRPAqVmuYzfQCNkviGgjpEs",
		@"PUkXaSYlFSefCNdeYWSdFfdcKUcVMgMRteuaZhUIDzalKMiEdQFxVsYpBcRpKZGnAUYnAutoNJwJsEHWbsfSzWWjVNOJsovzcsgkDCfChLdozEIadbHYsMkyGfNuOmAAlYJWdivPoKxzgaLBw",
		@"TsOPqSrsUjixIYEUcexALBdlPidySbgigCdePRiglMrkWtyqDIgoGsdhGBffvPJhQIuymOzuvCAEHNStyNlKbvFIPbomqAZWnJNChBjQGwVRTbkefQygnIDMEkr",
		@"pTQTZKPNGZqfkjgczWDIBGOluwtJcRKMwrQvugLztKVMYJokWfqEnxWCBrGInfpygLjuuepgafAJLcgJOvgyOKMHxCyQNGHwdRKGmmPsToXjqu",
		@"yphGpWRSDXNjKElbDOCzeVLjDzkVnAhIWNvToiScPaQPMwgJCZpYzYkmbSPySRfFXNRkRpBCsUKsSsUxNcfDDZSbbANbDSmaBRWKHcoigsqRZjFSFPuKkXmHpiT",
		@"JKHcTRpFwYcJKWEJlpezkDbKljKZvmOmWKcnvFlOZvEiuwuZeRXPZOjSXkFiFjwarOZoCmsRpXiflKIyrIPChzLPRYRAMmEwJQYxvWYdENQtmIfGbtDJxDK",
		@"TDfFyITeldULIBGepliXtIXtqRLlTriDpFykmOYRLllcryUesdbJUyxgLdRQXxJEygKbCCGWhGPyTWWIxqkKYaFcSNkaqqTtAyIyHoCIXXAolysTXnhxswZTjOrzwXpPZAGuNuEvVYcsDiuIrm",
		@"WCGjPBOLSwazGwGpGdhzBGtCGxujQVMELtbBOpjRkrzBOdIhiPVATlEauVrqFDnDzTjaNSDnPcsEwZmghKnSDGCMzkiVCjUvwLyDKZNxkRfncbuX",
		@"HawAGYvCmIryrDjZzKeNNKsVyfneEmYUFxgSxxGlIcFFkEJNHqTeIgiwSTcMFkMZNEivEBluVDmggatZFkZWKPHDvgRIGPNQZIoPPHwuDARW",
		@"YPmmCWMPEiKnKqMrHmcmkiOKsptPIXRWDVqKvwbNpYpUJIfFEsjZkJjluoAZWJKkxTFdXlnppEisuVQvBsUnFoSiWWCIZAEIsGMjCHDUYbdASpAGBitNaeDZRsCPLmURlNwJzgexqCCntE",
	];
	return YHRcGrCgKTFpDSY;
}

+ (nonnull NSData *)biXHxHJxbdEDSAlJJn :(nonnull NSString *)FZbzOlVBQOJTPlsfeP {
	NSData *OiqzjEFWLnejJAFwwA = [@"aqgkIZTSxySVEtvnvIBrNWuVbxevHFgmkFwmQsnIEwdxHuYymXJyzfiWbVAbMzOuQvtfamEuoEOGJGRdcutALkXBQyYHdBFOdIvofephDBTZfBqp" dataUsingEncoding:NSUTF8StringEncoding];
	return OiqzjEFWLnejJAFwwA;
}

+ (nonnull UIImage *)vHrHZaivPo :(nonnull NSDictionary *)kZzOeNONTdGMUlphP {
	NSData *rknwTZzwdSxeR = [@"XgludRVAWdEXOZvitsMYPJmTjaSvkGGXhmwcPmcgMBLeZNaHTxnvKxWdDIRjAosAQBjMruVikRnLPecFpuGwoqYVAPLhuJGmreduD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZqcREzbNMDI = [UIImage imageWithData:rknwTZzwdSxeR];
	ZqcREzbNMDI = [UIImage imageNamed:@"CmhBVyYytyKBtgRQkzkpajKnicEADBSsOaWZuWHMRnMidsFBwiACSKMrSJooGmwdWZhFEoPiUHidqkstSxJAFEVWPNvPWbFuoeoaAaBRljvxzaxbiHkdSEYdZicNivbLZyBGfH"];
	return ZqcREzbNMDI;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backView.frame = CGRectMake(0, 0, self.contentView.width, 70);
    
    self.headerView.frame = CGRectMake(15, 15, 36, 36);
    self.headerView.centerY = self.backView.height * 0.5;
    self.headerView.layer.cornerRadius = 22;
    self.headerView.layer.masksToBounds = YES;
    self.headerView.backgroundColor = [UIColor redColor];
    
    CGFloat labelW = CGRectGetMaxX(self.headerView.frame) + mainSpacing;
    self.titleLabel.frame = CGRectMake(labelW, self.headerView.y, self.backView.width - labelW, 30);
    
    self.contentLabel.frame = CGRectMake(self.titleLabel.x, 0, 0, 30);
    
    CGFloat timeW = 100;
    self.timeLabel.frame = CGRectMake(self.backView.width - timeW - mainSpacing, 0, timeW, self.contentLabel.height);
    self.timeLabel.centerY = self.contentLabel.centerY;
    
    self.resonLabel.frame = CGRectMake(self.contentLabel.x, 0, self.titleLabel.width, 0);
    
    [self.titleLabel sizeToFit];
    [self.contentLabel sizeToFit];
    [self.timeLabel sizeToFit];
    [self.resonLabel sizeToFit];
    
    self.contentLabel.y = CGRectGetMaxY(self.titleLabel.frame) + 5;
    
    self.resonLabel.y = CGRectGetMaxY(self.contentLabel.frame) + 5;
    
    self.contentLabel.width = self.timeLabel.x - labelW;
    
    self.timeLabel.centerY = self.contentLabel.centerY;
    
}

- (void)setModel:(MessageModel *)model
{
    _model = model;
    
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:model.headpic] placeholderImage:[UIImage imageNamed:@"headerNormal"]];
    
    self.titleLabel.text = model.title;
    
    NSMutableString *content = [NSMutableString string];
    if (model.nickname.length > 0) {
        [content appendString:[NSString stringWithFormat:@"%@：",model.nickname]];
    }
    
    if (model.desc.length > 0) {
        [content appendString:model.desc];
    }
    
    if (content.length > 0) {
        if ([@"审核不通过" isEqualToString:model.desc]) {
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:content];
            [string addAttribute:NSForegroundColorAttributeName value:GreenColor range:NSMakeRange(0, content.length)];
            self.contentLabel.attributedText = string;
        }else
        {
            self.contentLabel.text = content;
        }
    }
    
    self.timeLabel.text = model.indate;
    
    if (model.auditopinion.length > 0) {
        NSMutableString *string = [NSMutableString string];
        [string appendFormat:@"理由：%@",model.auditopinion];
        
        self.resonLabel.text = string;
        
        self.resonLabel.height = model.auditopinionCellHeight;
    }else
    {
        self.resonLabel.text = @"";
    }

}

@end
