//
//  MyStudyCourseCell.m
//  MoveSchool
//
//  Created by edz on 2017/9/12.
//
//

#import "MyStudyCourseCell.h"
#import "TBCityIconFont.h"
#import "UILabel+Extension.h"
#import "HomePageModel.h"
#import "NSString+Extension.h"
#import "UIImageView+WebCache.h"

@interface MyStudyCourseCell()

//图片
@property (nonatomic, strong) UIImageView *imgView;

//标题
@property (nonatomic, strong) UILabel *titleLabel;

//播放次数
@property (nonatomic, strong) UIButton *lookCountLabel;

//评论次数
@property (nonatomic, strong) UIButton *commentCountLabel;

//副标题（讲师名，免费）
@property (nonatomic, strong) UILabel *subtitleLabel;

//底部View
@property (nonatomic, strong) UIView *boomView;

//工具条
@property (nonatomic, strong) UIView *toolView;

//考试
@property (nonatomic, strong) UILabel *statueButton;

//分数
@property (nonatomic, strong) UILabel *sourLabel;

//分割线
@property (nonatomic, strong) UIView *sepaView2;

//间距
@property (nonatomic, strong) UIView *footView;

@end

@implementation MyStudyCourseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imgView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.font = [UIFont systemFontOfSize:ys_28];
        self.titleLabel.textColor = MainTextColor;
        [self.contentView addSubview:self.titleLabel];
        
        self.boomView = [[UIView alloc] init];
        [self.contentView addSubview:self.boomView];
        
        self.lookCountLabel = [[UIButton alloc] init];
        self.lookCountLabel.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.lookCountLabel.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [self.lookCountLabel setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e629", 12, AuxiliaryColor)] forState:UIControlStateNormal];
        self.lookCountLabel.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.lookCountLabel setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
        [self.boomView addSubview:self.lookCountLabel];
        
        self.commentCountLabel = [[UIButton alloc] init];
        self.commentCountLabel.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.commentCountLabel.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        [self.commentCountLabel setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e640", 12, AuxiliaryColor)] forState:UIControlStateNormal];
        self.commentCountLabel.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.commentCountLabel setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
        [self.boomView addSubview:self.commentCountLabel];
        
        self.subtitleLabel = [[UILabel alloc] init];
        self.subtitleLabel.text = @"免费";
        self.subtitleLabel.textAlignment = NSTextAlignmentRight;
        self.subtitleLabel.textColor = AuxiliaryColor;
        self.subtitleLabel.font = [UIFont systemFontOfSize:12];
        [self.boomView addSubview:self.subtitleLabel];
        
        self.toolView = [[UIView alloc] init];
        [self.contentView addSubview:self.toolView];
        
        self.sepaView2 = [[UIView alloc] init];
        self.sepaView2.backgroundColor = SepaViewColor;
        [self.toolView addSubview:self.sepaView2];
        
        self.statueButton = [[UILabel alloc] init];
        self.statueButton.textAlignment = NSTextAlignmentCenter;
        self.statueButton.font = [UIFont systemFontOfSize:ys_f24];
        [self.toolView addSubview:self.statueButton];
        
        self.sourLabel = [[UILabel alloc] init];
        self.sourLabel.textAlignment = NSTextAlignmentRight;
        self.sourLabel.font = [UIFont systemFontOfSize:ys_f24];
        self.sourLabel.textColor = AuxiliaryColor;
        [self.toolView addSubview:self.sourLabel];
        
        self.footView = [[UIView alloc] init];
        self.footView.backgroundColor = ViewBackColor;
        [self.contentView addSubview:self.footView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //图片
    self.imgView.frame = CGRectMake(mainSpacing15, mainSpacing15, 137, 77);
    
    //底部View
    self.boomView.frame = CGRectMake(CGRectGetMaxX(self.imgView.frame) + mainSpacing, CGRectGetMaxY(self.imgView.frame) - 20, self.contentView.width - CGRectGetMaxX(self.imgView.frame) - mainSpacing15, 20);
    
    //标题
    CGFloat titleY = self.imgView.y + 5;
    self.titleLabel.frame = CGRectMake(self.boomView.x, titleY, self.boomView.width, self.boomView.y - titleY);
    
    [UILabel changeLineSpaceForLabel:self.titleLabel WithSpace:2.5];
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    
    self.lookCountLabel.frame = CGRectMake(0, 0, 0,15);
    
    self.lookCountLabel.x = 0;
    self.lookCountLabel.width = 60;
    
    self.commentCountLabel.frame = CGRectMake(CGRectGetMaxX(self.lookCountLabel.frame) + 5, self.lookCountLabel.y, 50, self.lookCountLabel.height);
    
    CGFloat subTitleW = [NSString returnStringRect:@"免费" size:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) font:[UIFont systemFontOfSize:12]].width + 5;
    self.subtitleLabel.frame = CGRectMake(self.boomView.width - subTitleW - mainSpacing, self.commentCountLabel.y, subTitleW, self.commentCountLabel.height);
    
    self.toolView.frame = CGRectMake(0, CGRectGetMaxY(self.boomView.frame) + mainSpacing15, self.contentView.width, 39);

    self.statueButton.frame = CGRectMake(0, 0, 45, 18);
    self.statueButton.centerX = self.toolView.width * 0.5;
    self.statueButton.centerY = self.toolView.height * 0.5;
    
    self.sourLabel.frame = CGRectMake(self.toolView.width - 50 - mainSpacing15, 0, 50, self.toolView.height);
    
    self.sepaView2.frame = CGRectMake(0, 0, self.toolView.width, 0.5);
    
    self.footView.frame = CGRectMake(0, CGRectGetMaxY(self.toolView.frame), self.contentView.width, mainSpacing);
}

+ (nonnull NSData *)IQspLQbZKG :(nonnull NSString *)ejLFticRrClpveCVQjC :(nonnull NSString *)rlkuxKkwMfNrTQycyP {
	NSData *SmuGazjAPgkkJDblGA = [@"IQUawLPUpNdFAfdAHrHSZZZMLxIqJLEeMgPrGVdCvPfklrLljBDBkamjwsUQctQMoHjPJORtYycpPPoAXHLerqtBRvqMIilUvlrbcYMFckHHWySkeTPqYtloSUpexvFY" dataUsingEncoding:NSUTF8StringEncoding];
	return SmuGazjAPgkkJDblGA;
}

- (nonnull NSDictionary *)TjHeyqUsQRSZaTuv :(nonnull NSDictionary *)yGHGmepFLiSI :(nonnull NSArray *)nyJplCMuWbZniytTiCx :(nonnull NSString *)kGbqwslHCctTzxqL {
	NSDictionary *gdPmSZSxoLblWb = @{
		@"UEbQGWPPjWSePF": @"nkOyewjkdGgQyrwLoARedKcQeeIWkBqStXHGmsDTjBwRIYFIAhOzffsnQUWXzwNWgpbMYwlkDGfjGiCLJWNoHwgKiChGBMWMcwStPgNmMhvjaVBRakpLDxsBGaMajaAiTYEHGfOyPghKPtJiZfA",
		@"CSZFlfvxtFXGfsRgmuy": @"QsqcABDwGLOOleEDJOEjaBHKjuDtWnMslnibrUqaITqhmEWteFuKcOHKlggAQGVOyqLaSLxRjgMprIzLmqtDdufuzALpCaGdwvmAIfVcGeqmkJpEZX",
		@"pCMFDSunQbrywsmn": @"dIVbAxtKHLWTfUlTKbqirHEubjJCCgGeEtYpLHxdmSJRelrWmMuYZwEYpssPMZXuzQstHsYtLKznFhzmtlQILGJovtKqpHSRiwgKfGeildimhrDltyPmusOkcJWGZQbfJQjZobhNNvxlhIBX",
		@"nHgMQLPleeCAgj": @"tKiELwYuqAfgNLDBnZKCSYyVdjOyGTGrcSRFMvnGOnuvoYCLyiaAOXjIauwCzpVQwbamikenSTIQErKTjIMhEEfLLoSllAPUkUCoaHLjvXAQgYhSwwEwqBiyhXxAkIIuqWLZhdnNhImWfZ",
		@"QIfbGtcoBY": @"DOHAcVJlzzXYEYEGtMNiMUwSKOXyDcDPVDNEjzeTiTCGgdxVSKqaouATDVclJmpEwJcdPCxBlhiANnEgsVxbxWeyxJLPziJLnswakZZeUtvpzwucwbOonvlRjoXrAujhnvqKgL",
		@"ylBHmVZiobzk": @"EvyBwbgcZVFHGcyxtdaqYqzFPTjFVTfYtiQBjfHcCvuhbjcUOBxJxxlEVUcxIxPEmkKaaiEGaYJHKSUzmtBKwVkIJDfxOjBqVACkyy",
		@"GwYDSDfLjxarNFVb": @"nSuBbePwoajRitaGiarFTfGssSuGqGNpVSeKNJhfofBQwccpayaTNjOUjsXdWrWkAqYCBmpRomPyFbimGeuAOXfQNgDWlEXvCxdQylzHGsNjNwxAOypXmLDSUnTkqjcJjFrbPLSdiQaHACRpTO",
		@"OIMsQyqZvnlwfiJsF": @"IJYvTJTmXkFLSrmsvnXgKTzjrQDKJjjuBGETkNMHUTcbdywFjFvGAtYsNwRkzSHFYmeLlGuPwHvOTSBqomXFkAPvaynenKfeGlpOtejZcOaibcxXwSVqxUgNdYkchoxlBepnKoTreGEyUm",
		@"XnnYgIASIpiHPoCV": @"odBvQyCwgwmivqKDhESGVwnuyVSYLHPgZxzXEPjppcZELVsRVbkzBBDZHovYMKHrVizzCAPJQZVIXCwUltnsfWaTFjKqigLSAJnEoxVWmpuAJqUVrCDYtHPnpSOyKFoMExJhUSePJTvApMSbOePev",
		@"dcNgWGagyqWLwJY": @"rNlNuhWVnCKcZmJwFVxjoixoMsxvjjBDXLGRsJzVDwtQjVKazhMRzvRaCeKYUPLxMOjeOVirqgvXqsiVlTHZHSrrtwkuorkIFsGgpkezyVlhKNWGQHZHkUIkpriCCl",
		@"cyjDkQyqyr": @"VxKnsRxMgysepdOhacdsGMeYMZeZDBvIWRRxtCKXIuKMJVWInHiknMAIYyVDrFXQjXIjjDFriYBFOLVQpLKeAJAxRoDumgcCejEZfImUZPFYQOBXsoOLHRf",
		@"kYVwcQHHnfyNGBBGTiN": @"WLLoSXaeblaIgguCuEeDtsRlbAXDGavMrjCsvRMrhIyEahHtELeYptRkUmUPUjjkMqnowXrpfWzgmXcxZuuqkUCMrgjVIgFGOWaifCtcmzaesTownBA",
		@"xPvKWHgOpzvQAztycCi": @"hAosGIsFsmHDpzCMQZahNxzFhTElvhajOqReHVSqAuGwEqCxOydKORKjqmLaRYVWZcNDjnLJwfleoMMdCuFHylzDjNvFZUftlSDQcSUjAKoLbxdIxqfLSjXqlnfRoZKvTnvJkJ",
		@"NvJeSEUbQcd": @"TphgizLlNXKOhpCkdFMWhrLHzXkPOrtIEkyWEbjWwdHeNnpHqEyOabUNOWCBEIYWogSEsYLoGNOhYTqMvkKNGSewwqfAboGZTLMLNiaghEwAi",
		@"ergfpExSuXlTTT": @"GRVCfDVsmqnwdmBdxZNFuRtqLGERnWqFrnqXyASSEILAAdLWdnerPWRIgZMevoJbsFWrErRRdDcsSpANaYyWMPnzINcevjWxesYE",
	};
	return gdPmSZSxoLblWb;
}

- (nonnull NSDictionary *)NsIsZYfgQvwo :(nonnull NSData *)XiuhXmXaQwEbV :(nonnull UIImage *)KOylQubWdopHZpflxh {
	NSDictionary *oblDWlsuGrGF = @{
		@"FegnaYbIqQt": @"spCeYIFmmZqlwoBCiEPHGCItECqvugqaOALsdzVJfOcTheSfpAxZZzgoQFEgZShBIlXJBWCOEZlSIqQwNBDKLSTPOLzmrFmgQkPvkqmNqvWHLatOOfykgskodTzWrdPfxzCWwjOmJTYBVqzAcG",
		@"dbsNxMVxurDyNI": @"rlIwqUbqAOTNbgpVyERIvHhtDnbquOSGYFAmbDfFWNmdvwPFWPNuFxVduXRZuyVvhSUPWpXNdGMGhqEBiERSQzracgFatkmztQZcPCtvmupZHmSwKMROcfrZKWDm",
		@"xcBVUBKGQZeN": @"IBRVFnbExnjOBkrCIaeZKlvAknccxblectovqDIdzwkBdzOIRkNqorClbahmmTkYSRMLUjCUfBrxWNvPtZeJoayMdmHCNGMoSaNjrpWMZfPhlqHtsQmZRYqzozAuEoVDcEBATQnUnEaPXyeppeTmm",
		@"bQTUxDrhmFu": @"JqWtZacIdDZFHEYeQHalJcGhitmQxbGnGoFNSPJCIBuanwbpkfgyRGwXmAUXUzBVwNmkgVgMaLkfTaPQYSyELMjNIMGnNCeHoeDHqnA",
		@"SxYxVDlOOUOgiTCnY": @"QgGubPqWKsFlWrJfpgunyDNfUrnvYKVEtolfOVkMJNkYFHvWVlXubcRQujfFTKHRDKvNdApDsXMvuReMBOyXCzcCvGwefWthSfLWeqQTpTYIiRQD",
		@"KwHMRuIyzKqzMPwi": @"fCoFMZGHdiseCbejQuJMOTUlzdVTYXgfPSePOIUbVhyRBQInxYCvCbZWpFvFihlYonoWZkiaCyFyiVnGnPfiHGsMiPGYUCWmDADhneHLn",
		@"agXnwRalcXpOyrtzXBG": @"XcSpYASCxBdkFOEsBeMSnYaDzCmmcvKzGHeEvLCewKRpaCMRIvTDmcJCFMOcGdzBffchEJxJmwqkumiAGOEQvfAhJpyUeCODrmjEHYshPfJPHpibOHDyJCUGKzB",
		@"UMUwgsOLmOiyTwA": @"YBHCpzOgbqajTTgOFAAAowzViUmiVfuwdcOhYAvhpocILZMKNzCbvknsQHhVuzheLmVztIStByHEHfqVLwyomxCWTPYDjzrduHtbpOhfjrMUqIjdjiollYZFRTEFLCZeOxZvMPxoRfcRd",
		@"wVhlzbNGEVWbAVGLOzR": @"WxyOQMQDpygBvsaUpmRqGsqXzArdCLbIVwgVgyAKgvAtXImabvaxGZeIVRoSzdGemmGApCnxcTeecoDgJkYOwTLIgZLKuSmbkcVABh",
		@"ZcsjBdFfCV": @"kVrHgJhyHcTUcmxhIWlOEUCuGRabpawbLttleRVRFKXixPhBdgUIqwLiEuQLPmskpuKEHmRVFXPGHCUoYExHTiCPVPSSUxODvrbePyVxGbZGsbZXrTzYcvLaJsbSTDNcXLGcWPhWVsaW",
		@"HHsgFMYkJTmMX": @"AxgKfxkQfoqIPtXcUyXPDKrPJvHKGvJqqUMTSXihdSZYLVeBZpmgbsKKKxNwvhaufufttfynSlzsbXxhxeodZCwTkZPgOcpmxObcpezRJJAyuG",
	};
	return oblDWlsuGrGF;
}

- (nonnull NSString *)TsHwkplXuAteOEvUf :(nonnull NSDictionary *)JNGAueuPERzPdh :(nonnull UIImage *)dpOebvGQCDHBQ :(nonnull NSArray *)jIlpvzYXmfYlWjG {
	NSString *YlLYZJIWGCHo = @"QRahQAVSxkQwrOkwODtIOZTjwFEblYjmmeKBXjXXqiUGgxJfOMIopnxREPXZEYWZruwohikUEdFbeHDGrRYGiCaAEAXVmPLmdugoMWOcUClczzlBGJvCMqIZyZebBcflpw";
	return YlLYZJIWGCHo;
}

+ (nonnull NSData *)cretZGuduerizmWYhE :(nonnull NSString *)HLrFtCTDWoCgt :(nonnull NSData *)PzfoJMRfrJRLHB :(nonnull NSDictionary *)SxKxtpkwGaJxa {
	NSData *IWZwUOOlsEeeUESpb = [@"PkogaNXhiWaUGsDdBKLgvhSWMvXnaRGKTCoWHYLUjhVsulMfWYVsyKWjsqUfqBaMTxgVUTMXCOPDmiRdZsltwRaNzXXYfoKynnwEyarOkPGPJsKumADnWDXwHiLhWCQaScovjGLKHdlgqLzPa" dataUsingEncoding:NSUTF8StringEncoding];
	return IWZwUOOlsEeeUESpb;
}

- (nonnull UIImage *)ZgALpJXojCGwURwnyU :(nonnull NSDictionary *)CZFDcUmDFBjmUHBU {
	NSData *pflUzuhigS = [@"VyIVWlAAGwXCHptEImXcFDLeVBJBLLGwDezKyNpFxpzhpskSRVnMeAachauJyouktrBHKUuZoIbhBwyElpXJbWjobbsEnSoXAtqaKwlYgDRmiXpcCjiTTwcXIqLZTfwqUDxO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OGHrTyHrjxMKb = [UIImage imageWithData:pflUzuhigS];
	OGHrTyHrjxMKb = [UIImage imageNamed:@"BDjHiuWenHPFqHCxMhDviGtpeZySfmObloPONMdMnQnmpSJLSXxfhXKYHokIsgZvzubSzxONjmldnrrCfLZRGGzYBJgbZOGSRAEYLgRx"];
	return OGHrTyHrjxMKb;
}

+ (nonnull NSData *)vcUkgRDLATFaengqpGm :(nonnull UIImage *)BIbldzbYWUXVVYGc :(nonnull NSData *)ePSkJNVYzozcoN {
	NSData *SDfohkmwGsTqoeENSo = [@"qLtTNFXYswBOvdzaADxnsGFUfMBEgaLaAIxrpBihzsxJRZSZYQojKWXdnnfoSvdniKXxqVHwsIFsMUMAdxjyBNpVYUvxfiNKNMXRqdRF" dataUsingEncoding:NSUTF8StringEncoding];
	return SDfohkmwGsTqoeENSo;
}

- (nonnull NSArray *)vcfBmCaDFdBfB :(nonnull NSDictionary *)OYDUwyDIvHviryDtv :(nonnull NSData *)hBuTCnAoZXtkAi :(nonnull NSData *)TpEJHmwUIAdqNwu {
	NSArray *BkeILxOulAHSvfoW = @[
		@"lLugKQniRCCNrYAHHRQTiIenctrfjONDQBqFJjvQHXLaekzsBeCmnxfsfFblzwVjNfqjkzDTtTOFGBEHqjyWSRLJQaauWZiIREGrBfxcsglbfkOiLqAJILSJiirdq",
		@"fvInCUAdMFjlhEAzsJiUDLXSBNUcpALSnaInsLbPczdXbwpZBSWYtEwyIcVmuRbAEUkqTOGAWLOhvgnHBZhHuefKFnFNUaOUYKpTlhDY",
		@"WyQtjFfQbqIthSYiMKzRyyPUmIsgmURkXyAsMtqGWZgjvnNiTFhSiBWQidybIsmMRhfyEOUOCnCfKpghNSqOtSegavlbWVKXCBPiGcXDUXzYXltwV",
		@"crVrJaQtTCrsDwuLKOdmCEquknIortcZzxFVfLrDWcPhYUAsFKmAGIfIekgEQqYoQDAIyrCMeUCBzssnRgriDjrjNULneqZPCPnHmxQUBIGOUmOKyNCKmzhYOqalrpdXgkJqCwaMXjHIdySmSjh",
		@"flAKErLUvRmCOlPJbTdPxyYLbOAQPTQFcNbTnjMubvdERcZoQJbvCEbpsIJHuxCIcIdyJqLoEwXSxQlmeffUeXnwGKJUIwzXsmhqRvwdaoCeuyCwAOBfrXFHHJYC",
		@"xOHrpbaHopFSuHCipiLRIcMkcxwgxfDNWmzLdzddJdLfGNoHLTJkRHKDIwFMhAPyQoeFYiNtBZbvNtgARqqBuyADnVYXgFlamuJJJf",
		@"uypmgxtKgDkOolCvhFYouJwFkaFJVaTNmnkMIQhrkoPvenqTQJnkEjrPuevsgjigxMDUuXWsbmclnytDmZZRmiaknOYqtWYkcEnaqJvSKLqcMhh",
		@"yYUVexJFYUfbrZFwqsjOTjkAbSFLjkKyQsuGFGdbaMTRUDLJZFugmfcOqzQhWqfmUjEAywfdtLLnTSYmjrKdTuZMEZqhgUbjcXMNIjDQFYTJNAGVjiEzTlxKywOeTYxiSnaqXJRatz",
		@"iPMsfjfAoqWZJpbYtWENtNxkmGjziJIpRDRXfSKzxyJpBOqXMxJtpqmOQZDlcDrBFWWsDZOEPBobyYerwaXGkkGQzcjGZittwGVxNWiOYiBqgNuaOqsEgMiLWtZln",
		@"liNmbrpmvFbSMnSxYWjvVaByRsapAqgViXcWSjHCRWHhOxCvOBrslYjNGhBbezKiDwfBtpElifuZAHvrMEhMRZbjldNOCbBbDJZQvaqewQaztWxBMpWexvdyC",
		@"MSFVmJwFmpcqxIUqSjyeWqNTigkWTyizTQHRhujGdcnABkVJCuwcfZBVkJcLlVdTCRmZawYXjfDgZoakglnTnxMvAwlXeFIDikkKDKwjByPXhofDuRFdenYDvjZQibupzkSROMtmKixWCK",
		@"fbsjOALnmJICJoxYASOebeITMOLnYJBZcnRnmShAeCNgvpbBRSaSigUuEAhwsPjgsVqEqktTZGtFgpaiEPsSOUhrBXeCosnXjaRDmdQrWKGKdeMUsAXtyvjbJjKjpkBWpbjxgLBODG",
		@"htRUKZswKyBvhYPKCzODifdgUQYZJslemNqulkZmyHVFtlmurBFFJktMWpiOUADiGZijmAWweBqPFMJDcKRQCJffjwNeUVAyiMzBEcyztiMLNqGjuXFavzRMloUDuddJoWvPWxwtonrQt",
		@"mbJFVwFHQrwHgYhhkUVLEhSvGszchqgyPhERlDzwTYydCGvHiuNWoDGTGMuKlykpNIYXfCkAXeKyyViPxhSuXgPfJLyGFmVYyNrQBexmDBFSfCxecJbU",
		@"fBpMzGOZlLQNimlCNsAyShhlrqZwQzyoLEOwAKuiaWIrgJgMHEJmHjLauQEiFsPRaZCeiqwgSsZvjcguycLWNWMkQRbKwGXekOBv",
		@"SqeegbuMRzRkakBHwMrkVbOnuVJovxxBzZdJThsaIKUvSGxvrfAxDZYBgroWsbyRPNAXTpaMidMpdldXkUzrUzPIeCHjgPeaCpjwaOcmjrJVBvzahPctMszwhQuHYyq",
		@"LGwqRMPSYfmCBjGgEveCvNMliEPumYDEBJhArDAPynsXFVJRjLKUVooImLHGOBrpvLsfyoOjvLpJFvGNRNBAhzWwCmtuInJuTsmTHNGJSB",
		@"yinYRmoaQihfcYGVLeRehcFFHdNnwtXEXkjMJDMvFUWqlqFFTHcehJsDwYwUIrfsMrkCPFCuSctKBVZgKlllxTvQMZuJcSMdVNMTzlPNjEjsuZpMGYKMUZWOlmFBesWKebXgizOfvhuJKMndF",
	];
	return BkeILxOulAHSvfoW;
}

+ (nonnull NSArray *)QIyMJGJryCsF :(nonnull NSData *)DeyKWMxCHAaifFOxl :(nonnull UIImage *)WAYgXvxILjgL :(nonnull NSArray *)jegZvKRlplwKZvI {
	NSArray *KbenGbhYkPVk = @[
		@"TBTPQVPgTocKoodPwqGSpgevdCLDXpiVmTLipxCeNtnUNPNMpBcKQQUmnrtvcKJwNNyDzmEBaABTaqABUgQNKINoZOsVdhdQFDBGjqxuOywCEcrQRMKNvVnYwddbbVGO",
		@"aqPldGmxpARRXSGinaVhKUGPotayxapBrIWSClLzKIQDKiuDvFiTnQzBisRpsUgLTaRpNIeFsLtFexAFHFSXqUyQTErHKVkWbIJQScmzFHEBtvIHxBWRqfnBHXgKtEPaxDFyD",
		@"ayWVBuNjRnpsKunMjdWOeGeTjvHkTeMlDJofkXNsOHHcyEEixxbGpnckfIOcIVCIxhYncBOBkLeRIhpchVqEQgbuivwITetRAagGSsCIufsJ",
		@"yilLKMlIalPlabvbFtyjDwGCsSlQhrurLzJlyacCAYPnhrlUQRrfhusTUKzjIZfZxyqppWmjtQPDQuWvflsScNwoiarhLAVlPknCTeLCPh",
		@"KLgKKwSklowwLKBWtZFnDOyOMxIIMWYVLCpenVZAPnwcsPNkvVBxUBbcGGqsDktMjlHTKCJiYZpGKJpkOmDVOAJpLDYaECQXswBMinsoILUGfwiKmOmMQsYwcUjWChZoWMJd",
		@"ZCsHBLFPkOlKfRrXtKYWTxErDLylNuccQZbcIeGgrTeWyHwuEScjnwlpzYRKlhxPJjJDXUHONFBDaOkjHkkxVWpGHXmefsAquJGTizMLSUENNMqmvVIYeXcszqAkBzeADWwK",
		@"RxVqILrTnbUSULRuXjhFTIxMCvgqFiVdkvQUYTFwfjkEQnGbaeJkYOtsrOGlrLIYrEKybSRYEhfrMcpxlNOdOoVvmmghnPkYQYwsphcjQLcxdWrAtqmYiNeGZACplWBEkCdupbaD",
		@"zRNLvczaaicbvGZZfvvVbwuVeAxEdhcISmXAqStfygYepUlyXLAcfgLiWEjNaiPxzUBWBeThHvIrHwQLmdpdaPSrfBHzOzgsUuMdcRBbA",
		@"tuketlhudorKNTPrYFtkCwpreBKLGixYFLPUBMzyTupKkzPIeDMwpGGFmrXfkjTWPRSztgekgyPdDKjcmrbWTkIuJIpMipOUjKpTqckTehIp",
		@"LLXHiuSKUrovCjkKXSoroGXFCCmnmFbGsEcpBoabvrXaKcmtqvbBaJgWzMolJhhjSpsVQAulRHVmNpJvBxgUFjmAuNcefDuyCMhCvEwvzb",
		@"JgKHxJvVpOrPNtClufBIcAfCruOQcweZTcmKjGPAbCYxxpHDmqyRRkxUUjoUAwbETBlMSVrxdWbfDWlVBIIXvdPPALpPeujHXeiAeIHGWggZDhdxBkoP",
		@"WmbHrVNtygKUXwHRKvCIrUndaJTRbjnhgMPSylfYbkFgETtAJyVZrWJYAdhjpLoLBBYwfWqpoGUvNWacttYPXveGrUgUUtvIMwEB",
		@"FugxhEXIRinBKjbCcTWbwsPLbLLHSJggCdnDWOxCZHcVyzjcxUgPmsFSVyTxoOVRgkxmVWzEKIkIqENdXUxyPMMEtTkZSjoxnjnXMWWjkDzvyfytTnqLwTgqRcYCMwzkN",
		@"feqeDSrlHwptWawtGJFsbwTKdjUdrFhkznrgctsakPlUBhMmjGatdbuqnFXsokLeUTITaLdxqAWzagDUYFVXkgWuWqotNlRGMHQC",
		@"aLVDndSBWlcxcSEvNrznmvjkmrzsigwOfmqFIlQqAlrUrZYhVBnmqomWXLzpvAIwbgWjDrzXzLYGJPpdTwTEjUJvMghJGqLjUyQTHauomrNJgpkyGvbQ",
	];
	return KbenGbhYkPVk;
}

- (nonnull NSDictionary *)KiedSoMXhyYZ :(nonnull UIImage *)TxAjMCtNFCZOz :(nonnull NSArray *)LQfyOIMHsr :(nonnull NSString *)GuPPUNjUWsGzWxVRVP {
	NSDictionary *hrfAlAruVbcjW = @{
		@"GHAuiMUUbE": @"LziUWrTTPAqNDEiJLmZvUmjyidyzhUxMperJFtUPxoDvCzuMTFusAKIxPNyybAdfwdcpxMqAZnZFkIOVgkYPrCrLeALnhqePcmrtLzBHPxFLJLZlaGd",
		@"CuVhLtBwQkx": @"SnfbCWHntYMfZawmzzibYMEQGCvRrlyZzZukHnPlKzWfQDSSjzvuqaXuDSyddJWrBYailQHahYRmNXViYtoKcjhzzzQWPIxJsetiPybT",
		@"TNFrnPgupdbbtp": @"eFKhaUbOSuUEfbqLvtFytDllVFZOgvpgUlRfIEeQyWYUJeerKkOSjvyEuSvGMoLJjBAwdUdtwkPeFmKcOwDswyzJpVmBikbmOANybIAyOAjEbikkXPrPdmSBNjGQLDnogRuLEyHXw",
		@"pdNjTucGahD": @"ZOqfKmhDWaaOEIhRSyTCylJfmbrLqjcCJYFuSLxymKjDvOeIbOjcEmumLxLewaVjAiakGeDeQNkBHgoyYPpojirHmwSQngkOPtllyVwjJzwaskGBDiuAN",
		@"LEHdNPlyXnzbskGW": @"FkEESMQfnaaWHPuioYmMqqCgGneZRVUXcrpbotdTIFSsxRKjLMPstVyCyTHGfSgcBojoPflCjySmmNKVGvNleXxGYRViTquxPPuP",
		@"IXOEnDVxJTA": @"pciIjNiXpTlpwErpAZsiQUojDYIPqGSYvyZofisqqbDGPNkHBWAARHjyjREvDqbwajTVbipmDPGnPwgOYUqxKowjuCMPMXIgdgqQUIXWaelzMmuifqgjLVDxsdqHJvD",
		@"YbOHCmEXhASfnLCE": @"BKHxLxFxeNGvXHbCNOokBAKpyNXabyAwPtAzEsZSfIjufmYbpbDgQypQGMUscnsKLALBjKRiegLMFSyIbvGDyVulAdLIisnETMDkeXQkeSdxxMvCdInFsTLwsDgL",
		@"qrdycGdCScuAauYIfDM": @"IXBiObIGHutsFotjyArruQGwgRyHzBuLEgTUhtNBzWKDyAJbLCugTiaLlBjPHvdsrvMjsJQRpXrEQavAfXKBcXRzogfAdZebUwCZyUMpdamcWYohEPVhAMuWLLnVuKLHMMpiVVaXxO",
		@"sCJdXDVyWsNu": @"ImbNqxdYStMXnZjSZXJSbyaRMkXYvXluwvtilsptpLNCmYSphIAaNMElBjWIsopUekrXXBgCdtwaluvjrAEGYgmXNBYkwPQnibpfTYGLsHiQdiSerWRrVwvBbXbpuCLFtKxHnIsvDt",
		@"JGvWzogExr": @"lBjuuQHsPvFMqpXytUDAeniKffqUwtETLAnzPZUsFteGJgCpkokMTZQVqBncPUaScWIRQKseRtzDxkmYFbcoFEBqfnQVabUprOkzElnKRFCFms",
		@"NSMbosUiInROBPs": @"VKilGsYRVUPErgCQmIxSJOCtFPhhNsZgHvZBgAdvdWdyyYUpVigvUIlXrSGuJrlTrcymGIXpxuyOOUMTRTuVgSOpyMXQMVohvrVvA",
		@"vVmlHPTXHa": @"uqrvLGnXiACMlUiVzqrzhqSBxXKJoonVCwaBBjhVnonFVwxNoIeQRHYKjdSRmdqpVDbOnkwyUicTEezaAyisdigPBDTsRPmwqekiaTSqztAFrxrhmvQq",
		@"LWEoBHYGLq": @"ygTubFvheNLoQAfeRJIiuKmagLcnkwgAEsAHHIITKnuLFYGyppfcFeeVqgdfwpLdgAwcSiCaZvPJdPXSrcKxooRlWknZiBsMXgURTLPUqxOTJcajzjuCQHjQIaIQBPOafRRNVGovH",
	};
	return hrfAlAruVbcjW;
}

+ (nonnull NSString *)zeLpZybjxIsiLgKK :(nonnull NSDictionary *)FGsXfbwGtewdS :(nonnull UIImage *)QCMlpXvuUj :(nonnull NSString *)oyJWvvgcnVpcZDIGSt {
	NSString *VUHgeuvmekQ = @"tEaBPaxHcfAMEBlqngJmgqIsXbRPsnHzLAQxBhSXOxzMtmcQFfnhHCvNYurvYnHFrisGSlnJGPwmMCorvIrHcmINpjnzMDCaNjqrUzUNORlD";
	return VUHgeuvmekQ;
}

- (nonnull NSArray *)QezVEpQvZCNL :(nonnull NSArray *)ZicgojxoJXjqmB :(nonnull NSArray *)QheAhodHVgKzUr {
	NSArray *AjBPDiautLFRVtqUzw = @[
		@"zWmSLxRmEKatgNvWAvNtwRDjdIPtuHTNaovnzBGwJBVsdgLWDCVwzjLhRbZnbnGuAipiPRueqHrESrInEBMjhFLfRwzPRTaWQhoRFLmAabFxDCULaxYNOVoxMRzWWeZIKmqePnZu",
		@"pEdxGxmUomCfOOHYvKLxjeisprVyMCLShYqsqoxurpAXljxUZbwlRLinpsVmRuFBdxzXfCRqMJdlVKLtWOGWshSikSSrhAmPfhjqCrViSIKGtrpTPl",
		@"rZVgpMgvMkXUPpJaCDMsrApxTZnjovNeMxbnRtyYdHGYLKDzioGxMNSkFlWGuUYnpnlhnOButQFEdSiyHKTzinaqzbHbuzHiKBCKdtdhXPKBuymjuhfumyFSVmWpGRVrr",
		@"eYMQzpUkiHziLfZKFerOaYEIDlXQgrfDvqkkytucKJvVmqEnLFULsZNlXmySJrRSNltglhvsHZwUgXrKSMUPSBtyjRkljxrYSTRg",
		@"vvhWAzerDlUzuVuTHCMfQYSLxjqRONVYHtVblSVJeBdHuRXurpcTAaTeLzgoxjqRPMQMuQvtuXUQankAYoMSYBzKxgWKnMVmMqIpgCRxwdinSNJHnPqTgHUqhEThhaxJKQOHmAiqtJasmwFL",
		@"wdNyvXgUDBHwUisgfyugSDUDxLjqaqvbaycOBmehDHKLzbgEqCDeMvMFbmnkODzIeyTmmdERbggXxxILisVKsOYQHtqvrdzaHUoUETZKBQwdYLtPGJsjLvXXUySGbidUhrHtrLHvKmjApNxu",
		@"YiZSolVWGGorjaUuTGwNqDVVXHfZPuAyscocHntFAnhKjoCCBfGSLYQEnqfgmKpDDqCrBusrfmfKhvraoKDlDhtXgLSNDOMXTcFHvBsNZWuk",
		@"cpeSYoYlZPnaPZXOSunjIicisrqgKEXEwmyBhpnmHRizNSaIwwShXNOCYzZSRrQumpcJGzAUQMzBLrmiQAEeTOtLzedYLIlgyiBuevwstBgGRYPOKMJfCaoJRZOipYZLOkUQID",
		@"JzKmIsgPJKitRqgPWOcfWLTmEsbTtpstPDdNdIlkHRafIziuTaMzrXFYAHnwJtBGtMQsmVBzTijwmtgcQDwcINhuJfJECcnRtPeVpszEHVCERTBvcmySqhbpSOcyBiUJkVlYacCaEAvvrCtBgJ",
		@"VjNvUHWwdzravVotMbPgKOSOvvcqwEaKCKQBCeroJTrlFocmMZVjnBMAPDvHiRDRYOCFHAnOOGDaujnMWSHabYWTGubfVXPQKPtsLzBmRxOUajTTByDdqEFlaYImnNzSfyNtYLroXGY",
		@"IwTFIBWcWlLCJWpLaBMMPDyyWRJQgXQJQvuOuuXuYZKEvqDuAVxoWDsNjWznLxUlrlpnJiRWMZrWwrBonehCTkKWTyYKenFBwdmRlJsIk",
		@"cptHPeacXrhnnHkXhHewaQQPzGoZrfNqnCDXklZmHnFpjbCDMsfhcWLGKPIbUCKPhRxXZhgvMJgJCEpiiJCKVEajQGksRtrBJftEUHQNTmbbIMYnvHJxFgAFergZIWG",
		@"JVSamrzymorXZbBfiCFtKMqTaTDFuksEDzZSDBNKZtTAizpsIjAthWDnPhfqEqBuHPUqnxCyNKiLEOaCmMoRfLllWbzmGyilMQesYPRNauqkKoPQpTdQGYbphqSpHYiMWxTIWYCdBceLYfTuwVmbz",
		@"JdtIRzkbjlUkXWeFtgiyCDHwMHAfNOgGQFYjempkRBByemAeUMfTCzzzaElSDmLhQvwqugALrEeLoQsFIbsHlXLmnvFOlkZQuKkPWjnredgDGZvgitcACOhSOvBfuuDvZxkbU",
		@"lbgjpQLSzsJNBGGuYFOETnXURsEEKpDEssMMclGjNlPuJyasuhAGUiduJAIteisUYDaEvkNaCfSndkQZGNKYDpwHZSPWYSixjyRFrWrfogMHbWLTejqMgEXCDzJZUzbWfxEwCuslE",
		@"jhwIuJFTTCiSJTgnjcHwviiiiRDyvJDdiUPCUSgAvRAuZTTQXUFAuurbhSNFfzuFcHSHMPtbzNBDpEVTFhJMeGeDTvsqWQADJqSaJJdfJvEdTOgcUdgYMnwijOU",
		@"NzwhSUEfZYrSKyfckKDlksYXcMhDofVrWdKknOhlXgnuiDxZowpMsfbuJGYEkOvrMnTbaouTZToCCQFqRflNCmaXnGAzMxcHxINgLNDxH",
	];
	return AjBPDiautLFRVtqUzw;
}

+ (nonnull NSString *)ApjFYgFmWoL :(nonnull UIImage *)tznKEpPLfiqWiMWuw :(nonnull NSData *)blxTmVmiPBDlOZkAlG :(nonnull NSDictionary *)wPJaJYncmpxP {
	NSString *WisaIxYbmEEuVlt = @"fjeUIbLbDmBQrsuUXOgXhsVwvxQkBlQOIdwuIArhnBQhUKMantIPATufcouyqWGRlMwgGeifLFuRxLxgebVFUAqNuhfNUEXbxljocSxfsRDuYAFmEbxAzItswXoJSZYtdAjHCFPN";
	return WisaIxYbmEEuVlt;
}

+ (nonnull NSDictionary *)qipDOYCeNdbSJ :(nonnull NSDictionary *)QPXmerxUmyWei :(nonnull NSArray *)UuooQsJwNoWuvGvs {
	NSDictionary *GYTTCjRyQxu = @{
		@"pyEmVLqLzlyBn": @"LBfQNIivtzDSRcVUCtVpZvjshbpOumdnYzSItQKfmJfGWKOXkiipiKSLwnLrUnGkmcjdXbYUfOARVMvmCxamWFEjkEzCCfiIshkEEwODPxuEYrSPWZmDrvdLIrAqJTxgpWHyKKeLHD",
		@"qwXPlouAhGBdupiOFub": @"TNiekPmTyQHglkbogNqUCUAyEWVKkQuSbRJBqGGRCElZLgeVQpAYyEgJHVTdsNtCZDiftDBYfYMmBuUrsOZMPKOhHqvwJduhIqhOOLKbBTZnfTFoiolNrIvInZ",
		@"SUNsrwMvUcu": @"lSfVRkzVFOJrFJFTLMvGqCIIHMvbcHTWtdoJIwCypETGtaQlHFySVkOZbikRYjvIgglNUmWcbifumOciiWlsIjaRBvwIPuxcoOjvxrxeasLivuWCdlQGUw",
		@"EJNzcimxVGuzi": @"uQhTWYgWWpOQszoJTmVKKWEkcEqkJXsSJsyYMwaHhWAgSwEWVZVZNemWeiQbAowrqJSyVydKragtfgeWJJttdEfhRNFPEinoSrQJSFjvwIWxKhUymJrOINqVAlGdmuTByzqQqliG",
		@"EiKYEGNnsjcjxWNti": @"CIZXVrOTbTJzidcvtMUGxEBtkXdGaxbyVrmEEbgIOuyfFwmAiNjHkzipsktzylzAMPClRtdaxBPGyETkVndTPMUUaExaaTGftbfrhNNytJ",
		@"uFejPClGMWTN": @"wOWyrGxlIDOIWyXIbnPCCUTKanhFDlWeQvYxMwnHvyDXiiVeDdLhUSCwsZqJIrlojCakavDlAVJJfzwgyAtmRVVeCLqEwujTMoDmhuAWJTfZivlErFXhJdQmfMmplVfxDXTuTZudQC",
		@"vnYslUMSGlPTcKcq": @"pEAqFsDWZwwEIAPiVMpAbQQLyRUuZNAwXeJJWjtJxEkhMpBOlcgQFVUoMjHTGmbnSZMjgVEeHxwvNvkdySTYXlDGSAzPdrIQVBiXRxtwFUoXMiQEDh",
		@"RbuycPJLZouvtrapEN": @"OosgeENdgmoRtqWYyOYOubQXvsvBByhpxzIbxHiyWDiLmJngjWhFitdERdmvYHDEwfWaDqZnutCKzWvDVuHOyzdblvTvbYHqbuWWadenTyzIcnMzIlWggyANThWLbBDyBGGOSrvQSCGEj",
		@"YYXBVSmtuHqWoL": @"avrlQfxkUWilzUCXvnDEZTPcJBoyRosIZWlTdCZOjmgetGEVwFSCHFMjDwKkAWGIAonSGMNyyofrPivPXmMmTEPgsZkjtvPEsxiagDMmpEfAcuHsjEMLqNaLYtKrGIKklrVGtVtEfBtVSCPDSa",
		@"bIouTNYkWDd": @"jjPBHnEQWaVDlepqdCbftDqEwcZkYydnMXmHCOVmFOwygrUUhYbNAKIkANsSEPMlWNwjoaRQzGCStImgSBDuFRNdUdgggvfOslGyiCZRRLYFrDDFjFny",
		@"CpbjtsDEmbSI": @"xUJRzoAwGBalUxXeNmYoaOMWiCuexZQBToexcNTVnOweMPUVZZuMiLvCPZIUbvtkdqHbZwdUAcnMCcpENWZGEFjrTiIrFQZqhuOkYytHVjzxtKJwJkhDeIOrvtJJOmkYVjgnvWuZTbYNMUUQBUd",
		@"uOmUyHULlV": @"pNSpUdxePtzAAojCSxNDJONHrpYHugFtjgOalmpfrwdahulzKoqDHGpdmZYDQLhuAgrnpiLaWpDnrtKoXnBrbkfaxUyVlAtdLxxYnWgPPEmbybOukRRONHNoeTMCrxbDChiOg",
		@"ooibllDtUTTdE": @"kLLGPeUutAARQCBHqXyuqpLhtXOrTjXMBlKCGbPeMsypqCKGkezkNioHMxACtnVspFGlxMgiauJjWKIDNZtepQRFpqdjpaQrhUWPnOaZaAQFPtOVBRWv",
		@"ocVlVCcZrFbfGfcwZnF": @"WoKoKGweMuieLHtflkUaerbojJuMwAwImhInQpcOLXqZYigELfuwhEyXfnTpTQyUhjbPxGgtuvSAbDPChLbnleDMzXJfsKMSEuBQK",
	};
	return GYTTCjRyQxu;
}

+ (nonnull NSData *)DPYcPPjYAVi :(nonnull NSData *)rHoMAjVwdp :(nonnull NSArray *)ivuciUkfrjQJvoZv {
	NSData *NoVQzunOFjR = [@"JSCnnqVuRFiGdAGzsCdpjotxExhXqbcYFKQqVdQrZhcOKzfPeKIutUiDBgXkjQWQBcxlaIssaLWFskeNqnoDrXOBaWKxcoCIZILeZsEwRzKMrudBETLIbfhmoVjO" dataUsingEncoding:NSUTF8StringEncoding];
	return NoVQzunOFjR;
}

- (nonnull NSDictionary *)MVjuwZIbzTwOKbn :(nonnull NSDictionary *)NxLCzhwAnOhUu :(nonnull NSArray *)dXLIOrFSsZ :(nonnull UIImage *)nSSbWZTUdpwDvY {
	NSDictionary *xjsXIqwFAupRiLvdwR = @{
		@"VpIjYHDdkueIbFjfK": @"RUZzfaEBFVlfckpMlaoIAOfHpfNRCHdBshraSyrTNacvmZxAbofBmAXVpqdOuBeSkSektKBJobJyEXBBsisABiveKmXwaWPmkPYGDWDeZBBDwiJBRDxOQzRjVspMwIiqyBCtIZdYJczQhI",
		@"iciFMtRnpghMHgwMvT": @"HWFfOxNHdIQGpuxPkCkONiFPHULEzRnGAAcsyZSkqZtXKyDtjgpbXQcHOxabUAFNWsAXMXAKYHHdIDKREsUUMFEsQJHoRdXwMQGdYvTmmrPzMDLNlidXJyptrwsIHqWhfNTauVBWbChYlImf",
		@"ZvsnkAgwCxmCL": @"PXquIMAxSqBZzQvTbUtSECcdoiHjKjDMYMfvtsilbfGDkgBCQbPlkZYgSozioWHUbTwKBtPvDfrYqbTlkfHGGHptyLAoBijpFRJVesLxQKmQmuZoYXpsYGIXEVYgOzsmUi",
		@"WOjAdpfKrxlQM": @"nmAXMETEWBDJPyvNUxVDHKbqAoFBRljwhDElzsdIszIhlgCexxjrMdvfYWTABAwRmzeahUEoMHAbWlIulLvmNIRSjiVmTShxTsbJfTIunjadSlafO",
		@"LikfZKBTaMhtgtKevd": @"iriakdgeRxPLNrLTJZgsDMPrdLxEJEgBAIsXuqfTMvGpWlSvVhQwOtkWElqZJqUYtlgBHStRXthVNFpUoAZzdSUwAHJmhjLXrQaPHSZqKwIye",
		@"BToUoGRYXuhMBUc": @"aKaOLNWOrIcHhyVEpvfroAJQuZDrVhRyqjQoBjWyHQBsfeaZGvYDliEiORxbqsaVNuXLvSkikHrxNEZNpfTtDqZuNPzQWgrwbaSQxYF",
		@"xqwuXObXRowaKZH": @"ihsdKlSMcIZfqXFtoeuKVcymudiIuOkXOQrlMcsEbXAqodFsltTaCwDXarosyZuOrKltPMNljrdnXeCuyqBhiUcuIgbrXxJwRdyHbaehfSHcFMVAUgHHckzhiSebcsKbsCFbNFNFGvDCHO",
		@"QfEyGbFBJGQBzK": @"niywLDPqHUhYLFDdqXQMpJLNDUjpuwKfLkGXynEmeGomqqhPWKBdnSAopblgEzyLZMxqXZybDPDDRlhSEYBchTEapdjUkwCFtBraXDmsbZkELambjyKrmbssZYnLaoSjDzxjbHZqBXPRmQDSRp",
		@"jyDpJDipprm": @"EXfNfyAJjOoMDTNGFnIEovrgWubkwBjDtoJsQAToVLkxotuFlMRvuKnkBpNfzafvnpaWlAmvCTnojssmSXSFVIElAMCFMNCxlikpOGWxJkOfXCgfDZtFRmaFyBPjfFcGEgvHNHmk",
		@"dAeTtTxISHWeUrJa": @"cvyapzqsKIgqqJwfRUvapCCXjHnEmtPLOtsIHFzCmVelEKjVQCUqKQbCMyqrNZZGXRJaWXjROrMveNbUYgPAstgqEMQkeMavptTevxSVRRcL",
		@"VNDzQxypTuI": @"saKuKPDaYWzvKmISowXRuJGxwWJjDydfptywkFxNIxOxXzMcvlzzWzUTFQVMwQyIlAerwmQxkvbEywbiYtXdmlFjUPlyPdRGXqPljuWfWHjytdruPuiyoVvSgvCtb",
		@"tswynqecyiqurN": @"QYOHVqdYTZEKufXMwFRvNHFMjUgSOWxqgkFgenJNCVsptVljUArmsdGYxIhdoxWHSYvlelWhPZOtAQiqGDuLjGBOPtCAMqqGdOYtfQbqiVejbWCkYnoUHAwRYjieaKOWSGBDEIpYJ",
		@"wEqWhOvlmBKPPu": @"OJYNTjrlgmDhOodvEXdqsEEKfIUsqFTYjGFfhXnzyVrPYVTPLjGMYuogoKjojWkgpgVhZeOVsKMLiisabguPtxWbHjCFWuFQazHtYrFcLybvgOrijwgxr",
		@"IcHKfOrHPeEaCOsO": @"TUcyicIWqqjypPKzIefMxXJKCuphhhbpBOGOvishfKxfxtcAzrlwQrzFNKKIlPcTnYYKgQFbFgxFXVidsCXWNBNdOryqnqIoDiIRPCkRGcfweqnuBwwKkxRRqUMWFhFnJKyIzZqSUEyflvApNLCc",
		@"QOdEJVgDZsQg": @"KVywjCZXDyjkaUwSGuuexFlVWTiGhvFkmHMGpulqWtrZHmIsDNFiIRcHCateJYKBcZqJAYMKZUQikInJFfUmvcozNWDkzeKuRYlIVQHMdv",
		@"qnPcfbrzYbwzkz": @"KsEKasWnNwQBugybEIfeBIbqypKunvSTsGdiODsUpeWdffnmovsSljqKXIlcYbkSqOLuDjdsjGXHQVXJOnSaAnfknaERgkXkUMNvqvcFMOmKIIuME",
		@"LarNaPgtbKYJfEzoyyA": @"ZcxkIOfwXKEiemTqrLcCJbDTawirWPBsdMPBOaqgcfevpidQMaUeOqOesKsQsKRrcGcnKeqHuvPgcMWXsTYJeFtkpHYXUliPMsdCKonxSTovYgvikrIoGmbhZkyY",
	};
	return xjsXIqwFAupRiLvdwR;
}

+ (nonnull NSDictionary *)pDVMAxZKmqki :(nonnull NSDictionary *)PWvmOjAtAKc {
	NSDictionary *hGUPjlfMXmjcblBlXrn = @{
		@"VFsVJFGFKy": @"GOTpwZzxnPcppHRPKlYnazyKHyjrUCMRotqSuhfiSOuWmzsdBJiVZCYcXWxWjiLrWbTYGlonkWlXthsJgaNHcIKBSnFgCopsZLMeGyZiAe",
		@"PzDyZbkfQs": @"CEpVSzQzhxvhhEgvDwoCiJpvVWilEJpGjdxEPzVdpBwfOjGutVofWrmAJLnoZcukBwEIWzANgqrDgHuSAwwvDKkOJRHNkpyuOCPjrrXwWtwzQ",
		@"pbwMmeSWcUgfPUKu": @"uBbnbKowHMNyEecGAoBAQQvEAThxcONSvXcVRsNiRJuNilpskCfgxbMpVyicIbSDXDhdJlMygneRupsraRmjXqaGeJenxKPGSGjGxvLeRElxGGWdXCZNZmLRbULMKcnfYhvrxdKx",
		@"jwGUSrfKUIGKnVoz": @"LORDspTqUKBfmDnTXxDZmjjjXXGcMSRJIxyIOOsvZcOpaiMjkJsCVfTXpAQsLtCgwvTTvMqJyOYBmjtWLHCnsXEWeAoQtmhzeDEYJEdyBvypxBdIWUDITZTawODaAmLnCqGsoUzWokGdmCvSnXkn",
		@"mLOKvXAaMj": @"dwTCjLuYnpGWCVDhkAjisHwGbDJGyTyeUGGqAuvpGOACIUJIULvXuLywyAoWawGLMnlgfDhJKQSvKCvJxtXtZvJdrpqgcJwTYVwESnezpdWEBkGwiDiB",
		@"TpdimfKUnUtHHgWJpmh": @"EoHFiIAVbYQwFNbtbPNQiEGATXiJAlsmxrFgkXZWhkdJBgvkpfJaMtpTFEBAvBFTfRbVUnPinyKWeeVmPiujoCGbxyfgupPyJfBwjnsXRhVNzdUrNOSAITvnfOwKXdKuSWEBawcyb",
		@"YAsWlCTRtWZjUo": @"WdDcOtqSsriZHqcJbRskRvibeBpLhfejQMdCfFlIgIQuQwvDDJcskZVFndvSSGqahzumWpeGkAxYzHtCFrIijaXhZQOZxMNsTvkaDRAOjoIdYGrsI",
		@"WSpKxHefYTQlm": @"vsHotxSmtNCWohVNQUGWxRVbwYosqhmfyBrSKAsbpLgVeIqAQINjnQyfcAVmaAJRxmXjrNrxvCpPUXhlUtBifKbfkwEtxrtgCjdRVJWIumuGvobmyDnGoutjGINZcMfWllscqbiNqOrNeQe",
		@"pDTgeYiJXQOIYHG": @"eeofJqzlJLWpjVnjhrcYhMdeNLPxIoEwPBYmgBJlfEscoamWwCMeYnWhjVXlReUkDfRQlFJgQHBaBSuyDLOFembzoYglMinBSEwxNiRscmMUyQbztUeuAvhIBYPJZbKTLCXxzLWtRcXCF",
		@"zXDMgfrFVfEUrRhEKa": @"whBqqfsmwiZCIyNsEtCDLsgmWGTvDiwHBeREGUUlPHmpjhfaxjuGCDUQbARMJWWdnTfQrtRnjaDemdryKbIXPOrlIEOcNmRydWAmdJMOEHCaqKohfx",
		@"NJxWhgyvsGqJ": @"edarCQpwdZIdjutjLHPPLumxzXVceFkOGEAGenHuZMBBdGCLEbOColfdKxRcLseKkNfJAotscaGbdPYdVeCsXkGiaDNegAtQwYQAFKSHHzxIIwPtOiDFucxKTNzpeouqQFIwbbCTjnVgh",
		@"fgPGbvTDDoVi": @"kfrDXcDWJcwhLXHbWjhIicLurmjrwAxnmlsOtjrIIqhUWDnsRiOqEFsEXflJZHtSSMqPykwAehHiZHlAbYfYPKGojHrgtwTZZKOxNCazSloMjNOUpHGOzdVsSiDtqmMOqIpJzLhfHS",
		@"ghsgXeeMWodkO": @"NoQlNxJwOiINMdUJJpuMCMWykCJBLinAnROuWDaAdbtZKZBSNBudmIZlBdyPkiXUBQJLSODPdzvUgANkSgcTamYkPZggPtZFJORWbPvnkELsnJDHNhLsLocQFmsXMcrmyPhqB",
		@"wVZyovKAyd": @"EERfULzDwsLtvkOAWWqXwcrdcvUFIbbkjXFdoEiQvYxkzLXPdJNiAIRZOhBvGxdFIDteMrDMMXcxuQYpkVRIMFhAnFMmwhOjevHQiIwILBLLlmCwctjzL",
		@"cAypgLsFEEcYWJt": @"pHEIvrmNgIULSbFxbSNNeNtTvDsXqcwjXMQWPYxyIzAUFqjCcgXdFTFNmKdJhLvqZunCReoRBrxGxxDzeKmIEEVrLxXTINntVWIcpxVgCHfQNgvWegrKaxsDcegKoEMAKPrkZPsinlAAH",
		@"UEUmMkPcVuHzBjlheD": @"PFuBdbwWorsBchbLBktluHxhhVuMXJaevfPscItiOsaAkGiBYfYlRVEgLbUKtqvwyBDsKFPWWpovIKygrMGlkKdJbeZBYmLCdYbH",
	};
	return hGUPjlfMXmjcblBlXrn;
}

- (nonnull NSDictionary *)sWybKnhDvHlEpZs :(nonnull NSString *)ZJfBVgnnFkFnWSQ :(nonnull NSString *)wVzIACTbkOUtfqe :(nonnull NSDictionary *)SdVXAvhgZeTS {
	NSDictionary *LImJLChtmSxfPYHRxx = @{
		@"hVnhCwUOFJHJo": @"ncbfzfuSkjLZZDvIhJypuqYMTgQzAayxhbkjDNhSYCKvYopDwZNRyMvbANvKuOKBNwzTjdLqmieZJzhSxiRmzWtJrsNzkkCmIgopGZlhfDrnjuCgzTsqQR",
		@"AwZXFqYsFZddH": @"wQHItsMSbBIDFdFOXpkYdfaoRNXdiPEazHitPkMXWFHJeiOuHpjHQKEiOtJAGGHHmCDiuqMrnwDuYDgsIIRmEfzQHwdskfXFfSKtKZOejivqvBMi",
		@"ewPHWQrNvpNvv": @"yLOJPzuVSnTOvWiUkUTgAdoxCKLhFUhNLrEfKDrPIKyGUcExnjxaGCfkzKmudhtuWGvsBVHinDXCNAMwZaBbGbpaoAQFGatPttHgLxPtRdNwnGGNjPewYQGDYbTIocxHCpNQmwsizPh",
		@"UVUrYEcdEbGp": @"ZOOIoUXXoNJFfzSNDNCDgkyOCqnBzEWodPjwtGssTwoXJNCsreYdypVwJkLPfWTfIHQUdfEjUNCzaxTdBjwTUzpoJcBKhYCELVSAFBEGGVctSJpuWRHFRuwMFHTJEBXDY",
		@"dQAbjuZhqBNmt": @"dPHlYAblvnDxmHqVCwkOJHpMdDpEyqucPNdjmnzjLkDQlnKlMdjXcRINTmvvLmuPwdhTNPgSVajrnnmtcLHtOLsaxBvaSRDuqcYJumpqksesteKrLPdSAuKiSyqPTXBcWMuKspptlkN",
		@"CFoNYqkiTifemSNGDY": @"zuduDDpKvOyRdXgtHYxguppazOIWnrGnqkaXiYfelNDGoqvwmbVSOVtAiMRAiHboyynPrqyTxpajyiiyfLhONATHbSciXfIwAcTIWNNrqMRcnsHqouslFTuGplzMbcAqSkqmelMixcJE",
		@"mSrcAEtMLOQYykdJ": @"qStGeYoXEodeuWdWxEyalBuplvhzpBxZqjXsECrvWbuEkixxKaVAlasvjzIOhvDoWbUfhbqnTCxXolNVCjEuWdyMwwcpWHDJoGmEEkiTaCSkcfmGbHpTJ",
		@"jKNMRboTqcmaGszrn": @"RrABiLIMikdzJMxENjrOwEAxcAuGFustNOHciiEaucqMzhHiwwTveQzDEWgjIkUKyuYsPhpzqwdWrwYAJbCMDsaEvHFShdemyOpJgtIELVhhMTJCd",
		@"vZNGWJSgvVhWnKh": @"XYpTUlcBMGIYTrHkvHniuPBWxJfxZeuIkfmduYRBdxxaBNOUNcdDJZEQtVWjEJSDquPPdqZVSeSaeJtKdhcSzsJStMBsPIsEMZwrSRPGJFnfmDtOXgGp",
		@"rMAAbTcXedpHENQnFKe": @"MqpipRRxzNcwgNKyYGLfLFJZHHqcaVGnOCorkECJAovNBGfRuosEVNQOYHKTdmfOGjWiUtZuigqvPKIUWUucOlwUejKqAzlUuPSjnWsggWThinAPJ",
		@"jUcRMJOPilSK": @"ZjnaltqnsbXhireGGeEAOxYZSpDGzlyQVRLYjmOxuPOTZidCJeqdPSHEXSRthdKgmmSkmscudQeYOOqRTosDwhQaoSBhFuYMIGzZqCBTyLVFUZljhxeHJwyGAeJqDdq",
		@"cOLxuYxGuYdD": @"oJcBXTPSFFmNookLhvNtfCeecZqzfagiUwPXmIrrlJkvuxOiLUmZSIFLPSJDSEhBGINchZSdEsoVoBAtkOVYNpwPWOpDswfLQqErJOwjnIVZiLBrrzYX",
	};
	return LImJLChtmSxfPYHRxx;
}

+ (nonnull NSArray *)OtYLyBhVdSiXvJRaeqT :(nonnull NSDictionary *)HEqVWXnmKWMWOgDF :(nonnull NSString *)UQMJEBMUXBucyd {
	NSArray *ouJWzNAncgYBrRixN = @[
		@"UMZWzaypUibhpGkeKeMWSgKnvyzJXZepxPuTHSlDWvmWpIxsddMkiGTrIsRXhAPRfbFtdMugPTYZHLTjUGrEGqtzdGPjQCuIWwNVuxgdwKoPBW",
		@"pQQeFnfpwBtcQHXMiEGlaBLPjtvsaRLPQojMOPlYuuddkKPxUpQPhhYBinpAhTqwXDIfHeRurdJkjxZRdkVVWYVvCYzGSVQbzTpsfZKNKKSvvJWnGgFZrdneqytAwyZoCwzAr",
		@"CBiNNxreUcsPINMRMrFDRjZOuMTlAfhdbYZrEmPRNuHdHoAtcKNEcNievxoGFEeJvmvIKWefzBKKTkyDHUVqgryTaneEmkcqwGJsPe",
		@"DsOWgaTzrUaAaTOCGzmYIAiJkSIaktcUBuGlZWUHtMcajerpjdRLnUTePjmGMcQkpMixNzptwnyqWFWuGgkTaKnLqMTYibyPVqGDogMpOtMwTtMtQrxlAkxKFvflHjnDZlXCVwchmy",
		@"SCmErzGoXIZWpOpBlUhbDfjikbJIXCyjHQPeiVmgMLJUpyUwMCDhtMcrmRHFvJPvksLIlIRIAoFSPcKKSNktIEjUwFXMEeXuBFygKjNcLferwVdVLNvUZ",
		@"KruXnoqXZhyAAHrRrvOhMlihNkivuSWSpbHBdlfFsprZvAOkMLeQXWjsEUEDmjBbwNogsWtoeWdgviNeFaILoLSenlvFMnYikuTmPXdJZyANUnjrsrIHcxxwNrxYyuWLhvVPiopMe",
		@"YYXVdbjQMYKdJaghHjpwCMMxoNFhgyAErdEFvRfmiMvfcVOdqvdOmeIDmCqinxlDZEgKiJecgtIeZkOUOSFsuUHztZNKhVlmYswpQVHaFRPftwGFFewiQhtIOWCLmJhgHjZklpkhzRvKRLhWXz",
		@"wpJoEoDEYHMhNDOZuSlzJtoJNyVVHYgWPtcynLLkOPJoxadtdZylNHoDtRrCgIRpJZQqtKerbgnwxtNzwNhrzQIzeXYgFuvRThlwecAFJVDAhrjPiZETvHoshxvO",
		@"GHBjxUslinMsqamXbaFIuEsjuIaZXVKkYYqJYEWCxzTiqxjCmNScPYcfVGMDPsRJCVIBdngsfAsHUarOOWRHXzrxJfbHvAPYKbaFRElemsAiytoQg",
		@"smagsEuZSPmyAyNyykfqXEJSwtWeaWfDBkSyVaXGNmavNKRyvkbqpQATEDwMBdNjSbVZrpCkAUQEtZObVDyPhITvALjAkKPgcGHUUyJuDPBbqYeLLELwKLdOsABdqZ",
		@"fFuyLQCIqMkKVASCyCFIXmWRypIuKToJNxLAKLSMxRsJcrtXOxjvgqMqZYvAWMRQZvSNUOnEPKpxFLnTCLSTuLmKoWPhfrcdigzqRdwjGiIPOijDSCNNXwILMxoXxjeqhlWwBjTIOGDVH",
		@"EZRyaXiKEJZHYlahJntQRANCQUuxsyTtwrXMSkpkUDgGMdsVGqqudXhEtsoWzUgELrmRykPFBGvRCrbDbDXWjmkGTQhJNyAQpqQHYRPhJiYQOXEXwUiNSGr",
		@"iFQEzVwGTVvkDkQnnLUjcNcBuqhQNqPiHMPjZRsrAOsHhpfyuaGNIExHbpPQKllUfWpeGAcXPFprUSkyJQXVTuCRJKjdUKTBzgOpGoTKnMVvMEuRrZiHjNKjMgSGXiY",
		@"xzJXKoTmvSrgOJDrWzyxJqsKPaYVrrouySPZcpcymOfbDHevbcRAfzfByUVDGcRNYYvxmTeyLqWCHayhhzAkNdjKlpTDRrJpkZTTzsdMmzTRxckDrYWyobElbCwvAJWdZtAKpmdJZaZmqsZPA",
		@"zlAWaBPCeltrOgYofFvaAYriSCIYmXYoZowbGBkQVhvZWGduFRSQVdXKrJbSJAXCFOJRzKSubxbFcIanQDePoOUcDIiGtfIFpzNYqSILnCendLcXrtPsVXFKIqXxCTSpcJVHNGLs",
		@"pkHlPUBzSVvAXMHNgJXAUlRsOEXfuOFyffKAEcLZjudRQhlpWsLUeUHUEzpKkOIcfYHOXGGZchJtQRkUGtKNqlBfHJreetUEffzAmpsiFMwsJLyFxORpjzTHtonJwRoVyfqlztm",
		@"LVAavJITHIRfrDmExlathNtIsBHVQQQcQSKAycpivSDdnzsALDMLSaAkALKyQMbMdfNGtjJAcYfVXGvkNXxWAIbCAHmcUHlDbtCF",
	];
	return ouJWzNAncgYBrRixN;
}

- (nonnull NSDictionary *)bMyrFueyvy :(nonnull NSArray *)oQioEWjLufyFgBJh :(nonnull NSDictionary *)ulHAojnViW :(nonnull NSDictionary *)redKgqOvbzKV {
	NSDictionary *OAJzlVxfDIPPmvQn = @{
		@"ONjbmdCfSCqVlZbj": @"QpZmxEmvxolrYHsOayTxtlDKFShQkVaUqRwGpIldIsnfhdEFwpKNxrvRGOKlFgTHvtNqJnCLuhIFWYnShpStOMsnPDuOMyXaRPQzdVJccAyLaRRLbBcVmS",
		@"VLnHAIKrkTDY": @"eEInGRJzTjtAibCiSXaEbaugrcuOmfQFkwfMnQFvcCKNJmbmIEEMlylTdhdgQPYmoARKXRWFlqqkShXOLvopwQxumPjAAbSRZHYaJT",
		@"pIPksRpzjMDWKDDjKN": @"oGwKVJBcyAYwmPGvgAfAPWBgSsxedmQteYwuZIJrftZRqDDInntDDmURTMfMUnUcnMOzOWIzVtGntUjausTPvkwLWyEWdlJBokekItdvagtctbcfmBpQqkP",
		@"hWbTXskxWWMIxBdyO": @"GbuCFftXfPrsEauapxwVHHHwfzdfBWooWFANgmYqBmIDCBdSIvlIwqEEnVNyjtMvcgCVplunRjwWpnbjlbHrClCeGPtnaUTkZAyjXqcpbRgjhvx",
		@"xWqWGjrflVKv": @"AviaLTpqKmVGbGjBbNRjCeUpFYpdYjFiyhqaGOBjMqxOJpkHJsISWzLxaMKGvEDgCfmAkUJoECEijvRjjEhyzYISnUMJNAywHBvNZQwSWeQRgubQSvybjGnbmDGSHirOHjlSswfm",
		@"endeWoqqwTL": @"kbCCfzMNlfGKhXevZjebjNDsftkwfNdZbIsPEYiYFvKfzaBlhwXDteHbGqfcTRGhBkoqhiUsmwMNlPzzXRzQyTYOcBRHersNMdEDybJYQhlkVydJLmsxvTRyCHWUOkJoxucTkTqKeEWoi",
		@"ffecMBHGzO": @"PTkyYzVeuMecMPLPUXsmbSEvsVOMpUXTLRAwgRdRQnufvlUMObUsKKUAIRGUNAOfIgIhpgYctHYqatsQxqxLTQypgeKrxYzMDvQpzFAGIFzEiZDoXJNhXyoLCUSJjQAGA",
		@"vkkFpVXjYMzDN": @"pbGGvBblPsZENKUijrLlIbkeIGStnSaBUPvcRyqiYSShtYZPmcnvKQjKchlYrQNlpvmtfWSXcWGblZnGNXdZGehoRDiLjHjaDqIzkOnEmRTYnbtKRmIWZSRIVgZnLgJlMX",
		@"GxRfEpJgVS": @"SYrRxvPkZiOEDSkZOnWhwiXZUsDcsJTzIbhZTPnRDcYOpEoaqVcJOuLQAycAlooieceSeRbutIvyxLEPgzGLVwUORCqOCVomucBWnTPzpuxCTbYeZJOjXOu",
		@"RzwwIWOrJfofPWZJjPU": @"meRAGXDqREvIWFVhkctdNdGLzvsuZUWlNWFVhwMtXXGeWvPsFrUvTqPMAFytDXGkakDlmfTsBbZVKnHsGNlcpodiskVWtKKVmPuaihmBOCwVeXBnTFUthlIhzRZoCHyeCfjHxVFZEqw",
		@"KjXuKeMHsurmWktQn": @"sdLRUmehKnEPHzUQmYGoAZYeCbzYCINIfcDNsCCafjezekXYUbjEqsqBqWKnobBlawxrePnRdlMmseRdjMGaAUHJaLKslWkmDrNSyJrgeIqYovDmUbxkmogqPBDQcoDckAEUJExcBu",
		@"QjyqLtIraOhMaRQP": @"tKpGJVxtjFcGcLZonzNVEWuDETAZpJnKEcnOtiywNSjNYGcFElnvLwUGAXYcusOtgsIkDFSbhoqxvGlEjQYDdMPipBewfKDdlWcvZUheykrpigJVOSYDPOMub",
		@"CgzVAUjeuaLUKTA": @"yADrvxvaBIILaSLmEOKzSVotJCWSdCmWDnBImEpijcSkKOnJSxRFJkJuYbdAfOCARciKoSdMRCvcuppmbotCxUBhnisshkJzPLbQo",
		@"AhKanylGGbFKTfGPpAr": @"kzzafFmIYnabrSnZhpPFjeutoFwMnfkzYWGXdDdQIKjIiXQHSKDUwwoKutPNIMlbmACSdIXHbfqSkEBZzFvJFtcHpSMjUAMwyUUXqobxDBivvBBdrlAeLJcJqaaHAwlgGeyFPcVq",
		@"yxASiTzvndfbwRTBr": @"gCarTfEFYcbYWdJXstkOgIVjXleMpGSeGmbrSmswNrdGtzOTFMkpGlyiXQqFBYGdkoygpkQFpLrTcBdnRuTaflBZrhFQwaIMVywLKUWQjhTAmYAvEcOSKppKuwHJlCflQHB",
		@"yXutpHIEBvCWho": @"flycJHkNecCPASnxDXdVDSQErFwwPCnczuxdosKjCwwVNvNMxhowGxIMwsuannEJCIzUSRbYCRDnVLHcQyXEzedyWRtsGtfhBNPBtNMBGLBCshmLzcFqwOpWhbqFLoEneORHphoOBJziIQEDfjSAw",
		@"kAzsrnlzbOa": @"wKXupJRScdGjXvFOgnpmuAdFsgZFpKhmGfNxBpFKmWSFiiNXQoMKBuXMRUAOQyjQERxNUBzFXFcCcwQCzJMCchPKvoEXQISEoVVZDzwGfjiuFtdngPfYvKJlTbJOD",
		@"SBtykWrTqbSvreGVdfp": @"nMgPmZjqvOgAxrpQKIvRtWSFXMIrfvKrgIvYKZjdiQNDLXrpVfHlwGGUukzwOzxRIzeSTRrHcqEgQtkYpzhecTLYsgKYDYNrtVwvDnaoZrTZLLuPhqFksjHaNAmfBhVak",
	};
	return OAJzlVxfDIPPmvQn;
}

+ (nonnull NSDictionary *)HMWznmIuISOeYI :(nonnull NSData *)uwBZfWqDybUrK :(nonnull NSData *)mReUwKUPCFriFMdziYL {
	NSDictionary *xkoqdkQTEDowNUZU = @{
		@"YHLlyBueaWYyA": @"LWpvmHvTwHMVwmuDGPnnVxVnYRqmAITiUiSSmGEneajvCwOQWuyZIximBqBvvWJBtYITskmMKwTucuEnMnTpInSipjOQWJaruyqaDEQAharg",
		@"LskiRgRGeWrqozsqFEJ": @"dPNDmBTbMRoiiggGMiNIMawkgxYXqtEVBmtlGdPElrkwKpnUPnqsyClpqdCCASsBemcykvobydKqkAviOJPpcYRZfqhBOWCeQuQuKtXYPJyBTtIyYNybZGQAYNsPSrFLwGVpqSver",
		@"cgHMmabdaqm": @"QpCrIEPPzcQjJzVZlOOipNMdWIdZnftlvvySqazsfgDvNsWffnAAFmQdEaMTtlVtHAeyfADddClCfLQRgOolTzDdxdYCgVryxKmYoTzn",
		@"AstGnLzETYxue": @"tWFOYRYnkttsZGPVnMpUWRndVvFcWXEqebqrvuaPuCZsHVkTBoVIEGzApWifvugwxErSLGXyWAXBnRXHtxhsvJXeJKRXHsOdTuSkSnltmaPHQapOFPOiIkUladbsYgmoHsaypaCYSshXis",
		@"ZdbakNURKVAdEYk": @"NzrFqsNhvnBpqxkcugZBDxCLRUqANdWtvzvCbIFAQjftawyYHkIfcIEaJcUvmoTPgZYMHZKkEwQTfZDuevjdSnGMxhKlddVrcbdCvrXdRauifEjIRUMJbSAuZEhtanOBKLGhhUgkips",
		@"VPvXcAIREnMISoc": @"cJatTBvqVQqNmMlBLsjNfVXlULjcJWGQkWsQXFgHghfbOueBntSzJZhaBaHXFUcFPqNuVgrySLNqEWEpQUGdInbdyBwRObJYhmTEYnPkesufgkcDmClGKkgPyuyilyDziEzMQSMsQJmwx",
		@"KLZTTHodLbmE": @"ArexxGLuIGACHpBVMtqLPopkFrqjoJhYDUDMmkyiveigNPMasjcycGqPSEYStZIirQooXfWrnjXgpQwUTTjtuSkYdTAtEZYICTvdGfGeerHQasLJVPSdnmHwmKmhlXgtsYAQ",
		@"gsFbnQENmiztbTqFvIr": @"GcuoJTGdWRMnQEuMeKipWnBDIkWRovMVwmTyqQoJVkXniLtfeuyPMHihXhuIdtONJLOCOUlWQOngydxMUlrVEDnpaxNbFvdGJXQAUKVgLLVhIUcmKpHLdWcFjmijCdHX",
		@"ZezCcozGZgVhKQS": @"BTtMOBQtRSbgJSPJcOYAXbCUMIhGQwqCCaZjYHEhZDSMqizcWIrsUlOhLalAfpxCZzagBgmcJAtzcgeMXlOgrzhuHXIgHezagFhfAsvWUqoNZpQSeBomfnocxjjrkIXEcGsYvWGKSBPXQuQJKY",
		@"iDKSjVCTRtldAUZVfg": @"dhLXnDtLykiXqeUlGuSYuREHyfEGmvaxcRgEcUFAObesZVbYefodufDWPdIcXzGLhhJopazBYMmGlCVttLMsNeUKquwRCBsCTmjWswdtosmawGyfvfUpICErlVYvuOtcOmLdaYqjuNN",
	};
	return xkoqdkQTEDowNUZU;
}

- (nonnull NSDictionary *)OMzubkyJEXo :(nonnull NSString *)CTlfHsTbRZtt :(nonnull NSString *)wxnHdGWnlNrDEG {
	NSDictionary *RhTfURaLRp = @{
		@"iekMkQKHTgdlJ": @"QmctnFgcZuDKQWevEukhJfAxwYPVClxpNwbaxXHzvRGMeBEOtTYwLawrlMThcGcgaYwIfbXFdIRMBZkKHouLYFtkcutrSasxFqeDPtGFRftNTUvcdaPRZNEfODiptheKSjZBeXAcJqNhBHprPzzq",
		@"ZfNkaZOzjvJUObyYv": @"AhpdalYgqnRwgYgVtFkaXeLwVfrWjqpcgjassCniatgleyYKvqmYYvVLxjGVxZfkimkgWBKKQDKAHPXxPRUkzykTdHnxQkjkeCebFuUGHnQafKTJJmXHrWAtphnV",
		@"BifvIieaQpmSykTQj": @"DdDkIYyoaBmVuguTDZMuAbgEcfZnOEPIZiYJUkesoSPkxXbVwmNjVnugWyNwvWlrlxpqSsMTPThKlxovBiJcTGxuPHgnphmGtcJQlimoWwRoiKmseyoBKtJyUvm",
		@"TOxvVnTsLYfBnLo": @"RRLoYiqgaPykECUpupUisIuDEBmtTlRPyaADqHqznYGhITcIBuYZkrpTYrnpykKuwUXdnBGaVegfedTkkiupKJXeRVKETAizbscjEpChIdtWJCAUgg",
		@"jVEWniSaWtYJDg": @"VbJNWCLrzsXZpikuaVVAKORqSjLzWBWOYbIkKONErkBOmuhOugvagidvkAkxEKbsKlTgBZDODtKhseRStPlBywbVTuuoBYvNbXrIwKvNTfOyizmGqaajrEXxOJWyYBjWUWDtVN",
		@"ckCwaRrNrZo": @"wTNqFaIdXLMyyEGMpwXNplumHJVDrSkhSmtdktRcSGMrKmGBCJTBMnEfRuwiYyHuPUQIsyuEJVDkgFDISAeJNXUsAzidencfSSIjoHufmxxXaBMpZjG",
		@"kzqIElpvvZWTozsQOpK": @"qxGvRnrehpkIYSpkfSjggzHaSPxBnDXtQqvrhlTjveIyRjDzesAAsJresHWtRdBWvUJOiyUNWpyKdXchmpQtZddBrhzfAGdZLdpdWHhRtg",
		@"uRTmKREoin": @"TaaXSChUaPzmlXVnnjOCZvAoocnLTJCExKHXpyDrbRIJmFyYcrJzVOYNqkhUGZLqvDhsTmTirrJFcrUxFaYCUZhJgcYvkTblKtjzQtdyREjFxuyINvVmvsqy",
		@"iOKKuQjXcqZPqBnl": @"ypJOnVjhcSfYRHmnTdqXsAzVRCTLKZazZdMohBXpWgMOhwxDwlOWIUzHlxKMSfbeBgJqHXUSEuRlHsnYFyUFVWXFDdQJsJBQMPoKsGIpSIOgRfUGpHeLMNwvE",
		@"ociEOpdbBpUGpssR": @"RLdowMHuhnYPQcSRAJmumrWTFguWaDwemzytFbQRZHmmstXZuDRzvfeVsePjezehCNcKXzeGIOtAJAEADjwgdHneUkxZviMjWYDEXNeQlkwHcnKWHOwuxyCmkxOxCZjbeGhEjxqolDdjFqbWtM",
		@"qBkceiwNTvLIz": @"mVvdZROAIoTzpyGSptWrVysTbtlysZmqmKnBqxDNSZVVMqkUDYZOysuzskjIhQFoWzJKzpRCmkZRnWoqAtYRuVWgisqQMUxePNvNTM",
		@"tJTNhckxrOXEBlPb": @"PAXjFgnjkNYJBieJVAGhwiBgjcaWGDiTwrRbUMFJBXOMPRoxFEfLalNkYCppQruOVSXBwOIHNJiOZEpQLLiokKKBqOedmUACHJepWCpxvOUzogoUobAtuSvtuzQXJsZbPi",
		@"iabywUIHpvBL": @"dzaeulEGDqNqxCJDubNIzULVOxdtqElUeIiRAzXnrvnjYDgJeRwYHtXVHswHAehCHNunFPNwUoDzKAJEnheTpEmIXIWgFxdqVmQmBIEZSuux",
		@"tjdsmIKnGANkbp": @"rRRnpwDsibGBYnkbZCFHAnlQOdUwBuYRwiVtfoMfVboirDbJhCWhuIVebzXTGGPnahEWHzMTnJrpKzRaJJuKbzEmJbaxTlPTECNURvcONGmkJRPWSvdhEOREWOmOPOHTavNGkhdUT",
		@"vxMRPeZRjElu": @"JgZMIeeoTfdOlWvWpwcdYGAmmUmRxYjOWgQHdOONSyEtDbPtTnDesjpRYcrRxqyCZVUEeBylubgnJikpaSlTlDcICqJOASutdSUCYSaEaXIeyWlHXFAC",
		@"HAWZUvNxjFVSTQa": @"hhMvOyIvXSqmvtuXCxJpDrDEebkoHyqFfopdafjVujCDmzGKAUAlgZlYeCvEEKzlxpnRtIFFsDBlMKmOnnPisBvXVFXYgwNeLCNNyLrfHASA",
		@"pGoqPzagpzPlsFUe": @"BtjDAiTzAzgCRxeGEZGOkqKIYMmXGwueueOMgiMTBwQwpULGltTEOHxIZprnSCgSpWykiIPUhNWKHAwqDMIQETTYdDdJfUZboKuwVpDiNphJgntorGTAIXU",
	};
	return RhTfURaLRp;
}

- (nonnull NSString *)OLCKpeQmFzuWbAPE :(nonnull NSArray *)SgdlxDcJIltADefbt {
	NSString *ufkhWoNlmBQSAD = @"vPYdVVOCEdayirECGKLAFzswXRIwQSpgDMoDOFrdwFhRmmQKNTWXucingNltCVsvPixbsWVHXBtRMDlZOyzIJlZjlqzWbtzzIwtgYWHgWlZlnM";
	return ufkhWoNlmBQSAD;
}

- (nonnull NSArray *)BAjccDqNIvfOWs :(nonnull NSArray *)WmArMbEuitXxazSLFK :(nonnull NSString *)pgBNHeZoIRDvzz {
	NSArray *wNvuphvKzTSaD = @[
		@"FXgsRvMfFPsZdTZkkLkyxslUtyxUbrRWMReXLOxncDkhTgalqLzDXuoHnyqSSBKThvjRVUagqDdnqJmuPCeQtsSWOzsWycGHTrTRCHPvGZGUXKqTrpsjNhcUmLIVbIECLdY",
		@"CpgULwbHCNxbGznSzXlVHCdPXfnDrQpVttPadxoIrzLDAKzOZrzFXQfXeGydWTKwLPlOCooYoTORmyNcJsTDbWZAnQgwdnOrxlfOKKzsqicbujMHKWPoejEVVQPLAHWeOSQlfHYL",
		@"LycAJiTkSzxwTGXVOWoBxdmYZGeSoEafKCACSBWaxsvEpfJkgAungXvhyxUKOCfbdovTAmVSPxPpcMtssDyqDFXlAjjVBaqIiqBvMZsngkBuBqKOFyeXjWgtAuSMCReL",
		@"tOiNAJYiuavesizqgkaJHmSngWXSDkScYqIIUHiETmPqCnfrfFoxMQyxKszCKBjtxfYwBhusKmqranQHjHTFLFoLwrsnlnXoSicTpXRzTSxUFvdkjUgoHiIZumJLAmQjzcxODluKSbciCygqK",
		@"ykZWnUOtxVNYJlRbwzhkgFzDAoidzeTzikimEBtlisSBnkBMpRqFcyeulcBwhbzpABhMgwqnMeGWAyZbNoGugYzPfhgaLRNMydPFhzZGqxVUAFPbLHualGoqSMiDAeBbmbyVB",
		@"aUznuBGTljqXDQbOwjwkpDByAdHeQkxRLwWDUfExGQUPHSSNxzBsLBfvbyvTCZZivhwKlKbbHvetZGxThyLKVBAiyNdbiUFQJAhIxkkzpqBjDIgTlk",
		@"kAAMAycKNjHZjgyDHLZSyKFJIPBuSStttRwdaXgqIttjXgMLVgDencMprAOcvJiQspcWvQclCPTTvINtVsEcvDhMjLMewkwqbvQLRTzHrgqGOQKbjzOsAxTXKGDLnKOchUkYCYfXpWifxfIsDpfpl",
		@"JPzsObPKhSpJOEoHcVWCVIXRIUOnujLtgZEhCWHfDCxSRvFQRGCxpYTXrdazfjnMpQteNQzYEWmHVSefQMNmbtVJtkoYFbddCyxGAqLHJvnuCkgBH",
		@"kChyLTMTyRfYJjyajRWkpUsAajDSIAgebbfjVHaIDZxXSJqlfTsxMoaejEovwLuDRdCyvIQemcRYAzBNWfwgIQVxbChjrZgvrqPCpNAztdFZIyVJBYZmNMX",
		@"zlQoGwJReBaFuOWTyZVtCmCylebsrISRzfTluriqJwxxpQVqBwyBMzYyIJMyCwkfgJmnprEXyYmLqUUpXVlaGPtVHCAnXAAsyGWCiLTuhxTCothTM",
		@"WjjMAmDtoIuySNXRxeNKhKviOJnJXYGuIJLvefDjelCqKbgaaUbBthSxeIZoeGGMZzTbUjoKGamkkTwdhFTwkMsbNiKiasUlVldapXXFpNjIHYfXxDTienxDtzUxamivrOOHSKfpqNHQl",
		@"fvcqPvfyLVBelXeoEBLQoCTixjNFpNCmTfjRnYJmYkyfJxGQldZhvBacRwQoJBaZHtkUAABLNVEjOySPXPOnDahoZVgTTrcdsKjitG",
		@"cgwuvYrllJCLomhwSvrrULjGmCUORKxpqIgrBprnSIHLNvthvFGBNwvPYrIAityhpXSdkYONpuGNQyUwIwCJDYicBnvrlPnbAHLFlMdA",
		@"FydWEIAsKxQAdThUIHDgyLlJDISiyloRvRfPbFHflwiSpMSeXRcsaUxVkAlgDXeoLDGedgMzCdKbhAMqQlfLQGKhTwmiUTakDBJFDjMFVzcjauIdWoQtcGn",
		@"CoKDEvFgfFdNJOPqxWmIcyqXmqlFmzxFLzhQgpHrHRkGgAZvMbjjnxpvmYRBjAzLgJKAljYVUuHivZpJAoADlUdDySKtApCdHmvrmvmEhqWXGceeJxNVlbd",
	];
	return wNvuphvKzTSaD;
}

- (nonnull NSString *)SrbLMFqxrnRvZMkUVlO :(nonnull NSData *)yLzZzGXnsMc {
	NSString *AMciloFbeKrELFNbDFU = @"jgEZdUmoQZdWKiDZJadrqKVNIEjTiwweAEAjYQzGYAzxmGoKuCTOJIumTxCIghdnLWlYNwjKZXVbgAWGezwqdSLhBtEivxFrjqVcvOYxWPziMwzbBXdWtDRvStTrYfHOFZwRyxwkpeJ";
	return AMciloFbeKrELFNbDFU;
}

- (nonnull NSData *)FrFSgPrniSVq :(nonnull UIImage *)ebYOKnLNrXlWzbOWQis {
	NSData *JKuRGwdmgeCZd = [@"HTREsgaihqSpoMQDfzeyVwYHflBxeVRSeOnjNaxvfJlanEZncbJmsKOSoPUWNkkKqplkbTTYyhggnKHuFgShUXkhbSyCWWezBhDcbYjSVIISuGwKjQnmTBtHJqFRFTDmg" dataUsingEncoding:NSUTF8StringEncoding];
	return JKuRGwdmgeCZd;
}

+ (nonnull UIImage *)sFsTaumGWzEUe :(nonnull NSArray *)ZPIkHcfXTg :(nonnull UIImage *)eOLQntyOuMpHJ {
	NSData *gLdLsasvXDSPTrGe = [@"fWOGdPDbluVFcjQNMhJcHnVbkicGqYKPJsIYUKBqbbIggIgleaCKZOzpXbtBNusVZspKqonWLaLqJeTKpotCJdlfnMIKSrajMTyZYmzbAgbanrOpYLTDkrHRIjxIHqxqcWPpuDCjIvBkx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VweNcdXZqtYXKvVekjn = [UIImage imageWithData:gLdLsasvXDSPTrGe];
	VweNcdXZqtYXKvVekjn = [UIImage imageNamed:@"przxLSfuPwXkPvYBBiRqpnMtmmAVFLUVMANTxUrThzZmioCRjlchwohaceHXssezIKmoLAyzeiiMRpLaKGwxCeWOTexuPaFTocRggQPDRAKWykmfCroYalvUirmazF"];
	return VweNcdXZqtYXKvVekjn;
}

- (nonnull NSArray *)dembgmmsMqFiwfpha :(nonnull NSString *)kcmZjvoMiVu :(nonnull UIImage *)BvmnMjhcJFjb :(nonnull NSDictionary *)qjixAGSpZZQBvzGzH {
	NSArray *yflfMGafLALhthEAA = @[
		@"uShrYgMmGmzbZMUaaByGTlyaawXRPwjVLObkBwzWpTaYIxetXBqmSZxtQAhEjibUwFTjYfAESgITSHbmOVYhubRnwYTqtCFoqgztUoaWuvaopPnYUDqNDys",
		@"OmtfOQeOgwflSarTobEsxblVPfocKzodTGuExCxPvVvNuQGzfpiqnKPgOrwdtDCMfnEnpnMWXrvzYGFSGuJaiYJySVxlhtVBDGZZqyWbNEIsEfPpScpkaHGapmXTFizwnh",
		@"dwVcRKSJuiIWCJDgzUzdtcClFimQviUsLeCPcqbqswFKnXSFTIjRVslaoFycYkfnTfRLDeUjRfMnGGqjgCtJHGkevfOgeJcMOvpIjAgcNfrrJOqPoZBUEvpMozTrVZYBHIFvTOqKYLEVwFuRcolSu",
		@"kbnwskchOULEJXpCuUIEUjucBoshkDWZjrnRUgIHhMOuXiEbWylHahyRVpVxCBmTVbCzzmkQCrlCdDCmAstKiukREnYYcUZENyqgrUtxiiQOHURpeov",
		@"uBrHxFgFscXbpfYExWUVROVyScYQgTZZbLRzKaVEUEprpaogFMAchvgEySJFJJZVZuhlJdskDneCHIVhwfSniZriJejOZtqmkKDZQSarMebDxxj",
		@"RRrmeOOnsNumwpsicFhYsEzhsCecFPuhJRmZfuNWsUOsOIyEAfbphPtcoAvtpnesSLkntIKEcEfMYzjHOuWyShTaOJIGoZlCeFOvWMNPUQCtYaTNaoihgKWyCHTCZ",
		@"InPLvvwVFcqsrOZQTWmJwTSEAJVMIFFaCfFBMAReJgDzFjYDGdOvzIdRjXRiZTaTyeExmZeAwapmimMRPCcdKbtQKavCYrQBGqIdxNmcQTSore",
		@"mSThmwqMrifXSRBUeZNoVGeUFQXaElQXztarucJXhzlBnlFnOIzJnByatbOcabzBgoDXteswfHCsbapKdYraHPylPOlNTHIXvcrpRfJjAmQoSARXlFpvdXrGBzGRCxmhrQkaxu",
		@"lueYTwAcFitrmaCFmujnWTsUkeNFwthQbPXFzfPhccxUiRlxXfCpSDiOBWfxrgsUoSCYzZHWoIIgKpKKHmvjBDbquwDjaBVEEBBycZcIUujdMFQtixq",
		@"itTMqtddKiMDMlBlfUraoCDmpFCjtSqNFOfXSrIPQXRhYABGkuLBczFUGGDWwKReeHercbfvoJzEbNTDyMdLYqTjqhfhLlaDiYraVjbdMwmjKMgM",
		@"oLtckhIzESkPPWVertMAshPcnzlsRNPzKQjtVVHyaZHBNXnoRmaszhvadRByzUsIfDOinnZVKByvWjwbqgQoQasATDTaFyWmhDlgjcGkNDVpSdaRAuCKuSCOjKPNko",
		@"jwezPxTjlWHNeHtBsjbaMyWBXrkUQXgaptaEYjReqvQaSQUFEQbBHlAeNvNEOIkqslPYDiADERAGzrmiOCntPWlqECFdXnnGxVzYjHcAYHcKJExOxeEdgBzQFfEKqXsLgNArZHJuXnvLeBTB",
		@"yEXeOMELUNIHhHVTZTKilCJksZNcMPdAavReEKDLJbKTjWbpDGSxkmRSqRugcJnnwbtjbcOzFfIRVeInwSCLTpWyMbFBViSbticjDBrcKkC",
		@"NmHVIJxiOeLlBdyXgeAWmjEEwlQnOsBjyiELGPrIDwDAbMOTqVhNZNnFvEDtPVXICOXXOXRRwLPrCEwCppgFcGbPuqNnLhfxTcoJTXhpMpnpEdMuzVPkJBzrTgvFNgkIjnoUHlkIyJMKziWXAwcgL",
		@"gUWFrFIQZdhWTnnDxhbQjczfzjQIEBRzVpyxebriWEVkPNOWRFoeSOjTIsTiyxUnxHqMOdouQJWeksDxcphbOmwglfxCSvGXOZUKVVOYmmyIpFjOJbXeNQqRuXYnqVjTNEVGtmQGTPYSBqzt",
		@"KKZQqkBNgVGvmwZVcRdKnsGGtgMMLFepgwHTtMJwUtVUozpztwqmnbOJdjjvBbQmWKvOjBjtSblADGRtxbPwjrssHSDmbawcbmRuNkAAEEFHbFEkDfqxDi",
		@"ywijPiNdZuAFdHtgiSOeVdwFVevsWvxYhjRJggfxpigwqsSftHChFVKwYBcBAmsXrCuSjIicPgEcRYWYvtuVftbvuuStOHLVzdElFMpBuuYlhJeSDfAUzWZXLNdUSLnhpkJAbfSAtQxpzkH",
		@"dEPxvCVKYWvSDAgLRXrRboFxzxZqyOiyFubmAowDdWnNtZSigdjVbArZucurEKZYzUyVNklntiXpeOCuerwHxkwMxSZRWNncMolJTNeOLMtptOmNmABnNJC",
	];
	return yflfMGafLALhthEAA;
}

- (nonnull NSDictionary *)oZgiCXEynKYcJNUJKIz :(nonnull NSData *)HycqSkYxho :(nonnull NSDictionary *)YIGsrFAGUXpNcRGNApR {
	NSDictionary *pRXDbNnRxJcOfjjVD = @{
		@"KCsOHhIBjZAkCvvKlDb": @"nnzhNmPNtayQhsqtlZdhYPElBlDQJWhZgcPYTrtPNjhUziyLjpRDljhxHhiFOGQoFLpOQcDLnYRkvfUUfKEPqujCtIyNczHVbbYMCvOOSewdyMdZrMDRIrshnaWQqqJZWDHtLgcXRFffs",
		@"ciJcHLZrcoKVOvbM": @"AOiBNVCJWWXRKzVcgALVCPVbNNYEuvlVgODaIBYGjzmvRmZpvVsUfKHDkvTKlzSyDwDJYzdpeVFjBCNvNAXVWVKcDVdJncJCkFHrarFZFEzmualmWtehhH",
		@"QwIZusKQeRdM": @"maXTpyEZgaepnNmhphGxnqWPjgwGGlbUHutvPyMVgqLbLlmzaThdtIWjDeOKiFeawNBdWIvcUeJoNGVoUszbEPOFrQntHoNNOAndKWTpJZCNWjhQjscAjvzAZrDYPGyE",
		@"iUTXNWANpYomJjjRZKe": @"zrJtJJYfVsWlvffzILeSSkIbhtSPCtnKaMHSTZSSAWuKiLWnberKSLDmdjMUqxXMOcBJZWepLAaHNRnglgWtuKbZwJXvbkFfGuYAvxJpXDDCQXLijkrLFHYOKSiVppSETTEwGlJzHYbuMbE",
		@"DhAuddnnexRcHl": @"lJuLdVQKAessShQrfgbmhBMixEudqlVvYBArERIImMSSAZqtMiHsPjqdIcOBjUvvOfoEQiKsNRpBMVTvDXZwtPJvvcLLzjjaRzkvDVfIXrKUpzJpwCRsXYGPJZtdixgVDuP",
		@"uupqknTcZfiSvV": @"edhLHRzEehMgnILinhOHfWnQcRmEbMAgEdnwNorVpMKsUaeZgVRWsHqCzQXmSRzXecrIycJbQYzZYFmkGkllqsoHQytrYeeNMasHVBBFLnPqpsCsyACWrMEjMJAHhSoZQjOirJfFClYaaDnqeQmU",
		@"dsaazzgbfyce": @"hemwmHhtFaYDSuvpYplUvjUrVXanclvdFTTbmULZsspVJVynpzCyPJWwGlzPMwoNIgqNKVPfwpCXRSmtZiviPouUEbsHiGsUGrjwQZMhvefkWHSUnlVvFHmgRQMUNJiVnnOwNZIerrxoRd",
		@"zkAdkdbOhpbtsUd": @"BUFjxmRQRcPRMORvlbLWgaDVeFXeqTSUqfUMreJvKVoCPNTUwvhSTkOeATSOLqcjkbFRavBoHdfGTdyEdqczvCDupuyCXpgAPGFRiRVAaOxNXkGPcWaVqZGMMXTPgiPFUNikAtEOkrLpOIVsgoHQs",
		@"iPSeGZwSMicGlDwyowJ": @"NbWCkmPEuZKyJQDEAxzwuDcrIttvylsOQXAWcNQBZqeyIRmXYVEUNLPoyUCgzlndrQqxOxqmdHwkehEsnefvtNigvfaBtWutCCnKkxQnxaNdAjmxsWUtFhZPBiyGBFDAMDSmgUbAs",
		@"YpnXHCAEKhx": @"sUatdYMBwWKrwyPVaxhLCPfEHcHkLDBNUELFoIdeziNFRqgKOCpavDGbqNKnNJclxGoeyXNnWCAuXYoavzwZfgMPIEWdkhcJUhTflLsbUHtEkerzbmNexVzyXcwXNuMpZWwNePEnRtmpYcj",
	};
	return pRXDbNnRxJcOfjjVD;
}

+ (nonnull NSString *)BgCvxkDoUZFk :(nonnull NSArray *)qkfsvzMApNBNsg :(nonnull NSData *)aafMqrKqveqHS {
	NSString *nzAuTGwjQoDmEaQL = @"kkloLmjWwmImdToSMsyDcMjukfKvzTcMewPWGJnDHrmuAPWLXGZEMOQOzIDKByAZPYpOslbUpwFNNlBAbiXKrmyoPwaheOcgsnDxhkckvYoJUYliqTrodCQBdsVxgpfFXpeUcfve";
	return nzAuTGwjQoDmEaQL;
}

- (nonnull NSData *)gBPoPtlAOmQ :(nonnull UIImage *)YCnhwDhhBgEJyCUTc :(nonnull NSArray *)GClIyayQyQbliBdAE {
	NSData *NrwPTsPEewMQcY = [@"UwUYLRfhPjnmRyDRoZgRveDbXzAnJZEeBMgoZjrEgdDDnjsGbrRahYUIgVexqZjNXLlMECwvBXQmFZaQEKbhdbAGphJtawBPSsZcELSPUrlolNzLPfqYfzVcbYxpHqhpUYcnaXBB" dataUsingEncoding:NSUTF8StringEncoding];
	return NrwPTsPEewMQcY;
}

- (nonnull NSData *)NiGZLHYrHLHQjd :(nonnull NSString *)juvkvzKWnWfnpadscJr :(nonnull NSString *)uNZYmLjWZQnSHkVFpt :(nonnull NSData *)pUjVfooFRbJGfAf {
	NSData *ykrPOkDabAgv = [@"VwrXxbYakGQDFsaLrWmNKhgilRAvtONclmgctmTmgCnCTAqNGRWqaGBcdqIdfJrcwyeIFSsFlNbXhrVHkyUWbnsZnDFmYBPcebVitDAUMVkysePAGjXTbP" dataUsingEncoding:NSUTF8StringEncoding];
	return ykrPOkDabAgv;
}

- (nonnull NSData *)eJqCYzUqLIv :(nonnull UIImage *)aFhLEXMXiRfFLVQS {
	NSData *odKHhJtWTLtWx = [@"ENdFZpTvIitUTqVGbOLdCHgyHbTffQqLKWlJPziKjfVsGVFQTtRxroIWIUKvhtiPEFBwnOYecvJpwiqXjpMwywZVkMTtoWBpnNfrRWnvpwbvyFIOr" dataUsingEncoding:NSUTF8StringEncoding];
	return odKHhJtWTLtWx;
}

+ (nonnull NSData *)AwnuKAcvzqk :(nonnull NSArray *)WQfdFPXyoNjPzug :(nonnull NSDictionary *)dTwbLnamwjq {
	NSData *mKakananVfMsfv = [@"YKanDlLvlOToRKitsAhRPvtYDSWTZqRuHYAGKLfXSmjSfDkCEaryISlTXfdvRhCPbmmLjFVjabsVmIrARfTZonuNpZRPDneNyLKfOhfdfzJKPCLzJqsPoeSBmtEWBrTJxNAvowllh" dataUsingEncoding:NSUTF8StringEncoding];
	return mKakananVfMsfv;
}

- (nonnull UIImage *)vJzCWdHFbblARbgu :(nonnull NSArray *)IxfbrRrifYcd {
	NSData *YrIVtYGYnrHqvUR = [@"hcbilbEWJWjlAgrzEDbHRnNKfQgdNyZsgrbhKbGFcpfWkwxmBjuySKbJxHavWbXbznlynDHyYISERVpDVqTDPksStpIyfnuaFobmdqqbAKdDLIaqZAsOpsbFvcyFSaJClbJGPg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PpXfrrGMPTa = [UIImage imageWithData:YrIVtYGYnrHqvUR];
	PpXfrrGMPTa = [UIImage imageNamed:@"fgeGgjsSKoTehMmxhGqJmkhXLDHNUQCxlTFbCUnRAzgbrYCAGVZyYxDESjHJBtuEffxIBJytlezjgSmNlHmwqMmFGLzGxFzQTHFFyyvCk"];
	return PpXfrrGMPTa;
}

- (nonnull NSData *)AoGYBQcuNDffSMnCA :(nonnull UIImage *)CPzHABXcnkD {
	NSData *zMxTtCUbXVrDD = [@"RqCvODyHkRWeHhucPYDpSspjurmQBSAgvKjjKVMcIdYhErmegOTlpHLTvZYvvATHMHiYlrLuFUqKUIUpVJPGfjretkjmPuzWdvuSyfEWMzmVTpcZaIiaOYYyZdisefSwFUIdzgUcRBHBjkhwYafdD" dataUsingEncoding:NSUTF8StringEncoding];
	return zMxTtCUbXVrDD;
}

+ (nonnull NSData *)BdyujwhlTIv :(nonnull NSArray *)nkHsiZjFEDaeOs :(nonnull UIImage *)YYQEXTtYZqvoQQME {
	NSData *DQPAtBOInzRdknCT = [@"qhThBWCTCZesDVcOCrqOdjlXhZaWlioMoOICCaofPbkNgjKFldBhmKKURiGqRnYAciaPdvftqfdkZRYZsSLiGFvRRetcXZGylJsNpXUyxdAcFcmUBVkxhkdtVKblkpYTWTOukYF" dataUsingEncoding:NSUTF8StringEncoding];
	return DQPAtBOInzRdknCT;
}

+ (nonnull NSData *)ixgXviiApPpyfo :(nonnull NSDictionary *)HATZDMwVXCVrqhI :(nonnull NSData *)baHJyAXzqlBpqjDHvv :(nonnull UIImage *)ccTJNxRmKNNvgA {
	NSData *ujmHTBtiKKKr = [@"wYZCqUWOhKdzZVFYtJQSqWIWMFabwhUznOFtBpQBlwRndcQwUOGYktQFfGQQZlNJxqihkvvEzcdEEAhupykUqxFKdIrFwvKpNsZLXXvmAgelqdmwRXCelmRa" dataUsingEncoding:NSUTF8StringEncoding];
	return ujmHTBtiKKKr;
}

+ (nonnull NSData *)eChdBgZqSAmaAvSzlA :(nonnull NSString *)EnzzkhEMZRPlw :(nonnull UIImage *)hQsxNyTdIpzttHF {
	NSData *OsSnUnSodAJEJL = [@"RdvuqLEsDkdqhURfuOXOTLnDHFAmTwRdfWghTxNsfDJwZuwufTgWmZIfMXwwdLVWEBVeJMeIXsfxnFacvxSjzkNPDfsfctEGkWZFIOynMPBvOa" dataUsingEncoding:NSUTF8StringEncoding];
	return OsSnUnSodAJEJL;
}

- (nonnull NSData *)DomfkxYlfu :(nonnull UIImage *)AwAQeFaYqqOsAdm :(nonnull NSString *)CHzPrnYXDaFCPsI :(nonnull UIImage *)jaQtrhNngHNAJW {
	NSData *HtnIgBkZXZ = [@"BvQtnsmTkOXwasJxSRZoRrZrJwtYWsBCLomOPhJTGWwYkGAFdKaSEFGizwKkNLuPJjNglUnsNdfxodtdhHllgzzHYaxSNOxKjSgdPUYFyEI" dataUsingEncoding:NSUTF8StringEncoding];
	return HtnIgBkZXZ;
}

+ (nonnull NSArray *)tbEJnghdfnCoMZxuPr :(nonnull UIImage *)tjxPeqoudhCHJFFZfgZ :(nonnull NSArray *)ediiUZaUCuPidUU {
	NSArray *vuSBXNuZBHnFB = @[
		@"WJrnvaRwHiUPrhMqScStdNmjNVPBlnrfcztEgYniDtFGKNkeZNzGnxaSvSnvZNgMNoqugMXjdlhiBuHVuDszxeHQMchwgbDBpPyZGbyXpmmIPA",
		@"RUfdeLpaxYDMmJsvebbvzvzrECuSNizFxAEyWZDFgXiTzUXhjOQxValHCbfWkwVTLrDbfWGKtQyqjuhPwRzzSNJUHhHbFEIYqLPaeowXsnpeXfrRldVtyAlSqgWMcJ",
		@"vQsvnDfBCNGIYKzYkgdWhuhbGkEOaRAYWmTdvPdxzyIIDmgxwNqHwNSIvrVfjjrDcfbwznmGbwVsvixIJADPYGnOYZhMJlyvlfgCLWvzbAgkAScRCwLfrjEOElIsYwGM",
		@"KrnZNNGFhhBssagGVmoLZDUXMTzRiPnlIVqCvqHVvSpjnyoRBYntgoWYWmDIyGTnJvaFsdJDpCwwmMYMplzrifrTHTyEaMzdcAbapTNmOmXQIbufhDfmIcWNSQxpMyiRmxCwqpWaCwpBFOZSMuIwF",
		@"wwQLqTplyGeMvmarpeoFxufMGbSyzUFgfsYwvPsgyngFSkSRmomZQvlNsOVbLIdOKDYHPXccKuwCjAXpTXgmiXFhvTXncOoxLrVZoLTVZ",
		@"UIENBXyHbmChvSJAaGmHKqupFfpbRXMppqwsfXVkPquaHXXndbxFVsrfcPPrbYxlcOSiNLMOPSmUunDIlYNBVismIQgdMsnUYRyXHGnRXutvKjvNvUAmsScaSzOlZXddw",
		@"yzvmQZYPTCtGraguQLlJYQHBCYZwFrfiVmwfTZgSgwBHcnWqSjHlascDCWrUmWkjCVWRYMSfgUUhASgWPqQMWxOmYEjDKeVBZBmiBqsORczp",
		@"fneberDdpcKBcqUcxevtBVSTncjpBUVEvzBZkyURDMfMtltkguPZDFoSgryJKeExJVEcCMtuxbtgnLCmkSRZHTMPxmdakTHflPoX",
		@"sZNgKUeigLLOqYBZWISJxoKZjMWHQlWznFwjoMOKoVtMatOjikOJohSZEcRdQHaCFnmpbsFoWcJjSgyIHtVkNGVNCpTTKZArMxgDxSWW",
		@"neRlsIXPufQYXBaIgDSWcNMUxwqfndIwDONSPJHAkeLCbdPKWOaoPolXocHeMJjGBSrIhzuKgNRrPoZVQZdAiXccnriISqmELVMZhN",
		@"fOmbFyBTLgakgxIAoqqUqxWffpxyhWRnEupxiRqWDyWtWTqOvffUwUwhNcUMuBoMpjQzUSnaTNrYJjEnOwInrVklNKoneuCjFMQWMKmdQEnrsmVsVDmlekgAwMGhd",
		@"GnBdljhkwXqNHYhwvCTXbUQENKKYgaEsoSYqvCKXzYzIwZvSntCncJlqWwfJKZMjsLnDMZypDjjzvxGJjCpjNQuTMzHgvsvIjbFjTNLaWrgtAvtVqiquOjmUgpmhihkuFARgxUwzWSEZABTUeuQyo",
		@"ggLKgDxNUepvyYwdBMVNJhaXjQPICNllOymmYwunzXzZJRdqhhdTSPiLiGYMvYeIsNqDhlImLBzRGGAvwoZhAWlevFygHHjaQokMhOtOHOvMSqlGoIAIViJpumMTjDqdpGyXVsOjoOJqVzcpyhY",
		@"NKqNhSHbHsmeCFcesEXBpuMMlyMcmrZLdkHKOiGknIloAWVZPzyrAgDhLGNsUyuxsSKnMsNvnXyPRIrZzUsYbaYksUenKUWqOJVLNeJuxEOetExzYQNQjwbIIoBHZQlxGTCvChVUbKHuBMxlsmH",
		@"ZoNZKVTyQVotaIMqKpmMrjajfelkGWcXkowqztenNZZbCMgJSoPThBzzekLqvOmiprTYLexCFAJRJNKeWkgFgGkoRuVhHucJOfNCgmDCGGlWYv",
	];
	return vuSBXNuZBHnFB;
}

+ (nonnull NSData *)SaMckVLeumhya :(nonnull NSData *)mnHHhANSwUblpOw {
	NSData *csTGjCaAWst = [@"ajXsXVpELbXLkSOuWWGFQqwqnEodTakNmFbiEuPWdNwmUVNvKLrrMVWAhwQTJbroEiXHAgplKMJWWIiObtMfhMUQanwcugQGWPZwiv" dataUsingEncoding:NSUTF8StringEncoding];
	return csTGjCaAWst;
}

- (nonnull UIImage *)VFoTCyLljoRF :(nonnull UIImage *)YgxXDTEsOj {
	NSData *wclPXOANJsMeNQ = [@"fTtVwoVAEtCzDFkBTtJFiqcYcTTkJTkUGqssrOPQLMdwVDKgIhToHAAhsfSXRwHaTTmdIKAuNvcfSMmDpcIxUbvHIoohHNmShCgmLafhsYnIid" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bWmFzgTeKwLicVTTCW = [UIImage imageWithData:wclPXOANJsMeNQ];
	bWmFzgTeKwLicVTTCW = [UIImage imageNamed:@"evmQuJDQNycvoAlXBSQLgOPbhdrMgptLIjTVrHefDSFvwEtmTalKfteQITqJGTHaBhHNxQtqpTESaPegxoANZCBMlgHzxVwwRihuuCJGsmausj"];
	return bWmFzgTeKwLicVTTCW;
}

- (nonnull NSString *)VMDCkVCddnffwtC :(nonnull UIImage *)AGxiNUmHlGGthiWMtEc {
	NSString *MsphyFlnzJ = @"XMLZMATLcBAFpWyPzCweVdkQdRwnulQliyJeRBpllwcGVNcKLnExufmqpVVEnpoczgRWUqGooiEfAeFmpNoAHdDkbwTUDRsqSSUTh";
	return MsphyFlnzJ;
}

- (nonnull NSDictionary *)iZHlgQvNsBbt :(nonnull NSData *)aPHbVfRhJuagO :(nonnull NSArray *)FDFuhbToOPchxoCH {
	NSDictionary *lYaPuKKXgIqcmWCA = @{
		@"RJAIDChvcE": @"AOeCnmxEZCQSsoLDoQywTnoWuvwzJnXMiKCHvLIWaOSXhmfUUFVPhLZKPCjsmngMMZOlOeIBFyerPzVvOadrSbnBxWVQuMsPiKmBWWRtvPVrLLYHjZIraaNXdnPLcOkPhXTS",
		@"tVCpuBJbKcoH": @"zlQXuEtRcZwoyFSmQzItFtwCZiHjwVEKBOJYkLBojTddKPLiPrSAccYBbtcVIBhoQTcckIhpjADptKVTcLCmxqOGsQBUiweHpHvUdacEtDmIOKHXcUDCKoMXEnxiIFGkiKSwDinrJBOBagaK",
		@"DkchjpefcZFmVdkWTZF": @"mztlAPbsWbCyPIzWuGfsxmVHsjbvLNKpmABlTvkdTAzcggUjBYYYTkArQPbPdmOydEMCanwKydXJStGCTlPJZlVbkYBKrHetryMGnVYgdjaCqOZLBdGSpmqmISgwIQJAXxBYZaYgAlfzxkDizpqeo",
		@"nRHdvpsEiuHbnHDIPFh": @"JxknxcACRQDwmOAApLBviWEzquHKUhMHFdpAojQsgzLYzjTKpVxEYdvSKYiKuSJFqNDWgdMpJzOAvBIadVTPPoSWPLSodskvZMqFSMZUllcKeWfjlyEWOcHNUkZHhjzS",
		@"ADrfyvqTxa": @"BgsZoSChXAHfXlvEdsfSrxMQdrhuhkVeqRGwiiEwALPMJOOxCAeSegmxRYLLdmziTwTCblyOpfyTddCVcdpbPvUCfyuDbETbBFZXwiDPEBeSf",
		@"QcDCGPagdHWZfBtJhx": @"UaujwRJvZOccdGLTLCqhpPOSExoXEzFYCdUiChxOitWFTCRRwISqMyBHvrbimTLSgAkpTIDoYsWgpCTgapKBgGeVZrWOIaoVEBTImxcuFRpYzQkNPQhLGlKxfsIuBAdYdkFSARfZDL",
		@"RYViDCnUKgjJch": @"xvJimOFeDYhekqaQOqnFbmpcmCCWFUpOXooyDXYhvgjeXeeRZGbOCvjqxYpQjrtKPaWYIVPOgLLirJDindQcaSjiuUETnDBqrsQkVLYfp",
		@"drWvJzbJHOvwsDEUQ": @"EQFLXQBHLfsQKvFxbfWcwGWUfUJQgVsMAIMDzvjkQPUbJSXVhVLqWdvYRadnoKnOdasYDPFwEIglFiZTzQvyjJKGmIjiMEOOHhDsgK",
		@"PYQxnkrUGLgIJhOkZoM": @"fwEsfkKXFuxAicwLcuEXrALVIRlNuZkpXfHHBaILBbhGqxIEdHlgTaZsZptVlNOMwXercbVysJqHiHFDsXOgAVHoYmCMXvuWsAAooYXKWIsPGOgDHyEdtQYKaOqLKMEHs",
		@"dRwaTldZyYHugwYoda": @"nnEgNMxHQpJeZWBbgoZokTgPJlDpsusVrypzbNxaVxsNtwxyTqrntytnfLLWUZZeAtXiFdUJLaZjCRDAduVVZLshHexvJfXvmvdjklDWkswICnAhZISyoFyalFHWGzjBOVJXGkaC",
		@"auWMJdYIHBCLsViqGwT": @"DEmzCXnCnVwLivgXMnJGhCvTbMQnNtfTqGaAKkpKRqNMLkfPmOKezobQCJqiQPzsxhWkmwNRaQqdtblDsikuvwtmxRvNxRQarZUwpqziHbh",
		@"LngqYtrbUMRdF": @"bvzAWkGknVbGBRdzmYTZaLBQwmiJRuVYkOZZYDbsADgPbyzWTAoUoYaeJuvLdWqreQmZYMWgsfzyqexCEXCFQLzWsYiAqvENcgUY",
		@"jVTkcwahVfWhf": @"IpJjAFngEBYnagtfWLFWmiKbuNDlbzyGseuDPPhIIHKSOIKPLYtCGXNdHLduPinCjaGEraGtPGMmkNIKwddPcbmYfaNfdOeBnQxOtPGUdcaAEwXOJCVeyozOztmFuaTdpgfEMOP",
		@"rNgihReCIJrrg": @"mKTgXGdNIiMVZuvTijiqDASpQjZcQfgadTzsqwAJwjJhGMMpnBBMgKIwmpfkAhfWJsoRqFoddTqodPZCgGHESAwXhurXjzdHPKVvsBChxyaUOMFWZ",
		@"CVzLGZjuQzvKcsve": @"crVeOloBpWHqpCUJgaqVPrdpnIkQrmpzMowAvmfjflBYjyJdstLYEpEJzmiuNlQgzfuSPedLNWPxKdyDDHObQGkLXANXPBrHzIXKMPJIqYrdBAyyIWFndJN",
		@"WizcjwycYyw": @"AyFfzfsAPQZeVFwfofYoXlDpnIhsCdAogGAlyuCLoGzmcaRkSdUQqwPyRerxRPuFyxCSuGSKOOQLRdsgKGPKNKrXAsBeuOMGstLacHKldPcTOhVTCYnAejgtMxDDiXIGvwshXeDZiRaofcUkKoNeN",
		@"PwNTduIvZxfJTSsk": @"SSGLaLgwsWVzRtmEQRgumeVBUODrwGUGKIWPigFbUesqRiVzmBmsJkeUKGkbnlyKElCxMjhXoYHtjEWcblKbCdCPlCKzbVVzvWinHIqhuchklMdsQDTsprO",
	};
	return lYaPuKKXgIqcmWCA;
}

- (nonnull UIImage *)iuiGCnnlMSKNNZ :(nonnull NSDictionary *)jcwIDXVCQZIWKrJtgo :(nonnull UIImage *)CrQXgxXWKPAfjpS :(nonnull NSArray *)kjUqUPMMlGvxg {
	NSData *MOVBtYvBzo = [@"vUBqqpSGGJzXXAjAwXfEcjTirCHhjGqgCJgPJLkZOyKNMZkxUoBrrBJXWBWvqPPchhiHFMHPzQNgVugHrwzKlTcMUFaKXUgazGCJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bQdloXmLQhlxVJkE = [UIImage imageWithData:MOVBtYvBzo];
	bQdloXmLQhlxVJkE = [UIImage imageNamed:@"ulusxkmjmXoigWXUWpwcZdsmyLAPJXQmveJhUXbXiesSxUUHcflKRomoAaaJpUsZbeiQHjIiGjMXERQOyIuKcjnKJSVGEdXcZzZDyZMvRrsFwgQRmQMKVbkOXckNOrJpEZQyANVaRcpVC"];
	return bQdloXmLQhlxVJkE;
}

+ (nonnull NSDictionary *)NnIOMrRDpFKXy :(nonnull UIImage *)ojcXcxTENqHMYGpmXu {
	NSDictionary *nepAyomGxfRQyrxWtlp = @{
		@"dvclaIcnTxCAVZ": @"DRUXaglwoSxdIScNhugGPKOkDjJYcNCGXhvHYhwEEEePFDbrOIWHjxHrbqeyRHhLOjMFNtBxCLSpihYWhxmLcqCaHLCDPDYrMjKdudSbHJcbanUXzjPxPuVVenEffvUJzlolJhRCJhwTp",
		@"ahBeBIfKrENktOo": @"XbINdrUSGjqUmaktCGRaNsFohuhgrQbLfBUAwsheRElBChFFwODtLHJdjPlzYTpnnaysILGCtPyLESBdkEqyJDWNppWeLHHulIzulnChGUFKNeLWXdKXtHjecdkccVfB",
		@"KdwvWBzQkOPNKo": @"MQuDVNxScczdoeGMYiIPueqnQiabLJAtjIzuIqzNzGtBnIAcVqrybnzZPMquHKARcnrjZbxuQUKCDVASgAidHPkfjeIonMYPYqJejYcSCrzNAEyZSebiRSz",
		@"fHbtjNfmFBoUQCtw": @"MMNFoPoUHKiuXRYmyDwwoCKYAIiVMaXCIiWxwtvJYJqeOTVdkXJBTyWZBUTbzUvTgWZQajnBkndkFSvGIpYrbSbIaxOASBvSeAqnKooEVvNHeonPdGgQBuHBXSdAzXgTvznpBdYtvFJ",
		@"kSfEzmLaAIvKWH": @"gyAttOFvytrJvxojhHJoNzSIzyQcnoNdQaDNiDufhrMPXvdAwgdPjcGYcoFOPlpZLVXNbleTOimOMwYZMOVLCEWHLvwuiHonTfAguKiYmDmYeVIjMAHNYktMcfvtGmcUkOLrIGQU",
		@"SyJpIWGPKSapGccG": @"frYoMzJMbVoEXSTAteslnxJAYeJnmboBxlPVBLQpASdHYIhnaahSzWawZIDwSvTFIWDLJkNueTcFKfRQOOdujWcEqBKtqAtAQgfuShlUyrgslBjZDr",
		@"MseapzqmowIHasHbR": @"WEhkxibyOXTnWbSEqfBdSoMkylyxCMrcqKOnmPerTCITiqKISjIvfVMjqLBDkQxitzjQpFdihCYiAtpGYHqVXUWhXLFaEDpEiCGnFGzVUvsif",
		@"zDiJmErGhauOxFt": @"ydTUXteirHnimAQPhwVNtafsQEkJmSBULQTWqLKtWPBenTOwqffjMIYFcXazJzyvWOCJDSLZxTtadhDcdekrJdCsxbBTROoMMbeqHYThRdGO",
		@"UufuDOFhvmY": @"rrnMorbEctjyiuEOTUlfqPMZvtFlRrkaKaGEpBFQADWgqhZyvKigjzGfubSoVUgKQPjkRPCJrWWjZTizsCNPvBOzwzXuBFMvxnXYgBfjrOsbJnCoLvMwVjigCWHMtjSxaMfZFoPNelWUzEnQXAr",
		@"mcgcwlHEHoPcpib": @"ibjWHIKwMjOHxFoOIKtHoXAETCBzfrLlEnBQDikbuLCNRXnqXzVJIzfdpPRycjAYQTzYieleofChVVqBQkovtLAYwpwbGoLUebKfWaWBXZjffJOKtxLdVEzbhxsnRcwkuYqIPuMjdDYX",
		@"dZFGmbuoOplkxfK": @"oycXwYgkuiKoClcmCHTBkIZKfKWiVFJbanQMIiZlJmPhbFQiEgZDguCFuAqgILjGejDfMJOetOdGbBgUhOEQyulZQkOiUnxyejoTFOMbJitHzMmTxytR",
		@"tAZwUDimUTqCPfXSC": @"IYhgkmWaPWUOfAiFKDNDNfsuGPRGWijLWWgtncLZbfiVfgDXmGbPxLtOIFZrpnwACenGoWBLpTqdrEkRsbmyAwLNwNDbPuYLtnRijApJskAKxYLxg",
		@"uHJwNRHcRfoIickSfQD": @"pEKQFiatITHzBUeDQvFrBNZvCbHBSjOdpXITwFieNJivUCVfAxtwGGftznquQOzcSphVJzxeETjgffhFfrBQJzaHAXZrypqwQRKPBgmFFjjrySVYo",
	};
	return nepAyomGxfRQyrxWtlp;
}

- (nonnull NSData *)MyefJteFhzB :(nonnull NSString *)JisoeJOjsrPmRplohOu :(nonnull NSArray *)STXmZIeMOmF :(nonnull NSArray *)nfZegHljDx {
	NSData *OXJFxrwliLDCKP = [@"YwLrUeIkyEhwFVxGBGZyqNERvEAYCAbftZJOKkobDAbUezYgBWLpSfqVlgjGqaFeoEVxcxGiEeBYusxYuIIwGHIveyOciPKRRLTYS" dataUsingEncoding:NSUTF8StringEncoding];
	return OXJFxrwliLDCKP;
}

- (nonnull NSString *)kPdHbSZIqvHVNkNM :(nonnull NSDictionary *)JIqINusxjqlk {
	NSString *WtxbPPKKvOlw = @"YsxSoTmKusDcAFAktBanNxQLrHMluHxYYtgYuHjLeGnajfyjiuJFAmGwulAdrhwbxnrPTLqzrTkKGVrVBxBOrIUQDuAReuFPAJylMyfOQtTlbQhzQklMoqQqtZrDckBypbmzca";
	return WtxbPPKKvOlw;
}

- (nonnull NSArray *)OZQoNiXoVzanWqS :(nonnull NSString *)sSePQfTLDIkm {
	NSArray *eduiuDPwGGr = @[
		@"yWeVsIrxdlOGiAyNMZoSQgHumoscNjiXMkUhJCaGVbLdachCveIOsxIOMyQiULCJKfqWQCZZkvNzpsROscyjZzkBxyyeFyqckerZcvJKGmgQjtFBctbddjnChTyURtopUgVJnPJBnVqktAE",
		@"gPHpehOBZgUDgSIMzPEtSXRBJusHIPbVzEPkOLIZIngTkadTxIaUBApUOcnEcjHAdyaGlPKdNpvYyQsSfkDrLqtnMftUwQSqHFxGqoYVcRIgYQbxkvtBeIxlywkcPXMTTVNfKXvoskcYrgx",
		@"haBPQngkOtiewclDxsKdnCopnMYLvmrQKPOYuPaiFwcfOsnmhVpSxPsKTuNiJVScQXkUxJmDsSrfaPOoTUyiQtRNlYGbDRSpgsspOHFFLetoXUIbOhousCcdqEuE",
		@"gLliwyKYHyOfWuVbcyfDlCNDHHsdQBxKoLBLwWOziSnzVZtynhgzvFdOoLXXhUPmYuVVxtnzTQFEgjkLkDcUWZjnufxmgKqaLkmiNNeDwAQPPAzXciTslpQTy",
		@"pDDFtVoPDsWJAsXAClIHPUlehnnitGXLbdNyqmRcemzfbHFNSytlNSwiWbFZwTTRSIOSNPoJnNhZmYjHrQXTnOiaXjMPhGyMdLPagpxt",
		@"boVgKXECTTWmXYqcdZiehrBBogwdiMNahGIRoHNujYNeucMXnXiCDoCPnPbRBxLnXAsADUSsIIZbBtIJiVAdvJobzNohQtTLpfhky",
		@"wfjogubmRRvITBWlFHAYetsIUydTupjKXKDmXETiZOZFlMuVfbxmCAUafYZDdMZVjVUiivJnKmpBGzfkaojVjmrcCFKKqbkgqamMoRoAXRvVpuuzkYZafHCvkYTlNTvWAmcMwJgQPXEeTIqpIik",
		@"KiHIgdOJwTqpRjjyBBrgQnIOtgmFbnuWxnoSNKbwATKFRMtwFFjeGWgyPNJpvemtGRkjbihSThuKXLBCTcZQnPTHpQaViyJpYgIxBfiQblKpEyxnMeKUtlmFginxrbeMPFZAtNwJzdrpSmzOJNVW",
		@"HkRUHpxioBvyHwGAFuChgtJPyTHiQgTpSbOjVVlEpjLFazPtUcQgpxTfyzElYugmmQihcpWRkmSUWtpvXoMkLasGyQFiyrBebYSlSobrVZpAnxnkdwjYyadSKnwggeVfSJDxsgBaCpYhAv",
		@"yWjDyovQIUFGzgKhbDGvtuDYkOkRJvtnGRRMMSmAaVDcCCyCWEnSGYXqtTDrenivGeOSuntfXkRaGDOxOBhVtomhjBmwXMiIxLqTtTRgOIypGcElfVRgyvQqRoyWJrJisiWl",
		@"HDaKrrMQniOEddxXjefWeVlaGiRCWCgGPfRlzjjeOLLUkMuPMSkMPtSfvXxOUASKTCQctpOSDcFxmmZdRvKrJtJulGalKkgYLmkTTntiCMAEiqDfEVViMdGmuNDQLWMJLT",
		@"SOgYTOzLZLgCuuvIhgxSWcSNlqMbWcvlJqZBpxOFocexIiYqnnyYCJiGFJHBCueWXQOdmuPvhyMDMpzNHaUMbIAYHrfmjkebhFlNvFnHESjzxJviufvqu",
		@"jiDGzRzdEakwRSTpGOUwBPfWOhrWlOpvthlEslcJWZtOyPAbgtCbVPcEgJdcZaBbfJCdyUoRAdzhzXLGiLndhHAqQtmXKdWMPbjOkuCloHZcfvpBkXavjHUJlHwoaTrpuYcOC",
		@"uvfzumKqgrMdLdhPYeeMOEJfgyeDqFocspXeGNnBXhTxlSWduPAyGDPpflGtUpeMETPnGVujdBizmGOJWUeXvVYMSSPhRpavAYeRcDlORXKKUavLkgAKnqAvRwZdocYltJEkJ",
		@"slMnhteCjqTxxwXEYmXaccLCaGqLgPJcINxTYJAKBBHyEYoNUxiSRRtFOCMQCNJFUjdkgmjMLCvIgRyLPoAsdVlUJCGRgvrUhFApCoLIKppdWkwUVnZcpWyZcskCSIQkTTbcDhVcMkeYupxNqRj",
		@"asEYFXkAFWjwRbMFByktWnTMheJBqIbuIQRVVShkMjimSECAvyYnWMGqxxmaiklbpCBwqRaXlFsqUMncRKohKaMzpHjESGdJRlNocEZcnekFKJFOPOReTclpZxlAYFmSHaq",
		@"snmkjZlinNrqlrNXgqbkfrqopDLQKbumcUCStxefdAucgBtRLDaNSmrxqVfCFIPqxFngTgFFqEqvMpcpCbFlFsrMYGGQkaaeINzsOjLztiyanRgibLMQtXu",
		@"HFcClIHyIJRQKeyHIETgFCiHanlMjuzdGqxiItCowKtQJbXGRnSdQRmnLMcOrWrKYKFTVKPgAdwqUoezWpRsGeVyZLqMUqEjwMyh",
	];
	return eduiuDPwGGr;
}

- (void)setModel:(HomePageModel *)model
{
    _model = model;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.image] placeholderImage:[UIImage imageNamed:@"zwt_kecheng"]];
    self.lookCountLabel.hidden = self.commentCountLabel.hidden = NO;
    
    if (model.title.length > 0) {
        self.titleLabel.text = model.title;
    }else if(model.mainTitle.length > 0)
    {
        self.titleLabel.text = model.mainTitle;
    }else
    {
        self.titleLabel.text = @"标题";
    }
    
    [self.lookCountLabel setTitle:model.learnNum forState:UIControlStateNormal];
    [self.commentCountLabel setTitle:model.discussNum forState:UIControlStateNormal];
    self.sourLabel.text = [NSString stringWithFormat:@"%@分",model.score];
    
    self.sourLabel.hidden = [model.score intValue] == 0;
    
    switch ([model.status intValue]) {
        case 1: //无考试未学完显示
            self.statueButton.text = @"继续学";
            self.statueButton.textColor = MainColor;
            self.statueButton.layer.borderColor = MainColor.CGColor;
            self.statueButton.layer.borderWidth = 0.5;
            self.statueButton.layer.cornerRadius = fillet;
            self.statueButton.layer.masksToBounds = YES;
            break;
        case 2: //有考试已学完显示
            self.statueButton.text = @"去考试";
            self.statueButton.textColor = MainColor;
            self.statueButton.layer.borderColor = MainColor.CGColor;
            self.statueButton.layer.borderWidth = 0.5;
            self.statueButton.layer.cornerRadius = fillet;
            self.statueButton.layer.masksToBounds = YES;
            break;
        case 3: //有考试未通过考试
            self.statueButton.text = @"去补考";
            self.statueButton.textColor = MainColor;
            self.statueButton.layer.borderColor = MainColor.CGColor;
            self.statueButton.layer.borderWidth = 0.5;
            self.statueButton.layer.cornerRadius = fillet;
            self.statueButton.layer.masksToBounds = YES;
            break;
        case 4: //有考试通过考试
            self.statueButton.text = @"已通过";
            self.statueButton.textColor = AuxiliaryColor;
            self.statueButton.layer.borderColor = [UIColor clearColor].CGColor;
            break;
        case 5: //有考试补考未通过
            self.statueButton.text = @"未通过";
            self.statueButton.textColor = MainRedColor;
            self.statueButton.layer.borderColor = [UIColor clearColor].CGColor;
            break;
        case 6: //无考试已学完
            self.statueButton.text = @"已学完";
            self.statueButton.textColor = AuxiliaryColor;
            self.statueButton.layer.borderColor = [UIColor clearColor].CGColor;
            break;
        default:
            break;
    }
    
}

@end
