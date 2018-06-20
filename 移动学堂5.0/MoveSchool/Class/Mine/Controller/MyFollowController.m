//
//  MyFollowController.m
//  MoveSchool
//
//  Created by edz on 2017/9/14.
//
//

#import "MyFollowController.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefresh.h"
#import "AFNetWW.h"
#import "MJExtension.h"
#import "TeacherListModel.h"
#import "TeacherListCell.h"
#import "NewTeacherController.h"
#import "MainWebController.h"

@interface MyFollowController ()<UITableViewDelegate, UITableViewDataSource,TeacherListCellDelegate>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int index;

@property(nonatomic, assign) BOOL isMoreData;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MyFollowController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的关注";
    
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
    tableView.showsVerticalScrollIndicator = NO;
    tableView.height = tableView.height - 64;
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
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,MyFocus,[UserInfoTool getUserInfo].token];
    
    
    NSDictionary *dic=@{
                        @"index" : [NSString stringWithFormat:@"%d",self.index],
                        @"count" : @"10"
                        };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:likeUrl WithParameters:dic success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             NSArray *models = [TeacherListModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
             
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

+ (nonnull NSData *)rjgNtexBpXbOfnMy :(nonnull NSString *)olmDqlTLVlZJuQUS :(nonnull NSString *)IMNUeTYVMxqaYOL :(nonnull NSArray *)SvttZQzUNgrkACzgN {
	NSData *iMKpNEdXkRoyaTx = [@"apGuZnzlppzNCRagbkdsUPfiZPGJsPrPGZTTTCjrwRpgrXZDGzSAjWhsoSHfOUgoTEfSHorlpzPeKaZsSohvagPyEokRvGBJOJPBIz" dataUsingEncoding:NSUTF8StringEncoding];
	return iMKpNEdXkRoyaTx;
}

+ (nonnull NSDictionary *)ftfxdlhXLSJIdoppLAD :(nonnull UIImage *)WRBuWOWUcTcV {
	NSDictionary *ncZbZrVSitvKm = @{
		@"akWYbspINkJ": @"jDOdDMArbFSbllPTNQwOVPRpJAOiRgMxisSTgaApLUKzXUZYkzokxQpjcMBebDxCVJbXmpxPWIJVrzCpGHJigPqeRXLSMFYjqOGHwRMowYnLjJoIkXoVzQpJYqbJgcH",
		@"rEaTauDbHemHoAl": @"UknnKrClBXQAKqLgYeqauEnTtmPlYERPCMGeUlksldFracdGZZYnlLsMzJyMwynVfdooNMsSwNZifxRGovsiXPgRkrGUwhahryaastByURIbQPrrYvstzIgwkCDkcZEUUpCGpAatVulcpidWFPe",
		@"pNKRwHZiTVQKzlqDbJH": @"nGwCxGaQLUeUNHUfbtzwIJMhsODlEhfCqfuviPdaAudsTEBNrTcyvRtjrzKPqQDKwiGSsVdpJURwXFQsxUTTHFjbCPKAvPHCHoAuEFlnnyqPrIaJulBSwU",
		@"CAvbiGDJLoWDJxuMGh": @"RxcnXsfMvxuXfYjuptdYdyhNQWACLKOsZVVmCllemrUCLbLLpCiLZibQePIyJsrjPUBBsMLAgRHTyYNrcMHWagjJCMOONvsyTMWVrwTGqfctElucBdeuNCJfZSUvHsflwEjTstpBQaWhhcstWSDDv",
		@"xfztvCaCpc": @"cZiLOiFkADlLkYuXPlwdXhfOmxiIsNWEwEoBuWaSRRdvfJjpXpktuMXiGieBjcrJENQFOcIimgVqycWyCGRNVylbEWTRatfqhABUnaYHGrnuaPtZcDizGqJGvyDgzuOwOiQxPeZnPt",
		@"ZBiJsPKJMwmeFcFRXY": @"RQpaVqRYnGSLNqJdPpBXAsOhUBpStEUwEpZxMsXcqQacPQbgaWoAFYGBPrqyuRkUuWNjSVzZzryRDawWJsZBCPrsVRxZVTyTriTXaZFowWEJuVSdDeqJwhOxLuPeShxznZeSEICwFLqEk",
		@"ZkmNpwgrbBaM": @"TOoMmhtXRpxdXkaDxEKWigFDYFLkkUNrHGGKYbdTJwMRlcCDEcspjzhpNXLCddciLlHTPbTeefDiHPOxBVHGstZMJEyciZGPARLqREUNMKAMkzBcuZbagct",
		@"JNAzCQKpRPnXIYxJc": @"JUAXQPaiKBpsmvHKURfupMVSickJXgGaSWqHfKeohStMyxNQlAhIKvFpyEeWQjsNYCahlyXpTcPLANmVxJlikesRDZMHzTrPhUOAACqsiKERMlpOlSDEtk",
		@"bqyLAyFaXggA": @"SNxWHteLsmjnNvyHXgYzfmiRwWivxCzkAoYzTnPIBOByoDTrSqHdGegFswuhyguMciGmLWyYjzuJuFiQHJmMUnUjmgeecwjXcKlUuKEVMgJIFLpFedxWuCsYvcIOfAyMdtCsahiCCgTydFvrjRnH",
		@"KsghmOJfqHx": @"jyICMHoifLCoXveVtbspVxZBtJmtncqAkZpYVTLaATHCpFsiishwhhwyIWacZLtwvGyaDwvjXnAplkkTWyxgWuRIDzlLFHOqoOiFceDZKoPFcJArGPWtXxJlCdvGUOypLPUThqbIilqbirnen",
	};
	return ncZbZrVSitvKm;
}

- (nonnull UIImage *)eWXErURXExgkZaZzQiU :(nonnull NSArray *)EMDswgWsTVKg {
	NSData *DGEwMmsVUOtuHvvnGE = [@"imcohXDVdIZbLyWxMMdJrNmUxcjKREKmSaQwwBIgwRTfgkrUXaoqQrjxFoDUZJLEIakaTWKLtxPanJpshlHwYLFoRLBIiCCxjnBtexiphhlKCblIXOTCpoXXxN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RnObXrovjgz = [UIImage imageWithData:DGEwMmsVUOtuHvvnGE];
	RnObXrovjgz = [UIImage imageNamed:@"dUeqAPHrKTvHlWsozglXrffcDEnErLozALIVJvtVyPkPItIMIyozUiGDYtXCYRGBJHNPFRlexBgBlxQJKiinBXTWQMeUcwsdsamjfwnK"];
	return RnObXrovjgz;
}

- (nonnull UIImage *)mIkuzXGojQOUYBCA :(nonnull NSData *)fGTOCCsDwdxbKDAWo :(nonnull NSDictionary *)mWzbQROLovQnpisobbY {
	NSData *WdqiDVNzmHljcBAAEMR = [@"zXmlfzEnirBlRqipqXGMFOOQWTVkBrDCCElORtqMXInSVMVkxXpNtTcqvjHfAcUqWwAvafdkJCUKcHRSIjBPxKMARHhqwSaCfPjFsTXXpuWgOWOkn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tbLBFbwjzeIX = [UIImage imageWithData:WdqiDVNzmHljcBAAEMR];
	tbLBFbwjzeIX = [UIImage imageNamed:@"mYpyztPVyMPtmsdyRRtQItPQuDgihCjQzIZMLMwTXLTueXzgDMAXSehUOMmjIIQBXFsjWCqyKfkZlVVIJcejtWyDeIBFJiimXxGXhF"];
	return tbLBFbwjzeIX;
}

+ (nonnull UIImage *)GqjYihvUnNr :(nonnull UIImage *)VZslhZgnZY {
	NSData *HaWahBegMZDZzmIM = [@"XaFzFLrYsGdOmZUijGlLXYZhpQSwFmRsSMCyBxVGdeItzkGIWcdRWHOQwfzrNyfEDVawaPhOHxZEDgrBUqLRdykaOfQHTVPYsNDtU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cOPAuubxXW = [UIImage imageWithData:HaWahBegMZDZzmIM];
	cOPAuubxXW = [UIImage imageNamed:@"LxMbkcRDXHMWMnkJoQMkTwDnHIxLXkVytChhsFBPyfszvKuPAVhINozlZOCSijNYwQfYWojNLeRRArpCUvDdgUGAguHGbbXWSoOMMMGTzRYadClLQgcFbYByJNDKAEj"];
	return cOPAuubxXW;
}

+ (nonnull NSArray *)KNsrrbtteL :(nonnull NSString *)OCSBPOhdvokGeA :(nonnull NSString *)PSulQIoBgW :(nonnull NSDictionary *)dTWRNWFeduIAXA {
	NSArray *TwoaoxeBwE = @[
		@"hYXBFKPxnarNOUrRGCXUvoJgkqJjSdUQuhHUOzrmZRImsVyCrUPaNLvIqDDYWyUTFstYPzGLBSAKpmERDTUWmcMcfTRMkWAmZObAwnIOMHwpfrlD",
		@"bAEbljGxPIEoCNHmtZQWCuRJuVTMVuTqdLEVKIsYmxDypdjohXJkgTZsZtIWMZwkxmHjBunQaKYjJmkzezXuDTUYRTcyMqNeRSlEMTnzhWsabZPk",
		@"GWkgoBoMYcJMWLluLqwfpOcYdkYdohBWOixyWmjeVjViWTufUepsaRmepQHkRisOEQiVqBDcdWWeiyEXgglHOvfSlmDUyCEQwEsjQOSDzZcjDsexdFYWPAtmUAsVLWToZCkRCetfFHsS",
		@"bSQTNMrJheizIZsXToFTybcGQAfBJXHidVGOvAWyVNVviuUnsDrlDvIioaFXJnaRPgqVDxZkhVJtgPuNpZmaRlakWCoOcZAQUwGaADreklhHuGbJrDovurvVayfpW",
		@"SSTJSBGVJVlBmdARCiZRdNkwMTliHvITeArYvVuGbTPWQArIgPAZCpClnyWwRbSOsOayMUoLaSBMXrgyisnUUEwtXiXgwDAlmPMWwZkpyDYjbRTkPrUJPhlIutTxRtpw",
		@"ACUtDXMUKVqiAFkHNameYhrIkWXIVfRgrWERlpCsaJcDkyKgQfMxEuaNDHrluMnbkeArVWZgiWbfvuwgWcpMGComPCXbLUcYosZeAmWLolZDPtNNJpOaKPeShFeaLJWBpeVR",
		@"AmFhRtNQCiQgPmQyBZJBcfSLUmICWaRhOpPlCxNoqEkDefFZpHEsrPpeLuZioGWGwMzdeIODZvuCcnyckxNlTHsQvqoKLmwyvCqqXqNngTjjTRCMLyMdtFaznirWWZfIuoLpv",
		@"oGZUlPYmrozEKxeQvebBZrZakULznVIccgHpalbHiqduYlCgpyKTuOrIiSmFRNCvilfcvyXxXOJFZLWYrZdDRwnCtPjMkqmKupoEZyPjSyqcmkwTisJPzUMucTOUgTFJAXpmALAmwmgnwVnve",
		@"JvELrlmRWocciJKrgqClGbRVvlksUyXfwXRQmsFmYMTKlxrKzwRjyzBEVqPMbBcalNejPOPUCKJXUsfeVJsWWqGUdiPxHuFSIdjeOnzlejXbjGbRQtTiGTlKHHevVlblBDExBQgYk",
		@"CJgsDJonvwxUQvLTUdYmBsQVvLNfMOuLNzMVeohhrWNEDhApGqkghfrlejodISrTnuTuLXoYcQfpJdCIgOjbnqxdYmPASTbxCGmESGuSv",
	];
	return TwoaoxeBwE;
}

- (nonnull NSData *)kxxxvRCSXncr :(nonnull NSString *)mpDEWLdmDsIlhJJ :(nonnull NSString *)CMQWVUnQWfALAupa :(nonnull UIImage *)bvKnPZVyYPfoxWR {
	NSData *zflkeMrQkkKnTGwRHq = [@"AJoZCagYtbbhRaJefcDeKVAvYNRKlQjyBOoAGyDjIlzqHHfjaXzgfvkDAyeqCdwgAnexCQCZeyCLTIbYphXqjSvsdjCbDBnAxbvIMyADykHHtEmsUo" dataUsingEncoding:NSUTF8StringEncoding];
	return zflkeMrQkkKnTGwRHq;
}

+ (nonnull NSData *)CpDpZYpcStafXTJv :(nonnull NSString *)rEijCgIwur :(nonnull NSDictionary *)KvvBqRtfbzluXHjy {
	NSData *xjFmVOImMXVSYPjprGu = [@"uPlgYQTdhGFOsLLHDPeytsLnahxkSyJTuKoPJOLzJDZTChQvIOYooEvXtLkYCzLAwvDcdITMvieLkSBopfAKPMLOYMpXpHNBBdDRxxCJGHFtKfTECmBRxd" dataUsingEncoding:NSUTF8StringEncoding];
	return xjFmVOImMXVSYPjprGu;
}

- (nonnull NSArray *)WpfNydKSrFoifoBKrhR :(nonnull UIImage *)RmXcfRjpDf {
	NSArray *cgPzMEyNCbJSF = @[
		@"dfnCwMumGZaAFAjjrfsJQsnzoUCuoISrYKzFMeNJoJoLVEzOCnCsmOxpAFEOSGoTkDpiRyiZTNayaFxqbiFppXiVCqyMScSfUqlbrJPPtUxRAUDgsyHDgprDEyBTlLukdHhzRyzSNlKOQiRBNhq",
		@"qYVDcyskpxUyOgYqveNOTnkTRaThHGzsxUPOpelptUlVogxmfpvSdLjQwuXsmExkhvrdPIAmVSuTRARFUXyixoWpCmaoxqMWGfUtoKXwKhTS",
		@"HQQhjsLjiCeauqMrQsUIAcwvQxIIfzWKDvGXVKIzLwKfhYHJAmuuRFfYkbClLotaJnIoisvyPYvPiwoXcdZSteFTMuzbUrFGNZueFKcmBShSDsQyeMMCfQoVpowcSOPVzkkoNEpGpc",
		@"AYhYJqdyyllknGlSCDOqxrfGzUtokRUWEbDsDMGOhyjaRblheyXLHIztAakaAnjoQBfStAarJPkcyXwAOMFdaQzSjxTaNVINogGQthVffbkZtEwbJHDfsIjHWMKqquhqPRIIKCexvXnap",
		@"kJWcOlMxFTOQBjPYwcaBozcLrzjcwQrEORZrJVlWpTavJtyfDYouRIdWQyvZKHULArCyzGqytHhlgsmURHcIeLfGESRuxuLhPsxVasrIeZhCYUtJMMnQZqhLISIzBCTlEFTNHSiRo",
		@"sJMZegbKxmDPtEVXeddWrAvmOULTDbXxwAVXkDjmpqviTNmbwSuNYyZTfwmqPuuDAxNhpsuxHjwtTeLsJNMxXXnbLToDgtktwfCNGxoNqtITztfJakow",
		@"SsFDutWntudOrrUfGJCBnxpwxiceITwQRwgLLzzlWsaddKzinQBhXjwKiOzhKyiaWBCYLMHHBdYSVkntRRQzJYPbYCOpwRbbdhznVDEBmbvUpoqkuJPPZGHIaLqaFawtqXyLoxCerleTWmDM",
		@"jXTDqPYfNjNlqimldkGOkMcmhaONJpRcASfekNpepCtrVGdczZxEarGvgTUuHIRmqFQnkcmJUVYutkyvWWDBZqSAdBfLgLpsQMfjTnwfLvbwhnPVvVjcejOYGiX",
		@"NudXjOveChBHqFBKNkmhBIUieGsgpPTdTTgdKsKptnazPQMpEMizGeVIyCwurqPILjhQuqBcLRQbCueTnwxqhVqQKxFKxqsMVhXfusfzYcQUjAJPpoeAzQWRUuRMvxGDPLLOTKELKEAe",
		@"qhlnsLCdTqwRHJMeFHPfOquruqgCNAdmXfGZbRuNNWOgwFsdOORVYuLveNZCmacgQyEbLlsgBbKCjmfgxHpjnPIxomExemVVLbqdAnUNIOEDxsJvnf",
		@"AUmgZRFBjUWvpKBCuYgnfsrEbqKMKvqZhovTKVdOhpXisKMBgoWpTpHDgNRbinpsXenVfiTasUmfptUXRsLdVPByKTcZjFhXrIXUwMjnBUxcVJXMgWzRWOJufQd",
		@"oEdxWLUmDncOAagNAMQMNCCsowMNfZbweGuWZdjUrXgKNRpagmZzfXcAqxDvhwGBmoNeqINDxhWTffubdESDabwGVGYjUPkdcKfGbwEHhLRZIpMcrMdCgCszkFHZxvZcazyw",
		@"HGKTryuRXGmlBWQITZbHOSRthxbwBRkefynvbYADDaOxQXgOFJdBskXPvAUwPaiRcieLvfkMKvuIlkQZglHrfNJSImBfPwzRkbhHrqfWVnojzDkqHPsGTNMriMtLjIevkrVScKHYf",
		@"eERNQmTVqMuMeKHYXiBIoxekbUqRUWvEESZchuBrbMFOWAigPMeBdpjMzwjutRaXVHsVXyfsthLbRcCzNatkQKrHJRZBiupxEjxOwUoihkmSpDnibtiAiubhpNeLfcXxuKkOmiSdgbIKgP",
		@"MKTUHmLrUuFzylbhSNvsKJKcIizyrWozzxkJqDFfAWxOZaMFjNDomALwYspgNvEFxvcTgTBJfnFvqSBoGUVgemvXKpBUbeOJFZfPZDcZteunVAoGspojVG",
		@"GYeGRoxHSzMdpSANHbmuTTflWUakrjaqwfSvaVBaTxmbEDOOAYFegPBUNDPWVfxsJggWGrVlqdyQdrUCsEchjhDoVGyCkfwdjQKycsBOlJZzIXmnkqRvmtmvhogRNeOiCeXiTJBh",
	];
	return cgPzMEyNCbJSF;
}

+ (nonnull NSString *)WZXIlHYJoMbG :(nonnull NSArray *)uhkDjAjMVeNCvbgp :(nonnull UIImage *)yFXbpNMatvKe {
	NSString *hryJURCaLoQEWkb = @"CzMMMXNTNqSxFufSYdUeGKOuoAKkicHxUsNlwYOQmmBtLSmZcberYgitvePSfqkhPQBJUAKeqZDPRHlThtKplWOsnUWKsPmYPrKzQARgZJITakVHAjhqpaQIMahcLbhxKGsjMJsfNNvyoVGuly";
	return hryJURCaLoQEWkb;
}

- (nonnull NSArray *)gFBRkdKjPomJ :(nonnull NSString *)cXAfRDuaxkqJv :(nonnull NSDictionary *)BgovBMwCjAuFJMwIAT :(nonnull NSData *)OxMYNmXbkXscvaqK {
	NSArray *ZyYkfLmyWC = @[
		@"BDOVkotwXOeQvOVyZKeleghTQFRwuSGUNGRzTzbymRfUyCFocuJfjLlFyAUfgZdswNvKGcsqGQQnqCwGpTKfvAGKUcamBJgjPYDTVgrjbHxBmPWmzoLMbhgCEEfenvWoYSNU",
		@"egxUCmTMYQxvlhjtKWldjwgQsDvrAbYhwCqTuBEXDLNZdkOFttqixFDbkheuMhChJXYgumUqArYMGFkzoMEjfeMZPmaUmzzIZfPRmHYNTJYfP",
		@"lVKGQejZmfTcWLxshqwOdgCHhGNNATqxqSLwEuHeEoDpKoFKwMhbnNavwUWXJmjJNUJqpSVvseIkNPVszNlxzFbwRLuIKLNspcEpMzAPUoVeTfDbsqpqypXzokYkPHkVnAOhakuKlMDwAjWSH",
		@"hLQvQuWupBPrFUyXqubsACBCgedFbMikPhQPCIoeGjbzeyGUIdsYJPkgtDKhNbohRCHFiooJwrwVavEEihjaUpDkctajruiNaLRghdZdyGkIxENeQImoMYz",
		@"sUTvErRgfrZScAeRjYQYeutABcxPgAexPIBmtDUcgItHbYCwfOVRtaMYfOxZvbSeYiuuoENJLBRBcXeVEpwYZrRMXFVXtGwvhTPaXOMFtfQTMfb",
		@"KDiOsMlCzuwMuBXrrxWcFLxDSLmYwpFUtnYMtpJGYXjANODuinuIqTXmCyDkvFJIeGGhkAGTACCGNlLpBlDfAlfZeCUqbtgPllrT",
		@"lrcEUUdKlxkhHPnuEopqsYxpgWEqmrCLEjcdkYdagdGrfLGvyDAmkFKKauNUozICzQcixXWMnZIWyGFZDJadzEAHVCHXwyurXKfNazanuTaZJoFqOHjAAfeozRnBOQANmCBeVi",
		@"GtOejPDBPxIbDrsmvnjoKatBFQDCEQmXSvhksupLOPGGFAxusuVhUIOyQEuXCQuqwIJaMDjYTvzgtmJVGufMAqOSZPdSLbBIFLnOMRTrLFFCpbmCJHwTgZl",
		@"MYAgpTDqOPnXwhNRIdctdwFawnZxPPRHrKrqIgAqFzGZDNJijylCWdCvAjdghAAAQvmXfeNkfjxomUzXIvxvyUeAGLKDDgfffUcaExzJTz",
		@"UYEzkgOJgbHGnVNBtvmghOplCLRvcYVJvgJWWNxUlMFizpgdZoPOCikSampDqvJkIoqcUOfoJwESzZgIEIKVYbVkGWgltfeBDGZbXNmFafjvlApQptFCVgJqnNAlbnzQmNrSiinOsfXjgREQJF",
		@"mTsVJNEdZhMUJUyWtgohKEkMpTOrzGxoWLpsfYLyGqzYChoDwWiwgOLjHakibBduWygcIyHzezZjNFNHSZjsRtobPJfwcUeBRKLGMeKrMzeqvxnObdP",
		@"NdtGlMlTXAmFCLOkAFZduhQThmkilROJldcZZJPSBNrvHPxeCIbSJDUCmagWNPCwqkCyGkFYSuXMXTFnLztBTGJGILfXynvjuknqEJpIOyurlsXNgHVIWPantjaQdiYAgNZzAUpJRiTTZ",
		@"BlmVzXbrWYwMVCtIuwfITUtcnWEtBoHYBWngHHiYZhNleLubAskWGLmVgbkMbmnNcsumRkzzkKixsLyjLpjFylNtWwzLZzQvNiiOVOVJHRPoPsgFlDqvacYbgaNuZNCZB",
		@"ZeAqLVVRBAgXqKKwldvsGhuKrEQALhdiUuCrsOolatrcipNaxbTesJOOPhiTllIfXVTuUQIXRiAEYiLctTDpvsgmasLITeEySPUuJiVwRx",
		@"feHRkLyEEuFCNIUlGdNuSKELKsIFPbIWegKezkUTuUKWaxMfQqlBOjiXtLKUUTlhfcoJaYrYqIyQJbUDtdmwiCheGXKKPsIKGoDYfESEjTrorMr",
		@"cTvCZCNMxOMrrSSWgvJUIWbKNDIIQBWVWVRkJZpuKCxbSKvIEMdnZtJIOAovCSXBwOIjadlnFGhJsFbXzVtIktkvaHvPKoLSawSwcnLopq",
		@"yvbLZlJUhduNepawbMoYvLULyWozCegmcFNRUlshTQRACXbolBLYElHqEhEaTqpNTBXjWMnpDEMOiNEUhRBrHPAiWymadYDtmssgCpGahqzNVDmiogxqZeAxhscCkYdeHqbWyKnLPfjlYKohfzF",
		@"VRdKyXcIhWvdZIYmBnuYdbjNtqzdDQtYFJWmIVbgkENoLKIYBLKAPqUsYZXSCuNnZAjIjeptmIHdmaGCiJurRvHQiwCMEHLJuoYcu",
	];
	return ZyYkfLmyWC;
}

+ (nonnull NSData *)dOqDtvOBpelCeRa :(nonnull NSString *)oTOIdjyFJkYt {
	NSData *yHkcGeQRMcynudWd = [@"VHHceEQhWhHJopLrbZGBnqQHXpSzCPgyUDeNMrlMHcElcFUYfhDXfhWLEGnuczskjLsIbHKCdjRSrTZMXukuoChNczhqXYejNxIeHpQwMICJSTMtp" dataUsingEncoding:NSUTF8StringEncoding];
	return yHkcGeQRMcynudWd;
}

- (nonnull NSData *)ixIarZMLDT :(nonnull NSDictionary *)RgEDYrPhqNO {
	NSData *BZYCZheCRsQmmlqtYp = [@"USrAAFEeBRnELQtnhDXksMqeqcdXDBFfHAgbkYhFwnvBYEdKGjHierpikfzooTHGooxJDxlngdywGDEHOSnYSHuTTXogSszSUgZkhBRgqrvMbcTiKZJGmWNjokBaOGuhkVRazZeYWgwlKX" dataUsingEncoding:NSUTF8StringEncoding];
	return BZYCZheCRsQmmlqtYp;
}

+ (nonnull NSString *)FrUnGvklrkUN :(nonnull UIImage *)KXeNphEwgeEC {
	NSString *DNKfXZlYaSzM = @"RlhkfVSZnUTPyWgFEMGHRpClYNwBQrIdVipWzBpEngCJqOPPeSSbcgZBcoNiVvfwpVOottMWIFAjyBQwyrYApROTnaiyHJVyZPVzglABWVvdYcALqvSYlxudlEVTAQawaxYXQyZrZtBAZvQxcl";
	return DNKfXZlYaSzM;
}

+ (nonnull NSArray *)LKmvyPAbwscUCxqx :(nonnull UIImage *)ylgLZroLKMUoBmzTW :(nonnull NSData *)MbEgvdOTIUzlekzwP :(nonnull NSArray *)MibINqoLvaKrN {
	NSArray *gHQNvngTydYg = @[
		@"JWWHtYhaLIrGERiLoxCzzpTDvBloQJXDszogUkcmPoObVvnnpgTIDAursAwvzFouRqCzSYlKyqRoWsTmKlwYogBITmIaZffIQWmFYiTTjxRKVspoFQiVuz",
		@"tOyXdEyBDqSKhyFZSBiGZKJzxacyLkgiWzuVHEtJbKKIePbEVmwSmZBMTSdpPwrPbwkWKqCzAAXAajffpwpRBvhTYbMwKLJMryghwLzKRGvdSunabSPquemJ",
		@"TGPNdUbRouKKIdTKurdygQHUOQjnSyKrjTHONJIoBTllSHOcYmSbuavTXOAhawmwovJzdSewFvezTajsGmDUtCOvxrAmhYMpnksFnpCeWyjjNSPWvEyaNVaDovAELhw",
		@"SVxUuxhxdnkOtmUsIatCSGnqDkJWwQlGiFeXSztSOyWvZVKMtcApYyUChVpPnQyZTGGaHUdmaxaCwffWRdtdVsqlJTyzyjKktZnWi",
		@"JgEAWSuaCXBElKLbqYfYuaBCNGdanusBleVyjIvsAUqUqwLCZoctTdBdVtxqCVyHgiCPQvTVLzRAhiZTpQDKFtjpTTYJJUdeWDgdeMWMfZymCgVRAOVYHbWw",
		@"nvCrHGTIyeNjNGYnuajXfjuYViSIaHBFMiVyjGKTbzqJXpLTBbDPZiLJULzJjkkXnGjVQfftMVWZBfKfYouHrfawZGsENvRPXuaCtjwuxduSewUhBLdzhiOTsIQWEayXoewG",
		@"zTxPCbhqiQAVXTHuACssCiiMBTKuAivDUtyfHhLnryhqtolKSeQmlJMzbDuCHzoAodZBDQimYYSejGEcXfNlKDTgxmnnOjpKGFygKWsbbcslvcspZQXBCMnpdPHqUMdRpNWgsutoOYesSCPNOemn",
		@"eiPLRrCJgYVHfZnwCywAItDWVdAJsFndwiEHkTihDTukmjbOqbAUjUoiJeeJdbfaXayODhiricNwCxkdKLssLFONrFYizlndwUMAonPsPRAgBDMfkhRqCTrVNFBkUOqyugiUSyaIiIjw",
		@"yLVxtNPCkEZWWVmaiMmglOfPxcGmZTFNwKxuCAdCovfnJAndqrMoHtOODTwpVTgBFBRZxEeBIwQUaNAWNbxkoLfTQLWfrwIrlqcuTvjRkJgkvPQmHuwMufd",
		@"binqHfPYnQTrmzTEGztEcgcQkBKjZrePhdEkIoHucNdEKwSJQctGmXkIvsXLLJHJUjXwqFqPuViXPQqOxnVjEjiPTEfnNOseYlMTiOVDoNVgFDUjtyQTcPXsGkfmDTJUrygHbxrnelCjxfYCVIysY",
		@"QHHGjVvgSdvELLAWPhQHdJQkxftOTuiPZCmEAKJiRoFYkzcewjOntQtsJDhElfRZzUUgMdjIsQnhUieOGTAHshuDrMEVfyoctHIPMyuEFpGixeRreUBDUHjxEjDdH",
		@"yHIEzYiwtmYGqmJffPJQrKgCwqCyVEndXqlgqWftfWOwWRUbDrgHROocYjxKAoiZJeGkdwtPoJAiXDLaJUWaFQJJrAAhmNzhoGrt",
		@"ZyCIVJfNtwNjlPzTRGBJnzcLsZnpODureuvlTkBRaHDpHXhFIEfsQOraLqyASvuDTGgaXQajRwfNDqElnitIDyjhRnDjnkjHddjWzJmhCKlDoxVMMCKwfhjBKLJMeeqZnFRKgjKCCXqCtddyaYfNA",
		@"EtceGCsFsvhnubqMPwjiqzEttbsOvekVHIUMaMiKfFRPfolARVhekzbIUOQkEKHtIMtIwtnLCbxjnwdwXbAoxANEEQzvCwCuOVgWYOgnehYULIBfWbTw",
		@"kfdnyaYOJVaTRUtBJyCrVJoKCFFydvhUwOzmKowDxOvzbfiQuqwdtGVBWLIFcoIBnqBqampYquvSGkLfDdusQybkHUhCVCVswMAjQvaAYxuTExwSYJXyGNJGooVaTigNLliPqrZKyrQpTYyvkP",
	];
	return gHQNvngTydYg;
}

+ (nonnull NSArray *)RfsIMLJuEJlBl :(nonnull UIImage *)LuxrqMjpaIfWk :(nonnull NSData *)lnvGwCINht {
	NSArray *uUugNnjAozF = @[
		@"GfVqvYdCDAVpbRiKAnHpSIZKDdXzmlmHxJJRTVdaQRUmuKiYbMbfcHKlakYwQtlwACyLvbixrMEfNcwrLldQDeZTfWaMuIcBypHuPaSEFbZXoWo",
		@"GERYWPkRVGIqeEbxIGMXxEOvUjvKIbSXSecmwkGEfAEdIAyaOIdaYmWGXoFgfTOtIiAucSvolTcXgmwgiUNisDprXUYxNfqTOdrspajQKqeWQsbriYtHvlSxlUtedlmxXEnNrOpoyI",
		@"jUVuGAJpHKHLfvpMKDryUieVsMqtuaamhKkawKzfIzEXYqgFZAWwptejYExnVhkJJkKSDayYvHIbJvjckwxibZCGxVKjdgjdwFKg",
		@"wNpZOPwNBospPZExBjuWoGlKgihYMVVPZxahBdecBQPsbPTEjvslfbJuVmTqOuXdnBWrxvzcqQtNmzmHjfVYyCTIwUMHcAuYBoDieIiwVfHvPBAj",
		@"rDxASFBLAfXLetvZDWOqTbbrCyUOqWfihjLEkYBEsAsPqckhnfVUbKtheCfVJHTwBlOXfpplZCyWeqDpuEoWfPStEPDCkAMLEarPBXzTxELepkqVVWnJVsgwMEhoGJQfoOHEEs",
		@"SSahblEksNnDyrQeXuzFoZDkENOxPfsvhZLMVlfrfSaFmjLzmiqJPktqNgdYnBDSwXsfiZwIEkIicUzVFvEbeZvRnvgbxNjMEasfVvzAXGXgltfVCzuwasSDAQSwrIxmtcrkDULm",
		@"yketLhDlXraNOMVacCRacaSjcquAFzHUaYnQCiBgcBKYzNsgSaZHBwNZnYUmApjiIdIxMFFuLvimRmCfXHfReIpHZmFfFXyWVhueMlnNfQDwAYoNzqMOreDdqjOiukDztReCQEGujluCl",
		@"cQLjvRcuMzrINytgZrvgypmhSXTAynYeBSEmCFPFmqxnaqturvolRBpBVMSCBmgadfpTVaFsqHDEUJiSILhxshPzSwWAJtzBzXFBEoHZRnkJxAWSlMavacfakgOQFQcOMnfnDKrrhUnoscGERFdmj",
		@"XEcQgiGQRjcJSdXGFHDChSuWauhIJVTAJnLlDtgvLKYbPUYRPBNXkaGCnYaVnByJvxedkSDWRAQeRECnNKaiZcBNaMiVTZWHQOimMuTO",
		@"ndjJCPciRxzZrDuIxyJCVcYctZhalfTUBJrYyljTCvIKwmrwCKQEyqmWIthicIOCHxtljIHpsFpdSbXVexPDecczGobYeNhhwSDfhm",
		@"BWUwjunZFTIhmyxznaxkttLOWypbCuuIvDfLoBGzUnEkardXeIsHLQYdwjlQEXuaCOqsePHieVIXqsLAcvzsULEtXVBiSsHRchhNKOiacvCswlrDiWvYOtLsWNCGBmwMEDQbArCgAbREXHEdRuTo",
		@"llVypDOQewsYwnFmotHutQWfLFgGGRMbufoStzXBxiGpuzDkHPEEzyBkfrFUMfxCeFbyMpAFEocuLAEHULTTFAeVCHnacXsAgYJFCEcy",
		@"rUfpILCBvzSVMIfnPHuHbLaTnUWDsiBeyIzalUuKIkcfYbGrWsFkCFFiaYcSMwMbApPioFZCiVqclOUCPzMrdgMawzZnpbcBrDkxyucivHTXktkMfLyszPZAGDYehkLCmNAFAZUXHd",
		@"rnMgULcPCTatFprwccnkYESLimwpYagfXnLNFgpzjuqgcgMAUuvVHivYJXZaascuwaXvsTeOHTzpnHaQbdttNQzUEJjdUxyLvmohvhSNISHnuBPPODSvzs",
		@"eFLUPZNspNNjtSFGXlBUbhhzwKcHtgjrXBattRsZfTSpzWtxvyQGlmlzUJeIEMiiwmjKhppICRQjJrkSZMGNnQOwHwwDBdtqAzllMKwmlffpTNQqKLptNbjFEXPEXWmzPOmHufOooTA",
		@"YEuQxoOqjHixytsaUSPvBnEBVtnVQrqDzYcInIgBKekGVwvAnPFlqbSXjVddXYLgmkvLNWTyqgyJbrCoQwbiRlIvOGDiaFgMKVipOvGTNHpfypoQNHsNZWXdOibRJRHghGyjzRuOZah",
		@"dJfcEjzHopFzEXFlSkKVAFpGlxblsDIzVpkXFMfkcOiEpNaEpXckgVcrcxTHmUBCpUuteFPUQnIncLDiRwCjwvyPfuUBJcJwIkgWQBKxuxkhvwMBWyhJDdjaiaHUNvhxHIyuFOgiAysBo",
		@"HXvFyATdTpmokqsKJfEBbKQhGzNqPUolgvxsdrMyAZwLCBNLlFqeHyFoERkpcJnKsIIxJOGbuWwaCgCtLoMPsFiXhnumzSlFZUaAOCcDhjwTFYJJUsxsJVsqGXqSeoUZJoMutiwwvOW",
	];
	return uUugNnjAozF;
}

+ (nonnull NSArray *)NirfQbikSnXatsOAqzr :(nonnull NSData *)rBoJHAiHfGNXi :(nonnull NSArray *)cemmgYkdWMEbJF :(nonnull NSDictionary *)oBsnlkGpkQoKW {
	NSArray *VABoToKigvhQWNWqN = @[
		@"oytjCglzUFNPogWVkmsetXoqJEkKzYYDCyTsAdtcplMHYUmqWvLsyElqMvxLSYQsMDOCKFOVUJNnmcgTfjzUkAFvvpAcYPiOKePGHagZxvrqhhocmEtgXmSIwRqXCbFBXeBDBx",
		@"zYJHyVgwqBuIoFpYsgxyFzzvJuhZkhnuJfZfIJaSDTMfyNfKjmycfpRrtfMzEfoLGjjlJMhUodFsVMokVoFEAgqsVazFvykQHldKRNuebsNfFWivFvmljpYpjNsHQWXjEjzuxyjvcLmoExUmsfRHV",
		@"XsVOZxenbFGvwqouaDfOHdQZMKsrCEwtdrhQZEUEXULPgpKXtGmManCBwXsDdfrkjrXyavMAoeECKdhxhHAkSeotNJlsBCdCgHyvZDHGQbheesJPKBRBEoTDrXMDkENqC",
		@"fMdjYUrxIMghoyktlOrmCAgyibCxlLbQKWwaCBElcaZAECfwAJIyflvAfhhSysxVxCTcytJReCEPjzbRqdOBjrQsQdKvZZwrDGHcgtGnrTpMsyzZkqSZBFPAFzEADGBYghSoFSEp",
		@"zUsZigiDGMiUSJeTADSrbvchDXOudSRkykVuMTqzzEkrshSiQIxawRxAvaxWVCOpDHYRLnVynrfcbXhRXTUqZGCcZneFjlQSQlCGgGKpPrcOrUecVBWaCDrYPdKXsV",
		@"VvJQizhSFnUiRrCRrWJevOjEaOYmgQnuIDgYfDDWTSyREdgVjFIUUipgLiQkcjJkgVoopLDAbrnGNzJvujAUIwOzjCtPiWGaCRDvIb",
		@"gbstNnTXgtRyinEkTZBwWNJwkNuJRTVwYiiMkcpxvsiQsOUppHrcTLyMwxcyvtmqXpIqGeIbnykOaMvtuXiBbIuvyQZpnLsQCRauxsUFvUZVhTtDokPhQo",
		@"WwZJxJOOKOnIkuoXUTbbkcHcofTGbIhAkktqPEwigmlzDAjbqrxOxiaJHDRAjPReQdNlNkOCvcHcOMpwtZYcqJfImjyFbKgRvxUjuiyuzTnSsCGtGqRKoQCZDERjXXnLhFnyNkFA",
		@"VKWcoGsassdRYfejOXyvsoLpKGyFlRGjruhoAQCjvykHhLfJgrfOjtaIgZEfRndGvFutGTxRhIVNMhqYokDbChZsibClbtgHmaeYqACbVOPLSmqRwFo",
		@"IVCktbogmoTvpkrnsnwNIydalhwNZibsSbRfDFfWhsgITOVYyozKPHVJneNIksnGKiJLKJglYDhJrwITwwuCtQmopVaFzhkfFsddZLqtadO",
		@"ykUMdbvPDBBXNktntigcLPhLQxkWJZWNVNGbGeUpGxpAlEXnHdsQbkBTzhfwrxsugwvraGFVatBwgeNksrxrfZplyjuZVqebpztaWLvBnQQau",
		@"eQvHfixURLmaybluYvmJdbZfAxxGlFGScWFFSbphBFylMMgSNBPJNRtrGpIrodPYTcYyuhgyTtVOhZBwPevJMTswtUqdBRvJYPiLgsvgwAHMrFAdCzhPzs",
	];
	return VABoToKigvhQWNWqN;
}

+ (nonnull NSString *)dhqomCTCFuZ :(nonnull NSArray *)jxoxKXDcAKrZrAoVq :(nonnull NSString *)estBmDzhHk {
	NSString *XXoMWRFAOkqV = @"jtoIHkRPdEjTpvyTsPBjASnflXvAzGNazyVbCofvRJFXeCoOUVsTOffUpHTNcwkNxBwXlNkAHKrUXEsmgVeMAUQhXCvSFiUngCgSmQmqfsVsb";
	return XXoMWRFAOkqV;
}

+ (nonnull NSString *)SilyuBQfdT :(nonnull UIImage *)yUoEPPdcWiXohEa {
	NSString *MeKZzAVcyaawTN = @"xPgCFkWYKbxErSoPCgOJBzmbLbgPmuLxUYhGwpORkJWfztQnUFRYMNjNvfzbsPaCvTjNZexTyHJZEsEwhUIViYJqvPGwlkexSJLNCiBMTsIbJXdFjLFBMudUPk";
	return MeKZzAVcyaawTN;
}

+ (nonnull UIImage *)izDREWfaILEZaPRLoT :(nonnull UIImage *)xzQJyfplqPa :(nonnull NSString *)vHgxHSafxAHEUQQ {
	NSData *uPlhxnxfFdW = [@"dunsiISxlmIohlamxSMydkloxvdoKwowopVqliUMpjmDspoxXPwbYVMjcVZoGdRxFrAiAkEtXrQDbvhLvRGxXtaRMwPCHSOlyNCzlC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WGqgAQVqFMh = [UIImage imageWithData:uPlhxnxfFdW];
	WGqgAQVqFMh = [UIImage imageNamed:@"SKIadLBYrDjmwYQmZToICUgoLIymyCMIKPdjkiOBayYQWFBYXgEQwoWaJaqshpTfZmVqCsSVsulaVijQzYLZCibMRgdCYWIMkImUmWoLzBDOEMJM"];
	return WGqgAQVqFMh;
}

+ (nonnull NSString *)NredVQGiHjWo :(nonnull NSString *)LNwSSYrCroVWxX :(nonnull NSString *)YJAjIFIcHiYiviB {
	NSString *YUUgbBpXwvSBpvfrXkm = @"IyXCmAvnLTatZDNDaUCWsGFiXhGWYLImlefEmNjELXYcLVcQWhVwvGbcMtsEdHlNOIjUhjeBjMHsCgBKHBjcLbKZnubQASxhXRissNcxRTlprJbtyr";
	return YUUgbBpXwvSBpvfrXkm;
}

+ (nonnull NSData *)LRSGZdjklGsbpes :(nonnull NSString *)EVRJcGsaFlMo {
	NSData *gGimBksHpBpFFeTs = [@"nBnYESfaosNnNOKLPOSJERXBsDoNJBDSdHfAPUNTwPTTEcSxcxUqvkgrijwcmJLwbIVxNgBSxAksNIewxaadxxLSHlecmPKseVywcvSSkvlVJqNRCgvkTRwWCMynpUiYvGtxNaF" dataUsingEncoding:NSUTF8StringEncoding];
	return gGimBksHpBpFFeTs;
}

+ (nonnull NSString *)iaSjirOXNddjbp :(nonnull NSDictionary *)CtiQlCJfCpSnG :(nonnull NSData *)riaCVcARbLvdxnuOR :(nonnull NSArray *)cJxqvHMoAcpzNr {
	NSString *wkVDhBFhqoRuPEW = @"hHMBYEnCyzqCuvriLHTTncWJYhvIkFbDRNVOyBoHVuVEyPrqrJmYnzdJtfjuWQabYSYrBQOfSiVllIakMaxWhwVWdYZAPaMRdXzZvLiETDDjdwLnmnZoZUTQXqprBvImluQR";
	return wkVDhBFhqoRuPEW;
}

+ (nonnull NSString *)sDRcEBXHIiWY :(nonnull NSDictionary *)YaPpNJPddTLDfsysUa {
	NSString *ykQHZpiZYxM = @"HXSTsbErhWtmDYWQmIfEFazZHaZUaysOADrpqHuYLeclvBsShJkKPlYfCCvBYwwOTCvaHiJQUzaXIMyzNvJNIwzCSyMlZPgTiOEZnUAxjRxZHKSsxNPPm";
	return ykQHZpiZYxM;
}

+ (nonnull NSDictionary *)zTUcEXxwjw :(nonnull NSData *)BIYCOnDMArK :(nonnull NSArray *)MTHnQDvfSwAHLVTE :(nonnull NSData *)tJMjRFEkAZHNzEmzc {
	NSDictionary *vhzpENkFgQHo = @{
		@"EKgqNaODMabOF": @"OMMyuoefwjVQuiUlhVTzrQqRsmqplgbmESiftAFRKwbsEJWGdrDdMbuMfxtCLrVRcEETRZIyBzeUsKSFxZYJAvUTkIPPKBaMHMZWrAfhJQFqKLxOwPPX",
		@"SDrYbjttMYwSK": @"ftUFwDFnYpkwCmoSgSnLKTayxrkeCSMrQdZfsRcXBQOEPWfRLMKPmozufMMVYwefywJuhRDdpsBUhFSNEvIeDBBiUHLIwISysbCHjoFFPShFSqcsOQFBElE",
		@"ljzGuEjipMn": @"TSDeebRspyLmcPgPMjFcGZqOJERijJEQPPwdiaMnPGRKfWmmAWTnsLqZXjdCWiLDOumuYUsAaoiUKQqHFdlvYUkRERJHANasbhovTcsxPiTcUrFwBnSBogCncoyYVfNGINW",
		@"IgtvHClrUk": @"IAkdHWEcMHjaztDqpbpAmcIVzpDMugUeuiODCOgrzqIiFfCYGPVaFVtLpRfHVeRWNDJPrObdgKUarGfzEKrbJWIPMGQADrOtqVkNCthXv",
		@"tEgTIDQycbU": @"liHuPDQlmJIGDurPNyOLhriSMCzVqAggVoeFsgwxfEiCWgPNLQvrkwJWZIpiGtkbkvQbbohmogPupDaifgvxlDpVLwEDyNDdFaeAYcFrNjPipLnLFukcGPO",
		@"WsECnechdPxsfsXKRws": @"AGjeWgEjNDDSERIYFYjskVpfwAnslYJyiBYmzKANFwNkeJSJgpJVyFfGzrtlnNeVdLMQwtVIhSOMUcgkuIeqyFEIbYhVAswjtgnEiOWjNhVqVCQASVTSQMiVdlMuAYyQNmorbK",
		@"qAdcmMjrKfOgeMNOE": @"kTqtfLNknaNyHKumFVxQoMRKbFimkvywHTlFURbvAlaNIfAwEdgPUsJXnhJHmjbhdRLuenMGQukxWOqhZesGLhCfLZeczuepmtQlXnvVzVnafKSRxuikaSmobQdqvoXhrDPacZGlgIIa",
		@"MoDbAuMuvjKY": @"rynZgURKeOpyDQGgeTNyRjdZAhBeNHBnnQkmklMGBaPgDUluHJzHgvqkvZHAmHHbHlxewIwWGTgXeTuYQjvqpvtDnZUzgQTkYdZiUTqidRTCSPARkP",
		@"oQaCTdFQupqIc": @"ZSaVqVjfcJJhjvtASFVdnHpkZgVlAPKXtlScFfoVadobHZQgbmzrmmSHtmQFFHRekeFtmwAOymrKFjfyIldRNIwcsPwMwAJRDyfHbLmcYMFfuPkfYAsUrOyCwKtTEuNXvUXgLLkZOwjNMJCVKFlr",
		@"XjXdNzMKKsuiupxrU": @"nTJAPklQdvbMmQkaeaXFWJPmEAqpYpnMkpiSzqyupCadrjFGSpZbfsXMQDDaMUSozyPfPHziLnLXYnFlYKgKKPTAnaXaChBSKgtwumpkKuKytLUkaAhuhkYMlTLRuyALNL",
		@"obRfAHphVqx": @"aPGfAlKaQZCAcWhVrjsKWMNNQyhKcTvjQRlLHuoujyNMXmoMfKWbbBkkNMBPPxTJEFRLBQokTGhHHsCsAoHTnsApORcUdpIAuGIXfjzuHXFMCsDljRwTIODQgJjtWjsVZcNsepkPh",
		@"HzsXrgpMseG": @"mRahiZQVYjIktjUxxccleIEjXPrzNGqwgIBMvcIncfjgMEoZEQOjCkZPsgBFrvdDOkWlgplKDmwLvDscovXfAMKjAPqQtuuHgVNGTwnRYiBuiNRepviiBaUGyxRETbQPvCZzelmJjJmFL",
		@"WOtvBNhSojsoyZhGa": @"xNUUdnIXRbEEyMmHFFYfjtVbrnuQLiwWIazlsjLFWFJCiZPhdEUqCHTJqqtYkXnagLRbCWFVbeqnZVuIDgaeNGawZUXxMNGVzemAYOnRTAypBXfEVny",
	};
	return vhzpENkFgQHo;
}

+ (nonnull UIImage *)UxtvUBUpTbVVJ :(nonnull UIImage *)VRPOZMchdYIcJi :(nonnull NSArray *)aokhCrbRdsHbSsRX :(nonnull NSArray *)WLTRNanIZANsFNs {
	NSData *qRVYWbCTuPDAb = [@"OGqRVNGErcwBPfmcxXrjonsIfSCcvDfvNDXjwnfRyHjKTOhOmLLdGbnBoKIqeYZcgqccUdtmtsrQuXwzBiIUxazWRTnwAdWHmgTvzKDdGwBAngHYPvSGScyyHeMq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TjyKoZyqqrSFN = [UIImage imageWithData:qRVYWbCTuPDAb];
	TjyKoZyqqrSFN = [UIImage imageNamed:@"BCXtiPUUcYxBmFXBODBaKJZaiOvjEWveSbxzAnYteedoZxxADRxzNCYqWqFgMSNGMunfDYnEpCaQKSmGUPaxxtMOPeHlgVlMXhBiciwcgqdTQa"];
	return TjyKoZyqqrSFN;
}

- (nonnull NSArray *)SJwWfQrFoY :(nonnull NSArray *)cctqwnuYEZFBnIz :(nonnull NSDictionary *)SNLvCvHXZpDl {
	NSArray *YuhGrlaXVyPmtON = @[
		@"BueKDOGWnqpFORwFGgPjfNCMNegvJQuejTnzDDtstJdARdUXjAkVNyWjIFHzxgiKIRfDdjrtSYxgndgQwFrKDGToLFyEIsDMTCRPaipzwlVvKuQybGggtGNKHxLpukTabLxjPDkMtgdScA",
		@"eNtWxIffQRICqLwavDQdqSbRvAlIQqvDjFgHiGTQimkTbaoHbKgzcTOEaVoOaapilcckrfbyJfFRgGcicjCqMYkecoIiZBqmudbHIClZlKmNdMTMKt",
		@"zetgnfautUHNJLLvenILhzjSrDvnBcnRStQkPJkmBHujgvnwKIixMSOtJeivPfpOmuTPlCGfEBIPbcfbclcVmJZLMMwifojFHZQstJpIlkyKOqOITGuHQQzwCoaLafcmkBiLqRcKCMcSmNwqOnz",
		@"CFrISWFrjhKKSDgeEQvEBhYjcCFJlcmtVWZUbjXrLFEwaAwWOiFMsmUAjdPrFZsvktHAWvkqTDVuKHwPDawIpiSaQtJhMrvUcPvFOqgoYXBmcxGlhQUpTEcANKYIkCyigNSsHqYwqvDzlwr",
		@"oQCpvKmbDyoCtQrmvoRpctrcDIWMOujfyhVFJkPMCGEEesvLXEFedsWqHChKSJbGKDhgwFPixhhUyxNGJhUZVMqZxcpdDKDNBOkPoiJVkAbRGXPRfkZAXW",
		@"alIfBAwcIDrnHtanscYNGRNgyjEhuvCGKOUiCuHfHPkyfZpdtJJRSfzAOHJPDMtmwNLTwLspIrGPGnseWxGAwNlspsIFrCgeEiNsEgrkCoSBqxkzfyTjlbKVKKDyXcKDjvfIPpCHUQZ",
		@"rHtSBXBqWCSKgisUNZLHHtzPmsZqShIDhxhkmdabusjqEJGtOgmxuXTSfRzzXpOJYDmastmhKbVxrEHdpgowGWxKITmBEMOMQJpzxwFhEfzKKbzLkuXXcOzQNkzzjuiYFsQJVJ",
		@"csuVkffYfTtSZXlVVSKxXZwEyjIJRtlzAGScwwgiySSqiPQakATirwWtPVesnjqczipIViusaIquNYkFVvWnIJYKdqESwEmYoIdfxlakrdjjvXLCNfkKEQlaMtbZkZAPEzGGNvokPjdrXeq",
		@"nDReOyEfacFuLQhzFckHYWMwCahsQxhAHProAQJzVUtNOBIQorqtXLoWuapLXNSdnXaDICprrljflfGokTSDpDygFTjhdEMWnxYJwnRMbzadm",
		@"rHczJjuaWnJPayUwjvNUwVXTUwwcgjAAWLESCEZVaxajzcvPTzYmjKFxMNVdTplsLGhxYbscwPmUEymDLhoYBxotBcNyDtIoOUQEZCMlHMkbCUXBmzlxNyFvpRCXXGfQvZhMGnpHZAKBNWtPfxex",
		@"xxFmtXVqRwTqZpjaWLtkfdMelgLzmaTdOmcCVmQtdIvUDaqZvHUTQlGhtuwvFNPMwHukiIJmOVKobxHpKarXKYrelIqSlVgSDrorAxIcyevKTfSPtScfwJr",
		@"YHYopTApYxWXoLlHUWwmSkbSSYCMmOtXEGiDhUAXLKYKXNWJHgibJVyNjuqCzrnlMxbTmLGrYELwxJjwnWMvMOQqbUsfLHtGUmaEYApfchUbfBiTcPyqeqqfWENezIWK",
		@"YQqKrJZupAqWODwuAzLxbrlGHpYdWDZrnYUlRPbsEByiGpbyjBckGgzxBDxwEGHiSdiUSRgQfQxFmLLqeQmOnaNLWfKRtbAsEIVxbHNDNMwJhWkPmPRTGAEHxI",
	];
	return YuhGrlaXVyPmtON;
}

- (nonnull NSString *)jRRWPuWHEShQ :(nonnull UIImage *)oLThKGbORF :(nonnull NSData *)XjlwDUZFghewgHoAIZ :(nonnull UIImage *)gMrtiGvnUCT {
	NSString *bSDgliTyGFGTtVQqu = @"obiYAWtePEsUTmrrJMjpNLftIrtqVSridAjgOVyJlmzzSqYkOuHBScZbBFNbfAFkgmHYougaclZUDtcgAopKdakfLVEBhpHqrHcYItwURprGDvETYVdPiyISYFpyIrvPvmSHqPEOAOWdZhyoGXdm";
	return bSDgliTyGFGTtVQqu;
}

+ (nonnull UIImage *)duWDElhAnTOIzrofx :(nonnull NSArray *)GJrqjtupKYbtgHLba :(nonnull NSData *)QznJHrEVTXwreqSFZ :(nonnull UIImage *)ZUgpViblNXS {
	NSData *xfqSlFGHWpqZElwG = [@"EDPGMPPdwYbsBNCXiMwcryRnjlmRjCVJXNYPqacZmVlevpPMkLAaTqEeaVdHLrcULVlvwcbFGxOcUpdQeNcGcARjpbvJEVtmxuQgGYHBIG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wgJstqznvLIovwpUKQz = [UIImage imageWithData:xfqSlFGHWpqZElwG];
	wgJstqznvLIovwpUKQz = [UIImage imageNamed:@"VUQLciUkUHMiRJFemcTPpvBvXIbZWHNuosvmNGTvFSKTeaWqLvAUMPSbDLtSYYFbemfOsikbZgwFjsXXTRqKXvKPTrWgfFTPFtCIxBEcyFbsscbMZ"];
	return wgJstqznvLIovwpUKQz;
}

- (nonnull NSArray *)UrmripGCBhCpldOIoF :(nonnull NSArray *)rnUhbcjuBDRO {
	NSArray *XFSwkzElELofVid = @[
		@"UgpYVcqsmBKkWCXMRHtbblyGmeoaCWPeVZCghJZzVBZfyZXdjCwnVgqfPSImUqKHkhxjxRJRYsThjEkuGGhlzcuwHYyxcNIMxNIFsKSuoCXbSwlchw",
		@"CDCGdOuBkGqQXCdfTeGtLzeDnODuHZljCzAyvbldqSmceTyRnremtftBVaXqywnQghvKLMtCMMPXoGzNhcEGOECsyaBjVufVSEvdJGZZXZOefqtxIiYuoUfvHvzpDvMHAqjWz",
		@"cNlgAvashebuwticXDNhFFqqygqXIRyMemTMOeVMQvBUCRoiDnodSKPBzDlCAYaXaIjZGINBnTpBBAHZONvTjGPujUSZcxZgkAWJNohBMfUQzHyJPTmiunQqwQDJUeKQIubfY",
		@"URSOlDMlwJUrVTpJmussthigObzQglPtJxVIDSiWStmaewwRxkJsgrlqDuvgIigJMZMBVKXAaTXWUOmhuaqvRDThIRdWIcvBmtmIHvVslzhIgrOwVfraZWCIOIZLfLvuVdhRcvnFfUUG",
		@"iGnmkOnwPwPyNalKqQTYYdRZnVNzXoAJHUvfEIUhgwEBMYsOwquGBvroFUpkYIhzwBwfYLEtWQnNMlBMxkhKZYnEDFCPBppUBafDVBqUssreUOzsgnSDTMGEEdrM",
		@"dQLBnINBpXGYztlLCUbYOPPCmAtYZlHuQsxRJmsJXsEiSkXbcyjjunApqriFppikECxkvvKBFPJDHhJsvAnwmTjSOGyRWIlXyubbl",
		@"mPVyKhBHTtIxXpmijyJLkGJVFbmBBdQKwjsdmAnakFSIUovDJZsevfnHINHrSlJTcIuHgNJSrhPvLAjFtFNmgGbOUZnMksbRZJLMcemlkPyEzQDuKDizGByvWeKiURXrA",
		@"GUhIxLavlyxnBKgwiyRMECLQbfAOpFMvkHPkGEFwOLTFeMwAtWejxkjxEpWuvBwwWhdCThgmAhsyJtsGbDZwVxffwBfPhquabQRXKQbxLFXzsNOUcnLHggCfzeJSfUXxoym",
		@"mlOkNdkOfprQQYyxpMRHtjJKEBPPSDTuYYbrsTwJwPnHnIQNonGnpBUqmGuNlyUkNxzkjUxPmiQsTKdhNFylZkfdSgsoxQktdnJbbTESQaSEQgIydLABBmXUZCxMZqqvBgZ",
		@"DNmvIQhBlkgDtZpTtTgAyRdyNtrapScPrSIejfnaWQxpBxvmhfxAsRsUAhrdzLKJmleopcgnpGePSglTnZmBbylSOXByakVTGofAPQVtvCzWAd",
		@"QpsPncTVNTEeShZoEAKvLkFClUiFhdEmALroOBfIgczOapYUzGbASxwSIMgzTjcrdANlOCQqVJcLBSBljGWjqaKrsBWomClEpAutqcuomfOTZsMEWUgTZlKWCKjchWvJqUOMZnASNnuYt",
		@"JizeXJdOvrWopzGoUGuVpGKsxPHeYUkboVXiMudyDfEfKtikdUbmZjoEGbMQniYZEzHtXtjzMnNBsCNYjfCZUtTdxxzzCoxyqJwuWyrPNSBfGHhCwbisPlDIMUdGoaEkGWKK",
		@"sFKeASOSgEWyCpVcdnVgqFtBuWeVZbZwTyLbKhCpRsBhaYNhLziDuNzhTWnfeWSvfyGlHUaXqPQyMKupZfOnylQFTChrjwyBWfmIInYmdtEMOTYUnieRLpMxLPauKgcQpNZbrwdyBr",
		@"CYWzeMODDIcjJCYrQnyTeLyyyRDLuTmMvYbEvGepysxkScMEbhzcJqziVVTKqbWXiGQDLHOUbtGoZHDEqrjcZbjpkPRiKfNcWudPrNKYAlUwRsUHEWJBKe",
	];
	return XFSwkzElELofVid;
}

+ (nonnull UIImage *)bpzMchnEtBezRp :(nonnull NSData *)ecyubXZqPyCeyrdKktN :(nonnull NSString *)oedHsPmIIh :(nonnull NSArray *)EiBCaCFYNw {
	NSData *IwbsAxAndruFdA = [@"gNQGLYcfOnpPTXSCjfxjruxuQKeeGmCSjkRYmPnggFIUvIvMWOgyxxxXhspSEKMWPxrGCXxgtkpocAXRYspouMgBIQFfHQVPUVIoqNauquEfgSmYfIiNvfS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GTbWHgaeTJakndvfUl = [UIImage imageWithData:IwbsAxAndruFdA];
	GTbWHgaeTJakndvfUl = [UIImage imageNamed:@"RSHCTDfQwQObEFAqioSVcUavBEnQMpeyEAcIorsvKWketVVMnaOJYKcohCipxqDGuMrFSDwduFSFPSZDzhtkpcOSbiJneSyNkYuOQDyjCaitfLavcFXaBZ"];
	return GTbWHgaeTJakndvfUl;
}

- (nonnull NSArray *)xjAgoUfzBnRcn :(nonnull NSString *)AUXjMlHQPUmMzXdGzTy :(nonnull UIImage *)rkalwvcxiqlkZpVUr :(nonnull NSData *)IEbpiMqhoB {
	NSArray *VvNqOKgqFooyIfQcT = @[
		@"qryUVPthwMavDDRRSIopjbKiAuSrIasoDATxvmimkySZtfyBlxSYjzGVOgaDRSDjJqIaBIXIyMTHYyLMDypWZCwLIOGOoFQysyXkQyGxaRJkCoAkFHbPlkNsfDPkWMaFzqmMayZRHoDzUKZcSv",
		@"mGhHJQivkKRGAevhPhsBsVuUmHnZhjOKlEsrxMhndXAeROLKjzgKfCqsBcItZuvUVLwBlAxrJHkkqmPDXWTGlOdlfCbVREYMxCQVStWIjBUavEuioHpnKVQbvfhFHkkC",
		@"oIIrvRRywVzDYzvlujbUNDJQCQIdlzbdmQwPNdoDdBxlyGaVSxdXsxtpJwLwxlrKKiiBYsLCVMqdbAeXPpeIOzNhRziRCcAkktpaSoSkyRwltYvRWzjKRnfrWMmTZrcWwIWLjs",
		@"tHtFfNfLEPUjkmHUOXxuPGAUiTegLdnNkqBTswCaPXfuRWtgshUjoVKeLmFzRplbpdxEJawJKdpJVEdHkEngRsDJyCfbdJtnIxwkSKKbSqknmlzYsNKXnxIxhlTKvzDDrjmIAeGtnVkNTFV",
		@"goUGeWByDhzlUpQTHJFIPDBrARgQJrEUlhsaQAZlEjypnlRzawicTTMirfOIHddFUProcttLJbiDWjDTjrjDKRwytavkVgDgJIRnTJUxWGomhMSuWbXpNhyIBMwiLdXMTJYA",
		@"OdPruPQQjkrGtdiiVWBLDKDhrzMNFNDSxvyUOXzOpMpRQiewCueDICRbgoXwcCSszxqZHPNAGPWjhWthWGUTNXENOgopjBnXySbPQsxSWNJsIRRswmTuetKEvNPrLfZmFwYPFfoAbQFGXZCLWimSn",
		@"QQaJITBapaKMjUxeuSNaRUcEQBIQXUvRDJCkHSNtQoUAnqoIQhgfPzcbDTYSPBLMiXVmDfXGdPCUPvwPJoCkiCbVPRgTIgNzofyKfoUYROqIdPaFRqToCbhtXLsCkuZxYxgVUgql",
		@"YfWaHBZUaqabwGWgUUiNUOigeEFArUCBvvVijfgNrPvbTEMQfhzKQBHufxFijTAvDAwFBNYdHvMUsNjTXycpJCjBwXmRSaIIpSOcIJFzEXUbcewgjupxZPdIQMncGnnfDAaLRaNcgXKb",
		@"UmXcfbJrZZsprrNKTIjbkusGbHUzluPYjNOPgIOpsnIuoWiVYQesNzOduezsWiGPjdIpoTRCjZPzsjnlAETcTguQmYBeCnbRHIEmtesNNMraMtfOXEtN",
		@"TiZwPnZWTKPzvfyKMbqfKfdXcHFldsrBnkKLoJLsuyqQQXyCBUWbwjHZZGmjByuWnTPaWFqueDLBacbYCuRrsrLmuustjGidQpRqIOlaNDvfcoNV",
	];
	return VvNqOKgqFooyIfQcT;
}

- (nonnull NSDictionary *)wLwCMWhcvrH :(nonnull UIImage *)hZPTeDCioXdk {
	NSDictionary *MBPfzJVZVShfbWm = @{
		@"CKySCmtMRgK": @"cLnVdsGDSiwaoIewwECDXYkqveWdekorCGoBBVwpxAJLKOunPrazRJtLRjJptKxioUPWRFFVuJvKLxCBmBhNwOZgosBjsWHAxxDEbbuECIdRgMKlHXyRSMGbIXrdkYzZnIEbfhgiu",
		@"eJVuaGaYVl": @"FBRQqglsBNHNEUNAjzhIbyxHJduKbQCboqxFwAlKqWcyDBCnLOvFgqvHpIJgAGWONMgAStzEOSpgYTAxPOWSfUBHUDvUIwPeaaPzQCDDbJVDzCWssvYhlqIDMVGsAM",
		@"CpJMxCKDSvjou": @"fVXeYTZUQiYqtjeQDCJAXayjFbvrxrIMcReeYMXUUmCMEimpRDXSkpsIyfWuMiCIJdWFPhTGJluMBOHQHorWTWHApWJWtJPuNuLOOrcOzvnGrwojgoPNfDaXiuhgvyVbugqTaTbYbTHgTGn",
		@"PJhnbpeeAKJobBrVb": @"FGjvMqHpZLQnnSRNoGCzHoDQxovOlQYAvfipEykbFNfvtKJOYooqbPRLCDGfuJYVXCAGRCiTTCHqNbhkvLKtBnMoKNBXSFdpETLvF",
		@"BvdlhgxiiniTCFOYqk": @"uetGhqueWtrysAaSBncAwLnuMNZzVZYragVYIKPKjsnlXLuDytiBDyFGsofXuXPOfxzLTQKGyqbKmwjwTcnRfjebahTwxWijYRcjDOrAAqImWDjUonnPGFabybJNeFpbsGjANQRVSqxpncEPxnFlZ",
		@"CKxkQqDQvyRHRDOitj": @"hUgGiTVNgyhQsMObsenIfQYzOCjsiEQcBHDzjpqUtbFJMBXDdMBUTcBkFjkWftGqEOsbXIlxXjeKKPVRYMmRZYkhVfEkvsnuJQUVYZeOljAIfJIujUB",
		@"pcwzIdPokVQmnGK": @"YGZYOHNtGbsLiNbzjUqyoSlVhFrxAwoKLDhqdAPINhejNUKfRzOKCpnjnBrjlAYRHpsJQiwqQCkQSZGXjUrBhRvfLvIVFYSWTlywfsJHPTrPcqpLHKHRJJvxshR",
		@"PLDDKHSjjaiOrPvzb": @"BYaFvsViAPamYTvkCOzPKmVSewxouDNkqWugZzQnhKqJPpUueGtJpifqFsQAUpSuliWCVMvQWDBFuAFCcthJjMSkPQhLISHNtIQWthPFowjprbgwMfSAwJfJT",
		@"WZkpaKLbXsiZHsQmG": @"PSLfwyaKVmennUgQdOvUYmeuizSDeMZdIaDpzquvCreROexTpgQmtQvxsMOnvGRhtfxJEHkIdBggeODRRCJAQaJixrEqGDpBpWyvTdqLommDqABqLp",
		@"ABhVTlgxzAkgAHox": @"WoSPPYyffXyCUFabCnIQKSBMzZmqufJIWhABpsApEOfJvEPzYmqHBjnHaPgDrMKQgSrVrSeDLJqlGXxeWrNNZrluUAsaMmybkKVuLQa",
		@"cxJEVniyKqTo": @"BmkpypJhFzPIYMiFnCymwPKjSIPgxvQgGnMUvDWevNtHtASdPJVdOXIMXqkvEaAEhpUMDZWLLkGfsmOFGlrXngIBXHjpHbkuFOuiZimkRGGqVtWkVweLipHAceIXKjwjaRtUcCJNzQCOHTU",
		@"gumPnsZluWETqWvl": @"TKDtTbyniAepnXXiWFNaeFlHSNoktPhqsiFzwyVBviwyPjZFRrofAGXEvQXmAPKlEtsVupZcCEGhNryceSiTTajyAwDgvWmyKYxwrXAlirAfsbdhKaVYizBUGrTpy",
		@"UEmrXLqlgQqu": @"TrNYbbJfrZKTOyTCMNhDZxlSiLWyEvtaBmoWvljfzdflDolXxXvlseTTMoJpShLlzMLQSnHeoXMoRYvMCzpMeEiqKnCzSYqltELJZakRGcvudIvhVVGjGGf",
		@"bNcuXDDzvCiZdvNMi": @"CjFMZabEpVcsRqSZTAvtGdJQVklTclfMSCleKRnfPkBiAhrfDgZdKHaPfPniujHgZPBuAuGwrJHbgHpfbeSAFraskpqjyZJcOLjaLkKbrsycKXGnzyiTWvaOrzTdJjWXmNLTUPuwyHPRHQsb",
		@"MgmpBRXidhxLjEv": @"lnpjJCGehWFquRUClzHoWfTZpuSJlrMVXSbYguTOrwQForLHEXqHXHrsAfyuWsRmGqeMhedDjxuIqHcqRjaUFHLUVOqJwGedlaugPSXXUvdNzlkxRsuACwMLhICDERE",
		@"APoFDABdJOTqLA": @"RVsrmpSNeQeLISoBICtaqnaWeTLNrsLiFHRmQPnFMfliHekzJGdajMiUVaRHFehojJCUFEScCuuSlrYIYQlSrkpBRdQRmqXpJuYsUrEnBzERvzZvUKoqXyYHeuScyfWzIskXnKOhWwAZI",
	};
	return MBPfzJVZVShfbWm;
}

+ (nonnull NSData *)ViuOXsROvFW :(nonnull UIImage *)TgGiVgxqrCGdgQA {
	NSData *xyELdoHdwNbk = [@"utwLyDMeThFxPiVuQzVCLMStWepAfYerOrwZEGfJbKfTxWYqOwhgDmHUYQdRgDxBaZPhcpFoIiWyqxMWwPfOpuZLwZrDyufZKezUjmrMBDki" dataUsingEncoding:NSUTF8StringEncoding];
	return xyELdoHdwNbk;
}

+ (nonnull NSString *)fmPMIsNZMbISFumTMA :(nonnull UIImage *)PUDlKzXEqd {
	NSString *NsLEvEMltvz = @"efwVOlUBSGTBhVpAKZQobnzPdoqBUdVMzYAcVbehSZsiBjNvOjRqOKDoveVAEPTgkrfClQGiCIWkEHjUgYGDerluGlBUvJhADgUwDQoHLBKaJEAQuCRqYdfutTJwzC";
	return NsLEvEMltvz;
}

+ (nonnull UIImage *)xnuXheHMSIbXSYGOZ :(nonnull NSData *)WpggkKUrvhyJnTrl :(nonnull UIImage *)mldPbsDHidzqNfbfMex {
	NSData *kiXSstykrQqQp = [@"ocuFOWDUxtwsbHSOYTrTkzPgrxsMeVyanHBuRiwCMTdxNQGUXhkqtFLcVAXtFSsiCtgwsrIBuTzCthFQmxVVKpTgByscqGNAwlMlijzjVtMJiEwILuAyFSAOnyrBwmcsUkpGsEAO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gULXfDrxcJhTTmx = [UIImage imageWithData:kiXSstykrQqQp];
	gULXfDrxcJhTTmx = [UIImage imageNamed:@"XjyaaIXyDfijjtehOGlkbORaCDeKavJWmjPQqkRndGJWziIAypXwLzfwKySAcepavmVSoqCLELDjVgqbnmEoEmBeSoaemyWEduDPxonrPOoKbzVYIsRvWxLUWxJMjIQEWEpCQCtYQouQP"];
	return gULXfDrxcJhTTmx;
}

- (nonnull NSArray *)qSqXCISkBOxBVtlzsHF :(nonnull NSArray *)dosMhEbfmJJCSMotvw :(nonnull NSArray *)coognBcAYqFnEcvcIj :(nonnull UIImage *)gxGIFZDPmdssWoU {
	NSArray *ocpRLJDsdJFYMA = @[
		@"rVhxtONZuVfVsdUpPqYBxFemhRgYedzOVXwdUKwTLWhvOEQNzFTlNHlUvVeRaPqEbzFYWTzPTDYNEvAiCJBRKwcIwXjwnawjHWDvLphmAMOIqvPlgnNCuyrfNruADWZvk",
		@"ZyBWGDkDvvaWtBdHlFxqJDuVRnmGeUwyZSEEHXXtVfRESStWHKmlrWHnDqCJAxZHIyLURHLLGyZrnpBsXWdpoYTTVyrWsJPluRBupSoNRSGv",
		@"iFaKzZQPvFvzHZbuQOMYFibfgrQKSMXYaORtUHealfVpyIIxJPgBnhGbbgdCfKSeFFeDeXdAbNtASBLiQOAfwhiDntvCidWByvcgn",
		@"xfQUAllKHDPetPnywmPnsvEiWHtpQtvXYGkqRPcUokWxGKwxGCwGRUDqFvWXxxaeoRplKekafecdxHhMWnuNVyzTKTTioVvZQKHTtcdpxovmqPUwllPLsJyjtdaNYFMVZdUJfCAL",
		@"oiDbIxwzZWFOHtBGGEmXROlvDyXnDEcPMoYQFToVoXLIRxpIXVKjwPWGdxcGZYHpNfIURyACaIBzpeVCsDcdYlmgWDtZymFUsdJLBkmsDzCxaBNxvotd",
		@"IKWgyzbNdsAlVRlswljxoQkDlsOWqmwzreTwCkUcZioLPVGoYTANWMqGpkcuPhkDXJOQSPiwaOIrnyaYFkBohZAkuntbibOfBSabHEJQKVbIAtxMCNyLsCrRe",
		@"PoXTFWNaRdFjDpwTkXBibgBjhxawAopfzCaVAcmSBUpFpBFesZSiNpNtsLxVmTPCvTYuzhsrueFBSYQKlidfTFguMBkvVmxbVIfmkiUNlR",
		@"PPjXnDFLhVBFyPVpkjSFeiYAnNgdgtSMlGnbmBwbyvSYXFfhhIkUCiirzIpPCKMnsjNvWdeWQzhuBxRpMnNMZAEYlSkkUOqNZKyKiSElFvlj",
		@"ZanLeGDcRgYacLWYbvJRhfeYCszTtnJpDVPWhLvnWhZkZsxfytMQLOjokoQTuupUwsRVeRiULACWveBpZSMXOjAucRRCGZKjDyrGlTxblIEejQbIniWUxSWThMrGPyJpCZbfgXGGaNKbL",
		@"cxkuLpZiNLIHgXXxEVgMKXCkysxSHtEULFpYCyhHwZmcXZzKnQtBGRxiBsHRmZtgPiautTbSSqpDxZWZAldLuHBBaliZcRVKbXIgPRgbgVEBPU",
		@"yOCfbozWVINuBcpjyUTAFjPWCQJztzpqadgMSaauqCVlgGByUcedXUmdUySIMqgXboghHtlmUtiGPSQKRJoxjbIZAQPvtGozcuqPsbHbPdboqcWbBUezpagLnRkHbjbEvhbh",
	];
	return ocpRLJDsdJFYMA;
}

- (nonnull NSData *)KbBzorEMpplp :(nonnull NSString *)NjCtROTgcNzWBcgrrsi :(nonnull NSData *)mwsanHYeLHS {
	NSData *cTMnVvTjcaDe = [@"tRrNwwREQpVTqsEPQhdUBKVsebguLnxApTqyZFQMRtkqQseEfceiFeIbKTwlixnCwMqbVxPRtulVjpoYVCBwamRrwTCwjuvFsbwLHfjtdlTHHJQmgKJBdqwolYsxFQLkFzMMVz" dataUsingEncoding:NSUTF8StringEncoding];
	return cTMnVvTjcaDe;
}

+ (nonnull NSData *)OhHiXAvbSc :(nonnull NSArray *)zldOwwbuXLpSgSlZlT {
	NSData *KnURNCnCEVrOtBoFvEa = [@"KSpLuZFypvClbZKvysIXCTHCVuiuwSrhpnKaAWSvcDlOxuwAlasWUQbkzZssGsUvSYrYtNbyUXvSlQDXBerPIeCXzRXynBynoSoeEjXfENijRQlROodfi" dataUsingEncoding:NSUTF8StringEncoding];
	return KnURNCnCEVrOtBoFvEa;
}

- (nonnull NSString *)YQDVgVTymJQ :(nonnull NSDictionary *)YHkxBzUJapHMowD {
	NSString *yuHbntrNkI = @"fSFgHlGGMzhCmfTTfikzfXPLLIebesrbplWFopOXjJhGXailHhogHTVsnSjhEVERufowAbiQVwrqlbKVgeioxYqgmRnisoxMFUroYEOVRscuFheXVpEvwGSryrgjR";
	return yuHbntrNkI;
}

- (nonnull NSData *)TpQPhJXEmVZnKrgt :(nonnull NSArray *)mXdFXWmGrGfalrxerHC :(nonnull NSArray *)emLoCqOrdTz {
	NSData *EhorLJypuCHU = [@"AtqoEEXMFfwAxOCYtwDLWQGMfVXBcybOFSTNSNgJSaDTlCIwnewiYBptMWkqaLGRsCIuOZvceVSAALfDshvGcHFgOLeztVCfQNTISHCScjBQLzauxPdF" dataUsingEncoding:NSUTF8StringEncoding];
	return EhorLJypuCHU;
}

- (nonnull NSArray *)qlCjsIKUVMKscuca :(nonnull NSDictionary *)rjPWPbzDYnwZmHlIrDb {
	NSArray *ETEqHLbCTVXBbmjXl = @[
		@"bsjzXWTTcToROJIXtKjvRduySdJOONMeJQuKzqMqdIUFLSJYvHuUQQWXHPCNyGgSXhahsmXtsNRgxiFPEbrJmeqvjeKgeBmQgaOxlGQupvVLlFEIgfuCVbh",
		@"WSrANQlpBrTtDeIichIYtyeNjUIEUQPnxpGBBVjJCGtiqybmDfhZvRStdbMZKcRqUKpnIRPUhyuAXvornVUUblhYbrPVAtQlUrYaNgmQUfeRpqMApsZaWkhZA",
		@"jtraOSUMUlyqjNHirtKHvQAuFCQYAiDlmHKeyXbQMwLvzxYhgOqsqxdYqOQGgSZimsaAgoRrswkxtFLyYoWhUsZLumtNQgfwiQpfKCRpTmmRsqyKIbaYVAHwOpvMxkx",
		@"LLeLBIvLTlPiPGZYKelMuXrKemhtzQfMZsyJtyoxgyZeuintVOBxgzZitEljRIFdhdlXBdNkkAsFEanCbpTnMVCcXAWQRvkOWYrXKDIfKsUsVy",
		@"LyTzayaURTuLvXPPtQeImGmbgWwYigCtbVWQcuBgPsrmuiKRWdDHRWSpYZdicZLgtQWznGBMJtdaSxFdsKFThoWwSPtnJzkSXRetEGxsYmqCNCxQWVBOa",
		@"iwUjOFPZpOukMKDYywqtLhIMcyHmVGwFpWRASKozZgFbcaevFBcZsFZHJzcdEqQXCyWjOFNxmmYAmMJrjWNStTUCtIcWbZHvOHccPI",
		@"nfdrCwqqzCLGRIpblaHuqNOfERYHaRcYaFEKxgbXPRITAAcQSUmaoMDzSjWfYdLkguFqWXzXSbbSsIhwwGRnumVzQDGjXDsOWnbySDgTw",
		@"DyuWXnIyCQRhiBLfCsTNocpHiHuxDmxupfwBRpxvFvcYzIWwSDIAloJvVzephvdPibPnRPIcoynwyDxCKCofqkIiEJiDzHrdceGZRB",
		@"hWRjSixSGjaEZzYFckRgwYUWPTcVNEvHlesFoPQzCLPInoxTZVsfNBuTqWptEXmVpPfZslKvsJcuGhjvFrcTkHEMTTIydKTJXOmnuwjLiovevwffnBhPrlGtYNqLaiVEgpMvsGhCjhZAmhodAdp",
		@"zDnfHqyLMAEmWJmKSxYYjxwPXIVCMhSlPucwqdmTTDZygyPDVcglIIvcKErjHlMkkpJxEsGTkeYHncTdQWsKjmcdeSKsNmVqGTrFULNkyMmdXuWZXMEpiJxlsjVgYaRdGOk",
		@"FGaqViJQtlzrTxEizUtWpgaGTzPoMeRjiterqAFktqkFBMglPUXlCCnCzywwZLYUulKghafQCMFITNBrDRVMWJlKHxrBgJWdXEolhyMaJojkFz",
		@"EZgNvRSijCnnpmDAPmqxDDHftoGAlkbtZregwTlTSckIloEqegJqCpRrBnqDWklfofpvkzZsyqVGkdfsFTkrtWsSzKlHJnLnKjzfVxQZTNFnyHXzQslCrYuhzfAI",
		@"hQmAKSoIWGmQBPacMVujAosEUSXHVfgcaGvRCRELwSLjHKUUKNOlBnBEaDaVlfOxMGDmtWNQRzqElGYVqqQHGBeghuhNLRsSVzaXZZQutNIbgbvjvKxlYTtlUzuAcZLZlrY",
		@"PHiqfxwGLOvTwwUMXVxWvZxUKXYhZRIjvZsbIhMSOCWugIBUByRLmCJqHfkPSJwebkaeAQFsrHAyusKnxliWQuNQlkWEKxPpGZNRwL",
	];
	return ETEqHLbCTVXBbmjXl;
}

+ (nonnull NSArray *)ruKWWOgAyicIl :(nonnull NSDictionary *)greQTqOmLAJgzeTzRUQ :(nonnull NSDictionary *)yXnZyuTIrLhh :(nonnull NSArray *)RfhtBkEiIyqWFMRCu {
	NSArray *HZnuxacEcsGXcMTh = @[
		@"afdsgbTYtPCWsaITIdCBXhmwtbtkzrUJgqsWktzDjZqRurWELUaIgHbVcHxKMbwPwGKviYTGixGHdLGAaugVBWEMpdRMFnzZCTloEKUGTUCEeDWQEOlKrEZUEDupSJukNpcnKuCpAkQ",
		@"HzZTtILYYKCDwoyPGRQgftYUZFNJTnqSFZYdlpYPkHXJgKRqbmDvqYBUFMMgvqCWzYthdRzwuRKrNLzrOAPjAlmnGYGQTgMhtBBSALCoUSUbrpiWsrketjIvRXEUodEXWpFYqjUKkOKRWcRpd",
		@"ywkVEMkdGgbnCgQVPCeqAZVoNWrFLgedELrraESbEsgeXFgBVtKMcHKfBxqceUVzHqPnbHDFfvkNqkrTLwsnviyqbPdSRwgrgKfYFmREforNUWezQVu",
		@"aDyoEXpCvUhlFATPzTzgePcQjCVsUuMGyGiYLLbjtnVxIDIfFfkfeDdYBYFndSJHdwGWwbcSqvvyJbxuLUsvXTItmODwnTDtlADynXBAZBYMSbyLtifZYg",
		@"QwQrnbfUPCWDRsQvpeEnIIOXDvQqccflVdWJtlIDVrwbkUFnzQJHPguDbaZOmudOmXswgfJbohxnqesTKLBmDoAciEBRyIrazMrgIfsmxQFxYcxctcLiBlTJIomeEUjF",
		@"PMXvMbzyDFAlODgnNbYhdJRQmzqnnkuwcNZcFdHYMDujBmUxYfvuLxyzVIlrmyFdmxvgKCLRNFGBpnKYNgaMJtWLvlbJRIRqsPntDFgThOkGHYmvuDGHrXPYWCdvSCSED",
		@"ICQffzFXNyDYLYiNQJuTNCuLRNYifdTtaIsqPJOaqjtTPCmxnlIAepJoAPXpXpZYkulpydioLoVunacpnrerGvnOKzkvwxtJjkAqomDSJBeTdvHNPjTRHjqrqWXLpL",
		@"JuwEVpfZwaDRyZTVZHymfviSvscGsTLCMOcHNpAiINrTZyDiniTtpkTDBUmDxYwGbmmGsZautyOmGySNvkIZkWZqKxHYEtcifkthPTJGZeExxTQcDkoEbxcaOzfx",
		@"ulHUJAtPdzTtmUgRfidwJHTaatOaYaKiemOlMwCWVkxTwWHessfavOpXFyKgKFhjPoCWedqDlCoZUaJNSqlkqSnniuUEEBdNPmkIHKkYzJWZYpIIxzzBlsk",
		@"GsfDAquNKSuHMZpXVUfgOLcUwFSQYluPwtAlBqNAdoCTccXOtHplmkYzPkLRJHtrvQgGeCbYbYiqvEzcSyuftGjcDIWSIFZDVQSZLSvPLKGlooFgbxrLiDILVVtWMMrRFkpwju",
		@"BXBTcKhEhhwoAjDmBrneSByBkHijmIBkCcxMbcsEYRbVEGzlHxyJDibKgVjqRcJmgQtcRsSmnKgVsttwQObGmEkPgLqQJgAZRhsWXSJmqxvDJaUbhHwmqXaZQOnwRVHheCBbVxwHVuOjVKtVey",
		@"GTEUlDtnmVShzeaYVcKgbVcTUmQZHTJVNrHhljMRFYnLzfAcrZficRFhvKcyWFFdTlPWhMkTZcIeosUkyHpwsyzdVBpcBWVLCiCJiHiXNDabmCbSfBdpbSQPJakYyKYGgfigJ",
		@"vuvYbuxBFhUSywUMqRkGNLZZVQgkFkjCZZmoIcQcjyRfEefUVXuJboFiGktPiMNUJMfJltRvxqphAGiKFSRvdNBIZtzPCBZIxKrHhNtclthJhmDgFMtJh",
		@"ZVQHDNtrUVRqnIUzAAuUktvCZXfdnieXsINqPutwwERCecqTMrmznQfYuONKWkwtoFtAmharNEWpQYroFTfdFmPKljBqTyUTXLxGGkzvgydQfsSpfSfKmi",
		@"zXspdPiRcMiIdcRZBgsqysjtojUjMZFuuQFazKqcprBDfBmybseBchpgZwxrNEoLXwCBbtywEtQjFbQYZLTghxghJujXefYosdpmwuPIWKGeTZzjoLHMTpQUUPwEQRMQjBioGaTQptKYnNO",
		@"uTGlmAcauWsykzKPeZhggpILCYPmpzmnLZISraleEQlLxrbKOrdeFFiNucTVHfMjdCbdnIVaBJcjJAoBPFxZbAJaMtjszqDmGeZaMuYtJXUVcdLVfpoKt",
		@"iIgeRscSkDxXjsLonyAipuwIDNUDSWXUegDZFGAbnZxSTRDQTnowDhbRkDFEWZWwNJzMAOuZOxYtbvEIdgroFRRdicBajToWHMlxZpHkfXzxDxnsXeFzpbdCLDGSMMMJCnktIY",
		@"dywweOzAdDUdVmLuhDENvuwKGpQlEWrdZcLHULFLnvMLjvMUrUGXgeQCOcSOsnfzzxrGeLVgnWScXhmlctYuuVhbrUHROgWwHjcWWdqJqwYPKiJzNaqHaArFxwJqFaUVthAdeIqFbDFrE",
	];
	return HZnuxacEcsGXcMTh;
}

+ (nonnull UIImage *)eOWveakjjXCKCXqIVJ :(nonnull NSData *)gDjSLlueZGQreJ :(nonnull NSString *)EaclCiNFDKqPC {
	NSData *XLftPdWUBpQWL = [@"MfVbNnAyfBJvbXRXcGCaRbUAkgMEauPeHuGcpJmifcanHxGOEDcJqwQKNeJxzRLPeBYhnosDTybtoXMSZIzKAIYKoKsEQbVTGOTiZAHcYMdSwGCoJo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BFwMIhQDPxdTqcjhg = [UIImage imageWithData:XLftPdWUBpQWL];
	BFwMIhQDPxdTqcjhg = [UIImage imageNamed:@"STuLrKjVUwRxDJzeCIRWvfYQEYRzSaSgwnGJZrIHuoNAohJdGwpjWvdDmiqQMEPFKfietRNghGFyywqIubtvEDlZocWQmUBQdJcFmVjNZNkFBqWqDdEMCSbTbPKvvvhrekLAuUxJcZTOSHJr"];
	return BFwMIhQDPxdTqcjhg;
}

- (nonnull NSDictionary *)ydGiCYJvdzKiCAe :(nonnull NSDictionary *)AJkHGkrgarTAz :(nonnull NSArray *)sfBJXCNRLNnaYmm {
	NSDictionary *AmBlvvCsTlWrGljX = @{
		@"UWeSvHchMZwaAsUQwL": @"PZItuhgrCNwzbshHnNPGuLcCqmJixrVrshQMtoOdhwEXcGkFJDJIsJLrTKjpkwNOrCuwKPAwmLQqhDivKbMbKQAxisDwPSMtOARDTCCoqkyeHpKpGNbTeWvQrwcfYbZqHGriPaLlY",
		@"ugvikElqUtAYZM": @"fRlTDWsiYOtyawocyAGqcKIJnPrBQRadTtXgPHGgVgQTxiTcYfenAebxxmisxIfZpomwBdNjJocIFKaMNAFNMPNpUMArZzuTouRITXzvkpEGQgXVBXoSTTXyU",
		@"hwHPlhJAfOeBJ": @"lMLSjBBxKUBIGpzEkmiQfzrwmzKzZyRsZbZoiVxmJbizovgmjMbcqDcwseZsHVTMADDRlxuECTzxPhWtaiEQdNfoebClNgNGPnEBlbJlWyLigcyWCUsctampjQvDwaJZzgJXFnackKgqyOVqAu",
		@"QvyESOioMJJ": @"RfAKdtLPgiDpfOyKOMEXAKyvmgrQxOBTBtzIewhpHGikJfWONQqYvEipIERowIsRFXHiglaFandSMyDLBDsIXhhmJSogktOMKXEZyallewphHsjclVpMSUZuBgUuIG",
		@"GndyypnnMth": @"GyVRuKnxlfufsinBitHjLHdPMCYNCPkrxwtNSYtzGiUkxocwEwXgvFiepODUwUaKMCcScPBEiOSVttWywWofmESEptcOBMccBFarsTAZSQOJLSEHHCsuHTpgpsideLdfaTmOpMmKaLRzkMb",
		@"XAKwABRdEjKLHWef": @"YhlElTLmKUyEtXUuHViMEcMardMiPFHHZhLUEFyNdeHaCVRQDvEiUdhwdTMpAteHGMykgMqrXHDWzuORKYkLnLKsphJhdpHOmjsctYUqcobrZFYdWXICJMIXY",
		@"diSxGCDsenogisjc": @"ZEkRhsdnJBkKfPynpuGNGbWMlfReXMawgXtpIQkOujYhcSQAkTUrtZMIoASPgtSkkOCRKhXBsrktLMrGDkardLZlgRJIDUIrZYeIuUyHNPMOFXqMvsjOATCYD",
		@"guKfsCLgYvXUHRAwno": @"hhYfHyZOxvnVwJokXPoAfzSkvfKzonPTofziyrGksygTlYfyjbTmXRyqTHmUtEjYMDRfDYqLWHOkykMhUtjznaguGjQyjPHEmjuqhgMdOSsfymDfUmusDhMGqpQ",
		@"UYnaABlbhjOhqtY": @"vUdttuzsWNAAGuaYNTwamjVqfNhXrgZqjzuWAeZnfhHRLfdCLadWmPjIEcnfJDskoirWNXBRKWodZSSYjaNPwNCvABJhioimWgyKlCGWjUECFQgVvhHHKIPOadfxeS",
		@"LozKKPXkibMXKiWiW": @"jIYjNlwTavegmbfyfZMZdcKbmKGWOTnULwdRccjtVUXYjORUSjImbGyndDXuCXipHFllQTfynwPPFjnFgiJwyFqKZpvjHpRxFeSlNrkTyvimliSEk",
		@"VWifzVUQXQ": @"cJCYnhekGzDtkXgnzTlgDICiBoJpbJCcJeGqqGyblJzTtxxSEvVNaRlaixzLnKOQMmOtowauebCciFKgRlKITagVOLxLoTyXAJQnQsliwyuFNrns",
		@"BpGOZffIskkNKCl": @"mSPnmxTDgSDiEZEmmUpqqnVwUfkMeVlHhiiItXRqRSnHQULcHuMuExAgZmUkJsXGaNaFIugfiKraWfxzEqYbbITyDXcMTrguHlEsbXmnVzjAi",
		@"QQIqsKgtqFmCipy": @"qhYbfLsxqnotnvhEnrnkddCZWqqTKuTfhzKHlidrsdkgNqRpyfUtNIpHGfmjxkvtDLmNcoNesRrzCRZCsuBInYHsWEXFELzkPUBmqYJvUeSiPxaaUxkEXTNUUZEm",
		@"jAqjdKrJuB": @"JifjNFxDObzqpjADibjhYBCWSFdtGqhbzUzCSrjLVIeDrlJwEtBbseGqZdEdiLvbHDviUBgWExgyVVXWkNNqDlWZfKcyLNNTmDjDRUlDupjWoYJzrnrFfW",
		@"ikCgoMqKEXbEBKYdR": @"xeBufeBSyFecnqOnqXNwWsYNAoDqXtUdMBfyRXylQUNAYUcmgeprTSwKxWzEmYUHmokyjJekGXHtObHXkeAUyWfwpKWQVgOEXotbVVJtFtNTDpTwmjrR",
		@"rwIfJGwTnpWRNmWS": @"QIQoSWvjUwIPfNacjPIKywhlSaZoxwJhoFMKgnHBdJkZhYLzDljNvrBDqLMosKJJuTXWAbRUmQPBBnHYLXujFpBgUwwzlSsgebRuTscVqhGFwTfCJQeemqdJLBUa",
		@"VqMUhEoqFT": @"mJGTmFbdQpyLyynxGkQmcwXqgKvZpzvEYNGifOYaXSCxzgrKwRUomiqDZXpqRDdRMzlFWnVIhwnUawQdfvExzqcKOZsoOlwhcTbPOqbMPBOmi",
	};
	return AmBlvvCsTlWrGljX;
}

- (nonnull NSDictionary *)SAThPPjeGk :(nonnull NSDictionary *)iiNlJuSIIadC :(nonnull NSString *)UWEAORGxGNUnIGXReyJ :(nonnull NSData *)ijfXoCMYepnHwp {
	NSDictionary *uUAPrIOxeLs = @{
		@"XeCxBsSyYGw": @"QkpqqYyYcnSVmASpIvZYxWUcMsGHdTbDLhrIqQXkSZbuefdmgrbaxsWokYUefMhZtdIDyXfioVdWhNockXxCUzQeVqOyOkHgAkmMOJVlpgIqblKrzBcVbwgDsHJRtgdlQZIbjVdAsYCUHAHU",
		@"aoeDZodfZV": @"xxJUrVzHnqOprJFecfGSvbjNgqHmgpvZQqVquXngcXczGILwYqUkZQZCoxgOKEUvTdhxQxAZczScOWgvqYsWAimwDuxlhEgtIXmJhRUMdsMSaqguVSy",
		@"ZeXFxbnspWkjClVcZ": @"DuRInvntWSbLYHJmURhkqhkZoVjIGFbOdvPBfbAfFpUHVlaIQMgLOPxmPQOtzFxdpwGtySTEgREqUlcpoQHQQyeNTWtXlJNjtulEdrDxQpRTUOsACbeflKdsVB",
		@"WPbOJHgMdnmZbxMv": @"dLuyvrBwEPmhzwRZcGOYhUtLJSOtdGCizRdiwYzsEgyGHnaCbBsGGxyeVGmpFjpDhyxDOMWAyrySCSmqVdLdaoJfhDnciLkdLktjBIokadlxxEumYEnRJTkgRbQPurGfwMnn",
		@"WKYrpdPzuyA": @"ZkgqrYAwxwupTpOyTsqlIdyZMdMVwavrqLGEYNHrpSVfYdhbhEKrAlUxtSAXuNhjcpjmfwrNYWOESUIPEKcvaQZfZKUimGmThneCXERlufZaXwunVEtsdRCLrMIgdNnHyWuFyKtcYYpqjnpMJqC",
		@"OAMgLTHhkqYft": @"jdmxjQkdTTIvFqOUPjOMWMSkOMjCaLDYTJaVGDlklnLaBcxqpqTOAIYQQPsPICkdPZsDbDuHmtjZyavmXVCXdWfJoXpzqnDICYbyhawnNZaGaQqFsvAhmaeBLwMFaPW",
		@"FTYxjuOkYrnjpXnmGlG": @"CtxzWOwnmxuVvuLEUltzCyJqvBCvUAXWoZVBWUSQSfdLEuSMBOyHdQsyQTilrRFjdTpdKRzKgrpxTymzxmylVSERkrBoCmRqPbQJSGmfvElqUAArPkmelPcgexDefUpMiNTERgAgvhGcxMf",
		@"EKAmIKcTCi": @"BBcwNTkYxkmHJoujQcdJPgtbrfdWmJndaefRQFNVUwbyrkFTRxOGFrGhohtgGLFNzuJDCcGlsUjfjSAtJKGORwmKuqzYWApCMJEVcisY",
		@"PGLegtxSliQZd": @"xoBLVZVEdRTUonOeYGttWXkRSmjjDKhQITiyYDrMfxBfkEGqotLRWImIScRRqnveJwrqfAcNMesIvbLXqaNQEbOoMifEGyCxsKiuycRjOWgRGPBzkAjAKGYEpquMyaVl",
		@"vLtAMfihJHhd": @"HCFdwtJTKqmIriAAsyPgPaxCpldIXrRMVadrzTZlJXaCvhAvMNLlVqFVEgbdWSdmoMuvKJfRTfsniDWkkBEyKSgJzygVvWVjUxULTIqTqirVjSOjnMgipSrIDRhVdnJiXKTxZ",
	};
	return uUAPrIOxeLs;
}

+ (nonnull NSString *)NTyVaOsuJnMYKGfdVc :(nonnull UIImage *)xDgaMYuSgtXSViNJxSg :(nonnull NSArray *)lBBvmzMXrQMUIzMBY {
	NSString *PxagJWhHMMhLyMJuyo = @"gVrebUSsdqTGHoUAgUOuwjmTmwVYkDcAZNyrDXwkLVdFiKTZpVinMAnJKDxyEIDGGounIyqELVduSyEZmVFeSuALJrRMdBYPcpUTHIZMPYVmZBYiZWzCYACCQxCTwbgTGlZpkBXZY";
	return PxagJWhHMMhLyMJuyo;
}

+ (nonnull UIImage *)aZdhnGZXweHgMOhQnKT :(nonnull NSArray *)PsoVMmfHlIeoxxbygp {
	NSData *cYNznMUfERMWZlWI = [@"EgVOIMBfuThwcbiYijmYWRBOFkYlgrmyjzkFfqThkefqlkvOaRrEBfoUusbPyBkEXVYNWiGrvnLfMkRARNiQAUuCgIbatUhlIjpnAAIoSFgJImyUzushPlFPbahjgtdDVHOnzSUwo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aofICDyWcCflGDm = [UIImage imageWithData:cYNznMUfERMWZlWI];
	aofICDyWcCflGDm = [UIImage imageNamed:@"ddHbDGUsndSOiXmXQXFqZwHnKkPsKyqGANWaZYvTtWkRNCgMecZVzBKMuzLcpvWyMnTKqiZxLCfXSvrHpJHvPyLlTkqbzpCVAxFFOdCikPixPUhhIz"];
	return aofICDyWcCflGDm;
}

- (nonnull NSString *)CQZMbNYFWT :(nonnull NSString *)czBnArJDPoZvxHiz {
	NSString *oldNcLUNXnjxTwbKczl = @"ICoBelIQEpccCNeGZLPjWiDYqWcFyUasNgfwHdfSwMUGXufyPEfCaDdyJEPLerOavGIEcqJqjtHadNpgWNOkOePOVRHwgKnBHUOKeLcpYFHPDwQBZYwwMnMWDw";
	return oldNcLUNXnjxTwbKczl;
}

- (nonnull NSDictionary *)LTxIpEDmQflyzsn :(nonnull NSData *)kNGltuOOmPFIIRRBi :(nonnull NSString *)cFLKoVHFPNS {
	NSDictionary *GmSmNFAxLYQyTiL = @{
		@"tfJLiBmCDg": @"EXpnhvjNCoSxGkqTmEjUFnyBvYFOxUVpsokINaKZuhPFvUjRRIlZUDTWMniuKEYCIjGgnmHQEzgWTzWZAtboBdRUtiRTnNRqAvmZIDYotHmZZqvftwUqPKUFQvLLIqiufkGbHWlnQ",
		@"boPeiTqEVV": @"zhpzgbsaVzhpTlPXnQohkUCYlkdhXguVyTPCgGHtivaxlhwiMqsWNwRlvKcHkWRodLdEHrgHZqMuSBSQOpgJzpZPVyyMhyscDfDDAvOwPuwyBnOkDaX",
		@"nBKRWcnSDq": @"fQFaibyAAmvzIqfpLpktrXczYlKyaaufxNWjhymmJRsbXgLEHMJcamCsfnvGPytIETRLzGVpOPItUWfbbsnFRMMJCgOXrgIiRJvrnYSkxguJsKBJhIiLzXnoMyxJqMYLtDtaegbmCtJvagRR",
		@"OiXsCGnNrQSeWPQLZQ": @"rIedCAgFGuXGHJtbqafYwZgoCKPQMxIWYDOkJhJFBYVwrEmceMrRXClCjwMYiaiLNyXiKTUuHDeUrWUXqsoaaLpzfwBlWalAmOadLBgRPCgYTep",
		@"fiosBiSPwvBljWEFxAk": @"WMNFclTZZHjkqcsqwmCuRCdjeEmPNgjgPUtecRcZIpFuZolWRunRdMYSHsSgwyDViUEoDOqzmXhFZQMPNmCTFZhKAIhtEnWxbZapIxyJLrkkVtHKgahS",
		@"bQdVPOOcphqsxV": @"YXCHdEiwNYahBBZtXvPPPFDELTTfHGqJfPjREwjsntEPHtXTFHLNnBYQujrzGpXxShfxuBuvQrZKViTCdKVCIqYOISgJyUzYzWueJatRWsbKAnXfhZSXubUTDmRnshQnfFPIsD",
		@"rGJVsAtTuQBhwm": @"FQPHFGCQxyptcQkgsrOYdCyaKBdOXYsCuYmvdaIGTNSzZZyZhCZlDpittbZYYgJXTYdgNooTtDXIYopfvXjGePIsLoUKJkxAZygdVRQrqmNtgmAY",
		@"qmVpuMyXbSsyIVkhFxC": @"QHIdNgQrbGQVPKieIrqlTBKrdFOJcNDhdAQEsQiOlySvOALSgZOExlJMnAtLJnGCzdiijHtqEruCQIJxUuMgoWzjfcoapWshVdOvOWRMiwkuh",
		@"NWObTEqyTkuamPz": @"DEmujCsysTiEVLnaTjCVSZtGuiJjPjklLQtJFcflmbnbxHBbSWMcntYVVvARNjgIfIZpahazDiqwMsGgjGpXqCSGdrrqNGbVNOfAUIGPbzyYtDPCqKntjgLuytFmNvZUitmWqIUAkTrvhVbcfBz",
		@"hhAEYRAsoquyE": @"xbGPTxnMRLrQszKmZvMmJPUAQoosAlwLcoQqVjPhBEtKQaeFoiosDdDlDWmoWSwhewVRoYDxHTOvydOMCeRYMWtulfnhdrkhXaJpchBsRZYOuaoBiUqFyTMI",
		@"bFEuYXHoFS": @"HWqheBenaccxTQeXtVfAtxmqojORXTGyOnlTpBBnPxropBqeeJVYCQjImAQaCeNreiZTzgCgDJZwICYrfdOaBoDECEYDPmhHblbGCHDPRMwtyZxBzEU",
		@"MuRCNNeSHmeijS": @"VjfQdGExxgkhSnbmLcxDbXbWLxyzLDWFvaGFEBIJxpoiRcwztjXhbZwysqdmdWgpWljlsBXbpjBpIssEFSetnqjTorpDrWoNTpTYDSuPcOglUHhFHRQASJs",
		@"doQYUAEhHYxRDPtkJ": @"UtxdjRYAuDnTwAwCaOGYqtFPrggHuBeciUsHPhbbsOmsXPknKEuHyQiwNnowvnrmDgapBgIbwxVOssBlYIqjMMTIUtgmxDkaqnBIjiHnOSirbYBwz",
		@"CFxTiuzhPe": @"axPuTbqGDEMAGpzHayJMzaBSgAVKmfmfRYCqErAylfPYwngQjObdSGFqdTbJMGEynHoRQXveJczopxmzVcUHmqSgBUuqGQxLaXWsOdPRwhufkSPGERZdOkKNmliIkDqUfLtzkwrbHdNBm",
		@"LPkfobMkkCmUangAfvB": @"TjfRgifqSUBEHGPTnqbDgXQNhmPqznyukdxEQfMMUvuVPGNPXrESNFtUrASSdyVfpBAoGOojcnAjewtuXxWbCPuOiiugOPcTctjeknMsnifWxDDmZKSsXWqptSoRCblpnxPmZ",
		@"dSqFyMxugPPTIaKAw": @"zoQdEqmBSdgNlShjTbYynTUyoBXGobHAcxsWyVAaPYnGoDobJmiNxsxckWSnCILfkDOqRkMYmzagcRLKKDVrrVesWizTwoVfskQjERQiD",
		@"MkzURAaNJEJdhTaSFqM": @"oWPJXZGBhlevFQJVNvHBFjKJiUOBNUYkAtzkafmLSPpcPgxNHGOvkRdlzMbXgRGjrRPKfUiFumchpIMzfWdLrXMOCKSqLYkSETbtYhHMrfGdfVbsFfCWbRtEVROLoQ",
		@"XntaRiHCaCHyJblvHY": @"gUWFwPZhtepEUqplJWhjSJUXRoWsSrEwBdHzbIkORooJxdxqSTTcIYaKAcmfcQeXgUWICCMAcscMhEGSmDOQDzSaNRHdQzcWeBYKMpJxN",
		@"XHntGhrCTVAxG": @"GpEVUlIYbjBqgzfgYlEIfJiJmjvVsVvktfzxJbRlZFNHOjhhbHESRqYKSLzKIAUuqhTsFUPtrgDStXWwUPwxYiCPXPwwTVBNaluUosVVXEawfdkhg",
	};
	return GmSmNFAxLYQyTiL;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"InformationListCell";
    TeacherListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[TeacherListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.delegate = self;
    cell.isFromMyFollow = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    TeacherListModel *model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeacherListModel *model = self.datas[indexPath.row];
    if (model.newsCount == 0 && model.liveCount == 0 && model.courseCount == 0) {
        return 77;
    }
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    TeacherListModel *model = self.datas[indexPath.row];
        
    NewTeacherController *newTeacherVc = [[NewTeacherController alloc] init];
    newTeacherVc.teacherid = model.userid;
    newTeacherVc.nickname = model.nickname;
    newTeacherVc.userid = model.userid;
    [self.navigationController pushViewController:newTeacherVc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)cancleFollow:(TeacherListCell *)cell
{
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,TeacherFocus,[UserInfoTool getUserInfo].token];
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    TeacherListModel *model = self.datas[indexPath.row];

    NSDictionary *dic=@{
                        @"teacherid" : model.userid
                        };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:likeUrl WithParameters:dic success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000)
         {
             [MBProgressHUD showSuccess:@"取消关注成功"];
             
             if ([self.datas containsObject:model]) {
                 [self.datas removeObject:model];
                 [self.tableView reloadData];
                 
                 //没有内容
                 if (self.datas.count == 0) {
                     self.tableView.hidden = YES;
                     self.noCommentView.hidden = NO;
                 }else
                 {
                     self.noCommentView.hidden = YES;
                     self.tableView.hidden = NO;
                 }
                 
             }
         }
         
     }fail:^(NSError *error) {
         
     }];
}

@end
