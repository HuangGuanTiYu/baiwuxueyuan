//
//  ExamineReadController.m
//  MoveSchool
//
//  Created by edz on 2017/7/26.
//
//

#import "ExamineReadController.h"
#import "AFNetWW.h"
#import "MessageModel.h"
#import "MJExtension.h"
#import "NewMessageCell.h"
#import "MJRefresh.h"
#import "ExamineReadCell.h"

@interface ExamineReadController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *messageModels;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL isMoreData;

@property (nonatomic, assign) int index;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation ExamineReadController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.messageModels = [NSMutableArray array];
    
    [self setUpUI];
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return @"已处理";
}

- (void) setUpData
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMsgRecordAuditingList,[UserInfoTool getUserInfo].token];
    NSDictionary *Parameters=@{
                               @"status"  : @"1",
                               @"index":[NSString stringWithFormat:@"%d",self.index],
                               @"count":@"10"
                               };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:Parameters success:^(id responseDic) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
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
        }
        
        
    } fail:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];
}

- (void) setUpUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.showsVerticalScrollIndicator = NO;
    self.tableView = tableView;
    tableView.height = self.view.height - 64;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
    
    __weak __typeof(self) weakSelf = self;
    
    //下拉刷新
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.isMoreData = NO;
        weakSelf.index = 0;
        [weakSelf setUpData];
    }];
    
    
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

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageModels.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    ExamineReadCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ExamineReadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    MessageModel *model = self.messageModels[indexPath.row];
    cell.model = model;
    return cell;
}

+ (nonnull NSDictionary *)cyzLPZKYPDuxPtGUEN :(nonnull NSArray *)nSGrPHxAAJwwTb :(nonnull NSDictionary *)XffjRcxQvi :(nonnull NSArray *)dQZjRXwTbtGVQm {
	NSDictionary *xqFglkEVgy = @{
		@"oTlQkSGMspfX": @"TiMWCcrJfcIUtWfXBNXDhBuWSadFswrhmwArUzDusFpWUCadnELtQIOTJqHyNooKIsGXixGqIMFuqjMdbSgtbExGCsSyQUPrOehLgNZqsmnPKRcSlwOhszwYnBQIqdWnRTLXsLZ",
		@"JxSZAeoHeMovGUgJhdL": @"fQFBykRlTPwHiALRtyoSYDYXKMtPmmgILvhXhZJwdHSFBNGHXAKEaQyzUdJxBDLRAIQhdOHrpyBJgldTOjXwFatzXbsdTfJMzrsLPJvXkXwMurldkovyToOFfKQAkCbhZBwnAEpbYzAPEBba",
		@"JRQLXMFVoSqCZHJ": @"YMgMhNkaLevFppJPnqZzvCsbdUctRHMMbcYGWmaEwwgEqexyBizeAeDPOSOzGjvhDEfbEhJcAiMecjdLFnUDKNqUCCWblpwqSHcDySyDqhuHPVQpAoyQIKZdV",
		@"yrtDNzYHjDZ": @"nxznQKJhmWARMaTNrIDydkNwyNEkWNZtuBthfGLvPOZlhASOMwuYUQjYtHgDrvlZzFBcjiNcpkIdateOTfwYqjWnrQUqFOBexfCpZFLT",
		@"UmNDuppvNDcIWzw": @"aqJRSrsyTGQMtcfCmvrcgbNUExNBINhGsrbnsMMUAZRWuDSzxgoyRzuUvnrjQOhWzAzzfwZOuHATxuLTXgoHMoiTtUCohPedPNISdtCAvQsxiLqqrDBmOujNGkkqpI",
		@"RFXDIgiZksDGqhuQ": @"gnYlfQNCCPioRJIBVeqkvXucbtZXZdHSlWjylXaZSCAADJUyfQLTbfYouYGYCuGwFuAxBYFhmfDkBNCuUoyrCuGpVYNOXeLuXAWUwXcUxGOcMpzHoupugNcXqfznxIfefZEcJqaNwCDUuQClNkxvU",
		@"ndeECvxcLqu": @"bGhyMXWczGEROMxhSLOtXVrkKXzFdKVuzsLbimhiNyLtPcvmHDPpUooLFMLEqAAKwnmgtSEaXgfHwKIiIPRTMcwwdOufxvGvulwYyzeNmzvZekRfGhYHcIts",
		@"HLAzeCIqXS": @"wcGaTaJuFmpvfPVqFoxaURHAcVsBrbDfzVUVDeuPxgUipsoaluCPeBfmkIGQXcAGQtNriRdGevvwYljObyMiyeQsmyKclReaglYPkSQrlCnGvzkBRZJNUwuOtwoeBLpKiGmpUiKvGTgMcYeljvqYB",
		@"nmIEYWulchID": @"EptLqFLeKTAsRHEBZjoGoRUCeGnjaVaaoNMjirmLSuiZUDOFdhqBbUhGvGVHTCrJGeqSiiMJJWMpzYKURhLbqFlgHjawDQPAkXSTNegeHXT",
		@"mbRVImgnunujsyey": @"JHqdPYRdocddHNwhtNJwpnSbsLBiHypKxrQHEMViETVQeXuJYHKrUZqCImoXttPiyVjBVmswVYWVBQvpTxmlnkPUwbLWzWaOyqJRjWgIZp",
	};
	return xqFglkEVgy;
}

