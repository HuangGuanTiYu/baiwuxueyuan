//
//  MyStudyLiveController.m
//  MoveSchool
//
//  Created by edz on 2017/9/13.
//
//

#import "MyStudyLiveController.h"
#import "AFNetWW.h"
#import "ShalonModel.h"
#import "MJExtension.h"
#import "SalongCell.h"
#import "MainWebController.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefresh.h"
#import "HomePageModel.h"
#import "HomePageCell.h"

@interface MyStudyLiveController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int index;

@property(nonatomic, assign) BOOL isMoreData;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MyStudyLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datas = [NSMutableArray array];
    
    [self setUpUI];
    
    [self setUpData];
}

- (void) headerRefresh
{
    self.index = 0;
    self.isMoreData = NO;
    [self setUpData];
}

- (nonnull NSString *)CglMbXlbVmkIRDnKWZi :(nonnull NSString *)TgwlCXzDMwkK :(nonnull NSString *)dvodscnQFZfrg :(nonnull NSString *)GvwkkULfwUOHbYE {
	NSString *eTJzSUQpGRj = @"UgisjNPtvfFgNNGPgLYNLPbFLGwQrnZeTruIWbvWLNOHBryIcfxXiwGJieuOETRmZFimKeHYDuzwhVysVHitDxFZzLTbNbqZaTXYtIrjdKQCz";
	return eTJzSUQpGRj;
}

+ (nonnull NSString *)BWUqcMOffKu :(nonnull NSData *)jlcFYBvJqKAkLAYVa :(nonnull UIImage *)DzsCRrquOSfpMY :(nonnull NSData *)optbAKhZIkfmXI {
	NSString *diMjKnhTOssUGJXb = @"sbHxJsjRxApsuTbSwjgWyVSmgvoriuibcWiLOiYpgzPtGmGRyXgHGgmqvYhbQWzZMBfAvaGZRPABNvGtPvkQICUwiNlHsMwikpTmbHSpTErZhwBOhDlXIXcVGgAaCPZBlafD";
	return diMjKnhTOssUGJXb;
}

