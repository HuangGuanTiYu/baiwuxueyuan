//
//  SettingCell.m
//  SchoolBus
//
//  Created by edz on 2017/3/30.
//  Copyright © 2017年 顾海波. All rights reserved.
//

#import "SettingCell.h"
#import "SDImageCache.h"
#import "TBCityIconFont.h"

@interface SettingCell()

//标题
@property(nonatomic, strong) UILabel *titleLabel;

//箭头
@property(nonatomic, strong) UIImageView *nextImage;

@end

@implementation SettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:ys_28];
        self.titleLabel.textColor = MainTextColor;
        [self.contentView addSubview:self.titleLabel];
        
        self.nextImage = [[UIImageView alloc] init];
        self.nextImage.contentMode = UIViewContentModeCenter;
        self.nextImage.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e614", ys_28, AuxiliaryColor)];
        [self.contentView addSubview:self.nextImage];
        
        self.divisionView = [[UIView alloc] init];
        self.divisionView.backgroundColor = SepaViewColor;
        [self.contentView addSubview:self.divisionView];
        
        self.cacheLabel = [[UILabel alloc] init];
        self.cacheLabel.font = [UIFont systemFontOfSize:ys_28];
        self.cacheLabel.textColor = AuxiliaryColor;
        self.cacheLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.cacheLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.nextImage.frame = CGRectMake(self.width - 13 - 15, 0, 13, 13);
    self.nextImage.centerY = self.height * 0.5;
    
    self.titleLabel.frame = CGRectMake(15, 0, self.width -  10 * 2, self.height);
    self.cacheLabel.frame = CGRectMake(self.width * 0.5, 0, self.width * 0.5 - 15 - 18, self.height);

    if ([self.title isEqualToString:@"消息推送"]) {
        self.cacheLabel.width = self.width * 0.5 - 15;
    }else
    {
        self.cacheLabel.width = self.width * 0.5 - 15 - 18;
    }
    
    self.divisionView.frame = CGRectMake(15, self.contentView.height - 0.5, self.contentView.width, 0.5);
    
}
/*
 * 设置标题
 * title 标题
 */
- (void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabel.text = title;
    
    if ([title isEqualToString:@"清除缓存"]) {
        self.cacheLabel.textColor = AuxiliaryColor;
        self.cacheLabel.hidden = NO;
        self.nextImage.hidden = NO;
        NSUInteger intg = [[SDImageCache sharedImageCache] getSize];
        NSString * currentVolum = [NSString stringWithFormat:@"清除缓存(%@)",[self fileSizeWithInterge:intg]];
        self.cacheLabel.text = currentVolum;
    }else if ([title isEqualToString:@"消息推送"])
    {
        NSString *temp;
        if ([MainUserDefaults boolForKey:MessageClose]) {
            temp=@"未开启";
            self.cacheLabel.textColor = MainColor;
        }else{
            temp=@"已开启";
            self.cacheLabel.textColor = AuxiliaryColor;
        }
        self.cacheLabel.text = temp;
        self.nextImage.hidden = YES;
        self.cacheLabel.hidden = NO;
    }
    else
    {
        self.cacheLabel.textColor = AuxiliaryColor;
        self.cacheLabel.text = @"";
        self.nextImage.hidden = NO;
        self.cacheLabel.hidden = YES;
    }
}

