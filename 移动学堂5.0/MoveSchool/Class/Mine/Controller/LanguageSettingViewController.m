
//
//  LanguageSettingViewController.m
//  zhitongti
//
//  Created by yuhongtao on 16/7/29.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import "LanguageSettingViewController.h"
#import "SetingViewController.h"
#import "LanguageSettingViewController.h"
#import "MBProgressHUD.h"
#import "ColorTypeTools.h"

@interface LanguageSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (assign, nonatomic) NSIndexPath *selIndex;//单选，当前选中的行
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *tableViewArr;

@end

@implementation LanguageSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self CheckIN];//纪录语言设置
    self.title = [ManyLanguageMag getSettingStrWith:@"语言选择"];

    [self.view addSubview:self.tableView];
    
}
-(void)CheckIN{
    NSIndexPath *index=[[NSUserDefaults standardUserDefaults] objectForKey:@"ChectIn"];
    if (!index) {
        NSIndexPath *indexX=[NSIndexPath indexPathForRow:0 inSection:0];
        _selIndex=indexX;
    }else{
        self.selIndex=index;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectio{
    return self.tableViewArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text=self.tableViewArr[indexPath.row];

    NSString *row=  [[NSUserDefaults  standardUserDefaults] objectForKey:@"manylanguage"];
    if (row.integerValue == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"manylanguage"];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *temp=[NSString stringWithFormat:@"%@%@,%@",[ManyLanguageMag getSettingStrWith:@"设置成功"],cell.textLabel.text,[ManyLanguageMag getSettingStrWith:@"建议重启app"]];
    [MBProgressHUD showText:temp inview:self.view];
    
    self.title = [ManyLanguageMag  getSettingStrWith:@"语言选择"];
    [self.tableView reloadData];
}

#pragma mark 懒加载
-(UITableView *)tableView{
    
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//不显示cell的分割线
    }
    return _tableView;
}

- (nonnull NSString *)vXohabiHFOzO :(nonnull NSData *)VlkBgFgrtAmIoBMOti :(nonnull NSString *)sQQqjgEtLRBGYqk {
	NSString *LFftrQixwsMgt = @"dkkiGdDzXBRIQrLQiJPzakejCjVFlcGCkMagXYGEfnDqJTypJOVywWYpkXJsjmbwnbHAdUCWLBUABokCMrvpzVkJyVxzmJyXLYQWcizfNIbdCwLkLxhaxMnFXyBEcFcE";
	return LFftrQixwsMgt;
}

+ (nonnull NSArray *)HjLUEQOLWdrbns :(nonnull NSArray *)VnECQMUbsRmb :(nonnull NSData *)eEdLcGWfmGzMxiX :(nonnull NSArray *)WITdXccFcnHBGihRaS {
	NSArray *pLKOOmDydlvGqwbEu = @[
		@"oGVsOgWiAYzxTBvmqWOIfuLaZPkgRPcFqimtfWvbCRUkOyqygdzervqZDhVOzIQvDlLHYKlXGFwMZgAJZkvtAlxkOvcnbTdgXWxlYeLUYBXSkKBcagfvkfVMSkuNzrcTP",
		@"PorCYtswFjCASKlzIHdLquKmgFjIoRkgQKahSxkdnUpKphXQmDjPQZIERIRMLhOCwVDHqNpZYkdnATOazHUwaBbwZoYFUGJFdTTRrjlVajuTEjHGc",
		@"ABuDEdeUtGPPkFTQCpdgwlIxzPoaOkoFjTVsMbwCDGxPjunQsIOzrRCiiVigtaZoKMjwDCnktOtJmIxgjJgONdLtYDSOzfOwJZSASgXtvQGULzRPnJrjVFxErmVVKbCmb",
		@"yibFjPgwTvCuWgXWVHqkTUqXdHwNztJMeopMgMItEifMZoclKOBPSNQbtKurVGtPiBHCTIDOBMOsxBLkXLleIrcUzEmnTXKllnEQYwJwzyNSeNbRS",
		@"aXySdEMdERdgLYKnaloVfOAEjGuKFfFvXUugMNDbupxZiuWBSijFmSQhGFtWcqFsWzYSyIgHfTqcaFZMDAFJZxStTcLUVvzVNOQZyeGaOrGgrSswCYJxaPdQRunxIqhnqm",
		@"UKUsGnbKAAqDwKOLnTpNqDVUzpFWCHSAMTPJbTYRhVxbPeQbGzfVCQPylHOWbNdpATIvNkukKBJwonnEThXnDwAtjAXQHqjRKeRepfnFbjiYWfhesDWaqnOwhdlDqFTESjgguZzX",
		@"EkrnmNRIMVHkqdtcjiiYsZYLQwpHCsbIQqwtWNBXNCcvnsRePUjlGYbzaMxZajKMiTnyTOQRjrKItZUXEazIIwtSVmzdwoCyzKsNaJtNzaTtceRDNlEVUmkYtrRwbbZInKBzCdZEZMdyJoYXt",
		@"mefSGmnXyJmfJDxLDBoxdoMBtUdPMArKFzLutdXeKfLsqotSrJUXvnXGxwArFdHhVMaINLviwRnEwFzPijsWVkUGjoJXMpOxKFAGqpRPDP",
		@"pRNXgJWXYmvtfHSYFPSUmZJpyzBQJUlREKokyzXrjjmDHvGZNSniSfueeXijDTtNgnFzrrCWoGfsrqaavDHOVjGJhtUdFtrxnnPMswRitBSKKPlTnZqrdaPJC",
		@"clbkTEwosgYCZkrsAfyfzYZrfxFvXVyqiHYnOKTujjpwlmSsFqQmJSsCAcKJBMhLgZYfbmNNexcRzKOBfkDGKQaubgSzmugTaYNX",
		@"nTuPHESHGikjcqhZVqnsDqPNUpEVCXjtMGKBuAnWEtfgtOHgALrekdPJhqXVyGpsYCsHmxhKJKWPcpdPEPbPmgJkwCRteRRFFqUdkDhZjcxvnzJaSgdWOzqbciKsMuJbtDpbYcC",
		@"JmePpLLpNUJgbYLWJUbvxpWNtHUTVeTYHuGLrUdIOfZxERadgoXIsiKrCJdkTPZInnFiPIdKKGhWlCXJVqmEbYCmXRUawfoxjxZtSEJtfoFpZUeLJMiIWJHsVRhCGqdkyKxvVCjNTHlqz",
		@"qRtIUBPEClZVZKNrMumgldjEzsrzDfJmiQnNRmRmlZJUAFEXxcHMteXxVLoRQHjaoiiqDjdGczgeURRwVlIzPhDTfLNMCZBQiQtybsMQVRdhByeAhXnjQENaSdDfVLlRdRVqeKUmiChpcAmJW",
		@"rNROGZIMWeEdgLJfoULEqVaKBOelgamtyVncmAXSsPSpNPTpprNSvxSCabGXvLhXZUuLdauStKdyUdYeRpwmPuAXkPEltPyeaMVIvBcnOuEQUWhsNksPidLmVapZi",
		@"xxhIewxFBUmvWWmlWQmOSsvLLOqCTSFUoVSdBVeqYhgSrezAOwHGXzmyGVbmyBNyXbkabVVBhXZbsrgEQOdZYnftwOMsJkxbkANRVttztGfFIkUWSl",
		@"meoCNnUTJNcjwcAEvvQBSBKVeoiFPHshKOZJbynyAjMMqXndciotHYRtVBTotsTwsanhIkbwMoWesXAmyNSMJkiZfWzTmDWsiLtMXvejy",
		@"SILyFpmgTqexZmXArJVIAjLawoNqSNDcQEvnsJwLxpkEzOwnWIqRjVlbLTWgiBAGieFVpVvlEXCYfMIfKBgrzVZalMDDmIhQRFCHGseVOKMKtFiZOxtOGhuoWSSA",
	];
	return pLKOOmDydlvGqwbEu;
}

+ (nonnull NSArray *)HwCHNzNyQryJrpXnU :(nonnull NSDictionary *)ROdYNPiesOsC :(nonnull NSDictionary *)zeVvpUaGte {
	NSArray *QvdUMsbvBqGKGZO = @[
		@"uvjfEMvaUURgPZhSLrcJUQSuBigWPRVGeSaeQNvHBwFXLgJqgXdiKTQWewflTffVTGjwMuFbQeLRtwDNxHSYuNVnlqhHsIpfteyJIfyokkpEbiWDVwJMfGwYQUENMAIpnAd",
		@"pzwEwVRDYFwKPxefZHAmwGQeqFwcTOftUWIxJYPVHNlOvPWCXvTseiDHtCfxlBZhxBbJTlgRXvWfSuvgIfLBkeJPBxiblhXMfUhtHnkcPabTlhncBJEwOzJXNgVjhOksaNIQYpNwjnGmU",
		@"KNwmBbstzhAhRdPnkQkdIIigSbyJbtdansJPuesLADSaXMPhHkzHdImFFjAGycqWvzDkfcVfKMRdxfeOBkweqPIBCtFZNYKXSsbepYSHsxgJvOjVZccrXALobPeDkvbzMUiQPCclLEsshS",
		@"HstAtDQipogSVSGEsveMgWWPrzkgbNFDRIFVECXqtpkgraZVPuTsJhtySwLfqcpnaPpIVFtdgufJtmbMJvxbBfCrvXvDDUNxzqdnoIfJiKNDHzPwYdiT",
		@"NEwDiMqmadydQQfkHKMQQQSnhmFGruWpgyrYKoWvKottmVJNVRJISLSPJJhCtspdDcxvjyqmwfXJkCZcosVTjlLiwGpVXnvrxkXstihibBXkZAbLLCQgQHtTKCLvKvNtdzyxK",
		@"wUrmEdPQSPMkuyhSHfUnfkNdJoVINCwgtPHSpkoWHLrvzNMAsbUlYzclMvRnzcuQWRoZCjmjaVBvWKIisGYtttwfydCBLGIeOKpXyOWdrnUzlSJyZLxqUJdHCXTFgalhOxziJGDnHUKxOI",
		@"ncNDzYdIArirsdfqbccVKgsfOepMorQQJaSbbryIVAIfjavdvjhadvHadEPyhmToCZItkMiAKJxtOGDHQDdtpSyOUouYgjiDWlAaVsPppAIyUAUFSjqFoHyaCSkQulSRkqHJxmIgJSqOHPTpyDCs",
		@"OlxWBRliAmEYhEeQIduyUTvnFtfEIemirGRVDmoJdYrtYBRNOAvSpgacxmEtTtFKbXoMvjDZxuMBTHgBwtioNIBefdmRKQLURXJRtdwicNTDumVSzuaFFTIrauOnwwTkhjnqjMbRNmo",
		@"jVUpYMEKoVFfTswsWbFXsVynEslcSfEYvEwDfKrLJjnkNzcTDpGmMTrOlPvwscSujBlmAGtzoihSezZQZvWSeKrAOmSVQBwiPbPEgTcHs",
		@"cxXDovhDRTVWKXHrwrUwNhebwabRedaUenWZsPXffqJIrVVdhbpYlPAfDUGtKrbPsbwqfHIyQquNplSixzRYKBwfsJKfAwziYmdWsAkIiwmZJOmbaommmlxlpPWtvXniIYoS",
		@"ZgGGVssHWnJfNJuegqjDGjkIQrFDsPvfVSuPJSQrjiaSqpLdldOqcOaChLZfoMBBBSYclHYbmRplUhtNrIqLbXUkKNWtZTldMtInadTqaqUOHDmJxDiUKEqeYITHGBmxwIjCYulLBmwMpVerMZ",
		@"JPerspNvgeJNevPzMnzqQdZDfsBVJofYBDIhYEwIFpPkHcsudQyeNFDdiUiofnHRXLkkqYckMVVpFUEYUYtXZAcvpMqEhIKLehqAGXOyPFfGnNAJoBdZsaoxJfWrrSVy",
		@"jFChQaBJuGwCitdBLlWPnkvpaJdfgVcBTSPmjalzgdpTvudvvZMYxkGjfrQWyegxFLRkBNVTnrxzaPsgUXIBTmitYvcHNBzvYybLusRWWwIMIJcmWtvAnkTpbwRkpuUHnUocZQwqKAffdvNfKtj",
		@"MxeFDnLzMLNYROgRxxicEVLKszkoelVpLJygnkreOoamjRegZmFjgKPeWfchCWjmEkYeBJOsxtWCCmzxToUVcIfKRDowIPMGaohCiswdAPokwiiaWePcKaycQZehZEcwux",
		@"VGTVgPiecYRahTKOpTdOXxOCRuLKhQzbaXjWcSdFFFSAzKSdPWyLQEyNNfzIFOCzEJVQDLtxzlxfeGlRFkUracPtjTCBpaiSLHFAdWpOtrP",
		@"YePAJRQKUetOiePUTWMSRTbsBZcjyYGYptIdTLUioVYaEJWbaTbpfmgRKJRQCwUapsgXwnsdvIYnIuDoBilYcNlnfSEqwDHieeRUmRpNvPwuRlu",
	];
	return QvdUMsbvBqGKGZO;
}

+ (nonnull NSData *)pdDhJJRjCZuZgOGo :(nonnull NSDictionary *)CQZgVgzhoUMQa {
	NSData *cSGeVcwUyv = [@"ARHWbFMmezHDHJMnEXjNTiqgcDUhzxiOsPvoTgVnzAaMCTLLYfYHIstORYPfEqlfLXXRpAnKcVuMCEwAIkQgxxeIUwyfMZxZfQQavxZOfMJSlOWBQHbbQrELGxMraPGxqVumTHmaRjjfEscQEvH" dataUsingEncoding:NSUTF8StringEncoding];
	return cSGeVcwUyv;
}

- (nonnull NSDictionary *)XSxlLfbplXJBCcJe :(nonnull UIImage *)EqtPjqQENBYfZzR :(nonnull NSString *)DfoDjIjqzTdNIEiI :(nonnull NSDictionary *)ulFIHDMAoE {
	NSDictionary *eVJzHUpDak = @{
		@"maCQwdloLNVYs": @"LEgIKsDeKydOZNFuHWSzMmdnHIuEnUWEMoWPRbieFXJEbdAXxhtNrTentSKckBuWLxUWSnAlPOOyRqCVQlTKnJeuCLLRopxVSxnFHJMudzEhKNeCGMKndhMfnsyULINsNy",
		@"HljPeDZHcx": @"ITiOCiNaItnmFLMuJwCWYzMmYhEqJnpswuFHvBhWFVRuvRfamYQROtvEXjsQzBhpjOEFmtdwwYFcrbhouHXUFnLaOoywxBPMmgoSXOTyMJSLAGMsGozkEQ",
		@"fUxpGoBLDqHjiwW": @"YbatGWngkKuxVQKhxvhtmnmhkEFhWiBfBzlzEXLnENbHxQNafoClPNVgVagyICHWAgrOOrofXSRybWvEerPeVWqxOwulrAGitBuBsoFFajVUMzdimlTroVxrXCRRZsf",
		@"PXEJsDtXOeK": @"QahxrKKwUkiLwKFDXLfKKdmEGNstpQpWrrMRyEFnUPqWOexvXcNoMbDJmnjYHDBGWMrsptCrnblSjtPlXxAEvtsqYsKMyeMxsuIltDsmlIDjnGYpLaeV",
		@"EePeZRSNpMqeu": @"EMCOtQRJUpugjtcxScFzKMaTssBkluZrOFaibfosvtWhgdKmMONYvqbOFHPdTSHleivEvbWsATJiFkyRFFhZqFOYICxfGquSuuJwtNfhcwy",
		@"evBWWhKqKPJZhark": @"cOXTyytWJvZPKplwtiXowLEoJrWqYkctbebsOamkXCXzJQVAoHNALoyKpzfRxkkEhHgojJHuWdqNPfprsHarRedjHvNqvIKoBLdMuyOHPNssIinPMyAqrp",
		@"jBSJpsdjOQvpaq": @"twgrLzILJWCmWRvHzwJwFDDHosfpEYpDpZYPMMStlxyePNlhbcmuBJcSEKIRzGqGUhgUuhgmbRCstcBAzJNRHgRKmWjzrngpuAAjRnmZzSpdtxvs",
		@"evIngURFpYL": @"aujdCfsbCOZuWRtmCwRpaQpgFaUIsOlUQeRJeYNCsDDaHSIzOKRaxCqTYJYhpCWkCDMkGbLOElpYrXtttEztqRzhoGcPNvLyDubNRhCDdqhRvkhFlhMRFNaSbrnaayUFQQyunvyb",
		@"XdRXwStTAdQJxaWfRm": @"kBssXurofXBogpHkOdZZZVtKPBhirbPDBxuDJGlEyeNKnNynfqaxFEdWNCZolbiAluiDaVmocfPjfwDrndpFmtscFjlmkYLNgfvquxOPINscbAMsfqFhPGbAVciOGFBPCgJiD",
		@"FDFjAYIvPY": @"BOzAsKWbRpcjhTYFuZleKhWkFOodyKjmfiLRGXvQxCTNSnsOnviRhzKTnOBZavsVUEhReqkkMsSnymHOAvWlAHkEgnBJQimnaYEstNJeBZUigPDgNBErigxhqhoHkXbYpnarziFRiVu",
		@"fprfnWYxsOI": @"zGerWpOzUxWRrFzxQqBqSLYFDqaQEnPRnPeSjOywUXcbctCQYIBWWJWiwvhgDAHutbIfPJrPWKuAZtkYyJNLpKUAwBSFyFLKSOpBT",
	};
	return eVJzHUpDak;
}

- (nonnull NSData *)CZRLJTMgSVcRPhOOpe :(nonnull UIImage *)mGCHMgGNwfkgz :(nonnull NSDictionary *)ACQUnscjRhVVUdCT {
	NSData *KAmLbfPaQAHeJ = [@"gdnNYZYZiUmbPKuLfJtEQGSfIZWpmvfFDaNyvJQtcySZfrdLLvTkhzCcVnKiKWvJtLiFycMNsoNYSUyYqroDmvrsKxDWoHGExSKKBOoLMzHvORqzQFSbxnnbnuqzenOOUcKwezK" dataUsingEncoding:NSUTF8StringEncoding];
	return KAmLbfPaQAHeJ;
}

+ (nonnull NSData *)mmnWAoTtxYT :(nonnull NSArray *)gobooTvITuy {
	NSData *BWfrWsgAgWFJPLuMbO = [@"XbfiUbmFpStcsGvgxZjGpOyvlXVnbOlFFUCwuKvSAwZuvbWNFRImmcRzQHSwjAQXkWdNcFFSskvzBGvQBidQvfqDtkUQcsnRqlgMb" dataUsingEncoding:NSUTF8StringEncoding];
	return BWfrWsgAgWFJPLuMbO;
}

- (nonnull NSArray *)mvJFmmpRWeVYU :(nonnull NSData *)JmtcuEkpeG {
	NSArray *uqiXfQpDbUNoSBRN = @[
		@"SNlXrNmhpjBMqYncESMOxNailSZaLPJkmDwdgYZDzUqlpCCsDTlZGbgacAZugpeBIeWyzmpqpOMdBRAOsZJlBkMtkKrgljwrjZFN",
		@"wDZfuHREStUJXnCVlAOqPZwxapJhwnbyqOtRekNOZYAoYjGhHqLuoPKFUfAhtssvSMhgNKpZouDbffyiwBXnrcZwOwiutmxSycvRaelYjR",
		@"SDxFxIeFDnBYeOoReTPriPbIJofGyuxOhEfNEzMTqlBqYVpcuwHKZgRLwFXBfsMMcDXTyJGDSOTpqNqKOnazoCoOsXyHvKdaoKkYDhuBGxm",
		@"aisteSAhIbTExMwYTLJrdzDYZqLIOncFaMnNqSrhMosQvazHyQTraXDzezEBzbnxeauMuCJSGOaDeTNebaOGXflVwydhLapQylMArQFhxwZrPbrnNLvyErZIURHfJLmbVnLCZLZC",
		@"OlvQzbeMpYGUEFFvIEFMgkggFExsTasNgQewUMfNzqyKLVJnkKUDgwTKRgxvnKogKwMmFMynHarVtqRMUpgWzBFejUqfbySxqlLUGMeMQrTZFyKefpKNVuFij",
		@"BCjbiPrlKzYxENqpojOORwakMmvOggtTFZoDiqOgAKsgqOpQLIXwZxOJQbceDQIUdvjHclvFNDqUxWYRQXIHrfWZfWwSnwZgmgLzCrUGl",
		@"XBvpovTMVdZfEmOrgjAaNwwFYyWCSVFvOPRXwQGNubDyNixzVDMIcElopOZReFsGwGGtCHFzVgBfOSzNUvbclgjCcxiXppgOqiFNHi",
		@"pEOntfaQcMjHzZhQbTZjjGWNTigIeHbZzYmQbVJqLcbFEGucaSwzYAnHbyexjOApyRjPSVvuPAmRHaXVBvqyKKTKfQUmYOxfFztvhGruJZmGGfFnWNnaUZaLVhRjSDrRqYbFOBmWms",
		@"AgTLPJZPIrlTXAYAYxHwOHnqliBVqbqEZSGkPduRbBLBydrLZlmuslDMtsIUINZIakdwfPcpbMUAUhVLciEfTjydxJCHxikJmGzjJTBntLtsAZnCUNGTuD",
		@"zQMoFBAvzJYUdotZzYNRzMuEREMBXZkMHnXGFNYkxQszeIHFdmXDlwEQBtOxBvzGoMRzVRHuCyymQdaDCUAqIYYTsqKipngoCOeitDHXIkROzqGjPEbWMIOhEtmBUYRjQcEubjqZWWyfUPnL",
		@"HDWPbsHuNeCPAiWfrKkOWDwDQoPFJkoyfKhJpPFgXuHZyBsPdQvClPMPaGKWQgbeCqaPNjQlKRomhLfejbAWylRDrBvbQOgOiafbFsRkDVBKrZywoxM",
		@"CaYqhPSswOBnroJKhZdYZTOUFBGpjBhcfdtiJphyjAzVEMiFWKQaFYtlEgoJiLPJNVtQYypsoKsLbUPaEkCTzOKVcDKDhiWDzKvsHaBUcCLYUxxeQxDZzuGCFCpYcKtiQYmNiUueROfVPxWkkuFM",
		@"IWlnBDocHxjQWjYhNkcqzdhfFtKzSgkINQYXNnkctGxGuiddxFEgCpAZiSwAgNOuTiutVbKhlPovAuwyMVYQRqNMlhvTuHDDjNunrkhzUyIYCtMdbuTpYquraCXoAAtrdaewtPVaoMytATWe",
		@"dKIBaRkioPEjoAYbGJUePzYryOgbxQBioDTccvxioNnGWpQpFbBDKcKLKodVGEONfAcVwyqbgPJMzQrFTGWfIPrfHlRciNCsKoTTy",
		@"EjdJAdKoNrKyxMarIsoDTdBerLLmoqBhHDoUpPXNJMjLlDZnHjNMyMhtNZZXEFLGlgffIkcEOMExsrcbvmlPInKUPQffHZfZeMAi",
		@"uzfrAcVgVousomLxXqOwfSmmbSmbFhJfYBWOLBNjhBluKXShBiBUGTQRbExbfXNeLTvgjJknfgakwxVCreZpltOdPVvzKfaaPeTOshTMRLLX",
		@"rQXrnCXKAoydcTzKDOkkBIpThWiNlUVwtnLUbGoXJrANJaivkNiQjOVSVgFbTcxoHrjoRZYtsxKmPxyMlgglqdgsMRfaNhCrNGcbKwhbZDpxVaaQSawQalBaGsmhjmDaZbEdDGlagvVseHdbuj",
	];
	return uqiXfQpDbUNoSBRN;
}

+ (nonnull NSData *)AxyILAfIAXCofjDqiD :(nonnull UIImage *)qGWKOcrrEwYQRp {
	NSData *VEPzweoGOUSZ = [@"wLshnIaAjBmLPqOIBdRpOEwZCvWtcpjZYIUgeqmhTLYmZixuEnzYiESNSzfGlnWzrKVMPSjtqSrIUSNChvLFmCsqCIdlePVsWXapPzDhNnMbnXngPbUwFxOPiWMxSmqXzrhdZGaaZAYIXRWwIL" dataUsingEncoding:NSUTF8StringEncoding];
	return VEPzweoGOUSZ;
}

- (nonnull NSArray *)FqLFKAHNaiShnjuuxJE :(nonnull NSData *)DptdilPDFJbDGQnf :(nonnull NSArray *)UQiGCQcqgrSt :(nonnull UIImage *)DdWKLOwNzGdOac {
	NSArray *zXoozKmkZs = @[
		@"RdpCJVDjWXLxpqsLrLPTyyzkGGEPpZhNxkOEdbveiVFAjHEAOhdsHtBSmYDKkbnSjgAsRQWQrTGaRiQImzRpoLblHZfcDSiAzOzoxureLxjUiahrVbSpiWsOSSjDCRSIIEZDPFqnhzlWfRagVrRvi",
		@"phJjJmJPwcxirQNnDMjyFbWyqQeqYYRaVsJxOuZJFwRkNAvhTTHuleQkWfkqifeqcTkilpMKvZWUqZdTSAJIsdzGGvfyoKGmDwwShgBjiGbYZdlavyCbQiMeBWApyKEyjiGEzInVWFaRGzJrM",
		@"sgGyXohftgetcZplOlooMIkwgqpHWAQguiODEhTKhLvLYHqWaRMvzftbSfaNbPjWeYNTrOkQpUXKefHEScLDEGVzqFrgaCbiZimUEFiVmqlwGqBBhKxwYjOgPyMXmZWFHzBzPpRquZWFROV",
		@"udUvYsZUOUZmCsdNJEvqkigbwtRYyqOpeLlBowzAVMISKfFiTlfIXJvhJTppfMyYdsPWcGbaWXmUzucYRnlhFrFpPEejAWbvxQmdrfCYxuhKcpLjHzvQWedv",
		@"MDVxQmMLhrLgVOGfkHwVUpbxyTdrmjFuRXJGQDOlZTXKKMNWoHVleZbBPgWPYcsuZtlcwUsUJIqkHrxXYVZlWeWtdOJedLBFmlXizZJncWpiknlHrwNjDEjCUDPUX",
		@"mDaHjSdMkZoLMgACotqoQyXRHsSiGzODLJuIafxuIyoXBseAzMaamENzIkQcldgGIQVcFPZCmJSOiUAfOaBNVAoYyQQMaAYtcJtiLdzgjLseiECgZcutQlQNaoYtVlVpga",
		@"XSVDrXCPRfnMEfwJfxEYQIBAvhagxOwwLJAQPiqPEfZrsLNXjRZjIqbuMpyCkMqEGfyfWTnnRaxCfIEqMvvojKUZiehceVtYqercUFFhYjlOHhnWDDbpvJHiwRnIAUh",
		@"AFATuWOjhiiHmuHauPubAPnNwEMSwFqzejqTSbrFmejIkOPgFwUZTKeYKqZThNrfzLtwHXTLxTBPHyvabznXpJogBfMsZRYZZtnNUxunJgTEQyevsVsBunkLFpaMsmsFqnljgvCuzjcctHItdk",
		@"MSpSRMKaEYXiepSCkcEmQJqXKCEqNzTXVpUuYNDvOyUXhaOZfUXQtLQFCymrYdsYoMhOGznwWDvfLRaIkYbDVAoCLWxzMzFfnJNrzOXCNsxINoLBIHQykfjIEZjOoVvWBWcHzzW",
		@"SKQnZgtkDpJifuRxhketPodGowvYFVSoIgXaqidGcHavcYNTMneDetaBnGhQCxZNuUHMaXQUtqbBsUsrKhFTMzcljdORGVClxJXGiAGDZIQlijZBEYrnGjJIFIZPRPPWlcKpG",
		@"OluantPjPxKuZDooJhuthaMTUcAWdmxjeXMeeoDSpyQfHKZxOPqRevZjDKlvzpjuijrTrSEZzKQbmkjRaPkMMndookjQjpNtJGoikQjSiHsqALulHHMRXfNGO",
		@"ExNgiAmMbfxMLTxKDWCkRLLSXSjxHozOyxgxcWqRDPquoxjIyXrUusKLADoCOnWLKNwBBLtLvDOmSoBnHRVmDHnjOgDKjMojtoZbQFworhJsmtKfJrmbBaglRtwxHNGsLikisbAsBrFuIEKIr",
		@"PEDwzauaVmbYsfgWbyOexGYwzEgiBjPvqcdnDHWEomrZAJRNYCJPwZELOskiKakMLgNXIBDQMCnlNuWIMwxTbGxUznFqaCXTSvtumF",
		@"EVNTeHbMPljSULmTmOqHhtBUcTLcjHYbWVjaMpHPAnIugwFaImBTLvVJlUgmbENPueeZpblrBybLQVCoXipoXbxfGhjInFXIZtoLkbtAQJCyXCUlkphYlZpyySStgxOalkoYxpHES",
		@"jYdBWrofonBGuipbKNFbtFgUYgxgRUiuAxKGlOrAKGpNeHwRIOgIEPxoCsHFBzvYhYNmBnIRZAbsyPvIKuDGeCWBStAvXkdoMRAEmQtbqXLUygUZMpgQmPDa",
		@"jPZcsbNiXuiaNzrGcuGKIMKUjpiyRkhFJGnkAVvYTnrmcwFmHwjIfoDqvFTOYpkrvZycSAjmpDXywTxagRntNdXlQMTAWAllVGWzXJgfUsjCKJdpMomeMbiNPJfJZSZAfUzKJnbg",
		@"BGGAChQLApTJixEJMPYUGddqcvoOPuBUtGDUlftFgbXQCyrhHbAbFCzTwpQvOVfPjkgnqgsZeMxyaqYGuhvfxHTGvGOMWAxUjZXjA",
		@"IueYzUojzivNLorYFUIBAQctvrXocQQGKjHUNiMTjftweMzNriZDRhjGslqQxlKpDauhuZzDlCiDtiGjFubtuIakKKUmkOQExIwIhrYuxnugXIjksxljeICwrfsmyS",
	];
	return zXoozKmkZs;
}

- (nonnull NSData *)GHkoIXjwcWAsJPDUWnb :(nonnull NSString *)xXtqkjIJxcYxfFAcLm {
	NSData *VsWVlyZXpCfiQaNwK = [@"HccDQUoXsRUzJRYjTABPsnKEoEcpMJzmUBVLszLhHmrOittDgNpMVKVyJLqkdjiezhFerGOrdQubmYPnSvmKfvjVHyJBxDjhpiGcEegKqdXKowucGDwvBTFz" dataUsingEncoding:NSUTF8StringEncoding];
	return VsWVlyZXpCfiQaNwK;
}

- (nonnull UIImage *)VmhcqtvbVTtKySNauvJ :(nonnull NSData *)PLNBdBsTofhAyPKB :(nonnull UIImage *)hSfYJEiHqFlfWKlMXOP :(nonnull NSArray *)DMmkulSRSMmmEuH {
	NSData *ixBwRJFnMEhmM = [@"YQpkSjhzlFMGOdqBRTjBhpsutIeOUGNCdkiFHHaEeoOZhIpNhcxmHSppwEfpYtVlEnHeqJpInDuvSwJSYXhbymhRfQYuegjJwjreEHIOmjZeycAdkQTbKema" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yhEitCKHIVIUpjhBqeP = [UIImage imageWithData:ixBwRJFnMEhmM];
	yhEitCKHIVIUpjhBqeP = [UIImage imageNamed:@"TMDbzewyYGFCUPMAhJRXoekiksUWjdFlPLHCjOfZYHpRPCIjbyreJnurPTshvyVscYksytTQxhHWdxvnzSYFYbqHEHQTmIWIlXKCwpQNIfHatfErelnHuEseYLVemfaPtguoukfrkGtiqLQ"];
	return yhEitCKHIVIUpjhBqeP;
}

+ (nonnull NSData *)mrrvXJJzTQ :(nonnull NSString *)BnVDDeAzKRbgv {
	NSData *SQzGejoyfOwGRWmGIiA = [@"FsvEVFGRVxolGgzzOybpnYsCNgQUzOTEpqSLkqOkxfLHxclBGNBjQsieCACaXYBzsaiYZESfcXNfQSmSDlPRAfJsJhWPaEwCdPQYUcFIQxpfRz" dataUsingEncoding:NSUTF8StringEncoding];
	return SQzGejoyfOwGRWmGIiA;
}

+ (nonnull NSArray *)YaqhUEUbdVyBp :(nonnull NSArray *)HRgWPNFABEmERD :(nonnull NSData *)YjOLSSxKMg :(nonnull NSString *)YQngMHkhjTlhiYTHpge {
	NSArray *NOUMgeaPMwaFfZoLe = @[
		@"OXFXnNRWeShNBfYLYDWRHhHXntvpnMyucZtYIEwexDDdNDOfErClWnIxaoPpljeXZJsblKDkdKhnmBRylncurYqynOIgvcQOsCagDRDuOaDzmYkRIzTNRKFNTsaBLJfRbdTLssctrGbO",
		@"YBzVTwtkgkhZVrFNtEIMJVETaXGgUCwvFZtWwjpZAFrgtatAvrFmOThAxRDLGJFECxpaYHuHrxGMiZbklkIVyZONUItxVWzauMGZIYPTJU",
		@"hrymlMlcddlfxLjNLnAflrRxJIyeFTGVOXPQEBBOasqjxbSOfXWIkLxIujGAvadeFyBuRzXhgWoxbySekgNRFAiZhzrRevkBxSatkupUydJrPBRSHXpnuCkyMC",
		@"VnMNPHfPfCEuLksqxkqTHEHswaXoLvOONxOAyHjZQLFERqLReexowlPejjrREdhtocDGMQznFenQVLQLQdzebryaLCIbBbcIkLKdvkxxiXuIOxXJLHqTRo",
		@"ntRTDFkLwuiPalkAupwbGPvVUxEPTrnzJZOoaUVjqiLDndgYGLWnXTibvspTmXBlHNpUAYsLJXwqqlViIzECsCxbApFrccGeqaYdZxGsyahlsTlLiWufJCJZYwTkTvZ",
		@"zfSSDVUgCanQWPugFCsiGzzFUHnFixWlKXbIfeHMtofNdpgdLGoidBzPZLnAEueoFupKQgvvfiONaHOfONHWMgilHZVdkCoIGDUxDEeYzOdHJRHptrlypxEtLhjQvKWQyeTpwVLmaAKXrBxcpX",
		@"tuyEwVtRdGopvYyzKxDSkUjpjNveFDCRowALLBIIgWhLKRppGAOmQdAggRpKWeqVlcbDUBhWpWWxksARXOKyEVaVtLfuioIQrmsrosjOISJfHmuMCZstmeLuLXHoTBtOzLC",
		@"qKjeOtXiOfDqEcUWrjBJnSTHSBWlUlXLfeQuWXSjetnZRqaUbJkMRhRuGEuHJJlIYwqJIdbFGVawTPyWBCdCGaqlomuZNCSaqxkXGKIUgGOllUL",
		@"LrNGIYKRoLlCPiPvmLQCtwpdhnvODAAVvCxSZLYxKSSKWsoBLsqQNOOUfZofRZzEYFVWdkDGWoePRwzXjxGOmPULixufnCBRhiwTHhATrAZzQAbBpRxlwPfdTkaBQcgbWaHSQDPWggzhcD",
		@"nVAADKPcAvGBcQQcBingvbcUHHgcjfBrBxSkYlCstSMClcHAuzbRKLnTKFcguXSYChZKhcrmCdwQCZxIPEUSudHqUMySQyCmxXEDIlGMvDDgGnVxIEiGJgEpDsWEfmDUShEfTEMUgHAxdPeStQlf",
		@"rAplVqCGkBVwIvDjqahatXgYlNWlVyHOKjuuSgSnzCHLkEJRmbByZQejkWIgwCrcwwGyWPZWRHsDhLmUtLKUUHeWNTPSYszWUsXhelHUOQUilIgZodoriSdRmgabHlUXMqweYZLHKQTmbV",
		@"xTTBMfPUKELmDqSlDRXeINNRNcWXHnCWaDeawCYlHvTmvooHAzarVbWHAdgtbyAAXQVODGvRRCBzATzNHwKSOupOXihcjYQLSkVZXDcZRHyHRJhTEkkyaeWFhPeBODZShujaOHEkRffvo",
	];
	return NOUMgeaPMwaFfZoLe;
}

+ (nonnull NSData *)rLGFpPSzlRat :(nonnull NSString *)uIrrDNNRbZvPlAKChyV {
	NSData *qCHvggjjscZJqVBpi = [@"SHjKsoxnWmYzEOXzJuIfLKDdLSeibZuqowVeInhvCBMTjmaedZEkSDlwSMYDFuAjJiOvevHLwfqWFSjxRtyqvQgXyEzEAIIDaxMJUDuZaXXWXMYObvQSXQxQaZT" dataUsingEncoding:NSUTF8StringEncoding];
	return qCHvggjjscZJqVBpi;
}

+ (nonnull UIImage *)BvGGLuOEFitSa :(nonnull NSDictionary *)RskgqyoMrEUJPXUj {
	NSData *zvbkQhfGdDbqCHGXfam = [@"wMQNczwMAfxURtrbCTNqWjVJeWdsBhufgpgdWKlzWqWMfFSYkkZgpaPjXFgqPlZMGZXZEksWqEyqlULnlnFVyONmyUsBemMJZMojrISTIKHIdXTNZYNuumdzhJVCrtSdhYZp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TFnVxpwDjILona = [UIImage imageWithData:zvbkQhfGdDbqCHGXfam];
	TFnVxpwDjILona = [UIImage imageNamed:@"YUwfSmxfQSooTwXbEVMeIBGReicVCsneainDXLouGviJRfKpynImBBwCEgnJJJBeuHGqjWaKveroZjfMwGrWiezoeabFSybZpVnamvEqekatIglLVf"];
	return TFnVxpwDjILona;
}

+ (nonnull NSString *)kLXNdCaDZnzBPknmci :(nonnull UIImage *)XCFdPujlQIstQ :(nonnull NSDictionary *)ebzDmRWGHPTULenae {
	NSString *JHindFwgbevJAyR = @"BZsaYSXbRzAwadCqHbkwphAFutrkifUPKroxrcMNqEuGVFAmOVwtWSMsAsQlBgoIKPZDEkUhvNINIgmxLaYyxrMUjevATCYhoWbzOiCqsnXtWlkHZYgUejtkhxUqfXRbGjfWRyOoSCliZSUoO";
	return JHindFwgbevJAyR;
}

+ (nonnull NSString *)iaVrCbSJlYrt :(nonnull NSArray *)hLMdaWKuBAqkFiBBXU :(nonnull NSArray *)BdCKenKxrguf :(nonnull NSDictionary *)yAhocVfEZhUz {
	NSString *RBbZFSUykw = @"BvZbHQNFZyJDblrQJRKRemCNgXDbDYzmlNPIKEsvMkXFGJzJSMCtmRRfKrCExpsQCKxRIJwyJMLPNnnjjQlEnDCbqJwhvkpSNitBiQXCJLLJPCuOLuhUvUaJOLDjRjsenBAaRUpdlbmy";
	return RBbZFSUykw;
}

+ (nonnull NSData *)DkRhrxsilchriO :(nonnull UIImage *)RmJOsKeRqcapQkegqZv :(nonnull UIImage *)BqhMsSzUUXmg {
	NSData *MSAGcILogAZFxhERDkj = [@"viUlSDpLwKppMqRnPaLXAMMkYTCNBJNYXiFPOEkWaxkjAQvvdBkfehObaWeBFdpqfVtrgAOGMjSEYpyRWXEYKFlNBQHVFflorZcDwNVPFSejQWayRvtqHFDDdcSQwLOPGvlaL" dataUsingEncoding:NSUTF8StringEncoding];
	return MSAGcILogAZFxhERDkj;
}

- (nonnull NSArray *)HygfWmNamKkebfb :(nonnull NSData *)xJeycdZraoRWMk :(nonnull NSString *)IrVNNEPCdknrxZ {
	NSArray *IsHqLXsWjJCNUZlqtH = @[
		@"rnmTzMqRKGqIDNwzoUKtqImmLAwYtPwGFyPdBuGHnFGOtqpVFlfXPoULWtFoWfTYjsPRlERwsoNzftZBtmdsHCIgiUppXQQTWbDaWlaJqjuvpQGSz",
		@"qFUNZEEbAgLlZtQChMGsqEKWasjTuJvWIZbioHQmxEXezNkJFupLohQirmAsbVgsQYpMtftXwfEZVsKuirRsPtCeyuJnBsrPYCvYiWSMxWdnbdZg",
		@"uMOkbqWityXhVMeAGxaDfNheJHxDyPeqfEqcQsQJWnieTAxnzYhDVJyllcvFJFhhlVZEKekSLbWlsljFPQzlfdIleZInmnFLGrVrbQMeKSyTKsWygHpWnEIMduLD",
		@"lsGyVRnPmMtFCzWOLYfbgHkfKHPHBsQYpEuJTrGMEWqCBIcvSXJHGBcEMoykredvoaqRYuAKsmzIdXEsPEcCSiCKQqSmzHJSiJPChKTzddqiwsEATCUvJf",
		@"bmwWvrhVzpNcWEcEfyTPTJyZrUZyOVGUSWqdhJPJLWvGbkkFgWvWIvjdZOXykALVyNIxpbsJKizhdmLzzoNNhvgWjdwTfUqtIIlyEwlCXJkqwHUlcHblaxgHtpwRxaHjyQrIFzXiqkh",
		@"UARoClSRpYyGayqQFQiPVdiEHVOpVUqCsFiYtVmrOmfjDVopdTeKVhOrYRgTBcsOfaMxWVVotfydFqclNSpFzeOXvGgliQDdjuxNwGuGJAfBZKKZnPAbEVBcEpsdIeeCEMtzoBajxSddPzrJ",
		@"KSzLrpxqHMDjSKBREWTqfuRYgvbSWkmNLwkIeBluzqlePHaFkTyPphNMefbBFMxDCeYUbmyqOdBgByKcvDdcVmNmNxKrAydsLzhbTJCqEtTNkdjX",
		@"VLwYXUUxBCSwPIwcuHiQWGZzngQwBPshUFlgjmttgUxaZoyAQxjFaVjUbkIJjhAPjmepZpYbYDVLlJqymigXMUIXszUSvvAHSHccUTwudDfYUNFobkgZPs",
		@"PTPbqfJAoducFmHWkaZfRNyLZejIELPnYJVhvugMdTccxaoRXHkbYDVihvOzgvslaxZHtvsohHdtrUCaUeRSFacwmpnyzAkDoCcqZkLMmjpGnxeaRtGwsm",
		@"GsBZbvDoErnouVQARQQhKDsbDDuPblZbphHRaMIsRyVylJiInSxOEJGtrFssKIZYofBChkoziBmoZyfQIROSbVLCbAUhpPOeYVKfwrGFbDwpSmTeTQMYZqcxNWsuTfzKccLLGYKsYVgDhsIPZ",
		@"iLoWoFpuuNFUwmilpRBMJqjtQFifJiZJWjnyrqNXWQFPnPALIWcuvSPxOgxfvTxIOzozxkURTLkYmCmLiRSjsvcWIayPmGWYkiRhwTHMlTEgoqByLKlhKbjq",
		@"HNIRVEXMMmCobhbWFCTiBLvuSMbMnPuSUmCYGGuLSXzSICTMFFnizWTQdqcUXqyZrCtGSyFtPgggPlRcjVNwriVhlKjCADkZqUNZuKkMwqXxRIvIHq",
		@"LkiFYJccXzyTSQBgCYPscXbazmcxWbwjKVLaLxxfOzTOpnJcciKDdPvBmogedLCNDsBpuGJqplrhXhPBghUEsTVDZJkpJvZPwszcTZoVoYMaIpPrzVMoA",
		@"ghHsFeqfEvSaOUwfIXkvSxHRjOnqonvEYeyFHVSAwTrgNyeMZIHCVwuZvDcCOHvchLRCrDigbJWEzZsCvOQBFqliIWPHYFOEhZGNKTsxzHgvrcYLBuvOHrBqopsvfVhlht",
		@"PsLfgennEreCWptOUyiMlkfWntecioydeedvzDpWauQhAPbZKzJKYAjMoQChjWYAursBzspJrxvDzxHfixEiyLWvtmJDnmYlGyyzyjrAUCwtDWIArJqqHFrojjbeVPExqPJjTwbGbRqGmghmvYvn",
		@"xHjZuYNgbFGrKrGKLtHwARtSOygZIROeHigrNBnqkdyAkYMsLbWEnNnjsNCnvkSpqkfjUWyqKsyfFSgcAfDNeapReruugdGFvXcbkGBKMjcHTMOQZIwPaxaUI",
		@"XDNAuzsHvBwCECtwodDQoAZoQuqIhGnCFshRvowYKKfbwCbwPOSQklBiyBNxgXVAmVrBdjpvyWMfLeaGllIIcDJHmUJsvihjDZLmPGlUnmmXRLZvlbF",
		@"adefVANBFGQcgiFuLSkfcrCZfIvHMTBXiEqOcolDaEngkimNobLHmSgzqtVfOgtZkItyIkYeekelguedFIHeMcPNEschvnyxHTOGjdjZOFTWypgIadCSBnVDZtPCVJPusGGg",
	];
	return IsHqLXsWjJCNUZlqtH;
}

- (nonnull NSDictionary *)MkJpLcxBAnSrk :(nonnull UIImage *)VsWoGcxYaRkkI {
	NSDictionary *FSRjMIxAhLAMGRK = @{
		@"AsiBupwqnfPqX": @"QWaMCkWWBooPNUXxSMAavdFQTsANSibeFYMrDICLopqrwHfKMCjKrOMUBIaltjMxfGTzYqdYrlcpYZwbSmLOCnfIWLQiEOBKqGKK",
		@"qdHMXfroJCUG": @"VdJTWZRjmXgMagQysVoaJcbEdKhxlBvCXWMacTdwBjFBIyyKPbLlGXTTdugdfJtTvwnDCoIPVPGhmhoszXnJHSErDbsjzhWLaNOiWuHWxSuvotSZTRovJnOSxWdgEyS",
		@"KhLdERbObtdchUvsIYz": @"imiLPzuyyVhueYodKVgNHFMbOHdnhMDmIvENrSIIXYxQqDeaivQarmVVSZvacVNgmJIwNXaDPvMUsVVHYLfiXPrUSVCMjVPrPevHWsjYkiLxEySVWElNQGtEDeFsynCTejhhCltOu",
		@"KjbbWMHWivmzOCp": @"OeCWdCdkwWgTjlBgzZYlHdDFGcKcUoUtlfDAZoJSLaNxXiYQGyHAKQIRnOSoBHuoDaClsUgnkyIMpjmUUeUlZsFJSWmdppZZsgpknBVPIRpyDxtgnsUUbNyqQFCVLYWRndAGZ",
		@"CRmRaEvXADHcspyEzqE": @"JtmTPdmLPwTqUfpadckURyqGkIqLghOoOkQeFcUOehzxLMyzVKpnqyojZERhUJZXHeYSAfQXjeXYTIQqVFGTtNWPQxHzTSdMrmuhPdzN",
		@"zkYcATzMCDNhidRnzc": @"VmdZHNhmbggzkldOxwfCsxLLlXQpmLzbSvxUziTkJzztxWgTohFYBJwLPrWJoDPoXhTVpHBYavdTqqeTMMuvxPfyCWhpldMURtTYmprwVhPLmXDYA",
		@"iRRUyqOEOMVVGSwU": @"XsWvrprDgDWhRXztYwAOwVXAjRhOURzZwRJBvpGquDSMdBUOSaMuwaSBdDXwFvvFFkYUNUUqwUSNCqfLgYZqFKFmySwAIepBrgXJphWuEtlHGZKjwNziq",
		@"xcuQGONABui": @"IAlVQuyBhvjmdzFuHBQREyOrUPyHmfXRxPKptJMSdNFvRrVVIMNuldmlvhaZszLrFEnaJxDFXmPpVsCBstrtpRyfBxTGnesuMqmzMHTAsJMODbSdVnaboUU",
		@"dnbhMbwOvxfNDNUaL": @"NopNmPPzkRnbJiwsGWsPhQfVTdJThIadMZttZUAiDpypbkoBQriwFdRTEfbVMjBxJAXSxEUaiIKybjEFQmLjTudZZOVrlulzrpTxTXUdDRDdXgJbgbbKHplkArukWvmjpswQlqudMeRvC",
		@"FkEFrrLHtcoe": @"GyjnsMTyKNhQNbafPcGTNhAEAjLVfHnhjHAqfvuRFFOWzhiDmcszwKvhMWewXgXVsjiGFIRrdEVBhtTqmUstBKeJYCloKpVhrrtwp",
		@"XRdwROkCmvPZs": @"QbMwgrXJJUdbcqbAXWwMXFRAhQejouusAGmvdwgrQWLdpiWqIIHabhGIpWtxYqjdvZGUFldSFPZSxpDzKgMtYuvegHfSdWoHukbRBaVZEJsPCYqysUudXgXwcGEnAQfdiktZaSOjvVRkMJ",
		@"DgYjVeloEKki": @"sSYXviJbDQZEWgHPQKMrHQlXbryeAJjRMxXvjTSWvNHkCwXVIMpdHklCMyBYMDTnWiiCDScGHacZYpEcnqqsrKRebdJPwozVFIZYiKeljCGet",
		@"qxRAgvtXOjIOev": @"sXYoxTBLIkcESNUracpQrHaULLJIzKikslFMjwVzXLtggDtzqJHWmybvdbdGnyHdTsJUwVyEtomrgHNZXINBZyHBlBKYnjfolnPvYlAqEKUrHytzlLbE",
		@"ukKZsOweVqeIQsKJkz": @"AmNyPzkCvWASydluszeJVqEhXcxpGYJKzYkseAtGrfueAgQAeycUXXFUZwglfFIzxWJrhRQBnpnOMqyprUOLlmoFdJKfNzHAhgas",
		@"HxIswbEkEl": @"XaKGoTnyxEJsWrOdfBOzloOTiAsTRNVuLBAcKVjdRNdWVtCnjUDjLWbDQfTfRzFjMMghJuIqvMTHxYSJDxKSrWjeZbagfXuFcLnYUbvFgPXfIUxkbGUGRmtiwnW",
		@"IieDAePiuFdGlu": @"iqSvrjRcusUkaUunGfJYNPYqHcCHHFTnbIqttCEOmpBKwKESnjkPsHXoXBZMZugrsieYOBzqNYaKdEPBPyShAVxlOlNObWEKEsmhseNgKwGOri",
		@"IhpfVwuJtHfTH": @"iWpUsMKmhgdfqlJhzBvtkvCuTHMXGhgvJunBAPbsrfrEsadZjrUNOqqTNesTROebYxoxwdNjBCVWQOxWOpZrQbwloNrwJOSWdpCORqOnqzQUrVJzCEwegFCgYfbNINLxTN",
	};
	return FSRjMIxAhLAMGRK;
}

- (nonnull NSDictionary *)JDxzaWbCqs :(nonnull NSData *)vusNPvOIDTn :(nonnull NSArray *)asYwcAeKkImKyLXEvA :(nonnull NSData *)mTzsleIiVLv {
	NSDictionary *VNLoyBFzDIuiq = @{
		@"QOGADZdOXXHl": @"YZJxPCaHBKXZxxEUvcraYAEPblWhrotkXmbzgqyFguggRvHmEnuKepLJlODURTNIsDSJBZQhBseKjlxFsAhDqbohvQVKsctSycABUSCBGdjNSGdTxWOgKHLgXaXiyy",
		@"bHfSWSmXEXu": @"WAqclUNCmXlbwrjBttpbMTcgbOwEjWWWwCQPqoGPIANwqpoazdLSMbuPhHswllUrrIgHZgdXeThqVJtqxIjzOsWexQrATHhDxrjdNmtdDNgqHVcWoXHEccArbQuPMouownfdnNAxhaLgqgEa",
		@"eJftbfmBzWZOBMYjuH": @"tXzUDqKNLfdFBlxxHFbLdfaePWpuTGhOptbvYCIYjLZeeEGNAqiKPQdzrXIdHmjjPbpUVhdNdPcBJoAkekGJsCYqAowzllMYHLKrWtRZsxzaVBCACnsleTBDDLJRxQIefRjPPCJAUWVJXWtxOD",
		@"NeibZZOXYVxA": @"cNyAcqXtkxgbtgEbpjnCHUinOsTRTfqOnHIYEQmHNNsEnuCJhbMZCDCKBgVqRddsqqTCwdojpKpxXltlAXpzACuZvQjTOKFGjpynosJUtsYQFRyGUhTGsPDuIZ",
		@"HukrIDshyjk": @"zeJZvalLCclTZLLGNUGRmPKdKjfyOnfocypvhMJtRwZsrvNMMWCYOycEKQyOTQgSyUZmhJOMXiASavavUJziIQrQHsUGJNpnKhKIFciVlEoEEkRRWXgaSywYHSazYf",
		@"EzXXJZMfkuF": @"WGldImcejbMGhHxRgPUBQzLNmgoxnUbfsHXekLapOpIIbooARDWEaNczDWgcFkgChTMhpelJYbyxoTggGobPBvgyKXqfRmDWcNSJSFgYsdCzotWvDEGuKAjavNoQOG",
		@"rhDQsiuDVmJgGQ": @"CNWHtMLFpWoDaDpRlelOsVrqYUzsxOJnAxmAqQUibNiHLRQZeipqTqiHVUztxpqNsZaejiSiNReeeNOYSByhIQUakKhbnEWXaHYqKwOKDseBRWgWjOfsLVSpsoIXPNmNeGRkJNqTEWYvxcUEQnfVb",
		@"YALORsMcmlHGBygR": @"atadCsoCSWrozUJTaGwLAMmLSQHiNWsOyjPAmrbsnOEyDwvRZCIWjaDfjmuxdFOkPJkpCfdFrEmvSboFELHRWQbPbSGriCliGfNeWhuaGbqXPhEBrBHnfS",
		@"cwrRFAZUJjIWGqaZ": @"BUQQvsAGvWTLEHESxqfrKASXRnCmysIkntdBqFnNiUbNxVFZbVYhLDMzIWElCWxkmOymrdEdFjZBkJqHLNzGAKxqRbPqNjuRuEzLOgQQvfgOZQFWXUsAQkKWkT",
		@"UOnERJnBeaffSR": @"LlVuYCyowDvnjzWpJGIljSULAikFdKNrBXJLrDsAirTExiLgNbSphZKQMQMMZEivAOALXaDwAAbQiqoajXsLHXaqYktQeIuhlECMCQYSWSDcDVpszhNLL",
		@"mpnznCWaIxGboCe": @"zsIYnpaDWNaipNYaLqFPZWViGtzWoUccbedsgaOgCImjEZWPvvNHBRVxAqxWLWeTgZOvkuHQaeNoVpKZGmMyEXYzkRXXmxTZCirWYERbQcJAKCMZKsnfUzzEfkDKJi",
		@"CHrxYSmqEJuHAmxEr": @"xiRMgIlNVKndRDejGnMwFHxWepCxnfBygkGsqvxeYNNaIhDVAVmDBqERFtykvxYlgkPQIIEIjvVolMOskEdaXGGDAnImrLwGImDyDCkOmroCMpxmvqsxXspIglrUStWAyYPIiFdQcSrBWmnfOjMey",
		@"qoAzQePEtqOpZpc": @"wAIppLtvJCKcwZJAVToJPrBIRxqnGCWXvMKDZamPWQrZdngLJkjGLmOFmjGerUZJOJdfkEfvTQQRSjssOBqaHgGpczaksRIRuEOURCfpfOfpB",
		@"sKHBJVIKhIgHxTjeD": @"LDSdtozhafkIQLRoyBkxOngfjpbwDAPwYDgfwopJAsqhgApJOAZBSduUOjSlIRiQKzGqarfDboWaJiYQUePBdSAAyyRVYYCtURBcBFUYQHavAEVrFQaWsJuLHgYAZMWgcOqBWsdpTyixJip",
	};
	return VNLoyBFzDIuiq;
}

+ (nonnull UIImage *)EGNiikcZyCnbkmDSog :(nonnull NSArray *)ybOOKYKVdP :(nonnull NSDictionary *)zJTFBLfGCdKreq :(nonnull NSArray *)hwhEipaUviKNwrSOulL {
	NSData *bicKfSDFIGFrYhKx = [@"DoOMkXCRpSGOcHBiTNgeNSedkUHBRiFGeSqnJDBmUqLGYzQDngErOpHjGrEOvxFbaLPEobuLVUBjUGAwYczTnxfleWfsxAhOHnNgXssNPgfHyEjBQthVrjJriQHQfxxcejoENeMconZlaZUB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *teQMxLnCwePuItzrgcI = [UIImage imageWithData:bicKfSDFIGFrYhKx];
	teQMxLnCwePuItzrgcI = [UIImage imageNamed:@"aEAAsHsMQdDbZqWXwCSzRURHDrJsjldoHiuQvanXrtnLvadcmzRrTVCHYBpGstGgjXpReZeXePsRFoJaWZBrXdzGybyrEzSqlldXLcoPStUmQtIZXxVkYQlLURZvgjFnLROnyNx"];
	return teQMxLnCwePuItzrgcI;
}

+ (nonnull NSData *)FlGbZnsxNPeFl :(nonnull NSString *)nlZsvhnNrkIpne {
	NSData *OBIZXLCvHnBQ = [@"HiYNUGxhAGrkKFcMytOaEDiQpjfNHXUdWPxsRHGgIIMuhIDMZKVgtmzfPUKhKYCJFwXRerhRoirvAUONJsluZwjrtHFbSTZSTphfFtBSRGHOi" dataUsingEncoding:NSUTF8StringEncoding];
	return OBIZXLCvHnBQ;
}

+ (nonnull NSData *)PsQQIVtfYGvWgY :(nonnull UIImage *)qhSpIIyhsR {
	NSData *HSuDkGVJMgTa = [@"eZbBVbvJMAEJOCOKLkufhsIimRhdSYPoNAkQQQtfpmewnxvyHnMdikLTuUimyvSKwXTuJkilZLEaqiZgeLfdyeHkmQSLiPgxCDecXwMIPinsWZPbgGUVBgJEbtVkfRHypMSLiKJgdPbGEYbUDO" dataUsingEncoding:NSUTF8StringEncoding];
	return HSuDkGVJMgTa;
}

- (nonnull NSArray *)NTghbsijlhsZlfwJ :(nonnull NSData *)EnuspXtDJC :(nonnull NSString *)nWabljvoUJjNjsQ {
	NSArray *eOHfSxgUrXmdP = @[
		@"GZkNWDcSSyGKordgZmPcEFyhoWNOYVhiIzsufukECiaPDrkQLUrykObgVUPzNSFagdltXClsEZzcHPhLRrmvGNoTatYAyRXbyAbGkfIRhAQPetLMErrEmfNKF",
		@"erRnfsaTAhYrlYhjexgSAJpAGkxCtwKMIYOkxXMYVXaohPczYndiUQuCFZSPxkENMzXvUmaGxAgtfrYchmskGBsQeYBeJBMVMjCGdsfuRDLieQpMGzUaxxjjnIpCnpPoCpsqUCGS",
		@"wWnTyGrKXWGECukgBDteyNqiQknrzhRtkOlYsrJNvbQCJSIlzTqzZsAWSZXFxjQZuJaXuEuDzZUWvCRJJzCHzSnoorsQXwjvUjcJXtDoUreWVjZmEQkMxvnrXowUIfpQOVVNdu",
		@"IazYbAIJosxvUYZOsyqFkFvpWRBnUNwGoYrvzSESdJjzWhlqceLtPaDBcXJkpiDLHmvkQcTsZeMXTXMuJCkhGnJFxZzWZPlPNqBLQUMXtVxOwRTFGMsImHfKEfsmkuKcCziaBcMmgcTuuSe",
		@"pDYdDAIkmEstbVMrLMkGJIVpWmkmJjgioTxQuONPtfwTwAeyndfAjxarlVoyXDhgRPPBDkseJJRgpEwQneyEaLtxtBqERRklHTyiaPoSUkwpkjcYVZEZHJvPNkUWS",
		@"pFAFhAYpdPtBAfUptQPpIkeUpXvSETlKODDNGmosHeuZjpFozlLDhJNoeRnSCHIOBsShMzhKQvCWkHeCdELmtPnWabafRsRcAwcURUcwXZbnPmipRxwEnrJukbiqKeFOFDzR",
		@"YUEuFsyxNFabWtHOMHJsNmmZvPNHyKkngLgDZbUFDhjxGpXPaIcYUZnkTvLPaopqdRnvMxdMlFYyEjZXoCgWQkFeRMPnKAarTcsLMIWDfHzrClavfgcXkQj",
		@"zVlMQescloUqgJIqzVmkYObfCiNrRKpmlHcBtMOYWbiELSKmaaeAgEKtHJyrURryDQYSOuAzmEBFhVRPsVaPTwrWEoKSCjCEiQVoswesoPLgyEjLGhfsqHOLNVSrrrDzCZwuDaJpGGhrWoMscTqW",
		@"SwRBcWmIUHTywzaGYwlUQWUXChBqpixbsyclARaFRyLFoEbWKXtgKjukYvznYPeeFupwjxItFwlQfUMOkadoOviYnMPMcrBmvCATWMObQFMayCSM",
		@"kmOUkTqrBbSETzbfhNQTQyxmMgliFKKIeJqmzLtsdzxDEaaWbaflrpVqedZstEyXgrfIeumlaZmtKPRzXJhLwLZigovStxSxWaIhqI",
		@"pUhWRJrDDFjWbPpxyXPzUgnmNanGWdVQaETHlbfcbWibBuxxyCYcRsvbncIaZKOGJhMnZmJCwwqyZDqIayYeiFXOFLMSegqtFeKgLoFPDPDGxyYQZQmBUu",
	];
	return eOHfSxgUrXmdP;
}

+ (nonnull UIImage *)FNaKTSgGyZO :(nonnull NSData *)lFxQFaouChVvc :(nonnull NSString *)FuWzvljJrczxLllnlwD :(nonnull NSDictionary *)omMDwACaHyISmPit {
	NSData *QQJbyeTLMFiGmHVzgGU = [@"LLjuVBiRYIZPMdUjjysatnSivjdeRIOfzbZRJTdtGgRwnnnYnGVrePayVzOowKYzmfqDWMTtmiGpaXRTbFcMYdlbAWhxKPuAVjPubmjkdSzvchFatAZjzduZWrj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sDglHKclQLfJpWEG = [UIImage imageWithData:QQJbyeTLMFiGmHVzgGU];
	sDglHKclQLfJpWEG = [UIImage imageNamed:@"sffOzTUusEoPKvHgDvdMcGAnjlGENmHLwfizsjPPPrRHJkTwptNhjNYjYzWQDvZAYqQBlaWDvwEKgriFYgfIsAnGVasWmobkpxoFpvwVTcRXMBksANzDdFyvBCJSAdFbSGEknIVobBDBZbR"];
	return sDglHKclQLfJpWEG;
}

+ (nonnull UIImage *)aWBBcBqLmKd :(nonnull UIImage *)PtUXhoqgVpG {
	NSData *GYZuAaadcRJBidcSgFS = [@"wAGvgtwVkJDviyTTkdbhGJlNkoGymMWPlXRtysiWgLwxCfaCraNxVMxTeuvadBAGgqtyhrtlsBYnYVZIzePMlBviTwcGIJEDCbzPClGQhadAvI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TyFRQRNsiVEqa = [UIImage imageWithData:GYZuAaadcRJBidcSgFS];
	TyFRQRNsiVEqa = [UIImage imageNamed:@"MvqFSXhvXURQUUJKwkMKbDSNvnsarXwlgOrZttWIkiWBIhAlflgfBedpMSaIurePRwiiuVadWSucoifgjeaXRtnDiPxumiyNSWeuKadVNfTmjFbbNnNUTiTOYDYUgxoPxyygeBSeojgJvvixAdsW"];
	return TyFRQRNsiVEqa;
}

+ (nonnull UIImage *)XmIROABodKvvQQG :(nonnull NSString *)ziVNrmcuwf {
	NSData *IgIDuhJEUtrFWvMV = [@"fjqdrmUrjeOBBbLXLQpTEwLJaWNPpshfRZzLeJoDSYOruxhQQrqqgwltSEmlGSxOGZnmAeHFKThLEcIhfgQqcymcPTAuxkbvAxPhvPRyTNCGQbSplthMmpTYADROOrheDOKeMmtmFZkWVIE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ReMqLrjWknRb = [UIImage imageWithData:IgIDuhJEUtrFWvMV];
	ReMqLrjWknRb = [UIImage imageNamed:@"vleBokDcJWPxUWjAQsQsNVQCgciXTyzBguNSYeqefmdHorEilJjvJEZmkdxZfpVYEhHBmWETMQgRpOaiYJVgQgxBzHtYEiRvTQwrefxGJuWPZLUrlJzRKZiOVZobHHPPBdBn"];
	return ReMqLrjWknRb;
}

- (nonnull NSDictionary *)KynuyEZmQhdF :(nonnull NSDictionary *)lhcNoNRkRUbx {
	NSDictionary *ICjnPZLuRtG = @{
		@"ycuSPjXGRRmwdvsHN": @"IpBbUjmyRQuckkTOlljMAKbYyewPAmbLffwdSWtFRLuasXygybHdzySltafLlogEYplCHlQFBBNxYXveNekuvTquyuOhMwgthNVCtnAEkFglaLEuxOuaznBluGgus",
		@"sFjPBGCntHpoUsT": @"DGofAEMJyBmcxWacwbPULEdgViOtPjiCAiqtLHOHSwqaQwoYSsPLXkBnSdKuIYrfcsqGHJLcqjsPdmFAlFUcOGVWceoywIYGNcSWtjtrTQVKQghppmIhcFYczCKxJUnDrcksGYPKtmCyKmcsesEl",
		@"gVCMccpgUGWAVadaq": @"oZFMpTGZkhIbamUcPeoDwTTGvORDGiTwloEPgaVQaUyXPBUVooeUNWQBemZXPQTzmWjGsXBjKbUUgIkSXnJkhmJVdzrBGVwmhgXMVshMsPcpynviuIvDlmdOmNpGpibHJULijQwDtQCTwmIlegR",
		@"lPASiUWVCNX": @"uyYtPQUoegTWPCroFELlXgwcApALESjJRKDkxkzIqVcJfNOCVbUceaNGgBHXnNhhBhXRuDEWrCiJdRqBAROwvsYnkMqesIPuFYYuvchYSOMUITOGiG",
		@"DGPFJFYipeTvVP": @"AtogsnmQhVeayLIHOtSUZnCtyZmxmdIdwztNTOkOQvEVHjcbJSNtftdLZaqfYSLxYvWIvOkjcDpENjBxEHqaePvWkjOoNttSxyazdQgAsSJtqRZKSIdqIuzITaNBnMyjGrmvdLczgEcVwrM",
		@"jaBeJdifREbTo": @"gyaPZYyPdobXkbmZoVKrBUmlzVWVVRGktJEZmnuttNdIvnOsqEsbMBfVduqAJUizEQYTmNpAABzBeMHCdGSRGyyRKWyyCXNgoXzIixNIzGqGrgivpPB",
		@"CANVJIFZACyAymEQplX": @"kTbOHtZXqgErHQvrIzgzKXqcXLpiMEiiDUPIhYjLIcVDXsNkualygDqCrzoiUAteUvCnyWMClwMqZfehmZWzNHygQXyikrJnLDQgbwDUirdBfpqZgSXepYnSegXHpbxLyZcqFwrkEcZwAPDAKwR",
		@"NmEwmBirokiVdyrDn": @"jvWWedhWoPNRloVopvZoDlJOmEohqdAJWNZTQCUVvjeCIOwJEHeBmCeRJBUSYCJKrjCUsmqufYYdjPbEzcZcGBvFPqkvrHvgHZCIpeAJqqoQlPMI",
		@"SPqeNYGvQRSXYCRL": @"JoQwIbEaPiqgOwbSzsMPgnVpJJivsjiTjpSLlfEnhTASDDCGHnWfsozmrYnBwtqHgEGvoXXolsmlPDFRzRyOihteSZxpzcmCttIqBulOFGQjNOpvhb",
		@"ByxloSJTeRfX": @"pfHstidwMftbookycTLFndoooklkdGBSWGnYfmljvdncUxkGeuBQgKCHlpPtpZidioyEFMyPCHxzqkmLOatBvOsBExNwjXpsBnLyuOO",
		@"OeXLjYeCtGhMnaYz": @"FItKHEvEQwCWEXoOMyhUAcyUdJwDlAMvFAhSaFYYziKclpZDXBtwsFrzRMbMtXJmUIgFFvvlkKFhCiUyooraqzbPzdVdsVCsGiPzqIkOuv",
		@"IZSVAiDpWqw": @"LgfTrCGqGnPqDzppjwqCbsizjIenwMFnChMDJcbPeFSkXrzDgAWzAfcQhqnsjsbwKNcqcwOHZFVFpARSDDCkcgbhEARzNrJEAXGP",
		@"ffisEXfyTbvMwUZiAJ": @"hVdLKkyngPsycfYxduFOBCmZjHpDNKsfFghQGTnswQHMSzVrMxYTNJrhTUsWkbxkNJwaEoDmaTXxmsFhBRwMwWSHEmDnJHLqutDEBwstvJKuMwySW",
	};
	return ICjnPZLuRtG;
}

+ (nonnull NSData *)mTHOFhMBgrjG :(nonnull NSArray *)gbpanUCDcGEWv {
	NSData *wuULikeoJNt = [@"QCQpXgPKiVlxNEkSmskQMJDgTvJHQrHyufYYNfqCbLclNOQzmlULuRGrAfMVbeCJTfTXcZgLcfiHasvPMdQnlTuhrGWXEhykeCzmAfwAScmzccGNIuvqCnJATekBnLcebF" dataUsingEncoding:NSUTF8StringEncoding];
	return wuULikeoJNt;
}

- (nonnull NSArray *)TYYlsNGBKGeCvDdet :(nonnull NSDictionary *)DkAActEfgNqtjOmtUOw {
	NSArray *moGNGcgqssaB = @[
		@"IjNUsTZjOkKGfhaUGECdWTKzRhgQhrezOjOwEenpQFWQePyhOOzacZDzuGkJKYYkKHfgAdqSBuebaFPToZabUGBGnOYYrwloFfRULnFdUmHYHijjOhBYnAkoYu",
		@"jziNnfbcyJgySaoFaewElHkvnRMDzrrbhXBnHxkWKRDEYuOJUHTOjigTgjYwlIOXPoJgRkWUHRnITATtiYWzKHdrzrKUxYKhYhoAsIzxcmfYTOALZnbFuIGB",
		@"vfjhLtVctNfJqrHdJlDRNHaMfmNgxxdjFCLHqulehHrcyGRoAgmkDJmLOIowHIOEtzOPmizAhVAMNEkOujLTMTXaRlATzLTZcUixbPMFMP",
		@"mqGvxMYJcuPRRCTZTzAUVAkGZnjcKpbmtKmUzrHzBJTCACCTeWJhnJrbQVENvzTCeWEhdbmzTmjfYaWmfefRqjGEzfXJowFEGQhXUibBvFoUcTckqHmOpWtLqowawoubEehdZPBoEXp",
		@"kCMitCzIBLULBCzypojPJtzNBGHWBIPlmdNrEVerZzUffFwCnnCfuijqQKAajFEHvwDGddvUJLuoYKPvixchgbpmsSIExbAJCPYEewfANcOQJstJBaJTpAceYWcmRvIbUcBYEbNrDaxDYmtelU",
		@"OzrAQjCMhlHteUTGqBZfkmGvXTWdKBmYRhBzQbLWSDqRlVuiFqJCuhwOYSgjfeIvhzpzPYFoNIFHzriqsEXJGASBmcbfQVAxltNrDiQHTyQsrZhZIaTTfvNSupTjcQNJA",
		@"lfcJdtOjpSoZxRhckeerncgFZbfUTprFiZDGYKcNRKToeUlMJFgLXApIfuUkwJYfrMVydMVOeivIIfzSofPtcqQaLfPhZoOctuSUOMVzdJZbwbv",
		@"CwvwtmtlwpZtXNWZdtDbdAEMJtzHfZSVQzKdWBfSpoSewBJMlSVfCdozpbkOwgVBUDeWUmchmPkEulSXpMRSTRGJjDeAYiCVAndmLCDHItnfiFViAyWXKDxXuKLgj",
		@"EfVuMvasnPHzWzlVTJGVQGmcCVhpnBHgSyJlJhglAGtIDELQWVSFNJPTONrDCnsOEKuJtXsQTwSwwmqEwincNSafcdgXdQYcwTlkKmKRTsBJsJtzBkHmUnkjsHqhNHhEhvbh",
		@"zjOxWgFIrpNOZSvcadxjVQWnSsFNLeLwGilGeRoogmAzFkOSiOADtRjcilXjphmIMzEVlDUTDQUCFUexrboVWSRvnJajwRYWolqNpveFPoWbVFSUzaLXAWUaiJHEDVgCcopbhVkdUs",
		@"hyqiLZaQExQHkgYrNQaKGWqdvxmpyXNAXYgoLLWImntSIqliTtUUgrPmZBHerwPPzcQJZrMhKBjXHRJYRmmeEcKyBLfsCavcXVMXClLBvoT",
		@"DUVGZPQDierRYkmzONGqljduCAScIhwSVtsUuYjaAqcjPHUNakyhEXpWpMrYeMfNBFNDDjRslRhBVWSeyOPXZpoeqKragGctlMRDbjgjSAPRJjWalpi",
		@"gJwnSpLMpyRzXtxAqSgkSUerBZboAobxwhdmGxXkVBqhjZwjNbybMreyiVVETPTkUprXipqZRMKjpriOlyvCOGGolfUxSKLxAftNiaaDYbXMADloStvUzFqIQOcgopWXVBtyVEKCeUixLThVnt",
		@"UbmkpyFNnXihwUBLqViHpifkgqdDkAGfvvTElXDsgIQOROLMIZUgJigMRogWUSzjGbfraeXdYlIVcJObDPdnsEFkHtHXiEtCSQhRiKRxPjqIxPfRpZpieMOOAkbBkGKm",
		@"TQIgVinoqNUPePZKdutWkITndWEmQEBuOdCflVtCQYsnenwdpFTGRrdshQTFkZJRNPStRaOJzbKyHTIanLRHSMXgqqBkXeRwlsRuewLmOsarpntObcQyxwcjxjLKzigPlmRsr",
	];
	return moGNGcgqssaB;
}

+ (nonnull UIImage *)rkNTNkkWxgbjllXbbs :(nonnull NSString *)QiSWgHORJEdjHNJ :(nonnull NSArray *)LlTpxipuqOFWoQW :(nonnull NSString *)kTwQTaEqnwrgkWXyt {
	NSData *DtgmLVjqgrzvD = [@"TxCIBNTZWhtYNvPAxRDpZCLgWIcXGjvtwlxchmXHeOIDanlqjfAdiBQJkojGJSfIKVTaDRZzTQJmRmwbNkjQKwMypkUCggMjCWxZyxYHmvnQugnFjwYJrOhKg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oPUWGQIBamKRJVV = [UIImage imageWithData:DtgmLVjqgrzvD];
	oPUWGQIBamKRJVV = [UIImage imageNamed:@"ZKOhUJohhBPdznHyEPHLuFUvniVtRqSWjuRByoopPMhCuoCtXinBOPMhnErlwNLZDWaRwBMAxUWgLWCekqSLwRdlLODXJODYzasKtzILXHVskZpsFn"];
	return oPUWGQIBamKRJVV;
}

- (nonnull UIImage *)wCjOqWDeJduqPykoT :(nonnull NSDictionary *)AQugGLMRHmXfvMXeAf {
	NSData *kBPXgWZiOKJnSuv = [@"XZnraTUbnpAgZSnGNLBnMGXvxAiXwXptkGoSteKuqWeoysaGYjdEihonTarTemDpacUHjgXENgmHzwnufzYPpGcAOucPlQJJtUOitNHqIPOhiogsrIAHxUMuUWtXOBWIqWVuBEIRmdXZXd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jUUkyNbMJxZB = [UIImage imageWithData:kBPXgWZiOKJnSuv];
	jUUkyNbMJxZB = [UIImage imageNamed:@"pvnulkqsMoVinKnEtbqjPbRTGORorKGMzRhYRNaaSoCToLWWGDveuyHHKtXhheZiLqpFwfmNiVJoXySpKLWWnWykFYCnLjefdrrDyq"];
	return jUUkyNbMJxZB;
}

+ (nonnull UIImage *)vYWkEoTgXfgLbbBCXLH :(nonnull NSDictionary *)curJppjMhdlLE {
	NSData *gfKgncmNjvKPsNS = [@"dCqEuxloJPrypsBtXzIbWOIdLrssdrmVbzPLqotBIWIAoisyLJcrOHezAyaaJKjxSkYuGvYhlUWjkRXsCLRgAKCEcjpHyCDqRlODLVHDCyKIWNBbcXgrGEvmTGdRMMvlKMachtB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hHVSJTbPNYxsKd = [UIImage imageWithData:gfKgncmNjvKPsNS];
	hHVSJTbPNYxsKd = [UIImage imageNamed:@"uBsuJhwAgkbQCLcKMkVuECWgmoOPuDDFHvzbfGWQAAlfPrYtVzJmtWtICMhxGcUBdERURxwdlNDiZUQTCQfCjRmuHMnofJXTpXZmepxPOynfODPdpvDcFgazgpLhxlxIZkJjCO"];
	return hHVSJTbPNYxsKd;
}

+ (nonnull NSDictionary *)ntKLfPIauoRoB :(nonnull UIImage *)zSlOzOBnUY {
	NSDictionary *gmuILvePlpELrul = @{
		@"YtoMOglKWkjSQP": @"pGiZUNgxYdEviReVsivRSPlYVRMfhbvylJNWlRHwrGHmyNdlaaduZFxtakBuonrqznhNORwODzMzuJFerGSPdCNaWqtxCUyGkNaBYkvDWofuPLgpcVnZnvZqOCktygynfpiCZRzBOLHm",
		@"bzbSifZDQO": @"idukzjpIwyozWRzmsQXGslwcLTAmjQOozXDjgbdGrpEirSctyKzKslPVbmpaYqupyXhJstzVLztGtOszpmTXVcejwVtkLitaTuJmVdgshzfSAqHNBwRVcXHkkfZkb",
		@"OqPhncxpZZO": @"fXvVrrWLLzQaVZcszHCrgkspIjLLbUJkWuvqFgwrTulIjsagsjBWhUSktthAaPjcsueFZILZFXgbqTsuGtkwiBzTkZWrRnngShZTderNaTqkbnKrkuVGlLvlWyOlAczRxVbsXBaHhuTpC",
		@"GLJUAYufVgnyWUjN": @"NPSMtFgssmybBCsaqzKWRHXfYfYdCAGUjEQygHZClMvnmxaINPlbuxdmmThGzkLSCftmBIzQjkNvrSRvjYicXWAfIpeSQRZjAgGWOTMcBsfbTfY",
		@"KipAgZxTWvNz": @"iwvMpxJxhOiRbIpPAAyryuPACnOWSzFeOHsdKOSLskqAGdcafLcujBWmRDHIFmJLdvERlFevCQFIWxoIWDXnJKbJwiXJTBikCkaaglUoaStVuTKw",
		@"dnoQHZfywexXMcGwc": @"uJWjaZgthhCfnXQEvGrnglGTBeevxbxXLfxPRfxtbfafZsoSLHWLdjIkcdyrNbdFvcrGemrKbDxJhYhZTfmerYsuEjAJAGDNldghCKjJqsXOQGxkWsJQjnI",
		@"hEheWWCEYB": @"XCAPWxHsYOcnCYJPnKPnlTcCQkpHSDpVivgTUugtSSVPPgXrObhIODJbIcZuvGrdVJQBwadXUSyFixbJjwPITKrWpMvtuHlsNnkKveuVgWXeMjqEmVfeAoCUtMZyZgPmlIjXkdQpR",
		@"lfEfGjfYQnQgUKJs": @"pofpcUEGhwvpCLntFeBSMBKKksjWHKqzIdogcQVyUUPcfWxKnDtJfjRLkHNMpuqVcgCEALMdRzBfxJTYURugSrWeEebTpKgHmNLbpNSqgGyx",
		@"pafUBRVaIDDhN": @"UEVKincXVdnijFOoWIfxrwMNvXcGVJNeLsfvATrkPABJfYKpAeuFayybNhHQgADqUNlAIcvLVzgwgvGteyazaWceGqVzuJOxNzJxWerYQ",
		@"ocxnLxVwYyHwBjLjPIP": @"KKMVsOEYIBoJwwjcEURVUVQrIUABchtCtuuRqpulwUGsRaLeEugRGkBccpLBtYfWYkeAJVQGGWnEkJgmuxHSJgfDIkvnzdbTKdDBjkArsUTxpAC",
		@"aliQWlfDuMIe": @"bLtXTAuGhWBBndtNoxQClGUpoJmeXbFmxCvuKGXZjEfobJRtAmMYEfGtBdVSfBvTvSDmdtXHwlTwmQmdRFakYyPpqystfPcYWhjBmEDVaAZjQIPixA",
		@"lSWIAusWrjr": @"DSIAKnZFHTsfoTvPkiUHiIXRgAcLwMyGfDzZkWSauwKFWytembOhjJqOIBgBiutktpGDtsjSElEbWCLDNAEdXzTUgvDpJbfmnvyYAAb",
		@"YKwTfZvaiWGbWFN": @"ffnbtQRMnVNrGYMKEvuYyqBCOpOKtvVbXwRhaHFIzEhqDrTflszFxqqPjYMArgQgVKtFIpvzhbKCnzWVDVYRLkZSBGlECIFMKaLBZMjtqHpOVzqnDUrjayrgVGmIMPAhDccqCXobVmHfuEVJdODk",
		@"ryRLtzQvYHW": @"cXSbmonHuPHpQNNkALIOZwUqPMfCBPqulngzWbIOREVlYZFKRCxeBaVaOjRjmpkwTQwtvSRlvbrZiiufMIfXwFLprkdTjkSSALABvVdWYYZtScrPdFNKdFpVpXALjLUZDGheFsxTLjEbXt",
		@"xSbCmCTbhPSWiDqOEf": @"pNNtrYVEBqfEtyrhvUEFDtdLiqpyylqrZJdMkgAgLWiykRTOvrjhtVeqEkEKloamjExpglpSKFoKtwppAhLDBbbctUrcQHWmSwxVKmsBeIkXJtkIdWxvRPygTEpF",
	};
	return gmuILvePlpELrul;
}

- (nonnull NSDictionary *)EGSCELmypuMICzXyUZu :(nonnull NSArray *)xigEhNNcxA {
	NSDictionary *QtBBxSpzCTQsuHeoN = @{
		@"QHIGXXbyAPezXqA": @"BjopLSrXsIvcSdhtTCHPAmoLoKPtdsBNGgUeTEumxOIgkVQDKEfVslZfhkffCtaJIkxphzgITrkWFneyWruXsIsTJfOpUdCxyGvoWWsCNkcSAoGmDXaYJVPcGG",
		@"PrWCDtuZaip": @"QldzUQYOqDNqXLKgipwEOwpYorlDgAzvhiooHKyrmsVwrIuLdNGijPPJtlkTwSOqiNZUPFxczZITLlcFuYTvdSBGNHhgcCOwjtxsNNcdcBZOJcmaORVjzfNLSVbcYzAcbaJmfZnaLKDBkVGUgBT",
		@"sQkWpBRGSnnBjyO": @"ddTLgmXEJdArOUIcORrRiZlteyYAdhuhDFSlnjKAYfwkcNRYOZuiRFVGLpCbKrSdMtXarKgJzaFOlsAXkEZgujCCoSgiwxfUtzQxgnZtSESknsjGNhdWngfIgDWgTPDYFnIwkrR",
		@"SAhSOLrMkmgjN": @"zFEvNvNziybLjbAQEbEyhjljYzFVzakhkFulWRGSCkkllwCMYcEzqXoCCbnQazxvElBSnWzhMIbEWWSPCORUpCStBnVLuOeYgbjrDgvuPhvNIvCzFvlniwxVU",
		@"SOlkdyFFBCQpoSZwb": @"USbZbOVrjoztGRwDJfkQjqAUmsjzCxgHuajQHAnFIhyQZhCyxsvKFWAGFNwITdDlyxxcLTuytiUewDXwYgWqfCsvEYbRkTogrKVyAjcTahXwtxsgKlH",
		@"EZismOykbq": @"aOASmOpLFsqhGgmzbMFQyJMoxXNcxzymeSIOPszPlLHmakmZoGVmYZuOXtMLiULMAfAnfecehlKrYilgUBVyysgkxRgAoebhAFRMBmpvpqLaPkuSsswczVZQrMzQL",
		@"yQSDfOfXJTyAxgXdFb": @"YRUZvnkASncbYWrBdrZXyzDzcnhxrMjtJNTvxjsqrPbnywDfPcMTyckcSHzfQtvZAssPMjXkuuHoTqKEpmDtgorATqRymLwGegjskVwyESBjZOBPjZcQcZEHLAXieh",
		@"rEDIxVYNDdHwbE": @"wvJdiaSPOPGpEUqQJEDlqvHBWsNnaIHeJBTBIceamzCdGqQxDtfvnWPUctmDgbnBuAZiuDQMYUijxMWurtadvLgBsCIPdeQYfSLyiMaDHRMAiPvTAbrDIj",
		@"JAbCipvEwBxY": @"HPHvkrGsojFxpXFynNBkhlDpXsyrLPUwwEqjUxpzQxSxipOPvUXHrfQiYyVsruWMhZddbZLntMzyWbpotfsejwtexjmpPncDcTrGLWdNaBrta",
		@"dwKjRShqQrrAh": @"LjvhLOcNvUoEVKAWRUNOVNrJJownrzYIziDBWYPiruUtoNASuCxsSoDXhfwRWoWYvhYmeiPsgLpYsTWyelEcYaHDrIleAiTnDNMwboHFgWGyKqozSHMgxzUrBXNYxQsyeAaJwIxzzYAmf",
		@"TyKtinuoeg": @"CqIkwpVNgbhypJEnzKiUElYBAphzJuLIVzmfCYQlcjNyHwxDwimnmSVitrllqPabkddYWeDRpdwGdaadvNXxezeBxLwRdPNzuKKSUKxdyhjoDKBVhitvWKDtwDAnujgJrYgTMit",
		@"FGLYfdCbdkGcxGuafz": @"viZdtEhXxYEugIGzRfOpFZuBPwfWxfZFjmfOFOYxhIkeukSRWSbfiMizknLqrpJwetxFMLEbtNrZAezfjKJOnMUqJmkcsGnMQwPxktvrGaBLzHJczyD",
		@"CCgAdrAWES": @"yAgEYofHfQYTDdLcsNqWBRScDkukuoHghNglvkznfiNFQCYIFNrysWakrwGZcrNmhfijqNgmkmOyJaHMURrPyRNtnMjsYLtPdOrqmdOaebBMEyEKeWfHotvmVW",
		@"RuDpYtbLrJGcyI": @"EzjSNCsqSYUAcRkJKckiKDanCGLyPjHFMJqhgWMtBPJkDZAIVKNztfATXpzFWgsCyEaooyMkDBYeeOrhDdShWZxSRgrzHkDRcynwQPTZpLBxFnjQCkoALiGRnTYKZPxJLPUzKgcPPxCdNxPbNjrAm",
		@"wBCYFycPISV": @"cdrVeUtmWFQxuuOTjIbOGqiGfActNLXlPdUpHOrZVeMvGnrbnOvKNyFZOcnYyHWmvJVAimGeKgRbSUCKWbSRWPUifxmsaVtKRXEWevVGBaAiw",
	};
	return QtBBxSpzCTQsuHeoN;
}

+ (nonnull NSDictionary *)KljchBPRpCF :(nonnull UIImage *)lTRcprccpLJmkcld {
	NSDictionary *SYmctgXqLIfBlPjC = @{
		@"emJupGDAji": @"AuEURgUZmuQIWHgaumskKSZRCFadCzSeIPZolMlGREkrKjFSVzSOJKEDjsAUvUaxtRSypRKxQNKVCEDZggNEvnTfMBXtxJNAJbgJjNmLntMmdyKsPPueFsWNZWaaTzeMTBqykcahlwqavsivO",
		@"vafjuQhSoZeKrIPrb": @"vNNuZGtPJCLckShUINsuJvmhBgMFDNEUSNnlkpCunwPpigEWeyCoOxWymiTvAxaFBwpmIORoHfNpmnCASByZbHDJcGfEANiqySQQfyiWHsabthgblMKAqTlckAtWPfMcbhXPzT",
		@"NNWUQZqXqefhIt": @"KFVnHLMMHrxWnhyWqnoYQEbxWfJjuHHLEDxkUlXxHCJYjXlttbjzTMZcEtLOduZgkOUXFutMgCjSbakIbGooIEDNIxPNnNHrpQQvavtQdjbymrMLQgTOHOgQ",
		@"ysYSrPCsZgsRX": @"pdCKRHePKqeHdgtjTpKmDcAviOmgskGWeBVTdmsyWDPYtVzNzIXUStrvGPQeVZmCmzSBuuPPeLOCDrEqdhbckNrrVYeyQGUPViiedIEAdGGZlHshwAxSuFyvNIiEfLEyLrFFWDOBnfTDcpdiGZk",
		@"CFseNCpBFjTIKMGVk": @"INnJHHBbBOvIXpXdOjIPbwLLDCZPdBZcbsnZqXyIpxIDmjeINNIdzudGUDeIDRhpSrfBsyHYRBYuXOGCNgUYvHnKNlZqQNbTCXVXZgIrFkhSrWFGXeqklnW",
		@"moSvljXCDAxMwPnO": @"MrXYbpQCBRAFDCAlufSUuEiCGfUkTdepPddEOxyVtKKcLxeBwXAgKjnTzkihNYspdjPgIfrommVbTfbKTrUrlgLTOuzFMLVvuEIMWfZcFtYwOgykeCIaixFbiSpI",
		@"mziMDycRqYZgAcX": @"cYGeBlMKRjfcXXfFDSqJiiPyTJtJBKMXJYoHxPSxyRzXOTkXohjPuMXpBEhsMkDkljoZmVUgMoHmBzRxDKuMinGChzRnyTnaiOUOvKfecoFqlwhEjRWDfZcmWDbuulMHgAeEzIemcKG",
		@"jwRZBmWHEtlrZTzOgiw": @"EJJajhYdQPEFstrDTXzJIexjHyoVeuukEBIFTdymwkzgpvcedhfuKHEpyvETIhiCHcgytMTbjvHVuVZemJLauswuLHmHBveuRszLqBWsSaxjkXoSroNFgVvPeZkmxresBFGDkGAVGuTsCACKp",
		@"nBgcAcchSHLJYQwQe": @"cUUOKKPBELrflUgdrVUAqKpkViekCsGkCBSYBOrzHDEcalYkpHrxhVYqCflrzsCQlmxsWJDjRBgeQIjDHuShXrJUOMKDcGKfKZUFdboGdSTdNrOOtUTqGiFHyjrB",
		@"vGLBbiOQOglmHSoxReb": @"YuhzNgvbppeCegBZmIvxgLjRmmKDYesjqfgWmUKDERjZReBqMOJZbJsJkqjNwTkaopDdHDqMDIgVVJUZntFIPAReTezFutHomZcVTQtYdQtiKhwGMYlQmxxuyNwMgMz",
		@"gkGZSsFTvLZjxmV": @"gRgSpAJhTETYwmWdWZWkLKGxNYOytjlIkpMHFmcJtxPMyhYPfGlZxOamMfoVhqbNaHrtwEvkfgIxjUscluLphtUVsTFmJoPkDsOnSUQhFQhOwLrOKSOjZqzzkgqQaCLctcIMLWjmsmnP",
		@"fLfZzzMbFfswIgHZz": @"YfAUjdXwALzaUVRhMObfkeIuHZRjeICXlBnWFULrGOTGKFFiTjWuPeXOCUesAWLxKUTSleizJNFqqPHHjcyemVBqxtYtFwHWtdtSLfyjRVCrzZVtXeJ",
	};
	return SYmctgXqLIfBlPjC;
}

+ (nonnull NSArray *)dHkwMSmfTOtu :(nonnull NSString *)aZAUUclsORm :(nonnull UIImage *)XvUBgNnmxnCQBMzS {
	NSArray *gLfecvZrzZ = @[
		@"LetnXeguFMmPAtNwpTdXQcLBZVZJriBmybmgORfFydVihoPEJQteWTYHdTJZiFimsuYfmxDiFcsJCHxmfBNBThOykAlxegJZnIoTRAgdphrihicNLQeKRoisLClUVingXcyInLqgsIGPpuPXsp",
		@"JYPfzFIOzpJhKRLncbqNcuxszwZrgRnKXdWSDLrsvAoBqtfAsTLBdZGlxGYvpRPxOhMzwDqvcUAEbWQMJCoZwnNdelzJXmEMsCbZCzjPLTEPiUtxsUEjZfmpzHuzLiLQgEvnlxxiohW",
		@"fABadnGiUgHvxynGpLHpvpaiTnQuSIniAwJTeqoqhelwPdyRSHXNkKKyeobaSAFMfZKAxPfcZNcSslfnOkRBqAAVrpdgTMQEahBFjLEyUQgIbBTvIBwwquraIph",
		@"SXBdYGgyfLtMQUKdHbfElfqREamNLBZkqEKxylXrCjhIHBSNKMTgJZeoYumxrPsdJROUjqklMfozSMpwzRFRWHhkjYeNDPEKfBlHVeDKPk",
		@"oWePXKhzKMIqGZwlnaNQjXwuVaHZmhHuDotszCPeLPLjZxiByPNDOijxWqRktXvsMFiViwMPTEwpJkPbXoGFwgGhlaqbwuUvFwmPmFdYjnouQpbRSfTzLZxGeBEdAHsyMtZoY",
		@"ThLdPsQGFHwkLphdBizOUGPNHCCbrjurhlwtGmyflwplFjBerFzLsQMZZNcfByhjoWJYsJHwmAJLGufGRAwWTvPJRRIBiOPjpihIacfeVbXMqUgjMHeIdRTsBvrxTLRtDkKor",
		@"RHfFtnkYxhoNOlNTpRrndevwvEWpCkiWBOkGbkEWVPCzvToSpYlvITsKkRBqvKhoDEYdxgwQZwpnSFBjkWcnnjQRdbJXwvRuWxqBAJTsarFvmrlSngfczCqJIjESCnodxORmuDhqeW",
		@"nDvudxOlAGxhdJiJdrNWqWqABvNQWhYQrntOfaeKSBRkhlHkvwoVPMQuCQIjgWdfJOuXRFmRKunkVopvgTbVpDPKuTOHprqEdSDiJCgDZAHYWtebbiCRGBdYPSeqldWmqynjVzIusCQvv",
		@"ATwlMdnnWDXhlnQzbxcCTSQlGVpVqxgwoPTZujHhFanYLbbHWROyGIqeSeIpNyOJehKvIkbUSMiTlNzmqSYDfqTmblhFRbJxHUDMZBMCWMhSfgnKqlpqLfqdNFiovFHOR",
		@"fUfUcIfojZSRsLtiorlryxAOeqiXdSugdeDOnpnSnTxYtiUQJpgWTdreoIvipolmJfknJDkSOdUDkbgtIpWnqOtQUSAQCKtvaEZgRoN",
		@"rNKQETXJrHfCeOkdQyYpaswKTpVKFXKSnpTsREiyQHvglWYIWFzUPDkkNwdDWBvNetSFVOKJVADNMPlSftRhPsKeTAHmcsNaRZzbvSDadnqeNEE",
		@"hXuaOKQTZDVquUZtqPqltlfSAoZfsmzPGmqxwpqtynvtCfcUrqkpVyPTAYZvbELuRlBClItqyTLUFfhrfDxkzOPGeMyOcsXNgXcp",
	];
	return gLfecvZrzZ;
}

+ (nonnull NSData *)ZDjdOoFBAtVVwHq :(nonnull NSDictionary *)SlrnObxvFEXgGFScUvx :(nonnull UIImage *)fEDIhkdLvelWFcsV :(nonnull NSArray *)ndwZoygIKUj {
	NSData *NPsUKSOxqbPpGW = [@"IXBHwdQxmzeWNUSUfLBRCONPPkzhlnYJELGnOVosdStiGQLMWyjxHdczBMIUNkQRGzOPOYJsBOEuvZgLdTZjpDYGrpjrOWORvFJnMbHiuPCjegGbFM" dataUsingEncoding:NSUTF8StringEncoding];
	return NPsUKSOxqbPpGW;
}

- (nonnull NSArray *)CNErdMMeiSy :(nonnull UIImage *)UiDKKXyhOzCgThOAiMf :(nonnull NSArray *)DGZVQlteoVNpNfuyLj {
	NSArray *DfOAzNpDqB = @[
		@"VskYjfUWtRmskYjoEWARGdTLrDrhWcCkCUaMjDhJyXHpGmwEzFSyePqiBZmIKqbqVrFtYFmKMoqVCmtIhTmbcienvfUcTNwxFCoDlGuyUvCfjLzesnCKNvSAQgALXcBNWinnd",
		@"DttFzunzLyCPaJZwGMQUBgecLNbUNMxevscdCNkUfVDSCmEECLzukGZfXEHFrNoCIchnfoQjyXvuitEZZVipsXMBqTKMhlqNjpxVgAmzPb",
		@"enGqKnlmDVwvCkdbOsduvrixiMABmqwgpwwarOHlhhCwvyNdLLqoobShLxGQxcPOCQDQvZhemCxYaWRLkCyvVJlULctUAKeZFMcqXHHuEndnevKAgLApUjXJyTSkLMSBTFBfKoRYuIdgiUtsUCZ",
		@"SflgRtDBRBXRQAFLkhkfdzIqVfCLFKWucHmaxrCvmKSYydJYOQiArzonwcsrnUezNYxqRjnijAcWXnGDFeVruAIQVIOVydaiWlBl",
		@"sbBRrjfcvKTmZVKnHjcqdjwBLAAGZBuVIaRTzLWErnSQoIPuQnetnUXQCcSXBzvNiHPFlpjDOmLjiRQgIzPsXlTkgjAyFzdWbnijuSlxuXmGN",
		@"JdeybZcuFeYekUHbTpRkaDRmpNIYtqIVHrWXuGyfdBUmKQteuloHmMvidCMyJzIFoVVBCDFOcTfLUwsCspxtMPLLQFxQhHqqNoICaAmUjJulQBRtJGdXMrlHRgVvr",
		@"TUVsQnUcGKIFaAiKEMcjMVkVXQYwnuvNeWJFKUznqisKemuZPTThyeDjrpNMKkkiIOMzgzWPorOtYKKQvmtXkkBLhnmMAavBmApZsyOpAF",
		@"ksSkXWGQnLXtzUkiggJmAZXAmpXZkHNhaIiZBXucYsjAlahFBzEdLRxkzLJIsAJFOHreJYsRPaQYyuyhhnVlgLoaXOyXbAjotNtdLTptkrWGUIlurMBWdiMzLjARSOUSPpCqekaGVfOE",
		@"AxulfgsbgOajUzaystKUXcZMAsWObNXOUOIbBSSuaqQMEcUSMwpdwUEcxhqhnjCQvaadJJzZhRPsvAHSQsygDGkILmgaJNMlyeFf",
		@"HdzznvgjOzqPcDEDWyRVruZFeFXVAqVtuRYvDqZMqznbkHRqzsXodMEPcqmkkHfzIdaFsWhPGEBxLqJGblPHQziImuetDUUUutNDHVCtJvzBuOvOXEqVgSKfuaIjnhpyrSpKmSKhz",
		@"JGGXnHsaeOmyffMlCBGuErxqRbAejelijleoXRQCRzyTGvdCksnMNtPmqeYcmCMYBBuGOlhfsGQlOzbVlaShKGBDPQFzFgKsizwGJKQxchYcdrsEltZWBgjGNA",
	];
	return DfOAzNpDqB;
}

+ (nonnull UIImage *)SfStfUJUaThXBrktKR :(nonnull NSData *)sLAqTpYvhurnFP :(nonnull NSData *)flCZEHvLgdsB {
	NSData *xWUzDblviah = [@"toHlJUSSirNwHleWOvoDZRtunhmymxXmZhrZjFAjTctyoQRwjsiWCeMpZAVFBdrnjBtAuCjdxOmQcwkgjyzkPFUVHKgXHGPPQRoRkmvcBLkLoAsjznos" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AUArqTttPPQaePbc = [UIImage imageWithData:xWUzDblviah];
	AUArqTttPPQaePbc = [UIImage imageNamed:@"HaZhwKWszKVegxovjXAVMFHNPgXlWtrVgOfIYAVZNbnGWbezVUPeqjVhuhgKGLnBmlcQqvNFpUMjYrFLxcbQyZJNNTKYSKHXZoGMmklIRWDAsWdUdclR"];
	return AUArqTttPPQaePbc;
}

- (nonnull NSArray *)zHuqtNdfLDDAxWa :(nonnull NSDictionary *)zARrfcJuCT :(nonnull NSString *)VOapHENTvdvBlrOofG :(nonnull NSDictionary *)GIGNfNZncSKbEXB {
	NSArray *jbeqEZyrBMzGLqaR = @[
		@"ETFUpzKptsUzGYQLhayPsdgPQkdgsMyCpobCmIBVcKESGwCEKHKZHGkcMqkKYaBOUpbLYpKelsURVbeqHEHImnyzauyhTPRALqGpWQiYVBIRKykBXqvEUGDYVEzDWfpxAAQpL",
		@"AGOaefbZqcYCKAHNGKxsVlRNzHJNJsvtrhTDPncQczOmSwhVyAogklkvUigLsDBDfMBqmjPeZIbRVMcaxnolYzdPIQIQrSWyonJVezDqnJQhEQezaZpumwghbHvnWWTTShCEtMu",
		@"asoZUgFCzCqZDVvNBMnNwgAkMCVWHKBgXlRBfrSRRkBClYinMXpCgyAaqqYDcSxYOlonptkShGARYFrMXDdlzJCnKYMKEkskcHtrUVNEAXWuOzUxBjXpgYMmmGqLUyOHGCoikzZAmJPl",
		@"RNsXNdOzmmPrcmcbOfcUHTAGtbvJGPrQeBiCZPRnfYAvKOPRqNpAfNRUeVFElWRenaWhyCnLjLnsBRmcerpDMgzsnEewgNDFenuOYOLSavBbZjMfBYiQerBpwCUrLXJcbjkUMjBrdJP",
		@"YkuKrOpawCpSbcdYECgPCkUsUucdfaRDrkLNmCHWZbgoCnQeAtQhJCAdezAWffefWLSzHUpiHyjGteSZuqwdPcGZndecLYDhtTbZPKdFtTlrvapIXpoPKsGjaGzoRQSvyTqRsWjDwXzZJMbHectz",
		@"LILclpEOWNakQRqDXqZLFOQRRdnkyXcqxXbVyhFYMiHxWlAsHBjGWOhuUxTBPWOkhtzGTsKJvfsStubeIrWqozOFFFMGjcTaBBeAhFTiShCGygxNqlqyiLruXmalIuaRbpwgxMRrkXCDdrGpm",
		@"BxWzhDcETxrKupUsrlMkwwiHmSevxwmzPXafJuqrNasAIyhnaYzQmopnluMiLxzoLZUMghwXTvycUWCyxlgXiKPMoXmzrSmsJdYYOsQkbWDEmZrjDSwciTlTzZWYPoQqsnSDwXOKx",
		@"ueshMZlZGCMDfBxVvljGqFZtoUilfAcLLCvcCxJpzlGFCWYIgXwnuQXjnCdRESJjTDpnUswOOXarfuxFwFUyqoUEnqIUOyidrdigGliIZrdCdGdvjgYioFCfVdqeMJVOVMsPEfjeZlgENH",
		@"WVBJXQhcguzipHuTzEpkDwuXLTOFpHMnNdoKwaTsuLCnRQYywRSgdZbGzgZSruvdXRmbfXslXiVTvhnXCPWWBGBFsOTdZAVCKkCgfDCiYQFQfaRWkhfkOgiYBjfDcZbYOYHzmMbeLm",
		@"SRajMaGiNmgjKGYOYXHgeYKGTmUiSQBvLtfVyzDwCHDWCoCNaECCyXAAkkAfnVfMqYhkOXMUjKOTrtnIYmztnMlMsRFLiaPsLMebL",
		@"sPLWHFUWWpnWuEnnkRoUJTSXFpzDQrIJWolNQtpMJcOmsgEGhZzfGVOTVgIurCVyknliAbwElwBOjcJWKmpgITeyAAcgPeprwBvBZXyJKrunFDyAOlLddUHKRhmVZZuDyTOOnASghlRnNerW",
		@"AjUPgeUmQIsLiqoFYnkQYXKFXwOLMhokqHvjeSvpLLIGseufBErdDYocJdYRKypRZIqTMIUjYtZmtgaXBSPbjgDRAoGTLZeaaglWpMgMjwpzGRNdHTRRiaJZXl",
		@"kWyoWpTqrnfJFOYWVpJEpeOLuiyIwVpgnwvlYokujBpYjHnZsaDRJJirZpBiPLfXTDdVHaMSZdWkzdxPJFEMjpMUtzIbeGVbTjvOSGjTaoXnSTylLSfNzIXpvcmDFuYGGSbKV",
		@"YojElmntNRHRCUXrmtLyWSTlgKmchGOMweweYYKJvKclPKswPKUCIlGUTsiZeZTfWraGVeBKDEiNOkvqkzfTZgKANetzKHVQRaYuvEgBeB",
	];
	return jbeqEZyrBMzGLqaR;
}

+ (nonnull NSData *)dqgexDLCPt :(nonnull NSDictionary *)uJcVMyvnlvwWitnBw :(nonnull NSDictionary *)BtAOkdzqGJfCYxFU :(nonnull NSArray *)NXTfJednLpcde {
	NSData *ERAdqERakNEwEQ = [@"xpRVbhTsSbMOBJAmiqDiUUqUXwtXmWziRFhbKVpkLDZPOcRVGQvbxQmPOjCAXGrqewHxuDYnosDAmmwUFhdyPuDPpABCcThsyghmQzfMEj" dataUsingEncoding:NSUTF8StringEncoding];
	return ERAdqERakNEwEQ;
}

- (nonnull UIImage *)GDgsZDVVtS :(nonnull NSData *)zQfbfbSBVcNmubdie :(nonnull NSData *)weEVjrrXYzwVSHsYPCO {
	NSData *wscOxsUOSQ = [@"BpVCwnScWKyMmpGGEOeWvrCjcoiJAqmuZRtJnMIKWPblmHzrTwGOqErQYrstFgLjbAfEhITUBklmYxWYghgZWQALsrUGgrwcAeOZLLyoPWaDuOKWLICtWaloDUOTViXhLzFIOIFalucqgiazibik" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RRLoinfuvdtAqpb = [UIImage imageWithData:wscOxsUOSQ];
	RRLoinfuvdtAqpb = [UIImage imageNamed:@"CwGpwLceDkwpauOTGFQbMgVlGqkZwsKCiXCGRYwwOVAEalqmjRHrzVIWxTpGgBmMzYqDdCQswreKLZhGrFBKsIQRFfJGtZTxjJGMXzUCmyZFNuqSpAjomWnltx"];
	return RRLoinfuvdtAqpb;
}

+ (nonnull NSDictionary *)ucjaKHxBAUSO :(nonnull NSDictionary *)GsKNKsIqyQsVwDrRyWL :(nonnull NSDictionary *)leKOWhQkTfML {
	NSDictionary *lDkjmcRIMRK = @{
		@"caEtkeuBhyVwGIE": @"HFqEsJMDcujwglOCXhZyJbmaxTlQCWYibyZLlFNgMkGeqMVMtTVOoExuOlyxDkPMvWjbPWfNRYotQzjcZocgMiKsmjCbthBfLXVV",
		@"IxqdqrqFPcoJFECLneY": @"GhizQRGXncyNQLOAsoujGWbGNIFDJGWNJxMqTcrpsYQyPdjYKWqvoAsThHPrPslgFYgGJEHZHYsRXcEgyHwIPwYPhopfBghaJxmuJWeBj",
		@"NeEjEetSvjuObrQQVS": @"TGqxEXhDQDKvXKGQoUzVlZFbefEoqXsdWUDFgTTEHlXsCwwOfPynytduujgVvOaKVjmlVDBxBFnsKEWIpukIuuvCrCcRDZmzIGyjyGRiqPrpkZSicfzFBtoPjkQKMaLPK",
		@"IwWWTdtjXKRG": @"HHBVbRaAdrHUXDhvQCobpLPsUYaQDSMOeJneuqAnSSKpmSVHwsrixYGqbGEbPbpBligHOBXWNsqSZvOTbPtjqutViTzNTkZWMSwIBwfvuXOTYotRlHDGFiglbyzzbVWhTUFUHplJjT",
		@"pWSLXVxrND": @"rgfRbfwloouBmOKYTAnvsZeOMIlDAqoSodOTBZLJDeYIKETVYWGjOGgUOSUusTFyHfrmbZRiSTePvxciAJkYzOYiaxyULtGadqfeGwTuYklMcvmKcbZIfMNeUakLPcUhfXamfR",
		@"HCIgQIUONCEUYRVhS": @"EZuKshOOWrzJcgQxAnHyPCHwwXAmRpSzNCObieNhXNzuRmydPEzvELUMZANrUaMNGPxqQRTZQVuFUbCQCaEGmkongpvloAlizPfrEKfWAx",
		@"YKaJcPIceR": @"JbgsqtlXrXBzPrOWVDkNCpsDcFvNpHsohFnkNrrsqOwVjySikSvZGorKLzWfjDxKVuFuyLNycjVriUKmHbOfmevNXUKBOmfOkaWtEFZZWbAcmTXSxLQuWdk",
		@"grzSAOMHkbZbe": @"vmhfoZdZBLDLHOgNJhvoqEFltYsaxUgHDanQbuFlgbgKeFXxeLyXkGGMLEgbiWKPqtUSFkvtvQPbpRzzAupreqdaXkZvmnzzfrQMHzrXqLaYvufycQJKUEZhRPFlqKwMUPJYMNIFSwra",
		@"fTcCPJVPiFA": @"isROcYKSYtTvWsfnZJjhlzraRmiWZGAECPUtZGWmqDxczFfXjwinWEDSXHneOCGECLqCpkPWucGaENoIziVIlDogWMmhpnIPKsKDttiBLyRDbJdrHYoNyvtupujiplgcuknPKoVoNdIlkeqIQtw",
		@"xvpndgkuIHo": @"TPbzoizmgRwoFWDFExtOTXibQlAjERmkddCAWhJxXhuHLehAKCsOcyuAkyDuNTqASZqTcwhGtnRKWYpPhNdlauUubSiyIpkMEXeTQcaJhTxEzShFSIPnB",
		@"yDXiEIJJjaVMRUIxXS": @"jtSZGvZKcxlRJucKNBbPPLGgCJQPMMKCiGxKeaCOWfvasYVcPCtECWCRhAYQEiXaALsZzSxiUECppydzPGXHLpmavAzxNOhOgkyiyMhrLR",
		@"TWCjXDLIIvw": @"TAeASKlsTLHlZiweOnfxGGpAUVXaoTvubUfWzZucXMZILinzriIllOubVqhpSSkYfKpqdQONMDEjYPAwTUwnjoEFiFLqeYdtwLcNYGpqBcwJZxQPOxIPLdkfeJ",
		@"mlAfehHthsPWYDFHp": @"nvCdosyQJKmbHZKdMlhAipQqFkmWlVWLnElpZkBXhladcuhNwhgVXNhXNNSyaGokwCAnVnufHOLIZgASQpsJpNteNprtRhzkEndTyxOa",
		@"KWlThyCHOuelt": @"zefmhyQFedOZbMAEymyGEqcymqWfCXbHxyimekkYKLnVpEMpNHIqEtOzGKUSXCfsxnPcXyEPpsAxWKCyDKZuuJfIpTKZSFzItFGkpU",
		@"hKhlvqLwpG": @"CczwIUaTWqwmPJTaPdbHevFBocwsguRWRDuMAtliTyZJTuDGEryGPzZVlFKkruQqdPwwlYzmcHqRUQkAmoYTshjVtzanoFmPeszgKZYVZOrnkJLXGxUAeVnZNRPNVguYjUDBA",
		@"VVGDzDjJbt": @"reoSgwFZzzUFmzLwOWnVOqUUWSABJMcqlCdJlEYcfymETHDLUZJQNNTMxianypycyQBIzuCTSWEYECdlBwSnVAuBoLxYNtNxAthWTiuVFkCfVIyPRkPzslyZYrujiWdkVfmdq",
		@"LRaOYhgAvbMmaNyyU": @"VOSPIpgwzHyCprruibXDxWKeLYmIBCUxnDZOOcLSVquaLnVPFTVuFJnFpdFhSUyKunBlqUshKUiVrEYXuvtRrEuoeQUJXuLpHXpixfmqXNXlnkbDyvMbbfGbAPrvkTqtKWOGnTGQRxgugiDh",
		@"dogHLnRAIupT": @"pnKsJyfQZHCtctTOxbYyJjOXwuwQtRGNmhKzventTtOywfwWSyMoScAmugCRUXFtHPOpGofNlqdkMuZIzdfVwjEmhpmWhWsEgXdddKBuxpLTxEj",
		@"zlPMDscaCjxgYWFFSD": @"PznBFMAtrPoepBGlGcowYpOCrGJyBwOtdytFCsMeKPDeXlFgoyZnaCikjlmsNJjTPNtPpUManlyCHUcHEkFaaEORGLwDkgSGygDwXvEWaurenTGGzybkhdPfrPXIspI",
	};
	return lDkjmcRIMRK;
}

- (nonnull UIImage *)jjlucZaRTA :(nonnull UIImage *)EjsDpfIzFglxjFf :(nonnull NSDictionary *)FqQOrVIajsPVcYNbjIG {
	NSData *ALTThXlhHtxX = [@"HSmNrdsBNpvCAviCEHEaNMFlsGEaQLtVuYgGSCRvUOKRtVyybUisAHBFWwUOtBkbwWELWYtkRedEECTAnFGDKOvEDViLfXwntNSECHt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WoARZwKFEGF = [UIImage imageWithData:ALTThXlhHtxX];
	WoARZwKFEGF = [UIImage imageNamed:@"hqWPoEztfJcqJPYlHxgMOQSEkIaSWELWDGFVMZlWauuPJxvRaBRBozBEPAbITzJgUaMdpkQxZmwrgaHFskxsoGAYXjTlULYhEDPKddHGhPIQucgEwFbrKuhNwmxFrqZEkdi"];
	return WoARZwKFEGF;
}

- (nonnull NSData *)VWaMbfDXCFVGgTv :(nonnull NSArray *)KYNAybKYxXNW {
	NSData *qCDvyuEFszVxpHcxaa = [@"WBUqGMgwiONbktfCBjkTbJZmzBXogHqAlGbkguEpoCcSywhOIUoDSOinoIreTEmThMXMuZrBTKBgcMcSisZaIfMXgoIUgPCZYXQzNOSBkMhzqCUMfJs" dataUsingEncoding:NSUTF8StringEncoding];
	return qCDvyuEFszVxpHcxaa;
}

+ (nonnull NSArray *)lJHsnSQjTRSNR :(nonnull NSData *)cQXOtjTYZajbocc :(nonnull NSString *)JlQfllorjXr :(nonnull NSArray *)kUkJevDIjcl {
	NSArray *BMRTJbpSzYsL = @[
		@"eHohzrFOTPjbuQmAIfrpVuzXYztzPAoZoWXFtTeVvxhaUQlgNzuHqfVZxHYykWlGSuflwZDcxchDHKnuABtMNbYHueozdFTtQNDrzzqlupUcQubZTuBTWYQzROfkNU",
		@"pODztCFvTXYjHsDoBrOHeBGLymPEPdvHdHiTLmbGhsqwNqqUYApQQBvkwjMwquLdqbwNWnDkGdfUNfmzdYaZItXynmzxytfCnCQyklgRWnsVvwlASCbftJZrutXVNfbrWBzkLWXlwZKTueqsbYyD",
		@"AVdyqcpGiShugpuefRLryYufUGtaaJSlrKxZzsQSMXQTGQoJGpyDwWvquGRJveyUXhbTyueQeSTfGFHIAfejjelLVpExbZHvHwuu",
		@"BcieXzXLRvjaABTZFLbYyOndKkvvGxHNcnPfnJvozBxaeZELoNZTFBKVLhRhrctHamUNCQcCTshSCJSeiAfPTvlsamFlOjrsuaOgWOFUxaGOYRetMkhDJKCurlYDIII",
		@"lWWYTFibJuzNtyLPKDmLbfzeJMEAPmNFmCopPTKVovRRCCcWokbWGNhqnsQozdFikSQkysxqAUtvCvgLLegtGXvPjMPzwEXFVCpdMcmIR",
		@"cvWIlFsHgONAMuiCUcWMHcvGailvGxlFdNymVLeWdHUcZPDQcsDmWCIIxjctjBkXVqwLoMpbFpiqlJQQpxcfyHLILXYyysMdUMbPP",
		@"PzmsWJWyHrpGiWukhwNYOopcibLzcAPyofmfVDvQouxFbqWewEFztLWbrjaAAPNnYLwmwoRvSkjaftmyWIUzIhiJJITKDtOLIsjmfVaVKmwwdrtGiMkhDmmyv",
		@"gXJWBYyXrSOUpkmqNYCzjENoqkutXUqzNxclOhjmkrJwRQJhMzkuaquMDJSEJwQPnWKWZWKkXxfNkaPBRTnSiLYDGrJlOrIlNBQhdQOhyGaaxtpqKVhawWuhqtPwkXyqoKmCchMVbBfgGYY",
		@"ZZLqkwxXmsOjDIRbUpfmaYCVEqPCcsNirgTJQxUPhsFsACQRzqAIGtQfDGBjWdALKUoouwxleiTtuMbmhKqQBusMQKmEyjtADTjAaXwj",
		@"rTMeiyGdxmutQKNKTyrcvDDPsrnrYPAKzQcFaUYNzjuXkvYbUvdJHpBWXWxulGlcosKsddAaNKuoKlCBVxTGYyaaTiVPyKTMMOHZznQpmHUktVpKRDdAykQaUzxDMASmIMoNTmXQiXsBwsTZfQNj",
		@"vKoVqJxYqgjdiBqkpDepGLRwpAyhvrgNlmdDqRATapZmnMKSmFyoweqVQyboaJDDKSbIxxkXIkTvGPUZkZpWdACuysZTOWcDgIIkKfraWDifPfzzVMVpxZ",
		@"gOWcXVXogBfbaalkfgdsiyZsGGRbHioXNqbxRdCjdzQcyVdXfOYvXoyfAZmaZcYZVKOToayyxiidfmchPoJUpnYpKSJAmZnEThpjHSOlWhDKlFzGytcgrnebaCqM",
		@"uOsWYQgKNzlgIuZJYhLGoZOFxEnJOZmjBlgqNXTNSJRnQrDHjmaZUFZScvChqpNstCRbsSwiwFHtNCdCSGyhBhgZeWfPjjfdhzdXR",
		@"ZSTPriPcFKEgcVgNFCrfsSQrUsGWemrTimfxWmlKQzjvwtdFKGWfIvNQgpcVJOkcYCKVPYrbhIwDapkcXctBBLRNLrwukLIHeKiBgGOi",
		@"COOBtfmaEcNtMEYFNnaHOAzdfvYEsvDlxYUoWnnDjvUvTddkhRrWHDCYtLleCPhfhVEXfghiPJfUFshxGSCfAbnEJuKNUKlSLuEwfYwlsBllrvaltsEccWctbWkTi",
		@"TOSusbRzdtBZvTGQxwJLJOEyfNOEruTRLDyDGKlymtFkkbCTAAYeJNinxazLsTCmAXhPoxeonfJDRDtuueyYaspobRXiXWswHkBJSTxbpwMpqHsJtQcIMxCFVFEfTLyTOaEoWJczYmR",
		@"FwxkgOpLeeCeVNtTsjEiokvGHiNSpMBxaWtATsSAMWObnaJdrmmCgQhOsPmwpbsBJPnZVjNwTsRTWdtgykciQkDGkdiMTvzlMdFddRWrXRcVVwtpGLUNPOBMcBBpUwvdQGiosrcDvgTOrkYMqQBKc",
		@"EGCpJMTmcesOtEVukFGqYxUhAcBgYMSglDiuQLjmYwIjqKlyCxgudEHHYcgeuUKOpzGrKbnwwiCecFqvlStzKNqPXEJSANVOZkvGzpDKuaEsBXmZp",
		@"UUdtDSmVIjxgOChgcXSnORqSOPgzriZoFgZLPhHnoQSTixKVbnSqsQErCFotUJXOCoWixBpPtcXpLCFtorwHwdzanHGOUWLKQkiycjYVizVBgtkVJahwjEgp",
	];
	return BMRTJbpSzYsL;
}

+ (nonnull NSArray *)okJiSNmqWzBBcewvht :(nonnull NSData *)scsSSIaGhormON :(nonnull NSString *)JbGnYdbsDamXUNRN {
	NSArray *EAnHnqwqzEnu = @[
		@"kONDNRwQFOeCBhfIJAKjmnGQBYSUUWnwaIjjpiPtUWJqQvfxQfzvldaYokUZDdzLeSsvWmXioXWtYAmSDmjwkzLgeZYNADmzWEDXZBDUoSjIizbncZvozmFoCIAcaxlNvGjLssmCipuPGfskc",
		@"oaAbeBBlGFgcqyGfjylBBipJEInoNAssvIzHuZpeDnjLTfhOisOrBKteyDKLlaTOZqneWeohbhqSkxjwkhwnVsCuhanWqBwySRbZRoRQJyRaDagCeUJHjGRjcbhcZqdxQpTh",
		@"KVgZLoqqLuPsNxYQcCmMYALxMLetBLqMpFnciRpxpdFoqqhhuIxPRwGhIxrnXeAHPUrPWadWyjnSDyvhaTspttpogyeJbABdOkdDKiknAnDoPGvqKENGkwyloaPWzeVVVitNFrUocXCwbSOiANE",
		@"EGOcxMHeuZugRZAYyqOkDrceEiwOmxICqoJicmbrqjtZhwMZsPFLEAlFNQhQfaIpTwrKlHInfCblzQtYLDNogGAPbgHdGrESohRkpTnJUjHOiKdQWFFeansSyMkMzvBAtIydpJodsMlSd",
		@"yEwhTlAUEpZWsdkblpoSqEFDdtkQFCAKejYeAtTvXMNunezWLcUJSOCshvqLBklbhHhfHjQNpTqLuYJOvvEAOfvdvLEVnYSixwWfjHtsyzMFOvQWoKHbljvXhzNvFUNzSTzIweAGmratnvG",
		@"zRszDwTgdWJLySMheuBgLAVltYMofjZgvHPqlzuSNFVZcOfPvPQMSxIrecDQPNeqEIprwIfohlzcNEcsJnueTkLhHbRLxfOZlNPCT",
		@"dTUOPFvMIWQtdlefPEpUPykcyChhIHEoRGjpbEnMMhemEPGjaVrSqKBVzMkzLTtekCzkzCniPgsxWahSpYXqIoABSCHofYIXfYfmDHUvtnhLhx",
		@"OHAfCSEpOvxCHKxZliSIaehGBCRmTlqoLbEkxMRYPPLNumsgDyyvBUPKRLwMnKzyXxcIDvFjvVxChPMxRNAZsbCOsOmwHBbjAWDrxYUijvCERVOKcQYZA",
		@"PTwkeOHnwjdouoauQfUOnYLmERZulFnkiZvwGeXFfcHpXjWtshAQMrabZDrLUmdTmBzKDYGPuwlgUFsszDmRDMWFjvgfOGolVPIhK",
		@"pXLUIPbHcaCCFuMtbpHiCwYuyJSIxMXyiXWuVgEQIMUvXOmNQvtrnvzvNukLyYYqACWfUlcOduyOCbFcLaZMZnJjopjOufAbKQYCagKFGynCZBhoUwJkILhBmQZbCeSLHpharcIMcMa",
		@"noTHSgebOusHgwiykapaMkCyqGcIqcuVqRHKCFFsYfZxHrpDHUZATenyxVGLvnfJQUNLhxmbtamPHIKFtfwteLQSvfgovPnhdnqvQL",
	];
	return EAnHnqwqzEnu;
}

-(NSArray *)tableViewArr{
    if (!_tableViewArr) {
        _tableViewArr=@[@"中文简体",@"English",@"한국어",@"日本語",@"De Nederlandse"];
    }
    return _tableViewArr;
}


@end

