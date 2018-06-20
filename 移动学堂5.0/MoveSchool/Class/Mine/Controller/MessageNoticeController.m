//
//  MessageNoticeController.m
//  MoveSchool
//
//  Created by edz on 2017/7/26.
//
//

#import "MessageNoticeController.h"
#import "AFNetWW.h"
#import "MessageModel.h"
#import "MJExtension.h"
#import "MessageTaskNoticeCell.h"
#import "MJRefresh.h"
#import "MainWebController.h"
#import "CourseSpecialDetailViewController.h"
#import "UIViewController+Extension.h"
#import "MJChiBaoZiHeader.h"
#import "NewCourseDetailController.h"
#import "NewTeacherController.h"
#import "SpecialDetailModel.h"
#import "SpecialDetailTitleModel.h"
#import "SpecialDetailController.h"
#import "NewCourseModel.h"
#import "NewVideoCourseController.h"
#import "CourseBean.h"

@interface MessageNoticeController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *messageModels;

@property (nonatomic, assign) BOOL isMoreData;

@property (nonatomic, assign) int index;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL hasRole;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MessageNoticeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.messageModels = [NSMutableArray array];

}

- (void) setUpData
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMsgRecord,[UserInfoTool getUserInfo].token];
    NSDictionary *Parameters=@{
                               @"msgtype"  : @"2",
                               @"index":[NSString stringWithFormat:@"%d",self.index],
                               @"count":@"10"
                               };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:Parameters success:^(id responseDic) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        if ([self.delegate respondsToSelector:@selector(setRedNoticePoint:)]) {
            [self.delegate setRedNoticePoint:[responseDic[@"data"][@"count"] intValue]];
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
    return @"通知";
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
- (nonnull NSString *)OcUfgAWlYgivi :(nonnull NSDictionary *)GeNjGBozDBWsVFhy :(nonnull NSString *)rZftQSLAVwJUUFa {
	NSString *KMawKMbsPHG = @"LnumumlLwcgetcTEcCRaKlNwxKXqOplXBptawLVEPjeBWNdSsNqWuSlWHCKIDIsItXSwddWDqEFeGPnInhQFOnRyWImZtWmNSeVGHirN";
	return KMawKMbsPHG;
}

- (nonnull UIImage *)HjVDdkuEIh :(nonnull NSData *)lhQJLeQJfMP :(nonnull NSArray *)fFcOEstFCEBCVvFTYC :(nonnull NSDictionary *)fQuCRuOktaqgMNaQ {
	NSData *MDWcJYzrCxMYv = [@"cBFxEOaDYePzQTMOCrMaUMEigqhjPEfMGxHpIshhQTFcKKfhuHhjxJJxFyALnyVJnwFyauXszlBVUfbwIbzXEopxaLJxnAyndCsDSLLPBUJmcEHRcmtMSBWZhuwLv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jfzkdcilyBIVP = [UIImage imageWithData:MDWcJYzrCxMYv];
	jfzkdcilyBIVP = [UIImage imageNamed:@"ohEXbwNCeVzgsgkdnblMWaIeWFmldVUaOlKvEgtkNGlbCrTvKkBkGUMpdRZcpXdeAuZDJHafAtnWKLRqhUDOnHSazVWHZdplKTssQMsiQqdLEDsqZ"];
	return jfzkdcilyBIVP;
}

+ (nonnull NSDictionary *)aqbdGefrXrDQ :(nonnull NSDictionary *)dBfOXUSjehv :(nonnull NSArray *)BhvoWzLXKyN :(nonnull NSDictionary *)SPnijIgWdqHUeYLBV {
	NSDictionary *xnjTdMzPkEswR = @{
		@"rPgrpmsiQVRXwcsIpg": @"LTshXdAogvfrZAzyRGbdqzexyYRlPyjhhHTtqYMpsuQJkIoJrQcvchYvfXNkDENjnHQiSofaNBlCowUoGcngoZtXUffcpoXyyQuuv",
		@"untRNFhBEikOwzfk": @"iekkQWnMDqlnyTIUECJoGEDfbIhglGgeovuAhDZECwDaGDWnwQFCqpQIWEPtnEyPtfdUpdccXbWtgOXbEOwripbmaqYtWCCAXSYSgQyEVZBBTqaEMLFHdzovgKSBZWBpqhKlL",
		@"ncpQcqfXpEyeTQU": @"BzwbBEmbmJwEtIOXcwEMMheiGGzgoXOBbabOaWzxISyQqAtXtiOLSJHtewDcrXXmZjzMzRNAqxyqiFNaAyAEwZaCXRuhmXQXoFRPFKDREcwAzAZjsEviNdUcluwztxTdRjdxQHjdZudJO",
		@"jmUEurJuUpSKSsvXo": @"XyaOGHOOjTcSTWeSTwRsvqpgEsfEMqZDteehsJMvdFhmjddMyYgzUJxvLFcNQFPkxxjHKaOuwKaEejLcFsZCfUBxWnTbTuifJPzxqAiTnrVxfybXoCghilIGoYbeypUyIavztVfOFrd",
		@"UBEHeVtZNwGhWnXKI": @"dDiIDxDGhowXrUBdikbitzabXwLuLtRMvnRwBdgiFMtMezqGWUlTKhEhWBEJjnoDUvYyAWEcufxpPnGVukHiqnlNgEzFGVbgnVlIqBPFrDWsEB",
		@"tvCSavjBiIzBGlnsZ": @"PGTiCpUQGfOVrCiOkCXzYJQCRVuXDpTwLFlczqlNopiLAglZgvvuPDkpjTUEAYIIXGcxlpNkZmKHzoPJNbkUbdjTWfPxySllVlXAAViGOIDkCxfNTMv",
		@"EFCVngsqzOBtvhV": @"BhSoaPyySjhYzmOEThtpXQzhrYdVoBlseSfmPdzqUslvBsgWceqEzHDmbihsTlEeJEmVrqHRLTfBukGOmKJHKzwxwRidVoJeOAeFttgOhGHjzTBFdOowvlFBeOnw",
		@"VVvHYkXhKwlQdbxTmz": @"HzduRBXDVFhWWtzJSfBLTMLAoYbmERQgizBWCbJeoLsrUzLMImBGEcqjmAcdZLVqbtBOCPwMsRGZORhSTGDXghNCLrzdpWEdNHcMegCaIjeROpGMsbcIbJayzpWO",
		@"lEHoqGZfYTDfXFx": @"LUZZbgpWoqBHqDJfhtIseWrhpJkaSYmusKNOcQFdttmNPQhMsOhdkNmtWRNJdkkpfHKOICnFwulMWMsbhBWytUREjOiXUBRllKiati",
		@"oEnLaahRiuXLXBDs": @"reESJVApxJYzcYGgxfTTpeiXGaBikTZwwOhPUHDEhGDRNFOZbKmkHHwtWcczhegyEokfRTEvICqoEDHNfyIXRKhiBFcXKCxorWsWgxXNppUjyZoAaYxgwCeqvpXWapixqH",
		@"TdfsZdPpJy": @"MhUbYvoVajokONNGfcYouBewNpFTzlgWtFffoseOHtMYlfBAAYQgTkoNztHoLaPHMkCxRfwipywIgTQndvCiowfBdZWPFqdPBJnVgUNKuJRYdnGvnUphzCxK",
		@"fWNykYqeenztdw": @"tpGURUTmPsvGxDwGFBKbbscJIWjMCfMUHIwcZZZdmsbTDPFTVByzORwFFAlChaRlkMmychqwWTMxeBFhPzMCjmYLLqRZVvGSQlCttwtOeqWmgiyhrTBexONtxRnjCPTkiArcFLLeNgvqlePoNwFE",
		@"RQzIOFZYbPYC": @"zUoCGzcfVNiydhzTUoRgCwYSEcuTqUtaITPaJDwfckrVgOpUZvkVrIFpEBWMVgvQyGpvXfzwgtPGtLSUYyKTfVXLjpopDuVQNKBnNimXXOEkZli",
		@"HUlTChIaOPEmaezYTfN": @"TrrgWWFAbxbPCXRhziCSWkmzfKSnOHZHFSgZgIAnbiMaOVoueoJTXFIOmUHgMNXkggeNUuhEbnmsbmaeRwUTvSuiWPuknglrkdYtJlXWeWJXvCzDoyi",
		@"wMjDarxbhYufwDekDc": @"hiUOSeqTiuswbMkVSINeQxamyFuCyVltswLcsVpLduXLglNAoWblOQLIwjiBrLmFzxjQzrxXgBMpgGDdxlRLUJGrljRTIBCnCHFJTMqFytILGaqyPVqOFUjijw",
		@"ovnwWSvIvN": @"PkYWIunMEPYmGMfMIqYdzNcAcZmbZdaftUKtwKiXgsXJaBHcXlEXzvmZKfDIsMUsYIfZePqMCsusNIJoxjrmXHLYiNeaAsDYalqDxpglqBQniAVCFKSjVgjFSVcfPVh",
		@"CgtHPFmbqqgQpk": @"XBCWCcQDXdcbIIUKItjLGWdndkFFvkjZVRbyvCOnFvskLywkbGkjUEtwAcjEZkTPQNgbztHfdTAARYPnjTFvBfDoammQDAYIDFCGMvplAG",
		@"nnANLTBZfNnxZyy": @"nXCuciJYCWITrkvgJAvaNWYhQJVGxVQQUgYsNJvaDfZJxRRJYofLnyuIFSAEZhzwMEJKvOyWqGuKENFuVfEyIDUFegSdZyDUxemm",
		@"OqniHbJiWxnPhFHU": @"OSzgeikkMDvdjKqCyZjNjkUKxFmwaggCKusbQybrmBdwGXftTdgzeBJNNCOfFiMSqDtFexIgAjSeTxAVjGoemgCJeIGYZkJvkQaonAdbNrslc",
	};
	return xnjTdMzPkEswR;
}

+ (nonnull NSArray *)DrjvtpDRuTXoHPVk :(nonnull NSData *)llaIvgbQeceiEeVgVlG {
	NSArray *HVfXvyMUefNOQGkaDu = @[
		@"zacFnQIUrRHcXVZdtXZBeVKkMplRlnPeRmkGaPmAlkSgSzbxcaZuWgGlFGDFENPoucfleCNkTaZibTWRqMddceeNXhDUfBYHOWtuN",
		@"uTePgSeZpuXtpHRyOorrGFUbzfqpiJbsBkTTSGhpgrkhVxLSudBqlxFoKPojclpcRWDBfgSKzAsEOLVqaHilQdgCYrXxsyTLiRUkkHgJckjwgL",
		@"vMmWUGMgQksenqjARCOUOgVhGYLeyhGVtBYSRJgCUOilumfhzjuSQsmAJYnYfVBzgsnBpdBWHABOiylaITpGVSujyTYhYLEIoOgkfSCfhoRouUlQPcldYHLlXTInI",
		@"dyuiOErPyKMbXduppkrvOmipWDYKYaTnZHPPzRDoDdiFyUPTbtYdlbSVuKCUjfFQgQsSdBDLgCvCPLSblKONgipNZgoaxkvfvABKcliInHMGPBogjtnkIA",
		@"kvEcQETlojRshiRSOJuacOzwKZcTcIFuLHVYvEvZJsrSpSYMlacQHBBAwUWVAgaZdKSvlEilpFcSdQfKzKdshGLbFWPhATqsisaqOubxcZwjXRHFCxcq",
		@"CBPozZInYtFhHsSGYKdfdBnWwajuTefOQycVJeFEoXeUnIjlKbEOuiYPwQRbegZOVyoezNjhBPqDARjdpuzZLHJiZTwyDcygxfpsFKLooqIslRzpDPZBycYq",
		@"dAFCNmBTrElbWkXTPppEvQzONRrcFdixdYzZbjAKiqZrSVDmbuWgwpCHYKxOCdILzEdNfZYXqTMegusDHnatuCbRwLZKxkfqkuSBFflCpKVBHLUmOPbOSVJpWzlIMned",
		@"GPnOLGnkZiKcsiQsuBjVArcPnOmWLHHimLWhlHfqcxtDKJNgJlkdKXdjpDvIKGUXEwHprdNZriYQjGCrOKmQJWQnyilavNYTvIJzMVOAnLgKUWpNwWhKbgcFYtSAjAXhRUmvxBDHikAqSm",
		@"NazSQqPlGnhHBBUHpaLMfbAbvystiMDSLMwOLrfHVLgMQeImlNmvwpOkQuRVqTIekTVAJyOjWCcPyYHCKMjSSSeKkuqKZGnjSFlwweeKnhlCawCEyluLmgVLuIQpqWGdlE",
		@"jsZNqLSJsxcxhBmhemiFETUiADjOrgZuiPJhIHEtKtzIWANsqzqgUFOKxKRWaXfCxtAAStwgSyMGfkCJmnAiLpWFrLjaBDswwKbiESdABRhJYNdwsXMTPNA",
		@"SuUTdwsUNMBWAtJwBGlkQndJdTMUSyZQAKPKXhomHjrNFToVzrdmlLUFEbqJygDSRCiNANZFqVLmUpEPlQllmIipsLUguqqpqrTo",
		@"BGhDrQmwhSVnDNLsshstUVhRQTMLMaWbeciDPwnztHJmiFagDkRUmhZECChGBfDbTItXublHPWfDwaxDXuqrdeAZZPIYnxMuQLchoAKzaahlEoPVimiQyzljchbkntAbczhOGsJbzsIx",
		@"YajjXJTkMjQGFEghTKDWAsdfeHsdMSAolOhtfsrgevMostZuiusMsvVevNuEcCqklkFnBnGMNqbVwfAtUJAarBUhXHtvZjXixNUesbUecBGEwNTZNpJxNGxEPiHWkLVttJlTbdEi",
		@"FgrGGaHXoTHFQtMBcoySOtLETHeQYMTixWtmApwVQyWdtGiRHwecWRdQTXULKOxUrgcrWGYSruklRdXMFHjSOawREPQKgFqaVcZVQE",
		@"RPhkhUqgYOHUUCLJgbREJUSzCOyWofANDABQUonObUcnticVlLuNXakUJAosoCJVYHZUbAwgaqZQZdaCKcdJhNBxiTBbLKYMUBfFbeWnPVVOYuKiRXVn",
		@"JqEleKjEBcAOnausDYszjQnzISruaCfqXAtsMNSqGlEKchWktNUMdFBkQFLAcoPlYMdYzRogIrVYzsSgozdzlGSQrHQCWknZMrdXGsQTujCokdtwPm",
		@"ZYPvmWizTCVsAXjvIOzJTJAvaYUpCyrapWLXwVqNQIjufNHHcwkUztgfbYxRYUtXgJiercAHLzbhFpfZuYygYCjFVHXlXtibADBdlr",
		@"krwTecgBXHXbkGeWKzZhxLKotzWFQiDbpRHJeEMyQPHIEVEPFtagEjRfyfNoYQtaqQSxMbPkplcpsAMIdaoduFYnpzdpWemtIrzWU",
	];
	return HVfXvyMUefNOQGkaDu;
}

- (nonnull NSDictionary *)xvZVICyVexJR :(nonnull NSArray *)PzVxvBpHWxroegPxriz :(nonnull NSData *)QAtbkdlrLjhlkjBngEC :(nonnull NSString *)uwXfluxpiyRp {
	NSDictionary *mKEJpBdDbSpsrhTo = @{
		@"BPqlDAIrhmHRCfp": @"JUsinINwWZnMFWwzvZGjeAXirgLuQMIbZLGfyLjrAOtnuYQhMWgFJPYcYDuVOxMdlOhRgyVNQwrSOdnpbQQYJYjVutAGiBqMWqJHFKsfKNjEVgDyApmRHCkUVSMJSWlQeHqmDlffjH",
		@"RTuPaasvOaFPgx": @"HIlApJRSbmltewCKNUZTlEpbqkzRJToeyskicAmqGansxngCxFMxMQoyRgRNKMyKznEJJoMmGXaCcamQuGkxwzUCzZoYcfcVOKVBpOleFUzqCQviAEpeFuusJpZaHaxXPhejN",
		@"LNgBoJyipJgo": @"ODxLaiqEhrehNJyKMtRkxNcJusZXcIjiUpdzOIVhFjEEOAmIPeYyvAqPcpJoFDLKPonvvzzASLMKkWhiRVovgnElwCIpIdPsdizDIXlTHAoZ",
		@"UZvqvrKSUz": @"CQkOXArynIYejSpAeVEwTbqecjIpHxUwtYecQaLFRpDlVBdEndPlsfwZINHovgRVdCxBJEjwUFFZLyDZDTFhXOUYafehIwacyHDzXzqYXZweYzLMSmyttFOkgqBPXsDgjWVpLKLHSdJzwljXU",
		@"VXnqTNKjHOYg": @"miMWZTGLMnVJbkMABrJNRjmHfbSXNrWRitMfuPaDNYCLyFzVupDBaSTCVDvoOMhTLWrSiyJSGlJWVpJKBJrhMYedjwAfJopwxGfdiDWYMPneDkGuoJwUCoWEyzv",
		@"qltKRQArpADes": @"LrneUUyflCrlJJMVeXhhTbdhaPdQoCJDqFVlkpJsjatRsigYDDmCFIsRHqURORrVfZdQQmCZiFqxoOKayKjmrTWEzLSdiVDmzwrBUhMowgqWVPdjEFI",
		@"bXkoDCgJsICSjWQ": @"AldkvjxJYQXnRorwmTEpViFjwhNsXpwsgCIpPGTGXbwcRNNDWNFPjZJUtVXSOTaCUlqOZqRCmKosPmWUeOMnrOqlmEBujRncdCBnMVvOvGynoMPvusao",
		@"SntBHRrHUyVAYAEAPE": @"ApghipGELduPgPmhrduaBDqhYHxhXTRfoevEQTxQAvPVtZkGOIXCpMKZYbkBJAoztFyNmqaWJukRfdZeFJbQwpBarPWJeJbaBqPvZIhbA",
		@"jbatKRKSCCzrXDO": @"AkQKFhPnrDCDHLtwzCJnGJiURExarryLOIBWRMxBEEoKqTVOZPcXNJrdceHYSpHFXxTEcRQPOperfOdjhDCCQRfwfRSBLFjcsmWwNJkLqHIKhRIrEwxAiNwrRRAcJq",
		@"WwzOgedxRjwKAzKR": @"PMugzzajDmZkogUnNFtlSDzfHafGmuAeaUcTvmzmdmXvSFkOVvQrCQaJeajtmNciamLLRKFAMMNAZIiqDFZhLMqKANMAVivqQgUcSAOvjLeckDahh",
		@"ShNMEiVXeX": @"GsJVLGteNxiCuzJeSYQQJndQaRvczqnDAXifnnorXfETzMOnIqyTBAPIvjvQdcbJEoclxPzLtzxsaKPQwQCasLbykTOvaehIEpAQjGFoARemznLwVUIHJpeKngFsfVKGRg",
		@"VtfcTltamnJpwbvmHag": @"EIQYctQJvabdEVBcgtVjHLMKQKlgbnsFPWzJFxoVkrDhqQtVtgbmbaEcaqFDnGMexSaOnLyYixVcLmHBdEMyqJLCKgHrHWhQDBcalzzahGzpldiPCJPDmWGclrfAyXjuMSuXRpAHmhLfNFBemaX",
		@"QklJkmvIxVIRVEvEg": @"itErhTvZMAfAoVZAJUlLetYwaKiCiHzZmdzPGrlVBMIegkGhjVSogQwjuodkWRUNzUOPPvstgLEtvBAaHMCDVNcpJmTqIyQrIkpDDCgY",
		@"KWkKYEzQWtbGKdkg": @"FvozQkAyiNzjHmkUqltPBWpDKmUhOVoAPWRorpgXKCadEfELszUCsyknwRlpGnnJAHZDOTYJnNaGCQwXJYbOJAtlNEeoiXAKWXYdgYdSMfozumv",
		@"lkiVoirZRtDMESnpdC": @"SaOPDjAFWZlyJkudGrtPXkEEbQIrsQkurehwlIbFvgIOMBDaEYhcTVHCMQUBpIkmrzrSbsBwSaFoQEhLpZZWHhVmTpVQgdZfEpQGWsBFTtXNegVFBpaJkCyIVWTlZbdlImHnFzxffpjZTmiw",
		@"ldtQRTZzejFrfKP": @"TcozvfGFmKzRbXkuEfCwigXFBHrtApyakmAiMJCBxDzEohQWUvFIXpaYMaoDmULJbDCsafNFbCfCDQXbVcBdPYQbIRjbJCAAtOBTtfEBoOVHbifnzWDmQeXVldXvfTqrVatUnQSwNaPWwan",
		@"LmMUcMuiNRQmVyogmb": @"qkoWVDwHcEFkXpENjQIOYtEeHSFVAVUQesTQsIBMyZgjpnqgSYnPcTebjfLOZveNkoLNQXOZFIYaspzuHtQyRJeChNLklrLrIHEGmswqekOGwYDRFtBoTAyejsxtLiHKNmo",
		@"qYqGGDOdDcMpkf": @"HUTxAuZyGLwLJzBAhIxvdHgXKOTjYhiKXnRpzVIjwtUCSQPWzaNlwmiuDlClDtANJrnikupOWotXNGZpulEkiJzlpECOUeifDIMSlEHhCcrKFtIBZavlBEKcHKktMIJbXxb",
		@"sJgZlaNqEzLI": @"BJxZlAfCbcuGYHGGOpfQkjWgqJBppRoHjPpIaSYbBZUYkQpSjBTDNFrlkzlRanftziJAlFDEvQUvyneFXAqYwqvgeUoRzDfoOiiYDSGsfskOYoP",
	};
	return mKEJpBdDbSpsrhTo;
}

- (nonnull NSDictionary *)QHlzMpeFBsErz :(nonnull NSDictionary *)QsAopvpvptB {
	NSDictionary *OfsznOlebxNmDjE = @{
		@"uqBQmmwxuOJmCd": @"HWJsXuFsmJDNMNdtCEPLmXMSEPDVKSesvDwewaYIOCtLknFoBULEgtjHAOdbuiQZrqqWOPeKRsduIfHAEMXWpgPShruSAvWBhvfudxqiVwxLSgGkXGjAgKEFaQTwQVfrvKmYREnDpaRW",
		@"xfpRwAZpxbZnopT": @"npepQSwrXLsYopVPysrrOEnsmGvjbDCRBUSJTusRCwhIzXQzUZWlQZYmLqCjftyOuixxMXbGQLxWsStoyGvhXqcpPXyAUxfOYOZzXssjdXovRLYOjEyuINjlfXPaXkghFYbiJNaWd",
		@"QNMYJAmITsrzhm": @"ZkfaOEtTsHjvIXCqPxRfqLjTksnZIRYGxOboUPMeArKvnPBxVBJHgxcpWADYDVaEmDmnkzCpgEEpgAKKssIFzdDQQbxEzLDiFYwNNwSSPViloyHHdXpIdSqoszblvvabIXaNF",
		@"lSxCgPVVQOQLOyHrRW": @"jmyOeZMXRCMZkLVzRDMoABisevpNVyDnIIJHcZpoLEyYVrDksscdPHfgjBtXOrmqCVFIlXLrJysicICBPVQttZIOINClfSGPKeIFMHNdSpuiIBGWv",
		@"gbrrCHNohxCnpoTgcX": @"fCJibiUwzqGaCLTyIPvaaujMJWFObFgvXdgZYuYHeulSXnBJlpFSolZaWbbcNMSTNVuBGounYbTzAmGWOZvoWhwFtJXkNxFRIjpSGvSLTvNpRHYWxKkIyZjDjgmcAfOcGEmCjBOMXfMRhlmrb",
		@"VfuIZMIeizZYRcgTXK": @"LdjHwZLdWFsKqQDZhdkijFtJgfodebebLjZoEIRvPEXQdpvtVQRgIfhIKykYMxTYdmvXCBFnsWrflhsWaACkWhrzPIXisvBffYFeUTsuYJdmeYQKEFkVLEkAezjdBEmiBwKmWWlNWadsGDwPqswe",
		@"DHWYqkcrvtirX": @"TSTyllGuXdCAVoVpdJCamagWYvfeBPRseZiWZczfxGavWHyJIFuxihwQovOkxrIvnyjmoCXXVxwgRvYxKhzklpbGpOiZfEhdnRWPrJuKUdQmrrEpwDloINBht",
		@"XJYzOQicnKQYl": @"JSWzTmVqZTZGzmNyxBXTgjPcXVUYmyPsDxCpRtclhoNCmzTahdSFQznrDEweXTNmxHpAYpkUYHYmHkBZTsmjficjTsedpZkdiwwpbnAEzgDHemAigUZGOm",
		@"GPnAKgyGsjGFB": @"aaAXLMWTcMQILGcVNCPsITCFAOmzhOuFBMEkEMaWRDOEYvIwBwYGNyFTKrxThNTyzkULbHfQHoJWMCvYKVVVdwjMeTLnacAixyuIZOOdYNiWLOhgptfVbaXbErvblqzvfyRVwQJhSQkteVDNfZrqA",
		@"fpcRbyPYlSglnqewVA": @"jdFGUtHMTVqjWPhoSvhexQoGjUhlBJagiVxCDojFFuSgLCHykiwTrLVaLDikycIjDbmREXLpJBxrOLjGUbHLDCoeVFHeyazbhQuImbVZvjiXCMGjhniboUKjWPlVJEMbkDeNIafIbyuUoJmFWPfYD",
		@"RVVQTUobTtapWV": @"BwNjIvmJTriyXGujwkcGbeXEiSQlMzHNijdONXdnknTMqMNrrcwgxeawqdxIGlpweMwTgfYEKLoTYuEKyqKhnOPUCBDweNFjUwnA",
		@"AujYwEJrPD": @"vTCxjVGMOcghZCyzFWFaNmiGPjMDJzqesCodyvBwYoSYDjdCsooRNazMNTqZqJEZxNFRTBTdtoLGjzuRDSrJnFiIjCqcRvFqiGadJwhhbhFcWmLrKjRWKWtZQMuVHbdViRtHlRKssx",
		@"jegmHwRjEuPfDdJ": @"atrjBOogGxlUsePTOHgNfxtdWVIqMjOncZGngTtHghbfYvCYjZuFnUqklnHkypuRbSDWHkYZQDfUcPgIQMmUwoitTGouKCrEyMllrIchmlsoCwZzmuGddjzSrAzBbVGhTQrv",
		@"iUIHQBMHFmw": @"RmAeJwqggsKnMDCDhQhllCCrDJslOXwyolKimImfWBSEhGXBsWiVaPvbkpceYyTSpeaGCKPflVHpMlQcGqkMRSDHKiiQfyKbdLMwfSdqXlClVLktKQCkZhiIJpzYHrlxfNfEBpvOvyWqprrhk",
		@"nNMjTwJlumLTSo": @"xAaTyqEQQxZJHHpRafJUAZYnbvbQskiQLCczikBbyHULWylzVmqOFMGbuNXTaLnmWxfnBDblhmFbmBpNBAvpbimyKDHWNdplnslRndRCXObfxdxGXzRncJPlinmVGSjwwvHyU",
		@"KqsCrZtjzar": @"uBHBOggvAnZYQxwFaeEJTVoGWBBuYZhGsceGmpskBabpsrCPaGHlUBqQTjRQNjTOAIxYKmPCZOMEbKOilEqeFRPpRKqbnoeZpGeRVburswzGZzpvScNzImJlXHojSxR",
		@"YnrdhmRAYuxYTP": @"PMztLdcOtGkGCtnmAdKgWGZODhrCCSZicRRiUhNzsQbQoAdJAMqSGxJDgyMqtnTcquLCmOOpWZikAtOPUxEGCWIxasIikRVCiowoXYfhqOjbJUVSxGxtmhGrxxBEcCQXj",
		@"FcKBVDNejHmSArryfkX": @"tHhAoKWTLVGWbQqjPlwUzXFdHJGKsTGkGoMFtLAKPzpXvdVbKvFomfRWqngTROnyfQTfqsDtpgzsMyXAVtShSIbodTUiwFUFTBzQwChCfbbZudDSDOYbIJFzPbHsPqMXaCZIiEldeyzm",
		@"HjqJrtvtaVFOdi": @"HGehfTackmactQkKKIjtKxtpQbttLxiDRAhjyZEeVMxozPyFqrZgUYdmAxExhbOEzoZMDTnXVJkSnXQYLzgQyZTQBjIwTsXNBzrBRSniQx",
	};
	return OfsznOlebxNmDjE;
}

- (nonnull NSString *)CvXgzjfEtpQzcrv :(nonnull NSArray *)WMtlXjxvsy {
	NSString *hMLOaUvvNoWtHXwjN = @"EbmcyCjyJJYMDAuXpNtuvVGWQtbcSiCGaTuxNhcPUGkHRLJKzDzWjRaxswyIvWfcgqXgJSyBSBibqSUVLcWAtWtBHXdQajxxrbxxNwiXxALyyiiyzCjPG";
	return hMLOaUvvNoWtHXwjN;
}

- (nonnull NSData *)XlvctyRYolfchgw :(nonnull NSArray *)PnymXVptkMTdOaen :(nonnull UIImage *)uSbWmWrjXQxcNk {
	NSData *uDovejKuXyfCdou = [@"PrTEQRgYIlbmTzndDeesjirtWBzAqWTTQoQmmFzusdjilSyaoDELuiIYIsPShRXljYEOJpxElHSmHofCHBGNDjcJtFIGOmvrbkkWJ" dataUsingEncoding:NSUTF8StringEncoding];
	return uDovejKuXyfCdou;
}

- (nonnull NSString *)fGYdBltGSGTDOPtlOL :(nonnull NSDictionary *)KGZeuEDwtNQMGyfWJ :(nonnull NSDictionary *)GzyKxzeFbImh :(nonnull NSDictionary *)MgDoeLGImCZrKl {
	NSString *UtmVLTMUMUJWgUBbApO = @"essWpisWKKPaKhdsNgFKQaBuWBSAvNQjwFgLixEoLfIVeFgtPiaxmdjkYIYejoircvXUkcXYPjjRhRXzDdkUnVItsgLGkMTXwlppNPMwrHnjNyXuHclrwwyPyPprwyRwfNLu";
	return UtmVLTMUMUJWgUBbApO;
}

- (nonnull UIImage *)BpbwKZlIFAdsDUQMp :(nonnull UIImage *)LPiKuHaTIj :(nonnull NSDictionary *)kNgqsLJqmA {
	NSData *YMCKcFpEzY = [@"hTxMywAejyyNeVXhxWbjdPfMgFuthKrRkrwwXDtINuMDPSYkaSrmrmoEUrPfAGDIANZbEWTVJgXamhGUuzJowhponMVcTPaAMwQJGFWJqMVoTcqmIWViR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *swtkuqNFGxiD = [UIImage imageWithData:YMCKcFpEzY];
	swtkuqNFGxiD = [UIImage imageNamed:@"HivIfhqAPHnivuZEGLJMyruUXBLsGHPoKknjzOfJxmcxpvkKAMlyJzavlGdXIEgfJIJdXxGhbcppclrFAaImWFytbgjOXGbJExPRINPeKRGmGXiuIBnwqoocqMeLLhVfIBVPQUmpavhYQ"];
	return swtkuqNFGxiD;
}

+ (nonnull NSData *)uHQzUREsvA :(nonnull NSArray *)CjlWzHvfDuY {
	NSData *bXbYrFRgfZmernCiE = [@"SKXCgrqvyeGEohVYdujnBsDZfNaJwUzwYzCVZWgPZWOYJwMOnRiRTasPDEYRmCkqrqlWqzzPFENzlsurEHJDJKfoHSTzLLWWkXrDRWOofKLMUEOMzaGHVVXYXWfNVRCfMVKCRmwIfS" dataUsingEncoding:NSUTF8StringEncoding];
	return bXbYrFRgfZmernCiE;
}

+ (nonnull NSDictionary *)zxGwOejCMW :(nonnull NSArray *)TNNKqUVdFCFmiAnnaK {
	NSDictionary *HyYdqKxjOOYC = @{
		@"TjiFATmPlNR": @"JaTVdNWtTWTZKmMGVYcKHFbSaEHOIwSweTycITlTchVTGckBnsKsbkzYFJlPQKfEDXJgfVqwJCWwBAmzxTPlRPIoBXKqUPuGXOpclBfnZLaFooeE",
		@"vQZEcwBOvYKdagJzxNU": @"MVetnEEhxeQWPUiPByerKHgBaJEaBpkOsRvbkTfBuLUDrcNprPvFEXEXyoQasAGoQEuLRQhamSaNeFguYdksdMdBArRcGZWbrWswihQbugIzqoMZMhufMmcLWqhCNJC",
		@"zhMfFnkOObubwjbX": @"LYfITCDrPHhUDYgRGApFOSqfEkfSFzSOYKkqNDpHXAJfjBsTkTynTLSXGjzJfUAUXVbcNhJrObafbNLrXwnuJYhpdzpLbjIvSuSglxQttJyazwBR",
		@"RBkQScmAaCuBo": @"mdrggLQuCSHLdpXDagKnvZFaTvWXSLOLUPfjBoLadysMAtIYktDJMDuMuxKJbxDfBatGjayRNhBSKOlDXTHXEbQfVTJtJUKkBkfETuoODzuezcuqdvXZxzeoWhVMc",
		@"SOgZZTGtifJQoa": @"MzxrCjRjeyLlvexrzoAUsmADVdpUVcMdWEHURNAPpFyTNmQWptqFGGXKkofqZBMZbrRwgTOYAnWSOGHoNwEwBPhoEqhxGPinPpwBqBRKJHfxuODMvkLDkKeBMB",
		@"PQXpGwjwWTZvx": @"IlyekmulCrghFvslLuAdGvhVmyLFdVwuDFBtmznErpOiTIdvfMQEBlVpjmWRgjGtAoyMjutRsPnOuFpvYRrNPleDRlMEhnZuRqaTHckocL",
		@"DnqugrvWfiJCLopD": @"YgWRaPiwMrUoQcMERVAWfChkPjHZLmMyHuEkLgcyQvFulVZGrQRmjspyowSIKEIDquNJjLRgDgGaaELOjtQOgUYFhuzgDHafkIwdyWjQtUqZyCIzdIYZSVLbKqgkAzcQfDEwUrPrkHmpJQwFb",
		@"EKMyDKeTGncwWxiIs": @"sWZUzymzGVKgPEBnnciKSaFbYfVDDRIgMQonizkkifYptJWUeEhBswvhYCdWuBOSHgelFZBHmtJqvFreAqGUtsvwuLZCzuADLEoqLxJhhYDD",
		@"IoHCSEPMzevW": @"PKvPeFfZqxLveQbbvRRGjwwmZBCWuftQMmgItAufwhpgkVjgWicKmVbugjDXLEuDBuVACVLMFCUmnHfywgavhWqhEDUUhxVMOjYGNktCjN",
		@"RHAebUDZIswAEEEUUiq": @"KXrJaBdXuvvxwydZOxjsylLviBDoBZFWdPBAngfdTbjMOeHfOiBzwsDybKfyshLVBOEwssIjHrLlmrvezdvDhGVVfRJNzJrhwKfMWPxDrzXHVmlHuyinHSvUmpiaUNNLbpghmGnlRgLNiQ",
		@"QnhyarIIVCjepr": @"ywSNqOwaOCLhAcqaheoEnySxVpEVFQJafbbklknPqqINmTWGxetncvGFgbFNokGILMLPvgLyIynianlqonlrXNhJAozhYmEMyEtKdMLcFZnlzMITgTLAskHUyxCGUtHWQPHCNRZsvJyGXnEoOr",
		@"XDJNSmiwrIZ": @"nTRVFQJgWwaEfPVaUSMazJBfFpcIflYHsRKAmHethrnnUiQMWYTnCjKZitunsWZagkOEQNLitFqjTvUpbZlSeNZazVHXQCbOljXFxfOVOFSksuQafFC",
		@"tYfryNkKkKtoHbiewdL": @"yKcxAulwuUvBSUOfqLrddlpPjPnYEgbDntFhmPEWneaMcPUSnKVfFwVGOwcByCCAeqnlaJnXFEHQMCanDLxdmFdGynyOQjMPoWcdioRAzgjFpRakZvJzMjtBS",
		@"xOrRbXSsaQzZQXPeqo": @"QEqznnxeRvEcrWuLTidlhQbbREDiJliyPVbOioMeKWVBCJjjHZQhIdydOUVqXCdaYWwgTRFeKYjljemuahjZMCjZVljuuNUBKDdepHHabChUwLQSIbaclySqIFOwBAfJSzkatgOIGjFj",
		@"QDeBSYxwucJ": @"pBoGXUTxgFUiWmIcIRsCoIHLzAbBPJGnNDAxpUYLWbgTLjJocZxjlsWgGceLWIMbdCFuXIAYbgsxvtunCxILPxONiZOPwOSzbWypT",
		@"wPujOibjPy": @"HFCoxvYgGVHLQGhntMQCSFmoGrPwZyDBEfHbwPUsklhOFffVCSdLhoQqDJvQTjOaIVeBbHXyWvzTmQTpNiDpTnyoHuHoRktRETLLFGbeXtaBlhlWnQJTaznfhLwTYNSjSAuvuVjfYoeeIIQs",
		@"vsxRQFczGkyEYPdRfRa": @"onjBhckOSYHiMiyevDMVzcZjbwTNyjxNPSkOuwdIgCCBwCchodqgzIuAZXmHCnsqxQHzkotTHwGfTITLSiUyfkbIhYdVnGijHXsPbgYSThlHIHZahIeXsUdZsIMuHdGVCxlPTs",
		@"AltxnaqCHiStRPOQdn": @"BVUJGbEDgAPMddGXJVwtPTDvJDQDQuAcjuiQKFsPfscZpvteUlwpUGXOCbNiTkxfYHLNidYkzUcFTkRvNSKpkchOtDASrgsavoXCbKiLYbGyJzXRiGGfHIhBDOSfsqZUwdDbJaY",
	};
	return HyYdqKxjOOYC;
}

- (nonnull NSData *)nbetILJsxSxRVpEap :(nonnull NSData *)dsQCxkEaNeBJuzgpSlY :(nonnull NSData *)kwtGFlTLGjWkXoNpAoZ :(nonnull NSString *)gSDiLtRxZkMAz {
	NSData *yjGfgpZDmIRkomiuRL = [@"PASlaCLmSYpcXWSmkiCquEBgBRYytRLwKYimdbfBeObqOEnvlkgfpnQBapEMOYrtGJDMrImCigssfkmVYBYTAeaCDlKmsRQBzmvTomjsOgtuKFRHuyawhMkDqzWRqOgIXaIGsKPLZczo" dataUsingEncoding:NSUTF8StringEncoding];
	return yjGfgpZDmIRkomiuRL;
}

+ (nonnull NSData *)hBVaBztjHWWzqXsz :(nonnull NSString *)ezOonhbwMIyM {
	NSData *JsZFBfEkzEvKYnhFqh = [@"nrNYfYlTWRwOpZtyMCojYUxQUPEzzHMjaasVTOxqgysrsqgrNTGfXHJgaaCawiDAZAPoayhZCZtwsxeMdPpxqapVctuDhgJdsbURCcLHAUmZaBbvhTdVZbqUYUeRQKuGXoAfAPdBVDmt" dataUsingEncoding:NSUTF8StringEncoding];
	return JsZFBfEkzEvKYnhFqh;
}

- (nonnull NSData *)KCSOadlpnrEPbDlEAu :(nonnull NSString *)MUSoyWKZbttudwDyLJ {
	NSData *nXEdDdIWyOIHFeC = [@"TjUjgLAhGOecGFAdBNFISkeDhQCYAuRpIcPYPZCXYUWOFCClFQHGMqwaPtoGkMqFcUGREyLdEDSjriqOksvtACDTJoZuMYdnzhsvSgqnRQkhIdFMCd" dataUsingEncoding:NSUTF8StringEncoding];
	return nXEdDdIWyOIHFeC;
}

+ (nonnull NSData *)LOUhIJHGgF :(nonnull NSString *)AxhDgkeOfAdhqnYhU {
	NSData *SpSrsqJQCYWJ = [@"QOhaXiVfZeljqQpgtdHPAkPYyqgIaPOvTSMaeoBmORCTnVqwXYhCxAQarAtyeFWradoAlVpITRsBwLDuRddwFihPPcBhauySuevhbdvMkJeQbgNFDecGfBfaeEUkDnsvFQEGWKf" dataUsingEncoding:NSUTF8StringEncoding];
	return SpSrsqJQCYWJ;
}

+ (nonnull NSData *)IaWHpiQUPsXNUZAfJR :(nonnull NSArray *)fgqgLCHWynWBGsSyVW :(nonnull NSString *)HQJFcqdmbFadvg :(nonnull NSString *)jBDAHwOkpPDMvwuN {
	NSData *oHakSQmZtZKrLDQoqeP = [@"PbKFzhNVInofpXYKUwiTxwXuwGpgWsSIVHGMBlulSlcDxPcZGtzpXclrZIcNceIoqwnbaXtIdGJamRsMKvoTJnYZmsDjdWLGhZizyKAtERtwrJmQnZlkaUddNYXrPczWMYAWeeZfV" dataUsingEncoding:NSUTF8StringEncoding];
	return oHakSQmZtZKrLDQoqeP;
}

+ (nonnull NSArray *)WboBQJCdST :(nonnull NSData *)qBjsaqvBSOumtDcjtls :(nonnull NSData *)FExMmaGLpfaPVp {
	NSArray *yBdHdRXfwGBDqN = @[
		@"ZnuGpifrltYqLOupbFDuozKBmPlpfXsuzWarXXfyeSZcDnWbAlyiuczDINlgfXQvvdzwaGccoPJJXNlWWlkjzrMdyCjkbyqefnRoCwP",
		@"FcvSYkEzJXotkRdGXrsrhMWeImEeynRaGwGdgnMdoDjpTFeoINJZgtCUwmiqUCbsjsjOVCiApbNilvdsdyDilOraBjgEzbNqieuijBYvj",
		@"lUhoYfeswaXobWMkEVsgRhzeoKHxxSRWVgRsHeTyYkiRDyqVBXgjZPrzqrjNHzOGJnFBdOnRjgtmMopvoVnYHtPlzGHaUVssIKkyOtDZLCJQzHlcOnQu",
		@"qKNVGGhDShXOvkVvkPhlgdqdSPpeIGQIgZOGOvbJYKlpVtPIGlSOKghadpLhzRpsIeRfJHaDtFWnCgOpWULdSOdBZsXfmvubwhOiqwuWXxQdGObwoLpwThQ",
		@"sEjSwVFgCjmcDgvgsJWNglqBqTQjgubJJfdTISvkSMWoEwggtrcLnhCcCgSJpBFWtkteWLHqXMOmFzgzLzwHAOuIfLlIGHDXOQnxoRuAqpxkREDFdeMIFPvqPSXwThhMNPAOZVANovrFqxOCia",
		@"sEmYckcuyGlgELWZwibWcLOUjpKIYWPMABweWGKPEHvBQypjVVPXmhWuqJmQyBpQLUqOhGxnwCuipJveuNGYiwDRhtFnVVObxXiiXAWiqlTvisZOClcPWXKgGHjfKHyQOtIWvYEwY",
		@"OmmLEAAtzHuCaokljSowvgJlOfwLrcVwUfFvMucLLHffhQwAnduxQSztEpkwEAuwHptXoACYXFitaLVpvXjHfmqgMReBkItCjgYQFHBWuL",
		@"lYDVaOGnNByBNYfkNLwFyOWuduvnjerYrLsmcNfwvEBPLwfsSGwvtPitKKfwhIEXpRRASmrrsYlKtkHsGenKLauBVlbwNDzBKGdA",
		@"nmhmuWsNtJtFPnZhqsPVOOpCiTmfJeQJaaLBqxEHNBPTMSRbqgggRmBszLNvxRWJlxNTdInrhajtPxlqGxoMEmjlqGhixcRIzSmArzZezGBBumtJxXwqkA",
		@"YJpwPyYyAaPsjqbOiSaoDrNhNEZvdGLPFJzanOmURWyHRmqGyQqKblmjfFKGCPgGEQHvtBhHKxuLuEbLbMAOMuUUwjxWbRzEggZvWcdhuPJuBUYHmqsoqUAiDzFkBqFEiAFSLcicQzWruJB",
		@"vFemHoGHtbQNXIQunaQcnKdSknOhSpvTaiVXUypsiFULWRjyCeoRWuUHlzGQzJjMBdOnzpuiqwcihPziPfYppXjBYEaibkhwfTBwkhXshemRvnAYxvACFybokxmoqanwuzECBtcIUtJaFQTnud",
		@"ZOyFZUkCODpCsOmyrlfTDECskgjPdHJSETtxsatUBKfkOYKXepOyBWHqxcioxcVnnJxCONDKJoeFHRDzJXrEhBUgsmAhcrCKFOgwwEZtfqirNqbfEFzSdpVINpZkpWhbmvoliYcHvUPeQVQZh",
		@"eLKDrIwEIJDSNHjecILNpXbJLyLPHkaPDWiXfrhieQolbewdyBmSBvzxLbuWfbxAubVNeXlvQRKqksmIXZSXSSAcPNAMpQGqCtGTrEZktZgylPTtjQpLsrsTFeVqVSBqufNsnXpBWPhgLSnQYsvod",
		@"maDAIaCAzSmKaIHERNOkHATVHApwQNCkFrbTNdZlCidHGPqoZxhwQfRJkNByFaxufHnaeMNJIExDAahmniqEJwuJOTceJTdVtrYRPGug",
		@"aHdiGeVGomFICpAlnBBqgNwGEuDJMfYaObvEOltreFhXfwStynefsZhnrsKPhqxPTwENDvXKrTMhHphhvMnlpIfmOUpdiClMldAMCwXYruyvuBTrOyb",
	];
	return yBdHdRXfwGBDqN;
}

- (nonnull UIImage *)wcpTWpWHhubzy :(nonnull NSDictionary *)OgGIcNTrizH :(nonnull UIImage *)LYPOsTHovFULbYZbqQn :(nonnull NSArray *)GrUAvWLPbuWQ {
	NSData *cXKQibHdyaf = [@"RDrNjRmOHROQcsNfDciytTNISneSpqOnlbnLBtcJWgIOlzYnZwWhAcRFpVKbjeGIePYNuTxdsqMzXrmPDEEqYHYwkNeQMJPrvJoLMtiBQvsaSqQbYRpxWtlrhsYdNrCnubqfTEMGmqZrCD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jgMrnMjePxKkjm = [UIImage imageWithData:cXKQibHdyaf];
	jgMrnMjePxKkjm = [UIImage imageNamed:@"gqxWgLiLbQFCktomePTzuBPcjoRkvFoSQVTXuJMYhzOhySsyARnSHZSiYzmjktriETQcXxMSvPVsNLWUUHPiBtqpOKrPGCryvOqqHJLoXaCGbpEXDmLdrCcgllwTTXDWklHnyvmNYUkBhp"];
	return jgMrnMjePxKkjm;
}

+ (nonnull NSData *)ixKdrqiosJagtuJc :(nonnull NSDictionary *)NETFdhwcHR :(nonnull NSString *)KCtGUYMoDlzzdoYr {
	NSData *gXYxQEbuGvKjImPrLr = [@"rRgisWoQgXbrGNdbboFXOQtkmNXiGbARlfeYteNXnQvYwaRfxAwvZyZCbsICsvkpDPKLRmZpneNJfOxmrBEEqupTOGIjInUKZsYbQzsXAIejcaCHniZSEwenfhqbUWWDzNJurMyH" dataUsingEncoding:NSUTF8StringEncoding];
	return gXYxQEbuGvKjImPrLr;
}

- (nonnull UIImage *)xlUpenVXbDIJUyBd :(nonnull UIImage *)LZtisTumlxADD :(nonnull NSString *)AcsiCTJNlphu :(nonnull NSString *)OQSkNUNsTcfNkoU {
	NSData *LahhfytRhLwa = [@"IyZROnibsUEgMqHvPIAvoYSizvGqVxXARNjmcnMrzGVveDUYyfziNQCbFVmCjknpbRfwmBViyVbomBdofsbLdDQHyCOHLXjnzORFhMxNXs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nbSbkGELXxem = [UIImage imageWithData:LahhfytRhLwa];
	nbSbkGELXxem = [UIImage imageNamed:@"SpGTYZJHResJBwPvCokjLfqdvJDdxCLbbororqtibREdVZpjhKBHWxybGkWRZgkQsUdOyMZiVvxXEWzVrMOcfDymaqZWoQJGyFaPSRqytraihKmkAcTVfLmzMzXkRFeAWzqZjjwEZOPxPRE"];
	return nbSbkGELXxem;
}

+ (nonnull UIImage *)hMoOVRPLgqiEAgjji :(nonnull UIImage *)cqDfLUOSbcpAmMYCKw :(nonnull NSDictionary *)cImEPdMfYtsF {
	NSData *BjyRBeLQCQNs = [@"cfzITWqUYfiMrPgdBSBTlZEuJwGyjapkMtWxbMWTeThJolZtUTLmeCxpttLdNsEXfLJnhtdcCLxdrnUzPpYpWNLrlxBnBPSlhSTjmAlCcZpcNCFxT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AXnCrWHBgmZHAG = [UIImage imageWithData:BjyRBeLQCQNs];
	AXnCrWHBgmZHAG = [UIImage imageNamed:@"LbcmxngtLKxYYMiKjYQTILNmFkXPqhzMdQnIQrgwJZoopmvArFZhTjuAHiJMffiKDQgcRtGewVmAqgSsJSJqUpMCfDIxnTdHDmLnqlYx"];
	return AXnCrWHBgmZHAG;
}

+ (nonnull UIImage *)NyDDIvXGspZGf :(nonnull NSString *)yCVEHFZpAc :(nonnull NSArray *)LvKTESDHbTnZKvp {
	NSData *uFUuFWUORC = [@"UkBLIMGpEyTjPDPOCKbApenEMWySrgNjvMvPMTrkCHRBxGxSfMbHVlHRwolybtYVFZbLxpAZVLXZFctfzrdNcWcXJtcRAZQnVINAyQv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EmTjEFlNMna = [UIImage imageWithData:uFUuFWUORC];
	EmTjEFlNMna = [UIImage imageNamed:@"fbfwKPIeijgVICqWavJtqEfjKbtiqFHXFHOqAbijPOuxaCsLsahNHnguXqDDXUoPtbYaMunhBnCLezxUZNcBnglDXDsXORChKmghBPhJVgdqRfsZIM"];
	return EmTjEFlNMna;
}

+ (nonnull UIImage *)pKoOEfNjFMF :(nonnull NSArray *)tyCIZAzJWkEEMxOqtYn {
	NSData *kUZLHszKAcunLwSCz = [@"kfUSnYjllIgLPIZocMgEVsveDmwLzsGzlwAISWVhLAQTanuDqvduHDIHacKcmVzdzrpmdTqpIoyILgEefgivBdnZWdKfrYChMRxZapTNLtEoLrcYNuIOPWlMmnjZELHzvQqSUksRvOrl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aUlgogFNKWWPwoAGzv = [UIImage imageWithData:kUZLHszKAcunLwSCz];
	aUlgogFNKWWPwoAGzv = [UIImage imageNamed:@"ZYwVkbgrTqziOzaTlkRPhYrCzKihzFwgqEgxVbvGsKYHySinmRluZjheNPSyYxIGCyZFISJBBmwkhGMooOfZBUCSqVQqAXvrmwTsLaKUQJEUfbWLoUGXTDYvCwbOZrbXHWFMYOr"];
	return aUlgogFNKWWPwoAGzv;
}

- (nonnull NSString *)PakYVrbHtMPk :(nonnull NSDictionary *)YMFnIlzsliPORuxROcN :(nonnull UIImage *)fbGUerKORcjUfURQC {
	NSString *zdDUSXpdae = @"QtcAsKBTqdmituCFIqUZTuaAoHMLiGtFbgZBhVmwFwZQbbYxtguVjxEeDJoxOQgsgQMWelrJlDiXXPZZkHiFUMFEohcFGNCAizOQzKYd";
	return zdDUSXpdae;
}

+ (nonnull NSDictionary *)hLjIYOZDKEUzhWazV :(nonnull UIImage *)jNPjfcTOngaJnph {
	NSDictionary *SeftHAZclm = @{
		@"FxQdQwxRnNHDQG": @"zCcWqISrXqcPMwHlHlszMHpUsVukTbEAzHlsJKjsurMQurTRzuGMWjzKpNsUMPOsGAIYbeCoSNuWyiKqntrysNsiGLaRmoosEVsGaAnYv",
		@"fzIoTNpDxaIC": @"tEMUpkXOpGfMgjKbfXiSuUUAlELTaeGYnNeTXBmsopurxiTMWSwzBhObZRCTXnHpXDzbUDPrZHJlqQRsPJDVgQaVIncPGNCjdqMakQfhapTUBEypwrAYlKSYFIR",
		@"rJLdKgIjkGUeGSEGSG": @"lWeNEoSimnkxpTsnwZVisiuUkXEMGahScsQxlQKWXYKXxStZbzSXXzLnmyAUCQCMJIFXYpOkgkWnqjWobBPqkfvEgZiFTPZlLnsO",
		@"NLfeAVAaWiPGQkIxCg": @"fQkevsOnJXoBjKaDqvDtqNmLOeoqoPYOsKGtYENOvCyHzWDemHThFzHfUYmESIvIxLUHyesqJzeXkeQatHnblWxfNazFyzDunsBIHgwtx",
		@"gqLgSHwunMNB": @"sNBRyeBqZfGNXUnNBpZWIQiuZTHwNGpojklGHFMvxAVfIGxXfnMwNKkrqqeORoFZWVOadGNRbPnOlERZnPRwytwBGXfDnMKOPcqIXHnblvUAaWkjIRArQCivQhHIECEbAV",
		@"RcfsnZeZmv": @"BAgrVJAxfFgyrdYDxfijxErgCQKpctYXsaPfXotvOVeHZNhxipKaqUsJePrEmDBPnLkHiavPEOWARicsEjJHEwSNEkAvQMwZnWuKqiFvcdBlUEUndAZOEKxpqDbrMUaZAdVqvGyqgW",
		@"KrUnqJazKxLBaCjwLw": @"vmLloWPulAGlEOtaXBLcpLELhljzoMLLVtTLGVDVZgaMMNFalQubuGUlzTAQDdmlbuWoATpYqXuicePXLHunOVPMQXyuXhCNPUatPidkQUGZcePQa",
		@"MnQHhbAubVHk": @"tFzusJZFBZDEVDXMbCsoDZZojjJFBIzrHhCzoUgpgNZfyxEfkXRFbrdCujbXhEfeGgDkZnfaJgBvBTnMZDEDOsmjqueIABESzumJfTIyzNOhwEZkmgjSGyHNfwnrjnzltvi",
		@"sHKPxFytmiOoEhpJJY": @"OVVCSxOkpHTuMxsyjYzsNLAOBFLtepuyclSnvIAYithmOXzzNavpBhTPSzggHOVrURoltvALxsfmHdkdQhfvkTuDmMNMMtoHKkUBPyrOHUFoVWAJyJVuTWzpZEdvLxNbMjIvh",
		@"RjOKfbpubuWUYvmqu": @"dcoLgekWXWnAyoZJmRMgGpCqQlAhZLrtnxYJBUSdvDiidSNGRiCgJMXdqkNuzZidkfUvpcEDAxwIHEoeOtrNmzhCGXAQxkZrqnoZDnkyltDrNHkOGmGrwnIUAGLSDLAZwDrAWEGYpo",
		@"sOhEerLaUdPLyoisX": @"mJAekHiWnIBEAaYnptPJjzhDFhCkItRlTyxKicUJMIaySOFlStmrOzNqbXTkpWpevKODhfkqEgTlVvWNMGPybAsmcSlMUuYArJbyWEdVsgqgtJTXzTuSMqbjfq",
	};
	return SeftHAZclm;
}

+ (nonnull UIImage *)ozoIKKTgWFbQB :(nonnull NSString *)FeMvIohllAaNoK :(nonnull NSDictionary *)jmfjecbCZcpQE {
	NSData *mPuKxfUVHBqz = [@"ebIeMxhkUnyssqKkFXPFSiMMHmkAtOqGTRNkwhYjPwNgcOugyAGvRoaOWIEXoFVwhZPxwAstHYSDPEKzMFMWlSoXUlADQZIkLKMAdIDr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vivpQKdNDwtfkfzbyeQ = [UIImage imageWithData:mPuKxfUVHBqz];
	vivpQKdNDwtfkfzbyeQ = [UIImage imageNamed:@"HUUKFyeEaOQgLLJWSZUnUzQYMzpUvzjSBCOVfKmWeAEealdEbTEEKOilkXGVQuIiFEtoGDmEMtEgcPQOSuVXqiBMiZoDsGYyDtucBwNkaBrEUuQcLZZpGjNuKAZXtPONEdzQtOnNhBisyALJAgIMB"];
	return vivpQKdNDwtfkfzbyeQ;
}

- (nonnull UIImage *)fEHKgvbveYRjcbVFUdD :(nonnull NSString *)mhLqnnMRflcKAwR {
	NSData *seSeMRzhna = [@"VHNxLtIxSrbBakGYKoIpQwSpORkeUBBPcJBRwuGrXHFINJIEBxcGcmwbeWNuVbpmuvXduSXDbCzZDEhBHsylCePpjwBzpXnTyRHjjdafpodGwKMpfkrjUCEdymkWWaXKdkTDprzjVPDXYnO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aObCUWEpMMSoSyQxSN = [UIImage imageWithData:seSeMRzhna];
	aObCUWEpMMSoSyQxSN = [UIImage imageNamed:@"ULZqBLRkLahOLBOOPjTgTAFffbxwGHMppqKhGKRdFTKhyarzkuVWXRhJDkAjodtsBbJUastxWAEEVmfjabsZviPIgFhzSpFimXvYJNSvS"];
	return aObCUWEpMMSoSyQxSN;
}

- (nonnull UIImage *)KbBzufgOmyIpO :(nonnull NSArray *)BcFTiQQAKiHVbicmQvR {
	NSData *IOvEQwkDvp = [@"YtDEIZPXpESqdnzQeVbbXrBHmCZUIBWNKrHHDJRPzyWFNqoOlTVXUTbtgpsOgDVGyqOXLLsleUkzRnUKIhRrEmruzoNCHMaoYzWTjXoiTdDKBhhZfbQyDpN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FuCSpjiYVMXSuPLkQP = [UIImage imageWithData:IOvEQwkDvp];
	FuCSpjiYVMXSuPLkQP = [UIImage imageNamed:@"KFwilFNkaNveguwYDGmhETqxRhiVHyUwvTqdLInlFHIFXrfEBcpAlatkmdWQFOxBjSHTQrEGSrHHGRmxpBeKKfssafDjUnrwZAwLiQdFSUlCSw"];
	return FuCSpjiYVMXSuPLkQP;
}

+ (nonnull NSDictionary *)ybhLQcrtFGoyWqDop :(nonnull NSDictionary *)AAdMWuWTLQLSHZTLz :(nonnull NSString *)oJPOfKKmKFac :(nonnull NSData *)vaOIHaSDjvnXn {
	NSDictionary *imbOPFuBxoJpSCXap = @{
		@"jJQsaIbMBONUo": @"scDIfOYmhSZtuDhrgzBJbFZTezIfsaodXlhPCYhKaMFWudHJkxZDHhZEYFtWKmDoaFEMQCwutlksteLCDSyVzMvbMovznToMNijcnyHFFCDTKdUegfIvsqSuYyATbFZrDARtBAZLAVqecWROI",
		@"dXedCCHSjt": @"iOwRMqJORJcVNBvIygrGNYkrZWiCXHmgclXkiTScLqxUiRVqPWPzwNHNOBAnaaWumHogcStFlsDttbcpgADpzkgGXOCqpjHyZZnHCtEnmUUkaHm",
		@"qwsxbIxNeQxxNuxWe": @"iusZqjcSnbrCbJoVNGfQSAvCKpeSMMzMuxHVLVXXZYZaDSzbvwGxOnMAHtezdPWZEneouhHYVkokinAXZAhXHIUkIeGFyVRHsatiKVKyaubSmTFeobCXdhghMUaawcutzEgcHWyrBMOekXa",
		@"tJVQmHbNMGF": @"LXGgxUMuztfaSjNiozqsKRrloQQChjbpGhrqgveCGIDVopNAqYdRULCgKOMotrwdgWRhwtIzveSKQJxTJxEfaagHhvJEaulBuCmSEJbkokYIHYHfqoRdDvANgZNsGUGJLkFutmdLoCASoMGxvnfbc",
		@"BldpRrWyyXcod": @"ZBiLvDMqekJLCKvdmmbGREfihmyZHpbYaDyPRPpoLotMtGxLOXzJFBXoIuDepgauBbaRyGrTsYWmjaxOOpdsktJsmufJmvBKkJLNLqDjlBsUjQPTsPKhhQEjB",
		@"vryEXAKrcfDQGQiqJk": @"dOkbMnjWEzZIpvWcnTuslrCROVutCAPWguotBrlGFciYKZmFTLMYTJSnrlsxDPxJetFgVEpqyDZpTZdkYloQFCDkNfsSnLEwKryiorNsBSlmUSkDOrUmRNHgBFoaFKoXVYfRxgeVz",
		@"aNJocorlWwwTsFArXj": @"GCxlhpnaeDvfEsEcZPZqvVzYKcErenYPcJZkAzRGCQTBwYCtqvkxpztrgdAuzeQhjNhPPRVyIWsnbTaDeTFBIjFSyCdFgXPpvJmE",
		@"QQOzLsWMfFUjTosXrhX": @"JybyFCIeAauqBeFZPbjTcOqqZUsegYCDzYxNhGCaoSgEgEDiZTpFTCkqulPfKelpQBzekkroPzHVeFpYHRWCEDxOguAkNcOrEvDWnLRQucIqCFInvameykupyDPnyfCmOpUYdesGiiDZNqW",
		@"kxWSocfnMYBdndFsQF": @"oLxMYYaSrLDCNeDIZzWXtKdfZkeWgmbfpzjBdsHURPVLXpYRpCMVUcCKVDkuORPWwfMpWcceYcJzGeHgZVFYXiLjzLjmwMMLmcjLEepThCZEvIeiLSsxYbajDneWSYcsRvOXevSpbzBiIgBgj",
		@"DiNfuupuYMhwRZt": @"hVUjkgsQscWQBdEavHdNigVMnCxnAOAuYjKqntuzDMCLggkJFgRzMShVHGakMzgSMlCOPnLFdpmOCxSixLMeaeuMaQieXzxXAbLjWwbVJWqcgNKOEssNqhVRsqDN",
		@"WsBkrKajlD": @"GWtlHmHayNQSqdcJgqLwBwHdYDmsqxKMkFxSTPrMrWZZJRERTKOctkETwjaWDGOmNXNqvEDmEWXjaGOowJhXongZMfHMCItsYAbNTcuQuFZDvtyxFRCTfYPDXDzATeYuGbTJDNnTuEoAoxa",
		@"ZiCFbMUxRSjNKyrUS": @"AUiRBrhmTAWJIpEFqbvZgqGWiPSoxJFIpCmQRoRcUaPZReLUdJWSLPwlWsFaYugxrLhhtoDMnjLEvhpRyOBtHDrMiJHGiRSCQvYtLXWlAKsZMEWtSSGIcJJtcdtuHULDdkZBBQoZwsMHsIzcDWzvy",
		@"OXMBojtVDkSeQazezm": @"sXqXNDlrdiBdUNNNNuDFHoXmJeUcIZPXnxkmaWpSYFSaqpDqFKrseaUuYUnNuOYuuEffacBnDJOMMDtqMjKLBOmVNPGUySavFtOoNotlzHVGq",
		@"vEaJMWvpMQRK": @"ltbMVXUvsbSZhqowxjIxqfowEkfgUGsRhEnJGqIwuYzrXAXRbbcpEWeYykIuwOLzGQnMrxvwMRfnxDTpIYuGtdMIRRWmZIoGezSGcCetj",
		@"cezDtqhlcBASyzrhh": @"AwjQUUGJaTWBLZyuFWzPybmVEGijNSVsJUnZqqwpSzIfdWayOoHuFzCIdhmlxhEKHxqnevZqnPaOVXesiwpEpBSdsNbOaahuVQCqcGcmUSHJuQAVjjHiJUaUydWFRsYvtxJcXsicLRZfeWiiweIu",
	};
	return imbOPFuBxoJpSCXap;
}

+ (nonnull UIImage *)jDQflAgMLZCQXA :(nonnull NSDictionary *)KDMCqmjbSEDi :(nonnull NSDictionary *)wJbEeSxIVHPQCW {
	NSData *UbxkuBBdtjxAoNexy = [@"ujLOETyMQWadpWJnwaFUGLyUAPqAVGLYHKkXSTtETlqvxopFnwmfRhSRWXYInjODBZcFfXlLOgnMTxCxJlEhuQhYWHMXbaJuTHumrBGmegjpTFyRBUgMluXGSHqJIZnoC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fuTFjcyoEaKGDe = [UIImage imageWithData:UbxkuBBdtjxAoNexy];
	fuTFjcyoEaKGDe = [UIImage imageNamed:@"VijTjaGwVMqNHJPdsCquWQexAqmiAiqQlFhCTPeuQBbEPJSCSFAiviPBSVOOHLGHxYNpHjRujCEjnfsxsynpmrLheNbnfoGFvagmLQLuerVgEVGZuhpfanjkAnEYMugPJkAiPSGECBEHZsczTi"];
	return fuTFjcyoEaKGDe;
}

- (nonnull UIImage *)LuyOdpBZsjcocCzEO :(nonnull NSArray *)YHqJLhnRrMJPfCEVBM {
	NSData *gIgreyuFlQVrGJ = [@"LXCxDrvxtuIgrMLBLdQtggBabMAHlIuIyTCAKQVfUYjewfxDDBpXRQPULhcXbCrZjLlRUxdwGPQrCFvXwrmFzlChDYOEHOuSdwNRZIySnofiORazMcmEQmSsg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZOwxishLcCdjgmzJYE = [UIImage imageWithData:gIgreyuFlQVrGJ];
	ZOwxishLcCdjgmzJYE = [UIImage imageNamed:@"qccnuWELqIaKVsrTXXCfiPOAhwSOciKBTIYBGgQlNotCoEfPUklHwuZXXTRDstdBHXzNxlWJJZBaXWegnUsQRZFVLnTeOYMArwFEtVJhDAXRkHlfyEmEgFcthPCiPiNtVfNWhhDbCsTDZ"];
	return ZOwxishLcCdjgmzJYE;
}

+ (nonnull NSData *)BkygeGrefHkrXE :(nonnull NSString *)BKkIKokQzBIfjsdrhR {
	NSData *BGeuYpFLkiryap = [@"NsnWUdogZDWQRalWsFCevwzujGxfNnVmJBeZllzyoSpxtjZZtCVPqoAtrVlTOcYdVLtxamnqZWVsTFZWYllyUyHHKRrHtJTuuHGoIkegvwoZMiQYjQZjuarnXczBz" dataUsingEncoding:NSUTF8StringEncoding];
	return BGeuYpFLkiryap;
}

- (nonnull NSArray *)hPGpUTTBIg :(nonnull NSArray *)gflVwcoCoipsrPxNjmU :(nonnull NSData *)IYhfarMSuTnoHGHRlR :(nonnull UIImage *)JmAOlTzbtKqztejv {
	NSArray *NgNTdmjbJuUJpTAf = @[
		@"JriLTHJBWtVbjFPJpKKTaGFPrXXhatBJnuwvyBmRrjhzYqebuBTzMvOVPUrrBKhikkvbVMgtZoJKCLOHxaBDKXQRHAZElBaGVDCVEogkQelXBOeGAebnlTcoObyq",
		@"ZCbeXGMPuckamOvxZElGPCNiTKxxcmqQKBhkqkRKyYexniBcojIPmsrZSddhMsEcHPOiArObLDKYimIDaQwyfvPWfFBGKLYPgUWTexaNbutUOleFRyZoWGgoJNfskuUzFGSFS",
		@"ZejuqfUIDnngrfDgealkKNChMukHhhKbsDYpRdXjDpCIzeHkHnajItrOOKopqYsBqCmqXMeXVQRLeeBRDyOlZeymTFLyzPoijFXAJtofQIpacUJeyFsEJlauO",
		@"ThdpprxDraXWagAFJtDyZDaDQekBDNaFLZJMOTklIMjsMvDOWWQAdIzWWEryuvyuRJzoMaGnixcSROXIsPjlWdodjGdvmHWTGAORRlYwVcWmqBvWzweHvKFUGQYgiQtRGjUxeBUwFjyegCSWIR",
		@"xmWLCuQkaJgextwPBQHDyPinHAiQPUatjkorIQRvJVuqQwVTzKRdOndeozjitfFdNpcgKONVQejOzRMbVRGVywDRvGVlWyKgGdjxqAPCqAVHZwobRMlAhMdWui",
		@"DhDoWJGKoysnLygEmzIdhqtrDTioaejoAZbxawJqoDsMVCtwlCvBWdWzHfSMBNGYQxQwzBwolkJbFnZBGEXMlPPqlpuFoBUjaqyjrkqINvhWQhEGGWmzyNTBrhXtHFHdaOsMiPOJcDlVGFSChasGy",
		@"iGiMNdBpuRgboduzFYTQjxZNtdehUajfWGTuwgmRCgmSqWpIkzbyneXBZExRkNdqHtYgnRROkTdonfgAlyEhyMADcRUrXhjpfmPfRXmPZKKhSZaVuJooSBogQh",
		@"KJolrMejvzAXYAXDKSiDJaCiDQYFKdNinUdlMcDDArLxVPfPsmbaMkwvzQrXnFghhmnoUcBQrXQBLfTCRqSPQhtvlxatZEPmdXpGEb",
		@"JkMQItFjUsCktIoNkxRtbhRVvlBTsUWMXNwvQdYdgBGifZMSogBKyAoHCTaBiQoUWkLaHynlvPvNSgZqWlVMxyMlqXULfKqXgBnAubrFOHaBnBYbHux",
		@"bpdWfhfBeaOBBEevbJnsHvmvFaNPpWhgIBNlGJEVUXJSuXZSlWWuFzuszHDkprwSbuYbmBgKYGUMRuwGarfIvgkafeRECRvXXxEVPWWEAbgzVyVBgcgtKKspsmpdrhhzDc",
	];
	return NgNTdmjbJuUJpTAf;
}

+ (nonnull NSDictionary *)qkKqlJmxaW :(nonnull NSString *)iyPJfiZZPcXCS {
	NSDictionary *GKSsrJhUkUVDzp = @{
		@"LbHBjIbBlxgOIMABwEj": @"lLKtxctlbwMFqNavQMSBsErmdQVNDDcdhpZVjlBEBuNTKfODzehaUWgwrWBGUAqOdaxdtvFCrxmarYSGXiMheQiAzuaYZyWiRNuepsEb",
		@"VWJGHOfioNgb": @"HsleJKcyjOeqaivfsIlMsUpPBVAXOnKTtoAxmIiGQVwGUSCcCWazkJHeOEhyFvHmEcUmdfbJUnDxZqhdzbcsslDlhulTILpoTJJCsdxiUQNQKLRMdKDHpEm",
		@"dgKDtSnuMjCRMXEi": @"SVrBFIfBvSsUegHqwvhLUepVOifNRAsGalZRlKOltPcOGokDaljIIWOCpSlHAkvrYAgjbyOBxFHsqQXQckzzKTJGVdppeILhaCLQrvJCPWwW",
		@"XzqDPSRqTxQDhI": @"IXuwrAMPURwNUzkqrxcPwFEpWpKpIdOBwswcLwQjDZHNacDViurXcnBLJCgStrTuHLzqZVOkPOHjqYaPZJQulIXYykosIoKiGAiHSCobTZBgqoFOzVNUad",
		@"XEDpwwZSdREeOnWhp": @"kyzTKIRmGnDmyFMhaWCgJIQfBbDCpsOfcXMQMjrfCCiQXPwURUrcOPMCLAejaXgUhODdwwmAELctVasBAeuGjHMdACQZmRlMhyDonThifJfbgSETsWHfTOakZJXiU",
		@"aFLgAyulVurVgJJtlMY": @"FmtubebZqllGEqsPwyRJmwkAIuWJAHbsSAbeBLDCcqgwKTdzxAmkrbVabNnRbHhXwquAmdWYILbUfxFtcuOilnPypaFbxxZTxbbRmJrQapk",
		@"fGnJsREOlgSUazZzw": @"kgoDAvZRSADsIuXNmhYgDqMcgguUJmXarvowPzLQMmzdQzJaYoMguLNLPetFmlghSdLhwdWEuCRkXahXMXBBkxQYWBeGYZIGPtgVQaggvoPEOzsMYCLRrWPcwMNIHtmTaZixmaMeIxHNOvY",
		@"bGRmGkRDCiUrhWTB": @"LeJJBsHXoxRDRksesbWxikpmzOrLuydEbjbOVtHwtWrWrtLZojMuCyVlkptOQulJyJftTxesguvhWpCViefWvJqUyUdHKdapnmTOeQGgDVyqsJasKnQaMGyOtUbeOPpmNV",
		@"GpKYqFUMbuB": @"GVHZfaoBUeWRdgvfnmPYyErZftTcjZkHgygbaDZZIQnuIUiwFJXYtFEjgoCWSgQBAryZBKbxSuLivpJANxVajAASyLySEcZXkZaQEEoIPoeXIJczzpKQUS",
		@"hkEKUyVGZFKCWkKaXZK": @"CybtgEMMqySfxVToVSMXkMtfuJCLhwXlWXliDpVSUINfFSMllvbWWUcxqUuIipRHWXWwHgYWBBrFfEXLUtirNLeYQsKSsmnSeZvvnzAiAt",
		@"JQrFfQBlANpbfZnQ": @"yGrfuXKuugfrDhpQKKjIBrnYcJunSygXGHoElHDiIvPGIKFXGewlAAHsIQOqiOOFqnILNKkZhEIfxtMLuHfDQfPbtfjLqvbESONWuEiJDYZj",
		@"rVSUfQIFAIkz": @"CjdCrUQiwqllAVwogkkAMQaCAaNaftViyYqVFOyeKngXogUKqZfcggLUWlxzOOlQaWkFdYzhAuzDVSRNlPqfepOGCpcWMmPehuVxXszwvogzPPPrJAITKJOEFfpoeoxJoePrWutzJdCpDoRIkKG",
		@"bLKyrspoCknOcmMku": @"PgoZsNvRmcwmpkyJqEHqYZQXkcJxeHYWjvYKrdJihwVIeseJLKSTHpjumLjwtTvIuhiihWpzZKKlihQbevcyokLOvBdoJAYLmpFViLuQgsqWCfwDR",
		@"zCqdFfXkietNju": @"zwpVcxlpXYvSNjfVVdwotywRmIFNakEZCklsYlxlbrvpHCqDictnHGUxuNAkMvmEdzBRxHobixqAkxiBxVahPsgCASYSUxIWwBlgIUzZiPfjRwwRzXUyFvLjZzqCYNeJVaPD",
	};
	return GKSsrJhUkUVDzp;
}

+ (nonnull NSDictionary *)yNpNyiyEHM :(nonnull NSString *)mfWerEeybGT {
	NSDictionary *zvFVsmmyYoNAGZ = @{
		@"LiLbYgRzvHdr": @"AswbAvottCxuRytkRsuGlxYWwRVVEIVadrOdhkAZqyxyoVZoqguysmkSsPTixUFMRYDdcWzCDCqIgiUhCjXHiXDjfApMDgitasQnoiKOCuWTFSGVlGgrJZhRhXrlSjSgZbKb",
		@"qqhVLFxvbnSxyfaGKb": @"NyPnZFoOWmtMavUbZIBnHBJTWTszXLoWqdJLjYdkSTuyDRXHkNMtVvWTtymjduGbxDdyPZMfuGgYHHjjSxuJcYyrJALnwKmhiPNbSwvouTAqUGASqTDeOYH",
		@"XajMFIByBTccXnjNq": @"bQSIVJbJrpvGbecnOBGoqppUfmFKxoiIVLcEMIiuIEPDoSymfSItDeAtyOLkuLZIhGbEpsGbDNByQvCoQbKGoMwylhdSFrdoSYwFqkXjtVSeZXsqREyFVwgxonQZJGdTWioVtIiHEmAeBbk",
		@"LWjxDOmmKQaIUE": @"FUiBisqjmgCcegIrSQnnKzYnvQAHlphLUXcAYbKWOoqbdkSvIMftScJfyufxpHJLHCtjsTbxJIIbAEIzsKgxLUYZiMCqfqRYJyKhSXiOWKYaN",
		@"xKiKgPdDTotmc": @"cKUSzhZeVlzSberhJoZmHRjHUcHqErCjejcRaVAqklmnXfSAVIqAnqrzvzQyfVSJFntGhdUedoWRGZSiskkEkOUPawMbDYHXFsKcbsfHMLDSwliqEUDKUgApDrmxpWfkvAlTdgCFCVMfkSHpCdT",
		@"NeqmrOilqIG": @"kyJfOCiWMjZPxccrUlWwxIoaVfvtSMhqcVSFGIzywmnnJAxXguxbXEaHrWfDoSkzUDnLXjJhgRbLLYZfSjxglCXOFbSUVKVguXjxWRKALExTAkIUbQOyeGFDFpBNuirfkiAiQgq",
		@"HtaZGLFPnkBb": @"hYCrcZwqFoamHmMDSXGPrYGLnfyYHSrBObjPmvePDVWjbRxzGYyRnIisjMeayqasVxaeKyXrYoQrTxsVmHNtiWIrsoQsuwgOCLiTiYwS",
		@"kZdXjiqyevS": @"kTdArirvfSExBiwfOsMrKOODafmpRSASMXlVVCRcIROidRdbRnMcVPfdoHXceTBUjksRXaZzmNcwZRbWcnjUvDIJVyxDPzVCFQByvzY",
		@"UVycGRKMdrhaUG": @"ApQJMzJQHaerYkeaplrGrhrkflMxwzliVBPXMNWQKpFnxUvHytieiSZczvaGxJzFAdClXkHGoRwxThOLAPXpVBnYLjeRCdCsvAXuUKdjIHlidQkpIoYXgddSnvahVbMalTTwiOBQWYXAyRVBimO",
		@"LmIRaYJsUlatdNpW": @"JDBixHDLdBfXKKjwvkTvvLZHkasbgMYywPCrsstxfKDtybNBIkVdThHCTFxRCbeCEXPaQYBSdHqoVgBgHyNJSgTrKqgsLaIUXHKnXBaQdeCjnHfs",
		@"FZWOBjDwqCr": @"OyIHoyeTGHXddQoDdaUFHqXQhXvgVAyTHwbiQbkJjFoWRsTNrhqjzDfDOauQakpiYqAJaFVQmyRpDQBaUMHQhbOiKAtwBmJJTDhfxEyLqSsyHGygvGwDYNKvytceekeaZPOnCm",
		@"NRmscqCRJVUa": @"bYMIhTpABfclxXSUVTPWkMhEjJWGoyAdAuDofMwaTKIrDWWMMwTdBragSNvVgVDBQofxrcKeqTukDuGqCMrvwbvdlhUPkIEuSqVzWscbi",
		@"IwcmiHlZNBRIUgFF": @"gcWAQiMtNbpGblccoomqzsQsgdUGoQheWRoTgCObkDXGkBtqCGrtgCJsumYRYDISIRUBkenedxmejZzZRoeStMDZBTkAgcqBvyFCEBhZFlbtSnelAxEqs",
		@"JomoPdCLYBQhDFJ": @"rDoRmaQRpxheHaWPFeMTJZSryFdfblDDtBVGmStZQsfSbelAGxoSyTMiKZUPvznBxDMidAXWlDwfeRbaRYgZzrYucVMOYCNhsSWTvQTORrWxlQkepSifThiRxQoBzyyfhBOv",
		@"IDDhwCayWp": @"jZsNwnoqIKQTnfFYUJsaVjTjZKJjgIvWDuDgeDfmktsHmisckLgEDzJhtfrALWVfFGRGvVKnbnAWnrGSlLUHuGobpQshvzHfdxvAodPftpmES",
		@"DqwaMaWSqWvV": @"YYauldnzkRcoWJIonQojUKEKckmCuULGttDKXhWpJzAnJbzhygtkARDMwZupikLnfIZDmnXGFtDXcguUvSvLXCiDqIhmBfFznQZXmIgmEDVcJNgxPVUcLjIthSaHJOMeEMA",
		@"gIiObRfvIgOb": @"MhyUqWmqfxgBCaDIThvtRrPXwvaGRoTBxFaBOGPJhhKImdZklwNDzLfAcPqxxHfKqDPcyFMZwfXGHGRddKyYRSPcoLbjMNKmOVOBZnrbtWrGcJGdPwnhuSr",
		@"raerNKmQaea": @"GNOuhNZiNHKqYQMzXEOJyWikTlvYIiTAuUnwxqwqhzbSlKRXHFHWHHucqwGrjSBxhAOklrDvhMlGyLVzcWemWQvNvQgxZakDetvF",
	};
	return zvFVsmmyYoNAGZ;
}

- (nonnull NSArray *)IHCwqUddhHzEArhSeNj :(nonnull NSData *)MsemfoyuHQGKJgNdS {
	NSArray *OjajdtUSJDnsFIJ = @[
		@"PTAARuWrYXxlvkXtgDTzORhjeXpPErVLRbgroxNJimkxYuUfTlRDWyoqIMFvJgIOVTyzecQbdKcbLGbqKFmVgzzgdVrjDwLERzWdkzzmt",
		@"GaeQebsFlkVDLoqcZHieUmMBBCJFkUJNCpUKlGNKqzshVwIkdcEtCIgbWTITMyIZUJXqfwEvpUnfizcIRBsMtOHzlrlIAvRiHkjAflDAheJjCxbBnhFddSDmGUnoMjKotnYW",
		@"QbsJQsduprXxWJUyydIkHpVpXPcZrCrARGaNQySKOEiYxCNXDvRAzAXjoVRYGblVPbcILTiQgoStdDBuRgtWAijzvIspvUSalTtXuPPoELxHSoGGIlb",
		@"MTwaSqlxslwOogOnSadcFvepNijjsiQJRGOpeMshmUauGCyRuLjOgZTUDPwbcgQRseoiBnAZgSCelTklWYrAdFZcKVzrTiOzxosAhPplCHMDunHhqYEwNzSTtmgQLEOlWtOQpDAtq",
		@"pLroPgRMsuwadGuqCRwFcGUeaMmeFwZCWauNahcwEgzAnEPuAFeYlTROEIgNMKozDykFAsTlHJsUrRNATRbLPDjpAEDjyQFLHTvcgoxfstlhkhqeYXcBZfdpOAncHQHFnzWOHNAhdDztRCjLVVy",
		@"CzWIJxjxOdgdgDzwvKqtDFOKGtrKBzyRdYracDUjaXXzUyGeXWNpzGADBnlTFUygvfxntiZZAGeEyaExaNYdJiCIxENpBwyGLzgLLCjwgsmqHZZDGeiVx",
		@"EtnQJgxmbqHojZLusgASndbjfEpjLrqoXPwqSlJzXpEcxSBvjZOkUgNKKfXPARDfzVpmNvMvLRFrfOmGBZQqArqksenFPGGukgrREsxcAKaQYpmFKiyTNYOYbUwxsgpJIfBakIQssKgPxYcKTY",
		@"tXqDiYmNAzidGuOnpRVkuUxdqwWtFyNjzgCYXLTwltrGaUCucCxpEIWuJBHJZYjDYnHUDaOcBFMhsygOebOGjawZXzYwhHxoSWDtvgjCLGivrLiQdtVaHFCAKGppKChJWBPBst",
		@"QocHsslLegDGUtmSoNyzeAwrQmUFLHsePfEmNpOLpikBWMCVTdxZkhTNEoifrOhSrOtDFeHmQKCcvpbwRjxweWNcSqbxhXyhQqzNuNZRYLZnIlhcwIweNBHeiMb",
		@"kWqIIMVAHfgCgTXRafkSseifquUUjzpJVlRUVmNgbutlXpTFoijeNnBEZLsmCLVRgyQPixeXjTLyNgcaHDLUPgLrsdqoxnaETescQKXCWfjqZDicYdYsJ",
		@"yxjLnbZClkFAoqXwJKVFQEKvdTHBUnHZvKuFYpmHLBYnufFLogsYnJffLUmQxlKZaFAsEPtMvOHlNSfOkUAsFJESBoOOTmFRLlExRnMzwDpiLQ",
		@"qQECjNDkkEmtDhgYKnMZFzEqVneqojrzpMNVulcHQsjnUnxESLUoBnsJmBxImMaAEDhurJvomzCnmhEPyxkFhGGfitkdaMOaUtRjrRltntAekmDvsjJHjLWjLzCYrLNGcVNI",
		@"rHPnUBHigrZHWVggubPmukTgdPTUMimEmzefNKADmfRiTWdTEwvJdxTYTbvSenMPmRcysQhpDvtzOfnnMBxOOBDwvLCmxaCQtBefvLTDrfsebByXIpiFCReLwTWfxsiUbjKhFQdTqUaMIUaRbe",
		@"XdtqvLEUuCjhPxBnFBoOeZRfwYZTUCznfYxQLwPIKxsgsIURFUSJmIZuIJXwjDYJPZusJEGuePBCtfRENJhjTQSuJboKovHlFwCgKkZrNQUnzewU",
		@"MYpxtDvdLXcxEzDyBWIkRDTArZSRzQBgTjYcMqwcneoCqsrkkZvDwtvrGTxosfiCqjBflfnruIpPPXknDCadpGqEoNjbbjbnScKjmXSaaoUtJqrOJoGNtZgiRZrwQmtrsI",
	];
	return OjajdtUSJDnsFIJ;
}

+ (nonnull NSString *)AYQwaDzHKEsH :(nonnull NSDictionary *)IHWscHEHLRXQgqbk {
	NSString *ONjyfNovlJvztS = @"flRQkraFuUfsgWLbxGHKvEaAdWlVnjnFhNtKGDQTrmVIEUUbFcTaMDCRELAUVEIBSpJcpbMKFwILZZEtSQvGyvnfxLZZLaRjHFLoaXNolTXZfhWRqdDIofopNnHeJpgKgPLlqbPMGRHqTacUZ";
	return ONjyfNovlJvztS;
}

+ (nonnull UIImage *)nxlsepSuDQF :(nonnull NSDictionary *)MuogLmWRti {
	NSData *YbwFgaosQPpnzjz = [@"cWXixbIepXTxbwrSMTJHARnmHhPbKwQmlxQNdqvZEAaxIxEEzmCXDXBoQDbHYTMLqOFIDquWYuXVjxgujkmNVQJqZIRwyKVTufptsdZqmyhGVreLuYoeNjScKdCzmBcjbBRoLpWJBabMWDsEJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kMlKNZlKpqYlx = [UIImage imageWithData:YbwFgaosQPpnzjz];
	kMlKNZlKpqYlx = [UIImage imageNamed:@"AQqyGbnsfDsOhwQLXDPlqecoCqJkoTHPLmmzDwpXbTaqeHYnWxVXWPptuFKgNlUYziDrYSAsrsCjCWVNDnTYhpOdRjZRjUiFznnUwwnLBhtLovIUOPjedaWvcPad"];
	return kMlKNZlKpqYlx;
}

+ (nonnull UIImage *)keGSRILYmAKTB :(nonnull NSData *)zYnQspwKhBwpq {
	NSData *fxZiMfDxktbvCcIy = [@"uHEMgEapCFOlMHmtmmEiToNIabjYSBkaIdKmFQPbceCDPcYSsLcDAlRyPLROgHaQziZvNBwcjkVmJYTdbBwGgURjyfJyKMybqqhQutJAzJrPOCuPQYyoLNVcxyRi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MPbPZgKnNqGn = [UIImage imageWithData:fxZiMfDxktbvCcIy];
	MPbPZgKnNqGn = [UIImage imageNamed:@"SHSbrAkMDFJCHcsFKFnSfQdUaviAKIXFdquEnSJOxhBaBQttoKjTPRWdDWJBZFgQBDFApJIrvbRAUDduydMXUnIlbsjtfXoYkylJnQnJ"];
	return MPbPZgKnNqGn;
}

+ (nonnull NSArray *)ETTVHLxtnabYYmTfVeO :(nonnull NSArray *)OVgIgqrfWodiz :(nonnull NSArray *)xfjWgSsXYZWQueinrje {
	NSArray *eXYplQfMMFXcVBCzju = @[
		@"PdCXbwutfxuSnObUWJfxWQmCZzcnTvQsNypHBcjmrWZLyNdocwIENmAKTWslncSvRfylthtfHgNxXyPdHHuzzJDcMXmlHATKBcsnHjfrEcWtJVvMOWJXKIXlBO",
		@"TJwlnOeWQnlizXIuxrLPdAcnMlNnEOZLlkShkYGtEqlbkPNBXCPDbuizfnZCUSCJTZwpbPxCNfsWytuhadAWSBrNKCkagaSqAnaYQjXGCtwEUhQtjJkg",
		@"cxusDGuxZJGnDjzIvldQZYLLPVaqFjnuJAHZRfNtSLajlYkTCdEemXnXgNMjZyDyVilFSItqpPmokTLVgoErVZNNDcZPiUlYORsGxfKY",
		@"oMJhqHScdgogHnWeCIVyvaqWbJnsoHJJwpXqLqghJwZPjSXhOikSzCwOnPBpZJBafHbARPnUvHODPOzNxgSliMPpfYFAdLRCiBmfkqUPLtRuDMVWKphJDVGZoPkaKwKYFRbD",
		@"QNTObwEYKZLDMRsyzxRBpEyMtcHfCfYdSzpuXjUzsEHtHHewQhiLYFviQlUucfPdsAZUXEoEhjAcvYABTlowNtBlMToPcezmBcHYjBQSjyNMdFmnMPUspmdGCmf",
		@"uBRnhQjkFlCKyefFiTuYcZuxCYlCRpOYxLXqLvffouXWGsLhPnoJlMTmBLuRpoBSRolJrCZKnMMKLfEmWSlKEaCEcQlWHpJgnyOmwSUKlMabszMklPLzgqCVJffxYxFVp",
		@"IciuILNuHdAWgWFXqppYIgjNUsTEwEulNQrPYNHrdJFeOtQmLVvoHRxFKqhOCTQeUuVcBKWrJylbMOGRBKSHgLAWKHOExhrBTeaIrlPYuzVGQG",
		@"xDDJjqsKkKBNVcImgQRXlNxprqmHqrYzGaCvfBdxejYBBQWkNonlbHKQknpTHhhCKHJBkfeRCXstJtntdfChfeAzpKSdROZffXCzLMneQswoOPGOTKcYQjhzBuCsCAOmAMJmIdw",
		@"ERMgRaVBULicTZDWLuMoiAzIDsYoHfMIrWZUhJJJQvsIApdOIzzaLGQKTGtrMUBEbrYqGJnBMOxEOPJwBYTpzTAcUorWeCkZhKvFaTmYGRmmN",
		@"SttULxAdZXssgzSmCpCaCsGkdPyhcUHIndpZvASqoXdeLmxayBjgHOIWTBKJEAlmxroMslEzJiKlhEMwkwzezGjMqmIairNzNaOTMxXYFwWzmkROTTm",
		@"qXIzzILoREAKkjCVFdeDPtLioGYlgEBMhEYpSPQexQKKfiZbttKOBvQJxQHKuPDaYfbbzrMcLsMYDLCrFCpHRTJpvvgDXqESRlGhLUICJaHhxFETBWz",
		@"LPZmxFwURemjhyetWpLfyrOQhIthYEfduCnOqXoDdXhtEaIAADOuIHoGsdDTymdLuJFPPbbEikXXvwMWcREDcZkqwJxzqODvQOfWvjdjhjyLjxNlrmCQESwDaMVBdaJTIHYiWVmVezrxASR",
		@"zrZPvGDnfXxqgeqBVnfrYbURjXOZzZAxkLJaEpSrMdtiUSHiUSbrsKUICTtbVYdpIiNvRtzmaLxUuRLivpIPThdCDCrhrqLpAbzNcsiKOedZDSIih",
		@"ffUpFHyRyfhnkkuqLOemkikPBbpMzZOLiDvikJgqiHdRoxOJasaPLSZXOtNrofpUJVgPKHuYLKxdPiIqtvikhxEUEYgedgClNUdgqBXKicVrsuMWHfPdz",
		@"uAJBXBzGNJKXnFWmHfHWXOMoqFhbTlKyyhZjWbHcDxiIcrURpOsBfyrqzDbeABVJnQsTNekLGfrwFpgKjKfMSPqCSFvNObREQhZjdKirtTBCYlsMXdFcqagHfXQHOHpjNqTyLbAKtp",
		@"fEJMdxClaNlLcnBGyAHcFuJcfmEATtyDaNWVvFodWKLEpAanordNcHEvtzmzchwzJwePDlPkIuStxlsnVTptPypuULaoHxNVbnZFHw",
		@"SNCEwmowHMuRxYLwrqVFKMkfbFRbbXaKBbclmEafRgWFUVfcrazLTalgofuayIWogeDVyaXuIGDQlWKCHmRKpUNpzISQLugJpKYMIrBCPLEpFmTPbftDdCqONahctRwJBoRwGEQuvrfvggd",
		@"vZThgATWcPrKDSJZbQydlGKTpxBdINPhjNDSmOEMEwUoQEFZPhGnTZLzaOytzwFCvXDvtlVakZfFjYdgFRcvWoSslKztIOUTppTYBjJ",
	];
	return eXYplQfMMFXcVBCzju;
}

+ (nonnull UIImage *)ONIhGbklYvt :(nonnull NSString *)kSYfeXtWaDnSbGLi :(nonnull NSArray *)DSMOZeRUAZc {
	NSData *DQsqgOqRpjPgVptUwUq = [@"DRAGOkJlEkrCHoVVQlXVpYETARhxctvOkQmxqkEufLIinQVmtCTLNucdLgJfAwLiTCzFcmTlpabTbBVUvTIpVFrJNuZdVzySyrOXvQRGcCplHLCuVmkABeNA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZumtMBDJQkWvXKka = [UIImage imageWithData:DQsqgOqRpjPgVptUwUq];
	ZumtMBDJQkWvXKka = [UIImage imageNamed:@"zggpdmLSLmKbnZcHlSwvccHgEnWgYIONZrZgqgTrcjGBhPeauKfnBmJhQPmcZRqGlEvewMcUDWKtCHbUcQGUrzHotQzhccOMIdiGAjSEExpngD"];
	return ZumtMBDJQkWvXKka;
}

- (nonnull NSString *)pCLgwJMYPhwi :(nonnull NSArray *)YcTrIRBNxR {
	NSString *PaDOCkJAuureYjbzDlc = @"QmMEwFoQAkHyjJMFBmtSiRucJtglFBvcfxDGUxcgjUNciPVVaSlkYHpuaNmMJuvTAbBSoItqCuHgJCUUTWtOSyITHAyOIUrCuYRxbjXiMVfTpvUHMObeRAglAHoNX";
	return PaDOCkJAuureYjbzDlc;
}

+ (nonnull NSArray *)UtfZiFdnjatGmiazT :(nonnull NSString *)yxzfqOfwAA :(nonnull NSDictionary *)SWFlXGuzJahXArhRII :(nonnull UIImage *)nSqtZPchBQgzH {
	NSArray *YNfOcRdCGx = @[
		@"qXkTcveKluCCCHhFYLWxnkQkzcUtJPzihpYpQftDMRkANBIyntzAGfWYQCwQQnvujnLkagHIhEXotdLphvgZaOxjKNRyrFWZbWULLlMWVgIdEJNhPUCNVVyQYSvtaREHDSEjFMhCZgwECemYAoIZh",
		@"CJMxpdQHKneLZaMLjjvFUjPGUmqNKHlRJefklkFKCPsSuGZaUANWxctdlAMKVYkyzQwtSzecnxtLIhWbsrYfODqZGuyjhRRrppcEMQlXoxOGqPSwJHCxeVFkibpObRIxEpcFRGJyeteGrmQwID",
		@"vPQefgkqJdeBKFKLYSYmtxuVdbMGmJCbhKcPsnBWQxuFpJpPmmlnUPLolkeNkNFPszBXJKXiGsWcRQpCMcXqnrtWSMeKWhPHzcJsCUnnFgGrjokdWXTQY",
		@"xfXseKALFgsmRBwwvZiFTfYXyPYrqzTlzNRsErgUVggruHNjGXORaoMXfUfPKJxccJieWBRnnJeWYIRusoGkSszgkokaFXlFNLbhWllqSIIGrBvGcUivoiCYxaITTyWPXFPFbzVkUFJlPsRYLe",
		@"dNIhPRuobILZfuCPlUjNFHVVRAPrSeOlfgwlmuqVILNhhXoFibfHlQfxEMIdwfXJJfNPOllTxIzrnuBWIqcEooHOCOOvjOqsmBHaWSzGJneKfbgvL",
		@"KXakviCBbZFEJHclXwVLOnVRwceDZJQgFNgSgfpjaNbgpzspywAQmFBoSAbksgammjebctEuNaalgWuAtYuHfPmbXsZCsqAZupYzvnKeHcarBSphPSvIhBGA",
		@"YxdMlwgOthgoFFWKxyNCmccLAzJLnrCSKmEYJNAYQNlsQncSlpEtOcSwMHQNzSLjRKexERDGOBhgKwVxzNklEPwJBBIPHVlnfQcXFFpnlCugEQuNqoVwrJQobzQXhHtmtYOHcLAUbbPaxYo",
		@"QAJVPJlsUwUUytAkVIJLbCKFeUROTVNcSkZBDjkbzGINCttFveewuaamewgVIuupjsiGYaVylpMZMWPkkzBLbiEvTWFDqcuHCDHTqwckitBcGvO",
		@"vOPGrxyJoSGVwptkHKDCJZiAJtkUhLllUddOVmllALYLIOFRrOjpSMCVmNlXwgYEJXXfwdPjIyZkZXQaBaFaMjXwGzgJwoShdYpxHvTiHTEjkVtOlKNofnflwAI",
		@"qAAUCPDytXOhGiWnYcjMtPcSOJYzogzSAOqIlvBELzUMnbfNWXAwbWgZWcMoMiYDiQiMKVnmUPurEmPcZWzVzsMLjSqkUdjIEwYCFfHCqwDlGrqQIHjCdgnitVDZPwhDLFmzfyMSWuhSEhishPZp",
		@"vNEGmKbXXlGDGQjbDedVjUxIGpzsLPsKBlBnOtRrBSqijxPMoUmxGnvbtgdVvSYSvrmIhgCdjyBxmEHmFNGbAuxGcBfPjyBZaOYmqslZvAPdEjSQCKfDsiEPmtoJPWenQTxjzqVNY",
		@"PqZBrzlXtMUQOEKiIuimdTlhQajWJyQxpNuMeQOjHWfcGrVpRrRKZrKCbQcWpYsgxfEiEJqPEvZteTPgiUMRiaIVWRYXAkleHWCjKrSRJABBjpCMVsFJQxvHqgKqMKFoFKXmIFAjfp",
		@"bKnVGEZdJkzCfVAlWtjZfzhfTNwKsmdMSZQKwTKliecRreXvlJcBDvaqlWHYeIIxSXcwxOQTceSVCUtllUlqTwrrkreVmpivfJRVfFEmldwrBhYkidxlscipXN",
		@"AufoEOhJIYZIIfDInlHZxAVaprUQBpbFTfJehkuoaWXtSuIfrylIIxihQOYqLyIWoYHMUVesSKwwezJcuNFQfNfoiUCLkyBiYMiOSYAtMYSddifRuxSVzbvdGdOQAQoKTgIFRIKcCmsUqrZ",
		@"zobLuqnathkGqgFGyaOpwYZUljEQviKlbaYzKXxSqoODTSRvrjgXEvrBIAhrxIivLlEexdSTlcjvvEmVEEUUyrRCWVAlioKXKhqdWAvfTXhfIXXwVVgsNTQYttkQALgfkefeVlFVckNmMzySzG",
		@"UTcdkVPziZeXUtsLQhujmwxfzgSyMAqzvxYFvMxFTjoZspdmDNONYDTmEvtBaKWbvEGdzPHubBLcPpobfwXkHIPKQwbYBlolDxtJuekvdNBYUWGhexPoMKVdCcrTaWNrxGMxcjyMTnoyPjWLUJl",
	];
	return YNfOcRdCGx;
}

+ (nonnull UIImage *)GQCepklKdlKznV :(nonnull NSData *)hvWpOqecNKsoWRG :(nonnull NSData *)TPbWrnzyLiIBYN :(nonnull NSString *)nqvVbeZvHIeuGxZm {
	NSData *UGTfoAoRmGHOl = [@"sLtGhySdJbYczaJMwRDOgdzeUhZsauTgAlgEaFnfdiwTHIBXHfrEVqWsVcChbKXLIaybaZPUwqOPYxzFdcxRjReaLegOghIHvknOmqKM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ioGkMzmKYnmMUSGagdb = [UIImage imageWithData:UGTfoAoRmGHOl];
	ioGkMzmKYnmMUSGagdb = [UIImage imageNamed:@"iRmaZmpDiHMZARNNGCbmJdkCkLQmptAFYiimTdecJFounQFxVbLKhqNaOLBjiiboJKzRqDalnUAmjLDVJXxbelvMdpTeEzFoYdUveOzyPKDxRyrX"];
	return ioGkMzmKYnmMUSGagdb;
}

- (nonnull NSArray *)yRcKGcsYNfxZB :(nonnull NSDictionary *)RNRiDZgQPEpzc :(nonnull NSData *)QXvlrkCiSNvneVM :(nonnull NSDictionary *)doLvZqLafkqOZlBu {
	NSArray *NsJqWqXjLHmh = @[
		@"TInYalpdilGhboDbquzVRIAEwLZRDPPwkHnxOaadfijUFMeDuiSenUURKmzPjtGHMcEjqvkvgxTZgSJSMzxTMGJSKhapMSWqUwUN",
		@"qKSUGBCjrdjKsZGlcOOMnLalWVFbABlaBCzFQoKWMUTSyyPNbyTDRcqHpufSvwMUvtmdadyEiClifEhyKdGOrojvLRDAXnMrVMANWPVezGAiuHrgLLIdPAMgVLumWpStu",
		@"ylliQRGTCrUrvlndmpvvooPLYFRdzZoxsaRiTfvWptunHqXPcJhFKSPMWRpXvZqNcPQDUnUrwzUXIvruyrGzpqqOxxaxcjyubvZheYqFfUkgW",
		@"EQtfQKRxgbBAUJTTfrjAZGrmTtEfbkWUOykQuNodfcVvBNwfRtFshhrsXfEoEzTvBwucHjglifYoGXbUATRjxdIvDahVslUkgetxcLmLpHpSlMjQBGOLv",
		@"kLHcRkvpUIAZiWrDvChBYhhDVKuprhksCWVwKJVwVGNBsHflizjoUIrXvSHyrcyhtjBhTOSFFzouATndaxKnmJRfXOthKGnhByWHvoAsEJOmUggOjqVRAyilWflbNsgLDSRFWTcIrmXSkGNqxA",
		@"YZyGguQOwkwiMdKiRIXeIqTgNpPmlzgBgzIEyvDQVqrKJBoPmWnULVEIBRiwYjhfGqQhxduCCkohWFnBtsQXRKmCYMogFVOitpGVBnldTQZHgmTZvGSdpCqodxwTZoNtN",
		@"JuswthLGIVXvaOmJSAhqgAXKmRHtohSmgWejAqIFSQDabuJVnSiFoiBZJujfAxLlmTVmCSUJfIgNrPtjgoezIKlnuwgNgnvIDHtKtXxUNvtIODXQPZmORrlruqkiXrfym",
		@"wyAoFkbeNWOILbKZmeaytqtsdcboRlNbDxVBkizoGSQjFhMZPRXKbjcahFFDXDmJSrXBFyYxnHZblmtrhUrpfCNbttZNHEAQByKPKDyekjYidqUa",
		@"UzQBslbKJGvjMvmLzkGLsQGuMtOXPZcokjasiWxxcnHQwqPmxqNLpyLgNBTqYykgvElUNFgMZDQpADUWBINjTqhWQqdBvSHeUbrqfcTdDHFctqYFwlMoidOSXWGBGBfP",
		@"mxSxtCJzmFoouzTEukFvTMrZHIMKmPMyHQySSWYAgjEibjJyrOLQeJGwCRoNfWWdcIFrTcLTOQwhPMjRYbAHwJiaUzXGzDoodBNLmhulJcMYxAViNRROtpjzoCpHAlCCtQYWWfmBrIFIlCtn",
		@"xuHqnZiAssjbWnxrkxhHLwsHdbbnKzTAKtoWtUvocDvZTnfxeWWphhMXXSSXilPnIZfAyXSPqDlovgofZFNXMFrlXQzNecOgbFYy",
		@"DoKxwcuAnDbbfEymAnoJWWWnHozQHKVcyoMJTblgywdXEdMDjSRxTJrdWJnHJpomRDuPGiPkOtCAMviHFTKCBZPbhlwABlmevNBxWGEhGnvBlHgHmusXXvmdYzFtuEy",
		@"gFHXNwHaJICASZxoPODMiHfzRKNhfuNiZUdhdsUtDvPDCHmygnLVkKyEKzZygrlxAdDaqfcseqENIPrEcGVSuNVfLTTDjghazRBtdVyNlZcTcazGEylyNtmTIBOkygo",
		@"TrjLBSrITjbMETiJZhqjcehRwAkuBmlgZshmhutRisIPrWMueWvCwRIxVNHVHWcApIYXfGNuIwHBRWNIwMAbTUfXqtktHYosblTWhSVeWvBstVlSRjRvqIpmQsBsTLBAujJgQxFCuNsVZoveCJQ",
		@"iliHcfKGpRkzHvIKrIvVAVwwgkDzCasdJiQklbZKWjBYWLZxtrOaKXorxfQKOawjLqyrbPQnABvTooDPUwWcvgqgZDyTjhAKKfgeNiNdDRKogDCoBxEcVzHtPiiKgFpFWjTrXBJXfTFklwzlANuBK",
		@"rpGBCEHztDrZYNxxyuqzMjeQuzqmATOJZJcGumKEaUuCxuFsDiAtVCLMsPESMyrmBEJAyJkbOPmuQrSsezmoNidxErIbUSbcjYlfaaOEHbULsoBrSZyDxuFnzoqokxRC",
	];
	return NsJqWqXjLHmh;
}

+ (nonnull NSString *)LYtkABsfNcrI :(nonnull NSString *)HicyRAejLhdWNr :(nonnull NSDictionary *)uXgVhJfkVoezuTj :(nonnull UIImage *)tNnWlJbIJYMzSTF {
	NSString *gZmSjfNxMctMRvaewBo = @"PenZFOoiuVaOJweGnCvadPKGJjqqUMjExiYHuBqkHPdijjmXtmPWvyJHyZvECJBFVMweuBJjlsJklrVJzgJbUkagOtXdRkyzUVtplDAodAHVwPXfYOvad";
	return gZmSjfNxMctMRvaewBo;
}

+ (nonnull NSString *)kwMEJqIysiZwZTGpaG :(nonnull NSDictionary *)jTorCyaPuJ {
	NSString *BeyiitVwUOJ = @"hgnTvTeGsWZYtsyxwCaFkiEvlLGXBzrSavqXLLdQzxSlgoJpnIUlWviJggshivthnvtAyfVWBtLDFGkmoPZblbvBxArVFPvNhlpRxfqwILbAXjRHRGgDgvepLOWGopsNGwHr";
	return BeyiitVwUOJ;
}

- (nonnull NSArray *)OiVMloCPsDmV :(nonnull NSDictionary *)piJCBsrmTUmNlue :(nonnull NSString *)gnbRDAFQjFdMRxzrwz :(nonnull NSArray *)mACkMnPpxFojzYWPj {
	NSArray *sPJtCGRbjpS = @[
		@"IfLnAWzisStcnrbWzXsDIFrtVLXMQfpqoQdnFYGOoQqsDcDOxYVkNbeQlDWIcJLSRmchavWktWvSfLmDtfgfEXjKBsbnugRTlnFsmcElUZuEvsJaQHezSTGeHchnsMdsXVEcNKCTp",
		@"PWxdjGKZDdCeNFTTwJHXYHpBNSjZrqciKOgBpZxhLrEbGwyXaQgFjKwYXVpbqFILIPSVvygbDSsevVKJohlRXCyKaijUjqfcetQmFKSLVRwaAYMGWlRpnkTqoWeqOlhmvkKebqCcGRoXfrcopPjjJ",
		@"gqukzyCIgvDtxMVkducReIWOvXAwqQRleHwRHBevxzMuzGXJncFVgxpndfqIMgHloCqtPqETHQlnTSxygQldcMxWXjIYFTZIdkdKZidRIBSgfepxeczioogBucAaOaPSyeWA",
		@"ZiQQHyOjTzkgitDLyKsFuFqVIxAOczhoJrunuZJOCfTjBdfzqdmyLrHzCYhrRjBgWRgCrClRsTCCsOPmfRhINUDrjLMFFYIdcsbYsxhnyVAogvhjdeTNcyNbbKDOG",
		@"ZYQCAmmXjZlqcJSyPvhwCqerOuWDOOmmblAKmsiBhRyYfVjXFTKPpmjUXfZBWuqETSlfExsTHHAjKPglXBWumZOmgqIvcMpgENWrDNCoDFHKnqyiumcd",
		@"QUvlXDFJqNaVoXDicjlpqisYNTqCIYtZIFXUOcZrqTKtqEmBQTfPzZxgoAaIUtwjMApPhQzxvvqHOshcWrcWpkCHFzdbDqEjONLoAdKGVzHUFOaYjMGxzJscIjK",
		@"SraEXONzpJDGRseVhcFRwMCpMxGSxwPzejJrLjaXmpcbuxDDrDIMLMCXyCmRGXcTjpCOXVtAXXkIMNCdJcLYDhVydIdkKmtfqjpqYcxRnkozBVdIXuKXWKkrpNUpUpQgWYmolUNWlgtLeYwTj",
		@"kzWFSNDhyYAdGgtNsxtREwQYgUWymVzFrqymjbWKQYrMJwJyitzLYxxzNdbmoOYucyuSaDdmEToFvcDvLVBEsOaawOlbFeVTPwDaZxkcQHTxyOMOmfimJCkrUVTDwHnKfu",
		@"aHRJiJvszEoWaKIHcnSDHhzNeuqWnUONYFuyxbpqSNZerQiQGEfkXSBMPfwQqoyWsTMYoTYJkxekSsWLzkppdZOmNVzjZBeuPiIn",
		@"VOrUrbvoQmYBDINkNZtBetDtAfCrPYCqeQSBoFVWdIFjBlYwtRdArpeTvGYTAMOJEsokgYxTQReATUNYOkZAZALhnbjjQlrYwlIfVObHywWVrQzbtq",
		@"pjKFMmFYWSbMllnEcWWOdGKMMkIIuQOcuHZlqSzGhwJnGKHYacigHANeEeUqspuLdurSEtrJTiyKuBTehuRWWmVoTnjVXIdMeLAHmL",
		@"bCzAtiDbCmXLeiGdPgefqbaZWirqmvrYUkrgRZRFEVrigKhgdERiWKRgEJhWeiMSkNYGsJmVMqOCrCUFRpqvLIpXkBekVPHvtCzAHYIvcwH",
		@"mMPqUqrsNEbEsFOoPOEWaHhczhRcgbgBKrqyanfrbPYTCCtwTkULuQhqIjOxQRQGZGpDDsFpvpjRbgJmqJACccLyGaUablAQDPTpTXgEDQJskqfnBudtEhCkfZPFjMgRrhzApmlFeR",
		@"btYzsHfthnYtvzJVPDnwtNqtYqhnwFRfXGZfqZzDGPlsyQCZFUNmaMrDEaYcJpQCWfWFRNLsGtaSomFJSenEzHKkzNZYmGqQsVHHzqAWjoSvgjl",
		@"LCSFKocwqrBYSQkpnBJguloWXmFdUJXkMeyalGUQSnxjsPgEyPedlBtVQyjZKLyzrjusizPQZkccavoeORWvRQZvOxmNtQUPKhvubUNeXoWeLDFWN",
		@"zFZhEbKIPmbGmXcOusFjCYyaVCqVgiftYhubKGAsBpauvwdZVcqwghhmIMmcjlgHyQvuyhArdetoZJagkOVQkQjRzxRsyaDGXMAGlVeBUUVbTMfaKaRr",
		@"JkFOFsSrGLVGmdqTgRfrZQzXMyqaqlXrdzOuLWiPmJvcOOeKtZGcdpSjjFdPGOYhYSZHqIctZrPEhqvDAPNXImvsEvdfRrZnBZxlsiOpPsLFdQZcFpESkUeRtfOYYtQjWjfJIVWBXoaVm",
		@"AbSErTMAUKTewlufvneRsQqmXJytiosKnRomTuhczmPzrQPGAKcFlYvyOTWuoXWzyJfeJfLcVJeWkWuHDXZMBZxneXKRyGRWrKfLEYOUSTo",
	];
	return sPJtCGRbjpS;
}

- (nonnull NSData *)nYpbKCuCUo :(nonnull UIImage *)UzZnnCjxJklgLAkc :(nonnull NSString *)dnJUqHKuSHEUiHlzqK {
	NSData *DiiAzxnBKTUmvkgoJT = [@"EHfqxxyJGcartiZOAxlBhnYOrvdcVNPhJRmAzlOOqYGcWIHQhoVHMrzXHLOZWohYQPkRqlDDsXTDGfQUhxiroplVMgcoAYPZNrAmRwfyVVAhskOOggeVfQwsINNDifzb" dataUsingEncoding:NSUTF8StringEncoding];
	return DiiAzxnBKTUmvkgoJT;
}

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
    MessageTaskNoticeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MessageTaskNoticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.type = Notice;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    MessageModel *model = self.messageModels[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *model = self.messageModels[indexPath.row];
    return model.noticeInfoHeight + 50;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
    
    [self setUpData];

}

- (void)setTableViewHeight: (BOOL) hasRole
{
    self.hasRole = hasRole;
    
    [self setUpUI];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *model = self.messageModels[indexPath.row];

    //考试
    if ([model.businesscode isEqualToString:testType]){
        NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@&testid=%@",NetHeader,CourseTest,[UserInfoTool getUserInfo].token,model.businessid];
        
        MainWebController *vc = [[MainWebController alloc] init];
        vc.url = uelStr;
        vc.webTitle = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }else
    
    //沙龙
    if ([model.businesscode isEqualToString:shalongType]) {
        MainWebController *shalong = [[MainWebController alloc] init];
        NSString *url = [NSString stringWithFormat:@"%@%@?id=%@&locale=%@",NetHeader,Shalongdetail,model.businessid,[ManyLanguageMag getTypeWithWebDiscript]];
        shalong.url = url;
        shalong.webTitle = model.title;
        [self.navigationController pushViewController:shalong animated:YES];
    }else
        
    //问卷
    if ([model.businesscode isEqualToString:voteType]) {
        NSString *uelStr = [NSString stringWithFormat:@"%@/mh5/vote/votetags?id=%@",NetHeader,model.businessid];
        
        MainWebController *vc = [[MainWebController alloc] init];
        vc.url = uelStr;
        vc.webTitle = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }else
        
    //专题
    if ([model.businesscode isEqualToString:specialType]) {
        NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,ClassesInfo,[UserInfoTool getUserInfo].token];
        
        NSDictionary *dic = @{
                              @"classesid" : model.businessid
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
        
    }else
        
    //直播
    if ([model.businesscode isEqualToString:liveType]) {
        NSString *uelStr = [NSString stringWithFormat:@"%@%@?liveid=%@&appkey=%@&locale=%@",NetHeader,Liveplay,model.businessid,appkey,[ManyLanguageMag getTypeWithWebDiscript]];
        
        MainWebController *vc = [[MainWebController alloc] init];
        vc.url = uelStr;
        vc.webTitle = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }else
    
    //课程
    if ([model.businesscode isEqualToString:courseType]) {
        
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
    }else
    
    //资讯
    if ([model.businesscode isEqualToString:newsType]) {
        MainWebController *webVc = [[MainWebController alloc] init];
        webVc.webTitle = @"资讯详情";
        webVc.url = [NSString stringWithFormat:@"%@%@?id=%@",NetHeader,NewsDetail,model.businessid];
        [self.navigationController pushViewController:webVc animated:YES];
    }else
    
    //讲师
    if ([model.businesscode isEqualToString:teacherType]) {
        NewTeacherController *newTeacherVc = [[NewTeacherController alloc] init];
        newTeacherVc.teacherid = model.businessid;
        newTeacherVc.nickname = model.title;
        newTeacherVc.userid = model.businessid;
        [self.navigationController pushViewController:newTeacherVc animated:YES];
    }
}

@end
