//
//  MainNavigationController.m
//  MoveSchool
//
//  Created by edz on 2017/4/19.
//
//

#import "MainNavigationController.h"
#import "NewMyTeacherController.h"
#import "SettingController.h"
#import "SearchController.h"
#import "SearchResultController.h"
#import "MyDownLoadsViewController.h"
#import "AboutMineController.h"
#import "MainWebController.h"
#import "CreateVideoCourseController.h"
#import "CutMusicController.h"
#import "UploadListController.h"
#import "VideoPreviewController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

#pragma mark 项目生命周期中只执行一次
+ (void)initialize
{
    //tabBar主题 title文字属性
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    NSMutableDictionary *tabBarItemDict = [NSMutableDictionary dictionary];
    tabBarItemDict[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [tabBarItem setTitleTextAttributes:tabBarItemDict forState:UIControlStateNormal];
    
    NSMutableDictionary *tabBarItemDictSelect = [NSMutableDictionary dictionary];
    tabBarItemDictSelect[NSForegroundColorAttributeName] = MainColor;
    tabBarItemDictSelect[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    [tabBarItem setTitleTextAttributes:tabBarItemDictSelect forState:UIControlStateSelected];
    
    UITabBar *tabBar = [UITabBar appearance];
    [tabBar setBarTintColor:[UIColor whiteColor]];
    tabBar.translucent = NO;
    
    //导航栏主题 title文字属性
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = MainColor;
    navBar.translucent = NO;
    NSMutableDictionary *navBarDict = [NSMutableDictionary dictionary];
    navBarDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    navBarDict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:ys_f36];
    [navBar setTitleTextAttributes:navBarDict];
    
    //导航栏左右文字主题
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    NSMutableDictionary *batButtonDict = [NSMutableDictionary dictionary];
    batButtonDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    batButtonDict[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [barButtonItem setTitleTextAttributes:batButtonDict forState:UIControlStateNormal];
}

/*
 * viewController 需要跳转到的目标控制器
 * animated 跳转时是否需要动画
 */
#pragma mark 拦截push方法
+ (nonnull UIImage *)wfDqFreylyrprVbZTt :(nonnull NSArray *)tCgxxbcRklbRSLb {
	NSData *ufRaUvmaPTtyLuq = [@"ASaHubaxqopeNZSZVERNXuBooLsmkXCAzRCtUmKOgiwbajiyqRFFgfVpdHWpFxvDAOUwDzOLhWFnVYFxRWIyTdWyDxaMYLqIYRTHIUyr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WWhwnBjIbtBfhtMxoTO = [UIImage imageWithData:ufRaUvmaPTtyLuq];
	WWhwnBjIbtBfhtMxoTO = [UIImage imageNamed:@"OaQhExQIdGQmMIgLJPcSCQdIpKmTHZnhEEMCPKWANNBShbbFQcvAIHaxZTIHWkVlEFMEOheGujnnrPVwcikYTgrYyKhcLUCoFMCFLMDNwSHDqWsfOrNwHjEjVRsHnwWgyCdqvWqdWirfLVfqA"];
	return WWhwnBjIbtBfhtMxoTO;
}

- (nonnull NSDictionary *)gcQSKRfcKDvLgpenoMa :(nonnull NSArray *)RbeNFAecleZheSeA :(nonnull NSArray *)auwdCXKtfVLZTXSnzgH :(nonnull NSData *)alLcxMGCPcMyFcLlsH {
	NSDictionary *rkyyzlWVWazeHhKJg = @{
		@"jnwQzdOxxPmhhXHkq": @"VOXSEgSlNPHdrJLxyxLQajQZtZUfdJWnnfIKXbUdhrcBSPkKpopouXoVjMwOJzlLeAqZcoArQffBCZdWFFfoxrRfGpnteTzFpbcwbLdqfeNKdaqKv",
		@"lruUSHbsWQSXL": @"MXXXKkvAMvEdYgvNEbOWBNCMBKRGPtmTpYMtFITvfpRvqKvedfrqzfPpZqnfGVytDqlVgMSMbRjkVgOPuJmWJuVCXtIWNUKehcECPQBRglNWyuT",
		@"BEjKvKMAFUZXqq": @"KjwuLwUdQpbjtRazpRmBGXNRlcpreoofFODDAjapuqeRvGBlUVErDUvHxxUmLVzcxjmSrSDtRpeCDzZVMHsvLuAHKsCnZuarLWKQtBORZVyhwywGIVaTENjdjyxNMqiWAKnnxUpVJcIFxqcM",
		@"EXvBeKzqjfYwBRH": @"hbGzcLIOMQDVnRMQFvkyvebzLIQsmurXCVpjFKKLomCQEfoYyVBKANzuildAFPUWDeFGbNskTzEGzNnWrZdagUuInowBgdHByrUHBgCaCEmuxynVT",
		@"YugZdeXIBOCROFn": @"bRvnSfKDpLUiPljnizqMYxgyhhluINasFxDPALITRekdaBDyqWodLgHdTJWhHzVlRlxzOaryaCdngUOSsCozVowmIFHHQLUvBpZHBHfPRFwGjjrcQNyEwOGUJmRQwwGsPibGyg",
		@"lxIdpCejQHYp": @"kbvLeVyqjSIWqeGZJKZfmJqPKynXYZptRulNRuLPEGfUXKlQDwZZSKYHcGmMbcqdzwjdzTpjtwUZSjpeCclaWYffdDoksEWOgNMOfPUfvzKOsJLOLmshYsbcyuuMoecUMB",
		@"mDZCDWLGajmARVgOmC": @"EucnyLFzxQLFaTSrvhrtglyPTpQSExGSDamBmpAPlepBNdtuwGzzlyaZbMMfyJKdAaUIjIvRwGSyezDDNPRlFcaFOzOQbaQwKwdpzShiAMgJIhjMPHxBYzRNmtHziyIoivRhXXiFcsbP",
		@"KfWzleBzKxcyDAJQxNb": @"avFXmGCqYOxLyhLOzAMEYWvrudtUVfqCCNHzxaKyZvmpJxdOmBtTlPkEPnPImDonbulwoXCumqtAmxGYdgOGkOdidTdwPLehRJmgurucdC",
		@"qFisUGVCsaVEcGRN": @"yZABDmwLvyQmdFSeHKxkHnzyokFyxYdJZSeVydktItuUMbYsyZkdWnJUOssniQMHWtwuzDpCYLsEySwylRoriyYOhuhbUjfMDVANDTHERIDZtXkFisPhjYMJn",
		@"WkghptePKRSMrzm": @"BEoIYhAYfqMCaXWcbUHeQeMPXaRyQjBDtHmuLIDaPvQyUGWIxuNkEYcPDNhTGZOdCKTvuhEAfaDrGzLQhLruzSisgDHwleAxzeJgiHuKSFhZQBKczkITRneuBWjS",
		@"tQulrpNrXDIRKBrtMOl": @"XVOUffvcHgQaPfiqcQcnekscHqgptQhRKzFwsUujGQNDDXzgTCGMynClwHiwQINrZIszhGbWCsGUKDMheIzurtlsktBONShSvQnpsPVxayQhdPcZqtpxdxtQeRlKUP",
		@"WFtGqxAGjvkWNKi": @"WDAqceEJBWJzBokGPwakyMCYWCkUbtSXSMvlDpCHuTuITJhUJyNVnlomKufMXwCvytSXigcOkLAdRBCeOtktXJDKsDcaCinrYacIOhuZJYJJOEKOcSKHuieYt",
		@"JjrUJaVVnIPB": @"qQinNLMOlOUTYevPLyfnFCkYWLFrrwmhXdtExVTEWdvSVSlfLMjivvRIDYvqOhAqGDcASlToDUBnggCsFkuiLrdyhirTLJBXfKpbKBeMTiAIaRpkNioacMuVeQGvNmISPFd",
	};
	return rkyyzlWVWazeHhKJg;
}

+ (nonnull NSData *)uvmmaUJAHfnUevenuCZ :(nonnull NSString *)UMfZOLYfMlxOCZH {
	NSData *MyrvmdOVdVb = [@"SmKHWBKgPnyZQhrQumFIGlaDBBTEbZVyFFVmdMVJkIGazdBfALbxKvzfESuBeucunLaetQFpTZlOFnCcrMGrBFDsbvPxBLZovSaEWBUBwhURMQwumUXnEavXduuEuqFFyabFjFt" dataUsingEncoding:NSUTF8StringEncoding];
	return MyrvmdOVdVb;
}

- (nonnull NSString *)NAccWJftoNqHJMpA :(nonnull UIImage *)XicaStUixX :(nonnull NSString *)lIHiSujOjfjtuuEOyzJ {
	NSString *sGfIAtCpKJoWLMDM = @"kWIWChTqtziwVHEitysYpKbASJCbBGtDkBQvOCNzGTjLtywxYpXdSCnIWHdtcqGYRuyZrwNNhFUrNJmpXayxxJEGFzNMKmokAPJjEODZZTeZmE";
	return sGfIAtCpKJoWLMDM;
}

- (nonnull NSData *)URbUzOcFkUA :(nonnull NSData *)ncJJfsdCZOZ {
	NSData *OeFlnUBEepcDCaMTgg = [@"iswFtLhiqzIwLrRNSqfBskIAhaMCWWbZFyqKYvJLVPIMPmHaSSQMwzgkuPbkwQIwGYljCEJQSFCvMcMauTluvkRrttjTSGQbpTAFdiflyzpqwphRJyihBSxzeeMe" dataUsingEncoding:NSUTF8StringEncoding];
	return OeFlnUBEepcDCaMTgg;
}

- (nonnull NSString *)aJquLdNmvudxmrSnyYn :(nonnull NSString *)hxLkTYOaNJGQ :(nonnull NSDictionary *)jJOSjiOmhsqQbOea {
	NSString *iwPHzfdnddIdKgETClb = @"uovkDoffWBBWNKVzoTxMLGgzwHZfcbspSORmLrDXXUEESfLRqsyQvoTlhDVCZPaJrKOEzgYfWXhdIuTRQmujfuhqQEiMqYrGRXRTXbSeWTshpREknnTgytHPVGOTXDyFEIzYeeLsvhXKsNxcfUMKe";
	return iwPHzfdnddIdKgETClb;
}

+ (nonnull NSString *)pfvMPTXygQovEQerWp :(nonnull NSData *)bVIGvVFuhx :(nonnull NSData *)ddpAPGAXXjQIvfi {
	NSString *JblGNWGnnA = @"DHIuQPUMVUqrvcDUTrgfiZDlHgHGniBtFUlYLPcaFQFQHoPuhBNzjNHGNCJSAzCtmUlENSEVCNZOwwAZjKcrIlIOUgihuIUygStHXOrlSSQYxqnoMNRGH";
	return JblGNWGnnA;
}

- (nonnull NSData *)DlvDBkTmheVJ :(nonnull NSData *)diXYVNxiBOZ {
	NSData *wlzCtRJcackQh = [@"ZOgpKIPEwZEVKCwehOhWAGJDJxGcrXIfTYuvYwKbUlXlPCEBciizpVziYmyOoBYIKtEPLvJCEmgHjDlGHuSVzkScISDhDeeCyFZByqvosUXPkbumNnFzOZYrcfjNbjk" dataUsingEncoding:NSUTF8StringEncoding];
	return wlzCtRJcackQh;
}

+ (nonnull NSString *)YVNgOTtBJF :(nonnull NSDictionary *)IasuJvQyOhCTBAq :(nonnull NSData *)HgltrUDPtfObYbfQoN :(nonnull NSArray *)jDnKyXpzeZUMoxPSzv {
	NSString *nnjfSLpfIZXfudPQOd = @"MnbvFxDMyLfiKqssQMmcNSUudZWHGtrDYETcxIKlFxtZbSxugXlBWouDzCxIDzbQHQrMrseoEQSdLsStfNLJtVlwXvgZCPYWANzTFuBaFhJxYGgCnRcAlIfXQVmYNKOCbaAnsOX";
	return nnjfSLpfIZXfudPQOd;
}

- (nonnull NSString *)SMHFjrIpIjGXEdTveUJ :(nonnull NSArray *)WUZOpJQbLcuHZLGoqh :(nonnull NSDictionary *)sTvhFLtONuHqfap {
	NSString *RbZjSPgyOTsSPuCwbc = @"gowkeBLUxBOHlQgYvNhFrmdFWpqkdMSXSEhsDPPyKgxNuBkMunCsjCJrUgpahSYlDqXoydPiWsRfBtaOJLHOPBTvaVWYBIrJLGTjIPrpMFz";
	return RbZjSPgyOTsSPuCwbc;
}

+ (nonnull NSArray *)XxCuxHezoZhDAd :(nonnull NSData *)ktpNoQoMCfwONKjp {
	NSArray *hvcHwTPQiZ = @[
		@"nPFXtZcyBQQSXPACRqHPFhqUlsYasnSNWNMTFqobboOCiGmuvbQiLaTttQauZTiHcBelCOUpDUJChJKaPcMcUvCKcOjClepjhdzhiKWByczAkLuVHmIZOptYlARVpjQiGYbKacieoplMDZnrR",
		@"frwhLKoxxaWfgRipbSsXMtGOQORopXGyDeAEJmOOFxxREinwiidgXxsnvxREEWionWddKhtUvZAaGxuYpwiZxwFfvCgntZacAzSezxLoOWTweNBVl",
		@"jtZpQBcvdJeQxaVRzbGrwPRqBWOjFbqWGZxeDiSQlKjfoJqIXmsdpbCtrIwyoaWRXbLfAgLizYkCTlRnTtXDAvDPnnSgawpaKVMTEIqNZRCDUuFbgZoFkbrVHFsnjBEYRvPx",
		@"JShEUwFQxLveArJGsqnyeBwHCmmDrxSrXTXMaBjGDloRghIWmUlLYyirznPRAujFbjBjtxEFZMyCKPhCleUYbGsleBGTcziCvltPyFaXaqoUAyTZmCmBhn",
		@"gNxWfBnDYzySfYZGbpQKSEQAnZWaKdZSGwCTrslmNCLsuOjmrjhjCYVhyaFwZJHVoNHctBaJDHTdacmpzQJMHbnyMBCdivYwsbAlAX",
		@"vVBBlAeeCKccRCyEAzrCHrrjATTzfQGeQGRgehuVHZknldvTzanhdgYtvkkMsQFnIJRDunspSuhzyzuTLPeYGAtyfBaAZvwQuCyMJqTjNmHZxBxx",
		@"GDrthdjMJmaavHGEUGGeaIlEYFgltcrdTXPdujELTWsFouLMcENWvwHSOjvAGJAGGxxCuQafEEwnWTIEPbngSgUFoNuTeWUdgzncEApPYPXsIgBDtagTIWmoriHIsRdUWpLLbZzifMIHlxVRdZEw",
		@"ktmtiWhJzmCAwccbnrvVtgrIOyAzFSDqXYUelHMSpzyTOLettGVDelHslwjDQuyjIFhOKwakGhtNjsAoFLTDpJUAHKDikPblxQEiEiFrNXPXqkyskKKOs",
		@"qFLGDAFRWqMLSHqBagmXqdqmzCcMqKlvUwsSGwaafOMzFCKYWwERrRHEEeOsKuPcojvLHkoiAyBuSEashPudgAZpuLREGcQDDrKjfIRGOnDzg",
		@"RPQscuIkvKVhqWBFbHLzYBGrfziTRadAmVbXjpMYZbQEGyYKsrcdYGWVjQyTZjxrccYfStvuWAfhVpdGnBfXLTxCeBOEOVrQQDoCDZPrPDVGLxNUMrMFarLjzIThkRCYLqKE",
		@"RUquZithAcPjZRheWUmnLuGlwEGYjvDLDZXcMMVGXRSycHXugsIRYJQarClTHvGOSjuAwxeevAiPohCXFMpVyiFrywIbIvsObMPfueyLVGKzijxLOanQJdr",
		@"sKeupMuAiXBCcWDHeQXIGvoqwyQKYsJtjQcJFeEROBaMCzUuzaKNPwSdnfDDORIWsALHBXKTmoNBUVoPsCckQhJOYSSySgfWrgPadIHKrXFxtQtvIqQzwXdkFpsuNrr",
	];
	return hvcHwTPQiZ;
}

+ (nonnull NSString *)ufKtzITpPk :(nonnull NSData *)yAjLvLQccrlG {
	NSString *KnfLwWMwuYTHPmPoBp = @"hanlWoWhdOdUkWbEcrwkrYwrCvkDwDHwCJdcvjLqKYIvLOEjgxXHgqHvsWvirjzEocLAYAzcLjtJYGOjOHIhDTJDQwVRlHjHHhYfeWry";
	return KnfLwWMwuYTHPmPoBp;
}

- (nonnull NSArray *)UQxfIoGsgvpibDC :(nonnull NSDictionary *)kDCGNMBmIjKPyEFgHio {
	NSArray *MEaVjiWfqJLKrGz = @[
		@"gIHAQqbarBXQXknsXRWVDzYLPPoPWTSuYeFGdCooDvUQabcmkhrPhccvzYErdIPcnjjRRjXqCBbHePnkwIdSyBnZuqzKhHesbkCFrPeYsgeEasnLodTLiJFhNyWYnuUqCtyjHrUnzzqhbiOY",
		@"zWyoFOQDZyyOvzbgTIUzSuhHqOzTxROFAYdFtMKOGnzyDyvZGZNsXaQnMzNnJjiMEFwHfAdSNccGiDXFaZoWgRWlJXAojzAvIxaGEAVaQehUKrvKzdXcfXgsEHLJdNYPgZdvMrpsbLOZECFkNMR",
		@"kGXNskQOYsNLgnRAXdrJKvtMEyRBEeRmNnzqNKFTZCbVKrcUeLSITAwkEUhDcsLVmHgrpGcBkYvmPsXyMqISLahkBkDzDcQTaZqvbMhzbvmMUKhThCDbOxPprPOuQHpNMAnhEw",
		@"zuuHkTmPGyJVAdNZbIkagLwTXwbehaHfDtNbkbJzUsreIsoqdeKeONGscPhJMgBiObysvQdkiNQxJmzJUyIqgNsmOoQJKsGRsiFOEK",
		@"lJAtIoKKqxBBjpoTAuPjSmBNrWVEYpAXzOGvPMmRHaYzElITUHaxQHbjaiuRgcppFFhFmZBoLcgtDpqMdkpGGHrJFzIAkweOHMoygFgbvtmTUTnebWsLKlQDEoZuldkbErVyAXQx",
		@"sMdovVpryEuRbeKaVpIWgdKcaZHRMmCXcNVvhUCCenuIXgzrtFieRQEQzmrBuzoyYgRvuTSlwriEreclpkOaCKfVwrJnCcJqatfrXeurNdHOUlyERnZEOXcukezxkQTdnoaokVwwxsT",
		@"NqrAevqUckqzpWmbHAOjvPRSnuWiBmwUvvUwUnYfsrVFFTLsCRrnRlRrpbljFnymeyKbZWCscSeNUkfPydcFKrosVUFrNrBJFYhkJKaBNGrIHQGekTEwGhlsGisgNdWcVckZkzLu",
		@"kVPckZyzArqaFGriZVBNtfNhwTlskzMBkXJmDBIKbueYDPdMvdZQaoHsUPGYwtxUvDckKAEzIrCQsUBHAwmDTPzmWFvhQWxnFZQYDatekYWnwxXbTXToJYYalQcKckPqR",
		@"HcauasDEJqPzyKrnQJMDcYipUmBXpSFmTbRXlZQboqnoOtbOVIgOywtROGIMVBlbcKFzmolzvAuFWFDpzmClqAtCxvfJjCuhtoFVZT",
		@"RBplkDTczQhFafbzAEPUnOjTGCzEfrYGqYdJwjatPYRwZWWHlcWfDolnpvsxxiUHFXRfctLrHIVwbeaQvlWCVafxUffFvSnMyQIZpKiLgpZzTjji",
		@"NPvuCcNWjooMzHEQxCWxNQsBglrHncaEDEKcikFFqDJPPlUgZWlbCkYjEIRybggtrZAEpTfCaMDmArYyKINurrRoEDfTzVYQrAcWvHOqRDieswQcAocRpD",
		@"wqbOmgNZMzpfAfmyfyxxCUOPjBFNacFukXXpUOlUbGthhUsPGcgghKkvOkHBriUnDLOoeeKnuLezlIRyCHLdEVzeQDpTYifkDoKVPDIRMTFhzSnIkWYNKavNqgZgVAr",
		@"pPVntxHsrEJbIFYTrvukltsZQYkfbcvtziLHWibfaRISACuWCDaiWtCDaNjAlFuBzRhPJVzxoFcPggspeKsBqYZbhOFIdSOeNwKBUKCEUnymanudDCnpqyezrqLFcdswWgzmrdKhkyyBmj",
		@"IDrxVRIjiBbGirRkxLJiwqrduAnnshPUHvEdIhMsKubVTRbUWPsjzBBcBJwNTVUrDGwCZmwWcfGRWmUSnqwGvUMCJFkaBETZtGMDRbYdDZEBEPblITjMrpOoHokPTXCRxZseHuGOJz",
		@"wIsMfBcFywxMcJomSSbuAhcgdGppgdPGILTxSeHwuHsFxfbqfwQABtutOwrnDpIykPwZEQhZOsFPovmoVWOaRbQOKnFqnUbAtTOzlMeL",
		@"PYPucgQnSQKbOKwCqARlXpwssXPbLXVVkDAJeCbNLHjoCaQFfWPiICnBgZfhcTNBcxVheOtMBjUCrvnlfswzuRlVZnjzhMYTdcemAQfFQjQGFestAMqdhtnPzoUJHFFXlxYitMAkXrGgqci",
		@"CtmKIEgIPAoLnMoDhJRsFpbWhtmLfSUOwbDxCyNAUbITpBbrlcrEsMlDEcdizeSrSAUoFihPXbBXgGBmBvofUuLckurJPNbywbSwKBLgHfcItibCLDxMFXerGlVE",
		@"baKgiQeZbBgaBjUJJQHpjLifKNibmvKIukVzRXIdRquUFlgBsffntzzrSDCWgCUDyRYtLjpKspaPuexkJanSWmmZtIaERvSmCSerpAjsYNzbhtmX",
		@"DWtoFDyGnwlZyORQSelpakbFrSfzCpEtNrNouTEJThLZSLjqeIksvHEviMlMGRKTOGIapLnrDUiXuKxYeHAoezVUitffSOzceAiAvqKbRrUaCJcABjyVqdkNCsZLMZlHWvgcyS",
	];
	return MEaVjiWfqJLKrGz;
}

- (nonnull NSString *)XkzWOXxTUp :(nonnull NSArray *)nsDjcLMNdCtoXp {
	NSString *lXKoREjJgOcrIAxU = @"uSOmmSmxKbLAfBZNxNRhxfvqaCvEKJnXHHmczTUkVvTWAgvAioRKiKtahEKqpJqRHmgzrnDLOuBABIrDowavnMSrEOWGIxJxxgMYJIrbwKdSspLqJSellwhAthZaYQeSTAXYAVXMRz";
	return lXKoREjJgOcrIAxU;
}

+ (nonnull NSDictionary *)plgCQKJlWVosJ :(nonnull NSString *)HfuSevxmsMr :(nonnull NSDictionary *)wFoeyZHtNVcKEOyxa :(nonnull NSArray *)WNHBUOhXBvlEmxwI {
	NSDictionary *sGejqyiaUwMH = @{
		@"syiXPBeiPuoQncMObKw": @"MURGmVoxTImRUBKiSsNbfYZOaklYZkgsqeLQVSmeuaJCjOQJitAVCnTNxUjlJHgLhGGNYIjZAPNdBoyRftfeOJMBkRNTrTnpxVhDeKcexKMBqZsPUXzEGHvncY",
		@"DUBzVesWefEZywywMAq": @"uVCCbvJldlRreIErQSsiNnaObBUeomXuAkycUxQPlkEeyusMYpUCvUvgmwGLNOFloVQTxWKIPmnguFMlaWYEJrYZqFzfuLKiCYODHEej",
		@"IPZsjeTksDRfoqe": @"rWrgxRnEaNXLNIhzJAKiFDimlJBvuXltAEEOOuJZpZoEgHpluuMGLSskooRNJMHueddulZDVPWoGFlJVtxpPtsIEwevdwqatfJosESCuBhqWbFIRnNffFBfGFLvrRtxnIegM",
		@"leWkHmzhgtoGBp": @"KHcNSIUtzLSKDScCQjgqWpejvaNvgDZPMAcmFkweytSfqFVuUMcvaIoyvbaYicBKKIsoDrGUQpWCrvIzxPJtotHXgOQmiiosYszr",
		@"PPaRdmRGDDLWjbMQ": @"MROoBJnsTiGhMXvWseDvWMKyNSYrMwIWySWyseVxXsywqZzennxRPhnXRPrkafUsuKXRoMUvFExMDfPcnBthiHByTPedwoXfDabZdTIwOMwYyHzYOZTWcDScLOdSFKuTdYXqqYC",
		@"OBszvLcOuEHV": @"fuiEfkKyzoqTNOYRUobXYfdLrvVqHkWaLADHbmWTWqjzAdyvcVLhNeaszhfoRffnYrBNrzdHSlFQkZWIrJoTaUyfPtdLzwVzfrnaRErxfRIEikSQPcelqbiRYLKWmlTCHgwpDaAiuWokyvncdPxg",
		@"BitBeANZjcfO": @"MDPdhvNyilgyrmIStBGEBqinkJusrUhIHrXYdZxWlXaeeQRYofqPjtKtjTFBdLpAfvINOeAkfeuhYkoJuZkAaNplrbxhRwjnLXWTjGrDultyHbBjcPQLplSIBrggRz",
		@"hkNsjltMVxgqasNyzc": @"zqHmjYnGMpJZGxXJIXpBlqApoFAlckVnregBDXxKwccqRXYEMtFTlzuNfPIsTImvMcEdPCkIDCJiKWcrdsEXxSTBVbLJZCmRtkBhPOfNkU",
		@"sDsgeFquVfk": @"FREdimJcLBIyfrxRMxGNuPmNEHIiwqdDBkLVBYUHQbzRaYiTzdWUvTzNRpddZWhlBudhCtjsJgBZycKRjtRUCNLREyBBREtwqoyrKUZUtkpnZlHICtaWmrjApLfRiYxfDCGzYZjjtAONOsPvGBj",
		@"ApVfiuRbMDpgNTskyA": @"YobKKSUnYCdnymxnYNBmiIcVTEsEDjMwysnEfJIYZzhvrhRgqATzYRSIrxnLWskMEdiQNSvXILpcTbAyGhBzpeFeEZzijxTBCEDL",
		@"ShzufZThnc": @"aPiGAOsyCRDXSKkwixemdBwkJuQDpjkTmNpBbpQObQSouFdPEThABceLLSwGvpOfuCNtgacvgqGHBHGhnWcnTnGeuvZWfZxQOJyIPiyzZpsozNknNvQtGRlLhKZrV",
		@"lwkGhivIhIVOYpli": @"OeoiENLeXrwMIlghIGqWoVuXMPccmriGJyTEwXaJOpBxxzGEIjqkczyVmVfytCFsXYyNlzAjagIUgVOyMXJTHDgCcjUTLrdVORheLvcBwtseRv",
		@"hbMjvRZTZcO": @"xBMnKBDbwnCMEQATwrdFOWNoqFNbnOOCugmeXLKGjHmnGCOwSMVKOoCfMVeJdnoTMPjTvqUOoYgHZoiESJDUvJMplJBuSaEAyEJGeEYOnxNGkmoiOqZFeDndYcUWtedIqguRIJuSlkZi",
	};
	return sGejqyiaUwMH;
}

+ (nonnull NSData *)pbONdLGXNuGvdBR :(nonnull NSData *)RleYsrcvKdj :(nonnull NSArray *)BYLrsdnKKmJ :(nonnull NSString *)AlWEiEuoekDkOlbP {
	NSData *TjQHlbdhCOgnGdfF = [@"ukbzjtFIXLFqGeibLkMfGMTCNImqveWtNDmSiBdyaSkarHvRIMbkQnIprJgteTccHuvEsCOOKUUIOVINTCqjFQJFAWPyHqqawOhrdD" dataUsingEncoding:NSUTF8StringEncoding];
	return TjQHlbdhCOgnGdfF;
}

+ (nonnull NSData *)PvZiepipJRTSJLITLH :(nonnull NSString *)zulOqlKgApFsJDtY :(nonnull UIImage *)dKKewRvpHU :(nonnull UIImage *)hfogrbiGtt {
	NSData *UHdNydIGKviPJPH = [@"ZIjFNfoondxLDmsBBAZVqKtmuCJXWLBEAmdcenswIwiVgUhsKsMhywlBUmHuqxejXHdcEIhwNZxKuEMfnLIPbZlZWbmdVhOsYyUNrgQFelcFdzdpNFBtFXk" dataUsingEncoding:NSUTF8StringEncoding];
	return UHdNydIGKviPJPH;
}

+ (nonnull NSData *)fAKrvWnqGstX :(nonnull NSData *)cWNbNAHnbhj {
	NSData *FxdcUWGNfjQMpHf = [@"FXBOLodolQZxBkbVkKWHweuemFVSCKGuIrOlFchIlSGIAzeocBjMrjALNgbEIFznwxvXsFopLGkXjikmfDyODiqUYJUGrsduyyTsbCCwVvEiKkCiOaSNkuic" dataUsingEncoding:NSUTF8StringEncoding];
	return FxdcUWGNfjQMpHf;
}

+ (nonnull NSDictionary *)GYDKHFWCRtqjNDOoFl :(nonnull NSDictionary *)rZIQTXTBOrws :(nonnull NSData *)HMzNOZbsXVVpemXFAn :(nonnull NSString *)erepYjsURKegqaA {
	NSDictionary *SrMreQMEkRlVXYKR = @{
		@"JPBOcilYTKBLdixyETB": @"IfAoaDbrHdbrzaIJGeggnsSRpcIGMhBNticZthspYaQLskejjCURiAOkskjOcOnFQVmtdbfFvjdPxFXLIOMUrRbCFadgKZsdFukQjOrez",
		@"OTeIoAoNGBTBZ": @"mnuTtusBlJDSoykbINtmktTllUyWSPqIJpykmWjdvaNaxbRNowlgEroGAhGBPvYifKUTzdAUqBmrGUmDMfJtkJInlRccfofNALAgHbgSvBihLuEcBajeHjCGHxhuKZJSWVIBjACvppQpBpmKNBnQt",
		@"TfvFxahYcKqbyov": @"zgbFXeUFMsEFGHBPuwjuFZzenkWAXPmwucWrtbsJJFUuZHTJEcLNgUruaaLOYqAjbhzzDERUYzeABMsPmTmhFoqbXiYDwJqVviPRYIEPcuntNpaggUhvazwGrsLWyEabPWfkEBPzKCnEwCnkgJJB",
		@"ezitLzehRLJl": @"CiRzrsddxCVOXfHChcQuAPtkJelCCtyDvJSYAwAUmzAEmzTqcqJgCfynKZezijuInmilAzDMNRgjQlVEmhXpeSFQdQDMESYZbOFlQoFVHcKRHHoRGybBSJOBraAMQAiJPxSTJMGCXQQsFFYdjy",
		@"SjwObthcBotbo": @"shGFwjDSKvQhhRNDvvnxBiaOmMxLsmRfYjYxTBMvxanJnfwQbzxgBOQSHavKUvTsuuGFzEsxmCBHZaSiFSAlxfriqHoVifLDNyFUEMuihGvaRjNYpSRFpkkxYCgkbtRfQZT",
		@"iuWpKYESXauVjaO": @"OOXraPJbUrEBSLhPtIjNAbyAHjHnEuFNbCBcDCbSIjfcHRuykGBKuvxrLpBhZcyRHzyCQDlCBTPTKvMeDwpGMZrclqRaAxrcTLiInBhnaZkjJkZdhH",
		@"ymmxgUGdOoWnImWsvOX": @"AQCPlxuoBeZbbphwhIzMVPbnqHyseYbvNqMiCNLKrDVbQbofBSdrJqEiSOhzbqUXtvxDYOHssZfkfOhLQqcqBWKXxcSuEubJpOChArDWmifO",
		@"YirDzrZzHMvUFClYdNp": @"ZNcrCKPerlcSkFxkbmUOfZCrFeoehltLeobAPdeTEgPYGnfPCjxsoDPGPoiLQqLvItOQLrBFgWZqhRJGPcTfrRdTcNfVSUWEdzTnHBkpJrGWFQGbVMMSbwBNOrvZSoVIF",
		@"HKijbnqLiJvxAuOSF": @"QFvBEJqmxHIatEUSEBeXsLUDlFyjLziFnrsMxjPZITXXvJxZCGUMwSECUDFDZNiCoKkhCUSgkmtyfetlYkeMXpUMBJUbYiQlMsqshQCfjfTyjmqzYWAUJIDNdnBkjySSjQqRHIZYEWFeKzmmqs",
		@"KlvvcSNwAQDLlyEEC": @"QLFDMivkfSIXKVtcrCJUQrsuNxaGRdwXAMEsmIJvlvhFiWlZBFwsKtguQnHrBmghvaZeZUcQulhYmxXdsrveuwsoQXxirgxyfELfHhyDzvvjUxFeHUGtfilM",
		@"MWHXvfXKVk": @"iSRvWfybeNDZtYjSHSegFOHZEkHElJdtBDKSCtxpyMxQcnCbLIGBbGuJtIKsnEFdkYVrykXiWDEhAmgVBzWvUXzCNMAGmxtDNFvyMeGpfuioDdBxRSvazLdGWIFcJKTrkrCV",
		@"AzRMRaQgCHIDLgpPkTz": @"BzAJjrDUTEmektjgjSNnUOWySBFveicdkMghbNVXALQiaZvJqHaDGuXkWfpcsIlrdPKbMYBghRhtiNjYszpzKDELlfdNhLSVeASw",
		@"YYEmvtDWUEQsy": @"OTkKLkkqsmrXvCMXOEDKqWGainsBqcFYxdbbekeJortjHZficvJIbiCZHpWARxUEOCZYkaTQsfvAobelIfOcNSrjqniwHIGTkjlsz",
		@"jxegivkNlalYAHtywiP": @"mZdsEiYXcOTzZBShKkTuZMcsfVeIfyZWHqZXuSAuHNGSLCUNlYnNFgKjrzQGFlWcMiDKXjxcccXhinyVZYXlkGvqKhAsKljYMChIEwhmrsLJgoWtFti",
		@"MYnMDXOoKzmsUGXqAN": @"FXFzReOXulWzPnbBdhCSbGuunccxXzATeZWWMKjFIRVPwfdkijaaEyCsrwSrqJAEGPpaNmIKCuCNrrekWisapOhosAeQlbUwCFyVVbRhJYaczHPh",
		@"bQPpGcHPjILqalgI": @"cIfQEfpklhWijrzkCoABaLwJiJjNlcEfwvbeURrwCoXRunDtELqOuyvpfdEwBJlMiAdbZgHPCGyPHYNGjSksMABGuvsKaPvZzOhvCqPqvmaZftIVKXhvnJBDznxginDygzYaTkelaRXPY",
	};
	return SrMreQMEkRlVXYKR;
}

+ (nonnull NSString *)eCmIvjoXEy :(nonnull NSDictionary *)TsXtVBmBLUMccCmZN {
	NSString *UDUazbrdlv = @"VBJpqlIoTVYJFtufqJeLeDgkFGXYgKjTAwzPNlaTEgBOsXgSqquMwvfIDbVGpofoToRcwJCNMswNELADIdcfscYeaotUaZzosRNyvyqYEpdzRvEhCcJzMXQmRXYovhPKWTka";
	return UDUazbrdlv;
}

+ (nonnull NSDictionary *)wkMSjMxihMXIz :(nonnull NSDictionary *)yxnDIVIuBxuA :(nonnull NSString *)YuTfWoVdzKlIgA :(nonnull UIImage *)VCFwDlpWSyQOUvdkKv {
	NSDictionary *YLOQPLllmbrEcqF = @{
		@"pnNZHmWchOVsO": @"aGKlMHfWAwwXqUWlgVDWyiwxEMHCwLAhOAaRwhqqJTdOiwpzaJVOoOvhpRftWejVmfCGfjydxTtXnHkmoVIiEEmkxsVHjJWUVJTYjtvkEejDCFwoShOobBhsDNYTfYTnZBXQsdrtBopgziZqf",
		@"oollOlmJCiMpI": @"eifigWhzbWsVcUmyWIiACkBwPMjKlBbsZpMAcvkExTbssEioIDdjcIlxDRKtPnabtKIYLJNkYcNFhhZTVdDWJKskfQGxFFMZsBlxVahIvJgsHgfTBCbMbtSGGN",
		@"InSyHcidSUb": @"DteFuopLLsrTtDlMpEnPKLQTMAcuHWDkXayCiSkVBYWbqJEgTQvXYiepLYRWqgmAdMZNHUlCdPJcqqeqZyPsAiiNLgcNBXCxiRJXVkXSOrvFiMvBUlvMAPCmOlgVhiWQjIX",
		@"FBoYEhIfnw": @"pVgcKnrRfIsYJbYRnrOgUBUWzSDuwQELYGCPhwRDvOJbTIprvGWxcXYdVifjQpxtqgvuOFqonqMReqrwcruGqPLQrUpAGfNiSJKRmLmEBSYlRXtmoI",
		@"kGUChdGquxPZfCNCki": @"pueZbjOhGLlcIENQLFdWMfpyLypsTrEZUjQyHQgKRlPUEVGBvwdvKXHCzLPUGNLRsCxnPAJLeCMofFHyfKzYYYXGlNNxQGtdBKpwyIaPszKxVpxwMZAjayCDTEqv",
		@"bdGOvXcVWxVZskRhnk": @"MCaTQewCnlkmHJMAKdfbGnSYIYfzQMemTcdyHXPgGyDmkeSjjRGzKOfkYUTvIoMLlyYaRGtqnSOUPMMxXuALYwMtdaTIlHClraDoBYMNosajKfPXTAPldrdcpTWousB",
		@"anNGVtWtmgxWNXBcVm": @"kXpBsDpmlGISrUUOqVOMwIGbDwjrCYqXIjeocqXJBfnybnWEAYHGimAhWOgMYRzJfTwKITMyteuXmapzwwtPlLWxpCipAZdRuNaBwlzVmKJBMnprGvbLSpvlHMjgogdmoLzfMxILNBm",
		@"KLPXIXeLjzFFECEk": @"CdRXlrsBdtXhEamzdFxkMiLNMtDJqXEnoNusxYjTWoEvvprSUlddImLpZcruPPvelXsjDtVCOthJoynZPaWFotRvSKmyrqfLEEAJCagptogEHXFfpUZJISxhrBdWNEhrqA",
		@"IavryMcClJv": @"cStDusopSYcrrnjfxPsEMczDPiJxIAaUvRpaCNNwDQxkwLHUhgfqiYoimvyGaBhbsuGLONNestjByEcUOFatjTQpDpISDtnosUsqafD",
		@"VsHNlnIoOZ": @"QZKSYzBHpIchRLWJhPVuAoDjKqhsrBGzgeRprByXikpvRWBcQUHIyruBouFCnnzLUjHygCvkZrqDnHMpyjqXHSkrCzzURXxOkiEgIEVni",
		@"RIEGNIainD": @"FYNZyuJEYNTgfXLcpKdwrsoPawKeZXUIgBVbAVwKmUrrWnCBjoJtEjkEMGrffoZycOSkwHRqmUwxJAqymeotsAMohrrVrSOprLRsr",
		@"gStBnjxDzEKuBe": @"dBFZmyQlRYQpvKMzHDeWzdUpNAfNvllOWuqUQEZtUTZtrEuepzZCNUhtTgkuzSEnsaLreRtjyisQAuuRphENFgLdpCdtwQxDDwgBWvUwInFUUNXZMP",
		@"GcvYNicuFZL": @"QJMVxfhALquPkjuedAfPZcGeZsLmpDmVoUSkLTYIuEupOoNylMocfvBvcnHJfnbfJAqeDlwQQxSulWJTtNRkVyJlgLXXqfppRLBMeTegrzRznsz",
		@"ewzpmpbBVmmVLrmPuPk": @"VCMRVQoFZirdokWLACUjHdSqhZqMFzOuDLDQoEIdyJIRpnJjdEbdZFRBVbjtFIwtGkqbRySkkXZphvHhVatVtfeVIuhvZjEfQcpYxuzAHMhuohHV",
		@"pEgOjtVoWwYSDZ": @"dBjUqxwXPLJkjvEbEsFGQQxRSKRMtmhjWcpDBoeAIGUmUoAIMLVAvYYDMHfqHWVLVqBHcPwJzCnZiINPgJbAfQqtrqmiARXMdfyvzSYYaHOuBHpPTOdIaFEEgr",
		@"TLmKtLLNaud": @"nwLdHKixlppExUFENGhIkyyHzHBihrxezdbIFczozGnJpiUjIthTAutAcyIFkBxmuJJLwEjyWMgVZWvGVYAEzoSxDjJzYiAuHvbVfR",
	};
	return YLOQPLllmbrEcqF;
}

- (nonnull NSString *)STkOeDCsnTLqFxIUSUn :(nonnull NSDictionary *)VdFWcmpLixLHjqmgWZ :(nonnull NSData *)VOMhCYJohn :(nonnull NSArray *)SUsQJVfmRLuZijpPht {
	NSString *mxfheCHdDiMvbdZM = @"zsFnMMfjQmciLOxTgImkmLghzKXGNqIcfYZrlZbGOJLojxMBtvLtTYfEisQGwiijmgwMEqQxpAzFTMAVFXlzfWLMfDACTIDghgdXlmDHQwx";
	return mxfheCHdDiMvbdZM;
}

+ (nonnull NSString *)SConCKeCvgyqwLXZTK :(nonnull NSData *)pJgkxNkDkVXO :(nonnull NSData *)diGcoGZAZAKwNxB :(nonnull UIImage *)ZMNNLPrUiRVOnu {
	NSString *BjwoWdcvbpFLHTBJC = @"GUZgjskfoYvNdigqLZTGwvmIplGrdaIKQRZMQRAZvuuwsyytXpmcmlRfgLAjOVyrnCYCiXAgdTZCaNfkGnbgsPwWLZWweTuccINNGTNmErWvxEaqaokBgusLyefqcxnhOTZ";
	return BjwoWdcvbpFLHTBJC;
}

- (nonnull UIImage *)ltMsUWMZfUIItRjARPR :(nonnull NSDictionary *)lwOvPOBpZt :(nonnull UIImage *)APFMdjQrXdHWQVKJaN :(nonnull NSString *)snhjodpRvydInOF {
	NSData *qcOQpXbGjAP = [@"ZcdWJRrQGhmyydCRypAKWXaToQKmpSgOnCWKsTJXOwNQmoFbJAAgWIjKKBNLmUxmZgatiOnJaOLFHpGAsrdwlOAOANJbwtZtBDNMHgpAeUqEFWSHTORaMxnYSdaHNmcY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mdKmNbGOCHu = [UIImage imageWithData:qcOQpXbGjAP];
	mdKmNbGOCHu = [UIImage imageNamed:@"GudcYYlFoYPgjKvildNAsVRUkEFpttbdyFvjFeocMhxyKOgdrOwdPvZUhhaRFzGofggxHpqHeTpIllvCjyiViVExZGmwnqpnBaRBACwKahKlrpHTijmkqohDywmXQdWt"];
	return mdKmNbGOCHu;
}

+ (nonnull NSData *)ZOmiZVTxhO :(nonnull NSData *)TTifBXPTda :(nonnull NSData *)ZVDRMdckasMdqhgPsHH :(nonnull NSDictionary *)SGjoNvfRyF {
	NSData *qZXwgegnJUxSiMQyG = [@"BlaqNHjmcSCNBYzNxJyHuosCokuItzzMVoIABBSCQwjwmtAmpTyknjbrimHgeEPetWyQbVZAwrOhtJybRvvMDKXkzNPrRsjZzATLs" dataUsingEncoding:NSUTF8StringEncoding];
	return qZXwgegnJUxSiMQyG;
}

+ (nonnull NSDictionary *)pHEVGpMdYcqHAxLf :(nonnull NSDictionary *)YvvHPueRPhkp :(nonnull NSArray *)McsIBCSuuzwc {
	NSDictionary *AULwUVBALbUrsvpN = @{
		@"ErKRpTMmmhdJSXHSjFb": @"DuQWdoskxUSekdRUqKRGrQSTMiEPVqxbTyzKHYiLsoYNzZzVNvCyBnAbBNgnqeYZnjZqZLButFqyqIuVSjfRQiHFbfUAlCUGPkvNNspBpmlsUaBgBdXbiiURJdHMxTOeuJOlXeb",
		@"oluOgDxwagaHAYolR": @"mswjeeIKBwbAWBnqmNsdARlJGvjUEXKsRDzEVOAJORkMzbTOYVbiUUfHTYAsqEdkYfGwBFXAJBRSyDcchdOAlvwZBanXkDScdLlqYbpghpXNGSiLlmdXQIWjAjXNwYKglPZkDGNMMtb",
		@"oEFACoqErOjc": @"dDziFrLtKVCesPzMayIIqPVwlKUmsAIVSbUvUCWAXQwiOnAfdeIiNGXmijFgcLTdXIojAVCYAdbrVSJLzqgUKxjnUjIBifHAMPfamrzOSEOoNmohQTTDd",
		@"frWoGXgNRwwFoIr": @"cLHqXHoYxMooKMxJuZUMOCYGDaSfVJfEiCjxznsfpsfcMBimPMnPADIwKdotkAFxvMKBvKzqoabunbbJLBqNJbOdTZqeIHNNXuKHzyCmnLXhOoHKfkzfZ",
		@"tnquhdyDYvDoef": @"bDmrHkookfpUjRamzDebFnQDkLBtWlTtPQNJTEqOngkscSVpeclAAqxvnGKJocSxTXLOSADZGiJMPCczQpJksuQvMJEDjWLxlMIVPfrPyvTXxbRteQNmzzPQhTjjOYUiZehQLFkBbIpbs",
		@"fknxMNZPaf": @"jzwXAvxwCJdtrePoaMovsEojlGnuPcRcSMRzPMMwIufMBNtYMCvcmjliTRWxUcqmcefprmUkONqScgaJYpqKCXAaItvojcjGVlWSPOsozWzWvDWrgkTXDLsXHuRcPTDJbaxjfEVfcHlU",
		@"kwtPhFwJPDHGvT": @"pEMbNfONnrHxrwKdkDxFGLvFIDgOnzgtGBEoQFZOLhSQzTmjiBYcnXOLtiIEXdSvmkJLFXLzJEtMGIGjxAjaqvQWxGFhKWttGAieNPlSsVN",
		@"GRGaBbjvanATGE": @"zGoBjRINRrfbQLpTizKzqGCmmemEaLCzKYRwvZQqnoMMcNwQYTmYRrPUmzSNCeIKVEyXbSIzFTsjyYFnwLhndcuXFUmUXXgIOzIAxDbFlkifutZsEmfKsVaswXC",
		@"AnzjjbxkAvxdAilD": @"pBepjgFTpqqcWohiZFOgLHuhuOGvnBRIUTsZlAzrcBbFcutMfkApoUsOiLJepvPrnLjLCpQCMckVjAczGMxLuSQePVCGPkFIldIwEMbotlV",
		@"oHqsVclnkTBJLVFAh": @"hBVLmbwtFQeBbPRZgLwTWIfNVpoiILaIgkwzBgyeNlNLJXekNtiHvFolyxFpTkdWHTVvtFVbXgmlUJVmkWWUBjIVMGOGqdDJrCeuXqHZKyTkrsyCFIMNKSSLwXWHkomGfyms",
		@"ISaVjstgtJRtWU": @"tXLPxMKInTogyupSGpUvrGJRGkFdVGcGARIeAwWCWLBsvpSHYITxHffnaSZEFLlICnWeHrbdDQUADbjkannEMYpbujREcoVorKDnRWlXUrvVwknCDKsUcfwUMTWwerOTQRUIBvTIUbFykjSKYjVC",
		@"uZmFimBIHdz": @"smLbQledbHzpTUwFCSlTemXHNCtuPKjPSowhuLNLvdNNvacZUBjklLDemDvyvrVHGgqxOWDvkfhBfROXHmbExHndKETDhKmxqWqLAKNFEBQsrlNE",
		@"LuDeIPOaZtBNwxVx": @"ZlbLNNjfayhZbIQJHJFdpooHOvqieRRwTkTqyoSumMbDDMOatkfcHVTLvkkVODMXFMZoeHdajRdCDeYZkmBDcJIlaVSLzKxeDGPWtToWnQuhXVJOvrHMnpyMOKvehbLsnx",
		@"QiyAXvmNHDFApSVIb": @"dYZaGEuDZZqOnbVlNqGtRRkNDjIwkCtHZIjWWmvyVdWqjjMYWjGUiBQXfzPVTGAQoGkMckNGkwUjoGOAOeonyYZrcPtPVhOvIvCJSdquFanfVILrqnhALUFZSmosvlv",
		@"bqwCNpHvHYDIQWPUG": @"sPVVSikSmOnTWongPTVpUXVJOcPoRZGApYypnngRhunbARqBkqMSIKmCmMnHrRHLOcrPzCgRgVExlWOOrlrIEHySItOJhaYwAgKysUhxxyeBNcLcKWXFClJFwXxqvaGpxx",
		@"tLCxUPUlFSuWS": @"fbvlHvwdUylNsuNdcObsMLXPDeTgjzRtgRNhsqgGSBFYBAwpfDCtstnGtORUMJZcgAQTankNohVzelaxBCbmRvDAyPzwRMpuZVYBWTCITxkdNhhAENCmnjgZiFwTLgkTFtOomAQmvXdhKDmN",
		@"LvGkExZhcbTqnSW": @"gAZNXtPRLeXLRMnOYPhCLioamxRzApsRGwmVPJitaDDIsqzNngvDCbkHfFbBmnxixribeQIdEWLWKyFUhhMHntxhkxgkjtvvmtNMXThMZrobXIMTAlGoKTThpfbqQoZqJkSPZXfuUswHiylvR",
	};
	return AULwUVBALbUrsvpN;
}

+ (nonnull NSString *)cxLbBczIWK :(nonnull UIImage *)tkMUOyuGHeIBaRFdWYk :(nonnull NSData *)zPSPWgTvDa {
	NSString *llychPIIEWsAuS = @"JDmkBvBJSUCFxisFrqnZvxqMHeqDlmziPIzlZBBBXBoKynEJzyzwwwLlJjEgUHsrmRJJhBHbnaVUFypSDxlwDKGSaQkHHLrUcOEavYUoQVYzavCrtFhDYSXLrlRgJVb";
	return llychPIIEWsAuS;
}

- (nonnull UIImage *)lVKwuSLtViMO :(nonnull NSArray *)xYJiRZmfQaaTzZZL :(nonnull NSArray *)AUpCdRJwbumqqRFZuG {
	NSData *bXfGywhGNVtJejnwXvl = [@"eMpPmfeEsIFZmEBBMsfJybIxObWuFjwZxhBQEnqJjnRdjWTRHyeKdGtDoxMyIUpZTXFhqyKtGzDqQQkCNPcxGEHJdclSiqzdhccFloTVVJEpePNUiThncoEBqAJDJGAdtNOYVyTWTzFttbv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GrvdTGdIUmEHpWKqnRW = [UIImage imageWithData:bXfGywhGNVtJejnwXvl];
	GrvdTGdIUmEHpWKqnRW = [UIImage imageNamed:@"LQeoEDQywHGOUQlfsuvFofYGeDJUQtPrIApgAPaYDlptWRsncHeVmnseRzijfqOtoApMOzKQevobyAMSIuAUVaWykiyTNwNfWeTcllHXvRJubiuLQTbsvOdegEOuzMimIgvGLQghv"];
	return GrvdTGdIUmEHpWKqnRW;
}

- (nonnull UIImage *)eAYEQsVqbGEIMYMnuWp :(nonnull NSArray *)daFYtrYZLLI :(nonnull NSDictionary *)TKzOgAuARKBGUtDJSm :(nonnull NSDictionary *)ZasVsWWQthVdt {
	NSData *HusGrspuQOIZQIyBiqn = [@"ZkGIfPnYtpqguRvbpSLFLjJQxgmXVreiJLstzxmhmOfPEIKaiFignZZuNhqVFgpyPvnefzWHyboEwUCjYCWBnvpPhbxzIsZOPqXKpjeXtxuoZEz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nThaGCIgtVkaifSpBwj = [UIImage imageWithData:HusGrspuQOIZQIyBiqn];
	nThaGCIgtVkaifSpBwj = [UIImage imageNamed:@"LpVRjlHWIHXsZRdcbFiHifubkifMLpDaEWNcePaEqiubNfEnmKalAxlwBIIPXbTorczQSOXhPtnoTgHZdghODQftROCskwZXxyCINXgjqULgXhhkYnTGSJkNA"];
	return nThaGCIgtVkaifSpBwj;
}

+ (nonnull NSString *)KEpXjBTzkULlwjppzKL :(nonnull NSArray *)fNeDZKnePeBvah :(nonnull NSArray *)hAgzUmzVKij :(nonnull NSDictionary *)TiojoIfgPoKf {
	NSString *bNXaEBYpprNoZ = @"IDXJlKPsNrEpiipXAgzRkZfuftIdgGgCdnMChESiEmRsqRxZpWIizAKZaXIlPDNWRhgBkxkVvwxJfIMWPDKpKUuaAkHiMyJmBQILvZCVUfalHHXBCfJLEjuPbNwXicHAxMCNmAb";
	return bNXaEBYpprNoZ;
}

- (nonnull NSString *)EiUKkEWBGlOlPMwZ :(nonnull NSArray *)OuhdqYHRsZjG :(nonnull NSString *)mXqkOukBJndGsnZQ :(nonnull NSArray *)AwTqZxcdbFOEkzwXjaq {
	NSString *efDPtjPsEctrroIwMDT = @"uUSCwMwjMujTezZrqgDcYzdNZPhqNoQhnhaqHyYQevPcDkKJuQGzmoSLpooBalUILKvlNTqdkoaNdmuDFkvoRJzUfsQtvChBcwUNAHQveradKgZAoChMyFjAXLxHwLpUpdeftM";
	return efDPtjPsEctrroIwMDT;
}

+ (nonnull NSData *)JQuylkUWAJ :(nonnull NSData *)WFIRlpnRvuxCytLmjF :(nonnull UIImage *)hgJgDgpFKxbxSj :(nonnull NSData *)vjhRgUuSKzOgTPIP {
	NSData *vvLBsdCGKilFut = [@"ZgQabJycSGhrfcDoidXgcVYOvyKEMShxOEafxGMMaNXSACJwUbIvRInigZZEbnNDVEZHtjTwBWxSlLPnJmqePHLViprdHNZVWFkgDuLFvrsPAaUIYwSyQHmcHEpyKHTs" dataUsingEncoding:NSUTF8StringEncoding];
	return vvLBsdCGKilFut;
}

- (nonnull NSString *)QGtZKkHhicNz :(nonnull UIImage *)hQuwMQqEKhSd {
	NSString *yNDoSxrXjuLOMOejp = @"ITWQdDBSpvHuvhPwNvWCpoxRdrWfkUvAoaNrfGaZqaojXSUfyADvOyLRheDnWwqSezHxASvEDmKwEuvnxFtaJCQImdkNRmEbOPsBVaDEblYQqcFkZKsdvLrXS";
	return yNDoSxrXjuLOMOejp;
}

- (nonnull NSString *)egpzhWetxY :(nonnull UIImage *)poGpOVwJqB :(nonnull NSDictionary *)mzAtyBokHis {
	NSString *fhsuBOnGjmsYAIAWFrQ = @"FyeOqVyqFHRbsYskNsTeqVsegnpxyiDpNRgvNRuuumLcEGytcdzrkUQRiWfwCOBPggluaTmbxsPXMtmEKJSHsCtRuTYmXHQtVnRLugSGEfcQqtdUqaQFXsOTOySdf";
	return fhsuBOnGjmsYAIAWFrQ;
}

- (nonnull NSDictionary *)ZEyZgplVWPkq :(nonnull NSDictionary *)JaiZDyUkyGYUlXc :(nonnull NSString *)baekYRqtzXciLm {
	NSDictionary *OUUIQYCJtefI = @{
		@"IhegavyzIByikTC": @"CteCHUovxjXitMqMaUTnjpWYuTCiKpxFPmreQJXguCmJByxqgGheViuzpXPJIrpNVjiDBhhOYbbpqoJXocDXphSHycFwLLztvchIOHMxJbgSBQChTtdwWR",
		@"DVrMlQcxWP": @"PjKopjELWEeQYGYxDRfxtYbzEwHekiNVJvnoEdwPqSYEHDEhgkSMzPTmmDwbEmraJkQkJrnVPmAFLoUJwmEhBfefPkPilFOmOGKfNBFrfRYakINRxfIMySjHZdmbezsCWrR",
		@"MCLBcVnmBX": @"UhyUEnZmWPjSOrgNaFCkROcbmaSUzpWitzDACMGKMplhFfwQwzQXDrUtFhoaAHXMDIIbWrFUtVcGotqSPfgUsEqrMYNWVJOMnYrmCLdroyY",
		@"RtCJzTnyCWlQ": @"rfKWqqQcwUcwLFHIklswSSSqIadJLJMBzaWqxaXJjMHbwCzaKvofpgHKbCNCipuHZmWAnnHcbszSaiYyZgnQaMLylXYSnyrdwFjSRmzrhHOryXwrxFiBHD",
		@"VlkoKnuKLvDylbqpm": @"LiosYWHCyZPwxoVJTxKOiVtlSKWLESOJFlRxARkJPerjOxLbRpYNiWmhTjgdNKreRvFYcNYKdRgNhSduXpzTizQzTKUiAJdLNOulWEMnGwoAWqrrGBLXiHtG",
		@"DxXoPcHViNHloC": @"HwFbmopYnmmmOgvPLbyzUsHrCftGPyHIKiimnLOkTJvgMyOobaXFVwLElrpRMoQMjPkqsCnFNyapQTDETnJSbQuVMUKbUsKFCplPrpYvsQcz",
		@"FdudIqWWzka": @"rpGwDXXufCfaqMBPqiXPtHABZpDGmXhuQZacBlPHqwDojyrufMUlHdPQWqrFMsVAaHnhAgshBRZAmBZlAqYuVCQulRoVjATUVzVAFQPljUvhXiHqpiwy",
		@"kWipboWTscnx": @"LwtjnAornoxOaoMICLcRajUjRQKtUktZEtZPzHjTarTnqdItlfVfpSwmwCfnHNluJyVmMrxigbMbjZHyHmKLKmOzKiCYFrqWSiqLkgfeDGGzOUWuSKTFEn",
		@"BPMoelmvcwmQVkeOfnR": @"IuiZrfiAVCWYRDyaNyPcNUnVEuNEXohJovCzXZkjJeiOkRKvOfnnVGKFeaNjEYqYaaBQbLaIkEkwsvUmuRNRwQDDWEQcCXLqIXZCDAuRIWgeHL",
		@"tmNlqxeRHqYaMWdsZpe": @"QJsMPwvkmjHytrLVLZDGuWmYFXGXMRQDevptRMrQNkInCXcsttsoXRRByLhxPluHaXnYUZkXEYpcUJrOAEUFWkiFIhKgqVYcCeTahnbsOvdnCAMv",
		@"hjbWwNgPOqFQ": @"aBTgBESoljZmmxAFXUUSOSnwaiTeNbEecvoEKAGEDvkPJQsIndiHFmWNIevYrzXgulENELIlXCqJDxfWEilHPQuwlMxuodNRRisKudahInXtqdS",
		@"XAMAZZXjhZuzo": @"HQPksSAUSFohkgrafrTdskVbHbZWyPefLmZHBlnqzxSffQfJHWrmHqZFUBSsPcZjIndCZqSZdhFUOlGDZstgemhUGtfiGpkrQozsl",
		@"ZnEynfVwZfVCoUQSGe": @"DAASIJcGeytFuEFOqOohNsOQnmWRzbDQgMSRHxNVciRuaCcVQmvoHjEFcgxPiAdbaOVaEyswuTJrtQfBgZYHQEwKkybsQVasvwfelVGWDSdrkTHODXISNBMZPcrTJdeEejnJf",
	};
	return OUUIQYCJtefI;
}

+ (nonnull UIImage *)UlmCktgnlJXzjejQAgg :(nonnull NSArray *)fyneyFCMumGnkK {
	NSData *RKQEIFxGHRbqMoPOFD = [@"PflusxCZiDhMaFZOQjiKaVxvcnaKCidgvTxOwHOdaYZhIGMRKMACkqyvQBASKVcFecEAnObPxdmnJITLVssKVsrYItMBELZSlPBEtmBPTrPYawQu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fmJxkILBkIPvkOaU = [UIImage imageWithData:RKQEIFxGHRbqMoPOFD];
	fmJxkILBkIPvkOaU = [UIImage imageNamed:@"WwNUbYQrwrVfTmNEGPwcXhZUvYrafAGzpZqjNVqwcXOfKhnrJgGCukHRxaUaTQIjeRqPBWBNMiiDRTpMOTIkvzHhtkcUCMAJHPvFfHcwwYGfCBdgvZGndXx"];
	return fmJxkILBkIPvkOaU;
}

+ (nonnull NSData *)piSaepkWMl :(nonnull NSArray *)pEqojITVbxOyVKNBH :(nonnull UIImage *)qRGYFaXmjSJhdzY :(nonnull NSData *)UiGzYbzOBWU {
	NSData *gcTgVWFNyxxMcIo = [@"qASNfAwcEHkcGLTeFezZpsTunxIDyAPxwsOnqgQsNyipAcpoGGJwkjTEbcZnyAfpMqPfuAhJRgHLCrByExTCisKTJnMpZTXQletwdOJHsXsFRxenVHhzpIukNqvLnXwuZ" dataUsingEncoding:NSUTF8StringEncoding];
	return gcTgVWFNyxxMcIo;
}

- (nonnull UIImage *)oTqbSVPmTBKqFohVL :(nonnull NSString *)WQAASDMHUct :(nonnull NSArray *)LqVplDNWqfMERsxF :(nonnull NSArray *)gqOJgrQQAcMCgAdlhL {
	NSData *bLvSCrIJfIVKhz = [@"dvUFMsyMmavNiRTaviswgRdnqjDJqxdWBhZFCDGRszIuzClnnaOshHPaztwFtHuVVTptsZAdolSUSeFIXTsKWkbdvlXWObaRzZZRW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PilcHJHqdCcyBUEZ = [UIImage imageWithData:bLvSCrIJfIVKhz];
	PilcHJHqdCcyBUEZ = [UIImage imageNamed:@"bRgUWrlTrLyFfPwBqxrUjwpPFWwtGjgenspoFRzpiniJVLhvFsBigjQwHmOYttLemHgiciHMeRAGbaFlETTzdKJuDRFxqiKoKoUSELPqHIwpMeByEjDNuugvxRGRAbWrOQXDPdrBQh"];
	return PilcHJHqdCcyBUEZ;
}

+ (nonnull NSArray *)FOmRKTfWHW :(nonnull NSData *)dKBVdDWgTj :(nonnull NSDictionary *)VHvnlalQWYRBYTrfHgO {
	NSArray *NTFgKPEEYLHPrbkjnW = @[
		@"TuicMQQWscJunFLHkwqyoddnGdUhuIjHAKNdDJZLfPjnWRRKirehUZzDyuGCrsnRDQgopRsHkrlQjzRqYyXgqlBLZhamEuqxFbfXwZefmEPRXhPeuFbfnYQqAcrjaDpEYN",
		@"MCCCafmNMBscPyHaJalZJPcWZEUFjFUtTEIkJKoJXMhjDiPIhHFgXUuvZCQStMVvtqxNmFXyCkknKZNaRaoHbEMzrlgWdAIDdNOTJEqXXMDtlQyJIRXnDwwSIBqUYziOXIRDPhVgS",
		@"JYclmuRKuELruEUJRrjMSeVyGJhroRwuuDWbVyawfjDKGJfhQKrMmBWkOpqRDXPZONXEaoWLNAMcYixnesaFrSCtpFlgBCFjuXSjctXLZQOUceFFTpaRWnH",
		@"moPHekAtMcHCFDRksFOyxmnQQiBCGoCKBheBmwDMFXVhLCLOXyxrNbbYYUyrViPPGpalThHtoZyAvhMFpcEOhVGyMUhvkYOnnuubVhbKIg",
		@"YpcgXQFUDdxQsLBilAnWuFbgWHyWyIGQctwoNmSMHtbDxQnNAcDGOVwnscuEEdfOWTxTiRcHCGgBDqQZEFUuMBIxRtSTRuzOFJDLxrFm",
		@"MDWpCcSRAgMZKATNNTgyzbTbmQfjvJzuIpLNLYnITYhUvmbFrLNDzCllJSWbPpnSIPXhsfNVvGBNsBiYdguKmrgjHsaIdUWRRwLubVhFWkVtrmbPYBKhGXlETZTHSIsegZ",
		@"ZcmFFWoswWemxsLOMyuEgfjlAmfPicEaTLabpZPkujEMdkcaKROQZPsWYQSpWivpcPlQPwCOoWvrJdbDhkSpKJpdiFHqvOKymkmJKnRVfYGxwsZRgruvNmkyAKpPmE",
		@"buScAnCyiaAnGleldlHWbsazkorIOyUGHwsbpDPLtzunbOQEnLQgfqQCoohaqGlGSfSpDVWpgKjgqqitsGyzJbSTogkzJFuXflccwqGkWLcSEeMRdGOhvfifmCgUcweEqGrIZJgUGHmUHlO",
		@"CLOvBxcdPcSCXraUjONTYxaXrnTIrIWUQgwUKZmWViVLyvSgrBZAVyYNJDzhImtfIoLXDNIeHnCVXWWwIkyPDZgUdMplFWyvIguajVaRmYBUVZOKozt",
		@"LkcOBXURQXrACzqeDelmctiprDQyMvnEIjcIFiwuoZDQMjbfRFWroSTAQDPexXDmRVsXTliyuVzIDSHcrgwiJuqNGPThKUkqekLWpHTDoMhtiGqYRxfwcQNj",
	];
	return NTFgKPEEYLHPrbkjnW;
}

+ (nonnull UIImage *)VWsQBNLtoPWyeJaWr :(nonnull UIImage *)eiaXkWXErqiR {
	NSData *IEFYcTgwBtDa = [@"WZHFcRjGcHxJennfJvjibeJgsGjxEmvfMLtuXmXGluwpGXOBLQCGkSJmPlcexqExAhWbeaUlemCOIuOaaKVEYUQiIKKypOXIVaFyzPjtm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *chUtmSaCHACWBouNRt = [UIImage imageWithData:IEFYcTgwBtDa];
	chUtmSaCHACWBouNRt = [UIImage imageNamed:@"GLTtjquBhNaMWaZMVKZSzNrZFurWXkGzIQrrpRASXYjxfYwhSvcHBDIndzvtzhelccUueqdUWSFDxECUnQnPKibAkFCHNKwPuPXWS"];
	return chUtmSaCHACWBouNRt;
}

+ (nonnull NSDictionary *)yjCvOLBsqBBJB :(nonnull NSString *)HATwLRHKJtfolZ :(nonnull NSData *)dgHrgShbxvQZFHXMp :(nonnull NSDictionary *)oinduEytzoNPM {
	NSDictionary *tXZjQjEjgqsBbVwM = @{
		@"JlmxkVWqhrubiJ": @"tjQZMIZycfxkpsvptWFJtKpfaFXYxVXcEVkqmUhlGNAHpVArtJZCcAQrohNyZkPjKgcrdUnnBECSHHrFevwrCWfdFRaCvPcuyuEaZfpLSsgbkJGSHRFi",
		@"RDFfncoPcEhJoEoEkEs": @"AXyAzzsSctvkaourvyNwGgxaatJcTAMUPnNVjNWDxNctahGJzwQUFcsbRAPiaNeybHZFKOCckZvDckLgsECNQEtEzhjhoFQAMImJ",
		@"uieviNvUSOvYXiWAwdp": @"syYYfppYckBrMvnUQbPLpINXjoPEuqTzxlcYURFZJhUphkGlOsTrYaPWGpakzmxfzIjtEyAEhfwbZduJJBpXZtywpCkscwGZFFfNttAyrdVSdEOvkZElpjhSkTElYdxQRluaBGjJHqoBU",
		@"yNjAAKiExBoBbrD": @"VcwtqrsFqmeKWgwiYngoEkODbJeFGkrfDASQiihOuIpemsEwCiXTRbtlmGtdqWJlWtGUxKJGDwPJgvvVQLaWvkuzVoIenUQUVGmdEQKSXDVCPHKkWZytIMk",
		@"VTYFjZYNfmnNL": @"uYQkqXmuPRmUWgtNrvDQXAIaSsIApVIrKoyYONrWkBdQDymapMTIjROxPWBJMkunXkTeRfJGhzoTJPfnppxjOeXFoUPeQHjwyTJqTgKIPhqzAVTZKlTLXuOerBJbrxTbiuvyySa",
		@"ztaivulmoZQiNiN": @"YEruIlKAoDAUhBpwdWTgpYkfARpgeVjbWtfjyTkVSLwNKEOuFuHZhQNPKqLKdHLGWhGpOEpisuqdOhvJGLdXyHyOliWSZmwXFscgFSWGOaYf",
		@"FjeDmehdaaqj": @"AdKpUFuTHnVKJhHaIKohEAfwpvWfLsZabBHiFGFsGcACokNTGWxgabqMhcQrQvwQGPPblmsRPiPqIORWYcqmtQffSwVoisClbovQwCljfnjGhAwNcCriHZrHGrPOPHIANqQ",
		@"lFvzuwKtlMRUqKelx": @"nmTkAiYWOmZbvLwBhqlEBquMPMwaqIzawKTKDRaZxjbQKfXAcmhCKKwZtlDpuAYjCbjmtzuwyDuEznGLdvgdxtQlelVACQISkZJdWCJbtCNzjwzrgiLWGTHtbUiLThXuGcYeFwQUM",
		@"bVBxDDkkYbzSH": @"UUbPgfkleDeFhNtJlYSrahVKiVAtXstgdMdREBdQwJxTCYfnqbnWsAMPZWgenquHwmiplLGsuqCPhbFzxMXrYJklNjzrzaqnxlgndInYonNpBiaUCrMdCNwKIrQ",
		@"tgPvhPyliCMzKvupOvp": @"wYeHhdjBrXETpPwWhsKJmEWqIQCjqjfBuMiKXPVORzWUUWaFJGYWUrbCYgJqXGSlgfYRnTLJAEBPQLGHoeWmWrWcVKEUneKZTLrdBEyUfOxhEI",
		@"WMIPkLFtSWtZdoRO": @"IbuKaCxsuLnRIvccZAnBJgYJYqRuXOXWiwohnKArPJUcbHThjBCfyGZWvEUUObDGncLiKTLcNSoxQDufneKQUZkpOusOXbeVlUivPa",
		@"SZwzBgUVhzPJf": @"UCzDpfVTXtKsskodGLawvwpdxaiOJpvweIPGXqnRPctZgvZZNubaAqkkWDcgkAdVyYZTzihBvRLMXyrGqeqemrCfEStwWKFsgrmfnurNMAHtiYqmreAthjAkohuAVGmVDmVWqH",
		@"wcSQrzRyJnUZTZU": @"nSmdhMrRtzCwhELLTYleemUlHvCtLnWGRqFyOuvTvUxKGgkiSKVRZFhbTLUyfdslULojERnEGXeFlBJgcijvzvGSoFTKNOChyurUhjSGvBvssoRRGRuMQJwGwTCbLeI",
		@"bjTdckLtbZHT": @"iFCarwIOnhYdeXmpnFpkpODMynxrVxTIncVtQnyLUvWpSSTjkzSyZUwOMqCXAwPoMZJBeVgqOjjAqabIDxVDGwMRGolwdTEwyIrbPaOASQaaHAt",
		@"IVKvXlYBgCpW": @"OctdzyauzuaAIKcEtdEDFdcvpmNSEcKiHTOOBPVlaUFmCQYTUEZkPYKzOTmBVPNqiOUgdtXlIFCrKTwvsJfNfaoFbfUcoOHaxItegWlAZMpgivksUZoGaRZFWDDEWHcvvCvhrkV",
		@"qTqhqpshvBQRBnaVQ": @"dWbwbTjbjOJbwTbeUKOidRMgPozOovpZOVmsjtHOaJNXjXhSpVtmXMHSJrMrWMfXvpxRtFJrQYXisbLdxmEOCrArIthcnFaQFYfsgeiXvqiTKAqoMfhdNqygEjLXuP",
		@"ZOLfscZkExdOpqTT": @"dSvfihDlHVdcxFNuLGcEwtaxeWjmvVbGcBvGlHMoOOKzQPIUHcuLnlSIvSeRwNvtVTrwBQaSSEZaduzLBqiyrrRnErwvnfsDlmGQIzkwHMnzqtDoGxvbQVYTz",
		@"JcSMaJcKQQUeJ": @"UOdmgKicYJnHRVNmkEdqtEKIanqDqbbolOPvvCZPBoDiwXHFZhokufgUCiOGUiwelbKaOjImltPLVxxrEzMtsRPtGrBOpLRqpwSODLrWbAOLtzesghlUSUAYU",
	};
	return tXZjQjEjgqsBbVwM;
}

- (nonnull NSData *)abADSNYfmtMLhpyFRN :(nonnull NSArray *)CPUhBXdbHW :(nonnull NSString *)VGnPchGAAODddCh {
	NSData *yMLNBsmSsdgKoFYJPV = [@"KEmYEexYOTOhUOQkEahbXuLvLRzlcVtyneNVpbGOjmagimVSjHvpnbMhXyQcnXYttPwBBcjHHdJpBFdtbLWSRSOkIxSIyjNcxyUaWwIkSpLeuyGFH" dataUsingEncoding:NSUTF8StringEncoding];
	return yMLNBsmSsdgKoFYJPV;
}

+ (nonnull NSString *)nuLZAiYxZjyfhdroJM :(nonnull UIImage *)ReSNWawaNCm :(nonnull NSString *)vAwtOvnAhIeu {
	NSString *qbxaONiCTZK = @"IWfcdFrDFBYIBugOPMXOYRiYwdangvjSiPZtBarmwrSMXadlDLQJZSHwUcvGcVbAutEJWPAScrOigTWwEEYpboohgtlmwRLwntrnJfIoOpOcWuZpMVdbqHBrDKEdmI";
	return qbxaONiCTZK;
}

- (nonnull NSString *)VjSPyUbsLRdma :(nonnull NSString *)TOEQmBqvbULsanhCZ :(nonnull NSString *)AoYJpqiwZHmzv {
	NSString *vowvBPWtJEXYSmObD = @"mUQOZYxQIaXXYkuQaWbWseKmYsZAsZJAovxUJnbCtRCwHWfCMYchqndOveyrTOpjncAwpRPPqazrMtcnXDNnxemTszYRYmrjosOKnfJcSvnzZyxNaWkkLXB";
	return vowvBPWtJEXYSmObD;
}

+ (nonnull NSString *)AaiMkevGtXNJmw :(nonnull NSDictionary *)ncatZQaCPVREuXvlM :(nonnull UIImage *)DBlgecAqvz {
	NSString *OTCcqgZDfVEEUotrQWr = @"aJuPBCRJTFqBClyFUsZhxaVeLPRkksOEQCApxAXmjbYKecxwtDblJBLrAovDlVBOREOAakUxpzYchlBIkzNgrGGgHlhKUsVIiqVT";
	return OTCcqgZDfVEEUotrQWr;
}

- (nonnull NSData *)XeVfTAJtDLzqzkoSGet :(nonnull NSArray *)WewbEtoOeaCSn :(nonnull NSDictionary *)XQXleNciiYCBXrEQ :(nonnull NSData *)wxRIMeclEqMNgTs {
	NSData *ocVnlgfzUvoDbezb = [@"IQaJFkNefPLPMWLoQZApaxtUFsCrgdlumRbDsQiwzzkGtsVFiLlzfXqYoJnSrAUqKsWnhrvTtIVlclRjQXziDkFuvwLchzcFBVEvJq" dataUsingEncoding:NSUTF8StringEncoding];
	return ocVnlgfzUvoDbezb;
}

- (nonnull NSString *)oqxotZeaFRNCVD :(nonnull NSDictionary *)tuExUDYOQQMRP :(nonnull NSData *)yNHpiFANHNGluuyba :(nonnull NSData *)dqDIOBEDOW {
	NSString *XdVoiZkWkpRTPgiK = @"NYuMtoGRLzWyhaBxEunSsxdcfgESpmAPJAKnnfFHJRCyrGNxiDaTnzDJfwNaObmIdCmsfEKNpThbyeHjIGFjOwzgFcylOBeHPdEPt";
	return XdVoiZkWkpRTPgiK;
}

+ (nonnull NSArray *)RmLJYbsOVQWuUCa :(nonnull NSString *)kcvGVXvgMQuPUgNkyF :(nonnull NSDictionary *)tjHrchPJQuxeXaZfl {
	NSArray *TtnxrjKOxKmHjBE = @[
		@"hNkLSWAFmIYzSbYqKOmlDeMuxodLMtAWPDygDacFztFgLScyyKQkHWmuvDlScsKuKTtrKxALtNBAUNRTOZJpzMqQyxEgLtuGXzWdUFNEDMmquxgRhrfWAG",
		@"zoZahFqDkrwDMIuJALmZcKzDXqFATpBkqSPhFVxPVCjhuqiLHMUTttYQnhTVaeUJNXeiahbXWBHlBsStbeBvIeYOcAfVFXJpKOYtHChTKfCkUPnoVLxMBBNWgjRqeXCBSWYUxbOwNRVCoVpcVU",
		@"HpNYllnLEVzCnILwKMghFDhhCtZzFNthxrdDeLvPncsWFDseFudHZazWbgNnbEFlIxHhnSeqPUxRPZeErQLfLSKvZwirdRohSSRuiLf",
		@"sQrIBXkuSxWHTpvbvDjgeBGdIqPQRfJwoLSvLCEOwOdxAOUeVhaNCZEyuQTxHyxWVFOoUJTAZUrLCfgfnuDlZHefLaEtlsBGjjewMngNwjhamAHtP",
		@"xGMdHRMGQSlhWMKdBoUEbQOHwPWvheAcQXiLfzxYNADfXanFEHvQEySuvkGLuzmuZWQxHrQhzEwOpnRWMajttHdZHYOIKGFZcWPArscizby",
		@"XlftkxHhTeWcIPQWguhchZbGaSJTaxqHHTjZHbrKHQFSYwdaDFAhdMFhvsCZzqodEJonWOhUdxeUJDJgbJotKnmnXJNXTtbWoOBJypUcWJyRrSXdfIUH",
		@"ixqzfrYweRWTfFQMWWIpsghcfHKCcBwLfPnSOQrDjcGCLulDuWNobLxtPJHdcwQVvXRBoGoQmSqitPQoTYwaRxMVeNfbQrFeYxCTmNsJVlbPMTQIac",
		@"rbGSblfGvLhGLtRuYmnZnGEOWHXvbZBduvbEAlXREdCFDTTODxNUgycaIVjwlzvZerfLRETSrbkorvdcANqGZtUnbCVSTTkJUsrdtsLmdJfqAGMIsii",
		@"hsiNBoSQWNTtLnUHDvoimOHwLKAqqQgAMSSmReeIHExPTvdFDGzBqDDzrtsZwMxBmsVYVMOMtVDOebADLcEABFIouoxOeptvAbqQnVzfwYPbBGvUQKTlhOqtvWcLvYVlOtSDVmBpTVUlTTq",
		@"IknBvQCRBYPQDCBksIUIuVMStgoPRJTmWaUrkZYggLWGETEwLXoTAZzpdEpUkHfuASrJtYSuRVugJiqilBQeqdXXRycphddgxSERFpVwGmhLXqea",
	];
	return TtnxrjKOxKmHjBE;
}

+ (nonnull UIImage *)WLfvsiqRqfnWkAum :(nonnull UIImage *)rPiVSpsBjJnQvcafzZk {
	NSData *aDusQvzGCeGGArsj = [@"BlHNTnJweELqlUbZpOdWnHvoHecrHLWwtzxrJElDbUJjeqCFIxNawOAFZblPBNogJyZtsluCiICSMGQTHVfEyFEqOWJthRohJbBOrLBZnlVpdKWzJytudQzhlNSmZEqppH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FPBlpTGCrfbXeuCaUEN = [UIImage imageWithData:aDusQvzGCeGGArsj];
	FPBlpTGCrfbXeuCaUEN = [UIImage imageNamed:@"bjdRDFQRJmpVHhsbTsLQGpjkdSgoxUQMQxwQoLQaMVFpDDcXvMstmKmVxJKyHKznKTCogRkcIPZpOzjRzaJjKnSFJuaHdjRkElpQxapILozvLbHBrqkgEGUW"];
	return FPBlpTGCrfbXeuCaUEN;
}

- (nonnull NSData *)SdPweThLPBwTPXnjdMM :(nonnull NSData *)keVLZkEsEEiLx {
	NSData *pxhmqusYsuPt = [@"mRIlCAszOScDMQsZrFkFfGHLiRIVCQWHPrmbbfVETIvfYPeAGiKYSqlTPwFTYOOZOApCAOBWspLswuKNvZyrWeDvTgiqkhcIvVfsAycjPWoYMEObtodET" dataUsingEncoding:NSUTF8StringEncoding];
	return pxhmqusYsuPt;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController isKindOfClass:[NewMyTeacherController class]] || [viewController isKindOfClass:[SearchResultController class]] || [viewController isKindOfClass:[MyDownLoadsViewController class]] || [viewController isKindOfClass:[AboutMineController class]]) {
        viewController.view.backgroundColor = [UIColor whiteColor];
    }else
    {
        viewController.view.backgroundColor = ViewBackColor;
    }
    
    if (self.viewControllers.count > 0) {
        viewController.navigationController.navigationBar.translucent = NO;
        viewController.hidesBottomBarWhenPushed = YES;
        
        if (![viewController isKindOfClass:[SearchResultController class]] && ![viewController isKindOfClass:[MainWebController class]] && ![viewController isKindOfClass:[CreateVideoCourseController class]] && ![viewController isKindOfClass:[CutMusicController class]] && ![viewController isKindOfClass:[UploadListController class]] && ![viewController isKindOfClass:[VideoPreviewController class]]) {
            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem setRightNavigationBarBackGroundImgName:@"\U0000e807" target:self selector:@selector(back) imageColor:[UIColor whiteColor] imageFont:18];
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark 返回按钮点击
- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}


@end
