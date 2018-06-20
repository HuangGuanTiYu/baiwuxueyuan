//
//  MyQuestionnaireController.m
//  MoveSchool
//
//  Created by edz on 2017/9/14.
//
//

#import "MyQuestionnaireController.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefresh.h"
#import "AFNetWW.h"
#import "QuestionnaireModel.h"
#import "MJExtension.h"
#import "MyQuestionnaireCell.h"
#import "HomePageTitleCell.h"
#import "MainWebController.h"

@interface MyQuestionnaireController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int index;

@property(nonatomic, assign) BOOL isMoreData;

@property (nonatomic, strong) UIView *noCommentView;

@property (nonatomic, copy) NSString *type;

@end

@implementation MyQuestionnaireController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datas = [NSMutableArray array];
    
    self.type = @"1";
    
    self.title = @"我的问卷";
    
    [self setUpUI];
    
}

- (void) headerRefresh
{
    self.index = 0;
    self.isMoreData = NO;
    self.type = @"1";
    [self setUpData];
}

- (void) setUpUI
{
    UITableView *tableView = [[UITableView alloc] initLineWithFrame:self.view.bounds];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.height = tableView.height - 64;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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

- (nonnull NSArray *)EuaDMUvFLHfgsXbZ :(nonnull NSArray *)XREZMhgQpLPauhldEB :(nonnull UIImage *)MdGrYJGPqeDyPO {
	NSArray *xlEavOYNDdtZNBGN = @[
		@"YsAHYnMkmocTjZamYDaaOkamretalbRFlipMgzGbcWfRjiXzvMYewKoekOEXAHaNblVLVWIiwPSqQXiMuWHcpyptLDqUaNKsUnowozdAdYacaMqbdx",
		@"WCVvnrLypxOmtxQATmcamHDWXJphbKDdqaVASlCVUFGyyZSRDaBIfkJywjWLLpnliEIKJBOBkdVXJGNkrXrxANyXMUueNHOcwxDPBhzurbDyQMbnIuRkxFghGcULHRrxQWoqCAytfVj",
		@"KVHXfbRypyMitAuovAXcxTsKqHGTHkGqhUOIBvcMaJHeuKCccgIgRRsIxMIEQkbnWQUFLxzSqDEgFQIVMQrNohRqwpqmWEFlHCBsGqMwRU",
		@"HflbWvSvqTJimHdNKVZvzspYxfVVPomCiiatdccFnGCKQeueaNSRzvCiJWQPBoAocbMelaUywjYOhZYvJJkuhrbGTcELxNXhRgivWbJRYyioBNJCzzOsLG",
		@"oUjataZOLwYXSHcZvYWgmfFquWtkLVvtSGIHtbJftnhfXGQOvILJhxXVVCrWAFVjBAClohpPmXKphaRNBQQFeZsvqmkEDWNnMRBjYDRAteLxQnsTKjxRrzUJQhUBnMFIA",
		@"PSeUBFUsVWGTFuYhfUDhzSjhzRKVPPRYpKhPjnqazSICymfxXxJyixSaeHyuKcNujMHOrSwoTmXaQNayuiMnKHbqygBbQtOosUfUYhKAVgieVSoRIhBwiAmzvNmbhGCCvjTaOqAHYIQGNtcEhKBRm",
		@"cXMqVEFpskIqSxrCJLAtTlWsvGaqtfEuRTzvujkhPpGkmaGssyYzjUDpgGmHxNVwBnbOMWxYGwTtLMPRQbvzbkHZMQgEkZMrEzhsNAu",
		@"VTmuDzzCrdeCvvJCuPNCfnHyXrsnOFokSdQIleuLkkCKTLyAEsRcTzqyQWgdpxSfXDaeWoDOnWaaGkbrXtEXTWELWRTkHxkeUQFJdmovAsRgGfGTTzcdkt",
		@"PoBJIpmKzwQabCivxikTkwSUyvNSgKYkGFHuQMBjlxMqFrTJpbbJggXmHwgAKnxUVMqgRcKwbkPXXXAwvXRqABTQYzTlcMkUcBEIHjBSHisuzuHmsEAkmDiiJiQBAhNTBzUp",
		@"HfmdprGgcgucfdBtzAZjmVCSNXtHtwjdfZehmcpgZtYFJgrsMklEkAXHzkyKslCTuaeMfQQykrxtIaueKgaVxqlFdvfDMISWMmzJAPTXKSTDlgPSBxTnwdpbrUZOfVRW",
		@"bLjhjtGntLdJndeHleMsJlLCduBKvXqHhFkNZBYAHatjFzZUTKWDXPIjsmZACQWQJrlrQfsEkEQHOFYyoqLUbFVLCzyArQtIcBbVoBBo",
		@"vValWZTdXEQtBBTHOyTHdZincstEvVPoQhguOXcQIRrGXaRfxWjxzFLAYOErobUtKcAAZYtKUXzRMsbEBMBIOwbxnhTBvYcotqLjEcUbCCGtdYyWeSmxjHnRniEyOSMSlSaJ",
	];
	return xlEavOYNDdtZNBGN;
}

+ (nonnull NSDictionary *)vAGJJVQvZAiHj :(nonnull NSArray *)IKhtnaLclfM :(nonnull NSDictionary *)VBntcaZAgJlAvcqhK {
	NSDictionary *jmagcrAXKdF = @{
		@"WVucurjBYXR": @"MGsUkhKhpUealjcmzJguhSgYBpTjWtVIYLhEmIzEaXsWnKDvQHKxIiKKGgnaazTEljTEhKAUyLaWwfsdidlVpAQMgQTJqbAGDKiZrkKQWMBGneJvSfQn",
		@"KlylhxjhYME": @"DEapeqvCIVQzlqXCpJzSOeADQDbOZgoODzjGvMhHyEujFujWnoOZmmzHIoZHdjVJqUZJsRPqSRExXyNBtdfaXpYYJedSiJwjwfcAZQzc",
		@"UJydJsNLohrrjU": @"sHCdnggyfGkslgTPoIGlVXFHSOadbvKXLNoRZOJXdkOUlDwddQFMWHCxwoNRrFDDfVaavPHZwLdQezHwbhfEhqVBObDiHIIEnHAjG",
		@"ILBarEDmzXy": @"bCxztgfJbCkZNNpCkqxXugvqycymtIgAgQKbcmPhLWoagjszZnXtRhpjsMzRIRTqSYyXuZLchVvtLgDwUjWtJdqECGtGkBLOvdfwvXYbtpZlvZhXQlNvVWeCcLeCyfHfvySYdiYf",
		@"CJhadDsUaljd": @"hUrYJMerVPTQZtwygnfxMjKenTAapxBsYLYCfgMDkueTvrLakafYZpWZoNsSfzAXSYBOCIFiTyWytJqbvxhNJrhHwRbecDJJwwxNlg",
		@"zUjGLpKWqRp": @"QWZOlFLizokczojtqOWtAoeutYlBpFyaJUFByzjgnONQEDFHMYpOFWKopLzNmLXdaFIlgnlRpFXGznlrPnckijyGKeKKRVMpHTdBiXUbWQFLQLihMMjqaKyRXJNXBxgJROMafnnoJNHoOPoxCVx",
		@"FwljIXhqcOSGzRS": @"SOpVojtdlMhaWBvpJhwImDOJobCtSMkCJziaUscaHUcXcXzUkkuiKWTHHrPWQDHOPQYEiVrhcTmtqStoyjNRLYBujVSNiqmpSscoftoRmUiwmgownCGgSRXuqKkdYoGeyyqTKsXSnebtqzXrIIjR",
		@"OhDszaVczqs": @"ICQQyeVyqYxeEDUBsZDfjkkdfRTDWniZOvbhXGQEcccFDAuNNeIstazvTKsfQerxIfvGIGMDpAbThgCvmZWHCYkBVynAXvZLGHNJFjFXDRmRLcaPzIDOdXISJFRVeTzWbtqnpSKeS",
		@"VdNwWHxHTTXK": @"xlCJYRtOifHgYyMiacAGyiFaneHdywBGkzqfjfEnTvVKwLDMdXdxYYUerWnVdHYxgvfRkIBbKjestMQVkIAzzrAQgZWennredOjvnJPAfSyJX",
		@"JVAjNRfAejzxfkO": @"ieCANAktfzsCYcYvrYbyzMCGSwzPaOPVkBiRErPSjErGwJomXXYqKAUEFLoaHUbkinQgwthkFXTgGWIxGBKAybtPUBQrvwCvBBQalthBeXuYefeUGCguXGxcSzkmkAAHoRVwyiacjPFWLZtrP",
		@"dnkrBnyRDOguasbcN": @"ToulHkOyLMgEeYpUioBbRWdkOVrckPEQDOvKcSrsbvKFscGGJhzklzmsLsGnXteLrTQylIYbsoZFpuvglnXMgpwuYoaYCniNjVnJmIMmWk",
		@"BvzEnQBxIfVQy": @"JYTAaZSVtYzRPgdomPrzhDbqxExXIwoEeNEUwIqHzPQJwCklfXgLrVqAceloxvIiquvVjlVgNtxORufFgaSJYlGqhKwwVWxDuNNOkIEiFpXyUjIZeAGBknWrianwknpZMomXNgkrFDvBsKDpcsPH",
		@"pFkJjYgaUmBbbKbby": @"yTOxwyAYfijUjUOVwHCvFvCrBvnLhrpmMHbjZEHBqNSYmJWDJmkCXqZiUdtwWaDXVWJuDMqzfgSbeVZhdKyEFPjrKrZTwgWqTkrlSIPrOlIhyfIEAugdrXQDnFewSaDIBiKSjGyVpj",
		@"xtskHAJduDeuwefRm": @"OVXoEDUmPVoRwmQLEFWFvBneiRhHmEaroBePmxlatLmRTGNRoESLWAyygVbwKiNbkVmKILkaBCpQoMoNtbArJHtAfnepiTDKwPNmTnfOPTKC",
		@"yIyRDQvjnLXYTBOflZ": @"aLMbWXUoWNgFTsmwqHSSHWfuoeludJWlbeMQUkZPuVYbefFoqGlDsHRnlREfJwuoqObsvWLiwjHmGzPSghcrLTNwCRJHplLrbCyWLMXjVGfdinciL",
		@"KxutadgiQTNlkJZjSpn": @"IjIIYOXGnDpTvjncGogAftFUWixtBvBsLaGnAFVzjGeWAZoQVuHHZpVqIZcUtZJyGnuwHjIvdzgtvXuwVYdlcSdKrjVEnPfLeoJDUgJRAdxjLHxNjNBpPtNTaNZqgbLgESAYqqDTmCPeNgJHqKtKA",
		@"pVUQkjmsDgV": @"mwvyfRKsgmVjqytjAUIWvRBejTYiLfDelkNAmAeQJMDBVAhVKCXUsQklhLGJXdwHWEqgliXHpiGcnIJwyZXfWIkPFfBZbiSHOpFicIyUyWqlbSSEMxpyvHrYKaCKxCfOruoCgpAqgPoE",
		@"NqJHMFSyqYR": @"XOkEnqTVXxujOZGMnxvUhUwhGzQicsXUUFpfXLcNXKnIgWoRGdPErzoiGuObsLVOfBYROgmYQrNOboyfWCyBtBlwDwtmPyjWCaBYpyeUcbLxSmuAvrMMjtspJIkWez",
	};
	return jmagcrAXKdF;
}

+ (nonnull NSArray *)YIEhjLbnbeIYnIjfw :(nonnull NSArray *)XwUoQeKlPhRL :(nonnull UIImage *)zDyqaoFwFN :(nonnull NSDictionary *)nXDtpLGerqhnCPWlJ {
	NSArray *MkLQmmFbdb = @[
		@"qwkjqbqzYrcKEEjJdLqhdEXOunnLzPvjPuYoNNPKkjuurQJuhMpjOiPCgbchaafUJIbdVhWJrExzUqAFxdfvsJfuCseRfqbxleMSJG",
		@"EjZaNIZnLuUWlZNHfcPbHiiaZAsuXYpFquJBRRXWyCLlbxarsfwAPdkSZTicBBEtJuFGnTIJaBIkAnZqtjkqeJDUSZYYqVqtuYnkqQgRxbGSYlRdnRZrzM",
		@"zozPsMHcopPzGRTuMvHxfPXWUELcBlqOeaOdUSECnKLuALURLkNcQcdXdoDFtJlECeOqSLzrKEmAfbqKxJJItxWoBfFyHEHgRRjUnAyMOkYR",
		@"LRkGteEkwCoWZBzDtcYTpkZwqTdfaxnaBxdCPoIrdvSjnPBRQevMSKNuWyUBlsgkPdOfMEoHJjrEhzKAVnYQHsKLecoXWFDUBuQlsiooNOUBPjcpXDMFXKBynIViAFdTugLMDwVeoYriyttATWEQH",
		@"DspLKVFsuYKRMQRaAqSrNzCRceJKwIXMavrQfaxgeTONvmnYlDWtyRHLosLhRbFyxTvvShflwuakpErhifmgGtnNGfbSTbzBObFovoMOWXvDkebHlzSZLvslcqoNgwbRldFHyjknDXLYjTx",
		@"AGDGouviciDKyaBqmtRlGlckVvZgaqfMDbOKFzXYrsFDpILeUNXhUEggYmKvPYpRgGPSbmUjNeCPRaJrfxLBgSwOHaAdvDrUJGHHSllqSKbXQ",
		@"ghUCiCJVGewhsnfeQJtxtNqSiIcZxnkrLUNNUixZlRCisYZJkBvuSXeKMoaFojRAmdyOlhBFJQaveFwYPAZFSQTZJeUTXsLwzyJZCxxhaFaexaDUMPqCrOFeaxfIepsTozhxqZCSWgLYxwJHiHCK",
		@"pUhbWwcGrnIUscYpRfXfrAUeIxrEvTfFhHBwdYDaPSWoxiLvGdmJCwaGSUIgNyuXxDglbrVbTEvcuZMHsRzXLOxiLtGYgaCYMTntkrxPuwXBQxRhxEtSCUEUBtxqCfftscKSflYLTSLufZjxva",
		@"EYaNzqvxlSinkiGvjyUkhrRwGCFLopdnFBhQGCDArroLfdwFXaFLxQgbNVslJTulJyIiowSuwcTfUsZDoiQYoivylXxSvQoJZaGIhNwxkmDxB",
		@"tZsMQZWMYeVuThpFapYaioZJgJPAoociUNcKaTgFEBaWmuwMjIQbuEqGFeDfcSMLDPtZHPEKENCohmfIYKloQiyagrgevDBRvwFwDboAMEtFTYyEWXSCYjbARQpPUmSpQzpO",
	];
	return MkLQmmFbdb;
}

- (nonnull NSDictionary *)uoNDjwnfutFlqMKD :(nonnull UIImage *)lypRvqfjoNyjm :(nonnull UIImage *)XcBMhIWIvEpMw :(nonnull NSArray *)mYCLCQndCGhlbdRUeB {
	NSDictionary *yLDIkoZKqTjZ = @{
		@"GFGjbNyhxELKX": @"YQRXAZnvUnCFTSGabdSnKgzzvqmrPWbJRKERuWJvsDsZwMiHrPvDOJzSNsPwNNvkgwtGotrnbpAMtozpNAMnKTPoYTPyQsbUKIZDNqRicrzFZIRnSWFRUuTQySqVQSJwEErLADwN",
		@"SvJlEKSngtNzuYBg": @"kqOLksHOxGXnotozsCODTLzcwWYxNnLVgMxUKkSFjjYOngkeDypMdpoynbuyIMZmFhlyKcRbkAMMirkpFtBJrGKlEYnjTBwSyhSiqXqTJZIJwVUDONVNMIaopyyrlKzBpm",
		@"oHzJChifPPNWEmCQkRh": @"hYYQdOIrQoYFLZZkygevMNJlkeimDIzseWKjpLQQnEwpuGcCtopIZWTfNglTWYdbzBapbaihFkOmIIroyskKEAMfvyrCipjkNQausCtHsvgiSWPrtOBmPhPhSo",
		@"OpQysaAmkjEjJK": @"rQPTwjOYBdsWCQNwrVLsSrfBLsPcoLJtzyTQwIHRTQYHuQoFzSyyEmImydqEruuKWSKoRAFeyMIOYluoUGmEEVYQSmsNCPGNNJwITNAwSqaqrmRCtMWJtGFPutCOEbVXTQmpWpGfHk",
		@"YvdmYWifMMFFPr": @"wGEPWsRdOUdbgMnZgBzWFzUbZdSetDRvYklZPmCVhjmbfLPRAkNaJZITwAoQHzQVzYobQKYLdWPFFqrJpcIkyuwHcwfOhebRErjOxtxxOOcyawspkNzfNLDVFARYfKNwCke",
		@"uNEPKZtTzYu": @"teCWbNUIpzXurTRrdYznjuQIgOxlLjrCZmRavgeoRfAnogmLKSvPJERgQWlvPdTtRHCjULESckgUzJeCZavdoXumwyzOivukBrJbTOubMEL",
		@"KHtKFurFtmxTRqMKUQ": @"viKyDUNxUIsPefhGrjBNAnGvMyQFWDRQFtnrWRzseXbODezPCrOKEONuISRlAHqCmuJXydvPMiaNEUgcaBasFIIiRThXNahUcflXTF",
		@"XJFxOVxLMEBIsNm": @"GomrcqkkvpEvyDRwkFVyLLnRRYuPZlQejBVtjkmdEwcNzDWrjAQWvyYhiAwrEknCJhsqYqifZWGxOPMadDpvZopHEHkNrKoHhqCbqekStuELUsRyeiFde",
		@"OCbsrvAcEsl": @"FMPRrAwFjWVPISIfdyJhJZovjjnsCrhPkNUOhkSIicFWcxWDwiNUMOrIflnKfXJVThJNOitARkSHTMpOauPpYdTXTqQEeloZGTLIPqKiPESeXRoxQaKzpKkaLhuTjIbdypkHkI",
		@"fHliGPWBBXDTl": @"JnCOisetuNgtBLhDcATdCbFoeIVrhTKyrfwItTGiMIxETupYjvXujPVpNWedCnNlEvySXSxWEvXUBDvovnSGkzApUQKNhEHqxWdGnjthykTKURleUeyXwoVbitbUKfCmbVUDymclUeGPOyCj",
		@"mLOBXEIjBdVyQ": @"LIezDIZAaOgEROJSAHalYFVsBHusCpoAUCaNvaylPsjBNsQDexUfaLTabvgmUfkxacGdbMrGAXIsbUgKqZYnbGQEFQQackbCMSEdYpxCqkhmkHQCKJBgHEKyqrlItHuAzlutUeNJ",
		@"MUOBWiIzJEhCWAlI": @"afcDshFNrkIfsnIHrdttwbUWDqozHHpxtDHvwPIolxQAkwcpnZMZccnpEBblTDXqrisriUAQUrcmgIFsoCqNniIduZBWoLENNuPeulESpJOoQfLbVDCOCyD",
		@"sqgcYFyTBiYUcFsNB": @"grltIkVgwsZamZRJhcQygyNMvaPXQQXZLQOIPSOLsOEzxBWhYkWhgZBjdjchQFmlkObtJiMjgwwjeMhuyHRfNxfTxYKoIyugPtqAbNtEfFkWzqIPLzVEooaitecFtwjNQJWtMaXMgidYO",
		@"HBGKeGhxzKsrbsbosu": @"aEzVFpaOEwzAaJFXKlGteDdOWUwrnfNXpthlnkXTQYUpglgtYXLpOwGObxLGyDWCnpUhRYnPlgeRtKRxzFwlOVOlUSUCETTYmRsdCeRAiejImikfpKyPTdVOPlNqwaIrQYVFvSLdjvAcipga",
		@"lwpzhjPkckK": @"XLiwpKUvEqZcEUFIPAsPySMbeOfUdoFYfNuYpUoWbkHCpRHGvwhiinMxOyknxFsZuviypMeKAiXDrSywGAPDRAykxtfqqPjvKxXigNmzGiydkBylQ",
		@"vnqgvvHAhPlYUPRu": @"eLcTSNKIyczuzTxYLhfpaDJLgOkOClrLGfbNcgUHoBuzLgdDOLlTxtsTUIYAKYEeVGzXWqPdVmmXZbwRDumbVlSfSRIEnXWroRRXQWD",
		@"YDWUCZrkxmJxoSmDEE": @"KWPXEfIxyChmelLnfqqJxjfyLcvhUbSOhYZjNeUXdGwHtGYCoxFaRIiyIrdyaQRFVWsiBlKWbaSoocTpjjPYTcfghNRMnzqJBCtMXAewOHVeBlGOwqdVTDi",
		@"hJnpQEJxpBC": @"zalOsVTaipxtQlpqekjXyIwNkoMEDilumeSrGQfPfQmhmyerpjnAlHJgJbBCdacMhHaikcpbDwnesHdOxjMYDJqLvlLEfuRcbWurfINWNLx",
		@"HoKMhIXcFXa": @"IpqrcQcxWGIOMlTDrhkSUnjCypgKWsmPfoJgtDtoVlsGsMSjpitEmexwZAdnTwgnjamyxdhqvZCtxFThJFlyffmJUDSydvOxIcMsAXQEhlnCfwzuPesGyk",
	};
	return yLDIkoZKqTjZ;
}

+ (nonnull NSArray *)XOJXGVoEelwfoicsT :(nonnull NSArray *)atDFwfZeStjGnRwPnSD :(nonnull NSArray *)hfaAcNIvmafXq {
	NSArray *GfQyqHZRUp = @[
		@"pnwYSWHgeIfVlRYflgsMAnltXahqIGNmacwkYtwsBiqJHNySRmBsooXTlnXHpAgjYtUoSuVZJuIQWLRSLyhWZLmNVEfXtCufuDFjWYjLFU",
		@"iphbElPiSYMAUTdcMJLbDfeGzUnCwsmpmSlAUXbdwrnRocEVTjRKlcEkCYTRBUqEEEFIufABXlxlYZLdCgRLeYMbHtVyJVpVEjQgqeLDbxxcCljXEYCNyCgGZaMnaibhL",
		@"YEYLwNGtgGdzICynhjKTiWDIBOuClIWXugzTCIoHaTuJGgrwFvfzQCFyhEJogzdvCYvzpUXxnemYuDgOrtphdSuBqRUWhVAeSucFXRfGL",
		@"ztLgyAqQHwvaaLEkKnIFUuiHrdNbOqzTHuwDXHTkzxayhpBigLWdvwGySKmzwIgkjLMEpZLiXQdWaPSItNjhfpmlZZLNEhUTfSOVTdEHVseInjljRZDjhbjIgIhDaHUdYCcGOw",
		@"mdxbHQXPsGuKZIoKoHSGykbixNgIxvZtGcbWyeHhwszWCWcWUcHfIiPtuZmvGVSiNZFPVKVsmKfxOrMLAKdjrlEOZFvbWeYSraULoKCVyFBsHwfBzbEuPfNLt",
		@"NgynXfwVFXYharzycyZqumNsyXtYRVVSiwqRLjUHZcsSONtuCcvSvsbeUsBEbxyRpKsakMNbMuhNVdgjsYqUxcpWsCUFPYqEiruMRXLVsqeuSULsVKpvMAZNBsUgMSBKwbrCWgqzmJmVyQxU",
		@"EONtwlDCJkclgkuFYbOJnuQLjESYsyCLZvswEXSEzXMfipSYyhVJeJzBkgeesItjhjUgCMxytdnlobdUQyZAUtMXNBiXHtAUTsRJgOqdrgAojNbnspk",
		@"ykrTCwIVZBVqnQVrrDeVyYNdPWNFiTRFTwZXOPRENgCiDwySARxFHAAXrDfdzQmhRylSDNxHYnZWJGjtdIutcqtlyLfgYfDZMhrsWUrqruNktOYciWFEdgoZaYHAaiCkuxRtNtEghXyVEGgFvb",
		@"wHmnPJwbzOURQiaTyADlzrmlHoAkviCAaqeIlTzoGGFVprOODkGIGJZRPhOkQRzXrXsViHxTsIJDOWQttJQPiRbPDfnQBFJIZzOewAcqjfsHEHxRTvltWrVQikrwAfJLUrkt",
		@"mhxpUkwAtXOZRkqWQreFTzQrXgduUpeCsIGxlXgRKNEuxNvoVKyNMAzuQpznCBDfiOlaTDSFqcAsmFQhBhcZyHYENNxTWCSLoaYEqIPIkpnCKDbuKwweCBQYI",
		@"XPGJhAfPaNcnjmaPOBAIZQkkkaHlQvfpQRdGpcdEgrHGARUFnHkaeGXttsjIdqGjXcynTRvDJhpyOWVZPflnYXmAglwgbDrTizDjElGKnaFfvugeyjInrQmTqySrIDSGb",
	];
	return GfQyqHZRUp;
}

- (nonnull NSDictionary *)MRyfIFxIAyYfPnI :(nonnull UIImage *)mfiknIGpwCCiwDzt :(nonnull NSData *)oZTIhzchYChsReAkSYJ {
	NSDictionary *aXnUHFbwdNLK = @{
		@"HlTkMDXJjHvQc": @"OCOJQqZfjAysfWvogJraLIJKSCYQVeWWnDATzUhyWNQbpNpkLXGraYUdzLCjFenJYnPCgenxbEuApPcgYvSLRLBTbuSOAnXbVHVvVYYHhcOEbyuviSEEnLlRxAqwIAkogACU",
		@"SZLubZeJDH": @"GxgUcXCuKsooUuMtrxbhUMMUBiIZLaQEtEuVfoodUdZisQtMOlwBvIQarTUnBYPOtmUbbgplIyCosPzzJYPnMHiZNQUsGVUtrPjwYjzG",
		@"SqmxefKGqBFkvn": @"MJFmRLzDYIghzGTvVUEKVBgMFLVHqWBUotsUBlczIXeQyOJJPgSOrnzfpFgEKGRkMlTaCwMfzayAEyuevsyalrMseZjGoZSYjCzFwgQBwnnTfrHiJGfeCChatkWRDBQTXwISLpNorlUyzeB",
		@"BbDwswJGClzNIENNSR": @"iXzEsNwNiFHLLyCjrWkkIrQeaDRNowJzxDKyLOhDjghhgJCWGXtDaDrZmAinLsGbXMPFjTMQIMcBDDMdGqwFbZLmcPgbgKDeBGNgbEfNZoxKbfqBYujWpEhqskhnfDWWFaYwvXZFFXXfxWyryJzW",
		@"kRvnjHGxkYKZaV": @"pitZUrnhXfKtqCrJNPsfkytZcowyUfNsAQedYOHIbxKedWSuxryisegbsAzpWZfrcfZrBYyMSiIniIebWPnQbMIHFwKOwnMzHyvnHZxAevSXKNKBN",
		@"BQiTCYNGJJsAPkEW": @"VbUcINAWHFoEnXFnWifxwLcnMrlDQJWIyZgPvBbMCwbDQtORmOwsaUNzMeZTNXFuLlyHMqAJKLoWymsTjTocYfeDseJXQstHFmJxjFiKMoevqhFjlRHetAEsObJdEjpqsr",
		@"iaRaXURXyhXIOZFe": @"xKcKXILpJAEWiRbUzsKFuAYfeelggHCzWPYETYKvoxSwvloLpIaocLmdGJGSYIekDKMCKYEfkyMGAvPHNLmXMbyYKtIeJCALMjlhSc",
		@"CsNogbWiOsOXR": @"XjmmHCzWIPtUGODRwiZUEsJtuMjkraPJrHYXRTwZpayebHkeakYhOqLtJDhiqWwVlivvfQmGKbkLcitgsHJxlnKsdpUasARRDvvWNamSgWWbaeoeRcHnTYvSKCeSLHhBVMFakiUmxsoFAgbrDvvdw",
		@"liEHOikYajPLI": @"tXYUbkVuhkbryUtKJuvzVddlGyXRpZmvWKFOYHNjLzBJXcBUuDplyWIqxDOHymWSiUnKqglVVbnUQqBbesxJxAXqEmiocbSAgMuSBmTJootnnLxQCWMffsvqxUopGtfZaYiJlrzXlzVCtdJnN",
		@"RrwxTfXrsTeRmYGqYI": @"GyHSZpFMosXnDCkOAglnqsxreJEHbxLWECDArsJcjuVQKJOPLOSCDZdSTVwQqxslKKrozwMsHrhshabHWSbpyGPyuZWfsECXKAZeTkRwKWPImNTthJWwzwcyNIUQfhCggtexiZXKwB",
		@"IhmFdkSdpYeSwOkIBuu": @"CqpfJkyTUuQFRkDbyeMSBhVeEmaiYheMIoDfoOUKiYSIupToKOrqVejZPCmXpmSrVaXchACUvusqJJWPMmxSUigDNAsJKSjbLNsXNQlInMqXZDdsQLFMMZ",
		@"KgMltxKEwV": @"FGXpyvsxKviwKAAkOhIjkejBvcCJWkXcmnAYjFQxWdZwkGoIXmQimnCdkmsgXnCaKbdbLqKdpgJIpWeGOYCtyENyWYPEoBjxpIcISGkOtHGucQPmORbNQkhEmjdMx",
		@"KUpgemcWjkG": @"DzjEcUKGKckqhVreiTCTIhPbgQYLajNXnRgrXVFbKSxUPcLIoZgVXkqyQiwVInZodlskzskbcfBUwZorEXBpPwxCfwFbRvnINmnIRMNPqlxLSBnmOPiUMJhWnuUHfqSxFGkE",
		@"WbYRBaVKMjcIGSNnT": @"qTYZYhTlkyzxpBiPAnwHQWbiwKDZneFKFutMeXkCtxBvBxTTNhhZOcwezvGcfQKILMJtFJkKDaRmPMaYgeidLAadRNdIGEHkIywi",
		@"pEgdKmyVPT": @"yZMNZNWpUSFvVrMDZpyWLBcebEFEKRVCStaJDaQZUBmouUnzMGmiVdBjpFHlXTrKIEbraxRcTfuLVoTwxibjaXcfuMcoiEMBmqznFDhpnlLxHbCwwScBNhhtBqyuaaPZa",
		@"albgAOphlYfeFHgnaYd": @"SKIGtudMcXsYwtGjNzFgLBRutGaaPSvVHDxzBDTHVhzdornamJCXDcizDKNQGhhJXJImuLIlvsqsShIGzoiJbLkFkakHJJepCFhuhNDTQhCkpNmPIIWPKKbxNQ",
		@"XnRxITfetkHOiMsFqUR": @"nDTBnWBNDOKTidRHNAhbPcWpPLQOcNkGKsAPjiiZFXbxdLhYAeQAaRMFTHSWwbgvmksaImBgQmHFkDxMLTVCszEAJuGwSmkbFYZhXrvXtSyYvYGgoKtWbXZytjS",
	};
	return aXnUHFbwdNLK;
}

- (nonnull NSData *)imdtNUnSUTCZsn :(nonnull NSData *)SsuQhHcFmACAPFbvxq :(nonnull NSArray *)rsObPtPMYhiBpQreT {
	NSData *xxsNhNadJXYnRt = [@"rpHiUmYHYZSIWCaZmGhnGCEOHcYCNVCxDUCanzMYULAbSMpIFnHxyrbYScaJpymCwYSkhHywiryUNLTasXPRLWCqFQYjclRwJUqqeItuHD" dataUsingEncoding:NSUTF8StringEncoding];
	return xxsNhNadJXYnRt;
}

+ (nonnull NSData *)PWwYfBORRAdJVbMTx :(nonnull NSDictionary *)yyMacmzOiLXRQMmyA {
	NSData *gSLMBSlHtILnLy = [@"apbKZFLtGHMIRBENsKZgHARwITwMWyrYtBmUacRtlsDDsKLpWUVTawBjrWoHtdtgRuOUqkOubStFFOqkdiRCtthVQJvNgKcktNcdbpcJizpgRgLbnBTOSVpJQPWztSUkGxWOqbW" dataUsingEncoding:NSUTF8StringEncoding];
	return gSLMBSlHtILnLy;
}

+ (nonnull NSDictionary *)TOByUnbHZSn :(nonnull NSData *)cbkGaRIUYJqpqfI :(nonnull NSDictionary *)mudSgPYsRV {
	NSDictionary *nhysAQEkgVXKDFBqX = @{
		@"YNfktJnrqwtHx": @"weFEPtOZPQNlFemAmTsDxLykkRmpSrMnewKVzbJKkHunTKvQTLDapKINHbMdzVbvuAuHplmzwzkBtgcuEqlOxAFfRCslzjjfjwUhofNFMjGfjIzJBUdExLWxOEffppCtokijBkl",
		@"RYXsDhEUkODsd": @"CKofnnaahNeTeefGdcmJCosWthKBnbDUlGpLzBMptnxchrXZEzcAQzJeDieUzvUECQtAbqRmJdzSAEBvbXxDkQUSCrUrnwOioTkfGWozQuT",
		@"vYtUyOKEib": @"DCDuQtxYtgvpniWdxMVnRTIFEEQASZQetHaQEqZWNQZIevajdmMUyWAqfRLidYIfGrCGNvQCrXvSptCOTSwDALiKveEfuLJYcPbFa",
		@"aqqrXNSNoLht": @"TFwMAaZoKoqUyDeMOPaQEutLotHpgjMHmqeOPWgAUTIvbUvjEEdaWibCGRcHnzAkKntyTQCKMBperYuLwEMygkpEFnrLVUJTkMNXLaxVJiBwdD",
		@"yoIPyJsyoFowHlHt": @"lJQncIAAAbsrEhBsnuPRMfKNxlWzIAmxsTRmxveGKavenMNlyaCnniGoldecdIwuihUeyVIGyLmLLULPxYtRbAqhGbUerkgTecggdPdEWtPWmtuHWjIvYsfLDTRrPKnZwEJrvAnpDg",
		@"yzgSjzJcVOUzos": @"oMGZwhKEllKxPdOzCyCWxyNvomvJPunYmXetRiVzkrKhEcEZLigRcjYwaTtstBxIEmpMhyFHGSfKxaRjbWalYmblmzRksRQEBDZayVWoEfGxySIltFkpDmLdBLXnnCnxHnlLvePWpsmWn",
		@"lBQlIXuEzmmX": @"vTvIVygGwUqSkKffwiqKAMnjNcBGtcSiIgiGlreEmzXvklFSlbQhKbrJSbJfBptvAAxIGXLbVfXylgGCjnSvDtofuKWtgdqGjIdNhBfGohTYhjvc",
		@"fVMwJDBwkCghufj": @"WeLFPmRykgjNbSEhyMeRAfLSuYizOBXVKMxdgdgHzCQIiJbaVsFWuNyIIHhtVZOvljKBdaSONXPsInqMcwPkSSMUWaZcswrHSIZlWn",
		@"fPIYkyRsBVNw": @"RVFXsIldFfzAmbxwcrhbOEluuFVUZrjePdwJqIksnXpVjdJPWnKIysoebVvZyXZFIpRcfqwQtPhGlJcYyWdIBUSIECkKxdjpitefzAeFGpFpNoqTlsHNrxishQzBNwWvYYAzzgXaVbv",
		@"QDjnOMoRJthIz": @"XVHoVXDbuEPnXMTDhgfjvWRESVmXwgGNsuOibOdhAWxuaZpVNNnfKohQVtCFuvbalTAAruVHGqiIXvsrbifLIEegDaxDnQZscxlWToXPNDTaNoLLNQKINjEVMOKPYNPlYJQnESSnyoj",
		@"pcfimyCiZYvK": @"lSFxNCzKbHiEidnGhoFkNxfTzaysLHYjKeVCLSihdgDpTNysDnBlDXzWbgXILxrzDDjZYTuZihEZQNjUOkqEqrSvSpxPkgxcKdMwyFtShiexYAWtoH",
		@"mBhyEIDVQFR": @"TlitNDDwTJfuZXiqvkZbZIaioxeqVopbCzjXJqrIyAMuumdaQBsiUuQqETknTFvKCKfAqIAQyomzdZSSMFdWjZJEcdtMkwVQZpCBoUcrljlDqstbfuYSaTewRqZAuHhZwLhvYUQ",
	};
	return nhysAQEkgVXKDFBqX;
}

+ (nonnull UIImage *)ZVSXRyTlXd :(nonnull NSDictionary *)NAXnjYVivHfXWCa :(nonnull NSString *)hMqIDFjjkDsNuEVMYl :(nonnull NSDictionary *)HtxRAZEZvoUI {
	NSData *oMlWGSgBWSZsjcJD = [@"HwIMgmiSWukYRIpMecEtebgXPRpusilPDXqqpXzvxooHZjIYCBYUXIHNSbuDlTGXFgYDlvggSoGlUnqwffomkkZNHJyPwCMgbDkqTlZHmj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *herYKsbICv = [UIImage imageWithData:oMlWGSgBWSZsjcJD];
	herYKsbICv = [UIImage imageNamed:@"ZkTIjXFfGZvYPuAaRmtywuhdHFDxpdTGyKnmhXibGayYFMKSRlAeFOpXGJueKvSmXOBJfKhmFjJdvCPscheulANAVQEaAMJKvRRueBodNKaTgFAXOfLVNlZVpoNAgYYmOjsYnD"];
	return herYKsbICv;
}

- (nonnull NSDictionary *)DoGQgvrEokYTWrMaU :(nonnull NSData *)dDXutEUJeUFZxsp :(nonnull NSData *)acPavtpvrZBGR :(nonnull NSData *)VjtOVEBCrCZQspIqS {
	NSDictionary *hkUSuVNMZqGzyqpnnJz = @{
		@"JJlbbVoEagxSujqN": @"oKfHWEJJqlDepcZRwwvxeIwsnmfjRDmWhCBTBUAelAluyNlMeVikDeCeXkRgHpdIcJYEUGBUmlNaFoRzMUfDcGxxKheAAZHtKagsiuJqbXKsctXLhCkbkEu",
		@"wfEqeaxkMheTiWk": @"FnOZEgfQLuQXJNJqFHBAQBqIFkKRUptTRolCoyHPxGMdSXwkiCdXthRcCsFWDTVyXYzqJMCCAQAmHTkrKsxWUSVQBUswDxxiwfCWcrcTgZHUlVFucJSXJxrUfGZaWuhWHoVSfsdfaiyzom",
		@"nFwwEjTowIk": @"hasGjTrNLlmcoILcWaDhZgROSiyOWhKJyMExsMWugAxbTRxkZFojVYnZhnfqWpuDIhPaBwFyRwjCNrPxZjOmhMesHRvYixEIvrolhbEVgcRNMdSmslyEQGhvUKleTUdnzixGDImvjzvSCSMq",
		@"BJdkNcoUyIf": @"JraSivApIWuOFfScZSVhPoJTkjsEfRzJQBFAjzhhwXOdoxPYwvzNRZUkKyVbFYnoaDatteaOqaJJUxTeNhJUYUChqsQoXOzLoobCYGKadKQm",
		@"CxEJZvwtzDNs": @"rCvehqbTtsDSlAbTqxWOFjHBkyHjXWNmFuJQShllbWkjfIhOahFvBoJASttxGFLotCqDIohWGkXDPOGMJhoZSTZmHwcywWTwXYqxIncMBwXsXZcnE",
		@"qRMpCaDVuQNuypLQssP": @"shnPOTjEleFkrhelharfytpGMQQMfIIehurfLtInGgdUojacdCXVuqcxheUhfsWEoFuJxVkfGzvjYzEamlqMaJdqCrYqyMNvidUyEnzEwLzIbWKQTBdgXrMWNDKoQBWvcFFo",
		@"AemsWaPVlX": @"UPLGWCceBbFhYsFGkABbrjgTMidYRGcIbAJyATVCJHjcOmRsyHulfJyFCmcjpDlYIXoqRTCtsDBkBMBFleVcJupzKsetxeSjnPGoJepjjsnnfCvfPWkwyHBqmT",
		@"sLCHerkWDqVDyHit": @"OnCKHKYbWjavvXizHSFhBjDUJpVxLfcWdENeeWVYFLYPIZQiuSoKAhYsCSKTArDkQrlQoxVncGcddQwarFtnqGnRSvUlzknRfXRUXiMcJhbwQZwHoaGFZTFxEMKDhHIcHcBQQTPWDXSCXwnJ",
		@"FwAuKrtHPTjxvgGNGKs": @"wSDoFDbqFVOgGtqhHZyVyNPEUWJSLkbUeXzDTrFxaemYBgYryQvSoRqOVNJwSYaLRGzlpuqdfaqGlhrRWnSfdMbiYEvKcyejjPfWOYxNzORxdPQbTukSKnpGqyjiJ",
		@"PZVvaGelUVqZtotXj": @"oYawwxyUauzLEhFsLZdQEjhDvQMOnsGverWKqRzhjYGHSKQsJXocbIveOrttUbYCOVzQsvptGGCQGcrxZRAFDOxArKWkasQLGhrJjzrIliyPiZDTaitCjOKvCRX",
		@"vPnjXjsDbJSYri": @"qFVCpUsFGXUyiJbteaWkGkiMTDESDzHavLWFJhIsRahcJdeaEOtjuMYXwaIwbpKGLxNRhBcvtbGVJtnGNJEbbzCVQkWnXXgJqrodExNztQEyO",
		@"xDZbdlTqrkYOI": @"yQSKmeKgeeZGVGRthdtVDTuPfqinXrPbusrlQliNjDNjHdGprbgWPquvqDLufRqZjYnNtIbegnrfoBxpZhykgDUyVxUhxtQsPQVMPXbcwxkkOPJfgE",
		@"XYyyWxBchU": @"ucyArcjUXIjVirSgvQlVAZFUayvkqiEIylSmVLGnQurNmVrepwatMnwSspuKIzvDXftjcUxFuGjGMLOqhHaTwpRNlXmxPOltDuIlqEhxogncg",
		@"KdJdPshoumLnVK": @"IiNIIhwJYKfWcabjHomPDyGWykQCduKOprHrEPLtPWqGXCjdnfgkGSncCeAzJegFcnDhUyFSapIOjrsKRSlovJrcQRLuUyMXTNMaEuBFbXPcaxucXeUIRMfBuxAEKhOGWdVHEhxFXlfF",
		@"zvkTMNOdpusfJky": @"UMoYAOUUgWriMESUZRbLDMJMduXamnQGaNeOBagthSPlrCKArLznSchYcBjcKoGUSrvkAdhvtzCIwnQMfurGggGEwztjPUUqvGmybUsqohyfZunt",
		@"BJGWLXodhjvIizLnO": @"zngenwnKfCJAOJYUjXyTxyHnoVxXIzoRopiMkDsHsRZQhlGtRtQuCYTXhpXrRQOImdDZiCuPtGLVcAdYTBsqYkmMpEaqIPOeXcYbqLNhcRl",
		@"ytWcIwqtzUrdLlirDy": @"GDlDHtyfDrpvMnctmbQpryMVmuWmxGBqSzmhQJhZzwejygEPMldfLZCFdeQgHgHCdxcrcxznQeSUiyPvScMxJSMcviYxwuLYYaVoDLAcYzuuvmtcqWgSmdioQTfMyeEPNQapqeexQDzPeIXOKPAf",
		@"CUChWclOFDoyDOjIi": @"InCObYmkxtldCeDHyWbyvBCxZazSoGerzxLfqFaMiKKgqVvtyzirrkfCRUVDStzloLXtqUOXfFrxIDoEXatypKPpQfmcpnZEBJAJJBwydeltIMsNfSNPBAkV",
	};
	return hkUSuVNMZqGzyqpnnJz;
}

- (nonnull NSString *)TxWRaVKuDFLusKioGts :(nonnull NSData *)ikENyBUgyIhxyxprLV :(nonnull NSArray *)pDGKBflfMMrVLGH :(nonnull UIImage *)demhazgckkmlWIrcDl {
	NSString *yazBSHECSKQYK = @"OsAhtYQhJqSWKPPNjeulvRPhpfkMNlOQjkIorEKEhrneQamABSPHNFqcTOXXpWRdhQkhYtcgZNkpnLdbyzPcWJmnGCgQRMmKebMyPejFCorAEFqoHsMUnUCRObSGYaFFudHJXStfKSSsTp";
	return yazBSHECSKQYK;
}

- (nonnull NSString *)forrFbBefTPcKUzm :(nonnull NSArray *)ypjTNFzkGHlvZbpQfc :(nonnull NSArray *)PIEzmBHcQvD {
	NSString *sgnUMFmjjtkdo = @"KKMdjkCbjLygHoumWkxhtGXwIJlPfJbsKxAhxLkzsFBGzstjCVudCCzPCREUxzyFBeoUVgyWjvvgtLBFeagqLVIIUsHjLaQEfLSXHGjeIMxCZVk";
	return sgnUMFmjjtkdo;
}

+ (nonnull NSString *)claboUXbKDLWaj :(nonnull NSArray *)LCpPBPdAqbIdYXJfQv :(nonnull NSString *)saTFzTZVbbga :(nonnull NSArray *)fvMZXQlFuNjnjq {
	NSString *AuVBnWPKpx = @"gKmkqNEuKxmGxQhdiMCSgTDwEtJPOLhJDhNoGJjUnIBCbMTwoCnnJBrbXhKxxYKmYqfdrCPDkRxwJQlNIhavwlenlUpitgouZsZbhnUfYZAyIqS";
	return AuVBnWPKpx;
}

+ (nonnull NSArray *)lxFLsofMRxl :(nonnull UIImage *)dPpcPbYUdBjjoQP {
	NSArray *xxBommyReCCeLE = @[
		@"JuuoKGxJfGraWpASEkdLgTFrIsymqYXDMGrNmyJAcaEXWxJyaPrLwmnhiFQJdshNYwvGoqkEtnYicmXWFAbauhKZWdMrdUxMBocssMWcdWMQptvlCUue",
		@"fTpgeqGCcxBTRlxwlcMCPnEVEPmnpwAwlNWgtsoVLDZOZxUjPdNDcHWMSLUyxahpbaJHmxhnxGFhEzlZHCiGhzRzMKUOnhygsOAerEOeyFTYJaEyuNCqlJRGhsGUdPV",
		@"fvHUWLDlZYLEBCKSsGMGhXvNqcimdlyhpQJwYQQHRIXGuOQJwTuWubaRWZhnZVSmlFueTWaOpYOqlTXxZTfxPqSgCEYLPFgxLEmxUJUqAYqNjtLfdbRnLvWM",
		@"FrHeaMEFJqZhqVIKtJqlHSPrythkLtHtuDujhHmgxGwVJkQuxknxElnuawGyIHXZxvSoaFrsUxdnmvHkhWRgGitGzCDLtbLIxxLyfUiLRSdlyLryLJLprRzPiCPUfwNDqmpYiLcHzbKgEbHY",
		@"oQpLvvRJJgxLjVyrZAVopZlbDDqsDwTYvsqmwONJHaCpmjzHVKbLVyKdvkebstRxMLrHqgoDjbAnbZbpBWzKoojJzUBioaBFmSphClmJdRJjMcVvOPHBckULGYDMeETonbNHJNbZeQgc",
		@"OprqTpLYZtdtOeBZkJoEUCGirSAlCogEqHumKyJqqRGErjfNrnxHichyzikkMcUWyNbBXbyWCLMFRLKVBYDWOPLhhKVunwFiYGSuFUUdrQvuUscoNSxYUruzSdGmtPthzUOdUi",
		@"oQDplKOyiCFupRxAQkorqyAIpxfFlNrjbkHFdTJGiVlEIaGZYLShEwkssMEhbcpifZcYbtEXvzsNympsHPsdBrpvFDVYRpojzEQfyRRztGGSNfAuUTuJDSslYQfAXzqunjsH",
		@"wSyQtwWxaHbtIKjumPwUevXIOVfMdwRpAwyRHJLtAIOCYSkxqUVpeVsFJtaEvWBswdPtDsKYmXtAlVzSPgollbQBzxZeBVtGbPBYSosJlISxwsMoNvtsVq",
		@"VtAHYwMFQmrDLFzVrThivOjXxVHsBJzoKKtWuMmqdadZtwMmGJQyXfLXRwRVaCzUnYXWjXQUzARUZZIHRZUJXSKqKnULvhYhQHrXyWxm",
		@"DGxwEPeGvlOjoxcovosnoIIVdbbTpkHvxWfTPXbBxAmKQZpKISNvRBRyLVWKAmMnHTwBpXoSxCmvLqmGrNfYdnxpYrRqeVcNDveOAdERxdnvdFnuMMETDbvxnqrsazoTgRuQZUW",
		@"KTaRigIOTOoiIAHJVnVAVRcekADeaLYufrqZPOcOYPjBfastsgpLzslxNyLTiRhZvoxtAmXEWhSFpVFQzgbxUruVrdJMcKGDybOIoDqzgNN",
		@"nwtHNqdUFKlrwVJnrcqYFtGLlWkvoCtOOlVekIxsRbuqSkJDWRDqwwwpfPcWdOnuuKHXWBXGlRVjJJdjjajNzijXdeijoCeNyGkKgDrKlCiDIDyILuNFdmVPbWGhmbSZTyWPMlwFT",
	];
	return xxBommyReCCeLE;
}

+ (nonnull NSData *)rSmVMmfseLohGHkubQq :(nonnull NSDictionary *)QRqeiZvsxNiOn :(nonnull NSData *)HNlxGzRZXH {
	NSData *aLBaocDBPxrCPC = [@"vBNtcCkFgrLyrHkVGAkCnSmdDdnxgnmWWJCfjzvkVGYymYWdtTkFLkSQEfdCfmpxBvncghYbyUINInHfgIkCCoLVPIUbvHDDCDQeXYZpwXHaIeEUI" dataUsingEncoding:NSUTF8StringEncoding];
	return aLBaocDBPxrCPC;
}

+ (nonnull UIImage *)uoiiiOqhBKKzL :(nonnull UIImage *)CPWiFENkpMSDtjlqPAO {
	NSData *EYltFytzKIKWvcJNlAY = [@"WeQYAVZuJZwBRfyQUnmsNWgtiAxRcBTvbiUolWdstXPRYRwpKCiApMiObwphdYQwzAmuDylqWMdwsfMARpycjdKpOuYRNUeWkeFziqBWJqfrOnjaONtOPPZxJUNoDpFdGlIEVPBXzEwmArt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iEqiXajdEOKDUOjvNN = [UIImage imageWithData:EYltFytzKIKWvcJNlAY];
	iEqiXajdEOKDUOjvNN = [UIImage imageNamed:@"zaSloosZDJKosiSCzHpojuhvVYOWJPwMVpVjARBvHcGXtQSyiGUAaOQmnLsgmiSOJuXGOIMREQDmwYZkmsrrEfAUYPPwwBXgqsXSDtJItlIQzwqKiAoUImclWITNIE"];
	return iEqiXajdEOKDUOjvNN;
}

- (nonnull NSArray *)qjZpzObvDCVj :(nonnull NSArray *)okUUdJwlUYvTzmJh :(nonnull NSData *)KUHdcRGFqDZIWSSpSs {
	NSArray *HFGhTbqLdfIWOOgqcM = @[
		@"fnMmyTBFyxxfJtjLWpzSkCdXaMVekYVYdcIWufEDjnLQsHBqrpupxjdBFjXZFoJBWyrLeErjgaXYVXdEBOiPplilSsqNdxPmeVneHLCWbZADXzJUnGeWYrOsbTs",
		@"ppEjLDHgCxgpfembnyCCItDaTYFYpOmcDxgxySxuAkXPlvnOtcqGlQITfXGzEpQDVLzTTiFPrzYFJiCxbblCuucLfrTIqqCFYkDzGNnKIXGnEUjCROJbrBNxJnHMLePwmXxaVvmHbyNDloATiFhb",
		@"VyPDUqKTKCAluspYNviGMjEmwGGHqqvTNwpydDGMJkfbutLcbplHSLQlHEsbXPBzWdnRAMjxjFRKcqCPbNHoivefAJLSeupYFstBrxmCQrlIDFUaCpnAzUIfUynmRWKGqQXXHc",
		@"rgHpmDueIGDYkrzBoYqVJYgEUqBzajVIWpgJoZEIHnoxxVDXFaPFxLXJGdoleCaefwslwWDwtYvBdhUQMeaihhxDdvMpkcluDeyxzsMnJieAWbELdqMRokkoMGcgkbfbHLewDKPViGYmD",
		@"LWebaDRLxMaAYlIDgPgQDTWXCAwWSxDQuxFbOpNbqspAOfjYmIUJUBrEJDZaPdjHFJaLAjzajzFowoEfyckjxcyeoNPVmYjZsAXUwQNQGmolDAoepurzyekQFoGCQa",
		@"KJyUYAPToReijSXnPjARnTODhhqJrwJsAbaenUGherZkqpycCevJnaTYKHjHiTTEzjReuTqmzAtGWZNBSvoPBgDJpdRmVxftLlBfTpTMidCiptdQSnilQJTOMXsDwariLNwHvMNH",
		@"JjtVNaUdtdAaEvbDQYUOMLDpBGprfKTThEDERVObZRbypSZzrKaMjpztdsyyLAFbKAMGFghcAKmZPOkMMIUdxjlRYmvPWIASZxSvmAVIkYQwmRquFMYgytUCTiHCosSyRhWLHaEESIO",
		@"hhQMHGWFNsMwGNCqehdjQTvLfGRnwfntEmtzEsxoBkvQTtlglZJrCsOsTxTFoXDWOygdhvVVzkUyPyaukHurveacScQwtNeliEUPswQmGXEpCLgeonQcoxXaooREEwIoumfipbHenVnQJfyE",
		@"FDOpVzLEUTWpxSgTiayIwaePntpKVjNgrdQQlMYjQacUTkHPgyOvRGgOronsiQoLYuWxWQOvOxsDSYuBezbaBTTIiMBsYqKQsjJGismxvIqfYDuGZHXMbbjAnUwDouQmwCBCIRDEi",
		@"LyksJSzLfAzQKlROolmnGVthIGjpulZAqlJnhBfAqMJfszLSxBwtfyNunoKNKfVULOoMPqsGlsaZBAmdFCrKgIRcdjDZYEKLQJTpksdmAxEPouqIzHGWCvmDjLTtQmTdtRqZOVCYODvhXsw",
		@"uYbpajQnJcdRVBPFVbiXjoaxHWTwbgmqKwIlsWtfyjImvWvmyVymXlSXjBOwIKiJHGrNlcCRxXMWidTGmXhPAcPgRUTmQTyFldAudJrClVdQrtEaPu",
		@"LMDyFjoSKsRqbUdfnOJyHiAPpJMGwwTrqrrELMngkiasDOnvvVGqazxoMpKfkqrWMmTcTmMhwyYCrNesoFRRonavspDUFHAwYGGnOMUhkyn",
		@"HbrVfGIgRFLqGWFDHSoHpEKMWtDbYSkoGYnUzatoeBgYNTBtHDNHZOzOYhittPCleUsDmsFBDYtZAGloBRTTXTqXufDcnBQZypgPLmzWxfavkoAuVsVUNrpLgUHAmsZuXvjeEKCdNHdmInm",
		@"rPboBGWQTtdhkEkwAkUszVaAoasHBQKkRkUVADuQHukGDhNepQVlnkvUOckxpvzepCcRusYwxSVweQCeCDHBsmKCXtFvCDSzrWNFqlYWyLmusozaWkUVyVfvEscdCHuCCveWbcszzeJfCoTpho",
		@"GXYWDLFuqmhGCGBnzgtLMLjqBSrCnWlPvGwuskFlpczHSESESlGeHncFpdzoLktMRJYuSfKOPwQhqTwMjgDMEpFsXsYFkTqsZmICecd",
		@"szmwtUJqBZZVdExAHXSKGgczAseQmGpJObpuBGIxoBgmfBLBwIUuOamdCFVomTHkHqqxsKWyIECFaopNJIIZTPZyilqqBtfuXHznzKRihAEppVjaoVKORaGrwbXfVqXoUzAckWaZBMekRvJZO",
	];
	return HFGhTbqLdfIWOOgqcM;
}

- (nonnull NSArray *)HWMHlpROafCtH :(nonnull NSArray *)cfrnaUbDhMqnaOIG :(nonnull UIImage *)PvqRxVnATi {
	NSArray *iDaNAlcYpTQJPf = @[
		@"EhWHNmgocazPsaPiymOMeVoPzjIhyPKkmQCMORNbcfXeqmFsnXEjhaDRJzTHVvDGlaWMCzWRpPoeDGijwLlxqGwbOPfkvGnDPAGusHDUfJRNnnmQhsIjFaeZQqPyFRMdURJFQRJAnKSEIjilQUuyU",
		@"rAvLEyDZiYDAcJfQToaYynXdrrcjuqhbfRwMoqEJnTgZgonmFffpvVpSTniqsBSIOeXpAEzrXwdJVPBdeOxryNAnPhXgMfvGvaRUxQaRVOlsUBhsvXXqFeEacWFxzZimmlhuhxcKH",
		@"YrspPVwRFFsXQRqaenkdkaKWMbdzfSiOtPIILSAjxaJgOqUdOgNJqwzPsKFyEzXYKqxeFKITTLvEXRMgcIjHxQQBMcKcjtkdzjwiECWoONJoekeQEYOfKHvjKr",
		@"mKEAXOfsEMCAbtBoqEVzeXqphdaOAZHXdgBAJeXtLCMEhNrxByrHtAffPuzzzWmanBYxYSTxliUHDsnSIYzPzcWzWlHEqHiWMlwgRBkwJTI",
		@"BFSaWRPMsxxbiLdCZoJaEOiOeHSWwwQHCnNdVwYWzGDHDTocNtteovWfJJiuBdjKzoHeccAYpsFHjBzBvzrICnhAwUKDTuakJPTSLPwmwwtYsGZUVggLNEHLZtKGugMCOOCGTMHZHUGlLafR",
		@"FUpuriIDqvtbXnxPmYMoYlwwzFPfdWrQXoDvaQPCuZREMUztHMkeQzagKKZXSTdnwWnbuQcyCiBjPJDfKVVSQzsrGcrplWqsdGWvk",
		@"CMgbOjwFHQOyORPcJhbjBZgcVuHxxtQxoQaZPIFGpDaSzVoZbYUHkHDzHhupCOLCckLPdTuCxDGrnfDJYtVpnoKtFhtMGctNvHLEybSwwyuPIOFAjeRgUFODUOdbazYcsOMl",
		@"GPUkofiwgXKcFdksrtzQqdDZkbMUUEhNRsebvYeCzHKvgfJjjUoUksqnigcAIizOrEkMpfHeqOVucXbBnjRwkSwKbHquVGLKMSRbNckLN",
		@"WfKXItlgbgiSZvNYMHrJsqctSRQZxcqExFodqCRNNKAxrBvnmBQPKSpydJHNYwUUnwHisesAFiXqNKfOXpbZMTWEsHDYzsTUrRkx",
		@"JqOdQrXytUwNYpkVMWVlgmOIxgWfMHURuRGEVyIjIuKWofmeanjjpSeswRpPoeqzVMwTugLWAvtxuFesZyaOvgkwgHVQfdRQKVEUMADagxfpAYHVCDnUTAoPgOKOazPKlNVGKJR",
		@"qfEWNskRSXUpyqVGsfGtWhMjoTtqNwpiEVtZpXynEoHKkwcraFhSPcPqoRdTZeVXhTQoHjWlcdhbyclSxBlFvmsBEDLfGiZQTUKcqrJFUSzKHDBGyn",
	];
	return iDaNAlcYpTQJPf;
}

- (nonnull NSArray *)rjBtQevUUE :(nonnull NSDictionary *)znQfmBAaDnNn :(nonnull NSString *)AkgwbnzaLXmiWHC :(nonnull UIImage *)dKysvAvQyrIFrNOXnnP {
	NSArray *VORwsOlqvebhD = @[
		@"dCRfwIUPAcKHkNwlqZDxhFGxDOsSDQbWREPLjacekGkCeFZeVzriangkHqFAMsgqJQttLkHXSEzDUGhTcGwJPAnZQmfJGikiWvgSuweViXlkGkVGfbKswiUVPcAV",
		@"PztDMYTXQejjwDdrPXdbUceiRxKrmTRoEGJdFBNxVyotJwMOnkzvLqFWifdDEhPiyMCpZARKpDJbHKGukXvNULTtcHfIRwFgjiuJlqZNGHgCkFxHyTFVZSkv",
		@"IXgnqNEYphrQlPyvwNGCFVxTkcCHdIQfxawrdRRWOAevuljmzpEDrmKQjHsXiBOxcCdZBfjPxvBVQjwuGxeaVIoaaKBRGJmLsZdsnrJEabSPkDNElaVrENTJIzxrWesoQjwjIGMHp",
		@"GDjshHMHgzwQNiNJcYUOFCOIwrkiYgczYwOAdCCuaGwhFAuWsKKZjupraOgyNcnYUmTJtnxqEaiElMNGoIAxYAHMMvugMFiKEMJTbqUzyQWYPjwXekbrmrAdMArXfWtTBGymEP",
		@"vwcCmavINRctEwsZaMuQOzUHzOpdZPXTrMQhkWJEXaLbreMzXQSnwkhjdLTxgVLLzusPiotZeayAcqFIjwaVdiwFfXiOECIIYuuJPITZMBAoSQK",
		@"UdTuUHnBppmZYGpjDRaIAtuORIPsSoMxHJthFIuJdJRJcmFDeUTwDaZaYAdrELCYAEWGfEmVRExxhmhbfkNhZhwHjLdgyQdHxdutRdTEZObLdAAoieMSMOAAqK",
		@"DRvnsnQHTNrVzOBGfmrbLtaSfEcqIYGGKzMhDRKYQAYCxHlHJPkpVrPuveDIKIaHXtcXqoMCiOAbtGfhIgFFNHuiUshpcqiAYIgCSdnWijT",
		@"vooZAqNguDICzvZdiZPScljlIoMoaIrfLCKrkwiwvfaEOWetDwqgWMfCkxbDJuphiMlHtemceoxEZKfCXIUFZBOFvrAjESbHMsdheKjOiIcHYKrksIsVwHNcSFgxmuHKbtSryDhVEAV",
		@"IkLTNNjPYDUbbdxjtJUqhAuXijPUErDGyGwfTgvtiwQAUSrEqNOQznlrIbeIhbpEjVyWPAqYwASuBhLGLgbaegfztdhkKUNcBgHXabijDfsAIuElGxuYffGQJuoyefwPloFWKuKcIuxOoLOeiUFmG",
		@"wrsHLFrflvccJyOodTKekCrReyeFisgwCYSCQwITvypSYPOpXSxQFKqBWcftGvJkSYRVejpcwaECqpfizcwWZgclAlhuqjJiFRzSWPhkyifMwXKXMqzmrPwbDckaHWBAeVndvtGjfoCCQOeqzL",
		@"AoWVmhHpZnIhPizZaEwWDmwDTYkdsVYcFDhitmZJiWzbfzshQMzGTMTPKHfvbBdezICpyVqqLsATftHWrqYcmoVsHuqCMACxdRHRPhXoeFskFXhlNlOxiMArlPOhimiTsiST",
		@"EbqmLZTvAJTpnCqTbbwUNaGIyRkzWWjzbmWzUDDoKngjdpzbzHXXDiccxZOpniAwZcJGikgoatQVPShXYMBgkTnGjBqbxLiTAmpbzTsCtmmtyvwQFIArFliTxHDGKDDteyVHVAJqwLk",
		@"mevrvTBorFuRJXTxRkJreiXLuNVzxTTdmKAqUyiSyyJGrcELPmoZiTrnbYoQAmVTbkCUJbSaxSADmvJBJZFXrwzLrgTdemmPFvzbIWpDwlkEZMdTfDzJUFGqAolYMRXARzosWZBEqKL",
		@"RcTQpvglpzoOuYsyVQsbZObUSaJIrXtXUPxcRyVVoOWFpHUbVaVFxwJtnoRsDaGIPBZduJmueMRbaBYNEXEVEzPmkYmsLBuCoyGNDIYtXzWkQmBYushQnKdFhNswsEfFnkZh",
	];
	return VORwsOlqvebhD;
}

+ (nonnull NSArray *)JsHFgqfQtKUbKOzNc :(nonnull NSString *)hFrMrxDLkQpLKqSQO :(nonnull UIImage *)GTZEhNtqFWIoTo :(nonnull UIImage *)PMNxroSHKcNQwnZcTtJ {
	NSArray *FtQSfAlkfXKAvgu = @[
		@"vSYZqXRPGicMVisuSooswmIyblaDskOgshEaNvxAFYeBtVmXNJPBhymreXCUdZgErlBHtToZBWcxFQeNdFxHtMmOYCWtUfwogJgkYXksMBecFJbBhkB",
		@"FMfCpUluthzoLOfqeipAiURFELfquzJlLeTMSFdDlgzmMGhDkfrXTjswKKfqvDikhdlBJByWOASVNlsraoOVymHoFrEcQOzCZACmXpz",
		@"xWIKVyUqhCzhidhUcfowhtnzrgnmHYMTsULbRcLtAQohiWaxLyNukVPipoIYwQjRXLnkzAARdRkNgmkzjFonLQQKTiMdkUKIuQZgXCwuPhdYXnmuioRrmcjhYCKdfdZVpVWrp",
		@"PyCFttchYlPeoMYhxrNFjmKWBnYeGbjXrgDOahRiDFMHICtLQjnFqliQXcMEBaYLqLHOWrCrkKPCZhUWwwHEnrgpOdOsMYLyveJaXYcmNGuoSWHWzsRoVoGnsNkfOeVMDYTteD",
		@"XwmCVZiBXxUhQNXJFHmiLlZYUpZYPMbMOiisTxTvDzYyGQyLNxCRfgEerYwAjmOpoiXAPeqzumRbKAxzddxMkiYSxlqBPcPQnKPNSgpgXlNizBtJDtsToh",
		@"wwNwWMJWNXcdhzBCJDczDUAPDsxMLpjZhpUFCJazeNHSlDhYpTHmHIobKifdcvftcItSiMKBIsovqoYMEPVWmtnEMEpSCqKOCaZlVFYOMVkNQEhTbcWnENxKXwIMbLcmEbSuSSzjZn",
		@"eBsyFGduWKMxsYVdcHcGgwQCSkxeqcWFwgSvWJGhkzOnbFRyQbCXBQCjnQfHpMcoLeaxzTBhleZPIGvtPGYGYKnCeCUAkmaTxRtSoEZcNMnvbBHOEP",
		@"zMOzNFTglKVXIPfBhCYEFCYjZVMpAQkOZjjmhIScAUPVvEcfogABEhYrPBMFeWguGSmrKxnyBUonAYhEFLsSZlZCNLqRbElqwvopbsJUjmOHlrKRBkcI",
		@"nHGJHddTSuUWMpbSLlyXORyLIPZuycYwNudFbKSLkaleAyoFhLgrXyWmvxlbYqcfQlEiiNmkliUiGcgBRGEIUPhNAUdlCcgIKaaHYNPFqzbxZjCGrqbGirOCttwuTQXjwASxAOgqLnTFYXXAemXKD",
		@"hrrfJujHMXLiickrWgOGDcOpvgFObgyOphQTBcnFrWhPRCwHxOwcDtQutWMyMvufqCEyJCiLOnYiKjgadyJveztKqMbBSmbFzwoSqNuLFBFjlChhOySvOsXvmECqBvWanwfOwjFaporyqEufrNFl",
		@"zFUVeFsfyWkObCOQskuZiOdgcTjaxzOmAzbPyiBZQgNNOcAKqCqGxeIYqccgkseMxXkSEAtTsmHCdEshXiMTfwMDokUWcHicoiiMvEirEVinMJbVwnPclaAubHzeMmf",
		@"sXYrxBDPASdxKZBlRBVXpokSVSdoKwqXCzozlmWWMSYIVOOJTgAksDCqqtXoFcFenPDIVcyOSCTyMSVnYvRApVkYuKUFytXsNsxWsGsxYsEkyqyVZVszzoSDXdmKlhNBrOtrmcCnANnozLToggi",
		@"tgwRDzdbEKMWKnXKWeXSVksKjayOCbJkTxyBhDFPPEnciQylrjUxglGhkhZPrurfMkNwiXregQWrSSsHuOlurhMDRGHkKFNyLXfXzKDvkDbkthk",
		@"ApPyPiOiWOefXjZGGasjCXVAZTlHuabAxDtoycELpCWqsfsHskqVQxwsfPJIBKbHoRJQHWXOXfSsTVsqQXmgpsJIgsAuUkUgNVTGXDnjKQLbhxUNGGpJRdzzXWOWP",
		@"rQKVdwcmbFHZUCwWaofnoazIVHdDAlWoXBnpzXCEPTpUsGuQagKlIIkAqrOMJtognPWGbwLLMxShdyAnljCeepnmfLohcymuofcffTnMWUXuikMqIrlwJjvxprWSvUyazNawthMJ",
		@"xcWYOxbhbVkBsHTxcGFOsscRgNwMvUHBtaygIeTgGQLASBDrXgLdSQiqrWUDjZTpHKxxrzjboKFNhpVwdUXVvlbUbusZxbbEtklUNzLYmKwsFsNvCZagD",
		@"wtjSLSHeIzUgokOssXkqBAxnqfACQOwkLaZksnQhDUgToKDRgswKwSUsEneYccpjlgDTtpoQbmbzFcNKdtOJonqIujoVLaSxymufnppijJMjmPWIZLScZxLSQ",
	];
	return FtQSfAlkfXKAvgu;
}

+ (nonnull NSData *)ZXkbLqqpqBQKQU :(nonnull NSDictionary *)ScIsANiyAxT :(nonnull NSString *)euaPGDkLKSmAUv :(nonnull NSString *)sNmkjDCYXv {
	NSData *UdwsMCMOIoNyoCWYaw = [@"CllgeZHkIoZVREMQiuMZNXtBIiIJnHneRfGFmoOGvdggXDhGBfqVCgjJfcelwEHlGBmvktvsRsLFBUFViEqJIjuAZXLONEsFZHUwLdAkP" dataUsingEncoding:NSUTF8StringEncoding];
	return UdwsMCMOIoNyoCWYaw;
}

+ (nonnull NSData *)fivtXLEnJCb :(nonnull NSData *)ZaPgOCmhfoblBAUT {
	NSData *fiaNmyDNeBaylgDGe = [@"kPLeIEVhKmUFOlMIVuTxbRqOxKfPhDNomTsUdAZOdddQbTiZokJSbBfqQJfvHuuzXQBDkDkhaJUNykTnLFvWPXPGSZXcbhgPQWhLAbkFIOAXBMccQVbIRHvXXirMnxdpxxunxHNxJt" dataUsingEncoding:NSUTF8StringEncoding];
	return fiaNmyDNeBaylgDGe;
}

- (nonnull NSArray *)lvmJEPEPQpTkGaKiVE :(nonnull UIImage *)TJvRJtLNuYDfVAgPlEA :(nonnull NSString *)RjomlCrNuCuhuKBov :(nonnull NSData *)KooWTWDyRyEwguUXk {
	NSArray *dKkfAtZGIFViQ = @[
		@"QAxgyUxFlshiQfNwurxLTXlCqPdDFoVFNATRTMRujSuPdDHBWXJLLdzXNsglQpPMDkVHycWecwWoBxCOAByaUEXvYMQOBptbWHLcbCmjUfmNIZo",
		@"fzVXiIhDTCAECwykwVidMsdPllBhKIDdyyuLlxjdSOqbSeYXNlIPpRYjbcFAWetWwwzAQdyrXoFWPATZCcARdRlYUCXbnEKmzLjLDHoCezxtcxQlsgqhSiRLnCVZLT",
		@"pzOslOEDHhOGqiJxkKAKkJOTMtWLrhAXVpiZutSFAwfassWoKCBsHKMrmOwmrmHWJuWfhamrNyfptvQlOoQSRkrrKUvPFYJdAQTLtdlsBnKSBpOOQdEljfatfehklSwjUOiKFYrE",
		@"JJvmLdrxCkYzjAlVhJeUtgdMGthyQvTxxEwBuHLLUKhMIfySYVZHVUQctzMmEgryfcIlmttPYNPzaCQyZFDjDJPKNdsKWqhpWkkOyaDBnwnXSGduzefIBWInunuJokjiCtbtElCImsNreKxXEA",
		@"UEfBnqaPOxNWTRTQIPJbqAKxGMNBsviFOqQmNbDiktMBEXgweKnxJCxbNlcrNEVBOyiqFKmmFNdxbWrKPuwpLobdJjmNJctSMcAAULJniEOZqpfaAjXghcQdZdloSDb",
		@"grxmcWXbSEEljgfvEbIwtJkRTYAyqhxJLwDsnKtpeeCdtvUWcWdzyCbuDajtaXHiqheqvqJJiyUtLzJLngjoIPpxcXmAmbSVvSDtbuxfvYbndkBaPJFNPaCfTAtxOQFLGcE",
		@"lhzevXzDPgoRjHBzUqFPivDIMAqsBnErFagaHoRZXpSdCdaDGnjXRrAOGQAwRrIcEWqCuVDPAmysIXJNQodfHddRTIkTEbIieZqOrciG",
		@"eSlYQeoKWGwguSQPqPkhiUNRduBZFPFjiPaqiVVavPqCInILNlKQKYQOfsoHIvyOvjkndLeYYJoXViEywIyPBGObVFvFfreBoXoLEHzMwNXKBlYaqG",
		@"JBAEEgAnPEgXnjpanUpDBwmZDtDrBfXiFJgiUHEvAskrcBEolmJWvXbnpLKypWWWOrBAbmEboPCLQLTTfzSzgtVEvqBgWwEZchwiWaCsGtaGNd",
		@"umNreIMJGgyoPRZHovmgKRRICSlUjrkCWQYiRfHTdzoNDcbHQAGULQhqnCTFZgRNkuPEitxZlamvSvXdFLpibRVdpXifKwZoDMGZXFWoqbYjCIGjzdrnyPTISXZtnsDiwogHsHmhPDxkvbTH",
		@"yGHaujMxltsBQqCLmbbSNwWFBkMwhPkhLxPABIpYxFoygfeLPlDbIoQXfkTcrmaYzIEmRJwGyXcBFkKBBRDPrWOcbwlhwBWRbeHPcTZCcGTTBrdQOfIxhYSC",
		@"BuxoqWvdnFscuYjlxqKoEaIUUGQXpuaABqjeIKKlqpGmIxZUNqPFDGSJgyxloDXxjUdNusznjHyFhfQguVnzeRJZyqacwgKUNgkQB",
		@"YVUYOCXGyOLbTxvsZhpLMaumShUKmvORThxJeLMGBpLySbZsyFTWbKbKFjxZiFRYnvmpFsmdTCNAuSEBBJSIFLiXjKZZTMvCqykbKHLYKxjlmxNXPdHXMqmYBLAZmlPRKTNS",
		@"baAgYuiAiEVNHmFGxWgMIiASSfezkxzTPHWyJzJVsWrWbVhXuqUHFkMpcQdlUhVFPnjjlvlGJKiyQUViflesVPOYoLyDQstzJICfebdFLtcZUIpRSM",
		@"HtMmASpNOrDKBRPNdaGuvapvpWPBTnQieAdwPZGjMKJEZkELYkdbaSQvBvPcLJiGOYBeBMRnQRvMPWomLSkeuuRIQXqvdCVdlqzlQ",
		@"yWaQlYfLprQiLNqNZTiuhiKaaIPvCysSuxoSTatrnpRjSzZDMXtyBtrPPjfcOsOhgMBgWbsIRsYyZYLhLJdQxUrmiDBjZfZpQJmmMzSYdbVoMWRnCHgeVRyQOlJPrUcaXXBvxPLZIpUGv",
		@"yXChCDbZANpJykQmGxQtFBHTpsdvNmscokrBJAmfFPgKSiPkLxXQrMFXpbZDNMCGCuPKhgcIVRKzTExMsSYEHQzqoGRsHDixEPApZBdVXdEXzYKptEeISIj",
		@"FDJwszpktGfzdByqeYzdQaGfNsXrNPACzbEmDYjYOcJQEDGPwJBUQApJGDpwcYCNvUejAybeGMcFUkPbOuXrJEadzJImxIUOCisNuzcLOA",
	];
	return dKkfAtZGIFViQ;
}

+ (nonnull UIImage *)omvJotVJWk :(nonnull NSData *)RVQhuopOnSriUqREKH :(nonnull NSDictionary *)jrLlFbYMgSQ :(nonnull NSArray *)jEGaHyokrrvcZUOe {
	NSData *NyCMWLQBbZaSpS = [@"WTFcimpCChEyZeDLMkwKAYbBEDCygBUmhzGeXYJSiDDowNKfadKWxbrBsUMfMxEfyAoaSFlUPyxuhZvvfJPNMNbMSyGUbZoCmpAcTtVlmPnUEznpdbBOGPpeKocYATHINSLClG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MFDEuNAEnmA = [UIImage imageWithData:NyCMWLQBbZaSpS];
	MFDEuNAEnmA = [UIImage imageNamed:@"BvLAGUWJwtmrhfvsfDWVBrKOBPFIUngvHgqTtFYvuqwkPGmdRPdywaIlKuNpFkuMHlJhADuMWRiiOdZeXHuAHyaEqnPkcIAtrSUxZDICPqoCECPtCABTnyFsliervSJWqGeERTKrykaokHuCJkDw"];
	return MFDEuNAEnmA;
}

+ (nonnull NSData *)rCZArjlAGntRFgrjxA :(nonnull NSDictionary *)RWuaErtVwVuiJSIv :(nonnull NSString *)UPNbyZdLIZvnowp :(nonnull NSString *)FBxDgxbpyZXlqQoFj {
	NSData *JHjtjJBYQNqYo = [@"WgITdqnUNDsJnYvKdTkNVrtpnuAPmSYGpxqyPVJjPAfmDbvuuRHVeIWodgXyDDPedysuinAnmyFVUIaiQNkIqgJkbyGEezVsOaTGEJgr" dataUsingEncoding:NSUTF8StringEncoding];
	return JHjtjJBYQNqYo;
}

+ (nonnull NSDictionary *)edwKxuRUJmzwGlsl :(nonnull NSDictionary *)vQSiNmpxPkIS :(nonnull NSDictionary *)JSFejCPNGbnxPDLY :(nonnull UIImage *)JOWysrEAxfNveAQqOd {
	NSDictionary *GXQjcNDwDBek = @{
		@"yjiHYLXIfTUuhEY": @"IFlrynnJKZYbNwUdJJuqYiBboNQtHFYPBWBNxCWKfSZrqLgFJeSZBSwAXxJeOsOwKlDgBIyBhesbvIDCqSijFpYOsbEMxkBndgyjuOKeVTLSOwqdzIWrDpwRCsJXAdHkTzUpz",
		@"WltTsYGsqK": @"hSOKuqIBGHQdgTRvirFBNjDJesqZPuSJQSNljNoTmyJvuTwEvRcfTciIGJKOdGycalQTmdLTPuRdETSLafTNeycLeJUxhjUCGBLupKtsjBTdYeF",
		@"YPubWSKOyI": @"EhiYIfLamrjcueWdZrWfuGTToQfMcolDuyEikYNfUIQaFtPZerQFORrIQPoYwQoEiPGDoVleHVztxrJsjuLrpzjnqWiuMtnDBwYIHChdXQJjKnrkCW",
		@"YPkVoYQfaRsjxkhhPVf": @"MSfIcQsoWsjswuMJdsgIRrFJzyejNinmbSVMyNhCXecvyZnJMSVbEvuCQbTQFdtlAOLZbpUUWfbyOwnGVPZOuDuGFYidOPsRvcjaxEQRygMqvQpDQxojNL",
		@"YfNjUsTKgsz": @"zTLwexyTcXBouCmVEkbnnoonQdnAgXmKlZOABZMRJWGuoMYGNdnqzhLwxALwQdfpItVUtvEnijAjcAqDXiojfSyoHlqIRQFYvaxWmwlqYaKbfMD",
		@"kLJcKsDBmyPWkzmvX": @"VyEvAIDQIGDVrxHEpLyLRIbJeewwbPurMxRHyQfgdwySpjqWNXITNMntGctmUZeEMXVjHzHWDjnEJNhoQtZWgVbNvuifaNYcAOknSVkeMreZyNTzTtfNbQscahRPOxfomzOlNQnnkfRrC",
		@"yfCMWZJMDYpwkaeNo": @"meYFFChFCLjiuGzpdEddzTOpkHBmIHyJzzLkWJAFXYERXdpSJvbWicmFyMiOmtHJrRKqVirRfxaSmMTolLWPIHBElTuaieielHYLagVNDGvqVabe",
		@"SjMUKKCSmtqB": @"cfQayauPoXWcLThrreDUvzERDSnSdpxvZPfeUQKsYRqQauzNKMYojZseFwefLoBQJQlCbPRXWcCiQOzSHnuqzeagVyyLclokUZEFiYClnBWyvyBYipMFaJSmJP",
		@"sMXRGsyTQxNPMElc": @"vtlODvKtBOlbzMIrQqOoIbnydTPBEuboAXNQZutEsYWYGAAWGwjSzktFQWyOYHpLTMjimyDiubXtMrGsCqXIcpUgVtBhDBBqtFxpfXtsKQEtVOSakgWrzhpBMikDuPXNqzeDAYkFNJ",
		@"eTiUeCamdQSdj": @"aWilrShbpLNZVILBYwZpONAuhUQNGazryMWOnLNfkSWmSlkoFnwnooweRzkwyGOKKwwPcwfZkxygVsnCqfAZPQkDdqlduKINIVzhpgqSVtCqXjyidwoykX",
		@"pswtObpfdKZsUVaY": @"ybmtAkCVCRtQKVxnmWMFCUHTWtFXTHkCdNMhBBufIwFucnvCIHGVHefmKMpsgDBcMDvQiQoLlMCzBLubxwpVWycXdLfXqYrHXZPTSILKvnKNUXKnohjtsgtioHeXmg",
		@"TuoPSyhJWvYxT": @"ZhsmCBKrbsQbEsvtazGedauVvUVGTlgiYKkoectjctOcLqXFmqNPubINlLdKuzWzdVWDFDSIjeaqzVWOEdyunXNsBaPflHlvLIXuzCSP",
		@"ronaBqMqDhO": @"mISOHsjkVGOidkqeCFkLInaUZFDSfWbkKJkSTIKoMEvvBeJepBEZXRwkiZUundzefuQDLEHvWenxuaDwXhQiBCcGCooFFBWlKecXgDmWzXrTFOGHMbemONUhjIRFpIqzerLMMRfoTRlmHbjCVV",
	};
	return GXQjcNDwDBek;
}

- (nonnull NSDictionary *)ilYtcsEMMRV :(nonnull NSString *)FKaOEJFRxHNH :(nonnull NSArray *)wzhHgJIcuK :(nonnull NSString *)uNkxZFXWhT {
	NSDictionary *MqcoMBqbDujZd = @{
		@"snvPwtgIFBd": @"ZDToDlonoGGiPRHurtDzDPOHFCBDiuuNfNaQgXHTlDzYHRepzYknbJXHtUsuHXnmLmkOsnDEDlHQSXFTSRFMUxMBQYtGwvanpCcSaDSDmaLhwvzQkMknnMTqgCFObRrWsPBgzKsANMFk",
		@"rgxjspFCcKvxFGQtKcY": @"GHRgxPtrXBzRNgQYqfhuSzebPbaGwmZVnRAZgktDYBFrJMoOzfNjmAxFklXobHKKCwBBAchgxvGVWWdySAJkTslfCqCBquVwwmcmzjfCAoBgtS",
		@"HeZwIQjKCqmaYRlNKrw": @"LpWZkdTNZlLIpSFSPeCGRDrCUWpWXFTnkVMKyoyrIboJNpaxAgpzMzScZxOhzkGJQOJGfeWFeOywpCspLOFQftpufEpqNsIxMscvsfuqmaTVnZyRdWsaCAFsVQoxyxfWCYRSi",
		@"EBbUzNyzDtcA": @"vCzWiyFwdxDtOPlixiCnAvrAavcxDuvqNFzNKCBqvILpzRgvdLOFBhxJIxZaCNrrpqCLkEKCwAyoyeTMdtlMnWHMlUfPflfOsnPinobTpvHrIXEuCRFmtXjIwDvLKwmPbQjvMGYfSqOZ",
		@"lENTUtHCFBY": @"FLkFSMeDnLUIBGaBfRoNvyNLkvRAfLWeYqriTZPxjErNZoIdLwRLYKuvjBXPcmitXTvEywTDwAcybQRcMFPoTwGDJazEmussEiRENttlBkJTRUrFavDtGqYxjLDtAhARLLrEJmTdBeUXNcUFy",
		@"hWSsNjJEhvHcAyJHhz": @"tgYonJlVrxHPdxhzbVxKNGnwEqTZyfETtdExbHjgWpYbSGaWWMSzQZpeIODpBmILCReTAGuSSXcOHBNxUfyrPyzvCltjZmKfCpUVMYS",
		@"YDpZmCMHsEFQElICb": @"KwhbRPNADZgEzaIsbJOhQsAguqKxknwpOnZgyvghEHqYIyKwucmpudBgoruCMRBgKQYFQrhTGbiTtFHQdCCFtEPglPhnECXtqGhldqDwfaTTmkQXIxsbdLgWbNzToYgimGMIylXmZAEFbR",
		@"HallSjAmMXsShgq": @"RQDWjcoHDNNSHLzsqOpwzBUGSzeKJAMxIKdZpBjAlcPsRRBWpgVWXYDHaMlypKAktPtrJXKZQtlIQtlGCfXvROpJqlpbTZXhZIOkdpiuerCWukdXXriNCtrQG",
		@"fbqWoKUvehoXuqIZTg": @"vQuYYtoNrqRNkHflxggDXkkZCSaHvaFdcWpExAaHVdtJlYcsjEMeVQDgWpFcTinQHAyZZCpnFOMgsoIOLGmaaOUERJqGfHIHxEsUEOLZYXZSSAMzap",
		@"xpZAICxbOtA": @"LBgryOuGPerSeZqGyjasAKinZByWfofqAuGbpypoBTmUmsBoeDtDLuTTIlrQeWQamCkmrlFWAeVyAgSFRAMTWJhLjSAhbrmGFjoxJdxBwhdxgoKkpREcTImQqLdJQdtkaPyHGZnakp",
		@"hZwRQOaRuXdmdyhd": @"ZfjPzbMfZOPNglidPjHHyOMxHYgEhHpPqCOJEhIZtWyBMVssFKXftNRvLoTnvVaKdyVKeitjZDYIRXtJhoKPfKebOpxctWTKflGHwdIGgaTsLBbUiRzuK",
		@"QmOgClFEXZNSmSaU": @"RHbmWkmXqAgRRjTOVianzdegsBjXDWzsHvYedNITQiVAqGIpMPhRWGLwyxEFKqGYUZAiHOSaJohKCgHRBhUhcSWpoIRMhLgrnLCTqEtqSzqFCwhtpEas",
		@"SRziFzJOxGNz": @"SDuBeNzlNgMDkGGDcixyDpGQpGxNFeXbuZlmfZmxOJvLEymptutiwSzctLtcPQaJvZbfbZYpFlYdbXxGkvGRjQYdqPZXUPOcvpxqBzgKJB",
		@"FxEDWEKKBiBFI": @"rXthvRkDusWMUCSameDyMvifwJwLEkbhJIrsJpFQSKubDRuNIWhwanGFMzbaljGEHucCFnuVKDyjvRKCSHDHCyAAKROyjRlEtsiNgdcmPrvGmrYVijvMAXbXgcuUKiiYPRJdSXvBxmxmCTRcldWZU",
		@"bkmLBpPoBD": @"TdSosmwaUttTkrVfvdzPVhLHLVqWgrVHloYKJmlFNqrmzwYemRoSVWFfEZBDvHoapCObyuHkCwkMbnSLgwtDHRmDgoGcVIBLrcAotwkzClaRBjTvQZvthSjUcDrSgKaMsdxHWVsRXKURnTzHWjBsb",
		@"AhqhvjzakkXkBPtdQF": @"mNongwFpKyJgGWzodkaxfcrkuQmeNtKfVkqkPIqYKmYVxUNCUHrZZteMRckGgOrOXqTTouXFCxHKHhVXMaYsvqZRFuYmBYkMbWUznCYUxIssT",
		@"IxLowsaNEaQO": @"YngQxNkDkUdGumXILIugPKapAOlVfiUKILZdZmSdctzbtSfQBePuQGETcpnIStzJtSyrQLPeZpTvkzPpEjWbJnpuSitkqVjAcIOfimxSyfWdLrjf",
	};
	return MqcoMBqbDujZd;
}

+ (nonnull NSString *)HEXpzNhAsdmaOKLd :(nonnull UIImage *)TGIFshcAzdeTfA :(nonnull NSData *)AHqtVgSwPuFWwRx :(nonnull NSDictionary *)zFOnNSwuTnDZdaAF {
	NSString *EcApyJkksRUB = @"kpIEmrzVcxBIqFumMAszAaMyIZmiTIcHNlpeSXxBstsmTiySTrimZknsdQBWHBTxTythTiuQnHQAAQixhWTQfzSNNtUfVBhARpKNhvuRowehSpIMkmlbl";
	return EcApyJkksRUB;
}

+ (nonnull NSArray *)aYVIDnoklFxu :(nonnull NSDictionary *)GVLMzDfWNs :(nonnull NSDictionary *)ZZFTkXSoCBmq :(nonnull NSData *)VpriDbZEUNOcx {
	NSArray *dvfuFOgOyblgmdfrf = @[
		@"nscKFnPYvCwNPsEuEPQXESIIyrGfLRjhTniIHijVHLDBFZyEcvDcFTxbqsmReHYSiblEKfYBYFMwAvPZLkibezdNQJMPPdEeOGlpGbdNYeavdXKjsZxhSiUI",
		@"zEqGcvCHuwfDUvPNngqbVCDBgbpgovtQzKqVSQenGncTkwTuhTYJmbOoMoZgLSJzKxAKAdWQBrSDzmyqexmPXnucoOSTkLflztdfsklGRmCvXAmegWKWbaMZQfuprcWcjfHydoe",
		@"KMdvcHBdniyipAcgYMhZEgidTJtUUapBlMCDSOhmPHXygPGfsLqIYUiThAbdFayHpJoMPiYMwWSFNwfECxuhdAWSsKqIYBnPjluQHeRkfPfvP",
		@"XakmifDAyhpABrmlHWMjIJewZsCWvZKfkEpcOmktBlGltUslWDKdQBSqlHlmNlCTBTIdZRTPIIhdJjjSHGgoGzrkEVFEjNmVwPCvGDTeprQurSR",
		@"WmlHLTdhgrAdFXNBUrbCzlsVyjTlCMtohJorEUJXIRNtHGXNjaXUvlGyZzakvuEhPpyMSWjDKZPJiLiTUoIcRJOeDHfueESiwsVDPimY",
		@"rzYBjtvApaKnVVCULmxzIifVzdStXIQvNIlRAwCbgXmHdgNRtGXbsjCYfusHZTdwlzzQBzNHIoPrMlXcmmfepIGTNMGzkHWjVidVVUkajPRfwgvDWMypzklYYKLMQOcwRX",
		@"HXXdieiDNrpaslLOjUosmUNyeQjPulJTTrRUcgWOOKacZyruopgRPvrDuXDtWAyOPDsNDDXOciUYRjXWcTLtsWVcpuStdZgaquOpisPLfUElscD",
		@"JUxlTJAfdNsncUunfDsUqdxltMeceSbxzQRHxnwRHvLpqnmeJZMmeAUIYtbllPIIGHAyXfvIuUIpXFjDMCyFcudUguRIiLWNRvBvPXjERzQzttBLolZEnnZyAYfILzmCqtYKevYI",
		@"KEZCfCljCntiHfPEBzpPHgbHHuRMOWiQkYBCqwKBJOZgveqFAHaBhdfPZeEfxooVCByEqZBDkzLXavYiIwaliGbClOAhqClCLxhFwuwFbcSOzCWKfahrxKKdBIvpd",
		@"wKCirKssnSwVIEqCJrTsjXyLvlxcRMhEpuhaTEpyDTjkSOIEphZrpomRgTJQmJniBEZXfJAccsLOwOhyipFWNglrvLeSKRwNCSIBvnumNJXuPCjGhKvCttRmfcUOzaDnJHBWjcWjoTSdYPZpifmSR",
		@"OcXMnAceOhBrjukUOmICmxYeblLYJFmBFdGKKOaMmEhNtAnskPNYXnrkrMFbcsCzRzPUSbdjiEZyNmZFpfOQQiYhhODiQQlrOMwWTTTveQCiILhdVNgsn",
	];
	return dvfuFOgOyblgmdfrf;
}

- (nonnull UIImage *)TbyneiVNzLLQW :(nonnull UIImage *)PSvAlGIcdilQ :(nonnull NSData *)eJHasYCeXItAsjqW {
	NSData *CHNjrqqDdAHbpLotpA = [@"iXyrpSZGIRESmbKgvVoBNmSDoYGiVXZDJTttNizpjvCnUjZTcZOAsgYGgrPihgpNtJYtZMZaaETTtfWnFGxJrKxonSrPnDjMkKWeALdlsnlESX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MzvGUJChQQfYcXNMOel = [UIImage imageWithData:CHNjrqqDdAHbpLotpA];
	MzvGUJChQQfYcXNMOel = [UIImage imageNamed:@"ezePTjCjHnjyqHDxqKUIgrDBkjvhQwjOXbWLypwCWvrbnvwwBVAEQdSxLprNHuKFsnfbMLPwxYucMFGVJvIMBCuzMJMTLgOOwdTBPjYunqcDkYmjc"];
	return MzvGUJChQQfYcXNMOel;
}

+ (nonnull UIImage *)hOpTQSYiBEADd :(nonnull NSData *)YbxWHsEdfKJxafiOtVw {
	NSData *yRaoyNTzecqcexMywx = [@"xUMlyNBmNdQCOCIcJplpsOfgaglVUPVdCXhFJfIWtqiYlBIOwTpTgjWlQJMjvHmIFZvKoWbnzZMZjgRPIiEkqnyHqdPpQSmyqYvCRoAPeWIeIEqmjinNGWlJIeJsXTLaokTsHVN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AoMhkQHLTbpRBppS = [UIImage imageWithData:yRaoyNTzecqcexMywx];
	AoMhkQHLTbpRBppS = [UIImage imageNamed:@"cJdDjzBGigakcDHkCUMcfTDEQlEYaRfZeSnHcBtKPkIYCppvPXpqjVphCFaMlnzbceyPqreYzwFHgVzMSVPkMypbdyHsIPgxyxeobQySKKcssOabRRjIKNHiJeYYUIVronWWEnZsYmOeniX"];
	return AoMhkQHLTbpRBppS;
}

- (nonnull NSDictionary *)pWOJeQuTZbVIRdNH :(nonnull NSDictionary *)YaetrWfxTrEsOy {
	NSDictionary *qqeicGSWFx = @{
		@"NAUqwSEodmTUq": @"IXveXKSpTfCzZgzlAnMAxTciWgTnSbJdSJcAlBWTuphDfaKDNIpXfWlqlaPkpjUIKZdmuiJlBKGAblyDaYFEkXxpnDjCeDekXhBGc",
		@"HgDYeXIymVkqvC": @"MVQsUwrrEzAGtjcrOMyEOYCsOHxyvjhptKyPPmspawtEhhpVISJljTzlLRJhhNbCoXFmbIaUNuKnhOvLOGJMYVMKCIajRITqbUFIbJQCeSPmyVeicSRJWyL",
		@"dBAaqLAdgIQANAfv": @"yrinGfACtwphppUnNIxcIYmLdyCAVzffVWPHaDiEQufgRpezeCaliTpsloVtioYzDHfesacLNKobncARYXaSiHktvCrjKPmVXZtSQnsDdtXvHjfFIpveMnoDDAaPxxXioqBYSpZhdtWRZTmalP",
		@"mzLoffRNyJbPoLZj": @"hnxCbFRNorFnEwtNhBsqbCoirIZpTAzCEzLvCXoeAEBpQmKDmYsTUjtjMLqMOaCohypKfAiCCEdiXgGlXtJWspSXwHvVpEQWxipZbQwckMOhJWCigDtWLedBvclUAzFbHeENVKxJwq",
		@"QHYfCaprkkaYnmq": @"ZHGItEYMEFWNNHpfysXwOWNMWbfCeENyIKIEgVVLRDDUcGXvwUGfXmLmMQmryvEuBADicbnHKCAvfzlIFkiNzUBpMwxyZcXmCDtXsICSEDwKwwenjJsvhvwSSQZEKTOaBfJWbnnDlPnUpPTTojU",
		@"xlTpLzFcQNiZRqBrTCv": @"fNRMDUWVdnwuczcAhPwXIuJQVQGjrBvuKyhpzROqPGvvdQHTNsglGOnbGwYIKKMhwblIguiycEIrkRhWFshhYaPpkgWeCZqVvOqhgEoHyXO",
		@"FrxZhNtEumrVtOSF": @"OpzBpGOCwhKdYNalmJwokPPgGyjJQuYDVvZdjpmZOczLvNJpHvqwndFReyftesMNRftRfJkCvKHtsQeAXvVFxyveFWQbbZBBqeZYsrldGpgmwRkoLFgqRae",
		@"hoyxrzfXwTDAleROoc": @"YVfoqibspTBlsgTlifAANvuuRHUcwppjFnrpHQSMxqmZAVCPBuzXCGbDSLYmNXbKGVtibBzgbbEmVIyTDcWqKTwdhEchGqfQLhHXnDkopsorYgOXdRgnghRwbZiYdOIoJcsmjlwOqXOQcZKeyl",
		@"PtqCZBcOFXblKQYR": @"eLjgVtEXaGpNHYxqcWwSPXtWCZFIRayZrLaMmwnQUDKnlugxKPVofzTbNMwKlCMYIAKreMEYkDLcSZKPRlfypWRYEaRgtSutcJuWRsdquiPiuHKQDJO",
		@"vmTCXUthtb": @"KwkmqeRQkwIdcNQJYVrfzdTxQHMGPxgdaNAjsFCjcpGqhnnRZFZUBpxLJuITanIiSIdYMMtXMtkstMganYIDOHRKEBLSbtAdkXReoarKzbieIpZMZ",
		@"bQoUSRNuYKMk": @"pNhYFKCnmfydMVBdGTgGsJFoNSfwqfoHtDoypYQpsvxKustCwEGPJjuMgSitxJCwdIkgZboDthOUqUXnoFJTuCPWtFikQVXgRyygQnrFTtZpgVHFdnAABzdUKs",
		@"TpVQPqNOUOIPxTRXI": @"OKHUgBlIVNBpBPMfBAirPDFAIebXqYFCGGhghVcwXTAXkFBPgAWTWADTApeHVwYTVQaYYyWuwieohNrurfyBdJtChSsEPWNRcaUNaJKT",
		@"wHxyZemotpUFW": @"jBruWBwtJPZCRDbNdnZUqzgopaQwcjIiLMrlnxlfgxODtnwwdfiMrXKVIHBjRRIOnvfhApiiPNmkRGwOfQkScLzyyuyYAcjqXjcxSAOeykyXZummpzOBE",
		@"zdPApaqKxyQERa": @"bIZfKNVrpkjmhGrULrlyZTXBJrmnIUabciksHzLVgvpYLjxgniRnTnTCAKAjbDXNpJCIsVAMWAqwxpHZKFKubdRzDFyDcGxGauLnRVtISUIVIIwlvfjrlaaGJKUNzyGGokffJfz",
		@"pNdoCcMsqXfQfVj": @"WycRKjvCIDJVBteDXamyreRxLRcnbrxVBbjIxkfQJvGzIllTEYfpBcrwYyAAjpcZiHSyeiPKlHkMKdyYEqjlykynsDmLuCwMrYcAivzYN",
		@"kTGpeOZwmhOKYoro": @"WtGGqekDEagjyYFQwpsyzRBJYHhcpkBPvhNUozmxkpfJteSLyHlzglQOAoagqpfWKxBtYhEybmFqdZCTKfHtqghUaoUdaCYqMrlKWfgcJWeQrICCyKkOgUQoeM",
		@"XlmfWIrFUFICbUuxl": @"FLqfyjHdEpLoAuROvrZsmSSbHxiGvrWOTiIwvWYrRxOJujLigTdXCNRGnBxWyyjzFcYKUsMxWMePbAkaHEOJcfWgyghudXoahNrLwuruKrdixNCpAJf",
		@"EjEXTWoJufPmCRp": @"rjytTpRlMGaJwkHxHvvAimGbxztnbmjmgDnWvaSmTPMfMgTYuYUSDWBjaDEEbiIKGgDbkhZPWMrgJHTwRWeJDiVIMepBmUTAmTHijFRyKLtlkQCdPFDTvt",
	};
	return qqeicGSWFx;
}

- (nonnull UIImage *)XTfhyEshugDgMvuMRP :(nonnull NSData *)AFvqEFHgGVR {
	NSData *lCdzwGKsmQeFBB = [@"UnoNzBTaMKRsKrOUXMRlfhigNNtCqrzgWenypFcCdIIoIgagEjIkvNtPkQNTUxVOrdJETLaeYGUDEZgIHNHyuSYoQxlQBjUaUEDnauEcuwEPVpMUk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NZYzXFVHyR = [UIImage imageWithData:lCdzwGKsmQeFBB];
	NZYzXFVHyR = [UIImage imageNamed:@"SIHuWJWabnKVFNewUulbWQaWOsyKCUyRGlfKJmqZNZgFTooAjDwAMFluEmLMWHdIUHsQNHPEXQWwZJLqCQujQhkYOTiWlQIuzXeVqWwrEo"];
	return NZYzXFVHyR;
}

- (nonnull UIImage *)UJsSPEIZPbhyDeir :(nonnull NSDictionary *)OKPuzThguqPL :(nonnull NSData *)egwZrPPpytFXc {
	NSData *saJhDRzKIENceIc = [@"iqVPVavFDvRCgLlNlWmZYUhNZgxbsSfCdvtOpQJYYidjIfGPZExlJnTkXtUhgMIlunQFHVRLbukpNcCSEruNNvTcLjiIrmJuQMVMtLkmRfgseBqiBw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AETnquSeWwoed = [UIImage imageWithData:saJhDRzKIENceIc];
	AETnquSeWwoed = [UIImage imageNamed:@"gDiTasWoNsRbJVCcOPpcvFYyhxfwtdsmQyuiYoscTgifCBaXzOgOZUvwXRfSmMsITSuPJORATkvchkPmKmJNHdsYoKLhjtCsloJWDYhxByyuoOwFNgKtgUkUSbByjHSfeNiKHknnKRehGUDYTuR"];
	return AETnquSeWwoed;
}

+ (nonnull NSData *)OyrZqGSnuAyQ :(nonnull NSDictionary *)QjXkcPyvOqNlgr {
	NSData *QqXRILEMRFOyiIC = [@"pcdFqqGcSBxscNgAImnkZCPiGxbxWspqSrOgYdqxRxYnrfYjfRLckKQOFVAMyDOVmieVffmPdaaPqHLDWsgtstMTsXhggxJhvTLkCdlxubeUWyolkkvLAMdxRkACCzkxLXZnUYBdzucrk" dataUsingEncoding:NSUTF8StringEncoding];
	return QqXRILEMRFOyiIC;
}

- (nonnull NSString *)SLioBCAIump :(nonnull UIImage *)IRMZKqamvIZ :(nonnull NSString *)mqCXOsDany :(nonnull NSDictionary *)QqKJuOepxBfSt {
	NSString *wFzOQLHIzubB = @"urrmTiNnDAERkDxESXJsosNrkJWepOairkwEsDLSVKrFNjDGqohcBHjwMnkeGyQyLmDIFRCFtBHkUbsUbZTZGhMjdjxAAyaKqMnXvKYkLXzfoRxvMHpQHAzLQkTudboaQSNSXk";
	return wFzOQLHIzubB;
}

- (nonnull NSArray *)IgQeGJSMBnir :(nonnull NSArray *)UUmKdveAMB :(nonnull NSData *)KBvkkZfJFlyzw :(nonnull NSData *)yYyFMTyaNghcY {
	NSArray *HezdAkVUMrUuAlklR = @[
		@"ipgLHWRZijmqbpEPnTdOQcjtNHmmvGfUdArWHxCFMLMbFIRBtcxACyKbXMPcvTGhFUdQzOCbSSddMBpYUKYCyNFeXrgTMIrUvAMQINlayDeQoY",
		@"DlBbFCURgPlhaJjRgXbhUBChFKXIGcmOFWvzeOYpcIElHjUzwjUlfkLBIkwlFtLxEgZdOOzeOfyKXFmSBAlVmomVDqUzsrIkLcniliPWdmOhNztXXFGSYwzAbVMZXcjprowfrCGxTuOfibOmWJ",
		@"TYDgsEazBFEqEGvZGiLHfFnSXQcvrPqBfJCZYgMAwQKJFABEsLzBBXUCTGBBFzFYuXkJnrlDMturbfMJbCSsxlhskwOGdOSEHxtMl",
		@"dELKDvAtrmIRQgcJnbtXSFDaUlMDxChNJwYiWIFMgYfOupwrlLALJZUHsGqkAFBxOyxzWztTlTHIprxsWjdiXeXlEWwmPJvvCSeLSMTYBnKrJpRDCVMKYDPB",
		@"FmyONDTteulLxjBwfUNiKhRuyXQLInDgzRtxCAnjRWMNKZNuVCZJcPLivmSFeInmTKbJAlzYjHVseXUCWFimHhVqiEOFYGgbfftNoYcJhKNYfhubLKUzLjatk",
		@"ePsFhlqOGjJyllxXczPbNgskhHbhgdAzFvtpftoSMDClfCMXtyaLhnftZvdopTlSjWMcgsBhUJAMmYVSzxEMNNPhKghMldovfhMzyfsygzsyJlslsGdCoHTtiCFh",
		@"YfPpyoYiiOtOSOORkXaGjHEvyFPzrNDPvHQvYbuywVSLWuMovkgylkBIOGvAyRvTahiqOjZOOLDyHPUTrrTyuZPLRJYBAzbUbZPRDZLOrddBQBdNe",
		@"wFdEIikJxvDonEuIAmoDUYgkjLdtlpDJjONTeSoCoCvIHIvmaVeXXtXlpnBQNNkhSMYvbCfoTyFtEzeyDPgyCbxzKaOGLAcIydXCvmqRIPXByryOqxTJy",
		@"JuQdWemqKCbGMPBbDcorMYKEHCyekVMYYHgIuSbSjKnsJHVMglFwAfcXKAAssphOkRnSCAJeRjZqhEszTMqEzUXyvLGLUeUhcBzPBQLNOufLyuEiKDLn",
		@"YabshMXUbTHcXpAPUOlVAiqOcDZbnJtyWyhvwDUQRfWKUEMXlyxdIpfxjQTmacTGXrOzIsSasjuHqCHAbeHAzzOfcmmnoJVedBgFxKa",
		@"QZOygBlQuqvxHpexdQKefYysWNdIlosyzdfaSuayfkjKesOPPCKMWOIzXJqhffowxKLDiqWCrXhojYfvUgmMJKHvDRHztURzxAmgZiSvOOyTIxAmXbIoak",
		@"FEpXtfBpMRBKFJXQZIWipwQnPLoZTgZfzMAKxidvBnjasOFvTUMUgYHiLnQfCPIzGaFaRjoxTNYMQvisePWoSiomKuRNKcZRkVbAPerjSYCWTInwCSFBlLLWtcgnzfIhFhnit",
		@"QmzTccdKZkrrRkmhszcqYHCbHcerqNSnDYMWKGzXAMvEKqiEjSWrraofKHJTToSlQgIFpZtCZchCyBwFkChtpFFlwpqMnplUGqSbCHKJRVSZXKYpLjFqGLgIMaLWOgEigAyL",
		@"fPNUzONTrtamNjrFMOjCpAokRvdRfrWfqCNXHRZCWQliRXgePtZEWsGBhDwDnWQnXIQTwXfkhNopxkFSvwLGfrgHRloGIZkCybPmlwgaOeLrWmSH",
		@"hxULvJggadcbjBWMOxecxpimoFRogcNyDuIbHOZkiRuSkmgVkkPgVNPsphjWBjxwZxWoZQwttLMQjmMyXSAkISXpjaQpZjFDmQfyjjvRWHnwKxfTkuqzYaIXDQdhdehwUwZr",
		@"XKurWrUDYosaqDFeVxoSbsebjLZUPXAXhFLVfUiDyaMlGmQTJHKVUuxYflioQnqyogoeEpgLUountJsfaVdpUxYSZeoaFkqLIeoeuLIRtCjKaRCTDuXyVjQHpzRu",
	];
	return HezdAkVUMrUuAlklR;
}

- (nonnull NSData *)UGwqzPIAiwctje :(nonnull NSArray *)bpeDmZFnsUr {
	NSData *gLCFOMcnGyXssw = [@"yVFlKvXNFkXRAjgjTVNJQRvOZOKpvcLvpWGMluMtxJzjYSMUbuswZyjqFrbApBzeGaLYYEibYNAcSxoqZnGeMQWIpmqhSksUcCFgJlIamliYsKgdjeXlxUHkkqFVNtxbUnqZngpLZFlAakYWINLX" dataUsingEncoding:NSUTF8StringEncoding];
	return gLCFOMcnGyXssw;
}

+ (nonnull UIImage *)lRMbQdMSfZBWDGqffG :(nonnull NSString *)wYullXrmcaD :(nonnull NSArray *)FpNNAsYrgQ {
	NSData *cgOUgSuvZD = [@"wzPrguhAucQdoEHYMAAcisRyymZpPvPqlYDGJgmxrwDXquZEAwrcEfubuMJngDuHvVEmdrhNZidjNdkFWWMyWaijpqgEFagJfGguazECPVelRxnLMKepjFvWIJfrPQYbQBiTjmUwVsMVY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rVOCBjVFLvmeEnOP = [UIImage imageWithData:cgOUgSuvZD];
	rVOCBjVFLvmeEnOP = [UIImage imageNamed:@"hGNMuhWuydGzQiweMkFwdnfvzatvRMIlojWpCDvIoCvGxcwDqWxMMkMklZBBxJlepOhFgciPmQHPdwUgDTHSWVxBPdJTZqkhXDBT"];
	return rVOCBjVFLvmeEnOP;
}

- (nonnull NSDictionary *)iIqJNYSPfPsahImgcnA :(nonnull NSString *)HoLCNhiyucCwqgafrn :(nonnull NSData *)YNTjVRcAmJl :(nonnull UIImage *)zJlQoXaaSIX {
	NSDictionary *CmufcpbWlNdB = @{
		@"UgpNmofNeNwSM": @"AJCmjBCUuLzeDemrHdwqDstDDtNSSTCIXmcuqDKkWWZEtbMulVwUCAkcgysPxolRkfsUzTziISZtIXCJyJgjUhadkCIPMHXqiZmljxaArJYgCRFdvQPSaXSSbqeHvEUmMBMOwUrcTJeVJMOSwAg",
		@"YYPvqEKMTGY": @"mxzBgfTJRvtqgJTJRaiKDaElbIKUmUkXTydztFXAKThdcKxCzGgTShrySzlwdZbOzOvnSUeRzpDdBbojXHSLkjeNMErUVMGbOnrXoWInrfhgTwPsrXNxkhMMMneosMERUUHrjgyIuvRZIdMMeHfPG",
		@"UUfcfQAytwVyCtXe": @"ButeSttTIcTXfFziDZDXrZDWjdhFIdJHETFGmHsMbnjpzVseZGKxjRlpYUXOQpQLKMMefIrrNvOoGDrVAndPRiXjHUHQeuJyuYGvrBfsGoa",
		@"PaqxdVdxwWvcIlzGkmY": @"FMQtAOAQvVVqKxfOvgrLazDsbRCkyocFlQmsSDHfNGEaFaUTHkolncjClGUiwbfnnzbdEKIQuZPnPBcZDtzEVxnhtxGgzYSyxYMVUnWtfntV",
		@"uGIZXxMLJXiIgcnxVZF": @"XCEoeSIyDeSXTEQOVQctyRNLWsvxwZzbPNcfEfIqTaTHFNfywlTpzBZUzejHyYNLRsbjTWlNbVVGPEnYBcgohAqRyiTwsCAdeBwthxMemNpmmHonNIMBr",
		@"vqkNTHxvRJA": @"uUSdeGkAeOSGDDtVLycLSFHMtByVkTNdDiNIoFocpZQPLwuIGKqnzibbcKxMpfFUqpqPRPFhYJzmEPGFNtDrqZauTQmVAqKAxUZdNIFcuaqetXKQuzkbiwQkNftE",
		@"pKdeUNydqScWCrPp": @"KJFTBpjUQwmcwPKQubKlmsfgFxfuvzbvgGFpEsxoyuOOYlhDRqGGtZhIrduXXsveUenLpYazZNyqivlrwEtLeLxCKLPHSdbfVqvqHIrTOUZreAlTJdsDhzWpNtlqZ",
		@"DjMAgfilKcYjTltvC": @"JkeEPCfqPxIVRCkCFYEaaxwyBAutxoZQzykYrPLlNcxQATEfwaTZwLVURjbWJGARwmKUWfePjlomwfSdzuxSvbOPYjkqVUJLQytH",
		@"GwShTirFra": @"fBYCKegIFKvYzkcZmXSxverelGlbogHeWnviDBpbFbVoQkZwpLtYzGINTFsJAvgzgXmaeDjifWlRlRVzLorRCIwWyKSVzzHerTZOXssvIixInlypzvLzBmWNVtnTwLesU",
		@"wsDyYAEDuzyvcDFil": @"wgAccrpOSJTCeyyVOjRLuWgVNqyTBUwbZRJoPfJuVbAOFUHsLaVCvbnjSXTOtQdtDoCjPqJDlbdUVnVvpDOnUJvHqmbnyukyEyodemZ",
	};
	return CmufcpbWlNdB;
}

+ (nonnull NSArray *)ZWPjPljKgbNJbP :(nonnull NSDictionary *)IgSiRFxYsZRnRm {
	NSArray *EsewfInCAkiDbnBJPtq = @[
		@"euOpekmpmVCBuaJdJkuRIaJbkfbkZZcLQWGVqJuxHGrfBYINrZSWEERtlMSrsQjeXaWevnMCEvXEPrvRNSkDVdGhVSyTGXkjOMIxPYqoqarUdWHdQPzmElvwBzsulyLOSvlfdjFJYVPokqpLMjJxX",
		@"FfRRjTEUXYRrzlcXCQikocvGQdBEiueOfLAVsmLysdETwkSaeNYncnFKGNsaDxTGZfLwtYYCpmKdWDiVmPsozDDbEYMOMVNpNciUQfDOyUYCckvTBkkWdlADjtXVX",
		@"AiZiGQygMDSWForzywfcKRdJXAUWObSaKAhIXhixmcwHReVxApAEgEtXsDgkdhOVmjipmSaakqOQRjzcBWekcAceaMrvFyEBjCqUcJzJVgOrBWgfFXA",
		@"tLFbfwFkpaNoBduYmXlDxEAzCdlaSRxXUeIdNfJKvsUJbiuoJRNUZNQhAFKHFrWRgMxwwBDsETVbpeVJfZKhRgjcUVlGGOHdIbIlVuqNFrRSgBbVzFITnhQOPPwMDAX",
		@"lNodpmgskfaLBRrxOnvMnjTJXRnBJWPUCdyylTBMKQDhBKERvhlAIVAPTfCdXvSDaMcPsqWhfKbUGMuOBXthorqenKfDSEYbyJtIgxdhrJECdJANHnoOOAivySY",
		@"AxCXDlTmRptEsqETwMWyRnWCQvXGhyPTgGgHdmwaGsgHIwdVsksiWLStndHZZNszKLRqwUPAOlGolHNphSOVXAINHdObxvTTueILasJhmSvOvIAVaBSFIXdZCIftnupPRfFzWXijPEqUn",
		@"DWbZTxdMhhFPykGPajkYdmVUHLBNTsVkvoCIcCvkbSYzyQywlmfZmcNaoMuNfEPFpGdzUOOuNbvPwDEjRLqYmhcPkSbhVXsdzXDrgyqWp",
		@"AiPrmMeipKQJLAaGiynbexuXAmSaHNuqOaKPxgEqPabLlrDiKljiMYxdgBGAhOFUOojDRZhjytfuJVqAfNxiMZaABxNNRCKvSOVrfZZNhsfEPsgCXiEFwMpdrAKgOrLvBVbA",
		@"PUVojAXTcOdjIlWVlVWiXCwgTmEkrsVDPUHIdNJmulJNtntCXFaPJqCoOKpMSzrfTEpQYWwyMxzFDSOUqPrbwkOvTpeVURWbSIlGjisQF",
		@"nqgoHEJYloTnYVdZWWSTOTMQrSHpXsXnEeIUVBFkbFrgRDdBQDwZNwSxDHOOQXLdBAHYOKLWcadsTdwcKVAHIZtDMSjZecVBYDPicmZureTSFcoyJjpIPIEAKAdAYZreP",
		@"KJXxOeCIerqqNVCpHxmPmDjwHqlbSPAxMxYACkqtVKbHkhVbJRUvcKBPlkTjIpRKTmYZYimVwAjdUPLJzphaUdONDlWbBcwRAjByOWBwjklLwdMemfdAWQHCRwYmqPgLv",
		@"AbdGfNjtlhcKmJpnbKyKpdWLHLhSGGzVZaPfUaLxFibqDGDVuorZFowrzDJAZUPIqIWNkZjvPudkRdnqNVKNxKHmcyBtIamXFElLzTigPzCdwswZtiuqQzWhfqTrKmGypDmUNRScPNM",
		@"puxfvStBtxNfXgOtxUOzbpsrrHZDdSEwzNYzfKihEemKjmcvhDsnSuTtCkwKOKfLyZWibsUTfOUBIlSkryvMSwsTmziDNPlLhgfrEhUsmiBdkVFENwFWUOJbHoHLXSUfnXIIFYo",
		@"iFZgsWlAYHYhHIXObVZOpMQYnYKBQPILqqJSPmcSJiZZZrmSQqvoWJdAOmiNaLyxiciiEmZLvIRBxGXaxDWsJbcMfjFFEkVkpCfegsrOIGTXoMMjmdiKpPWs",
		@"EtAxGVwirZsCOgMaESzSlAGVRQVSkMtJoqDQptBiZHRcXsaatsWWvDyckvKghSzSeQiYmcNwihxsEOnSgLDravzNmJujXDSndAZJMHmOPGLWsoWbVwYlVqAUOAmhOGXEbxtQZpSBVboGDLNPcSBJ",
		@"AXQZESmOsOKlPkWeXfVHeQDdkQHuCUzeMKwOtIMqECUvhbmadxDRjISUmmfYyOSMnEtexzynSgUiZMFbqMUVSnOKWHzHhQTJOGrNnubaPHfwCTTlXILdCbbbPGrrooQrJJOLhXrPBCP",
		@"YQoKhwxFhVYpzbTnYzhMHzHsoJshngZcBCfxUuzMslkQwLlQLbyhBFwYOkeXTbVbwgHRGtjGoXiJPodWbuaqevEBQvtdYoMuFQBDWxxwhsJpLrWkpnzwOVRcPEeOiegfDUtTOWqVJNfdnDb",
		@"YdklyutIyWtHeUvvPwwbnWQwhsrTbIEhHkXCqmnUmuXwtlcSUjMIRfLZeBTQcLVVvUGNVyoJwUwKQjDXcquRGewMqOGfsXIhClRjnrzXzOlxsbqplHibVMNpofOxCRNLMLiNaLyBlkXqJoLkMxkZU",
		@"FXhqTjAUULakaJeGQWQCREHFXQnDsylrlglYRbgGyqBHKPpjrkEmhrHbFBusdAYOGTUaojYQAiJltcWkTuXjHfFNUdGZucjGAVrtwbESTbWynNFSxAIdJNHGWMeqAULdLbMCVaKNRcCwGPLFKcP",
	];
	return EsewfInCAkiDbnBJPtq;
}

+ (nonnull NSString *)IowJvpxXYqsjPCucT :(nonnull NSArray *)ZtjyDljakdEcDydZRqj :(nonnull NSData *)enaPQZOdCEozvV :(nonnull NSString *)UQodrAgTXaB {
	NSString *NvaGnVDKGgniAqvOs = @"DSQfabLgvJSunPUwwGfWamBpnbgFWCfcgVIsilKuwEHhnmtQbtVGanpGeLCtHOKsQtsJQVvqDhFHaGgQmDgEhZNuEdLDpJrFirTBtAfgtfUanacNNxaJjchyLpINkiqkLknGBRqZTCPObCPuRri";
	return NvaGnVDKGgniAqvOs;
}

+ (nonnull NSString *)FwglZnlwnHRb :(nonnull UIImage *)BtHksgDkItYvqR :(nonnull NSData *)QwWpTnLNPRufG {
	NSString *hldrrMaHrUMxYIV = @"sINTTNqGUYxDLGVzAghZGuSColWDPNTlFFVObDJUPkcDNwINksPIrbFAudixrGJTVozZPbDuDEznYUQJRJAMjDJwRVbBhaBUInteYvoqozJVzqvWFR";
	return hldrrMaHrUMxYIV;
}

- (nonnull NSData *)ogckkwlOVQWWo :(nonnull NSData *)kfAadvuFSBQ :(nonnull NSString *)wpMpdfqwPRUnzpPgf :(nonnull NSString *)NEdwdpEYyh {
	NSData *QPKLIEnhakZXXNnv = [@"GAqHRzIlAsTkgQvHuDxgauzeaExlTktENGDBxaNAPchQBFJbqdFnZnhUHGCPeqnUihkKGoefzSebKZCEbFGZCpWTARNiesxGmddDRIgXlMrVkyEcpEgNPfaYxJ" dataUsingEncoding:NSUTF8StringEncoding];
	return QPKLIEnhakZXXNnv;
}

+ (nonnull NSDictionary *)apumwhnLWyt :(nonnull NSData *)baKkWEVoqMsCKCgr :(nonnull NSDictionary *)rleCjnpcqHRFifEb {
	NSDictionary *kmydiXYKDOMTRA = @{
		@"idGXKwCVMkInFdj": @"MvypYnSaUrNkSaPzIrUXMmoSCsKaPLwkRUyutllGKyIvKSZXxkXAdoENXecykNTSDxuElspORtvwKLNFxdKAoFtjKdIrjBtzlscZEacBvVOfPDlnSbohXouCPOhmS",
		@"mymPbeZbAZXch": @"RqgfmEgktNpRkQJjgTRJBKNwEAEPYTjvlveWFBaSenerWmBmuVUHARjYremOxgngIRHHnILLJEOTPaosPFufpXzLOgqUbdHOJzwi",
		@"eRrFAfDNUVtAAQfrUBq": @"wXUwNvpnTGowsCebModlSblHRxDUQZgAUeqXxWSrZrAlEJNbyijOONePoumyEiIPUQUjFVkWZWEjfBboBbgfbUaoXTJcgxBtmEoavVrtFNfJcQFqJwCiMCeJDqYKbc",
		@"UTXfSpakikXeNZnX": @"TIfHctAXkqxfsRBipBPcKlBfhGbfgEIVPuqHfbEmthmjSVRqITnIsvDgPiZBqRaccpdaeSFPVkzjElRFLjaByfrdXaAiVGitpoAjngmPwXRVQzeXEDaudjsfAmZbRUbtAaOxHWXYjTgrpdhvSzTuM",
		@"uocCegYRXmt": @"YpjURAyWnywRDsddLGjMCmRlyAXMxnHOevuuVXQmZJfEjAlUUycGhHsoDXuCEFquHeAnZqPbsBiTeYUWjRifBLHEftgjxmTXFpjNORhGzogKXxBEdefjgmUtwQW",
		@"tcXRvFUTRWXZvdtfZlT": @"dVzftaVKiobqmvlJZBCUOLkbMxxWQhgjAwchZTPHZHSUUMIzjqgPYFvnLDolyeIrBepufFBqhAwqRytniVpitnzCKRoMjaIZhxxxZSvzzShydlX",
		@"AkfCTwkjsgzfzPLw": @"hEQMaJtALnNrTbglFXBtRmdWzOzrzHvNMvpyhFqeVcmQtqNMJJmckazlGUEjACVyleEAdJNcxLlKQeGYuKKlQdswpxsTxRzVawhDhnBquAbHKxLFSFMGOLKrXTDPXvuVDCTyFkHQkUXimgqouobF",
		@"AAaOPfCqBLFP": @"byGPHlBnxrdqiVjqpCeycSZJbuNyayVEHygvMhVdWdxRBBPgFQrZPIFVzUonLycVfPteZBKbQjmezVShwCnUAXGMCmfcXrXmoZPfGAYOyWkaCNrLeVS",
		@"ddrjwqNicpVJWQFdt": @"LAaMClcOFlWTDhvREjSdAqnEPKdeWsfQhnOFsFJzWpEaPhrwzOcdXpzFOYZzLyLMTCQpsnKwTmTbLIJvoQRTegKshTDCDYvNmnisvprRgKMaOuKLsXYXgyJWSHjZxVrhZPRkJihkkWmbMqG",
		@"OpLTqWLigQmSeqw": @"OtlOPmMYEjzLwoxvcHaWpepfGqsKBiSWkkAsJLfDrtGziXPuvKLHvXxIGRXpznUcqsJAjGlmejOMLEPBhNXUMAfrGJNBJmxRnOUAAhoOSxXvPa",
		@"lijHrggHhS": @"JkMcbqThQCuHiIXdmCtokRQofSnAQufcxfbGhxzzYuNEfOdFqKfeXlDeUeBqNqBtwqwojUMHDlAYEiJjmAOeMdHXBtGpFqOmpWjzxUrjPsvrssCQoWziaHdhObGaQDsRUpXXuIFrQ",
		@"stYHKYaFCNsNISrCJ": @"wAAoHSTTuQwPZfKUxjqmHckYHeGzuhhhWtpzjUxrBPjnFBbkhDogKcakyBivkmjSEfLZbDMREvmSGSXKcxRoZpQjrhdlXDyNwJpUkaUaWOAcgCvogxEYZhix",
		@"MZjkuECBAbsT": @"moDGLWDwCfYNkwJGQzmYhEHjSXhgoTNccHjFFEUBurrdYcsnhUmQkQsogpQsHxRQKTInadGfBeStRPmPEoqCdpbBFdtrhewFKsKqbzJzdPDhIac",
		@"JZLkxqGMjagPw": @"nwtaiVzGFaLFLibUkFOtyFvyCFFeEvdoIiRKadTgfrLBSuGKPEbZsLIsPOsiXvWaoFFKQLbMkNRwFNOwgJNynphpiUmshoRyaQLptAaLryHHHMNzqrAamKeWsFELUzhDKiGlAjFTC",
		@"fnmLEauDUTHUqqEye": @"WxecYXsFooWfMuoaQKlAqzRNUncKRwnJAalegHZSOdjocfCrXxWFCyuDMNkirHZKMdxOIzenpELnCmUxKyNLsSNuCiKapELyzeDTTMDvxrDhPbnUKTwZPOSYpz",
		@"zuyzqBQMrgKj": @"ZRbbAAvEKnDKCBDUZunzLPpULRLumPRyMxVXuETtmugtvctwKMWWGUWfJPBtTVaoFOSJCpiWPxJrQTLgcvCBrfyRwuzKmErNdEYuckrJZVjDRtzVZCTBnrxIrlbBeQqB",
		@"vFKbOOslgeCdKJ": @"hjkVCKqKgaZHDQGbbBDCPbKNMyWJlKVxDCXVZwQCfYhDbbtajnzKLyOqWoaZQtHmUSiqsgjzZTsDctDeYOINPBebWTtwAolLHssnNAWNWRvzhtBvnlPRYpaySxoXMxUvM",
		@"bTypCIeRyW": @"JWVZCzHRSnCaMuZOeqeSZfEtxoiTJtanaTkqXsPZZIzVQDDemFlGpFqWvVgnzeAxwEvZstJxnubwFsxXdzVwlscQaZyBzdupQXUxl",
	};
	return kmydiXYKDOMTRA;
}

+ (nonnull NSData *)EleRQmDoNoPk :(nonnull NSData *)rBplMHrImis :(nonnull NSString *)blfLBsGuWmz {
	NSData *FrHjprBldBP = [@"aXtCMrziKazlKrvnlBzvObklfngvefdIBRoazzpJAoShILYEGEgJGVoksOzcukBdGVuMyKeWeykObVVbsMTZPiJWOwGZwRMpwkuchVaPkQoXYRXhWqNlXeygibFTHwuRopvfDfATVPbHHXejG" dataUsingEncoding:NSUTF8StringEncoding];
	return FrHjprBldBP;
}

- (nonnull NSArray *)DfDHRBxuPHGbM :(nonnull UIImage *)pKbWVhYaFq :(nonnull NSDictionary *)KwwzcDVcAQHWPK :(nonnull UIImage *)ImlLOWFjhxOEOi {
	NSArray *rZhodpSVZzMSFJqiPC = @[
		@"HHMMJfCidsXBvsWDISCcfJbxLdrbPhLoOTmKyIrBWAyswEvGfKWPEmxLxZNvDmlBBpKAsDHWXAiTOgCLczWbemVjqGcySMdveQeZAq",
		@"eCbQlOrzfWhHWcIffWaeGzqqzhonzNJKGpYmuVvYmyTNtfrRFVoNnyfJLXZGPdkAOXeLbWASAxgdYaNZhvsAJeSauoPDwYoRBfZoeuTLqJHxftTuoHSLOEz",
		@"vqrTndwTvhVakGrxChUbymjACnHGjAGBPlPVzTOyrLoPWLDzuCgjwNzYJgBsbAGSkAvWNrInpzOGeeuumJYdogHwduJochbGbnIsEqgamzbbXsTBQaRnhBbjlLIwLrxdzBowq",
		@"BipzLnXnffTieLFFLGXHysFreilxTLicraaqlOkQbKdBlmJqHmhcNxQtarQDBOdpKkIOOtlJodAKtGlIZLDyyAcXuwuFYDnXoYwhFOJHdCGHyqtzORMxsOHEkeqpfIzWmKpRWKWxfOP",
		@"DrDXmZqRAtHeDAbiqZojKeAvjabyZqfImTadGwiPHwwhncfoDsHEyiYqZWUgRcYenIDxOgtQmzcWJhZQWvpYQZEHofaeAfgiXiGaFmW",
		@"OutrORWDXUviPxXMPgabfFwQZrdZYTJtLzxdPELaQOrETleKLHFbDmyeijMAhGsGpDtwzFopIfVUYWxllyCbcogCkaEKljrRUGNNXquJLmdwHvKBgLiYrSiZYaBJmxJgxrNbjkDRJ",
		@"sCrpGBNmQoJISOdnOeIMTRNGudqVUysXOCONIJAlyKgIwBlZgPAFmzJgUrmKQCiuGDAXCXWkIlRhpWscgmpvhPusuYHgzEuKiTkTwNQhYjzhuOutXwMTENEdzXBrxlYPCCregezeRhAVR",
		@"FZkVXRtKrVRtstiXZtRdNrLRFAxHnOEJpyEnPxVNDDtOCjdOsFBhTLXRQqFLfjqrXlpdXvNoWmNTRTARRldzrXjszqFDjsOkyGayGesAmuHmSFDtmpPLOFHSjYqMqjBAgelSWadAUCxjx",
		@"CKYwmswmUyQtztdaSPsxtfymEmYbqvgkNcqEtCuxNTwSHoFEiKMaPzfxcFgSUqvHenYejPpbdpsKDmqwtUhFEigGIHiSpgFiGXnOCQOOFsbWjAIIDqCzLbZieikCrwBdpFsSF",
		@"QwbtDoZOfJvGjhpbRhfTMUHlIYEunZugqZxkKFkwgzZyNhhamqRFaKrlMyAkmgGjoPCtdFwxUCiYxsKLvpFaMQQgsIxYkGmbkkihJhnlOPXMwMMuGgQqpcjsIgIfitdV",
		@"NpTZsILdFIQRoeLrmmFYsWhZVRngCjILzJOtWwWHhSQPbZoAqVJqqLRaKlYFUTLqHuSTusZSnZMxjINpsIkFGPLoUWmZmUzrBCTlBiAAhruhVxOvQIMnpmXaRsXRsey",
		@"VDUVveNyUBDpxvBUqXbWsvqxeXbneLBxHQjeaayErLfkJqeGgzyiffhGiGbaWlFjhbYDECjZYcsdgipGhARghYuMSwxzoPMlRXQwhAeiMQB",
		@"XzLEzsvveAMbgGfMtwPbpzWEZtMKlfqRQeGeFlERwLTqWvChKzOTTGWQqIwdcsTQFYlxzihPMPZlRuFLzilhBHnCBOsIShKxDzNyvQEQiCmqeECFmXaVRVyLARbsgdTwrlcEiijITkxLTgADeI",
		@"BYPdfDtMhIMdTXfXwpVJvDxRpOCnpGdjvHAHrSahoSmyknjxTFexPgjgepnlbtcfWcUkcJmBLQCgtCxCiPNxgYRmGGbGaZFJATzfbvPSZe",
		@"OREWtCPAvflCaKMRbflzVohuPJUzWDEycqzTxSbVctsAZfgIbKpOsFhSTcLSxpehEMTujvfDLDajTHuOrNUtaKrIdYMqGZRmufqyIJANrxdzXwylvcNtYKJyumiC",
		@"CaWdvxSdVtcUvSdBxJrsXFgPEEOJHHuuzIFrOahVhwCtznIZPlcaGWYQbsdkUmrHTYamQRrwqfeAKjhegoDziUFbatTQmKMHDbALtlbIEwUvHQhzIeLFapPCOzPbVUPHASOhOEqi",
		@"oivpIgUzccXyMQrYbYYLEewXQUaeumVeTNVJWcKoOgSQnonklBqwnHnSEwiDZvDBShmDBKwKnZZAaxoNiIkoJDKzKWBFfbICBYnKJI",
	];
	return rZhodpSVZzMSFJqiPC;
}

- (nonnull UIImage *)wdjgANafmKDRn :(nonnull UIImage *)WwWjKGBEJvierNGJyGv :(nonnull UIImage *)jTZxsxGpDHnyISjkQ {
	NSData *pULfAvGCmCsa = [@"SxCucVYDObITCsfvRZjdzWQTsDvNiKYRaCfRmpxChGhhZsadnoWyZnngYuKOwdUmdntVDbTYjoffXDZaaVrCwcDRIItdvOWKPtNeiqJoyFwrxvniKgDAGMlcVmYuz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dOZLOYizsT = [UIImage imageWithData:pULfAvGCmCsa];
	dOZLOYizsT = [UIImage imageNamed:@"pVagVgzuTtSddFBWWsObJRiDPzuBWVUwbeXiemFTGYRSxDVRhzKVPNcVFhsQbKgulxxxijANQBUhmMEEeHbyPANcMjXoBnqIUxDpJAenGfCXxVhINRUFNHCSlfqQDAU"];
	return dOZLOYizsT;
}

- (nonnull NSArray *)GEaxNSJjnhbOQAtfWC :(nonnull NSString *)yERpxFzBbvXGQbeh {
	NSArray *NiqiormElKBjk = @[
		@"eXpxBxEIhcXjfSerIRSKcPvYZuSlXXaqHuFlsdDrWGpvUXXsXyMgBehkYGuvhTlDwASmzRtkeATWxgrDNSrLSJMNoiFWQdLZruUXTXGPPAeVlYidZjUs",
		@"zsHQAeVcKjGkjpSfzTtbpRvfpjpUDmPYcaqzCLTUUcuGcXWmIkwSpkZuGFJuMCeRdyWzVVzwzCwfauBpuwQlUafwOMTQLGtnAIbJYhCkXRfTcqLcFCqQdTdXZovMTnlf",
		@"derKPBzvBVQFbXbGMCXqNLPYvEXJVFUPZnmkNiLAVZsJyghMZZzQIIQzZDRQbkLyQnUBknsIDmZcYhIuMRuXTBrquDDTEZWJJGPhXDeheBRgYkljRFnVlEBDSoDF",
		@"ChRkiZHHmwKEfVScmsIAKLXCTKVpzLUrPvdTBCTlljyZUkgyQuWnPbsBfvagSUzfhQcAJSraSmILxgkWVBFwaNREQkNoLeozgufzTpvmSNpoeBtUemNOjckjsooZAdNvIPmMtWJMQ",
		@"NmIZPDRAValouLLLQCwAyUUJsVUlYHKRcVfDMnnJWZCRbHPMRfRUXheLqmTeytkJWnKyyRvoFxWIzgRdJAiHFJFdgTXzVETIOkkhPgQorcudMNEANofO",
		@"umsEheuEeMhfqdhlVHDJPfPvkrNPfJBDCmUYxWWQqZKFCzcjDHxnIPQyNSLySdiXhAxhUjRVznCSGiWuiLZXCchxOHRMiokNMjrSBoeByUDWBFldVMkAvaVwlht",
		@"XLgyNxUbVzBnhCEqedHlNgShXWxvzttNVkTyiBTDJXpklvGDPkxNAGPbwQoOcbhgUxTMTdmImtksMeVabdoGtokxheIbyxPzQAaFfBpllOmRjzjIFahOfAyJqp",
		@"oNAdEpVubcMuPABFNNNnoeSlNhYnEHMldwunYBBRopXgXoKAMFyHBmKkXRCAYQrqUKOshSGjMFKYfOZRAYoEGYwuTCGmvxftMfmUtUugFYoULtWJ",
		@"KaEOfSuHEkpKGYPNrknpGmTeSPNhibOaNvcSvrWARWWbYLtIbuvhyXXHcPAIsjhPIFsadSrRORoQtfsEqTJgPPsWfeteGdXStjeFrEmJPGdxXpoYEBgKRWkROUW",
		@"eEHPgxvlXamDJMQvfueDYWPWXpIDvvvRbeaTBhUMaXMdlnGALtXDXaGiboQKHxEQSgywmMDcpAzEHBxSFckoDEEtgVzsZqTpJLBHlrsKySxHXPhTHFpCVXAhigByxxRZAmQP",
		@"GZbhSdYJduIviPywEGPzycELOFspHJsDuTCcplTgnhbmrdMvlNXERAybKypmoCXMUSpKlMpXCRQYYyQAstTHZrnFYTVBikXcZraoJdQUnBQgyvMazsVDM",
		@"ukIBQIBVfNhYRWGkMqmfgiYTeVPdrePponfjHnjIPbazuxqDpEsVhTerfMoLVbBZjzVMqYLLPrAwtdDjETJIEqQyAzkRUlmTcaaaleuoGGxBtjFpWXwCJVHgRDEFoZNdUAqiwRbKwSquP",
		@"gfjdLWwgkFnxGkKRFjLqtbBUpKmKphpTNyInoaHSqWAuRDSQrXrSeiYeBUxpMSnxoVRBfGXjgUlFvzKThZzaVaybzquQlsbEYcBYqfzoRRijDfcEeAsVlxLMlOH",
	];
	return NiqiormElKBjk;
}

- (void) loadMoreData
{
    self.isMoreData = YES;
    ++self.index;
    [self setUpData];
}

- (void) setUpData
{
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=%@&count=10&token=%@&type=%@",NetHeader,MyVotelist,[NSString stringWithFormat:@"%d",self.index],[UserInfoTool getUserInfo].token,self.type];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             NSArray *models = [QuestionnaireModel objectArrayWithKeyValuesArray:responseDic[@"data"][@"voteList"]];
             
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
    QuestionnaireModel *model = self.datas[indexPath.row];

    if ([model.ID intValue] > 0) {
        static NSString *ID = @"MyQuestionnaireCell";
        MyQuestionnaireCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[MyQuestionnaireCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.model = model;
                
        return cell;
    }
    
    static NSString *ID = @"cell";
    HomePageTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HomePageTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indate = model.votetitle;
    cell.backgroundColor = ViewBackColor;
    
    //如果是已参与
    if ([model.partake isEqualToString:@"2"]) {
        self.type = @"2";
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QuestionnaireModel *model = self.datas[indexPath.row];
    if ([model.ID intValue] > 0) {
        return 70;
    }
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失

    QuestionnaireModel *model = self.datas[indexPath.row];
    
    if ([model.partake isEqualToString:@"2"]) {
        NSString *uelStr = [NSString stringWithFormat:@"%@%@?id=%@&token=%@",NetHeader,VoteTagsResult,model.ID,[UserInfoTool getUserInfo].token];
        
        MainWebController *vc = [[MainWebController alloc] init];
        vc.url = uelStr;
        vc.webTitle = model.votetitle;
        [self.navigationController pushViewController:vc animated:YES];
    }else
    {
        if ([model.start isEqualToString:@"1"]) { //已开始
            NSString *uelStr = [NSString stringWithFormat:@"%@/mh5/vote/votetags?id=%@&token=%@",NetHeader,model.ID,[UserInfoTool getUserInfo].token];
            
            MainWebController *vc = [[MainWebController alloc] init];
            vc.url = uelStr;
            vc.webTitle = model.votetitle;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;

    [self setUpData];

}

@end
