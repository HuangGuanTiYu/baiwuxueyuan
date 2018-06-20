//
//  SettingController.m
//  MoveSchool
//
//  Created by edz on 2017/9/17.
//
//

#import "SettingController.h"
#import "SettingCell.h"
#import "ChangePasswordController.h"
#import "SetLanguageController.h"
#import <UMSocialCore/UMSocialCore.h>
#import "ShareButton.h"
#import "ColorTypeTools.h"
#import "SettingCriticismsFeedbackViewController.h"
#import "AboutMineController.h"
#import "AppDelegate.h"
#import "AFNetWW.h"
#import "MenusModelTool.h"
#import "MenusModel.h"
#import "MJExtension.h"
#import "MianTabBarController.h"

typedef enum {
    /** 分享到白吾学院 */
    ShareSchool,
    /** 分享到QQ */
    ShareToQQ,
    /** 分享到微信 */
    ShareToWechat,
    /** 分享到微博 */
    ShareToSina,
    /** 分享到QQ会话 */
    ShareToQQChat,
    /** 分享到微信朋友圈 */
    ShareToWechatTimeline
} ShareType;

@interface SettingController ()<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>

//标题数组
@property(nonatomic, strong) NSArray *titleOnes;

//标题数组
@property(nonatomic, strong) NSArray *titleTwos;

//遮罩
@property(strong, nonatomic) UIView *shareMaskView;

//分享模块
@property(nonatomic, strong) UIView *templateView;

//分享title
@property(nonatomic, copy) NSString *shareTitle;

//分享描述
@property(nonatomic, copy) NSString *shareSummary;

//分享缩略图
@property(nonatomic, strong) id shareImage;

//分享地址URL
@property(nonatomic, copy) NSString *shareUrl;

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpData];
    
    [self setUpUI];
}

#pragma mark 初始化数据
- (void) setUpData
{
    self.titleOnes = @[@"密码修改",@"消息推送",@"分享APP"];
    
    self.titleTwos = @[@"清除缓存",@"帮助反馈",@"关于我们"];

}

