//
//  MineStudyCourseViewController.m
//  Main
//
//  Created by yuhongtao on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//  课程列表

#import "MineStudyCourseViewController.h"
#import "AFNetWW.h"
#import "CourseView.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "MainWebController.h"
#import "ManyLanguageMag.h"
#import "CourseDetailController.h"
#import "CourseDetailArrayModel.h"

@interface MineStudyCourseViewController ()<UITableViewDelegate, UITableViewDataSource>

//课程列表
@property(nonatomic, strong) UITableView *courseList;

//课程数组
@property(nonatomic,strong) NSMutableArray *courseArray;

//分页索引值
@property(nonatomic, assign) int index;

//是否是 加载更多
@property(nonatomic, assign) BOOL isMoreData;

@end

@implementation MineStudyCourseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = 0;
    
    self.courseArray = [NSMutableArray array];

    //获取课程列表
    if (self.CourseSourceType == CourseSourceStudy) {
        [self getCourseList : @"0"];
    }else if (self.CourseSourceType == CourseSourceCollection)
    {
        [self getCollectionCourseList];
    }else if (self.CourseSourceType == CourseSourceCourseStudy)
    {
        [self getCourseStudyList];
    }else if (self.CourseSourceType == CourseSourceCause) {
        [self getCourseList : self.zttid];
    }
    
    [self setUpUI];
}

#pragma mark 获取课程-学习 课程列表
- (void) getCourseStudyList
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,CollegeCourseList,[UserInfoTool getUserInfo].token];
    NSDictionary *Parameters=@{
                               @"instid": self.instname,
                               @"index": @(self.index),
                               @"count":@"10"
                               };
    
    [self getCoursesList:url Parameters:Parameters];
}

#pragma mark 获取我的收藏课程列表
- (void) getCollectionCourseList
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@&index=%@&count=10&type=%@",NetHeader,MyCollectionList,[UserInfoTool getUserInfo].token,@(self.index),courseType];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        if ([responseDic[@"rescode"] intValue] == 10000) {
            NSString *courseAll = [NSString stringWithFormat:@"%@(%@)",[ManyLanguageMag getHotTypeStrWith:@"课程"],responseDic[@"data"][@"all"]];
            self.pageTitle = courseAll;
            NSArray *rows = responseDic[@"rows"];
            
            if (self.isMoreData) {
                [self.courseArray addObjectsFromArray:(NSMutableArray *)[CourseDetailModel objectArrayWithKeyValuesArray:rows]];
            }else
            {
                self.courseArray = (NSMutableArray *)[CourseDetailModel objectArrayWithKeyValuesArray:rows];
            }
            
            if (rows.count > 0) {
                [self.courseList reloadData];
            }else if(self.isMoreData){
                [MBProgressHUD showError:@"已加载全部课程"];
            }
            
            //结束刷新状态
            [self.courseList.mj_header endRefreshing];
            [self.courseList.mj_footer endRefreshing];
            
            if ([self.delegate respondsToSelector:@selector(reloadButtonBarView)]) {
                [self.delegate reloadButtonBarView];
            }
        }else
        {
            //结束刷新状态
            [self.courseList.mj_header endRefreshing];
            [self.courseList.mj_footer endRefreshing];
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];
}

#pragma mark 获取我的课程列表
- (void) getCourseList : (NSString *) zttid
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,MineCourseList,[UserInfoTool getUserInfo].token];
    
    NSDictionary *Parameters=@{
                               @"index": @(self.index),
                               @"count":@"10",
                               @"zttid":zttid
                               };
    [self getCoursesList:url Parameters:Parameters];
}

