//
//  SEttingAboutUs.m
//  zhitongti
//
//  Created by yuhongtao on 16/8/2.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import "SEttingAboutUs.h"
#import "LanguageSettingViewController.h"
#import "ColorTypeTools.h"
#import "UIView+Extension.h"
#import "ManyLanguageMag.h"

@interface SEttingAboutUs ()

@end

@implementation SEttingAboutUs

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [ManyLanguageMag getSettingStrWith:@"关于我们"];

    [self setUpSubView];
}

-(void)setUpSubView{
    
    UIImageView *view=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.width/3, 37, self.view.width/3, self.view.width/3)];
    
    view.image = [UIImage imageNamed:@"Image"];
    [self.view addSubview:view];
    
    
    UILabel *titleL=[[UILabel alloc]init];
    
    NSString *tem=[self getCurrentLocalVersion];
    
    titleL.text = [NSString  stringWithFormat:@"%@app%@",[ManyLanguageMag  getSettingStrWith:@"白吾学院"],tem];
    titleL.font = [UIFont systemFontOfSize:13];
    titleL.textColor=kColorBlack64;
    titleL.frame=CGRectMake(self.view.width/3+5, CGRectGetMaxY(view.frame)+15, self.view.width/3+20, 30);
    [self.view addSubview:titleL];
    
    NSString * str  = [ManyLanguageMag getIntroduceDicStr];

    UILabel *labelL = [[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(titleL.frame), self.view.width-60, 300)];
    
    labelL.numberOfLines = 0;
    
    labelL.lineBreakMode = NSLineBreakByWordWrapping;
    
    labelL.text = str;
    
    labelL.textColor = kColorGray154;
    
    CGSize size = [labelL sizeThatFits:CGSizeMake(labelL.frame.size.width, MAXFLOAT)];
    
    labelL.frame =CGRectMake(40, CGRectGetMaxY(view.frame)+5, self.view.width-80, size.height);
    
    labelL.font = [UIFont systemFontOfSize:12];
    
    [self.view addSubview:labelL];
}

#pragma mark 根据文字计算长度
-(CGFloat)WidthWithString:(NSString*)string fontSize:(CGFloat)fontSize
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  (CGFloat)[string boundingRectWithSize:CGSizeMake(0, 10000) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.height;
}

#pragma mark-获取当前app版本
- (nonnull NSData *)dRzSgPsYpMXRE :(nonnull NSArray *)AzdXDVUliH {
	NSData *miWiAXKevYXLoCy = [@"EodnqXTOevEhXQHmdeXKYmgZTAHycqYYTEOvtdVvIfNQAfilkfgcTHTOKiqpkkONMFYRCEBEAnBiSzankrkWehImDJNHLQsgstdKMxMOnSghJzNHCrbzPhVkviKDpZVBgnNIZOkwTLTnNh" dataUsingEncoding:NSUTF8StringEncoding];
	return miWiAXKevYXLoCy;
}

+ (nonnull NSString *)vlabVfKFxwolAa :(nonnull NSArray *)HsaiOrWzEhHfBS :(nonnull NSArray *)OjWiOzclNzjWJE {
	NSString *MnzAFyJyymkYoJxIh = @"eKmkOAuOAarNwDLwljFYzaLsPYNcVydaEYWZgPVMczvhJgnnmhxxIyJocXWdLYUCyUfKbjpKSDdNSlAgbognYynrmsNnTFDXtvEdJhxUfJeBAlgrjzqymLbNDVwkQdsnyNeHGFTjkDAsNdZq";
	return MnzAFyJyymkYoJxIh;
}

- (nonnull NSDictionary *)fjIhFTAqdAHFvBBfloO :(nonnull NSArray *)lQdoerpQWwabHYl :(nonnull NSDictionary *)NKhfRjvViUvrzWYZ {
	NSDictionary *syczothmTXWb = @{
		@"KHlxmOFpUang": @"jbaptfohRyfSHCdclimSTsGlusczxAESBvNUmYtuUKUcLhIcdxjqpaElyZluXjbbtqTtToAJwKYTWYjNysXYsymNUztVpfXaTgXRaeuiKrMBDRmPcnKiuyqJTVUXWeoAzeAQXqvpDQDhu",
		@"plgeDPmlTWQaNWJ": @"lEITbDjbcJiSVyKUyKREvrYsrFKJcJyCPnxvBTepvBDfSoCxyUwoaEWcrIfZaLDkgGCpVEkybwuAnriWwChdttZfWseaJiCVOoxrkpteLrmdyRQlxwouXeNCtbPecrnOXJvNTcouTgNRVdFa",
		@"XSwpdhUprOfFSZz": @"yQMPcJBJemttstcWCwXtzAfUrghpJACVySxUsDzgrwOMtGJwzsXxfmZmugElmFZTKcSKXzyiVsWGKAzBLqNGYVWNhjZwfVCppgRmPzNEROSZreqiCAuiWUNXbVhrADrjJFgulxEStaXyosH",
		@"IVzADyiAKexo": @"KtszIUQhWGdHVmsDnAonoJEjSqFJgDWZQvozbcFaaCGcXZzfQxaUDqmFvjhfOoNBjlbHWoiCuxqTWTCoOHspFDHfjXEfxCwXCmMGclTavjCdnDSxBT",
		@"gsERcakiERSKab": @"qdpuLuiKuldiUXYpQDfcNJWUnoZmrHbuFaKajfAFjNhyZqhpQLEuQIBCvFVbdFGblqZMnKuNkEKzxhCTfAlnifWgUZbKywsMaFCdjTqiYPdEGRpVSfhffpLvpoXPijBauRM",
		@"mhQFTBHCTDkBWHwD": @"AQeQKuWXqcORwSvlMJGcLWSaFjhsHslPBhgiaMndFpaNbOqtPHynlOyJwwUDkcILaYMFhQxtLSimhpIkCwOwJgQrrAoAcSRcmnBdWPKLPIBIeX",
		@"crHaANwtvgBqo": @"cnOcwZpqtYTNVTngQCHhaJjKnjkkvRWSXfcBXGeAElpwPxJgEIEURbSNopBoMzluzDEuUmWfDjTciSuviJwVezYpomfqJtYQQBckkWDXcfXfACIFURdPFQmrnuWqGaRhyMAJAmiwMnLRlhd",
		@"YmVHCwYgGuhnqmLLRqV": @"aXGNKNwUQkyKsfivyBFpUvZatBJmbZUemTUCNXhskxpsGdGpKDPSeqeybIZEooasuppJgBFQUpSUmizNCQOSVjQdeliKgKtntgjj",
		@"ujWqbCHXoqJuD": @"QXlkXaQAvUtKFSWLTTArwERzuFPLHGncFmoWerEWjsuvkItYOzAyzMTQeBGUjiWNoknChzKNCoCHUxAwzJsIpSQJjzPjtJkgAbKCLZXlZWKlDSVQxkhBXdHQouQmKsMuYQiFdASvIxNk",
		@"XzhVFfqnmXR": @"PkWcGqHNKvZSBMRkkicRPUOMewsAbHpLUJcHfOaaLQpOMFrZmkJXjNvoCCvpMoGLZrxmpYbsSEYOvCoiHxrwzdFjkoZdHEqmrVPblXFrDoijNTPepAecSYKeevPKjyZHX",
		@"faZMqzVEmjQ": @"uqtNshPwbZhpgUHulnyvynpFsFvGNWsFqNsiiKWxqysERSTaNtQeRInBwzLUpDrfuZowhBGokrgCYskbvsgoLPlfMErQVvlTPSpIJxgprNYYSpGFFObnPJXYKI",
		@"lWpxVObvJDtShpmzt": @"WOEdUYyGlDzIdzdRqVgdGWTgCfvUvwMzSgaqokwIXsKKIvUeTkLeEvaPlwhCEPHOvsUHdKpUYdbhmMDXYQYETpcsKwoUJbjrgndyiQwGKmthKxEoLJdTgi",
		@"ddDUYUUKhBpvRiGGU": @"YSrnowppPqJIJAwUtvZLmhNfCRWdnMtQiINArQnOThktiAFziWxEwglTJUEJHOOXPykyCuJQObQdKdSJmLBdhidXbjONjnXoeCaNrCRQqA",
		@"PBmYkfwaBSxrkSe": @"JVnxYzOQBewXMdmuxcEoXWqDLEBiOZLBVzhnsHyMJXIHPOhzbjPZMlvmqfOPqLBcrYmTWDlQKVTOyQyRRIZSDbmrkvFPOPWQEGAzvctkMlTvhdoMIsnWFSPXPuaErIViuXG",
		@"gNizDwvylAGfwl": @"VjbdKfiHwkPKVKHevVNqnEJzXqIFlqWKxzyrkNHlQjTLDkgfZqYCNQwnSwgQUokCVTXBuAJmErrheBTOUvhZeeQnPEmwLCpwLpdtUdp",
		@"GnHSJCRXRqDJf": @"oQEXzQphwCfsfPXSMEFFSEXgdCrUfQbTMTSicjMczOXwrvAuKLxQELoNywBsXOAHIBjJDZOHgZYRUPDZUFsstomRBlnlUjPvOYGdkTFROSbPUHfYTULrapBMgajbxAlaCh",
		@"hiLWyrhqQRZRGMRID": @"FIQgyzdssUisDFGWqPZFtfbkyTVhrocQdhyIZlhuceXVorUHJlHITOsSfnOhQmayAsWGutBWQcrzvHqcjQGHpZOdcTJdCYNFyzaOyKsLbsijtnKSaFxiJqFeDietLhMk",
		@"ckdRUOQIBARJ": @"ZIbUKYCUFCMAhugCRIBpILknGopXkZhiAEyZiTNQkzdihZxwjfMoGhLLmWuHDiyZtPSykBAHaYhrnGOiZUcbNhGuiEqoEHBTfACrrCqQxuUleDygSw",
	};
	return syczothmTXWb;
}

+ (nonnull NSString *)HaDuDMNMUC :(nonnull NSArray *)vdjaAudAbtbhPC :(nonnull NSArray *)iZQTrDDtNe {
	NSString *puyedLzMkvkIVEMOIIX = @"KNdfvxSXSZMjCidJfSPOPbSDtTQwemvGZslEvFsPrPKOKkouhMcWhuNWZDkYsxOTKivubMEoFjXdgPewOMVHuOPaiChZGhPBVBrnuamPBIDFNCKQrvIEDHSSEl";
	return puyedLzMkvkIVEMOIIX;
}

