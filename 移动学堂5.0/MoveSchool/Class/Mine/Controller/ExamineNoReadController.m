//
//  ExamineNoReadController.m
//  MoveSchool
//
//  Created by edz on 2017/7/26.
//
//

#import "ExamineNoReadController.h"
#import "AFNetWW.h"
#import "MessageModel.h"
#import "MJExtension.h"
#import "NewMessageCell.h"
#import "MJRefresh.h"
#import "ExamineNoReadCell.h"
#import "ExamineCommitController.h"

@interface ExamineNoReadController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *messageModels;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL isMoreData;

@property (nonatomic, assign) int index;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation ExamineNoReadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.messageModels = [NSMutableArray array];
    
    [self setUpUI];
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return @"未处理";
}

- (void) setUpData
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMsgRecordAuditingList,[UserInfoTool getUserInfo].token];
    NSDictionary *Parameters=@{
                               @"status"  : @"0",
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

- (nonnull NSDictionary *)xGmaClPEPbb :(nonnull NSDictionary *)SmzhOvnPBZuFy :(nonnull UIImage *)LTAUzaDbusNdNFa {
	NSDictionary *uruLhvCRlRkBY = @{
		@"vLdGgiLQmCHKcQdX": @"KABMtboWpWqmaFjCYiOPgEKjbCxmZbgijJwMDcysRrOUqbFvHrFLRZcZPJckPKdJwyuzOwpDicTzPXrPdDIWbFlTtEYjSOxvgGZyBvdElanLkYOPVwusCdffkeWmsKxDOgLQ",
		@"qvXuGkcopbRLUbm": @"TePlJfQGYKOYcfAvnDFRJTLOphEJoLxHdxpGjqPIWUMlQTPuYlsZHdNSYAkvAJSxKDvMKltCGXEpmvXUtoKFzsfmnHGSIEoJfKMpiVjCPIqXGgsdUytMWhKTSpkbGYFWFXhz",
		@"oYfNlmFFQa": @"rPZcyfxVnnKIDcrByHJzaNqpxHobOKrHzatzNzBfGYOvWBUWwkuwKMeMVJfutqvqIRQMpydBmwqZqSZftognOzeZPPvohbUvkSYpDtAr",
		@"lIBUyGlOoeLnQmN": @"uQXVapqbuYIOoebbEpHCsMexDFBmyCNmIhiBXMWKgqvzZpLIunpYBBJCdFhDRjuKCbdDCHgBYCnfNaZqtjyhQemcHntEkBwKPxwcROICVqUaJRrVqvkGnIWyQ",
		@"YhKdXYPDMGobllu": @"LcDroalZPGIQnYrMwZFyqtLkxrHEKaFCzTsBKTYLJzueQHwCnxAalcZwQIsqFkGMviggegNYmhzFbWdukrsHwmtwDINDtrFFKCzfYfWxcLAOAAKSHGWBMCML",
		@"IuSPPXMiVOlK": @"ceGxoIbYoTIbYWnaQACIkCfzRZBVkKWprhvvLEplguNeDQywjNjnCVIGmbXRJhXKGSwkEOTDmQWvdwkLbxIgrXuvVhdhQqfJWjuRpaOHCyXbsbdJcJsczKfmXheCeoGBCnyhKhNOhllsUwSjBRA",
		@"nypsbOcOJELEWHM": @"ziroKeJReWqouLFrUGqnmBEjbdHMLISGooiqygODCBathRqzaFDvBiENxsGailWRAAcDIhDZzxbeAfWEluTHojmNqFyCVNadPYGi",
		@"ovVtSDipbazBoTIh": @"nRztistndLgGDtdtIFqULJEZDYtKkZCXgQHINNNZBIWJEWpujhSqxKjMbeAJaHAeuDWyVJoVGYiqCGiCmVTPqpGZygUzuxHngbqyRiKblTFHwqtCXdXBdysf",
		@"TAvIIUVbdMoPSpCed": @"ESsijeffwVLyWvksUfIYWQKQrzlJkPqsiYjHAVuPxruyQlRVBHuPpQCkiWxgPMvcWSTodvffFEyEiDCpXQnKhabHvhErEEIWWRIWmVOASkaXKr",
		@"lUJjRDvnCCtU": @"FYgDICNERNDTkgRUMWAoOnfFMrsyOWGqTPZpDZjudkAVVeafFKJfkJykcQWuPVuxwhrsSsXPsndVqflfuzfllyTobIctuobJErJBHlghQosOPBkxA",
		@"GwkKdGcJAByvWXa": @"UQhBrgVIEWREGTMpKyeliwhOOHBOtwYPzwTsgFdumLBpwYrcYteYgJhHokAIVsRlBWpEqLtAbAIgqfJiEtRswUovcRgIpgDWxNyDnzPpppoaBJfTUbtcIXbLScukYFKXJTDLcUn",
		@"KqPyCxmGFUuuLMhq": @"ChFRmYKHYoDOQmuKXAeJAVakMvLpLxStipoLzgKQrgBpiCCtcQeoaOzOVSAEkTmmBqgGpMzDrPGnZSZzlsVdRXNgonZdYemOGDUhthPJpzJnrcAqBnRtNcUgRuvjOaEVKqFwwjKzDDF",
		@"tqLtGXEVPZQddxVV": @"xkzQRBxZoNDhvPdApFleiDtdZcGKnhUOqlMCQSXqXtWtvPseGCVxZjnokbeFkBXeRDVpzTofSelsxljzWyJSYqESzGfmEOisLZHsimv",
		@"QoPlblCJSc": @"nUTeLevxdcAWIzCOLEVqhJWXnCLqbClWVfccLKezJFKvZeafnSRjluSDSsRXXvBoKkjUiZNVizlVeVytoXgEMQPcDsIpjBGjGjtfCmWrJgNRbcFmtAipsSpOxURDQRxi",
		@"gWljcfEwhateVDFCCe": @"OPDzZedKQovgIXahVpxYkHOPnQrKZedtWRuycjgFzCFkghXtlAOAqnKFFcJWacOnYAIZwjCCGEwcznTTpxKJwxiTYgBxTMXGICrGoQiOyjeRaMINmPuxdXHqSzSoaNiLTqCYjkPHTlNRlFbrVpOOt",
	};
	return uruLhvCRlRkBY;
}

+ (nonnull UIImage *)lHeAoSSGDBpHePle :(nonnull NSData *)zSYFfcPyRqlRX :(nonnull UIImage *)ONLcTbicDlJyoR :(nonnull NSArray *)YaBrSDkcezpcQaaRo {
	NSData *xMmthHcJDkZjXv = [@"hzKGqGhiGvjaApVSpxGGrJgfYEQfzUbNSghOgcOlhNRpCwPMTPlBXpdrxPqzghQdxZSTytCbJcbeYZpHzKnyMWBqGrTBEgmBfjAByGqjfimSunjZSKHfIKdAadTkpFPMUSpEzpWtgZbKXhSJeWB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HdxfglpfoXTw = [UIImage imageWithData:xMmthHcJDkZjXv];
	HdxfglpfoXTw = [UIImage imageNamed:@"bUXTFwnWhLDMWtZviHoujRdpmzfzNVfKxhUfDAnTlWnnVcnCWBfOYzxlGujqTvrtxKXcUfbziEyzoUFOPCCovBmJQxfvyuCnPpTuUZ"];
	return HdxfglpfoXTw;
}

+ (nonnull NSDictionary *)cdavVuufbZGxsSy :(nonnull NSString *)dgVAhhNIMTaxiJdRz {
	NSDictionary *wDwEvWAyCtUE = @{
		@"GfJZXNbDHZF": @"VHtdSPXUrxzcBfdSQMURoJqUwDFMQUsYMoysLxJGnCZimkqYLDNizsIsHNzaGpjWtbBLWpHAILZTCthTiaxfdNkQOUerFekXydZxDZexMPwcDSCfrOrLoLHNJWlYxuOdBVswfeutNS",
		@"RZlTmoCnhS": @"wzrlbqyOirpanylWUSzrgHQocCrPtbpMvVPOJjndUyglnyyNvuxrJlexlablgAsPxzDQbWvccPibkuxupHAuHdFTMnEhEeZmoFwhaAXjzyOrTFSuvrlloMaSHx",
		@"TARpzIMUhaX": @"AxmfkxFbeRrcucxPZMlJuScbISNhcDamLftKuWWtgbMntgASIcdjpzhWUYYIPbVQLtjdUbgZLVZELhwbwIqkKYGyzoILfopMkReCbueqrO",
		@"ViqOInZBPpU": @"SqYAnJtUIkAqtLRAOdalXAGGdxHolTHpXruOFOcahNwQMEiPoMzYstuLKRVrcOBDtDPXaRaeLYLOAUgwzuMEowFgxSlMnsAaHqgSLDOYIRonAVhIqLecooiTaARtCEStOfkmloYRSlZnUqHUrmBbk",
		@"KyyLvAicenmMllfHB": @"EPKDMbHIZkucxFwEEIKLiTJITnWUzTnmKbUSWDjeEHLlzCyskmdsHQvVmkYFWisIuSwIIEwoUvGdcgFEvErqOfIgRMPCFgqYzMLS",
		@"VxhZWePRQWXnau": @"zFGGpwzdTqkiIjIJEDRXxvnUyWKppvsTSZbmIGiLqXiNHwhZPVjRKERfjgoakzNwZrwhOlKqLBxRrfXHFlFQeBEgcFUNvHHBiauUSENaMCawAgawNfrcFfcIwDPPZm",
		@"DHWOTnwIfWLr": @"CpsAmUvxhXfVzVnQMohZmpqyijTXmZBpunBqHeSHXFhsPKtMrfKBgspeRZHReCLcGMEUIxnilwmcUBxTaoxijGxGmCizZihJYabEuVsuTDthXEEWRVxGbPLsmSUNnHCAGgEoyWApS",
		@"fPtvYmCeaJsPYi": @"aGOtwcVhMQNzrcebYIPjkArfOXVmLVZmexnChVCjWnOMBTAIWfkMCuJAUTqilVDRnvsLoWZuQMYhOSGEYgDROtJKEOUqpmSyGSmunwYWCwMnZLfr",
		@"dIfUpOJRKhimyR": @"EAkNFxoISHuHpKGriYChhsFesCoIULDnsfXcQwzEHSQkIoasAzjVUTUGLbOeBxvaGFglfhdZnlwgcCEzxKVBkVTBvizEmwlKSOveDZzfTiUVDfNaOHOrk",
		@"wwAEZmJbIhJsNAmuH": @"efMdpbsUjITXtxfTKnXPDgKwXImBdAeKjkpjnjoTXuZfuTRGOAZALnPwwZQQgifmKVXvEPZoxNIuSSycVZqpajsPIcPvtIdVLLmgGgliHQNiNaCBsVoCvkZFUgcWufQu",
	};
	return wDwEvWAyCtUE;
}

- (nonnull NSString *)eQoObbQrpGG :(nonnull NSDictionary *)SefRmaxoHYOn :(nonnull NSDictionary *)cqhIzGVSEmtEHEDeL {
	NSString *oyoyniQByl = @"sCCFOsTHtplRxPuCqFVCMhiMNtPkUtADOPLKgDHvXZwJanchQXpdiSgqxVZfnrgZauRqCjMseSSwHrHYQWhehzKGKIYOgxzctHnklVCRJRDZISWRIWYJMiCytTBOrPBHCixUrglvxHiPPoAmDJRfT";
	return oyoyniQByl;
}

- (nonnull UIImage *)PDaKCxbyQFUk :(nonnull NSArray *)VqkqNinfDdYPPaJHqI :(nonnull NSString *)IbHQKrhdTqEkuBw {
	NSData *dlvkjdLetoDHFgQpw = [@"uYwCViRZtYMbbNKbAdqLZucsblNbvrlJFhaFFwnIRmhdraRGyADGsxCYmNMeHRZCifjGHyqTPfxISixlweUoFrnqmkFABhjsalJPNHDHZKAkHnkLbnEHeTRWRSwSwYuEESaMjB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EvvnwZpVEKsdwSH = [UIImage imageWithData:dlvkjdLetoDHFgQpw];
	EvvnwZpVEKsdwSH = [UIImage imageNamed:@"YgqhVDrwsEFSajhqtIjIpWygYQasWPDJotxcaTnAgTfigIrkdbsVsEBqoPnTSFeoXogDVXYbvgOtEnSxaOPXtUATFhnexpZmSJhuiiuBIKAwKJI"];
	return EvvnwZpVEKsdwSH;
}

- (nonnull NSString *)rcjtjAepNSRGwuOdZ :(nonnull NSData *)JvyDvwAEmfvdq :(nonnull NSString *)CjvYgzbBIZLhQYiWY :(nonnull NSDictionary *)QZgkKhSDiWBhNv {
	NSString *DXsKkjyQvURZjGTnLb = @"QUvODsUUzGNbxXQOTUXXKhBzojgnYpLqDNhSgNYzJWiJeFevtXxvcueguaEqlsipXDbTzJFsVJJJSdOmxJkeGLualSuHYAsWstPWQRrUtoGzjjAsOfgOTVxZIzxmeJWHVdwWCdcAuPZEttUR";
	return DXsKkjyQvURZjGTnLb;
}

+ (nonnull NSDictionary *)ctxActefVwRVl :(nonnull NSString *)khUStNFuBeUpxzwkh {
	NSDictionary *TxAPccNXfMvckXNf = @{
		@"iJfLReslLBXCrSbSec": @"AxyZklxbKtTdoYfvipulwjXCpwyvMIcMEtyjRFWYBJAJxQtXutVBuamjQhZbIxrSXImEMBoTtxJRpZJBgpBEHcRChbOVeVCRWuBbFobuKnWvPpunZdesUiZor",
		@"rvExfVOkswMdViFm": @"DjKQCnZpzXNxDvxVuyoJHXqqXWSdMuqfltvJojMsadNMUPrinzXajejYDHWysWAvdKnQharhfUfHJcKihDtqZjKBadfIOFcSQhYkpEhNFPZFXVkXpjjErXtdBds",
		@"xqXDLlKCmapa": @"vNmJKknAOnHSoLLdaSmygVKsIShObnPPedySZjrlvRVeXdlLGHlhNjZdOMOqOwoeRZtfTVwliFOuwlZpmfBJIHzWBsWXjBjzvfTGvYbYwLFQHvVgzIFqVNpmwOVbalGFKYG",
		@"mxIcnmRgRaSdGULxKHo": @"YEnevLxsbMOTFzsqAfKJfUelPsuVufpzsKkFIHEdjejaasGeNBsFdJeeaBgmwtCmOtIUNvJGSOvgDFNuVqxBOnBBkGXaMZkzUNAewdFToY",
		@"PjtyLGbRJrO": @"TlRGMXJEGhPeRlhYgsqixbcbotEyzDpfHjblGhXxHRmrsVTmalKWaOgmndflTqNjZQIgVKYjkMSIyUoXXtFvLGJgHJijxnUCOYagNcrwLdzPSfawztrZwOYhehesaLDcgkZpoPHYHEYvTvRvwjkCy",
		@"msZnawNoydKbEj": @"OaFSCoaANoGjyVCuzBrByMhopvXeaPrmOGIkPUNIHpwuUhCSMOgREbpRLmPLSNdckqacSXeMGTCcDcMJdeZVhdBjUCUiruUzazENjxtlXqhFuJCztPzV",
		@"rNZOLysziGjgMLcS": @"laYWDShbZQEzFQbRcUCgYKlAxCyvvGkEkoXpKhIRSCmdnsEvsaKPrTbXgKUKuKmcdpoLrVIaJYIjDdiyzJnHEaAFZjjYgtmSdBRKOzdcArbbAYZhqBYgJSVfvRNckEiYLyAWj",
		@"opUToVfbSK": @"CayRyZRWHSqNizEzbeFgasIZzISGGUGwkqOohpOJiaPqoyfffxMBicBiXlTTcFuCTElXLPBmqTISSldKImleWMjdlNwFGmXWUOoNWPR",
		@"aQNCbAIESPIRtllhk": @"tqJRRgDpNAefHgcDzUceoUxbhDRtvRFEDHsuWBXtjDEmJmzaKPOtJgGIbzIBYMXqKKwCgYPYGCHwQJYVeOafAXsgNfzONxUlgxdmHkLIkcSrkGgdPuBgLeyWyNjz",
		@"uKzebvxCHXI": @"RsSOFhUVfJrodjGdKpPoAkGMbqjByWHqAgovZrrRwHUIBVdwFNLGLzGFvFJXebulJhoSTNBdquEzVYbanKBtJRaKLQVxpJWkACXLFyGPRBmbzLEiNCdCWBE",
		@"AbOaYcVKJsZArdd": @"dFWxagUTaxnNbrTBpQShpSSyacGblzMlWpPCOWcRtSDfEjiAJlCkyXZOvSjluKTCZUVelEMSauzESTQxIKPJuOspFttgzfkZJOijcVBjpJlGhaQdMSQ",
		@"POjbGEAcFPvlOlb": @"SrbGxuGlsrdAkxhmSfsDJKeWjVRGgzLLIPSUMFpcfGNoFqEvwxgbmnIvCGeFpVSKqyEuToRRxqTFWhSqDxtXRduwHezycDjGVNVKyRwWXVvhvSNCUqGYApFQUgjpyFqPPeNPDfPdyPKeZxFdMES",
		@"LZjbohTNJrKZHTDQod": @"ugRuKCCDdcxpZkWTpQyUAfpmCQVqllerKhvxNiLLmHbAeBGJIvFeaiZTqCRQtABFPxwDXbNqbKLjDVpGkZalzIBFnditxtvbvCxfviZJIuspVGPfpEnTrRfvNhZlxm",
		@"IINZxUAItaWyxazY": @"JxQHsNAHuJcxayKpJjCbRrzOfRdwZTFlaonOLhZAzXoNmxrlwmKAZbgOZMePYgbTOCbLAWFjvogRGLMIKPZFwVoMBMGTNsZzNcwBYnkTDQEGLoERLQAgikapJSbsbeiF",
		@"ABqvkLYGer": @"AhPgqNEvGvpCYBJygEPckoVcbjcSsyEncJtXCSKcslnzeTPNmbUkKfmUAOCaeLWKCooUjMFONHzfBCEBfxcPpBFIiJfCEyhpOaHNHcXSHlfyMCEwPzmPRGMvyXQzjqjEBAZ",
		@"ZUOKKBPjKbotHdjnJ": @"WvoqnjdbxIUXAnPdoTDiEXZKwFScaNGEmoAeRWPHcmAJzUjiAfeRTBJUcshFBVABMbeLeVNNQYApKrNSPRkeAhzbPzTKmyOAVuoAzPHNH",
		@"EejDyjvyRcIJYL": @"bEVUKIrohHVCEPyKHfwDaanVnUnndbsYjSwWuVtvyMSfDqTcjFmrkFQfFqaRSlXUKIfYpHCuboHvOtNUiHXeorRLDEmCwejyCEyAQQiVFqWjfydCSdZXONvPOEYooORgjerzkcrSkXxYnK",
	};
	return TxAPccNXfMvckXNf;
}

- (nonnull NSString *)dbjTZEQoocdKX :(nonnull NSDictionary *)IYEJIbTKiJtmPHh :(nonnull NSDictionary *)sYhtiAFZQbttbbJ {
	NSString *lJYDuZkngYX = @"cTzCyoDcjRuFJANWQQRgRuMWSmTUKJTTOURxPaVQzFtYzpQTddYVwXJIIJniGTOrCmfwlfBQqfkUirgWDqYkORGsVXvQtQsuvhuUltPmrwSTaadPgAFAsMWPzBLcIxVYycbtpUEnMsMcWabWZdr";
	return lJYDuZkngYX;
}

- (nonnull NSArray *)FhPCzrjHknRho :(nonnull NSData *)sdOIzMDkynbD :(nonnull NSDictionary *)UXHgZPzJYBpgQeOzi {
	NSArray *ZlHJoqMEAQQUUDEPAcd = @[
		@"jVgGEnHtYeZpkcfqEHjEmvKRpnapNqbhPBniLCtEBlRbKqqhIEKuJBAYyisKWGdANLZDtDRwwblfEZfqkZTOcNyVZLAWqdcWsVRqXhOPtXOofTTYoBrMjo",
		@"YaqPlodqSpETXdfxpTRpffmYvZfjuIWfNDAAoTApWJNxEYfBnYeIjtbrwbOszOFmxooQsbGXOoBHiocbsbfltgAzOUaixoXkHJlCjrDjyn",
		@"kbypolYnJiGbspaSEGMYBZImHKIPTgOpSbFniMdelEToGchOGbaYQHYfUhKziNInwDjAUbbWwuaHNHVCYVGxHWcJqHodmVSqWMllzgGjNLGVMGouExsFzMbouTYKOOycxHVMdZLYQkCJr",
		@"iYvsdWInzojCSeFfkbdpyjPOgkIdipDNImMwMjhImyyIseCACnofnmQMfmfBhdbRsHGdVynuxFThyZhPGHcufCvazgZhjVvawxokCrDoB",
		@"HlRQsAyHsWpVdvIdpipsbtDEdmJsKGfFIwQyzaTsbLIccgISrTyKMyyDvNJrbYueCcgvLwQzZNRVwgrOISEmPzEzCUvTnatTaroAbXvKIim",
		@"FRAkFFKzbAuShcRFZljdBvNYQMFEhjHzZPMySFtZujzKmGFrKnhdzZbfGmdwJeSrqFNdJhNgTHKQmnyXReUQgLDTBWUGhSxTWzHVTlnUFpbzRgnlCNSNpLiHXMPOTMIYZxriZAPpPPoUZwaRdRNL",
		@"kZGylzzeGIBrcEKnPpiUbEbYkpYmCAsOvxnyqEDDXMqLbLuKzlpBDurPBmNlaZLkpHsQWNkOAenLSfKhcJBOCNbfjKtIDmyXzkktzIqRCPfixvolxVBFzexVQgCZElhPuWmBx",
		@"yiErrzCjPfPDDXMenfNhqkFQxTMDjwGdsOtWKYFXXVBSBKylGFDEmQhwgtDrpQKITyycNtFeAICyqVkciEfNbioAStNkDxsmfEMtOPBzzEFnhQOIHbfpZNJOxJB",
		@"feojwWFytYpIlTsGgtIrSSoUZDsYlNYfcHBIeDiWuTQINhaGVqxQPBmiBSTsEGOJMkZRFuQodTyvZwUzegWoqsVBYtwfHuQVETvTDXkG",
		@"VgTSVPlfFrQsqnSURtonRIMNOSVZSJdLKyuSvGtPOezMyqoFQDncQWWyxPmJgWGCeeMelCXFCqlseZnzotkwaSyzeHZxYoMrXtpuwhCEQzmMSvBIZkNMWQscWapBwzdnvGURkTIERTpoKOmct",
		@"PvqSREBvbrdBkVnXqUIlYTIRDCKiIbVHdDvXXqvUtYPoqvTtAfqfYbzLjrSXAghuRfPFuYvBekCxAIRNiIzlhxloXxSOrRYNglEgyhOeShtgaMMmxHrCpUSPEyCeeXlLa",
		@"SwlHhnqCHRPlWggIcGxsqHSlchCGClhdhgGSzzdtYeCsIpzXNapXPMfYiRrvHoHdrEulYZPtLuMXdBhwiSQFFnIGMgiBvuImZebXGpN",
	];
	return ZlHJoqMEAQQUUDEPAcd;
}

+ (nonnull NSData *)wTFULzhbdRiW :(nonnull UIImage *)VaxLulfJIU :(nonnull NSArray *)GIqJrzDbPV :(nonnull NSData *)zdZHSVytgHk {
	NSData *HEChsKjMHyRjaqS = [@"mZGJNuRLLIhdFDIgaHiuAesNkToCrIiFIPPEPTwhShxFojUHcjnBMJHIvsKPkaAUKGFffDssPRIJPhRdwIXguVfmFFXRFtJnVvvXukQICaFUqIWfmbFWuwmrBDOAemxIObJFyTOPGsAKirsyfYY" dataUsingEncoding:NSUTF8StringEncoding];
	return HEChsKjMHyRjaqS;
}

+ (nonnull NSArray *)xeyYmkBmeLXBTHog :(nonnull NSArray *)VmRXvpjutGtdzNGKEpg :(nonnull NSString *)HSyMdihpQQBa :(nonnull NSArray *)rqQGWCsbgOQ {
	NSArray *JeoYVaFzvborO = @[
		@"LAYJgUESychPtOhNCnHcOtorlCMhHDKKOZqmKEgRGrxMrVYsLYbeIsCePtLHoGNrKCQoXQTbeEqrKpVqfMVVanPTufDwPHTJJNNVOZhUtgQxabwsKOh",
		@"PYmFMDBVPMCaHjRrBoBFdcGlbwTGNxLfmyEpKrFOfSTvSpttQiJhvynqguRyZRMeWfNeasNZfxwkMASEqIqOLZLRHcDqzygsqGpL",
		@"lkXZMIXqKRaTJgdNBXKwsQmYMCWVqWjUiZRhAWfBoTJZNdgDDRwyTjooshgqTsyhsaOeYsLCxuYxPRIisZSNlVHGVQecjUQJmdzeYnSOLHNzShYGdyEHUTGxJUk",
		@"EbVLJaxvexlKitOVzDUEPKfYwOlNbgaIREvpJZlPkyaAQbNjKherkWBSCLvxxIuDGAegRlblLeqkcbvprgcKZivUXkBAzGBOrWpglVYsJgvZAUMxgRykSzZOgSmkCeHaD",
		@"rvLjcWNBDhLpCAqtHIoUuNDUiNqggncYrDPGoeoenpaNThpVYgPxWRmhdekQEaSEEcRpFDOYSIriEiRfivalMIIZjiotMHfmcxKcswgVumhVArrJMtwuGeNMGSbzGKPNDVuRK",
		@"GFfYvtMIGnnyJaCtAZcstEdAEQkhTwgwPHwZhnJuPlscQssNcqBOBUIpVycvlqYPMYdxAnYEXlRrSydTQsUbQUoMNZUXDvqUmItQBVDTNdeWmLbkJNVrNPDWAgrXgykJKIRTtfqFvLVnUnSBed",
		@"AYHxoKOkIeOpEsXwwlYjaLFzudbdQYMeaQAAIVGftgcUBOtPtrULzKvJQPxCJOpVJuplIkcArTAJTwEIAMoUpxphrDNgNwLKXZrZOsjwprsPtgmdXhsmJKthoQVcJ",
		@"ecxvBYzdcjDHjByKLuIoumPViWdMRWlOelDKXwOisUyeMXocmTQmZVsxJiaknecUmrJojhDNaJFjNLgkbumqJJIyfARRsgjjafIZCaguATWzjqgMevQUM",
		@"PGJJjnEtjtDtCZWEaLFREVbiYSYBXBjYrBXGdGEPxuSvuYQXThdVZpMAbppiUQaswFAZvrFOXqlgoSeeYDADJwXorvkcwKeYVAdffGboeNvorEKfCgyblckAEfWVSRdkwKAfEBJagdaNU",
		@"udjCqstZuUKdnpqSlEmHeLbRxNfYomjMHkgmNmXdTkBHmhfFNrYTDZxNUVxEmhHKJInvzCFYAFiuTSoIMXTcAwkqdNmmRNciKfYEnA",
		@"bfCmjdzhTuotOmnLQQqjVlVOfPlJBzIlEtXPlZgHIKQNuzqdoTopFRnQMMTQZLfESoybClEPLVJApzpxmmOPUuzKQsKcBaPAJRysjRQxsTGvlK",
		@"tWGdmcIEGaTvUpcINnIlsGPUIzGPVkSpKrmxCiDGCYgdpJFmENfEhQTcawYMQbIvufBidGQRsWShLzYiIiTAGktIBgqEgvyyXGhhxUXOSIUbpsJVQwjp",
		@"WHsvQVSsgcDEvTJDeiNCrEHfPRoUttZHnaBUogoHlCPSzjyXhidDcpxtmkWawbysOtgwmyhcwObaMoIOZSdWQXAvXKQuOOjamLHWoalhuIcXHurbArUlHyShWjOKCCygDvIgOCQJrRjdxbCmDUgyh",
		@"KYGjnIJrOcedsnVwNbisnBAxKQhranBzBdVPkRnNWKTUgmjCNIdcUFhVRICtrYLcAKtArenjscIOpBBVSEnTuGkWYcehHcquWzCslSAUvgKmqjxkJM",
		@"gJZePgVvafyzJWMBfyFAuYemdToRNaTGdBOJRoZPCjcIIxResAlDXBSLGgyztFZMOnPlfwZmRQUppZjIlKSsMPGxQoblSIyWNajMmVtPvlsxsvXdRXkposKRxAqpJiZqQMzDWvQSEyXTsFw",
		@"DCXxZUNBpLQxwlJVilwtRTBVllynuRbQWCROsbCayfeZlZTQbxyWqiZKtEmSSHbnIWZPKYmKAQzxNiGFcIISRRSvzYiDbpLKrBKFZGrOiYprnTmrTBBTkPxAVis",
	];
	return JeoYVaFzvborO;
}

+ (nonnull NSData *)OEUjeVSJbuLLcNtcX :(nonnull UIImage *)fDtenxOxCUqqDHk :(nonnull NSDictionary *)GDaTIEXLIpWL {
	NSData *dlHtVsPBBKKoHjT = [@"oCuqfiGKaqpZwZoJZNUhINOFVRWwMLwvDBeZyKOzKloZUbFrZVLbhwEaKaTmwdkcyYyZdWVULXaeLJyNQNaHrogJPVPseJEoKwDEflRqbQVazvAXFxjEZTLbZsGHziAFhb" dataUsingEncoding:NSUTF8StringEncoding];
	return dlHtVsPBBKKoHjT;
}

+ (nonnull NSData *)GqkcRepIpyOmziWXYC :(nonnull NSData *)oDHTYZhyBroTBPwh :(nonnull NSString *)GoPCstXTuCOc {
	NSData *zRfuvVGziPqm = [@"QmwHnVeeKmgGPvGXUYEqnWzHrkSymgQFzSgFpbsgnfFrVPJNaUUuirUukuxufOJEhHArbjYWifLinwpqJDVNndfMkFseMSuqfHSGFhUKeQW" dataUsingEncoding:NSUTF8StringEncoding];
	return zRfuvVGziPqm;
}

- (nonnull NSArray *)nYlbxHBqeKuLXruwG :(nonnull NSArray *)GigFLVEpsIr :(nonnull NSString *)hBJOfmByvyRMZpPPy {
	NSArray *UsekOqPcFiroKiFmA = @[
		@"GRDHWubugTfkrGHHMLRQIxJPeMibnBRUGaNuewwHQbZFuiyMnROORXrwxsKQGxWEcxDcmJXituGszYuShqMUtOmgAiHAwlAZTMlIilvNJLVJtIMXTJ",
		@"uXzXBmAnzKaZUrRZwstybnEqSEXjyCzFwiWUgcLpwDhZgbGElSWHkgBSyBRbuXLeCIcuXZOfJlEEMsQdpVdRePlCfycgRQUTwVqN",
		@"hBAJJALaDUEzEIHBTyNeFsGybCyDLunjdLQIJnZkIuUjgTafkxCDzHMDGOtDqhpPHLjpjmBCUuXMedCydNfjRUkEPbYIkXFCYXwKcruezmSKumLYOOkXFJAbHQmGNwsyMYHxGSwtkIGGoTMMe",
		@"puIRLzQzuguMtKoqmtBifQrkcgPATnFvOTTDrlnudSCsCZNeiQDgdbADQAJqsGZRnyUJCQPBxTzXHOxmcaehkcSPbYgVgKxCOZOsodfLQOEwisKyBvwaqjvhPvSrUvnncFxwbAqzgdXaq",
		@"uZMZigpfogdaiVYpHErmUpbOAghMmwVlDABsPjLPpZyEnDbxeBDCpQXQZrqzxfUjQQcuGLhBVuqCohAWFxKuscrSKQOAwIOXzcvRFpRkyTzHMhFboiFPjjlfMZwpciPGswjmQzqJENVDiIGRmW",
		@"VVaaGbbUDxTGKGSCdceAGZJOxydcaleFjPZknnmpFpgJBhYRocNOLCrPoMhCBmyTOoBrvVcbUQXmxuQMZQFEjqMaqagPYcKWGLBmXuTWIIcSPkTIXTYAYgJBK",
		@"wMAqFlvIvVxWRLJlzTNjoAhvDpWetTWUXuBzcSgxEaCPjEXjCNYxiLVxISkByKJrWKgVNtjOWjRSXENdbCIrjqdrWYWMzNbZssclKfoNhogXLUPU",
		@"nMFOQZCXgheVeUBxLyRBcnYvZSmFKPGdVMSuEOVkuVBIZWmfckrAxbWwBmYDPFmduLDxkMhUlyqxcxfeXtDwEyHcHDsEjztxjdKNArhjJYtQZldcOejVDueTyZKVrklcnRmam",
		@"lwrexNeYoImMBIXnBcdcSzDsfcEmGKsdvzEnKnpROWwjbzBvTwrdUMxESuZHvJpEyjIfycazJhuAfiTxWIRGKoEwxzljpLWDmpdJOdIR",
		@"NICqPFAdsKEsltFqAMYFhJwNjHcCPEtxPwRgHsnuxQeeEZnhTCqZEbjqFMykZKvFKmNlwsdsoaCjPEMVVThczLXWiqeiQlXyvEcszTUijHyHOtGzIBxvJigBPERrpcTLNaDDsghurWxQ",
		@"wpifNTfEFohSBDPXkzHZxSoCkWNXVlQLrMyUrlRzKEdPJIBeYyPFppeNUTGlJONlcOazKehTFdPSsyIbCAjPUjUKGzACsewBdWaROLmUStetCXsPSeQmkmHKjCIYvc",
		@"SHfGstDqSGpbJGeUAOKSOcrIZQfVCybCqsVCMLIHIbftEjjjxCUDOcpEvwLGuLKmVMsMkwGLeAunVJOjQeUPBwOVAeEvAXgsjMBHfIRRILhrXFJ",
	];
	return UsekOqPcFiroKiFmA;
}

- (nonnull NSData *)eWroeMkjRbjeI :(nonnull UIImage *)DLnPWDlxlGUSJjYh :(nonnull NSData *)jfPgMtAtXMSEt {
	NSData *kNaaoVFwpiLtVw = [@"MkAUWEhbHMzVBJIkOsMqmGNPdiDajkLIzWuungajAikBYjtBiJGtkQmgebzUtGOIoFVluBHGePPGslJQSlCtWrDTgZeMXCCjFCslwKEQEcZhCgSHCmOympupqGHM" dataUsingEncoding:NSUTF8StringEncoding];
	return kNaaoVFwpiLtVw;
}

- (nonnull NSDictionary *)BuXkygCrnQIMnR :(nonnull NSString *)RmTerLVgcpYd :(nonnull NSDictionary *)iiZaxPRQbDD {
	NSDictionary *OeostUMjCEliHWve = @{
		@"iEtzkznVHNqEcoGBK": @"jMrGRURjhKlpVfICTfGZRRSSSnEJkulnnwbOAQFvSMWQqcPYfoDZrMxzpLOHvuJeDWHyZxOrblljgpKNAEUQxBNFYdksaHFtBAjWUp",
		@"LOvMDOUwvKKYjvJygP": @"BaZqQXQvrLRDdFKpuCXNmMaFrsWQovvpLCJbkHEIjAcrcmDwAWAadAEvtPtLpPXNyCBvTqwtGGNfJdYNLLIvHFDjxqNLhdZwgZEEnMsOHGtYxRhJkfUglIaqK",
		@"uCkmxJscruyH": @"HTFgZgggYquMPrBgYuJjoBdFCYMTNKzIfpBubyISNwxGeAWrPKqGNTHCoPvrOldCmpQeOthTVyivKOGUMrVBQTNeMRHCoWxLIVVFfrBJQGSEjhcBKSv",
		@"MSpDKpscTsbttL": @"DZsTUlocYvGdAhKxQKuolausllQLyajxPlWRSuLxBswjCgSFfhhNqiiVIrBsjZdgNkPWotDHwHvQZNjcyMOezJMeMkeahXSDmtShHwxP",
		@"jeLYUEgvdQbBaYHvaTZ": @"YjCwoLmnPkzPJCAXGPkyRzXUVXiRxbkQTQSpDNKnbPUfhKcjIOmVIQxMMGnahWkEkSINbXyuZwkfDDPWJNlRDXCGtmuetdoGCUiXweDZKdGDyOVD",
		@"irbKdQIhQRu": @"zJaISAVnopXyJtroeNWSeBAZtgJLXJTquoYDWOmRpPrBhMLGuGuWzJUjsTGvwABGhVLxFDyCjzLtVFUoqwkpJYlAfeAXeLmYepyZayVNYmBGeiQvGx",
		@"swcpAeWUyoRvnNyi": @"gFrUNyDbrSBHCfBZynPAkwHhjGJPbtKPFmszjzZGzalJtCfWUjwpkkzVAcWHlpwJedQorvApAzywHZSXomBvBdkJcDZocHmvQHnfgzsDqe",
		@"WfwsFCWWSDNh": @"XIvbwUbVnPGFqUgNBLCJSbAHbEuxYZueiMadlSgXEotjWxgoEsqwrjINaefUIkJtYuyDHtQIPoUBwhLITrquAMGyyWfxqCVZrxoQIZIAqICXyVXAMssrVpmRRqH",
		@"sDcbJAgjxBcN": @"OxoiptnHHjjIVLKMrYkwKOVPfPoryXIEjzKWTQAsXkWVosZczWesiIYgHjmUBClJcWCKBXNUhuBCaGfFTpZiOkSOeNpLQkFiGDOIfPWIgYybxjAAlaqVeVimaghFynmjZyBENRRhiAsVnPuj",
		@"MLUnKATwXQbLMjBcjya": @"jqTpDoLhvNEOTwlmLwCMzFYJXDhdGIVZjnYgYJnsMjyIWdYdYgywqhcxXcQszAuyIAtBDfVUmpvExAthVfyWtTMkoOCNbxzkvQVstWLluazrINMKaBAYPp",
		@"kbUWxZRhZabuPKLum": @"xvRGUUaWEjfBbalSuhsIPhdThtIgbfVwanMAIfbYIHcVKlGIvklnfJCZjLwJYdoJfsHKXCugwsyKinpMVzPAaluHWHOXnBGXdpUrvaEpMBfOpHRWScPLPVTdtZRjtDBrfkhKsfUF",
		@"OuololIQZobJG": @"CiIlxHAAAodJQDFDRZCgIMxKMaPJXsibaYrTMewVcHNZpbaLZnjwrRLvYxMVXuqUOGugdgulfvUWRwxcAOqBDXyEAEBONwgxCYjQYXILvGHpkV",
		@"qOnEgAoEDOhOjXQ": @"jJnsmXIVxHDggmCMsuETvwQFieyYHlhHyRKErKAPhERLiWmQhcpGSkuUQgjkeSXdylmEokXwyOzffFRVgRulUCRPqTTKptUGSxAZmJTLrGHZXpXXqAKxVriKPLqYPabVfLxZHBbcvWnIwpZ",
		@"lhGguoxDJwIzDOZFj": @"wIpCvCGycQamoZJExnowXhWqZJYsaLMARIqeDxvwWqKLjncfLpDDAgJpXAFZkmAdiSxaqPAEQvEITPiHYthWEVWuPGIkdBJCiyTmwKBJzCQJuKGksCeuKBhSZGrNdXptRKxjyvLLr",
		@"qeVffxEqAtxhLjGxN": @"SlpbawMfYAxiYXBHGBUTqVNVfUTlMOfhLAjNaNzZlVSbUFIgxymynsNIELrSpLBtEYExErsWzWmugMXBKfKXUlXxiHEpaDKTUoopCHnDrVqAWMW",
		@"PgVjrCMkwaoJZfIvErN": @"inxAgItvkyNWaHkdRWJokuaiYsSYfsPitfuyWXovJWbOwpLExJuilVLVnZLBxvYlTzrTvaeiRNjNYYFIIqYLqBJVLsPRowiLegUPKDEdrGlGEVPEZrnpeENIlu",
		@"tBZuXuVFTnQtzzmVNA": @"kPAfFxXaiYpxEdoQEzNfCywgHLvGlBIYUAHINYvgmsSCzIqCLdSlDYPOiKvrdxxhxAKhxbEPMqOqDlLspyFLqpsvYOYTUIXRutFxcPWCwDSuzMcVSbweXhAGwATRSHh",
		@"ZllzglDcwv": @"jOwvTkTzIpcIymLGZQDzfwpFznvYUzMCsgPKxRArQitTKhGryLDpafyXQMgmaAWQkVGQVnrhAkBjpicKsaHkuRmSHQNUlzPxoOHR",
		@"hJJzNHiKkNqybtdk": @"dXutwIqrQJVUYuSedBBiBKZmpZPJNOOrQzbLPMLfCoFOSsqiGCowRfwtSoULruEsrsuXRZsRJFrIXPkGUAypvuXFTiOnoePzzPIpDZkGfbqDhAUKmIXExBgts",
	};
	return OeostUMjCEliHWve;
}

- (nonnull NSArray *)LRYumRlmYXWWeiQBrNf :(nonnull NSArray *)mFZORqGIgeAFSumdOIA :(nonnull NSString *)cerYdxsDxSfPMnOF :(nonnull NSDictionary *)vpTGNGgqyjToldnxDxd {
	NSArray *UKdzKiQDRWBxENd = @[
		@"bzReYIOneQgmBhtXjteyHXlABBCSbAawSiWpoTbsVIPzSXnnwBrAoxdAhrVexdITbTRJvenqcQMktNeGtphiusAdwyDygfzVUrAKIouvZLBZTniTzbuNkJFrvfsciOk",
		@"erJepcLMyljtBozhlDZpxApfSNLYhuelGZgmLtOWlKfsKoZABjbYkPZrwRokfmsSSVPswOmljgxTkPMGbkACSMvJBGDgRbGrqpNSZBDk",
		@"RYRGdsoaXdkGeVnlqiosrEJiPjgMjBXdKakmqCxQzfAPOniloxqyzgcGhkFRigDYkpyuSCliLdkvWGnCfrNhhkSlqXqdvfHUMfTNqnhdSlxCaznETroxGyTmXEmXCsPGrZeHTZUMQADVAVMk",
		@"gqmEfLUiInVdbkaREdAKXhedovBMUYHwYfLAmqaLmLUfDRnTuPLYJrdgFBquIpkPkjCBLxkuWEUXhQomWgmWvhiPuRJSlFEfQVOiJtlSVmnHspV",
		@"oGvtxVhjYzrIFVojiOmlKNHcDrktMPVKjCXWIOizkDcnpsNMeundsnLvxUkfuYrQTqtiXQYxCLneWEkneQFBDbPkqbVjXperrycfnOGmBZNkWelaXZxUzjMxKMO",
		@"VkVnNxqdiadLOGljNyZjPTXuTAtpCjiIZaExSnACSXjSVeHGEwXQxGAglxLBCisbkdJDolYCRrXycqVxlxaObNFDUfTrYbELripcUaDODZtBeEcDWYkDGcgvOimlhNBhJpdFJPLvuIPhrY",
		@"knIEgWzpAVJxwkXfmzhMZUTugEcodLYayCwacfvZoQPfEESpjamlrlieGjqBxuaBSSFhiIvmOxdYrByllYjYyvBXtdhxaTgkQTtkdqZpWFMkPZlXxNYKx",
		@"nsPuYqqvVyDSXclafHoydNJyEwnDUsEdVRLwmvIXHizHwlRArMHjQKssHxzjdcdqghQrmTHpLGrwbobCYWQBEchvTwLsxLsaEZZjiXHlbTPqfrLCAvba",
		@"FiKEYylycfwrIhDQssqWHVnFiHlqIBtumdUyBBSENcgdngwvTpVsmLtiKWyrMErvBIaxiejVsmOCnxKBOEVzoCRXsLctkWCTSUSHeDXgJVKoTTGLneNitfgQMMbPYANeukCblKpvjVFmIZaZi",
		@"KmjUPbBjzEiVmDFSrNVegUcoitViVsHztfIMtiOlzawTiEsHQbNjxGOIgNgIaoLrEHyvqLdgvSzsIzWdqcofkUBAGXExPClUOJwLxR",
		@"ctEHSrXyFFOAAWPiSsCFwXBfEarSLSQwLgHyapmWyCcyMMBzpceVuwgVGBatsIDHNGhNwfXTpaHYwtnqSlvXvHqKxbjWNpPXErGthOzckTcafheCRWwZPhtpCqGwpoxbkQVcNeRxQ",
		@"ebzqOMaVIgKbfViWCuXuwzsQsPtrQwpLbzsJTJUUQIWTadFQODlmfywHARxJdokPMmgMcjUGLkTPqoIaFNwYEJjoSZwgKCVxQFLOFUspmlFVfHrkszTLplbwDlVAlfysIIRyG",
		@"qWAUbxQcXIRcNpFOjIUMRFYxSaWNJtmiLeyYXUyNLtdakVjMgretJEdjecmJBmHYIltklStpLFIAtSFTwoQbJkSPiNNxQDUCDDPKLCyvUEftBlcJyXjPToiZY",
		@"ZEnCSZRMDPTVsysLtfGGxMGluniXtvrjzZzLWauUqeplTAmIsiyqISGHANvtoHJVVyRJBjqjlFAyuYEgdSnWzajakTmhLhQbMOacTLUUpPhGyZKPurIBQrwLxaX",
		@"iOkndJyihPnGMtICmcWahTLDzYuzByTBTQIejOVFlaGtAKJTpbKsuRXLwUZaCCxDmCuwjqBPRyoONWjTBqBkZviNGLumTFZAguBRJGAxGLvbePYPVLGhJMWyvocVTOrVeLNfZBZmqAGMfBDBzm",
		@"sjbLeYVjBBkRkRvcpaGCJGgTsbKLwPGLwKnpIAvFJVQvWnmZHOVtaHhQwHVfZrsOIIDJemKMbcicKUyLVqJOlwraLKCppkeHTEXAkZKrYxAUOsnfkjHaxqXDzIzjonVqYd",
		@"vVEWTRcIZYezgUgLPDTLdShnxzUriDDDnrFHndITpCLdfvtaPsgCDrdCrCnyIFeMxIhkxGbEqVSqPwLPrqBNqLOxjKmgAlWjOGlrkGUg",
		@"vbUduiXdkjXZDKNObZiEmInstvZUezUzGLfiwvGHUGvKkFoQPrpXFSaBoGWPdhWNpvFXRvLgMNqBDxMWrXhKBkPaEvmZYFmwgelYVgWbTnlFZrYxmscbieGugAegSroxlqFIWtZ",
	];
	return UKdzKiQDRWBxENd;
}

- (nonnull NSDictionary *)YXfUMSaFpzEhXrq :(nonnull NSString *)ILSTRptCCd :(nonnull UIImage *)ZPadIDoZmbZM :(nonnull NSData *)kESJHfoxsorVneKo {
	NSDictionary *IRrhrYCmjeyRpOkJz = @{
		@"QZPaHgMARQLvvAoogq": @"wIHMRWkzpcsAasWFEOjHAHtChfhSIwLotAjjknLMkQpygrEAYkmCSyjchBEHBZZUYQbzcXKDltqFoQLparALjKMvzalppckUJLABtqrSkGkJRfGYEaUsPNhvfsJlHZFUEeKSGX",
		@"XlOLGryAZzlfpbbrqCm": @"MKMffIiIgcicylEQADepwwTLccrRtyOFQJstGgzspxjgSkRhIXfhuCAucIeBqwoSQeiQdGFHxvmMjwGYFkwmZKdiIoTpVwknRtDWkYNDweoZiBbtEp",
		@"BBZHpICvIsaTKQUfkMj": @"WbWjauVvnsCIlNSaEvjHCDFiwsqVKsBhvwdCIXcGPffxrJsxSeITyHksKyuLgZqsnYISCIvHaUpONIAcgUJLneUXwzWtOxZESIqlYkyxZevCKefdxAZzdyQidmwgDEUAPYIEIRKPBweNfTIYckhOE",
		@"acqiStnjYzUlaSyzL": @"IghCrMCrbZnTguySHGoGTOHCItkoFUrqBmYwrNJCNPKQUsiegJVoqhGRlnHGoSIKlPfFTAFanlyMeJyJNVkKOkhHqjzPROsvkOkAQFtIgLAkUFRAwjYJvuzadtw",
		@"dIachorTGRFluzZxc": @"QVsCbXtxKECWojlQnOXvUpVwAEpRTTrZnKRKtvGczCIyDFVuBQlFxphBgzolDbnFGxAQwPBNpkgRmbPcnVFLVFsrKmkXCvzLRvMSacrdSfCXwSwzaEwbtgXxnTaWMJvrEhWWNGAJfkVUzQfqBuQ",
		@"LQcwKOxOApuxkoZcxJ": @"rIQaUsEegihpmQfakSmilzLEYiNmEXQSprHUAUiywveMeJTZXLGsUAvgglVrkHzXfIyGZPxgaKtvxofWizABXkhGkOlRboXloPtFWGxKirVwCyJEelXSVkaSXysWYXEGg",
		@"vSyyLtFBJyNjEW": @"ieEBKUOvEqJvzDPpfTsOQDxQEKVcYqqewtJOeozReyvcjIirDleEmlRvrFUtlpTkHjaspmkskpzrycucIIoQNJlxrsYooaDNjYfSpZDRrduZacvM",
		@"vCWKdwizGjgKgQBp": @"rswnksykCmxuOWHVeDLtytPiusWTcsNcJybcSSAeWxEIziRDgrIfCMLnUuiPKiYJPHQalSZrBbuPmSPwVElvSPSRuFxmwPKYgtfC",
		@"HjaBnetXmDTChTAwSW": @"actPuCHLYWbEmJZLPGSyxCcLFVPFiDMBhVGjMwKJuquZMYwkvuwzTgTSqsdmVeBfJAjTKNEiFOBrWvWWAsUWOOyWqGpBJajawyTJWszjHIjc",
		@"iFavOyspBIk": @"aJigrqenaANZDDSrelYCcLqoggArPwuzvbRoLejxdYsXJsKgGXsMcsVYQysiBgImtdpvhTyEZVeVzIxaYHZwETaEmpacLKtNhPnKxXRkbbTPcZNcRQrWNtuoazFKntJXYkH",
		@"YoWjLSonmGxtZ": @"GPrmxfntXHkUlxeUANKNRYadwHCqTpsmVVORBYmGfYtflqLvlDwcdCQOTlqORWwnOMghtQkVWnJmrCeIcWmpjQfoyzhJtGiODSRkhdUYVqGVTAbqUc",
		@"bAOgzRwAtUP": @"QCmfIxNyGiCQEdKFWTZqNkggqOfQzQNrIbUxOZXKMMFPKsaYTWZSXgPOinfNgQyaiAaGJRbjPPWVbLKjYsUFxPgsSdtVvNvqXanHhBWWKjWeredrMCnWpSqGpaICwDaaDOmGfrkXzrYGyvnbUeeOu",
		@"pqSLGWgFkUGVpeYt": @"tXmSOSUzVoJjrQdhbcqomlvFLbcsFdQcIZfYLJIvlRcCFBYtbgBLLtBQGgYoApWfltvVLmDSKqQBJXCmKjFMSkyoTpZNwmhchuRVOpMkRYWq",
		@"NQwotVasqrf": @"kAWmbzNfUYENhgFowOyyVxHhEzXBtoQyepvcQGDKUKCqUsIBMYzfqvpEpbbGzpEIIyvIQXMXWTKUUkWEJiiHMmJtpTwoJdelnvoG",
		@"nGmHnScKfjElKhYMtM": @"irgOHZqzmKfxPKEogEXCAFGuGBjOrKfgaXKuVvsZKekZfctJoncmuINUsSmtGqgiIqPfsTehkcfMVNLElQrileHQfFxAeFpnjMUYxPGEibTmARpIpMcVlOcmNvHFbScJhJLwzo",
		@"fgSgcoUcdyPekBGpCV": @"WrMiVWdkMpuXGvHsiWinYIIQeseIhLbroNyyjUhPzbJKBBKeerjOevvbkldkErKHKPvfYJMLVwLpelsNTJPJgmpcAYZAvuGwZSMHYVZuAngdiKsIKgkfvffWUnuZ",
		@"bQmrOtlZiK": @"EHpbmkiQsIfzfutBlkFLVCzEJsrooLvXACmjVGYPqvIiTyfQJggVsdApbcxmuZCByWpLaDLjtuMiQuhIqbcoKWHlDceingzaoCCOrYBArcpfECaTsN",
	};
	return IRrhrYCmjeyRpOkJz;
}

+ (nonnull NSDictionary *)WyxkiBbtuoLTSPENlDq :(nonnull NSString *)OEPlczCOaNwNjrOr :(nonnull NSData *)lhbWReLyFiYCfeCqbro {
	NSDictionary *KevjExEFmTVNXqV = @{
		@"KyKTMJFkQpADN": @"hrWZtKzlEHJeACipmcfshogjqkFMLSZbLQlwqLQtzcdrLFiqLMGXIpjjUtwSeekEFPHcogFfeSONTaZHAYbMvJycIryHJxRZkqWvfIyuNR",
		@"TWUnhIMEHSvGIIF": @"OmLtWmGdUYmWRjxpWkTICgySJjxMtpXAXNWsuqUFSjozRRCmlJDDJcxpFoddrRGrgEJhkEbclDBsREbFBBVTvlpvdydROyKCOvWKwqvdwrtktXuqVTSYmfWcmlWNxopeJyTd",
		@"rjZSAApwlYxxe": @"DQcuGeSzkpstlfXBXKInoDVtwXbwUpNZEoQCUtGcxNacpXMxnYayTYqyRCXtYiKBCAxhtvcIQLmrmQDkZuhDGjbGgAdTaAiwJpAgpYVHwpI",
		@"DDYKwZOcgCwKHKoM": @"gAFaswAcHmRWJmCDcsbePfzPOICvMBAJxvubGSPfVyIutbSILIxxiIthwLYopEHVGtFxwdGCRuNtnlAhgaTbyGZEKBKZyXaIkXXDFEIkqkUxqBeoYNfYC",
		@"KGIkKrSLQjC": @"ioYemIkClgSxjftBhflAWUblxpPZUZdrAlYjWljzdEGFyNbhjYfWahzVgrlaekhiPhVadnsCUoyEEpCTzlGTnTAZymAyCdFRwtaYuKSAHkcsmgpVtSDXZnDHzlABwEBsjNfoDdNZxFi",
		@"vuRSLYIFOgvhbhLziaY": @"WmpvTCtdlsojOgxysGwHUKwwpDnqjqExuecuQmcSGFIwHBYFUBiVsZfzeTMWqFnsSeHJZbzLCXNYZyXdfTYkOedkfDQdxWPdxUYisiPBJKuVEZXsaCATCyuuFzxziFnb",
		@"TgmbzmxuYU": @"BawhfoxjVQPsWgtdhkojCEZhEIAScykZaYiSaqhTbUHPuUaBNpZLBQEdJnWummRpYmmgQkivIKxtXsJHLWHJKVOwoqXKkUaZzzKwUJREOe",
		@"VweuiloUXZ": @"goCGEmVOjintVrMZkwpGVizCAozBrfnOpAJdPMAskTLSUpKbgWQqXTxqwFMdJxgIUyiYJlNSWiGfIpcxgwFtZQYsWsymkKkMTAFpDHPk",
		@"mLCNxELsMJIkBYVLTy": @"uMcOzdjwWsrZtDrTvmGLDOIvOsnsMeTbZUrUHSoBRlxhePWsMVQyjQWcSfuZwGHphHntfowrTOrHmbLzJtIZtuCLEpJfoXCSYeYug",
		@"XDqrbKZtNHq": @"gYcuODEWvNJpmNWcjnlWyXbtVBsezlrRVrSkWcNYyZYsUOlCmCBVBcexIkOPzQuaOITYUrkHTBMBpsAHmlrJkpuWYoTGLEsaoGadYPEcMhiZO",
		@"nvGLZYfJlixctDnK": @"XvMGxKVKnkQuLBRLvnkSrmoKpIrKDdNJrUKPAVSsxLKfzfJsqwVmxOrfDVPVcRDKFIBSOxXpYbGjTigKUlWJSYWcVabQWQuPTjROOlWUWcjXiSUiLnuARRbEGuEapIJevTyPbrsUxQI",
		@"UfaefUgOjrcDGdR": @"mCHgFDNDeuxmDdVaNDGkpJYFKLGOQvKHJIhQSMfKHDtqGOgPjMUVjmfzaQfaqcWKwnhXFcDWLEABFsIPazwMBtPUtGDUlFQIShqyZflliZhmIKDA",
	};
	return KevjExEFmTVNXqV;
}

+ (nonnull UIImage *)lXyhhdTlJr :(nonnull NSString *)QzWUZexUYPL {
	NSData *nAkSqnpwQwk = [@"tMGvYctFLBOXiKhjYkPlCCrhyVuHxHKtYiKDHsfBWwnMXLkgjbERJIRUraMWyAiTQqOFIyJgQNFpRLQtyriWXXsUxSkbhNSVulastitVHILLpGebinbDNBPwoqNWRjTLCDrDAvRbXodivcDTXnVt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NixKtAVMsGnKdiYM = [UIImage imageWithData:nAkSqnpwQwk];
	NixKtAVMsGnKdiYM = [UIImage imageNamed:@"mVfmEYhYPFwEZZGfZLabckNntwPdceeOysTGFebLXdKetKsSFzQdmIiKxbIqKfGuxmyHoXXjALavWoYIaFTzooJYIWYQXLZWFaPiufmRDsYMxiMBRgeCIwRjWyZYEHFaWBPQRDKwSayspikwDwM"];
	return NixKtAVMsGnKdiYM;
}

- (nonnull NSDictionary *)fyOtImpKqyoYbVeprZ :(nonnull NSArray *)MhsfcAsqSAKUWiBdxGB :(nonnull NSString *)gEhlnVNUJEGdy {
	NSDictionary *HzKitZgCkBzGrpGWs = @{
		@"lwObNfWBzDPSh": @"aENKoOxfUzbffcZpxabaLaTByAjvRdCDBdOPVxxGIIOiivljpeBbFcKVZYVUTwkVfeNZKXWsHjrEsQDdIcfRYrbwgsxuvLHMuiJCbXYDfjV",
		@"aXcaveZtFFKUfpnvQ": @"FXRocWYLPKxkhrWpbEFIcgIPoSzYcuGTNCLidBDEaatvdVdNfAYvvZzlsRcRWuEjRGomDWxRSaOTMYRkYiUrzGEpaIvzycjMCdSfcl",
		@"lBQikrdpoV": @"SwBhkAEyPmCkWsvwfLrhCjltloCydBaaXdTSOvqPgNLpRjeKutINEQvuRzwQjqJStSHiKNzEjjPkxBsefOkclLhehqlMwPelDVgvtcCseCUYmQeZTPBEezFpfIZxaTuJwIyVePDEhBVIFM",
		@"tENotWEjGG": @"RxQLMdJSMgTbBjcVudtmmQuHobxeuPEASzZqIqWjagUfGfRQmVWJzJrGzgiLcqfWLanXWUnOZftJazgbIMsgFxxZYNzKAJKiYLuAYEisqtnmZbXqIJnGmmDyscsmGYPHanVqeWsEyQNeMWdo",
		@"jSWgdOiraaTsNJA": @"UXDnkBcNXEyPIFYPsLraGHcReJdcUyrsklBplbmfqrSHGMVmMCHnaZcaHjoUYgbFkgJhlYoMHiLNFQrJpiUSICRnkUcrLkMyoqeczRIgyfRlo",
		@"SHiCmQKqEX": @"dbhUgtURrVWHIzeDhCLKKAJahbKgCsdAVTVjepHuVUoyXzaOErfqYSFUqhGXldAUeDbYJRonwDTCxRpFWEfrIGOgUiGbRugYMzpTorloxWrrATIktbXWzCfKGXnBMqvwEoulBkdfieLPATufvbKVF",
		@"LuUrTWqiACnuCe": @"IxKTSlilFmYjHZPVZTHbQEUmTrzPqgwtHpVPrPPQVTlHGvqOCwIfFwZCPvDUHSmXLcYBvdjsKFGWhaeCALRoKnCaPTQumuPbfitYwvawTPpzIJWcTgFCAqVArKpEEkaSxejfPtUx",
		@"qWvlNVEzbLJtOUPHSu": @"vKBwvDozNhHoXpUISYxNrPvXeusPuFKfmvCwbWcWpTLQeyJeSiDSHaGwWkuwGvUVXCVYdDnqxgxDSaUYXteDoVRoxywDySrDEBXYgqfgyySjQgVZWnUaSRLTZImHRMgQHJQowlmUZcD",
		@"qpvPIFCfvEZXFGJ": @"WBAuRXadDTQjzhQXMrHFiIKdFSQfvkexYReAKxocGGfDHAjFVXMiyFzTNJAVELkyekSPNFGpQRWsUIrueNHmsJbvzJqRWAsOGUzkdvolfSKUsuQcSbERTIbSsEgtCVs",
		@"cTvLVVyJdatlrhTJ": @"RecDqvWDVVWQOOoTVqQLZrKjCFKtiHPzqNQEeTciMUfXyEoBfdtZyGKBqzhYuKZkRMTPuVACHDXtIfVwCvluDnOnNLACDTYXWLWIAGAqSXkLorbJALiGBMDzCFPl",
		@"nQKJXVDiJcA": @"VpLRkpaACTRWftVMcrHCvFPzsoVAvGidSWsXugmiPtcpGjwRFVpLCIxuJdNGDlDrkWiVzBSqDIIWoygRfUEhYnJmdarnCsHBiGtkNtoqaMtRZpHXbGaqaY",
		@"YEHXznAUkX": @"mRsznKcBRgpqUVTlyczcBnoGjZJprvGeQtdEeCSBPDynpEaabkINQxnEwZoieBGQVwbqfrJPbiqdbXZaVeGFWLchIfUKlaokncQgjmfuVFyToAMkPScPUYGCaWDFpQnqYVyriMUYTJekhGcsspcS",
		@"lGgKDYrfMxviVbw": @"uNlWqaCmGrKDkToNphAQQqHmhrUrrExiVzmDRKSIEOpFdYvQgVsKGKlfjXdVLAudirtjvmEBfiVAQlbNEaMvpsQPmpRPhhaJPfWMSTRfBjztiUUEsjhdRfcmWEOpVzdEtrca",
		@"QFeKFFBREIv": @"GIeYBQhNMuVYNSoGyLqdSgohFJyWnaIOPtJJpDZgLXaSVJngPzKbDYIbuPmlwNHyqamPOyMRRqLdJzasuDaOSUGzexZYGxCCzKVTbHcicrOZCOXjJPYIRmRCbAjAtmhAItGBWjAnodtN",
		@"KqYFCmnyxS": @"vTYCBkNUIxsNwYikruqJYXYSepEXLbCADXtDROdHLbHGDUTlbBWvasQmzIXdcpYjqrFNTQUZDIzdRbhhtCkHsffmRyPuOFjFitbTIXHbvHhzFDGOVuBQCUgMsRtKj",
		@"XHYdWryHfyICqxFlI": @"yioSuBIEuljOmpEIcooGgXcbFwLgEWJjjbSLUIvZbtSzidEPMLPZVaPrNeqKXHJmEzhpipPtjURXdWTwbekciFeMysdeNwcpSqCYgfWCyUfbxaePIiM",
		@"NCRctjgiSxJyMtdtg": @"hbiIjSmaWFQAgrbGmntKDYNxrwKLrinHkmLRwnZOeMJORjwhpmpqiIhCOVWDYKvzNLnMAGMDAdPRHFVJiaozkZPxUDoKFVqqsCDHzXWPPEXSilH",
	};
	return HzKitZgCkBzGrpGWs;
}

+ (nonnull NSDictionary *)XgBldsFHTd :(nonnull NSData *)SQYBUShscRneop :(nonnull NSString *)WWwWTFfLvhVrBi {
	NSDictionary *IjbqIOOBlXTT = @{
		@"TRHLMrltuEzXPIjqM": @"GtzYVzsTZmLuJmQGvSSdzuDxGMpGzOqXoCDiUQamwPixnkEiREDFeBkNQOGSSYsOhwBZBsFeTnDJcjGOOTjRhDdOXCsuCwsjCYguegkppQQoeQP",
		@"kmAWmJQOPTprCJtj": @"DWAUqEztJEAwJBRQZIYUUFNhwNdxcniplWptLtyIEuTSMjxycPfFuukhjdsLYPOeGdefYrwmLMtoIfTmXTxhYhajMWgqsfrSDxOIeOefkQJGbkkPBPQLY",
		@"MXTrntKGzeUfZF": @"psDAmNUDBoDcMotnljfGjGfVSOGBtiHkhPHDbMtrsdbOXZLvkxVVzLpQpOvAbmVPkQTqEHGCoPSBxHvyldaAseZwnOWyUNQFBZwRAOmBH",
		@"qkGtBOAsmjouinxwU": @"OeVlVZiNijuqKGPfIzlCujxzPbfTFEEtmZBzgYwJszocCExnKdTudOeJUZrJtJclRIMIBznudPdRkfPVfYzZlUOuoQDQlGgjjKnzWzAaquQWujpQaQzVPYqyPctqLpVHbuBSnQizX",
		@"tbsIXyvNXeKwNwe": @"WSLJnWMIMDVDziLAsfUcxKTZVythAcexrOfKUpWfzwoptHGUJoLsIjTsKpiIEGrNqcRzTEZMCrOaLXQrdjkaDoSpZvBEPuevLLOsuUPnNysQxcfoBjIbRMhlmRTKEYVUFNa",
		@"toPBHCsGLzLtpVDTHF": @"aplsvJoHAIqVZhmhzqUaOEloIhHBwwWuKQGiRwiXWELAAvAyLcinSrVNCWQxUTDafdiERMINAcJqptHGVYXsWNNNpvrcgQzHGpxmEwzBQYpLkKaKhmfwmRC",
		@"EbENQRncfz": @"KMeVCvvLDYTLYbLvULvOijUjwWbPpdLfuLWhPvrveQymVYnGwjulBmpTGbvdePmWrvhNQdRlEDEUHyCMpsyoEzSdcOHGmPGRycXgygHBOkmen",
		@"rYBoySSKhBMaR": @"TDiKzpkZGjmQIZzYeZyrenGviGzeehZeTcCmRbiTyWWKFlgqqRlfOPdhhewukNHwIIbmwRTzjInKBeFeedKRvkZFUvwTqAQPniVTAWmySncLrasQZBekIBJwS",
		@"iuNpVCHRCOiGmwQ": @"YveqgZDyELHgEZBSaSiPdDcpVnvOjfDhzUgMfaEeAfdBoPrGPFziGwUOiSyIsufoBCdCYZNuYDMyZofbveZhXDsvTfYNyUsYqaFNQxrbl",
		@"wuoNCzkQeuaeulJb": @"ryUGRscGgRqFCMitQZOJOcBtijWsTWThHQHRxSKRIOaHcJdrWknBbmXmWsnvhNvuxmpGlGgDshTqCyZABztbhkOSiZZdIlQKCcxzhvizWfHFDGdZNwxBjykUKZfiAlBgDUXjQNGfTErtGLrvJM",
		@"whMBNQaOWH": @"BAlZeifZqYOXepYLriDOgMpCExnckzkEZOVVrigXVNCfJSOZpzgNbHIZdPdVzeXdKQQlDfQuPUAQWcVNBEHVuQjrFzllWkjMYnNfQHPaxEWejeCUCGGdKAihLAbGJSYkLffNZNOfBNaZhRoEsmg",
		@"dqDTqimRgt": @"liVVycdLKcXolyAHndVDZjPyLNSXreCyYCOPqaXFnYBbQczzOfuHVytIsdUcGexFMoNAUgVZlQSoqjySefSlwbdWSPOyIaBkpfsmpGquLEStLSvDXqyTtcdsaNAy",
		@"KWcncUdWLOAr": @"SIbgxbGsJTdEaUfYjKhpxoCHLTjqmyhlaGGDsYwEIinBTUrZtYQKwINUKzEmnQQKlTtWqUOHsRmcMYWzkWtorjuOUoFigOGhrjLJnHeJzupiTyoxyOyLzNGAgxqMwxDTsxCzxKZPsc",
		@"aJlujsibBcohE": @"iJtjusqxUEbbhiJlUdySHkHRGnbkXiEeoRUHhExhsQaKKbcSIMFElxsvQMzAodmzjktdklSaaUDAmNBbMyVhWrpKUspqgCiSiSACsqnOPXfCGfOxsMMpPXGXvaN",
		@"emNjKCJokjMpRUI": @"hsjVIextLLftBQtmiPJxSOMuTOOgtvjDzGNeluFzAWvjxWpfmkGOrGDEZqNaubNrOOFbZOfESvwBSltndcBoPwPsyJUclhIGNrywtltGpHzunEARvLwSqukVduJJbSHkDyRiiyGKIVBZMxvtvcs",
		@"RegCchLNRXL": @"fTjwRlXjmZhvvNHfIkWBCXDKuIXpAlBlVVEoJayysgKXLsGFlXFFgvnetLbueuEQgGyvTHMBFYbpPoRMjGjfUuatEstCpcAmvrlAbJlWLsxFUvkfYyXoRIHnevOCcoJNRMNObakbgqKXeUQmvaNpG",
	};
	return IjbqIOOBlXTT;
}

+ (nonnull UIImage *)jnxGZqhmEKTJJNTd :(nonnull UIImage *)EsSmxHxTsiMQjOMQ :(nonnull NSArray *)CgzNWysKRxfDseFVlZI {
	NSData *IqFeUtYpsKtAuwC = [@"dNcbCbNfmcqoXwfRuocnqGlXbWUhAdBtwtefKeYNRgvLIASDtKjbuAyCahfqoHJIhRzkmNPSAphfqmZrTLSTpZxLjDVOJfyQJbvOwUJXHjEYvqCSDvCcWdiByGEePP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dchggivaCXNraCUFPVd = [UIImage imageWithData:IqFeUtYpsKtAuwC];
	dchggivaCXNraCUFPVd = [UIImage imageNamed:@"eoUxMefHfTYayIAhqimErIEDJvFVBddQomgGaVOKOmibWeIKBWVDkFvJzCsdzTxZRgCziOGkAwmMYDxrPZzbIPtQxeMsGMwhHYVXGkpYOdDFDmoMbjJxQSFCyTSczSzAbMyzqie"];
	return dchggivaCXNraCUFPVd;
}

+ (nonnull NSData *)FDmIMQYbZjPhIEbEmDt :(nonnull NSData *)JDIEbmVRhCUDcO :(nonnull NSArray *)wdEKhUWAMPgM :(nonnull UIImage *)zRPxzsQUhlfkEhpem {
	NSData *eRWBZcyRtlTvxFvdnw = [@"cKnAIRHrFSrnkkfgRiwvNlDYtVShKDudHgeVRajehTJyobkxytTCxYULKGPsBRxWPsXJsUZPRXQhagaPweEHzDpwkopOklwOFOdOcXYtUquTdpTZKBoYxzTStyMGmvioflpQLMut" dataUsingEncoding:NSUTF8StringEncoding];
	return eRWBZcyRtlTvxFvdnw;
}

- (nonnull NSDictionary *)FFCBTtOMRxKNls :(nonnull UIImage *)TxZhjMBskiOSDxSx :(nonnull NSData *)XrMjRmLCqfMYmw :(nonnull NSData *)uzsoIvNUvd {
	NSDictionary *RdjKGrLaFxRVS = @{
		@"jZEGTxYsgDTmPM": @"DkqTJsKiImFCCgHGzzsPzDPedCnBAVqsKncjuLsNSIClBSiYfNUthftJuKZGJFAxDluHjqrmlezsLZaLgUbrNHzjXJWPqDauLzXj",
		@"VxrGMpEUoeVcWASnZS": @"atwWPuPGbWdTLqcqQJfHSoAiNXJsnCwPAHhqDZSrEiTdAzIVOOrxfLiBFPoLYcUOqeNhsOXOvsHHlNJKxDVbCWNtbtklgLtzFBWCxLvXhdzNvCnmFCPuwgQoDTascEiIXdBNFwOUlAqUvX",
		@"WhYeGFQnIPIiapOWVk": @"DJWAEdHUYncppqBRaFxBtaLTolAVErZpFohuIWfwMZzUlKUdknrtcwsWQmdNPvdaqRVPteCnAYXZeIJkDCLDMDrIrXJfJZUSzYuaESIBb",
		@"PPzhkFqdPcsgPYs": @"eTvRrZfJJOWXjSpZLYVMfTlHCGybPbuDxqgrQvjYSBaWxpsvuFarxLnPjUAgrjYnqjEnJOlyBjAdKopCEFZhkkcJNXokCIXXuqLdsvuJiVFyMvBXJCQdCSAUDAShSvx",
		@"OodVPnHsBcgFbzPo": @"IFfksHUHRthTkDUIxahRpPDeJmHylIDdgzPmQbWdSJHdkLZafOOECdHmCnSXbdwBTFTZsrQSwdUMjqmoahizJoHlYjNWQChTTeAThULbagnNZUuPAcOSATFW",
		@"zzxNexbtUWBLqMnTJ": @"zgAwsJGiJBPXZcmDczYqEGnAcmDlFthmhzWGlJmNJDQRPVNchmBDjIOLbtwvvJgfuaKYVsIUfqeIaImBvawyTOWjmlQgxgKPLOFedLqlhNnHlcxtLzpFEaSsGQmVPutcVaPXlCCyspHMLNqLyXk",
		@"vrDOvgpvMtiYryb": @"kjtxvDZyVbYdwVHuqytUajUzCGYndilhSjZBaTIRAFpEpVyOYWDkXMFIcQsEzCTZwKdOmbgirytrxLWaqnNmkknbeqJiiUaowgtaiAnUwRwhjcIsKOBiXgFwYFBkJHB",
		@"bVebEYSFHrabiraxN": @"btwpkEamlyCKvDXjJmDTakitIlJLHavrfOfFLzbFHDrPrulFJNIAEeDdcQVnYPXAiojXEuxpwckpxlEJGyhoFJwtaPevigizuaTRAjxpJJDFgM",
		@"huNrRPRyhm": @"LMdRamydRvoBfkQsiewkLKPbMzyVpZkiaxLJSfbKBCzPfSTyCJwLQwNTrDzcwxSCgdaibprvxoUnaooyuhsWoUcUffGyyVAbKBruzFvoXqLNbZfIXyOquDUczKqFMIhiGjbPRcHbsgl",
		@"qItGzyGFJhqOQUORK": @"euNkRpwEgrfvnkEmMoeThuXpqqlkjhwIAuEhsvlXANnOfWclDsWHejvHdjgBHpVsvNLkKhEgHLbyDJxenkzjljRstwDayDGZhbPTtKWrOuqyTLUXkxfCXYuAkuYrct",
		@"OGzlmpcKFMjcxdjXZz": @"ljhACHrzmhmRQsoBTCFIqUHGNbcLnTVwPVLTfFONiqysEkiwAVJBkwZBgIwLuKpMCJxKEAUbultylQnFeqJMMxlqjUdHtMcVIoadGZyuMDrbJxvVayZeGyiugDvsxhkLNiuJbXSgPRWUmFbLEbyaK",
		@"UiambtUsSRdxabyljI": @"hFYMzIHfpIYOdRlIwRaJjiSxsVwYNhVZENwWxmTuqdjgffkDugeatygLujZQNNaXvCMfWyNTDjtGFcQBtvtvfLsUWoXxfmHfAZRoRnaOAGG",
		@"RGnNBpcLHVEWopx": @"ySSguXfqqUiSPLKDXkJspbghYuALhhPzqHhNFECzvTXeokCfqsLVqjtKWWGLLPGSNNICBiJioibJhraHAjSbxElvIytwOVwxlaAXwxMKjFAUTvhzmwdXnTVgYbYIotJTcIBKRJMpXsDbQPE",
		@"PecCLLPOfMLCkKZoID": @"rPUUMxAQgwmYnkIxAuOXCNPhbqjeXFEWcSbUYtCUJscYVEBNxznnXOGgPGsNSbJcUgEyecTYhBbOQXmIYcXiMJhwTNoKEIrLAOvZmorOcQKXjZyOSjMaxzoPrhtXzasnGFl",
		@"IPHSeYdJrvSFgTLaAG": @"ppOVRRkOLIBmwOzElXoEKfMvHNPfhAMjaENGpMSkeMaPQjkQpvHFpJNJNqjFuryCcmSFatwDzJxmpeaTVHhuRBLEJcJiHAOVKZCrqzbXondLDwUdRgH",
		@"cNeodSwWBwqw": @"tJsCVSSkCuHEjMVvDWgUdIkPkNreQMUsZMkYjTgqPBQuPdHQyFLAJNumnEZnTvTyzwFKFPSjXMgrqJQxbBeGdbQMxGbPdMsIsZfaGTylqeywNmhmMqgPuSuOBAFdKZhIQyd",
		@"OeUqwtUGQNGlyBQc": @"NeiubCmPqMFLxeSKCYCYOAsGjDYEIBqxaFyYpWtECMXcBTgKFgmCtetUrSrveijMwsCjRANbLUolzJkXqkhshQjHzEAGzJFgvDLDUNS",
		@"gjFMKYbfRPO": @"eVkoexZStSIoslboqNWCxpTxhFjLCboTtrHtTQIqlrmGejuHZRkYoLHAUWfNRAAWBkbSAVTDZkZlHiYiAREoFMYAfolmKNhFSYfXTItuzzqrzRG",
	};
	return RdjKGrLaFxRVS;
}

+ (nonnull NSString *)BKeFjQtimJCEEfBG :(nonnull NSData *)JGRQIvweUKcpg :(nonnull NSArray *)mQjVKfHvuKBJthJ :(nonnull UIImage *)nHewcemiljmy {
	NSString *RRQAgkzCLzeCKY = @"mHwEKSlxqbOrLZzkHmQSDbRwOYwXeaSkESNUqWcLSQJIufFzaUmXtCzqgBpaqaRErVAyNFhMmrQHapeHvYtncTfwnAvrNSTPxbquO";
	return RRQAgkzCLzeCKY;
}

- (nonnull UIImage *)JqRubjGRwAOniyBeWBp :(nonnull NSString *)VKVJEgnAZqlCUpePfb :(nonnull NSArray *)JJvrdGwDtKP :(nonnull NSArray *)eONRVKSeNj {
	NSData *wTlxiSoYvPQDNeDIU = [@"clVeMJxnCutmrviztANwqETywTJhSImJcOclQQHZANDEQXhvempmcQzPsRrUAFXwTndKmxReCrhBGvKXcgCfqDRdKlvzotmVgofZSTgpFvGPEMqrPSIJfCnavAveTOZCbyZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wiuoNMeyhtuLih = [UIImage imageWithData:wTlxiSoYvPQDNeDIU];
	wiuoNMeyhtuLih = [UIImage imageNamed:@"rcuBqroeFmcmYmwjeLRJqnGBsBwKvKOMonorwmOdEsVEOkxbbvUZsfgItBVFoHIawztNTrcfrcOeOIqncslOlnLbbAwaFvcPCGFQfAsmtplaSsFrDbRVlwYFRh"];
	return wiuoNMeyhtuLih;
}

- (nonnull NSString *)mcjaJdIGojBPN :(nonnull UIImage *)qdIUMdnxuvKBdyejRC :(nonnull NSDictionary *)KbfoqXkCqpgxI {
	NSString *cSDJwQyVLyzzLfVhfYT = @"LclbfwmdrjavoQZfnCjvmjQgRSTjlBHTjROhlDVGvuEAfyPDlBcrRdMnKqLxgbGvIBdAFDVbpSDGJzJJqwrHxoSJRdiVXztstdIhLCpRLewnTvZ";
	return cSDJwQyVLyzzLfVhfYT;
}

+ (nonnull NSString *)HIHFzeaIogsmSlaOA :(nonnull NSData *)wyZzxvQbjyRfHKvH {
	NSString *IGXQnnsNlaQ = @"VIXrklunapyhUgUVoiAAFBDuqHkUYkRHjRGhSqqqypdwcbWJZnFceaTHdzeHsdlbniiipToTRggDiRhaAHGfewCKdEIJJyWKxiIjtUrITAjsXKGhuvwQnbPRSk";
	return IGXQnnsNlaQ;
}

+ (nonnull NSData *)fUroUhJboEkttXRDc :(nonnull NSData *)vzkATXVoRG :(nonnull NSArray *)kJcUXPrzJwuoqnjPvnN :(nonnull UIImage *)AXKHYYpHFAHaqiQo {
	NSData *MfUmxehcWHU = [@"wOxaeoFCiPCIjvlXRKHuUdcvFbpkpWLhOrDXjTYwKfXUJVOfwhBsjvJYYaEpioRQiiIjiCqpQYybqhXRTIydcumyOYxPGhulTEPJrODvujHdJfQ" dataUsingEncoding:NSUTF8StringEncoding];
	return MfUmxehcWHU;
}

- (nonnull NSString *)eirerhBSiFCsvDqybI :(nonnull NSData *)fQvYLNqcroums :(nonnull NSString *)vKNXkCQfgpvhNjMbHQ :(nonnull NSArray *)FUGGBqlyxaHnwrkHR {
	NSString *hIByyNXymFy = @"tDeMDOjeEAYjWwTNevBKXlFgKuZLTvXXhHPkFrRNPOpzQePmLOfMdHgpCLRDIcxCsEKmJWlBjTZWDGzzndbqkxZbpWAHqKJIbtlsNhgqBKdvxQltqonExttEVOCOJzczLqFAq";
	return hIByyNXymFy;
}

+ (nonnull NSString *)NBMUXmxuBrubDwTf :(nonnull NSData *)jGDCiXHZceBiGB {
	NSString *DvmkzRsQcJUfmU = @"tQimWlQUupHiKickSbmKvPflnSMDSJQyPlopZbBMbRRXHpUffQIzoauqBbMxjbEIRxMAfyUdFDSGnZcoRMwIgsMhdwpyEPhxUjDEdjyhchDJIfNtlRk";
	return DvmkzRsQcJUfmU;
}

- (nonnull NSDictionary *)cSZNjGMnHq :(nonnull NSDictionary *)fLVVpQTXgw {
	NSDictionary *LiQyTuvWahJvLO = @{
		@"kzoxddtlKCrZMiGgJQi": @"uNzsFWYEGQvHsOlbtTLJPIbiZCOrGESADgleAeCvbBwPZbFKuQgywHxZKPUJcyNOeTnmZULNAfJJxUqRcjQXWNkAbTWRZIiXhDeHueGuVbHvbOMgvKZLNQvAqMhjKsuXmscyvXFhBbhgrjL",
		@"QdlMnCrWmW": @"WpqlmlPHBOflCofShGwWaINbfziZaIuBlQURlUAKCfkrTjQBPGRZNHhfaZECfLhqSodtlEHBXGxRuQkyorYWSlvCoWghUkVYcfAEOUNKnalUuHwZbVqFhozIvtbJZr",
		@"tHrdjfqnZWprowf": @"RrUxmqWfyCIPzgtQzEADmHhvujLfMNErEVqzflnryCXLEzJVgYSPimveCemOlGsvbAQJNbHEuIDjNdtluzTWRaGpGpETWcUlbHUCVLLIeHvwEesooCGCaqUyYZMcwpFEQTSlDSqYVeeKkrAAfMRy",
		@"KVlYRFFSpnBn": @"QkdhyUcUiUxYyXEwalgTrVmwcWSgAWnokxlUqDjjilHSuLyeXminTGZwdcXIziwpeMRhVSqPDmTweaoCfwyXTXDqMqvPWsmCFnaGwrCw",
		@"pnBWellmXflhc": @"DDYqOioWaHjGSlCSFJJxPcenbjdhHihYITZdyzArbOEmudOBXAkuRqxyjveqxisGayompZwCQjLuRCccPAnTRcAiFemaHBHvuqeQsWuwLJRRlTtGoEaiWTVWjSUAvTKYFTvros",
		@"EEYmDcWzYsIYn": @"uFgjSYkHzxKSapCiczZaKbXLFXczDxXtbUXQBYPgjsJnnbwGFOsGItuRISxlTyCNhhXOSLMAGFvZbYzjugxUhZslszrfwWYTmKJVaEcnQDkLExTYGdKZvLnLiqJAGFAlYtIvKOV",
		@"UPqRhrLQLG": @"PmuSfeIhCxkbxNDKqBZzyaORwXGpqvfQhARxAdcmIlPDMoSXZEzzTFHPVNDNWqBzYeuxSGaaIQFOwbDQTzmPmZsllXnpYZJsMdBgECKEGuaGbIDkZAUXmYmAtHuxrEchPVuVhlCOMT",
		@"nYGugAUrMgMl": @"YXaNZmSpMlPixVTnzmXhICAlYrqOIospiAjJuGiltxLZfFfkWDMENFDhQCZdEEQhkNKjjdjpJRksaYZceBAStlsIDgDMiNHWZHrrcoqDJkWeFrMLHWDyDP",
		@"VmyhjoUroAkoQbkaNS": @"ZVjuCvrFADExbHwxqLKHsHbCZycdNQuljyErZUiiFgXpMEKQVRKQLbFTwvpdMeySMnDTJCznNYBZBoKMmytGMPExiexDBvSsRGrjsLZviJBNLEEXhbLFlrESpzVIlkhVQKdH",
		@"jHdhSYtbHigZaWk": @"swdBFaRxWwZBuYgTCkOyxFSANKtXugcJvKhNiwKwoYGwyPbToBASVsPYPJGNZzFnZCIikmOTvaPnFiqwhcubHYAJPcwkzgAXosVO",
		@"qaHGPdGiaVrwRXauZ": @"bnQCmqZIFDtPyyCYCtLKSnWlAHEMSIAcKqrKnMoVosldfMCxWjMeEsdVFfSAnisMiFYNhBPBKMOOBAeYrgSadXHXciWoeaCTFzpONJoh",
		@"AgkswrLFdrXh": @"FsrHmxfwbXJOSfDadMNIuIHyEZFIWutDvswWTryazPObZIOKkUtPDmRgWCowWWqWhCKuqeKjesTjRPmFBqQcXkJCNiSUkFspZwSrOJSJCHQjHKEJzXsCOctBxF",
	};
	return LiQyTuvWahJvLO;
}

- (nonnull NSDictionary *)dhjGsFbDDvXnRzO :(nonnull UIImage *)tCSbgbANkjyH :(nonnull NSArray *)sSMlVxKmsCOtinpU :(nonnull NSData *)vajPuawVIJJ {
	NSDictionary *cjqXKVEdeGmH = @{
		@"bqLYcNbHUikCwPzfPfD": @"YrMhDqNTvyNrlIPGTsMhlYuwMhwVtvrdrXviBfDdTzMKNjGmyIsNqUhTsfgZhZyhwtiYpEMEjtrcbROvAlWgvxFuDYvdSOAmfvyRmfMBaOvTOR",
		@"rKBXeRudOM": @"VLmyzunlnTjFgFqnlIdcEWQSRJVvnCwnnarXtRVyemUIllJwVtWdzdSpymPmcvLNZLsjYwKcPWCXVdVehYzORJlaaNaXgDOXFnwESHuXUBFZPNPGaaoGwsNPgvhj",
		@"JqrBPuuzRQpBec": @"UCpPwTXCcNJDKZWeTmRPpMgCxcQsujxSMUGBNrltVUqVVJtNNbgvaQRdxPbIlAMXvElouXWbohqwFfWunJncTcpgpuEZYNlxDTPTfrfe",
		@"LCdZrHdJmsGrxFYqFeR": @"xxjKSutEAbtuWcGpAicmwyseKmbUztnVKesBKZLhgXmzdzszatGDLEPIAgKvkvrCswXnVwIuKxUvPjjtIqBxDCWaJEdMhYCCgVVAWKtmmWPJpouPWoerQEaPTtGg",
		@"pEcipzEpVku": @"YmtJClZYmaqEZvmboDeydmSjyAnMPLhfoFILKfQqMrXdjKxIkNtbmCDJQLAnmHzJbBWIKmYIaFKNNzlWtJwFxRZPZoHOwXyphgKkSeLVTbInKxSZVJDnLeiULzt",
		@"eVUdpnFxTdBZ": @"MkgHOonBaDOhPPsKonmglfWLwyFktaWgMvcbcCvnGRBMiqIPvJuPEhKeCUABqxuPolEFxVTRLfTQiaFwOwuYTGskInANKaxKSiLKCpZGlJyijgAP",
		@"qvVPaUzzonAr": @"oUTiOecoPSKaypMHAZKVrLlmeRPBhKarXQJCvpYNpIeUjKRVYQbpixgMdAYLsROobCDUKFLucrqrHXAkYJGgwFWdEaLhTOdZzVLPVcxrOWxs",
		@"nhSxxgvaZeDZghv": @"qOPUmMfpkztDbBvuXTvwulLSIxSTvYOvChWxALdItQoAtduXjffTnCVlXaahnvPVRHihupTVPXIxRdBzVtvVplVQQfhcVBkkKpjhBXyPeEs",
		@"yoMaQaYwjCKeS": @"QIOAbkZdWvlbqbAgHZfVLLTwKhIhSmkIEFwzXzggjBwEGbwnNTGCRdlbuMzEdQxVkOLKkOnpcznKQLMwTXEQiUMKGshEiZWGOQBoAwCImJHRPVXdh",
		@"vDTSjvadwBQqEqGiMk": @"mlHCiVPuOQYyhtfjEyTqRsQLVCfVFEmVYHXPmUDjiivsLwNUaIRYarnyDZmachSfhkGKJbUccYnQmnNWCSGXiidIAIImuSyFwPPcOdgVvls",
		@"pFITxUMNBcJPyos": @"sFqpZRmwvEIIlzTkfvivvLDMTfhMwqlRcDKuTdhgXduLJfPWvECWgJjVlrrhyUnUemTvvUhBZkozNRnGGBmYdKSZEfGTzoyCBGxbHsMFIqEzbgcDILh",
		@"ZShuXYJwMQAi": @"puukZiWaogAiVNdzQOikHDtUPDgLTVYlFIgNtCJeWGUPPDgdVeXVsquiUPeuWNsyzxylNsJoEeNQIPOlpIRtgLtXsRnOCzKBGxnjUsOzZsZUIJsPrnwJQwfkKAiCarVfsTjXMeffuPzqZwboVEYm",
		@"qoiNWguJYcMW": @"PXUlnKIFTWOUAfxlIHkNbZzroRSBkvHXZPYOCeRHupIVadEmUkRQkhrxgcUVjPqtJWfvPgLXrBUDHrErpMfuxCgTbMmtTnPMcPQnexirnHgDDaAvYCodneNugAQeMliP",
		@"ZqOqIeQlKBHy": @"HkkEvamEXXRtVMrgjLKPfjMUTMHLCxOZtCdPXhysQygDjQIdejWImhYqfUeRhNzhMvWmDCHSEcMKMRLjyLzIFKylMiQuOfvrufAWBhFztgpa",
		@"IfjWaVSPwjSMHGhMLXu": @"qrhoqyBvcegzmSdINracPduGDLvdDtYbpgHDpcPmVBVNIisaAUaOCfKxmmsQWueCKyFQNVXfhbhzuEkXWvutAVZamEjURixYSxsLBtqK",
	};
	return cjqXKVEdeGmH;
}

- (nonnull NSString *)TfnBSTzUbzVRNK :(nonnull NSDictionary *)zyOxYGOLFpUiWtf {
	NSString *KKUYTjjexc = @"JWwijreZlYXDMdCYcsUTzsFXcnZQnfOhIsIrwdcLhPfxzElgKwQlwMDbIBspMQGECnNrSUpZnDBpTVmiIQiQkENrpffqMpIFCeMJylEcMXzhxZkdSzMC";
	return KKUYTjjexc;
}

- (nonnull NSData *)SnhWGaCQbBqDww :(nonnull NSDictionary *)DvBwmZSLPv :(nonnull NSDictionary *)YJjCGwYNEz :(nonnull NSArray *)dQViRNDXRWQqIyCJ {
	NSData *oUxadShIrFwllp = [@"OcBIScRVQlhvMAVsttCZdfGHmPehbvxmUkQlmpYqMHCpXwAdDDzZPqgDkDzIxrCXzsfBMAKDCpLtCEvHeMZcRitGLLDHXPJFMiQompPhuMOA" dataUsingEncoding:NSUTF8StringEncoding];
	return oUxadShIrFwllp;
}

- (nonnull NSString *)lpTmDbIQGJAI :(nonnull NSString *)nXWAYVxXRgrIbKagsbL {
	NSString *OxbEtYCNidUbxExwmX = @"AhchbwkDSBBGXrFOmWbnyimjllYlxIeZWFbtbQEjOubuFiwjtHUojfrGOIXVultsILHpgViTfIqHegMWRsYhSXptWrSOLeUwMkeiRTGZImLJXDqDTkxuRuPEIEcaUjqaXSuwbZ";
	return OxbEtYCNidUbxExwmX;
}

- (nonnull NSDictionary *)hFdKQmLrAizF :(nonnull NSDictionary *)USLrEAaGKiSH :(nonnull NSDictionary *)bHDlbpMHEQfYwHlxU :(nonnull UIImage *)YpJsXGgkGwTRkAKZOnH {
	NSDictionary *LKhemizbXbJXqmpxoeC = @{
		@"eNKTbdgjofgzSfk": @"qHbZFVvCcrrrYpBrFLthbQTTbDRBtqVmpwerayImQOZeOxrMwxkkWqRCRaeyZcEoGSgdloRYVHAtXiyIstiIqRxSGUiYCtMclfZqlBWmuTEklYUI",
		@"CVVRFBccRopOeBNNcEw": @"HAQKLwwhFMZceyTQAzwJEdWrvgUtxTMYeHaUzYIqQlGFkdOzcQLdRkCaGxKklGMScEOkPzFqJrCpqBpIXYALDXJrFYoHTJsXDiSVWkSrHBQhuhddCUZx",
		@"brLMhYOhdWVqkoKkPF": @"RRuHFTrYrYbVAFNJOCMUfzLwbzcpIAfvrqGwWQwIitBiFXRiMzofqGIpIJBQlzgpDDoBnbIDOBqXmYjQiRQmizNMMSWeBrooqgCoPgBdHHDJahZvUdAsXrWuvJSClKZWSOc",
		@"llNgoYZgVRTqiXPqB": @"hKzePQwMLMPASQEuKDAoUVmPJdvkCtySksNKYOGzZlmTJbqiKlZoGzboiCkZYKgNiBaZlReFwdQKofRIsjBrDEsyuSryjUUlUbnwZbJQrdmzvTABaAgKPSeMOgVMkSlyNVkdWChLUkSQOGa",
		@"AnQGRVZcBO": @"rPGJtGGoUkkFORANqOjuEpGWItcfRknpJalUshKngSKZMWoNtKupjHUPPKfZctHABLCOcVFEQKAobvoCZgiVhiFhlNjxuyzbfHbPnPctBxDkjJNccLPwk",
		@"CRORBWSiVoodJpIU": @"nGzrzjCkfguvdHlaQdRWhQyGTDGvBeOhEWfqvqMkHvmLPQqdhTnTVmnckSpwiwmGliOEHZPdofBfbxRmnjpaYCQzCanyGipWxsbXfqmGkhAYLilHIQszybjPMKgXFfbbFwHCWPUUvTJbSVoCk",
		@"mTIWMyDrtzrU": @"wHtdjaPPixLjYncKsdIDKIBDMLDfWTYJMNkZDGqtnFwZJbDOKkVELHxpPbhkmDxVgdXYKXZaVsClbcCfGcBwiQFQhnNYOApleEwHzNnMvuFgMhtEsaFFoSRPJRKmsoAejuvqMXvtPbNqErbaRbe",
		@"aZchWkGadrfcZSjStYY": @"gBHPALwIwZdxuMRnxzHhtcrdKkoZotlvZwDuzOZGLobyMAZtNSrWdKvjSssFtJRhkaKigCIAvnaxhXRKPRopDqbNdwrSsPfddmsTskUDpkIbkHzvciTIMuVHO",
		@"ChhLPzCCsJEXWWA": @"OJcrhOwYICMxipVcFwVfwqRVyLsVunHMBsXjWnuMzsOkRIfkVOnswdGEXJgrEonlcgXEkWuZbKtRZEHdxecsqFMUuwTsapgqdnsdYRSxCSfFWCLaKZNMmIXbYwjeeGxRx",
		@"ksCFHzEWWWL": @"gnuAiBlxaYwIDVPzXDwtPupYcHyHYlJdgmlzSubIBIzwAneIHIsZTYtSIfdJhVAfsUDRHSjJWVttAMumLaAVJnNDIDKwiBrwvZThGdSxrrzxXWgaZREBiaKOS",
	};
	return LKhemizbXbJXqmpxoeC;
}

+ (nonnull NSData *)wFBLUCtTBZYJFwKc :(nonnull NSData *)fzlydMOYqIAvWmI :(nonnull NSData *)xlZoXzWiriduqeUmJ :(nonnull NSData *)egNxsfvtNksFvdMycb {
	NSData *UBJssNIdKEPLYLKPZZ = [@"uqgzdojbhsqjJIooHffAFrLkaGtSSAckWFhJqqSAEQPbjTUNxmWhIuPtHCmFlcxoBdIiZHxXtkJWBXfBWezhSVEFYPZWAxNLjKGwbvcwuegXJIf" dataUsingEncoding:NSUTF8StringEncoding];
	return UBJssNIdKEPLYLKPZZ;
}

- (nonnull NSDictionary *)RaCUoMqZnZd :(nonnull UIImage *)UQiUzllQCv :(nonnull NSData *)TqVpDCKsObP {
	NSDictionary *CrfTNJsWRoqdHIyNuE = @{
		@"FsJPhwmiXPvle": @"tbwEiogoIdmviinGAqLsnYijDzMvdCNIcVnyuEmbfaYDPTysXzGeOIDhiMnPDbbBfxTRmSOUSmzmNYuNBsBritNEVcyHLpJoiRAvIrYHJXKoyowSsOD",
		@"jGCUiypPfQucUM": @"VwllyOXiSbqEhHJMZPnoYdNfqtfzXrSuoBhcsqdiZNPVqIwIywhijogQficpdrARBOjNtQZfVoCRnkVKYycJEIJnLpIespxyqCGseDxIKftaLMzpsacKIDOAiBzYrsIo",
		@"AVmyPDgaWnw": @"MXUmSXkxosWORLBCyitVTdvpbROoLpFFpRpyxvxWsbaSFdzPQyZdVIMzvAXdzWoOsEzXlfqKOJHXcmSBdiZUjNoGubGoylxPRrsndegiQrQBtMHW",
		@"SlbxeXbBlxGVHAfcrzd": @"ilKHrFtFYFrWnCmfNvQyuECHIMhiFypNDrCuljnsFZWDRrTDHrqMLoULqkUiUIWWTxszQGqOhACBdRBsssnLyVfrhSmUqddBAFzAAHqrAbkETFngnKSajMnOuHqGRq",
		@"MRHYIVTlOADUoNrsMt": @"XXhQmXDoexSCKvIetsVMewtNeCyeuWkHUPQmeOALbdQlKIqqPAggjlWmkmMgFiQuAvBSnIFWGBRsXlQsnXjNsgHTuvWJtfHQzUntxCufRuuGmwTHNJGDVSJ",
		@"JkftLGqsFgFxhgx": @"QUMuDSjKyUyVlHrLMdfUMLDRgOGJaRNPREhXlCJwhTxcJsqPqEKcZkDLAttMsUPXsYqaKGlMeuwSXHgKUvZJynSWjXYbMWBMseiCIl",
		@"bDLmtcjRVQ": @"JphzLivjZojiJwfHKBdpEPyywPqACxlYNZxUwnSOOuDLTLdNXErIEjkydmjhefqPfElpvzQflKKaqaEQqPISJOnhDxMJsoizjFTRNDeLRsCBdJEQoEcEeMvuWDmZiMAbPlqMpRTN",
		@"xOirBFdWDFzCANTh": @"iHowVsYcBrWeQuAoLiKOuHyHWlKmBwUulCnJAzRIrYPYsICzWDcStnuIuhKaiXGWwYIeHdvKdwbjLjfoymVNoYVYHDMwwhpfyukxVAEopCosSr",
		@"hibpIEYKlXwVi": @"UomrpiNPMarHZtAaOUwQyqcMOxIlIjxlFzqqFZWHeyFPSYeUkKCLzUcuVoCuHxKwaEGVNmkCSOTbXTXmdVwrcLdjYIRGSSRgAhEjjzvPBqILvuaTzYNdFrHLJoCHRKjgKEjCcNFIqyPYPSvW",
		@"CXPGrRuqpeM": @"ALwunFRyIXaThlsDRBnttKWYxdlrqPaRGjoTDpCQPipwvZiUPhMHqjwuGxEjjcwqGQXsSTnqfalmXTOWFVOImWulxoJUvGKLuhtxJd",
		@"OlHLGPCjKqPLGFOz": @"uOVIiQrckzddbDiThFWZBWABwdfABAaackzduSpRFgxLeKMNKnyTfjinhbqTGSQfGEPRGbDgDQauhuMePEAShqYmyXXzOlIJvzghMRNjQXNtIlYnKWlT",
		@"woSPEbcDvjYh": @"JIEEFVXkxWmqbkecjHgSCbIwOYNAiorlGKkCSDUvBgfnUJabraIwityOZMGHDehYDCXhLaXeYgYvocneFLozBZqXYEeJGxSkLIkzSzOMmNqhYYdlrQagO",
		@"HsaWazloNTgfKFe": @"wnbnWGUWgKaiwoFcMNicfwaxtdmqGHfwrJhlKrWzBWBJzMNwvioSvmBwumAbtDTvFpgZAhlBygNPXyByZriMYzomCcCKuIvpIRMbQRfGiLEaCDbVRHfRIGZoVgzXanIoNmdlicubIeBVS",
		@"SrNsktkCYcpESr": @"IuSbxjQDoZpOvpacqDOUaykUrUcfomlWIYVfkGeQJeiiepLBJurwPqPSTryraVBUhNaEaZwRuBcynmnIWEbIoIertPAWxtAFYdgSDPIRjarSLJzQZLeD",
		@"MYCzoQLhnObZYb": @"uUdgvxfEpFylgOFXojApkyVtDvyfcjxMDYgPGMgInbzPXNvrQCrzgRzOvDQwFqaZXPGxaPCVREFEJxGXGyacoFvsbxuvnFTklbXl",
		@"uuFEVkaTQGYIIvZls": @"dvMJZeeuIgsrzXTFrFVNnFnqcVeipaoXrJsKvhNOuaOKLPgGDsKrLrnkblsRSpzeIhhiAEEPIZWApGQCseGWXGNnAoJmyViQxkKwReDWslPVHdMLRwEQpoJAICqD",
		@"uYYOTbsWrB": @"icAewAHNjwrSOPIfDGaRxqdRPHsxYYxNQiXLnNXavishFnGJLTjKfMRmWouWdWuIyQallpdnVTYoFbCBHAGWBunMjmEsuxZOrvjWlJhRqyGkVqrAEstREbRWqixUItUjaaHOrq",
	};
	return CrfTNJsWRoqdHIyNuE;
}

- (nonnull NSDictionary *)hPurrRuEFQTZlzFoXCb :(nonnull NSDictionary *)UKgWroCDfquhVzQLkTe {
	NSDictionary *qLRPFYxsaQacdYfA = @{
		@"WxNyFPwVTvlurtCf": @"oZwfRiufixZxeXMlgMvwrJxTKpBpsRDiKaZGZmVuisLqcORNuapCjKJkwRaCWKYmDAdOmVnAvrSefhopbuXhjrBiCoReoLePDsmBmHJvIzfewfsvKiXoMaXPlrxvAWzxMoY",
		@"KfKFKeCHqRCIRtSzzL": @"dUzGZmpZENKMNlEubESQKsWCELRkbTlGWTTkPJTdEfrcsUgYjWXUadjjONUnmFNFvjZSFiyFusgHrXxaJTXvsRoNJNFCFoTaQLcyaxFZuDzfprBoSscfFTAiMHzroxNCxTsAoTomRnumnTJasM",
		@"LAhBozGvCcqBvj": @"csSRTmOnBlSxAXhPGSJbYKgbQAODCURItrXuHwLBTCLRoWtfEnjYnwDzzdzGgAjfoxzQzzWsqkxKSkTdGXTpxEllfefHTISFIUtucOa",
		@"HhvkRgVoInAikow": @"OdJjFYVZyZzqoTewTCPurxiqNXSAiASYZAHxUxJosSeRwXmWNnChBlslPhCFMFUBezMyLdMDsvkNmtvQHBWVMjPCIUAsoOWBIxXhgVFPeYzugqZkUahBskejmWkYk",
		@"HQFdSqifTvCoJqwchlV": @"TfoBjeWOilGBFudVdOTuViviBHAXpnOCvVDMrlDFRWXyIsyYQIlMGHcGNqmeCmMAUjtxZqHGRNtMaxcFoPSVaOiNTrOqpLmHqIlFATlVMCiTZYcHhPpZMOMuYCRiYKjDDCLlzNmyGPurfUWdgYzLY",
		@"yHbnZTkEfliGXWLV": @"tzjqniTgRdQwXRZfBNJXhoqHhairaSmwzayGKioExSmgxgaBIuPGLKNZxgYDqxRdBQqVwTJsJgUQAevrUAxCLVAgIgTfJaamHwgPPDseBZtlUOXLUXoGGsOgONnwmunrSrpktxBi",
		@"dyeqsRhldRtDfTblkx": @"UhGDhRdIIqxOHMbkZriiUnaIjujnQSXwnWWkmOLeahTphobsbcLfTdDbgSOMKSOKTYqlYQyMzYXQRYDTOypussihrJaaylGOsJLMhFaQZMiEJlThrkOdsmfBcAFUcGvLHt",
		@"dwtqlZpztBl": @"LBkRlwPxcwEMBwaqMVHLEaCXXJPspxCoxDqddYIhlofonSWlSZDDeHkZLxirwGBpCYipRihpEnZfdLUGEDAUzQKitAnVAmCbtWhzwZDatubpahOtRwYsoauhcmwJGKrFAqnLEqiFOMkc",
		@"vwzsNBGXPpfPLlqu": @"vfEqZGTZJTttpOENkwKJgYbfqOyFGUmUPWzlCbfQMvwxKSQpgLDNawrbpHcULlUvSPnPakRnlWAAlPLGrvtJGqnyKAmlkfCfgCcIb",
		@"wGoAVeGvcPEPNVlfXdD": @"TWoScGxmzEHNPSDNllNaPPpYsGpxrUPemlxprzSZYVNRXYRfYvAAmwaLoBIZmqxkusGRQTfFFYuRAAlWUMowTLEPZzPQRJacBmyX",
	};
	return qLRPFYxsaQacdYfA;
}

- (nonnull NSArray *)ommlXyBtRrmNfiq :(nonnull NSDictionary *)YFGnOdelcbmbvn {
	NSArray *HJHJdGwFLcyhXxU = @[
		@"WSCycFdKhDpkCPnOawOshkeNiIFMRmwyAFOtTqFCVcvgDpXHhJeeNiBnUEWtpaZEgTsfIMWXOCVocVHJrBsxhrxOKsnhBqwjKaGkaMxowqSNivAZAp",
		@"BAVnfYuvnRHmDUOKhvnCperrkGxxRhVDaYQcUdYGsvzVDyyODtDneRtJFRvbCjUDeJSIuIdFvGlzJBlWzqPJvTtpMTValAEhpppyVPziaJtHcsyTLO",
		@"PVJXtOmfDRjXjBIbnuXfvPcrgAeWfRXfBTdAYXpIaQZvTdJwXyUZjEoldQdGplyjgmVXEEZuueMKfsndYRfBpfmohOlMVfsQjClOMvlFipKJPbydnwdygjLyUiXIjmIppnfhPcbvKLMRn",
		@"XieISnkAMOFwWlfVzvIpopJCQTZYEfoXLvtFWVIBSNtzogSROEPKQupksJrYSVcAPyDIgDmWyaUjfiuZEZwIIpKmVGcBAWtXqegizNFY",
		@"CDHiTDzdobJCSdjQdvqUsOYhSeRjBdpltORabprhfByHgZOqUCErDkLiGyqgRoZWvVHirXpikrXiYYfweOOvfgGwDnltxmFlaTRCBU",
		@"ViRjjVdcUkMKJSUyxLhgJPaJHjIkbPDoISmgsHPQGEuZjSBJAPxApAFxGyXVhZTTAxKlEcciUABgWnRkzEtstnxZjbiPVEqOZnhnt",
		@"EwBtITzVjgKeUhbdupkHAskpLaBbSScZdzdQGYevcCedpZGELTmjrStSzfOnaqGmMIZXlEmebPdtFtzLeVpGpckywtuqkFSXXSjBkYMYHZXDcmHMCRlYiefrOKqbmeLZGtkDHiLoJNtsVv",
		@"FphWgoQpjTIboVDgSXMnNekWUVYHalTIbPplEcaZLvqVAbNPgAsqztqoZflmJZslRjSDQCfyEVzUEjvuMQRSTMzkLCFTMBkoKzvINbKjjoMcmYCpGnfbxNsBTivGzkKlhAFpOURDJCcJJmaXe",
		@"tCrizxiEfyntaNfJxELsQkUdZTvtfbPUrEdyYfsnkNhEkYAFrQnMPoVfkvJaHGvTqviAZkjCxZCWjXczBecrMuqITiZyHsrkcxXHKFrleaNSKmpwvfBHCFsDZkPNPuGBpmLyWylrRPxrU",
		@"cwgUdpbjRsIaiJdKbTeCewPxCCFljGUFBzcGqJyJQMAQdeUVnZKuJCFbNJAJkLoPVaSapgudDHLtGVYThVCTxkhLmgvxHOntPllWJXzAqIoUjMeOiEpZycNTPsXrLmOlJzOCSARCttGdNzvMnJ",
		@"UruxJhdsTAbMRSrCTJuPnezAFGZVamqMMdnpIxDASalWGttESvgczUnrkwAJavibFSRShnuIpobBCmuDBsPstJvQkIoqfatOTDuTKVu",
		@"KrNGKzWCZhdIrDshUaCdlUQtEwlbtOWChBiEVTqFSwlIlEXYQzBAfNoSBzfftUczTKdAAyAkEEJglrqWTjetQObZHhwlMKCvRFsTogXDuUXykrWqWCUivwQPddTNTsFMZldmwQylAfBiLnqsWbGxd",
		@"wMjxvymoaRlTtKqyXogeVCnQTuCEMxiTHLFNibHOVUaTrVFHaRhLBYnkkFrVNZHjeIBxwqSJSQLqsFkZxGQuOaaJFhoApNkdpRuSAVarCcEIjUEAhZBWPtbAUXRsrzJOFjbMEIgGATbKSoVYBwbhI",
		@"WuqFiHNbNhKeldUXBrmmkKGWyIRBCxvadVQsYrnkdlqgaRtzydwtGUHnuTUmWbvevhxrTBIjkeYlvRmoIHFMPkhEHYXGkblodAkhvENykhgpuxjkhHcV",
		@"HbwoQtsBlOFvSHntrucgbvmHZcOfqkgKjcuJfNxMSpJWBCXQewCXzfWnBlJJTenWgKafUjGAfgyWZCXksXvsYHjPsYtdbmbCpRbritetFMqHcDtsUbxOFIOoOlzSbVzQG",
	];
	return HJHJdGwFLcyhXxU;
}

- (nonnull NSArray *)ZDpdPviFUvoEq :(nonnull NSString *)zbTxzjwEoVG :(nonnull NSDictionary *)rtUuTWCsEXGKhHLmTc {
	NSArray *QcvBAEztSMGNk = @[
		@"rPjvsWrATOBgDjtlJhVLPkpyFKNFqzygrzeKdaQVYLVklTUSFQQwAryxNsQpwBamvbjWStQrnkNWGCSjJqYxRKVhprkgolvEUWnkyIpoKjnbKkEjGskv",
		@"skoUWXZqvlLQLKdIENPFngqyKtSZdMLnmRYGXJDCSgYqNqxNteLPOBAeKabQnvXkZsbxJqyLEvlMztsRidUlnCbdOcDgfuCgBWMmm",
		@"JJtLIDZYQerJTftJtWKmUwedhtQobZlHXOYmTMdRuGrQNFYnSQNeXKMjXnryjwlgGouJLjMtEcZzfIMVRprghchHJBupYCvBPVsHcZaHsmLSxTBvLDGxhpKrrCPNSibUcMOEKRybVQXg",
		@"zRzBlJnaGaEuIMRmCNuJkMixAyMOrCOcWCmaXfhtTCGbfKLuTAJjeCuiYHrovvWRDWEcWtYHnxfQsteINJAtNzVJPQRrSxaXBCnwhcVqsfYfDvh",
		@"eGYnUcykHexKYlttjrAmJbYbzeydPHrokzMIWazEVfibkDIvoSCgLFHnreSpQHDvokWOTGTXsmOHqPoMeOWSHmuoVZhqIajxxgGDLPsOYJ",
		@"zcTBVWlgmLAeseASgYMdIRSzawnuvPoZCklnrdHPMgCvykbYlgEUPcacOUFxJGVYUprlarqRafittlXtpUtuRcQfevhTGMkWmzQZRngGOhELSOjcuiPheMoZlQsiEL",
		@"TsbepAYGXVdNDDbdRbsncTHlOqiwYpObbVeGmFddFvBgLLamxHEqbAGsVqzmNmLHuVPoVIvoJKjODEViYSnDnIdbDhUdGbfRKtJMFZiLNaVcmLYszdeAKknFSrOiBUtYSkYfbbgAPaAfiEkxvJGkz",
		@"AXqYrENMHxgvpalARTJGLXrRwbMAPesazdIdsRIJVYpDSQywBrxcHDURQqFOElDvkaiagbciGJyRHWvDEyHRSXisUwvNmpXLNsbHkjctXKVSjAloNwBKPBFpJErvsqVaB",
		@"gusNYRQCJamaDPqKJYjfOJKSfeAzhUKdOjwNFRlNfBqoratvlwHcfKHyLnjBcQOTbjLWcYeMICXXvXcCseukncrVBYdnKWaSiixjlBGddRBCnUOFnTnmJPBxxJknMGreSsWHe",
		@"DDmIIGQoBHVulELygzeKfWbBJmyiFTKfmRcsbFUSwQVAKyXGmLseKNVDvriDjpSrCpUXeEzZqhPAtpHPbguNXoUgCwRZRcgXPoVWFAVEKvikABWuevdVdEruFZglPBgmiZGBBNzW",
		@"LdWlliLppkYdAZDZbLDnnUPevwDwYrLthkrlZciqSBgfswnsqmchhelArlcGqAuGuzImAcQmFcmGHsGWPyjQaGBSeqXSrWZmvxvJflJFHZyHQfXUXwsLweoeRmZSbpGLi",
		@"JPAsmoSKdTmSNxEbcorFdUiuqShGONTqPtytDLzSlnbdoUobeqLLzzyXqFTRdFXjcydhkNqNXSDClsippndmhHDDQLebmgxOKeXhfPZsjue",
		@"fusuiJilcoDTMtCQLCIcOEKKtAVvvRCZGgMxjFzlxsuhoYIlEVCvnUXEcfKvDeMHycsRDyAFuZcyzLQmnmGrYjbINghkplbTxioeFCnmAxcXrDWPnVhuuPBEhWUIMUMDsOTxIjLYVzQYaQ",
		@"MFFYKkSTxOwdNyujywbrYmhGRoFXCkGqqSLXJDHXhWAVVXuLOlGOKLuahLPpbzaqdQsJymQZaVxAPBoWlLygilTtGPcdmVIbRzQulDzkqfZJztSSaaReoCAGoaeMdoOFUREAfn",
		@"CCwgSEZVlMJVrniOdWfQvtRTMiaRrJoBElZPGTPjkrSNmtaEcdIHxyclStxralqppMvOVeIYbnbcXOyGJXHTmIcjGTjILOIHHGBrONK",
	];
	return QcvBAEztSMGNk;
}

- (nonnull NSString *)HqXtdXHuDlBbDVkyu :(nonnull NSString *)oVTxfiMcXeJEV :(nonnull NSArray *)rJJoJDKQfaPoxjIRlf {
	NSString *BIlmrkTGTUKDiHzjocZ = @"fMwPfeqQctweQVpjgQJWscbcItXnvQenkbScEEFzkaKywwILMEQQbJnTVEysOFDEDsJXJxsQYMINBKeuKzWHNtLRVokrDLEtINJTEtbfNPlgRgIZBDiwRtFJtvubHxsYCLUvMnThYhWZEFzDI";
	return BIlmrkTGTUKDiHzjocZ;
}

+ (nonnull NSArray *)iZcrNDGKrCmJrXZK :(nonnull NSDictionary *)NufByemzyUatp :(nonnull NSDictionary *)BFSPvQEFErFux {
	NSArray *DDQezGpGzYA = @[
		@"YcZmHkIOLCUynOgUKodTmELyqMjvFjnxLGyofYJBysjCeXdLQCyVwhkALeNHUugGPtPiVxyDOubujQjwPudduuUStFRWwTwPhFTBuPpXPOVfNfiOAOFV",
		@"wSdWVhkyVnFEqbvMDkpjwrEDvUJufyJaRfMpONmDRMebigRzuRzKflsznTCznQpRBHXIzJMmRVJYhOtZIZkfHrAAnOXLUlzNnKrElaZgkXJfQLGwoNdb",
		@"deMyqesjwgeBzhHAUSfBPcZgMyrbaWmcxGznKoYLGIYUWUxvSdkKFvDXJIaXugMjXbRymLTNiOKNSdJiRfTaPNCOXpkIXfxmHdWh",
		@"oSOwbuKgzVoZCcOrEHGQhQxEcouyKWvSeMRUBdqsUKJfsIIiwOxTzrWhsApBJbDXSaYmJAjfgyGPizKvlsvLkUZiPOtZgwlUpDBfqGQRKheyfGcfRQPUfbqKD",
		@"VsOaZTHsMgHHYfpEOEXsmKUIJiallsXHxDUartoCOlsQJfUjFAnRHgOVwFDgfeCGMGHScjFRJjgAGuScGafjSduRwMivGRDSttwemtmaCCNTwWOxJCpZbmlchsVeohEhYljYKcb",
		@"lifBQQZbYxUgTCwfESqvvhhCJCoLqixQKcADAHGTfaaHiWwCazQeDFmYxNIDACDogPpAWovaStkZbSHVgrvvhzNeQWVYllWnAZOtSRGfdDAXjjSNgoWXrgBoizbkSpgeWPSmFgeFomXvRkvijXh",
		@"ZhCBUVQVzKuHmVavcHxdrHCzhTgVByLKMwyJpHeXULQGdvlvVeecOFhxSqmcrTtemYFxTIdYQNzcHiARWVVRUwNvwoDTnPDdZQvKTcCjvYWiEdBUCGhpmpN",
		@"pxuPzOBkNqEajVWatBjupCRCSGygAEwTdFORyznUrWivmRaERDipbEMMCKYnZYOXHLUavaIPaNeCWrotgqueZxRxEdYqIzKWVeRQLozOCMNgjszuvQyoQRIYnrDNIcGHKLbEDbsIJFrvckZq",
		@"oFzpDpaOFtMvYaeXsilvdtadzLlGpdDdtoUVkyvfgmUKLtassOyObuWehTnVDbCuYSIvwGPGyqMfwHLnqzUDmdZGtMkPusTKyqYTPGa",
		@"lSFpuyyCnLtTValRdanRkNajfrivDRTfrlGZwmbcHAbWgnZRbDJRBcQRqgrLjxOgkzKodoJqUvmNnTNEfmhdjzbDJRYSrHpzcXhLrwNTXjpvvnaP",
		@"RGRisJYeeXCSDfQHoHReFlkSDgmzQRhKPpliiHzvnLHpzRVluKIGuElADcLicLExUAKccuqkghSeHlhERhHhjByMrApHgyJhBIvBYwPrmReOiEuJmnSFVEuDK",
		@"OAEHUydVVuxyQFDcErleyzNLcfGkPmrNbJznJmOBLKEgkMuAmymyxAseWLScHdFCgWxNkQPXyMFsOwnFmblbGQwDkHuCuJMICyTXqDoWzAYgEYmaYzeCeIheGeUMPYsWwTJhwQQoQWBU",
		@"toTgVTkqIJLuloIBtxLxCctvDEElxtqApbbNiKJlHAoUmqPTFnUPdrWUoFWFoxpvHxhyWJNYNSnoFnDyuJDKKSYLwDMLTyrJTMINgynuUFTppUmRCrnteXXSed",
		@"PuYsVhrjykfRvKJPRCHXiHyFqJltEXbMoqzAYYmmwAZzeuGhGgTqeFfykGpNPAgklYNJUvHXkEkZoUIfZWYOTrFKCfZdnHlxliRskLZEIwvGfUYptz",
		@"KXBEswJDuvfEULSGqKxqJRXqDWINtYuMlqxrkVFUPVzdRmXKRSLTRjAwuQuSGybFKPjuJuZqwMSIOZoVfpnbzAGiIienMzrTjKJwfUYolXjiTQ",
	];
	return DDQezGpGzYA;
}

- (nonnull UIImage *)ubEFYEZekuYnyEnGFT :(nonnull NSDictionary *)rfKzxfKGGHs :(nonnull NSData *)ENOtwJxXAtRCmajc :(nonnull NSData *)RvGvDPrGqa {
	NSData *jdvCMWzaLF = [@"hwhjumZEBRTsGWdxcZhGJKlwhqGsUExSNJycCHRQsgYIOLlAABGDaZIhyfrExsstWfEBkJMQLjRMwPTcbrRrnmKhJoJEYzvvpAQRvSKFKKySrGCWOxiUyxSXTSqRZolDuVzJVqsXVnICiwBBtotzI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fPdTCOcvAdsMaPhq = [UIImage imageWithData:jdvCMWzaLF];
	fPdTCOcvAdsMaPhq = [UIImage imageNamed:@"rqZHOldtsnSLMzihTKlFhJJvVIMUDUQQfMjeYUuJCHbnkNyLDtxKfPhfQWAefkaIJlPSlNhxJOXxVHfpLvqPGBFsoNYqxGgJLhEGUEOAfBEqCoUBoBfOcFiKYsUj"];
	return fPdTCOcvAdsMaPhq;
}

- (nonnull NSDictionary *)vSWSHUVByMO :(nonnull NSDictionary *)spJfGgjIqLmHoXDKWlW {
	NSDictionary *KFNEzPkZerEk = @{
		@"FgOLvRKHJpxCELTqS": @"thyvhGLCKmyDulqRDUYbuidsfthsHXQQnyvKQKWGmTqCuzFHuzosLIxUpbOiZjHXEBLKKeiiDwwPfIlJgsTfcfGcgBBHpnJXtZtU",
		@"ILggpgUYjTrQP": @"qOtSwtJFyXDTVyHaPMRCxBjfMLyMdLpYgWYiPyBmPrNZgAhnRSqVSLDQemjgSfGbAkqxyANdFcCeXdSdCHYZmbrIlaoDssMePrDhXQyflnAooyPfIrivXsR",
		@"gYrRzOfTrKKFiwwBD": @"HnyIShYEWyubuWTrxqwAeITwXhEUbFQRdtRCsvtJRURhFGVjlFYullPUYqprxrkGZJAsOofYIKwClwLAVbeBUMJYrjJdkpCwLIpaaUxebtRFZcAuZkOIYeCDGrp",
		@"XmkzYpPWyEOGYVn": @"ixpnbFOEzQHyptmUheLxuUCXvNtYiAUopgkaQJhcidlBjEvCcWWNGRIGRHdCJTsqJRLWBOXXJpPlDbEFLdjBSUfxHoZkinhDLtkcjiOFPZnCSYN",
		@"HhUxhsMqoxAD": @"YVbAWGIovpvDvJxMUzdxOPGePmGYvVEBSuJqWfDszfLosIIdmnuGbBejXZltGqOoQcnusiLNDBrKhoZdpeVDgKddsyWhglQzqyeEBBJDtGxsYwTHjuKcBMaXUSBKqBbFcBcZuQALih",
		@"woxgADeAZerxQVJ": @"IixfBEoqjFhVNpFYzewyQHxCXmOtxODHkfsgNFUxQpTdofYtDWkLhFcNvsQfqYzvZzZbwAsDxaENvOXQaJezRduFjJjXkfTrnHHweGsBIusqnzOs",
		@"LGlnsRYkSxp": @"itailZiNiFWquttQgSELYsvnTWeuuiZINpytPtjaLTnfVlgeJePCPaXbYFHUaAATQBrZoOGXiFycwofLMrueBwQoKZCkstREIyFuwbfxnVKhQrpfHFFFoumroDn",
		@"UeFBCxrKqnuOZrVWWZO": @"NXACQVtfZdhiusnwSqmhbqHNOLThfSWIezjyHoRwlsdIWarbqtRFkNSingmkZJNWLkNjUywZvcXvXUVJGkJsrwnkyHKqTboijLeyeQplmiGqHUmEAkrluyOTEhsHE",
		@"XcPuuVLPjCtQhrelj": @"aqhsaftbpOnkhhmQTDXBkhNTbyYBXOxzmAPzRaGPUvCyebBewoBljuAXkEIYtnWwwNdrfXihGxkzqhCUYyLkItUFdjOMRXXtWtYprYLXoUnJoooVosfwUjHAPWDgHCnhJaaI",
		@"fGOkfsfVulYtVo": @"ciYYVArLsYWhfnCdwFlJeBHVGwLOGwWEZWFgLVKtoTkYuqyRDeOfMyexHXyPKQEIlNrFnRwvhrCpaxWgRTGiaCUSUFLuHRrDfaghsalRFvnuGQWjNWiruMuMoVLUOVzN",
		@"SFnIwZcGyVjBaOaBXB": @"zIahcwTGBbKiEDvcIdcbNgcvHNmjJDAfpaMooWWraHSnanEzhgjjWJMPlCLzADdFqqkktueuaRyygTbvhRlHFXCBdXgzuWanHWbhQVPNeckRzhvllsWKxQvuzgTBwZuvapmPMVuIk",
		@"SstJfioWUgAMtXjj": @"PjmBHknQVmVQTatYUeXOTEEkBCTNgjTxBODdClulaYnArWZxIALwWGRBYCHxguQkRXzbNGlossTvQBikCkprIBmOeSkFHPglMvcAQGhfGCeAHfLwwf",
		@"SEuuOnlURIL": @"LRcVwJQtjirRuSLiiXCkFikRssYAwvTuPHAunZfgaxkyOcQUkFLtVWhwPBlAeotLQjybKhVyvixhSKmYfLpLEuglRfacmZbyGqUidJRtPocygZbNAprnW",
		@"OZfSNirPsFigkk": @"PrqkRPqiyIdGvHhSVGgUYROmfyGSaITwUmfxlngFEGJUhCpXxlRXaqtONilYcEBceqHJyqYUdJfbgAmmAPAFNhDifAoFECkKuxdfCGVehqFKXFxpjzPzvDrBfORHDGxchGdEBgSYhDyXZX",
		@"nERkpQBNkEDHRn": @"OSXVCDouXGuZfnSbctGzTUGtqunROlWeydpVMpoJZzwDBMutpIzBJclvqYDxCQiPJfjMmSHbGLylBvhLaYvMuQpVwVrMZXMiNHKIvU",
		@"uZKuOXQTkd": @"QaGpzbwyRWKQmQPudiMTEhyAyolLcjZZwtJCTKExgEYfENDWOXYpYqkHQvtfcrDtLqZaJVxufcggUkGJJnFIhKmgBtlNlQhcMeeUIhxFQj",
	};
	return KFNEzPkZerEk;
}

- (nonnull NSData *)WaKbuDiUMZCAa :(nonnull NSDictionary *)sJnclWkzdZDU {
	NSData *mAnZdyqqoClhl = [@"moamofbaefbpLezVWDmmysJIQhkRyVOYwvrsvaHUlVBcFMouyPPtWKOuFIqGypWzBQdbOsvGAgxRGBXMlUyhLhUsjcdYYGYkrhPsBeXSEwWRNvupdNZBwrLSiEBpcbrYAHTthYryPVNs" dataUsingEncoding:NSUTF8StringEncoding];
	return mAnZdyqqoClhl;
}

- (nonnull NSString *)WveRvxsxRmPibWVzPSP :(nonnull NSString *)vutcNvErNTdylSpHflt :(nonnull UIImage *)WTBlrjyuSHPjE :(nonnull NSData *)gwNsdExUgfaoFNenSjw {
	NSString *avrafJNmNyFi = @"erkjjnHkwVWFciIXDRmLAPLnKHRKwvuXLyycKTzyvsybqsfsEdWLTCblxjjeOVqDsxrVYdRYsnlseBvlTFWMeeMUnFEckDmNuZRykXxDiFHGvnSgmLCprnBMVYiGGbWHXobgUDApuOyGkqgVF";
	return avrafJNmNyFi;
}

+ (nonnull UIImage *)aXQkHaAIyYC :(nonnull NSDictionary *)kKnyOyDyDwhLaSxigvn :(nonnull NSDictionary *)aolcFiiHFRdyCnJCvhD {
	NSData *GyKwhIjZYpQUAKsDlVq = [@"gzizzQqtdLTArlCPemZpmdXmgJjMlazRVHjSgdIpzdEwcvTNSHJDGosauCyesOHReyfmAYAPWUmaqEEYKQGRPkbncLHIzdfkvLqSPZrkDEXzrcGegvXVMvCsRsmR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uAHQbWcPjg = [UIImage imageWithData:GyKwhIjZYpQUAKsDlVq];
	uAHQbWcPjg = [UIImage imageNamed:@"cstTgAACRZKwTVIsviOtwxtgzhFPFpvGkwHBJckSvDVAhKmYTGyouSWUlHjCiwFJRtXoTMlCIomywXXiIpTgJGeMeQgFmWuZjXAxtNwynAFbamJDcNhbd"];
	return uAHQbWcPjg;
}

- (void) loadMoreData
{
    self.isMoreData = YES;
    ++self.index;
    [self setUpData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messageModels.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    ExamineNoReadCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ExamineNoReadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    MessageModel *model = self.messageModels[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
    
    [self setUpData];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    MessageModel *model = self.messageModels[indexPath.row];
    ExamineCommitController *examineCommitVc = [[ExamineCommitController alloc] init];
    examineCommitVc.model = model;
    [self.navigationController pushViewController:examineCommitVc animated:YES];
}

@end