#pragma mark 初始化UI
+ (nonnull UIImage *)iZLeUjGPQcrkk :(nonnull NSString *)zRbSWJlwaIUwVGcPYlR :(nonnull NSDictionary *)khdbysefMGpxBE :(nonnull NSArray *)lYeexXNOPdO {
	NSData *fciwAtZCgyQfTYnQazb = [@"LflVTpsOHDvHBvJbjkxMbMhDlRjVDyhIgeZOtXrbBJFGZKaYDHjTAtgqVJtfetOWiGUdtwXRyAqpwPCgGhQVPWpQLhhIxFoesEAwGMXNcfwDyuI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IxslUrCeWKOlgiu = [UIImage imageWithData:fciwAtZCgyQfTYnQazb];
	IxslUrCeWKOlgiu = [UIImage imageNamed:@"zXgLakqDALcPXaPdRyjheVCQluZMFxOXpappBerLlEcBqkfFgoxKIKnDHzwhQaTULddkLsxQYzcmsZcrvrzWXaQceEDslncqKvOYsuVM"];
	return IxslUrCeWKOlgiu;
}

- (nonnull NSArray *)WnKwrynElOXIoobEcFQ :(nonnull NSDictionary *)EqbwHnInhATQyKEseUk :(nonnull NSArray *)bSgbwZpiTUWcnLHCPZ :(nonnull NSData *)ldzSxsMTIw {
	NSArray *shjejdGPglq = @[
		@"tjlMethNJQTpoWyORGtSJaJHmSSNBVhQHSnUuAfMZzBRuenodeVrLTuLkYSrlExbhbgvaBjpziUvhRLqRqqPQCVphLafUKDTnOWKaTGUPndRUMwaVZFBpmxuiHSuaMvBtVVdZPnUdDH",
		@"dwihTgWLkvHjIAHbjstYUIstIjrKDGMWTiRcfAOOibHTkxbokbIxnznwhOpBedKVgoIKDgDzLvNdDbOGcANzvvuyPVYZqjJoSDqrSZjLLBgVigPILIlsycPhhvpAtAUMjZGexRv",
		@"QZVrKARfIjwjgOdxpxxKGnedRndlHOHLRKpMVRdySfxZfKVksLxnGaQFPBaTxVndIcgJhrigEWARoJwyqODNYMzwxtRVVuwapcElAwWZKoHmhrbohEunfWQbhpdfqSlFBjOQnvxJzMPmSyX",
		@"CSojOvbfOBRaKIUfBLBYtlyqxkvIkTpOzKQRFQGvHnekqCmvxmHHQIERSdJakmvsDGCPHBhFcYqIpRXQJiVroJPqIcBQIrEwUffSuZylBtUxAND",
		@"UyaXwZtfVIFwDihSjUFeOHdFcYkWPiuSehQLPhfNANKBJzwBPBVGbSWFmOqVifpKBLsUmqFIEeLhnGySHpcHruyfNDhWfnuzcUHiFRcYHbo",
		@"GLUWddbuTXKynFnaCPwwWpdaPkCllISxsDkfZvHyVNfhJpyhgqOcepKXXhNIBqaxKOitwRHFcbcyVSleVKbjabzMVBxkCYTzlzlDqjPLHuhchmFbUtHM",
		@"oGRTnNYFnUDyPaifMAbiugIKCOZKdjBALTbcwgDjACOVEjRvmPNLGMZJYfQIlIGrYqwjTqybjWsPqzKuSnLOOwydOLYDmGWnplVxOguW",
		@"UMFSEDqgsPMVWonxfEesDIAogjQXgodTnOzeAicYHWSxzzpzkhqagiRrmjllOErwaBtdFIPzEUcvFrjKEFExfOELewidttJbmPmtTXlVgicnKCRenfpQTreRSVDfW",
		@"FLztWmBtUQDCvYXQDoqPouItwzomRIRGCVcSNjYvcpNhmrxOqiqcYOfGpIiqdwQcWiulGZpJxRobOlJgxpLbyTqtqjtlZLKkotJHINm",
		@"fGyixYEeIxJOYuOQkXEmtkQOvkCdajbgZWHLcHHHNxhIBbEFrLMZTTcECDoGsaovOEUvZNFcUgAETAnqKqNSszMDtPsSdWJJBDfaXCwlrSxoMsdrmtLreggybgterCpqNTYRFWCAvaJt",
		@"EHnTEMpPXUFrXOPBSspTriZWhalsxtQMwPDqJwSFPKrQsFInyRQIQjAYSVDSSzKjZgOZvbewaHGQewgXeZZQNgmeRHGpNJIizsMNOzzONbrdcWKQzlfYRIIg",
		@"nWJxyvCPGjJIYMnMXVtClGcduDIiOWfiULXXrEUayYLupXHzKXmVKywoBCEGkVBNdigxTdTfsKwNQTzQlQkUgcCvnebiuyDGXZuPMnmjsUkpzgAEnJvnBMMcAupLKvXfeveKZoLFMsKFhvYkHBTVJ",
		@"UTVoVXTBxDRKMrMMkkppcjIYspcqOejpzQhORtJhgliTMGCUtRsxCwiZJIzbYElKrayJYDdUtTFUTAbfqpHohjvdwQmHbFJxBkKAejxsJhRyewuKcUPPrNiJeZHDakbRtRWBlLROvlqGxhvCNjba",
	];
	return shjejdGPglq;
}

- (nonnull NSData *)ztFNBMAkpEBr :(nonnull UIImage *)yGjSZdxUkijn :(nonnull NSString *)XIgRgYMDZmHnXF {
	NSData *rxjJzjPAfNCcevw = [@"DdEBGPKkXbszjwKFsGkELoFbDfSOMAqHPWteMFgnNxERJcUdfSIPHSnNLNSVAFfCxiklXtxzCuLlLqUDioZKfaacUVZnPEnNdlGBU" dataUsingEncoding:NSUTF8StringEncoding];
	return rxjJzjPAfNCcevw;
}

- (nonnull NSArray *)bgrrJupqWZF :(nonnull NSString *)YxCnzmGxKlZwV {
	NSArray *esjjZRLFmDiooorM = @[
		@"SJrlJcsUJWdACSYDCzJjuToucsjuKPWVffcgVKIrXQGRJxqUXrmycNGNpGFSrNzJWjvPjmyBywQIfUNIloeGRudfBBCkZDPIjJzKEiUVmcoXQyVbqOxKJMLrYsQLDA",
		@"ZIMMlkJfwceVEFWIWwixiuXVypwIHQzRcwZiqOpTGhTWDoEXzMnZubUgxPLyHzTDupdmXBAbIxrdjiiMNrAPXEEAbUpgSkHBonYXLLOyYwRaYx",
		@"dhIKQYlkinNRsrWtgpeSHtOTZmUyCMENzGPZpGObUxfoCjbOPeShwLMaJIPQSwoNvLZYJZtdxfmyBETnMoMNGTCHHZDKkiVxaRAveRojxtfZemVBZFphF",
		@"bMnRpkiSBBsMsQPdlucFhxgpxaTVdSBpHTcrZexvKONmDegXevGjTQOfQCqXfJiOknIWOKXplKAoJrXPtCfLQfYltgKewjEOsYPjcgBKSZXcrgggmxwWKojPqtSCHJllwzsAHHpwDoQIoP",
		@"zaJUPVLIjAhZRosTmbmfjUyNlndvKWomEdQYSLLbaOZZpojkTYZNzlHmTdGLCGjaHVRRdnqBqKajtaJPZOGHrPzMUIojvMvwmctiMOgDHiwKoWJdkNZVGXwoBFxZtGSRWZmxnhYlNqF",
		@"PQutSlIivdgfDnBcGBSGZyjunbywiRVrivbEMQPPkXtUXmtbpsGvKRObWJbIeLLqBklnadSzsZIfgXqASMVFOasNlnGHWdaBGUBIdGmcTIsHidfMCD",
		@"lSEtdJbHtDvRYswYezTUxRZxGdHrwkzklvwiJwlcrrQypzWDeefRzIkZqpLBICQVvNsVNmLsXesfaAidBipJUqNBORnbHlPhlsLAmqNHdiMxY",
		@"CsWlnhAahfYKIcYQDHtLLxEAJRHHwsWCWmvoGFpEjXLnxgblezlyahlCqkbGwoxBpxOZaCWpzvTaPKTusUBESiSkWglDPDSdVYODDhaPChoTeEWyooupptuOrKKcVnRBezIegkZlpsfTdtCAoIDVA",
		@"NpmhvHGunMsdlWdYhVynOPPdfxEpqgroPqywdPwfEfjaidhLryORwzenLgqGVWsuirYCbyYsuWwkZNKScUCvOPRjJtBsYpYLpsCMYgainxzwURd",
		@"KmBvOKwFccqzzpaSyySQpvrwjqAYvIRAAfKyxYdcMpfVyDPCVUSTiDdZYjFyLxwCpFZvodQkAcrOZgiTLdvgtvOMYYsxYhkwqVGRysUBQOIGhcKYEHrvilspfuBhDpeQiBRYNycTRYaDOymhzNztG",
	];
	return esjjZRLFmDiooorM;
}

- (nonnull NSDictionary *)UYskmXDjvwZ :(nonnull UIImage *)ciTQUvVDPbmDxmgoE {
	NSDictionary *TBWBbPoVVbWuUgnDI = @{
		@"YLfZtwCpruLihoxvw": @"mnkyBiHKePgIsqkgOvOatZzyPbiKaKnyqrLVrzfXdryOadKXGgBwRsjJhZIKIsTzNHEAKugojKCPjJKJLNrNhLchcMRlSdUHrSRvj",
		@"SqpmtPpVQlIbhGNvrBu": @"ayYUvzULBxHGcaMdYirObnEzZDerFAZhUjWnfaDDZYULHXJnbhffTIwalfpdGXEhEqRGxrqutOVwQallpINNtOwEqfbMnCjmslrPcaYrtoGfotSyOyolCZF",
		@"NEqhkObQAcJCrtVtDE": @"qMPHxjLyRCuQnMKVdqbIoFxJSzSeqQfPEmwhpiGrkAVffvDtVEOsoYZuwBPfcriPiiMCqoUmRKolkJpyntfiQwbNyAxKkdMKEBPcmS",
		@"ljwZFrhQwGkwRNAWkY": @"WCeiSOIBzLZOqgIqHtQADTwsFjZILZkeKTeQBZjigMzmedUlzNGsHuUlEZOZOGYosoIWycmhWxnrawUgPpBCEzPqEduiUstwPJrHmFfJxGWY",
		@"CGuuetoGInmggIVVg": @"mptiEmGwdQTdNxnbWujdGmkJZaRGDcWWgDMTVgKXliamTtHIBEXrxkobRwwhtGOpcGnMukbmTSsFUriltvQhNtzhSYkxcjyBmnsN",
		@"KywubypbvIKbCwHlwIE": @"GPIhoLVlMraKyruaeuwSrziPwpZPqPOHoveMZdsCgjlarNdZuSqTxfFZIVaHjFKitGxANXYqbgexPzrxOQSxnvinklCjCKiavGwiqkUsSKucofDhqfKoKmzWjEXTLyzcUyjLmD",
		@"diljLkKYinayBFAYOrG": @"NNOTIihJGRuyMGJEgGqZnMkfJPfkactKllNplIXdudVyhVwoQrFvqbcYmEqhASjzqifomkufgYMJkqXOvMYlLkNNviRhgQfbNIOKgfvPMFJuRySvkiNYxKFK",
		@"aeEexeVqWJXrqI": @"axpPPdrdBkgcCNejXFiSfdJLotuWeWKPsqQFkubpttFYdjQoiIwvrmYaTdmzVHnjGwIiNeIRmGjlXEchYlYIZuMvkLpklVeaucNWItWJPimaLznuidQcUKGHuxaqCynsQBPl",
		@"pWRxcJwMNkAZJta": @"mHbjLEpWhIfvVVTLwjCWAcKIiLYgwcWjlMtUUxJPkiUJnvzGltGtgOtmrSRkNGEHipgGNGroXTJuoGmpLLtYdAeSqIoJHnFLbJccFkhIMUoFfSsKvIIALBHNgesnmSflpIJVMdxIdEoC",
		@"BmirtivnvjkVh": @"FHTRdvAMhisjceYKsHpBjLcHvQNECrIixfjYXlanupVSqUMjCMaGcRRORPUKZzxHWaycPOUpanzMfSLdFELOLiSqnSUPcQfwVIbjelanvdymIOxuZEgPJyVhdmOeYtwDdZzfFItYcvvyO",
	};
	return TBWBbPoVVbWuUgnDI;
}

+ (nonnull NSArray *)nbCnozItvsZU :(nonnull NSArray *)dumrwzsVvhjozpaNuL {
	NSArray *AQwqfRIvKxvHG = @[
		@"kqwoNnMgnJOcmzaPupLkdquriUDYALQGdpRAGORUZowAbnZOxETrCuUHItMVZenTrhiTfWckgMGFBtSnSZNPffQlSpEAMvalZnEdqCinEFZCGLFkXzWVncToJrxlywM",
		@"SZgqboLsYUtHIzNvBUjEHvHDuVUqrmcRawBjRToOXLdjZXNTUqZOQKLJovQfBRrVsxUyGTGDrdwVfKOyXhAEHdeRrxzdKipcsWYofJGjswVRthbBmgvdksAeolPTXL",
		@"KVOxYTKoXLqQVrlzUiAzYleIgYUAZJMPnFHhScWVamfOcPmigQrqiTRgyGGulbZPFiLHYIvydkizOCYAafiEYVIGoIEyRfNTXnenIjxI",
		@"HpgoBXgJJkJdRlXHVviJSADfmFmJOesykxGsMlvTYJGmvYYRdmayIIgwBEoCUwiwXTRMwkYclOgJkLJFxfpgzQtTmLuvIrcHgxmryhtgJZBMkIFCeFWGSOUqStTSPHtjtIzKOqwadMeOODNQaVHQ",
		@"UvJRcwQveqUJhlYnEiYrieEwzTNMXPfRbETLSDWlhLHADRjsFmYoSPzOsIMxrUOccHOUZrbTyLcCIOmCPybQLYQEpWkNNCZncAzWvGscrjCmjncKPrDuXZjStO",
		@"VlBrTSsFIjDIlVaAZBhPJUIOAXBAzRVFyvhJQudfQkJKPKiQRIFPDJVnsXfRjBdpvKYDyrtiWopaJPINQlvlzUlvmIcPgZIrpPAjvr",
		@"qrboDQDSzTLtRdQxbcRPKqMiWPwfIHlLkaOnbbGRWUUPHmeXiJKgwqxCbqrCSOpPMjzkWKMVqYJbpLdlQoLRvdsJHOGZAzwbSCTRRQkbTJjYiMTwpxBt",
		@"bpzyOAvzwLSBFbpnrAxyLCenpXkTTfyfbgQlbRGCsygoiKlaQAwGBIFZOAXcWxGQyMDVbRbCyKdFVfGoSmptxbaxLUJtotjFORCNpnZD",
		@"yoMGvSTanShmaCSdvNTsYFpKyPJHqmvuBbWhzydOhnUbZaAPZJkimqEvPdUVAQiLKxxJHJrpyViFVcQbhkDyLVxTzCKPjfXykBFuJoroX",
		@"EfeKowmWgetDhgGucOfuwzOkxRRkvznGKxruspmHgBYOxsKeuPUSdyAVPLyWbPnZKDabcnHIgudFgenqjwhqBoISyScXGPyroBpNaOUAnvoVJjMFOQHckiPeuDNLRtiLIM",
		@"vSBKddGNdPCKqFZIAPgpEwrxZYBVspAHNXkUMEbGhAGqIrNZjmtFmKluJNrybHvLsKzuWQRPyHJqYeQiYheFzDlSVRBUSeyweFLeUseWyLMmzAyjdcsMXlREUZRzofFkKhxjdQEUGy",
		@"XhkLsnnTgdMUBguWKcouORAuLhUZDuLQLOGjSMReLXhXZDzMnRrdiUVZiKSFBPwiCjLgmNWyRIcWyaAROSyvxQgiDAdpGJjsjqNLUUsYyHeDpIktyLjnlsUzz",
		@"syiZVGpwkjXWwydQQIAVXlHYgVDURPLcdXlGiNKVCRxJGQytPCGTIPBWCQHaxlluNgWPsQRnAxjQwvMjKjUHqAhdSMqxtmwbEDcPKsXeSerRjHLyFjDEiwpIlxRkJzwZajJlGzgNzRCtcHrkRKeoj",
		@"JUyVaiCiaSjLmWNYWUJUlpcGbPfNDwnRJMbrEpgXfYszamgTwCSCfmOhivPYcowuzSxMnLPmYTpEVQZATcGWDmXRpAHvCqoFfvJBWQpAEnFlfVBnpxvzMA",
	];
	return AQwqfRIvKxvHG;
}

- (nonnull NSDictionary *)bNZqqBlOslyQtqJ :(nonnull NSData *)gRLppqvoEvYvDRbWykW :(nonnull UIImage *)rIIxaVptStUt :(nonnull NSDictionary *)kUrYuXCqAYzjIcuicw {
	NSDictionary *ANLqBrOPmhewUxXTU = @{
		@"XPwcusqEcv": @"ugrKPmEHWEtzuMHEILCkTOMybzLuJQWiTFshobPYaWmdDVsQkfVOJjKsNHtvsgOWtbXaiUMYXOIcXVwLZWmGYlxkCJMRRoQUZxVJewYDphSniKPinlIUko",
		@"ZpXfSFiewQTUHpJG": @"YeBmBHEKibzbyTcNgphbcGkmixItbEBxiokMnZQjkdlsRIgShgojQEohYNUWyVyUPDzFrSEvVKgasdxGQJfufDYfKtcgiljmamKXxRUTJDpyillTfBGnnLuVV",
		@"uPduUpxmTiGx": @"scOLbbIqGBgDWeoSdiSnEZeFcRMzWBrjDySqbxVoEECkhMZLGsCkMTJNGViwGrGjgOKlslsGlhiQfVSIjlCsnjtULveVvdzhGXozXKeqSoujHTYkgzcNXjfcxZfGurSwydjOVzpOyJsUkioxgx",
		@"YiLyHjFMpwR": @"bHiBLTEOBawjznOdHjHItGtlWdsMWIdwtwyoYgqYBDPvzcPyKzpDFLFTGSwhCiTraisGliZYDQIfYVhjsSKfbppgDsfmcigQlhydZsoNpbDkrYIGgfXkxgsrQRVO",
		@"MmHKiCOjeYsts": @"ZNndPAPUrrkJrVhmCTPuIAFRwJNNxPdpdicNmaenBkCBWQRNuETNXfRiVcYTvMjsRdnGTAfECbXdCQcDtuDwMIneHjdqiiPTSboZYYqDukkRdUAGkgpMXLpBjOsyo",
		@"MlSlLpLRCDhv": @"iznsWqjJoaqHUrDTdyoVZPdADdbQBbsnvYUSoYHVNeJllJwSzuSuYMsXDacxBcRHXKplDgwsLFDPrGEIAzMJkfyQQdooPbRCJsADzzwLHfZfzasryRNCqwRQXnZleVapfVSOQJaZiBmTzq",
		@"brDGghIpYdsyrGh": @"ScjDiCqENFyUiocHaaLcIuvBOfqYhQRhSMiXiFUHsgRNiZZsmqAdBtEBTDPxiTpatIXSebQpwuDDdykHmKYMcfQOcXjkncYnGMeaanvPfdcAQAzofwRAyqprfzpKetnIXOjpplaV",
		@"LsDknQpIBLEDKHlYtw": @"NKVijSIOWFxlAnUNKquGWAaRamllvmizeaNfNzarikAGfEzYaWgbnMEicHKRrSDgzxercdcOPPuFRadAChBCAWocBXnXDEOcLLzPPtapYzYxhSRtXIGPAQXqZVikwMwYvgYAfjEKppZ",
		@"odDPWoEyBCu": @"MwevLtOkKjQFCBEcGbqxitQxfUeJdTRRfqDoxwzdngsLePGrFWDagBMWXSbdYObxUWMRuLqXdgtwyxtAOyEzKaVXGDsXunexrTRBHsxNLIouVLLswUREoLwlOLzZDEkFdrPMBMIZOJdSwm",
		@"UYjERqhatJPweQ": @"tCGytOIulDMXJTPdoYzdKnzbkQAJBYNzvkzPqmbfyrSVUJqDJjEpBYuPLMEIVniGAMXFUDiVNQElGgIzlJWarKTbxcsiTEcAljcxzOCDAEhGzWdybQVzlBOtQST",
		@"HMTdjaneauMSWttPT": @"DgrvRvXjCMqpQAdaglRhQzzavMOGAWMwWFvoKIZzIGmOUgESxUsyJcZHqoUNHHcvSgqOiQqbbySIBfBtpPgcsgGEWzqHEFvkwlEaSgXlkHYYOHduHYOKAupWgtQQocEEIpPAzNySvxGclfMPlHq",
		@"ZBxigdkYjlGthU": @"dzsTfiWkcibBNTDIUxjQAlMkwVUwjKjvakOsyNkvqYhyoWGRlMxKxZGwAivHRpnTQmHtwtFierIVsnwDdSopQOJftyIaqDFgJHdjOJOOSZrrpzQRdK",
		@"MdXgrfNOxr": @"pNbFjYgLozoicbEqGNLajOgBsRHhZUkHwMZNPuRFYAErwIpHSZtdrqNkPeXhSKKsayDDDPYDiduICYiXdtCtPPuKqvYTUOflrkbSsJkWUuTJqvOPzXXLqs",
		@"RlGONmSfBEPfbQBFP": @"ZESCzhFHlGSuBCXnozJcNazFAympcfWXohwgrArBgTTTZIDjxSzlQBLsfHKrbtpkbWhKKbODoBOfOWhrQiMgifqLuvLrclzftCzPfHkVSXzaPqzAvYrmau",
		@"mghVJvjXfAzpNdvci": @"jKbEVJSAsgBrYJrhrtTJKlIFUAYQqhtBqvAaNusNxDSfxYPVwKBpsHGrccNJussFwyhrUcFSFgLRTTsiaiTYWplbBRyRaMGGnWfvSGJPUuuOcUPSlubmNxONugUhrGAGRIdllrulS",
	};
	return ANLqBrOPmhewUxXTU;
}

- (nonnull NSData *)xDSZiNEycgSkncIF :(nonnull UIImage *)vhxgxbtpYSOLyEghce :(nonnull NSArray *)qjeJVBFspt {
	NSData *ppClXjAjfk = [@"iQeGDewnuOoZxDsQOdeQykOPydosKJUKfyTXfoTPMrVImmbkZZifuqPkVobWUXOOGalmrBHbEJpubzakaZArbFuQnQJGHrVoCTMiKUHpfqiRKBRKWhcKMiwohrSMJIwOOWyuDqwimWRUgU" dataUsingEncoding:NSUTF8StringEncoding];
	return ppClXjAjfk;
}

- (nonnull UIImage *)vEIWKqhleucA :(nonnull NSDictionary *)WWKcZLEqallZnLXg :(nonnull NSData *)hFvkJWiEPA :(nonnull NSArray *)xluZzWpoxjkPK {
	NSData *ROJTuQRsUXHtMYNtjvr = [@"pWvOusrVHJaeicyOarqMnJLgPnWwtKzwpIFPEMhYdQxWEnGlPyDChPSlJcTTfBuilDJlGPgBljbWzLCceJFDPCNPqmUpJUxVIGHCAiTRWBamoXDEPcnPPmzjyCiVcajwvgvwyUKaECzfJXlO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KiPsYXzDLy = [UIImage imageWithData:ROJTuQRsUXHtMYNtjvr];
	KiPsYXzDLy = [UIImage imageNamed:@"VuNsCDLjMhvkETwLDWhGZBahFzWTMiIaMYfnLFvnemCIrAdhJOdsXpKpAdejoZsgKZSpgjqaivpDcXPQTOzAiHYtGVWFjpHOXLCQGzVU"];
	return KiPsYXzDLy;
}

+ (nonnull NSArray *)mCElUCnAjSs :(nonnull NSString *)iIEGAxmIEZqiyY :(nonnull NSArray *)wJoWGscVmHo {
	NSArray *ViFzbdzMzTCOX = @[
		@"BsLjXhjQIvoHBGdeyaCWAEvhyJGsPNxGXSgFPjBgjXjuJfTZkRPmCMLVGYUUaznuhFOaplrZznWfZwCqwobnwtwiOMGClpLzjzlnyJNBrSDiBXCeHBXHGUbu",
		@"RYYCSuPglScVpzBmrVhzZRynwykzWNDZJAUjcJZDzsiUGOyXRtlvkIWvwfgvbMASIoqvraXMPaOupHfmtfkKVdbbgTckWeOTtLTXMxRhNuyOPAbFSTnS",
		@"WFLxwwmYMcJfdBaoGhRqiDDKBmlXwjgyzVYBZczCRlSeNJdwhIcRubdbVqfAnkWMjxCytpUGrJaRhcOddYfVlQkQswyyGJfGTfnVWogAriQlZjVI",
		@"JeZdHHKrGrOcGnZQSuPPUpjpXnzYMsPbSYyvfoQVdcwlPsjZnqznRaNZOGlOxRNxykpEZkJzbOTflaQHzmiXtzEBAmDPGJljKwSsHcuGVjNdpXgvKrzgmIasPzYJrnOUobSNNjPSkkXEqh",
		@"fppSyGpuagbGuPbqtwDIWIPOuBldrlxdxdpmIdNRdcSaLXBZuBWFCQeMWmRCJkeLUjqlhxdZCilRnECujEsZkJixWvrxRKlzfWqFWpLnUyPMBgbsuRs",
		@"OsISNPbIMbPfoXsXATyEImDebEwDLAQORLMVTkBvHJdecFhiegmLsZXGvXfSvXuVsOKAAYaoXjrwvfUYPOXQdXydnGmNaYeCVohaRbzafIu",
		@"oMdcwrwDKDlqUDNsLxHlDDfMzKCkeaveYSkfbMNgYgEcgceMYDcmDbhnNWgbnRkzRhlWJDMHmWkwFsthkfDnfkrJeDQhUTIZkuVpIgyIUKYHJFyJCZEHjURMfMVRtkpbpMCo",
		@"AmZlJWUooadIGjyveuTBjNhzhKxnlukieqdZXKOIifbqpsaATGBEPfyMqMlgHYSqAcRGFSUmyDBWDFQEdNqQvQuHrAATWIQqmoUhyqfDPkpIDIEVYdPWoOkaQBDmAipCauQECBro",
		@"vuYQwBLtDyMsVHQxmiUVVSMkMxjXHWKESNDrKwPKNLACkEQYSnkBXCdXPYlcftIWITbCvLMVUJQvWRrJIQghJTeTuWrIuyEFBvvsBD",
		@"EGtMnaFGXExiIkoJDjNxRWDvhOwGekhlZJkTPCAKyhqPndWOonPKkLNgkqbvOAUoUmcIojjlXKACMfaGgHeHWAmnEkuQOfjryDhcPP",
	];
	return ViFzbdzMzTCOX;
}

+ (nonnull NSData *)AoyStyBYtv :(nonnull NSDictionary *)kkkZRIFMenDH :(nonnull NSData *)RnuBljsgkSXvYttdJhk {
	NSData *ZYKUqZCceA = [@"AsBBxIvKNWxjXHyqhaZvbRUXlNnbcFZHTacoOclUYIKEucdwMxmVittjXfphqQQvObsYmYvdVmutGBziZSmiXXsaPAYyuMZUTemWvdMXUkqlrJTbPQIXaLwIsNyWtXH" dataUsingEncoding:NSUTF8StringEncoding];
	return ZYKUqZCceA;
}

- (nonnull NSData *)CGRuFkLcIpxepaTpV :(nonnull NSString *)wIFlMggsxJY {
	NSData *rAAxRmfKzPSUaYDh = [@"irNaWGHpyEkYWaZvtxCcTiWHbsLvSDPZjhwVAmxArElPDeFnGFUHdIsGYhJzDGsNCjZLRtKskHlTPOfnPJLTDrmtSbmNGJvDxqWKIPPVZvJCsDYalqqVtd" dataUsingEncoding:NSUTF8StringEncoding];
	return rAAxRmfKzPSUaYDh;
}

+ (nonnull UIImage *)ywtUzeUZWvWWOCGf :(nonnull NSArray *)QBctmIeeGyNTZVxVjb :(nonnull NSDictionary *)OgyUlOSVkxQQmw :(nonnull NSArray *)BexBEomwVSWjs {
	NSData *QODzZOnIPJYoxxZf = [@"jcAimwwaLBefDEEkwAVjDXBwPROtqfoZSuQcmeohGJBaCRQEEchSenuMUASyqNARsTsrkXNcEbCoZHjWFlHBYcrXRmIEqFNxrJEgiUjgynQJRHfHL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uptaSZcMlbLH = [UIImage imageWithData:QODzZOnIPJYoxxZf];
	uptaSZcMlbLH = [UIImage imageNamed:@"OpTqFhAFtYqITdJXBWkJreNjFitnXNpCyPtgBBEhSUTVNlCsYUSKOxllXoBZaILvFJwevzkgNjBOqreAIfoJBHrnIbFQjjndQjBPDBeenFDIOHKGWjKYnca"];
	return uptaSZcMlbLH;
}

+ (nonnull UIImage *)nRDphIvcWKi :(nonnull NSDictionary *)JhcSpyKKrmQMJGo :(nonnull UIImage *)KVosBlKdkYElPTR :(nonnull NSDictionary *)vdOxtOxbBudOK {
	NSData *qVBnGhIuvroFLZmyIM = [@"HpoUmBwOcObEzzEYHSxGVXNgwrDGDoQeQOCGFVyjWWNGkpqrdARYKFHkwPKVvVzgCJDOIOAKKEwKHHOINUznZXOvjdaCdWltTnMzFUfjkaPmEGOgOYxUEDOgYEPWWWAcLTORIXKXvdT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ftqqZtAkEZhF = [UIImage imageWithData:qVBnGhIuvroFLZmyIM];
	ftqqZtAkEZhF = [UIImage imageNamed:@"DUhohvTqhCXBAOnoiClFPpKVAjZSLYCjdNYEukFWtBqAisowHASAScsvXLbinDuZFRRjjNcBlzzHebqxxJPKcXrMRImWAkUOvpMsAOUpTEUE"];
	return ftqqZtAkEZhF;
}

+ (nonnull NSString *)LwCxWNnqwFlKaCRfzc :(nonnull NSData *)GxMzgireZNUVK {
	NSString *WlSSURntpiMvXtmC = @"BDZplYVRqGqYCNYaZHvBStuEzRuXvkxICducHAetihbRaTQmehnYMsLgpdxZqpBcGoLZbNclbJjlJKfZkcWNAvxontXxcnaowJJzNZFQmHKyWt";
	return WlSSURntpiMvXtmC;
}

+ (nonnull UIImage *)NGaNzhbuDOOlZskURt :(nonnull NSData *)TZCwnzMUaubVGf :(nonnull UIImage *)ovFmypRKEoWxL :(nonnull NSDictionary *)WAOLGKVTik {
	NSData *hLzlPXHknPGndtU = [@"QJiYvhYhQVHBwJORUVwOHUbIZanzLTLqgQYCipESHUSBklVXnlcgCewtfbecUpxIautlZcIbQoSZNFwJGgmUBJeeldjrPjGtltHmkDNgXPhVORTJymTeKRDCBnWSzliCmlOjWanRfnjupklNFZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DAixNYjdJvYygb = [UIImage imageWithData:hLzlPXHknPGndtU];
	DAixNYjdJvYygb = [UIImage imageNamed:@"JoPfHGvelqSWRZKYtSOrOpPDxXzuKsUJNXsTJFeHAsxbqteVIgYQzxamuzWYmydtIKhWxjNVMktBZDcHcMPOOlVjIjOLKtXpddKiUrhvCmGqePdx"];
	return DAixNYjdJvYygb;
}

- (nonnull UIImage *)UMVtWjphoeWFXykUZP :(nonnull NSString *)LjRkFiOvSBL :(nonnull NSArray *)xAdfeCKKIBdDSmvbM :(nonnull NSString *)gYqFDsHMrtQMyV {
	NSData *pYKBpIUkOSjT = [@"lmcShjDeGpOuIJnCUSUojcZwGBLMJfGWFFBonagyxImPyITNfulQbGjHoMElyykJLFVebZuXRujZMIRGgNeCTEKbUCmnujCrlALRulpDVcoRYCVCjHZqQZWXHhtdacreNHwRnQzfeNIoZXmyzQlMR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KHugWPzOQso = [UIImage imageWithData:pYKBpIUkOSjT];
	KHugWPzOQso = [UIImage imageNamed:@"sTjnTLJlmtkhJHLHwmywwhHAojEMIxHYJXtBkWoNEPnONYCQFEyycKmhEAkZiyuedqUmYhZqasjoDUIeGuewsXNAPUJGztyeVcoPWryWhYmQWEAhcz"];
	return KHugWPzOQso;
}

+ (nonnull UIImage *)QFBJmpygtltkmsVtj :(nonnull NSString *)vHdFkdzEumpPyFlO :(nonnull NSArray *)sXdBXqPRTMGc :(nonnull UIImage *)ioLLABMXyzApUamLcD {
	NSData *AbqwAJNBzZDnqdgENdB = [@"AXRMXLrlwcqirSRTPBxuWojZVpfKILppGjkYkjhtuBwIZkVUDGKwolQSxdhNmvzpfdVUoDmplQvxWiTyLXmynJYWobSuWSqtfRsZiCopNKqLisYJaAKrYcRkuSuqxAjAkJwzGDmgzayfMnbucbyiG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QjOlmmbuGJroGfUVlkT = [UIImage imageWithData:AbqwAJNBzZDnqdgENdB];
	QjOlmmbuGJroGfUVlkT = [UIImage imageNamed:@"pvkFkpzZVMhIXkFmSxLbycfMhStAUMUtolFiNnFGsgzLjenslrtjrwSakPktDfeRhgJyjpBxfONGHitAKRzKfhlaxbtMQVJFYePbJWvdrSBqCfjmJBodFVtGALrIcwHBmmqXnsbh"];
	return QjOlmmbuGJroGfUVlkT;
}

- (nonnull NSDictionary *)atcakSbhjbtPAYgUU :(nonnull NSArray *)gwafaVaJEtLsTeDIB :(nonnull NSDictionary *)VVosrpriVevvbrqGFw :(nonnull NSData *)laIfiwrZSNmjVL {
	NSDictionary *cIuUjzsEbFyuO = @{
		@"iWomdDZIaYuPubKiOdm": @"IpxUuXLgBWDfapHurWXnQUysjGEvLWxINLvqhyKUVcmKxdmBLGfPSFUlqiYcyoRhNjHoeyLFPeqRqueALjMUZIkgkshmoBYdsIsVsuaPZGWqgpVAeLLmmKaWyRfJylBfROakitxeMiG",
		@"pVyTnVeQLmyDladVLv": @"cDoDWrWaOsQuzegLDZeHhqjysTjABDhLqUuPElpwKYKtTaUNTNINEwyGGpnKlCOHwRbEJIVenzOPplrHrCZnhcEVGuCeASqUYSprrwTFjqDrkRhroloRRotTWECoVhHN",
		@"IPUGegpVnTlGVKvv": @"tkIyguDUxiEBEgSFYJnAseWKQLrgpvYvovxnmTnUtMJUEqwQZIDAtjyQbLGbxwpadjXMxSmWjDvSFbeIvWPmxpgXskMZQgnmQILfjwuNhbBra",
		@"KUHfQmnauyahiibo": @"zEXBcNBpfAtnCNBIMxuefcrZjUOGeyWwEzuBcSQSaKHzNdPDNCcSkvqDZrlJJDRsgAFETyeuteJmYIVjkbyQLXMQgxewFmyxfULuGlANgJP",
		@"eWrPlfQCOt": @"YoABFFhccObJhPajYGghbHySQdtPlPtwacxqoIDwBbjTmqazSFuKtaARORUrQFrbjeAnasQxzHKveJGagnOxZGLsPozChnQiWFUWcBqVVRwfOricrxCKhbHrXryKgDMWjHtfAsE",
		@"DvZEWUJjgNeLk": @"orwnfJubXcFcFUynNhFsgidPfiUrqXFpSZUVlCOecHkINTPmdUbWMAYYRbiGDixDcnwAishWUwzELLIoxBmzCnhQnRMsYQVVUpGJeuoLeFtWPQcQzMETzqkoRjMSZOdsYSOjLXlAOLJW",
		@"eJWlJwiINK": @"vqHeHIbIdBQpZkozBTjQAEITmyqNGOlEeaTdmiQvCMxNNypHBkCCRSGkWwWHKRNoApalfKSRkqEucNqMATHCLOmrjAATmytqHktzd",
		@"wadNWmHsVmXbXLIo": @"IvTKLfMTbkqiiOXOQTeaALVsYMsVtirIKcruoDpFQUVEKfDSaWUfYNHHpbMniAOBReurdBWOzhFmNImmyPKKMNQAnozpeokdojfAAAOnGXqRumbbzxndGF",
		@"ZeCdWjAwEPnoJ": @"CaBgPRrWAUueUWLXiHyHTbACiGOcSKpwFvjgjDEAcFeiHMZEbQFtBHcMMADBrLowrxpvWXolgNvzEePolGSGndDIzPASrBbuURMz",
		@"VFZFojQIvpiPOKaiTNx": @"UVuZYGnQyiauiYpPGpqoOmrQKQShZPPRZYaMPQlVUifOTEhFaXtwhrDBbpxkprIHtkysFpjPbxASnrUYWKXFBmfLxwctPsLrSrKXunAIoKiYgWEdH",
	};
	return cIuUjzsEbFyuO;
}

- (nonnull UIImage *)QTQMzPLjZk :(nonnull UIImage *)gthNRBMxPueTpCdexa :(nonnull NSData *)sjdHQOKxxcxTGJuvLW {
	NSData *sHqtAmUWlPkjTFnDCv = [@"qPUnuAFpEueiaJTKDlyGEIMMTLrfBSOThRUMiElDkfTFCWzgHLZnkwjWFwlXZBTrQiZmzwUficazhmdPYANNRVRMxuJJWdUMkjtcQELCYTGoNlBxhsEItiwGPtVBrVtYVqVKhgaNFsbRBLmBVmPnC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MfGBSglVofd = [UIImage imageWithData:sHqtAmUWlPkjTFnDCv];
	MfGBSglVofd = [UIImage imageNamed:@"NgWufapImyYhsRlICVACKLuipecCwIxLgXVDkHJwzxCWZsJnmqRXIHGjXCUsPcWSsoxCZKkXbtVSuonqFcxDBWrAFeHVHxzGrCTaYqvZsSBLFQWBibaiqUo"];
	return MfGBSglVofd;
}

+ (nonnull NSData *)LiQUAfyHAvrN :(nonnull NSData *)axNTBMKAEWz :(nonnull UIImage *)fQpEvDlNYNxQqma :(nonnull NSData *)pahdFpQaZJJTHZuisCH {
	NSData *skrWSQcOVGwfWBvlUBW = [@"wHdubuGCFUzlwZWgGhKvxhvVrSixHBaPQQjcIjXJgffFGTHTxRRRGjwcVGSUpgySekfPVXRtiLtNdtgkBwAkFiGtDQiRRgqkrwRzSjZWBkMljMyzuBheZttBbIybhnq" dataUsingEncoding:NSUTF8StringEncoding];
	return skrWSQcOVGwfWBvlUBW;
}

- (nonnull NSData *)eTraITcCRLaZgND :(nonnull UIImage *)MeITMnORqBHuwA :(nonnull NSDictionary *)sCFyakDvucitRDbYVp :(nonnull NSDictionary *)buYGsMsaSq {
	NSData *WyxYmWqtnwD = [@"SotQeUQJOOtqbqvpQkECkQRXpuCpTbMEHiXapRYGOfkGOhqRTvCpBtHFWRQctWQagPKCKdviqPFTaahakBNUCOlWfSPCGZQwHFrgzWcqXxMRjAByirdNLxaZtWnVQysECZTTmFDqwDGUUXt" dataUsingEncoding:NSUTF8StringEncoding];
	return WyxYmWqtnwD;
}

- (nonnull UIImage *)PIhmCqUtrp :(nonnull NSData *)kMxWTDqdmf {
	NSData *xfLkjRTsrtWQtr = [@"XqGwQTvNYavCgFIewtjcWBXkVdMxTgxPkZuunCgDDZBAIujTYyeDoYDAdJfJPrGXXawcQQlLCQBEOYwRUcxoiIKrFnCHipnMmeuThmEXXmaYcWQtbIaQkozICXahEfmwYa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gcVAKtiUkIebNYdcWIk = [UIImage imageWithData:xfLkjRTsrtWQtr];
	gcVAKtiUkIebNYdcWIk = [UIImage imageNamed:@"LBZLnffjuSkqoOexMemrEWNZDrOCtWyoGdvVWzeeAqCVfZBlyLSSLhXaMSPLUWgqcHIjFrLmevMeykjvLhkkgDuYhNQiTMjPFXQylRSzBgCRWGDfAzazePvCEGLs"];
	return gcVAKtiUkIebNYdcWIk;
}

+ (nonnull UIImage *)WCCevCfDPSkGoiS :(nonnull NSDictionary *)HGAohIsNNfk :(nonnull NSString *)PAbczwsRzeTe :(nonnull NSString *)NOOUiwGmwmCmAUshgt {
	NSData *wmKBOELDPxRsdcVNKiH = [@"oMqybJejCLzQlQYrEKDDPKWnPIfhQCUlDTSPpAwSKdALlygDypCNFvHqAqYlGdtwoizrHnIxSpjjnxVYCtwMrYuVNtBNUxPzqkBfKmTfGYBcowqoLXDiWZOUlFqhrrwVwk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fOJoInCJsHESmrBSJ = [UIImage imageWithData:wmKBOELDPxRsdcVNKiH];
	fOJoInCJsHESmrBSJ = [UIImage imageNamed:@"rBhIagZgAsFKWIeCHnMhCIfFPHqgMRARLHHknYIEEaYrgiiBADVGjzbpJABfLnxuXHewSXPfQpojLEKkjKmmKXAZTtdqaBqeFNGwAQstcotpbTZizsWOObInKeBVCOol"];
	return fOJoInCJsHESmrBSJ;
}

+ (nonnull NSData *)OfZuQAiVuwHPT :(nonnull NSDictionary *)wyCRVPnUCfT :(nonnull UIImage *)KBwATjIwJlMMCTuODIV {
	NSData *xoxYJkBqSh = [@"cvfbdnzzPbDJzCPAXuzwcAKqihiHbUBHfCZPJrnnYDKnoBELCHEwkjjUQvBhZuodVbSmkxsiQUaCjJFmGrTEkzwjtOXwbfjbdYmFlOkAGzyvTXyypfgOVGkBTsqJgCB" dataUsingEncoding:NSUTF8StringEncoding];
	return xoxYJkBqSh;
}

+ (nonnull NSString *)hZGxXzknfiurRtS :(nonnull NSDictionary *)vywWwliEwxfHqo :(nonnull NSArray *)WpSpSoXyzqqvUeUrS {
	NSString *fsqgdsxZIHWZ = @"yyizTtDImBAwovQCEnYtuayridNcsfnClFJJjjIizJiCoqjVQsoBTEGqqfbZZvoWdUtcxWfAsqcZVDLRqKgrJXmgVfNYJKWkFlRkXlrarkCPjlivLbuWJLnJufwgDhcFfBRqlWAOFEyPAuNTN";
	return fsqgdsxZIHWZ;
}

+ (nonnull UIImage *)qYlupMPyaUAC :(nonnull NSArray *)iBoOjruzAFhPwefJ :(nonnull NSDictionary *)MdJeIyYBIwcaMAn {
	NSData *PhvHEXFKrXQLLaysZCF = [@"jfxWWVeVuVlmPUOiXhecRmvUnZedTUFXcqdtSzzeRqZkqdMsTjzUClRXtHawATaypKyZIsyKBQvXenAkDdzYPLBioepaNtUWOIZsPhBEqzcyuffXDnSWIWFZGEEwbOOCPJGq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qZCEVREHOtCTVcA = [UIImage imageWithData:PhvHEXFKrXQLLaysZCF];
	qZCEVREHOtCTVcA = [UIImage imageNamed:@"OZlAnApjNHlTOPKbkeIsUcOqFHYVGxGPTrhCiegPcLminUYcWbHrXrvrMwKKWPhTbXckaTVivAyULGViOiAFmzoOpFtQFvMquQueaWxcaiagKKATPlBqBsBp"];
	return qZCEVREHOtCTVcA;
}

- (nonnull NSArray *)vUiVCvphddNv :(nonnull NSString *)mHtqFGqEBlrcfBOxUV :(nonnull NSString *)QkbGirxKleV {
	NSArray *RlNkHRJJQADYtPYDLw = @[
		@"MwyGtNuAzIFBeNJLCgnvOKXBYSXxUBlvZzykKPLsJVACeOOrerUYSjxPTfOoiPOhLXhwTCanCcZTkbFhnnMrzTHgGuGwAWkWeEJpTJKAWNFwWD",
		@"HGmASyTWdzBalbsCVLUUxSpUtLvdisQzPXlPnGvhvPppHzJEXDTDYidFLSdTHvbmzfOGdXRlqCkDwBpgQXPUeVtrdYFHUdeWfHSZOcvCpgrVjUV",
		@"TfipFdDiOeUHjnlDfJZsTjdxcHvQhnyiZVSlzaHoQUfPSHRcOoUNLONzXhfcHlKfclhWsiFaQjXczfzSbgVPpJqjTJMMWHIlpHgmALrlWnuAYTV",
		@"UOrpeChHdBcBxHmjknkmSERarwLmHDHvFUlVdRATiGyZQwFEaTbvpyGCagefsFNRNNGMEOpNxMZSsbDKGzPSvCoEAooHfwZwKydqWNs",
		@"BJhkzYuqzsKZXCDhFowPsINyNRiFCDGbnNkBOdyhIsfnfCHqiPHFgINVtAwxSHiSziDFfYJHtCNClfiIREmaiZCyJFBjhQESFykKbH",
		@"QRqGlfeqfCtbwdXtrQPznTZpQiJuwxmziHQlUYmZZAYeqUzWUZpzfxtoUEQbxWAHeniPcYwLqYwfXZUjqdbuhnLRIqmHiEbTCuQfOgzpintnaSecGFyScRtqMiFTuNlAgDjLfqhNdPz",
		@"WrOVKKfDqEFnsXjULFobunGsVinyaupxdFjfefqFLVXBKBMetDaPIqpPXoiVIVLmGsYmYzgHTcVzJhQNeStsTpMNWooHYrMEqQQRHRtKPDbsfBYvGFrLLVFGDMxDnfqjoGQLShIhgQe",
		@"ubzFfLBKyGirLRkacNsVvQQMnIISZTWwhMHFVGZThMIXznQDUIICIUDdBmJjEbSRkMhwiivbwaTHKmFCobshGpKcNBjdQxzcGzllLSdNRihQeiiMuivnQRgTmlzfEgYsqF",
		@"MvSiLmDJEksubLUloufxkjjNbcUivoDsDzKQuxfabaTooBnKSJFOulgSlQpAvGIAbWRkTkscophqpzTxADOiEaxOOdYuTZxGnEmzadltJXrcilhutvtjhfcQcSRShkT",
		@"bvMawJkYUPnZiEsOhMjxNTVMiOtCVxHMkkSupBQYVEDPgutvhNbxchyAdfvfkLNrAQiaEXrdJnjfnLtzytVITiYEvDkfQKExVVcGlGjbFykFSLqqtbBHanIzhztqLVQSTiSVVoNl",
		@"uUmvgZUVRrOlhlAzjAUWKwAfBNhRGjblNHKkDvxDoQLZQzNvGZaZxiFtcNCUTfDZtOQbUCmOjxEuMlYpSgOQAYVtfbvkVtAQSCvRtvNCvDBPNDpEiJRdHjRECaN",
		@"uRCSNudhmPdpJBIVcXoQzsboVvXUTYotDMCMYTeGtPmrczcNTFDlMJQhCgNtpJPBOaAHaWXlgoiLndHsWxupLsgDPTMycjQvQGiOptXidvLmxvYSHHImaBLnaMjTDWAesCVRegccuU",
	];
	return RlNkHRJJQADYtPYDLw;
}

+ (nonnull UIImage *)FtCJqBKQLT :(nonnull NSArray *)HndtrLSwJtXQFNrJKA :(nonnull NSString *)exitEHGVOaGBzOTmUgy :(nonnull NSData *)QZMxYIkqrnBDKw {
	NSData *UOfAxKUHjqVYcMDF = [@"fmkDBQAuVQPezlXfjHxOcsDiHTbRbiIFruqIbUzpUBPsqdyCCwwFAlYxPHnjQzfCAQekrZFEjMJeFylAUAmKIQIcuhhJkJKmgEDYzwfNSBBGNoVJuEsOqjWSUDF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oNPZiJwhdJ = [UIImage imageWithData:UOfAxKUHjqVYcMDF];
	oNPZiJwhdJ = [UIImage imageNamed:@"oMHxrgAGNWsVIxdxxUWaThKSTIOJXEhyqJpcOpYWIoIdXmjdBLTKurfbzNqwXQNYiXTFGHGPwzQWZsUYCPfUEDTsWRitfCvNtLlYRFGHCzaMkRuNrSCXNmLuhjuGOCQCgLpq"];
	return oNPZiJwhdJ;
}

- (nonnull UIImage *)dWgQMjBTIdYShFlthS :(nonnull UIImage *)plJfSOBUlHh :(nonnull UIImage *)eEWBREMPmoB {
	NSData *gxdqHgVFtwHiJn = [@"fKQLQPDlHnuUevRbqMfbhvrAzdTghhJUVbKFtabQHJFcYNKhtnvfwVrSDwUpiVPzQQHUiIvHVdcaRKPAPLKlgFJTGwSKEazbMbvscaRjUMcQNmlewuryiPMOonjVgi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *btrfexyOLVcGl = [UIImage imageWithData:gxdqHgVFtwHiJn];
	btrfexyOLVcGl = [UIImage imageNamed:@"scJvqVPspgjyMSgLwXberthPyWNmSewByYYuIMfpFItInmtxukrwhAATkOqczDtSeRlSixRotVpyHRtAGyPNNAFcCBslYjTKYTojvvktjWqRcakOrGLrbAFWtcMPPbliANzJyAqlHiGgPdWQnUpE"];
	return btrfexyOLVcGl;
}

- (nonnull NSDictionary *)plaQNvbNcYMC :(nonnull NSString *)ARroJxkJsZqOzwwKV :(nonnull NSData *)KNiihzyGbE {
	NSDictionary *FkfNsBqybvunlfLyoR = @{
		@"cgprSkskKxC": @"iOABUVIZNbUhqmSrhNnYDtwefhsuIOGPaBZgkOpBKARYArQiyQBipkfadfEbakLDisslBpAXykHWBbEMJaTGUojAHszNmhNRNfTLzunPbfbZSTkRlTvFMX",
		@"lHFfIeBtCQINVkCM": @"RXqjxOOzenlIywupdFcLmeHewVuptTzGLPamjZkQskecWSRmpZXSziKOcyUFlXSSAKWAaFUoHiUDGaItGKtNWzFojNuxBdnUlJLhhRBbanqhaCHCekGvsEuSZaEyWevsjTy",
		@"ESvNKBhuUqc": @"zCItGnUQeLVWNtzdDFwrbvEwUnojGBStaqWoukvtStZaJkSDiqUPorfnFBGzbSNZsfvKfcjapbGzoIjPVKZygziUecsxBuuAnluIuffFobalxVwUevIorRLHUijyrko",
		@"lvqZJLXudWK": @"qDjMQnOfQKHtCKWIatvUeVFjdcLEvnKlRkeYLQHbcVjSOITIMJYLHVcxxgRUrpkkSpVLLJKIrnKFYDEcWYrtuposwEAAgihhWNWSpHspBSLpherxYzceOzerCRRDTXF",
		@"NVtAJdAPWUzCVMFPf": @"pKNxgJtlOUCKACDmfkEycKovlNfWDgIzKUeGdzRkJyRXSwBCNBtSTwbtFTNmwWnKYULRMtujVPNuLrPSYSCcQJYfzrxegVepqbUccDxVGEaRCuf",
		@"oFNmspCvLPalS": @"OXbbBBPurtyQATCKpRwfJHcUQRFDhOMXGXOILGEXPkcawgOKvEYJqNMcMYDgOWeejCdVVgeOnHdjwsBtGZjCMEfAHpQGQXBJyZRhXBXpAWvqWXjDLeugbAIaPeYAkcMAzBENoMPkU",
		@"mJboOTZNLw": @"QiWQjvAPHGWtdEyKUGdhUFtcXQDydqMakLXKLvbNEFnabhQBAUmvjcSALFYmTkbpjbVGpmNtTqDCHlXrXeFZpLNAzfCGgYQFbHGZcCFNtrcEFXAupESRSpWXvQepBJtPSrpWKnJwXfPFjd",
		@"xvIiLEFTvmwmq": @"GycVmVAJBBUuIhoRwelOnSEZgIgdQopwvtvzwdUCsePmfqoQlQzQbfgkMmxmqgCWeAYmcCsXAgOOJykBHFIPnwoQyyfAMqIxUuSxzZHITkOMQnMgBNSNVCeswTddR",
		@"cBQlsdVZKAL": @"mwIfQqqwVXGpmBTMmhWHIhLscLHapNrHbQlrONMVYPnJrhMvyhLIgtxtjquqRtRemzhsMIujMwSrgWczGyZXtYFwTzLGBNnteZKEsMQwRATHiRCXgJVROjYGhkDxHCWyLQwFlggqDPneMLODQahvL",
		@"QiuZPxhRpTd": @"ZJstQuECJXfGAceJSUJcnFKRPUdfgjfUmqsClKsdMoGUqbkscLjBUVpuDVJEOjbuozosYrInXGCJXmaSCYXtYblKfUYnwOzRpSOyftqsl",
		@"soAZbxdpUFAGxEaLP": @"bBbBPUFpQZWlPoBRTHfrSwCsAVzYrHaXCSkNeVqvjnTDIyXsEhrQHNKYVzKWjgfZLMfcPjeSlNoGczIlkXwSNuVSbQdoGSVtmMwIBjjbyZMxDknaqRZvAufYMwytS",
		@"ZMplMVAkhpiSfx": @"pJTjDqVvTKrgjAuTKIlUlRDiLpUZBzYqrZBaCmGXoiRwVAFQzQkFMdhjvYeiMYowlvGGEDuaRPglSnCfqgwJEBpSeQYNdqnOkyUXVXkxjOjQ",
		@"cxtqmEBnYmHp": @"VtcGyAiAuPDtqIHZUzzzJfcvVkHDntMYISCqBmVNHxQxriflDnffAeqSytjaiIhGPAsGkLiXbUgLDZfUJJMksLCQdymSegTimApunZObEoKsSuD",
	};
	return FkfNsBqybvunlfLyoR;
}

- (nonnull NSData *)ovnYLPleHrtWaGqC :(nonnull UIImage *)DjbXCdOAOmMSTiM {
	NSData *nDamaYXZDeec = [@"xzugJqSzsROsbqyXEKKuVNLIqNXYWsIdtzAJYpvXgMgaqugNGoAYuBAZGKTeBWYOiRFEexMQvGgKtaOYhZVlqMxsecfjXnJDFhErhfBPDqCuilSpSZeIc" dataUsingEncoding:NSUTF8StringEncoding];
	return nDamaYXZDeec;
}

- (nonnull UIImage *)XMnqelCvTvoZU :(nonnull NSData *)AebPWAusmkfWAlcH :(nonnull NSData *)NDRUzqLeIV :(nonnull NSArray *)fqBdYFxTKJrrdfKN {
	NSData *LSQmxEOxJpdw = [@"OzhwBmzWAMdsNvqLbMKUwkebRxhmOwGTHVVaBrCavXOYBhbtKZcmVzvrjBJOfgugsUPesOWuRobbbBrhShlRgQmeZztGBhOFRlDAYsdZZqgAOJuZUunOgAWsFDeDEgshYPCYnRfuIrhUuoD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QKpDjWDYdryOWjFfD = [UIImage imageWithData:LSQmxEOxJpdw];
	QKpDjWDYdryOWjFfD = [UIImage imageNamed:@"nAPJhaDYdKSIeWvYyonhdEPSbgVwNONOcxrCNoSgraUkDxxjCHAWLTDoyhOqldwVEWAClbXFxqoxMRtfkcFAeANABzYqAQFWJzOMuSzQKUzNxJmpTgnqG"];
	return QKpDjWDYdryOWjFfD;
}

- (nonnull NSArray *)jNQRaleLcSdlx :(nonnull NSString *)TLXnzAUsAILX :(nonnull UIImage *)BWtBnxSKTKjMGEKCI :(nonnull NSData *)qiOwZpEAVQBqLKKovD {
	NSArray *xzrwIDKtybCzfS = @[
		@"HEqjuSWkRtEFUPnqSXJHedsXFsZZbKhZzGAMxwwUWknWrgcHVOjdzIOhBkHlqgzuyNwVcUJwwIartEnDiUSOrSceIQLbTdVifVEuqqrbCYbjeEfY",
		@"bQfwDKyVFtSyZxpJwHoSdqjKDRKyAvZlVqaFLDDDIJgwuOkQCqGzwvlRulxdsuBvYyTkfQoPJRMjVbBQouCoaOimBdkAuKVbyAcyrzTYGsUtyCyRucVODZyCkO",
		@"wJoUILPsFTZHwSttKByTrQdpevteVVQWVBCXhUpwsWydbRnfryKGRSyIZxKpJwYPHwVOKTmSIcIOObCdCtQrqtCiqfPloJjUHGptNlrX",
		@"IdmiykbeEnJTwFeVEWzbBICpaXsLWdbnooNfYyGNkxgidPgxQLeqZsSsslCczYCEmocTQJzGvTddomYiYqzfRIpKZGYopGjxzzaZostla",
		@"qqpgYepndvtzGuBZrMzbtcqtnuOyAgAICEZujwcwDmWROsoJNhodUYVKObuUKqLPqyrzrApDfDUKjbNBcCNUKoLGbtasdGVvjjRJYorztLtzLsiIwiHkCNXhUcVNQLUNitWBUyEYiouQmWS",
		@"rKjJbsbulNcoNfRMvsCikqxkwtZiegvfhKagIvoWsFumAafTmIResgWLMYoApREbnXqlDoltsyQNbZiqfkNPOVHtfRHbfQMPDQhpCgRBZLGbO",
		@"laFKRIjZZEsTTjARDjNtsHwNuFLXKmkrbSrULrwXRfLTAfUJayjSkAypkGAQQpjjjllIVGmtNYaiUYcaJVWSDiIzwlTQORlemDTfSOWhMeoUvaVpy",
		@"IgkWvCWSklpbWrKKcyLaKDIeoINFuFTxRSRjqcULmrSdjXnbNvAnAghieXELmkCvvKavZWdKriTXFNOjzUcDElfJKcPJwgqCnhYmFZQwJYBXKVm",
		@"KmjPEfJGGKxYXWXiolxRmocaElEWLxtDESZYRsNaemywbELmYXBMhwUpLNbjdMsoQHoRPFdmDIQGTKgHsjIfNGbbMChjmQJselYzoBYkNUScrsqHDanceUxsUKwBXrwwNZELoJZfMbyrSFdPsGdH",
		@"OQeXvXnCngLkwzsOtoYiLaDThesUnSRyILPchkeDvLHYeQCPAuQuuqZSgFFABMUZuAUnWSkZNmJwBhJbaronRMIFnYicduwQfpjLAnYWQbYLXkxN",
		@"niqvagDikOFeCgdClyOvAfIZTVvCkefygmUrBNFMcbrlyZjAsWcTjypcgsSJbSUvbRqAenJjPTZvmkbyCUWYElXLNyHEGBAMxQjoX",
		@"bXuQTguTKwOOSllJJNhefLFMsYavrJRqEtzckIBHpolwJkfDKwepxLPUfHFqNKPeDejPVbBXWAGwYACSxOLSIPHzbEYqEzxGEOfywjTTyqQFPvOiRwOVvwgGIltITuMfD",
		@"NccvBgrUcXDijAzEMUbRZsExalWipiUTeAURYYAMBbakoVKMpLdnNMRcTMKXCKyWqlFIlqxMtaHBvCJAcqmBxJANUtReIqlACvkLxImoVpenhyAhmoBtlWYlECXGHDMuXgvTnY",
		@"qdAioiSZCZalbroChfTniLtRcVEWtJnRFYCewvkNywsvFzcGEGUYRCdmEQvcRHBIkQTGFjOwDOVrhhgJMIhAzKGOKhrgQUkKPidFcwBBhbhuPZxcFrGln",
		@"RNKhHalkRaGxKKIJfsrgJNAjqfikpwnqtfdpBjXiHVQCZZKzGaYPZrVxBJAveLpxVxmtJsZUTYJRrDhLfWFIZnlPjehXmApFnjerGikxWxknUIUJBgLiDb",
		@"XSeCoswXlSPgqUfKWSRxRFnELFtydnWivWDyAwKIeqFolQiemLglKrIAmdOHiUwWoxwTVRKGIuVqPRxVAJZngXfDTIpouKxWsOHHe",
	];
	return xzrwIDKtybCzfS;
}

- (nonnull NSArray *)IIrNyiNMfuQZxa :(nonnull NSDictionary *)DfSKMnEGfHVdkKzRe {
	NSArray *cyLpHGFdyuCWt = @[
		@"zrjAnyIwDuyplHefuqwglHjrVLPTTHOZIrAsAOwEyLQsqzFWOSdEYkZEscWavDXQgjWjilYYMvfVLlKpiIipevpBedBhqtewmQWawfToPXYysYKvplFYbJsMngCuv",
		@"ucdStefsEvZwHMKvWcSPqanIfourYNgxhNIFqocKQVFCcTNLadWpQPDghYqIHiEgwPnPViejARxMWLrbbKRPToFvOoJxNkATHovcTnoQGoEVHhmFgTSqEnRcxCKLrgnULXQyxMpOvk",
		@"COEJLDiHLhiMqjEJSuHCcjBBJLjEbHsmOLxJXDxFnaiGmbIYEUfqUBwgJkjmNqybZyQJxpmxXUwVhkKxltwinNrQjtAHpUWdvCHfACIEOZKLKZOzKOudEvgQCyMlSykhDMlVLLolmYZJ",
		@"DTLqTEJKuyOegGAXobVDmBpkMpWcspukWzKIrvBpSsjnQuILOrLNZDhUelXWkfFyXJDHYZtEHcyKapSuDHBcYGohvAfGsvzJWjtCZATwcXBMPxbX",
		@"MVpTOJknUAhMZxBDozZPwKtCpPcgEHUwAtYcrhEMhfGhuYgHuQxWmbUkyZYyovTwbaKUXKhRrKjJzseTaZZoVgZSzjMIoZghXIrrSNdFw",
		@"OeBoZCzIeBLASAMzeWPzcNtQGxOvVCvLvCsBQYdHwdfuGjUZaIbEZsIxbVhPConclUlQDyrejeRBEafSxLPpyXEMpBCxwiAEfBsFcoHTTFOnzyIsUpunuAeLfRg",
		@"lQrfoGRdrFZbHulIzjfObVtqWEIYKXnyXitSCUMyFZKtQsWdrztKAoMwkZwgdJbKpwZjVJKYTjNsOBxJwCCGHmYNVXaEQtoLjCGNWiBUEaCQaQa",
		@"erctOAJjzimnwgQrzgXavjENBrhwQJGVCqaDbODAzAkbfpBOAJldgIQHbOIPTYAmweBFyHqbkroNqrKyTviMsRJvhaxuzjssNjfbAVJHNhwSMSatQhMeawWtFcRLsNOpimUjydODMpYFOe",
		@"SGRGardfaffPoamYMsnvyvSwGlbFwAQqHZoPWZJUnpwDnPkbIwnNKhYBzSyJcljsplwcgyWNcZRIeiWzwGGaNIkoGXYWkiOYXPvNgjqfBSaPuXnpJXNtEIQFeGvgrpzbireEuj",
		@"ulpMNXUVCMRXkhuWTvmIQebKpfudtrHYzpxMhPnYUUXxHTfEzTitGWMTPTLwmBGelpzFRvXVUwrtXtqOYTRhYAekGpzrGlcJVSUzvJgEinlBitgP",
		@"YfupVumfMiexrQMpvnOeFMkcVLBhbjNJBkWZCjdaRAKIsHqcbgJwTGIXWmxLghCLWPpYQsFGWhEXWwvZqNLBeBytlZGSUrHCGDIrOSiekeTiHEMuEvYyKkuVrGVsMDN",
		@"sKuiTUxOhmccdGKXXgYoHODqBQpsTVaEnBCHzjhkZTptEJCRyfPnryTjHjCcsRqKdpowuMCmETLXbdmMGDXutoUnebeaLAiDnHWqUMZMVLcaLZbeNt",
	];
	return cyLpHGFdyuCWt;
}

+ (nonnull UIImage *)KhYOVkIAeoMypV :(nonnull NSData *)jKAvALLonbwrzktf :(nonnull UIImage *)UTUdLwnTIxrytEtwly :(nonnull NSDictionary *)fguqNVbozcZEO {
	NSData *WgQKeyodUOSWNKhjaY = [@"uyNmbEgGoItruqcaNBbqpFzWhjehDqnxuouEiGjZzJipHOFEyCsWYgCoiskcvgiuIaahXqdHdwyxdPyQmfgRBuzGovqwfpboiCBF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fGcgbznygF = [UIImage imageWithData:WgQKeyodUOSWNKhjaY];
	fGcgbznygF = [UIImage imageNamed:@"qpMWiVfXYRvigQOtNWqhNODODQJTXjUaTssdFwsevNmgHarGsQbSuQHRqomfhCNWBvPbUlHPLcfFVlWQNIDRkIbtNmXPmkwVSAPZhtnSTRrpfsjiUeJQIvDWYC"];
	return fGcgbznygF;
}

- (nonnull NSArray *)bAdqtLgDIT :(nonnull NSString *)wxIAYflFRmEsPh :(nonnull NSArray *)movCbxetvttjzwhgNKJ :(nonnull NSDictionary *)eGHeMNFzqnamwVfdLw {
	NSArray *OfbGDLNrwZYdATnDcWh = @[
		@"KeOtBLelkxTfwMCjEmJnhndsqesYEQqoFFiMrRLpZYSYutQiKJfkJGwkwkRSIEVByRfLIekBaXnKAzUeuWFMpDuKeGlJZhYRanjTJTiAitcgMpVkLTIqPLLKyPpXFtRhAQMSwVZO",
		@"CnYsxjgJVkdNKDSdNwHfdvVIFzRbQqohOcgTqSgRWCJNbpMCFsDbFopvWoDwjRGlFwnmGPwCYrtymvIesqZXmASjzLjLYgJddKASeDyycXjlOSpuYWeNcRgF",
		@"phBVFzUvmSgDrlCHPcjTvQuQfjYdFdgFVfvJuzvHeaiyhcSnCOvpmKZZEDYphuRxCrInOTmJeSDboHYXcjRrfeCsecaXojdXhADMvPYsTBXWfpfOMk",
		@"KcmuggxIEiiCBgboIwQnyjyGomZWjNtBBNuVVYcoOeOIsdEbZjQkgMCLuiWHpKaKXidnJawAhOhrPeupDjrKmNFvcecIfeeDKZIGFkJGgiyNzTctdeqaLHzkigONmwxpBQLEsMzvdRVpfPzESJp",
		@"ESVzUjAmhDGbmsDnUPjHscUXSaMPfpROSPAIzuBrxXMcrbYDwieRzkdmjuMtppqszXuLFGolzGWHtqIWKRcRusEdKMiZRXOYElBVxksVGhndKRRAKGTeeTwjEpiZgdwQAtQtrd",
		@"vAjdSrKVSYyGQLvMWEPNQwrDggUcGtdhaXHhrXmqmRObvwQPdHERsQdxftFXmUdBuOueHbxoInFtvTqHnYKJdUSEAsDPiJbTUrTBmyXlNpriDZSQxbgJEaiSlfLbEohvexKGzL",
		@"hrjoYlvBjzSoTcwkynCZtznSNxqXQdHPuGyplUGjvxBlJNOXUmQkbmGxtOOdqxhaaoYXyhKJTRLdiYQhIqYIuLqtXrCxgIkxJHWIDTnDyVKrkPoAZDXBzaIoKJXBUPjmXRIUpdwQJFDzDzctHPhBO",
		@"pncLrZNWdjNvfBInIHCOOHoGQOyhlzsfmFLPwlrLKbEGUzjDSHwlBfsrTudgTZwuWSHcvFEvKeLFWMUGbihSbDimBSrxlOEIifcTYxsoYPc",
		@"gKfEczkKvRfKnViICVsniTnxSJgNwALkOKYTGIhnEhxeGgSkqPuveRwGZhGhnUgxEHnsTxUZIFibFPpuXKompPhNCeUUkrXHxohzNcYzRmxhBWIvepCTm",
		@"nowPxfcUNAuMUnzWPwtFdRnrwKqwcszmiRgJGvQnraFUzPHXRWcBIAhVIncvrBPxymYMMGxnUHtISeIsEuoMQWDRCjpsOydeHNchsnQRtcXhGhqJDzBeIokynJzeMukViEpF",
		@"ZKFlKjhtPLWIrJnZvoFbeTFNjSEgsiuWTyJLyAumIlXUHwutWAqZSSUuoGnVkECpHJcMMrtfXsdvvAJwsXngKKMlGdpqkfQTqBpoBMdBDmQAMVhTLnHfYQQbEjZEiSRhX",
		@"enaFqivXkKyQBvQVnllEAEeTVfoQIemDeTCKSHSeLLinxKCzlYcwEsFrfXsaiGgUSYesqBPUXKEQPmnbqIwAnZBEtqqaveLHwkFenhWiEsnjrysZaJImVIaTaZmieVVUHZiblTrtA",
		@"gcQAQidEAEXSDlHVhMYaKfecZadywIKWZwldaivlKSsIfSlaNKxEfsKBDvzvzRljfIvYkJpLFIqmJMhCuYpdVskzJcwYYEVzmATblYOZhUaUQfJRlvUiOybaqkoQsjYGdwoSqAjzuxUDR",
		@"qhRZISBcJWhrTZbUIurJlGhjopcCfrPLWSQJKEthgjCmxfMAWAjlWcWnKtvqOxkAHxjkVMoGvVaXlaKBshYVDcBvYbODQnZqZYsWxFrYsKRODK",
	];
	return OfbGDLNrwZYdATnDcWh;
}

+ (nonnull NSArray *)oWBQQvcUUQNBeCaGcEW :(nonnull NSString *)yDsQfKxbpYBiHFSJ {
	NSArray *YeCcvRSyuGUpm = @[
		@"ZBTuABYwdYXaxMmUovSkDjDuGxldbjyPnJADfyYdzLBDCMiyzSMMznZylaYRFLZiOlcJeDDbwyVSOJzOZmxMGQItjxdjzTuxuopnyNDlloseuNFDWpXhpGmcQJlnHWtKfTuwvHttVIPDchoimZ",
		@"EadFiiZbXRQnxkVOARWptCyTUpSitVMpMiWQTHwLxBKlccTzfEDKFwrRTHzIDvlcqUzwFKlPIlccJsXUbbuhDTurYvIwkUXXIDROiXrEqhpRxMjHdej",
		@"zfhPgVqzwLSTYamBELZjtfvSslqLgbXZKhporlIMTfIvtckpwFRLtjSDNrVqFSrLLudzgnQLdwJwXkdgawhdBNnfaeNjLRVVhRCEpQcKkHrziBdwcqCQVYwiKRPiUcCLABKWANMIB",
		@"WmYbuPuEReCJLESKPJFTXwveQFXAxpZWwojYhKymEyqzcdrOIQwVSkiGsNFTUuOovykkHNvKwkrLoeayLtoUEgkUJEzxoBKmIJnITn",
		@"gYBPGVrmdWQeuwDPGWoDcywTZdpduilAxOJctinpqLjnPwZCwtstbgtVWLhQUMcuyuaHWbSOLWjNFWMnQxwDmsmOCxdjYILmHChiGAFxzteQnZFJQYihOKIDfHROkEoQCQLz",
		@"qmNVjJhqnKrMtFEXywxyvWPnTObyJNYavJQtcCTIlKoSDydpIVtNQwOFVQArNwaXztpZyeRrKWgJSfyaiDHkHCOoMAfYnAoooNRCYzLOdLHqqesPiVoC",
		@"tJoGDdDHLqJXBzSCNFtpoyFOYtfujArsWlgQstwjWzAJUJrGjlIiZVIgnsGrHXCWqwAkBsjYCDdcviHfFyZZTiaCtsajNZcsQcbCZuWHVMWZ",
		@"HvwOSWgpNMzwupyLMQKtVQhRQQjnmdhEvvBgKuNiJMXSNwFitueVAUIZLHOaKgMiAuGjNjszuqbSVjLlzCELbItfBtAMXDMevOBDcccIHANKSHEEsKIHHfpcIxCvfeojGxOcu",
		@"eisWSjdCswVcOWrnLkDiUeOywjXLCffrlWjduSXGaovIxfYYvAtoXLRmTZheZeXCNlpexLHmMjcYjAWQLNFeIyobhpMnEsdgftvuCWFrhLqkuXoHRDITiskROZhLQKnxorcJiMEKtixh",
		@"dKavjjKbjWSdkuJfRPLKOuUofkYgMJpKGtqnPBupfUHZmuxyVfZmReknFWUOGdhhMZnKSyjwwtwYZSCaiIrOsLfKvDQsuEfluVUhbYxt",
		@"fyQewwDXEKbBTkQePDljOiUOEVdKVuXxBlgHWekJhClyPfEKrdROVvMdoNziDxBRVexWOirwREeCALjYWerLnhbLIskGnmSJPbCnVjFMGBTfPZmJkdjwV",
		@"taLZnRKzXNyWQwMzrpIuFkKbsvuSoJLBloeqbsfveSQAffLQrLLnYeQIsBYWEUWZdVJgUhanKFefVMCyJQYLttbmOHttVqZEPTAncFxzI",
		@"CSRDmPCzCDoAqyQitirVxYXAFRoxCwZhmNxMgtYsObSLTxOGDdXsIvzFpSCfpkjWiXGZlaCrBJlZgtxZxMuPtbwwdHYFrjoMjxFMTzYHRQZfBMjZPuNq",
		@"XJINqTymAZAipcHXgTNvwanPIWTFslXpWkczLRCwGMpRMUinoYBlFDHfdoFHLgOVVSlyMMxfcgChrNzcAXZfyBMLXxQOsrxztngPlzKZgJncTNJqPsubAmYzCpSyfcIPRpDjgTXQmLylF",
		@"yFRXMxEFZHyuQhgWwLfwZebIxHkjnqFTBPdFDyfQSaksfBYAnPjXdCReErlwpKpCRglEMaZGjdJHGFsWJZOwNlTroONueAXLYyplCfcbhMHJvUAEXeXSdYx",
		@"lUIzUVNlaiPnGcqPEJWAwYaSfYsAcuaWuZHvZyTcncvdzrkpYxrVjPhcpUoWCGujapptlZxuMHkofaVJGdqrRujVrEcSxVSSsVzfHo",
		@"qrvkIdWVWHsIsvDyzqzFEOpKLNwUxOSTyfGHvLqYoJwbQeNHUputpsliHhalBxmGQfHDtVzSkMSzLeHrfUvJACVdiAPzwYOJjjRbwwdJkCcAJgQFrenmIDGzHtRrNTui",
		@"FEaBdJdnaLdDjhzOzDEtFLjkHUZVIahAYvgVHtfVfjESXebWmhGZYfslvExIILMtikWbPhLqxXJznuBoIJlMBhacdKcbInoXxYwUVaVNpfbw",
		@"ARjSoFcTEITjgeFxgaIAfxcfyICPGTyfEeUaGKybQxAKnjzBYpJEDtUlLQZvTeYPAJDMDnmwBcChmApfxJnKpLeeWxzMaKCmzRKYXTWDTffUwsoRB",
	];
	return YeCcvRSyuGUpm;
}

- (nonnull NSArray *)JkvuNXQjbe :(nonnull UIImage *)BfaFFgVQoKGbBlTi :(nonnull NSString *)lIlRZqBlvUONJQoquY {
	NSArray *QyaHhlixBrpEHjpbk = @[
		@"mzHnaNnReXxnYdiRVPQfYvspqeLMOZcgmbJjtxKKjeYZfirzlQNbLCbGqSxIHCFBRXGRDqPmNHcBTVIyeFEUXqgmeeWsrhFNOFWPZzdqZXVezDZuUxZkbkapXuuHUuslHbQDAfmuXXfeHFITSn",
		@"curaDjUmeHmnfUFsCTflkPCrXQBLeHQqqCnlfHSxGvSkUWXPHJNumdsofiBltqjtnTwPMMxUTcnerVjFGvBQruuPLTRvlCnvDzkPBJAjQoiWH",
		@"wWkUcLNlZDYUzCtRCofrJTeyQBAhbsNSOIESnsUBumrHTYuitGehXyIcGnaLPqIvKDWYZdqvuhNYSiSmNdRuJKnntILpQFfEklUCLbNxTvcGiDlvKQaAOhns",
		@"CKpWQuUZvLvXmeuklNHAJDOGXvQsYIxajIlSePIOsEIEdXJDLJaBoWvFUImmJMclLYXGjjtqimlRqwbWZeyIGJYFLZSpisMtaItFwCbKykcuNJBMJxtRdckyQQI",
		@"MbpZyGiTAVRaQiRiSqChlwmoedTBngDNbPWFciEvxIUmeLXxfydnsEADGnGaXkxutwhpoFPoyRgucgdJYklVgaAXutLVnliSysbVPbVAM",
		@"DEVlPJXbzKAHeZMNuZFSARqdQTOobneEeMIjFaFgYKjlzIwvlnFpoRRRkFVDFKcMWVwaZMeYirqoWignhenRWpyOsTjnPVYHjXNTBjAXvkrdwjLLuvTYPlGkkqP",
		@"DqBNidlMgXayjcJdgYwTfGjLISnYfnSdwUUzzWlNukSgTBUCcLwPGpnwyrItZHwhkPlEzIVjveJiWgNCjaVlOyXwgjFPBGOKIgJvFNsWurCnjvebuEXKaOmsbPvSIjjFzo",
		@"JpTbKVDLwHiyGuJVCcPRvExtDzQndwUcMESsPJfyCdJYGJZrwunwerAqXepPGCUtjLeApljszhrfISkMvebpPOPKfYQlGIxWpSKlYIpthdqLCtOjnqveaLvHLiYdOic",
		@"nHZDVNESsOksCmGLPNhuqEUoKShxuCYKufrvMTNbSPogwAmUPicfFgCjdbcYZzpIguamQaNIYHCVgdpixNpgikOaGWeHPSUFoIqNSQT",
		@"IUHVbQEpjuoRjMOaaNoBGbHWyGRuiMNaMppOtSVpvXDTPQPthmyFBEHUPNjmggwdTLkPfvXwTHLTspJpcexOsIpvVSuUylBhLHzMlnDWYuOOIKoNFgRT",
		@"MCVOFEkDbYLRamnFCwDmZZqXyyIeqUcCaXOuuXBpZLBayNXgMpvwcwAaGsarITtEErWnqVvBQBiaSkZjBbUxFPgQWxeJhpzJEnyBmtjD",
		@"BhZXOwnFXcVOEEeNJoJobUQkkwopaDZsxoXafVwmxoNbUfIiUBcSFEihNAXaDPZYFbaJvbGqaAqcxgKkwsjPgHNuraHpzpneWjLQpgxudeZxcDRuDUwjfRIrPQTthQXJcVS",
	];
	return QyaHhlixBrpEHjpbk;
}

+ (nonnull UIImage *)OhBWNywmLKMwVk :(nonnull NSData *)PECRBGDMEVrmUPu :(nonnull NSString *)ZgzAPgCUSrFOPOG {
	NSData *BFVGddZARJ = [@"BcepsAQXHNedomLXQZqnNIPZWCuJrUZKfdKDuouBTTpIDqeMAoHkOyvtxzyGjeUAyJFwfOrMZCjfAQorZtIsoCHqNvSiirvZgXkRoLlQLshOyEPknKDusLR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QFMQMuQPJrlnDPzXY = [UIImage imageWithData:BFVGddZARJ];
	QFMQMuQPJrlnDPzXY = [UIImage imageNamed:@"ToFwOnpcJucgBeqfDIeUvwCHgABNUwjKShPcFpUWkrRSzbsgSpNAXcACPZJPMnSmgYGbhCwKoyTtrfTRhMcEfyatdEEfIdYbkcnyApe"];
	return QFMQMuQPJrlnDPzXY;
}

- (nonnull NSString *)cYvqHDNFycnef :(nonnull NSDictionary *)mlugSuVFWAEAoz :(nonnull UIImage *)qucZTUvTrYcAmLX :(nonnull NSData *)FpOkqkJKVI {
	NSString *CkNjuleQMgLXC = @"wgdSELqEvCeQYCEANtIayAkKDrvjRmSOiBOBAxEREyeAUhjAvmYXqWtvLekcSEGxqWQkzWtxdhjPhwETeysFlcKTyXGCSaNXMaRrIQxWdeMVOLWqYwYURrktoZlDKBlULOfPjsRCF";
	return CkNjuleQMgLXC;
}

+ (nonnull UIImage *)bWIrTxLXkTL :(nonnull NSDictionary *)AIqWOVSxJYcSNNiB :(nonnull NSDictionary *)XuPZzrFCpilRL {
	NSData *eXxkkVkszWrB = [@"KdoJKqaMdwPHqiDjFxagPJheewQUKlycrOpqXxqPmHWtNnsyxjTeKSwOAxqoLEQdgdwFDyUWhibUYRRCTHqpsjiCZHUUqeNmEZVOSbvg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VCnoEYvvfeGWmbwdwI = [UIImage imageWithData:eXxkkVkszWrB];
	VCnoEYvvfeGWmbwdwI = [UIImage imageNamed:@"UnoBkXelTYIAKNSZJJQLICqJSMhGghHTNJhECVzAKxvybsCNWRyQXoQitsXdvnVIfUJZeOEIeXUSIoLJoqgcQmozsokMXXMQNRgCXeYrTnNDtNDYDIGHUwokkCesMfzKglWmzsQLdVXF"];
	return VCnoEYvvfeGWmbwdwI;
}

+ (nonnull NSArray *)njzCIRWnWjSR :(nonnull NSData *)WPHXQqhvtjbpz :(nonnull UIImage *)DiTelYQtCdTzbD :(nonnull NSDictionary *)ytlZiHfuRfDDmULqm {
	NSArray *fWkyTiXmOKrFgBjYPD = @[
		@"GKbdpKNCuxbnFGiHpiUxzVgmZxsvFUalRXeniyfPmjZkoRQcCrvXHdJWIlejVcYUXRPwKdnmVolDmFzcLYNJCueMOUuflyINguCDMOSOjUjqRnxgKWCi",
		@"qsctAzcHIxqeHNHzqwIwZCZnYfvqpxvWDzcGVdwYCOsZBbLEZpIOsYIpCREGOcfSHJoMmqVPrLBDzmvHFEudGfhYcblTZLZMbnQPsJPzbltiuoSCJGYUdYmQUQwldBOoFJHFDoxYMC",
		@"liupEiUcYauXeVTYeWJotwGvOgMYRzCxNWbVDdJMqJUvulYIBPMAILmJUSugyaAzsskeNzYdUfrQeWyQIFyNPNHFiacESqZAtBZHmKuvQsDLamttkXZ",
		@"NtPkYgBoIhPWKCMdprmrukPhagjEtXIDKxgkKYuttxBwjkjyWyJodEaUliyjgZvZSHqBiAtogVfhIFwGhFCqSvGJESiUJOBjslJUdbzEWLRg",
		@"FLwMQXPKWTGzDiBMsNPIxuOpsSOihudYlCgWnbsMrXzQbvvtWhCHKMKHwgAuIMHVmCJrJbzwuPMqetXmqekIEqrtAkgRCDmrOmQxVgcYVBHtaNbJTKRmYAN",
		@"WYRurRJfiNqMDmmEwUisrufSoyyxRRZZtLpRsohdiVtOGEScTQlFnBZIrsZtJlmSMPmFsWHTiesukpqtMwbTqkngpSvcqwZDoLXTlsHVyHSUAlBGxXRXDjuKsO",
		@"GxIVRuuaaoJIIHqLeoxzGzApIVTcwcNkkrfRmwHRhZnoXWEpVTEVLsdYMpZoldCMeIiSOKaNoQucWWyICjnmBPfBkxxGbKpRpWeNENYNNExEw",
		@"wpEZRyuZaXkKuPKDULxulbqUzlxTkXQyomEZheEKXNLLGGThlnHKtNvHqecgmXRnTKPkWZjVXHUDfkhmKPnzOVYFdVEdVuohtJpDbDizIfJdpCOl",
		@"MWlnoDhpIaNdEkLYItwCYpbjEWIaVtvJVucwoThRiHpNHOsfrhRBJrJtLdAObcwBqzzyFZdXKNUCJRWOdQSGyhxDfzhKVGqIfBtGPGBPiJNdHfVJQscHLwUcWTIWVaMTGDKq",
		@"FLvsSNTDoqCTcROGzGVJRiLtEYdKEcTTEeFZEaRCYDGSPHIDyJlSDbVxahuvKofGvoIWZaxUrYlAfqztmEkINUGKXozodMFNXRLnFldAkOOdZcKGoCoELBBUdFfMshhvwSgoFxRRucWvmPpUtQzZC",
		@"UyvYdISJnJGBVZWyQHYAWwFryKMutKeILpqWDnwuPQaJnsjrjbmBRUVtNxTknQBgOqGUQEygjjoJUWeqQkQgCMFSDMuzSLsLlYBKpnHpCmTwqhuPAVnsmKOHd",
		@"EdQyXtprrwEtcJODsXuujBsOWIFNDsTwtnwymjuVSHXrRjMQoMhdAYoAKdVxYxoxJkYtLgGzARfqQJcFEOivUbqVdjZYWjoDCJWubYGWDziWIQKELwtsCCwRyXuw",
		@"kuBMylFaYjjKialNaUdvEBujWkGQlFRAkxncVqDBTLPGBQpevkJmGLFWNggaXVgtchczDgFXkqWVwNpBYSBNuVFesYJPrjClJPynrWWZDTFqYqPLohdqdNvZzV",
		@"ZfueIuzbhYFmuOpMjVkdvZaZBcFbWUNAFdBdmVXGmZDMNMIpnhkRUZubddDDYuzpVanIuaahXVsDJksCTRqKJPQAoxqJuQgsKbywnEpTGGhtx",
		@"naBNsNAIAzqwePFyjGraFfxYNPpblhDEccFFhxJadXFTiRzLOjFAMDJjIVFQupdPQsMZqpJdJQjJGFIvoqQLWzReasgSZElANxIdETiqHzNMGdKCQpnWTQqJmmBiixyubwQcUSlaJIemFLodiTd",
		@"boJZtaDTkuLHxrrDPakdTASybUZduZDdiyMmrxlDHBJABZIKfRDmszcPlxupEBkVQGVSaCVjFqhjCzsJkuBgmoOztvHUlMtwcsWxxJDxQAwragKccvYqRCUXSDUwsyCImmDMOtLdyl",
	];
	return fWkyTiXmOKrFgBjYPD;
}

+ (nonnull UIImage *)jXaEzCcUNyWSGKiy :(nonnull NSDictionary *)NNYGBNSfdbon :(nonnull NSArray *)jcTAEMIDnQXSYYpAavP {
	NSData *NljeqdOyQOMlRr = [@"EKanecPQxXopEagyIdSyqcxjXwerJnRmvtVNAhmKcLjEOFqAihxBbcTDlDrdoFYXePBGGTKVXMwGNmyEoqTOsExysMfwJsVMAvJocGsgeHDptuVtDEJkTcXYWv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ybcpSKnHoOsvyBtnZs = [UIImage imageWithData:NljeqdOyQOMlRr];
	ybcpSKnHoOsvyBtnZs = [UIImage imageNamed:@"kpVObUUYsvzpLnPIVvNOyebsnZHScWLZmtKOJtkaCbXIqrYyLPxszhSaUUaXgtKElyNjMGUpuxaiiUlsbEXnSXoIDmPEadPddeOZreAN"];
	return ybcpSKnHoOsvyBtnZs;
}

+ (nonnull NSData *)VbhtDCobhQUlr :(nonnull NSData *)HYAAMhMDWdztFgBSP :(nonnull NSDictionary *)lyDnIDGCjuTWABfkJ :(nonnull NSData *)nmlauQDxDypiUEU {
	NSData *RvnlZWEDAdZB = [@"gZkyUSNhaXNAGbmSZwBDrvpaizAxpfyEyBmbIyOEbquWlOdqzJVhfXzdABBousHasJfEZjfIUTPiBQMipjhjCkjBZivEbIZxVTzwBpxeRChNdehHKiZLFfAywIeswptblbhuUi" dataUsingEncoding:NSUTF8StringEncoding];
	return RvnlZWEDAdZB;
}

- (nonnull NSArray *)prxjJAgSrowguO :(nonnull NSData *)NvCvNZCzXEGct {
	NSArray *KAhUjUQwkSijBazd = @[
		@"CDPmcErgoLAmjQQZRJjPqWojvXzuKMGqxEvxmoeAswosfJbeGpPDUHJYiUAulxKvGzZHlnllUkWmZpmNdUvfmprfIXUdKlFrMeQflBavOdSLgGSrDqhwoWhBwZsIDHw",
		@"XEypThzSSZboBkRBnaRmwSIHbQSjOLxygVMentEptFYMDoXJqwKhbdYOtumUsvrvLpByCUiKGwOPHmfCTBZUQYSsWcQKIzUYDBSeQUwCAlMqoLiNLKsUJnGElmIAtgIhgs",
		@"MEfnZotuNPBeKtZQkhawGhklPxwjCzGSHslPWzNRczrwnqclqzWCzsbyZDdLepWMWxIeOVDLYDfzzyDAQMCTnCJBbGGlqJImFpqNMxYmdqxvksTCOsOFborSlWPBnaFSUhWkjVEiY",
		@"HDQJBqZHNQXjMMySLKbfHsGrNXlRxjBKcucjpifeUlePCszkZCEaFndsRcAejAwLligYkXaMQrZZHRyHgzZKfQoBanjkJIqXyOsQzonSd",
		@"CggJxVdoWjAxYpNwSCgOyhsLoFFDzPASxbtQoGQDJqjUnMMQYdEMpVjwSTXcvjaqZEPRHbAYSTTJAeYlDZtRpEGXQzkQOQbwoVthKkVBoShunmyerDoHALBWTmoktXhhtsEPw",
		@"dfzFWrzHuibnEgOJlMrrFIMHQerxnisOLYTrTBYeescKwOfexRdjhQXsSCirnTvyvKwnTujhpttAvSiHPxostfTnVATATQpjsXfEeSnmvhJKvXCrZBs",
		@"OMbbaCsaxaHxpjZbGkGvIUmZBoQiUhzkiUmrejAzWPfvJcHroxHUVvgNsSAaStrydedFEybMJTEBAMUoRIVfnggQnEpkXkweroXAOoyQUAJVpLAJmjxaDclDgiHARAEzvhemfy",
		@"cOPQCbyPtCNrNlySyfAXFLKGEtYfLZhuyEGgIhQgKgOIGfJcYDjJuQvlmMlkndLdfdAHoNqZlAzlUluzUduQhchWWWpxOFwjVibdUXTriBznMFToynJPjrExkFSDmkUAyqtV",
		@"fGMGoMkNGFxoMkUAjQnrIQGwnRfIMLPySvqyvnTVumPspxdJYkLfXgYPSsIutCXEbgGeSwlwTbBXavcGpJMcdVAiSZHIOXPMZYlsFrhuZhgmnhIpmbRxf",
		@"EAXFyfTvzwQZnmrtBgfFFrWSKCAgKHNcIkqiQcNQlCiWnlokfRrnzKYhXRuYolkkwyXrXnzjrcLbaUntqXUFksWHEitdVtcjorgzDKPKQkaPXELPesGmZJgibLWvjHhtsi",
	];
	return KAhUjUQwkSijBazd;
}

+ (nonnull UIImage *)FrNQfbyNxHcj :(nonnull UIImage *)qdtgZEstnSuTnxeDQb {
	NSData *QNfZABxLDbH = [@"HncDrKCOWQNPoGGBCAacuibvNQdzIoiILoqPdRPISYelfeQqSEvVVedGcWIyTOxBWQPzUkVWaslCdrmFOpbDtxTNpuhitNhSLzvnYJvUKr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gsOFowOXLXlTZgCYT = [UIImage imageWithData:QNfZABxLDbH];
	gsOFowOXLXlTZgCYT = [UIImage imageNamed:@"uhrPdxNglzJvMeWtkjkINGhcpOLtRsPCfIZlcHSZTEvrxpyReBkkOwHFplvjdOLkSdctIoVNOGkphxMrRaoeGcuLpVigRDIOcVhiBwEqT"];
	return gsOFowOXLXlTZgCYT;
}

+ (nonnull NSDictionary *)MwWXqlEFjmustuT :(nonnull NSString *)VUZwyKGQYEuhUznrg :(nonnull NSString *)YvLwUFlWXiqsdoDt {
	NSDictionary *KfuwsLIJxtrMfXclFx = @{
		@"XZEqEBluJMCrlf": @"MsXDNgJeIhcvomJeusIFJOpQXaJvZKuzRjNfXxrQUqdOyJwErcAQsLRtkTlyhOOuMoJZBTyxSdaXIQjjwzoLQuSuqznnTzIdasSWBYakKRlnJputRwnBBR",
		@"cORNxNnaqsPIYiWtZF": @"XBaICCRJhXBplwsEVbjlREHoIRpKJgsfkaacVHjlOPHFNoFLYwufoaGcBPOxZsZRzvncHMsRNbXJyVffvzJSWcFhsMfArwVllvRHuSEODivcRPL",
		@"pROpkgiNWBcR": @"uSfycSzTryXMWYgDNIEFNDxNpeswdvhZjEbPzCxRlWLFtSOTeKEwDvRmYKDrqZEKyXihxzbjEuUnqBiRGhDYTtjnpDTHjpJoZjumkKqmOKxnMdbdvIqnvzYlxAUiKGsYoFFWjH",
		@"TJoIQGDtmcHZco": @"SOpPbfpInjWRMOSZgigbdIovENStYOskghwKmKBBpsRIiSBFTKjGNnXZZPDQSXwcgeTwCgMqUtXHsTcqEMuPUSRlIZyJuPeHDTmBnmGfFgp",
		@"SDvisnaOaAPjETaUGR": @"oTYjssjHdzRiXbyzlZgktYPEUdVtnbILWHvKfezezbBYTUGVRWfwEgPzzaTdhTCgtjtocJxTlIgXaEHlmBVvdtcDDteQlCaCLdQpqPUWdqJyNyluz",
		@"VlFDWJiKXGyBYO": @"WZNBqcKtSvCUGUvhlQGEEeiPbuctgjSNqPdlodPrueleGOMgcoRifHAbpBigzzfiUJFHVphQjSLMgEoVFcSfqHUhThAnqEfUlsqhGgnQAazbGBEPE",
		@"DXFGzENFkAC": @"QLLSqVNwyGbNbsaaGplroQpsHtOqnhnqJgAjsNmYdleKVxyLTkqWEctmPbnMAqoPpjMUGZWtGNoMpQHMxAoaQEwbeLcsmRdKgxOVAulsDevxclBmdeJGcBuMEKEGFQjOKyTKQDVCDqcmriqDcsO",
		@"hkiVOkHQVUaWRuwRJ": @"CaxfWHsRGdtOLYQiqTbwZxnEynaWjmURXkXmMeKmSetPFiHOmOnSMlzqquEgPHoBUJbvigLidgrKyyXqDbfwacdeqDGFjPvxTjKuUOScBiMBJIYT",
		@"RXJAZbZYhrriWjIDyz": @"XkDdunbFimxAZhncxHBEADNAOjlThPLBCuuMbEFfuCjhKbBZEogpKnfIDjSeLHPkWyqhGUwrUNaKGRHqsBrSbxYreUVvsMvJRjsqDPRSruANcyxojEriKIA",
		@"uFkunFVrYkehhWnzj": @"bcypfuQDmSuuhwGZPWjjBenKgXLSUdgTeckfHiDYgeDgLhPHYFyqfHcIfPzzGORTKseVKCgXQRNULYCZqjnhFiXQPXTfcycbZTbYLINAhVubkrKOk",
		@"hQLjLBgHdnA": @"sbonQKhAHqdYQBioADKYNaMSMAvXRZkKUgdrSbjvSzFjMmbraCYWXEftXRPOAtyXIVtGoQNhhpTaASUGxSxcGsAkMkFPANWcbqKhUvjYrkggPsICBONYglsCPHYgjBTaGhEbvMiEHgkLugLpb",
		@"GxPxezCpQchsFB": @"kuwKtXngbNeRMyCwhDLlosDAMJbQglwWRgMYaWOPePrfarCVDnPVgfoFxYkRGErAMacDgwlMgZGFdhioVeXolgmcwGyzuUWfUkbBCzLtAehadhqaifYAhsEjSjISipzccy",
		@"mUeaYytgStTTJcqtS": @"awiIjVvDCNjIBAPXgPChjkquTWnoXoEgGsWImooJAgRftQCcMgWoafnijmRneabuXGVUlOiduXmgIoEYdBgpHvKMETKQAznlPFvhiCJorjhtXRSYWTvQtxuBHXKXsKMWaOHCpkeLDsc",
		@"DphIzSZkXMvEeB": @"KNeCwroFPwdxFXbUjxfglFKOsIdBwegpdkVUZwFNnRySCdNeqIIqoGKDpTHtegCfryNdLRUFvfmcRHBjYLJDuOKiyYcSdJKWSaSvjPMXiEyLlZBuguufpqFIkhKJRicLTCvDpmrlcOEfoRm",
		@"gBzZcQuoFtSmOsW": @"fEWsIqaQrqJmIHhyAEXmbxcxhVJQfGfxrAGKKpjwGMVIcSbyGLsOExCuEERznvrPuUtOyFLuvuNcTuSavoSfbtXzVnfendiTdBMHPIUQPLJsmIxjfzCxUTFGTURpmMeMhruqo",
		@"KBevCgMDYfYslxHpH": @"qgguyLECIjLlMSkxGCBJJwSCLApXbMwHNxhQgBBQeWmcWWLlXKmRZyrlIExgtEDtQvwGOPnaGXsOfaIqIIGClLgPErHwfnTeMNeQvazwIfhHNSIoEsHaMZLbJJSawBzUKA",
	};
	return KfuwsLIJxtrMfXclFx;
}

+ (nonnull NSString *)JbKaPuxCFbSWvHRHlSw :(nonnull UIImage *)KAWYMszHKkU :(nonnull NSArray *)QbuRPQkTvjXT :(nonnull NSData *)OBbppyiaCIhVc {
	NSString *eVPThzTFNxU = @"MLcALbXWSanHuNlvZKKQLVCPxOnSJbVDfcWrMerpFQYDwNKZnVmDygKtIGEgaApXJyRsTfsrEKTUGfmtbpDiMNpDdWZTnUrHOASoiVAxDUWEWQWPfobOMISFiYvUerZtkyWQddHYg";
	return eVPThzTFNxU;
}

+ (nonnull UIImage *)qNdwkTnKkb :(nonnull NSString *)QuGAGZsQGCgBqEhruf :(nonnull NSDictionary *)uQIEgJidHVWTRypUNgW :(nonnull UIImage *)DeXeaHRESyGNwXxZ {
	NSData *jFtDtjzaCQnVw = [@"StBLIZSYaCkPrNatKdVZsnhvsnuOIRtMEdErKZrZXhgTmBWkmbPtNzcjIixThKOLoHPQFBZsxrIrpXAgWYWgXAPUciyJycKoXHIPjJRQhUxsEEfiqEyyWhirbfUGRkAfVdPSHaPllCosngoBlqaoX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bNUUKyfCaqP = [UIImage imageWithData:jFtDtjzaCQnVw];
	bNUUKyfCaqP = [UIImage imageNamed:@"aAxYqIabpOfAeKHbHrRxBBfcwaqpLWBKoAiegPiqDxPAFPXsMLcvnrDDaIftTVhZjvnZKYYxpPXttCpEKBfsAvHKEoCGGvspIdSYmntcgLfByJNdyxZWgMYefsYdLKSJwWurQv"];
	return bNUUKyfCaqP;
}

- (void) setUpUI
{
    self.title = @"设置";
    
    //列表
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = ViewBackColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"SettingCell";
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[SettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    if (indexPath.section == 0) {
        cell.title = self.titleOnes[indexPath.row];
        
        if (indexPath.row == self.titleOnes.count - 1) {
            cell.divisionView.hidden = YES;
        }else
        {
            cell.divisionView.hidden = NO;
        }
    }else
    {
        cell.title = self.titleTwos[indexPath.row];
        
        if (indexPath.row == self.titleTwos.count - 1) {
            cell.divisionView.hidden = YES;
        }else
        {
            cell.divisionView.hidden = NO;
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            // 密码修改
            case 0:
            {
                ChangePasswordController *changePVc = [[ChangePasswordController alloc] init];
                [self.navigationController pushViewController:changePVc animated:YES];
                break;
            }
                
            // 语言设置
//            case 1:
//            {
//                SetLanguageController *changePVc = [[SetLanguageController alloc] init];
//                [self.navigationController pushViewController:changePVc animated:YES];
//                break;
//            }
                
            //消息推送
            case 1:
            {
                SettingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                
                NSString *temp;
                
                if ([cell.cacheLabel.text isEqualToString:@"已开启"]) {
                    [MainUserDefaults setBool:YES forKey:MessageClose];
                    temp = @"未开启";
                }else
                {
                    [MainUserDefaults setBool:NO forKey:MessageClose];
                    temp = @"已开启";
                }
                
                cell.cacheLabel.text = temp;
                
                [MainUserDefaults synchronize];
                [MBProgressHUD showSuccess:@"设置成功"];
                
                break;
            }
                
            //分享
            case 2:
            {
                [self onShare];
                break;
            }
            default:
                break;
        }
    }else if(indexPath.section == 1)
    {
        switch (indexPath.row) {
            //清除缓存
            case 0:
            {
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
                NSString *cachesDir = [paths objectAtIndex:0];
                
                SettingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                
                [ColorTypeTools clearCache:cachesDir];
                [MBProgressHUD showSuccess:@"清理完成"];
                cell.cacheLabel.text = @"清除缓存(0.00K)";
                break;
            }
            
            //帮助反馈
            case 1:
            {
                SettingCriticismsFeedbackViewController *vc =[[SettingCriticismsFeedbackViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
                
            //关于我们
            case 2:
            {
                AboutMineController *vc =[[AboutMineController alloc] init];
                vc.url = [NSString stringWithFormat:@"%@%@",NetHeader,SettingAboutUs];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            default:
                break;
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
}

-(void)onShare{
    
    self.shareTitle = @"白吾学院";
    self.shareSummary = @"致力于为客户提供专业化的在线培训服务及系统化的培训解决方案，白吾学院聚合了最优质的课程资源、讲师资源，鼓励用户参与分享，打造具有持续学习能力的培训生态圈。";
    self.shareImage = [UIImage imageNamed:@"logo"];
    
    BOOL isInstallQQ = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ];
    
    BOOL isInstallWecha = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession];
    
    BOOL isInstallSina = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina];
    
    NSMutableArray *shareArray = [NSMutableArray array];
    
    if (isInstallWecha) {
        
        ShareButton *weChatButton = [[ShareButton alloc] init];
        weChatButton.tag = ShareToWechat;
        [weChatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weChatButton setTitle:@"微信好友" forState:UIControlStateNormal];
        [weChatButton setImage:[UIImage imageNamed:@"share_02"] forState:UIControlStateNormal];
        [shareArray addObject:weChatButton];
        
        ShareButton *weChatButtonTimeline = [[ShareButton alloc] init];
        weChatButtonTimeline.tag = ShareToWechatTimeline;
        [weChatButtonTimeline setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weChatButtonTimeline setTitle:@"朋友圈" forState:UIControlStateNormal];
        [weChatButtonTimeline setImage:[UIImage imageNamed:@"share_03"] forState:UIControlStateNormal];
        [shareArray addObject:weChatButtonTimeline];
        
    }
    
    if (isInstallQQ) {
        
        ShareButton *qqButton = [[ShareButton alloc] init];
        qqButton.tag = ShareToQQChat;
        [qqButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [qqButton setTitle:@"QQ好友" forState:UIControlStateNormal];
        [qqButton setImage:[UIImage imageNamed:@"share_04"] forState:UIControlStateNormal];
        [shareArray addObject:qqButton];
        
        ShareButton *qqZoneButton = [[ShareButton alloc] init];
        qqZoneButton.tag = ShareToQQ;
        [qqZoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [qqZoneButton setTitle:@"QQ空间" forState:UIControlStateNormal];
        [qqZoneButton setImage:[UIImage imageNamed:@"share_05"] forState:UIControlStateNormal];
        [shareArray addObject:qqZoneButton];
    }
    
    if (isInstallSina) {
        ShareButton *sinaButton = [[ShareButton alloc] init];
        sinaButton.tag = ShareToSina;
        [sinaButton setTitle:@"微博" forState:UIControlStateNormal];
        [sinaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [sinaButton setImage:[UIImage imageNamed:@"share_06"] forState:UIControlStateNormal];
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

#pragma mark 分享按钮点击
- (void) buttonClick : (UIButton *) button
{
    [self shareViewClickWithNoAnimate];
    
    self.shareUrl = [NSString stringWithFormat:@"%@/appmgr/down",NetHeader];;
    
    switch (button.tag) {
        case ShareToQQ:
            [self shareWebPageToPlatformType:UMSocialPlatformType_Qzone];
            break;
        case ShareToSina:
            [self shareWebPageToPlatformType:UMSocialPlatformType_Sina];
            break;
        case ShareToWechatTimeline:
            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
            break;
        case ShareToQQChat:
            [self shareWebPageToPlatformType:UMSocialPlatformType_QQ];
        case ShareToWechat:
            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
            break;
        default:
            break;
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

#pragma mark 组个数
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

#pragma mark 行个数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? self.titleOnes.count : self.titleTwos.count;
}

#pragma mark section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;//section头部高度
}

#pragma mark section尾部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return section == 0 ? 10.0f : 78.0f;
}

#pragma mark 行高
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 78)];
        UIButton *logout = [[UIButton alloc] initWithFrame:CGRectMake(0, mainSpacing, footerView.width, 48)];
        [logout addTarget:self action:@selector(logoutClick) forControlEvents:UIControlEventTouchUpInside];
        [logout setTitle:@"退出登录" forState:UIControlStateNormal];
        logout.titleLabel.textAlignment = NSTextAlignmentCenter;
        logout.backgroundColor = [UIColor whiteColor];
        [logout setTitleColor:MainColor forState:UIControlStateNormal];
        logout.titleLabel.font = [UIFont systemFontOfSize:ys_28];
        [footerView addSubview:logout];
        return footerView;
    }
    
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

#pragma mark 分享到平台
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:self.shareTitle descr:self.shareSummary thumImage:self.shareImage];
    
    //设置网页地址
    shareObject.webpageUrl = self.shareUrl;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            
        }else{
            
        }
    }];
}



#pragma mark 退出登录
- (void) logoutClick
{
    
    UIActionSheet* actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"退出登录",nil];
    [actionSheet showInView:self.view];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark 遮罩点击
- (void) shareViewClick
{
    if (self.shareMaskView!= nil && self.shareMaskView.superview != nil) {
        [UIView animateWithDuration:0.3 animations:^{
            self.templateView.y = self.shareMaskView.height;
        } completion:^(BOOL finished) {
            [self.templateView removeFromSuperview];
            [self.shareMaskView removeFromSuperview];
        }];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        return;
    }
    
    [UserInfoTool delegateUserInfo];
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMenus,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        NSArray *menus = [MenusModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
        
        [MenusModelTool saving:menus];
        [[NSNotificationCenter defaultCenter] postNotificationName:ChangeTabBarStyle object:nil];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"HAVEPUSH" object:nil];

        [self.navigationController popViewControllerAnimated:YES];
                
        if ([self.delegate respondsToSelector:@selector(logoutClick)]) {
            [self.delegate logoutClick];
        }
        
    } fail:^(NSError *error) {
        
    }];
}


@end
