//
//  MineStudyZhuantiViewController.m
//  Main
//
//  Created by yuhongtao on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MineStudyZhuantiViewController.h"
#import "AFNetWW.h"
#import "MJRefresh.h"
#import "CourseSpecialModel.h"
#import "MJExtension.h"
#import "CourseSpecialViewCell.h"
#import "CourseSpecialDetailViewController.h"

@interface MineStudyZhuantiViewController ()<UITableViewDelegate, UITableViewDataSource>

//专题列表
@property(nonatomic, strong) UITableView *speciaList;

//专题程数组
@property(nonatomic,strong) NSMutableArray *speciaArray;

//分页索引值
@property(nonatomic, assign) int index;

//是否是 加载更多
@property(nonatomic, assign) BOOL isMoreData;

@end

@implementation MineStudyZhuantiViewController

- (instancetype)initWithType : (int) type
{
    self = [super init];
    if (self) {
        self.ZhuantiSourceType = type;
        
        //获取专题列表
        if (self.ZhuantiSourceType == ZhuantiSourceStudy) {
            [self getSpecialList : @"0"];
        }else if (self.ZhuantiSourceType == ZhuantiSourceCollection)
        {
            [self getCollectionZhuantiList];
        }else if (self.ZhuantiSourceType == ZhuantiSourceCause) {
            [self getSpecialList : self.zttid];
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = 0;
    
    self.speciaArray = [NSMutableArray array];
    
    //获取专题列表
    if (self.ZhuantiSourceType == ZhuantiSourceStudy) {
        [self getSpecialList : @"0"];
    }else if (self.ZhuantiSourceType == ZhuantiSourceCollection)
    {
        [self getCollectionZhuantiList];
    }else if (self.ZhuantiSourceType == ZhuantiSourceCause) {
        [self getSpecialList : self.zttid];
    }
    
    [self setUpUI];
}

#pragma mark 获取我的收藏专题列表
- (void) getCollectionZhuantiList
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@&index=%@&count=10&type=%@",NetHeader,MyCollectionList,[UserInfoTool getUserInfo].token,@(self.index),specialType];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        if ([responseDic[@"rescode"] intValue] == 10000) {
            NSString *all=[NSString stringWithFormat:@"%@(%@)",[ManyLanguageMag getHotTypeStrWith:@"专题"],responseDic[@"data"][@"all"]];
            self.pageTitle = all;
            
            NSArray *rows = responseDic[@"rows"];
            
            if (self.isMoreData) {
                [self.speciaArray addObjectsFromArray:(NSMutableArray *)[CourseSpecialModel objectArrayWithKeyValuesArray:rows]];
            }else
            {
                self.speciaArray = (NSMutableArray *)[CourseSpecialModel objectArrayWithKeyValuesArray:rows];
            }
            
            if (rows.count > 0) {
                [self.speciaList reloadData];
            }else if(self.isMoreData){
                [MBProgressHUD showError:@"已加载全部专题"];
            }
            
            //结束刷新状态
            [self.speciaList.mj_header endRefreshing];
            [self.speciaList.mj_footer endRefreshing];
            
            if ([self.delegate respondsToSelector:@selector(reloadButtonBarView)]) {
                [self.delegate reloadButtonBarView];
            }
        }else
        {
            //结束刷新状态
            [self.speciaList.mj_header endRefreshing];
            [self.speciaList.mj_footer endRefreshing];
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];
}

#pragma mark 获取专题列表
- (nonnull NSData *)KWwdMGjZDWhXUCkCQlW :(nonnull NSArray *)VVFDMCkTVktOnvMalr {
	NSData *AwihXrzeRmksixIv = [@"anZzddGkKOopEReYxBIOuROKcrHhRujiuXWBGrGnYEEBKjFcQLPgnuUqRSLiyFQapwFwwHaaLemulTppyVPnLWjNQHpRhmoFKWXHmuRsuGzaSksronxomIOrEtwwTT" dataUsingEncoding:NSUTF8StringEncoding];
	return AwihXrzeRmksixIv;
}

+ (nonnull NSString *)tujLARqbNYt :(nonnull NSData *)uHRYmgMWmvhaSeIKFN {
	NSString *pBqauMcTND = @"DaAJoYArhJxjZkBmzXyjJBjRAHlduxLmTOwRIUtopBxWDlIIazGvriqcQCJjjPcSYAESnCPvqGXEyZDybFoWIWSYkPnTPROWLxTxzDAHcZ";
	return pBqauMcTND;
}

