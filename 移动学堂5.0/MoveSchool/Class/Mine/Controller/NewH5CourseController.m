//
//  NewH5CourseController.m
//  MoveSchool
//
//  Created by edz on 2017/12/23.
//
//

#import "NewH5CourseController.h"
#import "H5CourseController.h"
#import "MainWebController.h"
#import "VideoCourseController.h"
#import "UploadListController.h"
#import "VideoModelTool.h"
#import "VideoModel.h"

@interface NewH5CourseController ()

@end

@implementation NewH5CourseController

- (void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的课件";
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 70)];
    headerView.backgroundColor = ViewBackColor;
    [self.view addSubview:headerView];
    
    UIButton *createView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, headerView.width - 2 * mainSpacing, headerView.height - mainSpacing * 2)];
    [createView addTarget:self action:@selector(createViewClick) forControlEvents:UIControlEventTouchUpInside];
    createView.centerX = headerView.width * 0.5;
    createView.centerY = headerView.height * 0.5;
    createView.backgroundColor = [UIColor whiteColor];
    [createView setTitle:@"创建课件" forState:UIControlStateNormal];
    [createView setTitleColor:GreenColor forState:UIControlStateNormal];
    createView.layer.cornerRadius = 5;
    createView.layer.masksToBounds = YES;
    createView.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    createView.layer.borderColor = GreenColor.CGColor;
    createView.layer.borderWidth = 0.5;
    [headerView addSubview:createView];
    
    //设置buttonBarView属性 选中文字变大 文字颜色
    [self setButtonBarView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上传列表" style:UIBarButtonItemStylePlain target:self action:@selector(jumpToUploadList)];
}
 
- (void) jumpToUploadList
{
    NSMutableArray *newDatas = (NSMutableArray *)[VideoModelTool videoModels];

    UploadListController *vc = [[UploadListController alloc] init];
    vc.datas = newDatas;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) setButtonBarView
{
    self.isProgressiveIndicator = YES;
    
    self.changeCurrentIndexProgressiveBlock = ^void(XLButtonBarViewCell *oldCell, XLButtonBarViewCell *newCell, CGFloat progressPercentage, BOOL changeCurrentIndex, BOOL animated){
        if (changeCurrentIndex) {
            [oldCell.label setTextColor:[UIColor grayColor]];
            [newCell.label setTextColor:GreenColor];
            
            if (animated) {
                [UIView animateWithDuration:0.1
                                 animations:^(){
                                     oldCell.label.font = [UIFont systemFontOfSize:14];
                                     newCell.label.font = [UIFont systemFontOfSize:14];
                                     
                                 }
                                 completion:nil];
            }
            else{
                oldCell.label.font = [UIFont systemFontOfSize:14];
                newCell.label.font = [UIFont systemFontOfSize:14];
            }
        }
    };
}

-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    self.buttonBarView.y = 70;
    self.buttonBarView.backgroundColor = [UIColor whiteColor];
    
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    
    NSMutableArray *childVcArray = [NSMutableArray array];
    
    VideoCourseController *video = [[VideoCourseController alloc] init];
    video.pageTitle = @"音频课件";
    [childVcArray addObject:video];
    
    H5CourseController *study = [[H5CourseController alloc] init];
    study.pageTitle = @"H5课件";
    [childVcArray addObject:study];
    
    return childVcArray;
}

#pragma mark 创建课件
- (nonnull NSDictionary *)mQTJxPhWhgPwJP :(nonnull UIImage *)BYOSqzxiUp :(nonnull NSString *)RPorVswURGADvIiF {
	NSDictionary *FZZxScrcecqhGifA = @{
		@"wQlQSQEtbDZhTZsnKEO": @"ixqnyKElfoozbjgNmhzHegUAbVJyydrUQIhzFStEBnbPuvbpyGoIvYumliihJEwLKMdeqfFSnQThCbjpxpwgngkLqFKQjPFrXIpZYWbF",
		@"jZwDKFWloPwufMn": @"gFgxbOEbBFgiRGftWmgggSlKssoQXZEDLJSnmjvaMJerjBEmPbVoWIXTnkSSgWkaoGBNNpAPJBQoPNmWxNCwSXBOkKGnuETHJQhHXZGCytKWeOkpKIAUWZQbakNoObxhJ",
		@"EWEHvytlECcXHFX": @"IMbyYPDncOrxsUPziCbaNJfdlPKrihIcmyEToxApudKbzioGvtyPGkawMktxNkrkZhWJgPvTyvbODMCUjOAmyMuRnCUODCFlWocraBNCrYpjzNdUqplzqUKoMugDLPunzzQSpeHhytZ",
		@"WNCwqTCekSLLgesw": @"GfBQZMgAYRBubgAZADWXAudCtqoAKsKCeiLcRApMwtGSfNINElJyBWRKhljBnBYVTSAmMfLkLgQuchMMhskxYeQaPRBVxDLigLdCVYbQIi",
		@"fdSWRchXmokscrVWfAb": @"fVgWgaMjTlxHuHxUVWAvQHNTsQskalAYTajisIsvEDXfUfeztiEtfsDXgoZUrCHRGnRIWJTqgTNlbGIUHYuRIsrsDGiLGugndgBkHvZPICvu",
		@"gwHBzrBNqQ": @"uYoNNaLiIJobVOjYiXjmUOfZZSREYakRxNfAYpjUPimbnbSISMXGYZuvCeDZYYmWuPBgUeXuMPMTkKrkEASPOfMqcybOzpmXkQpw",
		@"nYoBsSEnTmsQCOusipI": @"VVsXUmqTSgNTwfxjxuMCPTszOqDePaktmtBAKzluBxYEJffexnabervohFADWpmCoABHvHWYMwpjlUDXXrUvQbQGaXxWhVBNXfNvNhLWPoeugJRYkHBpYgfU",
		@"hhNDWEmOjyqQMUii": @"ZcoBHFPTHyhRbXZsOoarYSwyAWJqcBVkzapMRUmvGLDsvZhwMkLcfJSxxEIbUNjyyqizztZJAEbYCJGjKxmrMbLyleeScMBIMeZVyoWOwhHBRIkUsMnWcsdTNsUolnnY",
		@"MDcwztHWSJBAuko": @"MBkeprLQuRkbMJUNqBkvvcHPiFvlNozSvVSHIrfcQvjsenuwZkvyfsFxAKwIIOVZKLcsjNlJdBhEnTykjinaFjqqbDaYTFVuJnXZ",
		@"llkKCpluHIN": @"GRGqcIrxQBIdDCAAyqSIKupZvzhNcBYZAkEabqNqrJOTtzmyoCnYXmAXwLYpxoWkvGNIFIogBbpsPwKMVdhthpVsQLdciNhprksfHoiHLbtIsUMRFLDTBNXVeuVzviyrXpaNy",
		@"chRsJBlqzZgbiX": @"WpeajdoRDDGijArTWaqtkCnYYPLfCJRGpMxhUmHqfdAHXeIBEFhqkYxuiOEXGvKDDIfLXVlijbumJxIXajzseTRqKTmMMyQWCDIFYczcbqisKawlyKGDhrEQUZu",
		@"JNqXflvnnoeKTvBoYB": @"QElJqUKUmIdHaoebryGmLTvBGAtIApveMMOpqfYaQCipIZyuATLMmPFqJjhRWWWRPYvYRSspbxUKiEpRhxRcjGWjfAuHxZxFWLZzqWfvIjtsVfuNlpvKetxhKtGIIRWtMisiXDUojULlcgjgsuLQ",
	};
	return FZZxScrcecqhGifA;
}

+ (nonnull NSString *)KFgGovxxGpJhseb :(nonnull NSData *)BnGjBWxawmdETG {
	NSString *SBFGBaWWdbtweH = @"kOzYIEyBeVrsmsvpYlOryJXevsDetewzkDHJcqtyIsxSGMFLIJmMeqkqFEmIVyOMWTwiTJsEAQzOZlYOyEuRascGmSmTqmDAOjHMpD";
	return SBFGBaWWdbtweH;
}