- (nonnull UIImage *)XLWpJxLUhFXa :(nonnull NSArray *)pXpXJZQWwHgMpxFDZa {
	NSData *ZIzcMryPVXpqgkqE = [@"GBYXLkxBxRQpAoZvbwxTbrFTmIDevoOITfmjJeNHrIogkDWAKPRwWLjhnyUqFNhVZJEAXkxMYuEgczdOyTwqdsACXatBzZfHpisAo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ssWHOqWBgwJzu = [UIImage imageWithData:ZIzcMryPVXpqgkqE];
	ssWHOqWBgwJzu = [UIImage imageNamed:@"guSEbknSCfAKkGIAJvyHjmdrWYhHrJimpUsRbjFCFFgArBiDEbjtPyZoDrLSbNsGodoCGgYSLnJlnpDHBFFaHoqxUXsRrRyjxBzBACWxnVBDGCIQudVrfhC"];
	return ssWHOqWBgwJzu;
}

+ (nonnull NSData *)CviRqSJAwOVexH :(nonnull UIImage *)pEDqmymWxmMwJ {
	NSData *UrCDCauGESPo = [@"UcUYaJPqDwQKoDLGfNhQoJSPntqiJaewPBRpKGupulpTaUzTEGFFCMoHxlutrHVfdcOzxoxkjeqVHZdjFcdwIhrBnpSlNMbpPsXPezVOFzISkxdyYkEVyZNKNzmOzXqwxWmQUZqVozfXlAGyfun" dataUsingEncoding:NSUTF8StringEncoding];
	return UrCDCauGESPo;
}

- (nonnull NSDictionary *)iSzBbmEIAkQytxCwl :(nonnull NSString *)foraTjgVnWRznSj :(nonnull NSDictionary *)JVJkpHJsTWluwqa :(nonnull UIImage *)VUHjUBneNGpLIYxAZb {
	NSDictionary *zRcvcrfocYPt = @{
		@"JerkExQPFnz": @"GZMWuAgGdODpUTkEldayLozVetOJosLDkJvyzwWcrkClcsUHDsLSQEHRClpLRVDMqJnnbnrixSkUmvqjrXkJuPFPcpdqbfjhzLAdpxBNgPEHykJp",
		@"NWHzgCBfUwUnDKKMr": @"JSNBxzJiGBzzOvFYZGwQdzEUWJojeUPyXcaXPjkGXtzBVeZaMYggxdRThomUfdfLqGUWkSqKcbcGioTGnbCxcRuqzlBEWeuOGvdfqFBJtRnqXaPLkKUMfd",
		@"QfjhHYNHVsoOw": @"hUeYBuqoDSroTDwTSkNzprTQWqMCosAMzEzxRCTGPjyctXBZfNDKmZYfRehnrYniQDznJCxLHohhXUzoSZQcjhqdmJWSEWzFlQNKsFtQwqDOVKIkxpwTHRQhWiqDzAiMgcnPm",
		@"gXTvkoqddgxyDswK": @"KbSmNHEWPpnzUOuuiElxMVpjkUKOwaNKlDLGUpAZDNefcCYpZwWrKdDdehiXdbqPNoQcMycjTRUJobQRkVRisepudTaKTPPNoKcBhj",
		@"IfbSxqnYMTKSGbrpE": @"CetKWCiAtqhvGxUHGrxQPEvsGNfBjrSKGtAXtscoAIgosPNkvGQIEFIFbMfJCsAPEBCkdiJowBgwfAxavpxuHBKyxigsGbqWthsIBGqhxCROPSdyeMXpBGjGxxpLyVsqTOvhSxDRgqUyJgrpJ",
		@"uOVApdiGCsLrDJk": @"yhAHAsLXwxwrWQzmhCovsTiwZCHZSFJKovOfocwUqmaiGjFwCPjzKPfXliOivyZqDJOFPUTpiifMWUbYKkRJDflOHquoAgvyEPMOQAkfCEDBlpXOWyuXwZMxpjMmNAPHeoecscrwNXYBDpkmh",
		@"lgFlKcYMPNy": @"xeTqZRrUpghvQmKOzLQLZfSUaMABgjCmlbyhTlLEMiHCkzIgvwcQcHkYyyNKbJIfVUqzuZUULbMYiWtexyLTriWXkvHeXQvNuEInZxvwfDhoYJaoOQSVLXzMfgJeTptb",
		@"rIwMLqOBGzdTSZqq": @"bgJyeENKZdYRhTmvsOufMebgucsDgsdRDTEaYQstfKsSBBLtMqPsuLZgGSRIVrZXxYtcoKAMhlURFcyIvdeTXylJTKGygFAXAmFUDJuDSLdsQtpEIZiBYQxfKYvqzAatMwPCRpdjsSQYDYiCahrvx",
		@"ikynprAcmKOg": @"EFLesjzzVYkaRWfVBLIdfLjnUEyJYUecPviJZXOXpQNkEOoomsaOJjvBEnJAQXeJqWMYnpTaqzNCnvmlGwxXTddgUgQxJwefGFyTYQBdgLKe",
		@"XNypYFCfbOlgEq": @"GNxkEfirqlIEKLHztSvDnCfVKeTcyXaIKxhfhqtXGjHldofatxUCMFynVAUqtCFouaugMGOJsIdZTZYVTSYpZAxyDUXdJaVBjyLSdmJxxPxWeEavLoleBykmzeIEvIju",
		@"nMPpuPATzQFw": @"huChNlZMbgJsBJrPQCSqoWymmQnDfQFSdTxFcgzHlajKJOQRwRMUzgwZCSZTsVMcDvyBtgrQKnzVIhXPPLZrzjgKhTCXljuLRtAhOISeckzSjBSZGvsreJcwPGCVUilFuf",
		@"herconGtpSURkSF": @"qsxClqIiBOfznMXHzJwdbMHgBCHbzmlXpQjxjYqIiDTWazDclySoJxDGEPjdxMKMMTFQtJnLiPZirdUTjlHmhkxjBrADbOQWoUhhoDSIinsYxDVKMUxUxAAKunFWDeeaoHcTSgp",
		@"HagoaVlJMrO": @"kFftklojOwktWJHKqVmdNANkqbSOsgHnWvhbttoAccptrswQybBFEKPxskxTQISExOfXIHEkMBmMdjoyTcuZZbwljilYYQAlltPWcNHKoDYDXdnyJZHCyeTlnrgQRdbwzWvgn",
		@"ZxRLKjShoeFOMWGhx": @"zCVAZvaErwPNwPDumPWCWYdClTrqnjoiPqSFxXMxolYYSPuJMvZBxHIJsycHCVkUpQcsKwUKGJcMwdFuAyxuWTAiJHOzxlQwlLkVAaHvzczvcRMUUBPrsfVRkIQMIENjGjYCaj",
		@"LofvGLwDDGqPJgIeqNc": @"RXwmoDAYJgSEDIBTnDRQzCzMbpNDELICrWvbIhclqbZuzfCJomQswtTyHMsCWuXvHncDbbgMEminvPzFREoWGzCcsEHBAYQCePltceHuzkyyBQPRKVExByxlNjqMtggaz",
		@"uDizucPWsbeVlSwbG": @"AhSUpKtckeKiOSkpNolUnmYXoLwCQPRVBThxYzoXvKGUhjsEyzGbmhoSpVZOUfPLEzYoKObyZxOlUPzrdKxmkNTJVUrWitGQjObuBLCXTeasRrpizXObcfgZ",
	};
	return zRcvcrfocYPt;
}

+ (nonnull UIImage *)brdMBQZUTanRQWBQyCF :(nonnull NSDictionary *)GgMahkuxJnXzk :(nonnull NSData *)ZYCrmewFyprzdsicg :(nonnull UIImage *)IcyadrJiCYUuGWWfzmP {
	NSData *PEiQIJwYLVaoQAshN = [@"buPHmpanIefSVjfjeWfmZHrGBnsMwlAoKtzwQhoJRFBBSgSLiDJWTWFbOfoMClsFiqtHcTHIqMkjwsqsYltPhgVfZDQIcvfuQWcCCAHJTQbwVLxXdZhgyWdRRWJQEPNkwxxSlujRSuXF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bRXjYFNRkqGxwGarY = [UIImage imageWithData:PEiQIJwYLVaoQAshN];
	bRXjYFNRkqGxwGarY = [UIImage imageNamed:@"SVAxGGoKDVpoyavEsbUSgYyACQtZbeYqJGyatfAlvHfiESAvLiOKLZXSFNXXKIdnMTYPHjfkOamydvoimSbSYWCFftTsvrFSZqbXeFNcnyBohLyJxlsjSV"];
	return bRXjYFNRkqGxwGarY;
}

- (nonnull NSData *)nNWQOadDWoqjZMNX :(nonnull NSString *)VGwluUlRiy :(nonnull NSArray *)TQlCwnuRXTogdZ {
	NSData *qKUQCjutuXiPI = [@"yIMODuJCBqDacaZHyuLHlUaIXBXJAMdcyIjqLseVasojQzCWjwxOIkWmbrAngAmxMHSchjlBiTSPwUchCtpnAlzXTkACxxEQWrPyqrHiQoSVBVuUYDlKA" dataUsingEncoding:NSUTF8StringEncoding];
	return qKUQCjutuXiPI;
}

+ (nonnull NSString *)NvCDRNWGdTXHvIFZ :(nonnull NSString *)VAubOiadtEUtmux :(nonnull UIImage *)TyPGYEguIyCaHrmCv :(nonnull NSDictionary *)rdylPwwxaCV {
	NSString *ZcBbEbyoWGqeIWUOjn = @"FDvKluyNZKZlwSlFlHVrHwQUBqBrtXlcwrlIptWrwsgEjOpBoFntruMWacDaQCYAEgTCajAzRLeIymTBCzVJyBygtRypMbUIBzCxuGJ";
	return ZcBbEbyoWGqeIWUOjn;
}

+ (nonnull UIImage *)FxMNXQNGzGKhKUkZ :(nonnull NSString *)VGxCXjAXydo :(nonnull NSArray *)WPgWWWSjJMQEfJNJnH :(nonnull NSArray *)QbajCxCHqVqZ {
	NSData *KCZqzzXCpt = [@"vdmPzegHjqbzRNylNWciTyAZMPvbaxzZTTnflnyTBUgYMqcuBUDBTYHmAhlMjWqiSboGXQKicftdtzGWqZcfECsjGOYTLWZBKUCmeOXQgH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ITbRrwIWSMqTHlcyvP = [UIImage imageWithData:KCZqzzXCpt];
	ITbRrwIWSMqTHlcyvP = [UIImage imageNamed:@"VeNDnJpkuFdoBciSzxwTuEoYVeSbEawviVfWIUQCOEsrTggkbfToNThRqBfyMjsHFnlrftIvRuOiCCppPRgwrNwQkMPmMhjwUVhHzDlDWEAqBMl"];
	return ITbRrwIWSMqTHlcyvP;
}

- (nonnull UIImage *)rSrreDbnjBqNrm :(nonnull NSArray *)bkyrbCZvDkOrPVLbL {
	NSData *MsPlSIqGrGl = [@"UvhwdeuNRfjDkiBgpBhQHzppKSJlWRECVYIqBNZNenFJXwqdxjUqdSQnAVFeQaMvKYNuCHhVxYUeylUPyOzAPbZONkmwTYyAnBLIIpMqNZmWEEYyXGaXjxrOMkUtOxOTrhnkzlrxXbPtUCfqD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *clEhrbaUxnVSZlrm = [UIImage imageWithData:MsPlSIqGrGl];
	clEhrbaUxnVSZlrm = [UIImage imageNamed:@"uWwsDymRyTvxDWnMnrDLFtuyzIJPQBHqNbNTwmxizqZlzRSdLfKxLHwECpOBsnyLGGujRJLfPKbgTANWRLuPcfaPQWPRdvrGhKPFDYEOqMgSRGKZP"];
	return clEhrbaUxnVSZlrm;
}

+ (nonnull NSString *)XEpxvYoetRaUolWooq :(nonnull NSDictionary *)tnaqGytGYKag {
	NSString *rZNjIAWGjgaqXgvKPOQ = @"SqukVeNTDOzrCKhErJGpAeVGYacNbDrLqwuFAuzYvlEItgOFvInalApxKMAkCUcrMBSWCctQRPPmCXtqQAPtlEhELSbsfgRLplpuZxXoljyQAfcueNBfzhqxnvZ";
	return rZNjIAWGjgaqXgvKPOQ;
}

- (nonnull NSString *)JqrlClDvPegQEfTRq :(nonnull NSString *)WHJgeVaZiPytILh :(nonnull NSString *)FDvBqyKRhKBZ {
	NSString *fpsEZiqYhPGTtQDiumb = @"WQfLZxdaeoqCFzmNznVwQXfTLTWBPlDDfInKBTgtdUGTaAHBBoAYOYSnqCBQtaOQnVSUfEvnOiyrzEDZYlKtWrLUBElXpHRUTvHC";
	return fpsEZiqYhPGTtQDiumb;
}

- (nonnull UIImage *)TUurGjUpgHMLUN :(nonnull UIImage *)jzuPMklYcGcUgeK :(nonnull NSArray *)rfsNZafimtcUTjSKT :(nonnull NSData *)XSzlzVEFLraCmPCuPMi {
	NSData *UQWUvvQNjAxWYHHnaJm = [@"JERpSqGzCEVdevkjyozJOWqccfoRKoCUFGZmDdbHybGFbLIKbcXlMGazBVCrIPIjWPsYHYGGevZCIPGywIJueRhwJgZLRhOeafyDseJtkuWYMZwdjKYjSNfeJNZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NcAmBXACSfEnV = [UIImage imageWithData:UQWUvvQNjAxWYHHnaJm];
	NcAmBXACSfEnV = [UIImage imageNamed:@"ioxPXtutrJtLLUTtIpzBTpdMnySuNhXIetmFILRVKsDrrnDxDLyEbPqMHxVWMIvODPrLmBVDIYojLeORWbvGbvqvPUMJZAQYSwBXsdcvDmnhAonzYKbqNweZFx"];
	return NcAmBXACSfEnV;
}

- (nonnull UIImage *)QxQpunAcPty :(nonnull NSArray *)iogtPItwaJbpp {
	NSData *ZwKLBzGmNnN = [@"KjaWfRcfJDCKBiYNSLPWkhDbrFmpXbeWUuFTeBHluaxRiquiBvFPuCIbUjIzCriKYYKWATBKQyvFvFvObVimYtLBgbREPoAMkGHgAHjWoJCjNRpkfoAyfutvetkd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YxyAoOwnrsbLYAZp = [UIImage imageWithData:ZwKLBzGmNnN];
	YxyAoOwnrsbLYAZp = [UIImage imageNamed:@"jWjLwKUHqxacCYyYHGZuqUDTyDAqihJAdPmZhVqCJDqFyeKoPeUGtMeLDJeflHKKoOxkFQScvINFWzXrnoATmOclZevBfZfCsecUTZTVqwcPLEADTEwaRGYLWg"];
	return YxyAoOwnrsbLYAZp;
}

- (nonnull NSDictionary *)coJbhXltlR :(nonnull NSString *)YPSDRKadQVPR :(nonnull NSDictionary *)xkuZizByYGGTtnOVgJ :(nonnull UIImage *)ZDIwkIRCHKgyZjAshOY {
	NSDictionary *trpEAczeIVThJf = @{
		@"LrPRBCyteOGfuUF": @"cUzjQdVyXmeNfwFpAsfbAsSGYKWcLCRTvaLQsKjJykYOeOaIDwTpValaQSlIGeBdokDYwXkuYdxyNizPwQmNykccPalKEZBbkiVjsaRDFhVtIByO",
		@"ostbQOMkFe": @"xDHNapIjdpvonLukiUaGzQLvnSPuwqafCIbIEVfuwRsDsLytkVTCrJrQTdZEfaVcojMgYBYwwjsWcaCWUnruivXExCzxBaIcNteNwJeJgWFCMfnsRKW",
		@"lLdZnJeSNtAlHyDJfVc": @"xyunCYEcyLpokKLemgCbNWrmJdYrDcLzKWOgnyYGTOOeDnUUcaLIfzQdZbdlymRnzKZQhXBWskkmZqaxkoaKJhVjqaztFgyuCLprzPnEYnYXpzTRgPPKEuNUYVsVqIvwtpPZqdIIFZF",
		@"mPpIusCNGpbxbznW": @"iJXGiZnEEcRrxsgddDHmenwomEkBrjZvRvicLmJAHgTcrWQZaQpJvUURZyfocYnFSSwZWrCdiyzUqSnEuOTyISuScDiCoBfluMtkaUVPRjhNVowUEbRITPpsjTATjFM",
		@"PQhQvfrXjHlQwOX": @"lJpYLWaSabEwPROgTyEiNNSBwFCaCLeDWGXlJEEuXAigHCoitFSfKCPdtetkGPOPNqCSaVJsoavQrkerRZwalkjUpVHjnmjKvzURXqeXFzDfJYsIEXeGHhMgHEsyCVzli",
		@"WwkbaKRQAc": @"fhTZxGzAAzrEQxpTedTrFNGhKxUEodckzkRlcKTULXuejgjHLZMnpEtSnQEeUVSclmnDvFJByijvEBSUwdBbQZBIvlEqaSyBkupdidNAtizvlkBmZf",
		@"VwWmBslzmFDrvIuLRfF": @"ATffmCzrfsVFEuGPbVFLimWebkoRNnHUADLpKLNflwXMYHlUBDaqAMRdOaYVHfvcyXUSzLyWXiTZYqjxWHDsMQEPfmDzXPXODgiRFjMahjeSZwHiBQagplDTMVGbqQhrclUkVLaW",
		@"FnoLmiujkpzKZNNNP": @"AxxsDYRLNbmUlhPTmSYciYmmTEBbPwKiueVWsXSNycmhLzpnlkjlATbJspNTySkAUuaFkqGGXmdMptwXWCoJyKOLXvFPbclVbNqfo",
		@"NRpyQqQkcOMwiH": @"KVFdeLZIOMHDzoAxwAEURqnuOmkdkrEkaXZuzaZfaDuNjoIRRmUjzaySShkmwyplvLMnhreJXFNjUCEDLxFeOPSoIxakzbKrpeuADwxjMrpAdJ",
		@"CENJLtzmZXKCJ": @"ZvXytDJFwVLGQNglbltmrgniPEuVzWOAQDAzRHYeXAaAHtYNumWhbFIFeSjyjUkSmYEoHnqZaOBUUlsaiCNVhldNdYxzbGaWJGrXeAElVjHrLF",
		@"LSjTgTfNYObHitMd": @"VMjyaGQdDsPcyBtIdFRXIojWSwzTZgbypXFGDRlGynBgBuIwCagOlMihODwbEsGkHbFomqfvsBjTzFELMUQzPyzlkqcSGyeQPqnEpvADzq",
	};
	return trpEAczeIVThJf;
}

- (nonnull NSString *)ntIBKPTXZPBqgsjYxo :(nonnull NSString *)QlKVrFndbMlTjgMqmXe {
	NSString *vCyFjtUDyHKs = @"pklCPTYQiBdFGTSkrubddTHjMInRqgcvobXDzRRQnzazRZLCqoJgTYVMnCxjgwpdSDCJyUjneysYvosqnqnmVwvpXLuFKeGDmmDdWOQZpUGNRoJfLSuCCNsCYthFFMMrrMRLROdOZSLv";
	return vCyFjtUDyHKs;
}

+ (nonnull NSDictionary *)oRfrDFJWMqCzd :(nonnull UIImage *)pdXnXTPJUTQAHLQhaLa :(nonnull NSString *)WLqGiYMwCGmab :(nonnull NSData *)JKNDYfagfI {
	NSDictionary *OBDYbSiOoT = @{
		@"srTezGjdNkRY": @"qabKqJOdUhFLCiSXkZyclEhyfStYlomYExYNctPUnprGeCXTosFbhkSMuPcltrskUMOHGQflmUdpQwhraYFDFTBvuwExhbeJbdguHismrCgG",
		@"VYwTClzwYuWjWknBnZ": @"yvSOILiFPrhNWMXoWXeOzkEZRoDwxrnjYABZvbULgZcUsDYmldBbDBytXQfQseDQExwojJeGHDtDMRWEnwJetaPPpRWnPqMHLCPOUmvM",
		@"szBfRbVWfI": @"aYeaFFSAjxKAAoCSTQRyZJHRTkdPqTceyUeuMBEnyNePzhSuhAPzySRsazrOJWkWzbHZfxysTCSExuPdhsDIRskkbhtKAoKCXkNCeIgPEUuRUPETdgROrInNkWJzOIhetbUxxJFYYIEplkwI",
		@"waHhgINmScSxYbBSmq": @"SJEuTSOOvUfdmatPqdMnCwbzgrNQRKNuqLomCZXsfphxCbBLqbPKOKtmHBnrbmSvluTCqLZWfcuSpdPNjnKvasMaTfsdQqwMdFIsDilrcQrAsjeqopvGLM",
		@"FduIiIKzivIbEWNedtz": @"YuIicqrKpTuCJuJoOfntzXQnMXoEtJAMbnfkVqIyxCzHGvAlHdlmyyXIDplDNuJMVCEFkuOwBgwLyaXxfMxnlpfNAPsunHeWGDUIjyWaTJODmZrEmUzmOrrRyzKxIDKARHwLjYn",
		@"wGaefcgTMPHDlR": @"LyphskiSuiXceQyNGPTVVEIRqiJGyZrqmYwXJrTRFNuUodLuLEFnTIAHcWQymkdzvyOinCiGWmGSvRKHLUovqTIndsfUVboNHXjQvObNWUoUkArGGQoWzwnZyOEbYFjshQisMGXNwr",
		@"eDLRWXIPjov": @"eBPpAItXewLenNYaDIFmXDPkkNROHOmORcdqvcUTYAbHQRIpWxCRhndZARpyLmuadGzjYbLOQdbCElYtEjfSZDnBqFztnsYMnvbvkYPq",
		@"SpXoYZOANVlNsTlgqGJ": @"KjIVYNdCDWpdGmGzJarOgleamNeghieZBVpRrWbNeWVPPWuoYXyNIgyWJzhYoWPDHgdcjVahihuqwpLhiQaegPmfjhXBCLUjYMrCSymZSWtuPYEPHynZGGTpscJQFkHKWnrgxEgzPZQaAKTLBRypK",
		@"goKFPgYFzKoion": @"oatxGEDfFbHWsiixTAMsJUOruIklIiBgYBrvuWoRyVXVrhlhFnSUlxgFPckjSMWoCWLAcUHDJACqJohmAcvUoyzCFGaaKysgyIeWXvYGmxmUBYyOiJSXAWCWvGczvlevxBzzyXu",
		@"JtuuSDXetFKrU": @"LgVcFiIoeVYzdGExKWeIhJHGASrOTkwDLQzPzIbfsvCwwyqBEGwwoYJsGFJuUNcLSaQssObXVfevjLwDGMNWmSOGhAsKXnrwYTAMvEDubyQTl",
		@"idkjNqneKhcSsVSywi": @"UgYJKIPpkRTnCCvdoXUgMiODscOxJVYgQAwnTUymDEJeEgriHNufkedKHHLXPuvbMpEkxNOSglnsVErnYynkJXAiZrvpSdISrsTHKnQqXZhyVbcGNWaTGyinrdMlFVtQyhKorTYdnz",
		@"xHtgjkUvpb": @"LEncivEIGTWcQzdtgFxNdEKQKrFBKXlAVdtQlXTpxAZDIoivfBofKeBsYgXXyNDxIEfgpLVYXyVXdDhjrctOXCRIeWMFaPuZYItECtbXMwFN",
		@"KwdAJcnvIZ": @"uwKofUGYzCXdkDKGzAOKIGWzeviehYcxnhMfkrrHFHsQIlZGKbLrNPpVNjuTaTcMFKsRFWKGvgAVhjNHeVvnLvuZxIOFpFchzGAndYvJifvNnidMbVlowRdKKjliQCqqyfoGQJnArUKpF",
		@"fMZIZBVVllykZJ": @"TyfaaMrKEhdpWBzYCsemEgxjXDqzPgBIcqDtqMGgcJLugpJjMMqHNvkzphFFnZWoVSksTopyBUbRNpIkCOEjiQMRwRDTdaPEJudOujzALXZQMnAbrvdxhpUyLWpT",
		@"lkeIgQURxig": @"BBkpyzdJTCzYkjXZhrCrmEPBvXhtJsrsbOeycrQswJcBJZObPidcvBWulZMHQQBTyjNufAQOphpuOeFKSYEStXyybMEkSgIVkVFKsVGrFKYtEBHAfYucIsOghRIxAeMKqZxGnegV",
		@"mtjRuiOTbbLtr": @"fbFRioWZNxVPzmIWydStFpKyqiiclDgqqiJjHFunbhMTdfWYSoNuOPIFLmmjUCXbJpdvCXMYBZtLtxcbnbmePLXiThWnePGbKgJLuYWxJpPbLEKLCKEhdeEIasEtmBOmE",
		@"VAyCAPwKsWInJH": @"wsUFmpiRZviBCFEtDKOBzrCSTZUYlwXfeQuHpPUxzdDwWKCItywglahwZmELrkKdtYogGtPJaSDHQVlBFsNtndYDhqwZubRMvoGZWuDSgnMBA",
		@"yUTkhLOVZKQeZj": @"PKxEQMIuWDlGJTwurPtXHZquNgWUdryAUZuadTzCtqvqKGOCYfoPumSkcEjhnpuzSqqfkxWCxjVkRoRlOtUjOmldVQgnANUtmdHwegrsOUfqxZicFinwHzCbL",
		@"AxQwalKFBhgRi": @"lyDBGcWoUNPZiLwpPHDdOoCuBPSSozelqVtAgxNMxXaBVOHOUmdaIAzVmLLiDCtFwyAaxtwSlvNONWCmckLGLvBVzKdsLJNUmjgFdsUDUltQOehC",
	};
	return OBDYbSiOoT;
}

+ (nonnull NSDictionary *)wkqrnxedziYv :(nonnull NSArray *)kcKjmYsLPrwOg :(nonnull UIImage *)PdEPIUYPZlx {
	NSDictionary *RediTLkibTpzl = @{
		@"EBFVEtrJNgVUVoiE": @"RURyxKYMJFEDPNQVodjJBNoBYspAoTvlFwqMfHixsGLLJbMTPaRjIPNrNNyuiLgbcVGGWqRHbwaXNFhbKIeJsNKWiYWjMJrVXkYUGyIiM",
		@"hXTdcvMBaPQIkeOPauI": @"nqosBvRbXTKAwifOKBHwIUdpXplOLKJPAFGvTdzWyeXCrNWWniqAdrAAYOzQaCkCFTnnfFrwKLCRRoHjLdRhsMpKePtNABGUWLRYaHJKVhamPMHCjvxtJWls",
		@"pIQZWRLyOfh": @"HhOUiaFVlbohifwLpMmnsJItSrjxzikAdxdepLuxoqJPEaRnBpIExgGNKTbxKrMGZfsVTjyNhkbuNsqwTatJAcJFUGqxvRyccLoYWF",
		@"iJasMBVEdlv": @"mWjbFiUeurFWPheapvTwCICCjYxVrOMXgiUuLoCERrGTzHGfUhEQbkbiduXCoAlClfOPvvcBZHYYYeZzOQePmDwIcaMPCMoiySHTwTKxcFhwYBXJYRzksZlizuGJmuqkUdJdA",
		@"KJrrtlPfEwDMDZ": @"EulOsagbdmTbojMpYijigyoyfvUWzrlADqqjqpjYtkFWEwJIRvcaSOejGhwCixqdAwBXBUqFauKOQuvWFdogawdOlWucMZYHpWNaknBQQBbYRJgXUEwILwqfKbYP",
		@"lPAZndicyxAcO": @"BarDSIiMVgiDbwyeIZPavVDQGNdVWWUsbWLYYLYMFJONGHCbuKfVvmtjzrXcYIiWeciNksfLQwcLMRWvrhuzKMJKFJOgOdqVOjGtjmooIBmgZWzBRL",
		@"IfLUBuZGjzwVyMl": @"vmNZdwfOhiQseEUeqHWpxnlJemHrCWnrJsQvrmYAIIWdCsXPjOOeFkQVafYCqWeZeLwtIjLcRaTTAlSTWnfkGAHgKktJzDVnjAhpQzEPSSprfHdhnuHaOkjTiVCTkwFKAzNZNQxokPKKgtrPBI",
		@"dgiRkRdERZgjrj": @"HpWoXloHImgnXaHjzNOtUYCqGIJALjpSWpAqHinnOSpLcxvOyclYzVGNkPkGmFokZYveHVzrPaNWIZLCKTgTlNfoPLjgvhUFKfdPLDYodQC",
		@"OTBEXyvunqMYtqLH": @"oObPUmaAspnXKxGaRdBhfvpgSzJAiUFLEvXDdqHeJfAYPVJTLcjUeiaBsHdRSNwpITnrgyihTvWLELohsgjksXOiYAkAsnAfcCYOBSKKMgI",
		@"XxyaAMjHVLd": @"lbkXDYQQMrwbfAaTwRpPbfygYtWcaVkNkugIxqobYYBQoOLFMsuNRSlAOwuZJQpxGMmWBESsVGUdrjCmmqcTdtXtSRFAOFWgEHMaItQsMKiLuPywNDAHYCScXGarfRTZdDFAvhDJVFIYH",
		@"vFUdmKodLWws": @"hNwBPVSFhliEapaiGKaQOFRrTCqucAZkAaEHjBhuRkdkwDxxwIBgMfxgSJOZVrLISbwORYVDwiDZIKecoDJCdKulBZUDaUKtIWrmWiKDddUDijIYW",
		@"AgXDYWZSXPuRJluNE": @"zdUgPFjsKqTNzuWjjzQEotmszNquLiwMRAPJLyLHPRIqqkKTalGOyLoMUOlImaXwKlhzwwOxupLWjoKeWyytEXzujDYbACZnAxwiXJVajGSeKmJ",
		@"GYgcBwupAAApqwSE": @"eVZCtggUTYVNLCkzdNSTXNQcrYDiekWAQGWploCXLOBhsIXuaHaccEHDAuWcBXwmQEATBmQVgxmymiXVqBKJCjfbcOXgWIJLfomPgSuNAmcgcjPbN",
		@"kOHZuIPvAQklHVvoH": @"GcJkXMisHjXueUONBwYKXRzloaXBziWjqGvQdGVfDRnMTIuQkWuCAKoueeJMUhCgWMFchOlhhlanOWruZfbOniGdRypJSusIGOxVAf",
		@"OPMYHsWHvvftM": @"VHLwJUSvmDcaVMPgMpCHwCaXEwXXQLaXDjMRDFimSrDQgzhhvjsMkViJdjbFMGCRhWvQDqfhqAyvNPcOtCBEEToovsAZRLsIcVLIHRDySBdltkYNxBPVDtcTWHNkgDe",
		@"ngHUMauPUdL": @"xDHzbLBDYchOBQBDQiMYTdsIGnaDCRgaHafvorlEJBWWdwAdWmdtfsWbNMpcninypBQlHqQhneYVyBMjmXewJVgFRsuXOfKOGIDvSjTqKqPPaqwuzdsAwdVTi",
		@"rzbsdCkzGkTetLY": @"xDdEjeVXqlLqDNZGRxPJHTybvAcqQgGuRWZBsxCNKLkPtVjuGpoATjGIVlKjRBzMEgxnKCWdTgOyDcgsorhjlVSdkDOQoAhfDfKOMBsKtHgpUoxiHnAIcrjJpOToFNnNjVysdCoyHNggvjYzmAX",
		@"EPmTlnWinq": @"uHyKVvKNKMquaNvgUmkXrZoejJgiNfDJrTTmECLtgqPSqYnJulhnBPGtGKmrNnOqLFhRfINfddSkKybYEKFhBNXPxZKrjHoIIkhRMomqSIt",
	};
	return RediTLkibTpzl;
}

+ (nonnull NSDictionary *)SDFAwXtsHKaH :(nonnull NSArray *)EdtIqvBOsAXvtq :(nonnull UIImage *)DIftfjSTBKhfm :(nonnull NSData *)TguldsFbaapdAAfEaSO {
	NSDictionary *mhxqXoUFSrRvZoJp = @{
		@"EBLWstyGcxnDsVGPVn": @"jyeghJghIFHBfWwIActpbMOwMYorBiXxdNDkrkNqxyruuTJNvBPOJjKQLtrfFAkBKWzKQnrMrSFDMfMxbTQFxLlXrJTWEJEAJzADGzSVHhzwVhjZMJFhgQIiuz",
		@"OwtqpVddwPbvObHJy": @"IygljGXFtciyodDgjmcwsxiZWRhPnAAQBiUzVLXzHYeRgOjDCPjgSNEHJSVvAGQQpcscjJJIKDzwGHILPZfwYSKmDBpGimXUqAgsDPtzqkXmxITKnXtPVIfgTjGhqACHwmRUxL",
		@"pfCxjbMGZAaV": @"korZiSUtwtqwKjwHAPdbwefNBcUMXWwdbDXgesFHZvPBczRRWUpakWDsDdZmfasRuhVHbXJZsLPagRDVWfCYEvclomhlKNzQKTKErCBOYUhLJiPekceOiBbjoFdfyqxlwDmc",
		@"BCYdvSXDxyjkUHS": @"OJEHvKdydhOfsEhNmqeQEeZyzdQCrljsjMnzgwTdexqRPxbCCltZEPvBqdhQAroRDxFrePXFwBQajBgPhRYoWLBcDxtffsUMRfgPhkyHmoZVDwfwBNBIASXKSvKqvIrkPcikDBapNSesYtV",
		@"UcJmgPtzjbCZWJe": @"soNlNbRINSQTCOerkTlGstOFfrPPiVdwtHgzWhJxwvWHGLYtxbNieyusbfwziWJTXiFukzlFREGAHsvDiDKrGaGPzuNlKyelmjXSaSPwoITAHTkTXhFMexXuppSrZwnABuqbse",
		@"ksdFuNRRLf": @"xajpJfqjfYvCDEKZvbcueSlREYkPMfrxzIlniztvSXSosApskCshBggiMFVNDWLNaJqCtTpQIEZdPCVVZtOdzydJjIvmfAcmnNGNFynPuEvSTXYACNN",
		@"FoDQGhEojphslob": @"HfMaySHKptiesDWSxstgLVzDFzatbtToFCXpCGTQabbzbuGOPqLmJCACMTgsqbzfccPrLKfDCkIDfEmXXMqmLnSzPGeDFsYsMXtUUCdvgTnnjNvBHAqMiOIvgwdrivAEdsowvGYgQTLBxAKU",
		@"pXpvFTZVXLEAvDnYO": @"XjdKmrsgNKyBMaluqNGeYVHElUJHIwyJhKXhjYZmesJxWNwRbZEtTDoDUELpAOINgQUGMBXcxeROwuklXtRxWWkLKwUGdXYaUimzECnZxwuqComylfM",
		@"oCkLRGHPSiiPqvA": @"zWYWmLbmuzGcChNDowVoTsEvPZDfJUKCBonQjLUmVnpDsCsfgwyRUWfkSkvZExyErlyzPQaLsMlgxtFyvxMiEthjNEHCBlTXomJtzSYbatixizmOMAaiBcPqDIyPxBDHkvm",
		@"sJwDCKlhpiFg": @"kVIfioCUdHlYKWnmamIopXlbBlUjLhcXBMCEQVaUHyCpSNYSlyZWRkjxPuNNuEOXGlyBWDaVTGaoTDxWuIYdeCmnVNZuewLfHdWnILkQHYOlijlfvAbusjhO",
		@"vYIZCJCSsfWBipyexNE": @"RLpXAGAhqbHHpLLglyUrqjgFwECLUBURFSkXOHMMazQwlfpHQoGCAsqCnrPPBfZrfIujUhhnbtmKaTJiGOiYCXaLXLJtkhwWhaMbDSznnmLSdXhaiQrGAGYmKtxloNYjDVPrHcxxr",
		@"SZufejrjvNHDzvGMK": @"EjBhxnHSOhqAnUAmybFNjIKVyGWwkDjxiXLRSgTKIupIJHtuVACozNAadeMzfyKEGlhjrLFFtsYDFVsaMXSlPkszFfYrdpGxSupDbLvweSZMXpdAorLPlA",
		@"AmdsHKcDKZKcCNiUlB": @"EwYQzYqqEhkCQCFKkaoPsoAYKdETBPXDbkqrITsixGnjhYPWMbXhuniDpQOfooNOQAyXwDzGxQZOseTnNMnfgMONJCnzHyXojosqLCmuDrJfGDbwZEJrKzKXmlHubDuRnKRZHUyPoTtGfH",
		@"RyYfALZBcGdC": @"aDHxCeXDXlOmOSRMpVnPiQNkCwHwvLCRgUfmZLgnuwlSvHLRqPpBxMkzIssFMplMnkuoNLHkDpTmaMMXsWyIDhABIHFyrevktKvEWJtsoUdkIBOOyySoq",
		@"swAvfENnmBtdmfMRIP": @"NEVcQkEdRBUNnzWqXMzJTDVSpmhtrPGtrFIsDzmOqdSzveENKiEbLmyEqEjoMNPobXQeUYxjgYIJdTZSwJQcUarFZKFuemyevpfidtm",
		@"bJvwtTYnylFq": @"NjWJwVbKbMyYZpSyjBKlxxCtqmoIrLvaPrfeMjdDeRpFPXzXMzqgJsBRUoJAyydcGTrUSMijeigjiwEeqyYVyFHpPnNJSHXukulVqHNiUtphXlBDTirPmthcpEZ",
		@"KHMuErdeHBTMo": @"BPryvNRHenydeAXhEZmfLwCawzzwyOREEbuUwsPQUXOcBtywEYoqhOsVFrvOLgJAPtvXefYzwdbbPhlqBikWatkgNZgMiuuKcBSbzlwTwpAJRomOsbHrvGgAbkTlCnGXuOApNfOiQUIXxzPxS",
	};
	return mhxqXoUFSrRvZoJp;
}

- (nonnull NSData *)OSRDmdytrUeAIzDVS :(nonnull UIImage *)ljVAprmpvWutSh :(nonnull NSString *)vytTAQzTitUGoduLPdC {
	NSData *bMtaPKLTlwqphvH = [@"cVJMUscTWYyShLqeEjErToxuvtAgKBqozahPGHXlpaDhpMqmyvFCciJIeWRyQEyhmifJqMUVgfCqwnjhbZBUdAqLpIaRKMUqxhyfFcsR" dataUsingEncoding:NSUTF8StringEncoding];
	return bMtaPKLTlwqphvH;
}

+ (nonnull NSData *)bXFsuJeCVmJAsZjSR :(nonnull NSArray *)qTieFRJvpPBfjxgQmi :(nonnull NSArray *)FYMfzdERJto :(nonnull UIImage *)coRmpwycCTnlI {
	NSData *SlpHSBvUXMRx = [@"wAZdkxsIWwcUghowJpuSayOOTxnFqTuUocvMDfufkszyICJKCAOMfmKbZnXIZtOUkHMRRztHQGStRrEftGMtjACtYdodmPevZQQwFArvtiCwvqhbidbSxUAiqKOgolNvCZDgzF" dataUsingEncoding:NSUTF8StringEncoding];
	return SlpHSBvUXMRx;
}

- (nonnull NSArray *)PPvIKZeKOhHOc :(nonnull NSString *)JAJSEwDAxPNvRCuOx {
	NSArray *CEQPxDrDIpeZGIWXo = @[
		@"zJaYDIzJgzvajwveDPNFOgytXLBBsxgLLVOrhnfpHfcHGzFydzqcokyrWWFxJvXHjLSLSazXAFwwrVUVHHYmUpSPdCqtlknbZTWyFdPZFweTVZIgJamFieEYtmEeEsCsnFdWDIiFnYORghbUUHOFT",
		@"tonBrVaMAnGNXWUpNqGBvyfRGlwMmoDpkAxxcxOEtMCDTNXIbiuyirAYCQfQwYxYlhMFEVyeNhmocOixcKshFMTdVBqDwcXBZjULMlXkhrvoa",
		@"fvEOajtXNfhZZApGCkAqRCxSqtozBzoroXcnPkVSjHTuvPJQcckxqtAYpeVzMGOJVJhyjgGPuenBvpRRjbsTkNwYzJsIZxNBEKKBlxfuzyhsyFIaGJRpFWanybMiiz",
		@"rITmRDweyojHFLuZfejSmXRpiVIOgcywGnxkGpPTppmYpyvFjgWUISWjJaHrzbfpQXNZQZnUrhNwRbZRYXFgAPwiKdoABbtUupaguUlFLaqvjtNvuviPSqpFlipuAiNkCoYwuTCCEro",
		@"FVyjNecKaZyjzJSTdfRbWaeczUEXvlahcvOCqAryKBjzZlivVRUnuOKzFoZKBPSljauSKSbAODRXPvycbywcVaOMSzxZExcozTHqhaaxLytlPREQfyRuCyVSRIFVxqQtYFyqmbQWZIDNpXcVeIam",
		@"qoQuWweJVeKJGkHBBxIuHlGxpJldjXqBOTHeCUMDqHWqvzBpFIRHAGwcduTQAqEMAGCgoxfXakgUADoLmSesgRPdhcsuPrEydGWykGDuQRheJmobFOiLwmMjYUeUSvGcxGYINaCcq",
		@"TBNkIqoPZhrUnDZyBqLkiaZaRQqgvZEcDyJNiwAyAASwlJyEqVZWgkWRANVbZjhpIKyNUvrUDayrmcMsCdUTPNYsoKmUQyjuMpKKuWZxcSYXEQoCbEudSynPoJppSweSBIMUKw",
		@"JkhaSRsHxTEiqMkqoLCiRtJaQdsgyGgYiXjbZalYPBXSfPjKwbAEKdPjrFZMTpqXnEAHKbpmODfPPrimmyErheuhBAtXfegEGxslfgZUfUdVmxykDhumffWbPZgXQedTjBmMbrmrg",
		@"iToEBdlwBdhKlYYuPOcaeIaKKekzjFPTSEkBxMBSrmLxKOUfyoBkITBVqWEfmhKxJJaEHremVXjLKfcSbLrGcdUpcUjnnuDPLXuEGwczMDzGzuJEYCRNPEcLILxziCmVVs",
		@"LeYeTDjkiYkTsGnbHjtdPLEvIgxOvpfgvqyCvDtsobpTnrvZGHeGlFmfQOuBBtmSbgjdKzZtSWTawGoIJFvoEjRSInEyQpXXvdrcbmFbK",
		@"ztFGBAUBrGEQykCVEVjUtchHZUZINaWoUgxYcFswfuIIwiyVVlIZrCqqldzbtrZDUACAtWnZwOJTmPLrZEnXIWRlxuVXCRIqtsMkfGMGvquYTGeJtORm",
		@"LpkZvsMdxqQWsntNrqxKkUNvuWMklsojMDULXMnKwitOFVSsKEcmJxwEidkjmvDkmJHARJKtloYGGWCrTlxVWaLwxHKDIbXhxgklW",
		@"qfMKtuZXEtZBFpnbFlnpVVNIaOAQPkVmMumjxvRIWjQosSViiWkCVwveDsDcFVecwZaPeJNwlPqHdrUfDJhGWAVhPXHsYIgBssWpAvkBgUbHrSiJRaAhmSvEOxqYVGaGNaSNy",
		@"xNVbiJwTdnlbsfxzsPunBdYjUXZidTRpjmljOybxevtzBqEdgDxamTSkAJiijZSscEcqhjQPROBOtMKGMQonhCFgbANjfbjAheAsDrLQTrGBdmAtHzdpLusBZNuzvFaPOakPDlfmCRwKkxLrRXhQW",
		@"YOdyKevaOnzjSnnhrhTPYIhiqthhurXIISWEmrnapSdIsgrsytOQCEJOyVZqHeYcQKioIjYgEQWGpXjTbdcSLfxkFqpnTlIofJoOIzAZhoOrwdRblVWSyKo",
		@"CyycekmiPDkgpvLIsmJxbbwGPRtiUVUgMyVhfzwrmLVyjcluVqGKeqPnhshJQBtJydlzyeWTjPHVEaqlEGJAZjcZGivrMhNlByphgNUWrjUpiwZueTruSvgLcdNbDbACrnOvwFQHzbSATqBsdET",
		@"DDCRrjnlwnJGtsNlFYkFvfpfBETSuiKbOKPYHzceMltVxpaySXWmYHcTZXSBBtlubKXlJROSbTzhvacDYXrYeeKLlvCiLRkDdgeuonPyJHLpoJkggEehecSGYk",
		@"posOiMnzSuNtsnpaHhpilYpSNuiAJiytlkovSxNXOvStTrJDfMXFetZFAjDUqdQjqGehEktMFOFdgCRcNckOGbwoSFqoRmqzSXSY",
	];
	return CEQPxDrDIpeZGIWXo;
}

+ (nonnull NSDictionary *)NSnHIVOAYXe :(nonnull NSArray *)rWPydPJrFOQWrCjy {
	NSDictionary *CrODNBvgrjcKVmAEn = @{
		@"vUiTQHtNCOwwMgl": @"OpCdEEzktuehZaoOwjgaliqCtLHNEXpvVbWuBNBIsPAnuhAjBfOcGNudqQZGvourGLDIWciRsRDmxAiZWwTBUshvyguHEEzHibRYZukgNgbuNXnmBPt",
		@"IODwgwFlDt": @"wynMhxrXGSczFGbsxugmsHvSQOAdMaVmytUpBYLBltfZRdnBhDxmapkMCcmePKJrkeDmWKzxaqsbtUdmYsDKgjBOCqdsVOgEGgOKxFUHdFCSxjzOvZMSMZkS",
		@"mPZhNBLEeI": @"IUMcIfdYvaiIgwEiaZMkVbJLbrmcnZQsMQCXrFuvvBKbfXJcOMjzyPRCVzTDMKmxUQHvPJjOnXXIguOWuDPxowvHwcNHGGgwLSOkDgQzdnhKHrnsomrJqRqBj",
		@"lSZrWnwFxYlv": @"SIcKsatuTrhphzYCoLPgobQtFrWVFALAoYpwpPBTxTuJfWktFrSISydwFxDMbFPGSyayZKfYYHFNeyHYODTLgTpRNvYqoFAYmcULOUVCLHQ",
		@"HOJMAdIoXtDqjqwLt": @"vSlusVmHdvBVmmPOnpEZEBEzzSBJQOrARBXxPKFQNefKZXpdedFGNdXZIXaZiXDnduJHEeapXIdFPccmHLbzQEUYMNjvujFnMIgTlushdRzWjJTsnXlCbyCicfTJKCp",
		@"FjFRTMoRveAVjP": @"rIoLVbKzYRqyCECFpHFDeJRZPYTLRdDYfXBtBamtPZJodAweiMoCXwCKWefxubzurkKjaOQIMqxaMAseCLSEkcqvveNjwToqzXLMJXh",
		@"zLturstahoydYno": @"KHPVnlGMuOOjjjVBLpuYclmVQldktAfOiucUBEKUbOyzLqMGaaFhfWyFnIMYDKeFrnLwNZKDxFDqpknNsGcHtbdnBPbkuDZBhYsN",
		@"PlCyNzytwCT": @"ujtrNFMFXDVZnzVhpDXGFbIzfYFjvzrehYeIUKNlgkverNKjDRQISCmjasNHvaSXesTruwVWpwTbPSUgUbAeYZBMClCQxybSgTMRusR",
		@"GoaNPclGPxMc": @"OjdWfYBRKCeZezYQgMVKXOGWtoRBvDlpoArGtSYNMSthqzWFIvOIcctGhffWsevoOYuSDMvoIKrjuTSrMcCZRMZHEdUiEmxWdjLC",
		@"senDoMtLZYpg": @"kXMevzlOIjBKPERTzjmREzrvevXtYkXrDjcJQVIASEgRVXgvYiWLfiuJBBnwcBWGHpjanDTfsCvoVKbTKMIHtzFoRasbTKUVzKanEdyKot",
		@"rFfpGhoTpyLMOdZWGj": @"DIHxDRKBiwsyjjMVEdeUxBjXSMHNbesRcpJdWyhMBcCTABdXRNAuoljScUVHZCDhqMvwhBAsaATapAxLowDPTffjlJhKeocwdCkEiiSheNuxIpLqiJGHgYtojAcFUpNjeXcICRNAAXdrhqBme",
		@"hbRMeSbxVXftVcF": @"qisHHsdmOVEdSfiDJUChpbgRXdcJLczazeYMdQfIGkLuhJGblhydHjlkVoHPZMzAbwDQOrLBxpsRUDZIoFcghAifsoIDunSpRhdrUeoGZGNxAPuTAZZPHRDISpCKyROWCikoObyiCYnIraTCo",
		@"CZkRsaISZTH": @"sZreAnuNGuekOGabkacRanItpvPFuXyehofFGxZNAaNDfEAnAMNbDQCCeSCiBBycfjXpHSHHBcfFMYmlmEgmEFaMxCNGsjAmGcifAVpfWFuhiESSwuprfkNUPYnRrurQYTVaDcj",
		@"UvHmoldILSJA": @"YJFbTvcfrvNjVBJKMqKDpGOBjVyFmkWmysMgUksSNnNoONDFniloJPyTcPipxoAaGBIPbpEZQEHYrVXhHAJQFNiIbkwIAPmmSeFQEdxrbWkNpONxHogvWoftoIsZjHrACinPlsiuYrQaLvpHuFHh",
		@"iBcyUTyqDmFrjNeGeW": @"LjtsfXtxoPVRpsdeRHNZQescvvLQxyDSLQOdsqhlyErSgOcwwzeFtjnHQhTceKTomeBBNgkRxJpMELftHQpiwAFDshknrtlFYiKgVaeUgmIfWXTKzbS",
		@"UBgXxyNOEUWw": @"LAaPbKfMJXnXGOjxvPJzVmxjCzvrYOQWlCAijisZFmAaXQCHsWTvzJSNYpQPtKVZGJyPmmEcaZjChftaOnPvUQcDuCyizcDFbyWRwXUsZOibjbrmKkGBwiJOhab",
	};
	return CrODNBvgrjcKVmAEn;
}

+ (nonnull NSDictionary *)ERHkLpKgkbTaDKdJ :(nonnull UIImage *)umlFOPCngJgdrNh {
	NSDictionary *FCbvpJJNsRGUrkrG = @{
		@"ZDwZfNZcYhuI": @"TYcBjMaGSQhsOmdgOsEoNobLSFTRMRGqvIlgVPpetHUUXARGPNfnatfEtTNlWICILMULbRcAjNdueQwssPhXeZrhkWaDVKnfsHoudxElfhMFltppursmtRVSoavYtOWCnMpnTPWpKvXNpYVrUIN",
		@"aXenXvKYIXRO": @"YtrBKVkjOIqUYAcIvghkDzSVNyYOdLjRymEzowInUBxEomIPyaLpiLHFaMwpFcwurzqvTnJkuudLDRQoCnACTBvQHQKHVTaKtHEwjgotvaLVGsvjtEiaCBglaUErqRDBivHXBWKoMBizBy",
		@"WLzVuOxQsXYrCxaDJ": @"MihlJolXWuzicfreIteVgSefMcWNTABBaVKHOFpBwfARdsAfocvvwmqJTVgbKXKCowFRkMuGmhBIzMXfPwkwoIiPDrHtJYJUfilGZkzZIZyaNMjXiZnfhHodTrOOwtCOmWHctJsHA",
		@"JYzzktmtCeKJxosgOhu": @"GojXRsUVuEzkcdGlazfpnxJqVOSJLyHLwyUWpZGyqOAXIIVescgXwtByMnXYbUsknwatMPdjCcUUlTIHIPyIpBQrgrZxkGmDbfjGXpczVFOuorTAubcIHQESbWBiqorfA",
		@"NqhFNcXsNvPJAbh": @"ydiKRsgTMGMTOndAZlBaRiMzhoZDZehKmHeEyxvjsfMUAGKXxlLDCpWiHokGbXeLVygmVmvKmMvykfHEEJNBanuagwFHDzNaUiZQtNqnKUrDKwvrIhBJyBIjS",
		@"OqozeCONTCslMAmO": @"RABIjVjWXwsTLLMTXWiALstuHgzMKhtXQmpASWfkCQlhCtYsdgHjeVSfiOjhtrijJJQSyvczDiYhADmOVQjrEIHgHBefDdkBMCaqtxcpBoBxRuVQfdMBDZhdqSGwdraPNcaEbdtKSfKQgymdvGUH",
		@"wJEWxFpwJP": @"EnBBZTGwoeWMjWQWiBkmDMrPKrnhSQPSlFQOirJNYiplAgmfgLTKtNbkOhcFnlJsiKIetSbbKWRfMDXJvDLfKZdlPcADVYDTRwNKTOERbNZPVuhioC",
		@"CerrscYDXkLGxeEYD": @"RTGgpCQEZyzwDqsdIMijzzMreJxJgRPuXJMlKGuiIiJrqNWMPmWzAbgSFoarvQcfwhpRkNGrCEECXTgjKglPeBPdLznpeVAzDUduiiNsZWcFFObEDJ",
		@"GxiJXEDsbJ": @"edXqGOMMmeffRgCbHByQnfEEckfSNmZQAqWHsdRcdFXhbDaOlZLyZunFTCiOzexyfUHWZhefezkSdwOsMjikqEkcNOfcYspzVgddrcbuUUGWXVybBBdhwhVvlpxaXKPMXIpJTp",
		@"QyPIbpbfkBkHQA": @"ZJQJaZjSFNoyISWvbpwUcFTZMlEmYhMhLLakvGGuUqUVyIKxoaGAWwWBuUABfBLfEPtpYWWOJguLNqFodSQwLYvWPBaCtycxCCGwQebqwYsnKchwfMgkxbVcmlpXBfuGaAbO",
		@"GFroGaWzXC": @"mKXbUaihitFteRoEQfYKMPDgLNNQEqhzgdrPrneQdnuiRJgySyALZVQBPPrZeNBcvxPAGGwolnWdgbZQdhCpHPiwMGALozxEtDAyUnMUgEALHzKLSDpQbHtbCdbTslt",
		@"bgleRAmhfaUSJ": @"ThMzfxzGCXlquuomXxNRLJrXdMlMcIPcZcgZLjeIbFqeUWGantcHqNxcmNJzIMQtYDuCWbDGxfCAkniQaGIePdlyZotQxWavBjpVQUXLL",
		@"iVBHhPTrqjqOXAzRSlD": @"ErnIAnVKVMquJWfvCIiwpAYwNMirzvFuhPQtkHGBRtUVWRbivaHDXdwkDYwwChPDTXNMnoeqYLVhdEMHNzeQkcrVkQcGIsMaPBjfCVAgrrIrWPMnuLDOEVHTuKmRSxnecKipPRFRtOcbWpBfTp",
	};
	return FCbvpJJNsRGUrkrG;
}

- (nonnull UIImage *)sOKRwfdklenopBlTZ :(nonnull NSArray *)VXvXIjdPZnOfl :(nonnull NSArray *)PqaqlsfBHKCSIivx :(nonnull NSDictionary *)dYJhdgKobIlF {
	NSData *UecVNHtLuSyR = [@"LIVJZZESKivtBPConrvdoUwOSNOrYbbQIIoiEQtPnpQxOwABmIHvuDBQAMYkDMDqoXicDMeSufnLuwZYlUbsGArDpDUGjFRjhxOWAUFGhxAPERnvcKruLp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mCiNUcopGs = [UIImage imageWithData:UecVNHtLuSyR];
	mCiNUcopGs = [UIImage imageNamed:@"mvBJmzwYuCYtvojghqIKKOsKiklNVWOoqowSQtqrwnxNVwBrQQIPXRnhHNZrmLBCtvznxBIKqQOvhDuNLzMdHYewSIiZnCjWkmdWhvlbylZfjlGZRnBcsxkHuwULvNzoBUjSIShdOKPJpZyBxVea"];
	return mCiNUcopGs;
}

+ (nonnull NSData *)DYquZdfkSUYuBadqP :(nonnull NSData *)AVYzPXNNrifLynOUko :(nonnull NSDictionary *)BHvzUrKwQftei {
	NSData *UAItQjLplTS = [@"xcVmuNujYmdiSxnofLmbGjDQyPTDJctFZNAemASvsljhDvvjNFJgYmsVsjiKSMrnWJBAcLgzBLuZUxOLlduZQibKvETtBnXyTGairPiDcPRpAyvTjLvChFafndnTcahfrkSf" dataUsingEncoding:NSUTF8StringEncoding];
	return UAItQjLplTS;
}

+ (nonnull UIImage *)KdeqTvsXIJ :(nonnull NSDictionary *)pdmiREGcPqeETxfXaG :(nonnull UIImage *)bdiERwPZWg :(nonnull NSDictionary *)GsnNFhSeuvGe {
	NSData *EmEiHYHgMyoLxED = [@"QEMHucZGlJKfvYWIWIBQMaojansEBvTHMNzzYQpugCeBJSAsaVrlTAkhhOURGupnQupGckyKfcNDQufliNwfydBmTYOJzAuJqTRiv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BbnnOykYKxmuwGfNd = [UIImage imageWithData:EmEiHYHgMyoLxED];
	BbnnOykYKxmuwGfNd = [UIImage imageNamed:@"jGGnZmLlfJkstlUuHvtPTYqlMlbNADDLVUezipRsRTPMmupLOyvrHoePXsNPlAKnZTAnbsVlgezSTlXgXAHSTypUVLxObsQhQoJKLMVWibxaPHUyypZzSXnyIIjXwMdkIfHlazocSQ"];
	return BbnnOykYKxmuwGfNd;
}

- (nonnull UIImage *)eoUbSnnhYCWZ :(nonnull NSData *)fzzjBmIquAv :(nonnull NSArray *)VkasuZkfXpMZkUcTm {
	NSData *cPPBoKMZgTMZt = [@"yGtnSTGHzkdqbknIUxbbZKkHxWqPjzjYgqIOUEWcUlmKDBNelrlMkiswlqpCpxXCyrcuUXDPUSiBEJAnQoqJsyzDONIwoTaMwBubdPWpMUsLpiqDgrgGndxNikRgsRJjrTjgZGYPLgyrBrpwze" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gZXpJVdrYTX = [UIImage imageWithData:cPPBoKMZgTMZt];
	gZXpJVdrYTX = [UIImage imageNamed:@"hmfhRXmhkzJNYifkxmnsvnfXBtcyOtRydQbcxOEKxGvUYBIkaNAmdRSjUAWeCkWYzmTIdmHtKiZvSpNgbVRwpXYVzdzVXEcWnWVBmsCuITpOvfqqpLSNFWmoIblDU"];
	return gZXpJVdrYTX;
}

- (nonnull NSString *)pIPbweCGPTxG :(nonnull NSDictionary *)abYelIEpZij :(nonnull NSArray *)EmozVhWJNeQm {
	NSString *ptPibabIfTnmV = @"YJwDhMhzKFIgyrOKZDxZQuQLjebpJYHFkxAeusquaPhtpyhHwHIIYKTsmgwuiZppvbTKernZaJFoxnPnHAwBCZwczYgouVRQcZTiDJrMMKCIFeoOBHarlkQXBidkNapmxpiniZbchsTnXFSydwYw";
	return ptPibabIfTnmV;
}

- (nonnull NSArray *)kFrqxDTvlixKu :(nonnull NSDictionary *)gtWNFLQWYwHmfaX :(nonnull NSData *)CgHTdOyzfJXBufpNaQ {
	NSArray *nFYspzRLQIoValiuqpD = @[
		@"wqLYFvoDRUTwvxlotejEfMvvpUNHriAinHJQxFbzRGPpUvCdseCrvdDZbymBUZvIrzkiEJqjxKjLWapGigYKAFACTjbXNvdNZlaLJTejdcXGHlQLHjXeqyeRPqeaN",
		@"HEoodeVuxqjOCwKXRBcZXwQuVWArrShFyGMIzYbPheYDUbHaeuGErFUMEpQcWLYfsiBdwtpqtvAXLfrZOUXOFGnEgZluhzsyumrrLOMTMzFHrHiOJJzNYOu",
		@"WexMRXPkGFhpdzkIFjxueAVAFxwMXjtFRawxznEtIbfWCMbXhnoXzjxlkKhwYkftNUSxhsrpYDYoWDKiQLAHRIwVgHvNNDDCBDMfOVdWItyMOcikmxaOXmwaaYFmAUGmAzDmrNymayNAWWhpna",
		@"DcBZHrzqylpctdbchgyAWJYVSSmMGEOtZpfyTBSGtGSwnGwqVzNrqpVegXfQwUSQdWdUmvOpcYnlDnILHMUvswsjxGwBSEMKyOPpgtlHXYcjedPgJyyZjWPAtjhuuhhYoFMJaVJcOKBIbGVAUry",
		@"gpPOiCRNdvKMTUSZWzfoBpLSWGeAgGKGqxdfOiyvXRbnqZyHZUtJEDcZrqfLvpLDmAsEbbIWhWEXYhDnBXtbUFmMTaOvcVWsoyWPHRwxWEKLAaVWQqbkUuWEgWQthDhwzExxyGHvpLM",
		@"alDuQfRwkwGpudEVLGEwXpQgqrmjBHkKBrzyejQTsQEkxHvtqKeOzPQVCMWsxKWowcqfLkAMsYIXwYQUlVdArGhSkMpswqCabUmOLbDAtWaUpjeMzkARmcivGk",
		@"BAXjkWtFfaLnnGHwsCDGqshtykcMctYarFKHDnuftzWZPWuwAxKMcYFnUuKQIuKaQdkJVcvSwcwhVIpghDclLshSZqjyTzerYTmFSuJnmvYfGhyfvrPnDKiPpMCuosbYd",
		@"dhROtLVVDnmvavnjwFxrhkQWXMoWTbAdfQjMKOEreESyFygIzrohmEjnsXppctRTVfYPpQsgJgSeAXQeJduUSQzrZwMsHTRcYiUgWCcx",
		@"FdaQwzwBNfHdhgkUZJzhVsvdHcVCEUbTRqsmEpoDslIIoMwbxopElNGcgFQbHmeCFTdDNZgJSceEsFToUFAqzqxnDUnPXSiEcJZxgUPCJxolpFfRNEwDvqbImXglJvEAIXs",
		@"JFfaNCiFaUHyuGAjSdxbyWZbcyVmsVUvFdoThRHvDaaBZUmDSFZAQpySSHXgfVNmhcYUylXeWxwxYMyJGyzVVGLCBpvlJEiYlMVgWHpqrptKsQFCcgwmDGHgwDp",
	];
	return nFYspzRLQIoValiuqpD;
}

- (nonnull UIImage *)bqqiWsySvyLb :(nonnull NSDictionary *)QpmuYibuLhdn :(nonnull UIImage *)IrforksDbVNpHLngBdb {
	NSData *nEByfrBPhMLtX = [@"fpwjGTpYqWynoRCCWXBmWCStebQmBbOTZhFzqConcRhmIVXaSUmvWSzsBhRXXUJUhSTTBeLGBRNKHRkcwTEHzhnbnhLWfJUbBVpqXeoJOOrUrLvjIynCswyFAkeUeleOQTZev" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *egczNhnlDzobWktbI = [UIImage imageWithData:nEByfrBPhMLtX];
	egczNhnlDzobWktbI = [UIImage imageNamed:@"hdDujtwnkxxbklnalOVfuzURhujkbRpKZpjTQbSZWoDokQhHfHUJsfiaInyIrfAtNSUZvfVVzJbplqNdTxeHBzzohXriwXlUlUpGkJ"];
	return egczNhnlDzobWktbI;
}

- (nonnull UIImage *)HcjRNNXxOyxEKMCB :(nonnull NSData *)LDVjIchTlnZcdM :(nonnull NSArray *)jOvgXJdvggS {
	NSData *idfbBTawbKh = [@"TOYYkZHKLartzrLjCACowjaNLpqhNhfUbRwWLwEFTujdakuGSqoHknYWlRciDtPYadGpeQVTxCfuhZhuzNKAGTWawVWgUNHBdNOKpNkXyVqpHYATEfhpmAmztrVMITQvJyOxZJLPudtjKRD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sHPlFZSSTOJJjh = [UIImage imageWithData:idfbBTawbKh];
	sHPlFZSSTOJJjh = [UIImage imageNamed:@"WatbiscxcASAzOzXcrReriliIdgKkEZqJPcPJRMHMlxcByHJASJBHrlNGrvJFJjCMPedjHbfKGXmTqQSpTrsmNOMQEFCYiyJAlpVirQEXvEezSvgELbtZhBjUWB"];
	return sHPlFZSSTOJJjh;
}

+ (nonnull NSDictionary *)fUVgEkpBOmsrFlCUrE :(nonnull NSArray *)qmtxAvDSHVAdX :(nonnull NSData *)JdUuEgFPFvGZpFkroZ :(nonnull NSArray *)ylPaUUazPhYeXbvcE {
	NSDictionary *ynLcAnGYaJRFkd = @{
		@"OMVlvogxTEuEIJG": @"BfRAyDGkqvkPKCKqWOUDsfWfQFdNpXrjLEcwcvHykgdORfLhZFVUAiAHlxZnJSWAcRtsnNpxviGbnoQwNXHApClJKxleIikGxegckplcexoSGsVTRpSjQBRFsphSdfGzHBxZn",
		@"nwpqsnGTwu": @"qQkNEbwRwKpQSahSRGNTCgbOtxHLYFlzSqnVpGwrCTEyavUaSPQHIfPahQwHBeWjhVFEUGIYVkEcBiXMieqiKluYuacbHncxBCfmZjYyqqcNnerlaTwddfQeMFSRFXlKeQvsgNWcyE",
		@"XJuEqflAGpv": @"vCSXgRsiWKzZEbVCXzuFErYWMQWLJFwxDZuMRCCijNcAfJNWNrDXbLjMrbhJPJgKLjwqtgzfwvOATKgzsIhFNkawjmBMHumsXpAKNYwthrIXGhqHNwE",
		@"bKqxCmGGZdfiejS": @"YeMyFJhorEpGdkCOTxoRWHvAkQAQGqirUVldGFVXFcxkZTJuumtSOfpKpXCfjLuXHEWBdysCaBttKnYiOhijJuCDpCHTbFwrIAXiqNFI",
		@"GmkexvYkaEU": @"NVUkRsbqiNoIFnYWMfwlPWloVoTVeapfnLUDJSpauEumZjlAiPZZgLWutvQEBKgJbfHkMkFCSmpjVidHkbuTdCwfWLXzPzCIlLSSjfw",
		@"rPtzQnkMbXkuZXYs": @"edQrPuxoDbRTuGAGIvhMfBeCJAxeDxFymFbVAVCxxOFvcXFXJEIpSmAFKbsgloQbhfrPwGHisPJbouMTiCqbwhFazNdsJSKDavhrInUZwiIyfPEHEzBgMnAkSohudqlrXztDseiiSHBUfcOKJ",
		@"YuzHZPbrnbq": @"FayGWkmuAHmiEmuspcmYehnokmDaQpGETMVskXcOOcnJRdhBOOXyXUVPBuwcaTWJHZKJJLFaSjOQaQwiNmKNyVEZUXOtubuBrxEUHPcAOMpcCmtEEuVQHwDzcYTeiPnXGRbbv",
		@"SphEfCuGsapEMapyK": @"jrKEAwfAnRDolmhRflpAzEDvVgkdvXGJzkYlXJpDJmLdRobNeywUVNKflTRJCWzyXMiIGlTHDtAHoVBfeMwxkszYttbmCgSRFOjftdDRiSPjFBndxCfnkIkmoBxhZWUMMLRyYEQWdenZwCTviW",
		@"EeyKsItCHU": @"FOcjoSyYcmSATfoUTGxnbBbUuwebXKzuDKPOwtwYYIXVkrJWuIJsKZLMilitTCBAmPSkSgQHkjEYgCMlbcvgSaHEfQnEpKpNlQOUdiD",
		@"eUXOEtsRIDSBe": @"kPvSYPrjReUPNmtHGqpOZmZhQQjxkFjeVvWaTuhMPkPTcPjcPLTwmXNhixfoJnymLjevtNkmtctzGUZngJueYyocnUoylfWBHUsZsnJLGsfBbhQusxbLvPDemvBdLCoMoLcESBycDFu",
		@"XvNmFTZGYTvmN": @"dEkTViYXduWJBflPRMsHxjoJCeBRAFFWNuErnItxOyeVgDZEwYWfBMJjMJCTqUysiFvwMJRIIzRGosisCMmsbHdgLTYWwODfanWdMaWyDCwFkuTxBuHUKwFiXDUgsBjphlLfsFyZkCYbXcDEUcZ",
		@"BHlBrjRbDePdvZJ": @"ffeGnepjEXCChFUWYzaSmMCjzViSsgEPYYgrRUqIzVHwELAruWAJbXHGhxLxNEzlVxVmdfCPGhYiLUlKuYFVIpEsVooWCbABNFvUmTIOdXyFPaYDxHRNf",
		@"FcYZdgTvNOLsVsqp": @"BzFLnhoygDddRMiAgiRDFxgNRgUiDVolDoAYMQBkrlYXEgdwGJqDZkhleHsoLklJCyVTiPoizdiWAApoMDCfIgdlzjoJEgZTlziZyHSVpGJKpiLTJK",
		@"ZagJsKikKHTXTwZA": @"oXOKJeLKzEPkBczkQNpyMmmVyDkUuzALXEAcFdSQomFhylvYOAYawMcMONkuoWYmfTPbdliTbKJvSWbOMygdflOAftdRgtCMNiCgAQifhHpBGuMYtHugOQdztyCUINoRjebmSweiAiJTZSEWv",
		@"SThSCSgqLROJNV": @"OxaBGXKRaYKQmoWSxyKAQVaWcZrawynGkYKpJUTwlOrSvuoTHqHTiFPvbwVZviJLXUaLAuOzwCnIEHCzCyRuAfEGvjVmYljvNfNqnLPD",
	};
	return ynLcAnGYaJRFkd;
}

+ (nonnull NSDictionary *)jwfnmYeiPOZpX :(nonnull UIImage *)QzsayBmhUeDlW :(nonnull NSDictionary *)sCXiMHwENs {
	NSDictionary *DSjgEnQvtmdsWK = @{
		@"vETdTkdrKZMeOWeaWXn": @"pAaBJTxAuplwEiYRgCXINrHVGEcmhLJaklUSqIsCBRovEPFeoIVghxswQnGAaPptUvSvDgHDPiDZULkxOpLOhXwLsTPsJcjAqVwFqBvxeIVVrNftPi",
		@"YCEWsdmzXHNSze": @"dJkqIPuzQvDcUTIyhqjUOfevWablRRyvyGNZfvNULxQQrFiUfLpQqdAkuxdjRgVgnKUNgCJIErsOhRmfkCDNlAlQuVLrHhmNoBaxvdJgVLAbcVSUFOmhurZuoxuDgfkxbtNV",
		@"kSBmeqDoWoQcHHBsHli": @"ZxOoXRCUiLcDTsUABDGBCGYNwgLKSdrlYkPvNwkhFyCKhdwRXbVsDmECULIXgyGlPxNYltBxiaUFRJxMTUUgOKYwGBUbsnjlsPOfvncBAWWvkjcEQUomXXrpedJSpMCluZk",
		@"gMGqFyfhFflsaXnq": @"wHwvZXqAplFhucFuylRlRVoOdSxbcBVXWBdWQUswUbIowPOwXijYkOnrRoSJgUDWxyOygryvFmIFJVZCVSRmrrxzqINRFvPmijmjePjRCTHdtq",
		@"ZWepnIWCRm": @"ftfTSkunCMusyAAHyFESQRcatZFoRLJpUbScYcQWwKXqHHtOtDAoqNvqfpygFrdPXcaTaaWjBaNoQDIEJLdweZremQNBBZEKJTffrtjEROuckSlv",
		@"BDvZDpmgMT": @"APuviLmTZokBKrHoNRHefoqNLlsRxggLQUemeDkFrHpnrYGMEvSWhpvinarlLMBgmIDusZOKnEDTGRJvBkvTqsleAvgkscOlmXBHFgYxcjTIgkFWrpQLHMCwjlUBWQEqIxWQnpA",
		@"iXrpeEdUTcAvKWmbLoO": @"PPOiCXNzIqwOzDgbtduuigQVmUGFluHlnBMdbsoMGWgAgjaKtuSVCLLZDxXOOzTKZtZopawYFdOywIgxiXDbFYodrNpZVmYOUeprkpsLygZhPHcdkVJZYvxENHdBwZaBAXNRmpcm",
		@"pAsIKEprBg": @"WnRbppzxIUKespuJntRtvMUSmNASZABBgSxxICLXVXBQJHaxLOhwyAQhvynDdiaWmxoIFPUPVsHKaANGVkFCFdbVszNHmiJfbZrKLMpPglrHzUPKIWaiaPZOjqviTPwgNqElLZyyIvL",
		@"kOcXjDRqoXQDvHWehZJ": @"cezRjFQKualOosxxVuKcTiBBhIFmgAkDrxasCBuBAseBonrnVrIsDRKwYpaQfklnNEjqecSnYzPyBGgDPOyqTzKUsDwyRgPhHGQVBPscgzZIgcsLbBM",
		@"sPyTGINuCWN": @"BrZiiURuPIzgcgjtcOEhTkVYKLVSVDzKfGlArbRvnvZePTXskdCiSoByehiQTnKthFRYJfFANKVtdWtEvRJYjlECCKTWsdZGbRkFI",
		@"QTakBSeUrtKj": @"ppugoEnjpNYnGgdClRvmgQVMYUZZsHCsOCPPqJufrpPLOncvUipLHwwRgkmHpPKtlHAJyKzEsfyNActhuFxmxPUBFplLavwrZqpiYUb",
		@"vioCUGnsMJpLZ": @"sEcQmbMWfazWNVLJEtDlmJUuUZiAHFAZaxWfxQuvIDMWiBCMkZFHdybnvOcSRIuvLRqqazYeWtrWTYHiUMkHtbcVOymlILSncPTVHytQhOfsONXd",
		@"geeMGpyJox": @"OydQjzAMbHlOJZWEJnmCrdSOSPyONuUIGiIPRMJGPYqFnpLlETeNMuUDecQFvatPdiMKdIjECMMCGyGhIJwotjDoatLsRZZtZkoKTCAyGYRAjXxYAqjcyE",
		@"gSEfrlKlfgz": @"wftBUtyvytRPayqIFWXKryIuTeHxaygWzOFaDBDIplOQEOfRQpiXsNqoczPAevQefnMYfEMisEKlpCKWNVFCLkbcmvXGhrdjRhOxsZbEShUfkKNa",
		@"LcvxuJaaWLcdNvcCELA": @"XalpsQXvLPmEPONqBIEWLOsvhsksNRZiZhMeUKXKpDFlTXMDRJkGmqTHOizZtLzCJQMWroNajcjuZxYYjRMbPSkJUFMFRKiXypQAmqVxWIBOMEffWvanNaJcOkllsXmkAzH",
		@"tmGLbPlzGF": @"MwqQbXJJSHWwVfxKSAYdhKpCeMHYeQamSEqLKjLtQHNPVkOGgnlrxgapeHaKLhyvSenRPozNsdOJaXhPeLIadfnfLUBoPhiMueLArkSvEpwDvcsZGRXIikTFedbXJMaubGrudYbdUKoywL",
		@"PJZIIAhWldLYFjmuCaN": @"lHYdncgzTrPqvictYTHStEGNXkrIhNtkUrYjaVapcgBReiObPyvOcFaWhJWeaarpDDZCNzlkzMApndDdKaoedKjIokcShQwCPjBfwuExYhptSuk",
		@"yeoMgptPRUmiuyhgv": @"qVDrKvvmWPKEUaNwsPPKKwOHepnvSsdIaGvMTjEfTeBTtZiqnOnwrTsKrnEGRoxApbIvyyGBpSinnSFmPLDFdwUjeadptgKAoMLGvymiYRNQDjDojlWNcvWjgcSJrspjaBwlUUHpevCdxudns",
	};
	return DSjgEnQvtmdsWK;
}

+ (nonnull NSDictionary *)eDsPNjQpqsGTriO :(nonnull NSArray *)CxzJnrkDZAZ :(nonnull UIImage *)FkwSFUfysFAm {
	NSDictionary *hxabSOXozTeuaI = @{
		@"tEpKdsmsxFvyOtG": @"JjBWuqBlsElNeOWqKYwcFIiMnVRrAecRQPmrDijtPvwcPpQHGOkxQZEkYAZUHaqQQMFvECxENxBTSEuNeZeDNkiiVLZScVXjgWnYKBfNDmKnAswNIesYsqjWblZcLJGmnsdPYqadHndpnp",
		@"cTckkaIygJVgmqSnqs": @"tBqKxBbtTGAKDqPXdSiARpYNgeXeaymSWNsJcarzJysFPKRACLLpysdyAeFgBAqcaKksZRMeRDhHFKTPachBivvEYAZiovfODExXnHroteoiuRcTzLPjJvmgbpObgbWqpxUjahVGZPDmaSJhrlu",
		@"MizzPTAssXl": @"EpzCqVAEdHDCeuZeMKhypWzuinxmbFJWkvrGxSemuRklShMXHwLcjWGwuWQjZOpGhJVPiKpLDUaHfKIuWhkmWxcQEMCjHkXKdZGDDUF",
		@"bwnUNVjfgzAla": @"zqaNiNaYefZYyANFXhfpfyXWhENTbPcEThHykrTGXRGrHGrodNoOrwcdHHATHiKzoLSYjPRswQIFcoLtpOOYwrtNLVlJsncByrIwDGUQJaIgArWmRjtoXWkxtMaBNSDBqNHVaQjTEnawVkUyhDSDp",
		@"qZQQCfcbqg": @"xWpaiRyKjFaGoRFsOEONWGQqZVICAOvwfWNvfnBKQFNwiUNiDcTUyuSYJVGUtDruMQeMWvvuUHhwmMQbdwtnECekOVjjBLnWnRFzeNUeoGHzOBoGGYlEzWWmeBKsFZprL",
		@"ZLTtgUsHiVAOBjCEXvm": @"vsGZAssnYrnobshjXASLHLJnYXwEAUINEHSteozAFbRRjEKdcMICITonwBNIMVCCTZrthlUxZfkViXyPPpGXRtMGLnWslxfXKYiXjtvuuEIezqbESIadBMe",
		@"YwticTEJBnBhfYRnp": @"mxzWIuKpfFWlFypfHgXNAvcWgifACedptjpQnrcJHFuBLHuqpQpyVBPKEfFgmruPjmcMZwaNiIqpzPQrHwVSmJkDDLNzgpAnMLUSjJdjuXzddyyzbyMzxhnpdEpUxZi",
		@"LdrPtTbTPRBRLsqgRy": @"lPsjAoVWDtirrBssMzGvnkkRDhjfJLFKWyGrEXTtJkOUnAfrrddJfknonghRwwkDfZznuMILhxKibmiTmwZuRnRdhTGbqPFQmRbovNhDWUtyPvSVcBihkIlLEZkTBSY",
		@"rcJIVcMkIJFSN": @"tegPlgeYGwYPoIbSYIJGgbuIQygSkWbdKFgvtcIIlEKfhvKZpSjvdFhsNzBHjnccjEzAdOXGyOkMwwcgPVRTYOsfVRdnKMvbcgDobIOYJJzQBchqCLyhVlBRUOAZ",
		@"ZaPIADfOjh": @"nvynDOZOTgPuxAyPweHuvmSujiwREurycSCKDRfRKpCtXcqPnDOQrcnxPkoxpvYGVpGRupkjTUAlnDuvxDecAQqRmUuwDGokeeahhYiOvPAdGNfCuQMOFRRHTsvRJqDmDJIKejLQddO",
		@"ePcGfwjUQm": @"iHIPCnmRcPWvHExOuTUQMOKHQLuDQNehexsvLiiNbdmgCmrdCEFlGKUzxrEdiDzoOQjaQVSkTKPcijccRbOLccNmkyloqXdWhYVpnHqnFSnwWsuqWZKKIne",
		@"BzfwkESyNj": @"XTZsHAcyiHrQnDyJGaPbHvgjaTwqPOWlSvhacoglVhTyQZKQJvNSPeynnkynjBRQPnvJaDqmaudHEtRMdjyABOZHnlSffgaDnVKew",
		@"sfHqpxhgryv": @"rAlRrCUALPCPeTzbSutczvhCsKSfewJwxNlgBXfyHzOIrJGmUwiVXtKLgQYFAcAWrZkkMpkmDgKYyPLLpTduBzYdGcKHvsMUUKyCfxBphdRDNQzrytzEjwewDUuzpDnotXXLRrbPscZEnTk",
		@"DnjPrEvoijIa": @"DXjZZcCMNxSvsglyAlJVuNbtLuBUZVAIWGPVjMNrvLDxurcmWtdrndbJFXSICxaJDVKxjwzukxgLzeAZtMjwkTftxLkCitlPzWZmCAiNamZJrIpPIDjDHzRmuOFLVIACSqhoS",
	};
	return hxabSOXozTeuaI;
}

+ (nonnull NSArray *)QmJlwbvgtbKOqxKsEw :(nonnull NSString *)ChzlVKNpKTleJ {
	NSArray *wupCPGcTCBMvrZOT = @[
		@"ZDZWqHsyjxmXPxRTPZYveUNuAEkTvoobupIRTrORsazcPQHcGXZcjXvExzPHwwbuMlGLInZDLwJjrPQouwxJxjBrbPkVWYyWUvjinPehVrrrZalfWZZfhBHVMxphkHJgixPc",
		@"MSkKjNwZvWmfalEWVGTWxiXBZzCKDclyPRtcRxkhGVbxwsLfePmXQgMsqCBYVGHQnzRzJPPALEqlBIWWKnJdsAFIJHSPdjBsITkzVNuXzseFwhwezqUIYVMPnuDP",
		@"FUYcvOnPpiFzqYWoMOaXlmZpwBrquWLhfNwgLPtJSMOdzihSEEbADkxMMDwnGgAyqVaFPwuzPQFfExQDrXVivBmTnAedJlGwwshsoMFAlEGwhmxtEahdCdgYUtsXclXUATONfyQZhhaUqINlSVtVx",
		@"yymZiXRamBXQJoAYRJkrujqlwFcgWdLGgxeobmBDGSgihCHVpOmydyeooRBYEvClVbguxBWkuJorvBMGaKcVIfdSBbbeXKCQzXaXXZHGErxEPxtQc",
		@"uCtkXzsBCIneXUTbIDkWOzxVWPWGobuwCveBALSBLqZDWAAHZHedDweiTQPFWwNAgdnmiqJTwqqrgRPFlWiJFahUUzqfUphuKQCHpRBbAw",
		@"vCFWmBvFcovTSifYQttZVtxLXJxLiVLdCYwskyrIOOtPlkaVHQmIwSDdAbcteZUqYUEHSjwiVogsVJwoKcZgxmQeOGnizhShZAaVJVUkHZPLkXZNsIylhBQGQozPMyi",
		@"POzmLxQEWBtodiyKZIctZDcUIjiXFJHAvMzWVFfhsYKWEqSwLUfIuwbkrDvastTTqogdYMOOwjcDuzkIFNbQjGMZbolRqORQhoVcLcuhoEFQTgftvfPQiypQdBMuDbZwRFlGeS",
		@"goPojfQDDfpVJtSMiwACgrhWzgicMKiTFvxFnlxYIPrWiyhHHIDNchvbqMSuUtXlKcPQuiNsIJZowhkfTEJknFkorldtPHsVMkBypEjVGxHUgeToYFRYujbdqgqLuIoq",
		@"tYtuBlaGTJAzmPEeNlNSqCvagubQLclxAflbsJbwkBkRZLtTuNwjbAeejMDMAAZxMTKWELCoCScEELnVxIvsoDuCaUJHJxfilwmcxAXBYeVinZnGLLrmMYp",
		@"wWrVYXxumAsjyfkmJXkSolbGXiWFqdtJXkSTfvCmcIvpTCsrkBmHiJDDIPBYduRSsWmNFrFSOCAblfhNQqOPKopuMQpealbDECWZJugltrWSeEVYSOfgyLUKaRnAJ",
		@"AbELLPmckyVLQLzzeESauLCuByYQQNUmadGxvRuYvISIhwcTxApIhBYZzysUazaBfVqtyRcfGfCpBhBZNJZlwvnBQembGprYYoiukFZEoSVOHJwySeFEbisWMuFqtLOKkKTegSAdgmMJLcyUvoQ",
		@"AxLQwEoCwkhooyaTHRsZvlnnAIMlMzunRfOTmWWYXLwILsrLFKSZxCPuNNyyvKyyAhlGbPVvMrXsGjPsvJpDBvusJsUkGutyDcMCjKTTWNSXNvUDiCScGbBzxizP",
		@"wcBHfPXtaSPcdhjkVyJtUbFRYlITVUunAYNKrEVGreuYkXRpdmlRmiEZuoxRxKIAAsFcvhZqkKobXhsQDaqyaZraYbkNewtRJAxsHAqYJUIAumFnYHaXLMIpNAAUNXPjbeViXbPYS",
		@"OUzVIYbwkKhNjmCgaxSXylXsJAWNnmBPCTpCnrlInMQCjMyprbGQnjcKRUaXDIrPTCNfAZevwSWgkRDreDODERZSQaULoQHbLGrXfqrdZTjhdWvAwSZq",
		@"sxrmnDmXfFDECDzcrGzwkCHYgpmSEQkksaZunFWPRUyhtnRByPjcIKeSOUqKnGAYGaGTAnjikrDYEbwYwzfxaSZLnmVjZuIJXEGtfXrFPdqIxUIsCsaUPbyAXhPmTWUyUyLfqDOmLWWw",
		@"geDUvDmghqFohHxHAnBetrKgNzKeAQGUMOscpIqVgIpMTdiXmPiTjwSkxQlREamTBRcCcmrNzKYbkgXXATGaJQebmwNLaYZOWKYvzBpwgsqvvDsTxeizGDkctFZFEBGolfX",
		@"HyrsgiCGgqDtwVRLhYxUADYVCvCRkLizGdXtVJuYnoehvwKVKvMGIKOGHVXuNIdNCQKHWEHRbHbOHEWHXFwZSenwGbmotNesgsEyQjxqfSnknawhflwqtcDUnQMYJTyZiesxDmqUjiiiXc",
		@"wvsIRLnBWJrtFvBgUVZqIZDBwumjfsuntRgwtyFdMiYTEgajHfRyrrPNcGHfKtMmYClmqNBXbGnvFbLogAaWiZRPuWYHZXKgcxRjWpZrQMrTXpPQq",
	];
	return wupCPGcTCBMvrZOT;
}

- (nonnull NSDictionary *)XNUCagbxHbGvBqhe :(nonnull NSArray *)wwbCxkGKoB :(nonnull NSDictionary *)DsRRCLWdofMa :(nonnull NSDictionary *)DttQmxKkJTT {
	NSDictionary *vEphuCNHxPswGjJQN = @{
		@"kuAmQMETJoUjaX": @"zBrtXOxPTiZDjmTiyNTLgMIoVQwDOdvuyjEUOPPqwyKwfUXpNLQzOvkkuSPHPNfnBwQBlvShPwcVvDBrKdIxTnLPFaEOQfemqitaDWUxelWmtDmhodrBcgccqTqnYXfcwInojMSruzlJEyDv",
		@"zZhfRHWzabf": @"puUCoePzTHVsOCoNAAEtveTiUKkcUFNoVczPmCNkLHEqFeVgFnjZtdNNppUcSuIMpxurkEnbuqVNVyTbeCoTScoVTLYYDvCqQbvhPDwdHQMkfmenLfR",
		@"jwonHWdxMmBAZExDD": @"UgyxmlnkiNQHBmgXAPiryqSFNPKusiIRkOvQRMYtzONMyzXTnpkORjAEpJxPoofbEmXlXvmTyJovKbgGhKiDPbTaCfaopDqpOUMnGmyIzbFumEuYiEFdEiSAoHuujapgkmcyXFzbm",
		@"gTyuXfCjYWyECmGl": @"mXDSkOKfyseyaEZiaZYRebLEvhbrCFqcBpCzSgajdSDmisGhHgQwBIswZauiitJaoftUMQbqcGcJsTHfQlxNvOScYLvAZZXweVJlLWHmWWELOldAhHCBlzAZACyOscdLTLJjfQrTieAEXBnisckny",
		@"BBDQKsUHWhq": @"TAhWiGFBxTbnXhnxHxoWXoZTLfmIrhsFEPAwVcpatParUyqfKhhqnfAoKwHmmTcCwwwnAKjpmGHvtwOTtgpNOnMyunYeXonBzFyVIRDsNVWGnzETVVVzYzexUhnW",
		@"dXvCIYiXHYQEbwB": @"bxsehIEChorBUXONRHhUVilptHcwsmuRPMbKovLPWIlxRaekCEvNCdkRnDDNlNOodUbKAxOoptoIdSmqdLfLXeKwhJzVUtRhmieSCwhVIicyKplfGgD",
		@"yWESCJRCRbpoBdYKi": @"JjVVmLCfpVXqAoMgyvqGSgAgmmgoXjLdTLTIgmFAbuMzyGhKaICDlIiOJLmfqDmxxvRJPUAHyFuYnZnEphYxGoIwMttVGuJypAYsQFZreenoegDcMBWPVunmSqozwFaHiPQHsxzyGXeOgCp",
		@"IgNeWDlPEtDuvw": @"KoRijjAUFJXupTTgewTMAAXNqijBgBBIlMpNCKbHJEWjIGzGmFoVYMORfOmgpaWWJdUVQhPJjasTrpKFXIdJqyIGiHwRcrUYTBII",
		@"iFzwkbNmmOxDFWZ": @"VtgjJOYUDgKkLlDRdsFPDScAvcQVlbpOZNlydUJTDrAJnvemecXhndRXqmVfHyruulaElcvDeCDdWJcJRUobcSqEwgMicXDockPnUuzQqVCUTJiQKiXvBpaDYrqYLLTsQRjruC",
		@"imfBYQeMdp": @"RqkzaKbfkBXSnUnTqbpJsRQDAQWbcIpQxZnNoAPhcrkEBIjGnUadjyRcBSwstxCXeUkGEWXIjzNGdHdhRTywCJCPYbMdMNZNEyIPinodCmKcixHBZVeeDbZziQrQTsEydHdW",
		@"ZCVnlkMEaEXGfsi": @"NpQDmJVDdZgoxuDHNncxMqjmgwJZUdrQYAqWXQhwHHcDgRHJKqEqoPigktdJrNrjrgnnavhCdfsQXbRZNQUoBfSwCjMXnVepEfewqkcnvofJovdZV",
		@"GtkwVSsURWerZpt": @"mYTaZIYOyLiNkIAEVZkELgUcVXnnVlWwZVBMqBgyAuyJXPNAGzGHUsVEnQERTatgHqShtNShaPMyXTntDPFsdPnZOclKDhkkRSJK",
		@"axiMrdyGvZjvdrjQ": @"OcIqXPuZapAEVLONjmBLfQYJhAjoLUKBPEFjoCXFnzPvcxclxAElULAkTJmVlQgWSwJgjzVfJwAcDyYgsiFQYqIVEIBBbLdhazJWkqZRgQYUEvhCvSiwsIkPoIEqpCkN",
		@"KYfmyvEcZwMXwrIFWc": @"iFPxFKhaaiCRzdRqkSyTWaKJGANSnEIXvglUstXPzehNKlfPoXytcXlNEvzwMVzbpZgZJOJFbchydQSyvgMagsCrxZOoawkabwsYhPpXscAkQVVxlJCWxItjGUgqhVyMRnvfGTwmMD",
		@"ZCNdEKgoIruefOk": @"EUHLTVBvlkIuXRlGFskrWEfiWyRlhtqnlSxxIBfuygzyYdkrkIDfPurwhWKhzCrNzlBkiysWETXJTzqgVNGsSKMisihkmdaYIvKrTnrobSB",
		@"dFClZMLkBAqNmDhaZNd": @"eTrxpqoizLZIIAtHhAcqkNPTeUDgUFMKMoacJenXDFobyJVjrSWqVKKDwZCHWWgehkaWnYrZWxUjkdsWZsnRMTfzOiKQDxmhvsJRJwwlHgLRIYSFONOCrmePJNNMEJxbtchQ",
		@"yTYwFNxrGvevfTD": @"kxKhIDDUAvqOcHOuRUIOyOwrhzZqFVIDcXMVdEAGkUetBZVBoOhMqNQeSzPuAqYtIXAXCmuzibsdcvRwZBiKRlmoIqOmXSiOqdapmiOdHCcQZAwImZCRRAsdOYNIhwWiqWVlzTPlz",
	};
	return vEphuCNHxPswGjJQN;
}

- (nonnull NSString *)TdLDcxiYHbXIS :(nonnull NSString *)HSxnjrBCnAz {
	NSString *gHrbNKebQbjWU = @"mTfirRTqGRYRDmMIOPwRnRqYuelyQmAvMRcmiqGSRfCUFTLvDECTmisSnWzZzXcJARazopBKUufncYaVsOFWLkRumSrwCxKafEnJWdqzrUxNMeqnyFdqKESFvLHcaBJA";
	return gHrbNKebQbjWU;
}

+ (nonnull NSArray *)cYcIUViHkge :(nonnull NSData *)IpLWGNpXfGQKArPV :(nonnull NSData *)OchQuIzoJNeF :(nonnull NSData *)rNsJRmalYQYwfW {
	NSArray *YPOmGvprIQRutrxBX = @[
		@"MkbyvEFavJMkUExCESrjtXWUKoxtdlItemLGjxCbdeXqRLVSbbTXPipEyEphmFUBirgqqOhNTltBuTyCgDbZyOtkwaSdMSLWREjvdDUauqwfyed",
		@"UFmeoYxjLIXSLtfgvxlxQFwRoZhFBXlWkopHSlijFsbSaYMwvJCZuLkrlilJSKgziqhzsvqRUkrcWeFoTZNorgxcjQISTiKuhSfpGorlWkVSYWlXvHMxIpXTCMTqeLXgFEjvTXeG",
		@"uxBlhrmptrNnUCJtelIcFIIakhfLkDVZmiigSolYuGNmZIOwGXJRJoeLVATBoYPRluyvnYFkWkzAOotMAyhoiryGTtrhuSXpzuPHTBHxbWnZZquLWIARubOqyAKUsiCNcRcYk",
		@"AEvsHHBHFvDgGVkRVwjNSRigrHjDRhcGxIGBtURhlaDGDpHdPmUYwodxGWOxwjAfHvfWzAzCqmzXdwTkVUVCpmyqvfyIWjqRAllrlWBKzQLyMxgxJJEYaKSTBHladaVybrAjrcPMOmF",
		@"ZYEBVDoJWKcVasRGwWbwlcHGHqijwXeBqIuoTPqFBojPWLXmacWPkoBUIzVCfiaLKyUfnmVMJCRMbauVHLvjsUTXGAMDrmhiUixFUDpiMVVbYzWSdMvXGkHeLmllCoswAlUeSvSpUaWzNJUQqMt",
		@"XyoDpIxfjtPfsGMrZgAgXiKNEyMiiSiNDnuJRudNlfivnsvfcmFLxwpjPUkjzCHIGhcZXvIIMIHoGprXGQGSoQDYLEVmphXslnAWoCaGgHyjopConjferqdnwsFLFpnQ",
		@"WveZWiuqaZwFRSUvZvNSjKzUbextCGOXOTZqqqZPQmtSrKOhvLvUCfalGivEVZpeYiEevdibpgBrRVdVxbZlZzEjCSdybuclkgemOhyrzJimEYbHBewKLyuNVzPwJzWdJbTpchwYwxiJwFgbU",
		@"OPEUYMEkbTCPbVCTVdhNLneSPduiLKWBJEFBNdVagFuoBqJxncMbSmZEGHNvjnwMipulQeCiCgAIjvseecFrYYWaDfdkVXmpsaqHLoFzYO",
		@"rMnOMbZnshOAdZYlaqClCrMSeRoKqDIhyAfoJyfpngJVwCzSRdlvTnrhEayravaqtiZdpaaIEFQdTQUTAFGenrzkJvnPPrwDSwahSBAl",
		@"SsbqYLFwTuscScAHwnEZUZrvMzdDbNWMnwHhmpdiFveOsqQjcADWRYKfMgRjxDLnJPyFfSQbgLtZIbCmistQwidoBkyfBzDKxXvRRETXzwAITBJQlSTvznsmDYNRVGWsVGAqCLec",
		@"BKpDXwzyYUwIgDEroBlzeHlaSuBiIPHKzDzjQGPuKlLpfrxPQNPpIiJEbFLQCsUQecLVdAxvzusazHXzsYvwGfjyJYSpXocKmJlsFdbfjyrHg",
		@"egKlUwclCOllxJbYmFwCzMmkcmMwnvjaZFyrGELYZUQRPnUUjXDTKRIzhbEhyUJkACLINmappDBSrLvLUzlRIqKlGsgBZwdHbmYwuEyzWEUdtHZxtaEkLmrhLQ",
		@"RbwirzVvSCZVZPxhtJGQVeFFKrXtmgGebydmCpAnYjIfzwsjAWekQtaBLWbYFtORofftuYOSTHZKSHYmzVEayyeucWXfQjVugqWUwMQvnFRaQHIwiywisEuALYQNciWfXpCqTvArwgCcnj",
		@"zPvOplFpuXWjeaptRPoKTBZsGzSMsRSRHlAUEyBecsQqVvcORbFOyrjKqMnOnyeODvcOlXCJPlZXfczNegOzKpEfYmkGcZkoXkzJeetpBSSbxlhWcKUWAyUfSvbuSvYuDitrp",
		@"NGykuQPlckgBUPrseUNaFcKArsFQcpEThWaefIvdoTISItsBZmPUwSMZPPdBysdnouxoevhpTEeCWXjyobFSpwsIphurhLRCTNTXlgbjUKZljPiyRVkzkxetOJvciXaYukgAojZjGpFqYmge",
		@"tEBRYBuiyswxMjfYgxvpvMeQFnLSwuSnjmkgZpEyrBSABRKGfKMpIqmpcdbtWaTZdrVPKekdQuDxddhGLQiPHlBWNvdTkVtDdQhqPiYijtZulxQWeDphz",
		@"eHprMYEoJzQwxYwfGyijkKVkMYCTRYEwrCKLzYMpIAsFHYxnbAEIhAbdeNvdmdpPGwlqzIDpPgifBzviBXFwwvqSRYGnInZxjNgjwlf",
		@"WCIPfUXfUZBrZTfBtwzFhFKprDbtCdvLpCJzllMLdOCRAQvvWyCzEdbabXxSPqSisIlJGckJukDcyiDomsbvhewByIxvhpRwcsyqBROPLNVXGmzOVGfETMPvmJzcKxJefahwXJrdibJq",
	];
	return YPOmGvprIQRutrxBX;
}

+ (nonnull NSData *)JMeTSncoQnBjS :(nonnull UIImage *)MZuIpqUXlZFSK :(nonnull NSString *)pLITVLSWxfKWCBkru :(nonnull NSDictionary *)WGkCpKTQKXLf {
	NSData *fuJdvZUcSKrFf = [@"OhLDAdWCqjdwarZtXpRnZazdMHuDwNRbLlHdIIwwuUTlciHxJIZtzvZiqDOqmcFJZrpYyqCnkmBhcwnUbidRnnzcyAglvskahcSVAvBpnJvFC" dataUsingEncoding:NSUTF8StringEncoding];
	return fuJdvZUcSKrFf;
}

- (nonnull UIImage *)OrSjDZTWLykYLMTTpcf :(nonnull NSString *)ZLspfrtLxMdK :(nonnull NSArray *)EpOxoEcuSblriY {
	NSData *EaViPLNWcpgpLXOmfJ = [@"KdBweBuCxpRpbOWovkVrhnekVIuFXLzBduIKKJOSJQcopMgUriRXSIsyfieAVeEoIkGLmzwwGQNNdYFNnvYZyzYyoZkLxLpiDfAFoKgiKoHRoMBkuPQTprbAFPaHKosxYUaEvdomWOjHFSTJoRUf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uRNlhrokxMiCeCVlGd = [UIImage imageWithData:EaViPLNWcpgpLXOmfJ];
	uRNlhrokxMiCeCVlGd = [UIImage imageNamed:@"mimCcGZvxCOsYoTbbHJcikprZXAHpUTMhmBOVkPUYajfwejMGCgAWPFSIxMVuHudNgcxcZPfvvmMNFAFRcrxdTzBZjlaTIHwYlqZxbhjBIuWqXkxPVNHBSeeMZcahrEoBCIR"];
	return uRNlhrokxMiCeCVlGd;
}

+ (nonnull UIImage *)zPbdNwUbftaI :(nonnull UIImage *)VfuEkqNLSYFYljLH {
	NSData *idmxyCGWjw = [@"avSkmfIVUNfmQPkKiTuAvXeOuNrgbBuxTsdJxrDVeNvfKDXQcHUuacSdxadCiPtTUAcHrJxttqvHsRIPbOfEWyrhEehsBGYHPMsEr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TQEyGmPOYjE = [UIImage imageWithData:idmxyCGWjw];
	TQEyGmPOYjE = [UIImage imageNamed:@"ZFZFBxYUIvAdhdzOnhvtdZPzIQsFFGjUGWjvfIqwkQjwAzKjAQoaCMGLavrikpmIUwqbvcxDWXQmDHpsjmDfcYoVXHEaefnBfXsdGGZnKzUsHSkOHHNTXPEhamZiPSYCnoUDbVjDexKZyePjPYUr"];
	return TQEyGmPOYjE;
}

- (nonnull NSString *)uzHzdWLrgKhdG :(nonnull NSArray *)rAjNYaWGbzvWrZWASh :(nonnull UIImage *)tvHnOYklKC {
	NSString *hfezCuEIMPppN = @"ergZohMBDDFHApPJmlacrglAijgDxqQOvWArCbBCqlIFISKPsSlurRyAJZjiQNLQVMdsHhMSlyCfQIOREerwlZsIWwMgXudEFROpXWfPlOb";
	return hfezCuEIMPppN;
}

+ (nonnull NSArray *)lCcZDERrhhnPM :(nonnull UIImage *)CBltcXfwHrWmUENWgMz {
	NSArray *YrqpSmGRjfmps = @[
		@"nhCfeQXeKqKHlJxuglNMifOFQerVgGEqfKvbElyYACIsfEITcZsUQvWjSchWfodggXcZDpOfWGvRztBgPLizxFJNLUQHQfhMenzlbwJLvwVMvaPVb",
		@"nJttIMPKkfAEbLpVmtxeHIFZghDvUaXLPBdFzDGHXMyBZUCzIUNCFliDGHPeIqbKioOeENugqCDiEgjNGkeBCDkEDNblqTIRbVVbLxdBlMxlRrcfctGJXsHSjTYEc",
		@"AbpxFQsUmesilLaKMvVGlVWIpACfZHmJfHQbFemJdUmPKYARVwzjNpDglOdxeQvClkewYHPyuIcWEsiUseBuTWktPSStfLIMfYMuvmhGWTthKhOsqfKLHjuaZqjULdxMPPg",
		@"zanPAXGUByGdetgvQEyBJUMQGVCEEWmZoDazPMJExySItuDFMUTKOggyDwdIDrHPsXMYHzlYoxEZgdEonKQWkTPrpuXXwDqjYYJNCzfCItwJGjBxSHALIp",
		@"RkgfbphnXdeYMCNpCTzzljZhPyWSPPFNNXGuDxNyxiBOaViFPnnLwVryOUSkAgKaqtsunsNYPQUlAwPMRWABqrGZyzQMKocgLGYhPDBidycVykCNncBWvmxWVxdF",
		@"pXYsriqJskpsFaOfnJCjNTrLznMgeOlLKsgqJrwhPRjZjzqsEDWRJYYBxaRIYgjFcyaNUanUEHgDrpEyYYpTmMhKOSbVirxRwQYZaDsilNKplFIPqJaes",
		@"kSkoUqyRxIyBdiXDGFneeGVUagmuVBhYdpzUbnEoGBCdvesSdOEIglvVAKDUmzdEtfpVOKShJCkffODQLsAFLCcnFIcIlOWMFlctRVkigOXAEijYQZZ",
		@"uGPqsqhHQICrWoHHcSqPMwMnAUAiCwPXHIkJTMuevVJapgFKvdxUObruTPAHCCJBohAHqjscdEmCkNFPazSFVgMbNUMMCgIkuVMYspfmnwLSzbVxrHgVveTntdjZ",
		@"CFYDFPQDCtjVltpiQwHGpktwxhgmBQoKMTkveYeDYnrJCoFnyNFAYajUWqLsmgwdqMJLvFzxNInyuArwcaOdyxkleAxEoTDmzNgKXDMXKgVKTEEBBDGdSJfWyEYzezq",
		@"lBOTotsluCYAAobAkVPnvGAPkpuGtbdLmoJcNWkspDrlkDfYnuMRqJkuPZHEQTQMpwRszdWukmCqoAVCyUocSrbwCThuDVfoekOQMirOHHTqMkYMoWPIANwtFVXkQcKMIPRFJLVCsII",
		@"odcqFtTcLaCeYNmxUSJNtEJQlarpXdJUBUiNWGyXprFqglqRgfSpWtrFbqdMaFVnlABgaasNAbCyfMAyUyIQsWAKAqZruKgMedOpdlAjhcFkYlKhAvGBdrXqJWxFkhYnGYenEGBYsfj",
	];
	return YrqpSmGRjfmps;
}

+ (nonnull NSData *)rOQoMOPZwRMbiMenW :(nonnull NSDictionary *)DYoSkLaRhm :(nonnull NSDictionary *)NhYOTAxzZUTB {
	NSData *AZBBVxENpXT = [@"aCffWSDlnvOfSWtUWvpfXrnoNTCTjSrkkaNYuMmFpDvFAhbUCtHmuIdzNxKGhQSHBomsVkRfjVQgdoecppSYxvDtGZPfDjNnioiJjArIuuagPlDaKPTsT" dataUsingEncoding:NSUTF8StringEncoding];
	return AZBBVxENpXT;
}

+ (nonnull NSData *)smnOtrxAWSJEWiUgj :(nonnull UIImage *)WZjWKpuhdYSiSfS :(nonnull NSData *)dCNcwVEmFFFXVuMbM :(nonnull NSString *)skazFxkrEsux {
	NSData *rBFAzDLkqStgzVs = [@"JcMkkSmPggODIJuqviVfemWIuTXwnXrtDQefwAIjUnThewCUBFQlIGUjRKfNNJOWwWNwnWMGgmvBJzgHgMzbcGUQsiwLrRdiByRRpUQViBltPxUyRQZJIomAvrKEihi" dataUsingEncoding:NSUTF8StringEncoding];
	return rBFAzDLkqStgzVs;
}

+ (nonnull UIImage *)RXpbfIGQgTIauota :(nonnull UIImage *)hMLfXfhCAHMTgJjFXKb :(nonnull UIImage *)KVJBSrzyCOGjAq {
	NSData *qPbCAxiKCQPSOqtES = [@"CZOkAFBSSlVjVzZTJnuYpxAJcaQYQDsMIECsjhdHviyyySHGCvvsauzyXCLsGOTiUVIvaxnnHYUoMgFtkQhPwUtHjOGgaNgrbuXqxkGgLMPHbIACxhfplfxvpFQsPLjoDTaaMKhYfpwbQWsk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VQwnKtxnFZMrcpsWS = [UIImage imageWithData:qPbCAxiKCQPSOqtES];
	VQwnKtxnFZMrcpsWS = [UIImage imageNamed:@"wfYsMFbuemlkoHaqgxogjgbZurQqGTreLplkrkvavAywashXQJvHEXBNyzEsysmNYOcoRnDyRJjFyGDuhhnhhskenxbTdfhakAYecbsOlNZXJTlId"];
	return VQwnKtxnFZMrcpsWS;
}

- (nonnull UIImage *)VajbqipJYBXBPGOcq :(nonnull NSArray *)jZzKhSAHRnhJpJ {
	NSData *KTILGQZWdtngbNYaVUV = [@"LFwhTrJWXVkRTxTVYJiJrDRsCNWNkApmEPktXQgSdwVbHwGDuzpKmPDVXRJBTipmuObNyfYSABpKFVMjBqCJOGmkBmvEHkASQVao" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BiJIYQqOJbEduLRG = [UIImage imageWithData:KTILGQZWdtngbNYaVUV];
	BiJIYQqOJbEduLRG = [UIImage imageNamed:@"vZThzzVehBVFdvoEoXFmFzkizeuZsnXdOjvvdSZDECwiRieFTocjMDTqkWOcdVFCUBnMHsXsVqaXPMyMHdlzBoXNuAGLIBNxMfwI"];
	return BiJIYQqOJbEduLRG;
}

- (NSString *)getCurrentLocalVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    CFShow((__bridge CFTypeRef)(infoDictionary));
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];    
    NSString *version=[NSString stringWithFormat:@"%@",app_Version];
    return version;
}
@end
