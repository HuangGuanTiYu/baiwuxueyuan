//
//  MineCell.m
//  MoveSchool
//
//  Created by edz on 2017/8/21.
//
//

#import "MineCell.h"
#import "TBCityIconFont.h"

@interface MineCell()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *nextView;

@end

@implementation MineCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.iconView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = MainTextColor;
        self.titleLabel.font = [UIFont systemFontOfSize:ys_28];
        [self.contentView addSubview:self.titleLabel];
        
        self.nextView = [[UIImageView alloc] init];
        self.nextView.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e614", ys_f24, AuxiliaryColor)];
        [self.contentView addSubview:self.nextView];
        
        self.sepaView = [[UIView alloc] init];
        self.sepaView.backgroundColor = SepaViewColor;
        [self.contentView addSubview:self.sepaView];
        
        self.newsLabel = [[UILabel alloc] init];
        self.newsLabel.hidden = YES;
        self.newsLabel.layer.cornerRadius = 2.5;
        self.newsLabel.layer.masksToBounds = YES;
        self.newsLabel.textAlignment = NSTextAlignmentCenter;
        self.newsLabel.text = @"New";
        self.newsLabel.textColor = [UIColor whiteColor];
        self.newsLabel.backgroundColor = MainColor;
        self.newsLabel.font = [UIFont systemFontOfSize:ys_f24];
        [self.contentView addSubview:self.newsLabel];
    }
    return self;
}

+ (nonnull NSArray *)rrjaRiGRmAVvig :(nonnull UIImage *)pPCqVTGnSXs {
	NSArray *ZaIGwNnMNtJPRJy = @[
		@"MYCshJbcsNtelvcyYxRjfpLJgczXbNPEAzhGfOrZHzyQZNRoMZxuHshSZJXilZAnVapeNEKiQZsFVojHqQeUbGQisvFEcOWvidbEnIZqFzgmjs",
		@"KOQGrEGXJWrFRGAJyUMVGkQxJLsyurXYnNryEGhDGvJDJdyjGgrOvdbVSEFFfWkNVpaGGorhgIFMxCYYtyszNkKidEgqMdERvHwwPuAaMEVkECXZrVQmsif",
		@"fAHfwOoAvYNmWkVifKWvgtIMwmUNPPvuekaDgXBSJySmciHlcWIOAVejWfmfkOOTsWrtJyqjqCsGqdfXAxCgleuXAQQUQtasiKDcbbpLviNfty",
		@"ZQayDZdTAxUNyQdnHFxVAdhxLlCzVuzsBksjpwWfAKhLDTdJZgvZTkiozbgxlmoBenCNkjsNLTxKCXlaAHNAmLYuSsonedkcJXcnOMPCjvEvCeySegOTVrvPlecHylZAAgfkylqJSTxf",
		@"RnFEkZsmBoTFrMLcLYuulQnfqpVjMcOJaSuyEHLioTHDhumifYfGwtpOXVWlHsAUWKdEBFOcBchAxKdlzIiGHIMNkDgApnXOOgGlvjgEwOoijCcnIkLSyhpZUXO",
		@"iuaLMSoQYBRoVKylxyOmvuGRLrImVxlxUrYLFcNtGVswFhIeSuINadcUtSeiXMzuNQHxZmfWdMVoZUsCCnEDejKEFYcvuCOradrJrOcqyBvYgiouJSVwHtstUCrMRAlEZXqKnmGaizVbyxVFboSaU",
		@"WszdIsoKwjtsVKtgtyZzjKXkXqUYPPThFscQgufqyRVltiTbGtxyLXLXVIMkLubzaMontuTIlAtdyIFRvNQZEEJhiKvYPsmmIdNjqYULVlMGFpWhlgeXrkusDBNEKQjtA",
		@"gUJBNEyJpuxznBlOHKpXgARVfzAAdfYbCdhUAQThZnGbWSoYvOtjLoDyDbUzxmMaifDjejFXUtQRMrIoszuCHQYnILOdqclreLLqELMOpIbKgjYqerdCOQvpBpHVFhGRvWmvYfVflGAEHd",
		@"WWAChNqBPsUztHNQNfUfiXlnWFaDJFikixUxjdeRhPsJciMzTdWBQnScBwwRmUKxnhZhkaBhcTrHAgoqPxtNeWfwvLluVdlGktZPLYDtgfdyvRbIoqWegIQQDuOiZSBUCStXcEgUJNc",
		@"tlCpbltrRtplPDUVoFJNKOrgRaLbWWllvOoNJKjXfiRLvWIvFyusaGMCFrJxLCNycJTFEfkNqeTAzHIGaQpImMhfysEDKfTNsTvSoVkmyBhGHKXDAtFpfTFJMAspBCMoKSvvOfbZwqivtL",
		@"levRuQlAVYqdLQpdzUWtPQdiwsMKxUQOQZSNhTyuqsPTgOMWNFwqIAcntYnkUhuFtzbrmTkhNsJvRQTtRwZVoTvIbLAUPAkcOwdWGvlgcBdikYGXacEiyzchJxbvCoqzTzEYB",
		@"DBUzDgSmwlyFKwxwBeRLefmEIPjHRBmpxPOhOsHpTetTsCtkGOplMGdQtoMrYYQldcuSLZdhSpwmLzpUBUtXCyATqztfQHJzqZPmDrkYprkokWPLrbUumckkXuWVEwaErhVISioWDy",
		@"wlsEyFFTDZEKoDwCGkfQEjMTjfaHnKIgIyDkfwBdtxMWpAviFNamughUNWWkDSuMfHDTeohYsxyQqQtyYNXpFYQDRQAIWnarzalmO",
		@"hyLRgmoNWfqdCltbsUwdkJiNCviPPpJfhTSzCIZHsUSKxnqlRxGWsEpZrhFxnFLyLsiujjpYpNSfTXmQIjpJuoSVVKBRiEhZEbbqrrIILjMpyJivDxIdIwXDseygZF",
		@"qvxjGWvZWvOrKTxKjNTXqChTvTuaxldoxjHlsrfswwbkGQHVOkzzyQcbQvytjrdzSRdkTFSAXTAENTtPBnLGYWjMrhGxQJWruqcyhsiZTtfFIydmOVwztUKbtXTh",
		@"orDXYvbFidJfPiLbONJyQAVJGkIsfhrUCCVwQxICZTsDaqXgZBvJtEvdubzjsqKOWdVbCPGyxLoRmDXWxiECGveKnpEkDwebuHJrcRtDzEULmwTncTtHUpEvxoSPglHPnRzr",
		@"MGhfyEKMIpLmuZcauInWBeVFLKUDwDBmAzYZBMNIqKnoLQQJYjbqlvjugAYlbHNBcjnTKYlvJTAKkiLqqmlBmBACyDvIphNpwCeWdznPBctoEAOKte",
	];
	return ZaIGwNnMNtJPRJy;
}

- (nonnull NSData *)dYwLNohjRCZ :(nonnull UIImage *)YSFKkKHrLiVqkYsEO :(nonnull UIImage *)jKRPJQqeXxDrEBxU :(nonnull UIImage *)uobytMGDpDLhYyG {
	NSData *ZokSDtgWCy = [@"aLoRWuVJljwfGEQHrhzIDdveWRBQaqybKpDumepibjlkWelefxpzEXdiSDpvcEqHNjKvFozrDQawDldngJfkVnEoGYiBFaBUoFGdmHuDxSABqMjRYdWZJFSJjNahXjFULGLwwHzEqJmrk" dataUsingEncoding:NSUTF8StringEncoding];
	return ZokSDtgWCy;
}

+ (nonnull NSArray *)olyHuQWAVoyV :(nonnull NSDictionary *)QAoXRCOQuCxm {
	NSArray *ECczGumPdybRLnQwTF = @[
		@"FkaVOSQqfEHExBRXPzynIsVFECHBvkEzNfirCItmbDCUfQYwEBZtFSELuCjlhQBOvCeUgaoxVsTHZkEwhjdipRMZDYylbCOYxHdQPxcjl",
		@"BzNodQdmrsTipkTgiuQeMoTRVomdBOjVKpZZEkHdNrcYlzEeurRQmZMYiItUXNEVYyZipJzFycVYiQWpHhQFXGNaZerLFTIgvZtxRbURK",
		@"nDJloNHlrqygWawyqFpMCRsEavXBRttbhzKsZkeNAWSIEifwMJptkwDWxyMWlUSPVCrwXnbVuChlPUFgTpyTDwIKuvXbyVQkKoYigC",
		@"tSjelXUmgvnKPElyucMGvAKUtJmcMWZrjyteDjkKrByxPueVOZHHYSuTLMjacDPQJRBWKwOjXGVSxfReOrgysWInvaEZKwEnLEBIJsjoITmuisyYBFvwaLuMlEJhtkBHVRnU",
		@"cYpsjwURGyqouHApgsBLWtfLmCdGnwvlCmHGVQcLiVApyBJvEIrQhRjatHkziwyrsihylHkqnyeqBiXJNQttkFcuZHzJhyfqswxVYwzbUyJohqy",
		@"ShdksuzTNPaaPzlQnpmKavytpfzldsBdwYljzvKwpHmEutvbQkMbcXHCMQPhVUOWOGtKdvcQUBlwGBnufRUiYyjnLwIzzbLSuQbMcDxbIPjtgQRllaihRAJXOqIIJhdBhabAFOALdEKUWayHxu",
		@"WsUzUxXIiHoETwmDPbpAeasWunRdIDgReJLEIOpLFGlDfImQtGSmQpyElPPKBQidsZQGaRCNfQDlwVsTMFIYlIFUYJOczqYxiWwnNoQiqlRemMUHCeEjyYwZfzIjCioVCI",
		@"TtoRgyfmzUAdyLwZabihxOctoaYbSXyTTDoEJoEGOALmryrOwvFqoMXftycaIBYkIIaUmJATinWbySwkfWNpIApJCYGbSaCRimAVjwDXfVyLcboTxNtyJFUqpBGEMyavbxAvOvMwDsbiQKJyz",
		@"kvPzjxBqTiFAuSfVuRczGDHdlgxPiNJsZExiClZaCKpOculipIPmKktqSQRGXQtpTVdseedzLVsEZQLPhKZLeMRZSZMlqrNGeQBJlhsUxyXkomR",
		@"aKkaSsEbxZPVgAJYgqkHODIRWBECZwTpQoURMgmXdHbPxsiRMJkHfjipphKFpULKjmlmLPOmNQmCfwllIPZSojUEfKzsqfQZQUrA",
	];
	return ECczGumPdybRLnQwTF;
}

+ (nonnull NSData *)EzczUwOgRhxa :(nonnull NSArray *)PrgkmSjpfZsp {
	NSData *dFdHEOOjhCJkBtyDrr = [@"vIRgHhzYDvWKAwUSQqJiGVrBMaEJXquMXnmSzvugvBNPYIcQoVSLVHqDpBvyYRnRyAJJBKhTOfSJVQLSDIQqjwhYicgdlPOmDpqbdAZyaijGEFxxjBxzFn" dataUsingEncoding:NSUTF8StringEncoding];
	return dFdHEOOjhCJkBtyDrr;
}

+ (nonnull NSString *)qEzHuOdPvZMLzFHH :(nonnull UIImage *)agxwelsWxsLFPr :(nonnull NSDictionary *)skMPSmMWsCwuvqPLJgM {
	NSString *ulxRIRgkeSizHZ = @"ymZgQKotyUpiwuRnnAbrznAuZnTqLIEmrdeEyWDqMhGjoxKHLHpJlRZnTXXPCKWUKihmdJDmIjsEpwxdhAqHErvhczmBlAOGTAgsBskaJWqHmZCndAUinMENOwgeIOrqCtLoIk";
	return ulxRIRgkeSizHZ;
}

- (nonnull NSDictionary *)nWpZKnfEpbSfSLc :(nonnull UIImage *)sWbGeYZdkSKzD :(nonnull NSDictionary *)CYPJMWWqxrUfM {
	NSDictionary *fEDEPKrzFNWkN = @{
		@"DmcbuMQaNFb": @"TiFpmiwAKvhzVVIVLgiglbtDyUyNOMfLTWNqEPXZvtTjTVwTNvseeRCRsNnHWFxcOHHjPdwNMwtJJYKUAxBvAhRXTayslRdeCPOJYRc",
		@"VqHXlxBClbpfTbRCq": @"IQySoKuhxENLoPJzhuNjGXganBLhqXbcwDbmChZLfDntVxzSJHSabreUnnXYXWmiWpTTAyYHAPCyyhOyQGVCqlMldQdOVPMEjSFPXkWrfDaGbIoIOLKQqDQsZCM",
		@"sIFhOWXbxUHn": @"RvAuLbqkkigsZqoWbJTwunSedBBpaKmbMZzaCtSpxzJoAManLuBhFjfbYkAIjrisNKxbKypelyEwoYaaKrgvfOpQRFsiZcWzGinFrHGU",
		@"zONhHAtWgK": @"HXrXGTWZkcgqAKuzDkAFkebNthHKbVuQDVsdJADTEslHXcIgHpfqfENxDDydxlZLEhoFRdkrJOOwXpWueSxYhhIhNCWKNFYheyXiCBtpSwmwieOAaUMtmZCWNDMsFFYWei",
		@"RFJJbshWEdxvpWuvl": @"lLpAHBBVfPqpJrvoBtcXfogEvkxEpxdvWCgeEEdHiSPTnccuMAxcullqJgHzptrluuGMcRyOvhsmmBangdBlrlJQuytYdjCyRHQJjjLghOYRvtZepaJqtxHCXBGGIGAKMtXtxUukKPrvxF",
		@"oFUlRMZUvtgfSV": @"KDOdwxVfHGcDuitZKWpoWyKusApmbwCYPnkrjjBOPtQqjzHCsjmPEwziJIOwRWucjOZOPBFNCNLvErmWnYszsopeWuqebYQDKSvPjESIBonLuQU",
		@"PrhGWhrGqPgbyWjktIr": @"fORsabPVLyuanawOpFPcALmgHnEsXKPKJauaDzyMaEZgYzUpitlMiSHtRrljRsNwXvXVXwVrPfLqrEjBrjrVZlKKpKrOZJouAOTgSROvwSRmNfyLfZHexfashAJekcRnxDbbBNWziKAYMA",
		@"wDhxVamCKGNGkfTz": @"oQzKvignfiLLRYeQCracvMjsQfPeWOyDmeQTUdpCnnIRFTXXQDHBerXhAkCiDkuYYFYPSUwxvJnTtjLDNHCnFwaKdbTAvRAyXYmFTTNXnwDuPzSJBIYwqFdIWgOwqgySzCQkfrXl",
		@"NqkMvPPSqMhu": @"eJnrXpCsziFenTcuyLOLEViLcPfgfPnlizjZypLESXZThdEivPjNuzCfritQyBjaZzCpPSqJuzdpiViHfADUxLCMJyeRkgAzcArKBJeSjaUvMGuATAYe",
		@"yisEYXQqdY": @"vuwthtgBxFTmXyTgjKntqPlruJtfCsMBgijTuWInacDglBkNnDTFstYpEHfcDcbPGzCGmKPUuZspAKDMcLlxhPkxUqiQSgeBXUzRZiTYtZKisDpNOBIVuhwnQNQfcLvRyTTxzeYDSjzOleSVnYJ",
	};
	return fEDEPKrzFNWkN;
}

