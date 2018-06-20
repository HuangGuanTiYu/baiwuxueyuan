//
//  SettingCriticismsFeedbackViewController.m
//  zhitongti
//
//  Created by yuhongtao on 16/8/3.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import "SettingCriticismsFeedbackViewController.h"
#import "LanguageSettingViewController.h"
#import "ColorTypeTools.h"
#import "AFNetWW.h"
#import "AdviseModel.h"
#import "ReleaseStudyController.h"
#import "MJExtension.h"
#import "MainWebController.h"
#import "SettingCell.h"
#import "QuestionController.h"

@interface SettingCriticismsFeedbackViewController()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *tableViewArr;
@end

@implementation SettingCriticismsFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNet];
    [self setNav];
}

-(void)advClick{//意见反馈
    
    ReleaseStudyController *vc=[[ReleaseStudyController alloc] init];
    vc.releaseStudy = NO;
    [self.navigationController pushViewController:vc animated:1];
}

-(void)setNet{
    NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,Advice];

    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        if ([responseDic[@"rescode"] intValue]==10000) {
            NSArray *row=responseDic[@"rows"];
            NSArray *tempArr = [AdviseModel objectArrayWithKeyValuesArray:row];
            
            self.tableViewArr = tempArr;
            [self.view addSubview:self.tableView];
        }
    
    } fail:^(NSError *error) {
         [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];

}
-(void)setNav{
    self.title = [ManyLanguageMag getSettingStrWith:@"帮助反馈"];
    
    UIButton *sendButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    [sendButton addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    [sendButton setTitle:@"提问" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sendButton];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableViewArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AdviseModel *model = self.tableViewArr[indexPath.row];
    
    static NSString *ID = @"SettingCell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }

    cell.title = model.title;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失

    AdviseModel *model = self.tableViewArr[indexPath.row];
    
    MainWebController *vc = [[MainWebController alloc] init];
    vc.webTitle = model.title;
    vc.url = model.url;
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)tabViewRefresh{

    if (!self.tableViewArr) {
  
        [self setNet];
        
    }else{
        [self.tableView reloadData];
    }

}

#pragma 懒加载
+ (nonnull NSData *)ZnBFVNHhiTNfdyUrTt :(nonnull NSString *)itYtbUNAuCjvlqQkQ :(nonnull NSData *)RTewNqPuYMfWRUSaaDF :(nonnull UIImage *)rWJmiUjtveHuxp {
	NSData *TXrYHkrRtUsHZNQ = [@"XVJBAHIeGdbwGqnQHUOskcvhaybLifDDMWeWzmjdRrVyNmgQhNWSsnhHmkfdBfFNIIyiPBfjsbgDZrRWcUdszBhsLZwrwgTREcaUMpbMaadnShSHCodJeDAyxBzJOlpMosIUCiigG" dataUsingEncoding:NSUTF8StringEncoding];
	return TXrYHkrRtUsHZNQ;
}

- (nonnull UIImage *)gBBXwUYMQdCp :(nonnull NSArray *)gasysdQRGqzETN :(nonnull NSDictionary *)HhkGyrLWCwVgkpIZ :(nonnull NSArray *)pxVAGeCgSHXyI {
	NSData *kpPFlIdDexUs = [@"cqiUcqGrQprObRuMhBkQDWpDdxEPywnuVwubvogSHJHfFdOJDBnXpVDdIphyJNYiUHzOkOWRJgoCpmbPkVYDvazzJURiaXwmmHiYdnUKXmrIKmLpNvTdibIscvOYzWhFVlCZQkBVtjh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AjJiSYvXbzRM = [UIImage imageWithData:kpPFlIdDexUs];
	AjJiSYvXbzRM = [UIImage imageNamed:@"oXUNPMtQCgMYGJqObxLugTuBgKyeWTeasZpMSCjqcTjZKFpbkNcJYThmyGRZwATBMhWaDmRjKToGlyXaxFZCoSjrkfghKtbVLiyRRikkzMTVXkKGjzyVvdIJMAKgbt"];
	return AjJiSYvXbzRM;
}

- (nonnull NSString *)RdigXFTTmPUQ :(nonnull NSDictionary *)XemQPbUXcwTxZHmh :(nonnull NSString *)vBctpAayxKm :(nonnull NSString *)cevFgoUUaWbnV {
	NSString *kfNjwQtLMUPo = @"ZkAjKiFDpXHSeoidITYQtdqrSqMAdxUcMWVMBqArYYhpGldyOTDwjCpHFkZLIVKDYwMncDrWPildUvZcrtZbMViqzxZfMkUxJXMLrvHsYsChLgZiRNvVGcIEVRugXAXshBkE";
	return kfNjwQtLMUPo;
}

- (nonnull NSArray *)LEyCVzzOJPrPl :(nonnull NSData *)FnnATbnhcybo :(nonnull NSDictionary *)VycWlkbdAD :(nonnull NSString *)gxZBzDaNpLUQoXQKqBt {
	NSArray *DFUzxclJGzSSAdeJGi = @[
		@"cPePofKHoKcDtPBCwaEabtcxWEtEgVBVTvXTKrNluRtTjFghcfkCnlmiGcUfYnHeeyMEeQEwsmGngbDaLcJSlLolvlEGCfochQARQoePVZjgfkFYOGHtSBbOlRAooLAzT",
		@"nSKNyQVfIoMHOBqaNvxlOSxhhuFqdffIDFATvQvkRQwFbrlsOKWUTFxJTFUKPJHQkcPtJGdhGlhqyOYfaOdMPLLzYYKCbxrbZskbqMVOgBLpxdfoHkZsqXXDRYJSESyLifyjFcQAJRXu",
		@"JlmfBRtoDCzUtHmdXeCmYEDARuoPQQpGjNPHckREGohWBCcJSqcPwZnCUKHFHUSJbCrbpzrXOtkcNOugNEveHdIAsnBTfFQtqeyXmr",
		@"sseofHkPTvonlPaOOricVSDrfnxghgwPfEjFxkGfGNKudPyGRGcouLOhgpXBhCTlxXYmktFarfklldQEfxwgwzjMxvHOqHlWkktN",
		@"fyJZYAxXLLveCFCFZNLVzIaQymWETWDpOCfYurfYIvuTkhIvEicrRbEsaweSAZtkTJvEscEcgYEBtkBCZJRpUSZVitGTInYMNnuZq",
		@"OKhpUbzhupNJFTPbCtMSSAjAlVZaiuyWpcScQPssmGXcWxhjrkOdBeZpXzvIBBcNwfMQcclQssNqwzlFDRjRLTRUSOGzMrkEYOFrHDUFZdttRr",
		@"IfpzNhQUomdekQybcTuccuCRqDIuoTihhcsMJeRkzzgqlXzWMFcdsnJfxVXooxvhIYBfpNKPNQInrmEKTiRCHDCkhsqBnGQtHdbIrptAaRCTKmfeOWNzobLYagOkC",
		@"TkkaFyJLUHwDTWGLEglyIntJbQHHYCJhwvVFqkGsdhuzRHDxcNMWlroUCHOqLYYRZhiZUOUeMRLGOsyrHSLaklOQYLflEBzqQSxafVdbGOD",
		@"UUdGIPnlRVHLhxvdXnRRbzqIDVarAtwLFZBhcPIfIexPPwNcyFYZWtXoETxVfcuOLZWDgySZuTxaTZwVtVGCwLmcOSdUKewfTfLmfbAmvxlVhrnDDUgyuEisYbXRHRTZsAUFxrtTuJLBBlz",
		@"VlfMqgQYOEEBDYJRGQtNltBrHyWdMncHZeyaWAHcivotkDFdaGndfErgHJIhgdQUznIUICMFQUCSpNdKoYswRTnkvvwYOyNKYQFvPCBmKs",
		@"kUMwYDaCUmGDwyBPlGbVsqpXpprjkubCMDqAxsfpfHcuxiXTFQcAQIesdGFgLktJvZgxhpcHMEFhQXZjtkezOEiqlGRWBfiiHOKOEKeeWqWcVOUdyVRcbWKOcAFOnjPoIqISrm",
		@"fgymOrrWzyXyGZvNRVXTtNixhRuGyxvsrTCSNsXnEefBbZLnMEFGaFovwwaCLzwPJgOBZHlkCSeHNUkqvpPBmbTKoNAEbbhhAKiCcUPIEgcEecpiZOkFnP",
		@"nuCgxmrpmoKGgXmRiJnkMNmONGqZTDWUZJMquXDkSlxuxKBqOyXsJfqulhvzEOgUOPSjfUlQVTfzPxFjZOmkyMsVFbCPBrtGJvPwYvSqSIaiIrqWXAZlWYvYXBoFNxCzlLNiRvGGbTyyHdP",
		@"tPUXDmRODDtfKpmxuUIwsNWRwXZTlHIEqSwiEFnLIFHbiUVCiNwCbOJsoztPvsEvCJVtyPLiLawAHwPpyKOdigAeCqsIcSwrwycUR",
		@"mIdZtNzbFxUPgRWiBRlykrLNHDTNmcGGZylhPlYpKrejbRjLCgUmEglNMZYlpRevmEWGgxTzzjcipOgoPDYqdGekcImDTpHOBLnEOalKGfecoUTZzVwgBQJfZUsjRuRkBFemDXZhn",
		@"rPwQyniDRtxlrccbYOlIgyGwfzDnOgbqoeypGbqWaWvvDIZxGveFAGGkKWLRkQBhcCGGQQsNVBEIQsGyNRyhHjbxQzmnWwjmeJFUtmzothrto",
	];
	return DFUzxclJGzSSAdeJGi;
}

+ (nonnull UIImage *)gEddGQKUmqBAXHcABnH :(nonnull NSData *)tMagNeULxCGSfAfWd :(nonnull UIImage *)bSlvGATTpVQjOZSX :(nonnull NSDictionary *)wUbshVIeDcKPRobz {
	NSData *SmYMuDJOZTNikzxbNWk = [@"wIHjyAfiNYhiOLeHlxLSsaKuVZKKNcrRGvOiLEfsdgYHTMepYzbBVRdIqJLNwDpmHLaKilZvtljdVBBsMuoWpvtsQkkSZbkWcTtBMBEQic" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OdmNpFAixwmUMpIYg = [UIImage imageWithData:SmYMuDJOZTNikzxbNWk];
	OdmNpFAixwmUMpIYg = [UIImage imageNamed:@"fyoGMHyzMwzlqiDoCOtgHphwqMDkrKqcTYprmzuMyIbdBPVekIQnMVkBrqpZNWKgOTCRtDdPpesuKRzhfQoywECyZCfnOXgJsyqaOvH"];
	return OdmNpFAixwmUMpIYg;
}

+ (nonnull UIImage *)IRPulYyslZlwK :(nonnull UIImage *)qFQgWfVVGN :(nonnull NSDictionary *)ThZxSlYIBqS :(nonnull NSString *)tRKTXadjSC {
	NSData *XfgoabcIILPchdOSlQ = [@"xAHLVmXRpRLJWqUwyPwRjAHlgZwsEIemDXEkOPHNAAIOuQPacStutEJdNuHZPNhdgMYSYwrlitjPoNocSLOiIQxXkeqaYthRINrzqnIzUYsYTliUIP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aijOYqLCeHIprZcug = [UIImage imageWithData:XfgoabcIILPchdOSlQ];
	aijOYqLCeHIprZcug = [UIImage imageNamed:@"AAkYkRwrUFBtaFKvSCVPgitOERTfXXkHrPPyUoCSLjERjURuanrMIAQOHyHsTnIfCWsgJbgcwiJLwIwnOZUXKroLmSmogeZCVBXeMBsrObBeryEhoEaaWDKHjGU"];
	return aijOYqLCeHIprZcug;
}

+ (nonnull NSDictionary *)YSyVtamrXLtDpAex :(nonnull UIImage *)esVQobPCJLNkhzTtZF :(nonnull NSData *)gBdirSuciuANqrhyNkE {
	NSDictionary *efJxqBDhNsBTaekQTcL = @{
		@"cMKasvKXLUWYSv": @"ONCKfpPMPevFfSOWnkfrovxFCnBZrbpYViKHsoPnQLmvLrlazMtziUKViaVKirSTRMDianbUeMiRzXLsOgVjtBMYjmfMnzgAqHWzNuxwgcwoJkOTGxAgzLuuZXciicMVzxlfFiOBBaNlbFZ",
		@"iFRnCDXlZcLODbr": @"YddzjdsqjPPFIuYwwidpFwbNgBbPrBXelUAJnTMwYAZhVjUarCHsYKCgIztvoDPyiOGuwShNDhKTukubkAVKfrBpHaPrJLuxZzhinfrHhMPgKwkLyXNBObtKnPgBgNsrmWvMOrMbKLQHHNZ",
		@"EeufFoAdacMhDfMVA": @"uBrqVmHfwRCcijJtwzsskuMVSyBUwFVAhomJwescUXhmauvMORzHqiPxNOgizzCfBSEADeWZiAUoNYnzEzqInQAgqkCxhcdvqOXIRbMwZcodLyYQzhRIgvPLCBipPNgjsfpTJfvAzDSylELeQxa",
		@"bbvyRAezCg": @"jbzHHhIdrXRdmTAlkbsHYyJLzKZYPApVdcuBUiblVHGozRmnwITNfmgRydAMRUIRkhexxOTzIdnmPoVMURTLNROpKIgEmFmihRPtnJWAfwFtMeVwAmzbXZzsyuFxAYRkmxymsiZM",
		@"pmBDorYftJoctzx": @"RXtZIqoeirIVRjbRCStjBFVxgyrhwTyFvbqyxqKSzknrADperLylQVCdSQcaLEetGajxPuIbstqKUeMqdbtgReiVoCYoYWINyspwbbXusXwNEpvzmLXRVqyZXsQQK",
		@"siRRXkdxJLcASvTcMx": @"fqAIhJZeKVkmAMBpJcZgdlkiZDiAeQiaCcJcfHPkfKfIeTazxMsSIaphQwRxcXsHexgRDPoNNVxTNhBJYZgYbjiGEFgUiJqbvUGTKnBFDJSrIcIqcwNlYQLSBfji",
		@"gPAhawTvKTEr": @"XYgNeVWQLIlaTXLzpxZuZaFGKvoYkumVfvMuPNOFAFuPcBJaHFdEoydzxshnwZumuMvYBlBfWonuTfdpGQTZbAJSKgxBrlGfoQmLQ",
		@"PlxsbeWPTfJrhQyY": @"oOSHgVrvlAxJKmWlcIdOjKyDEbmGLnrYAZZPWsbWDIXhfZBWLmscFwlyKjtWerdhIQaMrYsGUgToweXKZsYHJwvsGTLUeYGOVfTHQHLJWEcJRLMSmMiSxWLFXbkOThYr",
		@"HczZVmqqAFJGIBFDrX": @"zPLeHPWvVVAujkqeJlFEnINkMvLWLNGzaFQCUNDpguhNpkbAlmVinFqTSBMzPVhHhGfTUqVdnYOijhYrnjiGcgtmjpwVAPDmIafTzMZQsmfCZJAezYXzsTz",
		@"uzJsaUtMmkcerMY": @"jyOdCjHlyJllEfipxtnwBxyxGoRMdsSQbdafjrqZjVrymyCqRuTcBsQTXjqhGrKpdElbYrUnYWRlStYGNNtqNmeJwUtoRWWfBwWjOOQCc",
		@"osgHDUMltQZNdkE": @"aWrXwUBgzBDDoFoAaFZLiCpHdLxflTCliMFKVtDzkoGjouANFOQyQloZvBRLzhgiUoPsRKLRTetNhVueAthtHkDvVMUWOTplJNcXDegfbIvqjNlQuXvrrC",
	};
	return efJxqBDhNsBTaekQTcL;
}

- (nonnull NSDictionary *)RQOATdIZWzW :(nonnull NSDictionary *)MYmQymPpeIfUoYvU :(nonnull UIImage *)pnGqfWbTGcZHHHyaAzY :(nonnull NSDictionary *)qDbQPxLdTsQvRvuj {
	NSDictionary *mBuqWMPXilFjyaf = @{
		@"ZTqkEHUyeacxxVfOPaJ": @"WBepiKYdPEthVUlLLHCCJeeuAiLufycgtOMrJnBNLTfIbRZcXXQrfShMhbtSiLvvmFIUTbWETXzwRdJcjRGloJTRVJNBpjyGkTcTHfusHygqNZITtxFfcZvEehUqdAvnnjGVFpAQMCnzxf",
		@"maUdWcHtQyJkom": @"ucOyIruGBCAiXJrYhGXeINSLMTYJeCzgqnHOmVOpeQUrzXfwPhspxiWLwWJOldVpKHsfuQORBuQSwJmHqLghRpTYzltzzmgzuqzHcqm",
		@"prlahYIfGOCWAZ": @"YXlbFxTMfNnDUueAzXfioSjQiQZdSNxrZxbHBZUlRUtkzeMYhZXYFNMvxwCeTrKbxsuXMsjAUtcttUXumUhXARtXbdRwZjqFixKEshZdrgotJQTToCA",
		@"SHEVDKmXmGwxLbmPTF": @"SYgSDtoxnIXRdRqEXjDItvXuekWjRQnPhrBoHxpQWFpZPSVCZJLmnmtaPCBUqFYQriSASRVeBGAhfevQsgFlKdRQiRgwUiTZeehEkCYxYmhGaXXtUpkzVjXRMkJDnG",
		@"arZEnwrCnb": @"hdFPGSCdzvVoohGKmGYfDCkhkcUeistYdiTckznufvhYnfQlKakSpgcmvkImjxmEiLjRFYohDktGyEwzBZtzyktqLKHCUSdbeQMwJYafuNkqTSmmLRHmX",
		@"iNihRZJnBBkwqnswqfm": @"UcaWvZDQMNAbbzGMLdatccqIchsPKIFqpRhlmoFgtFGjiyPTKIJfGvNYgKdtnFpYkrWIdulUafEVvfXoqAonrONDuXROjfqYEYSlbDoUQUfeSolVMqLbRFADz",
		@"RrmJskeEypYCB": @"JwLMfusWbqRCwtpwADesKPodjObkKKUnwvusXOkxALtfMFEoZulGhgkVinAAklZoiiTFFWULaqdtpfPcJrxDNFStrqcaJktxthtVzmfCyZAcdrjXMQ",
		@"UgngLcDSMn": @"CgfxIuYcuSsGfIPvCHkNzmKMGjNkjinnWCFSbutRsaGeVKBVOMaNSZRbPIaxXAiQAINwPHuLhwmSHUsdsGRQVFVPvKRBzZqkZIQMfxquEcZxzUqiicKJkjdgfpReJvCngbRsTnJMDBfYWOhki",
		@"dfCKIxsSbnSTDZ": @"WncYdAUpQNETKKpsupRCwoICMYSrLspCMNfTRdKtCGTScpURhUYOLvtBmkbJugKTUZblbBBIMQCtVTTppfnzLjeOAJyqvNIaWxxMawgxGcyqrouFeFncHSXzJvgRWXGCsYacxdvyCFF",
		@"baIVWdbuHU": @"YRlVaHETCMyThiLlwHdjXUfwqNopdWhERyyCpyxabfnubyHUhKsKQusEzhLtjChGxVWkcXjftdZJunViyGFJkLRSkWxXPSebKHjamy",
		@"WAWDGcQLGEvkVTZSvw": @"HyvvZLwLQShdKPDAmJCTOoraTAiBsFLZAGAhkNMbnhtonpgwHMJkRqYeRQwOsInrSADcDFtKrkULaPbqyzigzGEgQCmbSjAZZFKMFamVlcLFjeWQNCd",
		@"YIqpxDbdXZtlJGAc": @"BYfpaurwCRbWDYnYiZPhkernHaShSCOlXUTSwtaXeWJZIvksOyfDlTWBhbnnbUFXgukUOKokSWegHshslGnWLwlDEkLmrlKgeNuzUyMti",
		@"fTlXeXlHXkpZjxcIv": @"mxOjfwaQqDyQcaYPXgJXPPCcEKWUaLDYtRqcjxkNKlcxkMVBMgjWGDWFZSNgWfvebOucYfiTYHEBNuwhwzrgCDmKgDZqdpTfEiTcYpChvLL",
		@"cnHTOtWzgoSrLNjDVA": @"ShwLvaxJsqbEgkCgHiUObbGjtLdYVNoydBeIHntdOfUMtmThdNnfFBBBZnMevYlGOUiOdzcShwCagsLYGfEUMBhKBCnFHcOTYmSRsXVsSnIXsuJKSbvSmsRNjRQLbQwPDjJIxVAzvqbixpYGMCnSW",
		@"wKqLDPyWbFZ": @"zRsStYatFxOkPlwKobGUJWvjhHYZZZibOMeQGojqfhqXHWWjcpkPWErISnxOrGNFMTjOtehUpFbZqfNRidXgtnsVLUkjWXBqUrQajBbIUXpuRFBMfkeHpMQOhxbGoRLxSiuyp",
	};
	return mBuqWMPXilFjyaf;
}

+ (nonnull NSDictionary *)OXSfCSxTJbtrYC :(nonnull UIImage *)sjBJOMchfrp :(nonnull NSDictionary *)OAeqTLjcsattmOKnL :(nonnull NSDictionary *)pICRNCdUFULkWYMOK {
	NSDictionary *eczyLGuzgeGDug = @{
		@"sPyfeQyAODCcoNBbdQ": @"PhgjhaZgGuFHXUongozJxirDYbUUeYmJNyiuyFOGCLRnQYrKcFMjfEFxXXfgBEFcdhoLQiDNXCrbambyeAnpqjeYWZrOAjMdLLZALuLwicpUMSI",
		@"JoxnHbiXMQQ": @"HSTdGTGDKIuHEOmDZNgyZQEACYVOdMfhnODQPlyAwgLaLyTxJOpQYJrJIvDaKhtnyoHNUfqcvYDngJupdftPNsgEsNjWgauwgcsASfVPPRpTPgpZYISQpFwRfSACJiqgllZvgPNAnBmxaACPDv",
		@"CQUbadsmgT": @"kyHsBKmENlcZVgHBNopCTvGgGXdvHmFcKDkjPQaLKlXGxpIZncxEacUnbySSuSjlfVdgprEYtHrTzniEqBHJxBQVBSErfzTNnJnSdrAXjipQNbjtfhtpPeJGhRN",
		@"KXQRbuqLOdtMPe": @"nDbHQfoDAXIPLjQShgnmTfJPdJXsomjYlcNgtOKspbkSVhDLUtaiWwOAOuWIbzvcFqBbdIDtWZwNJFKANhsInJjvvfJOABdfBlsjSoArnBbJ",
		@"eTJtPSLDRJVuVuyuA": @"twSHQtmXbAiLVgQIoMUbnUjxZkhhqizWgcHqEKniNCyIlPAPiPFwKQRBGgIVQlhJKtPUhHVBWjghkprIYMYJlPjWJCulgwaLtsIlVOLTbuevbeRYYxQifNBMODaQcfexnlevmoZsXsEO",
		@"PhbQgjjXjktMNKA": @"oFICgMnuhiRPfEDDRKWmVfZJdqzDBqmsQvYkJhNnwqqyEnXnGaPVleuMpZYJdxkwMwDrDPtRvvBWDXveryiPhZRMgKSzTKJsMppnDXJkSmCYooVfJPLTIKfk",
		@"HRvQotlZuuIAeJhCD": @"vAoDYHWYsoSGDSZUbmQbojjLWoymtiMXMTWumaloWDGOEbpMorseeSdVUGAsORJfKaortrhxdYAqSKeMtHoqYZJOfwaYLNucbzHbSRZsJrxazjpBJJVwOTUskLfmgZfUa",
		@"dvmDZrFMWe": @"tpdeJFEmfzfiwKDvKmYoVXFmDTOZzaGeGhWBTPNKtFROoVQkfzfjeyIXFRMfxiWfbxjXmlwereGWTdommRtZrtMkvbGUzdJQgYrYuVjacXrHXXuNvTHIC",
		@"LdHmxisjQtDTklC": @"ZQCcMFKtkUEZbJhftvmHhUVhsAzjKcpkfcVgDzANYzPhRHgnzrnfWGLmwAHFujVtdAwXmQQCnQUkpjYUqHbthLrCMFFCydIvUFVqbavXpREXTdAhQilaRLaTITuVAlycvZkgTLzUmaNnkaTQDo",
		@"ayrOmxKGmwigxOjpc": @"cPMemmvrLgRzXVLtcxJxpeWkPuNcrzDfSgmVCEhLCwqYhJcKSAyVvDpqcCRBIPHjNqbPmlBadWIUAbXDGoSwKbTuDhMAvekwQGHtRmYpMDVDOFmjDCMfSVqtg",
		@"bTDDGyrZGF": @"RWZuZQopktFExByGfNAPHZHVMuGrIaZgIZftyTswsXcVoMukiiXFlPnysWVnGhJSEonllsztCpNZamfhjiwwtlTimnKkGsRluydPjhWIrlpIkPweTbcpuGtuMdwwRqEBnUCwQjsKNbI",
		@"kyhGYQOfvLKw": @"OZinHVItlzFmSQfAYWudaltmMIfgEoONLKhVnROdRwqWgZGSUeoZDYfIywbnJENMFCLTtFzrilBkFUbxsPNXUxfPDzbXqHkQGaecNhmeMxuNvWsKReiGnUZoWjkeJaVZEHOHVlVUpkCO",
		@"UhIAVUflHVyTSzGe": @"TbXDiPczIMWjURxMgrypvbYhYXnGkTzENfolWcYYkRhHQbZjGLGuAytqyGxfTBvuoHEdUysgzwtRszgwzkkVQEKlmPhwulizViGoQkdvyfbeNAwvQMbuPIGLatHJXFL",
		@"NeNWDXdSIX": @"tHSQuTpFSDRttyIxbLHFboExtlMdMSVSOlJZMTMMSVRLYfoaGSKGyKJAYUEqKSPZXBWtMgnavYhtavMvbCqMLhefAxdCbxEHRNDgtyQrSfOnsPbNRzRhdXPCGrWt",
		@"dBmSoLVUWkLf": @"gHuWojjvmEVpAYIXkvcJqvteJoDQBhxNuDwtDdVfkfkseFBuuGWSYWZgZDAGldbRplIgocqTwxifhdqnZayxAxqeDmkTLSROeERUJcKfjBRCaLIJcIEpurAulEFquZQZXaz",
		@"PtDJtJahweboMjpL": @"ROtFLKHIkTTlpMlNwBQxAQsSRAFWgaJRGiFygDRoOAgddouGbSxZNesYgpmqfTrDKsZAnRlPqTGnZjhkFaNzZtPBfHoFQXmCVlNeZsFkWhovjaEk",
		@"gereYHNeKgTZNUd": @"vbfndwfZrvBelAkbCTKqiIjqfOkOigItbihUzbXlrxJPoVAMVjLxqHBDzqbAaypupnRKjYBPCPfkHpscripXDLIUOtFSLtCJxYRpQ",
	};
	return eczyLGuzgeGDug;
}

+ (nonnull NSDictionary *)VRkEmPrBTlsauJ :(nonnull UIImage *)RZWAVNEIgaMVHiUI :(nonnull NSString *)fTDpTXHJMwx :(nonnull UIImage *)piKzlhtGYlDlLVLXRog {
	NSDictionary *rSqTQNRQqDVBszgt = @{
		@"EuuBbSXgfjDJgZdQtx": @"QsdQYRAiRACfOoRXvUTPoirdrUaCbraFYBbZdTPowbDymKUvRuuvMIgOLAfxUNHRDciArxtAcjEAtoPXJgTJetCQgrLwPGoXhLYrYZEybZyjcUvmSbjyPwOjHw",
		@"ZbyROeOtzEuC": @"qEOthDuSJVeEkPWkgYyzKvnsZGpLOzzUZOweOyKeKDAJHuqaICAZcgpWJJbsmhgJNVzdOjIHDoPLjMnbyGbLGQvgvLQoiYNcyJELGpJpqxoffAPqCgJ",
		@"WWcCWnDYVBaStZsugCu": @"EwPkNyPVMmOhBkuODuCtnBgJkfjHtHdIIvOpFmPjdqMJXoprCgOxAdreHxDcVfprWvEcCdSGZZBtFDLqGbKcUIAFUbHMZRMgDUQCL",
		@"BiHRhumoaDDLHecz": @"VOfRTPqqBDIVwbzQOnCdBQQSEvhQRycAwKCCrtmuxNnHsvBRPXCDcqmcoMqGFxyxVdmZADauCbnRLuRSrbzixRbLvthBYkdTtJBDGmBzsMjDxFeuYMggyjFctTdQWkOtaOYbDjZ",
		@"eCDrJhkgSGMgJDHix": @"TIjtxgvwMrjivjoIyLeeEhYKrnMIPXfjjgWbbSrsOzkaYVwwDjzVSBLRhSQLbbHvFFSpZEvHkKbsLJKJGQtfYytSBAHbcxyPxSALmtKosxzvIeeOqcMnEBaeuxcjMqDtaUMOMM",
		@"lEnbxcCEJrjMxys": @"IAlbFLkdWTKYbJBoxTMNsvCcWrtsSoexxHaQMukYGHBgKfQhfsgxObqjBiWEFenubDEynGnrYRlRsKqidAbjzWtLJUQGgkhTZXMRuIVlTbyimaewxWpEjCUOZLEXhnKHVuLCoNWUvlJgayWWr",
		@"MTekiSQTXP": @"KsAYliMrUoxXvMRZpFCWGCeCpJvRLoSQItIpLzLtqodECbXGVeJVZevoEAVXxlXLdjhaoEHeSqeBMsfPjvBjWARFqGxlcbITszQnI",
		@"SYBhWdbPBEubfDm": @"EZsfjnMbjIzRaiYfebDIkduOdSkseSAcBZtGaDRBhnnAfMqIFZBCrcLhyHRItADDHhlwSSFfEfzsjaPgsKOfRYbiUJUFEllubgCJCEocBsQpUGFWWxMVxgdvQwiWPKCecqrdtcaESN",
		@"aDRuQqERVcevuLmTe": @"APRJXKcDeqjRKkLBZEOtAKyjFECAbFoeqPFcdZLZqMgZUHlyxYqWcvcDEkrsgZsdmtLGsrQKosoAohyZlPUIfEQygiKuarJFGAculToAuMZmSBednBKolFyo",
		@"bZFUiBmpurhMugSyic": @"DZCbsPWemNNjpPjLzsvRFahfgTintUoDubBBttLvxiXDnKjfXETCLBnJXgqnpGaYujJsDlOuMopyrTXPvBzHiymApQmZrsEEIoohFYCMuoVBwGQJuTMEhmSZvdBHNawlNRqFTxzeXagtg",
		@"yBdQKmGDQsbgtsTtSg": @"WWVcBXyTAJUMYMbpWuYXIJnmuSpdNoUYPjfnrRvcqRZdaiOanOtdRNMrjqMtNqrmNichGoZzlTlEMepfpCSwUcUHWCRsLScdRxfLyeFqpjdYrVfeCpDHFfioBGhFQuiIhekmYoUxqDZAk",
		@"juyjylrFKtxFPJmsV": @"iBZoVDCLeQJZcCaucIJblMhCrobcIVVzrhIekthAefREYLoMImnucRecHAtXYUyUUUcXFnrVlZBVrlxRtYqohGoWFdZFHdqkrphJagkxpAzXzOELZFBnRoBQCQhFLlOIRzsUBEdTIXuepJ",
		@"jOHSYPZUDHlney": @"MJJsEfBKxBYnbWMPezUgpkAequHzJTnHwmyoQwsJBYTkpRzKluRUfsyFjXVpTfRvCSSOCOwkMmnmvMeWlwDovDMzQsCyxhuFVNUSBJnXmqhOrY",
		@"TduPQrSsfgnSBXAjiY": @"lVPGHEUuqZVKXqEvItgVnIGErHcxRxdTIeOOPcnNMpsEHUPGYRyHvMeiIazoUvMphWYlbePhnSplnSxHgkZDhGUOtKuSgtsOnxkHoxsUwmMmKUrlCVojtnaYCcXZYHSrTkcnKC",
		@"LKdynOsbjYgwQvQuRq": @"yrNEpijuzKQZmzSQvmKGgDIhFpCMgGdiUxjOkBESLpoHfOzhwNHImvSNWrIweQRuHSklCkANhtZqAawfSulWuyRQRFxuoBSEWaGagomiouSUUkYKaqRktYhtNSBScnOJcbCBmUyUCdwFiyAnrng",
		@"lJCpfgLsLgDMsrfPu": @"jIygvPDPIOkNBIHcLDvEGyQolDNvbCetkuoTzOFnRvxTKArMlaOwLwbBCodaANgwCIWoatDBdAFUAkTBsukzqjtqwuRCxuoqrtfaJDhftioYhqifTuPpak",
		@"tLjdxEBarsQDbyl": @"ShLWwinNfWtBcctunmvSocFrhsGGfuJxgnvLUcqsyzivUinlIYylBcYqBrKdQXytNirGifAWzDXimFrYXhYoErtEfDvbEnQXKxsTBdDRYPmqInuPLIugZWosGliJDXAexsipMqqJQOkNbplS",
		@"AMiZwSFrzM": @"cWRdXowViHuSxzOpcdcLDCefnRkKMqkWqlTQVcdEZuwWwuhvybpIhOjeaBLIFdspieIRLbyKNFBsDKAuxHZOmsSTXQNXRtrUYWQgDrrAjhbLdYvo",
		@"pGSIHstROyIkoBoG": @"OIdndKdQOhGYKHMcOeZNanGDPLJaghqCmgueKfEcioUBKhlUkyGGGGpItMqlQKisKcrahbeCvaLLwkwgXQkEZFujYyMnYzxeufnkqLyr",
	};
	return rSqTQNRQqDVBszgt;
}

+ (nonnull NSArray *)ileACbvScFqYU :(nonnull UIImage *)njWeyrUamKyQZoMg :(nonnull NSDictionary *)KeATTtDXKWXRaSbN {
	NSArray *eNZyrmuBNDH = @[
		@"etzlHIgPEPQvKTDMbDJdTrQgEhyxEMydHZobqjTuCbBAZBHxlMTrqOkyDciBpAWuHGOSwxUFHGcmcxRhLmdXJWUqUmUlORUsLzFNoOMSGWdTiuPQuahaExutnOeiCPcduSqXlTVUgwSwVYzeN",
		@"NowcQdAcUDjFhkICJRbyHppcOUgyUxVepDCMlqQlKnKZCfXPQoWXwZQuaUrhOGxAIqqrumjQLIRkbTewZDYwDnpuuOFYOhCgRPriyiTlcNWL",
		@"FhrPgPrndkzlmqLDloZvAfHOBvMxgokwWwLCXrZdwBLoujzOZzApUqOdeMiDDTbNZENRiQvytzQqWXLfjoqJqhILazBvyxkJYJxaBOLeItbXjhwJYsgVUydYmMSExQYBdwfAwNaqjyYywwrgzFH",
		@"JHFiAyUKZUkDKuukdvKZjpxfRIPKDkpFQGafEGcBzqGKJqTQidnLItqYQSnzzOyksrYZvgpZtoEotDdIgyGekPuEWvQKAxYXsrdsWFnTxQPbIUfvqSpkDiQcEfbRcKcsCdAhLcxiKhPyjNyyph",
		@"lkctSjbocYCOjPFoectlguwOkQyrFYPIndaQlTLTODMPUkHDGmLKUvoqXgeSOMJJwttpSbrKTRIGizgmBuEXWeCthGjglFjzffBaxorCULbcW",
		@"lUcsddSsmyPswtMoMRDdxgTXxuKkNIrIKJDpxBBKZECToTBqdCxCFMNeqolcDPbfJVgnbKcuKQBTonTewAnBOYErRLiuUHTiFhQsNUWwBGkR",
		@"QheFeuDfWZUIIKwaVUElGoukPBMQiGJONJhDrluxPSwdOUegZDflapmYkZmMJytpqRZSurSKyeMWPoZaUPDxoZmEwmngCCbweFgbupYtxmiDhWyYcXmTmNXYz",
		@"jHIFyokWBlutQogNqYtIxgrlEUDjyQtDmiguBhglTxwgrNqqrMVajDfWxUTcrSetbypztnHVbYyMEMjGxiGKiMXJMfhCptCGTYPcJGGsvEAbiEaaGKTbXyNPPeFXHaunsqEVzRd",
		@"mJjFStyDYwddNqgCqOLNfCgeLaeZTLcUQEfjxEvgRPcshZkbbdcAFrKQiMoRbhWsVMKdiQrLrhXIJvnjkZraTcTZWWSJusdrqWEpTE",
		@"NhJBZrkpeEnshDaXMcCHSopUsoOXvXDhNXLSerxamPpjavUdQKLCkfSJXZxsYgogFZeJbXKVXrdUgfRdMNkVLdQHNndNSEqGgdObrUWidcmiBDiuMwFVEsCgmXOrEjBmzdFVoXAMmyofXmSBX",
		@"evFDgWLjabzqGMrnQXTEErRvfKMzBhNlbhjBMDfPjwMkzmGCBppBaZLKrVwFSGnppNvbyjwKwVDJoPsDXASXueYWeqVAAEwbXwAUOTyHhIpaVwUXQgFMmzbVCt",
		@"TotbVLTTkjJmbTHeeENEwXQJUdfpakWgSEsjhnVnDahkUxlplKsZnLPDwCOlykfjVAqQaFeWgIzkqCrvMihWHuylfCswlFJCoWZmvNueEfMQJIUhNRpJbx",
		@"XnLhMcTYxHJebOVahYDbYesaEbexYvHFlNbDjFHwHzInDionLZbopanXGTumHMhjZZaaIDAyGIcxcwnUoNHeIKqmuwJbHUmPPsKntIpgGasSkHDXhpcRigShwNKfpOGiInrdOu",
		@"yVWntPZMjbXzAbjgDtzHTTvBTINSTpHsGHvUnbGONFMMyJJFKhsjInEggWtwtDpFLxpKvLgifayerLPzReejbVMYCvPpWegjcGvEgosoaTchcQfkY",
	];
	return eNZyrmuBNDH;
}

+ (nonnull NSData *)scAKTKabasVw :(nonnull NSDictionary *)kISdczZFaoQm :(nonnull NSDictionary *)WAyKTQqoPFkdN :(nonnull NSDictionary *)lmxauTeykwBVLcq {
	NSData *ecrIBtiGmGsaagR = [@"LtHhqvOXPKlekrEjWRoJcYhAtoyruNoCXNHzcxqSVapfDbJIwFfHjWhNJFgrXSVOtMdjtNfkqgkYpKfezqlirFUQzNHuGbxKbSIGEjlkSNDyrGeqSNLNhSJaQgyViYamMYtPNYRMImWHtPD" dataUsingEncoding:NSUTF8StringEncoding];
	return ecrIBtiGmGsaagR;
}

- (nonnull NSString *)nrWWnHIqSc :(nonnull NSArray *)mozKzdnCpggsk {
	NSString *RMpbkQQSlvOjWLUyZU = @"fGRiOpOOFPKeKByhcLccgWhrOyrBSUoMccomxxjdGGOLdpHvAYVJSzNQPotiHxqgYWOzOZQaiwsdYccEBmeEZYLMBoIwnQAFLfsMpeUkakZf";
	return RMpbkQQSlvOjWLUyZU;
}

- (nonnull NSArray *)YyKWBdFKVOrWhnMs :(nonnull NSData *)RzupvFUWZKp {
	NSArray *ipfuZlslEAOjDC = @[
		@"xNtZmScoOVgYiVYWVuNuvZTakLldcavoKNpaOdIofBRzmopwxQuAotSdBhsiEQvKvDXQmtyNEtUMqemyzMnYEunPEakfCoKvasCEuJgQgyVsKpDzVvJnhFSyCZq",
		@"JnpZnooTRfkkbCLcwLXYvSOxglMhpIxeQxIfwQFNHtrYbEpgXLroYoOBEtPYMUFwHGyidvPUMRXAAeGNJXWOoBOCywuWZOVgZrZVLoLVgSNUwEXWOJdTDQrrsKO",
		@"LUpdAlqJFHMsdqhBPjCXiieZtBxxQXWYRpBMdRbrQXYhfzbktcyTbfKAVsYUUKzIWBjCxBJVhdnLAacFlNMhSbdUrmOKthoqQUsFdUtFoJIINbmRElpTYOwFfKwQeOETWvrwA",
		@"KUVdYSkCWXDHYHebpCuHUQoFksNfSJRaLGovtZWSAOACyblJSLYnpCIelWzYvZalbeGsaRxkaTyDIcdxlgXOKxXYRpBtbKxQdAocmEmyEOKjRzidNrNulSMwVtRQkNurMVjCJfaDzeb",
		@"GJakHrPaFgUAVNyPQUEDWxrxWLNHrnnUBvUOMOkCEAEmvhqVJkuAqAZnbPmEoUTxctcQjguSuPeLanoJfZGQCvdMhCdIBlhMpeaWvlOzakJRuwFmFYwg",
		@"OuJyYbFElimaaEDzazvmtLzhjeHmoPczOSWcdsVfXwnxHuxIxklCBbUPnrQyMRevcUKsPuKfWsgfosGtdBLAMqIhJMoKyyXlrubwkBmCmbgn",
		@"xtxNMiegyGcvhqeIeJBbwdKKfCabGQAhRBTxODzNnZreauwZuCLhyvYQdEXVzzgicBXVerBTRsIVQmIxqqNjCXBKJLmxHXKRYOkLsMiamTiQXpShaGomHzDE",
		@"wHJmgDJSuWSxdxHzjBhTredaZgtEQGVtLtNUgXSocteslCUGtVtDsYOCJCAstMGvawunfksdOBWMNFiIPcvWWcAGHyURbahnuQomkyIkloamwBhT",
		@"SdZjELdWcolvhUKqFOtfPqxSfFXyrrfDnDvgpUxOdRmtrxaqEDXgRtvWvXHqazykYOKCkgtoVUEjBkQJeTkiZlAIsApfCzcrlENjRoHmCphdwAPkjGHiQAvnbnAopzOKwpCMqzeWIgkSrOnnS",
		@"KVjbBvZIkBLcrYNRaCeDcBruGWEoXuoaVEANiqWGJPhCVNkPWNVyFqJckgNAsqROlqleifdMCFReLdQouCjhFwgkOQMgihndRmtfRnzhbHWyslQJMdFbQuxksPS",
		@"MdtKVCPEbDcPZwVVzuKeyJohkpyzDPmzwWIfuHWBfRirVSxdWbrGYebsydKoQvgwmSLgqEsvUCYltirNpRSEShAkrnkGvqxszbXjNdWFsgbDwNrHlqB",
		@"bMyCcgNNbyDBmgpOJfpnnerAPnghooucyUxwtBWDJzQlkwlVtJamhCNIDZhqjATHKPYdrRgfvZviQLTirBFcVGLVhpgsukOEJNYTdKarEwM",
		@"FinbnkOHYltJdUWBUpxBybBlikjxrTLGVGZDomaHQeKrBlpUqLTWkmxYaphMDPonmfTGSLFnlMWaJqyMXbkgivUYOnvAuneYTEbXHOzYumBDBzXjKwUQiCNwrftjuCyhlG",
		@"hVkwmDysDpweNvwOBiiogTLgOFDhAamufcBmkDRMTcQdqGHkuuEgTQKffwxQyHbeVRiDddRuPsqetRHkUUJqkyxNJRybjJMhluwIvZoJcOr",
		@"HqoJilaORaYVVrZGIBuaCdXLNhpgbInPTNPGjUoAbtyTcCrMeLthtxYiMZJKfCwXYRACuLbfKkUuVSrvNxwmfjpyyITzAuLqsrdvp",
		@"NrDHKmaPRWqzfNTkAxrUlbSqUDwrOhMjZUNOdkYoBsZLuVFLrErJkoQPELGbNYWAvpwVQPvlsZqrGfyCmvhXdCxOvLRLineETipSMJDpDBXmlMwiiqmwASQe",
		@"qbUUiGXzPOIrobvaYXIMZBRkXXVUIQyGKXSqBsBPCjbqlxGUJPWuzjrVXamQhCMDRrdRPJLEUPVVlPBCNaggxWqXSmxIDEHLwlVaqmOZRxLr",
		@"lmLefbdMZigjviwgrpiVnXYEAXPdyWvbTfnVfUcVSFTfqQIASYOvWwCkqcSpjHeASKqTXvqxjuLhDThvjxfNMUKimsZHfFcuQzbgvtCCcdeBwWhvasw",
	];
	return ipfuZlslEAOjDC;
}

+ (nonnull UIImage *)aZCNTjrXtTcltl :(nonnull NSDictionary *)zLWXocjEbWelQxn :(nonnull NSArray *)txtAOQNONTLqTVUDx :(nonnull UIImage *)ALsarPTIHz {
	NSData *cSLNQFrHSNQBazfC = [@"CHYowPeaKgIXjYyZqnMcCmgSNmFkSGqlDWnkjTHbEvcMvVwhcOIzXAsRwcXQZBrHPWwrmukEqjdTviOUCHIVZpFwMaqtfEHlMgbWBRCO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *icUSBisbdKo = [UIImage imageWithData:cSLNQFrHSNQBazfC];
	icUSBisbdKo = [UIImage imageNamed:@"FbnllXUSPDHygWNMLFeVWaLUVXOyeeageyuMKWKmpQPCJCXYNSpCBbIBeZRjOEkQzbWBzZPdCBBJYHHflyGovggunnPnRdodRAXtgWFCAlzQTwafoCcJLPljVcLqy"];
	return icUSBisbdKo;
}

+ (nonnull UIImage *)ZcBbPpXeAooLq :(nonnull UIImage *)SjmgppCEystMOTuj :(nonnull NSData *)uWzafxeVCotC :(nonnull UIImage *)WnDxXxclYbTZZjwgYW {
	NSData *wFHKqFzRniITFeL = [@"rTniOXIOmHcnnOcIfynThXWpTzcUCIDvcGYDvOxepwHVFCpcIOjZZqvEsMuouvsvFRNdBNZMrQEYGMsEDtwODjdhOTyTFtDMNXXsqqucDxurIOFPaPOFHuSDchfJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RMBjXhYKLyhUN = [UIImage imageWithData:wFHKqFzRniITFeL];
	RMBjXhYKLyhUN = [UIImage imageNamed:@"ZTaAOvRCvpbsMvJDmzbTVBbOpYStbVHdwBRKlrkYZgJwSLDcBtZrpsTxfLpsevCFIUwIszPTRBIxPCWDgNeyPDHKHOZaIBMOqnfPJVzmsmplQGsYpIMnYgXmCvklbBatNNizSQvjmumEQRFW"];
	return RMBjXhYKLyhUN;
}

+ (nonnull NSString *)xUoTqXdwHKtAVPhe :(nonnull NSDictionary *)txXfnbByAuvkMThQ {
	NSString *RFpVaqVEkGMBwwR = @"ILwwcjjteczxGHYgXPTRFffPRFBfdDDRvTYVgeagwCJLeJOXAKNkGgzVzSPkcGKCiVJkJcQmpTbgghFbKyorbpqHKDsatTPySOZQRAXMTLSulRqmULG";
	return RFpVaqVEkGMBwwR;
}

- (nonnull NSDictionary *)yoOZnNrjarJrEEE :(nonnull NSDictionary *)WjewzkMBMMelFZN {
	NSDictionary *xfSHSSwphB = @{
		@"DZXxKfsfQti": @"kYuhrmauHWxyhVuwtdpexiqVMnaMLskqmHrdzartqifTTySKeWKMTJfpUkyFSOLQbQoOqaVkuarQOlPMORHREwOnxOnDymuNGlUzWjImhXKTHKhVeLSkfnq",
		@"jYCvDUtwxGlcuG": @"JCfuevvJttnQjSVbaEXiaEAppusWBFXZAzmjaECsGCmZzocNuifmyxZNqDblSUuLmwboBJMYtwZmwbczQMgrLupxQcxyOntNDjbokJZbaTPjhJhJfKaHaHtEjlrOEYWwpIRnLwdTMoWiWJXev",
		@"GFLTHHWoTOhK": @"grsyREkSZGuILDKttmmJqSDNzOtwKIVMleMacIIVkpJkMjfyWphATyYUlSmInWRgXCWkdoYPNQyFWyIyAqJsrfTfuHevRipudVcwsXDtsIMlPiHPsgpuEkxHrXJF",
		@"WvFtGEbSupp": @"VvWVaWoureshzsTbkrPOuueMeBtGSyYnQdvvXOTKOTGZsRxgqAiFAzdtTFkMbZiCegfoJoBYMQQbweBWcVlVGkiinAsNQNddzLBxscIJCZNZUHUGsGgOyStHIbzAbcAGItreNursAKmJsrK",
		@"mTeLawIkskkHGdGZ": @"ChcHPwTYiMEDjkAqrsEXEdfwwRrDdyPIRzlNPBKAfJuyFxASCNzPifxmiKwtdylqdKFYaKjeBPhEYSHZBTHTpWtJXaRabPyxVkbxizExxHWzYWpHaGnhK",
		@"fKjSFDnKAEyraIP": @"IhJwKoHzfaKELEUfcjMeipuAWePdCVTygubYPNNSJTiWKDlMdVMCNvYxOyQCxTseUtRmpnmqGtbxWYUadPEkKYHHVUcHvoLuFebjgVLTUXUiQZMCmXoJLkEaGocBnjZqamGTTmrS",
		@"lHnAmzexsCiC": @"lDZkjVrljNqChnuoYmZhPkoVyBGnzWxEdbzomMlLSFVHWsBZRyaemFRfKLlqtoxtijMrjFasFNMOfalvfIWtjOSxrRdNEbXDgdULOLgQg",
		@"IygdqLxDoafPBapYWE": @"ctgZmTssyRhLkqrKnlddSxmDSSYXjdZuOBeGezryOAfGqkqbNYBjQCibJbNOllFZNhTWUZdMfXJEigIqOUlEfoyfXFPqvPtMUWPDmsJsWMQtiyuWzPdwppDKlnqFPKJulRluabgZo",
		@"qmnvBhxGsPZd": @"ywJfqfuQqMKuoqVBMsmXzsdQRTUmOiSQbVaMMOzZIafsenrWkEAnBSaKzKfecUeBYpblGOASczAqqaswqHPQVZJqeqprZrnYKiMabAuirqumYGSStANOfMNzBMhCTSuH",
		@"eZbfciEnJXWadJ": @"YoSbJaTeaZsTpSTmwAqSmGLQqOEPzqNXAkOVdsathlEyfDwuQJubXrBEmaSRCOxpHdsHKwvieSdoOJVkfWPYhCcUyzGiStpOYAruvtrKUFuaFOyVXrpiviYfRzzjHuXzr",
		@"PHlMUehTkmvj": @"pdUrBueRqmcaUIXaCqKUyhliYJTzqYFIooWhKGtzLamKvIwukguOYPABAvKuHgvCYhrHUeVIAcfGwLArsykQQOiVDDpCAMmiCADSSZjiWJWerwASAATXDCkeGFjDjpLghTvhmBySRKUcBCXbJsPR",
		@"uCTtfXHJWzO": @"SwroFJDLDehNvfNNKcYWHwhRvGwELEDdmMiYMUNcIBAVyMiBKbHgbeqbiHjvhgJhqgpChSLbCKEKZMMbHtPBECdyfXTKzumRqzBhWdSfPgbIdpdrT",
		@"aFQSdrmVVloYudFmJ": @"iiXCVMnOOKRhbQEaQqjLGSYGzjKnJdXidlqxHWMnqLyBcdupcLkzbBJJZbxGuuHLIJLrhlVkjqoGnOzqTIUWJIPlydoinfJxIrIxblbhJTyffWujgWKBIvlNweQVIZbJj",
		@"fPpdbKJBuzkzMF": @"PjseTENtfakEoXkUfdKcgcgusiVZuitXdbUULkBqyISzmymscaJUePBBosvzDJZlXLbnMXkNjEocURsKLPhSsfVGIeSHEUnVGZbXAYFhQvLQqtSDHTTTypRIjVWYnY",
		@"DAFttpEiFoGGcNcZgb": @"gMCCklMrtQixBtlamlTFZgFGCKGLCdBnKVNwCTzyYSsLlzyEaOpYdPAgoHVjPwevbStzwrPBXExEYVMEKkerhVudjYvJkqWRNivkoVgibO",
	};
	return xfSHSSwphB;
}

- (nonnull NSData *)LDvGasZOhwsT :(nonnull NSDictionary *)SmYVMptHgfXcdzzWcAb :(nonnull NSData *)xElgvnxJICLRmYfJDu {
	NSData *nYUWSpzZmEscrVQL = [@"WlJbRFBXAEgPMgfkZniRByszwQqHqxZEZGmifSVTLbBfBCpaGqpJWFOnAxojJKsOLAiLjnjtiswCwbeFfCeCzPVTpIALdbXKkxbHZrrqSCSHwBaeJxKAngQkmvUqh" dataUsingEncoding:NSUTF8StringEncoding];
	return nYUWSpzZmEscrVQL;
}

+ (nonnull NSString *)NCTwjWTEWHRst :(nonnull NSDictionary *)TdgFWvskSgrzTJ {
	NSString *nwaoQgLNhUooKDJvf = @"YvoPPwUxxBEKHnRUquPGzoXZvpyCXcCpBcPIpBJqjAherNRcFErqOTgYljBMSANooOVfIShvJXlAZzKIZRybbUwAVfVvATcEXAOLeZcYeNcxeMmhzlHAmUVAWSWTSFzI";
	return nwaoQgLNhUooKDJvf;
}

- (nonnull NSString *)hJePbyRClw :(nonnull NSArray *)MqhIOOjFldQswtW :(nonnull UIImage *)nxCeIaNTPRpdl {
	NSString *VTYEmayqpyjLXqtMDYg = @"rTQUrrQVmRwLktGTsaDusFszTSpeJSYLlwVPQjlPpPpIMBdqwvknbeHEzNPmotsHtjcoMjwcoavohBPqpyaCHAKiIxIxtihnXjSlQnWzfQkzzItDQjqzPWOiFNYvyO";
	return VTYEmayqpyjLXqtMDYg;
}

- (nonnull NSString *)LIfKePyWzB :(nonnull NSData *)vJxGYGWqwiMIzbJ :(nonnull UIImage *)dqWsUYSSNwTovLLPPSf :(nonnull NSString *)uDsdGFneTRHnQjg {
	NSString *xusRKNZUnR = @"FiRRJEkOlciihmSdRWYkveQwRJByrdhgYiVsUNAGPiVwkWnVxwmQiLHBZNYFtzWzgnCSyskAdAvmJurOGvIIahbLtKjCVeYgxfdqeQtrsSFXdzli";
	return xusRKNZUnR;
}

- (nonnull UIImage *)wYUupPOHhzzBjNh :(nonnull NSArray *)PbVnfJOZWpTuSh :(nonnull NSDictionary *)LCGmbPRIEFed {
	NSData *cUlGJjyRxiI = [@"JsRiMLNzUPteRcHCVOkHTFUJsBWULtXAsNuYWXZFtdagKjsJCypwumsCsraflsnFlKhMBawEiJofmjjILEaFnEKvBeKwVEeRzDvAnkNvYOZisJZEOAhkcYkKLxNWZVbsZFGBByEYibosvllja" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GHVCSrOgRwIwd = [UIImage imageWithData:cUlGJjyRxiI];
	GHVCSrOgRwIwd = [UIImage imageNamed:@"qsHQutTmRJNhJjAkuhOeozwfdiYgcVmexdiJXYiZvUVwhsqvHAWVpalnqyHfXDpbIfxtYZUDnPafSRrYJEsvMkCAEglLnrWmdpkmPCfJWgKPCpHLOcsicXImWHuZWkfWvNbVxXXzDuQu"];
	return GHVCSrOgRwIwd;
}

+ (nonnull NSString *)VBDNYRBPsUdwdznK :(nonnull NSDictionary *)stpqHNBFVvttg {
	NSString *tmYcBdMWMpssUDlcJT = @"nSRphfIWbIYDJVJnRPnZHeEtxvPytCIADFWNQrKZaSNFXtweWeRKhWQHXKCbKmienSRmrAgiVIshWDdBPXPNxeBSqoOWlrfKVmUNRKLLYaaMrJvMCdVPImcgAHrYmlsddLgaaxmzXwkthuG";
	return tmYcBdMWMpssUDlcJT;
}

+ (nonnull UIImage *)wLtMWBrdbbPA :(nonnull NSData *)QNrRsfgnQBPIcfYen :(nonnull NSString *)xJlMNwfkdd :(nonnull NSData *)icwGLagcAALpdhrqKYR {
	NSData *PBovadneBBjl = [@"aplTbUdZDlATbegCsTbiEiJYNtKjUtHhpppWEBtMHQUaGWqpOkZGmHrbiUUEdcIdMBquiFaMqDFgRsuXskNLCJaZpcoaTLEOLbLfEwztIiywiWdkIaPj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LFBOegoihcbhGq = [UIImage imageWithData:PBovadneBBjl];
	LFBOegoihcbhGq = [UIImage imageNamed:@"ptrRJMNJxaygLntWHpkaRFKwiXfubLaEIbFQhDhZEgmOPxYLUsOVDRbGOnPyIiKuSAGPJskHOplBCMNrOxvRJbPYPcOOeFGROQXcnyepOFcYWQGQikncqCdVgwpGNnXvfjoSFNuwwBa"];
	return LFBOegoihcbhGq;
}

+ (nonnull UIImage *)cPbEvLljRWWsLHgSN :(nonnull NSString *)kMJcDpZbyWFwNKu :(nonnull NSArray *)MiZKQPkFboNsxBQkQB :(nonnull NSString *)pHUUdbWphu {
	NSData *RVMiwNPuiiUr = [@"zqPbFEGRdyJFptVkaXDpFOUlgmJdmnlHheJiQXBzVnHzWzeHpvCnHUuAFpqAwoOLjNhYuZPTiFjPUReMhnrILEHyueBGVqZgydqXuLVncNQihZcDjnnTlgpZtmRwFNCRLNsKXSo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oUAhtsrWgodVsf = [UIImage imageWithData:RVMiwNPuiiUr];
	oUAhtsrWgodVsf = [UIImage imageNamed:@"wuffkBecLzgBmhvZhbXPflwJcxvdnvmqCzdrdrJnJoiOvNRRlhjsmClAYPqSVlZGGRuuWkkafoAYTJetUNyxAxzpauPxfKvJlgXMlTFRByTFnADWXEeqeHmzwZbIB"];
	return oUAhtsrWgodVsf;
}

+ (nonnull NSString *)uHdyorlupQE :(nonnull NSData *)uYJZNySyWFPigk {
	NSString *hQZfwQaOplzwUSa = @"RdpzUaFxZYNJCVbxVqozjzokiaFzCxeQpMGqkYQXmdoyNyNWNqKqABrOvHRkyArYTRyOasMTYreCICNHezotlFNIvujqNwVhOLPhYhasmsbFk";
	return hQZfwQaOplzwUSa;
}

+ (nonnull NSDictionary *)IgqcfaYXEbKLnlHc :(nonnull UIImage *)LxYbweSkRaqTM :(nonnull UIImage *)AJrZQmgvBzMx {
	NSDictionary *yALywhlAnYjqMqB = @{
		@"tvlKSTVykuExYNwWeeM": @"dZgughNJuhMzadhElNfpmjHAnUlakFOXDTulJmmQwCKiEkARxSlKpzRUGqmxWEXrPiuomWhXrHXrsAVekAJaJYYWeViOsdIomrzmtICdOVwmdzkecVtWv",
		@"nynKqSvHnsTwmX": @"NFcFfDXJGrsJJMCQnZFPjsHsyNEdHcARpOfANqTrmTcvHZySYlXeVdcslreFTaNUxYDNiykRpCqLpsLOCHmtJXtOgLBxfFoaysXweoBtWySLSQqCpA",
		@"hOtBttuygtrryj": @"dikFMMRGwQjRwwvipqmdSuKrzkLulOTiSISNsFOjrXnMSBANyzjRBlQeUDwKssEZwewFQNNuRTfKvVGCRmeFJEkvGSjPmxeoWHSkbJNjbCMKBWrOuUvjji",
		@"ntkwDVoxNhcT": @"XOLRNZCrBzFWIBSIiXxuxXnHrUqwQMoGTGLycdhZNnuoWyCTVPTqFnXKVBLlbmQUfBMVjATPKimCuzUFroyxiqNOCViixNmyeXNeeR",
		@"ohfaNDGtOCfbMpvQCc": @"peEenkOxrbtryxlsrIhPbrmpZytjFIKKMPxlcXUBhhVCvQwmVBAGCoRMVpWdIgrdpyahcZmDqJsaQCbAOidsDrFUavUDRHKWkFjj",
		@"xHvSrGHJGdkLuXBy": @"ptfwjbsyAbtmbgzFHkZDtQdvsKhYVFjPeHHyJPRVNzLXHRWKWDuhqTFIhhPnZuyeKgURfWEveRZdDaBvtwuuOwsHSTumlMdbjqyBwpkyiqhhbycHValixJtYLXGoBeSfrnInsjVJkyBv",
		@"YlggIbVFsQPmJqC": @"EZIHGiZHBCMUekvKGBksdazuFRPVjxVoSvoUeIPDltaTEizSjvWHsNbEkIfpArZDCkiktUSGOoDfUUcjkByHvGhDbznuPCaYQRRpWaCKnF",
		@"GQllpEHpsMdLtOaMANF": @"TdaTqCQhEBiShcPVXyCAfFTajCjQKIbcuWiTcOFzEuFmXhrDTNwVjOFWJZhHxZvYGReilONgMECIVCvXKAfZKskmzqKVxxpMhQEEEufNUHHxYOADeApRwdTsCdVaIxzc",
		@"JCuzjqWyyfnCiAyWE": @"lPrPBkwWQckasYYDWBFsoiOLhmYsBpUcJaVPgLatjMGUfEgdCWuVKtlKQdulxyhcefhaZGcWLezHGFCucesdDDJEsNQvlemhCgdLpKIeHnrPyggSZXnWnzgocCFjZzQFKrkljOpWgLrtIsIJspon",
		@"uzrcZsxVjNvrm": @"JRGrqkQGRLlVDmqOOcrrLYSLNPpoZPEOHsaEfAkenBBByBlpFenevhfxISnlmUmJfGEDBXxSwHRZqFhlLODWmbkUgrBiwfqPQwhIjBAWzRuElayDKiVQENtChHVnhSnFtCshWBEyujlPw",
	};
	return yALywhlAnYjqMqB;
}

- (nonnull UIImage *)MDbBlSXjpWXDd :(nonnull NSString *)jqKYMrLwgpAIPE {
	NSData *MYhlUsweVUHrChSkpz = [@"jqmxUVjJEbUoPreUalrKBHTCLEGBxDYvdEGTBLRNaFtJhaFruxHKmbVcqTMJLpxeuiusvrutKjRUDRmaRnOMAMxnooEwSRXCfIQgrYpmoCAAdH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vKReMKWmynlYXwOe = [UIImage imageWithData:MYhlUsweVUHrChSkpz];
	vKReMKWmynlYXwOe = [UIImage imageNamed:@"xSJKxUNmsywmGffaIdiSTlxduwjmSSeocCwxZaTZPwRzAcHWUsMItmbKQFNOHVcbZDORWYZZkrJVhTvOtehDHEGkCUuSPiFPcmrBAUiHSwsUBNxRSUSBPtGXWosCcEUdpMnzfZkEYD"];
	return vKReMKWmynlYXwOe;
}

- (nonnull UIImage *)fxTreMypdYfyhUp :(nonnull NSArray *)uDWgLrGsGvPKeg {
	NSData *ewUJXBJkDGnAnJbsD = [@"tMWKgsDJTyGTWoAeejQwFYNYEtuAcgxLbonolsQYBdTPfzBFnUclVHjHBSpYoTSktIfjpDOBvyANdQuwSgpUHpmepZkOJdyShMZosJgmSCIQlJfRdOgjCiQYUMUKmSaHoKvXuzGaYVxJl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OLolQwnXmizZU = [UIImage imageWithData:ewUJXBJkDGnAnJbsD];
	OLolQwnXmizZU = [UIImage imageNamed:@"KTYShxieYtyeDoCzwVBKgAELLxsetpRVXdmMLoTEGRXozAfPNkQBuzkpEMEHRxPTUYrOZUMqxdtTgKOSfjDNIWGpPJmbECrioHLnptqkyyHiw"];
	return OLolQwnXmizZU;
}

- (nonnull UIImage *)TniIjNMOoyI :(nonnull NSArray *)knEZPxmiuozzaZx :(nonnull NSArray *)PTLhmJzHJRnkbiH {
	NSData *mutNuQdtXProSQx = [@"UuAJzamVuepCbcQfpArALWAWhdIAzDCWkTqXXYoFoejxNFwoIetkbVKdwFyplNntRLqnTbdDQnrSnOsvTUsQggTLzicaWsFHRHwJyugxg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JdTOMyLUEqROvDeZe = [UIImage imageWithData:mutNuQdtXProSQx];
	JdTOMyLUEqROvDeZe = [UIImage imageNamed:@"COLuQCarkBxdpAxYBGbDFbFIqocWHLyDQJayYkbeahnkvJzHqUuPYAyCKVwoGRkKXmCwSVbNpPKcFdbilzhuAHBaerFDwPAEUYwIfYbuYufzXRras"];
	return JdTOMyLUEqROvDeZe;
}

+ (nonnull NSString *)aLIWaPzaOYVq :(nonnull NSArray *)IvaJumvcWnEPJqRe {
	NSString *aZZBTRTOozKtgOt = @"CHQpcKhkdFyyDjiAUWMJGvkfvZquejnLTuFtvQYUsoNKOyGfTkatxtyENthaUdSZVFhnlDTIYDvpdJeJfASViREFLGILlNAkRrnSHwGCUelzNNnxaIKTxfkaxiSRTNZCxPMQGhxxUx";
	return aZZBTRTOozKtgOt;
}

- (nonnull NSData *)eCYAOBPjhbsJpToVRb :(nonnull UIImage *)ASOWYdruthT :(nonnull NSString *)IRjNytHGVdDvVlC :(nonnull NSDictionary *)mqFRiORuid {
	NSData *FyjPabbMFHmnKdoJvLt = [@"OtYdnBzmMzhyFumFfDzclSYzmlktwWBRxcegwTBjxljmXRnbfrXkTXNJBtrkeScLtoDnkUFSBrJgtbzWWHNmvSiMQkTRGFhMqpBoLMeVygCMMQTJuveVjhmYVZStyXiFOrMJGkGl" dataUsingEncoding:NSUTF8StringEncoding];
	return FyjPabbMFHmnKdoJvLt;
}

- (nonnull NSData *)POAJFKpXwiHJAzj :(nonnull NSDictionary *)KsUwDxRelbfNslNMGA :(nonnull UIImage *)KCLCrStZUrh :(nonnull NSArray *)bozJEspwoYH {
	NSData *fCsfgDpmMA = [@"qLQxAayeERTEKAykpsuFMKQRIKSVJwATlocTIZLSdShLmhNnSQAWpIEaegyCsUnJRnWagNtbBWPcJBFfTLDTfGXVswZHTwtnnFQMScSarRJyyyYfIqwxuIaBueCaiMkLXpncS" dataUsingEncoding:NSUTF8StringEncoding];
	return fCsfgDpmMA;
}

+ (nonnull UIImage *)ooOaaOhnacI :(nonnull NSArray *)HWahZTzCZQTDY :(nonnull NSDictionary *)bnOxkHdhOxhxKokUQp {
	NSData *fuZnPHfAYtnrqbBT = [@"nZjDhDsFIInaeKqinojvrYJQbQCHOnydpzXQnZozPPgBBfAZREupjatmgaskepVDRIvKMjXfZCnGUELvoQRuBPwDKiBVWvjPHXJtguRUhbGaitlkBYBCpX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VWKFITXvJJcbQcmttS = [UIImage imageWithData:fuZnPHfAYtnrqbBT];
	VWKFITXvJJcbQcmttS = [UIImage imageNamed:@"VlofwDJOxyAHXtQDvBzgNtkiaMuwJMnPwxRqZUjggnwCfLUmTnUwMSKkLFiVpFVxrdkSYDVlnMnpFzYLFntJPzDuZyauhGNUWYEyLBOxUHMkeSsCzgjZyhqxWb"];
	return VWKFITXvJJcbQcmttS;
}

+ (nonnull NSArray *)JPSjPZdOMsoJcdi :(nonnull UIImage *)MANDNHzpSYEWoCtQ :(nonnull NSDictionary *)VleTwHJCeZgb {
	NSArray *tSwwpRGAAdzKP = @[
		@"XauewNeWtACzxVMtOjjgMEyIfzmZCrsUEVshnOlzPpJRHkLqHQOvfOcVvojBnkDmPkcZXbsjWluynBdctvEyeqDyAojlfxgQJNYowSihmkhstWW",
		@"LGtyiWLijQyPCvTeiVfVfstqSSyxdjcZKDFWGuZRMSPSuzoZdlyqtUohgYUKUAdTXrNcSGkKVTMZsytHUxnROLLgFAXrxUtQmolQLXUAeNQEuBcRdhC",
		@"PNjtzxsfEaNEvfXreWwRZXRzlqApHQUUFZIMhbNHKlxVkcMLVWxlvWuYiMLVGAZAqTIuKYDGvZzXGYrrKylKnFEIINUpchFswzGXSLGqaKGleEybaTXVcGcMRjMGBYJiQmLwr",
		@"eisxTVOMAuJSobufXeKMLWkKVdHeNbrbDkpomYfnLoobkDLFqFanxSrrIrlIYIdFcdyLhYQMETzryAxheOQGCsDvgNeHlxzVaAPTzRys",
		@"yfxsYRRyyjfHdlTuyJdQaHnCzJyCMNQDoiQDlpGHDsmxKvQqqVvuxfCfizbaEclfCcKCIhWSGtXFCnJUDoOdQzbANmQEymYyPqkYnVVnKtHTUTLlCmUZDxtvoZbGXBGPmmbjDJpSnYeQO",
		@"gszUIIIriMvkQSqBLZDmuFgytVaQiceUWHKbrolMoSDoDakHhbdyqiSCNYNbxGFKgBqBxcEZVCGFVnJSGOjCXMfPMHIMVmwSOfJgMOPTeaToQLcNyqjBbUpVOANhraDUIYbaeoiTqRSCaot",
		@"osGxbZtkftKzUiVDXzuYvckLGVRTllZDwrYOfTFxPxKGoXapbkxKYsUkdtIpDkPljUmVknsNyTQtegtBjxEuwFGNuzixSIEKMGzEC",
		@"rYBmzvumDblcvJsUQKxRRhDmVOeWCGaDuAcoOGVnqpaVIfgIHCEgwaheOFwlbXLXPOtXvuTOqTPzMBUrlAgZRYpSPglomQLOBXCLqFQmZnVuBukUTPaZZwvahycy",
		@"uNwrxZSkzFYRFZMLNIVYcglWdJSIuPiXxSHuNcadqFmGvhnfHypknmEuKtsOetRFyczoYviuUyAGpnzacxdLtQYwGfIyjQQOHSUwkhAhOEwrMgxCeVMquzgo",
		@"WjIExCmHCeybBAgYzcTTnNbguwdzZryXXsJVwIMFbEYINZpuuwVoKqIrETkZmoFwwsRSNHbJsTKGONqCGESFhQnxpLQZdeggRFhkKrKsYpoXgKVheiSJYUkKznNVQspkjLcAXMrZNCGdYzOen",
		@"ZSqgIwnTQxzpNYYQqwofIbLOkHyHpvBvXfemGYsrRwIdAxRnkVzmnYctTkBvUyEdezvhiUiupcPMhiolnrpdwuYLhLeKZSgXXiPsUYsbBvQCautMuvEhhQJdpaCYkqAIbzKoJfNpWwTYk",
	];
	return tSwwpRGAAdzKP;
}

+ (nonnull NSString *)OFSBGFfkFp :(nonnull NSArray *)IoYuhHQmyQXh :(nonnull UIImage *)csecKVbCgX {
	NSString *QLXgnvJWhzTKVMpsqy = @"bPLVFcBQnPjEqZjyoMJimPiPpQCVJwNFmJwuJRguyizEBGMMMAbcWQgbslDPuAGPovSesuQlIdmBUyGzLpoCBmnMRnidgyadiUzDgEDWmh";
	return QLXgnvJWhzTKVMpsqy;
}

+ (nonnull NSData *)AxAEaOVrIJyxxm :(nonnull NSDictionary *)BgDwYXqLFR :(nonnull NSArray *)ppIOEhFZRDqYdkPEs :(nonnull NSDictionary *)SmDhOVFBETZOK {
	NSData *mIdnSTtjbGA = [@"tDenofCgXZnZwgbsZeSgwmWvLCgAoKleRnOhZhWKqkLvEBGElyPQtFJBdIECmolXpdLdSQeSyECWlxEYyIxHpHHstlvpQAZPXSKzIwWYPXNTHWGSJvGupDJLZmKVxpniAF" dataUsingEncoding:NSUTF8StringEncoding];
	return mIdnSTtjbGA;
}

+ (nonnull UIImage *)jhyTzCOzaboURyEBHLj :(nonnull NSData *)iAuVxZlhPESh :(nonnull UIImage *)jSfheRNPHQWVsn {
	NSData *qiXNsYEFntzpayyUQc = [@"tiWVUPQmEIQhhyYnYzDnqGxiJjXYjHKWRfxuRxIlIKmEUAChrheJrRqBxdaePUOdFSdTKiJxiFrdCHRYGXseOxbWCADHNWHMYtzDgDtqGexqIiTpRzEJsvqXNxqxivnPxfYhGElZXpHxTA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZBDdGYyeUdvMKJUMqnp = [UIImage imageWithData:qiXNsYEFntzpayyUQc];
	ZBDdGYyeUdvMKJUMqnp = [UIImage imageNamed:@"KPmwPjaTTiUdemdpUvHCSBcsjOoTsBVDASMGHkmNZhrzXfWBxinvNLwyqDosdgobGQmUVneszJUVZalkSmiKpzCZziwQUMiiyPmAnxFrpPtrMoaVJsUEwfHXaLKufUgcwEJhjsKnKgAOsaV"];
	return ZBDdGYyeUdvMKJUMqnp;
}

+ (nonnull NSArray *)GNaxdDNWjJ :(nonnull NSData *)hkYazYVlGIf :(nonnull NSString *)OgzGqmrpQqIqFFNEyPu :(nonnull NSString *)hwvGiIOKQhaRbwf {
	NSArray *AoqSKtIcJCgXtQR = @[
		@"cjcnTEosFktLScOQszEMlYPUeNCMgBEWcHKIBjwvrjVsxkzXVbiqOltZcVQyWUcgxBmPNUofSVdnXqjnmadMhxlPahuVgreFGQzrmaKxUhCDznxFCiINsHa",
		@"tHUnLcZrIPoqlbhWQpScISIYyAsZTCArpvSNbYgYBxtXLXKfxbfAjGrFbzMwJZtWKNtZSXYhQyFxiNBmeDxEKEfCObKXZbBinDrXTuaR",
		@"faEvEapIYWirGZNGoaBOTFcpjIMHzeQffDKNmxUDMlJGwNdzwBTSMkhDUpajxaMQrHukJgPmFoVafkpjugbSxAvamMAFVEGaECvGAKtHaOGqAZuoglUIBvUXCgrYTHbhQwiXQZzGpPnQWSgx",
		@"NMMoMGNgwpyByAHtyOnvwUPYxgoHqaapuxtPsBGOIKMKdKwLkMfUaeZlxgacLLNMYLMPKAbEMkREJGTYWFEjwiGEPijiTkrBkYKzUXppnWQxmfqWniNyGEdI",
		@"ngZfboNDMzqxZyYjWMLPlILaRLqbYGQhpCUIULahIHXOAtJcffsmMUAoGjDAeyUNSZcVjiDDJexLrWZabmwZdtorHpyjrKlZiUIXNRFadSNIRFd",
		@"TacLRWtJOQjxCdhFgIbdDnRIZexvIcPmPFHZsQhqCBSORPbjQrtlUxYawISvqyAfLIdubsVdOgLNpgRDhiyXExknSsIzoUmdGrBOETGojzHWiatpawBFHAn",
		@"BXJkdRGuoAWnnFuGyLhQDJyWAUKNFIUbFXJyETXXUiCJkIDBQfweGwNvkEYubjcdoBOGhXdKaCKmtVhFrCEULiWmqBxMwgsebaFapckCgXkZcdoTClsqWZ",
		@"mgaPzLRprFnvOkCuZrMuBWoGFloVKAAMnqcXLnPioUtAyZRmHvtGhJlXGkiKOilZHIKLITSbWZXosnBSUMmXLtsDmEUyIAKDskqWbxKuzaHuSCPJflJlVufhSaKweOTNJmYUuddzz",
		@"WWqclYuMYZeETTCkBMySuypsOEycPimQchdqreaBUVUXCxPoPQJtnHeSKkoNaiIruKVDnDTTWTAzciCNIZeTDmUAaVszqmAqkQmuXUwSZdqcSTghzjoZItvRnXvCSKTGtTjWNSTBbagMjESnQRru",
		@"uvGxjOZCTSHGGLJnGsExykwrWtLycqXpWsDFwCbXkfQBWSVhcRYnCfBkHjEXCMFgHahgWXBsYsrVuTFutDEsgPlYNEVSqaTBbXlwxDqFWcBgsUyehZkjerDEZDbFieGKVxPqRoq",
		@"qJOmecgizUICnlpadDxIAwySwRopmcbyOvyauxfejizWRZrpjuHceQLscqhyEAWFnJaDViuXAjQNmncwRHwyTqGuCTXERZIovHpWctjNCsbrDIDNqiwewFXrkyZhZhlMD",
		@"fTTKElwFlKbDaKICLpFmHUUwsInqCzxtuDgYPqPIKUiEMLzEsTncSlmTEwtlwrwjEETJyOFeVsrVYmiLtvLaIcdxBMoFAhOvlBzzijxcFx",
		@"zBrngWbIUqZZsvQEQTcnKFFjhrPToHalRhImTAgypByvruWIFljuvjOwgSTsFFQbKFyZxKtBFQiErMDqxzXoaNuMZQaWlqrzdFKezdihtuMFqxDGvHYISyasvDpSELrzJbnFmfTLCZyaKGrTQOQ",
		@"fSVtVuxQyUjbkbFKMrsBfgmmBNOAAHXfpPTSRbftYBupkPqjHBEvfrMlDKdretpYsYtwHekYrlEvDYjxbvZZZbDDzjraDygjWAukNOaENFflaamsBNVdxEQIylWyCTgFKZmJPBXRaGpFw",
		@"WIblXGSZxOVtqlwYjQOoapIHfVipKmABSgpICXBQjcIlatVLlPBqZoZeCKqVBtCyGIehaNWtQGYOqMHLdaPKTeNfQTSXyyBCcHxeD",
	];
	return AoqSKtIcJCgXtQR;
}

+ (nonnull NSString *)jqOwYNhUKV :(nonnull NSDictionary *)BvdCLhCxmfcOvMtlIu {
	NSString *PQQmAQLDVBTzHRnX = @"IqllhxmpJlgwbsxJzPMyTjNcozAVJICvLbNvTRmuGjXvXqEWymSGbBPGFBvSKIgoVQLjpcoBlXjORczZjTezwifOBHCtDZGQblMjnbljfdzEXrYkUMVbDFcTlEPLavkIkQIxAEIwmlenKpkBYWADU";
	return PQQmAQLDVBTzHRnX;
}

+ (nonnull UIImage *)zdQzHGFyxt :(nonnull NSData *)ckcNuVGxWFHVd {
	NSData *woZWnvfRNEJFJUxPFG = [@"CctDRFdQUWgmKyrdSqsNlYQITQplKgLtypupPVFhBzzEATcWvQpwGKwbBSMTAbjqfEHHDQzqKvuuaIVcRMcwaoELRNudiXZUFrjjkMCbvgdrBdnhxkkFjSyWqDcXI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IncDpPsmiRJTeWol = [UIImage imageWithData:woZWnvfRNEJFJUxPFG];
	IncDpPsmiRJTeWol = [UIImage imageNamed:@"MIVxyddFlQBFoIKwjdUcMrQkKfoaBkHznDaAvCbXIHOzkzoOdhVQNrlqNFqFEYqDkjVDDWUTQXjAdqmUQxoeJMuviRXRFDEuFagZSoEcBrQ"];
	return IncDpPsmiRJTeWol;
}

- (nonnull UIImage *)TMkbNMwtmf :(nonnull NSDictionary *)QUlwMosvOmeCDM :(nonnull NSData *)YWqOlapwBNAOBHGmF {
	NSData *nrBTXjQMfX = [@"ywvmLyJkGLChtDykFzpMVjLMHkHlHXHLWxtczNFFXWfaqGwvsKWLididNptDmTgzBDSiAxnPsdMTsOosOGEzXWGkPjfdRlFeqhnhRcdIqMANHzrvosyP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FvQyURyWKJrL = [UIImage imageWithData:nrBTXjQMfX];
	FvQyURyWKJrL = [UIImage imageNamed:@"JFYOJUZefoofTPOyPHfXiCnYUJjCVXBFKTUUDmylNreqgWSRbilqsVpECIbzbxvsiinKNGQTXORqfZMHHdPmEqrTaIGcWcsGmwzNsJr"];
	return FvQyURyWKJrL;
}

- (nonnull NSArray *)agCgcAsfofIIbCcX :(nonnull NSArray *)YCimfEeMHR :(nonnull NSString *)kJwMPNJRCsjnSY :(nonnull UIImage *)ETrPZWlzAKkz {
	NSArray *EGlythXuArPvHhfzO = @[
		@"XmTqfjOoDIVMqDublfZMAVWRDJBMxoPehrwlcIWHVxnRHWCqkrRfEHNjrKcshtMIUTqtZwCcaqTKewjYLkVFzaDBIKlVHPUcTcLsEfiaHF",
		@"guPAgmxpiJMbwhksTXhMEUnthFzHtEpIugHSLOoAfZnCTlfSBwtFtwFyDJwgNUHXxdiZffSNwXOsMLrFqKBxUHUrzFngoKUCxcCKNFkxWUqhVgElwMfkRhHUoFDAMxRSqcCiUiJdbfumbGjm",
		@"fVxtdrbmUDTeoZCFUzHnpbxFziNkLVSFacrsIBariXxLtQPHGFnpxMPTCgsyKnsnNbFGkZxGVUTNhTqfowREpWNRbCorpxXKtCIAYZyrEvHBFEDfdQxQzVMVcQQLusaphR",
		@"ZvDkKOPqpEuxdzGLMJzZSxHYwixDWYPCzbDOuMrSCWmjXTIJRsMnrTZwxUnHbEAifgfiVuuboeyTicRqzHrQgvJzUJLivMyEtXfqa",
		@"raHCAvnogLAScKkNockTxdWtvjkhGrRLlkduypnUqqiKgNNLmXMkPtDevplbEvVHnBXjpzSdVBCGuSZKYUrnoCuBbcxdoHLHHCnRmKjmuYcgRgpDKEW",
		@"xkenFXyFADUmmypdNVoQkdRhJxCXRyWPJMFefUCPcRkuNSUfMVCFslBsCrwqQADSIYDhwKhMAmInodDhAwqOsfBefURQIlRVnxVoo",
		@"qIhqQLRfbdkElKRFLHncDHkuQDcdTraCRcNyXqYpZScwQAHsCjUBgAMOCuyrapSibDEOKUepPluZHhCOrfOtInlLoTJnLtOoyxeQUuoP",
		@"VqlbBGExBMlsCKezzRISnTeTYxdXbmgDjidWxDDzWqKAldIBrUEShemRMIHrHYhlbWvilrHzJRJrNGCaWSwsmrKUqjYhdabfobMADAfyxfkQmByStIVAZkPKAsYgkG",
		@"imPLzxWCkKVzwYhRDgYfaLRBslumggmQDsxMAhNciIpEXCprspgNcPgBqMlxQckcaMyLoieTiKjhJLtDksTWkeNmIyGXUiiuWBMpNhcW",
		@"DWriYRdQJOywUVsgxtBGPqaxnTgGEKtCGlvgWuMUTBsIxzGCiMYwhpZpUfOFYHKkVJjAgaEnlIVAlsbVfaSXvkYyVtMhdisKXfSUdbDfjmAhUksvURIYExAYBK",
		@"WpWCdyvXnUdLXltfnLGvNQGNqTsIQMUdOBJbQAsghpgZxbOQxbCJfFHYqLuBQbsnsyFdaTSgwjodyWVpjIwximgBzmwgNPIvLUgCyhuFDDPtDoekxYWCOdLsWvlSmPLCYWcRsnpUWPIoKpChH",
	];
	return EGlythXuArPvHhfzO;
}

+ (nonnull NSDictionary *)vJDEJxalPh :(nonnull NSDictionary *)CroNQOgBBJDrPHp :(nonnull UIImage *)VYlgHTbboyI {
	NSDictionary *eSHFsnUVff = @{
		@"iPsjdYQwvhlC": @"ZOpjedMPCRUTCJPoeRuavOYajJihkzowOhZqqganYdnLxmrFzAsfUrfthOCrIFQoNKcdDsaBQoAyGdelHoOlVexJqIaSwaedcfkdBDIeG",
		@"OcpCfFoOHslqYYYUr": @"yfRYFXvqeJCmUqhOQtYajUjpORcXaDVUYezrUArGwujeNLDzzxusaPSFNmhECUOFjDnyrnnQhIZZRdeINtRLVkSXqOXPIsJdvRPCUeDrbwUXznFDZOVOmBgBLCIbGCPi",
		@"VlWVukonKUpLi": @"OaGAmnAMaJFIoMAMTTSsCYsVaJrsrbugbNIpepZHTFQTggCBFZQxyAlMEPithfKfqlBiHUzWsnpAdmXMWUDmrVNFCZJoMMuDXNwcwjfSfQlayuQPkuD",
		@"DrHeSJbfbNCONCWi": @"YRYCRGCIkTWMHLvVwvnSBaMInWKzozbGKMINQCCToJUEOwZyiwiwwVXHYoZQuUGoXGvVnrByTTHvraynWInEEBjzkFBuAiUjwYrAQAudczFxTaCXoXXdYyFRWwklRkRQZnt",
		@"gNURSyJdEguFjrS": @"WPUBHFLTIPAYMkXhRaVdidOcvtknsNgSVseFGBswuQDKaifljzrfUGSLdFPnPXxgAAojXKZXlseMfKmuLwvBVLJuQhWslqlUSBMAUJkwCuQZsANr",
		@"WDwIBFHFAUOsatvkirr": @"rDgmrGycmaokuYADhnjJgsQTmGoJupNxxApgXQiKvNluirBFliCfmmUHbmPmMuFmBAEEmPaTeAfwyeKrqjTLkfBdHFiZwTQrNCMowgdEmasSJBImxfoLodFgHV",
		@"EtiWIygedHsIQkTX": @"mNCeluYJfAzBNjYlNarXuocCqzlVCxROTCfYyODUxjdaHftOrczsYFnVVEghHgghQgYoaynAjeNTJsWPpTxYkGFFLjnlCfBxSmTeFPHbvLicZuNRBtBHYmfdcAuLbaPMgcCtIVPXiAmvY",
		@"pdhjKevtkwwn": @"VesubMWWDIsLQOppmEMASfrbJnyQMPCmVRDJufIiCiTaoQlXPPcDtUVkJCutCgAoKnkoLZHmelhaMUTGaFTuwReybUKPXySUvjGoMWVzZZVqbJGxCS",
		@"VbmmBlfgTzxUBcZLbP": @"OmSQUytzYDDOgGRNgmSZUPmGFKYwhYzNsVougEOfAnnmEtlpDckxTBAqCdJygWUtIRnpCtOZVMoJyLYkwqfHaiPdrJuoLDqvUTjIa",
		@"MHeDdIbWMLqMUrGXpi": @"aTyaIDfhGLlsYQJZpjSxBfBewMkHljFntlRApHMeTomGZdSJPBqkGsbatwFxSgYDbiQhbjTvcTZEapXSIupBejuhpegrnpJVxdOexkv",
		@"JPRXlVzyVWcwWsy": @"WafgVjpaUrcaZynyBtuuOvvITXvoSCeDyUPebJVEucqUBCiSgztdnFfKSldAFpiiWFlglsryezHgWKWflXFzqJvNQTIgZJLYZmxKaapWSS",
		@"zUGttkBpFDY": @"BeMREHIfEDWJaAVhCXgqDcjTtLqGAhhCDZrvXbAoOQxFuVddTaiYdPqiEekNXbnjbttOGSeeuCOmpSpLYQAbjFRAxzwxhUemKbobpzYkztnsUpVTJAzmVxspa",
		@"ElgxUAmWmCMIBkZ": @"HJzRssPUmUimdlxQTrKowPscgleACzWAjlxTrJjRdyyscZTryGtfxmajkTlNrsNRSlbFgfzoGgUdkJxEMJSMIVdtYrrGuAQzOCFSCtwwAJIOlWNBBp",
		@"UrpqcXDbTfARON": @"XGTtnHWNnneajrlGZxtlRjTpDLxmpFNQQfpVTnMJvLgCOZHtzEbUHvPzxFHTfIbkHQhQfGSiyXWkpLJbLmKozedFszZSVeJvyELXeYWkgXYXjNXAhn",
	};
	return eSHFsnUVff;
}

+ (nonnull NSArray *)WesAIuiQzYNa :(nonnull NSString *)OPxGcXXxrUGS {
	NSArray *ZbROKuuvZsRt = @[
		@"hgNriGGvyZQVQkKVCdDElnFklCYnxLzPawtrRbXmYIHdMVOlDBqarStsMyCVfvbhlORxyesVgHoXtQUuaEpWKwhzSBMOyUYwDmSSxxdZmmXDmkxlGOJscwaRRvRiTmKXRkokTw",
		@"lpdsatgyaOfONVFezsfnYjjerWLEsqszJWMlUsKVPZSqlIbsnIohMtSqOmSzDOycjbOJNxdMDnDEWEsfuwQALOelcEpGHyLGwuktVqvYuoalmQHWriqSTnsNgpugshtnQU",
		@"vTuOfkeXYtFwranHtTltVvqtChokRYnMgmFbOlCqpNDhwNteRUGrgBOHePPeyXWmgrWauUTTfGMmTjXjvofDvOnKGEBusDoQCnxjAMpLyHiqdJRHd",
		@"FAxLPWqKdqkLQzcmIoNGhpRzdUFtrkjBMwMdYzVYbjhjzjjXsDCWDgzmXZsNUbKggyGbUCHLtiGkthwAlBfuIbrdxVoIhusJKnFrIedvTxVYmHySEkioZQFZLxOyZxzHMJPFAtIShHuk",
		@"aaTzqSvInwdkDqAZWpptkPjUIFgHqSTTYjnpmvOqLbuKWOjsRxmpsVjTdWrSHvkZeTPJCWTfbpjegkZqSoALFTNYjaQTIoIcNfugkMEATtRmCYqISUQkXnPAGPRuRYiTxUONqprxPsrwldWvJH",
		@"OQiaCAHnJyfRGSUKuDZMdLYuzRDHSUxeAuErXqfZWpMQSOyCNtlNwQopapjumdNlaWcIvfjQZfMbkDhRbfgIgWJEYCjoAWEbwWUxdDqvLntVJlvIJsWGBueJGZmQIGcVskPgAqTbgelSugwBDT",
		@"SaMDUpiuPbUmBDlzMFnyOQVgFZChnEqVJXzXSScezaqgoPxKRbBcGpMgDODQkYXzzgKlApeCvzBNqyAMkoRKHHhjlpFtKdScjJEAKTuGUnezZscDDGQlyOOhnjNbMv",
		@"GceBkCZVOEbhJUOWlELRgtnburuEzIymwOLZEyIVVxvVMRJxrZRtjcGhVLUcNcuGdOyBMfJLwMthaWVdieqzSWYOmaxIPpYxSyLFyuWNvgtDAYxjttvvFVckQJCWPMmdIhgksiXMefPL",
		@"qUJJSmMeGxCAZvSDTORbILmRaUNfEIkVPVMDOckcIuUlFMJAwQcbadkyEKzZaIsdzxgPJvjmpHekQETTGUavPEfFTfQbLgVHNDtbNiKxYFoeJWIprAvemRgDYEYTjHtFBHtiuA",
		@"nUqbKcvNsRilfuDkxkkjCIfXNUHjfAfdAgnkBjQwyLhrkrhfNHIdlpOHaadyoBTbCXpfssSJfNzAoRpEYJpIfiPeggJaAncxGqJHXHw",
		@"xzNSXfqWbuMQMpAvcuiUGQhHOzWZEzXDboxjFlfdZxVGurMKsTWjUNeBtLszvOUlQOFnCjQpEkrTNjJioYyvupRKhqvZzafeHVJwKbZUYdfjyxRepbhxojd",
	];
	return ZbROKuuvZsRt;
}

+ (nonnull NSDictionary *)kIVqiJTzwxoxbZxd :(nonnull NSData *)QSzOmscMOo :(nonnull NSArray *)jbzvLjQKtWKt {
	NSDictionary *KMUGJRNhwRy = @{
		@"YlMQWTWWIls": @"RaiBryVkgmBOWRoLCnYGhrfXFZOxTPKWSmVmROEwnhSrQSWxPpLUfFTgJlCiLUPmeMOYWOmRXbGqdZzASshmAnJsqUHsCGBYtdjaQNnCmfXLbWkZgtpBvtEmdmwVrgKxrBCHTpNuobSpHYo",
		@"KcDnygXinZFnC": @"tgnOYyEVeLoGTYTWRLwCXuucBYCTVTcqbjPGohoPqQIPQVsVkVBCpZvuKZSltAbqHMyWcoabDDSkPavDkiOthtCyQXiQIwmImYoldZEyghOwssykIbYzOkgYwcMPoeACnHwrIIWKTgdAE",
		@"IPfNfUQPtZuQ": @"AKMfRmJSOWagGoLRFpbGAJrccNFdoQOmRmoddvdQvzURZhYbvELeIDcCHTwtZYtntOkTaVGjScWJaoPlgKiXopgLEiqCMvVKujRYTgVHHgqfpYnlG",
		@"tpVoTUPbessz": @"SiVBZPlwztULcvvnwwuyRnuMMnbHeXeaogCdgJKiCzgtNOuptbpmfdyHioFQelYhQLVZxUlRvchqSNSZnIcjHVCZScYTuucwlJISeMbMnXwkVclRrvSmbVrmpgxmvvsSbWaSFqHCT",
		@"VRultVEFYHkR": @"VyWpjVKZSJTwxvAnzIRkdMAXdEYrOSjAxeCkDClfSKruLNewjXWQHVpcfAgtnvyUmjixQqQYglvyobUqzqkfILmqrWviAVQeqVWhBZcLYrWidzPaHWeKzFopVkhdHBwjwvFkVWkVRIuNdgiuym",
		@"LJiJMYtwNXhf": @"cTWUaacEvtMPDtknfsgnnffEvUyAJSDzRliMsNyLCeBjIaHZMyYPTUnyitHtHUjgQnCkmamUhuAjdfFwSnNJjKJKIqTqyIOlHvamdAyUGKV",
		@"VzDpOGbjHXXmbv": @"VSVDonSeyISgMOkGvQnczSZjrMxKCwGSwSjXMQDTkVLlwxphXZeoevVlwWMWaVjjzbtFLzrkHRwNmoKEdvaUUpneIVZLFCEgcOTCOhvfsgMEWLMgfqhUjDxVCnDGJWWTwXUOgQDrdkQFWqLit",
		@"JBoEqvQiecZLEdkeqj": @"mCYremYetELSIfOUTmZPpdhKfojsCrPWfZDNwTBctaoTQvrnaojJgMqVGzpFAZEiDHIEPfFPOmWpTIrowvrQfeyfEMXjHWHkvYoVPUBtmjuPuDcesRQjAPo",
		@"zBYLUzbaoxtaGu": @"ptfbomkpVmWSAZKtwxnuVzeNyrboAbPZESCrClKyVLlkfqQwLjejIHFHrAquRcRfzQmWlQoGdJWSueFHxlBBhBuBEytDwticTKxIgGqtrP",
		@"dqUJEYUaDhuUrJuKwj": @"bNPsecEVOtrtknMlqIDPqVAGchcjePIKlThwEyNYMXZwNcRSMtpkdtopmwTFoYbtirwROntWXiPOjChYommjzobdUiGXqolVCATniVjkrdMMsfRNFNYULzWo",
		@"WqhVmZNcJJgZxa": @"LfpKZoZjdErteQFimvnwuqtyfTaolbnlciYzJtRXCRWaIyCpDTUCDHOEpJoaCGvwxeakhAkKTyzYRcZxKPwRCpSTzKuiYNdmjqGhchbykxueBuFvkYAHnAaeTZVLsdSwyefNGB",
	};
	return KMUGJRNhwRy;
}

- (nonnull NSString *)nyeljnNgHJFEqMR :(nonnull NSDictionary *)dVqDtvLCIuM :(nonnull NSArray *)ebcNMFGJIoTujKEYkV :(nonnull UIImage *)vFVGFthhTKw {
	NSString *jTGWPmfirhcI = @"WqzRUvNjhqxmMxYjHZPiveVCTQcoHqwUvZMegaSuDghqiijTyIuljOBRcrcUGzpAhvElnzcqvPvWosPmTOtQIJfJPmOGyBeOqJvnarJuSahsF";
	return jTGWPmfirhcI;
}

- (nonnull NSString *)ytxHLnGnlIFXZ :(nonnull NSString *)fTvQlFQmUEATALPPaAs :(nonnull NSDictionary *)CdRnDEImKYnokaJO :(nonnull NSData *)yzbZFpNNbZREDD {
	NSString *faeZSLtqOiKBWPGsOUz = @"LAmySYglQkMvwcyNQPfyvwdWDtzbDOWHgJAOUgjiOUpfCPNHrOHxHfmyErOXeyffjOCrJqvWOdKTjVaVvdcJEKCNHanTkNIFjHZgLlkUQgvczVWoAUzIxSI";
	return faeZSLtqOiKBWPGsOUz;
}

- (nonnull NSData *)tPWuXdhdCsGvdgV :(nonnull UIImage *)dhWTQUryRnIaBgM :(nonnull NSArray *)faRRVSGMvnHv {
	NSData *osyiKBEYlXhCn = [@"XxvLTgAfxoIOMRqBEEyRuuXhdRHArlvVfhrefdWmXEhOfXHXNKXpQTYmhqHFjRFyiSiquXoEdphjAEFrOoyOWxXKewWGqsmYQpblziyaGQvLsblCtmUrEvZBkTUFFvwTcWSZxPVbQSnpEriBvQ" dataUsingEncoding:NSUTF8StringEncoding];
	return osyiKBEYlXhCn;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

- (void) send
{

    QuestionController *questionVc = [[QuestionController alloc] init];
    [self.navigationController pushViewController:questionVc animated:YES];
}

@end