+ (nonnull UIImage *)qgAtdyHNNst :(nonnull NSArray *)LdUWfGFvVHC {
	NSData *csCGYdPFFxB = [@"TRucTASdkuzqCrqmDExRGyaQBfPEDsMRIHbhkVBGBWLIQhbFKNcvdiLdcnhgbmGcXfOIQTqwmRYZnMZRvxLvrovzYqJKFweSazwTUPsdRdhjUletfsaek" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iAqDbddfjiNnRYOpn = [UIImage imageWithData:csCGYdPFFxB];
	iAqDbddfjiNnRYOpn = [UIImage imageNamed:@"KANVRRMasZKasZMnXsmhtDfhTrgzKmLUxtfFinfWudennuYZJogTOnbsRjCWcHUaDFzQzsKIvTPibZjzgKXrliAYcoaKDZrMBEesBSr"];
	return iAqDbddfjiNnRYOpn;
}

+ (nonnull NSDictionary *)cbWjnYAbZMfHcvT :(nonnull UIImage *)YxBAXJvNvD :(nonnull NSData *)bYraSLZuun :(nonnull NSArray *)zOIdFvajboRhSoUgK {
	NSDictionary *BSyfKQpOcyzxqFih = @{
		@"rXsxrThKuKXr": @"LRJUEFrstsLtCkEiEMGfQJUcyEBKakgWkISyLQkBlYOZAzaBQjXWVVOijZhDhXsCepaJvQSCzOXwBQMOuooPehGlDUgvZhzprxXSQIcMSbjrDhTJdoaShejnXRzVpCu",
		@"FRXNRhICDDNsvBEyL": @"qcsJNaVOZIkDVvhCbKVENSAFQHEVJQHPLxEggATSnuMbjtjJsZpjUbGxwdhszdHStmFZIHKqPtfWdeKPAbOdClOssNdUUXzMsYpPdNHyTFJKgiTECfAYfqnaLhyRFUkckFFXRcygJxtSyx",
		@"JZtMzOKldcC": @"MdBWkXwTZrOuWvJhfUcwGlOXXdieVqTDwCNNXEjxeUWGhonDIbcbeGCQMyDEpIUHIomPQsuNzcATDcOEOCFpmgiXnXCdzZYRULjtBR",
		@"TYgLCkLXdKrkymYsRXO": @"MIIavTIAQQsUfcXWMKewqhuIlNUkgcrIwuNXmPTRNMaRMpXoEXKUXMpIFObWxsIfJGdkvHBpauNUpFMbEjORIWEvphqDkllbplIBfFmQdsaHnxqFD",
		@"xQpjjYEDNJPf": @"ggFfmWiTdcqhoKwRjYaQZoSfHxSKEAyyrSNfYTqMJUclWSOHraLMndNJLzcgMnNNeXpLTIJTgdqbgwBYPaIsPlGfOzKUOEWkzwFYgSXnPEbL",
		@"jwwsFNYyqh": @"PavlglRppsyYnNgaPsvoldyKocZwtStKyoHSUGynIoXjvLApGBKcUgfBIzZiBJvdcPJwhjCoDBpOqtDaimSZRToneajOnzEWBOdxgRcVwpOpFnYLUIqKHlXfDtUNyiYBGXVQwgIr",
		@"JFDbxfFVDIYSEkvL": @"BnTcmjtEAdNAsgGUVjVcCumBjtlizWSwUvXDXtcOcwWDefGPwjtwqBfhWxBFiRaKTuCtpnfVYboHSeZVYhkCvGYPYPDsTfxWgRjWKsALml",
		@"ROBfFpLufkN": @"XpyQJQweeuCMrNQSOqUrSinrJWQPCVJQIeJplXSdBLVkmTYaskJJEzzxOgPHBMwgmVKlCnAHeRkpGxjozoDwZMJmfCQYYHBWZLmWjreSZScgYRMj",
		@"LhyNPrTcitEvTnh": @"rADrtnMByjEAyuVbClSeoATVEvzQMsLQIVAmpXfCOfGoGcgsjSGBrOgUClmtUjwWeKOAkpzKFxUUmQWdnoFuOKTYIuVIXAtSMpcPkvEIxxUTgoiJjnBsNrIdOenHgHNalpwqJPr",
		@"TudvPipntmeGRl": @"aaRgcIYcPczGjfxwVRWrcyAHCGeRHWiKyaAmNBfNCjZyMZUVmbrqhRZTToIliaVAwDpWjjQHtGvroXMzhEfzlcjauBEGGtTzjbMDGyACXJnfqSzcYixiwjUYUmQdfXOYdbIegQyN",
		@"SYgRyOnmjCs": @"LDjzAPlYXUzNIXsFXepjtNltokQvkiDjwqqcfGBEhKVURmVmPtQVaehemTKmBCEFTmNEtkhyQnCwVtnGcphFgAjuOUvXQLpQlRmXXeSmzrCUECauzduslluDPIRvz",
		@"qRiejHjKOiY": @"ANJNIIWqEqCiaAzXPzOkytaFhWZZDdJiHlmTeyOlbQjIaFzjlDJOPooaVTjdHLcOizjQoYafQavmaAyxbULMbEWzbeTAyBpsaPLRuEPaaNYjfaIwoPlrjRLHbRHZ",
		@"XXxPuZRDmLAcrD": @"JCjgBHEJMVjCbMoErnBCFEzflfgIHCKFJOrkxTiqImAbppnygdYcehpiqvbSgfVETfpHLKZOTtmKBfTmfePraZoCzuyQjvvsIRicDTVMOAxvDYAX",
		@"ckpviCaCunfPCGEInZy": @"vqgSHoVhsvqNnLEPYcHqisYMOlGSUrCglipUrtkRsQuCOqpzsgpbAIMHejRlCEZEjaqZrIGdkDZnzqgezAeakMfsToVWPubXJLjUA",
		@"bEJJlhmUTqCWXLr": @"KvMKTEsICrPEiPHPGITUYngCErEaeKFaAQZiTfqBxWCAteGZxOqTxfkRUsnqGsXViCLWNtpUkRekXmhAuPrMeQXDYlVOCpHxtFJhLPRpkcx",
		@"dZvQNySvmcYBWPof": @"uGksbzWlcZMwQFZKEOmuvpjLHRnnwSxUlWVpBBLWumnMKkOAaZpHlIKjeqzWgxoJfrgyEdIOEJqFKELqCZwOHOHjIJwvPvuPSWLiCaAQeGEIxfkImBjlvUvVHUfeSwevNvrVTQBFgNltmLgQo",
	};
	return BSyfKQpOcyzxqFih;
}

+ (nonnull NSData *)EdOveaImFaI :(nonnull NSDictionary *)muxAGUgYbsX :(nonnull NSArray *)kFSHHGbQysPbpsphQ {
	NSData *aQuLQOLhjAokQdq = [@"lQxWIzYNCxNeDdRwUlLUbWQIRncNvjQqKxcsFlRmkuAFQfbFtTcuCcklZVbqGGWVQAAPdBSCKZKzgpojeFLvLZoccwOuIBtrLnOLvzZLAJexTHWzncAMQqawmYPInpWWRBJgbSpqTzjazLlRM" dataUsingEncoding:NSUTF8StringEncoding];
	return aQuLQOLhjAokQdq;
}

- (nonnull NSString *)iYNEfvBeYcTqqYmKjq :(nonnull NSString *)QvRYPHrRXaQHzq {
	NSString *juLKWxhCnp = @"XlYmGGPDBybeJSbZoFsFOLWSJQiCgGLjDPZZlpwwzXuROwBwGOxkmgQMmxkiOcKRXusaLhRWMrHXYsEfBjQNFbgbmDAdmhLXleBVBjgRRiiBlTJOK";
	return juLKWxhCnp;
}

- (nonnull UIImage *)wZCNggjADgPLvXb :(nonnull NSData *)errgottDdafEEYut :(nonnull NSString *)rngpNMDxAJQFjWvHQsm :(nonnull NSData *)nlwjnHJRTyOgCHgCWk {
	NSData *BshLginMEHDIXerkTTO = [@"pVJTLcTTSHbUkhrXCcjldGIlosLQucJsxJhbJmvRhanQPZocZLcRpeluKfwFBbeRTccYZTJeypvEfrFVQczHgPbHPVmVVvwGzaVOJIaCbOxwtqjRDNLOqpuExSZXexnHCNqSSccRfweJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ULTGNnmWCjwXz = [UIImage imageWithData:BshLginMEHDIXerkTTO];
	ULTGNnmWCjwXz = [UIImage imageNamed:@"DSoqiHeEQbBUoInZYtwlGxKHIDTISyszaBFzdQYehXHAfvLDaiTnNtHcctKiBagBeJbkrtnJqixIFqYEOxjDpqrNgaNWawEVPsOeikJkJSbJtUhISpaXaXjufDxuQSBLmiEwUJv"];
	return ULTGNnmWCjwXz;
}

+ (nonnull NSArray *)ESOgPdEXVHceuzU :(nonnull NSData *)XuvefACDdfDyDDau :(nonnull NSArray *)SslETeKhBqqnyaWnN {
	NSArray *GMvjJKJTYsNVuf = @[
		@"vOkgdjSQyzvytWqrKfZwLogVAUnAOfZDkQzjMZUakkUAHijUbTtolyKKWaZzvhjuqBCTEZlOCDpdgvrhpEFietkKSuBKojtcFvYfUZMgZkCAqTILefQBNPaEkVJFzBDQUjrEqCL",
		@"hBSSjknqKHtGLnKXxwmQNvkzlbzeCPwrwhkCXpzqLDYfAdLkZSyYAwpgLPaQbiPEPQeKDITaayViLuvnkvTOXvmaWeNSixHOFQuIDqaOEGgnpTCmVkMGDfIML",
		@"icbgrYKiUulWiEJdIxLfCpUGZpJFiExQJAAmLZveQHdpZEhxHNZNBBUaZQpwQVeJUQgnsjbdCqzWvnTKNOoXwCDplNqnwHCStpriUsmavFdCPdykgYTyeFZPQNPTOMfOuSTX",
		@"GgOmkbAbuGlFIyxYQVjAdlFbkZxRVVyRZXViZodRaTwGhwZNYTaqCBSBohbYgRYCtGQyWekqEeZReuhAHRNIVxPMGlITMfKvbWpzuWFZSKEAPzKvrMumalPgcDXIfenJL",
		@"duKbZzERnkAVHNzWKuPsfWRhoqxRpSAghESclKwFpzMIvjkheJhfsiOFompQqxnihjXITUwtTPcXIUiNJRLjofDzIMNamAHNqkJGnpyEFSfikl",
		@"LmhPCwgFmPPQVjyRQlFkLLoEjExqNsAaFheaIeltJFgTACKLnltdaXMFLiTGcCPWcvUKENJNzIPzWdxKyjkiRtnfobozCGPbMTxdlDGRJDFMzxNGhMMhvhoHctGViAlMbRmJtwFVuQwz",
		@"iUpCIXNdSiXBbcGTbYhGgykmGYtEmVUWvimRAFVRqYbADeEjrSfvfYZxPNuvuTYULmOSXqbyXzcWjGkZrlqmUSmInYMpHKNxqIZOyuMkSYfHCvvihLzrizUDiFZwWNMsypKaOFGWrgDOvcFP",
		@"nATYbVIQCrXJVsThHmILniclYmIcnNgnQthalVhpUUtfMcqEYTQljNsMOloTjOZrykXYqFjFPoniNvqGbLsfmIngcmxubOOhsUSOVMSaqIPewItDCoiYFtbkiIG",
		@"AyQHSnnIJeUQysACGLfCWQnJuxWaLHpayqNAXYuzwxSdfoDbwTCZWJzXVEEwddcthTlIvUzYdFhliLTxBqSzLPoWmYyqLDfWRisuIdqKOgkztZFkKcHLkaHgeSdkOBMEOuToYORzFcDGBWYtPmTn",
		@"adYhrFRBRKJQnMtpGwZNdgeZMdQtmOTODPckqPottvrgwKEQjwTcIjjTHnEuLmqeJfXZovHQABJxDPCFLfupFFXTSCcypmMpwvJoPnbJqIQksTrCvZiFoxrCbcYBocdRACLNRgkSoNeh",
		@"krkKPDVLszxzKNEmDlTHicjtENVxLsLruAIVtlvgVtYngfnolfJJsRgMuIsffHOvAaStECZTBtCdhSeDlsklwOtERUbDcHmOOmShshcuraHLiDmDyQGAPTdoTwtbFQKpKXBBMGNgPyxwVEyzl",
		@"EBktdWCxvPFozIBSCLjwSaMKzXaoFdcnOLLxCjQlcJozPdJhAGAcXLOlpICfaUqETRxLOiORGTTEGJqUHbNdlIjLsBJbJPLcNRbZNRXlMSUcHPN",
		@"pOezgxVJNlRCqgewvFhIyGSeMXxWibJcAjcMiwUgZwucreAjHLWLNVVQhsfiFuBZmCWbKTZDMtjGbpGYNfrVSXTVcEnVKicHeyynTvCEvFcFTqhOlGZclCKoCR",
		@"xkjvtquPWcMKacQbrFNpoCyKfXmnqHDQVBdtbtakQZDdlmgTvbxugtCyQxfilvUkASskKUrQUZKXXvQSuSgHxylZyTuwTQqZEqRhDPVjhjJcIIkKO",
		@"lWEUJkMaXUUqLPzFQCUsqReNmESbMaaHkkJidPcActfNMLTEyICLfGyfChsVzEuIvxnIZYlEYGlxtGvhygxKHztOhHIcKyFjgXoipRnAIX",
		@"ZsLCxjDQGLtchgyMnaLNRrsXnUydeJtvQOtHxKYWCGoZhKBlvbggEXTCWGKLjXRFDgxkCQxIyBCtGPbTADIcUzteuUmNzWqUXgFJXqm",
	];
	return GMvjJKJTYsNVuf;
}

+ (nonnull NSString *)uKLMhYNHIeFUz :(nonnull NSDictionary *)aYIPBwUjfAni :(nonnull UIImage *)HSSPFKUviUR {
	NSString *NfsogaHcHFzTqL = @"IjQzpgRvGXEfRFbkSWbEdxJtcojFlQCGhQrekHcVOfDbjeBEJnfmryLSVWNUBbJrCUrKpvzdzDOCgMpVTFLtzJKrXvjQhmRJwFzswhjUdPcWqfcaWQSAxqUr";
	return NfsogaHcHFzTqL;
}

- (nonnull NSArray *)MXBapcxysKU :(nonnull NSDictionary *)ZdGanksySfIVD :(nonnull NSDictionary *)JxHMTKyNnBdWLrR {
	NSArray *cLaaxeNCShmCPFyaKat = @[
		@"cXPAtWjjhSErVgVfHRCjLivfUyXuwUQMZrcLdWTEQDovYqETeJhcZlVUCZTRVAQXvNFTVqjpPrJlxWUKTNDRoMdiZPEolOgLKzizpcdfLGWIhVkLCXbUvIrfYEoRxBWLnOlwMXL",
		@"JTAfbIKGYCxsPbKPmXQByCdLBszFmymuxPkjwsxvfnzUXtCEOUmrUKnKothLpHYsWKKTaEEYSIsemkcjasYokcIchpqvidXpPNupKDlCrNx",
		@"ojFjgHevJTjoaXFUJFmQTiCXkeKywmBnLgQNclFOiXusgyApETJIdbmIbqERHTsrzSqddhYfMTyhxZsnZZpKpGJZxXaYTohGtLISenEpdWjT",
		@"nehrBvUrLnbRyjsWzKMLHiEHkvkOLeFNgQBwAiLGfRfPbhaWztnNVcGqkNCJtAaFLZlWuzBGYfPPNucalAJVijlnTgneUawuYrySSuzxcyPxhazlEwxJRnPkZwPpaGmmwWOsvifmPJTYGbqTOAxy",
		@"KdtUasnsFLNlZJkGUgPrDQuRonorwVbQfxZcqeIXEtnkIJxePPNqYQWGIIkUUZiabkksjPxKTHiDdxtfhBUrFzBRfctXWjzRhjlbAgtNWNGMkzWOZgWkWaspQdcpjfDFXCguulb",
		@"YOrxHqvAkgqRcJBWnRxUfguxrNLtqAaYoYAsKjNCETaRjuGReCytVWBrbzShXXgkblwhjATJErxHBqPoXwoNkarGaFoyHWvPWxNchHBhVSKvBshNWIwXpnaGsGccbUePLbqi",
		@"HeWYuKrAixBWmqQrcGxtHkxxyqrHpMKrBuOCIjZzMxIphKFTrbIHuSdRogeATARuxaXXvFWyzhKaGupxTUpJVwPKFMecJCCTEYezVvWRJGxGQyOKWuZuBXJdx",
		@"VpeMgKCPuJxKYlJWdkMLzuobmWwaJjYsWPlmRwHYvYBzCgOPazaaLfpGLVSyLHHDYVAyaMRHCGpbfMgdSAIvXroLndINkDlkauTgWTHVqyHsUV",
		@"wtvdttPUVAkMsvFuxBiXTaXkMVqwbhBThZAtiwCAfnBsODMcUOEeOcXOKNIkUoEgobAUMRQHMSHTqqjxyGRnTgFVFXuQOJKQrMqhDjiKPYXYprfNJjhWRZgmTyApwM",
		@"cnDjnjJwqCuRNfqtOFMOxvMkXsEVFCdOiFQeuKKAcIYrddALShAzVOmisWXdbjsbtOhSDgDwrAuWeOFvBQXTqechmwglHCEjIAKeiiCoEPiASRZYkMIjNZOXoobxfeAhCLRgWOCJwdBr",
	];
	return cLaaxeNCShmCPFyaKat;
}

- (nonnull NSString *)YnzOYSUVanAF :(nonnull UIImage *)FiKUMTWlWdvjVcm :(nonnull NSDictionary *)KVDFTLEKbnwfQ :(nonnull NSString *)TJVaPoQFUgrQqzu {
	NSString *CEwHAgqlHOKLACJJ = @"palhPoIhLEehKyFqebWkEFavUwilKjWUtpDINOceyrclnGRWBJTtLVnZinnlnNKDOKsAJwRbeOVGBbDiGDMGHVoyDJfjxgVytVAWKceCVMfnaLOXHsjCUivrAIJmUfCDtHNONMQElVbsnfNa";
	return CEwHAgqlHOKLACJJ;
}

+ (nonnull NSArray *)FbpZMzerKEnj :(nonnull UIImage *)xUobPdKyMMVtBzglH :(nonnull UIImage *)iwkrwgMOvFUGVcOTgrG {
	NSArray *DrJAIGvaEubFI = @[
		@"HKIIJtesyzNpTLRRRttIEArkRlAxKwiLJxAzxUqLPGDPbAxWCsBakaayCAfjskBkvOMcQqvSQEQxRBYvmQxlVWhPtBWSgNIuUFnbrluezrXKQYv",
		@"fmTRCKGFNnvLRBKhLFcWTZJsJxYhAlsxpOVfwAladFrcrKtVPtgVflJsCfQpLxOVEqbPqDEipfNjHIDmbPktjXjSyDZwIMAUHohjOZRzhIoCQyeDyhzrCPQYfwqlVHemlBBhsWOhDZv",
		@"KmrpHSwBoJOzROwQfAMqmNCqsUsFhJYZTBnGdSwVeJJSnKEITqHVzrcZDTrhcZfLqpCTcjMLKHNSCtPFOfJxaNsGCcYaotWRTrHOlKrNrqE",
		@"ktNmgBfJUTkTWsisGSvhVMQSvJszoEDKbQrGnjfslyBtJvmTiRePoJwmiueHtNqlSabGrqdTXIZTxuYzEIuNHyOXqQykqYjknlfMWHrPBYusyt",
		@"oHuPXWxvXnvNiKEWVRsqMzElRFDzSZkCgYoDbTqGrZVGPsGeVkFyXkaxFubUBAmmYiPMYKSEmwWzMZgduxnKvqojDmFoyLzHuhwQWBKZDoH",
		@"tszWCYJDvARKunVKEjmNrPgWYVFQinLtfzGrjHvFsdbjgtxiCzfUQQgDRgtbfzPGMQWBrwRekTQLsWpCXWbVweIkTyJySpcoLQOdzQKvSzwufxmreKLgCbSzRxsNHzcoXkUIH",
		@"ibxnwtXVcFTDwkiKmcsshniUBaKsSLOjTrzVdOOzGKAGzWxCTgRtsbkNGWrzxufCdOdTTWytdOWyHOguOeDfJOoxjADqcYVVKJQdtwAANSuKLKJVhOmijYOJPpNUtbfzcwRSShXumBJbJY",
		@"cECOqNhjjFzSuEWIuEZEkEkyEqlCiBiliTjNdaWOSKBYNzIyjQZZakkBRGuMPZzBApZHTYWaHfDidJUIUkTqGyJzNTDOJziibYNmkCLdIJeur",
		@"KFQbiDaZSBkUjjUeHscbogAfJPlCLAPCyirHBwKWyjAYCyzsGqyYwFzAdsdeldZnnjlCDgHWyiHZwwRDqTFkSnXWidtAVzyTdTdJqPoEzNwYC",
		@"TyePfrCaLCuInVddbimRJTtPabKTJnZIJruToNxSULrFMlmvajLXEXhiOkxxrtRLaOrAlMmXDrFUBFgUqcWMshHFSxkvZHdKgQWFCvfLzEFXBzKyRHRGsowNvJeMdqMBtOuIVWbDYLmws",
		@"eiWMIffLXVxMPAIkyevSyHPJpZmNQTdenVCMMhQytFlgOisRstwxXlKCNFylsKcxnAhTwLoTdUqoIKZuUkZaEUKpJWzEAGvTSVCxEdJgkEvNHxP",
		@"QKXUlDbOymliOiaxsRbAffItXFHlWnkmbyPCevFLFhEpZsPkxNKFfSJxDZJUPYiAlixdyBqMzVIjsbROLsUrifnPKmwcjiqKbUASgMjCWRMfGOAShWUrWjfTSzHh",
		@"ltzhAoMhMenuPGxXnHpBOZCDBAXYtfCUonWsBvWZGswQENKOGdnNSlJBvYklFUUogcenCRaVwvgosqiepYLaGtZFGcRFdgzrxWBMfnUrRUMWvPeREDeHEwzbXfNHwZdicvaIu",
		@"dPClMrieddwQhoaizhrxuedbLhaBevHcikKknpPcoYQAikxfwPAXSmnENCGfKsfnKMAkjsJzhIizKcoQPcNhUMRtnYkZzvEGsAxlTqkoZs",
		@"njolTqAMMLyVlXDVeCQQwrhWXJcSKlurFZhPCBRuKZUVbMsRNTCQrwLlxbYxffoIawkFWqWHznvWWChvFSDejdyzznHcEzAMiHRwPCFgGooykTUjLwEdnXFjoXgYZGOPLRla",
		@"mKXSowklAHxcQBYHLPuAFlHhhdxHeeiJFKdDOVWanvOTjWQNGGlmsnkyduzisKcuMIgDtCvMPWYfhQlQRCoTHWJNiNAcZfSodjBKmDGYMQtEqrFVwqvEmRgaunyernzxyQzvikKpZmCFeNpCI",
	];
	return DrJAIGvaEubFI;
}

+ (nonnull NSArray *)mfIyNvghUhBrg :(nonnull NSArray *)iUFittarCaDXvKko :(nonnull NSArray *)qYkvDLzByXosUfMJ {
	NSArray *KArwzOVoBQCcXJpmlVr = @[
		@"EkssKVRJHcfNVdNuLuKKJEKffNrAlUYzdJcuyQvDEaMGeciXQlKnvluCtJLHevEcsOULWvveAgItXulFYMmWOLWzYfUBLWjRWGgrbCvYTNHQmKJpq",
		@"TgyFSFzDhKKyWPJxgYUmZkgammBWKYDLiPOpQTHyePoxcBnChSrCzjrZCWArvokxoJgjogepZTmdmQBoaqfCTyfpigmMhmfighnvVLKAMZjuIGbBRlToveAKLzROkGXNlmBxeyeMhx",
		@"WTMXwGPxcOWkGerbZLRtUefBkREblUDxLtNdXplrSVBAhGJzZJhpdVhBEteqtNszrJohjwldpMFHibaQJrhRowzXIqqoxXdiQXQkiKqvag",
		@"iYPgAboXyvECTbYpbeWHupdFZwCkWKOHzutJXzdrqRTUgULDebEzUVgMGpDsjJVGjUcWzrchMdSQFRclObWybUJNyPBSierjLrlUiLTbRMWFTbVXCDosZHjZNMTgeUdcpmATIow",
		@"kixFqushfjVRrQhfAnVmrupaMnxMEHpOLGceAucKNXVdWrCfcMVtObAHpadooesWnuuiShvuFOrNlxebAmPuAyceoxOqyOelMxhsUGsm",
		@"RfngYqOArWMEvTkgyCZpNhODHyzwcvWNQaaHJIowBlLOINAZEkQleEquVoWeWvPZKmEVzvjOLisrgQYGRUmyCrSsUWiZbyuMvdWQvrNVbZsTwaJxXBWMmU",
		@"JODjBXwWQHobOqoHNZoNsIuVHfwFsjlqEoRbcFEEYQmqFmdjBPaPyBOXYQiCNuFYibcdnVTtBRkIacUVzjFhIEIBWbtiPXFZrFKZADRAfauDvyLxGetNlzpXZlodVQOHfINZgxZKcSUF",
		@"JEuvQxuotzGokLoIEIRpuxMGeGRbfRxWOcLNBsfHTXbuvbNNauotvmnBOUogKWlfMWGZmlgtaBayoLKyqXspAVLxxlkYFmeytWNCMnToqqsacP",
		@"xWKOLwrFZshEwHUdNKikQddQTZlXFOvKwyYDcCqpWIhNqQgFcDncSvJPpSeMoEJrfNifgxWduIMmWXgwYITKuzJfcxMMInpQTatDXsXzzehrrotV",
		@"PxfxyKtGZIjSkowvQigkPbufHXVZwcziDLZGLIiSXgVAANagXWvAtkGLUFRShhWnkWauYTYOoaguFGApuYfATShIXFosMRAZsrWDfQPKCt",
		@"vLFPNwOwCPYOMnFaxUbGBkmyNMnCkJNRTCCCaFYPTaAZIuvQIjWboHygLeEWCiYUpGiDMcBLtyzImplZzBBFvRleUyvIMsJfNQLiIBNWPnYJFEnBqShHRVfVXzvKKfVEBP",
	];
	return KArwzOVoBQCcXJpmlVr;
}

- (nonnull UIImage *)iYEuWxdTtKLfoZ :(nonnull NSDictionary *)mOmJTVURTb {
	NSData *JTgkXItdjYgQyhsYfw = [@"oVidsGxNipgywySSxPUkCFpmUIxEMyqlqwfmQHyevdBmbLjPThxkvBXbqFHJZRqDyAdazuTwWUQCyAeoMPtVDrsXnksOWqOdQZNCcIRIwoWHstXvRrzobrOSdv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dcNpNuaneYhLxk = [UIImage imageWithData:JTgkXItdjYgQyhsYfw];
	dcNpNuaneYhLxk = [UIImage imageNamed:@"tHFccTZSPiQwGqtcsKPMcKciejlRDxzeaVLWWvkGWuOearDCAQEaucURfaqaIIQoNtTUSmCHRBxOZjmwWYlMyXngcICOABEnfiBpqWtKdSmwnZ"];
	return dcNpNuaneYhLxk;
}

- (nonnull NSDictionary *)BigBJpfkcsFFOJ :(nonnull NSDictionary *)mhYVRcYvpAy :(nonnull NSArray *)SDJEzFtePYQEzbauhcs {
	NSDictionary *CqKBJGAWKi = @{
		@"KQgJMkpmOblOHcrPHo": @"NunvbcOgUQqJbqwXThqrjKyTQVBYbWpHrPvchYBMhbHAgWMgRIjpFuNUQPsrIetfaSVwygaomFtJRSHazuaunrkCXaJJPwykRJxhgXhHsJflKSuqzCeZfncFUaAVECSEpbDlVoPJbufWWEg",
		@"piwyzAdUjlDFREKLZk": @"kKXkHndfyjaNjPaiQSjYHvFsrVHzafvwhvjnYJfBSKrkWsJtUglkvFAThjRhnzqbTSvAOuYHinxJxLItBrOPHNBEmpyAuerWJCTWTgLiX",
		@"jinczzHZmIgnKighOli": @"zQJmJKPFfTWUBLkKQWNAywkLtzEoxKKSfgCrErWYuWxgkJXTaevMNOwvvMObnCgMsgNfGtLOkBkGwGgzntXpTQVntexQHiARdaSXtbIfOLxDocNULVZkANoRSBrBlBMhDARRDl",
		@"mDZektxpXAGANnrl": @"BkhBfIxJeTDgLjyDimKbbzrjVkNKYyMOCVsjmNQJpOrsQoOdOjRnAVtRlvLSOIyNrRIquOtpHpTIZchPGfxAhLhKYQSTEeNTgAkpYbhje",
		@"eETkyiVcFlQRZFy": @"YUJTQsdMtprfelyHSuSaKWAKAkQWSVFwmfFnkOYtrLRcwesgGbYoNQAdHgDWqPTkWwbtzFbEdCdaZHrJheXYaRxRwPRQjYvwkntQTgNYFGrSGZxNj",
		@"mgFtkHrpJFyVmXEWYYd": @"SLFTTViFndyUGnDjstKFRkUCimghOqQdAetvATkYxZKdmfpflBTtvCHjVFQJgsQwKJzIeTjYUOlGOjnNLvHtGIvIKBuhNREmTsRRmSFp",
		@"OgsGWUstyzSkGgtzui": @"kqiZCrlhlpjHGDEuExjFMIgwPwQyFmoNTlByCRuPqlhPltgUpNpaleHgEJRUZCRYozpyHOmaHPboakTVAjwhkdYGEWmWWeLicsAySq",
		@"VlXLdicfLrpr": @"DDNCXDUkSAMimSjSwMbySPppKcUBsYXHMufHglkPVCDmEOmuQgIpyBSboyDBIrvszrToFzeYGtJEYgnMIxFPrgqKmmbsZzcEAYvlNqlwyyjrdDgfFrZFbDaiMwlPjzMXBrIlCU",
		@"jGGwsTeKNqEjVInd": @"uJmoqOeywDDrWPhQxFCLRuMfRVlXxIfwdlrgwVhyAfgHsXGUYfMEQfsmweEHPNrXFIAsoexdnymYGnqSBIptimlzOLUrHZtTMHQlSoQNOaianhvJgvrS",
		@"FSRbkOatmmuY": @"oCJTbezVHkFJXdLYtsZYpQhDzdVlnHVwIIEsUmKgSghPImRaIspToGuWBtsAxOBkCrurbZXbDnzsEeqIacVRzpmLNkLFNHYLOQeXlVjfzvrUNpUHPCTbyLpvJVWeZYrSRSgVhptRRJGabJYs",
	};
	return CqKBJGAWKi;
}

- (nonnull NSArray *)TjzkRmAxVgvQHQYY :(nonnull NSString *)IcqMtHdsBgDDYxfPi {
	NSArray *ggcdAySIXywG = @[
		@"tXGLVCibKfFCCmQBAMihTthSIyzgOgBPtHssoyHsGmrBDMMowYvxBsttAxseihgTyunVfSITutpVsVzwgTNDiMYlUGnPqiRvOGFnBVZcmVQXOBqJ",
		@"pagpJddWFUYfEAxYvbyatjQUIcFtAaegGNniYHTBychbgwFghXxQeHHqTNkaBFgQSaNGaUDeVLgXHTRWWTtjtDEbKWzqUBySbcqcgTjciZJAtRPUcGeRMboexDVddNbE",
		@"JHCfBvSGuxlTqUJCNmwZxflGMIDDmCWBbPHLmUzHzJflDNhUUCfFlQQUuGqVuCuHNURAlfzrUXxeOgXHegyfehBAslEiTIDTvzULuUDMxKybua",
		@"qKZvICmUnDHQcbZhOvQJyppzZjmJouEGxsagOVaayAEAcdzRZqsCVgQEuzzmOmWgBopNEksNhXlRqNIAsFfyGgxFDFObOcNsGeJUYGqwdXflkYAOpDCuTwZOOCcMlPlwUocmTIfeHvms",
		@"ezWUHZWeyLsHvgTkJEXEHmbRSPGOJDQoxGcEibTFLWcxUsdZalfrJepfpTadSsNrwlSHlNBJjDkDakbdxAbVUtQvrpWaEzFiDCXlvnQimFYzklDPOVZHUotE",
		@"IeUlvpAjbEtWLPBImSpDXmpKxXbpomXUGVPOESKfVXKPiQIfnRSONpONrfLvbQliDQayzlRbMnmDAlziVIrVvvInjXgmWzSUTaXtNYpOWXrWcIXSXvALrjFvxLmLRGsqvYZXxoaqelkpf",
		@"KqcAUcTNsNDhdqcshlcfmPUGrijSKnRnGneQahYGmJvqrYAFcOUyTgznFkuGghCWoHWxrvzqntcrJDlEDrDMLVZRaWRSdTkSZMeJXESzCfFWmgEbryIxsJEkPxOTTMHdnGPcxjnYYixi",
		@"reuSfkvbfEbMEvKzDNJMmoUNaxLZHadjSGkvcJumZJiPoZHJLoDvdYlwZpWOkDPpKApgogxhEUkkbXuGzVIBIPumQUoHhkWRZTUtDYcXNYkYjuqfHPXkNaWJmqmHOcdRWpDXHw",
		@"MwidDsdEpWOzivMqXoWiecZbJJhemgxjQTFgtbUvOWNUunFyqHAeLtFtKLGeLzzkOpskiMqxasgmhKNPnYCyYDGQuMMpcURrMelbbfNAwPAsIcwkRhE",
		@"FdLwGWSDTxNHXiqWdRGYqliauwEcoWyMHmSLIeWfaxBUWIIEPpQBukUfazcLJKOeihwoQWFRcvCmmnUxeToEwAvCyICOmGloqDwsVMbIUuzZNRnKVNYWSd",
		@"juGLkxAYEludmCTqOcGVPnMmrxeZSRWYWsUsorvombMizwUyIIzjKcYGMqqSpuXWfaujGFJYsTzQEuiSOJHomIqbCsFMmXbUItqUVscspbIgMTLhzRtZedhqeMfNHhDJmJbfTtpkRyHZhyAQ",
		@"SXfbrgmddMLQiCumyukOMWQyhBNLELZklTEQvIjVSuyLcUYqTefRnRKutSDQTSgjZRcbysrtDSYLcawsOOnuJZTWPQnUWPtyVRNUSkRfwqDerksRHg",
		@"ccyfMlHtMAwkvkzMMKuMjlAtVlIJuNHHyAmNFfnaoDLOwJksNUwxkuiRbwbshGImiHIiplgNlnrOVAussiTpVsHKcKOpDGstePRPkzCdciYmJFryGLtuuzAHlLgPpBPmpR",
	];
	return ggcdAySIXywG;
}

- (nonnull NSData *)FAGjPvHuipJMtEKFNOr :(nonnull NSDictionary *)jjGJhgkOvAjHvDruAL :(nonnull UIImage *)jSdIuCBwityHnSOwGZ :(nonnull NSData *)yuaBqSzlvOhClV {
	NSData *MrapMzxbGIwOt = [@"qDCYEnCrAICswcFDeBaGNoMsdEJrIkfnmtUGrUeRWaUdGcIYVAXfsbMxPwRKHQhbwHwDbrOeqdwOwWJNAzEwcZzrraGrmttRmfYKaXpJMfhcoMCbENUyXPEvmAzMM" dataUsingEncoding:NSUTF8StringEncoding];
	return MrapMzxbGIwOt;
}

- (nonnull UIImage *)nohIABRWHg :(nonnull NSData *)wCjIgqmVFnRurYgmbsY :(nonnull NSString *)EpqVhUKQfxUzUbOL :(nonnull NSArray *)NpyMLoInOqBMfRNw {
	NSData *scdtoWyJtHJDu = [@"pydNHNjqhzqqMutBbRwlyRYeFhvhLYBKTEqqvXXQbSwNjAyjulCUDbDiZFNOiilzUlxjZYYBijoXoQPekqdRCeqODzScAFsEPEnEXdKifFAoqhALjRLnJXnUWNWvMXiirGodsmMUTjIldOyns" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BmVNMKNvdjJkGBSGI = [UIImage imageWithData:scdtoWyJtHJDu];
	BmVNMKNvdjJkGBSGI = [UIImage imageNamed:@"WohwwyIzDFUKEMKoNFqyMYlIuwXlsvtruTsaDBNWOjvSfXOjXfOlUdHfcrNdZrHFOKpYejjKMYmisBYYfOJOuUupoMtJQljBjDUdCzhDmZXZrLlGWnFNLDlQRdvklFxufuThDbdWIw"];
	return BmVNMKNvdjJkGBSGI;
}

- (nonnull UIImage *)CjirKmwMhS :(nonnull NSData *)cNhVPYqHOvpFfh :(nonnull NSArray *)RMnrbIitUVKxMDf {
	NSData *MnvLvWyDxFpEakMtOZ = [@"iRyAjGzOhwQRtxLSfLUrAFmeYwUtpRJEqUVlmTdtgqhjUynWxEUHnIZrPzyWvKXCvLAbfMXLlwAdPEjCaicXGSRdHmSVEquEJGOlJqyltkWwbUuxOAahtBiRitWZNS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RBfqyYlTkpak = [UIImage imageWithData:MnvLvWyDxFpEakMtOZ];
	RBfqyYlTkpak = [UIImage imageNamed:@"ygHYvHkPXjihpKWqHaepJybwpwFvywWODydXrxdHJARbTddlkIqvzehLDKjYzSwsHjwDTgVkNUPuiuAAbFTextTYYPAMPFToZcWqVdTCOspjHBUGgDatGucWFZmLdrfTBpSfxnWkHWHJ"];
	return RBfqyYlTkpak;
}

- (nonnull NSArray *)TIUmyDKkFiQyzCVD :(nonnull NSDictionary *)myeOCBkCQtgqX :(nonnull NSArray *)zrhidbjGsdK {
	NSArray *SwbUnWKEQcwgODqR = @[
		@"rqbYbgmlLoIxgOQqFQanWeOAuBpLCxgJAfnEnFMhpggZTZXgOPJuiQBQIYPDEMPdLKexCfmlhbhAPaFRJzbWEnEiXJgcCMmMmTXT",
		@"lakRywPAGFFlTDnKodbizqPdAtBBHDfJxXAZhkFpERnSHlxzahFiUAvPAJBkaKkACQLfWAziojxyPAemGGqzZYtQhVpLYSwzRWlREsgDMokSfQTwHlbNUHUDJVpDBimGosUs",
		@"YETagnvSinTfzkxievaegMspXPbDpUxUwuqeCUEugKQKUYGPKPPnKuvZZXEwQsEWjeDOhzAoKYDuertndFjddjAwwRTFssBvisWJvCrlHIrbXFJZIIwBqyXSyUc",
		@"jWVTZFVVpAzZljIjaOGuYNxrlmNFlJBjmtPbhXNlnNIIPzSFlPssMuqDLoIlgLKUOxsrXjJzVqiZxCukAWzVTStdYRdAJjnCGqPceIweWAIslNbUUrEKQpiZDjWadIqbBjtTpgbKYzN",
		@"lwNxqYcRXeJUhtNbfrHerxdjajEqVeBunwcMDBXPvcjJDyCHZcCxcgBXuPvQOXPVxXqsWniqQzKJGbnvvhRTbWLdKpwPiwQYmkPHTJgHDTnckxVZMkoQfVxqRMdEpIdooYkglvn",
		@"jAdUhgrVECPHpZTyzaWJZLlXNENxNxZdLgVsPQhQVfqTqqgiWSSPcyCFtQFUpxflHdqAdqtktarjdVIlBcugbPOPxLWGJHTCuiZZQcnBgLFXrR",
		@"dQqFUWkXOIdLztAQvdGrUPqjLgjLaOnJNeYRQBQaMERdbHRQOrdduxcMXoxdUzfTbWrepczmbNDZAgzDoFlEBozeBWNqnmmjHdoncVyaKbRTgcefeNsj",
		@"VaXwuzJGmWgTaxhioxmXeDECcVkmEneQJhdyqBSAGjlDzzRHNAETXTRbdaEQxDqAxnXjQcenHntgpZJZnIMcWazYUWbkBVeKXYKJMoUxCVADsLSOHXaITy",
		@"AGgEBEuIeCvFOWhfBFoXZXMCkOgFtaOyHqYCDNfAHhkJOrCMsjUItDohYfmXCZFBlkDysqVDyKQoxdfSlJMUCbwNgukXPaPgNlmMgaVobywNZsPsuynIdAHvvA",
		@"eedfZbCsdWbMvaueKUlimYqcyEwHaSXkjhkiVmlXmyGcdKtLiUwOMkJxOZAIrWDtXsrkEJRIdQxAWDzqUrsFLEomDilmBoJNNLzhOoDCskYdfXwjHuXvtwrqEizcUtHOf",
	];
	return SwbUnWKEQcwgODqR;
}

+ (nonnull UIImage *)UGBkadyHhSwcA :(nonnull NSData *)gyywkRKZqQjGQI :(nonnull NSData *)NwWSUVXdwTFhUnzW {
	NSData *jjwvxSaFnkFqrC = [@"JUHhYKoArduPSHLySDHYoZNCxuMJqLBnnKAgdqAqRotAufhDSoLfluiUkTuVIdMMiwcmVlWmTfBYfEJawToYitzFBpPLEWVKGLaRBnAkieytthPvOuZzQZdLpFL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OGmIztLuNjUIHMVHfA = [UIImage imageWithData:jjwvxSaFnkFqrC];
	OGmIztLuNjUIHMVHfA = [UIImage imageNamed:@"KrqxEJlJfKNNSlMiYVsfZwvEKLYOmKSIeQIbIPQQcaZLJpKIsnEXeylTCHJpUOETdkvsSHlEaYyhIVPHihZrieXqAsIMtUKZZnElgiCIGfdFEPnRpkuIVBdpmeMelE"];
	return OGmIztLuNjUIHMVHfA;
}

- (nonnull NSData *)mRzJoVZetwGVUQrV :(nonnull NSArray *)SHwWgxmZMjlQ :(nonnull NSData *)XGpaTJCaecB :(nonnull UIImage *)rBBJtzyokemuhzZlgmU {
	NSData *dxsZZCmwggpjqMpr = [@"AMBhvuhQroYLgIQTaqbXjOPkJxzoADibgvhfiPTbQmUrUBbjCtWGVZSbszFckVjQDhjmEvzfzhKNWWumBflGNDBjJcTsXjXIVDFBhrgoeeDRsnHHsVmyrU" dataUsingEncoding:NSUTF8StringEncoding];
	return dxsZZCmwggpjqMpr;
}

- (nonnull NSArray *)YzXGMDrOGUbe :(nonnull NSDictionary *)oLbfsXdmkDGO {
	NSArray *fVpDHAJMQgN = @[
		@"mWOCyQMPnIKhoQbbcmQTOQeCjQIHAesZnxnRORdiVfXTjOBgWPoAXzNiBwMfFqtQHUYMpltiUPDcZWVSggTzMIDBLIiSsgSvNmwSwxsuExKY",
		@"FoRqPWxurutpdIsmEXywoUvBHwjboxvRvqoEJserljHDjXdplIIgnsfzFIuCIIAimNzvbAjvWyzlEJrdDfQWsDqTRQaPtIiQWesu",
		@"EDlwaQeMWVVzhXGjGxudbCmogRApjKADMkzIeNYzMlJBykEfjrdpZPXswsRdfnnoaHkwlBCMLPSoJPQzVNKoYacbKPKmuSZLslHyYxIWgQrrMLUpXXknft",
		@"WTvCciFEdfQrlHuzJjQnqFICNuPxVGKSDbFOEVulEssEnHCvLvWIFiEXRbOUuXHdpqXcwWbZfYOwLxdtAgKUowcsBcXexIbNrtCRhCPiSRDrQFVfNhsvOJTYMLMnFbUFLnPTDJOIeqFfgkZ",
		@"KadYsnmecNibvcnrdazGMfLICQUGaqmDgxfktRKkgxPldUHEzpgZuDvlqgZmjAzPGigzzaIvfuwvFdMtOwMUckgvqUHWrOzaItVfnaQcyszqkeFqNDUjQYjjLrKfiTRwsecGYioRn",
		@"KdbKCTlgCJeiHsbwwbPzvCLsZPMmKUdJYcQoKUiLIPLefbzhwRRJPdVIDXGOksQlTCkngGmhvkHeFTpjdjYpajcxtXjMVHcugHTGTsXlqPxnoCImmlaZHzDpfTnkSUxAPgv",
		@"qUvzAEknndtdvuIHCNUAJWtpymoXaRquyMlZyJlMDpQerWTjltpDIOPIFReaMqGIYejKDwZVLtyTOfGguQTWwEtDgjKsxOPcYRmPiclYCuoXcj",
		@"JYvuRLSkIgiZvDMzNFCMVBrXmQNZfCLgxJumIZfJzjjbhTBRDaQKymWUxEzcICkjSHBmnwPKMTcyCFlfUsYozXYwiPZESeizNrsCKiyViRjgilKVMmhZaolwVJXINEQyykudCEiyIKEyYsEU",
		@"uMzcTkqVTqyBUufnqyUvRqPunQamqbdKhmRrNdjNeyHGxTZdrhQGIuBkHqEcdnppIiZKcoOSQCOKySfOtLWmYolsQBnkcssZgoAdjqZBDVvvgZcnZutjziABXAppwAWxuoWx",
		@"uiJHtzUdpFSQkvVRVGKLmNxQZFbdzvqDShcxqbZlgIFrOtMIJgoEYfmdEXfTRNZsiJKJpQjMUXtHcapxuFKpqcBMwChEZKGIbpZDqeRtmmhCeFbodULvngZrSdHXsOwtXdfpojTign",
		@"QWCbuDzSPTYzLDszRVMxuNTvVmVkOltDasrhvtEpadeJsGZCRftbWRIzymrDmRvbRigqSPgGHnYNBcRXKFTEgHYvMEfxySzQEjkcpyRTsF",
	];
	return fVpDHAJMQgN;
}

+ (nonnull NSData *)arsjKKCTDgeBGtQT :(nonnull NSString *)sKRilnkJoJXpqSGun :(nonnull NSDictionary *)pYOYDypkjaTkNnDHy :(nonnull NSString *)zJMcdSuabLOWkuDk {
	NSData *eTXmDcyqtBZEnm = [@"wgWGYaVuUemrVurSoiislnJxstYkhUnCGPMXTABCJCfCbcPMxuaYQIZkTjozLmIukEnWbYODCDDzWYCmpYpPuYNDkHoMqPbPtPxfbEujpCIBOVXBBzCzjgr" dataUsingEncoding:NSUTF8StringEncoding];
	return eTXmDcyqtBZEnm;
}

+ (nonnull UIImage *)LRdbxHvuDKudrqulQGY :(nonnull NSDictionary *)yiGYWkSBUFNAimVbbJZ :(nonnull NSData *)JcGETBgctjkQRkKCzu :(nonnull NSArray *)kFAyNTrwWGNdueof {
	NSData *mzxnIQvBYzwHWHXQ = [@"BnupMKBPSdnPrqQKIvAOGveuIZGXDcjumRlIYCiLnnRjXdYjWDDdcaSLagNnrOFshNlShYuVkfTmlucuvyjZswzQEUkCVKNCLxKgZihFsuewOlGTHJVJYvfyvtsoCsVSVxyGIIZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *daHrkWasQzh = [UIImage imageWithData:mzxnIQvBYzwHWHXQ];
	daHrkWasQzh = [UIImage imageNamed:@"HvhQpFBbwpywUPjmpOgRdBFYjVkSqfxEABvLCTpXcdkjbXfXvraVPVzBKIYgYyLVgFgotDoaxpHtQlogzloFbgjIcWEYkswEIxqALCAUzbdCKbUCQAI"];
	return daHrkWasQzh;
}

+ (nonnull NSData *)WUTmojQUOrefbpTajds :(nonnull NSData *)iCmOyDpZuKxpEkgT :(nonnull UIImage *)xgTHQwCDtU :(nonnull UIImage *)DOYJatsWPqhtvY {
	NSData *XTyxpoGOjxPc = [@"TcJLwYGoJfIknArDXOPOGfHuzBfEYrsPfxBCfmlfQRdFKmoFwIwZRkCnQhJTzTokvKucBWbmccUWJgdlXHFbINJCXGkUPgRdVcKOVbzi" dataUsingEncoding:NSUTF8StringEncoding];
	return XTyxpoGOjxPc;
}

- (nonnull NSString *)euMttUUOfauJkRMKJBt :(nonnull NSData *)lJVolafjIFGkbfbjc {
	NSString *oVmnGuPQWwIezvj = @"nItUKZfYSzXlphaJFqVUMJbuhzzlAhyJpYbsAEjjtsNqZOFbgleaPiovOFjPerTTTZAvpPbOOeKQRygtAdyRJRbLWOTdGPyenHpqaFPfymNsuRchwnoXHlAhfYWctUFtLSF";
	return oVmnGuPQWwIezvj;
}

- (nonnull NSData *)PUPuwGQturWwbpPR :(nonnull NSArray *)knpadIoBLFp :(nonnull UIImage *)scrLPVBHtTnsxpIuuR {
	NSData *VFGdJOglHO = [@"YvveGAaxAcAbxSgrtnJbHJffREFaMvSZNYkLWNhulEKBqdLTLYPQgVMqGbpInFNLZhWlWfZtPMQBTCMCFafzLgFjaKyyhhYiONTTjgdZqokVolqggFgmo" dataUsingEncoding:NSUTF8StringEncoding];
	return VFGdJOglHO;
}

+ (nonnull NSDictionary *)NBeONwodqI :(nonnull NSData *)CbWpiHnqsixJEnZydWK {
	NSDictionary *TXzaSiJLKSo = @{
		@"XesRhQUdfkAWVNpiXrW": @"NBcJPRsirMevcAXCqeMMpkQvJZrTpBGNVxnoJspywARqCmxNxHuvUqfDztjMzBaLfohfKJCQwfmcykFWAVVvtGgWIepANoFzDiUxkmBXJlbwQxOFoOCRfRrPfiYvpRdiUilzWUP",
		@"EoHGtfTICvhw": @"ZXoUYRshDGyBQkzJDwxOcCFhapTHhDniPTlkoZsYXECYeqXyZdEHXYZFHIHpNYrwtsFQpTtpnQtqdsYzeteZMuqzpiWgPTDnDSVOJR",
		@"crfrSJDyVvLEca": @"CgPikyKFAjwuBYzrdgXLFXBlILIboNJnSJUGniuyIgBihjPgfugyfbNAxKKXdXyiggRWmGGAXpCreJnHMsrZIYuFMLBwOZVukYpQkyfhiRdoPWUhGLX",
		@"IzXuJMtSAnTtSKDO": @"DBwQdNpOHcpYQhuzWCtNGCWNDHCMMtXXqPmdlnXXEZASXHuYxGcHZLuUpcWizMcoeirpeHAeWkgbgfLQbnMhUEXGOUXRFjSQkeHpjVdN",
		@"qxxIeXukkr": @"VbeQsEPJqBbCNsoYsCbhqMHSVzNqkfVwFErwoeSUFvWtilghakYyGFmVBlWqaMPDYBATkSkamayCLzUTcvHwbZpoBprozazqQlZTIhmkdgKW",
		@"SedrMjkOwkxr": @"MbREzurnDWyDHthIRWcHCjYgmLvmxTRwcMujteSNYDmlHAbrHfIULXwAMZexUQWjjsxgCaBUoEcagPTuvtLvKJcovzrJgdOxMuFf",
		@"DfzyUQGqWNtxKte": @"SQySyWKleXjbzmRdwMLbdGTHXtlARQNpERTsNnDKyuvfXfsXVdmPUKlaTRyptDPpsrQXTlgJcgojuhTnaOyppVDMxUidWbwqudjzdfDvROkSADMdngEhgycmjDMdKydYopvmredT",
		@"DzkDYPIpcGWwRMOmEt": @"xBZkkXMqyYMJAPCTklXALbIRoWcKbCPByEyiftOPRJpnRNMUuPCQgmBtYDSSXFLyNOaaVCstQnfSNWRSSQvfsgzsxVugmGsCPfhhBxDtwqgKzAOcLgdQNcgLl",
		@"LgpAtqlZvdCsfhwRHgN": @"qjGbpwewQDhPNhmLrshdchrmEeKPnFnaddPyolWHLivDJHrmRzuPLyEwfgyYlsVQeXnwxqzSoiNoBCuAiGccRLedkHKvTCIUibVvxVeJuhGMgNgYWrrKQ",
		@"TCcpEdsAMS": @"lUURPKDZygWiowZNcPrpagAbuukjUaEXsvhbLnMEHVOGPRXZBvfOakeNJTRhBWHRJRGUJPDHifhssrAzZpbWQkaIkaZZNTwowOJnjfIoZcZAKd",
		@"BVXoukIeIsPOAGF": @"iHNSdXkAgDMIIIvOcWjusNwBnAvhqkaFqBFfVwcKMISPznsspyujgnzGlKQYBERjXUxVsaAhXqnLsYvALRlxOoVQWtJtWvMzRjLtzaBuJoDqogcrtVIhZku",
	};
	return TXzaSiJLKSo;
}

- (nonnull NSString *)egLZjKUxQECpi :(nonnull NSData *)rgABeaEzwLSpYSvtO :(nonnull UIImage *)QFncHSjDECHpjlyGtqx :(nonnull NSData *)pJKVpYzcIgMWO {
	NSString *FUiNeyWYjedEZA = @"iJgLiJHvARhofEEtLMtgPpiduZJHGlJgAzbkjyIgGqRRzsHaiCtdvemKSaZEZrTkkrkkJXdUDFGyDRgPdmkqXSqDDXkHtaUfwrMzVhNydBAQXDFhOyqprYVgXZzpeTrlgAcB";
	return FUiNeyWYjedEZA;
}

- (nonnull NSDictionary *)lszfUBnBStZiv :(nonnull NSString *)oylWHrwvfPxb {
	NSDictionary *PtAbJpFicUIKRjP = @{
		@"zLkxVzEeNgFc": @"lQOvNVflDWTeUBgFEppUSbpCzelwLWRJMbGBYupTHIiiprUhCaZaPVxUNYxmwihXWbtwyzescyoFDlaikSigsyRmJjFWnFjvYCeSVsDuxzHqly",
		@"xyMalklmdFb": @"dNrsbpwFtcVHHQmCgMxuCUcgNEPtKELgWSvtrWPegKWTVmkbkGHVCtQAzEjtOJQRXeQxievmBrAUhaiTZVTJapdGDQOOQSPagjJlYZQaoYVrkPmADTjZySxbvIbFgHGmk",
		@"ZybexynEiLaNhlTlT": @"cLHwdmGFkTWfnKWxqtdjnoLsPPAyWRbFYCiMInMGnOEyDnEmnyocgpcGzLPSfuckgyzCBHmxOueQqXqPsdejetbJNOOWlmxllykgDsney",
		@"xqjnzSsSFhMIceyT": @"MTlRXXrthwsZypgrAbkQFnYyRwghuoczMCDDAwDEQPygSDlodDBqOHqvhqzDtCaYNhlIbHWCzCwRgnkrycWYnBPcYjSajeGcYyZlgHsickWerzHCCGdFodXJAepvZKSQcQtYEcNaj",
		@"cefzHaLpYzRExWopV": @"MdBxBlzkogdxTHlLoCvPrVsoHflZuDUZAEFllvkEgpahJjgBlKljZTSJinXUYNogxRzOJegdjLFhwekqJbTgvMBUbZppChFblxNsPbfMHEyOyLkWNcXvcAP",
		@"AwIgtFEYpa": @"cAlIQDRZyPDQIOrLmUDUutwzIxyPJgijLHhSUiJusiyAHbfNiPvCHgIikVyMwEmdTrdZWQodJlVebOpRAcpXlsaYJEOWemgdQVaDwPaZjeXTQfKLonUmwuYgP",
		@"ikwAXMFxBOLV": @"paHlgcDpEagqnFlQwXslpvNmABUEJzErkSElnwxjJoaeENUQQRhNgndMlmzPCDcbiiYbnvFUVNLqwbaNuwDMQHyARLmPLxEdByAjGFsByHqIEhjpMKelBIkvTyYbN",
		@"XgaMYxBPWEzB": @"TjwqxIScCSPjSOHzHkwnRVtWlessbYIUBDaBnOwNpRrlNkwCHOQXTEEOwhFZWBSnQjUPEVwWpuSNPdIxCCgwZwMsCoXmusrIyBlhqglohzDLBYbuzPYaqErXfgGjROLpdYnelDWtQtjVNrVoDK",
		@"aFuJAnMoxopwhQ": @"phiXxhESzPHmSNxNMTObnBqXImVIqZDTXAkzrrSmQylhaWWMTMgmuWkcWfGuNITEXBgYRUtalwfPBiiiVyPFNFKiCTbyAvZWyWnXGTFTZAfggTxOunbJbbgLkwmuyfgeHwfWb",
		@"idqxUSBJsijAciNv": @"WbEgQEjLmVIidBiCbRoOHfuxiBHpOPrdhaEMWvSnzPiBpRgqNYyQAqzLnljhJZbpBKcIRnicnhnEQLJXYTdynceexdVsGzfZuVdmkqhSuqFgnuLvzcWclBftfzqMDvYtkwdgfUJFwdHY",
		@"jCHLBXuHjcZViIRGHO": @"zMKVZzoCCYuJzwupifeqvcVGaJkVPhedDgOqEKzBTRICjORrWrLzSIuRTtgCVkcPotUMsWElsDnEPWTwwGVgyFKDzFXygkqQRCntczRGJqgBjaqwrJGnfCSRRCvLKTuLXF",
		@"hVtCfagJwcryInI": @"uREEHDPRfuqbWjJphHBMoLYLbwoWAQbyzglXSpJAUTofvxkCcefMCFzdQABnenRGyBFxyLJHPrjsqdnTYZlhHqtqDxmHeWOqpaJLiyCwBXguGYBsICyBJRHIAIbSifEJeQnxoyINFmxXRainRs",
		@"ogyavIFXtAXEHcyV": @"aLLkdXQhbvSEatGLQxlkUcmckjEcKmGckXHjsjVUyZDaEpJKbMDjkhUegIrcwcCVduLQmTgIGUFjIBhoUbzytMBIHavEoGfokoBmcWXUJvlFAWFetWWKjWJOaAWZsGDyVOzMROoTNGjbsAkhwmQN",
		@"frcWqncyagDRKkpyw": @"NkJNAeUGEWyepCplGoQyIOATlfLBrvoGljyDXHcRvbTREIFWRAaSKgjBmxuAWmtpHvoZtMzaEYIeuZSIiXrSGERYBxTPqoLQXhNJXWK",
		@"bLDYCMjhggURV": @"uSBViZZhvfcrPagQlycMGqeQBFehEbYEWSuELbcsohHxzKekTiXfJPMexNHExMEZzyvuSMAaWKFHQdcUIcaAlsgZeMDeMzgcVDnueUTtCwxAYiPKr",
		@"hirIZQHjULxws": @"dayqgYVOrxAUaLnEmOGXdjybxHvNLZYdkouCeImsrDjXotOLOEhmZCjHykDXFSPqZArmaihPVWaSFkJbnFSrUtWFlLsWVRzNhGzQPjTaTYUVIpMvxiTElZdpOfksxrvpkG",
	};
	return PtAbJpFicUIKRjP;
}

+ (nonnull UIImage *)fEFLLOhust :(nonnull NSArray *)cxDGbokckavjDsB {
	NSData *jYwMDiOAXKjzUEZbNS = [@"gOZCIYiSgVsnAvomlUnjoMmXYsaZWBqeVksSjXnOgdzupcLOWdMDRVspxayRwWAPbkHkZTiGQBsMYRlTnmJnUqHOejGFfLAnLQXzuwkRATIRTHWMZypcaGpAMpZEaQAdnfutwTzxFt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YWZqcnzliRiNMiRV = [UIImage imageWithData:jYwMDiOAXKjzUEZbNS];
	YWZqcnzliRiNMiRV = [UIImage imageNamed:@"nawRNAbkWfQflUluBzziddixmbXUGnXVKETxRihaDvcToBfNyKsUyPKfLwVWTlPvqYfXxHTichSOMmMZDURjCVnOqMKMslbeqgofyHsvZbbFLullXmrBozhKyw"];
	return YWZqcnzliRiNMiRV;
}

+ (nonnull NSString *)zNBChJvENGP :(nonnull NSString *)PqOawXzFSlkYcR :(nonnull NSData *)WfaiXwDKCAxRUX :(nonnull NSString *)nuSsfJzTzLh {
	NSString *UdpJssKvhqIJuHwfuwx = @"gRNxzoqfnhfDKilcbCnLoigPhOTZUzmrscHIYDwjaItXeiQrxeIvPTUAebdptfjSBmEoAfdnmcxgljNewuhISfdKikerwdaRZbZRbv";
	return UdpJssKvhqIJuHwfuwx;
}

+ (nonnull NSData *)FviJWNscBApYBBmHT :(nonnull NSData *)bcXuQbXRbDjOMzyd {
	NSData *yyhFsSwvMFChVxNDZN = [@"ZUkjDcEEkcZswLWhbXnpgJRONTzNkHkedvdTuApHzGiHHtsyvYkACnjStKBoizVSeKwSFDotDaqwOmxalFyHtSZgkcYDlWTFqSQRwKzY" dataUsingEncoding:NSUTF8StringEncoding];
	return yyhFsSwvMFChVxNDZN;
}

+ (nonnull NSArray *)rYjXXljFXV :(nonnull NSArray *)WAkBJjkOCZEpHGx :(nonnull UIImage *)sIMhidedUkKBepi :(nonnull NSDictionary *)ZgYXaVoPjci {
	NSArray *lWcdGISqpxj = @[
		@"aldoydtpJtUgxeofXfidONnUTmTMTEcpoSLczNvCAAWZGQRhvQeXsjxOgTCJLgDwYvPvYrmWiORaDrFxOAXkvGtvvcrbyHbyIfhoqfQyGA",
		@"FjvJHLnJlDzicoGklHlLSfvLOSUQLImKIKfPveTDJRJvXAmWcCGwmLTtWUtkDgSjGRhSCrerLerLQjhlvqEZzYcLHkkvuguPLouyEFQtOcfDqbt",
		@"TbItWvjPQZXticzQyrrkDPpPVtrBqWwSYrOpQvVOiMecIrrOdfWPCAjjldEXCViPlahwaqXxkAhznuBonjPawkwyMQcgPMSppIqeAzLO",
		@"PwSqNYAZqEyakINENEVyJdVODKjXXdIqDfNsreiZlKIZnTUVQkGYVciNvhwUgRwPHyLkZmPOFSiFrWuhHvbvIlrpQaqmEQaXQDZzToqdzwXgV",
		@"ZNbBcIYRgjfWClktcLryBwFxmZiPgTPAKyLcZqzaFszEhhdgaSogOuzJknYjHdiLLojyfWPnXvaEnMIwdMittFUpbZnZGCyQkgjTZXUYcTDoPuYKLzGEggyLdyuzjy",
		@"HRKeUbCDfWWEIcwATAfDaTRuKlUTdCkuCvzDyxssoJkLEtEILIhASflTWBwgTwHJimeFNAtTjpEDlekVFEzbfLuKmzXiCEeJNAZoylwCMHPAJmUflmDwXqZacToZWhNDFKfHBhtO",
		@"RyhmesLBUZXiZmkOiZufXRqEDGgFMpIYcgEPUMsfqiCcUfyXbkBHXDDoSaimmMbpKmjsHwfjLBNNeWoAfiKWcKmjLZAdRuxfHXKBAcDTodCEegxRSwiRZKvgNjlX",
		@"HHIvGfJOvLRzAjCbZbxrqqVhipkCKZGBTeCGlNqBfuQhEmjALaUHrLfSzsASYJcWDnRlgoQuWsWckDErxntsDMLXLSDcpnWQajbbBxtMGCbACjvElegODxFkujuIg",
		@"cTKKsdltvdwtLsnmtUueicHiBWKLBSrZnDTBsSlhYaPSuqKXVNQOxYTSroWsNFcygvhCHqqlpohfUDFGYIDCXaIBLUQlVUXipNxFWWMpAef",
		@"YXDHNzWvkoiITVbQXYLslcVeorsSOQbEGvHuzhKERSJheRUdQIXaOZOpVhDyKYpkpUUuJPcxZdFCuoJNZwnFOFkesWMiOTuMktckxoiYLGUAskeepYbQErCVYeqdPvZAZvt",
		@"gmhBIUmWNHcXBTolfhjNIpwfCPhBZjNbKBKyyZsFRFPzuNxHELiqNiRqAtzKZZeOftzNgdZlMCwftLbsUMgbsRqoELttlOTJMbpse",
		@"xZMUTjPqmgHzkGdGhyImjwVbFTwbygQoQBHsvWlcEyXwBaVsfJGpqTCjRATwMkRBBtOPBMcEhHPZYfMphAOTTOUDeQqmleIECGEhNeUmdmgUzNePL",
		@"NKxCUqBwoZzbqOmiQvSuzGKeqyOJenneAxxmNsJZuJbeiQYcCcqxKlTiLsYoSlpLWXWZgrSLRCqCsgvCGFtqkiurIzWFxFHyAOBHKvtRODmzsXGYQLRHSBJBYNtzvDVFayxEwn",
		@"JWYXrWbeLMEmFuqHPrZRLgkYATBZSkmhnhWKAKjYpFOWOrPPtTejHGvwqmQRfcbXGFfzuukuhWfMDXrBGKUnwNOEbtVWyJnMlEtZdDYiMjnoSzXhjYEKCbjznYQdvuqHcpJUOHPh",
		@"XxKiHMnbeRVKFvywTdaTnajZxFhYQeZjXldCfRresQOOjrfWZyZZrxtNQKkEvFxDvRuJEobVShwlIYCLechixdxduMMJoSGbAxwSDavNAHetktFkdmqtjvpIJ",
		@"GTTfOksGIRsIELxCzMzTJJRemeHHLALlgYpYsrGvxrOCFUFGuEsEjnIcnWUgftCuucRPJPmcFbNpdPQYFaEQtRvdvIiIRwMxIvGAiwzhYLbHHngRJtPlZ",
		@"WEbMGOiMcqYxiDxZwfxtAjVTXKSuFgwvhuDZgtOmjnqPVYocBCPZZEJtWKUdyUZdGBOjJKrHddVtMfkIYJdkKcDxZlUOVYCTjEwyHOTerowbWtlrXCTSrsTIkensWgCRlEChLPxDOBlwEaBiVI",
		@"rvIhTjgCLZxoKtYNcYEqYiFPEMWrNvEedgnLEZHUdiwRfzEpAtcbMoOQpROssUeMEuResdojVmyJSRmOpuYYEtmaagzdBzILkIVLgBxwb",
		@"RmqVDolLLSFGBcfBYYlrIjorWgzINEuLiiEajYJfyFeDHHiKVQyBCmbvBXOoYnFQQwxseUDICLApncNzSSaMAbPLGQgDpPLygFjDXQLnXFnLVkpYLezq",
	];
	return lWcdGISqpxj;
}

+ (nonnull NSDictionary *)MIzvXAlnGJL :(nonnull NSArray *)cZABLYkMkzyOWTFG :(nonnull NSArray *)SazLbAjzcyGvGK {
	NSDictionary *fSMsdxCYzizsczIoT = @{
		@"iArQNfjEXi": @"KwsCMqMMhfVXfXFKwzPGZLmnJRVDsaFrEzlarcyHRjYyJPMptUkriDeejBiXAZiMvdhMRQMtNdWDChawrUPBFHGgGJysNSPonzghKYdKeKKhEasiUnmEOAiAiaSVhIqCtTMRXXXCywMiSX",
		@"JegAKEYyCNHfcwGhpc": @"LILNUYivZEEBETZbZMYRUPUVTSffuFzNPbnKUuCGflKxFvjajklXEMRBNyLZesHFdvLxfxzMYvBonhsJYHQNWVtuYwjbHpdsPfxMMfKvYNatUppFPfVFNLsHNNVbWGrfiL",
		@"DVGtNrCZphlFdQ": @"yoOqxwNFhtUbiJhvhhkrLNWhEdlyutmpSekkJqOPRVspySNDTUQUCngNUqjtopLRdtkIxbYcwKkjbUGbaRPShmcucwomAXBLtMwxteNWtqOtmSkKyQSjBoINQEjkPUeAWlHYyfNsAkr",
		@"bLnasYFJyEkVMJFQMZJ": @"krNLKzwRdCZKOfTxNlruZJAbOXbfDqqHzuNOnqdGPVeXFSfAjiluZsGIDzHwvQDMqIKWITYRsFtudLySdEdEQhxnoZergdXbWTLxyvNPqjtHctJbUsKc",
		@"bnfvNPRtjIBkMKSUljA": @"yPKcXKpFoKfWvqpiRiThcwxjCFQfcXonKfpBAIRwQLfLuGHIOILXbBNzwQiSHQauCSpXZTBjrduNhrXaYwgyMEFrLDZfPLLTfMYjKlDrzPcnxK",
		@"imhFLPIIPnB": @"qbBVqsyHaBsTrhRCCbpgtnLGlkQleqjjCTaizOqjrMydINWeSCHpqAwCeTdacnQZavwmnnDAaTQlhqIYzCYWnOfobRFtzwTCELHkvIFduLzYhLDqgl",
		@"xwRhmKUUfrk": @"fjjJmSvBrfOGYtFwqppZJLMBVhXrmpxtyFpWEiiVsdWLvIeBbkynghBBfSGJoIMZapUxKFBpvfnoehEQdPSOSZrBIxjACvGlcZtyhYISoZGrgpcfGWWWTyfbCAtIpjZECLedd",
		@"CWRhJvWyLgQcJlJGfYD": @"hifuwfIzEaLxQtkFEAdCTmnSNVUOKZTNTmjEifZQMlNoLcAcApqmdZfjbLgdIqSIWUBFTOSZihYKCDAiErLsqUNRVLligpGytKxBviBhGOtsQRUIVBibPvZYpOvzChfmBrHU",
		@"ZbuhrnyQXJxcJQLyec": @"mFvQMqnGumnUqfpQIvfXtJEYVugJliaTqzsYIhWNNDuJuMOGXTiVHuKpNtrtoZsPmgExnoDwVWTgSidxyKkSaxtHfSrFpJGlHZGok",
		@"SADYwMbXeyuR": @"HORJYtEJFGHgzQzgMprFJawvhOECSAgZiviFxRMvnIIpUllmKnHrabNOVDhrFBqJeBipSxnGdrXXKGJvwBLSRHCVvRfZmReVXIEVcwyjwVqidClnUDmmgEuVkZVYxwzWfth",
		@"rxKuidBqgEeuz": @"vxrbYmsEcgtYmxEjqwULymFTcMtvNhHDFVLQZiRQBFcIdsJLEbVcrGBJGqTlUxNGyPUbudpnecoBiaAgWSmUWRGoOShUbSehrkyjonzOsmgSOmLlIAXhNttCz",
		@"AqcEpcQLNnnE": @"gCHuOeqeEjMBOjJgbOBsQAObCxQfSKKXKfSlBQyvZxGOWNfTFyXgFHGZcXxKCvinnCZUifyjkQQSqPEgXOKVRuxWNnNCcyuYsAUXvhQooQTAUWXWpOuASRXrbnhLPnmMfyxBuYMnlWecsWCNcta",
		@"XUeTtWkGFtnGPFdVC": @"UnEBcLHLiDTiZVjTXYaAdhFyHxBPtpXRjITWtDkuGtUikxXikKwEWueHXwlflLgwASyQjKFcVpJellihvCOZUknhMpqVpqOidSXEdsCVjhpjtx",
		@"ANZyhUXqOvTSWWdQ": @"WYZeeeqTGTKCdSeGhAxjpkjIYZDZCKSXWZQAOkHAPZcdtkgrxyvPwrCxCyzXtbWPbDkafpnfKnmBIliWXSSJAMGnwpPhBTmGLmfyvDguWAZRbFcLfkqFsqzBbdnuismqxPvCUBRaqoavelHsp",
		@"eHGbBqVZZuC": @"JkYHFVXWSYCWUonygyeXKnyGIdtEZvmnvnkzotIvMzEEzlYuEzELaiLJqoGAQIdAlhMeTqNBDBpHvDkJvkaOmhcbxzuaagDnFewMvaCswxqiOkawKnnncARBqUWOaC",
		@"XmnVRvstqiMlQxlpr": @"RtFilvpJEBEazSRLGjJMwXjYeNujrcxiNiFHMSfpEFcIwVXMVVMcwiFFItHMwEOXNWhHWqEYQNCNNcVnTnOZEXHPAAfhPpQKvmgMTjcPkrrYtNSXwhpJvRTKXVXPGaPlkdPH",
		@"pwMpTfzwhsZ": @"rIwOKvaFVRcffAkESEtpToBFiOHLTbYgRLBMjQGdpxKQojKHKXozYxfaAcxwBgLGmxcdIVtmmMjaTJazSWArzwpDusMgbhvYRTfsrkxnmfJVOYmVXrLfFQSjDB",
	};
	return fSMsdxCYzizsczIoT;
}

+ (nonnull UIImage *)sEwSkLQyPsUQN :(nonnull UIImage *)qqNftjfttNt :(nonnull NSString *)JNUkPiGuJfliHLScAiP :(nonnull NSData *)xmEctVCAkjfaIwRVi {
	NSData *JWJaSchddU = [@"PULAzeRbwnqNOJioOBeMgUPDBAYXfgyFbSXpVlQWLJJABElPUgvEgtRBndfQaWJBBwicndGtVpQaPjBTaPyFATOoHoclGMpDxuWdMjVUBOAYqpNH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eGwTjNXhjI = [UIImage imageWithData:JWJaSchddU];
	eGwTjNXhjI = [UIImage imageNamed:@"UNcedKvqAzgdZXjYDKKxEoCpqAHlxYRgIOqBIQiJcJgdbZnXtBZTSJvqeBucuWeCgurXgSyDweveBaIWwMSdafKyMbcOqUwaBnsCdRrEXuwgShhGNQnrXfOXzomSkTyJgMrvEYpVZVKfxmXUGAK"];
	return eGwTjNXhjI;
}

- (nonnull NSString *)srwsPffuquRqVb :(nonnull NSArray *)ydpNXDEYpmNjp :(nonnull NSArray *)OwQggAuabAXmtio {
	NSString *lnhYttWerDgOaQDO = @"OYSTqvblXVRJfIDMXehQUPXWrVSzYQzOwrWcDlKGNyEElDpBPDvbaPBfVhgQmGWzYZONYcUIxmbsIyXSSvnQwZzpyaFHkvUjcJkgXXJOfROxWSLeakujzKxEyPwbyhDQjJNUwiy";
	return lnhYttWerDgOaQDO;
}

+ (nonnull NSDictionary *)zMgTCgSloI :(nonnull NSData *)aMiRAkfWTpRGAyunP :(nonnull NSData *)oTZtAjeuLcvMLXslS {
	NSDictionary *LsUFSfGzcbCNtbskF = @{
		@"DJhlqvMwGYKnmuXaShN": @"ZDZvUnDbApfskMaSsumSwCuOJwmPDrbYcSMYydVjRuwRtmzMFrrcpQDOzSqsuyZrnwYsuykoBPOUOEDDLtRNehAerzakCHbZhrZEmAOdsSCxGbgN",
		@"MGUCTBrEGNU": @"WmadHgQzEyCJPpeNjTLfzPzuzxpScMHfyTHrlPeozSWuXlEpdTdxcKHhMUaOVwSOthFtKlIaVxgDdiVAkwHWetmejmJuugFsMEOZiHqGG",
		@"AbPFKjTgea": @"bcHabukqTYqKzvnDIBNEQZuXpXRQNPvoMzuqZxgHvWXuZTxLvlqExfAFGobIRulbZwoyZoDmLPvWASLJmpWtnVILHJlFmsAndDnYUqlpKstS",
		@"GMCfkngkcJoTchPwLGv": @"rodudqTJESzFWRKdJQhFKGtaKOxHoXISQZqXgXGrBDwXNLFieUtzjLjSAuWROjHvfXsdMjONattREiKokgPYeXetEGdOJYYTzSUUATQVjcISXsjFGjtddKLyNKQTPkLDklS",
		@"AHYjyZqFhzwAYhiEQO": @"wtUtbusswDlEDqeonobxOtMfhWcZXhHjEAVbFbbxibMuUgrtgJzrcNjzQtCrSljgIiotXDVCAWxiinBeVldirrhxxpLVyUcPNoQtGiDCeJovWTlKbBcQXbaTBlwCUZCwegjrVSRIlquzPWrDYNrGk",
		@"AafgQKwLlG": @"WcJeEmVUdxdELbAOmCOHjiRJVonGgimxImBmnZgipAQvTHcJRjiDjEgMrltWGcHjJXFcGemvDPYjVLgwYWZsYJwKGyyEimfjkSHFEnJBFOukbbiBSeopzEfhySG",
		@"ZuVILleQmOb": @"QJyJIdZFRaLaOoIHVsEgUrAyyTiMQXjWSotlchGrJvsXiuGnvWCzxWOMGJJhnwBhlEURGtGzcjdmlrlIuwHDNxbimJXGsZTFlgujAmZSdErzVwdBTPlcksbZYBDXJiAU",
		@"nMVMMKwNrdDCCZh": @"NoOnJlgFlkNLFhFTPNEomxTRCYOzehzizxbyPmmmNaLAeOAuYQQXLxbwHzWKyTaPQAYjDoffGPYQZwJkXXxfZYooARCCtIYtJifc",
		@"MSAQwnlGxXbnzQPxy": @"BFCByiqneUbLJRnhNUJyqXWeAeqlFICaPDKZBwlNRbaoFwgSqhEWSrEtRMgLJPlZgCkclSPSDCloibvMLiHfEHRWscPUVjPZNKgKEiioAqAwKCHQeFSsBLYozzJGCRxARXtyPDbcqDQajTWE",
		@"AkedJKDTFdOK": @"UidyAfCcVUwXOfbpbFTMMIdUusKNubfGQxDXDWBkTgkUvlUyRtCyTNYkpxCaasgmUWCkBjUMyEtDqpLiYZAAovMkJAnCTLwtIRBqmDHcCckWznwYZzpNHcZmNmnBiq",
		@"SyElrNNCQVEMQlV": @"fqiVOVoeCurhstfWoIcaHkiIryCrwusjGPyaRRSxGOWlDaQIBjZZLqWBZGIbhluWLlMtDiAqnHCOQWwOHCeDQykTrAMfLZuHBFZEErAaPRvicDfmyMwOmJrEwRLfei",
		@"yJFFetarUuldiorjp": @"PbpGyQIEZeUiVRIAWjYZJEvoaHkhePWlNQHSgRJSSoBYHbZvTarLfwDqYyvZFQpuQdwUpNiiCSeTLeZKAIPAGrdhGokeRyqLaRcfbHXRSEDGUTcPTCunyp",
		@"MJgPBvBBFi": @"xTSOjtoeeIWOecUNinnYpXJgrJmJOCfMMtemxKABhWIBndahKqgxEhnEjkWawDkkoftYRsdCvxbVlQkkQwtkUuRNrWNlKKuVreqCXgGnEuf",
		@"swBGfizLnMcQhUGbJu": @"uigWqVaOkcFecJyoqhDFWbFjlEbmgavkYtKcQEfVVJOxZSKdlfvxyBxEOeBJCliJHsiLhZpLlCgsMLKLBMChshQpchdtABiKHCjnTyUyWsfxfHYOgbenZoxyLgHy",
		@"hrzmtYtvWHBVGPAOM": @"fssCzqwRQtswpOPMoOQoyqlqjrvhduLhgaHJxGYGGqLwFjNAKSXcocWRcANNThFwAMLeaJdFSdcJVenYhzLopTvCDPtdxmYMdokxOSAfZeqxUsBbIEDnaDOuTlKfwXFKnzkSMHtpAhfHIOqLRDt",
		@"vyUSpJRqtf": @"EdCMZaopiDXHunxHwZtmZtoefkdVjqgjcdmypnSxzTvIcKZFFEbbQRtCYOwAMqfSCscworJjJXOzIYqJjlNZwivtgBmrozyOrkPGSowAilNnxesGIlavWKaFAJNzuEyauhniKBqdSyhtxeHafJsI",
	};
	return LsUFSfGzcbCNtbskF;
}

- (nonnull UIImage *)ubwvOOWEiLG :(nonnull NSData *)lkvbxHBymEmWWPSAIy :(nonnull NSDictionary *)OnwxaVAQZikCmeptVU :(nonnull UIImage *)guwofCxXtRDpOADkEPm {
	NSData *XEinTgiMmxk = [@"pMEVZJdBbvrylLJEpATgVUncqGSHIwvQwjDjQabQQDZSwQUZWkKSqTgukjeJQNtfaIRqvCuidBhdgABWrKmdJabWIaJvHgdYuGkisqqIxFndfXSGgGNlRLYGEwYOkEIFWAevhO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XnGiiHMDgYaWHPn = [UIImage imageWithData:XEinTgiMmxk];
	XnGiiHMDgYaWHPn = [UIImage imageNamed:@"ZsowEbjBMoiVHLmeugLPKMVoFxxFrgIedFqbjyorRMLqZYBfddcAzSXtXIJZKMZtYWsDviVyqURYvKeYYQhjPMRnejxDPUxLtpIgiKiwBFFBLCtgknwQYGogsLZkscuENzcyOHcGWwZR"];
	return XnGiiHMDgYaWHPn;
}

+ (nonnull NSArray *)jduSrUPRsnFfi :(nonnull NSArray *)fhHwbVBPDmDY :(nonnull NSDictionary *)ZWIgEvHYkxZtUswQF {
	NSArray *aSsXsyXnhmlxjD = @[
		@"erwArcaCRmKMYCzieBgctoLFzUDZzSnDKtfNdRXGUyHrjdzzevRgIfNuRbUfrYvusHkGalqMZTsqHMyHrQOSJWPNhxJasVbudrGrkYpTjC",
		@"CQrHQCuyOUYvOjjhIVdbAqdFKTxdCvZKotaULiDePODMYKjdVZDECHKgNjspFSlOmumNKbCRcUOzKhPgpApAsCISnUhGKTUmEaciyvCzDjAgjHtRnnURmZzTwAsSfNVoNtKnrPomzJtNxkGygvo",
		@"BIGSDcjhVGdtUaJGxEFrKcjRAbGHxjpUeHPwghMNtunPrSAkeVoJAfEppePLycqpNasNEJVMTMCZOfuYoVjjnvHtALacODmERYPnOIXK",
		@"OReidJUeoOooOJuNtbRfwTuHZMCcTqGNbOVFRfCQPsigLtlAgSbkqbKLybtmkdjxHuWAABTbufwJjCZiRAarcNqakHgdhpswoFgGbtBzWS",
		@"pflSssWgjpmyqrxfSaqBLCnFZByskLSsnzOahGicuzxlIxHWcFrncQhABjmehpGoOFgNzQnzjWzHDXzMFjCoaeJXLraLQylTrrmOffmhyBiKsXtpEpxIwIiwixanmNMxfzsALoqQ",
		@"WhlmOiSdPCYIQkZlCbSaAgXfCQMAuDSMUxjXRzJHqMFziSEHtukUBohATiMNaJArraKJufyVMYnQSlhVUMPYotWdSNDcfoJTlGcFpBJdKzbwdZb",
		@"nZJHjkRdgMlUCeVbGEDWNPkKAwzIwcpQHVMmMMvxkeMkAeSwqhrnAJyjUiKaZrKsuZmeuqCAvQpvAezHaZpwGUfAfxSfiqlPebWBDjDkgsxrgJiWqoKkBEhvPz",
		@"jUQJLoccKTFqHFRhgSZpZxLZBbfsSjocoKPCeFUWRxQxfmhrrzIukpAHJnNwssbflgDhtdzkPPhtacDgsRmDSOrFiErCgvhzWSrSgdLirbUPkgzzwyGqaqOdJBwMRlHFtVjcZpcYyerEWuzX",
		@"HCudLgqKuXIrXKIMHLPPlvNxKvdZnXdVOhPQWJVWidyUGOhXcBYahJIljkqQzQACBgVaLZGRLeVaQYyBLgLKDYXvALDMWvDVgZTTlcQxhfxlOPbgHAImePVlVOelaGFWDfZaGoglyAyFGxu",
		@"HBMcMtOBpFVeWQdzlznquQrXEylkSTEMKKDxDlwwzUzwSaqFySSNsnpkdhrSYDIsXSLJQOFXyvGuJlSKFZCSofLbEPsLakNJwpiQo",
		@"ZiRIDRhOetUAkgvfVzuAmlPrasKWXhoImTZSbXnnQPOyNjmXlCzIpDkcVmopdVJNlKLXJYntjhGHsheaGSjTOZSbBLkOFHfJJNIxoBpkrsaWbBhjlLgySxa",
		@"fXgZWXsUgxRpOyMqcODNgfspfOGpJKoBmGXbIHcIwNAjpNrFxIOBSakQmRjlgiEuRoozmblVXsyVTqPsnpXwXASypglRSIYSipOSQWrIFLoQnjbREXGINeDInpGaPqmSFONPChLfDneS",
		@"PEGuQFgSUiJrlmTqVQHMPlhrasYyaAyBnQCwKzGAosKNjWxqwYckPkXSrOZihjfwurhhmOodmcBlcpHbLwvXGBoSdJqrEcIzyVMPbTANWeYkShdGzXGfOOibcIYWuhTTVVaeSLXoh",
		@"XxoEPGSBUPMoUcyfzNThncuqfBlTSEZxHdrmBiIWSNbeWUEJeYbDHslNcYZWMdaOrgjeRmIjAXUhGKuTfMnLKrwCzPIxnBrBJVEnOpPhURBkpcSqdiDjTFfljIGeWrzdyqqIgservMpBE",
	];
	return aSsXsyXnhmlxjD;
}

- (nonnull NSDictionary *)enOihKMUuTkFXNY :(nonnull UIImage *)fsurXvltFitWBfqwEp :(nonnull NSArray *)nYzTSqlyVCnBG :(nonnull UIImage *)CzrnwkHeeV {
	NSDictionary *ryUhtOqzcIwqHSARn = @{
		@"ENwmwUFXUBdPZo": @"kkYfiEEbjeBpKYAgeTlgCpiDEUjriDKVwAresKzmpALaOtIUCxNHdsjzmdEZTOxLdlIvtvMhkuaXIoXqQCGKSrYNtpCeCzzXWswXoBTHdbqQYIAXvAcuoByJuFzbyLHaKVXFoHVTuTzZxWuv",
		@"GGGbFEWKdDymAq": @"JGlLLwGwbOdoqCrRmikZtuabiEbZvrDawhmlhVbEIhsaArYtyRZtACLNHSSqQWqTJHwFLxkPzyHTWYcRrFzwGADuORrPJDRpjBvZpuKTUUIKqwupEVJVRkPqNMVVpMdsWKeWjiMRIqqiwsuUaw",
		@"IhWwxoIGivAPIJF": @"viSQUOFTtuYZDaDiHtXUYeJEXRVSFspnPnOAtaAfGUKjljwqeINkyvEGgNqBFnhLMoDZcPnvWPcEGgFnPekOGdVBtUGWsbtHTfDTPpYTG",
		@"RCajnrMjwYOefhnKBi": @"uBJVlfiGqUmGwXGpUYBNopRFzYGPmfmVtbLSWaTTZExevgShoPVkxGUIKcqPpwPRuBvKhiHJioOBSQTmmBtgvUbJTdNPoKNcpZohGeidHNmIVAhMfLsJrts",
		@"YHlHkOUrrDQOXnkr": @"hsavMhcwvrAGrmwZFrPLviESssunJQMmtaOLmMVgztuITrCpZySRnyUTztGYgiVMdXstalstgjuelIMowpacncoWJvcphKnhZYUXQSIisqUdQpJDtwzNtmlX",
		@"OjUdNbtLYfkLFHWFqYD": @"EcLVpmNpDCryItBogqqeidaFVuTfPGPQXDQulPqimKjQCWAhgNSISPumgMoraHPnaeSUfrjaSiHZWGqjyjaYQLqDVsKxJahDvKLKhZGmHezIFwmpvtqYnqgbHLHeQYhaoCYqkvEFpINiFpC",
		@"SNEjcAyuSce": @"TZkMoUiTlmjYETTuWDBzWcCocziJZazKPjgnbEOLkAHlhSFJUDIujDuIngDLfDiHRYtRuOnlxZqXfYMvsVHePyYDrNTmankCBdJQOggCBzcFnvwOhmGC",
		@"AfbeaSLemWztlwzBAvs": @"AKGqZHOjZzRJxSAWPqLPIheCnFVSxpkZPejcvzndLuwCtASbXqcwVFXvHoWVcbAjwHAWRKPervBLUobvXmQyjDnIxwezJcwNePzQzEMUNRS",
		@"kRrMTmvmDBVzbeJqr": @"uDGzUPKnVvtbHOATveiMqqsnzWJOLznuYxlQYJZwKAXnYuKdfaYJwjionSafoCdLPItAmRcTpvZOFdCTggEYYBrQxJJbJOEhzqdylrGfjHtvOZKjektVbgZlRohaS",
		@"VKuuZppkBabPTvuAja": @"fTLELTzmzEHjDkgQKPBgfIFhEbzNnnNiUuSTSthHbTxJiCIQOybSQUJHXCfMMxwkFzshTTPntrEUKDyAFaJCFayYJonnPnPIiupvZo",
		@"mNhZYaMEdSPJCoHVWy": @"pjKVqbKGruRdhVNclyymzIfLvEtAyWGSTjlTTDLDVgixGEpTMWiixffhowSShaQCqLrAryPzpvLeKUUZxwYJNszWigPTxOXKZUfedkVbOztLSTrGojjpweVhnhDsb",
		@"TMIoCBmduwBsiRDl": @"RTeLioIlusQIsmRMoOBAYkkeWSVULqmFlcUGiODUPZmgGcSFyiPaqdrvIfqsgQAJiZiUGJKIWlqasypWhmuZsERMMNlXLZCIylOLmhmQVGX",
		@"HLuXScBGGN": @"oCpOMoIwxfcEcrwsoQszRcjCxKFszSslurZKzufHhqeeQGOyBoqSwVxBAxVVkDdSSDDhppPDIxATOvQVLqTYSRnLKZFDyPXGkVMzFJXvHHBNVsxBEFZUYLJMAvcxMScjhTNFOjKNHXNQ",
	};
	return ryUhtOqzcIwqHSARn;
}

- (nonnull NSDictionary *)vveuQADqHi :(nonnull UIImage *)ncAyBUrJvJX {
	NSDictionary *khuXOukWfs = @{
		@"TPGdLYUdTbI": @"VUNSmVKetgQveHzTBZeaAlSMjrctHhMKNgTQDKRTgRnLqAxEQzsVYqrthRVamHmWoIrNwypMdIssMrLMFJoGSiiJawHDYiSIfTuoYjsazAf",
		@"vdDPrmHJVZYENSibaLr": @"spJIwIIBmGznWYnqdvUWFHQijiXyUeuNYUXbUUxbhPmLUhmTooaZzstxvKuMqpxyGpqpkyyYfrAuhMPXuprFtOZaPoLrCWyAtTyjOfvsclVjaIZsipPUYrEfbYoXFCYWc",
		@"yVfFMFdITq": @"ANNrZclPzPKfmmIuVqrtXYQFEiYSUyAwZEuRIlBZiWKTyQkcEWPHPSVjnBoordAadVXFwEyPvtocWEwBOakvfXLLXpzpYJEzcxgveAoqznpJimrVvwZDbXYwywgwoUbLdVouvwhbF",
		@"QJNJJMaAIzC": @"qnoPGECkKbgnjdsWOMrGuzFYRWvWVhNyEDxkVBLGnAOuxmCSqnBRJXfUqXhUGTPOxJbHoCIniYoMbmvVcjtdElwScuyUAQQkSipvrYMFGQXTHOuJBLJpDtVtQaYteeagMhXVVVrAIiTrQAJLxKzp",
		@"zvYkWzVxDVBktT": @"qPJDSZwRuiJlYgvvLvlwwVQvhHVIwXHxSuRlKOmXVkpBainKugPdlhEEpsGdkkncxNqLcNQMZagnQszXCFGbbPzneeIACtXdkCHVIRQkRoyqBVbWrKkw",
		@"yoKEapuanSUrCmd": @"hpnMSYCUPaHFRkfIvYGNeABhxxVyBTkZTlbciJjSXCNqiarYDKuzQlZsMfltSnsWGCikjcCcGPCcuhGEqmznfRJFPLUqlfXItrCOqTlVjTcFpZzPOFIJhaQCHyXzYkXnvAXRxD",
		@"NRSpicOebQIXfjL": @"LfmxJwbTkgyUaAMEYRCUQVViXWpavhZHaKfGITMGlVwnqykqUhhtTwKBFCTvkUlfItUQVEJVVZJhFdrxXAZItiStVoHZdGWvvawMsObQJaNtNIWdtNQTZS",
		@"FAiXOPagYPCBdE": @"gpywHhSNcQfaMLLJUduYLXkoKkZpCczCRpPcCQJSiUcBEAfihaHrpYajkfOSUiOIFWJjMXEcnSKXRGYqbOKYaimdLfSObyHqvbAGcdPejVxWNTtAySqFpJTgZFynOUsXNNV",
		@"ZNjVMGMASTdEQSBm": @"ALMpDgCYnqZVOZnMCNRLHSPvHLHOpyhgoDhwDQlrGwRCkwEoqRHSdWHtLvSXYhIaCndIaHlYgUugFrPHfCVMwzJXZOsWVgVfXYFaHoIGxuEdRqyeYrNaqJ",
		@"eTbPqdGPTJcxTz": @"teCArychFcMhYhgueFChNNbpaENuTTWcfsFTmmNHGHRYWNUbOmgfoRltyFpwHXKjZebOCbwkXMFoCGhgAvBPwfNcSXatGLWqJKhZJswYXTHhUuxhTGkgMDaJlHLRVnrULUtBeuoOepvikg",
		@"xsNJKjGrAZUziskWt": @"acvNOQRgAPmgukcidhwZDHDLIkOrQfUWKunwsBLFwPAfGAaBKCLBRxTNVgVTyscJboYXlHpcVnUfxHddECgyqKrZYfgmSeEEWiKnTjsxsyrGXyvjLufLUjSNQEWWGprUKvcD",
		@"xYrVqJDytlX": @"KJzUPtDxUtNVisiytpdRJhkIbpeDjvtrHeOYNMUEJnbAoVAXOodXnwngbhzTJpyVbXEwwWadvaWmMFkjePHZpRXzhwnIDhtXFGGwNJqlSgtsWmoWZSQBbNZAkolTCLIyKopqWtBUWTdmyVGp",
		@"gTEeDbyIkSogN": @"mzOACnOAgFcKJPAPCIreUNGGLAmbqEfmRnVyeHUNLOsIqoNmLHhoBgkjZjAzwEOAoTbSTrXjJJVgNXGAvdtQClMnpStuIOVazQLCsQsterqGdubBdo",
		@"KNDogJBSNSKNJdmGPdF": @"dCJoROAIMWvXgagIDHTvfbNYHWBmUArdpBkMAlMYHGORXTwrMAyiEkIxWGYpFPQzrXMATCsRhDuxikHCJaBxdVYRWknQAlvKiGpYcpJDzxljLKoZjoDviIgxAkWKTZzXZgEFEZd",
		@"xLaoViAuIjp": @"UmcWRLGNlNNcvOHLPEQptdRpWVLwPIgfdEzASipWJmDpWVSuGPzMUMjDORIfVXJUiUOvztSySBKudvNpmQgSXBHnHaCsxumsUIBqMIiFSAaAta",
		@"faMyXidHfbQG": @"CqSKmEcPcSlwFZyQnbYReZSkNrRuhBIccAHKjjmaGAJIPgWjAdVUoIzKPMUTGvKwEQzMSrvWwzEnwIDQNLgRAzgbjGWwhrFNRPFaWVCAGHZRVt",
		@"vZLEepTsTlrtfttaqTy": @"zymeXhrBnCkghGXpoeEADJgiiasdsCcXjQxdZExhUBPplEAzUppuMUqjwdCREjLsKGZdVxVXRNQGebXODYQWpIXwFdcgQQBzcETinbOKGxDKNERUUwuLEvWdqmVgtuxnkpMuhQbci",
		@"WteCYNKfLaoVeHWe": @"batQytsKqfcSczdEuvYZzuBmYXgxMcYXhIiEtLjRbtSdcofKbiRZmysMRUTttMnEkiUNYkaCHztRvfLGRUChBgbVdxTbKJqsDUrwTYENwpUWpRSEIiGM",
		@"skCsxjDkFXATNlE": @"OwTxwIjygEczUXkMavXwsOMJXfYAhKycDCpKnAHqdWGVgBByZticSJJDxmwCGqbammWdinkgCmfAhPHRQCWLsuQEynVBUfqXisKZTERivwEqaqjExwCklgZIaTdn",
	};
	return khuXOukWfs;
}

- (nonnull NSArray *)LJqpYQYjmdxeZb :(nonnull UIImage *)aOqBVkUTHayltAp :(nonnull NSArray *)hNPGBBEjHkyfOoU {
	NSArray *xMNHzCRosXkN = @[
		@"xGhGNLefmwCrjnQfdKTvZFVxcJKtvhBhmnUbYTQETgGRaiqqEKcWttnsCOumgxaBpDDfYdQGzFFiEYAMfJOiSiYigOMfHycsowoEzpeM",
		@"MwRoVOJTrANGNFypCPypzyGidApFVVxMRJjCwJNaBeeCCXfyimeHzQgzRbTCSXjYccnLCJcCyWfefTaCLiUlHlcayqTPFBlBzfHraocqqzqSqGGiWJuZOGgjfPtQpFlloMEyjvZ",
		@"SBFUCuogPYkCexflCfJnkyrfIomwAuUzfDZuIzoUVnxoJQoKdjugaoCkArUgxpUGrxfPkoksmUrXLiZLaoGiKpLagNznCXyBUUJnYfwXGUGGiWjrnECOwovhuOaKB",
		@"ywDPstgAtwlyiosfnWuaaqEnCpiIYQeXudeBistvxRFTlELkAgHCnnKLWNTrXDTNQRALHVkqKxRVfXWTaqxbImXQIRffglrJxiUrdDStdEakRdbiJGfBUaloCSmjsVMMce",
		@"AftVXyecsLIGyGPioMoHqVwOoiiJkNUgbSGbPLdxBGLxtzjBPEaPcpMpQeKyCIbgxxFOBuEEzEXqlxsGEQJOGAADMNDhGyjLIMbA",
		@"NJGFUXSPJugFApPxqARaPKzqxJJGayvRnuYUvzIAHcMoYiCyuIGUUhGmueYpwNDKekgZFWubxnfehESUKrSVupAWUqkijrGzBqwhHOBxJJOpGOirkCvU",
		@"wmOxROqLYeCQFVWQrQYByPkKXUGSqpXpTINdKLeSrNwgEwOBtNqtkcuYfHOWKTAPOYbDmpNZjZHQzTPRjXJPQzyORlpupaOiJQuugFwqixTbBKJ",
		@"bhGutNHITDZpjYkOpeRIkUJjBMfeOATiOicTjPBlmuWrIidOdTcJEznfkpcYSIszqddYdsnnCAFawhhYtLIaCrLRVWFbyoXlINihFOGPAwEDXycziRbYbLbUBDNllSWTWdJqUggRJWhdRIBCfemD",
		@"bFNbkmNMvynvZcFdlfHFvVxAyGWEbMSJtwcbgeylQJzHPridSEgMpdmqoMZHzHujlBZuyluObjJEOGqcLFcDvTQKsFmVXasGohYQCgGhDRwiHJkHXfzzkrpKnG",
		@"tLaHIjGPOYPAHluRuzUipNwEymLullBMSCvcbKErdIxEewQzrrixoyFUSIsHulVryYzDXwNuWaUDHQwUTMvUHKKQfKoqfYMdVkuwwUOymoEiJRXj",
		@"IUqAsJdFZYYiVSOfxNxhLqnyNnXTldquSJIBXaZWMmLIQwuyyxGlHABXIhDkTdiBZRGYtnZMfAfiHbrXzRgVBHAYHHfDPRULQgfWrArTliUTuAbqJWCC",
		@"dHASSVfxIDSIcFPxRkMvroJUhuRwydTLmruyyqCOyhkWEkYHajYKnmFmepbhQscicNHPBCYSXIIQIQluxYyFbBBEoBpPosgaeCInXMRJChDKxprFUucsAdQvOXqorCpVmGrIdFouehaZCsZsIBiQ",
	];
	return xMNHzCRosXkN;
}

- (nonnull UIImage *)eGhKCPJToFTR :(nonnull NSDictionary *)sNjfNJeIfiVZoU {
	NSData *QHOEgTopAuQNhZewWf = [@"KBUlmnAYPUjlrKOYphLWIxdWxMXsPQGBWOYWDvzyRXZAzYFIotUOqXajgriEmaAoMeRTczOxEJjJGSegwZWAgcWGglrxIZDasfzpHueWWeddMRPkENtsyyeGUWPzrr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wblMzsMPcoV = [UIImage imageWithData:QHOEgTopAuQNhZewWf];
	wblMzsMPcoV = [UIImage imageNamed:@"RoeJxYYMmEXIVGRShVAmajvGsZxNBBFgOAyyuawdDtzXfJgiRCHShsSDhYpVtmKcFkuCWguKulynbQiCroiKlbcBwSBDWDQyYNRvRxQaOqAKtGWNpaKhmiD"];
	return wblMzsMPcoV;
}

+ (nonnull NSArray *)PJSbSAJpOnoys :(nonnull NSString *)QNfjtOtjBk :(nonnull UIImage *)PhEQztmBLC {
	NSArray *lrGWHWHWwdJNHwXys = @[
		@"AdOVmQaCEwcxDBNodqreNRStXOiprpbZHAZaMNHTMkWOSWdJggkryQFPoNSWoEHewYRWliJWVfSrxHjuEosTdeiscVUbjYUIacEQbOJCQLDnpjaKanWpNVFJzDJRGdQgSbth",
		@"ktJnWeCngJGsledxJZffeIFlNlmSdkTzqDxhZBHKYMxJKatvaGIZjanxlnzPhpEYGEEQMGdcdfZrqkqSGjksmfbxHQnMtiDGgXcCLIvrfEOjEMjy",
		@"OzwZLObhlZVCHajocYolRqcMMHllQhEwHnlSUSatVslcgOyKqZUcYhfvmNGzUkWBDZMECfeVZJtvmclhaCTQvwOFAxYNUTUISFQj",
		@"GBIbilFjDyPQZZsHPrPgxJmoRZyCwTyYndDeeVzpZEsnVFqDOXXbpdxTxfyehAxCwKxWySNYtrxLBZOHdFpSDZhdEDwyVZQkQOIOcfPctHcyyvNRqLiYUvxq",
		@"EdMXifjJnbonASYFelNhecfxGaLTWzipEZMqsXGBewSWFDpaThkIaBjTXHyHbYiUuMqzAahyXMFGmqbsmazPpTRqJXKMVKpNqZQjrKBKHiivciYhNnzwvskgpsepRlmMLBaWHYUlzfhI",
		@"XLrphCyqeTQLRwRAVOdDiytIpjKKNfPxwQseALrLLZKCHNCRywlHOsTrzOEMlslpTHMqkQrcmoerUNSOyVGIaqTpgAkpNyaMWcmzgbwPOYPgcafCtFNLoYYI",
		@"hjtQSsSuYQtdFvOFewtAJzkUcaVDkYUNKiwOWqnFwkWyGVPVMKzWvGVXEBBmOhqZWTzJpAKnIgvLouONABrUrebHMGzMgDysOhxfwmeRCYgOwFdRSoXIoScirmFtjnUjX",
		@"QfdRJnFQAIhmLQIQYKtnksnjPgqTUWvATpHeDkFFCCOLUZpZCuekYizxSKykpyBaZDIkwnFqRSLlaIsrjQHwgWpnxrwPhzRIhDpJzeqayuhoAAoTWdTXAmNNdDvEhnS",
		@"IJIClmgaLzhFaFaXalZsEaKyVVcUlaLYLDyRvmSwDwWMRHcoQxgbMbrmhqvELamVoaxKkgVdihnjSkKhmTMNxInKGMdVMWsaGdZcowckgpIkcTSCcE",
		@"tByKGzeKYTInccUizdMBTsPHBEehaxyWAaPIAsYDGNhlyukvlMWHVtDSdhLksYRDcIulMeXyodQyPUdUcLAUGmeVqmKucmbaboVMbBFIxnTJpTafeir",
		@"WNarKRpWxKhYFPusPGaRQfazRliPTNTjeJbMtjukOWoPMQpKELrbeNsNuhgBJhsQaQgdVmbYUUhXAQvUbPjQxGEpBjppbzjMgBlOEhFNVVnGGiXEpCpxUHTwpveOyrrCXazSZAhDvKVMU",
		@"lNiJhFLJNpEjyxbcqSvoSZOdOXMctQdUqnDhALwiPUxoFWJyJPlJVphmlVSsDBOIypPgxjrtHWIrWJpHHiwnKnvEvkebKlbCaliUTObgaxNKrnSjvUJypXVzGYnlBwPcYuXYycDmTposgXeYXXy",
		@"iXrTtfKJYbOrbXiAwAfPBGTohxCxxEIMelJFRnzQUMQlPlJRJDwyyVFjaUIQchfqavjNJWmmnGOUZQwppTPRrlZMWaOdAJXkDpKLOdBfNAjIBdmNjHifqaEXRPaTh",
		@"JFkKkmNpDAzBOEcHbZrldrMREqlIkwwxPljpgPXsuCnFtABKFTFYPNRtOhJjzuBrtvogIidExovRQyEOjpCstiatSLWhUNZNHDBQt",
		@"ptHVMqCwwQUxbGkdZQqXBpqOaUywefUMRNBxCTpulzYbMEGNMXtkoXdgfIdukCPupkugyBGYmJwnsLLaNCHOfUNOeaqTrQWrCmHHJUVEstmSmmntcblVVYQPAlIZgLQXuSQZcOsIOvCeiZpMcmzLb",
		@"mjenQwvjuBzlUBHBBXfIQEOrRSrxmcbUjxXITkMrxBTGPEbPRzAaHmBPzzhQRlXcMukVTJJAdSqenrZcMtxUmHPUlIKivPRhDSVWJJVqttIHJp",
		@"yzhcAZzYTTbZdEEZlWGWcgSlTcBpUQwgoQDSWJOlMyXwSIOdVpxQBUZdCImGWnEDoJUxrWIyAYzqYZHTnGoeMTLaDsaBTcoUtiFrpXQeufGLwsUw",
	];
	return lrGWHWHWwdJNHwXys;
}

- (nonnull NSString *)DerlPDcCLISEPgq :(nonnull NSData *)pczgCwWfNqFpsqe :(nonnull UIImage *)LDSenQvlvqzdlhXyyui :(nonnull UIImage *)veTMVUOcnapI {
	NSString *mPyQIWFtIVuB = @"IYubcZZeNMjtaLgHTWhqHbaMwLtpbxboobnCJbQWMISduHHQiTkHUcUVRAkQLXnQQEGxPTbVIyXiQqfdKipzljDfUIGocWjlsUzR";
	return mPyQIWFtIVuB;
}

- (nonnull NSDictionary *)GXqxsDuLRxSgkOxVks :(nonnull NSData *)ElPRSMcoyI :(nonnull NSDictionary *)xLfMnXIzgBeG {
	NSDictionary *meIwdlSWkuDYQ = @{
		@"xRoGyrpmbpSABJS": @"eeAnlQJPUyJuNOYIVuPRUNDbYmOZoGpGGBqJferosztFBNUMlMNzLZbOzJkVzVjvziDeqXhySWJXyEepIPXaDxJcwdQFYdprdsjrMOHWsZGDlfyeoFmCkNydJBnLYliKUCDaXoruMszcxfpYXlo",
		@"STGVDNamLsrSBed": @"ugCJVaizBzRneXpbKKYCCzaoUUqMGxaAITryHsEDwxlxWwxxxssVQCrBSRQYBpXVvGHJOFRyFPsCvlfmvyZfbnBoLXRSlJjWLAwEtNUNlkZpBfoEQBBUou",
		@"ntvUufVmATO": @"jmfbvKMGrgyLDbDLmVzRRIfSxDNRUqYBWdTEHgrFeTAJIbjMRHACRhXztdaBFtlUxjePfFEfarXeIVOTDxXRNuGhVioPJxPujXhtsxqHcQaTTOzZzTY",
		@"dJTdjqCqpUAfSU": @"PWsrbxxDVSwQbBtFzkArlPkWiOnvbxaeSdUvBqTMIxHYIfPQmoQreurTyTVWvodwTOCNuOnyvnmkIxfdUAxoCRUVwQvdxAVUNeeRoGgeeQmDU",
		@"KghPuTKWYFkSFyFA": @"idaiPVGhrpJOAsiQhEgRwZLhaWibQEowOEhenvVwHyrpUEadazKeErltCleLZSqoDYueqLfwctpGzYgpOhhfLmEDvtzdStEvAVEtKGcObPlIkLaateFZTohtJhjDUdprmXodlzqyZdIKj",
		@"nxzxjWZTYgJ": @"shpSzrhGOmYKFmSSrlieARBxqACsyxaSNHmClIsOrAvfqeaFFnauORJoOCaFtOGbEActvViLkADVmqEnlYZmXEACOziIeUKUDmPHpNUjFmsjDFidcrONZcZsSjUsKIa",
		@"LnSmUafoiqCIYdU": @"tUVnHofWcuGhSUjefcLElGnvUavXROyIsEFjBeLFMIsbEJyddOUfyAnioUfmmjlzwEsEtMFwkmPFLWVZMdQuqOgmEiygqSxsVuWxKjAlRYbvxzAiEprCMJt",
		@"KwGsLGFkBvt": @"QiiTCCYUEQLXGcZHVefQnRaIUeQFvPijRqtyRjQDbcvBmufXsJmJfMFRdiNoqYCEpveFwCSPRRSAinGyRNxUNYLSaZGdbcBMBZSzxfQhtwcJIzfjSZsndEYTwszjHOLFdg",
		@"NqxiPfJdmGDwB": @"dPFKYwTpQgFCEIKGrxYfRyjdsenQrGKleomHwInaZmlFDoeMZnpNlDLjAGRXzHkdxnFBNSyINUIKrKolxngiMNnEmwfZqTusRwLNwIHWGUpfuKTuafzRZrOBTKHqhFyrSVIUFOGsTwpRRVe",
		@"CLHVzBGfoIOWxEDb": @"ofuvGGtBeobkOFTGIAKIEjPvOasrZuALOHBEXJuEaBflLJcnmXmAWNgAHJFcgNBZGUkzFNQWShHYWUVcwOQRMdzYyvODBItHRjXjiEfsUnFuoEoggSAnFwtBvYc",
		@"YcgxIBPOEDuWwILibst": @"BeNflOEOmlCXdbCmsovDKmwkgsdEVufITvRFsYgUXXLAbJMDRpTnfdrUAOcoLgkmagrHLozVhHmIADrwAsauxIaezKIYnFUIcVEUloaeUOusdpSyTPvQWJihRFSqzl",
		@"QsWPiaSdsuVvemLEMZR": @"NWujiteFWezSSoFsoBrODKpeEfZQpqFlxkgOMcLtnaynsiVeygVpVZxXwPVwayhASyWjYlDCFqoAtnxeRCkwCpWJExxMtDFLFvlIeDFIQWdUVccZtHBPkwDwduftYIIhlLQnRIWs",
		@"UVJmywNYCzWMMef": @"vPmlclMoSjmrgMQczwMNwHWqJSXSmtMmmgkcFAUTgNEUgcqPmBNeFUfcPinsZAmfnLheVQNzKYVzmOFsHcOsJjvlNsHNpDUouUxwZSSwICbSwfYQbBtsFycdiGbvOnPbZUvcTWuYjeXlyaN",
	};
	return meIwdlSWkuDYQ;
}

- (nonnull NSData *)DdGMurGvCBCZFiGYSob :(nonnull NSData *)tySipfpztZe {
	NSData *pEZmkpDhVDpCzRtH = [@"iYYEsNLnCDgznPskobrlApKtpwcTJMOoluPVdoySQfbxtFsMUNnzUbKTVcpHyaskgBJoikmAiTXFlIOgjGmUvoFFtNbXzItQwQaTLEROrYmTewellyGaixEDiirBeXSQDFZuQopDHxdOUJ" dataUsingEncoding:NSUTF8StringEncoding];
	return pEZmkpDhVDpCzRtH;
}

- (nonnull NSData *)SExwhDasaaLvBxU :(nonnull NSDictionary *)LNEYZownvdOEDBhI :(nonnull NSArray *)wldauHqxXbWVUxjUPv {
	NSData *zywNXkKtxedxCQ = [@"JyxrQYhPTFPMYyzEJmhDWjbfwiefybrdWBMxFiXHSGOWTFsSWEfthpoifGjdJkQWvBgOyVhEepmgBolRQfbEZZwBJLHuqkYxIIpqiDyFodQmUIJTlyGxKRiDvgVyHkhltJfOOsOwoojR" dataUsingEncoding:NSUTF8StringEncoding];
	return zywNXkKtxedxCQ;
}

- (void) setUpUI
{
    UITableView *tableView = [[UITableView alloc] initLineWithFrame:self.view.bounds];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.height = self.view.height - 64 - 45;
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    // 设置header
    self.tableView.mj_header = header;
    
    //上拉加载更多 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 禁止自动加载
    footer.automaticallyRefresh = NO;
    tableView.mj_footer = footer;
    
    //没有评论
    UIView *noCommentView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.noCommentView = noCommentView;
    noCommentView.hidden = YES;
    [self.view addSubview:noCommentView];
    
    //图片 + 文字
    UIView *imageTexgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, noCommentView.width, 129)];
    imageTexgView.centerY = self.view.height * 0.5 - 45 - 64;
    [noCommentView addSubview:imageTexgView];
    
    //背景图
    UIImageView *noImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 121, 90)];
    noImage.image = [UIImage imageNamed:@"kong"];
    noImage.centerX = noCommentView.width * 0.5;
    [imageTexgView addSubview:noImage];
    
    UILabel *toTestLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(noImage.frame) + 5, noCommentView.width, 20)];
    toTestLabel.textAlignment = NSTextAlignmentCenter;
    toTestLabel.text = @"还没有内容呀~";
    toTestLabel.textColor = AuxiliaryColor;
    toTestLabel.font = [UIFont systemFontOfSize:ys_f24];
    [imageTexgView addSubview:toTestLabel];
}

- (void) loadMoreData
{
    self.isMoreData = YES;
    ++self.index;
    [self setUpData];
}

- (void) setUpData
{
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=%@&count=10&token=%@&businesscode=%@",NetHeader,MystudyList,[NSString stringWithFormat:@"%d",self.index],[UserInfoTool getUserInfo].token,liveType];
    
    if (self.isFromSearch) {
        if (self.isFromSearch) {
            likeUrl = [NSString stringWithFormat:@"%@%@?key=%@&businesscode=%@&index=%@&count=10&token=%@",NetHeader,SearchKey,self.key,liveType,[NSString stringWithFormat:@"%d",self.index],[UserInfoTool getUserInfo].token];
            likeUrl = [likeUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            
        }
    }
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             NSArray *models = [HomePageModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
             
             if (models.count > 0) {
                 if (self.isMoreData) {
                     [self.datas addObjectsFromArray:models];
                     
                 }else
                 {
                     self.datas = (NSMutableArray *)models;
                 }
             }
             
             //没有内容
             if (self.datas.count == 0) {
                 self.tableView.hidden = YES;
                 self.noCommentView.hidden = NO;
             }else
             {
                 self.noCommentView.hidden = YES;
                 self.tableView.hidden = NO;
             }
             
             [self.tableView reloadData];
             
             [self.tableView.mj_header endRefreshing];
             [self.tableView.mj_footer endRefreshing];
             
         }
         
     }fail:^(NSError *error) {
         [self.tableView.mj_header endRefreshing];
         [self.tableView.mj_footer endRefreshing];
     }];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageModel *model = self.datas[indexPath.row];

    static NSString *ID = @"HomePageCell";
    HomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HomePageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.isCourse = NO;
    cell.isFromMyStudy = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = model;
    return cell;
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 106;
}


- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return self.studyTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageModel *model = self.datas[indexPath.row];

    NSString *uelStr = [NSString stringWithFormat:@"%@%@?liveid=%@&appkey=%@&locale=%@",NetHeader,Liveplay,model.businessid,appkey,[ManyLanguageMag getTypeWithWebDiscript]];
    
    MainWebController *vc = [[MainWebController alloc] init];
    vc.url = uelStr;
    vc.webTitle = model.title;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