- (nonnull NSDictionary *)fssXmEitBvHnElHz :(nonnull NSArray *)grgfxFPOdPl :(nonnull NSDictionary *)RIoMEjrKNAsuas {
	NSDictionary *bgEFOfapsCCvNAJSND = @{
		@"iBoVerbDFHkcBfL": @"EPGzEwRnknDcglduNLIcGBgsGIXpfTNhIXoQRyIdhwHDjLkNKNQhTBoveZHNMxjCiqqrGFEJXxfltuFthisMuvwQbSQRdjNHeIZncuMZFQubpmEWMzRzrrGQFSsVFfCLKHbZyBluHlD",
		@"jkKOaOSLRRG": @"rFpWpVyrqzRKKeqcMTZeRLTQWAVyikNYnAHnjJXLQoREUuNQsgVHglXvYgqjzOonKMJlNXGjUhtBsYpfRcGyyWLdCvvaRpwywaYMAjaLsoTMRTtuALoXTFZnGLSeZucgkwSZzXpFzNkG",
		@"XiHdAQCjytnaBUvNq": @"qVXvXvTriWZpFFOoNcbcZCglVaUXAwHEuHIupBaHuMOzjZMSExJsbkvUZnwaUOFgevsZnjfINDzlpWTaRPbXfJjyhTWclWRXeNHTafdFOEWmTOGzZFaFbQqbl",
		@"GoyTzfiBlCKTSVVK": @"spDAPxxmLLKCDuluaOIkkmcWnZKOtxKwvDDVQWBjPUowRZArUjejSLULzjiMIvRgYldepsPWFZIjoQMnZQZRckitPbSlHNvhFnvszVWnYdSdnGoBmPxmPzcszNfrZMQFV",
		@"LyOQByYaiOXqU": @"hVglKGRXeXkhefJSsHnSmGMVFpRXKhdTOXjHBqhMaIjlXRfasQtBxGicnkBHvZPqnMQFtWoZBksSpPaKPXvKngqKeaFbMfbSiQqMf",
		@"qiJAwqfwWPYEzkMYsdI": @"fGLpNPKOIpNJvqKAuHMXhLuKoAbmmOXoKMfGTCWtVuPDFHodIliJrTgHPcIqmrQZrgkTIVdzsYjJfWiUcVrfMSzEQRTQOtxOgsVmifeLpkiQnSNVGlqahmSzUNpyRBxBrKRuUXMEAPCHffDHem",
		@"AlHrEYDvZJgUS": @"WnNfMwfdnFofLXBaOODtsronNvxoDHtXZajvegbWoaZwSIWUbzMJeIkNYDtFpzVBuXeTKPXAUElUnrFYrwSxEqEzaOtufbGskzbPjwnJqHVUTmeiCqjjNUoFMDBhKablfHAzXCasCnnXyUmwIt",
		@"qEOabKEbHFJD": @"unVMSdkAMmhLzKFFhWYpnVXHTGlkhxOsyibWGdbPOOLtxrYJruCPuOCuygKrqOJIReVHjTicqkAPXgWsOkiSlIDDuQriasggpOKzsLoFmbSpPtzVZWppPAqSHRvlRjbLlpiaUiNoadsiavopr",
		@"FSrfjCHZYMQWa": @"BqQONyHgAOlfbZwpcyleZOQTQzMSouQCaLWPkvTULpjXwjyKiNgjubxvwwlzdwknLZKUhecjAMZhCdzzZodKOpKWthIGWHhBQWQksQfrlgKOYNzIxdYFkYiRwfTlYErEVwzYYmOWttSNHsDuy",
		@"SLRpStsQFiymqaUNkk": @"OrHisbhgYlLqllZqjexBMwlHUaNUwcclixbFBeybbSQhZinABRQLRkCTPEHoHASFviTYLzlOfUlJTnrsYSMNPubRryUbbhkZbZfYILPUPkFVlWgPtJVtKBYfaZLrvfxGkvkWirucDdug",
		@"qEXaozQJZYAOC": @"RgzeFwEdotpbnkoORntTqdYXOYVfIqtRDncQdLosnaEsJMCATDVQojrmTGXAuPxkcGZrKaAnmSZhXGYkVRsMMmfdUavWMJgevyfACeLzvfgFPjDHOeFznKCITeusTBoDbGbLBnbYZwH",
		@"wXvzirorXpgNi": @"XRqwHEemwZjgmyZrDFpxFOpuDJBBMkmsJXkiIYKbZUDPzpaygalgMwecLNrWeExdeEOaYdvrflCUgxEJbqGMGbbzgRFsXDZgZOqpyJt",
		@"DTsxrSlPhJzLTGfSV": @"HQnXdGbJcyQXEbxjLfvgCtbluJpFozNqnhkoFlcAGhWqDJMOvSRMEBmOIPecRXAGsYaGMmQXAAkriEiXoFMbONkwJReATxVhzfTjvaSMzepNpWAYtgEdQWuNsqTKHeaMUjIOjhx",
	};
	return bgEFOfapsCCvNAJSND;
}

+ (nonnull NSString *)QHssMExvYkPpeTVE :(nonnull NSArray *)wTbxRavXLbtQp :(nonnull NSData *)abCDUeSeilSNSqa :(nonnull UIImage *)HrVSyziOfbnvv {
	NSString *hmTIYLHQlEILktE = @"BSKDXXTGAFLEbfZdIAytOKAVHVGFtiScifaBpEgisWLeBNikuOAkqWGCyTXvNhIdoPLyzpfScaODZAvfvIaevldLpKQFEBkpuQEZqIGIqybbOHkauUpRVoHNQfUgfHHhrlibgCHeiDv";
	return hmTIYLHQlEILktE;
}

- (nonnull NSData *)MHRcpWtgoUmksffzFs :(nonnull NSDictionary *)VXYtumBFnEbMvTfwDM :(nonnull NSDictionary *)fgHfTpwTnEjwnjDjP {
	NSData *ZhPqTflSMaKhDhPowim = [@"uXIpIoUdWpRJplJhvKaTUhQiroWAivIpgXnePsqvWTcXmCefGhMNjoZjoNDjGTgLZmHWtkUfxFOuSUpjlooTKvNbBFXPjagNbUFgJvkGiFDhDTIOGf" dataUsingEncoding:NSUTF8StringEncoding];
	return ZhPqTflSMaKhDhPowim;
}

- (nonnull NSString *)IvqXsyAWnAWDPbwFGNg :(nonnull NSDictionary *)lcHgdGQuTKSuF {
	NSString *MEMAlQZTuBA = @"zBegTAcCOAQUlBKKhpEwtiGEzjRdulIxvyHzsdkoRhtoeSheCDZEBnLdSGTHBAZbIShiXDPIKgHFaUdaIoNrSRNjpwaIhJVDCjVDTraUyskuqQgSVBMOzsJTgkjhVWyuoRY";
	return MEMAlQZTuBA;
}

+ (nonnull NSString *)TqxmJsujDRSnDaMkb :(nonnull UIImage *)AbYHGIdMqbJUqcJea {
	NSString *sRaCHdHrLfok = @"RrXMiNInOjLvYKixFkGSNHFNpZfinHcHMlBdOmCvaQWgUgjxeUKFJvYQxfXiAbieukhFFBYkFNLMTzFVZNttsEmJhvGOniyVRTfohkGVFZyzLkiGIXqkssfVkFGUFVjyQhyDUnEdeQ";
	return sRaCHdHrLfok;
}

+ (nonnull NSData *)LYRPCbZoDm :(nonnull NSData *)eyIwTtwtLLQXWScp {
	NSData *zoiNxNyzcXXOlFaNueN = [@"dDsbsajYVlhwfBdFulEAzYBvXRSbeZjNyElOjRCjeGbGJIFDXmUpVVgTwAEOwWtVntmyLbjKuriMAIDjFykMXyzjeHbFoOOphMGSeRWrt" dataUsingEncoding:NSUTF8StringEncoding];
	return zoiNxNyzcXXOlFaNueN;
}

+ (nonnull NSData *)yRLVUjrzTYp :(nonnull NSData *)SMBxkIGrcVVsNBHqF :(nonnull NSArray *)FjaHaEACBDB :(nonnull NSArray *)vDjEBjKXYVspfAhNGl {
	NSData *NPIiSqhPjKLsRO = [@"IQnVtYRELddaHxYOlYFjlSQrBVRkrIqnUbTMAfsTSNrWbGWaTgfWjybYRmXzPehBDrkaSaUBznVcvyEwXpuwMBJSCkKjBtMLYwOTBuThlqNsLLSPTcbDYdzVmf" dataUsingEncoding:NSUTF8StringEncoding];
	return NPIiSqhPjKLsRO;
}

- (nonnull NSString *)bqxPGYvqqIbMx :(nonnull NSData *)vUrCcEwTLOFE :(nonnull NSString *)ORWxsYuumCNF {
	NSString *RXocZDKHEq = @"aglojkoDvvBMMeiRkkThfHnxggcVyCUwGADoAxbXBDpFEOJCTuYPcVexINQmrISyfuTtZUhDYhsVgMKOvCzGhWfaKjgAzIFYIUBOpXzc";
	return RXocZDKHEq;
}

- (nonnull NSData *)YEGYeYFbrUHriI :(nonnull UIImage *)nWttrBRazneMQiOtqpg {
	NSData *bmizIaNveNcol = [@"qVTcPNtnzNAAlprdrwindzOBfWcKuPDdfKjWawBHvnxBLKAkJDHrYfEASGXkObtNUYujCuJZGbpTeXgNZOIWJhettNkPMFRiwXBpullYjJrSgjizZTqpIrKyGqxwuBsBanTWz" dataUsingEncoding:NSUTF8StringEncoding];
	return bmizIaNveNcol;
}

- (nonnull NSArray *)XPncaBIRqzXGMWPV :(nonnull NSString *)CYcQJyggFsJEgHAH :(nonnull NSDictionary *)beFoTWbXDiJIzbgxTLt :(nonnull NSDictionary *)KmVAfEyVJayKUAOLYpa {
	NSArray *ciqgxMBnSyWCamBj = @[
		@"oCRtnFGeeKCNZfQKcznTGCSSaZXutJYSukinWbooITHCCIKaAmINqWigPaJgOhVigADHWoVCCmcusTHgpyHkQBcJRBZRznIiJFxDdbOsnJNEKe",
		@"AqkHupgDNWwLUzeAThKdBYausLcCqRqagcwQWWzlbqlrpSaGdYixGxXsWgqhUtgEnqVmBLXarHXMCCVBqoeKCbOopuxANilOnYMATRAvFrHDzVDewDNGifjZvZfg",
		@"dmfUujRvdXuePyfNCghfllvErnqWJmQLvfjeGXzquBcUNnOQaJpOFGHjvojXuDCQlJbXIiheKEMucaMpNuVCeNfdefjMcfhlKJflGhOfWdszcNWSaZYjypffGuR",
		@"vSsEUbsAVfvVUCxIyAHCHoJETkHJIMQjlJmvoVKMyUsneuicwijenDlRQUduwjtfzZAScNqRGpEHTjLPqFgcvIRjOdGWjOwWayKWyDZwkjPUXZwHPULHWyVBFOqaQEqTGFhaKjOUnRRy",
		@"hnmIuhZtTWiKOQInbSVpHEgbSQIFSVBlniqQRbDZQLNtOUCRFVtliKVrTTdaVEYIuwRiIimsaEjltfKazsfVJNCOhXIxfuqOPQeRodGmIWCHopmruRYBYxVqZeSscheAICtQhzDeEZYILNPrBdC",
		@"eWyHqYNekRLlSetyEmGgGGuUvgWGHabWYpRktSPcImUxzIwMDsBqzvMoSuRIyUAbAXdDwBbdWlgOpxVTeRcZXnrtRWHSHKKQbxttpKIY",
		@"yFPFoWBEAPhfKNDxUeebHybWcjNaMGPlFfhCiTlYYFkAGpdqDZtEoIowofuwharIAiFbAWNxwsxcuDcxlKLMpbZOgoIMWvuxWgDXQcuECABmgnQnLKkbEtEpoJudwhlhYtSIfiJcBuaetWJ",
		@"DQSBBbIaAypSvJCayUGNkufQjdCxZrXAWFlzyvXsfJuIVbbSNEGBqVEfsbFSVegIixIIqnppXVdeGTgthNTzlIpPiaCdiPyPaHODvsB",
		@"rsCQIVrTVNlQjBJrQWrjizFzwlIMvXHqqEmeKLxFOcWEkfupvzFbgfHAxOiNvjwlHKjSONiDuBbECinxynlfngGaDDOFZcnuOtMLOXoPyocewSRaWgwmiXVLyW",
		@"ThDezmEhRMXJXINKocHssPXWggfGXyAbSpLSsXAmpYfVXTsTPWVZZQsrGxcUHzeKJHPJexRvgZkgbJGoXdXiuLjMOPWcYoDfQaRbSueAYnpEDPawFhq",
		@"oYxRtpQBHqyUzSkqfTLshuynnSAeHhxvcZGVfKCaGUMNxHAPwEopxHnxCjOArFvEgmXJURvxpHqLiesyNwlEJuDdYXuYyNDbjlGqlSAtVQszIuSOWmPDUoMXkJsTlOWDMXzRWV",
		@"pNkhwJlKgZatQBZsYXxGDIsbKpIekvsoYKYyHdlkGeqEowyBdXKPTUYWMxGtyZtmMmHLjuBQsQCLhQUGjhETKedIEgsIruNGhjxBRClRMdzcfFEAutuAxpVTcAK",
		@"IYCWyXBLiwBZdgxvUBeuwyyKsXEedlavKgPNSOAUvwWBKoXcvSxmGLUgRPxeqTTfoMwTYmNlTvdtiMtcSqUoGzzkccMFjmuIYOCWYvSVV",
		@"HgbQviweIfhuwrUHkiXjuZkrcdyUUHzMSBdXcaAAbGtErFIafMMZrpCkWIlSBYinCOOEtfCMOyCMuHxoughqOgebyiUJcEZacjYaeOTGmRKqH",
	];
	return ciqgxMBnSyWCamBj;
}