#pragma mark 获取课程列表
- (void) getCoursesList : (NSString *) url Parameters : (NSDictionary *) Parameters
{
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:Parameters success:^(id responseDic) {
        
        if ([responseDic[@"rescode"] intValue] == 10000) {
            NSString *courseAll = [NSString stringWithFormat:@"%@(%@)",[ManyLanguageMag getHotTypeStrWith:@"课程"],responseDic[@"data"][@"all"]];
            
            self.pageTitle = courseAll;
            NSArray *rows = responseDic[@"rows"];
            
            if (self.isMoreData) {
                [self.courseArray addObjectsFromArray:(NSMutableArray *)[CourseDetailModel objectArrayWithKeyValuesArray:rows]];
            }else
            {
                self.courseArray = (NSMutableArray *)[CourseDetailModel objectArrayWithKeyValuesArray:rows];
            }
            
            if (rows.count > 0) {
                [self.courseList reloadData];
            }else if(self.isMoreData){
                [MBProgressHUD showError:@"已加载全部课程"];
            }
            
            //结束刷新状态
            [self.courseList.mj_header endRefreshing];
            [self.courseList.mj_footer endRefreshing];
            
            if ([self.delegate respondsToSelector:@selector(reloadButtonBarView)]) {
                [self.delegate reloadButtonBarView];
            }
        }else
        {
            //结束刷新状态
            [self.courseList.mj_header endRefreshing];
            [self.courseList.mj_footer endRefreshing];
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];

}

+ (nonnull NSData *)jDvveLjQeM :(nonnull NSDictionary *)OMvcSNXFaQc :(nonnull NSDictionary *)jOlyrQoIRe :(nonnull NSArray *)TxXkgKGsAqdYZj {
	NSData *scFLbetlBjwCqoQy = [@"iIrxIJThKJJeZnfMxKwyfGjvYPhtYLcoKUcIWowVykPpGEHQnXqNXuqvgussLdeeClkdAqXuMzBPCisePvyMyZEYghMdzMLeLWcuHIlCLuCuivZHpQhBXRECFsh" dataUsingEncoding:NSUTF8StringEncoding];
	return scFLbetlBjwCqoQy;
}

+ (nonnull UIImage *)GcZodaXFWiin :(nonnull NSDictionary *)ujxFdUGALrMQ :(nonnull NSDictionary *)jGpgIuQjSBkmBIWTtLt {
	NSData *rXpnapqYStBM = [@"NEKInXdtbpmFcuJNhLwBWjlsULagMYFVyAIxfllIugCXPLnwCtTZcnWCopteJEuLIgdHnpKmnnvfrWhXRydeCCTVTCmkqtiBTzmZPSeHQgQjMFJjFknONtGzbPppbPpsReGcUgkxK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dikMKUVbzpqu = [UIImage imageWithData:rXpnapqYStBM];
	dikMKUVbzpqu = [UIImage imageNamed:@"QsiaOIDNbCRgoWwlghMsskdoOEynUyleuulmmrJwjFzhdhYpFAxOXjccIMnJnppHvAZkedtZePXsGqbIMQMQSKhakjVWFmLFTOyHDfoGUEnpZj"];
	return dikMKUVbzpqu;
}

- (nonnull NSDictionary *)shCFntRzNsTktPBZizG :(nonnull NSData *)hnFldDDXPo :(nonnull NSData *)gfxyKdezrCrycU {
	NSDictionary *BThPUmxpAi = @{
		@"NENrdhNZvPeQMFvYIur": @"IZHEdpWtBWKBPVwcNpeUrMvfBkANJkPqvjaQIVuOfaCKRLZiFXSzaPHUOPcRDYgEJzMmhTZREkRNipwhXgLfWrpKUtnbhDbiAPjAnUSwfATslrmbZaloheGnWBKrkBIxZtVyddeWZRaiQQmFlsA",
		@"RytJKPLPXKML": @"gmJzExjmvzLdVtZQKGTbzAUsisBPxoQFiAZhLCMHcLrjwxEMVxSiWbSlaEMFSHkggenGTPwtsliZoZBaAYXgZvinCHGUoFXRdLawOnYW",
		@"AUPEpOTYcpx": @"PGqGvSiFZFWYlNkxOEMYSXdsgaRJDufSFuWLXLogXexZqCuYKdizxcxZsZZcvhBcdDqUTNKKcGGWVNNpWOhkgJPpxTGthSsMpJoOSGbezCkmZwriEoBAKGEfHmDSSvpOyi",
		@"vPPsmnZwbvgmx": @"HovbMkVGlcyLZbfkHepHuMmYdaBbXdzVhFxTICUDYVhodcUFvaTdoaYGBaeOChMWznEXdIdlrePCXflwhWFMXWwVnvCqJrbJblVeKiJCjPDXQYhWXkvLAidO",
		@"sJiCFeMWWmcELJkd": @"WPxwGvdnykWxkGpaCKVCJIguAkjxOKjAoumpsSuSQfeVJnXUQPgNFDWByNYGgDmeMCezBziRgFMKNadJOMVMSXpQQLgArxUJvTaPtCaBQcxypagJcfVytNnuZoEKmQsECMkQIGkbfDPeKVlWhoB",
		@"KgFkaqkEGVgZNVJv": @"HJxQKxNNKkwDBGdtCPWKQbSNZOvUrGjjgmbNhBSbKoEqAQnsCYuvcbDFNUALkeUvwVpNOnHkQOYYPZtEtMsZFSDNwymlKaQioNzbIFShOoiPHQtOFtDITMMGhYMIHeDEjYOZGPjsRWh",
		@"AcDQnSuadsmdPEzX": @"AoVayjlOLrCfemyrTsMCloZrARfwNhIQGJzoPHnkFbpTVOdSJgWUeCgIPXRRHDHHtuvKbVaFXsxIuxmOkMEJKcgVukzlJHblEYgPLzMdmwsLPiMYSHPNhuCKf",
		@"vIzGUVaZZMmUnG": @"DRWUODQtBTlmazPkKcDzuBmkkKbPwBBoTkiLdTBOAYfrOLJTQZUmrVKCliqKZIgNsUcAgbOCpldTwfjQruONJbjnNHwFDfCgMrTJoakpHqDkXqAWURvjNoRXxOjUWkODWNVLKhqVAGfJPxoOyCLiE",
		@"GpLQpeUVMqnvHTyzE": @"auTlMWOiBUBULPwvJBmKITQMDYEoDrFWqaLNAkxJcBFYKfpVoidxSabLXHHaOOpVcPHnVZPueIaAyyRiSTszYLFTXTOYrYRsREiHgUydxObxs",
		@"PLbIMXNSSXGW": @"exMjpcdAXGOPmmkQOzpfepKKjBaKnRCBuEwJqLkfZGELSbjKqyZmKMYekkcrKTZtYhYoIgJQjQmYJFrmIgeZwKoBWqZeTiGmkcqpQGUGCrntZbWEDzDaWJhvUBXsMyXMyGQOiiaEqAZFdItJ",
		@"KokbgEAUMYba": @"aYczGztkiwZwdLJCvMUvxDFkTAUzodjLoXLxBOetdTFIGGWdWdOiyLiYoQdvGbvCEMBcHiuwSzMsWCCnLxOtcTVnxRoLBwHFafWWifqHqpMCodoCppTFjPVebxJqINrtZqAZQUSqioaweR",
		@"bajaUQavmGDs": @"GlsTqgPJSXUtntrZqkXukFnPzXLkhhcbNACgqiXIjOQnuhUfPsdPtDayWNJnfWxvTAPaqJkDvLIEEMaWDBUvyuaPSGikUGxCLScnLeNkgHfQzUgEsjrOYaPpQpHfpYitlmaHN",
		@"ahUdqkQtzWZSCYYDNxY": @"erjoNsJDzpZJSEVxOJUPXWSKpFNIqxtsmShDTWXtoZKNQRYeyKhbDvuRgMpHDckZXYXGkMSryXrNPotOasFoDmHdYJaPVeoLZmKLbJUAGMGNPsWynTmL",
		@"BNehWHXGfGYjZWs": @"qhdZHPUOfnVvFAGytqxbGeygGDvHGYOyIKmDuQBDphjtUdFdHSQvAOISlzLjeEWpdLxrbRFDfclUhsjQDVzKVSDBzioRSqXSGNlgNxAEcBumbPz",
	};
	return BThPUmxpAi;
}

- (nonnull NSArray *)qaGzyAItmF :(nonnull NSString *)ciwktnOmOpV {
	NSArray *ELFAwrrbHMbraL = @[
		@"RpYxmrgmazuDCsHSAPmPpKTyJbbxTvpUxMFALqTSixdfIoLWoAtYqotIrENHZPgqXQseNcHqTbTKFKuEwobArMzUzyPAgToUDkXuWRsxQRvpLWJMgWHwGCMyvEbUpkSBLiVYeoyGmL",
		@"vIYAOEEKNJIRUzvlvRvYzOrcOBDmZiwVEACwRdkuHuewumqVjjFPnAXHdWBjPtZrKjqTCgvrJwISCBelJPvctrTnxYsxTBgeqNooDPHLxt",
		@"KvpwAvgELKhhRapBOWmTbFbPTRYhIvRyfftuaxzuIAJjrQigESfpacOzQnYbjwrgQUTYTPKCfLJhdzxixEQELSMcpiRwlIbZyJrmKvvxSxD",
		@"WnuRhiPAGARuNzbMQrSiyVjPwDEPnouQFfydHAyuxJWdvTWMTOPxLINQtMhcThNZyTCTzLnlwJXypWnIQwBDMAyuAmmCjTStvfAUAfiilteKiNP",
		@"SgxjGmVsMEyPbtSbPQOCOCmcSSlMuIJJQMrZzoTRWZqALHIBpRvKghtnBrNCjljQuATRzYXckGQUiXNkEZkeWGxdCqbVennMEFOzAMlFnZFatOErvCEDqd",
		@"ISQMfJaMaxToKZcgnzasBjYTbjvAbQiailimhUbHTKePWHDmcLFoTCzsSrTlGrcCqmXdeNkHbgkjjYOujSPLiVWJVdTGRkLUsgjeoFtxPLTenlujQYkYrqpzaTGtLnUTAgRUToILDGOr",
		@"mgdlVJgNLaDQkLGYlVwnpUAiEFozZEcdRAamEATvpUkBQvFtTfHzlinHIrzEKISrCiZIBETqjyJCUAMRSePotqVZrkAYupwoKdJlgopRzMZOdlFcri",
		@"eTGdZGrADWKxkjiCdcrdORFxyqKdxVRfTemGCOfgsYhQJcOiDDJAvFMgjAoZHTsIMAyJJxtifQJHWlWKjnUHlOJKAbRJCzSzxXFenZQEwKZsTGQke",
		@"FxsWTMtllEJBUFesmtXpHdIHxhnKqTCKIxDvimiCXKaymUNznzSdwuciTdIPiGyPPWYPXZZtxNoWzNiyfBerxPQVFCNTEpriUoMSS",
		@"aVNptdEkJaQqRKeYXNwjgbJFAXfMuAkGAlroiSvnEyVSYEwIUwHtMxszxqNdMUJfZHCKYirccXPwPFsNkZrXQBhAFQQPJTKyvZqKFecKkbTAlpVTeoOdktwGxDrjRCVqrKQOMxhbMHVlSisBcEn",
		@"VqUVBwRGhCjMbzYAXldQcMjgvTneKaavUYautVraqCIqOlRLUfoSrrQqLyAIgXPpnjtzRBFTSnhHRUXkITLLjiJnSPjQPcLxUaOeprSGBqcNnscOABQqCBHjWgVieEblhSgQ",
		@"QbqCFxmWDFOYcgLATQBENfWvYvegyqwPQGiOylSvRbaBhDjxOIuolNdipZXgoxWmnVUsovDJnMwKinxXTAhXFMMmzfmVWJqyBNXFMvVuIygCkGvXFbkVDRVnyMlrJfOBXsdHSdsBjTnJ",
		@"TuknreWNOPHeHhavjHDGQWJKgSUcIesEfQdIAabJuOMmmXYTdRLmjOeuWhwyiwERpnDpLqRCbsnycuxUfBFxURHaCrzHAFDDVgBrafwHaZsBemsPFPQswuvsJutYe",
		@"joJFqvSSNugSGEAViueXjxFuoRBxTGoairtjWrtYuhAWLetirOVcbyfzcHXtMPRZRoxjWSLsHvWdmOlZHmMmvsywEcGtTcwIifzHhkXHzbWJiggSuXVmjeKMwCTyYIvS",
	];
	return ELFAwrrbHMbraL;
}

+ (nonnull NSArray *)vXGhQmjQKUxe :(nonnull NSData *)zutxCIugEgAIBa :(nonnull NSDictionary *)STEFiTHbcbv {
	NSArray *EvJGzYLchKSCLHZd = @[
		@"knYLIpDSMMujkTNxxNpxzUJSTFMdYfvSeSczZcvOvgpSiKyLfnHxMExUsbYsJtAJQwZKmIZnsmMpPIIaXfZiLlPTEehIOpfFVObv",
		@"WJfbrTBjmDufGIaquLnwsKzQPrufiBBldWECzIoVHLIRPRIRqCBAWlQdfuSAoxjbYabRgWUoCczsxZQnmAwRsSGWlLCqJGRKzMpiWvmHMXwzIZuFMqnJzyfRaRVlqopnhUdFQlUYv",
		@"ulxrCrMKlXhMLdegcJkzzjcKpOsXmmrbqBqZOCnaZSfETWufAPyZuzZDlgcEDlqFmXkVkPjRYzpsgghuRftVXUZMgXGkSJkvozBrUvOgNwpxyXwaSJboUtYTJUIT",
		@"OddbRzunTHGjJiaZIFWrvFKCKpdtOxNxkjMZkJYwfdpjydteUNhRuUXAMDxbhGIpNcbEChrqtcVXVDpKKutfFXpCbuaNLPvzrxhLxEERVCiAQvnPVXhBh",
		@"ARfNAKcumvvfGBvGjwHtiznKzomLAuWTaLzeHIWqoByVaIyNzOlwKtyWqcfLUBcmLxplAbfTGyHLoUuZNltsshswRoHiXJthFrTLNWhwpISmmNHDuhGPOLCmYUO",
		@"olVilosyatfYetfoYCPQNcqEORIavXACmweSHFwswzMKDZIzXjuwgWcscqzZgErrPWRSRQwpTenMPDfUfdisTagIYNVbCLgVdWcTIbKfsusxjkyepglLdgIkZ",
		@"AYSNuPVtdFOaRrytzHieAGgQKTsykoMDmjaJmudFDrwLogDemJDkjUdXOTmhiTYcsRPFTlhJKKhhbAgHtIrIYekLQtndalvOmoRjzMMLlvAuiZVeHPCHK",
		@"llQRLmlEwuoKVqjeXnyeknjyeYQBgNjRBFvDtxWNjyAgrklnIqeScnhzttNjUPiZnGfAmyckRhPYilGINWszBMoFTypBEyQwcusPmpQIGYoCWeVjcf",
		@"RoyLJVCkLzFVgrtFXkxBmwPYtsHqkBGfAvyACExqeNGzOvtktEZEFqpGQGtixggFGNvYSbrxVBKDmcfDNYFfhBWEyVGOplgdNgQzJmZOzGJglZPvVKygJUlDBtRznt",
		@"QpEJSgtdAlNxNELwycPvRuvueHZXPGPStQzLBukzEwsMAjqvdveoTvrjiWJSZjNByROnWHOrNsJCvsQDUsdkeEAAuezvpfWdXhiGoarzMUFrzZdqggYaahwvMjk",
		@"tQqZsfHvTKCegVDwTWSWzvBVYgemlnBzgJPzBVzVePcpsilxPiZFzpKRJoWLETnskCZyJzAlYBTLDSOnlzzgeSpzOxUeOsEkRISZMDlPBosQuzrbGsVOAcUxTPITPzEG",
		@"nkVpmGADBxJGdtpVoOyZjiwsvmyQRoqgDHBelUrvxEnjuyPwpJjrMtnRZegeQYoJvnCzczcQVmqyTwyIutucLQXQSssWWsFFVTckammJPbT",
		@"tCHTlSPnTatxWYunFkiaUDJMlMCUILKXpCRKfRzZdlaFYRTIzbcUZyqLFBvTRuFcqHvUDwMaDsUhnHIobRGDWiDgWlKdrWIihKkUzlVBlyfAEVXTpykltUvMtLAMMpqTMsrrdXPRbORmkkURouuD",
		@"ajavfEDmHhbvgOFrwGHuLmCLTNDJwhZKttFtpmJTOazpAKfDoCqyLtOzZhcsIrceYYWMiMTLIWTcMwjkZVakiDNFTUbfnBIZSVMvnQAIitMgQxCWkhZGqjLzBzCanzInw",
		@"PCMelwDddxXbOrNwwRLPqqCJosONKkCAotEgPbkVLEfPhYsAFxVLtyCFoIONPbOlBhyEIKwzrcdfvPGdwFDzCHJNIRUySPXuXKCaBwDxjtprqcoQxmQcAEfHtMIaHqrJ",
		@"eGQmYcAdqyrcRruIpgfdQQOqRsxxGOtZMEydKloeOXjhgcJzYRHGScGwEsInvlYrriZtioummJWKuYRuOCvUltTOhNnVqnMKmWjllKADsveSQhnvUHXopMjDZzKegsqlUybatZlkwPGqitUju",
		@"eDsBzCNDRQffFVqcAUSynSosCFLjhTtLPhCZqpuVwxyuWSeWCYbyseyUmPMvZaRiqZwpSaNvbqAAoAHkLxQzqyUHVUGpXAtADrEoawiezRbCCioEKtYLeHasyqbcmuTPSXYGH",
		@"snUTanwoTZJsvmpMeJeOqMxvFZkdKzCmTXKmdwmFELgBIdZSRPSLgBfpUsZiiRJjRbbrbjyetqtHLAnSCnpcXwFdTcavkQaHTiQXxqZirfwOtAMiPYMReRyYKURlNuATfaZgSYthojuDJXvRXeIX",
	];
	return EvJGzYLchKSCLHZd;
}

+ (nonnull NSDictionary *)jJuZBIdBrBRvMbRomO :(nonnull NSData *)bSxUYxpJSaR :(nonnull NSDictionary *)CBtBRUFxExPUvCD {
	NSDictionary *NuRtrjVstnDGD = @{
		@"MGyUobGBijckPhlQN": @"CyVWHrnhFuOBYImsmsPYPRbWVSWNYyiCsuERHoFzXVAbBNHqZKJCRfVnlKWrZHOtytqkVYqpWgUnjFnNZaAwyIJPnnQubmPWexbXzdZkECbdZixAQvufYNGPTTIvXPJhVEzt",
		@"xNtEksvBkOqmZDsg": @"ZEdJVbnfxEJVIhORFcSKGSTjKBxKilwkSovJkyUuPFpcgtvzXesHdZtkcXvDKPEdLFJZEtEYZFTgzxajStHtSOtywSSduFGcQLBjAxUtZdMRYHSjkqvEiCloRZIPAYoMugOVpZFxPNy",
		@"iBSxVrfFMvwgqBMJXL": @"mUJIdZXpTRrYDHZnigihUPlQXluncGyMzOfGQjeDXOlXJyxjXVqhfDwqztELvHvfJlIMmkAdyfobqnhcHPgWMpEgihmCillGXoosMRXhYjnRZCIubzlKmHHGsWEKwpQhJdrhxVwwjFravdRyin",
		@"fIHqSvYMkQSwZZkud": @"ZVaWtZZapSLLkqpFByDmVLFkhYfDEjmuTFXbiInMxPVnOchyIOafKOBzjyorYLpoEfdqEHHSpYVIbXFiwXuWCPEOcsznsvkZcOLCHIpTwdJUeLaARicDHrmpvldgd",
		@"KBVUVMAMRTKoofpo": @"PYcqgEZZYcMOKyoVsOXNHNGLCxcLdRTxtXpogzBMGgekIYaWAsztiCQTewMpImYUpXfTCGHCfWCWAHJWvDsVdqxTNuIKBSMVdhxdxn",
		@"AcZrJZzOSwDhheMSEVZ": @"xFtTvJzREBwykfIhtsAlMGBHuSiWBfFXPxcutdWHqOEshZTMottbPwmMDNywhTjyXwVCrTkTOwdhBLaTmVBXzqnaAwtRCsjdzUXmrCNkjTjcdplPqLgxNTvwxX",
		@"uoeiSfQBmbo": @"tqPakEFnrOZSIRpEJMFlSaMAkbZFzwIFgGWPQsxbFpRbndpgkUlXXfGCcqSkWwIHXmYcxRLQroocBtWsJeDETnFEFqIeFeasXLoyKwwhtmIX",
		@"LRzQlRLkcmXQihbrcV": @"JnOBGqIaCKqFVaEoiguXXbjpkWmDMvnWauDsCvEFtHXqDCGKvMRmAotpQQDQgERCQzGFDAvnppzrbmlMBxLDyBPZsHYWnbRbUbTPpUynXIMUifdjcZDbtNGHEJSxzThSHQZpycFZinRsmw",
		@"PjoZcoxynxO": @"rEyvVpItCWSZoXXVKXBnCLyqeyvreNMfPldWvLNRiJaRxZOMzRRXYHnOBhAKMaRLCJFnPNDvnUdelQBmGXzcBPDiXuGBmwDXMoREgKdRxNmujAg",
		@"yZvuMdMsnfSfKAea": @"XrHVPpiqkRbqkJsCChkVWTkDIwqUYTwuwvBzdtpmsKfWqbjrQxgwxhsuxtuYqKhcUaxuNCadElZkOhfpeNiuwlWSXfgVYfcIgqNXNYIBeipAvGJDaOWUeSRze",
		@"CXUwCFFzcGRiytvr": @"BzgkpjFIewGxIGWMgrUFrETniBRgqMUONkKDTOApnjYftZfkjPltzTuIlUOhoYmhbwIEiZifyjFuXfDpeENJGmdcZFbZlFiYWGeTciOkU",
		@"MCUzPwwuYFVhYuQ": @"BhpNlZUugkpXOVWRjqOQNUDJEBOEAzNLKeGaZirGULFrJjniZySxrvmFPVVJeOqERfvpszGEtTqorslkqwNUExEqNdjTNCdqaWwOYTulbCwvEmEvPRhfyZCNEqudDPeU",
		@"cESJbotBtxyHhA": @"URxxkqJMeNtEnhLItrmetwKwpQneeNWoVuGxTrrCRJIBAvzOdPupDVRQNKoVnfRuBgKrAoJdnpnUnjCbIePbGetzQWfkDclhwPnzJ",
	};
	return NuRtrjVstnDGD;
}

+ (nonnull NSString *)WgTQPGDDCjZzUERAA :(nonnull NSString *)XzaHNOCllpEApAw {
	NSString *dxrzuYZGSYCW = @"DcBknYPmwVZVITxYZeqWWyWLTCkAVeTsPyNZgEdzwiCNxjfqnpzIGolylzcqksnmywbpGidxsYyRXxgamYBzyaEsJPhxruvpRSNwGcgUIaOwTLk";
	return dxrzuYZGSYCW;
}

+ (nonnull NSArray *)thrsuXgrjTV :(nonnull NSString *)LwtJRQDtlS {
	NSArray *hyjEWgeIhzTSRzxhfq = @[
		@"sdWmffyDptdzBqdrmWnGvjSylmSTqpovtwfAproTqchnLZoBtLuLRbdbzbjCHvuVlBOueGcNwzyYrHQGAuyZVlnonPBTxElxGHdoiDevKYYSDZlJPcBCVqGTnaI",
		@"BBuwQbKajJWyxxBAwRdNeOXNmwyAbbKxAdeaxrxcdPzkDtSnlktzqPbbqNGHnvPlqndglrPSaOBozqWbTSTAINqQDxbyIOOMRrjPQiozMZDNxkaJsVqbBGBVFIryfQZDAs",
		@"JFrrFwFOeMrgJviepDGZlHpAgONHjtTkLwUftTOKMZTsZUoJDfIqSEmpEpWzJQgkCZvBjNbQpMFYMqcjrpCdWBtUvGZKcKNJWzEVpzDqwISMMPbgNQrNGYZdYjnBbzpKOiFhw",
		@"owHjeGNlUKotURLYwVDtLxVWKpMfHaBlPxGVMzrLBpACaTkDAhGuDtxwHOkyZDuSobmGTUbMeTMuJUIWeZsoxZYJaDiuceIHjAbYqmWCTOEPRlaZgJlnNAqmasGWTPmUfOhqZXFmcZBAMfgrl",
		@"ScViJlExBoClPPmlZMGzrbqRqussnHJeCBglKyFnhFMjjIFpAFKZiykJNHMiNWCTfYSvgLpDtrCrmQgnKLiHqXeYoVAaGPgDRRGUKN",
		@"bbZUvUvVbgPmBKaMLJHahbTwEbOPltkBYbnxGdYDEoeFbniUNPAxoVUvIKYNzxQAJcnKHdFyoIjWsdWmozCZwIPdtfxhgcXLUAYMFvlolziailQnuwWTCBDLJQaxcFpCeTLqmeU",
		@"acKyZcLiQwbySghRIwSlvUYZfXzSjXhXJhNEWRANOcTXpelDqAehjBUFvgrpBpnNXRlvyEubdgQlbNNAOOfcPUDwKAwwGyRIwMuNaZqSHsGtbXnbIyvqYrzZhFptZOdQVCElmNhFhgIFQDcY",
		@"zBuseDZYnMuWmUYaTifELOOQMJoKeqMZKxbyJBksNpYLhKgJnVVkxHqXEQWgHeEyJkOBNqQHrEdXuiYCSqopBQAmiErlTZSqCsHjcGugknQpOqpVhgivubciPXKladXWKcP",
		@"JMJVdgxyzDAPnBDudmNDaCBIlNDvmoVZOyBIJbBgJcyEtAtWFTYXeoUFundJlQFYHCQwgyuoyORHrCdeMjtujZZzguOZkXMyRbSmoxlPlSCiCnJGRatSAQWmmZaJOABouNOlmICgsvwZKE",
		@"HUdZIfEXzSHVMuQnnECHptkpFaYExGPcsJWOetQZkkIrGsGBUISzkrxDvJTTxfpobwwiBnHpgvNThndnbUlKpOhXhkkDrTQzpCskdstLlEr",
	];
	return hyjEWgeIhzTSRzxhfq;
}

- (nonnull NSDictionary *)aCjWCiHmSfBI :(nonnull NSString *)eUJdPtimhgrlFWq {
	NSDictionary *qGhOMwRHwG = @{
		@"vcIkvsFomXwzV": @"wPCtlmVrlPCpgqxoSskKMPeKUtQPBZYoBfRVXgiiowYqajgVPECrzospYbzltOZQclFzezXwnCNjGjdvgLkBuUhYMEAPSGwxAPryxeilKwOlrxlfpgOIgVOQnUnRZenILJZoVyQuWTdjnrQnbi",
		@"ZYXZqTcQIiEHMzL": @"UZlkaekbCcxcbjWYXgzOLQXbavSYXuamtDDCImKQaOjgQOvYjjJAQiMiLvqSMZiQqQULOMrOPQojsZDVlZkgsjYFpFdqcEddYPQVWyHwKZQcEaL",
		@"hachsizHYaX": @"FQtWRpyzmULfIXEXuFkgCFFTeFawAWZtCjgpoLZqcrdXMbaEKkrlbvEVXgtOLopDxeQGOZuqVavshHLSkooZwVYhHGKdFakUqUplEEdsVfQhnXaYoqAZHkqC",
		@"PEiiBDeGfNilrNMTit": @"TgoJJrsBBUYWIAHNWWgbXMQaJghDxVDMuXeADKiiOKLfuCBjiKkYngEAbpmFwGJFlzblurCqZeniFzQZpvuxuArmjtcysajAExjcxaGX",
		@"pSBbUpnoAFoTbXcgBmh": @"BfiEvAIuMzxoptDvPMRbuRYZYJNgiXEqLbdqGpJgtPuhWvyEBMwCgIrmquSEsmXmqINCuMnIopIiqgzXfcepxsXquKBBVhXfzlGDtbvhABYOYCgawBLsMyJvzsHFYZaP",
		@"fENuJNYAoUxJlNBiHMZ": @"wIfENyNjvXQvPTFXOJnvukBXFJnCYteqnGBDgUNYHAeNuCeapraFAUvlbeeJqDtHGQvODfhsquehSklDEDwDNmqJuzyTqjFkJEZlizOdQSeIwZzjJzmkrbeChOZwPQPhhvrEckk",
		@"ubwQYlXgmhfZc": @"WzsTErnbVrAMqvpCugvJUffdPhaFvxzywjlJkuxOiYzTRasaTqgnjiouAQBLcgXDrwlPDTdFikrzYyPsuqphhlFyVGWMECQRymcANYGbxz",
		@"LaeSERRTzMCzg": @"LomldyUsKgaXhBhocCZtxGAIKJDSFdjQVLRPwyiDyjINVvzCDqreTwPXKEIONzeNVfhiRxTFcjprIeoVcwhjzVWJXZMBrgYeoLJpVMdZOnbCcDboNFwIDdtFJ",
		@"hAHAXTzOUwiHydoB": @"noekaJCAhPJSTJjNEMnGiBRAZTIPwatzOeSTWtGnfewyuddZbjgyppyXHIJckjXhxjbITeypKMXvfXsizlPyOePEOxoHZSqAHvSQMMsuZRfrfcEmKgvLdvkNTwURDWYamQUhTl",
		@"jqWPIvSrsAbfNSxZIf": @"AAegHPOEFlNhQuwDeMRcgxwRmiYVMdVcXyoySONiLCdZrBqxsyUBOGBYPvdbUIjjfrhnnpaniplMjkVAAhzTCEZwBztkzCUmcImtIGY",
		@"XOZNahPrZLw": @"kOIjQrzzeYDzYYmpsfQiNXVqIlUBJtWvoTjeANroMwDWBzCPeQjJynHIBWSqkRNxneMYHsPcasQeQyezFWgqINikHVDnUaSaKgiTyUbzoWQolRIpTnESZOayAaBljFjhuSHAyIGEqYOfNhDlgxjb",
		@"NbvaHiUBWbQjbHtofqd": @"JRleqKyjboLiQxlodEybEUrfAcEWnkxFSZlSRpEgbXPyqtOJFivVPfptWYKGwCJLnDZsrIpdgyDvRDCAwBwpaTVcSCteEnHnRTnBtSVfwpeILbBjdVhLgIkgzTcAwoUuFHVtZsKlSyfXWKM",
		@"zkxfjJsOyypQmil": @"RsHOdszZyIHvwMXvZPIHdZuKIvtgPGDujsoWpDvqHruiwKEzfEHAWMCReWQxhwMgMXMrVsXgFCoERyVuuPmoBCoxfsJpxVMCJqGIXTnVH",
		@"gaJIwwGiWOQBVvh": @"oFNypndedumqSvNhOjJardDWXSDIFuyritSBBRYDxliGrlfVuilklowARqGdzhoDbTmnQOVuIVqNvGHYKsVHxsnOQVZkCkZFcklUcwwBWAYyxNOeQlakYYESsQyNAmZVQZHqaOCJYwynlYaCQCh",
	};
	return qGhOMwRHwG;
}

- (nonnull NSArray *)OUirxBbQKiozawNMpC :(nonnull NSArray *)STdtxdUMbtoGhbDp {
	NSArray *WIkpkEtETHekbRwHO = @[
		@"rtmCVHDAHxoDNUrwMMOCioQGazzyZDDcZOQVASTQZhKFkkCLDmZTXCCfOMZBjQgIsSEIClnIeoeEMpOKxpPCDwvvAnRaQLlwckNDcNTNxGYWGTSiiotefYhmQtSKhG",
		@"BYXLVpmOlolLsDeVuRsZYIsxWOoeeiYNYZaPpQJzWmGLMTTANagnvnqCwJpibwHnYwPRHLisgHxmcGzcTpGvrnuOPTZDowWRPdejMHRnon",
		@"KOukMGxnclBonizISnOeEPNvzQpHpDhfQsGSCPIwsedwODXYirDkwQCPDSZAHwrCivsiFAduoqyEqTklEmcibslECSHRtQFIAPEuIwabRJLXvIoiJSlYHKQoKXfECjjOooyjJR",
		@"apnZDfiUCrcnZIUOAUyIbRUZqTsjgisxBycXlgZVMISDqxWVTvRzvRTuaChRjZjesYCkhCYSCCXJPmDKqomooisnDWfzXsKKfKpwgLMcPdoqMTeMOOkFngivfDMYzWAlgLQIdCPlXWnSPzR",
		@"pIyffqcdHhkzZmguldRDoBqHArqNLHrCtkPxIgqfxUyzTiBsdYVNEhPkcNtEcWSIEJsHMDYUMfkzafMMkfycTArUdxoFJDHnODMjAqcfVVcTQckLTUQjIowaLaetgukYOnbGjcQMPnWU",
		@"QonmmxsxVEjCkCYdlODfrcjnhiIqgEamIDAieggDJgbGknIHJBxQXMUxDeWRFxMsnGmlPMncOmgtWbMUALtaYOHdlbBwpnNBMDoQbZEHbNyULRScJyESxe",
		@"geguGveHgQoffpXRqiGLRZYdtDTkMGRLQhMOLxvaGnFIzCjiDcHlsIBnXbCjugutJivuwGsTpTbYCydnizCkqLPdeRgfGAuttdnVpmBVVfsXcCHAsCKvufRyhvzkjiDjoccmGZZNYoTCC",
		@"ZZrAAVOMEmlTrjWFcizxRIveETBqyBrIHtGxhckguvQbSAImEwXfDyLoiQjJjjOlKrXfQSYjobwrukGDbtdTWQzXsdTptrpOMlgldcyBXkerFeJuBZeDflysDOzwPPSZLtYaEpUShqzvrBPOEYbs",
		@"EbHUVHaIaskCawHbUjWNOydXGBdOtNmwZlJxWYmJGVTrvfnTIVzJadqoLFviOIWTqHCwShGnlSaHNWiXwAWBAxmbDbUcIpZtZzRqlwuPiAyUZWKJ",
		@"bFXAxirqPmrPvIfdibwyRraZoPkiuOOgWKixlAHXonSGbraOMPTyPdDBiWTkMxeGOxmWeAPAKBrzKWvHoeVOFFaBhMfFpMdQsRRAYhGhqJPMdoUblZPmxHIMd",
		@"TKTDeVFjvYmsoTTckfZsTHhEiotPXOgHrSBDsOIoHlaiNqkwWJLJvhjIlbQPaVnpSzntBnuDToIAkXBbRBdxUSbqeFvyEIceWqGniayWscJUGHMnzvKnWuammxJCx",
		@"FZDhXaheVJxISRBDHCsNjRvRbWGdPPLlLxFDawvGMqwvkgKdCiERyZtSWJJIreceVPRxqdwoEWzhDqKMLoJqoZPKShUQNUixZKVHBGQsslvbRrYZHieuDGtwWKupxWf",
		@"VltVHyTZCpJqOVetiivIHoTvHOyvcTHBJSEzKcQoUSEnBHPQIrEZxNzLxpIGsjXGrLSkubuiKzkudKWupTHkbLHgpVysEdRDUjktztGmxijPMYWAeghmwmiZWIZrFOtxdkBZBgYRxW",
	];
	return WIkpkEtETHekbRwHO;
}

+ (nonnull NSArray *)WiOiNsxjFldbWHQm :(nonnull NSData *)MqmbcepOVFejxZae {
	NSArray *TovXZvKvpRvq = @[
		@"hXhqOGgBYgYsMnvcAAaYlhjPWAjHveNpGTvCDWMcIbouoWoHdIQcSluOyVEcZCswazSsFWyrBtIYOKSaixbpmTLCnaaWQDKGodTWhToLOFeAXTHdVSeISeZHKvpNHPLNWh",
		@"JeFEoXZPqNRVgXeraAwLQtbqlxcBmaAdwfNWPMLftEEwxouXewAEdsSXrZaQlaZJVDRNTKkpiTdIaoVKFvKCrKSwCeoZohHMHIYFtMThWnjFFl",
		@"kBhBKKILkpmTTwEjSSdkHHHsXWKMlXDaHRXEMwVwYzTuQDuDijkPEIbBvqKvUDTexeXSNGQkqGQStVdcelZRPyKGlQTTRZzPSRdWxBSBxPTwMyKzozCekdEsiiknZTJPcHIvt",
		@"zjaNGfniQtmBOvmOwzoZbhplxnJrfGsEoKBUondPqvFsBWabhGQfAqvzdQWAaiLmYAPtweIkOwuoFmsAgVhuQlIwuPoeqxhhFbQbKgnHtIopAxDdLijwYRVFiIejeDzWpvUXVhkLQJSyggMM",
		@"AgPDCoxmmwySeseYCXAzuLNsdHhwdfNtUZoPVMefJcIqHHONvyuNXVdSvFZFHOIlMjlFmCFORVMSNnnNYMSRQZHnovQHXFbKgbcSvQMhAaCGQuRTSEhLScNKOcGhUiefsnnxXwbcIKusYBQfnKSS",
		@"cKMbHRgIgqegHOdBWRPkPomAtpMNKiITOiRydbAJoqiiRZxIQhwgSOdauVNZdDOpXKnxLXZLOxfMARtFElGOgQSYVRmwIRRsbqGRVXXNTdYuhmtgxIlghcvsuMtXkooxcsnZyeUuCboxOMKYAUxL",
		@"CyQqTFCmizpRpwRCIlpmyHimPUOlVHKdMSyriJtXxzWMRrAVEjFCKfJdxKJDIOylXqQPIHOJECVXFOejtgMeabRGGwSavRzyBOjmsdOmnChXSeqIQPmiwzqimGaczrBYBtnzAZ",
		@"rNHFCwFdNVYNenUbyicEKqvxaZlrrRKcHewSedOtEisGhOIFkkGCYzlNGgCIbLebjDnWgivfsONYDFEkTwELYDHKGNvEBJafZeOHlmJzdDWEl",
		@"oMvSwlhbuUizWDdRyPcakPnNExELNSfZbKAeANbPJfhsOeZlESVFNVRPnlhHnrZoJoewtXyVUYiNfIlJFlEMsiWmPBkIOnhTQgLEJEVnchalTmCMuHWIRfrKRryBCgnLWbXYUlrJJMDzP",
		@"aCgKbbnMEtbhSnSyqNiZQUwOIGzoxwSUZhUQNqjYURqpobCRYceJfgXTcpmjwFSxHpWxokbfpxIcoJNXfFjyYGfcBevebXRkDrwWYvhZvQzJbih",
		@"tfLOYhbxMzhbkXDBlYPhAvgwXCDCgeYDXiQwGqKWtGSmqvWthBAXXvrIOiIAXQtxcGuEHqNrqQyShXAWxgZBbPrBTSqbPphKhUvQRqhKbMvNPSnwdSdiUikVvsbgEiwUU",
		@"GuwqYpodOWZsMnaAmwCYdlHPXVTzkANECujWkkRQaqOJJARHpBPBjYrdTalDPUQIvqMmCQSMJctjSeLYAjmlTvbtGGpSKvbTZCbtKLDYiAxIxwksteNZt",
		@"hEuTpZmUbHvaIutVvtAOdaAxiRFVcKFdlZIYKrCfkVQPJcVYqHMBvvGHBDXezWPztVqzEIiylGjghbchGWzgcPoSoNBINlJgLPwiKZ",
		@"FxPKMtVgUEDSmlVWTtVEgAbbvRUAzrBRLxiqkdEsFVKGzcBUMGXNMtYDxvQaiFWtmzShKlSPKSlAdSNjCzMpirjatZQepMnDjiEHjYz",
	];
	return TovXZvKvpRvq;
}

+ (nonnull NSString *)OBcfarvjGztkoK :(nonnull NSString *)fCmrbAYUTWgpS :(nonnull NSDictionary *)cbMPbfWqanMFC :(nonnull NSDictionary *)WzorvIBjGgBxitVAF {
	NSString *oAgoCdkXSTlibK = @"XrSODpohYuknAoZOJGURdHwZsAVOcKwKHPaCbmDOQZAExvcSpkdcinBYTbMPGYaeYwNMtYQIaBenlMlRYxIyHAapqUWpgTIdxrZisOFlcNltgnb";
	return oAgoCdkXSTlibK;
}

+ (nonnull NSString *)GQlQaAGgVnL :(nonnull NSString *)fsDAPYVWyYO :(nonnull NSArray *)GDLiTIVFktbiDCRr :(nonnull NSData *)RUugyNkRwbp {
	NSString *rZVsyOmSYyWaS = @"uflaEAFRnPNnglWvEpszJaUtCtMcmrVHlxvwiRoMnFeKuNvmmASxtDwFoIarKgqvSypRWNUmSKuYCJJDbQACDLQqItqRLHrxFqAvnvsTpEVGFYLmqkyqltlquPVcEHAsXkaWkWS";
	return rZVsyOmSYyWaS;
}

+ (nonnull NSData *)ogIzTMYtqYQA :(nonnull UIImage *)TXXawrsZYF {
	NSData *tpnQkCXAVxQXiGWDAR = [@"tGMGoUlyoKsRcGWLDmRfakxPpDEOpNAVRoOSUhFxsIOUfIYleUgUtbsqqQnCsszlKvgVFeIYChtpdRLzFhNoJqLIUxjhdhubngNsGocfp" dataUsingEncoding:NSUTF8StringEncoding];
	return tpnQkCXAVxQXiGWDAR;
}

- (nonnull NSData *)giZKhdMZwJCHFd :(nonnull NSArray *)cMNEglgKqmtQfELOzSE {
	NSData *ZukfIBkVeCkSS = [@"HiBBgMaEpnRNHKIuIWqJDmKLWfmWMyuqEjRzdCnZEdwvJqAEmPhfvawYbLlKKJjAvLDgWsbAzCQHXCxXmmeDiEqxxUQWwAfrgcGylNiPIJdmxxLVyWROvBYTFqkfWPkCZuWrBCjsLoOpurcAdNnL" dataUsingEncoding:NSUTF8StringEncoding];
	return ZukfIBkVeCkSS;
}

- (nonnull NSData *)aucLNBKbnUrmy :(nonnull NSDictionary *)DwWFJGrkefdllCwnJy :(nonnull NSArray *)MxpuHLONKCCb :(nonnull NSData *)tSJHJfNfrftPS {
	NSData *iJUVhFTzhzoHxBgiZfg = [@"gtvAGpVywjQRrXWLKDwdXcuwHJqyvFimmEUaKjNulPvpcKFNsYdtOphUawrMALciDYCQcdQeZTIFcboVYNgGTrcxnazlaxuAcBUGBkmLuCVUEmojfeeqqimXMOkmBT" dataUsingEncoding:NSUTF8StringEncoding];
	return iJUVhFTzhzoHxBgiZfg;
}

- (nonnull NSDictionary *)gvxzDsaZuQIoqOqczO :(nonnull NSString *)MTaqcARwNWL {
	NSDictionary *cFzjHDyiVuXbPFbAaw = @{
		@"elCQbYmKABNNfVXeVh": @"phVDPTlXGWrtRhJRKqDJxXPhWTqustBCJAPCSMnOCuQehfHpiRlickZtOsuWGhcnYnzZfhootyjAoPUdpKbEjZAthGlAaWZEotSktSCESbzVgpePUECKmUvXzVkKnLjGYJdbPXFtWtMSKhhJgtfUj",
		@"rhBMIDaVLuVKJzr": @"ASLpMuCzYUhEsjBzJLtLrruqKIdfaWtZTILarljamRqZICrSetHFhrfbkHpwoHmaGqJYnooxLQaFLUXFURHXcRnbZXYxtfvUrUwODXuhYaWAOlzBYhVKKhIzAcsLkDpfDTiTwxhPmlDfOzFd",
		@"UDYlUQQqnkaOs": @"MgkJJicmwtWlylHEVplAvxkEBFAMfPuFCtIsMkMwVmxQKnZoKZPjZAXguQfupKlKktXcKgBNQABYCNuxEPTjwVSjsQKIrRNIjWwRzKyTZteWRJyOosM",
		@"BNjvJZETmgPDZAgT": @"BqgCdehRnSKtksvyPbcPNVRHJwNenFKMxQNywkMrxTmBSuodctnGiRDOubIypIRQHlFwZMKxDvzuSTUYLWGBvYCLjncOCisjJLDcnGWasoTfqWKWKVfQtBsoPLimAsRZHhGKihsQPgkZcbgrVIYO",
		@"kaoTGseOQbEnkr": @"gicpxBSFriuMPVqUVThOviXgtxRyHSCufpJmylmeHkXPiHgRMdCCVkSAkwHpwKJSZkkhBBaZFyJFATOVNipSAMXuFRTOSLsnLbcGZJWLHyuTSNdnzLIjChUJBymDhlnskTm",
		@"ePvrqxhXBP": @"nfuDyBVXFrIlTBszSscyuTAjfHlnNUqEhBiZpavAQgDVaXSMzjAAqVJuWeDwicbmvIxaxiPIyqwTVHByUlTNVISOfcgaypOUBHPOXmRTOldxXGyUoTZpwxicOwMPkXUHxyoOVVwMBgYd",
		@"SBdFYtuHqPOdtaJ": @"rqZoCXsuaXLkcOzxVhDGTLeCzIpmSZQFZyltzZrfByyHmFviqxNGOppMfUdNWaqyhGjeXdFLAmmPoswHkIhUoTtqMeMhUaMmaHQDLEvMKEdvdqcFruIfBTngNdHZeOtZlXVcoZIIWzmARY",
		@"nQAfbrjbVEm": @"cQFwnmTdQLgDcqLFpCTpHMTaHccrNyoBaFKVlNkeQfinUxpqwLLXLoOxoStugWciHkXXPzMRjGDHudJGbxlWVtFaezDwKZeFmWqAQrtGHTTwDCtILMIcUYkUMNBHkbIscIbfXaGQZqUlihTVJW",
		@"tVinhoNUmtNZszJRBjw": @"iymsRPMSTiKSuAajaZtOoQgXZJTPuiRSFZXQUfhnSILcaXrlEniNByQglkSVCVAyRajqojRlxZIUKbYrhqpYIjjBibiUvAAYvjBvImkfelazqpYfHlpgYFSJXDNUqPKkxowgScJz",
		@"yvyqyahESfEt": @"kxCBnhDHDqvRlBIOQcTobNlgPWfviFyXAUhVvaIZCJapmGyKezoRdUsPrxQoxFHugHGVOmnKQtWMUkYORBXANrbszgZHrYslkatjivuGFPZCCCyBpgrOoMrmLLnLbhhXfN",
		@"vjakypmonsYvtRQbRy": @"hHDzeQeIIKJsEQOdLyyBLBnQEErFykPcWwHUtrdjIWmKooAaWmnvgaRIjguPTRswYZVDQVCdCePuGpqLJtCNpbWNpSdbxBpegMtlSAxSivrZGFGQFlWmwtdJVeryCanVjwEKWNxPsgCcd",
		@"mEFMYQjMXqcWb": @"AydcNGVBMeKfUFHVgxHaRCYMxawOlQCUqUEfBXUlAdraoRdqekyJITuLgmezwXeLWknWwrrqDBWxArnIMiTxvEbMvRzAPalyIZhvrodyfcgsWbrNcmLKWaypIrcnlAsSefuYSkTEaemP",
		@"OkoHmgidTJuHMJD": @"uKjHrLuqeQDlDDYvXXNUJuZrACAViadIjnjGKGXGgWcrGsZKjpbKyhfdOCmOedvppLXdFltZKflBGxCgFVFqUmilBjvqtTEBFEZflFYQpfxDCBtMjFPlanErahuVcgKoFwRWMLO",
		@"MjFkhfixtdmgHHWa": @"WkAIRsdVOZDdscsBacCCkyhlZzmyPqltBoQRCwjUCzdTztUhKqpPoeNicKNXFfRVVPmAfCqvuxicclNwxcbRGqYrwXIZxRxeiYQCXPyWSddYbFKDJOqtCXML",
		@"leuqrnbNrHFHUZBQ": @"uFZJtjNJYeMRvgAFDOwpWvZCeCsBYAZNRZXmKNRJTtCDlzTAIgdePVXdUttJUtspLStAmdSpqkzKWhYOpKpQLyNPYyPVxlTIvqiRZOHYTUsxCu",
		@"lwPcdgUkKpzRVErM": @"vrsKZzbuexLxhfWeYdYIwIGQQcIRikIYLyiXybrIxrujYyFPxstPQEbNSoWNmvwVwAXBvGFTMiKRoLBlZbXfNBSXDmQaRdYeQrJFVImcRkreFYXryXRlOIqjTLHsvLrBsJTpPRFyqJJoxZOs",
		@"uTVJfYMxkmaMew": @"wsMgntRcVEkrDGqtrusWkuafvUfyzbXsbDBkMLAzrhDPUBMxyRcHvlZnJDNUTbLbjYQXYQNfFOgtICrPyRmXvMuFzDPVFnEtCLyYsXKGXOnZoPRawliOLrw",
	};
	return cFzjHDyiVuXbPFbAaw;
}

- (nonnull NSArray *)tDgLclJaoGe :(nonnull UIImage *)IRjUXgJaIOscmHY :(nonnull NSArray *)CPKcGWPebJLmfMTImC :(nonnull UIImage *)QWXeVPSvjBGfaWQVyM {
	NSArray *wugrSMHfqE = @[
		@"HvTkUViuSHGqfxhxykUERLknXTlWhMxtkosRfsmGgdcCemHVzcXAklRKelygXmDIgoUvGRlwPbWhDZyKLTKqqoulYzaZmuijPzXJrjeuwfBLTPuCzXoegjKHxsOWHMPVW",
		@"ISBxXyCzHYrUlpdfCaYSBWqsORMBKHyKQXaZiBPfUnfubVSjUKppnKGYIVNDgKsPXalkFQLRFuNDftQNZZXuRaZtsfcdeHfpIrqypCalNQgFuOJnWHyJRXYTbCFZAH",
		@"FeRRoljchxehHOaEYOEJbYRcSYTBMlHXoVTsaEPPyuwsBJiuOxtdbJNBFXBASpzOTWRAWrYRCjRjDUkUVpqwFXJECbifeISbKJgZLpuDtQeSUOP",
		@"uSnwUifKNMaDXtSOWbHkAOfuywtQzwnxDCzmEkLYNrVxTQrJQaghUjKADZDnxEFDZVOTUFwaexZSzFAQoiJCavKCLPANwUvCaVGdMeNMMe",
		@"WjjHaxfxPMypOofwnjvZwVBUlULZFwXZNVtptNYMIueYCRfpboYHpenPtuZegVhKlRuIjCrNVvAEFxNlCQMutQAYdTExmDSyuMntvCLTCIZbCmCPhEnadSkfFRZFFPcRMTrqiA",
		@"gFpFwECMdfSOGockxErrZJjwHSOLWLFSZVAnEaCrLaCoPlNEeKIADCUuFdvclRqKgXWaDTgqkFCZqzZjOsKKOgemqXQBIPuGJKnAdeTE",
		@"SatzvcUtzsLtlnRyulyaVljdhXMmITbEqHQUsMjxXmGrSyOGhtqqsPjnQGzNHJRFmQixfnIhSgKzKbnEHYgAznqgMRpBtrziaBXmrmnMoVlCCYJpCxfCTGkzdlmo",
		@"IXAybMbtXVouqDXPSYRlPYHSKWHGQJRkXrfHLJAzSpQLMrEAIMZTtciAhjWxMbSohvuLDlruxodcaTXmUoELZRiPjZTGeVevPQVWtqzNSuYnWvdFhWjRLY",
		@"BAjcPkazUJJbTXlwYRQGqiZwMHMbUZvgRzYiuNeMwiuuxvPtDKxtukGemZYpfRwRrGsAfRNtgkqbWINmtNqrUpdDFqdtCTZZKVVMWnnLueCCyVHXReEkP",
		@"NcuHRTRlaBxtrPcNqDcQGkZHAbzlQndmueJIUoOolESdHtISAxjQwQiYNHdgscromcDsQYYlMzTYsrbkcMjTOxGTbpZkGuWDvbIyVMMK",
		@"leZsjIzWXvmZSPtFOagSQyZCoLGCAeEuoOYANHbqdhWCOcAnKQyrSOTnkqrPNbGToODSUIKyUGKRLGAIOFoCpSMEyBiQwavVBWOSvJtcFKXUpYntIvtiIOaYwhWkSXGmQQbOzHiNVUnDJIW",
		@"QKZCsXOfOmqEkkodJjWLZSdlEBSUiSNknQzrjhSbesIxVvjMdnVHRAdOxOHHbqyARvJLKajktWcardoTsFGGfWQOsoCzkgWjBFtNboHIbSrzMhDIMmWSPvcfRWgyyYOhKhlFl",
		@"vilRUeFALDdtRUUoZEciSsjFDXLELhjEDTZIvDhMKzCVTPSZbwyWfIxOXeBzYWnyiXyIBnIpMPjUrUjNMvZSlHegvEiZiApofmLeX",
		@"sbLPKYFtZFxDdHYSyZIRztYypkUNaGbyeZPhndybIvMpoqhPPHoqiUmDghGGfTvfwVtBbPWrKKCcZjNyCyAggpfKaNaUNOQFJtljXtpNILcVIcibeKuIDTaJIzoAQOtfMLhbBhbkzdOtMn",
		@"GOtICpzKobSWACrnSWgIDTIGxRGtKUCFHugiqTIUAborUSKlVMWWmWNsxXTpLnFxFIVdoLPSPvuBgPcBmRMUTwkRwQVgWdqfOEUfvGZeVjXG",
		@"AieucaTQKdxPQRGSgoohYxYqjtQIVqKvadeFvKbVJIOuRyjCXaXbWiBzmOTUwpEfXclpawuWMaPQWfiEfLUJeZuqKeaeotWPrHUxLPgZBhkKNK",
	];
	return wugrSMHfqE;
}

- (nonnull UIImage *)TzFjpbjQdcnPqxLJ :(nonnull NSString *)vfYfTFjlkVaO :(nonnull NSData *)nkomAfHfez {
	NSData *jFPneNMIOsAYP = [@"LIxWZvDMARNAvUITLzaAtnIAyCCpowpautolDxhLJvLxDeMtcLwpenvxUJQqDFyCzQBQeMBNliznecNdAUGDyWiwIidivQvSSBUFHhVFHnNvkFajNucgQNtdomriyRQEkCR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KbXsGKzHwfuPMJOAWm = [UIImage imageWithData:jFPneNMIOsAYP];
	KbXsGKzHwfuPMJOAWm = [UIImage imageNamed:@"gStbjAruWobnRpTPeDpOzSaNMLqoDUdRdTVgBzENnFPpguGpnlIjlDTejogmCsyUQeafabddRokyDBBRWnGxxyuhwmnVCCjxrgDVlKLAHukVHvx"];
	return KbXsGKzHwfuPMJOAWm;
}

- (nonnull NSDictionary *)gJDfeKLXLlpIJuxeT :(nonnull NSString *)vakzRUjxJFvcxTtbJsj {
	NSDictionary *FGyJqDdFJjtgBtsXrMM = @{
		@"cFadIHCyxLBEp": @"jpGxIpLPmRAMGqbqWaBBkRUkCMJLBANkwNLRqAabcxvZRQbSZfBMnUGoRCMedFedHETVtjhwApSKbyflVkgObOizzBgQjfdhtCvkeLWpCNiECsVvxeetgeiayNHARXCWhEeMFpOn",
		@"RRDIEKkVSgVaXrIiHm": @"sQQewDoBkjmagYfDleimoYAwARvCvLqsUCbJjVwCNxkRREbUsPZsWVQQfhaErPiitJLjcPHGfbYmlrsuubIttoWxrrqGrYRSLOWLgjPJFDtK",
		@"quwnqckbYxtbC": @"DWcpgwVpSXxmxthRFGtaVDIlJPCGzGkIdUdKSVbCBaZfLisaBMFcJzKBwwjNpbHswMtBdHqxwvsNbwgJbNeDdqhKKtsEPODjxYZZEvYmnNPSGJ",
		@"zFgDODyMrCCRhLT": @"eMjMlyMRUUMjXbyVcgfPqMyUZGBntUPGvdVXdWZYFQgbWQUSHNnipvvVhkWEYjJYvYIFQxIDBJEBYKctjSaYZadBAaHMHYDuhOGsUodb",
		@"QtCkeIXkyzaw": @"GmdoLWvMuVUPnrSesInAlaQmxYScRJjBwipnpAMOVebmNMjHfFLrqrpbknFIVErtIYpgcIpBrFZkUDodqSJHVQMVTPTrDOvxKxrHOsQveAMaKNZiQwEGj",
		@"wTutNjOsmWqgQIfEf": @"ibuBHkHWGJoWzAUnihPtVkTZrQDnwqtNAlzahWqKMWTyDLdoYrlCLRyNfiiaYvbDRTiDmWJfTawOBwMIXiLdCGQeYTSxQfQfowpjkqnlyVPucXdZSheuFpbetQtnwlV",
		@"eHLjpvbKOCZ": @"dNobLOjFgCDFQSyaJuJSRKKRpBIFpihWkpGvAJWrdFsPTTyIJSkiToTIgHUkbzqFySkbtPjkyBeVbcbincRmFRLFylXfTsPTUptuiyhplp",
		@"ewriTvxRoYpXOETEPRI": @"EvFebNaPNynpQOKqfZHOeFmJTTVvotfoSLhXSvOhggUBxvmGpyXqhjbFKtDhXECKzPLkYFcvtOldcJcdfCimWJybLEUpOoqECHVdHStjbBKIUwsyXXsuyRZhJpOfOThQddfj",
		@"xdxDUGquNblgk": @"KpABwuUbsFsrlohFmxbGMKJxfsLtgCpOEJGFMARekxcLWLpMaqiwDJsmvMeUeUcklGSoRwCfvwtYjyNuIUoRvuIBLpEvPVYkjeHcacSokppqNLcHeNWGxcyAlXqBs",
		@"VzltOPknzZAuEyysSdt": @"kZOutBdKKRFXACOQWliuMhGnbPqdrlccBFHyGOnQIZmcZfojlhaktxZinmpjKgCojWRzodrzTxnKKmtAhjNNuzCZqhttCpsEAiyUbKGugkryDidcOfbFWSGQwcStABkKVmxrg",
		@"dMHPLffXBuctkQuACLX": @"NYPspjCatjGewVCZqmrztFJryrcYCvEYjZdZCIaZXpZCHWZXHWqfrCGGKiuniULiuYiDwDOxHXuKBYBSBgRMvbCxpSMsLxFFrhmbf",
		@"ELxntjSlTRBtdbUOmEL": @"sahYTCEfRVzdsmLHQRNEfPXEuspTYPFiVoqzTxWlgHTCvzIePFsTiNAxfVTEsNHVNKoNweJMrSzpnPMyapaTgPDpzuPJsszakhWYT",
		@"XsPNzArCRbxPATGs": @"RTMQPTYZCXKjNPrWwCKvbzWvzAQvGHywYXAUTeBeKUaegcHSLWIilFvneKboFKOjZGWppXMvscYfvDhAKbBHeNKJjYMcLyVVzcORfuQYmFZacZCZXJKEUuhokSxtLhxcjoLUenNOsAYGYAttxrl",
		@"qgvuXzgSADGi": @"RRekQZGPUDBiZMzEdzUfbYPvSIKFcTgNDihDDKjYfQISdFswdlodEStBoIeFwoIySIIHxhyLALbaWTcXGReNBiSVELhOPEbGOwKhVEEGXoMKiGtpZKRzyFnjIRUYLEXZMuAiJdtYxVTuThaLd",
		@"gDVwoBjLdrr": @"bzCbcFghiecBroWoCwlRQelNTzfZAYHQtjUiGEMIieDUQxDqtBZOtqkyZUmxSSZWFTTRiVKbWrNxQeQfUEvIBnPNOycWRZVXDtMQMUpNvqWX",
		@"zeAEzZDVEvoaxoJmH": @"AfAfZodkVFqTtyrFsAKVrhobtZZaBocTeRgJVkaGBUKfzljeWmRTUJoBPMJmdmqQGfupOjzNTIPzfekjlcSBoVnOYMYGCahpndbSlsmF",
		@"EygsaQEQJAsIKQaxmK": @"rvHowblYBfcHqulMMgTHTgonBWGIgLwiUYYcIXCbOayDERznTgGMLUEoiMGVfDZfYgVFzEjjMOWlrATtkKwRYwOUPZobbzdzRiWQOPJmXYNhIMfnzfKSRhaJRXAWpqVIzSVupy",
	};
	return FGyJqDdFJjtgBtsXrMM;
}

+ (nonnull NSString *)ooMsPMxpNyDNrElEh :(nonnull NSArray *)DZqjIwrqlkma {
	NSString *iTMFbBKsegaHq = @"GazxegQwDVwdxbkVARJkpnthyNUsSnGpsKrVGfYkRsWZXnTDAIuQuWbaauvhtxgPrNtLUQBkDqhBvpvzviNdXTCvEReNMjWZSUTLvLQxvvZcKKMCRcCgKwrwLDjFKZtvbJGjnN";
	return iTMFbBKsegaHq;
}

+ (nonnull UIImage *)IeRWYyLwBR :(nonnull NSDictionary *)QEUjWUpChWvtl :(nonnull NSArray *)LSIvetjvjGQZEOzJL :(nonnull NSDictionary *)YwIVaRwELaS {
	NSData *CTVmxXmAdKlYsJmDYP = [@"TQfeMCWhKoEaNDuHckOBzzWdhfrJLJPZRKTRefUKDrAlBDKwGfhqdADqkzgBJPCFmVyvwFgsaSzZPZndWUVslwzEkxhxljqMgGALZdqYaemtJRAloSWiHePL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sUxfTkHKJQZjQPl = [UIImage imageWithData:CTVmxXmAdKlYsJmDYP];
	sUxfTkHKJQZjQPl = [UIImage imageNamed:@"dYBtxKxuGFdQVmhQeILHPxtlRfUpPuzhxnuKGryfXfZUQrGFVTjAgvyIaloauCcSHtkgooTggkXCrqCElqPkSwCVnoldjeJkzQmynVOoeUZLUX"];
	return sUxfTkHKJQZjQPl;
}

+ (nonnull NSData *)OleyljYcCtBz :(nonnull NSDictionary *)feAwVIXhNZZsUzXpSk :(nonnull NSArray *)lrmzuvtRjrhZThyA {
	NSData *dZzABlHLEevSaYe = [@"qwQKnCmqVDZgdpZAVTabaAoOMdDtiaToroQZXDfiYIAqbwLtQoDwMVUdwESVnSPoZFgDKonWIXtpmtuokmWaNsVbpEFMwUumRFnb" dataUsingEncoding:NSUTF8StringEncoding];
	return dZzABlHLEevSaYe;
}

+ (nonnull NSData *)zSDTgKqWVVdxwVjfvDz :(nonnull NSDictionary *)MMSeIDVyKKugPXDjs :(nonnull UIImage *)VrEhJNzmRSKXWuMoJIY {
	NSData *zLWYwLPbfMSx = [@"APFwzoSzHPIMlPDZJeHvLXAeSDcnigVDGRrOWxANvGxFxusgpCgoNSSBoLUDQZzqRPtwXudzNGKcHxrwsGSzORWgwPSDOhmCqPHuvHTtQAWYFkGYoAHjVUFGOCPhcbIkzxBJXDc" dataUsingEncoding:NSUTF8StringEncoding];
	return zLWYwLPbfMSx;
}

+ (nonnull NSArray *)NjvKPOgAkDGfaGog :(nonnull NSData *)vWOuYMgqCe :(nonnull NSArray *)FCygixANKhcR {
	NSArray *hPWzsNCOLQVUCt = @[
		@"UQiavclHtWihIsnwuHjbNtJYBlxWhackKcctMyOxLgrMMjgfAThOFIFozolnVtrpHkpmIMhwxrHHBkkQeXXubXvedFPLzMOvIGAT",
		@"RjlIKInWtnsSXPnecJdcGXNmHNUNXomJOZFRfWwvJZREZRnKpavqJOWXowRicWLKFjjIsPbQaZSbSeZKSMcVEMsZaiAUcrcsLVGYlujKIwKSQQyh",
		@"IQMVeBiCYGIkFBuyPjXVjxTTqZhVCyNRKoHbYqwgzBBDDRVONphBBBKXgJgeDyEzPSgbcKkPaikKkGygxxMJqFONwVfbfNMKZhWtHtXPqgopYw",
		@"ugyZLmkBfFnqlOFjHcioGVzFPWHUUTAPlPXjBpMBfWGPmNRjruIHYUwbEANwjlCbWkimgcyYWvenhuTCEhurGHSJZwFVjkhrbtuxYTknelkDQ",
		@"VLcWsnqyauoBGDrnHTASPnSlYZCzmBhIujWuXBhVxqOnNjmfKXfXPVxdafXSmwKRvNeUTddWpLkzIDiJaTLcmsqGeEvxfYyoqQvTsxfsCiNK",
		@"RSQFdUaPkYqJKWpkvxLjeHschGvxTjOUThIlaAHkwUmSikjkVuvEWlcBeJznEYjHhSyQAhXkfLzveDiBFzmPwiLjDOFhbSaPVysaVrVDzrXRoduB",
		@"LeClebccpKaJbCdLNDzNQcGEUejtWeuLnrYSkuSyEtqorHQreZWZSFshtfyBOQTrGgTUXkqjQOAxaJdDXEyrtINmtBUEjczQGEHfcqyMtwEXEUPUfLgjVCwdVxV",
		@"nHnsPNCOPYAXgyOOnYSIJgQCvUMgOCxmFpEjlPEPmEVHKnVHLdneosjtzuvTzfiVfWaiAhTXhlzkOUfQJvKFCvzcCMxfERqWBbTnFXdIVmlTfHzzkHKYBN",
		@"aWTAtCbeARwkBuElfOZqORvRxCFqzsPboFkEvOygdVamCMZINfoVEBAlzVhgcxqlhSoIGcbUJGhTkUMRtVFuxQhDIcAnmIdDbXCIWDqxkPMkBCseCYldqOIGZVjCppQh",
		@"qVDtLEedBqgLMClMLCsrzqjVkLbyScZVHdhTPHbpAlzNLGcTCZHksNFxBvUcwJsbOKNxqulpANetXQBqtCocPZhyblfLJgVuKHzWvpkwH",
		@"YSWypHXbLlzpWBmkwRwGyBwIxHMTWRVJgFpdVRXzMVNGoNpMRvPshOFhfbSTHjupzpIcMeBtyJhzENKLxYByxLyZDoutjVcExoyopEBxwbNDVxRuKUKzpXfZtrypptcgLbXIFUJ",
		@"HLUmUurbTgtWpQpapPCDJRgDyklxWatkaqVDFcOlJJTlaCYHoKYatmxcQJNrjxvnmwZIkMKGguUpEoHTbLsktuySrWnLBwCaXjFdzkXJxmEMsCWYDKbRKZj",
		@"BlTpHyhRxtxgewsJtdUWRXDxvWFeWvozhIhWkMXKfyrfyZOWjYzEMssmQtNzrOBVGlNyxkprEiCtbgVEPwczhwZmhjeWVsyiRkKEEkkNhFjeaHnYfIHBrskVBhMOgHOdaFyQwfs",
		@"WcZcWQzFzZobZdcHdSyBKdBjRxmitrXnvNoHAchnZHLOrjVfoYDGNBOWSJbNFqDTCxwJJSvVngMhRZbnwYhoUHijXIzVuAWJLlTrbCSHvWP",
	];
	return hPWzsNCOLQVUCt;
}

- (nonnull NSDictionary *)kNYxJIpTObOIwojKYuu :(nonnull NSString *)OsETbpaofjK :(nonnull UIImage *)SeAmIfJRkSxvVI :(nonnull NSData *)ogKCFbVcIuDIo {
	NSDictionary *WzSmujbFYOED = @{
		@"xvzOaIKfKow": @"WZShQTxBiZGRabxtfMxwikuRSXOwqrQQvmrGAyTvKOUVysxCqWTadHwuemWmhqrRrhoibYxHCIsvshUAnqoDIYkmnjcjghJQoosqpUpgoTEYWwYLSIfYzTuFfeXGgFQXMRx",
		@"WAryYGggeVvC": @"zmFpbmVqxfqTJasTdgyrBcQxPGpHfJYdOhhWtwWQojkDXpEahrFHbOzkAMPECivtpeIeMbwjwjvFBjoaeyDifcfLmmKsAQGzWEmUwqURaASyKXoTGgVfgpJbA",
		@"czYgaLlOcUlLfkAoHk": @"UHCpGWAcJffCxQTpJsrKyQWkAlmpufApswrUUrRrAoRitTsxdoZzDacMItBRNaqfnUjhcKbtveQreTAmbfEPcPGXLJADzupaAwFOgPcLHObNtEsxamjZkUHopHKRJEPYYkr",
		@"IxTeLndslFzRTiSuvBZ": @"gagPerEUvTbVvcUjUbMxxEumbuJRcNnvtdbNwoXLYXUhlVMhwujTUXjxNJVmooCigNpeTiBggPVkVdIEBwCvyDxGLIPYsISkODkFEajvWdVXHHwsFNWEaTDfQRDhVSKovQdqcNp",
		@"QCKjFUWBgPkLLzUbynY": @"scnJOJmUIoHBWrXrDluxhQQZgKHPlMaFyMLmLKCFacwjRjWNcckTCtLqmSAiaJkSFMVEtTGIXJtUGnJreUQhbXmNoYCrRjKkgdmLhQBYTHTYNafJLSeTBjXCYpTeOJPY",
		@"BinHUGMtqvDmULGZLAc": @"mHpaAVjPhVDnLBQgZecmREbnawdiEOpnUOJcLmAMfdVQwaTBCYDjveEExGXwOzMStSIpegrzKKIkwejWpzQnuqXsNePjhfrpgRtODpbMHdktqYaf",
		@"ZUMjOvfhvoUcSGIs": @"wRdAtJPzbVrQLMEmwxbtbpfRcJSRuEItavnfvwAYHHqBIRWeIRdOkfabAryhGUbgHSUTkDptPYOsjRNettZWHNTzFvaIaBzuWZNdIUBWELEHncuXDYffuDbgWsogFBbyPemfheWxwDipuU",
		@"zmYXIqBoFhYgE": @"XQxOupossWHPykoWdJdSZEgBzrUVEBBAQuXHHUQVWAYfyouDVjHZyZlgpqnBQkPlGdSheYGAbmGncHwuORBRbdyOhFYcdSRJdJZfNQGVXlmtppgKzSqOFuNbImBkzQoHjQWQudmoehGAaZ",
		@"ZfncNOcWEPG": @"wyfKYsZvnhMsPCleddUNuajQkyElJWVnslBfiKGaBgtFcpFHuJCFqIjFMxOcJBlBvfGQkoRPPSgttnHGgGebCbdRefQQtWPmlQPGRQoTcrLtNrVIeosKJlro",
		@"MNoNIMVpytduLKLwJ": @"mZCrckWZXdCvzTlntYJAiGcXhAeGuaAACburaxycmKcjIwBARUTaBnacAQfxOUmPgDJlXRBHufMlDHoESfxsckojEetSvSkwDRyAhVdZCKBoVAEOdP",
	};
	return WzSmujbFYOED;
}

+ (nonnull NSDictionary *)KkOabHKuhLKWfEueu :(nonnull UIImage *)eyBhcAZGHrmZ :(nonnull UIImage *)vLPWkMcBwDTNhqoOr :(nonnull NSDictionary *)CgzlXxoKNTWWdZVmpDC {
	NSDictionary *zoMoIHFSjK = @{
		@"XBFghnmuTB": @"nLUbPICUfwYDnZynFrMytKLNXMpZpqQasKIJiScRlnuqACLXXEoUGhMgNgNTaOIRYhEDVLKTKSCDWhTAYwFJhIZNrwWiWAbJrncxUuuZlIdWoowNzXgYdVjdtEJkMrfRJBUwnvrnhiayjcguK",
		@"jYzbBOsqJijENEjiJKd": @"xpBMKRhlNGyldzHKemGmzKEcXMwTcpwpfJwOLqxaCgAOjsXACEfoBijxmzmYttZxufHVEPqomcEnxHTPOitgYpvRsndjmAquoCykjcgxtGCCvWhzAXlPpdSwCGCWvZxIoBzyLiVUfNOmSIndCmu",
		@"jxKWhYIzfwqDXCYzl": @"MaiFVXwvwlPBxhEmPPhLDXIxUhhrywrtGtrNOkxVDhxaUbCWoNUsdEIuEPTPpemPusimMQsiXwYRPZXrrcVGundXDoqgCTkBXotHonvxpmkenodKrcHmteyTpwpojspknF",
		@"sfvGkhNfeBCjg": @"bkoqXCgiigLpVrvnnBwRcuZrVmotYaSPrtucSldWCWazFOGSIGkiyPTzUBoZeDfCVnnIZCHLpnjzoGDHqrahzpaXUQXdHiUQkbXxswfFNhtSf",
		@"dzVAOSCvliVc": @"RVbflEMEADURsqtOhxoWJViqePCdTEoqEMJQHXbxdnmGxynXrTjtGAAxCZZAoefdTKZCRovXeNyMeMhvYSIfCVJcHeVLINGjEoRrXcxjejGFWtssIibxrarvkonQZZReBLAtYlBbtGJVH",
		@"jsmBREzrRCO": @"OByKVVrqClBXYeveOcdCcrRqUvBdgdyvwGHGpdmwxtMImNBzEimQzZxzJPVloLqcPyTrxgtlGDRXuaqIStqOxkhJmFdvzHvpPUfGOVfw",
		@"qRYpQiGExDtRfsNR": @"wpQMnnKlAGZlzoWqmlDFrqRmeLjhetPECWKomgVgOjZcPGsrnmDfUeaioWoRKoSYCUdrmFZNlIabXrtMoJNLavWyELBywgxPkSrwkRNNckpTJXbngUiqdsvYSDwxluVSHIPTkMeFrPcbadHaztM",
		@"MMJiRUWcRlvAHC": @"KAXIeHCVZXHzyfPvICKgZjFpJiiWJObeHWyCWrrFYEFPaolnwDXIDXIlSmSmlqbMwQeuDxqiVWtbNCrSoTKDJbRLmboKLOdfKIUAkAkNCz",
		@"teBrEYKiokV": @"FWcajDsxIXeNReszrwhyxhSERPHiqfvHZONfwfqaCOwxShGbmOYIvORgKhLfxGYLxjUBauCxrGoxBLmdHKsUgkMUjhaiPZmDXujFwzCmNPyaZtCwiYWyOOExKrnAGOKZ",
		@"MUAeCLtyowNVt": @"OihylpYvRVRQCGNdYCVGuIagzxwDbvFmczorTXRobCSturtWlpltqRKQWKKIjJNAmpuVKdCzqXTOYTMcmVeGhpMOkqcnQudfdwXPKDPLGGeUvGKVKOPdhzYtEOqfHVoEo",
		@"IKMDziBtAmJWXKjxi": @"BHSsgIkedqjbcVagudpYhbZxYHfIbkWsXGnpMakhIfBMTHIixfyawcfBKndFNhShyqgjlgCCINWBRCkVciCwVJllFEwZMaEHZtAdSPAQNgjTavmG",
	};
	return zoMoIHFSjK;
}

+ (nonnull UIImage *)WOyGcKfBPuwTQaeM :(nonnull NSData *)ffJqZZOOFiwirbYTG {
	NSData *CvqYCQCKQWCKM = [@"BIyWoXHSWhzCVWHGHkrQtRHwKOMZxKXuQQONwIsRCAsQEWgMeBGUnsyjOBimVNXDAYqBrDMrXMYsNrnqyuBLzmzDBpGHMCHROmRHErUQKpuTmrsYodXGYMskXLDsWL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LMJKAJTwCQiODtJVAj = [UIImage imageWithData:CvqYCQCKQWCKM];
	LMJKAJTwCQiODtJVAj = [UIImage imageNamed:@"qeKiGiVMaEbjXPDugnfwFedgyUaFzHsSyVZCUBDrYlGjDegOVCDEEwXXqavBQAfbAaNivWpgmxTWzFBojqNstAiXvchakTGVhRSPQQpaXGPmilLxKVZcUmQXuXejaZ"];
	return LMJKAJTwCQiODtJVAj;
}

+ (nonnull NSArray *)XjrknprGKGS :(nonnull UIImage *)xcWasxWcLdO :(nonnull NSDictionary *)UNzbXAKwSAj :(nonnull UIImage *)bEcCxcRsCw {
	NSArray *nhZAOXRPrcAhERKKvuh = @[
		@"sdPxngIEMQHpjdVtwBQqxyqNhvLpPCyJTUvnSSBtZNDpKDqIdKAwFGMQIZmXVpuqoYjltJgKGYgWEbuEfBxIJWyyOcIAQiisunfrJzxicYAUGXeaRKpHmfkDhUFmRtIzmghaVClNTCbabuf",
		@"SmYzmOicQaaUQasoqpeFwjsoGwuNsgWymsQUemWAtHbnQPwVPrNmCrrgkKppRREDXxflYHyOorVcrPwSLSEhNdbtGQTTobRfozvVX",
		@"jebfolHyVAARwHdLtAGxQpzlORbwKvNJXjeUHHfVGLrNauRufhovYFghUIakupSikOwbMGPIPRSCqMVobBRWsRLIgKJLkRUSkTPZpBaBChqXvPWYDhoLluHGFpFAt",
		@"bovpFRERnrhvMRJCKZwzIUSXzeDZGlPCoRAJShlBMkQoCYfWatdIWVCFSVQRTZaezlZiUdgobarDlcVGwUMZhEvPiAalMDpjTixJyWEOPIHovEaCrhJSLJcvxbgZsUVhuIdWADOeGfLLWrb",
		@"tSbABbAvRUxINgtbwPswGaFvWaJYmWzHuFFjqNOJlvPcdsPHOzPuHGjUKCOkpSwRkzQuKrNhKncJHrCvrrDYUPDIimUUmghmIRpnMSoSMSVFYQLz",
		@"PkovmqrTigADRgQMyJJpNZxQyRUcaBzOSDVuTqcGqGkWTesRJClnpIVAybbEfxLxpjdvfXJbVXMgIqylMOwVwJcbQkOtZPXiTduItyUugovGFFndGBtMtlHxszv",
		@"wAFMaLArIMRyibDcNEXcWciFilPukbKoiVOPcIqtCCgGTWCySqwzvoQBfjpKLAvLOtwZxLbRSDKOmXrpQcVVCEEaFFEWJIMhKyohsOYymCQHRQimjOEXJOeQxfBjmQCIVHoDLJyGBMk",
		@"uFjcNREpinaYIQytELdHqStwGuTYpkRJeguhdaWfDVnTBZgWfdAUNuxiiGAIfOQnbbKnhpYHEgjmjNAgOcgZFgwCZwwHDyCYMCSBimsPg",
		@"RMOZHRqcUKPPiQSzYTScfRxBAXhKmOffuvchuLbygMfijvTisfjPHAVumJGxMxhAKuudowgKjsKtUtEbWexbSCfJegKcoNKeIJGmpQRUlkliJqBrkLCwFsaHquuGlkXIdsjwkhPQCjucn",
		@"CKMPjbwGqfTrrrOvniLjRzxmUeEMWKVBHJmxPzNaanXyoFtdGSXbCIlRFuIeSxguZHNVIjYLkGhFwCCVuNvERGMVgpZYXMMZSZIlcKnpp",
		@"GMfSxyUFcoRfbdcaVwgRtuCtwDYlPFWmhWAjkPZLLIySlVRmLzDUokZSwLZDgrBrqdmOfehdlodjStFWTNcvCGXlmzrGAxtRlyrjOJdyowEVfzSFElEVT",
		@"vHlrqTzrPpCsUWbjxeVNMwirRERalAwgVHEWKUtczFIyiMjMCRCpiocJiohgLxOPeBrvWOdsbhktYyhwZKLCsUVQYbYJvJglzeDdrGlvotrivQbCkbUdoVOsatVeGDHYypwZwy",
		@"owCbeEZJfLakRvWOrFDbcCLBIhIhKoGZHUoZgJSkUzyJMyeFpMTbBPtXHzoxmKyQqSdvfhNoOTLMOxVmCluegwHHoYdXwBgOwIbqGMHlcWuJAPiTMNYDxufdPxeOGOUJcrgkRTwJhDYf",
		@"lZQUtZmQCtLImNvQvcwpaMthokdKbvBTuVupTgERHJVqGhMsjelEifHcvMRnwJdrNWQeiMfYEyrssYVkmtjEpeABUBxzLhSnvuNzlJJpYnlhPvZSGBGtzMXiOsWelAbZFggwhwjOcizVpzJ",
		@"ZjUUdNRtzPSTaYeIVqyDRQaYDMCTPRtUzvKXPWdmnuLIEnRUtWdlWFgbFUHvdkiHwFMiekywBZyzDwpZsUqIVVDbJIuXbdqRcPXQINjPQEoMMllCySm",
		@"kmEOXzQTFPZithUjPTBikaxEtMADLstFjwUoksrAdblCxJfmmkIBGRPInZHgdpDpNVZmEuOzYgqTBdVpPAIxCEPfARyfHtcujEtvQWcjIhiPrBDBTMvUkamoEQRqAytPIiFgldWEYtPanvlWfIVz",
		@"VsKgAYLBOlGFwgaTfrfiEyPZlRuNbQhxBHPfACoSlLiUAgGgXefYARdrKlMQmcGSQneXaLBGAbxBSmZUWCMrfVPIdHYJhKMmJMUnpQexYojYVzfCZiDEfMGbPEboatciZXFHxxVCcRkXFzrGZaPny",
		@"GNInMLOXwTEdNBwZUOsrdjjuqbiMObFHqKMgNzDZbwuFDnJnuQtZUxfrxYkrWlasNTqaqlSsNpSDALqTLFLtRdWwPiedRlQGckXJdUJXpX",
	];
	return nhZAOXRPrcAhERKKvuh;
}

+ (nonnull UIImage *)qkAgHSrpAfYHnzp :(nonnull NSArray *)lItCjcOfQe {
	NSData *VCIqvWZoDEcxnih = [@"ChCtWCYManfGOxuclnNqkazrDtycKwXqTZHMbhbjgSaBeJThpyMDAMSnbfMtbghMZFDBmdsYhXodyvGTFCCbNAjssSEAkykdOrJDJIDnzAIRqGKjIxPICKYdVt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eSwiPYZlAfc = [UIImage imageWithData:VCIqvWZoDEcxnih];
	eSwiPYZlAfc = [UIImage imageNamed:@"beiRZwmEnZOCSHrQttPvEllzFjDDRmcfRxQsHwzamzxetaSBqXsCHemHaoGXxSKTEKJzDjcDUBXiWSYbnZPcQnzNIaMpwnJQbhAyKleRVVhTQV"];
	return eSwiPYZlAfc;
}

+ (nonnull NSString *)ywbJADrvHa :(nonnull NSString *)arypiuJQYAATq :(nonnull NSString *)EbJOnNGORhrlHkQNxO {
	NSString *MZbagQVmqeVcngGgv = @"QQMXusNTMYTsbhTLgQfSNrgBqhtsPyqxUxZmhHaKqYupKwbBnoxJbBylgYhTagOEtXHvDkjynkgDoRonIGyzQHYWilHWWiCUerpMHtrlCHYxTEszvVGwcJhnjfrbRMOgOtEaPyVoujefzgiDlPd";
	return MZbagQVmqeVcngGgv;
}

- (nonnull NSString *)xBTgurPYbQaMnaNy :(nonnull UIImage *)qShvtPyfwLtJVweJ {
	NSString *lIbLoeEqORIgivEo = @"eBjyMdEcpHelKpMcnHEwgsJSgUUvfNYgIvwhcuOiABWyvwoOtWaZCYoPtKOUEwhCGCWFiGxGErXHenGRIcIyFZRphoqTKGVPwdXTmVbatrpjHpTlrRohmh";
	return lIbLoeEqORIgivEo;
}

+ (nonnull NSDictionary *)KTOEaaLdVuQNFIJIB :(nonnull NSDictionary *)orURzDTcNeEVykTPjD {
	NSDictionary *sJrkMTCJdXdGvSe = @{
		@"nVHeJkmsCO": @"wcJcCgxwSIRSRvOYOiSDfAkBMiLtHbzocDspqvXKxvjoNckTQxDtuPDRziQgoUcpNMpzvGDooKjbkNbmwMmMdFhQnsUQwcbppDyyBSNrompzupACxsclZgvnfCDkkFiBHtv",
		@"NlhnQuFHEjV": @"snmnPHqUyvuwRQlnRsPdjNrHnwAEUZPQbzMldiWlxFYxjQrPZiowhZdYUyGxCJXQSreNOROFQhnigDWQRjGbtGTAVsoFYWyHovNqLQLNyBKXVADJUYnSvQXnRtVhKaENfbXXfqNphsiFj",
		@"rxVodBRgXmpjsbd": @"JzbSnDAgKaHQzUfxUFeMedjNSDiBiRkuJDtvZrkckgGJgLeErRFqJMEPhUoVhFqvAmsbhcxQgKBgdNfqKQVyMzjwayPeWjhfYOVDCNNUCbkvLwRIyTmucDFrOWmOVsMXk",
		@"mqTrIbUtlwoY": @"oGQHXfLyfCsBDQIniMBSokAfGHAGmVNwfHQbMizwRpCnFkAQqnEcIZWqFfJFjDMkChnwbTlXQbxwYzDXJTMdrhrzJyTDTXMWzoaUhQqqimkGzYZKxHzWgDMluLPGQeIjdXiZ",
		@"JNjqcxJRJNWcLHDPqNW": @"pqosbvZwXwGnQUXllkaHSBmtJLPCLctlLgAJbiNMWpKBqBKmTeTdmfoCTLVaYRvwBohXuOkuHsYOaCArEeQkqXPoaPnOzTGctKIsEvWHGeCk",
		@"QxLwYEsAuMMEs": @"iitlFhReurNGFWWFfKzqzHWoqMlamDCoVRTJMvBsrGLNFaWDGrXaXyXhNTJfSoyjrcWDqnboLDMIwmbpgtyZHHxzsNHPvuSwuyHCAWCVtyahfWRAkElLFFlaCSlqZyfltokbQWonzygnQh",
		@"dwmYGfkDFMadYkcxtr": @"XoZShhHdwXlrBQvrdSzKLZOPJtHmZnvawKzoGbrQCEYwimBvytVbeWwQBoVazctxYTrwqtculCBjbtIUiOJJJCAXwLHeyxyvcdgBpVAOkKmLbWCBYXdzJWhiexPAvnrDYXbiFfTuVNGteVDchArea",
		@"AfVwXeIcPKxfymRPZ": @"fHdSzHHmcrLrpWugufpPGXTcgOiOggJAzcwCmhcJCiTpnsgJtLCUROhnrVXiEqnkwvGRPdIcxXVGTrXtHYuOshOuvyHnzZuveQpUDaWgwQtXPvbKvIkJJ",
		@"JbEVtHOLzYIyRman": @"xriHwCGIoKhICWnczCwFXgpTycwuGLIrDnccaqimGpZWUNNgVroTVUZEgMvcHhDMxMlaecKsFCuKuVNrOvZUtaFmWdNunxaQqvPleKIBKpxvYfxdWNyOOHuCstxNpBniwqaPOqTBDATul",
		@"PnTfDIDxvYwKzu": @"DapcMrKcnoNtsgAjJUzxJmeBUIoSdmAMTVjOUQRfgDZAtTQkdIAgtyfrAIGLQRCTfDIQrFEIycOUvojMCnxOBFtiAajfDOjePQAqvsaTQOzVMRyzxqSnPgmRurFMoZMhzREsPx",
	};
	return sJrkMTCJdXdGvSe;
}

+ (nonnull UIImage *)ORnjQXrEnLlX :(nonnull NSString *)IxdiwYldwxdZoZc :(nonnull NSArray *)MjxJsELCWJoFwDQlJ :(nonnull NSData *)fCvPtGUmLMyTKofWwCW {
	NSData *iogimPQxxaX = [@"RTIWGAgHeOxYfxSqiqlPPJIDFZCzQWdstagdliICeXLwCiGpYyrxOgpsoaEWCzfjOUpEFBMhnuhwadSLRFxuVhCGPHjmFqjFwAJoBqdpXgFXjPGEZZKmDu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CVlYQxeQJvw = [UIImage imageWithData:iogimPQxxaX];
	CVlYQxeQJvw = [UIImage imageNamed:@"dmXIQuJgpoWTwysdbpstDpvKGFfjjqPzMMsBWiiTqsAaYCmTcOiwYXsmvHCFSLDhYWZnsuFuCNLlzBJVklhfGXfNUVxgjLWYiKikGYWOTwOpfZZlJehPbVabSHGRBlfptrqp"];
	return CVlYQxeQJvw;
}

+ (nonnull NSDictionary *)wTdlJIsMXJYZDTDix :(nonnull NSArray *)XSuQdKIHUC :(nonnull NSData *)xaVockDsBnouQQk {
	NSDictionary *CnIQMMeTGnUQhJwQ = @{
		@"uErSROUXaZkFetW": @"nBijmEYEqXLCzkVVfrpCJVSdtJNRYMOyPpLKEaoMdPAIWiniwiXbtUOkkAgKJvazLHKzzMUqWDrJOBAfWyhduGwccVtYPbKxANKXJvRRQQfzgPzMaoBwKVYsyHmlJHiuSBfGgtpMWMWjhUkDKpivu",
		@"pUvWgXWdExBGyszJNGm": @"NuYrNleyokyiojwZjJfflbVUAsrNwlIyMDVcIkWFrftRwalQaSPAxONpuosriLtEKeWuObDNHsBPcceSqWRjKaBOVwrcfXLxNEttf",
		@"hpVdjWNGtD": @"TIiYyHVfnxTDYVLeqvtolUomWlxBEXiUNzHXlEqMnesTECzLlNvawFWivoYplKCYYfpcxqwTEXnvPgIdIUpdvFunFlUqyrJxeWbBLPIKcWIdwqCYOjqCwOYxnCj",
		@"sOVYeSEplO": @"syXEOBOvPqanWAcgbfOztycwmsTXYjPYmRscgHpddUXAudmWxMvPuMSsmsotDBThRzWlUsvRZlUlwZVNMdxPzbYzKRPHlXWEgXaTJMrBQ",
		@"cBxPzXoOISKTkRMtk": @"TRAWkbaxpQeujIOPeEFsUCHPWVVNOSemAmpCcKlteWlTKsOGmwlAeCQvGaxyQEqMrHSFqVeCfIdzuznyibPyAggPGhWbrTziypMJqEfFdPPPeZAaywZDfYtiHySoFDLpevmqbeUVUj",
		@"CeKuGNxNgiB": @"WcbnwEjkJttJIrUEmolFGnAdamdQxswppAUjWyQrHZGyTabweNnwEdAEqBzPmMMhrQWIhMhaoUTmDQViUmAodcJnHTSrEYiKDMjQWMGjBOTsCBbauENWOqumaFk",
		@"uBpDfkERLWscjWceZ": @"oGCNATyaYCfmecbRpFTsfrsJYfEKksTPMbXSLGkXAjXIrmeMZPViUmtAgGHHtRJejUfQCOZnKYEtHlVZRByyHxgXqoTvWgCOhFSzgZknIQuaJBkLzAOZe",
		@"EhAXFlJjdNEvg": @"cvzKbLRhrARLeMoWhyrJYwSCdnBwUcoZaRawABTAbrzcjfsMGooxOzxxaZlYOJFdRcONDxAIhgAvEmuHtWnEwnbbQOucNOBOAPnOjpRerXGRysDCCTvrleEUugYYrqt",
		@"NoZFxxzOUeCYqAmXm": @"CwsUDRDvoEJVBMYeYayXzXnxXOYzChXvPmnrnhhWckNMyoROZEeiURQXyAQuBFUMYmQejazjEmbXIFHbZtMbAINfzDwsgedJQvXeYGpWUQFEUfqLZerPIvmHypehJuwmAqUCZCzBbRsSxV",
		@"YduTyUnRsKRvJPdNw": @"HpjXQKowxHUlliuzbkVLjWqDuKClPwHwdgxTTUjFqqvDgWolzcwpObiqaxyXjfKVJwLRuqzLszirIuYAIOOaqzSDNrJbnmziiFATBK",
		@"UxmpouSnAJUw": @"qYgiHWjGyIXfWhjlhEUYlNPXnbzopbvXQkfCvWYUcAjZZPqzNNTjcHrSXuRxkRMpwVkvFLftVUONGoWOOZlJHEyMvLlPsDiqYdqNRTcW",
		@"dnbRpbJHhSJZma": @"knoyJWtcHIYGUdioeiSJIupTYMpYXJNCqTEvHBBpQVZwcxnDmXbYBkLpHKsspxsSGciwaqFbapRnhpMfUlECVxlzzbCKMDbgpdjFmBdtbQuFQEFOoCNIXXfBAaKZcsmQuhRJpbQAGqINlw",
		@"KGeDnoEUPjRGHH": @"mLbdMHSlzAFuPBONFJNlaGkdqogoFwxryyFkIOdcZJizrovHCtiYJUcrLhYlVwsgURWOfKtAAeTSASUPGLfngFCXGWOdNiNuHfEvzPiBjBzIknAOeWBCYeHzPamFojqKnCoMUaROCXZhTaz",
		@"ZbHzXXoUsuJmgcMkr": @"TjgzzxmvsusqgKWuPzCepYqffDXZmTzUjQGveVICAwfoFtUtCXzRfVUtRvMVcRooFEEwWxtzsqABlJbMgBeoydLbQxmItlRCFsVSRBzqTVODPrZ",
		@"snyJyKjPKsksldC": @"tSmigAtJCIHIPLOZXPBbQbQkNvPlZnPpzAwrRXjUEGqeNBItokqEVZypubhpiTJqxxYNEcbtzrJvNbFiAwMnhaEdAVDowyvBrpxLEXPezoatBBQlryJDUUFvNLWOIUiCENwhLhNckt",
		@"moFGpJRWaDkdoMfIrMF": @"fhqtRCKdzCogqBHlMFVaPuYpHmcnSvxITTREQNIkShlselTFuMLcQrblZFcuLbxtEsEXocnSVUjiGJhyuqcPydGZbDqQbplcVKtyGxKFtPKJAfufIwmLbNKdFYmxnOBCq",
		@"IXbHMjmHaqHCEplrqxq": @"vmnUfXoNlJBtaGsMDCbMAOjCvaLNOvTGIqJyGjWVOAKmkUKSFoTcfMweOInrbfFnOeQrngATIdpSCCUOHxQzEFRonArJpuhEUjJwgvCR",
	};
	return CnIQMMeTGnUQhJwQ;
}

- (nonnull NSString *)iszKyZPqVjjadr :(nonnull NSArray *)RJRxTZbdwpMf {
	NSString *uGZApeiVjvuuGCNED = @"vRGAzUWXjBvfKveAcWIgKrtPtlgPThkYLCbdSDtNcBrKoSDwGPzFbtFKYjVuYDaztgGzLHybzpbKUYneDOQmLthjanJPPwhdTdkvqnmTHQBdSUTTsizueMXXyhJuZxZaiTjHQZaIQsOB";
	return uGZApeiVjvuuGCNED;
}

- (nonnull NSData *)ornaybMNbYjC :(nonnull UIImage *)mFgyNUJvxRnw :(nonnull NSArray *)DHMReFYWqD :(nonnull NSDictionary *)LkrIglFGUB {
	NSData *JuHuGIniMXZkv = [@"tcfiASpmklfmAohGTgOGcFiyRhyVZuadzvLKjEPrgMFDIxdDAOAvOpqnhYpjGHGOEELSOyfNWnTDGPlOehjmOWcoqgwBOkIHsWFVYpXBUEWVqUwZcrVznQfoEZsrfTqcoVknGqXydsVIGjxMNWMi" dataUsingEncoding:NSUTF8StringEncoding];
	return JuHuGIniMXZkv;
}

+ (nonnull NSString *)jcMJysCZxj :(nonnull UIImage *)qOFMULcIssBzRXB {
	NSString *SKvnozEtIwskxHjWssB = @"naIBjdUiJRbHhGnungAzvDnlfqHjwSIRqkatwAiUsOmWeeGgqlXzXhzXkEcEXkmmaLIlipjroGZqgGuQCBIpAaMydeiVmLGPfSDiBIRylEcHNWVGqQnQChtfmpxJtjycKmmvBujCEeGGKhhsA";
	return SKvnozEtIwskxHjWssB;
}

+ (nonnull NSArray *)BTUAXJlRAJ :(nonnull NSArray *)JOcyaKpRco :(nonnull UIImage *)rAIHWJlVKalNs {
	NSArray *kAtilJFagAcnXIgQzJD = @[
		@"nGFHEEXzZCjpeGDDyFqSNnirWnvbrHGTkePxKvxSYzfYNIuLZJIlpJbrpuFmWNluOFSkUwfFtlxSuNBohPuSgyLzszAVYlCqPcdfeMd",
		@"OJVwgzZeZejdFHpMLvWZNsJxaieCjSOqrtFGXiPHPPTJeZTzoBWtcwFBVboarsYweKjKtHOIyrfBZxAWuUgMHYXprmexTkNxgKKYaiPjjBgUOCuMPKskrjXJTzJBHKryGKJCbtqr",
		@"uSEsHXaURawFsCLLUxNUeJZjOovygOAGZXUBOJYNVIbjTKMHfqZjmCjTJTqtAjglwBSuwMYuVbgNTXJqJTGfhgIYXbpRWGVmxoMbnUer",
		@"qQvEctpuYnZyudbRvZPFsTjEmzOqCDaIeUiuQeigrSyqCiYvPvTldAQKMxYVptBEoMDgWZMfimzHxIOayDOTnVULldQbCcOpcHZLHPlhvVXXrcjNFB",
		@"UYkWRyeRFAsYhMZAasPDPZDdzjaAjwvzwsyquGcwtdzIFwLOrpOGsLICSuhjVPXkiRrLfVLicmTBDENpYcTSbLumnhvSypZDRJgNakNNWKJYfhLUTUh",
		@"JXPpbhHbdqLOWthrZZRvkObKUhFRtYiCyCYVnAfpLIdtGZrCOmHEDTglBaSwLhhARZKSIndHLzCljlAHXhPkhbsJsswlSbnKsrxiqrHQWqnAhccGHniaPxUMXHKanoiOjohYnCQx",
		@"oXpYvDgcSfCXTiIvSjnXHyrOOGPmuvjGCdJBjrfZCSByThDgTYUesivbEgCWgOrSkafHAIOwHKjiPzFhaRFFEUBZPHMwmPDDzBeULhxnYHmbKIgPWIvlmavmGcqkSodvYdSsnmmnbVMLJuE",
		@"wpbmFluAJKESZoLjxUOlbTDDKcGIRwcBcjnGSFceYDqmluXcklDhSnOfPRyOgWhHkigDJdHqfOrFNgLzSmGWPkSbwLSfsLPhMsOqnaCtvMEULtqyxJaqFaSSvFAVEbHrTkwmRzFesOHJBwnaFBim",
		@"ZlIDRDVdeXZeTXudspMAAImTzGKkPZzUYEZaHgZNhfRhWvuZbWQMKVnADmIyJYisNMsnyONquLaJaoaRCZQljDtPOnoZjcRVNJKMRUAJTplFcLeUswKDWeDAFmosTLMugIa",
		@"HslAjZXGdpleTNMJfSPnWLsIJjiZWIfWpeDNfMpaIZxVyXDItArfOQSrsMLuAcREfevYFJsmMcMocUMICXonxseyNbHCMFnFleEeSXsHinMCoAELqIWIXoxYcYMZeBvnRGgoQo",
		@"OjedSZXHRQAMHfyYcEhyyqFRnymoUUmgvodyEPaMfnLdRcsGTpQNAaBItFSgaxHzFqaevweiPmVzUdGQWRlTruRmpMuiUiSsIXpDdDWECBAYRIRauIIoDAJgcrNKVv",
		@"BbVIiecrSlMhYbOxsOGrtkKlfHpmXxSsnoFFNkeVnjacVGlsQOQygcAunmLHrXTxOcltGGsotxpLFyUvhTsNueCwRGGOmLUKWkoWBL",
		@"DSuHDPncdJXQetkoWUzNjlDbmUPZJkLzZrZfqqrWkLsqZsbWfwkXQXtzXKWITMtHCOwMbyYpMTuTuOeIizzXZTuRXSoSTzpCjILhnCJArmLrJYENitsQZGukcAOpwlUNTxtkczxaz",
		@"pJgxGyDLxhFsljNdLyLejqDNWiWSEaLFcHRmIhVwWPlQmKjETyqaqcHrZRqRGSszrnaKwmgeWTloMizstvBKVZLuTnGuGPNEdCuIrDCFDZXLEfxQRUTZiqAOxjUdsyfPg",
		@"osTQrNgmGqFbKlwdvanovHTPwlncHrHvqnXlxKncJEzoMHenHZaryjVSpRfvYUdKtFGqhCPRnwZGCAPUTytnPytiCQfEwyAipfbcEQcVTsPGCSCzCfsrUNLpUjV",
	];
	return kAtilJFagAcnXIgQzJD;
}

+ (nonnull NSArray *)MWSvudorxL :(nonnull NSDictionary *)PjMkImboLwYbQ {
	NSArray *UKvObCGIHGpEVpHd = @[
		@"BmaslapzgRaGfVsXRQaiTfWFftmiPufqDKoogKBmTjiBlUTPxUwpvMSHajXHvCjsUhlEjEXfoQNDgUKYjFnhngqVchGXuSpgtLbUVgqlJDyIrfDBBjnPvBuBiWchrHS",
		@"DzBvYUoQGparFcixBBSqSMgNSuaqOoCNFGfXISfiWOQxfAbTvclxKVCZCeVYMrEpIImmeZCGKCRsviGuPWvRtuwFLebpjqGcEeAsklwZcqVZWiQmztMOKTnLnsAjfxhKMNUTOfFUTUhxWnbRVlXZK",
		@"ZoKYgNbHtEHyOooXmmxBrxmwYjHESIbavGXBtQuYojffnGyucscRzozdvqtaAqRlWrxvKFDxEfAPFTUUKqKavINkNeoNDftSpFrCAKeqcIvjxCMtqLDKyD",
		@"qCgvRbDKbIPgnBmnwRPoeLEkOHGZLHANMlxJaiqOfJMNlgsPiWHAyaWyWJcrzSBqIrYlXWGiOPYpFMXQgXDtAssdfrTUynUadIhTEwghfXySpPCCjgnINzPcnEwYQOeNjjx",
		@"ioGlYCyGzZuCVFNjmzlpNQcQUBYxExLxGJMIKBAiaefOjsbDVflvEezwLBjrwCMVHsMpOqDjQhpRUinloJUXfgPzeGPzsuNAmSNrLgoHHtTVzsRcNjLCDajtRlrF",
		@"qwQGPrMhsEQnjYQKoYtcxTnfziHZxLeLwpqYUvhbDuRnHdJDTlbVpadpzrnWwGXfZZGExQlmxAcRLVNdKUyzFMxBLWiaBqvHtLEAdgeFfEzMVpTaTLhOQQBcxMq",
		@"kbtcKfmbOGcJQCGiaSUZfCOrpdFOlnloOiCfeoCKAlkwwsqSdbIXYbufRnwhtDyluPqIHDICnJvujafceNCrsmNFgUbIIMWvTbtozLsFYZgnhRAmCxDKMdIbunBHdNnCjnhJcEFVbMUinrDxTRljS",
		@"vCaRhzhfpGqupzWyJIAqHnhvZBsZKSxUZkjgYsqhohJjVWISRUwtvcsPpiuxxpJrdOUtbzndVYXxpoFBYzYhqOgzTfOpCEmoxfRcQhgFFTUpEzjYptTxnvjwJ",
		@"HVIEQlqAdtZYOAyhvTjkjFdknizWPtkHpTZVpmtYIIZOWPpZNPBHyoCqRmAvTdAdElTewWDOANljcHFnXCYCRxRxudRKbRKWshhzzwmhkcSztSQEZSh",
		@"cGNnMZyuDgdvZWUSGNETxxYHRLIXzEgtCksuptXXPhlrmHibUpmDOVADnNlkGnUDwAHDkjlkCkRfEuYORZXHwHHQFCCOPGcQmixZtbWORlMTtFLHfohKvpwTzrocsdDCPFIafZbQvrAu",
		@"BnlEQsovCLxASMYGhwizKYuUveaXRHvSnjzBrftVFqbnMDoCFDqNvtAunttdezSXPwfXoNBVDJoIySStHeeNnxtTpjBbFQYXjXJxjNDaHkOJFiNzVLYUPxHoBJgzIoQiBPQiyXaUfCmaUauDyVON",
		@"wmbozQNpTYnGWQRfbjGfthWSMbuKXVrkvKvhbnuLBEGMUqrmivkWSpEzGuDfUIqVBhqOnSmgRPNlPsZboZGAvqKJHqkefKhZDXBNriAoCNVpFpRHhNWYmUESkdJpuSTLPSEglmScDFA",
		@"eelMZiUzbCgcUNmXcRFiLJDIQeygsvZbQFCxOCkHONcRBnxiaXhMqdOsYBjJNfAosJEQvERePRJocKmLkfMTuwzmkbzJoHBHvfRRJMsfQFHbDFXsNxvgjzmBl",
		@"AbJndGVjsvlUHwEQHWmWLSCoQntEYukBNsFIldIJujXamDPKNdtLvgvhyZgaxLATtKqsXNbiEaIFPZUqedDpgQdVylgcbBMHAJXkhuBvQxICpaGrTJVuHBxVXtLGndXJWxrDcpesPBoIjYyLlj",
	];
	return UKvObCGIHGpEVpHd;
}

- (nonnull NSString *)rvdtCSORLG :(nonnull NSArray *)ScnqKesKnaRdWc {
	NSString *XSgJEvEUtwNDexx = @"UzWHZzZKWwSRGBJMQsUhdWrFMluQkxiFfbPRtwBKADgJCupyagWRWrCehWFZLVkcRGbvwFrQcGOvWxCauNESJaGOuINZOfuMfeQNzeyVEttqdyOyCy";
	return XSgJEvEUtwNDexx;
}

+ (nonnull NSData *)QdkZRiPaBu :(nonnull UIImage *)NUwXScyjVpFKBPhY :(nonnull NSData *)TawCibbndDOXhxIUZ :(nonnull NSDictionary *)jNaQBRbrBkD {
	NSData *iCpomOrWwqg = [@"GifJARSNfYqNRJQWbMAuvxNnHjRXcBCrElCVXJlakGkWexWxPESnWGbvvkbDSsGLyrZxzHNIIKVNFJkfoNfLoniDqRCIVayHzrHrRMldJAAEDQDGnQxQqbVKAoqvErHkbhFJRvjSxM" dataUsingEncoding:NSUTF8StringEncoding];
	return iCpomOrWwqg;
}

- (nonnull NSString *)oddbtCAbvyzJsjZaG :(nonnull UIImage *)aScDwHQDvuJG {
	NSString *OqkokIrxCjrwcoWuG = @"gasgBGTeniGoZzSGoJJSkTsKRenNpTRISjdcAJcJNJOGIqVlYrOcZDSJUikizpkCzogXSJJJHJDjEEPCoqogsNFbexRXPNvqfIrBHmUEGszOHRnehnHjdDK";
	return OqkokIrxCjrwcoWuG;
}

- (nonnull NSString *)jbOIMHRiczpkZ :(nonnull NSArray *)lrRHouSypQbCcFpM :(nonnull UIImage *)HilzdsyfUKGXRv :(nonnull NSArray *)utnWGjofuo {
	NSString *quyvtmNKOmETdqw = @"EfAuzvRypGadTBZLemfCdXEvjQreBBQktzirbkQBmoCVqlmLLGLXulANWOKpbXpWbudjNTqaDgUsAmmxuYPHhSIjjzhnpnQIyWKUcPrVCFzXPkgAYOOxZU";
	return quyvtmNKOmETdqw;
}

- (nonnull NSString *)lygcqjLvkOymjFFKvIf :(nonnull NSArray *)OpLrxFzDCrShRJU :(nonnull NSString *)weCBlOPcmnLb {
	NSString *fqijzlLuVAT = @"DCaQIGyughYpzqZrkjZPCzHSKIfDyBTZgEaMZCKhcOJnCpwQAteOFPulcpqroSipAUSNChBZtlOSFqzCzPvlEGymtNGhLeaLbyWp";
	return fqijzlLuVAT;
}

+ (nonnull NSData *)NkzMhpRnNosaEKtx :(nonnull NSData *)EKQvjQgynDBqSVgdB :(nonnull NSArray *)RUjWDUNrFwOU {
	NSData *WDDgdmiULsnPXwpqRP = [@"dVnWtMVUXEvBTZMKorZAHXThgUBAEImyfGEElluNjeKImbFavdufWvpPwoUAojvYpXCBMbDnwOWOjrFYISPyACmOcngkhUdniEgmKinkDsMsVHUedWBvozZGg" dataUsingEncoding:NSUTF8StringEncoding];
	return WDDgdmiULsnPXwpqRP;
}

- (nonnull NSString *)WjyQQydWPrR :(nonnull NSArray *)qrfPnaQFpZBPwT :(nonnull NSData *)RvQxFauMCaVssxkDG {
	NSString *YSzLpbCVRBzNEt = @"XUuWaGohsqiBnCzMwczmojrruvJOuFpJMHUNlzqQyffMQVUYbTOPKdaRHUDpHbGNOxdNpfRFElDnCiTmlrMNpvHRfWLmFwsrUneGmwJ";
	return YSzLpbCVRBzNEt;
}

+ (nonnull UIImage *)EBNTfftLfa :(nonnull UIImage *)OFvWzYMPROEoBN :(nonnull NSData *)ClFNCeVJBANghJi {
	NSData *PTvJwRkxUDRYYxpuN = [@"GASUDSpCJfucKUIMabsrlDeRcDJnadWgqyGUUURUCxIZuYHhYHVEXHnPINCsZidnUvGsVGywyMaMNAmdaqJGqucAxJCzPpNlhMYCQriYjbzSXGpwXLmbFbFBzeNlXuAgfspSfdmlxh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mASjYvRTtkCTvXzQKGV = [UIImage imageWithData:PTvJwRkxUDRYYxpuN];
	mASjYvRTtkCTvXzQKGV = [UIImage imageNamed:@"ALcWdKhjKLHvEfqmUcQrotnfxHiFDjGkXEwFuUyjLtguhqPPDKkghYOcuIKfbgpvLuOEiVFpuGHRCNpsrnZbzAaLULWyNKPOYNFdNXXbyeaTrjhFWCZrQDdUJSwZE"];
	return mASjYvRTtkCTvXzQKGV;
}

- (nonnull NSString *)crnHahFlcR :(nonnull NSString *)ZyzCsrwVBn {
	NSString *cFaKxGOxDwrpyIPQ = @"qNEXoyHOcieMrpJUVLDXIjNLEXRgkMpwXNmivkkOiBsCidRDXOyCTwxRYwJFqltWpsXxLxlmAzYMPWOFfBpQhMUxYGMsrhkpLqSbbpqmtnbYNnkGTeV";
	return cFaKxGOxDwrpyIPQ;
}

- (nonnull NSArray *)sbnuBPQfzNTFJxG :(nonnull NSData *)pzpdxBLheqhKwUnR {
	NSArray *IaxaizMDhLUsS = @[
		@"uFWuEKLpwrCElfBDyzUeqrJfSWxDjdoimMHbnGafKXlEsMLEwbHqfwWNppVGqlAWGWXGIUHKoNwuCGMpnKXKbOWrAzXnrwlNYMvbYSWpWDhQ",
		@"nyXSAyFAofzmlymSftkOKtKbTegBqEVGoYpHxeYEPfbCUNGSxsvbeDbWDQKvpkzgGnzaCTAXEPuGDKfZYMrqpybYjOCxWYDBsVaDYqFweDNPbomuakiXwpiEMDDmVoRjGIMZqfuTWkRHpi",
		@"pHFjZlexFiFRAwROTGCPrZmKbIcmLCvGznKWTROaGFxxDEDEdWrxwxXQhURtCKSoqOQfGHAuCUGkGfGtXtKJYcqXQFuTbVKmwuuENJJxVxaknhjNmhtLDydqhAunUKLucpKTFTwaEMahVrrZyt",
		@"VNgGAwNrXBvsLfYBsbjRuBRWPypptKcUEzRyBgLDkUWQeiTTjUqKquyMshsfolTRqSWyFnfHmDAcFZiPRHsYHGWJGdaqOYpeBAyiWOkDvPxrfSvE",
		@"FKXvUiyCFYIbUqvFsdEFnzQDTVrUCAitjaZsuWxgNMYbzClbpgFjefQWxPBhIXIhrRvhxJlMgLAdmIKFyHmratJPRxpYfeANoJcYNqIPnyFhbwIHsXEQGopytSboHuvX",
		@"tgGWjqCorhyDTNisVqIhDvclcZwQKBtGfBCrWDYKePxgmAupVDSZtAdnlGlVUpXiPoYPKSgBZVBEOcBqxjOnWYfZvaXCGXTFfiaWcsfzukXCRmTXdwFiXNcdWUcpkiT",
		@"lBbGbWxFTUIaSkJeOlbkKhcNFQFWxvHqjwpNuKTBnfZDBWmmieuEQgJqmNISvKziPWghRHgOTCQhEpXzjhzOgbnVkldqUmAHSFcrxY",
		@"WYUovbrNjIJksfNeOEBWrNcFhksPSIOMOWaZDMqCHxmCnJtjqFOQHfJZyYoLKqAEvohplQMeHlmDZZVOqJusEkuLsGkGyySsdBuuskTMeOsKjM",
		@"qAsnxCJAtEfmttcHOakRVpCDQCCDHyFnOFDGBFoITAjhYGmZaZlCssibBpLpabfJpRSYSRjLrKepBCNXSVrbWRiaJaGNHJdCtwQiXVOdQAgLPV",
		@"xVKoMPoclwvEKiUdEjrULYOIKKQsVVTvxVhXLzYslDVWmOlqNojlOUbQGeUsvGIvLOWBYjnrXmZCIRLcFbTTqWudkGvFxteVqCwSSFRMYGxJQgeyVssqpNNdAsswfGeprtFagOuaX",
		@"ZWDvyxPKNKjNLvwZuPIAYSVOBoWqYGXFJcdpNTyecFYcjskNYrMzkkDQISkMJfFXjUzPkaLNMVpBuFkOQFrYcKpQZqGQxyXciWEGJXDhIDWtBYOsOFwxmWhrmlK",
		@"fFZWgYliqSKPEUKZUpShaDfmWPIGxTaAucpDdoxvPnldIkvYHHsayJQMfzHBUyKMIyIvYjwxaxTVgXWdLvwfXALwfRHxjEOjtacyxktYqbWWUZipDlzOVjpmKHAOaWGgrp",
	];
	return IaxaizMDhLUsS;
}

- (void) setUpUI
{
    if (self.CourseSourceType == CourseSourceCourseStudy) {
        self.title = self.courseName;
    }
    
    self.courseList = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.courseList.height = self.view.height - 64 - (self.CourseSourceType == CourseSourceCourseStudy ? 0 : 41);
    self.courseList.delegate = self;
    self.courseList.dataSource = self;
    self.courseList.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.courseList.showsHorizontalScrollIndicator = NO;
    self.courseList.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.courseList];
    
    __weak __typeof(self) weakSelf = self;

    //下拉刷新
    self.courseList.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.isMoreData = NO;
        weakSelf.index = 0;
        //获取课程列表
        if (weakSelf.CourseSourceType == CourseSourceStudy) {
            [weakSelf getCourseList : @"0"];
        }else if (self.CourseSourceType == CourseSourceCollection)
        {
            [weakSelf getCollectionCourseList];
        }else if (self.CourseSourceType == CourseSourceCourseStudy)
        {
            [weakSelf getCourseStudyList];
        }else if (self.CourseSourceType == CourseSourceCause) {
            [weakSelf getCourseList : self.zttid];
        }
    }];
    
    // 上拉加载更多 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.courseList.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.isMoreData = YES;
        ++weakSelf.index;
        if (weakSelf.CourseSourceType == CourseSourceStudy) {
            [weakSelf getCourseList : @"0"];
        }else if (self.CourseSourceType == CourseSourceCollection)
        {
            [weakSelf getCollectionCourseList];
        }else if (self.CourseSourceType == CourseSourceCourseStudy)
        {
            [weakSelf getCourseStudyList];
        }else if (self.CourseSourceType == CourseSourceCause) {
            [weakSelf getCourseList : self.zttid];
        }
    }];
    
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return self.pageTitle;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.courseArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CourseView *cell = [tableView dequeueReusableCellWithIdentifier:
                        @"CourseView"];
    if (cell == nil) {
        cell = [[CourseView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CourseView"];
    }
    
    if (self.CourseSourceType == CourseSourceStudy) {
        cell.showState = YES;
    }
    cell.hiddenCourse = YES;
    cell.model = self.courseArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.width = self.view.width;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.view.width / 5 + 20;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CourseDetailModel *model = self.courseArray[indexPath.row];
    if ([model.btnstatus isEqualToString:@"2"] || [model.btnstatus isEqualToString:@"3"]) { //考试详情
        MainWebController *examController = [[MainWebController alloc] init];
        examController.webTitle = @"考试详情";
        
        NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@&testid=%@",NetHeader,CourseTest,[UserInfoTool getUserInfo].token,model.mainid];

        examController.url = uelStr;
        [self.navigationController pushViewController:examController animated:YES];
    }else{ //课程详情
        if (model.mainid==nil) {
            model.mainid=@"";
        }
        
        NSString *chapterid = model.chapterid ? model.chapterid : model.course_id;
        NSString *mainid = model.mainid ? model.mainid: model.courseid;
        
        NSDictionary *parameter=@{
                                  @"chapterid":chapterid
                                  };
        NSString *url=[NSString stringWithFormat:@"%@%@?token=%@",NetHeader,CourseAdd,[UserInfoTool getUserInfo].token];
        
        [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:parameter success:^(id responseDic) {
            NSInteger code=[responseDic[@"rescode"] integerValue];
            
            if (code == 10000)
            {
                NSDictionary *parameter=@{
                                          @"chapterid": chapterid,
                                          @"mainid" :mainid
                                          };
                
                NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,CourseDetail,[UserInfoTool getUserInfo].token];
                
                [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:parameter success:^(id responseDic) {
                    NSInteger code = [responseDic[@"rescode"] integerValue];
                    
                    if (code == 10000){
                        
                        CourseDetailArrayModel *courseDetail = [CourseDetailArrayModel objectWithKeyValues:responseDic[@"data"]];
                        NSArray *captions = [CourseDetailModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
                        
                        //到课程详情
                        CourseDetailController *courseDetailVc = [[CourseDetailController alloc] init];
                        courseDetailVc.courseDetail = courseDetail;
                        if (captions.count > 0) {
                            courseDetailVc.captions = captions;
                        }
                        [self.navigationController pushViewController:courseDetailVc animated:YES];
                    }
                } fail:^(NSError *error) {
                    [MBProgressHUD showText:@"请联系管理员" inview:self.view];
                }];
            }else if(code == 30030)
            {
                [MBProgressHUD showError:@"未开通服务用户免费课程已达上限"];
            }
            
        } fail:^(NSError *error) {
            [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"网络错误"]];
        }];
    }
}

@end
