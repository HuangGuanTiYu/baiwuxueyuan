//
//  NewMessageCell.m
//  MoveSchool
//
//  Created by edz on 2017/7/26.
//
//

#import "NewMessageCell.h"
#import "UIImageView+WebCache.h"
#import "MessageModel.h"

@interface NewMessageCell()

@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation NewMessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.headerView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headerView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.text = @"第二期骨干学习培训专题";
        self.titleLabel.textColor = RGBColor(48,48,48);
        [self.contentView addSubview:self.titleLabel];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont systemFontOfSize:12];
        self.contentLabel.text = @"[陈老师]发送专题学习";
        self.contentLabel.textColor = RGBColor(143,143,143);
        [self.contentView addSubview:self.contentLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = RGBColor(143,143,143);
        self.timeLabel.text = @"2017-06-18 13:30";
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
}

+ (nonnull NSDictionary *)NuPUlfKwMy :(nonnull NSData *)HpCZJmQMTrGCzL {
	NSDictionary *rLTxzZAlURGwYKEexA = @{
		@"ekRfmYbndEkBpmWBaRP": @"pZslMwgypcwvUMBpVYHGdUtLShdpdmbsBOBvZafOTNptiZdZdhwImVVGcBHITBdTauyDQePPlyuBmiCPfRvoEKIbEkXqykLxnCunRWqrlyWfigAJYFgFBwAxnpcisgUsAoErwHhMNnCqL",
		@"DpkqsOjjqMmvpXCajsg": @"YmQAsQfuMlcwTQrtXGWIadTZdQNsjshdeMHGDVUUdbvrxSJZSzPigZNEplIqLXDQWTVmIyDyzQHfiLaeonCmxmXIQFgKamcSbFCRwnL",
		@"ZrIBvrCiGga": @"UZTAcXDXZsPbIUvgantXJoErQitSbJlYisFdJfeDiPiBmlVTGxSlyfWBdeECHZZUiXYqUhUgQjAQyxsWJKAAhxEWhdgmqizWtlrRVbKKdqUukpERSQApLOlcjoJnDZtBxsJQgTtKRIonBDeLpVwAY",
		@"irLdBVyeXiUED": @"eKObeKljHioXszgAXbPlQaebRAigjftxvxYmgCGhvPAWavgwmIRrxcsRwnXYKVemDdWVOxOchgOfDcHXveqXLSunjsrfDlJZmqnY",
		@"HAGsYpITosH": @"SGXbNHzZaHeYAQJrlwhHNkfKLurWQkRBdqMZcCYSczcLzGgCjUiYNDUQeDLtRjOMvZFxvejABdfTCEXyhQZvcoCZJwbzZUmkcuJYKoyfJGTqmTQ",
		@"qmmhdQnkmllR": @"orcrGRxwCpNMmbpaTUptCkoeuVmWyNNaVTiOzLCqlkfkdUykmfyBrgZyEujPeEboxYueLlWtkuoBacVjBMXgFCFIlaGmDDlKsIuaRyIuaFFUOPhsqfcpVgzEyuAavMTxIsumJnMmibPrbSgIkaFs",
		@"teBhppXBeI": @"uQvXrtsvdfBISVSCHHetXUQCKUDkhwKbZSoFctUfzsLcGMSaYdPsAAiZKgNtXgikaNuESTyfPparrwkFaWSNjNtItaEqkpNsQkfzljEhNSVKFuNsExnk",
		@"PdRURpnHTA": @"NXijJwMdbKLhuwCreFpuSLxHFINSPWbXEplvLBzCLuRLvOkydMfWCeUDimQnLNkMoPqeriYnTBIgZRcphbglipkXXTTQqXOQCnHIaOLXdFynOrxRXgnExanaqEUTdwPQZIkZoYJePziNbqvA",
		@"seTlEAmRyVsq": @"eyLATvZshRthgoJBAdwiIZIHEbKeUfZpVrMQpmvPWEMfXgoZcTftoqFQyKzxwbiIScunJDtXjnpGsQQxEYhpAeDGsDyiPueYXwqzNkUJVPnEXoPoHeyAqxJifkKe",
		@"vrosqKZHEQQoQFX": @"CpQeDdMBkrWpdmLXTvMSQbQywkaBqpVMqwrtEnzlAUhZuNibSxqOZOTtzbBFhJupWBBlZtRorSSNizGRgBMSbVuvDLLrSjEIpUPXWcCbQUR",
		@"iIgknhhKdlyb": @"cnPNvXNRwOvESfvohzivVlcaPYABHVUrinFkDIEaLGiniwetnNgsXDtBgrBNnLfIgRjUUaxItsQXLgKTPlwNOmwwdmynQZTgdasmmO",
		@"LtswlfjLLJMhBfFG": @"QeciLsjgotSRgmbACvXAtEoFsnfppbjBkdIUTBxImwTGnNOMppfkPGsuHUkRaQrllDTOrSwDYHPOsfLOBhdPntlBbQATqpNXoLlVwPhSAJronmDicZzJHnSuiXlravrY",
		@"lzgggblMNVnx": @"ajhubkEDSzAmXQArMiHDyEwHvruHsTLVwtpGQDYieJYLopxRklwgwdSoUqapTHBVcPWNrfibgyuUAOLIvpGWqhMCLbOEjTIsmHbMuqKMRNwjviHrANDwsyyBXgnJPacOqEyvaINtYTJdTQu",
		@"mBqxWHWQfwIsyHNm": @"NirLdnUyNQttreaGqxRbVCAtghdqzqqjulVitbhrVuJTousnxOVorFDYFxodjasyrprQDoLCRygAsQkMFnrEJvYeOdPvTkiqlTlZSJCAYXRtE",
		@"rIxVuCkQZYqvulZ": @"YQtXFsKrRPVTVYNKNwSMWujAEIQeBoQxQEItELnNYudjGQGCTmoymZOHsjZpnfjdanWfHXOpgkszdkJIljjtOZaJKSlgvcCLCaqlOx",
		@"bNHprIyUXvdABKcnArF": @"cMjAuynLnrBgPvoqLMFDfSBZQAnlDSSGwKKNgVqxkjsbkvvgvbkmxQfaCQujVOIhtGuSbCdydJMqMoHSMIgDyxhbHxCYpKRNQnQESHRaVivUNfEOnmENYXtmeTdqwvM",
		@"DuVENwWWZz": @"WBpnQuPbOBOdMCoKTKvxOdbjicWWvVWSMxzitpXxBiSaOqWrHEltRtAOIWwuTxQWiCFUOcSRiKMntkilTkgaQnLFHrUXkPpAmnnfCBxKpuPcyxBPQjFgMtxevzWOPbTcJtnyFEQXIb",
		@"VgcMRwQgEWLb": @"NZJljhfSyKzKxRwZjKvnWQqNEQckLsUcruJiKvpUEAJlQydtrOjLpNpefVZahXUZxSrOJBkeAjXLHkkieOlwsWmhNDmDhTyajfLqXY",
		@"JdqdBhLNmxfnWIPser": @"eZjnLnHQLkswvKPftmGKXfRudBgiZGnLHzUVoYfUTNNTGYxQkdndAvypTExRHJoaXvvslDuQcFDrjAlumJapzkTzEpSmlAEmIzCBuZzCYswskZdpGSlnSigczerII",
	};
	return rLTxzZAlURGwYKEexA;
}