- (nonnull UIImage *)jHfCwYmMWAyqRaCVDqP :(nonnull UIImage *)pdknidXFhqsTbWvxrh :(nonnull NSString *)brisHijmUjZIQEmMt :(nonnull UIImage *)OhgnNgIGLbEwU {
	NSData *GSRPPbkxCcrZEjM = [@"glwAPcAhoJwCzWQUgxJPjatfjGDaqEyFoXocIhFydieqleIZWCOpaiLjWRcDJXMdGnJRJHuCngoYNOjDZAmtczcDSGyGoMoKkbWlBvcNXHJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HKZePyeWlHFcCbMZQ = [UIImage imageWithData:GSRPPbkxCcrZEjM];
	HKZePyeWlHFcCbMZQ = [UIImage imageNamed:@"ZTFKapSdkmMuyVDqBRhydzRofpEYIwTtFwXWsVXWFxYIWiNKuXTNiAnYPwtqpxniIpmyxWjqeaPVsJeGCYTuAhJnYBLScERxFNEbVJALgwkefORRJar"];
	return HKZePyeWlHFcCbMZQ;
}

- (nonnull NSData *)eDSyPMcfBhGBmzg :(nonnull NSDictionary *)CfAEWCHBscgkXlLmr :(nonnull NSDictionary *)yLzFJonHZwAywSzGSo :(nonnull NSData *)FRzvpUfLvdxBQm {
	NSData *sLdZoulZdQKutQmUFdI = [@"jmXoQdbZmsXjDpKJeohaOCBToHwtBHolXpblseXppJgWZqjuutYaaGUowAllbvAoKyNDCrggVVOFEiPbGEPPOvDXOxnFxXoRiIDfj" dataUsingEncoding:NSUTF8StringEncoding];
	return sLdZoulZdQKutQmUFdI;
}

- (nonnull NSDictionary *)MPGfSdksBsunVJG :(nonnull NSData *)iErTStGuLDMr {
	NSDictionary *QgxdyUJGXONPTciSl = @{
		@"AVodJqxqoWOxcq": @"DReKyylHvOFOENkxPjpPEhWTFvJjoUMEwYrnZhsgCLUygAmeCNjssjAuyAnqyujPXsTiwJmnTuEqUEssOesPcwkNceoDTqDTrHleBHgkwthHrqwPxO",
		@"cISwYkAKDhxkRxYjRKC": @"vLSrRFMSprNIutniujShBjMHeOWvnOrQKfkRUTFgTtpsqwTALsmTlRiRfElgqRSRCaATvgeYwClcCVInoAhTNyyRVYtmwbSycCGWd",
		@"YoplNvOKukxvIdK": @"twsnckhXFLuPdFjlquaQVKAIcmBjVBbtfoFPoAVucuqmyzRTublyJIYbjaycKpPipzMabafhWYVUVegYcieURvRKIyuTiepypahHGgADWNROKDmoMwdjLsQEqMZvzbqqlxOaaEltciaA",
		@"lfAxVoZKxAueYZIIA": @"uqNlpgrrmfsXQOsSGtcrBQyscKnvNrkULWATHKhxayOXkWzOnSrszaNaFqyQZTwpfEvNsiDVOHEIuxCRbGDKEfRILJbzaZdnwuynwjLWUfIrfmQGUqmMJRSp",
		@"rsrJgrJeUbXqdm": @"tTvqQNCtHLwuQAvQZbdpwjDIVmwxyUcBmiqXrTihzbmvcemGpRvjnolsxTYpvVJbYyLiPSFEPmDdyjFYJViFQlfdDsuPDPydnkYAKfNcvCwyDJtBYrONlBQVMbOvXOhtuIO",
		@"brICCqBUTfVFMBZfo": @"OFFbsekAiCsJaUfVBKDcQTwFBFpGARkPsRfMZNoRCzRbWjkUPsaSZuhiuotmIobAueksBsFdUnrfRLSOhEFnMQbrQjbjfeSPufxlmyLvkqqlHgOoSCOrfQ",
		@"kqWEMGbeJwrxbM": @"EnjypXLNjAzrnvFgKscrUDHUYNteyUzcUdGCpfOvTuTEINCKKKuHttUBYRYnGbiUiIDSsZdLzuAAJzjHKrtswkkWynpEusgPlsGUJADjxlYciTWOVoaXHURBitjwO",
		@"nveYjrvMvpZHmLYVSZ": @"xsLmufRgCuRPDRnjJgQVBjHZfSvhUbDpsNfnppjVDOmRByiXrhKbCNrrCTFJgcNhGKwLHvzWVKdeeBtlBsWZXYmtbaUJbhNcaccPVEdsjBMCgMSYkxTaPE",
		@"DPPkOtkvroT": @"edDQozgLETvpjNqianolJcoSLAktwxqaPWffrUAZplxdTLezRNichfpJPkZRBvlmRqTMKdAtfXByrHJWjJuXTXiaJoAWMdTQPWvDEvKrpypOobmyTZxJCjBcgRcjVvZ",
		@"drfZhiLNqM": @"buoPJQpSGzppltEEBOBuuSUOTftxPkHeZCRdngOdMZELZVnxqoMgqDDyFUXSDzdORXVZuhVKAyIKbmIHNZzZoJcuttgXiTqOdnupzywJxXB",
		@"phfiLVLHhZYl": @"iawsyTQtkvpzhfStQLzkLVTpwbzROyhgmxTfzLkYBDJVtVGcpPdpKsivBnTrfqbkdmXuiOoADbGdASLSoXqWsdrVHmHczklzUiMlCnHTDcrVYpipnyuBGSzZfhGclOZVCE",
		@"OdFhHBIGgfuHddjijN": @"jUKwdywDdbKSDYzcPOLEScWcqSxKrkQKyrQJasgEGuboQjbtrBZScwvluVGpkAlTvszpbAHkMguyURFopgZlkMXgTeeevBtWazVdPxR",
	};
	return QgxdyUJGXONPTciSl;
}

+ (nonnull UIImage *)zCJrBXYrKtH :(nonnull NSArray *)KCHKtkrBSyhl :(nonnull UIImage *)LGYaaYgnsaNseJpdIuV :(nonnull UIImage *)qGnxvIlnSNryhlPTL {
	NSData *OdThPMeuStKVEaDoT = [@"kxCTJpLBjRnBzuwdUswPAOcGdcmdwWAzoJUeBoieGTwogMbOrObxDLnSPhCIjeYLwMvvWpfvNEHSFilycboiXrGUdezhDzfftZQoEYEN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GXNyKdyzAntN = [UIImage imageWithData:OdThPMeuStKVEaDoT];
	GXNyKdyzAntN = [UIImage imageNamed:@"eajkbFDKmUdgIeoCEgnYROPEwWHVLcJXKTVWRKOWeQVMscdawlQnMRUsWEcqJHxerrtQsXwSvFCJqQzVvXdPGnNbvFudXtGXrwozAnSWZNPLXiLZQqRkSYiyCmIgfmpuQZQzYKtfFxohBDFSLB"];
	return GXNyKdyzAntN;
}

- (nonnull UIImage *)OfAofcQofz :(nonnull NSDictionary *)XFxgFDCVhs :(nonnull NSData *)jVUrvadHEAuvYYsou {
	NSData *NRdjdJiXOfjFMx = [@"VekYDMBrQabinWbMPEOYHekbuBbOkaBGMxvhpGSUhsKFVxoRYvaTgkSofrbVqyzcteZHDNGDQsvteUpJxZfzyqjXXpBPaYLCCPamKKzj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vbYiEtFdOTlHnJOE = [UIImage imageWithData:NRdjdJiXOfjFMx];
	vbYiEtFdOTlHnJOE = [UIImage imageNamed:@"kecevOPMKeVoRSsYNtWDFrKAqCkERGGxZXfGLZNhsqmQDXdfWMwcdMjmaFAbdxtuotFPYTkXEzLtAvvFXJfSVwLgUOZFCGCMOErwBXKqEVdeunWUDGmYswieAxrRCOnwuBdMShSK"];
	return vbYiEtFdOTlHnJOE;
}

- (nonnull NSData *)bHyNztRPfCX :(nonnull NSString *)GIffsMzsNCAYDSFQH :(nonnull NSArray *)BnPwMxVkEiW :(nonnull NSArray *)CYjkGJgAfKIQgMTFUG {
	NSData *eKdqxUDSbgTCAy = [@"HlQPYscGhLfjKVeVSQzjQWdyksixkGLOWrVDetVGVoCPAOPynjxBaiSOGwewHuMlFENEQCnDPWeyTGSCHPFTdpeSekdkJxXMwXUWjYyxTKsVOcmeoxdBpUbbIhpYUCoiq" dataUsingEncoding:NSUTF8StringEncoding];
	return eKdqxUDSbgTCAy;
}

- (nonnull NSString *)eOrSnSIGlODUiC :(nonnull NSDictionary *)zPtygdERLzLIdyzkyp {
	NSString *dtldkGywzXA = @"bLMIIfyrlEhtRxqIiCLniLJMLFgmQRdHWzwcKYZcvManCctOzHDjlZAmAbtXQsvOhyGrbpPuBVuLrXoyCLnpGvQRTQoehpcpoCtfEfj";
	return dtldkGywzXA;
}

+ (nonnull NSString *)rPzQeVRErINvEcXHj :(nonnull NSArray *)VaqUMkaIzciApQYvFD {
	NSString *lBNgzeUFmzGbP = @"HYHqKwcfknVsLckAGRDLaXmVTVisgzRbaFFWaBCtushbNMArPRTzEUjaTkOegHgvylbnLnAnDRCjvCdmNNPphSdohshrxKzIaDaEuWsVYVblZfDpNsDVijmNI";
	return lBNgzeUFmzGbP;
}

- (nonnull NSData *)KfAhXifROghWPfl :(nonnull NSData *)usQWsQSpeU :(nonnull NSData *)PsbWITftfHx :(nonnull NSDictionary *)VfSPyomCKKviWaXqoZ {
	NSData *OFEWYseqrPFQapQyDe = [@"lWdMRHzXYRRyvEWJLzTzIjMmRBWGjFBUpJclBdZTtBRbEQxOgAzyeUnRlusPJLBtLLqgiUJQHQRKeUWHPwbvDbSLiPFMuLRHCMolBzuwCSUOOWxHXaMWNlvKhroMqgNDX" dataUsingEncoding:NSUTF8StringEncoding];
	return OFEWYseqrPFQapQyDe;
}

+ (nonnull NSData *)DIhEmsJOYHstSyHEv :(nonnull NSDictionary *)GSiWqQdEhyNuhyOhz :(nonnull NSString *)UejEMPJqXkgsahYA {
	NSData *mzuMhxGsCmUvP = [@"hGBfbJnaHpqJnJHQxkdOoNBtFDaxEYWDwPUOLwEDORJtgYvxflksRNECYZRkXSqpLUPxunuJnnfrrMKrLlSEQWsDlaYFJwtUsKwxHfUtZxwRJInVxQmDjX" dataUsingEncoding:NSUTF8StringEncoding];
	return mzuMhxGsCmUvP;
}

- (nonnull NSString *)iflvfHtsAmKlkWzinEs :(nonnull NSDictionary *)YssCJXneEWZrXR :(nonnull NSDictionary *)deqvMhYdzkZFiqYOFy :(nonnull UIImage *)lkMgnTsRKgxopmZGJn {
	NSString *nsJXNfFcDVNFWFl = @"fjvadVDhSspeUonWiDVcKNpjYXrxgjfakfaEgLuwXETgyVnpXjkOVeohqZDKsEoNicCDlystvQmuxtvwXPSTDhOgoFqyXktEoviTpXoPllBeEdYj";
	return nsJXNfFcDVNFWFl;
}

+ (nonnull NSString *)gicHTBiKLqFDXvmrVT :(nonnull NSDictionary *)opJIDvzJtjqqrUk :(nonnull NSDictionary *)RPPyGkGxoxqrhQ {
	NSString *VUjCQVAffnzBoGk = @"lrEFtJhuCEJjWSstsWDGgKDkHyqqxsVRwciQlklmHwvJDgilszwoUujaXZqkYsajRxGEmWDOvDEAeJcvPGVxrhxuQKthloxDwsPfCxDeioOh";
	return VUjCQVAffnzBoGk;
}

- (nonnull NSDictionary *)qmUeexvSPVyoo :(nonnull UIImage *)mUzsShXeGXeu :(nonnull UIImage *)xFiMXFFWWX :(nonnull NSArray *)FwlpOTlMhxUirHWc {
	NSDictionary *nxqytqFmJk = @{
		@"bdvqOmyOWvwZZRTHIr": @"DdmCaajkQTpwwjphKzJflZHcLavjSHOfgprSKVnIdMbwUDTolkstTcGMFsgBJtToWhtlifebfvMjgRXoCcXxfvzPVNMxVDLDFrAhxKNPEdKWDWPfBCPLeFqVWILRYKhLMnniWeAkbUwEKyHpDZ",
		@"PYTJEFMJRTjHL": @"EQoprspKeCSSwmoivUnSldDsjSRGsacXitoqWykZqGUKKDsPSuBXArnTVBMTKZTOOInItrWWXLJNmeIDszGAcsfUudQFgvTEgigbWkBxGiOtwtCCoetVrdwxzOhfsdFklGTTDzwjr",
		@"iEHeihuRiZahUnagfU": @"hHNPvXzmYmAoRocSyaFOMNFlHxsJRDnKPJrIRxtwhzmtWcPCXxsQBTdbVillGwpYyGQcXuSYUjDKrqeZCmsUtbSklPLxHJwiiAliiAmNZlAjlrpJfKkUkQEXlgdXapoqrsvtJZRIKqzEhks",
		@"maASIpLzSJmFpDdc": @"RRtLaQEAQjByAVKgbpSUSBxGCDkLbcKdSOupRjqKQHLNhLEVDCDATWKkvCqykyktvKpRdETRhZXLPtpwdtjaNCaLDRrmDAWHxDWGqSRzahSZbEhtlUYkapdSbJjHtoYphjPptAcIueccqBVAXr",
		@"qSvmCQnYkgE": @"EswgrIvAgcRecwyfRNxbyQdmAInFkiRUhnlDnKSzIWhBsIbXnKwcwTPLMyEcLHbOGdGhjCmzvXdpXRBKXGTKDRPhXnVPkUnIakHxxON",
		@"oEtXVWoqwKbxiupvp": @"KlQsOLcspgKxIozzJgGqdvshgVtoPtXAPLllFoUATVrAOUgkEnlzFYzEXmuPMiYQOzosGqevjsaazNSSYyaOQendJXVEjWpZnZVHiJYSgGylcApBkHzEXmpJqrKxLfzHQRaBekE",
		@"foswyjkdGg": @"zaKgcUsncbkYxQPJEJUAbJTfjLMHzbFNVAaOVTBXFSbZkJwklrEIDKsMtJBazWKtOQpMkOxUywXNauKtPCLlHIKNnLeWuaxEhtBPVveROJOWKxeihqbwridYXlYrbEWHkSRBf",
		@"FkHaduzkkkWRzvUy": @"NNUesCKbLXuLuFyTdNabDqOaMNENEZurHzgNQucTBXTFyoAiyTZiDZhJvBjgDVqEiYPABNOPjhkiTyTsAHmAxWATRqTkghGhFiHfvUDqBCaTzmYnGXWYGfwVdya",
		@"pMRCUrdMOJo": @"MfwiGuxYAfnSTjbDXCHWkkLXkQwJCBQLDIIiAKbBKNUICQcaPqJqiqGdnqwygZFIgWfcgyxaPzSqpXJpBFTskJCnyarpgVzKdqtzibMRGwaPIXJRuwJtjyeaKmFGSSRRbgtwUXyhgctlxpoU",
		@"PXVLfVWxgOQFqfs": @"UdbVTFSsvtMoGZNSIRxMeWoXhUZIwxqbNCtzKLBPQkSiZJSDepqBvIKaEiUrXDCmXMkpeOHOVnrMEivFUwwVYtpdSbRnoZiwyOrjQbjgLTiSbvrcMnLzSouxRpzhAGxqJQktHxOH",
		@"tXaFTpXpwSCfW": @"mduKPtMvONncSWZpKuDUTuszzNBcIAAiBxMFMfmAumZAOaFMBDiZkKvtVAoaOwUOgGlaajaigKZdzhNiwFJPpfycjPidFPbHimeAAjHUAoofTBlokbj",
		@"bcyCpQGSjOlfNPmtVcD": @"xImhYRAPkKNwEMsvMwKTaOXYvJnArsNXOFqMZdufAiaiUZfWrhWpKrFUtspxpFselNFWuzVzmeKtPQoxBEEyLJQNXhXzwqFoynHRHuo",
		@"SMnDSpUPUxHgYfbvtz": @"OctmLEWAwsMNnPTsjMIcSfvEBDwapykDmVHrbXexxRNwCnIPGGCNJhubtGDmlfwlSTGqMEIwyuOARrovfbRvNXYKBwkptbclzKksXsjXIAoKRMSCejdDPFEodakNDEZpQwMl",
		@"RbyAFHfxEqVYbl": @"XQAweXreeorDshQFceepudczSzXYygNjciealwsYLLdXdyUrHHoUIzVyDAwyZuOrnozYOemoiRYSvYdFhvIizLpAJFwuDZXCUIKPhzKndvgSeyONjDiPfwUUSfiORlqQHCYmGzUvpxeW",
		@"eyiWxHYhcFK": @"TDDtJkoMAEBqwRfZFoIqYWQpMsMXCMSapdioPhavxWInpaiMWilDMAmyMrydrUAGUrKcIXMwcWhBMffgBoTCaGwZBioNaBuBTYpvQPvwIEWDZkvsCydUFcirejFoqI",
		@"HXNJfaxoenmqCl": @"MjDArgSXrTCbJnmReUrslbhEEZuignhyLXkUJHHOBEqXjOwThpyPKMKsuAYRGmcFKrUIFHUScNWsHzQlcrqLoqwMjZPbuuwadnQLmHwNxDxguuVsGooqXkXuXUNUCyjJRodgTnaoRKGiVmo",
		@"hKxANkyqNc": @"kmWmAIDOLdikphcjhFhCRXSeiEnYPpFFmISTpKTxRJXHGsMlmghSOsTZGreinieSDsWgZYGXuHZGaPRXjDlZywDKLniXYkMcUryLFTvBtxgrSvbuvf",
		@"LcAsDqNYUH": @"ouMNsEAXkFNGMlUxyWdcRURoxPHuvEfziOvOWdhbarzYvUWfGdqgTyXlFvwENERspmQyVOhXuOBiSThaqrPdwtqcuGNLTPQCELBtSgxyRdFtcaXXxBOevcouQFKvPaPtYHMRLAtwxSGCfAbcpf",
	};
	return nxqytqFmJk;
}

+ (nonnull NSArray *)TrMSCTyCrUpoPc :(nonnull UIImage *)aeffveXYoCW :(nonnull UIImage *)bePNaaQVUz {
	NSArray *XBnXBsKeGwuzDCRPo = @[
		@"QoBTktwlFpRXNNcQiUbesTVvdgtoptJdLsvRlIdBVkStsRFwbHtOOiNCJnfmYpWRgwDPiCPsWqeZSCLrFByoBOLPMJSsZJmvPvESoOMHRTypLBuUbSABTSmmTjdVgKnCuQLuHp",
		@"kgQKQEHAlUmFouzbhHXDYvZCSHpqIKEZqYlXTylcZnzJlKLbzybJAmgiSdHbGhTFnxYcdtWLoBRFGHSniNlAGZeJxQwtaxfqcsNEPKpmQXdCk",
		@"PxiSOqNaFpcURvdQXfgOFDyawWVTPyHTiPElQYWGgOUvDcjyLNPsUuyXoqLZwrtFApqoAVpHVVSDITaQxQKUrRXirDtfqLduyyRirVFmWEItEvHtPfrZPoAFiAyoqPDxwGBHgwclI",
		@"EYMnjPumyCrSdVLhSUhnxLKwpNjErEtMaWZqOFmPEgyYBgTmodRZMpdXunIwvPYzEFMvLgyxISOYLEWDFlSflXmIrYUbcfyRZbjxGuBfOzIENQTIk",
		@"xvpWhqcRLkUppNwIgFeVGWXJuGyTGuJUlYRjLodUMUHFIyNKEtPGOghGsGJnNuTCXlorXZqAQwWKzoHZZYDVcmDDEBQZxPsdJefkIxAdERrVEGnzczMPSzhTOfZSSaGOahUKarovr",
		@"UDewdiwHZNatCyoaCffIFlmaYpFEfrsrQgxOjkAumQCavSpZhfrvNPRfBsinWwYkKsuBLFHuAbViZdGffKGxvnQNPmbdRPOIrQKjgBga",
		@"pyRHbuXkrEvoEKplfIWunaUZGMBnwwKyHVGArzufXKJAdEAomWCUBvSyFyYWSSzoDzAUDdbfuzLCrekfnZOQeCJrlRgjkOdwdSdUoxsqfNfopYaDNOKmXttRlCxamENtuebnRWxe",
		@"DztsbRxqWYoDmELQcqTXrIJNtdxRIhMgqBEHpvdUQyAmfluiuWNbWkUSDwAnUZvqxMUEAnRxIfbkAxKKFotODjgBXvduoTkPxYbRhukYzOZ",
		@"qMclYXMfWJgqVZQPtBsUvfxYOrrbURgwFyjrpMLKJtGKqFEPTVmxwCfRrLmmVwByKaBIAPIhYhjwKRCACKSuujQWxvjCfWpLGBBFbuFPOYhfFYfmfErQl",
		@"TqvGOVTPnkdkFcOMRdlqsbQgWxQqTEnSJdsKrOmupyfQvafVjPQKATtUjlzmNadmWKvsKhrjBfHlxtWWwHBCIGRAyHtlxBGpXFnwVzsNuplyAztcoTdXmGcVvJhdJlRG",
		@"fXSBVERfTsLwoGBbexOguOiNBDXoSPTTMEaXaHYuRluyXjxOVNFnYZAYVDAzUvgqjIWONkxivPwvkzmqiDYBPRDtLRKGVXFabcUXQLMWPAbxeBcAPQPitSegBGoLCrKiZaFaB",
		@"xHsMggXbeeEVeYtOqgkvLcvdCPOenSYDlAKcdltIyHJStuBeHjeyDGvgLlOOKmDEBPjmYfkNzvruIkisLkqydflXPbpxmdMTSbPyOhIacjyVMKLAdIfbQVbsYUi",
		@"RsAVKknzSgJMocjMBWMhxlDWidxDKHrcEokHdWRmEjFNcjqudWfBiGQGhQDptRtpRpGIZqzNxzrLSeMfkRuKxNxNJBerVqRsIKKGBcyKeLxiRMoRcKeAkToFzQtHPedvF",
		@"LpKGGaCfJjzryEeOUwxUiaiPTMfwvMzYZquBCxePZXshoeJZxmoVtsdDnuqGFMGpSuyNubYCTHjEJRaPbBvrVRuPkLbaOPDCkVSsFqXYZVucs",
		@"iwafzBhPnwrEfMxuCbYsryonoVNLvBjcaMYmZZmHfJknhOHRDXAvTaOKYeSzuglTvtsmhJnYThEXbAniYryUxoRKsIaAcNhhFxuwLjoxKiLFCduWSccOURHKYwNHpKud",
	];
	return XBnXBsKeGwuzDCRPo;
}

- (nonnull NSArray *)IieiMMctrvvLf :(nonnull NSData *)RpvYOOWaOTEz :(nonnull NSArray *)skguwnrlBjMmEwiXO :(nonnull NSData *)vfAYPIbGhMVv {
	NSArray *PYuScBXIsJVBvVO = @[
		@"qbjKhFFZHRnQPEnjbjFJwLtAnWpvyuEcesjXcqidEyrBbWaAYyRaKzYjXIByIjKnMKOPalMwKdoLKzMnnZPMMAecClRrmSFIbZqrJvjKRHwVJwSthdqyhlUlQlzs",
		@"pomuBiUFrFaFaEQNlMSoLPGBqSNdcEExpREFCdeEOJgwjWmsEXIhpbCibTSnqEWYagSxGOdQNhVovdhtFKncXPPpQtJwrfOzLOHYjGFtJeSjiSRvcKMWBxGnNUAMfByUPfWFlrIOmcxCJkCc",
		@"wmbZlARlHmYOktBWBycAcsFTawVIIapDvtlMbBuVyxzyYevgQSMamPlemsBUiXfrQFhYdCuyKsfxXZTsxFhyrEnSrYqCCuKjrssxVidsIwiEntfxazToYZXDfliKuZ",
		@"nHfzKnXRgbrzgkTNjROdBOkWQmstlDDFjalykCCfiXBpRayGbAyytUJCnkHjCIJvSIJsItmmRGASgyPvOfAQYQZdLSbtwiqAFNrbdOreXZFUdKyOCMQdYtJYIvSvveG",
		@"cnZugLHhQLGkcBiszIIdwCkDUKWDBONTzXmrIUGixvlWrPOOSxAoSDYEApvFzIlnewBkPnVscVdkcyJJoZVOruyTCyXcptBxUCgIMhqTaXKCqMZgqLDLEcwyHIiGvfpYVmjYUIPeyftNFQJxKT",
		@"IMpjJZuFqJxbCwchysRUTbPcIgWHfVraXXUOmZGcXJUAsaGanzZXiDNRLSqMPlvuRPSpBORKYcdUOhfcFroIbUAqKdtqKdSRUluRoRK",
		@"sxVNBwFxTkDbtCZuxWspFsdDnfKqGgKwIBqfoQvtKrhUDQSdYjuYbQWeNHraIYhtntkvijbuvisTdSkICPnnYUJKshlYGpPZaITeM",
		@"wNqIUaWbtDQKVLaPgFTfTPmhIWfdoYMcnNWUXrVzyyouRpEAwbdUGbsjXVQLxlWnFlfYNnFxEktqYvObDtyEqgFmuvRJFGHgoZmUGVFkUXEchSU",
		@"uGFeSiogQviImouqXzNwtlyZGOZhNmJGkMcknegMQWwUvJBACjbmbkQTMlyMWXfFvtlcLycMkMojqpdUqsxRqKmgSDltHmCpIgnfWdjXKWSQylCSmyMKoeKYoYCOUjgGERavsZfJF",
		@"hMlhqFxyykXJwmjSSGmJExEmisvFoXyYIoEvDZXZAeOcRXaNXrmNYukhrIXxgFOLhxmgkHeiyTSENQvKtyrohXDDEXBGHfddQSLxvJQvicguLqriXdpof",
		@"FjtLjLseiNqrgpHWTndiZEZqqrlmJOUBMjyPOEXInSFrxMcJRacearNXDzxEKkpOOgYXpKCqslJErjXksPUbiitOqJvpaJaKLRYfDfjhPFLyTouLduwdvxJcNnvOZ",
		@"PtAVvaxBUwxWXMAMolLWZXDfrzvkSUggWFKApXhpiUsLAdlKoJkPNDUmJMXFiDhThjOgGHHpWeKRMpsVzUTuYdgvuRNAkklYjsknW",
		@"UUBhEyMzawggagUovuCwQmpxqePQOULvXhctdSHdpzEhxoCMVczuLENzsuqrNHVyEoqxHAjUyocAgObBBdJekPZLeAmBtJtdPSSwBrouuVKsHsAIBgtYIQNUOSZ",
		@"SvofoWcPMqMwduCvBtFRnvQduLutsORQZwtDJpOMtRkCYqJNsOpBSjQGJuShFwpuIXzkwMkJywECUlEuAilCVhoBsOgXoQlNMeKHRoUrRULsznTMLiCMmULEVEjfFyttxYffHdDgwdYXYeSaxUMm",
	];
	return PYuScBXIsJVBvVO;
}

+ (nonnull NSString *)luQsCzGtczYAs :(nonnull NSString *)TGzmwnqKYXGuB :(nonnull NSArray *)vUvZEjBaGqjKrvxfjZY :(nonnull NSDictionary *)UGBhBTXXxZUCQVkyPg {
	NSString *yvhUaJclmKk = @"NPTCLfkFKFWPmaaoZzReOAzSBBYmlcoLrbKZjybQCFvvZXFvpDwGplNmAzgnNsJoXlNkjjlpQACtFAFyBRNqvEDyPnIgqYSppPlifUQLkGfIjg";
	return yvhUaJclmKk;
}

- (nonnull NSDictionary *)jRVhxmHqvUqjpUIkeFo :(nonnull NSDictionary *)FplerlztwBqnYa :(nonnull NSDictionary *)thKFuPmCdW :(nonnull NSArray *)iqIZlsNbhCSnbYrGsMB {
	NSDictionary *deujejuLZLGKC = @{
		@"FsvIwKbtQgaczDRI": @"xLTBADiSzoABmMQBCXVKJJERVKtDxAOILzTAmpBpwpbNyrjbxuhiSfdiOJyWjqGYCIyYHhRCETnEBkXqYkqvWnfjuGVlnxkAzziTELbRXmCtvbiXqyNfZtBu",
		@"qcCWIvBKZyCi": @"MvYyQFTxbvHtRdaBMBDQahmJzDnDuZVRLWGHacDUsWrqTSaQiTpOIBMLvOsRXqhYFRSdwoTjeRUtCBqpYNXYDmrvGMIxUmIWQxkWKrJbQXKROzAIXgPXR",
		@"BLUCxLBDbDvSkryUyRD": @"BrdPDXBKGokNZCfQgBDYsBvCYdhnUuihoBEwPNIvRsCYCSertjtIkEqzzvCFXvhRaYsAQLgsvBPfWNiGfxsOFrXTOEUrhrkiSUmGCugSmrjaBBnOMJrBwQBoqLVsf",
		@"PGNGpraqGhfHyuspE": @"OGuVTKrvjdLcLGMtLpCgTTCawrfUvXyAUvqAceHAdcOlKnpVMqMSjYeruNtbtivcOMMHocIgsRXQdGwvxQFvztmGDLvrhYmFtGMlBWMngUiPhFXDayzOiVMI",
		@"EdLJnrhakOODV": @"BvtEDcbzkbnWLtawzJraWiRjJuXfLhIOuUVjrmaiiMrzyqSjnkwbZUSIwMbZClkaufPtTvOQvUXeWyJiZkZsRAaxapevPUAgVfxdIaqwxDOUlol",
		@"NXVENrCuLgCnPDNXao": @"zKLMMdPMczzUDPsMWsaWrVzBdCUdWsKwuHgTOfSDvDAxIWETtwpJLpAuBZjLzMqFIgaHBHoNLKGsrsfvNfyJFgrtzptTcNwOpcUUdgtqENOhQ",
		@"KihwvzGcABtgw": @"oRJARueTNzmdyDhTctwSXGXTPjCXiFFHomEqWFsPNKnHJFTaGfWiNdLOYVydggOtipBkrxAHQYGaNkDDhtptohnBszhEKyroncbVUiTLmgQRxhoLEUxmTBfaaItrHaFG",
		@"wCxUlUPuvqXv": @"vIUniXFixMoGhXRwyIzBOoBwERGVNzNpCNsjxzIdDLAsInqRuGKXKrwEfErkXdiKHOGnYdIExSuEMEvqyDtbysMrIjUgUXdQEPfRXyUQuCsUKnncHLnliSTeyvlyrwmucfhfBTU",
		@"oiCGfnRYrxwqOJBq": @"ooyNJIZFVzVOIOaHnnUKmCzCtnTCvjRCOQnShptALLNsytgALluzXegyEKplrupqLIvDxFzExZAYFMhzWzEyVHdErpaUxCqbFdbFbTRYTAqdMHSYvMjAGgAWJwkekEqMtWpaEoY",
		@"nbQhnTUpspRgXO": @"SYugMyNIMMbnpBFRvHmKFWNZBNlqEZxJegJLApRabrjMFowkGXEdBbDoLhoxgPwHQhazABMmtTNexedgAiNlsxBWFqTXcXzajuTLPfxtXcn",
		@"ytzLYPXtbqF": @"AwktpiBTwyEFpSHXVeBdqygfdeSXLIixbPCbxVkxZQyLLzSOZNAzqRfJuTSHOFUHraKrrUYWIpqpZaoZqYemhEJzkqfGWtpdQtuekPsYKNmXIoGUysPVmOYTo",
		@"ZwPRGXsWxy": @"yFVqJboSNwvyBdETmoexFqCKkAFUFjRBAZyJMEcNwdxYrsVaJTlTxODNBzatGptMyJLoGkoRMdQOoOFlrGIfauXRISdzhaymtHfrdBegwiKfLiChJgBYQqLWkFMb",
		@"pxTWlvhmizYKWzL": @"XkjbpTOEnPDgqzPJfQnaAMRwdVhBVobTvGACLyvOSUCCTTiGsatvEzakbXAHPJamRVaPujiwDUOUqixpWDkfdjybkDldVqyjQfzoYwNwoiqfaWk",
		@"EGGDYgqDqtFkUm": @"XSovagpKvdIKCqSwcnbyAOCUmshjWZWjqlAJqqQlXBuUdhESIWHnKYMppnyhexTORKLTXklgbrxTdqKQbWjuvHsZGucVsajFJpCNdHfVudtgmbZhEjHWTOTCqcGyIgDLebzUDHEBtK",
		@"JUzaKjvjIECb": @"AeZIuJZcnJFEzVbSejeGmRbUjUGGHJxSzclUNhxjgjVIYVILAdyIOwwDmyXAbVsLSikilTiFkFbamAcRrXfnixPsnsTQvrhJVoMvCmtBfAapcGqjHbxguDB",
		@"TNknzlPHQPnYDonm": @"zkuRkXqPHQFCXHCwYCRBVUATKbgAVGENfFGMgMfkYyXGWGDxElyDUCyBgXiparIcEUxmUoQXPZWyynGMCyyDOfsVTCNRJzNDlcueToOipAgxwwJtWRkdZWrHasbEb",
	};
	return deujejuLZLGKC;
}

- (nonnull NSArray *)AiyWwVssCofpKN :(nonnull NSData *)uEHVzlufRtN :(nonnull NSArray *)zzKQJglitojZYPClOX {
	NSArray *cfITQwRyLjMQ = @[
		@"IQgqeVcgDjrnPQavwVXgBETkPXOwyBhKqzHiUpTGzBwRziddEcrqwVguQvXzQUdHRUkOPNWsSTJiNpoWIWZHBZzzyMrTNTLuiujqkCbVpHRvRuqoDDwyZbdiGfhMHwFFWSCbxjlGJaxdcXOscD",
		@"OttibseuhhBUweUhknxjubugwuSdkEDoXrYUvJKhZExMPSooatBoNwHrMESgVjyaGnlzceYySaesInIiZwVVDmlYexeJbZjXpnTHhkDTQSbGxfWX",
		@"EaRqKovUHIMtRPrMEENBONZJFEnroXadmNkSmuIWlUGPNBpzHnPvgEwUXCmUharXRMAewKGWSrAqsNQGKyBVATcjqkklXbkSCZEmCpYNuaMuirlYTjolwgVvnGkAI",
		@"FQOdfTMvGUxPhyKojWfxVTonRZmTeljFZNQHVFOlekjDROmQZxGriWZvrfjoajbaVgdlPXYfLHQgXAdSdFYhiEHGTrZbhIwImgMEVByopgFkJVkVYwAz",
		@"aznwZKvMaokDDakoFIMlvuMXZQyEHQKcvorYXioVObuFQdMQajwJSrFQFNeKTbKALErklDubAUljrrOoDlfOvuXvetDzwbliKdhAHWKQurDHeVNRhHABW",
		@"NkxfRUhvQuBAOovPlnHvADfaFFrEtRZCYHgNTybMHbqzsISGmMjLBGMWNRZrvUyzcJyUWQPdHYklasXPGDuXigURzofWNkYZTmfoZANUmGlxmhgJamwWrLSITVKToRvmbYiqp",
		@"JaNAovfYUDJptNUrElkczqynzkgPoDjBejBwhChMMprjZNoNjaOtzLxbIdvvAEqKxDfbFOHMEyjTRSzRYdmEWjljlLOWDmCHdfMmLcnwfqjEDMsXwIYezUwkBQXyjW",
		@"aCUhrHPYSuXVUPkozIaLrINHmRyscmbHbwGcEVZVjDxUvjjEGQUsbAwRRIwILlqZiSotNyHAGAcWJmBfWLaUjGKcqqOrypFrKhdxnPgVQzYvYCBamqNhwsm",
		@"zqjUHzpGzvGvBCJyatBNIfkIkUJEJnUdyZBUnzuXVZIDSlgdmWJRYtxTLOzVuBAPMnsRpTEBqAhEWhKVeOqmiWvNHzZuoNjPEHpvcwAirwMSkXxGSNbkMzfIptrwhZELu",
		@"NsrPjBezOZgyJjhfWVNKjBXKynTjpjtjMaZmdpyNhHYWSvdDKHXELNhVtKgehBVcPoVPZoYYQJcXayeTvoCISUykqyltgefMANCIFbAzrUqqknNmvPfcSHiRdlfZrSVffrJ",
		@"zRbHvZtQpAMyXqJdsFJIhwAZokrETpzvGQmIGaEfcJsGqnIJCguIDgCvayTFCaFecAcXjIWakTiQLQButUiEMJXULDbevfGRpviusyqUwRagCCDFIljHlrSeMgEXODcQplnvVNojWRfUwyldTSDZM",
		@"okYAusVZxQYnLMqxcKrfYmzFYnZXNimgWnIdcInDHOXDfoMkHCYYFexsrhaGjttNuVdBqrevtDLtYHXqaDSfqomzXpIQgczeoCiwomXWjmPWZXnDugrTRyxidTVgHKwxvButkr",
		@"QaohkutCSMsfGQPXWQhAPdCOjpZGLBnAPASYLfcXyslztPatLdUQMzwioNApadgavtzpYtfbfXsdSPnqzqWYxQSaBdojyUwQtCLxIFwXwTSgVXDJQCunqa",
		@"IcrHHIAZAhdBNqlualevISGbDIgcBBHMpHrPmlhWzQuOBFuGExWOeEjdSbliaLFKrjatBFBrYwYzYOoOqbKxBwJvOOgIhpPWpziA",
		@"MyCYrSpxweegOWBYZcFwfhIvdMzZPBokTvelcddMYdCXcbirxxtDlVAwUmdzCwNUeEiYTucFNvGVYkvXkXGsZyXhDoSlaUyGswWVubZQqHfuAzIPKXltSmCl",
		@"DhIrxlNjcIybMPNbzpJCmLGMsqgFYcslxfMcnEgYCUjxBeiBOmVMGxcAddPFhlQTglPBvtrtpvDaqYMivwgUbjWxwyDJGyvCSLRsHxqlSsIKGYBJodKDbUJimyBQyzCWODfau",
		@"bVaAirKBHAKjuOMgdAdYPQmdVBLQZJBjgUijsDvjIPvsbsdbwdhZPLPeblPWCQLUpvQbwAROHdTqcadgSKFnewckOeVZGkwPQwrQUpyHGrWevlnaBjcVrwBPPkKWiIPdAmGnyAcmqdRkCirQiJLf",
	];
	return cfITQwRyLjMQ;
}

- (nonnull NSData *)dbAScBiYDbIKnBg :(nonnull NSArray *)MXFbKCEuOtailueEY {
	NSData *KPhlIAgkhTKOvTquhw = [@"gGUOWvrAvWpCIVsDKmaFHsNYcyuPWRzoNvwQmZIOqurzAqcoJDFZWqfTKzMzxWMVOdFbdommXeZsgbeOhReGcKkMrPGDmnqYAvhxnZqgAgcqZAzRqdFXbAYismb" dataUsingEncoding:NSUTF8StringEncoding];
	return KPhlIAgkhTKOvTquhw;
}

+ (nonnull NSString *)bXKHbVWhyxjMJHmL :(nonnull NSDictionary *)cHUAOvDEBMkbNfb :(nonnull NSArray *)kYHghRKJQvzoAVczuth :(nonnull NSDictionary *)kxhLjwHTgYTpknaFWhI {
	NSString *kZUizEsSDHUzpGqId = @"ruIigultinqQDCakQRVAogOYGGjXwLABtKMvZYQMNqsrgBFhzxQtbkEKpPmwhRpAqMlBGGucrGUyEKKcJHkhyceJOfzyAQZsgWJgwLFVaWHAoUjiIlZHCcAFbbYFUQSnvaxADqFglfcezWSjUamF";
	return kZUizEsSDHUzpGqId;
}

- (nonnull UIImage *)FMjAOgXkaeouk :(nonnull NSArray *)ACRSioZSRdIJD {
	NSData *YHhqHUBhET = [@"RdmofZeBvyZzOhxYgYduQQnzUTngjoBqvmJjXkTJbAQXfKOIxkUkdJVWKzSzATvNnzjsvDUehehoyAUEObSmXlLCWLYbaMoAAldXrrDEIgoHKGETvPwHQQetqNCC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OREYmRrAxBT = [UIImage imageWithData:YHhqHUBhET];
	OREYmRrAxBT = [UIImage imageNamed:@"uBfaUoPJvcoOXrcjIGEcvNUbzdYJdzmlAnGjtswZWArDROCTMqUTuyDciMKSJFQxxUONmQCYbfMWnUfyQYJpLIOLhyQXhOaBWxEknqT"];
	return OREYmRrAxBT;
}

+ (nonnull UIImage *)fYzIYlRDZJpHUUOSi :(nonnull UIImage *)GYOxjiHtgDTmmNZzK {
	NSData *ifWVhDMUjbunUYPQ = [@"yqGdUkSSUrChFHfrNuUvnlfKniciYovRqnYUSSxaXjEISLyVMxkiSYVnXbeBrRPDhMbOHPyNrzLYwdZPdcavcBMUrOfkKyHOwZxihlfNTwtXLlReJeSNq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HrcGKmMZIlXA = [UIImage imageWithData:ifWVhDMUjbunUYPQ];
	HrcGKmMZIlXA = [UIImage imageNamed:@"sOQRAELfkLzHYhROnKuRWLVRcleLRhHmGUHNiDpHNwkriCIjWjMalmyOOSWoBQzusQGYgLyhlwWOcBntuxZqKGLtebTylUYXaBIxv"];
	return HrcGKmMZIlXA;
}

- (nonnull NSData *)evMWitwegnXmJu :(nonnull NSData *)afMAAIxHyIGiIJeQTg :(nonnull NSString *)UbsmUaoQaCaYs {
	NSData *EgmUTCWWKzaszmnXohS = [@"hUEFSkOgCrFLxbaTbzPWaRpLrQnyLVlhQQHrousdtcvpzlsxNcDKRJSgPKShzllezBaHLIOOxUEZDCVBxdKNXVwRzkVIudmnaVMoGwipPUlCMDUeAznPWevEMyOwslxEdhJdtQARXFhtrrbG" dataUsingEncoding:NSUTF8StringEncoding];
	return EgmUTCWWKzaszmnXohS;
}

- (nonnull NSArray *)cacnZnLYRhlip :(nonnull UIImage *)rikFNuyvKEo :(nonnull NSDictionary *)SknGGKXJvZuy :(nonnull NSString *)rGWzAgQbcBjhTk {
	NSArray *wpJTbDtMBT = @[
		@"AStIlwfjfvnzJmeCTJWEdwdZUcvitDtcaCzRpAsVTouaRlEOZYbnhkmeRVWZoRyYtgRYhfhukezSfapaeWiYSMMVMZYxCNWSEjEzi",
		@"lWNFbWuHOCXCuAOZwrqvpfRMmGrLWUWajzfaZeyFMSoCsBRuReUUsiZLMdAAHUUqxkGLKDgaiFpYjfAkNMhrIdtXKkwvjcoKVaDDMZQBeZLbKvrsjvnJI",
		@"VifsrgXqFXjvXKvHzMefJQJZMvkLFsVAslzCwtpalKWBjHACaKqTsNfoMDoJUwLhqXWeoZpzVarcEEywOWrrXWnglCvMaukNzZPnRuyokqPkCQFlRjzjllfpXSCIDiBzq",
		@"IiGuvVhEanHRPQCLwFJycJkFLcCJlUZDYuKaIGGLoCWkyhNsoOQwqPQYYJRjDujIelvIFpjAbJxJbHCTmliLbESZtKAmaOjEkpyOwzwwVNmhj",
		@"qQzxxVNDvojIjCJcpfjAokLFHPeVhHYoEJZojebUznekoexguYINiFScNavpjgRTlwDXwXIDmbpmApilZIbNfrmxfZNwORHDNZfehEfcWQODRieWRToyyk",
		@"dEsLHVTlCxVmoxCchAaxvLXTiTIbclPYcinSObZRUXHfLenYnUpZLoOyxvlrTHOOoFrUoEylhqAueKUiDjVunQLHHGHzBTcbDXkGxKXkMsgMJyVlNQeWwjKXhLU",
		@"hNtsgiznSwIEgzryXXcvIKXnYtYmNETCslshYFDMGyNiXhUPnVUxjBPUGHPLsaReJZEVydNUwwWYtTcVeREweSvGFLaCINJXRNUoBxBFLBUriUzcHMwuliwIScqmrqbwJXVBMqrqnVuydirRTM",
		@"tjJZfCMgRzthflUFkcIvUfUSpRWZdwzITguawzHbtKjzJXzglvINbfRNrcdYdEddSONcxvSEsrsbAjhZvvpFqGDvoFbMlXogRMgpKGTTkkMueSdMcSBNsLHGgHilLerpeJCaTOiSTXENNhYhfE",
		@"kTfvIzmSakYBHgIBxoBjgIgHrRtpipaFxjQFKXsmymSBZtGGggkwqyHGlMDnrnsdcOCpzVgvbsTyFsHfiYAFUSUGnkfBSsDTZjQcZhoPUAZvebyifhmJbYpnjqwuhBFjdVnTGOTYsGaIvPkNwxYQ",
		@"mXkrweBcMogbYTYHdoYwuUGVvRGvrtDNUHrOYlVttOiZokBVzreMWCpRcYvZKeFXmZjPVFLCVskKtAIJNlPoAWbVXYgFcBgGcEnLRioQWuV",
		@"HGuKIbZoIqubOlksPIXdRUuPCHNYsLFezUIcXFQvsZnjoYcIbMeckjbXdsvGQmXVKfnhIJdXAxyRnahBxatFgMotQNllYlnMluISaIDPAyDtOzopIylWzzsQmjLVnNxUNExkSnaLMtoVfBm",
		@"vlQyNQFmvQzjrhiTMIcrcKbUBDkSMFkKdcyMrMOmZjGFdNakvihHCtxEwHlWUBigzDZZGZRBWPGIcwvIHsvyJYuuodwdIbHxmBLKtPjGJYgrjDjSwNlqeJhsAxkl",
		@"VirfUIwFKqFgadVVWAzvLbbfGasIbJciZDtxesAMHFHpDQJnsltTTvhblPFwghQCWgcdZUKzAbnLmfDPHFazkaimwiqYibaEdixShTgaUwyJUdCPGRKtFblnFIUaIhDNGTfVbbEMG",
		@"DpdMyQAIAWuvLOjlNiBllLlTxzFUKsPxqeRITaMcftceMyEOOcLMORxofJYcrWYKPFSuHzFHqhatFqkOdkygnjWeBDSnPDfcmoSTKSwwRDeGQaHvHalucspouUHxCKVYyHChX",
		@"jKTsvJxEKheSSlQMoFYdxjvWXejKjFVScCibhjSEUtICejKmeFwtegfVIqirvQLvdbTruHmccsrlIstrzVczZpNlOBmOVlyJvfhcfwtAEPTrGvvQPYqEqDhdAyCXdRPHX",
		@"NzvZKpMoJBonmiWcUAqZaEBtIRMvPOqLmAQxkQcRSiVLXvqFBcEIZwxnRKswdsAgpknQKhRXjOuFuZzCdlhUZmBEGoJOPbfGUFvuSOFSPDMqOGIZbStrjJoioNFPNTbSmeDRhMqarhzPTChO",
		@"YjPOOrugYXaquWOliJbsaTfCzvSGWJybFaWxfSTvRSnbPkUKmpYygYEUWUUaYWRgXyTpPkpXgizchcsbJYnzStnVkwaVPBIVavyAinuRDWFzagRNKKFZunYkWwsQazthvmgpuVmqYig",
	];
	return wpJTbDtMBT;
}

- (nonnull NSArray *)LgZzMpjCJce :(nonnull NSString *)HDUPhsOHXgg :(nonnull NSDictionary *)trhgwxZJyYYTYvzPLx :(nonnull NSString *)cBzrwZlhzysq {
	NSArray *KWOyBDxrGPmrD = @[
		@"VbudJlaIsfiZwavoHgkdwJNhMmBEmkfhckHSXbRfyhrCeQotXaqWCQFnwgbllpFynFeWZwRttCVhYSBxiDxeMoEYfRLHCskKGspEgyLIKpEQSnrdUXNSZQQDeufZwIbrdGhhjMbDZS",
		@"vPAWIDsYfIdurhEmzpEpKgCYwRXRroCdIbwVFAEYGwhjBnGjLzIwcxdwlnyEQSLLEoHrduyfSnIRltaMxuQGYUfrNeKhXvjEytEQtRWGmsrXxbHzJxBtYtIgx",
		@"BFgbqrsTyKjXNiNDysbEahFLmBywLspZVAnZtGzdkFUSbCMeFGqIYJTQHXyEBawjALfxDaymyrOCgTeFWFkSxyjabEJWYTgbrjDvWlTjFmJdwcwwzSRYIgdzkdkFybovRNVqAzcbH",
		@"CgNPYPRQPgOVDchsVZMacUuvmFtnMoWSOHXqyeUdZBxuuddlHhHisWMYGwsuLssHurVbSSjHHZdVWgXXgBkPvVddHSfIjpUDDpJbzkAcrasCCHqWpjuaCXusgZmEfCGKgOfPhwEnkydX",
		@"VYqOsraizEDtNtNSvzkPqYblDJJphOQojBTjGEytPtMqACFkCcGmZEmUxrQFmyhznvUqhasGMwjFkucKyCfyZCxUSigVMENJhHdJCsZcajmzDcrgfA",
		@"jwNZDeNDVpwpbNDNgtZutcBPkflzsVgyZAOINShhvzOMyKggKXOqDNEFnpVlMEisONpqNhpWXOjqqomoroKeajOJuYdhMcGdqxAdGLUukUcKHoUmeVuiQ",
		@"eZdfalgXmwUPwDHeCsiimcWjfiJpUlVthOzRKubmQtFizJDLsOrTECXHpgCELmcQSlojveYqoHuJuksxUWoduZUuFuGAcoLcTBNltwaBoffaTixvNWlyZZTcvBgHYjyCSYNnmwkALcliALxzAS",
		@"YQrlPlErBEPGMVknpUrvIqolguuhJPTezAKjKHgIdqyLrXMytrTzZVGzEbYcunJGdvhJlQlVnXlLAgRTKoHPQYIZVNqTsiILacvzHGrzbaMRUvFcHYcebmd",
		@"gLpnWANPIFiPHYOrQbvAzUyIYYnTEwAaMwbjvobDXHhLurHDhefcesloMShCfXPSuJkewhcOvzFmMAgpBSDJKbMDkNpmeRUluulXRShMGlRSKCVdnaWBUNr",
		@"MsfEInTKrzhBZsOwyusWrlhGWyvRUlFNhdAUfoZaHBRIZBSdrjjULKMURDjgBQmPjBQycfkmwxTPpzsKvSclNHrWSnfEIdtahAZdRQrNWocvnSiEYtwQpFLcGzamDDeadFLyZhF",
		@"tvISdXGuCvHgMDavNiyMJKqQYHPfkDNVmMBHpVzQwpXndoCVMTkBeEVzshMwpccgitACazPaikDHdGsHZlwvfdqIRXgphGzvHNuZuqkASGdHgHRAyOKvYvgdDIvI",
		@"msMEvVxomSrEpAvWnhmKUCkAWQAsnsEZrtazVjrSLJDlaXsKLtwELxWWwKRRKRVSaAAXJMHmANuSXdihydNrgOpTxZuOitSbVXyzgLdUloGEwQBMlyICJSbxcPrbUKRxgQ",
		@"LcZhFIFsgfQbsIENRbTFDwbXaMqTfLTGbctdmvDPolHsZJIOffxokqbFASrXfisRyaGaTUnItuXwDNdtAXltzysPNAqrlTWlKYeySWlSRNn",
		@"jtBNPRVlRuJOfEtjUHSFOsVHDLyeKJjWSWEmLXOuaGoczzIRBulUJIGwgzjCdExtmWssrWjGROkuvLQirPbVTQXStFQedUUTKSpDUYe",
		@"WZdOHiareuLcYIkZtFYeAgAusBsyfeSKSsWsNhDiVwOdonLWKbJfehNnfIwoUPHltViKPuNiewYVmahGtOfZFDwNkvjetTyzdBqbotPUllaAyzDFYMtPGRSCyzihFqvlsDkfvZiKwU",
		@"ePTxjlYCoBXDFbNtRDLMrItVnNXzZdYbcRgebaLxXJGWDnHzKhUNqgZHZxIhxzRjUeyWtbiiPgtxltnLXPoztfCWfmJDppRjuIcwpxBVHmpRiuZQKvdSYbFjRlyidplRnkGMxbbbTecMpvtSsoAxl",
		@"aVRWvKWxqwNJAwyfpUVniHLjtlPGAtxJfNqyrpwvUNtPxhOOvwZVafuorGvbNYGBoxosjPqbyHHzxLVaSLoNRSwFtnVVelPbwRKNEbXX",
	];
	return KWOyBDxrGPmrD;
}

+ (nonnull UIImage *)mArvbPYtEHxhm :(nonnull NSString *)gUGAgKWCLSsXbMMpCS :(nonnull NSDictionary *)WxQCdyMxQCAbsmHfts :(nonnull NSDictionary *)ibIMiwJxoUaZZ {
	NSData *jfiZRUAqkuCdMCM = [@"kIfVbfdXRXIkmnyUdgOQMpcHQPLlUhTEgsfVHkcxrvQZJFmzZXLNIYZOAlSZTYRcJkhYNAZDucSPoUDNIlCilKDJKELmucuuLekBbdrgt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bHKqytzcbiubqY = [UIImage imageWithData:jfiZRUAqkuCdMCM];
	bHKqytzcbiubqY = [UIImage imageNamed:@"pTsvPkWHqYEJpjmtOISSlUqYzkGWLTAQWbBhurfCGelKfhJjoHiDrWuCgktKaocGBfAXrnlVitFTKpOvtqxjsJbshDVrtUnZsEyxCxBAVrmTFssgTORhgJmIQoPkHJnlFdnzOeNWQEqKKUrUceUVO"];
	return bHKqytzcbiubqY;
}

- (nonnull NSData *)MgBJjncrDvEghXrDLo :(nonnull NSData *)wfsugbzWzYKmGmTZR {
	NSData *mwqFeysKWrvrxFYGM = [@"YZPQUWToSSMnniRQqOUGriAqbtfziuexTMWISfZXQRYTpwyYroOWihoIedyRSRNjuDdJAjNSjnVWLwVdCMwxUqxNToSkCVozzVUhrKiXzusBHtUKbDPnGMfEatIqfGqSPzAtIcDsqovBlr" dataUsingEncoding:NSUTF8StringEncoding];
	return mwqFeysKWrvrxFYGM;
}

- (nonnull NSDictionary *)wiFHPKVvxZxlX :(nonnull NSArray *)QhzWOfJicvaoejeb {
	NSDictionary *tFvqbbhbHzAZ = @{
		@"eToelUhDuVeUn": @"vUVembimgidlVsptVnvSekTLjJwlMkoanyFqeYYssvdRmQUscZaKsrivGQTHROiOCzPULzzfGEBAujNgXwxJdCnDAPSduFsroBTkbPhpngzUdNUOdfnXFbEMmDD",
		@"sijvmRyviubYgqCb": @"eJcqwnTiucOjdPGGPbLFvReNcJvjmJSdBNGNwFPjpvSghRZqAEWGWKUEyCzdbvxUZeCoaEKoiBMYlYrgewlIgjbQfQZOuTnKxoputJlnPCVPbn",
		@"KUaprARoXGUFTRCbjpk": @"JewMQrvWvzLrmSMzzHnIvSRaXqRNOfIQvwyWtONVGJtmIhYydYBEmZeTAMhkGEoHHbLzjoLOHyrVsnGCvBhVwWASTZQRzcAvPVQhCWHicXVGeEJ",
		@"CSWmnMtiCZBzx": @"lQkKpGBxZHPRJZjPRVhUKlQhzgIEPpSgrvxfcSnlFgqKWcJiDXLqltNaeCQrjKbwDSWSnonmawoLxUNmOSQakFrLfwicBgxGVOlzkMlllLWlTcLcli",
		@"RcaLkKIudCtbSBwf": @"lYKqYHswbEeTaphNmPrvVrWUTukmyhhldQgkoJnUpNKdTpgxacogELYqEmSShGMFOtaydZUkWQtPGOUzBoRTfAbnfZEEvxfxUMXQthXIhSwGgPWPAmXwFFILOEBvxQIBzgW",
		@"dpPRbcoRDwMdfLLUaDL": @"klCDgTlYKpEMtPluGgoHrlqhUHpfMWREeEficBqmwKakQaGhXICbDUJwtKDRVvRfCeaSXwxTtgeaYchBnRmTpMRohkUgZiVnKYjHFfvITjdgQp",
		@"ymlROPxNeT": @"JwsGxXPhLEyVrLMNYrUIsJhFBeISVKdrRUjWnnGXDHorfdkjQxYHPWvfxNNbiWQXQuhBhatrPkxsahbeFZArEQHDMJeqVyCyEyAbAb",
		@"sxsXMfkbmUAdAOxP": @"NhgeBMjOmMgiSDJclFFftwjxrljRxEFTKlAKDWKnsKGlFcpQvfDtCwbAATnIzeBigBdzJObkXghbDrbzOXoiEKMhvdMCNmBURBPjjlMlubXvSqwwyWKgM",
		@"tjUywKRyzMK": @"BUXZFSjxlHUZsGzeGCUrROyWbqMKoCxrnwigXhnlzhCfgGwdwaWmtWCSaFntXEAGauaWZykSvXvSDjbZfVfqVsulpqEafXbywJLKDanezesDPlWfeFZwrDFqRsfLAXniLH",
		@"zWOQAWzFxzkIsgkGbLZ": @"qpAIHUjsXRXVTjabVkaiHPFQSSdZkxiMXbYRLaBOhjKoNLAtYPcwBCKcsOCgTsZjZaRbnxDzCCrffHfooXhsDdXqbgsZqHzlyYEXOAXllXvPsKLrfaIGp",
		@"LbIDByCvFetYyUEA": @"aUPvvWHrYuPFJgoDTilAaEchBwJhjloqdjIhLlKJodixEiPYPFKqixoXTNaxOuYPdsQejuOuNJZmFHwBUYAWmJFagzekQpmwUNNKPQtWBvoFvQECDYthzzZJnxjuugYOmVjpLWwFRlUjrPyHgaj",
		@"OazafoPAcLG": @"nWImHMgjZZjOjwAfepYtwODGuAPXlYwISRvfsLfPqKVVaShZjihjiTszAMCzHIXBoYOkuiNjwgELpBWPmjFeslvploseEAlxpPZfukgiAADlJBGuXxqIUjZyGPTnwcpXziyjMhgFVMHMMCWvsln",
		@"kKOvCYOoCyWbIFDm": @"zDyiAlgaqwxrNsgMsDoXuFDsHeyRAIQiglrrQRmzWPnrwcnVRASEuRkThmgRhKidpuzHGfFUCJGXjYVOqbQDPPUFqNsFWKslQqofkLLufhlTYKLhZDDsfTYGneFOJcbHbhDScVvdefHmEdkTkEL",
	};
	return tFvqbbhbHzAZ;
}

- (nonnull NSData *)TfdcbgbJxJcumLHi :(nonnull NSString *)RepDQcNbtzCUaJ {
	NSData *bEvmgEjBEA = [@"dhBMsDGFdjTKKLUoJePHyvjWAdBbuZuMLOQeYgdlfmHejHNcSyWLFpOdeQTHenEetmiNwmrcISLPHOcBMYfDgvTqvEYmSvfEymXUbwiqyiYPwqrmTNzbYHOatqEnDz" dataUsingEncoding:NSUTF8StringEncoding];
	return bEvmgEjBEA;
}

+ (nonnull UIImage *)CFILBUMefFSKd :(nonnull NSArray *)kVsZcfZdkTjepgViN {
	NSData *bbwgzzKZmEMIDWoCcmp = [@"urZqJESAZbmCdIsIPZwcpmfyiVlvAwkKFxuhLQYNugDNgSFpdDSVjdHjhyipfLNqhIpFQSzzjNEemGPrwWRDGAxYjiveZdFUlSyKUCWdkuusAinnPqGh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LXriwZujMBbhk = [UIImage imageWithData:bbwgzzKZmEMIDWoCcmp];
	LXriwZujMBbhk = [UIImage imageNamed:@"hiumkSYUSHrRFcqoMthcoeqLPLrTOjPLlytiHOBvdnVDUpepyUMZrfExvnwqLrqExhunVggpDSlRQbCDLShYrnOYgmEIoztfEEuHMbcZxggNXVAHCmqZVEhnQiFwcGtlkImsyYQFAz"];
	return LXriwZujMBbhk;
}

- (nonnull NSDictionary *)gyFhUssZWWIvkZYc :(nonnull UIImage *)PANpwRJRDmYzfxQDkUQ :(nonnull NSArray *)svjbjEMrcre :(nonnull NSData *)TWLcXhfcKUibMsEvhwc {
	NSDictionary *DpBxgBgPjvRjXJG = @{
		@"JnOFDkJkUqiqrjlwiN": @"jRpWnSiIQLBJZGmXGfIwRoJNuPSDPFoQyEDufQAEvUxYggaLZkhEBTmbPksrHvKjAJKfRKLqzkJESxSoSELGuRsuJpZbiSFLXrnNpPpnFANoYQXzERYZKtJZJDtiDrAHRTimd",
		@"WaRlSqMlRwDSmgmNQ": @"SwnmFGBEqyncgpSGDsqsqfEivvpqdKKMCimdPDzjCOEzxqHRREqPFGozoWMIKPPDNOYHLBmVbeTmtIQlwhKQKUsavjdujTsOxFgQkyOVrh",
		@"uyeIXLQajvGRe": @"SEsQsKlWfJaMpMwKjIivLctWFGkmlZDmPAdIozbUwfqeneZdTmXoACQvdFtGLgmDUthpijZKhMEtsculGryMrLnZkfiSGqgddiTnYGoiwtrDqoTQgNBGhldeQRZanLFqtqfA",
		@"ojhNNKFeKot": @"SCBkeIXOzDpggUutmVUtejQPMUBFqYbFxEpPEscCWqHXuYibhCdkrDWwyMZiKQyZYZVCdFZMxjfHIrcemjSaZafiWftUYrNkxbOMrzObHlXpoqvekLkGvGTy",
		@"HeVNyselXQRrG": @"xzMhBRMmNtPgafZhjfehwWHtQcuScVhUKDrvfeuWdvYdiNLwsbPkIafwVvegBlYdqwWQCQjKFaqGEXCuQzWITLSLZlfXPcrFoctOuSarPmFICrTdrdhiHSfTfOrHtpSQxdTrFO",
		@"nrNgthmQpfLUYMB": @"eovJVQgbwfScvWrIeWgIAJTRcwDRrwqupvhDTHnafYlKCnlyXOEbkxxjZNGfgWHGAoKRJZZTpfvrulvBcqWhvbcodDcZJQKImklWMgIPGZieNkRGvEpiDWGRPwXaHDWsCSYWmWaQIxkndsLu",
		@"ifajYvNpLnYwabHi": @"deQXZqXnVFoLcNceiHmpdngbcxMgsjHKCVcxvznOZYdjvxaLZAUWbEBhNrUEkdIpXXKDfVaPsehYCdVJnKkuJhrjbXxekWmBMkfTjJxHXovyWZwJIxOfpFqnWGtrV",
		@"UAkaoqfjvJNg": @"GeoEvRRDQfwZSuWGvzBpLKEismCjaSPkLryjBEjdzZseoiYZmiHTvnAoWMBsgImAJGwNiFErwfbShWDHDNeJgcAtJrWhEXtPmMxyQMvtueSGkAmmHFhVFwNzSnEXeyDWoV",
		@"XgNlgcAPzdHvOLRs": @"OMSdRnppihYrKCndGXCZOJRNFqKsfEdVIFNhsyVGBAytUDBhXBBBDpsQxPjTBxzPNqBxUscEdxmJVIpAJExHmzliXwKaRfWGMcLvPRuEOVUYlFBJXjirLxpHuJwvJvpkztilnxzUqVTQtt",
		@"ELsVOYbGVf": @"tSKzbBsJgeWmPWwAijMRlScEKwPfUuHXHlQOtMfRttdvEsCBuOHtLrhnUTxNAWoZklTYXybGFaVQJnXJipbwJWPUXMtOViTOyMrGCKqbtGBfCMqzLWhNjdUHWtQrSOfbGwxjyM",
		@"HlGpSCMXLrCMp": @"iLZLsOjGQVDsaqssKNRVMkYKKZHBLCdCowLEbVJOWwFumrIiHIUyVWwrKXDBmNEawdYtajCJVHdNfELYCaEXgXJVAdPLasXfKjujOgPyIaxugvWgPzRvVrfq",
		@"pxUotujikpTVUz": @"ipbDgSsrCgTBTkCsnTVtDILPZvRfdkQlwjmWMgSSFfKPzfmGTeUQSsMVOWFJVYSzqftDLkIQXMMJITSmLaDtTqjvpkGsToXDNWvhGcrWlBRC",
		@"gUPgNXUvSEBnjiK": @"iJMOjcENIALymRVeIaMCzwuUgzvrIpIqHYxxYaXXGaaeCkqymvGhIIZEmjLeimHxUPoFVsjtwekHRIUmykEpoHfkwQdKymvxvyXVuMFDwkHYLTAj",
		@"ggWiBUGKHLGHnYPMgK": @"FAKFDRrOmlIliUdcNOAloehRnxrAQOHlLyJClsIqBEUFDlEcmmjEGbVBbeZrAtMHqfIGAnIchAAGqOrmXYCEEdWDqFoaXUwHHLpEZmrypBcSmUyfjDeCqgCkHWTOxiwIxPWPVbSfHtsvnqfW",
		@"tZAElOEenpRIT": @"kjpESMvRSteiOuIJOcplZnvhnWHpOeIfqyBXmqmBADTLwlgAdJsJqgTSTRQZwfjOZeMfgUJXgaVvOzjEJWIxdKKJPHhyeNiggHxxQTBFNnjMEUNCeKWYexViVNEjq",
		@"VDkHSNEWbfYYBX": @"aVkwDWRObykiOOTbyYdcQeMEbIKlxDAVzHcfhwJpAziSIhmOHcaDbYkJCzUInSVHvtulLYzMBDifwQPJixyEOeKQcOWoyelazzgzMIvUpFIz",
	};
	return DpBxgBgPjvRjXJG;
}

+ (nonnull NSArray *)CCKFECXZWcyF :(nonnull NSString *)jydRKioheFybx {
	NSArray *JZAUkTetYf = @[
		@"LPpnIfXxIFQkNeMASMIWrHoFkYZVdfteYnUEdCPSOcvxSjFUNOKKWTkcDvUzbMMhuHZSkNpTqJpkhmAeKHnvSrstryZrycJLEbSKWsIMbXSHsGGlqNhjoWxtoZRBdzcnyN",
		@"dUqAcGpxQsztItnyWgpkBUehhKzqLDnSIYaKWCATgkdWrnWQONKwLbjrwKBGleXtuaOlLZnSGKfECBijemIToHrztgrBSICIZtvidOziODAPoneZDTIckNeonIgepnFg",
		@"PxFfSgOdTpkkLKUbVmDPUqayLTjdxisCNRcnXqdmScfnxMmRDMrxxgYadvoDnnwXrrPDnFNoiIhDpAFxRWhsnKkEscEsIydjKDBptBsieAMmyjtr",
		@"IODFkFcmgNLeLeHGRaYqdHQbaZmddKWAMoKklodvNuuBoYQihiLkQPZRmmPIJrSdOJtlYAcGxzCrOazRKMGTxpWmKuwUBTQByEmPjQdcMEYdjtcmaxOeEtNweKYjhLSaD",
		@"wWfXaVQPAwKgvDTFNSjVREdYsBEdXUoNMRdlrOQngxOGaDZXNUPpnlETHzEvTsxYQXChqUsBgQvvNVteseGvOQUcEfHVEIBguIBPDeVmWuZSyXLdWdx",
		@"ZpDpiHuUlVSXnfVERxQIhUNNEkGhnozHCeEIBiTAIPatYNngUezPtBojAernNMShmXHfYICoWINgQJZMfIhHohqpJzxBpmGNyZCjURDLPIwlwxPAedlrXCKxcZZzyhNuGMEJDJrvvuVMrEI",
		@"vnOSgSLNAnKoqlOSiVOfiGNNfmuxVOdjUpkoGljQHFUlJKAKmzLxaBlcWGeXaGsGqXosAbBQImMUOVWgFyyAvAWWFZCvqEtgBVGPUeDHp",
		@"BqgQiNmprwjrNAmpyFXlcmPpcHCnSVDXdrAIBVJozJeEzoaNemcHSPCNTcPBbmwHdmHWuBbYOpovIBjuTJmukfWPRioaWIOznezBTRjCiuIVRaP",
		@"FFpqdnwXjJCovrwAImlsppxtXNkmLEFyDRVnZYpBlyzZrhhSotUXEPBWrhaVBOtKjtWlDQZrVSSICuetFkjpXkaDcWQYhhyzTQsrunMEvSIhkoO",
		@"oECyciWQsnSAmoRKPLWrmweMpKRqRMzHcyxaIrsKcSXzZahhBBVBZNZpJQVsQMxFzVSeHqRWFEBQPnFgSdHMfWBDxgbUVQbjyLsnjWLaOkyXeBIbpspUGPCjyiFoxxSVzyirZheSFetwuVgFtw",
		@"JkjsFiqXOceayCwwhRTOjmDhXWjQDhsYkPfprzCCeGTnwYCHSrkfGEbjwbsFIdNxhelxccpBeMPUXCcCElmuLZLahmVjnmhnrJbcYFPrhz",
		@"LNftXyEoRnlpsbPMtkdeZixyklDPYkIAXTotmvBocuoohmTiDkmuHGqPSWdDqGctcVtdXsSEEJBLeCyOrnyHktQvCmSGAIwPhDkLDjHQONvRlfFLPSBPFklxVx",
		@"cNvaUTTvTIImbAwBVCxtqaXWQGgzrCeCgwpsiaqxEvUQgCFnMDFXHqREfNhtbpyWGrlHhWTZusqfeWHZWvoTJGHceTuRpDFgNENQrOJMnUfJjYzPjXlmFLSpTQkAhtt",
		@"WJRyuEaurkWxPhCFGfKzFXeibDYVbYpnlqAEGCxrftWzqzTBIeflqkktBqxyiTSGiYlaGRHQgQycUCJvlknMHyrAqYCGmwCnooklLluiwfKqnnvhGaVbckWqpNwaLZFtlYixkGILuyzLFLvCr",
		@"NUqGkLFwdcKmXCgRtIurecSFwTGhSxUsWKIyKArKfiGPLadKFTXSTwPsUaulSawnmiCRGroPPYNfpDLcsFSfeZgcZosUBBdzVZwYadIVaEZYltqtcJCXBJxF",
		@"pgdqJvqhJEjpksmaQtFtWrWdOxWzLUDyfZytgDpdwAJsqgUmbHNFBjHmirsdHJdDGJwJBCzwYhuOQSyujaESNqUJmlJaImBaaLrUkrGBPMXmKHOxdRNXbbziaLBZoEpPHDFQtwDlTg",
		@"UXjesfkvyawpxjqtZMlgaUfHJvweqwPIpVXLKrOAWgsGZeduaVnXOxwDowkmJkdqIJimYRpGdcOLybdfqxiMkdHzvwwwWFhodGUyxmUTaji",
	];
	return JZAUkTetYf;
}

+ (nonnull NSDictionary *)UyDtCsuyfwkZAdhrsa :(nonnull UIImage *)TKljHvqtICuqXv {
	NSDictionary *fuwZxYqlNRhiCpG = @{
		@"LkPhDLumXIfyvXm": @"QcKJByqpTsheWJrrjtyOrMiFhxfOIWrHQjcmawZpeemkuWBrXZRfoAiWOtfOcVJosvbwtqEtmMHOXyZawqJELXdTNZxhvMFdiQKDQM",
		@"goRwWXQARZndEj": @"FJstiGvCkBHgPQkSOiLqRZyoleWExMivTJdFtJxUrAaiJhNHahSLlGlVftQYlUDhcqnmRgeEttkdMHEpJyBBfgZlrLjimrqrcGdKGcPGXNXARHwwByFoZPsAWAJxHaZcIf",
		@"TDOYcpzBXzWiNm": @"oPPoKOXfuUljEFlRfyFidtrNXSuVtyTBXdMEILPQKVOocEXQaOpuOvBbyIROpkEpkXfAMKFjJlLFIkHwwuSRAavvoDTybXjgOevCCrkuNTwFxis",
		@"mGkFnSXqaWuPb": @"MzegQjeMBcrEgumloIKIeZjHJbGsmbhmmqvDXvnRVNNZinhnwqFCDEudNGYhUsMtjuyWpQhFHNjuNVrpFnLywLxniMinklTNXAmiqlGTX",
		@"XRAyumpUQZzzXNKuDg": @"ZQxQnwcRLpCDWAHELyhQljwLKiyiYYFDxzyLWyDEfKfHMufKueSQBJfUXQsfdOcyjqrdwIIOLhpEiBqKvoEkUFddXuHNnWkYoGCbDXqewIjduLqHSjve",
		@"uZWOriWLAxhJQicn": @"oRVqgsdFxbpEokpVqimjjpcbOkwdLFuLfPdbqMLYSBujRqSTCaysMdFAgZMpdAaLHvLBoVkrQrUhOVaJWkyLbBDClgXpYOLPUdVvntUGEgxBz",
		@"ZRqthShzSxPEyxILIvd": @"jvUooLrtWwYBSZXFQCLmYlghOaXLqhTdewaGWePbjOrgoxjxRckCDBCWfzbplgIQjVieHYrMqmaeikcAYbMcbixnhyuPzEGubzYaCgJHGFpiHHkmOcKBcdeoUEIdaNClbrFx",
		@"HMtQahECkvTrHWooO": @"fSQKDvUBvEctdcKskhUXDBNWDJsqGbmORYTnCzYfmWXcqGGFCzVtwNnmuRVGwhUeqCgyQPSVpfhRQhhFQVioOQuKfiblHzOBdUWOYFO",
		@"uoufWQdBqFHoUKskOb": @"qIRhiTebmADmPPPAtNGMpsXnXdxjaNiLKsPkUUYyfKvNgPDbrRXkhUTuMEVvZVJioeZzjrCKyXoVKqkyjcqRvRVuSUaZumehmednusxbrzYeCyCVyJdJycsLsESZlUktjH",
		@"vwKKttIxNbiQaVecO": @"VdzBfZWLGkPjQpKMBtRCIWTLjXtuTYniPhaMCQaDjgyzzhDjRegdVyHmmzVdDwdQNaWdPxvznBeTmdpsuuKgPKoUuTwvWZKCafHbVXjmptHPfkXDkYLDzbr",
		@"FmNPBnlPavNY": @"qssYeecZcARbxlZhdlFVjiDCnQTIuSwaADeRLoXoSNPhwGECTevkXejAhdCiDAFyAtjdPYzxVwUUYhBXjgsMkFhIKjBEesnVqmkQkTGTDPUwCpbfdkoecKOKbrjHGrKWIWGDXvZnScpNCD",
		@"stKaHBVCnS": @"bWvzgkNxasjPohOlFTWEFbbjUlfrQiRTHJCMAoDGiwLabCjGdeiomaQxxdCAqyLUjRCvvMSevIHhUVGRMsWqKYYldPbPignOJMjdtUjguxERXUfrwasSHz",
		@"BBTSdtzNSUbKQVN": @"bqajhfOptoRcXBhaLarlrYNeooyCZCplcTeuuGnSDRCxdfBMRZTKyNwJcFrXOmPGiICxRJnHdxnwCwAanepvFvXvuxYzcsdmIkfTIkYLtYgMAeUNkZRwSnOuJo",
		@"MVnKsiiSLCCNm": @"FHhlduoQguQWAFLatewmufJtlNsTyWVNgrEcAADxxKCECfpruFFraOOzAYgXOPyzpigEfBVOuSLcIENvImYmFTaDNIaEUTZualYjIxAEjgvKKRCrzhKZbuxYcaGtarAgNEKKjWdesECJSyU",
		@"ydIRYGpTywnO": @"LHSELqHKbgwslGLbhQDkccuklipVYYHdilSwqujaHHQOGZTyDDbRUrqgSvEdGZPXwIUvPTGyFETaDBvXZXvoTNbvHdAbfUUZwKvEhqIYdgjdMNhvEFEZYlPiTZEYjLgxMMKioue",
		@"HRZTjSdIMxlNZB": @"XtqdRKqtCuAqHxJJTTJkGhRRsVGPwFiJxYxLtUEgPycFLmAWpBzliJYAnFyOLFbPLEDQtYOWrdvJjDvcbzsDykffMEUnQWUvvEfzcdjGwgoQdBLKTZExOMOtOmcviUcnNnsstaeRKAUZQORfETRRf",
		@"tgPyegqMTaNGKBfg": @"QgQBAaErjAkVshfzyfrCbHWxZMRWmhokCWJAshHVMQXKYWkvAUiFwsoskYJaJIuIjEcoYgWjpXvVWRCEpEibOXDTDkDdnqrmYuphc",
		@"gvFiQgBAqTm": @"ruvEGKvPhJXBLVygeublgPvAfWgHWcYOgXlVdGytbcgYvZNBVVcJvwVkPjAHghBNYMKjVZWjXDsaMgvYVXEPECNcRZXSzViZnPTKrgYqgaWdhSntLDgstKQGkVOzJsouPTGjvxQ",
	};
	return fuwZxYqlNRhiCpG;
}

+ (nonnull UIImage *)OYyDKkjiAwgCCMl :(nonnull NSArray *)sHLBMsJaKdIwIUvYK :(nonnull NSData *)agzVynjmKYbR :(nonnull NSData *)iTvcWJAJgBbaMvwYP {
	NSData *kHArhSMlLzVfVDs = [@"dsVFjpotWgkzQIIHFlobPjVbjVMVAUhfXtusGZyXQCcFZwFgWPvSJHVPhhKxGbxoEydYJUvDwLndowvkyLyadkjbDCiYzgFtNdtGJgJTLDEzdxLLKYpcmizNmkzeOHEKf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rIImSlMvUGKdH = [UIImage imageWithData:kHArhSMlLzVfVDs];
	rIImSlMvUGKdH = [UIImage imageNamed:@"MICRSnBrggRISXJjsQowOiHphvnMhRRoeyyOckZiFOykhRDKgGMaKNvCbetOFYjBXxXbTCTuCBtkQGkyLpusIHHyRPNNiisBPpWNUAvNAUXmOIKJDQPGEgSyrxH"];
	return rIImSlMvUGKdH;
}

+ (nonnull NSData *)YwAOPgkmYVtCY :(nonnull NSDictionary *)hopFCVusGPUK {
	NSData *LdOzWlwLaZUH = [@"bzQaSdsdJBXbkDJxQnsqHFyZpfXeNVTjEjiovUWCUfWbheUzUneuMaPpWRmVqIsEWdFXLxXxyLhoocGuSiZAUoDtaGrInGxjrQlbgkDxXFNyHJRtYtoKUZvxaWuCztLOXbShgBlbZBRtEfzy" dataUsingEncoding:NSUTF8StringEncoding];
	return LdOzWlwLaZUH;
}

+ (nonnull NSDictionary *)gzBuAEoDCzVGVr :(nonnull UIImage *)JyilsPWUdfZIdXy :(nonnull NSString *)gUuUjOfgLTHo {
	NSDictionary *GKVvOkNlizdMYauMy = @{
		@"WlDLicRHVdNfYKTv": @"mGREkWTWzWDTTZhfWHUlUzHkMkHThjZRGvGgWVClBXSlIYYsGSmrVQeEwNiqfwWchUgwLxGivWKnoXQxbbEvPWNJvYgGMPtIMOqxVgxyQaFQEtRRnCbaWWqrpHSHdnkwBlFTykCWDHKjiqrrol",
		@"wgBGEfMoCtFAAVBE": @"ZArHYCkfXaOAmSwoDquDDalFMnVCwaiIfGKmGEeyWgafrDzNDBYepOztoBNMdINazDIxnwQTRwKhEoqksxcBXlEZNLpvtImewTPfOzznHVgFzkyIutbbwiqiEtIprZjalemWEOsyLGhhwMPKdWi",
		@"caRyYOgHAoshDj": @"oGgxOHKzYubDNJJFOgGJxNGqZqAfhxtqXjsJIGMIkjdGIwvJWedWFwlIiHlNSQzwuqpxXUEvKeEyRoKrAffOLnYuLiuHQIxojMwteacbGCSIRRIpEBdkKcsvlIIpdxEqVBOLRH",
		@"ejKcQrtFURrEq": @"xoSZErFLUFwSkRIpeCEOWPPgooJdENiJMDEUCbRHwDUsHzFEZOapdImiVxZyujnMVcrjefLnRYdhOVxSNvYkueZHyCTbwWXEoPJChMalmoJlEkhDATuuktdXbzIdkBSdwJdoDJNEfWKpoA",
		@"vsJLVvicmM": @"ucXCaBehXGRKEDqIjLNCSWGxXzejVIRHReKLQigcGYvjtkqNrAktgFYkndvKsAeKbIMFHnQOerFMYthphFHnFafmLjeCclPFaQjVJMZFfQYggwdVqOtJYhOjMEFcRBYUngowl",
		@"vRJsuQOkTwgeIhMGLra": @"FmGtJAtvlIChRjJJCCBRUornurjyvEldYdWMeqtNQopnXFyotQeGTvASXZtqHroAzefzegYaMlwajzpNjeOfZloXhsnlHkeELLVTOEydeGVU",
		@"McESyxzTbHvtgfTVWL": @"YPvkjzBbedoiHrclCrfTxeLVMpBjhrtUlliBVydMkcEXGytrTSWcZrSlgKCZeALxLsSiKrfWTNkYKJJcKHfwBunonpjTJyPmqRFdDhXdpHLxnGFAJERVYvPVAFRiAWXvsLoSuYtRxCVB",
		@"mBKHPkNmVyamMjoZZ": @"CpYtVYNuEuSMHUsLAxFjkDxwZOMwZvNGjtVcVhJrUfSKyXRThflyIEcyXJGPbfoLYApXuXzkldxdgUMvcHAGNHsOqMeNjIYswnVvbeldhYtsHpTExhDtlfzEpTlAHsbBaylHHYqeqZdbpFcLjqFzC",
		@"GOmvYYVwYcWcnQfcdFc": @"gBipNoBbYecPZmIaApJmVSyVYIWCCmnAjAYFiFllpeQmKwaGjnxNPSnlSrdsQyQLJmuLhjCduDvRVltPwJVhwhYSDAPlWEkxxjzqhgrTK",
		@"WuGVOArXeEH": @"uXQauxcUFVuvseFlverrPbjCGCqVChdhjMNZPGaYSnOwcWloRovdUkBBnixEGSyTNYwJEnAJKLYteRNPAnKAUPbKRuTWtJrmJJLXIZMndvHQJtBahUSEsNjrlbQpiUXBmWpvPrSSqEBSpFBrpBsS",
		@"pVbtOjLvsaag": @"ccYFQgYEABGLgEtAmZKHRFppPYESDMiOhSkUTiWSGdigfbqTgGgfzrvZAOpLQwrYAEhvhvtpKJZBBynedVAoFHOJduVWKMTftnnlgvEGxBTUYFZmdqESWuiCmZKtdZLvHbgnZ",
	};
	return GKVvOkNlizdMYauMy;
}

+ (nonnull NSString *)fTkAsfFeyJTzQbXhcW :(nonnull UIImage *)dgZfRtpUoilsjQZIWMu {
	NSString *ffVpLtnNEgSTuceu = @"PnyvqSsSwpqShQLhwXSsbReeqpWKghsOzyNYtQVsASZAlQuntHOlQhOuunPVIqGvPrKGWzWSmlGrYwBsPchZHnctPRCNdUjgzVDAHcklpkHDhcFHyeeQZCQNytrjVtysLQycumqAoo";
	return ffVpLtnNEgSTuceu;
}

- (nonnull NSArray *)DKbNwUsmvnN :(nonnull UIImage *)PFEgdlRFwmh :(nonnull NSArray *)GabzIMnEKrPkOje {
	NSArray *WklETPHrzNJaAIquA = @[
		@"MFVhacpLWFPTuiGfoHOZssjEXwDBeSezzUaTeUnGksLhJeHuVyVBBQtRdrTootnnlzAVWTfHqLfVqdRLSiFzSbZRIkDFEbvJBsMZWhwUWrlDWXjTUYHRz",
		@"iWkibatIQJckuqRXerKIpPOcdYtSvRlSowruxpXLXxTsyYXNsNpGQqXlPNEimckxseQzaHjNBbpTqTIOgCAFBidCcnrMRisDbiQEyuOyQnGQfrJTUBTZxHChxdyuYbSxzgIce",
		@"ZzZQCeKQVpxdjHbVistZojXjlwNLVaWkvEhvsbkGgcbqWgxaykLjrmkWjxtJYxyuPunDwccaYzCYuiYXBRscTlFeVWdBSdGswNAhlmwdOqDRIYWdKVOljcKIZvLReksrchowSvRFaLJkJr",
		@"ztINMZXdUiWEfDsRubATodCaoEOfJNvBOwNwRITlcMwWlMUHRuzFOzOposZRtAcSASucSeZNytzpHSAXxzWnYbPJrhqLGoWRFeqCfMNAEhmpNucCnydL",
		@"LvQxUJnsoKbKmTleEpkXjiyTXEpUWDdsnBAFJKbgnlgzgIdoRVzWhEVqtfpEQqFTDCIlWUwyDjdKVxPZoIPbcUvDIPzCKmtHGEIdTDbgXfKWQJMHZHIliZDttRBNnvrsiOSdUhXetrjVzIqjQVeaZ",
		@"cpQPIFPALjfNsakZRnTbxROrRrcDsZFDZsXdtmmMYjizhPTKDbGDblFkVjxvHLvkrKQpsPRSeozQLcMKeMnUJLRzsCBoXVctLSYKswizAGkjjwFxtCYFfyEQqEMrBjClELWLwREYkfNmVtOVS",
		@"BTKthbXenqSxiwVIGbgCUvZXwgpgQZhOnhkoIvyUiiHksQhhqHyAupBVcSCQRpncmwsFWdWFrIrkNQRqyHfjyTkZBSDUbfeDhCBP",
		@"wXFwaERBmoDbcdBWqHyWYVZmgpOgGygVRjfygPUIOQhxpOIklNRDaGIqIdcuGcxOUUwNAGjLEPyzTYKdBdQXppXjoWSSHJJeNpgLEfJUFwruttMdDTqmIzI",
		@"hTItIwtsrkuTRbroJTcjsVQtsZMqrEzjqQOTrCOsLFKOvQUTQaURChuHXpGEcLRAIpsdAkSTGPWfkbFgfNndMQVsRnITzYWeezrpHJhkuxcSAFCJuQtCDimw",
		@"bqJBElouaHMhLxaeOFoWDNeBQzWqpTtbDMJjbggNGsGcLQUkvlchlLySLniNjAufnZJCBBlSrlWBmhPpDCyhQVyyKGRlbhmCCctXIsNEGHyZbJR",
	];
	return WklETPHrzNJaAIquA;
}

- (nonnull NSString *)iaonJfsqgkTIDYKves :(nonnull NSString *)uvboXtBRZKYPjQe {
	NSString *yKMBBupXkbANzhUrDK = @"iUrxtiIQcjZLArQhmMghOYlyBfzItdlqszApfTGYWqygTCfhhzwXbQhcSepxFmNFDwQudLulmjDaCPSqoTibOwMIOehavHiIQwkLbGBHpmTXaAPnEoEAfSxwzlMfBBa";
	return yKMBBupXkbANzhUrDK;
}

+ (nonnull NSDictionary *)NVPGWOvPSexwPix :(nonnull NSArray *)mJsJQbsyaaSbCdDnjoM :(nonnull NSArray *)cEyuXJXavuYjmIZsA :(nonnull NSData *)lqNvMQYyDM {
	NSDictionary *uUUQDERrlYR = @{
		@"VeiEbMELJSaZGs": @"ysARYDsApasvIFtEayWOVQTsmebhvJkKsnfJoDmDCndYBjUvQagvghJerUpfWnFpPJdWxoFowAqYlqNDOcVwTBzMXhLcZaizkQSaTNnjCkG",
		@"MqZIRmwdGKbhFF": @"abhCnjrgxgvNqfSKMfmvyDXawAYVZIWTYbpkQXxPpHsfGeeHxmyTmbgxQkuHMjijRjpGkfSXtcmkTeWcXUhriZPIGRMRQsPQiudcwbwAXgYEbXBXYGuWSWqaBJMeyL",
		@"gjwEMIAIhgSzPbjrn": @"vDwoQkiCjUDLVLoEFUFjGqUXmLoIeytMzJHqXSpAtnmyQstskOVHEBLKKBbVVyjxuobYsrBZLdOsCspmzZzrzpxrmdXhsgtCWcqkqBHfCoXxmXCBNUgemxGFydZpASF",
		@"icsmCidkDcipR": @"OnIzqCXYhgLiLugvemuPdADfqogcXmYpaWTAAspoEqGwCmaCWzBWtjbQNAvWkHtKxVUAGLKFKmoVsxzGdSpnjpEHBBQCUbfeAMliBZtrqjRlcjVhbyTvQgH",
		@"SnmnrKFgntCILPj": @"XckhtqKqYTfeyZmhqulIkyeQVfwUCWRDbJorwmuRmzWBDvlvWXJZvbLfSLYjWtlrUrYTcxBlFaXXCznhCECpUsUumsNrJOHxAHQOGHDeMzHhEgGNqJhvVnOguvQDSTxeUmFPhGJZIlUMgm",
		@"cuFIWLspSHgho": @"fQQfOqTiZKPZTOQnYhLQZCcILZfHaAzDLWbApeZhgklppHuCkWFmZPQytoDjNqLSNyONjRlDZqCvNiyXxGyOioDiNizLApmHHFOmakdpxpPnfONw",
		@"xlJBeAvUhqwpcmGpHpM": @"bLXWRHAGQlmHjSSSePHJaQauOImZXecQAJsmkAVBSAZKGwEsHxEklXoaOAYfVKqXxMaRmWaPVOtQzYutVoQEuslTEatUZRQtUDIQOoKShmZaoLxACjmAbQVwUOwpQxszqADtwXrgFLdDbuDgRrJo",
		@"wSUXXLrwYbkSib": @"SyzPCUDUyvDIDvoXiPgEaJkubFguHxvDBqBKYRwdYKllqghINhEHenRvtqeIJYqJiFpecymlnQZKpgtZoLrOyJykshTldtIMHBygkBlJangEIncg",
		@"sWRDddoAeF": @"bRCsQQWfIUeACPKDmXAiRoYHkMXYEuQgVClpWovVtONCzDeUxXaKCOebdCvEKuifMZMUSjOhLzHgtBzFZkQNeCKczxRQcFvgKdVQMTFzMRYYSgWjPYv",
		@"OTxqcjIDYYOERp": @"DBecWGsIVuBokLwBvajAyrpgaffACIBmNXmLVxkCheagDkqThBPRYlkHRMTwtITCNyZZlvBlmPafxUsekvezDPGHgDKBSlFxvvfKxrpKLFMPOLt",
		@"YDKTFoorsHGGrHUao": @"LadDunxVkXgEJFVGujUABYqJMehrWMstUdPRBDMNHALbhOhPNemjkUyJAdExLyAEEoXyKrwRCMZohlahYgZnKZOfpYzhMUCYLsyJZFKXiEyKw",
		@"DKnWZvhYfgaglTrN": @"gTcJkoJEzQuknwBmYdMAsFbGNaAUPPzxuESuyirsEivHkRzActpnlXSlsFExIBzXJcOjtNUudjeiAOapaGPiPNekkUplLTvHOKFTZtDyVpFjqDKeQrLAREDSuzFuSbH",
		@"OgPhmqNUWsCEp": @"kCRWKwYDeLrpJJdHqwkLGRBVasVPbQXffRoumtESdWvuTJfeFLiffejeFJCXsRhghKtxrdfFTRabxuhUqzCvCaxkCfwxZMQsZuVAKzUqzamHfnAzpxWuiftEpntDmaaLaSLgLKlg",
		@"CEEEDKJrpFqtC": @"ZRmXhcmIbJxuBxNteluHHQpvSLLjQTPzozdldaZHcbHpqzWPxVDEBrdqAPDNdKcEGCcwlxGDcNNdAkadlufmDZTSvkeBmIfkzpQsXoBXyAZAfXtrlgIamEBUYWsqCGaYCOaasUunwTlGWW",
		@"OjrFyWLuLScoaZbLCbI": @"tQobjiyOiKKzaSJiShOyUPFmKWHJzHMYgWZMwyHsiFhgJkIeBqCprWPggNUqBkPraSCzLUkTkdKYfwVVbDydGwGQISSJIXZRRWCdAAaIXWoCZNEOLvjzbnAxCFUbi",
		@"CFePfujlAxJIgdJjmT": @"GLnKhocnUydFivwILQVtiHVPxzydBhCQizaHvvZSnvlJZJVQJNCSuSrctPwBuXlTmcAsBaSEAcsztBhwNKWBIhQMFGNjWrSSbTqSvICnELvUrdygbyYLDIIoGzQMVEMDMbDywUgJUwhCaD",
		@"TzzLcNEXZs": @"gRxEySNyhFELqPBsOxcjHRMYprSsDxpLKyhJHgJklxQtZOtDmBrfJCpluprAZXoqCTCjdrlaHyojUYiuoTjyURupJeZcPfMUUucRrCsbLkVxtLtwjhXlhjiIKwlCZLQiBaapnjrRf",
	};
	return uUUQDERrlYR;
}

- (nonnull NSDictionary *)jJIfHVldnn :(nonnull NSString *)YpqfrJOnxb :(nonnull UIImage *)hufoTYraFkT {
	NSDictionary *bhhGttheal = @{
		@"TiBJkMqbmOm": @"GgRhFHbIhtKFWwQrsPuHWVEtaclSEOOrcmpaTyBwxpubyyMsxsOjirMaYzwIstqTXIFAsOLzUfqNrEaqjLpnsNKHOBZtoWhmYsbJzTBveiGpzekeFnpHMKvyfOWIoeLtsVlXIr",
		@"zJiELsdwThbdqwo": @"bVONdCMJmBARhUtlnbLTGZRCcgwYXQVOKwbQsQWSJtMJFYylSvChTlSJyRVeSctVdETsoDAStyBrSeHmxtywnjCZkfmypONPIHJrCNbsLAergdTVboBgvGhxStcVIGwzSzBfvTYsuix",
		@"LIsgLzbFWyAe": @"NMtZhDozitNxnBfKpnviwpbmrDuzFJrWmSRLWoQRukRmBxfIbJFVguHkSLTCHsDrarXqUvWCQIMrTVhZMeFnMsPurNvHILKwaWFxtdjEVSaZBUOU",
		@"stzZQmsSlKSeL": @"zFGwJuFcZKfguXkIlFjJIXVQthgmVGyaLyYqBIXxCShcugVAdMpufWQSCIHmBknMIHkivFmoYLknPQtmbaBVCcyRBESWvAwvvKCYwZOOJNHdUEjgo",
		@"JeGfkVgUTnQRjC": @"EkJSSHPIqzDwuyZVNyNFPnmqCbUKPYVbXhvEXyDTWUjgbgdJJutNNnhHrHsLauRHHRdqlfplpfyVLIVUQoXgQlIByqUFKhLPLUFqfNSpWkZAyFfaRrGVbsAfsaqHAEJgmRqEGfRQjbBfWOhJhjqH",
		@"IYfvuOFgbOorYjVivx": @"IBjkshunvvBVmUrzLZBsIxfLyVSjocVOUuMKQEeVqPpGAMyHVGHkYEUiAcEmetpQbtlVbKhBfaTRGyNoZMhxnkbzoIalMsqlPlRWArjssyruZThBAtcUfaFItMDmTFdFjwaqXREzJzihDPS",
		@"IdlMoUQjOMCtezTmsZ": @"upQMvcyWYRDFlliHdMQmabrdoJqdefJkHKkCTObWSPOvnEkOBFGcQuIresfmKOcrxuHaKCEIYqooyAWuGsDhZiFAwiAeBccYLgvYTjxw",
		@"jGALhkmeZRuxX": @"UMVSxTpNimHZiZPTlnKJqPapTkcOnftzpjLalPfFsjxXZYPEzybgFYCFQMsPLbyFYwfbdAQItdlFTsdqVQDvHMMmugpUNTRSKXrUuHOVuuMKwFypqGkgifMKCgprXgEiuBCotwBBRQWFhl",
		@"cSNcefoFgxZRTE": @"JvZLrHVgqUTrmbMsqtltGLRBpuAPRsnQpmWHIjwsCUqaIWvAmOiQiDyYxEofAPFCUHPFDXQakMorncYSCjtgIkYgYiKASvMjIzpkQZmvMhTMXASaIYpzImXMckESbgrSPmjIgqcRDPaTNSM",
		@"NxrPbJmhYjAPXFlmoMn": @"EynbRuxkuCsfomNeyYDBfEXMrWpJMcBccrlkhjieqhaTaLQOrbFvGcxsYdkCWsrtERBQpwZLjkZNwIKCTeKTbOULCsiwDMbycfUoPGmWWnMSHhdZwOUqZfCdk",
		@"MoETbwXVkIUdEox": @"mmeSmskAhMhejlfLzNntrzpaQsHbFYAEEYXeDjIFFxINCBXjTnEVWrkyLeNvrUeoCXPbjYbVvOmLcgXspYnsJPQDAGhevdtIunLpbsorgWSeYjwZYMswPfgyLbUpxxDXexOlOhtVMEb",
		@"aMwcXOreLdqET": @"jglduXsKZUxOmXoimnOeckHHxjTNoZshTywBWfNOShJzNRFMKqrJeJVlthQKuEeVdUOLJRBgYwkKhzoOITpkHGFTyYOSzvCyJCBUFXK",
		@"OmDfQxnDuhUwUoRNZ": @"FDWtTTBcFsQtgZGWakJaclPEoqQqHAhWoiDpeOjrDRnflnkliDhdWHLRJAmpwIHsqxOLgEbpxPgVGQhlfDSPnXsSvqIWtUscqxFLudHyuMymZvxqxTnbOlNtIsgiHqQahnOi",
		@"xeNQROguoQXGLVHDM": @"RvpdxWbcJwRTOkiLzHXpavNYvTqjZJGOIrFUOWUTROydkeyWtNNeKlDCiscRCAGBYoPWcthRlogYMxtjlmIBKCfutsIAAIzJHEimweeKiXwPwMmrzQDJloJFdXAEQKjmSHHOElWjZRdfn",
		@"puEZBjhBCTtSTK": @"gavMeEfIhTQQcRbGIKCurzvsqtjCUiKxKSaGmGXncLqwOyVSnydZBjdAQtgiZrdWYKtUaCQoXQrbfuZoMsduNQOGyPEaoPkyJLBRBtdULmqgMKOzJWeVRhiIarjotAoWnnAdcvJeezTuoxATV",
		@"nZUobpWBZSTfrGynj": @"sKFWxEldQvVttADFVwBjocmZQHRdbcaVawXnzEozMApGltaivzVxHfVZOSDCWahYyXOenKvXEdIypohSFphjAeaUSemAAFJgsgcUghweTiHTCCflekAtojUdTHgGL",
		@"UgSHerXXOGPefo": @"PxmsvFwdXeFBRAdXgXmZPDwEXbSvuPXnBxMWMnGYoNSXHQhezxdzrwXDGHTLRFznzuSqkCURrKERnYqqvQyomjIZVNtVPEDWfMjxbfWIipksbsaFQuLtCQxwbKQfWLBaavFgy",
		@"HASDXDCqPgVcFXNWd": @"nfjhxQktSGZJoAprpMyqypJjKwEBYFomBwwWwsNVgOiddoRxWmErZEdADjKlpkiVzRmUipriWcLGWuPGsJjVPgkpVSyEtrYzqLVxOjtiQgmfzJkSSIhXnxIKHsIwdDaaHVtyGspWuNIvpY",
		@"BVkGxfyDmBiLHwzWN": @"ZhiSOhmvVyVlhoLaArnMSlOQumMVrUKGgPuuuSQqaFziuxgXpCSQQywhrswJNZyJsSFAYAxgOgtzAatNNfpUjVBvRBHUeIQnFLsdfGirccIhIZ",
	};
	return bhhGttheal;
}

- (nonnull UIImage *)ZVrMRoLpQBthRGD :(nonnull NSData *)hqQzNYxuFpJleYSqKU {
	NSData *gdFVqMXCvDDZkBxCkGk = [@"rWeFchxwgrGrUgxqAemjCXREjppLbWQGwqqeTWJkJPDTZyGvxfzVqPonFtPfWmwdEFvvrSxdIBahpxFZLXCJRUinijoMuKYUvvmBLFnk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kvtmhgYGfmYYMFN = [UIImage imageWithData:gdFVqMXCvDDZkBxCkGk];
	kvtmhgYGfmYYMFN = [UIImage imageNamed:@"RMQdRQaDoDXauBBZqmfgjulUiNPuSrqyDWqujWyzddJJglPOCCAWrWnBToVFOoLEfidwkqjVCHcCwItmeauHkQKSeDPObCoWQGjTdqOiUsmoDAH"];
	return kvtmhgYGfmYYMFN;
}

- (nonnull UIImage *)VOiRKZsvKD :(nonnull NSDictionary *)iSoCeuFRlTmfxOWL :(nonnull UIImage *)cUSkUGxFbN {
	NSData *JLLdqkmMMNDFnCEHcSP = [@"cMIJHZQgWbrNpKxUIAPcQVwNdxEIbujOGXBpMAJrRmiscMxUwwTZvnHzVyqUIvVtyuLPNgDjFqoSOqtQtLnsdZeBdyfbNzgkmzccXxFuBGo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cFCATuXBKTsRIEMQUYY = [UIImage imageWithData:JLLdqkmMMNDFnCEHcSP];
	cFCATuXBKTsRIEMQUYY = [UIImage imageNamed:@"vrEdInSrRQDCdaKBdHcGigvGCFjmDHZsWhpvWbpiJbfnbGhFuUWRxOjaDqYdWgFPGovSCQixTehqaywCmscsaSqIIRFKNWtcMFkXYoS"];
	return cFCATuXBKTsRIEMQUYY;
}

- (nonnull UIImage *)PiHVVqOrha :(nonnull NSString *)wYIquyiPqjJieaF :(nonnull NSArray *)iajZVWkkJaYosd {
	NSData *bpIrqgETpzWao = [@"oVvEJnVblnxAQVNTEXlaBIpJqoZYcDyRfvUfzGXNrXceLREoMMLqIMVOKkSbqEfWNeGXSGsqQLbDnnoFFnVYOpaYbAZDdksppGKxQUPQvRjzF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mSqrYSQZClMh = [UIImage imageWithData:bpIrqgETpzWao];
	mSqrYSQZClMh = [UIImage imageNamed:@"bAybstnImzmCGchnMnBTTWovKGwwbYFyAXdQiAJIXuaQBlPxXUZoTjGWDtvBdCRAseEzhDbvzRqoXVMoMZyPKrxkAbtvflICFCXqAionVNCGnHWUGKGuVLpkjgAVNRFMOciaZFitrVcEKSBEY"];
	return mSqrYSQZClMh;
}

- (nonnull NSData *)TYmzewZIQOhoKkD :(nonnull NSDictionary *)bnRsznmcpRRfVj {
	NSData *fNOZiuryAHWNTg = [@"DDmahPSGtWFPAbvxERlMivaNksBYrHbsLnzjYLmlNsvFADLTNkCVdQtAWYREwkrRQuSqwxMLrvxEcVxPbVWNLIOVzzHScXPmACRRfsZjiRRwZdluxHjXrETIwx" dataUsingEncoding:NSUTF8StringEncoding];
	return fNOZiuryAHWNTg;
}

+ (nonnull NSData *)HjaLmLMjYgqEVd :(nonnull NSArray *)rPdMpbTwGvdGqujZmE {
	NSData *dMmhZlpzazlAsH = [@"loYDIIYGTvgzbBZeoxqDYhnRmWteLxoNIAiKDrrjmfTSIdjuKaioOQuIPGLqdJnaTrNaBQnDijEpGsuLVNsdytvPkZinZAOacRfjWLBFKjEXArbmM" dataUsingEncoding:NSUTF8StringEncoding];
	return dMmhZlpzazlAsH;
}

+ (nonnull NSDictionary *)jqOTvGahuCRF :(nonnull NSArray *)fHATtdgynudgUp :(nonnull NSDictionary *)TWmSmkGPyE {
	NSDictionary *mhfpPpMzeY = @{
		@"NnlBvohHKEfryfjU": @"jrdubqGwlqHzRcpHMdCFyNuXAwMCCWfcQSLkjZcGeiImqBxDJIEOzllTuzIFnVewvHGKNMEqWHqnBpIexZjDUAzQWIwamIVrvDUijqYzFwXPKjTqYhzIlKEpFjeEgXOlKYSKGr",
		@"nUydaaIHtDjUBcZN": @"xAXFxWrIJrHdVxhaAMpnOjRFihJlIxvjZzuYwicfgczFGFblzyvsnTbzeBFYZHsaheVtCFcjGVDcrdhlicJmiSUnNlUsugBYBwwMHIpXK",
		@"eIwlnpkKaqI": @"jSDzLvcqpyfWqURETNiIFNHkcdMbJPTwoqbHJHtYbEOfdpQhJctnQUwdxNFjhXigqdWKKtxsUNkQSacMqqmaRtezSigQHdQEqFuXRHsLCYKTIygNjkZcmlBVpFKGTmYqiNGizJI",
		@"bnnOscgXIv": @"dTycCLLWjYGTjMAKGOzcbrPKvkzUEELvIBLNZPUKpSLXzwxJAdBDJpYyBINvQgChihUANgvJyewWBxTnPvJUVaVgkltfLGsdAjOzisiPpHXHkpacOB",
		@"BPzNzQRlXOojJ": @"cSFSJjXoRiFyZonNJQuSHrcTppTUohtjzCcOattIaHqvCmeepbzkKiblnDvqJdZqKQOHLEdIIHDhHgOxMjawrgEkZREneleDPzyfBAYu",
		@"WvOQsPbCOvWeTvWk": @"ZqgvTgdtZNEWILIjEmZOmzsHBlzHESGjkVwrRSQOKhlmFjrercSOGxNhYbPDoazujCwSQhpkiNsbcPjKQKxaVkHReYKyIwuZHeSM",
		@"zkSKevDTYD": @"LkLYpTZfNAMsscySHmYKGhnDRQXFtEWzyAJYwqZbOUQAvAyHOIywXVvKjKZNfhBmXsPPOsaEDAZIstzcsObyusdUpYWJWPDFfISpoKuBatFUCXEsvpe",
		@"TZWwnWepWVCmdSo": @"mGftZuWuDgEgizzxPJFMojhcIPeWvOphlLLVytIlmqsWleGWPcKEqyOeTtagxsbheXQDTDxfiGsZdJagdIpTektbSKQwLSnXqVCHPBwzQFDglfINlXEJMgpwFrZxvEmbIuurYTj",
		@"QRhrWwKVkMWLyZSyhwE": @"cHzUqTQXdRLBwugaXHJYIwJBtrtxJzbNrlnbADlMPUtkXWUZopmjeZkwdqmwzzIZiFWwULxQFXSzhxUhSscLGEOoBYwaQyxITLQpgSBDWxsNZoPGDKevfUuvRVyAXxjOtNklgmExcYRUaw",
		@"PICaiodxEnhY": @"BmRYnRtsITDjLdmXhkLPqmWygrYlKXjOpGYjtppVxckMGgJIosXvssuCCYKarwconOZtEwiFarSNFeoPgaCZrOsriIbblNdXmxOOwqawbdYVAndTSHnVeVKWm",
		@"olbFkKjjSoVCpgildgd": @"SqwJNrIiGvYeRJdTsbfqnjQvryQsJRXCAZnIfheXlmHBpaDaxwjERfMDNfItKVakTeNhCxionoeUmRvUZDyeheGZCAQyHLtQlXOXeFlvhSEYPKezjFJR",
		@"BzaVpHubfQvDWD": @"TNfVliwxtgnVfqDbqMkhAzkohzMYNoyAeqMVNLKknGFsklRUnImuxuvIEIFpEiJRQcGDHeZphWezxIwlsHPPJtUsGLuDhKhwwRVsFnCEbNHKEVCUQdSqhJ",
		@"gIUzGJXZrjlbWvb": @"edwuZYmzFpLFiKwKhvJzXtGMHxiVUEJshArfvttLTtgLBYeyeHhbLcWxNizYSLHiBiBDIfveOFiejUETujrLQZslNnytzhuRNUpPIvSskAEwujvBAXXcAhninbCixmdNKlCXVXLjEMEMoHmuFeyK",
		@"vSHmSZaZWeDeUIdNp": @"dXTInPuuyYAWOmjSjYqTXvRCgnlRYcjXaBNurlmEXrymNsORzktmtGiFmUaOCQsjQHAhXPaOPblxTaQxaxhdIYIcNAQgHiCGwcUjYiucRmsHQqSxxnKU",
	};
	return mhfpPpMzeY;
}

+ (nonnull NSString *)javyhsQNZAkDsCY :(nonnull NSArray *)OOZlPUrZaiXVlZRv :(nonnull NSArray *)hKTuBuhiIG {
	NSString *ZIOmHHsXUndKTiwJqY = @"HGwyURapMhsXoneGQTNNqItClqCOwNmMKHCSPFlCvPkfnxiwMvyqrZNsWxvNHoALSSAOgNCAvTnAFGuOlbchIPNQkQGMsuqIOTQIddhztzLSSMhGaVSuQIgjvf";
	return ZIOmHHsXUndKTiwJqY;
}

- (nonnull NSArray *)xCRgxNELmLjbW :(nonnull NSArray *)WrLKHjkuBQs {
	NSArray *NtyGOXlYrx = @[
		@"ujFaUyoUPDlauxdGguePkeZrceRdfUhkvsClZLkBeikHrzPvgugdtdsFdzxiOpyowXdbyPsEaKNAgojqalPmZtLRsceExZbeiKrzZadWLZkKhqYEZhxQ",
		@"ZRxBbEeCTHjLSMjCawEBWshnlVpSfUwElRTPePTqNUvlJhMRVDalEYXuCOTOrZNKleAKkLKipaYSVZMzktgNlTCWfddvqqARbsxagqlemFJedaPtciQZUXnTLAGeeFqAOOIDDLRe",
		@"aalDrRhIRxRltbkHfUMQcgHwcKPqePvlmOjVVsmeObtxMwBiWTbefTcaRhTnKhVkymgHrtaAoIIYuhFdvxKuzNxqQxaiuMGmkbERYWZarHew",
		@"ThmSJRWjjAOnzoZdhKKuntPjJMANsTMAQOuZpQLyXJZAfVnEsQcUvrTvcjLBIVBbRhrCdMSorWJDkPCSlCExNxAjYfwrzjzraziWeFECehjFtKDbEllrHnrkYCPf",
		@"NtvLUhLzXPLmxPJFadFrMrBntmLuMUnUYNQTmQNIOfxZSMPniRCDfYEHypFXzvaUIREpaMzCToLsyBTKSzulgQeeQFPQRbEugugRqWSNHxcLQnrOzljrcNXKbDZYxFdfEICzclrSQ",
		@"gmRcRhFIDtZRchDJXBZHGTYeembXCGakVIwYJOwoLktkbixLKytLLHQnZoLICAcCekvrvHpSAOSmOTbghCHPNtJnshASCjaHpEni",
		@"JVFjkTLGDQmtXqlhxgqOEjnPMxaJRfFZUnWaeBaFOzmAwtWTANRxVNyhKUUnrcnBiCOiafPZLXsotzLPIpcnEKEmfuRBBlrQmbvuiBWjsDjzNsWCsegYJwdMXdDWISUrnflANQkCWODE",
		@"xiOmhBQGRGmiJIEFVuKMQGIpuWbrAKwvWUZkAzWYmQfzXGTRUWMJhzcmetyWJlhKwjojgevVQHjzRpOdDMSNVszTErNZOlihgnroxFXHqDcMSsCWLRgRFK",
		@"ZQiwtuUaZHlzQrhFgakpSVGanHJUpKoCpujOQoWPSSjqGqkUjIIwLKsxvrMBobYdqmQuSQjjSbMevLzfUtDsRSyMMpMguUEyqnLddkoJAHQGHxSDlTGOxniZdMfmfofiebAQpUHeIVYPrAjJ",
		@"cOnWseAKFrLcXfSeAuTqAFdDgbQXzBnObWHMocYSEXrhfdSoTvJFGVTprjiMiWYEqDeeLLYMIDNLpAjgAnLlJWUkSnYXXJrsYvZXQgmeydPTqulQetXfExwzHPhSRfXFQkgxkQAfzEefuKYSCe",
		@"pRjulxFcsYaaSfeXnwyZOuHrjoxHHUGxBNAXNpdBSKSQCroaTMDmecSXtuiiMKKLVvejDaGpQqoJJLQTZpLnxnWXOgMgBmsITLSDGVgYYeQmPOEMhvRtHVOkuOgRPflkjajAdrOfvYmPsQSPsnsOg",
		@"nwJRXvzoNMWVWfHAGVhqWUjtbRQhtBSshbGwujSpyOkoryPOxTomHcbiHYKQgUngywcUdVZCXjPiZsLCnaItCtxgEfKXQWjfpYJMoTCHnVqvlSlT",
		@"AkxeaWgwkPnzpkWHESilCsKWUhnocItnceOUgjlDjFXjzttqaetpYPudmYeTJwDZSojwPjbKqitQyuxmYYgfoWmmJfpFrDSgyEziHSonsVoZO",
		@"FiAYauTrLfUIbgKVFyLAeIvDmOlghtcHDFickcWuPMlXaZxmGhZFLJSELkktYJbPribvNpBYSfRQsJmAOHoqSDaKgMjfsarYEIGElGGyVFNpPKGPYPmVkbytBWEehggZmICJKubmyoGBHcF",
		@"dIVWPlGfEmeHnwAswecWHrOPgtEQWvLqiWmKPrlAYZVQMzINEIYIlXjJEbstauybAVNORuyCBIirjqvZPpczBfhQzfLyJyWRRPvDTSzUIGICWvGi",
		@"fCrcKcGngYiufcEIurikKLhoGZHHEDUvoEpLpunWAlhbZylYwtGfygSegztYkLvPcyVmPcWZpYSckmunHJvlJdgrudMdebormfHkkxcStVFTkPfSUEXGyzokKbcy",
		@"PrqgkvXNTpnnAqVwpybiMoDJosHmTeVIKHuHKUyxMkTSlnCIfskrqSSXpDyMiSUJFtYOdkENzdayHyAWtCOyGzkxiFPCyeYgUTLuFleyqEEJGgCmF",
	];
	return NtyGOXlYrx;
}

- (void) loadMoreData
{
    self.isMoreData = YES;
    ++self.index;
    [self setUpData];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *model = self.messageModels[indexPath.row];
    return model.auditopinionCellHeight + 70;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
    
    [self setUpData];

}

@end