+ (nonnull NSArray *)KgrWXIEZHSB :(nonnull NSData *)YMnhLhmUYi {
	NSArray *ZjRixZonmUGfFjN = @[
		@"DWzbSJwUxIOwUckvIvqRQPepQRWDaDessQjffDmpcYQzJqVKbzRDTUnulkjniRaIEDWqPMFbTeyfqjKgCHPAOpTslXppwbpLPDkpeTLalzBGgMfzWAGZaMoKSkNgWnaDpgCFBhULKoKUOVwmTy",
		@"LsHsanlDPDFPBFwDBQKDovnvVYfgFmYPVHFYVEWJRXmgeBpDUmbPbftohCBqxDngIdwmYsvxuXGUlDdssPxkwTgRtbJyNziaAlppFdRWGkVjsOqevcYKWnJWtLKqQpUCKPTMxsPbjbpjUAamW",
		@"RUmDODWmpUXWKbJxAXWEqWzBXaVotKswZfuqmgAYMPMxTwAiUsJUNobhLZeEJnVeygpvrRDOcjZstAkvjWGKrjjCZjxfWyoDsJQjOWuDnXWbxJYNxVmnDzIEYuPGeLIdIyebo",
		@"NOFScsFpTahBLIxjaTMVwJdelRQxhMaquziQZOiUlMYjgcJROOJYDXizWhZOuaBtqjOsfjHxuzpKNRzBIWnOJtIvQMzWnJVZEPqbJlSnuHFHeyhQJPOWtnNuanOSlJudDxsSbwer",
		@"LlYqJQtSPmPhzyrurEVFyJconiOVBsegrXfXfYllhzKrRThHGvKDZXScgpCGcFudNQoguPiVnVNLJZwZWnwNHVTgViomYMYAYJpogpakAlPUHpKJPmVBIuCgVjpNPfgh",
		@"UxAOWyirSOgGpDKJRqICiEtzEOMYjMRTCDJolCdkSQNdDjTNPQTRLeDXCbavSzRzaVZjEdDIXxacTImOcEwmXGGRBaqOQGHCsEeGYA",
		@"HPhfuJUjhiEYbqusTHMjyzoyLkFcxdRJDmIqKyPgYGDopJJraQYtHPqiaTVCROqDekWgBLQAlcjFQdiRbmETtorkeZEEYWStWSATW",
		@"HNOvxnsozmmvVnosHzWXDRUHRHvReIoHvgtHTiDZcQpMxVmNWuvcXcMUUJWvfBmwSBoVCQUjqWMNEukjkVRhSLGwbbrNJMqhXwPkOcgyLtKwQzRSSpkhUFcNWQnlulNDUc",
		@"yOJtCBvStXtXHTjyQDiPuKkiSYidtQkdZjowYSzSlHhlWWiaWJPkRRBpKGDQWLXlcpDprAuTkhKEEXUawcEWApqSFiERcXOflwHuQrHZrWZNjHSNrlgjgqyvgnWSEsSiMdaimJSPCTVcfEEcFjZk",
		@"oFjTTjhophdhHiVAYovQUiwBZxuqvwPrqHqXBWbGmYhxWiLCAZdMbKzYTRqwdicrSaObFfVOmLpLyMMHjCiayLGOvyRYYYpMamJFHcivPBbUStQwEHDzIIJJPEjR",
		@"QDietndpIbgnBzSDCvumVmFVeumRaMEQLNqhoWZbJrXuYweoanRWCdSHWSVJlXlXCUmBEKbGWIEnrmkBMsAFkehcUpBVaDdFuRukBmvHjGfsBoraGGJyLmXrruRGOVLyRzRmQKJLlXhBcet",
		@"UiTnUepIUmNSzOhiSsLUWutjJtTxFBNnsVUcOtRgnDelGxFMCaFrHALlUnGWfAmdSIySdcslBKmMdkBbSVFyPRHWbuIhdkvHxDTwIaMYmFNuTunKBJbYpxbUfrMynvupI",
		@"kNnfszEzRhrbdRWOilRCOWLISdJuVstRrGmrYoCtUqUhNwpxiptiSjLLttrTdWSrUthTwZsyLisNtznWHUCigoeVwDhaOvqerhFyunzOwZbJmQRPgsaJdoEegwcewAidR",
		@"lYZXuogyMARdaIJuXNBsVbeZsoURRVxATZBOmEstJVBAirdINalUqhjQLyhtLTmlyIzzVnOzQwYFYGFuMfrvXeKSXSZzUoDDRwgp",
		@"PQhEStVXDNJyGYRvOkEAtXOeelJDGoaGxAxfLmcdulAnivqCzSpzKdWONNlczlcVakdAhaumLQpqSHfnYdvxywscdHbbOQiOOfNrEP",
		@"aLYEjHEDHRWytCkZBvXtnwgmnpYmHoyRIWlxLwWfmSRaEGGaoWqUEyulVrAYUmICHPNbzBSirVwWwSYOAYPdJkWcwDqXqlXgMvxJRJDZBGKiiKcTrpCmWIIgAt",
		@"oypAGJgEVzCEIYouKjdzdYDAtSEzGwUJWzgFykZYKWvwQVxENUKqAHFENtLWpqsmMmpNUElyomAjUEofcsyFHryyklZjaeKdZKnaTdYLGLfFVakVlzLonawVPwTVbCZALKCQsFQsspxCJxZpwjFY",
		@"IHjhPVcjqjlMTvArZvjrUktWVuyXVTaSpsSzMtWVdQTMewXnapuDAVLIVVycspkFxRAzGjvPVEdRJzyDDORcUXscZbWWOEqnJUpzAhBAdzyDxknCTNeYkOsVWLfsrTZnpJFiAkdAiLWt",
		@"jbaGTYKUOwLODTZbSVbnShDTGRKAZZwZIwfUolIGTnIncRdYGcclIMGmLVVXivNliOucCVwlLkRYdIvcYyNzqMNBcvRqVVIzxgEwpIztjuHAhWsCEiWH",
	];
	return ZjRixZonmUGfFjN;
}

+ (nonnull NSData *)YIjNCoMjKDruKH :(nonnull UIImage *)gNfgkskjZecDQt :(nonnull NSDictionary *)doKRinlhrgdnNX :(nonnull NSArray *)eVcPfpqYhkXKipxvUEo {
	NSData *ZxumFTPRtgWkWtTxW = [@"rKPUMypYrxuxTFxTBMyHzjdNzHbLRkakydSJGLWzxcsAvunCAHwyGzgkrdcuvzndeZigTIXvxUxNvEaoPhXMXfLSUOjCrgvxyMRvPUkuGbZhmebzqaEJeVeV" dataUsingEncoding:NSUTF8StringEncoding];
	return ZxumFTPRtgWkWtTxW;
}

+ (nonnull NSArray *)kWkcjvIJwla :(nonnull NSData *)OltLFGZwaDeCz :(nonnull NSData *)AyHYJAgKiizEIGQi {
	NSArray *reFULANRzmAyQ = @[
		@"uZWtPWtYIuJQlEXoiEcYmvLtFDooZwfqDjwTxovQisnkTKlOEWfqjEicrHdxgbrZkMbpqjyNoKXCKsMZHeajQHrztquRJhkEmOZCFPBPPCCnGFvNhRzAfibCnynXHDxglCUwFkfbILczzM",
		@"yPBaKqmtAxUgjzXUtCjUBFJmZrtZgSrqWnnqNINVStFiorPepuXZYtxzodCDAORpWVzAfvCCkyfMuMsmxLdUqREDRBOieSmAhLsbviPROz",
		@"WbsVQzKBpORHnvCFxGDbHmUfZvmHVWQrjbzKFTAqQHjkDZHWAjYKozJXfRuMYCiAthpDPYvfqucRVYMBEULTMzOApFijlpdGwpVPIBQMyszduvc",
		@"qXJDCwBFEYsWShypKNAFMwbiKtXwqiGoMEMXWRpAuxWuAIghmazKpcnLnzghBYvLDBsMKLAmhSjHmDEqEVfkdvWpgQweMAbIHDPBiiecxnqTMZhZvzBvH",
		@"dGkBRNkRhygZdALOryAOEGFIMxXKHERdqtcWTJIyNStWrHXSHSfyvbDBsEUhdjoebMBqnVRLoSgvNAMAfFQGPwGeFNBnAWFvFBnVrPbGWEBgnXOJzoCIrjxhYomy",
		@"oaWpDrcOXBoeimYxgZqsBfdBTdKKihzWEkruitnlykXrDZXbHRvcbWEZjWUoRbpHKIdQMBTATDqvdbXbwgRrDaMKLqsEGqunkegdJtzxWbFElVTCM",
		@"RDEiiLzLPbYNWJgDGtldGEUzbdkdhsoNCJerKbgvzYosrUrbmzGpzSIDhFWwCpEbayVFKfQopHLzxAhUpjIJwfxrsBiFKMTMjigmEwGmUD",
		@"vsvlkhNiSKIrOxsjVIaSNIVQESgrvOypUAlnCAcTnIIjRFMNfkFKOnuHbNcGRnmBfjiwbZhozpEdXXzcoEJOvXKAbSORnpIEOWZZ",
		@"AvhxfTQJOBxwCIBeMEweBdZWUCoJzpfMpJdDsUpsPFanPWTApizJDcHCaRqXIpSKqYHaVixwNTvBllSoqFBcXZjJJOPDRFljAycy",
		@"jhfYTDATBMQcDwiAudiPpukyOVkyPoFuWgkiYtAlNjgkWpktkKHmGqzDfzPgDIDfsVxhVBNBMcRQtEWHcoxtQnakxDGNzXcEIDdqlYPnduPGur",
		@"XgKuWFrMwzxxvmGCQvPTrfzYdGkxpJEfoSZDLspoIpcBHpQLEiGFvzDsCmjIwnnylxWcrmYAFXhRxSqzjTClnchKetLForcMuXBvKCoQSFaRERFqAryyGYsWJHIZkwsQmyVLfdLprHlaUrwpY",
		@"WnWkctwQAIMUDwAxWcLfFTBNhjDhBbIiOeDPVhmgASOndmzEItRXALyEumQrNeSfxVqttidKcxzfAUAQTUUPXfBsxwoEFHGMLnooSBspqparxkNFjahuvfYAvYM",
		@"VXaqgXlDXMIbFnFfmatulznwwGnnFymCjHDDOoaTRxUwwNXWgtSmlmdWcnBihBKTtFEQqUCezrEyFWFAJWVzLxLNNigejexBplklmT",
		@"MteToUoyZSDvFMtqUVmlPMJDMZgspqNTpxMJRreyDYdlVRyyATUTfQRzXuRZoHyvVXMeWyEdSTJUhTbphuiskCqSeBkYAenlgqqiRBXIbZbRsCEsJdZpYeNRGKqVHNsJGjWhwyVtaytCWNI",
	];
	return reFULANRzmAyQ;
}

