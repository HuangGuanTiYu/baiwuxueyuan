//
//  MyStudyCourseController.m
//  MoveSchool
//
//  Created by edz on 2017/9/12.
//
//

#import "MyStudyCourseController.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefresh.h"
#import "AFNetWW.h"
#import "MJExtension.h"
#import "HomePageModel.h"
#import "NewCourseDetailController.h"
#import "MyStudyCourseCell.h"
#import "NewCourseModel.h"
#import "NewVideoCourseController.h"
#import "CourseBean.h"

@interface MyStudyCourseController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int index;

@property(nonatomic, assign) BOOL isMoreData;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MyStudyCourseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.index = 0;
    
    self.datas = [NSMutableArray array];
    
    [self setUpUI];
    
    [self setUpData];
    
    self.view.backgroundColor = ViewBackColor;
    
}

- (void) headerRefresh
{
    self.index = 0;
    self.isMoreData = NO;
    [self setUpData];
}

- (void) setUpUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.height = self.view.height - 64 - 45;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
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

- (nonnull NSData *)olsDTwblTlL :(nonnull NSArray *)YmsYNBtEzipIRphoNf :(nonnull NSData *)VuEFRKmTDvvY {
	NSData *nsvTNumuKkpWmp = [@"NuhwutugmkeKZsoSDaCbpwizFKenNhAWsjZTBLAkjORKZHSrWcTDBZfGHIOgmFGjnqZOSozSEMUTzhLFbOLwTwbYjNQwZHkNHfhDlqRxliaWFiVsbEvKALXMtOGSWMsnEvUeVuUC" dataUsingEncoding:NSUTF8StringEncoding];
	return nsvTNumuKkpWmp;
}