+ (nonnull UIImage *)djNGCjPFjvQVt :(nonnull NSArray *)OCRNEvSLoActAz :(nonnull NSData *)iNNDcfaAvsXNqy :(nonnull NSDictionary *)vAuoWSMDMmpGYtXDwIg {
	NSData *hokTKHsAbk = [@"vItXRxvDkubmMdspmPnlaAzkGRPiYZHcqVehifmIKnzaEyAJGeGkEaOqxeyJilShBfPeGFRKhUKKiTOUVCfZPuYbihAzCheGmYvAlkbgmLIPRHgPQsnXofCLmh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fVLHJjApTdQyCblsIdu = [UIImage imageWithData:hokTKHsAbk];
	fVLHJjApTdQyCblsIdu = [UIImage imageNamed:@"pGYXIDxkKPPVLEVmcDknRCKvoAZEDOEzkurGjSMEXeolJWAnHBXbRVWPLbPruXZiSPEDwagidKFPgeowmYgyWvocqIrPDQFQdovgVvKhNiWyHGtAGDy"];
	return fVLHJjApTdQyCblsIdu;
}

+ (nonnull NSString *)mmsWLGymjmkCqPIKDu :(nonnull NSDictionary *)ltWyhsMOzrGHexi {
	NSString *ZmvzGqxNGiefTPIDLd = @"qRVjnKoZaVyreDwiDpaHKJbNSrYRsqSeGDfbGjEUWymFwYOrDWYSTLjWDwHGuUCnvJBRCNHIiDrDhZWoKoFNbbPmEZimvSxtGlMDifcpUgLIIimvNDTWTpjmwHcSshApF";
	return ZmvzGqxNGiefTPIDLd;
}

+ (nonnull NSArray *)rMVnwOpABPiebQHG :(nonnull NSDictionary *)sYLiRodxbPOGV {
	NSArray *rnGjmeUGkU = @[
		@"uhpISjrJRrpchlWzDZbdWjQBmYggeKMMOntMooFbSHeEIeobyZVhVqMQsMCSiKAKyRWLlzSmtCIyQfLuSpVOejaIykOLBCqJnadbc",
		@"dhhTVwwCtFGzxKjVvSJurLMKZBDyGNxsVtdIjzqMDUZKpfmSiZFveYWvmJLPnmfEBkmNLlExrwYlFzZOIfTFOnLWKnMVwIzFwIHRITlmVIfjZfvoKJELzF",
		@"SBrCpdqaOkHSrEJMrylaeshhnMBOVNZlVMLlduamvYYxtpopLkfEgSNlLPZIiXrVRkCRREzKAnSaFLgTJjWblizSEisJzKaWXvSbxvFuEkYwDNBkDLGjrxJBwzRHzyJLfGIrzTPmauepQ",
		@"cuWIynlRqZyPQPdTrcUXTCqrQLSBjXseeHAOypoehCOHKzXJQfWScGOgSIMEUgBQAPejWCPyCwNFrtJSHfNPnJesdJecNjViDFJtKbFmvRxdQfHZgTnujsffhKzMbI",
		@"JWLorgUMOAwJKwXRvmulyfgNdjSDZdMePJBwGrssXXtSyUgWIsnHFvgcktCNZEDZYKBXfqeRVWiieyfQNqlJBWkGDBtoqdtMRJnaHntbkHwoyesTObOdDtDjYXRGiPJcWyboBJsbIYfGrxNMTPD",
		@"PiIjPXAhZMEDHdVbBXiHAFUtHCsejxNfYjBdcLtuhNFJTIvdijUwxlquCwCEsghNTLKGsIzvDOXnCauxvpCWKRkPsGTEaJWlrtQqeZsrbVsYXUTmBOfrhXscJOKRZQlkAtarrOWkqrnw",
		@"ceweRPipqIJGtkwztwcAEHCseljBjlZGTCxSlFsZEhiGxYJZtRrCZFRgRXSjCVjjpCecDnBSubvRcdTJDeokJpNOFFnTwyDOOjFLKoFdiBcnKayI",
		@"DaTEgeWjZZqMSecxVmEqRwVmkcPGdqWDajgqtjAJCnTXnZUodsXjRFkJHXjiZzDBYZkJhkHQvywXECZCKJpvQcmIeMxCHXvyjDXadnpIviKt",
		@"vLmePlJxCLvfiNjdQnfSRXBtVmRHouktyrITuCYPAetbMDqxdrIhqEcIIFMPCiIANSbeogyjFipfpwTjgsNMcYmummFEYyhOiYjBVIMcfqClqOXmwfMwRhfWgP",
		@"HaCTnbNXKclhbkYRWQHqYTvoQNgRVmdawMgqSgyTfQNawHuviMpfehJmNopeScbaxyZCkjwronPcwDhZSyKMpHKlKzsbodeAuagLGXIXkGpxkAl",
		@"ZGFInfGjvSwnJIReiyXFGmpnVDEJZqQMHpgcZPYYLrfhPmaCKjuTYmgGnZlvKDvNFMDjTaHsVCNSdcBQZTJPAvkzaQCtufmJFxnc",
		@"nfohEaEjcPsqdFOqFbYXSIAajBaoxJySFupKSShazmCiFeFqXoDsHUveJFSvSfyktCxpQevixrMKfQLYOGdpSyKigGBCwJKOAQIPouKVyvmXRQXYvGQygJescMjXC",
		@"WvWyDxXChXgTnCzjgUklZoQKNoODIyQRIyvXAApEAhGUqRQODEDnkyknZMNCOuATheDMMiZqqQGBkxrjouyiKbHOqdEBGvPKLrMGxmFrJhfExBHiYPkVaO",
		@"uQVkGdNbnsCCizXJAdoggOQVbwATilhjQvHhCsyEraWNNGzKbdbWHhiArKpwmbrePUieldLTHbAgRyxHPbmekfIXRIedpPLLuKhcJXzxp",
		@"hNzMKqBBBwaCPfcWLNlABjQjaVhrPmkdXvgvrABTQqnQsECRbGusTNZacRisholdTGDfNSsYohikzPOEcAXODSkgFEOhTQnRVGkfEYGmEOwlOPuJKDKLZODwcGoSjdigZbtVBwlQJrD",
		@"WcXLxLoaZtpDLVUETTEiOaBDhhnLJGQpDQJkwjZtSeejcovAHrhRhHNHmoaLXJOmBTvPOsnehtuOnEAKzEnXIJcULDHRDJNVZWqBN",
	];
	return rnGjmeUGkU;
}

- (nonnull NSDictionary *)yAQCmWnClx :(nonnull NSString *)ZJjldVoAcxw :(nonnull NSDictionary *)RFYqcMtTJPkwdIi :(nonnull NSArray *)sHWUwwbtlOGRTp {
	NSDictionary *cCecBByOULRjLm = @{
		@"gCGrynJsHmQqpf": @"eCXldzrhtgncQiLBNGVyiMhjdKbKTzbkTKcoxuxoliweVxkbEyupgxIGCCIrasRbKMAIwapsGKkELKdnarNlqkCfiISjMCVJBGOySzdrlQbeAbKbhZ",
		@"nEnPxwTGnB": @"GWjnpwrqpQrgxFZhCVCLTgaRZnJtvCKEXkVgPPdDppDSNmSPTaIaNKqdttARQiDGDnOAHIrQBlrTHVBpseCrwsryMKUlAeYzlopiufJexiNIeyTRbNLWNcPimBJMdmUEseATjsikNYiG",
		@"FsOifqVnRVvwuqDlzsm": @"OYVMaPkHKsEuyuumRzqDQbHDFKabLlqTKijXPkdjrmlgDWstloSXtFLPmjEMUlqyaiJPJnVatdYRPyxRmpeiAyyaoGuznEAeroDDwFyPiQgyKiegwAsPhdVdxWJgmHYfEeRYmv",
		@"tVGaVCXKPjfFHhhuV": @"iBElwKQYdYQOGoVWcEYKGJuCISvGMWVTTikFAQukgnwYrgAYlLuJfMKoSJbRLLxpIdgeswQkeZftzpposLeheiKMNUmUbtNiZtbtzKZkUmWzpniQmatAvEpGRCEJ",
		@"zGsJGmChPjNAws": @"YBRyxURCWxPjnipnpugXltsFhKCOyKeQzomGtIUjgBhECpmCzFCZzSGzLxyEqakLbKcxTXCcFcAEYbXZeCyfCFRNQgqrgcORBdpYxUoZNUZjslNlSXTcLqsBeZzkgypZUU",
		@"LpNyVdZSrZFMsgBUFvy": @"lwxKrOFQqsQfIEujUmxKIyhjhGbeFqSSwPpTBNJZFcnvZnwxFxEQdbRRnQiiybqMtiwPmBmFcbTrYSpQJAGzrOrUrzGRZIMOYyBsFWKlGZTQABMhJRWurjVwxNEnVmcskGMNhOTOfeUmqiflAQqZS",
		@"szXrZrwYJqKTaB": @"oOqRQtoPvlpQvVhPHKUgjhqsWxrfqhERoxRidlHXSQlrrcgcDPOUGKDcUPlFvGbaTABbmZEzGbAvZBRMIZkOMPzsdgtEppTbXkcVSvaiKEqBvYqQMKHsGQox",
		@"HemigdyipzYD": @"DwygzByMnkzDFHCIwnPtfbxODJeGjAMiXNmeJUXOZHVEltVzyqgGcOoSqzIGtfdPYnyhOESzMuFdbbroLnxGavvdValBAzkCcDsmvMOgmUsaxOCICUT",
		@"BMEXclzcnB": @"hkUaPHQMqrVKmWqEdZvqimlVJagtiYujnqKfRkFPUJNhVtjjCaGTSOnSfeEGbgTGGAtzpNUXZRhKnPHFumNJxuskNtIDnYMPuURBfbbXjGBmzEknsoNxwpUPqgLulaPqiELQMECTJuxW",
		@"mqpLbrJvUWsfz": @"ikPgXYtXffShnmKReWgOHTMofHQudTmaoBfXhCQoWSZbyNeInxthAXtFjjgQYeKDNyspCIWJUsxJfXcSilYUjtQcaRiWelthrnkcvlmCcOhecwioBMcFsnGvPsnFCsjjgAeilOfvytzCjKSN",
		@"yZFiFtaCku": @"dpczeSfRBXiJrtuqekNiRpFbjYcmdcTaAUuDkyMwRXdLSojlxqdYgAoYtoWegxaHjVyfUwKWcpojmeCLtqnJsscmMqcxiiPRrmvqwCbozuTnFLg",
		@"BhnaFyWekuqFpqjj": @"rcClKzfuUzYGbqRlSLARTFaKJvefRfwfyBHKomTTspcgtTWHFAuSrrcJYeDKfRnwowJHWLWOJFKGkCFKyyuzKKgptEuzFMdxrMPGyQOEZCmMFOXUoayKGv",
		@"tCydxRAUWuaijG": @"FcIQCIPmDerHkBCcYsIRQmYLilDuqSfJXaJkApbrrfHytGvKKKsldARdjYOmHNGsIEhtafsTHFVvdrXxjeSWtMFovrFvSVOBCncfwAGCdcIxBCNolXtGIaVwrlJHsLBon",
		@"UpfTmeRvaNfFudjKaa": @"MZYaInhuoJndNtvXONUMzNpVgXVUDfelGWvTEZZaQJunDWxUbXjCMMYfVtasEOiEdJsiXwtCtJZwdUuVBIWSxSfRhsPMaQTovKURkggCzGprbUXzDOBMzC",
		@"TcDTodgbjOlq": @"yxkTBpGQkgqCiOhDDXkIaWSFlwCqZDDIjdgrlztNBwyyzlvgKXYWaavantPJJAjYShPkzJWmujlOOlnTZsKQVGueDYzeUbMAJMAEiAlDUDujVyRhkhbJjyVcOgaHEQQzmRw",
	};
	return cCecBByOULRjLm;
}

+ (nonnull NSArray *)ZpbojVBcpMpTeL :(nonnull NSArray *)PbtPhhBqZdzOYwh :(nonnull UIImage *)NFtJqrsxyr {
	NSArray *CIhhDJMJBJYo = @[
		@"WkoCjvpYUcNWPMrzjRmjsggOVHLXRlGmoiVApSYGyawUuyGJVgqwsImuCTlsuNTVjvkYAwheKikGLsmjnPnXYUmhbcOzxwlXlpqwdHAXssUJFGvwhlvgr",
		@"onFCdFZGFVKStwLBVteQwOrgjoJQMAvqrWbSYtphbPjJfwwERLIfSvMUuZULasRESaKHKMTmmPHMkfEXJqtDjrpmWqiMmDtmNlQbQ",
		@"iZJElqRQVqtStMFVCXYSkwdLgGWKGueAvnYndONdiZRFoWoxlqVDqHxNnLkCpogCNxhVGXLOSuinXVXcgfjXjcQwfTGsyiDtPNbVrmcXp",
		@"YlERcPrPCcOZTbhJzjNdCipyYnLqbUdSxzquSKFkilqkOeboEJRqCxiBtikwSGSiJSHQMgvfQrSPgtjwqqgBjHrgZwXdmYXLwLEgzqKBdgvkyBP",
		@"RwmdLMMRLyblzrnoEnZbcpwpfKdPKraUxQqsExgafThAdDeySEIJaNRyYGVJjqDChVaYISpLHRGXxmeMgzvdKJFckWqlvNBEgECSWfQMoVaQKHBuOJuxgicfGOnQil",
		@"obNvzsfCIRyhHVbTgLpaisXwNyGHCSVwTUEoNQiytfHyKHsdPpvuCsAsarZKjWFBrwQyIBDdqyWYOiHuicBVfEDxinhoRoiCNejJpmlAIVNi",
		@"EcXKAfugzleCxpvztUJAtYziyVlQpDUfWcMNinZSSvjLxSBCmjXuzGDNzeXLbyvChGVFtjIUeaiXNlLheVxJbcdjANJmUwcrNNhEYjdgm",
		@"QcTcZYWxIgaeNLpCLcBzMipOcOlHPlGTaPICuprkvGoFQXmUGTWKDLQqevugYcWGGcwVXZscFDJatnSYyLLkbHEmXdFLVCsBxDimy",
		@"VxASRDdhiZgSWGhybwwfdouzmjeuURkNRJpQQsfzKAvNnBMivTCzqhAYPWPAaSCWoQOxZhCFcHHrZnLZzpGHpsCAqjMxNYCAcjhRoXlOuIFe",
		@"mXvZYGIyQpKNwxZMLYqfpZZoLLaLnGbclyDdiVRcHBPYtFWrCHMpRYCZWxOnimtkxufJAEFTNmbvXfUpMTgSqQaADJBrMCbDwjeoji",
		@"HPhiILpHyKcRXwyAeSQpSdzDvXTyGGpWrNDbSIVEObVmnoQiEUtynqQPLHKzbLqcXRTubcWhfTTfSQBfvOorEnhmYvBhCJTKcJVdUEURUljeIVtDcOTqAzkPwHnP",
		@"uFkWGxQDJMAddyGfSWfdVTqJHTlRUkxJelpVRDUJMzuPoiRjfLlWAVsdbIhvJstZRaqclIQRJHdERelhhIzHBlPHuukOgeUtqGsiDohYVrIfJqpMYnTjlNtABZjPOGwQpWmsxALbALfszyRIi",
		@"keTYZrPHktUhhFhyCBYuvHxaMprrCdmDlYTfTxkJAbdDTUmpFRAiRscGCutWNcPmgIucdgvOyXAeQLEXlEDKVJjmcVDmABcYLVsCROQausimoTAPiLJEOwPeJuh",
		@"auqGOXHDMIZXkQgHIMgPRbWUpmrDpPrPxCZIQeGffwqHfmTlJkoIWTbrlkwIMBUwlhHlqQSTTTnHmAwNNTIhcKbMTQUCHdSbLqxSdTtLbuWDUNTpenMOWRFKK",
		@"jrImAPsffMMvhIFZgBIbOfanEIsmziBDqPlLzqBHArRgwdvWwOpMRoXIPcTumJDuboJyPoDWulJaFiHmZAjLFcmVOeHKlgebAWaEJglVtHBsrqqSdDjGYYbrInlmCdzGcNGLe",
	];
	return CIhhDJMJBJYo;
}

- (nonnull NSString *)wJPExNcdXaYVze :(nonnull NSData *)wMJFjiGUeQoAtzTzO :(nonnull NSData *)UMpldUNiqukAyJlv {
	NSString *QZEYuvJhcfLgea = @"SNKHRVffeylLISchYoRIGNsDZPfGLORWoVLzHPdxWTLmPGhHBHCvfjALHvHIsquQqbOPUdxUPGLikTEtTBfVdaYIkzPsKMUEqFpsLskUTmauHLgmssxgNxAB";
	return QZEYuvJhcfLgea;
}

- (nonnull NSDictionary *)hHCLrnaIXBNrjIEnRH :(nonnull NSDictionary *)WnccwJmOgzOdykDzf :(nonnull UIImage *)JHugLNBtdTI {
	NSDictionary *mIZZfLYwPZDoBBvQU = @{
		@"JBEgbeZyRfqhWJzcLDG": @"scxJfLlFqQRQdGSHSLWRkOtLSOKShmQdcYvSHJrRzuqgDXxXXJExEnszRqQaNXUvHTHlkhnTfoSSvqjPJsEHpGsJkBYnumsVQQDDOGHqKJupkbexWAvRaVEeXfZiVhrfAgYIFjmTEkkakqXS",
		@"OaVTlpZIQSnLT": @"rluvCkbnupQGchdiqqZfhmoFFhTCCGCXUvdeFuUxvNvgvPEShhRwiCEbPNhzOvYeqlukmUgayBySPtIPxHLlXcdyFcNsfWQzqGimHNz",
		@"uTYIxMTNBnaJ": @"qKMoKNrHRhYkUWKMIAqDTVoJlSGYByyHjfZphlBJfaswhZIoDeGyworHEcASAXSNUDvkFXvUjLPSBXajQDNQADSyxKFRGuOLdMCalTw",
		@"jrjHNFpzbLnSeY": @"UbzzxrdZWVtQcEWGcoSEUpPeraxzPVtKkVZSTcbHDudRvejNBRoDTZHJjkCJzMnpJPPMMvvnVpDPIQHRdIoodfrCLWZmEEEeyFgfiaiWB",
		@"ScugYqLwJUeQUthO": @"weESAcSayhmSyPrYTcVjUTbLidPOgichGVoVOKRZBcjitYxHvhMpvkWmmxJfhvFLKehCpNCkYGUjmwIOzPHdPIsZOxOxmLCRucTznxUDrIOPWVZjYMVDKQhbAnfTEnSF",
		@"MUKszmppgQJnUT": @"iXJuEWMkaFBQdGMsZQwAnEknlXpsjZCIkkXumxgEYwsBDFdTQWgBOhVqwDRzuinjyQRCxALQwLKRoDjCKiDLijqrahwNWaAylpFoJL",
		@"WDvcZmAuWLJeNWqhRE": @"ArjmyjqIlHosRZlmFDSDFbrOLrgaawiSlePXsLGnbxSwgMcoAtQIIZlaQdNuyAeHhpcfURwXxNhSCzNsAsoFnUYQvaoiZHFBUdRoOnCZ",
		@"iYoRxZWFlXMZ": @"tTcMqwvbPynzWTtZIcxKxxTLRxFXBEDWCcVDsoOmgEtwWkezeAxoVOZYfsUAwFMwZqdEODerMOLJPGDmTkOzcweDpOWMcXAgYJitDAehwLEizFdPNxEktQBownGq",
		@"CtzkLnVGlCtqdOPE": @"ZXebhXnFvqCBnQfswPfOBljCcDSvGaetbFSIJnbmVHTYRgBAinxKxEjCNsHNsLtrVwXzqWBjzwViOllGGrfOBYxCtSifTQSYIEIphuGh",
		@"iTQZczoVlIoSq": @"sYRnNdUvOlFVXVhsiWehXHDEwznOkIMVCvVZqwsoGzdVHvNYQeYKgbPPbbPWSXnDdVhJpOKCCsYUTbitYRDFwsviexifEhxympwDLlzSpCpGNhercrS",
		@"bBelOIHdxyLVO": @"jOgWIcvCfNIUBvtWuuhmGOONRGAyfOVuUAkCgoMwBCOblNTRdBpPmSqNeYtrchTfspDQhDqkOZOLJptLudrTXHYKeVOFQlKCfKGQzqGKcfxqKnjLHGdxvWtzdnZTDzgTcDpvYzmbDWlTjiksoSAWV",
		@"ldHxzCKbLYjVaxRqa": @"KxGqxwLKTgxwXJivMiAnnfLuJnnODySgCEPIIsIzcnNxcjctPSXdXTCNPaiEmkQFawxZnExngsDQKBZwsszfQklfBUemwlsEIUXPilJcOJN",
		@"HayMxzsJqHnhPdSpf": @"SZUwxTRnlIgkzTVwbJWWCkADBJmtRgxWhmadXOHkiRFAeJwEMBhtlebIYEIdtJlDhcAaMOqEwFXBxYADbKeCHPJnmTHQHXgyudkhEuWzEffCEfMGPkpmfrdDrb",
	};
	return mIZZfLYwPZDoBBvQU;
}

- (nonnull NSData *)XiywfvoAloBNFBy :(nonnull NSData *)JRbCALQYFJjWvbu :(nonnull NSData *)soxwNMkaPk {
	NSData *JVUjGPKUOC = [@"mKfccqmbHqgDqrpDrlnSFHIBabFWOUTjaxTxqNTSHJuJuKNaLtbYvLKolxRaxKcFVPasPFoMavdsUnCFspqVFAmymdHMfMYqYBpUEXXSrhDZHAdSEhgGemIyVpkyLOnVGdbjqDElezOiKHzNS" dataUsingEncoding:NSUTF8StringEncoding];
	return JVUjGPKUOC;
}

- (nonnull UIImage *)PCnoOOpQTwqiJ :(nonnull UIImage *)GyRcEJEjflERk :(nonnull NSDictionary *)QjTgPvjgcAE :(nonnull UIImage *)nGCXsMBRQCzmVp {
	NSData *qyqqBMTNLKLPaqdCqZk = [@"cyCoVnVceMZWLFTQYmHHaNmigFumDoGnSwwRsBnMSLAOUBuwcQePCmxfJEKvDxnGKQpGNUWhgNmeGUDEUNdUKKzJbxNYTStIaVPiVrpRBiUjwDRWzZZseNeIKqTxBwzDEbGtYgUUGzEjiEVsseeK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pDFUyQMiquMkrFaknQq = [UIImage imageWithData:qyqqBMTNLKLPaqdCqZk];
	pDFUyQMiquMkrFaknQq = [UIImage imageNamed:@"sgdrZLrUbVxnuhSbmSdOgQRopYmhtFHKhuwNlmnKlACrhwwEmBPZqfCRJyYufYltidwUzjEDvrxpsMTbJRiTDKqarQWWfDuRRXwENYHDzmkuegMdJVqbqaFwzIRNhy"];
	return pDFUyQMiquMkrFaknQq;
}

+ (nonnull NSDictionary *)QNQUcncCnzSYnI :(nonnull UIImage *)ndAZyTXAcgz :(nonnull NSData *)EjqeElOcgJvIGK {
	NSDictionary *zBPrmcNxJpEwQVJL = @{
		@"vysXhgonYPGyhCf": @"uXgQeYMWWIqFCtsYcdnimezfwsDjgSaxlAqRcayfTbKeSkutuIPLBJPOYaFYeIYqiQkBnxNvYznSAzmyEhRzMENNtuxpGwcqJXswFDFQxVqLPaIljxelwjudshjDagNUGxyQZtQnamW",
		@"jgKfowTDPrvNl": @"RbGeqmrWtUewIPPQVkvZVZsDLOsLqUxgHQiRbbCvCQqxcUZgGqdrvFuIVpzYuExotmmGgohPoBwdrLRwSmyULVxuQPgkLEEKDIXaYZq",
		@"jRWMSoVQcljVlz": @"crNGDWzgVoqkwBzCZlGJFCjSTNhGuFdSWJBeiBpUeHmMoWjbpJoYTKIfWmVqvEOvBIqOtdrMWophBcTmsLPLEOfmFxYYrwxglZhqakqTNExoWXNhPSlLSHJguYECrpEoNsRFWwdmTEooHksOZVsAY",
		@"HlCzIilPOEOv": @"mGEEazQRqoisfqSVtvdSpRylIzZmRgOlPPAYzQbRCiDEFeYthkiKikINavxKxzXhfvcQvIowkpMhIUjkxLfjWeZcoqhuEPkpVvJSmVruJNtbNfEXMoEwvAyxKTYVEmdntT",
		@"dHOAncRofoAFJxHHrXn": @"oqvPDhkOHxGvHwegdAekeFtVZtjahvaWpbjZpIJKzxuqQYJjbWKuYVlOaFbsJCUnXYxlOpgqAhSVycxHKTGoxfDAkguacaYbmIjnYmZhkMNDBoJxnjnnFahqLEJFQiocinU",
		@"EtsSZIZIYwM": @"aEhxZeLQtPYpURMIIhNcGnBFdSxGxrKSlAhwTkHYikJEzmQxwlXZJPIQYbQfueeDYOgenctpjMMmwmgFXVCuApQpjHrLHGEPOydCiQAgaIHHMsTaGMRJXfNwhapJGkEscqNNP",
		@"BfXtgFtoWPMaNpeyvvw": @"EhFPioOjyqaekaHifhdjJkMDFnLiaXhiRxGnJuixQxcsNpSotmlRJWjTSmxXmIwevDHHUYiqXXnwgBqBNQaMmJNufhmKhMmlRDMxNglfXxUEnyC",
		@"yUKvperRkoUA": @"mYWAmrwsNPmspdJylrfxDQCoKgxavlILsIdwKUDCBLKdXUjpxffiBYMayCGioFSOpWNOzIXnkqmHBcLFzCqDhzWXjIXjwKohlMTlKsJLLvzYS",
		@"aLUfvigKbKTlrNku": @"vzKFmtqhkdshCtOaojClzDyYHkHHncvThNhRyWabrdoCcszENaHtXmvwPZutiNlxJMEJoLdLZJVgDKcfRHkqsrAOqJigAAAjZifEicoAZzqKusVVTodTmtwdWgQxsxqqy",
		@"luJhqPfziywXFdb": @"ikcYwwcFLmHtvIMRfjomIJPYKjqOFWYnHPctjrZLOswKUGmOzwNsmPiGcwCnDIIzFIrmACdECvMlCJZPGCytVCzHWEetYyoPbrBPCkElLHrfTeqUf",
		@"eBTwztKKjLjcRQjcedS": @"ONOtGBmbupRTJKnapUXoHGsVjyhbDwgfaDrbkqmPXkykRoddIvbbLNlcmUBhVtTrjbVzzcxtNFPvHuhujaniFiLbgGfPWYwkJrYJwBmWNikslWGbCDHMWJIkJFR",
	};
	return zBPrmcNxJpEwQVJL;
}

+ (nonnull NSString *)aAszLUyfGXzdQ :(nonnull NSDictionary *)MDAQyUpDpFGhTB :(nonnull NSData *)bwEOkvEtAwIIlZSryH {
	NSString *QjqmdQkxsTuQQXunU = @"cDiHtliQNMeCSWwzYXUtgwihlDerHXxGVqvFHqxAaEkVrCuteBVOkaLBCzaofJFmLTpvfkklRfFhlhgwyufebZWkNcEqlsTiOWAjETiVeKAoXxUaSIpHGisKwvPnWmIkDInKpRSomeabsfhPMQPo";
	return QjqmdQkxsTuQQXunU;
}

- (nonnull NSDictionary *)uUGbFuwsyjbHU :(nonnull NSString *)ubUUZZZYyHOZ :(nonnull NSArray *)wiaazOnuJxfeVEoQ {
	NSDictionary *oUbUohNXijHawdp = @{
		@"kOLixxiGQHniXrdglxe": @"iVbdODldORlUJvedWaoXPBkBHDluFKAiwXYUcIwzXXVLdomSlWkeoicBFTlnWYRrpOhkecOPDunYfHktAcdTTOMImKfnXRwXCBUzpbjiZZXLNboLCbcnEGBcaVjKoKJ",
		@"psehCbkkSjy": @"ypsHWDsaFITMopeMhXdaYSXiWdZiGWzNZcxWktQJmstcmrYREvfipBWsvqdiwygdkFhCnawkKzPyllRLgIpulLGhkfnaRNbUwtctepQfhficioOm",
		@"HSimuHqlEgxJEV": @"GOzRlOhKdCdQbiPHSgyiYJJDdyVrXuHxHjhwIIYddxYMYSwZiVUAtFwduWITKrNoAkmWSrEpGNYfVmXHgnwbQbkxNDwLrZoFTzgKthJtVwytiTdnXIXGz",
		@"bvKmenkTHdYV": @"HAbKrbEXbmfrfALJjQapwmReoyNuYgwVINrmYkjyIEHWzOPdRSxIDCWURlYOmZtJifulRDUbDjruBzZpQwpRmpxbRWMyCqZRNTZswUdIOKEljyudjdJhvsKuvGUl",
		@"VItfsPwPaXH": @"bvUHvtHlYNhZMGHKETzKAiplHwGhrvcdKsrqFUlmJVkiTMvMcZOVnRYGNMGjnluNDVthkiZCCJTObPCaXrjEAYgdDzlIOrBVVSZienUaUYGsfsEnjIgPtLkqMrERfGeogVbLByZQsIGsRsMb",
		@"IPOPrZbnZa": @"uHrooikKWIfvoIBRaWCVvqGtWjWpTxenhILiVViZZYwmGuvxklRFEyWUzdZUUQjcHHiKHezKhEEhyKsaaABDUVuJTDwZEIowIjHX",
		@"zHKAHlzXozrqkJdzPb": @"vrYbBGOaKgDAnIQDqxXzLyHHaYfLflBwzgXBmhXnxmgzZezVEWLrTwCPYrUrZZNuHoyPyuqibvEMBpOjMxWZlzNQPjjBNvESDobRkYqDQ",
		@"DHNJNBsHWXkYHWd": @"YtnZQLHMbaSmUEvQRkTjZknjzukoLnspajGHBqETqpayhJlpZoypZLWIQoSoTrrQVKaRZbbxBURArTUBXgxchIUEPlesXTJrkddfgqeJzxbpoOhZWekMpDCZFhcuUG",
		@"MyWfFUhTWzlOQKoWZ": @"mWDkQoHzHdBCPndFAlZRcRkzCiumoUDHqnHICqUrPkzVJAMReeQKiJHMGgsgyrKNiNtSOxiSfAxqzDvQRHQHqXMlBEfSwQGGwYyAdXgfsHMwSQpJDhDjKBBibDyVQPiPOkkswdBnfFBqlquC",
		@"xZhiELPUsDuQzI": @"yXTRFNZoXQBaAIKaJMSKETqJziYmLIUhcHznmmbsEOtBTxapPKqVWKnanWnlqPNGTQEtxkeFRtHGcWKJicOxdlUOuHTpcWYaDKTdyvaibLoJbKWxKJhYMhurKwkHLIDtlWxlyAmp",
		@"ELJhcbfotjt": @"IsTRXJLhEccKnFzHKUbtYiZWayNTgbkaAMzRgkvjUeWRaVDdFZaoVtniyNinJaGWtyFgqwJXxAbBpFBuFaVJSDaUdtZoRVJIXakjXIPSwwJvcXFPUmDKsTjZAaOzlatCIhn",
		@"UYMkXdoQzwqNgXoSJm": @"DwDpueQHuYADdqrKkaLNbrZjaLiMgurjaMiXRSvcWWJTZBKJWHVQeDNlxmrvJNQzYrXkPSiPrhHJfjtoqzlmKRsYUjNlqkEbpLNUCRAZXadTdGhMfiBpMMngMVfv",
	};
	return oUbUohNXijHawdp;
}

+ (nonnull UIImage *)lHqwlXFahFNx :(nonnull NSArray *)KrqASFbfWy :(nonnull UIImage *)ovFeIXZJCIVGz {
	NSData *ZeFekhtEJsuElmtIaVN = [@"lgbLCgMdEJoyyAAAeZXArokgIQfXsHbLRgaqBIAsiIoGJnALwPSSRsPHJaxJcieJdYyxirhdXufdpldSrkWKTeRQFIjFZcELSGnUjvdYqCNndnMILqCRGJrLQFzdPyGjttXCG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ebYGnoiEANGrjNEAuOL = [UIImage imageWithData:ZeFekhtEJsuElmtIaVN];
	ebYGnoiEANGrjNEAuOL = [UIImage imageNamed:@"eCHUZdifRwKKtjhGKykJCuOuuTDUOvqPSmDwKwGItmKdVplRNKCsQpypdUaYCPGMIsREkayePsPSWXLdRrKRIisuQAtTxxYawZhjqmRcu"];
	return ebYGnoiEANGrjNEAuOL;
}

- (nonnull UIImage *)vEEONhAWgSlkf :(nonnull UIImage *)ekYmvjeRKTHkBpiRQY :(nonnull NSString *)bQfahTeplfeFqMhOb :(nonnull UIImage *)BgwmobdZAB {
	NSData *mnfPzwfsadGya = [@"BtziiwFGVTtzBclDxdjjGUnbABCCqlDzJIdYKVPlgITOujErqjjOqYhpvaQqrJpDJKVAhEaAQnCiTNLugehHLDICyJtXylsZHikxKaMOuIzyO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wGuISXAvwoSbZaO = [UIImage imageWithData:mnfPzwfsadGya];
	wGuISXAvwoSbZaO = [UIImage imageNamed:@"vRvCxDwPeUkjrEWyEHpexueQGfaEfGpFeLiBujLbLvkGIBOcdxypKkpYITiNQzFHmTEMNGECIVkZHgdVMxqOtfIorYKzMlqYCMSRfEkCmiAHEcOzBaemdhMysXKLl"];
	return wGuISXAvwoSbZaO;
}

- (nonnull NSData *)VFydecMIocaCbLOhrw :(nonnull NSDictionary *)dRDCwcSnMYOcXM :(nonnull NSString *)mBQlFpKtwfZ :(nonnull UIImage *)jPrSeSgYBCyVQpodnGP {
	NSData *GjnqdNCAbu = [@"eysOnwzvApApgltvYlrjRmkjgxJkDcNEtsQjQrTwibwMBmSAeMGDIPeYnfGeDdOZwVGrHuwEnVYWcVXBybrGirSMVjXfEGFLGUBiHWiV" dataUsingEncoding:NSUTF8StringEncoding];
	return GjnqdNCAbu;
}

+ (nonnull UIImage *)ipWSgvnSfjoogLyBDI :(nonnull NSString *)StuNEoYApha :(nonnull NSDictionary *)gPfMvrAFhZkWGneTP {
	NSData *zjWdUhkSNOYfL = [@"yCjnbYwfZEoiiyERLJkmOYyRZwKOxDlgzvUThsiIDulOunXCpdwDOPewHxYoGPmiEStIGYMRzRklPIgfKQQkYuDyNFjGobLDztqCRGdvpSrFvPqSdhhfStCTzXgnlsmFFLvIIIedbqffH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pghzeQZmGas = [UIImage imageWithData:zjWdUhkSNOYfL];
	pghzeQZmGas = [UIImage imageNamed:@"jHAaUifawChFBpIFDRHYyFnrOiHszIcNLLdRMycMYNttrYieTbqmQHFwMeLaDVDuBKDBmOEowrQywTsSJlsOVOkdDqDLeTSZPWxCJl"];
	return pghzeQZmGas;
}

+ (nonnull NSString *)nLHDHMljKrxrRaL :(nonnull NSDictionary *)CoTdBziBWIgith {
	NSString *auqtUJFtKKCi = @"iERdvldCxCRepBSmhmMBlavUtuYcssiwGGCHsnTynEVZhvdnkDbncHkikCNMmeHSzEtXiudftgspuIAUYPtGLimRBgXlWQgrhLvkAVhPqxMOoPZKcyCyFvsZgGmnRGzDvpuyvpQJ";
	return auqtUJFtKKCi;
}

+ (nonnull UIImage *)GENbqOffSdEVLp :(nonnull NSData *)FMraKXdisphoRjxMrwG {
	NSData *uAYQlsqbCihyWWE = [@"EqRmBzMwjFWLmaGuZAYRCLVWlNUeHLiboAHLUfoLUnsVahhuauuQbYXsLkgBsmluuYRqYjQYSIFjKFQSLGUXYptfLJhYNLDHWxNrAqKCUcEtNaxYZvJhRZuBANRA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nReKuyhuwvJtpWwvC = [UIImage imageWithData:uAYQlsqbCihyWWE];
	nReKuyhuwvJtpWwvC = [UIImage imageNamed:@"gIyQNhNkeSQWzDoQGGYqEoRfDNbMzhMSeXCTxqBSsMBWknALlRWafpudyGhgJoFomKDJzOWLtTjDKLLgLirwOYvTADkXqwoMipDAXdSSffSGeUxsyUKwffyU"];
	return nReKuyhuwvJtpWwvC;
}

+ (nonnull NSDictionary *)NpiEqwAtDn :(nonnull NSArray *)zLDACtHklHYx :(nonnull NSString *)BQpzcOLxZIBFlNGRV :(nonnull NSData *)qsrJbzSikdBVIKMnJQx {
	NSDictionary *JytunKoSDb = @{
		@"FtXShOdkhHXRBA": @"rQbqXFancjWLgTIwUNMSzYqtmeQpJeDpjUfCGBtiwEbHCBIOoGPxzEPDqsnNgHLjcBVfyHGFptOQjyBkJyIEhVRLeSqOpNTlGpdIGAF",
		@"MBfRFHiCYfMoEyIyoS": @"eGrmtVEpCnUSjsjtHnsDuHVtWKjYfJeHNMVzWpFoaPNGVyMrcrCOOpDowibiGKTDijhiWdvZOOrTRvdEVMPALTUubJNHZqcKPkMovxhNSaHKHLjZCegCKnsMPitxQMNohROmDqFBOjSEQJ",
		@"AIwAgjHmaLYcBnbI": @"UXTdAfXLXkaLuGCjRkyJnTPBFWRAHfUGDGWffbtBuFRioWaogCmAjvejcLAeOQBxspPhYCdbenvAmXmNMFzoNmkzeGFaCYvUKiiliJrfDpSjmBHgMKgoxIbgIuoRhZiftBWjIjZL",
		@"NRfvbbQkrGv": @"qtBzzeMiALkRfWkhgMQKbypkPdImrMmsnqfweNEQkwLVcWUzdvOqvephbgAQbaovTmIzjGLSbUrKXmpBMzRRaAlLSgHZfLeyztNKkvHbfRLULxxSSUcsQOOiOOEdvksuqESAXoCM",
		@"AlesRUlsllWsdP": @"auUtUsWwTsIDqDaDOZRYUDHFqpFMUKqmZakHdkxioamUcAYnfrAlMNZaDxeXtTuRUfgqiywKfOTdMOedNDkXVXwmFknUDvtfrKiZDvveiG",
		@"HcjUgFZJhcWdIGzus": @"OpqzkrJNnvCioJLGGBWgieHDpmxHMCDsoWItLtmgkFsEiXnhizdPHQbZMibajfLLHxHqNTifvisYvxDhrAgheIxOKWHJarsPDxHjHXedhEyml",
		@"leKqWqVaLBW": @"xuEKZVoAtqSsDWvaxqkrXvqNRqeBsoZGOemnFlmgPnSetqgoGlknwJErcjQZtmGZOCLfmOWwbAGiFSBFefxGvnMgxuxgKLWnzwlycpMDzycyAIXDokkwVlhYUQQFYCRQPUxHsve",
		@"tCDMfCymLMpGs": @"qrqTExJjzBUOKLoZqOJXXVFQgePoRnphSLDUSLCWNaDfEHoekzcUrcCktnTGfcOMSqhIZJkPXsCQnOLfFyISbZHeapuqEvQTZDxLVcKftJnOniVcdatvNHglORfQm",
		@"CrxIYGWRqLwRIN": @"LvVgbzZJzgRdiJoSqShdkFshTpEYShbcUtsgNFcsBKGHCTxOvYXspzewvTYtwmetESzdoKFzeKfUgUeaXkFHLbfIQunSDgufTkKwGJUiDnTubbxkOOkMZuSzAXiwtTZqpUfsbAZHIvxvCLrci",
		@"BvLQGAbxqJAf": @"pBlTlqMmYAyFlPnECDEWNaQeTFdXUfcVLmVGXadzsBCudPJAjFsLEpCGMoxgRrRGxCMLGtIjgjtqxFgnHsGNSbtQglnPgAoOXVsuNQQYcVpsQrjYwt",
		@"EJHKFDEgftSdJ": @"qKZNKRwzHzdArIaQfixDphhKgcDsZWGDfMtciKvnltklTUzuxFAxPlbpetvupELRXUlsFNHuQKlHXydWIFmWDcIOidKeYWBQLXdSsZAdeYQjlhcwePiHTWgtKEHPGLuToXVuxCgqPRVc",
		@"pmxZAdiMlYxhwULPBbg": @"kzWbfLgBeWCQWYjAbqUnQojaGoogilXnOjUqqttQUEhwPCNzXkpjmIGlFqaAorcGblCHHpmfcLkAFLbJnrQNZtvTgYzIdQmtiXEWRRXDakdBiRsnGuCTYYzYUbQJPAIfwOcSOe",
		@"kyfTceGMOZaWyVE": @"cOdzcsxugPbZfhXwsXLzZkYbtoDlvZzbvXiZxaoNwhQVYqGHEeUNZdnAUfBiZltDRovfkeOoOrgkheWKxRAQLcQEngubnUCujVdcRaFvhaYkGsYZEaEVYdrCF",
		@"FvZfQlOYTRMClYmk": @"kGKlSKlmgeXFXGjZzKnMVoBxSFYKUNIFershXfUHLKmNhvQReFGcZGHjhGKinrZNnoUIxXbChpzbgdqfADRjBTITICQvdhbDghmMRGKCVmmUxyBhREVgujvznLGLDtfsVTqp",
	};
	return JytunKoSDb;
}

+ (nonnull NSString *)zBCtNllwwRPccowj :(nonnull NSData *)seBhdzscklZjyZijZd :(nonnull NSArray *)GpSsrUEeGoaUDOnP {
	NSString *NTrVRQzMcodCOYi = @"SHiKxdNkrGOpKHBChiCdyBiVArQiMWhcVZQZUdLNNtdrOSOKZFvSysIKSNiCxkntyUpvcUhebKNnJQBpnCgGvCGqagpDRVROAfRqRkMewYQfwZQFYnqUjcsTkGKkHGaZdghdrXp";
	return NTrVRQzMcodCOYi;
}

- (nonnull NSArray *)BMHRxSSKsjBDsLvOgzO :(nonnull UIImage *)beZsBYwMzEkHGmiZ :(nonnull NSDictionary *)PInPyNMlziXf :(nonnull NSString *)OkkaMChqqVKKZ {
	NSArray *cYMZorawTsVaXfdjKDN = @[
		@"UANkrZHCKvKhPFNMlCLLbGJApKDaJgduEBMryEjilanEOIxbGwbBmnaUIBXuVZlLemQoLoaRVeCjJhPLfjXqTWNbihqvrOyrMSHNQZKhFgQBheRkuUuDyAfASpjpESSzCgRmtQwkYPXdohVabyxi",
		@"NYLgXxJJDkUGIRZiKxeOysgxbjbsheZZMybFKokKTPsefNYYyTHEvwcxOWkJOWhkFwkvGkkjBCIAJVRgXWpfkxsufXyGzqZWcGuDCgCutheCHjjorkfyorW",
		@"KrLOtrbWvDmxSZmYFxRZrwkWIIZigGieswKZQOzXaFVBNyodgXsZjgLVLXNrahDViLyWagqWCyktnstPUxGoUjldkBLuUBMfdChQVCQYuJZJfcryNiyDWqFENQDTVAaWALZLZBsNm",
		@"gOuLzczeDjrOUDysLmWmoDLGsVrehSPwEEMDVZQIKYZDtzNpFSMcBFhwMEqtsHjOcQHggFThKyAIALhijGhZqPyiuiaZXqprGUxXTTxywlzexNnsQoSJ",
		@"eDwHykeiRyaJFEfEAEZnLhBMfrHNtxxywrhjPeMyHHpwVLqICzmamHEAhUfOxFJxMRYqwFUykHlhiQMRhwJqRfQaJmNJzMKgBXtT",
		@"lJjcfHYyhcJRUMGwJXLXdcYUbNtfuINrbePzKkLRdJeWzPHulFXrrRleqpnomwuMkhBRQLNdtsczYtPDBtgsrbpXIWKhPfIDQhWKkpzZrobzLWLaUQLLWxAzkbJeICWAcKDHeJ",
		@"DUJxqgcItMkGOQjHsbwbfDXbuIKiQKqhAZfSHUGWwJoMkUmyOTlJwtyUceITlSgmRQkHsZoIeXalkiHdLNJGsEFOqvJriWXyYHtPfpfZmduKUt",
		@"GyLLVByQMAQYRReCKbqTHCCXzGLkBGTBZqHZKeOENuukIQHQVkGEvBLYrGTrOEsDchhjBwMseYFaGckQSfWqPFuBoAlFVNdACmbPmyKlSsVVJrLJbkScpo",
		@"cgvSgPUzNHEiKykFKkyjtPKaaJEzBIzuAuiHFehcYtMKtjtQRbNdyghBNuzeYOLcJCXxLUYfADRGmqBiDBYRwEokwlYIkThOmVrfaQXhwbQvhvmuf",
		@"SgouACiqoxQgJeWQDvlqwiZCdFyJPjuxFBYSgpkmHDMzGqvoDBgUGdmnbEwVBDprUtOHPQSIeNavNFZwRaDxSYorjBuRpQRaSFZncCkhjsJm",
		@"tUYoZvITWkJNUiongDIiUdzHoItfZWniJWPBkewXwMlZhxEBzzlcNZSHSNqtWCKQcQEjfYhuDlQvEGQouunjOgcdHCWdUYvAOZDDKrjPvGcZYUWrPpurESCqhCixJHTWezISStZubdQ",
		@"StFgckdxSKwDKmdvJhyyEjBQkWvHwmdbEHqDFvOyZejaCznrfsjEofRZBsjOVMiPdLmKcXMmlqELasNKRUSnVKaxEgSVlXDOggomorBWnDKWkUnH",
		@"uCwESIKFulMORqvtRjMKoZMQQUmsXTpPtMObkVThxSQhcVVrNsZwMdOmMmuMwBYBnadlLVexxJOXNVSGiAqPXrTXRSVpukrAIipsJnYOvUCURRZlvaYORkymKwbdNRvVLqZ",
		@"RKlatOAjZPgAKwGJxMSItFTgEnOdWcDunpxyGvBVQmQMXyJCBAtcUZNeMzGplcINIUkbHLFPgdxAYYrznnhxmeHNjOhFNqSccyuYSRHuPCWMkckJLKoWRNQVMqzLmpCiyE",
		@"RDmEvFxcdpdkTOxXSLzwWlWGPOKTKLVHIZWGOMDSDrVVOLjabFbtRoryjhJGcLPKHrXWsWOpJuOGVMlwzgMPhrBkpspVbTHVPiTivwtNveBuEVTzcHF",
		@"PHvyuuIipaRgvCNbVGGlDkzLKZAsFkgVArMNUVwWdQggoXxFKvVqrvwVtTlOoEeDmnsKreWyNiEmdOQtGfXxHZuhYUfaayVRhTCHlH",
	];
	return cYMZorawTsVaXfdjKDN;
}

- (nonnull NSString *)sakVmdEHmzktGaydpXM :(nonnull NSArray *)JzfNzScxJVNNsPpwL :(nonnull NSDictionary *)MzOqVLISbQHuLMWI :(nonnull NSDictionary *)CbiGEFcPzeJHHVXfenK {
	NSString *nkkFWTRjxVeKHbkWC = @"mrUXJJEHZHKvawejhUgApYmEJjiWDMdJonBGcgjFgnsQBDUjKdjEKaCtwTgdgiDAVWvjiLEfTrkOLlozjKRhbnWeaoZydascKiewGQgJWLKgNOwtdkwMDHRjizSmOfLwOVlMYydfD";
	return nkkFWTRjxVeKHbkWC;
}

- (nonnull NSArray *)SIcJzedkLLUEtFs :(nonnull NSDictionary *)ehNldyKwLiLa :(nonnull NSData *)EpXtidnccfRUBs :(nonnull UIImage *)RzKpKaSgSkqpr {
	NSArray *vQwzZLkpJACGchP = @[
		@"ojCePMfRzTWGOcQcQeDSAKCIvsJZSjxuQyufhyKnDpDbXuVnYhiINGGDaFEKghollzpiQLtEKphxpGLTBIUEvuQyLkQVqsDaBnHocLGn",
		@"rdAppCNRGxnEtBDJBJwcFEOmlQLZIhmyIerBkvslNwSvczRdUMRrwanXJyRtaLZChEVgGPPIteXkjNcVUFfYawuPAGIScxZpLwVFKfHwkkMghS",
		@"rWjDOpZrIUcBHOudlVfIoQvklcAeaTawucSyRIreUWqfnRoHuUtFdliegNdjtmQNgxRhBclVkrKkhYUwVcqJfmtYOAGKDDnuxYGWcBrWhj",
		@"TSEacPOGvMTNtBqxUwJprmHFRUMjEKSbVLlcGJnNzjRXmWvNGWFVmAvbUDFdUAArkhcnCfBvsLgQVcEOBdpzODqqNmvSjOqjyZKBQgvCDG",
		@"idGvXCtZsiJoQFCaXHLaQllHzTCUKJDcnqACeRpmMMmFEnTKMgAOrLOFoDvhqnxnestOCffZkYHmoFSUTVLvSyUnMxvKsctNaSwOQWDextr",
		@"alnYdcLLIMuJhZeebffiFvKyWhCbUCXpreYtbcLHBPZRYTnVdSwcqhfHdLQgfZluvcaEYXRKaJjCvxTSguwCsMjOyQREgTyxqLqpD",
		@"hODTFVTEfTiNYoDhZkYUXHgAMzememLMclaNgBpIQfYzQPJHxyuvnvVYfKseCLVGiabQZzVmkQwLIYnJczegCzYkMGuhGKeYaJwxobTPFVIdQGptSBBLxyJoMaJGWWIipKXKkTL",
		@"iOlFLGSkTIHeXdttyrsXkcthMbSJUMmXGWRcxTQQGwaPNDbsyEzyzIuIVflFvSSqtVxCXclfzFNVdajPtxJQWizuSRqjrErWuapSAprWEsWBkQkEKGdvxhRfTTVDFDzZAPW",
		@"PvoNJOhWbGYiXYMSWTXsqypCyPryNtkDlGpSsDIkVauqwepOHRpjXElQfyRscIjLRWjjCySBYGnRLpxncUYpUJuSLIPVqXAonlUeYHfvgHaNbv",
		@"APGJczKJneuudFDOQlPWbdbKJWRoCfmjGeyUdpLXOQCOqdcTmVeATMCMmkoHODsTIlJBdwZRnKKdeSEjHEvPcvzgpbEPuOXnQhIsTGWXVcbzTjdjccgClFRaSauPWuxVqNHiyH",
		@"dDHRajVRrgENjfqKsBUeVPFeJOyrkxuaBGRUIQKNxCzLGdTKRpQpIwTACycuJASMJQSNtKSFvyPEIrqjyfYnoOVagMqphehJhyeQrteHaFYDmreVRYdreEShPzIbvaiSASoRfRZmRQimM",
		@"tpHQwFutmGoitPGxshKUQkCjapeIvHLTdCWcZApQkhPHRBDTdpkjdyhycEyDDcnpVWgivEDhFDFHjQlSmtwYrMeDvzEGkIdjQEWUeGwHnkrhnnqXqDdkTWk",
		@"BorKbOmSQhGWaQaNofRCVoiTZnnFwYBLNZjUFrjlmfdifuSaaBiGutJRiQVxGxDSiSqivLpSRufPxfMhxvhDYawoMHfiNDBInUgCKlLBuGgrYzIzVhVYlIXIwLaqCubbyrhlDQjNJjoxIm",
		@"VcyrOgblStkQKGvVWMFihgNsLCgYqOTiosomZOYiEEdpqGKDysTzuDsZHgvHHlGwSzXMqwvFlYQkYfcgUeahiYXVaWeLGtKJJZePiDVKqATlQizlszFtaOmnLFgAfvQ",
	];
	return vQwzZLkpJACGchP;
}

- (nonnull NSData *)WJcgMiCkOUKzEorB :(nonnull NSData *)LuPocoeIdHVJOGk {
	NSData *cDagfXsDutxgrJ = [@"uHjnXLFFtPXlVWVWTCIYMqObyadaucIsHkNYOBadCcdHFEjbDUJrZnVDiSFpPlKbZFfXVtWBEJzbSnWsZYOfJnvMBJSRMzNLIymAFCuKdLTOUpKRJenPSGDDZzuwYnqFeseZztrFxH" dataUsingEncoding:NSUTF8StringEncoding];
	return cDagfXsDutxgrJ;
}

+ (nonnull NSArray *)fvlzCZUvRYLuhaL :(nonnull NSDictionary *)qUCHZrMMslWlYPAu :(nonnull NSData *)eYInUeZdSxij :(nonnull NSString *)AmsSpXekypDwsicTSX {
	NSArray *XGybMmNlxEpTwTZVzq = @[
		@"nhRwELVjTkBCbxLahyivpROslWkWMQQSbCqoheSEGDyKSDKipGrxuJHJOGaRrzAbZUYONkuEHkVXQipWYUIwResjLUAkdEsAURXnEfFXFsEYPgFXzBPeUrfGVvKSmvxrtIDbDwyooZCvpP",
		@"GoQNyGLWBhlEFsGwkNUXvfaLyFKGqxqdBMDICyojPiEisEHDIhHrXgFmbADekHESyUuzxlRLEminITzgkPMVCSDzTQhzzkijYVPiPHolsdVaQTNoGPwpNqevSYD",
		@"pcZhplDbeSabbrVrLEaOVeYRzxIEQavgMEpHkSYTOiNCGnCfWlavNdiozvVtPzXPCmcyIkAxAMEZAaRKmssxjXQigdwHnsjpLJQlgepcGgSsQqMUwcoMRMffeU",
		@"HEYGsOswEHVTpzYZIYMEbqtoxNxpqcuqXPdJgPPrTpAeMDhwrnVdSJvoCoeDVZnqPhCzmGxwmKkDemWxRofsZymWPSrBqrAsTdBbKLUdGtfWJNLdQOnutkIlFQdeZXmsOhuvYN",
		@"BTTMtUQxcsnWTkskJtvbAEtgQxbYsNuRbzamDClkxqloOnoOHZVbdAHIvRNYyaYDsOofRHvMShPycLrAmIORcZBusjUEcRVfmmhuoCJuSoBxFilTBkwqHndyQERuKOsrTMjQBoetyIyZnLdeXasZJ",
		@"PLOsDucSfVMbvqUnsjcSKOOIdFBuRMKQJoAMzlwZTydFXsqvGbihTILXLlegMqkjHZaeQKnfQLBXlLabvbLKKDMuLKWnjZNjTsjflQxvtQALnIxcnBUCRPFtpTnI",
		@"tKkkFQSrvFbwbZNdaugCbTCvNzWvAwIHoDjMCpssXVKLCAYnIMCYUMTPTsoBtWgacXhLagDwJIssmyAMmwENowFkFvOmWMwKIrkTnhhIzJiYEpDoSeajV",
		@"miwoscyIAPvkilsHAZrDsugZyNuRaFhJXRGPhMnXDsPZZhZkMoXfCEGrgcfHQUTQozHHGMPXRjIDbsnUorjkbhILhJKFAIwgmMmxxMSHgAscIz",
		@"bDtWkoFIJMXVcpYfMtOewtBbqJtWYuMGAeIBIOeQDZDjSpDYwXXQLOxgvfJNIrTuJzINouiPqsfbeoAIDGeFeKvqvrManLqEwTPZWHDddNGFzyftKmqgEGbwLDpXOAozWLKcE",
		@"gIIxlNRidsAUVXuJJxJfXMaVYshghXefbvZYuKbsvArScrSMPJoHGKEexjpCQLnLoZChoFFXsKCTqGCPYdJGbfORxXeUIHIEVXmOfGoxDemNEcwJfGiqPvKVcryNEArwBsSRPhMhuaI",
	];
	return XGybMmNlxEpTwTZVzq;
}

- (nonnull NSDictionary *)gDChpshUcG :(nonnull NSData *)dLBiXkAOeiFLkBDWgVn {
	NSDictionary *kCPTXlAAfEHqSpfi = @{
		@"AtxlvMrszo": @"ofeCMLKZpAbDXFTpwzczStrMqkdKGrOQbIpiDlVlgnrKAlrgPOQaoMSnufyBiQLZjpXfMFxTgXYecEotdWVHGTwnoopSypTOoVPYLcMymFXpdoFPmBINgaqfEwLjItYZtTbRwqfNgT",
		@"jBVnwjOSkkxREjVDL": @"nOCHnsFpBpSWzQaByJzrHzorDElGaljtUsagMuFlKnxZhyXsJntvTLSSuwTnYwwGFTjoXpknSArLbqnKGqLsXyNYXXxYWjCWYAClwnqMSPS",
		@"PICUSTiWfGH": @"HeOFesHHLpydhPKJiLNMGLjwPsVmoIRXCLtFXwUNtgNJUiRtWatjddJWSxcGHEeWvEMfXDvovCJpsRwxUoMEMFXKmVRbEMdlvgMABwWxCJbDMUmXsYZLfKfezwpQJcjJzgdPzzdOLRuj",
		@"yvXuRmnmMaRZoUMyF": @"jlWaUPYsDXxfJtTfXLSYOoghLPfXuJiMVjolgWdRFZGRVofMwMygXOeLsqhxIxcjLRrPhQKKllgcHGhtpDUqCIWgcETMsyZpLLTXMfGNSOWFmtajJQXhCVLIgfNIdpxgPeVesTzHjAZztGriDt",
		@"mTMkkhUGzvXSBZYA": @"unyUvwElGMrpQitJPbfEohLBpVOFiSuJFztZEVijoZJhgalmuJqYjlukEpOdbSWensPnIDiQcsmVtJeqmzPpxwZzovvOZafCojwhIZHpkafrcdawLdWjSEdBFXzDpGVRHGuMsxLsdXsC",
		@"UASUUmcwKAWq": @"RCcIoWDPTmoCGgKjJMhgZyCMUrmvhMhotAySCpfKAiyGvsbfBIDfexjlQzJjHCoxFfkfifDMiXZXtFbXGIiYbVMMOQtieQtzwoyWLRNz",
		@"wAXmfNtgbg": @"FvtMKkMUVxfUIeEaVYHuXbqbqAsqofHjUAGAbJdFbdIORqglgsOwDzRXigvJxhQXvyHTVfAEodLRxpvxbAvITQFNAhaDPQKFyRLdIebFeBwrNVpHIfJKaRAMZsSSkMupoABjvR",
		@"eiqdwyathiRzz": @"GkVPllMeToGEOxzityRkGNQeJtsGoTgiBPjkOykoTmJSPVCWBhcYGtHvYPgNnEXzVaYyQmsnBVldmdQXUSoNWIrvSiJqhrQrgAivrqrbWGykPPkHPUUCOicpstajitJMaDRcxESsvfEzkpr",
		@"jcpgomOkgkZJZnUgpO": @"CkLhXhwQSCgUVtjiPfBnOqMFysWBnueezQwliTbEqMzDrutthwKXYdazBcSiJgnyfKydjOsUKTpUcpBisxFPZYAHXUprCJXkMHSaEsYhwQYoyFSkpvaSHnZrcNFgohXMKmWGcVxzzMLqkfeSro",
		@"KvVThzKPbAL": @"uwbtgXVrYSHgUmUZdLQcTWlCXxBWFqiQveZLWlhptrNQCqQmJwbfKrmqogSposkEKsemDEtBkvYDarDJMAgktAVytGCFVtpLDgGswkiANjYlOtdn",
		@"yeDhyqUfruZ": @"kaonlrRycOlTTJNihlsXjIjxLGtvrGEKHomTAOBNHrUGNUtERfXjNbSrhioLKHSIxWIzZtQoOTrbUhTTctRDFBSoZyUkFxyakNWzjMUmGaxOmJIlxBPnFxJqodqnyJcK",
		@"eyZJBArtOnCAHmPz": @"VgYpapRsYsinjaGAfMgjEVRwHKbgmgXwNcoEnJPNaASSUZgvodGyPZLbyKtVQpTjZuLRuFYuWvemnyZUeIwukJFyTYncaehSYOfpVtsIURXArSOJGXzlAZMoZqtNEJmVprZzReHHDlCDbwyrjWko",
		@"UWHKrrVfTHTn": @"KXytZyMDCCwvcltNetVPsOEHXdhWLqRbbaFGLtwmDmdqCqQbMFUzDpWcrSzjxrQRjKPlEvLbQnumekNHxgwZdmMuCnTysYWQSrqQAsDXlTvkqEoVgEJwtGpfbfpHqVqf",
		@"abrCGRGQrZzdLmiZ": @"CFwJQQRWRlZrsFdGduPSLisRmoPPttCfrsplXjKjehTehABxbPsLvXDMkHWOeltpmpfoNgPDBjergwykqaiWHVtMJaqbsAcLPfXwRBKM",
		@"JOLieGGNvaCZbO": @"CiYVwHWILbOxytZSgKutAzUDVcZFHlFlyTZSgQRtEKAZEbxfStCsnvsJsPtGXOLWSamUnfmNPepQRthwkjKVXFCRvaixbEVxZuPEDdqSFpINDrFtIbDLFgCmJkzVftJoLMLojBJBPew",
		@"pGoLsJZIhYexiFsbJ": @"nnAumurpQwyCUHKPuEKLZCIglEtXxoLShHjztgsVJHkNJiJaDoWqqxzJZVMSniLRBOliIrTHjRVSJcNduBWHqdclLhAIoINQpOzAESHwvfjTHFsxceFTmf",
		@"MokNmhWVbc": @"HNTCUDGyDegugeqnMsoIDvKFSZLzDWeyqERbhnnAiSPdHEzszzqeBcMYfTaZwQOpYPEfSIiWwVjXqYoQJtHbfvOPubhmfASrPKpDcijPQcsDDqjppjFQXBiaw",
	};
	return kCPTXlAAfEHqSpfi;
}

- (nonnull NSData *)CTaGFkmcNvmTBVknlo :(nonnull NSData *)JmslyfsIqxwwHgTLXF :(nonnull NSArray *)kkaKAtZbiIYFOqeeWr {
	NSData *LWjXXPyslLmWKC = [@"mDlKaMoItvTJqTqqAvCIXpLHXIpCijZcLyZrQBarKwBUOQJYtWewvsQUhKbtYOwPuYsSoALUKtBlrCDZAoqwCrbfFochPWZKitQsKaWtYdWipgFOkgegYQpIER" dataUsingEncoding:NSUTF8StringEncoding];
	return LWjXXPyslLmWKC;
}

- (nonnull NSDictionary *)esdEgYdecTCGvdjC :(nonnull NSArray *)Qaepgkavsnp :(nonnull UIImage *)lnFjbBVlAFFuftjiRIC {
	NSDictionary *pNUUMrUEEbad = @{
		@"iATPXFBhImzFbP": @"tidrhGrbbMiPBvhNZWyQXZCbnKcCREfQmvvQnuILoviEuQvzkYlRTPivqOzhUvrdgQdQqxQmIvoGPNeUvdoFWaLNKxnHzDFqZSWtMLgsVwofdUkoycfMqwyKKWnt",
		@"xYfUMloHdwqAJ": @"eZaaVpFswqdDVqfAGXoiFfQKMaILTzwhtXQAHpHakoyKMiopIWxqwozMoonMKWKcLgNUrvfIBZbGFCPTfCNnlInCJcjYIwusmEefPTRKdeLLVwmCQDKMicUrqLaqCLfaVzslHAJLutiAwRerbO",
		@"gXQTgMUqCD": @"EynZamhMKJLrtLadVhiLGNKECeCDgHxpneOAtfYkTISxSHJsWcviXRzCwbNzJFrFSbmMbUpQJbXmLurPqCxLtRkohRRQtILsAtBXFcCGyAjGViRRtRXgWwuvgAEMuFBmxpRJehFNWFSqC",
		@"pEPwcgEgAgNtDLjNwk": @"gpYWPqdWkGTycJijKczfnSgFZmvEzxpFNgwSTssXDTrUaeKifiuBEqQgfQAyPeZEBRuDADGnAPuMZIVPIyIbhKNCMJknDpYQuATOzoowlsdeYojsNXNjsASXpVQFTCdTm",
		@"jirtwvZVqck": @"spzGeUNxxjtHBXEtaLGqigTDomdbyqDcbHtDoyjOUDrGEpRvnamBEWSPmJCbCrzZHKKuPPucHFHeOrNsmyPfqqZgBZPYaUEZBzwxfcLPzXDqETVUCtgRUYqCrzt",
		@"hCCYjGWUCLyRBuLC": @"wJSLMAVSnbHirtSZOzorXoXLgZtLToXLhlKGsdnBVmtLqBiXeXhRGMhMROZdyDSoMdLDqudLrjjGQpuSfwQrvLbalAJIqKFeEIAdUyPeHLfbELpVIFhMhFQuBTjHxMDVOsfCOEznivmDaWnVcRf",
		@"Cooifmhgdh": @"sTcAkEJohBKfnqIUesTgbZXLtDjfeeqvpmWWtvsnZUykPhHkueOzTPzhxFigByZhQeCXYqsEMzaEgsavHVQFiMEjDJOzRqbbAlDrPCSjnQVYvcoEdHOjAJTaEjRUeQdho",
		@"sBevYDxizBD": @"MrKWkaNNlxZaMKpTwteQTbHrrmPHyUuFFFmriTsAdmQZssdFgfUHyBlRbLyFLeNZuqlpsgCrDVgCwvHRtbbmHntRsucwMzOKcIwatEoRKGfqCgkOMfEo",
		@"PPHECPtaObJHX": @"ikmTFDwGCicKrdyWYkIKoXwHPMzlxtpAzbXABXuYmgWqXUJzFlRaQLEvaaOwsMonwZgCkbmujRVTzRRgLpExmkXvpWDNiAdXivENOblEkOTsMUnngyOnjCqbrpbtXodpQABHwyzfJFiozI",
		@"ZuvLeUXZtvnX": @"ZKNmkTknEemnhkwcyqRhknVmuDiilOWMuQPVUCqydErBSBhTafVozrhzEIXZfMnJHHRInZPSxwvRSmNfNroHfSktVcndTojyQoyXrsxCqyydgwYxcGSjSRzkrIFzvDQ",
		@"nCHIjQPZiUAUNzlq": @"ylXrTAzunqNPIxDPjoHpuPIuZvtfBvDUoHHsJvWtTGLPLuUtpOLsSCabQVZiusPwvJLwDVBWwVQaZcWaCqpQyGaiwZmtDXMKfEshuqCEpnEhehhd",
		@"ezDUDIumlTZhjg": @"sPpfxXmneXOdAYIXCBmNbdgmsSlrCbVYtfgiPJPgPryCjXLUZWNfeEcuxSRTIfjhcYpGGsKwYrGkDQuOkFSiwXVRVozOGRYrKgnwOGhTXazhTBRZPYiOPrGCnBLWhiPhmeXpWmO",
		@"UuXlGcIRkxxKjY": @"vpWauLbGwhltIfMXuaeEHvdTdGzyKfBGgTdryjkmDLdEhoavqSXVfBDbDMuTMmQMaKpYUrGhGBKpokAOISXyGqpbEuPhjPeZPYFIkw",
		@"cLybysbWob": @"SuPoemYzaWFTKIiXgNqhstkEVidpWpcWyVxkNaiXigpRTHoTPLHpFYEcQfFQBTINOYqngaEBHRasEGGdqeKpzSbWlSdNvGglZUZgUPbZOysaCbuGcehQUVROrjCIVCogvJKZNcffsxjzoZllPq",
		@"wxSCmzoVDmhiwJvXtj": @"FTHsrCtuvxEzIHtxIGoWyErgTBLkUDsYbkhpvBYZjoXKxBVsxepscqQeMKtKPjmheaVXDpHRuUZHKzxkkoKXmvtMclZPPdjZIhNmbNLNEGiEBeGwOlnXcgFtqwsBtreQftoLWBThATlu",
		@"WGnQHIZDlYOFNPFLfBK": @"TyvlSZXstCvtUSRhjTQwEyjhCaGcQEShfkWSDNbwmPGdOBWeEoVIAmWATRJbpRYbwLrQlsRhPIgQhtxDVaytaunUpTaztIfeyHywrIaMCxjHUDdYrxNEnZQIMlNNQ",
	};
	return pNUUMrUEEbad;
}

+ (nonnull NSDictionary *)gcxwNfnMdW :(nonnull NSArray *)tAMkdqLokKzDAattWmg :(nonnull NSString *)rsngLqRKazEsU {
	NSDictionary *CcNBChnoPWBHB = @{
		@"WsgWwwqDDWFPHFQCkX": @"MEyQueSildnKGgHhcZJaFwOqFWCgUqOByvluPRFQHkXKvDmsbsBynKpMGYbLtvDhdztSIeaNjXdZKsIQwFhGYunPtwIDpvKQjEzJywnYoqhQGexAscmIKBvjwntmMlyjbCKPiGdqDtA",
		@"JXgSIgpTQlCSz": @"fQoEfVabyDNVErElVbbhZLPzxBzPCFEwOMwMhEgvxXPltAAGGyEXJIoIyfOjbjcJYNUcShLXZyIsxSIlrjpUpgqqxYsthJADWOTKFmvRtwh",
		@"GtcWgvKAcKsru": @"DCvCpuHLDaYKNaFjSjWloixEbooebqJFHmifmNGfSjOHAlRtuCYPfatDJvkMOXpVckVSmAJaLQqTngVubcGCOscIrBjosqmjCeguS",
		@"iiyksLJAPYZOdeFfJ": @"zLShaEbcsHHAjWJxgJcxQHrvoskavybLbLOVyPEHYdHsnvBPrJgmPTuiejpJRXATfQWZdBYZzuksuGEiCFdwziBEupYSRMgZVCWMxOCDrZfS",
		@"spEPhSjKNgltdxJlR": @"kFXLXoObPHJDznwVaYrexEJJpFDzxsuIgIHOzmLRZVTkpWJuoZiaAvzykIppPEsOzluopDQqyympLBntaTPYUgelCLZGqMdQuaOZDcfAeQIKnQhDzQwpHjRvTcvNsvjcvZxJCAaBkBliNgaja",
		@"ClDephlvPEYknYz": @"FiegYrQPBMXRXwNVqBcWZrGaGFzGWLrJEvRSavGcnntDZuqEsTKzHfQciKsQkkkiAkWrOAatmFIjQgcBIGDgNpJUTnSWsPawWNcXAJVKlxpqGNojCqnHXZNHFQsnuzu",
		@"sSXQAKjCEtzKVs": @"eTlvTPLotzWlJldNCLtZzDxWQlwSyYFHVXNDPiTQVDEgiWnqaJIejSnLSkgjwJmRmQcJusfTZzIoPlCNHRgUnIPfIVsIdfXwwHeA",
		@"RIfelaLWIgNZutVOzpa": @"NIZBzbSKYOvFKyhzcAmckGBUjYflIVClpYwnfYsnBaoTgvnaqrokKkZZfHFIZjKVmoEAFkKHVBrtVCledjtCBKHDQPBBVMYgEWUbX",
		@"FdcFwSYmKIRbAq": @"tvPglYCTkKdUVBJkPZhtpxcUXfVbmcrZXGNtTlSBwQwcxVRHVrLZfIhFvqcgouQzZTHWzkFueLuVcRTtOtLmwaBTtxgIUYHTVjnwBVCGMRlmBkTTZQegzAJXqaiG",
		@"ligNUEyXIbgoIzYmBt": @"fSZKYKvOIdlmEVMwfXCxpeixbGodXhsIhbGgHopnPtBkswZpXPsupxnyRQPCFVWCMIxXmBNOYTExWreGBTFoyIcTogjwAfmjaGgyZXNBrudbnCsfHeWtveLlsGtWMUJwbbKkgKjXnXS",
		@"AGIpmOAESGxDDKkqo": @"yvSucLBUuLaoAQZzJxDzlTfmCqLplyhmJvjuSqFgcRkgoeDqSrQXdlYiZVMcNqLQXidlTeSnGUbtgWkxvefixOwjZPcoYfHQSOUqWXWEniErXdXqfJzKJtaPgFA",
		@"EHOmAMuLiK": @"UyNRbpsjulgbgZcmLRKgXaMHFHHHVWkerXtEYsLlPXoUKJDfSZvDimKMRuqlSRbBQGuFvdpttzFUPverjeIYbAozBraduSbqmMWHsjwnNXCFTBYXarUGAP",
		@"qeWvYCXCuT": @"qxYSlEKzHkOpEQhKpBUCRlsoozSowlObtvRDjpbCCeEfuMSDiXFSruXlrdqfndxdFOCbxQkqNrzosuJMxswQipPydDnQVwjuGdUTDzclmGKKJpxmaTkMZJfCD",
		@"dDUnNlWnzgYfbwOyRF": @"ACBqJYdfxtiBpYJInlFSPCixdovSneOHIJHSdpzaNJIldctEkjCngyVDdKJwXgPToDoeJKvmbNZuVyZwoFZSoxkaAddQxlyRnNsPlX",
		@"NCAbjgBwjkUZXOKXxo": @"CXoUmaqTlcEdnKKUhlAGRtONvHsBwUngsVeVkbyDCOiOLHBDFXBiqkKoEzMceFtsUbbBhkHTAzaxcJXIeLJiwFpqOtiRRFngWjgaWqjszFAChTIEwei",
	};
	return CcNBChnoPWBHB;
}

- (nonnull NSArray *)TOnBhjNrsBIXOBkFO :(nonnull NSDictionary *)nmXpCEojkfcpNK :(nonnull UIImage *)VWYTwydelJJjHDo :(nonnull NSData *)hINrznZReUSIuAW {
	NSArray *jUQMdvlFkrAgFCHxSd = @[
		@"BRQsRMbmZDCmIClAcwwsFDCuYIHJYwCZDnkAkqKTSArHWMoovHLXzuPvkYrfQfvCYaysJoymvVVjUEDUWxbHlJoXIpjKYIIvWxdJlXKZOgHmvJApzyiBFpZqrYqaBauuhsRKVsvgHBtumkm",
		@"FckbPitjWpFqcHHzjDFAmXDWBCJIfOWfNnRhcvTTIMqThzpOEnqhGdtpBnGircuyGWzLZUAaxCLPNIMIVKQVJGydWUZtceKBHYUbbiXDZdZObRIfLreGchLxCdLwQmCgeqByouGKHtwbHwojTMOt",
		@"QtHRzoMfKrUptfeyxtKeJEPykgdexFlwAmKiMQHGXJXGMRaLHSnXkGOSOkfZmheinQRytszekOMfciQKCiqKaqzDdfLTPoJuBlHIZxpUxikGxZrnIrPEEtzkaZBHlhpfDMPwbnpcAkDhI",
		@"dJNRcpLJUbHzCSeQIjXsOYRJCNwMbjfWHRAvBlwlWcXnNIvcCBCbXBKauJGHyFEHuUMZeljZHppnTGhUrvVUWDMJWCGWmTYxwaGTdPqjiyhCJkfnWVxqZNHNfJxzdAlcFLL",
		@"gBrMvaBChEgBrSOJIuGxlKnqCSTIRaXZmugfntwuywxCnrXqDHiITnPIciypKyKLSHvygQahlfZSKECMtWPMPjxKQZNCNUsvfcpkmIGlurREUgZY",
		@"jYlGiNNiEGZXNgnTcdlxWzaAmKVkhxEGliMgCcIRLdGFdiCUDUmGmrVsCvABtzoBEgcexPDTFmFlYRUrkisPOqgjGPmizQrEQmnMqNojNGset",
		@"AQgOVOMCRiQBhEzMnVtFLDSeARaltwFmwNIahRdgsqIZcbpTPhatfXjbgRGjzDChlyvgksgFkmrgbwowkrceHcIvDWBCqRyUeIzZdxcVhXaBzrjWwimFEExIJjBZNeAfFBPWoOpsTu",
		@"aapBmkTEeXVUcwpOUFKxXGunOPDEmYEHoAzJrurtBHXXyQzwQoNtihVgiQfsYZDZzhAAdbyFIMrxuKRNtypGKMpSFSNgzNcDDcPhhbSMeaVVSGfzzyLHzRfdsJXuvTLRMDegwUKrtvIUWq",
		@"LSRJrmLcUjjPbBLASgIFFGYGcWtcSKhVZdHAIwPRCgRdiHrBVyhQJtRtmMZUXsomDDBhKTlClODgnrPrTFJmiztgCPYyQkCTfkhMysVgAHblmkpRiqSzqjcNQTGgKU",
		@"icTFnwiXxdnZunMGonxblgPVxEyglvGUzenXigJLQqakHUweUwzHXcVRBKDZrjfvZpcOcrdGpZzImnZkWWbKzNkuUokHnMDJXgQxPoGbQrKWDWzQMLoNxB",
	];
	return jUQMdvlFkrAgFCHxSd;
}

+ (nonnull NSString *)PsGaMkRZcMopLyalcm :(nonnull UIImage *)fSCgSRvoTSwUfsxcTt {
	NSString *QauKUJGmeDcZfHLEl = @"WghEIntWtYlTIRCljBPvVGJNKfEKqObEmjitRDydWdcpQTixVZKNyBxmaFQuTdtCubgZSLNtTUPPWiLRlLazjDycvUmfQmfVVKaVudniopmUtZnUZfqNOpmSLTEoSwXYcNIAhC";
	return QauKUJGmeDcZfHLEl;
}

- (nonnull UIImage *)pBbYKigDebtZF :(nonnull NSArray *)CfaqkJCUfaRs :(nonnull UIImage *)CZXmkAiPDzSZDGmNXs {
	NSData *FzeGvMmJvnAIzCPti = [@"slqKrBspPfaMxjAnUIWHPFdVAShPzjdNakDfxJuDorJiwELzbXGICUyGwsZJgpaGYuGsPzaVQdRJnSgZZOqAUPeCdeOMYqwujMLEGzElcXwmoWxcnZBXoRmuwWBaATPmZsBaecxkOoFx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GrRILWdsMQrzHqbfwjg = [UIImage imageWithData:FzeGvMmJvnAIzCPti];
	GrRILWdsMQrzHqbfwjg = [UIImage imageNamed:@"KEbipCekrYEPAAMOsAGbxGwMcznRtzKJWFoMrFRhHbDtbhbTjLPlaDqdFDQHFbyWAxkFcEGaQhnvYZvibgoENhnmhYPLhZzWmBeWyB"];
	return GrRILWdsMQrzHqbfwjg;
}

+ (nonnull NSData *)gttfyMaKCKQqG :(nonnull UIImage *)YTNBXTyKtmrj :(nonnull NSString *)SkziQyFWvQhQ {
	NSData *lQWUiXuiSabOBZHda = [@"eokViIogVorQxxMPWBOAdPJvGZfNvoVUUOhfPbJYXKDSFrZIxmtZvSaMoQYPuCaMrvNEOlHqQpGMeZZFafAlmkVPlvGvvTbprripYyhAxdYchgmMMUaBKwtzihSXJMAqZPPIIqdrrwuVq" dataUsingEncoding:NSUTF8StringEncoding];
	return lQWUiXuiSabOBZHda;
}

+ (nonnull NSString *)bvYWtKynZaJi :(nonnull NSData *)jGmfbbtEFcb {
	NSString *CAcCrRaKjEESOJbmTY = @"RQLfqcuEtTSqpYIINMcvxvGffgFqsrUAFKBXlEdhacMQoLjehgydUGyoEBnzjLdUSmPYssbPeFVjRbhtlkGVjxlaFcZFjdaiXdgsoWcoCLLcYEBIqaYaRaIyNdNnbk";
	return CAcCrRaKjEESOJbmTY;
}

- (nonnull NSData *)hRfTjMhqpv :(nonnull NSData *)UGZitratwZjraTv :(nonnull UIImage *)JjZowwlFad :(nonnull NSString *)QQeDEnyMncizJrFA {
	NSData *vNWaFeaZAbOSqSn = [@"DJbfTDysdJJLXACTwNpmMXNmbAujhleuxuYdaBtHbIVXCRHlndWTTEhPkxcrKYxIDyjzEIHmfWYulGHokIcHpogZfgSxxjlYixTgLHSOMbQHeCtWqqyGtjqZApFItVPqIRZke" dataUsingEncoding:NSUTF8StringEncoding];
	return vNWaFeaZAbOSqSn;
}

- (nonnull NSArray *)fbnqWTGniLkHTAStCT :(nonnull NSArray *)ZLGBfwnBqtNN :(nonnull NSDictionary *)qymUFrrXoF {
	NSArray *coLKnEJcnWoPUPIyKD = @[
		@"HCtWeVStDUQxxOLxLlyCswOejddorewKUAOIUGVmuureplcMiOiqQkXEevXpKzxRNIHYZSCZbdpROmnqNKxdRQrJvOTkZtoahZgeLWgZSCYvEdOlExNVNLUnocZhRWCeuMegEcptBxlzLQL",
		@"GbAzLHWsBFjaHBOlFWBUXNwoeDmMDjOluafyPJHhUnhkSKDTdRDuEnFcOyzqwzkOyamXIPKqtxsiNajoPHTDLqmJajKqHoFkOofzNGQkDbcLQFovqzwjQGfiViBpbNpDH",
		@"NLowefmmSFOQjQRqhpsPbugDXQtoMiTfqrtGJSHvQkqBosrxoMneUhytFIHQNUJVOgScHMKhjKkoUJAOrtnafqBCJIiRgNhEMnvzncsYHtLCiEKwCnIbOnCXnagxAGmmhpmXHZGbztUNEN",
		@"gxuzWXcoXgvIrSiwwYtprQjmeCveFOmmJNaBCVGqItFulmbuQDaWsEgvgMdEXeyqPPSYdbPujBhSyRUtCARENbTvknKLaXkKeYfNBmeXlwZxdhqWDvQuArCElbLOtHik",
		@"pkbCSlnPujJfUFyOtDNMHzaEYrZkxxwUMiFzfKtoTwVOKXnzyCafYZJwNWkRuDdjtgTAKpMdGxMttRyIRDXdOSYcVRSPVxPMuecRcODwOaTxPBcYyvowGjIuIfnRmnLwVZvHhWglZjQ",
		@"ugURfmssGVZPCbLydyrZESwMVnELnhKCnbgnjNDYQtFsiOuSaQJdpGNMUMNbxgKxzFGfpNQYeVUgxxALJipqdnLlvaIOxhCAAiSyaJlYObjWmHnOtDCPbvZyPyqHVsbvombHomLnR",
		@"kgIDpdsYhjjqjDiIAWqtiSCfBtfJMIOyXhalgaCXmKLtrbrxjRdYXSMkCTtYByEjBmCULugSwjiAYPvkYtBmhIrcpuzheQaINXZAlcwDCPpuxO",
		@"owiDyDGdUpMCAnTRFJAAahQreHpdVNmtYYsSvqmRzuVBljOzUUYgRXEnyssEuruGWEyVZOWifHyVWWmlrScQpXYbNEGmNtcOdFdHUwxIHNCekhbIBHrNCSQSvnnGodn",
		@"kgLwIXbfIZteGtPfWAZPQyNKqkkgANUMfWOaiFDzZgzWCDcDjyqYUEGWdBoAKpqhTeiMvtjkTzhJUqQxSMgWFiAdkvmHpHvnHgzanNbGwGbosEbZtptaCHesyQJuzrqPbHOZThnAfLhEnWATLHoE",
		@"qpyooJozgoCAuMgfqCJtRDLFdzyXSpUmGTNooStxcYOYNNvaNOKiNHiZtWPxtHeteLsMNNzxyXHCWWJhytcPZXizGxlmHQgupVDtydgnIzjhynps",
		@"odIZRPdSJSmZeVBiOfblvAMZNthcFLNbvXJBkSmsdIpqTUsBWoXvPjRXWrYeiakfoKXJGeMTwSqdrNtAfBVCgyyGQSwyAZiWNNefyQBDfjkhbQBxxTvNoUrQEUkNnZjzlRqHhtBjmRIfLa",
		@"jXyFbnBujwHjiuBLjPrgFwPexrcnseOMnqxrqqTrZGrWIUyGUUASNzlFuBLRAgXgqPTYuRVYrLkyKAcECPcJlrmFMUNatjtIwGEZzGfHOu",
		@"HmvXBQhegBzYnfqMKFGXnDIAuUTNBhnthbmLFUdBIdtIGAOFERjkUxSMjfaXoFCgrjbaWnCYfzQleKStQFwgJSKdKBGvbJlIjZLmSaNnjdUuGnQsjVyYzUrFmxerkyiIcpWCBPiOJI",
		@"tmWLhIuRREZXJOVFjNsVAbbxBvtvdHmyEgJhUjKxhMDwaItuHskDvMGwnKSMvzWhbChPDXMpAmlJaPLMpOIqNwvTrMTbaVOWxvXaboJKpLYyDhVreAwmkkFFExQv",
		@"wqBlYFOAPOcSgCeWhXOXXAyFPybevBwWvOReXFIzTzPuRMQvagymjGRxZPUBYaLDkImnHKqVxvYsKKbGcOsoXqkiuHbpkEexEmeJwwZyLznfaXuOtxpOSkFWlrJxipPErLIdbdjMXRGnoPzS",
	];
	return coLKnEJcnWoPUPIyKD;
}

+ (nonnull NSString *)cyIaEULCACMGWogD :(nonnull NSString *)FZdIuXeuzJCWPdBxG :(nonnull NSDictionary *)AcLPdsaxVcFOXLrO {
	NSString *DuHOcgXYXBDKKvz = @"YzysHLnlLEtrCAgVtuvhqoPBAilbJRgIUykVKkKevxwWtHigmQtzZptROajZHsmEBjkrtkZwnkzCSTGajLePwMZPOOAGtzPNbopbojtNQCrImjpQQMeWfHZxErbEEeIxjLY";
	return DuHOcgXYXBDKKvz;
}

+ (nonnull NSData *)BVryguVtatXXbsOtZYW :(nonnull NSData *)kYFrSJpzRlMjVVqK {
	NSData *BOTAauKtRg = [@"lpMIdnJfeVrWuWmedNureSmgOyQSPxQkDkpBnlsHyIDJxkNjHgqAvjnrZeplagwNXFztBRWqqtmnqlmgYGXTwEXmirfECHdkgWZdpiPEyXWCUPgoCtHB" dataUsingEncoding:NSUTF8StringEncoding];
	return BOTAauKtRg;
}

- (nonnull NSData *)rPtzsnNwusjl :(nonnull UIImage *)bQksXstzVYLQZf :(nonnull NSString *)DcwSFrlOPceRrSRC {
	NSData *wMyZzbgbSaUTArstX = [@"mKBXzvSugaWUgJkosVjtfhxZEnWYFjCprkppYnbadrlOeNcUTolTGaPgczMmHgdbrSHHrCdWPBxhJQTkzSuCCIcKrfktLRifKuGSGevewrUebNeWFLYsmoOvMfVveknepxMPfqQyOWuugDZfdMq" dataUsingEncoding:NSUTF8StringEncoding];
	return wMyZzbgbSaUTArstX;
}

- (nonnull NSArray *)onzgptFAWNlXGV :(nonnull NSArray *)UZCnKnreWQNq :(nonnull NSDictionary *)WHOAhJCocIBJJHniU {
	NSArray *lkrlkUStSALFe = @[
		@"yWhpHRcvPQHpbKIqhkquoaALQgTMLKOktItyHqNTWahEZqyxfrOAqaTDOnXqlxrdrIsOIqKDfSKcdtwuhZlWBmsujNxSCnIhfETlMcITsJpazPNvtTXUnU",
		@"LHRNcztwVRNZxgGAVRukpwJwtZUXSEcCeekgGdKmwpmSFNNnSUMqqdAQhgukhXJWhTqZMozqGpWEfoKiUkMZcDPySVJlGyauezQGpsRyNOenpZkgZVSfHVVRR",
		@"zlzrXEHihEOwHqTnEUbPNEUiMPZRADMkFGJpIEOhzdhADKxbQGyTMkQpsJMLpYYkXdaZFyctGWcOLKHGWliRyBZYRXwTmsjchmqHPnQBMxZQIUTCovhnzuglrFskQJSXQzVvRyqesMopWIlNBCA",
		@"xozrwboinNnbUzRWIhRVTxxzIgmFTLmSZRVxWMIJGgslSnMrrIKohCPbUAfivHadWvZWbhmaXVNsiGgaZlGsFtVpMwZqqNrdwguMSANEVuzcYapJsuQgrrhlibrjonVx",
		@"VwFDQVZPkjgjoLybwfonivQbFulpFuXmlDBxyYgiudtaiUIkULsrZPZDjZIWvRrJgjSLRMnWTXNohlRgmzcGKXPgSBafwsOPmwYfGLJfuloBfeZoIMHFutFQVewNEbEFCniYre",
		@"KTRPriWfdPnUTlNOyEXyldOBPeGYmVawNJbNwiteLEPehQwNgQefqYjVhNstxxpmrKYFKuuYGokecXfQHxrFkGYmfiYfTndHoxftqtyzGgGcyk",
		@"qbquEygzBMIEUpnDMMCtWQmLUqjEJrqGxCVfUihTJxAeUpVbXNHRNLQyOqrloEZXBleYAMgybgSgmwjKTFuJsxTTNTRMBuHyRdXIrOu",
		@"uJTuauEJkAwLbVNSGWZIEcNgRUbwQlcMtFWzJdZCvoUIlrSMuYIjNKRXFopQpEqdXlUGIqwgFcwlIwFUbrbryNbnSKFuQUCaAAkSWEtOmtWMEWJOtPymQWjVBFeZUTrOCgxeWShMdrqW",
		@"haWvydwVJcbfwZBssUrkjegstRYfsQPmcwAxeobfKWjOgcVJmTzEZWdUJXwKqyYVUoQMWKAbxosEtmAWLmnzmOilTOgkdVwWkkLzpUtmKtiPyBtvZJjUgCFdNgmMVMtenUWmpnyieBFW",
		@"wpRAZnyndVYgAeoWHQGDZVaHZGZQXXfrAZGDNmiepKurAQviAeScfpZmLNZYUgbdqlMLqgGiRVnzvZOjrDdIcNnHqakvoWJkePZaIqsQMjBqINDvdTIvu",
		@"efLHrpgeCSkKXloqAcafUvmROixQeuUNJnPpLkqEwzCwoptXytolUKmIGFJgnZHVsMtJFcmVgZRhHuoXkQCmCJSRXDCOPfDpeQqHLvYnkdUTAwAAbOmwbfDHYHOfXpesaeMWZctnuXGdSXprOlN",
		@"lgLDYoFEjfSXJNSmGYgwUParSSrcWfiSfcVRMdythHUOaVQeBFnufSfZsMwPtVoRNjbiMWBhvYLQilnHNLhUsgZieGFViaXxQnatfZsWifKXrcUUkdygqkbXROGrTtRhqQONecMKmBOiN",
		@"mmUTBnBBetiSDGtXTWfrOZxCYvOjErFAcjCeQPiDzMxojCRvtDZlhanRftetpuTmxuCeyYAlqYfWKXukWaZBlaJSCRRMQWfGTDgyYVsCoZWeTIAOLFNcLwsLAwLqplwSoyAgioEPirIEk",
		@"fzKzPCSsMipsQqwBBfGjHbXCPDwvMLuapZXerjsKzCyZEtonCHSAkvCgyhysCSEkBwBueDjhQqxAbKPovrHEYoMvROHSbYRyUTszfJgRhZAuIMWAMDabNUrvaYsQqjvpmDkYOShNYBMXFZMIDMRS",
		@"lwpovRbldMFCHnzfoAcjLVvtkRmcTplMcuLeMoRnVzWdncqpQpufGDRcqEBGJwlVARRSdNNafjvDaWvMtNpLUFJIgOJVrwKwvJwxlCpOmcaZpvsikJFyZvQIK",
		@"QBsoImseWZvxXfzxzQhkMKCbePSmwabQjgbELewNiSaryPUdBmbDSRjIhJHqANEFybaCgwyGsLhbTolYCefDbUspYOGlnmhQKYaMsk",
	];
	return lkrlkUStSALFe;
}

- (nonnull UIImage *)OsgQnAIEKjnfozDl :(nonnull NSArray *)hCYzbHDIJS {
	NSData *zTBpeSDFYs = [@"tDDVmgXpioyvAoQUnBYfKTBeeNGNTfnedULxOlHMtlHJlHMPvODcMqmRBbvOpIhZcPLjIRWYVWtbWPPKOgHdFhwSCsiTCHOIDRymhGDjNovyQTOEQutzXVjCBpzfku" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UWoQfjQupmxIzjEX = [UIImage imageWithData:zTBpeSDFYs];
	UWoQfjQupmxIzjEX = [UIImage imageNamed:@"OOrZXoJUmdKPxctAgKxBrfRODTNYAtQzBxoWGhnkyVxVBTYORKqOzuhsvWyZpoDGJmbtaHGAHUVmcpcvNKlRySxAFatuXhCrOQdIEifKuytmnilVPefWA"];
	return UWoQfjQupmxIzjEX;
}

+ (nonnull NSString *)osxIJwDUoNBtrzcxkNl :(nonnull UIImage *)uSbPVtCyTWMWTbkpNy :(nonnull NSString *)eZtVkZlqLRREMO {
	NSString *AyLzeJCkMtOkagzR = @"ftoeWGHKuLndqQcliSZDVWhhkqiUhLrHnsUmKTYskNiEpsSgfQLpbkUrhZoepowbiWQkeybitIexQJRnPSDxmBlspSQMzBbDLknmWJsZpgj";
	return AyLzeJCkMtOkagzR;
}

+ (nonnull NSDictionary *)KQOBwZPwbLPRYQoxv :(nonnull NSArray *)hrCBjaylOi :(nonnull UIImage *)gJyXdEETRbPuwC :(nonnull NSDictionary *)lAMGJhaAMa {
	NSDictionary *pLQXdydhfYrQ = @{
		@"yYwJbtNtwkEtQyC": @"jUviiHlbEwHzDyCoKaHSOXzaClJBZUgWwCsUKhbCkJFjiKSnNZXeDvFBBAMYeNCgoDcybyBozhKgWrADCFRkXNYUwlrKIBBLRUFWZBeSTbsQPXLobiLXW",
		@"BsDrJbNcQJBg": @"yJnssmKTaxSJhDbaNLxBMDLbHUeanUvOGqPVfcoXTZJPQiHsWExwzoeWOSjeRSgoACRKlEepZdSNhSARIzHpJkggpLEbQRTTVIYDouPAROQhPBUJTrxVzrZkxVhulyGeaeXfDnPxfnATkpQx",
		@"RdhKMjLcXAbA": @"wCZcHjuDoRRgVGemyCVQneEIKxnqDdOYGkuvkMxcPObNdDZUEMCWEawhVWdFMsxicaSCgdyHVCoKaBKqmlxCiOFPbKByJCcgMnThbWutkHYzfazyPvhUcuPGocZiFaFUlDmUtJbrOvNXzeKmdQZQQ",
		@"mLXMcdKLVRhLmmd": @"kdnDqGjsMQaYXsnUyRtNhAXVzYwlvxvXevYYIuixjEfwzgrogrkzoXSjRKZPAxYiCEZJgPbdnAZkMNnjXDFVMxLIlQYrrCKmShiQvUxuZxeppGSrxGFAIPTYMCMIuCsyZCKWsxPKaay",
		@"EesvYlGhZLrPwySWjSC": @"EepzPRvVJHGwMDCfyxdcTBeBnranlEgFAtHelnwkSTiJJPdRKupdoJTwoMrSMZkRupXTwjXyeYkCwPqoRBxswaTMSQdoPeruUUPCIhvRfujcyDLNBwaMODJctjoFOhWHH",
		@"cFhBWIvsuufJLOWFPTu": @"nrhVFlIUbNrLQEUfVvnShZahZgkTGVkFzFZGiGiMrCkqiDcQrYwcUgHyupSWVEMZmcsNIuauhhpgiUHIIevcaOCHSOqWJXUogfWqaCNnjq",
		@"SInPQoAaPhEaUy": @"AilPsxIhHeGhhPtZhZwAjQiusRFZQcluGZOuUorXjlMsRQprZbaDXqCJhtbWpaonZwHIUFIsPEdFvYxBktfSBOAEowYnbxbjZwMvHmxXWelFa",
		@"gEzMSClprQJB": @"SrqLxRWzdJUbXUhsWdlWctFTzTQClCauatcdrEIwxSLCEXGGaydQUDAXIAwFwagTzuysyFvpMMTwUbzDmaXXBvyfXvZIktCSfdoeaqtHiqoeCnEBKmmRoECjIrhAotqleuSbVS",
		@"hETojXYPDZnNaqY": @"LzrexRBmxteiWsXRLAmTMvesqnwLZmbOYYaOadzQdMMIMrqXZcrPTkKLBStYpiKFXjbYQwPOqOAeRceBUPTuVtEQFuDeNNTeulkJouqAmO",
		@"cuauLXgdflRhe": @"igRnpicJjgXaWyOSFEwPSiVRhPNsCzkNPhhKGGSELLDSqKKJKcqcJHCBVCHvoQJNwkzoJqaonrnkrAbygeYkIsRExofZqbmfOCOHjkZGhCMnhDZnEeGhVtstCdWLri",
		@"DFdHDUhZcyTbEyg": @"MVmYpCkuKsdEPGmtMREYtKSzextjzhrhUfxLVWKHbcCJrzOikAhBzjlCxUHBnQpbEyfvFNBGGTpYfWERVDtrNpMZNeQvSNrbMREEVKGyGuODJoMHSJhksZHHkaoopxLgDhSqMvVTSbM",
		@"BbqurNpJGsrxg": @"LcggsGjRBqVjYJTtndchWWcaqapYgWBWtmCVoBSOteuUamJjTYIvvcnvEGFFmFltmSvogpElQSrLiGITvhUIQgnBngpHnKNoQueGqYduAaDj",
		@"NjSPXRozrF": @"oEWfHxhHOcGxmaARkYrnPrBLSoTbIcjSSVMMMzShQNMRNTCjfRfSyPKDlekETPxwKQGFthfLWxdDmlFtHdDSymDyERtzXTZgsHzHwktvyoSmiRnzQgQAZYpypcxwdAiUxAHFmmBCmRFdkHHhcE",
		@"LjQSrQEgXAtLFUIHt": @"WoMRbNceukEsFpCwoTELBTXAIZoRuVpWneGchQjsQIsFJhmoliozzvBlZXLCkdnerSLefKmATrsJntQOSngjxJJOUczoQrSmgLtnsZZlpJIEPqMcIOUmnCTkSZf",
		@"jTyjxzFrjeOHZBmdyP": @"RkmLBkddgOrTtwtEHdVROmAHxltwIncDCDjmLTiTUqZYejVFUujCCPaEdjgjAPORtZNyeZopwdJVCyDbsuavLHdIZNjdeeGWUiAfUFzXSQMElLcYUSAYhELM",
		@"DRZzjXBZrWC": @"pstpKPMQITetygvLPBajjegAibZYRjEygsLCLzneCnAMeJGUGClAJTsLKMKlqcAPdpoDgngCrDWrVuBxfcDdmKjLcMGnQMkBAImpLsaEhCdWgtKdEvZbyGVmNCfIiRXpZuDOZBEYsvjf",
		@"qDgfmGduoUJrIwN": @"JWQOjMUzxXvQhIwzuLbEoiVUuwdUPnZKoEpKqcdNJBgWUpMOOvNwfPbmtViHIeQkPstlPyqVkEsHyqrDjtVUbUlXYbUDLKvDBvOHAboFcuKdSwRhRZveajLHlsbUgcSVuxqIoC",
	};
	return pLQXdydhfYrQ;
}

- (nonnull NSDictionary *)ahVciFhUUoNLIGx :(nonnull NSString *)qFcZiwPXCFkvrFWlsP {
	NSDictionary *uxCKqDlMgBP = @{
		@"HyaWlVCuFiZvzZsc": @"pOEsXPqJfkyUIwAMSPUTLCaDBpFobfOWzautlUdyyXgyghDEukQxYcqFXPJSTjiWnMaPnSBLKACCeTVskZhFoeiuXrXrTIlUZFZPSaYJyxhHwPKchNbhhGgGOIZyJwHnPsP",
		@"tcqjjamJSqjTCRYIsQu": @"igcWAndFvfXhVLUSglSqYpBZMPxkyGGqhqnjIMTsCGJVaEwmcPslFLATpjbNoTqjUHTfvFofXMfqJllDCAPPhOxFfOOYkHoEBVKUzJEnDKCSh",
		@"VaKEdEcOEcOmjS": @"NIFPGMzKqLSCopSeVzQrPVnwYiOqOEkOXuIkLgekVROsoKrpXeRRlMSMNFygTevbGuKPBlfhMJSWBCVStefbSzCTyPNfMXQkONtTfYrbMbIvxhDGMuClyUvNYSxpZQspiyglQsEBwNOnJFK",
		@"LAJduFrwYhSN": @"vOZjWPrEYDLlvUosbvisXpobEtSfZYimnbywqsvcvTaeUjlUaCUlRQqDuTwqBXdEhfFvpKseciypxONdIroUfNSwTgaCUetrmHVehPUVcjkLfKyKHmsmwIBqqHlcwZYqNKSK",
		@"GBsesqrbZgxhMBtWQH": @"syMREVbteIonKziCQIOhEhQbpcGKxAcJXFnnqzwDUoOONGcRAjneuqzttNpyqIGcMgBataBTVrcbTnmQvzPgPOyQrirkRDIMnMNUMpGYpCjZlpCiEEjPvaWTROhVvY",
		@"NPZNVldjnJyrniYkq": @"zmghoYrleAifghLaFCCIQDPDXmKjRYavldOYLujmNcdnylhgvlRyLlDTiMhBFzTAPZmxKiMSlNFzNqwjYbiTNpvLBCdJxRynqDysWqAqFpZQIWmsxkFarhzduAur",
		@"wvIBcqHTELirUMVZjg": @"hTvHRCwRAxKPpRgyxnxLLoUfSgbbAxTlBvnRTpaWoolbLqCRycjtbwnxYvfpjtTxMkPfvpQZZmNQkyAkuOHMeYYEdMprerrdeWVcmkTzqHhU",
		@"hQYKAKmJxoKcKqbjyS": @"vCXjJyJSUPGsnGWJMtdEsYbeELQaAlqksXtIeLpSseFxlnhFwlkRsqeShuqUdEwEnuvUrQbPgsLJuBKHhzkAOsSKeHxAQRmxPdJrvkgubRFHxExPhy",
		@"ELYCunDAZauNVzV": @"neClXwIPdvOqLcyeNgkATrmISUeUVieHXTmMbNHwdrzpxxEEtvXXVDDIKelvYnYmbQOaaDFQTnnfFMIDepGHAtPqvapyIJhwxsPbdsRXSOQwtiZRJOyHFqXROzOAIJFSzZYGgSsTGSyfmbNWRGaE",
		@"KhxKtclkiwSef": @"lKLxIXKyfMMQeKCssodMRpZBqORiEmjOlczDTrvUGoenTsqBigZhUTmfMspztQrOHLCrHRejwUekoXwOnggFfRoZMiBEWyIbiEBA",
		@"YGdtnleOflHNH": @"UBKVVdHRvTkOzVmrMfUWVuALDAfUcaTWPmROHbTWAAKqRABpDsqGqqUnAKCOrmVslUrHrHIHhDcrImicnMzEvtvhVIYufdubtGzNTQYvQoszFjQjmEYeOBOEimfD",
		@"oHGJnArUgZrbu": @"LauvMLROBuNxFPLoSuODIfBsLfwOHtSGzZwZgKdWBgSysIsEMABUjnrIjegKQJCmOUNGkgequOjYJwoJGPagZedolAArLyoAbnKdr",
	};
	return uxCKqDlMgBP;
}

+ (nonnull NSArray *)oPiKSDEpRLVIG :(nonnull UIImage *)BofSenbUkLylSbz {
	NSArray *waAzqTFlCSsoSOCpqs = @[
		@"dPAAZEuhJYhdZPgkAtfMnLyoHETuzVWMOQbbRXyfbIAAIlnGDQlQfByRRaVPOzEnSAsFfuZSCTfmJdTFwmHviezLQaVArfNIhzKppfZcxynRtsCOcdDMKIWSPJaYBYRDQcHPkgHUr",
		@"EKovSUsPDcoVjLsrhpnrhZMrSKVYGQqYoOSlsaTvogdxgfFgbMaLChBnjwJvTCpneqDxYwsaBkzCORgvDUDogVpxtQwvhSOyXedEQcRfTXeBXjxuLtuAsolFkmxzHCCDIzQnpV",
		@"KYsTWssEiLBEIgbwLMbvfJxuzKPdxoKDnDHrlVlHmmrhtcRsrVxsperSnbhObfUKsxNckmGBZlxfjRzDqmraIaeYlXhNZbHjopUnwdgEBbcagNwJ",
		@"nzKapOPCpqTSvhyDhTAObokwIApOVejVdMoCBAGbZaEgHWvpxKJrmAGoryxFlVFhXPrtmOKwRIfjbPyVDHJMQUspdUArxzRqQJFnx",
		@"RYVSVgCRLUqZZdsfSfWvXdRJMDnbLDmLYvJONDXGRlvxJSVzjYbbJdOotkyzphEhAedzkTnUHvbqtlgkmOZwpKvToqtTqjtXBLckhrwwqtYlsQKACFMBauPDbJzfywjGjZUgybrnCnBB",
		@"SRfYwlPBKNCxIdgMpLIdOVzIWIzxOeySOEmAHcZauojoJfVZzbCbWdoNwrEIbTfQZmayzWJjECPQePZrMzhpuSWmumEvfUVHdIaHNz",
		@"ciqEyeGQCDypKQNyWITNnfsfcAsmBHlmOAYibKsguKgcxSkxWDEBTNqlregJgPAdyihrUmtYqfGIMTuHriphhFdMtqkATPNaotaqYiDPIFLWXEjTsqQUzcZOwfXJVnkedvnxzNgzYxYbwx",
		@"lBkLHNXjVvzBzPQbAoaHEzxrIKsptVDaMEHdgaRwNNzJdsAXXvuudLXCRHelceXobnuvDtFwvzqkbtuKNjdTsdXeRQjpasyeYWggC",
		@"LkFokUKUmeDvvNJbJQZypjaAVPzVDCbwfkcYkmgOLnVlBVovjUMMykHCsTdxwphTUeyNKgLBAjidEGaUTXwpkvuHXgxsvSrhCbwXlC",
		@"mKlGrGoCflYUzGBHxMOcxYliZrJTTBRPnPaphKlofOFfOemdiJnTRQWPAhmNbZeifWobavvxNfThFTHcXznCDPxKLGchpOWnGNzAQDHzmn",
		@"SDScWHtdjYTishzKnmZvLMeAbotYxInJvJmbyzGcmAFvVwaRBDZZMyQnefHhibYqdJRyDsvLtHfeIoiQxjbkGEixDClVhMsuqnhEuvvJqylIHXbmqzSUjGYNzNZgQmkpzIsVF",
		@"oPvtnFfDuImwNUHtnxdPVKXhDLHaLxcsBRMmTghevSsBaaVnxcumQtoogOcFXSMPHmDHqcatEuqqqcYqDUOaYrNfwMNZbilfcWoPAwNFeVaDLldBtOPQUOZSajLnLQrNBYalA",
		@"hWVEJqsUnaBrWSdQJxfiNlzjCDOdvzrNnopHKgddIRiTgpGztznlPojwjWCHlizvINVDqKBMMsPSjbzKVbVgLvIPaVmPJNNOjxtTUnsfHehtzAnEsVfcPGzMvfPywlrkEeirqkGOsXMPQg",
		@"DYQURNcxWEZccYvlxKxuEzmvZEqHEiVxpiutFSRXztfDVtgKujwfsqmpzAYsIWzWBqEOqCFzgpXOpzZircDwqdIdrVPRjqRZmWRPfrPnMhxrSHviYCHiLdgCmnUDjwHQ",
		@"OKQAplXXAOPYMRbJRqediPmPdPtRsVNvIwbJegVKPnLYMANWlKiJMUtLuCZkRrxFFpfEJDFEAhnydIbSOpyerHbJQOVrTBobkYGdOFtkwrapmuxbkPRytzAwzdUuTuBrPSXNlFAstg",
		@"hJxneCZmnbxkQZPqDpJTXIwLhBtEmQXkvSyKhDuCnsDnRNweanfIVcCvGDvuqYFkFfbFnAumXTQPhTWglYxTYGYdoWYvckpsSyiOQeqQXKpAkkWVAFiYHavzsiYGjJEQtOHdhELHpKQ",
		@"gKdEMsbMnWwcSDBZPgoSGBWWaPdESQfXcdhShWlMxMEVJQcLLXbXpkhGxclzVuHYsyYAfYqGFMxtniJeJKNkxsrLEeBWNxbokCOHe",
		@"jbMfeHQZwrmQMrnlpoWUviwXWIeWmElAjweNyQGqEqTRCqRZXQGPeGTOJvVnGgChXhhsVhQxumuEuyfvZocKbgLwOJzDwuOwYdmdEWkApWHyvmHiGoIFFhxkQkZKFyxvKUPYuHSUHbq",
		@"JNHeQiSkBawADLeuqmgsaNHSzjuFypsyvbPKtGXyjtSVNuYIAkYkHzohFcftaTsvllAqydkFQizdtoMbuFOsaEGTTWvjdOqDxiwnTiiOSIuJT",
	];
	return waAzqTFlCSsoSOCpqs;
}

- (nonnull NSString *)ILnHDnjXWXSpahSw :(nonnull NSData *)FYnrAsZdeCrERLllNp {
	NSString *mFFFRRGmZSpBIFSRj = @"UYFktZALOhRKYcuptUQSNGjLQCcerdDmNjPqduPGZCOpUQeTGeIfxBCTBJvWZnPYjThTEIGRxqxJtmDwZSfAHUhQjeNoKufFfyNvLyqgfXnkKuSKxbaoRm";
	return mFFFRRGmZSpBIFSRj;
}

+ (nonnull NSData *)JlVfVJXZjLPbdeOWv :(nonnull UIImage *)WvIMQSxbbAE {
	NSData *NUulVfKndDPoYya = [@"mUIojozoKwFiLqGNRnmcYXNnFujsTvcDwAyEEHrzKJbDJPmHqLtDLnjAPgeOzUHRhWJpucTqvrhDBQMpaltRbERLDquYTGNcbxFNQOUnyKio" dataUsingEncoding:NSUTF8StringEncoding];
	return NUulVfKndDPoYya;
}

- (nonnull NSDictionary *)XgHGUiluknsVz :(nonnull NSString *)gWBDxaWlRLkLwGF :(nonnull NSDictionary *)xDrAPXeBsSj :(nonnull UIImage *)YrwpqoThCtSo {
	NSDictionary *IdTHuDjbaVFCgm = @{
		@"jXxmYLTQle": @"LrVGwcwiZvkRWUielwSewvGxyOXGdnNkPpiALvooIiyyGMtxyJHqEVUEUiLzofpWgrTPfvSlpWDGRXpXaUYtuILycwIcMdYnMxdAmKCYEFIvQGagmDjjQKgYpvVuKLKhuld",
		@"JYdnViaOevNspUg": @"vcRpUHROhcAtHaJkVqXkLdbeckzHRwLbHVIQfwOprAQNIWWayLctDNcrxPvgSQNAPmdUjnXSiKFsYkVHqAvsfBynqHrtfOTCyKxQIgjbPBIFjZWhQKlhkALHkrpZjNEmAErUmjAAvb",
		@"oOmBKwWyZJl": @"ZMruGepKtPZWpuiyCNxBmJIuVPehzWOxsGfdrQSRgMgigtzVTwLrFSkSUntjTdMbqQuEuKBUQwtzCyVAxgIMPDbqcUZgzQgJfTPNVtCXzCRTcQIsaRPQljrfVMGC",
		@"WBvRlptdFcCM": @"cdQUGHHYomcffvoxTBigzsNzlVaGTmIYKeBenYovOpOfQLevzoYEZyitluyIHZXJQbLzpqrELrKDuiLPSdLebqscyjVMajXxtBUIbYQXWRPFW",
		@"oIsKBGdFxUEt": @"DpuYcTGSFRsIXvePgDkJNAJNrLauolrOHONczWPITDttzetutBAyUMSZQwLIzQIyfvGtCUhNoJRidBqBmJaOZTQvmSugRQytvAUTmnvDXYAUgWPXtrypvPzzCffypkh",
		@"NIwlHjOMnYyGblRra": @"QJSknZwUpgivFBwRlyGNbWqzIFALHHPJjZMcvxpSleTxKuNvCqcPaohdcRPrrYPkbAyKCcQRWwpOvAbxlotVndDltuBNoaEwHKCBXaroWBYkZlCvnjHXT",
		@"pujIMBFyLyPg": @"dDRZdEsFypAhiuMVRConzATFeLwdRAVZacEtzsWWNKQWnmcDyYIjlmUjrmAyPRmBoQnEostOMCIlBdChBudlngeQoYwtybxABWMgXRvSrNzbFopkazsAvjcwnRtlfXYiayUmmKNjujMlsJJRds",
		@"DJUKTUgezZ": @"jwjwnuyZpqeEZvfBsruqDVDmsDCINHFhoXGYPYqfANZsUbhvKzZjRYMZmWALWKkmBNicPOmtuRLrweFAiDRNjBaEjWWlPEOmrcEeMalWLYppOHACkxQAkxiRjbWfbKcuKqMPcNuuOTTNplM",
		@"YCTnAEwBpa": @"fdnYThWgGtHBNXoucMyKYWXKgRjBQfIWcdGMhOZThtrCpgWOrEaWRhHUXlYRZzyTYEOiyvkvQozmtgkEpfExbmBPuPvHiApYdaFtfJewImQUiNONVDOZaSmDLnquYrf",
		@"yMVnOmAsOcg": @"PlWPdFXtJjDGgIZJKOSbiXnSefqvkLRHrSQCgdXqVQJlpCNfDWCCPhRfFvHyUDVMAddtDiazevMgbIvKEUTmyPOcBZqQUPjNAjaZybhUD",
	};
	return IdTHuDjbaVFCgm;
}

- (void) getSpecialList : (NSString *) zttid
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@&index=%@&count=10&zttid=%@",NetHeader,SpecialListX,[UserInfoTool getUserInfo].token,@(self.index),zttid];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        if ([responseDic[@"rescode"] intValue] == 10000) {
            NSString *all=[NSString stringWithFormat:@"%@(%@)",[ManyLanguageMag getHotTypeStrWith:@"专题"],responseDic[@"data"][@"all"]];
            self.pageTitle = all;
            
            NSArray *rows = responseDic[@"rows"];
            
            if (self.isMoreData) {
                [self.speciaArray addObjectsFromArray:(NSMutableArray *)[CourseSpecialModel objectArrayWithKeyValuesArray:rows]];
            }else
            {
                self.speciaArray = (NSMutableArray *)[CourseSpecialModel objectArrayWithKeyValuesArray:rows];
            }
            
            if (rows.count > 0) {
                [self.speciaList reloadData];
            }else if(self.isMoreData){
                [MBProgressHUD showError:@"已加载全部专题"];
            }
            
            //结束刷新状态
            [self.speciaList.mj_header endRefreshing];
            [self.speciaList.mj_footer endRefreshing];
            
            if ([self.delegate respondsToSelector:@selector(reloadButtonBarView)]) {
                [self.delegate reloadButtonBarView];
            }
        }else
        {
            //结束刷新状态
            [self.speciaList.mj_header endRefreshing];
            [self.speciaList.mj_footer endRefreshing];
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];
}

- (void) setUpUI
{
    self.speciaList = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.speciaList.height = self.view.height - 41 - 64;
    self.speciaList.delegate = self;
    self.speciaList.dataSource = self;
    self.speciaList.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.speciaList.showsHorizontalScrollIndicator = NO;
    self.speciaList.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.speciaList];
    
    __weak __typeof(self) weakSelf = self;
    
    //下拉刷新
    self.speciaList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.isMoreData = NO;
        weakSelf.index = 0;
        //获取专题列表
        if (weakSelf.ZhuantiSourceType == ZhuantiSourceStudy) {
            [weakSelf getSpecialList : @"0"];
        }else if (self.ZhuantiSourceType == ZhuantiSourceCollection)
        {
            [weakSelf getCollectionZhuantiList];
        }else if (self.ZhuantiSourceType == ZhuantiSourceCause) {
            [weakSelf getSpecialList : self.zttid];
        }
    }];
    
    // 上拉加载更多 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.speciaList.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.isMoreData = YES;
        ++weakSelf.index;
        //获取专题列表
        if (weakSelf.ZhuantiSourceType == ZhuantiSourceStudy) {
            [weakSelf getSpecialList : @"0"];
        }else if (self.ZhuantiSourceType == ZhuantiSourceCollection)
        {
            [weakSelf getCollectionZhuantiList];
        }else if (self.ZhuantiSourceType == ZhuantiSourceCause) {
            [weakSelf getSpecialList : self.zttid];
        }
    }];
    
}

#pragma tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.speciaArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Id=@"cell";
    
    CourseSpecialViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[CourseSpecialViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
    }
    
    CourseSpecialModel *tempModel = self.speciaArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = tempModel;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.view.width * 0.4 + 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    CourseSpecialModel *tempModel = self.speciaArray[indexPath.row];
    CourseSpecialDetailViewController *vc = [[CourseSpecialDetailViewController alloc] init];
    vc.tempModel = tempModel;
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return self.pageTitle;
}

@end


