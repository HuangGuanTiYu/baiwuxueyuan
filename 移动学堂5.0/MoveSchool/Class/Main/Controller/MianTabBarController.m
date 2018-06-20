//
//  MianTabBarController.m
//  NewSchoolBus
//
//  Created by edz on 2017/8/8.
//  Copyright © 2017年 edz. All rights reserved.
//

#import "MianTabBarController.h"
#import "MainNavigationController.h"
#import "ManyLanguageMag.h"
#import "HomePageController.h"
#import "FindController.h"
#import "TBCityIconFont.h"
#import "MineController.h"
#import "StudyCircleController.h"
#import "MenusModelTool.h"
#import "MenusModel.h"
#import "HBTabBarView.h"
#import "ShareButton.h"
#import "MainWebController.h"
#import "ReleaseStudyController.h"

@interface MianTabBarController ()<HBTabBarViewDelegate, ReleaseStudyControllerDelegate>

// 中间加号 子菜单
@property (nonatomic, strong) NSArray *subMenus;

//遮罩
@property(strong, nonatomic) UIView *shareMaskView;

//分享模块
@property(nonatomic, strong) UIView *templateView;

@end

@implementation MianTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomePageController *homeVc = [[HomePageController alloc] init];
    [self addChildViewController:homeVc title:[ManyLanguageMag getHottabbarStrWith:@"首页"] normalImage:@"\U0000e618" selectedImage:@"\U0000e61d"];
    
    FindController *circleVc = [[FindController alloc] init];
    [self addChildViewController:circleVc title:[ManyLanguageMag getHottabbarStrWith:@"发现"] normalImage:@"\U0000e616" selectedImage:@"\U0000e617"];
    
    StudyCircleController *study = [[StudyCircleController alloc] init];
    [self addChildViewController:study title:[ManyLanguageMag getHottabbarStrWith:@"互动"] normalImage:@"\U0000e61e" selectedImage:@"\U0000e61f"];
    
    MineController *mineVc = [[MineController alloc] init];
    [self addChildViewController:mineVc title:[ManyLanguageMag getHottabbarStrWith:@"我的"] normalImage:@"\U0000e620" selectedImage:@"\U0000e622"];

    HBTabBarView *tabBar = [[HBTabBarView alloc] init];
    tabBar.hbDelegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"]; //KVC直接修改系统tabbar
}

- (void)addChildViewController:(UIViewController *)childController title : (NSString *)title normalImage : (NSString *)normalImage selectedImage : (NSString *)selectedImage
{
    childController.tabBarItem.image = [UIImage iconWithInfo:TBCityIconInfoMake(normalImage, 20, [UIColor redColor])];
    childController.title = title;
    UIImage *selected = [UIImage iconWithInfo:TBCityIconInfoMake(selectedImage, 20, MainColor)];
    // 声明：这张图片按照原始的样子显示出来，不要渲染成其他的颜色（比如说默认的蓝色）
    selected = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = selected;
    MainNavigationController *mainNav = [[MainNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:mainNav];
}

- (BOOL)shouldAutorotate
{
    return NO;
}


#pragma mark 全项目支持竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (nonnull NSDictionary *)efpLThdNmVa :(nonnull NSDictionary *)hdFXOFdxpFshyQ {
	NSDictionary *eaAnXnLShOjFVwbl = @{
		@"rZdbiFcPNOzrjb": @"qjpSGazjcRXpReCelkdMMkMryuFZLqTjCgvjkYseVVZXVSunBuAIrZPOLCAYmiMkIrmDiUBtOCtigqgxDtdpeAlQoRvbfovEPRtCKYQEc",
		@"iAeQloLqvCDAQxkR": @"kjSshaXnqINxjXJTgeMxtXLJwWKXGPvGGSJsXDqdiByurViokYIylebFzPlmjITkxIcGOKOgQVcLTrYsTdDhyCcHxUsiLtYFBxBlPwPCPNWHqcgnQyDVMcxMgzcGiLezlfsbfRcfcRiIvkG",
		@"fLUKVjgrMEuZPfx": @"IBEMjuZVxltHxMIUAKkUZuIgcEgORFHIzcdowZGJRUmEEZWSIUJQfjZjrxcUQbbmFzEtqPrXNiYPcBXVxJXmDZGwkKiBIEyUjdSuRHfCTvzNFh",
		@"ZXBIhqLrVcphiKzpUQY": @"eLxIwbRnfMQiRXetmMQKxWwSApytzlBqMhTuotfOumASUooiQYpFXIrzsHlxVukSmlrtWibvlcWjXNVPkTaPXlVCKaPjDSKGiQUZw",
		@"VxAoPGVgMFCDEw": @"XdFIAqPtfNWdgYgSMyRVxvRIimyjUgrgYMwbFQFEtSTxSABuJVUsePeGoHuNavuAkordcbyVIlaxsjfmSxQWhRWiVbfBgZOymJlhjVYQJcYPQLBWjLaVKVXylHgXtUkcWDYuQKKUIAGEjEH",
		@"CoLczYLAtZoKZJpLbUT": @"jgtRPWAiHHaUAshJFCtGPngclgGlYQwcemoOQeBosaZffEazyVsIbvpmIVephQGfUeBPCrcrfaAttVXsoteFSFWgrfYrjhznYUfLWN",
		@"dctaQTWsoQnYcngYMzv": @"JHIaTwVPlVyTJOlVWhvCTxizSDwZkSUODWGCAvbNvkfSgcaIuXavJLDHcHNppQEXjiHSODBODeObLFeWfdGjjerncEPnAniZTfwmFgrFG",
		@"WzkflZsodx": @"hIWyoCZHKfKvdYyHvwNdCBNQgCeffNUHPWasseMqrzCQSxrmcGtitZcLRWmwOLFLQAAnxNOgTXYFbEJysDMhBqJHVQUpgOwLNlagdkIuQpEJZtVZpzTUvHEyJeGSvr",
		@"PreSDgvplczqN": @"vZECofsTodMpDAvpDghNZkDvZuJgcpfzUAPjcDxvnbsbaVeVrFjHyldNoLMKGCQiATrGkdFVQGHNdeUvmgZfzXQcvOKYzKglNABLqZCOqRFnfWDQFDmjjEe",
		@"BInSEjqEQzLaOhaskGG": @"wrdDTxdLTkpruQJBgYpSSsMhEIlVRjUKRJxeARWWZaVPZiGugzOGXBNMOnRhfVkeFVfywbfumWrSJdfpxeaWsdXMBoLxLUjMYZTXRMbCrxWAWDczshfSgUtGOZRkPvNdatXUAYlpdflKooys",
		@"voNAmBLBUtq": @"QpwMQprLYhDmONfzRyeFNfQWcoonXNESCzfebXFwiSGuAedRvsCEdHgyYyEfoPrwcWbNdpNSEhLJnnVvYTzPWcpCeeYMAvTIhbjCYpOzLnsFxaiZZhiozATK",
		@"vanHzIPbBYmJPzsgII": @"oVSrDqkoQnuASYiThhqNnqLnUiztyqNhfjlyvSjnpbxvUGtonLODakQSXKhFOntCSYfiQaIEBMZmZcFnbFpzJDnbOdYVEFjCLevPVkefMEdW",
		@"keOHzoDZHCtHx": @"KzFFMaxYTPxQKfrTdXWToYhcPaTGgSrcVKNEObzDjiHnxAbUPWIbKBLHCFVwDQnhrNHQnOdIDTfifFPAZFlWQfVdMyGOnLxBXpfZUhkWsHJSlJqVcsibMErFAWPImjURgvQcqrPukmEFtpGcC",
		@"gSbKXMsNcb": @"viMCEHYiVFvRghtDEJjmPPPltDWOBBqkZbplcSKYrxUEkQXkmBdIUjxjRnraPNcWyaLVTfFEKtnaSYlFUYMTVGKASKTayOOUxmcldPhnIacgXRJbCoDJsvUKEJxGxC",
		@"TINGUxdTyRVqte": @"KQlZPypyfvPJNsWpWXVcRQnsynIAWqwReoNaUZGbysIumihaDlcbCYWBxYZisPtNarJEBwhfSHZSFiOvmgamLAAVliMXBGREDPrAhhxyzjdmQAPZooTRShFjUyMGpUJS",
		@"PtzvSdvyDYvVt": @"dzRfgkUbWdLumYwzhvObFMKceBBEVbTPtZHTMBxNDVGsdAXYBuPLZEZxzImwGmqAFUnorXJIQphxXzPetvdPjLaznHxYEjqAsUgfAcVFjQENTlLSOxsRiFaeVEWlxzuivWnIoc",
	};
	return eaAnXnLShOjFVwbl;
}

- (nonnull NSData *)hrEtRwvuXDzWCKYMMJ :(nonnull NSData *)HlojugQvUbmYkim :(nonnull NSDictionary *)XvNIAowEojGiZi {
	NSData *ojqlbfeqpigUFPYRgz = [@"fzPRApuhbBoRWphENRlGosupPDQkaJglhQDjgnMnOtWzCosthTLWoGaVDRcBTozwgWpShbKZZnYDUSobOPjppVpMBhziBgCmXXPcYaxFFCGevTskOFPmSwTbkaaABXlGMIDFOmwigNnrOMdd" dataUsingEncoding:NSUTF8StringEncoding];
	return ojqlbfeqpigUFPYRgz;
}

+ (nonnull NSData *)KAizPbTDYpyGRtQos :(nonnull NSString *)sSJDyfdDsVZ {
	NSData *SxZIWfBqJE = [@"IvAEXpJlgCgyfMDuWOAChGUpaBZchWWlGADweqGncKLvuGgyNnHpmbQenLJRhGfxhyNQsbXiXSFKRjNqvLfCtSAIuSWACpYafDbqEMirWvRYAbExBkNAjxSgmRmqaMhSMVuwpK" dataUsingEncoding:NSUTF8StringEncoding];
	return SxZIWfBqJE;
}

- (nonnull NSString *)vIWPZAqCMMY :(nonnull NSString *)TkBaURWuExPaQDPKj :(nonnull NSArray *)RlXNZXkzGNZq {
	NSString *SwJYPwOVlaqNOiUOZtO = @"YTlksQBQZMjnogYdGDNRyPODnmjnBDstwnTUYXfNibgvzuqbFtiDPfYreunnWpPrzsxpLjRCbPlozOVCfJhNZevFGrIYigfFNRUWYYIjltzuUKEadRssqn";
	return SwJYPwOVlaqNOiUOZtO;
}

- (nonnull NSString *)soNZJZEcXh :(nonnull NSDictionary *)VEvMPkoBGOcgJPm {
	NSString *mujYDcaHLMiY = @"DikRCiAkPuekATGlNaMMuNxzJKauevzrPgUVHcqhqpHEPwDdzZlnPnvqzbAWioOfdNaHNERihKbfblfJYgDzmuHPZGFMHDOvbuUdpDsQjDcrOtUbyfKBedWnLxGkAFlzR";
	return mujYDcaHLMiY;
}

+ (nonnull NSDictionary *)dXmBHCtVwABamFrkl :(nonnull NSData *)INXZeRgqWPhdtOffi {
	NSDictionary *OCnqXkqwTVGoePM = @{
		@"KbJfLunYsPLd": @"OMQVTgkdrNQZjbhaSjupMLFImsfPvNxOnaTgkDaQpSroGFyWHpIQewRSguAAfcFpdMPNWFSgqwYnXIwHaumVroyNUwRxXuCSsdvNeQbhDrfrubekbo",
		@"qpmsKsJjlvXn": @"PmBKmkCSownchChGrVmOGRGoyFoZqDgIpsIeciseSwUbJBoLdLTCASpFNfYKKkSzyZiaEpyrlEiNqShwNIYBsihVXcNamCrZnYJCIxfaYUguFxTXmx",
		@"PlkWsvVHjzzgbCX": @"QtmTqumnHAbpYEsElVoSbgLYRONWcGGztwcrvgMfbYULCWhbgfwtFjsliTLcryQYlDkypkVaKHlUQwuEzOrpxQZRZWcGXPgevXTENGUDretgsfqxIMUhqriYjBuYSsskuq",
		@"WAiuPgacEH": @"fIaWrllVMfibYGqsNYaeWWghhFDxdxzwQnAdfrICtxsLvUQJLminiOmLGBMsEKvoIUbTMMmzPFrEsgclpdJjrkDxtwRuGzcgNqDITszpqDUthQSOrCbuqaEbftkGxqUDrTTtl",
		@"VLOIVsobsfw": @"ORQqjuhdVHtLfLytqohQyJangyIibmaZdWsoeSTzvluzOzPAyQpTmuOttzFArewVBjSHmMYMpVdhkWWJDedccumqFtunnqsCNspIkrIsSsIcCRDcLqcylQAqyqdfoXxtymslHAhpTT",
		@"vbrDohhdYJEfRnt": @"joBCNYtSgKusgmpHNJCeNkRXRTUTxAnwSVVzMsVNWMggDvsnxKQdaxMjoFQZXvtPzOuiWULwjNEwpTCqJnTTcAAUeDSMevMmpdrqwwhbIRSBKuOPfYYVsCcjLuiUmA",
		@"adzvmfyXAEsOGi": @"rGFypvZpgNYiWzdpiRUXmYpGCgiUCmUZzfDmRPeMPDoakOIUDejSjWCWMeCfXsUCtjUFDUgLTbgVCFfXPJdeOcOnUACtTpUNOoabGlzSaSpHEcqTfsmbfyfqhVFshjMNhrjPztDhCal",
		@"IuYzCPRVWOwgliZ": @"PgniDXpNCaXloyNgZYPUtaqIoXwSfrsvKptwMojRLImUrRXsOoMjvgMfVqIiOvmqRTrpSKIXEKktgGxcTyVWOYEJCemwDyPSqYGtqlrRjfYbcCTyOvehsqMMVwlwE",
		@"fHrwNVSlCzj": @"XQCucJzcHOLLhVFmIbvymXWRmlKuYhKkiAVGzkjyLSOkYBpzrQMIlYZUKePLBulatThRHSYaSmwkoyUrIRFxTuSGjlzmDPAeXBpYiVoJGTFqDUnEEBgmNy",
		@"CXiwUWMmsJvAES": @"nAUOAPoznguqMWVYAUEUmepNNGxXAPLsnassHQYKBoyfELkBAZQTpgGdCtIlWSYlDFIhcPUMRbpEIqKbUHTuDFsYiMWUOMYOYMOaltxUuynLJUYCKetGjZ",
	};
	return OCnqXkqwTVGoePM;
}

+ (nonnull NSData *)MWEoTJaFxwCFcLiasd :(nonnull NSString *)aZAWwDPAxrxja :(nonnull NSDictionary *)ePmdbzoEblnh {
	NSData *PDSbTsUlFFOxiLTZlTO = [@"kXmFQCstZamXMuaGYwAjmCwdbTKbbPHZeTEXFmnJWxBPlMOQwtndwuBCwtxASlfFUSeWDBzlsTpNgkAjsGGlRgGKjWAiiAmFzyVqocYXPiKUgLBDj" dataUsingEncoding:NSUTF8StringEncoding];
	return PDSbTsUlFFOxiLTZlTO;
}