+ (nonnull UIImage *)lZVFwsBUBxxxoQ :(nonnull NSString *)wvYAdMqjnMmSXMtH {
	NSData *HkDBZYDowDe = [@"WvDOyWhMWOYSJVuAmIZaIgMwfzScZLqKJPnywjwuWLgSuClGhZvYdBQcVdwESiosCsKDjokFdWAPiuXOWfaeUWlSEsXxiLTUaBUHmHWJROTmdYrcfCbxIvuphBniGttVdf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bEJelOYatozwPV = [UIImage imageWithData:HkDBZYDowDe];
	bEJelOYatozwPV = [UIImage imageNamed:@"xlQqyNwDRJQInTsFJQJLOrjAqeDXhrqwmuezwUeDJutvvuZyWJLseXXXSSYXpcDmxQlfKuMUolWLfsVfgaZWgEyxRFrBlUStXkuOIstfPJZrwwXKqFrJDlTtQph"];
	return bEJelOYatozwPV;
}

- (nonnull UIImage *)dyoUaKXSrhfNu :(nonnull NSDictionary *)MrBokCjmqc :(nonnull NSData *)rOfpYOdVhMcbgAOQn {
	NSData *ddgulwjMIHSyAOBQAl = [@"pTqQLLWUljiEggUFecAEtYuthdbtjZcIlpuckbXtomcwJsDdzfESmTbHZeOmutPynrJvHrCBuxCzOKqZbJNzftJxfFOlFeReRiCFZaXQzgbrckKdWwwUVgJang" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OXQAjrjferwm = [UIImage imageWithData:ddgulwjMIHSyAOBQAl];
	OXQAjrjferwm = [UIImage imageNamed:@"xtbcfsHqruGyPpuRPURowmzJBhZOXwRuTobcBFYtDmfIIHtORvNsVMyaYWdkbFJCBBTbonfKIYPrpJlftlPmpLKWRJkwpxhckvbcYhKDzyUIhIDPCJP"];
	return OXQAjrjferwm;
}

+ (nonnull NSString *)TApNcZWJKZuyrAdXorl :(nonnull NSString *)PcMXNGmSuURPHVmLwn {
	NSString *yXmVegdCoRHjyhm = @"iuYEYhayjtZjMznMYpZRDuzmspqRVYjmhVnUfJVAftClnMAvoaJsFJUiVQIplEvJsXgoBUlVrrVKTUeFOQoqfyiLarRUdyvxsvRpJgLUiczXomvQFgBQ";
	return yXmVegdCoRHjyhm;
}

- (nonnull NSDictionary *)hHuRokqnUBlcCePGXm :(nonnull UIImage *)lOqNyaJtcIS {
	NSDictionary *HSmGwMubKHdFmoMhWK = @{
		@"GduxYDXHGNdCkJe": @"jYTpuaBeMRaLRfWEllZkUcFGTYXwxFOVQCuEUyqOhPuctbthUtSffJhjnTspIExepJRgkYxrKXVJourInYnAxDwniHZtjNPcaDyvjVJLzVePrzdxuAlviScEVWmrszcOLXjhMEYeiq",
		@"PuKAEfVXdfoh": @"HIHTVFlLmTUveWpmBgvGvdvgJITqjDBGZyniPVeUvpaHmtPwBduOsPdAmKxuvmHnnPslBYIfwITZrtscyjcLosogCqjfbhuAvrNedkDvecMXjRwWpFdmcNTJcgcCBMsoBurIBxtZKVjUWTGFrl",
		@"sCySRBETYVkyXRAIeMe": @"ayTfjcSTgEjMClKnoyPDLHdyGEZIRiwUrCidFTMlLLguJTVehiOSQCHPFYmklOEitmLkQHXtUyIEOexLEKKMYdlcEKgaqORcBnfSJYMQHkRGsptLFrKlKCirCedCrOvTdUlulWLycrrtBOrdQRsJ",
		@"zjmDFjUpjX": @"hOpiqsDYUzkoHIfBKZiqbzhwxhNJYxjaqKXISWzcLbikLEKLaTdRMYftIkXWziJqSYlptlYqjiIWFYhGYXZeBsBWbJzthGouAHvNFHSwkXHbPxUClfrvHgeijMQnzeWHlgiCUhBhPwQCkGwsE",
		@"JjknxuUgaMWyQtaZ": @"prBBTCeDdxRzFXAGMUdHTOVGMUOWmBRDaVRkeRXSkRpVYWhNMdcXmdgBHZILJVPAPVQAworPqFWeSZUOqobTOSfrWoyAVjwpAaRykUCVhgsjOqSWKeoCyjLxcXLvfvvxdgIFER",
		@"ghQqRqQgfTOVlfriyUH": @"rbYAoirUFrNBMpCWLwevUrcLhSEinGShQzsfLwHmxAVHtVkAYjGuUJAnoxwmBZpqfbJAkfEqbpnNbFzTSimxjYsWgOMFmMpIjNBaCMbBjEImKdrnsrWmtzibHljXFxKqnDunfDn",
		@"GyWITEBkyQvuzEbj": @"TErPUXUdFMypsJbHmZEYwSXUcITrohsePHDVPORHxcfkssNzNEGbDBlaQfrEqNMGqHdyeaMJkqPpeXmnTBZCwLPfxtNCyebxRwJcjBkWmwp",
		@"cVsTyTChGK": @"orLhddXUSjxzTnvuRhRViRngbBpARaJLAQAfPpNXbyhvrSlBJitHSNmlZdIyhuxBHpTEOHSzXPxvKTiDrHEOuGCJZHKxJOTaYfdtWqtsweLeEw",
		@"pCmVppvauBN": @"ijZRrCCUlBCxYLZAbdjTUGycUPeKJfgddXFUMafkfuEtJcamASunidScfhIsJBaPtjqXdxGfkxtpDRvzcXlWDTTOeohIwCiGRtWHqKNRKVbBkORXbNJzLufzWtdLFpkyPrHNPPmJHmpYMRjoFNx",
		@"NJBjcrAzDvIGEbzzhk": @"oNcDFCTFtdQoPeDwQHVMaQtsVcONLjYckjkkrPewUTBmCyyuThBdeGdmnbXbiUmDOzKNLiZRIXgzYUkHBxbYOFNNDjHxpRaKCuDGbWpXTCEDWanTIhpOQVESi",
		@"AfxSKsYmhDqOk": @"GBzuOdCcMGmCGkmVUEUTfnuviaFYZzujoZXsOrQFDTCyVECBperFhglBvKWIjPvzYamYWESOCKdpXtxRaLLYmYGjgNveQRLUNqDmxJacCsZzSBKhCZTasHdQYIMPlezekbNztwDNrn",
		@"xmQwcnpyTC": @"gRDrtyeySGqmzzNfojHFhveUpNybpuvKJtzAbzFpFqWolXiEuplGThTcKwCYNThGtEZtPZgcqQFXkOclQaPNmYjnHrYONzdCNKWVYCvUpLZTbHqruQdFuXQyebXRmnpiUdKflrNwMgY",
	};
	return HSmGwMubKHdFmoMhWK;
}

- (nonnull UIImage *)VEJBpzyLssDIbYnYYVW :(nonnull NSData *)RLCBoGunICUQihPoP :(nonnull NSData *)DkyKrYHkax {
	NSData *pibPywROhtsFlbVLGm = [@"XoZQJsdzkmEOCcJztowrjRvIIPLNDjWyRpDKpcHHnkFCUHrfXVwhWGATzqemKhZeeungCCYfgcSDrbbpenmJlwgtlrqZJQpKnWlxmdaXGGiDyAheAsCGAogVEf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZFFErMOkyaador = [UIImage imageWithData:pibPywROhtsFlbVLGm];
	ZFFErMOkyaador = [UIImage imageNamed:@"ZLfGHPKaIcZbkXmoCbEMKgIHGsbeBFbCgwPFYPTcqIZXNceyhjfloLeAKuZBbLEnoCPWBuHfInlwaFcqejEqxOfAxIwcSTCPojkMztOtTKxkVzhpsAcAosqYgrF"];
	return ZFFErMOkyaador;
}

+ (nonnull NSString *)KEMDAtJAVibTPRhy :(nonnull NSArray *)ZxBipYGiZuEqiLAnqqc {
	NSString *aWKapECyMrtZQhbPii = @"sLXcGtTPAPhOeiTHnhhnTliTWdteIiTtDXCdTAYjAtlzwIOnGqVRwRxLELDpkAKLeYuTSrVQMffjcqLWNefAocGJRqxTzkIAfcSfjvVFA";
	return aWKapECyMrtZQhbPii;
}

+ (nonnull NSData *)AfSTdotxsuKvOAilJS :(nonnull UIImage *)VTxIcYlrApJvSUGmy {
	NSData *arKbvBEoOJUlhW = [@"McnCoYPrqrFrIuGVqRfXJZcmSVmKKBOspemsbyYzGlKIgKKfxckfTVTVcgATMcaYNaoSGcxUOoGdpvuurwgmbuoETYJhrelRPFKnIYhf" dataUsingEncoding:NSUTF8StringEncoding];
	return arKbvBEoOJUlhW;
}

- (nonnull UIImage *)MbJXKwHYUbbgYxZKdi :(nonnull NSString *)CAUEEVceOTMtSi {
	NSData *JLsCSXiDxhNudRCm = [@"FqQWbfAvfYbWdAAWYKiDBoCnIankdBqlszNhhBZBWFEMmPSQKlojCmdgcOwxKjGZxhCoISEOCdEFNqndhheEMDWYwPIAcZULwxXPwHmFpS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *taPvwDhANxOjmG = [UIImage imageWithData:JLsCSXiDxhNudRCm];
	taPvwDhANxOjmG = [UIImage imageNamed:@"lmPuXOJgOKplqUFCEPyAgxzNPgooVmYkmDAOEyQsagjqkDALXZnPoMumbuKVkGasuITdVeIlFGGRAGUCwTbazVAdbCQVxqqZrUhVmGFtKjH"];
	return taPvwDhANxOjmG;
}

+ (nonnull UIImage *)DUTVcJqZlAv :(nonnull NSArray *)QLOdVKCbcMuJRuEQ :(nonnull NSArray *)ZEiEnIpFCiEhAch :(nonnull NSArray *)glwrkuGSeUdVnr {
	NSData *EKhnVoemOKOlqL = [@"mxmGuJIwGuKWYPuTXKdZdvgcQVnkZGotQePwylsXrYWZTSxqsAlTZyacEARHHAkKqXoOYvGcALdbRQUEzLOWRThMAPCaCdBRYOlWwZqobGGqCdgpIFmJyezsDrAlTpGM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YDzqiKYANJ = [UIImage imageWithData:EKhnVoemOKOlqL];
	YDzqiKYANJ = [UIImage imageNamed:@"cyVsEerlucwjlMDOigKdXdZXnGNXDPakMNOQOmtoanoYbHuXQhxwoLMOtWTPktAMLqYqCLQThhyKFpTZSyCylQKQnahXgQrxiprMxUHcBZpJoMjRetNiuaciaDRvqjWVldBxzuGS"];
	return YDzqiKYANJ;
}

+ (nonnull NSDictionary *)BGLCnPTLtWpTph :(nonnull NSArray *)uheoAhOnWmxypnC :(nonnull UIImage *)gFVsMZDLXbPduExzDYa :(nonnull NSArray *)hrnjVULSoIII {
	NSDictionary *fPVxJEiklLJydbnr = @{
		@"nPKkmgUOgecmfbQbw": @"nnZWNviAgGMxedSWiHrACHZJvCixCQMZJOxmpKFtBabiECOXiKHgcKDMpyBbdiWnoVOqbgmYqkUvZLJKKRctyiBjpTjZYcyaWGvjPvZHpmKfhFwxflsCrfnTFcufkEtXoDWmKcvCgrcIX",
		@"XntWpKHuNV": @"VRyUrCXUFcPfTDOasnZcLmiEzrFqewoXLVdOXBpKXCuEuyEKmSuiHTIsyeyAWSyVTugSTUyUnEwbsMXaHEHHQSHJnejLpqbTuCJpFOqJrQBMiqM",
		@"GsXTXBRkWtrDO": @"BEsXFTAacdCigGfQfZVqFylGQTIxSUfeRQVdRgoBllarTEXoxIbxRREKWuRvdlgfniSsQbjnvKWklRBfCRiUiNdNkfpsmwqHrziiAHPYQhCrlHPgw",
		@"YMlUtTBQauJta": @"OhsIJmmXZKolGYdvCEFEQoCZXNdFsvhSwFQHFJzgNtCGsUSJajMkwdfMuELfxYrCFBDSDNgglmGLavDrfpIdeiNPRBKOKXcjRpHpWGvOiFdkvHpGKQcRuCZ",
		@"QZqNEfJAoSt": @"lpZchKCpBImDdeONmWLVBQdknUhVattOpaZITGbqFBkNoLSlpHyQMGYDUitNZFHQggIWnPjbGWNWesPXWpEJipTtkEhaNqIeusYMzvFgWaRgNAVLxUo",
		@"CpCxwhnYkMxvIuDYPlB": @"HGSsVkhHRzDRNsESjgRMEmXtgXadosLCytIbfpdvMiamnseOkxqybJIAsqJpGIUJmnuvjWnnuAQfAFrMoLeFUEtbpLUOhnUxZkmwGvFKoXHJgqtoEHkMsQWDijWIITDuHEjZbTuaj",
		@"sERsRohcMYttVwJqn": @"rocnwZFVUkqINFhFJaonwTSIoWOUTjhQbJGqTrPDUlobKDuhhKnsYuxmgRBsRHQNHqYRUHZYDoljWLtlXmFUErOApJVHiJFFXQjzt",
		@"wkbxFORWZlSil": @"jtMXodRkeJOAtrPkJHmAxQKjjtGLOOAYuBaQAccUqQoNwCWUEufPGiOxnLwOVZukWLxEKEWzzzrhYWUajQgejMZzxeEiPYBJLfftpYmKOsgtvXdR",
		@"DLYaNJvZUtDGTEsjO": @"fIctZLwHDzsQdctSgaeVzHJvLcUQvMVlLasYegboGCWJQMOyHmcxcYepPAZCRJqnbFLCYJGdYwdLQwoeUvGndChrBbXscYfMpWwNvPKIdnezDXcXyDFhyvfCjha",
		@"KjPmgemfOImnanTLtlW": @"xvhvhyRLRCjebQMVehzdcfTYpFDKiZmtHXBZVryVweexlgzVnnbgZhddGRjzutUbojTEaiztkANVGVZOdaTaFuptXTwiyHSeLjsGkCxrUZGUSIOmHHTJejdqrzgJXBTUsacqqv",
		@"zFydTYeJnEjBgBfKBXG": @"NdbCNQQCGssWtUWZnwKQHwnbNOYkqnyXAuYkFAQhOLffkkyJoOdZJugWQvVCMZQOzEquHjhobUdZIqqrfFmGFNGMgnATBnuslaAvcMIERLnWVmW",
	};
	return fPVxJEiklLJydbnr;
}

+ (nonnull NSDictionary *)GliXJRxisEXSlOapTY :(nonnull UIImage *)PRxUKTNhzkwZxSzxhQ :(nonnull NSString *)YTXfkcNxWORE :(nonnull NSDictionary *)XKjvBFumNTtsr {
	NSDictionary *tRZShPsvDsfQJlv = @{
		@"dFfOSHIDliPZIqM": @"aWJQIUsEkTIaNPZasezFStyLIwqVzjmpXYeSlYCZxilZIcAZovBPSbtyvTSuyaNAhicWDcCNmPxWDnDSdpZoUUKjHuGaRchbTfdiPJdIBJyiPHhXzVYhQyJRPdLQMaSgPCGKaCwuHVZjwmiXt",
		@"XgNViaEsDdAhAWEl": @"dbWOkWmiibcYRVxnUykKQhRLXkJvtBodwRTkHgdnnUHsXKezseinrZmyGhvCrtyYGsDnuVertUpIXoOnmnTnEPOBQvvWJrHKBzSmcuHDUYpavDmgBbAgxnEHoXsc",
		@"cPHtoSqKmax": @"miqwssryuMfXJZGQyYbbxzwvOBEozQNEgWDTgulLMIidgJwvSmiTRgqmaczrEWadlUzRWZeIYDDXcnWJdkHZZujWYPCqoHxGWbZScROWtDZJDLkrneGOm",
		@"oHZbQYTSkvkIlthOz": @"qtBFolzfvyJvvrWdItefDUTWytvhnOGGgJwKMkSMmmIFVJowUGaXqoMGYwQZjrxQxSUtQmocOXluRsnGWujjSMhZMQTHMohQMxeYJKGMGYcWwWFWrQbLTsrXOFaybVDexyaZCHVC",
		@"XsDAdelFjxxSg": @"xPVmLXtYUKhWOcWMObPkqgcaGxPndYgBqQiQkKyadWsVrDdVPkTIbyQVAIzDBYluhDnrlGFtDouRUfcjDIkxeNYdUdyiycSiHBjvUPznyGTlZlKXMYtlclBVnmF",
		@"gtGPlpBQnZsHpdZYCIM": @"TMjRzwIeJhWvUzVQwWnooSKvSwkpcWXOnNGPVHNurXmoojDTrgtqadyERVkrlYaTUNzsiidwWDXgqGxcVqFiUnYgywSZseiIEMGCXjerpXqpYQQeMseSzbCQEpoVEObYMQLOiX",
		@"lDMkLuNwNdHj": @"EyNPeWzihjRQiafYuwCBsHmcZjotnEOWzJrOarclLBbEgVRIjPnPdwImLINFPpXtXIzrNFZreviTZztXPgdquBCBayEIkhkUDCgDLhOGIPr",
		@"kfwXLNdAgSlStI": @"cDzCPZFXDrgXKXAKSaggsRmPjqItxvjIrUKcjreWhPHUIOiAomULczYUWQUkpYvzWXlUZIraTUlVflDjuHtuNPoDCosMwAYQUfiUMYSElWnxYMinyoYCCPdCKaCiwwwIlYbgwedLy",
		@"zkIpjcYSzWXTmbhh": @"vlkmFFqRJYaoXrwlQTHelajHVMXHBfyAVBpGGcaazdDZUYROkQmucgBvUjCoDCehfFnMYltgxNaNIkuaqCzMnyoRDVtRoltwrbyitcGRrSMTulmsXrtoONDpeeuaLJun",
		@"rRtdwkRKzbrrfL": @"JmZnxUyUhfoGICIgwOKKZKYPfJtptMTboEhLlNFpmeWtnvrVvsqFEXBQcSqMFwkzOSpFcFTANoXLJQmsoImtygmfqfJfqKUyTFkYgINuOiyUAhNPqpasbaklNFnWJmAAnmKsPMONJgeqNPcQlGBy",
		@"odBtIHezrktSoGwfL": @"XXiWWAXBhYzOCUbuRKvvYlGhocthQSToWtRRptdsobmaQAElZVSQxxmEJoufUWuvTtwReCWfSqrfkcUtkUUnijWSTYcyzfKfDRdqHJJLcqIFPJryEIiQRO",
		@"qmfhKKoAwCMQjLHlbMT": @"GcukjrgnZceuQTdSOQEqAOyuqbuiXWBhDJUoiHKuXXEEcSocbLfgdoKdWLImACUoZmhHDmuRGBpvjkItncSYBBvlDpOLccgblGzGXVJwACicwcFNY",
		@"PFKDJFlWFNlthHmb": @"iUUecUmpHWsCSTJriTEkYCsZkkEKiwFXemeYZozEiHHNRyQzJSeSgFvLzprpVNFfSLEqsNmaQZpjXsqLfWCqIhQxNqZbCzwoUDWkTcFFW",
	};
	return tRZShPsvDsfQJlv;
}

+ (nonnull UIImage *)JNagKAMsoMLvKtoDwsk :(nonnull UIImage *)QSyqViqMjC :(nonnull NSData *)BbOkPkyOkcQ :(nonnull NSString *)NweLpZMfJglWkvrmEEV {
	NSData *PsuTKspEsf = [@"yPjhbeaJZrLWfbLiCSCJhicAKTYVfvnHeWKgSkTFpZhycHVTEwOAZvEizDuYvTZbktoRhzeVyBeSUokzZpfxHzLDZSffnjHEbslrhytisFzZcFBcLddAcyjcNYLmrWWfmzQImZhRcHG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TGIlssToJeT = [UIImage imageWithData:PsuTKspEsf];
	TGIlssToJeT = [UIImage imageNamed:@"mlJScFbjgLvUezFhhHYqmpjxLohnkktpwvgkgoIEUCyucEYFooqqskDgKfsmMNpJPMnxXHdDyvCLbrhYgjagaVwRKHKMqVUiRijMakgcvgsdDAaTvedeRnYFVp"];
	return TGIlssToJeT;
}

+ (nonnull NSData *)MyBoCjoGqsC :(nonnull UIImage *)xkEhDQkUAQlda :(nonnull NSArray *)lFkBKldTDRvQiiMBXu {
	NSData *iIvwyMmNlgzCiFLy = [@"WhxfBfbIHdDUFteyuIPFVDVbzAOKkNtSxDQSdwgDGTRXwTDMKNEdxphbVOryFQwJbNdpdanVYTopcizkOZYXbJinhrLPQZUhesfZOpshCyGUwIyyqmkRTLVcfOdHbPmHeHEhWPpCDQqSlgrKfGB" dataUsingEncoding:NSUTF8StringEncoding];
	return iIvwyMmNlgzCiFLy;
}

- (nonnull NSDictionary *)KWxkBHbkcbv :(nonnull NSDictionary *)ksuPBPZvTbrApWL :(nonnull UIImage *)OBQunUsDPwoiWy :(nonnull NSDictionary *)pMifxOrscPDd {
	NSDictionary *CYioaVxdovXljPocO = @{
		@"vIwSOGjqdkmch": @"DDOFLkfiaSdGCoKbBdzatucaTCBsqCXiLveoSKNMGmdCFvJUWcmYkBUhigVXmWkCdiHzhxykByZfWPLwQHVgriXIdyiKYfNBWXlilkANLdPOjrzEpFXPJNtWufUbwOHxaXfpuCJSCpSs",
		@"UbuixYmRzhpa": @"yxSJLxyGuPmlqFSjMIxfahXKMLlwuHZkRGPXTaHFYkdWhUnBNhdMCWkRhheyOJInqlCXlNaWzgKCcGrsmKxRBKxHtgEUxLxvPdmiCYpdQFcwzACvjBPLCHpODOjLhkvDSxyaTWecb",
		@"PuNLHNJpLmMhS": @"dwsgnxjbdWCXISDjmdcCmumfpElTgCnNxEWQdPgQtrSPPsxmJzMoDWKuiLIuxVCuApeNvciZgZlQymPtAzAlXCrUzbzDfqzHsKKPAKfBIdLcXREGGPPtZbHVbwsaHc",
		@"adSkUwtcPpihYEQowov": @"zKILhPuzWXPRKbfCVWJwTsGxEhlAriThtQQoDIIGjEOSHsITogYFYCSVDORRpuLaLvTkgEvMkeOvSUdXPQgBuayfNwkFcoyCmwfSdgWIxNeCvIPHyr",
		@"wfWmsCDDhtbp": @"pKlDYzapVYPUcvlzoTsnjDUFZWcOElXJESSBZNeVhBFQIZHXzzTmlIqVwXuCvTpehSHoRFJSnwkeGeEDLndeFBkGtmwlfoeGVYGpfBidWJcBerzssxxTXZxlQorP",
		@"WMPqVabHdTuhueolw": @"xHtWtYSsDeOTkUywdHizvFuRNDYpTJkbuPJzBeidnuawUaUHYSlSVgRunVqnBUhrGgqNmXGdooNAIlcsnslNycAwYglNQXFrEohgpWdWTieUaaggYxJrntNjTxabFnPGtofJihdS",
		@"ZoYkSBJvwFgsekQzkbG": @"DSpWRtLOMXEhYhJbYEHPLBMJXODuBpYQvRDrFWzRxbWOcfyxOJpaVCUdpqCwJYcwrevwPLiBhKlnfcaSmPogawjQRyqyVMIpptzzGVuR",
		@"mVmNcaOwJutpbiKLF": @"dOWrKxTneuzcDIwUmXazwLgEEZdJChaMcWeHqkhEDdUpSIJggipmtETnwSNXuAGnCNUHwxdJFOetCoVYdhkZShCJjgDPzNaxpwKVSriDizbopojHLMtxzswQTaXxUFebRHeyFZuAThtM",
		@"SBbfDBluRBOKRdt": @"xfhrxQKWfkKWxViiqZqJEcWvcNhqoVGdwgWlGGkLVvIoBGAsanZrBVAlxuwmXvoIFoUeQrDtiPmnLtYllfjbmnlaMtimpqhhpoJUtRom",
		@"IJuditkSOcCmYNoiSZ": @"nCcfxVBiBjmhRLrECtbEPktpckUWIllQHMwBLyIZtcBZqyaEENdGpGdKSXcVyihBfImkYnmNfrruqqeAVPSBgSpJcRREvVCHVFKGdjvtnpFjqnhoeGIIGCPQECEwrXiZZ",
		@"MTKBnJpUOEHQItXFfz": @"YnKgMnSAUsdwNDWRdESRPMYrKwNDkoHSLByHPQgWaQZudwUmEgHvQDwtiRGxkVXnUsNNKboKvIOrsGcrqEhWvKFsuWgOVDdAKaSKVoDXkADGLjKqm",
		@"bHpxdpZjWoRIGOJrWZE": @"ZsCAGMSUGSOvfGPYgnNSUVEJLSMXdkoeNggjUQhhjuWGLjTkRNBamSafjGdXpxGiczmogOUOsfsBiFYNgNitLNHQPpacXEIMgWqEhzkrsFVZwrwceuquySKdsnNBZeF",
		@"mGlVUzpFKCKk": @"QZdOnGMFJcvGfLIjFEpNhPhVgjReOQFewQhLDaKZOwzaTMKDJlXgKkhJQqxqmXkygBeogjpwIZYHPQtvFAtliFPRaslvmrOZAMuuPecbcFthsxPFKt",
		@"epKcgnqTLMUGxf": @"UlljgazTHEFCZvihZqCyVRfmhulcoKufdnyjPwufYcJCFRuRFDVbnjQVWYOfALUruiCvgFbKFJIbNtHVsawZTwvwDuJrdhLcGArFGVuTz",
		@"oOeYxpuhepqbndYVXiU": @"ehrLMCNpitscjcVAvyTdhuNefaOVEsUDDRhIxeVnWCCxlAnSmLzhaWURKrrEqsdkuRFqIPgJLVVrrCyTqCZVBPIhIYXkEGYDAXIhjKofiOtJsZWslqqFNBBmTvhrPtq",
		@"xfgjoRhzWJilY": @"oeeeXBHcXuYRYVTrFRetUmoYXiRPkvtHhQbpxgOQvMInVCFbdcQwYkjTtCzBgvdcfoudXGoyMhlvkSuvnellhDYLImVRDUyxRVbRhLAuPTNQGRlQQPzaZYFOzNQskAnOQgYftInQPbZPHgLSkth",
		@"pWuGtpYHEzwzSsuMisT": @"hzkqpCRitRxRWypVtTYxJwwFskgthBZFMFibtghEBWHItnOzepXBYNgKRxMaKgBhQQpDBpXcxDmvqSTdumvStpIRlBMOgeOmZpxdPJUVwGOWkhoQPXWTdPvgPGFYBxntBhdHslhQiTqCCBfTyu",
	};
	return CYioaVxdovXljPocO;
}

- (nonnull NSData *)ZuOAhsuyZRq :(nonnull NSArray *)DQEYDkrYPOsbVktM :(nonnull NSString *)hHNsFRMDrHJxXSGNM :(nonnull NSArray *)ZuplQTDHAS {
	NSData *yquxinmokKSaW = [@"rGQAVXiCpVxjzEBSvylFzMtJALJCUwnyhDHUGamgIJifxowpsqOkTvHiyXtZKOKyQOHXfezZhGJGQVHdQITkqcEsDWHtQbWMtqHKmAjSsKgtOnyOacqAHRLDwRuVQkXrIaj" dataUsingEncoding:NSUTF8StringEncoding];
	return yquxinmokKSaW;
}

+ (nonnull NSData *)dSQPSDXsqak :(nonnull NSArray *)VEmVvzPjPkkHq {
	NSData *uIjFvjOhyPcBJ = [@"OLWXVHYCjchJrvmIZUBwTZEKyOUCNpShTMKzPnhlYUbjxumZeMDoyaIMMLKeFWTlvbQbWnYxZpiuiEfuUGjlNhhjdPTVACxMKMaXqorxodNYEJdgQnuLXWpYkozgfTsJuaZnmpy" dataUsingEncoding:NSUTF8StringEncoding];
	return uIjFvjOhyPcBJ;
}

+ (nonnull UIImage *)ccthJnZpcpyvSQgN :(nonnull NSArray *)UFzmLdXWghsFgHIHbAf :(nonnull UIImage *)ZLYUQCblTyPFdLlTStN {
	NSData *wLDstldUquMDos = [@"jGHzuiOXEVEyAPCfNlQilwqKnNhszzvdUwJyNXrOxiZnTnvMEkSwHRtUkwzypWiphZxNlfyVYxvMLHOrXYigJfBzkApdVJZGJfjHCdBiKprbXiYEdUtNYoVLiYCevkcxDAaYQEQVjazBHrWfV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rfFlhVTeRdzVhrkz = [UIImage imageWithData:wLDstldUquMDos];
	rfFlhVTeRdzVhrkz = [UIImage imageNamed:@"OxVjuqbDnuNfHUsUzXIlSEWxHvOlBovKgfVfaqmfCCTlmBVhwiVzKpZRKExoqyOPPDBdeJwlyYyATsmdFBcXwRfBsIceXsLShkxJNAYjfBIhnHDIxnBwUiaTiqlWghQLm"];
	return rfFlhVTeRdzVhrkz;
}

- (nonnull NSString *)xXseqnYQPKSDh :(nonnull UIImage *)KQxODnLJZHjBajC {
	NSString *BlqOHlDUgEponwJWsHa = @"eykLuOLftiuWEZrDBcCckJSwPWYRXhYkYwywEHIFwARGqlQEMAThTDbzLWpXfmPasLxaiZqkbXKUABhpMFvTQJzeMsxCJOcIlsfAhriJpVuvkLVfzQF";
	return BlqOHlDUgEponwJWsHa;
}

+ (nonnull NSData *)ilbaPwtfReWRPqKFq :(nonnull NSDictionary *)SjADVaXGia :(nonnull NSData *)fehywTtkCdggGyhoO {
	NSData *yPUhrGvYWiMMo = [@"JxeYKFbNRBTAzblRUIwMcXNPLODTsSukjFrGvEULCGjOFkucyUIeqhnRAsAyuUGKYLujMEWrDymmlYTDCJTSaWDBVqgkyTyXAIFxTDbpEPmvXnLixyCRVdDPUMGUNYbdNuMCUhTezPhRELvqGJ" dataUsingEncoding:NSUTF8StringEncoding];
	return yPUhrGvYWiMMo;
}

- (nonnull NSString *)HMrBIfRdWa :(nonnull NSDictionary *)ffarBFpIwFCnWCcXTNT :(nonnull NSDictionary *)PaDbIOmBxCfkWNhaLg {
	NSString *lixfEQhbEADCMfHBt = @"IMhRaejJSwrqMwdHnwrwKFeWFPWWwdvtqGWXEbRvslUTdaydwTZHHZMhYIrbazsSHuCxFPzCqFDFxvJWAAIHjgdAMjAwofDhygLHlgpOdCpmQwMXqCpAgGsiNmEOWZxuJN";
	return lixfEQhbEADCMfHBt;
}

+ (nonnull UIImage *)BifrgvmoJa :(nonnull UIImage *)wfHBUTiAthxOaPFShhZ :(nonnull NSArray *)DkLwLoftoM :(nonnull NSArray *)CngygOJOxajRT {
	NSData *GYAgbBYXDds = [@"sGGCncnlPwMgimnDzJkzyGfWRGJnkQhrHaXZocIWCfLwRDPMhdHWTgJvTEJFbpDvuTSElDtVqhOCXJjAZujfrIKQaintJIJfMsRvoGUFxBWrQSyLGayC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LIPnXKfFcjGvOnTT = [UIImage imageWithData:GYAgbBYXDds];
	LIPnXKfFcjGvOnTT = [UIImage imageNamed:@"OXweaftdFGTrHsrLhiuAuRBmeZoFdtWCZPYatWVuPtRitHCarKgHTiKkVzrrjOdBDSXjniUaNjxQIodDmKlOQBTnPJwAcWCELfUZoDbrwmzJfNIFrACjDQqFISmUmTdxHIoRkZLqkAaEm"];
	return LIPnXKfFcjGvOnTT;
}

- (nonnull NSDictionary *)BupPQZTRJLR :(nonnull NSArray *)dGwFKqqdelPVhp {
	NSDictionary *nxMdykRrvWBMyKcU = @{
		@"UfGsBRAWkUOpFi": @"JiynmFyNbfTpGErSpvHSQskGfehZhPedvHIgGnoutJuFObOpcPyYngXplLjhKepLyQpAWbBZidlkCqPuUdEaRvQnCZHimfkrGenUbfdTPovZjtyqjxoayAinWTBVjgeyvJ",
		@"SfOuWHomtNiK": @"aigFGkFgBfvukTmJQlZltydKHDTPNwJArOOMhsvxyHPhSJRRVrCsiVyGiMFPWtenzOCuhKqCZgHUuslOEQhQrSVwcJCnSsQrROIapNPCL",
		@"YumjTzdNsuUOFXZ": @"spyHUESpJTnfsQRuRpWDnKYcbPyGYLdUWlyrfgfLISEzIJARrmHMKLaWYzuxcJWHhmVIaCoBbbnUgOxhNkEIPdzMNVqCUZxFmYiXBowWSlLZyXqvqDUVzEXGDiRmawOeOrwXN",
		@"nEVekZxALJhuD": @"HvtlRTNjqMwmyPVHGxByDSFQqGdZDJRtxVwcGzdCcczQflyJqpBvmSEUdYBNoJXNHBXDVFeAwUeIwcYjPvLTPNREYVckumKFhinfSFuVHTY",
		@"JnKMlNzVmNWDZDgf": @"QsmkLussJpUVDxAtIHStkrKzafnpxbKCQyYVAxvVJnBCrjOMyGdLcCyJEHIAYoDcRQzGgJfRLFdSsUhOIKkJxdlqoKIMxgJFNlzo",
		@"yuBNHKiqrPAKYpGR": @"cnSycIoTXnngPMMzaoKohazawjfviUmGHbjvyDmnZHlWgdtuGDNBOzKHdVRRTtbXRGaOiUlqcnfQfFmFXgyJswAXxfyTZqEvCLOBLsoKnmusCqulDPjTYMbWdINOPWUZKyYUOVzYuW",
		@"tZNgJPMzdEoMlcuByBQ": @"tlPCXSJaNMpdtDgrDrRzDWNMMbYFwTIooiOQycrBvLhbwtNXmkwNOorzoeSUyqKxQhRMkaOdYFYXbbWgKYlvCrVLuywcjccsaTSgoyQwDpk",
		@"gFoabCwPvmvbMFTt": @"PqMHQngaUGZYmWEtQpdPAtWHJVjPIsJvAxAiBZTSMsZVkJkfdpHcIEubdBHvXZlkgwLOvCUUeHUNcwexXopOMZxJRoAOAqfvziqYvYxvvVEGYCgxvaOHfoDqASDztrANME",
		@"QooGnxSocBDYNEoWakZ": @"pxWyzYtiHMZBZbQjQsDTkuraEsORUvcsDEEUcGOyKtGUZwouMHKHiJXMpfshlYifWEmLuFgPjvyyztSigVqRkJhzOoExhtIZshCTdHYNTurdzLSfzeyyiwrmtTxWYEPSkwBvoq",
		@"ceaAVaSqsviHGs": @"pJKUhLBJAHmyCvOCkghLFQKrFvJcBUFZLaCDnTpNxyyVAAFcvDryEBUsTfHlHxMhZDRpYqCZntgYiZxyKQgKdoeBqkMkfOXJNOoSFepZDlLbDFwZWeqdrHGlKUyBPVzVpbOAEQsJxkw",
		@"ClGtWQzSbJg": @"DxNVYmLpFCDTFUwXPjLpyHcnFfVHxUEiUcObMLXypEWRxRciMqxHXteBNwExDoFdvEfVneyTuKgXyeiyvuQamddrVdQYwMIRFXKlOophGqyZBelpnmXXknDdHytXJeKAiQACgtyFnWyREaBhJULL",
		@"DbfWCGwhJUzm": @"vRTLhUhfHJPzqwjpvnqLqoIJceKsOVUXlNIkJktvNKEZkzHhSDxEElrPPhygGYowzMNfTDpdcIvCgZzEgDdrBvVTQKJYjFclJqdjscibAWcqhYEXgAtEHLBAiVNFakXDHeToobJfztCnVp",
		@"zLKsJZharKjCSyQaHP": @"YzAJndPXGSEkrKEnPrSEMGaeaKGxhJnixfvznrSmKptmQOKrYUekoDPoxLxxEeMeRithiGLNpXDNbRuXdKddoPbXpEnQKQkyQazU",
		@"DvOsDgavPwReNzPD": @"UNvUQwrVqvNwhXKGuHqrdjAokqwzLjzGCQkbdoRDmgjbNMOLuQSFESYJbFJrImDUQPJJUUjtWKeuxxhYNMzIuJeullcjftAsdPBHJkPqUgxCUUIYmNqj",
		@"IKLoQNnoYLxRAQz": @"ENsYjCboZdeGGRIwmNGVubQAEXJHWZdQtVqBfXdMHbsyTcfmxPEYkDJNfhNFxhAYKQCGPFFkRlqAnbyfTyBvivWwMiOxarfKiaDks",
		@"mOmhaRFaEoybuSjOO": @"yznnZjjVeQVaxsqvDGizSZceByFEJMVRcWIpkOZxlqyAcrgsKybabARUYqORtocXphGkXZprUGsTLZYjGupAqwqhCQLgzqSvuBuMiUFx",
		@"yAjgAFgsKyxBqYS": @"MfofdDMQvwRinbtkKvSurnvWkpBZCmiRIrMcAkHSxGNZdAwNXGjVWGTRDlMpwjDdodacQJoXnbOJlFhQBtcElDnlkmmRWFkTtVYlhohBOqvmkJzySrVXOagsQEPHQcmPEtfrTcqLza",
		@"WnbXviBhwmJfzjbuA": @"rycDzSWpwbKeYOleJeBlAEfywvvECDIGxXItzMjIEQBlkyhQZngoWOgEuBLoedEXJzbWIftifSSgZrnXqOlhVByKBQUWNSVzxucwlJlBfRnoXvWEStueveavKjHl",
		@"QLXGywQDxLE": @"aCNrCNuGXhnMOvMemDupehAshQFVtHxFfaUtcaJBsiJNLGNwtSfDwphtkEpSOpaiNWiiOytojadCtWdiDskFWYPjTCXGdqNlLktgZLItmzpqhVVknhBi",
	};
	return nxMdykRrvWBMyKcU;
}

+ (nonnull NSArray *)GSWXgpgWFdyWZNrMwUY :(nonnull NSString *)zpliJXEjXoIaf {
	NSArray *ExsvMvLJguwO = @[
		@"bltafooXhNOuVdikKkYtLxCokxRgwMptdFWxgUXJYelYEjfkfTDcnKtJKympAtvqhVtBnRhhFtsiwmqBjtsXUMaWohoIfalieZTHuChzAcVVjxpnmoYegDsmIdPxQrrBmfqO",
		@"nwOVeruZZJTFLkTNCcnSSEKJCLXttbRzgdhMSuexIzLZRekgtPiPMYfDtXZYqJZVrcGkVZlvRsXhJqKbTiUzEwrAYKVFOLpqWDFmRAKnGXEPjyIJZtizlmqbkkVtT",
		@"VNklGPOpKqJmiFxwUCpQhCdjCFMFSFoFyeFGcCrJclodMLPaptjvMaThqJexdjiZyVqqmoPOzjbHZJetStPTfAFDAUAqviOXgKRCEEokXpGewqDbeTHCzyikCqwvGGNgsDmNOTGlK",
		@"SQoGrfcagfWmwHmRlHIDbncLolbOyPTDOozjAoSxJDFaNgjQOMnHabxvfOyRrReehabINrmEjWynWDaHCtwVGpEwJudiLiDSZeHNDJaDugPmXrywwxNGHlrHVryFDKRUjGrPmLqEj",
		@"egglTncuAmAzXthmROelBzcYvGFbogtZzmTNIuLpZfKcqcnPzIEzWzfBWWieicKwuMZCmGZWihGVdSmYMaGwZdQIWtmYkItDtzReANbHaqWlTuLoouHEOMzl",
		@"OULWlUDmaUDSfskuTwHhkdtMrVDdgkuRFEhsQVaiojCIwVGpXuIVJBswIGCKihggZBVuYVDveaNhPpCCUWVlspaoHxZEDxdBLzdvyaIQpcyIGElUBKv",
		@"qcrFfYVdCEiFlfypTalebfUvWxKslJybQoZYPufATZRWnxTajTajZQSbpaAOHzfmjqadXvogLoFCtyDzxaXVtCbNjbSwslRdqeBzDKCdLjUoWOf",
		@"JOvVryDqOvGSDOiVTkGrBcXVbzhXbldawLjKlTjjSnVZCdwbSHfvUsNlcMLUmCbYBxidupIjTBqfyqAkTcUmxfUoKdexSdLTcEuDqIHDKxbAMrwFLVSBpvaIUrubTkrRzwqWt",
		@"JTJHMlKcEPxBapIcOmTHFbYJwYfLtiIrfsAeIHnrjBpvcSvDGTuMlnxDltZYLvQMqPuEyeiLOMuVqZYghiPfGOfhGpTFBHrMPjteGvMXjZNqfYcOeAZqAkJxi",
		@"GXaaRMrxTZcvSwvBslmfJQlGszBuuKEfnlldGRRVyuRSfOSmYRUVCqfWAynnWPvjzLxfWccBGHMobwVVzKVGrANFayXqUTWVrcQIZywbKLEeXjEQxnS",
		@"stJLAtMYNrCcDjpJGMTFskwPdeHjNuoHRLvzduSrSzbATAZRZpXTaHKtVKfULOfDYjXNbCfbXCDJeaXKFcZyZVFQGFhjBbmYQPexlR",
		@"xWDXtfKRUclEmbuzsolsvffyrBZnXQujAwWGhBcyxCeXdyZBNKutbXmUYpxEZeQsxbnvIPPeWqigggxzJxfsXkzmIqdDOfYPYGOcPtnVbEeRRuAYsKXZ",
		@"zcgkSyXapLnacawYVLgswrbUokCWYgICwsmwAXLbWrXOMPQUceLAAbErShpJGuZnpoMWeopqIphUHImPkLNLYgjYKgeFKPoYOUTdGXkZxGjcMuD",
		@"OLARqUgvbKCJoIJgicivxxlOGnJzElmPqZibJCViJBdTwloJcYataLoYXjcrRPDgDaUQmVfeAwekzPZIuXMPaDpmkaeelNhdWFjQgpOLQCSqVdXnRncNCXdozeCUFI",
	];
	return ExsvMvLJguwO;
}

- (nonnull NSData *)ZuRGBDuQJRYB :(nonnull NSDictionary *)shWPNeAaoxJcZgNS :(nonnull NSArray *)uglRINQcshN {
	NSData *IjRSosWUPXcARCd = [@"RKDGsQvsJoESIJgQCZTanrgcgZaKMJFqeOkaDVutGRARFtiHGHphEXuYpgtXaRBVuiunubYFXKPgFhFtVQEDHHlIMNWwufzzILmYfbHFaQdAmfupFnPeucvVpsljudTKCOmhNP" dataUsingEncoding:NSUTF8StringEncoding];
	return IjRSosWUPXcARCd;
}

+ (nonnull NSArray *)NmvehmkUPfKAa :(nonnull NSArray *)ZBgqJwJldEUyxcR :(nonnull NSArray *)iWwRkdHlUF {
	NSArray *ZaLdiUTOnX = @[
		@"AjPPIZzdVgTMxFWYCNcCBOwLKzRDqnZHZYgxrCkxyqOtgXnoaOLEZjRXgKFuXNHILJFOhFfefHFILBJYXKbXDzctVtvcEuPlSRpCpVRKzOCxsQjnSQGTmUvMIXHrvSXQYMiGTNOLsqpPZBq",
		@"pKcjumFbeSvceXAIrIAheHxhXJBwrLcjLPEsJNDNOqWQqsOTWbxwAbWCMwONVuRHgkLAOnumufDLWBZxXTadQkvlPJGFKkvJRQNKtd",
		@"XopeWGZAvzBbDgSQBKEzYrZPjmQLDkermsOMXaeDtJLmOVnvFsZtvKZOlQeYvdNWmsqPlSLIGQNNOGUbrrsDaRhlrcevguJfnbBCs",
		@"tfqKmeuBBqrMRcollFfSaZcHwKgwlgdGHeXmKMSFHhnRGYvnWMwClxFzTNmKmqGjxOyyRrgYTDVXWYbgTLgGtMcAskfAjukZgdAQOYuEWEJLlGgKGXSAnAfLgdSntYpCPSKgFE",
		@"kbPyfhUWCPbfeDEFoRrUDnUrfbZTmZqsUAubofycLxAgVImFqPwFHXIJzRDSyLIoAnZkAiZmrlBCFDTygzHUcNOuqKqtpNSTGkbqZCjgOKjEaFxywiHYKjE",
		@"VWlqGbaXNzKTZshjGTRXCGWigMePkYPuPZXKuXxiwNhGPjdgfucRssaMZqSPjTTFjkHKkzxlAHehzClBgEeDRukjDWSAZtpwnvmwwrygCRuyuPvVnnwaccwuFaDxNCPSTOptfHqHURfRm",
		@"TDFnZecZdtpGihmXkhMTknkIfquVNXCUSuXDAFSMXknLHczhsuJErzZYiGTFKNMYpQSOXzwpdnXRxYPFGasGjVzhwrUuyxfdPDPasvclMnsnedpJmDTJbjeUaDbdzWrYle",
		@"qJACjVRPusXiPKshYJgIBHupRJRQjfQzpVhHBJLQQklxeSAyRrdzyIsiCXfOnurYUMoVmtcEmmAsHBaDuMJRVpZYPsxRhWhyfnTHlplvCIDmdVAhyZfHRgNnuCWnGMghksbgQgHdjiPwWA",
		@"KJJmREBVvGBCPCjRKuTjPhgfqwPTLEJTbaVgJkcDIuNeErhYSCqPUKDTPZpWyJQQJzOjHYHGlatIpyYvcBAMncLSbmtmDKEqrGqklbOURTeajXIRiTxtugriVJpOFNLNDbtlXs",
		@"dypDvnzqKIhxvxXgncyzVYrnOPZojuZVfhKNssoXnXZodzHnLUgylDQajHBFemkkUlIeNMtxzbWpAUztkWDimHKaVZiBWoylnaTvBwvPwFEvAuVKTzvIaZFMIZGYlzbjUppWEEpWKAviJiD",
		@"GNUnEzPjqSeLjdwFqLaKhmPweIaBfcAScdWRfipmlifahjlANsUyehgXiKULydJFfgVGNXWFUCgOcRHFTnnYfIEWeGADTwQvuaWtjyZeTBetlLqlOmqTxbraByONzocwtEE",
		@"sEPwwXGZNiFErgSudOLtOrFEHzaHyVtOfejMgbTjAbXrWOUswZLWBAdvJBzzNvUMNfOMAZYqGcVNarJzXDPeWLvccWRoqUDvsGFzMrUAiYoRDeMD",
		@"CtViAcFkLoRZxaswmhlPrARgSqSliuTBikYHeBXJxIpNwMESobYhIqWBvHvvRciDEkYxqadSqUKFYhifKLSNxqrQBgjCiMKeAHSPUsvXOU",
		@"OCwtsQafjrZVOzjtyhRZHOOuRvsGTsQsFnZtnlesVNqDfPSZojqYgjPSVNBXtcUbShtxnOcwCjNCJHxFkUcKhKQYGmfroOWnfCoVOIWDKKjGTUxSWXIfnTFujILtkErWgyZEE",
		@"xwHsIMjYJxwCaFcOBoNObjJKEqnkyTLsgbfHvgStRNpJJAFfEYjimNrCpxJjxYZiKlZnRwSdlAOdqAuzZkJYokaliVsZsTHRrnLPfajcqsvJt",
		@"kZLvpmvAjLzydirtvRuBAIKlcSUejUCVevqFcyiDLwQvdptLVBntYJcXhahIVVYcjwQuRQDFXJnfkkhIIzViaMfmXArpsfYwhpnLYvqmrwBNHTNdFbyzzEedmcEJAeAhcteDDRBxkvaFokpDNm",
		@"tjjxZoekvrzsrhbNtlCvAOLfBsrFxeXakpJMhxwszoCOmGhuwCQdGozWIPvJDUwJFsbNjkARMZPhOwmURnQVgJSMfbHCoJKPYbsltvSFalXcpSnpCpejlpfrbjUhsGUomCXmSejNgHUNRCbPKB",
	];
	return ZaLdiUTOnX;
}

- (nonnull NSData *)OKpqXjgzkGDjYG :(nonnull NSDictionary *)pcyUYqCazKetMSGq {
	NSData *cULyjiuUOKd = [@"tjDzZCaMqUVsQTPCBTIbnwLoqbcphDhhzjWvkCDnJRqWfjgscTfUCatFsYMVWZWoiGoAxBFhYJtqlHmEYkUOhCxFAdwwNdjDVAZcTPrkaHuFWTcNkOAmzyyFKdJpYhjGxpsxoSCL" dataUsingEncoding:NSUTF8StringEncoding];
	return cULyjiuUOKd;
}

- (nonnull NSData *)ZOeSdcoQrOoqtxFF :(nonnull UIImage *)qPtBsjeBYGIZy :(nonnull UIImage *)lIrXqDNpruG {
	NSData *EGxvOeUAKTPqJvVn = [@"zaunTeMhRRaDmaOQcJNjKSYiJNijtKYJVJrLEXbNqaizqtMlCEICBBTbUmUfClEGHjbnQXGiqbJfrVpGPVGqkeAAxdnrGUNitnBBvIXFtZHNROeXXJUyBKilrlWQp" dataUsingEncoding:NSUTF8StringEncoding];
	return EGxvOeUAKTPqJvVn;
}

- (nonnull NSArray *)iLEtwmGfLLTXdT :(nonnull NSArray *)LpXlDXDYbdmqyyr :(nonnull NSArray *)nlxpfwsgKMztLKgNRpF {
	NSArray *vPIGkCgjJTmtrjH = @[
		@"PqERleUjyfKGCPDyzchVSbzQneDdQUKaTWffBurmhMSrkuZvLbDOvsolfHjvSeBFhrkrHVVDgXZmJTkZCvQsgsKIcUaXMzTENiovILaSXXuhlhemUKswUPzneVGVnrXyPJ",
		@"PWhnwUrjOFdAXvoAUuGmyHzzKfCdPHyBYIANMsLjVcbRRuJUSlhnYXuVYKGSQJHgJBMeLcAkqKooJZjmufzCPCIIukHwTFJfDcMGRCzDsLwBSHOMugaUuuwuTAKaYoABfdTcWiBCZppFlyCCxC",
		@"jXblvfPYFmmFPAibeCppapOFqaEmKsSDqNjadIVPqXlwvJrrlRRNxuolAAzltfcWIqpkUtJtmfnAejZPvAlgnUTXQItgApEFcssvjs",
		@"ffsOLshyAbXmauqkymaJFYiseXaJlLMYedhLYcFdnRcyQzUNeRznLrBbprrhNpiuiKHPiJEFIFnAtzWzYnhAMHiMRjWMPKsXCjsYOBwaBuJOBpRJmniCUvghurKykGVcEFoTSkeySPLnHce",
		@"zUTtIibqpQVtFLzKYKqZaFhMmokCrKPBrcYphkjcrBLcPNXaeDWwVllWPaQXnFmgrhTCcZkAfZAdfVsDFzXPkLGGxrzLdegFCRUcVRfLtGAaSFvXjRkkjPFOnCpGIQopSyOQrkaEBKT",
		@"vMcAuyuhOCGmWnAffOdEaqOqwxOuZhfTocnnxoPizDTCwFBYLNKwdVOECxULcTKNfRIlPcAbOEYFfgkbZtrNgnkXKJgVIgUMHFhyQheHCCwVg",
		@"yAxRfKraTaWuHmdJMUAwnWHfbGklGLdZkNpjWKdSWYYBMvTxfKpHqBpNikAaknACeOvhZXiUtOaSZeTUrIAKcEOQEHwOFghrupiYgeXETpFHevBtKOaYUFWVFCeVldkN",
		@"ygXgOjgJsNwskhUNLJMdKsZPSIDudAUMnkPOzynmuHATcrHPiLmWrnTdyWelHHhMeTdNKZqwFZxatsEOHBzEtwSQWCRskevzAKSYtAMAaMGkhNExfHAcQgIpnwwWlNMalaNZcSfmzoX",
		@"aYrGIwjxZmPIzkyWaSYpnWDuUibKppZeRSKZjNIdeBFLTDTIrlAXLJPIcEXmSmeKEFetXFMrpWYnEkWelNaRdhmjdkAszGRafuRdTf",
		@"eJoGsTajTdhxExkejQOinbPgkceZxoIUqLTnTBYTzVBAwklRUfeEsBAgTjeVOJtdCBOMNEoJJPYmkfQFNNxXSKBmECluOJgoErfkijqOmZQWBKBY",
		@"XrkaOnflvoexgRwzNBPjzHzQfowjvJqhrOYsISCMSuCgAKBAfPDPNiGJvMKvritjKHLquYJtdHQHgtScpKgPmwjJsJWOELhZJLmlrttaTjZCWXGpfIdJadPYURspSaAgdMbnDdZjYqI",
		@"FUkrcalBCunlohdhDkEWoEHNgzRiAKFhjpMqBXdAXmIpfUFKRprTafVcdomexzDVZQRcEpHcGoLFVcGiivzuBEXUQngVPAaKATYANWdAhwAFScQmdwKESXFAKAuEZbpIBnJaagerVvedwHwRafdzw",
		@"zTeAhCVizQAEmuTPSWyACYuWuJaRrTZxEjpnZkqAhaLkvAFEnMxaaZVhjRredDeXprBxzMpIFCqgSclSIaIhfLbvRArfmYJNZIoWYWiXiRoDJTbBevIqMadbbytvaubSpjWkrYUWiikzICk",
		@"ITLWCTSxURqBtyKsezcwJsoBrwOwatXcAdxDMHqsSzPNQeOOFGoLMSceqeGyCAyJrSSNiTujqyDIuxiXJpgYTclTGfkyMAkeSAdHMrgPEDeuWhHXhdezDWnTNLA",
	];
	return vPIGkCgjJTmtrjH;
}

+ (nonnull NSString *)VuJhYrrziwgd :(nonnull NSArray *)PEOhCDfcaFsFXXiXQYv :(nonnull NSArray *)rYihScsvoMNj :(nonnull NSDictionary *)MwCXWtUxdKbZTHc {
	NSString *bUDpvrpWatIlHm = @"tbJEwTnfJWLdfufbJtJyKexkrcSbXhBAeEGIGmqTIaxfGHEpxYfeXOPSdYohyLmATqJHtGiqcniYWTREeFEpvPWgwESqLfOGQLYXBqVflPYGHRiCWKrDCsjVjlUNktfrUYorQcG";
	return bUDpvrpWatIlHm;
}

+ (nonnull NSArray *)NyNaWfnxcQgBMz :(nonnull NSData *)CKQYyYxslIW :(nonnull NSDictionary *)xypmcFzEBxkBA {
	NSArray *nEmAmsWzUfcMdtH = @[
		@"VwXwELQlopPeGPumpIYjKNTvdjVBYMDNEXcFnFNyZWsqOUBTQWqTmqEDWscLYadoSdZbeTRHRcBzqXDHWuaFODdzfCxInWMwlrXystvyFhhWcwMMVcxoVdonODjnNknedwiU",
		@"bkVwARDBKhQwZlikmRJyNRcFqdwHdlSrCUdbzrQjedafaiOqAGLmtatHzGpeEyledkxzItwifCodlCTYOhQwgWxjPOehomjYSSNQjZqXOaNJLSEF",
		@"xOUcecZdVPSeeKbRdDrSnWswFSbBcCXczENNSeLgyxkRWJKzXtRsGJVIOtMXJgHKOTreiUIEgGWRXMDeVAoUUNchWKbRhgRhrORMDMTaidjRCOecvQo",
		@"FMIjVCwtDqytCVgwiiJyLuOhLnwQPpajVLOjpLVlAwpzpoakzkTPtltHzYBLdEEzKnoPGSFBoAXwYxhcNGdbIPgBtNsMPgtDGdZhzZbDlrbzDMdFdigvRbri",
		@"KylIFPgVFAIsthnJkxLxMjFnVYmqMRQhqwYACoKJlJTycmmHLEszNgCswRUkwecHXwtBLyGtPIDZPHqImkDtQpvksiiROtUOAiCQRJtbFSDNJfxJnbJbPXth",
		@"niKvKtAmTxVmblAjCuJJUMejUYceskRaepNwjeiylFhigzvJbYKQHwjMfwxEteiNASwAvTrxuWQGYUANUuLhYYAnUQIKUpQlEpGWehMNqiHRWpDWwtnQcHhEZVbrTQXCSCm",
		@"UtRUhTWdtccRtvWiPrSJMvkRsugcmtpKwNdOaDFixXIWivlhVPtfAjGNSxHImzZMRTDqCCdbtOWeqmtZkaKzoqlMGeZRsWfjbseznhzytJVJIEuOET",
		@"mSyoOsBIDezwSAibcDrzDqXVQkekYeOdrObmogSuHuJlSQCcUXQzqLEhcqzodWgeYKRXbyWiXDnmIiWyQizEHcZYDbOXVhDvGTWyXjpJAvBGmAriSuLMNLdQgywPQLouYOmWxFEtY",
		@"kkXvOwXngOIsdTpSWzzVdwsXJRuLKQannKlxNvHCleatdIXASZWUUiFsJdsmyCuxpUriauKrrIdkMBbWaAOcGFakNJtpAjsZgPRLxFs",
		@"SypFCwjzBgCZacoqrCbsWSlxlEjKLeiagENZITJeWMZaPlTlNHPiZswdWrKQlHiYmFPmryXmZnSldNdXWOYepmgfWDmldYtcuOYrztqCoycnAsiVOUrKcGgfZjdoRZ",
		@"qRXFIEJVmnqFRhKRFmrVYLugIaeZIBKFuicIpvhfqAPFvzdutaqcngMIPXwyRLuqSzJBUbJoYrqMNsCFGitBwuSIRUudGBfDBYzdPUnHKuHOYxbLRbZfVqObyYINboqbyvFFEPaZychgyO",
		@"LMxGrUdiwpJHUPgRftaOecQdUUwsudsMDIkbemTjfdTHPSAgQzfAUmJwrybDuPMQzQYVrbEqlrJQiISOexLyJyDWWMUAybXfDKZXfvXjvPOXducKqfOaMkZBuWohqmYhvD",
		@"NAIsvMGraYcDhmmHxotGJJQJMadrqUFJTQTlwEDgcOHaPYPPmbThfukFXzuLQZcBaVFyqulHaYdthhgxbSMmSdmgxWapiMprVIyxkvOnUuGWJDfveNnDcQMUlsUxmQELprmPwexlHwxdKnmEry",
		@"koutgBIVbCLiwMkZDqoYPMBUOFSvOYXFcVgVroDgIhocVFCREPiFGpoTpLgcYjfCGJYcaRkEuoBlJfChoNKKtXeJzmoIWCChCFHRFEFMdgfxOoXYhkawLPCVDLccMPyutu",
		@"WYRKioIIIAtGtMTDfSfQZYTOfXTncoOeRQIbJxOXCuJuSbEKLHKOEWeqHMVtmErIJzQKBfCzdOpTpdIUfcVeHnIAhFsjJTNSJvaLPdNvcRdTMFaNSbEbQtiEowdAaaBrbNMFafGDr",
		@"DicedJySifgAvzpaAOGrCteszgjRiawgXoNsnAYXouSJdYnzlRVDfAVkKreGpEqmlZBLNUDTkGpCgykARYUEtBsNIuGVRPcBndsEWItZSMoYEmJvDDWjGoZTVVmmTxOqnotXlhO",
	];
	return nEmAmsWzUfcMdtH;
}

- (nonnull NSString *)LkOHySiVsVgqhf :(nonnull NSData *)XajdeeQenklvF :(nonnull NSDictionary *)HYxnJsUQxfBEhOmk :(nonnull NSArray *)FaehOFKdrzJztVRvVhj {
	NSString *weqHtvIRrgkSDPa = @"BqrewqiAPLHWibTFmhdLcrQyadjogNGUDsIXCfwWltFWePhDOJlxdboSRYUIeHgoVdmvxxoZugpHqVGbEmaVwOgFFIsehrIxqmQw";
	return weqHtvIRrgkSDPa;
}

+ (nonnull UIImage *)CVIFBqLNkGFfTtL :(nonnull NSData *)iXNBafLoyrMHopBC {
	NSData *viwhfflECcZQ = [@"PoKFYimaurhvisJRuWcaopIVCErZDjplYzWbaklREijrjPqCbqPFROTNoObBDCEqbTGSdYVSqepdCRmrhUdNuYNixaZJFSfEShoIizZSsCiREnOJDcVzcEcGKNxFPWttdPcjOGbBarUEqkg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ivVOihwAeV = [UIImage imageWithData:viwhfflECcZQ];
	ivVOihwAeV = [UIImage imageNamed:@"jaMaGAXTSrcKjVNRYwLdFLiMKYCkXjWyXfLSimveYxNAdNfVGJChPRvtfUprHTAXULlmmFsYxIyJjmGYomOFJeUMzpRYZDZpALKzcGoKNYXssBqGYOLVYaUdb"];
	return ivVOihwAeV;
}

- (nonnull NSString *)DButcBQXxqAn :(nonnull UIImage *)WMwOEndErG :(nonnull NSData *)sXiEEIFNTQj {
	NSString *OPNCFVZRDRwzmwF = @"BygAYWPmkVCFKaNDPRhIUchYUpBqfsCpCZKnMOayQOmqLqPawwbzyBhpMbjWKLKxdgZczEoNFIAEZYmyUMlWCqtqqFsNwpGlwRTGFcHPklRNuKIHUp";
	return OPNCFVZRDRwzmwF;
}

- (nonnull NSDictionary *)QNhkBCsOVEuIiaZ :(nonnull NSDictionary *)IoXeFmfLyEw :(nonnull UIImage *)DywqJKRlCvCclQ {
	NSDictionary *nSjIgwkNlhsAkBHaSxI = @{
		@"NbjWwPwEzEoAhq": @"uFVCfDTgwdSrIpMEPYCosNkVxnFqyDodFqtbcxTfAHfuXvqmipKQHzGIihOCcNLvwZwhnCZQNkyaydBMoCRibBXvYsyjHSoJLGEerNdtRhnTtwwEBamJklMTpRBBDzndIrw",
		@"euIoakCcZK": @"RLiAIWggjAzTxekQSyOwGvVBacuaQUNzPzPsPMSeAEcevGtOXEVqiLwYzUcDJntNuuCFbHKHfAdqzdnSOksfzmJEQIwbPBbFxMWfMpuNHQIykObBvmAJjoGvwWdRpLyLQXRmXJZse",
		@"PpEkSQDPwVjjOfJC": @"mkTjZmzsurFLWuuYdlQObpynziyAHHgRdyleYFmlMKmCwxQKmfcOLpmakRTZEaFuFlrhvnypRWzdNxLqnnndaypJcqPPOkBVcehNIteKsjdDLiWcNMYI",
		@"MJoPkFKDdTcFzsYCj": @"gNCqyEDbafKwkPWIrSVfHayeIAefrLtgoXwoaMVikGfYcbkWHjgCkNKcmhusJHYVymQlAmWVBULMcHblgWWdsIZjPIhUhLLtZgJAMsIVrhIYUjHkOtFGLMfbxmIzaEVZWrCJBIykiVcWnuQ",
		@"qWtzlwboFYVcvly": @"NmzDAPwmQfgTgLdYVxXLGUXqPYkFMxvqjVzqjttIdOJwBGtlgQXDWOdmeIGQLFZcyOyTZiuzHQwMDsYSRNCuVQPvtzvFeqqLoDIuJpKAEXLujhLYQEruplhKWrbyxksywxpnsvFxvvPdeGqhZxAYm",
		@"uDStaXUpFdWhjVXWL": @"sJUPrNJtxMhuWVIvIfDalxFchmZSLzPbIuRCCsGGbyQrFeDivWSCgeKGlNWWhyhgYCtAGFiexTbBeSwQdLmBdngTIycHvlQtfUhIrlCTjmAjGsqtJdMrmASe",
		@"WDeVUlfpmuFwJ": @"spFZvuCWIakYZqOdJTTvFeUyDfDULxvIoFLXWSEFGHvMpmpUkqOnGeHhonGiavInKvURPcUPpsSYAlGYHXytQxKkwBndeCbSitjSNtGohQacajkrRuQeGQtowZJInDOLmiZHSyv",
		@"PoqMYcJIuHLZCnO": @"WkefuVZDAQunVKdvvqTKmNjqhDOyfUMSjDwfASALlmptMdNVAjYyZZflnbhufvvRmYVTdUqlIdkhVylEPCNaYUyoQmoFNZtQrleqZXBqFhjlZFVycGTqfccQUSFDahBJHMBJUiWdWiEeg",
		@"nuhmNBCfGqOMdKtHNS": @"BkQuiDnGhhugyBQBTgkucQJQBIYVaxDMcBxAZLaIodksWbVSclqlGjGEuuOgcqKRjlYRySVZXiOZHJprSzHnrixFwDExNyRbtXINGZqXlkaqjbePAzbTWrWNhVfTgfDq",
		@"vXFzSHmjDuDjysdF": @"aqDPXxhCbNQXNvmkYtXULzVnobkXgHpTxSnNXwRmtUYkONvXHTRywlMlwnfazxOpcHTqCbAlcoJpKmIYmxFIAjwIKAqmFMUfsAeIbHadtVQBlxHUZpgLOutiokPOMKLFlp",
		@"TTDIayIvXVLCYoDTgMQ": @"qqzZIXncrBfMVOPWrlxVNzFdYVhkmJzagFCqKzyLqjcjgcQVLWruGCNkVfhyEEAJjZfppYDkIdNhurnmxEGIUAVuKeHwernOVtpCltoYnxmeqViGmrSgyRFBjbpgjFqcJRm",
	};
	return nSjIgwkNlhsAkBHaSxI;
}

- (nonnull NSString *)aoZMyZbiqc :(nonnull NSDictionary *)gXisGzyWCiXgscLr :(nonnull NSArray *)LkLTXrktzdeaADVa {
	NSString *IaRFUXaujqO = @"mFglprjcwoRRRIhBvJVkVgLVSZyXwfSBdFbDohVRYBSDwqCwsiKassGANIZnpltxDFUeeuthhdwRDLtGpguVFxBSfleWxRHrqoztJZcYMWcNfRqWHNlqJSutMdLalz";
	return IaRFUXaujqO;
}

+ (nonnull NSString *)BazQVjEgbOePGGXtx :(nonnull NSData *)MScrEbVccfKvTjZ {
	NSString *qPnkmoAoVGHv = @"iCehUTCRqlMYfFAyMCpWGaKSPPDJfKqNaKQTnTdcInJdmJrnmcPRXmQzEnmlsgYzRhnDzHiivpRhcoDOUPqZDKtnQkwWBEYkAUgjCrSTmcWrRNOoBcoYSTpiHsZ";
	return qPnkmoAoVGHv;
}

+ (nonnull NSDictionary *)XHiCgyoBLMzgiUvYq :(nonnull NSData *)vXlMCiAilop {
	NSDictionary *AFOzsZoqlDGpkci = @{
		@"rxPEGurUvrvbFeQW": @"NWISSgEQcZGAVVLvUvLRUmDJSInDiUeioSCSiDwvTnWZpdSgfnbSHKQrrhTyzHVWJfUuxZWOXbwnETXGoXZYxpCvZqzVjErqqFYElWZPkvPvIXBTyxMfZOGkhRXFIigrwngEmuJfLwuXao",
		@"hsIHmQmIWSVZQXfYu": @"hcdqNOiCeVhkxETqZDWnptBidMgvHJxcrFKEXnAxfwKjXEBHzDtbMXCEMjkSvjEOXvanDXPTgHofQpdOXJLadhiRSDJpwTBtcMpmvGNGCTRUBwKwbcdIPDRT",
		@"XAIzJhWHOSmsmwv": @"ZdzcHbtDJiztcLSULLCKkYsmiWbkMSYWLYWWFsEKkDZAOpJCXaReylHzJoqVPgboEoMsIyulIqHeIYcIGbiaZSwZEKKyyzXnAMbCaBcsnkCJu",
		@"DoNqnjaYdfUZfNje": @"cqdfyvWQsRrnEwSsTVUybXwRaDoPJgiRRToivSSByxJKMiOHklgBBsUqGCIoBkJyrPpNMArloHZwCeHEHwVDvaYYQfYMzrKPSqVzXtPZKpPnaLOejucmxWHTIaJtklzXokskRyt",
		@"PSsvhbPrhriHMdoIjyi": @"pYQCxJCIycVFUheNinaqcmxdlNOzadoGrDHsRTSXKLmxIncdYcRfQuMOmsRPqkRVGWsmSBsWyEsJJnqpfMMQbAYLknMQXVEshqUwedN",
		@"HrAbNkZOmCwlWRmuR": @"IjZtADkLtvdzWKNAguALeuKILYgWgpqUHbinpdDyAyWrzNFEqpazPmvllpzNTJdpSPWtKWOMNaQAPFaPMuSEIzALGSKdQNZUNEEOTkEmSJtaldaPBhxpiDYEuWbLxxgMxKWqsKVJROobhJJvq",
		@"QigYLsmOctydjl": @"GZzSSpCSybyfnDnPVWJSoiChcflgPuYtZAntZVkPIFCUgdQvKomzTUfqsHoeWaIeimdoeLzcVFjcUVxqciCOUsKxCOtXAHIRMciMIJfIjdDpf",
		@"yBVShqZFaSzLYJyQ": @"zRnEMdTWLhuPaorYJhpcIknZfkUrqAlvnbMqZEcNIfVhNbOwEGofIefxrhNerHiLgnFNYjzKMFZSOxBLJerVToCFNMmIXIUjExiyoUkWfWhTOVhkAppSKALUiWuGEukbYozzYNfqozkztzuMk",
		@"TGnEkAkKbfAcxGuVy": @"wIxsMCfGEjNmzJxtzHDbHlIwYukDeFADfMXOdQYZfSFmpxiydiHSQDBBnmexTNglYffmhsIdxtVsTswhJnmYFownqusMYNWlPKyLTXRXesOHRPywnnOHGOoZzlpIyTWtlwxYjXJiLABgsarVNqQUh",
		@"wNmQUYNglNoXdD": @"vIkSNeqkZIemOnkKJhfkCaDXsNgXFPNNCkFloprznpvHjCaKMvzNDMDbszgRXPkbGvhFmMMuSTifYKpekdXnGRGHcZENBOtfZhGXHIfmuR",
		@"LzBjssHhCF": @"QjHtInwqtYeOZLvdmrQIySVHwdXsYBXfxpTCLmCTtRXIAZATSmWDBkdpIjpToqmwLNIyUATFApxJbSHnobtCpcIiKULszHRJUVflbNRMZqPzJvQlcboQaPodSuDgiu",
		@"kRuBIeSrLvXwh": @"UDSxYGlPHiXBoojtczGAuInskwUFmaECiWYCHbRGAPiUUDxcNtbHpzpEnbFDJjVnpEEsnQPPyRGwOXpKBZmGeXFTsoiLkBXcmWekBLzPZSLjXjfEOcMOshrmgFHd",
		@"IZRYmwNEud": @"KjquwdjuXsIwqMbsRXFnYYQITAJmfHbJlvqKSMolAhuzFKguYUZWOQVHfwJVlWCaCMjADHZIwQqvZMLBZcnELHLSlWHznmAQiSbxKrsMuJRZntaBxMbsjmWKJTz",
		@"tkHEtNExdK": @"pSJjEQvwqnnVUhXldHdvcgFzujvYwHtbvaZNwKvEOQHRCRUiOZkBgoKQVUEDohuzoDraUdgaoPwPvrhBJSxmHvqvVDBJYfAaqpbHdxUVQUMhdmAaIKSLzIpFYoiPoUXQNwPavjbgnITaiv",
	};
	return AFOzsZoqlDGpkci;
}

- (nonnull NSArray *)BgqkTRRBNIqWlbpcuU :(nonnull NSDictionary *)jZSxwoCiDTJnPNaCcqO :(nonnull NSData *)TkXaVvXneDetRagULA :(nonnull NSArray *)hASYPTBDtpSEm {
	NSArray *XQrWkCCUmzhwsfm = @[
		@"lmxdBuUvNpeeuonxUSmglibwqalwskbfXtXJpACxhZwTFsADzNdYdBKRFWQaSAWArEmfaRiwrvCelJpflxFKPlIiQnkvcQPhmJWEYJCHmdVDhVDdrexHrTKmUvyevIgohITpXSkqMgNfAy",
		@"MsWmuReQAKXYgmjvekYMPPtehWYIRZDXymNzQvowyZGshMUYJErHGIANisWVcLBngxUcuiXDutclpolmFTNMzVrnsvmIzvbfsaArit",
		@"EClIpbXUXNVouCrUwQAOFVuQOVkRZyptGGDuwvJIMGsAtVPrvYEZhpCspyHKgjRyqgOfRrkTRZWhAMeIkNOIftyhFsCrFQamvFaxWleEYrBUGkvCSxfIYdtPyrrUxHhqSUbweiFgQKjaioEJV",
		@"iyacvnzwjSWLlYrYjIQOGLylwxmYYPaZRwdIfiEVoEARLwzDqTmMsGfmuFlEzbZqSKQXFaERalkefTmvmzdjbxljkVWiGAkiUEqvgHyzQIjzJgf",
		@"AoDjJFROhMqgqZJufzDTtYBtGGYCHNLxTxPSGHFhErJNbYCZoooxcxghFQSrjgwxQDfiWmQtfzWNjPLAwlMAbFyTaTaqlnAygVnZxirTzMYRbhpgKmIwKbbGnParDgONXWKcWbaZZEHKcNulwPLLx",
		@"TpDTyCjemwRplkwbSfGgEAOCbYUuvSQOFezbkwWBjxTiraHHuvlacBiALhqkJjJvVZjPAcOHRdwDOWUnvgVkaCprrvwWhfjkVZIorroXoptbzoRU",
		@"TTyzXXyhAlYHqezsCUWoSCKnXRRLKHhNjQaucjYykvkPQUOgSNZktGfDHYPERwNCKgSEupDXkTobERSExtCcgDGYUqapceyMnajeVsQrLfjefZiSyqfTgySBpBzaCgGbibMESirqJrzQSh",
		@"KRDQGnCmJDGPAMrGERCmPdcAkmPlPHHTvBqBTyzpVduIWRoiTyZjGgglzHtMqNgLQQDnxYIlwytqGQhnVNbwbDjeCHchwfeAMRpLsHCNuEVaIlxfjHeKXNFPQvhfG",
		@"dvHOHQkXMVjDoftnZeiqpELuOMGiBWtekpymwpZSpAzswwpaQvxtLoreljDlkBjoOvDjNqPRQeLOItZImuacChaPMYIPUBFmTytxuwSwkHnTsTXCmFaBxDuQPBNGcDBvoVxPeaTazPTaIOzWlwD",
		@"DiYelapexyBpfxzkxeCZPFpcpGTImXdJbAYyRZYwOBeHHyrwlxTKanhOMaGhQPKeFRxIWfnQXvcqIkpiQtdPsDiQxCfpwmjlPxmaZktkbthJwngNcoTkzGcneCgyoyLpbzlcNs",
		@"YgzEUkWFojVdJhkeTbjRhhTJmpmJPKSeGTlEQBgiGcTqvqMyKldGyfMGAUbULYyUSYLZJeZsZnReEVzxZRxHEUfyJWrSmFGYgDGXUEhl",
		@"uOnPodlnFgLTAMzKdfWApeZhgDHRXOvLLjVUneHqMsIKbTCPZbwbdETOeYyJTHZvQrAOnBTmmXiAetxZexfbZyIYzNBvKccJAfJOfmSI",
		@"CiJrozMSIxfbJtUjEmsjJBEmwJDjgRIwPtOIZWwELCffmWQVbOvObnrFWBhaDHkTiAOkTRqLMZZibigFiVrGXcjOavVoXoaGgEffuocEofCRptWYGFTYeArIP",
		@"KLgsBmFUiyNfRoWUHjxMdvbvanfgBuXTFGnXBNGlFfDrPcHNqMpICXufDGuVvhAvGoIkDCXctDKCKAFdQuLCYJgjtGOwgECQZpbgVgHFpocwWBoJuphyJfngmrqFOrAiGixbbT",
		@"HAXkrDPwobcYZkVkWkzBkOxgwZqqdlayzfQxMPaFHdannvzUwkljtaXeGhwEHgvhkQepqxUZKQmgdoWsQYrBaxabJLCSUmGBbwZyGtdOTpczqSUrvscMLAYzLCvkJGimJ",
	];
	return XQrWkCCUmzhwsfm;
}

+ (nonnull NSData *)jucJMPBQhK :(nonnull NSArray *)YFRPJlBcfqiNmsNkSfu :(nonnull NSArray *)CpPvuYZGolvzOynFF :(nonnull NSArray *)sCxfjylfTA {
	NSData *BazPkUSlsHwtFlT = [@"iYBOPQjWlzjITJQfTpSMHMmJKaavIYCmmyBFIsSmLTuIgCuSlyfqgNCXBOdFKVbXJCNJtOeDxXXtQPxMeWgWYRQvVkUdbLqdPFUcTGPYObxecBCLNuCzIqdd" dataUsingEncoding:NSUTF8StringEncoding];
	return BazPkUSlsHwtFlT;
}

- (nonnull UIImage *)pFwlsXTVxONsSex :(nonnull UIImage *)GvJmvHWgwCJBodvYz :(nonnull NSDictionary *)eaxDUEXfUaraN :(nonnull UIImage *)KsIIPspJxNlyFRf {
	NSData *BNSyTzpotW = [@"CNneTPwkNQlyAJiinsdvpuhPyvHHqvNjbQQdXDRnmmTFrPUmtedSLuJeZYszScVReTqxyjhnIsEpmOQqVADVUXHPtikzEwROGljQk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JiKKTaROGTkAFqDsQ = [UIImage imageWithData:BNSyTzpotW];
	JiKKTaROGTkAFqDsQ = [UIImage imageNamed:@"wMTzajUSvhEPGrAiiLRyMSNlMkBaBLgHdxduheAXlxAYQpazajPKTOVzgAweFFLoIzvitPuJVqDeOvKtqCrQEiPwbFHwxxDNBxHIiJLIjpRuiJbbsaGgEtMfSeothcnkshQOrMjgdahvyFEkVx"];
	return JiKKTaROGTkAFqDsQ;
}

+ (nonnull NSData *)UAFUIUnVWKOvxsPDC :(nonnull UIImage *)RseUSovPJCvlcemmWXR :(nonnull NSArray *)VkhsdqfGzgTrjcz :(nonnull NSDictionary *)nyKxgtAGCELep {
	NSData *kVDIbTwuBFbozGg = [@"gpZTKmwSfDTKncFpLeAIPQUnBKIffpCvNDASBErgPjzhWoLexcszUcZcsXqrqDiLltBEGhxOfDHOXIBjXJQXaDIzPHWNVeSTNLimNVTnFGezgr" dataUsingEncoding:NSUTF8StringEncoding];
	return kVDIbTwuBFbozGg;
}

- (nonnull NSString *)GfcVmxMuagc :(nonnull NSDictionary *)qAlCAiOoZYxJF :(nonnull NSDictionary *)hGodBOPlCTtB {
	NSString *AkaZoxYcRseXW = @"xFOVrBFXlhBflxPRUAcbNpLwsmXPCKvOpCJbMtDgvJVsrYvTjZAThCaTngtvTJgEsGUKwulSTdHRBjJRjvyOBkuyBLhhjlgsgPSyHWJBeFsxYLdwXvJL";
	return AkaZoxYcRseXW;
}

+ (nonnull NSString *)ScTSfyktYf :(nonnull NSData *)cZAkqSVFyex {
	NSString *CCTLDctTLAasPBpRBGa = @"zQFOILXbtwSfaYQpvigNeErQUImcAxVHdnWgyguXeVZYWkQDNindVvTQQmsomBgXabSeaPHTghklIFztzqtbbQmBJXgZuegeeTlvgwHuPbHEDXqPDuTJpmOmhFkEXrjexhC";
	return CCTLDctTLAasPBpRBGa;
}

+ (nonnull UIImage *)TjFhXRYPJCCrkvjgVdv :(nonnull NSString *)bXYmaZVGnYVL {
	NSData *uODlzSrouUSgDsNn = [@"vyauOjRQsXmpkWjiMRYOYkMQwKIPpSEkwnyBeXZZEqdZHnWPcRLBmNRAvCMiABfCpETtyeHiqWYMDtsBggGCurkvBPWUwIVNdCLTXESAqKtsduqbRbHkYSNVMTnutoTkqsOEKvdFlERSt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CnfdvbjAoKRsMeP = [UIImage imageWithData:uODlzSrouUSgDsNn];
	CnfdvbjAoKRsMeP = [UIImage imageNamed:@"FcBolKkbKjNewUXqDcyEfvTuyNOhHUnThNAWitEQyTcItRgfrfpZpWDirIddLbfFFCnMyTRSgaZORMxyCvzZLXcLibyqkFrcewkZIEnfmMNkxPMlbZKPvyb"];
	return CnfdvbjAoKRsMeP;
}

- (nonnull NSData *)btnkxiTvpBPBFfi :(nonnull NSDictionary *)zPJeFjCkcWbRQM {
	NSData *AamDmVcxqegZMO = [@"fKWCYqJwnKhrRvsUNkGldWOKZWIffWRgzdRstBHxsJZKfexvFEyedAaGSqzWNGxyleWLHzzdaEXQXunpQrvGtRARbJsXDVhzUSWvdGnsH" dataUsingEncoding:NSUTF8StringEncoding];
	return AamDmVcxqegZMO;
}

+ (nonnull UIImage *)WmYBhNJmpsYxGTqYjV :(nonnull NSDictionary *)ElZpfDjuQxWhUJt {
	NSData *wqMroWCvxWLTbzk = [@"DhxGWYHyGegvjtqjivwdfKAUOZlNQfbLAlfpJENOaGhNNFkOSxyZPIbuJtscIhGLCKJHYsRbBTXpRNfboPPRITfEETCIKCQTWbCnbcMLVVS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CcXAaKXhnNrb = [UIImage imageWithData:wqMroWCvxWLTbzk];
	CcXAaKXhnNrb = [UIImage imageNamed:@"TnOOAEjrRBbFmHJBNardSkJilDILsyWEzAauJqXIqQrhpRxcRrlMkrCmQaszgPiUYTmcmxoArJmOJUxcINKlRAofcNTNCdvuZXyrWtLqnZrGkFtbqoBxtWGEpuKIvuWjj"];
	return CcXAaKXhnNrb;
}

- (nonnull UIImage *)BxQwXjTKUwbvuj :(nonnull NSDictionary *)rMUyPEQVINgAlNfl {
	NSData *FSKJEUDnAIfH = [@"aoHoXgNUnlCwCQSwlbWzRINHXDUYYsfnDixsMmQvxmJgbpyaQEJlNmlAYrgHESMNDnNxNfYVevWUiTfUdbfkaTCVBkZfCMXSJSDScbWIFWflBCorJfcTUPXHYAdKSyvKwJUpqxGrxD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dQqWcqHbuyuOcrjrz = [UIImage imageWithData:FSKJEUDnAIfH];
	dQqWcqHbuyuOcrjrz = [UIImage imageNamed:@"yMwgAbbaqrXCxpzddfJEPGiOjnTEGZSNWVCACAIbKQMPWLgozTdyxmXhJvoJjTOapnWdDLcpiinPnVlHmTujpGbeQbvZzcbPeFqLBWDbigTvUMAjGEVPpaJqcJqCenvPCUPZhKLxBbIjTXDtASt"];
	return dQqWcqHbuyuOcrjrz;
}

- (nonnull UIImage *)AEvgKMZBHaKQLKhnp :(nonnull NSString *)jNCSbxtQUpToMW :(nonnull NSDictionary *)rGWmKjXcqSVi :(nonnull NSData *)CPSUTTMqzcF {
	NSData *bfNtpcfzWCW = [@"MqaZFyhRJlJNSSZnyDsiRFxCZArthNoyDAQhbBPFsXyrHiXnlHucjUuNzMKOhoQzwkcEhRczanUkpsYbVGZnCIuzkxGfSyKbxrgYWaMHsRJNCLKqKofHsLnHGwtWuAcQnTTJkVElTiMlTvp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RCEzujDNsUJWQOScO = [UIImage imageWithData:bfNtpcfzWCW];
	RCEzujDNsUJWQOScO = [UIImage imageNamed:@"goRxyFBcANfsbBSUnUTzEUVAjbKlKJsrLdskNOFmBDpgkXwAgolsmtiObcVDAnPxAVckvAOFICyOjBDInBfnsxLbSzHPDHSrvVQhGwfrvkFu"];
	return RCEzujDNsUJWQOScO;
}

- (nonnull NSData *)bITQjslTrFN :(nonnull NSString *)iOYmMNIqUzsbUCww :(nonnull UIImage *)qflelHjqdqWOwrMx {
	NSData *CMdGbWESxZtHcl = [@"OTOPcmAJsLwaLXQkuAXHjUAeIIsBvneTmloESqlkCMSDEysAXsiahmADOSJyRRXrCiNWPOdRlvSccgRUfTVTLzuBjtHDTlHrrXcqpiPlWdXLJMNSNLuIOywyvHb" dataUsingEncoding:NSUTF8StringEncoding];
	return CMdGbWESxZtHcl;
}

- (void) setUpData
{
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=%@&count=10&token=%@&businesscode=%@",NetHeader,MystudyList,[NSString stringWithFormat:@"%d",self.index],[UserInfoTool getUserInfo].token,courseType];
    
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

    static NSString *ID = @"MyStudyCourseCell";
    MyStudyCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MyStudyCourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    HomePageModel *model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 155;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    HomePageModel *model = self.datas[indexPath.row];
    
    //根据format判断是课程 还是 音频课程
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=0&count=100&courseid=%@&token=%@",NetHeader,GetCoursesDetail,model.businessid,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             NewCourseModel *model = [NewCourseModel objectWithKeyValues:responseDic[@"data"]];
             if (model.courseBean.format != 3) {
                 NewCourseDetailController *newCourseVc = [[NewCourseDetailController alloc] init];
                 newCourseVc.courseid = model.courseBean.mainid;
                 [self.navigationController pushViewController:newCourseVc animated:YES];
             }else
             {
                 NewVideoCourseController *newCourseVc = [[NewVideoCourseController alloc] init];
                 newCourseVc.courseid = model.courseBean.mainid;
                 [self.navigationController pushViewController:newCourseVc animated:YES];
             }
         }else
         {
             [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];
         }
         
     }fail:^(NSError *error) {
         [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];
     }];
    
}

@end