- (nonnull NSArray *)iqdyNwIXfkrj :(nonnull NSData *)IHNglPJMlFkC :(nonnull NSData *)PWPLFLYnDYLEXZm {
	NSArray *gANcjaQqUme = @[
		@"tAfSrahCeoHfZKYtGkFnmxMqHAXCdEnbyHyDCCuDieVFeTPEoDLKIyMZaGcAouGktOmrNQzcwnmvBRBAnbTTyQKlPeQKVrVZRLjFOwUImrcICOFYgQEJliKTcuASezp",
		@"ZrlrzlKndgsvKbEuZbtXSYotMXRJHOpVYpMAuLvnrGjCgOZTHNDRxrDolhAwEiMvLHxeMubCobtFMciwtYkWQODYmQWgMcBtnwrPWadK",
		@"kFgYRRXKlthxQMKzLyhnrfyKIrWQbhKFVdwhHPCjXRLDwINFnPQXLmqyBHWmSCSoFlMFfFrXgjSslanfFtoWCkDHQKsxTiqBnaMCZBKajTpvWLBKrhFYdKQJKUJalmRvXhAaPkz",
		@"ypIhUWYITNiSVsYwhCVgIvUguFQJwygMUbqbVSONeIfhvmlETQGVxbDRiOfhlcoKwYfyqXgrdfEWHKTvzUdrCwoxTyQKhwBZEVKABEdAaNsiKyumDUMQBIdIyoJRvyXipHrYhMZxJLX",
		@"YUpKHYRIebJrfZfpHyEBEBvTxtzylkLWOsXyWByEKkMWRnrCtdOtdypqmVtIYhfcmUszdlngRxVYVFQajzSrPVMcpgDpWbPwQXnSOvigVaIRnSWkzVtcwOYZkVeAoNGyILMdgHbkLq",
		@"yGDJrzotBtKoTpusDrGgNLAypTEMruQdfsXmrIXshbgPaIczrtEAZACBYsAusiuRJRcddRYPcszyAhKurazAlcPetrcPCzGMRPKGXeNFxgOAgUfGqIAstZfWIstEbFSKlzrbYlKiCcAmcSyMed",
		@"fGqDRJbpxYzvIamEMNCbDjOyCoyuHMdjnwyVmndsapoUBJUQHzgEOVEfvZhfWoCbmnoRThuJzAoCNLaHKqjArfOwftyvjvgrOUCzPWoJfunRw",
		@"TMNuupVqgqKDovCkuPTkUjBoizOkZyMwLqIoMomoBoxZrrerctrTzrDlaeMuBNAAWQFDFnCTplQsqeZJNmPqEZiahwgZgPGskfFCYuVwCfSkfGIzen",
		@"KRavTKBqjUxxakiSQWygPEprlQAMzjvaqWZwvxMarIEIwyLlcPZGpYfpAJqtFcwfyJSCapeCmxzVjEpJMChlgNImjaQwLOYFNoeTVrKkGZtEtNFpnRUaWWZroRdUkRMwpYIpLFhnqL",
		@"LvdAvOWpQTlTSdFnWZuSCOngOyzukxwgqyYBikOgeEFIcNEdhssMuYtatNAZtCkRcitqlfNZqhRotmmFDQVGRzpCiDAHZvHtayqhQxjPUUsfPvOhprvCileitjwUDbWW",
		@"kdqRpWHOGJcxSqfOWLUgTWwxkmYOkJPrjucIZDTOLUasGNEcgaMpYjrixshYxYqMVDNqZjocMQTHHHLEkIedAvrLkvWHzurdRtXsJqDtkvNusvbpcNKfQOVDnvwhQOrTiQ",
		@"EWIDWcBeqXiBuTRckdFmAEEunvsWrXhiQYPrYFdeDmGGtpKhSqioTITRKGRYVxoDkNaOJTtXbrMZgfPHOHahBudEXIfTKgOTbefDKsEIcBIsFPljWno",
		@"ayHOlswCtlllLCsOsOiKbPxaufdIbmNwHsRLvWfhwNlAXYHbheXEAmdXorRRquGRWYYxGYjBHLaTZAQmENvJVTVrvFPbYtKihBjXTohzFlfTeLqurJgyEZUvXiSAdhxSrTUSRUhBSrfYnPFpcf",
		@"wQPzSFDEyKqOduzMYYwvwxKrXCowyxKkeeStneYAfPsFPLLGQVEExTRUzMRTTHvbNyUBDXPQsmBGLEiBvjiohdcSsBBHvzJbcENpJaUPfMYokZqvMlQNkOnkzonryJHbPDkiCFfoP",
		@"mtObzHvQPxadeRZtfHJWVkbgSmTAewVjenwfEepcSlaijBbqTNIIeujtlpIEdgXdlAOzOvkzlqPSEszAOqaNoxKIHdMAkNGZayPbpEQFLTOuKzCYQgHNaFFaWspUeVrbJZafnGNapTZbsxguqCywU",
		@"anquRmQMEgehxvNivawrDPmSAXUvuGKufyXkbMfutkFtVjDQjbnAZiGGGxWnceOITiMwvRcfELyhPCMnPqIDmDtcjewkzeFMtYMvOKTGPMPzPehNqraHAY",
		@"QvlqyqeLZfszTQqgOfFUnVKTIkQJWfsziDOVcEaoWmKNldQfNuMBlIJtTWJYuwCAsBtZlFzfUyhbmlrOAcIeosGBYccOkRsfVSEXjDmyZHtSVzTFSlMNbkgKTnIhGjKB",
	];
	return gANcjaQqUme;
}

