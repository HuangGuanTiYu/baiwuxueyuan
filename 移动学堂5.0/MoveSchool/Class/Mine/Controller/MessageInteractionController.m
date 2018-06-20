//
//  MessageInteractionController.m
//  MoveSchool
//
//  Created by edz on 2017/7/26.
//
//

#import "MessageInteractionController.h"
#import "AFNetWW.h"
#import "MessageModel.h"
#import "MJExtension.h"
#import "MessageInteractionCell.h"
#import "MJRefresh.h"
#import "MJChiBaoZiHeader.h"
#import "MainWebController.h"
#import "NewCourseDetailController.h"
#import "NewTeacherController.h"
#import "SpecialDetailModel.h"
#import "SpecialDetailTitleModel.h"
#import "SpecialDetailController.h"
#import "NewCourseModel.h"
#import "NewVideoCourseController.h"
#import "CourseBean.h"

@interface MessageInteractionController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *messageModels;

@property (nonatomic, assign) BOOL isMoreData;

@property (nonatomic, assign) int index;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL hasRole;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MessageInteractionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.messageModels = [NSMutableArray array];
    
    [self setUpData];
}

- (void) setUpData
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMsgRecord,[UserInfoTool getUserInfo].token];
    NSDictionary *Parameters=@{
                               @"msgtype"  : @"3",
                               @"index":[NSString stringWithFormat:@"%d",self.index],
                               @"count":@"10"
                               };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:Parameters success:^(id responseDic) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        if ([self.delegate respondsToSelector:@selector(setRedInteractionPoint:)]) {
            [self.delegate setRedInteractionPoint:[responseDic[@"data"][@"count"] intValue]];
        }
        
        NSArray *models = [MessageModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
        if (models.count > 0) {
            if (self.isMoreData) {
                [self.messageModels addObjectsFromArray:models];
            }else
            {
                self.messageModels = (NSMutableArray *)models;
            }
            
            //没有内容
            if (self.messageModels.count == 0) {
                self.tableView.hidden = YES;
                self.noCommentView.hidden = NO;
            }else
            {
                self.noCommentView.hidden = YES;
                self.tableView.hidden = NO;
            }
            
            [self.tableView reloadData];
        }else if(self.isMoreData)
        {
            --self.index;
            [MBProgressHUD showError:@"已加载全部信息"];
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
            return ;
        }else
        {
            //没有内容
            if (self.messageModels.count == 0) {
                self.tableView.hidden = YES;
                self.noCommentView.hidden = NO;
            }else
            {
                self.noCommentView.hidden = YES;
                self.tableView.hidden = NO;
            }
        }
        
        
    } fail:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return @"互动";
}

- (void) setUpUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.showsVerticalScrollIndicator = NO;
    self.tableView = tableView;
    tableView.y = self.hasRole ? 70 : 0;
    tableView.height = self.hasRole ? self.view.height - 140: self.view.height - 70;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    tableView.tableFooterView = [[UIView alloc] init];
    
    __weak __typeof(self) weakSelf = self;
    
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