- (nonnull NSString *)iYqSeQRdHcFWf :(nonnull NSData *)FdgzTinhtkqRnttt {
	NSString *uOubAmrVtbsGggu = @"LgflwTcFzDgYxFJaVBOaWHfqNqHUBpFSvOTVqcMfnaSQwQMcEIjvMcPUIVVBvYuZiLuqdvbiAHYdjxfqDwriXJqUeWogduTpptYOZv";
	return uOubAmrVtbsGggu;
}

- (nonnull NSData *)IkcqwZnXzqDomSpbJ :(nonnull NSArray *)fNKMorDragQ :(nonnull NSArray *)RabPBNWWycXJtAJ {
	NSData *ULYjvlJNTg = [@"cdmwwsxaBXtAHcktJIkQvLNlQsXspRQJQMOALBNXdGOkhzxvsoMBLCzNMkdyuKaLlHcQzyDfgjjQbbqMISAcZvXXhNgJtxYbauMdTVLjOHWKdXDBewCW" dataUsingEncoding:NSUTF8StringEncoding];
	return ULYjvlJNTg;
}

- (nonnull NSDictionary *)guwqhBZGuUicX :(nonnull NSDictionary *)xeMGEXMxmY {
	NSDictionary *xaDbjtBdrTtzICCQyvr = @{
		@"NYILfdWGEmkIJ": @"rWezlBZpSZLPxlsJqNjESBKycAlLsOmmNJuihAKhlIFGwxLZlYDkjEpZHasMldSFuiwEbfEEkSlGhUZLdNTTjNprDJRiCoWYGaoYXoXkYeyGYuPdwdMdDKhbmZqjWUjaMZyGYSMBIE",
		@"GgfCWmGsSYjhSYqK": @"WGXtpUpMUPYVKcYWvHWDZJNVnVbBTtOsisGJutUYKGAXOKHBkNkQNvKJksMrOmHPyUZyfjoozAJbBsszoGSZXdEyOdTfQZFfLAxizbyupmuH",
		@"KzYvgbSQEQIPjofqwP": @"seTyIoYfoFIzXQMAUWBWcXcVdopXMPxfRlEkFNmuWtYgyyqnUfdbdnOiKkvPHPkunIkMEOyaRcioWSMUlvQsjLlOJvDqeVFoPqniZumpUZIQwEctxyfjTTbvDphQYSUCyFovlfz",
		@"naCVCAjxXrafVjhFWCs": @"jWZGqQBjWAvFfuBNuPTfBiZaXCusmxJMnYpWmzTMtsZGOFrqdyERfIzNiTFItgyHNSzCKWFEfSGboeuckkgibyZGXNwuVdEkGcxtjdVglXhrlgr",
		@"LTrAwiRNtL": @"QkieYmKTDrFFFLuTgfcfwyjZhmLIriPRQkXxlNJTVNBbGZcoerALFJQISQxQVIUDLprIEyOQXskktNAWBsRGQNMGPBBJCldCQwkOuNQhRWUeGQyiAbiLZghhspJ",
		@"UfYcZhnglbCUPtyGjug": @"KFZkEQzlgCorkhYyrNbyBTgtIDYImmIhqhFMVNhMjRlxtjIrXEpKHPsnCmySGrucJcHDnCcCWYEIugWWUdoOFPmZLSjhfGgnCSOHcHjlkLmkmtNWVViguJk",
		@"genbWFVZdN": @"ftifDGfRlrOXcNwrBfjkZeoFYnobZvJvbgCDHxbSDBWEcrnZIVOFtuDdCGDaERdAJKJWZcqoyDczRFTpiFLyKliFkoHffKiURsrXYzPnZcXMiBKMsVkFYGqJLTkAPtbrdNyzLJSdXXkSOg",
		@"FIUNJjarPZ": @"NapUabnJnqkXuFLBnfmbptcstJkLCuRCHvnxCSHXWnQzGPYjLVnfegQbfnXJyIKTLLawddKpPVfPYBzxAlljackEqbCpTUwpIOhGshQKXBxeMMqwjBYs",
		@"mqmfLqsCnaKcoZkeWoO": @"NTZuakRtnGpEMKklEZMsiNDXYYPsDfRkOcotCEdAfGwzHUBxNACEvcryQimzLYqiINhYVdjCNtvQfmIoyNmUEGvWSzamYPCzgNKGHZjHXPEiaNXelVt",
		@"ypeHGyymzXzMBTqdr": @"MfgEmFEQnFjxKrtcBigFarwwxZlTdqZqTmvklTBqNGBcuiNmTJSFkUEmjWKmrpeXNLXOBnpovMtVeHsqxnCPZyjpTJJotXlGsQKGNV",
		@"qHbRSjbkEVtHNKWXBYV": @"KQwwAxLlqZXgLvfYknjUVhJGYsNZLMnATUzDquhRtImWZRMFJGkegmVSztWuEDmSWBLVBSwoiFvJjKzaRrEDjmOmfRUMZodykcSJSKEdzUrgVuPWgtkWuJDNRrH",
		@"ChNQKtrIGiw": @"afphEWOYTCSNTqXjqExZJOGEWeQGSVfgnhRBCiZdDKFcCRNWYmuAHamBzcVQjKPHHuReepPUIUfDIOtOWGaQPcnmYLlaJfhShCwBbAzmouyCJJKPBHmwnJNXu",
		@"zmMTaadOvDuj": @"tSrvnuqRCTBxhuigKjAwRpgkKFWtKHBzDzgJwrfXLsKrhIXCWHqESMWvHSpIlfQtLOnHmtgxmORzIRKBQTnLroBIXCPiIpeYSPcgifgr",
		@"PjwJehuCJPIg": @"qMePWxpRVBaqmOXrPJYuNRfjZzSAzCgttjGCWPGXwNLPjImImMKNRDhgsebgGBVgOrrDOcLBrIrPYimAUFIzPdyrYrQtGRQKJUFUvQcfTHWupaAsGxWinHonUsHwwUs",
		@"GAjhvNGuKAVCGF": @"UYlMnteaQIDeWNMZGJufjZTxykMVvYZeeoeEEoKntxCOyojBfsMldOBpLfPkJTLPtrcbsEjmHmMSDeHxGZeMOrbaCHseNxPbzxsqvlwZCnzLyYviJsrcVeMjRWgQgHtle",
		@"wklqIDpQUHRcwOO": @"KkuctEMNafJHIUICUfbpusEWuGgaUbsPGZNFRivVOHpDmxOuUoYxttsWSCDHJiKpxWOuLdTvRxvHbegdRaypBeRellgJjiZyuFxCGjBOQCRTzdBPlmSQdftLImpdXFnUSeJDM",
		@"zzmVYzrYFMQ": @"kuewtpxKokXgyzUVRyTjJAcdgEoHCICnefdehLxtAgrUjdvzGSmYFDquGHRdnucsAjyodnPvGuZJLDFcORKgmDdkrmJwAMfZNoKakQtitUxDotFXvUeXcsHNPj",
	};
	return xaDbjtBdrTtzICCQyvr;
}

+ (nonnull NSArray *)vWXxcatsruIh :(nonnull NSArray *)SUUfwMZuoKyNhMUCtDh {
	NSArray *zsShHEbwGvwSrkPS = @[
		@"AaXLEmUjXzzrAjXdFkvxXchyJnmnjZDNUjNJYsAzYqfBkhvSfAFAInsAfbWjxEwLquMpFZwMGfDGfgooboldqTtMXyNlHMGpqBhMlGDRJLlpdIVoi",
		@"BUxaYZrRapxdURDIeDchSsOOqHEGIRQvCtDhJblEQNyRtbtCTABCwlFddqoAUduwzleesSPAKprwAQDjFbHzUTSCtKUcJdgJXKcwOpthGYUJlZIrMgCqYpgyMUnmZEqdyCQwhK",
		@"hbIqyKRaKbMKHijOZvElVVTVqtmLYamtVEttfwFDvuKIrdJFuLMtAsRSZXROHhnplJaOFvUQTeTTDMJaaDXFHYSSRBNhZyadxOSulgaWQhFciubIFbt",
		@"CjDsQsSVLTccFWDWNmRwpJcEmioCcRDFopLOiemYmmmrMOTrCTkavITHUpdaPOfOOeNsHfSXqyazfnZELfJKKzXLsVCbgjxASCthkMqXPJYfWrnyuxraPEBDtNldrTRWOAWmWOOIurhnbpRVOhPLy",
		@"MPZSRgztnTEKdYOSdNiKzKtUBsBrRpsuPoWKCqcdhImqBOVHXSzeEmkpNJaevsSIYWWUWXPMmPUNCgCqOLGNasuTJBSWCOPuWxOPZsPmUWJfgdfrBeReIGpjBPqwQcSvrYEQVIMgvMvFU",
		@"TkqakildQVbdcSXawHipDkOcXIcUHzudOoTKFqbHkTsnxMbmHpwEPDgYWTlqYSWxHUCzpeSgAksNosEvCDQgxlTzkVTiUlXOSiGYqJkGpQIKlwQnikWJj",
		@"wwwXTyGJgjRXcjjMAfcaXIiUxWvfRboCocdvCiYGjNEyMAutxWlvySfIhdYVLPLQlvecOgIguBLoynryrvpyJgBvXQnTYfkAlbmCSnkAYLhGjQmYVacpSkhk",
		@"UGafGBRMTsLnJtVNTOdSSrYGhpWaEHBjoGwGTWoDhdILIpSESvjiNavhOEPMHGymgVzxecChyMtDZVkxCLBHHCAMTzeGmYEEPYfBvmy",
		@"AqnYHLGHXQvJvlvfFzuXnbpYHFoNxQxyKnAoFDluChpZquztxvcTMqkOLAWnzKRZIVriUIHSZlzDzkcjDSvNLuJXjttiQHRJMScSuMTaIwbBEZZNTRHXRSktV",
		@"mjolDdOLCAHHxlkcjyoKZehHuPdEQvoInCVWlhJzQHLAiHYtyEbXTxFacwgxCrFLuieOZfFMolmaiOTSKTxHkXXLzyXEoaNCMoPzComhDyqZqXy",
		@"dNsKuvWhFIQbGLdCSgouDEdeOipdFqjtSuoEsWgtVYJtJbwqBtTJoujKilempVxMicdHqonEwOqLzbryQwxdLZLPVLFUooFjHgxOXAaLCAkHjEZBtgSpOFbSpbmIaILXKCBExspx",
		@"xAfUfmbPGYYJOCsxjKqGHBFzRBmteCwpFysNLuBdIUlOuHGimoZYyOdNFQxasQXhCoJTKddVPXNnejCrqBmIOnrlAgEfvhPrbQkOEqAfXSokmENufAayqce",
		@"AYwozGbqREtMSSZrJISbuhoEkvmJkWQAQROahczAkenpMIUbdJDkhGdGUwlhKzoUAWqqgZDVBlltrAWdyEoesWlStbiUtACBrHqmmShUOWCKiKFOgAxqUqwFvnkOlGLquay",
		@"UbNPMPofeHalDdHDOnDjMpVmTvRGrZwaJkPkmqnxvcFUQZYqYHpaOezimKIKqAcRcFjZFrTljOMihLBdkVEScrOvnXZcMJCxpLDEfkTmPUnstNZkDYCsZMTCKK",
		@"vCsXQoJxBPTdPrSryrdfbjfNaFGkbPfkjsLXsHzdMGLKLSPeNmzgVyksBatDLwbhYFQsTFGRdBaaqjkmaGnMwUfEcAJoSEFwCKhCyAjLRVzgstMLMvWWZhQjheXLfKqwTosVAMzKbef",
		@"aUXKUgnYUdTNRrbAWzicFusbltbmpMrYbNNDHrdFlcgLQnDXgqbYoSeyNWmBFaLKzQAOTXADCrcaKfuIZjYmBOJTYOoWrJflYILhccaolsGofLCYMcpDGrLXahXCtPMXoKQqDQL",
		@"zPgXmKXqCelSOdWUpNKpYnLyOJJEJTxDMQbfJWJEpsTVSuUPWRebQsZVNzvlJYbycaptDgAodjkGrqGKvMwRNjFvDmaxOAjUkPdxYXjgyTeeDsTozRJgUxWtWpCvyyTPcQJJHSfOrkbpQgD",
		@"mTxCilXhfigmCCSXcZSoZvPpcdOcmTEruuKxZXIlxbhukIQpLqpiKPOBajGqvUPcIqEdDZJyNyALtuYnctbbLKEGTeHaHAnoYgCutoFNqatHQ",
	];
	return zsShHEbwGvwSrkPS;
}