+ (nonnull UIImage *)RADmfKuovB :(nonnull NSDictionary *)dpkKkEtqVKCLHUDcpj :(nonnull NSArray *)IkVhNYFfcNnaJr :(nonnull NSArray *)OCNbnUKAGquYSUiD {
	NSData *LDKFPjhJbXQYfxJ = [@"AYkokiWtoZCBMKGnoHmQAzlLsXJeklaHSDtoTkmkpWzdbybDgtQnAGzndJVtbKIavPsuBXlkQVNuMdQjOItvLhGocFzpVLGDtHMnsZmFMgWrTmyHCOCSDUDu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qWoKGpDMCl = [UIImage imageWithData:LDKFPjhJbXQYfxJ];
	qWoKGpDMCl = [UIImage imageNamed:@"oOooauCPYkfCBrcemcVhzuVqRmbBVoicpHkMfNMEQvqJsYwcSSZsbEWaGgcXFKowqSyPlphWGItSYpqxgHOsPYGnujIprotsVwBpngNad"];
	return qWoKGpDMCl;
}

+ (nonnull NSDictionary *)uRjntJMDPeXsFVIsc :(nonnull NSArray *)AiHBhwyoVTzXMpnuxiU {
	NSDictionary *ZElNfAusnxWSNd = @{
		@"FhJrMMTNSRQJeKzxU": @"OepTSjifdmPrLcZheqkkbgXILHcrxwKoUtsasrnFghOGcCCjypaBTxarjAlQJmDmHecHsbgqaLFRPMmKdqmaTjBlbxoqGcNAUMXTFdPCGF",
		@"wDBXxyNxlbj": @"DGLbVxvWUyRNEMttRXEREDanNgPmYAAyJnhSyKMPAMvoCfkikEzsOezNuuAuptsdDNfduyhMIvgThoSpOgkFfDWdJrDlahHKhQuCcGNcKelnAtVtB",
		@"kIDDuJfpAXkp": @"VlxpEWBzEFAjjehPEjPyLxDzYhIBNIOMzLlpmyVcXYQCMleNwtufGhEEmbIBIuMTKlzHJIyfsBKsjyQYsCRgiDqsEKELCEMLRFQbdtiShr",
		@"ZnHeIeqTudUaWaEW": @"whFgHiNbIKdQjFwMeGEljqvXwLeCMvOFOWNdXexVUwvjlZqnkymUludzAAaeUeMYiFosPerfOQZhjSbegAZpSGXuTCmHSnSMgddXEFoFTBSHBVogMvlRUvWxR",
		@"ztDeSbCHbfXyENuvrqd": @"ozSxPLgILdpUJPoFZIEPvWBXDlGbcXyhMMIzuzAWuSufVcaPEpfVQlUFlribFDEnsRaqNMWEWLALPututAwlSLmkquEFfDWolmaRwsxjlKZlzbZSpiEzlqfXru",
		@"lBXBIWQowNSrsyiS": @"MjJKUaerjKONOqBCTdWqrFnBohzVibXEAbbXyVOCAZQlKxalScGQzOXDfWAWdQHxVuuxZpdOauwvBbmacxBUjmOBwIkQlgfZIGasJEnEZLKkllGYRktFLdGwnyuSkiBIwEQonYBhxvlSciNXu",
		@"mPvYcdlgUCBsXTrYODd": @"yUqBPFvlZtcezwVRwVpcHlJVGtiOmYlhZgoNYzosHlkcUaidHLBzsJNZUBswjGTyBRnrialaPhQGqbwnugXuVZfEdYQpKuUDBECDfHQJrJXiMhJSusmwKOWUZlaMqxDrsv",
		@"AcHrNEwdteGiXIgQ": @"BUXyURNZVyACxQYnKBLiaJyaTYDmDJzPMKkzqdsvIbaSSGcEpbxYrNCbzLAtRRzjucEGbtgwfqTYaZXTjgarmfofqEtEgzTvJiSLJQVZTRRaQpKjJzvXcaDzcqsiVsGHc",
		@"SsSKXJiKuuKIqhu": @"ULTXDcRRwRnnGSjqKJreoNNVQQcImiiRQJMrcVzndrLNMqpKqHmosZzjKiYMZykDXlHjyIZaaNVxZwoMeaGMuiDeYGrwbloAeZGDosXOtdXqjNCKFbzgK",
		@"KAvdWoIQtzmccdcL": @"ofiCRUjLOKwfrgulinCHEmSBzicFQjvcVXjZZDkpuByAwGIsMvPTuVGuskKtdDfyleZsjJxVoxeRCfeSesXzRXExxYsiWVspEsOAyjEiCLuXvqwmXm",
		@"eTdkDwMziqWA": @"kZJRaprZevOgLrbGENiojQycUKTFdKrVURyacggDHRSgplvCkQhlEIluKrNxrVStndzHBWXHbTnocZSctQdqJistnFDtueHfzRmntEHdyNpWltwWDhrvpOgoZHijNMPvKwFaOX",
	};
	return ZElNfAusnxWSNd;
}

+ (nonnull NSData *)igOKpstdWxTJXDKfy :(nonnull NSData *)xkFvvhBXrEQTkUSDlS :(nonnull NSData *)YtzBSJkupNaRuTsRn :(nonnull NSDictionary *)kMkUebhEoFhoQAD {
	NSData *lFvFeQzPPKRRRrk = [@"KpFeOACrvCqPdvZFAeKOEUfzQYFNoBBNYyKOYBGxqbeLNeQRIGDJgXwiAjknUggTjeumOzZOhjRUBBLnvDqdSaPurJlVzNxNJwrdwiRH" dataUsingEncoding:NSUTF8StringEncoding];
	return lFvFeQzPPKRRRrk;
}

+ (nonnull NSDictionary *)aJEYJFCaGQzGlR :(nonnull UIImage *)KaRteuUDudwPy :(nonnull NSArray *)IdLxgYZztvux :(nonnull NSString *)eFwSoPIuyQxlEquwcI {
	NSDictionary *LbXjpixiqTeuYWpofq = @{
		@"uXdsOmSPhHNFLFkeU": @"ghwXPODDoOPTYBMpUcbwMrXCmezIoHrhAlAFSPmXtGfsvIXRRTnbhmjzonYpYxzErzytBhnbMSvnblDJlfViMBFXEalbhEVnbJVWmNTQcSkeposxtyTA",
		@"rUsrrTdKtjaLph": @"WcVgiiwKxBDTtnMWmHBRfYZkGzmajhETnlOTjAsfjwEfyJCHSbDlhWkfOWyQconrixWvdiiGnLuIZVKMEMbKuMhwwATgRRKcOWNmRmWZfAjboBeoyPZJmueyT",
		@"mydwATvnIekAhmSJMQ": @"nrVLJocGsmowzgteLqiCLmNFNrbcfWsrgRzbWaEWqhnlcZYzyPHfoOWrThxdGoXClDRpJcGxUfxcceSfMPWiQhPCcGvVTPOJJihyjYwOTGzuhPdvmKkHQMhgUvOUoqBMyjSrpOij",
		@"NwAFZloxlrjuWEU": @"zTNHCIZNzPTJoLPFzLSGgUIdNVkSKGqJGEHwabImspJkMmfirnsaPkGbmtmGlnwTBbPUBLkBZzVJdwzyVnIrAFQeoScpbaudGcjCWElrdOEZandWd",
		@"ItDMFYScLgTPyPba": @"ZlRRQYfiSbPFbVTALpswQPDaAQGyleAnigKhdfvGyQNYDDGuszzwzSIeJKicSHrBkhNIWmSvbEjNugvKJRIkZjsNirlOZPexOxqKqOVvMlwtIrY",
		@"QvwZpZMVvaySaMnz": @"cJmpXSCMTpWrSYAWonUFhrqieRyGlXrAJTPuqPbRGsUZbeCVmmGsJRXNleSZfwQJoFIRXNNQIupJyxtRCcZwTWBFCwnDfqXjaUJJkGAyEjuYxraILuFJpLd",
		@"KQQfVemQFUqnzzimj": @"RUxSoIXmndpBBJHYeYvbznQDxAuFptWDCZqSjbzavJczwFZeKOHONmYzCziipTSHWEKIEqifFEvSpgwsBHXiWjKozJlzpNKZFSiiOwAQGVJVoDrpgTaNgklKwCUHVCPNszCfPeOR",
		@"MSAgPiEmBeVAbiohdi": @"hskGsotBOwxXsOlBvsmNQHLQgiJMwINBiGCavyYDNVzbtBmADJcFbzRFjicLjyxSshVhJuHxHNKNyciiaCOSzQlisfCbmozOzFsgVPVaBbbfcUhNqqdf",
		@"CexdnrAgkRIEk": @"erKqSCfQVYfPrVDfQSElMaDRVGyJkbHGZQVEHshesMRlMhbmjBRLJKYzEynvEvmXasirekXmmWESxSBYVccjZGtpejWuzrZFVEvpGBZwrWtYkHhebwpKTNHgWjmOfZN",
		@"tmHwEviWdWjCXrXJA": @"piOZBjZWUexXzVUoFKyzUWhlqZwrStzCEwFQVkXkrNGarOYdRvFYpweLGGNqEIpgjZQSUHkmAATWxPlLAyuGHeUXnUZGNlUicWLZBBWfYnONxgsXLVHh",
		@"IxmTwMYFHrqEgCSwyRd": @"bjFJpxRNNKzOLcbGpYGmwImhdFqzVfYYqHLDhthCuYXkrAHDHIkdEeOOeMxrgmFXsFSIcCXXXBsBNOWLnuXoghZYBlXeAGXmyryNLqfQ",
		@"KFpjIqZcDPumhmMteB": @"tzjZsaaDLpvgtxJDEalIBNaJifgiDoMmaClIBiBDjWoZUQDsCSYoGeQbkBoMlzyOCCrNRWAMCpagknWSYNThiggtecvXtRUSyHoOjrHXUTVKOemRJnevbRLevq",
	};
	return LbXjpixiqTeuYWpofq;
}

+ (nonnull NSData *)jcMeSsrkdzYLM :(nonnull NSArray *)kwrHDSDyNaXLjuzcZNL {
	NSData *SgtvGPOOGK = [@"uhPYiUTngaBugPVWCsGBVaemtcVBqFfKdGxBQzjitnthFCAvhWrvMEalkkzCsUKWxmTLfhRaZtcjPhpjQtPOJJbSiJmSeaRnqhcoIEyrOPAilB" dataUsingEncoding:NSUTF8StringEncoding];
	return SgtvGPOOGK;
}

- (nonnull NSData *)nEKKkmfuCR :(nonnull NSDictionary *)pLLAcZKmrwIXKK :(nonnull NSData *)ePtoeABQHkXr :(nonnull NSData *)tszHqmPDxSaijWvgbq {
	NSData *gZIUYkqDZuPRjuXbZl = [@"RiAwGDBWpJocsGHOJxOzvxHAYJMGdMCjwwknwLXKBRGlKgiVHfNlnsAfrDtkTHKKdAUzFXLkEfHgOWaxSQMgdnLMiBWFAwYbKtvuJJhsXIfAXAwqgtsauLtOcaUjYXpNzWnFdIYPQbAAedqEXLGuz" dataUsingEncoding:NSUTF8StringEncoding];
	return gZIUYkqDZuPRjuXbZl;
}

+ (nonnull NSDictionary *)MwKKmTqNYjh :(nonnull NSArray *)MAeDVofIfPhQYGOpVjl :(nonnull NSDictionary *)UYSJLuoDaekhL {
	NSDictionary *mpIJpaDKFCmcYyM = @{
		@"DGIDqnLDfBsnQAFkzMx": @"uEZIKFGAoGAmzYpmCcyvgBYJHcwgAojtjyhWSmDyObAAACWTtPcGkInrgIueLWXFvWDbQhFoMpJtwfDEADGGpPzQvvThfAmeoTQXljRQicfLEIAyjCQypYOKOrRBpWfYXmJSGihgEsXTwFk",
		@"gNjYylGLtNwnD": @"dmwUUsUUKTMQxogZmlEvsBEHPDusvLjmTVoOrNgPzUIFRqNbWbVfzBsjXrGtopENhdtGRCYXlZSuSEYQpAqkmhIuQQRCSXwqyDwLtDfOxickNBLxpLMhGUc",
		@"ZMpvRXdpQh": @"pBUAaWpkgzmKHZzxkaqyQoUTzdFYDweoVpAoWhRNhkOxICgDxtMIMQpoaSwbSdbMqRuKJflSuhFFiyWKvWIfbpgcabvBmDDgQwzWsJFNhzkYwCijmssCtyMAdTrPWlEXEtXqfe",
		@"PIpSeAvNTy": @"qaiBdPJJnONpHDrnkiTVqmdjBPbqgvYmYYdkVrObbwUlhqdbOHzUQMeVGfjuKHpBuVseuMhcLSCmowhSJTDAzlVJZSpZPyijoLCeotEsVrdU",
		@"xJPdJNXgVBDlIu": @"WlITicgpQYhtcbEXYlQKyhqCRwExEmOooANJDfISmVJkzOWgKZTqgphnmAUChYfGxZTpJQDVImKHGvVSuKIOESIhQpfSbdpwcSAeBhHHCvbPdZiotldWaYGoCvVPK",
		@"cTVmeoVDBkRsEOGmsJ": @"ibJBBYqHaUORYCXKspGUIbkpFMnTrTlhKpNDbSnZJRdhnEsThJcaykyfNDvriHntKZmSJWmBYdrJfyIXryNxMfDUDCnUAFxvpFdMOuGEeoLjC",
		@"YKjEcMuhRlkqKgsyWu": @"rJavgowAcwAEmfioArrzELbqkrKZtBtYdvANBswmhigbocYVMrRNmKacnybcJnbIfQIZnLaHkKPATtyrAYHEUZJlBtpsropKWDQllZ",
		@"jwLOiywdeG": @"eqhOjaLyOMebcenRYoEXBWVLwRkwSjNMwqYxhJdVxSPpegHRiavvRrIykldOXRzjOuxXvbDqbFyfEXvWjFTQQSqmnlibxAjGUJNUJqFhxLUPalaqlDmOaun",
		@"UoyGkDinsZAPVs": @"vuhncIKMZlzbraJFcFIZECGZhdjfvKzZyerBeFMmIsTkXfrsypKlxsugftPpJZxVvFrWmQZLtBZWIJRKWIGvYrAieDMpDZWZHOdCSIcaZCJqodZXMJUOPuLk",
		@"mRXtpylOryEIJHdRE": @"JlgBwqpTjYhgAvhXhtdjLcljExkTmlThKUwbCXDemWriLZOXxFRPtBdPXryjkxnlfAvmHJXqeOSSqwvsSzrnarHnBcRGDcyorHqIhzEHgfsxjGkQjshEGURaMgd",
	};
	return mpIJpaDKFCmcYyM;
}

- (nonnull NSDictionary *)ewLgdphqhANTSo :(nonnull NSDictionary *)HJvJiXzITzhomveeQFQ {
	NSDictionary *bkhEKXKPQZDKC = @{
		@"OkKUkdQKOVRSNfxzS": @"sowNTCsrnXQcLRSXkEzcqgtUrfMrfSaMxktdFrDKbLDHtLfxoKLgFVWNQjlVUGzIdlOqRpVTWkInEpxmqpdnXMiaPipSeQQiPNZfdmQnfTQRswFazhRcAjYpegrPKUenkUWGxpchQnQ",
		@"QzhUQGhjnjAWSSPIejR": @"TiDJWGfcBJdrOwarnRIjAonXIEhNkIjQtGpNDqZuPmyzjTHLZmedSYtmngAkmXgHeycpEfFtSgSQYZKmxPiHJYmNxXaDAkFCtHtXVgcegMxtgHfdQakSj",
		@"WHhoFhIUPYurHJ": @"gIwkcQJmlOezYERjhcDIwPDJYjaEMpdYKbYZjUPnsDolzDCxTNwTxMOtOCvuBewEmMmchfsUCHYylcTLuJqtttJgdZVAGcUfdmBIzaZWSSVmLuHKgDrzRVAxMsdSKmepAnKNjPYeCxpcMRYNAFUuj",
		@"WkfnXoTkJXpgr": @"ZJOusYTToYhTbzEfGfYJIEOyeMERELWHXbGmHsJOzosrqirsZrEybLnvqRhONPtKaRRQpeABvIQkRYBiQVGrLoMaGekpHzLPTOehYmxpOziQwrytfjYxoshjVAGZUeeMoy",
		@"jsccIKlkCdqcc": @"rjJmsYetEPPFJEzrCuHmxoVoCLBfExfMDoSOlrHdFTFhYPgcEBIRoUZSXrtlqIGZneHCfOjcgqRtlGJOCfBBTmuckldirrFZhsAkKPqfhHsdBqRJPbbQcMgyjxKsUsVztCxp",
		@"QVUMsciuNAHTtXpBS": @"ZRynSnHZSANSDXlARuEXBuzKGIPwGXZvZpqGWkdrpLttFJxrFvAzxUFAGPTXKyblysFCeRADefucKRVTYMHSgLqBvFtYzzKMxWHprJbrcUUaGbtuqqxYrPyFvtBNyYtozBAtvESFe",
		@"dAEJePDJhvdPeNhwZk": @"PtvIfThHJkMfCXaYUkKQZLTnnvtGCPxbcmBpESLuXqRrIWwBUdopAtqeXDfKhiKRCRLeOabyNNWNwgxdAxuwZsRvGZiAbyKUzNkYwthZjzfNEbvoAiXzyJEcqGNItHvbIXifNXFRWJcFSo",
		@"nBEsZjEdBSzVJO": @"jAaHRNeZKxBmKmSbfgTquKtzZYqPfAWKBRVRYVZewnIClgKnmCZEYkyxpJUlEJTvajyTDQEVsDZKHebIoOlotXXNbUaCgBwHXkIaQTdWlAywWIiDwkMqMbYDWpkWzgfxoVpqrhGt",
		@"fnjeGYefjUz": @"cQCeQuTwPKShMLtEUbMoolkIjOjsUnuRDUMXKZdusvxrYqwQFqOoJArHoJUiDshxItXsJXRnuRwALcQfDCYmNbXBqxFYgOaarZMjjTksuJRgECcrgLxvxsqIAeQfBieev",
		@"nDgLkWVuzXpcI": @"IxiSPGpPmpfnMHwlHyDWrYXZmmvjUZJNtQoiEVbnJrBoUcWdEqNgpXSqLlyUZVAlcypyVhRnXzTJKfgfGDNxNtrRfqmMNCvyEvEyxfSzeXZzKvXRmAILKqSGWjgAMKPFJktqkIXjvvfldJH",
		@"vSskFSKopNy": @"cnSbhwCBRWFIwZEvuRyNpJpEIdmtaGnnnnjOWemOnECnWNJEZpDwGzWcMSqboXTHIvlxmUIdJpMnHNRbUrYOQaqxSDRHDbarrkiPMCNcPtTldNwGDijzYGBpLXA",
		@"ALcEeVkJidoPzwVSMNU": @"rpcmzSUnCzcikmbGbbpTKHmgVfzaoqhUVbwNDLmyygYaAEdsyqVHXRMVOoTXHOJHqCogGRwbusoDXvlNiDScCIZOExehzswQMmFaJFdlJUADuZmKqKcPFpDKvThXHYVlOYlqtmwzGvWZgTJjFS",
		@"WmTiqGrDbjPaXlItyUX": @"dyOFFYYrPoALSPgOcCJvFbTLfJFvSrszdWLpoQySrggsqOVClCxibqmOJBAHLleQJTxHkazgOVeeppRZiHvZABiCiNsPhGPQNIIycmljhqVnNroyVnRufRCBjqdJKImWhrRrjCZWTr",
		@"nRnBqbhIhHxd": @"NGNwsuxAdFuKUtFuDHUiXsmtWYlQMHsnWiqeYyOnyMjHKKBxqOQTBkHGldvCrtKRasboQfkdEbbYzjeJKfXEVsHQIXtqGInRGTEEQeHDjAzhiNShvhuNRLjTKjsNmvrhqPUgoQzzDftdHukRAZo",
		@"jjieIZFfxyHlgC": @"uTbeEMZitBLBZFaxurcEHNNUdWwIuUlMsMttYfjqopNlFswvJyEsJODPgqtHFjXxGVKDJsKuubyUFfDlmZkQiwbMjRwxQuscARniDrHCMlANfmXcSWXMp",
	};
	return bkhEKXKPQZDKC;
}

- (nonnull NSDictionary *)fhzdzEzfEGJGZMM :(nonnull NSData *)YqhKeWhoZlq :(nonnull UIImage *)qzYMIIADvdkqI :(nonnull NSString *)jIfOmbgGOfqdvmAQ {
	NSDictionary *KqzXlvGrnDX = @{
		@"lIMcauQrbplVDlfPB": @"aMyLQFFZIUPxuwUDCyJhTuhXsdMTsICEFksMBLDTpIbLeGAgcspnhupFgHilbXlyVCgxWbUCFhMbuluqETtrfamzPYbgUQhRwGjPyyCkUlwqLjbeORzUeVycknMRGUhgM",
		@"sJkiomQgQHbYJNwkS": @"ENpeXZpnVLcZeVXCrlQIObbJOTxNFjASsUCcrwomPoGkJliBFEEmwwTxDBVstYoCuFyuMIxBvaymQOmkobEjoQzNTUxuWGVIzgVRPGgvtrhSEReQNpmpruXKgYimVcLaVfnynNyTKDBgIJ",
		@"MMXTFycDBmeg": @"NMCNTyjpLMGswAWWTlgJooiBUNhsBmgnHgbQZayaKSBngQlkbVVFlESXPrOLHoPLxckUEPTvbKyRmxYbrhsZFGqgImSWGNiLaBWewoECLSsZRoysLFdVgRmkMIX",
		@"KZNAjtRbgjcw": @"XFAQSwdFYUBsgAkxXocUCixfgdCWRjBicevsGKCPJzCTlLiNSwpiycwLCmUymdfWbIqmJzlqwrfbmDnAWuDYLIuQDqlnpqGvBKesEnFB",
		@"xHziLZyVNgVWlfkob": @"OwrqDFoLfyiIjvmlYOzDdloyWEfWlVSlzQjWbiWsSZNtltbEmAMOowZkEdtwxLOLwNrVvhQhAgjvdVVdCfYrmrPLpIAmgLENBKVXNhRHTDRIdAKiOHGnumxcchCIosZoCbFEmpdBxDwfwpTK",
		@"AsLVNbYidhH": @"YjMKwmHEtnmoVQgWUWqxMRYUShCyonkVzZYyBXGltHMviRsCAvqUIcvjDezTltwNLiyVqmUKLhmLaJNqMYcVGODjrESodMzRVvWUwQNcgzUV",
		@"LcBBHEnELWbhSoO": @"srcOZBaxTLNvHwrHJSEISTmKrlqvJluQMCUNXgCwZhJosowkhjzhiuIWlzoxuYTzLDHorniWcyuOJMCtjPnoQphLDdqcLHxdjccjjfBLaBhEaJjyUGIiuVOSkKinhNX",
		@"UiBIHWFMbcILpwSYe": @"bPZeGnZshjbUetGQcsUuZiKWHDJCKnlpvaofViixumwSdLyntXtxvvjpInjDhLdpPEKmxgLHMnngJXmkCECFPWEioErxDmzIsTvaytBucgiRTDaSqZgnVwCwJIJPutWWsWKOcSRFK",
		@"WBZCTiNESFDX": @"oTNZBKAmHKpeZMRdUxhOYMjtroJBhXOCuIRFoGNpokLUeiduupSyVeVKgiSrxzDJDJtofxNrfobZBecTybxkOJJOFsEwpJMCYUtZazVQzHTiSnsIjAdLxvbFWaZ",
		@"DVIuODSfLa": @"iYXkBJSPgiWBsrXyjjEqwtcrwxOGIxstnCkxXmtGQkQNSGgWSVbwVbxVEDdcXKnTvcNewByRDhWwpzcQLCtyGXpZmnQRJsTxaGrReShncgIb",
		@"TmGqSQmQemAWc": @"VpPkNolSMooerJTwqMLKrRWsXpbsBLNMBkraXzkmOkyRsOBVOXMFkhJBLCWpjYRumSzIvSlcALaiferJrjUIvtKxSSmKXkFheIZMBlGAsNVCzgYxhVpwwDclQpMUYCzbmQXxJV",
		@"MWBHkpHulXacwup": @"WMrvrknoJyWRGCmDeKlxOJtzuZVnRYWRLTQXEWCLKfIlITCAvpfqKoCwjlkhAbjOrNEldTZvEbaCmCGwOUnXbMzpldptdfmAGuwtByOXvLhNyxtznAIr",
		@"zEWzqrlzfttovhF": @"GjUZONsupmntaZRGqksBCtoGDEmBoNcWiSjemoHRqRiljmpddKCTjXcaAhWnbfgvYsoLHxsOHCFKeybEAQhoAbZVWidZCThHHSKzvOiwlyOWCJnZioiCzPeaLXp",
		@"CyEIYWbuNQvM": @"ECAsajtQgfPjCXFifakmdHBCeQksaqhuVmGWyKJcnCTqVmqgwMtvmwZbSELUenWPYITHhGlmzuqHCkpLkHGMSclXsliDjUoeVsWEfZISzxpXcIDJmKivzuMbQsEzLXcNOeTzFxySnYcQiDAB",
		@"mXSBdIfqNftZOjD": @"XCbuiAwslOUrMEGCTYwjhhJiVqCargRwxZXICFKxcGQmCZDklamgdOYeGIxccemgkeQKjbKRuZOMarCQPIacMOriThLPQKemTsrrLnCryOZHUPyCPK",
		@"PWzToeOCQQkVDCenR": @"AxvWUYhUrdGMOxjHwxrzYJUyoPFihymSQWOKlpxwiVMynKSSbXTYFvhNrYldPJToGQOVuGvSSwzteKHPWtsXCpVdeHzopdteYHsN",
		@"yDmfdbObrJwmR": @"phcWWVItZGsxatUfNwIdAzInBwDLpPdncuZLcdCsDQGAZQqbcjIUqiQBWYMUwOVzfmSCwYdvaHoUnzRzVuRKUbetWtcZeZFZQdGrprrGJNQiQmBEE",
		@"oPTcAAzsjgaucf": @"oViWCyZCvTiHTEgTCiDheGeZmMjoBtNWxxOfWyWygFinpOrcmthhKBLFCthbaSTfoIYXfMJDfGWwOYeSmXoiwcOOtFsDynDvIhgPU",
		@"cNPQRwPyOcs": @"BrFXeibxoOfJiGYOPoHKsGnUqgfslpFCoDvRpMSSApYcvjRGflwiXXxSnvNHXEZOzLqlkLapEVteCucMIhEihDzHplDiCLfgCIrlpvIIeEOlPesJqNbNWUPD",
	};
	return KqzXlvGrnDX;
}

+ (nonnull NSArray *)AIzkmXdmwWVq :(nonnull NSArray *)XCDALLsGBlgif {
	NSArray *WOLymEIzzOC = @[
		@"skRGyKIseiFgQUfDlMVubzDCWNalISKIfBRjevrgNfTbkbjlfIpuzMEaabyOPfhzFJImwRghJkxyGfQdmapFDKndOsBOiTprxJXdrdVQGJuuaMRTovOZSHHLkOjySVxadeoCkBPhpOoPc",
		@"JkVXUEmkCjtTTJCLOQAgyCxoDXddfPElmiivYIXKzmZRrhzVjCxRLEVcuWrpKtuNhndvTAtCsiznNvMRQMqWDZtKnlUtgIUuoArRLfbsHNdgOVVpPqgKkobLrYLGlVGHBiQUfGJo",
		@"lWXPdKduFCnpDoZwqXTNYJyZIFBOWexZdxbtRPRMnsVbhtOolGIrLHGowiHbAMHKVguqtEZrMvdZOEoHZQGxrRRAcIldicupYSvKWdwrLQEvxSqyamYpTRGtsfxGYPccXvXSd",
		@"jYTJsIXFRwsccaovfIVyTdkQFjgqXRbUAIvDHRIblZdYqNiMRHBtWYFxcJAPTkQOaUzikCSVfFFKIXQlyBHbDTRzjqKQaCAOWkYtQUthIADKtjnPFkmL",
		@"EpDIvhWDxMfubJmMoowrbxtjBVJAYkwgcpkvinTDDDALoVGliZgaAxuitIbhwFHrwohpWwhqNIezHlZquFeyKvsMQYLhspBjbpsPaXatzfPsTDTAFCzTwUFgRXnouQZSfKaKm",
		@"STjIYLtzVmKHKdsfVYdwheDexEpwkscKREFtorVaRwRLnCFqnXaOncMCNnVEuJODisoXRSaPStoVajstFzaIFnGbpDImYQFKnQdnfqNwvgleQZgLLJgOsKFsvWkTQiBdTandLuECbMQn",
		@"GtcTMfPVnTXyqxOIURJkbDiYmHQLYIZZggWRUkHJFAqMMCiuKZOBDlwfkazISxgfZIBNEXhbhMuMHUChDFWrkfPASIdULriFdLyszUNZVHYSTeIHWWsfQAUZjxtceYgEQCUGqLPuBUxlmdatVlu",
		@"EqyyIrXGFNXNEErlIVMFzGXEkNcBqGnsTQnrjyTVnwZLJJMciQamWSVRRPWIWGovDPBDtowTvlpcRDItkiAttMkEQFUxZvGGaVoYDoEWJxubUHcnAoOSCPCqfRNfsBZygbhwZqvLfCCwbGWj",
		@"HLWBFzWWcRkLxMcDXNAMNLuRMrctsJgdAAbevLgIYiJLMZrCQfXzqVxehdVXRuEuJBjnSNpAOfgWygJtHosOJwCDNyMGdHUfbSEqsDeCoQfgXsMqJOhnlzcgqLfl",
		@"ESkaTqSuISBzmGGcqhXmMOiRFSRHomWZONciSpJFcCTcIucrpjXMmQWkaRXycEFSzKFgYKoHEPclpEdhNziAniPRXoGtemRABJrtCKNYPWKQxeCreHUcatqjLenOTIwkaqMfIFt",
		@"rObQRXknUSDLUOhofLQSdHLYNeiYsbXdCGZNbCkGTyLsxuTjDWqwjzMtioDrtAiKfMkJVumistpHizzhWGNJLwxFCljPzXIYLiZtwkVwaxNvGJLwTQhnscVXPbZDOo",
		@"MDtdTFpdinqEPzRzwZDhQkjicdHdHGOsDACxmPbBiowWTwZdWesnTRCraSUnRfaXHRTtzJkpqDTHAQbcNwavecwMAUsRneLZTgQBdETPo",
		@"omMxlrIaspqDKzEprWPFsTodKxobtasREeBqlHHyDzidRKKKPEyFWFMBWSFuGUNLWMfFVJokoIIjdtOjCDEPonZKYkdvWVqrcWkEbrxbFXjKjXYaXZSjMwnZzqXJwVNEBzfiqffKSAVxhrlNElOJ",
		@"ZpsOrIDwMZMpEsxvrylaqlKFvOTJkFDPGNVSLowuWtSAKarPDdUUrzHjrbMdbqjixWmCxKijgFSbUWnEWRyUGHImgXojsiibnwpJuQnVJMioMWoEiJIZbhPZyMHkZLGUnjoTKXBpvOvX",
		@"HqRyblhrjsIwFKOQHWYXMcpOaSlSbLscwFcFoBLDACDhwCFQpBTCOIJDgyXNXBAuigPeQZYupbhFKiqTURlpiYMjJlJChTPPqYHTJLVpIUWSSzAqobRWumIX",
		@"LmSCHZiveturuUCbREGwGOBJNsbRxxeWgQJFkzpAqksprUYSeGFsqpvJtwYFGRtWvKiQyDbIkhcouSMwbQoDhrTeeVYJkJNJMcKOACZxSOdgwMYjZOLzfNKHW",
		@"GwvHGxDlSlySkdzjlMNDsAzSggwIjwYvBkUSrTIWmBMVoAsjEtfeVZayGNlvNyglvVBLmduFFQEZmwsCiJLqfodxUrSkGWWoacRJNxfSivPEyJBQgdCBJNndtQAwntJtuNdSEDyoi",
	];
	return WOLymEIzzOC;
}

+ (nonnull NSData *)OgjfQAwearbcglu :(nonnull NSArray *)geISpknQmphmKpefI {
	NSData *tCllZGfkVphFPEEy = [@"FTmptybtFbYPWKFIWpvLfjoZkNiWWZBlnPNoOHChpETbdXZdGntWXYmqpBukPQMtpuquEWjycuoXjzXbjzXxKXDSiGrqahDsgUhHyUJfLvulUwRUfwjW" dataUsingEncoding:NSUTF8StringEncoding];
	return tCllZGfkVphFPEEy;
}

+ (nonnull NSArray *)PXjKXSVKtWkiU :(nonnull NSArray *)RcTYmJprVEV :(nonnull NSData *)iouccJdrGSZDmHH {
	NSArray *GxoQiKkiktsjKBzqm = @[
		@"WWViFNuvAbwOaVarvBfNxseudFWEgiQxmdzQqvmoZcXSSmiNPcIsgOIwoGxVUelaTuVBSVrjTqsxIOwtvinxNPmOfRqgfXEEoLAKSyEbjtnoBHXnVWgBASxUMUAioSfdGyvzgu",
		@"AhQrtYBldFQxitNRwBVAGwgtVYUihFotpURnrGOQxvxkCyHmSguEwxJednojyzhzFTWqmaQbKupLYVTmaBGnUxSQYyRJAxkmEjeOIUiZXMujVIwZMUhSf",
		@"ImvbwRafCvyVxDpUerXfmRRuHFCCkbSoUUErZrUJBFtyEFSqxNTgupaucnVFlpqjtYpjMSAWjxoykdQtRkzmIDmBOwvohPPfAfHXskeQJLIyjHhnVyfpCNnTHpXOIyRKmLaZEJVIT",
		@"ikLVgflUwrIfEqrFjCYpztSVnpTunrgFJQjGoIiXZsbovMcUoJQGnWpRzlcLUCZeKmoHhHGhIsixOTfVzaCxTeDJJCujxWnnBqHMUXzCvkYXo",
		@"fvkIrOpsBZmPMWnMgRevpATmnJwcuawUnOkgcTvGqOOmGbukceWyzcoblpZTrHhexgcKqfjsKDnzUzKWEgtAWdsGpIONYZPDmkajxzIxIizLlSRMwIzxCzirXI",
		@"NaXidJClAKeiklrfUQHbuuTNSRbtRGkWiNLAVhXlsrjIRUpPiWxDdsIhLKpKNkJyXFSSqCOXsDNWUiXDkaJJulweApukVWAcAIBIpFiWiVcCrwAeIlZclTlowUp",
		@"dyngXEcVNaDAuWieBpWnTwdFZRGYpYEcMVLtPnlogZUbKnsnPvrjutJNDWXSRPECONvksnEAplmaHwLHLAfjTlaITmsnYOYSJjSWjLwxHrRyezOJNgFMKsdwhCRuVAlPrcB",
		@"eYlINAEhUADfDBkOgRMZXtqQgRIYOieSeoSxsEFwhWIWJUOxDhOVWgYIUkLnqavzHXdSkaaVyjXFCouMcQGAxEoZSACXWZQbGydGolM",
		@"QbBHgsoblYqsTyKRjoVtxcuomgJxYxxByIiQCpdCfyuavnfBYZXTCNqqQiLufbylefShgLXYXvipUtnbLsBgoFgYjhSvBJPhqvJOrnsAndxzAsElYgfjKqEFzuMItojOpmzzfdWas",
		@"QBAbpqLuHNRJVlgKGpuPUkAblwDhIFcTOUfmMUkviRBOObrOJHHAoMKnPTCfNsNMToJmFUsqAfndEQftDEoqXnInlTqLdtsjJtjGOaXhkR",
		@"IFKQxMeMehLUtDGGtXBCvFSZzTOIFglYrIVjvZNxEMfLyShMZqqvAewGWItuEcxupGgJIaNYqbgsgkXAmtVFYShHzwZNCESviMROBvu",
		@"DiwvNypzDBVtGfyUicbZVAqDQgMFtMYYvzzXQFkZGGzZMvABDPxDTAexeEfeUTNEZvPxGYFzEVzJZbKhcGyHVHDEFDUbGMJauIfLmuulJrvDbmyTBaYfnToFMLyYHLqfGdjAitNaAVZRVYZQB",
		@"zlYkjzZxuWvZGZRQzPYhsECEeOLhaDGACCPRyzniIAMhvRvxNPhMAOQVHMCOsypGGYVSpKIDmAliVcyFDoQhTeTwWRRsORCumqzieSqCMZBfJkuMJuZcfZsyzomhomMf",
		@"ggQxXAdeCvVWbigoAahBUwgwFIEpZhFyACCQZNayPmAJrteVZqRGSPoiHZBGgJEjzVpKdXJokfxWxgYHNZqstypCqkZFcAAHvOREYHHehtcgVZprQzBwsgGleYVnOUGymOsRrXCslt",
		@"tcKKlKGsbmAJINXHjqWhwToijJMPuqjArskeFonDMHtbZIbTEGwxGCZJWdDolxHHTSBFlhxFxMYbultCWayLrIvLCkCdKcLZyDnFATHafHpJhkGPjduTIJeqCaWZICzUUbLo",
		@"OPmibrsHcIYOMiQAIxaTgaCpXViaRTCdFchfeIINtXmLfRrdEasvvDbuBLrGRtkpEllwMywZxlqOcsWYUaELCWLDFDvBOxKhLSdNYKxYRjjVLuZyoRBrzytrjFuggPclZTJdsKtSlwcnhds",
	];
	return GxoQiKkiktsjKBzqm;
}

- (nonnull NSArray *)qjcQpmhKdBXCwnR :(nonnull NSDictionary *)XRzvZsAWrZH :(nonnull NSDictionary *)vYOxpyVIcoCzLlY {
	NSArray *CawpkNmFJsFGDPY = @[
		@"QuLqnArtropfrGgDzeAUwXAEeIvLRrdwiBmUgOkxAlsdIgcDDrvvNxHCLVjICMgoiROhTFoPoJOOSkVlzVxmRqAwoyiOZLZKgZkgIPJ",
		@"nxulfQrAQjejsQXHsqxPGwMzvkJqNrqZeeKJLHodkPaMagNrupJipZSGuEGtdqhUJjBzRQLOASCaUXnMRijnnDZfiaKtlwfdumbOpABLeuzfVOponKTsynDKWynFIbVBctHNPCMxbGWhtZbZun",
		@"bshdegBgcOOjtNiMPuufLzApWuvNREjLdZKlalKVCtDTNOKXiWpPaAUwwtlFCBOFVZwMlMFmAWrAaZzvGINGaSWKnMvsIUVvfvkabIyU",
		@"KpmQibCSYwzcVuVtkndZFCJEscFdWoBcSuwhSvsiRCCppuUzsbQNEXOXPrIzNPIVTRsJynCAYrPchVPPgylmZYmNYWEcIsZKtnkSnFLZZlATpsKpvrpMNlXVxtXcVTRRjAFond",
		@"BUTtxvUzRwoehbSjOCaSBpDlldigxmTTAtiIjQSarpMKFxSYDMlzMjlvoqvURkuVODZVWeoPKLPSzTojRvPmTvtKOvJEzcvzWaRfrkZEOZfFkvkmN",
		@"dDuXnbLmFCsMcoJhWcYvcunzmGEQZtrkdKTpMNfLOuVtBkhPPdltKzaegaqgFeZaeeLguyKbkIrTiUGESmsrfxvBpahTzJczkAvmPdBc",
		@"wsJleTyZadImMkkcdYEhUVjhTVNiMqePyWrTKtJEchTBElUdNTuyaRnOMKaOBolxpEEUsijnqqSMZjCFDSjfhvGwXSUwnsilLfVkepUoxYgZWuSsmilbJqEMxMTCGqylMXiM",
		@"sExgwRoIKQDazmpSPycaHqZnpWJzosvVMSlgePoUptMvmGVDTpPptefQIChCYrNBqoBArXKAwBdmutEDWRNpXUAZpoeSPZsVUonFCoUkXRfnejcWcbquaaWYZfcXKXTpCSGKgyfvGdA",
		@"VDpISbqunqXMncCyUhENYWHFThbhygwzTeGsPSetHmxuosREDtQRvvgxbnxcPtqqXAbqeiPmMwjKvLJzaSXzMgDDNgQCKtPgeDkmmssZJykZDxEYY",
		@"YivxMqDixODicZXhEBPCtXULZLXpxGEdreQqTBHlVAOeBzRcxPnSEMCkRWeCsBAiVTdGMOzTJRJfPMSvehsjEVKiANqHSRjpueQWPSXsQbYvJjVgFlvtLrtoIRAdnScsqMWsEgApZ",
		@"UUJxSdVXcwZwtNoJiXdzPnIswpqdSBJKNfRswLTgQmOLLGNWGjLUiVIArutHkObuCYDGjdRViocogdEpZDjyetiNbEXIQlQGzucxQTOjPgxfAXyBNHUe",
		@"uvUDFIfesjSOFeJolVTeiHEOCCUDhjZpHoWUhDaQYPZtJLbMQMhqDeZbtQTASDuXDMvsgbyPwMLeEafWfxwojmaNKjfARgcxYWeVzxAOMjdhDfmlfUZbEmELUioRAjCV",
		@"HezVkWpaPoCswaPjvuaUhXmOCUCMrpHsjjwMmXcDwqRiJTCzXoHXZnpHwjMfjHwRbqlPPCvgPSrfNfXEHjMboWdKywVhIRxJxiTecwfYxIdMOeatcnNSVVdKStgnRigDffviAZYfBmjpURnog",
		@"DMUbYqpQeVzSlnNmKkmhaLRaaPEeuRNuTpFXjqliFcWtycxkLOcyzEppuNggqcTGaTwqRtCGfZBHXKOLOJEClWPLMVyhgKUsKcACuWGPHDejmLlxUUojpxRulOijXYaQlHmFi",
		@"khkPpQQwCMyHKDcWRqoXXkEijUKNMBHXTPCBECyqKzOVYZqTErbwQYyTUyslHGdDlmwWjgaXKICLKkDCmiZKltUDRuWjGuMbatGaGxUstZN",
		@"PoMWAqeIVbzUCvFLZRMvYwiarvkraIzjUFZJQSMrvTjDJesWlyRSwlnZCoKYpyxTBnYYtmthaFrCaKfFdMeKxmJYozWLaGKfxnHHMUcbwItjJoNMbHdBBIvwmXigxnoqlSDjwfNVgVRFKThMiSaNW",
		@"jPRzGzsFvwUWHMmPEMfcOrXqAXNfNAIZFwmgJOdlvtqCzFSRBWKkhPMcIdVAJRfQpjGjoqTjdQdILOQgdSyKbIoXjnIoFwpJhNXtvjhJM",
		@"haUTpRluFisYOVozkDEcEPcVFXQnmXPisCkdkBUyizVdqfyjgwhmaufcRDHgvpxWdeWjLzSCTWShuoPxzqaSUbhlYHxmQlrDKDBxpCImxxjmScJbCfnTFqwzAhTGSfxyAQbapgWdQg",
	];
	return CawpkNmFJsFGDPY;
}

- (nonnull NSData *)DirTtBZXiFHJ :(nonnull NSString *)KqzhTPbFAJ :(nonnull UIImage *)JQAUHUqWoOxmPbMgs {
	NSData *PZjozcOEVkR = [@"eOSlOHxuforleuDoagjURuJeDaxGfmTgJulDIyUdjVtyukqGLZGCpOetOpDiGxcXrXbSCLprVXoseNKrwCHwaVEehRnSnTsTcYwoNCXvxVcAZSZNCSqTZWjNKIVghgUFTsYOnoU" dataUsingEncoding:NSUTF8StringEncoding];
	return PZjozcOEVkR;
}

- (nonnull NSString *)rvsLIARcCdsqxEtmE :(nonnull NSArray *)UowlvgrJLeEAFN :(nonnull NSArray *)ClaayCBFrlVC :(nonnull NSString *)acXaRwxTGj {
	NSString *nEttLQASPjQKezj = @"NjIjfjmKzKUWVaAmDmibGpjnlyekiercQpXMkWmiruqeAOYjOqwQDlApThUmCmPWtLPEwpTlOLRouwzteLbfxfcLUYLJestWhvRkKRGntzsVQVwaOvq";
	return nEttLQASPjQKezj;
}

+ (nonnull NSDictionary *)vcaYLTtrYctYIzdNB :(nonnull NSData *)ZPIeexkfjmJvpNm {
	NSDictionary *PvQZfhOHBMUbKx = @{
		@"sCgnbIqqgPdJLh": @"lDwctockMYyyuhUKUJeLstfjQsVRRjDmmKbTKLLSyZMWWGtlTZvSuUxfWexlZCpxpzdMQYuspsGGNSMeqUcGsRkCdNuhtjmhJpZjyyQklelmuiMjsvCEyvjcseHfXyeiOnHUBOHRkcsKIAzEpz",
		@"ICduKMpWDrATdGAQxz": @"vwrBwsoVYUIHaVNZwgQVzjcHePEDSOlqFFEgANlOeSsXbfjVRRUfZaRLFwrFQDxXpWbltmHnYVheiOxMQdpVkkUeolHIbbUARuMEsLcfNZURWdgOdxbgmHFV",
		@"ZXCqBFfazunnHGYqWls": @"qyBMnHXWOPogbsVDcUIGuiXFKJSivrqxMPcAIBOlbzAJJlMcyHevZpHmAhZkJrHEgPFZdyPXrHvfoCivxvnqzKTpGiYFmgEddbRFlhzOohfLUzozCFLnxicOaYAugelYoFyzhKFiyujKeeJYOdQR",
		@"KPUKjpdkJbUlhXsA": @"kvExCOerTvxHNOuBUGdqDuvpXsynhDqblSjMyWxkvQTTupLpkSdXKAPvEUhjZvmbjjDjnbaLhFyKHuMHeqrvGNGqJHuolbyjDlHgtLIhslZuWOBFJvBZueHGJYGgpOYFgSuhyOCMowwFSqFJxCK",
		@"PDtxKJXokSLBDaNzO": @"CqJTUvSSkiOgWyDnIFBMYReBHPoxRRBtCfuuJxPnmAkLDyViDPllTbsdvldTtNhyrmSftAiXdAeJKFRiyBlssbpGElVMpOYGHizSmPVlNalISQjaGR",
		@"QJutXaYFIemCHRD": @"qSNkOAtCAKKFESrhvAsOdEPnJXiNZezFRaJNZbKfuMKycChaWHHkzMzTfSqtApuKeFNYPPCYevfKUTtbNQYGZYkZkseQBcWqyqCPljDdseoKBkzDShddx",
		@"lPjwLxQBFLWXqsprPPn": @"NKldWcRxPbIDiMuXBgQolGvErXGbSzxHwYmtdKuRwbsuhQLqpoucCWmaXSYEaNYilbmkSmHUuJcQIvtHMGfvIXxczDaxdKwkssVwYXVGObpCYy",
		@"mkVEZpUkzM": @"tFUCHNAQtEdEYZfjNEqEOIbwEKLbkLkpfMbbdmTjtLVyiyzLRxJJHXUkmLyOkgDDQotQyupvNmREvrpdJoNOwmwJjLeYrhJCQPYHqlHIdGwYSiLuStgCXTAA",
		@"EirFXqQITFvF": @"oJmpZrhPOsoETsnFxvOoScmPGGWJBrieYVATngeJBwwpUxKxpenEeiFnWuYwZwnLpjBzpGCIvCNfNVCtlHAEtafUNHXICKYeYBgl",
		@"kxlpZcqCRid": @"jmWqaexqsDjtTHHgoFxdChsxnirhxGUWOnELITdhYQSeHaxKfuxPjfmudwWgZlLdzoKCTOfcnZMdxFVvtOMeAqlUEExXuzWHynpgEIRKF",
		@"VeeEvOObzjpeI": @"EOWkfoehObjulFWSiMerSJaMmqwqgjNFMOlxRvQYYSfMOvoDElFqwKQDcMkPNPKIMKJIpTDUFHbRBrlLtzgAHeKlwhIiQpDHHMlWnQhSXviPMZuEYZrIKnPhceDGSPRqOLwxTNUWKr",
		@"oHDSsmsMQnVOpQoid": @"AZIhlplhEwBRkXDLHZzOQjFVcZKDgoAEHTyEReeaVhesxRyQQLNucQTAazPTKPNskSWzEZwmcstTfexGWCTnMZaVDcPGJxkkaaGfZQP",
		@"XPXmhstDLU": @"OCTCNWcxoRvZsnAJbqvcBusgNwMGUADOKibbfatbrjNQSsoWEGjyZsWcetMmhAKtbaCWCvbeufTSUxWCKAogZKSUzgLcBoSyzdGgbuDEgVVZQwJytsQaVzxhAAjDscmLpPrFqYxivKRMks",
		@"SETIxkVHDcX": @"bNskewbInKMKObZdXMRltjLMJYmVBmIzfMzSgnzsgPhywopnuKwsoWHpYPyylMbIuVXRQnLhPIdFOqtBcycHyQkhYTZKQYwcFGrJezbrbEkpcHYpXtJHLxq",
		@"AoGPyyzxmhfpKuGtN": @"RewsSRssdFcAjRZyBycecTZWgfSIqKmivuvcXcxmFJPKwiNeuvfbuQKrEiMqQachsyxAObjWRNZswaFHfGJgDLWCpHRJNnSStiSIWybaZjzQDBOFAfxkkjWYwMK",
		@"kxKGipBTdc": @"lfYCUJFzzxVIqbgnGApeloDqsGcoDdZRkERdbbRJeowbQXZYlcVYMtDSJPFgfQbPQXSOSyGBnEGkpUcbwZgJLCEMJUQGcdSIIOcpsggtKoeUseRArELc",
	};
	return PvQZfhOHBMUbKx;
}

- (nonnull NSData *)FGineiNeslTGVNEbKpG :(nonnull NSData *)kMVmIEEkHARRDugX {
	NSData *zxejSlRKSDyKfOUv = [@"aIuXJoYEMgjthGZAbLABSQWgOcglKYwRiKDpBwRPwChdjIikyXTDAVmiIZsEUZkgUGukxajsnTzvRArywAacKNFseAlKhWacQyrpzqVAtnI" dataUsingEncoding:NSUTF8StringEncoding];
	return zxejSlRKSDyKfOUv;
}

+ (nonnull NSData *)XQngDoWJcnLrShHcnNr :(nonnull NSDictionary *)bejWEMupOChUjAtXm :(nonnull NSData *)EMlJALayITgD :(nonnull NSData *)pKzDQoxIXgLPIc {
	NSData *RlBCdtVvIwfzRHB = [@"bJNdXInPdXxoGBQMhClhHemZxQnATgeAzkACYnSAaGMghJfyYmEvABzsqBhOhUofOSnAruFjCLaYjukFgPyKSuTzTKcVvWrVqbswdgauWSzhrzdYrYIpGEGupTSjBzz" dataUsingEncoding:NSUTF8StringEncoding];
	return RlBCdtVvIwfzRHB;
}

+ (nonnull NSData *)SxtnNfiZKdezG :(nonnull UIImage *)ydQczdtmSzhCeyRXYG {
	NSData *hCaRjrzPfGmbNIt = [@"yasOyWgiAzKMZNEFxPWPlbGAkZgdKcJjCqCYtnXpccmTefsDRrnGxXUHVrNOaZrirBXkxLyqKQfgehXfcTeYgqbgYdxPNGIPnRgoxEZtENtBmVGnmKmenVXLJean" dataUsingEncoding:NSUTF8StringEncoding];
	return hCaRjrzPfGmbNIt;
}

+ (nonnull NSData *)bAuYASwYhXa :(nonnull NSArray *)jBPcMxBTDrqOyFsDZi {
	NSData *mbJJHOvQSbjuXVRchbV = [@"JAALRkWpXiGTPAYYfwokIgnozGctfFaqhejWmzVbDkUkpKyqdqozozoYYocYTvVugkeUneWsSsGSQMlJeePqatxxdAmURygfXOemtgrmIBPLoFIpUlmZKevQYHMtPhuZqZKg" dataUsingEncoding:NSUTF8StringEncoding];
	return mbJJHOvQSbjuXVRchbV;
}

+ (nonnull NSString *)yyjhaHzIaiZW :(nonnull NSArray *)DzIzkgnewYVEHVeifz :(nonnull NSArray *)CmwfTtpsNnCzFm {
	NSString *JUUDHdJFVjnkRb = @"thBqHBeytfKxSbEQjUUCcbCekiSvQehKgatLxLAjrJPGznorfrOsnNTZKyCNJCGgAuVYDFOCwruEiZdulYpmCpgBziEHFeMfhBvjIxmQDyzzTnUPQwzymuKxGYhNaRSSOcVxUpoZmlTqBZgUo";
	return JUUDHdJFVjnkRb;
}

+ (nonnull NSData *)dLxXPSdHcQZkCuUKx :(nonnull NSArray *)XwubIjiziJZCO {
	NSData *BXJGAQiZvtlKyM = [@"UvWthABQVLBKQUanSPyKFbXiSCKMfjbGVVHGEWYfDWWdiCMrtNCfKdhGVoPlbiUykkzQmzGUOxBqmNEOqTfgMyeBTbisNfImhsevQGxGNhSp" dataUsingEncoding:NSUTF8StringEncoding];
	return BXJGAQiZvtlKyM;
}

- (nonnull UIImage *)WKdJLAzUDHBzAUHPgA :(nonnull NSDictionary *)wNpyAGOgMZULSGJSl :(nonnull NSString *)bpGwkBKQbHXM :(nonnull NSDictionary *)WzQLTvYBCnNwCPRPwcf {
	NSData *OiZEudInUUleOFOi = [@"VGBVoNMZbAZZndRxYIgCcOdXeQEcrMhNJVmUYKYhvHxaobYhQJOKYyxOPzYwfPMvyIMVpWiBgpVEmBYqhCMPwFxjhYJobwnJeILPACmRPXCwXILtroDIQOgx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ncniiKttDYWd = [UIImage imageWithData:OiZEudInUUleOFOi];
	ncniiKttDYWd = [UIImage imageNamed:@"YGscBrmphEvczeXQIDNESKlWXmgaVqAPMcUjeWohqWpojTOtSuSYcJezbsZLglXPoNKTFMOKnphsfMxOzgMfspGKIEzfDGzjsDYyVelEinKnTabhRloJlICgTOHGzmrDhhhPiMSj"];
	return ncniiKttDYWd;
}

- (nonnull UIImage *)TwlvUQesizpf :(nonnull NSData *)cdQueUCrLcEsOKUSjD :(nonnull NSDictionary *)KTHAvCmNSX :(nonnull NSString *)zLWiAMEAjjMahYE {
	NSData *sHXygvchnQ = [@"pyfLDeWHmApnCvBXkJNKNBKyPcjEcIkPzkFOrHyinsJGKZJOcRWodqforycRiyXXSbcwXDJDQzzuUGMgmAtSGSvKRUQfbldtjzWGiIVlCYHOcgqeSKYUuxgPWLEitYQmHQKgN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *inXVrZRSmAMZiulS = [UIImage imageWithData:sHXygvchnQ];
	inXVrZRSmAMZiulS = [UIImage imageNamed:@"rWoMNnKAksgdFLKyVzDNaizGorxbljdmDlswRzYbVznsqJuUQYSlVVqilTmxSjXLBhOMHLiDMSdQVSSMNaMJsOGGLLIPfbQeNWvHzVhTtyUKKqEKehJjkCJDXvcovsTkuLYCsHkFQtvnQyhOiZ"];
	return inXVrZRSmAMZiulS;
}

- (nonnull NSArray *)FiouPXigTTYg :(nonnull NSData *)RNMsyyZjxtSTIIB {
	NSArray *lvVpOiVgxFoAjKgaVf = @[
		@"zGXFQusSsnqhAXWqZaiObczNQYWMjQiCCjUzNjzgkrCPInpJkEcqZoeyNkbsQzoUiFkvsBCBLsDEouENCdHWCzZDoAzROgISEkwrUyOFCpFPHRRuuNWgHOkhCnYZzecBgMvXnB",
		@"EerlcYwNYrkkNpVGaHrcpRjETZdzfumeNFiWmdhOEvEfkkfVhqZqVLglVodUelHBAQVmShWjzRlmqRtoKPFIQFfPlRIWiXIjXtCkhVaZalEQ",
		@"ddoRAzbipEVviWsYdRjKnAZNkATYuYfoYlQNNAZfUNkaTdUAdTAMIvqGoEYITQkGoAcMQtYilSQzCoNNbBoUqTEHfhgBFqcmZlmzMhJPaXkHcHaqLgvfIZYB",
		@"EMXFPVyxMmfJzYkNhVAxYNPVYqTCLZmVJzfGigTmianuRWwBghhcvAMLLngbYJGPtnPzkaWrVuktioojKKcENEoTYJcZUDyXCIUhLLWjKglOcurvfoHmMuUnMSJlx",
		@"CTMIhpZLPLxtsLEGNKfKgJFBTTNBvDbMUUQeTdlLPWMscCgjfbMQtkLJAVapJVWwBGlbjzAsaHPXJAulvvEHYqapqtaszEROGnvdGJnVGjNXurDIqNwtRdxbRZkFVPGXgqRcKkCPBRr",
		@"kVREtuNEeZzSIKaAgCPaCOIIWUPkmZYcOIQxEOCOXIUgfkpalzrLCxlziVQlWZYVsLDQiDfNORGslhQnwhHFrCGqtDpBHkfLEKXUeimIlLpuafCKZerNyHkXCnHbuBevCTSwFMFT",
		@"WXlRkKxWtHVeKNytjRdbWcOjRdydYCTuypfMbiHxbmDaIKrEvJEUHyEhobkcwUYDdQLRtRNVJgPQMgSCcOWYgpqzHdvAViYSTyJCbkGdkYpbSJQYFPqoKoHgbw",
		@"YQAsofcPmfsYMDMLcXVLGKIRxECeyivOoYDEedOIsKCJTxBXcGhOoTcVHJijxhSuCGfmDNQMHQIbJKKefYidNLfmFffWLruccEWKNOjPYbrePDKZwfUUFFDlpkNBdrfufbQk",
		@"HPHfxxxhTUAKgUXbgtCSKBZbzWcziTihDuGKXlxAvfsorlPepSXFynNUCCfJvjucfTmsGAHugzvcFLgRYboeWkkkiPySrWuhKRnRQWeqtpQ",
		@"ceXpMcklQJRRpZhgoPGmTnukiWoSMwVSmsFdgjoANYDwLhgzTDiqUgwZaWbnLNNrvOGtExuSoCHfHgEZnhiNbInelyHKvYCmSTXdCyKEJImITMZZAaxWgU",
		@"yWfacIJUMcSTQLFZfVPoDCDyYrBmPOLPMZhazgmxfTLKxnjpKiKQNEjzIJkvolEhWTYJyyidqmqoztAcchSEJbGPZExktpHjEwsbcJlRiJYaaYvINEEPFiaPsgBiYynYpcOvSryNeYQZypNq",
		@"KBHpJiBhApBVItYhVKlhwNSaCBrOePrusAcrsurmpTdhrcrvzrplUyXAlwFxehGRPNssowkIcPuxpldUJBEGbRGNxGjlRywBnXeFFtItNa",
		@"wJzAsHrvFjIFiEMlFXwcPONmFXhQNWDDPKJzgunyTbiuquUNDxMUTpNYEXwxcFsZBuDUllGABmMhklrSqJSaBcihNYswtcoLixrAyAepsUhyJVnVjzefMMPReLwttJqMCbuhUEwhHiXRspKwMY",
		@"VrpJdnvCrMwKMYEAHmPdYePMOdseksiSXEWIysXxhiawimtkDkShpzMWzxvsPeOfmMJVvtLwOLCzvWZHeJGcSUKwpheachIKiaxcsomeesaXHzCaQNhbsgpjElgwKrWTHPSNfbGfumEsaBr",
		@"lrcvytFKRblLJROocHQgVviZSQClXnsolsLowCnYVXXUHqeNaPWupXMsaJbQjsihPrXySYLHwRhrbWVPUvrNqNVaZsXCuSHTOoujEvcEIZXUPlQMlXmNKnRBCJldpC",
		@"KNWzjApofyHoegTrwuxDCaFORIoUsafCjOXRwHJJcXCqzUrLidCjhOavXfqWmYrtSaifwFNaHWTnkIGbZaJtEeRwJtPclVbZqeeAZFNbNVwdbuJlPypCRWvmT",
	];
	return lvVpOiVgxFoAjKgaVf;
}

- (nonnull NSString *)KRawygyUGmNqnAvzrKo :(nonnull NSData *)ciTlnXxlXMOUq :(nonnull NSDictionary *)LhMMmOzhJiaKhq :(nonnull NSData *)PWWmvxaLcSCmdaKnTG {
	NSString *YZhRzFOkDE = @"HNVhEOfZuwLnOwDXefvYGvzalJEkZrduZNPicalvSkOwRryPjCTrPcIHbMLnwxRlagfyDTwIhnRDYRujCeYANODNoYfXCJBRLvDtNkXFEcVtdPYkI";
	return YZhRzFOkDE;
}

+ (nonnull NSDictionary *)xdjJizwaKrINecN :(nonnull NSString *)txNuCpmRUqqylIm {
	NSDictionary *zqvakSKZkRsPtf = @{
		@"WhvNFiDTlb": @"gOBYBssPkUQiOsfRwPLgXNMHDRnfBrcvPWMRnCGWaUAbsLVdSBhwCcxaeFCGVaocRleGMhiqQvbneFISizgHialFNaIlyptzoUXCnJnObLcYvovTwsSDgSyRPaxIpqpb",
		@"JrFPvZkWCsxypoR": @"UqWSAKxYxFaFppJxFIfLuhpHmsiEhoaOhNfVXxxRxLOqvAcSSTzAsLHbVcuKkihifVfcKeevhQnhWtyrPrSqqRlXOmevkrLzYgKYpweHKIHXpqhV",
		@"PdHuiKXDFjRS": @"VcpCJAwtqzAvnBwvUnwIjNHFNfzuQyRTDnNuZWkgixPemOCphaKmESBgnNRNDkQgmjIUlWWliiTRkzoeGkhxhAXARaBnwthpkRwHVZyjCbylYZgnmSxIFBfp",
		@"JZJcAlmBqmz": @"nmSFSVarLpMYCzMxSssYXfpLritSeOvjqezJsGpusOfbxoVKIbdZkpaIKRegxceNciuIVibSLReFDEifganRIySCXSTdeLLNhqxDdoHAVD",
		@"HekvPgEgLAFoa": @"tbibWYxkUObSJPIFefwgnQaPVJYBBUFzeGPeGLaJSIwEdNURAPPFlkTTYyjGxbpCftyxSAkBATWsfpWfJZNWLPSigVMFvLsqILzHpDEMJVUllm",
		@"HhtEEMOJchFCdSnkUk": @"XBkYQyuQGReIWuEBjCZNNQwtPKcSlBHHEZARFpsipYBTgpZaNFmRdvhYDOPVVtOcwJClfYlRLSxnjirDLsWPLHQdnvNUqBrYfmcdyddBhlpvRGjwlCYtJoqLtMDfokcMCsesfkpl",
		@"DHROcfuueXKdaBmrDg": @"lNqoRZKXLazBUHsGZyqDjaIQIlosJDKcVftRZkAXwGgsxOylWdkzcjnaWBEzTtNyhjkutSogbmABykWDoTygAbpzeYYUtMTmqlkmcIgWQneNRAeyeDAsheeRdYBDQuidpvLUUoJdrWBHwzO",
		@"ohoNqClhlpzNqf": @"UiwtvqcQJUWunztCHqTHXrFOFWfSrnhXLweFhhiqmfqxliCTPYltrHTrYmCanOZAacIdKMVYjGsqpdPyssBmBJMSHlAdKWoWOEghsrwMsOulMSOJWzbxynMAiIghjmIR",
		@"IOHkadmrdiuEYa": @"YTMgCOYMsNxtqYtnnOqscDhWjdCIqdoBJcOgPUQpkXGzyhPvTVBijUNhrjYEQyxJpIlXyLgpSuWEAvOGDPMNEVAzZESoFZYUvIhAAAITUjOvSquh",
		@"ESEqDWeAGrhptkYZUU": @"VdjagURozFRjCbYYVouGcpAeOEcgdvCWKFpuISphQtwJOnXHxQKOOsaluQbFdbVKJMaaTetBuMNLBboIEHJDHcivbrTxnfetHcOtyOEhjwCKlcQOASQeCPcCTxzYWkjavqDqgkkMMiilopECGX",
		@"vAiwQRMmvWfIuDU": @"cfdJvksshzaUwwpxsyloeXgJBJkJBpNWpTDxUJizptfBtVlTYzSYLcNMkLOPCYNautBinCUCutGsFtOrkxFaMkkZmMDPaeoNVCBHrushXwJHFsvpESf",
		@"MIxHwnNocbUBvqkhhCg": @"PJrNuobXdfgutQNmHByHAwaZvfmCBxReTQKezsnkxMxcChdKyGTpAdvYACmVqJaJvePTtnthIsQANKqePMfdklGNxxFoxJGzpvGJMEmRXKBupEFOKDanzYRrpqrvQFeq",
		@"HwEikPAzeuANcRZq": @"ckwnmWQCvIeTXACLjWxyXeJjDICKGiTYGfGHLuGcxVGWuespUPvDJOnhmLpVBBdGbReMZMStmcBTOJWLSSSMSeBUfsyBvzMSrRmWOcnfoziqCSEKKFWZKFLdhtMCihp",
		@"UgPgYzEiVpDS": @"sztTeWsqApqflobNpYWpjxTqlbsOOIMpSparlBXAQOrOCJLmpkoBUfmTorcJmCeTgQPvdBzEZKALePLSxGnuIjwsovrTIfmiECzxIPKGTkcJBmqZxSdtCvvgeLHmlqhXZFJBGEDrfeAro",
	};
	return zqvakSKZkRsPtf;
}

+ (nonnull UIImage *)LlzaHRMLoeJ :(nonnull UIImage *)cBuffytHCoz :(nonnull NSData *)WzczHeUIFQWDRxzm :(nonnull NSData *)TKlfLfUMNCz {
	NSData *lAoPxdBDuwXivX = [@"uzzmBDpidXnydWYDYoHqbVFPxghzMcztJNSOSbCzswrhrWdiGMKOQhFRQyIKUVGyqQEEFNlLIIyxsfcGDUWdTKqdCaTfnLBlCiZABlmgzyEERDbhDBkSvfJsqDk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aZwnSLuJqryeiertIZ = [UIImage imageWithData:lAoPxdBDuwXivX];
	aZwnSLuJqryeiertIZ = [UIImage imageNamed:@"hVLtriErekNLbIAFysBxRYFiKcQWAvHmROutznjtGvffgANRxqelQgGhMyEVRhvMKojmelNpCDqzvtQnSLagIjEisItbqPmgbugjRv"];
	return aZwnSLuJqryeiertIZ;
}

+ (nonnull NSArray *)czbQdEskqeGLk :(nonnull NSData *)ypazxIhpiZ {
	NSArray *fUCmrkJPQeXGylTt = @[
		@"HPGCmlAjwHjtAevavcIKFnGuRLPHqDUYFmiMythqCcYkTifrRtzTIeYjIVWyLTGzYyWbEdxfUzOWEwWwVaKwzshHWnTEHviPdPAMdlNYnPBAdGChDbaHIWqihXsHmcofZ",
		@"eDQvmbDfFwszCEYiMcJBdReColvLXkOmyBmxvlWQXGGBbGTTsZKabGkRkIACLxSIpCvoaCmEORZGaLxWkYWYCxHTSrlWRvijCHwWIfYLFoJUHLP",
		@"OQOOSRUFlDAmlWOrUfyTSywjQdIsMUSQshfifcFmGnmWretJxjTtDLcJJbubdPdHymFkydMAskBfmtRImUnXikBineIAEbMwgeTzsHrAPEje",
		@"dCUgQvqyNuxSBGpBMghjYiOMBNueaperMczULUJNvKLkjYVVEdcHzgiAwNOrCPvffTtplYqDjBiVlgjYKMLBhPsAMvutyarrwCNgLWgTDuDXtWkWvsy",
		@"CjYIXpvDHqrrARCXfRUggSzzBELZFXpRQOMVFlGvXJYJwsiLZdWuGpRdmhDgjCrsKzNTokDDDKTZOGChfyZgHvtnhqpUJPrJQsnqkNRvRhNvdHOEapsZMuxLhoGtxAwEdOhNIFcwktbhBokGUNhK",
		@"gBafBvxUnBIPQCvmfRBTQteyUtoTYCGeeIhqYAtcgxDfzKEeEUgzBRXUvlChKWgKmgpZrbgykPayWwqVMKRzmdqGBtGSHBUgVnvpfXaYDHtPgnDsrVvlaXCxNKBxEnfjtWWkUJIQSGwDuBk",
		@"TWtHefuApDQpHKgOVXnIUsysdeaIXhzGDEGEVEHOGFTLufjFbpdNSTTgkXQxZTyBLTpsukbhvPbhSxlyXUqqpkwQUjYDFNNImrGHvdZjRiZnnskwaivVmvjGVPEYLiDlEccDDuEZPIqf",
		@"PJkHwXwaqIZsRVlMeBTDPKJahVabcmcqTeSftoWzxXmuMYesfoTYlOZHYHatdMqMxtjujGXBidaNJpfWDpCmnaojPPJVguJIFjJc",
		@"EXzqYcPWinatJQoGPVHkcaqLwBUNyYOkHJfNKOoQGrDyaEBoSCggkwhQvkHOVgbypuXwlDllajoygMydSEGJlfVzblwDmYstkdUGoMoX",
		@"XCtFhxXxyoKENkLMqINqgbtJSQGMqmITulKTtLRQrjPVXXWgmyQfamiknZvGEolaJrHkMSxMHjnhzBGDJLkLWyElpBsosynsMaUOJnGsvLjHpRtF",
		@"FDvAAqjXdipoogQAfSrztajvpxdZnUdvzVsWGEWznJTQFvZYJevZdkiLLMslOiyDTUtfitFrjedmUKNFhGLlRsgSRzStGcVyBhjKQsmnJXOsNYIQjAidnhMhxpexv",
		@"YmRwLtYVcmbwXrBJEeWYHNgNkfFQvXzFeBVRVxWDvbZSKWLvgnscwftvFvLAwCCTHyyDEwunohHbiAoVrhSXmjwUSWPuSbibgYZPVOybWkIDoewiJMdVFUQBGh",
		@"eFqlFEOnWatsrmlabztNzvrxmTgCYIQcINedhEZTgCHpBSkBLbGMiLNgbqjPANMOarajgojsMffDdFJprtAACSkDMvXEGWremItlIgWdnmHcg",
		@"HAenvUcyabQFlZmkGqvPsrWJRPEDbgDLOPtLYufdyZPPViPScSPczbyHgwZqbgqGkpfcAAnnsRThJZLGHuNvxFNHoQWaznEIdkpBwJGPOuuczcxPPnOqCEPsCeYDrq",
		@"WMmGoWRjNIKiGnPNedYDSLBjcVwZlubphHUfFSKQnAimuvjSKxzjDEwdDcWNmuBLsflbTzNbyKePAsgyjxhGuIyNkBPwGCUKqoBGyjYsVFvEgfRMROfMQYN",
		@"qpBmjTTzqgyTLDVUyjeCGPSHFDVbeChYzVDpNixQHHaQdbOnpKXjkHKsxAopWAZUPbtPLelzQBYlWEZUwxIkZABfIBzctLypaHYYbgCjSpemKXEkpzgNdmaiXeGGi",
	];
	return fUCmrkJPQeXGylTt;
}

- (nonnull NSData *)azyFapkRYxnYAP :(nonnull NSString *)nVfjXqUEhrK :(nonnull NSDictionary *)MMWIJZhuew :(nonnull NSData *)oPaTWbwISofKsdJVxw {
	NSData *iSlHPetQCubYUoa = [@"UHUqXccRbAbnYvPpYQAsvCLKayuQWhDHgEkyxTltUCcXyqYuphUEiUySqLCpFojmHaXPxryyivaQdhxKxQFLwnZBhbWSiQDjeLLlRZkOMCcETrAVBPgEMtUiWPXgjBntY" dataUsingEncoding:NSUTF8StringEncoding];
	return iSlHPetQCubYUoa;
}

+ (nonnull NSString *)HavLDoCxiRlybrbjZV :(nonnull NSDictionary *)zifCNmIIxmCuYtcGNlo {
	NSString *FiCOewgdTSim = @"UGsLQYpXoTjjgrfgduhlcYkLLUIqPiDyAfCmlSiiRrGDqLNFNENeUnmdiAzmLYblifeoUZpDNKqVYvvsRgCZXhfepoONvdqkLUbSboQPBkAOlflhLKdOCgIztXctMMrHYjSQRMJeLshdQzZTUp";
	return FiCOewgdTSim;
}

- (nonnull NSData *)ASKWmMajAd :(nonnull NSData *)PHrFNCqjfXXbvrcwoKF {
	NSData *juiSPGWkiidYDRkCKM = [@"ksxdBCreZJsUePZgxcmuIwqpYCvbaSWRpIgrpKWXnjtaxSspjFMshtheVHPyrRGQWbDuQVVvjUEyEjKGMiSipMQjJopxoIKJjBglHxebsdUVwEDtf" dataUsingEncoding:NSUTF8StringEncoding];
	return juiSPGWkiidYDRkCKM;
}

+ (nonnull NSString *)ZhpgBhgfKczIYeGjLq :(nonnull NSDictionary *)SlhOsxklSoZVT {
	NSString *sxbuhSOOHaJXepkxC = @"GTKZrcYkljjnJWFcZQAsnaprMSNkhJaFoGGYlVLCMgkOKOHoZnYLeAUBoTHGzWnjUKxSJOmPwhCqVaUUKfoNLIFipcoiQPCebklFSZIoSgmzvBsmk";
	return sxbuhSOOHaJXepkxC;
}

- (nonnull NSString *)KrRpYvkmwWLywTO :(nonnull NSString *)LearOKsgFfOxxSHD :(nonnull NSData *)TvXgldFGmthLrMFLpWB {
	NSString *ciKKLbQXYkC = @"GJaTfVlfYbiKFnvRLkCkhCiJREHtdikqVWvNMmtoOuviZfaAnqWkqjCTixaqTGIWFLfonCQUgctvUPyLNoWKwzngswhIIzgWQQmtbYpCxObZXnETkSTD";
	return ciKKLbQXYkC;
}

- (nonnull UIImage *)sKlBeiXPerYC :(nonnull NSString *)kcrSwVNqouUptnliDR :(nonnull NSString *)POYpYhCuzHeLvdAln :(nonnull NSString *)rVinLEAZJqBQQdD {
	NSData *vQixDNHqPgBNP = [@"DZWbZFDQHvINXfypwUMYoJcONTnVnZFFpsEPOOdizoVkhTHJvPurHGhSTPkLhlWqXyoIQVNEGqVTUzRXtQeQrretHggqVEyWQYhQrtqMKtSrTbRJOTXkbEKslocbXAoFiqtnwpSB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YbAmtgXRvzPH = [UIImage imageWithData:vQixDNHqPgBNP];
	YbAmtgXRvzPH = [UIImage imageNamed:@"MGtzqIdKHsZtFlqKNPrZREUevGFRghOHeahputvXHlyiGNsCWmgVKZMblCaUaORIucCHsltAGQFsgQFNWVNkrqDTXmMVdiAjTWXcJAqXWIcw"];
	return YbAmtgXRvzPH;
}

- (nonnull NSString *)eTxhuWuySljNuSFDYj :(nonnull NSArray *)AcBwSwxGCoKxmZShly :(nonnull NSString *)KwKGtjSdTDIQ {
	NSString *vBVWfZrSKtAzfWK = @"FRrRMVcXcxHoCosOZldgtWreqbJpTHHOsEHbwDyphCXzaWzCxRlhILAnQrQqPsbWeVRmgMFMHnYeQaNsyWbcTJWOnssHWImEvIQqDktxxOfJ";
	return vBVWfZrSKtAzfWK;
}

- (nonnull NSDictionary *)vMhAVmrfnfaMLvkpG :(nonnull UIImage *)QCtmpFqvCsKAVDY {
	NSDictionary *FhWuXPtauoqnz = @{
		@"MnylJtLoQk": @"ThXOYDXZHeNZkmFPNmCOQFpcKhORonQbLxklPPkNkvVOBGSnXSsjCVAMDDHmtYpFKqgGwkmelfuFDFIviTEBUOThimgaNKIcMTWlBEoRJaknrrrVdMqYrdSpIDgXLYhO",
		@"hzrGGRbTZoYqcBswhvS": @"fdAPxDWcxLwLOHkXUPUWLTQAEucmiFbeVNVEXvAKHntncKAayUkuyNiNAOjTkWSnHxRQqXMVCTmXvVHtApFZapbErGtzmdiVoWlSgjLyxqaMQhupdqvjIEdiklogUZPwSibEBjHkl",
		@"pNZZAFGVSmuy": @"NpmaEfWCxUXJLIbYaGXZZgiDBOJDlZKREjxvaEvGKbAPzWiGRNNLFqREZpCOkxQujQOfyQcOeDJHMcIQoBkzmOtePwPzpFrqwAIxHZkPmJHkFT",
		@"onBFzZYxNc": @"MNRkmKrStSSAFrgShPdkHuqimOpByYjWhNJkuvrPeStnTselaQPzcwzYDkGEKFsgJlmRdgBQQsoCdzeiYGlNaQdybIAPWhBPjYXNuYOXSDw",
		@"WgdcjYAKUdjxaaKMPl": @"vHNaHAYTMevrbNyYISlDXemAQTQIeJNXFBZvvAtttEJBXTptwcvDEUmpYDeoPEUwHZkPwZVRhLmAgTBgjdNCuVjmJibMsmZugkSnXPyAvrQtlJlxwtvCgrKX",
		@"KkoypqzdVtFeycduGNf": @"ARzNxIMnoZJPWGtYceNlleYQOouokYShXCapJrwYxnKuqSgsnLlFugxAvORTSUQNdEKQyufGBxxIMmRhOKAjndgeQCFWInuOSvHdOtFvNRDRUHbAxKgJiMNVi",
		@"IMlDXVlzkUh": @"jdFkgaBavhUhaYNkPTLdcodSwwppHQGVRtBgKLGqQqyRHZOSBRBpOPMOHmkQBDJfjgRUVVXwhMQZgjDATmSfcWjymgrlxaLPvzLOwDvfGePIXuIxlibOluCynuvqbyoHPghIxOQBXfzke",
		@"sAVZwsvkoZc": @"NcwWCBtEvpQzuiZznPttEAsrDGyBYWOJhoARTGJxPHGfHzwjLjhKBvcJIQSOqQhyBpLYunfVikSVfsjBQcvauOGwkiFypxLnatsMMyPPieDGaUMOXQoMBQslfuysCEyJsTWmuSizGAssUhrIPiTPM",
		@"EbLPIDHxSnwbwAk": @"OjuCYCRFXbpEAqJEAyBjzCfxUaOhpPafuSytcuOkSSXFlBZCHeUbcgTVJOLMRtQPdwlUyazPAVkuJtVHvyjPPVvQxgcwRhITWYCXNqKvyoQdVtUfvmHmHYHOJ",
		@"pjfjLkvwpHWiT": @"vzBbNqiBLkuwepIbnaJIfteAJnkkPlZOEkOKbVuKfCnrNtGFSRQBFkAIbvLUYdbydsyhqkuNBnZxcSWjrIYrQIaWrsYwYRRbpxJMHTmPuFDvHzlTeCFZPbx",
		@"ahyullMOMM": @"lcuGfoKxZLGzyegkFlvkNotvCrANKoUUnSULzXVHrPZUBYgHQPqZzssMDwAnJcQdrccJMnreDvtohfvQOshLytWGGdZmNESrYDPzIuHmJFnoXpkZGqkaHdBBewRffhryvUzSD",
		@"unZVTnLYttKpuCbyYm": @"OnUvtcRwaJzglODgRmXeWAzUvAKTYxuDBHNSlvxLDoTrNJVlWYtZSZEgJCCrJSYBIxLFvhDVeXUxbwlxkBjUHpqlsiUgiQyGephJqkYZUmiVhPdvQZfuKlnwtQkQgbMh",
		@"JRmkbkNXbzElGMm": @"FXmyKmlRuVUptJYcSqvxRIJiVTnapdPkkKmDSuCiFITxuqyrngdYnZwDOasiiBwWAtjfatYsFiePUQFvToOQiWpMRjCrREAnAwanfQSIhEcNiGjdlUQZEBbSVerQbPZEnSosJxMDuEnIWRKAWkor",
		@"sPlYWOKtTJ": @"myTJsMolHFdWyUGGSbchGGNPMUgzSveCtFafYhysGGvEOCjWkfRAIHWvXRYqiCIICKfMzdFYAgzFgraPJVjTmvlijjknVGDZpFxZKIVgggMblJpPgSLpqmrnsgwcIEExhCrvClMSY",
		@"HqnjBIsMRfTOdOCt": @"WmMAOesbTCqtWJNjKeMGaLEXvaOolKyVOmCrMqhENwgxxRMFKIXvcjIQasLZNbfVyFiRKlRhOomvhdULziaUmdeSdAmxQTOFJXIxnVvmuZDdlVvV",
		@"PKJIdZMqlSBQeRRti": @"dZaWQAgztFCSqFYAjfkfSKLCYfPpnGGlWtkCYzcXqPIIrLFYRoMFvuwQqGPxSSvIAeZMLLTfHghsbtbcAUhjnznCIrcAALCgTlTWiHOwfxAiRArcuYzgGYedhMouwoEXy",
		@"PlrbdbdxkYm": @"vlyeTJoiOoMjPAmXjHqmAYTMOXzWweKPiOkZILeFmZAyUQNlZGPihgmytMxCXTsFGyZkOLocAUYUbjmFIVlpSDCkLTdTiCmlrqnJPXFchNLR",
		@"gitVguyvNpBoBtNHgYl": @"TwoExOYIMjCHeamcfKoGOueiPkTnVEiDTPgtkWdehCvgDcpshlylwpNbeUooIZJVrLNdzDiwIYFfHzecVwhQtTSoDOaHLoyNRKCfLxEnpnDOjrUJzfcWRKMNxKJPHsHezJHhmi",
	};
	return FhWuXPtauoqnz;
}

+ (nonnull NSArray *)OpxRpYdqMksAx :(nonnull NSArray *)ygRUBtVkKnrBoRZxhjY :(nonnull NSDictionary *)jDADzWFBxDN :(nonnull NSArray *)dhImJciqmxm {
	NSArray *vgVNmvakJFudxtIG = @[
		@"xvqueQSLCQJVUgJwYMQuaYeLVeMapQEwhFCsVGPuDCmHmWWLexSjgKomvKTvVgZjDblOxBgRVjkgSkdSXdNiLYtxGhLzGYFUQLaBOvaopRQpBFpWKsxWbWvyMsGOagcfNqRhDtClheRcI",
		@"XqofhWyPBWDcPryfUlmhqHnxzinXVKOkIprSPTRaYLDUPQbpqNnsjtneoxCsjDAeTenJUYzhiUMeiJjnUKcCbqWajHxPrrbJVaMbAxAcZAXHHsRTdgOTyIadLbktklx",
		@"BpoJtmDTOFPivHrYnNKFmkstyhxhBPIAVwZLSuBLnuxrIEyrZTAPmrNAAZbcLATQxXuLWuaCArjZEyZdCHBgIQoCBRffoDynziFzBSecAofUCGlSeXxuHRMtlZSNTWMGCogtjapRiqgkdtjLdoke",
		@"WiOsGydvDLHUxLEHGttjWpTgXbeFvSfvXpqmqeiwJSjOXLqOSCAIXhfwdZlDWNBCPEkoAeGuOcJuwzoCAFJMMOUCpQOqGAXgyJXtEtZttngaNIkqXirqnDumxq",
		@"cENAUtohKdNYcbucOPmBhZphvhbDGKkwMGbyuMbALhyvcBamCFOUASNjTXTKXJIcVaIUApcuuqjBzkeyjGVuCpgXsYAyMQmYOPWvWejwGHSukDbDDobuXSLpmNrKKFLxD",
		@"OvmcygBWYkwwGKXfCJKwIxPPtijiNrAYYtjuijOzSDKKAUfsCgBAWetTnXeaCshMgxfByCQMrHxbldqlmcxeIumfLcYDALiGZZdogZwJlyFDnswpTjrfWQTmWQlAvAIrd",
		@"jpUUzbETigWTogAPATLcVOFmWSkKSZJsrIkCUbdBaZqmufqKFiPYAqCijahKcQBjBLOcNrRrNcvceqWJSJXZucREvmzuJFWZrPuzpeEkOHOAYhojPsYpFcpGpuKFmkEeGRzfWTsH",
		@"UuRpGgvvkJBflemTwkzxWmNqtHiYYyZajMbYTKQAqRNBZGyKzIZMQUYZtGonUSeaYhiaFaAFwkQWahLTCIdItWgWQveXaPjJLlwbniiKzaQIIAMoWkDFyUEHUkbAPEtZHVdiRUbFnCjeVLPd",
		@"gUkYNDGeFIXXKgqYzBPlKuhUmqQUvuajhiJmAgwiVCGyUXITjnwcNZyWVYVkvTJaraNZZJkpgOytwztkMqElbrqQINbdCjrnjiEidiXQINJKXhUxYTXYxAYdGhQb",
		@"ovvpwhyImQjoyoPFFaSrEiGheHQHAYpAQTDhCRmRkEDpmiDGeqTBUTrKGtTaWrFTJImUpCosmUadkjDsUtbrKkTaAMXWhRYgMhLdJJariAbmLFxpkXTze",
		@"BUQkSgWSrpXgdaIqVWySZkvfBpjWrrNJwKqiuSdZSPuumlXPrFAnStUKnPLCIMbCcQovxitDcyAvBWYwePqfPVDeSVpvSGNdMZSqgkaFiGlYXNaw",
		@"SyuFdYEJUVsOMgRMaHhWJYLwroNXwYPShuQztdPTGObyNNkcpSbEbjJkYhiRqPWaffjSJkVcuOprgOFUbBSbzDlGKGhXSVjVnclVZfJRbtKCyPFHuhgnmApVRRAfOuN",
		@"uHxRaudsYuvysUpTrCkkaiqQVzCaBgbwhfkKdhdGbukOyUxcTvwONjCTXIMXlErCIwCkOhwYFptnVGiRKMZAEaGWEmfkKfxsTiwlzgjd",
		@"QzOKqabGKNNBhroQnhhjOXBhCoCVlnPKPEKcokVMNYiipVWgNNSrJrzldOdcYRTfOrfOZpTWxyvXXOjaAOJDDbWlCjRQeeZuYXiIiKLBpqGeSkUKylrsohsnsIFpZT",
		@"GsRguHlfBGXQkzFVTJtlljIyBlyHIwGMJuUdofeFsbXNLJGDcXfqhqcTJGfhOLBFfRgkvnTZMCPJbpZwnJWpWkXirMOzkbEEwwzOFZawHhCxIZOFylkbEUwgiRFYJCdocxUZASKjcowbVNUalFp",
		@"fmSeRonmRTxTzocQYPpbOZvOBeouLIHBSsuhecGmrscJtLuvpTbKrwrCUHRIMKJKKnsGIpAAXTHjyMjcjMcZfiBccTaKrNiRHwcWBfXKqXkyYPZlqUEveePJYLuvf",
		@"UGlshWflTzhJuKsltooWsnESvxwXUfbEpfJBFXcFauXUNODQBbPVMmjwBYRwaacjREuuRhIGUyPEMONYKcSKuwlszylwCEjZJaICePvXqEHGCodLYbbOJbbL",
	];
	return vgVNmvakJFudxtIG;
}

- (nonnull NSData *)rUMyRJitCfNTRNQHmh :(nonnull NSData *)WWdZlabktZLGIGPEV :(nonnull UIImage *)wLSRTAwpptNlMcdhdVb :(nonnull NSDictionary *)rwqJKrqsayicVBBxD {
	NSData *DMoDHzxNcHUOpPa = [@"HVGkFDujcKzwKOHBaOeKChspcIgpDfklEgxkDPNtCUShLdeioFBLAFzSnQORYMqwAmudKvKfTBLBbeuOXJOOFrpllsKXaltoGBzEeqEiBovBYS" dataUsingEncoding:NSUTF8StringEncoding];
	return DMoDHzxNcHUOpPa;
}

+ (nonnull NSDictionary *)WeNDtabuSCIwUKELInW :(nonnull UIImage *)jMDALzERjCxDs :(nonnull UIImage *)ynuAYUEzKtxLqbyum {
	NSDictionary *LQRjfxPPNUb = @{
		@"wFmyhqMqGpRrkFfgBtB": @"rCKCoeWwhyLoWLEnlVEUGntEgygKORFHbPlckqolSNrcQwRcaRLEYxNuXBCAdQIiALeiwflcAWCZkorrvlwrZgWBHKkzLpVlTLtzIcuOQXyQUFNENGMSlQrFzKpDMYAYwcMWDDEgGcZZ",
		@"dmhgwXLEWHUCkNC": @"bNDXHlzmnTfRrMfkCauixePnmzEODqfUDpzfgGlZnlJqqyGQGjTbbAoBEuoyThNKLxjxIaeOOnTakaAQsRVUGlPcvUHIYwegLYsLNkzqSUOjRHgEtesbDFRhgqadvlyOadQf",
		@"rnOqEcJjrxVLH": @"CUvhquxdTgimqyydShjSaeixxvNTUEvwnLpNFqtzILhVVkqrFpnuYVEGzqrfcuNwOxYHnTUIyzbflqdTMNIgDTPvgJQEIreSoKHTqYKVAdjcueZhTtdaNGKOrRDNolpi",
		@"xUHdARCKwbGSWvtk": @"RAdFVftZtyTTlkLrgrpqudiXMaXkrluxbbFCQQwXqdbiEiSuesgAhxKfGFkusMzLlJTSNXhhCdALfRTKYqnCXetSPDIfbmeaSIMfBGXfMxaHEeduKNL",
		@"oNZoVZskCXEj": @"izjjrmNUMEMJsNecmsAJnqAxlqUcLbCgLPFpAzWfHNTwyTErBQhxIqVWjDjphtEsbWWAOWLYBcryGgQNLmQBYfgwbWfmHTaQonjGptguNMDnG",
		@"eJlMrfQXnUJkEuqus": @"amEMdSkGQJyZfnvCptXbLVaEDPZGtMjbmaitCuAegasaFVwtBlHYxqiEBQyIjFzJoMMxWfVCcIJQlIyzzDtPqKAaSzHsUOdUbKBwMmDVhhnQwPQTOBrbfdaxaxzdjCS",
		@"OQaPegSIuffAIkK": @"rMWTjjRweaiAZbyTVUWvxopaXPnBzVBnyvwtonIrwmLslmmLqYSTYEekNtzVSxUjGNdATBqLpvqDRlbDctXMhANUuluxUVHwrxCeECxvhGb",
		@"rmpMbzwBwiWuak": @"qGAAYGiYZZQWKtENVJrsYnunonPqAsBwjWRZbjXtZFEyBRwBTPxYehLdyADmgUPvjNqLnTfrsaDwHPizKhXvLqbuxSwfRBacpUMTsQGLAeqcdAXkBJmyEcuvUDvzkdXKhalKfQe",
		@"JkBIuDGpTZHnX": @"PyaMWqeYYebLdTlvItwaMwodrzTLMFKBoeUGnIMBkwgVTfyyvbsJSqzdtofcGBvhslhOJDQSeyEbJHrPUxlbzPWeGWkkPALPNvxsjnKGJuIQYuyOPLKpaZsXAlJLnRjQjcZQRAi",
		@"nMMhHTfhlBImsj": @"XlYxflJEiLVskNZqfxhLmYIfHVFtZMvUyvLpdNuinaKzAEFCNHrnOUCqNNnQqiRYMoZXlvTLUSNDGNXmuBAVMEVmZWWqYuHcYjENCSdmPfjPmpHMFVkqbpxlhLZqhwIrZsiCYidtIiAIKJzmXZ",
		@"kLVGfQfApjTmwk": @"scfdHJlPvpWUqZNoKzXgRYnulmmrsyTrcbfrFcHimNjnUydMLWRuAJfQOaMFhKThjGrzdcXQFejqggZwKneDbJjUKOGXxeaMHRlcbaumrrNkwipvCdzDGnjsVIsLl",
		@"JtEEusyGibGntB": @"WUKlsFFmBWDaISTuMuIlTVtlVscNoHzvJmSxRlsLCaqshFBdOaslaYGcYLAlqRDGvzXySXoqUqaNRMqanHlaynCXhsKnpeQKnIiSHIIzZfOIKRLPUVqhKizqcJfQsaxZMEvSuTykPGqHRguGN",
		@"SomRjIndqtFz": @"sdJXgOhajsqgXQISQIUvfZqmwECXHlVYgqeJWteDVBSfzPgOqYeBOnGnpCyNnBrqcGuXvpYjSkXsAtIGedpUtmSzvdLOCvXaaeMorCcl",
		@"NsyKXOXrjgKR": @"oiupWaqfBHivEvQAswouFyBaBVTQLOwuAWjzNPVxVPWsIpPHLmYRzaPrHOVlhBBmFAUmZsjkZsAZWCMNzOPXbpMtKhuthBoEVAExnzCWkMRSCpOSfyvpVVEMeMWakxqxbBxVNvuInolZm",
		@"etJxiGicrGBkUcv": @"FDfKjGgXPwAvaCwFFVYxfEFVbcYWAAdKSfSVOhdNvgpKxFFLapbqbPUfLvVloseDSGzvcmfMHhfQnaObsQIGMSBJgHptuIUzfKYTBklTzJBsKtcfjHaxvEbcoIqWk",
		@"CCjpbyyLfduo": @"EANYkFFWDxjfwLvvxqcXfgzPcOhlUnfkMLlwlPSOOHOEQWbsYTAKcJSxEXoKEsrCyyxKNkXDorjqzGzCMIKorotJSOlZDAqgksVmSKjxtKiMPEcMhTKbidquczUJtLUceZvWUkuQIGIRP",
		@"RrkOVHhtiQWaWSvbfXV": @"sGCuMUJBsJTAUAvLcqYmknpWwGaGeEfdRZODPRHLFutILtHNEXYCmTIDwBQfwQwlZlZwrnyUzZlYFKxXAJhHaElpVlyUZMTHqvXXkzPoxMEwBQmJLlzpdSvitKGbDQRFwHsEgxzNvoDLb",
	};
	return LQRjfxPPNUb;
}

- (nonnull UIImage *)egbcLwmsAiSwMfYdYvk :(nonnull NSArray *)OrQkFcweXszI {
	NSData *kEVpfPBRYrGtAs = [@"SmlYVhRbAcYdsUNBACHPNJRbwqRaBtvDGRiXOMnkRpOvvWnMjYMuxnnBDtGCSFYEEPWKnPXHZzYgmPpVbULdHALvqvQMFIBocgQYWypgYdpkDGZfaqKhzsLwWTHAyXgyhSdhMYwggwuXzXdNV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FjAHAHnSUqwgQQ = [UIImage imageWithData:kEVpfPBRYrGtAs];
	FjAHAHnSUqwgQQ = [UIImage imageNamed:@"TABKUiRGlKQsAoMgKjFFsFyVpUvcLqhrZTTTdwzNWcVVzkAQQBkkqHOmXSbvhoBsmbxsEniZaOtkpMDZmEwHHnkqDHoGlMFnqTPEQznxXyrByCzUzrDlnoqvHwFFQguRitIglskeTf"];
	return FjAHAHnSUqwgQQ;
}

- (nonnull NSString *)RLQmphPbbFdwIS :(nonnull NSData *)UPOaBPnTsZKuVlvAFw {
	NSString *puQErJVNFyuVGZwVKqQ = @"vborViOgOTHlmVyRKdJjwxILMSurTDLfjoYbJNAHPvqngFvzKRsnxyRYgaoQaZBIsBaAtKGWbUDIIFkSDsMJHdGKKUlvNplLAInxDXXdGodVEYcTjPmgIfsPmQqGtGuthNXokBsEgwiMiZoZe";
	return puQErJVNFyuVGZwVKqQ;
}

- (nonnull NSString *)lbodmlBGePIrVnGWH :(nonnull NSArray *)qBbKPDBdHiRKFbnCoy :(nonnull NSString *)CpdktjGGSFwE {
	NSString *vBdoQDygskiqCoQQ = @"NGtmnDSMtTzhmYatgZYpkEVqqIdeLuiglVlTzMAFuvqkMpjWCnENbGkTzsQKTXRQliyWSfJspPUgXGQrpPPaXxNxRvfwPyxBIAtAlIOKk";
	return vBdoQDygskiqCoQQ;
}

- (nonnull UIImage *)EbNHqVLRUskaHa :(nonnull NSDictionary *)MBHDrrTMiJdIxF :(nonnull NSString *)URTljIlUpSdma {
	NSData *woGODkdEoV = [@"PsOijRayfAZZIGpASBzvffsxwSgFXmyUIdZbXuuxNXZjEHDuVGWvUANlDBHTbyGkgsegqDxkTvMSXoPvbKHRGLhUyeRSnbYTVoREyXDZVYLuZHEGeZyAhHzUJpdMUqseXRGw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OCMlflqcoQydsowTWOb = [UIImage imageWithData:woGODkdEoV];
	OCMlflqcoQydsowTWOb = [UIImage imageNamed:@"TzklBtpZrHyyjcikduoLGANXdpAIrpitKHAoHCzsYMtvCNCvUMMAvjjEcFuhngDEqBNplNWwSzDZTKWWkTmSreoVRNOkSyysdOpCMYykdOuKDZtcDZOUulsrbBnSzbJvwNVjcWQ"];
	return OCMlflqcoQydsowTWOb;
}

- (nonnull NSDictionary *)GRAIGDOXqSnO :(nonnull NSDictionary *)lvToWqjtYLqqZSr :(nonnull NSDictionary *)cjgDZwsNyyvuRax {
	NSDictionary *OpiGlFXdbV = @{
		@"DuuFivxDkAhV": @"ZpMNSylRxbqbhysXlTaEGHbwzcGDWlGjHGJiMTvpKJzpcRpVoQzBVXyfxqJidxFGXopZTOdOYsFJemJZcxuteMMdjOCauCDxJBMxsrbBR",
		@"XiLwDEbgOCYxrJyx": @"suurPxtXsefyDAJLZZOAtjbpyRNtiHfxACPhKJZcwdKPvcCbhiMixVTVIHGFeXyPcxylHsYvRlpvCEhqXnCRfUgaipUwbRnViXTqsVufXWoABsKJMgdEQeDVhzwWosNbTsSxKgsCeJR",
		@"ebbbUZtSTNjVVGp": @"CUabqlLmXPiUSzcwtVKdDjbFpPOndxNoiWxVNkJCDmGWYzWMnaFlEkfeLMSWJjGdzXEEUKQiunkpiWARZJPihxOkxSvCdbUBeNrmhMszHmYfhsbkirzTxKkuNmfkUpTKwVOujjG",
		@"iNjmERLOMJPKcQHWuoh": @"CQoWSLDkFACnETmupDUFpQfOjTyUKOsznGRBSLIbDuYjlvbrTOxrjuklRQnUTlPWCWnioUOqgCRVKUeHgHffSRnMjQlnlYKfZmKzPLwiIjNMWPOugmYI",
		@"tihrjSShDRAMeUBYlQi": @"GQwklMdbplCcYMgiopMqOJXtJgHhRSecOTuzABlkIHdufKEIODVDEmcTaasQdIWRAwIWCYoXNuuAXbXvxVXAINzoPWCeXXbYonYYqQtjskjgwuYveFwSpFRiBlHZ",
		@"BpiflHrkKhHu": @"agZdPQJrZAxpgiYVNOnWtwjuzoggabodwdfDEONXnshMtNRyhKCzXCtfuGrkomNyOYoRykiohdpExzNwyuxMJGkRrijenoHgcXdkDdShseelPuPIOXIaTSIgIhaqOQHfGy",
		@"qsCbliULrWkNUQL": @"SorGYWadFnBPyzuYvjfgBCYpblaFKAORowFufIzUxwAlyBuyQSsjzkHNMmyaPApUfqvmSKlMTIBTKCoTreuLlnRWvgLeYIzSgtNpJNYyrwDM",
		@"NSWjEjSMTIEvp": @"WDsGhVgVNBdGnjPLiIXIgaznWnczwBOLwiwapUOymbOqSENjjTfzArLzXWggYPfwldgYNOcnPBHRxGoHMQxvgVnjGEIAXtaFxBBguEeLUhGSeFcoxzeXUzyNspzzpKvf",
		@"itvYnHgyPvfnvA": @"iCIFtQCczoeDPGjblcegEdNsdTDkpQSIZMcGrOhWPxtnOzuypZTnmmmmXhucnBBDtgOBkzFuWjxaGjuUETQEJyzqeHvRlVyRkFPeCnqICKnKxHuTsOYTygcMzuhOirfMQVDD",
		@"oRvUkCwPESyBscS": @"PBKPVNScJMBPSdXGKwhmgFCeWHAsKRhivFHubTAxrchbitwUinDYIilYvoWOdTnvIfsZWYDqsVHuIczOwdmdfqOWkzGRsERCCpVAWupRZmKbQIjdbXDELeVrkLkes",
		@"aHxRJUTmNbTxNjeYIu": @"ZTNOOflJIPaEpjocMHgEnWtLzpgKFPAIdVUCKyXEkQTQLIJXViloUZeWpLHOAIfDYrBfeWLLYurjYEuVWSecesICakkJUGEyTKIKiYAj",
		@"GRPBuhXtUSniuumZ": @"PKhpVZYdEEEbbOBxujWxtpBRZNVtyvPfoEKRccLSPWwJSnJMeFjmrzhtHbtJQjWIVWWpiTtWlGTipxhECvHavAxGRkycaJfxBigPQJoMhSDuxaoXAQfINcJiJRukXArsWUk",
		@"uXPLuhcXZzv": @"vGsgUvNjMNUsjnJzecsqjlvoeOECzxqNENKNbTFWlxDmRkJcECByfMyHnyvMGUwbbZqwtRKhYRoQoIYQXpBGsfGqyOtlKjErljVDKKCMKBgApqEpbRQitZSACkuVWs",
		@"eFCMDwVYkA": @"eaXrsEObOyNvqMuQOqxyHrJJJfhmWuJwAdkZbULHrDpPDcyTRNHNhRVhnqtpjnZwpodjaJVbGBYUWspHszNFUJglqDaMCNmIKYBoQeIcEj",
		@"RCLwlkGQGUKEgkftgn": @"FlbUgJjNJWOMHCDOucuWAyqtYYWhUllTMGVkFjdOJMwnYWENJmdFvwhKUCAEXbWEtuuncWfefACsjYGbtWKSCfhmymGvzuFpEiDkJLbhcLRwQMtAjvcLbfTfmqeOLs",
		@"wVgdGycjIonE": @"jjRKziMRrWKYXOmXkgWcukxNtLIflcpHEUBezHxhLtKcoyOajZejbTDYzVbqCPtidmitSqMMJWBYPZCDSbxHlkQOsYnBsCsqdMrZsLiJJM",
		@"mCgREdKGpwWWNWvTuve": @"hxdzjoMZUAJUDfdlCFeYUTzUqOdIGMTBayifAoDgEIixNBRQYaxSOUKRZXxFRGuprmrTHTmiNbqgIuRvciNBllhfWmTGApgzJbqva",
		@"xzNdKuQyNWXqhnN": @"eNeswaPWSputQbJXwjrvoefhFCYWYzBMyVjzSECFIciHuZssOucdQdlpaGzbGpdnWsbOurYGLNHQVsyeyrOzoWRwWCoEICdhuKSBYHvaQKeutYCoXjfKvkNRrcpxhMqYnSHObYpckF",
	};
	return OpiGlFXdbV;
}

+ (nonnull NSArray *)BsvWQAuGQwBqCsHwhaR :(nonnull UIImage *)TPdxrRUzrl :(nonnull NSData *)RZFNfnzbEnVHoh :(nonnull NSArray *)yvPCsMDlMGKjesZFKwE {
	NSArray *sFuWBYSTZLCsv = @[
		@"nPlCtpjlNygitdMVpBUCnkkoslyBAAwQDslGGnKMRllphzZrAJlePVQwJkwywIliyQLKsBSpTqfBPAxOdmeovwAfmNBXCBPQfIfTcWWWTpjVBECeKTsrlohmtwHXSNRJNWDAUPJZJlBS",
		@"DsiaGZwomIYauYQlZwGmUgjDwKdcaFlcgWLHysVloUNPDnnJXZasFATDoVnctYbitkbqWvBjSNvrewiWGZThtigtiRWlUPdrEDhukJlrMTiokZwjFxHbYeMxJBHmGGrpqTFhLkTuNTSs",
		@"TzEeHXJDuoBTmIznmvZdHgHwnxojORKIORFzlklRHBKlkbdrQpvUBaXcfeFXRkjxGRnAWvrvnGEqcqrQjUCBDEwQYWLBXQCGBxhlhi",
		@"oArnrWkOlwYNDSQDmdMyXOeEuFGSmEuaYiLipOSLpRForXpzYbcHdmFYsXdFqZqmgMoeYZEnHeyAYqkZHouIouXIEuaQTCcBHAvxYAwEkTmeWDminajWeFEIJRkRWRomRsZ",
		@"STyUlchaEsiVRgJEDoUmvQuEozUYhUWqNkakwMnPabgWKVrJAOYufXaUQlamrBeVEbbULkDqwTIbwNMLYzcfHEzeYKwDtETveiaEjSLTOaAivRbfEQmX",
		@"gEoUKMQHZflLNrQyrbinaJbnjXOCbwTnnUBJIIkgjAtLXIVeRbjsqQvQcwsCJVnJENBfpKsJcwNhMMOXBUYirHvjoloLfNMSSIEmbVOlXZAqSCkqMFrXlsZbChIYHrks",
		@"VBwCUWkULKFRPTZKayqYBuYXkILxPMbrUGqBSYkwpjBvmGkmeklhSZuufbsrhjQiOUcTyTLpDbWoPpQDRcShyiTlfYHAMkqFTswWANoRsdjwusRyFyFiXAAgiSuJYjIbLGUnbbpjmblIroLfYkV",
		@"wkgrOuogkYzedqzoAaDNQrVCsxbPdFpEXkQYjNETRlWhMWNlJmtZUqHWrkjyNHFlxHiLNRjSpLUElHDsPynAQpcyWUGuBSXCJCVfeZSPRkCyDjtNelJXdVmnQZgRAtqaFQtCEEGG",
		@"XVwpXrBJkNmMUNeZZsiRbbLbUntMCMXjppGxqLrWNspScIGecWgqrHXDVmhHDCIqXXXEKvYPqSFfMYXphbgJbCJkUcbMEIacCqDvcysIFqyTuR",
		@"jbNYkmLLjdWZWuYTqdtAtPetXCFtohSdXRyfEqtJgMvYXwCPhRdJAbgWQcBcmLKPFLeAHSmMWRZcgbGcufgLvzXHCuYvQGzLlomBdaTffHKEUPfcxlDXrpVYVgn",
		@"TFTHZOKhzIAzCzAseMhFAyvTGYnvpFRIukPHhIWCQDqFOzdvdlmmxPppFQPymrbPwxXptYIMbwKfFFsCUiTrNCgaQsgDnTOGoCUBZnYNdVrjXrR",
		@"DihcHuRkuhopFuJphpeZfGwbeveWfXUARgtSNTMZKCMZBRsBTsmmlWsYGhYiazwbaBexNBGPJdOcrycsAHWtmELiAHWSWCIQANDkPKHNIoIqLFSgHsHjteOwzhoPSpXwFmyUfRLQTLsywOeVOU",
		@"oqCoNCnqtXhfkBzUloDJNcjgEgmIjALWtaReiREHygoNijZDkfsixNcqacdqvoOiMJTHCvZLNzCtmXFJOqUiZYTFBPzSbFvKpjQcAXTQawMntFMXJKtQfNmhLmFSqdpAwfpW",
		@"XEVmtneWrdfdPHvrtutgeUcjkgqcXNXYlfgVBnoGWNeiftaGPMYdtPORtorMFJvKMSemxCUfAWjgZevYvbYkqtFHwPbsdoCAbVCWyiZ",
	];
	return sFuWBYSTZLCsv;
}

- (nonnull UIImage *)TEJlJFkgYVPpJqCXiKE :(nonnull NSArray *)wgeoDgSkOskhtTH :(nonnull NSDictionary *)pJetQIEdSYwSQjm {
	NSData *VkKyXulRjLQRugv = [@"jWOCkPfHOgZoOJaZLubxmxinPGAYCZWAAuZzSimIifvciutZbCfOJGfYNdHOfoeHSTlYwFfjHZJRYwDelxOafimmxeBaVSxMdsOoLSIMppGRYQUuemVHcxWkRXy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YuTlvcbLzCSPU = [UIImage imageWithData:VkKyXulRjLQRugv];
	YuTlvcbLzCSPU = [UIImage imageNamed:@"NUoRwECJcFIHqFeJlUQUuKmhIgDyaTELQyZWepeRrRfoqlLJrFXzcShvjtyWzrpvgabonAofzmsdWDftBjqwOaKXQNdSOcENowZHwZWJkbWCQqGbyxicDoMVqZHfeWOx"];
	return YuTlvcbLzCSPU;
}

- (nonnull NSData *)eYEQHuESligVg :(nonnull UIImage *)thOKzvKoLinvvxmdgt :(nonnull NSData *)roANfseLqEWbc :(nonnull NSData *)HRtJispQlJwocTSHfH {
	NSData *nQZJOFGxROqXxuma = [@"ABsnrGGvSZtOFqqHLhdzzBHLlPmtsOzvGQgHPESBFUNSKyUkFBkvqUgJLdqiXOQmUNGeUqpTPBnnFzinkhwwBTOGTDSnjgAIoJwNKTFsctZPkQomuHmfKbPhxtCtXKCXrmaWjqdTtlh" dataUsingEncoding:NSUTF8StringEncoding];
	return nQZJOFGxROqXxuma;
}

+ (nonnull NSArray *)YeqWXHDfoM :(nonnull NSData *)eQenMSbDEp :(nonnull UIImage *)HfyZnhsrgTuYbvY :(nonnull NSDictionary *)InuZOZJzpW {
	NSArray *TQqtgvwkXEMJhce = @[
		@"TsdjXQHHbxMSYIyPchDEPnxApEAPDsZTqJnXLtxHjhplEFHYBuVAyTcKiUIcOPgKCcuIpzqAAwZGmDeKEkfDpfneFIjwXDzSrTcXqAGp",
		@"vdfolGAaCUosvluULUGjWwDGaUVYDoseKhBxlIzEFXPqtanSdEDTzJYoWaHjOwnhndwKPCdECHroAGrXuNXHfYMqvgwBTCynWEyYOWNWPhfOrgXEQnzzbUXpsFgcSYDxAUcGvYkktfFuuAURsDt",
		@"BhMIXRTtygjuQzsFvWbQdfZfZTIxtaaNOFZFnUoLbJBJKzaaefGtqVntOCQdGDDpvIfzqIwJwaVrtMHNPAYwVLYqoZAhYzFJdsnYaHH",
		@"hQoAVqiOQfVirfKbLjxRKCgUDGHEcIjnHNfiNTkMMAttEpTSlpMxTNhzYxFRaYPJBAAXhbXrsQNMXtnfWOsTVRWWCGHZYbLHmvhIcaqwoTMedDLi",
		@"dewdxyEjqGwoHrNTLSzeRCHhpVssLQJXKMwogIMtEAAGmXwHBPyxIPudenISYaSltGowSuOJPkxHbHmvMqLkqSMWCPaERdpJSHUObbwRUeDtYAJmeiCACjSHwWyqbKaMWyDVozpGeNKHRfutSzYsk",
		@"CSxvEyQozrTPqBPCRuwWFaYgwFKSVwcFiBboPDOulUvdFAvTMoFyilasQkdxRiEUpdXOtRTDknwAhCiBcppQpcYncYlHKlQWWcaixHHAYMmfoNUWqVJvL",
		@"aGmSgIDMceVIeXnAWuhchuGAQvqmbwnQJREEqtIxqVFATOdsgVSSQKIBWBwhcBAtTnahceiMfrXioWunGkuSCPjWrkYzFKCufYtNJJThVIKJVPvhsUdItDrp",
		@"RsWIZPvKXRiRFIgqaulLqwaQferWjjrKjgbgRyPCWeHCdwnphIKJrSYUnkJZBYFXzwXwxoZdhHCzKSIuNFJwsqUVUEqEjDdQApynIMbjVroWDcnf",
		@"dPazLvtBowyiNQTAdpyAoouhiBtSxeqHixXrIBeaaeTerojjhkYcwjlVODYSgrgGAHxivUZfBeIyFOpktKKxuGpuvkANmNSYzoSDyQTuqLLhHHUZWolGonveLRiXfMRM",
		@"NSbyKrdLgEZEXzwzVcPVTGWmvPqqMcGVckzxhWylDVxXpKaXwWDcSUNpJvDgKLrtgFQNlAqqvgMZIbPAJrAZSfDAdyorzopyWrkpVIMwNusPZA",
		@"rocGQNoLHZNIHzwWdGrRjCMKSVGDRsIpfDcWJUHaDnPIQiUZYUcDgVbpTJcaCynGbsXwlqgWgqsCattRyUGwvvvxnJEwcarCZCVgxakw",
		@"ZACfFHDmCOPzLSrrMXoaXVPfRqToeGKhjbqXmBGHZooAHbRHwbPoQHmdDfRttomZbqscRESxEDDgzCrkiVRpxiXGWssYfFkelVTHKtDtPFfFEKCVCRSHmwIKBuMijLceGSlfQknpLJsAR",
		@"vmaIeVEwzMsesJwtkyyhVCqXSnBBoTaUtivgrpmvOnZMifeBfGrtefogQfAZJnSJcVRyHrlqQRspDcSCCiqrexWyzOCXSpwMRquLTSEVsNMOTZMXjbYzBfgoRkwNsKLQUaCgwC",
	];
	return TQqtgvwkXEMJhce;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.headerView.frame = CGRectMake(mainSpacing + 5.5, 0, 36, 36);
    self.headerView.centerY = self.contentView.height * 0.5;
    self.headerView.layer.cornerRadius = 18;
    self.headerView.layer.masksToBounds = YES;
    self.headerView.backgroundColor = [UIColor redColor];
    
    CGFloat labelW = CGRectGetMaxX(self.headerView.frame) + mainSpacing - 2;
    self.titleLabel.frame = CGRectMake(labelW, self.headerView.y - 1.5, self.contentView.width - labelW, self.contentView.height * 0.6);
    
    self.contentLabel.frame = CGRectMake(self.titleLabel.x, self.titleLabel.height - 3, 0, self.contentView.height * 0.4);

    CGFloat timeW = 100;
    self.timeLabel.frame = CGRectMake(self.contentView.width - timeW - mainSpacing, 0, timeW, self.contentLabel.height);
    self.timeLabel.centerY = self.contentLabel.centerY;
    
    [self.titleLabel sizeToFit];
    [self.contentLabel sizeToFit];
    [self.timeLabel sizeToFit];
    
    self.contentLabel.width = self.timeLabel.x - labelW;

}

- (void)setModel:(MessageModel *)model
{
    _model = model;
    
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:model.headpic] placeholderImage:[UIImage imageNamed:@"headerNormal"]];
    
    self.titleLabel.text = model.title;
    self.timeLabel.text = model.indate;
    
    NSMutableString *contentString = [NSMutableString string];
    if (model.nickname.length > 0) {
        [contentString appendString:[NSString stringWithFormat:@"[%@]",model.nickname]];
    }
    
    if (model.desc.length > 0) {
        [contentString appendString:model.desc];
    }
    
    self.contentLabel.text = contentString;
}

@end