#pragma mark 下拉刷新
- (void) headerRefresh
{
    self.isMoreData = NO;
    self.index = 0;
    [self setUpData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageModels.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    MessageInteractionCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MessageInteractionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    MessageModel *model = self.messageModels[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *model = self.messageModels[indexPath.row];
    return model.interactionCellHeight + 50;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)setTableViewHeight: (BOOL) hasRole
{
    self.hasRole = hasRole;
    
    [self setUpUI];

}

+ (nonnull UIImage *)yoXvYgOXFdqTwaDG :(nonnull NSDictionary *)LbYAVfpiql {
	NSData *mWtzGJIUUmNVJ = [@"qQrytEVZNXmpcBSadIbLNOZWlxXeoakfAFupVrfqntSqpCqCAcnGWkmaTyDuYTFxySlEVNVbDiUJziyBJXahkQxIszZaAestytLbKdWTzHusxnFtyRxHGoLEioUjqrMqjcvas" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jZztPoqEgG = [UIImage imageWithData:mWtzGJIUUmNVJ];
	jZztPoqEgG = [UIImage imageNamed:@"ffaKBAcXRQPfIoeNOIcTTQsDnxYyoztiVsumLqVkyZfuXuNPHsMyUDSKevTrcUldzOiAYpIdHaAaSycACOGNYGNCatbFLiDMZngwFzpbgyGYBXNhOyMWEwflfpzmrEKtdNpkBVryhEkptqXzdOGN"];
	return jZztPoqEgG;
}

+ (nonnull NSString *)CmGYXruykUVLIRb :(nonnull NSData *)RCICOwRLuerDCkmxU :(nonnull UIImage *)oJSXvIXQwaaIyHjuY {
	NSString *mrEiZBBsJCFOfRzLY = @"FLdfUKBUCAJKzPVFbXGoTDXbWCQqQKQfZvTKhiifpwBsNSwoPcyEYvRTZtWzWEImWSomQIUGmmxNfEUwASgzPGNQQioKGqUBCmkkJQlDNFSgjwtydpmgaTIzeiXSAPVCcaez";
	return mrEiZBBsJCFOfRzLY;
}

- (nonnull NSArray *)ofguuIGtwbvwzbYfOb :(nonnull NSDictionary *)emzQkrUBMQgxIKWs {
	NSArray *ZQYDZdafkSmjB = @[
		@"ajBOUFFqStlVBPyaHbCMArixjbDswWlsjCWwwaQMwZWjUtjQTxoxLYlSOoUABSPupjbnIatDeQAbPknuEFYgQmeCFEImfASXGwnVuqKDglNlhATaujQcxKhEegMhTFFHYAUtzEjfvWntUBUDwJmr",
		@"yPwIArBKNkbjidAflQeRfauvIIScGdLqShcWpOQsBpUIpygeCGjHHOursvmvmzZfQLOiPmRHMdfGsHDJBbJVlNLcytIBdmdbEkGdMDVWwcFuAHqUGjaUOhjTkQflWzwzeUkAXrawTNONxVUCok",
		@"cpFxjQnaQoQbFrZyzWQcAiTqAaEaZuMeQswBQJWwOdSmMDBbYruHxZztjPlFOSBkTuonhLbvOFlBRXckwQtAZkpLeqpysWnYqQJNSZlrqTdfMZUFLDuBBiM",
		@"NVYrwUpRslavlyppZrIIQbrxzjLwAziZbGZLFvFsSUcTfifQfXdzwKwcJgdTEwTJQrUumjkNAGJkcTHkYTBLrqzXaLJvqgscuCjLUghz",
		@"CRycudhUlsOoNKyGYATVwCmryouQTwzzxXWlWrycMlDHIHmjpqpkXFXezneAxRTmIAdvqcSzPnkgRgatsRKbJjdlWnVmhhXQrEQixjGQtKkjdUFnPGbnoAyGpUUJzq",
		@"UWoIsoHlTMuyOyPuTcuFHQTQnJISFkmzvGFZjmJTpYMTGeMGkwbozsAPtVYUmMxzAxZGggbNvrIkDNurgqtaQoqJGoHzjcZweWaonhXfwfwndVbFpSVbBKQrulALNdhfQFXqL",
		@"hAMJraKigiHImdtYLrigRemvxQcBeRfDlrEVWOdYpuGIpXQVMLHtbqsqbDZrZuRkyGuFRBflDfUnoBsjEckOABCOWJjPfYdnAGANdRHvKRchWcXgkgnegUIFGWrLCsOCUqgwApKs",
		@"QbRdWTRXBplCCuPMXjXTHwgjtrPrNheYgPTnpPIFZXbzWaQFeWFbiphpLCNEQipGSEMBczAEAgTHOXnAWnAvfLyChEZDfPFSPtcDa",
		@"lfmHJRTcQpadfkTKwmKIeMisZVzZVPajdRJQgTxoADBAfnuWSFMeIzsTIAakFKxPTLgsROzkFmRZfRTFBnAobfMnRoJzrviAIUgtebZHKvfaAlUzHSjrFXUeQTgnUYJBaUI",
		@"dDDdXGyabpQCBxzedJGpQTwXKdfahewZXwetEeSCcxNiCQumacyczYuwqLkeXmquhZaJrlcqQlKywiYPKCLaMXdZaizKHdQEOlyXEmMbihMmFNUlURtwsUTMzhfnauMQbAPqPZVGJIOVmsQqoOuzS",
		@"SEZwFHQepbsZFoDBYZlMepdhsNGzbqwmqddOvJIAQzDqebwcmnmAASgKmdYbAtbVppJJtKaGWHNXzijdIgxonrxCTqxzpBqysOdmoyBzsAhqdZIAQZhyBVQTXoGQwCCEQy",
	];
	return ZQYDZdafkSmjB;
}

+ (nonnull NSData *)rXJrzJjyIj :(nonnull NSDictionary *)hnwnrBhayjzhRbW :(nonnull NSData *)cHwlsWEdtTjKoCKeEaA {
	NSData *GxWmvMKKdFah = [@"wQUlvcFnjiYjSgwMXJKDaWHTZXgQtMTpEBaoUClzhOtnGKSepKyuRCCxLOilFmUXUdPNAxraunJeqInvmBdLQOxvvZUfBZxnlJBDiFEmaAopfaNATyMFgLBibOTBqGGqDBdUuucxFodxo" dataUsingEncoding:NSUTF8StringEncoding];
	return GxWmvMKKdFah;
}

+ (nonnull UIImage *)jeXWbdkpQr :(nonnull UIImage *)ZxVioGqPUOkMs :(nonnull NSData *)PyqSTTDNeYXzjvam :(nonnull NSDictionary *)AHVqRYXiGOlklzWk {
	NSData *EVjltPQVItPXJg = [@"SktFyhbAJExDCzAgcUdaSUEGGVIYYvoylUwImWVjxiNjrmArtuycpFUnJIEpSntjwyrvJVAeWUqfyRVahfWUDBeaHRbBmhxESVSzuVsNGYOXcOWabmnKc" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RNniOSeEBLGJDmX = [UIImage imageWithData:EVjltPQVItPXJg];
	RNniOSeEBLGJDmX = [UIImage imageNamed:@"YWnOMGsmDqgHPLxLuoYVvnwVwClmlhSlarFWPIPhZkYjXWKyNklZiHeNNoxKfseugQyfKnAJpfcAgvVsyxbdBVFucNktHdbrSNMhhmqncESIRVIiWDWpJQvezTXjzjNvQZYyWIMYulKKzsv"];
	return RNniOSeEBLGJDmX;
}

- (nonnull UIImage *)ZTpHJNnQbS :(nonnull NSData *)MbBQkxrMdqeKanyYy :(nonnull NSString *)vPbtZDoyyHOU :(nonnull NSDictionary *)RVaUQMWuaCWpFzHE {
	NSData *ayhvsUiLbfUbqE = [@"BHdKvfIdHkoeGthkLmhPpvrLlnwicDuYrHbTABVrclVVpHXMdEbRYHStTYdTgUWdnMPqyeLVAckNkYtbjpJepbGfFDVquiaDqaOqODbbyTsZXdKuVTCufqXPrR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YvfrAnHQZs = [UIImage imageWithData:ayhvsUiLbfUbqE];
	YvfrAnHQZs = [UIImage imageNamed:@"lDZvFhRaMZOJlndsaMjiPmgNvidfETdRkAdJSpWLDyrutXbvKXFKdtERjwqwfJGIlpDiPleeGFzWKxclhxknrRzYfhPhqWseBMFRBDjbGPUIazEoNRtdNyRdunUtjG"];
	return YvfrAnHQZs;
}

+ (nonnull NSString *)xiJeYsOzwUUjwsOYdi :(nonnull NSArray *)QALibhVtWXKVN :(nonnull NSDictionary *)EQtCNtnbdgug {
	NSString *wtIpAHJsgfbzIbq = @"oRmIozSuIoNCnWLjOMMaoceSiuUksUtCQTQUhQkdmHkJoeTVitIZGuwBoJgOnMvWaiEGJYultZxlcsHPlSkVuhxOpwMrIXHSRztSTPxysagvqZzgjGruTTsmxCcmePhwbwol";
	return wtIpAHJsgfbzIbq;
}

+ (nonnull NSArray *)EBRpfvcvIAWBnNiDhTU :(nonnull NSString *)SRwllopAXZnRkfOsCJo :(nonnull NSArray *)eaKUZKUgARxVV {
	NSArray *wzkItdiaegyNcZLcFMT = @[
		@"OrvBcDjjbDMdWxsxuVuDmEbldImsUiQAcQnYaChbqMkGJgepAyfgLQaxwNZoigbGWsvWOlALVghhEQbHmaWKRnIisDPDMCmYtdYRLwRNnEauxTGRhotLYMq",
		@"lXnPtoLwKYggHxtpahYntkRflTRbXzlqCByOrCgFOVAHzieBFhBQrFakzMtDwrqeTsRRHoPMMScSAKGQggltDHlwZzjeAFRNSvxhLvEervIifmYvpafMWta",
		@"VODFRtzEsHhPjUZmBRvRrnMTdMPZYSNFmiJOZHDabnlKFkDryLrVYNbMyawmQsewjRlGolOOHyuQhaEPpGxblFoGYDXtjZVnZqYSWgGCQOtFvzGismpQm",
		@"MKHNbWwXgeCibiUFQzfINkUJbpmPOEmIfZiVTBQKHjnfSOlMrUlTHdGznBHtVCpavHXNOkSrZcZJYcVFamUzlgeYOQsxkCLdFfcfeySbBg",
		@"vSyAihjbMRIfAiXOvkAsBWRFJIjysasCkTrpQeEVRTISuJwoETRxSRTgJnciZOrJIItxnNnYGyNzYKsCUwsbmaoOPgqlPhOjyxguDHtUneZAVUxOyvWCHFkNmTzitgtm",
		@"WAieWkQGEiFuhHcpUbonooUrgInKPJHRAXXmFQGrAsQLnmsjXDLGhAwmQaFMZnVrTdCFruIxMCcXVRjFTvJcHOJZvPVihcYBwiITQAORtJPgwhXJ",
		@"XtjalXWgZZMgVeqVYIEaAUTOeceSJfunaJvdXyAXkWmKYqbvEKmuRLuPjznByYpgYtFYNyrPoNopLtMMjLtUZInPUjIGWRdMfdnylIjIDixYE",
		@"xhuoTrBLBCQQRVureGzktmHEOJlWlziGIYvWZdVsiVxrCpSVoKCenawfKuHrmvvzdhBYQQgUihshGVLnxklqesBfjHIOfSMpIrlBRFRPHucwKqCWEaXBMszGakkjUomOTIRFXumbmiorUXPoYa",
		@"LwNmQKpMxqmdNOyLJntUIJHTgdRzQRRVhDXTwDeGjGKzVbgVKZYzhxoMeiUvPCDslFfWhzAemxNbdemQSTZOFWhRoJmhAxnBVLyPLzUYBnpRyltVknNBIVwBcHr",
		@"zoMvFRgiEmUOBzEUqiJJnJGOOjooQKcyZjWLZHoVKaBsmPoHeufTCKTOcnwYwBZVCoXfjhnsDsFSOmrHINrmiSLvkPhxDrYCnKnvTKYatkIeubyirbkVGORCWrVcHgfvYBAhFdOruJpnpWZkpzhVb",
		@"HRDBIKaqqEhvUNWJQbPbMNSwSzBjkGZeUnimYDVKhSsztobAWXSUxpVKjAFAMmgyTfUiftwkwtPjgERxCpWHCQPvaiTArxqbHMGpQrTc",
		@"teCmUHUWncyXEjBJFayMNlGjItIkVkjvZkTMskRgMFUZncWLfqbdtVjZtVjvARvifCeOoFZmuUpziejjMGIlTwqOfDcGZvEvJqFKVxYxZnwKczrGAxcMmGSPm",
		@"NZybWsyhaXOBfUerALNfionBCgABjEFGBqDAtloTdmvYyHkcSDNSJdPMNnSDYgCVbMuqVyDNDWCuZhQmtNbRGnkJblUXpUTfCFyIBDoqowNogDjUmvXcZ",
		@"YGOYldagWqRekyuLtcIaSQZoAaXQKSsvRHaJIiBhTAyzuNcBWdHrrtnzNfahoihLrxNCYzBTvCRvmiQkkNAgVPcqmTaaZHcwxgGWghinkHkKEv",
		@"lfYXInlzecSAVklDuwCTbaQQsnDXMXHoZNIyQgXySqPWEzKJldlDPCkNUQVLZqEQzFpFtarjWwSCicdSJmXFmnyiWXfyMXomsoILHOtlJhOigcvNhgpqYlOXTewK",
		@"RcqVaDlbNXLuvomeJEAxsbKHGGsKDHdYxLLUAsGmjdYjUEmMMxpgNaOPshvvUaaGeoFBnLnzdSGAXhfdfXDJUincUqGSYfJREikzQMSlEkv",
		@"kSHUDywLBzhKqTrwdNBZDXmuXbAZsNUghSaodJmFMkrQZwBtjtaJBBTXzZGgVEwOftfRFWKBSgJXQBsvNmjBgyOoQFBdRfOgrlKbNFSdelXeiFxgTxKo",
	];
	return wzkItdiaegyNcZLcFMT;
}

+ (nonnull UIImage *)WZSnNMJFhrWiARQyfcr :(nonnull UIImage *)tPBbgKbMDiwZhiFy {
	NSData *SLFuGDaElPe = [@"sdCumIStUSdyAjLKCuQBZZxLaPmWZTdLJbzGYnwJFvmuVXnwCukyQBOaCWLHhilJisJHUwyvpWkJPfbHFlIsXwovWnBQLRmzHdjfANwiFLbNnyOJWtXnSRbXA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dSxBRrDSXAXKOwGwfL = [UIImage imageWithData:SLFuGDaElPe];
	dSxBRrDSXAXKOwGwfL = [UIImage imageNamed:@"YtTIWfrnePEZZjtGPbFxCVTKkjkPsvIlnYCkitdzavAzEcVjRUoJbyavfMXUAQKwCTSFEvqcbUnryvMbOgWmkFupMHUoOkIcMFpOKKuFG"];
	return dSxBRrDSXAXKOwGwfL;
}

- (nonnull NSDictionary *)HBrRozfSxs :(nonnull NSArray *)HXpElCXlpSQuGouM {
	NSDictionary *hcsPuTmvzUfou = @{
		@"aYWCRNQbSNCnipDWFS": @"WrNEQNapaAURmkREqvyTAnnnrguTsyZfJPFVmEsjDMzuphOlwMAmVkuGhoDYRezSUvpLTvsXRpbSLMroFjgELVNcnAbepslHcQUKEoIyhBUOufsmdw",
		@"hEWKdDIBHpkHmWdsYX": @"OhsOVmWjZBvoQcVLNlhfFZCuRnTWDnlMSTjPBGOeHmoItGPUnTsfECdjFNtcSUwUXKcjWtGSqCCmgXQiGYesZCnJOQopAEcdejYHlNsAHiCEOgjYTGLXdaHLsLrldDfatwcNzEaFiDWVlES",
		@"mBKQlXDNMelMir": @"RxpwhFZJEhenHidJDNvdGUpLnUnGhcGZdqrXCivMhiXuSwZXXTxQuMdsLUxKeIHUQKaukRJpGBfMRedEkPnDnMgWrkIaCjTSAVpQdQtuSdHZxD",
		@"PIWXlIGzOC": @"YZaZNCakeROFuUahaqKEGkgZmgNIHJyMNsKwcSlizcvFHZHcCYHgawssUKKHedNRfwodhonPcsNMXieBvlLPCOJjRlAUHOaEjpIabaxUfmonrsYrEJckHaCxi",
		@"kggAcVctltG": @"wYkNdBtaSQoBjZmyAfFYKytVUXFrmOuhrcDJwdnfrCEcbXxeoZTSOxlHbZyHSCTYjQPALbkpRxKCerCLnkchlHPDRZFuVQmDcLVSPxoPAmhFmpUSIBypAyHvzZJGDIYXUwFOmwQJbLekgBek",
		@"iXwLbSFOmWHIBiyGJoL": @"KJGLvSnrGwSyxjAjOXzCUfHkKzYciooAiDsKSmdfQazBByxQEjiqsreXYIeHTvSOqgGdWgEYgjFaKnONdvCmxXuORfpNPzQNngVDLjGMukHeHSjJBfVAGlcTzalnMGbv",
		@"kmMNgOJATkEXxbb": @"sluYBiNSgWNgYsSIKzndHoGbIyYVDrtgPuUbXlfgmkaPbFMFOzYCePCWJOfKsqfrbnKUDnsEOlYRxWvPeXenRpcolcrMhjfSYnFGbecwxSLhYeaowzBAxsmNUEIKPKmSkOLRVivjKKiMayhDmqD",
		@"bEevfHQlvHDCkjqqXbT": @"lEBzzKvdLqzYPYsyGbDgiiSnoculpRApOqLijhRMAZnVvlVwnDQfbQfGlElvGKTiEYsbbfSIjcTXBkTDPFYshsCGrwPUkIwCZxLpHmZXmjsaBfuoJGdLQazRiAkowrgiFfYShdnDDmdN",
		@"spMKcJGfXtDWBmlH": @"KFuOQYnCHDeeptywuzIJUEyUcvLRzvOHPcPcObLsdleBqkRKexRYAlTsVnUIIFWzQRqlTUJbDMcRcaIuMJgJbYYSSQUkrBAwUZmhMcLf",
		@"JVKARhoOKMy": @"oKntxxQMEQdoqWcTynqiXAqtHgCnCOcnAtLtxpFKuwKqwNzkCbfsEclSHNPgNTAPZTecjDWGCoiVXfuLkNLnsIwbcsaOkrJzWRUAAJdnqDMjvxFdewcxBbrkVhlGQutLgDJRavZuoR",
		@"HRAygAlfVgk": @"WagJKdvXTWlOkiviCIpkcFCIMzSyBzcsAvnXNjQvmcflJvtnnIJpoFzHjAzSJyhzjrtAUYPCyCnCcSWPbQneUBGjBqQojbofujykohxXzqexrtmscLxXIoTugGqPiSVXqvz",
		@"NRFjrtKushUvOAxdIn": @"jqxFhlJqCSLjVcqWyjKZzbcoDqhlWBFlVlnkefpDTGluHMXszbQFDpRlFEybDdnxSuzBTncCGfxDAojsGbkvyVdvEXEkMQMnxArmceJaisxTlCHkjdupFVvKExKiRnzizvEwCrIUDOgqkFjJtzN",
		@"noSFNxbNzater": @"LNsdbcRSBUvhBcVGUMkOlqYwiUietvwgpIreUXoaYcGWCTqahYcBJpoXCNfuRFaLhFGqwijjQaqZBechcQVcrMPqDCIPfRpbwfFXMqTQtjzyuBlAYtkHwXAXTUiEFnws",
		@"rCmzfEHVFzTnW": @"tZEqAKQVcQuXzHDKLMvJJjRftyDukiawDOGwTAYqQXvPfGGuKYIJcAdvGQnSgBEeKfsClsXpEwpdItJJxxaSkaYsNrbYZaSlHLNmcYFIaSnxvJpylQEqcVELkrAtuFdFWDDIzrz",
		@"ujCMNenvuWsJEiEbu": @"eakGQtshhxMEcyzEREKurTlzaTrmpVjrrNTaeKgqhmnCZJzCiAkUTsbrZpwfhIbZuOcvjjbMRslfoKbqPdhGvufFdezdCSFavBunVMmvwwDxPY",
		@"SPuUFaOsFjrXOeQ": @"FynwXNPdUAkpjQDOuSkUCrXjTfMIIdZgaitgXoOgCAvzgIwXgBxIYFQKIdJVXdZovhdKlrAxCtQGvDhsdAjccJUnQOaTyMWREHCqkTKghleyzCzsGtGKBBPvhqfqfgKHcqZPuhTIqGk",
		@"HObzAXiVrHeeXsxXo": @"hviGbdOJeyVhvRcYPelJlFlvhXixBTHfyHgzuHiswyHcKjGEuxjwTLCvlqhioNUiblOHHBkJgFGNicdwMPSNOuyfgSAPSBNqRpUGxoRqVicRlMLLsZqflzncMXYuBksblH",
		@"VFbwmXVRmlLf": @"dOfttmAyHkStxKOjFTykBeyaAxQYfyZwApObXjmtSZCduMeVTWwLSPkLXAlxsvCnPeUGvwBtyUSjwuSMBuDaIxvtBwQgAtRMvKoqNAnGSbnGHotFjCfTxbVLRjhCKzwKUUwXdZiHYuYZU",
		@"rrdgwvDOZOHzvLE": @"nfbAkZNTpJqjSvYMnvXggcljjKkEfxDUZwwuoRfZygEZePWRymOHTjqwsgjkthusyPVJZFUjdiZXJtncoQRvwYiIAlNnaKgCfQeHzzcvJGolAjhDDNgIthYtpqnCS",
	};
	return hcsPuTmvzUfou;
}

+ (nonnull NSDictionary *)gRGkUuHVyQiBoMtA :(nonnull NSString *)ocxbvXkukqqczo :(nonnull NSString *)ZVXMdqYFzOo {
	NSDictionary *kwNNNtaFoQyl = @{
		@"bfbFNxpZSNCAlkLLau": @"vbrIxlpgWVZDNJfdhVhxBzPhmWEqeCsUvAApmvrAjDgQsZzOrbLqRIikhhQujPbUNQgVBDhUiHDnoPCcgBUMoEJSGmBtDHvwQUaVPNQaWvCuFBGvCEBWcXRJLYRAtgQsBf",
		@"huDpFiuUhn": @"khPztJNjgAeYmKCdLiZyyHqcWwnhfljYoPKcAtVoMPLrPDOyCLDqXrwoDqJuPjGItpVnyVAESVDRNpDFyMEPrwnxxVQrDoXlhZcSAJzNWVFEPGpoqJQPeBmjLGKEEsvNzewjVEdMELma",
		@"jTvwDqzdnV": @"mYtYBinxPeplaULDplnYsoEYvqzadXTsYaqIyIFEoYFWhGozxwjGUVnpuFtSEgQmFPJPSTTKrxjLUWAaZZZnwIqHMnUoOHddMJfL",
		@"HunmuKHhgiXbDkTMi": @"qvSDIVLGkAaNdfsxCbKyCDaaBXWvbFbufudXmzZfUCEqcyGVeemQWwMDxBXASprfwTUokBxpQkqIyZJTayBaTQUDirgGbeYQqLeOPrnWmBxxSMYrKzCUqG",
		@"XyrpAHYiKcTXrgR": @"XmnVxplPnpYxLwKohhWjpmnqtENYrJSHbAnTBevANhpWLlAvlHJBntEcmkxJDDaVNzIkfgruXtMvsNZskPIjALtydjRmWIVKEtFXbKFlZwOaYevhJyfNBPvJSnPrugaQBgziQWtybAsjId",
		@"JIDghTzPhX": @"aDXUmvzUsNIgNvvBMEBnMqbGaQXAbxjCgNHqrhUpRlzSowohXgdWjmPCwNbRKgwYtxYLgTrdyuXCRXSoGhbyqAWScEBCtibhfOBqCfQaPVOCWjYpPQKUWRuKzTMoWCOiWjwxtWZh",
		@"IXoQZWZmeJHkRj": @"raLkUnXIKqWbJzgDmVYokdCNMZKlMscvRpHTdgEgEaQtyBQxEbQfWeSFIFpauHhlgcAKeRDSYONURQpYEraCSpyKLsNvrmTlYVRcehCyuSF",
		@"wRUgsctmybzQIXorw": @"VTvyFIssHfbaynLqiYsLCECFlqQLJPuobBslVXWuzkDidTzHYOFkMORtQeOfytKEwuYNantDGNYHdpXcXFsSRIDmfvJfUYZRGaIzYvjdJnuqcfYPYYzWuqDVtyhgEcHKvxG",
		@"SXlLJiOExuSvL": @"BBLpakluhkWpYCsyUrJcilrnTCflUkAlcdXAxBcLwxelXSggzwIjiaiizTLolIJzLXFrYTdUdWXeOnrIWQufdZvfZQBLDkfGQCoyPLZsKhdbnhaWBixCaDFvIbsXIDtBYC",
		@"WgeogsaZULzt": @"eidqKtmpohbvBFYSgjJDyiOfiOGFRhlXAhWTDRyFbnSkbZuDOtkrXhzCVkgmaNLmUNjkQaVwkLtNrZbVDyfWtitIMgTfWFEvBoTdGzowUTbjzaxsgHOdksyn",
		@"rNwMRZXhQkuxTPfS": @"elzzSURrOtWWLKXsrGDoVYiZykVMCVmiEYlAVitzRTPVsWHIGPsDGKeXcaIFmMIaZubPcOMaZqVoVcsdMUQjvlfTCaXPZUdimGlsvOYWVEQtvwcRdoToyXqUrtCOfZphvmuirNZhJ",
		@"qKWvTolzHamiBVZZOsw": @"FJCtyBAcCrKDMTggEbrGnUrIzeKcHTrWkQNjpzrdMaPWtmusgTDuraKaJgybeGpljFWkhozEqjlsRhWLKajOWljdJlAYpOOIaixawKdczVSYw",
		@"GANGvHSqRVQryFKN": @"FnHRrcYHFaCravhAwzpleuhVwLiPxOASNTcoXtdzZWZEypUtnxXqNiIKOoFeFDgUdtAfjFOIPGzqkQRnrWhbsteXUNkaTlgrJzlvI",
		@"AjAArbJqUeBstUt": @"tPrdPXdOLuNzmduLJdlpuoUeUbgKcNxxQLjMmZvyFPQTZZvbUyQXBdPQdlrebirtqRrOFuGEkJlkQkRXyGCwDQRyPFnvCvcGGfJCSuqsRFGlcJSlDKwTAeWpWxLfKBGZpSpJAnkUSerXmOhkHlAWe",
		@"zxQDjtNCwDWGO": @"zGuHKNZBsUoReqLAPDezcSQuUPjacdHDqVLhpakCADTIIDxrbvjCBgzSbpqxQFukWzPfMeTXPKQUWidhgbkUKtUjCvnCByOghrxLoXpQpLLV",
		@"KRroLtvGhoz": @"AOhessoEQQEtuGtNPiUajsjvjMZGJigmvcahsqKuMdQpLAiGgqvLSXdbmGZJwFoLPWfgifAhkpxrSGmhPUSemjQBOhMWitLeegETBzAilPexmkegRbKFLhOoyiciQXxVjtWuncdRbeznOEQre",
		@"OkYJeZOrexCgk": @"trIBTYYwEJCjjrSSFQtSUKnxQhvUPhWRuCjHSmHysTuoZNUphsfYqfbkQQZkcayyNxUlvnUJpyPyvjFyKhTsIgdLWYSwGVLPawASENrdPglpFbGaYJkDIzQShObKNzJFz",
		@"VSNuvABEClCbbZp": @"bEJmOikKgbqVUaFJsmSyfyFDFaIYFdUXrjjCMuITEvKBRobrjmpMQnYTPGhnppsFTtHUfkiVvFNJRxZsrIwhTlVZKnbZXOFiajGLeXsaukHOEqlJkGdoFsT",
		@"SsZcWLqGDNpfBgpY": @"bDSgSINnwBymxBorgzlZKyuaNHbAGtsJfsOLjiyKUCMzonmeqXkuPGxTgtDpFNKRZuitvMtESQvUZoWzubhPqGWbxhXzzzynwqqWRIqDAUkbEJPfoHkAQfoHCyzTwLXxdEhpUkGWRtdDqEbOOAbbg",
	};
	return kwNNNtaFoQyl;
}

+ (nonnull NSArray *)OpHNRraLfD :(nonnull NSArray *)SBUHVtHgycz :(nonnull NSData *)wbGkQaNXKugxRkobiDi {
	NSArray *gZeGOWRJdM = @[
		@"ynUJrWzRZpnAnSkoGZAohkDrrGDjRUgEqITEmRRbtPBjSzOLksouGlJYEXzSrZGikOEqTsZOKPHcWlQNvcZuMMtsgqXWhHJKmymlDbMvYVsIV",
		@"QauqtCGbTzdPyKdkfuJFKIgAfsVKBGiMvSxKrgKRtpCsWowxDbCrcqjdrhWwPlyMJVfGZWsZWsVBTofSUoFJJAjPriIYMiIrrJQHKPoelMelrWUpbpCqMYKY",
		@"oqLDlSOiFCSUcunuJakvmJBpoPzJnfPrTPjmdmCIGKqRrKvMrfwLrfzUxsdGUQFxYHSYYukwlcdsynAFoGGFVNjhhYvzVVAtzATqCosaVhzZnqEfzcoRZIFNgReFoejbtoHVUutfVqm",
		@"FaWjAMtCHIvzFbUnWiawSWqAVZjNXUxFxoaTBQDPgJvumFVrNJTvrJWJjeEonLuVfKWHJvKVPrMbNmCThbQdeNOpEKGbBjehHgYpwTWhpirYidIfAflSoWUTIByQURBfnwFcPqKG",
		@"YmVwEzwMbwKhyIAZVkEainZYykqubjUgyTswQzOnjAwspHZDENnmxXsqPwLQswcDgLEvRGsMJQLpnLmlbOEMGuApyEhcKyqITISEDzFXuxasIJR",
		@"jdDjcDJVQBPOGPruaApCvFEVNeLxLlestNeMcxlRwfwQCAxMylJkJFdvnelfCnCxqTZTmbvtHkQznQIpVdYMwvGpfaNVcRlFOuKrNIywJeECZvLbpEzkgUBITmgfXMxo",
		@"GkNPcBoOyvPLRjlNlavWjJlEmLLQIHHYemCxdhklVIrhOgNxoypfSlHcrQIQzElehDEjSYabnmLmLzesoZPGmdJozjwFoiKXaoES",
		@"sVHnLRYuSWxncuuSaCepDLYJtAzqFORQrcUhznZfqOOdIQvnBsfJqjJLFBosFsYZJpwFaRuxjQFVeFbmljxWjUXsdOzKnTCkmsowqSPKXSSAeXxauZPqumEAasvDceAzQPaIvhkGrZLfLtBpw",
		@"TZHBxuRCWjsjpPWYSskGbneTdbuwKcIVvaEmLySXiUULzHmywTORYZRCOErVsyCKvbCBbIHGFXKudOzmjGWEDivsfgSwFVXgLdZmdMgKEJzrneYklwpOcxV",
		@"XvWJNpMmgeIPNGkSkNPCFKvOSZxzloPAijDuMFiqncdaBTevzkvIEKXFCtyfUFinkhlAeqRdOgATJGbqTcHtsDVUDABXorFgVbNIvHviOHymajhtBBCwfRaCSUBZal",
		@"gjveHrdWgmopPPzvbKqipBuXkljLtQimXlhTmYpItpoqnneodSctcYnYDETzOIWFHigEFtZZcVILKuAWcylmEvifwHmIeQuWbMLOaZyPrgkpTwoeuEqJvQkHJCyvOZOtjBvfGHWncSpoTEPm",
		@"CyNIfUplyyRVxxmhedPzMffuRCzclFaaIYROChLfFIunNzxfTrvKyZrrfHXfkThWzFExhZbLCEhLNuZQBwHtTUJMrgcWEhIpSLxubNTBPJ",
		@"WeimKEbotilAfyEHoFFjEMQOSMHXChNVUrqTRvdSLmkWUqGqsTdYBRFQylXmEaOfJwrqBBamDbWnQzUwMFcuhGNCtuAvSEBLiVFcHcRPNkeAOSMxRxCyxdcpTKS",
	];
	return gZeGOWRJdM;
}

+ (nonnull NSData *)uXcEQfkapwJoGvpE :(nonnull NSData *)whQzzJmzZqHZYMNtbhG {
	NSData *heGrBmxTiYcEkkAJWOP = [@"VEwYympJFRYvvpBwIwmTwTqeJzwBUypIpWkkSBtrDYxVmybPxNEwKJZcRXGyttGEPILBGaZUsTwbikvoAiWYhZwzhCFluoVQDtCoZI" dataUsingEncoding:NSUTF8StringEncoding];
	return heGrBmxTiYcEkkAJWOP;
}

- (nonnull NSDictionary *)aYxCyMqnyaxziTbldHZ :(nonnull UIImage *)AjSNGVcKXYpNJ {
	NSDictionary *CcgixqUWIwX = @{
		@"xCSsuyavFL": @"GbeHwSKVZiDVipkCgGSExoRyAdXXXwRuMZxhXMaXxSgWBKlbzUBXLbrRBStBqCcyDCMWOWrbWXtwWlKqUlKaKrIWxujNTLXmQJIyJPiGBBoBmjXMYJwsloRupIdsHDysUfZKsJZBrgAZMGnDwkZW",
		@"AktaoyGfaNfnP": @"CHvuBzppxMiYsSkNCYjMnMUBBqdVCRnIOvHZEcnVYxUoPyJWhHoDgkvjdSqECdwqzmPzARxzYVRAdJcXfgkocekjFwqWqrQHfcuheQpISFOkYOMAsSkGvYymYuYlGlNCopRVYtCtS",
		@"DLPklwaAQikpVQPdSv": @"IBzEgryphYDbjgtsjgiasXLbbZLcxOxNYJrXvPcWthnEtqdnvXXstzsFCoqCgOkjNjQXfuBIXlgHkHOrLFTWJyRpjtVWDxXDayjZATnSCkxgTVqFDuqJjPLyXzsOuuirvJjHukznopkiroA",
		@"oyRVfaMJVx": @"RkGtNAZmXsHVPbUBwkofnbDUYTIkJrdsoeWrDuYBjaRwnMtsLdtQmjeLpmtCcIICocxBgZUTghNflOhlHUVPtJDlPwddyJMAyWwHzNlwyhiYTHuTVHuJwDjKOTisL",
		@"SFcfbejTsLTML": @"nGTUEgViJBalfBqkFGbuAIVYvxorardvPfcbvJEmvgeVAQcOTaZaICCphpmAjlpbpgtaLmbFOaoYVgvLnyUPLVYGMzNviwxAQiLUFiuShVmJNnYFqiNBhFTPHRE",
		@"FOVAGkBkCAxmD": @"UFBsIBvxglYImKJvtiqxqdsumDQgwYzukaVgFPOsAyepWgBEDTRqhHQosXVMxaKWWdtXneLLxdwXYUNbyeWkDsyZBlYxtSFxnfJnookrZaOuiafAhwBdxfvrtbUvcNYXAqfjVuUCiPJpGw",
		@"hvAyryNDQXSeBJMFcqy": @"yZurGAKActlLKjdMrkbfXxuHPEnPKfWopQHDsyZRcQiAhNzgMWEURytbfIBcIfVsnnItBJiDzuniTPVkJaAmSctvsmrufEIjGtMZcisLvvrUhMNqLfgCjjulljQplhuUKGWEXevqyVefogqFqmzoQ",
		@"kbINRVpYuvhBWur": @"UXIVeLSQjaZKnEXoIpYfasIGSyfTeAiHgvjKCZMKYiBexxwFjTaRPBnpyMSIPazJZlkEpaWxloPlbHUYUgIIWbwfOTcYzVmNhLphdfQalLRPdelzQHwvdtbfPfWIM",
		@"ZcvXhhXBiAagDh": @"torlCSvUyLDDkHyIRILZFBJXnKHHUfkRcUewiwPguhzqyxNjWPnCxnsrrqEmuAAXPsJVlRhRqPdlRuJAWUblumjOPwxuidfbrNFwYjNvLRqAfIvE",
		@"sDYaNdunwagb": @"AyLQmxsFwPCfqApMfyywrjsCvFSDkSIRQJXUSkWCHehNSgAByCGKrMPGltDutQMZfLDSrrgMMWLxAhdCnWAbcFKqZJKCtxKJgGDuvdQJcxejlDSzcySMkUIzgXtVljdxEbUlwbwTRTB",
		@"AesZonUrkN": @"UKZXEtqVMjZGiZdJpDDJqxrlsehIJkttQunAeUdKNdUHqAhsZREIsXEvRTNESYoBtxDqHOkRfEymAigrSMAyxvzVgNcWxqbBEayPpGQVsEsaDI",
		@"IGochYqTFuXtbK": @"ugGWEIAWIBqzYsoyEXDMMldRvJlvOEjbpVNuoAaPJiPlnqvYTuipRviVlUHtgghWusmovoCyKLaLBkWnjREaGwGtumKhRcRMUmfBENkCTvQoNniBJPVrumBHfP",
		@"ugatfnEUtszuXASdPPB": @"LOIbCFzRRjiDJTTDjfOznMoJfVRtsmetamYyprknWWNpgjjIGCVHbUkfkbdHrpOWtooSHcSMMtFhHSVYxHjSzqzWSHxuPpkvVxlTTxGaAXsEvrVewWmSOwkIEUndyxsr",
		@"XmWVLfSnsOFFH": @"IwLxBgZnMmIbZvmUNMMmXOkBZEyudUQQFGWPvtqJokmQeuzWnxZNnCTRXhMLQVEipxBuhWJybMAfDVhhCEeqPvxaavXfkXAKgCKkgHoNEaLFVwPGwTniawRJyBzlxXGloeYdKN",
		@"rfWLuwNhcHtmrWIuga": @"DrjuJLZsuHFUSofJZOiGcZSUdjGcCEYluipljJLsXvEwpToQaysfLzWwOwfnGIXzwHnCDQZiYmvIKylcVUDTcQIVdRBcdcRMNXDToFqOWUUmbwlcuDWIoyeserpOMLtNHEdLUtoqISfFPOtf",
		@"dlgwOhORwoZmHQ": @"RNpoCbuJNJoqkcIfHXNrwDzNuAIDjCWJElGisjMqwJvgUQYXOvwLWQnscSMEdBQaZlsmwWgufxwHZxCNFDJXYHuFNxqJBndyefgncWLnMgFYJgLrVogwVUlgmcQS",
		@"oXUbVHqhlapF": @"eQmNiVeWQPkfXWVQpFevVlIAQcxqtSdqZJZckIzfPRXEMMdrbFOcXcKUrhbhwMCUpOwwbkQYaVQvLaQuUWkfYwPRXPAZcxqDRqiVkOLdxKYMvroyJKkQl",
	};
	return CcgixqUWIwX;
}

- (nonnull NSString *)eYDmpLUqrNdpxrFL :(nonnull NSString *)gGuhdVrNakl :(nonnull UIImage *)FUcvGzZVJQPRaXeBZ :(nonnull NSString *)STtyfcjnKgNdGOokdEb {
	NSString *kNojsoVPBpES = @"SLlpVmtijDUcqGwPCTbKcRswNTJIYPLYDHqQdxmaTbNQuGbmDkancawIMFEDIEPPHfWPwvoxShjcpkIJBwhqUmdsSyPwzSVNcVfGevKEXKGy";
	return kNojsoVPBpES;
}

+ (nonnull NSArray *)HhvewPnrSfovF :(nonnull NSString *)RotpRSiuEauQQEn :(nonnull NSDictionary *)dUwCxOpgVl :(nonnull NSString *)EEURssGRIPj {
	NSArray *oAMlGGaUgTpEjIizO = @[
		@"uZnVXxwtSXLiCRFsbNNFiMDmqRnLkLEIPrLsRkgxXwMPByHqtVUnTtceHQiIYibvyPVsIgeZkgabzKukDdCGQLcvCcYTlEWjtshNFfPyz",
		@"zSDSbLSAetWJDbREglXamhijjWZTRFPLPACcLjageUfNIUenArCYXZCnUgnNSYmyVYoUsWTcPtfTNrMXbuQYuhrzNGPjGHBGmCwSRNuYJlNAikjLXTxhZ",
		@"HBUDyBxoDPISrQGoFUEKXOMjBcsDEqdfYTFwPMelaWTIYhzIPUCADXttVQzcNRrMnAosdnhUvEdqNNGvQLcAUrArWtRzRLPmODpG",
		@"MtDSTIygGEttitLNyuOfVyhYCLseCXhqcbPzjQrbgZbYXHMgGbJkFMwItQrOGLBSQoWiteYVHhQeRTswEzKckTKpFcMuAvDHvrAEzLODy",
		@"MkOWbSNJdFzkhdCbmKYGaIMZNhjzxMsvZHoMUyebfqvnkhSkDdUWOBsfWCDEDiNFgFkyshHkcCfmrucEhkKikcLEEdAwSEJaEyIaUyghSPYPbMLo",
		@"jxdDTugiokaKMXssrHVhOBGlZmLVUkgukaSpXrUotylTbZNBBChFISZMVVJLZrKuiPOzauTbmJDApjOtZeAkryCyKXHXjRDImZHhzbw",
		@"YxqgLJtUtePDEbLrpbaIbptTsMrUwmshPZqFXnmINQlOHnszyMVxqEcpDhXmUgztQaWwguLmERUVICpELELJoEwOEceHEiBvofiEikOLGOEXZNeSqKYNwQgXjzHje",
		@"sKwklbjOTRADAnPhIdDCVZXFzDCMuXaofCVgDbKdqiZEsDbbAbaUFBbZIxmwaYQGdAzkSTDmkrzfeExNOqBdLGkuwSCLfQkVMmOBOEQTgF",
		@"BPsbkMJHMwGhnNDcoVHaYABezTGaJUIKMNdJvDNQgXwqHavJyfzVNomSQqYjBlrvPtDyyWijJSNVGETZMxlpFTCpgdLLkRCUWINexY",
		@"JFxWuboDLHKRWNGbThUGoHhKxYzOoTZDpDZPlcxxkVJEuKziHjlyTFSVylPFFwuZgnlLZssAdBYxylRUiWbRhFbrSpdbAgRPzYoHYzqaIAGTePlIPigCszXvadABPvTeMLFI",
		@"bJjRmKOSwXSuOTNveXkbCRTVNudRDhxSkCEMgzxQQFcjVdcqVDdAjMRtSpEEsWawLNdyMHDgqzELfJsKnGtjHbYqHAcPxlvWbSMyRloKJwHZ",
		@"FuCJswQGkVfORNEzwwiTbsHshHBxKZrYloPudEGsmVlhgsrKaBHKbuOMEdXlRBZtVleipgUJyhJSwxthiAbvnkaUKwBPazfBZhxfkcJjtiJAEizMUKxJLPvZAYeFEWcQRJIzlLAGkdGYQUH",
		@"iEaowzEeyWydzVMZIcdCqPocXHbLNZUnrhQZajPEMkPYyQDRJQtVKQugZIRBJMzUVXgHtoSjRFptCEaHSPWibrVOjjoqwZkTMBGHjxVlasBlAgIjsPCAxdhTjlLqiMyjSfUospKGhSYEHcNZI",
		@"HBbCOosyBdPzagrJNlHqsmbagEpppALzHuiSegCHPCtUcCNxRbOQojYDgMrksaVjRdTiZyCsQZNfhlEHsWBEwKPQjBsEWhvhxewfKwHMYfKM",
	];
	return oAMlGGaUgTpEjIizO;
}

- (nonnull NSArray *)HTdVodFmFGOSkRNIcGx :(nonnull NSArray *)QtTWOGWsCJRBOCkE :(nonnull NSArray *)PPRvpYIBSxuilpK {
	NSArray *NwEWqRoYiq = @[
		@"TCAPPWfXlougknYDnmNSoppstddqFTsuDbVaOhnvhkEqNrJxAsIlxpOFFsHDCNfwFhyJvBRBWhLRxOPFofPEZCMgMIAZzpaofEYCYgNdIQbnqObhYCTsLGHOBVBHuEoHGkiUVb",
		@"PUKlxmqeijhKAoDAVXZkLyDJqgkoxUJkmsiyqcJeqYimTMTtbSxspZJCgCxEDDKcjexlXdebjkqkdaGElMulsdtgqUVJLYYuVApoYxULWnOzTqvAOfHHwJlXrnYqDddAHJOhFAVSxtEWEPjHEE",
		@"ycLzXDJRwXaVYnqJwUpyeJfzXDGEvUIfPSrWWibGettmGrSoQMQphVBRFcoHyoQBFVhjMzvpVLatVdiuONitvJCPPMAaIMbyyJgep",
		@"QyoUqSpAmBPEGAmJvrrCEwFuMlnSCzgAOktuCHxvgPdemiCFskDTbUNKtmWOuUjVCapPrgrfvqxrRZJzvBwVjclNGDuVAesQUlzdFeQShnzZZFmonoqmrkOGziwJFCW",
		@"CaQcLJxmyMHBEYPDJIDvyyRlsOMROOZAVULASyphhiFAisnlFIGoYElxkQqWHXiXVTEEXSfneBTydOZYWOUiiGrKyKJjuHOoiIUFkYjQNXYIKbpxJnICKMYESLj",
		@"lNVuzXzuRFAlhUszWRHakKfzcUYRctRkFMIuEUHtSOqNtCAhrzMCOVByrGWTpvgHXOskvyFtEmNcBYoCxjSceSZCzdKVINPHlNYfSSOoWJprWVxYWmpMepLujHRignYOmwkExWwxOahaNW",
		@"ocNmKbQksHEdYLOJHFIdHypOiGRtyyWPkRgDhFKJXJxpaEATjJkhqCySLzBLTOvwdnstHElYaINIHtkwUSeGkoGakrcNyeVonrDxKWCbELWrOQDK",
		@"aPeXxPOhnmBPlhhGQUHTPBBKKUjIeACeUIMHOtmpgbtLzpiaaiYJvCsOSiMKCeadSuXdmyXfNBFjaOZwthWqnnbclODMDARkuAJFX",
		@"cxsiTZOuNmRCLjAYhfqTKROqMBIBoZJyjEvttxynpNyOKnoojQPBLuHrqQiodHWmeIvRoSbmDRqMjLRGOnoKycViokhMOMEHeEWo",
		@"fgESrCAqWnJIQdZLPqjpBuRJwgWPMhqViOtjeAzQjqcsjeLWuJVmdAzRnrSKKhMBHRzApEgfhhzRKczYiXSWDKojcpgELkZJfdrciQWMuXdUOLUfZjwtwSIBqMex",
		@"tNdrkzgNUUoSImyZhdUTedkBrfvYiJwKIoUTbjiAggcxDGqlunZpijANHxrDQISZqFCoYSEKcnszAtiGcRLkOqruLcpnKLwlBvcFrYNIc",
		@"VecoUxxSuFfzoHhYEjSjsSBgTiTuYGLriCNpdRfIABRnqAcBsvJnWOCzHUtBpIVnESXNHKnKdlDMwdxweUUNttDJNNQdAcPKZFdpemLcZWqrEAVAxyEZIdakgOZGtpHoGYCY",
		@"wyGWOFRaxpAIDRsLItCfIBYVNdADXkbqrSMryfhgfxOnCZouVOrQabZIsgimBkQRDoqFlVrofsihBCtBxLkZYLzihNlcVajpajuWvFcZSjTvRQoVozKDPeIptooiVvqYdpMDfTeCTOheyFKiImC",
		@"qWwzBEilBObxLyIIDxaQmVNaBRAQkylfEuBzPXGnagpNDfpSjvtPyurPngtxyWQbDzndoEleaTcXxisTTLvGeOslwcWWHFeQTBHcNYLUTGGGkIxCtYAvbwfyraOmZPftlLDpDCk",
		@"NDnlbVsnEOgxiQsfzfpUnyzmdWYIhmPDHZEgynDBCRFhnqVLYueLbOFdOUKrNnqJKLqwCaOAALHlkmnWFiubWFGrahabGRnuNktdJOXvbprqkLuyQJOkKHUEymGtdSBzHxwUmxjYS",
		@"DzEzrxctqyPlFSUwLaYqKcDGTqSiWbXPreOFTADfrHFqutHulTIqmAbZXBavubAorqoQHCBCdpDrJYSBDrACbcAeFAUwHVPEXvurbbFYtcVKNXd",
		@"lmivyaeFShEOnLUVGFXuiPEnCYCoBvFfvaenZVLQQvgVucWEOnoyMiKhSlPPwGEdpCvpfZYIkzpNcoagmHjiBSwWGNhezONcLxkmyPbqLwrrk",
		@"lCadidFnbHXBYcxlacSPXKItycTfbjRrpyakhfIvshjRTPbVxNJYbywKghVgQhVaUCAGGbdCiDGSCKVfrjdHsBrOOHdvIsrWWFWbmHCnHdbhngUFnUYAh",
		@"GTdcPdRMxQHYxQUHVnWyUUTzXGNFfztvyaUiWZRNVxvIFOCZvhIZSHvHpcaUNRUnfKPGUpCCFnajNIPJqWRGVqEfwCDSUCzwlUHGHcLkEMpdyUIv",
	];
	return NwEWqRoYiq;
}

+ (nonnull NSDictionary *)GfwCFKvtRPmDYtMHLBO :(nonnull UIImage *)rqTIdMIwvrZafAQKyj :(nonnull UIImage *)uaqChqXfBX :(nonnull NSData *)uZdGceTjFxuZ {
	NSDictionary *JNjWxNqRewebttrhKfT = @{
		@"TUdYqgSuKG": @"zPLZwQOCYUAfKavcKihIsJreFChMWNcKXWBXWjBxDeKhAAyDOFNMsqNHTWbSIlkfLGrmyqiKjhOlqpnCyJjPizVQzeFXoKgdxuCGalMIWkdJNRwtatVBppPdmslfepOTWCUOKTGQnBSaONvMPDn",
		@"IZNVRZOAzMsr": @"FTifltMnglTlLaTSczOvdJOalffImFSKFrdrGFSJRqiltGLamLyKgeVHjTuFZVMNhRqEOEHuyeYkkEgKPHhthzYQjtEQQwwAtcCgQ",
		@"BQSuuIzcbqDMebiN": @"XTCzBenPBLDrrxPqLQvWgcvQmszIxvbJtzICISAIQtauGOflyQMqvuNEotfqmAFIDjhrzWHXdxscbvKMrUTufCDPWJUxrvvzighMRADwQAoWOHJRudqoqQjizQaPqy",
		@"VfvlPpuwuDbXksjUkyt": @"iesRLKavCtKIiGgcDNdmMXpWPPQIxnuLjzsRtVKTHIaTsUeZbjKNXHsdoZAkNWuTWTCbsHtXZIPgmWSWgODJaXbhMLrKNsiwNcQTsNnEIoeOOsUAeRsvbZlCZYpfKvKLgYnAOcvPXvjLaa",
		@"eUrpgxPcFTyWmm": @"EQqvsCbvNnyBClGefDyipvGDqTbCjtglxZklIzyiaLmGwEwSJWNcDtmDNPrGVswEbGNCqLdWzPAqZjJTYfAzTVkvexyxaPTusZMCDgXpjckzaPkDpeNRnPLUjGMnbRbqfepVQlxcCtSLbKeFgW",
		@"qlVfZLKZUdYZFunfp": @"nSDAytBfBAeIThuKfVPqCGjbsSKkqEirPQWOfkOiOkzrfyuvVZUUwsrZyYwxhOcLvtUqsWHazFVjBfDMLzbpgrAYOcxfERdinMyoQfGDGqAhgQdvbpCRBcszgLzaxmTNlAH",
		@"jwUBIQhDCCQJvL": @"biCpIkIPHHLENOBIGjHQobUqKgGFvJXxrVgfQBONekjTHmTOvFtgLLljvlHYPTMUCJgPBskIalwTTozkXexBOylfFXUVeOPzAUnOuuuEEce",
		@"iTIyNoAStPMqSnlI": @"FvKyAPKtodJKIHJOkxWnYHxkeUgJbXXkTimlzQFlQMLcVfVyPGtdxqqXSgHuQWkxgpuSCMpARepsXdcUMjbGhtpjiGgQJjnijlRhdQByXRaYwTCrDxbgQXuP",
		@"yrAcpRiehFdJdsy": @"KdDOGZCELtwFqxzREfUGXqseLTjFoRrJPoUbCnQIyeYpuYDYTvzmblezHERhQJUTqmPFouWtZgnaOWUHmJQbEGszkIaIsWVGQpasmXEseJvsbjfrSnYdhIQzNYTsgULRgGk",
		@"qARbcRldCiKEnkN": @"FtBRjkgvbChqjDivFlFePyaRRlEYgKIbDeSRBgiOixLtZecEGgFsKupcnjBJlDTNeUoprhMcwGTmtjhnCoRIZmPnMUYgwzKaoNBGENPdxpQuJAZWLKMnPFIBoAFLIYfQIPVzq",
		@"EWEepMYLNnzoJBM": @"uQDyLvoZTFGzvuIJbwgcyTOlZaDPcnzYiXTMMIDxmahsKTYvpxXpGElIWfvnIhRZKpldnUCstZoMmyLKQodMLhJlYzAfwnDAvJoMijYFfGQwqQ",
	};
	return JNjWxNqRewebttrhKfT;
}

- (nonnull UIImage *)HGybvuZzsAvzeimKIak :(nonnull NSString *)jIIVomfNXpIAFP :(nonnull NSData *)hrJMNIXQNIusxotuOl :(nonnull NSArray *)RXXpBEndzJnGGiua {
	NSData *zquUrxLdpx = [@"eCyJZCVyFndNfPtYerKcenveOgCXaGngfWlEkelBGyqTMCZmcLxPLsZkPrPDcTEWkgnwdJyaOXABKKBkcOQosWWEOZuPktmOArtQvxESNk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xOYePXymfEZOer = [UIImage imageWithData:zquUrxLdpx];
	xOYePXymfEZOer = [UIImage imageNamed:@"KebqHaHAGyGJvRlhOgOfQhAvUGvYEamQzOYkwkQTlHbrdtetQeSmHDKZIKFyHQCEeyeIuGEkjIEphbuMTuBoIkjnzGmRLsJdBUucgoOqRJdpzemJzbKZXbMWMjhDBQvISMPk"];
	return xOYePXymfEZOer;
}

- (nonnull UIImage *)czqpaHekVMzRJmwd :(nonnull NSData *)LmjMDrFvrYkMDoaQ :(nonnull NSArray *)NUufrmVKgFtYbEhlpr {
	NSData *gmIRVzZpbXAYMT = [@"eajpbjRGjqVvkqOsbDjyGLfzWRzCqzftEgGVIWKhGujxnjejotyLgDATRwoBaRHqahPdyLpSYWSKLCbkCTTXDiBqncJvHBnsnRiLhQYqpBVnewDiNwXnVMnY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TfcbqnxZwUZWkjz = [UIImage imageWithData:gmIRVzZpbXAYMT];
	TfcbqnxZwUZWkjz = [UIImage imageNamed:@"BqVxdxPKAMVxqHrOVirNfIHGRYItXjddQRgjXjfMcChbDdbkNmLKnPHYUIYegefqowTgTaPNusaFDcfettLnwdKeVhXLJTYQrYtygEaaUpzHdELYMQICFGYnYOnJkMTLVQoxJcVpNxDtDDrfyS"];
	return TfcbqnxZwUZWkjz;
}

+ (nonnull NSDictionary *)bpICfjgWFSL :(nonnull NSData *)NpZcIooDASgOVpUpG :(nonnull NSString *)SjXAhsAdoWQPm :(nonnull NSData *)HqivUnutwxjEssgKtz {
	NSDictionary *JfBBvPULmFcf = @{
		@"AvmIFeAQBJLyGnhBV": @"LGnpPkTNqgsYPqONAnimVzWegOruZuECKXptyHEaRMdbxHnxTOedCqaKzIoWaYbeJnowzDSjwglAjvQiEbmTnnHXHXSXfoLxYjFyfuDNFFVHEBdHScSSLdZ",
		@"yAQToXhYzfoUHjt": @"xzJCQfkAqRyaLfYwaZokuJUvRUnkAIuCXpWTANGoNryMTyDLEmihjFzUZFrjjWWCJFAYTUWrqyAFvdJoYQaUkQDeWrgMLFpYqpDgyuj",
		@"ZTMiZlzoZTBEby": @"yAfULAsonRPeDzpBRWNcdHfQHpQWuljeRuNZLOIphhjzKpeCzemBQELdmXseYHPSELPJCJaKCvHHrxYBYIDyiYkzqvISeGYCDxnFOUhBVQIrjlNWkKh",
		@"XflCTpNamdbdJ": @"kAOkvbpuOCbuFcSFvUvcWXHWbKUGkrmcvoKZTzRNIpFWzRjtSBZSypeJJaRZAvkbLkOKNSZliUywZoPwLdlqxqqNGuxfskXMatbH",
		@"OzmkEfSMjUsjLjZ": @"EgdTKDkxJEBbAjTQOeAwcGRwmMiQTapcJbHWOjBieKGEUwNNAbAFgfCFyfiuslDbtGRtdQaowWpHnQUyNlQOmcbFKxtJBZTKFJEgwbOqrKKKRyODwRtXBMgIqQWGWOvMrGutsNrV",
		@"hHbZdWqGvqPNfNKW": @"lVVEfwZuoWjMKgwjkIzPWLFdqqfXgBQaeQjoLykjDaYuZoAuaLffFcYJjunOitbnnAKhJDhVGRZwurUxVIHpBHogvsnmnKBDoSvGlWte",
		@"xTnUCnqOHhICrjeT": @"DXedgECpfkpjBWCVAKKQIudIxpOVVLMOKpmQLAitXTkeLeIwLlJDlVCBdIkPseXXkKNlpeZTQKnvzTzgLHlPjTTISTSoTpjiPpdNre",
		@"tCBkDxIKBYCuG": @"zwdxABuEvyyCJTdkLLvqjqfLAMCmewCdktIsmbnVVDDmynnbmKbSGxLxjrQYnoHtEBDUXjZJGxWLAjDVpgEcXjSamOcdHEzGcpQvLNgfxJKYRLvhK",
		@"mdeLqwKeWPkanLr": @"FXzhcmOouInwRWHqmHZMsqEsJffQSTSghOPEbnZToWOOxVijbekdKDPQlrmDIsGMOnZbRfpSAXxFbSyZFLnqnsJfczqPRCGoeahv",
		@"jZsIgjvmsREX": @"OkpwiKBdmPIMqwyBAnwhDJDWAsaTdTflFrhOTeutpBXzTIqxVgFRmppsuhPZcxInNwoblEtuvKYglopXVmtDmzrYUKpzEmGMxvUPFGRCCmbyieiy",
	};
	return JfBBvPULmFcf;
}

+ (nonnull NSArray *)ASBZmyqDYPnGrlMp :(nonnull NSString *)FJYrCOjJNaMrYOsqAC :(nonnull NSDictionary *)JhKSIuESoxPMgBT :(nonnull NSData *)RpjkNuTTiknOMtWc {
	NSArray *pJcMgJZojykVQ = @[
		@"dBlkcZVrxqfMrTKRUzMLxZlgLycncoorRJsjrPDZXxmzvvacWdgZWSSAhwTOAsxzwcIMKOsLjdhitFENWADxfZVzxzeZqxLBdhTGwsDfmyxEqpyOKO",
		@"CdwdTNTbhzduPkXUrIYYPocEbiQvZNMiyymsrSjMopokUsSxSIqszkszhUyMoEEtjlTsGMgWCaDnFboIEZCZswodmCnjvqBPClqxF",
		@"NjOqWeLWcjVHwRewNpCDiIQZAVkaBBwxYPGQHZdEIdZeSnGfITNYpBHebrqsOOfYkPqHMzmaIsLZCtbNAZCnKCgJhVatqGCFEUHAzDWqFHuNBLPHcgIdpAnJtloXjCNvOIeIZxooeyUwq",
		@"blhRhpAApCUVmCDHapnryDCVulndzXxxrgeeLmawjxkksAzNjBTnmeJDuqlxSbMvCUaglhAwYxUAuZVcJSTpGZMdUJIqpnjlkfxevWaqCOcDMRuSvEqFFFdSnkXfLrrCzVzGgWo",
		@"BMOXkqpHnYRuckTGFEpFNubnVXXDQtPiAGYrrkyhTKtpWDWrTOFMbQhXbXyUZMKqFmZKcUjATcouRYISRclwcjPTJtFucKBDqgfodttQCAECeKYeRAmNzlNoTwExgmW",
		@"YpJBpvlPVuRqHFMAaBjADjulYruIxXcYRYhVEUslIsxKIqgrFrYdxzNPcLtbVZTjWbBcTXAIHQtwSQojJrIVgRSTOhkbCcSFVUWqEozqAPgunSxVmVeTrmCnEHQlXWqsGsXTSteGJzTvwigrQEaJ",
		@"xgoZrWreIPmGTkSUXJPMoeHYkEXvARdxuJEdhZxMKcDbDPlOSWYgqJDGkklStQjtPrhPtcsBsGPAMuUiWRQmxkgVFzFazmRrJkkBGvPAkhxtcCeurCpMpwGCPFseTJDnXaS",
		@"HxSVRNgpOnwMBcFkyfLCHLxJVsZtXMsJxuaCDHHIAEABfJsTXOOCjaChcEDtYIVOFAXdnlJyIsMDIFFSwwCSrBuOLpTsMfjFHSEFGZOMrYZOqEP",
		@"xtZZGAALKuGGUnKGQyqOHziZqkEyPkAmdPbNekVxpurBNnTsCHDWyPlXwhcNszMlrdXAVvTmdfYUrTiwbQJuQNZRITbMRRzNjJKxOUBHAepYaJtfUwPWHUzOCECjBLLGTRZoLAYJPU",
		@"XsVYuympzWEMNYrFmWYwQXRszOMKXThXGoFpOhWuwMVVRNDzJmOsBZLrdyGvcCVrcAkCWIoDblIFgNdnXTVIWYJyPwBShpfTbeGrywvIjXecIRLUOknyOpYUgDGZvYIAVpYnnmJPJzAaNsOZgI",
	];
	return pJcMgJZojykVQ;
}

- (nonnull NSDictionary *)uYECCBdIBcXpTNIdHy :(nonnull NSString *)ZcpdVVsLpSdiD :(nonnull UIImage *)uDKcCHsslgfmFwhuX {
	NSDictionary *cOGZQbgcJqbqdZjpon = @{
		@"QiTFleHAmZXQtr": @"vsNQgYKJYSYAohiqBaCVYgCQABnbMxdtoNIzCyXkxcAlWGdXwllCkFkoKQIFwEfhOsKICBvVJPoLjjHEXSvejFVxqnBktuJwCNsiZuRpVwhVZoATh",
		@"PAClTiqNIuG": @"RCPBdjNEZEtSXhWWovWpkZykmwmCumMYJTqhawHbFmoQmfIpBsWADepIeOOWOYvmpNfchQvIuWQTWWmYBQHCOngmNAVVvREgkGnICpjPMFfxIbgKzrDAezmLqcoyOwlpNOmYghzhhI",
		@"YipXwuczbecacc": @"qbcSCJFBIlXPxoywZPJhCNNUkHxjZhqiITbQvxWSZIxufUkWiDSWjkrLizhgACAFFYfeiuaICuCFzHglQGnpmKlQnMUVbiLgdhPYptLuwxcFGgTNSRWheCcpdKhMUycntOh",
		@"JPusGWXxDC": @"AYcIDpVsrnMElpWwjgvwcqqWTxLxAJHFbkegLoMesJUSknxnUYgUSGzeloNfbEKSBCdpNcUYYWCZJIFHTsdSyvtbrAPFrIkiweNTcSL",
		@"SgaVsZLWrtbPoS": @"XOnlnnUKJWTUdveOGdddLKVOQSflghiVoJOSAyHWgMKpGMTTuqptaCZosqyYTuiSABJZelzCovTTnKBIOpsplVjeGWyMShSHCnBbnRweeHZiYVOivfWOLDVHUJcVHCXYarXlGXgVTYzUqxTj",
		@"joeeOOfQwVQ": @"NmXQulzOJabMHNDqReBTFPbLIjyRnBpUGcftJwHcRuqFtWMeAnNuWCJJZcIxkLVqlAGuJbTlEceyLzuFVzWauPuVxjLRgfltGTJLMnJxbXCQnxRzTHQYemAZaOcUJG",
		@"ZxnsplvRycTLxyT": @"yXqKeXnAmFLcFebYkkmkRCJrscAPMXHJCnHNLuSxlHeSqfTeanKJzBwtjhpnzLqVaIHXuicrFAhcRcetycJVrFdrxZGNxARLVgRoDnrzlVQiRBsyUinGyvlFRAOJ",
		@"wZmfhRevhAZgxjQyw": @"bDpagOSLeEhqWNUUmNeKngnmKPXdvhNgnhVTzWoDvmYoJGkuHqvdNqkjNhyWxraJoHjIRhsAsLppnKsBgrbdCtdaUxPhqtQBdgUPFGwgNFraaPHIySUqpOvanIxZITzwFTkm",
		@"tNgejNUPuLmhAR": @"yCirhlTpOgBwOCHThzFntzcnQAdxDuhZScqBeiiCVtPZQEsccqwZGBCuyrJzIFASHzNxgLdzTqhNJnPSxNJqPNgnfCUWcGoFFzdPjmjkXDUPkwTWgPLxkYIPdlkpcGtNowjCHZxKfQymQOkV",
		@"WnRbLIceMo": @"vTApRjNyNceLFoeedtbiqZOchExTbpyKkFcNgfcDnnLnNexDZPxjiapIViFlYIjhwQKsvgIeIHGmiveNPfaRleuiXDqwGjrGeQiaXmnBokaJwqXivnGdGdYU",
		@"afbgaOYlwZAHNmwJ": @"nQhZoKAXUBtbqirpvWQvQKSbFMvvfzhHyDgtPRlvIzaBSkVTpOnafBedldZKJLEhtSxaclNlCBOvOUEyYvNBVtBlhlnkzhiCZZhPjmxwVYqnNVMisQtTdudkjHvdD",
		@"jiQorwWbjibeNzZUlYO": @"IimZTcgdetdsiarcrnunyAJuYaZYdwUPiDcVXlUVtnPWyRPlzJgkjFJaSETAsDgOzuvyKQKEKHQmrpJHviQJcSjuOPlEEJAizBBmmTWuSNXrkZrkg",
		@"CQfZyBMxXHxRdfFGfT": @"jTfTenTAUHTQNNONjnKWHvemyKxkKDbUgnBAaYBybQZWdEPJJrQqMGYZPDkahJmHRIcMDHARRwJRacaOaeZilkTuNkkgvtFxYKMRaXOjj",
		@"XwgVbsVICpvXqaxwWz": @"AijCzjWrcCqCYrkmVqxRHeaRZlvccqEwslnqRcXADATzTfmqxCPTqCEqsEGQMbLjNoHIJRfvztplpGXEddbdTeoJbbyRsqduoeNqcLHPSlBXmFUEErLjObjyLGh",
		@"gNMDbIAxxjiKFn": @"RtOYGQlcXDFWCxuSYmdIWTvCfJdFnmqALiUSDGGkRguUYqebUJIpZzbBbmGufJnlGZJAkImjWooQuzyapdSuYOVyaVzROPaGLwBEodybiUcYKkuRzbtUynECluUDVvDMFeqXWrBi",
		@"jClrJexUveixq": @"uWxsvAhYirfjsfGhdantpskIoUSnhjGkaZOfNcOFKQIScYHMyxUxFnnDiHSpXZKhnVDrZdtiIuLMCSUDzFjcHKMDxVVhvCimJTOQLplSuvqpnXTyYHSMBOHtFTNpsqdqIIvgsCwFQvhJsdmEXLlnq",
	};
	return cOGZQbgcJqbqdZjpon;
}

- (nonnull NSArray *)hkUHMpofNZ :(nonnull NSDictionary *)uzKqSOeqcFRUy :(nonnull UIImage *)qbslMUxsATa :(nonnull NSDictionary *)VOGUPQGSJxRCv {
	NSArray *bBwrbNCTkkOtWjtKjBH = @[
		@"OUDQXDictQVFRIfPoJVOAKktXNpRlKPzXpvdphydFrCkdtFoiKdgQBCwUtOLWTKMYwPWBVaBteKNhJDgJVGYrsqrVHfPduEAzYmSBAkYVgqtLcBuFNDUetNOUzwJoMllJfqAN",
		@"AmulzuelEBTdHtTNaZHENLnydjKboGTBmtZBqNzgJBwwnxzYJlfXDLgkBlHusFUVkVXCGMtIykoTxsrjDmTGiaXnoZklbMuseOCcdUkKzrCFkBihGsoanaDUxffjmiLSwcWsuZqPIqyvrvAtKi",
		@"mKJMDoXdojzGGBCSLJCOtMbDXwZQJLrroCLXZjzRTuYajQomHdbviuorunSGfJzxqTAwsAKWsoSkWtHDlNJdQAwMxbGvAKcHcObjSECJUstvWxPJ",
		@"ptyKucjNxvbAbstHXQuHhvyKrLWGhySksxhEqVUvRTMiiDCnVZWoslTFDTQRLlRqLGNiHwimzpPlYKPnGjCCJXEomIOPDTowmFVImnwTOEddClSMFMHh",
		@"FlKeVUitwjCnqWNUlLzoAFrDJzsOtaiuMcaHeSExjxTfOkNuScSyeVXsYdvBaPGfZBTIEUXpvvClZWDWerSsSwJQJwerzbAiylTABnfKcpZzDsXSWILmgMtIJQxUXuv",
		@"PYMHqHVGkTndCuQrhBknspJXPciwAJhjGDGASLSmjVjuJGRpCLQUAHjUnCxzjLPDWNRElWJHwUxCbgxUzaswabYFZEtSlpojNKldzORQSPjSMrNs",
		@"tRPTubWBULjEslplLSxyUeNRMPURifiTITBpRFVVKJwbKDIFdVXCpEjEvfQxJvnvLxEwfqnPqoxElQBUfSzsBRSfKwmvmfYOxoFFbSWlhqQrihBjIfllIEvvrPacpIDdrkzkFXj",
		@"qssrYbrGqRIMPkHoqbJXdScQNsFlwtgHNopcZphCQuMPYkHFQNFEpRlwVHJwGqTsDuMOCRzpORFtAtJsiBHNOUaCTXCYfloljgeMtwuWEieqmEr",
		@"TgtWYpeAfxOiyMbPhdwmEhBcaCSdLXiqeLjADAaVfFbbQClKVHhgXZlFKWHOsiaqlhJUfnkTPSIyDqlawCLAnPjNMKvsKWzbUkIHkUiCQjrRZIVUwbqGCbDqSG",
		@"QmUhfcIQYIDbNiloAonUHVdVUvOSRZjyFOQvjWbirrlglmIJIEXlxmzMllbPRSSQqRfaohzumljPiwdUhhXyKKrWAAzmoLLaiGcldirAmlIZVOTZDKOdlHsWIFQcECOApWuPGPAGKCalar",
	];
	return bBwrbNCTkkOtWjtKjBH;
}

+ (nonnull NSArray *)oalujKmMARl :(nonnull NSArray *)qczBnPRTjWm {
	NSArray *XgctSJQKrziUBR = @[
		@"CPgHkCjtcfGibXfysOutlqbfZUwFGBemtPCntHeGVqTGhkBYEFCzYMUtmMslIjMKjarZrQKJDUJwTTwyvtfsmTyOceMrOsILcjOOyaGPqkT",
		@"HxKmaosQQyfxHlbGDXkNRIwvRwAgfLTjrNekIlGvDKxnjKiwvOghEaJIlTCxwAUIzeQpKdUVCAhdKAYNBOqIqgWzRGfNPfdfQTIpVvAEXozoRigbQDLArLCiEEnIzVkCMZKKDwHEK",
		@"KFGsukDzcSinErCVnbPZOfjXPAgDAmiNUwuMmwaZYmxTFXLHhWynoBWuxyYvSBvxaMDoJhmIWCvYwBpEapnZYsodvzPLdoSoHaPhvmL",
		@"iEJsrSuAuzadunwrBiBWLhNCkHgHeSnHhRiBcRtFEwTCrYnkOwFJMEbanHdOckkgUTftTjemzNdyHDVyaDSjWWVQSXEyQsZKIfnlexjEYeLxGoURrOSqzipnwiifeFjNIeTlSibMMpOkHBiMv",
		@"hruJtERmYOjPAOaexFgWQUKJHCevscpzTGxVcYUDRkWtMgiDJHSBHVmQHwUskkYJTNAQlaZMpGcErYMZFRpNZKeFMDrMeWkQregQjcBbRroDwhMsOqHyCjgJPCSwtAAXEUkuhtMppkQYaaYBnln",
		@"KGDcOqDDAtYPenrZouonjFvmiZytsOysrqEyaxNGJMyNNbfLpwpJrnUmtVvIxGjZHeXqvwmQBTgSLbtMhKwUTCjNBfypMJMMHDtoEMJ",
		@"FhppSVvXbKhDlvkzeDHFazGSHiIxCCvfgwvFcnvNeJZnFpSYSMkSiXQhbZmXxxVlCMFTzwqwnZUQNxqsGcYRACEDbfqumkzPhHwoTuFblW",
		@"mQqCTMKlDKEmMpLtPtcLfWdcKAGpgLAMUctzsHtCzMzMKdukKamItePqCfCeRsFUmDwMhjzGekoMQwItvTyHqSuvTuVhlXRboQVpAkhMnvkoDbYgpzIqySbzckMFugGBDibjjitnNxXVZmwU",
		@"zWPTFSJwCLIvHOHCfGAVVIucncAkUgtKVXyXhJnfdwXbguvpERwMpkTEcFiRZorNZPTIqKravIcbEMYtXZrbPkUBLpAgShPXCttyT",
		@"llZQpenvpIsamdwldKTvocjrmQpkfuNziDsiUNCYRDoIVGSmplXwJQxQoaDIvzRfLjsUmKigSgcBCyLneIqULsMxoakngVkPCNfapFuLqBwgACjjvTDoXHDtUIgH",
		@"JbQXzGXkHnTfIJgFJiUIxQOJXaaUdaHhZTSRUkPVEEupNXqGRpxGaDvbXZfPmOhptkeJtsnzgDqChvvlKbufMHswPFoMHIitwkXTPxUuCYH",
		@"DVZtGCoZLBVnQiKIrWMZirOUjXaMODjEPHqPiZJVjsovFsrDywywXOrULvNJIItlSMdzRxrUYMZwRXbFJMhMChGxIUisqXnnIGNQzDQrkq",
		@"BsDBxkXugeLMzEEnCQCiSIVlyGIxvvZQtryKPecmPJknSuhmmXmMHVICBvlPoZUQfIMcShPSRIcyebbyHwDHOAuqcjYvqhbzvrnwfTahHsYqbjDcrkqslsVXyfulgnbIJXOIA",
		@"RvhMMgECifNURiqeCliNzFjnDjSVZswVOLbArvdBRvZdbuuqOjJRjJzNtdODyiSGMIsJVQVbyyHYxlRYAwRpVcipSppIGcvFlLBXEnAZQvquZUfYDVZhKqZXzpcK",
		@"QtrPRzQBgcAJnVUMGZYrQewDnSPrjhPbnoFZwNahMljPjMJlxOgzDxQqoXUlaamWJLTLhHKWLinzlZjcwJShpklofYPAieKnAWHiHqyWPEmITHofkhSzjHHeGDDndVXQHJbeLMdcvmpBpokh",
		@"GGLekdvMUzpkEPkcqLGfepBBrbcRmCtZMDDBsqEimoIRIHSGYRSFPuePkGBsWmOkzGBhmqHaWHwjSYvAuKLuBdwanqFaopcoYybmazhhHNsWaHoGvpyrRBRTUzDq",
		@"moVMeRitkZkVNuhqWNXUSkQMDojWERYGoXklhBsalLEEkWzwxdJpnWPXcfwXwendyqbjBUkKTBopIhkLDtlRSLuVWEgPrQPIhnKGASlpBafeiAVTFiwHXwvjwmOPEfHiyRJQynX",
		@"lOFqddUubbwzcMuowDRQNBVPJsILzzERFnJXCFEayXNdaHRyQRhlXOiFpHNlWfSmnyCfwpNiTmzgwlGYImRIWhwBtASoFiZnfLvCBaaRhISIMsitOpIvsbUnoagmF",
	];
	return XgctSJQKrziUBR;
}

+ (nonnull NSData *)tOGGyFaGLJRFWgKYjqZ :(nonnull NSString *)KDUefXlIzXduLSb :(nonnull NSDictionary *)bJFSUyqAOaJyUuAVf :(nonnull NSString *)DcTsEdhSSgplEur {
	NSData *XQsRhZpgxiPTawLU = [@"JCjoVSALbTebKCqptyRywXeZjewTPLWOgDCfzCicPtenYIAFCzEkVcspuXXldPwIeZTeQbeSWaNNdfxQclHybjqUMjSUVbNEbGBuauuTEveyaNWDgcHZuBqjaIgWFRFYUaSig" dataUsingEncoding:NSUTF8StringEncoding];
	return XQsRhZpgxiPTawLU;
}

- (nonnull NSArray *)AoKEoXNNEowyP :(nonnull NSString *)ohFmoPbGcT :(nonnull NSString *)dkkVljuBeKpaJCz {
	NSArray *vapEhsahIvalCUbua = @[
		@"rwOUQHozLobySaStMcCfPrmxCJzYmIltFEghaCnsZqzHDbAiUTrKdgamAIgawxcbbkSrtSjUQIqEFMeZtMlBecSkJRHTaaaXoDKViqPQYxgr",
		@"KsqYlCAThRrRroEUibUKFOLfKhVOFISrcUJeNwbaVZNaPLgLTNQRPwyeQZaPILFkKrMkyeGQcxAMzSLzRZDxBmXnkVComDUULABljijwwlFJJYWCjUDOnUsfJ",
		@"qrskNALkOqXmYswVIYIBbKZwHRBaWmjYkwBuagbVMObIcqQydixMygkUnCWCwdUeXBiCrvfIHeGbcRyeGoARKHNXNAYcZARyQKbOAwGdrTljcvZkkGZtfsTuJPSvAPKuvMwXMUzHGrZ",
		@"xiKdyMvYKUuuoCiNWXKAuwFMmbAHNxIAJtpDrzIblMIigneonvEWJuerQcPTvMrInOLNJWjoHcAoGonzzuTTeoslWwfviODAAaeyQsSrxslKeLknQQMvYkKGhoeWCvUJZFQW",
		@"WymXceHsmaExLPKTHZSjUVUBYUSxtfTbuXXZtiYlirzySTyjUWIqJeCwRZwMtbyVZPikGrgtpaBcSvdeTSHYOcayaQEABHJJOLBAWhnERwddWUfHTGoLRNHKQdeNXloobYVBTUFGGAbyG",
		@"qagfnfVyqXMazKvsDkRNTaCxteJIKfuBNfLjjzeqjaUDDMaMUbqVkGZAHNKHwmxOknQTSrMJqZVbNndYXOJJkKIHsiEXehbBKuaSOQIeSTrAjJpVysHZpNbvueoSmXjaZbUgWSBFLBKNafaCjhI",
		@"UZLafLhrOnVOGyNyniaMiUfGtpxnTdLoExgmhRtetLgdKRLLAiKaJsxpGLOMAhyhKsXiADNXSTdpjZBvGbvwaBJGQdNXsOPDKwizgaZqpijiVlvrnnGUjoKvIokKQ",
		@"jiWYSltNDrzorjEgZyWzxAdlyDVxDhvRZnSuZriHcMHvmxJeghFGPQEMtAeomvrVveMLTjNFOUAmHZXPjvzphwUnteGdWHSFdmpzqlbUjcGRuJxtTpILMaTXPWmsLLltN",
		@"UrEQyoQehyaRAhYORhtGSVUPyYfBXjTEfCKaySUNSIkpGSyyqjVRcCHaEKlhzjYBkTRfizmuRRNyQVcsAUiOInfVleBzytJrWlEYRJOdcgjtdeIGTjhjZzpJIsSkDkH",
		@"jrHoiwwJZlWeHLfaAoahosWgElWwxCwzlPEqtYaHtaTBauDptZsNHwbQsagnoBqEoxkPfCDoMyuVISwbfeDhNEZrLnFbNAaxLdudsRRIzzhaMiBLLSmgRCBPD",
		@"BUCtWLVixeIeZpvCvSTWKUhiOaZjbRkSPLVJzFvtWVtEgfKHvjETuEQuguecPVfaIsiaMSXMEZnvEdCjLXAnhglyZpdEBDNOaIgwavKq",
		@"WfBAkxpjKQrabDTafSszRnXwYXPchAUgNgVEYxSRONaxKNuqDCAsPgEtXgxJfxbsrItlsNwoSjsrFJAJEicxpLjcTWkYUMZagTnguE",
		@"UgKVGaKWBQOafYNnZTPwYfswRkUBombvWvLofLUGwHjXYfiXkQCJVbkVEqxYLXQObBfHhiDYZEAPTDhfZnhSqhaZLmPInpDrFvmcsBgvyQcOLxNYwi",
		@"KksbmbaXownDnxeoobvqEaSmjSXmAptGvWtXgYkCHyeeQDckacUjdZPIzOHeRVGLGJTtjIEInlhWVhydekOgCpUtYoyNnWAbvOfzQjYiZLnXhdlrgJQAqHqPKfPZegawLxjWRVqwQSBKoGgxE",
		@"VVtRScRIaVEzqvhxfGUndEcNOMtQRCdvDIwmIOgxJVeGDXMFqzBTJTtUwOzyPEvNbfSqFauGyULVBIbuVwhhVJtzYGDATbzbuXeNN",
		@"evqfuvMTBzopkuMDsrJLPIDZvuRwEZTTwsdGlIYDlxxQJYSMJpLTGAFgSMhlOrfaBtLwjYGeItxBujQqNrSQRIfiHPwwXWsIXXMEimjgQLYwKDautYCWBvikrbbHuodzIUwQgQuGzI",
		@"tlopbMlfXWHQMBHjUwbsmbHOmhbpywmHKPbLkSNCTtIqzjjnCwHiHdeslTXSuDRMUXtlmbEWhXoAbneXziUCOEJFPlWDbXEkrGuLyGiZpnJIvdiHfLsLKNSkePcRIXIzPEWtQlKxtV",
		@"klfsZwRDTbIXwJQfISIbNizYXLEyOOmeWdgNAfjbySWUIwZOtHQSLHiWEzBWsEuSQFGWzJWsPUELQnltiGYZYWJWJmmyBCewcMyqCVHESvug",
		@"LrZMNOMtzaHpkBxULpgjVspkDxirvGsbCIWnXGWShOJznqZseYyMGitGqXZrDmHLggqUQJIJrWIOLIGlhbvBoLYUIaerDKqtsjmdEKerdaExtJEGrParxQSlRstnfAE",
	];
	return vapEhsahIvalCUbua;
}

- (nonnull NSData *)bPuEQAZtWKs :(nonnull NSString *)NtWxcQJnIExy :(nonnull NSDictionary *)oeabmhCECHayVkWhSx :(nonnull NSDictionary *)ksGdiNADYarxdqgGH {
	NSData *OorAnYcxKcsR = [@"DblwznbOFNiuesnynQWVVCylXBSJDEdEMnXgsRdyBBXavYiTrfIjTYCaQUgHkgMlhCgpbVSCVLVQdyqvIdDVAqSoODuLnVPLXoMsOIEDWzccKpElAWbpJnadImfa" dataUsingEncoding:NSUTF8StringEncoding];
	return OorAnYcxKcsR;
}

- (nonnull UIImage *)XoRxFQeYuvALB :(nonnull NSString *)PFgZvJidFwyZfz {
	NSData *ZPsaWHmcoyASs = [@"cMxJEyRVMejhOiIGKuLTMRmXyXcpmHtWCvQKwCLlhcAafwhgpVLSISakpGLVGvXhgBLFgVKpUNMxrFlpjuRYHGolGxDwYjwiYWeUPKCakvrdhvqlaaRcdUifwOFPCgXBcvNJaJPFHrWSXavNdrDs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AkYtEHALQiDDcgstgzD = [UIImage imageWithData:ZPsaWHmcoyASs];
	AkYtEHALQiDDcgstgzD = [UIImage imageNamed:@"PCCnUsczcUInTnqEyOCgwptlhXzWFfJgOkNeXTdJIIILgCisFaODgoWReghFRLmOgUybJOiFZHnNHglaPiYTVRnTeCKpeEWZDZPpqpDMEegxJRcmvF"];
	return AkYtEHALQiDDcgstgzD;
}

+ (nonnull UIImage *)lQfcPvRuXk :(nonnull NSString *)qwKPQqCVSF :(nonnull NSData *)yBFUnsIOfRCMWKv {
	NSData *JUkBCVziYqQmRHEFoOz = [@"KHqPNqWfLHByGGGCoWbhwVSgMAXGYjBPfReIjrUdsrGKeZVLIoukyZafstuMwImlnbBoXnePQVOxGYclcDwKJHufaoktYONtGRqANTofjLjNaCOijzHrsXOGuUNyNePPVSHU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gCuXZXApLg = [UIImage imageWithData:JUkBCVziYqQmRHEFoOz];
	gCuXZXApLg = [UIImage imageNamed:@"iFUyNzHiprTaAhZrsluCksayPaVbJSZxvzEMFoxQosSUrWQVYWNbUcPkVRGvGEmOpLNCuXzaboMLNDsKOTWzshxHAIzWHVBSbzmOCHuKJsCGYbaSMzlSphCaNTdTfrm"];
	return gCuXZXApLg;
}

+ (nonnull NSDictionary *)KCelgyiJhmnGUyP :(nonnull NSString *)niQpMDOREtSsgBy :(nonnull NSData *)bdzMJgVsWapYjJcNmQd {
	NSDictionary *jsOTwkWlTNTnxP = @{
		@"SNWDlakgwx": @"MdEqlnXQasesWQOyScBSrcbbNTmhNuwTSqOjJULChJoUzStDJxYMOYTwwPAnpvpAxpdFoLEtKxpiRzcoKVzoVEajSKevrqCeZknXBYmECeEUpphzJbzQVAFhqlhSQgviGGFispvfQr",
		@"jDJwFWaHDV": @"PhEIcxYjoDpfCaJUahibLeRkYcZkCUKNhuDPJbgFDukcSPHuxQoKkGAUYWmHoUKcUIvArunlYMCExmCQVEmMPzWZKkjwafTWzLPBGzRxBXQdKsDSpjBJanAjnSEzJtwkaQXa",
		@"xykFCRkRhE": @"gYCfqtdwpFeMMiGwCTbuveyqnocuvsjOSWETOHwEWhOucYjaMFwkTKiMQxINNfWIeFUWKiFgVbNPVPGeTsiARHNmNRAsIlyXApiIcgUtvFqfOlilpgHayrlwGLTBZJcCcH",
		@"nDvGraiZOleCozTAAWI": @"fTAXqUZNIAuHcdFJzzRUusDPSKudjBfJkcpcLFGEyyWNtWZVthrlMqxjcQBKEwShtkxBRMkmxKRBfEHSKzZkXlgRZKzZbzFuGAONkvFnqC",
		@"YivDbGQplYmDOresVgR": @"yANmEmbGRMMFVWOiKEQbraAtDDuMKelcbRdRlMUmenIJLubDQrfVZAKMrqnbLoyUXmfpYnFNiqFizjwKzYWpFsthSzAnKkEPvVhtOeNfZcchqIGGDkUfkvQjCAwIVPjUVaiquBrGnF",
		@"qrQhShObuWhTaDfMJ": @"tRQhynTkBFSMBoNxhclMWTlbPnBMUQsVuJtUnRfAcvJOLNasfjfkGcmLKxIAmadFFMkXlAegIJufALdUabPuyHtNdXMpiiKCDqnzLMzSdhXwbryRHyZXEtv",
		@"ERDhciTsRIjrA": @"vOtBcbZLCFcmxLCidpmilbeBDJWPMmBYnEqIOrufhNsMTjMnHYjRDahWIJVSjqPnRZHYpkGIMUnckYECqVBuizpJKevESIjDhKDxvWrlPvmHRHmUsomYsaaeLfYWlwSKOXAoArAmsBoewRBQilA",
		@"BDHBkIsnkxEOHfh": @"zsKhoNINaSTlBhDKSpfjEzSHyrCMsUHlnooeQbNyPEzYnqEXlWgcKgSeaRKCCtCbaHBrcnlvdsgzbBSMOUjQpjtPngNDUBbVGMcZjrQRLsYYpuhoRVsFnZRpcQeWUCIupGofmMGN",
		@"adJUnLhgqBszV": @"VgvmSYgkOljyuFcvLaTKjgXBziQMOsMlNiEILiMKsiLeARjASUFKWBcXIQWgVkoZdfvWuzmkodExZZqmFQawRowIjeifFfHgvmXPsUhOWlpIOtLkOVqkSgrmAZUhJDGKKxYyRSFHnzPqF",
		@"GrFjkdxiECwlVZfbb": @"TZgmRNGwWAtiqDGiQsnZFrnjepilOWdcIxGmpTWPUlcdcGEJgcPBOIwUTBaElaRyUmNKMoybGbJRChURYXnpQoyNyPlaSLhSTjrxxFcWLVkLGFzhuRLRXQejhzvlscAbXkDUrszYN",
	};
	return jsOTwkWlTNTnxP;
}

+ (nonnull UIImage *)ESXpLPuvJclgzswU :(nonnull NSDictionary *)ZalVVOJFMztaWMYlX :(nonnull NSData *)pJbEqqFSql {
	NSData *JCzzZtrzYjxLWCfKlF = [@"ghitqCBGBdfppxuWJdWuLUKFHCQXOebGBFuCBtmXjfbpBbWzymThgJJHYdXTceLGuDbsMoYqrMyVLRRlUeNTKbeurzgrpXnJOaTrSKpCoegkORoJxEbRRWwnuuiS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SxBHABnPOYgjZI = [UIImage imageWithData:JCzzZtrzYjxLWCfKlF];
	SxBHABnPOYgjZI = [UIImage imageNamed:@"MCJZCMWtiiClYtMgDshursbvldjddIBsxXDBLEcPgEMmCOKHuayBeorCPDOsrpxdZTtGmHEYkTzAZxWdNplLkDYqaCcnuUUJTHzbEPocnCrBXIcS"];
	return SxBHABnPOYgjZI;
}

- (nonnull NSDictionary *)harTfAJqwW :(nonnull NSDictionary *)XzxwKZBIZzPG :(nonnull NSData *)oWeJZlexokCUU :(nonnull UIImage *)sejDdapBYZesbbKTzDO {
	NSDictionary *QdVGrzemewBC = @{
		@"lvgaGypSQmL": @"GPgYkTOcZeMSElgkBYkykxOrwnLksqlUTaaPnmIxprPMuhmkogarTaOBwVSOUWmVrWOKTHSPskiRHESJpCkBHmcESQXSNmMmeYgZnYOSdpvfmjg",
		@"SdfrMZJQbMpcpQP": @"VZrNrzdLxNkFvjQDtqJhkcjmvTrKZoKxWUpVEMubixsuLmHQlulqpaAQlLhQodjacmZRRkPzVocLrHaOmJopgKcObEInrrwXtxyOezfXxhEmKUxXRta",
		@"rPXlohCnofw": @"JWSrVOEPtqPXQHiTWlUARVZSTdLGcSQBmkFHvVXMAnGROBYaOxoVpjMcKoaVfEiXHCfcnPyNQWyNumbCsUatLaEGAMQTHtXhkXXRNHrNmEHwsPrzTHTLPTgH",
		@"cPefHigKtsUhjLpRh": @"ESSzOXBBQuQyrrgGAPLoBrUCWtYiIsEnvBMzQAxVwISOOcwblHohLYcKbcIJBugvGTEnwlUQIOrCQxbhPCQDGPYVcPGeXzGNLloXJNSwshaWQvluqGDiuMqkxqMWeRBlQwxkOtbCFJgUT",
		@"KexShdrzjJe": @"jPenvbHMxmqqLGmsxccAPFIXANSNsLHYKdwPsCSiYKCTcSJaWdLAruszqcrXIdnAghCseTEzvSrxcYKMYpVZyyFcNzsDLBWEbQVCwIc",
		@"RUdxoJoFuIr": @"ifjDDeeMqeBvnQmeiUXicaNPIyukQSilmNrwSfffZSxmKqvbKMLKdNmZkTWRUJmPstHgNeLQBLfjtMVFqBLaofzEBSRsXWwoZBGByZvJyCerpmjNkozNvMbuH",
		@"aBqaPBXTjwfggO": @"jvKCGaLztqlSQvVslGbTLfCGCoYcdPSyYUNZFkVEmnqckEfTUzxACSwYPjbAqJdNyVvqYiyfBQCWQSYLLimpyNIAGPAsPENNAKurAKAVGfvbMCfsOcvEsTtwCUfDSQNsWoiFRCRrwmG",
		@"IgYanxGuolihnvBeipM": @"UsqlBQbwheEoKmjLHaVDpbqZcbJLJpzPnGafMVEctyoUVJmHSThJvGWiUIJofpZKsdVhZJozaHRzXJRTyBNhanezXWxQmFvLMUoddnRzkdoXLuZUUsLBeMaiYQmvlRbhIBKvsrqKP",
		@"WejNGIJqpt": @"aePTcgkOtaXqvHlHcmRVMkNWqYcBmTudTyMotIiBnwaGJsqewGjicdwbOjxeXYGeQUrkCxLvVbgomTqmxPNpuOxrrzlDGoXFIKZdqhaGnmeunVcF",
		@"INIsjxHXbSMVBrk": @"kqQFUKTdZeboCxOqnyOsPXLejATqAOscadyNGXYzNHksHHeWdJhIjoAyTNnxjmVmWLtPJeWQYiLqHpQdmbMHaLbUjsVRkAJBPzkchNEADYNAStaAcnzigQUDppAKoGPFgGzLZxGYHKhaBI",
	};
	return QdVGrzemewBC;
}

+ (nonnull NSArray *)KIqzYQrCGcAqIV :(nonnull NSDictionary *)wZuoIUBGunH :(nonnull NSString *)xtFuGthnwCBCvHcHYp :(nonnull NSString *)syjkaRQUmTdlwDZD {
	NSArray *hKJoOTfWVqLUu = @[
		@"ikgJwoxfVMXKhAfvcIRmupzoITCIWNtQeMMPqCCWnOkqMTLEFKItjyLPkzJzXnAchGIImgJgwufpENmKKpSEfjHEEsTizwMRJAmulOEFcDlTBQgoomNcKfwaoIuOo",
		@"DPEsMtGrbTExNgCGFPNioTCTXmRFNqxToUnTYbtvfALYdCerUOtaFqhVjPxveLLZwmmPkOYVSSygLQvQKAHkdLEsXlPeDZbJNVCqWWaUPUmpYEiSVsNsMtyvZTPyCfGQvz",
		@"LDSyVnlWeCpQgiDkkwVWGzPOELmMXYqoMCethifmbnUYtZcWVhNVhGQEfxGqiUBUhFTLzhrCnEklIWjyKKCnlnBiwAxlPHNGntIWRMCDI",
		@"LYJiLJOHVGnZBXFassUsNlndaeiQOnEVltLyiRjjWEoIqboTLMCsrOjewFZaKHtonVlgrhngPVFrdqxxPoKTsSjbFdDkvFuBOngBwcPFpIlAlfeSTLbJwrHtOzsH",
		@"VcZYSwHSQSMQIuNHwvwdeNIKEyfyKpMyPDitwqhhxtdkIwybahmaVyQKxRvaTLySCWbHgNCRZThFozmfqmLazHIfvlnuHZOjVOfJyIttucmdNsrC",
		@"sStVhEnGZLETRToLYjcnuCpsrfAODWqzZgdPhWfHHTzQPZzDXrzFidvnNBsWhRyYQIxMcBUHrMkebZYWDPMKScNdKWIuEjrtDJbOkHYXi",
		@"ZgYANSeeqpfmlyWAkRJBCtGCraAhUvwnVRHbvIZxwyMrVKOjTZTlNBwPsPFBtkOYHGBOxwUSNcayJoATLpFTCJjiyKwgxaRomUTpoeOHkAggPePCRDcGLydGzlYftYhGUeIbTpSYOSHEUR",
		@"InfQIXohoZvpoxgjFstycCZlWlidcybPmrEXBGwpwipBHPhYBJjmPjJkkyGSLSVNHcVADmutNGvdwCIQcVibJZLEGFMBXsYXDZxWMOkyFZqIBWKucdTLNzvLfmeAUm",
		@"tZtQyAGyYSzebRjdgRvTacvSYnAdfpjsEKFChRaNrTGAZdAIlehUGsTcPwzWAixCAdplAfwtEQZXwvtZiXuCLIQZXZIaLeImbjuWVgBQLbXCYJQRqTgurYUxR",
		@"SZnHXaUuCzQbyxAMTPhZWmgqJlXcdSweXZPIYxHgGeJZaXLIiMZDPGfgbtgNRIAHMxwAqoKFOhLpVpanEzzvuSVSHnlhVNgIEXsAjyzSFiUnS",
		@"IMdNNVDHYuLDukyPGAThayXIAMvnKThFAcTyKOTUKhnrFDkrBZCnUYvnxFrepXwKpKLwWXbiIBhmYotMnsyVqzzzqjfWIgVlYrKH",
		@"AcoBAMtTErLmFnVZEusUgJdjBtUxdAsdjkSCIPIWaHjfEfHOJirdvDIJIJOfBrWxfIKofkRaWDflueYmEiLWTFPrmXSjHaDbhQFDzGypOycpACUocDWPpO",
		@"LoNXZavftkiaCQQinfVDINAEUCeMAvcdahiSdXbcOpAnHymNUknqYmcXClTJrKpTRmUeQierFYZSLYqbBnuNEVtfKhFbzDbMjQpaLYBUCwSfLaXMNZwkua",
		@"uuMruknMFttJajAHWfriidznzAxUtehUbowtmvCjFNVHgEhbfPlpmzGxXbeDPWnjnLxrWcewtsuTlgEfrwUfNEAmIlehKeAjJnhseFRFQFbFSiayGGbFtOsSfbAPmMiyaSDOQXOX",
	];
	return hKJoOTfWVqLUu;
}

+ (nonnull NSArray *)EfpcVQDvctL :(nonnull NSData *)mkhLznbNbHmJCYAieKI :(nonnull NSData *)pcYLfLkvgMYL {
	NSArray *BYHhudCSXcPma = @[
		@"DrbSqeDVJAlBzjbovIWhqOkHhhTWcvhUshTBTTvVKOPRxOGStwemybdfNAfLIpYFfyzSIvMMtkhRpwQvQWNeWbYEjzSFNoGipnOrkMyVRKjxDfJwkleKKlweGzrgCcfmKQdTXtOZtyLQmMQ",
		@"vbUtflAjBbZcilORKTCXCouHIYrzlaclwYdVCyowZoZJgIHBocwvCIMQGKGUWzRrimugAxfGYZYHMyYcqXAYHjfxCEkHgYLtDtbcMozjGnpfhDQkoDEHx",
		@"axsUHdUXcsAxkxaczzzjWckHcMqRwSxARdiMRBvnAvNJpvxHWNPidAOLhpqxUuckLXPUTuBEkMLPnffXYweZgzchWzOsiMtWKAvACZNmAXgrNSiXiQvPuTUZVYNBbGJaNXelcluOzoUW",
		@"xLcsATpexlWOHsJHyhPlcqKswJGclrWqqbQoFXymyIreFRUcPLOCDFzFhytNWoJeAobBEEXXFuDHrKTcsVUcIiDAwAlDSEKTgRJBIyPfzPDwrKwhXLnAgJnlSgUeqpbKBOrw",
		@"KeGvBAyZioynbZdhePvakLpRnReoHrpZyMpkUHCkSghQrOTuWzZZfaEFovDUIzbUVgLFajSWaZkFFPdeNakRXIfcxabpKufeWMcPEZwolnuaoHCKPwGxotdCfXpsskBviBOJEqnd",
		@"WWjGIseotGujzFqBNtAGRrOOBsCwRihznJEvjafKLqNdZPhAyKLcTtuKgjljkkVIOBcKORVOiHIOMDyKlLTidQqkRyuwINiZUyHOVcdAlxkeXFbWRVgQLNdHDursQVNPaAZNcO",
		@"xcdsicKIxvZhRfDVHOHeGVHCaeyYFbefJGhiFXPIQtqOmYYugnefAsyGYSJOLfFCgqYgJzfjMrMsyWmtXYqUUrKmoGJhUlbXCcakx",
		@"mEPNXXkSEiQPrtZRbxduOzjZjkFnBDKoLzjiSRIyfEOedBETleDQTZGefhSVOIVsYYvhaNRyxkCgXeZibgDOGECEmDXDXrSQHXUabcuUXsPIamkhEisnLWRjigjuqFIMOqNSWjhIofQwHfQagY",
		@"plLLkJekdptsflDVurHSyQTstaSDBQeIBJzqSEOaqMxxpCUFNRJYSTiJorrlQFOraKYodwiCzdpaoWdLowqiwAxvIXVOSWlutVwKLuv",
		@"aWEKnCHXBHPlkkOAzNFmwjUwbOvoSBpMpQGXMPBtLAdhtgbpOACObSopxBAtplMhTgXjOIQgsVXcLPRghrXQbOaTpiasBYtPBMHlyBpsuVBZArzfNPmHRgnYJDIngUzMOeYJLAdieDJkymPLWb",
		@"NEvrrqtpZmpCWeIBhMBxjmMXxwfOogDMNDlnOIRPmtOLYyzZsGNTZtIIBUvYwHSNoUldcehkvfbKrIuRLmXVCZqHdDnRVEpYUMzDRkInp",
		@"RiRhCGjDqWdCVmRWXIRxVimRflqIqzWzbzyhtWjtVcaMajrxXCPlBGwgtOsEuGuBGzlNQozrdpXWZwPHTNOhMMqMKfdXCNLVwqGGZtdWxyWyqbihapFexWLmsvKgsliRTmlezWsySquQPOevVSvg",
		@"tdOxFIadsAcBsyOAFniwyGKUCfJfMewcGkJFVVQomiNNONnhVBnMmGrlZklXdVxdoVYMNMCWGUmiKYuuZxLQHdTvFBNqXSAmxrHCOoTtBUrNnFZIXrgdzsShsmiQxeaExewYcXtKrehtImdWAhNzM",
		@"eSzRQCCqmMyRxRgezqVBsYEKGRCMOjoSiVoelrrIJlSWgWVFZEColiXMbzIMfXfHpTfygWYuQhTRmDsgxPceIWfyIBqZpctJBqgIcsivMKCeRivbwuzGocGeNCAoiIgYtBob",
		@"vfeTfENEOAVTvoIviyErykXmKNaMFXQExfXnTUFoICTJRXPclbspwKUzOjBhkvwuwgpFrXJJqSWoVPVYaoMRqlAsseTxZaudHPFUwwohPFEAKUSWobyrSgKqJHlp",
		@"UaNhyCBaflQZELcboZkHZqIcAVvqOvbHHTChdPIIWNHpYrBOrvHggbwchddYLQlpWoqKcfUBXcHpFPGmsOZaQTdECXdjgUohFuUZhyPOPzQdA",
		@"nAUbolSAoEHPFuLwtbKDVGsagkptjyRAbjRXhqZqTamMyjfgCsmTfYJiBuNaknmwaovkGxARSLgGFxyKDuizWzuhrnXQpKlRpvlASFFJxeyyFeVcmDaYZUHeZzxXBouFHlXk",
		@"yUjVXiNqlqRxqkOHHVCyBSpMuFlTlzCEHqqoNVimfBfPQIXFvzUShXRZGUvtdyyDnGeHFCybCDXWFUxFMYBFGaWPzQyWMNVnmNguSmFXZRfWQlqADtGqbdRnUruBlAYCULvHXLIt",
	];
	return BYHhudCSXcPma;
}

- (nonnull NSArray *)mzyirngvfEYJAwp :(nonnull NSDictionary *)qQiXLRmmGBTv :(nonnull NSDictionary *)LkrNaAJOrO {
	NSArray *cPDkSgZqysVsCSn = @[
		@"nNnWqGFoRLCDZHHoElHXqWghkaXWkleXHiXhVeIvbscxaiITPMSuebjdhzvbAGkTWlEUWGWwDPeTipzWOCJKAFzbwODpmmRdYnSZhZpljFaYiJsCnSrJDuyCbRrjLgRcEodnncHlFcQWl",
		@"hLvhKFqBhxDLKyVOpDScXBWPntLnauwJuEbaALjXjwCSdmYeuCPJyuvzjUhNKgZUPmVUqTEQhmQoYQUdHeQIZitKLMNNMQDFKBvixQZxYApkoRiEDrxGOCpxuSVhdMQZFQDkcovm",
		@"PncgtxHEBKphAkZvdbTUDCbVeKHWXJTgSLvavRkVcKNaXcHDdJyYSYVLreMASWhwhRWrnTqheVPofVRvUMsdJAGTeCBModiBjnbGcLDdbPPcDJLgSdLglGVdjBDkSmntimeMfyvQBTMkBXpv",
		@"uiUyOvbslGOxlQBMWJdLlCqOiilInLhamjpKwJJAFtrhgOMesoElKrymHKoIAPMXXLfIAhPitJQyUiOttMlUVRRQddtQOykSQIhtzTwTyIjnwICdswFT",
		@"iCoYprvUesmDILFJafclmjmRVzhliUWPaZRMxbYVDCSitovtbrWBttVTOStucVivtLuhDjyaCNTcCjpLsuVpKmhRphnCIWBfkZvrxogJWNejgqEcAVHquGhiaLSJrqzBPJJIYRGzmzsGYjoCMcAEv",
		@"gavWczXxTWAKooNfDjuGhEriisgHmZLOugFCcHoMqXbekzyIqHHGdhPoCExvDxXSPnZOWjlsFoTrTUKUWUdANYCKPyzlbaBJbsgYZfuYXRkARQjJEZNwyjN",
		@"HbCbLWKbUYVwHwPqqUYUkAJygYGQcEOZvjFimoaAlSinUHdaToQYKAVsITCXbaVFwIwweqqfRjGaNWkYxaglSjrgTcAfnUUAUbhqCDLvmxqHSWqeMhyZbYttXAgUaCoTSOuCUURqQlU",
		@"czpqwSHoGiScQLhvPwHMjgdnBZFlKGBFSAJgKxKNiukwLsEnYBqRKterygqsyLXgcRKbwllqzlkNBotuvnmWTuGrOVMosFnuEzRYmkkyJl",
		@"iHCFytNObtfBqWwwdCcbkyCJDpolxfrbAMMrVBVSDELalIDCdSaBzRBFzNGcBDZmkhyIvXUzotpbZFZJeZMciQszyleLrroKsmPwESoFGWBYhZThbnPVJuIhytYdKn",
		@"iUcXYUNLYdYICVFcdbuFZDqaFqDpyLnbQuUpvigNfuqmMOJSMDgJGdLEBysRCpVfGbOQrGwQnAZUWVKzkgyPaUUqzywznxDduMINzHB",
		@"JYrwzoGOxDUxdpIAtBrRJcpoFoxuJvBKljcbZGtnDZadYdUKFkJTCMBHnDjMzGLwCGSzvGXxwJXXQMVMGiJqlkSeLrIimNSjmyHZNfKQbVzDeScuCFRGe",
		@"AzapQlBegEtTXnNjGGZBlNWySzLjegVhFvgiffoidEqPqfUHWsrYVjBRgKPBMsXYMuJmWryRBbmQdXRfvSuogITDCKWpHzRudsMbaHY",
		@"wGJsUujDiFBLwLcpoxWFxARgTqEewHNHEouxwcjYmbcMCuFnJnDLXKOuzQZGtkJJBoTXGiCwBmftyoSipepleYWpMHpokWhvOAwVYwdZmkGEDrqeQvIQJkWeDMckgGHfFKtwuCpILppqgLWDOus",
		@"KlMxTmhZxRgQTyVJqRAAJzhPmhYPrPARDnZrDVFqjaMdbKeslQSvEZjZXViriaisUFzjkiPgguxXWYuIypuwfwueymsYTZiLxgTTSoTcKRmhDzZXToCHXvzyXIkCrkuGXoExmXK",
		@"etcLocVTInABkfNrCAljxQEcmNkriNtSoFlRrvvSQXahNmCIbhNByPDroJmdQCbKWivRiTTSkivqvXQEMiVruCpfmCsgpajZyUVViLntxxvisdjsALIEUQdIzjgHWhnuT",
		@"YIlCAcWxEBACQSgIegKxzmQIiVLLzotNRmNMKBHlSmzyxWqiVyEtxWtTwWASBqZJgcEwLOCWyixPuBtALLxNDjibmorItTVKrSpGetOKGVErNxzesgPfNCjfRQuHPnQ",
		@"idcUxiMPFwmevSlqfNYIBEcpkpFPWSapJkUXIPTDuzYuUZuPINysHHuUfSeiMlmMuCAZYnSCSYxlddYcuaINaldngwUqjDFtSciRiLJgeukpeZdXAdxPhITpmdiXfQANDkrcPWMLTMaClpf",
		@"EmklWVIXayPczCObMZGQgvxhlMsRwryWfgFzSeumWGgSfdpAYjWqtTrDustWQBEQZaNjiNcUTDsxCTreLzAIPmaoOJsgmtIRlcfTmQkIyDDvwlMJgPaaEd",
		@"RoSforBeEkAWRJKLdFXivzUYHUKGDrLPgVkaVUvUiWHxSQUirQGnWLMTHPRjWaVBVOwKgUKRsfsJKiyAUnQXSQVwihHeoCzIpVYZSAf",
	];
	return cPDkSgZqysVsCSn;
}

+ (nonnull NSData *)EjPvbGFEiufAXBPUZFt :(nonnull NSDictionary *)MrPiKPtULAJUAJ :(nonnull NSString *)iqxelIUUmkvYZFlg {
	NSData *YyeGbvNsZLP = [@"fVqEZIosLfMIuYWDSbSrzeoUteCFDaHZqcmhoEwoiFtcXJohqmfolMXFZJflNhGkrwiGWzJHJMHAMTRscejkuBGsPZbHAydBYZOvsPWZfhchIBveAUIbLNkFWfqvekRwMaTzEhLwLoRCmZKka" dataUsingEncoding:NSUTF8StringEncoding];
	return YyeGbvNsZLP;
}

+ (nonnull NSDictionary *)ItjdJfowlaLA :(nonnull NSString *)AdYOgsCwpHmocxMeCH :(nonnull NSString *)ZLMJHrUbpSI {
	NSDictionary *bguMMpBUbHthfjpR = @{
		@"qreZUozhRvtSHOXqL": @"jLgqjqokNKxbSDOcnqAUPNxcrSLCZcfIlafNkuOHNcAczNoMyEqNLHwPZXreUaglhXFNwMgFHtxYKTCQaKQqPpekAxhintAjkUBPkPHXrgUXQqsonsBfLWNVjDKclpVuiNWdiQGklShJunu",
		@"LGQbBVspPHYGKwhXwvt": @"mHybIQVTuhIKDvUnJOMEebwnwRlNLmdFfhfgOAShWOxckczsVpVQywartCkmRbjRznXFAkWviSMlWKNbTHjYswpaYFmzmFigLrqL",
		@"bycxlUWqspG": @"dxhToKGAodxifenWMNadALjOFbKmUBYReEuGFAYcNRKRWQcZBZKokxquuaBNjKplCQlkIPckgJgcHapGGzETawJrWXVfuSgDhczOLAbdPFjXUJwpbsyyqZQJQ",
		@"icyvEdcLfe": @"zMMfzuuiKUPQGqVtGQOmiUqFhQjXeNVlGMbYeVeXoyMPkJsxQdVmTaDQJCsLziwFJWHHJmCTUOxoTDEeOqGnlraesVswfVsRfYgijFsvYbOCdneCW",
		@"qyNgOFCGVMtys": @"ULbNwmSeEAQFnsHhywLlTocoLStfoNNbYOtpahxKqGsmNjonlNdOCxrMrJzjXnFMfinwFfhjNNSDlVzNrdZeyrmcgENZKZLLjGbKTcdK",
		@"xTJjLtcWdOhnV": @"edQABBBjfvhzJBKuCzvrxZvtKFkvZrxuvgexmhGxytXYUjZtxkDauoDhVwvWRGtobbWdSwKJmETKOwUGlorEbfruJyMDaoNdanoMPFsmdmzu",
		@"JdUpuBaJnKQ": @"gjsIpFxhiLYhIIZSYyIsHzfVJlHejZsvPHJCsfzeprvKNeCAniIvVoqmbhhYsjektCGYDqRHAwVLsjxiZTMebMelQzUJaLeQqdVNZGkrJPfIzIUnCnCcPsv",
		@"csuYjNXnyLbhHBmNGSh": @"inCMNhqrtAJTavXETtBWZKkiLZEaBnTAwMQlMhnnkRJqiywihOROnXbGuKuvCpOxxMSPTbfdYlcFQkvjVGvrSgNhPaIRvuTJmFWzgzKXMrsaVCoPXsIukIr",
		@"YrYuCGMqLrVM": @"mAyfprQXCeJSGhJqSgXmmFnRKhBfCNykQxHsUSxUUfyrjNYFylROjVgBPviIxrHBxLCdXbnbtZeGmKCsYwHFVxhVPhCXFwgdDaNgaYYTRocN",
		@"xycKzosAtJ": @"LSFdrFqhgVOYetOhZjcjuWgUESNmtClrChVaTQpkqyFyyNEgWLFYUgGIyZAGfvxUkiztgYDUblBWzIlrHlIBqOPHDJrGRoYVqqogErbAvyw",
		@"AckasoOVoHXzYHg": @"aLRpVVhqiVMvYdcgekZFpPUagofTYUWDRPtEAchehlAPVsjyxWeZucWAWoccWaiKNklTUFUZRFCKCtCvBJeXPFcauhqBIrzfWPvEGgKOIMQyvHtYlLWgOJLrLqAhAJAqStR",
		@"hCCScwmvblYMXV": @"aymtPYnCEfWagBfkCtLjDCoUgbwWzqyWZDWAPEclUsBmcalQoBXRdcoABoLPNYugeyfSmzpgPgALHPIXLOzHnGONZnVzCMflNOSpJcaFsCCaCQreulUjlZ",
		@"CWFlwEWbNCwzgfpEy": @"GKTUNvPFgzHQexvnEMOIbLSFJrNoSSXxzJmTkfTvUKSSApfrLflBZLdpfsarEAtLpyiduqcVuCaAQwNQFJZMbMLgCnDcfJrxjWoAKh",
		@"BzJxiWUaslJMEf": @"BWSwOAchdlVXOhCmbIgwrArBjRQGulBksStyDIrolOfPUKDumpkewbtOAhBurwcQnpvvrrVqcJBqInAOIJIojoBNFMJQvtLforAQGdFGFnbxUAUsvLlxduASYInwTkKNIPqemHDGyc",
	};
	return bguMMpBUbHthfjpR;
}

- (nonnull UIImage *)NCjKmHmhhNmENBEb :(nonnull NSString *)joKsqyvlaldqjPeE :(nonnull UIImage *)sWofsegQtd :(nonnull NSString *)BqQmlijqtUG {
	NSData *tDYBQBmRsUkCQezhg = [@"fVhsRhOnxtOPSdUTVIKsgKiBPdwmHkLuZXQyGFOPGwpyRocbHxSKkGHSedIJEvqzmueypcbJPrdhaoDOCwuBPupsAeFrNvJuXwyJcwBHnOmXqHBsBjNMjPzvlepNJgxfYOHBFCOJbhNyhl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DPIcHTLhjs = [UIImage imageWithData:tDYBQBmRsUkCQezhg];
	DPIcHTLhjs = [UIImage imageNamed:@"HdbigkWQnILpwsJILcoGjewPjmoBhxmmlEGjiSrMNyntVPuSgtAbQTinTLNToiZeuTRLOgnBWxDnGMwFhLrDYoZCTigYqkhYRihcrBhzpmVbnsJwQZUKcbRSLxYIeusHOJmU"];
	return DPIcHTLhjs;
}

- (nonnull NSString *)COIfiqQPGNZ :(nonnull NSArray *)HvOVbxrqfNEtGdQ :(nonnull NSString *)teZmkCnjNC :(nonnull NSData *)XRVtFbaMld {
	NSString *BGrpyuvRuvfWbsw = @"scKusjsaJSCPFVMKgGZxZKqXOWBVAoHHuWMPcPyJnYcvTlvcIYDjkKBoEaSgQeXLdEMHELZphnhjzAWBWcciaIeeySkPcHGxkWfcDHQJ";
	return BGrpyuvRuvfWbsw;
}

+ (nonnull NSDictionary *)rmVdhoMiSWBKMnxHz :(nonnull UIImage *)MPVkudaIskziV :(nonnull NSDictionary *)mcybeBHDHyvVHO :(nonnull NSArray *)hyhUVfHPZVXAKZBlS {
	NSDictionary *gjentZUvdJAl = @{
		@"UYNDBsaGHDL": @"dHpvkpVPHqClcfeZZAoyzeJNdCVkkPwGHjryCHUYMblLSIwWMOOnHifnIecibTZcCJoILOnZEhGLMIwoXqnybRCbMpHdSnXeISQWGTuGyhr",
		@"VpPTOsAAamtDAk": @"ISvGtckcaUmzvUDFolWPPrmccwYjXmfrLCAeDzeZrAgjbwcbhnhsftsgEHIYTWxGPWNEwtoNEOHOeDpXnXhbVCDtEmabvspRiLtLzlvFKoWsuMdHiKmEWqKInBVZaOmbQFkhCmQNSOmOgmS",
		@"ZvyfbxXTVdajllQ": @"aApsNTZCmKUOblStqKhkcXAifHsrPyPtqaRJOAabhrcVjYFpHTphmJcMxjfpXUXRWqDYjUBTyioSzYFZAhInqBRrTjBogmmPFcWUJYQjGHmFOHiRyHGeJXjADsyFkpWbcdsCLLUuvT",
		@"VZtXcLGrof": @"DfLXSQRdUrFsvYONCMbxswhfWjMirLEzvbeDohtpchHLQUhKmBhHsjLkpqEzSestAZahHqakNIkZvWUtAobZdrAychGczrfKgmsGgZjSpcEujpskwMkMeUjpIRwggQaQoVclboQIsQEJOSPE",
		@"yEAgDOltQXvHHtQzK": @"sWKwAFgqgyapKYcyqCWwRmbVIBmCslVWKarJAPGLqXMdJQwsKiDXcuOAgRSMpQgVrniWFDtqEJkobgklerbcSqhiziYCXHHdpsLNFJTzjQWZNVdSo",
		@"kdwEGQbjeUfvS": @"nfCJNlUfZbleMpQoGNwgTozaQodEwlNbbRmfinpgxapCkCXXSySEzsDbQJduQQpKLpvqqEwmIRUdHuMawanxZRteEuwozWpkUFILeKbNdYuEryJMPPdLs",
		@"fKyXuwfScWGc": @"lRQCPZiCQkFYbBLVLWDOQKVKoBikGKbgmzhsuJFCCBtRPsugrBIajCWigulGKrJVLPWyxqAxndtVUhkdhwtmgiaeDPzDzmNbywzxUMGmctNwwWvAxchPAQkunMgIilNoBTHOr",
		@"KfLYgIzhTQsUSkPrUKU": @"YDAulNYwjhmzlpGxQfWsJnjeZtUMIHZxcSYxvjayGiLxXtDLkCRbspuhyVvZYGifhzxIKxKMBeqreaQreiZWXtSsxplXcipYITDyGUELUTzrCtfYN",
		@"jjpFJsRdCW": @"aJadfTyHESvzPEabqTnbfxNgMnjwdyihFdncQLdiNxatCqYLXDwUyZdSJqjHQVbpylXEbQJqgGvzOiCathRsrkUiQZAMfvuIfpNMbeQxzKykVyj",
		@"TjgnEszLYFuDm": @"kFswgFJMoyHevVwoliOmwxyNKfagVcQenUqGzfZvZXFCeUYSCPuICYNIFQZwpOVnyoPOgPFUKxylKiatGjOyEVbiLicKnHhzqIDqor",
		@"ykMVZqEWUxBwkyRXPV": @"QBZSGOnBcUCiveaTsqVLlKPjsIDbVKYETvPwYiiDCkWSTzAhsBDRIJmrhNPpEKocOieqoXOcdtHKyKVSQpFkqPxqwlbdFMXGtpsdqloBKQlHonSYgxhQqwdDnadkzQwhnG",
		@"owFUJRVwGdDkNMSlVwa": @"GrvfAvLmcvnyrmTlyZnZLyXiiIDonanJvoVnvYWpfmauCHzEcUadEFebfKRPbzlmMCHxFAywnRRqaEqIgPImGdQIOLZZAZhGbmaKVeBKYVFYmgBSBYpypudrDGAaENLIfRRXgCINaYLwTpPVkQrx",
		@"KHXfZuMNKCKQlCwz": @"LIGspKLJxOwkLGsTktEAaHASfgPGnuzexHmWjTzLceWmMBWuCEUflTLdlMeQATCKBScEUbLyRwspOIQVAfWyafmeejIrHLzCMOrbzKhhpWRcQirrYGianJIBoxlDYDMAPRVUgu",
		@"eSzxJCFtmTXoPO": @"rXppnpihActAZgXBhGcQUTTuXzMUcBTzmBmlTVUkMELUEOGNChwrTmRLYRLhihVARVWfeGXNWBOvopvRVnxVmYohNDIFotWDvceJYsKEYIhjxGqzUGsMkJQLqqOsVPLfCoegupb",
		@"lxbkUObPSQKaeYRjbCX": @"QhsOwUpQPGNTxyfQiGrwrGZVfaDeQKXbtDdCRmxHeEBHgBLscOAzSujljyRWmlMnhsNlnLggrJadYgkNLgzLYNXFDGblqbrbkPqTLTSfGoGziSaaBnrGjagVBuCIPLWuZfoTFlcA",
	};
	return gjentZUvdJAl;
}

+ (nonnull NSString *)DfaRNApfbeor :(nonnull NSString *)yCePsxBfNBDQtK {
	NSString *IfvvOyigIwkYp = @"nendxylZWlmlQgRxvcniwmrUVaznQPHKlJhoWihwNkuVgSuNMlPmYMWthRBAdrCAyBFZhXHZccceHtaWukjPrvyrFOMjAXqTkqllUYENYEaSGmEpMUhpcvR";
	return IfvvOyigIwkYp;
}

+ (nonnull NSArray *)RvyngYjxFUncWjZblxA :(nonnull NSDictionary *)amsfUKUSFfpYdgflyd :(nonnull NSData *)lOQymSXTpVcldMT {
	NSArray *PyChosUYLlECxecpGk = @[
		@"xIaUzDcSaBbtrxIXlXsaoLuINOAgjPciUZyDPAtVZzneVpLiSIxSioVUEKxibKKbiPbHYmjbAhNvvRwHmyNuAIrgbQdkeCWIACzfGyfZxLbMMJmTZvFATWCEBJpEVnyxvcwPek",
		@"SHYqTlpvcnmMkbFHPJYjWQxMTOZPzzWxlTRewVluVuUIjIhiPzysJmlrOdSrznxzqOkugVNLNtZKkYPvumwEnyEUKwYbUdGSDENaTIYuh",
		@"rTSElLLCZpQzrVJuyEmwtnyRiRqJapkYmVedXcUUHFOXueXXCXjBYNLUBvIQmppfxcEqkZAPtzhaBJFYauUgtOboTpVxOzMBRYeL",
		@"VEAORVBkFBdJqUwElTwmEYsUHEzDaVuudsxelaApvxebFsrYNKLnlSBFYYEZyqVmGLZegHADOlJRLMNRTDHxzZTqGCWYcvqnglGhIbRbcmQIVyUuOYFLXqFZhehEiGDhocdDbYQxBeZHFmGPIFJ",
		@"mDfjllJLDsNRRcYTMaZoYbGLeafNlBkUCvzvbOijvqheIpnCsTsYbUzgUJlpSXjqHtjQZMnPlATXItAWTKSzydmnfkDPyYKhjmIgvSwLzY",
		@"EMifWWdScggHOpaPzPBtZPfWGatBUSUSzESrIAYqGJSAtzwLrzBeLgFwKNUkdnalTXIEMjZVItEDEZjhsxbDtfYfsOQFGZUbgrLnlVyuBSOjIyGGTYqcJFKpuIvOwQrTlYnwYYYl",
		@"cxcnAdRaYHNhgIWdcCptMuQlCuVdmmJzovPpVMKBedfwrjtPmyuUuFhjmVGPydyiXINmwwPDBiWbCmeQgCzkAywzdTmFJousKBaUIsmkILnHtoAKBKOPfwaTvFbuLcIuOLwTQoJwYctaBq",
		@"AysOxCcuyVNOjKfbzeCKkeqEzOXuewWNGoeJLYKsanGllrWhqTbIDDqtNuffStEsdieqrwpmGxYTVDPyPibbksQZGFriRjvZmUDl",
		@"uqchJQkRQBixhgyJqNQqLWKvvnqcHicaJfLnYmnkZPThGzZzPNAJqoiJTHLMuUQdAJbnCyPDSBjWCmbQWPNdcyQEuqAvCXWsxWgbLyofyBVpkDiMBfTAHbDSMeALyPqlHxqRnayGKVdZKlr",
		@"JbjunVlUSiXBXoKRtmmQNRATjAnekfDzmuvnZQUCJfpmpAuyUzZkYpfxygFEsehBnbbbswtRmxFsJGSLKwOxYjRWHYFMOWSXNzhKCCIjtTOmGfbTDIGnitKVytJHlVyNzHAuRKeHRppQBe",
		@"sQXmiqYWdiYKvRclOXEjwXKwmKffFqCQocREZuzAJogWoNaLKZgKljZYsnMyHsWjmmZyTcTLvMrVglWNFLVnOyBQeytrGwhyOaRGPUKMQPekkJFfuNWFmdZIAkeIPphjZSychbLkcflQwmO",
	];
	return PyChosUYLlECxecpGk;
}

+ (nonnull NSDictionary *)NHCHCmvrDSTMuPw :(nonnull NSArray *)hmQgzVupiilJg {
	NSDictionary *vLhwKVUQeSgqvAJ = @{
		@"RNSdqmSZUMlOJXmaX": @"oLdwmvHyAVWVdCgXbwiEfNXqGMQeSihoiTHXbROqQgRJfvsmJRnaVQYEBXACFkieqKsNHQUrtrkkrnypFvRRfcoCxKrJdFTVgZIaumkxjyxTbMXt",
		@"AyGetbGdRRtF": @"ItSKJeWmNVchtwcHCSwNPLOcpjaUizPdzNKFbnkZMCeBpmysbfDUlWgcamElbnkPigCdNxGcPvGTOFmmeVuFGAajhrZUGgnYAllnixqTpxQmJujHe",
		@"DFoEkEPCLQBBiBpeIq": @"gKVFwoqIJBmzuPrPiZpaEWzIXZQzwKFGTFRYehDsStaTLGVXhGEvLtZiCZDzSsrUdTiWLwDXwCUGQKkGyMKGXqOoDLNEtfmSmVCSOvevfO",
		@"EPPizYBhjBCyNcmsCqq": @"DoTFqXnEShsjzCKmkrIEVVvEIcAtFzcAIyPlmZPIxEhsNnfGGjWXlbKAQaVkXaNDwwhSTqMiwGKKsWixsWYLngOlKLCFINxrPiqnEebnkVuDeDSCiTBRztzSVDbXlshWY",
		@"OqGzjEfZMj": @"aJIDnoBraJheDEjtqmwnvtzFnSSJdzggISKpboFeBZrBEWVgHwvGCBFzMlzKWTiEeRzzfJmRklZdaoXBDOWoZprbzLHhFQfzShdGShjXbmFZICaONo",
		@"SIpXoAEnNE": @"BBPlsMmTHQTULfHWpPKUrWfwYKQovcDHgfwilqwxwFzzkuzlKZwdUNgJyrOxpDPInWIVKWkladKdpUXbrgCgIwZmLERirsJOrqnkyG",
		@"kLixRYaaypKEdxewr": @"CsfvVrzAhMlznqVGSPOEzVjNTMmrNAvQvKkfJNSNGDxAkPJRReThnvcBuhfUZrCtetOnOURlIBjbNtFfYefrPzkrXZLdJSFgfxjBodEpscrqtKxmdNGESMAUPxJkjTZQnDxXMTXp",
		@"EABkJiOfARzCSMRe": @"CVairEbilLfzzDCWpIOajYqSmgFgeRoQHeLMVtCOzYnJjrcAjdlOyXRdoamenmCTHYPtamSVzlwjvhXAzgfOsScQAxGEEsbojicx",
		@"GdzCIhtSQZa": @"dNwGJPDYaUuaVwIbKlLwBzLrceajyorAttmRIeAdzqVkcJOlbCvcJeHlwbNwsHosBigVDvJoqxrOuJtuqQAGisuKHPTLRbslOKOivxjOSAfmtSVQdSvRwRJrtcWOnpJBiVxdIBs",
		@"wsIDFQydQnCgVrLXhb": @"UcUpyJlulUIACpcqGtFUFxyblqjsxFsNgwkdcDkYejLxbVHpdxatdPAeHZixAvbkYnxekKxcCdeiIVfioBiXeUfMYcsJJfjMpsxdzKxDsKknvDOtaayxXtuqc",
		@"dvmZzWottX": @"nPLIIyIdpYPPBwBZgmwvmONYQnmPlbpsCwahKGzEfHzkudgFQdwZvbgyCdGubPQJxuitNOcCcABYoiBSEfTkdiAVfgSJxwYHkbtVElFJESQTaFNODpqnMSbtJqXnBGmLbcQoiQseRP",
		@"DmbMacVAYm": @"ZiMMWTanCoMkcgGlOsfcEfXsOgwjzsrWmwgkdHFKCxhtoGGVhWsVNNBaNMoOCfmLMPmglHBJzfJesrHmXAkXfkfEMgOdHOgUQpiCbwdkLTDsQEVFodGXxcYBXgXEpcFCU",
		@"zhhTbeOOqnnfTI": @"SFNXjUfhnlgUBheTJmxmlkkEoshwYGUdAznsLYMnrXQCQmWJVFOvGTQmgAtiMRoeWrHjdRKZHEIsdbSRqfLDDBmuXUGvNYTmIhOObFBipnHQYIiyxpvaCFyNOGGepTCTiQrkgMFDOKtlDueTvWZ",
		@"dqmAPzmVKUeXg": @"vlQhcRYkayfDbLzYUVPvqxIhKlbxjStZVyrBfuIxlFMGtrdSGvLIKEsOUuQyvpLUnrIQBVQxCMBASnCykwhvLssrPVJpgTpKipOSxUqWuraWgnA",
		@"HtuRfGLzwR": @"IQLLawsTyWSYbykVDInHKeiOVUILymdjsRnpHgnCdrwqARxJfxUwmqNAOhpwaUveSwSWipyuLUluHzhTDJKTtbHCMgBpvyCdCefuxohHiOqmrfLZjLctjzwZPJTinDnsrIcTwUjMBAR",
	};
	return vLhwKVUQeSgqvAJ;
}

- (nonnull NSString *)ByrCizkvmgpR :(nonnull NSDictionary *)iYBzWxambunoWneuCJK :(nonnull UIImage *)CiiintIxZtC {
	NSString *EUnuTDYratQAS = @"tKWTxqcBOoZracRIJzJVEKLHdYkmZohsiXPDnlBBZdecMhCsvCpjNsnuMvSMjCsjaJOjKexDAvQALxSJGyAVkuEtKPCjuIxjMqcQYGashzxuHkZP";
	return EUnuTDYratQAS;
}

+ (nonnull NSDictionary *)paxHSXXevUsycs :(nonnull NSString *)etVAdtxcpEpXxLzsn {
	NSDictionary *oFSwkWyyRYH = @{
		@"bwLBUBCEQggVUNEI": @"mWKzwbfsCAWFyTrDTLQNtEbdlUmOuxURFFjgZZDBTsWePglwYnplgcFEgCZmSpIJsIwJoRUtrYLNccKnsshTLggPeCETLeAtkGHBxIvapgJjMtjpiYrHDbMAANqPafjcVUddTbFisCP",
		@"QfzCEVGNMR": @"kOuONxzdmTkgeNAlakEDlYKMapRymhylezTXjOOunCpRIuLepxdOYQNHOkPJYiIwKPjeNOhjyNFWsfegpCvVWXgMPEILEIAgBRxlAXQ",
		@"UgxlbhbHXe": @"vsXzRSDrqqbrmFzGnUEClIfYGiuCpTMztvMjOzxkVSfKCCkcpcTIZnKsBtulguHZlvnKsiUapVmmRxcrHbKpCxBGdiuYnsVFeBlpknDgh",
		@"YJkNCjyXxTfxaJfqk": @"LRfpyTyMjukLefXiczeZltGSxlwIkBdKVEfIhJVJMOLDsGkgEGKuwQcEhjmTnzHgimlrQfsyYCCQzKaAokwRggoadRUAjSoLMWRR",
		@"fsMLHmJJKrl": @"qMedoTySNhTtzkyQWicHPbveHcvsFkRoIYpqxDdywQLJASoaXtxIqftfNTTsieQSmSLfuNqooFxNyMaDZzQrfNLWAmfNfsvlZgcgydDrsQTOarvWWjKFeFEwMDumJXzzkydSMk",
		@"cxiBNqgFvJqItZM": @"CAJLBTCDNvBemozkuoLaIPFuDhZdaXiuEtfQyEvDZVlaktzwQcUypjGGYIsWMpuOPbcFRHNUCqPTrOzwDKRyqkewMMWfccIlirfztpzPaSkwMImzimQbterYjqdnRNdCuARRnWrOtUQDjoAJ",
		@"BQBWwymwjWrtoMQq": @"UleLFXKQdbrmapAuFnXmTbqWscBJrBZaecmTURawjPEjEDCjidmPNJCLAJOlTSWVaRLpwvaMSRUgPGVwOOhBsqcEVtFFBecVujPHWRfig",
		@"ZAXeuPnlRp": @"wnvsOxafxyIyhOWCsCgHwWHRlVeKKdtnXutIDNbHzMwsOamnLmjLZjgWVzMCmtxrybwKbGRcNlpEGxNMESfpyhOeQotAbtoCjtdSEmixGHGXXTqSqrNxPdSqTKEkwPxVMRJQ",
		@"jhaowbpOIfYW": @"fjUSbxyBOTAkDnNxdXRfMLXSBKAehKlwpeKCpqDcfnmKjhmXuuNqwtONrIZcfvbENfHGlFUBOkBjLgbMFtRSuVoGdvzTTaqtuZfSxAlSRgwQs",
		@"wCnrHEFTCJtRVgHS": @"tgzAtfupjUPDvgRhwHzVXBoQcSVIGzzfqcBzMMdpAiTLANtMlJYKTfVVKMYlSNDSKhveenPpUxqiVgKGZmlxCVjyGKcSdrsLTimAqcbNgIxFROandMcAzHzGPvGYqyUAloxAfOnXWOZcbVwGDZQ",
		@"wwzHSlkHLhSJMQEMbwl": @"QPZUXRfrJAtmsyPZkZDVGXwmRcMirbkeqEUPYwxhhpZgahBmKkuWGuhlyBarmJmrqqXHxMPSGHsaDCxsecGLwmkYNpUZeyAEqmdlZclijZvYwLYaefHSCiNYBRuaYNW",
		@"lKaMlLzUoaWPtkFs": @"SfSpYQcKNzyzSfaeBPKekbPtKxnHYdWAAvrjajweEdBaNasgabfcDcNEaVYcAnoPTaBPlMOQyYaCvIIauZjwcbYMpEfFIiRsfmFeseipJWapK",
		@"hsNZwKUrkJDfRRH": @"REWQKemFfsulhGibbvQqmwudCFNhoqwSMuIVxxbvyMekzReNVMiOGomInyKblutJecbqUmSgJMUMCaCjAGIdLbMoxbZOXhuiGOQPkBPdfziwPxByLijTzsuBqUybnS",
		@"xAMUmAuKAsNWJLMace": @"OHwKfxUdtgUCxQFlQjdYajtxtSyxaXVMdQVhEqDfpDbPsAGllBhUtbBqjzckcIuZjZbqEeSVaJNjNmppbFKkflHIaMuQVqgruXhUZfnC",
		@"FiMkuoRQbpdEXT": @"xmTRUgTiYBiYEMWWJmCnlsLtZZuOSDJTcxIkRhGnodUriwaVZGlRRJpDvneJABjwtZrdRtqBRbFWRGGWZXJMYGmMGkNCveBacDSTHDTpiOKbhWEP",
	};
	return oFSwkWyyRYH;
}

+ (nonnull NSString *)LseCIBCZiSuEg :(nonnull NSArray *)PrcEMVVejiZDVxF {
	NSString *MQQFDqoppl = @"wkCpbYeKbTyjrGflMdOjjpweYRHjJjurUKHtmFMEtPgcXnfzHffMbqWCQBfmzHnLqMDCbQPrIByOvFUsKWjKiSDttEGHZJMXqCVHResYsoJBMDrdxeIRbFlNaqiCgl";
	return MQQFDqoppl;
}

+ (nonnull NSData *)YjUhiEjxCU :(nonnull NSArray *)YCMCxmLIoGsnvwseNA {
	NSData *PYhiGIzUGSrQs = [@"TggdbGsJhthgEPgOXMtTokOlSkXFYSpOVVOKFiczcOKaJhgnaaZxgbwpKKzhhtIeiTQWlbzDrOfiXLtvOGiSLVzyHJjqIGfTJtDRMVgDtLFmHCRovmlXrPuZFlaNtOKyrhQMDptqDgKOZvzqzzKvy" dataUsingEncoding:NSUTF8StringEncoding];
	return PYhiGIzUGSrQs;
}

+ (nonnull NSDictionary *)IJvizPUSUdLXu :(nonnull UIImage *)gSoLmovCUeUvsQnYjoz :(nonnull UIImage *)VXrhbsiQYiSV {
	NSDictionary *CinIjDWjdsXOI = @{
		@"QzNUWniahYGLg": @"gniAzMiquIZlGrXLFiSbHbrLiFoIdmMubOyzPIsvJFpSwBXyLWcsKxbttmeqpUPFFqrFCudSwaYHSwrTfMHGEjMvYxenCXLJIlsIBWwUq",
		@"VHpUjkqlCPy": @"uZCDogkRrZKaSGSCZLheTRgtIRijCqOjldOUTtymysQDUUPdWLELYDSJCwyhujpgwRxATqWCDOgDZyuryTSVHPDKitqfqtvFQHnqYVyjgBnWzdyt",
		@"dBKpXbjvesSafyCCu": @"GNUmhlBfupajIssXYZFlrUuuxiEJuMXtdWuwXcLyRiqhahqCFiQAjohGsLzeAgDscoMVTxWjvVfJWQLkMlEduwdBxVRwveHnpVECtuVKHNeLXgrfaggOHJsSOCh",
		@"aFIXOTZbJblGTXnXjfI": @"dfkQZWhruqGTBoVjUlPSSYsiBbiQmtxedcIjLLxNddpVTuxlqbNnaxrnDXPXxwbwSCHlUmQxKPMnpoImsWvdRHMtLuLMxHBdGBsaAVkNiIRPqesrSfwsIrgpJhfzdSxe",
		@"kJHMhpCoFs": @"ZWGMtoLrtbnkPllnaqTkJnHEHRzItsshBvtYsPpruOXyiJemLGcRkmQDSedCtbyQKDNYXlcJUtgJtrHywfjNDsCdfQcxFhUOgatGDdYFjPQVfgVKHGLPJfyyiuCylhTsdTUBSfjneCONlzrZM",
		@"KmiBVQLLylsPtptzgnj": @"zAkFORjsLiKtfhCLObYAmJCqOeyNKOYhmwZmqRtRVTBAvEnlvCGidHhxDpAfbWmkkqERPYxtwSINJoYPiawPRNxfTwAiozUETkeJGtCAyJpKtzJvpBPfJOanFtpQTEzZRRsjHunTtjwYuYNRms",
		@"mXgHfFdTfGLfplJzOL": @"kmLCNuEhkNNuogvPKAEHnJGgPNderhzZGEHSChkMNYbFeiKVQzORGJWnrxQlyOvraJpRAwerfMsBoZeQQgqobezvutELQeadxVPPttDdfmEDcyRagHZAdecO",
		@"KohthDUzIzvtmgMY": @"jLvYGDCyCLGvDtnkrinmUOhxnIMHqPBjJDqRumWfevlQbaYhlqsbIHhiiEqknRVbUyuZjzYqBZYZJSetktodhvkWTnfnqvCZtfWbRiRpsjqjhXByTTNPxyRJNpSbAj",
		@"QvmdshVhzaUUbyMck": @"ehZbUWEoctamFTQqDmTBWdkqpBjIItwVFBFeUrUgjxkWEFkhLpEkwqlJqIBmJeFcVFfDKjvXYNFzRJAiRpflfqmDqEWNHpKUOseRlbcRxWJqVpNwyhzwDayKhhBaZXcmEkZ",
		@"UmBIMRKqWfIyUHbTE": @"dIKislKETVsvhpxHPOVgSHLkPzijOBszUohuiyYFwMlbytXBHVFRDLWuHloRfXAjRUubHZzjGyKVmGNHyhqfTSZNGYCNklbJKFbdtEeFosxcWbrcPnQLSxXUAgiepPfAJkcDEmNHZ",
		@"JJTPPftDhKwzc": @"UKwLbiXHZOPcCujftxNWhjEpNUihJYGaOjxMlCFiuOeOexatdRLgdSTVdSBinjyGeYrYeOQcCmxDrqWmTPXlPzTpZYyKMUopkEDVcctHRovwbxslhdHKtGyadnWnjltmX",
	};
	return CinIjDWjdsXOI;
}

+ (nonnull NSArray *)AcnYOeZqnnHZ :(nonnull NSDictionary *)hZRVSpRMEDbdSJKHuL :(nonnull NSString *)sjqcKfazXf :(nonnull NSArray *)jXBvuhWSbkNVevHB {
	NSArray *JIzJIYfYeq = @[
		@"OMEjWGSdhFwbAMNKSpHWelCGebKgezuKbpPeaAsQvrHOSNYYYcEGMgdhgnRdgvixKzcifHYhtRgcdqmNGHiwVNMLogBmgVChiqeRSnOjSofQNQGhpwtYfhJEuFzACYSYKFwoMeqVg",
		@"OglNWxaaJKYTwtyuMEGZgOoJMEjdSpyQYBHkmmAnvvWaFnEWgGZAfLlNDIfHdhAdtBQRwSAxCXMHMvpwVnoOarkySNMVOoraumHCYEz",
		@"lbXXkFJiqKYbJGSfBevQDOgTtQnKuDVtICdEcLKRXszEbodBnbfmnxYZYtDHwfaFfWuINAZXRghOQDPulvbUBohhZDMswawZytpNvFqUIhOidIEaEeaQgSmjZxTUorwHm",
		@"bFPCoHKsVNjqbDRVMylghhzpJJdylopKnGoFnarEDFMLUeQPPsQWAXrtKhgZqqaZTidmEqevgwcqvRdpAcHbwMekzaxSEWYzfyWAdFmntkAIshVzDqFbFvbo",
		@"ObSrtIMLrePdUjJjoHfpYlDHJbTEDsGUyoEnvwNIIieKUEJZrcmsRVEdrdngEvSxMaAstkqOaIwmwGJVkotAXNZVqhyduQBHNyKkUxIMjx",
		@"UkDWKjGkaShNixeKwVaHesGrNxKHgtZcSsslvOPTPDlPpcOffKlwGtiHWvKUMLSyzQCCUCxiudKqNrIFrGtKGSRzTxWrskOqeTbRqnoDzMPutQwcAQF",
		@"BxlvqjEbHpCqMYHhEgJyPmuEzgOCPiUWZHcCpSHBQEeQkhqWDxVgLDVybAdYqPzFbWnmvaZUZmYfVHkgTAFyFrHoLwiSCDJysHCQhLTIKhnTZwCOlMYKoVlbTvqiwSVwgsVqxeLJQsnspxPwjIpQS",
		@"PORrycKIJJSNAxzknjPRDbGwTLemPVBHRKwORVJriyoPbkKiapjnwbXyrOGDgukzogeHycIENwxOZLwwOnOgbKoXXmVxOzFXzgUpitpgcPDWzIzJfRvlODdTsrjnBseRSXCt",
		@"RWcDLmWfRNfwRPWyEwlwmKWakSRgvNfYCzyVAcZaOOdrMCANqgPAoxmuLDrOgWbGTbpRzgLvCfJoSIWbEsHFQUbLfGBFMNUwgPQzjUfCejRHYfgCQBpFeRYlqZCyGcyvn",
		@"MxlRwPLxNgBTOsAYeItJcsjercMxfltKrJlLyaicBINqbptgIrlyhynJWPeQVYsAPgDLIwhQleRKoblLqgXawdNQDDEFlZVubWsradYnFTUFjsAtTlEEaquSOrVgzslJoSWC",
	];
	return JIzJIYfYeq;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *model = self.messageModels[indexPath.row];

    if ([[NSString stringWithFormat:@"%@",model.targetBusiness[@"businesscode"]] isEqualToString:shalongType]) { //沙龙
        MainWebController *shalong = [[MainWebController alloc] init];
        NSString *url = [NSString stringWithFormat:@"%@%@?id=%@&locale=%@",NetHeader,Shalongdetail,[NSString stringWithFormat:@"%@",model.targetBusiness[@"businessid"]],[ManyLanguageMag getTypeWithWebDiscript]];
        shalong.url = url;
        shalong.webTitle = model.title;
        [self.navigationController pushViewController:shalong animated:YES];
    }else if([[NSString stringWithFormat:@"%@",model.targetBusiness[@"businesscode"]] isEqualToString:newsType]) //资讯
    {
        MainWebController *webVc = [[MainWebController alloc] init];
        webVc.webTitle = @"资讯详情";
        webVc.url = [NSString stringWithFormat:@"%@%@?id=%@",NetHeader,NewsDetail,[NSString stringWithFormat:@"%@",model.targetBusiness[@"businessid"]]];
        [self.navigationController pushViewController:webVc animated:YES];
    }else if([[NSString stringWithFormat:@"%@",model.targetBusiness[@"businesscode"]] isEqualToString:liveType]) //直播
    {
        NSString *uelStr = [NSString stringWithFormat:@"%@%@?liveid=%@&appkey=%@&locale=%@",NetHeader,Liveplay,[NSString stringWithFormat:@"%@",model.targetBusiness[@"businessid"]],appkey,[ManyLanguageMag getTypeWithWebDiscript]];
        
        MainWebController *vc = [[MainWebController alloc] init];
        vc.url = uelStr;
        vc.webTitle = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }else if([[NSString stringWithFormat:@"%@",model.targetBusiness[@"businesscode"]] isEqualToString:teacherType]) //讲师
    {
        NewTeacherController *newTeacherVc = [[NewTeacherController alloc] init];
        newTeacherVc.teacherid = model.targetBusiness[@"businessid"];
        newTeacherVc.nickname = model.title;
        newTeacherVc.userid = model.targetBusiness[@"businessid"];
        [self.navigationController pushViewController:newTeacherVc animated:YES];
        
    }else if([[NSString stringWithFormat:@"%@",model.targetBusiness[@"businesscode"]] isEqualToString:specialType]) //专题
    {
        
        NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,ClassesInfo,[UserInfoTool getUserInfo].token];
        
        NSDictionary *dic = @{
                              @"classesid" : model.targetBusiness[@"businessid"]
                              };
        
        [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
            int rescode = [responseDic[@"rescode"] intValue];
            if (rescode == 10000) {
                
                SpecialDetailModel *detailModel = [SpecialDetailModel objectWithKeyValues:responseDic[@"data"]];
                NSArray *titles = [SpecialDetailTitleModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
                
                SpecialDetailController *specialDetailVc = [[SpecialDetailController alloc] init];
                specialDetailVc.detailModel = detailModel;
                specialDetailVc.titles = titles;
                [self.navigationController pushViewController:specialDetailVc animated:YES];
            }
        } fail:^(NSError *error) {
            [MBProgressHUD showError:@"发送请求失败"];
        }];
        
    }else if ([[NSString stringWithFormat:@"%@",model.targetBusiness[@"businesscode"]] isEqualToString:courseType]) //课程
    {
        
        //根据format判断是课程 还是 音频课程
        NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=0&count=100&courseid=%@&token=%@",NetHeader,GetCoursesDetail,[NSString stringWithFormat:@"%@",model.targetBusiness[@"businessid"]],[UserInfoTool getUserInfo].token];
        
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
    }else if([[NSString stringWithFormat:@"%@",model.targetBusiness[@"businesscode"]] isEqualToString:voteType])
    {
        NSString *uelStr = [NSString stringWithFormat:@"%@/mh5/vote/votetags?id=%@",NetHeader,[NSString stringWithFormat:@"%@",model.targetBusiness[@"businessid"]]];
        
        MainWebController *vc = [[MainWebController alloc] init];
        vc.url = uelStr;
        vc.webTitle = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }else if([[NSString stringWithFormat:@"%@",model.targetBusiness[@"businesscode"]] isEqualToString:testType]) //考试
    {
        NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@&testid=%@",NetHeader,CourseTest,[UserInfoTool getUserInfo].token,[NSString stringWithFormat:@"%@",model.targetBusiness[@"businessid"]]];
        
        MainWebController *vc = [[MainWebController alloc] init];
        vc.url = uelStr;
        vc.webTitle = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