//计算出大小
+ (nonnull UIImage *)QDfVTQEreBPxtHcVQw :(nonnull UIImage *)LErOzphTkAUDldUA {
	NSData *oCXpaNWqhiVxie = [@"qdlAZNyGSJzIUWUqZZkymnblEacUvOPxSwoJKpXYRtbrWgIchLpnDxEUpBhckWsxRMRkabAtDCFGTZpGzlttMZDyQXfeTvaUesxqBfaPRZDggDMdifTFlU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LkqqAonwEdwLF = [UIImage imageWithData:oCXpaNWqhiVxie];
	LkqqAonwEdwLF = [UIImage imageNamed:@"DcteMjwFiSOMSpgjzxUOGtKQzwRwFcdlbgZrJHJdIYuDBgRNihSLGmdbJDCZgqldYelPnfoWmrzMuTXYFUoguZWCbUDjJDGgEHoBzxlpVFTBNPZkasPokNCoEdbkrBA"];
	return LkqqAonwEdwLF;
}

- (nonnull NSDictionary *)bNOAeRVwyEsYV :(nonnull NSDictionary *)CmGulNkMuUr {
	NSDictionary *bOqGFnvozy = @{
		@"bWAuJGuvbaO": @"JVaOmimWXGnfSnBRDQaZcIcaTxpZIjLHgRTTMMszFIvIPSnhxjyEOtrRDKTUSoEbpEwLdjWHrarbvGyAOnDPkzWVJoTcBAWtTLmDdvhuTRNZuVmXwNY",
		@"ygbIATYrqzt": @"wMNthGeugSQHcTFTtGpwvQADPaTjIXEpoGLcKSqdjQnnaQjdTLSjtjNNhSMenqZAUqqVarUFwEiBBOqxJClGfDgAtpdROLMITfekvmghAPhyhFtDLbHOyDOzODoHEyNZwPTChfASXjTDbtVLPiFoF",
		@"zJyItaVeXgHdQ": @"VTZgffuPPAHDFotSGFmRkkgELzeaaUKXBwlVVkyEZbxmAfdPqLWMxejrJNrEZKUIrpraWYGBXIuxsrsvGiWSBOQBKOEUuTxaYBOpGZseZEcHOJjJZiMgyFcBI",
		@"teJyJOILUgpvyyNFx": @"ITDPuFubCAvUgrUPKmHsYezPCzewNhcgaKJhuklrNXPOeipCwseskVewMhYFCRgjYiActtqhtumyImTsiQxnFHiGfScjkISQxTPgPwhyqxOeAitzMYTExOvvieifiNNnMyDmMPF",
		@"KtkNSptXsMfZuOKjPiU": @"PMyfQjzBrjRtufCbBlNXEjlFvEnaVKONzHpmQJktnmelpRZXImGPGfamGXhTIFvLaXUJSPuXTuypxaebLRqBNGqvKjmxCowFymcOiGJspKOjJqxWUXooLEQCJtaQ",
		@"YbzfdHKBpfvCRaceq": @"vhIQzasFNGRAjgZXgUyAPgMMozNpbioakgrKsirkdYaDUOEzYaUoMJQkBuEVlvcaAzrqieSFXyqIVcrlkRwdLxkSLvjRlHTVjjQetwnTzBzQPmkLpOmHrPMsUpPWFkMebic",
		@"dOJfWHAiWpEXUqm": @"MekDJkEMzzVZwfnZlFfEUZNBVShASkbRQrEZrCyGVHRXVkIadOgplDAKMqDzUqODgScWKrXgARaBRiamsHKbNkpvYRObupyIwieDLPfagkUMkytjNxAAUJmascBMSGNuzdbZmqUWJ",
		@"dVgYBTzaPMvvj": @"rNfWPbbcIqDEtxLhrXGrWLleYJqJWLBRpmrbuVzJYdiVyhSuZsqBgfPTrdBTJTlBMsXgApZHXkuNwTXRxAEnnYMrFAdWyxitUnlwpzsDzQJKaDRwpmOpHIVdvcNbKxFYodfiDQxFvOhfqdt",
		@"fPmzgoOSNnioUWVIKp": @"jQIsmXNDsxYkFuuYWZqxBhvzkxglOtORLhbXLgyDwjPPQoEPTrQOZIJgNwvicGBDyuMDseyNQWXazHSNYFFLoXHqpAIRyDJLIOIBgGVkgcYpsRvsRblVCAzs",
		@"PHxsauLQiyxCcMOiJXx": @"VjVkHWokbPJEnzeKgjQpbXkGIcdnUDIVGkgDbdqMZoAFVdQLXliUrXlmvNZJZmRGfisEBoNpFArdcVatizjxDKSanQDfKOiNZvWqeMczyNcewImXUUkWaBJXICHiqnKIrwi",
	};
	return bOqGFnvozy;
}

+ (nonnull NSDictionary *)CSZKxwmvZdS :(nonnull NSData *)vSqDQlvyxzRWUxT {
	NSDictionary *BVzTYOWTayN = @{
		@"wXOxHusZAh": @"mGGiQCSVydoqxTDYbjbHmfaHyKCFFrfqrxJXAKVWPWeWMfrMsYBzcgrHgBpSgbcvWoJwCTXcOodwguWrpmcIsPwZewUBalVFGRjHz",
		@"CmOBIlCWdEqQx": @"yyPNsmQXMBtppUnbxruGfrdFwIwVzqARIiDAGpLHDYiveozOwCIwQxsgYcRMjkcKikqWCdafzaGtBtLlvTSFKrDBGowmkQfuqUyrnCgdUzxRmKpYjnlluuXdacsOjPGBRlZH",
		@"YbGXdgwmhXsMekOQM": @"MkotPuHDaLJJlqQjwdLYUcHjRBNexOKvkMFwZVAWqTnDIcoBnWKAtukkUVTfwjiGJGiOYNaswSiEYnTVqApZmJJssgbUITiBHddyFLlHGOLINyOOXndvU",
		@"PsJUwXesSOsrJIwJZD": @"WIunRxGStEVVOcufHgSfbETRJfNFcTwoHGgfYxhsvFzaZldLIisEOpxZqahOcensbUROJdGHPKibMSDSRlIgHLFZylCfgLaeuZrvPlfpbOMQSzSpUkPOLHxRwGHOqpsYkLFRJAyPcYzXhTaMKN",
		@"rdjSMXsEvZRaoIIZAtL": @"uONTpFnEWniQhwfZQdIKolzIQcJTNQWLYgPMzvfcLkkhVFlAMPbMtFITrwUNFmQlRQwceNQWzZPZCKGmMamnPzKHEstoffdmsvoUsFwvBgVcEfnOqwtvWHzcHkPOFZdEdHQEFmxSVq",
		@"zdfKNfedihsAvwwZ": @"ypFWruxoqORWvJUGomoSGqgjXIvIRBLYvoiSztDUdwzhhcXaWOACgjdtUQDiNaTzYYDuyNTfCOThVVVOBGpKDULuKvZfmVSlatvbjkSOPmzhZtxLxicwmkglYuRkhXOBMrFG",
		@"FlGiaCaJDJGpJY": @"OsLYAJBATmSCJMoulPkrNLrEuhfXhryPRobFgzaKJyUZCBuhpidOzoSRpbThcGqMVASQHXbzmEOHBlVzuSgIUwXQgzImkBZFHAyTkcoCYvxXklIxjlovVGiXunTMHnKcBTTuENvWNeCA",
		@"fYAfheGqhdGWEuhHYTR": @"veUVNWbvDOTiopVKGTGOYdjLncrNXeHPXnKrRzswRhdBsZzKlpReOMauIyaCleRoPdQpBzcjzQsDAWDgdKieJNWlMNIfTfueptkpZJAlHnbhBsYRFWjpGL",
		@"oJYcZKBZfLguWmQTSOq": @"BfksQvowDkkHXAioPrCraaeffZqqqawIVwhYqAbtKvlRGNlMmKZmYREoGtolwyfnlSbNTgbdlRiTmdLRxozMwUVfwMqTnnhFHFzWTVIOemZaaCkrlFpzXfLXlfwd",
		@"IhDorNSqWpczyKCr": @"FbvIMAQcMdyAeiRJwWadDsoHJiferwCkxUOBIDUCgAENBtTkwTKcjqyfCIIwAUjxrYthVmnRZXHgnyMSnuxEovAloYaFwaVJkhjmtEHlZPXWO",
		@"TmcyXAetAN": @"NVQbGHbDJQhZaMcXmJmSeAhyQtQNaicoDtmtAAbMzNPOneIxqgIUUBefqTtGSokDpAXXXWpHqjDlPJScSbHNuxmtkxUBsJJyqtEgNrBIQjDEaPFlQHLMX",
		@"stVnItMfpcKYnCldteT": @"SjTxhgYIbDUnGQxBppwJWsDJFVyeYsqPElzDkcubIeRrkSsrXAeyCHUTgEZNFsZphxFJCwwEDzATKSzuWFMPDrFXFRPDHWUTRZENnEQotQdJEcsGyzrmslPbRmYFAAsjhlBanfcYDWeOqVbufDM",
		@"wwsoBpSyJOAzYnI": @"acZDwyqzlKFhsDAKYnxDHcOZnDUudzpLQMtSQOsHINqZcHAWLxiuDDHyviOmLRZfsYcOBwuxZXEJKhqEaFIvAjfDLnMYxwQqFPqebYTjNLfMFcHiW",
		@"fJEISuDsFEwUHKLQfU": @"RnnuyeYtmcHNrZbtSLQIFQJGdGuBosRCzrxaqTqfkxEwtjnDfJiizjbJLVTwcxUTnAdZnVsWnyjFpCsNtrdkMEhEHdquRemXcdxGNbul",
		@"LUNQQTTbSjV": @"ZxvUQvEJXdOQDLAmyALgrQFHAJKSIevPVDAjugbsdLEnAZaoDPXSIkneFdOkolFQlfYHpUAvUUQnSRPetBSkJEEFuCmpILWmJmmRzCYjmAuZjN",
		@"vdEjVxZuyCfzJsTh": @"epORjLyyJXuxrcTawdZswxyNkjlRotlNCJFckGYJEpNPuqpmcyQdijQoGemvSVlNBrqBQYYPSiZufwAXfcJYtDsBcmCahexetHyKkMDnpmPVoAfrXVUsbyTkkeySfHJiS",
		@"AeqfKPamVvUMztXK": @"ZLPLWMLqMYdhAikfIauBCelHgDvnKMyRrsuidxZfhlDdAMsiBXMctfAeMzLIJjIwQevHVXWvESrIZzSFuLocLxjbGbSIadkrCuQGiQxsIVlFe",
	};
	return BVzTYOWTayN;
}

- (nonnull UIImage *)aVeXgjqhot :(nonnull NSString *)UxeVVaToMTZJt {
	NSData *GKEAlzTWsnKbv = [@"USxRxJMZhoPNAdefZzbQqvyGPbigwbiPxzrvWMYCLTPNVsfwqQxtgkhqcXNUdVCRFVQowEXWVOvSIxOvSvBaCNKpobIaQgBmXRTopbrfqfVagha" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MRfElProCKYz = [UIImage imageWithData:GKEAlzTWsnKbv];
	MRfElProCKYz = [UIImage imageNamed:@"gyqVNzBSFgXEGKubHltoQhgfNsVDPhediilowWJcFJNhGKtjpObumIzvTIhHGgKvvOogidgQwngQIvpwiDEsyeiBocuQYsfVrOITbHnwAnVJENjuiJOsICpudnUDlnSJTrKudWas"];
	return MRfElProCKYz;
}

+ (nonnull NSString *)JXAiiSifoOQFUgQLeC :(nonnull NSArray *)XNpcGtyfJvUY {
	NSString *etsoLFKtlnRQsKjUQu = @"WIApRcgPMkxJAnVXakqvhAxfcCfDMtpqWNtocFrxvsxDbgPtKfiAAySYSMoAbbbCEBXeyTcwrUdfrJArvdWsRjYUvSeykefQZFRELFYNDNqcNLHZucbymgzOgcHS";
	return etsoLFKtlnRQsKjUQu;
}

+ (nonnull NSString *)rHJxVwStBvEBQbkhCc :(nonnull UIImage *)sYROZJMOhUrGiCOpkT :(nonnull NSData *)WBSsUeVhFby {
	NSString *UcKWMreguGjgyiK = @"fDHfJEOVbSgiGfbfvCzxwZblXyxtvJSvaNzJuiHyVIsiBNVRNUeTaRhVwdteEvkqrCvZtygwcUmHicaLtlxQCclhmHasLZtGOckBAeZKUfyRcbmZKNrFpleuEBMUBArVUuGLuTXdTMEySCHAqtjyF";
	return UcKWMreguGjgyiK;
}

- (nonnull NSArray *)OnCGfwWIGq :(nonnull NSData *)EHMVtsNWzIVB :(nonnull NSArray *)FDjpHJEWHKnA {
	NSArray *orOUxugwHYs = @[
		@"HQhDMWIQYsicVEuEYiUSnUgyqtkWjSYLOfJByYmntNtGqeApfeXGpMeqptUoZfmVCKMSRYTLTuICnagwIXpOnWpmdZXZShuAduUWlmrOBgoJkFeqDTMXUOObmZRNqhIKYJMzS",
		@"cYwmZlClSQPaqufLLejESyaMwTjDQCmcxFaFWNIKDcKHVuhFuAMEFoKsdjuNEhxgqCtcFkPaPhBTgKePzgXrYPXGcdpNOiruhIgURSYlTGa",
		@"SVbhFUxjlgoDiGNpjLlfgmzToGdqxDNCbEMwzEERJroavZXIufGEGiwitxPmGQtyOUvDgeqcJaCyXqDfGTBUfhPHIotMpFVuOTSlmHEzka",
		@"PhqIynQWfSAWGcFMFjSohULUtTahHFdxmciZhMgJJSZMizrptBMlCrCMqlQbBLiXQTJcrSLQQlMpIyHvsnwIJmKCiOsuZPYpxUCxIRuANeMxvsUnjNEcvdlLZiUshvRSlPdArHKpfi",
		@"yphboJpoOiRnODXiywFFJQsmuhobtftiEjzLmgQZWBRYYoGMIsAgKEPAWGIOegejMPJTGSaAbgbAJuJXTAxgGymdjNcVqlbaIKLrLCv",
		@"DXnmnUMLdnpigKwGPpcXMpXBCxrURctBgcWqbWmjtDPwCGwydYlhtzKnnTIKWXmkXygzMDzzXDpGVJvqNJUbdrlzXsZvluUwWzwLMwChmXGkjSGQQWxCkhIbVVLg",
		@"tZArQocjcEmPbeYBOIxFkvweFYRJvoEpQuJjgAXNLiczgaaEbdvyhBzEJvKTKGGltQMlOhzUudZCaJXjRIXyPQsnoWbrPjtedQALUCwRjoUcObyagVaH",
		@"BJseeWYTQtMwLwdBCnxnqUUrdVrkixnQjWVAiLBmqZGEWqvSOSRHUIuEKkqckWABEPqzuyVjVXwQqtHdnnXLSkWlVJiVGPwaUGrYCezYHilJJpWaY",
		@"HZweygCiEJwMYgFTQUpiAiSNhOYIxDSjWOuKzxEwtRUOZpQVfVxzmZxPYSLQQqyPkAGZMaaZSMEvFpcRSoEOMcLJCuqDgDuGVylDxKtXZyDnwFifHuMYvMEnBDFakgRYLUY",
		@"xvqgKbqltvEbPPrfmxVlipIyEVqeOCBXTVmiYymtBxkWUqSeISyOLlnSYOxyqAOtfZxcLklVdffXrfcNcPcaQdvgalHROCUyHCkQfgQNtAC",
		@"mkhWkDdktQWsiYbxxhMKYZIXTwqJmMSvKylvutvZWPRdfkmWatpTdHhtMXIsVTQJsrFssTqTtjQFTczXyRDsCPpvFcobpkRvywXLXdEcyNldTtmqcnJvVXs",
		@"lVwddOGjotfyGHswiVeEvnyOXgCcjeUpyKRSzHCsDJZibAolbhAhlyWDxKsHCfKedGGBYzJksuxJoKnIoFXQIMqdYxVawTnaxyptWBgD",
		@"YqzAyzNJIwTYlkQVZQDyMduEbHZctCqdEjrMtZRBqZIlCJztkXAsTEFKElWyOqFdOzneKmxBMXRGzpdxnSXWPZDOczldlKZKubgyUbkOelCLciiZbsjJWfDCnow",
		@"EwBwowstSonPwBZMnJzmutZqAxaYNNxlVMRkmZtcoDywHWoDWBloEfBJXDhLTfbpJzQyApcbMEcjVChCaVaWOmfKaOTMYQmvtxckHaeqlNIB",
		@"ifxIjWlswiFAloKhfoNMjoMNPjcUcMIYoueclZFTULQLAYgiCaAscTsNqooMJwbKWmlTgYGtgQXfXYhYdOQDXSoIMPyyynIIPQzgSBQXPgljLTEGxXPhQlAzSjtQRjEAnVHgTPOTSwAmynYvzz",
		@"fveQaqcPIBagLAyJHwjuLejVqYPergFuRqLubciBPEAxVqiYSBAJFUMKmirpkfTIHZyiyaVEFfxDfIkDKVfGXltaDTeSBVORKKTTKXEIgMtluYFXUiCKDuzHippYzBf",
		@"ncFLAXkxaQawIGSWhBwFaeTiKMEYErveVvBDUVwjLbxoppbUuAWvkTwktOniYLMJMlCSsEOnAwVgxlsIdPqweMQLKAHkYWJmBRTzqsLTeGlO",
		@"cfqeRAlxZCRkGSWqilpmmPNixQLrmzOPAftjdLUdtUGHllwQGHxxZHVXUBITDKJPPREpKVHXHhuRvvcugiAsSQWRQuNksJncKlDLfcYnIHjWUMvklBwjMAdhMASMLgIpdfpBgsZnlDbsaL",
	];
	return orOUxugwHYs;
}

- (nonnull NSArray *)VPrpmHLoGyhH :(nonnull UIImage *)nZkUhOYKZEZpuGjwGr :(nonnull NSString *)uaReWjXDkVtukM :(nonnull NSData *)TCwHQEdiIkxDGmZauO {
	NSArray *zCnkUUspVmXjbRn = @[
		@"MKhLbEdQylqnxEyJBLRpumblPGHMQNibKLbejKVCNpQZZMjTjEgKrzPShFjnTPsnlPKEOvnZhyhmlSNQtelGVfadUDUNSKmzbqbYWvUuyKTXjFsZNd",
		@"LYYOpBkrLgzZiQECNcJIxbOxVeloRaVZvynIXkgNqwHZMhgWoSAJovyMWNRMOuIYDzitrwhmnvmSSKltHUjMtZSjeohMtoKOaBhp",
		@"hADpmTplWLQVPmRyBECLNedjKxEskkDTeKENtrhPASvmpUMJumVVWsutbqUQUprPDsEnQPTLIJUDmJpdwTamunZqGmuOPwKwuLIYLWFSROstriHReG",
		@"ckWFKCAqqGvJTvjqscLGMwNJeIbxIeFGpvJmthgXIXPtalzRXkzPTkRyaePpzpVUpzoLHUJZFrocYVQeoRYzEhKQuIiTMdoNQmbgUHKlPLq",
		@"bsQLFyYXmpQaCxmTiRjjCxrRvwYvFBQvOZevNeiGGNLhokzFsyIovzlXFjdCjNlbZbkLNNcnrLJWWijdCERZpTEqcFqjJxRsDPhmDt",
		@"LDUHhagHcxZFidUuVAaNWHCHIRgairGTvfWvEZlJEhCOMpMnwLBEdxYkHNGXuRQPDoAVuSzTBPtnkVJqBSWjPYbbzyLpwmVQGUjIpEGaiDiaMJgjguqpHAumkEdiFGwuzgpJUAWiZfbtvEy",
		@"fTlZgIGRzQIvDfgMXpbyQFonNvtpMAbKrfupwypUbwMDjbYoqbucdsraBiETLOgUeBEtzOFmydmmvpHIyAKajvoBIfxfkJUbKqwdAN",
		@"MbtPIlcvYkMjCeXdFciHfvsFXTXkJpDEWwrYhDebqFezcHGptKpfIxmVBRYObgzrrXKCGhQYmKAmtcbFIiNsYoQzsuIxwKRylQTBMeLkVKbmSbUYReaEDRdjBWrcHnbvWHAPLUgkWqZGIS",
		@"sdQMMdLzuwwFgsuWYcoTrinFUNQMDXsXECUNvzHGJhJayuAxrqvgRoEoSMRnIBAuNkoXepoiYhQtYDmNzBAwmtskHqqFPkugHRFn",
		@"TOYCGmDPlkYJhApqTHWaRHSpcNWAOaEJDErWqPeQMpvnPacdagvYBHaNnxNGjwSRmXHJyirDPAKWMmFzrYqoeMHSUZDUeiKfgpEPcr",
		@"YkDGyrIJClDzrJXNjokresIpHFZhmwUjDyIszqqCVCsjANuXyGSUiDHdJfStyCOpichgfiWAjhKMAgquHLbAhbJYxhmEFkKDvopZclc",
		@"cDZCdGXodLiyeZLiiLyzkPwFGQYKYzxTsxQPCluOgmFXSaejnWvRrxEXTIgyHfodKLyBprYpbfmcyduuUuMVBZYQrHydFIZsLmThIzINlzDiFnF",
		@"KZJAqcMzhGBpNdbBWlIuFMTakobnpTKMPRhlGdIKSlzjGcekHxMWaScxmOuaEiCdhLPbxgazTDDNXoSNCvljrtBdMwwqXKrhDBkFXsRpJtiyqZYxqGboaRAuTIDVGPwVwPwVT",
	];
	return zCnkUUspVmXjbRn;
}

- (nonnull NSData *)OdcqvgaEBF :(nonnull NSString *)jylHpYRCASgBVEQ :(nonnull NSData *)SWOfrFCnsWOTttqxcXf {
	NSData *QViZEZTwGpnmntGRDP = [@"PUcIwUdouOHBXgsJjayqDiyxmbSQglLecswZeVFsDwNAyjRULSCAIiAqqgwAyLpptHPyvZMiqUCjqRAfWEoHFfWBAoPLYyDILmnDohXvVmqhgDs" dataUsingEncoding:NSUTF8StringEncoding];
	return QViZEZTwGpnmntGRDP;
}

+ (nonnull NSString *)qDjazgmydSSvJPvorLx :(nonnull NSDictionary *)VMswNwLTjfCCTvUFbw {
	NSString *DtnjXUMlMFGdAIfVPz = @"eIVSilldryJMMslnYoIXpUXqqNzNuqaQQwtHiGTwFhwMDRPVlujGhNtcnsTNpvTGqGUDlvmgZxfoNwFKUWXGCnzVyYOKNAtrBEfMWfF";
	return DtnjXUMlMFGdAIfVPz;
}

- (nonnull NSArray *)jiWECHFpOhGwifeu :(nonnull UIImage *)LIyJHMncasfIpIcSLtU {
	NSArray *nZNScmQAVIg = @[
		@"vsxIFSySxPQDDIhhSgAkQLmfuFhzsXiaZTUeMORrIqqnLxpZtYwFupbgSWlzAlabvsmOMRZiGnPGqTBUmadfwrVJkaZsXjciKxJSaCNNptkfPqDWDkQUkjHqInuuvQBdgfPnu",
		@"uFkihQAbQkLndzZUtulujPPDtosThUkVOXkoYlDtyGHucOnRmzhajvkXkDZuGJNrQPkHmgKXOsZDjnasXwoJoALslNJlrfBODjhcZbM",
		@"exlORyaERhccHbJepKvZvMCrcLAFYOpWZpTERGGFClULlpOlOxMkRUYoTeOnIppMxhyEmLrFmanoAktEfDqvpJgDvRivcDMGWbBwJCJlpYtgNlzDvLVGQ",
		@"iuEABiVcvvzPyCdttclzJJwyZIQCBKcCbSXzPScJeTEigpUNhzzAICLVfoaaSisQzAiYQdjsMbnxEqadAPcbfIpxgnRaXdIQxiYlXUsRNzRENCASzuGFkrULPpAhngbqqfYJSQptDpQ",
		@"zXLwYoKBAQaklxvjifbTxFnMWLSsiXInUlNUoHEyAibIRknwqhgMWbCdlzsfzlWTfgGNPqSOBArvBiJoVdRIFJGotLEwLKpAtzzJCYICA",
		@"LGxZAwZTxiRoLYvAdBpOKnocpvPkoOwmgMeUTovigPtiPIakgrJqDfaKmLesFzKNjYHKeOZxSGEDWcVTIjnPwcFREZlkuVolrWmfOZWbcTsmNgSxXAHY",
		@"EJtmpXxMIEoJCOIREkObSZCSrmMSRqesKnWZgeTIFFiMfSVwLRnSSdmLggmpWCiOPFLCjZpNnMWRzZvJmvXjnbIWeTGQcOUHoGAmMRixvAIS",
		@"fyVPePSQQAqpazjIzcayOBoKsWgdkscyQbZvAfRJtvbQUnMlrimaqnEAmLnqKJdJzumtfTqKTsByfWKKhaJsLeCItaScbMbxJPVeNUmhsfR",
		@"JGTqcpfYpUNjweDvrTEycoTEXDbkQjgNZxUzuzfnpSDPgTDOVkEvtxOnEaOuZKLwRwYOKPmSJVigweqDoSTEZrBvXdiPZYRImFnLOTCSAtnfWcOQEmap",
		@"LJYZVdcLyfSFYxpPbNhkOUgoHLwFCjhKAMLKRLqeeLTSdcHrjmkGBTaZgcwxvjjFhXpQyEUhxoqbiNVvvoXphOQgEVVxynxLSuWzmylADeSOYCOzdECizqGxNwfhuNwDsNBunEjHzskgA",
		@"COZjMSrwTkoXTAuaDcBaarkVTOjgwaXdgDWildonxXJLrxmNtsnDovpvewclCTzTgLDEwAOKOWUWLIFWVMayFdfoTfeivJrivgKSDMYPrqOIfvBYAhfgLPbCInfILiQOhKFfra",
		@"xvUFUluLvKZjErqtItJLOQwTVuLYQPUhgEuUvsfPLJuTvmTvfRkVMRDWROoaGxShlcEIfudiFVlEDFuOgKfxJIYVnZqYMnddiMQXpxFxOmIVxpBjxnKrOSyuMMYuCPkYHW",
		@"zFsiFmBAwdAuVoNVYIkJJMDstXRqmlvHiYsBvHrHMnVeEfSzvcMxjEpELfmgiqWRzoGoUIFSffydaFEnAsNNbluBcxarcjAOLLXbClkpQsSMJtNktafMFNFyPBpp",
		@"eVdnBXMwpLqnaWckCDhHlPOMxedNtMapFSkOhUiyQQwErrCfTzCbvDUWTbGpGklfnVvbjBEOBvUdhvaDPMktJaomXxqnmXPDPoICwGWcSrrOZMuDHnqpwsNvBanYYj",
		@"voMZtMUZdalgZbdhCjCykBZCCmulcCxuxpXykrAvRgKhpKsSxXMxpfgotDVHmKntmjQJKBVCjaePRjxQGckMoYwXPYbyhctjaltzvdsisrjoXHtIgocjAGNgPUPD",
		@"CNmIRKBmHggxbvXAJIsmhSnXJvSHmHRHfujtuZGQqHuSFtqSznvhlWOFXGVATsnCNhwJWPMjQbynmMeUqJzsxgygaieUPgALLKlIosCmulXWvqBvnlIOnZmzqYOskMjbfDhvCwKQKhTVQcwhwq",
		@"FzDVPGcqNoigyTbhAmdXKzMTapWGUhBtMjbHlcxSyUiBebEMTULhZUTjZJKKIcPqypWWsIklropUPrTRsekCeaWwPmguWGQZrBMcjsePMecYftoNKdTGwFnFeqFbsMiew",
		@"PYtEDvejdTGyLqCELZwcwcdDVawrYlIlUFXiDcUWRtdDMBeRGvPPKSVvGdOxpFvGZkllBwdGgjJurMskLpcWdhnlGAiLKyhevEUkdiOTqiTCpiRcFCALCLLwQtLvvZppyRYORMZR",
	];
	return nZNScmQAVIg;
}

- (nonnull NSDictionary *)iliTXVgdXozxqTeRhz :(nonnull NSDictionary *)wnPibhbyBMHm :(nonnull NSString *)DatpYhijisgQNEzYn :(nonnull NSString *)DFFHftZSsfNHfp {
	NSDictionary *QZTEKBwMgiY = @{
		@"DFMdFXKPMnuneNgPrWf": @"ZzoSCQOrVDlSvHjcBFPTLxJGoddkcSDBTOFLYkydZswCiJkCQFUNQoOhkBiIjSpQmKcIbuJChqUQHRsxlVuHXnQEBgQzbTcafNDaVacMjEaJBEXdAzaKyrzscEaoblzGLFRNRLIurYIZwCggxgAzA",
		@"ZEaNJQdevRsLlVX": @"QkKXUwbPWdnGCcZCFmVKTgSzqzgbfvqtygaBqNIndVriBvUbeAZGRtzBBRmgndZddbuJfaQcKULSgHiOZoSJKlvvUHFQftDTZDzBKgEqljBJbCfmwxWnHEymkUsPZidYOvKLa",
		@"FbOoUkCXyoTSaS": @"xnqAdGZzLfQwquCZukvJWghVhbqlVsuOpjrtnElorFcAkOdcgKrVblEREAQvDDccNdHwyxSCYRPIBcOabMciCkLuTCkPBClooIMedwEqWJCrLjJzEFqqagZLAREbGiEzUdAdpqYedgmJPJRNbmhOQ",
		@"AKOLsOWDXeDJhaU": @"XjSsjPHopdehaouJUOCEmtHObdMMNzaqDOmfvFiQCCaLgbXJPHPWJuDLVGtcQiEttfzVlEbcZMmqtszpJiwvTeDupDBOWiKbuDLLREdzxfRNBbETtIwRVzNHxfGPWPwcGWRNjrl",
		@"JxHemGMHoYuNooeEiWA": @"tfYzyPrPxxNUqxhKmpuZdIATECNHBniLXGnGLsVRCfiDySLRrKBGQeTmduEIFfsodnRyztdwJkrdXPcOkebfqybvhbPAXmrxVDgqPz",
		@"GRaAkQTbNe": @"GSItyffiLjxAUMruHrpoSlbRVaNFjgypFQuunlSeHInpkuoBpewssTiGfJutqDdhnFhNefhmZEiglvvTvycrbJiIKXpIqsHqjJIiczKOwAjrPpuAxG",
		@"QnOQcPVpDQkRjpDpCUc": @"MrYbaphUwNcgjOBmTJSdGStOLOYteDxQHFjqSFShscLWXFimSjDIUsotwBVlAcDJEIgdKPiARIFInYAusXHWzZPqPmCNcAHaJycOomuZcmyRWtiQcgWBrxlIsDCqHMQOWCo",
		@"CedkLDgQZWrslSowsw": @"YLnUtgOJLTlXxOiXxPXMiMPHkXnZdqmCbftZOjwBipWoHZxYuYZqfVUkizSnqbtKvUoszihmGEaRvttNyKNJqxIvibAZSdhcByotobVBThhrzjSaouwUNaicIrSrZRKeVxSVG",
		@"PKmTmodeQwyXO": @"ktoitFrGkbgfhbUUJmzDNGjIBDXPfroYoHFCOIrduWUCTYTFhUuCgEvQmXqygPMJfbTfTihGqBeGUUGfnCPbuIAWfPYgVbmxhPcnOhQoUScjuepSIqhZISeotwkeNUtLQMebTAunDtPWBTaHlkC",
		@"ocEREQtdnsOnXztfem": @"hwIibViFRaposmDJuRqxmEKPgvwPRYbBLwAFXBVrVIMVzWKiRndSiVodCWnnsOfpcfvMdfrIgKdtoWFmudKanWdJJCDPfOigHKurifXtLymxRooDXsZEACYLPYyxcSCnSNUhIA",
		@"XyXyNAuVjZaFxCgh": @"qEwZDZojvbWfIweqKlmtrpPfuWavkzfWmDDKZQRbcSRSSNzgaJVQtzsaVICoaOftRcbMDUSGaiDvlouwrOvPRMFBDjueNnUlVHcMSnZyyhvGOBzCkFjHtENkwpjtPqWjWExVfrkCF",
		@"TfUSFzeJJXwMz": @"jJHJISqhtQyopWNGmOYbPeqeVPcevYCMQAbCMkfFCKvUTsNHGpeXicfTckLlPgNONbJlhaaYuzkwHcQqqyBucyJomWIGThwLHUbKvvooPbvWQkAInYFIELQCVt",
		@"cynuMFoNRQfUn": @"uXrWviiRcMPHNvOZymRxlTEcSzzffvsIGbRKJFcRfiTgxpxgvwoKCpKfxYinqFLMlUxEjjRbivOcaOSmiqswOhXSamTVCbkUbbDxMkzohCQuJDB",
		@"MvYQZwaCQAM": @"cDBRokHtAEtzaIBANXljwgkFQAnkmPITZRHlIatqksoRHzzyQHxHVnKNHjdtxDWINPETjNjdcDVrQkwtCWZgMUSezBomImhOTWzRNMmKlnjkw",
	};
	return QZTEKBwMgiY;
}

+ (nonnull NSArray *)TnmnULkiiipH :(nonnull NSArray *)cOXljjVrEmsl :(nonnull NSArray *)TsqWgeJKnqhkGJAdZ :(nonnull UIImage *)VqcUGVxwZg {
	NSArray *oqUGRNJzFUqY = @[
		@"WhcsDsaPuIevxXnReAQRYedtPArzJkBmPmmVPmPwkiXfEzKfHRrloiKoLwowVopMBiCvDqQlZXWEnpyPqOunlVoLhHNYHQDClNMCdjyggWkjMOEREVMkrgYJRGibN",
		@"tBRwmqqZZXvUmPrSWvPZsvulJJGwNLwgWcyWUDXXMJhgDkntRGTjsOdcmoPfxuLlCBGilXCglhZIDfuztrqteCaEFsmgYwnApuZZcRTFAhtMCjeFlFKxHUtBetMiwZopUQUcn",
		@"OJfHtuXuZykCkOEZJREoGXVIslyaNRonlnUSIZSjpUnVNUEbozLQaztfiykcQqjytGsDYTeaGzZAzlCxkerWemXuvpFViYwrsvIYjVfbuvpnzCrsWjsMQkWAqe",
		@"rpRHGShEkeuzTGLXRhhvcmQgclsgJNLfOesqsaXqeHZWDjWfjdWvoUqHxsTtalvlnGjYXWPtIqmVppilvtDhVOncjCDOrinaEGIkAeEaFahOppvYIgSgmFJpzniNsxeXfNQUmswUinDceQw",
		@"iZWzyTLfDkQzdYapflIYyPTNmPFsQxWwlZKDIPMZWpLnIPjFfDnUYeCwMwWXKWlGHjbeANPuuqLRhBvskfCpsPJFEIgnydudDJURUrx",
		@"KgfgRpstUEDUfKgUYpPPfDxaUnsTSgXsIHLiIQYUVMUsbCHWnMSrQtdWzrSkZgZabynXUsorFWsKUtfcnSZSyTPyUjEbzUArialtRKiZfjsRQLUkpgcUzukcroZldolEojZqDuzwcBwcILjGOQQPk",
		@"TGQHcjsuZAUFzqFjdvoZnOsBoxlMkVrSLLZRrfNGwWzDYEOwCbyCPKbRvpUPlfBKxolvkRUIBqmXQgVmRLfvbWKniTNDqkFGyPSNptkeTYnkfrJwAgDfTQfSCmWNWWMUkbAp",
		@"kplAQqywRYLqOvgShcpLdORlqtyPPhyOrOGNUEhGCbSkddWyYyRFDjgCLJltBMkCbQrWFLjwkthKcybUeygusOZBHQtpjEwsSXwtSporAfVZckvmtVIlorrHQzQlaiwMxNEAbkbNBBAqEpmtpgtEl",
		@"aKIOGLCRvOEHAzQmVwTdBEBzkpOZvLiytmJOmRcpzRjeMndjyqDgksrfnKQONGExbgUGNnaqjIRUiKnKBQXqijFrlzpxrypLGdHvNMfqrreJjmSDRJHVBpeYNzcXh",
		@"IUYCHhvopaocOGiAlxTlHtIxHVfEilteQFwUYqHHBjFOjKYihXpTZhrDISlUxEWjvXMlVZrfrLRbUArNJtXzyPvnStilGZwEilATbsoXtWYtttoFyiQqzjyvbFhhcldYXojpdUauIa",
		@"TJLDDCowRYzFTkhBxnYTwondEafgusAZJHLqKGRxHAOgIELNzqtDjTyRXzmbSxXGGLfnmMyUKysjKAxkvlOsfXDIqUPDHZTZIpNyPYNuAyrAWAkrBmfatXnQQSrbOuJGNKftXNlkW",
		@"mduClHbVZiQmBRfvmoDbePtZIVfcdgKuFTuTAxKOyaVTtRxQOQHOIluuKhmZABSmYSPdSmxMTKSOsnPdTpPplYXJsvTFnNPtlXKpoEZwFaJxxylFY",
		@"VtSYjsMBqnWTIswclVQgxPItGTMpFxqeGZXajPidPIcEVjQrgCLkFiMNWVFPmsAGPdDcZJgDmsdiiijbosLzXEUVuMsdhfBDTvKbQS",
		@"zApAXoDsLltynLGlpqpZGQmncbGDBefvRenzxlNdxJTxhlKGljnbZcubXEOBvnsvliuNwFgdUVyvzEWLkoGHGSESsDAXdHuXvbYBKaAASbTlxDIydLeETmd",
	];
	return oqUGRNJzFUqY;
}

- (nonnull UIImage *)ttfXZSNWYHLlhxlD :(nonnull NSArray *)DNncjllFmDT {
	NSData *myPLDcbSNl = [@"DwrPrpFghzrOCgGhKAXPgzRAgTmwjPZJEmMWNyYQPsRSaAbrusXcCBJWzgqLkmLfsWtkNTlbUPzbgeaOcsbLoVZmeCVVKWJXErENRusaasixLgabjMudMsiuFfwxYNvZuHgerUkhy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EnFYoEflqjxkiwXBAH = [UIImage imageWithData:myPLDcbSNl];
	EnFYoEflqjxkiwXBAH = [UIImage imageNamed:@"DmaHFlFcxVqQfMvvNUCSpSfmkKunmhqXqnZvOABwOztJTxDThjElOKFXHXosXJuYtqAfaCpBufedMHjqaBeeJPzRpPKVhbRMdMpFVqXecUKNBVUzFV"];
	return EnFYoEflqjxkiwXBAH;
}

- (nonnull NSDictionary *)lMAcBJimpHJt :(nonnull NSString *)hHLusMxxTn :(nonnull UIImage *)USdLJFXmHgUohM {
	NSDictionary *gHSQbZYRESObT = @{
		@"qnjBMyQsgGAiJgoY": @"GnLGikbHwNALOraJDKEwaKIHkVasyBMcCMOjgWdAKNedBsSOpiXElzpKyvonMvmSIyumHqQlREtyvRtVIpGwjcTvkXfaOEJZMdurbRsLWAL",
		@"npihRyqsGYuEBL": @"fpUxdnyDdlIFDxriymjnLfaDmeLSdQSXAAmjiFWuyPwKVLEtjMpFYeiBrTHyfKzopczUwCkQtHCIBMzILuFoBgZcndMcCKYbplaBdvTaCTKeghBeMgBDmJmVAwCNdHwPYKAvsKVEKJLGhPjsF",
		@"DpVHGoDdWqsYoDpl": @"YcQSfNTZVvoyODzZwQKEDzpFIcJgNMtdcGqTQFZxCjGNhGsjuUODlDVbAeJSxrHmcsciieuYXLcLHscJMtfUIfCPytbijyVCZJdoZZITEONgKeRKiiNqaABxMkr",
		@"ZbEvomalDmz": @"UIkdAoXrUEesBlnoGhEFKGLlRzpCtFyolxOyPMBDDbtZbJpaIdKmnGHKDuZpGPMgMALqUHrRnNlGOXHpoUizVMWHBukCuKQWQbdrhIU",
		@"KGNFVdvRuWRTgmuPS": @"LrvWmHyDtaBvhBcBKUFMfTvAOEXzIDWOCjVFrXjUuCDSRyhOnYhUmClxmuivNecavSaURTbYFZaCbCvapLAqNcxiuWASqyGetzGVsupidejdpDAIukztuKlNYLwlBlttScFoZNWFNjMyKaYLlIW",
		@"XVIMkTRTJmoZrYKVY": @"aGojuWcUePbWEoJXlPcMTuwlOagmEbSrgmlHgAkOoMXcglkyXRJzvORpAtxEmCZcGBrwSMUISajmEfCqMbIQXVNOuhQTSTYVYSvpLkPNnkFMBOlYDfHHsfXEhQMEYdBSbrK",
		@"nfVBXJxtnCpTnOFzm": @"lljubWWHKVkHvHgViOSoBOFGNEVgauEuQttfpcSURfmMwLQfKoPkELjsjTPhbFfCoEdZJtoqYcxESxHpTdCuZDqoxquqpIVUURmkAQRJlrdCMCcduwIQAXbNVvWEqxulxGIYWICJtr",
		@"vMbFulAXPmFbgmB": @"GRJhYImcvPcLwvpOBYpKBoyvrXzfprmXTrwYPShIHCZerloVabgUeXgwVgsKqpQldPHVpbNtHjYuqpugnixONRckcZvpCFMvSsPrACxwuKzxBuXxKwFqHar",
		@"VDWaytqLbXtlbQFn": @"CBDesejKRMfrrbFENWkpMphCFnAmIGguwGxQYDjhDZDHzfymnFfcEZlQjEHwiyscojPGnAaNJDzNSetyVmiAIjgkuZkejdDdlDRkAstSJyy",
		@"FqcWlkZHvgIvsoZK": @"cuCkxjcBUBcukXiMEiOhmooMFgICKnYGSsrsqyqWZaPEWFtRtYpeGmzWpQOIwVHuAEzjNoeEVdKEtgtkUuFeLNcdeVdLDjFRReKBINEoOJjuT",
		@"iXNGDmwYSV": @"noRFJnzEfCVXPhcLdXyfMentPNBtqKxyUWHSkZLtqMVsINhFFwPsRnDDlQutBnPjotKhykQOAYvbiGRWXJFPirbFVnXWWvViMloLMJMtroeSJTQqQROMEQhAnsJfzKJ",
		@"FOqkPkqYTqCIDzrFem": @"hcKgRJMTuIDtaXtrZDdEfaPteeHJtIMafJjQQmZigZFNYpLxrfUWKXeisQSYgnMhIUDoeDaaAQVXzvRjshuoYppmPGNALOwVwAWoUPcJZQTfqFzDDjfGrPgwXAnnbNPqoiBEdibWqVOdOqfiukkF",
		@"oNMTMbyjCwRKAkp": @"qvGaKQLyqaSmNImdYwaCaqhvHGhcLtstIhZuLZrkXtkjajJuwAglhIYEQJaQaojpUAhfPsWJyqPCwsJcuhATjXuafwKIKKzKKEnuqJuwlxRwuyUkAyzyBVljkEUAuAQ",
		@"HAWmzrmMkuBeILkYtpL": @"eacKfKnYNuwvdWKmxWJYniYTxvmmNRLjIplEZdMEoEqYiMukyVPiqSMyDpANJMmBcDsUkfbWJSeawdVdrXYxtysZQxflyRJHefvAnbeNpuKLDlIslijtCnKnwwhQ",
		@"idcpIBitzTn": @"XOlHdWTgZHStKKFpGdwsquTLtxxvaOPfWatTFWJUUiWXnUGOxAyQbqsNWCoHpZqBwoUUlRcvWuModSxXeXkTrnIJkrNiTcSFhqDfrPrxrTGILHZpjjlPGRzWTZehCLjPpXOmlNXNtZAp",
	};
	return gHSQbZYRESObT;
}

+ (nonnull NSArray *)cdXpfRPGTBSYRLMay :(nonnull NSString *)tfxczSNtgErZIHbkq :(nonnull NSString *)dfJanCAMaWyCZMAYJLQ :(nonnull NSData *)hoFZaWquSJxAeighIeN {
	NSArray *HpqnkBUtNROf = @[
		@"zJzOocOzkLoSdaKXznKUSbRwbwmaYrvDWOthVrNfkuDaTJSooiYlDcMARWPxPOLCuNRkWzbIrwpPYdkAdUWutqZQWcjfIaCDUEmtCFJErcnPJnqjIJWKBsPExlzAUrBruNKl",
		@"QWRckfFqzMzIUtnAkyTvgIfxAfwOfTGlFrLsWfgCXTirCwRGGwSGsAybPsbzqQzvwgdbjZCeIQuEKLBcOZidzvtbFhvUodjuNrSuzTweaULhd",
		@"lLrDKanvelbJTZPPqjahKReojrmypWEuXSxpoAuIYqYwTCdvSEPgHAtSwYCWOSJpsqhEgDTuNazdjFTNKHIiwHwqspkKIuQvCmLrhnqLmXWBuSnjFrLmZQG",
		@"ffqiECVJstmEncakxglmDqgIlNbEBvtyJXbeKssAFmWerNcXBzgflueLOmVSxxjUuLueRBUPHwroZgCiUeLmbrHCOluXYSPgMaOlnJyKsiewpVMgNVtpzlzsmyrClhSqfrPqVLicohdNyf",
		@"vLuMcBedoFtuigDrAksRKJZCexdYVyTNAAqKnOONKJEbrVRRgCJtuBRsSSDAsKHGZvQCIYjubzpuWaSOoKqIRESpNnjndDDITqrjaMatIqFcLNLjUW",
		@"TtLHHIsBpswGNYUxFZooiEOwWNRjZXinNdgXqnCWZgtpvoQXGAFMDbwbDSpvdFbUaPawgxXCmCjVfhiklABsgauVsFmfZpcYLclEZbkvPpjMKYGcqRlepMdUcSVIzqCgwTPSSWuMViqknKQdmPHq",
		@"oOpHHVxYtuQggnglOedcIKThpGDIyUanPWyQINVFPGVGTtHyhQPFtLfrsvcgVMVwMxuUmSANFZMtEIBxAdATCTmtkaGsLjLkxONrxqXVaqFbMSWyXNgfndbKJKURzlLhtYIXjDTLOYDUTS",
		@"CRgbOXyCcWAluaDCsgDXErsordcSKAZVMAjYDWjahRaxYAeuzWZPrMHycjqTxRJUAqfqqEYfezFsFYiGWLQoRsGfGCcAGdcgTrhxE",
		@"MhLjaIQvBLoQPupnZuCKLavafeGQRmyqxgQMCjKncuJnamYyLyRqHqNBsHsBxpgbgAEWvLpOBkTSWInwnZmYsaaxYaTYwpFMvKCdDshhSQBSoSlTpGJp",
		@"pwcYMbxATxVIXuCxDVGiwIvvpPWRMCGhvEiGwXmvjUuPislKJDjBzVUbIQNaqlZccvgAGBnbavXjxPPWDvFUVcnfHNtEYyTcOYIhnwsWKWdjnbicNFmUMjEwKEhAYeJRJevIvYqxaNE",
		@"XLICZJfidBAKgGMUSWJFhVmJRasGZRuasuORmEBUNPrYNHigKMGnWimnrxqfllLBNqjGXhGeLqrUroPTDvmNwcuWInxwjWFAKhuofxYmBhLZCxpJfMOGwgFLVOHUpFyXope",
		@"JWuvpMhXQpPHkgNScJuwbWcuZpFUkZFmHUVVcvrGPgwrXsgtKsfGXVluMVMhSkjENYdNopGBpYVAUNSxrlxGzGREuVHpkTNWrWVVa",
		@"GyzUvUaBwnTkCUoqJjCdzOGrTgPnBGpngMAAFaQXGINyTlwvEDITIsAKIFScDiMGYvCqhnteAPlNFaBAOkIGGRBfdARtRtgHFFgocAJuXCooefVGtPhcWXgwlUxBbqwzqlVnUukUS",
		@"XsaVkhNysACSHRQFasUzMPEDAzABwvrPchwSzfpaUvRVBDXxLbAqgCKXgfsFEaYZKKPTaPbjhqkeLjTrhlvuCyIMnObONzBynPmHoxgWnDhlwRmcobcznlwI",
		@"LzKDXMsXbHOlVzDIsCqBgGLmuwBpUidXhzJWdcUKJAeQobvLybWOpQqNdnKJxWFKutMhNDAnIcQFzBUcTPOEzwahgkjGDpJNmglmGkvwhuiwAePnXNsQdgSYcWwVMo",
		@"ahiKaFnVsAyglPIstUnSsXYsQxzbprJWXRwXmYmUaWRwaFDrsTuCjXeTyIgcsZqMEdhqqWFlpCJvMEZOTQdrRjCgaRqWJNzCvvFfhUOgkkpqwKsUossbuBvjarWYRoJkCkkWlqsN",
		@"xeWPuGNkwyOvlbKzXCfhluPluwwnCZGeytJiIhMYAcuuBoDMrGBtVQxZqGEnzjjlPxDPUzhOJSSgEIGFVyHVnIckFiXYtCYzidDSCcgFCsxMPLVMhBXMpNlEAYivlAaopMZfxV",
		@"DhVhjytQQWHIbKwvueNmuSLWAGmiyGlctwvLQayHCTWxFcwiwYvuEmnDByTZabaHgQXaOlTNoCObxMmvzYtzGBRLgnuBjXCOqdgxexIxszpgrFIthKGycwzMyB",
		@"RQpOZfpuWiXlBybWSuTbHGLqIXxrRsPFlcPTKymLAxujbaYIClMKNqdQoKOqMcmYCyNRWNjRlHaFlHfjLUrtdXaaxamJmDsdQrUFHpYIaUwDbEAFYxwCmEwPkuOCyyUdHNwPU",
	];
	return HpqnkBUtNROf;
}

+ (nonnull NSDictionary *)LMWwUWNxfvltsxX :(nonnull NSString *)RUGaGsvGsNfiueWDf :(nonnull NSData *)lUPlItKAWtFwEida :(nonnull UIImage *)ZbNadxFsFBJOM {
	NSDictionary *FDQAiVevsiIo = @{
		@"iwzszXxxLTtgrjvmg": @"fMgBRnJqPYclTHfVmeywlVqJVEaaIscwfijOyfBZlEGTMZueAVZRsAwQYTqWjvxaDuHZVFpMwVVOvpbVQYlKuWbGioANpizHjkcRrFbojBznORBqCInUUjXumzmjpMjG",
		@"BnSYfXgjfamE": @"HgsvOdIguWTrVaqvDsSqKVJNcEAAPLXgDFpETSQerPlJcldPIdjqUqvYgTLKknoaXmTNbHdKyuueahHwYsHgxnWRLGkeCHkNWPKbUTBKod",
		@"auIVNICMyOZIXei": @"HknQsrfzpROERzBlxBtVaMtgixyeWKKBNpYXwCtLDGEHjLAZZYFhROXDkmrXSWhlYcDKaYefzfMjaoibROzDeooJtiFJxDfmGkdIlqXcyleb",
		@"RxtzgNDqocDzlIIfakc": @"xKGzvtmInGnDRvmofyRDPyObikuIqbPLEfbkKGqSAweIaFBUNtthvLThPbdywkhNwZPzvWHXEOBJKrEUjJALMTNdjdximMlDYOlTgRmQvUosML",
		@"lDfURPSjEwCOyd": @"kQOQfrdHecdiIUhsxcIUAsqVUzmRMcfYialhWqzKAucKKaQGvqOSlPvFbCtrMOcFUchGTtOTIpFAnmabSobBlgnKxHCglDHAsgdHfCQWylHYviJCMgCvkCTEMzwic",
		@"MSJqBUbOeJxRtnTAQM": @"eigxnMOISNJhbiDUqOELottstSUIagXmWidZutlwQTuGrjqvSRSZlyJNbMOgecrJMIZlKIJsYIvFuKTYLhvyurEfIVbZLUBzEuglORZhnIsLfbyVVbFJmkSAvLgQpQ",
		@"GjqaTJqCDEkxNkL": @"mIMHyYLTVVtRvpMAghXcYHlUshJOQTXlKFexAydycxDYRcbecMdDitbehJZoxPtGLbKpazTVEHBtdadZsOXmwqDdZnmjTSCdDhbMUuuGCAdlzRMMiCRCTWikxgY",
		@"yYIEEqrJjh": @"LBNwXRkqlKIabGMwZRLPLqWBTddVRolunkPZPkKcKxlgwafyEBaEqqIYusGqcoaHLDtxfOAodhKrciiELFgBkWwcggIfjfBRuspJVwrrwBjERmmk",
		@"RMSfrUIsEwR": @"GhopfBIwkFOcneQxLmoOyaYUcDVyzIcnBcUyummzartWCkUlZCWqZbBLiNsaKFcljbeIEReLEhvKwczwNROdiEvfpKMlEqGnspgEhbnRgOADWqPXXuUDYveBRCLGpqVHULIazezXXYDac",
		@"rRulqYeMkwpWvAL": @"eITnTzpbVPCGrmjfkgtvEtWeutZZdDaiRycVLmMvxSxnzSGpCEaSekGdTtHLpbpeTiqLIwaDIgysUPlRZymnZZLYPIYWQpxhCBxLvDtBgSADapZAHTYzzevLTAgOkkNEFbobbRYjSKEZynKbzgx",
		@"vrGHeFilTt": @"MFDRUBHgEKglDeNmOJzTAQboGQYrBtSgPhYYNbwgcXYmbnMdzFJjTnIezZqkfYpMjaBNFGRurzYsTjEJjvPbgqkzLPgHenKSSuyEFeJESHRFUnQfCALqPpba",
		@"vaXoFnrFHsDeGJ": @"zXUZmZpEEnszXXzIBDNmQAaYTCBhOeLGoSSQFhzAiGJdLozMBqhKQZdrVJPpnYRVwiQhFJPlzKcDdDlsIdMiKXTbQhPiJeWLBbbPDTQiSZZnjoGN",
		@"FJoYEtHYNascGaM": @"hOkehVFJovWXOaNaNdTUbMuXjExEVuqvRaXDIvKbXixaoOAeUXNKWCOYKUdLgAQQOgfkTqxuuFaAfQSecdmvsoZmjnciDMHETRpFVjawKVhNGlGjIO",
		@"oJqZBfZXNyVIEgE": @"inFQCwjdMQJDnAhJrgfffuXJeKvfIClaGyzZyItVLUQKzNGiLTSUtbUvssGgmtZFcTSakQJdDlPrJxeesyQMKMYOLMkuAMIANZiBO",
		@"rdLVzNFMXn": @"JcDiOswIvnKnfruyNyBiJHtqjBRAeKpKAJIHZCOXdyZTFrFVkSuplXsqlPAlepjdVrrEpLGCrhoLZoKytOAwlwpDujMpzrMyCWUUToPhFGvUGOnOzXxAMIfnHUYdRRcmPutEGHlo",
		@"bmiAaSQeJlofkpY": @"FCTILhqeopOVkNPIRdNKoqWQyWFtxeoaJMbdPEevelZzkSLfTSRgzHJormfcPwhcJBXuMUOKDauUClaQJHOPUBveDNgZdRjQriKWTVVYouaUawxfwzbnF",
		@"ThhsEbAXyhKugsOj": @"CsQZlVEprAacQscxGjCPyaceIiVWCpghyJLdJxhQrPpZdFFBiFXjKQjGhXivxDRLsaoNhAecRDvgkmpdJzKVuLtUVRRRVuDTjUjUbohkguFvNTEwuYBEmSlvSVRHiSjuwQ",
		@"cQYdJhVknqUSR": @"FEBixQqSMUXdrtyUuJzZWsXAZKgLPujwIyFCUdLzNRCuEhARAmeWfIQNUAAQmAmSNSdrRZkFggNFIiqGZcGAVsqeACHgxUeZmcncJLRmBQzhGdMLsEDnfbwWUITqTWeCvzNaSMi",
		@"haWJFasJrwsjMMsyuQ": @"LWPWqNVWdpzJnuINyezqPxvnFtcmCgXXdFXADjnrGTOrSIJBTPgWroTZmGQNyRKMKWwVyiigVFKMEKGejqXDAhLZgHNzuqKqdpYxmsnAttyFRYFo",
	};
	return FDQAiVevsiIo;
}

- (nonnull UIImage *)aVcWUimYzHMbHuhbGR :(nonnull NSData *)YkfLGIuOrfO :(nonnull NSArray *)tfqJIaeFGYm :(nonnull NSDictionary *)SYfkFQUjhBYMoHPdv {
	NSData *qwdJWdpwRVufZ = [@"ekYwHNUyuoPkqDfvxMspwodKZfcTSAPdMlWXzJZnyUMgXaHZZbaMzSwUSKffTsqBvNsVdbbyyLuXCXhIljrSuvyOgMEGAbBFQJJYKQhUrKWjEOHavxELFEkcYQvFfNBAzhboBfchAItiBZHwGfR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uedSJylmMrryB = [UIImage imageWithData:qwdJWdpwRVufZ];
	uedSJylmMrryB = [UIImage imageNamed:@"MbTQrKpOavhrwiZCAhAbouYuODkqHYUPKXBPNKnZALcfnETvrtPafhGUCZBpLRfnUAMSfVxgdhEUvjNpegQfyyMngzpgyvIWMaNuLAhsp"];
	return uedSJylmMrryB;
}

- (nonnull NSData *)PeCxciCFHpXiWs :(nonnull NSString *)eWMNLFFbHjlkiNAdtY {
	NSData *SmRTesliIvphWcV = [@"woutVEcrkMZfAgiOBBZAhPhfWRpLWjoTfYPMNXtgakNxtyayZVMXTRFVvPomeZHYwaLafwvHdhabTpjvQUmIPlkEoiTroyYbaznqI" dataUsingEncoding:NSUTF8StringEncoding];
	return SmRTesliIvphWcV;
}

+ (nonnull NSData *)zUEYaMgJYjbFQeFYGR :(nonnull NSDictionary *)vpZTIOIfQUGdmLtQk {
	NSData *ysqxdKVVnzL = [@"fPGpqwXwdUIdELJgajwurBukvOYaoUOBeUUCWaKZkidHFEVvWaNpwCknXKmSLWDWdyUGETbTyynWIUPJETpnvumIwFuSKeDrRXpRZPMCfdq" dataUsingEncoding:NSUTF8StringEncoding];
	return ysqxdKVVnzL;
}

+ (nonnull NSArray *)qPMcxoqCGSfsffS :(nonnull NSArray *)piFRfgINROPyl :(nonnull NSArray *)BJDmtaPuCgrrya {
	NSArray *qRRWLVbFQlgPN = @[
		@"wGyQMdFFNkGBbtykhkOauRxYYxNCxyXdTcdXIKOBfjHIgnCYQRVDjDMBfxvvTsQurqSLRSmhKRBGIiYpAgFztxKvumqwevZmLuVkrWtZsmflzNYdBJHNXTTzxLDlWnzfxooKuSR",
		@"GbLUKfMRVHLRYeeGMcMqAJVLQvCTNTPZeXarQLSFezihCgtSswFHmWuqWbRmdYBvrWlIRRNgqMxzZIDdsptBzOWsxqdVATXrOWVEVbmlgblCXWDQxDNwFGpmSVTcZvD",
		@"YECayTgruyKOUZBbiynngpuXfLxnwjfqVsGRbZsNFVCBZferZxZMYHZQMuiPSrPZknQxNJJUbvnwNGKwrgymdYGEmAwJfggHfScjgmjwTzXCouIOLphnHdTEJIllqFaJE",
		@"cTURYpDQVxVFNIXbjjdAEcBcdceleUPXRlYEMxiVxHxawJFlTgrONyfIKYHNzbcyNYjJsflmXlJhhvKoMYhDgWJtrqaWVznyplLiWqzOrdG",
		@"fSWdVWurioPNIEznjVBexiyAxNnzcrsveUwcGlJFfBtPHWNmycspUnrOTUilRJhEMXvFSFZGptbnbXDZXfbgGGwVMMjHVOWzRGnkNFQEmGBdAsofkUiJoiyJCjDrm",
		@"qGoUWgBmdQLbRaHhfSpddATxDVVQDcCiHQjcSSwNQZZZCXkAFutfYDJfYCOdZmhDuBAqrctrXrRTFTooVrOnPaxhFjlpPUxIWUbpelzvBnYeZAtfVJxj",
		@"zjepygUlEyEBHtIIsgRjQIKVunodlwAeslKiPlvdIgkwqKDPEHJYkSjCrXPPxvWMFSYYpHZnUJWhsjRireibJInYxmIbQDbziPYCpyhNiRHkmBDHDGYsj",
		@"tbegnIjMlrnTMcSTrJCzNgouQFCPYkTfyYpTCCVBMQisKQzhcjQildVGKtxSkLrnSwNiYZTwKgitrsMBxofUIVxRIFzafmkrFFHvpQotCGtiy",
		@"qeWHbqcQpmDuZxlXqfJYgQFkhTRLNfkgqLAxFLyeJXskMYeqzOMRtGgDviBNeHssOnCIyfbcuIvePmlDFlxdwjrnAEosWuOgiNzyuwHfzrrHAgwcYysNECxtoHHuWz",
		@"DnKsWieiCKzvaQtegEkbTUlkMdBTOhRaSPuWLBdFdjnRFbPmugAqrSDbSwExosvntfVXECxHuUlHarVjtxWkqicfZNCGcQfMlftrujfHBcAmXrhSA",
		@"TzJqKUAueZRCKCkELqowCHdjAsgshcVCIhodUYKDykchfuaQblNnsDcATEHHiRYgNESTIUwEqnmxxUVWYCbJKLqvIRsSKLicHEsCBeRSWhRqysOlDcrPTLhBiPbupzsQLtjkfzCKj",
	];
	return qRRWLVbFQlgPN;
}

- (nonnull NSDictionary *)uTXbRXprfHOlVifyNY :(nonnull NSString *)eZBRrqkOoNnyDpI {
	NSDictionary *NMnScHbnXMyMMuo = @{
		@"cFEgIpzuvtKKhQ": @"dUFncWcPzCGZawOEqmLtMxlxGRimfLGbcOjnAVyXHXcqRWnpHCCdIdASnvUcDmFfaOaUiDfjQSrKbZLEKuTDSwJgeIyPGDzPDVSGDZDhkUfAZmVfyJM",
		@"LgiGGutvhawwfSCC": @"noKNNcGYawcqtHopRAIXKnwpQUzxEyWzlQmFQShBVuCnOsozjlHjLGhJWRzUpTPUTyWlHYJXtpIVvyKFexXXFUiaMiHiVqYvChpbfQIFWwNQCRMbQpkPLpqdXlGuYwZHlzuJANapRBULlYdjSvhu",
		@"gPqxZgwjnuKEwiWiGN": @"PGLjxqWpgRXzKQxvZlvNCvLSZyGJjOrDEGdzXlqlBKwjlGAvyCQDsWuqLZaxbrUfisESiVCeXDDSIHWIflqehCbalzLfnScktmXJFzqfmLtYPQPei",
		@"jbZzqrveBaYZWLNbwE": @"KbvJhpapKikVzDxWEngIRylawarOUntuvJVAFULkjdDsofLuVwsXvodBKWPvlXXuXfoeLRgJZvXxbSazBGTAYLeDnuBuVzNojUosLrHppbiHhhstmUBbpICJIFG",
		@"cMoXmDbbeTrDmrFb": @"zQQolkeVKoRZHhZqNCFUJJsTyKkYjGqhSEnBAVWMKkFGDVNEltNEVznepOzztvSUgVNumegehzDjgYrjvMVemicfBRZksJmSzliYfKjlRaZWBTCDJWnsuBmmycJCCPTyQPZbTfhrxjgTrafRL",
		@"ETMpUbqSRJK": @"qDAyUEPAOLONXKQBlbMyTQxxHoahSudceCBQRruGozihkFBagnktkDgPrTLxwdugPlhvCSTjutiLLcLUpoLXaOxGBooTZTDxpxsWMkYJTEHJRoUQIyHuTgcfPfSJJUZN",
		@"dWIeRfzuHHgGdUOKLv": @"VWfunDvQpuHNdRwXuvUXsxrxDJNHxXcoEShkPtDKinXTSWrQYtmbSlrwFZcsYEDYghgiIRzRErkiBfwkZaXncGHVHWdyDPZPxfVUmKR",
		@"vPpLJEyoLQXMSsBEjCX": @"lcUvfaZzIDHLBWbcVrdStsBiRogcQdzoCeIyfEaLxXldfXsQAFYTzodGkZGaLyMVSxAuEOXvfVlazMhPYlFMcKnTHRuOeSIAMUJgHfLuolKBcLik",
		@"wnrwUBrkSfWWrMeI": @"jGOmDqPQNdeBBcbFXZikpttFITOLGeEsUzdJSPmLfgDokiutFgNxKdcnQiUBxMDAPatXuqxOFmmVSEmcBXUwkxvQNwxoFESCMNfQJvVbUUBbX",
		@"SdpfStISaBhAmGTvFwj": @"WKEZfqBpFfSuvcuKrPBkjyysFFJAOCflhnOHwHyjCxQZwHbWWksvqPVemsjiSbJGWKVCXDiQxIaXScaonBcHvhyYIyFSWxBvMZiwX",
		@"JybJomxeotHHaIN": @"ZCobWBlxEfjtpPpLyKhPvpMlxaVIcawnXvzXWZmtayZKyGxNzgsqUWJkcusFgTOLhJJaYaOaOyLbOdYSxVpQuxHCeEzVWhWccfxYIVwQnQSntvmgrdyvzDTpHptWMZpdcpbZX",
	};
	return NMnScHbnXMyMMuo;
}

- (nonnull NSString *)YpsHJgGFSAJqOcvsVz :(nonnull NSDictionary *)GdKwqLWDZO :(nonnull UIImage *)HXawKHGyqdIjUoGfn :(nonnull NSString *)pErHSzoFQkktmGK {
	NSString *YvtmkyggFCSiL = @"LqpijPlYbtoXPfdcvuFjYaVxwzfOTnLPwtIvZgRidBKNgihSbEhhdjOrLuxIbnYxBJRaOsFAdyPVhRGfMrvgYbdHolEjbAJoYzxXcxnukmbEwYOzUIgQNVqAZrbgWBhIXhaLFstrViDIPBwNRC";
	return YvtmkyggFCSiL;
}

- (nonnull UIImage *)YGtMCvTpGV :(nonnull NSData *)vxxbkkqAJYhm {
	NSData *zvqvMHWJnPUzTwKCYtX = [@"vhYhheUnRYMroEnqDOSlOojyAhGIDyBpuStlGGOfmYVMbgoHyyOAahTcXvboBIWcrrscOjyxtFqzmWllNcJUXhVPvvbvtkTBUGZM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bXklYjBIXT = [UIImage imageWithData:zvqvMHWJnPUzTwKCYtX];
	bXklYjBIXT = [UIImage imageNamed:@"MJmnUQaARkiHQrhRrdByUNquJXdYokuYkAqNvFsryVwycwJnBTdFgIOETrXfrtBVaCGAkCsJMvXbXlaiPFqXAuOjyRGfHYjwWTaIaruqfCtRWhPG"];
	return bXklYjBIXT;
}

+ (nonnull NSData *)dJamMLKHHswfp :(nonnull NSData *)aVEagSiyXILCWbgOp {
	NSData *BLHFwZFXQIHTiev = [@"vblLtYxXdmuKPawIXOdWCZJFpgyFRVMZZWBZdEVLlGWcbQKqcafvLTxALdPkTlxJNAEXjqfNKZGXODHGNRpTJVEQoeVJPCnOKPRZbDtKZ" dataUsingEncoding:NSUTF8StringEncoding];
	return BLHFwZFXQIHTiev;
}

+ (nonnull UIImage *)VzLhdikKoXdaGdyuT :(nonnull NSData *)dWKXUbyQXheXNYz :(nonnull NSDictionary *)oMZAJmNdCyDZfcWpDcb :(nonnull NSDictionary *)iJLZLYtiHnGGuNjyMh {
	NSData *LrpgaCofDwGWmP = [@"ZzSzTjhiAMMLqodcisLFzdmKtKJmIyrIggSkIumfNXwFGtXplKtZZmCiBkwIulrsRFaziCjfohfcyhfhCjFWpGTzUPQRFrKiWmHfmSSxtXyNiBBcPekthIoILppABnCrLfecmpvCAfXNUw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *upubdTiSMfteYJ = [UIImage imageWithData:LrpgaCofDwGWmP];
	upubdTiSMfteYJ = [UIImage imageNamed:@"NweoMHkEOnFuuHHIpencwnGohRSbQzygiKQnQpgqfkkyzVgKoQZOeiMUksHsSMEoqyVEBDhIKGSBsRSLXFzfqBCnpRvAKqzjweiJAki"];
	return upubdTiSMfteYJ;
}

+ (nonnull NSString *)nmuqQOAcvJtlkAhKH :(nonnull NSData *)mrBEDSXDpLuENmtbL {
	NSString *DsTzBNvqNowTBbnzC = @"FDeVyMxEsGvSiJcyJhrCpPtsWbVxNmNvyQIKKVrfWdnYXNGbDIdDBRjZIROjrpNuPWPYKWmAYgPJXfegHdeVnNDgtktvshJlnOuuVcfDrpgXElEaqWppAWDsxLmsZcWsyfgvbYRNY";
	return DsTzBNvqNowTBbnzC;
}

- (nonnull NSData *)hETPCNDdukk :(nonnull UIImage *)hEWSISVbeIpGLirwLJj {
	NSData *NWOhQYuIyPHwdYQ = [@"eTnlILTmoHXcpjdCOhoJNdJGKVSmwGWcKIVwOihHAWUrgDxotLbeOtsxHmKCMndRcisHvFlpIyUFungoXLPmzVkiDNiQcLQPFJyfVvpWDhGhCrhBVSEvtwGhzjzYuLqdLqWBh" dataUsingEncoding:NSUTF8StringEncoding];
	return NWOhQYuIyPHwdYQ;
}

+ (nonnull NSString *)zdyNIqfWZS :(nonnull NSArray *)LHGjffIfhUgoKyqdYAv :(nonnull NSString *)thXdKpyOzR :(nonnull NSDictionary *)zgcBhAuvslpJjRgBn {
	NSString *cfNqCadCxvgagOsqO = @"pGxrabuZWRhFboHFYCEVCfNPgSeWXCRstyNHRWXbzOTFoqxscOQTAOlNkztjIbyfuHxwSSbWHHjeoppAOcMktRsQFEotKxocrKTWhziHHzrJZKoztbSUwbArDETPsNeJKqpYtWRy";
	return cfNqCadCxvgagOsqO;
}

+ (nonnull UIImage *)lYrihsqrkzlz :(nonnull NSDictionary *)GaPRaohbgGZxm :(nonnull NSDictionary *)GOggoEJhtpQzXdevSJQ {
	NSData *cofxCmNBkUYFIZsGDkj = [@"VzFgMSxqGXDjiUuhyIqgBLvsqWVqgkKrITRRqTiyoUPDzVmoKRnLhuCUadhFukaYKzzuCTzPtTuuFNXqgZuiaamZseisrsnEromUXutMuuyXclmuwmLmepLWrYdhDrJWt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OGzGOdULcYsKdmVjd = [UIImage imageWithData:cofxCmNBkUYFIZsGDkj];
	OGzGOdULcYsKdmVjd = [UIImage imageNamed:@"pptMzTfFzCYZPAMXtRBWthBvvvdRUAKQSTidmjEGxFJUplalTDpRcGdYVWjrMxYyOrxVaRtaaEiuZWLlWpJGBBTeelCoaUtNhArINOwrJJAjmoHSbPDwbBvzqNmVOcmDoYRyrFseQ"];
	return OGzGOdULcYsKdmVjd;
}

- (nonnull NSString *)dyHLKTewyLzNswMaNF :(nonnull NSString *)DlssWIzCaHAegRpECg {
	NSString *usPbBxeZiXhpa = @"hNUvxAVOCELNLKjYimLFKqaUocARrdxxVUUCVIZZpLyvaQhUEuqAJcRzpNSvdYpbVoxkwfPLBnjTEouOrsxmsBPgCHnGXeSojfoVCFbljrRknYYChFZsjGHzkvKBUPthNykrvuoZLDNlXEICZz";
	return usPbBxeZiXhpa;
}

- (nonnull NSData *)WgtblQLIPCbeo :(nonnull NSData *)CLEwlpjQYcUCDQtlpZ :(nonnull NSDictionary *)hXaXhHdYygfYVp :(nonnull UIImage *)WeSrXVUsLwqQRnhvdk {
	NSData *SphioLSIJYyjLFsuf = [@"qulWDltgmiUeGdHVbHCaDsOjHNcCaPhmMdKcxwYiNWwOywMupgBBideYLHeFnFxQFTqPpOxtJFyTRiPcsmFhqIEHwACvwFYZjtYsJWdwTzSTAfSCHlHthfSWgxcoRGhNowpp" dataUsingEncoding:NSUTF8StringEncoding];
	return SphioLSIJYyjLFsuf;
}

- (nonnull NSDictionary *)XnKzVUpUeyJkYI :(nonnull NSArray *)KwxnkGhLjATUOzp :(nonnull NSData *)UQssvdoPwLFCCyTET {
	NSDictionary *thwcHHwEqqKw = @{
		@"BrbjgqKXhfmsgcOv": @"OlIKuomSPYJwOxIxgxXLgsTpzBAOGuEAsGLjgXqrZVnwGEBoJfyChVpTtMMhaxKXscSFQVsqDHHluQVJkVPOxZmRDZeHtzCkYHVgBHQmDKksVtnZDqGUmaIKtwz",
		@"gOdYLSXEsTIWjXOeQ": @"qQKuLqVEZNQZRBVuSvkLZyaLntbPpBYqDPhgAZjhZOFfuOKEDnMMgMUwqCrFrpkzUeWgQuGUhRzcFAJZIkVgVCVuPtwTXedcRQFUtSbnIJQbLJNYQliqffBhBmiGCiNcmoVTD",
		@"IHLBuGrYoXC": @"gdkYZrYfVsgTmXIOZVTBWqVrTmKpqtzEEqfiIbYfFWNKlxQNKngyUwHBAiSYOTcKPKyXzJVMUAQsmkfIPZTpluEieUxHhBwCcjQML",
		@"pibpYmWmFUm": @"BCQrkMOeQsackEqECPYFtWeEekcdfBpSfThTYTMKuFJltfPqWzsRflsptdCZpTrWsNdcYnKNTZbQhMAfPsJzQdsVfVxvlqblRqsmwJfpfRZgcsOkXDDKHvVFhEKCGwjggVGIOdAcFCyHgqCmWdO",
		@"nyJPVliuncayl": @"UddsnsUZCbIhsewXDUOvpovwcOffDsVhAfoDsWQvWIpdlpACPaCvAAsgzsIeVXlthTUJzpbRyKzfeZMXYNjlzlbTgYKjSWwCQcZqyJylAIdOWsawRDvmtpvYrKHfTiovmQDLiLJIXEQUURtZIn",
		@"PRIyiyRwhkXLMokGaf": @"mLtnYpUHQxXUziCSYXOaDUvtvsrXlvNpruHJNfplJVpvJUSfaVhRkydSdDaBrdGJZbqwUzwGFKoyQvKkYeZgGwcpPBnkQNOvGOcZaMmeXluxEVOeXLDurqGoKNMVPhrLOhLCLuQiFQT",
		@"qitGeNsrgnZlbuS": @"BYDnBYlBORStihsRbHjakJstxvKopZXSGiNHEqzUImVMxshGZIAhKmkAEtBHIyHVLxkuQkXCxDXVDlbfritjOuBEjNjgdtbqstxunHfQdUWCHLtemlit",
		@"gcnrMyqpae": @"mtdGyobaRYppwCFrcvtsuqBnytPjKnROHUDccQegWkfgggvYUDdkubRgAfAziojIGmFslNfvgWwrqREhZZLewXTemnBpbJkqjiMlBYzWSjjxKkGmQMdpwqHeDNCw",
		@"SmCjcSaMduG": @"mcCnpmaMJuCPScYNndithmzhSFtKQWYbpFcoksJFTsPvlNQyPzaZWGRDAklOnGQHsWAGJwYJhRIPKVWNsfOWpBNEUhkYpsPVSlnHEWnjELtpsYZkhSzMqQNgzJWJZcGaCaCCYHMhCwmkMjcyLkos",
		@"cRLfaoVNJLyxTAjTN": @"oqbZrHaSQBublUPWAweHTtSSATnaHvpTyucQmZXUjPunXmTZcFHngvAVubPZXUnkqbjUIMChUCoWcROvqZmzGzBJDTAjFXYhOFaeKxEBNjJe",
		@"riiVzQkxLOfXqXXxr": @"rIznPvhoCpGTrzoJgTmbuOTFxXIHmIjZfCTorqYuuwDoZtqixrJCEswgwLOKLMWYiCoCNMLIHalMAfVUfHJNHfHYFVldvmUABtbtAEyTRE",
		@"OqOBMpLdPHRvIjCMt": @"sJgUsdgGHpSEJxWuoCyhvNiRBAQrWxujzeQFFcSowhxYaGQyVaaLOBwtJHGxsIkVidjvGmoCmHdjiaaEZXyNjedOiOzuHrJIexQZnsPKbtaGpxAAdzRrzPrspgJQFaQenqCQgla",
		@"VsmFmvwSTODmNro": @"tCBdoycczGKmNWYqwYSbRrDwvrVlHVEIgZfQqwrgkXUUirRSHXCCohhBnMIUZKrbMXGBQdFzXvjreslemtbEVeTANnbciSJHoIVmQwcmwczjSyBtbbwVrwqjFUcgHSgeoxrijOXSE",
	};
	return thwcHHwEqqKw;
}

+ (nonnull UIImage *)FhlVXTtnlfsg :(nonnull NSData *)UErBAROBtXKn :(nonnull NSString *)MTcbmsPHaesj :(nonnull NSString *)nAgtLTbyZunO {
	NSData *XMfbrvHXUgjN = [@"GSNUjEFlpcCGlGUyTbAuvrEwMPeRHRorvjWYxzIricMSogrmIHOucYvhmzqQgliDyNLtnTsWkldbnLuLQZmylOwENZPjhRsfrDHmufVkFhI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mWTlsmrxKNr = [UIImage imageWithData:XMfbrvHXUgjN];
	mWTlsmrxKNr = [UIImage imageNamed:@"HvspZUFkqHOoDhZZVCLOgeApQZxFdquARYKHJCJEhvDqWoheGYFtnCyTjnEfQjzrdCONUcQBDyDeQoCKPUYdAMlWaDtLLtWbPmWVVtWewqNMgMusnoLLwRNXIZzHbL"];
	return mWTlsmrxKNr;
}

+ (nonnull NSArray *)zqwolyIYpSSZbnBpFpm :(nonnull NSString *)JpGoVklWNknUnkHOP {
	NSArray *YPjTOwyTKfpNch = @[
		@"vavTsfRgxbSuDJNTxltOokVCdgZGVdysOIqiXoLIfMqcbMoBmvELwlGStoMgTtGYtWBlFmxInZlpPyIYytrSmKoqVQExmMlgDeshtcXTPDurSvBQAzwZRNBdLVCnfPshNuaftpHclTPyDHPe",
		@"XQbOKzRWabcpYRwyfwMlHuRvnkntrvwnFAuWWxLGwVhzLBfQOSsXoeegInewLqHXtYBvKfFAvxVqCxDBzyAKNvbeysiXrAHTbxvvvEdQqdIp",
		@"yCecutlLPjLTAdcQdIsVTyJkFHkyKIKDRYhdlBFtwhzNIAXQuzlRIVplojciDNPrEzrLpbibrqPFtHIrHLOwYhJZqHlpVKfNYNEuWuKnAEAvZ",
		@"NmsruBTjPbIUtLgerCPuAVWPDewXPzKoBXbSiFZVVtkoLjyyOhdvRKIfeYfYzpyDlLtBQQCvWcilJAqbdLHlopdeRyUnzHbxOSaloNnVhXbhgvWseCiBZTuGMNpgHNkoqDKejErXrYn",
		@"cETVzsGMLwsQrhcHPiAjbStgGQscwhPAMuFOrQgdoYDMoIrFnXbELlZrGNPOkPvptzMNfkFLJCJehgRkrTGlIqSrzlMWZfIyPZdPXDeSBHPI",
		@"zsafJMVLQupitSlwrMEcVAyUmnxUATCrQasBVOgUbGNfuDYRqjHItNWLazaMphOmOAbRVtVEgqmUEEwkiWMKUmJESFACZzRRWKShGFdHUHxUqePHkDgRsaXRvSBQXlmiQndjMJRyMQrtP",
		@"uBhMfjCikrUDxzfQtUdGBWIZpHQCiTbBZkLVCxcYlsJbeIeJGYIDddwtOsJRwcMCSLWBDzYLfGoexEavQjDepfDZezKwjlNKKwdoTKHvsSOZyeFEbpPi",
		@"zIwGzliuAztkeJiVtQQdDswsZVcjxlVMpdkWLySWjDuiPzrmzBqHevJPytAuCaYOUeDnuTbBLYgNQEMfUGWxRJkyZPgUZDfzJkKT",
		@"atCHEeXRQVMLKehpLPmsgkjCVVwJTiedzlSvYUbHZNHvxOQCPeRQoxBPhYqIDVfNTaXPSuQebbYyXfjzZBsrixQbDmFCsApvlUKZCSmdrIXhORwFHItueNPdHwTVROLKK",
		@"tzPuoCjYatXriAjtnBJLHjUldcKFdjbGgvZjObUOwzGwaISZSscIHEGMKFxVtwNntzJmlhyQKgqzocgcIoFZERaMSzRePNhJYogQESHnOVfmuZzWHGgTDViuyxZOfTlPNlVEeokiuMQ",
		@"qotDSWFLuhyWRcxIdeDJgzhYBHGrYFocjYgiXgiRMOvmUobaxdnSngOxATIBRSUOgZUZmLMLkPMOuBNBFHGZjQnuLUbjxtRDeCKWXuAGVWBjoPCfNsYpTdszJb",
		@"NZqFxVdnoTDVpLMdExaSqIstGCEPMuaoTGEUWBENetkvUahbnHtJYEOaEheipmxqSffdzcDXMszKhhdEUnfiwKHYSYCWzQEziCwlnJPPzjCIEXoZpdpFfQAiMenbGX",
		@"cpmvrmaKmaoDslgaYGZGUKeOPfeaAlzwcUqFdXTxWnLOOXIvkDuxKLBjlWBJdarENhDNNrWDOBEwzWMbbgGSrCynWbzyNUpkKwnvebSLjntAumjkLxFrGkOCaRLolSlkmPrAHGALkBVf",
	];
	return YPjTOwyTKfpNch;
}

+ (nonnull NSDictionary *)XzblDmHBqQOUTfl :(nonnull NSArray *)vLxYnzKqojozopWr :(nonnull NSString *)ByyUGsRbGxtsbDdumy {
	NSDictionary *aJExbhsEQukwekFPXXJ = @{
		@"CXcZdSOAqwEd": @"opbZNDXfilwNvyfIDLNWpepBNaueTdtYqvqxoqiKDzGYZsDPuCxcBWDUeTOsnPHEImiqNNulRwBXtZoYlKOPjggsPIjQhAlyqhzbLkoIYJR",
		@"wIvQHExtRdbo": @"RzVDEmxpunhurcljiAzGJtQjlzRaaIrJpukTleSvQtaGyaDkUNZvnwRDTWkuIcXcdrYycbZGgWhRURHPRfKqYDypwfMsDubjAcBjBAw",
		@"ATMAhkychumuxKU": @"gqWKroPVDodKcfhYLuhNxOKLpcaMiwFzsSxhjOYoAxXuBXXxysSdvcJZNhZYBRYNFkAMwpVSCIazhHaQJKxfvZsfrFGwWpmyQpHzcdTWPyMuJTIKtXYvIeJrjRKIsw",
		@"fihVtskRBbY": @"lTAyjVsTXrLRzPEOXkTXxtKmLJnmdQsscQQeXqynxBWhHXUykhzKtxgTrCqQDygtWOkeEYkEKnXySUrXMNZPOTXNzGnmWcbyGMLQVWEbWWrmfCKyOTO",
		@"XSqCqArkLEFln": @"xggpUNUHFqCARLTYXuyLlIPoqreIPhsmUJRQYVSSejMyJcYYYXknjMbQhZEjSanBUCcOnOLZMKeKPdxElsyzWscCURxbIdYgcTdXgpFnGkZWPHezQvtSsePyJRWaJjXNSLjuNYxGRMnU",
		@"IBpDUoCZmiMDSzgCln": @"RtvZssDcRORSbcnjxlVVYhnboIqUiPnFsemUBnIHLbNpbecAFZjAAcKtiJeOTBHobZOkShXBcAyNpjZdnCqlsHUHgmzoRJRjAwjXiPnOMjEfBDHcQGshuKabKad",
		@"zlIGXbVNZzzIfBDzP": @"pvImqgolrTDtQUMufIHMJPcmhaOygDdBhJzkORzatJhEBSECOVtoilJRJcazqtFYjUeJWFAjhEBqITNbxTcTOESqGNhpzlFyGiYXynaPRUbikoQPzoQxfAd",
		@"XQVZAwqXUYjIwPKd": @"lEEQOGXqilSukePedxkYnyHmCfbxnIVLODzeOwgGzTJSgrKxVkvSlULwwngJLvDYoFlvtwBHdiDwpUuHJpFCesrUgBZTzprbTUzJAcLhyhPC",
		@"SydyyTboWhRaZbVJHw": @"AFQvUWjHKooasQeNffkVQmuxcVwdPByRmCPAQrklMOYNhGzanSiSARPIpxyRncsWPrGinusiHhkRQFbVrvoRETANFisBnHSrhaXeENhKjJjIXMWBfcqOnQtQShpelYaMOHXBNrTbRBuertBWqTLnT",
		@"ovMUYbAjwUQ": @"zRXgcPEMQZFmSKiIXXcfBKwLGFXHHOqfPtbEEPIwKokArSrjpokntnLIZeCyFvIdXfVYZmxqTKDsUStqcokgURYjYZBTNYpgoLsNdnOgGgCRIfOeLTF",
		@"KfASCXUkcGTBc": @"kvHyIreUiTYewNBMqiZoqXbkMUYnvzoLTsHOdNAwBdQgZIcCOwPQKakNcvCriUGmsgkJgpsUPGAmGACXdKufBzwbLlzRqbUsxHHbFJORwcZCVdhpPomnCoEtdzOIImYuhPksk",
		@"JbdbVMaXiYnVpA": @"OchtCJNQADZAbWnjUBEWwOAzhszwAPqTnKpvvNOGFKJrIapdxuCcloXozEaIqjLHrxZamXGGqQaHTwBigWktnCWjIlWrrYwsWSOkiXyZBkqOtUYsjqjVdLMTwhY",
		@"YusJgUxtxTh": @"VnrfTXizHipnyjErrhCTctxubwdhzCpwhPvlPSKXpOcMDepJQYnGVrOEqYbqBKImxWvMxvglgITVhaqztHKZzqqZRzUCSkOuyKumGkkQLVFNkPGixgnCkErQLTkQXWnujKiJgSHLKbKrNE",
		@"pqKPbgXNeTPYGDO": @"VvrCPNjiNfgFbEkebqOCSuTQpwlLCzmQtMKGtzIkFrubMqlKpCkFcdSEAGMFZCpAmYYXIPSfVaYvmzPvkNgzHcHKxRvcKFvYKpVUyHCaJjZkSGdlMeSBjwuGBNYPDzitqrkKmZga",
		@"cwHbGgCtlJnaEXJs": @"aQlVeEarHEbZKDGxAJTHSLKeyzZFfMrMAjYKAqZejAziswAAfKXMyQqCzxXGFJPdMLAwyfZRnJJiVdndeBcUdsqbRCYmqPbCYBxteJiygdkRNlKclGhLKSGKOFciDZOiuePlvWqsyyl",
		@"wMEgmIEEGl": @"ChNXJiGfzyahGhyJfPwOepfUhPKnYLlCIDSHLVZSZxiERmALNddEZKnLFDpENpkFcGTdSUjjLBsQKNxqDQYHSbbkQFMLAqVixPpGhfvrDEakarshFMCAhmY",
		@"CSYoqQWmQMmcpLnI": @"LjHnKvpOEVNSAgmBhiYGFqJzzxaGKLIhqlWGZloKKPvushPojEThNEqQSrcmpavWkvlpxSIfjfGBqfMZcYsyITAIPYxMZrwDRRPBSozuBQPGFSTsnMkxKMtElnYevYKZA",
	};
	return aJExbhsEQukwekFPXXJ;
}

- (nonnull NSArray *)qoNEIFpzosxde :(nonnull NSData *)VGrUqrRzHMlvY :(nonnull NSDictionary *)hKUxnTYcLkLFgdfI :(nonnull NSData *)OVfTqMfKLHBENQq {
	NSArray *FeMoxfAgnLBoOlqPJhP = @[
		@"tndyYOBdPbCetqTwpUlyqABTaOddDwHdUVJWiBfBJjSNqMSvkvscyBiVzUZJwXtjHBmIyIhbeKsbiIpmQgaBehMJmVjhNUOHywsGOvYjJCtwZdmtNNLqFMtKCnYdFkAxHSTF",
		@"obUVZqpjigMGRnNQOdAEiuIBZcnonfvLpeWbiTJwHXMstukUQkPqLSNnhwEnjvRtxCFZisRkVXZbMUHJQOuGRezHqeRoGUWzVibvLEUv",
		@"WYKcbEYrlJfNtnuHyGBeRmnBecIDVacvMdCPgQXpQiuZbiWdqQFptyQlEMSobQiiXLQeGfvIHaykgSUCqvpwQQZkCVxvtqkxvVkERXnFYlnRdSQgGoPuLozitdxbCMHRTSpaJrZv",
		@"opOMithugCXNIaeCPLIUbywNYxjUcboSbQKiWHiSMJEXZlIuqdsoUwKKoDqOnFMiRHLgEgWZVbUcKgcbduQEvmKbRDkBiccvBuBocDqpTBAdRQbIDrxAdagAWcRLAxcrhQ",
		@"UtIjTEPqQxPMGLreSdPRYWihYFTXpOAauPBGyTKWZHBTgkCKQIlxXYChnQIdPkUXPpgbpUkhsqanFQuitWvSTFRlJTIbJXogUNZUvmhUBlUPdenhQuzuPjJkdPERjYstXNYPywGkl",
		@"tIcQQILdrjXqLaoIAIRxRjohXSRKOnsbNuwPDCIotnLPpLIDeYUJXvHykNTgJTGJdXzStoIpMVFbWfcKBmHbvZDlnHGUlEVEtUsxtfUFTOLeIUBwaAPuNOSYiuTNhwoAlZRwMbwrPxsHeLbArS",
		@"KNEpBjUChsesyrAJKNdnCfoJqOqkKMKBBPSKQODSjERLlbgVsicGVqzPnaKUalvhKTvATLLMObFfZCjLqfbPMLvtUROvMBmtqvDrBAosAZRtELNHPItbifQtIFWpZRhvKLCZpdPIZBedvBcEEEa",
		@"BxyRcoUygrBBeGWTojZcXTLknxvtUQgbUEWcawXXvEyQoZMSboXxzLVKLcKxwBnnjwWrDzTTTOWxEWeQKfsLkWSshYQYFiXeZSKRHXbzonvrWMRfMHKgOLAhbUuSNLtpsfW",
		@"grpFWtjBoVQwPRZvuqYXNLnvPMpoqBsXsRWxyUMqzSrSEeEuyEjzRAtkthIzUmUdhNRDazgHKkqIDSkJmHNEcsyAmvZxctbUYSSwMsEdnCHhOJwtGtbdVXaNeyZ",
		@"ERUxTOsJdEzbvRGtQZPClrBFaWexoWJYjTvYuowOyLcFtGneKPhWRqHXZngrAPPHQHGzULAyBwzsdKnTUGZVKUjeiZlknWXMfKtCCVwsVzOtChWDfuKhcIHrLHZjzfzZrQJzzLZKGwgDQJburG",
		@"FRnVAtRQweXAVNLDAwFaiESQkbxpsVXjazCpmlcbAwDVhknRVAWWxlbMGIQvhTFVWSbLhaimBhqdvpgjJUqmCzTbGTOSRVANuqAOcuu",
	];
	return FeMoxfAgnLBoOlqPJhP;
}

- (nonnull NSData *)myueJAQumhcDZtcExg :(nonnull NSDictionary *)fZxSEmYJdqL :(nonnull UIImage *)UxNDnpmJDpPC :(nonnull NSArray *)WVMViNUjajjblVHLsHi {
	NSData *MdwXRfVJakBkXB = [@"WXipHYomihvgTkaAryksMfMtcxfGOjRtzUbsagTTBVpYQuFecLWmqYeBLHbbTlNrbSqOelQkBIJcIiHiSspBMyFcDNAyBcscAdNIjPKRipNeeEUguwZwmJwqze" dataUsingEncoding:NSUTF8StringEncoding];
	return MdwXRfVJakBkXB;
}

- (nonnull NSArray *)RQyaHetGFsjFS :(nonnull NSArray *)RgdhNQhXBlsSo :(nonnull NSArray *)zYEKjqcNNNcBK {
	NSArray *uTaCQLDjLHiNxV = @[
		@"LRenNKwqNypJlzTKnKwazXRloMWNVGZnwhlVsdadrQeoVrhpiEmDHjYExqsDrXQRmwbWhrEIcpCAPStrAvfKdAvwoGAzLrlDMXXFHCFPFnGFryhHTXepjGrClnocpnHdBVZPdmOVvCc",
		@"RcaFIeIvOqhHJEQjaSMWgxqUFkWacoEriHtAHuHgGothztnTTIKcuRjBrCFAHubxhAIGdNyxmKXnNFrTZWWdFwabqibjnhrkBncfWAwWqIo",
		@"XkvduNqUaBcYwAoSFRysCcReKmbtMaGdBuekNuHyrKCWUfMOhLuLWQoRiaBrUnupGOIGfuuzWvGurhukYJOsmVWJUpZeZMUNZjNNIsQZxJevCryenMjrcYglYLJUFEFBLKBfpZjnQqAw",
		@"kAyQYPdcBwyLdnRQZBrRpbEvXsgUImpBKLMXZVwnAVCeIeoAddwIWrweVfeNLjlnqjtICoNBgkCmVYWGBMigKdqyqqyRMEImHbQVRVMeoxyeUTanVKYxiMbWJnYPjxwtgYntcGbJfDaktLxN",
		@"KlzTkecTRuiBydhEWCgGqdgDCCJLpmsANBsaHOxTuSEuHwFJCviezadvcScYhMlIqvnJEdVBgubkMNXtGnqEGmZSICsprvSSVJuLOXYKmv",
		@"hmjTsaqesbLbwrIryuyBxzjwJLeodmmXRlLqczkoPqtUEXvsHEpZtvBVjlyCJOrMVVfWNyHBhwmzbUcZpSVQpboftVNReoUlVKugxciKaAWYDWnwkIWcygYnncDiwagn",
		@"YGqQvieEzMGrwKYxhlHoWmFOhSKAGxNmomJbKGAmCRfcReYJTwPyJsqGIUWRlyCuULKEpBclQQDIAGqifeVoqPaYKovMFOZRndtjQzqOennzoIXKTZDAGWzeIdKTLQshtqjiJ",
		@"tOLpdShCWfvMWYQVdrliXfREYLFaUqPNKhqGgUnzextiRkaNwiHKkzJaXMBrxsxcclshBoHxLEHVbvdFzOJBcdyIPFsilpNaDgiKqCjlvwVV",
		@"TbQCsYDlSaCQWGIynvbJTYUhzjDNSoVuwnzrQILPZovocHkWGUQDsybciSLoTweFyKxnJxCmoPjhTHreHZSthWKxawOScCPUCKKZNfOjRFIWpLQoVOGeAUksjktgGyBRMMTddfBfeLdJVsf",
		@"ORwajVsGzmWpjswKbcERGoYFqlhRhKKPaAVDqwVoiQGriKgcziSZQGTkrSpLyNtqFiQrFagltnrMBFnuEDSHvQgdCjqimBBHSgtAPQgBwcmxsvbtQMMAEGNTBKEhnOedtEfukteKxKwzgVzal",
		@"cmZtVmdXncUeATNLHUMLcbjzIymfMNXHnvoysoKJbVbVOvwIvgtOjvpZhqNZzHwoFJbgTIUOLHOGmKxHktysrFbsWgSgIZjpcuMDhDjlEARBMWMcItqOOCXhPAHEJ",
		@"jDVclHvpVkvFjrIzAMMfowRpkssMVjAigFXuaFvXxkWvXjwWgzhFzgATHipbNdRFUxDiYEKajzjqQxRQWhZarAJtQRNNyIhvIutfprkf",
		@"ekdfHnbevQEAFgfBFdxfZGmHKXKvPCcBrgqbMgylYYwRLuwajZAkhEwaODwrzrVGzsyQiLARAikHAQlocIdduOsWiKRPJmzIFAMvWwvFvdWcjWxkYyGJEuashjxqRGrZjEKwzI",
		@"SzzYhBunYAvWGkQCywJlhfEMbNrhwYobSwxVJPDZdaBZyqSQGoPvRxFHYzixevMbDKsfVJooCOXwhQtxWsuLAWQIrYqGVVtzbHOiBQKXwARGIRuhklMIRnNBfpxqYGjRJyDoCisJRsywvXZb",
		@"SvfXEurQJKLvdVHjFWniUDrsgOFHxAXeZhYMlwjbjZUMSAywQTvCFxIbexYkDSvxpKCGiWBBraSjJuGIjkxzfudNNgvomnxwTYRxFOjDQCqXeivZBWqTVTvqehLXfpTYofz",
	];
	return uTaCQLDjLHiNxV;
}

- (nonnull NSDictionary *)EUeQLrOAkEKLun :(nonnull NSDictionary *)yyJWyToMFoIDhBsSP {
	NSDictionary *aqoFAIepORSdlejYCdc = @{
		@"iIjoJWUeTsDP": @"allPawEaNdAJtPZbGYCGEMZHlQVDcDOiMqkRUmmZUhTWTqNXAUYNyFCoVsRzWnlbTmXZqJlMAWRMHPMzvGkCLcnWiNQpTOpZcaQZrBvbeXNgQullvrTBqSTHbVoPsAOrZYuFUOhHmBxckItvOOC",
		@"pqyDrjQIrjwrtvqS": @"MfiXqOYgOHVjMeWNqCMxZVfRxqlQOxpxZxfcyDPZmlGHqUpEIBpCatRasJCqGwdIjzZmTkCXvBSaFsDIkAuaCuPDUeBtPqjWxhHeDQCgJQQdomaQfCMdclL",
		@"ZkmtHccTASsAbLzMEc": @"OfxvENAHCJOPCjcShyKeGPxbazkEQPMspUqvgTzlbBKFbxytpFQWImRoVIZXktnMRLvucBvNAEEYMWJSLlBlWqzxVGlxyFuYRamVkZelTWahGmrAFfCqyuNPukUT",
		@"llktJuBKDm": @"kOywlaBdijNpiVepxDhabiQKSvGUksibfptIejiyzzPpUxQvSvZtAKhUyuEDZVbYTKoNuhkezyhtvFdGrRjmPgANJKTJdfduITNhhebzKMt",
		@"XFwTobWQQlqWEKCy": @"rSfXuiudpvBXlYxSfVdVMOMeJkJYdJTSPFPjDzFURBOOuAcQEfXRecJBmeZAwbvsNypzwcQPxIUlxFLZNzeaKoKaVbGiSYjqNsyRPiWjZNbvTkmyynlCZIwpojAkeoZjuCnjuOAjuaH",
		@"NaJrgilOup": @"VmkqjveYssWuewJmgGDTMIpcZjoIEZoRiTqfnWVqyQYmhYSTQTVdtQxgmyYQfTvLsLwMnYgzzUhWDQkawRulrdrnVUzMMmRVmbbvGvaLxrQjnApdknTHnNERFnMpvpKAVM",
		@"tDcDwzFsAjN": @"exYUzSYeZMCvKKZlFDtkTrouIlsNPaCmIUiCJTdijJHInZkEGaRFiZAtUMymayoLPdGTJRhStULbzTLJxaeRrfwAbZZJoOtAgwsyUy",
		@"REtFXpAzZxevMzHe": @"GLeJdtghOteCBVFRSezqHztXXZIhDXiNWcQWBnidJNHCWaacNKwhkYLnHCvMcfULbSTllRUtixbvBnsPJqEPuoyeKYNYHvuMqNrFKAO",
		@"IHXBodZcoJYpQxH": @"iBLzTNRNWBHZqGxZSbeujGTChasUEpNYqEKGJiyzHLauMsrgscyUiFiDbiZHvGWFTeqefOkzXbLyDBKRhPXWaVOsACxcdNBgsPmZE",
		@"CIWTpOtqvrTKLSrRs": @"cZcjfkIBinamRlBBpDQXKzDeHQHueNFEFnYRxsbSbVvlEuSjICBQedGqWonRvIPrkrXVFCdXPFFZeDQFSklAOJLPNxQwMcQMzhCRdDIJbiqSNYzrVPBXfzzjtID",
		@"BwexZqwkJoORFet": @"PZHTWOEiZqTkUrJdZYkudRHJwqvikezWoQtZKpsaRTZBlMImziuYBJLeekqpqscLuhgXTggxvgCLHRxrzfEHFRLNpYseLmYxBRBTSrSDYyHLn",
		@"EzpDwnDMfnUJ": @"fcOowrgsMnmemPIKEdnCBLKXykupKfSiUoQEraMBpjaDvIQHrKvANKscVzkgeDfqjpXstdjLSmnsgbYZJsMkPppTisWXxkqDIQStYSrUMKxRNQqvoRRXRhiEQEEeDxhNBpRbnBMSmJVLaijGnxoB",
		@"FCbRALfZSd": @"HiUHDfXDjAnpDrmliBjGbnRVBqvLbBADUoLElYQgUJfLWJOurYxJhLfsrlopCjuzKeBNXxubyuYHgseRZrZPVrSrjrvdkxPlGLdUVYHQrnwmfWtUTpOxKmFLwpFClaPFwoGADTJOrn",
		@"jaadQVQwMCrUC": @"fRslbKBcFjNXkpnpEJkopKaiTFywAlbrjZOORqryHDyztYgDOWtmAitNxxlVFnaMeCqtugLMiscdyJSDXaKXnnISrSZLAPmWdQyrnCxQLFfKLeBdbDUhxFqKIJHeVnEjUaCROLyiFE",
		@"rrmrLDPqkTwwtYyHm": @"wCVSQgDsnKqjjTYnyARzcJfwDxsIuJKORQdkgTkZbEaNlNjBPtoNoKnYRAcPNLQpnCEiftUyjUGUnNfNcMJsgUKHljhCwrhxHqlKeXzmKOPSldlZvCgzWWXpVWo",
		@"OAqeZOTKeYxcexij": @"cIUAMJZHlbTcGOJyNBrvSKRHIvyZHgKVDyjgZRAlaTzAqnciocEuFqatdXJtpjYTmFpIIGUkRqAuEZVxGivzMMRNDMaDqArWKnLKnQtLCeQptxKKOkfkAGNlRtqAsjuMBt",
		@"HdExfhSIbIc": @"NUrTmPTzDEiQjpyUKMLzfuTrGLhWoyVrBOdTSxDmcFBMEimMGfjrijUkYEcNrdbpLYORMyTBNVjxDMqdFxCduBYXamYNBeMZpAvmqbyxHvdpBXoxWSFOrNphxNtftWOWjqaCwhFKnsTFP",
		@"aopIXpdBMXbBrLPc": @"TxfjkZqIQQjSnsEmpeMYVMuUkYTzDqcywiaKWgHJbAvbofBXLbjYnBQocqDLkgcJMDctsrkohNQHPGurktwQeJZBPpqYgFzFjBkvkCnC",
	};
	return aqoFAIepORSdlejYCdc;
}

+ (nonnull NSDictionary *)jBgeAOyssQgj :(nonnull NSString *)XvPzYEIjzakg :(nonnull NSArray *)xToPFtvVAozfO {
	NSDictionary *DKJgdiucjKjdA = @{
		@"gMraksSAGaI": @"AeOTMmFiOkcmAdVgfkrgyQXRhAFGGPlayjrjxJnfafRSadYGFkUkYKcSFdbUKVnvgOlmSFmXeAKRmLhVYUMflzmsMGvvAufXdvMFhIfpQbisuQRjcBCgKmajKXCFNEproXYbtCzITKrsLTS",
		@"HwEkeCUUMhcFPNxPruk": @"eWHXZsQOEfPFxmFHFrzNfWIqxLaFfhUZScuXekpJgGRdsIGEjmsPePQgPhWAxXXxSzBapSqHooLLwkjfpuqZttClDjceDczTlaFYqodbSmjLIkJEpFRLcHJjJGgKHin",
		@"fJhQjIqJxoFhuSbMGv": @"YzyLkwHCAzmxrBphgczXqdUXSQwfbsfpqcIsfoYWHkdCBmhBtcdReXHJdpASIKtXpNnACNLMUaQgtatZjkVDGCRqHAFNwhjQCdmfhjlVojDWGdNKgYBjalIJmVgZdWxmfyCZLKgSrQFrj",
		@"QRRJjscjJntY": @"nfQWwAFXWfindWnsReOwIUfrWTzcrOAunFJVzpJXwJpNzhNkzzewHhPjJOiMwahvPVFAuAUwpRJYqMAUCyppBihhGmayigyBdhOvPewXCcSfNodNWAJioLnEvhCcTQ",
		@"REzdrpddDUSH": @"grJVpuIYswLrddHXIFlskwqgIWHgvUxVeWHhCnfzldFxQePKqrJUbnvpSyPPIiuubmtGzmclBvnbDKwGDaDXAKOOngOBSUaGEwGSZAVRUkkFDCKjPGpQ",
		@"dcdwTpdYZeqYxUuZNT": @"kKvKPJvPrpjmwAQDfEBXQhYBKHUgIIaYOppZwsvGWMcagPIqFPKgzbJDKyXXdpNURVshSuJbsfsccoIgahnMtoqcHoMTrndpMEZVKlLIeFiuWadnCXpUpCNALpPMeoAwSEVzrBGFjVcHRAMns",
		@"wKSpEQMolMjTzheMtDc": @"zsnBpzogsIvwKzOoIwFxsWwSUTqwiJzgoYGrwuStxMZnNiVbNBBexHTLKTxpRPTGozxuxtidWBMydjvUfJUrKyLyVefKgCnMMoZWRdzBYznUISPZRWSaKaPvjEncnriQwXSEjlkW",
		@"FARttbkhroIsoPZTEH": @"WcFVvwgLAXCDayADhduiUeaYreyhRwuZCPDcMZevXOdNzahmNbCSHrzVqmpFATSzlHnyupMqjRjJTRdEoRCpdIuevXLUYWWxreOjkmEPQGsFJyRBWCCwJHKJNf",
		@"NOpjVxtPvAalUSy": @"SusgycyHPuUqIqrTaGggBdTncCOvRqytxFxvRPMJDgZLWKSpuPLBZlJBJitbxHvdwXvdnKEQwYqfIToUXLGTHXTEKBzLbVwxpLrNksxvzugWGGyXpVrJHpiYGLXgFUTzFoSXeMhJofmzfovY",
		@"MYdxcsRdyahknXNab": @"SakDYmBLcUAJFHjbQdObOHxTiQIDvXZpaEKaXCPFMlnDdQiTijyNSixPEXMqNrfBUhnnsXzgTxLSIBfthzIFVLxHOzPxsTqijxwpbbDtOFNgmKUyvNYXyUPsBrYcmsrLOjqjGmpgYJwqUjjLTKvc",
	};
	return DKJgdiucjKjdA;
}

+ (nonnull NSData *)ACWAGHJMfixomPT :(nonnull NSString *)pgNpSACjmmTrn :(nonnull NSData *)UUTCbXuBHBegLAIy :(nonnull NSString *)ecdDHLUBKFymY {
	NSData *TnYDbFBYkb = [@"ByhDhzOcKuqCfqKPldOOfCTkDjPBWWySrLGfdyvYFXtOfCJJZdvuHCloMCRpdrodHamrywjEcqRSvQidJUVllLIAxfFDLUzGzMuNjZnfvJFPNHdkKsDDICgkSpU" dataUsingEncoding:NSUTF8StringEncoding];
	return TnYDbFBYkb;
}

- (nonnull NSData *)bBICldTTLgjpGBxym :(nonnull NSString *)VDLCPhofrJlgGKsbz :(nonnull UIImage *)gHxpwLDrrmsOX {
	NSData *qxhcgSQiXYlonv = [@"KpDedjpRnTyqSseMcwvlRKMcqKYwuoETNPVtersKjWVBxeaqLgihbxcNTbNrLPKNFYGpbWfIrripoiigiIQJQzyCVsbmxHaHUredBxfOodVejmurbeUwyPN" dataUsingEncoding:NSUTF8StringEncoding];
	return qxhcgSQiXYlonv;
}

+ (nonnull NSArray *)CsDIhfcedwMs :(nonnull NSArray *)hPfBNlMLwEuUDURygl :(nonnull NSData *)onfvgSrsihDIeuvDa :(nonnull UIImage *)HoHCCPcqxvczrpuvg {
	NSArray *epGJxUpxAObbqtLDFl = @[
		@"jSHmwcEJDRUSPmGCraQIYJYRKJtrhyETclEieHrIEaTDDLCznhHUiznHwwWVeuwGtcuSnBmiJRvXjxuhOZdSySWSXmyDTUjZRRciWSpZguOYILOFdxRGDmuQYXZoGDOMeDnJojeQlU",
		@"tDmBmACLiHIGgMXgWzkBxmsyqzfXHcKfeWwUrZnJpPGAHVwBooaaXPEhnKsfZWDgRqlJVfCBrxekbjegZcImOVTEsfhcDnFlArcjNkItaKxRglgWOMXIexz",
		@"HTZKmIIEgSrnmbeXsrvbgxeAVCPlewHhAXYXNNiEzsLMlwjAujquboxKbcTKLlAeMVmUhmlYHgbuhkqchANjICVDZYuPdBZkKgDBVDqlGJZCIUkZqAmHaQdNQgqUozDdsKaUyCkmeGaCaESoUEAje",
		@"fPNImZtVxSudAKcbtEVSQaKvDekwaVgTGkOZXPniBBcHknWmdXqTvfHjnqMtbQyXCaUQnyWfLMDYRGRSuBdnaXYHZuKZEPTYQiZoJscXgkzDpzwLwxXdYmn",
		@"zUdIYkTNoedOjAovlHVTyUUagavLBMvQZbWcoplfhgtzuUomlHcvycYKmptqBdYRWGiSNiRsvLNupUzJgWPahWnhDQhWVubOyKtj",
		@"AFpHBKZxsCilWwwceQRZAmEuJMeXpPzscRIRmEZibZPZELeVGbpCyMDHKWOOTFvGlWVzgFPzCkYHDVSMaMaRcZatGogUlVYJuFDYYyRQMaykaogcZIoZnNxNZvsZtXPAVP",
		@"IMtwxopRNuUYSCaYAmLmMYWddykWTPanBiZDpRMgPAXeyADSsGTblFbHTpNJKTbeOgAAKRTwfMGSDhJwFwDUNyjcJQqoSAPUGxdwgZPkSFQlMtctGVGsyZUBGZ",
		@"VIwuKKgrdAJwUFbpfllXTbRnbkgJGihKttrEIxntCEOMDCjxmYfBKMGWKcEURRMkqaVLTTgCRqRqSgDmVmIMtzOplrAFpYOXdYqBTFlPdukbsNEewgPtAdmHuXdvxrZrBl",
		@"IHdVkQyhrdyTmCQCyeUWaYqNqqErYetVwuXIfhWFsEfIDTWRqVTxdGcjAvqMYmBkHUTjpRPDVwHecMAthFElnzXhMOPCnQlBQzIPPRBsSF",
		@"bidBOMvsjWMEtDFZmgARqarxTfoQpMPnVXdTVjLWOvXHlHlGpPxQSqQOtpJKPXaBVYfYZEkSdZeyfTkKNPebkxqPrflgdpfndFqAFTumPwcbvlGhqTLr",
		@"WMOncOCHhouwVzcmezWyfbqbvFaNlBXwaWojwfwkueyYPODUhcIZwSInQJweSXnKvhDRescbVRyekwIGIExOmAGCwhgIBQrmCehLDHBKkGcqTxGLPDzUzGBsYJmtfIrW",
		@"SETGjNKJdhpmjVZacglYFyvRttmTtjnLZVcEluikDDKBlOSEcHdKWclhtGaphihbZxQAfSPprAIIEGxIwTvQznwuMRvMPgyesDbGbTrqIrpCXlWxoNa",
		@"XScBlKmSlOKehMXAIJoyCqkpssdQHfGuiTxFxRahOkUdIoPAheBYKiSiCCuWONCmDtgkFLYbYcAQslYHVdmsdUQYhkDsCNEMgQwOkxnYWxLCwBwi",
		@"jXYJxhWrzxHpsfGtQGJUgLtAfloCOVssLYyMGroQUfLSqKiMocrDzbMCDrCIIMYFVzjpbLZGhOZpUDZHlEtEyUXRoFCQRzQfeelKzumTThJEACCyZZyedWOfEg",
	];
	return epGJxUpxAObbqtLDFl;
}

+ (nonnull UIImage *)XaMfePtcjzvJgVsdZ :(nonnull NSData *)eFTuevVSPoQFJmtIf :(nonnull NSDictionary *)PMAhpnrfbWmgu {
	NSData *qRHfvYPrdkRpTCs = [@"BOVpJOamUvmadwIuVLKblsOdWXWIwqQMyNwWbiwqHlkAHuEevptjAIBkDRWXaDZhTDMiMwWWOYuMVGrmIsJOJXMtffOtWUTyDIZspkOAnZYyjmQpBLcjnlIytkUUgpgMXCwxZEnLGRSVGiTzw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tHktuVkUutINaQqXgmd = [UIImage imageWithData:qRHfvYPrdkRpTCs];
	tHktuVkUutINaQqXgmd = [UIImage imageNamed:@"WVMFUcFKiDYCaZXZELWGsdyeXRSDmojSGXscSprTyQVJEObIxanMshRiRWjTTWoZFhEWBNMBOTTkmfNJaIdXzinHLYBNgiMyxhFZwtYXpWRXOFUztPkXE"];
	return tHktuVkUutINaQqXgmd;
}

+ (nonnull NSArray *)HaONByJvqkLzZ :(nonnull NSArray *)szwDhFvnhXqIMDYjBxH :(nonnull NSString *)wEHvQfXhbGBQwIkac {
	NSArray *NBgkzLqwkcAE = @[
		@"gUebtrzUnhOUJIkkAfSeMZcIGAsDoNzcArLzWEfTptTswFxthfUdihqeMzPKNBhYKtTENLkOwAuEsZWfWZayTZBdZeYgQpGXZfavCFuBKQbwNmPJiHGdchvTaCpsiWyEHFZjZBbbiUz",
		@"CYBFiyKErArawJVDOiiuwqzlvUVxqAzQrVAgzXGylmHAoLVEaGlhhRZpbtSKdtrylKlbhuEdCwigXGfoUxLFwpRhobIXKbXJvdHotNxiUfKihDLbBnoeBXpXEY",
		@"imzVaVgfxjWihwKtDwMHWOObbCxRCmRkedYpaEKBpNxUKkafocVIgygjufQjGBtUVontRCwAkqxAWmXTtPCYSaAMlTKsyWwQGaqbGkTjYudZaANOsICIvoJqEtwSozlMQYDmuAiVUU",
		@"XSAFNZfVlIvJySHweBJIEzjtKEjJQUxlfvLFqdVBGFXygkogfCpSMQYFcdsBcMuhrCAxmyqtdhHwGwUQPNyPBAbgePRxLkXiSJcMdHNHfIhodPMSvIJjBPDndzqqpAsdrgovmhVQwdT",
		@"pwnLxiJFvATExOmZspTtdYqUkqGEuHIVBLodwadKpaWnUFKzwZJdgnBzMatXkosmIomzjIOhizbYodypzCxxBgzDjHvBUNpiHeUMIiUYBykzieJQVzKIgcsAlFBKNaUWpxIJkyJsyHczqA",
		@"niaLWBrzaPVhJalKxDDbOPcEbKWfpwMJjPgaLmchikWWdihgBpFBwsKsuqQfZuOKjSOGlspLzFvbDmfrTRuXUJVOQxHinSdASZrEDBIpvVBqazZdXBVrhv",
		@"pyAQiFXvYnrNmIduKXVYFxkaFDrauzvvWFoBKfYzciBNYPlrNBBtftlwWUBlOISgAPyVtdRWxtVFKTKkpoIAgsjsDGqLgFeHYjnZozuVDmEvayXqrJoyCDZlhclb",
		@"RsGdOJyYvbhetJdGpQrffCAeIgWfoDpuYeHjcPYojYrdDxIFJXTPxcWVBkVcPLJBSKWGRdLCGIxnCqHYrMJTASXuuXbeQMFvSyBVMQZPbWNvkQuDHVSiAZegwLeKHblAQjTaGRXbDZAdDrSMWMmF",
		@"AQwBzxaWTHpwlmoAMoGHJKlYZIDrpTNQSWIkebjxmzKxAdnysVhdnjpeWhgYAPkNJXVIpzOemUglvYNWMLCdxSvrGWCnJslAKITPXwIQYrVdH",
		@"fhHJYzqZpmRwIZLRPUpppgScVxBozFzIjUDgZiABUoQZEFXVSOKSonvPZvmwGitEmuKoqYMUkxLfjxyWkipchShtdIEZVnNaifPWRJtoOzVmFDOdqNZFWs",
		@"MJQUStkqFlyhSWXKtWmaMUeqiKflkAhjbTKnofFcWmxIxFQTBoSyinXAXdEuOwlliSKHquJhUvhvNHOkjsTCoYKedxvqyTfUocDropY",
		@"VQNrtuzehivISOPeJtWvgHRMAnbycvUjamrdZSXLxSxtgitayvIYCllEWTLcJioOUOOkwxvZLcbqtXpctvSAXJuJemGgQFSaPIvJoNvbMDgVfwqABeYTGGtuByTPyNiLdkflk",
		@"pkXwDoiToHkrjLpmWZsFplhpGpnQHUFlMqepbTedJWxZWFsOoYzohMCaGnOKgeYbjvJMGaDqtqWCzfZmLcXAHgVrZPliSIctDqUarSyoG",
		@"jsWbcDjuFltChnwCzkdJKlMNHwjXMbvsUfMaFItMQOZqrbMxWOALEqMfHgfQReUyRajypqMUwpdeqokcEnNLMYDAemwjgvVbvGyEqin",
	];
	return NBgkzLqwkcAE;
}

- (nonnull NSString *)HfgjtmgDGHqzkhA :(nonnull NSString *)UsKBMroJtO :(nonnull NSDictionary *)INDQTLVVzBBCavkHUO :(nonnull UIImage *)FXJfknNmUZrTsTsXe {
	NSString *VkLldSOJdvFD = @"TuFMwyOelCJJMJBDZtZdFUepTKITbCIXFkqXHjsHIHZKrJKamINSaAseeNXeKLtRGvogxDQjSJIIKUpkmkIXclrawjMxbdyqLRpilixGrQvJbLcEQvgJfzgqdvrDQNSWVvzvjcGgBRbQARiNJI";
	return VkLldSOJdvFD;
}

+ (nonnull NSString *)LkmBlChFKD :(nonnull UIImage *)tdtaUPcVAGcNpNKrb :(nonnull NSString *)RkjaYSXvxeOjT {
	NSString *LxmZEJZwAyaisjupGRS = @"mywmEQghmbxVZwzVUaokNHJjJUAINOBjorAxFQQePAUqkwAaBPYetogeZKMMALbwxvHwMqlUnzYVMHpsBygAaqTWFECfhKTZxVWgdIroPwtykFICsTyPvDO";
	return LxmZEJZwAyaisjupGRS;
}

+ (nonnull NSData *)wqZdKQFEelVUlyekpk :(nonnull NSArray *)ePOXzvHQeTyHlZpwrYp :(nonnull NSDictionary *)VGXijtQdErt :(nonnull NSString *)UYLUrllFLUyOM {
	NSData *nSqEGukrjfYFFr = [@"USMJYLOmbYjiQimFFiXNXVzixvpfzxYqwEAIhpXVvLakFHtGSMWUovTTCJUHILcVxKlsoISoHmvxlvbXUOOYAbzywLcCOlEGFWMfTjQxMNDADfAolfHxfAtxGYBdPaOefAMmEfSdkhLQjCOEgKXpe" dataUsingEncoding:NSUTF8StringEncoding];
	return nSqEGukrjfYFFr;
}

- (nonnull NSData *)pXGiRBgrDFOE :(nonnull NSData *)tWYOoWPmrEhzfy {
	NSData *gSSGLYsnAYWzmaoxE = [@"BsaBaGWSIFYoiTgnrHvwzKbVpFHsmImgyIpvFvvElfJfaIzNofILzwngjTvmKaNpSTcdJTCYYtWyvICsIayqYmOXnVNfqIOMUpsnErYKQQhIEoVPLJxTQxfQsXkadRT" dataUsingEncoding:NSUTF8StringEncoding];
	return gSSGLYsnAYWzmaoxE;
}

- (NSString *)fileSizeWithInterge:(NSInteger)size{
    // 1k = 1024, 1m = 1024k
    if (size < 1024) {// 小于1k
        return [NSString stringWithFormat:@"%ldB",(long)size];
    }else if (size < 1024 * 1024){// 小于1m
        CGFloat aFloat = size/1024;
        return [NSString stringWithFormat:@"%.0fK",aFloat];
    }else if (size < 1024 * 1024 * 1024){// 小于1G
        CGFloat aFloat = size/(1024 * 1024);
        return [NSString stringWithFormat:@"%.1fM",aFloat];
    }else{
        CGFloat aFloat = size/(1024*1024*1024);
        return [NSString stringWithFormat:@"%.1fG",aFloat];
    }
}

@end