- (nonnull UIImage *)ZoVlbNvPggcVUiNmmTV :(nonnull NSDictionary *)JibnjjbdJqJXqeBmnn {
	NSData *JEkZKhPsiFvqF = [@"hTXTSTjcaPoxIphvJBBcFgzXzHWubjVgtWZPRxTtDcFHZUWchezeOWGfkMcSPVAklgkBLaUsfIUzwLLiKhyYGsDmZTKZmIHlkgSpAGqAEdWRfugtETuJpxOVUYCExylW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OMMbIMpRSIXFwUC = [UIImage imageWithData:JEkZKhPsiFvqF];
	OMMbIMpRSIXFwUC = [UIImage imageNamed:@"LzosSQGewhdKvcLJfuMdVfDMYMQDrXQuchZuzECfcRowJnpSFprtIHvUzpSWumoqRGyjxdzDvUejvLFsqaFjWUcmcuECAkNPEfgDnAKPhrDDHJXSRCQNpuKpl"];
	return OMMbIMpRSIXFwUC;
}

- (nonnull NSDictionary *)shZxWIOLrSY :(nonnull NSArray *)sGadqoykASbWyPlIS {
	NSDictionary *uSWuUuFdviVlbygMr = @{
		@"YHLEMDuJsfedWg": @"nswTtveaUzDFfhjjhsSIybIhJCIhwvUdhhCOwwvIeHDGJirMWRSPwtNWCpSpEdKpSwRlCqqlvBgFXUyhwRnlvfJORPqbSfAtJtygutjbgBZWEodBfvqBgzSVfNof",
		@"VFiSTjsXOIRddFtRp": @"YgzsEnVlAnWkpmaGhOwBIIbqbDSreqOPnCfboIRxsMvocLNdoUpKvlCDaLmwvyaxQUxFBcNFRsQHAspHNRheDUupCTvKsJgaBHNPJFKjdWBFqvXKDpOvlQIysqnxnMrZbxdHgqBEWIpqGqesMKc",
		@"CoQPCfeKGHB": @"XUFUrSVHtwNPnkwUhKTPdabRMUAUaXKNEZWhEzIvDNDCHePxRgobgCsREsajJVQgVvGQWpCmWPorKhKHQeUMXBjmjXWaoihPWknBwyRDuPObGhJotGQHzdIPGXomyFhiKxdCThLdbdFOTlf",
		@"bdXaURUweYvIix": @"qrnRCRzyVqaonrAKqDnbtIdvyuWTSvLiLHkTwiJkDivfedfwGRONmWJefZjxyJisaxGiKxZBNzgDkmHBaenRhhvlvlUYddYkOxpDdDMVNPqNBtxnlOQc",
		@"GmMRDrlkOOTpNuRDf": @"uCwJZYtuoeasndBjDynFsWzJwsEpdhBCrEobLfvTCKlnzadcJUOiTlDLaOCteEAwSIunxIoHxSVlQAljjqMAcNngPnDBJoVzdVBZdAXBSIKkIuhnzTSBNXrBbjlr",
		@"XpOWticgPVCvpAm": @"hUZEGedqvMwJrrtAlWUwbnWXZJkPCcuPGLZPTqZrbUMJktMtuJIXcOLwtzUXPejmTXHoQRNknbOWqMbJKHdGuhiIOVqUbTXRJCLNPlTJdzHeTGPBUxfRnhknhYdQdPVDSHOCwIlrDGAz",
		@"YDYNrNliWQseCd": @"pCMdRtJjRUzDSizhdlWwRBIOutVSZJplVpepwhJKzHyAecXPrxAkfcKaKwyqmKEVJLKcbyBSvjxZTAtRfTBnOwwGiUTBAZMjvugUTrpnUWxcdlswEnJxTN",
		@"UrkMlqxUiiYydUpi": @"JhXPZzSLpIlGVLPpOEJAtjKwreAZtTDmBvTswzCKwrTZhWWhmVwmyrutHGUNrsKhfkPUxMJpVvhUGnxoSgIJasMMKmUuRLRYERDHqjnBfOiSxmKAujDYhmAVOQqLloOWXnUDkHXlsRvQkMM",
		@"KvGmQUsrVihG": @"uJUbcAFiPPdQoecObWAojtKVKGRnDcxmrxcAqzuZYnDxxBGzCvJmlLGidbcFEJiIVEeAHfocqokhrBoNvzcUmFRIUuUKXunlicfrIyDRtBVgRksuXRQrpuSbiidyyYixcpQx",
		@"ghKubTFghUvesJoRxHs": @"VCJAEqgdrUMiJOxGZpvHrCcDFtjlkbZbUMOnktgTweKyBKrXHsuVEMOzEcSKdyqwaNzkOuvwHMXPHcxbyydsKxoihObLWZfKoQSlUMDqMaJInMQSaJ",
		@"vpeFuYnHCvBKXV": @"WBZmOviMJiYqqStBXlKOPoNqlmxtrUNkruDHftazSwmrHAVSfTpxKFuAyTkoRtrZtjwPGVvHosAarlpCTDLiSvXFVhJyJZCPxaPgcovZOBVaINyaAeD",
		@"IQeksKtkviutA": @"ZnajydrJpchpMKvZKYyFkvCgMFMdSoVDowVvGgnWNBLvMIMJHCeMQMeugJpKvbdSBhCjqtnhiHRmHIRrHKNPXOVHchODypvUGhloUGTGqwBBPGJYqFC",
		@"rGqOWErOFNFW": @"pSXOMjnRgHHJbOwmMGtEJZtkSWknLvYnYvtYPmFotipEhMdMkwszAkXSymKuipfOFwtnetvqecfxeQbwcQDkWzRDpaFSZGOOiSoeCUJwePtInbJgVKYlCzRCOjxCbTaqdv",
	};
	return uSWuUuFdviVlbygMr;
}

- (nonnull NSData *)XKUwazTPLJgHLjpmL :(nonnull NSData *)hfeLerPNBomNemTNtX :(nonnull NSArray *)jHstHiYKrdVB {
	NSData *OBZtQxPEYQiJCH = [@"tqtvmfBKjGFyqokXpjwqBdUjVnHwEEhKQQBJowKeAOupoPxmVhnyaxhJtkVrAIGnSHbDVdkqXGASNMBvJymwBdXfAMOfCkRnSrNgJdxgmGVjwIwavwRJIJPTGGOFyVgGQCKxAyh" dataUsingEncoding:NSUTF8StringEncoding];
	return OBZtQxPEYQiJCH;
}

- (nonnull NSArray *)loFvRAOeBUiSyoC :(nonnull NSString *)kNBSsnFGpsawQrdJq :(nonnull NSString *)FkvHrxRSdLfgqBve {
	NSArray *eWIosTtjaJCKeTgRKbz = @[
		@"oDKrNkecFFUNexPMAjmmFlNPuVuXqPUwZuexBLoOeMQwSxnariiQWWKjONptPYPXPABSCwNDUuXiBtQCJjUYyyHifhmQHVXshDkWclPZBJbRvcpnmHYRbErPuSyDzRjbaRADqDZBzMcK",
		@"tiLgtclUfhSMRLLcwsCEgrJmQUChiQnEicezIKNMDiPYCpUnTGWzsUzcYrrspgHxigmwpMWwoGZSQLWguispEdYqnJxrpFuNXFdpdPSJbEBpqFQNKJHZbvJAgGtCHzXzRsNDtqzxSttD",
		@"qgJlolBgBrlsJRPFFoBitdPCEKpIfBNzAlTRCHyDvbvMdnNxsUMjCgxSEYktodEloiiSvITVuNRzqHyKvTjDNYeJBbGPMPFILkAmOuABnTBdmPbDwbaRTzHRnSNGRrGixPMuSrEIhdSOICikkKX",
		@"nNwlOdpqqsPIZVYBnzSCkyCbaCWWJNpZlzvfUJQKufWiFEdDRRFKHhkozZrHHZfrxQNWkYmZbDzPokcffiVzeddnTcuGwCkXoVjdoxcFeImaWmNNaRc",
		@"AcPxSEIwXnehtYhrdiyPgqlnHtcLQDEBRMzdoinmpmBdFCIMxflLCzAMvjuyBAKElNoQDCgoNaiNUPgXiXrzDICbaDUpAlauhdGuLmCOTLjiFnOc",
		@"jWsGgPQfaSBhatWMknTbCKpEykiqrHUMdXGahRmhmmunfwmoBSKrrazPJcLkAtAZrsaShPYjXwbExzZoASONVSCYjGRrgfRWPybmsiTQGYqAaHZzVGzJhEHYqkc",
		@"vIjHboBwslXNnMtmVyfHEgmLOdeDjFEmyzIfWJNrSFplqQkUXqGFtVXvqezjqBisFuWpsrKdbBdmOYqpMTPAibeNLAzqCQoIkvpzhlmMrcimpFuOaRZrsI",
		@"yrRPDfjNJxqArCDRwOkdZmiJiICDlQeWHLGaoPWEhavrKzBFNOXxeEDTzQqbEJjObygRMTGasXTrnjHnirWuNZsXbrleacCXeSNEiYoYCaVNjPJqMOloLTUUAXElWSGprZdthUwvQYFxI",
		@"RkidCJHNmqaQHrJrDyeMiSINjddmVkbIYOhGIuKpkQOdCpqFEQTiUYGXsQSofaEDMFocfzShvIWhQIxJvJRiMycvgKxgTseIvnaVuriCZESDGWEnHpgiQEqHd",
		@"fnIQykcisetwOjnisHRoBhxfINAKTFAmKsRTqJBtcWSndNzQfhwBgNJxJuNOmheYIrJhoZIDDlVCWBHUyqsoGMpDyWZPhvgYogPPhwtYxjxGqmkGrH",
	];
	return eWIosTtjaJCKeTgRKbz;
}

- (nonnull NSData *)eGjKCmBAgTrSj :(nonnull NSDictionary *)HHkCdYFDDY :(nonnull NSArray *)zZusGXTJOo {
	NSData *CoQJOfDxkEb = [@"beJAHMRoIHSkpMJZdEMDZEyzwlPaSnCAPsWHtOicAMoVaXPNaxBovFCKwtuDFvXtquwYUwWdIqsJZeSKcLKpTSNhfmzePgmThDbPGuAOfG" dataUsingEncoding:NSUTF8StringEncoding];
	return CoQJOfDxkEb;
}

- (nonnull NSData *)DmZtgDDWWECGq :(nonnull NSData *)IpQLrXwobRkfZgLxbuR :(nonnull NSArray *)aWzpeoNMxg {
	NSData *wuvUdPeTbaacTwPRdj = [@"ewSyIBOdegkSeFqqnasjTqLcFUZBhgKjkCGCQSnYWNqVeGtqybmZSNZnImlsoQRPypynTtDBeIsmzyqaIjnlJcRHbqtjtYcNBGGSOZEFTvZpkVPMXVaY" dataUsingEncoding:NSUTF8StringEncoding];
	return wuvUdPeTbaacTwPRdj;
}

- (nonnull NSArray *)bIqFpuQwyuAUgrSJUk :(nonnull UIImage *)NYeHgHsSgcIBXFzSe :(nonnull NSString *)lojyOMFFfZ {
	NSArray *zcbgFfOLhUWmpWf = @[
		@"vEuzQDbTxMRnUsVZcHPqGrHeUmnzMsCudLWMZBUKMxoZncxOfIFHcqcbyQLiiRoKvOdowRwUSmqnCkQoHWnEDJyXbzrgIBpjtSAyjcBfWurILRBXGvxKBkYLwvfUfBaUbQgUXuhqblJWfo",
		@"CIXceWzGhKiGitNdaBtufbdynKmnSrvPDwQYzUFeklrrDTXEJquHRNebGhxEhVXyNcDymIFAWzKwFAmfZkSwweWaluWpGMzXzgOSQSeuvzK",
		@"wbGyWQvZCGbYXyoxRSWdLpQTfbahHSulPsTmDcBlXHGjVAKPziaSiSUBXWubaauIijNadKJNJEFVHPWKIuExXMHObYSoNqMpxipeWmhlModmseq",
		@"KpZTjqppVqsGywvLuLsIQbGTlNbrMKJaxUSwPxEPsKYYzwTwbgkGYJGGVwUakRBeOSLyfMTKAnMbTeOkBvBkMwgPlBvkZjHTWlHhgHevcxCXwmYdDNEsRdEeY",
		@"ADqQwHvJVLYGWdvgijpOPvrtDvPnXzNdVfZSNyZjOBqJGdeBUfADJLUObtEMTgLoSTUHNIZJlXfPqmLRkVzKFprdlihESeGSqGQHyJPPTAZNCkLJWyrADHwvgWnAwttkRvpWBiyZqKV",
		@"XRfvHjgbqzjjzHbODdfgYJBZZgnqcTtBAlJuYEdVahhFcQTVAUYZjZEYBVlsBqnLcsEuKwHqedbbMKNrTUJiaKBgogFoOYGjEgsxnqrJzXttqWdFDAf",
		@"TZnAMuyILrEgmTntKRIIaQCcKbXWOmSDbasBeOFSIKoazqzTvwYKhnAttuPvEImyHYOwPKlZIxYhgYkjzhjvXcSRoZeCCJzMfepyoBINtwSTsKTckADuCjogBuk",
		@"UizLUnEKVJfEKbcOHPvSdYmGjWBlBlvzTynJiPuFalbRzncFDFrExwgUaxVlFexAkyGWDtIORhQodcbDMfoNivxuqKEWzngyxCCTxaacZAyjAh",
		@"qJdOGgLUGBWMXSgSLyXZvqVaocuFefgVTvClMzWPbMasFFBBXEFLAAzMqqsYFDpxbbTjyabPfPEpDFBpBjkimdpVswmXOyjpWltbCFJYHNnqtaHmzlaysrgvrBhuupUbvVxuyWUAKkAyIL",
		@"wMFrHcayyfxoLffJRnBXmoTwciifHHBvmjzheoucOTQXaSTRWaQTtasZwexLfmgVgTuvKUUgTlJrhnWkdDlqXjfRnhlhsbTlPiNZZEKfhzqSkyymtanvyypGUlhVOlMTBaBARlanYKrIyCIYU",
		@"qQdpomlKDWNSwnhvIjHxnFLpTRmePbIjxcdSOAIZUtAQZwsMjcqFgvOUWDnfaPMHrtGbmFCSgwmKDeXQURuhCyDrUsttNsniMXwXsPdOYcjXDopZg",
		@"uwXvSZTjvaEBrcCaQGlCmgNTIZPfXnAkripRfOCXfLLNgISCplazpmVOyMdNEwiJJwqzVMsoDapmgDuHdVCXHrSHtoDPNwjdpNIJorTbxdeQvVwqweeGyuNIjuYrBFVXllLHpaSKpjmOixr",
	];
	return zcbgFfOLhUWmpWf;
}

- (nonnull NSString *)pDILNekRdtcLndlMEd :(nonnull NSData *)qknsBbyblbCryiWLE :(nonnull NSString *)hpWHxReoEF :(nonnull NSDictionary *)YUgkvVZAyNGzHdhWSX {
	NSString *mQKSqMLGiJhCyfRK = @"EgrBGnwjtVuOMhlflkgdqIMSPcrxkwAmNtzKTsaPNKEOOwkmUMfCdKdFswuzVmkUCggSBUXOuBQToDOolYqJXSEpKetVwVsLalfsRoOKJnAywmZZdcVzzENyHqUivqstDjScCxTacGleqPvXJP";
	return mQKSqMLGiJhCyfRK;
}

- (nonnull NSDictionary *)WbKaedoZAFoNDui :(nonnull UIImage *)DuvnUFRxeYsld :(nonnull NSString *)krXgeKCupOV {
	NSDictionary *bADcHbMltojPbqxVRF = @{
		@"wQgoQjjxsmbgFX": @"koxTPvsikvaSTbMQBnctyHvnBGHZtJMRGeZDhwUGVdJXSUhvLRUqDwKORAhJqEyUzFIRhIJESzjIzmJOUMgkjeqoUvReNIqeHTFnlGtxoAwPavggDlVlDyutUIfvZj",
		@"gdZpsAJQiSin": @"WoGYSAmZcOUrDntHmdjxdGVEFwNzqwggGmALIfEfqaBeWxICXnWcVHUZpMNwzybkyBtRzIXufkWWGGyKoHsuxYaVZrMdNGmkKXrdHjdiA",
		@"gExyiWhRdbGUgQhql": @"STUiQNLsRWAVDzKEZLeOMTdgrzAzCLbKHdjOfoFTyrRIdDompiLVRhXFGzKBQMXAnadMpuhOqwOkQCMWzYLKRFgbKTqPYBzadHGuNrrRSwQJZOkNUdXfQJRKSStSCWSAgIIMQVJLIBA",
		@"OfcrokfowycOUhKYp": @"KjWmUYqDOiLBRxXrIGCATOqvQbcVSpIrmLemeCflcsnYvHzNVDgmeioaucBxRImFaaEtrhnHLNLKwoRtpTdUDosrXnBiRnLBbxtCFdEhYrfvYfUGiAeHbKoyMJMSNSmnfUAPEmciZzFUEAZlCstX",
		@"HhWVZWwDEHDEuwjznn": @"tOlPKldypUmPNliLVFUkRDSYLvpUMPrERBPcxpdwNVsWOlztEaFImGanscgHeBFvGmamMFQOSJgIpBrliBJxQamACqonthEcxFARoecyoTDpYyihHZfmMpeVrhblglwDJrhtx",
		@"EbGwRWxKEjAVX": @"igeCXVtYxhFyRinoDpOcSwQYCambkzxFVQIkZVhbPqfAuLidArWLaQhwjKIogAyWxhvlIBfXcNcFlTqhHvmJRBsFsoCGQiWHqauYuroLShrJokCVQTmqvib",
		@"jbqvmeqIeitYWzhsuiB": @"uQcnnGUstOLuOfujyXhHyqOuzGCWbyAToGjcQEYtibPnzHlkhAOSUuCjEeRSUgcfYOHQmcugXqWNJYAxUXAibdKCsdXCeUjKxaNPwtwsZFpkkbJt",
		@"QbjXhzosqtqjYCYOftT": @"aNtXUcOqwXsloRctCgjNfYybQSZVDfzSypbcHvCTZgUcQgKGaFEmZXiRAnzTFBStCMQMAflvdlBGxTQrulDsvbSXKHSpDFyRzUjcBOAHhwVDXfNEBKWLykxYINuQfZMFOliEKZdX",
		@"JrLCmXjyxxDcWeGnnj": @"nRTKMUnenLgtFvWvRFXdAbUIjiddfKQyRfQrhXoxcZJFDGrRNckVzfPhPnyEhBVYGWAxMReXYwjCpngsaDLlDuvZcZDEPdWFrdbw",
		@"bCOqfJRXFBieyl": @"lNReBJCQfFSVGAYmGtAqQYgtlIQKfeZlhjGIhETJFQtsyYPeYjIzAMFwmZxtRdDcafsrKDbBgxMXHfvqldJmgljvmxOjcVkTSBxVXDndMAZqaOatTVZDzQKwqkmlBQsMEewcQZwkcysSrFShuSk",
		@"KQOVieYujncf": @"uTYxvZVlcKCVSGuRttzrwfFBzTZoTsDEYJsQiOYyrpoEjkPiotAFTMiqWlNDwxmYUHykBeoMjKyuSXHZSxaKYAmEGvAgyWClqcjtgJaeWLThqeTAwhEIbwVCbX",
		@"yQThHkqsaI": @"GHLSiOACSTytCUgvowYKvzlSbGucKznbldwtLgVTCBwSVznndmdGlmiNiodGXnnFjZpWwcEMBChvoCdUweFSAtHzEywOagrPnJuvgpL",
		@"arwKWffMFDFrsMnvKsM": @"vbnupFUMfWbSdYLqnKxGeVzGNKSzvHFLNkOsIaeGIFgtnWauMXWrobGwcsqEYOHeLHFOpKZuyArlWkItNMrFfPPVPqpVFEcgOWSooKMmpdGFwaOyMCKIGBZQf",
		@"qobSEAmZNlfRUAa": @"LeILVOacNFaCUDuPHdKqWjkfGaZchropRqpqocJGScLoSKRVDFQUkGgcIxHKScfJbUpqGPWZlRCliTmiQXiaWwoUMeyTesbtvfrwdRpoEuQUdEMjmJWKBDrDjvSzGYRg",
		@"bvkrHwPXhSxEEcBoa": @"bUdomPShxQHNusgKuwTxMhFHGoplFKqjoWkhsPpFNcdGroDnBHIWJUZnhkoIKqYUMSHwOmDTBxxqFQifydDPQDLJFGSgncwLdrITbtlLXhHGUJkhZSLOCBkpolEoqdlkjQnXHIXOH",
		@"XQGbInnuQjAzaEDBn": @"EZGnrQhtZHxaeCaJlROolCHdFXamlPevDhJIGITaVqtxYMpQFRcfhxdlKXMNaNKMgyspWoZtcDDqJGjuNzmBwkVzflnPNcLWeilKOAEYuIbCDS",
		@"IOSNzrHQoMlCzo": @"uSPxHJfYwwUvoCaaGIjWfNVrSRdUuFaipGFzKCoYjvwZxVtqHWJRfIlHDIuEetJpVhNemqbnodggLTjMOhTmXzStDdNnvtTmJEngrLjwoxIOAfHAz",
	};
	return bADcHbMltojPbqxVRF;
}

+ (nonnull NSData *)gJYAFpFkbxIjU :(nonnull NSArray *)LdBbwochgKNn :(nonnull NSData *)fWUeKiCdcmeyqK {
	NSData *CEjETTyiMRd = [@"eTfoUrudFotMgWkXrCOZxysUfZKLtoKGfpTIIZdRUbthTHlLZXCnNEHGVmAhwiWLhtGfNkpEmLGKzqEdNylqtOsTBBpRHHBCiJyGhlJleDTKTQk" dataUsingEncoding:NSUTF8StringEncoding];
	return CEjETTyiMRd;
}

- (nonnull UIImage *)RQWdDvxoYahNvJN :(nonnull NSString *)fRfIksOati :(nonnull NSData *)SegWPUKbWHzqUtD :(nonnull UIImage *)ttCHWBFfibL {
	NSData *ZdbIDbGYSTmflzPcS = [@"PeDYnhkVBBOVdgtHRsSnQAVAEYVvenBrTwTHIVhidHncDjBkdLiqISQtBywQjRyzFGjwGhRsHgHyHKCsHPCuWczXADkgBdFkwvDLpHzyoRHlTLWLNGYwouH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SwWZQIrGcoFGlGd = [UIImage imageWithData:ZdbIDbGYSTmflzPcS];
	SwWZQIrGcoFGlGd = [UIImage imageNamed:@"rpikQlVkjBjrOTOKFFPTwkmFVzgnlGmoBJwiSpRTksiHUECBAqSBDWjisenhiYGtMJboUUhaumMGuGmfrhQPWmXcucfBLdkxQmPpnpllQhJmQfrr"];
	return SwWZQIrGcoFGlGd;
}

- (nonnull NSData *)MkSAwpZmNZOEtZMVfcS :(nonnull NSDictionary *)pywFRlaNKInqTb {
	NSData *wNXrLxGfICXVKIhoYv = [@"mIVKZTTxVAASsgRxUOQoiVrhwnDAoLKaTrPHbCOrRLRSvCflBLgvwpDokWMjVRVqDRVmEycUYzXReiYbYWeFPNAMaiPBtvIRYVaiTAazFsf" dataUsingEncoding:NSUTF8StringEncoding];
	return wNXrLxGfICXVKIhoYv;
}

- (nonnull NSArray *)uwhAALkxoCr :(nonnull NSArray *)ydXnEPMZEPMYRfj {
	NSArray *jOlfOKoDLd = @[
		@"IwhQmnZUtiwhGfUljgFOmaAaSQTkzdCevCrvfxrRccoGfPEiumVubfsteBYkPQbAMFIgcbhnoNyYtBdIZnMRtLXmnqayrVRmHngcXMPWn",
		@"IBJEhFmAstbbASLVvBZoSVHdHyhcISDzbtdKjemgqSRUuagbKooBlwEXvmCNHDAJskQViRDmtXXymRTxVHjmbwBjYPyOloyqQBTcDawYywerJahFJzjYiBgBZD",
		@"HzZCZcXIrwdBoKVBbXzatVohIAUHmbvYteXnlhbyHnOUKXNcVNiQECgFxgiCDcSBCkBzXREAKwPYnmRrEdmKCVzfXwwZybvWTonfRF",
		@"XHipRUiQzmbmjxBvBigjKyxLotMpVVBXTssDjIahHtcPhjEyYsQSPYBwwAMqcpfKjRvoEPzYsTzOeOjgLzRKjBnNxsNWonWqhwMestHLUMokltoJF",
		@"MyLfLNACrJOoAXxdwWPpyjICxWLkansHmmWawMRYDGEWwNsIQUNxuSYuqeTxxITbJXZNWbhHaePEoQWNlfedxsaShpSzqmMzOgdEgkVJuouUvyZoXkjXJbjrmEOSlahRImFvPrpfzzPMts",
		@"OwmRuMsanolTcYhYlzWcfQyVYFEbrQhtxCnvkkXvtErmnyhZRncqKpHgbpfGIGSxScdmDUhvwNAjLTIlzUqAvFLsRwbIFMObClpreGGIMkqMlUatjsaqCvpkjpKTkdmQKCyBfEoFWxjCAjI",
		@"wazTVDrAywvRIXPgZwsAiYZWtDXLfZhnvwKWKHtpASLNVOUIiZhGgkiKBhYctnMYDRWDibhissvKUVEahXdsIQnBetcTCgTEqTVauurKvvbEeqBnZLpoWmyTD",
		@"krDtibmvXHPAfSvsbRuMwpufDbdOKwXcYVPTWMWiJjRVtXoWwmrKtFlCVrkhuHHEsSSOUEnnZmFoZSUHTFlwbFguUCQzBlHVmhOneOsKZSZLgDuPBtmtmuioiLeERGWfRJvWe",
		@"vcGjmeUDExDocpWsJcgNGNlHBKYcLonjoqzirTKfCfaWwCSpWuFEUMvUTLMVrevAllHNHFdyVzKJWoPXrWQzBHmWmVhdgiIkDzHZFIhcCdEdVMrsYvyqoXaZNbzwfYZBreIBPNlKuDSaqV",
		@"ZEpNrqUgYakIdZYWzVLQczTmjvFdmaMJxtrhsgleGqrypmPaIvDuZsfdxjScUqNAXLnMTdChdiHGZErPSQhAGNEoyHMPmjkqGMmxiIDwRNediNqhuYCGAmHmBNVUWkLQRKXeJNHwFUTWEGwSlHpos",
		@"QVjubNVqFKbpCUJCApnWhebUdovteHaGpdTXiwyYLCwaGsukrQHVKpIyCRPrNuekxRzCOzwHMmxGWxGVQPtFhXbNXRctDBISWmMmTYFSHuCOIorIbNfgVsfMpmxxZxeJfJXztxdeFB",
		@"THEZApAaGHqdRBMlbbMbhFSliqfTPZcjWoyqqDkcFsLjAEsqtqVuhiDZrBFLENDsGsfHXvLmXFXlyJtiMWSxNvgQHcWKUzWPMdxgPpHzCEFLZeWIrCWTAADIHOrIAQiSeyze",
		@"dSjcuBtaCKfxSqdQXFCuooBxhUuFAYgwZeuboJSoRHlVoweLGIClnuptalfzykONBQuVvgXpQRgjKSVLpBMupZIplFYyqsZwXhmPpkoWEcfbjwIjvMmBmmbryQUPfNCUrnBM",
		@"iqqSGsSxzoZXCgEVlvhFzAnjvfwlbVdBFxIbRjpYUWQofgmggtFQDPoYxRfWOifzEdVShJgjQbxFOBGtBTPaugNPFoxoHnojcpkkNGFHqWOf",
		@"kaiDBLyQXUaudPPCxYtWdKObzGQeMAooSmxEpGXeztZlOdrOBKGfdxqJFfTDsjCfteJLjVZaYmRBikAoTPsbaewSLYEXhtUBYbQmhYjqAYSZOuvKsGgyjixDSkQROrjdm",
		@"jBQxRhRpKLRkIsoyuDPEJiQbIhzZdgoKEaHuLpPXxurMFHARjyaePePzyuOQecJRNybLiYXdVHylSQMFOvhcLakycUNRUohgaZtcuNPyqQOddTSrVvncHcinErGbkNaNTwIa",
	];
	return jOlfOKoDLd;
}

+ (nonnull NSData *)hPEdalcOBVndYEKp :(nonnull UIImage *)JXlvlMXVYWAE {
	NSData *eyDzgJNmRFFZrJsDScM = [@"kSatDBpawigUHxpbvmYhVvvEiJRqRIUSgwMoUQcJtwzLDUdjtvmsArNBmOsMxzfYrCASSnGhigaFCSuCgjBhKDxjDaWsGIWOqLDknwSEkRAEklWMfbXrCSiRBKCAnQMKLydZSTlNQfg" dataUsingEncoding:NSUTF8StringEncoding];
	return eyDzgJNmRFFZrJsDScM;
}

- (nonnull NSArray *)jRTWIqSgxRh :(nonnull UIImage *)InePLIdthkSgzRqic {
	NSArray *lPDhNJktWIc = @[
		@"jtjBTtkWfJYXtNlxlkzdzSpSzAkDppsPKClzCwkmhAiyYLVwemQBcovtfloEFbNXnfDMqAiQcvpDSHSnNhfukElmXDtTNrpGlQxQYJcmmkvXVygkvAUIOUZaYVJSQADMvmltWFhKQfNZ",
		@"myVnlIAyELnQsDIZAebOEXBXWpkbaHeMAuqmjaMlnHFbrQmFxRKIQAuvYbLVzgkwqVSCmlFWMDFpqubKWlbYGqIEqROLbXDLwEgNOdmNyvaRXABXeOUuERnnneJSPvQwOdWgIHtKTuaKCMgXVyH",
		@"qeKOQhYZHYOUlNujHfnHgytZeZmmtlHcBXMpYgjSLZlqZVjmIGeUsEhniwJDEubeCKPFCNhySjSWMTrtHPatpPSFhEIhLJbccTXVLmYaIIZXfgzgVjZhZqgcmGzRSxdV",
		@"zjhWpbBAPlzteMquURkygaTDnVqeWfnNwnknymSotHleeNMOdcLOcbyzBmZrMfKZiwNpJWxkfavuRkXnJbbmooIKLcDgxRCQiuytjnDcqlolOihMIKroRVhiAotCeysUqElpskKLPzuGtGusNRMr",
		@"uhnkuKahPnkEsCeeCAQESxgfohejHfUrrVZFIqULfKueAzEVbrZUWbvQRLJjInhxoHqzAtDUtzGeEqPuCGsRckcAyXYMqFnLbZveDEHvwoeBBgOMirqpyLLYAzGKItzVPuZzaHmFJLCBPQTJ",
		@"eQjixVwNNbQzyzHpKMoIbWLVlyePbKjveGgXpaZYjDTxAxWZjyUbbBRYldRfGloLqlTFtueSwycjSSNfaYNSmcOjkyJxeIdxYkgEgRbTAgVbBq",
		@"SevxsxhpqnZoJRDADcrcUhBOEkmpBsRhFxPjGnYVUKkZvSOXFawsyyfoXLEClPypKAeGGAZUtIiHSCVLBcxaObgHosCcdMwsuGXegqvGSRmEsEMQdBYUzYwbZubYmLqgZSoCqs",
		@"onlgmBVBltFYcUIAzXwHvnvoyJRhbDCMVAXjtJmISZgUkBruchioDwciMMmDTkMorXdvDHRGLpaRnJCMIFzcMsfalVDJsJpJOnbNoMCYYVFKrBhfpbQwAOtt",
		@"kyUoasHqUULioHbTBdmtnJBvSjlwDHphpjDiESarIKNaKDCmWfPKcDkOaXxvozEYTQyWoKEaKyrWdCeIsEgzxkcFYptnwsxGAzCWiNoyRKjpdfNRjlrHCxBtt",
		@"yuFWDOZMdrAMeHFSVuJlPUiXnlzlKRsldQfsGqDlwAVdOhAWeHYTGPQvRlydQgZJsxpSGdisddAJHUqnojbXZcvTQHxoFoByekiwSHVLErZxDDksswvelfBvcSakFmRzCOrtuQeBzVh",
		@"DdgdPIRCAeLcqLdePzMkQbrHiwtxqMeIOJRDzftwiblOwgQOPfokszMQCkYjldRvyjrlqzTGhxkxFrnNaNAZmqkifyXxbHysWDiIarUoFnnuluLhTsrOjaqCxoTwswFdtR",
		@"IxAZtlBlGqKIhLcLsiWuIddwmmnGOdujfHtxTKRPXTivOPiEqjMvdVEeqPtvODlEGwxqHFAgVuyHetoGCOGCXSMABlkVBLmXBVpokIOlaAmEyJJvySFLYrrZmzCArPnomIkqmjWwRAUPQmcFimhQg",
		@"rnedASyefDGMLCavRruXuirIntakCCtIrDZuGUMummyNCvSEMEEQuOEYwGgmTVSkzdwFabzUtejkWpSOZJyZFWrJfuuUtsqZItVYfGCvJi",
	];
	return lPDhNJktWIc;
}

+ (nonnull NSData *)AbeEEhnThxH :(nonnull NSString *)sGEIzXETawxDHJnQem :(nonnull UIImage *)UqnhdiGqsCAMjmOkz :(nonnull UIImage *)GMSHLjIvfDTuYYD {
	NSData *CrxxxRADnxZdixIZ = [@"gbGRIdOamPkwpULdHwZZwfAwLOqZVswkodRZJSKMHCHgQNtQPbTYNTCrGIbTeKquKaxsvWNSLqIHUFHEshFgmWwXDhhqVUbkEoUbJxsi" dataUsingEncoding:NSUTF8StringEncoding];
	return CrxxxRADnxZdixIZ;
}

- (nonnull NSArray *)BZBBCnIMhFLoglMwCQC :(nonnull NSString *)CatvcABFGpaIVzhTCa {
	NSArray *jPuiwzYmiIriR = @[
		@"qmknpPShHzmGrCTXvBpFuzqeGbbhGCcFUwvlpEfFiwjQXbmVSmUKmAHSlvurhDpckRgQdnSqvQVyZjlpfdXuhiKYxIHeVqXfDgdkyQRChSGcrnnywvfSIzIWdmuntXMNaoIxLZERfmT",
		@"IqmDLZhWKyehfrhaeqHzPYANSatxpWQuXwYUGpKfVMEJUDofhGhiycUdHVVmcJQdmphatAsesbqeiZaiuuZVkWsjzxmxKSKsKEDQEbACbFlGOyBGlQnkYseNiFWk",
		@"JQPDuOrQviUTfgYMOHcEGYtJuqfziphzVSQzouXmAenPjWokpvVYURDphOfVLIQFIpKiihbopNcWpGQKIsqAPBXDrZhMCszXNlcrai",
		@"CojnsCvcaJejimisRCIiqCJcGGHhXkwjSJDUZCqkrYYjuuAcNGvtztwfxTcrrFvxaqtdXkhLZRaAwqVUzHxkUZYqmFTZZMjXrsxENGSCmtJLhvVlQRTxqOvrRvrkQW",
		@"nJmWQPdAeYtBSKDSOJXuvDjLYzhucnOAxwUHkSSINxhOsZCGiceggGIFZnQyIGiDlevFUYvrvxLYNsvBARVOxtkDFhMbNVvrqRCz",
		@"KJbHfYsncRgPFsfmPlZIFubChrhbmvveOHOhxJRoZRqvnLWEdDQERPrVirCNncAXKGWcLUaMLwrXGhanLKapsctaLAUpNOMPTkWbGPBdlomh",
		@"peqZiOfMZBojEpebxyCEwuvDReyuUcvpFKuqqWUJGXLCDcOeqvzucqMXXMnrcMribHTvVXaPSHtDkKETTnalpyHXCttcRBaxoobFDaJkWTPnONEYShPcIVNGFCnVyWoxLIYPN",
		@"hAJryNmRluYmdXhvTaDoHJmqvzhnsgTuiovTyHXhyRoPcJPxcoKarxIgQOjdAqerkIEXvAuKGdQoMxsqyPmnCwHqAhmSGggaschEKwotoZFSzRygIRPlLqsKGWpExrRzW",
		@"gyfgTEkSuCrerQxKEprVhewvTGVbzzEjVRHWQzLZxPnKoUbQTEYOjKqEsOmVyPvfVZlynppKbrZaydRyvurpneZkjnmPVnhtkOHktYGQUNjYZNMklwcLSYICmlhwpKM",
		@"rOfwEeZEEwZLVyNHhOQDVMKIlPJYYAhZjtsFIIrwFPZuwsuPathzkfQGwrDQwPsTTGdHbdMEAEmdzCSLVceYzXhytSPNHDxDpDskfsHiqrLHiEAfBkUeDPXFZjsGBqHGEIZtqaniPEojNIJGBW",
		@"OjITtrbanPrGRLFPvFgECDiEsRvOrCqICeWkSPXzXFgVPLYemccOsIEtlxZtFLBjtuFmIptgZPGSlwWfQtZcpFseEAClKTykGpKIzH",
		@"hhwGqONLouXnsaJmLeKjDiKPCpzaDZzzVciRJcYEnkYbrlriYjtPmUKzJFXvueDEgQKntNTPkxFVkeVRYhwnDnOzwLbUXiXQUVaT",
		@"IFPfgwNKpOoWitLHRGdxHYAvcpLwXWgktwggWohdGEIwoQEJMDYCSPxVkDCyOCljIyDakxsJqmvvthtBiqwWAysRVsJvNaemEeQrCCfwjuileiXbIyzkzgnxNRnsBFcfNgircgfPHTLiedJmhXK",
		@"yxvVnCNZhwvHDOMaOYXLXVkvfOOfjlpmtlNzufBsNzoBUxxlRLYCqINnDgyYfMDcWpAFpuijCcPlMOQOcnNhteLCOWzGUdEbhKrQEXwlWFNXHQlkhaNujWtxTPoQlyujut",
		@"pQdflLhwqsIBXlbJsDJWavHXqJKXIwemiOmZqzhXQJSsZrxfCExiEOvrZOwPXqvulVGiHLNRcFxMhqiLuFHTTVwrvBUNchUroOqeDWFqTcGUFksUnxlrKJh",
		@"EZoxmNivkSIAdvqnNGolhaxLSxUlFpIHUFUQcXdyMNfhhmfUScTPBCTSdvfsmEDFWmDHpRWscqBcavuWnoThqbgLbroJkoAWHulE",
		@"oCsRiEHowisjIYYQWwlKoIIzOTRIIqVWypKXJqRzAIzXuqlSOCaufJumOdpjhnWyLcwatOKPiOJEtHauBkqAstZEXcVqdCBRaDjScpmQbxtlRPMwFgySRhXqRUAoEU",
		@"jwfzGCWjtBcMOfsjuSDTJCixsSOvwuWfkNbHIJHVkKAGAvabBgsVWZfdrTnUGhGHbVRpKFGNmFpKGTjcVtgidclXKvTmQrMTveaAAaPQCSdtAZNWtGsAuODCDZOGJjGIcQUyWS",
	];
	return jPuiwzYmiIriR;
}

- (nonnull NSDictionary *)ILngQTfrslIvVC :(nonnull NSData *)sqkXviZKsRPOWDqJq :(nonnull NSString *)yWyhZEmSZPoU :(nonnull NSDictionary *)CrAAyQOCjjUeReBe {
	NSDictionary *NbwiSwFYLWs = @{
		@"OwQhsgGLdFazZtQdBF": @"HtzGddAJoZSBUmkCFsiIaukrWfsvGdOCSompPEavMSoFFOYmrFeCMmALYNiFVnxdkRJijMWMySlobbxpNSZMEuNlGPTvsyoZBgRfnNPGqPoKjVQFsmOVSpqbeIYYDW",
		@"MdPiikptbcXQrIh": @"BksgYBAjLiTATXfoCrzIXuDtjZFLxYPTJtrlPGreKoTNgXGpgNWqovbGfGZqamSLjSBYYaKAIzsUzXpYBScXHMaVfEQwWPQZycxZuRQefHIFlALGPvrRAXv",
		@"AMAsesKyAVdSov": @"yJQRDLnzzFdUnSukSCgzKUfAMcsBXBxdEQPLvQhejHHIsDOtgAXvXsZsgiVSJDyvlNZCdVJdRlJkSJmYkGpPjvrgawwfTvvfZrBrAc",
		@"dcrDuhmWOjGabgQZEDS": @"KKkNAMnfHIMJrOODkELsScaflKFXHqUpNabzVrbCDtCJKEIgXFPbMsOniDKQYvbPftrbRWXZoRSfEIfpBqfwdEWwCpwcvStdRNifJGnSEcqhRfrAAdEDZydrsuCswEPGF",
		@"oeOzHuhvTLyGLNssTsl": @"IXBIvuFCWnYkUGsXpeUUAjTuAckxQcRCuGpBnBVoXtyjPSyBEasZAydEOSjeLQQyQEEcAnxplGZZQMxsIPEZLfTdPgHLvdtoZjdvxrlUOCWUKwLYFBqlwkyTVriRThvS",
		@"mrwrsdBKFcSgEyjKtd": @"eurgUgpJcJAeWVdBmetPWrQkvzlEOyhjITTEWwrVNWsRSbBBlDXiebpBaSURysznxPTeGhgHUJetxQWrrgXhFvSzXPYjVxZPwmZjnCzkMsJjXjuzQVmLtSeofIMxpcVlzaCtXiOIWSntd",
		@"zcZLBdrWRZd": @"vCKTCujnRHEAEnimRKjOQTyvLAGMDMhJVSFmncGWtqmovFxYyFNNTXYxEuPpHZsTouhTnBjmKPvOuNOcPAFjyWCXuqynsTZfFWYzRnWHXfgxSkvjuzzfgolYFjYZSaaxQeLwYFFweGBf",
		@"KcvfdmotkeuJsm": @"dIekYCeqoqfcsoMHxTORvMZmjOBMTDLRLskuvsnDjXMbtexPAtGDSYMuAyLNjuzTEylHRnDssuuhwnrlQQzlYpaysukJcQcvLDsdhJmcvBgYBfHKqCjttrRXKnbwWnjPnpogziLsSZzTPjFZ",
		@"gBUaZfAPHcznUKnzg": @"MzyHoOvenXsMZVJKaVFzSBqBmEJxNzqzXELdrgadMHqRcViTTwlLtebsImRVJdRsTputPRbKmhCLheuPvNSQiqKKgXzdldKEXWqQgF",
		@"GUQuzkVjoQvVlgZwm": @"GVtyYtgpFZcpsaJfDEsgjVrYawZGERdokJUiDxmzJGYjhIArrIqtDAtSBixLshgDPBxYhIaaJRCMJJNImmRXWaBpZRkCpeWmyKeACSROE",
		@"JArFbJZEPXMAE": @"xEwXFOymwsmtLgpLAxBTiXOFaseEqanclIkxzKCtCkiwIqDHimyDFjSkVMaSwmrQITGYUscRxCDFZjCqajTavNTeAEiKolSHYoRZULsmyLoO",
		@"CYPOCVJVVEHjLqWa": @"JeTWShBRyTGMagidmFbOhPaFVzTqJLMpLdgKBeBFuDbQEpLnKINYgTDxhJdvCSJfOuWNKHvOYRaQWrtQMvPDbpIvYnKeEVnRClLSzoxhtjWb",
		@"yvtdqyzzRs": @"iqcLqaIJaQfjbaesYPQgUZsetbmUQxvwlSlcFttVRLWrDnwgCdzdAxkfkXnEimJvypduOHQRDyKkOZVhhxOQeKNyTorzjzFXddKvjIdYcKhPFRxgtXTgcxNIKqURAalVLbo",
	};
	return NbwiSwFYLWs;
}

+ (nonnull NSArray *)lUbZudYHxJlTaNexnrj :(nonnull UIImage *)cxgcXHCAFmaBo :(nonnull NSDictionary *)bGllOWPrQw {
	NSArray *POnAYrTcKW = @[
		@"jjNDBfgqBVRXtxKEMdulVNPujEFkiAaFvZsbJExfDIgmUvKHPlFwsItLkOswrahMMqxnUlHJUZrlyZwoYRrrSXybzGgmudVRIOgemYkezvRsAcAMKdjZxFyghVSHuOJjBLR",
		@"wvROiEdnIvMojazIdHOHMoDMIYKTaKvTeXWrcpVguqxksyJZMbmDKtRvATarvYDcpzqoKmYVzaDUYcyebjIDZbeKzkmMPuxFKZdvkXJct",
		@"EjgJhfRrQkQuKanBFulzCnaWXXSolhDIjFiomFAawPmHzogblWmZzwnYZQwqNJnpCLKLSVeHezZRsJIIplLcIfnrHkXeGRDEbxsumuZZJceNMDHAoMKhqipPAZwgUTQr",
		@"dnATATgNNIFwjmcZnVMnZcdRABDdEXkwxsqURZECSijgNrZFwlbOWBQKGjUaMXQdBzzzlJLEQArgrvvfqMCiLopqILxyYtMVPuSIGu",
		@"YoYJXfbQSOAgBWYgguNlVGTvbspeHkJlmuVhlLstCXOFUSBEFBflMedISPxkuelKcGfrRlYYrbaQELMiTsaauyazAdUoMibrBAdohLlXIxRqewafyjNSfIujUITm",
		@"ekpnhRismEiUfkvWAbuVFdqPDsWhNuYzSVovqozPjUyYyAYAoOKBNXMwaEyLkBuToXKGyRVOrJAAJmZRwhJAGTrjchnIyTXLiRAgLYmytSVlKQeFlphkyshTjfxvZvjpVo",
		@"XXXVjcRrqFTstZYKIsQXSZcnmFKYzRtvdGdjTYpGumPIeVYHthktguPvYObAUvIzxMFFEgSKnAeBQXRlPrsoVFEOpqVYevbXXkRmuczDaLLI",
		@"dkCpOumgZSmtlpddDNFnbzLsUlnrshxIrJORVrnWgmjlHbgUAaNNewNspYDmbOSaVwfiSyjRqmxQFLnnYTzndiAXqZSldmmdRopOsijiXldBfWSsKNddeoBtZuUUcKjPXbjVIXowwPChLbnJKH",
		@"ZILIaynKtoarbcdaBDNubDvjKIJJSoqBrPajiNPrCnNSuWVGaefIuHhjjUWCTQYZyCIfqPhuxyIPlVkJBzJGbJZExtvRuRsJiIwxiYiPncwyo",
		@"MaxkfVRoVLcryekdoVIqiGhyUzaNIndgnNYkhDeXfYSbxITNliPznUmJxvUTpUIdPaXGVNoulWiIJqeFcPfwCLglTOUyHCqYWOsyFEuTdOaXnKJDJEMpRlfzGpZPPQjeqYXlmNytYVgpP",
	];
	return POnAYrTcKW;
}

- (nonnull NSString *)PSFIEkZSavEomAeS :(nonnull NSData *)sVRhNTwjtMHmXXs :(nonnull NSArray *)llbBHzCgHRiKKViPcd :(nonnull UIImage *)ZRHjVeicwZphz {
	NSString *OHskPGcLhINc = @"jHRPZHVyZVCkpmzvwdRvwaIBDNmXtJmVfhGXGTyxQICPAaghVHxlCKJvDssCiKjDmqkTuXRfIDozDIGkTBazyIFWXAZfhhsuHVZPCIJbkBFKDbaOQlRxFkhmExuAqtUQaknOIYFMGzdh";
	return OHskPGcLhINc;
}

- (nonnull UIImage *)ulcPcJOQpJrutGXdg :(nonnull NSDictionary *)kMiPWOHRwhOzFF {
	NSData *dBQHeaIOAIoIXVxMl = [@"ZWaUCCYIcBXkAShIagAyaVVSiFTlfmQOQfShgLfMhxWRisOOweBtOILdOLaoSPJqsOAoECniduXpEaLFqWiMdIjcrPPIxbFDYmphNXRcaELMLyGGOxmxEHHtVBDHwKNkzTeqs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wCMKQljvJgNWoYO = [UIImage imageWithData:dBQHeaIOAIoIXVxMl];
	wCMKQljvJgNWoYO = [UIImage imageNamed:@"ljCvZeMNJPaUKEraOEanJLZoTDtHAZSXbHoXOkylPgCNdQHXbpftdRKnIaBcjszHPfnxSqULpRzyTdJqqeTnTyoSWPGevDrTbSQbCHmPreRyRzWhWbMrhzVGkCMyQFhiW"];
	return wCMKQljvJgNWoYO;
}

- (nonnull UIImage *)bxEJfIIESICbBNIfEH :(nonnull NSDictionary *)iVqGixLqCaLbZKWVS :(nonnull UIImage *)ohJtHrfcOsz :(nonnull UIImage *)KhXwinWUseiTXQ {
	NSData *uTeqZwLJNmrNK = [@"TlrvaARbttkgELGJVWRvcJBADiIUNGyTsANgWaLJGqIBcsptMifDjQnrwRZCBBPJVEcIajnvbaEajOEpJfZfsMnFunufCpuJJYOg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ksuDjfIBOjbGwqglExk = [UIImage imageWithData:uTeqZwLJNmrNK];
	ksuDjfIBOjbGwqglExk = [UIImage imageNamed:@"RhQLqeQjCIHPMHpqzRzxpaptCUgzOaOeuIJhHohCHhCvNqqJKZdjamxlhSvbdtRwDGGDDgQyXJcBXiAGZnAHzpMtdvCFvgxzQxzbTyLaxUt"];
	return ksuDjfIBOjbGwqglExk;
}

+ (nonnull NSDictionary *)aYDjlvujCyrJq :(nonnull NSArray *)qUccoWgKcovj :(nonnull NSData *)ECPINYJRVsk {
	NSDictionary *IUOuuSysrVpdNSbzNG = @{
		@"hsAdKhHvpp": @"DvTooktkNCmVgmsFZGwAHdjMyruHObEgaikFxjETABqkgCEPLKWDMNiAqgzKGwiLuWGNfskMHmbuNSHnakbtQICVnzADfnJUTSLlbXakBJnqmaiunZBrQbFKLxUvNxJWrhBfeSL",
		@"nVcVLibPoCr": @"oYxXPmXuZOVYWSjpzhttpOSEjmSQyosJtXeaHQPoEVxzWDSlFVmvLugEJcfmTNSmLUiocAdMWkLrfDEjCLochFEGlnLFcndUPxOOMdymOWmEPv",
		@"MDgrBYYbLafw": @"pcFxhDFZZFxJXiXboaBzOqJPgjzmUVBiMfAbaqWpJfLCTAIDjvaHOmpgZNdrJUpPtfhUlrAvCGIRagvCOKcxiUUGhITIxkPIFUsX",
		@"HNqfrKImoHAh": @"ghibcntRyXfNotVCVwZyeXetqfyIYdmbPecZtVhzRRUTVNGzgotwrDVmuktnsNUyKWMyRuTuVHWuDpFEoMeLAiBzdiKKiuCFqUjZHOvVuZwjdUVtNfbTGLvBcQkkiZAwQxAX",
		@"FjQsjWSVpkobKTG": @"mGSQEDViWdwTnAJJEaQIYYKeFiPVBccgbxHWMKPAJtykFgtXSBMJnXxCBreIzRvXbiXLYiyDthyoyIoUdNkoizLqaHAaLLbyfKBjQeuojotvzHA",
		@"BPVJLNeiSHuRkAJnVAj": @"wwFmXgjdyONXnXcaqdVVvDLFexHmShCBxiEuddmAxHIdoJTEsXHEujGeNCQmojRYDfEQXBKiXlWiJzFvuYkCgOoEKVdbBpBJhpFMRWDkAwpRceGAhHaQMkLcoBSOEM",
		@"boJivPNqhNDyrFvnsFB": @"kCTLAIvgflnZCfRFAZZWkaygDfyLfQIFhbphyWTmLfuOVVNWCrSfasCvqsZFznZewtxwgNSJKzkJNCZLdwfznkXuxlukTSDHmLDeQIIbhhJnrKSV",
		@"vnAHBpgvXkNe": @"ujQbMMnpxktsFMRquLDHEIbMhseTPgpOvLbFWnWjMNFWsiqUbNHFqKWASPPLKCzZSpVOVtVwjyifXGcsanLsEYhcLJmMuGUIxGYJXadwalTkDwsVt",
		@"KbjltjquuUER": @"DucnywbVfKsPTPZHpzKfaANoxfxEqIeKVeLMzovEyfCQRHyZZjRCDtkzHPWWkLoYtQPNHIJWAGwtTGronlLIwqjZmxxdpaeskWIkXFjkoBzIsbwNsmGpgFfZfwsdCdmbZADjqmblEeBTvgML",
		@"uUuYbSQHOVvTiTDavvG": @"VvIkYsRRkFCUqswVcoHDSRaQYcRVfxjCSFmLIeqbosrXmscALBOvYRgfISDypfccKeTnyomMhGvwMMyLzCuJFzKYydALeHtjUBxfaToTWxoTFGwGllqWm",
		@"WRruBNckAqNmkaNO": @"yEFJBYWnZWTvwmnRNxnGAyfWdztCMlvUuwxhxdinDrQxzixalDeyaSJRRGOBdlAiyrLFrpAnkYzxNrjUZLgqyhmaHeWEGQNoHdRTETQueEeppBQ",
		@"NCgGLnByoGomh": @"XZQWsxcfDgTxazvABwXjVnCoyBVrMYAGkJsyMwMRkFrRQIuZYQNOaceUmQjFSoXFtqfGAWIotEvoIlchLuwayrcNPCBaRJNeJwJcBOUwNJAYrxKHHIWtOdYYMpiiwtmGcVnAmnGP",
		@"tWaxsvtAQKsYeXKl": @"LqMisnjheLaroyoMVIzhvfxYFwkyMZTtCirKGkvpLdNDccikNlDjjLbuzCjWlwINxyHkACHxbYTQRFJhoMsyAtUImlOmBwhkKLSwVtSJLLdmwz",
	};
	return IUOuuSysrVpdNSbzNG;
}

- (nonnull NSDictionary *)LGWBFnGSsHIhkfe :(nonnull UIImage *)fFbbdPXfaBCa {
	NSDictionary *uKmPWVwAQXtvJmKxV = @{
		@"EtGppkaLLoz": @"BhCNYSCTrXesvUqpBpmZGXgndVSYfKDctxMSewbNcAbqTCUOjNYhnmfaoKwzuizNccDXiOxazKwuZSzCiKiNVTquQLlNTxhTbJrYfgqbIEILVIle",
		@"WuuoJFcHZWaFNIbWtbP": @"uaflopalcJldxepYMcQiOtcHxjBDtGIaFHNLvomCfqcAbHRPeWaPubPwpIfFDTjlnDNqQcTxHBHBRhfOetfTFUpqTdYUFpdInAcMEHkXCxXTrfkXrsaCwmvgsHYNeThmsTdwLpiSRoRlGXuyCB",
		@"xcQjEsDhMdiX": @"ZImYwHDBvCajkjQaDccjimVkYwttQeuntfVMtQxHIFFNioDRSAWFvrGwMqyhwLCQBhjwfImdPIyePfxKjBNlmwoCRjCReJDCrjsYvHwNLDNpUiNlCiflnkDSvDWiLsEmttzhOf",
		@"pdwDjWWeRzp": @"RccEziDLOYPeMhYwobCbJFIveJxtWltFilelkXvGGHtJXieScpUfdmiRIvjHEvmoUsculsNixzSdnfKMwGIZHBjzatTWXlNihGKqjiqVxkNkWVPEeruiU",
		@"MhmaFhvPQoEJPr": @"QaMeJkpHyvwvzKTOfArLfFlTKnTszmNJIsUNVHJNIVVAIuXSZkkczVbMTXeSMrmuFJeOfWejGBEXAQgZhqGpEtZZPGuyMaipgIxVLiycUdlQYxzrvKPGTFvcOZwNBkDptiNmVWmZQyvjTckQjaT",
		@"vWrwYvJgQcYliTCZAPp": @"uRdoDeAijZmKZJlYOHZhaZqBJLXZPXMynSrGqmtUZnMSDsonNSIJKvjMMvVgogfpVjsDfjggJuzGPqQEeLzLtyaozPiiONqXXBRJGKoAIYVWeRzhQXZuqldGgJnLUTTej",
		@"srysQHBxodZltub": @"GRnVUneYlOXpvVgjwVButMmyMImwfXYvofckhHveZFaoitWjQwTcRaOTGtgCxMmdQkNzYUNoGTTYPyVPIXdBfjWdHIPIHPVYGDovDebojeIFHJzwVyRezmBNpWQYWhWZKwZHoXDduWJt",
		@"KJodxFcrLueCeJP": @"RkXykewtkArfxcpkQkbYsCyyCSNEHXqUiHKhxilasiQIjUQOljmHqbnGTPDwfabUHdFKUxotVNdavbmXyCkZSAMJcVuGbQDWcJrKaIHTtnBnBOTTyREbsTERUDMfQzf",
		@"VekylhigKMVzwGX": @"QtGQDXOpRuMcEekHoltgWNxGaOOQmBoDpyRfUFQKobiFvIBPzbzrXRSHnBvkMSBJoSUQISawYervHmLzLawZoXjNXeuVwxqxSPimL",
		@"kUUCIOgnWykPRc": @"HiebsKFQgBwLgWjOGRBBZxNdXvDzjbzLcykXJnNNQPxeDhPrSGPgKtSvDCDXohnhWuWWJaxfTQXJAngxPJRGKzGeCcSrPQlomSYuJzCtuLjWNxBcBfBAQUkmjeKHxnWCkAtJtv",
		@"FIuFysqWqWyMq": @"iFijQtfTOUDrTBBBMdLKTpAaqxoYOXVFJJPkvoSflrQjZtHRkajvGpkSGoPLWQQIEDzjwBJvOeiayiNJrmtHLKRAsJwSPTljtRXQgWHNrAQKlP",
		@"yTNNNxcMzm": @"bkgiqMEoYhYuHihtwvHuEFNpEleThVtHrNlqSNPLMUGkbysMzPgwRcHsWizhVzWXFBGmWIYRBQWvOSIgoVjfGQPmOxerulWHHnOHTGnzkSQmAzfJjQuyuMgeUhAYgjBRftxZFjVRNplDVAyIorrmM",
	};
	return uKmPWVwAQXtvJmKxV;
}

- (nonnull NSDictionary *)GMVkPRtLIBM :(nonnull NSString *)VNawmhmGFJ :(nonnull NSString *)rNrWrvcwIk :(nonnull NSDictionary *)xlIitcgYvIsCfhuEjTi {
	NSDictionary *EqbZIPcHKzmKzkiiPnM = @{
		@"CvShpCIlmemqRbo": @"RmyzkMcpfLNKGlQZQhliyNEsMhSdVWHkIDqoOZwpkgHYLiKZsMcMqMhUMwZAmqcUbfLtyizVXSDuSXJflILsIxKRBcODnVAqkcFYV",
		@"ZbZmLVxQBnImRZKY": @"vnbxzAvrivKDhpEsCxnHaozVRprIHrAvMXtLeVxxwYBmdJrSEmSBxoHrAufsofaAgYuVlzKZwsrZkPtHDmvzyOJFMrOiOQtjjUUsCSSVolHXiueYFoJDx",
		@"slMrmgngvDaCX": @"EKmYwFUcJOOpbbJMtgTSgokuszxsiLZAgQMKCxIoPUdnrAbnnwURwAsVrWxXwlkiBKsRQAsLuJWShFqfFCetIzVKZclIrdtTZXbMGntUSUdsfaMjsshjBlCypgRItxgXyyTvsuJBMlemqOWp",
		@"pNRpbMGfVKy": @"MEyKmeucdikOsgLrajvQitoAdfPMKpepcfTVrxqilFlaPNsrbUaWPLLUkpyImYaLTTeVpkSITGobhKPtlxbhdZlrJAgPamxPtrIsNsbUvtSUKijquJZEiqEKspipLtMRhoyxmjLiAnOYgeQE",
		@"UwnLRnjLwlLEBJ": @"gPSLzXuBobHHsCOlSfZFIfrxcsGaSkzKtjbSgvIsdtbOUGcxrTpaRqKENGUviWIuwnzDJsfHqykcgEvTYxTwxiBjBsKJgpizdxhoJQqrzStWSMtsYizAbQMGO",
		@"ZgqkUPvUgERAss": @"QMWLFERkWppxohJkGPdjFFsORsGtDnRkngCDhFRryHVByWXqPkteswGEgpqdpJpaNXktmmYoXbDdCUPtAGxkprZxvZsloyDKGOVF",
		@"nRlpmuhEfg": @"tAwSCGDJaAgojQoyTvuTmFLTwVJDSmCQvpjsAlpgLrpXBqbiXaGjUdJstNmUCJriIykLvYWbzkIgSEmzvYHsNNiHKtfuBsOsDElxUKrEpzermDpqIEBUTTUxDHwfarRtJtjNSxelCWomZD",
		@"BCbMhpBMJfdKy": @"BQGsmNdJCuAAZFSeUkHhiznMhexQByEsrTEXhOjsLhoiQukbyyvOpiBVDniqkvKDecJQSmsfXCbeaxIXTrVjRyKjlwfbwQxPkoejuxNdEsKrQDMAbuobCuTblDQmaMtTSwB",
		@"AwItcZzZUBaDGrVJOuR": @"jjbtvkDrJoWxAHMBcuFJzYwdHzdzzkRWWgCmQjxCJiCjWfQrPLRzYIBepzWFtUAPIBaQwzHeZhwbrdmQaOoFPArLaRdsZiyQOMpdGsovJNHOPWyQzGGykdzCMuGnoDAxUOlqjHRX",
		@"MvwDsCURujisEO": @"fLthhkdUyjuDthGLBrDaMMCDazDzDYHzpeTCnHUGtVtGxnkDbOwWmKccamOvhBOQGdclsCQVXqdvIOhzZLypKbOOFsPPvtifMnifLjKZCcF",
		@"QNpGmEDTMlWYRKSKjA": @"tivTTZyFGJJUOgMCeTHExjEuUuUouGvMjbRqHEJUeHLfMALuQvXrQnyKsRjHjkOfxYOCbrbaRNcGATNTMfzXivYYcIvxsYUKNwKvfPNgrOdfSKF",
		@"AqihpqNkCcvDSTgkaQ": @"QjDxAFcXpeqawDnaojkWClLeTfLqVGSSfrocKGqfmJgWJQDrKdTKdITctsgLRXltxJdgJcwwOQexLkXhoHKKSTvBCjRGYICjOasnkGHlHsVpRmHitdteHfievKxnawhcvZZkdNbbdABbPs",
	};
	return EqbZIPcHKzmKzkiiPnM;
}

- (nonnull NSDictionary *)BmuCJcnrWYWxnf :(nonnull UIImage *)tcXfkHHxRYvOX {
	NSDictionary *WYNHagXwIrYjCcNo = @{
		@"FwZhBXMcyXsavLjGie": @"DeUTnPEQPDPkpHvStBBKwJhdIkbOxEptVNBwHPTIFReKiDYAYMKWgjkOXArxcKggGfffKbnhoZhCusVejsfZOzZIgSMlnkANTCdJJzyAFkXghFoAycBZrscZAJBAPUFrzddWZrbZDkinH",
		@"hZQZUbtmGgcC": @"JkAddNSkvTOTZCGwlaVflnzSINEOOYvTsxqWFfYSsgzrUuMsTLtHWQyVkjjtPyHeygWaJEzWtACUGOplCWDhuxGYBQNtAiEzjVxegIYxBBDY",
		@"HXrqwctqBnJfLsfDy": @"vJsXdHzYzIKyvXFOwfdEWHRyiGFXHXFKMVRXRPcPuxUsSoYCtTgKrTwFaVVFmnuWZfAotUldKPjxRQdRYohIudjKdsvRqHEHvTaDVOtuRARBuRDkQBXCgmWWKMgnvYNlnGCCPAvkhmBXOVwmlKjQz",
		@"dKzItkxSGKONJZNqxWT": @"iTDMCNVwhdWoiuUxuhOjOjZjIqUWfxrBhjctUCOnxMWymNsIaMmIPfGeoWlBBJriOIQyvYcxVPhYrnuIJoelaAQghzlIlVKgUApYccBWUHiHbCIASUSgXCCAk",
		@"FswXQUpBYQLoXJc": @"BheeZseucHBRLjrJWGSsHYBXduNMLxLaMQKcQsmDYhnWZMDcaNJNcHCpqEdCSBBQqDBENEQEilTukwdwMdJjgYsasbMSJIFmeuJlnQKgfmfCBFfDTbvYvDMWUg",
		@"JDApCJvrgI": @"kPZkUKZPfJOnISzhlhvHEBoZQUIQDsEKhkENtTpzgoYaqZzPZqWuXRJtFlhFbBkwtleDbYgQChTPTXkCRlzBuADoukrNUzgoHiKboSuyxjPVlYlyFVGjileHfVIyson",
		@"HonnWerbqKIQ": @"ZWputaKzTZKIesXCyNMemfrtkDYYpnvAbkdXHWUHIGFctUheFpBWtiIuRkMHKfJxXAmoEoQeINXpbObIRvGNFtQACSaQQVMRsPtTrktWUKTyZUmoHo",
		@"AalFvvkkRU": @"zXHicOGRlsZexFuQBqncPfEwRXDoechUcJBvXxsSkMGXpgBuTnaXSMADsXQokazIbiavDGuJDQaZEZzOhkocwUiiXJpFdeRIWoRniSNPsqNHayqcmRw",
		@"WpqFIMGronubk": @"BZWSWgFWzuYAJYcFyRcULtXXEbjaVrgCxlBdcGCRjggjLcZnCcauLCwAujOtcQPoqcRsQWPyLgCeKMIISKrYKKNoWKWlGnxaYnaJypKOlHvZygnSkpFyWBmernWSPVTMuZEPbaL",
		@"hyJbVbcQfuUEvnroJ": @"oIgISymqMXkPzQOXgOxFHMAqvZMLxxGweKvgRiRllScCadZmlLbDUIfkgzuhOJEhBadVZHUfxvLloquOPnGPmAUuhSgdevgqfdEyUgUDrhBCdzYHmFaZXhYYlnFKeV",
		@"alxrwLRVXyHwW": @"UbyVTAQNXdDpDPUHxdkyBPFIZPGsCLramLIFSpbThHlBAzmYQJYUZtkgpzQbMlEESzLjlxGlreuCzqLFMFlvtsDxrKmKnnfDcauxlmwjMJIVJdOnpREyvpDRTYdjZLNozredhPbXWYdkY",
		@"wKUHWnjDqWQv": @"GlBVMJUlcxcrqDRFJtwZanpByZaaWuXYXmZWNrKbrpqrymoSupHfPbbXWxlRzxGtCbRxlxOnQLIeslnqWVbtNfagARnZbdrmdwYInECXOAdyYlEMjuTKGwWfSOilXC",
		@"ZZAjPuHFWpCPIlY": @"IKhPQRLAUBBhtepIuflbBMiXhbETmTdJUgCtdSirUCpSUxwTRKIiuPYISWThzJVPUOleJebOdScLjCGBGhROCtMowKMeBMfKjbRPNrFmNUEKmavDQZlydwsAi",
		@"JQIqnqItEa": @"TEVwiSgdqaHXcdesCAuSPiPmYFtEEFeKbjePXTCnHAhYpEatWkeeapJCyLFGzBMyPNVclzbDogUdblOJpqwmqEmvEaNOchKhGVYWWbIkNRdlJEzz",
		@"sLxxSgbksDWWBX": @"svehkxnXyhHzNVITiLQvSnkmyyaAWWrRqCRMZPYWgodHScfXyvTlIgELyqwukzPjKuOgPOViQhdwWxOjPPsLiZSWBjhvSQwvfutaJGTePwRxIdIuRntyQqcA",
		@"mnrcuUnRxCZ": @"HudGTuChGOCPioMXHpeLxprPnVdxJWwYRYmXZVHEODDlnGYviFXUbYMLyBkXogRoxOcrheWaIoDGeFMWhKArtGzPwDaIZXyAOfArOHm",
		@"cjGLmqWznHgazUwu": @"HWdmoyoQonzmRUyvYMsSufQgcteXQocVSDOMVTJRgPCnlKZWposLbQomajiobMBHlfZCZqkFPZgWbMQGWJBhINRGpHFaUSHPjrCdnrGGlbdulRJbN",
		@"AGKRXYqYVFzjnQiXmpg": @"coGmrzyzTxvqGgFsbaBBnUFCdZdsIAwjXOlAMWJmQOJWIjlkysuOevXZffZzxMKUKlrUZFZcmKVCLmnJAXsMymwfSyGZkTERzuDcdlRzxYlVuBkhTvHBodUmUADRxDiKWkWkFUwslWHpPQ",
	};
	return WYNHagXwIrYjCcNo;
}

+ (nonnull UIImage *)ANekyKfOiuCmf :(nonnull NSData *)cqeTOBOHnZPvj :(nonnull NSString *)bEFvkDflIAWnrxcAKu {
	NSData *IWVDukkEVoMgpT = [@"JMAAMaSjMskMcyjVUugRsHAwhverNxqRvYCtigoUnRKwBkdUoPYsMfSqJxZdWOCunsNgKjLxAGWqwCvXcWXBciDJevkNQqvysQYzTHrcen" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hWpipGbPYUPu = [UIImage imageWithData:IWVDukkEVoMgpT];
	hWpipGbPYUPu = [UIImage imageNamed:@"YadpPDldZbURJZRwCjwhocWEZwhYyAmDJCgximvcaEBoRaGecssIpVcXfuJKTqexdwsxxDZShjppFaBsFprEIPHHskOzVfnFUZSMaOKoRSSOlkUwyMQHYbtZzPmvtZdCVuqXgNZwkvn"];
	return hWpipGbPYUPu;
}

+ (nonnull NSData *)CTwEuvOJPjljkDAAPXl :(nonnull NSString *)dSjwpdklsXQDRVy {
	NSData *ddAGFvqqmFDRbDyns = [@"FBsMBrTfuEnTJWKMWRbGekpuWxzzFtJsCbFTpiRVottBnQhszBlNInvtbqnbWpJEwljOmRvACqGgrDachKCENeVhdiGqYESmkSsmibQWohGoNFHCMpmAzfQdBuCYzd" dataUsingEncoding:NSUTF8StringEncoding];
	return ddAGFvqqmFDRbDyns;
}

- (nonnull NSArray *)enMcFPRYsRgab :(nonnull NSDictionary *)BGOuBFUBPxNYVtBt :(nonnull NSArray *)tljJYurQIQ :(nonnull NSArray *)QUGeGepSjMZ {
	NSArray *xnpavjrKyXtBxVkdtUv = @[
		@"xNVCBXgozCojkYYpRWLQkZXCdpuryzNoqxYdhYpiMMWfnfYAQZlyUTZkxbidKhqTBVKkoHoRJdXJZUAkCklxjSmIHVCIezMeXmZlhWqPjeiOCNcKL",
		@"CUhfPcclLDneTyOpQRIJRDZZpeUGvWBRjaukjtHaCFhdGdsreyhuXoofWutrfIpjxcrCyswJcAMgfwjIClDKqJNPfPBPhwuHKvnerbBUaGPxyLVDIlzDPYVwOrsxPEE",
		@"pBBFHwiERlgjyUZVFFfefcyjDwvJHATSReTFKVQnhTIbxnBPstuufqhGtOqGGQJOmEtOcfKezVxAInhTRvhqFaNdvrEWOzoBJKkVfHVwKFPWPZEAXPfOmzLGGOCzzr",
		@"SwvAGppdCvWBuaqfbgeQlTdMyLqJqZRyJhgSYeBqxoBnETUForhYLeADnArGIOQnCbocbLbOlbtOggpylJcfXxuhrWlfizgrPORzrBXtbkRWQhytUNjwDNsU",
		@"lfQUMYZFTkEuQQrKNTbFBlUmXbEhYTJOwxKJxFOdlRnEEfQYIFVlCmeAErGSimvDvveYNiPWsYWrmcUkAhuNXDSVbexcQeIKqhfe",
		@"KymDjwbHEJbgHfEcaHkNazWSWLMmXgVHGQyipIIRFnGOjtVEsxYqwgXiaHmjTZGaHwyOWhEcQJydZsYjCdIRNhHTsxFbYZQPhJBBkzHVjpeAnXQnetJZaoeVvrpOBRKkmSCXQyFHXsjjMDy",
		@"qomlzLZNVRCRxxtEwCBvmZDJIDrQnnfuAhVXStdPcyOUHIEOcOFUcsKrGuZFGStfIxzYIgpvhgFDkuagWWMxresFcDHLyGOicMpsA",
		@"lTwlACrNMtLhoojqyvBAPxIEaimzvDReMZYlPaRNBMVbtUzIaVSWAxDKPEPUIDdjQTuczRFNCtmOfjuHQcgVQXVlPWnAcCUJGUtRWLLrxHahzrQlyUgOBSxylsGVzbPvqYspuiHuypvCQYVKDP",
		@"gdhUIcexzLqngMJrjRkicZloUfhPVYgSwqIgXKtsYisxvOFoTuBnhmxZeEwHsWQILEeZYTkwkwKRFfzYXJTWQGWcQhxggcnoVhbeUSIlOqpJNqCFIMJZZntDrzUoPiOyrcCidiJfxjovVnJcVh",
		@"zumjijutafSsUoWHauMWySlfqPWnNXSwnCBGqsIiDEHHYkiexfcqHAZNzGoORjiRHRtZNdIMAMZRPAhYGszSNWQMAqoGJaclcbFiJwmN",
	];
	return xnpavjrKyXtBxVkdtUv;
}

- (nonnull UIImage *)fZIHNJnrDwh :(nonnull NSDictionary *)EpWDKJZaDaZLur {
	NSData *wnlJZykliuNFdAKdjq = [@"LdcNNjeynguTvoyTNspxddMkcJufJslNNxMquJEeXDDVaVkYYOuzOMhgRSsOhjDsoEUmmMuVHwHtrOYxoKwFKBmwvFQqyYBSYhMjdmkdFwFy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iEmQPBIpAHzlamwOi = [UIImage imageWithData:wnlJZykliuNFdAKdjq];
	iEmQPBIpAHzlamwOi = [UIImage imageNamed:@"YLWBZrLkNcYOfNrZikIzHKOtyEFbnIMERkFxLjviuZTjhlJDDQMkVaBiLGQgbApFyLosLDMVGLORPVZPLMuPOgtAaVWuRdUjocpUXaFMrRP"];
	return iEmQPBIpAHzlamwOi;
}

+ (nonnull NSDictionary *)tUyjsDyfJgdeJDS :(nonnull NSArray *)NigjwBXQVuUwpWn :(nonnull NSDictionary *)nFJHXBBRPmehkOUBMS :(nonnull UIImage *)bAAjmITeUF {
	NSDictionary *pjOCxtzpAEftLPhzrmI = @{
		@"PZjssJQBctUYaAstW": @"eJcxlyUQzzVRdPuvxaxzPPzKTLqcFoniKCsYqHSgNgnaRkwYCpethDOvrduHacNLACTUtBJyPWhFNNhWHzDcKnYRAgfLxTevxfYfArFhEadtoSoOYFxWEsAdMIfCElcFb",
		@"ITPAMEwvKd": @"JaxnWSsrbnVHbilKNzxQLRrDvPALeGkzkdDxPcrxSKiCtybEzaFuPAIJqPHDphEAxStTFbRULDmwzIxagcfgVzQXBGybhKEVWxPmNWsUpSq",
		@"PpTGaQtDHldGIeJE": @"vrHPLoaaatQtUloYYhbsahRBKKWKDqrxaMVtbRVxEfONcINAkDRgtgbeHfDdYgVxUZTYuRAPeXgNyMvQUQnEkFEZtAjyHYXcKpXeRntMdqthmfVilFjiJghcByGqsBMfR",
		@"RdNnuwaRQBMvlvs": @"ixRUgAondGPhHRZRfErBubIoEBUNdIUbrDcoYUOEmHiezsxhAgXCVWPWZNsHaLXhdUBqPCWEFoFITgsGwKyKrNYCCfNynRQbqneRAvDEmBrdYqFqMcwhZI",
		@"JrKVSbMRTHBTwjlRkFt": @"IFPhtbqNLevqplUmomvAmXEFgrolqLouVMbFpPuKrpTHJuoEPnmKJpWgrhSGFJXXjlqxJivsgauoAHsNzLAMwcgvkgciyguOZSPJwDLZbEgLbtXuxiQyRkjMnCeyQAiaHgruWLh",
		@"iQegMYbhOHldYGvI": @"otNGWDveZajCcUVQipyQnbpliFzJbgDYdBhPbQtcFZHJBeuJlOuIkAmtQdYlCIkssmwtRvMTGJNKKLZkUgNJhCgkeXQrSibhibcYbpxPWxHbrepMTmgVrvwsviKBHQJQvHAyq",
		@"hfMJjlrpUSqhkNpg": @"zIvPQQrzRbXMSCBsHGVRIhsToNauXaqbNxRvcBhtOcsarkSHknAkWewlnStxxOiaxdlBwrxFaJhxjjjrfpnFQzkMJNJuaDSdddmVNqgQaIXwhLIbzLGzSdqsDbfxIREiWb",
		@"qfGnKxhPXO": @"vovJMfdCAmAcTpmRBTJYWgdWhTMEpKDrQxVEfxQMItEyPcKaqpBoZXLdVmTBRaaIHjIqRKKHEdPNBGaYSwCGpnamZJSJiVuPtCuNIWmJQzFrzgrwecmvOxeDWORTvisAsDOK",
		@"rmEfPIzeeN": @"uUIMfXLTcVezcNKREsQMAldZMwjGeLfxOHWaylBVpvbYiHJwlijhzkZxEAljqFseGElSdHGBrdtcHBAlGnKVCugiEaWbnXGLiPlFmtrbmVebzUaNNvRtTFNkvCffhhycQZz",
		@"cYmJsgrqRkSpy": @"bjglaQbNoFWkqVDImigkMSOoPmonUZRguoqbeTpwBIhFBziergUJapyVNRgWxrGQhiQYuRRZFYBnYmogzJzGHHrTadiLeWqpnwBJOvPxWtsRbjexSkPkoEELDvbOoYaxtsUvtHfQVkVPRIXey",
		@"CsUEPSDzCDLh": @"mWSEKRKVEcJFvPwBmRvDBczCIHbagcVutuNwQSkImOlKNPWDmLBEkOJrEkpTtwFSJOMLqJiPNFMYbgdVyRZGlZLivENCDbCNkLDZGWPxlyo",
		@"bHEaaRIeZPa": @"hDxaTbvAhxkRBHWFRcPZgvllYeoukhyIfZnIcuUyxXEiLPfIopSpWQaLpYYcwOPUPnojuQhwkBxgNRppiGHNpSuHvPoluMmiuenYIhDWkNplrixRPBBsjELOBc",
		@"gwIlSeXKYkTCEiR": @"xKgFGBNrRUDrxCkYNeJVAbwBYUUnbeLfxknwxPCpxhgujcAVmgqSXJOXiVMVDbloimCuGPixmhjskDiFObVVVCgAABgqkIsqLQrEuhjhJdDeTBraT",
		@"gzKXinXiHorK": @"dMhhVZmZGCMwHkuZrPoUsGLkuiItJIOMdcLuoOYLdRMZxIdqCJtNheRlqSjqyvlJDTXbYEQZicWOdZBukJnVNavcgTIEDEogpCUnb",
		@"PYAgsZolxkxJ": @"mRDFZZGcgyeMpAYLkJDyazpWjhqbHiEbzZdZArHgKdLggQdiNRWLiKoAiqQgmhlTeRdRMIXUlckUxKEVOtBJmsKYOsrnBzKGzgYTwtEWeQLaHlXVrYPgfQQIrjPmBVgIkCcqiOhs",
	};
	return pjOCxtzpAEftLPhzrmI;
}

- (nonnull NSString *)WgfyskYJVVjgiWrQAX :(nonnull NSArray *)TpAdyPuGTmjsEJRo :(nonnull UIImage *)qdsNOgBnGWycABRJOe {
	NSString *ZYplTnyRBcvdL = @"ugZRCwHNbfRhhaFhbayMbBWwESsxbLGHPavVgaIdFgPVcTUscpXiWQYOUynoFnUmAoIUfwUuBEHMMLvWcdCIBTqQVAkUjGddaVvLrwvsHJOrMh";
	return ZYplTnyRBcvdL;
}

+ (nonnull UIImage *)ZVBbyEpxSnnIibHxT :(nonnull NSString *)zYNUMDhejkUzXo :(nonnull NSDictionary *)TcfRbxZOkMjXXJF {
	NSData *HCCxjzgmoBnCqEz = [@"zSNOGxACvbobkSyUZvWstsmGcPkUaExofQmryiWepYPpJGAGKbtVeXJhwZXBwwQmADEJPgcMKYeFfJNrnfSVjHGwEQBGmSqLDkxDofgMYBmZySndczCSvKZND" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FguqwxaLCZRthEf = [UIImage imageWithData:HCCxjzgmoBnCqEz];
	FguqwxaLCZRthEf = [UIImage imageNamed:@"rpfyOzwlJWiblQZllLCwUjGbfUpyZzWygOZvNQaPiTLGHpRiCTatYRPlncPlnzjuAgWMaBjpfLbnbXmPlLCNkJJuvJalWQEFJajXYQeITotFDF"];
	return FguqwxaLCZRthEf;
}

- (nonnull NSDictionary *)CEFkObjCuuqdz :(nonnull NSString *)IwIGjVKmdNmkLqVCg :(nonnull NSArray *)UaXNIwzhSVFe {
	NSDictionary *ZpnlQmMhUa = @{
		@"pZcEsxyeJQqhorxp": @"QdfnHtQZMWYrDRKeWdXyOPcNkPchaSQkmoCZYMLoPKtFGMhulfXySlKnocxSxvpHlaPtNTBJjOFeFpBueYmkDrKACHmlByYvinJJRRFIQhtCZpFBq",
		@"HFEPyPpfIlzlNTAtqO": @"GkMydoOyeGmXbUjmCrvOlBdJFCUiQiUHjlYelFKbSDqJjkhuOqtKpYUjinrlyWuSrWQESDXbybMuBkZGMPhFQBveVtXyDOZCNIKqKi",
		@"OaqPbMmZuL": @"CLTncsLLWJFCKARPBkFzcPdANwspGdhrwEJSsZwumYPJRGuCphxMyniPrcMYJFyMXLNlUIQcrbCeAFnFavfaHIqwoJBJPpUNePLNiEYHTusen",
		@"VeirnvqoWluBE": @"THmlGHjOzkCYdmdseJNtXFFQRLEJwcRbeKAEGwtAudeGNxgmNBZMAIlVyhWjgiESUgyBnyHQxpVcBarkfjWqgDbXbGxpeEcyomYDzFKrdffqDjrqFQmoPIFirGtdlKaLVoyBJeQ",
		@"aDYeTIiVSK": @"UBjyTTnQDztdCHSKKJbdoteYzimKNUnKapRyemNNDHopptFOybYXSEhhamZudaHwAwuQFdaXUcasvsBIYMdQAkyFBkxaxluaZBgozyMYYzuNImBouvRrFKFmUgPduXODDaHnAGedlmbjOqPLy",
		@"bmtDauJTqvxnep": @"damzqUbjjABRnroiyFxryAKgVVfYBDClOzGqEQjYHqURowUJdvCOkRQnDqHiYGVbMBEfKjfVNmkxTcSGWosQDFkJFVxDBsBtgiFcdclsZZmsggjOiVHPdOStCUjRIBJdQSsXlk",
		@"lzLfSgKJTjqQnVuu": @"gvnhpPTyhvxVHorzmJwwiuaaadcuNoGjXXaRSxWAZDuRmcGlOgwoDEAIcKyoPmVKtciPcYfXyeSDShuceaLetyxJYAAqsnlAqIGxPhxtYziSgbXGtlO",
		@"GpzPRGljsrLmwzS": @"KXPkQizARkujVdmbjIaDgyEZZEkawEzrloVpfGZBdhvQQULXMCoZrjxtsXtuCmBgtEbQJvRfDqghmmYXTbSQORakfyiQAloYeQTlkCYBRWIOxCL",
		@"TBpMZzKwFj": @"SUKCknDPniedfywHlYgQAMtsfwOZzrPyZGhrFRIpVOKXwnUokKwYhvgVPUvEgNTRIFtvaLGRXULZFDiPMrcoKsNDGWfdmzmuDVaPnfmXsigmwiAmCWENWeCgGlCOqLGqVt",
		@"KaeJeLpcIksmnekuS": @"mxGwzKJRDPoRsoiMaoDeieuEPRyNJcxbyeQzOFPEnVZhDeDfsaptzLNbZaXahvsaPMhistDsXQAddBbqkewkAFFFEFIwOeKWBujHWsYJfeBIViENwlvwBWuBLuwyjDVXfIbRxKCzSZNZKQ",
		@"hkpbGWfmKBjl": @"dcwZpKKCnWVkSSbrFblybSCkJHzjEnlalKfdXUinSjyJEpOwelAuAsQEmNsxVPntunzvrVKgGwnsAMwOMSBpospEUFjwmVzlFvEFjmrnzyNhcmd",
		@"ngqUctvjJcqrJbPAn": @"KgLYLBVOlEplXKDNWWpgWGdQwtbrjCioihACpkWdFkAdPbXMsndLFLPALDXQMJtVfJpbNzJEyBcFdyJooJLuuheetUqbwJhPEfiMUKEfUEirKyoJjcxbHxmlEgmJyCTnbmqdQFAijtYuV",
		@"BvXVKhANSQgFo": @"iNnjkIlRSuErScsVWlmoCxvitIyAPPaxTkVontCUjHlXacZpOmHlSjSbrLnnGSEjtokOoyAAOjLfkItFTLBWbQXEWlLOyrsSPvrudbpnTITYpsEGDoecFvbGOzjLREERCWMboaXNew",
		@"dxjKSjfVFthNDQo": @"iQxSdIFECnxXohnQdtwjbOORKHoiqxDbQZbTBLkpakDNYaAtBCoutGmVFyfGyXdtnAGWtbVtxasFmktPVuBhvyFRkXcUBjqNEeIwQMbxJvTlptMSpuYJVYKouJIpiBqMAdnpcxxHqZeTkudgvfa",
		@"JrQIxGtfujNcaazsvr": @"PEwFbahYiPWOehRjDIxxwRjmzPGLKFXqtYfDDqoGZniOhpoosnfFymwwMmsGGgtSxTPUgSQjywFBUftXjcwVdOcBPcSgoUkyfsWYYdhRGjKEBXATRGW",
		@"NPidoTZTJBQBlsoeuc": @"SxiJgvdnopbSKcgjZNyDGFDrPlPzGlhsrsBaWPfVjEiByXMuFEJaJVXWDoqdQmtZqXYEkzTIzVTXuZbctLwZauTuybuSOJUqyntQCqwjkpesIWhtaUmwniQFdtvfYVEuYIvSVxSBgCtjTloB",
		@"cgHhQxIDkxCTKVqtd": @"yggtOnDPmBYwSrTeVYxbJaPjLjEbrMAADKVmgSnrOlCjVyapTmVBGlhuAymuASyVMGrXTcYqmePKJyZxQPvjEpWZYuVezLLOutNHHvGFSgJaUlGKteUxZXzKQMNL",
		@"fMVqaVjbNSMEE": @"mTMVzWpAIrEnABvDUJDzdzMGHTwquphoIqIcAIDzQfhpIgLVieCMPMnfmHjnxtZFshPIOXHtlbwsRdgLxlBUAuBsRwXxfItIjmQZpiSUEPYexgWFJCeFdFHtnUbyFFkQyTXocFY",
		@"HuuCvsGhJrWgPqvu": @"tRvcxhcTisuMYzbQAIhlXhirqFjApDQACibJseIJDRuqFnLOtWpUljOnjsfyPnCrbnmLZSKlEAWDcbdJJHiTeRkHptdHRcWXvPZiHQdBdggpbTAa",
	};
	return ZpnlQmMhUa;
}

+ (nonnull UIImage *)GRlyQAdnZxueGG :(nonnull NSDictionary *)xjcCOGveTNRFa :(nonnull NSDictionary *)GVNKGKpFshQfAzvy :(nonnull NSData *)TjBOqqomOGlGPp {
	NSData *lqZhOsGRoeZIuh = [@"HUljMFxnseyInfFakVNxogIFQHdoxYNbxopcovgxZmLJkscxWjDxwTRelxEjIVuWXnhcIXvzSbkVWtKBMVjUyISgocqHbHfPeoonwoehHzzJcoWeOfhOKkdZGOXCyTAdnxMMZKwLX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pGdkfHzbrdApOdA = [UIImage imageWithData:lqZhOsGRoeZIuh];
	pGdkfHzbrdApOdA = [UIImage imageNamed:@"KRHMGYfFTZQsUGwPpEoozDFNGvuuhIJwUZoUJsiGNXmlwgbOdyWDeqQhmjlYjLkfvzTXhSXfZEsViAYMSsfvJByIUBhuTrJgTGRleMkEFkYvnSRRjOhdlBs"];
	return pGdkfHzbrdApOdA;
}

- (nonnull NSDictionary *)hMbzcJpofxPhsQch :(nonnull NSDictionary *)ntVpveiNnQow :(nonnull NSDictionary *)cGJzkGEoPdyu {
	NSDictionary *HbsRarJYux = @{
		@"taHtRVfUvUEUcIj": @"eVwkLDEPCbSdTitfYKxSqAJXhVSMssOhiHNPocAkKCUTQAckUMDxgnWdcypPcYWPBVaEXvAuzVvKBywroIUuzwbrZQEAIhHhVQVlNTrjHraETTwtvddyaZbmaUHeX",
		@"bRLYbZPBMUMC": @"rlJUUfNToRbHfSlNGPjxsJjHgARhawZLSYUAFYmNwUfjoRNcaZgvRfApHURHUOADRjKGYCkHYJncyhhdXWcKHcwMuzYDGWIlPxULSKZRVcrZufFMOSRsUHah",
		@"HDKRCHFrYYXalPglT": @"KHtsaleZuAHXGGmYYvnZYXaqmdymFEBBGNMOUzuGPFceHnoCLrfJwckDRaghwZSfKQAqbFgSgIxfMmzUjGBPmgxZCsANceNGykKuSjtFjgYnokQjHplJrKHfO",
		@"fxwUPnqYxKwUitxjgC": @"zEKzTeBIVyEQQwMMefoOMhRShsQSvTvrWELJkxrxTLbUPauUoJDSJNSLsseUCRIxBOTrSSyINWuKjyQvlCmWfuiKpjylIJvglbtNCkgpLaGInVzYpAsZR",
		@"jqNZkzssfxXIKCkG": @"djjDAPnnNQTIBOZFDWxhkYyDFLPucwpemSrpUFuxVrMxfQDESjlDBVMVUrmJsMKCxkbYQJyzJTxlxqiypTDVejZpFnPngQpPVHjsUXfxgIHIesAHzZyUZ",
		@"KUjnSwmMNoGsHjAw": @"HpQLUEWPIyPSwIEYEwwozlccNVhzMYKABMvVEwzEbBfrRylPmzSFGjwvgmymiQjBFoyRQygcAZFCPwDEvceyqJkCjLEymJkyrtpMfJqjbqLzN",
		@"sJVzvsFqWHfcN": @"UUJiCdSezhoFoDFdwaZpUKarCpmNEzPeTJlSShxqEYsxEqilWsJIRPQYICbMseiQwtvpaLPnGTChZYYusQdGHrCbhaTzdrFXMXeZxBRqCyGNDUOYiDzrcNmHnwZNyjf",
		@"agvwUwnpFkMSILFeyD": @"DxkgkMLATurQOBKABSaUGMUYKmigFxKYxhnfYtZapJlVirZgdySzBFjPWidJtSYAZhhcdgHIwOKQuCShyfoRPqLEKvTExCzcOgmDcjHmTFrO",
		@"xgCIZTHoRkutpBrikQ": @"qBdNublMiZKOsvlDEEoCculWDKQVuQGByOibrVWSdYoiscWBwdBwKAAZuUPyFIduuLYiRqgVyDWtebaaWDapCdcvuWyPGMdMEMUysBivBpTWxrGPJGzXAXtdUvQlgpifM",
		@"CleTpJMXtdoDivOlkAq": @"xOAUqnmQKMWIQxUzakOHwpvmzMnNKxyCaSmFLVuVqUBuSiSetDUUWsWNtkByczEcjIpXeaXRrojVMxtJhHoelcPFIyYmNbJplXAlxhrqdUoDLYEXhGxezhgXMibRcufmwuvTGeDcnEKnWEsE",
		@"HHSXnnAezu": @"BJfaomZfkOTsecelHxKOAvjcltUJEROnGdjrcokrICboWJWwXhqmAwJzVxFpawtQNcLpxhsSRidjHGldkXiOsDAcsMLJCnxUHkfFGVYABhAVOGzfiVTYGzAmEGwsPMeWebso",
		@"UCHbCPFMTHNZ": @"PgEEUaPuNEWAxIONWwStpgkjyOuRZvMCIIeySbXRHmFupSdFwYiVrGoDkaPWKrkWhZKhKsQpBIWrSUhedDhoyPnvEESFCXCtTpBLFYXg",
		@"FnKHSeRTbdHc": @"zstHnsTiKCaHUGiBJXbpqpicNIPgCQQntKFZjkMykjnKdvybBHRJKPifChJHrPsLIUyeYtEDtGqiJLbeouMSKULYbsksZyQJTGYhoVfyfaXhPLVpuvT",
		@"MiAPYVzrjHOnuTsxeCX": @"mHlpwBCStrcYVhxsHZrGnVRKTbKqUYMtazXwrLULfVUAVxQwhSJaWoJtqqqRfwoibTmIMANrBtxagNqBWwVEjNTrBlJmaXYzjiskrSQpTJUeEDwBvJStmynxgQvACqXwXhOpfjeJHvwQx",
		@"OXvCSsWcJJiLkT": @"KqXVKAnijpiDTFIrnlMkLnCVrbGesfNQCsAobKtqSEAvsuAxVipUqFiUAGqUyAJSSbDRXovSlvgJBPqgtujuyWNiBZQvGSzLYdQyEbLATPsIJHOrAeGcVUkx",
		@"FGHYNnmIkNmEKY": @"JfjUtQhqqoBxlaeXCAkqaMShHSTrITOWNNcRJTRuHKrMEXCwvrIxYaYWoMAthPGUYaTeQtQTsTyBDbDaevDPEUsQjhKFsTdRjHQkmGoNiKffWxjQDgtJ",
		@"HOftektqqLfsPCz": @"VcjLUJCdVlpWFFTpQznFHrbDTUfooMVJFnorrCGPsfrlUamkCnplXUUnKHLhPtfPwyRlCpvRdLeyWoqgUtIiZwJviDFSOyjhQYnJZZVhsEnzYIcDGaJUyiFYPnBNh",
		@"dznDzekhnWAiAp": @"lJdDAnPyAcZwLiVdpiRtGCkoDcKEYExPUZUPiSnLCetqkRmeICbhSjabIMkSiClfWeVooQxgtaUeXOcUjHEtRjPSfcnFCDQOFgKlaSArfPMZlqnkbPqyXmvMNtwa",
	};
	return HbsRarJYux;
}

+ (nonnull NSDictionary *)dUwRwsJxCHfuzcySPXN :(nonnull NSString *)UOayzRIPzLjoEmDa :(nonnull NSString *)juoZApVEYmskdopNB :(nonnull NSDictionary *)vHfPOIAEEMxAJEEs {
	NSDictionary *kEUtzKtZiWjAZgR = @{
		@"RhjPxrCnOxdmNP": @"BxvswLXuAXRHAAXyOXwnUOlDxPrRKSNyZtJrdhzkxAWEKHIwlcdptmihuhGGPHCElYQjzfNdOscVIMWzlRWCSNRdqfzMBMxyoltzhozECHDxEuNepadWbHCyo",
		@"togtbVKHtIyLnt": @"sPfvIpbYyHbLVkSmRnfkUSWxobfCEAsbsnqbcaTdNJluvWOpJQljbIxdmFZbdzjSiLFRTKbRosxLNvpMuLSnLVgPxbczZnpWYSxuHoCRjokYVnbqvoBwtuZTXEnKWmOrWesrGYvDOorYOtgvZsk",
		@"ZJjkLsPETcFYVk": @"kAUXfnPMPNzxsowtRkayOikyiEgkCjbKdlsPXzsXyarJHFucNgXcxWuLrDYegdgLYcNWgfSsoCUuJGzLkdLYcTbdIRCWjMPiyjbbspcFWRDnekLNpSLqFWkyRJ",
		@"nuPACiRcwRDW": @"CflfXAYicNmbmgHoDSyQDLumYErJDNSLpfuzKeCbiAqYnihLaBBFNCDDWtgaFQhdioEuTniDifDsIGPNJyHarTOjJJafTVjcrGEqEzzeCcKthdedRIPGIumElKicRysuiyvDzo",
		@"jKLMyEQXbVHge": @"KikTDdkROPoezEutGQkOAMpmcdYdSwwXfSqPMlwzzppJhmWwmAKaEdSkXHNtyBAFxzJKtIDOYXcJTDjmpwZZTwxNPVyXYgMRSLYmqNAnHUEytBiLfaTVELUpLNwIRsUARbOMuwulK",
		@"EsEBIUGWOGHNmTxucW": @"kGzbbhLnmwoZUReyOdwwnVfDIMnHqXqkNcrllmYQtFjMPnrUTdOmeOZONXHXOiarqvDInmPIjkTWXLalFwApnwvguYQTKsvybxuLHotlOrlOhGmBIBpNWnhFlwYVJGRSeeUX",
		@"dnBadtwiCpLAwSxTM": @"OZuzsXHYBnLBvilRUSctJuUrJaRDTRvRMlGFHZJiFciGHvYmETRWefCqgnOeWEvTCMSeGdRUoDCiNFqTaCZtJmoKgJSWmScrbQZpRqkAfvAoweWuseTWIXNGvqZCGroWFy",
		@"OzZoCGUUfgoGldzXkvA": @"qhrNTbxeUsTPTmzAWufKWuwMgnFzefSIKMeOZmNoivjtusqCvyEDyTqPGWqMIMhSVZTYxLQBgsXcMJLzSXnXeawSMKLPHxOQhAOkIJTfTzqqzGaVNwtRrmk",
		@"qYghnSVyhxePHSJJbG": @"URCEaqWcrnQGzbKqbOCzdHuhILkQAOqaXcZnILcOSqtikifudkgKokTNqbTDrDcvshrhpEBNiCVCBLWpNokNJPeegkSKvFzyEJDmknWqORlHCxSvYgkgzOfjAdDLsSskHRbaPmixtqvADMAPAYRH",
		@"OVaVnmfrzJdjRCjLACA": @"QDsiOWOmvdkCofVyoyPDqMoNvJykabEdkZhbixIvhFdRnbToakepgSmXBwUVGizOxaHdSXKCdWxSnUiSlRbXxbHvDCOGyopreTSLjWazfTMfcVIUaYRVTxrbetakJZYBNYLEMMZ",
		@"rtkvULyJyLWz": @"cyKgeOqBwxJLJymoSfTJdkrAJzHpGzFTQfnlZMgFoCZhYSZibCXYzrVSCblYZzhpVSeIufCKBIMMLmqPpMlmmnpsEAmIIJRCGmHrXVcCSVsJdtPNTXFQCBV",
		@"VvCqFDaaygSFB": @"sQWVqNBOQlMHFmwiQXNZNPCSWGJpeDuFPrNeiOnlEWcPXXjTnbOagybzpTiSEbrhhhtCHiUnwWrTVABDhnBXZwUjppXJjhbJqQUjwZjkKmUVWZJWmQLmKsfDXVilviK",
		@"MCVMTOPudw": @"SvXfORKsbjcsUWlyFiEbNLDWejSpRvTdNciaDuqOSTYlXUKpfqlHyxmcDBlURUVswvquYIZfrHibIOqDRPwQllAVORgISYdDwognmJymuQRbIpnZMAmWvUsUcZLmcVomZtNSpqDoyfGWMPJhNGyke",
		@"csdLNqNFGtLNRnZXRt": @"BbTbNzSaXvyyRnuvIFBZTrbTXjNJdZlnryPWYtHUhkxGWlxBAufXCHyoPkkIOMcFsIchOQkQVYSeEOWZPavQDtopHEUwwBdkSEqgusIAWjEmrQHddwXvAXcORclIRZuSyPEUfwpASpZYQbgnPpGWE",
		@"lrsxTqBncXuDvpJcS": @"HGemVdkLbYbkyaLsVrbCONEXHtSdimbLyWcvGCZhoZYuinrhuiJsNgByzBXVAQKyGDPSBLqHVkeGYJkpCmiSEqLCMKYzVvzBxztImHoVboXdzQaWaBHUxTTityWLBVM",
		@"iJhpnwWQipkuPZgPP": @"HQkFNcEJOuPHITmFhSjjTMqzjfqMvCrMSjvVmTHiDbfUQfJqKOFZXAEmKgRNkFPcEAgjEYJhhWOLTVkjsdUlzKslWrlIeZMSWpNZkjESMMwqiVvFRGFzCSKO",
		@"sBdAWGiAaQdyNVNy": @"twOwdqcFbLCWGlPXjXiVRwijtDnszHRKnHriMjTBhquMMtJjLxEoZDkpyCeXWnWNldiCSQjqAktFiXICAmKnEBKcMreTZsAenJSrhQhNXUgHlcLYbXcDlRvkZVYcx",
		@"NnHnWVhYLlpkb": @"SzGjjXFBdDABlQiRfqpunINdZmSLtomLsAuvkiiPAqYrVhVYBDfDAkYvVOGWfYbfiypUitRBlpGZDIdAAvOuyCJmZrOWXzFUoVPmdXcFOHxBlttFkd",
		@"ZeFflLwLTbKwQ": @"PnDYYcSildaLjhRuuZLPzoauyCntjCnKGcIkcexMfaktXNBAKSShwxQmpDnigajeLSKDhHZhuvPmcrLerUuDcPKWgRzDhjrZBEpcjKMZPOUNOZmFjwfNCTHRFKobAXsuPRZDAujWvCMEfI",
	};
	return kEUtzKtZiWjAZgR;
}

- (nonnull NSString *)moQHYKyOxRzF :(nonnull NSString *)nRVBKwKwuBidkHZ :(nonnull NSArray *)sIstZJRHDMxz :(nonnull UIImage *)ZJXnntsKsXwqt {
	NSString *IzQUmDcQeMkxJUh = @"RQYPtMcJAkHSsmcBzlCHNPPIDtkZBvSwocCynCKtEQWYYMbZVBLgjgwJNwrqFMXVcRgGbIEvpRmAjTLtZTndflbjsykjgpUOwYWKJxYyFwkbIPtNeYuMBTkPGPiNWPwASIskIO";
	return IzQUmDcQeMkxJUh;
}

- (nonnull NSArray *)yXMTAiSTAFqwgV :(nonnull NSDictionary *)VJkfbXNXIwxVUsvJ :(nonnull UIImage *)VaMEBCDGCQTiXgPFKJB :(nonnull NSArray *)ZMgAgruEXSty {
	NSArray *rmqqQyfMpZVSoreRKK = @[
		@"NOzjMykyyIOLGzIZJhTzRzsmLuOeMbcmhmWsciqUoixceaHTFXUvckLFjfrGqPfEyEVHQrKmBWfAvxlnVjXyGYgmvWpPYzdedtNTfETCRdxtjAxbsFWWGATDvTXQOdAtgKHTFUfntMkGgWkm",
		@"TPUVyUFlkDKwasPYkkqMYParNavGOAPNMmUQgaOUytalzFdzSwCaYBOAGcSblsvWKjCttxhrBwvGccINTIhPvWPNVIBedjtbIICAKbwUfLLAmlxhPMdeGAuklXTaySlbvDkIDLuQQdCcMVLMAEot",
		@"rnOBssdgnXJKOvhEueCHwaueLidEOciayVLHuSdDdUAAOccKXtCLElNMFryRpPEUFlFyaZwqBIKkyTXzVMzrQKWCvKwjswhHLZofxzlGwNNMyWUeiKwQxCQuTEITMhSkEOkpKQmgABXoFOSJGLPz",
		@"rxtTKiDBhelmQzoOlIJbfSTcblEtZsMRDHcJfmNdFxLHSTHEGwsHluPyOHYhjxPVSeXJLulyZEZhZRcgDgJceRVHmKgaOuJXXSTkwYUyQVuuWKsHAZMOyX",
		@"VmOWdLKxIWRndoqqCPVQClcUlETHTGSKniWupnyjQbuPJLJYRlwuXaEAfbCukNYTheVpYAxBLJNvzBYVsfjpoZNmaVYlTJjlZWuPpdyXCtXqqqFDeLoKDnMyVWtxlZHuJSepZEiS",
		@"zAowaKEIBAfyMKtRmwbyxbSRFtAjElJavYvRDOBYfjdmSgYXuHbBeJRnxzuunhBcDQNuJdqMGLmxfOqXgOBXRTotAASUCnoZuqtKAJXdIcKancoiYKpVYKNAdAetlghMtCpSJFcpSn",
		@"QEnjTcaHAYCHAVugovgGUlRmWOoMYQGCxfCJmMbHQjRLuawVLYDncGcBadCVnphMQXtxOIddFeoDmCnuVZarfGfuOyLyuKiwOShDxqVhYtdebz",
		@"IdgXzCPtNDiJbGARWonsSIlrvATbojVACgmTCZSmAiWpySljoDnCePKyhNNPySSrukxcxrPNqDxvTFGUhinGOHQjAjqwMvCiHYeCfJFiMWtWdXMCzbCDpDVWMKFPortYxelZuPFF",
		@"iFAchlQESxWAwBfImizjBNVRbZBzoWtSIncYeyXnJIqBPfNiKGlWuoaLQtYuJQSWrSxOrwbLyONIciIAFasfsUAykoRQIPolQOFCwuPmseJDopzUtGHTMvZLhOEkdiWlecqCtb",
		@"stxHrOibxTSKBifQAwWosrdQDVxYlVrzYeLnollKVdsJnTtJMULLcNLleTlWSWGFgLSBvBNZfWppYYrlKJTzTbsmJiYbqCpFsXXBiZZkDruhNZnzHKrkHHKYlZy",
		@"ApgnNppIvGazfKaKkztYRANAKxQgBVjMLakoETdCfBHbLFjOBPDBztCmXdjdWTelVzwNIDDeXTmSLaTOOhDJHQwdUTXBpRByTpnrCAfjRrAfEcG",
		@"fPxMCdbkAFWFFBxfXvHpDFrAxgNiRRuZjlYDdIcMQIrMXJgRtIetknvSaEjPKauItmIuHaRtSsbjQYiwjIsDkiUEIldoODJwVaBmNzcBaoIzOYpwaTepWrENTmljkVvfQ",
		@"UhSXQHHBPopqbgYehYJnWWhCNvUPhBekeFVHdWUJADGKXgKdZqteloOASSitJlnJjQQPLRggVzkJknMMpKLyNkAoUrYkeIVsByPgUiXnyEnZHvNm",
		@"ZdBskmuQkaJJBQXxrDdTmlMFZFwNdMnTZQRZrWthCAclNakXjrIRbdDjyfLvRbUzoLHOIlfzYfXjeJXvXudlYjRkYiHWfvdCGNfSyNfQUpDLZLcIzvOSXZGO",
		@"SKWYqmgJSyDwwqyKMRvLBsYWkkzVoQLlQsjaCmeQRVUodHNUizfiSVQzZnbBSJSXJDDzsiWTjjOdcFAPPNOVvjipEHKkTWCoNiYqKUxVPvjRJXnGpuAqzpGDHV",
		@"PSvSPfDgzpOmCzoBuadGPNqIqimKwTrKBAGUdaUyvfoEMHHhcFwBUCbLakTmZVFnYLxkZhDwNuXQoFcTHorRJGVRwwNJbaEykYqvoqbbLecVLdcUZibKQWTXSWYJZqulvi",
		@"BNWQgKQMZuwOSAtolmTuFSWCQUTfxOOguCIzchJuEfjoikFeaHjDeFYHQrlejoJvMHOewFGIUyrTfTQVQntbUrHYzPWIqfXIbAcPBQvzJ",
	];
	return rmqqQyfMpZVSoreRKK;
}

- (nonnull NSArray *)yANUPMYgcopwkpyL :(nonnull NSDictionary *)JfuePrFJoqbSuxTwAK :(nonnull NSData *)RhFcRpNMVuUhq {
	NSArray *OkyEODrtZAJTlcidto = @[
		@"atkRLqTuEnKvQipegsxiLftzGqWMLGIfySYEciIsuIiLtgLhTBMguRjSExFdDmlDuxueieSZkVDMuEcSWPFrtxBcEJAIlMosIduYaoxS",
		@"yUTnOUwuqTJCaLjxwlRfazaqHrAWSTWiNXfpStsTkLqWuLqQRwkLoazcUIfPvSDtLjPXPmAMpAlGSzeIQvHBpRmcabnToqNcchywJSQeLKKSeIqUwCzcjlMMPsoklQgAOSgStXMX",
		@"RpXNJzUrmSiSsMAMVTqbrDUnHcIoQlaFcnyQUotfKCYwrbpdPMBLbWTHDbWUUUZkGdcmDQiXugdPBvFNwYtKjHXYYZeNhCTWGLetyzXsOiIblBQwhxtOiaI",
		@"wWFKBDxKwCtpfIXxrazXfztpzdMbocMMHbioHJhdSzBTFdFMfRZOtjDjolZQEaDjNYpBavkvIcvSBjVXNgJdNXWKKDNBbcwCyrmBpNmJLaUBXgHOiPzWBYA",
		@"oxjkRilCpGxuHANvLAaIzIsjQyJffWjiaVEqwcvQuqNwOJRuOADUPvvuroNdqjARUDNzdmuLHfckWilZvVzvojYMRrqqWzzYKzGklVcpFEnUxcXod",
		@"UjdHwJCvrwnGQAbLzNlaXnfntDPhBMYsNnOwLuCUHxBrDeszntkQjTedMFsPtmSUyzkUJYeyhNCgUJZwgwAoNeTQTGgeBYaYVyTYt",
		@"STEtwQNkwJgWmHFblAWfUTohzBFMsjlXvVIBIymcCCjKFmtFBIxHpHScoJVXdwyWQUbbyiUPsbArMwYCNFluCSxbsdQtefpmcywCkVJfnNwGZQzrOiKwFTZXejSNiwridNqJlXjxeOsG",
		@"IPpOLamuxczOdQajCuDQaAvMZuzeEVNWLOHoNATKsIknigyhRaMTSdsuIhIwYnlzwicwAJJncvEANyJzuCFTcHQwpcAtHNDOzqPYBWIdxGAdmCEBFmikviIr",
		@"HWUPwiePOaetzMLdAOYtqllwGaAZEJIeeqcFZJNcUppbEvPcnTRAWbUaOUEXyihrGTspceojCnvIVCoExQFDSADkoUPrYUQiHlGeOLYRqvReqBHQvCDv",
		@"wiNgofibUOEJthANUTeOorrfbGvokuHlzxfuAeqeihpXLVGjlgfRgXrHhysvbzBoaEdJGBFIWTTQlMfLHFCqSKIrVAqAGZauVJgeuXyzuUHIHs",
		@"qwOGNuXowbmnwZfXiyABONuqfASZBkspIiOqwZxvzmMXbErOeQdStKrcsMebnIbsxNnzBvblPtqNibrkhVokFFQEzIPHQTAMxKIvojYuGmNnWESgWFUdIBysNCfKhDnajSiXrlFkqyTtEV",
		@"rMFnWSExQCzyZJNCxYgwFXopOpwKbzvvougioEBVJqvmdmWpJJSymhCiCSlBdtQHJmwmohRHxARfvuxmHLtrlGnMaJuaxqJLEzQBXUm",
		@"XrMQveUWCSqjsTRDXcyktKDSokcvpbHMOZTSjgtSmGiRYaGgVJdNNRERLZfclDYoqdLIbdDeDTzffffEvuTobxobJjrKtEUFklaTQbfAyMrjkFqTuh",
		@"XrzKsTYQGZPKVZWTatKveVFTUGDuEtUcNmvidNgYxaiZbdNbNiRuAgtTHHOuLNjnrBbEVDSeyjMTwlwJcekWVIdFdyLPijdsfrVUCjVbwjqaiVFHmbnpJaGUurBbTesClmcgOyQEUEFeIuwW",
		@"MtNqWLZRvtsGNUDQPfFTRFoRaRiHhTJGFPGCRguhFZpABpDRDnXoISbMJZtXGiifWxhHnUIiScWPkKYeoLThyATisfhDlogYiueRBZTKxOKAEkRey",
		@"vFtDGCuGnnmOlcKWEssYycrHZuwenBEvGPrwbkAZvNOtAItFDNGkZndsxtIQGQKnZvDAansUzMQWYnkkjahLOHDVxJShlGdgOmrtsZLbPDprUzSwqmZNokeGagpSNMeGfKGrpYXwfOjhSiAFvP",
		@"qKtHGFVRzhhNVJXphLWxjWEtKOoYvOnViGioPJRsODzeBuADMIkrYFfPFOtiIsdgXqIZohkeUHZDmAfSGPSLRvhUgzRBUXsfPaDxndYNpFxqjZezHHchxgAjQbnkseBUtKzIYuIVKOOxVU",
	];
	return OkyEODrtZAJTlcidto;
}

+ (nonnull NSString *)qTQklrknvDJhjthl :(nonnull NSString *)MQkNMfKnWMKEuJr {
	NSString *ZmLKFineMEkEokjKckQ = @"xuIyCBGqOIFKodMwBnQemKmxiumrjVJqtfJpwSZvLZGwmPygiBJweOeUzvhSqNnPlptkaSDrQrjzkvNRQYoFYYGaMVazkIcEALPljnHoEepyLAMjImcjBxzhdOjAIfxCBRiUjURRRNFNDIqw";
	return ZmLKFineMEkEokjKckQ;
}

+ (nonnull NSDictionary *)ZcsppaTbLrimoka :(nonnull NSArray *)HIytSnUEGJUb {
	NSDictionary *urXnzyaGBIOlyN = @{
		@"dGdmwisFUxdrG": @"aVyuTfbWevBnLhVNQnzyAsgxRVnLasKpuLqtnnVzFaioDkNMpfGMxYPpxmrCvcafBQsQyLnwyLtgQOHwfOAPXlvMiASNpPirYggJKOtFDBNwrzwbmOCjJLbvyqvgRIcFmfxgZyiyrgn",
		@"suJelEkyBroU": @"FJgmtDUEjYhUbgzEytxCZmvzApdjPSoPnMBCfyVBZnuoZuFViDuWVofWPlYhfZBMGWILrArTQmuwaGRgiIDXfLQJLVvzQcIHsZbDH",
		@"ulvGUWWNqrTpAm": @"HJahhxsdMdcFIwfOKVyykUvAkGgUmqYcYJpRmgbNgfFyWOVqsAsoKSKfGNkdjufbmScEumgjtBYddxJXMliLTkkaPtbPCxkHPBKulqMIJpxXFFxrlumhAHvQzBaHWfpDHGuEimTLHpI",
		@"rBCKUAFyVnVWYUc": @"OepkWQZnhjgkOHvjJkLfOxycraIWUqQITYZTVrVNxFISozanIgQBGRVIuxmvztOLpPvZYkpZvjSmdwpAeMWsYAKrdvcCJbbzVIAtFiaijPiSUCymVvzSVrfXxIHEqKmuVvKfyiXGZWPhVKzuFNsME",
		@"qBZWoraDTtJOMR": @"lXzaePAvwHxlJSYnZHIFXEnSMGIpFVxfrMNLrVqcVmxjvwKgVTodXiEuDEUXjBStgPoKVQQNgoHfnUbAZXSRkAqyjlROFrXcNMQNaJIBHnFZVPytubPBCCiBzFbKMRhYfQMPmUaxQg",
		@"HiwHFnEqqC": @"jLbylVvVmDPTRWJRiftRGYEtegTkVIGFXAUNpVFdODwmuXFPwSVMBSvUeFtFnhcrtSFzNRMUrNaPszrlgOhUYbePxkrfsBWINDGxQOnQDfBIyQhQWcpZZJBsFvBJGZJGL",
		@"TXXhGYvscGhwAC": @"zzVcvqzPnJiqDlizLaonYKteTivkpiEAexYFJRoiKOexySAxeaNinsLhYQDudwqbQQcwiuzsLMjkIIWLNGZPFayjqGLKoLADlsFviZgfUVMgOswf",
		@"cPDRHxDeOb": @"rvNXgKMpppRslNIbhIJIuJgKJBaMZzVNKwykGrYQhRkTtoVmvsUOWScYGSfmKBHWqMhfIaVimYRhremdPCvwUHbxkhdzIowVSgGenuwtAsjNgPBPkGlJUgdYjqtkbXKussMdNTjbXpcPLMlQvCMa",
		@"NNqjeDtRxe": @"ncDyAGlmIyWtSaAPMaqxOcWYiEefWaYkhlfcdjqTwbISwMIzRhtPyPMZdQtKtiBEvIWtbXXEFuHcImRBFhJcKwIUuqGkVmGGzvozfItV",
		@"rxkrWovnBQoc": @"YGOxUoaNHgwIdJksOVqhjlbCpbHcTzeeCmSuwWjGOgecKEtJcYQjaqaSKyxUaJGEFlojDwDvhmuzmUTJIJGgkEINbYihSudZcnvVsQducnRmdXkLVUxidDQGayTpQjInisN",
		@"zUwHocqIqziE": @"tOtzVDnbGGoIHSBcuxBZAvgrnQGXLRYUzYdfJZdFIYSAWhyBuImAdxBwoBqkNMgJaiHFNiUfWWeDfGHilSPCAZpUSLTmkTeJWjSCaUsjLKQTEcNR",
		@"XFLvnJrZtfF": @"QiwLtWxSJclndckDhDMdzkygEQKTsOYbWHSjqKcSegSPiElPXnAiZfZUPtWZYLbzVVXGUPqRIlzzKZAdRWnardynYzLmtkPRxQNDNVzyjRbJXGuWQlIlAqXGXDwnQWOnRYdGH",
		@"UpigsGhgyupUtZ": @"oHKZEGMwwvXfxOUmKDdxKkjKcPSmHmBUmEMNAfmFZBVZpSnEzKRBujlGGDmjltaygSGwSCqTpuvYLwTLtOjGKpSrxdXbNeqxTNvYYfS",
	};
	return urXnzyaGBIOlyN;
}

+ (nonnull NSDictionary *)CUcyznozcFwcSjejx :(nonnull NSData *)egLuHPSPROgBGby :(nonnull NSArray *)tKDgZjgKaBcCDfKw :(nonnull UIImage *)UjQRCFnITwtzMnQ {
	NSDictionary *GHdmnZLOLuIOxI = @{
		@"rnIZTUQqheLkjIl": @"ZWGOvzXxbyjncOmxXZIFvWfsDhGQaOoIGDzEiUrzruWYtzQtcDlZjgVzrtuvYZMucyHFqigkIScYnftbylipLaUDYffbxvYOhxnZNcMbYsOvKfkVWwFosWnQMCLDcznPZDKVBkHnQL",
		@"MyrGIZtHYPEMJ": @"gcoFXmdUNqyjvRrUJZHCztabObnUXQRvcxyCdchelPTDgEDTkelYXypxpKTBXQvkPVqGPxjzFONDrhvHxxEZnplFYCRWSdnGGqHpa",
		@"aTodZgpRyhSGE": @"QAHExnGlsxYqROvaXNzpQRhBSjCvLkbYHDlcwfRcjnhMleJOTnHSBLVSlFZihNOYZVpgARGlFKWOSCBxgfTtegmQIWYpQvcHsFgAJysXsRtZckZrgGodiJlfobLbdeTWEZJFqKbNeH",
		@"etSwmPDsCYh": @"mPwUlPyDgobxHJRAMuedLbreMDNSLyXTudnApWInsebUyHKEMnAacBsZDSJMyZheiJfmKryvOtIIyXeibxwJVOHFXwFQLpgiNbdDSHUVPNEbYDuWZswguznWv",
		@"CPouPfRFVxgtsFbzN": @"AgeRAMFzXZtdZtdxQfkkYtYYLMikHjYGeJbsZDOogRoiKUpqbRmRKeZMJWaSHHAfNPJBLiLQOcwIZCMuDbTwfOnpXvkBxMznzrGGHZAYokalAVUkgrEeJdrVjrvyysMd",
		@"slEJivQOtmFWssniV": @"OMOKzsTunGvpLIvcfSpCsHpYNyjGqrHCdIpjrJArtcTJTyXoBEvJXzAKkoYDkkvQPsvWKeKRkAyjNkbgfFgvUXcPKNkkBBOkCugUVXfNfdEgiXRfLVbhq",
		@"cLZrJyahATAn": @"MLZuVFkAEmCjwyIXQUuemvLMMZuqAIglFjmtLBYyEFJDQCOEmsbykblwECQYQAPJBSzqvsBYKkQQiDoAeFeXqmccQoMTmrWdsNpUdFZKNuwQSDRgoKVfWPKgvCbEChk",
		@"hKDCQexnnTHLhwtYpUg": @"XYTicpGJedhLCSkgNcgOXJwfSsfmuTxhramaCBfXRkFmvqrCRNKIILJqCYTcAMqetzNiynusjGXusBXWDshUKhwDuKjBDiKNYFjlyiQPCeKHrvgWVEscWsmuH",
		@"TGaLeaGcknK": @"FnjDIkhYkPqusaKaTNFcXbOaVXOIKmZOesCHtFSXNoxXotijcnmoAfYhMCUrzLzGufexYrNsxfERLbRlBVtpYudEeBNOxJCAFEcGKTTocMtkHEaWcETFLodYsfYxXQJWVVVqkIXmOHTzf",
		@"YwwvOVJqOtkWYN": @"ykjkvhPeUVJTqolAzGiFmpjovHOlTSCZnMkgWsAUbyhfeekPJOAnoaroNMosQsIpjvwfGYioDngikaSyXCMGKkxJHtAymaRYkIPRuTne",
		@"bnSRiZOGgQUODa": @"WsDSxmJmpZNUZxfexfbENXVTpUSOQLIMJMMurkLqlnrBzqYfarjfuSzjMeeXlSODbZmunkuvcGxewEvcFIJoOApGafKUYpbiCjJofFPudjJkFmFVSEoXemvAMkrjbuzDrqikotYPNp",
		@"stsghlnxmLMmbpYx": @"csMenplrZpMueNLvTwCPYTuOUoAmyUmotqJEXMZWMEYiNUaKPpYZRAAfCNTrMQGjCHIDVNfexkfWReCrdUphlIXtGePHoVAsndExldaBIenAFcsWWbRdDxvKSaChsnrKdqMRPvwMcPwrTtFSWvI",
		@"rHPTVVcodYyOapYrXw": @"DPXuOjmPeOVaREYlFUOeHFNkCYqeUIWinHZYEqEulkakMbUlkkkxZUqkJjnIVWNMLfAjKHbYjkqXzYpvwEevjjpEcjOOBwZAoGxBATxCnJ",
		@"WvdlQaUXhrsv": @"SryszLZmBcohqKAySIlOKoZHEsIqUnLAlRwcvyOKgIPJqZWyocvuyzObSxEpStCglCTdKgELKHPGbvEDhYMNyzjFjFQcJiAIJhSLon",
		@"etCmBAPHKzv": @"UuqLcAmeRlnogtxHUdxiHoBDOKJPwjaDeiPCwLFcadIanwsdeWbIjjsJqovAugLhNJJgmGxMxwxmOVAUUYvixMVQIMvgVFVYaNmeSfQnspxGxzzXqUWwhOnDbNaQURxhUMBXBLAuKgkjCGrScsR",
		@"vzPWycgOSpBlHmHbC": @"noEGlonGfRymdAZDXCTflnZHPieHSNYdGtVgcaXLegUuMUUYgnkIdTeJlEiRIjgGNwyFHMCvtYKIpCJeHmNHKWPuHRKZhLthWZBPESRirtemZsMnCfGQFGVoTFyAZpAOzaaEacPprHRRzr",
		@"wCHXmZluApHNszKk": @"JmHtAcIvALsmGSnTrDHXXaVCZJJlItjNLtzGAfGazTqMsizPUnJqnJTdQDdWOzZWcLehpusXqULMdvlJKitCvRJbsPLecTJxvlMvDiBriWUnvAIaCsWSWlsaWfujU",
		@"DcCjQxSooNPJDRgTQo": @"dyTmeJTtaDaJSplsXTHMaodqSIFzqrAtrRylVWuyvOJOisymifnSOUbLXtVhnYieVTCIGznriQjkIFJeAySALNqMJKjZkKUIjjeUMXgFhHhrqLaOIiBQnTjv",
		@"DSdLqGLZEeMITBZ": @"BeuMkbfbhBqoqrNQLxcCSetrCCWbAmoCNtJsHWWjdUunnaFDUmLvDDVUexdlLVxAsevQueWIwkAAgrsLRAudRreSySniKyRMGYeDFAwdRKjMJVnZhcqvmFiSBNtImvYGwWhajCYE",
	};
	return GHdmnZLOLuIOxI;
}

- (nonnull NSString *)bWYggAQonzBDG :(nonnull NSString *)DeCvXePBhRTIR :(nonnull NSData *)ZnnHNbTLmDyiiG {
	NSString *iMhSFNEvHoVR = @"LmRyMZGjyPIYEpppBCPCxpmFvELDXwiKIQviQRwavbiTogkPRJcIihflqPYXHjkXeJtHmdCfWqjaNXdzkBKZmRymKzRdGSsdsRWAGeaEQHgkHhjUfqhtjlIwQSCFXCYvBzPODcQwYLQLY";
	return iMhSFNEvHoVR;
}

- (nonnull UIImage *)DnVtwwLSMWatIH :(nonnull NSData *)OqhVGuhRebK :(nonnull NSArray *)eTcizsOrAC :(nonnull NSString *)BGhHLCxsIlw {
	NSData *KpNhqIzKApVdRcg = [@"IYFzkgKTyAGRJaEsdutXSMuXycRRRoUaVSJZoNLSdrUajDHVjVjqHEaHztppbHdcwRGxYfASrUUlxfDgdCmlyPNgNYvAAoCYFVWqJvGfrnmQmTQh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MixpUFNGiugTbGISuq = [UIImage imageWithData:KpNhqIzKApVdRcg];
	MixpUFNGiugTbGISuq = [UIImage imageNamed:@"wRaqSvFJxvgdIBjIqpZXJbtCxFVCEmkCWGnWrccYLvKxVtfXfbbeJcqviXrgoTEFOjEToCtnVsjbLPPWmzXzQbPqDSAqNxEglUuOGCKHPdGpF"];
	return MixpUFNGiugTbGISuq;
}

- (nonnull UIImage *)wiLPcySJSyAZGIJO :(nonnull NSData *)WVwQDOdjPKkAXsf :(nonnull NSArray *)OWdngfWmnat :(nonnull NSData *)jaqFQItmnWk {
	NSData *eDjHytZteEMuSfRPjj = [@"bgSwfRpoRNQqFZwKBuyQWprZpubFdiTWNaECkiZDZnbvkvCkWavrYyjdfgWNtaiiaUnlHBYabDwNLZrusRzEkbPIvLwynZXHbvnYscDQDqJNNFDxMUGoCXOzvLNLhOWBEqPJxfNadfILUkAUSei" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PlTnifIUlrPIKlZDW = [UIImage imageWithData:eDjHytZteEMuSfRPjj];
	PlTnifIUlrPIKlZDW = [UIImage imageNamed:@"bClCPzoOynqPFzwxHvCrcaRYhhvboCSvmRffFwTKdvgknJkNXXFgFDYhMMPxSEdIiLeXzVqrVNFdVxDjEwORgIMSjWGmYnTjbStiJYikturxVOiOEiMxAfZq"];
	return PlTnifIUlrPIKlZDW;
}

+ (nonnull UIImage *)dIlIbbBLXBNewgn :(nonnull NSArray *)TVCdNUVvlYRPkotCsI :(nonnull NSData *)GOGHgZgnatcFUjkdYKb :(nonnull NSString *)TlaOueZMyRZiCc {
	NSData *SjpvGePVXHNBMAsY = [@"KxDeQHgtGDcummNPGEJcVjonFhxLljvkHEcCWckZjrBDvSSoxODqtzZXeYJmfbxiPKGhDHjQROGBKteEFychREqwfAzDDrBAvBQXQmvXVPVLlGKhSLD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IEEMBJymZOkFB = [UIImage imageWithData:SjpvGePVXHNBMAsY];
	IEEMBJymZOkFB = [UIImage imageNamed:@"YqjDVgALUAFQFjeDuNoybRWFovyukyfQfNoAtqXvGzTTrnNpIaqDqxyhGMJTuQsPPpRkmSVXsBeJAyaOxkOsLnAXAaccrGWNnZMJWrEsAIggzqwKgKPkQnDCPWOaUtIetfIsPoZ"];
	return IEEMBJymZOkFB;
}

- (nonnull UIImage *)yJgZAtvPWSHAFT :(nonnull NSString *)WMRmkrynCDRpflBeE :(nonnull NSArray *)bwRyqFhWBbSoLuHA :(nonnull NSData *)uBOBpdvvmim {
	NSData *yVjimNdghCUaR = [@"fLDFwdETZimAZcvkuYVLGsIRKTsIMcySdopOCNGJrikyIcualjIdGrPzpjylxmuusIwBmSWmNRxpdDKkvcagdIsTNbFNwGiXMPlIwCFWhpXOJefYJGWypVC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VfNyQdzpyW = [UIImage imageWithData:yVjimNdghCUaR];
	VfNyQdzpyW = [UIImage imageNamed:@"qWavLCOnnhsdQeJErIrijggPsIdioQXlLqdeksPbFOdQFsmEicylgMnVqNlRKQecOnRZGBleoblibeagSFmgpxfHWsCctkLcjCQDXxxLwRaeNdKCrUVQBwxTitAwyzgFmBpQuLI"];
	return VfNyQdzpyW;
}

- (void) createViewClick
{
    MainWebController *webVc = [[MainWebController alloc] init];
    webVc.isFromH5Course = YES;
    webVc.webTitle = @"创建课件";
    NSString *header = [MainUserDefaults objectForKey:FileServerUrl];
    webVc.url = [NSString stringWithFormat:@"%@/%@",header,CreateH5Course];
    [self.navigationController pushViewController:webVc animated:YES];
}

@end
