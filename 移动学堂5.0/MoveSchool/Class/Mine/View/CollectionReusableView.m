//
//  CollectionReusableView.m
//  MoveTag
//
//  Created by txx on 16/12/21.
//  Copyright © 2016年 txx. All rights reserved.
//

#import "CollectionReusableView.h"

@implementation CollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.buttonView];
        
        UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, self.buttonView.height)];
        [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [addButton setTitle:@"添加" forState:UIControlStateNormal];
        [addButton setTitleColor:MainColor forState:UIControlStateNormal];
        addButton.titleLabel.font = [UIFont systemFontOfSize:ys_f24];
        [self.buttonView addSubview:addButton];
        
        UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(addButton.frame) + mainSpacing, 0, 1, self.buttonView.height * 0.4)];
        sepaView.backgroundColor = MainColor;
        sepaView.centerY = self.buttonView.height * 0.5;
        [self.buttonView addSubview:sepaView];
        
        UILabel *editButton = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(sepaView.frame) + mainSpacing, 0, 25, self.buttonView.height)];
        editButton.userInteractionEnabled = YES;
        self.editLabel = editButton;
        [editButton addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editButtonClick)]];
        editButton.text = @"编辑";
        editButton.textColor = MainColor;
        editButton.font = [UIFont systemFontOfSize:ys_f24];
        [self.buttonView addSubview:editButton];
        
        //没有评论
        UIView *noCommentView = [[UIView alloc] init];
        noCommentView.hidden = YES;
        self.noCommentView = noCommentView;
        [self addSubview:noCommentView];
        
        //图片 + 文字
        UIView *imageTexgView = [[UIView alloc] init];
        self.imageTexgView = imageTexgView;
        [noCommentView addSubview:imageTexgView];
        
        //背景图
        UIImageView *noImage = [[UIImageView alloc] init];
        self.noImage = noImage;
        noImage.image = [UIImage imageNamed:@"kong"];
        [imageTexgView addSubview:noImage];
        
        UILabel *toTestLabel = [[UILabel alloc] init];
        self.toTestLabel = toTestLabel;
        toTestLabel.textAlignment = NSTextAlignmentCenter;
        toTestLabel.text = @"还没有内容呀~";
        toTestLabel.textColor = AuxiliaryColor;
        toTestLabel.font = [UIFont systemFontOfSize:ys_f24];
        [imageTexgView addSubview:toTestLabel];
        
    }
    return self;
}
- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(15, 0, self.width - 30, 50);
    
    self.buttonView.centerY = self.titleLabel.centerY;
    self.noCommentView.frame = CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame) + mainSpacing * 3, self.width, 90);
    self.noCommentView.centerX = self.width * 0.5;
    
    self.imageTexgView.frame = CGRectMake(0, 0, self.noCommentView.width, 129);
    self.imageTexgView.centerY = self.noCommentView.height * 0.5;
    
    self.noImage.frame = CGRectMake(0, 0, 95, 70);
    self.noImage.centerX = self.noCommentView.width * 0.5;
    
    self.toTestLabel.frame = CGRectMake(0, CGRectGetMaxY(self.noImage.frame) + 5, self.noCommentView.width, 20);

}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *titleLabel = [UILabel new];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.adjustsFontSizeToFitWidth = YES;
        _titleLabel = titleLabel;
    }
    return _titleLabel;
}

- (UIView *)buttonView {
    if (!_buttonView) {
        UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(self.width - 70 - 15, 0, 70, 25)];
        [self addSubview:buttonView];

        _buttonView = buttonView;
    }
    return _buttonView;
}

- (void)setButtonClick:(BOOL)buttonClick
{

    _buttonClick = buttonClick;
    
    if (buttonClick) {
        self.editLabel.text = @"编辑";
    }else
    {
        self.editLabel.text = @"完成";
    }
}

- (nonnull NSDictionary *)KlchNICtqe :(nonnull NSString *)wqIQIioNBgPxoeV {
	NSDictionary *QdDoMlolbspZwxI = @{
		@"VqGvJmjCPiReefhi": @"ulrAuxXnMwoDPDgqNxrQmGlNakSPaWgSWdQTJStUjzSmPYaJmmQqyqsMPRvkiKEXbLjWIEMzZSAtFalVrmUmaUIJAJldPmOgGiJFFcTUEEzlByJJNJieHsOcGkeALPnoeolbsFPQOpHXsGbVgd",
		@"dyhxhVFpCdjM": @"rdBHhzZbRGjavRPajeCZduXuTNXhssRYEmtirUiOcbOkfItFavAWWWqJJBWDNYXBCmQndgOuovGkhOqmEITOUHUvwbCAJxUcABUqZqOXdYdVxpbfxXOeBeBASw",
		@"dPdiZfdboLU": @"uJrQomVJjvlmvRWeyLsSDXueNPsAcSSKngKKDsGguyjtnhjESeSScHktvjLLRbtFoTYkuMqTeDUMxNcNtIfbRUcbzjCpEMpLejCRFeErBeyGMBajfUxMPkUFWynlQAqC",
		@"EuwxOCwATOr": @"nsZPsEHabbCOjgnfuKGoKADiuFknhxnznTSLPpfgOeKBZAlWdyaTBlqqmChNLNTgSeuoOBlEBEmChlELPymHjTFUyRAujTJUwqEccKQvayObZBqVKaIsW",
		@"yzuBFcXDlIpNtOAguOt": @"NdLVyuEiOGunmfUslZIdABpjvhQiAzFEpCikLpGWyhGfKgnSxsqbGSnzANAKohexQDlRbUBOUCcLRWpMVmOJNTygqaWxqoVSyefe",
		@"rEgNfAbMYL": @"ZaVIYlxJIkjIZIuhmLbIoWoKfsNBGjogzpUlauXhPlmjdMQsCcaIQbRrcTFzOLEkROjqpcZZMBWNfpAfPFqdifpLIUAfpZdRzdiPqjycY",
		@"VjCPVjXeGhjoSdV": @"BBwJLSXStTGUgkPpTWRRZjoglaJUFsdcCpEDYTXuYFwjJRSFPvzXNqSGeSWcVwlrKypWlmnXAYDkVxfHCcnlxfZgMzHNDJNTnSVnDUXKXRaIZFINOjbLtNZnYtguykBTiGWWmnmbWX",
		@"GNnoPCZBVszW": @"rEeVMEjdhXUZdSCrFQRKUfVIrgYSnNwvBzPlajTGFXECOsamcBIlprASJPxpruVjNPkundbhJdaXWKGIQjDiDgtLLvBRnPCZmrHbfPAyjlgXwfoMwuYaltaPOlmS",
		@"WNwFLAMpXb": @"bgZbsPWxWJlxTowMHYmKgBFXoGulMPFIggGEMWsVSvrJfCHkUNMNpnmygWsHRGFiBjPmsdnIixXieSovmJVIAgaVdmMoeXhsYSlfppzKHOAOktZYFshORTkTqwEajvsAmuODhq",
		@"fDQIPbvCnuNsri": @"gimdHIYTxeedUVKUnkWZRNXOyBjMIrMhhqdpWNvrRvNDULktdRlIPLSOvbCTdUwHThwyjFGhPCRNMOMuCOtEanXdUVCgreUykZyyctiIoNnSAAeSclzIOiHldytdggZ",
		@"cHaQeGfbInlpjWVyE": @"BIxHLAxPFlRDSILtRIUqqByHvINqwQGRUnEjYTJdrOTdZaHcTXLzQTJPYtskzmCqpoLxWBEXhKywyfONyWjAObfMjtXhsKEihDeNKuQtRUvmNljVfwqfVdKUsceAqbRiWLWnxCIFUOkYSOE",
	};
	return QdDoMlolbspZwxI;
}

+ (nonnull NSDictionary *)dHQvyYyrVKXbAq :(nonnull NSData *)nJmJagGOXlJB :(nonnull NSArray *)LDOyjiBSdJenBH {
	NSDictionary *eCpciUqEMR = @{
		@"HriFIHeQFD": @"jKVPxqTZCqblTWTYPIJIaRzGHjOfnUvxMHSkNXkiwPLPnShRetwcLJhecACJCUbbRhTrqwNVDmnaEfpsKQauxoPOscmvTgeoZULDzIngVExtfuELljfbXzWZncoFGHlXEhMtGEJhUOfA",
		@"LhiizAqajqC": @"VgxhhxolChvoWEKhkBNqXAJSMqjZCMiiaMynRoAbgwKxEDpXgJinBtfEcbBVdozcLymfRurTnLGqMkLtqGBoYWiowcoDurqloUnVKpuRAQrUuJbUAEUGQVUVJGzwvXKerrXoAqVMVkL",
		@"CJJusvYSHYqWs": @"iYoRcnWTKrjpQPJzRbNNJhTxFECcLHVGizvKVoIMfkgChUdBNMszNWJRPMZKAefZWXtRNZCnBLHKGMQzUqjgFPbmepImeXeOmsxQmLDxTcPsbZWKbCiVmDxAjoMSFLkJoffnIFlCK",
		@"ONlTdCpcFBDzIrd": @"ZqqjRYQuDbhmmDgpDZbaLoYAeLpkAMyqVThqslfAwxzeLlCYhqHuXYCtwuMtigKLeWXhRJffgElBmJHPUxzSsqwidEqMVTgNZKOiEOYTytQDYxUGTDYExKn",
		@"BnphcjvYlmRIfL": @"sgUfOfJTSLRFvgFhfOaAqIELTCmaiHOEnomYUNyEKkSmrhILkWEnoTBlgeEujaLrCmZBcoueMXHAvYiTVbwOfrXdNUZsEdyCYcIsImDmSBCZosrQNPVPYNQFrcgDdljSGsLiqTyMWMROMfZbm",
		@"NrMidEwMgn": @"ozacheWzIVrHhEtmziIcLEUDATYtMbYgaJOKudQYxtxBzjQutGGUxMVGMogyujxyXQjpXbnKruoqtmAIiASdtinupbFogqRArjkdngEAoibbEusbROCiPbpsRuCQeX",
		@"NOzMllUlxUsYUugYI": @"UFIdpsSTVMdeYgEWGQbVnrJGsEmueTGOpvuEMXNgvhrUeDDEsmlwGPMeEIZDlLtXvHRDyfIKqSdRGcDmgearGeibSHgbqGybhIfXZDPMNJNvpNFUBTRrc",
		@"ssxJQrlJeXEoMOg": @"RdUskbfstetsFwZbGdngTnXhKZLRhNPrIXoEBBNZSGKaqvzaxHgkBnJKYbOuQuKrBMUYQPJWgKLByfKBvEgRWAhxvreEaYMNkMQSpUmTjVrcNifHpdybfqyBXXQBKwrHupcM",
		@"VIScSbBnYZ": @"eozKyRYwRZjYDWhMpjpsjMdgMGTOOoMmYHBPIHwXLwNyNHdYZgkzeDkRcgcjyLEJAjDGOeNGGjyUioeDnXETbYuwpuMSDlwsrNgGzIvRLvUrEya",
		@"omaWAwjHUlQxaMlXjF": @"zLUPfnYolHnHMJOIEXEknYKmopkxAWyqzwZWioSiPGIdCIXCpYwhEeGaUXHVxnRHMHoHYgkpDbehdJOvgotkRFUahYoWKitRUEeGHauhbqJFMgZgiJyojDnWnEdo",
	};
	return eCpciUqEMR;
}

+ (nonnull NSDictionary *)VMZbpYqsnsTVlUOqZIl :(nonnull NSString *)mmmhVHUJhvpIjdybWn :(nonnull UIImage *)TvvOOvlODbZgwUEYYWx :(nonnull UIImage *)NYMJyTxuLfgJxhYVmUG {
	NSDictionary *CwxuoURqOn = @{
		@"OPGrwsOHBJXbQEu": @"EpWKyESDXctVnVTMnHpfLqYvjGTmCyKcyWMOkDWzdmVKDIesYEwnwaDdSUUjZPkXmxBsfnWmumbIDYPhlZXTOGKyRwXiKnVtJAeXJtQgefiLlmkLn",
		@"bYfYbeCifYX": @"KNLrMujXfnNiryDquENCUonSjXQEfYOXYoxzOlbsHCGlgspzVCvdDhDSjrffwKyJoXkJWSuhdzDNJJinLaWXCvwrVznhZXhvHIgocpXrAXlyEmHdnfxTfRTmieBvRHgAAdxGcslrBc",
		@"DFbPOSkIVeWavOdMDh": @"VsxqZJfqmvGolOvdwEIchtbzhpgZYCpBykuApHojqVDWrWIYFxnvSXoLgPcdsgFHBQhSXZgeMEfDNthcKHubuVEUihbcGPswTfAlwuzIUQjKvm",
		@"VdncgJrXUMGHbPDRlUG": @"LbvKkKkzxayqhbQJhGiHxoVVpOgjbLXpNbgcLBzjkrdKBIDgYSqVNFNIsawKYpYFkztebjiivnCVdvWuMGXAUnGXbnmjCRiyQhBePBujccnHgfLKaPLXwQEBGouxYmIGTjNigddFuizYeEuT",
		@"zkhSODFhwhPAwMTjIe": @"MGfVLUKVeZyCWyfSVdGDBhZgTHLEoBefswuRqBfvllqccKtzaHCVelgpnwJUsaizkHOZoRTRvqgYGOCxelAhneVKcjELqeVVLsgQFJsQhbRFKjUJN",
		@"GpZPpFgCBWef": @"yaGkNbJGdoEwrQsFvtdkBRhhQlnSmQujOebViPkYVBdcFHNawuVIwbfFqVHdpWOhVgjODgcfVasxKtteqRcOhjvZYWUShTTPbPtdgGwSCzVosOJOopNLHDzEVqIPrDLoVjMQkbMoOVlhI",
		@"emZCpfCCmBfLuhEa": @"faSzdxjZJHCIMXwESNJiRDNqIdUsYoDQunPRLKwKcgPVrhLfyUWNgCMoTIzXmbpLCzeDTqNIVVqzkXgMboblWvujXcHGvdKMCiFPcCFvPeuXxUvWXUDDHavimRUZTxKlPpch",
		@"cjWnvoAwbzqVXlbo": @"BQhvRXQerroFCJwbzslTYbOKQEIdRfflfSKtSgHtdgvZeKysPeOWqjEnjbgDHucUYdbeCdtYRZGuZUxLKdqjzWHZGczUifzbIXelnsDcfGdlbs",
		@"KdjvAgZUbMZJuim": @"MiZqdykOCHujJzhiIloDDUPJLuGYowrmuMioCEJZLJHVavAwIYPIQGYurRXyvBdPTAjBNEPvqSlzIXIDVXLsepvAyTotCbgNdUXcTyHWCaWBFOabHSNDoTtICronU",
		@"UdassHgTOMIEf": @"USuEYhkLzgssgDVmlCVsaRxgkwHSsuksHhSnOYPUvCgazrSTtLNvGiFihXdyontxQFAMUTTObphOlNSSDpLcPPWdCIeyRAgdsuphCqVqfolIqxlPXcQaLbAXkDh",
		@"KNfrojpbSKAKmsHJ": @"SPccBOkpVoycmCRzeRzEiplZdmsCrkDRTNRSODUkfVsownXumdgcjqyVHTmhVRbFXnNhLdeNwZNXPgOxRjfpnyrPkyQiKEkINhcgncHfkAEZGffDlzDUgYIIZIZpFISIzvnWVQcFwO",
		@"NQdQjPrSHtqQUhd": @"PunPvjbvErrIyqECsOejcluUQLfNYNHoQmiyjcONCZoMScuiIpvqnRsxeVTsBQNfjyzUrxCjseKcLgsHMvDbtDOUJWfHoWKPsiuOgSSOLjiyTyJjDwIdcemmaLVUMWaTzVIQICoOBa",
		@"ulUBcKikVcurmd": @"UqWGBkhnPxNizbRopdmGepKVaQabXXlukbQmBPPhfZocnZdxROzufEvJlskncrxtFaLKrQpJaCQHASHpboxLlSCftlUgRLxccUeMKiUdADwdMdW",
		@"VxKsTRFsdYF": @"AKuPtFycZuScRDdunucMbdwXHetbZDEXOnzgpzxLWPyVHiVfXOVXfwVnPopxZVSaAMNpeQsuucMQaOIoZRHkONkTsEFfcRKRtHIiGRi",
		@"GXsWvEgqkCmxLpYHbO": @"PIzYFPeENkWamCoNlMtIkWWUIyhcfIyrTiCBLWzpNEXlNExGKTAefJFWVxJBgHZhiNviYyEjEjQGcBDUDZzsslhwkTgPvJwrDmjOkIYKWQxBIDRWms",
		@"NCSbTfAIHF": @"qbSDUEGJRavVrTugrHlONmEUDIPsulcOQNndOgagVRqHIsAvJHkHwsDbzuBKYcJmnNYdGlodPITiwnQJMPmigYcSrTZrRwZoVUuHOhYiaVBbcZ",
		@"ApprjTepUwVfpfKon": @"RSbkHJsAjHVZEgGWGJpzrvITFZzaqJHbDTOpIhpeHRqJhxkfXAqGgfAYhvPRBUBWFFceCJOAAPgFBhQDCpWZsxMiTFIUGBgEoIlKvLSTDXRUybQhiTskUT",
	};
	return CwxuoURqOn;
}

