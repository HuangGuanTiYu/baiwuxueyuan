//
//  MyTestNoFinishController.m
//  MoveSchool
//
//  Created by edz on 2017/9/13.
//
//

#import "MyTestNoFinishController.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefresh.h"
#import "AFNetWW.h"
#import "MyTestModel.h"
#import "MJExtension.h"
#import "MyTestCell.h"
#import "MainWebController.h"

@interface MyTestNoFinishController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int index;

@property(nonatomic, assign) BOOL isMoreData;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MyTestNoFinishController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datas = [NSMutableArray array];
    
    [self setUpUI];
    
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
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.height = self.view.height - 64 - 45;
    self.tableView = tableView;
    tableView.backgroundColor = ViewBackColor;
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
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=%@&count=10&token=%@&type=1",NetHeader,Mytestlist,[NSString stringWithFormat:@"%d",self.index],[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             NSArray *models = [MyTestModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
             
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

+ (nonnull UIImage *)BrhIJObghUYpR :(nonnull NSString *)wFPLIectNNZ {
	NSData *RlqoFVAIcIidE = [@"QOOJAfXfGniiEakbtWnNAjUFomoxyaXsBHPYPVjvLRahiTbBwkVBvSjrZVHInMDDlJlyFyjHGWGtPUqqfrwfTqhNBHXrQIrJdTVqvybsKhGwPwhEhcv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hTYMxvdUGEdgX = [UIImage imageWithData:RlqoFVAIcIidE];
	hTYMxvdUGEdgX = [UIImage imageNamed:@"HCAjMsgKlLsbPslfUhhkuryLsEBymUBlZqjqsgwcwHjyLjuftpAiiunmpmxeMUuBUHaJyhKIiPHSJSRlToYsDuUeoVbqQjCOoATQMMBUfnoMAvgXZlIWRbGSwabtMQrbRvCQnDKqnPhzHIPxMb"];
	return hTYMxvdUGEdgX;
}

- (nonnull UIImage *)yyOajfVnbalRJt :(nonnull NSData *)LdsWXygIpjhvC {
	NSData *yYtqymnjnOEntpZP = [@"qdKdjfZunrYyjeyqZrKlENkBwpeKtXfPQvdjCzLeHGEAPecIUBOTRGamivcnUzDshjUWHPvlhBUgdpETHGmTxNlgExCSojGRRFNTymtNfsrXNrpkChAsmplFzUsTnf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MeVXwTOUqTTJfdnLhpu = [UIImage imageWithData:yYtqymnjnOEntpZP];
	MeVXwTOUqTTJfdnLhpu = [UIImage imageNamed:@"ZPQejOTqpaPPYmWtXuZWWwbPIsdbCdXCAAPjmLjNgQxhUZrIVpokEeHtlCAqiqVVELfSsGdgeFMgYxuzDEcOHIbZUVYLYiraDRrjwaflAQiKWpwMuyAuMeJdKodxjUSQjBqPmFWUJ"];
	return MeVXwTOUqTTJfdnLhpu;
}

+ (nonnull NSString *)IbVodcbetijHvfn :(nonnull UIImage *)SFUkhpUXmRRIzGf :(nonnull UIImage *)wDhZbuclgGYuoxGKPHW :(nonnull NSData *)atbveBaOeZskLSj {
	NSString *FRRxsHcyGeM = @"JhOmbQQJYdUwkCavOfwSKBRwAkxgNjPNmoxrVGJjDOwPuHbhsgPsZJGEckHiIZCEbYdvqoaMQbRlBWPorNWBnbcoLmNPoTXVzVaDCeUgeumQNoCzmDblNPYQWoGLNHgrYDXCgL";
	return FRRxsHcyGeM;
}

+ (nonnull NSData *)azOKHqROlcvmHaE :(nonnull NSData *)cUwmtYdzeMAOLoKMT {
	NSData *NeVewmyxYDceaRjF = [@"JQUASIjEalAEsjXaXyaPcsLdrCfyCpdxjrMuFqFYRuzXOrCFfeUtEGqvNmgqPBzBwxYMEZPjWjVpxcBMWVLYrYxuADYPYcqrXdneryQLJPEkEBqIsDPoCpgozrytfRLqSZtnQeMTvKdINgkqkXIa" dataUsingEncoding:NSUTF8StringEncoding];
	return NeVewmyxYDceaRjF;
}

- (nonnull NSDictionary *)wIwEOhyMqfxKAOGHO :(nonnull NSArray *)kGMyLQwlofyS {
	NSDictionary *KeYxlAsNNNcaqElgC = @{
		@"vWJdAtRtopJFk": @"LvxHoqozzNDKZPgNrpcwiZGkWdTuhVEvdUqTuJIFneaNsMWCgjnbTQzJRnuhoMPJVKamKFrHAXBFZnoQLBqaMXtEZriPUVxGXIuweOeIdWwVzLVShEGxiFwzkXW",
		@"bdOCuDOENAsMBTjQGv": @"XaIKclDVkzUdWLNqwvRkwskcuWqqwkcUxzOkydnZCgnoRIGKGbtplRksSfQBjXRtdqILRNnpJAThSbRooBktBbfSpoDaeJeTmBklifULtdBYVDSpOQIsmWDylHcLlHMajbGZvasbbGPZgfOVX",
		@"RJpfsutxNjfqbhnMq": @"JFesIRcwZOtKIrVDxkbsvooyEXxvZlWAUomscXDrAidBEvHnMRuifDEUwBBLGmnRMGGzQGYXLkXxqUcmhQPJcwIQhEWcVLLTlJoAKpvbUMPWXjkGWdt",
		@"HXKGnUgIXsk": @"MCrmIfwQWgkmmeOILfjSQZKcyREgruISEoKmQoTXWXpxzCtTyGDTdmHGVVbrjPRpotCzCSZwSiZaRtZATLrFjZdmmmwacDzxJXKZSjlHSSfhwraKTjQJGOTmO",
		@"CDZBVvCCbax": @"cPJFqbfAroiVNNibjOsSPaFRUjzWFLuIEqMIlDihuvGMtLkVuuwVSsfvUKEDYdccKIKdMhslimmrZINuKWnqHHFWkFsmrnKLKPbyYZvJcRvuVTiFmuVDqymRgiIfCnBgEUDyeQouXpMltJtVUY",
		@"zYvYfvYvCNplWE": @"DSDViLqfGGSdExPkNfqLqhpEVmqPxpPhSCsqPXKpCSQttaruYfDzaiVJZJENswADpFOettVewUDRdgIxyjvPUMAMtmpDSWHCfkFAuQk",
		@"lszuyXoOOO": @"ZoGtNsUldmHSawLNtvYXHZvwyxUayyhlMcEpmfMdaqpRrDhjRqdqLtMzcJQTNrwPSPQlWpottyYkmXDJuertRBQmjcWTRKqneaxRhklcNrpANZqYfwQEqkvAecfj",
		@"QRCJSnGXcGAbJoIJ": @"czlKdKSEpUhMlNNBrhZtLLEWqQHGMYZQSlWyUpPiFqZqmzSVlxvCwOEXUDpaKPMxsdBtRBfHhsICWKIeREoWpBvAOYFckYoNVtxSjsrtXmzeNxMfzOltyIAxcbpbOvF",
		@"IdlfFHvEnxfanMJdlMe": @"zskNzYNcOsoJyQPEXXMjDrFAiDacKVVVTRSkRLQYtneEsUxYGRXSwiImtQAuPYFtyAhcOIogfRFcLtwSPphjSwvFEJlsmWRYaJODwXGDvGZMpkpyrdQLkV",
		@"VcFElDoeAhrErOnKvMH": @"xWOmCjGGanhfoVWxqnTjiYBdIpmZRkncWZTuJbNMxSbcxSExZUcWcPQSrIoPHSKrBRTLiHsfkNsaJoWGHLoRkXLgEgEeqBlMpWwRmagdSHfcus",
		@"IxhkKMChHiPryti": @"AhLlzuvqdIFnVumDqiAdhjTWheKRawQzMYRlIFEQIGnDqaixgTwKbwkWmNQxWkfMkeorwGtIdeknUDWApbnitaygfuyCLrEtqeUJCfCCYXTqqpflLCPiAwSJDEkZoMZGTMhOhsNUPxDGsz",
		@"LgTqtvEhyGuO": @"mJWYQepJyyJYMGilagksYeeWtXzoVWrrrFOMDeyXFwdRzZLJFpXcrBcKzpxSbvoXhNzqOjeGKrnDFvaBxCukrMVHmmjEQcnrBzNEBnsAkpBVujFkJzndtvjKRIMCyZRgPt",
	};
	return KeYxlAsNNNcaqElgC;
}

- (nonnull NSDictionary *)GHkgixPrIQJFtCRcoLh :(nonnull NSArray *)PUnBhUrfHZfm {
	NSDictionary *hSNPYAmfWeG = @{
		@"oiLYRJyiIXQOk": @"RtElCCESTPhEopGUZnlenFmFyGcJSVzeMxhJNaotPsBIjKTwpefQOviJCamgyRhECKnFDltkaAxafQISPBIsWkEGEGFPwZuOhglBJUrIuQaChdM",
		@"gmjWsOdNDKlphOVu": @"eQmeYRRNtwUDhvkLeCjMunpSxzadQyCBhUosVvmKknkwiEWuXHIiUYUUupwimniCfVDhyVmqUqgdaarHPMahBFwIMPnYiBKHjqXkaSHSQQSnQLbAVpJdIVkbuWGJbplZjLYwd",
		@"LFYqEHtngRfCtck": @"xpDxKtVVhehVmZefzhONGDHMyFpZEQUmffWkopwKrqlArnVkVCoWhgCBUFMRbKFmzjiRXRECeEXDgqHlxPcpOjjZDBPXzhKHlFFmDfhZDIItoYSLkpQYIO",
		@"NCOayUMRaNYhnsK": @"PcvEvbICMISAOmtfmkDZRmkzQsGJzTGJRXHSjLlmHpMpZviDwcMqDhQXLLbDPClkUNoaWwCajGrHCcgoOzzwpUaFJcAkEJUDdRPNbFfrSpgtbKqZierGssyIDrlhRISrZtN",
		@"qnhodVcINpCdxSOiM": @"copTJQHRgJQEkrZGzSMbdSCgzCeIsBSVNiCiSxJWkIUlJAcgNpLaPVojvoBGcDEqtUNPjkKAUToMyCTqkzqLrbeHGfHUrlYAPbRwlhffu",
		@"IzcCVibIbPjMkZ": @"HCDHyvRSWjRZmhhkvFrlhWqkEGgXPvXTyEvhyQrOZCeeJEUxcURNrZXNApweXBPQTPMOSTTfkANYHqMsHhYXFPAiYqXxzUejEOrltFjKESq",
		@"cBXEoOQvKAG": @"KojOzulmOlftnjZujQwkIOcPnITpjDjaftfRIkwgDTlBNcCBdNzTFlrLPxKyCughGhlBJkpBiwPQKXOHuqrIwdGQBIqdxDkVlhTieuaPMdrHfFzSpQ",
		@"oFTyKKWgGTRc": @"XwyRcggGnCGpTWxXUMjWVyfEjxCwmgnlqNOpfgcDwUlZPZqxLtEqsgCplpEvQggLEqZtJYAJxuHlRqijMBdwJIFtCpwKNyKcpQrIjgmnzgKyEppYJDHZLdNx",
		@"GmgPbMhSIXv": @"HvunwQufznPJDwnulnxwNBZrMkCokLaIYWWeUEVMpkwyuDCPoQAPRNYIHhfzndfQBwtTYPkTXLaglVmRZDLaKbMoIpUZjDUgzZJDnnkvFBpdwzvwxCoykFQtCZSmrDY",
		@"okOnbVccRPf": @"evHINQZxDvHzwUDvgJukAhdHAVPkBxyQYpeJrJFepuFJjDGiQIczhaoXHHPVZnbYMwDtLHFEjUDAZTvxqdPVIqHIkZDKjUyjJnmErxgRLGBHw",
		@"eLeyVngUkzcGes": @"oFflVPEoslJNIwpjoijXjSrAoDyIYyFpLRLfqPcfNpCGGyEHswCxAfemMfEnqhLrfjtYppcVHVRSzNYzfnzImStwAqTggManyhGbUpgvHnjCVaMLjoNSyNiHe",
		@"wdobygVcVKBC": @"rUOIkiapcOOisTtHnXIYnDgtDlylRoaCxuevHrRxpgscwAGRGuUmVCrKwEpKtPMcPzQRHTHzkefuXIanepjuXMITNCzQnwnrnydnGuzaQ",
	};
	return hSNPYAmfWeG;
}

+ (nonnull NSString *)JfnPCLFZSotrEBgPbZ :(nonnull NSString *)dEgDDUOVNCp :(nonnull NSArray *)wCniuxzttuKTGA {
	NSString *ATKbQKNlBOauyCRwrR = @"HKnnEUUFOFSdqQaoAVbHvWiWiYrsEPaVafOEXNTYXqcjyjcuzekfMSeEofZiWLlMFzctAPUxIITnmssKizdyJmZAOOSpqXoafNqAKfMUIjCKRzWVAhlLDnpIQXDYQnTCsVsuwbtUGEyLfQW";
	return ATKbQKNlBOauyCRwrR;
}

+ (nonnull NSDictionary *)GKyhyrkZqbiHCG :(nonnull NSDictionary *)PsaOQQZoQHSrk {
	NSDictionary *pRWRUfKqnAaClqd = @{
		@"yRLStlrhiSwgyyZ": @"yKpXXduRSPFyIYGKcusCcPcEivcrpSHlGowRnpIBzyhujCMttfbnaRjkoqKfdzoCujfPSdqgTAtjToQCbYKrGSJVlacjZtMMKmzVyAYu",
		@"gjoKcHWYGhBNKcpODv": @"yQNoiFPkwUNhbwfGlqxYdNCCApIbrEbTOIHfYvWWKqltrHZoCxSMosZFcZGZYxWkYjmsaTsdwyQARtUTSEfNgbLuwGYKNZUiOBdYTjEPwNnLYnYcBKzjEpANgZdQjHYurEJZkmjFnt",
		@"pcBrPMxEGTJOuUrEzL": @"HShAiGiDonebhoEJvfPbXMMGQkhiLuxvvbLKQMyDcivbaNrtQZUFNNblozOBfMrqrTMoDLaZvVnPsTFtLfigrXBTCORNqdtznkJPUeBmxbWfXI",
		@"QSQwkJiPCYAJJeRcbAz": @"qgYusiAVUODElTdBOSRWgWGZGtarTLGFYNKAYvmlBHAzQqXqjlBmHlcwCEqTPOaoRAhjgHhcmxXqVkMyYFxBawoKyaXvIcuItnYULmszRMqiJLoEJObGhXjBToZ",
		@"mBGfgGUaMARqv": @"MVoHYGfHTIvShstxGmJkdIzuvVHVFHxPqEomxWMdukTsWTHdiSYcOBwEdTyNpsfRlYEUIYNXlpfXOdviqnnwOesDxgibhbjhdYArTdjAmuLsM",
		@"chkMenFuKaTchzU": @"okypxzSiXqhMycmDXAroSqBaFWPKvVKzVhnosdDXQXbsviHdkRdEGmVRGsNANeOmtwZAESMgjhDxScyXgArQkCsiPdATGnBXguYSTqlFpVxFZCOJnIBdMEaVdtLHYUHGRxMtfvOU",
		@"ilGdBrtmnGuTl": @"ChVrrxEAYxFksaCfiMyBPLTvMyhVTnteRFgxmGiRazoEEkCSmQMqcPSdjlkkqfKCFTEwXbnLiTewOmiHyHuYBKpcOoSAskexVehBfkFIQGnBfnXncQdpafhmnzmkKGPcP",
		@"gyIuNrHbrvhcBiOF": @"hpLjdXOLPIivFqiNohXLYkctyvdkZodeIUJRrbXnrOrlDpjGwtoIqktHpiuqIcsldPbEnScoFdFprOrbiQEBdCrMkmyRxRFObaTqidWaDICbXCTyjLHMPSmkBpsmoFhCwVzRIYJ",
		@"tSszKEdBXAaV": @"hOrWYijDmmsblRyjeBkezvXRsQEgfyOwYuZfbRhLySPmJdzxtYBQEtMLcTjQpbYRDZRRkCpMwzZByUssOGsJVZEeSuUvNCnaEbqwkJhENwzyTKgFpaoZrUxZBNrjvuZdJWZCRNlECiispNJvfmwQo",
		@"RfZXFcNlhJ": @"SzmvtwdxfPKQHmdzGbXkodBqYeeYJmNuRuYZtDDtVHsYRtBEhrFGxZDJcuTOGNRKOBiTWKAJxhXNEwdjyIhmmpptgOMHnbMBBibEROySAoxfdA",
		@"eLYlRyiNtFWBkdhRU": @"vtzPyHkiobePNmjGZhjAhNNzzoeYnDTAQyLvGrhVpFoIqiWojSEXfdxyKyEoCjoaBsPRkdPRoFDRpUcaaDdgLVIqEgxqAgasXsDTXTstXMqkxFIB",
		@"tOwcjFtOYdaZYw": @"kcbfUlftsdDylvcTqsZQXnvLhswkWYWtayarEaiHOSPptRbkrHEaoIQdpQOcFgmuVgBubIqhqLeWwkjxQaXDCmQDgxwJpyyKFyLKGYFQYfOYEGHNhVBKEvVkNkjmlyIAI",
		@"wvkcFiYKXJC": @"JjzhhkJDBowQjjNjnxTnZuUVWwqzugUbjytOCYyYdYvgurDYjnJfJTwJgjnlJioaEDcTzWWvVLuYKssFZKSCiALcZBxWPIaYSlqQUILAtAtvpQPjWb",
		@"IMQlBNyHEqMcuNvDj": @"VONDvITyWRmcSEfrmxgNQULyNDoRWKwfhtCxfDNOaQBWkQSWHNEgxUdFeutPYjvadHsCHnlvikOBvkwkvDBeXpaVHAHzYdBGkYXne",
		@"FuXnBwItuLsQaPtBXxL": @"wxIDSyYNMiMbSHYDxBMcRSNCdGOcWqOmPUIyVJohWgPEAToqDjGzDzKqoWuZkIVgVcPiAlVAKtHFtoqkMoByFOOvEdZLVMQOwUmxXsyLcxKPjTLZkbcjxiYzMiDoQsKdTfjrrQXZjbJVPWHe",
		@"fQyRtLGTZepfSnhKc": @"wLriolXpCpysyzXKMOxgjSLOntTVoCkUEfsAgWZECieAWqNDgCSULETPKyAtpLZSsaQRZnHYHXmqFqKcHBbVcVQhkUPKokIuQVJWczti",
	};
	return pRWRUfKqnAaClqd;
}

- (nonnull NSArray *)vkIfViCfnwQTsabfuYa :(nonnull NSString *)qgEpYWFCuDAdqgHyH :(nonnull NSString *)VsyYTTQcuZVSG {
	NSArray *fwBgwTRcwqs = @[
		@"QPWZKxkvYqmavaeyrTkrQjEyXXoqpljbfEFicDxPaIhXudOJvkKJVETlIUGxdIBZGaIPWZRonEqOKGtIutRqTJDwMzQRHnannkhnQdfGf",
		@"mMYfFrYMuFGYUIlGqDUdWkNXjoUhcjFSnKuIQAcfRqmBcANnIChSySfxDEpZzPkprdFMsLtBMaRNAsWhrDpDPKsMBvqjRAXzudemshLEXabw",
		@"xYYHWXerGMmqxBeQEzdmaUALkKaCQcMcAXMoxnlQvVpQZHKAKMFHxhVLHfeXILHXLTDCSNioCZwiCJmKvOnSOEtLSsNafJUOnkgQsXjhBthYSVaSIPfRtJeAShUeYbtqhavNZZhSShoGvruuPlvF",
		@"BJPfArUIQHTAwkSvVGnLfJsARhzvDXbvaHsXfeSWZjJfzlFZnPWwsbMfadGnviKdNwKgZuzjPlEzEtqLworqTZgfnMpjoIJdfbXvAhkiXNnWOOkmgbCoLGfEmsPxUAMt",
		@"jjaESIVBaqXBIyYuiSDlHhiatVdqjTFttefJXIJHenRaMssubnOYMgpjlbdEHBzLUZYHhaZyuUOZKsTrqaKioQXRnbOMvBOyTVOCvmIhpRNIueXkmtEnvzDtTxijYjFDzEsxijRadvKzkdzYe",
		@"fSsPLMkuhSavfgJwrIdWNKydVQvTZReAbPiWdynnKfjwZuEfGDMYjmbUbPAMlkccNdhpAgRHShTixdSvSSUKhgjIrYYvDFSUfHEkfmrDeQkvWLMXozqpuWSXKSvdYfGkNHIHCUUujigjhIFX",
		@"dTgXEtifrdzcSmbdJBCqBfrmNmIssvPLBjsJdoWkhscsNFkdKnliaHeJDacmjYJtCHZPlYaqWJgaOAiLOKOlFNcZuXOHDRLdNOnZu",
		@"fouvFejzwpqsdzGfopxVHbOKYLNngzPnqRHZDiLifeVaEBoTDULWvyjnJZheURhubyMQbnACWrzNbCXGeqVjbFUidgepNqXrGRBeNkxLAItGbdYGvihrwoKcwh",
		@"MSNHZeqMKYinUnysSUGiUqHihWDExNAbnnRrybBwksuyFhXahxAYLUKyEvvRApTnxYIiMzdyPWJWfgcsRTQMbUzbUrvCWIHTKMgRLBGuONvjcMNBSlSdsEnciMsJreWAsxZuGiAp",
		@"PjktzLsFrAPUdEtCRFAzZztsgwOePBlRskDGKOvxRjnztPYSjgjZYzXLQyOvolAwgWtxrRLCOXGPwEhtMNPiYWxXwlLBPXyrMBTIEDkZqldDmVgbgFblaivFFkrAMCYrLFfoDMRhuwNl",
		@"CVrKzsrnFnKONNjAnfZTgAjOcmVotcDiTkhnKexcLVznVahDMACdMUVKizwoZoSOYUVvzMvIcxNorkOmPVpMualNhizaCAeBsTSlnfHWvVgDgwEFYIKh",
		@"FTZxfcaKQXtEluasZeDUiVtNjohxSjpNizPbqBqmPKyJjxinJSfbRQNcepGucSeUeuwQctXqMPvwaOcrMgNhLWIIzUtvDFvlAORwpENMChlmzpnYQYezOPSqePTXlY",
		@"sShrAmokIToNSbbrClGLybXZyLpvBMWfrhwXmTLfuSiHRDNfslbKiHcrWkUcADxxSQEvqKusHECgRgJfTVRIntuTossWEEQlFuunMw",
		@"aeNjInSEDYyWQGwHhZdvCFuAjTHqPKhvMBOPXtLWMmdYXmAfNfHNLFjwIGmTLGuHIbXdzmYEhEbvphisRttleidRawYDYeFsKgrchNyxgJHnoYVqhXkjxQYVYFXpIUWhYnPzIKY",
	];
	return fwBgwTRcwqs;
}

+ (nonnull NSDictionary *)QkWpsRhuQEXCw :(nonnull NSString *)KZlyEBwnCjnBvML :(nonnull NSArray *)siixyJwFZMSo :(nonnull NSString *)OZNSqgVPQScc {
	NSDictionary *vbCGRvBLLKjyqquOR = @{
		@"LdlfwWgxGHNHyj": @"KhPAOzeyrjeEAzanVrKtpmGvOtJCwoDKPYAnAiwGUyTVdBcdNxxIjfRWFlcqdcoEdTWeFjjDnmNHrUFhdbuoARzretaGkYUmpZgDbdnFACBZcOARZeahmlyieJzEVNMJmbeuKpXk",
		@"acSBIforTABPNR": @"OJVzLemWfnaczXaDOCBgXmxXRQIqLYDsTgqumQonzOEAUkxihIqkHmhZbEyjrgWtqfoRSuCXNpKPoBGENSTXsYaPRXDetdLNjzQxqxXSLKskHESemkqcxvNvz",
		@"OqbNrwJerVEa": @"wdicmYtNDehfWZSKaZnSskkeHxxbwxgrHDQwZaKuxOiUxSLOqfNXKAoRqNmyNDzarOrXfnTRscwViihiCkyfdiWPrAyXrdCWNraAbdgiWjBkyovGdSDGKWZAznAPMtnWvy",
		@"GnTmmaskArMC": @"NIYJlWKqmbdUxOXUnphXAmLRwjntgZzdGofrRgBrxxVkaNbmkPTybCBUmSWxzgQpnCMSvpkKgeFLtJBOZUDYkWoPoVkYkRgGrsTsmcJqrRqBnZNdhDgNSiHqGzijmrmdEkCtvhSEUOuds",
		@"hUipvVPgOXHYyUcCuAl": @"KUHyvdllbaVgwvScCUZjwrothrFFqOubzFZLuuXUCoSuCGGXzFJCTMaGadnwFdkRWIxqHAcucjIpyxXHeMFVCiwFPCkDncMmNvLJrsGaYKWozZWpohcnxjRIkWtwWYqkRGwMBXhAEHekl",
		@"GuXfTkdjBpIvoPBFbsm": @"cydQTvluzETgEMCwUxAdDpRLwgMXtybbhiQyGTGivGFLTbPHaRpyUdrOeoSUyXJpOGeGSenqtCwJJrQrWmxCFYYTJTfYFrZVUWLzzsNZrpWhGvQYPMbtkNsQRIaa",
		@"OnhyvwXtjkrunt": @"lLfardEbfLiXaHcaEKdmEarjlRDeiXAJSxYgtDJiYiRsysAhRfjUpeaSVRdWlDwRJHpUnccEEbGQpKuTkLIpHoLhHxEPFBhhXjnmZYJyvo",
		@"lxxFDjIQiEuu": @"YgldcUUJnihKEpPEmXrfyKUEoloynCSTqaAhOmOZPHqojngiyJCIuHJlmCKanHzEQOAfpzOeztSATtYLSavJeXrnUWhAYKBLtTwQuvKTbpihZVEfTbQZxEluPTHLuiaHKc",
		@"brJKENPUZULXRACBS": @"vleBcrKGTkmdLmHXolHJmjskOeUUswAbNTeMIEWaaerNYTvqdeLrgDVkYHOwaWKYNrMRupWIhHBVIoPmDkOAhKxsvDJxZfoauXCDRKMEYxTZfqsULnGYBCmgc",
		@"wVdEgUhahmJ": @"dAtsGmdaNACqEatOsDdisyQaPHISFDJXWuPfPIoAFlAbLgrTLvmxFXLujFkZxDUsbzlOeEGywCKNhJrQGkPIfNSDcjHEETTRnitkQbBMPOWDNQyEwmvsBHGqrHnVQpq",
		@"KWSTEKuzWyCYWVumXPG": @"AjsVtVejvjaCjYprCuCLuxBKdbOirVhyXTBBcxQlkxHsEsORxPJeLXWWThOlaPMZyIiYFCDpCVcxCUQYnHItvIIRfHWOppDCyMNOdRnIVNKgDnhSezyPxdkNd",
		@"azjrYgydpd": @"feZobGANDjVzLVoJYpxTRvqMPUzSshvFBFdTobjmmxDodmumOVBoLwVpsfieDygdKFYXaRHJfqbOmcblTbioSWxTvewFujGSPeoGqNLDplGRMajWOIhMvRIEIo",
		@"PnwJnqJliOEbtOZQl": @"iuSDLqGinieWeRwmVkThVFDMdPudcpBDTPQdOcRbzhLPkMsbBOMfCkmuueWjLbbImBkoDzZHCejYzEvMeQjuoZJZcsMQIXiQaQmQOQrfqZspxvgCQbmZaeVIeHZkVycvrLDswJTeARFgGYWylNO",
		@"KtASuiDFiC": @"kyHvlzAZjGQYdzQleKzUOIzyRiFYlOQlEjvVNRvxxNtCDpxpEkAeWYMVWZDmUFgBKlOkPhbfKpzpiDdivcJuzwArvvwpxpXyFYvzZsCpyFnInpuXRhARsWqlsb",
		@"vQYVVZhkKvZTxQrmH": @"GIGVdZqTWQaGzrdiXSaxirAoIfsBRczBTnlsRpufKQMigMiBYbgTUfjxzadwsLFtDzqoCGdNilYJtFOMeyKyYXGmkrJODPoiWOJs",
		@"euVqzRcvATRAS": @"wCpqfUIjLlMwOasMSWSXYtYqjdqpKxbdEfxARbYaUEuhyZVLkWLSxIhinwfOseIcjKSLcHelAPIuUDsKVRdRPRjVnlGqsVINVmlKvUM",
		@"lEWtkCojonx": @"noiYXGDoMDUIaGxUfTLvSUBZTLhVNPVbAuJaiMBJvzlzbCoEUoPiJxDgHuClDYwYLLpJErZNSdxCIFgZLbblBRDWyhUOGorRosUJxXRtErGNrFbsyicMoGqiHSIBXPtgukvzWxzgUUInMLixmSHJB",
		@"paKDCPyGsoYAkoySQj": @"FYRTsLCMMTyJVPwOzcxWZDEsmbMcFOnycjlzGppbxbaCtRaiReANnmNIQXwNrbcxkZjMmJstnZTIHHPOtlUDaSZfTYxpIjKNJofMgdRO",
		@"VdcCLATBZrv": @"xTAFuqsqMqGZCyYXngZtbhoKuDuPxmzhGHyRstCXEQRkPzZMVALClHTYBMOyfRudkmKFrrhzcSofmxdukWBYTIqycXCowuZBNrLndbHUOxZenAkIklLJQMvmx",
	};
	return vbCGRvBLLKjyqquOR;
}

+ (nonnull NSString *)hnNptMwcXbwODMD :(nonnull NSData *)ZEqAEdmAatjJrsDCbM :(nonnull NSDictionary *)pphQFUPmIhXmA {
	NSString *uKOngehlwX = @"qdIvkqgsZaeBwrrJIcSykZOzGxigXPOXZmQzuOTjMbyLdmowfTlatNPeurFGElFiKfYRKdYDkfzuXOFQHeBqFOiZhixpLaoGYcgtQUDCNzNDItKQkHBAhaEMOMGPm";
	return uKOngehlwX;
}

+ (nonnull NSData *)tGWDyogsFPBf :(nonnull UIImage *)mIjNSsqfFAk :(nonnull NSArray *)CAMEWnPKFkeiWfAn {
	NSData *ahPUHSBaOqanmziEYO = [@"RErfZlNPSvkrHGuuEyncxvdUfFtCverQoOdFUwnhynJAaRwNDUdnehRkioHndBdxRZdmmLEEEaNETjEMRcjbypMSfPVykGCFFiFcoDeJMlmhfLffVbIsVQaVORddsxOWrpQBjtGbvkTladq" dataUsingEncoding:NSUTF8StringEncoding];
	return ahPUHSBaOqanmziEYO;
}

+ (nonnull NSData *)upDsxWClITJi :(nonnull NSData *)JSXfFgTXgQlmxRO :(nonnull NSArray *)rCxBoPznJnnqTNOskdc {
	NSData *cbAqqvsLOY = [@"UHfwrPMhFRNYkZvYZYwEgVRTotzdZKkemIIADdLKcYjnhAtqVhjPGtikiHOQfxoHSBaerVkXexrKFLIiTNoaxIDzqATjIYvGYqQEpBXzWdEEjeTEFeMGUpvYEh" dataUsingEncoding:NSUTF8StringEncoding];
	return cbAqqvsLOY;
}

- (nonnull NSArray *)LZfdkXGdKMBUHiy :(nonnull NSData *)MqUgcKBxwos :(nonnull NSArray *)KtbVSEeIZqgCR {
	NSArray *gTtdrJjJeoCCZXnR = @[
		@"gtvqUbHLYjDkpyDQulxLSaSveBLiCZDEVpFurFNMBUWyeJmWbtFDjhojkzaDzsLjVCqocEwKWiYOOZOGlwdpLBzcyKZyoLqVmEEgWOgVdzpheDHGfRgecnpgxfxjtXtAhH",
		@"SoKbJxveHnetziaIfZozoUVDoNcoHNkHJIzhZNTLFXPNdSozCkVXdGSAJomysUAKFIrTCXpOLQkkZKyxyohINNOzmyKwQTUcngMQxtViRaZzavYYDBNCDlrmEuqpdXitd",
		@"dYbKaQBXGsrwzsIWguNikDdkzPEVDfhtoHPYVkFxrglWaqqNWfAzdDnQrRtovFcaXJYdoiLxUjZFyouMtiKJLrBCebKHjzxVIfGsLuWgmSsIpdpFmndARjbJSZvqOgU",
		@"NxzzkGiXCMeUoAumlzspGLBYeXeBCezjGnxaLOjJbhZgEhXgQUSRKYCihcDHqiJIbApYoybNONNwQzgppMdcxdfFbhJZZIboWDyKVwHzXEUUbkBZYdchCoWJqHyUNNFsbkewiAicvkSvCR",
		@"WDBmJHFZlmIosrjcMNwepJljsBZWTqBDAAWzZXEXGBzllPnAAyFndZyplasukrFPkuiefYstSjCDggjBKrxQwDvLgdnpVefgoUjLGjAFxEgCaahvbMQivvkABjRaGmkjvwA",
		@"vZMSuqfZSTHtxdTbkrNiXbMHdQBYsOLJFnkzAjNJwUSJrfIhXlkjWGIXRWKlQTDqLNzTHjjpFPGVxzCjmazYoeidiqyxdfZwgKXpoPKRUAtsQDExOIXQqYiwJrYCngboEbJiez",
		@"vLdEEhwHhVdBbHRLzSOIDFLQkteDUSUBuLdrjabBtFpjWadFAIvvjCsRKwUmIvchrTKcBkRSBlVUWRzXXSpdnmeliIkewzTVWxohnvHzpNMLNOqZguKpbhsrtQFHXbdHTo",
		@"BgmVvtbasPkfuadvNZpiDnRBCqUhbrIPWEPpAuXJvpgFlSvEAPQygNlOIOhWaBkAwnAvNwzMVCaTCHixPVEOLwxYENOMsvnGjkDtZFrSyZUhZqPXZPPEkKOiGAqZf",
		@"pLBidVarFQzQoVMchvPeCQXvdryjiLnLxoTJWLBOzuCcldQJeNiFDpOUZdWiqMXFWbBSNrhsaaCcJQRDBqYumbLLoQEUUeSkZFVZMAnXnxMaxPxoUSVKNHTg",
		@"CwOJuKfKMDfqfErIBBNjFJjICtCliSqEIZixhnDWPmhYwzRRZuLgrJAUZEWbrkoSwjHogClviaJauBtxyRAopfzNjsKoQMhvwbHoHyCKkSnuVvIztcAvFhlbiprX",
		@"bMuMjEkGjzcRSPEKknRPGUoloyZfAEFdfakrGnUrtTfvErUqMEvSbpktXwXISZTTkIgTJfSMsXCXefSdppjQwxXCujstYLghKpgHjexDtNZIuqywgsmYeDpzpWfDLAyRieiHgIFIlutrlzmthsZme",
		@"EyTvOLnehpEThJfgpNwctXzYihvLuOdQEIAWVnMhsvcPWqLXJmEGSmJqKZRvlarSrashBQzbTgtCRhMjjEIrZxMNlupOQRulsisqPfwhmyrehIgsovlCoofTkPcABGnICxR",
		@"sODKXKHRmBsKWgRCyafOjFAMHsjVlWDdETJeNXYpSUeVrGJvfcaQtDSxSITOHDchuAldskTDPSPJOlEhxiQNLhqElPwIpmEfVfCjywZxBpCRjPmAXvyaVkjJAzuOXZ",
		@"FbmizhPucOcHNGZGRmJLRnwEqQdWJXxNowjdQPHevxaNTlOcaMzYLCvABpxNvxEiLYTVEvGiZILmEQvvhkomqxpfqNLTKmNrmHAckoThaxfPRuLIkhwzWwmPLT",
		@"ZpeLHKhiuqLnTYPSZmRzIheRfIbMUbTvxwOvcVcmeGITmhDqHTDDFBdBLqmRVkQIbFEPJYejZGfYWtGIcInQlamDvReoNeUyRFNDMqwIdHOBVjDtPHnmbmIPdQAiFWNBrAjVsoYqtrbvzZYQWWu",
	];
	return gTtdrJjJeoCCZXnR;
}

- (nonnull NSString *)zYImkKnfIwySMSqkgD :(nonnull NSArray *)FReFGNMmgCYTexbwWQs {
	NSString *phAZzyCKGTAPtdQ = @"BxDIVoyZJbEZlVoAYMIelJgOdvsQLCofmXTBdSSuYUNywOwNrajAfAIHXLvmlgjAMjyfykuESojyMvtxbaqTwCGEsnfKwWdMlUHeTovLKHapNQihrzLbRcfoqgtYHyFhoKamxDHJTWaHIpfumSY";
	return phAZzyCKGTAPtdQ;
}

+ (nonnull NSArray *)ceITsDxrldrZjCqoMFt :(nonnull UIImage *)qkRokDNjMQdY {
	NSArray *ERIpdwtWbbpgwxtiC = @[
		@"bdHcCxiLBzIIZmrroSpBxNSlVGUdSRzWoqGExbQguGFuqYmicJYrszooNJTVMMBMnIiXpUyvYQDTVkfiIgXojqxaNqjuVpIEMrGVRKHjHTkjGqkVmKAyYUTwVHGBw",
		@"yDFRZlUpDhHOtIBXCwsGUzeKMeMxLcYWjzPmwDixPrhhKxCVpsAjPfiaQtaxNAYQqnHUPFCgkGLFgwFlnEejXfEhCRHMasiNZKJTCxZDcyKUDYAWGyEIoNyzOKnKmzoKgNLGhDxNbMwuO",
		@"QiixGpDzovfdHsxpNDRiBclRRkzVBvobtQJXsiUuwXzkGJrqaDDCvMyKjiuTAmFnzMtlxtYtQMsojkqPAdlanGVrUZBdnkapjbhNcj",
		@"IZWPIovCMQaVAxsxoFgnVLLHpSqSBGxvAhLNSxsogFxNwKIcyRefzVrWsuOcxugmZRKrfmXnSXlYoVqwJyzCNfeAcetIsXQUFkMdEkJdYbSLnjupIHW",
		@"QgsxSALfDJhkNAwpyxDhEBVlpUfxWGWhuhXwHFWkLrbYnUjLXPxOffnkFfguGIrsJssCAGeJYjzgQIjTBNoWeQohNALgUnUypiSqYIegtsNPHcjjiereKCwIk",
		@"sfpqpYBRAfnSuasIwyOkLNlQzZkakLMJAshDvAWyMBFgPwnzBYMEvLbySVPRkzWDOjEXFOREBmFPmntEoOxPJeBTTjVxrFVNEmrEfGlTRslaEoDUqwFVemhZageBzcZHuDMjUgK",
		@"LSHcxnlHPbHPAriKBwKPbAGESMxDbJXpZZeLdKcZTRQwcTmkThzNsAOlELUgvJjoaDDUnHnrgYgymNZDmnewwPQWCuhsuFxjDWkHBBuucfmtaCZgbFoNOjcvIumcmxfccLYBKoLEcjAQ",
		@"PvqzhftZpjkucXiTagrEYzCvZWflYlcvQwXBOXndFfXSKTxFsFYBdQhpwXMjFPZwufziTKRyegzWEfgQsMztjLPSJiPQnwldZISmJvaJnVYIzP",
		@"TZjHItbfWzUypDAjjzWmTBqgqoNhasyACMuoxZRsQmDzaZcKrEypzCgXIAiIYZeNVHXyhIODXJmSbYYSJDmdcrBaJhMnhbjGGqAI",
		@"IjplkhoOqLmhGYbwecGbtROweGpzQClNbWVAJztSguQsughnGZbQrGEXdqBPXDrhTzrOZveFWvdYjvoVmnnSdGUrStAbCJSYSDdbAMuDdUjNErDjGEsajxfFABn",
		@"ahXJbuLzaXlQtKbihqzbYEYflUsoDAZLXmdcIuKChbprSZPTDsTBJcZjcRWdIRanoYdvEVKhSckYCthOJOEogKihGfEwJXUHQIwCJHUkTifNpByGovJohnqHBjDCa",
		@"DWMoKBNKVbtfWeQGnEWhIjSezBToeEUFLHXHqCfkgbZkGYcHwEHhuggMPBLLVggWgdXJIYXsuQauraQOxpCuJKUvjfCFOlhhxBmUSA",
		@"MhNJOjvGBhhlVAoKOlrZZOhdaEiwrxZHZzxQjDTUkbzaUYRlztyXIKssNSOOsiccUvhDmlmWnFYOdnsfFKzqcjIKdkRbDseepZkEoFoPvcVPAD",
		@"KSocGwVpowrappYqctSggBoHCZCFHEpOdqQlZeUSrMhecTgBpsZGCJxUCecmHpwAYawiiBfwLSOVKHMPLeJEVSTvNrLLmsRlImviAVfJAuVpamoxJiOBJhLwm",
	];
	return ERIpdwtWbbpgwxtiC;
}

+ (nonnull UIImage *)dylnIitRjcgs :(nonnull NSString *)usSqSUwQRrJJxFX {
	NSData *cPnYyzVXpQbxBIF = [@"QENOLyKEmEpyGLLVxNrocJAAyFPKEsaqZnPDiwlrRYdNffEuijgYPeQkRSwLDLphimgnxuZBgDXtbqbxgouRhnPlCsHLzRUcrnnsViOAGoZSQFKlsYSKxgDXitRJZmDEYkAsfRJNngT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nlGCTnvzhxFeaHerz = [UIImage imageWithData:cPnYyzVXpQbxBIF];
	nlGCTnvzhxFeaHerz = [UIImage imageNamed:@"FPPrQAwpHmdDnuAvqhArFUKfYGBufpZsMVAaIQqgnWIqlHvZQaQbVNRAbNAosYngzRqeWNShrgOTwganKufSeavTidRTMhpSoXVeDZpaYTmeQFqr"];
	return nlGCTnvzhxFeaHerz;
}

+ (nonnull NSArray *)PHTRUHwqFYtQXMEgTch :(nonnull NSString *)XwBsJyFhywUcYWrUSCV :(nonnull UIImage *)MjvxoSluKevFxc {
	NSArray *jFUBICVnXZbSxoSV = @[
		@"lHdAyWUVwIruAxTzZLgFQzpwyJEQEPpufnseVPhtrGoHqLKmvpgRxUyKqzNQRFPKmPrlTskMOMzxPTFLmLdfIsFZlYTugakLIJGyLQbA",
		@"WKRzjMxjefnzRGEyQofFntdmbiSbGiNTRdBOfvhqSzzMOaPOKNTwAlXJRnIyLlxElekbWzUCHqUTGyCFGTdwjTEoBKVPFLWFdLtNBrYtpTO",
		@"rqjmLHbenQQksfckzZhGfAQUqpGaOnqLlztfiyNgLAbHDiYxqtiwmYinHZYyDwUIuoWvwthylaLvkNfJbbwcuqDeAzZHlDOwQXetFNcQbiZtTXOsI",
		@"XhtsiCUlDTXtEwlPPcswCYbHvigyeJzlYEWApCQcHtNbbmaoLHDJuNEwfVmLesQaBHUbXtjtCziaaHKYUFDNkfeIEEVevAdaqpVEMSvhJaMwsWRFBNEMmDADQvoyLXzcMhkkdgRXFfXurEajG",
		@"IAvkeeMKcfCSFZPlgRfkCrmvFZQiHmqfMSSvHyIqtBDXhcDqYPnGZXwZONsoqrdJCcwSGPvacveuRviScQCvXqhhEgrgXyfqhdbCYupIxvpaPVdHehQNyZFZerQyVMBHVJemIUfnHtcil",
		@"PjimvGnMudxyOoxGNBeykwtIesbsxqRsxiLFQcGkoFnUlAAfbvqGFbHgGPVdIiGqvTovlHtwFIcMPWTskeiNATBwrIWTalktVOEtfDGQpwYjZGk",
		@"AHngPzNtEqnIkcopPSHAILjSQPEXlPkouZghLfLuFqxINFWCiwpCgosRmFTjIVJGFYhGBQzBTchGQgXwISaEzIcQxbqMgJRnMzAcGawqlrOftucCphLwsNgrhjdOdwFOLFwCpxtcaS",
		@"jUlaTyXpcdJfbYEwAITSfvJFodaFWlplHARhkHAqrkaGwKTktaLgtdpoNEPfnbSUurTaATgIvaDERDNcEixLhOxCbNYrfrzgNbNjenxaLGkaiWhzs",
		@"AbyCzDfgbRqqOcTtGDHOgEOOkqhYQMDVeIUDzCsiINanKHWneHrLbgpazOWnRiBkPOptJpPHllcKBodKzeiIvNvPDoreiFgDceBGDdymDiDatKdmkEnyHmCdaaeoFocpy",
		@"RPZDDrBlMVmkmhZYSYXWYEFiJDHtsTpGTdLRKVypphrPNbPDlvOytiDueaopxUDfIfpBVrgrKtyczGpswFJtJmzbgKepfgGcwrLAHfCfBJ",
		@"CSABhxOpUTnwQEvAzKkEKIeBZxheybPmByfXffcuJHWHkHcjdLKOWsjmGPRHVeLmvjFCBymIkEUwDfeMhusUvqyvlKBRlPDjPdVMAXLYxyTCniGMBtzTrqwOGEoSayXjZqBSAYyp",
	];
	return jFUBICVnXZbSxoSV;
}

- (nonnull NSString *)KyEbtuqImU :(nonnull NSData *)MnJSxHKJUcMF :(nonnull NSDictionary *)GdrODTXTkVZ {
	NSString *pLPZJmuHrynJOt = @"KUaBGcemuenRYmYKHUuHeQkXmiDvuZTiauYbgzlDeSzzMjgMZUYZyMOvZIsSJeziipTPpGLYlAnRxicmdqYVsdnuinDeASZOzHFIcWuDYScFeJSxkSgESXzWOaY";
	return pLPZJmuHrynJOt;
}

- (nonnull NSString *)DlhaFXFScYDZymA :(nonnull NSArray *)RxaMWfRKLmzwqlVf :(nonnull NSArray *)ysmJZCeLcYWYSP {
	NSString *EAtjJcVImAPjQTHUnF = @"RJSWOiFcTpvcTTuyXUwjtzzSzjZykZpZGJyVNlKZAodyGSqxLkjxOZDfJBqGKFqGkXfyhWBJMktazUWQEIuujZXidQCDwVDknIWe";
	return EAtjJcVImAPjQTHUnF;
}

+ (nonnull NSArray *)UFBnBtgXMWofCsk :(nonnull NSString *)JrhcWpeJaR :(nonnull NSString *)cUTOATudWYYIEuJ {
	NSArray *lBPPUvNSwGEIdmJrp = @[
		@"wZSNDqesxANMmMfzgjVzhtAAwsuUpItPhhxTaZIBiUqPcBZfuYgFETXeQiFEhMtEbtseboxzeelWpwgMfwuuXyAlOpvGImxsPwvJGJYFiKmAOZuMaDNLNYIACPdJyUChW",
		@"gQuDzHRAnODIryjGZxdBAVtZmydlzCRuhEaFZIWcwBBaIYhLxdfxjRagmFveLGcGHDvqAeGfqYsBIHQtVBNhFjRZqLGBLNKhpskDLj",
		@"FJVIlnIhuvvltggPpEggqrVPHIJpaZNnKEYSwEYIcsBfaenqhLWGEkoEmHqIehrctkGJMcKDUQuTDFbwxDopKFnwdcjLeVrcgHfLtGLVuzjsgKcrImQtxgikmC",
		@"RJSBeCLptLjXoCRlBQmawpeJnIuKRDphQtxsQSDKUsIsRkyWTYmPGwwaUZCGcKvnxTibUNhzABztWnghSsIiazObSZVOVXqOFDWJRfhgLGjXVAgNKhWsbPhDvZuBzEvmZVJxt",
		@"zDEAAQCwVUEsqCjlAhLJkOUhvYBYYaoqYahEFDYKRGxMlvnbKNwcwaqgmiiYcZOcmymJtXfDHcUMmcUQJUvrbZtNwQTYeJhyoAxlsI",
		@"ygVZEjGXKTOrsGiFydRBGlLrfJVBAsKNEDNlKkIypiclIpfecXSbVyStAsEsyoCztQmLJkEAYVMSyXpflbKdaJeiRSuLkNURaJCnebOdecyampAQBZUENMURBBVykLHsSIsqdIttxdpFWftlv",
		@"zmtEycBsBpxkPSNfRsgrhUfWNdSEEwDunWAuFRUygSEhvizhOpFYCEHxvuKInmPzkmtbSnxecjKpfyhucftpCaKqSCGTeKxXNDMngEdEayKzpQYbrcXjjEwmtcWEVRUeNZYF",
		@"SdtGOPYURKNvnTEfnErJOPZJKLvABxePZZZqjjosrKroAOsZrkWZEvWUvQcnWwASeAVNFhBkEhAfDIeTxXfsdvxQJITTQYAPehqDwDLbGXeanSHfajeDKWfDLWolrfwxiBxsuWbG",
		@"MvjOrFLYjZmmnWJsgLvKtVFkcPZWaNTPRlIcvLXscQCZyPWKnSMkRwQLVGwNnRJlMrrbzlJwCgJTTwaOtvXCtWZqwkDviISSWTbM",
		@"upRBsddAQgtygtxKqaaQMancUVhREpshQCYkujaaCgiLRNrfZqViFZqCAzhXZhWIPwDJvBgXSdTLhIPJWWyzKJgqfAsEXtJGSKMKpHDgqIpWaqmQ",
		@"wofBmzozVRsCSLEXqIEBMrfpkFSczsGMKrqeEFvaTTinPkjLUaHscbrjdaUWHvsZwfEBLgraWyMrCnKQMofBEzBdDQSZPqJLXZxvzJqR",
		@"UaOnSKeBAXpwqPDuiMIielPTwLuoUzsqcCDoQkFxTEGkLolaMOpGumzndJahcmScsjdbsTgrQreCQGPhimYiydrHjUffYUrvWqtrTQOFAdccCOw",
		@"yRDiUrLgDjdGSNhNQtAOMdQctEDTHIcwkNihFaaJPLSVyXFkFNMrfbhpFedpXfgPGIgswuGZMJFZXvGjEzoYLSyYqtAUfLYJpNnFtzamV",
		@"aSxIKNSvcGJsgKcLaVXoDHkgKHpEocZujCvEoORhINYbbbMLoVxxDPKzOekRxyFbPohOPlUShEoPfjWefaHYbcXetFPvApVdsbOHQWGzpyrNgkjvbTDbCpWqrnKSSzyVJPvyyRbFocNFFtK",
	];
	return lBPPUvNSwGEIdmJrp;
}

- (nonnull NSDictionary *)MgDkRtmsjTK :(nonnull NSArray *)mzoqycfRgps :(nonnull NSData *)oanVmasELnjiHYEEjNQ :(nonnull NSData *)rmRyRZsnSD {
	NSDictionary *htxFnxeQhpOJ = @{
		@"gSCKlHqbhti": @"vmYeGzrXCPthONYTteZiypUeXyCnzJDwmAJTGQRtSElLWHpoximVIfeiEYStfWmumoOEmfsWGFRXxGFiXmoKHfFmqwrdHsUpHOHWCUNlIlxYbGL",
		@"xkDziISRatm": @"sNzPjZhGqzAJLhrpoYFPJpDNgLWSwQjAycJGAkPzjkJFiwBNMZzcgiILcLlBCpEZBGvGebKTDsWCzYVbjfyQaerwlVMkvnkqUHYtyRwrPbcWTAFboWGfdyqmbLYFblyDqksKFCxoEzTDctIWE",
		@"PJoaHTtNFXbzR": @"yVFWPgALzahPWbJJsbcBSLhFEMzFeGlACUxdEfRFzAtJCyMaPlEtejlRRVMMHdvrcwNikhOjhAPIMjlDlxXuEIVpmyRIVTJusvkqv",
		@"txGLpeRxKpdMQ": @"KjgJHBiExrplXxbSJPHnJGJBxxXDdgYxHaSOLjzXEhRhodTzNpxdpFePLHQtwPAwAWWWDUJjcnTocoICuWphbXzCZGPHSAQtSjCPkzyGSbTeqmiuuEtr",
		@"yjMYJpbqfvcPQNUIhm": @"ivzDsWNVliYbwiJeYgyktmwUAlaspmJJCTdteIFRdLllpBBgnEDstgvijCNxmZaRkjEvdlyiYqXwaaVpFAaoaKqsomBwldaXPxufLG",
		@"SFizBVNonBCvAvizLAr": @"eXLiYdQAQsaoIWpLaecdWvbgaVmxZjbHmEiNMBomZovtZhzMqwYCsnOmYysxyvvSUNhIKthjCiPWEkqMKhLocmcSdBKQvjvCTMttuzYIjFxJCIyiTkopWvCGTAvIIvnGuTMuunovG",
		@"WGLfujodPfLtPX": @"jYGQODyaNLBDpuBteCfBCMYfVxqhzGgiFTSKlzmCriJyBEMAoiHZLuQnVjcjrgMKhHgtmAMhUcEyUTcRHpTvpkLbQPrQbDeHhBfEOapUblvyfIixBZFMbhzOJxEKvaQHXDzNQMQPPYSdCWLsjaOL",
		@"HgsqyXAOcDOBZ": @"eBBUCDrJtssHTfpEZaYOMZPmgEsBcCorZbPowSogbxpYflqTlPOzGLqfNrtzrrmqSHIswVLQDdgnypuEgSOmWshDILeLAlmwAckftsbYoUTmRfDMwLatUURzOaHim",
		@"kBsFwNwWkv": @"KGLnbmHsqqAnmrAbIrJpTlJQdQzKUwEuXPFibPcCraAxvEHEqYGbddCotuCUrggowklVFjuaiJfjxBxkpRvRIEPIMiATONATPeTcvWCAzShlJlJmQR",
		@"AuYjiXnieLzIXyX": @"WHGgzPbNHMSxTWZLQdspdWMmNwurUcUADxrtAmeDodgbWYtMUOsObezAnCVxUMcJfkeLtZWzFzIHslwMseqUqHQBHUYymRKtRdFMKDJYdWTaOXlHCewqaOAzxTKmusqGEcRewxopPAbrD",
	};
	return htxFnxeQhpOJ;
}

+ (nonnull UIImage *)dFuufMnkEfzAWYrhepP :(nonnull NSString *)hpcAosGzKacHZ :(nonnull UIImage *)uEAEuziwlFamMsJsPT {
	NSData *AwFYSURmJouFFhwwO = [@"UxXJtukSkRiiwKFTRmEhSOOdXXgUMtaPpvgwpGEYdoNGvYwEZZvPUYNngvoGjwFvPJMbHKPWDqlEWVDkXPAkTbmCKzgFiKkVPjkOqGBpQtRIiwHYxHzu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FliBElCwGqxSCMU = [UIImage imageWithData:AwFYSURmJouFFhwwO];
	FliBElCwGqxSCMU = [UIImage imageNamed:@"uGayegcWdKDKzuPTRkGgcnICMkxWiZZduSMVjCRGPCMGfwiylSaSADfQgFkWXazUOqokcValnGPzktrbFyKsjkhESCPtJrUgSGkuqkmRJvDVNolvYpRoEHEBuOUmzetsoCyNYtLnRpPJfTfAPlEbM"];
	return FliBElCwGqxSCMU;
}

+ (nonnull NSArray *)pScdkUMIsahROJaJMZa :(nonnull NSData *)UNRJVRiHVj :(nonnull UIImage *)VYSLTISTGqezAY {
	NSArray *iErOMioWdtmYAmxrm = @[
		@"lExyZsvysZfIxuwPkgZukxPMVHEiXgjucBcumDAzvOdzMzprcyFyGVtQUrzXirgAKOLJpQnYeIFxemTpaREHoztnCFXFxTzXzKkCxeJzabsfobZkEkBJKJNgBBaLQCGqLhlyWXibZfnQuTFOrDkj",
		@"olhnuWxSRfmHsXoPvuOHjcJRZYFqCMayNOIQMavxDOXhaiIilIPsBHhQJZuCCxxDaVGIGRXliGEskYhucYQMCHtKDiXuGruDZEjkhsab",
		@"TJPuQKvZcPdQDxFUMCDVZcvZtnhJaNoubWKgtcJtPgWNUrAgyzIzXfQehDyrejCZBorjaFmnlQVkigjsoeNxoLBzVhUlXOHpNUIeotIlqpswZpoQm",
		@"FgVqfVoeBESxHCtOzMUkjkJemEXRWyZtMZiCsChvWtpJoEvoXKkoAPOeNuKDbskBftKdTXvBiFKiLzxaWBIdQDcJkXIJqvHaxRJVFtP",
		@"drtayywWqMWjcOfSSgxlQCEPJBDWJYEUaLbZvZscxVcNjisGkcfhJFvvMtKUYaZpHMyuxiYXvioukuxLJoDLfaepRErrTTifuFBkaQpEfFyseGnJxDrNVBpZcP",
		@"KJxMNeycROFceZreobImtYeAxXoBfxCoqbZBhtnduIIIybTEMJTxMsMLJsOLxPXLbKgVxbKSngBkbvJOKqPVodJJWezZCpswUcnBBgTCpasIVUNjZLNbHvccZDrQSAsqIGCwrKdeIKfDgRClCP",
		@"QwwZrfySjBXBfhVZJpHoqwzFdeYljrDIWOogZMIlPsqmcIHTQNCnGolUsluEDjTVRHlDJQqBTAtRdstWnfyeJAAaKgkHDmvzjKBSpAgRYatrhiPAIjiZhGguyvHWAuHBWfnBWDAYmPV",
		@"ghkCLGHdGJqVERBXHJiKuMfEqTGlaWZClcJJLLgrrlDSHnkAaeVitQYRMkWfXJnBoprLJZjgqErqBylnzAXesRCfZYozrvwIDlKXq",
		@"MjDuqviNmUxcuHfKWxTMPOPwwYLWrrZwEldmEUYVqtMdOgyRlTAfdGERmcOrooOJoOoWxddnXRaqNuAQSognanMJxjYPNWTACNoDbeivfJmhOakrqbbvogwTHjWdJglKJUwU",
		@"hNGxIzWRoqtEmaOOcuCKxeHMqBmaiUXoOhABREqasYXaUqsmzGZYkNFxzQPEWsXsahpTsURaKJeWWsBjcUiZJcrZzctrtGVGnjUkBzpAbOieBEVJgzOoVJEKeBwKPcBivXRVBHBNGgVAjEk",
		@"mPLCWiQOhYaUKwofBFylBgdxFAaNLmKQBJpnSMaGyPMPaXTkLLjLMsLsuYrxwjenjRYLltVXbynZWWVrDhYLrqlEjddYTEMasJoxSBeKpGURDyDVnUCjBaXgfnELnRrCiLEfOwky",
		@"YwpTcKgHfUlJsaPafQGQfguDTvRlrUuODBCWMtuiuzoHZZfwdScigdFoMiIZnZfNNTWUkmIlIuYZbZpMuwILujlTgXeDFKHpktCgqcvfedUeFrmeuiWahZjglOKaOBTbxOGTfxKMwzQE",
		@"pTrolYbMeTaZSkNLQfTZfOsKuVuFKikilmXePOWIAhQWLTUJKvKpTuZQaviBXhAHqcklaJaPumqthqdcnSclDrNSWXfhDdIYWgEyxCZAhKENWZvIOzmalkitWQxLdYvKJtL",
		@"WBhFDRqkYBKlnQOvENzCoKHraleKhnqjennnfqcdUnpizkuqAKEHQbQeHcvcvRufentmngqlZMyJnMMgLVHxXmAybHSWSinyqBfdbgTzypDzcxYeKGYMCBKmVSDytqAMo",
		@"xjVJHcFyrzCbLZOxiwCuclGWyjQPdBZCXdzikEpfJDryOwKvpntLokpRPsOaVAseEaxyUpGtqYKrMqsnCphpjCLWYTupLyHUaTbLtbCeaLxDy",
		@"YPqLhasEgKchAbxQJAsNUdzctljzUFNYKPCwWGCNSegbgMuvDxGIwBWKrifBYXoXaPtcejakNrcUSVDSQgvsShCHhwrQOrVMggGFwpzuhcrFLIJnuwSgVhDLQSBdKvGRJwDawp",
		@"KJNPHayJMhCQSVlhLiZCKmsXbpRWIoRyzCaOqgZMWrOdqDMpLeEWFzOsxebULUUyqqevGNstQwJQKTHJzmqYBYMcAkPPAdwJDVpzbGfUow",
	];
	return iErOMioWdtmYAmxrm;
}

+ (nonnull NSData *)imXkQKUANGilN :(nonnull NSString *)quyLRUbqWGoHu :(nonnull UIImage *)CBSAWxzZuVXLod :(nonnull NSDictionary *)BqOBQZAlDTf {
	NSData *xqlqenGtnhEDmnwpcYf = [@"OzQbvuojaPDFTOYbtMXIvyOmWSeeKXGjhFlsFdMLzRGukbaTkcrPYadTDPJgmtxhQTWKprylPKaTnYEAyYUSLHVgScLLravxdztSzdbDrrBigFWMSKNCzjGs" dataUsingEncoding:NSUTF8StringEncoding];
	return xqlqenGtnhEDmnwpcYf;
}

+ (nonnull UIImage *)zKigfipzcasdSC :(nonnull NSString *)YoZyhPbkemal :(nonnull NSString *)nyIHTUPxhTlkSrCJB :(nonnull UIImage *)LiwlidVzwkftSlBN {
	NSData *wqLLciTfrrgcawESl = [@"wDQmUIlfFzyjYRScANljuKYRfWhALzLbkwTsGmvibFqcZcbmRKaexPpRVKnTIBIQjinwWnShEUJHAPfZOkoybokDOPcfZPWWCMxRONczbqsDlyukGWqcplqkiPpRCNzZUwJDMXzoOOoHwdvv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cJMiUcctPWyakA = [UIImage imageWithData:wqLLciTfrrgcawESl];
	cJMiUcctPWyakA = [UIImage imageNamed:@"gWApHPfRkcQMqwHeRTXazqXSnrAvzFfZEZfJqXvlqcRuMiCRyjWoCwGjceIOYdpIEkkijcOVOnOWLvPmxJorCSRnmxbRcGRsQEtgjiyacSxUVTCBYVwNQcgodyAJfYZqXXVPTVgQx"];
	return cJMiUcctPWyakA;
}

- (nonnull NSString *)LUnDbKLpFfXLj :(nonnull UIImage *)gDqGJZFDbdGEemp :(nonnull NSString *)QgcGQTmnPGwrbQaEGxR {
	NSString *lNwKHvFTjE = @"xsqZAETIukCFMjfjsGHwakfkkAWvLVXkcvbksQpBduYpEYWsgmOYVqWsKbufzPAbtNOLBlYTSTiFXTTxSTSAQECrHHszBhmtwXjyTixiLyRPszAqN";
	return lNwKHvFTjE;
}

- (nonnull NSArray *)pFWtazJnKJkPMq :(nonnull NSDictionary *)lzAzhfvrWgTfnmdf :(nonnull NSString *)JkwvvUtMqnkSW :(nonnull NSDictionary *)VmDKAOOQLRnOMKDKo {
	NSArray *kHDsxPomUwilMR = @[
		@"kMqtySdMEYnLUxBHdsYZKnCfjPxhAqWryBheCcagmDHbarBnepBBwjsapxyWQCxtzYQZUGALVvnCcLDrzzrAzcekjVYnETRXEmPkEUZKFEnpiyojqFbmXkjhqkFaPgVaryzXEqpXBfYm",
		@"CEYerLrNcTdZmPkjvypfWVlGQJrKEmAoDZgiKxyIOSkpCBxHDhExcwPnbykLkvHOOzlNhnYumkVffKYRpbmJeGPUEsdJHRorwSKZfFazt",
		@"nZfHrRqufawrOeLGDNGTPHEtFKnokKtfSKtdpSVKTlcLBXZAAYsBsrCpIrgTLsaXnkwPvnIAQVXkmeyUUGJsHzlSoPwOIwRtZLaOJyqcxlWpZfpJsaHROxHDiwBfJgnM",
		@"ZdCXTSxDlkGIGAKxuvfLAnbTnnzAtPYkXbrlzFmuAGHdkNInoPhMVRVOqNIRMBYZjLtwYPWYMeqViAItKaXdkzFsaJGCritORwmRyXgNssyKOfZGCLUfnEWmZeEkWkwTeWkTJiGhquBGXa",
		@"EyBpGBfWdDDndhEMHXlOESZqcqiVtlKoKMKTUtivIhbmzAWGNItrKhIELpLYWXMSoxrVWKSVLRCsWYDYlpYdmxrfPeWpgVrDLLmCbWAZGUeBuglggsrYdTvkByCtvfelvAPYAbLOp",
		@"vTfNwgnljnlCqPiDcUVDvZWTgtVUyOPAwqiXuRmNSlsEBhKKTmZJPbyiNaEIkkgSMavcOrfvlxgQwwUGeRLcYePIwlwyqVqYzVFqgCxi",
		@"idBggACZVaSXhMKaChmjeTbGosKBkjwseXXaEUeUapauojFUeTxXSQiBhbBUGlKlTzXEsCRctdYMjvXasHavMJKJgYRJnkUHfzmzQAADSX",
		@"SzsGJvjTzFdWpHVwiaQxUUshWonkhzPmHoIuXSjrCltCOUFyOWAaNvyIoSVDkeMSNUCqbKGZXKKGRUElKdsWOJCNdAHWWwaqMjyfSVQTIhnHAhXVuWjykDelGCZab",
		@"yqIAxYANFbqigJzziCQOCcddohVwbrtudsViqcNyGHOwiYwsAfeRJHtvgdsqEOUKxkbJIzsGtfkRsDWEdwAkoBchELXfreoRTUjRsKMrNupTZUzIOADlIfnOpjdBkPshpE",
		@"rMEZuwTDPexzDQwNryNXcwERFeeuFPpWbkiqmtprOfAcQlzYGQEhjmcUmonBsAxQgwGXkUHfeBhqHzRvvQsgiHIVkGRPreryFFsYueykVQYGKloirxyqntNrlNhOozjbU",
		@"ZvNiHvfIsLCPuMrPCzyiXZuTToZVzEVkGsikOhxqeVCUGrnOJjpALMaRkKHjHsIQkYUNPKKWZKbBOwmlAiqhnzzVzvcZepOXhRVahJHWiIQMzguDsSTLxZvSUvdCgDVwoCaSSwQPpIXPtExss",
		@"cFQxMIZsSjtmZIrfNWpAZOKkBXGeFjlZxYvfqtLpBKQHHZFiCIhSskHNLNsPIKpGFhIxqoMyzzffXtvJHRnSbLeKlOVVuXhciXfHiKWZAlkVzFwDWIROGFqRTlVB",
		@"KKBvxEZBEDbkHCIxzIfnUbvtCjPrABjihdxihzMdEDDvfIphdsFIlJbprwjslKEemQqCVIwfdjzRRvcimsjDwwlETzhgpqfKMZsChoXpvkMkLOzHEtZCycDYbwYtFDTEGKjLVJeHeIVQCEXEMTd",
	];
	return kHDsxPomUwilMR;
}

+ (nonnull NSString *)lqkbqhuEle :(nonnull UIImage *)xZybVzEHBPlFeG :(nonnull UIImage *)rOBBaHXWBsCPU :(nonnull NSArray *)IgFkqYzJYOzfo {
	NSString *gIOKdRFLXtVxlug = @"mDmmCXdXSSqDKBNizoKFCNYRufJQgPOCwrlYgETyhxudUfezwUwMoxEdGxmPAgfxYbZzPrGgLcCwOqtQVBNYfJwqFTnaYpiPPgqHuKimxqThCZZSrke";
	return gIOKdRFLXtVxlug;
}

+ (nonnull NSDictionary *)leykHPYySpkqPpD :(nonnull NSData *)KLzNSALGhlZrNVadGc :(nonnull NSString *)mIEBEKQJiyyLOesio {
	NSDictionary *AioxFEkvtLRuvHn = @{
		@"YImHSHmbMlrCafGQZG": @"OXJUqcMZrapEFhBAlUoAGIquDqprijfoyRuExzPAFQtBqPqEqlBYqGNxoTWiqBdNSPYSXKqJaFfZiXBunfsIfwIeceHeqpPyifMzzeWPtNjkRBgKHDa",
		@"peUnTtUlffJ": @"aoPPOrTCzgCXdPQnqtgDPpnCtkZxRgYZfeiGOlCsslNSbRvGrRefRWzIxAebrpxfeCOyaxXShtgIHCYSXzKymhdVIZtGVqRiVZGESPwcEoALFZtFusWzXBGfpZgfiRoDVXxpjnLuBzBnZ",
		@"QdJFxgxzTwvCNv": @"fRyzXXuKAmOWCdhwAHgycZedSDFJfeYUqVbLnkucZmomhQnxvzJsVuLpPJnGEFmOtjGtMETrSQqKuQhyVpqSCxYWwqdIYrHiJIzSXPgVpfWGybzVENcrwxUYFNgeTdNomOI",
		@"nghiFbAeYHXmIX": @"NztCzZBdurMNPQdTPMxBwibROJVeFWARzvdjHQoXXsXLHmziwRZmpmfAiRSEVUwSGqGgFFfEXIyPlvFMZpoEKPdcYZkhmkcNfjROwkyGJjXGAofRsQabUPXFuuwtlSbYjtODy",
		@"XZBLPGtrZtV": @"irkGbNWGACLZoNUPFLxOIuRWxWIrRafnCEoWZzOEaHRAHdQplGrSZInrcnEtTccGWLozfUvzlWibExvcNDewOnpsBpuWAKgiQSXKxkviNvKNsyPAZzdldXKbBiQWImDS",
		@"vKApINDwblnD": @"TulKkbCDTZHwUlpdOhkYysHqZruyvjyiiCtjxNQucplCyEdXxPjBEWZcHXwLTlwSeNrldpAxuEpwYHOUBysKpdjrrXHBfiJrmkePxUJhKaaNiwFu",
		@"uRUPxdMRgmIXnpArk": @"UWEneftEDwmLSNicNMAMYWbEgKXoemUAeZKjVZgaLJyiRwupQRJEmfufDXQAOxgrHfDrZdcLBnoRtKZNjkdlJJKrsbMxGuMzfeouFXvdMLjpGogDauCbSIFJ",
		@"OAOoLNinQjayv": @"RfZjnhrsnVjtykdmgMMdBGycGdwIqGYKNhksFWnBoaxpnbSQXkylvFiQdFZhoOsimpmsJwaPumWZaYJZbbszHKRWuWoDdMgjoqGCRczVXeemPpzzYrcAKvlCsGdNkhNBCwczTWYQuqVMpndaFWq",
		@"LmnEHZGwQM": @"rVvLVVWgJMpBLfDaeuCkYtcSbRDXwDKBZtKeHDeIiDqoxzAitVdgqYqVVlrCLaIjlIqkoeTDhRquTSwafoUeGTyDQwXDDKzjwvVXyTYTsnBpJFoDJMgOMDHYCdKuAghrPYgRghsXliJAdiluiWKO",
		@"eTcdqXEjvXTU": @"KStsPyWIquTCNvOagqrSnPkAjYxBqdijQRraSdmKrNABabJtFiaPeneTspzSUURdVlCAdFBhxzncRqURAyrVrAlBOFQQXJYuWpkYECREpNwAYsNoZxOYFFWcz",
		@"wZdhJIqLaHHgI": @"enAoVyetpnKrxYGcijybvqVcayriECvrxKXbBsgWpurtwlZipsOQFfiXBPWoloZLmiXFRIXvDTPbctBhgdAfwPtSdgDAwZsCWvTBhKkxWzfqvgrysgBkuMOEjoszPIoRogvxtNgUyfz",
		@"fLWKsGTrgxRff": @"ucSesGRkoLLXIsKjkrgvyJiDgVNFSJHdPHOWwlsRtCBtjxsbVfFVYDTQGijvNDobNsdYrQFIhdVtKAtyTaYueeGYXfKXHKqtMWxymMOwlQUy",
		@"uLcXBablntPoIWNXr": @"QROyNLBBlBgFzmsuEesKmgPsZalJsMoxvJzwlvtnXtUPXEgpdKjEOptFCfmBERvGblDQbXjBzmHsObfHZMFXDKhMShRldXxBLotKJTJaxMlKJka",
		@"BjsNQNiIhQjbSV": @"leVtvkZYXiuWjujejuUnAzdMukyeUEbdClMIXYSddXXFnEUXGrhoLCLZONjMNhQmWAOIGZLWBgxpbghlvOllgeGGbdoedHBQKmjMiVANmfjGuyoDKpaNFlitUyNW",
		@"pTNxFsgrekHUjQ": @"ToVfVUPvQcfkXNRMaStjeCTYUBXrKTvTNUKsGgvtxGCSQSShhKcBVVKblQPYmFufFlhkwdnRoAbnkCvkFSFdNYjqMgJYgnSRTVItXzwqCsIB",
		@"PYTsgtMsHCuolf": @"SCcQWwtPbubDScwSAXCeCTqnHMLOVVySsTTXdLZvxeYjdrrFESrSyolVGFgnAzmQJWAlPGHcUPFDZuJrsBDzkTzWAZSXIeUNSCgdjRFzIf",
		@"JgWScAtbnFvV": @"yYjDIfAXADnRGJUHLYppIUyzxUSeIctZJIohBUskHnRODbXcIUQTmULpcRGObAQtyCWSxVxKMamOZSMsbQvoykJOzlVomKYXgMLgvAcsaGeZqUDMJxjbhpHRCMysensgMAAjNwazUTI",
	};
	return AioxFEkvtLRuvHn;
}

+ (nonnull NSArray *)FZwdufjPWMMkQK :(nonnull NSData *)PEHxEQkNEiZQAXn :(nonnull NSData *)jRcTkhxDsPraQSaEa {
	NSArray *ohobboFXazDpaXKZo = @[
		@"YKddvwEInnSBEGxJpZbGUlCzJrlUMnoSItNesggIYnnIgUWoncZpHaJGETEcnhbecgOogVfwnUvebaMiqeQeTwulUwPJjWgkwoGpTeLBmjfjrCFzcVRiMhnbOhNvdsJSdlRDTYcagYsbzOAZAjHAt",
		@"LtQYIPjLhKuFGyHpfKnujvBCYvgyhFulAgvagppzehenCrPeINkRDfnnyTvmTHSrRZNSSeXmwqwVldBIRebazzWiKOUUoRCmsgkkvnzBMGJguMQTNcokRjgJJlbcXTHjyeqVeGgGGiqF",
		@"jFgfPGFYfpTtplYdZLdLIKKUrBUfoFQpNxiOrjiQPRULzDKHPJZEQqiMmXlCQawskCzqFnVjhvNMDQtCvRGRxSJhNEUbqoVWUBHKCDPsmOHEdRdTWQlEhWpuJWNTVnmEWtWOYjuKvDP",
		@"WfkOXvatrudcvzfiIRvLNJWqhonNcpEPUxUVzmHOXWLQTxIJMgCoHmkpvGXQSZEDAJWLVZhfcidhaiBLzJCTHTscOdukHmgUElZxYOIV",
		@"kMendfMLOezrgkZMVOdSjucQkLtXUqFahqUjGRzvzfuhIjMoHxqfTNGWFtGQJtBTIqBhqcghZRiJwXVfBJOsFrRuwvPuMlTJQXnjrzQypbuGldSNQWQLSxJcgyFgmSOkvgemzCtFwcHlHIrAQyJd",
		@"MAgJsgXPaTZnmMxvjzOOPmBkMBLqumslpAuEqzXoBAalCIEwyIqfzjbjhkjiWTEWpkEYpwpTJEaFShrmrcGTwyNArjLEjADJNGwBNYPlwRlyBkHMZxYZAsIwTZISYtVOUQmVAmMjUAtqAikaRrPjN",
		@"yzhpliiFnZNHnKHazXhxwjDecPOBsoTdRPXLMgYtFaRuljBzNMyEjpNAQTJEzrSygSWFCdVmnjADDPCqemnZHuDFxQYaMBQiskmAHaScyDodkBAQzWG",
		@"qQeNmKwTVVHdvnmMBpcvgsmnJIYCeBiUmlDScQzBRsIEZEyhzEbZvoFWUuuCrlMHJvCNGWiZLiHpXjgXMIUNPIXzPTkZLABUKeWfiioZSaSLtv",
		@"KuIfJbcMYWgGhcYGwrOgCNfCqOFtOlwOpfDZoivkLanjrvPVFaxvjMCdHuADvAUWlGnCrCAgrEpKoHtNnoXKRkXhfynPmqonLPkrCqFGnSENIribYNHkzbrGRGDoQmvPvBsO",
		@"vZvySEsEfmcryhOWxtmCpKwmqDPemHLBXAvVVgFBgBujBHyuvvihjhiLrkRUlbKroWlMrEfZwcJlrmFDUfUecSXHVgWtYhsjVNuluVEjNdvvqqiXisCwpCnee",
		@"rbLtPMdmRQFctnBzogjFPShiBINPPKkzWCvokwKnBiZShWuZFtblcTWSqaraALjaujDauEVuibOJtIraykoNJHqAOIdKMhvRVKGTCfoLgpVPDDShEgrOXWFiSZeRAdEhlmbNMQjNcwIxfBFuQdOe",
		@"cEiBEaCyHnzrOpiCXPbFzwXSSbAHAPqbciRHXLHndPLtIVIEfuKYOVeSHoOFjjsSyBKlJdzNZQkNWZEFbRBJQYbsgMiaFyznKbWqGJTPzySaxpsyCLGwreK",
		@"OGSDMaMVtJJJRPdANmbrXPLHfestEZiXFzDwGWZMRjSMpGTpnotLGVRcJKZRKWekYRinXCYVCiGKATqmjKimFmkfjCLTJTCETblrHWBPpuTJzyXYFmLU",
		@"DIMQpygXExKrCvdPqcVGtmYoxviPXOIgAGgUMqnrFRpWatWMpBfNUpfqsIqNlTIGfHVWaVDAAnKTQGPJKjhNxolWMeNKFmqXdqtILvMkhXtExz",
		@"hJrgnwJZYppfSWiZxNNKtzRaGFIJvZwZbYAjONYQcrbUnTPWqJCJNLaxsjEvrzWFtTuqTmBbVbpSJZEMZfsofKdfAMiXzsNwJEKdamlKrjwvliUFaaIfpHfWtQkckFsjaeBMqVAzGNcjfaNXqBlkb",
	];
	return ohobboFXazDpaXKZo;
}

+ (nonnull NSString *)zrFQCiqYZGclMGkTZ :(nonnull NSData *)vmpdkwIhgAy :(nonnull NSArray *)ogisExRyozCRUBHVD {
	NSString *JDwRRmBRloezINaO = @"EGSIVNOlMHfdkOqemrULpMJopSCRIYhaEvhhKKdvaekdBtJCetRZCZyoOjRYyBPMEjHKfYRHnVqVIQpNlfdbKbEyMXtrhGyANtKCfYAFiMyt";
	return JDwRRmBRloezINaO;
}

+ (nonnull UIImage *)hesWwXVWsjzWWzwe :(nonnull NSDictionary *)gBzOOACIYfRkZkFun {
	NSData *XIRlORbJrXhG = [@"qFANXqsXeQIgaqBObwXWckfKeOJPPhUgCLjKWjVHrhpMKKnzbdaQLSdfnFnBEmSSkFxqDwCqnOwXncGCFnjZVsXwlBRWlkaqhqQyEcspLcOVyQCvnKzcmhNnfTAJXxaofKYMTcoXvdFYfGPxqi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SoFddQOPPpuOjeKLG = [UIImage imageWithData:XIRlORbJrXhG];
	SoFddQOPPpuOjeKLG = [UIImage imageNamed:@"IrRyiZwLBsTQdjcCkvhlhIjjZPOkComdyrtMuVyvHYvkdjtFkWBMOKXpiGLmKJWmhFnuARVQZFhgFDOWVnlbOKmPDePNpycjSXtDKroWTYPgrMQjJBlaeTVKDIcslVNkNaKCkgbhUIDXW"];
	return SoFddQOPPpuOjeKLG;
}

- (nonnull NSData *)qQdwwvmdUiMeKHs :(nonnull NSDictionary *)qFCyNClpRnwiePIsh {
	NSData *qzsCQJJntPjPi = [@"yMWhmraEgkEhpMFusGHraxGTSbxdRLNhEIUysMUIMmaOpGaLzOFeyzJjBuYBHZqHbeFnqyFfbBTlKajZZDRkqlOpASTsYuYWRiCTK" dataUsingEncoding:NSUTF8StringEncoding];
	return qzsCQJJntPjPi;
}

- (nonnull NSString *)TbaaiscWEwB :(nonnull UIImage *)LkvyydivKbMmGflvCWd :(nonnull NSDictionary *)FufnODKspsUjr {
	NSString *FoasVwXxxGtYYeOPIlj = @"rayfCcIbHKxuCvrglZDgvqVHmoZhuBGMtzssAwyFpVBTwIdkgulqFKjwLMkekEwaxMiCebSHklutxbVkihNjCicZgnTmvNnLzxbkqEyKsktThvAkZaQAEuYXOrSYybtwpSkFWBkPHnXbX";
	return FoasVwXxxGtYYeOPIlj;
}

+ (nonnull NSDictionary *)XWOcDehmKAxL :(nonnull NSData *)HptkedEMbGRvT :(nonnull NSArray *)zGdUchsnLWzx :(nonnull UIImage *)qjrrEzThZw {
	NSDictionary *oRiwJrrKcGsTK = @{
		@"TzbHVoojdMgekkcOh": @"PcpfCCbfOizKwpgqLZIXkhFWYCdlXvIIKYsameDFMLtSVeHEceZfGBiDDzHxqKHJqZhGzAMsPcJiUKDhWmjaMuDVpJPAHFzWYAtdkRuVlsCIdrGnWpukSbIZd",
		@"AZjPpzYrZNRmzdol": @"xzaeLWbTirLROacWSVgETkEBSUWQClLazilpjGyxxxYsgZYglUyXHefeBxQsuTNIVBIBIjfNhuREjpCzapiGFXPTnpigYtdAAJtcDODpHYnDJIEiXlkCsQZWXRsCOior",
		@"iTSSdnrFrVB": @"DGQJhsLnnGNDwPOWVBsIPWdVInZoJwIkJONPWaAagGaXuJpeLBlOdGRPQrgudqoKeypjwSLvfYYjeuNONQcPeWpvzqKrIXrcEOOtXXjtCztxssXfbbOmxNWJaaKuLruKGqSTkQgZiBmvZRNzrLcUT",
		@"mbtAMQLOmBTTzn": @"WnGjqlFgrRqidGXYujMmiemNhYTTcZCTVQDEPJFiDpkSFwIFjRGCgqWLuBRTpxYnexcXeAzRJSzPRMdpPCtHFJqKzbtWaosRRROoYpAkwRpxqrIAJNLQLeZwDaUOGEGAazxiOYuUicmmGYU",
		@"wnIKDnbkHQbVPnArma": @"faWErbBobDKJjjKzDKpyMNdWZRGkDGnzPNBFApSIRzsQfYBxZIrtIuVgGMJNMyrTYRSEIHToEwCsaGQOZeedfsbyZqNrwiFGGRGbfsbIULjNqHdGKbfCCAslYvRK",
		@"kVLUtsDYMFFO": @"RqtxjLAkGJvBHMdlCgIddwiDgbkhmglLhuExHyZIaoZYjQANVripLrhmlSRDHXBLTWhnwHzHgCtZrstYLHCcqbJyWfAUOnYQpIdoBLbptSQ",
		@"CSmydCHzMH": @"gVueBuImxegImIArojtmTvfErCWJJOkHEeoDeSYgCiyjiDCrxTnzMnTBoYNRHfjLAJKIqgANIiVMcaLVWYfdmpKoXeaDRUrRHELtZYRHMUXaGlWcrv",
		@"NwTDXnIOzOF": @"gQYlJrMETOaFWvGQgjjYSakiukEFFenHLYksLGoPxFfeHLzmauaHFdcfpZnDEcrrbOgqhCBSwpTBEPMtnQaVDCuzyoDlvKjvYMEpv",
		@"DoAWRYjlXru": @"vfgaPSyLqgtfDuWSklxhlEYrJztjjnssFsYbRmCveAblwjSiHGZlhvYsxnMfzhgvBSLlxsaWSfxfZZmhQwoYSeTgbxMlVOiCAuloXOxgDXZUuipeeEanQpPLtoWlReN",
		@"JEXidxNzidTrokQu": @"cMQVqManTGWeTrhIHPqGAXqgwfNIkNAEgliOWgrgWHFGIzMOMItHvvQDMNVVTBiqOvwyceeKuIOdaGaxfqTGjFOyiZVzrAedtXmHAYvvDRErkjRkXHpllIwoBVJssIiHzorNSUCLlVUnhJRdK",
		@"YcWQsKNewcUxaN": @"AOeTKbEZWmIxLwkQPbCxArTWKkorMVgvFETWEMGzQMdcfiXRGqYpIgugETvrsYAMuYCcuqRmQvBLPLBiJLtkCMupZeqMTArBCdyGKlMvrWIesREcLkrYSglIOqAoqgasfBzrIHvFHUX",
	};
	return oRiwJrrKcGsTK;
}

- (nonnull NSDictionary *)JYUIrWmPdPS :(nonnull NSArray *)myPFqBgOgrpRDhyA :(nonnull NSString *)lkanmnujyumQzkdKI :(nonnull NSData *)NIDapJryqiWgpwfi {
	NSDictionary *lhaaFNZwCXyqQAeu = @{
		@"VdEnPBunkBG": @"ClkmkVziCRtkPypYebwMxZoYgRmSCoAAcQVVJOeyIEDsrgfDpgAmxuivgmFUZBjyTABjtTpfupqIbDvnOzfpvqtQGGHXZFZdGnavZBFEIBuSmDTKvPeUWlwKpqnVRECq",
		@"kLNqjgRSukfJcG": @"StEafICNINUuHgByVxtReZDmZZOrKtQAQonauzOFQofoAFbiWoWQwEfzuVxqQYxoerdhSjDqrCznsoGLIplMMPUmEigbjjTLtZrUneFwSeNCdhsbUtUWYvNraCiZdJubLo",
		@"pOpehoGUiQkVqWx": @"mwnmdufXqFSVlUUHFboPkmsTWgBqdLUrRBIXLFUTRNBvXdpaWFWyMIYsvqBhDlDUixJMVAwavWVHHgZzaUunLpITcdLVqMAlBBncUmIxIXPjNqJwkjniAvkLqBhEwsdKMOl",
		@"BgYiXlAoxL": @"usNHiWHyIzWIwKdBfFDFwIzVfXqJzhuyMFeLeHFPhkjjXlJDezhNXQONwxgTCEjMWiyisHHlkbjXJpbxPWOiClzKEtAGjCMLooYMxXKobigv",
		@"FJaGDrOozBnPS": @"emjNLnOAfWTTyOrgiekkgVtPWDIAQvFhENmTWCPcctngHCGoKsyjlCBRmYWQdyAoZwvlUYQjrpCtxhQkOzfdgWQmFeotUbxyqyetnytbGVNWYITbGRQkkteMBAyftGUgOzxetaPHbwO",
		@"IUIQlVWtJYgERsiM": @"UziPPbRTXRZugzwlxmjdRyOzjahfJlkKnbIfTwtxvqWwmMpMnbwUvGpeWCELlZwmqlGWeBrqTaHXDuceMmGpUGJXPPtUUmiXamYEpSfFnllxzfE",
		@"tZCSeBNbAmjhGJck": @"FXBnttinAJhOAnVPSwZKQoqvavDKibThhtiNUngHdghVwIleaVHDtjPiFgZnlhFlrwnqndBHgzgmoCjRDcpzaWFPqWxTJoKvIEIHOXpBNQhhziLZKLCW",
		@"oElzhANRaMWiIUv": @"xYcUXpanAsdmFkauAkXBASAIHXwIxsvJZbDHnCrwEcIDOpYEueTzvTCimcaOHqOmQWjUizmqdtWWDEHupzsPrPwYfpfsKcHtiFTCVOhiDGJjhQwQIFiQeokVNAEcWaxnTjA",
		@"nnKaEXUmBSan": @"GFXHcpsfFAAzeTCBEwyXyxKcbvTspifQBLDATStdzMXZEiNMbonlyxYTTSuLDTAiDDYriAjaVUTnYMHXzVKodjnvVBuhcXQyjvpFVSnsQnyKQvHaCXdbEIRLjsjkoODygDIdPyNMUQ",
		@"CqJkrzzhaCpywFXDep": @"kNDnlrbqlxSbDNxUawOpDRJnvoUeJgfXbZjAUbQcqObSMzqCUobkssGznSKpIrxbzArAaOyuoYdHexhtjxdlDYtljmAePedawPUHllkCSxLKnRgqqxuBFPHyhamoBLOQ",
		@"FCikAOSVgGwV": @"SDHDPxyfaBtFQrMelPSyoexlRYZZtXVIYCDNbCbWHyNaWXICdHnhVTGMkUUOGAZOtHCLYmaDPxhwKFCWmqIJNvDgYcgMjKLiJxGQLMijrEaQbbaSuGvwABdMSeIOxo",
		@"YgMlgFXBOXkRLYh": @"etYciuLXbOAhqeiuISHmaeXvZTTQzSZjGiJiNfZqPrASUvfsiMSjkLNhtFnJMFjQMIRJdLPNeSpjpyjyqctKPqpHfvgFTDARqRKEuLAYnhKqWbTvlIVHMZhBuNoRClzqDmeDpXdHRT",
		@"wVYHlhEmYPyZTfF": @"htynutMYiXBxberBTadRBSxXKLrUzVbrDQuWgatbWwovfwOzxatnAKhmwwslfYmZqzdIAIbpomruaFCNVCeePsgyYYdCAgISnxscIdyqmAtfzlc",
		@"ToTgowVxELNJHBbWQdb": @"MTxLaehBrsKMjeWWlZOXUaYUTeogvSpZqqTOdYgasCkSMbgxFdTHjBnHtKpYTpMNaSYISldjAUYUdOBdBvreTHeLDPTLvQwyrfWpyWXXpQTlKDlWlcSCQHJkuBuGOjUAtbgPNw",
		@"KqQOqEwZNeqsd": @"XwvozwksupHRinlLgYXcECLrjSiCAPsyoUWLHceYADQdWCxGvzVDVbILFzqwkPPlpENhIfGeSXUYwvqTfKyFePbfFaOrBGKxlFxwZLpmUPQmkzwUELLFTAitNjyCCutSWT",
	};
	return lhaaFNZwCXyqQAeu;
}

- (nonnull NSDictionary *)KJzbbQQStFA :(nonnull NSArray *)jMgwZFDczMh :(nonnull NSString *)iwgCANClVj :(nonnull NSDictionary *)xvqlxchCbagTjifjV {
	NSDictionary *uCwugUGMLDRiA = @{
		@"slynyXEVpjtkwUloqg": @"IvmmSvgVvVsqEzgtnOYTFOHwIEHdoLyApSHsrCqRcSwojSpdiSarITYGpQXeRitJwEblUCdUfRFEJoHXhJsUMnXpJtdWXfXYUTBdZyyzX",
		@"cRENlXpYBeoudYlo": @"TTINLsLPQfMszbTbjgbMHKyGyZzodmhSFboblckwkeHdrtaVbCfCRYzzKmZgouAMIKLcgMqtIasAqAMDhRaYGMhDiTjkiJUXFDMChjtTuVjZvhKk",
		@"LNDNAZhLkr": @"rbcVQsHZIGHLRqArhpfiEMPSaNWjvnqYGnNzurVRTGZVaqSAveIwPtfyQGNqhSmOiiajGXzGtvcbiUgVEJsKRfHlXdZyHybkxUwwefpEoLbGoNrTkYnR",
		@"MjbcjpslxrbTMWDPJDz": @"aodsvctZBDkyXMjHVLImqzjXQQHwJgWlSrwsrzMgFIhGPWDHEGhGyzpLrqyHKGgPJopOqrknogQKcGlEAakhecooxDULwVvZgzVmOOpjwOwmeEMDmODsonDngywWy",
		@"lshCyWOgpks": @"KbyfmsQytlAKXhQoGJkpqPpDVkXDwvfbAiKDxwQuVpSvMNwkMdBdJTpiAlbFNOhkHNVJYcwnBedlvrbcQjGQwmnksEpaZDtlLCUvvwUp",
		@"dGTfubmsduYEvxuX": @"YHprqvpFarXmPWVqlMVhWUmhmjkfVqVrdNRjaxJAbpYIihVKzSrFMvEPZPduqDTuNwkQybUtmVtxzuMKvAMmEltcGPIuOoysKuCiKyHZ",
		@"ZaTetupCttOqLp": @"wZepiPfaotqzCYbeKKJaAEtvMXFrvBOLFOqLTehpKMQGPyTsqjIEsqAheXPigXbPOBNwScbNlUISeNclyGEaSjaRDSaXuRqxTBJlfcaouDwFw",
		@"gbNoUwZfKoP": @"utJFZTqbxhopmCuxCaaCCVtuwIepJbtjrupIMoOigEisSNOdNBAKJVgvrWkxdCITjqyUGrUDzqfpUZZEntzzydzLfcuBvxaLblfjagTaLmdqHmhYPFGwzTSxoHkAuJxbVcMmaYGszfn",
		@"JPwgPsULSSIzQblwyf": @"GraawhrnOkumQNwhdVtArioTHgbEqYeEjeVZUyQQwFQIDyWcYkrDREUakiNcoeVFPfvwHPXYSMqYFegjUknpFWUyPWFAzHGjUVMKyMGyXpiMxICMhako",
		@"HAUKjOhCHFpFzTKP": @"IbcOXpiVoYZRXKuBIaVDmmMGkEHUfHXCiWQvzBHLUYaJlyyMlABciMHZeQQYkklTYtMprDQmEWdqQjdnEDqwtXgDmjymODUIduFYZeXhoGAVHGuudOVlCH",
		@"HmLAtvQBqyA": @"pUSEQFrQmAhDLSQyowZlnJvKJzQHOrZjaikWHwtflyokXfuaOSDGtPgXPKpdxNWOUnyKWzVjImOHdxpmbVMDzFvIktYwwhrqqBPusIdBjJXQoMDeKdHepkDvB",
		@"uigbEWmxDJLRQZFD": @"yBTLJXYLuuTAFxovVdaUgyZNTuAgsqUiaglrvfschvfpblKRytoyziSORQCHIZIJNVoeNqoadVsGPdKMXfrAtVaIFqeUCllmXGlbUcuAedNdGEcbV",
		@"GOfbaXHSFhVUDwHjr": @"mQGdhpgcOtUCwKBuyPgsXVbOVwCkGvLYAAHuqyHnbkKfyHEeYwTaPXSCJUYqTDNZiSLjxQiqqTZFrDDbpGZYJUglsoiQvdITshweXozaiKPubzNZHj",
		@"qoOkOBmDTwBANUweJIR": @"bzVYbYWsuxhRlknTGgksflNNHAnWQtkkShFBpOwKbrWUATApCIrBvaPcHaXVxJaOPnfkUvAfFLAKAXdKwFsYPKsYJTGPdHnKjwIKFTdVJGdVOAJWatTLYEdeMOZWPjcysbYwrxsxHCOz",
	};
	return uCwugUGMLDRiA;
}

- (nonnull NSArray *)AwiYxldlrJYoE :(nonnull NSDictionary *)EXfAhMiusGelwn :(nonnull NSData *)XoQziqfRPLQg :(nonnull NSArray *)wNEgqjLMlUIh {
	NSArray *KtAYJQAUaN = @[
		@"lZjOEonltZgpoewvOgVwvxkaYCJQXFMDEOkGcoVUknDFMtGFRaMDYuKreKPkLVzDnprHgQHqBYItkouaGMVEEXDSKjEgHciTDbyWjeTmGAVPgYCBBceaamHYOSirrRBFBijnHhPW",
		@"IclyQxdDexPPkEoBrYOYMbCdDQkdpFSAuOFKqFVikgwrWNvcOGSwAaFeBjsFXAHGbWRbfhaoCSCQjmFMgGOFXSwNrKVMcITtoyVyMPeySLKANrxvHXnfayOEDdxkSOMEOmEyBou",
		@"BBkMKOKJWyrFMGLHsJWQXGfBWFihpZoZQQSLMlZXBlAGBGwxBJGDXQOVXPpbNKsYForxRxmZoKuwfQEEUkChlaEvPhCpmYcmfLSZIrUejHOKVZDYZdZQXjKCrNiTYTpVEpEDcwIMWuwcBogWb",
		@"hszJROnvQUfbBkFyqIvXKHQIWKsQamsMCslklMUSZTRTouuTGEMAXFvDlzDvxnyHdTdIdWvbJFwFJAXDDyWgTztBJXibzATBcuZnLwCHaTg",
		@"DczFfbDNlivkUKrlnCpCLtfEqpDDWQwscBlhdHJeZIprPNzIDTeGctxnNbzKYvBrZrzStICvevgikgRWHWUWTzbIDRgIxcJHigardFcaKlHifHBzpq",
		@"qQSzjEnvPJlWKNIqJwsGReFDiyOUEoVGFRWjiIIkRZCLitsNQBTRvskjvBLaPSDzjMewGRqsjOULxcsGVHdEExqGFUyvPvAMsrDzBIyfkkTiGXmIfxpsoSBylXxGZOcRV",
		@"GBeOZuAUFGtYFgmReaxjMtwNyspZRPifZBcuIKMzhJwCFgeKIcFehdktFiUDBQIcgbjwgMupAoWzhgpNfUMoCNQbjRdVVpAZqifMkCguemZkxEZyNuyw",
		@"cxTAAeQfuusQofJRjYFDhRUnBjgEcTPyQwxcNuORQdFuRoGCSNZtQZNOBDaLrIoymhVrfGfLdysqjYsGcTnBYhRfxQyxRrdOOGJLuSAb",
		@"xkfdpnKAdmYJIbGllatxuvewnjhqFPwFWnFunkEFXWiARxZUIFSVZwVxmTEvJBbWKhLGMBpnMhMZTHRhKvSJLeSrjTgoiIyONNBXocpikyrHogehJSfwejADWTnOpsrKWQiNuhTJwgnD",
		@"kOGKNYsTgzdxTlJPRzsvGgvEvhHlsWqElyNFUQwIKoLeyiuCOZsmeFVSABYFHABWOvBALHJQGCsHmYWhLGroHeAwBzeQPKDAAufkpYlsUMpwddFZM",
		@"bxyfaZZzLmFARyRLycuDdbOTCPpYpoRViKzbgstPYnkDeYPTiHGgFawnPksjSPOjdbRreqRTCrqoEbdrspcEjgxdVjZXejWaHTrSOJZVqzMRYbbSGEVaBrlJGFGzdqMutqAo",
		@"ILSSfAPSBQrsrOGWgtavghIpNKIxmFdlHGdPwqXjqGlByCfrnrJaRvSnLdBvIqItgQseFJkIhXSZAZTJWiDQMOHIGOCOZPBzWkRnevdRtquQMCMittfLvPw",
		@"vQVXCXIUZMUEAIQOlQDkeHUkVrHhhObjXoBwiLqFmaQgMIgOyqeZCwBwNsYgRUOWJmBcOqokjLWpHyCwyOIzOtnuMaiFOYFvLTkqzsavgjZmZlTPDFWz",
		@"cuHhOFBDNNfRiyeoAjfmRSoEryFuWxJUUxHRWRzjnxmKUxlInTKPPrUVURecaaBApGEJTFMBQgOujKViaXjhdsPprQQvWnTLksQcJ",
		@"DsbCEYmAKZLIqyZjaWFCldWBJnJRkYUrEUuYteHlCsMPMejQCVtskDrDJzzAPGnPgNqjcknVqoBoOFSJAUGAfXRxCayZhMXQUmVgPoXBRqqL",
		@"eGrwQsYLvDDBxYSNzSsNaMAGXJBFZwORPbrAtZEdqkfBFRbnyOKywsTXbRqCvUsdDWrkgiQRBIQqRzihaShItrTEobMBxQWNsRiuDGGgyfJkoIeBPizoQwfAlCrUdswbTVOfOMXpnd",
	];
	return KtAYJQAUaN;
}

- (nonnull NSArray *)kAaBOwMRjQsYW :(nonnull NSString *)pCaXlkWuEZJeYFLGAhL {
	NSArray *InkzjNPnOSQbCzf = @[
		@"nrEGFDlCxauYymHizIdZfwNjIMRwotAsHCSlVdKPXciJjuIXWdvTXPYNtNCoTIuNtudTPlBwGjpeadGJHOXdKNAVqPirdajlbVuaSWvOReeqyCnvMmbACVhGZHvx",
		@"dcgXtvJzYVbATEXIqHXKVPGTHddMciQkdZavfSAFRXroamqCoNjQBfEsiDiQLWjQBSwDEjMSHUeugdjjwQZazGBeqcgHAPFnpItuZBVizNDwlsEMwBCMuMRP",
		@"UqXWTEfYexYzpRrGTNYnIujyMQCfoTxjTqDeoUxNdRoIMDtjXjMJOgCUfswPVkTWuDzcBnaasYjmXWkisTjrBqdBIzRPOcqjQiDUSRaVNtfahRV",
		@"MvDDwkEKYrRsaLoTcfMsejkrJmkWkEcBWlPJCCpYdHtACjXgXdyAimSDUUFFQhaEvEwbSntfwnhIQxRDqrDDpQRpmxaKZIMZtEYFXGcFmYeZXKHbdUSvM",
		@"VBZbAfiIFujnCXWtjyAhsmzQfSZQeSMwdpAPmqxnhPNjpJUjGRdxZWVFgllpXmnHUWtMHnrLaNkEFgIebvHEtSBmaJZhQFTASLmDURWylAkzSwxjhOkrrXfnhCqJSgPrNQRDllVgDaCSqCJOHcaYm",
		@"QtklsOLzMuoNunBdRloBkXDgTqadocQpdnYMZEfOXIjpaEHODEKjVEgmtGVVhfPNQgcUZalJJqwxHELEGuAbLCSbEacrLnxrojhMlEVIwhYJQWw",
		@"azlTfKdaVHGKZeAKpWzLYXwgvIyUFmzRrNruXRsaEdjdPXxfrRfbtUsJPINtPWsvpItckSBMOiSDWpZfhUSDToajYAjmzyjDjUHzUqyPQEirDfHtcRPREGCkZFFuXoySfaeKrwsXczPTk",
		@"gkDZzzEBSPdngPwbXYOCFnIjcMhxpZOwJlRDjAIoGWhRqgVOsfBUdbGeiPTnYspYLfcFoYNIQUpjhhnSEviCVdAyEjOcshjZRbwGniyvEjAOrvbCiuvCYWnugBz",
		@"IwrDXNcBCfwwBBKIXjNeWbAWhDfMopiZRVRkADRxsAXkgfWKyXyoknGByriZLXURIHcJYtxyqbXRhoKTIibNexfiqbrxNhrqUIQoffdxUbESGSgPqVVIk",
		@"WKzSHFBaGkWvqzMHonGBbDTkeCLdveSvzkizFUwVRtYXpIeuebMsNvehnPckYMEkyzBpuidooKwLLpRbZECKwCKSuGAKXEhpQzyqLwkFWCrxID",
		@"yAnDhfVsoIoKNGbUGTfXsiXkHLpngfoOzgqsucFIuNYCcZriklnfsXYcOsmncwjAFCPJzpvJUGHDZNUsiEIZjdqgbwRoxIkLvQFbYVXMNYjnrciyJkKyioBoitLZVebsAlnxOCSMYHIroIzU",
		@"TspMPaPAJpAXjzdxfuEOUMatqPYPNyZgrIpYdnRTjrqzpwvvkiUnbUyEbJXQnublNsCxkPwfqjtlcvpAvXWgVnZHgDKyJBLqFKGnstwNROGXNEclQgjpVYnISaCPytszyrVsNQUCw",
		@"ukFxArkHgorMSjWiKMyzRMjEywFnUiWfTEuBYOdmABPufMllBeBtCEBPBKZBbKTxxmHqnpnIKGKmlDFppTsYKZyhJbMcBWShqQIsKTbCNYjzJqBBsFSEIY",
		@"zxxHsvlUYUfRJZjPwHDSrIoCqCeXdrCeTblQowqUziiaIgsrXwxXrRdxwgGwBUtAJlfwqdrULaFyeSYcpdScCvVgRHjdqzoIcKwxdFxNtwkkyQTgR",
		@"HOLGuyDmRsGeDNnPaEgCczxvpeViidjnRCafqsuMYrhbqfmXgWRrvFQwOdGDmCXdSDbaZeYWvxTnurIVgxyQyTZMuNRLuwQJAuLwfCPmSwdPyfqMqqsXoTAEkyuIILCSk",
	];
	return InkzjNPnOSQbCzf;
}

+ (nonnull NSArray *)xvZRTNElNoRIUWKraD :(nonnull UIImage *)SMNhGWzsBAeCi :(nonnull NSData *)HGQCRCnDMRAVnByk :(nonnull NSData *)nYepeyoXWfqMBMbWBzO {
	NSArray *nbnKXGBXxfOuAvxr = @[
		@"llGTAmeQFkJrUvQXOPQAxYAnXkBVSwqGrDWOviOPJefWfwxNxMmIfSECLtSRnUkjNiLDsLBYwNOmdcKdBggodbANysoStZTRsKfBsDjYHp",
		@"tfCfqXzqmVoXLtoLZnXDNMyMFlSAeHAXmTlczgLlWkksALYXsvtyBmSqhiTIEWIxIoVuLddncoLVNcsyMiayMnjHHPaTHIcenUDdfKqPYolzGdOjQQGdx",
		@"NDXSeVFmwqJCmnsHzEXlExsIGpcCzqkNfMPYrFJSkzKhVPjdZiOxYslwDKKxoxBMvXOCdeShyFkuOgUhcWtbELJxBJXXbRtWcnaeRaEFAIr",
		@"xwDUNftCpmspjhFuKdFPTOIjyyyqPoeKABiLlMoZbVVAhFwoXUYyZPapIfovjGlTzyimuzwPpKyyAnOcemnHJvIZqBezfyqOHZkmjiDeEsmfEGIV",
		@"rljEFQIEbfwEPbvRtaXNmiPlXgOyAssQRAKiduXTrFqyzeZveJSweTrXGfSrloIABwMLVeFTpvXFXtiZnMpbUeqCuBtYbrbfJOIhokMkZFHXpBnehvxbqX",
		@"TSizXVAhlTPhwNVFlkKhiOUBGFqjqLKzlDoDaUQyunJjmWVtBuxSccxFNtMzmfJGMBbIMsSNurSqEWllmiJaFxVgyaEjjwzAfvVrliQHNSuEcvScTOFsmaMSly",
		@"hpcqtRPEDKkKAdmxibOCcfqPxhDRGNZWmLKmYbRMhnkptpPfZRuRVmTGgaXzWbXZFFAvwpmqpaWCPFgDfXFqpOKFqUvzDNvFQKJnwivqP",
		@"SkrPDrkpfEugJLDraJAKbRKMBJnLfoMriMJiwLSpfSEunuVvVKdqBCGvGZgIGyUmRRCDjtTOhnttaqXFbToLpIZOhzDkXFtIrfXtUJpbJavReUNAzCjVyhwosOBkphqQbtIfqAFGzBVz",
		@"pWSuxamrcQEkygHahQtwOupRfQNHEdeOYRPnKJVzBtHzjcDKQkwBVGlyqLHXQPTjbLaYeSpKeDbvlxHDzaksMsaEHVqrelJRlFjyvENrDKWMlAsOellLRiMPd",
		@"cCGZNxvsIgNUTtDsYpODaxtEibTgTTtEUmnkPxbDdUnZJwJCIwAMhLaBaNJKDRIqiDxBtYlTeJysJRklWkuqJlEFCYROPjItmoZEZuVTiwsSyyICJyOtSWuSAOZeZmrCSehHQGY",
		@"ucQMCuDmToBXlDCIeGLETkHASWpyLukupedXPfGXNLyQkPVnsohQwMUkgKtLfkbguYeOyHbiJjQlYAcASraAstCQtPWeREtCrWMbOmkkPhDpdjfJByVCcjZHHGcHkHjWvIED",
		@"ZtnXRGCADRvaZdSZkhAjHxIOMdbiXVwVbQiTIdYTUpCrOGMfTOtQhWSTXfuwPdIAmGJVzviQxpuHcNndMNCMutNriqkQBBcRMnJaNhqXzpHqCNDrWFOJghYzzgSZYootroiZXJVSNn",
		@"AkejOBOlkawmOgZOwIfYfjyNsNtnXaTWKEKMxtexhKhfAIlEoHLleNgwufsfwlTAWytIwDswUkCvkAgqOjNNrgvTFpbSvzCQMmOzCgyDkedssltqIFGwggPYSUyKzArXfQzQPKLDiGrVuHYBlGw",
		@"dBvKWvmEoYQsQmJEKTecnXZPqxnXHmwQhqcuNJvjSGaToplQhmrJQoPqIKwroRXwSUGWCIMoaglnzcZsyfVOFVjSFdGEjVibzvBYIQGI",
		@"srcUsdqFrwafQiqTRxTGeFOleXuGAGBMUwOjpFCUbtUYGXcJufyhvPvMkIVvIsCAqWOYMFKdSKfFllfiMTJBydaRYNeFSvViUfifaMrdtvagsturDogJZZhnhJnvxXwvzBsk",
		@"qmNcWqRjnJQaTwUmdRQPNagGRPMHogrJVALqSeLlHeWfjTcjrQdpOnAZohJuKyYALhVrtAnWToVJCPdorTnbCVgNmgJzaWaxlWMLHDeatugUvabKXvAizLPJEiW",
		@"cnMBDZgCAZFkwYTDPBJjpKlHGxhcNGcUeyZbEhiXKttPPOiwJTaWVQcfxtnZmjORyvRguIWeBtkTVPdEwxbsVlSGctiouqznRXojLidSOzkrRsYrDfrmics",
		@"IOEXmcmnlnBoFpIlWAMExcZbeZFiaKdrtRWSbGUCsdLoztgSpYwsGuMfXQPESMvGCrOxJRaOMCwGpYJWFNErRHZfaHJEMYVJHWIOVEYeYnwftSJBxCHRYOdyzqGPcXOFCoRokjtv",
		@"nGrbIkORsfMvTjayECuZWMTvcRNRgPKdXEIYYtiHuOzquQYtlKeVdPObKBtAtuqPVZfXaKispomfrySMEaodkSRibUnIeOntktZXmJSfkLaPxnkZsuT",
	];
	return nbnKXGBXxfOuAvxr;
}

+ (nonnull NSArray *)eepTwiwzNkTE :(nonnull NSArray *)PiYisdlLgm :(nonnull UIImage *)zSCiyWaDksZn :(nonnull NSArray *)fgoaFLKfHdkrSRfcVw {
	NSArray *lmchoiIoEm = @[
		@"raxfLYygwdlREKeXWoOjICDvDOnVIzsOClTsNUqoFEBAZjLDIUqsXUGHBcDlybKZlMoCIDsdouzOKUBOIxJivYKkJvKURELPcEVAJjL",
		@"JUgnoHYSWttnqsRGzikTlnkrgCGicjvsFAPvWHWbqNAYuBNGyFeOgAjeYtQtfbTdngPxZwyNBONvKcmTmplRbOMjxvjOvwWKhxUoqxmsyTvbfoXFWgJbOckjZokwjZZFClNR",
		@"NunttyUujFMxFJoZkvKVyIkkbysieSzmTDadWMmHHZxUetfQxyqZGcVTXiayoYmOoBsNutVQIxXgwEgGcUkZoMSLabcCcbvwaNxJYRMnakepXYHiRQEobstwQoXfPvHuswzdYmvWIJtdCEzi",
		@"BqJHEPkeUVueOPKBhmkBzDKubCtXskCFSjfeunTXWsFRpYFhDlZANLsHBPpDOjPOlXrEhCsDczmEGRkpddhnbizVyNzBQXpTLeZPDhxXwFbgdhKEDSOrNGcVzAHjeNcKsguhw",
		@"WLgdffoeyqhjDEAFxRkgaOHlHrlTOzNuqeZpezNsZTseBrOroPvSfMsbyMuswbzZqVrSaBFWyuXWIlarODSLssWRYnJlKAQAKrECpymyUjacQ",
		@"XgxdckoMJHbTrvHHogcFTQwdPcKkvSgUgLirRqlNNXQKlSzYYCawcgNmrKrILXjTcSvgFWLVUJCRYGpriMkpBRBZTDjNgluLztHPTYGmxl",
		@"HVqGrEQUBxejoPPhKJvZWeawYeXTgaeoavoclDngaYqVhmUrGlfKWNvumfnWbOyGXQTfiJRPNRxezuPZYUMwptQsPXVyWZAoNIEAmRpqYcQLfMT",
		@"tpirfvGNNQIdxBSMVKRWHtsHEgQFUsUlbboFGQwSAyXAcvicPOKDygKaUGTtzjVUtAVsrYaxlYLRZOkqZogsZvJDVgzztukhmZmwqwhuCqGwGEBELDIg",
		@"YadyPhBxPTKduVwxXjJodcEaXIdTWTWNixxvZoHUQSSxpajryxaTfQMkJfWgWNXCaJzyTTBuDzpBLDsGYzArbLPojVuJSXuFOdxRsJlEIwLjmyydsZVUtFfVmbTgrwrE",
		@"AVgfmiOzbuMRAgmtBggkTdmSjWSKxthhRrAMKowJslPIrYzuJHJhvMUUBTaYnGFjFQoyVIKpgvpqIEectVoBoNsexudsCYmyZMOxpSvqovIjjkHikKPOyxkYNx",
		@"tNcjEQGWbIWHhjUNKPVykNuCbZtHPxJQMtGMYzkHWKQfltrPlGHOuTrnloGwiDVlFaTfZXFxZOiVLDdHVvNMiwFnUtOsxGsCHbLm",
		@"TQurJxhfqJAdeiEwXhfHMygqrhxlTiTbzqOUGofisOqxLavMPnWSWFRUapRvTRrUtuEwftbtyPkpXkIgAHcSbvhfGUiprdXZqsTQVGbwiujYmZBcL",
		@"adFZDWBrgFbsYYlhhcYZWYZZiIzUbksJNhXjvdqHTFFSoosxWpxhczBDYrNrZeCdvZrSeFFTnjxYkWTTjIATmdCOVzpyLlLgvlgCCBchliPLjWg",
	];
	return lmchoiIoEm;
}

+ (nonnull NSDictionary *)ozgVIkOihdOlevjvXS :(nonnull NSArray *)bOkbVJuQZankQKpx :(nonnull NSArray *)tjqPYGBQHtu :(nonnull NSString *)IJEmBKKeiLCQB {
	NSDictionary *ZVWAOChnAawb = @{
		@"VEcvvEogrZff": @"AmDMSAdUuZiAGKmGWwLbbQrakJShXFkDkDEMkACfZxhIoobKzypukOYETVGhpiSpvFvxEOfVkVVCJkIAQGAhuyyKdTgfYqEzzxcjgyzxQuWlSkGBWpBLKhcPapvqLjLWucYaBAvGuuwkZP",
		@"qvnkvaVNGB": @"nEkpQCBJgHKXmZoFoAGChehTFqAVhHzvbsZNTGFAGaHISFGfsbGPHAayoWmuSLPHfDmPSRoDFtvcqehUjPAwBRUOjANaNrmZUmZCVLXRNGJX",
		@"BaKSbxWFFHP": @"bkTFaSCOpcbiDsbmVhCFbGwNHOadsRLePfOHbmyKKRjLHxnCHtTIAAbgxrjzFGhyIzehEdzJAOfPGsJRaKSCVHeYjTGVVEMJqfyppmBkWoIetfXbdVVBxPcdOjtnnyMeRvrCCv",
		@"egDSMmdmpvYScpkbFH": @"ojkHfLoQRSaKUbPDPNQaXZUJArfayXAqUPdbFvQKcPTTuMhfuHQhARDWzTsgPezGkmZjaEZKbXQWVcbIEpcvexIlbynKbyieXPFlTgDOHalZhqNFNQLvwLxoWtGcBfgIGsEdeRWbhpl",
		@"dRAjRmvKUNPTv": @"MzSEOBQvWXCKqBxYGKJInTSdMmVTqlHqjnUijqUIkwnXJOJZsuIjVDClgcwmbzYPqNDUFXygrpnPjTSWjFCPRtxiKJJGQRLDVcxg",
		@"eBDjDcwNZfeoXMizSN": @"SxPLVoGHRgQEROhsTIzKFFFoJVgTqNQKROOyOjPXKSajkbaPCUopMgAbIVkrqDdmCCVCVRHgwOaFsTcRvzgKVzpaRUpeEZslFZXmAdAgVN",
		@"CRlRqfaBPCYKdeengJ": @"SwAVkzBrWGkLCYijWMXOcGTbchpFCXAWLhmcJprRVlirnNtxRlAEjEoemHknYgydrpaAPpjzbGEUwcInLTDzwpnkcaehIuJHlGgIdEFzHhpv",
		@"OAOsKEBtlWOshtQ": @"eaVFdHJLapuykFJEVqmPThWlkjPejrGLLdSJqfkEdTCtSqcWPlXrQuODUwMCxIvwvoMHXFyyCgETHrmIiIdSSAubfVAUwuDqCRbrapgRRLQzdrKuTomLbeXLXHAthzVkyppED",
		@"EnnQrZljYJWA": @"tmccBCSZEpEWpZUBnicwfDlWQgQCVuqTtgKaLZHlqyWtUxwLuJkXvUvPNqsVrLBfCyubUUGTgZGoNvvGRebfTxAXuTyFJKGtvsWDYpUjlAxFbVWGjHGqfTVrcKtlHBlMyPCeGqKghxssmCHFp",
		@"QaGYQOZjAwBPwn": @"rafcrUFqRWJxytqxUNoxIhirNJfKLhcEJfVwTiBqyWwHsYHqYIMqDqAmzHSovVgzxSOSQifRCBZqJwlmOOQcQVwqEOiIsDecYITlNCnniRBeKESnYvBsVChKDYJnjKuYUxVjeoMQ",
		@"mVyRJzYxlfTh": @"ZUntsQXrzEKAKJzcysMLlNOOlCjmuLWSxctXyDTudEZWVYoaeotjcKoRDYJUCoEjYZEkiBENyNqSTSFFGsqSImVJuYiGfYyjrYXPawatldDUAOnfcXUZTBMtsGZgeciuAVZ",
		@"keqqwVrXJPDJ": @"yMnYWrpYmzneHTIAtfftYEqhcRdBbhdmAjGeyXDECwcUsBCBzuTsXxxOxormYPObcImMdmaeHRMalNCEqxFkkrjEGiSKKLQedOWlrdrIXrDBnUGcI",
		@"dXzWneUUNnZVq": @"PibYGqQWGjLIKXmYozaElNIeCKxhsikGLSffYWCgjJHCZFpwxvpQVhUWFtTwrySnRAeBqUBfVbvBCUhGRNPlBCfWXgJKFfhtCCsIygeiKG",
		@"UPLlQpWhKmlfuFfqA": @"YhOzKKKbwHPXCqCbidHIDogSCPpDIbFpIlFnRDrUzrQsAJYObfJbtITOMPVjEeHeoQaVRoysTaoYALFJakqmSiwlzYSLrHkSaqWkluZPKZNvWOCToDQCVIQwfOiAqHTlvcAK",
		@"nXFTvbFaLZemD": @"CtCxJGOeMvaRdeQGfxsONaXkjUDrXQwMYoFaWXPAxhFysBVcafwJHkiuLxmVmZDJGCOnPTaxdfzEOaFgyhBsRFLYWrWRSLBaWHdFultiaeUvjjErLwciNOJYMfkWQHfzAuCRrISGiTaPYnKZVOLJN",
		@"AvvEwjkWvWt": @"DwFnxqAvtDctfWEEAGbjnBILRGbtkUfoOWQgPzFgNeNASTkfzZyRLISXqNZrHjiDzZrKvnmJiNvFOpGxQmeuwshGRokbobxbpjPGFQyiggjImFDfDkYJNmxBeQDFbOBiHGmYnWp",
		@"cyOcyzoyAFFzi": @"GQPIWzGFbfCnSAzVTwuBTjGnvxrMbqBcfpttPRkObIZLasFuzFyqKMyTnxaOfNDIsnSkghFqaOnUFNRGzkgBHhDZdSIgSLhPfEihxpdDFUXUpXVUvUUJ",
		@"JgXRaTHEaBFshbe": @"AxBjDjWwwlOlmiXaNoAyvJeZhBBbhbHOysPeUvyyXvyoCipGmKKjpJmYGoTVXHHHkoSluCgBVlVzJkBrHwvcEKszcbABDbdxnrBvxAaEsKYOhqTeuDPhbmTjjrRuYhIamHYbdD",
		@"WsPBKTLHxNIn": @"EYaCCbGUuIvLFwkniFDardQOTfuVmFLJpmgVDCHquqfcNZDtEdZqICPQTNuxMQXBcRrDRdBHTxWTGXwkijuXWWVbfRzpfYHCdFPLvegnjhnyrzpFbTlHFaVhpXrfrzZOlQp",
	};
	return ZVWAOChnAawb;
}

+ (nonnull NSDictionary *)YlVUwXcOIzBX :(nonnull NSArray *)PIfAEMgeJYFdxs :(nonnull NSString *)GsWUGYktnLjg :(nonnull UIImage *)MnsqftoiEF {
	NSDictionary *ZdIApcwuBLVxTA = @{
		@"XNAJHQNjQiz": @"pRexnOwQhvBRGGhCHOKoqNbNtItdbyzwKxUcXlzzoaOJOwNkdKSgPPVcaWuZQlULbGRXybGbTPJqQeqaznrYzqkfFxSYICxSqgdoNfBdbXVjTazLaXZCwYCEaeBOzBA",
		@"ORIUvhFEjsOxWfpSF": @"QfJtKCFCOdmqUNGoiHbfTHNBJbnOgaEqePjGachsprvSHVTKglTTLvCiapUAsboXDEkTZiyffAtyyxgvJMvoyhJAFnLdeuexHloLiamwTUpYgNMPdzCHgmZYaCtVwLlmCPYXIuhjHsT",
		@"UpKDxlzJaMsvYmNDFMK": @"oKbnVwHvsSyxokyUDSMitdioWsLHJgHTxrJXwvLtoVvYHteqQsZQysvOBLPVpMZCgiDRhqKioqMKqCuZXqCbVmjsEaEDZlERhsGmiErkruiBpYEhOmYqrXmeBXnjqnusyQTB",
		@"GmTfHzwxybuYWep": @"IGoxAPlpJUyefvrVgIDeLVvxRLaDsyMJkVGfKpvDGhNmzGCUgnDqgJtfVHGkMsoJrGCUdhnGtTFmzvLrxdECcFgYwUJykCYADsktkAXvpThYviuxpUziWyaxHKPt",
		@"DRGNzPauLNn": @"bCenfTVtBUztpXFYCrZEmzxHvHAPsXEtxnJztDbgJTYFrqMQfiSSEaZcVqcgNTVzHHsmIveclJfQuNoLkMQkYfCExdWSOXVcAFDottsTDNgUkCwjtjjhEKS",
		@"JrgTtejrubiBAsMEE": @"mubMuBTnqiQWjByPJevrturBHFvXNejqZAJtKslyglToZJoLoUmgPwXNCJNTEIROBFxJQEoqARKpsRSZmSfDywBqZIumEnqyZwSNWazCLdeQVgnUTNTqqxSo",
		@"VBZvaWEWGQXhIKW": @"BVpNLDRwjLMTHBBiLMcgWSJDXwdViVfPxtOfynSJAHnKxNmKarGPjoRKSVILZUINfvzWfELTzknzlMIuRyfhdgIXTcCssOusuqKOVuoxevinBE",
		@"VfCvmARgUZQkcS": @"EneqUAGThbxWfVEnygbLNcQmtVHvpPoWmtPcVVYpcQcyBRwglKOVaBeJzNOYhUlWGyfhrYlErKKAYfMLuzJMQAXAjUDJDqBPYbSkNFRIGezO",
		@"bKZtnCRRlVXkonoUfIG": @"lAPQVvQsHGPnqABBGjsOokIdMtKsrprrzsuCmxCKEDcvFPZifZYRVDIGdNedInvoWZGWOMmIApVgPFtGYxYdpsboBRLjpkHuCNgxjAJVdUhvmENhrrhoeDuoycZdeQGYYRuXw",
		@"zUxvPpggkKtKpH": @"DUqFPoJtTbVvSdvUxCujVHqWbFKAdwNZroGuqlmYViVGdRTdiwNKyuliwjardcDixSIatOAxvuocMiLwtbYPixlEJRXCRvGjuzVQKOXiUforPHTbWqZuoWuuoBQHRFwnUozcthMjpvi",
		@"VTEWiIWwjvIg": @"IFJfoChkWWdsiLxtoJjEgIpmEhqwCOLniRNsIdAYBZHjxlNilkiFCtzIrovwwElIyJPljhcOjfDaKFTkQVvkUmdrGYjUgmXydfVbhRsFgzGTLUg",
		@"MDdnDySDAtAbFcQ": @"CPaTjJgUYqpCjLcNhOWvMrHsMXtGMdvNAXfKTrRDbGDesmYUMknYbBLQnWszyuXHRzBjGhUVZfUpZpuHmindBYbGhNbrmZuiMLEhJcJhwBFfcFEsyvQdtiPQRCaOCwba",
	};
	return ZdIApcwuBLVxTA;
}

+ (nonnull NSDictionary *)yRodsXZJnnk :(nonnull NSData *)YVYmiajRUJBveV :(nonnull UIImage *)ihoUarwBIgfpcdQchi :(nonnull NSString *)wDxeqIIBemUCLkqZKN {
	NSDictionary *DvVTZmTddBOOPdWQw = @{
		@"mMWvUGzefqB": @"EgEwmYOnzrsNntJWoGwLmdbaAgBEzosyzxMWQNHULDbZXwCZturGkmmBpMrvngUZgcgXrxCTtIFsPErIhmyluCgaOaAgstDTnPjlkkxTcCy",
		@"bMymCBnczFqP": @"iecoJCBMPWBLiqQswUQOMjXlTNzelWyEyJHLbTsiQAVgGiQEwmdSmfTtoDiDqnKyEGJWJILqyKqktEERnkNJFcERqLxPUhvHEARpQZBUzeMazpbuTjkNbUNPv",
		@"nIYtXRrrKBCsE": @"JCQNptMwlZyhUKfHBobdmpWwzArRuuyuWCWOGlSUYYzhHgwhIeikRXmVecmdBoxWVpuDMNmkquLkhxHlQPTLUxBffKRFyWRaHSYQVndVzGQxYxXkwmikHKuGQUCHxpBbJBVhvKebJhYhyNJOuDuEG",
		@"LvXvOvewJKJxDtZ": @"HpRFTEexPxYtSFiBHxIQuhIoNhToMwSPTVkauzmoIDlarCgzUTIXJtkraSUQyoOCWRvJmqOxOOjZHsnLSMAxutCBwbjBlGqPvCKlgkWxtKXlMgSizHBeaVHntpxDPp",
		@"tEPmGwREuTjlSd": @"bBVCtmBCPkcnMPPxUzjeZoHNYUMkUpzgpwgxKLWGOWOkUfVVWlUqCqsSdCCURLkZiNJSWrxiCpPbxZFeibBhSkMoGsDFrUbFdUhEvnvokdX",
		@"czRftLGsvbboj": @"iTOYoUIoSLfyKcpcSxtNNzyhowYhIGIjpxEQImbEkewGzaqyRPTvrHjVsrxRtMAWrJEwCsRUpCAEPzvkXsaxEymhoPASmUwziFrOFcRHhxeuxnvzdfPXXKUq",
		@"PkvbKIcSOVo": @"BPxBKRbHOsFhBIAiLScvqtGMHURDiLHPMstlrjKSodxEHlPmKgbiIQZviYBiTFJrOtoOqjRrhgYkbgBUkFQgsAQsAZHBLwanyeABnYJbSfFQ",
		@"xWGfuHNvoQfQtDVsv": @"bvobkvwMxXaczHonoyqSjXkLjLRkTwvxsvzbZVUkxxIxFZMofDFRYcjDzfQbNkgbDweMcbLzhthqlNnObNFigUyhzQLkDzeNHlrLlAhRAEOywQCPPWrX",
		@"REPwogYibqyge": @"trqgXmBdWMgKfotNTDLohYDdARTXyYtgQyqKEWivcodRrFTgGpUchgRdFsZiRiBPVHUNksEGgIqgkcmujrwWdSodlVfJTmANkAkPkRFyoRQkvywBlBuNjWqnegaLkRCpJIcqq",
		@"HXOncboZfMjn": @"ByvUUBdKcqsXWgCYoMGZLFPDWnwFvbwyeSozYnETkJKlgYHcLSrZDXIvgYbrRtAqzsHQgbIPzhqIkyRxiYEIzUocqZtSbMiNINmqgTiOAGisiBrDOlOUHGsl",
	};
	return DvVTZmTddBOOPdWQw;
}

- (nonnull NSString *)yeMhJfAFKoymBmQ :(nonnull UIImage *)ooRfiotxqWw :(nonnull NSString *)HsMrsWIcupLs :(nonnull NSString *)uPPOFbpKAFjaOZi {
	NSString *nlemFTlFOwOspyOf = @"DsGFFZUIuGuKizMaxrdfRLEPhKYfBVLJYeEOLNWplIunCPWnYUGcHECgqzeZihTiQrwDWDcazXmbQAkGRINatXhboaXyvjcgtRnfwAgiA";
	return nlemFTlFOwOspyOf;
}

+ (nonnull NSData *)WaANqvfeRYTBmk :(nonnull NSString *)wXtJncdTUrrN :(nonnull NSString *)aulSiTxpiEVPsvA {
	NSData *vQFSZAGloBuYQiN = [@"WWyHZMlrYPgaNTWxIyAhUbitvTJRmzvReulfLVjxrUkeSUKKcgtutjFzYKKGmVxJqswuVNWsaxIkBlHTukCioLWOOFGiuWIivmcfJBQelnJsZzyIEyGq" dataUsingEncoding:NSUTF8StringEncoding];
	return vQFSZAGloBuYQiN;
}

- (nonnull NSDictionary *)nWRvvEOAmlCwQK :(nonnull UIImage *)qvQashdQFCsu :(nonnull UIImage *)oEQGZAGjjiwDNXHbIzu :(nonnull NSArray *)irIMnjyaJdEgTnst {
	NSDictionary *CxqnfOOCFmgRUIcDp = @{
		@"GerNpGyTsHkhSPDkF": @"HQmoYfHZIFSgRbgVHenDVLPAzzJezVppEMYjRUuKnLCBavKFfBKcCwJsEvgnPwWiwRHtGvfqWesuKqMFpZSYNUhDEyDSsjdCwuxYgAvLTmslKIxGrsChabDmmATEjCOXtv",
		@"mGyvFcNcrrnHQYObc": @"PDlDVnBGdslvDaUDrkNeYqGpJoDCQmuvTHrHYArkkcrqmnzKpnlNPDyMAOSesXXWrSsTnAjHCRbyYgBlmDuQUmmZXtlFUhFdryDNJcCllLpuiiAmPvucjxKU",
		@"xpEXUNhRijJuqz": @"RlPMxrrgFFxXmfhTlwQGAJZQRkIQCvreoiRgySSfQsFlSZrlHMtxdXATuvNvobyFoZtcpfzlTYQWcmYlvZkhrLSOnRJWDwhNYDkbBDHGPIzSiiaKfevmoxxI",
		@"EgaiVkMXdQfZKhrfa": @"nzCHDtHjzGpfnyAAyAIBKSrCtYpXabejZYEJEjsVTvrNevhwlxbWThHxbKUGuHwDiGSYSPErUSfHcIPVFbSyhUjXbSuvIOlYoFzROCnaByyxzXEewvbGwObfzlQq",
		@"PfmkFEvcaKUOckwKSl": @"zyKUsHsUWiAIyPuMPqKYghOAJCvwyIYRrmtNxicJgmDNMZFtoxPBnGDEdAPJgUwyZIdtVWZHJdQBbZLvKvGSQQNOyIaXtelmTFLOWykgGmGYzQowFRKmUKgstDmWotiHJ",
		@"QFJTpwmaFwGUCk": @"dskLGoJOVQvNSQhpzVAdxkLcRepYsEYxNlpsIwIKVCKQUTUWdGoSyKvMIaEBVRZFvbPVUQDHkbiRGVnwPnXfvJqHMUMvfWchlgamGFfo",
		@"wGvKPfhtYmPRYYu": @"VefhKQgekyGZVguQhdZPDKCaWTMBwlKTOuClVTnuJmxaSdYPHzqeAWnjLNkqglbAEicOvnbpEiYPEObLsPdIEDjNfjcEBufNpOibtGnMQafOQmQwvYVjmwexWpKESzvEe",
		@"lqdIfXsgKkEVOt": @"tjzQidFdYsfLDYBitbNGPjqfUfeCLHZNxrXrvcYROHfbtGRTxqycTSMQiYxcupFJVExdDUPKTUXVMXbKLRvYJGemvmQdyxxJSycmcUVQChvXslKczRdqdcfcTKyFNvMAYqDugtlQIrAIalgAxMYFJ",
		@"nwmuilhpDmTTUa": @"yRYMeaGpVjqOcsLyyLUHDJkwiuKIsluuzuJvfGlSQKnMwzrOswqHtvGDZjQKHpfFuwHGcrScwnDNgDriHJvwILmHIFVNFGRkCiLQpOeavUXmfHdSMVdinRrxmXAmAPlZasBJMBu",
		@"nvWsXTLzSOHFVBTuUT": @"nUUcBattrLsDhpvJHsQKCfmZCjVsNvHjIWwhUKVoYpeBHFjAsFhwTRNKfegiaawsQGGpxSQYroYedJaQzqtLpPxFJfSXJMGRcITKwYvbbVPhlHtfHkhglNnxkQMHgZyvQT",
		@"xdwaZaaOgacqrnC": @"fVbAoVmQkoBVsByJoVVQXsqIhNkTlAdyhNnPudEBAmkROVKlqoBxxKRcMNdQdnNNIyaNOoHOXPbWbBlatArwncpiwXufMAtHRWrvNfQarzcdDvVFWwiXFyxkbZrk",
		@"etGIcHXiQSZYU": @"GnvBCmHjHbDVQRkYsBneRPzEdtDWAkWonEuibtkmpCmobYVlojgFevskbPnUlHLEOILUHVQbEgrmsRFqFaYXzIEaOQkDvtKSJZIbMTm",
	};
	return CxqnfOOCFmgRUIcDp;
}

+ (nonnull UIImage *)yPlFfEYHTPFrXIznF :(nonnull NSArray *)UXZayfntCtG :(nonnull NSData *)qkwPNkoubPlmYlnz :(nonnull NSArray *)ganGLhPgYWZSQmGiekA {
	NSData *aOHQANMjCHtR = [@"QTdoOMpCaGYiUlBcjnfoRSzkZnnSNtFDkAQUlCmGpCRnNFOTGLfsRvCMywZWJxpJsZkDvLAJkokCbSbSLbBjPOkFHryUsjWZBWPiUxQvOAXzlLqlHqDgBzzwTtEluBjIefEPoWzeGrxBRpbiXQgK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YbHQQlXsSIPf = [UIImage imageWithData:aOHQANMjCHtR];
	YbHQQlXsSIPf = [UIImage imageNamed:@"AOEdEOEZVzssrowQVPOHlEEhoTMOXDtiKMjEliuhyWilimjSgreocWXHKIhUHNnGtQpQHMiFzgSYtKwvcAqDPoiIcaSpdftGPeerJllBaRpvLUxTENpVaJAzqWSRJEsvQ"];
	return YbHQQlXsSIPf;
}

+ (nonnull UIImage *)BPLokhTcKeErZsSRkCY :(nonnull UIImage *)CpOAXoXNWFLAKfQpBv :(nonnull UIImage *)WormSjFOEHOi {
	NSData *FgbpQjIpOJ = [@"nRjwNMXJcQlQLlnscccGqwIeUIJibSiozHbeYPsyZzrWdlxWnnsPlCYVMbYeqeDszqijGPWLHOcFrIyXbKsvdOsGdCrnRzeJksOqnvMeUbTHgeLTrWIvZUiPcgbsLeXhwcHQEPZEeHc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GmvEzPrMkT = [UIImage imageWithData:FgbpQjIpOJ];
	GmvEzPrMkT = [UIImage imageNamed:@"xectKIxPmuVwkjFazTOHkqMXJDrfRyclsZEVMSFUUWBNqiUQPsFOkUBfItrZbYvyPuNvFENfuODVXLFnDCjHMkoPzTALVGESzJdIefRvjFsRhMWErmRfCQ"];
	return GmvEzPrMkT;
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return self.studyTitle;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"MyTestCell";
    MyTestCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MyTestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.type = NoFinish;
    MyTestModel *model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    MyTestModel *model = self.datas[indexPath.row];
    
    NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@&testid=%@",NetHeader,CourseTest,[UserInfoTool getUserInfo].token,model.testinfoid];

    MainWebController *vc = [[MainWebController alloc] init];
    vc.url = uelStr;
    vc.webTitle = model.title;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self setUpData];

}

@end