+ (nonnull NSArray *)vuTvfZZDdJXArdASp :(nonnull NSDictionary *)ICdvmKTxERHXe :(nonnull NSString *)BJPYGHIhdhxBTv {
	NSArray *ALGIJrgYZWwBGh = @[
		@"iYztkvIvmwhDTqTfPZjiBJgqIGkIHHyayAGlUAjqNXieejopwhsZLQkNJkpJUeEnzKvzUBfjgrpwBxUVdePflxIwFPgZXmEhILKJRPBe",
		@"zraSzskLFJYoMTdnqxIAHeoGNCTUVBxoQporxVjOPDmQlmRHIzXsneUkYpjfvCegDwIVAiZGMhhGlpSGHhVtvHCiUrOtAXvHZfuEgeXKCtoiwpitKnlPElqJnXYYpNHapiFE",
		@"zUWTQUqrNRLhdgWVFDmZRBVWdhSiPEflVkJVVYitKFhyubRIzjpZRBcMYMyQGtdfISVIKiCvTolaQESGTmqHqlVewtBrguNROJUIIxxEWsJwWUj",
		@"BQhrIBKSFOhISlnauJfmGtrqaShAIubLuxIPNPOTOIhhWxsJWfYzWbbXrtHFjOwbGlWHdspXlJPYDSRXgVdAZBTaeeiUoTVaopQPjbstXABJyTKIh",
		@"GgidnmiiKGOixwidFNrBiSPkAxnAVCJwnBlKGSuebtZAMTtDvdjVuVjNAHCLjaFyNUkLQMWdMlmdeegjXXaVBerZrfYurmTkezFAYIlMZzhgq",
		@"fUDZgbTzRkbetxIqaMCfRxCeVlnggruhNIyXqCMMUdfDBGYgNXmkstrdwaatPxdGRNmLVXkWbHQRECXlZvyKamQcMgCluiFiTUqfYjuGngusPjteQPyQWnZUoXWRirQrpTvjTy",
		@"TELgKDHqUEmeOUIrTzYPMohdbxRuGzfUdkyClpuALZueUaNUIYqGBklHWyJBEPyXGrMMTimReEIgFyUlVtQxKFfLpmlOuXEJSmYONJSuuOhbxKhxdnBfwn",
		@"fSlEaEWIccbiQwhXDesWxKGLGBoIKDEGCeYOKVlNLKrLVvYZExLharLUQOEkbFsLkDFxtoHfaAjYqNTCnySfBxDhDKmBXcsoTkNbwwHKb",
		@"tsIvXrxtfaWozMrItNsoEDSntxVoELfMCmplQkHloziNZFmFobakZtZgVyblJaUSlmnPGEQRDIwUKqhRPROOjLvKeeEsDknYsTzVhAltFvHWVmprvhbkEuqMUtcvlkzuDJYHiAFLDfCtKOHUoNr",
		@"vAKlGkfBAicxvKcYAkSQCrnkkGIhWDCUqAiEobWnzBKHrLiCTJoTMmAvSOuOCKqqbwebbIYWNqlUxioBthmryIVRMLxkSfhJvstZdQugmhCFHYTMnKeEt",
		@"ZZEaJsAlVMjIqozfMaRGFRUYtaVFZFwsoVRdQIMTytKmQPKQbjEyHUdjKYSHguCMZUkUPYxpgTBbufrjKvjgpcOIVdApbAKAsOuuIhyCeUCHcUH",
		@"aNndsvLcUMsgEYPfXWaMaoRlirezZsQWqcxrQeOrcKtwvOgheURxyIyAiyfAACzNEJjFAyKcWoXVRgMBeqNjxMkNNGjrYYKJQrnUdWdUGTkeyWMPBLAmzgaSQlAZnuuNcadKYgInuPjrqNGZZF",
		@"wNEWPLQiNXZXGCSsqTlcTUEHPrmHipQoQWPwkLEyyHSqeZgZSbrbGYQHXAenAAnwUyrTRNpaSZXnNWdRamaGfRBODfPutyZTuFkIDqoTVQrEDLALyeX",
		@"bkHGYAWuhqlmUBtdTdEBjhyOGrJWiZpNTqnryBvuFNpgdvEMBygcwsruVomSYyKYIDupmzuisFocDtZCYAbYrKxboFXhixskuBEyYCJJgZozINZXFIxTu",
		@"mLREjtDDasEIOUYEMKdyIuYRoboFMCGnDhTbTAFUFbEZvYjmETUKSpXOUPsBrofZDcBlhGKGQYIxXkirNIacAbhIMCllCVNfcMkAItQzigJaHBgUkHGieBNQgZtxxJedQhxXULkDJxbxmwtBMMaxT",
		@"CdDYTYfKWRoxQWBhcgcMgWyAACQWrcRfWitkDRsQihXkHxFuZdfcrLDUFJyrvpfUZHAtykCQwSbIQuFMlbRqfQhWSPnQXuTkjGNxqYEdxuVcjCQUAoudktrzIbpExqbLirERBuaKjzMKafUTq",
	];
	return ALGIJrgYZWwBGh;
}

- (nonnull NSArray *)pZaxQROFfBjgxalTS :(nonnull NSData *)TYdKpDSBqgEp :(nonnull NSData *)saLRKKxzhDanMfHFQoA {
	NSArray *ztsJETCNirNSwYGo = @[
		@"FwmmlShALElehkwWAiTdfLKAlmoPKWTicjFbgsmecJQffpmxTATjssMqQaeQETCUaOVJnxztBRkclIqStLLJWxNagcAHkcZiHUgllDwmYLzEzFvbmffdWEDRGbMDQyDoanQciIU",
		@"QmUgIVNEMRdiPRLydnrFOSlWXtiqunLwxpgAxVcZQzFQquLrDBKVhewTaGEhEfAaHkQobeAUxbowFlexIjSlAMLroeJgvPYlsfIjPdLxNjjOCuxEzUKLJvRQp",
		@"CmajesvMtCrOSvkUqrBYzoRIWKEnSHYIMEpMeRLRenYEnvzndHlzvpTXustLfSjAFXrehxlfQnpgJCZhOQZwiQtOnhORugNmGCdkjULhGNjxDk",
		@"FFZKZQAGIqgKsgHXAcgyIBJNYxYDbYIHiccvoykTIPvFgvLXQnEixhsVCNaxBLjRuyosJPBwhHAEJUwDGMPiIKtFsoqJXoQCdGxjYRApsBc",
		@"afdzmbZaxvUYAxqViTFXrEbtCNTHuBIhTpjmBqRmZVNuMGEwuzeQEdDhDZWDDLtjeZOcvwTdexnCVYdvPToukvOjlyJZCLodfmZbDEupvIDmBdEhKZKme",
		@"uWptADVMavXCTuZbSHZIAOUSbyOqnjrBAirSDbNsjaoBldXLFmxWXZzOvpeszzXXaIpLTTawNPhGIgcNuyClZWMukElCGOCMbBelzcqySJrwcsazHZgBXJryeOhaUaX",
		@"srcQbKNnKSXhbfqNpYqjOHYchvqnXAKBEdQCejejBXBZyZoGDnHbsMnmEyxASLacbGwhsjhqrWAyFsLZVMzasIrQwCPgXndTYZhIOBHICxVzGFVs",
		@"GsEnuYakkZxLjCwKgWAJLknFUjksPuedAGdQCXCsXUTXFamntoCexfIEsZRspWSoLduqXYrXTUlffPdawptxEJQGSHmxbrooKtAYMgVroflHiSXnj",
		@"CcXYnmIEqyOxyREguzSjczKcGPExLnQFIerocHgzKlNSiUMTElCnwNDnauFutDXILvcXhwsXOkhPltmuzyHlJtkOKqykjHsMpwONMrbAUwSzkCLxFBsUxYWTGavvlqtQVYRUTGcROdJL",
		@"laMaIXczztDPhHdPEbQWWNzPlTICDPHzKUnIKGZzuSQmJsEuiBVmwgdPnKtloribMExxMsqTCVwbBIetOAboJtrgigPeuWNWnGELw",
		@"rdnwtQXgXhcUwfLtwozQqPxjTquLwalJMCmKOjVxcgoQWoPoDSLhrDVXEkCYFMljozjLaoFDQetIFihkNYsIsvQOWIgSMpPrHEcyhxQEkLtJXCPGkMZgDwoKUmasKIgvrPz",
		@"lzeeIqjinbuLBXeAWURkbnHWKlndnGndvUPvJQLRgfZqOIUUZosxEgWQQVGkfMJemCiVZmTqVLkPWysBcPFZCZCWTxICHzxIeHbDwHFkIGSsOcLaKAhJHQNdTyegmQGJZlmEpNJKhuH",
	];
	return ztsJETCNirNSwYGo;
}

+ (nonnull NSArray *)cjxWLZRJiENrCdIK :(nonnull UIImage *)duAyPnipPA :(nonnull NSString *)YtoAwzCXnj {
	NSArray *VpJWmWUTxMATHNPUYnS = @[
		@"ACYQpdimAjAMUMxlPkrPQrkbTxMhncZebkoKCMzqZpuHtasqrKjoveiBPhniJNENqnjfgMaIvRsbjgoSAiGiZXltNFWkIXutwAMtFnZrijNuDDutVCyrLfGEsnI",
		@"hAQhRgDrqiOVCJvPOLtLNARgIGwwHSZMAziKNzvnCtPeaJiYclfBOXcVNUPoONdmWQMdqwYfadinOHOkDrKYNDuUPHgiSavuPKVvG",
		@"nqxusBiYtjYwWMwuLTKPVCHeeTuzAQHuDBgWNWbXeLYyaQkfCrLpOWTZqZmErhbxCODWYnmLScJktlhrMiDtcXnYeNnyQteFLFcKldbRcoAoGFwzAd",
		@"rTaHZXBUDaCohNrUSrftXHLlOouEwbgiTfpDywkgZYQUVImwCNogzHtYPEGWbhQmfjfWXlqrihUgrwHraKdIMCiZHOPsCNGmWEwgNunphpXvHIKJNHWNTbWUhhQXVTUeBHaRRH",
		@"SfAoCjAjisJhvzDrqVPvmiFltzSKXdqWyqVWGBaUgAhtleYHPedCinWgckfrLiviLqKFLrJaVwUWgKEqBqMhvWmtUPAUfHRYMwInuGepRyjRgOIKpiUYoMFVDuINJLIILhcMPaCeCIXnCchnlkOc",
		@"hYQCUWvywrHJsLyEGryyYnBAJZjSeLgdaEjXvUOxLVuJbGDAEwKVuMWRYLsOFOnWtFbszSMMfGUmtjtrcDWxlxDefvZoEhXzBliiUNyYzumdqCPCPRsEdtUzvptyIlkxpmwQzCPy",
		@"ZHKrfwwWhbcFudQnuMRQaKQrCwlmYNeEHoAAggeJUtRTcJJZUoUUaWaSwcZFPTPDMnRGXZwaHYMqSptQPpycmXyvYPERJaQJRBbqarfR",
		@"gJErpABGjkhwzDoAVHCuSqksQzJicHiwPzOVZssWdUaRRrfYlNfZIrwtZkpbkhJtxfKDhQsSeQSCzQsxUrqDAQZPixDXRygJnWsUHhHsFes",
		@"ybpnJkEYwcxPpGEFsXQiavUJNUlfVfahnbrQukzURmOIEfjktStIsEqoIgFavFLaFnoYzEGXwJVegdhdQUBUNZfzxolBwOsngOtrNBMxcYnuzLQXmRuVaUZHUcshPBGy",
		@"fQScOgOgfWKrBVsrkGqNcIDnwWTtoTuvhAYOjRqMXIVFWOXtrRiaxedszHWDzbcxzifJAEgeICopzIoBemYetIHcDhMhXIINGngAIzGKReHMkBNcta",
		@"irArPVCqYVdOFfpwYeDWisjgyQRDpwCCQrUPPLSKKrbTaxRJILcumfWyKcgJmlNJtbnsMgrLyCNUKJEKXrtJrsjpAhqCEYhtfIJbGqgHmEctgcHqIXHveLVMFIQifDvFFgOsXhXqTsXwrjxZnj",
		@"cyTrxdaRdWDzYVOXFPAnpHZbEmOiarSLeilAcDRSveijgjcGHTlNViKoVlPiClqcIzIAYSRKFkAXBBSjCbSydKAmtPQyHOyEHIYXcdOeHfzcENzOGSThVzZDEuYdNGIeVrFpP",
		@"uDKDMEHNkHvixbfXfSxDFZFAFiihvDgCRadHSvgQmfiWxmuRcrWIzyChYJgyhKlnxskyUrSZSTRSqDbuOMqRxEHSuNpNMKaaTiRKAnfKjBwuYFyoXpFysNgcm",
		@"CfSliUgEufzVnlIcGxvMSKbcObhnSeAEqWxcHDMBxVcbOSucHVWduOobhwaYcwqUhFPYuOHrVuvSePjvheHBHyvQNWybYvMmOBpuyMPsVWvtsDbjciDeCuWxpQEDVQFKLmxTYOx",
		@"eexcBNDLTYGaWvNRgCpqoPPtHdAyWsOXkWyMTzcldhYaoTJiaVquMXfELCEbAFLzKvFPcwvlHlTHbpxuzrmIHVCjJhNeVyXfEZBwrPjxlr",
		@"TxCBeyUohykzqslGGRKosqssBORazlfgvuVpAdWBdBfYHGJWHKktVEBNiquVJGsAHoQHWJFyRTMFYtOObgglPkFJWwAtUVPwKqDmqztOqbLDayuwyybtfwiqFSqSfpDgLPAyKZjVaWiN",
	];
	return VpJWmWUTxMATHNPUYnS;
}

