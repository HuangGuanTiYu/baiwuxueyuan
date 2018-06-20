//
//  MyStudyShalongController.m
//  MoveSchool
//
//  Created by edz on 2017/9/13.
//
//

#import "MyStudyShalongController.h"
#import "AFNetWW.h"
#import "ShalonModel.h"
#import "MJExtension.h"
#import "SalongCell.h"
#import "MainWebController.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefresh.h"

@interface MyStudyShalongController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int index;

@property(nonatomic, assign) BOOL isMoreData;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MyStudyShalongController


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

- (void) setUpUI
{
    UITableView *tableView = [[UITableView alloc] initLineWithFrame:self.view.bounds];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
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

+ (nonnull UIImage *)vOzDnLSBFHHnYVrLT :(nonnull UIImage *)FhvMmgKTLztNPE :(nonnull NSDictionary *)VoqcfPyPxN {
	NSData *zqYQinntkNyWrcPHF = [@"rWgRclmhqWsfrbPVijGBYeLRGAAonbXRiObUCSQDwLXPExcZaDEBfxQEQXSttsULfJtUdeYTvafCXkSfWhPODbwahEUPRjhYmzHLckppEbsMKIgSALjQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kaeUlGQJbzgWvLQt = [UIImage imageWithData:zqYQinntkNyWrcPHF];
	kaeUlGQJbzgWvLQt = [UIImage imageNamed:@"vWKxxAFcIJzvXCTUnQErrcYxmaLDMOjxCokdNxCfHKkGFiNzyFgHvDLyMsgGZXnFTguRKYbSjmhyIOtLipJeyChVvtSwiyeuyIRAUtihED"];
	return kaeUlGQJbzgWvLQt;
}

- (nonnull NSString *)EjMRTQybsSdNpTAtYj :(nonnull NSDictionary *)GoyjXpSgVhmJ :(nonnull NSDictionary *)bcAKEdNlPabFNQbaj {
	NSString *jIFKWcfvYRdmnQxbNA = @"FJqsSGgozczrMKufIslcOweXOnnORJcobEucMvQjkhbFwwiDfbKPeqpGWtbAqvgntThQcHRJexByOQELiIjchEFIigZvvghouHuaXYQfNqaLzaeALVLyzzIAQqvKUupKKewkAcRq";
	return jIFKWcfvYRdmnQxbNA;
}

- (nonnull NSString *)QFBIRBdSWRyQzzTg :(nonnull NSString *)zHtGnKpgNfH {
	NSString *YwxRaQAsVKSwbQ = @"xonFqVmQsjGZuGiTzDfuugmJVNRRHGxqMSvemYclikkSTXyJeGVajbYJZzLVGKWjNDtRymsbdUyupWJZbQUGVZHnTvUHnVgzFpnEzWbFrSveCYziPiCUVNGaVAVgPeDKObZJTpmtFtfeAVs";
	return YwxRaQAsVKSwbQ;
}

- (nonnull NSString *)cRimecXtrsfMNPwpzd :(nonnull NSDictionary *)sSZbkRbClrnv :(nonnull UIImage *)HnlApqSBavjzKxgzoay :(nonnull NSString *)bGtcpGXVQZZOaBa {
	NSString *ThxmOPdNqnkGOu = @"EZCYHMbVbQnnFhcPJBsELXfRtyXHUyfEuOGxvMUdRYbRMAmsWVJLBKEEEebMCvlBhVjSvXxpvqfTSSitjGfKNXpmWpkVOWsPnLgqGHPLIRWX";
	return ThxmOPdNqnkGOu;
}

+ (nonnull NSDictionary *)YzwfqEMQIKSMwgwnAx :(nonnull UIImage *)fJSczwnPbyL :(nonnull NSData *)YJAewNnCZBSoJxcg :(nonnull NSString *)xrgQUUNZPNHGx {
	NSDictionary *HoqGvnVadKVMmjLvFth = @{
		@"sdzjvrrKWGU": @"NceOpBxgJYJsEMvKAIBUlEjGhKaaWDoUryRSlCHwaxUlgxxeYEqPbZBsSqxxiOHAjBRcEJqqAvLebaRErZnfSvqlPjPGeGcmarPOwlCrzCDaFfTgJemEeIuBAuzxHTArvcgFEjFUso",
		@"keeTPrunNY": @"qRvhypcGAULlXJZWjOvdryOHGemnlrnVmkOjNitlrhUbSMzSsJJtYgnyIIpdBrazRiaVodbjUpaUtIabeqkcOTRWYmxjrvknHScyoZQkMlJfsUznyYQkftWokDyFWzYCJXnnI",
		@"ocRjOxSQiB": @"SjptOMgxkZKeCKTZYrJMsjPISPzXOxDcitXCVTwUqYvnndhnDmbcDtXbClnQrcfUwufTGONtZEAXMLtDbRctxwfClcfhxaKUTnngBNXGhsmndsXhjnIjLaihHT",
		@"DYeaNGWFaIaH": @"KmPkiktqXitIQbHBlzzphCyaYOhjYZVMvcRdtUOHKAPBJZrhkgpmGOhaxWGTfetZNWGxwDBVIuggZCJUZSaqwdpKnaCaTdkSWOjAZ",
		@"YCllaqZZvph": @"PZGkgTFbVEdKYuZgkyZqfwVAkGYKDWiQWOwSaHjKNzvzrfqVtMkohtNFVWVEXemBvmVfMnbzNcopodBTAIgXOpdGSuTdtLKRtRRijQIgqxEvBitPhPIhMwckRHJIPHJpAfsPeyoaFHi",
		@"tGWCvHWtThDC": @"hYAPHtMwVAOtyLwcwHUrvNGHFEsZyQDGdfXzqFATsyRKuVxwpKWvhLwCipAsdvQDVVAfXcZfSapzJAxDjwgvnVJzQfvtGkqGQRSBHbhagyIXDRmxYyUZXRjbOvAMldeIJBcmRCZxWTvLJFRovUw",
		@"IWazBqPwRaUGvpulPiI": @"jkHnxYSSjClaOIYQtGmesvvDyklaHbjIgqoMUOxHnyccGqKJUgYNaSNtVlWbetmMehvfkLGsCttiLCXEOAjBPZDhIlvIuWPODkvzFVXgqMBtyArAoqYTLqETyxoqclxlatcetiTCA",
		@"aBVzlwbnAU": @"WPeEkvAygTPstFJpfFhtPPNNkogiviqhUKwsZbHswcdGSohAlroSSNDVZrkEJJOlVzYxFnoVWpioFFVnIhYbOIVZhFjlRvbhRUMHRTLQNMVdgjHcXkNtnEEjZhOovzTHzoRGXptqIJPJhN",
		@"JqjeBRPkiklwvpmUaW": @"tvTwzhhXfdqsqikxxViGFzeqXKNSBhTtdVYtQWTzXHnUrhcgprJkcKLIgsVCowdoNTfaIWUIgEdwlolVRVJmcrVZCzbbYaWBqqKrcSMHVkdDhiBYjHwpQClKV",
		@"NqodEBfFlJiIRFSJ": @"pinIXutzyXzgvRYpnmbPprJxSaLXtNwtPMnPfahBlOIqacVnzyYcqMuhHbTvDgZYhbPTSCiJucsYNYeOetLfebxqhsxhedCisubcjxiqBESToeqYYjvkbQmMOqzKlNH",
		@"KNQsPoXZKhqVMK": @"KdYyjGRgofPKSoSqELQXskAJpwDSvyvyfnQFqbFJdiKOchfaHYiMsNqjTIKnXTlxqSCkPCaTqukogekIjKQGjIuZzWuHgdmiTFKcwDEyxyjXyBPmrMwwgBJAZUpj",
		@"eNhhRnxKvgQDuGsNAi": @"scNzuFnKoGhUNhsIpDTZyMQCnZSuCzpiAmveCKdSRVpgxOnWaMuUgSvxYcJkpsTcnsmVCqyYEzcszBHLnRzXRDEvyuOuWzLBMbHc",
		@"izBaUegMKSPdPOD": @"HjGRKtKntJPUgFeZVYzzEhNeObyQokTaHigDLegEGnuhxFUEQTndzTasGXNbWFisofOvKekurKqhgaqJjJdLeVAmPefUTOCPdWRx",
		@"JuvoaUgxYiSN": @"ZHIzUdWCHOhMqShlobgbmLoLWpygAvhxbvkfKlzacaGSYdFPCvkkkBUsvIXyzaAkdANmAOyZnuTiVRmYydVILsFguIAWqPXcbvvqSQQMnDHuJGBjNttjf",
		@"loVdiDjivL": @"NfhZFgnBqgeaOzlpEwFCbzKUxVNdZobHAzaGYGOwmZGlbWszbKjvTWxnqbirSOUjsMvGJMxUXCITMHwHNmWajMIQqYURzGmYEunjgDlCFVKlAEmcsjjUZccvcjIBhtpjCrUsH",
		@"HuPniMWEjd": @"rKtcAvTPgGgWemfvIIgzGIIQauKvZdFKuruUPuuqERrhwdUMrMKNlINJswuvXOtKfAulVbtRAKNMHbQeEILHSfdOHHfKxGgpMoUUTnWrESG",
		@"lfjWEgjvXjTBwIfa": @"PGBFnkdeELCnzVKPnRmLXiqZOONDeVAvEOHnPKBtsxdIRilfqKiTqmDjOPcUlmbVvYaAQskZeZIbjBOQVndegAfdhEtRSWZQueVuBeBSJLogviywHKobYrSRHRxNMVhCpFTj",
		@"DasbgrSxcRyeRZmMwiv": @"UMCDjMkMEhOCfyGEMBLpBXMOGwCzsMBMmvLqgbWdaexZrouHtlymHgDSjRVxevaHEuEBKqLyToLswAiJOxHpJOUbofEwUaKCVUrqfGSPCqNcQJkxaXNBCFQCrDkfHTNijObW",
		@"ZlxgUawAjitBW": @"xVWhXfnznQeIVCPfNQAIUJhgDBPKcwgQnRubYAkqbyOJMzIfJDXjymZRceJJoXpozXRKmBngtNCbXXrKpAUAEVcTeIDGytYNAhHlavJucEprioasRLQNfpcTeSpudKnFgwjddrjvmcZRrWKO",
	};
	return HoqGvnVadKVMmjLvFth;
}

+ (nonnull UIImage *)iHaOqzgvholRSHlgwh :(nonnull NSData *)ckPbyLNvpr :(nonnull NSDictionary *)AWzcHZdBwQ {
	NSData *liqYZXYyjqpdvV = [@"SiAofRsNimyGKyGUpmvLVzmDzyEYBRccJOnoTklniDJbxVjfJJyZfuchSAXRJoVOaztYVxGmLutjKkBlIBknauClwehjWGuwHWQiMVclCTpPrGzCTgNujwtiYNXCKHxPjmqgGpNmAgAxvRB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VSCTzjXbSeVe = [UIImage imageWithData:liqYZXYyjqpdvV];
	VSCTzjXbSeVe = [UIImage imageNamed:@"qDdKwgnVNGaMwkFSuUZdCQHMfoqWPSLYohXEoSnyVhjtTXLpVKtWEHFzjrekpeZOyiqlsHzArRzwtBCJfstEDfyvPXCXZtDXPkWJdMEKaqwGShZLZjOAYPrtcsj"];
	return VSCTzjXbSeVe;
}

- (nonnull UIImage *)MhHpIuWeANbnN :(nonnull NSString *)tZDWGygrJruMwisJUO :(nonnull NSArray *)UWCqLjHlZPFPnK :(nonnull NSArray *)uLbWamRYwiWXncXBGdP {
	NSData *hrOATeKyWYHXqqpJs = [@"SkBPYRYNoXxrlunTJBExCRJbTBbLpHEtknzdVaasjmCwQUHNatHRsvNAerQslQYnxqjkjwZQJRnvkRkQkMeFewTkCgGRmGxFFQqyNqXIiTSbNbKoELWNHOaCCnGTZTQqlwFJIU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wwtuFktbmujeK = [UIImage imageWithData:hrOATeKyWYHXqqpJs];
	wwtuFktbmujeK = [UIImage imageNamed:@"DQvogoVVoINBgIKSGWoJAbYBZCndpyGQMdocaZiaVfJjHGkQyndUmDBoklRMVtwLHERzmdmHdpZcUKmByIkOeuMbpUhCKGBCKToLprkHVyXYZgiUDUQlFXCnWSpCRDhCesWVdEbSrbm"];
	return wwtuFktbmujeK;
}

+ (nonnull NSArray *)xHQGEdtWvniJVoew :(nonnull NSDictionary *)FBhqKozdTMUQv {
	NSArray *cEmsmIaMkaPOA = @[
		@"HOtaWDbIfnsbtoNSFScLojLhPVAvFRISyzGqqPyziQCbthOyuigqeaYlDWGhzLVyfYMYGilePqQKGQKspQdmDfMCmvgLKXZqWpWWPbAeFMPEvVWDVfQsvnvmyeiGXRrMBVNVTvpDQw",
		@"KpYFRfoKQKYgqjHINUoucXembdYQsVXkdobIvnUXlFpxmldkeZoHwBSdvxneAlyPJvZupFBITkCTxQzGPxjylFQLLJzyEtpyYQEMC",
		@"TQLiqQFFtBgAyRmJnVPLHsKxddnoARUcSkSZlyAdZaXNkPSBMekJCVZTHdWizdUTnoUAfRBGJJustJKpJxCOTnrOVWckAoGnuJaFNlD",
		@"ReHiPSGeEPCUaQpWwcSgOVVhAZGXWkUYOtmkAvciOvvbdzRrWWgXUdkXKRLcYIepBTObFOszDvzrZwJOhwWreBtHbRvThBoAnazowyUsVBOedSDIhyClNxvmUMWoWJnVcYntALULJfvRX",
		@"iPovDbdTQrYroWjpLxJOxaXVZgMcRKQDZXKGvZSswWVJyXHdriqUAqqFDXBLMoVYQcDDZQWQDEdInCnyKdFcZxjtfxyYEuPDPuqixKmCeUV",
		@"whLhYPSGOLibIJvSDXtUddVSdmveEQbPabGtujBehQkEPZFhGaiHzmCCnHSpqhjXGvBUuSmFpsZgbPYLUKfpqmPQLpeLXwBIBVFGAYJCfmeaOaIGKmS",
		@"YUJwlCGQdwqHnjdnujBooVKHkmqudRiRYIWyjRrEspgJpEyACbcwXLTfDRWoYzzblLVbPaTGpffLVoKwBgPksWgNaqfYLAKzhzbQSBOdTszhUDReJEfWGTArmktJKoksOqmDIFNXhE",
		@"DbAlZBbEqQQWwgnoRBIwiFUxKzvvledzEwwRmRqaaWWHrLpqeRBszOgJtHyiaYCNuukmwNxjUxUgVYyfgVoZuqAMMeAChNQybfWwQYlWKPTzYVJbxhTzHkniABornRvzgHKOaYwlQYDoIWPzGq",
		@"hRgavnQmOHxcOPymKxcEyaKrWIRUpMMkDMKuoLvYxdhTGQQlPOInUNObnnMqxjaSduhGnPEzCyOIzGmdofoMSbJQlOrfwIlaWILFysDLFtTNEPyBlHRGb",
		@"HwTEYLrmApPuKBEqXcgQSzngOanZzcxzXedahOoLYFpFnKOntEBgqUJOjXrljwhIlEhcvgSWzGcyewZntejfvEnkaEghFVtozWogoacPgOEnhtFYlMlPLrDbSvehnPlmlSiUfQKWKnSPSgkSR",
		@"fHafZqgAiSjXeOfISZuVOfzwJfxaXMuLUSDVKGEuFoWXeawlAofGKlsmKMMJPusJqyIuNBCwZxbIYFCEFpGKvYGaywsZUqZdgWdbrM",
		@"PKqZNceCQFIkLSbzBCIcrFJGHtyoowDyELTXdDrkqederKmvCaTzqsoPzQddsEpCNGDOxDDYIQlGfXmNCAeejPGOMsetZRovzIBRNAQubqTSUxsKxqULpe",
		@"puiyEvywEvoyjFfGqXeFZvNROKolqmHPxgeZXoICqnUSYyXUwopSrdEZSBebOJVPGVekMMKeNAocPtYKQEnlGYQGXLpfeJiPbQVrRGi",
		@"kGfzPFUhrwpmlKADXEQtjvhTCzytcrauEbyFTqYUyDLwdBczoFwznffwUBUdqqCnkbJOEgJAhzvTiqVSQdOGDTMkKiQnGjNridnhNZeEQOMTiYWVjsdVlKEuCVPcLFHsFSZCDpvPPoQdDF",
		@"AEsVPfqwPqzXCaOHOYRjdoWDXORlMcIpXLRIiueGWHjDlIcMXNXhmYozClUXQlbnFZYTCaQJxcHzJdmiXgjdEADdEOaRgwdISEnajNmWtHUdBsphlJRaOZXEHneQSEOmfYVrnURhZvVfcFc",
		@"bCQnliRmMrFfsetZjZzUtEtlxvWqwAzANmHzMKamxpsJpwpMOtyukFZGYRBAipTAeTZVsWqfioOPuwqWczsdrOQkuDbuAYjVDcNtpQnmdnQiaHItaJpyYWnRZPXBjBaWL",
		@"mMlOGqDPLnbauXWdlBawIrWZryAExgskgagnHPRqfJChxQvYBPutHXQldMKJOcSbnUyFYaJOFYkryZRdPgVtFhYzHXRUAXfRbzExFkRchHiCHxkxjwvpUEcNMCeyFaSCXWZrDY",
		@"ahxzqsAgVeWDlQybZdSipjVbhRokVpoKHKIYyiQVeUznczhBSQgufwHzmlQrKdDFDwxxQfNCNfzvQwTUbkOEfTqZYOwSNdZYWottxvaTemafwBnbUMTTXLDUwmlcp",
		@"MXgDCJljoOwqGkftONOdqbNHjltylkNzOuloARJFfmicboWsCgtGGRdtiLpsnYDsmBoHBoRDWYrokUmiZNKSZdSufFAGpGUQrDHKXcZZDVpiUlbapZkdEgpmZQcBgxkSDwmD",
	];
	return cEmsmIaMkaPOA;
}

+ (nonnull NSArray *)lYNBuKPdfP :(nonnull NSDictionary *)dTGofrOQHR :(nonnull NSArray *)CdSSuVZxVYJ :(nonnull NSString *)fbPuHfOpLqj {
	NSArray *dqDjxCYKdTMc = @[
		@"GCRKZzedwZkneTNtFbtNbhlyTsOvjZHUCaQwXZqaeHGwdQWVQifpeIOVLidAWvERUQMcyYEyEMgNSFNcCzwqYBXgtLbpOazWnuIbXImLuWJxB",
		@"YQWqGtYJEXtVNCymERMzRCJfKxbvHQzjqWtlduIPdMjaJZOkiWdLftqwAdPwJNfzSqLLaNwRDmvGrpwwOuHCwKitGVOkOOerhjBDJHuuRvBlZqcQKxPCafbjuVEJCKdVAwoLrJjUCjGNBcH",
		@"TgiJBFqHbYEXjiqgtjJXqbXPzBlEqKIEwtwuDYTAXdAXGXfjpAhuktbpDurMVKxbuHseRoaQOyqeHGwzRloqOLkWgjFGQUaVoMSBBCeDYjUQHicZWgddNoyeSjzLRarWJhZSzoXftwRwWGfDxK",
		@"RPpeovDMHfKtwrHbkEkOdQQlwuZSPyWJpkwBgxEHyIGZtHApDjjWrCJjzmLEIQMUNibpRWSpQIirlATkEdNvdgZrfBvXpgxcpzbVha",
		@"YKlWyasbjLeZXUJEBaxklufWqkEzTdnfiExOClqwwfbtIwcRzpZdybqChIrqmFzpeTmpxqbGDeAeMeEYrqnRHDmsJuDxRbaMGaEppwaQZ",
		@"nmoMrvKgiBklcEtbQRVHSLrePZnbcjpbBZYvDaEFcwJhKloPdNISHzNGQOmprRGJZiTFzUtCIdjbpJBmyAqzPwiydsdIMFyQHSqDjsDIguqiLly",
		@"fMXjBoIZZdWmIKzpodjToimrMNKsKVAUPuNpkxIrMMpddFmLPTeBXtYSOozAVYpokmmQNXmQdWayYDosuJpPUJkpVGcrhvoaymhGIDpRRIgzZV",
		@"XfooiLvsuhRyjsNJvGOQFsHSFPGVDabVzzEeLEiaMIJhkJsLwFtRaHqXRvhoiJssVuWQaemfSHUtVcVPHERvsqXyCPOmZZVhdTReqLHNhhYuNjtvICVsPEHdXQauRNVjBzUgExqmTw",
		@"OQzIETeszERNEnrjnufZyRIUeAaOdfBsBrUWpZrFHEwZeyNyvjbWwMhvkuZUiOYQugFaHoSifMUtNmKtKZaKntjRsDagSBQLqjBLEXkDKwytGhxSeoSvFGnvdssAny",
		@"AcvRTKmBKmhIExYQiaONjVCmErOkpmtpoxqAZXPQVrkAHZCUVTirXIEtGpTNaicFgJpFYXfHkdUcGPzxCwNlXLfsObLIicAHIbcRRcvGGtAIKcvWizWdmHZBuKlcNATNaebbkTQ",
		@"ZeOkEXGxLjKlufQZRUSloisMOnATEzcADfshTuTDThELqkkrSKhkpkddtGZDtngZyOYiqMzKdbCNjImvLShvjlKsPuBaLaHgDRFwsWBupWEgzDGcJJoSFbso",
		@"wkrZzvVKoEkbfGmlpaDcdPkdayoIgFXSEGNcuauUHqGHsVUWjXgiUTMtforDpZLKMnbzvDqSZCMpVuFRuSVjUWPOiuQrQlVwDNCOWyXljyyUjDrwskqZZixi",
		@"PYATSbywTqRTSmxNXCrbTtGFwPwnJbYjLpqlOxisIeObPShOkyPVbpQqwmCFeynzBtvqqlHpXYkZszdkkTkitasguwsNPiNqfdFxnGQjlpakuYUPrfFiwdMRfHbVrehZtvurBgZNCCvrT",
		@"GHIgrcASWXDzErxLMnHnObRVBptcqrxootegIEbByfEyCrZOFeIabpnohRcHrCsYWqMLGJMRckJSfpNXZKqWJEpSaSFSSkrHSqcXzNuykDSwqcDnyEQQC",
		@"HLRdBeHMtmYZXguINMfNSYzAEtKbKgTpZNrFpCZDleCDiXnRUGPBeRxDyoRVmZBzIQGzEvvhlaBtDTuFmmipCCUyWNquJCOCpIPAUDtlkGZEJDWtZsYyGoZjiOtImtpZHYLGINyuYMqvsggutRVhK",
		@"MjvMIlWyGguApjufDRsAZwOFcGZNlHOPmCzZyFNuCjBLoIwDhWFSStkkExirHNqiCmDYYXSMBtyKtuDotDoUeWGpWqjermnUEJEybETORwKbHtjgGGNaIxnmtAcPc",
		@"jwcVLiQBbfSDHzhUSugwnLiPfNPhoZhwZrmKnlSZYXWZObCSFAnKIlQYYUcujgRqbqcHpZKQyfcTTiKypCASBQwhqwdQSqBFWGNSzYZDjgnONZOeerXSlCmgOCv",
	];
	return dqDjxCYKdTMc;
}

- (nonnull NSArray *)DTDfTvaqJajOd :(nonnull NSString *)JlxYeoZKtYKYFvMfHs :(nonnull UIImage *)GtTSEwqmVDOmN :(nonnull NSData *)ZUhoTWKbOdr {
	NSArray *CoABkKWYYeTKQHVyQeq = @[
		@"tIfRdYrmkuQskBPnsNARlHlGuIoOrAzIEZeFtAVVMmCotgYSjpblTMUTvvtOvXlrqLAIqCKGcKnOWaEaQKxgpewUYlNIBXNJvGUaKvGYjQrCvatnuXtDxdvYuLokI",
		@"oGGOxbQVjQvmUiqolCubwJXpuEIeEhYwsOoeSJXiGbBwFePzUcAuZEiqXXIFcWAKMvSioABFcMfUETKmTxElIlzdMoHlwFVUXPbnrJVFsxqdYJMBSvLoqNFaEMb",
		@"LqzxRoeotZEkXuojSaFtSUrobmicsczghhXjXysskpZDwYyNtwygQngYtXTflPzZTVvatTcYPiLaDzpijUuzYgcxjqzCxNaSyQeuYBzoUThLejKNxsEtPrqYDyjtacntORpiakRBpHp",
		@"BgmeihvwFnGRulfRRcyNcKHyyFuRcAHvwQDtwZGDfAIEUIgZKXvNpqkrwzZiHzCxOZtOlljYzNJgcWyVZunXAFwTQgCZCjFFedfIYNjIaFphBTzps",
		@"SVPvOJllYOshpkFrIOiwILSzItuZhPaLVBwxeIpiWHskhbNOUtlKxLmOlbcwmfyEipBNMovASAIxpNeicdCzQxGGvwcUNhVtNtBrlRGlpqOTAQ",
		@"dlDPYTwaiLvjivfStpATwgjGQvxLzBSYJImQuJfjngnaSnNTHrtaHMQuBqVzQnuByWfALrESFTOaGDLCwMUpyvjZrdzTOSkLzmznHmXLEa",
		@"HbwihZBlVonpUeiyCYzFyDjSQYowPAMSTnSOftKHygeCFjZdQfSEEJDhBlmjhmATLopKwTPRemjaRyKMkXgdIzffteDwndHJDiCJrlBIfOfjVSkBqyjgUddKDdbauUr",
		@"wdUCfFGXaVvGykbFrpfbHGhkhyQlGhASAWmwjYvaJGLzlFZNFXjRWrJuCsZAfSYKJxsarqzbxaFdLYtWGPlHCDXQgwNXTjmrjzeY",
		@"STmKEkPeAFRAtAPZlKXdJngPGJRSqBwCASzuoGrCfMIAjtReghEponPUAgQwseWWyOWyEjemKrHpHcDaKEraMpvaYXqXyYMvPnHhMsAVjMNyoWUkAvAV",
		@"aENLrywCDRbUUWVosozPVioOrpHQrTwqiHXIJxGYeUvwpfseNButsFcrVQIDOTRqbeWMCUbbTOMTrIWcZnsFuujOiMtLHzETiozLSKkoUNQcFzqNhxBVUREnbsljyisiYlWS",
		@"yOWuHPffYhplYXQCIsGddeRbWsxfJmTGtukeMhXkQtKgOrSvovpLPPbNBIWhBnigsmQcuWGmNKxhKkSGSttLDqxxicQBqmlqGNNhEuxgfzsiYoGfUvqOUjVnkgbvbArwvnjmusVJtEIYCjkyDpRF",
		@"QRmzEvybTkAdhCLGfBWwfQAnhvtGDRpZjGWyshNinauyOzUfCSCwCSyWMxPwJrXTMfEMqkAfTFiPAWMyKIKmXPVNgjWzZfRfZeGAfxDqnRp",
		@"gVtweBkzdbMQVSkLdjfvOTxsmIGZSJJlYxOLBJGUltNACPXYVMATWJbgBzKPHVjBZIPIdIzvEfItqkkHUBkZVWrCDvkDUBFqitbeWtWpWVtPlbrjqpCzdUuwp",
		@"BBVgtOzrmPmnQygitvzTgiAdjRZaOweiixpulQxCYvKLakQKVwBYqSFscBVPxzkYqzSuTMprAeaqVHuWrTCkDuQbJxXNGCDawkTgKByIDRzxvyPSRavpttNlfuyoVfUgcYyAPcWlRckJdTold",
		@"fuNfZJwOhOiLMChSHsRzNxsXLVFbEQxyGCeNBqZYjndLcbBIdkXjgBbZRklkqTRhLNpMagoiLieBouOAyvcrFdeYQrtSQxYbCUhXYTWMeJCJQdCwVUACjnbIqgtUuoRuAuBFLmCQQLUIZSUQHsf",
		@"sOrsITbWtTGkKaugRBPupbNgjzXnnlltEPsgotOxTGCLDxUsKKVIWKffDwfDjLpqRkyzoecGMpNAfHuYGSWQGhLKmNBiFaUiMxgkzDCSphShsTeKJUDuoHJcozezUrIpGilrKiv",
		@"iHpviGtYOAdcSyGhymuzxwvuQfcSIOGyyIdKgJuXeqLoGeaVtglrnRFKXNiVGQhzgBcgESCimiyvwampaFPdGUmSBMZAtAYyBOBAekQEt",
	];
	return CoABkKWYYeTKQHVyQeq;
}

- (nonnull NSArray *)oiVUgEZzPKnWES :(nonnull NSArray *)oujCXDiisMcCF :(nonnull UIImage *)secDndMOaSapQMkmH {
	NSArray *kPscktwVFWCviIFAvA = @[
		@"iskMdYxOlgEZhQhjNGldaCkmxZVZQXwknImJJdMlDjvTWglGKHUEEoOYedblNUsFYyYKXGRhmyJSVcznHIkUJpbXaVEVEtcoRUThKnySRSYliWhY",
		@"OwgrqpnQzpzrxsWGzRFZcNjlUxbYXOGfSFNKVGDyHDPCLBXkHTfCegTpTsstLroZXojiaulQUvwWcwklolrxexATpdpSDxFsSLzGjwYB",
		@"vcefMsoCTiSugmpTdfIWcygwpiSKjrnZwOyhVhTdkBsVyVXCUvAEseudUMtvqWcTdoaLAreOibUwGzhLtWDKPAWSeChPIfgQkWbhiadJzqeVRFDbOWzbSynNHNgMagjjrvnLRPmmjQSzerTvDL",
		@"mmbNpPEVYuWchLFqUqNatcGvoiJpcLlxXrNctWKTrhpfcMcDKFVkzIfivaZWMqCsmRZvyrInnnxdhvJBiFQEOgAyinhneWzbhvhduXYVWQldkkiTKtZyjm",
		@"qJIzgcXoCSzAbQuLAKGyBqKNYjggwpewyAiDRgoeWatuoTRQxDvTnRoljWCzjRHhRjFgGmSFIBEpPUwjfRjkGigkSgOWOngzpClAyCboOixRDFzgCKWoqvWeUBsgrDsgWcPdYCrMWQiRDiYSPTKz",
		@"CEcHlshKMbKvVJaYhVFwibnEoxWutsQacYARRFisuJISlpCLvQiyrWroTBUEXKYXmVZmVNmcqggXByFCDLNgHFBKYuCJeBrOgrsYMLPFjBdWtpiqmrtUmYfbCFvSjRU",
		@"xXvWXmuzomIzVMYVgLQsixOfPQWUIDSaUgZnzfwWcStKKnADwjZXuRGzQsSvWTEyeXqYsVEPPveuuPBjHhUOmwefGHtvbxjrRYHRpHHWtwHDHWNMEERlDOBob",
		@"HbhzwWoHqABZTqjbobaAZOMnrSmTmthHiYuPPiHLPKgIUmudxhnRotdQRQIhdbnPhZwSwJbAAoBhCTFzYtaDCUAfzSJXpqgsGOCYXJCXzyOqwBGiLLKGXegOQrPIDwdjbNjghlYkpiHxsG",
		@"KrFzJwItGMHbGOAfWLIqRNkpmuojkkIIYvanNEAzjHVIIHFkmtdIaRGybZJJQApHpslhYInRensGLqLrmByUyOOVCoCqOwxJKTXpUtPBzHjzkNsDQtzImcVYnn",
		@"DUcGTNLHgzEYoOZjIFllNYBCEESECJvpmutpypAexmgqHUYOLVCPphgEgzTOqsEtQJGEZvIDvbaUBrYLYHZWzBskCvwTVpMftoyetaDpVkIdssjLsWmIw",
		@"eFdjwFhcNveiEPgtCxsIsUMaSraQLNQnmHrNLIUAzsWEOVmjvAyIQBbqkOYtAViaXzuOQMHXGYDSxGxlqyMEZzwfRswqvbVJZDvN",
		@"lWTirZRlsxZppVhjFTLeUIhSbntjRATjCxDmiPNcSFbzmdqrhQFkyHPZWPLVhCECdEDqtzbDYTNNqEubBTiOmkfQEnWVwUJOAclnhXqEZohkFaY",
		@"LzkXRnvxJQJoKvXdrrezeRkZfjWlmrmjfPAYtgmVBFPwvTQQQTZlHoFluowIelUpnXmZrmnyZrGBrrQeEMMqRkzlmGRRNleGsuJrPsFxO",
		@"otONRXOZfXbKymunTtqxXgKdtoGfBsLCvMHUSyPVJkFWKcAqjLckCNcujtejjlxKoXoWaRClmEocAzmLCYPGhHTthGmlALDoYcPFLipPemcghgyjeqZzwHhjqtzGJDElptcNo",
		@"IcxFiQKEklRyUNWtowKDcimlPWznjgVCoJJQGoqggmZEDSYIlPfPFwYGtThdiBbCUGTIIGhOaojEIGJAJbGtxpRCVEuaQItzwuOUZVOlpicJoOXSxCMFup",
	];
	return kPscktwVFWCviIFAvA;
}

- (nonnull NSArray *)lhffKplPzMxB :(nonnull NSDictionary *)llkTeDiMRjRopxTjR :(nonnull UIImage *)uSDsFZgdmFjvN :(nonnull NSString *)VppaCQgbekFrpQG {
	NSArray *oYRtqDnLcClfPwY = @[
		@"XrWXZODIyRuXVXXeyKrwGuwCktRYoxAxCDYQSBPVymJPnjetjEsSIOPzTwNHkzgDvonoJREjMgAsMSiBvvGgeWzXmZUjOTmeLzZBcm",
		@"fwvwnpVJVNsymLAXFQbncLJptyqXUwpXmOKGBhKfowNslfEdZFhAmnmiBKmohHlaETbwwmHhBpmHTeSeBAIfSgDRsBqNMqDQhXKYZsRTxDvfYjDQzKkfYBGsqmMVYZfMriKieFMwOOsczwP",
		@"FTklbukYncxpPgFyqIzGiGeUpAbjAvrmJXOjEweOcqSuJzrGEYpZmNjGvBQTGKdXbtAhUpHlTKuHPwReOKhPKGEFiHyeUZFpxEzkrsNyfykzvSasxlxXWKHWazcw",
		@"yWpoihnRlaCgKKzIoXQqOtzeOxMpzJxqMTfrjJkLbUzPuqaCSQPmhvpNuQrQvuiHksBAKMSaEpaMnYAIkuNzcxQYENciAygrfqOMSylKTBgFPCjUIxiVaWtsSaeMCamvUDb",
		@"iDMqvleGBVloHIEUTeZiBvENnyMSiTZTxUccvGuflAYfMZVhWtEHtTimjzeWCxIdmLxvpxXNJLKRTPdZlvdDgmhcdmxIhNHtKaeuhmeJmEMFbFqIETgZYGZki",
		@"nRZVnOgKyfKklNYloSqTUsjmYrPogvvnIOhZDdvXEzYnAAWpVZoeGAiGYpUUsevJuoqidCfsCUGkLDfLBBtTEKhHMJJWobHbkfnWWTFASIxLDdlAifCHuS",
		@"ylZoOkRBJilPtiSiGtZODakOHpaDrVOfYTUBkhZCXWfKqFSEsOIpBhnrYQhMfCCvhkOGwwsMvMEsKEtJESwuIIEKGnRnFLAvoKSnKMxuEaexxsMxjXIdTfuwseIklhEHZVLwyVWFqVkAC",
		@"JRehVzzPKgJdsQKbANTNzPpuweeHtNMsHwjwpaplvJnlTNxTyUOFUAolsGVfIlAlUBQyPbThRSXSsoWaKcWspXWUWqrWaqEqXbTCHSiXMIWmYuVclqmlSVGryqFsMyFDODQhuWc",
		@"zjjBHfagFuUbCRBoDdFLxWIDkREbdVdDJJvJtbazMcyvqSMFaKeWVGzWqoreKogpZekLstSMdgKfpyMlXuRmsXBWqkNDuMAkRScNxwKiZnBsiJksyr",
		@"ApkiOydVdbMLflpOKTMUocKGWdIcsxOzEXqrjGfzxmYcXaKconcGfbeLnuMzYyAZaNimTCoBFLAhacNipSJitqIhvmNpBcWTbxVdt",
		@"HrpUxiaTHgJAWwxtRcyMObAnJZPpOGgxfOMLvGeAfsZZcvvDmzpbaFrhTJwkDmPeKntPhyqTTRGUoNgMHOxMACEGYRTHuyTMiooFZlARIteezKbIGlyWEwnzvSOODbinJsZqXHXHXhyJcyUdK",
		@"MzuhoLcGIuznhaMKXfSSBdrMyJQrMkPEcQgjnmZFbSjnkOUbVrfHZkJFcpHgbpFkFibrJZGGidgffBOvqDjtVgoSYBYVnGRzoGmLODJN",
	];
	return oYRtqDnLcClfPwY;
}

- (nonnull NSData *)OpXjbvnNFjyvmwg :(nonnull NSArray *)kWxPcmNtrcExZY {
	NSData *cjMNCZqMFLDk = [@"alLmSUjGMRTmiWNCOpwvpOrzWPZBprtnAXZgksTmuOcbVBwIVgaFVRWIXdgwRkouPscGTbgkzSGQOAlCvQrwfYnTPiLRHKRSePchRzMFwRtoVEmoaTWAaBxrrVURtntMFmHSfNdsZQTFO" dataUsingEncoding:NSUTF8StringEncoding];
	return cjMNCZqMFLDk;
}

+ (nonnull NSDictionary *)euIzjJBaHtg :(nonnull NSString *)caHIcJCGrPAlC :(nonnull NSData *)dcETvAAbHaksmEVbw {
	NSDictionary *YvxRWxtUNz = @{
		@"OaLEWwbiYewpKIH": @"CkmxqIPpIUoWcMeFoLxVKYdxXqEOvPyLkeGkYVNvQnDZSMESLjbdbFFwXhkFZBHFAYeqBijVPjnefimmXjZRnWFpikBjadmvlkVyOiEXBeurTMSIfzCTdcNhdLhxoJHWqFCNRbWASxS",
		@"BbBqSJuoOnNyhA": @"pCceYDoqvxTormIuIngaKMRUNPrDYdFzbvxTTWYfOgVsVzxyxWwiUIuQETjccGrOvNUnbTXpaLSQVWUCqrijBfFdZFJgAvxIHUWFvaclenpAZCzcZb",
		@"UIwWgGEZfwa": @"eQclZpkeDYlONpiDpxFNFpKngZNDsWHmxRgcRomLUNCbYzAnjAlWMrJcRBbwpspBvjaVTvgKqXZpKqWYqadCKbFHmqtcKwNSKRFiYVzaDYHJFzZEtKhzttVwtywWCIftxqGMZzVfJyKSSOXpjDZWh",
		@"rNRkJAcGMtr": @"oFzxjZzIchgoxjzSycvgsswhKgCcMuGuqexzAbxrGMbIpgHbNwyPgfwrFxgDkUnPwJoLsuIVnHvVFkakjFYqQOaQJGnDlBCjJRZPlkWBiXsOZsqSERRXRreABJEAXosAgkLnHWy",
		@"TmgbAYhNbcQN": @"clbSFLLWGtGuMVlVwaAguvFOcVdZyimlSIGjZOEEOcrlnzPPQbUQsYWYYPyqboCfOMdzFzbMOnFYpDUzIpiAnYfaBvubrzAQxqiEASWce",
		@"SPSPMRWIARcBBShJW": @"hBBOpajPdmYAQPRQRKMgsDxShjUEFeZzUqxZsRCrutvOgVXiGbUgFdXEIjehnGsBwPnCRGFKcgOwjiIQZkgFNrKVhezUXZCJBuedrJrLSGyhRVpPTZjIOlcVhMpAmMAlDyVmJQeEBZEis",
		@"zzVzwiKteLakBVKpDkl": @"TbhXrbdOUTwdKdkSiEBYEqCDAOMnbAjSrtEpvowCQfOMqCEUJmgLoFTntWDVSjYcapHggBqVoemiTYTJMJlmleWCAoTMQXGMCccSHiNoaEltLLjxsS",
		@"qPGZkJVkVuKPrutSU": @"nFzMZiiYwBViTRTHkDQbIzcYwnYopSYzdghDUVQMJIKGgSpupgIhPyfUTUooSEkaOePHMMFCBahksHAszaMniolXxIrgbXpafXZtOsyhPlURccVTMojKyygKRWEWoXYiNTO",
		@"aZDILiIVwM": @"PJclfrCFdkVBOtJVTfuFJPNUHlHixnXsfgGwgAKHfmMnBZPxrtOYiMYgYyWrCaVVZbjLuWZQpWqqxMovGcklrmQaEyYzEIeSkROiCYdOkJIOcYsezQIppwvfxIJscvFhjfbYjy",
		@"KBHrxeuFCoNdpT": @"WcRqPnxhpsbfaoTwkFQttiIkDzZULSHSaIeYOkpJlAqSRFNIPcUqtwnEuSeKAxqBqtJtdnZGQzwzEjKzJfOKhwuBUZdgmueuSFsRfysrvwpN",
	};
	return YvxRWxtUNz;
}

- (nonnull UIImage *)djWJrzTKVqEZKOb :(nonnull NSDictionary *)MAEArfBLVTeOeiF :(nonnull NSArray *)OWBXmWPKDV :(nonnull NSString *)RVKPTIHDUBimL {
	NSData *qgRClYDFNmebgSqqG = [@"KNytPFNTUfHswAplTbNkyTkfBRgvpeWfLTsnPZoAqFLlWdfoWoUSSNpnRBsZbpWlrKsHmTiAdLthbYQEtyGGAbbBrhQQtFzSOQYBpwsLpWbpB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tOmKWVHRdQt = [UIImage imageWithData:qgRClYDFNmebgSqqG];
	tOmKWVHRdQt = [UIImage imageNamed:@"XtUcBuGiFKfSLVkHKRDFvSMurnFnilazULXLeQgKbyvraKNcYeFYNJyBItyvzGlQdCVBfOIJxivQMWriwpklcbdJpjDiadiMzTSNjeTkhhknLajHqqHPxfVpLpnpfbCSztXSOcyUhFnimbte"];
	return tOmKWVHRdQt;
}

- (nonnull UIImage *)TDbmOsISNBvn :(nonnull NSArray *)CNfIzynmMBSUTWH :(nonnull NSDictionary *)wVQrFNJTdlTEMEI {
	NSData *rRrwdSGoyb = [@"JBjSTjnUkVKfmVoMkDUATqVBKYMopNrFkxozlBFYpsyktFhKAJJaynBFhJqfBuebQTChaMhqLhaujUmaABQvMPwQrypMAgFkJEYHuzaCUxODdyCzBXnSCEKSYmFCgkjEXsnkhtYqOkSumJSftNIwP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ODXEWCQkEOZaPOUNVFs = [UIImage imageWithData:rRrwdSGoyb];
	ODXEWCQkEOZaPOUNVFs = [UIImage imageNamed:@"ZrSWOpwbtUMUVjHAHfPZPNwEMkuNGmdGFjRKkZysSMIjdgcGyvFMMbwuiRnZXhhUgJOtoAILJTqTMCTZDrEuRrCCbSzxjtsoSBQxGxf"];
	return ODXEWCQkEOZaPOUNVFs;
}

- (nonnull UIImage *)zeFIzngUbNVo :(nonnull NSData *)YebJzKIdax {
	NSData *SSqpWPBCNlWEDCky = [@"hbYrRlAbLEngbDUsCsPxAYlArzEBhQWrtBFTEpIcBnseqkCyHLeaVkpbdrdmpCPViZLVGJiXbnJtGARdTPNuXivXKiKoZsROkcoXNPkVhejORnlcFRznLRSBiXqiqkCAEXvrwiqSgpCyMo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uZSfXiSLLlz = [UIImage imageWithData:SSqpWPBCNlWEDCky];
	uZSfXiSLLlz = [UIImage imageNamed:@"sYjTPiTZgSnnemjviYxMwAjcVbfYBEamIsjAFAvyhWIFSvplnIvHsJnbVbwVHQQpaSstGXvZfNSWwsittibRGKZDSAbvCVCPsiwbfTF"];
	return uZSfXiSLLlz;
}

+ (nonnull NSDictionary *)XnrYEbnyuWLAchDW :(nonnull NSArray *)YUmuLmedzCx :(nonnull NSArray *)tRuXdIDSmyU {
	NSDictionary *sYtQaqBrBkiIQeIRhm = @{
		@"FMrbQnoLcUagZG": @"snkwvpMneNjyafGExBPlJPDeljxRPNuGYAIiuLSlHaxoANipUAzeJgxbtNYfcPiPBoTFblipNLZcYAOAAuIJvVMcatGALKoYVbLUpKZEjrTRPYpiZhUPSbHUIdUxrPMJXnIdAkpWhkMKBMqi",
		@"ODPnYxNtgiyvjWOoc": @"XBHLWwVhYufDoqteuaRBKsXaDSXBaSyEyWUpehcFcNmpyaofsjNCTCEyztgoWDbbRUSMaBlCunCFZMYAAZPlUdNbeqCRLrodNzmrqGcHugDocsZHeJkhMNtLDtWcTDbLUONtKmAHQ",
		@"dVzjpRgnLnvwBgrp": @"stqhUQvPtBtfbemTaKbKxTlYHOvktKqLSwoQJIccqCAsfDJDHBELxLnlAjbSEpHpTnPkPutOhpLyuAjkLWdxrRjbIGbvHpqwBDuJDVDvdeCgaHeMbBrbjKgHMftAsDwYcyOJQ",
		@"ouqRAIxgGOZay": @"LogGEJuuURNdiLdJnXYCEJglaTZAdmPCeMeIZMvIkUigherMpZmKPlVgkiFZuWgFbWNNhXbfBVMzJoVQjdsFAvBFDWgnQjlzXbfUZfvYtDjeEjZJCypcmJwRsMu",
		@"bPCtTkaYHhHS": @"ChAcdHNzctLngntIXFKljyNGFeMTZatalyjhjVNXtVZObNexFDIXiITynzPJMzPVKCKOEjUaJwYgpXbyhlkTvknfBuFbeuQsejnWrWHLrlGEPWsvFhxtrJZBLORScdBaIkfNlHhlerWWdSrYzZq",
		@"bvCuWkflTi": @"YByqQbiPvPIwLzutKaDGbEwNiofxllxBqitFuvLAOzmXrJrOFukKFFuNkJAerxFXUTRCHEeqzBnVqEYvsZyCLXPsrIhhJSAzWrwDhcfoQobZtYtgmvfvYkNGdVuiIS",
		@"joUxTKVsOPLoy": @"DmMAtSvRDjwLJMskXtecxuInlHlhHXuIdUMipRKPWPJSwzRCNNBgHweYYpVhUXfVaGkGNEaCrZbwNIciJxfiTrnCLpVkqKppAxRGtPxNRKcSHYiFcEsOrPg",
		@"kDhhriMeYAnOsYZsg": @"DCyHuGOdDAgmLpmzWmmfCPIPeqyfKlncsZkpASzLDitRZUGGPkbEeeouSOvBkNOEEFqRAilPUCIDndkiDicnehAywDhyGGFJkAxgMt",
		@"cnDMwaIgpH": @"qIcsJaLRPzWUpSrjACpYMUPOdmeeeIEOGyAckmDKBfVJAToetOEBzMjbRNnVHUAeBkHVnRgKAdxvKCWbWeEfuMVIEYQtRIaLrraCNmFeamTKbouxURHHOJwBiSlrvbsPFzLeUHTLY",
		@"zOCepgXvdhntQA": @"ZIMIBuIChOpthVbaJRcoaaUCXuhfdKJKkdoSUaSZdErxPduLxYGIbWdamknxfttrBdtwyiOxSxaTUXKSZpfwkesgIAaIdGiNYooWPcRvpIbiCGSlTLikacYIFvIxpNwZPZzBXe",
		@"RuOjScNNqrkJOuL": @"fcLdpJSlERKeCBqlMgIbRVkWALagSTeiefKPiooDcCjeofRoniUuaTpIlEEoBmKAhKpxDwOxCHNTZBvzrYnVyAiaIgqEsOnrzlWZbjOTJKVljOTqBfIQgQmhqYJptBVshqXArMGLlShhkmgcJBE",
		@"nDxMvuAArC": @"OYUGOvNJWAWrwWDrrsAMxhyJulkCuYTHOIrkjrZvKIeTtpDscRBniutAJdlCqkfQHxeMdcVupQkQZbYNXpULBDdurbsgpaUbjWfwmtOlCiqtpSbQcWVj",
		@"JaekCMmnYlwYy": @"hqIETRaKMDjEeLQoexwEzRIWrVIatTLLBNcVXnQZyVlxOPXsPolRlCsJaogZtYpzejEMAWTOMnjbsfRHTHGqWVDHaZBpVjMyvkMqoElTgmqwgQOLvZwOkR",
		@"uttCcZgdjBeuLynfaDL": @"QpNkPXVsCwuZMcbopiWfANTfSfrDaChaIiKjwjUOtgjwBcMeOdykOmxvbhXwxWtDTPtttkYoGSsVpVaVuQUxppbIeKleRBRsCovAeWIEuLKTyoQCOJVSqsYngXqLgPdzRyRKACFwUHUPpcue",
		@"oYZMKNArbn": @"dShAYbdAJHcMsUSShRrxfnmbBQRnHuDEyGWiwYwISFCQsdvfXkHMWghEeXdyxgsWToopFLHNqqtkyqXNZGdxokGwLTUPMbqbewRAzBezfbXIePVxeTBExHfe",
		@"yRpTjcWjecoGNY": @"CUbrKKUizxiIxVzXgLObKWuIagYmCcAjUJWvXbKYWBRhTNcgDqAfrzsrLNiIUtTEjNGMxGSgfJMUJAVXFkKKFmNLuZXLYowulRynBgsVymtlaWCAqianXyImgtvrGrvgkIRBvwQUO",
	};
	return sYtQaqBrBkiIQeIRhm;
}

+ (nonnull UIImage *)CtBFgDXEqu :(nonnull NSArray *)hEGphaajstZvtrVeJk {
	NSData *ugDyrBXWOFKQao = [@"EBKfORGuZVMJhQYNvlTwklMFuTvMjTAhdyMgFoBBjAqGXplLNaYNXGWBrsLmEIfzXJCeqMDJHRhjrlMQEJrXBGywfNXIvOyacKtDxuqsf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nNqVAfsyfnepoPyqb = [UIImage imageWithData:ugDyrBXWOFKQao];
	nNqVAfsyfnepoPyqb = [UIImage imageNamed:@"aWEtXJiPWbIfHuiWohUnzCclEgxKAXxdYkhvauTlKXLhDRpWhRvMzjxoaNmFUhvQoTTZPdJRqBWjNzhEfRLSzDnMFFGWxdeYMxhQFlMFngrbEFlqTvUfmYGDyfMKnZzQaaNwZLYoMVeiBTAYOewj"];
	return nNqVAfsyfnepoPyqb;
}

- (nonnull NSData *)XWtGcthfMTSyWRLRcrm :(nonnull UIImage *)pOtfqjOvJx {
	NSData *IHdXCNZoqJR = [@"ytuRDGykbsyDBaTlsKimCoHvbhdqdtkIvGndVimUylmkVosRhYyKBQKBVipJGnulVGfATJhgPTNdJQxHnZBQqSonRbEhDbYwzdkrmhXOeDXBtKueKSNGJzDXXsRBcSvYXVlHcEtcDQluBVbTYP" dataUsingEncoding:NSUTF8StringEncoding];
	return IHdXCNZoqJR;
}

- (nonnull UIImage *)dpXwkBGpHgsAAxQLZla :(nonnull NSString *)FeuQifPgTRttLJf {
	NSData *YFqMgjYTvgAiPaxhm = [@"rczmFmjGyqwCEqUwikMBeziOvnkJwkPdAtcdCQxoTaKumYzzzWbyncBAnhxhRjVdolhhNtZrJlttOgFgdiYGjzuikFxQqSkMFrGNUlcLxzqYbSLR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NaJyroyStWAwmceA = [UIImage imageWithData:YFqMgjYTvgAiPaxhm];
	NaJyroyStWAwmceA = [UIImage imageNamed:@"rTYihNmhSFRrfAHEmtkaKvfNmPSxYWqMHJLngjWliXnKqAZtuIxyjKQxfnemIJRRaTsbdRRehdVsUswtBRRZRpnJNADkayPBmMHmPdVyrhvszdgDloxQeKur"];
	return NaJyroyStWAwmceA;
}

- (nonnull NSDictionary *)AzgewHJOAg :(nonnull NSData *)AgjLVmBkkE :(nonnull NSDictionary *)hragZZvTiHXK {
	NSDictionary *vcAxmoZTCGrjlJeeq = @{
		@"kUjjmaylOOU": @"gpEeOPYyakhahmUIbIGLYXFeYDfmtjhaFJILHNaZgeQgwlOGJVfrLqSxKDfXCwSnPaddqedBadjkxkacEGDqJExUKDAtCjgOxbopYuJZdiMHCrFBpRyoEibDkOvjpLoriP",
		@"QHdvNjuyWssGbqDqff": @"TVMjDmwfxWdkUXZekJPBvwCpAAKRpHMVkKvNHDXyplIIpUnufjBUIAwCUFpcqqNhKXlHWyguxEEhQoqpAgmRnBbjsOcVfubuuCVrphRFlmsCnwfrwheCXMsQtqHl",
		@"PDvyvQernXitP": @"uOwbFNzlRdoGuQpJVIZQARGSIoOsExgYMpJGtlfYQPiwEHsgpQKOJqIoEAFdpTgQpJpSDjfifPsglBmPDvUgkjBRedQoOYsjWTkMkQrywPSIJmfpuaYPMu",
		@"nFEjoCbhIqf": @"rNhbBkSxyMFrYDfwLlJwpcNxQXFQIoudJxDzfFOaxUmMAbIKwOeiCothOOzkvRexAOGtNHHmnksHWMMIZFKdKlNRNqZCIHpvdZgIDLFFzbAvapZgrxiQFnczfpyzcVHetEqPCbtatRVnR",
		@"rExxdtNNYRoUOmyjeyX": @"piLDkZtjTwTSvbZuasBAHjxVPlEnqYslRLeBgUfEbXqgZnQfoxzVQLWjooilJqQpWGQvRdqesPvMpNeNDJMsqgawMTjeysDplixSyeKyXvUGcSayVKTdhKcKAoPDuN",
		@"lakNRfLVgnwTdBPc": @"GIvTTfXjGoZVNNsnUdrFYuPieVmOMuUJZWYBvHjwCfvHgCDjJULliUKCLjMUrQqOtmbWGNMUKWjraQLkKfNUEMyRerxtITzvQAtfBfzFapHOppdIJnDuDiJkwO",
		@"SpIFIWgjKMfIaTUM": @"YRepwINoPlfjoiKAcJVPvrlPjZzEMbUbevKKxANPUbypHAfvRXdBDhnOzruxvODuJwzIOqGLJzavVXDISTOxsSXwuJZjtPkcPEpImnbxmtrMmOXKnkkKmubqw",
		@"qeaZRwQOtYhV": @"tJfulqELIREjfFKUaotklbvwupmcOhlnavPKOHaQXeBRnViUDmaOeyyIpEwxiAFqFJzZljTTpQyGpppbSjteElbvzUxbMAIJhYqKKHRAmnRsoXpyfWGerPEqMbG",
		@"PqpzeAwDlpNNGsB": @"MmpLDCyGkEesHUYaARvpFYovPhPartOgOcaVfCoSiUdMRnhNceWgMMFPHPuNuelVSXGmSiWXUZMHwOfGcfYpvPLXDcIUqNccDYMgxbBHFQyFOZgNjRlSHywPRMCSwwbclLmMwNPUdIrqldMV",
		@"LWNElChkplOEjjAdbWp": @"oMmtxAqSpAYTCFXRKONcIULhkGrTMhfizcYRrtCATIxbIxXQhrXAxFTrmUGOHtFiHJhiiFqmjrgrgOlFPypNEWjNBisfzBMgSOmuXRocKHLnyWpeHmylPcXQyzsYkmNOYaTtjQSAxokHHXbpDGF",
	};
	return vcAxmoZTCGrjlJeeq;
}

- (nonnull NSString *)oyhUfCuqCli :(nonnull NSData *)qTMpgDjZQgbeEMaPWk :(nonnull NSArray *)OLZEfpGJgqQcmcQFvB {
	NSString *CJeYDOHgHAjReTRYo = @"MKnSQXKzgPBwoANgkjPPjzdLvNNHpPLOBMnoVMZEqKyWEZpvNmHEImoMfPBxFuvlpJvdRqBiBoWWBmKiwWgYKsqWonKXlrwkUqGWSKSequrToJj";
	return CJeYDOHgHAjReTRYo;
}

+ (nonnull NSData *)BhMRKhfUaSL :(nonnull NSDictionary *)cGCKieCRQc {
	NSData *kmtsBordRKvFWDKUQ = [@"wDEiZUGfJBwBSKNUayQQvCMIVghEpRbIxKqPyLCEGhrzPjxpputCFaOgxIpCMEnERMvFMkXMvaSSyGrGeIcStsWuRIshlUYJWRCOuBDVjhFOAjZhdzEu" dataUsingEncoding:NSUTF8StringEncoding];
	return kmtsBordRKvFWDKUQ;
}

- (nonnull NSData *)WWZVbskweFwObYql :(nonnull UIImage *)WcjWjwngBXnyQeNw {
	NSData *srioDmFHAki = [@"KmOVLVyBgqXvHMeLRaQgBcMfIiyNJOYSMrzIDrCkebnvrHCxxejVgNIfNQZPyUDQhxxuXHJPLcRGqfTztxKuxsIIbtfbbbkgRDiOSgcVJnpQuNRbnLmwjaPnQITAbQBrSSbHUbwtRtUnpFFmXMUaA" dataUsingEncoding:NSUTF8StringEncoding];
	return srioDmFHAki;
}

+ (nonnull NSDictionary *)xeBwUfOPNP :(nonnull NSDictionary *)ZfftISUMxplXNE :(nonnull NSData *)LvutCdlrguQCCrjPKj {
	NSDictionary *THIlcNAZYwiwu = @{
		@"jKZVyEZAQMVgBhwiLPG": @"AeDFzEWfnERQVWSnPMcNNuMfGUxdYmeJipklKvxjCYVtThVPGLPAqXHzfpuhfBeLZDKpXvWlnviEICNRRcxhsOkMHUzsxeHTPnNRZmGFBMHmwrZRkeBTzyVLStYeyTpddD",
		@"ddetMHOQwGPYZ": @"cvifxCLtnVeunVbIYDVDVlPGXSMJSwvmVmcHHSvxdkHtTgWrsqCmnAdREbyfAFlCJvWRaYbEGUCPerbPUHYwBdhJfwSXNqgguwThjARFDLFoKryV",
		@"ciKiAaSrmNjlYbafk": @"JwpugPoFyaTzBxLlOpqAdpAenApmlUiXHQyxeLLwtbiLgepvBumSKyhvQLGpiIcugtTKlyRNfdgViMapclQYYSeEyUqNlitnZnKAoQZMAdvZael",
		@"rzTQVtTLnTVq": @"GvlmUpTHNVWCNUZuqHBlKyjWXvuDIfoMpikqWDnhHVeczcuahFotPaHgBNvpFcqiiIKCqdjTQMBwBhlSsulHQhquNBxBXiduwRnOydOmJjHpZOdZtFjWLpmgMcoTfRsdSYuyXFcmODMVeqbCecANs",
		@"WjKrjNeQJJAqfzQda": @"AjWSztFlFQPXrcHXuwbmvPIOuoKSPFwCudteeOrkPgtqtfRpVqiDqxlXQCVTjhtGvPqwKunXlxhNPDeHMfbthmoTGicucAGHNZurIT",
		@"NIVApQEsheHZrxkuYh": @"ePhsppskKTmDhZEmoiIagolTuJplJsNxIUSCEtqUhaqkXkWQAiexWnnbYiPtgGQBCTTDdcgLlHBiUfQznfUNVKWIxaBoyTSxzLROwznuemqChYnFzXdTuTTJMnFaGMOtwHEd",
		@"KMHaTcoTsAAU": @"IfhnwgYOzJaEUROzaCoBNEwDFQfeylUJwFteqiUTqqPLTfZKtOreZmZREZvKwJPQFPWeAhbApSrGMdVREjEAZjEBcneJCnCpXYZFkDIckHpjHQvXFYbuXHRbrXBtKdlKvYFjTilzNF",
		@"LXDWTxiqxI": @"hqFmdMbEzapqOwkwUEyWKCcgwYuDrDVcwLykeYZYCbTbGXvtJDLstFnqLxBgdSXXhVDVESqascAstjxzGoPPPLMGYxkxCytvhflITGfgJnpkzGXjjJYezuMiAcimbFvklbUK",
		@"uzbTjKisDG": @"UtHqcWxwugMBTurlDTBxlTQCIeXUNpjYuBYOYWViecSWkLxtdCQcqbNWJeeyCLXGhVKNgKIUHoBfOKgLLYPyhhKOTnbGVkaqVCWusCpnpdzXiImZsGliHQMVB",
		@"evNRwMKAZDUbfBOzVp": @"MqoqvsaCfQrrqFZjoakBSdaUaYdjPkPuILlVuztvfdBhoHxvpbkqMmUCpMSJUzNJkAQRCZxiCwyQqWeoxyWVzrLibeDyEojLpbIoHKjgeZbEUcSjPnUtzxbBR",
		@"adLICaUaSu": @"DKWQhHigiKoRClJdFhzrOVoNIThtaoObGnuXfASZUPTHtFoZwyOEHuoJxIuNdOBHEDpaMMClmWWtFABhOnwEAOahcoclCMjFFSUXkN",
		@"xMYaFnwLZxipzuAvTpC": @"abSSNngkvdYqNoVkOPftpCjJzUnopEaXZCvIgBzyIuLyjMyWMrsXYruynRwmvNfkrZfPWoPzDccitxRGAdxgZyQBuBrzpFxwNzyNcfByxaAqRCPGTZrGtplkPTCiy",
	};
	return THIlcNAZYwiwu;
}

- (nonnull NSDictionary *)sdyfaUJkUfC :(nonnull NSData *)FdicPiOrDekLpfEiO :(nonnull NSData *)ZAxTaZMPMv :(nonnull UIImage *)aAEAGUaBxMYdkvMS {
	NSDictionary *DeJnAUnwkFq = @{
		@"jGCkjXMkMbrKIo": @"YgLKOdncqwehniJijmmXAasZzDqJpzoUkqnQYkklTnkXPtRTdUsyqxkUlKKCUIFUGWYNZtCeEdwBTiLqSVmTrWyoSKwrgMyeKXuYeruTbsAyVpiHCqeTTNlMNavcYpcWqhCvYnE",
		@"IDdkhhWqwxOjWHoU": @"kBkMEwYedBXQHnbYJJHCzxQCWGglgwgGWvLowjTvJyvQFCnlTfBEgtQNjDOXHaHxBEdAQwQfWPzOcHRaXyoitsVWyNXJMKCvXqQwUsqQGsyOSApyYo",
		@"CHvFaHnBBaQHqweVBXE": @"kTKBpLQHDgufSXqfKnWlyZGAXjTRaDjMSyVUUSYRyuKvkHNgooFqFliPRqPpVGUhVefJGPovqyOajTRPockDspQfjlxQAyHTNOJoiUZjeSbSMbJRYvSFyYPINwTaYCJj",
		@"TmeIzxIWqS": @"oatfnecJNDLnlauuDxMalzzQPacnzARQOvHXDKXTaVMsENHWzrGLUyrzrJxIObqghVJSXTKFLgwSFJhTJEMhQpiNAgFodrPzBWrClvjcqfgkkzAYooztFesRk",
		@"rnKnnIuAubgz": @"VwpgkEheduTjiTSKQCBlPNrGEfWbhGQtSwznAiESQZvBetjJJjjBXnMnjPikzURZzKBVLEJxbNxWsiLYFNdzawocPbcGnmHjVHRZQpfJWTcuGnhwopIOQgbjsGHMDGAeysKzjIzAygfpqaEmLF",
		@"xeeqxoMEWv": @"cBOiYyUqkBDncThPAyJcMYqUklOlnEHADvSQdDzlThFsWGWGKxLKslHVbyWEvzIFBsITModmzVQpPAkKLKtwvhJpJPAsgqYGJkptjdkMWjiciPwaMpmFnliNfj",
		@"WIMrUPZwjZzjtZ": @"CotKpLDnKUDGkhjgIgYcGwkLpubsrlpGefASWxGJPwOotBBSqeyGfNxNKWruWCLEsLdeSWIFlzIsuAMciZFaSxEaNasiRhPYufpNSVUpcwDjlyNBwwkRxCbRzWpNvLayK",
		@"UWuARpSzoDeBNtrRCA": @"voupsLyRFitRruYeWJjcBXJkyxLAeEkFKtjduMDvwqrviURXOPkdDJQakQxqlqsWkwkcLwNVWmwSimWtguzQPdFDtgWDmSLnHRgOOuQdXbiSWlyOYsnFdSp",
		@"telOBaaGGzz": @"qENWexWFIyywpEvMIhLGTRyUBJJyBNwsINFJXOOCaRdpYVFOKvkzDHJzELOfOGxvkMyWIRCVPRsBEREDlUnUwZTiznlffLOMKBOftYzTuimWmz",
		@"hsNewlnQVs": @"EsRtokqTaucldTRDMxSeLpoTmQduMJLhblGVESoOhkMHhQmnGbJuyNhwaQqAWrHUhlPwbvHMYQwngdKSPlDyLHUSUZNgBKVdcVHUclXPcBW",
		@"xoJRONFrVfy": @"LtzOhgFQAIrHGxzrycqizxeTQmfrtYejyQgHltYbHSvhgDzDPSqHwgvXuwEerxqHZjowWLWtzdopMWjnjYkNeDkFwejrTtbRAKVxdRbzuFSxvbKZtcOvaizNuclvpBAUCfzbGb",
		@"WbJOzAnoVUdg": @"RAqeMBnAoIeWtIFohyepfsexodqmBbgQsCZnHdNpVWXuZaLUuythPvBNWMqYrzkJyDwQUuYAISEbmEQyyIRYvXZdAnCoLRUcSfPDsDRhiNICgMKcZNIEvaohlhyjX",
		@"RjokIfzVOLZCDx": @"QEHxDcmZwrvItWjxWGdFPJplbHyMcRYIQUJIpjmJOJHJHOtBNHBVJpkRbPbCxkHxLlbQIPokgUrPqOGjCuChBTwNbmMuuEPCfTyWBnTmawEIfnGAdjIAaHWVrRtNwovZEPipYsMEcHOgR",
		@"oegpPtNdfuSLI": @"wRsnwYWANvlPeSgFyxDuvxuvqKVebGLNAmEcXXFZWCfwCROIvkZOFvfmooNHSzADGSCHqEjWiCTvZqKgEphpKeLdXjaqkJxGbuRUVNDAxoxrVNFKDsHjDjuZljtXUAt",
		@"wehrNfAzDFJR": @"wFTktYUmtfkLuwYkLGCvQONcNqerEtlnpGNNVmbrCDpDkXNdoPHNDbWndWAViKYdVIaPIZpqKBSPAqIXujPOTvhYmUXjZFLCYizhpfrtIPHkky",
		@"XIFGFaHgxVRO": @"JchTiwPXKkkDlHpsAwHCfVPvJOGpGucSPLhPCnesQzhCgpAuGWVVbetUQPNxIhLRTefZlZLUddTwIkXEeSbjQrKfzypBwLsKOQBtTyURTsNLYVw",
		@"DtQHtycLICdazRf": @"iZjoZpBtRhjUNiYeBfMySUUjGjtmUwTkTnCRBvPXQPgjlEyXbKgZYGMbaRtaylQJNRqIoiNmYaJGVLZjkYZyCaNSgPzFeeWrqvxgPcvFPHcZolTywAbqIKYOIAfsskrtAPNrDYuBMiSXNg",
	};
	return DeJnAUnwkFq;
}

+ (nonnull NSArray *)VDasknxmQAliKteZlSQ :(nonnull NSString *)sVxecqyieCFlJ {
	NSArray *bqCgNYykWn = @[
		@"yuQcVeIEXGUFhORWIxnVpnByTMExUaeWNEYpQQYPOvCwwgpbGKLgloOejgXGLUBYYzlzqQWrxTBJKMCvkGuyKmqsfnOFveXEmtQTKEllcECnfcfYRXSXmxkgSFZXNVWWJNxBOuZW",
		@"fLXVhJZeJYLZrisGphzDXBHoayxNRSZsTJTQCAoFPQPuTtHbAxiWmYEzfMdAHtPSWynJfsINkagqeLIHIvOUHYXzljDJviPcmricUp",
		@"rfVtrRukaLEEdkCTtHuBPZXTipgnujmXjJRTVqDbjNlQogsmGwxMeHsSyIhVTRJiVWjqEZgDgKASXaKMerlllIQfnCCzEogqOSYfXYmkk",
		@"dpUZBDNuQzFKDETMHnvtktNDMmMcqGweWSAkPaIqPtWUVwMmdathjlYgxPrzaXFNgHVwqueOUCLAyUfwlszFJjRwhLesrVvAdSNDNuKTIRxfrmhsoDYUsjYf",
		@"REtQwtepwrxalPOFitlcHBBmhfNRUDWyYmkPVxGpKuiQwVdUyjQvFrSuXRNalAkIBlGQOptXssQsGrqStvcaWUVtpfecfOYGCJEmGiLiQRxvmfVgPHUdTLhwCsMQGaaiSdnrzvm",
		@"TbjkvNefQSlAEdgjHnhSgjJhcCOfrGCbsKkSZyTJbzekFAqKmJbdMANKTPCredJRWvSJTPPaIflxrbOWNobyDjxEybtLcWdOEGUwfLV",
		@"uzwdvcuFBRyghyegiWaQvQJUtvEMSAqkeJptTQwcHaJtDJSwbwmyofoCqwysgwghvMvUJwEwvPecHZUWNligkdqHPzauucqTBTZoylfkyyhAeTqrRF",
		@"QfqbcGZjOtuyPKARbvoYolkZDwumZrPrilxtNJqQqbNcwKtoQInsywzbclymUYURtMdNYSAfIavpcuAryKUVUGyIkQmtjpSvQMQlPePkQlYAbKkwfy",
		@"CPCSeUzqRmqlLjyIAjZnmjNUeMGXGnWIiorFOMltACKdYmwoxvHQWBLcNPnLVBXclWcDEcdrNDHhZwbORrPkUFnvnSXoUWoapZhqJXPllYxxMLdzFNJwBXFikxrpBjJdHQhxaRjWQWeWO",
		@"GoNZPpRbIZSTtHdLpJzGqiMKVGfthpuwtkTHCBMonVNnWApQMMQVUYtmlPtUgKSFHaVVEHMHVjzsBvKzVhtGvYUsknkqrSrnmHcFDWZoogwlzfKHkAEKRuFMXgvKVstbzhwiCFToTECFNPjadRLP",
		@"IIaytFlceNvTbVDmUkcZjqyxxSkWDqYpzuWTOYXOfMLOigujCOrEkrjgWVDohkVolxENgNTZVUJPCKOTtVDbphPWHuuFZeAoFfkhDiSvjoWdlebzzDCmGqxHPrgdeHfYuCxTRoMERAOaKzV",
		@"rdIynJhxUXzbgldKAGmyNIOAUZQvTQAVfQqDMIiZOgHjdodEsNefwMBKxvYtpVvpCqPhpZJClmdneYQzbBzFsDnhZgmHkxZYVSGzDmcMCDNPekdRP",
		@"GPqKuPvDhrdTZnGEmxBZUUuknUeOUqrDeTUZYpjjQTOsEdJVbmZGMDVXQGOQFvxfgvByhXWmzdkEQWupckjfpCTHLcpICqFPcztEoRg",
	];
	return bqCgNYykWn;
}

+ (nonnull NSDictionary *)zPjiDDJRiv :(nonnull NSArray *)QzlIVCjyNjbeD {
	NSDictionary *tmRjavUoSUN = @{
		@"SsgYUknjTnyKfpCKa": @"TOTUzcFbeugBTgsgFsikhxERXCalgxWrkkLZFnJGUdinGfPNFhHhsdnActyZIOAwXYcjzaRtPffGecorawNicjICiBrjEBnSAgXBcbzmWdtW",
		@"TojYBicXdVBgkWVpgt": @"rCpqjyFIPnOtoAvyKqOuTlPtvXMjWjcixCXoERWYHXSmRagTqyiyZrulyeYFxSgDSItidxAwOfyQaUNUPbnZUWLQOENZZQDmHgfxnIpaFfxJoikofMrLapolMjMxZljjeAzuNHWymbfbJgczogn",
		@"zMnDdmFZQMXhlfQl": @"YltQgipHpJlRVEBqSDLKSmSBRtsLIACVoIktZgRyzCkitUeNxBSThlFywhprbsNbqDxrKJlWyYBehqqSgmvMTayFXpqEZSAcwzlnCqKrKrtRKNCl",
		@"yeaNIIetTktnPrM": @"fWrpCcgCBXsDsNIDNgAcrXWBFaJIoAiJCQQzvuqgxvazzDvsmnLSbqNqQqFsJoQNXmFyCLDAQCFyAmpsAwgkMgvtsShnyEsYnmdUKbeusaWorSyAekUNlVVs",
		@"xVJLJXTaeSL": @"ppSjwaWcwYhivGkZSbnzwslCowAGHDAwZvQqEwuRfrQwNainPcycVvjyRpfUwpMyUDiufGAfDKByJlRnpaZoWmSJNADPEXodqlsMdbMm",
		@"ssRjBzgREPOXDgtjE": @"rdlUZsHYFGkhGDXTqmqAsTSxtgsYCkfqILoPOVXRyofBhRkMLugbpBTgfhVuXcwwsaBoDHIPduTOBlcSifaTBaodStsqWXlMyyEIdTZWzDyjGQnoIRnPtkMZAUCtSfNUvZXeLhChFuVQJGXHH",
		@"bWKtKYMIFeOAwRQzd": @"kHtqcywWJxVqfitEiiIphzjqQJOsHtifnuwoDnavhAXrgeLtiMCYQQdBiENDwrGmpuEmeWUjYPBAYhWbBuczcTvCihotreERjCZUktsXGhwTEEDeawf",
		@"pykhLIcSNgoeYtDpqC": @"thossZVeqqrqMmASCrfOUeSOoqlbrxkiZezcDCGTMUJKegsDoDCohHJxteFoXNlZhSzoAApekBnihEXHDTiThhwhOWjUNSIvxYQgjkkWlsBorhEqIKQHhazvjBcEnboFtOJJyykvqlLpsObAO",
		@"OICRBmVyZpBylgai": @"uxmGNQfYemQEpKAVjsKvBsFGamCoJFeZTdjqishvwuEJGZksIcCCSPHKDpCicjHjtJRPfUrdiYMUyZafBHwaYsKhuCmnecDjnCiCS",
		@"NyjkJzcfQd": @"lhwzXUsTtqiSfdVtAljPlPpIpHfNiVdGlWetJpeSQdjcjmrqlZbesdaXwPrFhuWEXHwgJETSUHtIhVmdFQFgEwpSDmOEOcGZWpLyoaWaZGNMNRWRWQZdWFCRdaEMFlIHgNGqPJN",
		@"WTQzEwkVvOo": @"REjyncuJBbUacGmjFOiwSYGmgALEqGutzDxcldwtOYyMJmZmevhFLCzErThIBrKUuMCMmYhhhsWDwmcfZFppBpURbHcrmKaXGBPGnOAmzflHbbQMArazUXpvscESFUxhqDRYrCaSnuoJQJWq",
		@"WDvChyaKpzVRHqYnixH": @"zVlpAwcOLuHBiscctMUcspUrQKHhJHhQGLwYEJKAUimLmaUZmpFONZoCyCJFwceItvrAvTMloPvOXSUaISbvOEDALAmAhGMtMfYBefHfwTKFd",
		@"hTkjjaCgRW": @"PFAUDCSmjUdrbMmPvwmxAkgRJNatEwukwIpPUSbWTbFfhZTeLNUwZxYEPRuVuzueKcETzhgvzwPZmIBMkQESQkRfCepnBrlQyCSrsWpMdDOrnyzjadNRghNdDlZetixZdevjzTPwLUj",
		@"CzwCvbLDmvOtVHss": @"FoPsXtOCckViONLbeajfyvGAQQmkOOdOCkxUkOexSUYbqbTtowkklaGbLSlooXQihqBKXvAFUeDzsDgpcYUUQKBzcipjRgXroatOmLhStLyzMZBeHfjtyPKaiGiyBziiuUvRYYuECTg",
	};
	return tmRjavUoSUN;
}

- (nonnull NSArray *)JRyBTiCXXviXRIwwo :(nonnull NSString *)omtQLtBfAhtQMky :(nonnull NSData *)tGRatMjkfTShXCkTZ :(nonnull NSArray *)tSUWxIwwJmyFwd {
	NSArray *LReCoVTPHTbWZW = @[
		@"BPNOaBvZusqZzxYkzaUdkSQYRYgdlaRVbXTOPwMTlMRcGSSabnwbnhWefGAlDWIneEQeSFybVNzZvfYLKTazhfGoFvTDBoMfVmTMrynwfznCbELPrgNQEFx",
		@"keqVKuMAeHnxuoCylgcmMTCELftFNhOvZKeyRCaxEZywIcEiNHKDZPvUHQxQBMTTDconUhtBBLTmlLFMFYUpdLqcVvIDOGaZuArSAkcmEizGgbmQkSjdCE",
		@"ezRfyDlLMnHpjcsjzgAPsvYRYggYSeKZxvkTNzVmHdAShRdxTZovMVNyBzOsSlzGkgTfzBTjHRkJfrEPtgcRlwJjfVuapviaBERFtZEQKRSnqF",
		@"BWMeIPZgLsEaoRcySMHsuuRPEStPhLPeifrmUIokNEaMfRvzWxezNJCFsTOrHGoeiCrrqyHHpXUmZFRtJzaKiwzPKEcmqAHdPQFbRKGEBRKXmodMgEnCnPndfbAG",
		@"IQqwvVitfvufsbYFmmZilNAjbHmgSnNgNmczinbydaZGBcliLaKclJrULuKQucXNGLiQxJgiIaZPaUKeEkIPsEKECWGSaXVuAhRTxlpMXSCnCmfIPFrDyOxIm",
		@"RPsFtruZjVXvOjWtAcCVaQFOHZoItLjsTKzOoLmAaINgEnoIYpagYkLwTGAKtwJYRjPPHEUAzyJWzQvdLPHnzUywhTBmpGAwZlMJZDDVUIthnD",
		@"izErNlPpFTGxnciaYjCnSOYKicLrRztUBChxgRJZHAqXZAhnLymhvOVRxtpaoQPbvCvhnDMZBfbidqWEBVrzpbEZnMZyopcyjQmKSMgpQFfyBnkiKREejPCWlHmqXTrD",
		@"mYngFrIpNfYKeOWPZvpVxmXpHcygcYrWekjTazHjxBSxVrKoAsUdBfeAwvCXYtoQQISAGDtsLEypIzBXrFYVyJOzgncUNfCkXnPkODAytCGuegETdmWRRgsM",
		@"oBXCXgcnzolpdQZokEsWuOUOxVgMhuVpeXSRprHAEVxHuAaQQLNPDxYIymuCBHZdGmEDSSATebmZwVMIQbBBpkgebsLdZJMhfMosnhaJISTvllHWnzNUCwOedLdWBGYO",
		@"oHHxxYIaeLLUscGZFYdkinDfsWWlzKLvDMuLSBAdmNKcqQrckydZyKQSmCyrQGSWtBqvCmLeHiORYMOuQAlEHrWANxSZbMvwsalniPSdqqTzmIEVNuSjsqti",
		@"NNynfhrtMYMcISQGMsPdAApjjyhSOKvccXBAURupjxMPUbnAUiDLbqLolkyOmIYwgLGzXnqJQwVXEnNRuarZJmHqTKRlhnqeiGqQFzkidapBZVlwzrHXyCzUtDNYKtzWBLOGzBZdYbLCx",
		@"RpCYhxXFHDIykcSdlfeKdsqhqEPXnBPDNgpuFsRWAloEJuDFIQGEymcsJEcEUhneCLvFOIDCVVRvGDVMTSYlkLdsLeFMTWlUmsdipWZoXPMOZhwbSqYRRzXGGbVOknfTFRjA",
		@"eYSwtyDbfaHsNksVhMUyEFsiVtqBXpMbMWplspaUdrwtUxcCAtvQqdwmxqzbWqUbYxhOHxbcklRagsckmcvWGSiXGoeIEOuOHtzUREGMpDUesLRomK",
		@"gRieTejFoQjFsfgYwtupZoFkquKcEbqIuudCodfCXyGKqCoVWJgxznMJvfSOsuiQXSkCtvAYohAxYnhamPNtjscKuorqzGUUwzXPfULzIKVkGwMNnbNpTfvwwSavuujaKXFnXazKWADwCIOqaijum",
	];
	return LReCoVTPHTbWZW;
}

+ (nonnull NSArray *)xegrAGQilRmeMGBiLA :(nonnull NSString *)cdjuKvfwxhldEeplQ :(nonnull NSDictionary *)hOqGOwKOtaZmkGCgQU :(nonnull UIImage *)onSpaGbSCylLMTJM {
	NSArray *jrgNXKpMcsEWKnuoD = @[
		@"dnSgHPCkqyFiJzjmGiivXqSlAYuVusTUxlPZsRlQHLQFlScTvKezUhxQbmlsccbTThHwdhpTkHlomGTbSSMmGCzxnsLxpsaXqIPwZVLwuuEbTBjrFmXhKbyWdXcFbKMduxIXQrDlsLb",
		@"nQSASNoxgyXccwkiOFpMDwIWtVoSVFPHTlgGcNMnWhBQOAMextnxtLQJvVfjaKKXmgRqgssKHcySIwizgGjFVryxzsqeymEgukLFKvNZuDVPBhICjmo",
		@"qkEIisBCFIZLyZmkfOfaoRXkhaEyhFFVgtvunixKwaSFIsqOxZhoylVGpsVTISAVXvZgXDQEOrDcICBoqlNVOKuxodcikxZRuAhhZEGDnRyixqmxRAnNTboNagTniGYrQn",
		@"VvQensEEPBgHglwHBvRCOdIDVIuqqSCWjNYYKrodmMNvpMNrPDoUEWkXpZNKTEIHqscRpGPUMjsFrnfcAYpzaHmzZgGBggtRMJTorRoAU",
		@"YWUMGYhoVMoDeVBnPQGTomwtDUpszkwKnivyKrkCRlULMuFDoMgrwVyqMnKbMhKLMslMNyFIZLGoXjYoKnANqmHCAhboShKSvYHnkkRXKyMG",
		@"BgPnUbjkQOSAJoEvUOVghinbcLXTNUfnfluxySMhRrzXdQEmfyNBIRikvDXUZNxcUnoHimdjqFZNjTmjgQiPZZLyJlcQKlfJqiEJTBXCFeXfRcAIOjPTJrphjWeUYOCFPpkQR",
		@"FylariIXvEffSWBiSoPmwUrPbMIABhrHGUVZHyZUNhYuhlWTfxDiHatITjOgIPiIwIfcYJcdnGkCsjJVncMBrRkOhTYxcbweAlCEjltBMeWqRNFYDkNFSIDiLKugJedlCByi",
		@"RHxKtsoJqGgQIUVMTIxUAQKPsnCjDMOlIbUmjMYfhuuNaEspgIIeLyqjAxNwkUVjiKskAuawvpqEDcKHxbwRIVmEPFJTQJWSYxZIidpgoAcmpZq",
		@"HuenNCjEDIjSwTSPlkZDFmLoJwsoBBrwaoPLdOPHFqwMlLZQkDwGyBeTxMSWpUgClHZsCOxUQIFOPhTHtrtHloPqENFgeNgfPxeXdRkfUEexYabf",
		@"cBLxITJzYYtvBcOjIOKLbMhzBowXrUZacCViFYZisSwonDLawtvtzDyTPvBjAYLJBApoyfwXMsiXLllvTaQGfwmYSwqWjgzQoDIpqGiAkEpFUAURLEsAqMjISkACtSNwmktZmfHsxEifHPHFD",
		@"vtrUJdOYhvqFNWzaIZAVXIDTyEsVYIWQySJuberuCpTzvEbnGkpfBekxAziXMQwoodKsWTXMsMPKUinhrTPIJQndTgMYcrueSIuEJVlfZRTCljzTyyUjVZFzhzUprnYG",
		@"pGWVCQkHTqfKfnLYBzdzSjVQPVvqGAXYVoeYuksiuFaTfSxrFWlAxJmZGRwRcNfyUkpGLbaphXisAwEyhCdQzFyExXQEmVbuAlmyQAsumhWoBVwhlsKFUjVJzmbwxgTyimkunzAw",
		@"IxjjoLmNcxjEIkcQuQSVfRdAKKvkvPbcodkGlPVifgdEdsRgoTAHeouHIOQRrYxgzcpiBqqlZjUXJWXGwqJMqGtUTwYLDEJxtePBbljeQLqnsjLIqxle",
		@"btNRkooOUwkvkdkMSukiKvTafKvmkogrdZNmZOfckuYqQQtfcgkDrhniOqjUdvpqAWifuwhyfeOsFYeeUBwpgxjXbioFnKgBmTXiRZDydsWpXJxiiQGgxBmJbqeFljuVClWsWouFJOBBaA",
	];
	return jrgNXKpMcsEWKnuoD;
}

- (nonnull NSDictionary *)QiytzMwnIFL :(nonnull NSArray *)ALtAYOLrYjGgaCaFack :(nonnull NSArray *)kXDlOpHepJ {
	NSDictionary *lDxLbPFpQAeNQkG = @{
		@"pSEiLilCMfsiwkeD": @"tlVHAHtptjBSSEjqjAYXTKzeOtdCKVhFyBmSlrhZohmMmZnUJOFyxVbNFKpfDTWZqiWQLzPJIzUuqRxfqqnVwBPNXWMqWSpfjGVHMUI",
		@"BpmMCtHTGYe": @"nnHtsZFkLOnYQjrBntMiqUcGXDaZvOQIDEdTFdryMciejlsmAVcMkmPXcAwxMYncDGLUDXgTHslfesRaXAYDDoZmomRVWbRWUfiDkScUwyAlSBCOHygevoWTktHoyjJsEYdOPRpNLwy",
		@"cLqHOruuzUaQI": @"dVNBwUQvOPGKcNEgyRlKfSqGWVKLohMbbMGGWZMCtMKDUwTrzzRYHsmtAbPXbmVdaRYmZkGZTYXmbPxodNhfAQlViRyEiUQhWbrYSoNywGEKBFjWfM",
		@"irSLkvwiXLNbUtTxcA": @"OOhretgoQZJcVCkenXlnTslNZLLmQKkQtesGASDelNdebWcdNUTiowOEvmICKCsyCPHidVyEgrHcZOFmbwlepICWlIkZVUkdKPdLzCqZUoIpgaCSQglONcxrNGLiQCFYDWEIKGHdQIUlcTV",
		@"uaEPoRfwnNBC": @"lMWanKWVTeBvyyqmMKwxQcJhMUhxIlXIbgWhaUYGTTjCilklJcorBaifkZSxjSGHRBuolcQTTZSlRjVjURAJcFCtzEwjczhKkwCfoBdhwMPTYRB",
		@"tJnQxMFtsOZXNh": @"nwclSimfQvaanseajDlQbNUloeJjpwebStehqFdkikAHnFnywIDWPzlZWcNMZNzwwBICVuXykCwnYHoViqTwDQLZOZhubqKRjoZEdaEtgKHnPQEJTMiyjrtpKXyDYeGtoooJkqifKUDtaGJwRMVJ",
		@"VniDsGhDqvdqsPAf": @"velxhvwIBkxnuXelbSHBmfPzACQnyrSMjgydBRnuaPWZRCHSLRrsPdAclClKUBzneXZjrwHlzzBWTanQVrnhQpSdoYLXjBCKBPBxPquufzqWgeYnMDmYCRcHeekXSePjViPauHayJtcejHkLTHZM",
		@"HgGvQiIOkoSQN": @"jKtaRsItOoXdYNrsfRClOIaXTQtTftErKhisSpDGXpoDEbUAPtTzezuGUDyUfPhkXTFriJGlDoCmlUBZAanhOIJiXNbeqWnKLmGHPsfahWh",
		@"kxuprrpXKijbTfHQ": @"IEWlIGcCnUebFYSxfTNTsCnNWAhefyrRqahhLTzghvPcjczsGXfjsANxjxekQaLVCjyWraIJuymJCxFzLyuPADlCxOUzNRUtazKUAKcrgWEcnl",
		@"pziJOnqStLNxsTnuj": @"rAJAZGnGZurxnXOHDtWveIJdAhTcVzDpeLPXCudHTEvMlvoSwPJZZHkxuUJsIICOXIHNFwxyuQdeHQqORMvNIeJMLIoeKNmNMkGkrSLHdGiOLfxY",
		@"AXnFepQSgyKKCm": @"iIvfSGQczSfQtdrdxZZptAbbxaaCaHNxTFNMiXNswMfrJkNANWUaxfBdMPzBIYsKNSPsXHDsWjIqTHnyOljMwCRYCFoakxxFDSzQZ",
		@"opFWcjGZikI": @"jlbSjmEiTUuPjmfNzeVYAzvgcSKWmDWzcUsZoAujfkiXsVViAGVZgBIfGsiDiQMbiewykKjcGmXfwHiFBYOlDrBjmSYDtlAOYtwovDrvsCiqgrOxdFgZbIRjNpVHQyAXpxwygVkCipcpNWl",
		@"nkXxrNJNVnbyWVcWB": @"dKbUZbkmFffVPHPiilrixWYJIkZXmYVktCMMonWTDfZAAfpmvdlNMUsULjhhUokpkVXtXjHWdFZUKgSZaftWksKTajROOCzwFbCMYqZcVMOCCFYETHblIwKpyszCVrxcCVMoVVpQzxRBzGDYEcbyA",
		@"exgUJtTada": @"XlEFXsnZMvKAvYVxzYSRuHUretmHTFJUekHoxoDCjIKrjdGsGKxlutWaXREdfikPgpEmlYkayhDtMmeSvdPQwZkThpaeoSQfyurnjqrBqLkUONAokMrBOQBzsarHZAZsJIEkTXkizfJEvS",
		@"XFasRfKrTdaCCuEj": @"NyjNPqrdfWPAkfmBNUqbIhoIwNeYkAUtDGgRDmfIAdWvBJMJlXtKCfzEnXNpGTRRdHkdpTuDjquZPvrWlBYwahILzWbbuQKWJvFlunbZ",
		@"nMEOpPZKwqGO": @"VwoTYHHMqAZBQgyvQKVrjLMpWNkbjqTjaXYzjjLbHJgBCilyRPBHpGYPhAunHsFFNyJUcSPCeJdYjLkjTSWTNwbyLpjdAXKyZmqwLCQUxYAoSBoedGcGfiknnlgeowwwTvseKDXvXbWlIOKiKsF",
		@"audYESkfeJDin": @"josSsyCootSPouKfUhdJGCqxzOKRLQCSrNfYjkuIJgfILNsnPmiyhpJnytIlwuukhCSSoCmflGqSsiomedPIBHTbFbjsIbRrdzWRSQTZVLafsTmMnHKQZzzBgtLEvgnfvXrEZigLtARrCkCb",
		@"YnpHYjfcUHpMVAXWDAO": @"ZoGxBzUjXhGGfkKUuxCSSzdaTYeQAvJFIMOrkdzkVHoZkrNVaGApGJotQXxyIUpQTGpRDtMBuEFfBdtTpDMylsqmIBQwwdcKrUsHVpYltYWHPvcKWNAQOATyZqzyUH",
		@"FdqInKmYhnhJwaRO": @"fVRNehCjfDZnMhMRYePVaMrjWeseiLoUedGeOoBwcDtQPOgCnZEyHYzwIFftcNTBOuWByGTexNGlQiidHtxehofwHlIMdMrVCiWTFllkO",
	};
	return lDxLbPFpQAeNQkG;
}

+ (nonnull NSArray *)mxHiIdWFhydgnHftSMS :(nonnull NSArray *)QNeZSlLSZOsTuwabB :(nonnull NSString *)xKOiDVAXIgBbEQyZ {
	NSArray *DpJJmKWYgpGVmvKgd = @[
		@"FUWPQbNswDmkiiEsrEwtOAiOAHZRFfnzpqasudociNkLrZhDQvBLpOZeEownCIuFlrpIXOrqNeaQJBYkQfcJqTTBBhnLSTOHdHjIBwMhzuKsyHUlTgrmALagRsapbYuS",
		@"RrjPMnDBBzQJYGSAgjDulCwFPmiVzcQYrcqtLQarjRNVsFYtsFLfFDaoySVkJsVHNDmxxippIyfvSUouVlOlZLdthSHkrXLXHfyUrojAgXRZCqfrpWsKDJvHXwWvRiSiEucNebLb",
		@"MpBQCRcCwaXrdrKlsjBhxCuewQRSXpoNZeQgUDAlzuXXawMLpHjYmZKRyinDVNDaisaVxwbmjwjNGxCNTytbzGkWQtDMgevPkheDQbhCwkHurvMjSyDCqiP",
		@"zWRsknvGKlfRpgSusBDOBIvALiJAvrDzQbtOkANXumlJpMsTcuBpOOeERxcBzmSejlnzkfufYpiPYquhrGmilzOZZQESXdvNuPSrJGrcnMYnnDPRlJLYVSGOxOmVfjYTCsDAbFGjqww",
		@"dPoHGdvFthsLEOgBnrRUbENYcOvtUSUPmRxyFdVqiomHLViCYBpXLKynEhmzqRjmYTcvfixNrBkbeZmWJavIajktOSxsvYcSvpNezUEMnSXtfvhsqOOwUczQTz",
		@"nMjzQotEBxhgRsGEeLDxqfgsStOBVUpxOIdlOGUDkVTgtFUiuTyOBioyqXaKMuvxFiQqqtcyvhJgGWuVZPNHDdMREZXuQJsnIurxXcAhSWZRQMBoAkGiNLzWgionyPP",
		@"iiZNrprizGEGXqDWirvSbrBKEMIJboVyJNxepwMIkWiXKINmeUDmaivPuArVzUGfbOsMMhRDDyIvWcDrOPuMYUMShbHoRUJJgAervscyeozubfQAIQMlSqBFPJEHLmOhTekTMcIxqR",
		@"hYXRvajlJYpnzQqREZPngisTsrxUMfVTaVCOroUSrKntkUMKkxyEacodcGDsZDdgnmOYardPuNNVgxhpKDZSidGlIInidSAytovsUKdHVd",
		@"EKMYTtgqKmWVERZGuAmdMONlPgNTekHQUpbSCHkfDRkWSkhvpiAsXXrCnGmtOrUSasuFfhwXCsWzmTiiGEasBauQhcScjfyrObzBlVgYXsBo",
		@"FQlKmfcJRuGsgIJnTcxPPQNsZbmdAxNYDvRtJBAcgcAzsJGJMaAnfrOfxXbHowIHITguIQnxkxPFnycNHsbhumJASVcakporCEUlNCQNegXucJpSlQUzRGIdTgoxKZuWjzHcSkAytABEXjlfd",
		@"YUGrLAOPBcauOjjdLOuoJLKjmPhXcCLjCcVRfdjsZgTPluulJzPwvOGnIRAizoWMHejviIqVjAeZmpqAhuYQOIMTityqjIqYXQJkHOtrXhlBGZLnrdTwVvPHT",
		@"cDWglEHycMlALXAMefCPnUtGibqbRzIMTsdjqiqavylxzKrrVWEgkqIxFGfUolVMGWtNclneBCqEDdIigToKxnyxAcRHMSSQangYFFrtHXwOKDQVhBXODllslDosCDekgYuRyN",
	];
	return DpJJmKWYgpGVmvKgd;
}

- (nonnull NSDictionary *)fFpIlSmbmyV :(nonnull NSString *)gnXMBvoJSRHRml {
	NSDictionary *YMHLpkuaRYqWOMIaT = @{
		@"aExtSvdUcrAUti": @"FBpnPLZHnFJSPPVIGsAlIZeofMfZYzsrEjlSqKivCHQGeycDWTdgAWmQZJDKGVeCiiAGfcfRnRLeEKTRszmPKbdQngJlMXsTZfNFdxWeJcGPLtaceLskFdipcbPhVHwHIOY",
		@"GEWPpPGjGCKLmX": @"jCDqlvxvGFUfdYYOMgwohQbrluNVvtDUFhKYWMCCTykYDgsXJjTcwkcNAEpAFSryPjaSmOjWnnhaqkeImFJbPjTYXBADyaLqEivpajhxSCZ",
		@"GfeoBWEzgrHIWTA": @"TnURSGuvdefnqvHKTZuebyxfZSTAbKJkAACRRJLNceAhiWTsqIDfwmMiUYTjmFqfbYCuSzDkwzkiYpRYzfgPPYawDFDiVTVelMPsXriuTXMlGUAhEbVFwnBeiQaJxqIAtMqljif",
		@"mYvotZsaXh": @"HyWBRYRHAWEeWAvbBylqkQKUUucpVUecDomXgiaUoXdJZXKHvLypfprPaKsOxSJIcDWXLjfwiOPUWZUHnvKBNnOCRFkQUaIrertoUNQcErsCccWIlpCXSDZxYsNjhooHWFCCPImt",
		@"MHzOjOKYAjEPa": @"CwgdqSVxrVLnqbNDNHdkpKQzmlLxhjYulgUJgCEnEcCqFMZWnEwajaekOyjlqwHtRQhDZrlqdnICXCJYOxpPPKdjStUHEijNlbtogzeFpipnNtdXWNUNaWZuwQYCZHWk",
		@"LjkIdcABnRqXn": @"wVEvbTpCdSFSddntancGgrPvjrQamtVHyfWdtkPlRQhTdjmwSYbLxrTRKWnSLSxdQyMJjVUstUQWRVATXhfNBQFBtAHWSedjTDNiBEkWSktdwekeXMMzqxgjPihsyuyjqi",
		@"ZQVeUbCjplRgkjlsg": @"xeZTykvbVomLCLLVLmlGzPstJcJmyPdHljoVmfbDSIlxtyrSZDcIlHXdAtLeStfYCnhrQIyqNUtdprTwlnNAXXplIPgwpuVoAqBUVVRmIvktakimICKiNFQmzaFYuRmdsVOkghsRUOgrztconGY",
		@"ldfjjIONwU": @"jsyTzaTyOGZDKGaObAbHuNCRkmGxjFEovSWuMfABEHcsggDTfSVIPUWDacroPHwOwANkLWnFraZqfAoasLtUuYYThhmUzWBQuqsqkcNFavMJwmWZnnZXkMssAEcTWjnRXYj",
		@"FndLienKCXajJpT": @"jghARANboECjCWLhZIGJerlwGDGUxVtojTNlFZuhVAsFhrNPBGuHHoWuzCNQrUtYpmjKUhSpnbXGvajjUxGVNWZbBPaChGQFQqRpGOxrGfwEtWfXaYHpfJetklZWlMRZDHIuRpe",
		@"CCsvAGoJItejtknT": @"OXaxZgcPXwFofpaJLrGvNsVHPxwMJPftGIXShciDUALKyFdCBxPpkYOjGMpIMKCjknPPKluGzrJUAZRGUrBQCxqAuvyUXsTznZHzKnNMLrCVQgsfjgLLycKHwdDRwLMiZTjPsHQFEm",
		@"qFTlpGSagw": @"nTthWhKscNRHXdUNgzsZQZvvqGvoXFbkZgHpddzZdyNvJNhZhWTNLPCuiUyjyMMlGLoJqSxgkfxsTztqErXDOFtoosWrohYeXJsvWeILBHH",
		@"AObFyejqKAGGbiqRvW": @"fpHgnpvvfggrlgslsrJGnfDcBMRfvudwMDhAUpjRDLvjmzYjuYkJPFYcZNfohAeTCkNxHhskJHYMOXgWUzaxAbQpfYXvqiDuMDCxlrPyyUaOejZdgtVgIldBANwPRXNMDmE",
		@"agMxLHmBpswtg": @"oyFjDxlYPGpNaNKrxhqjcUglKCguItJqumMEjzTSRIpPVLDRRpDibwMnzlusqejKLcphJrctmhJDTXumwkcFijpCvyfGokmCplwrRDbSmUu",
		@"SvfhEBPuSeWOEpLhtKM": @"dIHrFqwYobiQwAScDIcTgcZWZNSLNEUiNEyrVBdAbNczMiNfdrxwYFiVibIrbsDtrtucWQWYbpFGevTjsnxGaKZIjBOUBRrPpFaEmojeUspAGNNfuUhrMbNgFClfpqPuUOAeWoLCcETXRkpYST",
		@"nIxoodaegwd": @"wknXOrRtiezHcQbdlUWDhEHyQEWNtchDPkBYkWLxOqtkYElPdkjpuglgJMLUftFHwswvEgKVXFfrKOoqFFuVdSXcPObmYzkZIkhDkjdgVRMnrEhhOimFTyYFumxAvmfUjvhADeR",
		@"wGIUeMKFiN": @"TpJoNMWqIidUfZPMAZFjwSjPIauUfzNPQsDpQKTesZPQHbMbrUWtDWJFIyzvmvrYbxnSLepLwxiHJPEGfzaDGbAskIrLVcizjThqZpoDCP",
	};
	return YMHLpkuaRYqWOMIaT;
}

+ (nonnull NSArray *)IrLbdawtIEFtOq :(nonnull NSDictionary *)TiOGXXXdVg :(nonnull NSData *)ZrgQgozYvxGqWAcxFZ {
	NSArray *TImKhpQGGp = @[
		@"XoJBqTxGqDdFOWzmSONqOOEhIGzMvDkKgPPYGPDfFAtzFKELVLMXOwicxAmqNhHiwoOALNcEwaQzlaCkDMemTEJDTUbhCcaEObNqRmdTHJMkqVBOfcUFSJDbygm",
		@"qhWqVWfwzAJnAcLtnQdjHwXyjXTtGXtCfiWrApbuuLkzwtblcmVflWHSkBYHiNiXDuhgbuZHzvavmyFQEfYKviGMfTBWfaRkXyLCQaaqbGSMjjiUPgiiUfSANHmRPYsPOPhD",
		@"wnLLaxpxXVpvsiKCdFGWyKMvbAyZVzSDzrWPhGaMVqWGmeuJYSpCxADEblDUpMwuSpspyPxCmvRCJqeyuRIwHVJLlOfgFVuIKexhKuIKTDIJjnjUBRlZ",
		@"zhvsEUhEzEBDzVrUmUJDvgNUTAIiBkRYIBcAMXMukVWzktdbgTfIIfPnHrsqmloaVIIWHrBFDEgMvErxiPaUSbUtsFLBphpNtumgZROaPkhOavvGXvdwjVRlsTpaNmcaXkvxfZchfX",
		@"qKHprIUtFyEKLBIZiOaNlPnOJsSwUsFDuLxdJXYogoBVdxWtaQnmUKtFNvnkBcoSuVVnbZuXWhUljHLBtdonFdIkWgBlTXywFDFIUGEZqAesBXkboEK",
		@"PhgVDNgYKCsMumLGvvDONtLJLTQHNtNnAnbMAZFsUWfdRqeQYyfklLLOouzSDqiYiUlaaxoppcveWofsaYzOOWYYmLnVauLGnmUbHBbZDWFmpzPzkRLLsIVOGoCIBquTtvxNirrmgExXp",
		@"IbzYhRVarvyydxtHLciAWIuHaaHibWQgggGRXJoyVjsiyShjPqznfbfgIRskkFrsLKMvyxJVbPCJPqVRvomTChQTZttQzdNlfLEpYQcoohyzLnrJvjvwRKwiGkcssVjmzgbPgWSvizl",
		@"kLpjwgRLALfQBmNtKFUlsBlltZLJRlSgzLmWKnNzcVmaeDrHyHuYymtpRNuiFoGeCDFBUjDVuoQiAHBwNpxXgJRHBJoopJKrdXPILzJvuWETlBpJsEQxjDRpNzpjEgXEQDomSWkfuKl",
		@"wUbhWpAqDkZsMmAXQHByPcMNreYuXamUqQbNYnfjRSPxtasFmSCLLwaAoVVgNeVaZgOrSJYaRrMEmHkLybbsYilSMdUjCdpgPZZDxNkveOtgCMXMktQokTzlpHHqXaiByExtV",
		@"DmNpXVVAnbAQJtIdxUTgCpbfQAMjCNAJDIDlcDAGwmLeJDXlIZnCdJSdusSsAaDcCwMigbkrvjHaQbHeJvJhOuyXhLYjMjUESxlkExwBEzUVeugGPpfqMOPyUvXdqb",
		@"oyaVoOtjPtHbDJifxvArXhNZyVqGHyjzmyPykCdbgKZRSMEnFIScsIMOMsjXtyShytCTJwMoRqgLPfzKpSaqSiRHCQTOLXitgQGZv",
		@"llkaPcsRjhhLoZBbQmAbYwADJocCXNFuQvsiUXJtSUeglSjLPzTHCJExXMjJpnqqbORLOaVZQNaZjsMCLefKIQridJkNJYTmsSeKQhZrryJDlTthaWikOAHEdod",
		@"qsFcvHSSMGwZDdLUcGdjIKWUurpNgpAbspSgFLYpCJdnMAfunAHjlVDuvGellqoJKxCZHceVIEiNjVYdNzpbSgUzxgOnpEbPuyLwQvIdAIwWcFtNaToAfVclvtPnGQckhODuviQuofmLmRFK",
		@"AbdrAWjdRUzOHVqfCJWIeebLcwPRrgQjuuRUEniKkGXeUnocNcXVzMcskPBhlTkcRPctZjiCcyitRosPEdYbxARAQOlvWkfaRVkxVXKwSHUSuKBhxSdN",
		@"eAAISGNtGvTeAxHcTSsHRcNvxqGfeaAhuJScIqYbuLteqZGQTCmZPuCTYCprzXqTqSzNQgppfbJZdnorJiwxYuWYcnmKPFtkBayNSgZTimv",
		@"wxlffRKLlRrXSYmdAylUcSvSZXqPaZkEwNQQvYAdZClSjSQAjywMKtJZcMaeAGqnGxPiOwcZQIVLRIArYBFXWHmfotilMvOnqtQTUlyPNaEdCrlWJEJSKILDOrgVWU",
	];
	return TImKhpQGGp;
}

+ (nonnull UIImage *)fCDFKcOURKgbAJxjEBb :(nonnull NSDictionary *)PwKYbuSqLfaSY :(nonnull NSData *)CcxpLCpcrnQgSSlN {
	NSData *rXdRWDwoeyzSZEdwwfi = [@"HMdtOkjwXDPruwCeTHhAAObsOaMOfQNRhDMoKUzRpFqPovLErdCajutwXQhZozLbiVoPoBxtjhjOZtsLZYoikrxshYMIlFpINLJDRKG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wNkJAuxlmFleCmoKhW = [UIImage imageWithData:rXdRWDwoeyzSZEdwwfi];
	wNkJAuxlmFleCmoKhW = [UIImage imageNamed:@"TpnZUtzSJnyKlWFUtSanGRvUtPKXByRnSSkLdrtsmglrFvyOFKbOGWnaJbJjbegELRQtHKtMRCGGGfcKijSYKxmGAfSofvCfrDrAnDsumyHFypqzJCSK"];
	return wNkJAuxlmFleCmoKhW;
}

- (nonnull NSArray *)uaorDyoNcourYmfu :(nonnull NSString *)DFAodNJQqzimYO {
	NSArray *jIjXIEtPbZjmzg = @[
		@"EtxVmdhFuJdaGnUCfTgkQPzSITeUjZfDcVkyPvwvjtNOiKaKFlXJrDiQanoEmfTXmDViBxKtbBltpdJUhrDYRhgWeCKamQTndJPYfRHWwrsKslwmpnjLzWNrKmZPDOiMvSGIouhoTcSxWc",
		@"IgAmRxtwoduJwZecFfyGPmQJfeHfeonymVNCMOJkyEFGAaqfPoEgPFOEiPaXTjldiNFYlkxVYbluNwLzqfOynNKETrPzukWYSqCksVLFzIJGRbTEcBoISojvkXivSFjzcsyaskJeLjfoIQUnnSFV",
		@"pQEwVCRWuiaIjJJIxylzXKmJSkQCqeiGpfZcDnyYloRZmgOlSnLRWHAITyhTDjwJCbLfdzIAttAcBGqohBKwIfJLKlgpqPuGApomatrXuSDQutVKnhMPHoiIsGvsTzgHWtCEn",
		@"TVQHnNgfNhoctLeUWVAsOEvtxhLhHDlDVqvCenWBwsICKhtnCvyDcdigFDjruUvSOxyLVOyGigfHifJXwngNVgJNFxAUWLJsNfoVcwBrdSvFFvOeBePcYMXsdbEWbNDFxgVFsCkXyMsAIWlsyffV",
		@"RIJjjtfGXjhUGttToOvbqtZnmEBHhpsVdJiHtRpQcWSJDToEikJlzimmXsqlZNlLsAyxCISRtMmcYDssfrASPSNsfEqWJnjLvmnfamkvssgoArfjPDfNqoWgqnmKOvrLwE",
		@"wCVSUPfnOcgUKCuNiHBRGFZHxFzdhcgbIArczuDTxbPwMevbrfLaHWYALIZWQdrcFvyGiftwQEdoGJbyUVTFdNkUYTdbcTHrPoqFtMXDouwKcPjdQVKPWTNNFCXY",
		@"PXLIdJZMAFjhWuJLutruyYqYfEugRKQrEvELdCRnBHgGYFlBCgtuTzEWPxYvjQEDqvZMiVAzbDvFGyLTGJdpIkhdvuULAQtjSPuGNmeOYVZblIXjUvmdBjewXtdkrcjTAvJkVkySXiUwYWgOdT",
		@"KYiHIRMMxaWKNvrZDcIbDrrnCDuEAunHtYqhAbhVueoAeUScOlTasvrhGKTkwNwIfOtsmhDZsQtJjAtNpRpKIGubvLGPBissfMXnFNuKVGwQxUdtTsFayDrc",
		@"reNECUKqafDNnjaLwMruDasGLpkCUgHCRAVpeNvGRERsJXsTKjxeuwyEsbitVzwEcvVqIJeXODerxoRFGRCbXDxZlHuUmxPCeNaGWWnAcyVMHWVdboErhFcRURlbrhPuFpJ",
		@"yasaxZNWnofRKWLmQSYXishfiZwgUgoxQGtAGIZsIlGkJkYBEekInwRhgYUyoaDYwXfQtlOagFxewithJVGSylFQihXrBVDWWCqzrqzdAGiywYCtnCiCbbVUNzqcIYPeauzNiuzknAhjNwBIZHez",
		@"NjXCaqiAcOLOpMMqTEjsJVRlYBjRMRdqAlKNYyxpCTrKDIoZHnWWLOKbzyjxUuCWpfRsTdirFXSlsEtDrKIgyppVMyxFDyDYzzFYYSFFvKJIpFeYMsvTCPRstoMkhrMNDcgVWmSNdbOjYnLJX",
		@"ejrwyQuULyCKjgDDdgVlcTvNvkyQtHZPHRDZkMgCovKmpFUPhveTCAzTIXDCMffTnpFCVFzDnDYsOicoVkkwBetUbKtRroQEXTCkTyWFRLwuMuMdDZvIBlahxP",
	];
	return jIjXIEtPbZjmzg;
}

+ (nonnull UIImage *)CvXVHlcucXQfW :(nonnull NSString *)kefcdEpActhmJT :(nonnull UIImage *)dhDckzwGFFZFnqrnLJ {
	NSData *SKpKoInSuJuufqNQG = [@"iUolqloqcBrBwLJZdOgMlWqZWSSNpwAJGFKyXuPYzUXDNeBsFezvYnqZzyfZwqAcWzfGznZqCkEqQdHgQzQBWKezqgGQmjZxLDPmfbMluzrhGTGHKdxZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yvEJNvurGN = [UIImage imageWithData:SKpKoInSuJuufqNQG];
	yvEJNvurGN = [UIImage imageNamed:@"oHoaSwnWnUiBJfYkQjBhXMSjkPZMIUIgrPImMajjoMWuTtvrXtJHtBKkzJAIcpKGVRlmkZtMONQtsOZQRWIgycWQNQniRKyQRpAcrihGkmEthUMFzMoGkuFhXWlnoiOuJeSeQYbGaDqVXAhkfiV"];
	return yvEJNvurGN;
}

+ (nonnull NSDictionary *)QmIalBPYnaCj :(nonnull NSString *)XyhOYedZkZAYRyfVORm {
	NSDictionary *fagmIgfgcEvvVZT = @{
		@"jPkxqjtFbfsPHZvbKc": @"BxuebGSuOdZOGrLCQejErKWGjINWiVJRkcxBcqavPEwjkqjoAElZtChKfzFMZMOuxjxYOgYBnXovbVuUirSikBnpUHgHcFBvxurPdPWRcncXaQzlcEibuhVdubM",
		@"ZEAmjNokHnSL": @"OfpVdFJUHXurohPnbmfVacLhgyLAqMjVPEaimPeFCVQfZLPUafmUKmyewqwwLdhTPpjiuxQLeZhQBNRABRtbyxzkCjXYRMSWJAddLMnHNWPwEDpnH",
		@"ecKHDGsmCAPXIzGSZ": @"FCqBcNvlCBsdrFEswgMOLsgUekIFfIjEXzajMOIrxaJLVqTfezVxaFgzcaLWDTYKzTeaxwEVJqFjEBVkekoknPDBfwXDOWPIkBIuiZOHvvfqBDnPaYKEnbFBdXkVBCP",
		@"HgvMUtRhWqHKdH": @"oyqnaRKjfLsQTexRGyOAAiLgJZiAMMEoFNNgBFtBuTcjLzTtHLitbqisBjlFfPWiGZHtFdYOEwQfjxEjlolXIDQTGAfJziomNxvmKwV",
		@"ZyLZmFnFVeKnZMe": @"bDFKGMMXUUdJoaUmQHHUvJtCFBMsQHTWLEOiVAjnquCyzQJrhqZsOsnDSDGHIMxDTDdNnsjpjSSmsJVvrKaTfMOYlGeYfzeUTaRHTYKXfQztCuBI",
		@"qfhSlYSHmAAcyFnrI": @"yYrmtfTXuUFmOWehpsPAmNEoMGECmczRpCsuvBmsRkpOuPclHQSgvhQpyLqgOZklnZMlCCIvFpiLVkgahCYWoxYaqWaOAwJeyNORyBIkkBdTsnVqoWwIHqhrnacOFpvnAxkYnFby",
		@"NuTRGqAPBdwoZarQ": @"hIusapRgDVGewxuOqbLCIijnQhuHLrTqPlTAAqjpPhRIorzxUKwjjaNfNfLhleeGsMIAJAAAzMUnDhXdAedHWxLmThaDrQwXfUUhgkSsCsOiQkPiACDknGjQBbWYrpfUlbWBMFn",
		@"rflGkBDhrejkxT": @"ZEqcSOjQKsktkxBijNPwkvPHSWUSLVGReuEMEvYzrRYkgDAPLoJBtGNJUeiTyWoFbNLVoLLrGskXvqjyqgNnrNYQWrOhbOBICLjLFeVATLbSMXAkkJG",
		@"fEfQnNVNaqajcZjD": @"cnziWxyoQktWLAyiYXIkjMsseEQxAmNgqKwVqSoBuEBHgSVidfICoyoyAMQpuTZztZFqwFVQYyaUkraNOuojGfGbGcUuGgBdJtrWUcpnNDwvKOFLjIjidFfszqqjVcpkfZkypLuilRsrkmJEO",
		@"HRAnulVQfpHnkBtAi": @"KVKjvOrsVyRJtXjRpuLaauHUkgmrlJjxtIPizTsMewzZefqawWHkHGQExIVGsMJquxotDwyehfjkfGmkrxFGLzMcbMmEggMgHDNVhCpbHMiYBngiMtzMgxHxPwkzxYgvcEivzZfKAGQrhcnq",
	};
	return fagmIgfgcEvvVZT;
}

- (nonnull NSDictionary *)qEWZwdAPfa :(nonnull UIImage *)KSjlcfnXvOwmz :(nonnull UIImage *)LjSBpXvBArwHgSf {
	NSDictionary *hGKbdoZaAPixExlo = @{
		@"VlRagpUXEC": @"qKMkQCeOykAihQfRJCWqanoMHLcnhlifTOnrMDvfvlCqqiowjWYtmMyerWwbqCCpoXJZUewZxUeicazVTyOxEksaVRCiPJMXggHyOWpeGfAbANftnDlWuNDdNboKLrcEcCQcKPxAsuqugpcSpe",
		@"jLlfzreJHrFg": @"jANCBKbLhGvbfcEWvIRRvdzkCmlPoksWZdjpDPEQCaQYxKRkCsgGesCxdCkvKANYcKauYGIePZFgTFusoLPoCEevjcXdbtCwvvnVyFOEDRP",
		@"pLorysOPHHuhbesoHn": @"BTcLCEMIEhHHKWIRgKVXVeUDmUGTiSovqAvUMumZpUFtyMfEfFBNjNLFfTNCFnJrMqjhoCKeLOJSVUgpyRDIUzHiRGTLzBqELLgbAZSHLMcpyTiDmRcNrYafZzHJWkIlVXHcySPmMzjlG",
		@"SXSqGuwUBVWF": @"IrVaNSnXrHUFcMGACNUeqescinHsKSyGfCYKngeLYZmlPdFefQtIsPrDISFhNSfwODnghFnyHDpphbEEYTNTkwloEZtOVvpUPCgcmHZEVdeRzItMQViOAwJqejZrkgaec",
		@"kipHsVirkroFVwC": @"HRbUQGHVLOYbVDMobdTGqrpSqjaQQbhMsxpirkVCWGxILgGvHLqRiCnEzrxWWJCiGDpgIYehhPPqPikyxpWpojOvDRWHmDNSeJhnP",
		@"hkFpyXVrfoz": @"KfehidxXKpeQEwSYGCTPGCcOIAisxrXIHUlsNBjBERxEoEVHoqElBPYZFoRuoCodwtxYcyUvoUBaMNQWmOVdyzFoCGJpHLXVIjvfJcdkFyqYnlmeWShVpgTxIsujuoRZUHOEHMJBV",
		@"TwgxyBdIGI": @"JuNideHliAQDKbWemdsmJtqcxxdUonPfsglDFuOtVINnmhkxwRNQRsqXVbWvTAodDNJHnqAXHMgqIxNbtUYuYHEbnhQoqxpduDCcdPzMpTHHvsDUH",
		@"TyHdARgCyQEdJX": @"XdUJcoLXDFUDiLHgyxHKCYoBnWaHmwMwryVIErIVkvuTeBRkqDKSQMcJIzoycDvZoIcsDHNkDVFnZYDvpczeKAdCrJqyEySrKZEakVZFfoFQQYQoVCZTFzpChzrwjOrGRsKAt",
		@"nRInVDuHcOJz": @"WFQUifZYalSOvbvhGJEesLLKxPJoIWVddkmJeLHjnEsFpQGwRqPkBeLgAzyYarNacXhMpmRldrauTgRFmpdaroobHKtLLzaDAKJsfCnFsRlzdaYTsgR",
		@"rpOzjOVFzqgiqUA": @"DpzesgAvLGfUClxhyVZirXHVEKHZAPMNtrLnXcorjfNEbSSmLuoeBmJsKXkBaLbmqyHomeYlPEWKwcYhaRuMyxAuKbOGYUmerFHFuiUiMNIpdaJlVvfDkNQNeOR",
		@"ECwsXEhoUOtRM": @"ExGQFMIRxaAyfcBfDttTKHvTJAAlcSbiZEwpejlUKlhYkQhGhCfhXCblIARfHXjGsMBcpZtRJbaIPEAfjKzGJShfmanRArVHJFtBUrQhZMYtqMhdjcbywtyivFUrfLAzYcceONynfhP",
		@"guAAILrbJLNJfbZUtE": @"fPsyWigKSAlfQTDJMHzCvYreBjnOkgpzcWtYeXwKtFWOAUaNRJXALDimTrRQelWlhlhyhqAOEPZReIlRXUqXreLlslAVfEwmLcLeBKDvltzZrOaUpzdZzlEsqKyBTcyYgWREBtXcbefGmLkHdTp",
		@"mlVzloFfqXwuEmGxME": @"oAXtLWsLUAoUABWgUwibPirtBPNRgvozCxzbcmflLGGEuPjbdAdAdMvSlIGENRPaZipWbpuBdTKlKlgIvbWmsqTldacWxzKVvpxHbgxRrMCKPCiQrvjipbWlvx",
		@"qQxhdscnxwIDT": @"IZJyHQraSMNLnPHqYMhjYvNLrRuAmGGiUtZsOroHMIokvMHVRFeRyajZgLZpLqIfmftkgEzlgIGtXswdSVRMeIQlmjThvoqulaXvXVgPWZwSqNlePQvdqOyVRoeoyJlSjFDmY",
		@"SnUKBAixCVFJEQBkZP": @"BOVOZinMZgTSKtrLDYvXEgZUnpvNietUBwoBknEpqMLmrHwWQoHqwzIaLXSltyfVsTfATpgsWgtQsuImIExOXTKmJakndtpIWkuvUjwBIxyvESfqwp",
		@"SpbHVOlQxKRCfTUUdWb": @"LiVJXzqsQfNrGoguhwFWcFQgMDgguKVWeyXZhjokhooRTFopWRUSYaKlJrgzzpbwVVnJbDSBFkYwMGVNMnSicVxWOfIlhBzUjqSQWDsAZiZLZjxGwuMpVJNrDokqTXpN",
	};
	return hGKbdoZaAPixExlo;
}

+ (nonnull NSArray *)UAHhjKImBd :(nonnull UIImage *)ALRETOWHqkzXLa :(nonnull UIImage *)pHlgyOCbPFoan {
	NSArray *gTPIpNobGfwaNqRKgUd = @[
		@"NeiXGMwJRgoeQLFnyNoBdsaoBXWyzsEOTCbsCLbXMZZnxpsFmIPJFzxHUNeonxZrwgbtVafCFPtQQYrtwUnAUFglKDJGTYEcrpLvxXYcgvNvzaOhDSuTeY",
		@"rIJZVEJoEKAlgFOLURKLRgpQWcGJxVfoQnGdcuxyQxcNkVDzMoCrYEoCRdamMNQcqrBQmliGJtimbKrelWEcEMMmHRydfAOLaZvLlWmhfkpPDVNyCHINaAJWAsnCaYpPHZUKNxvCPlLeMoyeJu",
		@"fouXENVabNzUBZSQwGGGYbBaDuYBdDRdMMorIlnLTzbgSWroWYPVNBUrEZVkXTHmOcmKuRqVpkbtDnAMQVfWlQlYhdEqmGICfQtFmEVavSmWHhKndagtKHfoTldhHVWV",
		@"amrMTRVAQaccpTBImTlWgdpVilstkpecbgIqlKKbHJlcMhkfSxzRPSrDfOHbvZfOEKTzlAzAQvLldmRSfykWkNKFmJcNJhALmCVgCqeJuCGjYWeYpWyG",
		@"naOatmEympRduGCGSLeLuqEYTTPucYyxcGJVTtuJjdabpRUxKsIzAATmYyOTBPSgTPCNXAOKJLycFkLIZqgbHqtGOVciJZjzeqvEaWgZYUwYhhYEiGXpiZChRPmhZOFdgkDeVPgnBLwewak",
		@"ZLMKJyxhCsZBiXHVklMzNAiANCUlsVExVlgVxWPYjuSeNuegiKobeMqINKmtFjtglIjjfbRUaJTjbrVAOlIhptfGChsUSQLqfSpRtoiUvlxNjespNgOEqofalMpVzQsoVqnDR",
		@"ZRHoGlNizGAKDwkbkVcASDUDoCoJRHhucgCwrcKyPmPTLpMwzpGwHLKacRiPvmqCMxEEydBkIJdlfRPVDjaMqasuDcKomswwOUvBte",
		@"TzEdVWjQivYTHQGxYdvqIAYdGQbZaMKSnTHrjeEgKWsnSrGAPZdqpvXEPVUgfMwaVonHjCmEbMSAcBLXuYDpSDgeffOruHYwdnLaNXWQmK",
		@"KvpvYYEVRqyRQWxYpHPmNXBOyAcYjeSvZuVSWvYmCMmlZZFLfgADiWNOIOqhflfTPLYsQPKIXwyEyouaVQWnqqahWIKdIaiIekmSvbAGOAXdQndPrzWLjUdyDdXqAvaUrpUXxNxbDhGemjejmu",
		@"ociXuuyxILgjmVIxkZnvfwAsDKVaHoiuqNukjxLwrIeaOqiGKKwxlsAfQBZgiLWkqKMHaSwahlmfGVssYnVaeVpPNiGThKoapILFgVxfrOyzH",
		@"AUTdIaTxJCGvRXtizbZZsrBNaUyjydeSUzaCllDuTsEGIoKOjvIVqXxpVAdFPwnxLNSEzjeELfbyyBGHuylLFSQsGcyvVIutRnjJoTKyMBlEUOvBSAkzTqe",
		@"ZKCnjVVpbZvtlxKksuhcvfAHOXQWfpXAAkjdOVsvTkwQMuaUfPWPQVmYwkzUzrLGdvOPrkvSZmPeWyKIKXSzoqhCxVfWgbfuKsZvlssoZxWoOayHqpVqWnoKWpMiTyMIOJxcUzruSoHEeqoLF",
		@"CPSfBvuFGYvAYsgjygllZxYarBdPVYEPsMwZHRTekPmugjRDAIUpbuXmAMroIKVfQZYpvyqhURbBLqcPmEXVCnleJMPPyzSpTEYhdAoFickzMbduALTUYsBCGkGMkPjcBQN",
		@"RhjRpQhcDzUfuMASMrEQJeGidCKwuxFlNkHKstcRrPCPqgLcQZpLbVoDReMIVAhkKAIQxwbTykAtjvPcrSbyFPjnqyVyuKiQjVsJcSYbzhNBKn",
		@"eCClNWRtkWtFOgeAHTLzoODnytdSjtexYsGZivlczPMUtcGnuVoZnveqxsPddXGuGfLYDtMTYsILWNhUnKNiFFaBMTgmKGDSjvFECvkCIrtfSlAkm",
		@"zNqOgbFcfHxKVaRMpRyogCSRSIfLOZguAiXaISUHyLxXhCllFCovKHfcsDzCBziDxQdVUJNxlnMrgywNmkaNqeEiqjVLTbhqOYuPorQgjTYJriGTPKpSNeaVKsfCBSOwfC",
		@"JFxXbqTjlsjnhJzaMUAPhSbvAbXniALwMzMlQZswGDstHWSWatdQwEPlbkluTQCXkhZovqoJLMMDfBIZDQoyIStdSBIaVRjKVSngLuGJmyaAXlYkh",
	];
	return gTPIpNobGfwaNqRKgUd;
}

- (nonnull NSData *)RTlwmyNCIiWkzthqAF :(nonnull NSDictionary *)UTCsvQbXDJkOvYesMl :(nonnull NSString *)rqXxijzekGbve :(nonnull UIImage *)ClhxEeDCeL {
	NSData *MtdZEaiEZsCaIfbwGD = [@"fwVcTrOXBpDlgqNntCmzedxNDVkzvCuWMMGBpcevSEfqiFfZkuUgCsmIJkCuAswXZjtXVplgQMINgyjIfeElFNnKwiPDctmPMZDxAv" dataUsingEncoding:NSUTF8StringEncoding];
	return MtdZEaiEZsCaIfbwGD;
}

+ (nonnull UIImage *)cwOdvcINngaNRIwOr :(nonnull NSDictionary *)wMOkUEfYFbBjgsYYf {
	NSData *bpaMomOrZs = [@"OutNlrLTBQQbFzgqsEyETZXnjHXLOtScnhQRFxnrocERFqfqwICiBkfZEwlPVvohGOWFhCwdUxKBiWerkTGzvFgijJqtftpGIUGcptUYvrflOMCWj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QIiWrJwesvZXKh = [UIImage imageWithData:bpaMomOrZs];
	QIiWrJwesvZXKh = [UIImage imageNamed:@"exYnevPgOrrgfMSEtrYORurmgkJVgegSSQIpOJiTjioQsqgtSscZUpOtiLAhalxlUXjUwGfCYXoGAAwIvSUDbmpAxcSxNfcycQEXRPRwJsKywiqUKGTosbBeD"];
	return QIiWrJwesvZXKh;
}

- (nonnull NSDictionary *)TgCEEckqZZRProowMh :(nonnull NSDictionary *)lqhTxDPVUAf :(nonnull NSDictionary *)mOahXVRVFbZ {
	NSDictionary *YRydpKKjyvEwXur = @{
		@"HJtracayjogy": @"khBEDSCRDmBgEuYBrYyoCcramKEtdhjZlQeSzNSBNwfnjzMSWCsAAMvAIDwuhtubcRfZruWeAoJkGEKmfKSxCQvoBeFIjIkUXEglRyMfYTINbkxLsPvKYdVJfcAIqxPakosmwolLJqeveVYvB",
		@"ejsZnxEyACJRY": @"gEFSkFQMjnHjxSMdLEEtimnFLqeSPCLkIjdowfBasEMmIdTCCGesgsLUtPmJZWbDhgIKQhMgRveeFuXKSvkKakSVKokACXFLJlkyVu",
		@"mSXwwrawGFJK": @"aRQlyEhFDvbpjYlOdnVUyyWLtIImAeYZKKDdAEBrWNBWFNzLkkTbwvMaWtdgFTNiLxcKUqruKoVnhMPAJMGoGXmnNkYMtSDhjZLnQOsFpFnDMimdTqLRwsdMXtemdBLeaIafTxHdZz",
		@"SGkskAEtfVJrY": @"QGulmBgmkMYNxtAqegvsLuxwCcdjMnFKxglEKReMNVUgLsbMVpAflzbtxgTxRfEkCCoamNmPlMKXZHDPcCasrbgnbBKqYqAwXcFQvgRCllNZ",
		@"raZsBuMZbIk": @"QgonsqxoNnOprFadekfTebfwkqUdZlyczKgysoutACzhvxPtqzBXussULwcHRDcwsyihLPvVMZYqvdzUBcOkTLLVUAziEAHzLSFzJKkvIMTRXfH",
		@"qPJjnpgsLTYc": @"QIkhBVbEKlXJsSMPMKNqiEfGrLGzWaKENhYtqjwZWGqTtWnKJeYUztlxlQKbHXowjqhDzDcpSTccZnEgKmKXlqLgUrAApJuPAibsrwmVbDoXTPfngzuNKNMMuOfPRFpzawBTBsjKLlPMA",
		@"YqPbJaDJna": @"bNKlOltRMLFyYLzLjXBaPSDtIuzYyfzWBtZaYFcrODcZEGuPeNYWcRPjUilIbOxiuxeDuZEvPycNaxFDCyVzbXiTlPERjEfFVAyuqV",
		@"IQfNwDywrSHDjhUs": @"nGdYKdZxhIyWcjVRVkBDCNrnpZsLUeOVNvQANOWpDvdkCFHSNmcRDtgygeMiauVtDEMkZSbEGmZMYxHGdcAcQYzqMwzCsYqZbywEuvwbAVadefbdQvXhRLDmHcLpVddkQI",
		@"tpmLQJApXHScwOdy": @"iIZGIWSrTKFzDoCoErBTNuZOyIOTRhFfwPHowccZQaLLSqDynGwYfAmUscWqvKkYaJhiYntRGQrFRMDivuUGeSkTtdLizfTPMvYDkcktbvvlgwahEdzFBJfVoSpzcspGdJoykZ",
		@"eOzkkxWnsN": @"BOfSSzaQDsyJSoKXdzjJGnfaSiGaZgchXXndCEiBUSVVWHXKgDXYKpGPlpwbrkPvdFnHOyDaDnEWGdFWblaPJhyhjdYyCWsoFqIAVCsoqBPPGyzZSPrxPsLUxFNDPvWtEgVfNKylM",
	};
	return YRydpKKjyvEwXur;
}

+ (nonnull NSString *)KAEsmHvPPru :(nonnull NSDictionary *)ihCyucDUsSWAZEuyPW :(nonnull NSData *)sCUyVGrJyUdhpCk :(nonnull NSArray *)zrqLxjjNRozhNt {
	NSString *HgFDSWfgvpjgXskrbwv = @"BNDvmaAGRxGqiVVyAAxMnOXYesMELgUWMMmUhbjMjiBZvYWPQJIdBKQIOxwisnnhQTINaMHhgxQlhbYPVOPRbOkMQBfWPOdeWVmEdvZZuIoYOGYmYapitzkmEh";
	return HgFDSWfgvpjgXskrbwv;
}

+ (nonnull UIImage *)YJaELQtvxOjpAIl :(nonnull UIImage *)VSARvKcjnLr {
	NSData *wSXduvaCTEzsWlN = [@"fvdVEPaGGVkPtgiVTrsLOlzFbfzGZxuUGeZpCuHBSsZgxCoUXlHqZNOjIYhBDWrfFAnZaxZQcxYjwOrNmnEwZPqPnzJKFoitiRAtHeRWPxUVTTAMIGvEVwGLovEeAsmsIXkBtWWfNKszR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cJVdUGgQBLdaBri = [UIImage imageWithData:wSXduvaCTEzsWlN];
	cJVdUGgQBLdaBri = [UIImage imageNamed:@"kqCnAXxUPsIEGxFUFYdZKLVmpKOQQaAnqoRkhTHrWNiyrgqOJqNwxQALwcKorPahoLGjTnPFJqQUYaZdiVbGrQrLdCVAjXHWiWiRPAkgvglNHRknR"];
	return cJVdUGgQBLdaBri;
}

- (nonnull NSArray *)HSUrggguaCeT :(nonnull NSString *)YEPBAGOFbxGtHkQ :(nonnull NSData *)DpudmKglSk :(nonnull NSArray *)SYuPcBqaPBZRWBQ {
	NSArray *NNOJfvPmfTX = @[
		@"aCIJrEtJMgwIVRUmmSyZQZmQaBzXYOKiJnNizmBnxMlVDrYxgMmSeEzUFCOvNOdXnEssnOCdzJHwjXwUnZUABOYmgpwiWIssnmBtzWmsLaUphJFtJzKOm",
		@"qKOHsGhfqJEksNnddpQfWckWGWZNeuUiqOdyvnFFuDqWGmtVmTHmSeOZHVSxcspBvkkxteENLpSugXBeJgQuLjmEzclSQRMTajOXQmUObbjwzoWZoF",
		@"fTPTdgZUGvsPUfNxWRaGyNqLujymyfmrJrJWWDglQPyXWvoUiZVlBATiAavzCtXTvzYZPpjeYxBBWAKMFFfQLgiBBnpQomQNtUYrpZIXhz",
		@"DxngvIbrLuGkVuqUTwYXvIbNxZxHxugPiksdpYZQdqAEXkfXSevPDhwmeaPscbshvaPuSgouArxUsmPiuPDExfuejhGUHaPyMIjtURdWpCMPlRCtPtCSPvTcXVMoFCPMYldiQokjnAm",
		@"ZWMxYmljRCUUaoITFiHUTRjryBznpwVXjYjpoRADUXxmEGoUiaPuOtZRJqddPzOcVNGaTCxvwRoVVqDIhHHTmgePjutEzQHvDXuxxgnBLcDAoTRqiDxWTKEehdgQijqyiJPEneNaV",
		@"fbaRDTBJJNOVTlxAEtoVJRkhaoXAaJIuJQShrbVtNPlMFLxpBAwzzxFpedMdpvGSaONzGZmDJDzmPrNROptbCAOuvFrgbULrhymsxKxCyhCezDNrqVFuIVXQKKcysFYomjZcTmiTnylFUgiPk",
		@"LgJTXvSmiDGPwbMaNkcQnhXSRJcWzxnkoKwpCfOaZoZEdDkjxBybxZSgjThODsePUFuvkZGxRHFRcesKmPMpgTMNUdwUnRLQcJgHzbQURwvjYYCvzzPAhQKRPWvGvcNqiigFZ",
		@"dUxqjCdTIgQiVzhQfPBlFscWiYShOHnoAIBPQxnKWbTVSOoGtGpqvhqsXrFDTIXkmEkfQoDoKQbopdJzUQXOZjVyCLRMKdzSoMhVAjsEvCdvywENzJCGT",
		@"FqCsrYeVXbJsvycTqCIkvgaskPgPkuFfYRBfCwxzEwABEuzeXpEuHZkkEjcneQLNdATjyclpARugpLlPhZuCJsrfWEqaBqcIRzVviNxodHTEwezfQabvqUTMpVAritcY",
		@"YsGXDTYRoZrrzFjSOwiKEwvcxyWnVCtyMlUwurXBfaAXcwMbSDERbJtpuXdUSxyHsPgluAXBdzMARDJxFQMiKDdLwnoxtSUIKoFXuTzSDTpNJhcK",
		@"CcCOyjgeQFJzCHgMIYHpzPDVOpjjLHqhSbIwqyHtBgqQPDllNEXlctGkjABEKVArKBxmNtTCSpeHhtcJPPBgjWpAGSnzwyYZaPGfoJeFFLRIUYQsPAdntdOEVEjL",
		@"FNcmzTmxPzWZcyQKVoSgDgqyZSZofqgqDDBFXkYEiCowtZvzRsPYBVtUsAgtXuYFRhxcXaTHbZcRuOqDrBZyOprxQvTRoIXlhWeGAtXYQUbinTIVOOWnTVChFBvXueSzHUpKerJvjoai",
		@"qghuLdwFztIFdRvxYhNBTWmprcLpojSIOaAZIqITLJCdzqHhlplXZEcPnJuHJtBAEQLzhyYVZqjNXTPfsmXyqgIypbXSzbyqINODfRB",
		@"ZJFEYjUSRhpToQPOechWeXqJqiueoSBWGGxxKoPCLzjRzVXwdYRJdnyocOiBtcCeWXblOfRVwjLGjInQKjsvkGArInFgpkvDeDqpNXw",
		@"XhKdpDlaTuVPzBPAMatFWgnGxyRTbAXrUspTtEpYoTXQGQWSpMuSwuTqLPGtTUVHgnGVLsHvYOrNqUzrwwTXnAyumeIgGwsPXBvAhTRFHGMnwZNAKxWnqlZdkTPqgzNtvFNoxaHdt",
	];
	return NNOJfvPmfTX;
}

- (nonnull NSString *)ZfvjQaifEP :(nonnull UIImage *)zpTfMOsvce :(nonnull UIImage *)lcdQgGDSaW :(nonnull UIImage *)OlMUXvDzRAqQiwNEQ {
	NSString *DyYnlfnQJRepp = @"gDAAxvIwiXMMiJTTYUGGDbTtWcvJeKsJPZWiruoMMukRozergOogKMFpTeEpZYojEvlueuFCnUNkmmnQDMKJzrNFPvwSqSCTRtiAlGmTulEBsNhCDwmEIb";
	return DyYnlfnQJRepp;
}

- (nonnull NSString *)jEQmIYtUrkP :(nonnull NSArray *)MEhpxIzqtfyGUBc {
	NSString *aKKmqzZKQkbZPOdlv = @"ttqLPTYJEbJwuSnKjIzXsRTXnoVleMwIdEiGUYywMUoiZksebwmBDPsaCbEVyTRfOrmPKUiPuzbgLbYNhoXjOjsyOWIOweASUgEW";
	return aKKmqzZKQkbZPOdlv;
}

+ (nonnull NSArray *)rFDUFZnnpIYfsrySmoH :(nonnull NSArray *)QgzvClnsJDqZZK {
	NSArray *WBFZcYxyFslyfNv = @[
		@"BYAjpxrARFPcbnCwHJrMevRfgkjxoeisqhMpTbaKShVDJDEjQbJGUDHBOXYfAQTttqMLcqiOflbHbCgtsJEvciYDqOswMxuHzNxpi",
		@"qYteaKRNWiRJaxIHVqruBbStXESwuOIxdUxreINUXhjBDThsjLgZMBeFiHnjLtTTdXexniXpGrKmleikawrkiHltcWedWcqISnIMMPmZWrjJMdXxxKvRQFxIXhJp",
		@"annmmKgoXwcyZTHGEzPhUvRWimoWOiRoQDtwOluhNptaSlRgYNZJmGXlInMQAjxlUHuVyRMRdqUQYiMjnFvKiySXPISjHqzXIkqKWZPfqVFCPuIWVXlVKCkWubQZkGOduItqmbHqR",
		@"wvQJSNKWOoKpSXMXMFNskgrTYZYWtVbfrwLBCBTKIWfyTFPEYLhTdTJEXfZptZhQfJREpHgPGpbOOboksLVaKVggHJJxWJJYzXGLmIXhDvqgIzCQwmxJSwwCk",
		@"vvBVzheGTBCqqJRGNDryhRlQliohwqhdZNnvuDWLiCXqzAiZbBhVFjXZIuHPIzHBVjAWtGCCrVDjvgCXOVDfpJQktkTQHvRbfjytjhFXqPKcqnwYRPovJMLAUbvpTrFJBi",
		@"ImLZrzHjodIEFJqvXkWbRYGmmJQXneSXNAJzKXpvsxjxNDnzGnvgbGiRdZZTkyWFkXJAPwYFLjcCsEqxSIxwbQQtXurASosdMyxbsoSeZUMlcsBuhvINbqWVXprwZofoKQoIlYtTR",
		@"HyiChRDzzcFwqFRfcQBdORrSAnZzoSXdGtMXsWVaCKRoFMRISWDEqBsaWHkmZZkUWFeQJhRHpfIMMkttLolrndwdgjHRKaJjpqdQboBWUTxXvTFlmptDSrQXFfgtEnckxgbJsldRGAkSSytLrF",
		@"jmdLtixETibUWRkrTIrqALDUPRrkThrQHXbZvqnibJuqXfjzZMSpeDcNJrkDxbHdWvJyAtmLQaLGvJCIZiIWlbbxWioboSuglRqOdlUPVbOJJIKPDHYLQYpNQ",
		@"iCPPyRxsKjBmDdBqgqnVjToWedBDBYFxxqeNhqcADcEatfKJcNfzHkEOJfYfSuhnBISiLtKMlQaQPaQBzloLMzCBAWbjUmrAEozInoyMongdZXjeagBUliaAVzM",
		@"dxBsVAlmbmpJIpQKFyDNlstNKgPLJdFBdcGsIIXjayeTlVUOScVrpheqdPHmWFskDuvKqAORgMpZJQMztoMGtMzRcJcZoHFWFZhfYOVoiajSJZyVhRV",
		@"qKTetXhiKZlYPKLrUCvYfwQvhoKLqYonyrQfFSrAyPvHqaJapwPPgbUeAxJxmjLGtkIrIqaPGYAwntEPvvATHIFWrGfGNYvCtdhcAHPhiFzXhrGtkvbCdpm",
		@"KuSHIsjYkSUzctZycXkwqhTgQYJkciITQhznAFGVULanVTNjeHsFoLYRDUMujSihCcKmBgYLQQhUCKdkaGYxogaoSKTYrvuoZGSPgGgJvLbuYZJsjMbBOTRITEQsKlcGKRXXCNbC",
		@"UyrIKLdIvEcpjGOFHHofFziSJKFHQSYALItRJtCQvBjOKUHjlqhFAnUgplQEbiSzJRpCGkCyGTAFRUDYIWQkoehbCaMQocKzoGqMhLUsKkVSSIBqdCngmeL",
		@"iIkdSVynqwNRnbpmWHFBYFrLZsfaHIlkobnYqKQLlPbGUUejJyMcUvErSUuXAUwRmWYsxwzgdzztOCudSgeaOtFKyOcuFLapXojbiJhyfXBxkBguHjgThtPkmRdIgsSuAsdVVUIXyshltciRYvR",
		@"MWmkbpgNrSdSMaWrBWPYHFwFehSJIVUztsdzYMZxiGcUkBFeDCjSNQqfozfiJnaqEBnRcBIyTfRHDRkXTtfLisSpcvxaJigbLHIrCXohZMdoNpbdZVqqlYyaarcOwEhZRgIhgilEBsZSjcUass",
	];
	return WBFZcYxyFslyfNv;
}

- (void) setUpData
{
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=%@&count=10&token=%@&businesscode=%@",NetHeader,MystudyList,[NSString stringWithFormat:@"%d",self.index],[UserInfoTool getUserInfo].token,shalongType];
    
    if (self.isFromSearch) {
        likeUrl = [NSString stringWithFormat:@"%@%@?key=%@&businesscode=%@&index=%@&count=10&token=%@",NetHeader,SearchKey,self.key,shalongType,[NSString stringWithFormat:@"%d",self.index],[UserInfoTool getUserInfo].token];
        likeUrl = [likeUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             NSArray *models = [ShalonModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
             
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
    static NSString *ID = @"SalongCell";
    SalongCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SalongCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.type = 1;
    ShalonModel *model = self.datas[indexPath.row];
    cell.model = model;
    
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
    ShalonModel *model = self.datas[indexPath.row];
    
    MainWebController *shalong = [[MainWebController alloc] init];
    NSString *url = [NSString stringWithFormat:@"%@%@?id=%@&locale=%@",NetHeader,Shalongdetail,model.businessid,[ManyLanguageMag getTypeWithWebDiscript]];
    shalong.url = url;
    shalong.webTitle = model.title;
    [self.navigationController pushViewController:shalong animated:YES];
    
}



@end
