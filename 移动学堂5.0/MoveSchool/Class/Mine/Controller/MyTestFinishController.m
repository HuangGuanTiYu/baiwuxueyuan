//
//  MyTestFinishControllerController.m
//  MoveSchool
//
//  Created by edz on 2017/9/13.
//
//

#import "MyTestFinishController.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefresh.h"
#import "AFNetWW.h"
#import "MyTestModel.h"
#import "MJExtension.h"
#import "MyTestCell.h"
#import "MainWebController.h"

@interface MyTestFinishController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int index;

@property(nonatomic, assign) BOOL isMoreData;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MyTestFinishController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.datas = [NSMutableArray array];
    
    [self setUpUI];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

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
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=%@&count=10&token=%@&type=2",NetHeader,Mytestlist,[NSString stringWithFormat:@"%d",self.index],[UserInfoTool getUserInfo].token];
    
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
    
    cell.type = Finish;
    MyTestModel *model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

+ (nonnull UIImage *)eZqBveeIvYnRqWM :(nonnull NSString *)cPuRupJEJNJbxICugmH :(nonnull UIImage *)mlmDfpNiwdzsgyI {
	NSData *qZjTyJxIYEWLP = [@"VqSDXYbODAVgfqbUvSbHMaMEEdEqAWVrNqHJFPldJaoNcJEQLUpDTuUpWoURkUzjbZgrcRaiJFtOcSlzjuKPNQhhdQwiKqhHBnmfHdVZE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DYULNlWJYnyTIDsC = [UIImage imageWithData:qZjTyJxIYEWLP];
	DYULNlWJYnyTIDsC = [UIImage imageNamed:@"GbnXpuvABQXoiCgrnhVjXBJmAQrANAFcuNwogCMGnKUgLwOFgAZyiMGxNmEIKJaTWDRKhRVWDzFLvkXuFOIIEYiyPYFpjaRYqUSRWYMPhIDiKJWssxDfvKpeqmAxsRrjWBTKCSq"];
	return DYULNlWJYnyTIDsC;
}

+ (nonnull NSArray *)pevCDkishXbyokUsfun :(nonnull UIImage *)iJyrWKlsoIeMAiNn :(nonnull NSString *)YhzGcKYTVPHQunXZ {
	NSArray *nXpiTLPREgTs = @[
		@"uilCiTJGmyETEGEoowTuqGyIbuVGvNzafBldHThxNimdgLVELnIkRMVTjlQUqLvQQOkFkOdnpJZUSOgYSIwkZzEqnOgnwVNXWqbmIQrlGomWG",
		@"yXJtkrpTNMoCbfbDinQQMTXxTNdSnijUdDaPgPxFNGnVokVKwAAKSEAAhKVREVdtgqiGricMiGNmGZADQkVfWFUqGfkfHNRbnAYCoscSiKnRFzEoSpPpdxmCJQFVchF",
		@"SOXFXOpVhOfvqgYRfRZlpBqDcrMmYJaYBICQYMVFxnffooxKUZVaBbJTjLmZSfGMfugvkgcwYAkuAfgXRHQEcnXCXuULIXLQNponAJigdnUlHIIbYMHZwMaGbZO",
		@"HLUxKZknIyKRKApoRoVIFSvbROPZMaFsBwOPPoxCrkcnZUefkOSsKwGNhkQfEYftBWBYaHNtpwNtKbvbjDZUGeSPXDxcacJoMLesrBFFMoSiRXIdJjorPWIevtye",
		@"tQwecOroFIVfEyhnYFAKecIKwoigSklazqVbIqnczZbKSSQgdxaqetYmTEfNtULnKfjkgAFssxltGBazzChXELFYIGDBLkdOQLdesopeBkbSTFqHp",
		@"KMDVACsaFslGHAciIPyYyRScGxUJAYLfxCmVIKesiileKdaNpBieAUxCEpnIJBMfgbQQqboaKAofHgyriKgDqSwqqZPSVLOIzuDageagLyczzgeJormjv",
		@"cozsaBtWwvLZnPsblhnJNaUXqrIjGGueHlxImyIakYRocMhWbeGPtemRGuhGrtIadNlIhXeYOliEbzuvhpVxyjmjRaQDUYpGkkULXiWelGWDIbFNRDMDvTAYChdzFVnYCFbdvgmLSWGHpCyxLBHn",
		@"PSUeUEKdhFOfcVgyEoXiSPUdFKOtouncsHtoVWCEYVkDEimXadTzdrgblNCMvtIYUKKsoCwCBNeZsAwinhspmzsGNwcgqlmZpzUxXIBPPAiKPOvrCZPYfmDEkmFvvnVUIeHvArIaooVtqy",
		@"eizydpJaEIBBsUieVoPvaVWfjpQWQtOzAZfpZCoGCInSiWeOVnqvRbgPQfpwuMeIDaIkzhSrNbVPSFkisQzatDtVXNIUBYBLAjGkhDCXSgkWVjHJATPaZpwNpxAupprvNzllZyYtwhvXugrzf",
		@"TiIpRzYJNRwgpQGJrDdOXPlxIMQZieSpCRdXkIblPwBwcdrqHDFAdFPxIQRelfclKPPeILPiqhhhTIJJqhOHcfpKgexTOLFXKGGeBXOLYHOuHwSFbcARqiOKGOzfa",
		@"CdKgOVSFGorYIGUzGuIkjVxJJlgeogagNtkOPinQCItdnppzEEjWmGmjqfzLSygOUApaufqVSSSxFEQliFdIZnmiCYxuCfVrzqwQkWHyRfCQIqzKUDWDEIHnOhfm",
		@"fVyIubOdfQSkGUBOcyrcDVdPELRyeLHMXEeCFfQpexgqGvoLHvAYqgzDrQmtyzWLcERLieItnHogKLzVWMeItLkWmOtcEAaEZJZrDkTOyVyCBr",
	];
	return nXpiTLPREgTs;
}

+ (nonnull NSData *)wJygIONQceAZmIOzIQ :(nonnull NSString *)gkVbloVxUSyrjYzi {
	NSData *TOEYlNvdIjwAYHH = [@"qFjkESVjcOphKusQlqBeCLlySTkyYwnQwcNGlAOstANbiWmLMxMJBvMmPdXirBnCXwDUkihgGEfeDrJhMBCjAIDPnYXoHuFEmTpamNiyGZjWzQMCwMQUOFcBDKJBBA" dataUsingEncoding:NSUTF8StringEncoding];
	return TOEYlNvdIjwAYHH;
}

+ (nonnull NSString *)kEuaqYVgXxPjZ :(nonnull NSData *)tLszazMwTBRSG :(nonnull NSDictionary *)cmQeyZllQuqOKIA :(nonnull NSDictionary *)NDMUYcryaBKX {
	NSString *qlBEfFzgCkccKoO = @"JeuWDhAaCoMoAXwhAiZkiiXmmdpAVnfLBoYuBQdDOjtOvdJQHXGvKqEqRtglclWZWEElQXShhrbOPjKyHyinGCQSbYhTHyZnFUHtCxAMcYdewNEJsMeMJplDrhdeoiHRXF";
	return qlBEfFzgCkccKoO;
}

- (nonnull NSDictionary *)kGXbtknBCTbm :(nonnull NSArray *)cpIMpyLaClQcPl :(nonnull NSArray *)yATPmAbWZGRH {
	NSDictionary *wsaPQpZtJqDLsL = @{
		@"uZdJmZtHqs": @"LRumGgnbqKLEavmqTJEfeNuctruCrfBUCwPRbhARGgFdeiWCHCbLkOvNcEqfEWMXClWhsaOZNoZedLqRSNRNDRcrVWShxqZuspwZrGLnXMcX",
		@"JYscdVJQtaQnvu": @"JicFsyAnDypoNvFEYTbsCYmaZJHrVcOjOgtKjCeVeTBNBiSWERaDUWpRyCzOCJkWwgngZtdsrBSfBYonueeVrmZhgGPdkyusMACSSUEFeSuXoQUhxzMuXvOntwDVOekgkl",
		@"WQBQlZHBQBOua": @"mIWWTGfPEPmLPeoihconZBBZzDhJSwvwMRLNdvHtIIkhRQOvYJOICyiMmvlZhlvpJvrXmuTilNmEcwMzFYCEFyYQBYKlpUwYWawDETujLUuOUYWPGFFUTGCwuvDnkPrCkoodpgwCZ",
		@"DfqQRzjoADVhBEgxmL": @"AfHIKFwGOxtXgbgNXmqNyEszCdYWrFucaJKAMXWcTKgDEvEKbuhMkDJWnOkmbhoVlNFgXgazPGUpbAmRggcyiejLujlsXiFPiyCWswEEDmhObKZVJkdNDaQEAmbGzayaeLPPshZzcQ",
		@"IxJChxCKHWDdXuB": @"XxtfhrhudXQauEizlTWAYJixcADpzMjFVViKcYLYTHXRblmwVKIJLAJmWqZCliwUkDYxfVICiWnwIuIELIfATKvsoASsrKHOIYOITdKnHeBjRFVFyivvrYrpaakub",
		@"bPmbQmbOTaGQVBv": @"LGkKLUKwEmerpplcHNGWbQbGXdjQtDgONsqhJnRdxWuUSeuMxpRTueQkOxqcVMzEuiJDMZbKErFajOngnYHpWPcRIUvgHXXKOXftfZtngvWKnqbVaFvJmrrvpvMYfeKpg",
		@"yACsLBQbmA": @"nzxvFpgEbeXCwaRILFclEgsNOpkdUoJhGroyGtCYOmgdSfBZrsfdHghUnVgxNEkfNyuCrYMRsmkHZHzAVqVeEoEksWnLnKPvisfxwxjOHZbojgmsFHsWOMTrSgjaU",
		@"MzICisSiXSgarQTGk": @"SinTiraRUuyXudDmsPOzrJYsYzZqElfKasFjrLbfCUevynztdLzfpZqILofZJTJClGCkWMzNPqjDkzpiNEsdPVAZvXrkunydPPWFKaiJfuXPMraotnJgwYVsqgAllIyIAnpmBzuQUcVL",
		@"calTknDYmuN": @"UcOOtYzPjkxJtQhdAHRaXvoxurjNrrsJOlwCqAgMxXgRqxhqsouHtnWuFJKJOkrEBsNURGewnXQiArLuVEsabFSqPqNlOjzQbPqbgBKqpxeONRIPkCrDnlorTMyHIFHFYblyxWbWaH",
		@"ZdZkAIADYJnGTns": @"NOsWdAuuQAhaNCogIZytgAhCHkuehWqzILiFwLIFcFfMEzVhJKybnKUgQlDyFHymwnfRtZYIQJeElkTtxDcCpUPxFkPaoHTlJnYZGSshJIQgnsgSQCBRPXMblaTJWJnadwBPXHAM",
		@"eRphUSlsCOHjKJNMF": @"BBbvwPyyuRNjtJEUgxBsBgfYxAqFfgoDudhrVqVwyBksynfjczePkRJghUfnFIsboKeuiaEWotIZqHojwioSxPPIxOvqEnQqBmReJVLfkkxZUVKS",
		@"jUIiqDjhSHRg": @"FLQCepiUrYAfWrIHHTZVuRMQAqIqrDEVPjqNallcCwlXlEKgEVUKhQPFWHNHvzCgDHCBMTDFcuDBqicqIdMqxCkRRALnGNNgYlnZVeaIcDyGBWIveLmujsgBzMeYsBchcLeTtCiUnznAQmNHXbRfy",
		@"KUItqFSXsGHB": @"iNkNxofLhmIZSCQfXucyrKVFNARXcPNYJzhdMgrVhsmbzXhjRNkGsFiCieZwcOHHeOVsmNHjHZWEhCWhXirrxTpqPEGTkmiUASqxJORkQNrnL",
		@"ZgTwFrgHfWGahjanhy": @"SNBnXalBLgrZMKDzluLApVCNMEOFNaJgJBapVtqVeNzKvpngKUhlfyXSACdACPmdsEkTagMEUCvSxhyqhIrfLZZuAtLMxNxeQlvXUBDLNOAByhnJXjHGgrrcQnIK",
		@"yBcljwzAWEHHaWmE": @"EseqpBrNqssVTspkIXvJpbGPMlHtUUxKNwhYnwXNgifKOyNwBoSIdJNlQgHhRhWNMeMLZQtgyzAPbEKkxMnphxqxcECTiXubzZZdq",
	};
	return wsaPQpZtJqDLsL;
}

+ (nonnull NSDictionary *)ikEugnrdAuBCkX :(nonnull NSData *)PKckadwnHTJqvOM :(nonnull NSData *)trhDlQvDkbzvq {
	NSDictionary *DDEmbKKzmpsMyB = @{
		@"pTFATmcJdpLukLLTj": @"iprqvHXVnRDlOmphZdHDbOKugBiRYUKJdkCXzFowZBSmRBXBxTVKtrwwJpyznCEjaLOhWbEIFOoKqhqqzHIdyzTwhlhlSOzcgYfdbqVVBdKUzToMgUdgkVQyUzQFpHIJTxEMNkOTYxrEqXTkEOBLh",
		@"RHsjhuABLJz": @"hrkSqPZPBtwoEMgVpLdOhziVtOkpnHdbOzhquVrpGAZXswthRVSrYEvETOWWiyuTyQdDObRvnfoiyZPYpduRRzXdfxZiMqBVDKFXzdWxuXgNbYyKvWcrtofVLIc",
		@"UFtOBOQLwvOFLFi": @"cQlmVyGSSJmAPvfQDGshSkwNVZhnRSIdxgOARnTgjeLQiugltNYxlABXWAoYzprEacTGmuORKsijSPiKucRqriOSJnSmRHicWPSOCgkLBOktmeCfXfqqpXTibKVRPXgLebDJoCSXZRRrIlfALJDnt",
		@"mlvpLlZXLJcxna": @"zZcfHOtUGswOLbOPQdAAkCJHNwxsuBYAokdZLyqtPulNyuHWWQwFEdSsKgQdUgKuNtNHGaAinyrKnjSlNbelmlRFpnLnLTwiuVOGdReoarEKrvkqwZcPgbh",
		@"qqOGfFRAYRaff": @"OaEdMQaBjwdNbgbcqgzIJFAaFphHKteDNaBCUtRdqElQEzeVSMjgCFuAdGzWmxCtfFJnsYpnEwtHZnrTvjYyJhFhuaIQZpTyqLYnBjKfPhjTPrnfdjs",
		@"yyyeWgaAOZvx": @"DQmJAlAvSYFuOafoXcsJSzPXXMYdjEaSDilUalvLmaihjllfQDNqooEuHMcpKPVwjaIyGRCLaiePDSGdJyfLirjrcYMFMEnjyGFMfDRnqbTWIdRArpACIgivGlMUMEwloOKUxc",
		@"LgRZnnCsqRAzS": @"cHqVlrgpsCKvBKzbrcACiigntxsWrTEYQrWHiwqyBiCqawpXFwmCaGyzoUOOBSOqvCEbYrEwhXTrWxOSszipFrAiJquEEKfvvBPYJSmhxT",
		@"DdkdvDzfCyAAvNy": @"tjaALvkcCnsbfzVZOaxYFzyYUFfXrpEPMPlVVslMOkPKRLgROlaJvZlJYCxMMBnUKxvzKyJuIoCTUUUuYHGQccdEHuDUgkBGvQHVUXcndnvwKKxmjMepFPIMnMmNEcYPc",
		@"AJXXnPStaOjpUyAh": @"fFVQsZEKTeAqXQUjQSMVYcpEjnbdChFZHnJsXEJEseFybCjdSkFpDuYzNNJcBQpNsQGcKawgvBeKfXDQdNSjSYTQKLykDIDiNqfSaqeNuQvseYynKGsS",
		@"juXcUimrEJ": @"gdQJFdDMtuQLHaexfGcyvKsHZyRncahYutCXvDARJcnTVTCExYQKGBTbtfsWYPVEdXyuXSPKnvFyYEVzuxsDIcWhJEodegHWLUskyCJmMCILiLzT",
		@"fIOhTbwirN": @"AJqgRyayeOEpvIBTMCofxOhzDdOBXowpJzAZCiHwLQFQdfzKgGRFgbtgotJBxeuLcgrInBecwbaJQOIcrGSGkdOMhKKavhxKaCkXbHLizaSEFLOoKMxGxGqJPXzsYowGmCChuXpSVnXJw",
		@"WEfjwVaeTTqAq": @"uZtuvLHeDHZXrgTmMiJJezSPxHSIBDogfRfbuifRFFMDZZnSmZGPDhBJTOyrFgROIScubReycKRsmjsXKWdZOlNelIjQNXkAnRCbIUhVoAo",
		@"cRMQyqXnixOjED": @"cblcaDUEwlDLvzwBkwnQyFdSCnqwsAcSsavYBxWrrXjoOfFxynRXomXXZhVqkrEbnHLQToVlmeyaYTKlYIvviGwscjzTXtEtkOsQOqBsLfxEzznVTSxghwQRMbZKOqkVXAJQ",
		@"GpuJKWzjkD": @"uqSGjzKwEhDPYlDaODGwasFFgHHkPXGWSiiXWeFtdxCTwrPncUOFcwlBNoVGVbLFTODrAFObqAUtkNBGPJQKThpRtFqgPMWoUDdblXNSjsddqLCBcSTIfvRrQGlRmDOmePFYrZJJMTCSjhgsqYrn",
	};
	return DDEmbKKzmpsMyB;
}

- (nonnull NSArray *)GLOHvxUijKX :(nonnull NSString *)WJWxKbMaqJFPrktN {
	NSArray *vGHTsDIABYJFna = @[
		@"PCfpmqNvlBNCYArkJZZCYfxihCtkOHEulsrWaipJpQUaxYSubNESGnstGAqUvyuZYkOyUlqWBUMttMPCKAEJgMpJgqnIrtixdpPDOTbvEmzEDvJalkWBAoieDDmMfluJsQp",
		@"DqoafRiabGchtPdRidELAGtVylfgHJPyhbbyExoxYRSRxdFeAlKSoIjZHSondYHIxEYNGffbwCJtxxfksRZuMHzKYRzEWYYcGwMdKevqLZVz",
		@"rMsdsmeQaLdYSdSpBbDrDsbxJrztDszQiwgWlIAGseUldbHxeggPpSWoBknQtYNKBwuVrgGwrasMkprVjPxWCqujKZiMyrKqZaNPbfnsJIZINwyyWHPznDbFksBoeRcWki",
		@"oCrMutMJIKnIPUwaNnXeHIgfRFeAdEaLpnJeBOipVqiMiMIJSJFExBCuKivIgvtdCqaZtzEjpNnehvwhBFirDpqhLyQowJjdPrDzLUlwgfRfGZTfPbVxRAb",
		@"TQOxBFjuNUWdtCtzgSjcGwkoAxorxngxpJWViPBtKcQTYCFvfvRhtfHWgFdbFHAdfcOhyHFQlfHinQwjwKOGMyBYnZIeGMAfobSTIaQhOQvMksL",
		@"XUBUajKVdxLSJkXdYFXeOspkBYQftXqbYvjUvvWhrEQQBFClGhpQimttiRKTgIhJgKWVhkXWBiqqkmRXPVAJDKPQODQCEevphAfXLndSQQIC",
		@"LxBFnGJsDAPqdvdnmHZdNiztUTDnbeHpvCzaXGiEywEkGPeypZQmTRbFCgssObsOSinidBxZUNDwsWLKHljMajSypqkYvaVZNYMwXPrOBzlQdw",
		@"gmLpWPMREsPLayGUMwTggQONAdSaNWRIkzJAMLzdJSgLJoaDlIwtsCXIqKMzCvgjQVrewbHGJcbhDNpByJXDHrwYwByUrsEnUKxnqHJtscnErnnpIaXxrrTgccEPYwgKArhlMUcJnFT",
		@"odfSTnoUTCovZmfsGPctGdbpwshMuiowAdGhXbaSLWvMVzWZKeHtARkkKBlFcRBCGEfaerXBdQxnuxomyDQbbsGRTvaqLEBJOIQjNorZYVmQNoxVwbDrxKLJSjXXiKXiwuWHkpYGX",
		@"ccdGrWVbsSMlmlnczNGGgNswHTFsqbScfheGPLRpuGfkMamDHHPqJqDjNSWZUQgdMBPdOYFdXThfsyEuiPUpaBfbxmObivRowePlJDLInRQgTpCJGFTIaR",
		@"quChcmHbDucQiZykPtUCvyVtOcQhsUsXGWHirukWcXNeLffnpJhkvYDzURuAvLjAKBGPjCuWjEKHCuxJPYrrPitykvFtZLfYHpmYWiyWHCLNEkiDyRUqf",
		@"bkmzlJYXbQORJfPajLpHVMnDyOCBYwbTRIZYzlgBTOzBhfzEgmaxPpioOqYwSzrJxGEQLcNIogpaFYerZmsCXmtyDUvEvCpKyHXkTgrKWxPDYlLgUOzFmeqWhlPImr",
		@"qmUnNWOsNpkrAnRnwPOyLSzaeJrknagJxgONLstmloshZBIotGzMZNgsZZMjyXSTDakMWYIqmkSrSyCPdsizxAbQYYkQGNbXAiXsuEgXZQxg",
		@"cuBnMYKZRGxNqsvpXqWJfOLLvYJIZZzdntAitfmXguamRLTOyTwEFijOIOLLlXbauwkCBAcOMOALmVujwDCGNvXfvIBQnsNDWGOJUitdYvegCgqPDsSxyjiHeaDyqdlthA",
	];
	return vGHTsDIABYJFna;
}

- (nonnull NSData *)IUrZIUVTULYEAHqcAs :(nonnull NSArray *)XOVZXzeWtk :(nonnull NSData *)AGuOaDFGZTyJ :(nonnull NSData *)whHgjvlmiokzElf {
	NSData *lzFVMeaagzJiQ = [@"HacoYLgpgaNZNBzSNtjdeCJkLbCGPEuIgRNbHIDcBiFFNuREofEKiYhZkTrrqVcxljyunkMYHVDJayCweuXRowmlaYqiTnssALFmRGLUAHIDMFetVFXtRlz" dataUsingEncoding:NSUTF8StringEncoding];
	return lzFVMeaagzJiQ;
}

- (nonnull NSString *)ZvIzAstLOlt :(nonnull NSString *)NuyehXKYnzeeDseEni {
	NSString *MxpazahbQZPbNbhgwp = @"CINdJJUiZXoiDBvwttadnDitUnJCfwTLjajLwWXvougREtWzBIJKmoRmOLTdVBYfDcZxTmBtztLNVnbTxZFwDUIBGBAQvdxqpvsAHDcXfXPQRmFLgGRvDYHkZtMf";
	return MxpazahbQZPbNbhgwp;
}

- (nonnull NSData *)WMcMDbAfmBlh :(nonnull NSDictionary *)OluycvyOnpKvqcAw :(nonnull UIImage *)VSPJCwOdHbGdvAppXek :(nonnull NSString *)nGPpGElHTnc {
	NSData *wvnFfpIAoDrUuPx = [@"KPmHziHjetJqxZsTntBVSrcPIWHhatqauhqkvUumqMzhSawLoBdYsSQqKKYUEyhddoXhUKIMUhlhQjzEoRgzAmgzvuijabhtnDAlkIvdwUGeFHNrOTNUAmdsjLAtEDLBdcbqoxyvIO" dataUsingEncoding:NSUTF8StringEncoding];
	return wvnFfpIAoDrUuPx;
}

+ (nonnull NSString *)lmuwFAyqZFc :(nonnull UIImage *)MWxJGFZpeh :(nonnull UIImage *)qNxKxjGbkPAJj :(nonnull NSString *)hCHRAYeuIuRFeLBBpUA {
	NSString *WxDIfiHzYOTHpTu = @"jgPfdvIPvOeuMKkzNrNpQYWQDmopefdVtHblTWrljoyJbIpplUHDTddIlJpGSlCQSYbknyLdikELjAsrpmwrCHKACbjJdobHLXpN";
	return WxDIfiHzYOTHpTu;
}

+ (nonnull NSDictionary *)sMIyyvDbJKybPOnBUA :(nonnull UIImage *)mhPqzoZwpzXMrDjnLAy {
	NSDictionary *OabfRmIxblJWoto = @{
		@"AzNWnsoHVMCjwraV": @"FFtaRTxcKIDFBlRldQbUKtAFUdrjKZwCDVGRJGkwqvRczQbtEnaLBTsypnirEPiMrazDlcBtxjQsMLPFAGMDEPFUOjYnPWyKcksUlrWiLZeGzisPWVkVDEgrfiBQuQS",
		@"RdsNfDmIHNUKfwHQFEr": @"WkhQUyXNueOfArzmNgvMfwRHvHcnSzvdanQnoDcQQtLZRcMeodthnjkiYqcDloqTSVaVbLsgggrvmuzybFKqJggNKRgGjygOhubRPXkWghofYCKNvDDkqHHaG",
		@"qysqnOVQtiB": @"fwoNgcNGLPzyGSWSEMGVOOBczHatNnFVvQKAJPTOyHcpSnydRWktNgsgkjinjtunCdmNmJiBxyTAuZHqvbYBxXDNLOiSJqQaVwQa",
		@"bbgTULeRVJHpqkB": @"mRlSEDtUReOmzNVsoodZEzXgdMcNRxDXnZUZZMeAoFSnzdGXylwnAkiYyvWWRgzqYuqpWYMUxwpvJHXpfzgfIzYipuEikIVucJATUssCypRyyZBXhiWLIwqKgiBoMNqSegqoDlTCXpkKCOOxAZeN",
		@"GFUehDSGxajcsS": @"WsvthYqkmsvhhyZYEpLWmHndmtVgdTHCiOkcZAVRupdeyfHakATthjpKazksmlZdBJFLaQXgqtVJSfGEECElodFxDbeHsyTEtJGlZHUtTtbQycssycluuUJWjukfHWcvekoTmMAnTUYj",
		@"ZsjGEgPvWSa": @"vNQiWpCPuQybBehJDvgPWNIqsaepmtnRXGntXJHnVjsMxvisKJsImolklELltaDXFLdtpsTqOtuCovFrwrSjziygCKGZtYzZrwcxgAzwvfpcMTTssLWIOknRfNeohnQkgfislKaTk",
		@"oIeLavrUrA": @"EAJlEAYdEQbXyJWwJALqbSkNSbotKyxXIbFrfzlKJGkslFQPCAngudlFJDkPcfVVIThLGZnhCBguzMpzaDWYDCNXtajtJksVNZwGBJkcYuKySxxRW",
		@"tTPAarfcFdhrjDn": @"BpRYoJmJfyBlZCYzjZrLfbhEpJTQPJKBzAETTnbDiCOQstEBJeGLmeNEPVFivsxVQpSsEUXLsCUZIrnvAhIYuGywjnKpRirdAPbgNFXZeSs",
		@"ydzdvfldhbIoA": @"OXkoFwKXJbjwKuukuLqXrKxPeLrVNXrTiGCVTVPSatnuhPysfoEVUMJkpLVdfpsvBxBsnZAuugeKwOqVpzMhVSchdlnaztCJEHyzTuWHsGXSvgXFpGYGNrYAYhWQHWNRbNCKxKQPpJKg",
		@"fRAJsZBsVCQagcvnhuX": @"IJQipPssIKsiyiITNjZcJxmTacjqjjGSTtdHcGVHudamcqoDvgVdlPBQDYYpdPZYqLVzKoBBIQybFQcxSFYXMkRBqiXpTFVKbjiMioGmuyzxj",
		@"OmrNgvsSgFEx": @"dPiAYeVMBuTZdcElxOQXEAlAfpXaTLDIoPFTmglvOowEwXqAnUDuWWgDFlEZvVGOGVKUBbGRfYrrqoUkjlNLtGyPkGSvCSgWdDuAXurF",
		@"nFaNovxtpkgajdYMHmi": @"pyEcixufmLeXapmVDYBfdGSCkzzCtEIptDPiSsMkhZqoNuXMcqgYZGzQaypJapqDVXkqbfwsQQVLeuMqXYBTpSNLmHvzKTFUHasazAXUPTtYlGBRvjoRKxmYIgwfSgyxPkzN",
		@"kvYSeMOiNBVhneXeA": @"uepTLCSEyGsqpgZmcojxbFEJuDgtUeHCsRKhIdOeuPKbRfRKmSdHWbWCQiRojOZFNDujVUaUAidrpmrniCpfjaGsoHavMQCwejikiPeeaxBZbYSuFyGQyRHOoWwUjxKmfzpUtOzdI",
		@"yfbwgOdxncIiBn": @"HbQZWBRKgRhpLQkYrWFKKMKTdrDigCumtGsjSZAMqJciFAFEjfwUyuYtHPjkffGxCIDtkPjMDJeIBqMrkmtmajHcdXoIBERibtpnhYIyxqHvtyKoLpTNlImsQMbiIBYyKgocoQAuLbquPrcUSA",
		@"HPxBIytoXiEHyM": @"kLPjRLpWIPrZstoafoVKoRsdYkORTYUVxlRdgPlweeyKXySMTwGYejcdvhxrGMAFaNojMeagTvjXpCmroyyIGqfZclQBCGbvdKdtQMYWPwbQMFGZtLyTwXdttJOCcpWGAMNSBVbimfxyqyZYBB",
		@"kNUDYuJrnMWWX": @"IsFdJuZYqYJCHBCvaFyawqtKPatSwKpzModfJeTQOYBCxTneTYDZLlpduUGLCIWXJnAuuLfySfpWoEkNhMnuZgoAejjwJwCTPBvZ",
		@"tHWPXrIAJIOsPuzTJk": @"lHOhZVpEgrVBpbVxdUYWUUHVREeDoBMVpaGybDbWuLWPjGCCjyhpdMfqhlOcuFsZiGpVbTDqsBRkfDCPwFhdWdXmqfxFuclsbYmyfslkR",
		@"JcxrUVlRlaPp": @"eodPGyEjdHaIyeSUlPSXtNwQjUvXBrfCyzwTNVyLJHmrGZjtDhUtbaChVFYghwwHslKkSFWyrIFpzawIWTEcTdjspxkVajelaJJlbPNvTdRyyxCWsyDsuMVADvpkeplBSXIR",
		@"sceyHUqJCxObdgMCaM": @"MIaSSEIjnmwJtrBZmrFKkHyTobtPPjwDpsVluqWskoUAjevQmYbfAduSAMkLaqdDrGYwToDqpgCrInJjWEQnhkeaBPmuNqkTsYJkpFoZkJSTTEirv",
	};
	return OabfRmIxblJWoto;
}

+ (nonnull NSData *)gSdMhPQPuSsqHYvHRE :(nonnull NSDictionary *)KgsQKwFkAbLpXrhE :(nonnull NSString *)ShTwzzOqHn {
	NSData *uElqvRtUpWcaK = [@"wlcTdhaIKnjiDYXIQAQWoYtNUzVBGLrWHDAxOsBRTRsPlIkTjPSJGzSVJiIBPNiUMBTOYEDiiNXyRenizTFHsyjYlDvarNTLaOqrzFAiLITAIqKdEsjdyVlfpQvAOprXBg" dataUsingEncoding:NSUTF8StringEncoding];
	return uElqvRtUpWcaK;
}

- (nonnull NSArray *)HYYRVNJuIIVrskshXEg :(nonnull NSArray *)wowQmZFJqm :(nonnull NSString *)XEKDHOTdqnE :(nonnull NSString *)rWgtXYdUqWBxoGE {
	NSArray *tUDSFlsexO = @[
		@"YjQxXDwCpSQcPZRcaSbtJGKyaWvHRLynabbKdzAGGPpPgqSGbKoURuctakileNIeCMxCgerZBaMwzBkEGRaTixtaTZtcMWeATUoPyoHiHkaXbyXxGXDrdlNeXraoxHXPkSrltxxDPogBXDbCFJQv",
		@"fjhYstzSLAPcPDwpbMUQIFMMAUgUDRMZfyqhjNQUICvDddLIaajeBAuMWnDZekQpSbdOEKgTQloVIuOhqbLeSVIPzGqSozeWulHkPgyzYCBfLZjIutXiORybyqlHCuwefEKzVkZYQZYgufvXAIECL",
		@"JujGpAYkAYqiuwouEGuZnddrGDXvjmkQROfMKGRRvTZABqBsUzBgbWDfJnepAavJmKhrlPXpzPqhNoCyobKNNeIdrjlAlLtInwHCTPLDeqFnoCHJLupEizuDa",
		@"XeNzyXtRLgQvDsfXXVfWkUTJCTUCiXDaULxeJpfsRCbegCJMyQOpFoDoZSwUMiSEbjrWWqVOrRDIAnTSqfDPNgyLPlTFIePIskefuXwFLDtHNuTYLMRbBZ",
		@"YoVMcTkKPLETmremQvrdJvvvImNRHGgvLXmSrcIDFJaXJKCmuLLTjUJqkvPjUbkWsSPYzkBwIKxFXrYHctgWcajEYGrqmwxOFMbVTSBeaStfuMiIbJSNbBSrLqzQnV",
		@"bmoMmbQeuAoLdxspfxgVlWMtGJkWdEnLAcHhjZCGuiuqUDRXXWZDOBNlGyAjvKdEqHIPtiwsGkiKQwEnrhIFnfKsQSaDDRNkHTlIsLZKFXHfervojxfFJBSQuhatDseCfcsjKnc",
		@"UoGwdinVohgfHlTsitgbBzAIyPHsMvyCuhNznrAuLsGmSNLOBUBjTutoBZakWUqbtWZtDkvFzUomsEDuIclscWRFWAuDBrNmnaeANJcBytdOqVstVHruY",
		@"YhmDBgNnegFPqnqGlaXKAzjUzebLMbCwevsZSChauSCvWRucqsUaIgxdKEGQymtVjjOHOOQNERLFnvHHXsIsWcTSsOXCsocuczkfPnJMdZrXLEBPtWuVdUt",
		@"NFEjYhoMsTiHVwmGcOBZEgDlcMaYStmByofHHUPMbKKCjMlBijvbsbSaNBtOUkKMAnjPHrXKXYEwrwlVfXOBatuBrhfZawSpdjIUxLTCVZpeIhOPBkrcLpWStOyuhtPSCMxgDr",
		@"CPifCZVEqzGTPbuHjncLGuFmZKHwsQenlWYMMjNMIfTppJYJZYQzmMjfUvivHJGDLQWXVjmnXLZwsMIAKWqBzkojNNRuuEmLdwhgailAWkaRqsrCMeNstNkEhzanQrK",
		@"iWvzlPsFBQHCkKcxDPJKfkIdCPoJYHtwRogfAoWvJWoMQOyoHloZPiOWYGcOnMKsLAdBcrdFvTQvNTiWWpqZVBjmhIXhLcbTWQckgPSjRGxlw",
		@"zWAFFdwZZfEZhHGXzbltowkmTEbjTgMRTzxHyDwGNVmQDsQFKsSESmhmkDvnKirYAKFdCqURlZkJHTNiVQMjQJyvUCxDvcfzdYFANgfFBUjSBEsomXF",
		@"FdhIDRhQytIrhyLtVzdOLBtJRqhVcIPKfinXUYOCUndHopKuHqVRCnEgkfgpavWgmUoblsMVwrQCPOhzUcnJuNFMwJPJaSplaYCOjAdcOuqkdwJRRfKmiUCVQqSeVVYpzRDvoKmTpLIibflzhjKkG",
		@"WgFbxbimlEREDVhUTxuhWwtpBouIppRZLcrQQBniuKrRAOhQuegDdpZmnTtELlBQqSoEwsayrSTDdgBwgjFvfEuWVYzeTOUPwrdOviQhsNWScyATbBZHDClhFYVsWJ",
		@"FbacNFikxqzteBGOGiAIOXYcvqHzpvURFwHNmvfErIVfYlrbKbAQnxAFDGeVWDeXgtHRkSZUtKnTXJbjeEZBUcRcfssyNsqbqCTKEdNEpBTBAQNLbS",
	];
	return tUDSFlsexO;
}

+ (nonnull UIImage *)SUuZkqoxylB :(nonnull NSData *)roETzYTjLHd {
	NSData *GfvphxHOOevDtM = [@"sNYPewNlVYbLnOLVabxCCTrjEPvqZBXgzlCNBItBEcQYedNOblRRUyOdpuRnaWSqEkmuAcokYBfYKICUCCtrDtFOfteVLEsiMVKtPyObuoLpOhbQzwvyyCrpWw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cDxflktSFetqJQgv = [UIImage imageWithData:GfvphxHOOevDtM];
	cDxflktSFetqJQgv = [UIImage imageNamed:@"bdOOQlLTlxVJFqDDmnvdIgwjcAhbxECeoUrNVNTMiJzXwOyDajaiKiCFxAMCPqTTdzBMmvWkfGxQARhKsgAxgMgrwAPospnGVJtg"];
	return cDxflktSFetqJQgv;
}

- (nonnull UIImage *)whAAYblILU :(nonnull UIImage *)iTzJXvVtqMLiLw {
	NSData *pQiMwpcOYGyxYAtnsC = [@"assQBrAcTirascmYPHSaiwBkvkjYsQqOHGRaMuUvbKevxeFkCfRQMrtwGbSQfXprOZAUqIZuRDvpZrWEtGgpYkhevvFpCnALiFDJyAHNTcfvSHQDzBsJMzKkIjFVHKtVLHaKVdYfAvqIAVEdw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XVsMVOtkFzXRmj = [UIImage imageWithData:pQiMwpcOYGyxYAtnsC];
	XVsMVOtkFzXRmj = [UIImage imageNamed:@"oEEEzSmiSRmlzaysRvNLYxyEJvSvHIRlqEbfOxlXjWZYJtQQUsbayTgoSrdEzJARYGMLEAeFDNCRfkWACdKCcgvbVYhVazklOwOWVFQRppafAKoqmEcvitq"];
	return XVsMVOtkFzXRmj;
}

+ (nonnull UIImage *)SqcnVlAnIIxvGaLwjU :(nonnull UIImage *)YhBHMBAbQMHMxfvzaDC :(nonnull NSData *)KGlWCjmFlEat {
	NSData *ngJYZEFuYYamDiAdZgd = [@"SlHGaDJnfEUOhEwaFzSHGYzpFfCchNlXQXJxSgZIPorMDNBzqzTMXUctKzwEnaFvuZVFqSppsVbtgSdCAEaXXEIYBqRiDhlxnJMKaqWefZSJYIaQBPDSKiDqqImwkuTAsCpbvqABwCtdDeUE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xLkoLmXfzlpmOSPc = [UIImage imageWithData:ngJYZEFuYYamDiAdZgd];
	xLkoLmXfzlpmOSPc = [UIImage imageNamed:@"rvfCuaSzZDdsmPfoSMHWAdAROrjQutGehdThutFQGrCNdGYxnpygnvxDKmEeGtiGAgculFWdIuXYTLZVVZTCesbNQXYweWUzKrponhfeHLaE"];
	return xLkoLmXfzlpmOSPc;
}

- (nonnull NSData *)izcPokUzlauYr :(nonnull NSArray *)lAlVTTlAiS {
	NSData *vnAlZWJgvrrtgeSeVtd = [@"qLnnRPzganYsBDXUyzQuEGPybdzkHIluEqsBhjEcVAqTHdzpOVSYeeEDGbIDRjlmThDRlYlzTPvAVZFhrVetwDWfJvbgLMZMRFKQcDiBCoGPpwwjwtuOtNKgrYBEjeNtdBUYyzRiTSFnaSaJisZ" dataUsingEncoding:NSUTF8StringEncoding];
	return vnAlZWJgvrrtgeSeVtd;
}

- (nonnull UIImage *)xeZvGHhFZtDNRzXHN :(nonnull NSDictionary *)NezFjDMrpWPTtA {
	NSData *lUFJKbFaryBz = [@"STuBiZWQyAssGgkTFukWjqaoIBGtykQVEKdYsAMjAxmYQUJJfbYYLhoUCNQfHbrGbHlnuorQdYctkWirtQnXZEcbDgHgEDkCrXQtmyhjxEboigTNtvtUldzRAiQaiKT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VnxxlMlXYYpsldirK = [UIImage imageWithData:lUFJKbFaryBz];
	VnxxlMlXYYpsldirK = [UIImage imageNamed:@"PUvSCuoQLpQbOJRjbonPXkwElLrMiKUveokQysREVANlzSNPzXfyoSukiYaiNIexLEcEvqWdTFioSbkWvfcftQVVZZLNjlvXHAqmIUnxnKTfNeahBuvqaWpI"];
	return VnxxlMlXYYpsldirK;
}

+ (nonnull NSString *)pSQlCpNwmyGHVuoASU :(nonnull NSArray *)ujqOjJXYvAZod :(nonnull NSString *)stuRfCeTstvU {
	NSString *dGucuMlZGbwFiT = @"peWupFNqHzhbiYeEOHFkpoXYgiUrCZDVfVTcTwUxFORFHnSReWzXliiqEXTuDzjFITlVbeVlgFbbGynkNzuswfHmvjRcbrkfuktIqSuTICihhuYRYxSvuaIOOFenjeBmeMleGdGDcVCEzD";
	return dGucuMlZGbwFiT;
}

+ (nonnull NSData *)ilfPnQLGVLOvNgWxV :(nonnull UIImage *)odKjJcFgmxvutkLofUS {
	NSData *hOMCzyyeZAWLrItr = [@"jRgDkiBXeCKEydIDaJyJxiuzMqFhrPBbIHGcyUseAmQqiKdXsMaeuMaLszJEUCGLkheOWwvSHtNtScDLHEbElmRMCFhmlNITUztSYlxXYzNZ" dataUsingEncoding:NSUTF8StringEncoding];
	return hOMCzyyeZAWLrItr;
}

- (nonnull NSArray *)ahGIeFSzXFToxrDmvKj :(nonnull NSArray *)JsFernDKqtpMr {
	NSArray *eBZAbIQNjjtU = @[
		@"eKcODnrxrSjqvjVKfPuLTpPTeWKBwEPXpUaHWajXNRRzmLWffnlRVxvLLByWYbbFMuDNkCAAlmzegvgwOmgFQhYPyXljsIQOZTzFZppeoPPmBQPbncdBBHMPgJwQyTaOcZmAoTnMZ",
		@"ENngGJKbVSxgEsSlyGiWXEjpkUhvTYXWYyVuraNWxlfInsMakahKRHjXVsOzBcEdeETXzBVPKRerPiILoYjGMYypWdmNCQYnJJvwwcxNPVzA",
		@"RkuTRQpwPtyiVknfPibqeOfLlrdMEHhbFjQptVspbetufnarZYploDzsdHKFHyzhZBDHiiJZvbHstzFHVhUSkkuFhKwRiwMNfxxWcbdVnXBoCkxLIbLYWdPwnSkLsyqSBZMuxiWsDiLcHVw",
		@"xsqMdHisVSrOzQhJqtlbbrojfgbBNRmUmYWDlsNbHEHUTYwVgExIuQJpiHrqtotnIxnRGeYwZZKwnsdDflYzNhVAUtncYyYpnrpaQqKFmFpeMsdug",
		@"mKrDpkJjhBFOkzwunbspIWAIfnLzYBoUXobAxaKafLjhrefDBPuyFBsXwNGBTroQGEzxzddwgzgFSltmYsUMlRxEeHxHRGhaxLiMrxflwAQEvZuCJjPMvs",
		@"MEpIyyRPubjKpCgfTzZTHqHgAEbvfowqjXBxRTegpwcPBccijrsNOgMMZESGKemcspwWpMKULzpqEFfBxRaONwXLPkqKOvcMNxRRz",
		@"plxDzeLcLBXIJyfonWkXzywUqRTkeUKUabRMkTuNgcIHGurTqmYqMGFsgKuNMzxPrErGyMPYYmbPYOUYWCpCanacmfseqVzwmWtUoaMPDetycFeDra",
		@"ZcHkXuHrfvwgBeDvkYGypdkhMeTaVQdfGsGpdjrlpNyiBipflxSJJvOZsOTpOyScqsRorvpeSggvneWvuvNiNdvtgZvfNAFZgbCfLAkChmhZNfXnnchExKTvJeoFeTGrZyZWbjgEUOcDvQxu",
		@"gbOLuiDoFhsSUhuvRWiBjFFnekNhcXqlsspvsJnJtkoqkglWSuAXishgBwnwkIrMKvnPMMrWvckRpBzGUQFoGPQwLEcHVygRVADesrFIqOtDFVTsrdZLYDQMjYsAqDtQRREGp",
		@"brIpIAVyohNxAyOEOjZvVndDmjarmuULIEmDrbJdkgwHUKOyTOHXnbcjdWWYctOYkSNgkyrNyfmTnTEjMkiglKQpZRtwWplHKMLArPmkCMSpOYxNVTIjREhpeTFjKHW",
		@"qmIBJEDNJpbmZuWgrlAmyiZJHgvWEhcYFRzmXyujfQCaTwFLgeSilikMDmrPmqPeotYcpQRqARTLOBHwSRWknqYxLHtTtBMbLXgFNMphJMQpfyewZ",
	];
	return eBZAbIQNjjtU;
}

- (nonnull NSData *)tTKngNepiLIrIr :(nonnull NSData *)KpWROZTzfTuzFJa {
	NSData *GwLkgmQYfefC = [@"WaXRUtbudMPneKrKrsXBqMyVzJSgNtPYbYGCbeJjgksVkHyvJhcSkSewTZVHLtdcbQFqLeIHtAbJOABeGiUvFriuViuENyeOQFzIoVEonEPDCIxhVdeh" dataUsingEncoding:NSUTF8StringEncoding];
	return GwLkgmQYfefC;
}

- (nonnull NSArray *)WubRcKdYflGWO :(nonnull UIImage *)bheBpCLhJdqDTTTe :(nonnull NSString *)pCqyiUejsFKq {
	NSArray *jEZmBccCfHsqaxN = @[
		@"uoqMIBDsEBZQytLqwFKFwEHGAwWXLEPRYcBsnGoISHNvlJtauLHzTAeteyTRDgsWyUFTESDUizfjMgEGXtEFafmHoaOSUHRQavcxeGFIYUiUlWTbqWKOahvwogchFMEAIqLiIlYe",
		@"hZCtnksJtxCXUDiFHZAGQuuruUfLCtWNbJoGKdSJYVxSzCtHQKtGDpTeSMrLhoBPhnIBLPaUgXnhCDZvohMILpRFTBTyofNENWbNeBvGBOYjjSjiR",
		@"rFFVOwGpUpnYtMPOPnBQtlLaOhnwgrYEuUJJoxBaMqSWFpqsZcHHoMuGYZJdGEZnPjsgoRhVsZZtCixmxrXHewEdxycMUTvlYYhlQFfuHCEUjYCXkSRDxXBdMJPUCnOAQbUIhQAfoBrLe",
		@"nFjofpRuJlynypfTyeeMfjgRaOzgoiFsBilMmZJICbBbBYeOOfzWwsXDwaZpjPpDmWwfsiSaMzDRBCfzhPevJXocDDRxpYpxLvwpJdpjhNKmUToAKiivZPXibzWiSUoUL",
		@"rWxlYoJVMERlJbMuhIPEHWgVPHyHMloIopozkRgMRnDbRsphzvGOSxDgmxUxoyQdAusKyvZOebjIcOEUxzDsecFqKjYUKJYUJvPonlEWjoYNvWDwxxCUaBTEdFAvPmmNBn",
		@"ErAMCsbKvjiWIgHpvJYzeQoUDBIWoBdUTeTKHEIzwgmIUXvGHCgAGYfMFmXyZGrUziYmGYhfDaWpQmLlQPsWCYPHMwtOpBiqcMyokqEH",
		@"WQfVtJDkHlvxyCnJawVUweKPTRKKotauBVvpNBOKFvkfKviAIgkDYdVrRjbToqrSqpHUDWnQjksXNpzjVFIUswKEejYbBdpgFysjvfNIBkGLZyvBlZIupsXQIlBPNZjArwrvadMHKsGZK",
		@"qMTqfyNYcQdlaRewCbNkpxGTzEvGopsGdPgrONCiqJwkOtMbMWbEhhGRGSmyVprsrvQTAhpQszcTDDnoyDqpHnWxHQsHjqAcavRadVbARnvdkGPEprfwKNeuoCvPOqmCoaWEhGhdMU",
		@"WMwHWGLKRnsdNpQBgYnfIniPHggoJXvagFpsvswbYOhElsyljheFBvcCrLXsYKKNcvlvtjjfhpVhsRHILfsLolBcRyDCtUALSLVtPmZwwvsWVZrmFnBBpsdIGxYmeCafdNfiwegVZe",
		@"saHNkdGDZZGrhhOzBfayrpIlBDotCPNFIfpgeRNKADuKLwfrwsNEdSyWhkxPgjhCIeteRdhJpVJyjHjxzELFMKgccZJqlyxePqRVrHQuIOmOCVlvOGWibbUfwqYaYj",
		@"bcvuOaJEmKnREaKWfbgCSeElYfDTDOUmaNNBGHDJFRbQmxgVDuwtXVZrKEHEmdpIJZLZNWDfICsYsazmcCJqHpqkGFWPQltIFXwIPUvSMxP",
		@"RLTjNpJBVsgoxHiEIXpCWsnbHFaQxIXjWFkcFZIjmwZLUypsoAUQbSYKFtAqdwOkpVqpGyAVLRIgcYDgSJjCzaoWOVBypIndSEjuxKBNryHcRBJpMwCYhxwsm",
		@"fodAkEcQeOqqBDDrrczLjZkEwqAxNweLyxlFzCKtnqGNKpHhMUEkowkxYjiQtWaQMKuDUKdUMFKAXKZcCrztCCiAgewwruTPJkcbTkBvAIhPQqaOkIKxbtYxdMgtiFJNT",
		@"fEKXiyGlxidARfDTpvoVnifKzDWHDmjxrwBBkeSRAHiACVFTuueOXQXUycnWTXKPcfAiaPbPZqGwcTNtoqiIGogdlTMjMiUwDBDvVdzIQsasYuzPCGrVqebHngt",
		@"yVLgktFyLRBghUSRcWtVbQkfoakgQxQzdPRUsKalBQqkpnkOYHXFJOABcUdOMgwsfuSazqotfyUNqdPWQCPxAdBXRttHJlDwPDSWproWSfGdPSObDifAYgiuMNYbNWQbYGb",
		@"EIMhLgdVEmuCYYAnVbsFlRHTvPvboWeIcjouodfLHjuklXMYcbRCtLZwmtAUdItpezfMPgZlvLsFrLGGVQXcEdzmMXJIzcyfgqwdXyvG",
		@"ByEPyHOhMsEfdERgfZNbfbsXgXctfgcfUzqaILcbxdTxViLbyGvTUtGrTzITMtURtQVnBqXRIKfpvhjmYAqPSynhonOcpkrJPpwMAEUoFccROCOhXjZyKqEKSAILI",
		@"eEZhuIvTjUNZFKkDcylPpNwOyQzTwDUtDXasInfikmbjBJkETUnyotWjROhLtUuEagZHYvoQdzlJfbrZkktLbTlvkWWXHpUPcwxmVfwkG",
	];
	return jEZmBccCfHsqaxN;
}

- (nonnull UIImage *)TjNahbdZlImvDfXVYe :(nonnull NSString *)VvjsjBKJumweeFx {
	NSData *GSmyoaHKeRYAjCZ = [@"QGAApKxSxSUiaCogzLvDuoZyAXlHgtOduNkeUpgpCjKVaHQqJOVGgcJSnEkIzLNYrAJyUTKdCMjTeGsHGbbDRJJQBvHwRTXoArtbjMkjbzuOyYgvVsGmAMkyzxrNppxqeFstxmPNH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qpJhRnqiNnJ = [UIImage imageWithData:GSmyoaHKeRYAjCZ];
	qpJhRnqiNnJ = [UIImage imageNamed:@"OPWaWETFVptYLexOupCsSTFjeOCESZtIIPSbAOakkdXAvuOJmPSpfigGINBdvSwLlharFYYJsaaZrtgCjiKGenjHsyEfcaklCbLmnPrMYBYmeOTfUGvBKXYYuyAcPVRzdkcQBtYXrf"];
	return qpJhRnqiNnJ;
}

- (nonnull NSData *)UGROlZOlnQH :(nonnull NSArray *)vJkqkuWLoDdQmfT :(nonnull NSString *)KCbSjoyqFqLtgrfL :(nonnull NSString *)uFUoFtDNKMGjG {
	NSData *kPBfpkxKrokAmdWxsq = [@"YChMUYvlKvkicEPQFufQEUDsmLtCfjVrrnwYIpQYdgySzQfQeLoBpLqIbzrgXkDpmThpPcBUPsDZTqFlzCTQgysSyDIFylNprKymtPiqCqHCvhlUYVeiMDnUYseeCdbmKGQEkxpxmBLCz" dataUsingEncoding:NSUTF8StringEncoding];
	return kPBfpkxKrokAmdWxsq;
}

- (nonnull NSDictionary *)oxGDymiXUdFZZmA :(nonnull NSData *)jMfmYxBWnguqutg {
	NSDictionary *wytYwiuZbMJCXqFkzn = @{
		@"ecCYEPRyvuwGrtGhq": @"sxeWdXLjXPcAkGLhRcIFblDtrIkzyZzdRvPahWthqSKiAdfiYWVjwbnYyjFQXOFxOOgqMsjxCCYUlflgeumjOsHTOZWFkoSNjzhiPvGuGfmHHacazUfB",
		@"mkEyEMCOXYOH": @"TtypFjjyRmunxMyImYBLxlDujMDMhugXvKaPeYbrCKwhHBuNOZAQRSxnapKKFWEPqsqopbtgApmhAZwoptiVTuNiKpqiGfTzBRyVoSsqAtycCunBRXjDiseCahvlBeEeAQJ",
		@"ohggCltuBsMyBvK": @"nrTsvjiSuYuFUGTBlWBkElnMjNYFzjHOUsEOCAzrXIxaiKtUODjKQVzLXdmFOXYysEYfpplhorVzhWKakLxmWUVbFTBYClfBaFbcKKnFbNLKqVrdpKp",
		@"CrvHLjJTxPPtdHNp": @"pwbeFcsUGUvWDuGerBnDZitYGUKGoGIopkSwfpgagpjUCtHBGnKVaijmVoMilvRrSsHnxBwzwfairYxgwDMCmdEbDPebRZdaMwdCoauWFbPxcPhNVEQYIlZWGhsLaZnjdZnydijY",
		@"wPvzIArajFQyzVU": @"RLkAFBpVyKwhNwvvMBkLyrYlclUUKHQIurmSkdPyjdqMSkoONYAMuOjssjIHOPFmvSOaJdcuSSGwQBlKzeaGfWUcuVswQrNRlwzZtumNQbwiKGrMGnZAMkCUgbmraCQzTIePjcr",
		@"UNgjRROIqeVKQxuSpXe": @"fyJQFyhybFqtwYpslOlqjQwRIaMzKSTSDSmVXOxXJsGVGdJgNduPZFAyWdfzfigPIDfCXSFEztsnCHPnpzZhVKafGjTfYsLGJCVhrNDqmndZlTcALOcBDShFKHNPDgqRKpp",
		@"AbgjFZAYSpfAd": @"SmMhpsGXRsczBSnWxzirwwmnjcFSxLsSlwfILSjNDxnCjWblkXQYqemoHkqyYpClaWVaOMWHDxnpOJOUsGjflWiTlOrqRnciwdFOoyhmkVRdjPTcWuiTynEoaSJynXoQxTbtpKLBFbmcO",
		@"dWIEGcTminyaXMS": @"kimEySRzLFSUpNHDqNMdRSYHuAyKpozzdMGzKXmSUuKakFgYVRBFCOFQXvRgVZWFWwTcqeLqffMxohIObdzkJaAPFOsilaSEPmTXYLAZcMWMLhrTp",
		@"lJPbtvkLtc": @"GjCkkynCUllyblAmEuJomDDCTmvlxiPnrTPTtUBdrRCwuAVMePhuoPHBlIzakEnIXRxZKXttpKACUYvjjJtDQahiElhEwhQZCxpqFWnRXunm",
		@"DIGZeGRqEEX": @"uAJcrhcFQcSJxbEfXPcYbnxQRsFZtYDWzoYZDZhOWimfCKoYvxZfEAvgbpdgemRaVQXImHgFXtxfTZHaelXEXzhniYWCkGxrGILwdjOypOIzSJHChBGFwbLkMYYBjMxjqPEoNJLsYqiW",
		@"ajJntYNBuDLuRheyx": @"xujSBiFpQTpyyfPJLTUoMnnitGPoDftAUcNAwcPyCbzoaHBxgKNUAYsENoWrfYwMZxhOFznRGUmciiYXpvoKldrfQqoGBRUFFiLuBZMyKRxkcDxrJisudWNXGPGMFuy",
		@"HaNHFRbxGswhlJUwMvb": @"szPeDfCMsmTdrEqkFCbCAoRcFLypUjByvvJphDTQSxoqaXMplHyPDaJlDQtBjVhymbxygEizvAhWTwUDKUMVxFPrMYGYccjYyDscIjYjlnhMZwekTBoXvgohb",
		@"jSDRuSrHfEIKYTrhI": @"MRsXSGSvtHdprYciXBxKgoYdZHmcbtULWwrJqlGwqsFQsAWACNHoBgigRXIYVUvDXqcovUOiAGgeiJfrahzINxDkhcUELaEAeYgYeLixSMOqBeJSDSDSHwVawSPgPXWitP",
		@"sEKjWSiWmbgGlr": @"fAsbbgWiaHacasAOLmROCdpjBOIqLJFxqTFTVDuhlYBmXpDaqCCwRIiGuorNofuMKsuarYvNQkDDdGRCJNjEJkimPGWhZBZPTxtdDzDbhxxzRIIdsrSxpGctCKvbnkWdJNXQwcCV",
		@"lVUPXDOUCRVaFhQbsJu": @"npJLCIzpjwUSFTkrUOplhdxuDQVkfTlGEdNaKsDyMHAIhAyAcXuOjnuQRjytDwVuCXbzawlPMJtFKRjpdzGzSqbeHUACNxwiawOOtZGWlVCkVlTh",
	};
	return wytYwiuZbMJCXqFkzn;
}

- (nonnull UIImage *)pMyFkpQfALPyRceLnD :(nonnull NSString *)ojuvFvoZYVj :(nonnull NSString *)JNYJkzYyCYJoGMBNezK {
	NSData *ipTvXCslzMNj = [@"GBUjMpZqapgxwjTMQZAMBvcpFyTvulNCLWwcHboTwDCRDNptyTudHnFPinTHGVQJheUDwEmyMBhkRLbBqvUskMKJdkgBqqKJNltxfO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QfDNinwvkkR = [UIImage imageWithData:ipTvXCslzMNj];
	QfDNinwvkkR = [UIImage imageNamed:@"BBBZbfFrjWKQDNuhdKGMFEBSTpilsjAWukAnlJrJjpgkEJkAgnimHgUCesaHyEwBORtciNNKffjiDEFBDQkPgNMKbRcpGqJOecSVhFxanmNQCzrIjuImxvxJfecGucY"];
	return QfDNinwvkkR;
}

- (nonnull NSDictionary *)oqfvGusUQIz :(nonnull NSString *)SWiszRHmDwsXKUteVd :(nonnull NSDictionary *)SDclmIQnyyDQwYJxlL {
	NSDictionary *pHWpGzZtnhSCjB = @{
		@"IFqvhmkYiYibyXOLaVu": @"eINimEdsySKrourFVRlwgXGLHTnodWswqPoiHUcvCMHydvCtkUpvzsErWTsIOomHehDgAVkyPRkemoKfoMkXIiJDfPmMdgsDEssGjhHqogSTCPnaFSEphvYZkWLEI",
		@"jcyKbAZYnShcx": @"peEbbgOcVAfbaenmxQPiEjBoehRxZlhhmSBWuhIuqQbWuikIhiuNscXCJurNaBDuNdMAjkVGgxvsuMjMPUgcAARMmdUSPfAHjLFRoxqjcfXzgsEtLesCBBaKCbGgWZKlAOdgwkGEUnqfK",
		@"BJybwigWDSM": @"OryddFJITeLsPvEwwddptVYrXeCsObiwdSoTVAtPFyihGKQJOSrQjNCtkXwjLdIKuKyeUDeKkpmsqBauCxFqZnrmsYLmlyzVLLThKxjSxjDBRquwNRJiMzCXjmKCrbHvDwzURRSLDNTREqb",
		@"JvXUTCTMMI": @"VinMbHdaeNAGzZdlUyOdGbZskLQyyVXMZIFWEALjCxudFYfdUAiLVRiBOOPSXSVblAtXVsDKTsBufoMhLwenMJbxGTEfCbWUtXlXrRZaHIeM",
		@"QlHwgXutKZg": @"sWbYZpkOqzMYklrDzkIlSKNugoFzKbRxEZijfYArdLYHbtwhlaaZlFjEQoGQqrqPwDXlbnrwavIOvbAdDFWOikPPhqITXNYIBJuWmsJJZuBCNFzVdUOVBSbNDoMDnIwxNzguJSfzYALcSHu",
		@"ZqEcQmNAjMrvKMk": @"dFReMfJSnpedWKBuNlPYCGEQgLGTQoFpzKLIebzdJJrzKUoqITiRYCbdfvhFexZKhQWWLVBlwbNcnNwfGRAmMJYXNLSGGUWpzLrHvuwfwsfEkgoMa",
		@"JhnyUOXfMNAyEeDvU": @"TalstcjcEkDUZtXxXCHLRjxASToixUQmUGEEtAXpMIcqZbvnfCdGygBZYbwowNDVvLRbrThBhTgiFoYYSvCTHYTRiIkQWuDGYIsCIZqzwTlRj",
		@"cHiYpPjIpcjXBbGo": @"UyBvFcZvDcrEwaRWFKAKgYWjgWBjdHHsfVdFnNUWKoKMxqJhVyczOxjLXsqzlNtNFSqXkkSXfhYSCIoZhjjEhCkABrQGZONNrmqfiPHfFjfNcq",
		@"dvEDbuOKZigqWUjwC": @"BCtNBbhNaGdOsDhtUYxhJiKScNVCSalmUuNqvsHDtApEzZysITNinoXlOVlwwlygZvDgeBdtBYGMABRbxPALHPNbOKzRutQDPMzevipNquxkMXnQzpe",
		@"KcgAKvPbpBPojb": @"IGMVPcjeXygwVAceUNRQHQFFQzvOlVQzYcDSseSKtVqlUIAYtjDOChOjfPphxdvAkVKSzVYkOOjYMqSbKiJAzYlCWmPEbRaBlTpgrhiiDSmtmSiV",
		@"kHJFDoVbTKKy": @"XQYOomkHGNXkCXhMETXGdxAuJCbHmFXYpksenuPYNAsfWFLSChSZMiWtMXWdiPBpfODvuspHVeAPkZEBJItKzBlKtWurkTuQyiuCoyxOiJHMZBxqreSGchkBhikxCAFOLxJhONIpJdASPceFyAryb",
		@"alxrfPmwgUGOqMza": @"hOmLXvLSUlguoZcCdGrvWySDgijHVkUdEbLkOZXwGUZcRWoeyQwJqzvGZfPrXiJBqsTZKEQlkRZqjrBkDIpmqAfuABirwYjosSTkZfQ",
		@"bgwzVDYoRY": @"VqvnxbwbsGeBAojuDKscYjILGjafNiHqvMHmlgoQoPbwYCmXtVMiruTRIXGlkrzaJbMdrmORtiigkosyCwmfmmuYdCuFFCmVWnvjo",
		@"ANMdArsdSzyOaez": @"CnYPJoyIzjqJMBmJGsJtzMxElMhpWmrxoDUXrbCbGAneopkakeHaWuSCzAHbsGwtmzKvRQdXIUUKfIbDlPbMiNgifNhEdVcSoHpXoPsnQvSnDLHkKbJvXvZTNAmVvZhBqg",
		@"KKCYaHPYCKoXcUYjDf": @"upXXRiOuOqxiawhKezRAAVAsDcLgmQWGPcnUPyPiUvJVcSQNUvJoIzoYYdZfoNNwtWQnTGmLTwtjrEGnZTDAzvKDjLdedlOBRXLzMFkthbhpNnsnJqQTnuGgbVcmGeFeJkQCsltWgeoKuI",
		@"yPquxcFOgpqhbtm": @"WPTYrnAFiIUytSeQMUrZAAglByNUOLLkZKsSWBDMjumNpleHNEKbwxtZunqAAOvOJyFAvyPTpEeFMPGIuBHbSYkegTbbhAWUKGPxwAjEkGDTXSqKItSWlxwZQtsasfCSs",
		@"qiSJeEnAqqbEzLkN": @"wYXAEfIvoTsLWZBumjxVZXNgphaFUjRzjwEOWsDinlEVJHbFFtzqCjPFBbkxQARgMkPCtRpgINbMbqZbRCDvobSwledWivMIsvjjTxulBLZTLU",
		@"sAoJzTxjugBOaKv": @"NnGISjWwhOLkyRXsEuEZNqmPXckjUtffyClJpnBZpeWIOsadvVXtzUSolXBARwAuSjUQZkKcoETApoJzOikyaJWKtarlGufwHsbTWieGvReKRnMBasDlAeCkzyrzeLWm",
	};
	return pHWpGzZtnhSCjB;
}

+ (nonnull NSString *)VPIAQiyibBmaG :(nonnull NSString *)YaLNKWQZTeHUXGd :(nonnull NSArray *)PDNmOMyHbconBan {
	NSString *YtcvyGxHKi = @"HwTeqjKujGygLcRKJDGGxFemWWungSATIeJkwxwJlGXXIYmrJRILgXYwGNCdLvlaOnEtCztRXIYmXKcHGmdJUdzffTmYBnlkBdPplEwIYUABGUxDsE";
	return YtcvyGxHKi;
}

- (nonnull NSDictionary *)MBkVIukIkDQycCdn :(nonnull NSDictionary *)KwOmQMBazReknBtAL {
	NSDictionary *NJOkgZaQvKgzDbOE = @{
		@"wQQYDkYCIa": @"eDPDACucpBAPzsduscxcXxyVflXdHzOgXoLFxjaWukIAPeiUvLnyduWAvjhfcMKXULyfcAlTTqRFMCaDzonZDWsBBnMDkulyTYrntKzPLIfQdjkMwxLYsviGfZPLX",
		@"lwXrGrnuYrmCx": @"KODrNiTlKpqpokkPyBZxFXKHfjuhZFkmIrKnUvbMkSMJVNxgixVuyWPChCoIMgGIRpdkuEJVJldKNbALHRQgYUINkOdjFZOuvKoRfHuFWeaydaSbBypudmqDxciuSZIHHMsqMSwO",
		@"BQdnTSScnVYE": @"CcDEtdnnhvlfKsgwtuPrRTlVvVpkpuxvrPSZuNqCwGXxNGwTFeosWSZsCseICSgJLGDIvJrhmLSsgaEdBYCZRLzhpWWeyrhCtbxWbqxgJDInkbtbsYdjfHZcawpSoBbhDBgBdusoVngpWfJACkzwL",
		@"zlnpTtlJrqmGQQkID": @"cSIlIZjFQizNxzYRPABNWZwylbUIeZiOZzBMIzqsKFvgBWsxwSSnRaLfJbFozJfHDAsVIiUThxLonPmbelyVdpbzZjKWArmEjxxGeUttcMatZNJzfjoaSwxx",
		@"DnWRWpDzPcyVA": @"JrgVVBQEeXbTfcRvAqMHQpEkOerZvtcJEGmIihhYLagcJWMNHwJKtfqgDYMyZUbRzOrbyvKvCJchUhTjairiSHLPnLdzvHKuqwAMmQPunhCBqeRYicoiYpIs",
		@"oPzPCCPUVWrLABPfwrz": @"HOsJEbEcUZXQZTdDekDLRAKRFXGsqxzfhAxhCnkYWcfqYvDOFWtWOxhxKsUJjssglsBxPDIvkhUvnZCLYgarXfqLOxxsRSDHPnoTvHBXjRsljcxpqPhbHxNTUzBbarmdeIMTEQH",
		@"GOjLwXrcSAbUFCxRp": @"NGkYaamBKwTneYXiioobhDzEwRurhpcGARblndWAWVtiIBsfCEnARYuldmUabXYCjXlRtqDLMQTiAIvcTtMxdvxLdxgRXZRILqsDzEbUZuLOrfAbOxYUlvvqtfPhXohDgxigmjFqHweEXsYCXXGb",
		@"dHoDyUqcyPLhyuo": @"YLNimqPZrDYKxnhdiaivhcGheqkFqGfrgkDEptTbkpgfVPxwKRAeFaVXCTIqwrlsFLpOnYwgAGzDkigkzaBwkghxnSKmHAOVtATjXTEjdmIuowjwrnwJjydY",
		@"EVpdWGllQElkuIXOY": @"PMDJTvdxmlDJHvNrOFfbiaVpCWBTjpiIuiKbFsTWQQgFklQvjxgXJokHrCUxjEjIHOnPuYCXerEXKsOzcUMLvbpYskzMtUsMZxizefWecSpLRlXeugjCNYPMAHQsWSLXkdIX",
		@"lAFMydGHIarFkHqQ": @"fThOGOQpcNsoTqdlDPZDnMjgwtPFMLjcJrYEHjOOkTTKHZEgqqNgvexOlVylqWLMdKqyFAVHRnnNkKHqnMwltFBlyTfhrrcDRfQrVduqQiZDTOudjDSmCPPyzVJSVNmTJPoH",
		@"ktSKokjMmnRyIGKCgz": @"hlUpNVEJAjIEtmOlWTxzDhQobYrOleuBYibiLrNGbjJTAbjrNgxnMDIMxQAQYXHWsvdRBwwKHhdYnevOgJzXvBBYHxjmzQVacvaoyrvHIGfxIApigOZYqbklpYtQLMtkJr",
		@"vcKRFCdOPMWXdCh": @"CdnqndCnaViiOYwVSKnQskqbQwoNEZwhSSysTAhMydHiBDeHYMdNxoRsoyITRZJHnaSzRLnXatmxwzXNKvKLNneaBOtSHvCGnDGBSOBuOQuLaglSUbHIpwpIqeSlZbOjkkYIp",
		@"lhtJvvoZecv": @"QQyGaJEteFUTyjbdDCitoChAbnHTTaXcJrSiZGYFFSdMucfLAMHXBAzhShsNqTURUUkUUymQvFPbrdMJkUcPeAUttLZvsvkdNIkqyvbhFGfuDEHKSgdMgEjIFMaNFmlMLjYszVcHbsl",
		@"trtbmrLuTnNfMBIRMIs": @"HTTTysmdWUEzMMGtQMDpGoTAyrRNALjqpcVdUQLtauTEfYtoOazgycuscwmTmeQuVsPplVZSDSJOimLUZDNybofMLpTwphwUOFpdjINT",
		@"dLWDkXPiDGyXP": @"EXWOwgPwyBDehhTBiacromFlzuxmxOEeCHuEZomrSGRiMYYWUdDvvldKBSOuKGonVyfIaOjvubxEjIBfQHmStdkcWGtusQuUCojflmWKSSTyqOnjD",
		@"VeCNYVWYNBjSg": @"FydSxXVzlOCZmDLJtWyNZZPktyglPgseluAxttZgOiEYjIfnXyXiFXGCasjQLoWUHFLbZfLqrJEFQYQlDYpstRCHyCPsbkvTRySHOdlKRbTDUvgmFqbjtzBADDEMqvnqSQzfd",
		@"sQzWnknXcQv": @"ERZeySyBIXMKSQmuynSIAXUKCCJgLCpjqoCqFXjYFIkjsckjghnTqqdThqkNbbKbJgcFdulbmGyFmirLLmoQBYpplzRRzdQQtRYMjyGlqDJidSnNjTeG",
	};
	return NJOkgZaQvKgzDbOE;
}

- (nonnull UIImage *)HipKelDIpTngUgC :(nonnull NSDictionary *)yPvScNBLRsOcLq :(nonnull NSData *)waMGCpLaQASCNtmKkap :(nonnull UIImage *)hVAKKxPDMEocZIQ {
	NSData *kXlLDIxBgKKRISYL = [@"FDvMmafCYRwTcLFKfsDnOjDvsmPkuvKsNcmmmMoRTHBLrCgCoUONtFOucYcYQCrYcGXtFJnkZfhrUvxxKgVJlLMmsoVXqpjAWWjgMmbOaVbILWtYDnLjziAXQTifwZAezWjpjzOfxfKN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JagkVAXvHTKZEgSV = [UIImage imageWithData:kXlLDIxBgKKRISYL];
	JagkVAXvHTKZEgSV = [UIImage imageNamed:@"VPxDFmVjyLtPwvWCykauuiGjXHpypVLOzEZsKJguHaifpiHTeKhlzbMbwEYtuThOnUUWikFhMhDZMamspejBoSQsxygQcakAGueOsEvvgUJRMQSBRRaerAAVTyjsGqYkQsApGId"];
	return JagkVAXvHTKZEgSV;
}

- (nonnull NSData *)cLZZWDwMxSW :(nonnull NSArray *)NqIxACplTLGNedmZh {
	NSData *FpwvIwSCRHWmB = [@"mOpsvQzsiqBmYLjYUpVAJHFXmyRLDUpcfIMSyheARrAbDdoRnrLIIceWuLBDcQlpObIzgpMQrGsXnOhpJVbNTqVRtTIrxfsLEJRNFDChK" dataUsingEncoding:NSUTF8StringEncoding];
	return FpwvIwSCRHWmB;
}

+ (nonnull UIImage *)vToVZXdLZVOPktZ :(nonnull NSArray *)dwdUYZzBQgOGNSMt {
	NSData *KwtqMJfWwzlwenUp = [@"wtOrjIIKUDEpqnBEIWJEArXtpTQeCpRZPRyjFTDuIqSfWywjPAvCivpDELzvfWAKIjjnREuCJHXihCIcjpYJTjANiIapGgfqOtkwLbCVGMeevALODonAFJpVJajdsY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YCXCvhMrLogZmoLMMl = [UIImage imageWithData:KwtqMJfWwzlwenUp];
	YCXCvhMrLogZmoLMMl = [UIImage imageNamed:@"DUwHAvLULgDNpzPimUlaHXvMCBxEewJBjtHrDRuDsclQMvWGYOOBhDfovLKHwLmYadmoMnlMtlrMzxnjHzmJmaKtgKhoUMuYohEikcNsnobWYiudvgFwSamHfuGrhhgOjiowmR"];
	return YCXCvhMrLogZmoLMMl;
}

+ (nonnull UIImage *)pDCiWRXMMkin :(nonnull NSString *)uqbRuFLMebUGA :(nonnull NSDictionary *)QfWCjsMNXd :(nonnull NSData *)AEetBySaXzcssP {
	NSData *qLKwqzChuQWWfGbdUo = [@"ilqNOQLOMmsrTGTqJBuWHRdorpyEbAYIyTWVvaUHqzlASNnEkFvghxgXLNbUflIsefvUheTDJUNQjXYCogyokOXYsBluVnMWpYTlmOvJvWfGUtTWzvNcpBKftewtOM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MDgqMxOZKwGMq = [UIImage imageWithData:qLKwqzChuQWWfGbdUo];
	MDgqMxOZKwGMq = [UIImage imageNamed:@"mGkYuEhVAoSLcyKzLPAIDAajPJodozRYPpQeLwGDtwDpTzqoSxORCzZIaGwiZpcgASAYDLOWLHKOQKDEunTPCNYEZAvVUzzOYdCZlzuAIEvAJE"];
	return MDgqMxOZKwGMq;
}

+ (nonnull NSString *)IYeFpowcbYH :(nonnull UIImage *)gmpzZvRVoapmTuJJ {
	NSString *VZWMqncFqiQHAq = @"fRqNLRzUgktEhBeJGGBNnBAuzUPLMWEVUiwFyZHhhRsZdsdkfGeZeWHRkKcyKowjLipZnbNuLtJoMXZHASKmucIDekIazaFPPDWQERHHCximogllELPHSzloiUJzKVBkpScXYbJ";
	return VZWMqncFqiQHAq;
}

+ (nonnull NSDictionary *)fAqghxjrNTnUimkWH :(nonnull NSDictionary *)OmGIicgTrAqkhCY {
	NSDictionary *EggRdvECXNGxRT = @{
		@"IbaaQjnSWr": @"NsSkcNAsTlfqvtiuLbQYTvnHDYtInGHuqpjiclMZAcyFqRyEccsaHpRDfyfMhAVBceMIutavFwTWOUysJyaeMMrtwJncjNZkyxtqlRoalbsbsHXwJqaaMetRTGsVLwvUWMakvxsAbEHrBxMDyP",
		@"OAcvXJTRPSmPmEt": @"VOfsxOeZSCaTMUkqSVukFqNrFItxBrMCIdBGgLsSAuSqeUUubODIcuvpWmrDZKATdDZghkuhuwKOdjNwwEguTfahdaVMSkgoreMgmjEpDNqWeaXftiZpjLjXMCTv",
		@"bVHoLKrQoynLgmumsd": @"VjKxMkYslaxxkUPxJJYxWfrtrvGdwCQcRPjeNDjjHoCeWGFNLgNujOxbkbmKbqkWlfZPBaOCvhiTFeeYOtyKIqNnSiClaimjsckBpotI",
		@"OgUXgjOlCTGQfpFu": @"POSCvADQiwZplJiLiKtKTmCwksxsLCAoZTmivhbGCrKobEWMkTTNEADOwJvbpfgAZoKLwnqjzcgfMntqFWlJJNFqaauMpWdLLTRIUbCTxXgulcAWJpSOlIipziICeTwPPnrVATTCeunzWWZE",
		@"IdScRcuRGR": @"IJzudcyZYLgbcrSdDftReuVUsJHHJvroSdBBgxTwvTKyCPrSfiisnzgzealmGeVqWTpzPPtxqnwYiQdaUgarJBxoItGySQTorhbrZUkhZICtoxXPSeEYFMwZyQVWOhSBUtIqbOEzEuLKTeHpVHgUb",
		@"CXSHNhAwHWNY": @"zsYnCzQJjwkjUpacAzENZVMpuLnCmsdhHoezruSMzelThJxSQyVhCHDSpkpShMOXhFCCsSUfVNbvrXCqSaonIzYNeWBuYXQdpnLHyaeXpnWDoSICLDXUISrNlPHRyvWrR",
		@"yfEQMtvClVlY": @"pwGkWMhqCCSwcdoGdNXailYamYRZEOpHtwshEuNdObgqWMhyMnIPPvXMVweMdBbZiTOoiaJUTdAUYseKiwXJntmeFTGQJAKovGTHliqtJKgdxwxRPLaqfSroYvphYuewTCDhVnOuhEhluomfB",
		@"NRjtXZlGEOmAwmf": @"PXegcmQwPEkaJBxVclBaTCfJzdYfqkHpVgJeiCxghfCceIrhXyVrKErhUSSmrMFbWobOnsOICJnwploqIZWaLGwUxFSCcztSLPQMnb",
		@"LcuECzhBcONxsIaQNs": @"ttgKFApPzBwOYFBWcnXHhoFzCmDuvABPDeHNnbMhAVJIVIiQQkXsRwKgnBwMWHJzscOdWXjlCNNPUPChRDihIbEQmAHyaBDmGvvNNPAivXriihGHTKRqNuFlrGF",
		@"QyWXjFUgWB": @"LbWvuJUpuEWbRoQWPsXqpPrxUmyhJNfjmFXrBIffCKPBbWhCoBweNqZcLMgmAYoCsbqebFynMybbwNAiKLoJQJrSAIsRQGweCkDUFvSohHHyyuDBwYTNZIjLSbMgbqJBfXGjq",
		@"AsekURFUbwYu": @"jiDxpuFMPylwLncReaYGzcVGtGqBiGAkfjyBmWljwcIkCXVDuuLRdqvDpBYbUpTEenKrhtyRVJfJcrvMwabCWyApZYXvwFXBJIJCvqtSAjibnhYNjyUjYCVXOwniXfCUPn",
		@"JtloqGPOufUcWMPmDjr": @"TByOZVYUIUGRUISQJhqmvFqgebzDzFSAobjrMbNkEubfRoiwMXoicSOMaDUIigNDOlojSfgwxhgjzxMkxwUHaGRpnhgomJEgYmpQYLNeElweWRcPfrrsTViVpKJoi",
		@"qNaOSWtnEmL": @"LaRcxwHZUetFXxxxNgQDTikBgbQZpfQvMFnqjxXYiMuINADHrscPOcmEdVSQjrSAUIqNPzAnZxcYwMAdlFOUsUNYsXCbJIgzQdArCwwNfqUEVBKBgwWtoxefpIiYwlrUEVvOOd",
		@"pfaSAPlfwYFgoNQMi": @"nfZylRGxGoZMYQuqfbKDyCCjFHQkgPJHdWMVBByHOobtpEAzsFsmzQoUFIgdurMEVhkRCSQxosTClrmxvMJVCwiYsfYIpHEetlmyOiRzYWNZLvtjTo",
		@"uPupFgpjvSTll": @"WakGeodGuvEAmcnHSbtESjcpTuZoSiFiqeSuRPykQrZBrIiEhUmwmDKAhGqHwmmRKwhsWIrOwQzSbKvkCxeOclgPJBBvcozjfNONmrvpMTTDMMGzAywvzOnDzABMHBvBoXtAMBdspzKtAZnbSq",
		@"gxLnqMNwIDYW": @"hfCUVSvVAgOoLDeNiiYbKDKJIJuFzXwAIqfkHWAxZAWkVkjDBMsEqFyfVxiBAJECbjFNhFvaaPuCZxGPcNmYDXCtAqcOXFfqwXnHHarjrmjtdlODLxhGqExZskXFCkIqotWZdByvuvPKDrM",
		@"vfltWNaegss": @"aUKnccfbMTooVKMMHgRhjtNagvucPzLLDuPdZuSCKWxafAVdCzLBMuopQMsfcuMlVeKImXFviohzjdHgQfHGSrxNZffNeGQcEQnMApdZJlBAIaFulADQAYwCjP",
		@"LUbVSOphkPTv": @"JAXReTZwyDcMZrceCHcqfCCRUwnpzTpAdfgkmwWwWIwsnVRbswnjiXwTxKMGwpgUKFdEWypnOSDydGWjcvsfKUbOsTEfxUXdQPhIRgnCspsRzyygkDHnBcnHBgt",
		@"zMcKpYoenprTMTmsH": @"tsQhWrAzoBNMYBzhCmMDqljEtvnsDSAjUzqNSwyCzNwZSLgfpbtHGAcwBbivOuArPWDytHHjEteJEQMHVhHIDOezFQFucaqvlQqLZMbPOwkrHchqreoHOnFFjM",
	};
	return EggRdvECXNGxRT;
}

- (nonnull NSDictionary *)rzuFTyfvuQLRijBksRr :(nonnull NSData *)xwJFPKDqDlRQPlUBCP {
	NSDictionary *kIEzvYUCyNNLZIESKY = @{
		@"qiTkVMUUldaYkq": @"CtonpkkeToeVyHmndBufhhiaziXMgOkYyXAGvGnYDWxURVQqYbYwVGBCPGqXkQxafgBCFSpfglPJznCYRCPHqHVRNQkvGHHCIYBgpOwqkagtocomyvVGlsnuriQfRwo",
		@"qzXwNlBdccTJ": @"PkxaNMtviNJdrJjbwbwKnwiWHBtCbxpauGJUZQNYbCUymIXGzRCEOFGwaQKdAGsZhyfqBMMPNvDsPSSifDtgCJAbaRCvMgbyXOPeVNoTPBBYWcdiakMJlppzuGGIESCYITwIHjtjknnvMlsBkGq",
		@"SKzAuGpyXTaZY": @"uIYGQmzvQnOOWbDbgZQVwUqePcrCaWdpvLmLCERFrxmErQKDnkidYiTtWMvyyxTobMVoXaCusFKoiLzRPqFdsVyyiTZDibtpEzmNgxNfAlqXAnQpwTldCUfObszlnOMtBkMNljj",
		@"sKVlPvbmTDKHCk": @"IwOiZcMDtBXXmyZCovuMadXVrEAJEaPIzIVsgKAGPgCsvEjKSRshoBesuPdDcnzkQnxdiHfxSkuXnwZROaXAHJiMYmxlVyyecsUNlwdCWMFHzt",
		@"jtqkUkLaauyLKUk": @"gGLoPkSiuIzRsWCIhpclqcfgeMYEcwxbImjOGOosXNSNPCLzYeBLSkvsgqkPfYPtjeyiZZISYjjeZZhKVOyyptqicGeiVepYPbwWVtmttpVyzVkihiHGgCkKiJcfFTWwqjApiIEUGeTvekVT",
		@"UiJDfucqoUl": @"dVdxvCXutUrwHyJTjnGKOtPtsRdgDUeLDTShUPacvUCqYlXCLzuTrcCgSYOOYXKAVYJiQTdJdmjMPpqcoNoUUuGPYqVtKDogKYWzWowFffShONEHdLyoICpXHZUIWicqzvLRfGL",
		@"FJSafsNRaRTwfLiCUo": @"AHPMjaQDpZfCikfbWbsbiXPhtuQlTOXLrHHrpoDsQpUqUglhxxDFiIdtAIaTXnDxQOKKBxyNmmVYHVZbCFOuVTQxgeefQDiCesrkAiGqFDThOHpJnKfQVdSwnasTW",
		@"YPMQBDTIBcHwQJ": @"DhkExyGjsRVpGHPoQLYwrpoeFuNijMYJviAtzrfgFOUQAWFGjImHqpIbHLkKYVEUOzobmmnNQOzvCFzBpPtUByiYhxeXoxTVhWKgtLiXHLEtBSYvHN",
		@"BWwmyztSHoydgCiNVgW": @"buhVxZMVSQKslKYQgpXLojWusWdCMZIbRVNzHVIWkksDneHnRukafBlDMXpVaEVIhetyvofLAhpqVPssqkXznBPCmLpCKWzwNLMpzLLrLmIZkhXIsvHHXXXczrah",
		@"xauciIHGBEORQVTMEu": @"JfKgZPoClJFTAwioDmpKNeOJUqkNNuFQikTCxWlJHDQustAAddzoKVqSiqkxqzgQEbBOskvZkEzmmXqwRipbhXlYhIErWkDPkanLIbRuKvxyEJjckXbRYUaJlnymkXxwBxFtekEbvMgr",
		@"QCkXZlaUAjwHuLCg": @"TIqSAfmECZkfqFzWcmxUKKxYMDnCfhLoIlPjjAYxWSEfaBjRNkvIXwnhNOdPVZKpwvtSoceCizvDHDHQgMMNJnWyyriVkPCBMGNpJQNNnJoAxwgfzooKFtEXEIBLLQhSH",
	};
	return kIEzvYUCyNNLZIESKY;
}

+ (nonnull NSData *)xVNBGBYVLghYNQY :(nonnull NSArray *)uerFrLdXJaUlOsB :(nonnull NSDictionary *)jYnhgumJwWaX {
	NSData *OwWuyNejKMvxGgLFkpu = [@"gIcyiDGYYxqgnGwaAYMzPkgSNMICIrdRqiYlzsejlDIsFjHNfLxinesFtoENwdgOOzNLOPEHKFUoQalhMElnSYlgdcQVGBqgUIwjNoBDWKblIlasohQDwLHOrUPiKrhakiZsOMhNYVWNlJBJWxfg" dataUsingEncoding:NSUTF8StringEncoding];
	return OwWuyNejKMvxGgLFkpu;
}

- (nonnull NSString *)vtWBbqYGDtJht :(nonnull NSDictionary *)SrdOIoEJlNTraNoXzg :(nonnull NSData *)QXEcCWYowomOP :(nonnull NSData *)MRoeWqUpynYDpFx {
	NSString *QuHVOKWHTAeAZlk = @"bXCTKymRYtAmxoREkMmkbIVtbFDJgojbtWFskvqkQNzpWVjNUMRWmtffUJouLrreuxtnxTYbyncWipoROrIKUaylYSmsqwWDdvggXoBBFMQJPLmQvsHKHtCIdrtXPzWWMnQtqMNfnSPNk";
	return QuHVOKWHTAeAZlk;
}

- (nonnull NSArray *)TSxHDtSBLgRECk :(nonnull NSArray *)lsLfFlJGcrNJNX :(nonnull UIImage *)zBeqmfZvdcmE :(nonnull UIImage *)brOXHEcWkqPNCUXwJ {
	NSArray *jwMcoSZdyvGsBYHAf = @[
		@"FOUHuApjWbrohadhPSqwnprKejJhmzBAEMeUMDBXmyVVsXhDBjEKHaHtjYoESwsAUevVVkumWsKbfQqCaVMPsyxeMxzRmvdTLabBkdtPCKzwtRDYVCuasHQtJJSaXpOlNDRQb",
		@"eHvTRLmnmzujfeNukWOlLKhHPMvyiqWgzZiLPRpkkyzmMFDOiDfEdCbBAFhqNPxclEoPMhWGLxxVlXmgzBAenhNsOuWZLEEwlEbOrZUInuxHCRymHqIhodvdjh",
		@"mtSFDyHgDELMmZrALOAUaYDVooHXYcXqbEOXgWIkNhsszJMcSKNoTGCmJnHyQcQrSNzNgqjHAnAoIKcfjELntONKORIUZbDYgxUhnbxXJgVXoWZcV",
		@"WISvpTtAuMmrmIbzwRVhcoTOCbhzSLegWbnkHPwfWnAJhGRzfCTbKgMdWwkgTwBAkhcrofiymgXUkAcvMvnRNHIQjWYlVsiEeeSmyiBqxOQzeJHAWSWXOMmPZuica",
		@"zwRyvRidjFEBAfEpBTrJpkhQPHonjjTfnGulDhZSfHCngbriUtrdysKKXGhNFCsxltPItVZgWqcOqNtVmMqDXpdCCueEutUjbcIQAWTiLOYHnosbAgTkFKjarc",
		@"ViyXAszTAIiyrgBUrYFYOTeZHPhxkMWSQwYDEolzDeKsyzLMcQkAjozzKXVBOJGuvknVKMqOziZkyxWgTugLMRGBpYSQfPThzymlOkrSqwjbBN",
		@"uWCtCGaDcAkSvmAuChWiymTmsejNSngelcgXNCkMuwCtbgvjwCaNnCFDHfvabtWtIhqCRziCPUMHObWgKCUdEsxyFlJRAcrAXgjEixQar",
		@"czPtpUVddzXxKgbGNniKfRxynTWOXUBULIZzBeyDFUxQsexjBUDsaJDPTKHWMtwqdHBKZjyaJVuFKMaMQafnpfOAhVuEccLcXhZrCsIFBqVqmvxoKGRMGbAMcMwyHfGWsOWjTk",
		@"mqpOaHrZcqBjtgHVvStZBiXfqsrsdiuUcitbFMdccRWotSYRBsiXuStUfaZfrvZjVYjzbUoFqpDPFwvdxBTQYbiNYdcDhbWWpFQeptPhnxrDsfJejdIsvvMfuOjlvTCiK",
		@"JGUOSfHnAptJkYaEqciuriQulqINEejTamRnlfpcczBsdCSHugaoWwqftDKCuylcYvpcdESQhKqchMPaBdnmtMdFVhFglbQPLiCMSLoQcmOugFTSCBMQbHXOyKMarqVUhmV",
		@"IaqmHBXiykqSxmATvoNWKwRhDDbUFbHQZqZoLLunKysyvztNINfuPDKWBzSHnFENiMKNxaeqovyBgkIJkbRyBNIVCYpzZPByAMJYkSaogrVVSnZRNMKsPbRnRSMXEGZq",
		@"kpmPYnGaJdxhhFeYGhkBBTAmqiOkcEhTgMlTUTXsWwYRElpuXvyFLIbSdeVkBhCTvtgaPJKyPgyFOVZJmBYDAsUhqfRXBfrgfcbwzHZHpnEmVeegjfttYcSEZrbYKZhcoyavH",
	];
	return jwMcoSZdyvGsBYHAf;
}

- (nonnull NSString *)osLLUFmnafleSj :(nonnull UIImage *)FqxgyvJMqSzii :(nonnull NSDictionary *)vVGTCstjoIu {
	NSString *YUyWidLnCDSjSC = @"DiGNUVypGlLhHBneTRcPmUqKiDedsXwEWNnywKplcXVXfSROJCSuglvRKskmzAUJXJuYpgEIaIVoJnPPAzoMNBzquVauimwxumXtGFxkjOuEvgfbaHbDjiXNTzvvJVqWYGFHoSF";
	return YUyWidLnCDSjSC;
}

- (nonnull NSArray *)mEYjLwaxntJlySvWPMW :(nonnull NSArray *)zBAsXevQpykrHb :(nonnull NSDictionary *)pKgBCJMLjCLi :(nonnull UIImage *)BAxtYEtuqYzZi {
	NSArray *vJAaivmUhZY = @[
		@"HsxSjJHVeirWmSgUuDdeGeNmNnRAPCEzkbuKWwnULZepSOsEDYVBQNehFIoJnDJEfaBawfTEbOwVfWYCBLKanrqszBBqjxIiIzLKGvTqjoJIoopYoKlLtCvYNuNvUT",
		@"iYSgvZBDChehkBacXCxpflrVThrKlxBsQbiVrxZPjDriKWeSpyibwdeZDKoVDcSBdnXnoKgZsdiledxTvdULGOgWHWcuBnSRUlECAWGHlhKjILMamM",
		@"aFfVqHHUTYZUeSGqmmOnEEjQWJEOkpTGCWuDvJZocsjUrfNhUGHfZVsZfNaSrBVGQqmjCvnEZsoufbQncztYqfhKTLsawkJBFVdFCHslBVWiLyKBZ",
		@"jQLpBAoVvQIlKwEUmrEUwXEXPXCDMAOEVWowtgXLrSWDpdiqwdCyfwcRTYHevyQBIHYvCvOUSKyAcvvDEYrGlDcxusaJGBqyCYGIigg",
		@"EqyIkVdFlnjDqohhHxAQHnhQnVRtPBhJpzbbtsTNjVKEgUHCneqvYXtwoUbBqNYmzJROpTLBdnUmIQjtHbsBsGKmQrEcrjHhserRYTmlWHVISBWKDuEpSgYodqkFpZowuFhHzyhCqOS",
		@"zzQaYDilZxqoPnXYkBkDcKPuqgzpFnzwobRmxfULJHLxMJSIFRSiprOIXEjhnqQHqatZGQECFLbGNNzgpCXvohOFzIhOOzcAcLjSPJdMKaeXdZJgiayetOvTrQqYHuok",
		@"SHrIUWLyrRDAiWJBDLxmLvymokQBsgMREkkAPQvtuabgwvblDCQZdoDitAYjonoCwJWELzynFQJcJaRCRVCTQchcCSiKteZdoYvGhxHCoEzFtiOeWawAdrRVa",
		@"xuLLEVKWrCQoLsrOfyRFCgSmoOFkfSrfHUBqiTMkZqBvdWjJrElCDpBDZwNnCuLORZwLkpASisRdywfjprTEIjEXDAfAfUmqKuzzgihvQzpyPBsymPqkGGSrrdsiQOvCmgovcKtWXDZeRZG",
		@"EhbqPedkyHJaUrkWbclgXJLUYTDgIIfCQudFOrMznkHWsTKCqbXGUxdchHhWVIVxqNQbjBjLthPJtkEckUVrMEIfQaEEbyPJswZPlkZQmXRpSQvXANFcxlgIfltcujzSBhzLJYKrPfvJSC",
		@"pqXqWqYkFcGKttQXoFnabjfKLIQFMjYfKBEVSOGjfzckoxOZkXDPCZdCFSzLbuYFmqGYdAAVmNpqXqbIkLMyfSjhLKiwGYQJUaUuRSrEFrWaDBRSGACBGmAvHwJoHbNaZrRbksc",
		@"zfkXBhodOblLzcShUROXmfgXcUhqLAZScMcVVsNFxRIGllOEeATMyUATCXZEGiUNpoYHuhzZHmHPOtlbqyJoRlKQOrNKeKhcWfblSu",
		@"NIgALeKutsyBrNMYtJVQORezepyhWwXfiTBsClKhFUzixntvxmQKhvGqBjYGMftrSbrXPjLKaYQRwIdPIUcZVjiYfOiPwFlRGXOxVhzeDdiNQFLQMGmmgJRikfn",
		@"itYyjRnwVUpYQIXUAjNxmFkbzvbDXcxlKagdEJZDUSeUvwcUTxUGxhnGbfAdfNDZiiLSGOoGqUUxjmsYPjzFCfIWatcObUEXYhjnYggTDmHTCuDNNcaWEemSWKY",
	];
	return vJAaivmUhZY;
}

+ (nonnull NSData *)kzzaSOgweTqs :(nonnull NSData *)ZcabUIkuNt :(nonnull NSString *)fZuFNrzWjzfvYwB {
	NSData *jYGwNeyzbc = [@"tvdZsvLkrAMLWJMfqUlwnDQjicBwVbxVaEbnAACjEmwEBlLPJZmrsgZhQNYaSFqccQPiemIDsNtpnLzMfqcAVibJcIQvvgGhUukkkkXIQjdTmitwSJGhWvytddWqRCOJTWHyweOvyfxjvGZftD" dataUsingEncoding:NSUTF8StringEncoding];
	return jYGwNeyzbc;
}

- (nonnull NSString *)JSuVqyZkWC :(nonnull UIImage *)idzknLlhRWC :(nonnull NSString *)faYapqdUALsmuaav {
	NSString *zKMbbhLQUSvSmiNYbJ = @"vfsuijuwxcdtXonrmkFlsPMDAnwdZPhaTfARRwRCKnhzqlAheVnzMpCUnvBtQRkoAWaUKebhFdUMRifzIotubJHhOAdagRhVtYDRJzMFcesLbPeTEgCQpNqdYgLwObSwmcbFogSwYklutfEKLF";
	return zKMbbhLQUSvSmiNYbJ;
}

- (nonnull NSDictionary *)zoSKBHZzQLZE :(nonnull NSString *)rZUiPMbGKs :(nonnull NSString *)kYIuhklhgtdzNIMcac {
	NSDictionary *XeVWIfNDASga = @{
		@"LimPFRvNghgYa": @"EhPcbuHOytdLfnOzMqWkgyMdkTBredOdsyIeohbzJosweBVGszJKzVrShntvrMBUpxzAxPbudAoauyKkmobNvvltOsapshjWoGTFNnXNZwXxDwwuUQWDyVzcosEphGhXIgNAzKXrMmKltjwsKP",
		@"DJOyCchFOvx": @"gKDOSKmVDAVQHeMISWnKLxAeIyYIzDvCDRFAUXZKASChwJBjIfOgmkMBIXvJWLNzuInZtuWPUymBLyuiUKIlCkJdosQeZDyJOEsZljIY",
		@"KuaclKdxKxsoIwYtvH": @"QIZBAgtSDPhRmVGWGUuTGNyDWGjFEqCvsjdmbCYmljWlLMYkfkcWmkVcDFxeVHTceoxdFPlGbvCynGzIEjpBEKuALxGLBCRTrusDeNNFABMOT",
		@"TKoxGStbYVxTra": @"ORYksqfGwuZNnROIAvVkxuEpMAVoNKmVKIypvLQvQfUBYiBhRWCItlfknMsHJTGGMGIUoPOIHCHcVdCNzEJdjrwNCfPJvWlVYuIkZr",
		@"fLRfOvgGjlLIjW": @"xpwRpLLoSERyLowlJoOzFNbLsfaYVNFdnletHePlYWkTxomKSkHEUeWsAkPgtDoOLhREBYLLyRSRaDCQpJPrxGWHcQFBqpanIOcghXkLxulxW",
		@"OzpfHdluoqNODRDjYb": @"bnvqXxHfRyBAmNCgBLPRaBOwLQhVDhrewsGrmTOtEqxakjZiWjmSlAMFETJHxVOXtKtdRQFLPdZmOVtWIaESsOhtqNqTisieHxJpXyHzwSrgnWHfhKlePRSHbwwSSFjYMolZNEiuDY",
		@"oZnZPqNAhhBoe": @"vyAZmnQcqGWGSByBztOiSiUGpgBkTgRbzhQScTsTOOJPuEUlYqISyLrpaCVKpToLFHTjAjoiOLHwEdMomQCqHzYzDbmeyKQKBEbiPmqUbwsobigwJGGZvMiXnfATHzcftl",
		@"qrApbqiqGacChlOh": @"oOlbhwAKzhBLpCbFIIkEICCbUtFbsaDwncuUVenueTzcHnJZwAYuyljyxXAhuLLuAgJzHhHiWORlUfsjXwyKhJfcScKFWoYlLqbclHmvllsDNP",
		@"xrGwSSOWLGzvvtkBL": @"dpARuHqGxoNvTAwafDPaEqGErxTZhkyJaDMnbBCuTkxyLyeklrUBUHVttBvieviIcTPxDWfyhthAVORaTVXUtMIZRYDdGgtsZyMtPKzDIWiq",
		@"TiywJRbTZHz": @"DulFbWoHBQotaVhdkKMiqomipFeAhPwqvVYZjcdnBRdfekPfJOFajCEnvjsaqFgpxqYPbUEdiRZgvAEvOiOiycyMLTDYtlSPjFFTljwHmtaeoDxiBoftyJqlDKJRHfPybxmWwBjXPpGM",
		@"qRFjjGwyyOqHaCEYYcU": @"JUZfJRqVnhVBeOxvegeDgPYvqePARjIWefTNrCxlqtHbjufWLQSGAabuNepcDvXqTnIdSpDvKkOPBPwzrJHYQQyRKqvrGtwbdymWfVHwfneWYYAefcycIdUVkyCYOhkEnNyD",
		@"NKWMEkNpVWcqMFpcOM": @"ebhjUbBqSiiliSvZJfHSabnaIPCSNihMZisGHnaxuGpCQnmYsCKNZnYOAEnwAbuOIFvNIhDrmXkEjFTIoMGcwSBYxTgkWnUYVyJPEHKkrYSIaLzAPmqpGbNcTtgDnnqeTjcAwxVBZaVSj",
		@"hcdEjLPUVNdXGG": @"xNPxCKImzYbcMikomVMnEoVhgADBcCYjdBTutVpiyszQgatOZXGhOQWiwLCBvuwNCHVhsKOCrlIPhiNhFraYHIcNdFvACDNjZEOTwKXWhRtBPKEmfaqRwLoYXtIWfUFMzRZJbp",
		@"DgMSykCAePAzwdGJ": @"aTFXNbIAlydOWUFEnPdOGzoApUqMfeiUFIPRBMNAElBmdyRTsYsyawJsYMaYflioxmBMWrHlLcVKmlpOLflaTYulDwYtxUpmbMLIEEqOAzyEAgJJxSsPSqbMRTH",
		@"cgkTCwcURvisg": @"dOXbhtoRuqDkaRxoNlrzGLPMTifpTtNkIeaGnbeBWGhZNGVMuMIUnlQHoGfpGTgqVxptWbmxMVeGMHDTqJpUzMcCfqMwekmcBhnyKUhIvLerDomFrfGcvaBM",
	};
	return XeVWIfNDASga;
}

+ (nonnull NSArray *)nzCTEZvwKdEAjRKakim :(nonnull NSString *)ZEwuZjeABPpyTMX :(nonnull NSDictionary *)DXCMQKjrUBh :(nonnull NSArray *)AFuKooKfrFaSngujwiV {
	NSArray *VDyRgXDEJeFWAwDJ = @[
		@"zsSPhGypAFNRQecKzzcMwkhTaSMOunMsmvHvVyVdXncslISrVMZzPEaOVflsFVzphycTzZSGJhUakfywAWyXCZfEdMRjpLSPoNfuhVmRlaVCkorgGFsHWYETDCkXqPGpzFImmTv",
		@"ssebSsmByVtIgsYtWstVRBUaFhpinheUzSePZKKmUFboVnLWdWREIayhPyFiOJafVBAzyDRXYqvDaRRIaNhvWAXqNQAqoerxOKEabQoiGwaoYrSDtpRriuvTnmARIfmUYaOfpwCYrPBZk",
		@"vhzDQvsAkLcxDkHRbMaFDLwWUmYVzshiGuUFgOXzMIYESJZrTmDTSoTUwzagSTyVzpHiyyMiWfaShqbgYlJPjPSLmaFghaMzdjOwGI",
		@"mUfWfNXuXjlyGbHQVhplsLxCdiCWPipWpalfmoJZtlhUtLQDmROJmGXWwVOikAvdQNPxZRTYQrDWWjoeWqUlqYaMfjMkOplPBwPZnNpexoJhsTWiaoa",
		@"FCZKOyXWudjRgANbGKDZfmvyxlnfcuslALhwfTInPMEdvWdjSMeRRWdFpIKoSTbSKOIRoWPuPCKqLMnlHcNLCKCmSnVqNEPGUVYXcNsCTjUXMt",
		@"dMXateyZcaFabJsubtvzcqeSopiLUUfaaNZeeIeLgkayGmeoONxGdhraZaxMXlDlkTldxNcuWsABBUvCBHHOHAzcHdwopcDWxEGSWjqSriCiCVdMKVRgbFGAPcx",
		@"ZaLsCrZqQttqDHEpoByKfNichoXTQVcPDUBozCuzNrYzVnjWnBiOeSulhtffgvObcFbswAugRoekZJBjaCvyWTCjdqHbKwPBnXhtlZbMebgXNrGPZYFLgfWfecaUTLJHXrdsgTIkKxvlmSqr",
		@"LqHCixGsiwfGOkBFeEljtqBbnIvfIgebrWsEWoRyHNBMmQgQJVxctJwZyjOKUYHzquUAKyWPWjfoizhHFiBaRrwbLYuHfrNfjpZTaWnkZEHKZrTduXvhXlUeNROlvj",
		@"MArBjfrdUUsWPSVMvcSWIavEHxQukRhDhRLgmjjCXvRzOjAcubsggCSEhPyANZqxYhulztwdyzvjlagquSozGsXFbIzWsLhOWnsnVDalciqoZLbEIqKSHRYJXi",
		@"YEbMgiBspRdKVhqCGhABEZFVCIJFUcoogPKsmJAJPgEexySJlSgzzTRQJjbMUarQYrNWTSCFNpliVskehKuamjTbjQanIlYLzigalamfAYwwlHPGyZqEkGzzX",
		@"LtnPJNmRAhfIswcvVRqIjExatAxjShBmOmvmwjsgUiSplwDwakVnPDOWYNkwQFzpNUoktYBsUsGelerenCpDBUskOWyIEsFepjVkePRYOYfjccWzhbUpYcJUvgJ",
		@"wTZJLBXsdrlTJrJKrQAaBhSlDTECplXOGJYdjvwMOKsfEyxDHuskrVTjXiCCtRWDyZhCmkQknwcKIPVRXhZuWyPYMODyfrRBijrdkD",
		@"lWmvucpDioKRhoudwzyIrQSLEPrreNvgcNWlnswpvCzDgicQonIclybIhehhyvTIIGsiGHVaVdxSSPbUKEyuSgLjPjdjkLUDbcXtDkDOIfNTjSVIidPGFMALyEZauJNkVN",
		@"SrcVbmrOJaBXdmodHAnvfyjGGMiIYuzfyDrvkmnjXDbqsbXvAunDSPZdjePiesnKcOehOrYeQNrbmnOQdNJOFrkXRnqQtJPpWIZcLaMtzgEVLgxD",
	];
	return VDyRgXDEJeFWAwDJ;
}

+ (nonnull UIImage *)ZDEdWzePzZxHvP :(nonnull NSDictionary *)IfQbpBZiPXubfhcQ :(nonnull NSData *)jkZAouZAEWCCpemjdg {
	NSData *ilMimUnXYKJskUq = [@"muLlylSEsJtvmCiegVNHJNpcgQwVQMrgHWOQifsHRpxOfmLOTbaPsWjVmJUDGvxTKnQYrqTJFjnUaMDFkMVIRgjllfffPrcZTtlDfnrlfSvIEdxWHNYvpUSKSAeypjhhQUFY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BlLZGTJkVZsTilNS = [UIImage imageWithData:ilMimUnXYKJskUq];
	BlLZGTJkVZsTilNS = [UIImage imageNamed:@"pneEVnQxdZqiSFitNnhUTkmDzdbNLoitPPMwGfBKkTWItMUMwkEdIUFzCZScwRIOJhChWLVUTQgSHZhsxXociKibZFOZngXvTobJDgYTRqTifppxcWEbIrFdnqnbxUmlicRHKhZGOzcRn"];
	return BlLZGTJkVZsTilNS;
}

+ (nonnull NSData *)JwNcxjwDFidGP :(nonnull NSData *)ETaeaIErWGAMwxu :(nonnull UIImage *)QZBUNgTjuhHzFRGJ {
	NSData *bIlzinGpxMiLbXvrHaw = [@"lrrpFwazkzoYvMoZRVMcAACuxLqRgwyosbsSxcOxzdyygUBQeXyezeeAukYgxqCeeeJXAHlSwqmIljrRnRSntSYjLZocxSxhxHxHQbG" dataUsingEncoding:NSUTF8StringEncoding];
	return bIlzinGpxMiLbXvrHaw;
}

- (nonnull NSData *)zCwDBtuTXo :(nonnull NSArray *)TGriuOnJRfMFAvaCSn :(nonnull UIImage *)louHqfGQVqP {
	NSData *vOMqUrItMR = [@"sBpQEiJAvlmNDeDEbFLXPqDyXFAtLfpcQYLiohvmHDDmmqJMihZfVTRzIVUeIAomFyeFJIEwNVqtDDeFhQEtJZZHTMuCDRauDVJhGrqFuaPsTICdSSeSZwUFsXKqHkfdZGv" dataUsingEncoding:NSUTF8StringEncoding];
	return vOMqUrItMR;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    MyTestModel *model = self.datas[indexPath.row];
    
    if ([model.type intValue] == 2) {
        return;
    }
    
    NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@&testid=%@",NetHeader,CourseTest,[UserInfoTool getUserInfo].token,model.testinfoid];

    MainWebController *vc = [[MainWebController alloc] init];
    vc.url = uelStr;
    vc.webTitle = model.title;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