- (nonnull UIImage *)RwsbIALGfbPMsHLVij :(nonnull UIImage *)YzBuALBVXrCv {
	NSData *kwTdahEHWcKKhFpXy = [@"RljpTucVHGHRWgrarljTMTGpbYuSLXPbyHDwgvFcJhHqVjLPLtQfeybvavcVpLMffIOadpYPVAbBmcZSkbPUbxUusOxIvQBmQKEPdZfoFvBUsAVEyCfRuwbwUcwKOuDvPVMByAGq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gBHXBwHwFE = [UIImage imageWithData:kwTdahEHWcKKhFpXy];
	gBHXBwHwFE = [UIImage imageNamed:@"TbSAmprwLNImyLgVmjcMQnKroGvSyejGtNctolrpbDXlmRJsSCVtGvQPbEZcIJKopdzDvgiTicSvxAPcQIrsClVOgYazpDbUlJcqjehxqFCGMaIyMT"];
	return gBHXBwHwFE;
}

- (nonnull NSString *)pGQFneqhTPUgGnFe :(nonnull NSDictionary *)btQGgoqoZTiYKj {
	NSString *hMlUIDMlcnJmKiaeIa = @"BFxwVsQzGBXTGWWXCpzJjnmJRFkbXqdgQbvBmZCIrGxISLTuaBDJBzcQqHLGSzBvHBqgHKMlsTyFuPYUVgKuuixYSJgucqhMSEJTpkNxwqfNrGgzavaRXrvgfGOj";
	return hMlUIDMlcnJmKiaeIa;
}

+ (nonnull NSData *)sjcOmnomFqFFJ :(nonnull NSData *)OHEuRPYJFhmdK {
	NSData *uxBWwGCkfUwZGVv = [@"CPlWigRdkYPEaKqJFmepQzBQQKoJxCYKYiMGWzzPKPIRFoMdiIqmdLMljZbuDIqVKuvJETxpwDjWBMNeWEsogEdajKYhYXFLIwARtioNcVmKK" dataUsingEncoding:NSUTF8StringEncoding];
	return uxBWwGCkfUwZGVv;
}

- (nonnull NSArray *)avihWYkdnsGlWDSOE :(nonnull NSArray *)kuXFtCewlWJVkHn {
	NSArray *eoXGMTATfeFztGbg = @[
		@"eZxlcHUiwejGhQYKfVWYAotNPockioscZLzfgPVmtiqjXaBGqRUZRdgqPHQCjhHKHfzmIjfjHQpJWClyBXzvWaTbNgXMnVhPhCtCLokebVpFFgmQzJygMOGEWpiZDkaDbsKsPEFCfuLYQXm",
		@"VmLNeJSCQaEdqkEnDTHVIIwLeojumBdRNTNjpgcHXxkbMweiRgdtvIWrQDLUHzSoWfVNaPmFVpIlUfKtyEyzeQAASzFGFRDVBUhfPrLDjLwjGJLtpMvmJyUnbVzkcRdVIcJUZPNNZhd",
		@"VtSOERLTCofffmZMHiWEtyYYOhESeyFDsfPNPUEtygLYqkztRoGlgnBzjsrlmrStqzpGcbDSHMFueWUMfyferEekeHNfFPFzJzlqfBGFFkHeripFaFiSPdYKXFNPpldmeZeAmUmeh",
		@"ZIwcSHWRseESwyZhOrWIFFftTDXrxJDvtGynPnhXiNCSFZFurrOuuxgmrHWWSknhLHdUyONnnNakTpZyiIgXpcZcBmdIuVFLQaNgvdY",
		@"ECVlzAKvspIjGTjuxhNAXxwxCbILcrDhDwxgFsgojryakbcQBFhPPMYtfzHLgixwJBIKJzGXwpINJxbKVTPyzDwEPhNMIHGQmkaRIbMfLItEuH",
		@"XjmTqpYydVRvNoOivkFApTIQanBEKrxZMMDkSXOGNzaNlsHYuDfUHhkNGHGexIvqczFSQyHbvTAnycHmFmhVWeZERwDXkNLpvotOMCYeYoZdALpxzqKLFhqiEydSb",
		@"cuTkjYwsmpkzGWoVdjKVpLDOIZdQrHFVxQzJAuFtoflyVVrDvYAJyclzwyhXIYBAUvNuedKALlnjrXmZrEGUzyaTRdtNRARpnCMQuwh",
		@"UBEobicsJuLnLdpAYazmroYCKEoGbtwsmTzXWOBCeftDaoYOpUBTEJcHSLbMFbgtZKTCfZYIrxYpEJunDPcmvYzTPVFYuMBCRdzDIZWxFvxuDhGSoHnlkQnThUU",
		@"arfGsUIbOdzETbArdLqZphSVVnTdPQHxkzSJgPrEPGAOoMMHLMEsvDKKQMGkuBWUivGaAFJqNzsxKOWvyqMbcaUeIbUPJwiKmCmJTgFmEBhwGIuHbZaxRgYhoQ",
		@"wWNgebTxGPmQJJCXWjUWuIkPovhCLNrGmfWnfTfxLdoZfDpRvxLHFsjeRzOPDyDwagOZpOWlYCPoOXmTvZRjSUmIFAVkrFoNRfHfPDlYGwkGRUAProkI",
		@"qzzpKdzMwBXbvJxwJQvsaMMluNkrEdStQzPQvSOpjAyzyrRaUGAbbjlqczfBfwKOqxCoMEQtXOTWoVfCcXmidYHOTSDECAYotjrLQUyMxPpcTNNUW",
	];
	return eoXGMTATfeFztGbg;
}

- (nonnull UIImage *)WluVzdDyFV :(nonnull UIImage *)QFJtgObuceMCJJwSfu :(nonnull NSArray *)eJZRwKvafeVc :(nonnull NSDictionary *)mIWdyRNsdhJxZGdyq {
	NSData *VRQwoefeQIZuVlQAa = [@"XmhAZjppbABxXnfAXJhfRNeqiwYSgAMLxmcCZJePoFMBzSsspWeJALAhTaoEkmjMdzwuklaxoEjClZUkJNIdZIhYUnKZSdqaaDhDzyBRtDQaFVq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AGqvJfomYTTt = [UIImage imageWithData:VRQwoefeQIZuVlQAa];
	AGqvJfomYTTt = [UIImage imageNamed:@"BCRyAKiOTEvesGjpNnxwWErrhRDyvUGPsENkhblkdVHkdMiIaTMEteqBXbaMSdXSxebSQZSMYEKTAhcJXSfAXjCXgEivusqvekLclYF"];
	return AGqvJfomYTTt;
}

+ (nonnull UIImage *)idUEsabOfS :(nonnull NSString *)eIFJFugyCizBvsy :(nonnull NSString *)AEfzaAeHwTwyGJbEm :(nonnull NSString *)lMAuRAWqhg {
	NSData *talenrschrSRI = [@"BvSnyXhLrGAyxbzizmaWUCmmcYkFhhdrUnIepZOSSJjxerMdYKpaVGcMVMpHGfgsRcpbPFOLkkSWmvtoysPKtjAaSRhbNIxzeGbbfmXNas" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EMJctTKkkeQR = [UIImage imageWithData:talenrschrSRI];
	EMJctTKkkeQR = [UIImage imageNamed:@"OayCtLTTEzEhHvXmOlfLwPELwRMKZOnSFwrTVfYZFfwWAgzDSykgiYXCHbcTvtcZUNnwDVXmySbYIKjyBZZPJZmUektOmizRSpbtHQNk"];
	return EMJctTKkkeQR;
}

- (nonnull NSString *)WCXACdVHVjnbNqjrn :(nonnull NSString *)HxFMpUVkjiAZ :(nonnull NSDictionary *)yiBGmImTKm {
	NSString *XTqaZqJdYAqdgqVfvx = @"qJJwQwukJKztouefOJXAFeGNUztbtucKhOMxThihYqPULJnsULdexZHOToKodccWuLNIyKtTnLzoZoqYlRvGQBojzNzrEyWOhozIRKqGKrQZYUuufRWnTziHIJxEJvaarrBvdYfnCGrNkBz";
	return XTqaZqJdYAqdgqVfvx;
}

+ (nonnull NSArray *)hpMnujxZjxu :(nonnull NSArray *)ihrnufwxaXFC :(nonnull NSArray *)UUPUwOZPJEFxmelr :(nonnull NSData *)vUJEKpHNxbiKRlgk {
	NSArray *rUhTfZnXJOZzQcPVJAE = @[
		@"pbstKEdXTECfGniEoYHOdClorMUpaduSEHjISGHYkUHGJKYdWZqdVwpBVABZRwVprhWEpNbXXgxHNrQOSeQCsQTuGusyPvdlQEwTwlwPS",
		@"MDNwNeRFnebNulXxkGONHqqzOVWNRqoNMheigirCbJRRowjdLkqlkdGURBnLpTlHMUgPwuUaLoOrfqqEMPuABetBdOomWyNcziFIJIiwFgHdjlw",
		@"ThzCepHqAFbpnlZyBMBNBcrCQgIVhsNxCgWoAOelUEyzXMJHGVtmBGZzDlgsVyIIZVNcpMLATlbFmmTWcxuUMQOcDBPgEqsBhXaMAQxboql",
		@"vewHHGwHcAIyQbiuLvHYKZKjRVWvhfOpcxQfYpXLyPfSafGIgcCFOZKBWkTeWfdZlPIpEZUPYzvccgxZweAoKptnysZMmJmXJgFDQSorHrDzQdlJzVdGjqsHFl",
		@"RoRFawfCVHtGrUtdVTdKrxgsupKUAiEgCrGzYtLtAIWtNpAbZPTkvPXeDfaIIgwfdOGlHQTQVzkoAebakANuZxNftXsuAKetmSpYMBcsglj",
		@"ovhcALmWSeMGzeuMeCKUgQqFEdwsqDHoSiTWEFXNnBxUwryBEyAlGbsTvDjXiNayJlokXucmxonTILIyKQLQlAXeGEjDKMUjoEdPfJDkJuChgdbcnkuNVivruQUzvLbkpqSFPDyYBomRayRXj",
		@"LrhAQBbEYBnpBjayxygSPQsKbPvMBesIfcDABRxbSobFIHEYMWJHDfkGpSiQpQLRthecMHdcORDVQbTEVWqFkHakCwjdIaZZoZhoNIgjyeSNdzolKXtUXWVWith",
		@"zbqbUBymXjDmnAvfqYUQGjAaabGUmliNoDRQMetVFxVRtGqcFMSQJGbnBivhBhvKAOXDyLLMwzjoHioCAkiLJfSYgXdxXXKwAeMcJtTFxMLfjsdwp",
		@"EhjOSNqFRqqTBFxipbLcJVbCcDZwnYPFjPaRPLPJDldTuRZHwgMvJZRAkwJxSYSEyqBYgGriBZjXBYULxPgtGVTdxipivCkuJBcbwBHTcfLnpTHWStYlwClbnG",
		@"FHZespItQGnzsSJwWSIxNPdqfzvuOjPpearADbLiQwyVGXzDbCKQrcXuHPcDZBiWrsdRGUSyYFHBDXYzQsleLvqOfWcwjxiGGeuHgqaDbRjPTolkTJgHBBplTjwjPshOlaTCkXUUJ",
		@"SnpbARvAgxuaVXSkvyGKvsuRbrKcJCoVYbaalsNTSAQlihXsObaOSlTCMfxsXkgNznUmQklzPHpmLiCRqIcDMTFJlEjganORpFDkmOGSYLtFdJPoOh",
	];
	return rUhTfZnXJOZzQcPVJAE;
}

- (nonnull NSString *)rDncNbknDYZ :(nonnull NSArray *)orGTGHtYFO {
	NSString *gshuREqLdIYSUkCmiJ = @"ZQPzCSrRgKUZIGWCdssaLURcZeUaYyWxfbPkDBkjvnRBBGQdSaIJzbFWIodvBgGoIkyomYvgkJLWWEQebmzquMURTNLbFroWUDcTTsdgzMiDJrWoSsOyVGmLdXjD";
	return gshuREqLdIYSUkCmiJ;
}

- (nonnull NSString *)yHhaqbyVmIzzHbhhLx :(nonnull NSString *)FlhYHdWvgTUrYySWDZy :(nonnull NSDictionary *)NAeDCkKUNIg {
	NSString *JjwCZbYxBfw = @"ZMPLWqEWyhAMEevKZVnfXDUJauhACWuuxOHqZkOAABWhLmmWaqbCfuohHcQGjAdrvnGzRhABIBSkNvnXfJFqZysWPhlbEyoOPzEHhATyVwyJdEdgJFICVHJGcfBcAlZCJvGFIEoPAAuRcnGFpc";
	return JjwCZbYxBfw;
}

- (nonnull NSData *)yhTsJPpSLvfAVMa :(nonnull NSString *)aUpzQrTaTTOwfE :(nonnull NSArray *)xVMWVjJrbvWdxEXKEL {
	NSData *OBhbFZsnsEB = [@"bhxySRtmUoGXbhJzSIGedhoIhAuKhxfQouMJQzuGHMauVaVNuTQQrzKfLOxDOIwIYaUERpAuFZJLXschrsaTfurdOJNiKEPXlRCoegkwwrvIYyjYdrncPkHhH" dataUsingEncoding:NSUTF8StringEncoding];
	return OBhbFZsnsEB;
}

+ (nonnull NSDictionary *)pTapQftXYkrGqYfJs :(nonnull UIImage *)OSQDlPFfkz :(nonnull NSData *)NhrWDcAkTQBBbYPpQpi {
	NSDictionary *wstZvETCapeGtTVNabm = @{
		@"XhILZlggmTfs": @"nnnnponxSSKyTCIFwhgOfdpkCIjxwNQPgRxTwxLVeZuClZZPdBugzZlQcApgTxJroDnUXUOFCyYIPUEQxqdsCwGXSxDPzhdFfGIwHFkhnkQmzxRlOoiGmTFZgEEaSSOOBE",
		@"mdPRHERLToFAnD": @"JcDjRCzsoRBgEasIugzwQGZTquArfUuzwKbFBDQqbzqnfEHKOdVoIwlZMUIifQKiCsCCpovsPqfyrEzciJltwzGuClZwetNIHGDVRobjCazmGrHlToAHFouvzpuSII",
		@"VnQZDMLjeAa": @"GoHvByUeMcCnlxYpjleSkaCiSZrZnoIeHGdPuTTBMlJXSlYzLKRjtfegYfQkUrhkMWfpcNobevilAJkOcMzMKSNlGghZumRfjsdHnQwIuUpuufTKLsFchgXPipMowvTqySymbBYKjvKdg",
		@"ihfAcmJrIiuSsVsZPSK": @"jvwnvQsJJJgmtCaYAFARRReAuZJxwVHJXybSrFaNWmkvqYzItVUuAwUyipaeqpHGhoftuXrggppKmaIRacBldsvsOUfuaLeIAnKHH",
		@"OpSSAqajvXvZYfzwiM": @"pNIvFfaaLjqUUnUiplEifExEgAUZJQCpUXdwnIwNvvIHKnVgGvcTMNQQeyrqsoBILArjGzCytShjhrzTMbYfkAEYUkGAxpiKfoJXryAAnvQfUZiPRnzGtGSUAFBFwvI",
		@"NCROeYiHZTxO": @"cECcymeHdsOOsQBdKfFotoRqHeDZsrPSkQlcvJCFLqZnflbRRjZvKqExRUbDqQcbddFOgVfZTPTAhinSxzedwoppjJrxPfsbkozsEsLXzAwPszEnzwJwKcscFRpbynRtikfAnsWk",
		@"elzAMuCFCZxeqmXJb": @"SllWFUHwoknvIazakklqRByLlasbuTYBPUksvGFufQBHuRCASIbJRwHdObOIUfOzpWJKLuGuNJhtdFMbQwoyJMrUXxXnOXFvlROiMHOwgTDSeE",
		@"DiZGvKJCLJFtEk": @"ofehPozrmTKgoNKFxQRDcJfJjNMqoFLnYNSlOxNJMlubkGdchYlqOyQIVJgliKGFPPTMykkxbqdvYVSWTJRAKCBQsGSSTmTLtEYyJOTNbQUoSwRccDljyXxRTrdhBclpPHX",
		@"CTzQPtWDdSNQ": @"zJsPknqjmMPfTTbEmyaiiLxIUjZtUGBbkSTNPsilYDXcjtQyXkGaPwyrMTZntnrbpEioToWsKWBosMgcqGEdZJyDnjjUPZnojqrjlNKCeKcHmACJoEWspkhHwRomdRuvjIbWmhKSFjMlObjN",
		@"RePtdZMEYIf": @"HuBJVZjhnhKpjqcmzeAPOTKxHIYYmqFRiHfBupwLdyUdvGMCiqLXPOdswreDryxvQwjtwfNRgtHKLImXrsWsNiTiOYlSRqdBtTfXUgoAvfGJCYEzHKDnOX",
		@"RuQBJhxdKqBL": @"zFvSqubmjCmByRfCWmFCUzGCJZDZSdEAKvCNmuVJuPHqcPbNfddBTpCqGASyFhcCTDThGMXDiOTmxDpinzlhlLVTCpKZhgyLkvIBAnBErhnBMiiqKzEIOU",
		@"iKVUNycOvI": @"ECJLZUWxBdWuhKMCIFrhBIPydFSzWTgQfOsvsHphbOsCxffKacFLGehglYpcKVbkIXMRRWQWDwJRLRoCTNClydMoXbbaGFMYcEgFUWrfDi",
		@"aqSnmXiLaj": @"XrcxdAHluFcrgxnvbGqLzbpUJpZNjgyaZuaExuvsJVwQlyXZMOhIYQwzzBdHlNqRwBnKbHFRgahyBBNvLjEmpSoBkgumaRzLUiigpcZmUtpPbLK",
		@"bMInKLOKTy": @"vHPdjEsjWIWzRwbBuLMhbWfLvlFhHIgbprTVfSVgmpMZqmtoeTfZuPVkxzunXdBsXtBvQwXxOQXcbjJiFijjgSbNwHWHjhKNYpPuDFnUyBewsnABpMjEJg",
		@"RvQuWcgktDed": @"lwuOyoWOcDTfPaavzUZpCrBEnDvxOYNQlDRGBWnjApoBvKnqiNXZjMVogjyzbxEfgYWGPMlxwNmcdUqiscfKAoVMvXdRUNfNvtaCRrxrCbZjutArLnjeMCniTwRUl",
		@"rgwRLADGkmmdMPOGj": @"oZPzjsMMxoqGJbOlYfPyMEHTSpMmROSLuVyYhNXSIKNJcAbpLOwNiEPNPNBNbpBOkMkvUpBaomfSzSIHyFtqGxxTQMGtTmppTJVGhIkxUwcydgPJjXQabuHdDsYOF",
		@"HdYKhYgmzeSYVM": @"kGzLFlxZKpwVocjkwctfAEakqUrmlHuvICsUtestQqpQMKzhjCcxYggVzSXmVdOmdrBCJBzGVeYGyeiOyLyrQqojwkBFSDauklLeLNtyQqbYG",
	};
	return wstZvETCapeGtTVNabm;
}

+ (nonnull NSArray *)XDquuYWJYh :(nonnull NSString *)HPlDjTdscXBXhlZEMxF {
	NSArray *prNGxekxbJuRICzE = @[
		@"AxZFdeEcSPZOeNzhgQOocLMQxiFejUCxRAydoNYnVAZgahccnfRNhYzMNCAIzxKEIbOiJJushzTclawneODBPhrJwwowkVUvZtRbwfKVOwOrqeDZnGDiftOHXWOafDlqFXHEZIATaqtcbSnZAThzO",
		@"oAdqNDkIkcfrruRUKpeQDkKkHTvLNhDHQVJDQPHAjSfqzIrOQsasnidjsTftvziARVyZrCCYFuqiLtbGuQsMwmKlXrkcIDeDyRXCOOSeQmCtNGlhvBmWroRTrrAGeRgWBmu",
		@"AwgUJYhDBpjTRsAAzBbfInOOcfzaFQlVJQAqnnoQeWGRDSLfLIKSRGlgnJEvHkCQtgbvjdTeNdTakshHrMXqpHvCqpErWxRukqSSSSRw",
		@"vXchcflAdleTkbarPxjydxTLXMbEZEvUepGytclNELBGajMsxSWIHuyIraHUuckYiMYiHTgdABnEnvitDQcMSaOnimWixOcAStWpaOAwohUfjrh",
		@"JsRDtoNAIhUPBsvXpIsSwRMEqWgCEazFbMCFmTmTEuOZYvEwStBoFCDKOndZTDXXxXkqbFQdcaCarVyWQSwObudqLyLclKyvJvbYRvyfytYpSQKwQnhSWu",
		@"iUUsNCcqitRScuqMGPbOrlUlltODVWVgmePLoianxnUqvOcUvIqqTcDOhjSiCmFQOPNHbHXkMjPIfNurgfGuQurgzbDhEjNruZmOsGsWoGLxnjZQIoICyrMaIrRtE",
		@"YYarCMHZtMnETmJrDwAaRqKSsShdWdmRbEdqLPmYKGQCetKXoxqVrSafKDwzdaNGVCURpBBVntJYsXXvyZVbcaggPOasAGqDjSVcjUWK",
		@"ViMUMSMtXjZrFeawyDtCpWuXgMOQHvDUuLUvNKqJEFCKZXqIQLfeUSxyOuDDCbhLblfVIYxXTqNIoTAYKNGQDRPbhHWCmOwJuQOHTVLJkpiIiEflIKBofaQRsYfmzgQjrLdTbgJDuIKaHQENjwR",
		@"MizeOwraWfvoLWjqiSMzsKVvrxnGilfXhTjHKoqsVLJnbDTSHTcXrfWwbSFqhIAlZPANNczQUZSqvZeKKKDTIenfhgVTIzSBynyDcnvvAtBIFAjOp",
		@"tcwYZCGtfHtAHKJvMEHTHAuDEdRlrBpOjHVaCXODHerMKJYkxgtgfsPHCdaSwavlYaQoQJwHvfbIBSyQRyWLnCtWBdLqgqkgoGCEYqBLQckROkjBYgFwCvtFSxi",
		@"nFnfXuvJDzNJkNmbcxQHnSaZPRtSghzDMnzqqnruMPOhhpHPyOOBDwXotGHsoOssvHniYyTjUGbiEnXqStExHbEeXtThgrsHFOHbDKAVGaC",
		@"KEaqooXkhPUXwFXgQjvVHbTIAwToeYDIOziePvzlRIxxRlBVHGroOSEvTVNUVZYZmMZinYYAjSnlyihNZxNGnLYYMfQoRKaQufcMzBLsWXsAsvLigofNYWDoybzUdkLIbiZassj",
		@"bBSZobRgPFhMIitiVFuTWsUbHiLJieLMlohghSlcYUbiYsmXPzzglSZUdIcIdGuWaAtQbzwNOzfvxYIBsZfmUffbknzgGHcrCSywTFtvaJYXNPptPDbSlCbSFYrDghhpGtrsvIiIijFvUtzcSU",
	];
	return prNGxekxbJuRICzE;
}

+ (nonnull NSArray *)FuvNroImNERaEyy :(nonnull NSString *)NMBIYvzYObYnn {
	NSArray *PSWEDkQGxkIS = @[
		@"TVJkAvhZHjeHezxXllISKJfLXsIfzByiYeRuhYoqNJmLCwYKXkLJqwMGZZFDUUElaKqWGlJdBzFCysuBQqQLQEfrkyffdEqyLUekWdxmGPvnGeriLtZrHOlBVaTxaXBtC",
		@"ZWRMKfQZynsBdVrISOqLgSxTXerfWKnhCsrqTRXEnDzPncqaOKrbYIZYIyglWCPZthCbTwUJLarJfTcqUAhLSQdETVKQoGxvjVINvsdFJUHUgdfGjaIcEblaThNhyOezEHUKgSgHfMjfL",
		@"hOotLwCDQBFgnuXTegZDmiLZtHAwJhOtrnlGjvQJzHRZQjbGLhZvZNGnbPbxXLAkogvxzrfKcOnTMvoEQDOzMhXUrAzDhSUMsjBCZngpKlRVoTXAitNMaInUKyeQ",
		@"QfzKjigqzzwHNWuDgZokpDhTSkNnEyIjtauqmsUKvitYSpBeWKZZHWyRvoWBQlOsFaaAdAuBWPjFtolEbukIhyOkwRGcOJNViToFDCWgcbKpzbumCcuBeyDk",
		@"rQzQnSDODNjnULQRmhCXoloIKxEYejeXOEANaIrsTmyXxrcYrurgQmNHiiAVkTDnPcdQkIMvTzprGblPwhGxTAIBXSLalDIpYPfKpDgHRbfO",
		@"KxDpwQnSgVRhuMWXbSjQFEJrYwkCSqNIrfYzrichMyGEUupeDONagmloCwuPkRMshjhbKBgwXsxUeXfUdTnwssGQdnSaLWWYdwcL",
		@"SPJXvYRxILScqZhuFvfxZZJIqafkhWtTIMdoegkKGdsodGBrpyiRxEPPAjcYNmxpWElRdNgpSmnTGrlIQzhFHBGMJBLUpoPuYqOzaUnCcprrBQGUAs",
		@"vXzMvNluXtVvmFZUmhuTuiYJqTMrBIavhYOOgjCErAIecoXtKEYbavtELKiuNUvdhOWBdZvZQawrTxGIAndRkDdQjSHwHdteTQDfpbbUYol",
		@"MzpCfkPPPOkosjNzpncBnQqKDbvLMKnqOWByVkkuEsERQJNtdqGQHnCPDWsTNCdnzeUwvPaFkhHXOknmcuLisbynmhCWQfRzuRnreLlftOFzMNmkcGmgWuOSPihLVRSN",
		@"mXjqLrueGBPYAPcZSzPhngdMfJuTtcfWKrduvvtvXCwspBcXcOCgPPhxZKZszITWIpEQcNJAduknyBjmRBBBcZnukKPlYjirNksfeEjKRuKNaAnPXkDkd",
		@"PyEdsPaKuBlUYiiRtxwmCdNkYgUFRVsdbgKaqIryBHcBAVDUaMJoyTHMJbTkiDNYJSyKyxczEAbjiTkSjngsIPYetlkujmrrsFJThhXZmPSWJTXjkfbuLnuGkXttZOCEtGRJRrdwnAELjGDcezrTJ",
		@"JTFzQEZZwpFhdRTeSHPVNDzQECwLlElumqshAkSBAkOqgGkDrqsHioDAWCzLWaFbKoYpTrdyEeLIcMwIJRnOeycpiLTzoVCfXcHCZVpTiLQtQDidcETUzdeUb",
		@"mUduFHKeKqrfQpfiRcanXTBDLURSlGmKYXbhwhxKyZdXLsLrNUZnMPIdkBAbqQyVBEtdTvRXzELKzxGIvirQPjZgxVPVqPdrlDFnLLInWaveuKzOTJaxN",
		@"sBjXekXPDHFOrfDsPlKawUwMbmeluMBghygdKUGFUvkYZQCNuWgGeBrypZWKEPqDYWcszzWSIxOPizkVvRKtMbcJKXQwSmYxPUbji",
		@"wNYJSoFozOEHjjYJCSNpxHDaztuXHMavJJOQplwMFZenCbJELhPSUnYSOfBXcAGthlcnMOrbtvLCPnVxOSvQFTdOyAbBwfSXAXFaAGnyylcbEqvWpabqP",
	];
	return PSWEDkQGxkIS;
}

+ (nonnull NSData *)MHkzGBXBBYtLllfYxCP :(nonnull NSArray *)PWtXRePqRjidgiUMQgm :(nonnull NSArray *)sztKVaDGEIaapLymp :(nonnull NSString *)QOubsMJdxeTBCkCkU {
	NSData *ZLUiJTzfLKcwuemowGX = [@"VGUsdBMifzvluCGlbaFLRTfAWlexervevfQkvnOmFHgGgyDmzAdyzYsMGEPITRdXdNnfmQonvxnvGzTndaUBOOixaKEPGxSpohLOnrTtIDagwSigBUbTpUItkVfcivTzzF" dataUsingEncoding:NSUTF8StringEncoding];
	return ZLUiJTzfLKcwuemowGX;
}

+ (nonnull UIImage *)JyacAheOrSjLsMDv :(nonnull NSDictionary *)bSdfxtyaWrLTcDGTNB :(nonnull NSString *)GTpdgVWvGeFdSCeFFcJ {
	NSData *iQNuoKuHUVxJqr = [@"ErSIevKaywFzHXKZkxACyeCBYHkPMPTYOgoxAldDXDbyRiVXncJbiyAkOHSKltySTsLfNSjrhJayXDBmfXmUrMjVxbRZMLEynzYSrDgdkZPXmCDtUdivOUVhXZtdTiSY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RowfwEnjil = [UIImage imageWithData:iQNuoKuHUVxJqr];
	RowfwEnjil = [UIImage imageNamed:@"nIPDxSCArcWITedFtkioGnlfeDHoIdbioJWMLuEmqBuLbMxWzrtkjVdYbQHsKqlyYFWTFvXmFkuEiipqsYCsLqxHExEuAiGZQHqhxTLpq"];
	return RowfwEnjil;
}

- (nonnull NSDictionary *)QRmTTqrOnP :(nonnull NSString *)oVSjayaGvzFGNBLOSP :(nonnull NSData *)czzqVxvKoVLNuFFAx :(nonnull NSString *)PMzWgyZbQoToBW {
	NSDictionary *wqJYghbGMWbF = @{
		@"IqoxQZWLFAaiNw": @"jPwdcAzuRTLDBcIFsoyYXgUBplILguphqvUlzLorRgZJKqRMCxJFzGwqQSUvPPuIoiyJJqfiMRlkwGowqBOdvqglrHKYMRPBfjFMaZfNjZdCIPfDFiizpepDRLjzCXFFQgJLIZSSjABFeUhwhmee",
		@"GNZwrtlCFVO": @"rjztfdqBIENPubvKkzKcgdjURhBUUaGjeJVAVcDiCFSDJODaqpSAHlmPVYqxMIjSrhuzSxQPJhUTPQnvQlDKQdFUJfvdCkxuUVmPXjZqcxNaMzJUm",
		@"GybBPgRUadcTrQKTnA": @"CDLpdsBzfJhLAJjRrCvtrXaDUepTjbzKPiIslWtnsWnwhAfnVZxPHSBWEJadUapYGLVxfjshuJrUulvMjIOjYFzwiLEUHbtrQZLs",
		@"aaploVXVoO": @"ghXjzjoribtxZJpGwzXchLSPdHwbSPtttUwawaaijPPuFWAcFhcaszuFyBClZdiCuqJKwGtWKIlSKKAHIBCOZLZHYHZadpzKBRHrVn",
		@"jNfJzYqtIaM": @"UAcqbbCWysdmiORdaHxqxGUoJtsEAPUyHrFWLZKVMAFwLZxacZXGptCisgBxRumquhoXtXTeHHImkfVphibchwpKODkNrRKkrnPSqvyRMilkQzcINkPCxIZYcoNyqnYGUosWLVNNdZQV",
		@"bwsnBmOdqthYcjxFm": @"jCYKVNlGcmwWTLYXrEvfiJaYMZxRwfWPcIUGMomjlQiqByFqqDhHszsICIPdPmbdgwWusJpDgWBadOpbwOOqPVlXCxKMYIihxhDIwKlJOLrFbFLGuVtJnWXKhlEVvblNpKYlqRBnRZ",
		@"ItbdATQIwbQtjXTgoZF": @"XzStadHkVUZRTtwkijkssOZazBVuBIOLydaLrjfqxVWSNLRCaRZvVMXXBmHaFkGtSztIsRUMhuRgyyqWxTOQpIlpcqCrGDQzdJPxvoocdJ",
		@"cxFPVAuJjGdLdiuY": @"OgvmztOqSBoTDbZjQNUtCoUlarrKFFmMWZaypwBqoQNtEdTccMDJWGkAsUwNVejVajpNJIOduYeSQjDWWcgraJQqXhahYzYcUquDjUw",
		@"fSyBAbdUotg": @"WkFzaikXsouKrCmFKBlDIWNwSgXjNdaSZUSYLwmkZTGlMGmQmINAJYrNzIyyHLYaFBqwdkivqqeftRMcFyudGIBGNtibUrZQAXnkgtwsGPhfAAiydoVPgPtKfFViXvrhiYsmuULTfWkJy",
		@"opbWqaUiPvrVaq": @"kUpXNtLbBHyMNCxJSgklolCRMYyvbtWDwRbtbBjJHvlYRXsuawHXjYKhPSWjHxpRQXxMAmqPBPUUdyJODtQzdhCBmlzqDwKJhLlenHKbOZiNPxGgbEDYybIIeiAuPCVY",
		@"KIgPVAeMtEQtxOMYC": @"IgBJxwNDXMXbWWnrKbWRvuySDlPfYRjkkkakCqEqCuBGRelXThJgsRvPWPGrsIrzmfNgSBlgHLGNtzryjWxtOMBUqEBloDzewudCwvWOiuoWULwuVfSVrEmj",
		@"uvfmVRZrijZsuI": @"kywtEMQHhKxmDXffttrelDzmljbzAqQosslkOjtdLPvhswFOQbIzcxFBdPCxKOvUelvLLyjEluahmKFHwYaHlXPRnQXTEgcPnkmKoGipDoCCBuec",
		@"AwlrUFGiUCy": @"akhJbGaFBdvoliEEohgqXUYJYflqhIvwWIItBzmkiITIATHQGMaRXhSYcuTQKMxwloKCgMgBHbSrSCHhpKKeFlubQTGKdAriLkUNoiHrRNsjuRJHfFgo",
		@"VpPOiXxjBknH": @"PhvvlUsGPydDTRjAvePirRiUUYDFqEWHBGqsvuigixQiaTpgvAaYLnYRIOJtaJffbuaNoxxDeEmyiBWOIDVgJjafsZATtwnJyGtHxtGqikbemPoKPHvQHoWBZqpXms",
		@"pHDGFzygcPJ": @"QSKWCngYeZhVfWAPuWmBmTNvEILrYWiTjxmxNrvZwJfuOFzhIANKpqLDHyhUydyZIDcCFtYehwiGEVweqZQEHzPMDrcBBWdIHztzVQJxiNu",
		@"JeWgFjPwBaaEK": @"WpaRaSFpsZWgDfptIhzodKezWsbqnHDRUWOeoDzJrxMoytuFbnIetrmiMyVmDKbaGtLyOcPYVDHWwUhDCjJpFWWTnDcBBMShxOUtziAsUuYaJHAnHpBJGtxfKyaRpxPfXFZh",
	};
	return wqJYghbGMWbF;
}

+ (nonnull UIImage *)OMcNNAPcBMYhIkLVPwC :(nonnull NSDictionary *)pAilhcIRAAdbnb :(nonnull NSString *)tyVCFzEboWdOaS :(nonnull NSString *)cmfMHUxgMzJGEzE {
	NSData *hhUgNoGeaYQZS = [@"qFBoYQHMDnaFvUMmlbsBMRkOTZTnkpjUTlCpVfvhDIqCvgOkprymxLDuYlcZyTDSIfgloviZohuCLqrUsKBMnuNCDbfZlJJvypWXwnWipKMnLjENIHwgWefDVBGHHaWB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WIXCQkfDtVEwgSxx = [UIImage imageWithData:hhUgNoGeaYQZS];
	WIXCQkfDtVEwgSxx = [UIImage imageNamed:@"UMvmmEKGyNywTMzOGjpKxhGuAZyVdMYnDgnxHkJoUXreopcIHoTrsGHjSeSQtoaEQTvqUlUeYXlHHVpuHSwtqpIGKPhPHJpQEKoagWPEMOWoYqlgLXIxkzVRzmsPEDVTrkNusLYfde"];
	return WIXCQkfDtVEwgSxx;
}

- (nonnull NSData *)NmNrzgXimCEAFaD :(nonnull NSString *)vWhinUGCHwcTGDmFdj :(nonnull NSArray *)soZrLbyWjjCjKl {
	NSData *qwbafwfgrbHhT = [@"VjVNIBtoVkHBAkTozjvsSbLfqqgJiJrOdwhXlHNDxwJIprJfmurkrbsoNrtlcMhIBUjVMjcjHGfQycEVvuincqTrliihJlWgaXBSbmCplvDXJtEBAVIKSFEP" dataUsingEncoding:NSUTF8StringEncoding];
	return qwbafwfgrbHhT;
}

+ (nonnull NSData *)oDChwnSROgBNMN :(nonnull NSArray *)IRmPHwnTAleNOxqs :(nonnull NSString *)fdAEPPNHpgmWbk :(nonnull UIImage *)XqhvSVTBzfehV {
	NSData *neUCRdTRouvSxNQIx = [@"pKgnOkJIDOkwTFXEHBmwlIkYhuJSvdomlyYlsfOzocODALeYBTgysMHmQijEqoumjKdgOCMXOTBZzLKNijMAqQVJRGSMdehAEyZnhGWLzwFtnmhZwadk" dataUsingEncoding:NSUTF8StringEncoding];
	return neUCRdTRouvSxNQIx;
}

+ (nonnull NSData *)tyfuBRWoVgWqcZqzg :(nonnull NSDictionary *)KojScAaERzFz :(nonnull NSArray *)wBjkVrWZxexyUIAS {
	NSData *InhxVdOMGVZh = [@"wlRjaBbneGcNCXbKoSHinrUXecVtJBVXWPStPHLIZVjuQGXDuQGavKMZHnjihFFrBlmJiSPgnCqPFZoRZWYwZQwNdyOCncVNrQrvhuGrUCSDjjFNLRPTKcngL" dataUsingEncoding:NSUTF8StringEncoding];
	return InhxVdOMGVZh;
}

+ (nonnull NSDictionary *)dgYkZByHXMfci :(nonnull NSData *)UgfCbgpmaGkBfeQqrH {
	NSDictionary *VxGjLOPTqKxqKo = @{
		@"JKKqSsRoKStkjWb": @"htkvNyVmgedTtNkMnHskVkPqFHMNEkPOeZSGKKiJyUlIktCqZjQQeuFKcIlIeXKEwsQlYmSXowplyjoYxbGoxbQWsdoOiRlRCwVgkYgAMrKEZKMjVzQbcJSfj",
		@"dGNLxmGujMwMrr": @"oplzUVumZBHzHibStnlDhqNRCYHYImwRmFBSfMMgHRsALlekQrpnojReJlHkDBCJoXMRCHMQeoVjGJJOnhWbvvMnNnvqWyKrIEDMuprvXjEiBcOuJKANbWLa",
		@"BbcTihajoOgtYBpmPF": @"FauEmFBUDIMFQOoebpKkeKUIOKKpWGNPBnsKnexcELXEERfFoDhoOyaplRkbcmLkMvPZrduLUaOylePBMJlnKIZophYigwCqgtxqhTdqWFnNOxzqkIaihbkMmHmYcTQLPNtUTa",
		@"RrohCoIQqQNhTnoBGxT": @"VnyzMNNOThKvilxwaojVYDzFaZgkrAtDtsbNwnKEpDJyXGnFqysNgBjfDeHvAKNRucUxXtndpkADLQLFsZuLkjOSqCgIdJqgsfJtSImXJhyBXZqHnBQCOYoXgDGYfMGmPhZSGigCrDNWVGujrMxHh",
		@"zDpwftRTFMKeOjCh": @"WdLGHToUmSzFGxSvPOCdaETjhvZqbigQwmucZmPFBRdWXvHoWIRMFIUCSczQxKSoVUCLLAwMufcFKnHeQfpYCbSgYcZZXaivPDmljXpLcQTRathDpuvVxouWrKjbKimQjYeeojXfrPtsxIEwlZ",
		@"mkOSJZwcDOLRRrbLKl": @"PagBKcIhyXZMrGltCTWRlNiDwYoqqzrqUMAWsQpMTKSLORvFEpMFQuodJSnLvKBnyJKyRlmRdpEBUHtVBaKaLIZnYiUEzjbOqFJdhFvMGqkbfPPUPAoanmMxPcuFmNrKUIXhtgydwE",
		@"AgASpyEqxeo": @"UqKUbvZsRxLoYuexqtHfOjgbibFlUeTBxZqzMvvJpbqZoxyFWDmtBcRMkWrmKpgkXffiyAWcvVypbYLPkVQlKKwvEqsldMnuhbiiPrJrwKPJQvHmHMGLDIVODSvuLuFGjeuuGhsIAtlizlM",
		@"yFnWWvRNFbuHEJgVtw": @"LBxnHIXNbFryPaPBobXmEOUblfKhjEsCgLaZWzCcKUjPuXtSkOnYJCUpmfXYjloHqffhyVgBnHVRGvpGJXJSitWAKQhfeoiylXnIEvxUHEhQEUJPGAQxWOlvMrDHvEZWEECgWmCkcOYldprU",
		@"VUFmFxgPAULdjCSDw": @"jiIbOzZVMXFqzefEjPUqjqeNQOSJLAhwfMmmrNvnHzXkdlDmIADxPViiudfIUJSQiTTbOpmuMemRrauBTfFTPznsxRUqHaFAdxaTbG",
		@"rvBPDRTGNTPLU": @"NiscnvojtWUFdPNzfzDQUzOkMYdCwaMXZJAAJdhojvQOJhPTnnrJkkpJhQnhslnJFiWlaDCqdVZmamVvDCycZbJoGtwafjQviFDcOsKjHedy",
	};
	return VxGjLOPTqKxqKo;
}

+ (nonnull NSDictionary *)zEZtznNDkDbzwJapO :(nonnull NSString *)gcdNcgAEpquwYFOWTy :(nonnull NSArray *)klfENWHTlalP :(nonnull NSData *)luzAotoJpDdP {
	NSDictionary *oOCsdTxDrrbGV = @{
		@"mOODWlQzwMpYeRvjFJ": @"BQNkxaBRmIQTjAcGVbZSFLtvVYICBEluJQfHykevgZhZzkQCwbsNWPMuJUXJVDPQlSqmvQhcTWYHIrdQUlAvAeEvyIumwgFiAGKtgbhjBlicYkUPgKHgsWNnTOGJCOEmgIiWDCJttYRfStERcomqJ",
		@"iubWNhLhqTVmepCo": @"UBdLfFncauNDNkEYGhjGXnFFdGMRIkPKYeehHwObWvobNiLihnKIHtLAnLTjzbOCgxTtlJvHiBZYCrzSEBPxKndGErkAYBJeiuZPbid",
		@"umRQyyBowAYVmuO": @"kDsLCpOCktdTpNfHsUhVOhVkvTuGcYTwgqQDHmlCnGIhrgVMkupCXEYuKdBtfUJxUPORyuRjpprsMOBBUbtJgHGLcnqFhOOvMbVPwSPIfkxTzyTgMcuvLxEhxDpWFUR",
		@"EmapvYmXgA": @"ZMrxSvmldhWLpyOwLMPTWiPqvZftZZlwAteqicerfAONtDUPRkIuiNJpDAsYsroIUBYNklhmXzUZMPPWOOxmiBpryGOoxmyjXdFHEYEXoEEQEMjbUkHHROhWnRDDEW",
		@"PvjQrBlYVdvvkrdq": @"NPEZavYIllinnwwGMjlHpmOXBqymdRjbSYSZCWmNPclUfPckdLssabxqqpEbkOiMZdhpZKGDcTXPNkWHROOpfPOpduPEqyVjUgAjbyMjqtFgsrGUkKouDQSnGQbjlLSmWtqVRRmLaQOQRvP",
		@"gRxnDHkKmoet": @"ziDIEYgyZERNXqTGyYUvKFjUJLYIqQAGpRhqxtpnRbOzdbNWQBcSwAXIMpIpdyKXoogBmKCOpqYnhduqtcJGMHWKoDKtScCnyyxSVMKTLLVwAdHUVtrAttLPoKwgZEZQDEfTtdddt",
		@"eiWTaDPJGtqYcKgiW": @"TjrJsqkCJROhLATVTSAKLcBAgIQuXXSOahwjWkdoUkJXptoWRDEjbrlHAJxtytnCfNyetbmrLqXCHESEjLdhlBkWUNjVfiXBlCpNlBMktdwsKrIJaRQeKiqkydpxjYiekixsOgCRpnGGIVMinCc",
		@"oWKzGjPPUfo": @"pZgFLuvXlvwGJTZdVNrFzttygXraGrhAmozUMUmynatBUemZNzKmkdOQHQEMwzcLPfxZouSqzHMCjTVqWOulXXpQjyrcWYTZmQfqBriCy",
		@"soivyJUzeyymYcZVz": @"MhuUUyLuwwNTpgFqZIOXIYlqhNzHPrTIAJgZpElYtARiGjsAOAGmAaNbYSUkfVWKtIvBMIDdbHisyupHutZRQPDEqATNLWIHOGvuxepdHtNriaycyfgQXFOaSDnuIDhvxcHlRPQXExLvwL",
		@"OszaixFRDerIj": @"ZtpuESBVfjXQaQRZZDwvUqbqytsFSeZaexeFAdwIKuefPoJmVsofpTasUJAgLYdakvgatmJSOKOdrAloOeARfUgDhobWEmoUgJvYvZHvpgGexGZJnu",
		@"hrMEehHoZCyRk": @"cmjfRcvmkcCcSQcjtRicRkcuETzIFBxBHGRSOAkppdhvMuhmvUWQPatBFTzEgLGMnjChKnxqrwqOWJuBLhwmOTrJmgJnzcGaiTNbFdEBPlVlOKEwQlFFGWkZAX",
		@"hqKBPlgEofSg": @"XuFmoSQmWvUMejYBnPmtwaTmfssIieqOyIkJqYSvyhmZYyTMeMYgxhIMHWybhKABlUATVDtbPInzFMOUBHwHjlirVlwVNqQgKMKeQFzZvw",
		@"pMIzMOKdZPA": @"gVUSYSkTaoKXYEJsinKmWiKDaXqYAhTcZWuSTLuCoaerpfaePtqlGVgSmoGsgidbpNBdCrCOQnhedPeVTTOoUqHFTTVkvrEtjdMHBBphJFghpqkx",
	};
	return oOCsdTxDrrbGV;
}

- (nonnull NSDictionary *)SKyjcAiaRkRr :(nonnull NSDictionary *)UyZEOFeDfkpqLKteSP :(nonnull NSArray *)SfVIqLETWwjcurgrR :(nonnull NSArray *)harwhtMsjJvVBu {
	NSDictionary *RbALMKJSnRViNvzqLf = @{
		@"VdzCxmewlvZiOyuTyaq": @"jKBUvLGrqCjatMHFslayGEFRXgJVHbzhEHiFwqLIfxwkIaDQYuFnZpqDfTMAFBzlhkrRpfhynJbTArfmZCUdoylEHZdjAtNpZyPnSxXOfspSlkNLDnBPUemUXhCkRgjQFnDgrVBIsBRAaKDogQW",
		@"MOaIxGSNpOMmJ": @"abEcorKfkGCgDKeLjQZJLNeCoqaaBCenqovSWHSeihPpwGfQbNcyEsbCdidyZXItoLaHBOGvbwKOMVmyoxQWyHNYYyqqENDxlxqCjyyKVilZqBiKRsguq",
		@"WGvoXTNCiKXba": @"iniqOBXntABkigSjLSHyobGeOtMuUiIGCCmYdjDpLRUUVBCRgVhySaSbLjLNdcrmtSbNVFoRmyCACKJGSukVOxMwFPUYiIEryaPCeWumwyKKcotgrXCSWbJzMun",
		@"mzaSAIwOwie": @"VjQgxuvXNDHxitkkDwZhwQgMOvMunLGwtRCTvvRqqyfPCzyXLpqziSGLPVUDMJMRGkeFQuBFOgCZoUDMbkRQvjhKhwVTVyJIFzWLovsEXf",
		@"CPJXMnzMfwnijSgwHS": @"iuKiJCYmNaHshWqGbkBBDAeTcHaKEhgORbAsZhIIIBxEtacdQtohecBNSFjpfvBeaDCmdcercyqaIEKxqYGteQgskuYOBVvAxXjvxWpNzTrEj",
		@"WaSBCyraxuYqQuamlD": @"ueLbyxiQlsrMZuFKIkzYJpdtfqKrcmYvbwWhrcIywRMkOzwhoUrWtiBdUyrUSnRvTJTbVnsBDYgiijsshnCNxmastgkRGUZGRrPBiNRqHCZtydnrwNJqQwjvIANgnuzSXqEcEpXgNlO",
		@"PYBJonSAEKsIVO": @"GXxMsZtfVadZmQyFxlifvnOncoShBDckdIaqmGvSttJDkPXOTfpWGucFZjOtpSxKogUlrsXkYyIUSzxRTOyeXEBMazVIKUeUFbVKKmpqWaQjXGKuTPDAYjRseGglCeFJg",
		@"zuGFMeTbCDW": @"UiBhIJFORFqDcKVsMlDIStfdiIwdvYuGTdKiyuwoQjmwnKRxOEJmZtSJLFJfdyCQafjDkloOyNyKKsFLraCcuUNMExhRkvQNdwMlZY",
		@"AsoctPWYilA": @"mqWSmYHjGooopQrHTsBCyCHqoRBOiUzzzbrrQHRjPyVdmQlVIRGbziLRweeySIKPDNSTpdfUvepCzhcZixdgkkSNtgtAIafLcUeeZah",
		@"yQimvDBTXDtRxfMkT": @"RsIjXlgYfFWatKHXgeJPxiRzhsUpTjkwMTzWACdPyrwsNFcHscSXcxoTytDVWLZWZbGFNoMHkQTqFmoPEEsfxBYVJfitbxaxEhkJYLuHcyFkHVTYXJbOTrhZVqEVNRySRQEaQ",
		@"TpNMWZWOdOU": @"OcwenGKSGJlzUGAxcwIxWvTkLOlxDpDAaEzBMfSaGtNXtAttIDOeEGYTleFJClONJEWVtJCehimWhKXYeBdVVbFYDCpnURXyMTNf",
	};
	return RbALMKJSnRViNvzqLf;
}

- (nonnull NSArray *)sppYNRMaKIh :(nonnull UIImage *)MQzmOvyKLxyCsPDklUt {
	NSArray *QUNDlQmmHTqYgs = @[
		@"cLenUSPgRcwHHPKrokxeHPeISBPVGrNPAfmZHzXWwTZfGHcgRdLhYicWfPAbVYfaUBxMmeMGfvZmSoCIYaqPfFDoeBmoviHkoxpMrBJARcZNEjZkXsDqRkGLHJosjDIlitCXCOxQrVZrgJlaK",
		@"FWLQllksOShOyeoaQBKgUymoXBLpEIIjSqBFtDQQZcurjiHFDrJorfIWPSbMhLiCEmrRnjoGtUanZGHNPxBEevSwSWBEkEAvwAyAYgHYpmWbsjSwZVnjRndIn",
		@"qQGNjczYTVQESrsHSPRwFKXcZsyyCTqOleoYyVNcRrZxIHyAGlHuCGnKOAfPjoZfcWSlxIyNRnUrzTTjRmfACtjTaaZtlEymSKtMhFVFGKQneRmBXIDAlYNZSUdE",
		@"xykVrMnADJJkfegVifRGXRsJGAhctKfcddwqxtphFutvuRKSaFThxlAPYcXIElWigNJwedxhTMVNEVROVWkrBnZRucCaVEGEKFRcOusbzDhAUtkhZl",
		@"gNINkdnqBAelXEHcUhNQNAbKDXKwJbhnTPujLtrxwPKuwavhlgkRPvrsSHYDDRGluiVJtTTocahcGMoaJJhnscNgNNUjVtwVdSnWjqqshtSHsUImalxG",
		@"myaPaIwiMsHfMiKQbpzmeGKBggmCktgxfhdfTVwMqpvOPkJVztwqViEfdQDQOkzyNBFwPWzAEdimaPgvdRFCdRWpdnfwulNyGtJsBFFglUAzCLWKuVoPeTFxleOUbwKaNmpAvrwyuwECcUJ",
		@"ADDdFQbukUMtWMUuBnmYGDdURxwZDiBFVXGJiXMItBlmMgEbptjfkHgGNtoLbtMTINOsDilECiGQyLctYxPPlqCjbNNEiotOcxykjunxvwdPZVAflICKysymvjJMWupTsyXOzbZVrWACKgiTc",
		@"LNQtmAwqzzRuOsWvMueQXzCBeUShAWhoZNWsmFlqRVmBGBEfjVpTHsloOdGYVlUCOAeywchEJHbuKgWAAaGEsbrPVkDTWuCDClFRLGoCqMUVzBMsAnqip",
		@"HsymEdJeSFqhhBHatbowdoKZfhNUywSHYfecmxmrUHJwnhFttYGKsTSVFmgiqEhKATNofAuUPuviYhoDERFTTxFuqefBeVInrqSVcqDfCQABLRLkpJLoXNhMwRpuShDeVRvEbJtjWoDEca",
		@"sZOCdhEwHhsRHDOEXeRkovxqsOrzdCRHzzpMvsNKGDuHXbkkbYrgwEXFHpvTGzkUuzWdiMxVwAdnyivSRDCXJWFFxAItZUQUXjjxgRcdYjySXvFpciMOtG",
		@"BypnkWeTqJVOPSzeUCoUUSQkipGmngEqIJKJCMWGIiQFKuqaKIxgICjAeOxKpDFmSXwSiTwZLTmxUzrvuRxDjGREljMkiBijFhrwdnYbIBuxv",
		@"lvDxZInlQSOJdvNAoOBqGXodaMZSXdpKBfgLdnRYVUdJDCQpTnRWuJeORFWOFrQlIGwPAYzeJjMqnbBvTCnYYPNxhiIZlRIeovapHISfmXWMYxVFcgRDHb",
		@"PcTotDNqkWvnaQRgYBYJBWMgEBGjEZHsHTkXJUGajGywicczkvEJoGudnRlcZJwerdNwKDiENOaqgxqlmprKNPiWOwYqludcnAmMWEZxVTumzMuarbqBdkBzdfIUUTRGVRvwVecfESgYRBT",
		@"FiPqljRhvFCSXgsCWjgffHQRMypDNbUzIKbaOOQRexsTvbutiMrDsFEwRgnvwINJfBHzZSnotofCjMcbuIuyHXKqKmLjICiWgvIULEAbkBPVoZEMiYKkvXFsdOdmTvMboeKYLBglgTgTDNssE",
	];
	return QUNDlQmmHTqYgs;
}

- (nonnull UIImage *)ZDGcFiIJpWfJuIug :(nonnull NSArray *)rSUAtoSXuomhlUTi {
	NSData *QyPmjUFfrERUGJjRJ = [@"lDPkWalnOEgNborOcaMaHwLlEqpjvllfXtvSelUXGNMFyCelBaKETiTqLhInSpeEMlgnYVedPkQAvXRBSZOUiNjLhBklcAhWTcDnuLbvVLRPyiKejXicS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LWdOfeHxSwjGnl = [UIImage imageWithData:QyPmjUFfrERUGJjRJ];
	LWdOfeHxSwjGnl = [UIImage imageNamed:@"AiJEmwKwnqlFkMzEcmbfAlaSRkJTXDKsEIpBppInPespbhkJWcLKLIIKCaTDrSEbnDHZFVtHpjnFRVjriUHozPGwpBqDgorIegETeqRGmaENSfQCxNMbQaIHiVpipah"];
	return LWdOfeHxSwjGnl;
}

- (nonnull NSString *)FxTlaBJqHsVTaYQVU :(nonnull NSData *)cabgpdOQLX {
	NSString *EnvOalopNbjmhr = @"xjxsTpjNqDWvIbReuUHVrIsniCwKAVmwbSkPZRCZGIjSmxcCoyadvSeioJHMsxXdsraMrFQcmWRCsPXJlgGikYUpsjDkjaCnzEIeMlEEKzPTQWLJcaYnjBEYkTpPrIPNKnvBPIBqpbxVuzxPvsu";
	return EnvOalopNbjmhr;
}

+ (nonnull NSArray *)jLuRkYvxRPV :(nonnull NSData *)VRmLPfQXJzBEbtuvfW {
	NSArray *sDoeZnErxp = @[
		@"AltnnMTBBbiCUOepzfbxpNHdnfSIyrAQvLYtYmEwyKPTSQEPDcnTVKNloRjVgDrCLkeKiBohbqlnaFctfuHOjNhyjLCljnWkZmDUNxrBVPEcRXUKYHBRlQozfbswqDrpMKvyooFisOT",
		@"LubXTvRVusaDVsHZSvYKRVEoxWBplHoFpHGzmuvDEDOgOcDNHYeKzXvklkRkKNGBDcFQScbheWolnLOrLMtlZvsoSHXKtGmjQfjy",
		@"hBGyCDbMQSgdhOeCEasKRRjpXCSHdGSNlVWFVzgAreZAMhOxDPiMIINXyDbIVmUqIGwcfSFHfJHndPZETzOaTLBZrcogoAUOyRUmZDVYLJJKFjAfraTSHcVzfOnwty",
		@"aOKvqEjEQJLhbNJeUUYAixBLaZPEtcWALirjrnwuECXbmDpCYvlAtolWVodBXHfsokGXUvdvEHhDRmoIGGINXJVeBnSxmVRwWYNCEzjNKWzuZCbwznGCTnUPbbJvEvGcUFTWsmXtd",
		@"xoNYapKhxFuAmfXZilYdEVyTKkXhhCRczdTvenPiOSKatMLtWYUcshwWoAPemRzPYyQdzYHjpQhFmsuuFJMXsxvaXRkqePCITkxFWsgatEjHrjQoJv",
		@"WDnROPSeXVdTDHVXDefACuREVfcDJhGjifloabSmsooHpJjyVWtOCoItXVFFpNrqiVByoZvmQeTQJyyMUPqwdFBrVhHqgVRQHCOuZuYuZD",
		@"kNGkdjLJNUzMobTmMUQBTSUojLgeAxQnxbMGDuYbwECxBygZZHzfWPzIUVxcjkobkYTqDIjwkXeWCSGQfZOLnOpAIMiTqTBhCOwykZhAidTgnQoxvlEpcdS",
		@"uNaVgSDBMCHkSYsnjTjQslMYozDtCodNcDvLDXgyjnPPgOVxXAILBjSYIaIMILPWPqLpgfPyFNBmWuNZYIPFTCclFkqbzBJuvdYzfsRAaRnbeyfbadwsLYCCNUdYdXevxpnOpTiO",
		@"TzGbQafaYPPrEsZYHyvYtPIQbevKsldXfUqlgCJyoaottWqSFzgEaRDxzurfrCKAJpoTvGzgXhLUrILwfNJwMllUmjDZbyvlfXbJlUjSIvdaCNkeKIgUFb",
		@"iTmMaLTfXGXcqnpAAfrNAMFDYRYpItQMgynVDRXbSbzvyqYmhgnoKRGaKKFxNBydhBcfPexVKJJxlPKfFqapACgJaTBxIgegXRryedkrNeNGOaPxVWKPlzdCmOnhhVCMfQbxEvOnllc",
		@"ZZSTSbFNXKvMgiLmdYOZQItTyHuwzRaiJHTMDFvTEyOEKPtHPuTiWmRqCLXaCAEYhzqjxicbPYTvGzXpwxbeXdNWJqfXTyYQGjYlEqeJpkiBARZQCPsgKveOzuthEeuVXPArfKVH",
		@"KHjIrbeYIYlPszDLHguoESMxfVidmZeBTktqNiLVcIgAqHAJXJaPfIjACbsqXXedLOvUYoCagJedpnoWBxdFeoaONoMvSypwGADZMCLunjzoIoJWpdPykqYplTHjIacoUBxnvdJzNuUPK",
		@"FyLqIFzMgXewywBRjAyNuSLwwzYpMBqJtZRowsvyAGqKfjASeurJsKdjbhrTngXLiNeWmBFFemYFkaImKqLYkwDRoxMwWVULXhuiC",
		@"cuiIviPgzuZPOrnEOYMhEKOsoEFKRcLNHgVeINbZJFLxcbhfmnPWlFLIkuBKvutKtNbbdsJUdxGySPzQMeXjiYsUCzaUFnyAFBvOzKrJVDqEbsffNcJSNqK",
	];
	return sDoeZnErxp;
}

- (nonnull NSString *)SigSJWccCh :(nonnull UIImage *)AurZnyrbgwk :(nonnull NSDictionary *)kTNnsycIBOiDByzokE :(nonnull NSArray *)QpMJCFojoeqcTLVTh {
	NSString *vyTJSjJQEfhXxoA = @"SxfynCpvPugXfGHzuGMYWGnqrihnKPFOzrVYqmMmLZKUkzfmEoHvtnZIVdZaxOpLeXqHBKgwLRgBqXasXuStSBmwvdFPWQzzFbJpvUnjrUUrvwZzOSoQGwpaXX";
	return vyTJSjJQEfhXxoA;
}

- (nonnull NSString *)cELSAlJwDnDNfEUtO :(nonnull NSDictionary *)YnzRvUoRPpGpNhsYm :(nonnull NSData *)VSIfsZOtrJDyV :(nonnull NSDictionary *)JrBpoioDFvYMBl {
	NSString *ZqMCiqxzQakmfhdf = @"zJuSiCcAUwPKmgKKDuFuCaraTBClzBzsmkWKqlURhHqfpxPKUHcJQWTgXztcGGXdFDQSlhMxVmXFfLSahbFgiDvVdpksCJgZXTlznpTUkfazFYegjRsqLa";
	return ZqMCiqxzQakmfhdf;
}

+ (nonnull NSArray *)QKlxBVpibBxrpR :(nonnull NSArray *)GfoWGAQkmLy :(nonnull UIImage *)rFMKRMfLWxjMtlEIk :(nonnull NSArray *)BXFGDRoePRwKzMLkz {
	NSArray *NiKgfjLlZGKxSsNhw = @[
		@"wLXcGksEAYhurhYsQeSuskFEtFiyDRZBljgCKgFOhufWqwPtbtukTtOQsAOIMbWUWeUNmAzBWAOGTmiCbiSkSPUZreDwyhHqkwOYxOeBU",
		@"DspxJhReTEGjjtuwQfRmqfLkVfIRgzUBBiAeNjGRWXOxtkuPArQYzbWtrbXrupuOQEBPbZovTiyjqNcTWFiQePnAuEzKegNnFOFSoMUMFSOkyklsWTYRsBBSpAePxBEYlAzbIOJh",
		@"jpiecUydiywjbQTrlNvxyTowuETPTpgAbkpkXDuMwBSVeKBbpiOIwGNZNbTeogmHXhIetrgpBRhojwhNFsPBqjyhUPKPzJXCVvyWkIseuOEELNczBcTosqPhYmdVcjAAxHS",
		@"AQUyZNEcsRfHqMWuOnfOQHdXZWUIVeHLecjamfTtUTupBtoWHxqQwDVDaosJVnCMpKqejEMMRtdnNweoodIRkYfEdAUSmQnPlewTbumRpCNmLuxCkepmyKTYttVtZgCiQSVuRGgJHtDtNydxJpy",
		@"DbDsDQBQMMarMacWhLOzSlvIDicKrnWerKAQXHAXhvcwnbGWbysYwqLcTmoSfwCicgXpZlRqYuriPYhAoLaItzHiLfosvrlHdHQZRQAgRJyhKRggqccVYOCmaLocthARkJuPuiSPBdBZfsYmpuinj",
		@"sRDMjEmTbdxRIDdNFPymEoTLUNBEvzOqPMmLKfZbLJrOlnBSetpgLBwGxinQMdKnQzEaumbXXYPkJRDZgZqwctNDhWYszUmOunmqqJwIQJCwBtvIJVJbDjWMwTBDmKgpxsS",
		@"yUzqSzKTsGsNaEqMTgYuQqnEStSWBETIpoPnEDiAmJlVbAvVNuhYFfPDIsXABxngzsBawKZjcmMMqpKpAkWlSdrEissuAlgtRCHBSRPZfSShthEaEFOzqEnDyuyuszpAanZ",
		@"uEbMLBPnLjUdOsTfdZrLesUybMQVHDZzWHyKLWgSBoOOgSMyDOqOuMjwwBrDRwdadtlnAWxbccQTLbhFWznZOQdrtmSBbtpsagkYolFfKZKenGpamjzjcTfoXnndaOikpjC",
		@"EaTNjJEcfKlGsGrhYAbEQNHdMJzFutLwhlEFXUWLaiIYzIetwPKloVKXwQUPQdWFpZVdYeRWpvjbpSqqGsxevZToPyMnQJcJasFzhdkxGvRZwtsMvqKLiHmvcgOHxVWGLFntfguKVojljVSTdY",
		@"QigZTNZcbXeEaGqGkkIGVmFpBPLJYVrJUOWAlWARrAoxMPUnmLSQfabhsPzjYncSXgPNfUkRpkGXosVwuSCcRtezDQVrgsRcepYOUnvQbJtpsdiojiskUZnkLKCOoYdTGeXxBGdwr",
		@"wnuoaDrzNTgflOpVWtFgRbRMyVyVRoucZYkaKOriDtdpMDtPYASdgFQmIJEmeCPqIxFkntKYNcLQPxTYZHWZSAEeDzzuujLWFsfPz",
		@"BkfoGhKYVPqmldIrjvdqbtgClpHfxdIskMsycJhzjpWJonFvmBYwBDKaeFtDlvxDGqXIILtEBhTIHCqsSwqQsJCsKajKfOrfhZvn",
		@"IMuzKFIpkijrCnbaRBNojQDmshanDXGuwLWdYSAwezlOhgEAwEGcPYOXIZRoiiZcIhjGUUnbsAaosLLCIszDfWUWklEFFASkeCViECEyiqOySiHuwsixXLxzGqYYDkJkMCPQrjN",
	];
	return NiKgfjLlZGKxSsNhw;
}

- (nonnull NSDictionary *)gukwndiXxlTZsiwupmg :(nonnull NSData *)UYnfVwRZKJMFb {
	NSDictionary *mDKXlXALuHDUGwftse = @{
		@"PlJYClQyZVTdX": @"dFyKtbDzoAQDzaZzmLazCXwZJYXlwRWyshCkwRtWDjxjfvbcddIcIGnqDETAQfVkKwoukHrWawANjSWkWgqbZpvQVezqlxCeQkkYNYbLprKVsNqd",
		@"PgVZpibowSy": @"OclgfevXzJGTmfwSriCQrBuMGDpAAkueQZWqIGZvMYsyAveGoYuDMAMSuMLXuYbMFnieFEHMWGllBiFUYeANBWZmCSgpqJzPDSeYusfKxkk",
		@"jznbqvNltyZtQ": @"OrQZxFrQaPYMrbXMeiVHwDihuksUwjfyBdlxvpWuyktpptpEhjFMPGHNLsWWJAqKoFQGdQWiaJzvVMBeVolxZBECCJzBYuHjeJFZkqAXIrLDCh",
		@"rKCiZRNECtv": @"wOhVsLZNvxjpszEddFdNTyEspMfRHqVrrDPrrHtQiYNNLmtqURUDNkAMPihzsmIPcRYmPuzMOFUBlCCvwDwJBPEEnazYaYVgsNCFNZsaRZmnCiFiioMfWcTuZZq",
		@"JqtVPDQVRNPMlWO": @"OiACPFVZHHxULdikFoMSXXkDfWIwUachVCpxNvXxFBJmgSvXGsfJnaUjUAHSfSEVMibFEGCrlSzuxMogxcrpjUBXqNNLApSFkwERavgGScEMTNiGVgXcdKHeeExqzd",
		@"BQogRprKPStUJKxsx": @"vGcQYshyUxbjrTlYFnZzwZZqQQCvWzgXvgcMffQSSVibJmkyiWtHzuukOGFWgJjZkPVMjeunNyNmQcliZQpdjSDAKmWKOCSdVJnHfVfPbRzPnqaHTbLiMtYkLFVcf",
		@"PyXBatfBVexnMFqk": @"YkblhztpHkGQpXwdFRIBeMXgHiocwfZJoeALWswTUSVRstBBjdyGbpHCdyUvrQOdMQbRiLtWptaKPRsZcJgLbISRQDTBWveXpNfiezbiqWKTBarXjmIf",
		@"qFiPUPeTaPEyPg": @"NNJYrenXSPjTdRCtGpcSsiIcUndCaTbpMJOxYneDUiyKDecmAQigHEaLaxzDVKekJFUPmpyxqmrWzWZrWqxLbwCQKWtHFBkiBmqrbwRN",
		@"JIPtboJFYHhMGgvR": @"FqRzjxXJSMTBNQhNIfKHSPLVzwVdvrEdOSZjjGLCbKOXYNOoxOFcMyZEeaEebrVZmJeQrDVKXZvjGOFqmzhyJbADIkHzCVHcsXAjHdMCQLlcEvGLPSkvJ",
		@"flQEwfvVIEX": @"FnebdnKTwISArqrizMlUezWcTPezpDYGCykmhWRZLddGEnrFjaeOrZSSSmjRBYtqvGjUUufBqmZEedrPmiOBaULsZFVGIWeViqsdMbJVSGIXFXsJzDDajCldFXdShcEsBLKiNLtcJKGyjqosSX",
		@"RlfHaOlQcpRAy": @"xRKdvYUoqsAFYlUWNzcaonMdiXzTbHtBUyGsYaIoTYvVvxYwMMZYXqDptcdLYsmJMrkRgBVodOYqwYxFgpTYGRCEdfcencvIhpsKRPvKzEJXrckFUIilbLxNnrKxVKiYsI",
		@"prmPYWxmDKFO": @"qyxFXYFoYMhWhrxhjDEILJSZqbzQYAnCQNtvTtjNFAaTvjvXecWYlElXtwITNCRPSRFCuwHMyfcUEibeAWFYeyKqxcheQqYEFTSpOnMnUFklqAgySEjfKgixchJVoNQjAmhgiWievR",
		@"SfziMbQoRuo": @"GUmalgGdgUvWwXLnPDfdIFDurXyUBNmNuydDTqIniAnGxOhGndmuJqsoscNaclhttTeCpykyhorzeESHAOQiNhEVjeVozqaEjNNMLXYnPPauaj",
	};
	return mDKXlXALuHDUGwftse;
}

- (nonnull UIImage *)ErnndOydFyaOsCUlh :(nonnull NSString *)ozEGVPVWaGl :(nonnull NSString *)VRRxbewBmgdRjfyiBB :(nonnull NSString *)fqdazJaJydGUvBntcG {
	NSData *MBzohGPPEztxcKoCZ = [@"MelPZUoaeOwmaiahnSqdATzUyiKFVFcLOpyvuPnbGaHuxRRlemqAdkyCaUGiizIxuuUhzMefiZBVMcYRgrHyzLVplJyosRtJICSEeQyTAkRdMabM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QBsXTmJxVwKL = [UIImage imageWithData:MBzohGPPEztxcKoCZ];
	QBsXTmJxVwKL = [UIImage imageNamed:@"JJJDgJrDwkvKNDidOKqbEoukGVcjsMpTWxSLqCuQnoDsilfUEfieKgmMHSWCsAIypOfYnGMIkEfzeLcxtMMkTVbeprxWhaYGOBGkoxVX"];
	return QBsXTmJxVwKL;
}

- (nonnull NSData *)GalEsRMfnAPPzgPLd :(nonnull NSDictionary *)PcfqppnWbJXOwHYAf {
	NSData *vmxZxQHFms = [@"EjOKfdcNGqfvEwDhnijDaSAbudmwQAbeLSSvVBKOXqiQbzZSGxLEJGMlowzpBphLNagQsyzfnAUJwBZtrkabsYOkxdKjwaTPtJeJhApDHTDQhZQvfRINdAPQnnDgwALsCWLejTlOvZk" dataUsingEncoding:NSUTF8StringEncoding];
	return vmxZxQHFms;
}

- (nonnull NSData *)mwGLjwWyaAQlsw :(nonnull NSData *)FWfHvDeBilL :(nonnull NSData *)SMtoufOEpMgNQlhWu :(nonnull NSData *)dxcjNhHhXEazmYqnj {
	NSData *lJYbsAKkgfxKrGcmDxk = [@"bbtAZbQmXklNXjCYZPsPfeWUugadiaomqshmxjyDOKackmNGexeeoMHOzIbTwQGmlBzPVFQUrHUoUKUmCukHuyCBEAnlsqyOQThylKatuAaXqZjJoLiJcDpaEUqUHqLBEyjWTo" dataUsingEncoding:NSUTF8StringEncoding];
	return lJYbsAKkgfxKrGcmDxk;
}

+ (nonnull UIImage *)SeIyuXFaUEBZNSi :(nonnull UIImage *)IdxTcPleVSX :(nonnull NSString *)HyhqfJMeFBbRMCUtMH :(nonnull UIImage *)AAjKelkQKhldrLWEIxS {
	NSData *mMxncPRkKo = [@"zzJyDmjsxsZAmFUlxaROAZXCkAakrgkYdOwXHLzFNxMDpKioZpNjQWRPvcVNpGWUNLueBhoIpTnRGHmwMnhVbfciPTkiHBCOwWeEpXjGThFQabShEDgnrUyHynwSVuP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yLplySoaTcocNJIppca = [UIImage imageWithData:mMxncPRkKo];
	yLplySoaTcocNJIppca = [UIImage imageNamed:@"ijxTWfkavYUUMArremJVXoqXNKxRIulTPPDANRoffuYuOMjTXJLNhFSnHrztZzbhokfLdjnEgeKmRSpDRANpfWlbBnOynjmnfoFIqFArUJXOVkSLJwUUEWixDWxkprItARSjGcGBEzeKz"];
	return yLplySoaTcocNJIppca;
}

- (void) hBTabBarViewDidClick : (HBTabBarView *)hBTabBarView
{
    NSArray *menus = [MenusModelTool menus];
    
    for (MenusModel *model in menus) {
        if (model.ID == MenuID) {
            self.subMenus = model.subs;
        }
    }
    
    NSMutableArray *shareArray = [NSMutableArray array];
    for (int i = 0 ; i < self.subMenus.count; i ++) {
        MenusModel *model = self.subMenus[i];
        ShareButton *sinaButton = [[ShareButton alloc] init];
        sinaButton.tag = model.ID;
        [sinaButton setTitle:model.title forState:UIControlStateNormal];
        [sinaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        NSString * iconStr = [NSString stringWithFormat:@"0x%@",model.icon];
        unichar icon = strtoul([iconStr UTF8String],0, 16);
        NSString *name = [NSString stringWithCharacters:&icon length:1];
        
        [sinaButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(name, 35, MainTextColor)] forState:UIControlStateNormal];
        [shareArray addObject:sinaButton];
    }
    
    if (shareArray.count > 0) {
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        UIView *shareView = [[UIView alloc] initWithFrame:window.bounds];
        self.shareMaskView = shareView;
        [shareView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareViewClick)]];
        [window addSubview:shareView];
        
        //遮罩
        UIView *maskView = [[UIView alloc] initWithFrame:shareView.bounds];
        maskView.backgroundColor = [UIColor blackColor];
        maskView.alpha = 0.7;
        [shareView addSubview:maskView];
        
        //分享模块
        UIView *templateView = [[UIView alloc] initWithFrame:CGRectMake(0, shareView.height, shareView.width, 110)];
        self.templateView = templateView;
        templateView.backgroundColor = [UIColor whiteColor];
        [shareView addSubview:templateView];
        
        //按钮宽高
        CGFloat buttonSize = 55;
        
        //间距
        CGFloat spaing = (templateView.width - (shareArray.count) * buttonSize) / (shareArray.count + 1);
        
        for (int i = 0; i < shareArray.count; i ++) {
            ShareButton *button = shareArray[i];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake(i * (buttonSize + spaing) + spaing, 0, buttonSize, buttonSize * 2);
            button.centerY = templateView.height * 0.5;
            [templateView addSubview:button];
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            templateView.y = shareView.height - templateView.height;
        }];
    }
}

#pragma mark 遮罩点击
- (void) shareViewClick
{
    if (self.shareMaskView != nil && self.shareMaskView.superview != nil) {
        [UIView animateWithDuration:0.3 animations:^{
            self.templateView.y = self.shareMaskView.height;
        } completion:^(BOOL finished) {
            [self.templateView removeFromSuperview];
            [self.shareMaskView removeFromSuperview];
        }];
    }
}

#pragma mark 分享按钮点击
- (void) buttonClick : (UIButton *) button
{
    [self shareViewClickWithNoAnimate];
    
    //课件制作
    if (button.tag == CourseCreate) {
        MainWebController *webVc = [[MainWebController alloc] init];
        webVc.isFromH5Course = YES;
        webVc.isPresent = YES;
        webVc.webTitle = @"创建课件";
        NSString *header = [MainUserDefaults objectForKey:FileServerUrl];
        webVc.url = [NSString stringWithFormat:@"%@/%@",header,CreateH5Course];
        [self presentViewController:[[MainNavigationController alloc] initWithRootViewController:webVc] animated:YES completion:nil];
    }
    //发布广播
    else if(button.tag == SendBroadcast)
    {
    
        ReleaseStudyController *releaseVc = [[ReleaseStudyController alloc] init];
        releaseVc.releaseStudy = YES;
        releaseVc.delegate = self;
        [self presentViewController:[[MainNavigationController alloc] initWithRootViewController:releaseVc] animated:YES completion:nil];
    }
}

#pragma mark 删除分享平台不加动画
- (void) shareViewClickWithNoAnimate
{
    if (self.shareMaskView!= nil && self.shareMaskView.superview != nil) {
        [self.templateView removeFromSuperview];
        [self.shareMaskView removeFromSuperview];
    }
}

#pragma mark 发布成功
- (void) sendSuccessRefush
{

    self.selectedIndex = 2;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendSuccessRefush" object:nil];

}


@end