+ (nonnull UIImage *)CSbJaHWrWaJey :(nonnull NSArray *)oNbmqVMZtiNvgBwSAWg :(nonnull NSData *)QLqtqiUaUy {
	NSData *kYmcxPitXcXSqZUZ = [@"yZCtGFWBcfvpcaMEdyBeCmCisicTDXOkZkCtCSsQcdaqMftaesnMCRUnEdzlKEuoWyoohrgHgJHWNuNFMqKnQDxzVOXOSsEpYkUwWMMGkJWXylCVKefpCpvWxelKXuiCePAU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GdkAxrQLjCGBcdvSfeX = [UIImage imageWithData:kYmcxPitXcXSqZUZ];
	GdkAxrQLjCGBcdvSfeX = [UIImage imageNamed:@"ibpmAWevhoMRfwqPWnsYgBeNmrLzYyMPBBBioCBItVsuFzfrHPFwfCiZKkbqCWoQYrstDgwpLzwIgrMEbQRIhcXEYfOXDIDISTbAbgtnoeLkvLUyXKQHWoFTtMNbGJbuCIZpdjDNotZVGpGefjP"];
	return GdkAxrQLjCGBcdvSfeX;
}

+ (nonnull NSData *)iygeUpErJuS :(nonnull NSData *)roGIMXMbEBXhcww {
	NSData *BcNtMCJukvdeaKZ = [@"DswUxULeBryPOMsDQEdhTurxsKyVxpagFOwXjLdrrULtnnHjXCdrZKyBDTNrgafszoVdfGjQraJFWhCJaashjuKHtLVntyWZTFEyhTu" dataUsingEncoding:NSUTF8StringEncoding];
	return BcNtMCJukvdeaKZ;
}

- (nonnull NSString *)ZopgGjwqvsPfjGJ :(nonnull NSData *)LnycysldfUnxxoBDG {
	NSString *dczMtxUFCBtKXTQw = @"CuStNaZiiXScgUwPCmjnMSyjYpFLhIEsHgtWPsXsdpUDfANVGeUXNKxZdhgbHKHgTscvzxVdnhjqnIMtmQdLXgpqMmAYXlddtdwgVzremoeyRBN";
	return dczMtxUFCBtKXTQw;
}

+ (nonnull NSString *)OBTmJfuJhxyFanelA :(nonnull NSData *)TuTSMwlxkvDoRRsKHmE :(nonnull NSString *)gSbjndrINOxeAgw {
	NSString *FzCqIcBJvR = @"rxDKSVZSwLoDCQMLZusKWyeGTpZhtjwajcyQvQhiBOpXzmLxgxcBihHjxNnNdwsUnWWavgBfdIeQpYJmNgfADnJQHvKMUwjKHFJcsrkEKGmdftuKoSxNcYeWz";
	return FzCqIcBJvR;
}

- (nonnull NSData *)qfVjRXbUZeXASzM :(nonnull NSData *)uDSFxdGIDaN {
	NSData *qRADFgUWRbOlADD = [@"WprqRnaWsOptLNXcINmZAQRGyaNpmMXMgJXnjjulRUPxcDmGSvpJdYLZDSBKFvHFrRuIvYLmhkcwRRUTGsdpwJyRWbYnkeLybYkYkFvjvBYTBYQBp" dataUsingEncoding:NSUTF8StringEncoding];
	return qRADFgUWRbOlADD;
}

- (nonnull NSString *)exgMfDXxMnlgSDf :(nonnull NSData *)DLoHwAEIpWDH :(nonnull NSString *)xTGTFhYqAFKyzSXU {
	NSString *ehWOWKOPTiIPPfKPW = @"lesveBnggRTUnhPbGQhspsJXSYXMSoXqbeDdVBfivNHZnjTMDqmHTlMFXuFmzlPaFNPEBidpbrBocgfgkcwzhKBkiLThfAKNORHobzcbgbshpELBJ";
	return ehWOWKOPTiIPPfKPW;
}

- (nonnull UIImage *)ybKvccggKAqgT :(nonnull UIImage *)olbVTqxYntjFsU :(nonnull UIImage *)LYqZbxAzsQZRqlZ {
	NSData *WpDhRjiGWueSuHsl = [@"saMzmIXNMjoOWFNfbepWhuwAKmpbLaIJdbBgQsFIqNBUhhNmwbrCrMsHNEUrQDjbzDgPXwDvAgfHZOixCDNVGruAbKIMyBNAbxdnGzvngqKXbUFljWmWuLsHMQU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mHeebfKTToBBvDk = [UIImage imageWithData:WpDhRjiGWueSuHsl];
	mHeebfKTToBBvDk = [UIImage imageNamed:@"arTCFSwBFyxPbSoHaaikoorrPeFEQMIfSCGfPKsBDjabVsIRolBCvHCgEvnDrNUpIWuLfKZYqhlOpNgcXCbObsgWgTlHsdMCaCFITNFYVvHClYOxtUAuYduClXGhcFiVVsDSzirPyjGGswDstTM"];
	return mHeebfKTToBBvDk;
}

+ (nonnull NSData *)kzGQatUlsdeZKiY :(nonnull NSData *)bpxlEXppVhEHXdsgeMt :(nonnull NSData *)EdHZbhTeppGbD {
	NSData *RrcfvLzivNvjzPd = [@"zUNVsQtSCTSbsCLfeLuzQShhJXKDOGfqjJkBehlJBNztDVBZWrQTdJCWEVsAkXNrEYGWfyclSDRGyKImtJLEJqWfnbCsIamFRpTorOLRcIQipeiKWbjG" dataUsingEncoding:NSUTF8StringEncoding];
	return RrcfvLzivNvjzPd;
}

- (nonnull UIImage *)DJUZgQMMVsI :(nonnull NSString *)NxoyOkGfRfPZqRRr :(nonnull NSArray *)ZVKYRuyhwssZY :(nonnull NSString *)MthKbRdkFpd {
	NSData *tAuUEqoWjd = [@"ISJvCtuKiAbHfwfVYsMNjUfFVCLPmiYcmvotGIpYahaesRwunQPJOOpqBYmtwskZuoLyTaSCfSvyZezPLhqpJulTWDaKhtAhgQQnnOseSDFOCYobBcZTsZpHMcELbt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gUudtZsFyubXLSEI = [UIImage imageWithData:tAuUEqoWjd];
	gUudtZsFyubXLSEI = [UIImage imageNamed:@"mtdJlxyvRnBXYIqChwEBSXkpqtTLuvmKRUstyXZkiLpnhHPMKHuHGYUYkzhVzVDFzdTYXcYqQKFsLdvVkwDvCvdsqEGmxWJmHmSmdifPJzGkGwvbqAfZzeAfDIAuHQTgzGXNGFZFQ"];
	return gUudtZsFyubXLSEI;
}

- (nonnull NSData *)upcKbikiAoUUDfvS :(nonnull NSData *)fuaTAOGcEuRnuc :(nonnull NSString *)bgnlVMWFLiy :(nonnull NSArray *)ABEYTmbnZCY {
	NSData *ZhqhjAYrWbgAbrzXJM = [@"ZKdjMwesEViQAArnaVIOegJfmeffVEBmfoRojOynbsIjDenkREHOlYrOKBAvcVjRBxFeNcHHKcziSHbUCFwBtIOEljtlnLWPhNYuxT" dataUsingEncoding:NSUTF8StringEncoding];
	return ZhqhjAYrWbgAbrzXJM;
}

+ (nonnull NSArray *)kKaYJNmfgpDXNGhVL :(nonnull NSString *)cBROkwouvBjQ :(nonnull NSData *)GLucwtKZHvR :(nonnull UIImage *)HDiBeKoGpWg {
	NSArray *tQvYxbyxvUMJKEs = @[
		@"ASMtuvJdMaBKqYmVyAyYkgCNsLNqaGJxCYaleqmkeRrBZqngHhDaFQivfPNHSIsOJxHRWXpmadXHeRIcYRyGcDIhSMwFSjwwoskvuZiqCvPCRVSMbVcuzFUY",
		@"NzZlUzKrIcUOzeWskYRIwerDSLwMEPsUVJAmgdpSyqXaWCdDixvfBDwKHEhwcUOOAAwBydhZbLVrJkBvTSHaAQgJwEMAYzGYhpqgl",
		@"ZUWNrGgxpnljmQdvRVJfuIvihJXKCiVmFotvQpnseCaZamXHdnVclMEFmnquwyaOWGDCzsEdLTwCQkrDLpQzWrUCsyHuzDxXAoDaPnisnGJwNqplaFbNeLyWQ",
		@"hoVMQWcWHYeNrRENiuMBfewrWAFRmOMRUuDShWqjalPgmBvbZxXRSknyZKMFpJMYygIHPKBMenLPHEQRomprHdfvxyupNmtKMupOXNNhoeeXQvrob",
		@"LKtThPnjjHXyaQHPTiDrSgqsroKIFJVtvcDUyyyzIXUSWpJAPCRoBctbVjePOIxaavPfvtSeVhlpfqMoLrqtcoKtgnPadJDSAkijEPPaZgkiIg",
		@"gCVAHXdrnfHcSFRmgyposWUxqOdXlWabikQvVUpbLrVMONeiWjzhIweCzaxvUgsZbaDRKtiHAuJGoLfxjiNmYheeMTxQcwzJDYrfJtQTrRKiMtpOn",
		@"zPkZVmvHczgzwYdAoRxoMisLRhlfleIeSXweMlHWyqwOXiGofrlCgUPTjuZwYOWtIXdOIKevMxeQlGHOMbIsLMpVqItpNpxQlSIabRVpEUXu",
		@"XoNQEdAeBfDiMljhGvfQtFwRgiSbCqvTAqHVzMHnmJmOPESOaqJYvELLGxuyhYNPaGcvkeEGFVvRfjQpVGFWfSxDzvTUqEGqSRWETJ",
		@"ewZFVASBZRGfHBivfvwZGgftJzZOruLQHwmQoCIuhfRvHTAgFrArlTqxvloHsIGzuWniKWcCDGsayEmkIvMdfvfAnNmsnoZHjDmKg",
		@"UaYOslOgBlSxJXngnAlycxZjOfgpWULtjFhPBoILudRXHMRyAMLeqHLODlAQNhiWjTmRyVHQjMkzlCcPkjGEUvKExucvpNkzGgnKOdWntoLHQsNGQstoALYLKLwidfkopvUYk",
		@"uECNHwrQuERKOKnxdxUzXfZSoEQZqQIrDFuERAhgVhoJWhvaxDVpSYpcPZsJWXAWUbNINolYnmJWTHkKlfvOwwvsAAtPkqPHUHHtGcOVNORio",
		@"xYTPJxHzNAREnszFMntVNBjPwJEPtvxRQDmBLSyXKGlhAPtLHGXynlaRAJyOnkHWWUxKhxuPgVpBSsMbSremvEKRjWpcTlMgqHCCUhvOICCuhycBgjfMAz",
	];
	return tQvYxbyxvUMJKEs;
}

- (nonnull NSDictionary *)uwARqXPJbeMysxvaw :(nonnull NSDictionary *)YyEULwqXIBgfphe :(nonnull UIImage *)cADyxpVadrRF {
	NSDictionary *VRjdfDDyHmoNrUHho = @{
		@"PPLuYyKHDNIKDxCeI": @"CZNIFoJkJDiltXGyXaKhZEugiqhchgeNLtrUQQhblpvRCEwpVCrGwQyezsleHggcfCgynRVwqXaVUGEjClbWpgutppGznzOdnjKlkKlHbHjefddPqoK",
		@"fhEzzAnrHw": @"isXWZLsHIjjHOLNOgkeSpGssItxOxJWEYzcEGEcxsIdpwjdktWTrDmbdMXXBfWhhvlBaGQIGfTKZgeOqytkeIGsFrjZNbryfgVFOkAGGbKzBuPwrwjsQ",
		@"QLJjrhuueZ": @"cqNgcrRyCWQFoFVuqGGqPSGMwOTMPPlTqNJcdQZbAzpdBvahZtcLtKkkkrqVqlcxhplwselevOppdAsXElPmJfsWLDsPBwfcdQZvvudEBdZCrcxThULR",
		@"RDipJSQySfeUaEcy": @"vjhxQtrBVdXuxILNYUYKRBjTynshhlouMdWlvHqPFhBbKqxNALsjTIluUUHxhXIEyNrXJYJiWNaMtPehODQyvsYnlZXOGJKVDcFDhPG",
		@"fyEXvKhhVfPzzsKClh": @"FJDzFEPTzjFvSAuKXDymKzEtQCXLBOjjXaDPpTtkAmGWEfiiEhVbQqFcveToLgjqffbBspWpRUDtrYklQgCaIDJKtCaNxYgzhvzRCzOYpijPolhNdwOambYgiNYxuxnfVPQ",
		@"nYcrtnoolxE": @"nSkRsmvBkUrcDDwDKvshaxeYIFRJoHMrTLEBCIyivSwlQVffhdCMeYRrhkFtbdBImjKyaImuxKHbxrKUdxvVIUWLQKOecqVwdWfSsnHqWkFB",
		@"TrUPldUYnvnvfub": @"olncrQzRLkDstuCrArkwEbDjkmjsLciGMGcRmOXwcTdgIfjbEaMLTOsyezfMwCqIuTwqFETSpYMULhSTjjdyLobGnaEtUjPryguPNOz",
		@"ngVbNlomDYe": @"PzZbQMOwlPaPxlUeMPAUSkpnpuNByjXrWKUEkUUaXSmBqDJtecVZPkotIgGdAQoxRRRyHbtiERsERvwYMRdIvrUdYChokjlYPadHfAjuvnvWDyEhcUHFqhSHzxsLJTZthhmWLwRrFIMhYr",
		@"gyjlSmLnwZqmyQUm": @"AMHMGNRINmOAgQxBlaQDhMBfbAQRnOyTSnEGFdfGQgpqmoErhGqeQNhOqbziTkvYwpZqrnNFZpYJtvexgqQRONRZvpqRCXsrKpXFeTDfjGUmQfNceczbIe",
		@"MaROztLLTb": @"tsvgjGmUGfNRAwgDiAaKpjNPspzBKnkVCiaxWzkxSQsaiDqUneZcLLMYNTXtbUWGqNVYUUWVWziVIJwsYSipwzQKPQSZyWlfnffKrMjr",
		@"MilsfiNvVV": @"ZIMmAHtJEMbvYssAzUhgFZfOzBgmiTyPBqNmEiTpJfGVyZEIhGgRleWkFuPmCilETJZUygMkpHwbJsmKiRvWKOmhtSnfAcuAABPVUWkJa",
		@"fGoLCHxnWHwrDenIA": @"JkOPiQFdxJlPecIvLczffCQjcIQHuoAETboOjzqpPELfYDUlaHriGMaIpJJDhuiEdJkTTllOfnZfuirBYGjmIucfJERtGSUBKRdslqVGLieUulsSjDRYRqa",
		@"jbQISBAUijHkfG": @"fUGhrsNpEGhELpoKgfMqcoSeFCJgnewAyIfMCrNumEGgIkKbpyjvHVFEjAzSCnWCUbUPyXAqmfCvhSSOqMRkpZwXteiJImwpciWXzKAsUeZXUXfgaPnZEUglLUvIXVMqM",
		@"taqilwkUiwCUsYNgyx": @"lFLLRYDhsZYHfSmKmFKJoRoSLSmwDsJNSKhPYMwVVuSAfTIMjmzVdoeNYDGRgThIuSiRtAzxfJPAUcseiYrfGjhSZdoyUcqxUSyaRJfIUNpwdkZjFMhENKTwkOeBGRBatELGQCMAI",
		@"lBSVYeSDrtN": @"BWyXNSDaixHJlGrtbYaWCzotAgfhSBveVJxAJJHrssuKitcnSgCpaQjIdUcFZJjtVtZIWvvOuiIzegLSHderonPFaRbIZuOkpwwmQElTMGAxzkZaivyTmZYvgBIDJmKLicEX",
		@"bGYkBfiLhRNPjWn": @"lDPCShmilUneaAtahqwfocUgnetVnWGyBJclHHTJsPvhTQavIzPWUGhdytTZmzCPzZAhVCohJfuxXGkDnUOLTuOHeXozArqvTGDwgXTzgVvFkIOpNyn",
		@"DohGeGQixfWbqCdkQeF": @"NFgwksUsWSTqljCtREvRcXvgbeoZQLJiKqvzjTCjbIAbXkYBjOJeXdKnMXuVOfwAMyaRzNuVRjcSVTapYjOaCkKpnjbxVoHMofZVGjSUD",
		@"KCkHTCoRbXxml": @"HatpLqnMiLwSgneHkDEVtMGOFTrGCzRflKukwRcQabjufhINvZmlzLTDTSjlhDbjcdagPVrqvwsUDDXoostLgIKAIDqJsqGwfRrrqDUQGpRVYMvnvLawtakgoeSanJKAcLsCm",
	};
	return VRjdfDDyHmoNrUHho;
}

+ (nonnull UIImage *)uQIFMcOWHKmOvLugm :(nonnull UIImage *)kPsEJKGuGFfjv :(nonnull NSDictionary *)OpXdHBuKuVIAbKn {
	NSData *DOGvOdBPJvd = [@"cQWpKKQDfsdiiJFcacKrUQeWGewONkIxEEdVszlpMyruLBSAYnriIyXPrpzniCALjkbofKAgtXkNcwurUouZdwawIxMeeRTjuAmxO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DQyYlYLCjIPpsxZDK = [UIImage imageWithData:DOGvOdBPJvd];
	DQyYlYLCjIPpsxZDK = [UIImage imageNamed:@"NiZmUvdnOgFqudOeEfVkPbqSyLSnGPWPQhxIZmEDnQrYHGhDZfJkIGTBUepHhNehruJtUGJUjXtXXOHvCjIMmAZTbFrBWzWEEkbqAgWQPlhWbTdfadOtcqwPjM"];
	return DQyYlYLCjIPpsxZDK;
}

+ (nonnull NSDictionary *)UxwwDcRIZCFxigGAGS :(nonnull NSData *)ShNEUSlGZrJWRc {
	NSDictionary *PbBcPHDkKMJS = @{
		@"bzZCdkToQKmJuF": @"tHnfSwupadgZCGoJXmNhLsAulZbqlhvpFSOGnCFfvpxiKGCQtCSUhVAEUgJxxAGTDvmaYCpfdMuiFhgXcIDQlFdGxuyGIMmMuECP",
		@"sTBBfCWEAJcEoSfRWa": @"TgIKpxDqhwUgzPmOpRhXYbeokkcrqujPJirihdeAbrhwnkEPIJFAFaUtnvDfepihcxmUQKgICkSUGUtlXHcHGHvMOLCiKfQphzEQjr",
		@"UMvTMQoWgz": @"sussVuLChSLqyEWDXOkteEsZfJIQAfTeJVXqtYBdqydPiybQQBZZpcPMGZStusvFmTZwafnKCnQXnwmawNVkRUibXTanydUWCKAeOQAXWjFWUJAPzNygvYyDrAZV",
		@"nBVJAMlXSlpa": @"fVxJYVwQceGjrdGZJMgNWNYsPwyzgZzpyZeTOHGhyZhaQzbjjHQiCREGfCtJzSDWbJVHiVKXefykZQLGhVRhzwkfKsYjQNprpIklRRdRqleWbIVRKspuPcUrBqAjrofMUgiYOmOwyn",
		@"AVKilRJrhPZKYbNKeI": @"xcKCVRtlGhhwxRMhtnRlFNmwlsRlNoniyRCMassCQuiMIFNAHOZuAYkArvapcwqLUzGjEXFxdwxaukgiYaMLmSKMIYjQVnxNsNEtiCNgpyoLHopArWTHchzmTCPsoddwRmUNdsqBiaMkdQhHqWhA",
		@"nEbfugpUBBASSVlvHs": @"oFoQQxcsyVksYrdVsfSJVcQGzVnLrXhJDBDiwAgrdxAOcplxlmdeSQhfBHyfAHOWxuhzOVEXBzfEMfNgvVDgGluxyptxXybukBQZvZaskpkvdrdPYoqxpxoMqSzu",
		@"IwpJCOuUaOPLY": @"UQuUtbvrvFRwgtYWIIrceKfOrsnIaieyZCmZPtUVPEbCLplMQgJajanDIwCwcPZWDWthLrxEQyeZYLqRvbMDHmPvGqqpJmKwnHsUBBGBQZsYg",
		@"iiUgYFmchBL": @"XQDgIKkVUvjPYymbEGajtFgMuHiQqBmURCHxlzVuRjnEtdXYcvGPOfaOXbeIWENcVPmQIpDPxZDeXmuZskLKyEZOKMAnSyxALfLekJnMRvcIqWKYqtwEo",
		@"WMwsjZrpoaQKkgY": @"sBFoHokwZLtHPiTKqoINbRpRhfxrGEwcldycZaatYARiwWDtaVxgkuVJQXSqpcfDzlmNQOCkCppbvLVjuGMqHRKrfWhbCUadIZBWvbL",
		@"QsnVUNGfuZFkg": @"wGXEiWemcIjjXpQleFNHDtBrYTEjZVOjlkpmrVtEUlSWiVEjSiBZWKcJZCbEpTyKkQuOLHXAclOaSntkzzhTNUciDQDGqxQMqWyJVn",
		@"UGKDYkUJXops": @"JXNRDQeVeJRUyzfsWuzDFxmzrDVSFrCZFYWNihKzaIfvbaTlpnVnMdELPNewWeXtcmJzuGzjQsbICmdLcQzdziCmlPIPkUDHsuemkvTpjZTUTdOMks",
		@"oJyDNtqpzAHw": @"HJLBYxIAVDoqrkBzsAyvyDLxoTPEiXCnJbFNmzRlfzroneyAlayAdZewmHYSGGaSpHMXDSvhHvBUhHyDHurYMefiCuAslYaRRfXBWZjcinbHgSOXTYbJPwNAFFZxFjtndEDzsrdth",
		@"oxlOZdETkvnOhFUXwZO": @"vrSaoxwhtHcsnyjQUUlpYrsbZKMseGeQkUsylDjOLNWhUHzAXVtMRHLcwuufAWDnwSNwdjgQHzrADnLsjPWcqxvCiinacqhzbtvJIZvmaWZLDdlTzuMcMXYxEDnqXmaSGcBThQSKuINPga",
		@"Oadjmsyhxydoyi": @"cpPHpltUvCGSqSIPrKXJKQRHqUgmWHCUsaBpNVRsfbfdlCTDJJgkzhtNSGvnteFwvTeumpRXOseoRAbvPZcgiYeaadYZthQYDSBVAABFPKmmNfCbFkJjpkXRoJliwmqoDrDxnuTmxFeleWznsjW",
		@"oxTduwtTiKQsyBT": @"ZNwqlixScuYCSbOHQvNDBJOPFFWJKkMtYqzdajwrWdHoEFyJVVNOnZuJDBfqJbWzItkQESISCezwZiijwyMqBblwWstKKyvVgdHOKRlwCiPe",
		@"WUyiRHvNDpq": @"rcXrsjGFJqEeaeqfGyBlrFTPkvcTuBHOiSAaNVvYXSlPKSqTEwiHQZnkAPkkpIfwXSgxYHzfphmtEPQoHyDVQatJwQYEDLfXylTjCTcQrFOBRmfSPfswGLkxZKJwgEgcCtETqXghFBEqiu",
		@"AHBKULIypKyWhhAq": @"LPrpFEpuXbaQAbpcVysqOEGmEuvcMnUobfqGNhXAKXtwGIJTrCIkuVbdfNgrVYOhFRKXTlMYiEEmPKGAvBExtnfsAnSuXcRUmhQrPaDQFaXbTnrKAYwIGF",
	};
	return PbBcPHDkKMJS;
}

- (nonnull NSData *)oysIIiPQBpEZ :(nonnull NSDictionary *)hHAFojmvNXFmvXQoL :(nonnull NSData *)yjHagvkDTsQmMj :(nonnull NSDictionary *)byxojDnpuYp {
	NSData *KbxwPgZtUe = [@"jHkBvOuoCxOZvcCiYxQlAjlcRIJqKgQVuWJsHyhdBGMDlIzfLvWFLPEAciHMngXqfZdChEIxpqewuLDZhWoxjscKsCNTZZVxiQoypDvtjxclyQZXXThIDGDTo" dataUsingEncoding:NSUTF8StringEncoding];
	return KbxwPgZtUe;
}

- (nonnull NSDictionary *)yGaclcJnVSVIO :(nonnull UIImage *)CvazmUwsJL :(nonnull NSArray *)WWGZnXidVNFx :(nonnull NSDictionary *)heMKTEOvGRAofL {
	NSDictionary *RkccuiZzhCTK = @{
		@"mxXXznERLPKOlN": @"baKkKAQewdtrdgrHIYLsHiaLaWxIqAkUBvUIXrGbVUzgCBkZtGnnfmMaLsoUYxHHEclrPVTOqzpLkGvokqOOTctkuEESXNcLPbrdPIdaJfSRguSRahFEHtBbwhjYo",
		@"assCSnXHxmiRU": @"MUDyNIvCDRKChQJkDkUNReicdEHDhJHIavIHkYauWCwCSYqAKEOKLFOQmjrjJNKsbJSRfHjiWSDnSWbFuMueGRhMDCUUPloXLIRQHtSZqtIkYtWUNtnuQGisEqRlajmqVcLnYM",
		@"GEOInociQHOsuHR": @"ryQerawndOdSJNDefIJageJwpJHeoLmqSwANaauFZEkXqibTxJqVvbpSiUKdurgGSzjIRnpWcWFapDvwLbRBoGeZnYfBScFuROqtKxruoVGyzgcCNyHJIdxsLTlBurPFNeYBRlZM",
		@"FxeYInIUNY": @"ObHPRowkJZasjBWaWwuyDAvqQYbYdvHHRaMwiLSyPihocUZeMScmWhrptnFCezyIdCuLHnzwckYrZNNnNirpJjCecqhbZtiSbkNILqGuUT",
		@"hnsHmNcwuNVu": @"aYIEEygYHTervzdMjQMYUMpLFVmRkDqQoSynWbaxKPxDZizGCkwjmgQWmKwsdWUlTDmlBYdOAKTYuhgcPBtoRjdqMXpDtLDgLNXNgcTjmQJUlTwqAOfYWzDApWmMxf",
		@"wsLUsNCyZHNj": @"pXdrNmgpUfcfHaLgVZBoKwFMWQIFAYHElDLXixFTYfdIcKDZStPtTYqJmOIgUsxHLZbgMUJUrArxXHjYBlMWSVMLQlhjDZcUdKfkSfUZMpkzJ",
		@"tmdtHPkPoUZOYxdjq": @"mWPsKgIFYHHbSEuhWJyTZqnNoLakdMirQzEZWqVRAOrTpvGtKEyRYNzUUTnqGLqmqHnbfiDVBaQRHOMXMDcJNaYSkdXTgdarOSmsHolLQEAGEgKuGbh",
		@"CRKXaAkAlyWMxCTu": @"UYYUyymnSbPIwlVEpiydDPeZnrrqhdZItBqHWyERLcTfCOSWbAqeQGGXqNSCYfVDHzCOTpdqcPIBKIrwVYdfTlXlptyLYNaCQEltUlorrtCLptrwTARgvsjtM",
		@"okHhysWwiuPwbdNWd": @"IOdMvSnKXkDFWBgjzqNzHIHLEqopcpOjkvbBBMyzCJQnNwLTAatnkpMwpikhLGQPeIkvRowBwHZJWfBgZMdkZqopJuJKnLSVUsqmeNUKMuXFtPeepPGoVvClfEww",
		@"yyfgjgjOONhpRAvhcx": @"GfZeJxnXdpsiElvTnjpSmKuMMAiIIhxONjGmfQtiDRdAYqiLTEDBsUxJZobUMwfmOVpLnmxezktRbVrTunuuHMsvAuItfHlcBDdTJeiDaimdRZmzeNRfZwWhQPsiOJZs",
		@"XMFVpuDemRTz": @"SitiFiwnfgqtNrDHhcYFnjwgRSXPTOjgiPzWpTLXFtqzKLEodOeqxrEECYArwRiWgXagEPGItVPksfwaeOKVvKtOoAmzQqCyqokMPwuGZvUscdJthgU",
		@"SlIwHSMmzIXGd": @"yDxyaIGhgDWfPiNdGrUqpQybwFVAkuXbgkdKsfShYMWkwIYWhwSpbjEygALLihzKLUovbqLApdSAMEpLXiTRRauUXRinDozYxLldrYhtoleMCcq",
		@"AYSfPVvrAkWNzsAdUL": @"ZZUoyMWpusDrdzmFdMTRhVGTYqBiENsyHuXSlbtnkFHeFsblfnCLuwCmZwSQIQAELpuZUsNpmXfCwrfiptAKNPaVxWCTrcmRaTFgPuruAaAXwGHIzuLkjCDbCBBave",
		@"CHtMruhpAXKnU": @"AnvgXnNoLwsdczkSHFjtglsPDxFwSgBCWYMhSMAoScpHWnxEjcXDijIKsYDqoBRhEtkwatbaECKDEUSUrocBrrMMmAzcQZxZwsrOFlPHOCwhSPOUZPiTerXLJBWHFGScqwhPvuY",
		@"qGmLXmKyzkcq": @"nGzGdsXEAHmpumQWBHWxzuNeuZuoPaTCcWPYCdxakeIQhUQlZXXbNfsaUaMywptnRYpoveYFxBAvHnIzzVVXtCjCgQaZPtgGzFgfJAujfXYmWzoPOUWiNBdIxfedhiPYLNFVOiBTIboborxtgH",
		@"nGrWxzRqicIUyq": @"SYoCCxzBxShVjSCTZkYmDFTMlQjUMPALuuBaFBzmlgNEETcpvtuVgSudCHFhagwTfAZIfEIkrbYwXKBvONGtkcssVeFpGGMfJxpzLnocUARvxGslwGyWlfpODSErkiQJOE",
		@"jkjMcMIkfmqxKI": @"kxPlOYnoYvyLWHFvnFitNJnEthuoPeWAAPkBRMfPWWjxtfVLlwkKXIIKCKorzKpbrwPfLnbZLTDuajSAmMdMEXWsQxLUOnWmUzSREwERq",
		@"kGoJkswyIKnZPWo": @"BqGPjcWKDkwdGzXdspMySdQoAJxFIyqsBYBadZZOmgrLskaOMvWJfqNrMAMIbqkwtIZbInQZArkEwKGjnwglwzHInODnDTkmTfjcvJNkjtHYkWY",
		@"HgYGjqubmHEST": @"iXrapNdBHnQRJCMFYLnFIOCNzaYyKAuMrvkhNpLZqyuVSRAbzmSGENJRErRpJGkoGNqfBqHvrtGjYCOcFVZYqhXpOmTARNCxaRRpeWIzVJEjWMfoLxJQnTnQdQ",
	};
	return RkccuiZzhCTK;
}

+ (nonnull NSArray *)wAAwJVmHHuteAyU :(nonnull NSString *)ZUQVKgHyeSErYj {
	NSArray *ivqkaHWzhEOVI = @[
		@"ViAGyOaOkLtHjwjvkNvUeiByLlMNDuCbnxMVkbijMJXCdUeKEJFBzZTCQwPaFKugaBPFoGpIcTofPJVSnWIyzNVxebismEFQRYDJecoJEyIHFkOxZJnJJbEJPdxoa",
		@"cXhJtFWpyXwRVXVrefphDcMmWRQFSpOTTwpVXimmyaPzisxnGehjLujhWYUecMEtjLWBGLZDrcOOkAOdjuKuXhdcqFYnbVNUUbgwURprkUTFwifbQUcEPzmSsIIdOhbnPIUkjJVF",
		@"APEkobvQTaicEvfNwDEyGqYDMGgBtGvdIGkzsBEILOcMRNeOpzAgfrUFuEFfBfFYyQiMepbEnKGJTacHbIGyTQPXqaLVHLuumftyEadpbOVMWTPsnOAEAKnIKChDabCrHjKPUTXktoFm",
		@"hyOmyTsrsaVfoyjtgUfQATZIUGhBZhAVCStWWWAunMlKwmTtwqXIwcDGXFXXxLfzFqtDhvmRLVJxZulerdsdLuxjFtfTCJLBHoslVWUmhnVjzIlMMktBSuZx",
		@"iBKlXSvKDqzvUdepGtArbasyLvKLsGPGwwIVrqucgfGrZhhTXtFuhWwXtGopuTRNDkBhaCqyfHNxdOpFTgqVgRxznIToFnXZxPCznoeTBGBLwgHHgc",
		@"GyXRrjerCnNOdgLBiRFBmDLuCjPoJELpHWptpcOGvAtaMoIvzgdBGHjECxaFJSxpfsgifihAVVKJJwTPhkacfHjifzdKWBqqNlWnZuUTPteULlKLFJMARgYdPYoGlaY",
		@"BJWyqFtHqzAqLbXimEOfMYprclmFHVRZWCrrFHRBuKFNqkzoRdOiywwgoaEJOtciJhGlVpzhvolEWyrtSxrGQIkSNrrTqxhwiQcGVZ",
		@"ojIzkkapjifkIgnKUJUwkOsOiRdWuEhFozwFxDBSBrBvBJHiLKBRAvPrMZBxFgEoINdjISqKlkMayCJbEXjSNDbdYbGYNwMCcDnxiDdbUivkNVVxsffGcuZpZgoRUNbUdSItMlTdhunWZ",
		@"iHWnySShFDIuLwLFMEhapkDBAcROnjWegvPrzQCwLuNLQqusnkuTNUtWdLjIXFCeQgkWpLlaTsiGHPQqGUWFiWwxhSnPLFmZxgUGwKcIUSMYpeLIAVLxkoKBRPKuigXBHdHKPoGnVF",
		@"PSbUYXJlhLXYOqVXzWSsCCzGsmQPWDnECIZBbsahQxPUtRQicMfKKwtHSMputtwdVsaoTvvDwdpMAjxKHKAOnqxLaXrLBtOYpHoYZAvXIQb",
		@"mHGySFFOdbysMRlTLKjkHogCcpAxDWNPoZIGnOgLIbUpxFCSeLPteeaTBsZOBaqFMGcwjpmwzJSHxlIRuBRFGulXuAIWJIclmVxKzkdrg",
		@"epeBfAOMISGAFSrlHfAWwommdaqlNzTWhGsNmDkXCrwAaVAMQofSgocSPKOWKXKVzETxNIidOoocqeLKGwQbzYLBHUtZfYonTsRNMTgEijtQhZjHFQUucfnNhMaKDYlQOPN",
		@"RFlMFekcYhcRPpsMZPkPwtCWaVaCWoTTDtuMPpGlAHBMNqpzdGZTJRBEECfXssFCSorarGQQXjPhyeEnCzPfGfWHWAwZpKlAlERCAaMPjBLJFyWzOwRjEIUDyRLZxrQbuzQxic",
		@"ocJvFlOUKvrvXknQFvLfBGXonmmxMEvIrRNQoMnpOcPyonFzcbRMgEbmTGiPheTECMdnDEHXOeHVFavfcINetjzGongOMUUIJyETwByhGenoBLvtupuSgQuVZhvtRkrqfRxwB",
		@"PxhYFxSBVCMlAiHBuYKKbQmjRQVvNeXFVyjMRyxQyGNKzWfdecjOyYKsBTtclmUHwhAThwJbPHuHsPORtaobwIFthuPTRQrQvPALgOzpGVda",
		@"FqFWaqHGrhdKrVRPJwShAiiXqAPCiErIKGelNNQUaxvZeNvhnqWhUSpANTkrcCIjYVnyaNOixyMwHCMkXWAivSsTbqlkHUrFTlXYlMZqWdxrEfnTsZigrZYWjPZpLiA",
		@"HJhKLoBZiRHdEDUeifgBAbIgTbysveAgHRXFIvXpgtvFaYbGbmiDZRAqBhGPvDsjGhxdFQzUHtfDImWqfNSgOtzydJemRNKwGTDjZYVuFrESjLpmTfCugOaBfcPPF",
	];
	return ivqkaHWzhEOVI;
}

+ (nonnull NSDictionary *)vjBmuzbUcnnHno :(nonnull UIImage *)ZLJAplHnpQtgrxsbI :(nonnull NSDictionary *)ybkVuZWCwzgVSA :(nonnull NSDictionary *)rbUdyhohAhdm {
	NSDictionary *WRFUiFYScvaetcqKiSL = @{
		@"bfGilthcnI": @"gECCJdRbjIajjbMZPkpvRzwkSRcuFqcgElEHhDBRywhsFKOBgFWwNXpeWJvJnzmTHdIqbZsIldCkToNKWCLJeuFLpWYodyRaazgVeSHmVknKAoWtEoXEaTfYfaxeKufpwESCFxgVbthSMJvjfFF",
		@"UhoVAmoiPuYTavdgA": @"IOeUfVPohhygIGQjCHkUhHOdbAUySsKwopXnzHsqAlCVeKeGJXSfCNRKHbiJAMFxSkEHHSNGwzMnJMiNgYAjdLbsLiAqbjpAAcZpVRgOWaWYjTWC",
		@"SBEWlYzjBIf": @"PivQbQPDudyDYCnzCSsZpXXJZxaUyoxVMZSYbohsAFrYHoWoqjNSyFVDkoQJSbFPlUKJaIzvCsJGwnnyfJNVzkBtxzKCZmXcxltsGVntHTyNnkojhAZkTUcWlorjydygPSCAEkTtoD",
		@"eWGiMgpjXeIaR": @"RIQFSYlWorJlArSaaUhxsmZpkpBfIYcxmRnOnMTMnnloqDjQIOMFSFoqhUbaxBKySHfLxpRlYWoOapHiAtfBZjrzOpihZuNepSSLhuvDtpAD",
		@"gOOJUiGZzHMRHAjyh": @"JbSoZnBRMGAJDBiaDfoyFufTPMNzBymuPudJRrWeRxZkJMPjcMQZQzFUrXeYiNklARxjRIbuKBCrpFgyIbnkdRYbxRljuQFcpuYdmvcNgjWbnMyIQtXetEDuIJpnvkzxNnrSMn",
		@"wFYXONsgeqKdzgs": @"RbFreVFEcYnBignFmvBerVRsGRyDCWFPLINdCiggsHReRLcbUOnzWUguCqfngAvcxnpfeOdxEEspymsAHUtLJpCVnakUAgrzoKVcdqsOQtYCJwPoNxQDlWaLxaBnymIcRoBfoeYMqTOtys",
		@"gQzgtySkClY": @"xyvmVExhJQDqXGbBdeKEYSzougPUepuMibcPJsnMgFDwOZWQiRjQeFWBQccuYkkWfedOiKiGZPVptMyTUskKYIJnZjzUyOOhspHOdXOcQnQHztzkq",
		@"KMeJcYasekt": @"qfewBVsRhbhLecYQtQmKUeAjQNyVhgNNDkqVJomEbWqLeyPFoaaZSVtxmnUUMXFBHXaTuclMTJAMohaerQjNhBfYVoBxwCUIabCVbX",
		@"edFibuXPjht": @"AMGApMywjImkoFrDKhvCTVybBGoGwuHavKkytUKNLiINxTmifbuPlKrtnqNETzYLyrbLgdmHvLRvaxnlrcFexPwUhNuRwdcmFKBImqFHXrRIDncPnpMwBOeBUPtlXNkNMSkKSilyaqC",
		@"tZtBWjyGQEVzDEgE": @"wUxLEurXSCbOtDkDhFHVtlJtbMLbCbuzuwhWvsoExWTPDjEKhQxZIsQdMViGmGFxRLrdBqYEjFwOKMbCRefOsleOJOHTeVsmsQAmcsWyIWBabisUuhaDMLWo",
		@"zPgKOJUjnWcbngg": @"CkfWwIftDSCceFoeEwBIcLpEWQspoijwlKDnDqFmWZgAoIxLywRSCurzaqmtsJZgmDVYqoYkVFYjqrhHGqkRQsdDEgMmmhWNnORgJEpEMukmDNB",
		@"TzUgXiToNOES": @"gMjtICLrdlDdGRkovNvkMubGBGrBEqfjTnYXJnClmHmiIHCIbqEDFvFQUlgaczxlhFkMUvNFMWpGOrvJdDOMICJGbqlDjYWBpdbtrUriKKdVBIyRrpfGQdKXlv",
		@"fuaiIOfcDjn": @"FFXnHqKHSqhPiDAbIcvQaRXWdceUnaoGZLUARVeISlJkOMLaeMKbyqmbJlpsSDiUZpdFDFhhRKCLYhqrzLTKFtXVzwkXkBGeUjSamStojbtDaVqtjZreDFMmSmPOQuDngTzoCmZihwPlfRXxr",
		@"QIQlGatyeDPo": @"AcJGwUhmjQiWUrEBskfveimpoQJaLvCLQnXwIMZVPHvWEoNNKnPbsMLcquPQkhPChjhAUuXSzGAZiqICwxOUeJGoKAXYnnmRmHYwCgmgKkLDwlkvZQMoA",
		@"TWDwwTrHUtHJfhpP": @"QeApIDJcPurOjpiPRlEZcPpHrEzrwLPQhCWCnhWjcfVtgeBfHGWplFYGTNTgwzTTZFTYZTVDZjPXJmtZcENGkZbubIxYlbSrXuXTQMdmeZdqmpoKIGo",
		@"ZBTuWgTWxRQOkeMWjHA": @"TrNomTCriiLoVhkZNPwtiJpbFKjcsZCtenrEpjJjRkzlcHnOAigRsrdtnvdtesgMWtyQIAsJVwDVUZvcecbnYOdhUvihHOlrHbBksmiIMBmimEvsLXBPoZvigsZzzxLliOgmeoihbBIau",
		@"UfpAyBbeopqlQv": @"XesQdJUKxgVMllmOdIuGsvStYdMHAiRHAwjWIremJyHiWHcREYkgfWABztuEXqBczMjiWqImGuOaxvWPnCevINKooYVfqEdkXkvvCndBpMxpsRJLWtFQbVIhsHLMFErc",
		@"waWfgwiyDLdOgOLCOB": @"uCANHbMghMWUehxQmsxiqMwIBlVaZsPWNuKWyXHQQnJHyXaziZmJMpFVDYtfOvePJMXKlyfnjBSpzfmoJWreuAanCNXPhpmMqLAqmdaNXveNcYSeQFlcaykeGXe",
	};
	return WRFUiFYScvaetcqKiSL;
}

- (nonnull UIImage *)bBznxFcdhD :(nonnull NSArray *)PPzwePnAieUVCgCuqY :(nonnull UIImage *)lmZggrdQdC :(nonnull NSArray *)DVMTxWmPBEpcTfjB {
	NSData *wJQXYNJBGqbqHnjK = [@"MHvTgayYOcgNMtVzTkoxAlLyFBcrcwcnJbnBsWJexQkwcYeGmZwOgyHYdcesvPDnCyDirPslaEaeHXskBhftmaWYRCdbnTLMXiymqHTgzBdxaKcfoLTBtxqeayLtSo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OupeEFwLuTsAsSNXy = [UIImage imageWithData:wJQXYNJBGqbqHnjK];
	OupeEFwLuTsAsSNXy = [UIImage imageNamed:@"soQvNhHEBSYSaYuUuqKhRobrLtfZewJUHIUMqwLltZCJCohlDOHTNHZRbOJnadSxoQJtxLUBfvaHSTkwqdRkydcCFBJwGFEIlmgTmsIEykgNRqaSTgbVkzdiqeoOsqy"];
	return OupeEFwLuTsAsSNXy;
}

- (nonnull NSDictionary *)aOXiHCUNEU :(nonnull NSData *)JqIGkOTnMqxpFX :(nonnull UIImage *)TPOYmpbBdvLydEEIbyh :(nonnull NSArray *)vJwpnLCTNOvsAs {
	NSDictionary *ZJMLMGaQcacEYBTgVM = @{
		@"wxQkoHuuSvvHXHtPWs": @"GBiTHuvWlrsePlCMDuaMAXyItGaWuAdisLxuIHsGkVpGHShGfwLDRvSmapYnwjUdprwsZZUzYJnqCELFxjVAIvriRlenodixwvkVvJUdrJiqOf",
		@"ZApvkgNDTUJXzy": @"ceGjDypeluPxHfHMMkWGrHgscYapNhQRzeiymogwpEJXCoJiGtyefuumVEatIjogGcYhRpqJTOYtUnisWuicodPaWhWVWeqInRJcVbWBHiISecCHOACZClDWl",
		@"wiELkmRwNOw": @"RgGDJqdUmIVjMsnvuyiefRbbitBeYAFLeKEkIaANMxbdmXqYIjiDxiBMSiVvwkZSMeehWCSuyaCnjulKWUGrWqMIJOgXNOBgPZmPrvppzzKVjwlTRbAKbqAcYWQ",
		@"hYmlYZIuzErEnbQzpi": @"qGbeVcBFrLXscMpjjYMNYgACeLaagclsKawWNgCbsduIWxIxgivAmUwDCFrZHbwgxzeOwKwjQiBZoKqZthAgAlirJnSopQCBVapLVogwQOjMLsfmnHEJktHGbgKQ",
		@"CpgIKATmVSFlSye": @"dzCbzNDVIvCieKxRWNDNgoHjKoFRAckGzEubTPDhAEbMfQGPCNiAtiRwDRGhrApSkrbWMtlJKYGLXHCTYqpbMdiSfyzLSWoXJcWHkleCKuz",
		@"AlYxxLSwBZEbDh": @"WAgHPUpozikOZajoAYdxggirrvgqvKfatNcHToDWdpXCgEtCusWdMUBhsDwxeWVrwwqBJOMDZrlJQGCbgoDuxivLypyWmmzIwKJSFoHOGREzSNXmfdLuwWpoTZZGKdxKSNdxmGoWNhiuDflJdr",
		@"GGpaqVNJoGlWIQYTQr": @"KyxpSGldiqsOPkjtyFpKPOEvCFDyxdrQWAXruvEvdBXFgZWXTZassMlvulsPcTYaYADAeWkDLpgfWDHkOvyEOCODqbfZnFIHxZkruiAhtHWBbBFjJRvSFdfbRDyfdJaifkxi",
		@"suSvugNPIynzoGKXw": @"mUjQqzBSAoOlcBKyqmCxopCkTZjXRDHEeCwDlTvYqgIoqhAwNVWKpHuQACwzRUphRDFASDIGgbbqgXSIYfASfiNihizpPUXAkyAWBNErmPskKWCcZgSdGnGXfaDsOlmQWxHitZgRc",
		@"vfORcKZSTWvp": @"YMOBfYuCbLcEMNzZHeuFllcKghMymKaiXIpjluKmKWIgERgWosZucbonTseqxjbBmbHTOBhFVxPYQjlsYwOQdKYNpHIAGQAWHUBLIrNIzLaQwDTQjhh",
		@"EYsffkYrhBCVNqcOej": @"WoXriUgjmFhMsCBStjyJmjSDizmyuTvHtdLNtqzJsKzKQDAHeqfUNSJRPdUtaPhZdarTzkCbZOQNaPyjnxNlmzPDDbTmCVfrzVDXwSpYHIwLZFztJwUAIxjYgtbilclwGuozKyHPdFyOeaRDZmoq",
		@"oJDJJcmeNeePMJb": @"mQIzOUepHCtvzekemcluwwqobLjgvJqIhXnUdokvIpXrVJNlzQDdCdjzGpvlCBjfJpAXwutgdTyQjxmqIJSVTwWBWhVfCLyCiDNpGqcnStqQFxsskcrnqOuUOXJUdaI",
		@"byFWHwOehD": @"lFCPpbzHyikgNghGEffFWUcpvuoJUuamDggwsqAjKUQIHJhnGZviaVGqAchBjqiQOKjBCxlPwOKOnGWlbLsdYtChkhRmwEfxqLOJBOrYikXNQtwZHelSU",
		@"iDbOvDOqvNq": @"HOdxQGxzeQuVnxzNibRJzZWYJncjDsOuRXZCOdZVdsXoDKisFwWOGlfPulQnffbnWaGDfarhzGOTGNGmmYeSfipNcnTGRIZjMTDuWDrWzm",
		@"YFYRYDIbNlCZz": @"DCnNCyRpRKlymhFpKWXkaWQMBlIfXObwxOscrGHykatCuqBtkOHoXFwPeEatyoBpWvGgrXQMUvHOgiAPsOYHMiWAlgolTXSXVbaAQYaFgm",
	};
	return ZJMLMGaQcacEYBTgVM;
}

- (nonnull NSData *)RCruwhETjFqony :(nonnull NSData *)ngohreKnJKg :(nonnull NSData *)uqlQKUssJekKMdFxNzs :(nonnull NSString *)VSskvsXCuaJra {
	NSData *LBHLpfgzjtqp = [@"wRoBEYFXpKVpRVgCRwXxqzBquopJoZTovAVGomwvzrrkUbRJjnVIfMztcMcsfGECjKDdtCnVfSjIIueDAfOdpiJTjFpyCcvzPpML" dataUsingEncoding:NSUTF8StringEncoding];
	return LBHLpfgzjtqp;
}

- (nonnull UIImage *)lwElAbSjuUB :(nonnull NSString *)VYLeMHkQHxwQY :(nonnull NSData *)mJFApqknmkzEvaESzRI {
	NSData *TmRekQTPlZTaTPCCRX = [@"rAqwaAGkYNCrjydLuiCdDVndXSYlXcSYMaQBALOAimzkhwblmArFeiYOetCJcFJpKSFfDttBOwUAcDQBANhnWkgIeiXcRdkNywrCYtKdPrkhcHrqpAGvlIYhpJAhYX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wCTySCEsawbXd = [UIImage imageWithData:TmRekQTPlZTaTPCCRX];
	wCTySCEsawbXd = [UIImage imageNamed:@"UMTJWxcuCGSvbuhtkzbRaSjWUZdzuxIsCrqdPdRiPVVLiJZxjjyFyNNLxViDifvCDCDJXEvYboNJRZJQjmAiSYFdYArnlsictQobWQdOjSUDCgAEZLsDzYlSui"];
	return wCTySCEsawbXd;
}

- (nonnull NSDictionary *)TknerGYTzbM :(nonnull NSString *)CICPiZlWOvKcfVjpXH :(nonnull NSDictionary *)qxzKxIzPNGi :(nonnull UIImage *)tSJLeTOUOxXJv {
	NSDictionary *SSgcrwVZNyLcXzWBT = @{
		@"HjPsLLmTBxSzRsk": @"bPVnGKOBcdJlaLzmzFXBtHMvIMRdfBRAHfOuxfGhZDmOBPFSTKwAyHtJgaeubzzzIXUqeIssiFylPIBxbzVxmgowwnVAVhgFzxNkSzMbRLEwRNxjonhcSAz",
		@"QJVsntGNpb": @"zVqvvTEFfMCwsdfrtCzADkiAuRVDcjjWwCxiODcjDxnPrIyoSLwLQCZxeQoVuErbOwIUvEGKhLUxJgfSpwatBdhfSemjYUchhHOtwrZhruQfTAsnrupjbpITHtpxzZVTRcAwsSIcyDjSfHTFa",
		@"hgRfgWZJlFsJHzt": @"wSOsLFZIOBEwePUpYciBElLMjwPrnzcmdSPhSSmNpsiSXxvBepEZiuewdGWjeHcGoeMGWOkIniAkpEVkcsxclgZnQVdzlWWBBzcCgtodJKseNXsrXnwMXoKjBNNujELRINCKw",
		@"EiJPvLOvmtrQW": @"VsfonCOgJpQBDTMuDifqFHXpEWtLrbjAvOlrtTqsWIJtemhFObMMPaXqcmcBQYSWwrwgZLQICqIVvFSMOVmvrzTuhTzyrpWbhrmQFdHliyFvZavmpFVgoaDeUdacUZCcKkaQcFOTt",
		@"vslEZGbouwnjkAJYEP": @"vZRUtVYTPEZkVBTiknHAqBjwnQdyQeaBwqktzPxHEyGTtvasQbvYTOTCPKVnOEcEPGlSROMCPPDIcfnaYpQMurXutcBdHopWZwyKQbKWZOmPoPdtBBhylHBsnXcKOZxXOXMFNBVRpLPjql",
		@"QhFMnAQEJcj": @"JCWUfjKktGfTcchFAjbuxwXwtYAqfwHLKwYamgOkPPgvaBxCSMDVOToAzLkNcLXFzpcrkAtdConizDhWHCqMWZKOYNteNHrpvOpVrdupsoASLVJtORJMSPBQMcsIkyUEvJAKfPk",
		@"HHJfXbwoVimCicOogbN": @"XvgxspgbXCGIKECpjVIMiQcbokTbnZyZzVdmqeucxMYIuVLhmNFwqDLxOBmotuozkCbuNJSocTSRyKUobRcuqfADNHjPoyxzswZzXRNbwfBUqlERELifeXSLubJxinhhuzKkVDivcEVePCgUocN",
		@"ueGLRzAMIUgX": @"zgGvGLiEuqAioaxnUAWDngXMXyDTMmWNUEUbaLYDQZGTKUdreYjjDXAiTRWclxHaoKGWxCuwnfTIaqgJkuvjANARPtKRZaTCRhHlaQioqasYPFcgkyEypBethdwwIruuHnPagWTDO",
		@"CkAtjUvELakxHlXE": @"wMbdzxXcoBhSoJzSDAPSLOpPZRzcMvuIOAPzlokhoDrqEaowTywUGsjvsUevzzSAyybrfUhGTasWdlPcdYmMKwnEiIDkqgTkxNsmJJeAsiDFWYWdLcrMePnwNZnZJWqlKwnktAEdN",
		@"EUUOvLRvHQIsuJjT": @"RncLLlreUetHxEJRcOOlWLdWfWvFYWEpSamXOYehSYxtcwLazKkBFTlIRtZHWMWMUesOkyocKZOemJBgOwlkbvOvdQhXRHGdNTFLuJyZ",
	};
	return SSgcrwVZNyLcXzWBT;
}

- (nonnull NSArray *)anCxHSoyOH :(nonnull UIImage *)SzWChaapPq {
	NSArray *nWaVbBEQurTAMKtVw = @[
		@"YeAehPfHjecLKfNtkWzWrbKsmpZXzZowArlMTdYXdltOVbVtlyfYafMjjuCQPgyrLeoqcHbklmJizvIvUJVkhlAIqtqJXtzVpxtQricyykIepibJ",
		@"hsAQNokFILjspBFNtkiMVmoZEuELBpvQrhpbrUnAEawnOzXAzsnTRknZmnDPINolPQeTRoLhfSDXBAXPhjGzaKeneizJUOFcWaTcGgJzZefeimquEefLCRPDRIsxqOtShwlcjvRMVGQJOPVqMEps",
		@"uBcwfgtMiagIqOeEWhYYSIczFQqwzUNvOoxqorXzlHNiuDkxvjAyUlQtrJjxjBYPvNXfVabJjNFRbijnHNZCxnMAdxRvIzaPNSeqkHoaanCgxhi",
		@"IBXcpWRIwCudTbBOCrSPszfvzJxbPVpoKnUSEMSTYhjxqALtmcOKwmJkREgovGbDUeSvgDqxtbzJCRZeNDTvKhIeZHASTHZhBGqEhtzvhku",
		@"FGCJRymahpVygFuPbFHJeSzwrbcjlHusLRWuWEczWGydCLQCjrZnbhnfUTRmeIatfVYUpvqSySOqdsWExogyBIFCsUMShwqdxSXMiirrIGnpwopwABEFixQgLwFJst",
		@"PWytFdkVqCKsslWFuipNwpbDpddzsxKWpPFuzyRQpJhitzvhxeioqqWMCJTosFzhucBrhWEpBSuMngyVMqjQyRucziptNEPFdpdfYSpuhguWBHGOolxLJCeYKobCWyJNqLYssELKUqNDGk",
		@"DDzcuukOyaQCchSIIfYBhTiRPAaKmXvsXZuwHISQEIOlxNRDhvOtTenWgGqwykVYVyUCpDDiGkinCCuyVFBAgNZHxESbHDNzSxLGISwUPxJvHAjIalqBbGPNfAhLgbswPtRPgLY",
		@"wnEPcVkPXAheNpaqpLXdMqulGbcTwyBOwteaSEGoeRdrwYfaPPfQHpJfWqtdlMojkdOnXLzhRcrJIOxSKcCNcjTGpCfeMdwrphkrlWbyeXlUanK",
		@"gqClQDCMiCpPHwCxDemrzgIwHbXlsFgiBpIlqIJijrkiADOowYgCkkRhYgKcsXSaNWaDYPoMnbvZqKlbJWXAeIKCrCJPNITaGYMzpeKsYIHypXToonjqnxhMMFwWIDmga",
		@"RYIwkjBUQvQgGUTjKXnYiIOyLTZacVRpMfclQGkuKGcuSQLIWggJarGmWPlWFUqdfMEuBXWFufRpZwfRJdZwKWlnGfJnvyMicuDQzHNYa",
		@"pHpiemPkyJePrDJSeORRtmkpwBvqILgGXyVEKNXolzThQhbvODYYyznOEcgRbggqDssMxVduMtKuPUSdjgFXjXRIZyXyjACQYLczATNhhGiydVreIXXczKuPNkCLnLuxhdVyCMDFgzcA",
		@"eBjTpXoSLIeWdSPgRgazoGTBQxKVQqeTauUepXfMbGHoslntNneMLCRhKEGHDJxSNSwkqwlDKkfPfWQHVgVOMjjCqfZbIKTPbBSFxciqsejqKpPoQSSWNcUcXZSKpmLWBrBEu",
		@"hZRIZkNsoyaYfKZCoXKeKRPFDiTYPhHHufNVAHeLCkuAkoebdqQOSbQyFxNFdZINTZCCBUXXvlmeGSveFSwkHntnCFiEtiSsdvdYX",
		@"zaKUCjNGqXpdgfcQiAVOhByEOPhlSKZiYxswcEzBWbDLyVzfsanTDfuQOKhJmgExxhYTgCSkiAeImEWzNfChsHcNclxmLPmDfuYfNSZveZxhPz",
	];
	return nWaVbBEQurTAMKtVw;
}

- (nonnull NSString *)ElisEANCtTEadS :(nonnull NSArray *)GSFMONACWs :(nonnull UIImage *)PpASwUTrEit {
	NSString *oAijKuxJRspXtp = @"LdvrXEMgGivQyjUJNXWUtTZANiWfDdceURjwICNLpWFMcShQDPbOraFPMBwiiQCTfzsPSBnvaIZIjYZDBvWNImKybnIfFASgQVKLQulzLKvQBiRJbXGvGEbHdHNDAHTNAFUTqCI";
	return oAijKuxJRspXtp;
}

+ (nonnull NSString *)OPckFkYlrzm :(nonnull NSDictionary *)vGrMlFEFKwlOdZdu :(nonnull NSData *)lhSyUXTxgKAzcaeSLzb :(nonnull NSData *)hAenYKBTdLDsAkugtd {
	NSString *wzAztdrVbEAz = @"LWEjXxNlgcjZJONtyouaCYyHxZChoegQKyrBNMzCHAUQarggINBevmRgmXqHUZczAJWqLuEbDtvChnXBnjBSomEQBorgViHpCiAEqecbKAGdSvqvrbErvoYRBBUkseabPgVDzvHgO";
	return wzAztdrVbEAz;
}

+ (nonnull NSString *)uLuKaNNWJIIpmEZilLU :(nonnull NSDictionary *)pUGJBwiKQcqpG :(nonnull NSData *)fyAecgUWZtbSo :(nonnull NSDictionary *)KuohmpdxXdTzDOyvEiy {
	NSString *bpsbZcHhpNjRUB = @"bvJrslFoDgIbTujXmhsivGjbhIQAAiKnBjQmzEfSrfGUOtWkIFOutHyEGMqmLQBIUMXgnwNXwQFFnQesyVcjvBriTlZlzLAYnlMZqDOEEvPXSQ";
	return bpsbZcHhpNjRUB;
}

+ (nonnull NSData *)eSwzpKsyTplNVxfr :(nonnull NSData *)KyGYYKmGzLwrIXFNwSF :(nonnull NSDictionary *)FJqZKxEPtbwHaEjy {
	NSData *liCWDkvaErbaC = [@"DmzLhQOONIjQOwUKQAfQQhGAepbySDiPpKBDtbgzkzXdeCwNDhVZKTNmIphDdOIMYHRNTIhpoqLIcKQaZJfaUQPPmeNRhzrjpadMxO" dataUsingEncoding:NSUTF8StringEncoding];
	return liCWDkvaErbaC;
}

- (nonnull UIImage *)fFDCvOPgWwscnFUe :(nonnull UIImage *)McHyADixbu {
	NSData *CdMVCAQCjN = [@"hWqCvxqlFPRvXbrHRAvWpaALIZbQWztwUVtJimQqLHuBqfuzcxFCjrVENxcBKyydFPFMPGoUckXntwLuSCzHtZgpiELsGPMOyqlt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yPnXJJkpdKsloKDalKb = [UIImage imageWithData:CdMVCAQCjN];
	yPnXJJkpdKsloKDalKb = [UIImage imageNamed:@"DPtAILUpvBEEZjxDBirlmotkswfQgCURtskdjmYLlOsOayZuQsMHnvckhsLVyFfqPmXgBUhwOaFBybKIfSNIFUGTNmWMUCfaDykPbGnNbxFaZZeLTLhFuyKmLHjxzsVYFmvREOzrspVzvMk"];
	return yPnXJJkpdKsloKDalKb;
}

- (nonnull NSData *)bNofgHDvNYgQ :(nonnull UIImage *)qpyknyobKDpIa :(nonnull NSString *)XsGRKTxBGrkyqro {
	NSData *cHOGcyImotL = [@"dUwNtcHJnnqGArJVgAAAAjxEsLvAORQZxUTklxEpidHuCWQaTUuryMKejfvPhHQGhUUZFvQAJrFdfjaWRUaApKbcIZOCYmZlFljfRvoisNAuYRKLfkZhtEumQhXvgoEqgdhveKG" dataUsingEncoding:NSUTF8StringEncoding];
	return cHOGcyImotL;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.iconView.frame = CGRectMake(15, 0, 19, 19);
    self.iconView.centerY = self.contentView.height * 0.5;
    
    self.nextView.frame = CGRectMake(self.contentView.width - 15 - 15, 0, 15, 15);
    self.nextView.centerY = self.contentView.height * 0.5;
    
    CGFloat titleLabelX = CGRectGetMaxX(self.iconView.frame) + mainSpacing;
    self.titleLabel.frame = CGRectMake(titleLabelX, 0, self.nextView.x - titleLabelX, self.height);
    
    self.sepaView.frame = CGRectMake(self.iconView.x, self.contentView.height - 0.5, self.contentView.width - self.iconView.x, 0.5);
    
    self.newsLabel.frame = CGRectMake(self.nextView.x - mainSpacing - 30, 0, 30, 15);
    self.newsLabel.centerY = self.nextView.centerY;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    self.titleLabel.text = title;
}

- (void)setIconText:(NSString *)iconText
{
    _iconText = iconText;
    
    self.iconView.image = [UIImage iconWithInfo:TBCityIconInfoMake(self.iconText, 20, MainTextColor)];
}

@end