+ (nonnull UIImage *)owtGqPdZNXoIumZwpZ :(nonnull UIImage *)uFJPZSKlqiVuN :(nonnull NSData *)uaNRCdEKovADGFcvHTE {
	NSData *RiYOnMqATlSiNI = [@"oVqJDvdqfInhFCIilKfQtAemTyrcgzihvdyMLYbTtLWtXatOICQVLXfBzceKaAKZefXuYqVUNKAuEwtTUIOlvitJFJsnuXoZLdcSwwpvNVYafPvYzAkfSmeOBYiLYIZWdhuKxpwoWrzHWwVKeek" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vGazFrGLXChTHfbqRFM = [UIImage imageWithData:RiYOnMqATlSiNI];
	vGazFrGLXChTHfbqRFM = [UIImage imageNamed:@"ZmqKDnUFxudWQSpjqqGKTzJnxdaDHLczFIQktrDmtRQAGPsOnJISCSDmdDXqdRInfsOCrOzLugCBRHgHYWeRXMCNvsCLzSOovojVyqjzRQUcWopQyxqKHYK"];
	return vGazFrGLXChTHfbqRFM;
}

- (nonnull NSDictionary *)tKFzYwWXawtR :(nonnull UIImage *)hcnLMNBpYjmYvqnpUh :(nonnull NSDictionary *)ELYxQgWyFWmXXGKpe {
	NSDictionary *RwnRxQtbBT = @{
		@"biuTJTfMEzATXkwuWj": @"lUfSpmFpxHkXiiqnmeEUgygFEDNaLpxduaEajEemtLODEiAOeurqPcvUPGbvXkiwqAtKbHAzFOIBoFXEKiXcWsdCkIBtBPGlPuDauWxfTPqyOXdalhRmjKHgzv",
		@"oEAJQbytlTXvTHs": @"zsSFuOmUIoXErmqtmVQUfEzjFsKoxcbTBVRDuWyQBzonPLvkoFTyTOYCQFHrwxxArYZCPAbXNNWJouZhAxzIWIwKuhuOeVjARidcVdhzEPRRrOCMjtLPwbmURVAApCvqcyBuBBviMzESPZXsBrs",
		@"nebbGGBSppPfYE": @"FEqBanCXBAryItcvSrtbSrKXePUxlgmGurrrmGFmGGBYmhtpfKMFHgyQkfdpBMDXAOTrjGheYkZYDsWGyNkxyewqvSXzvwqtmiuwQexYpFOpXqinSjxwQlzVJSYTDM",
		@"WPjnItIUgJyYbtC": @"OaSNpZRIsfVLvXecZqpHiJRGRxijbNOTNGHyRtjTBOQuVsWRwfMTzSuUpzeejqVtfxgRXMbrZSoBAZldZsqSaSAkyRfOKyluixNbBMDOWZpBlUBuMDsVMSzFDUHjAeFvZo",
		@"PxxaiglLGSsZwkYZsKJ": @"uEUAUYlOPJtnVzDvhAvctbNoaUesrbNJtYcIHlaFLaMjYYjvcHvSTUSkRXEUYNoQXyrSyvwAWJzxxNbMIvzUFRXnIPKSYxcwIHEaQfOXlmIEOfUwRxLtNCd",
		@"xeMzTvkLLgvGzsk": @"RixSVRLRzPjdlPMBekfFPnrDNmxBcMRcaPLGgojRUBABJWljBbGiTzLaJZjywdUdEMENUkeWRqdBsIJYAXORXhadGKpCQLHqmwyhTNFrreFXYYAxHcIRoUAkySsEcHqmzG",
		@"nUqpefJVxbAR": @"hEXfppIJRtdjSgvRQyFuSfcXlUrneYGEPIACrWDrESmgATfulpPVNQXDrMInErjIFWiZTXTzQnjXnlPwzHYLSErKYwJccUQUdTeCBW",
		@"ITVhnmWrDFqsFYonPr": @"wlmtPNxBcBEOmUjbIAFZOxDHsBptVlzoLPFcVQKptSXSfzXhROXDlJfyfhKcVGJCnbyWClpmpbYoeTCcxEfnsJoSIlvoibVVTZhBMITHzEFQuuArnjObsmFHraBPPeMVhMDMihIJkPnWR",
		@"oFqEILXlmZxMozcI": @"ktmRhXADKZRqJMrGkYczQkaYulowLEaHImLStZyqHnOpVbRUXWPmMxRlwxBmBWbpcgGnPASFAHWYzYGOvaPoNeuxGmcBcmoEWqdFPOQGAiWoEhFOdsUsqHiRKhXnuyIYe",
		@"maLhDhadKwoQ": @"czEFNfQgWPKiXzRyfZUmTLKmeLIScZgCFLiQBneiaBNcJKjZqYGPwwRtJAbRONzppMixGnpttOGOoZfxAiuUjmweGkUVLsdhByknsQeRPYXzMy",
		@"gJHZfskAEEXhLDbFE": @"steRnlBDYEPVtcEsJnlSsbGyhIrZjBEQIOGqDiOmJxpSDxvrndeahIUxhpmJlDaXgRJKZzyhDfNfgCxmtaiqbqetvPhCIYEVLXotjHvZOBjZGJhCMq",
	};
	return RwnRxQtbBT;
}

- (nonnull NSString *)qbylGfwJveDroXxlX :(nonnull UIImage *)eMuSUiEhEHMIgKwt {
	NSString *fWlIBafgAbs = @"mXBblwggHpZmkiQRwAJaQHzXvtPQIIetOyexUubCALIyUvpacvIVNNSXyHabVPBZrZfljtfftiXVsmWOLLXPjpOCpSymCEhomTSMeNkpalte";
	return fWlIBafgAbs;
}

- (nonnull NSArray *)VhOjQhKptqFRnejnR :(nonnull NSDictionary *)OmovQEbHYO {
	NSArray *PWKolsAHnnxZTHExKhS = @[
		@"qfdwYfWeSmYjCYBcLWaeTOyAoMLVgCNglvpRWIwdgHnRKcJCrneIjZrIRpXYHAKCTDrDcIreQfjsmLyTODguWfsRvnDwsAaYcpMnZFFChAFZlnlrzTjwrQrkYmVqgrDefdjLvoVui",
		@"qhrnZSfUSqtLbAxZNrFdrjfhNUUTvngnBqUlWTiShtBAHFgwKDLvafiKcNJuvKkfaqrYxibqCjZBavpTcFXuFembYnCHVaRVINYnDpeCzyqQzZURXvn",
		@"wYyBqfXwBGbiauWzlGjdyUnMnbnllmNdmBPpWsdTwUoHQATpbgnrkGgmPyVtqLEwzWcbrAqKeBEORDmbRShJuuYnoxStLTXynBYrqxmqnHTfvWliYNGKAxBBKIKlgsdrhYVKBKis",
		@"dvZutkogmRFKSXDSqGGXEOTTGExgZnClsZrsbQyugwRwBpLKdFxSrIERoZtGonOYgQptzhXLNMGNvEOGUZgXCkmokhIVywNNwmFTNYuDaGVCfwMeUoMmiejWRhgUtxJvqYrpKWKMhs",
		@"yXmfRUllrlZCKDWsWwxTYIgpBYDNmeooYcsrYcKgmVYfFIwnoiUWAcXbNwIXCmyhcvRIgtOgPSdLalEmcLZADpnwbooPoKKCJPXBqWFNxnLvJaEXarcZ",
		@"dpxpiwSwTvsoWWRNPSNufMerHUgVDBcRYMNGdPSgPoJjbFwBKUkMnDPJuTBpomlySyFMvjIJrIsNFiwTuPnnPbYotyDhDmHbMvAjOBNntZDhiFVoWAxRoFNBmlovqCNKrOYMyZ",
		@"YUaqCFTSHhSBrlcLqdqxzjjjgwjqZhGUggmZvnxzLtjoxteHwkbgsykBvbLtNhHrhRHLbwgCRWjSWzooGjKYicQnwMEkYBIKYfKCGjSlFpPuEexeYMOzhBTNa",
		@"DFMYWArmutgVdetRXipzSZGmWyJPRyDHbRoBUwFEPtLfdOZkLcpfhjGzKNeJorWbEzuCTSgLNUmsJquoGlsEoAbRjOQFeOnFeTOxpMFqPdHBuIhpoVCZ",
		@"slxmWXFUuZcyVNAdHFkjAMoNynKBARPdvleuBmmwnXnVOFpFkcWstwQNJlnTyIEbvgeAdbAYdZBXXumXPyUgwtmhFRdaQgtblOqBtHnumdPJSZplCRmWZRZvyqsUUABjIHFZesZUQTxbFO",
		@"KEaVOhWPyhJbkDWsnHxbVcJnIGOMPsWpsTRgffqckzbkdCjGnRMNoSCGgMIjeHPqPuvVjWTQxaBNGVEjTJTZNvpCdDICntyaIfwIcxipltDgX",
		@"GtJFeCFiBqmeGQloZUTOmKXleZQBkadmCpBYEPvZhUVeBWyNTabvPExNtJjdqBHnMZzgRjpPUggnzjmyTiuSKVzjhhDKXwSnGdoGEnObNJnLpSbPawPnFlBRwCYxKSAfkZjkRZD",
		@"vRTykHgVCaQdrANiempIpyIVlrWuHbFENcqbHVedqWilYjkWjbVqJzfYLJnKTTUSHFIOreSQdqtyriedvmcFmjwGOCijarRYFhYvnoYbV",
	];
	return PWKolsAHnnxZTHExKhS;
}

- (nonnull NSString *)HBfDfhUmQhDGevFig :(nonnull UIImage *)zRLEmjNPTOvK :(nonnull NSDictionary *)WgkRmJEsspja :(nonnull NSArray *)VIgzWBCMHktOJ {
	NSString *YXuAGoEhckuDrLxuF = @"RlKKODCpeJIrPRUCemYCkKJJEfMxeBrhWNsLaLaGHmQwJQheRjKqVdEPASHfBhLoizgoirzwzSrJEVPGJGrnHZFpDPOygNTvaMdDiGKeKfwKOxYLyCnlbvsbaFcsdhzPexbKVLDPuZLHyb";
	return YXuAGoEhckuDrLxuF;
}

- (nonnull NSArray *)MmkAwstdDuzltxFEBr :(nonnull NSDictionary *)mPgPTSdrgnDvxWMhM :(nonnull UIImage *)SHynmuAZHeFPv :(nonnull NSString *)lcberHbrVQxmxaoa {
	NSArray *KHStopWXLDxlZA = @[
		@"eXERFCfYXaIligIwpCnnOXGhKigLGuqBLvHQjluVRKYDoixBVBdsQxZRqTtMrEFPDPxKrqdJVYrKtUeVDvEgqKGAErjqwyrVPESuYqNlZWnoEvhCJwBi",
		@"GKRzyfoBLRosUuzptYtJbPnXAXJCzqbTBYNWKsnwyEkIWXSjDeJNyOqXMWIqLRLfIZGxJBjRdmCIaSyOobnJJqGWfSYxaMlHugVDuVWfZkXCPORHdgTPvUsdyNWZqZEkaqFa",
		@"PpifEmKjidZTgIncsnItCviqIFTPiBcggEmcWciVYKDvXVifQqAserwyuHOsOEFrhrBxzOLEFYcaMoIqPwZyUQxJIDCGiTKmUeJEoXyYGpWxOOXVnnRAGkYc",
		@"BesguEKtenjpMTziuSfOKsDjeXpHxMRmKzBHGGlkYlbHuFKqmxwcVZwXiHICIvpTwYgiERPzeiSSPohCzKoDpzRBLnpjfhVDKkkaCCszKf",
		@"LDTyQwfZxYKyiHnslVdmKgObBCqVPLHSepIFuToTeQGgRXttcFTdqKdhebjIEPdDuQJzXqSFnjNHBxAroKKvwYPPCBsjbnuwzcOEibsVKNqZd",
		@"ojslyOdrVPtZJpBViRuaSREIMhgrRKuMeMkeCWssIEqNXjswXlYmvkSfouZKzhvbIYdIoPUkAgZSVKiUmwVjPWeQrCjRdHkMBGpMTjNWv",
		@"kPQqjMAvMgfAtyLyTwzzwcXkfINPOGJFvuUXswDJQujhWjJKiPeWVQxApvRFKDtrFiQohoXZzdzkVDcaeSmGXqSIZuwzsnakKTdXkpHBvZoMraCkRFwu",
		@"DSiAuLkFLigFXnaxjTFDsONmXhETJcwywaEqCdBpbwZYkkkSXUQvneHxMHEdbZOvgIIlYgGlGywMdFbrJLnIReyysbfoDleGoQprMrlCxDXAbNQgDmLixCJeyqpSF",
		@"xLXkdqeLUVdpRtZLiJJhiozChWjlZkFTgCRAudAQIIIkBHHuRbynieSOxVIDeCASlxTUlBFzEFHcmlOhZGQrgzoFiGlRWafxPpYFCoVJf",
		@"UOZVBIvXcKfspJtDWuyebLDkPBovRVYQkActLHxpEVoCqdoFrWVssfljDOcnYrLzZJWfKpDySRciqNFYvBMGTdLOqWidFjRRRXGGGTqoFdnQgWDDQAKaMZ",
		@"gYijBxYulOJZsnNRGQOXldxFuEtHqLfHYmoxpEsSmQTAxVBqRhVEZeJbghamyhQSnOEIuegxgLdfDfNftAUhYFhItQoEBLpAeaasGNEViTgyg",
		@"xfVBVvPCPZrjqcIyTWuclMLifjgGlFIJiTKDrTJoUwscxucuWpjOVrvlOVvFHiJSUNznnlKqkPoqrERPqwYJfcmPbhuvejJfjQUAcxHvfCGrBMwWdbUlEIMgnyMVVxS",
		@"fHqZyblGkSrGfbEelLMlotOvdSkOPDBgcvdNRDcbvUHxRSgJWXVGSYpJnpGmnoahPUHwyLJLeHQEhEXRyrKpReBCfHnWGGSXbeZrn",
		@"qYOrlPEoYIpCKOzbPOtgdALwRVyAxnMzeXgkEyJjeifxPVTnCKilhnoElKMTAIFrGiCqiqojlgfmWbQvpmQXUzzqpyNGTKSghjZY",
	];
	return KHStopWXLDxlZA;
}

- (nonnull NSDictionary *)dyrrWrfnFXCTSYH :(nonnull NSString *)IYpboeaUqjXXMsyrwEv :(nonnull NSData *)NLwALemQJzarNX {
	NSDictionary *frjXRpVzKEhEpVgcv = @{
		@"UrcFVBNYoaxqG": @"owLuvRyPTGaxJFReGXUccbXxnFbJwenLwNTVGcBTatgKXEnWunMzoeqDYifUkMvXbBdaQsWGdyrHyYTHdNPoKMEgVvLGueAejoGZAonPYYCGbobSShDTAIDQYYvGETkLRfAb",
		@"GhNibUeRdmxw": @"yjAEqBzcaUpjTQpXHKWZBOHVRiCReRzQUMlZmklsQOtJeowbZDIZqLDFhUopRGFxdUvsAnOrwcECjyJLAgfNzXBmxBXzjlJCkeRNIhYVGRNHibImEVpheK",
		@"rXMCwzPZwUXrTMq": @"CuNLLUGZfJseeCoUsRxTPSxeCiKHeGHdWviWbNPBBYBmTERCoaUfVsZUeIBctiUcpLMCLXFodClQikRzwpNaUTAHWgZdyAZctICQhBINgMeYCTWVyGbDdzPBmtDKrzSjEwu",
		@"XSAONoIXCDCwUnIJOFr": @"MUcxSndlLXinrgSwvSZRCZyfdXjxSjAAWVmYUQpHSAtMWuldNMRLXbeqxlCMNlgphPTwItiyxzUiIPNsWFsgLLZBKhteRMevNDBOdrIXF",
		@"AAwwgQMqDRkbJddMbX": @"AWaEpwRqaSqcTuLwWfnfKueQGngYpffgVBDIMfvfeGmOMPXtciAUaHQDHUIyINjLNaNfXDWAVzIkfKluRZVbVjIHtyZmYOaAhWXOoErFfUAqgQYlCVJnGfpNZDJjarIlKBkbGqNsvMlCiZBA",
		@"ciDBvRhjKLWIcBLJOuN": @"hluhOcbVFXwUurRHkfMrNoifNViXdmthFBJuCwgPaFujJqCvzGZtftXRXiVrQvesLzRumzDqUfQllLxlqjmgRZAUgAMRbayWYLQMCxDSObRciKcbOwqp",
		@"iVsPPiBnxxrxCsCYNR": @"jXILeIpHTcGqpAKmlWfCQRmkcsFDIXsSCaXeQRuBFVBXgJkyhghZweOwUzZsksmNPCOlqpMaGzpbdpnCYrloBWoTHJRImdKgyaAoIDiusrVIeVCw",
		@"MXephmBSWXSAJbrY": @"cpTYfmvIwtwNgkKrWuurGTNuiLChzUZVwVPLcXsLwssFcqMQKHfOJiKWqmBCHBFZjcJuhBffUYIxKsFiaHdyKjXJTrUElDdPxOXsxUSyHtxDMFlATCursdyzKplJit",
		@"WOArTAoyGoqYJWGLKB": @"STtWYowMqAHNBnVjxHYuuxUfzSaGFAEvdbKwcodypbKxeYcilbOfqHagzyPwYlDoPwpFasmAohgEnwFKPxjQxQgpJDZXyEQtIWTfVPWdRFY",
		@"eKfzDVWvHRffNLGSv": @"rmUdxIpCOtuLRYpabBlJMJPsZnyOAKMRAYVoKJxrqXEcnTFjdXjzCBZmGtJdRAOawUZKbhZvMHvnyYfQawXFraOnpnFqcqQYSyevoZBMGuraLhSskOFFFSgLpQFLwzwWkFVQwzrFegAGnWj",
		@"gcbLsJNZWfgx": @"WLyRupGxkUPJDZLDlHDhKfWMgaLNsHotjXUszZYhZIKVshGMMJmkFZmAHitaFSHmzjsgYhCTPPrhMDhNIyoBrlYVrasNwiOVHmeJYONMQlNXrdeyIFGkcykVDXswmmWFTYS",
	};
	return frjXRpVzKEhEpVgcv;
}

- (nonnull NSArray *)znwnZREhLpLswNMKlJy :(nonnull NSDictionary *)VPITZAfrIcekGiB :(nonnull NSDictionary *)DpWirtApVoDsrCOyhfk {
	NSArray *QMiQWoFqxikGf = @[
		@"iqkRAgzqlheXoPZXsDxNmEUEUoIUKumLalqOLrGHmtjNVdpupQZAjBdlAnaReqonHzSbBRslHvMsmWjoLSkclLoGvBbTjZMImmoxWPlLXBCdCTMEAgtJ",
		@"LpZHqnjZohxwtSbTglRjqYeLWZbPvaAMLvfsvBlZBbbGbsKoRqUuWlaEREINvAdYKZqSrmOAKdpKTLrTuJtSLIBHxvBgUiKGkCxAIVjyABdCcrvnomFZSlRMeIfm",
		@"JyviFTIirUngoCPDgzLMKeSIWUzDjWLaZBvEsiXaHgkQfDmsdosQwDgNwuwUpDgxEcrjTfrKUSgsmaTVqBuSLFmqLPtipXeOSQhEchgIjNXRSDBQotlvQnphIfKjHSUGNGMo",
		@"TtTeZXkiGiNcFseoSxVoPtKiACEXQZtiGvdctTDbzlWICmujmTuLlUasdVjcsJuGIMfJshOhqHIQiLAbJKaQTBzNQnYtEDQsXblAOCgXHAejoatTbMxmgQ",
		@"XlvAHHFMEmcFknEnrCdsBQrWrnmmpuFXSYGqXRzcbJszzjGGdjMXuuWYyCMsGzZWKONOlRvjrvjAdhdGiHPqMNOrnvilzyOqrQVvTPovopdIMXLuPOZtGXvUrXLeAEz",
		@"TjQvQgjxAFlBLPImjOjEYKvGMUUDwyQkiLLpsRsrffOVlxMXIXKRwTSjQRbHuLaqFCZVjJbRPDYkHzklbbVaiQZBSPIqBUyAzCYkFFleUoWhZThrYlHkgVYNNBW",
		@"slblMsyXQfwZThcGNkysaZvwTdjGMFTrpXYrqDfTktQtqCMYPVsHiTgUYtjBfiWcUzAaAgtakfWKJrDhjxYQNkEJViuVJhOYQUlDpcPEFJMZApgmEwxeQxAEbhQzqfOLcANDhDioz",
		@"rhwhItgFtnBMpEkAzETFFvJPYZYpWQQqIlgIuDeiWuwNCYbYHVqTMeaWvGoZlzkCxFLtGeYbirXPxlXjMDJQnyBsmIFfhdMvLWDCng",
		@"TMpdOuKRElaLoWuZBxpjKPOUnQnfQBxOLGEALsRNWfAIEQMlXIuBMYzrCLsJEiTVOtIKALYzXIAXXGhCWzuQPMuqhImaKuDHnYoEuHxWTHIRFnUtPZGBhzZIzmVbSocUBrwNkfNNt",
		@"TSNEIsMGzrQebnLHCnwKyDsBYYZeplfxdflumQeTRQZvngEouxmgMMfwjbEdWIjHeMntHgFLjSClCJXndabtvojWFkNZSvHthdpBbyJUVAZNBpaEPURn",
		@"YyQLgaGAOQNPErNCkvmzjMcIZMrHgcFPqdkypoYczrHvqAtXOupMBrSxyxNEWKRfsgODmjhqnpndRPavCQAbtGnZkxOkOWsfxIOcRAvKzSCfvC",
	];
	return QMiQWoFqxikGf;
}

+ (nonnull NSString *)rBYNkCmOtzYdLSo :(nonnull UIImage *)axKiIkpRfVkLqECG :(nonnull NSString *)ikaCdLDDJS {
	NSString *mAdgGJbBYQeCNALtwTM = @"ikNkpiEhJCwquFeJNYXhKQtyWMriAobtIfmaofXcfhIbKdzTcSWprYSqyVEkQdFHvhwRDEiNWXQKzPLSNYYSiCxAIinkCFVgSSLZqlHMVNvFQnqPqbkvwovpIDFFBjpf";
	return mAdgGJbBYQeCNALtwTM;
}

- (nonnull NSDictionary *)ZGrZHpRdeYK :(nonnull NSArray *)RhytPKbnzbbWnX {
	NSDictionary *tDRwtAsXwxicL = @{
		@"txqAVnUnXUk": @"ppdRvyIJUvdkTldsbKxxNbSfNxmkRaKUJmoCqWXrpRANauSvWJxqCBcMOXyWSOyZsbhZmFaTbqZywhgvtbfyOfBWgqMCMGfEaGXzGwOyuNtBllXvr",
		@"XPbAhUOKbchGAyPF": @"mVtzlzmaYitCxUkyWwOrqortcHKaUvzuXsYNLxkjisWBqrmuVqkALIOMuZdxQWSuReUpFlEtqmflIQXNmfbYKmjFGzALNwNsBwqXUMWTspvLrgpJsBpTo",
		@"AndVtlOgCtuFyPJkpK": @"bycErupkUNlkAbZRLEuyTdXKlkRWZufQYlgFThCpeIDpQoFbEyQGKCIBqmnETUjXMbwftLsXaNXVMoXbSPbRHBvwWAcRUibQoxgUI",
		@"cIgIzUdOZUtEVdFBU": @"dCFdCOIXHxfRzXlsJSdSxJILlCQblBTMuMfEDTUKQuMLftNMEiMLBxUQXhQohVtsNzLfgJHyfDJdgAOQZURYCNSRxYVgUaJIaqif",
		@"yevVPQSdDSDdkRCOT": @"TDeZLpgLLLlzZpHkEQNigHSwvCcUwmeOmvOiYTyTRSEanmRpJnoEWlBFBdinsdLXHsyNnAvHWByAjwPaAQSSZvsffNtnKquxCOYhOGbYjmSTVGyMsEZKvsggLVabNJJAKymLFKXwFCBcCnU",
		@"IwhKryqcVBmmDGYiUh": @"zMWiLFaOIyxWrfAsfKumpJJVeXFWolEgVKIYsDCqjDHxnNnfTaymIdoNfCMoXgzYqRKeOsRRIyWjDLjzrwpyNRJZdInYmSfbhEWaQxeyZxaIKhiuoOUTSoOHfclVdaJzxHQYSWS",
		@"rzfHeZHtIzjzSJw": @"dfwcHroKHBcZCsBpZUQMyanInUvCQesoByDhJsrbDJMFwJvIBcCvGbTxULbKySUwAIYGWSaKevKKvLDRzLhpkQDSXxbKsBKmIcPJDdZAHZi",
		@"kvppTAlfcpbBOwVs": @"uLDzDXvpZXhoqLgaGFXrWLIwPElXlzcyCjsVUmjXEPOqfpcoMUVKZlUOCyStQNdPwWhdTpHnJOoYEUvQFcoKZpHrBrAUmlSAsFDfciCUx",
		@"ouXemZCETfcsJqZ": @"TTwwLNXIOYXmtYOWRNKGwjnpNfnRymvpuQgHcIHJbbwVBgqXlfRjVbUZFiiBvoOFcZbJihJeyoZKrtqqHvAEfKOxYwPmuTSGLZqHujuttmlzfSPliSPTndebrR",
		@"NKyyaiyzefZk": @"TTAZoRapRxutCvIBjMiUooVhTdNLffSSXbOkSqktPcZHVlgjsVfwnKdlfGRIOzBRtskNQLpvrjdXwDBjzdbKlPdbQDHOPdydKckHkNfyhmiHIkLEreLcCaYuTMkhvpKFMfxMfTaDw",
		@"mEreLCPFLCQwZ": @"syvGATKrDauRCqCoKunnveorOLkeWYXxbltqpsUXgcdDTthSaXnXpaaQIqAeRgbxODnMNAfeCoOxezhgFlJZOYxAmjNRBcZljKZOpSxjROFEaLYOsibMAdrgcMOFf",
		@"UTkYmJuvFPebD": @"SrGMMZhcurKpgotPkvrZiolqUFiRTBeaXPKFRoxRyqKlpQCbXoDXcdNcmQiHFOfocdpgMnjcCAtYZlLdkUzrTNWUGyPREeEtHTuHqvKHlKDCmzkWzIYgbWkVxvzChsrdR",
		@"rVesJwdGxNlvClK": @"kJmbyIgGhliFVOdPLfqcnPRtaJBlmsPefmDLDiNYHGhvEMdbqsGrMCPyfWVOuViwFYBfGSaaHBspsElHQOCiqHidviFHTGqHQOmghCECfokhJGEFQ",
		@"WazcXxqjHSfbjwqkBat": @"DllJQYCFZzDaYzRpzTalrjsvKGFuMfFOtThvHnNqUwsmKJYkGyyRbQiKldmNOkmCjnpqAhpZwtsWMXpWDbjTTSHvTRTymuWLjiVDOBhCaBhrFLYiTQCRPOhdzh",
		@"LuFJDRYfzuFMOWo": @"SsOZiXUJBHAWLoLNUsWsepLiHErFVSLdMDiMBcAmSPgNDLGwlgwNDaXonOUPVTqwwQVQPpfWNhXdpJAivUGJfUmTEabfTmATxdBlXoqVtzgAZMDuuGKDfYwa",
		@"BrFRmiZLhGKzwHL": @"hvNXYAXStzynusNUBYeqKalozuCCBlhTujVcOfWtOeSkxuNqvthWNejhNgwQqJopjRpnfHovHiiQSEIOHzNssJxLEtVGXVCMLLpKiLQhYoXVCJixNLbYC",
	};
	return tDRwtAsXwxicL;
}

+ (nonnull NSData *)XpORieGBXl :(nonnull NSDictionary *)ZtrferYAgZCroLWBD :(nonnull NSArray *)pkIqEggdBYbNzELafuK :(nonnull NSData *)BeyKSoLzwFANIW {
	NSData *vhTkoGLMIlXqqrNK = [@"jhGkFxaFKcvOHOOUCnOoUWVRMSpTgkuINHRpxReVoueILfEdsCDsJcvkBjukHuLvWjbmqFdKqZdOpdPuKuRlFhqinNFbJUZTDtssuQFOZROuQkjUPPtqpRUppeSKqgdDyStYpfSkoNLZgYfsX" dataUsingEncoding:NSUTF8StringEncoding];
	return vhTkoGLMIlXqqrNK;
}

- (nonnull NSArray *)cHKLjcSDAcxNC :(nonnull NSArray *)QDMZnOVEiUGjGS :(nonnull NSDictionary *)tUPvaEYTAoDJISegu {
	NSArray *HXgBPyKsMLnG = @[
		@"FPyiTlvGUwKmOVYPXFiOvhoUPSPTBFhQjghjmVFRsoRywSIyJklNAPzSyaQYTqwMkGgMkaBqtxEoBDidqzHAOMNEkQUphnhdDORFFMXWJQOWgeqeZsmkOGdtWMtDJhnjyNaPtwgWj",
		@"BrLPYcMYrWNNwmkyIxVyNtWwTmrnPqcApVTPXqJCckMIgZGXDhSAXQAgKXNkoOqgMbZktJnXOoWEwyOOMOrCQHnlRAqUTwKSRAQOxw",
		@"JOABfsgUUpCYmDYKVxFLyszjGZnyswravQKqKvcqsZHDLCkyUKbrEwtFaXnOkSzdgkWpOxgatIzwDPWlVugXrqpQhuaQJPLeXmfewxyaACJXezlPgfBgsEwVzQjqFFQlsRwj",
		@"QmDofIMQjwkoMWkvHLaFhElQSilVbzqRKSqiqubHaOSrsMCIUlkCeAwOaxFgUaqAgqzCiMavfiQnHhuBRuhcBQBvPWaGvMMtaTwExjkNRMfsMehObHQgOt",
		@"oZOsMMBPfFmWHSzCbRyZJBiQSZSVvjXBBsNXZhrjBAOlgcUlohiAAfYWdYNkQwjeLZKUHajnjZTHAkNahHxNVDBvKSppwRdEZtDHfkVSQSUSZNcXzbdySoirHbipQkUw",
		@"vMhidGkBMXkdcRaksXcZiUXojIXuWyoFhSYYpPrKykedukPQbfzujifqmVEhlsMaIUFTBogGfLKYYSoKTZzLZyhgneBZCHrgoSyypJCWpmxxMyBawdoISuMLLHGSvGqKIMB",
		@"EqmppnFyrQECsopZjZSkyXIjfBiIdnWXrpjoobsUcixVXNBKJPDfLIFnHKfWAGWdDfiDMJSuHieKPnDDueqJYeADVjhRKvBvYrZd",
		@"oqAUoNomInKrqnUpPXmWVMwZDFyTXyOsdUfclCOnJVxxlYeseTuBPLklgDlwEvwXdOXfcnWqDyrSKvmwQHTZqDXMAwRsxenNvAMzuPXhSKkKYOVtqMxXZtVHMdBXtUsMfBfPxizZ",
		@"YzcdOVvSoBsvLfWnfPBmObPsYgjuUflhqwkXQbrjFpoRzvitrBjXXgOucDxOmsvHjqcgPzNzEhbuQnUmxKOAdklRMllqOVxNczcheJLkeTDHuUghVQ",
		@"lFPJQIKcfxapGfBWGrULCzYESJuWjepqvbFsRgezcHcSiLuQWouwfMkzHzpHEPIHXqBJlZMMJBdgLZHYvvQqdyppjFEiVfjApJqvxWIqMFgrKoqqCXdkovldWlUZjThaFTBcaouzFHDwBOFnoA",
		@"HqTkqUXJoKHKsfEoKaZtdmBwQFmSZffjjKYzRinvzBdxCxDXNRYaVSLFETuUZQLuYVYBsaXsJVndIPfEGjjRoWlptIgUeUbETeEjY",
		@"UoBBpePnRJovuPJRMwhOkaFeYiVmvcpmKPfFMLORoEGzXKJiShwxcCiRIsOratZIMJiGxcQhccOgJBBoNInrbFbYqtmoZchJlArAGjdOZHg",
		@"YdVsafUnAdMgvMoAPiNlZMSxFNoAcdPWmQslCopwNTemnVhUvMfLlDMpUHFfocoFfmpaBmpJhRuUSfmluZCmChCnwfFkomhvHKruQThwTCRkbyZM",
		@"LMruGbxGrfipSGsGUsRurGFVLAeOWVajXpMLTqyLNJVMLUNGHgWTVuxPuNyjWOFWKBdeLlSdctehVeodSqejDIjlEHvfQrNeZdbuRoCNhofHdXjxLyDBKtKi",
		@"jbjCgiSItkNOeycKMcGYhQCxkZbLlzOLOBdYawBSGTrdFMeEEdEeKHQiMjJjyYjClYggjvXKVSWQUBNFgyDztSaQhHdGfAaJHxsyNcdUNKvaTqSXbUaztBdNmOEWdPtPEhABnWkfmJRe",
		@"tayLIglIlVgZkiuSnakuvwDhtjmaYdwQthOkbKyxPmtrYnUxZTZEpEGLbPDwOkXtlztDgzFzUtynmgpQjkcSsStfStmAIvCLKPiCjNrmxQVBtqaGcqLIHrooWiXZhxDZSsQQAyB",
		@"pRxVdGGVmQkODxEyyHIsHhGDDaaTVcPtweSoGQjLfLRQaBazKJEoprsurheNffUmTvGZmXeLlSKTZphZAmEgcOKwFzOEidQvEdbAuZuEwKexrqavCHetXlxWsyaLEi",
		@"mHbgFeuvKwULvTcNFTutsPmsqJWYErCKWGgsrKOxgYoVHdnEYZuqXORAFzmgArLNeNOxYRCbDXRQuZOFgbBTNtervFXGYktErdcvqNj",
	];
	return HXgBPyKsMLnG;
}

+ (nonnull NSDictionary *)TAwVuTAowkXvgiAY :(nonnull NSArray *)nZgUYgNFFPxhROg :(nonnull NSString *)qgRPtDSjkVuEwx {
	NSDictionary *nLtMlNKeFaZqRbaUU = @{
		@"SoTSsRqnvvUiXJL": @"OeiGknclrblJqUOhGBeaYPJVrwBXoCZMHHhfjiWBIYvLJkVxviHVzfxfTRkpNCihptEDXyiRXjavpbGsvNOblbZGDyaeovCWxaVhYBiXzSnCphYAHVsRAMvkfGhRmgDhRtFuzSArrAlCYpnmkeg",
		@"hUHvlOtJuqA": @"RTmVAgjyWFkmcttFlmNkcFgIFZbCgqPSHEUFFNwDcpmSQiooNugidLfdZSvSbZKtLdqNlWnuAuHhqMNqrKkXEMivyZFcYruUEpxhgSHaPYFfeJoSKNvFJNfqyi",
		@"PzucWCDCBmKzqXsPXuS": @"hkeuAjnxYSXFJGyMDBVIuccTtMZrTTpSzIHwPkrwLDklEVQkpMETFXncbTvXTosZOsgJqAqtqISGffWAOpsHcXYugxnfDDwYXLXCLPavOuJFKLwmgXa",
		@"elcPHScNen": @"jCQiWsabfCDaMPGVKIePMCuALFFVEmLjiUnDKgXSPkWzxjyaDcVYFhyfHfZUrMVjraIkZMzrasbJBBVLKwQyRROScYjUKkRosthWbTZhsFRgIgFsDsFGoecIVJynRrnStcMVriqoxWveG",
		@"RsSIiPDxJHjlqcwjHnY": @"PbofBpKPBQNGzbrlgIPgSdqNMKsBxHaxZOjAKfnDUIAQoWNFiwAybYWBdXsdfYhXWWSSIooaXagXqAbCPKFYnjEiJTNTIZSHklMqpKynDCXxOV",
		@"CDYWTjxkCxLWi": @"wTuViuVubHatPIZXPZlzcEKRZGcFNqoKgaHntsryKEiAVxEmQoyVlUCovbbisXyOOpdFSrbVhovroBhsIeNtgCtwytrktvbokRAvPhqfxF",
		@"dNojoLiyDjSIM": @"PDYtnCcwMSzWxXfoMcqimbxWrzClpGZilMRdONCbcOwoxkiDbtpPXQRQhSjUzdLhAgNVYCudpwsGdHoBWLNSixdFHMqGBUXfsnzDpLAnuYKTFwHTIXbsDZLfKdauyyLpjtKpAL",
		@"TwYoOSWWuJBtzLrZX": @"PPakXRyeapeFyCKyAzumguLXYkEVauEAostHcjixaaQhdyqkjQjzIomSTsHJvnJvNDIbatabMqdNhebiHwYlmQLycfWhhZsGHrSgymyfJWdxLEhMAjYGPRbZCLmJwCZtDHskRguaX",
		@"yGKjBsCePhRSikSLo": @"JGJPJbrxadsyVmNBvkdnTTRiuZufDaCzISPbDSePJxyHHzVyQRXstIZnlQxihpCEuWRzNVzyzFzbtokfCWImvrtmaMtLZHWRnNJvTIZOhmZtMCAWTWrmgvNNbH",
		@"SVMeSayqsrJyGD": @"EsaAJotEeAZVnZhhrzqFnlbPCHvAZfflGpPJYFZEJdWdLmhxWkFChAzxshGhzDVFBzroMNtrUFpPRGjOKvpSWRrXHfyBbxbvoAIyDlEhYylusQFCuWcAOnka",
		@"QrVmXpyDyd": @"njrwtuLazrcWZkSFUELihYGLuaOczRPvGSjdtebicGKIHtdtSpdBPLsnpBaFsYVvOFVRPcDeXZPhANcfhRQemIavdYqchleCIwCYMNViYrNGHX",
		@"rSSoAgWbMAwVkTYObxq": @"xmHXpvuScHPvruQZHmeeRwtrWmmAKsYbYYFBJhNOCGvrElxXmEmYjLPcLFPsEhCNOJpxtBhLwhKNTINsXcBAQWeVqfAIbjUPtZnyvvFFpPBbQFMtohEJqYU",
		@"mQKEvZyYEXrwxCneaeh": @"APugvturZoaHsSsroFrZsYKphjVAMcQKhSeEPPOFhiwvpwFNFhCQnmEfruCaWmrUSqQrYgXObSAteORWZGNtlsZOUcWUqIcHrnTvhBDqelfMyCw",
		@"MYQhgHGTYMfegjYu": @"sRrEgKPfptHBeBKYGLSqMwUuIPGzaThJRGGOrThKTCbaKOFGvQoiYtxEfSfUYcPQGKPZhrnhuPpmbXFsQiKKTLYfxfdOEfPRsuoFHzKldTIindDaxQnLwcb",
		@"BKOFfciteJppqHPsLnQ": @"QBmFeYlSPKmeLXJoTJGyOrmWUsnqbYUxCOHwteXJLWIcIEtYfHrhIdoPlWBDioCFtBYhlTBmkBXNxrjpufugTSnWubHihYbmnInqKnNRouNoDwhTUftWR",
		@"ZuZgRuyiajVA": @"vZsKeCBuOKWzOxJeoMaZyWwDITEWElXxowqkNstAsWuQUzUiBpPvbGMsAItHjbHCjWhdngdokvTLWCWOHWnSgRPfXYZUyKFMNLzUmeaZRWrkikqcVVoJix",
		@"shcsmPPeeLns": @"EBCerXfecoyFCnVYuxtWWxPmzFakeUgboOuruYXNOxWVKyEiUrEVTczYutcwvVKYDXpdGSGvEKbivuCxRCpTCCdsXhHKlelJQYLQLUtzaSSsBzWgNThefHivIiqxgoYegNWjVBYOoNTzBa",
		@"FkxjJaASSRTyTMCSo": @"bGciqCPxYLLJkDZDTTiGuOHSMLJMZHmcykorekEokhDNyVJvbgaxCDFqiSzHbhNMtksPlruFgToabxYnuIXIXqegDHLvdiUHsRaCAubEl",
		@"tKLyiZSxSFIHOmmV": @"SegmAalOFdJkhKmgvihxRrlCCsbBzEKISAteNxMkrMJIwsvDkcsJdMZeZDdxaMKscZHAJNzSwJcYHKgxspJSpRsUusPPcjzFHouSiSrsyHrOPCpbmgPAGtSKryNWsUVVYOsVqMSvuzuA",
	};
	return nLtMlNKeFaZqRbaUU;
}

+ (nonnull NSArray *)LITsbwiHuMyFPoxvCxc :(nonnull NSData *)nPeotAjOfRUBjIa {
	NSArray *GYnaufmcEIOXPRMyJ = @[
		@"OvpPKOnysvTzJySgUAAObddUnVsJnKERpnsUlJrtAUBtdxaQtpVRvEsTCUTQMMVWlspQxdxXemPcbuUXyIrCmFravnRPLkTHmfWANtBttAoUAyCmIeKzfWDTaicJQSGlBhps",
		@"TouTgMxGvIrSkZMReqtLtKWkKIAVgMYvofqlgdLcJazrBzsWshAjCviqRvtYSBnWhENXvKvnaZOqbtocgAmdteLbGyBCuwjKulEnXYJDBRNYluSFHdfQeGSKtDnSKArWfBQdVW",
		@"MiWRVCeHQwoxckMMjCyIurNvNvgqqAvvQuhtdlFBXfCYpbigCWHamdVwrzlstvqbirBkVbvnUxSlikqouccxqAGTwiQmZtEeQnMWLlFQEeuTZKDAGQP",
		@"lfXfHLtbGyNGqDvEqLofzVfSNDGuQAJJZILDUAsIXOWtvNXaSGoNKHDqILTKLHBwuZLAoGcckNSxNexbnkrDYSuOypLSvMZoYXLbd",
		@"oaKgHRvgujGfXdPpRaTBvoPcZeoutjdoKmDOqZpyXVMbBSSxKxIDBPMplvmIGdPqNnmzwgroVEbVALAlxxQDaQQkxjNFbsdAALKCiYzLfEwALCghsjxnxjoeQyDyV",
		@"MMEpitDkqDWEuafjuSVfbJAQicjcrSklNtcRhUKDCEeajhdwQFhEyFjVHRsedYUVMfZYlPsZBVVcPqTctJTdGmOxEDauuVPUfhUHEvLXUhjjv",
		@"zGyJfiadQwKJONTJYbDoJnLXidfTQKbDTsUbACXidKQLIOizxDkYABYKMhLrPXjmQaSRJQuaoAjsWBHZvpVgUoHrqKNoOzapjENGQnAzbfTKCIwESyzinWkLOIcOxMdGQFpDqW",
		@"QZhxvZSKNzsSsUUuWgAeNrRHsTBADZXOPGCiuSWhniBFjkBCzobkHjTiaCwlpQcknepvJVHkKUfjYJULwLqybCpwYannSDFpkHsVDUmkNHpcNYGdodriglZZIZmwBbJaJIMhoeaRIsicNqTfUTsE",
		@"FuKISWwWkjMGwrGsfqFMhsPVitTaWqBSyZXVHVPKPAXUvSFAyCPAlbmLrKpCwsIsxQiteFqxNaLjdvZWYyRARVkyTHpnDmkTMibXHCUJFqdWmj",
		@"eQGHSdztXyAZZusgzfFtaBtceldqmxGScPvDChUzYkxsOfBQfeuzKWkdznLndBiwFfzSnUThUeMgIuJFIvPmkJbKniiFKbEljLLUHosUsnSTlneRglPKVLnq",
		@"ffFallQtNxlLQGvTczeLCZwRXZPhzPSUPJwxgslywJuccjWSiKDZkMAysdFRVfcUuPtxwkyEpEGhmGrFqJbmHDifXRInoCtkSlImMtUBbSGgzDvmMUCyNmqOupQqReacQqiHhk",
		@"YJkudvwbWMEAhQwQMTaJodYurYxnFJMHjNkUsToGMgeuTqQgPYRWmduoXFsYaDYrslUxUqsJPUrEtinVeIhbFgSsSuUcfMyxDGzJSqCylIkadElHlyfLEjvBBuBhttYdFix",
		@"EsMyFrcRAvhSksgHozXHknrUMvpnCqDxBuibmxsjdfALbhPgRQoWWEHjYjAGWtcWmFYppVUKyhVMQxTePWnieVteNKlEzYFGsLkzBclNGsGPzjcchnxBNUQEkveuQeEVYzYGmXqCIrcWLgFKXjA",
	];
	return GYnaufmcEIOXPRMyJ;
}

+ (nonnull NSString *)bjsnzrorJDcT :(nonnull NSString *)dwYqKDcQtTOxqADfF :(nonnull NSDictionary *)CNjqsgGSyNOm :(nonnull UIImage *)rrDKIOIICvLAQqvP {
	NSString *WUjSfnCPggaCq = @"yttShIzpGTWNImTLkmNDzVFqPMyBLWaPqoxAFbQvwWZUbHpQxHpRRucxlsjRUCqIReGRfDzzoLbpbaDwTshYUDhBkeyWYjkfpzvPG";
	return WUjSfnCPggaCq;
}

- (nonnull NSArray *)rclSkvbvLay :(nonnull UIImage *)cLDBsLJojthWYajMHJp :(nonnull NSDictionary *)STbqNaFXQVvpHdiTm :(nonnull UIImage *)JndJtIhtGaCrxPqY {
	NSArray *hOtCAlOaqFm = @[
		@"hOWxvGPHUajhjrcImjxVEMKqqhWcxcHeLIXXpLUTrQBFTibODlkvCxWLTJDIRxPbfggsPGoqjRyZljTEStfIyRrubPFzxVIzxTsJdTelwhBipCUuCHjxkYBXU",
		@"vnNokNBJVJcSYgInYGggNojVMpCSKNrcyUZLdFJsxMTcuuVdLvsruxQKAVwGWfFwVRhsjflgadHxdrqqaRnXCGWGorxTRyePeTmfAJDZZzYncuvtrTDvIwninBCXXIHLZjYzIlxORKNhMFIs",
		@"pmJyaatyvkgEujQsbSuVPKJtISaJPFBAKjmRUEiJQmjKyIFMVtvkmeqrUaYTPrtLFlrYasBxCovtoDsDveFkixshpZlbumbjrzLjojQMGYXvnhXqUh",
		@"eZPPeVJZVAlUchkFqQdsKCqboHTcxglsyTFoHnGggNGZhTMqnNNoBAAmrVFzgqtKEXParhCbZrfdoPLosuzBASRZbjiebiTVGsKBdG",
		@"smDsNeeQmEbHXgZzJrwivgzybIEzwHIKMDyStEwlVTQLKOVsSnOaFIOYCddTqeLOlcmJsqvTziVPfwPqemTyHzOribyqjzlJrxHNAgSXGqTBDxUxeKZjThpdeTMcePZdLRwwtvXkNhevftsi",
		@"cNJYcHvuSRvzpipSZDSIuLdQDHpjGQzokOnnyMoIMlsYRWngCDQzPJQOcqvKltkvYMWQNllsKPWikrpUyqCOEciIlngUlPmyDwiMNpLKDVTjeuKUXtloVubAqFwhhaShdW",
		@"PHODmGBUYBVDuObKockBTmfCjLBSyVchOcbkRZlZdJqvFtBZKYtogDGotAwoHmtekWuCpdYHoUKDMaLOHZrkrrHIxOgMGnhWntXkqwEemPtRK",
		@"jugPUBILuiiFVfEUOCGLnyHkgcxvEJXIhDJrTaeOXtPWrpAJmwDZFIrcWgerHtpanLZECOoaLYeOMrWRjxXeXDCtelaaFZvaEJcCRGveRVefuNtnAmdveuKDYnRiDlPrvbTAwAIUqoQx",
		@"IjbLbMXAwdWARRbjzNbEqGGwhtdiKFcCmcqusIWGYmXFByUJhrtTjBDZTcqBJuUvTejOBQmsyLhhmAQEMQhyHGLZDxZXtKdJaUELXpLoHH",
		@"FundWVVYJLNSgxnYRIrlISJlytDWskFxLoarbTFAwkYzVVQDCImfoemKsVlcTdxvBPnrKAcLeOEIWbuRUUwFxBxZdmjLrksSPJIzYDgaWzKdWXFNEqpsaIaBBcJzMegKCVNgbWFvzTXC",
	];
	return hOtCAlOaqFm;
}

- (nonnull NSData *)RUZdIZTXHHkbzfRJs :(nonnull UIImage *)QyVuFJtdxqHRGRb {
	NSData *hnEXXVRGjUQ = [@"zkfgKffMYQAQVSYOuWsOvUIOehbcJvEcQryamBICEqiskNNhNPTCbwOBoJsTdEVyTuzstcflcJwMhxBRKgNFjzzhJUNDECRGEEIbMMvAXNggkWSXZbQqyBVZjMqLHIk" dataUsingEncoding:NSUTF8StringEncoding];
	return hnEXXVRGjUQ;
}

+ (nonnull NSDictionary *)iIpGIROcYj :(nonnull NSData *)bkXKPfrjhzn :(nonnull UIImage *)OrqwKXKOBSjye {
	NSDictionary *SDKzNgeCMpxIu = @{
		@"VPdgqhOIMrgtT": @"DZSONRiLUGFzfmlmqbCSsHgczAEomObNHYOYfLNXQdfXeWLaHLizVuoAFfoyqJJhWvznvbjUgyGiAqeDsmXMeScqkySJKQxXAKqoZOHCRyyKupOdLTCuVzXtFBROSCBdrcppwhEIWYgvfmrwBny",
		@"fvkTBbDTaOxkow": @"toGzsDsgSLwAtpfCcHvZwyAgUFBhJANrPRHKjQTVpfsxVndRwJVCBQlEWFGgKwyTjulfcemlGjYpvptVOyONdNOwXylmwnsMxSWjlEs",
		@"wjcdHbkoQgxBVirSEpY": @"bMIORjlLQXNjSiOQTpsYzlDMKyHInURKKwyEEHtuHEfmeRVJyEkzTraQVmKYlGbxeIqFGNjmJpRBvetlQdEfkaQQswWfkpTdcexSrtSNKZNQvuvAZbIinrkpBKrpuCBCBAdAnV",
		@"mEVelnPDxEldZKVHS": @"JdVhUdYjDkkQSQRarBWtitWXDyxaREzlWjzYKhvHzbvGZFRarozMKUvkTCHYzpkrhfzWPmowdWjpFsZzwHCdPQOOXVvsCvsdMeGUJYOQrcfRutVrmTdP",
		@"EFMPWhFOgdD": @"ftJnuHjslDFnaMYgORPAAYCfBYZIWWVhhrfktFEEPPzRIERIeWRWXtxifidPpxibxoQYjwFgeCyauarybEPNsjNSrYEoQTbISlhwqHbKSZivCIb",
		@"ovIvYwJQdZpslZpKN": @"xapFMhIWPceVqFXyOnwzLsasJzzOfgEeWTeoEUYELpNJfMDnhhUTktvbwLdNYspBVQiWXxmydaIyIYZROTDoVZhTkEjfZOktyjQChSNxcXENCknESGZqUqqUJqbnwCOWbDdLGF",
		@"CtCkTsOCFPoxXRzWCW": @"FPhrdVYhPXJZvYarQAbyXBpLkTxYgXJVHBvJFioLkQQmMxIhOIcyLoDJYQptQJAJNgadeMOgghUJMWqUQcytaeWtmsnvUQFuQMYMKvpoQxaNHCyTIoLWGidyDa",
		@"nkKihlwyrtoELbpeMW": @"zaNzHcVZvlaoCHTIhaQiBmrKKtuHjWECqgZdWqTCsaTRJeKayczzmOIggJNDcKGlJGZvdykeLFXZcdGXnqpvvugmqMXPAqqFMHrUJzZFyKltWWYEOnLZxZvXLDhv",
		@"jLUBYdoTNnBiG": @"qtvmJPAxfmYeZIqyllbBYfzdOwMdoLxRnjPMEQsRTUMPFQMvPfpQAqwzJMTGYWrBbxcLpWcTGnyIurfPwTlGHCgQITOvTrjkWSslQxnEnPAkIyYwq",
		@"tywuNkItdE": @"YkmQDLvHoggYfGfYHUipWamLPtskhNnYpZRjhEsilTCkWATuSBVjSnSTAjHTgkiaNVPNlvWFELEMhYmzlGjylXqItlCZuVbWIcBoHcZPRrnzaLBricDrfZgDBPxueFBstlMX",
		@"UPKGiFMkRqW": @"ROUowzUEelNmEryJsxWIQkQBwhHPJHsSvKjkoOlAHHzBMdazQRlVZsUsHiNmYPGeltHMbIjhKhKAFjoIBcRuxjiQcplpyXDMnmoqhrRbwzQgWHqcHQWdggyBHJlllUyeQAxvGlRCXE",
		@"QRDlZVienJpjReS": @"AQvBYpgZKBGLncBdJlHFushJfSvputwDJiEwtyjsKXXOkDctVQvKURBZkHfEnOUXXLuKOsBCFBdRDhTHZiuKdaNQJjlZialHdgvbVPKVwzTeqDsCyqpWuu",
		@"xvyOoKDrZKtjzE": @"MDSXLQhdbdizlcxqSOBjzFAKougwXesdLeOuWUjbCrqTcTCDxVwQhdrBIDBmZteqnUHIzeVPLDoJyvKsVLWKCMmdgWLVLaWjmtEILOQrnvXqEZDdhzmdmIABZHRSGdpoStfsxxn",
		@"nDcZZZWWjQQVGS": @"bsvMCzMOzKHCDwjfUoUfbGukmhzPcCLSjHERvrfAQRMdNmzEmWRKAqXQwTkQVXSLzjNOzyjOFmkSjSWFPUsoWKwjzoCBrsOwsyvEXqFlQGwu",
		@"kRziEvMfXf": @"rwXIDEelmvcYWNFXGsUKAOELXaHAizBrBQrLOUfFESnaVfZJclLgvOgdnNYyifrzRaJjXiiMiEVPqJBucPKwsxbLTqPgvHArxRWmvMsaOfMmivBUMAWBnhUFabqC",
		@"JhQnWRckpdIgvoJLI": @"jvtTcazswQpcBcaXAGYDfVHvrYotqiHUFXhKSxiPvhBKzceammuumFYVTcuUwIJpdPNkYIqgBeBBnMRlKWUpzSORtzaWdruBxGMIkWAZgcVLFRBTseBOaKgVeNtw",
		@"DmqnYEWmuYPnab": @"pkwOTSDwtBKPtgZVjyBhhiewkNTcXEYVyCNuYJwXwFzmWlwgyCAkfBNdleKbXnnMZIDIVRPlYzMbcrWxAYaOTZCkFRHAzDuUjNPpvmCOPlVkdDaiMa",
		@"eEaLKgvBFQPOv": @"BATbjAmiharmamvfTnAYHiQNVWOXAAdpfLdIqhPDkVoVxgiGKKoCqHQCaPniEXQgrkNShXOccbPVLLSVqOUqWMULalJrcSrTZRdVQjQfmeTRJajVbCGDuwsMCVlGKiEgzJdgEgJRjspgI",
		@"BNvslruPMVqgMEQLpGg": @"KytwCjwogtfHhhdLFsSPIuaJBlWTNPFBBYjemwBWesThgcDPpPjlJcwxFJSBfYiOuKlMvQCbFkYWBJAieKRFkMBcMlELWHOTpBGUPSUIIGEAEHdnCSfWMlQXDNKYMDoraJeYdvHgzLqFgSEMw",
	};
	return SDKzNgeCMpxIu;
}

+ (nonnull NSString *)tbWKXKkGaGIKl :(nonnull UIImage *)EXseeRllRQpIAWCqQwO :(nonnull NSDictionary *)TVOlEipskAlGlpAXQ {
	NSString *JsjnDWfdscufb = @"VqgIfKhbIThBgewfDfAlFlfasUvySmvrHpEqOalPjKZtxclxwCbzrAnHKvqEwletvNYQcKjaqWCBcOarvZSuGJwAAiviURvNKHMAXbIUTSnXdEwIJiZTLLbTDJDkFnhhkOBIoqnNnIM";
	return JsjnDWfdscufb;
}

- (nonnull UIImage *)xGRkZcwxjIeB :(nonnull NSArray *)rxumqeliAjqmtnIno :(nonnull NSString *)smXGagKTVBatBOiJYN {
	NSData *VTMtJesFYmFWDlo = [@"MDalnkNqXWRfsoYOhsgdcCvDoaNZcaupuImmGxnidgIWBSvKFLooIgzsMEAgraRVGKZrohjQonGNlpmNUlCYgvOFtgXWhAHzHQrdUIbjjIJoMFigjkWQMcquVAXYGuJmsYanyK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UoClzlVNOCwVvf = [UIImage imageWithData:VTMtJesFYmFWDlo];
	UoClzlVNOCwVvf = [UIImage imageNamed:@"EtEJrOTVZGIMZOwDEsAWZBrtzceDDZqBRApkApcBdfAiYHXzkBEjQMJobHmlhADXUpabcjTdxbdHeuGxRYAglfJwIsfvdAbrsUJFqq"];
	return UoClzlVNOCwVvf;
}

- (nonnull UIImage *)KlpJTltdjamOf :(nonnull NSString *)aFzXsxQstqbjsgu :(nonnull NSDictionary *)WGHzLVLTgAVFGz {
	NSData *uHvByTpLabTYhJubRV = [@"hZLsgVsuvSKUxqYdHQQtKuGCJwJyTJUILjiCLEpjExwSETWthSDHxlnyWJXloxQoMKvsZfyRTpjsRKqtZhjgLRMyAypHtaKiKccMIYohXYviulnjrJZvfRjyDITorcWnNRAhwXrgwhixUFLOL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kccUiwkufyTOYUukqU = [UIImage imageWithData:uHvByTpLabTYhJubRV];
	kccUiwkufyTOYUukqU = [UIImage imageNamed:@"SmVWvkwPWoBorGVnpoQjYbvKXzmUCuPRVmyYwAiLOOoinjxEQPcUXJrAhCDJsyaGNqmVZpCVTfmJDgjBsLmstkiiPrrJopVjlBfMPCgaPngccFFwvMsYWzKNIGi"];
	return kccUiwkufyTOYUukqU;
}

- (nonnull NSData *)YovTKObchTEBRSA :(nonnull NSData *)snMspXBaCw :(nonnull NSDictionary *)SSoDvarJJBfdjDNjyxn {
	NSData *lNJWuECOaZkkhu = [@"PGcICjCzpQsTvTyxrGvgmgoiZkwWrZiQdjZtyEZwWZJKPuvWFCQLXaSTQhHPuZcEMUteEneLsLnNkSUFXGPLitBhYexeQQTQDvosDdFEgoichzwIVBwPZFO" dataUsingEncoding:NSUTF8StringEncoding];
	return lNJWuECOaZkkhu;
}

+ (nonnull NSArray *)ppZTfFjLFpmLl :(nonnull UIImage *)hYTWdiArNrhxbZ :(nonnull NSString *)syZuosUucpoDhmj :(nonnull NSData *)rGkOCwLSyr {
	NSArray *ieVssbtllIwq = @[
		@"TsvslgCiPsQGShfkUicqgPcRxuHJBVWeqljQhOObksaeSygWPtuGVOPBBVIRijsfbdWCxanmlORLVlcqWFlQAuyvxEBGFcTZbTPFfNZPXjIFtVGlntcFZ",
		@"ukgCbAGbAzDUKGOrQpTsonkjGvgwBVyTbMiKZeovwGyNgzoDbvDBvGQedPZyvkbKvFusMLDUkeSyGpCPciaBNYCWnArZzBEPNJWhuOWAVrdQtEWWqBbZL",
		@"KwzJtkPuyHFhdodYZcRQDuYtroWjrXaKnvRINpmxYueRGXqoHeVMJQdxGYMGgZskugOzHAxAdUuhtgRIurErLuzcuVgETQWLmIhprvfTJhMIiqLZqCdGBqoYHdTwXmcFQMSuDmmOqwbht",
		@"MVAlpRXdaTJVlAxzrcVHqNfJtuJNDoSOJKKcpBzHtUfEtaKHWcrJyBadcdVrNlugICsNmZOryinYtKyWuujpUQguZbfsDvbbxfdEXBtsIahCjVptLTxLTnJtnXpKBzcl",
		@"YVAoxAwyNQTXEJGHiXvnnQNiXinCQNRkmsCgPFGVHSjIkTPWipcQbdyJPYwhCboaUQOdLztnBFgpRGamJUqsyMDHYfmfCBSOzkvCTacXi",
		@"HnRvgrCwshPGSzBeyBJgllYaTDSnKDZcGqZLKPQtwDfztqtsDTislkfwaqsQhUhNKbHYssEpSRytfNAjvXhPTYeuNRNCuytdVmpRswlXFNNBRaEcgu",
		@"IxRHliPicUKeqowyYkGBPPktZiLhLuQhjtUqmYrIlTFLTmOyCNeMGgATPyPnFsYKigoujVMXQDugDnQdyJpiMqQvHTliXgWxSwybuT",
		@"xYOAsKPFDUwiPZCQVyxNlYUZpHdZagyRjtLkgcOIBKtfYVmadGcfxACnSvzsgKTqebScWorHppxiEzPjXrlwVydcuwgMvTVdZPnDuKmgt",
		@"QaczNSqobPbykRsmnspkqOPMCNNWsQJbQKZjescGeXMxdyXtnjZcZKvGgxPGSzeSImluXLGalKwoVgZcdirCntuqPHqdZlYiOaHQdflMkETOiPNmOsRfYsVoTCQueoPSBFPRuAHQXpAYyh",
		@"BvlFYNYHhsSJtCBXBJIHNcTLqFoVXXfdBQSxEXIIYQrJrLIWtVpRiIOecPMeibZXWGQvlccnwNSleOqzuNwlqpShhKgmxrgbpuauRwwSTlQ",
		@"LEWEjQAvKnPcmQfvqeluezOxpGOpitnuNqNfdWusYjReYWRooLXdrFHBHSEktoXONFTYxCzcaQantuCiJcaVEZDWJHwIQQbpmlFOfkzJPnmXYfjX",
		@"lPbHJGfybymWOTNIIwnDecNXMFFQjxYHOEEUjlwNMfzWOsznPhzEXUXUPVEpoIajsaoehHdMQcFaTZWALDzbMEDGHaOAAVxUhjzXwdpKEieyaKlyhC",
		@"cSafMKQmyByguRXvOMPKqVxgsMLPkCpnseVxmEmtHhIpWWprucKJJzXZYQjuDWhefTqNenhIFuZgakTaEOglCEkiXxEJpFzcRdSjahW",
		@"qSjgHwPHOEFdssBHbefQURGwifiREhxJAblWyxGdnGolkqvdLKffqKvgVLwYDUxutpuQxGiiSqrbhdQAQZpwDtMzQNSSPqrxZEjZepTpqObYgrTFggjcUEeCKNiyZuAOIGhvlDdbCkBYMC",
		@"vANSGnGuKwQoNACXWWVppdoZyarPfFkceIElBSPhQtUdOVxwCkRZIqCqPHyXrAcgYJwjobcnGOqTMOnKElVgUPOLsNAGmDffmsiBpLsLgnYeffWycBTxSmVXuAWXaVrFyAwlzpBowCTmtP",
		@"wwVrOrTQcErBCVvcnwVNrqqXoZjBinrHQqGeQiXJdCIRvweMefDZuOgYdueSqbVtrqZeoUMgiDQPFDHAcshEpZvNLTIJWbCFzcITWcDLsm",
		@"wyLgPeJPwfXOgnydnzUmnUPlsxedcabstnfuWuAKZRFWuoEtCBAqlabQPAZSDQLTUeWjpRlpbajflMgxXrCWhtzlBUEodIeaqldA",
	];
	return ieVssbtllIwq;
}

+ (nonnull NSDictionary *)SNeKAHMhZc :(nonnull NSArray *)sUqJNWxZJkT :(nonnull UIImage *)ukeSYufDzUXtRkxbg :(nonnull NSArray *)OZAFvpJXZbIdFmca {
	NSDictionary *uTBTXiKkcTmyZhMZW = @{
		@"KRQmeJKzbeG": @"SoWANGxiPOtKdHOwWsvmHiJMTVWwoZivdRRqEtDWJquEKIldqOIJLxGpVkDXVwfMlmUdJeINFEkjdNLTKcSSGTjMjrOwsFeXpZqkgxqfwquWe",
		@"cDVOtDygeqox": @"PEYOrlqNFzMdeNCyfdJvkhEaPnEQIGJsQgcggcRuMQvBEvWelgjQYcYZoXazdKXQMxijywYvwMKQHDqonOQkysxYFuhRllUYrszMfGNtlxMFwCnEhlkOKEzIFGQtHlmuxXRBBMfYxHL",
		@"oaRyBUyHhVKvE": @"QGHktLamPBaHPmzaTgGgMJDsXmcDqjUhTAyuKxSwSFeiBwDLhirDWHinDcszHuDLZvPbbrrYwOdFxBrDPSgkgSTFfpLVJEiTFWrGqHuEzJAASwTZPuMSJNguPZvOMjd",
		@"qoquPAaxhEKzjWiC": @"VfoPFRafhcyNRhIeVVOxganYiIKxYRlrYsZIhkcBGsuQytfIQyJZCgAxBSkqckeStFjXYPSttXgBTZQnGkkMKeLVdaedlrVLYYxlccsdP",
		@"JadYTmDTbMw": @"UEpdHsnvnOMkOnivpjsuTTkhGoPgFYSWgdxJsWZhXtoYBWSkVnniRKeormiEcwoWAASkURhAnNlYszvvdXMUJibARbWhJMHXjTPFixwTmqKHKkqHgYLlRPnraDtxepxOXW",
		@"fEBoPYHepTgftqMpz": @"UiFsZeeeYuVWRqOYCjvMYWzEskcocfMotZQXHybGYrqwvZMDMgGwMrVXLNpslArVIatGoTnvlrEaKkpFiZoTfLOlkJsBnOtDoKELNCzQHYlCxBGMTooLvKfWrtMuDQwfQUZYbU",
		@"PdFIdrwVBxVcNEhm": @"efXOeMqPmksmqLOjjttmDvGDLXDqWKjWjXLZAHWgxdLqDCermyszptnIZDaPjYkoCRaPkLrtjNMWRadWQqWuWbXNhhnCcyogwKQELNJOWWyUFRaP",
		@"mXUuXneuzGYZN": @"LAvKhsaSSIVHRoxTUxfrFDDmTEWSFsSYpNXdzpMTeoSXVleEcJNCBsgMLmoZrACZvmXkNnYVnHmqCJajwmMgmmYTMWhRmOWTOsQMRHeAa",
		@"vWFoVkWIsawyAe": @"BOgmVXZhTZIjyZCILqadUyAQirIZrnSHmeHpPJOEASpyUjNVTnTOlYVDrtooPizCXMubyHJKbuiScOFyLyJdPdRFGleXvjAGDDuXqwvLmZqSKXHwUFTMLKfdJNbWUipPCFjS",
		@"pXWKsneHLuICaehB": @"ZkoYVvFpQNKuKRmeAayiWVwDhDPCtMnYIMnlPOOvXpvBlTTQSnHIKItIhgTpbQsvUpHaOAbJYJnmZawDoHpxTAxGsLjqdwmodudWdbSOizH",
		@"JcZSWstMRlu": @"neaksUtaPmUMehiqWSrPwKcJbArdaQWKRRaGgoCPxJzhOKmBmkAmzTjtERkbEReFndPaGAIEIySFPnHxjMJgdzmiUVKNWOVVwjhCoGSknnpktVhrpGVCfpWuajhRrjFdIcOYARCyYymsEOUf",
		@"CTPUXueReuASniQ": @"dVzsVylvIllesbLWDgApHZSUaqWZlwkxaUEJeUYiEaBoObclDHiwPPgBXhyFYrdwYzDhilQPrSfCGDSyTpqOQrbLKaGOiNhxIhSuNDGCOtsatobkgvrsFBgllcNSdmlgpbupalVnFxNYfX",
		@"rLNbPUfBjDp": @"lMUPRgZZzEURqWjodcMkvPSKQgDzXakOQHNLsAghPaTGujLRZMUhETsXSsWJjySoTYnELiHbDvqSUZFvkeWSCRdRqHaHuTFDNavyvumMpYgJRvHJ",
		@"aJJxoMddueiwGLhgnlE": @"ZhvZoBAzgTASJjsTmDODhRntBJusQMuWlrkyQHJOmLTSVlEhiMGyjOqSfGFwncYxftcLQrLKHnqqpdqkAKxJJdcytKNUOAODfngtZPEKrCILRr",
	};
	return uTBTXiKkcTmyZhMZW;
}

+ (nonnull NSData *)iVYTvKczsuyBnveZ :(nonnull NSString *)yylAJNWmENpPZh {
	NSData *SBaDjvMLStXFNzcyle = [@"gZZzNlidJCqgBECOHbCXNjzHHoFrYFcyuLoDFHqwejlXBOnAVdnpMfThbIRQOXWalPWliEsXSBQErWbdIPbaYVcDNuwcmBORSgKricxFfiPSuPCfYqGaQtJrpyp" dataUsingEncoding:NSUTF8StringEncoding];
	return SBaDjvMLStXFNzcyle;
}

- (nonnull NSDictionary *)KijpmaFayrPfPEPKy :(nonnull UIImage *)ZOMNRIpWeieraSRtXns :(nonnull UIImage *)CLGvcfQtfC :(nonnull NSArray *)VHwQhsaXqGZBBZNW {
	NSDictionary *bHUVvBKnLwFA = @{
		@"imBwTTPPkDJWbiPw": @"OdnqZYhMDEfLRePXBNlOrrmTqEFxRHYLZFwENsBaTVyEMhOxpbNHmEuxxbGHdHQOwmoTrXBZUxyjmCtNWVUgEwNzMemrVPotfgrDnMO",
		@"nuTkqXZJceN": @"PZYdnapYfkcatoWWVqbcTyhMDNYcEkaIGvueYYhraruAEOsVUiNvSGBLFPCTFancUZSnpupqmKBUQjiZhQSAYbfjatNuuFJUavFHdizTLVMTAsJciMMKKZfOepjibdDExrwi",
		@"xiemqIMoRuVje": @"VDgoApQjipeHYzJUPVVsQkPPFflvkbwVFdwvzOxIdIbcRCMhqiKrPNuvgLckTnsTjWqnQAKFBBRTTogZotgnslPMrQVuMdArFKNjgfUUNRxfxMbkPFcSygEdVuIUnQqfVbLNuamUiAJ",
		@"ANLZwqPJFjBMW": @"sYkFzShMNhXJuBZzeUVTOzSLFlnBLdpoqKSAJumdZqZjQaneXjyOACbVMyLhgItdGFLzHJswIXFZXQJehZoniuObBmqEGWGsRcfedoWrrppmKMrJNYb",
		@"FzkvPLnsNKmo": @"zmkFoKxTDBZxlogblPoiitceZKrhTkVcHXyQHeAsjVuLCokPGzWjSkAtVZKdZHzcSQlnDolMcCxWFjiYQMDlkCGeObkkVnRufEaXcgZZNVufFpSfKuVOAebSssLKtPquOKvoiZX",
		@"LuofRGuyYlOWovTG": @"bAHEwPGwfzHnXTLWJvpPjzgJHaHGRYMIUjWslSRZZoGjEKykRmejNbZVLMHGnUEdTshfxeJLdMQctrwdFnyBILwKYVOddUIjjvihtsKoWqKAt",
		@"nSuVwadGjmjWuQDzp": @"JNOEDKXpAlfogrfkofwJmITFIGkmMqFZCecVtJWIcGYayPqgHUqVOWEBzbilWrdwipSTZkwDQGxQZFaCetUugKrDvMEbVpPmPoeEurNDNNhuTdUkAiYJAwcU",
		@"GrpuvsOWKRLg": @"yYmKfRcXafcAMlGJPUdbiNMxPTtVHipOnmbDiceheiXbvfGCSPIHfnoPxhsiNlIqzqUZxQNpfMpFppAMztXSgZaDyrmyFVhdNCzDMmoRFKNTCjdsKTiuRwPtXGCIEuragScaroiKhVfXsPW",
		@"arAarwUASmQcApNiO": @"hIyLItduClrEDbkjBUkwoaXBpnXwpKxQvtlawQNronQxWBQoMXiTZtucmAZZJCtIzqgeiYeeLRKuArbUOQngzSpXhtAVfpzdXxzlhHTECXrmFyRDnSIvzeQiMTsUgdwdWbR",
		@"PKbpuxbMrdrkV": @"AXGpDmrpBFAlvwLpwejXCCEfIgreeYouxwtGcILflMCboWSZrWZqaBTQIFLLrpkBQfAZktZbnPyNBQmKBdbsxujUeKPKatmuusDuabjAQbhaMhYHDSMnIZiwEBwwwDitLkJqcMFi",
		@"gMiSjBcAwIukEpuYuxD": @"DuOGqRKshWLCzatxBpUvdMXIGiitbWYFXCWequptjZQZINXvrGlCTkuCABsQsklYYXRIcmcAkdYLjsyeAvePLgTHwFeAAxDJLzLTbEcegLGcSaJNzpvlxlxhyRyDMgfYJm",
		@"CRYhBTwjZVviiM": @"mMpEseZTHZlQpqmMClrMTGYmuuiYOgdgYZUVXeMwvDejvJbuxAlKLgkFLUNdZDoNGjrSReGAEmmcjxRlnBurIdCQOnHqUuEHJHvNZMpYqWFdtyRztblaiHdZMpkQwiFpFXc",
		@"YGtrUjdYZwuFB": @"mQvuetkdezGMOYLQuOklYNFHmeqyGGAntVqbMpexddCoVcWwFOlVOWbCbdKDfKEEwsIloakEBqYazcCKhjEKHOEerBkQYkOejzVOmnHiyyPJBVO",
		@"lBupDAEIHJkySkRp": @"GYGCnJKwgdzGNndpAYiXWGxZEKdhQaJjWgDvKeZBIwEpjxeadtDvUcGTUnXjQMLBAQwomMwXZcTaIuQuqyYzfRVfYtGobnpAAlRqeRDSAxqSgDc",
		@"uSRZceNHJZdhAuWnY": @"tBAhGpDUcgRwgIXNKnfkBDHPwaoFMGjhzHqlnFlmHdMemBFMZKNoDYfXTTuVdloRMCOrSLNFnTLrqCTaJmcRIAvicgxEhPPrAXuNkCaqtOBTzjeZcKmNcxv",
		@"smabgJodlpFDp": @"FPnIVzBegGRTjgHTjIouizKQQmOrWYgZJCannjmvakmgaLKEGDUXlfUfYzWPykCKxvKwaFdcrovgqGODDrySORhCSqUPyPFuXhDrhfritlHZwQgE",
		@"crLZNWsxwRjaNqVyh": @"bXlGGZXDCpfBYwhPIeukvQelzmmxDHmsZWfNkSyaNYXAhWRqxdmbwsLNnGtFMWvVLaoqnFtUaltkTuoUgNXiONvSnIkKOrGiQFBTbpqaqLVaYNwIuFXIppFHTnYDqQaaTBwMLDpZMSKqp",
		@"gesBWoTaBKKawjTcA": @"ACimmISEiQQkMYzqyGbZsdVNyUvYUbkrSnHkToBKLbHwlLBHUOWHLgxpxGTnfAOYMoMLQmfKwupzERFKxmUwSoNCJydtYRnJznLLRUswVMxKKzidrFcqEXVHRz",
	};
	return bHUVvBKnLwFA;
}

- (nonnull NSString *)BFakOgadWssjmDuVAC :(nonnull UIImage *)ZmSwfYEcAFt {
	NSString *nHEpHeWmQGQPY = @"idHFQVKpgwwcvtAuEWslMwBKMRoknPlOcWoHmBHQSBxtCvqjjcsTnPjggKMwAlatYlFLMXJzjcrmisLflvUQLEspOvvWMQlWvqvsZpLO";
	return nHEpHeWmQGQPY;
}

+ (nonnull UIImage *)oDUdPcvEhfDGhCXJ :(nonnull NSArray *)rfZmyEVoNWbNMLUUQk :(nonnull NSDictionary *)FGwPySuQDNYtVi :(nonnull NSArray *)QIeCprIsDSjXE {
	NSData *QwJdcrWsKJCP = [@"RrFIOECIDzNGrjgLuplakIHIFRrebppNemHEAgWZySCqCsKtPjnnwKKWKPuzGZZdZQbIZpXhjFylcCEdmCQqpZrZgsdodzhSgnGEVGmfQBNyOsxIkkR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZUlQyXCSCpHGoxtevsF = [UIImage imageWithData:QwJdcrWsKJCP];
	ZUlQyXCSCpHGoxtevsF = [UIImage imageNamed:@"kZZXPEyDSmbRjKuafoobqSuJNcvirHFQjijQHNqUnscLvlDqrBnJWateSQPYywaGFAJAGiAgoXwkNLLjAZnkWzoVvdLLpcWwWBVaxWLuCQwgNbowsILjTtyiZdljNBdfkWLlCZzVQvWHFmvF"];
	return ZUlQyXCSCpHGoxtevsF;
}

+ (nonnull NSData *)PgMcKYJFfckPWguxCpT :(nonnull NSDictionary *)rMIjFMfbGnGiL :(nonnull NSArray *)TCBfAaxYkMqfjV :(nonnull NSString *)eLJKtYtPVHnGaYMauH {
	NSData *KBWZYsiagWQDWMZ = [@"SMXTEvGZKcygjLRVqPyRDlvUtkEZhJjnhwvcXhaZlogGQNZqCduKrkDKBUmbQTAapsLCgpeHBsTyvqnVWSsGCiGCJeNgNWQnVaJCuvBVWVoWWzFoZpyfSEIbfHlrHmUdoyPvNbS" dataUsingEncoding:NSUTF8StringEncoding];
	return KBWZYsiagWQDWMZ;
}

+ (nonnull UIImage *)OaGgnxNJRtaWKhoxyY :(nonnull NSData *)mbcuIbbiYA :(nonnull NSString *)mOHCnejQNDeD :(nonnull UIImage *)HdYSiimDsUKNjIES {
	NSData *PKemMsWSgx = [@"rWLexTKAytKcfaPxHlMlEgvmdNTghHRhACjpcCyXEyaLgFBjPneDEXmYqgARRhRrpLEBmCgwquAFKVgkBxiXjXrkhLbDBZCkswLHpCBEmLnYEQk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lJqnxfHCKEKPZloCxWa = [UIImage imageWithData:PKemMsWSgx];
	lJqnxfHCKEKPZloCxWa = [UIImage imageNamed:@"GFXboZoUIeERCDhtLVwywkSooaUaMVHYaSzoydQMlcJKNFUmeYmgIpXyoKSApYDcjUYXcviZMCCtfADSmqYGaaSmCULtZOKeLNdYjYLNLw"];
	return lJqnxfHCKEKPZloCxWa;
}

- (nonnull UIImage *)IkOyDBTDXuazgUPTVUm :(nonnull UIImage *)ZRugDvXQCIfaW :(nonnull NSArray *)jtdOIOmPKSMeVDAUds {
	NSData *sPhhsyIUuUWNR = [@"PJWiUDXYNllaBlcqMfwicyFDKYvEoEDRGpobcSwamTByVLgYVFztdjRyHZmyFjGdGRTgfBiCVEwNlPmukNFOFzpGlirjkBPsNvoiRtUWZzgioLkq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nbVqxEtjXUPuyNND = [UIImage imageWithData:sPhhsyIUuUWNR];
	nbVqxEtjXUPuyNND = [UIImage imageNamed:@"QEiZPIFThkUovlKwzWbDpudZsOmyWKgoEeyimrlLXzNHoViRBEUOFdciUnhoXfMJjymXhOklLrOTGFLyFksKuQPlRYMfFDcBBuRMZJtEBLqAZUFXoBSJMBbPDbHTZNMNUenVIbhtvtAqVBope"];
	return nbVqxEtjXUPuyNND;
}

- (nonnull NSArray *)bCHMFJdapgMERJmK :(nonnull NSString *)isKPUzMjwvvs {
	NSArray *TqpiYTvQLplnelVsFU = @[
		@"aMsJtQUTeVZLqijXKqJnhmZuNJOOGxlqZHpKDtAeDyHzfmowSOtWaikXBdvpLYLabIfcTrxEuLhxsWlCwbrKRESMizVrROwOqmwhEZZUIHNFDnicmaZTAgrEjaOJvDTmathLn",
		@"wdmbKoQXUTruhbjsdyRLClssZVvFIDfeVcCmgcddStYDMkHpljXRuSYGiufAkCbwsuDzAjRpECgXUEXxlWPzmMgDxgoGLDyCKyqJmBH",
		@"WpOeVXCrRNUpFTWRobXIIejZaBkCgwmrNxxgrMAYokqdTDdCycEhsWgHhGSFfISQHUgIViaitSAuMHtQgLFAuENNVYjiGLOwgmgDJANyYmNIsoZrROKKnrEvMmyfTEAkxOA",
		@"cOQtSuRjPpXHrqdyieFLIHkSodTriDHvXlprBhJhJbVcrSehzvxDCisFUrAjslYfrcHACrAgGLGbmaVKuAxrZVlakybjVybPEGvddEwR",
		@"kqpFCDGQJfHMZbeqMFBdsfYLVGaDxNnwngvgTWOHyDsAqBKXZLPMVqAzxhHCTbsJXMRKJxVXTvnzVjMbATLYanDYPFHxmGLEPaSZROPt",
		@"WTjgnrQAIAFbyNaaowPjfYTBNfGqveeOXIyHoFiBFlcxeHHvXDAnOwhSzyGTYHyriCtOpfiifEcFUgWzgMXuQLppRKWckrRnECUFEnNr",
		@"FZBDIKOsCeYuRbBufNRrivtiyspARFIKmzEFPypByoMHYZUsUkqMPTsUqwnmbjgpJgWxYIeWKVSvMlpcErReBOavHNITttFBmmqPXfwJKUBeJEVPGKHwJPRlLhe",
		@"fLpVNaPcSSeZSSiftsbCWGNqZxvlDfeNvWzLgrMemuvtdGBxgmRkyWkitOTLjzpWYRoLymCOEUwrEDvaOvZRxGEWAfbJKKMxPYaRjANsKuXsSbXGhVpzySRnyegIlIoPQt",
		@"tcHfgNRIsVGJdnfMTsVvmReNgdQFhRCEqxxHLMMkWuzpRNXefIwlUMPvRTkuZyeSYVDlPLzNbssEzkWHmwFvieRIMRqRDHhqBDEcmHxzqriIrFppDCMiGFbsluEpeAzsyDKslONf",
		@"nSKUhhAQJExrPTbSeraaCCzIUuuAejBLnyvLmVhgebaqwmtzANInWDyHvVsZTyHVDgemLQnyjFJGlEMSdFHXZLsJasBadTBGPPQRkgFCyWDKIgLhJOMFjBfieDitOH",
	];
	return TqpiYTvQLplnelVsFU;
}

+ (nonnull NSString *)ncuWWESgHNxVFSl :(nonnull NSData *)sbqKHxaYkKBW :(nonnull NSDictionary *)totEmmeliCx {
	NSString *EDqUqBpOlpJRrojyWpA = @"kRkqOGtUTuyIdZJBNYVJAClkTBMxkGHpMJjhxklTcMscdrMOefhjSccUwDKjXlsdVFznvPytatISHBWGoiQSlxpbQMoVJMBWCDPKEClli";
	return EDqUqBpOlpJRrojyWpA;
}

- (nonnull NSArray *)TbMkTFEmBSmeHo :(nonnull NSString *)czFDCQtArALDeDJMliP :(nonnull NSString *)nwEcyaTNiLNEhM :(nonnull UIImage *)lBKKmumZQiMwvOaAe {
	NSArray *aKvoChhTYKnExfmRgx = @[
		@"jiMTvUclkXFOIxNZHPWXeVZBlpZckxOOagJtXJPpckBjloOfGrYGTNBhbiutIgcgCRzoSqEryrENupLQBGeRBiLeFTrlMZyiHqNIbitookDXSsLwhr",
		@"QyXRQWrIFMCSjriNAkdVcZkXpkGQstkDCYqCpWRLcNstFoEeNhZtIPWQSegqVRwePdezGYTvsoghexpDppCqmIdjQULCLphfhykhwpdVjcrOBZirCakOPyZF",
		@"HSieCtxPlfSFkPKMdJwtprlvskakUXByAJpmWdCgTqSBulwcocvMvdTPzUYprpZfGFyBAHVGfdlAhiAyPFUWMuAdhkFAyqTjmcLpUQoQJtiZhaLUlNxQmdSFeIMJGrYOxtnhS",
		@"xabGhHapaxCLlmjyLiYmYGwiHKLdBMZVdZIEkviSnRrYkPXsKfUPyJlVIHXZJQRXHEmzhLaBbKdebYpfqHlPFtXKSNWGDUtgvdTvCXueFtgZWxERQppZVPpFJBAuvFBRqSnqMyLyugnF",
		@"BsvrEgeFSyCzhbMUoCfvspQgTdqrNQMHBiqacRxvVsaCVEdNXmckNfWThdoPuVxEqAZqUIbSGvapyEDSiMGHzncSTdRfLBpNjlRuYndIsTJmFdCjeqaEFAnnfiFAjSiHbcVUFkUSdALXEdDuWwqo",
		@"KJuauxIBUrUfeemSknriiGHCWoWWofJziipOPbloIGLgPMXyYNEpqDOLySaODBQZGEUydgxGVExknRltNSLQpznSFUqzXibFBWTSIpcsqvhliUlURCiFzSPhKmSbMqCgWYODKWfSNkcVFhLfR",
		@"fMRWsctiHCoijTpfjlAHhLKcVILKblqTlLySyppLdtMzVPjJlpFMBnBfMVacoBtpBrmAHcNMohaTQJeUmlOrMxcGaHVBASwMPBFQHcuwMRkLYiIPh",
		@"EUltXmzqZsxcSFlqRsrdWmiPCsHycqJfigmEaxAZszlmUKPbFNDQJruMmxwboIBfkyapOSIbGohpFyrbVliNGCFlztfjZryWoiziVcXKrJfpvt",
		@"ynPSpvgAJcIvuKRdpyUnRVwKTqRxDTNabsKlnPkwQEhKwUPZMSADtTVVKVAyiAhBfjyOoezwPyrbgFpqHLoIYGrfvUCrtXWOvqvknYqukUiCJEwrKKAxOwtfntMhLFjjkchtsiGbHK",
		@"VRYMVXzEVXlojvMPioithowcTnboZkmXioXfiuqTFjvvtudmEznIqnHcfybcFnRTOLJjgmQknkyCbysHIWLYcoBFYrBonuidpQyhrhAlCLwVn",
		@"jcAESqaOkymXclPiInWEKFtTrQPUmtImRSTTcQWQejcfMXNkzCpGeyAgdXYmYSOgfnUKevbRCcLGrCEBWQbaFgouCOxwmQRmyRovEWRkploidz",
		@"bstPLnarXDiFIezdZUVugJbnAdCLXsQDgESDMtjDWUTOVmWRWLbbfDysEwocXWWUhTOIHsnoVFyUfGMlbvUoPFEYqTqFPMCdMwrUzEpauNQTxbqnyEXcDzOuehBeJTfvAmloaCxUSnbrdjIBt",
		@"kZVLYIPySFcGevUwDtQzsaeTFkjSntizIVbdYGwUlZuAewYANRqSKShDyfOECfhpfUeVwupTPPmfXqidlcoJeiyubpemHSXLsHkjWHMH",
		@"CjlDWDrWhJArrnfslEQEJoKdPZSUlNgXvBbGCYttSVnvGkRceQvtZFMmjoTxHOzfQVcaMjkljCqcqaQowEGyTdWtXzApwmQXafuXSBNBSzbWgGMNdCFmU",
		@"MvuGjyryPQFtQuRzHwHxSOxCjojUydVOOMMcdxceLTpwSPCCCBPfregOhNrdTEmmTRENlkAnTUHeQPAfYwXSNZUNWykRMOtxwraNEpiFlYAI",
		@"jWebwGeLzevwMwSgXgFajlZvoRMsdpGuaAxqNkIstufqAKeaZqIIBYQEMhJnXKfThTrRuuSEYRaWVThsDbtsgDhMejxMnXezxlvTHCUEJukJkhtCiYcIFZDcFfTUisWQR",
		@"BlfopggBbfOWXnHTRAYoXKUBkJDWgQffafjxjCZpYSyZmWLOTmrrnEHrwVGzAXiPrsRICPnRjyINPUXiXYIysXGsQugzbJKbBrwumyCjdha",
		@"hHGJXLbHrdaNNkUtWINLOkpqgpYWZyISgPDsEjXdWJxQUVDVlwOiLfoTnpCzsKntExtRfLgcrJNoKjpMqgZrkiyQeWWyFjwWIdwDilWgGhiUuofrguCVWqYBNkFxJSGklXOY",
	];
	return aKvoChhTYKnExfmRgx;
}

- (nonnull NSString *)YJellEUBpCsnlS :(nonnull NSData *)QolgqsgWSsUJmpdqOK :(nonnull NSDictionary *)sSxPKtbXfRRN :(nonnull NSDictionary *)KFePpjkZTXurbXa {
	NSString *tSNxnzzCSLoQfJV = @"sGTICLpIHpzXkAtemjVVVoafQowLtUVdjvAFFfsyKOjbclQmjNEIdYfAhVzoorWFxGpBRtcPTdXqWwasklmriQsQsFRBImUgFzeqNQPdgpOyCUfaQpgVllZyetLgYHfNhAStoyGNJsvPU";
	return tSNxnzzCSLoQfJV;
}

- (nonnull UIImage *)WDzhogURXbdx :(nonnull NSData *)plvYaBPzmYwVMTOxEVw {
	NSData *lJkXaruNXeP = [@"JvwVifkrejWxfLsclqPDFFmvwdRTsIEgIdXzFoMgbflMntcqrdnwjxIGPZERBagjhRqiNUxgBdTpZfUxIPFNTwZaXaetTiCjRGuUYpzEngMGbdmzWJVGgxeyYovf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RyrAJWVNjDbab = [UIImage imageWithData:lJkXaruNXeP];
	RyrAJWVNjDbab = [UIImage imageNamed:@"kPTdXufDuhPKMrymvFDpXxcNzdyzqPyMTUHbkrDCxfrAItTxNKfKbJcYnuAFqHyKaFIeGSdBtfcKJUzwriLXROvJdCcTgwHQZOsxpijuxWShGn"];
	return RyrAJWVNjDbab;
}

+ (nonnull NSArray *)fmjGeZsRXzcbcfxVdGM :(nonnull NSString *)UCbphCbWIWT :(nonnull NSData *)IwPDLQyDJHrrz :(nonnull NSData *)LcBxzDNlNHumkxGZUfM {
	NSArray *lhIDWySsrSkezp = @[
		@"RnbcVTYAYDCatNfqGGKBlgIzVErLnoCTcjXyGEoKKqtvmBCWYuofuZNJgOLNzwkNOSpXDlTHGgsrjqdTWoCuCkcMgqAlQJdVqMqUezvnPFeYuZWZGfGPQDvjDQrvw",
		@"wJSqPjaOgvwieefOYiILoPkyUVbpfjAaPgdSnLaIhzAXCFehHwjGFBZLQCOFiHofPLOPNkpxnkaUGdEytOJNNecYCJBNgfKcQewnrUUuSFsYfusshBLyQDAxgQB",
		@"tcGodqsGxykdAarIVGyjUNGlbdMmluuXuOqSWFQORntgVfHmdSmygCdgpOUagiTKPwWsuCBmHQCgXTsVFbtPCFECnUUzYftgmEqsAMbbedJSUaYMbDDRoRELMSDQoSEeoutjP",
		@"njRmKXjKQBVOXKMDYASrKotKqYHGbrjlAYqAbckNoxLfqaaWdVzElFVAkPkpUYXDAepnDYnISbXIxgThCJjWhtFqoYzXvXegGOOPsyTDgmdaYHhvgSrjbwBckrXbRAFWkxVmnZ",
		@"KtkLSzfwFAsKxzRXeJinIdHTbUmQfDJjaXfohHLsBUXcRBJFOXlEOaFAiguHTsRXeQFFMXnigTIDJgBvrhNWrwHSAbParLutOvkusxhWGaEvrowqJkSNJZRNOC",
		@"qpxTsuUwLBUsiVNgBCXpiRcsDZFxIQBAiUdCrqnmIPilXOvdcsctiSgLlHZhtJjnAgHOEtIZyxshhqnCLDPiFLJDacHLfSQIpBoALSKbXNVUhiKgcYoaN",
		@"WdudASnplfkuQWqsPuPZaEnhnKEDBWCURkixJARNWEteDYFfQHhCWlSLGhTioAXGpgdnuBIprOmCaoaLhbVfrWVRHeaftxsrSVwEdZxHFEGIHerg",
		@"tlyHGuVRpeqlJvmsjUNstAOuyQeXsMFVmjQTPLjBYBNnomAenCwGFaFsHkgwTyNFuOTZjwhelSwgaWDIdMlLCPDCZyHTBBQBlNeOmXHwjpaNXRHFZLKYAdLZmFUBybtTZkagNOWGHUccgaRtCXwq",
		@"GwJYAxLcztpkrwKoSlkLDdNZPmuwqOUzYgaBnWQoxTPrSQDFiwFzffyHOOzVaMPbnFJIjfTJjYRptVxFscELIsctpicexVloNuzAziZRPVgihovysJKWkBoAcSHRvPUd",
		@"vWEOvXZaJfZTjDOCyAjNolPvWzJLhAvFsQmbOOBQQxkQBOFFFkkAzqwPYlMoChJrymlnenIIspAbUGsfcGLeyJTJAvaHkhrKMcMrpkVQQhPZepNwDpaS",
		@"KwzmVGXJddDuBnEmPfVvFKmantPPtUxBobXYwZKFvoexAqdmtNeKdboRxhIMqSZDsSbxoCRgjGXdSFveomLiAALWngRuAozpJqreUrwgQceKKiOXzUUZoZidGmZWdjBJPPDqMovhYKX",
		@"FGsloPLjVaYRrzkFrWMJYyWTRCFBoJzxeatWQZgrwAAycuRcmboMnAZaBMfPZVfhdcihViwUpCSXQwNOAgwSLUkfeSDHEBUXnrhySwvycJNQCdowUlTWSZXlqeuvXrHmLdPEG",
		@"jNpAEYeoSiIfQdnujDdrzMjoyJCNkMzRsWsmyAyekHbMcZXqUPuOsXweFwCtrGinrKnGLRKuinALdgDqRpSmQOnGgGjCCWAAywSiVDIcWpcojQxG",
		@"VptFjrGVDDGSQcPjJiNXtzSutmVdmoLFXuNVWbpwagYedVEEEiEjioWiUkIemSxHHrfZqJIBAMtdkaJRlIXhlunaizSJZFkkakbhCNoNxhzhyLIHTfTM",
		@"eiZYvFivgNeZiDawuAkXODMRgZlROCxNgoygdCZeULajsxBDQvFmNKSVDFYWoCMMcoFoStIxhsvMAxVjcjpbkrFGZCxGxTTnurKjHnFsVgxBKarCNYJffcWsNbDnqagFHKQjXSiAQVVWT",
		@"whnLWxVDGUqjTZtxiOBebzXDKuAXKvwMtFyZWuVykdhEqNiWCTWARzWyttqenInCBrSKFVWyIndIXmsfRiWMFHCdPfNuKGCIPIukePFtzaTliwNnZvuUjCyMvWIsasYzHeAu",
		@"ooPWtpKPUQqWKqElDpvDROWQRdHaWsXeybwQQvQSwQSoWjmJgzhaMSOgkdRbWyNjzMtIboVgWMgzIpjmRlyjgaNuJNLDqHSAjFwnQeUGEPpmowL",
	];
	return lhIDWySsrSkezp;
}

- (nonnull NSData *)VJlVHpsIkpsZMGg :(nonnull NSArray *)jjhfyaEcGXnZSBJAT {
	NSData *SflSuXSpQlvAwWAXNd = [@"xEfXHSypUVfEolTPpPsfmKahKrqVwFGmSSzPVvOopymvznBoZmZoxTnhcSeskigEsVRaPFQczCtmBDMtQyCgSCsssMxpEUXbCqquoGWAmJmsnHuyZjXtPz" dataUsingEncoding:NSUTF8StringEncoding];
	return SflSuXSpQlvAwWAXNd;
}

+ (nonnull NSArray *)VnjWWOFydFSDKNhR :(nonnull NSDictionary *)PYCTXZgUoIaSYP :(nonnull NSString *)sWYZlEzgDZYSU :(nonnull NSDictionary *)EjLosHisRty {
	NSArray *TeNcpXtMzVmnXZCshcn = @[
		@"qUsLgblhUzTelFZYpbzAWOWDLUuvGbWOYDjdpuWXJhpHaZSeiGxRjhZmwfyCHSjQNgprKKwDVeOCmwEgXlUuMKqEGhNvqaBzMqsnDlLgSCdSFGCAZsXx",
		@"wbVnhjJxUMrFfEoMqTKDbPtMnCyhuXOxAGXcBXeZfWTeGvPCnefVqiPJjpcdNoixplYGgIBcQVcBJmQRhTBHodYPwmKBVFBoaWxHLzXjBDsHsiWeexH",
		@"vahfNPUwQbpSGWVsvJCsgrGqGZEEkiSWMdGQQbzyXELAfZjbuhZpfMmXvvTeNfTElfIMcXSssahysfBJiXozWLmvhWwDYEUmlSqonDUPehfEtCZImvJeY",
		@"EPARGSRgCUacqvkpeHuGpkqZhHTDGiQYXbkSADUxHHFzLPhekQgxjyiQRnJXqjCibPFKtNYRwSKsDfrKjBOKRuhMYWEhnsvILkZZPQtriOLDktAmJMlGAHoXQlPut",
		@"NelNYHdRqjfsCEefMlDQkpxWBYOzzhxZEKniwVooXpdqswckxoooUXgnTrYhTIzbTPkAEpEMQnAMXhCOhYNkaLheviupmmIZNfTlHCJPzzaiXmCpOpgmEnNvcSAZFtUUZO",
		@"dojnziwQenlowhxfgCgrCeQQwuTnaIMrNykxhtmrEJOlFzIDtzfyYBGbwrPxhlHKLfBPknDZqolLtpuvVXlpKzAVLkIGBkUhOWevSbCVfwOG",
		@"dysnuIjwOacxlUEJdYTaXUbmfdcBFupaKRPKdouVhjMRFxUuzQJlEFiaMFjwIJGfOthwEWIVTgaQcRWVhWFsedVLCPWMxhFasOqFmtWMbTGhfpuYaRcDmVikgxTlCjyWFI",
		@"WKBdYmpQQYtEWArnnHUKJYNXPccrHrzMvsJdaKObFsHEEtXdnLrSAJWCIoRIdSPmujICipcOAPBzanfEPbPgjjaefVmQnzFqYLNzDxqssMznzMqGwfiraGWrhAPNDAzwMIhOzAUeeXjHogi",
		@"mRMrGlweJTJWzzwJGQKNTrizFAovzGlqNBRjPijyCUCpCrMmnPIkgzJpjmDasnvYeafotEnaiKmbnrtmSrkeMNOKWEjikNygWsBwfLNEPWqkjtECUPjmFbicu",
		@"WqBlrseDGGVkeuMdoOkDrhPjdfSaXKKNYLdGdHyvFjHznHVuDfZYXZxAncKmGFwMnkKZJBpQqPOmorUyMihHUVbXZrofUJKNIfVWyQWTyzlkrsqosDgFMaouEycy",
		@"CBuieUryRlIbznViKYxfGrVpPAJrCrfwHEgiFapYTNDbHqVTszDwGJBspFUNwDoInjagyJwYLDllBWSnwsngInfhdGfevfeMudoWbC",
		@"XyfCOzPnDNYQNrNRCDEmQMqljszFCcDnQDzxScExftdGGZyfgjzoENTyMJrkqjhzxvBwJkhRAriwQPajJRlJAgRKbpJZXXhEYTuVyuL",
		@"ANsyVoXjllLOAQlZFtNvUQuhWgCdpBkKMeDHEikohLIdxgyNOYNrnhWFqyqnbgNNQCtyQSSzuOzGRGmHjgFzuHwqZtxrtnBvCTTVTBJktaeDHalbht",
	];
	return TeNcpXtMzVmnXZCshcn;
}

- (nonnull NSDictionary *)AWRfLwLhpnJXSIMQpF :(nonnull NSDictionary *)PEmOkpiHCYGOKr :(nonnull NSArray *)TTrljqYzvAcxEgCvX :(nonnull NSString *)OLalOVwFVkPtrRTYtui {
	NSDictionary *XrTWYrtbivqRauV = @{
		@"vYWvDaczhXlj": @"tKjzqbJexFMytsGeaaKMvcTGiQePNrjkrEPAagpbFetbFWLfjHbYhGUevwQmImSxngCnLmZHslNqQIJGygjCCZVjemcujLXYqPhPHVzJavQXw",
		@"frBpstdTjEBl": @"LuhNtMupCuEMgAyLWFVuIgPTeVgxFvgOnOaeqhbogQNNNpfsbGzxusvorTkRcTbmWxIsrjevXOBdslLApQbbTdnpUBDODvcxnFzcUbsYPkAZglONbntqpnCqruQHZpieYwZtnbSGWYvBIUxfpH",
		@"SVtBrYSXfS": @"YVFdfcCtBhyAqPjiJRdajFnyoQRNNerMYcwVyomiVLXGeVYjMvvJZLnSHkwtZEEaklQBocAEwxBxAoKFnFfbTBizGVpwJKwkVpIVnoDgyIROzyp",
		@"MipDUIlrcl": @"rhkBoDAgSOVwYPqLOTkGYuXHKTMJFOaEiWCDDbikHWfHVZKHXraCuLYAVUIQuBZZuJejrcEJOcZfMPyejxiVmoqfIGnZtcRcMggrhJkfRRfPrPuyRdZsNMcLH",
		@"GBCgZWBdOxzLCwxin": @"ZWRLoAJaAXjlJhyCeBNVQkIEyIWABpkOsGYbMkIXnYcZkcobZOpqyInNZhnBDNExNWYIYgXhXhacIxjAynJgGvdiLGpNBjTbOuNzM",
		@"NZTXQzmzJwXXBaiKZ": @"KGZDtuuDykCeLszeVhbuxvGihqdldllGYhvbAXzokPaMSayqstDVnvXudIeCfGwUDOpdaQmpEnujNWfUPPWpSnuHaxMkywdEGdHVAcOsJUjkJDKllJdH",
		@"iVSxWPoiwRpMw": @"JxdqxhlKmubeVKPnqcKSfBIIdtztiuEoEIlopZBySuZIaaHsDrdxNGjOemZopcSPPpupHPjKfqqyahFQwHMSJNactSdsHwoXsvLpSMhEpsXfNxExTxvLEmoTVtWvUdfKe",
		@"WjHSOZWkZxOUAGmqLm": @"NVuFwvmoUcqexTlztpHEznyOqsVMoqGOIwbUdJtJcGCbAdJLJvMQhuzHgcAldxQImquoHygDNOwopkRlvtKDRAOOuUkkUZdTFekuuLkSObhiVcKhpsr",
		@"oDkvJHpIpQJrIhWqX": @"UnwzHPdsmvwGTRlXeRWpRObBorOPFAeWNYTvuIUarHrADWuAQzpKmzBTMpLIQwUEJLEjvEeWSAIFwVICdAfHkADugFQdyDUivUshuYMOSGCgouMNYcnAnaRsG",
		@"vgxLmNvkOHXvQwb": @"mmTRzguMvGBKyGSyYZaUcLaceoGZiYeOhgsCPffASxgfkfreonbCjUBYhXDKGsZYxqZParDQanaLFtYSkbqZtQaINFdCiGmjaWlZItoOsIkoTonFupDPEqeDnosHjMCTvyuvWSuhLq",
		@"eVhfuhdUOLRtKXA": @"lBUflWiCIQFKFdZCPmJfZbJLQmcdwnbradLlYSlYGkbaOqckfNFfIXXuVrLRZjfzRIjyArsryPIrLTxvspWMLTkFySZIQCNYwfWIvGlvdhDDCdyuCZxjqSU",
		@"ThizeRMpSUUn": @"nrEJsDTRHOHblNZbuyplWljpqIlgTyMzoDovtPhMWPVViEWXIFIdUAmUKFfgXKmhraEruuumCVXMPxHDBoBqtIbrncLagTCBXmVzRfeHiHsnRAfvRlyTJuXevYKuaAgGromXXtDUtgTbEkEfmzv",
		@"wdHgqTZuCgyQKNBHJDp": @"iJSDrIuZeSmfEyDNJvnpPYhgvqkrSnOxdQNTUAoNeqNSGFRQNZzeQyPJLrmmuqQmhdfkwAlGdvrgcTbIvyvlYHJzEdJveIYTyDSWgl",
		@"tyFEjKfevOtbTIbpkw": @"SDyLTCeScOKgGyRkKzSKFXDITmwrqmfbapDwirYYcSRIoczrsoDnFJsWiUjlKuoLJuMpoSHNHrMNjIqUBhtIkMhCexGmJKioMJYkFggzQvxXMwBYteCglhEBYmaOTbqpxKpaJFeGdRov",
		@"MCNVeRMPvaDgNN": @"KTXEpVCKnvkqtIowBltHsjVRZJUhEXhPDyGhjvMzgCsTxeTLTGsajYJEOJYkFJWgsTzTNGoPIHGojcBLVqLxcTMQAepRTjcfNkjwHeuOteRSA",
		@"jibbOzXyAKYcuF": @"MVDFYbaxiGzdNykTdailxYRPtwHwzKVdfcPCrfhJgOSjGFdElvwLudUkDQVNDiiXOLmxmxtExjLBcaQkdoFqTsEMKskAFVKggGJyu",
		@"hTXCEWVFLQ": @"gXdQHJGhPDhdQNHFUWxKHtulGpvLErCNcZFplUZmctqsACvKHxmFBJiPAoYgRFEaqMUcnslHaKGEexHimtWzVnAbPQKHpkVPExYgNnpRCeDRmkbeTpbYMRrmUrzQZdIN",
		@"SVxzebclKsdlt": @"nAPUMDLCPUYHYgCyQYwgzcZXncHKkIPCcBenLdqpEISDyleGvVdDzBMVPzUmTkLXeanvPhOOOUWVBJgQPjnlMLcEVGqbLXfGvlmqLUZAhqisHPqKcUCgyZHvgUDGOMAPEfaWXsBSKDehiOrwJBk",
		@"GyxPjMIBtPDs": @"FghmsMzrHkIImDCQvyTjrcaYlqgPhDCFvkSdayzhqCbVNdZflbqTZKtALMYWHwlURNSKaaSJpFdsMOVDOUtdXKBmvvHGuMQwdZxkbAJibTeKHhKFXmHEBmoihIXRhbUEenfbPlOdX",
	};
	return XrTWYrtbivqRauV;
}

- (nonnull NSData *)XzPzLPcfImlkm :(nonnull UIImage *)jKnpwNUDjSarUY :(nonnull NSData *)nfAavcPfTs {
	NSData *NyuvXrYYQnuiASff = [@"wtwuSqRlyVddeNEXxXsbTgJombbVtcThaikuySkhhGPVLFbgYjILMVkbGJuSjZTVyAultLTLwQrbAwGPRrseZFwbgqhISIpPTJBxeFswVPodwVNYaNUzaGNqTDaIwawVEjT" dataUsingEncoding:NSUTF8StringEncoding];
	return NyuvXrYYQnuiASff;
}

+ (nonnull NSString *)PNyIzDlASDSACgSh :(nonnull NSString *)ZrruUwypriMwpKzjF :(nonnull NSArray *)mrFHJIWaLdhRWp :(nonnull NSArray *)YRnhZudSFPqsfrdgKK {
	NSString *uGasXCFeHQTBdkvW = @"HmRsNSEbCquvLoHhtPSgwmeGllkbbepAtYtCuGbCjRoHtACdwwBVaQbcDueeXlShRBEwafOUsXMxFUZGqyVZVVKOfgZFemDWhZzBPzPQqZgZpBoHnxqIfOmPXrZqsLghuVcvdYttDOatFssQbSXIH";
	return uGasXCFeHQTBdkvW;
}

+ (nonnull NSData *)kwrQrknSXrHeoOSHbF :(nonnull NSDictionary *)VuZhemotakKxnrP :(nonnull NSString *)lhgXnsgGGRjZJR {
	NSData *MKaRWpyYKzJRZSNSOII = [@"jEgmlHyZrzoWrJvHFXYzUkxKHdYbfRFgzhZvKwRuwnXaPhYOLbqUMmwRRYztmkoDePhQmETYLYYcTdnaMAINxykWHGgKUBkvWEqKlKzXd" dataUsingEncoding:NSUTF8StringEncoding];
	return MKaRWpyYKzJRZSNSOII;
}

- (nonnull NSString *)kTBDdIXdOJhp :(nonnull NSString *)HNkybNqEheCL {
	NSString *VWjnsziANlwIlnN = @"ElrpmjNkmTKcCTyKMnQDLMdyzSrsGUzgVbkTPCDkCmQWxZTHPqoHuUakzqjozrzHXaDuVkibsNYLLjGGkZEKgvGsGJBtPxRgxHLPDokUSSmFvATNjvHpFe";
	return VWjnsziANlwIlnN;
}

+ (nonnull NSDictionary *)POfEtkxWHwvwvy :(nonnull NSString *)BQMXkRdPeIS :(nonnull NSArray *)rRIcewpZmsxrdnSDOT :(nonnull NSArray *)afvdJdTxSpZtZOV {
	NSDictionary *PLXQAAxSfnMbh = @{
		@"pGZFknDYBG": @"GVLfjWeAegSZkMPjNGsWejktDfkWzlhVKNBmPHeFLLLdCDGiKwOdOVYJhrtYlEmjpMUUxIRJlIQpxyiDmNVJwwriSepdvQsshrNOQMPjjOmaBcrVRck",
		@"DtZJuqLQNqgSiI": @"ENXmgloVqrdHmzbPOAjrXnGZZQdXifdGqAJAiRldZLbeFjsNhiTuPSyzBpVGLPyHBMoqBnVEkRoqSJzFufCgljDZqAeaDLObgrVTDceoXFZxQKPrrQLpkUybqqoFkC",
		@"IaGaeIXfCI": @"SXdhyNQufOJxHlcYIQssrvmKuKtLGxuQYIesyPaCuXLDxqjGDFOFPtYWZlkkxniJzmflxRCWhhLjNoniRgjvLgeTtPzqLivHZypweFFBaxUnTCDEgIV",
		@"HMXfADQPNLrJlmQ": @"PBRDPQfDlmocUBWzrFnhNmoOqjQKsywDdDTsywADbkCOhnOVSCZclOxQXFWtLpVnPjGkknSXrlBSEpBhdqnaOqhZRrMliqJiluOcOAQaGANjywkqSEby",
		@"CYRruhGUUANCjD": @"hCYACCaBpHxtNigJdBXwesIjpUSSKxwwQxkUjKXfRTbYutlfwzNcWNVrGDVnbTIsLWdRVlAlVTJdAwzoHuPoIvFaLesUeZZzMFNAvrPXRvYsocClk",
		@"AAleDSfpuHL": @"GgltkMxIEzbyBDZiasobRGGLlkbZkyGKIpamJjrqvuWROhdienCfSxVYnWwKJBFLeJEqcJoCUeMjihqArPNNFSmFEajNnEgZmueXCxkKkDnuHmMTnQMqlvrF",
		@"gOrNcLZsLdI": @"EsznMLIeyRBxnyIxtoCezocBfKRGundFGCFPDPOhpBXzzjwbpiSYMqorZnNmsovLDRTwNDtYgZQLUySOFYtyDQhHathHYlgqAnmHTqTMZuDWwYTeUUNjozxmfrMiYXPWkVyOVzFekabCWPJwW",
		@"JZyDdJeOoJDkhwUlm": @"OgbhLMvjviBbuuTPSXzwUsTcHsJgJVgzQnRxEccEfjqxkvlXFNffcsFPoSILWULyvfSJJNUfUYBMqBtiSjsHpsXxVQjcQjhUMJjy",
		@"RNUuqJHnszCCAbXy": @"UEXDwFkgeyAZsYzZPYytdFLGDjoEaBNOccGkPAaKybPGeJjenZaHXpsIUNxQkMCvoQTpqVQBBoSImaiQxaTnWPNtWztopADDZQhTNGJzcvKRRluBSInGWGTNKClfhOGmyiffaWovNeYQrQjksEeox",
		@"ZNSnkCujCKg": @"eLRdMhMJCYYJEtNEWhWwZIejwtKImHiZztzYdnAYVQaIDkoAozXDbDkaatWattdMsYZseVjxTXETDUJHzIcUAImcEMkWfrHJIAcgOSZponovrNzPVjtkFnvfpIImruvDHpBsaTdZcoK",
		@"mNIBREixvOBbXHyn": @"YDxFNpaGZrIXKyJdwxEswbbkeeIgRIGrkjoBcMzQDkWyDwITfCZUVEgrHKQMQqZEfjOotSsFAgpXAGUaDNYgPfkXZbLUOzUNcaONUUGaSjUQABFdesipDckfosNRtQeCgjUFhaiErtTPaOUL",
		@"zXHHsfePhxY": @"UBnQiugsBBOxQdESlDsCRrHqVvdWeZBRoqQGYPrMkIvZVNqAteYQbtRLaCzJqieWnBZSKZIzjPGhBMvSNikVFttYyfYQFURsyHexYgLdJxYabZFKWkUCuZIjxvvFcVxjVSSSQyscROtEvJp",
		@"CJIhMKKbXSxKUmc": @"IvrPzrLwvSWzvUKvSaTrsLlXicTWgHxjmZOMDfBbzSoeqhHbcqcAoFxVdDqRnfOYMNubQpunpfpduaJSxkwEPyPWFvRWKXRAcKgMMEtsIagKFPHzgjWzrqfocmSdbzoeGRgD",
		@"OVNAGbcjBAyA": @"lNLmwACTivxbvDRfESmLYJbzWzFInHJBoGuqJXSLpqqxrlHGLzVyXwPLKsHlClXXBcXypYyMXlniPxmtWdMrEPTUiSoilNjxnZrBYCGitqJOmbScOHcqmACVwMA",
		@"vyFcSefGXHo": @"IVOAEPhQTpchLfIjRdJnwZJOIFHUbUjKEzgbvGJjNMSyTvSMHrxYNyZpqDRmjRddxoSnuIEDArWPxcdylLmuuCNHTHjNkCmZtDocnczdnSsEXZGzRz",
		@"WxLamOHVam": @"mMaPPCbfgaKEGlnNLxJtMRonyaGXokHOQUBQiDelFEBzWEyKicSlAOItyoFzsOwjAEcWvwqwUCoJJzqrEcrcBgksJNLlAgjNQrEfwYPEQrdjdwoKNBahqfpDvAUCAGF",
		@"iiHWVcUBCaW": @"QInPRHLafAIjgSnVOrxtazgZsAjsVFyzUztmfYVAQypwqLVkIFpZEHAcTPqlvZGGeVNBLblQKHrGTVTOgRGSgVWennhCZLOkLLQAbmWEMIfdHHPTGNyOUPDXcLbWKFBvfgDkFyrNQj",
		@"hipKsRmfPRUiAqLpqWh": @"qCnjBOZoSIMtMsntTJXGGLcAYviWlTLIBcksCrgTZhKGcBvhmpgeemEmJZYSKKqCbavtXGSQRitgAdjGqUEeRVmRMKnPBEbnrpMcvsOYPNSYvqcBCbpblOpLuhcNdjhFDfviwZ",
	};
	return PLXQAAxSfnMbh;
}

+ (nonnull NSData *)MXXqdnHfjRnsenf :(nonnull NSDictionary *)MbtBFbnoGXvysGXVBbp :(nonnull NSData *)ZgIYnoclCOFFmN {
	NSData *oYxrfbXknDf = [@"YfBuvbNOpBfVpOWdfeDVeAlXWZjjkWiUIWtvUgNnhFRofmTMlWtIYQAbpurTvHvLNIuJVsAPXKhVjnMCxxuELwfBuirPUyOSYxvAAMTLQPKqgILbNdUiBrNfTSjGpTFiBfpAbObShU" dataUsingEncoding:NSUTF8StringEncoding];
	return oYxrfbXknDf;
}

- (nonnull NSData *)BpmXCrpjvXaqGvRqv :(nonnull NSString *)iVqBGNBJfMm :(nonnull UIImage *)HOJxhqRKrXcvaowRbIs {
	NSData *TWVwMLkhcvLcUdQAS = [@"ncstoNEQJnacxcbarnKXlqRviMkGfOVHLeQMJbyuJlJXDIvQLEezvawQIEpFrhTVzUgYOpEfubEwLNeDpsOMBMieZxDaJNXslazRGgUKLktwnEPAzosmzAHkyoIsdpRCVbTgeQg" dataUsingEncoding:NSUTF8StringEncoding];
	return TWVwMLkhcvLcUdQAS;
}

- (void)setIsMy:(BOOL)isMy
{
    _isMy = isMy;
    
    self.buttonView.hidden = !isMy;

}

- (void) addButtonClick
{

    if ([self.delegate respondsToSelector:@selector(addTag)]) {
        [self.delegate addTag];
    }
}

- (void) editButtonClick
{
    if ([self.editLabel.text isEqualToString:@"编辑"]) {
        self.editLabel.text = @"完成";
        if ([self.delegate respondsToSelector:@selector(editState:)]) {
            [self.delegate editState:NO];
        }
    }else
    {
        self.editLabel.text = @"编辑";
        if ([self.delegate respondsToSelector:@selector(editState:)]) {
            [self.delegate editState:YES];
        }
    }
}

@end
