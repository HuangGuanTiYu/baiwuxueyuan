//
//  MessageTaskController.m
//  MoveSchool
//
//  Created by edz on 2017/7/26.
//
//

#import "MessageTaskController.h"
#import "AFNetWW.h"
#import "MessageModel.h"
#import "MJExtension.h"
#import "MessageTaskNoticeCell.h"
#import "MJRefresh.h"
#import "CourseSpecialDetailViewController.h"
#import "MainWebController.h"
#import "MJChiBaoZiHeader.h"
#import "SpecialDetailModel.h"
#import "SpecialDetailTitleModel.h"
#import "SpecialDetailController.h"

@interface MessageTaskController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *messageModels;

@property (nonatomic, assign) BOOL isMoreData;

@property (nonatomic, assign) int index;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic, assign) BOOL hasRole;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MessageTaskController

+ (nonnull NSDictionary *)uhCplZnEkekXERXuKq :(nonnull UIImage *)qMaYzPOiDEO :(nonnull UIImage *)nQkjkRVdbhJsnI :(nonnull UIImage *)ziZBnLysykIKiFI {
	NSDictionary *CEwzADqFlBsZUgmtRJa = @{
		@"YUqJEsCGvoHIOnz": @"JdVUuxRwTbVMJMMtutsoklOUCtYFerjsVlvDrMgnyzkWwBWaBjqUbEffxDOBoRLcCLfrIEjgiwkTrWIPUFSvEgueuBjRsGbZiHQYXPpxfTMBsfivHUiLkbyS",
		@"UftpdfNaPIh": @"YAHvsHEErioEDEcpJwROigWItWXdiOZwLOXDmQZTDrMBzdHgtPFUtVddDLweXvrnZtEtkmsZmsZRkDVbcVeOlLrMCeJfvZiKBgMRPBjsdDiEJmBuWyCdnvUIVQm",
		@"GBwpZbYDRwLtB": @"QTvwsmprjnAzhwBjIKnmHcwqTCMlWtmYctthlYURtrSQcXPFKxgzbSuOmIqIgRQtMwRzUwHfRUBivxmnCIstVGWiGSCCqhdhGEzUKSOdyPXIUPbUHAsWgMerdBXGggf",
		@"GmbwYJQdUdGedINjlc": @"mmLoGakjfnFRMwYLZHCiVWjRHBsEJSfnvScGmQgBkueSRVhZfAIyPgSAtAYgQLdbSLHkgEbHtfxkbxOpmZjIsXWwZxMXmVlxecbWYYxYeZrveBECmwLwOcxUWWOhbYqDEtvsl",
		@"FzZonHaKdfB": @"BbIAgPEOhpMNaAFyExIsZzOJkVyUwgMuCRUuarOqvTzxGeWrTFDozklPjlxlzZDBrAOTPWGKHIbAszjPJDSZEPfiPOWRPXXivovJHuCRXdbWfPXddZFeCfikEplAhljrMGHOhchBuRdJ",
		@"YvtJjxHQru": @"UEZBzNQtjyykgSXeMgdrjxiOJVorodgzMPVXJMsbowRtriwVPKMwHKppZgiSqXSPQnZiPywaznEJHqcStQFZpxyMrFMYRKnIcKbXYJFuuxPvCpZJ",
		@"nJEeIUoQrPIeFq": @"FcByvUudDoQgUGLPwGTJWOKOPEKmzmyczNzMAdKvUDVSWcjmSZCELezoXZYeujDUQFhQwXmPvDXlRYLpCwPUvWukLjWfAFsocHMFVJQgCxrFUpPwaMmRovvxxdevJOIJiNKkAkBw",
		@"oITVPxDcjygzdB": @"cGOtPiqOkOOeQWZUxkWvyjOhSvKGSmzIEtaWLXNYDkUvKaWjWRzABWVCWLLwZJHmTGYvOPDvhwyUhohLvcdWBWWMgLbLsUlYLunFdwjVWeoYKGxfRdRJg",
		@"QQaXIMBbEcVBQl": @"iAxsBqrgKhpbAuRWjrwpvgVeemUaOogmaDqRJoQBDbgFVTrQpuYMoxAniOCuzIThiseWXSnrbShAxVRpJvNlqBOCrTaDmGZbZlNCaqgG",
		@"hEoPkRrCaeChQbps": @"xvSEalEwZCiWVYpiKQATVSuduCzskyFGFbiQZfKFUuYpThzuCodVtIZalbGztGGDTKJdPMzUbuVPyDCNvLDtLKHfFwWLfDPZFqqRCtNHgPYmWfJasdUkIRiHuzttqHLMEn",
		@"qjfKjPQDyADLD": @"iJaTIOKqrLfKBfkaMDNtPevFFzKZHBdweWfXmxJIlWiuOiMNBciimlTeNGisghiJUoIVOlHmvuEsldXGSihWquxMexRtOBCvcEkcgMSAgtZKSAjFKwZmwbSctdXwgbIFTPqOBOflHhJyASPKfDU",
		@"BBrLqpMZiyG": @"dXnptTGnLbjehNHlbUHUKalmfiDOlfFgtaicULthoZDuuGZpbQoZUhUkExwYYgLblFhIYLqFwEudbPcimtrXUBAwrQVZmuPlwOTNwGuZciFeULWoJMNVMvYYfsqPbYPRVf",
	};
	return CEwzADqFlBsZUgmtRJa;
}

- (nonnull UIImage *)ptCiTezJtyNTSopQ :(nonnull NSData *)piDFckrXLuExxACZPd :(nonnull NSArray *)dUvsZjOsKruBVY :(nonnull NSData *)YiKMZzeyrX {
	NSData *TyNHRyMonVRCCGk = [@"RPRnmZISgdrxcgEHcQSfUDyWbuXbSnAQgKooBoiQAKeVppnsKBCwWSfivjgtQEywxgqbSoYLTzsoyxopEXbmsxtPsbrawSKBSvBURDWBJpqSRfipovTJUIlmNJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yXPrzmDolYYlUmZ = [UIImage imageWithData:TyNHRyMonVRCCGk];
	yXPrzmDolYYlUmZ = [UIImage imageNamed:@"NdAmpLEmaklVUBhCPDiQykrQLMiufSioXaIyHTCLEAKdIchTvussPsMOdmREXWRHveWDBEUWFpAfBUcWmcltHZmTWlForKYphIdAGUuZHYJkdFRqOEETKDzUXBIQmpLNiqifAmClZicrSFEWH"];
	return yXPrzmDolYYlUmZ;
}

+ (nonnull NSString *)WkYGdvipHQkmxh :(nonnull NSArray *)xwgKgrsuEcn :(nonnull NSData *)hMREHwnyYmbTxUiYGOQ {
	NSString *ocSIuhuILOzIBpVS = @"wgtjeYtCwliQsQtcXNxvsjctSCZEEsWqvzBQYuduCkWLKRizALlxJusbGECTXTuzfrISqgSmtFnnDQoBHcqecexRaqMrSaPFWEFwne";
	return ocSIuhuILOzIBpVS;
}

+ (nonnull NSDictionary *)oDVHEDCthfYmfpCqKni :(nonnull UIImage *)kCIJsUuXoyuOhmKnBr :(nonnull UIImage *)EonVlDEMdQaAQLNt :(nonnull NSDictionary *)nSUbKiWIKolbQ {
	NSDictionary *xKGuoPzxzJCeztcgYcS = @{
		@"nQMMZGnqnfjcJO": @"GInoFUCYvSkiGByWofmcxvMAEscjHVHKFDqfRuCcAriVdErGSPYbtQnZZQPDoOLumuGkyqkfxFEovxYWhTUbCAElzHmGwbUbWvrOolKNOYJJVBPJiByjypoBDsFOwpIBJxy",
		@"dBvdFAnlJh": @"LOSKdCTPMatFkWLTlrFwFaCEKOaJpGTrMLFJrSZQoNEJgWwWuxcwJqMHoOyvhXtWBCVvoTkEmelEBmNZKtKrYvtbVwYVniTMTCSzbRcnHrgxquFCiyT",
		@"TdAWRDnLnTra": @"yjXnEhxEUITNizMKEBKXpSlivEcEAOwFiPYtNnXpfNrMUUECwmnXYxUJVJdqLSPrLRYebkcffALvOCzwZYaaHttwXFBnkkyoGJuLJuVPLYdZVGzCQtONwlfMsiAkvexxpDlMxpWyUlhznRXFBmne",
		@"EMctIJGRSKrsQtWebX": @"qNadfyBLiKyCFFGrdvOTHmszYbSgQWKvhaHPeUkRNpgzILxoSYNUTzRLSKltseGEKWayvCGSQXwHZnKzTItSdRkbJJwVgKvRdyZfPPdbrvjPJpnIldspdJuwtenfaGhiwrtsNGrZzCVmd",
		@"FytPIYUcHorVYIi": @"ndUsaxRYBuziGiDCTWvuTbStaUssUpUsmYMZmlPJcFZbyJsYfkpUCUOmpFAZnHHhHqATkOBzjgsEiaHAMSyDxZryvQHRnTsYXCybFBSjZuEbiroUyVraygSYJlvYFIXPDvSkkdwswOIFetHAv",
		@"ydCczyxqtbwqQhunCGF": @"OZjyjCWJHTCQcIlHXiCukNPhTuiLvMVxJYxrHvQkNHvLqOUzkIQICOaZHdFvuxETLjzZtxngKpuNLgokiVJSQuJpRVwklPJYfEZjOQdOKZRqtjQJorMo",
		@"uEClZWYSZbo": @"sBlMWGBQybvVbBcaQxcsxcCClvDqvqSExRtLIhxTMaBSfazcAEXlHVBIJfUaGaMZEarOKdlQPyskKorzAkJhOxuLcOdqaKpEdbwfUozygADHHdglitpSfbfiylGHLCpQnGxQaDn",
		@"NrexZZTXYlcpP": @"CgVRIyBsXHQwMJSRWHfWHmNpyBfasTVoouyElPgOMlfTNajEeTqUkpuFKXDlylNfSxuBJkeCsAxfJwmtsOtVeiJFvWHVwaKWdrkEnGbVmURiyrsSaNOVhcznsWxkEdkjhXCrQ",
		@"jxOFxXKOTtQRd": @"GCrTWNnEzDixOXyvaeoQlRKGuUCsLPkwrIhdrrnBnjTyjHIxNweIorcZDWILKgoTrWRQjibNbJWjaeWPeYMgfpAHXsehFEZcCLBWZzAQFOVxGldKx",
		@"wJkcCMwHITXrhJD": @"AfTwZVPxVyPXnYyspqIZyRyNqDMOtyFxAapPDNvJZxqSdDLbrZxFIpHAuLobSPKXBwvfQsLEFUckoKOxkjLXkLwOqttvKRPOUyHhOHQELBTAAbsKGKzwxSuQzkcvMAoBGhcreAtGSs",
	};
	return xKGuoPzxzJCeztcgYcS;
}

+ (nonnull NSData *)hwYzpawdKyM :(nonnull UIImage *)YuXIoPldPAIucEJnTDY :(nonnull NSArray *)ampomQKmUJnpfdeoe {
	NSData *KuzCfHpssZJw = [@"laoIDCYiuySMaPbHrTerGkJdRMQmlktaBRsNrtAVGolgRiVeeBkhiYZjZSiCGQBPRgyllAoGMpzOJkgGVJjJMrdmbdgOQMNGJDsEUIAjwJFdlYdQXmbpZlRZBdzBNJrcZ" dataUsingEncoding:NSUTF8StringEncoding];
	return KuzCfHpssZJw;
}

- (nonnull NSData *)LsQMNVwXDrBD :(nonnull NSData *)fENAarxSrnUZFN :(nonnull NSString *)SutKFvbtiPHY :(nonnull NSData *)MLvbZtPesaIPAn {
	NSData *cctHzavHtcUyWWyOX = [@"NflXqggmvbnymDloodsYFgwkhefVkjYbXmuKOWFONxBhePnrNSjRBQxnyODuDEzCCWZINXPYPEKFpDmFbIYlOAJBuXuDadFzVmcEtDcAHISuaIvlNfKHAzNTrrm" dataUsingEncoding:NSUTF8StringEncoding];
	return cctHzavHtcUyWWyOX;
}

+ (nonnull NSString *)VNFQPMKaviFPwW :(nonnull NSArray *)soCfCxzIOAJPKZlPSB {
	NSString *aQynYBeeDGFFDjn = @"CDsKyQaIVvYFXLsUVCiuwAuwQypjNobOSAdzhYiYfXYAPbFbgpRtiwJxhiXiCHJsriXMvgxuRMBvoQrPGNeyNkZLIwpwlynwJtVWJBydmPOFwwoDbyeZpM";
	return aQynYBeeDGFFDjn;
}

+ (nonnull NSDictionary *)ZceQWlOkZuDxvbw :(nonnull NSDictionary *)PyHSULTxPhCu {
	NSDictionary *npLgqRxgjh = @{
		@"KzvOqmGDYzMqqID": @"uQNLGfDmMayFvxweYCKhBkKLYZSZllffKfZyTawDeDvRkusEEaMrKYACAzvMjjhthNyKubhpntuJQslnzmEyUtmqbheaptkgqDrXanQPrPiJJbgHdavyhXxhwbJOjWLTbRKYYxPdpnYneXD",
		@"trccHOwEMdREOiBJtWF": @"yynihuHxcmfoDXnSlvzKdrBUXoBgiBXxYdAQOmHiHxFFjmttZpqEPsiaUTlvgPcOVuwrGQKkaNfLyHerDBdrUrezpLiBSgYAjivgLZQclBPKrhcMsFUKBYCKDjfFrRnwWDqdy",
		@"jFMsaPprUgVcNcPns": @"HvprNajNupETrxfmphiujAdZzKlNEFRCQvogtJVtHJbObTikUIBAlbIdzeVChvKBVNaiKumHEjgNOnWqbCHqXwrxshCHZmTpJwNnDnfBOVfaVFV",
		@"KyWcgtPlupXIPjKhSCL": @"PKsvJTaWbrbppbRMJgaeMUgpmTVKwHPQdxmUxmlBDvvcETkWlCadKTqyouHMbKrpzDDxKqkiTgXLxRMecxIpiCjdCTmwARJeDKESjvjRtrejBLEdWrVgKMNjXAaYVmFaWglUNbfsACu",
		@"TlSPIpIbPFamz": @"FncRDeUQJNdzoSzHZoCfAFXGKHQZTlfXUxbuoMoJZtAGValijeAYSFeYZTznKEVhEcuttUvpowgOrjafoIPWrtGnglAKqgsCrpAtXqIKLWByek",
		@"MCGhfpjkuTnMOQFAfZ": @"oPsqwhUtfCAzycjEYbXhLybcprojewZvEREcEYdcrwUmWmTIgxdsfPPAGaasmgSRcwuDZDrGBIXTKUYvAoHXOtIYFjjHPaCBUYVrmimVrwFQWdDraCvLJdd",
		@"KIrrKjCozZmNeza": @"NqjgRAIQfHkgRNqwhoRZBEzrWqNUOAOYNiEIVTsJFOPgySGSRtHIGDqgVUriBhQinJjZYBYAYLHvdoDMMmpPFecBbFGchbJaqCArOsUNDbxgwSuBqpTbgBTtSPxIVnqTBBnbzlzbzyUuW",
		@"FYFOHycTwyF": @"otRHGFzjjbSPphMkUmtbRhdGmeVuYjOuOcoedqUiBZZTXAoUcfBNZrOkeaQRcLPgEksiozIdxbWdvMUfPnXHhpmmuZANkmSeilKtcbcJb",
		@"iDheIROjvMQfRwpS": @"QCPuWIPJfFTurHDlktCeuOlDuTnmMHtLWNSFDDeMjMUXXqkNQdgafCaxWSeGwWppJxIGVicqGKssTgZRGZtZwlJObBnfbOMFBeHuSaTzitHoOfrzCaZYt",
		@"zWopdVNLNxO": @"XVkanWlOfWGeiFTixBPVWOkYqhNWnKqVStSTMlvHXxyfYBZHbOfwvjYUamOpbQAzYlXsBDzZjjtobhrxnbHsjvpdoRbKBxBcdMttGWVVornlkAS",
		@"AvIUnvFWcwP": @"rtQBVgEPnxAaTWlYhBsFlOsycgwFkRaVAhuZYeVyNyUYQMJbFvCwqCyejLfxNFEGKNpKLNVjxyyIEPMBbwDbPhSGnGLnxgEoVAsUHTwuspQeVERtjtgAdYPgmPcTMUIfkElvesJtiarmdGRvqyA",
	};
	return npLgqRxgjh;
}

+ (nonnull UIImage *)AoJPLDDfBhwhrCpg :(nonnull NSDictionary *)XfKuYxbcsQ :(nonnull NSString *)FjkfqlSxfPD {
	NSData *tyvHQnnathXC = [@"iCNrKsBIyWwbFsReeOSsxmHFwzSmnbyfVsjMYeEahQnGKzbpKObjloLIrUagcqqktpQdnFZAyRTMOTQzYkTwivSzMMPWnTcqVAAyKdgYcFeydAEaAZmwToj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VosKGRNQhqLmJCmH = [UIImage imageWithData:tyvHQnnathXC];
	VosKGRNQhqLmJCmH = [UIImage imageNamed:@"KVCqTLAyMnlFoTfzSWwRlgrNxVHvmrOAGxXiZOcgxSyWuPmrhUCBCAJMWnarNJsSeQXgYrPZKHCaMyVQuTAUuLHSUoruaoNQZLbIjpzIkvbziAeVhYRHJCMOGkWPUtriJQGVnCDENJIsSyz"];
	return VosKGRNQhqLmJCmH;
}

- (nonnull NSData *)liuDKjaqdXouNGBaAWC :(nonnull NSArray *)pYJqyJkARsCNYAB {
	NSData *BtIBvgCaJTNiW = [@"jEbPuKlSwUqBxrhGinkJLDlbympfVJsSgWwEPYpZAerjBDTfbgmsfejQzdXoQgVtyaQLTUEBMOOqrUadXRKglmeCtPuWNfoshyZUckbZYnAtJgGInyElmLz" dataUsingEncoding:NSUTF8StringEncoding];
	return BtIBvgCaJTNiW;
}

- (nonnull NSString *)pALrsFiVvt :(nonnull NSData *)GWoSXVosrQUmAymy {
	NSString *ziJgDyEJFvdgbnsaZ = @"wPVWSJoWvVqzTEmyMLWJDxiSRmLDeiXZYSWuULNOLwXnhjqYMRUPVgwGuVwjRZQdlGiakwRBVWWiyCPCoNmfuIVGNokRcPewnDIVkW";
	return ziJgDyEJFvdgbnsaZ;
}

- (nonnull NSArray *)aecrYOoPhE :(nonnull NSString *)FjJdfvoTvy :(nonnull NSData *)sioHgRcevujtGiIKWMi :(nonnull NSData *)vUUHksydTr {
	NSArray *vypUJfOjvPWHT = @[
		@"lnKBZIMzDkmZOUEPtuJSWxoliiYOjWYCbwaBFKTjgoCKzwwFWJREypKCMiEmbxHtjmdceGkesmGqvJtPOWjeRkHcsAoKgQSInGvSPBnyduyXZtSREoELXjvZskKQEJuIDSGrOufTGsVKOH",
		@"fQwPQCwTmhYAaWRyWSHlyDDQBwSzeTSqBlgjDemMGIbMUewDMGZXtzwiHNsnZUBLhfZhoRttCgxgGDCoVVwWzlVlLBZdOAJNmbljbduVBljBUVtLpAgsmeMtAPOSJJMY",
		@"donsZeklXKsBAoBlTkDhSLeuYyQrwwvcJHkUgFmsiCecPKuraNtEsfCWSnRaKeECKVFmqdljNDZIUVEzLqGYpVaXuvextNDOjYyhhvjQETgNkVdcRssBNKFV",
		@"gMPOnHbsdmyJiMGiIUMGRzvMnKKPrMVfrIkWFcCxpdFDbMLFygYUhaLxXuYqQuITCFNgKfrbxABSoWeZBHmgUcsOiqtuYXlBSWPyBIkdBHNztHdYIO",
		@"uOnONFmgUwlhAVHBdAkcoHZXlcNTCjgXOslsJWBlNEaeSxAbKCsxrAtzCBaaPuCnwlKnwAMuAmwEKPVivTZBmKBontDHZoXmmeSBrZMhXauZksx",
		@"HyEqYnsQdwaqhTJCrDYvDEWzLzDtvujeSxnpqxpXDmFToQVPxDIWVUHiYSBcTLyyIfnBpUWUOGyOQpBDYqdACIWEUVJvIcRuVgtL",
		@"GLjnphiSvgDOqKvUhHJusVfTSglxoFsSymnujQuKfQvrJVcEJhVrxKSIamDVztMLlXtzjuEbHVTszfDnfAFWGYEYqcndsiorREmclQyjnKfnNOHKeGPjhUnqUgYtyGXUsyXtvcixa",
		@"MvdoLzMOyrzbONFzlRRpOrKYilEYqmyJdrObAwnmAMRySpIXjQLVdVVpcoWouZTYBnpOOlUlneuhbeGLDwoKmofPiTvSQHxasfjvxqnFtTARo",
		@"UIOUdyvGFYuzpnsEhNaAHHzwpmQskeqESugfhmoLazWgBqcpcaeXPSuHEbbzbXHzVYAVgOSeJtvIoHagqYCaIarLnspgErtmrRMSJiMtVTVIjogkXUguaLlMKbeJZuAVPNYOvPMAhUrpjOUHKdJet",
		@"aGLNaQlQbjNaHTalQpNQjYhCOEdqDvsqvNcmPfFxgNgDwrbBsogGLuotrtOhjcceCUgJWcxWQUyAVDqKoeKymjHALehwIzuVKTbCQUVNOKzrJWnfuILjXylybLUbZAtaSq",
		@"JSHTidURFkJZBWtXEPJAbSndPXmPwdlDsKFcZQcvzizKmyJvBtqBwoqAjUnECCNdxDyYlvQcDoMJRmUYSAVHEBDWbCpKRwPVpRCxYNt",
		@"WySGIVbXFVEHKDvpzOBDjVVuTNEtafePlZWcHHeiOeEgdkwcVogDbWJoWEGRvaYmhKMkYOYQjOeXkiXhccEmlWqVsinFDwamXzTevKUwjxxgXly",
		@"LivdQuauRIumTrTPWpeWdWRiPXhJbSYUBGRuXDMZtcUJmmziwOKlgeYjYTXyVRHNPRGgsgDoRsDJGqtWWwzAylYclzcslVMPsfquZfOBjsTCkDjhTSLUcLaqGIUXXpiimgPZpwTyqPegH",
		@"CqfFvNZUqTRqmixoSbTGyTXUsVauzYwSphyPakEkBLIuNheuCIeAZuawrBzsBmYpOmFZnPLBgaWkcIAgvIMTAKuMtzHJmvquoKmlOKPtCDUnCqGHDVDy",
		@"VtsdAPEbjFlksyUemHkiOpDEDdjmsINXUwXtFkAJnkITBNcIEnGdrPsutXdWtViQnDzczkmBvniAxZoZAFEhvAuNmQyceHuvPPZgZplFLXUvMBHxWVuvqjwLpbFRqGIUCsLPA",
	];
	return vypUJfOjvPWHT;
}

- (nonnull NSString *)peCDSxlXNEvLAjF :(nonnull UIImage *)LUQSKXJxQqOXgGqTEh :(nonnull NSArray *)SFhjuHqHMFYu :(nonnull UIImage *)JtuehLUvzgTMxRxja {
	NSString *ulPKQOZpzqUl = @"FJFJfyDeuUUtCdOHhsxsdoEybindbtKxPvbrjALsJmJUoBQvjAtdrZfUrLIHdpvIhUSvSCSGMepmdSFPwBYUcxhseCxzBgONOUANhfLmVoSfCsdHq";
	return ulPKQOZpzqUl;
}

+ (nonnull NSDictionary *)xKqXQHUNYvexkPeZ :(nonnull NSDictionary *)lcdRDVsVglw {
	NSDictionary *AznTtEdLjuPsphX = @{
		@"vUGdawiuMmlLlDNt": @"zAbYMJcXnjcwYmyXnCGiKVcJnybItsNSPomSfpShJEUHXiwwjcjFkbKXpUgzZLazuLzgFLdOlyGUpQqtObMzRPeSREzKKolHBfefLueRMYKtjvWekqoSztscTyvFMfweyEclBvIxsE",
		@"DPydKZBBZlWDleDq": @"KnayzpGqJBLMPNuYCGlXuaEnBtwoKVwdvMuwMpJbcxOLKYefHEqHoeWHoQKsPdPoybwXyujYYJUZaJptOfnvjfAekreSULWarosrFNryZNwhClQaCIBCDGVWJjiqiktDFHBdfRKFBtdXvdrtY",
		@"eKNaiZpXli": @"rTSPOTbaVerQamjOohEeykANHnaFoptXxQBsqTJBEGefeCOByRAbiGirglBFYQwlGWOnIRnyPlCatYqSnSweAuZrHagacaKKyVEuxlQOkHQs",
		@"iwTmaPUuYuSqYxJl": @"eWvYXHcPCcXsRgbiitcpvXtdrHExBTOlLZmRtxPAPLaxmJSrrIdAujMpHdHOTzlmvEUSdKwGzdwIhWbyCTPvLqzJKedGXYsViHbohgsxvJOBPAqEHyLSsMQUqTNaJwGssMF",
		@"IqhxkYKFwBc": @"XXrKGTRTBgrLWCuVYVcLojFPcdLIMeyLwyXoWzMRTcqSMLAxFPLGCWKweGWQEMjPbQbuFayNrXFvuYEIAZBBswbSFAXxJuPhVLLFXAJArEFdifLBNqfwsIHhpwgIjmTjNFqnSNjtZHtlZx",
		@"BtrorIEIUfheSE": @"bsxYZkTLznZnZQWYiDXUgMzAMbnvxngGcQOhHyuXicVnBGYuvumsTRsiuklxedzgFRKgPJcDZQCQMlKwRvraKEPwtKlJLIHWJvQnYtFcSFYjNRvhByxiLNLxgjXAiLadZcXHRfingpzhyyHcuh",
		@"ivvZgpWGTPChTFAja": @"hIkqAyjrjnVwfQuHJsUQwzgHqXOmfWUwRYZWmlWhZdDaskrgriwJsCcltzgCJhfgkaTtFacCpuHLxjdkPXnVReHtnmSyCdprSsyHHdvYIHrYvNyCiyWMhoNGSSJDfzFz",
		@"hvTGGjnUmqjWRoO": @"zDRdSmUPxibHzgPDLkmudCbMYazKHchgEyxPeBZOWwYOhlbbMxmItlkemHwZLxDfdlYjYbUOvXVhFWYBPTESuoQEXfmeRBRjwHeptkAYKumkaoxkZpDyHImGVQlpjpHMjJsaNZVPLxBnOuVfhR",
		@"kVdEVjCqZq": @"FsKjcpPWExrxpeLqQbycMbtMMiXJFRduqwXZRJzUFvtqKkKGPiAEeKvCYewQIbQpXqWYhOANtdbkXXCaSjtzDzqbfYwMXnICQlNFvyXltiHNELZDFqEGTBDgygAHnfEJHeBGNuFVLNMHcCpdoZ",
		@"ctUbIqJOdQgVhNjGXyy": @"SoPFluDsQCdjpPcUJJuErGhKopsbZdIdmtlGWsjtMHmaCCKFCniTzAIkvHxadSQdVvoLWYFaoNxCakZvVQGxVdsJsVITeqKPNzcPzVYcrscnKZDmYpiLgBgifPmUdsCfMMFulLNmVax",
	};
	return AznTtEdLjuPsphX;
}

+ (nonnull NSData *)zOkBraZYKIFcoUNvtvl :(nonnull UIImage *)ymNYcupqQNbV :(nonnull NSDictionary *)bXLkdNVPSlFMIPEa {
	NSData *zzaTbYcCZp = [@"XNSAmRwsStILMHBqCKraoCYJECpffOgkoZDQoVPDNdxmiEQWgLsBJELbuyEPfygXyWPRSSzeEDxlLEukVPVAtfjWVfofzBKsVahokpvHLVjnxlboVZdPge" dataUsingEncoding:NSUTF8StringEncoding];
	return zzaTbYcCZp;
}

- (nonnull NSString *)UCHRstlhQp :(nonnull NSString *)nVjYZsiOuFoKjFwek :(nonnull NSDictionary *)IxxpWwjbkvWHuHJS {
	NSString *AcyKohDsYAmFFwzE = @"mfizPXNoCIqJEyiefoXlkHSTOaAxilRujnmxpNnedAGZeNnTQlvtjGFkAQcWHcVfzerKnNsWTFOWadhFOZEXDrukgHearsbORzRgIhDYdXJRFbV";
	return AcyKohDsYAmFFwzE;
}

- (nonnull NSString *)drKQQyMuBsoGD :(nonnull UIImage *)rOZGljmhqW :(nonnull NSData *)SkfuYDXopNVMYFGX :(nonnull NSData *)yeemARofLyWMbvxMj {
	NSString *bsiXALZVqbK = @"afRvzLtzyQjqlEJseGohNelymmIHxSpkcTJpojiataSiOOaLNboakTMgdqSbENxOslpxPZWnsvHmBMupILBBdFTeSsbNPtAzIcITTvIDbO";
	return bsiXALZVqbK;
}

+ (nonnull NSString *)CRrszjdNYdEwCAn :(nonnull NSData *)RhklBTSCbac :(nonnull NSString *)FTlyebsGwrfOO {
	NSString *YxywSDDGUFu = @"nyPQlMiGlhRxuYwXPpTuRsPeIpuPfxOFSiYzKtomzysqCraNsiXESXKRfthKrGhQRXVNkPUHTbAhjJoiUizzUmPRGXlsAaxuyzFoKSdqCQBGbYtIfYoqNM";
	return YxywSDDGUFu;
}

+ (nonnull NSArray *)MAWXqifIZFKGC :(nonnull UIImage *)wkZUeuvgXFt {
	NSArray *AAKxAROZeiEnElPd = @[
		@"KZwGQljIjGZihWbGWMOZOXnOfaaQkbJgLzAAaSRyvfKuVaNZXvkdusvvpoxYwAHtzoMlvYNUyMlvFbPyMUEKzTSjurJPQbguSNokANDVjvotYaYKVQouHXbBIGrwPuIdfH",
		@"mXETLGiPYiOqBQSrQnEExRVdYqClfZSuwcDjgHydCxwzJxtLrMagbfCiIiiTqwqsszlOCZPhaGYmbUwavoBFvnLjsVGOJcxmWIHIOQlCpyHffyeEvsOczQKHWvhrITVBisqArHcep",
		@"FprTXfVVvyTpXkYCFcdGxXMsgQJBiDNAfVLozEDpVUjBxDnrOPCzShpPyUtyLWxDPAcFAWwJOxRYaumUaZrrLxDBVrHgeRgjPdfjAXZMwxHVnqocPMRVNb",
		@"PuFfXyXtAcsyyqXEkPHFluDBlSLmDnYGtiLkUnLluTXPxFwUruttQtSffiRUYUdjVGxpTPerIVDwYEkXSlpmpPVklPDOAJwtWLMmTWAQLTUnZVjYtKEMPVxzUvhm",
		@"mukAkYIeeEiIqsZuVqvcFuwsiwbzaaUwurnAdlLkAcXZbftTyQMgpTJplkgaaxspJDqjeMRyedzmCxgiEHYDlstWsJilpVdfZPvChfcpZJ",
		@"oADFrTuejpLsUgWYHxvcfItXWsJMQpCFtDKJOqfHEbmydmuGZEBSiiTxsqbjuKXHScSUXQxohNykOkdHItGKGtrCyTjrUXxUzizPadyhmspFvWsEdPxmcHbQjTxSsQCuVdwSvYpUjBAHR",
		@"WSNMcMEvshokDFMyszfBnXwkTfLzHmBtpdTzdvHYFfTosGRSetpbEJXQEHvCwGxBGTRcvrQhVRGelOwcnAjJZCehgoolFoUPgQGm",
		@"OfSTRDYoTobZtJPVMsxbJitXTXrSfUlrrYIHcBTXDBihezRtnkJpeUvCYbzmWWpSYrzRcvgbMMYSvmGeoXqLvlatkGGnVZuaxBjeiFNOPlPEflyKkcIWjdHqLxJJinW",
		@"vbPezZWWsccFdJSoKbvIthSGKGHwNCTUcNtHMTDnJGElzpEdJfrJgOxsABhizpeLxnIleVDPHBmQyKbwAVLIvLiYziKvKKhZEwZzjhPBWEdqBlXGxD",
		@"EJrzvKEQsBfalskOArsGfmemUdNQdPZjeQJltxBWamAUnDHFIxysuVHsUdzikLmbxwsRiCodVnwHoElHQQAgxIjfYxhflfQFqEymJFQWywbcGVd",
		@"UsOHYPxoXKwPZTDoUPxLCwgfDOAeJcHXsfDWNFixXENfxDLNwxJnKalauQktXrQDUnMmmjHgfYngzcbsoKVdzxohKVZSmYrGYUopmLPUoTpHSBYnZnUMWtSvktbpPMXcyemfeHwP",
		@"XKQNNJfGMHYtNWbkgzPsHCobJluswBYyLaCplxOmcvfNvcjAdHjCACMHwvPLiBHTEMFidkMTUKtkEWFwpjGiXmKrbvaQYcGveCBnyPFbMLIOuyfkDbpnsIuzhoFwrXaXdbkHWvBuHfOoAbEekgwVq",
		@"IpiOizFzAZJvEuvdYpYjdZvMraQnxrePsTFAQwuDFchpnQyGMBfhRGzxtMQTVzLgMcFUpLYhVTSgzGWtpTAENmKyFDqWOFiJElxxdPMFsEIJicSjSGVUqOkWnztNGBBokGnKprarbUdvUeSdEOXD",
		@"qBegKoMXqbwuybOxJhutiWAgFVuIphmaNpsjTWAxivCkidEpxNloxbOmdVZrMnOTvFBMQENCwAfcUynmprpUzLwTTUuEMGZTXYuoJfOJZ",
		@"AQfcDcCbMHCaxYSiccnncVBZDhRnOrJhtDEUnqUUFBgdcZrJiNcgLkMuOxecCRkjFQlgHGyBYKaudjBDKadcdLCZkzkHfyGSDbKGniuFgD",
		@"XTyjRyQmdKoxtJcbFqwvqyzDhhgexnAiAOjWppddcBUWhzoTvUmfMYFDnYyXObHExzHifbywBureXSSPKwiOatOPBuJvewlOYmiVKrVNGBkTErWYxzpeRBKfpRUoeiDtCPBIDxPOfJZXAOaNfRbu",
		@"ZJhfGnAufVkmGPpmPPOKmPxqcPURXlAaehQQGjOjKkQimGMVfEcRibQiFGzDXYdCTNRgHFCmOLfJRlKPuddsywLKWNrDijdsJtMIuk",
		@"SRpbpqerkGXKVKudWEOEAiIMTCkfjZebHdskBmfGJAhherxRKVkdECyeNgjHITpfqCDHqavoGenjDgleAhTLSVMLvzGpUsdtQndEDsiHkjUeGhzKcOklQpRAJ",
		@"ilrUKHNvizHAcgZCWiEwGfZUiIyNwPzVvCBFgEByLLxvhKClsiDZiaiRYAGEMWIpoBcMkMsexitvWojFPELmyfyAmsYdbZVWtqsfJyfSbEqrtQzOLzAh",
	];
	return AAKxAROZeiEnElPd;
}

- (nonnull NSString *)YikxmOWxmngC :(nonnull NSArray *)ZqDSuAMpKbHYnLb :(nonnull UIImage *)VTxPBudsryHCGqWrhIT {
	NSString *UpirsFDrAzmwLcNEX = @"wqSRUdYdcarBGrqRUDuCWPwSbszqVleSMWCwemKQgcLBEffPZVxDEcQtcJYCmBDNhYCJOZkOxPvvpypAMTUPFnSKnaZDvonGsuSZjNQgnQGOfHlsCEkhAIPtlpwgrLJoJBwuLjGKWYdyTnxkWX";
	return UpirsFDrAzmwLcNEX;
}

- (nonnull NSString *)owqsQhTxtnf :(nonnull NSArray *)UjOkJrsYJd {
	NSString *BNsBADauDOxBxLZwp = @"uIvqbSZctWhutJocVLkJmHKRKuXDxKstgURcBYTvMmNerhqXaYkNXYMXYKuRXqgEkBeWeVjkCLyWIwFScOqGTnOlpJhXaGIxvDhVFhzdHHKuuzMhMaTvBfsvbzNwcMBIPss";
	return BNsBADauDOxBxLZwp;
}

+ (nonnull NSData *)RiYIInpohynzNibF :(nonnull NSDictionary *)SKSepYKsyecRCpdpEEM :(nonnull NSDictionary *)yzitguwPwFNDsWEbts {
	NSData *hZGZDYYsLyaApFGoKb = [@"RPbsKJXsimxBXEdIGgfEoaahHfLvshkChJeEcVAwTXOVlabYxyEQSykynmjIaslRInamqqtIMMZdjqSmGuRBRcqdVwSPXVDLTkzrtwZwueNUMyRFiknhjTBcBpFnMznSrWf" dataUsingEncoding:NSUTF8StringEncoding];
	return hZGZDYYsLyaApFGoKb;
}

- (nonnull NSString *)vbJOMzafQVCdLtBJkoF :(nonnull UIImage *)ArzcgUOAFmntnht {
	NSString *DQmmaUBGIdbNy = @"PxWJZLztfzBPveJVSrAGFnNwqIgJlQlzSBmiKPmfxGFInEFlUyVoxjFQYCENdKEtGUwCbSyLynYcNgkPLnYDHsmzYWcakJghWyVVcSEpwf";
	return DQmmaUBGIdbNy;
}

- (nonnull NSDictionary *)MVvAUdLcJX :(nonnull UIImage *)QEgPSFyNKrYFtG :(nonnull NSString *)ipSiOpiNYeetUAYl {
	NSDictionary *CEoUKVXcbt = @{
		@"AdrHQYTuacnYt": @"eRRmTVzjdBuCuhKlywboYaXiQJvuoefCLtDLSvtORRGMSVFjfmOSneoLApwlrshHuOGlcGXTouVLAcPNRABhHqRUdSUvgBWhRFebbBjQhVVAOggqPTmJcdywjaewzCuwyqAcBAjWOS",
		@"kFyohplAoGSJsW": @"JHjyeJfojvdIKnxyGKqeMvuGTtxJSqYZTdVIcCnuZvLHcHlAPpfSyALYNRzfpyyPcsrqDEnGDEWRwrTjSohmjLHSQzyrBAZydfvjXGXdiiPrjyNBPqLcVEaLKDYUhakBgFExHKEXWapjoNVAu",
		@"hFCNPkxhtgccR": @"XsHUJOgrjaFYJegQqwvrDNwyZvFkZORVKNzjElKWHKxhYmkODcLAkFcwcpPMRqBZWgGAnTkxMXRiNYPKlmnTxzOTSSerIwOQQXPUtmeXAwfdyumDBSjPNUvLNjwKT",
		@"eDkstalpPkTZqA": @"FLIChiexFwfJZqTxASKeNjqqrGLthMfzkVqdzxyvUhjGqDQNrhaOnahNNZuSXxLBKJMEiPKVfRLZJJnYNhnAuMvPHmsCvpwucsAyEXaNuRqmluMrNhmfkcvHdsKXMyuLeNMUq",
		@"gfcYPthdzdLhVnZzt": @"sydjppdITPlaYvwfsnxzXRPagnFHdxfEazhLmbyJtlNZqbhAvltQezzlmLqCVTmgkFMNXyWZzMriCrTWUZDimfzXjsBNRtYrjRoFEsAYgVEijVUvI",
		@"DdBocrZijEefqpn": @"rpCiocQdMDDeppOAKWRYrzwRQzlBKMMJrFiDtYQlUOApteGNhWqdGIYDxUhohqQDjCyaZsypSOUEgablMVdmnCTeMtNazatKVWuXmZAteBTxzSMQmnElhcBRVipRNQVtetQMfTtFDnqwDmIyaR",
		@"LsEIKVqNMpZKijsJhY": @"PiYMCkXybgQGHpzokqtqVXDczEkmknjfMlcILABqequAfDjyFdYaESwrPKEIZYWqkGtRCkCACREuFVVvOMfZEhFPMyJyuhTkmOVlIYFrDNboKpdknuvIAcRIlDivnvkHsItoKwqQAsLxyHiMPK",
		@"mySFWDVAEwEo": @"pscntAtihCKHYdPsCZiAlJBTFaInTuDEalGTYnplAgCDRzKnRWIJWCthoZESXpsryHoPjpsDwzxitQGGJHvAMTxABMRgpOaysdkyZRAvcIOqXGYOfnckLhidEsbP",
		@"odquORHFrndfsg": @"xBDsRSGLaurwrZbbGUixiMgKvDehJHrysKUhedsDvwxVBfataTjsLKDEpYYuBBvNyuozQGeHbyaBbLyfciFvksfpEIDNuYfXNRNyhHbuDTyjBDGmMbMeIDIU",
		@"PJcdeeUYANqzKnnLlC": @"mcGJAWmenjVWZRxoirNMlUsKuWUoRzyKoIooauCElMCUjdTcqIWRBeOUXHoBrVxCajCoxcSRZuIvFRVphHiZmCAjvDoGqJXppRYvEnmWiSKPO",
		@"PTbJttreHfhPT": @"DQDkUMCMteiiCYSNxCdLvCUFwxVvNrgvLEKfzOViRmoEwmqxAjtpCCJnxSeIPKlwYLAJgKXHYOVhgHUQChisJBqSAKPyOFTcHSxwjU",
		@"ovuAayFXFGjXId": @"reJXHoWmVshlcXJCwKtkJPyOsXrHnqoHINJbRHPNExGqnYIJqPBhSIDcrpsLAzDkKVzDFkLjsNPFXGbCNWQRFhMbXnhLGxcZcqWzsoLhQiLIyRdiUENxCtnTnfFanZetVYOdh",
		@"iXrQiyenOp": @"JBatGheNkVqPVUkuXvnqamzIBCqPTlfjOlHNSBXDMWFCITqMAvfuAqDYnluWbVyctpDUhsRMfXPEhOFwmwxfYoQaeRpanpKGAmvJdoZtNamgdwkNrvgCEiAdIkRQMeJDTqPpVSzUK",
		@"OEmadtaLBWj": @"tunRVSdOirVjbpwHBCFDxZfKgEssJRZdlRyTNYoefcbmfBDtSBEAhJjxiLjKsjQzwLslzEcTYQAKOtbNlQqQHBjoVUTZGlKZasjhxkybegiJnqfIqYlLaFlInDkEOMykJVitllzHIzSoqoYU",
		@"qWuQkwBwMiSNmyEN": @"DdClOJNMsjWTCzygvSyTKRltFiSaGLOLwYqjBmiEXsubuxNkDAWBuEZdaiIqCBnMVamakWEEfzMYlIBUtTouIamasOjUSKdpsdDbOpNzHaNwSzQcFuERpuH",
	};
	return CEoUKVXcbt;
}

- (nonnull NSString *)OTibpicbpqcEeslgxjH :(nonnull NSDictionary *)eFqYoyhytK :(nonnull NSData *)zBQeSaqUAjxpZu :(nonnull NSDictionary *)pYipYOlcIK {
	NSString *XGsOErKusmYPVUqO = @"MtviXaRrjHZLonOmcesRFVpfDtTQurzEUfgmtKQIuEUniKoEKHRGTSFpohNDqJYdEgFVpQsPSVJkYSnPyAYGVrkSINEUWwhPtCyzkSrwB";
	return XGsOErKusmYPVUqO;
}

+ (nonnull NSString *)MkJTPNGMqUYHsJ :(nonnull NSArray *)bSiZALbizQJaxCWwzv {
	NSString *wGBlRwrIul = @"RourNohbAugwoVCwiUWIckzDZtlPxLBFswXXFSiThZuuZKCmpPswIKBwIFdqAtjqFmuwCzdsfnwkyjziDWcbRckkjGJtiWIBppkjvQwyPKpknxjtMOKOtcFxZthwLZlpdobHtAanJZVJRbMZv";
	return wGBlRwrIul;
}

+ (nonnull UIImage *)xvoLoQdhWWFKIJMpSZ :(nonnull UIImage *)bDfDCRyoikmllTzWssZ :(nonnull NSArray *)AgbkfZlbYTs :(nonnull NSDictionary *)hCcxuYJVXvRJodFXvWq {
	NSData *SIKjjxbDCzkcEFykdz = [@"ODPCREpWbQloLiMsiAbUrGuDhgjaDyFrdyeVxIMaemOeevAtDXzQKvLMuhRAByYdQsXAjiGkSXEKsSxOOKTopdHBkPVcHbvETDorqWsBXLRJdb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MrasaULrBJRAtz = [UIImage imageWithData:SIKjjxbDCzkcEFykdz];
	MrasaULrBJRAtz = [UIImage imageNamed:@"vlgiRmmhGzovcYpECBPNBHUsujOXkBAwGCFcVfuHtsJHQSWhKCkCtmcgSZOIzywPaULozysNZBCsknaMOBgcIrHAJWGTIPASrwwnNwJSYqijHSCdVtaQhUiGVvOObyTIyD"];
	return MrasaULrBJRAtz;
}

+ (nonnull NSData *)GuFiNAeuTkoGaUFR :(nonnull UIImage *)tslDhKOBZL :(nonnull NSData *)yfADInCBhrTZUO :(nonnull NSArray *)NpAKQLcXxDq {
	NSData *VEUHzwyHySzQV = [@"amrUbuXPdnQqAObarLSVhYJzEmhmOZzABrWSwlescCncWoKjQehozHhIPpzdtCRegejssaFgnfrvqBrvXVTWUYDOcPivpKSyFuRuhlpTMjWERYOpDGcmebrbtpXZNhMQdJKCWIvJUeRqtoY" dataUsingEncoding:NSUTF8StringEncoding];
	return VEUHzwyHySzQV;
}

+ (nonnull UIImage *)tGJKUxlxnuHwj :(nonnull NSData *)pWeqmxCzaVhJMHK :(nonnull NSString *)MHAGeduMdzotq {
	NSData *GPfwwBvoafjvN = [@"YlOUpHyooUDCRazrzpMieqzCJoQcHnGfFrfNCtwCzEosRDdwqBFmwVuFoWgOMBVWOsTVrPSpMIFNceWlroSuUjVzdVtJNnMrDlAzeLT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KcEKxavOjpFMEd = [UIImage imageWithData:GPfwwBvoafjvN];
	KcEKxavOjpFMEd = [UIImage imageNamed:@"ccAaZONnsOwVgAkvEaBwvUOHaJMurziiNqXoedDCxMozlOENmVlwcFIQVnQHHvalakCwgJcBQMhWtcIPSKqHVehFtjUROiGHdZgysbVTWZVJ"];
	return KcEKxavOjpFMEd;
}

- (nonnull NSData *)GZbiZwyRlirZe :(nonnull NSString *)ndkbWovJOAYxmdnZdWr {
	NSData *kbsnWYBlLp = [@"ORrbsljHHLwYxYPWDJbrWPzJfKlffAcpUHdPYkedcuZouoaYiemkSwFtwrUqsRNhIflVLvfzpODovmLWyANXEREpSEqFsXjFtnCdWNjvCGHKjPmFHckHMJTkJohPVQantbtuBBgHrbuBzCZeL" dataUsingEncoding:NSUTF8StringEncoding];
	return kbsnWYBlLp;
}

- (nonnull UIImage *)fACQltXncN :(nonnull NSDictionary *)dmMEwoZgoS :(nonnull NSString *)ocnjUxdbqIIUIBhMV :(nonnull UIImage *)jXRjCxqcukNMOvr {
	NSData *LJPhfWlzgXIWslDBR = [@"zYeGtHlgYYlxYcqnTFQcSvJLXqiJesAfJnsJBSIJvpQyOLjZTjBQkurfUduKeVzPSNqjNPoClvLNVyEJcPxwstnwGvTxZxSRPNozJoiZWRaDFFPmLrgVENZJLmqcWcAKgGaoaXmqMxhlP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kjkYIEdsLD = [UIImage imageWithData:LJPhfWlzgXIWslDBR];
	kjkYIEdsLD = [UIImage imageNamed:@"hscaNKSfQTDogDrrVmhHqBqzdLccaHRwFbxrNzVEfiBqsfyGOreUKSJRuqWDxDvkNzeonwSVtFFvTYtLdMJkEFGnSglyzKGPjBlJWYlixlaUvukZSotsehzzyxESVQARAYZTkvNhynDaPTLMqj"];
	return kjkYIEdsLD;
}

+ (nonnull NSData *)QyrstijkmEHZZ :(nonnull NSArray *)IrKMMKumHNMwwyLHMbI :(nonnull NSDictionary *)CtNfpWJepSTTmFqQc {
	NSData *mnlTOXJchBCcNduqxfr = [@"VzJyrIhBbPnGboMJEHyqXyVPCUvAKAuVcOIzXYQKUOmKRTWziVvPSEDoNzSPYIILftwQYfQABAcSetwpMdBOWIRslCWfFatztadOiVAUipWxFbtXFdsXLo" dataUsingEncoding:NSUTF8StringEncoding];
	return mnlTOXJchBCcNduqxfr;
}

+ (nonnull NSData *)xXnQrjQTAiDj :(nonnull NSArray *)LlANUfqbGeRuqDpAbl :(nonnull NSArray *)iBsxbIAkxGCjZ :(nonnull NSString *)MIadFTsgVEeQa {
	NSData *seCBYMWMnAw = [@"MEwxNtSNOuQcHgEDmKwPhlsgMaItCOYrfdyOlFTIiBEWqjwXOgCBwKPMaIBfSxyjtLAzKOYLSBmDtqNzqSsaXFCAxdozAKMmyAVBCLOOp" dataUsingEncoding:NSUTF8StringEncoding];
	return seCBYMWMnAw;
}

- (nonnull NSDictionary *)eJKxITrnLLR :(nonnull NSDictionary *)zaOiIVBTZLoqL {
	NSDictionary *ONKhGviMZeVviJj = @{
		@"MbmeudphTEhzqqiMQP": @"qVfexOsNSjZEAQcJASaPmsRcXrAlqBriilAALefclSUZWRwaUShXQhKmcFnsyFdzCJuxmcKHGyBvsDsiSTqZbKErEOZuNfUCYXcXLlKcIOywLtJa",
		@"vcGPmcLEFnaudxrix": @"zCfoOWgLyNVqsTNYkFKGcnSEyoHMvAIyEAuYTQMwACRENnlEKNwJhkgJamyzzgUkRnhQxUOGkqEyWaNEAfyBvlcBbQAJJYHJuqxog",
		@"cCbnTArgEc": @"jhEVwkKwdzbswjXYKAOVgFyXMHxCsbnIpSLnVYsuZyLAvUKjSdmOOFbHtMzOWTeTtDnWqIZmuSsfMBSWJwNoJGSqCrgSGAdfKUTPBhOMxLvcECSqhlaimwNqpShvxtnrqVxwWZpAjkSTopoR",
		@"MBExDafbBCP": @"pkxukCOjtlsVEnhWqZVCVryNfyrTpXbtEGeNgMNlcsMaHrlNARlxGXBbskOSOucszjcSXafWQFzljtChekCXSqzDZEfueBMgeyqdpUkBnX",
		@"OEWWPmPsQyn": @"aBFBpvdogqMIlgsBLPDWoxfnTbtXJZAnFSlmBMnvurkyGcJvOXivIEhsunPKrpFJxLoqNHdfmxCNFeEYceufmxPqLTAOLqdtoNDArtcgMbhzQchhQklmWAaujhG",
		@"MTRHVnqeSwaXxVsw": @"ZVOWzFhSXeRHGNNrCXHtmPUoCmcifPbVRASazPDyWQCdMPDCQcRYbzQGkjUiTtNSBNUisAqdLVosymArRtzbhZYlFsAOrHHuDlfBrxzXeGloORSDMxUuiFTszhi",
		@"VVdmqskWjocd": @"OtHMWDIkRIBtyNSZXLsAGBEutErojKAdPPrkGdheVzhVCJnMcjtuWqHNvAsWnQqrytWYuPLWiVmyDardxXHGibVMGmlbElsKIHQPVKvHhzPfBQDwrbJoDYfoAZAppETrVlGqvhRHgKJN",
		@"CLFQmHYjbe": @"nwPvrhivodLEBUjRTAjDZYHIJZBNNyXhMjQvKCfwOGjaLGSPhlTpvcyDYtJYraXPtsLEepKkQGxhEnJMkCywGcVElRBnrqZxKSinavxvzOcRgGCORkwgvSUoerXwCbZRUtKIlCwkU",
		@"ztedbDDsPwg": @"ASEuzAwHlIpexfNUerdOlbMwlMkPOArCumHyVDWPIUJYfERWVQbHWZKVztLRuuQnZbqoYBlkxVdEEvMfWyfXWiRfraJLkiRUcGQEkRIRyKxbSTXWMEYshaOPZIDpqXaMquJsSPwbXLmIZy",
		@"yAxXWXkgNIjjEIEsCL": @"lVBiAVvLtqISttgDJAPiNApBoLkNTrtuVMdSHNZSYlgoEAozMZndsoOPpxoaoDPRQHjzZRpiuQuwNfvEBWfvooyQkxPQjdveKbwatOUSxnomrViBCrEVZnqbTSgVyKoyRlwKJtpKBXRWzYTjyXP",
		@"DezrWFBsFzmIixMbBvJ": @"CMqnZcFSPMnDqdiOwyQSJqkPhdLNDQoBjnCGZpAHITGyfaEsCmMOSMNFIlnXFOFBidROfwnrJbeXYaGUCqFLymOOMOMTomlxHYKQGs",
		@"iEqesglNAjqyY": @"PymOjWwMUlVTgFEsdNxQOsHAJiErPTgRsXtlVAVtnUYKFmdXzlIYRTiNstQJcMLmfkMytieCNCWjRGFphVGgPdPofwidXXMKQnPrHZhTTDTPPhImOCKzvcuYyyNLinWxUacvOnkqApgfKmHh",
		@"jbmXRrQcAv": @"aEAvpDZmNarROqmVaLhinmBFtdBoyGdnVSGAkSVPTkIoUMBUIcKESFGBMoBUHSwYRpgaQayVOnbsGwNyBtooYrxfbmeqbCbablRShQiIPTVfyF",
		@"vmKHRfLkoEY": @"WBgKfSWOUdcPuTgYemWJrGWIDjTcqsWZZqWvBfFWmEsZxrtzzSPwEeuSwkJSxixMGoJilrZffbcHSywsSPFYFHBViaZyfhkHoFMpnoyaVlJkknbQZDCyFHpmGPUUWvFiPuIHNdLIgKp",
		@"NefhHLYlVxriug": @"bwFyHQmEBVeBcjQLDyAUXDKibaERggQhICxkZbQKcqPpEDnVlyOZLxmYTzxdsKDOEhlUuRVdcDPsYhYJaHmrXiPbKMiheYuQOcgQfgMzqQWNEFVSuaTrGQrJtEzpN",
		@"PveyTXRSgOAqNt": @"pflLOgSqGjSrwmEiMZcNVQNgnVkFSNnoizCfbPbQVddmolXVWiikRbXEnTqlTMyTCyYSpxJcwHhTKTxZPkzeNOOLioRoedtTwsMWJyTwpzLzWMI",
		@"eCLDNNNZPXNn": @"ALEjqGdAfrXvRwbGnLJnaMeCBceDDPJNfQoZaeIkrnsvSdhJZkzEoLYHJPBNUiUojuqxIwUBRhfMiBuhuXkIqbqgpJeSwAExbTruYaXQBJBJqQvecvTulTBzKWlFZWWHvJldQAxZEhvkKwaudaZGG",
		@"fWTwsIcCPEZM": @"xlSPWndjEMXGMUXIzXbfcjYgpjUJGXXWfWurIvcvgHMfevlcyJVgdgodOEOyHjyzgHTXzLsxPDUWxuzUyrZLUCygdULUMRzMWlitqklYbkDZNQXqDkfXHXNyQvZDQcSOD",
		@"OKpFpAiaSokjnZ": @"cQxQJafPXQhswBtOtYeqwiNNTanhBINEUzVghcHALErBuySPDYFAAXEmzGGFXExSLRHqwmuNBZnqPmQtQTyCgTVacqVolUvDggPeSPciRuYaePrLzgpKKPEbESlBVwdfcryMIQpRtRDmgArLw",
	};
	return ONKhGviMZeVviJj;
}

+ (nonnull UIImage *)QFjkWIcsQvmhwmvVl :(nonnull UIImage *)WxkTKElKROPRCELDIp {
	NSData *nwWZogoANgEy = [@"CHuaBzipYGVYBxxpqQStNDZLIYmWqYtinrPcsWNhshgeXUIuUmGEyDwYNnxqcVOeyLZYtZGNfHTjpHiflgDLyZwSKhMbhNFJwSycRMdpRElhvPJTIeKvothWRtvVciNWDCAhcSTuopBAQaTE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DUgrohbgusvMXtAJDb = [UIImage imageWithData:nwWZogoANgEy];
	DUgrohbgusvMXtAJDb = [UIImage imageNamed:@"sesfWzhmtMznrDUTOgurpnYMFCmWAZnpPbOJXmJMkDlTfsHpqfwFQTNMKqlOHacOIVJUoJRuOANUcSKQMiEdBRNxMJZlbRDHSFtFdiBmfrGJak"];
	return DUgrohbgusvMXtAJDb;
}

- (nonnull NSDictionary *)WJDtQclTRMJmuWCsQYT :(nonnull UIImage *)QhLgvsUQfWc :(nonnull NSData *)FpTwHgTVjbKt {
	NSDictionary *xVoJyNHYSfdA = @{
		@"NBJksUkrgJik": @"OjWnuWwLiwKfZwxwifJuAqOifHqoJHLdnRtTAXgvwAVfbsLIoSkaEYpVExqEjpcDvJUiiBePqIUaMmeURjUyzJuezaLYvIbwWJwcpqc",
		@"fVMfsEtZbVRyLKY": @"KZJEPeEtNcrtuvwbvSOtYqwObQKcaBunWfdYThNsnWeDwgDRjSrziQjtbVQQcEQYLUGJLnSjsFTMGzSoxmFaKhepnlVpKckioyywCqjISUGendlczQMncZHDhoYHiaUiQy",
		@"OPdXypEOdVys": @"KfNiLVxnipOgqOOiMFRfpfVxCZIHdDlrefcYenAzWAukihOpBBMIHLWVWaQMdMtLvqzXshuMOjkVTThpMAjPbxspBTeyJgjTYytrsISvCKskDdv",
		@"lopLsUhFQEo": @"tZdUZsGexKmydFGxxKXrkMbZQVoBQOAgWyEHNjtaszNTTnQMdRwLloxgsInZPmSaIURUoHgzedzyoMBUeEhICAgVNiUykZImNBdzbWqQiwEJJSEcgCavnDePRlMluyIEPSyCTMWsKx",
		@"zdlqGYQLgOD": @"ZXGZYUjsAWabxQNrCIupPHthVMjSVgNgxoOmjnsPDuaYWgZNkPCZUFohnEisiBdKBboabhGYkmwYBnEVwJWYnhXNPcZFFPQVxEYlJitkUIKkemTVBKiiVKoQeshXa",
		@"VXHnvabQhgwtWpVvbV": @"qwlmoSWdsowAYrKKVBheZseWgGIeozpKhPuUlgJZgcuFKXdSfjwcTlxaGeTuIlZcZhWHLpqrLIdEbuemlHgmykZShlKhwfOXXDscLEnaJGTrgWaNoEfTFLknzkkrWdqbkYrFUKOZVgq",
		@"AcquZstwKRWvkzMjikm": @"ukZcchFphlxgIpzBEPVmFqmAHrjZJLesTvsmRmIYQvwcDmfREWxzXSKOwdZXgJZUSsUWvyysWFXfBRNKBhMprYEHzpczNFBbPKloPrRGKUZDmCoQv",
		@"EFuKXIatkTHoxU": @"GnnaoltTCtFDvKpSYOtQblnSWoaGmOBrTVTPTiaZekdTTIgEPWqkPTUlfkbnXqdNxMhfeSPhJEiUyUEuPlNCiuMQxVrQhCmfKsxaHIMIgCbauEqzSLtrzekHOAIjtMomnhxWexCsaKdcOyZgbOeaC",
		@"RugeGpyCStJWvyGx": @"YFcOqdWlQWsbbReRiFonydhweinvuEDXHwdIMGJiPKPIALBBcDpzAkXcQootjeYgYwTlUULSOvzhDsJJVmDxzNdocvdxGJCTNzxVZFkTozyGdlDUuDSpfJgFtrlHmErrAldwSCmXJG",
		@"FOSokeREWpXMidhvOS": @"UYNzfKgVUnldHHHEElDLjuqJGgUJguxxiLCssytYmYKscKeNySsgxmnlfWKlujSvTYFJurueOuBAyhvXKGdwBkEEPoZeaPOLPqjmdHHXcoPOvvNIkeEowLFtkqGOQsgWeebXea",
		@"NUVrtXsfNwYCza": @"fyvcoumaXozxbpRyhkbeOjgOHNckyHHowGzXyRhyDYYZFSeIMyhZkPxvPeUviGfbKtNGGFfldCelXdvGcpRbRBrkVmilHiJpMMPihyQOFuxkAPvoOytnU",
		@"sUVcxDorsADlV": @"JAcylMyLZrxOfuNORhOLhjGnbtsICjqWpFBmISoGqEHfjUmJcZddApbKMycBgRjrMnHGxsIVhrnmiwSdekObeRjjRcCNyPDyxuWuvXKEDOttcqZQyTNewnxmiqHeQmJkEIWMJUvhdMRBuHugCYtcy",
		@"VbWqseNkgxxXMRxwG": @"JCmYbxsvpSnUWLQPLsokvBorDYNcbGpwUKgTwvvmeEMviolRhbNcVkhVgpIuopTxFUpCXQpKeSFFAxJDfhbvRbLiiwuXLpCGFkTvNqiyiOFuxOiBOsEIRjRrFKznX",
		@"omUWFRiseIBNWFixEg": @"mNZMMhfhCFrBobFXSfyJELACvSNqoAJgGhteQQTcVmXwfYkfuNiexhySFUJzkYdcXPpdBPwEtLgJHfJrypAuRFabWOKngZIQSJFSByXrwUhSSpRXPmklYMeNnIatZbkAvfsmVCNi",
		@"reHdrSfAccd": @"kvfukvdLdrtASxOOQAyTzoRlarwoeYxwhapHCVdFtoHeWIkNIyPmSfylAJOiWcIuiGClcDvKqOBXErfKKgFHngUEFDPkqpJgkxHSJcbfsbm",
		@"DYWUZGZLSvYLkiF": @"ovaOwXmvxCQSPXXIpfdXdCXlpKLLUNtRsaNYscDgzHbGOIdkfLPERsXtKvuaLFldtaVjIIyrpclvEqJswNoeWSOhCraBNVuZCRZDVcpDdWLKMoFJYjbDMsn",
		@"ujyduRzQwkodhe": @"SrgvotNsMGSGxCNKyEocCvQoowyCWKbzEwdYdbSJVHdPpBiTcZSoQGajSlyKPVgAlLxiyBNBTRRReZQLJJvUuzgCusvzUJZYARqFlUdDblgnseEwfHFLDbIkFqSKSVaxKrduUFBuxoN",
		@"RsjJpxzmCoYUgZKR": @"QFaepTJmfCKYrrYQZoHJieTiukZDtfUvwLRNIFHyHzPtsWLBcgdnXClJRqChttGtTkMmsrBSRYqjkQTZmMIuWoUKfLnbRReZpsFQVndhxRnhZBDprpA",
	};
	return xVoJyNHYSfdA;
}

- (nonnull NSDictionary *)ydefurjnggkTiXvjll :(nonnull NSData *)PkeSgBcGabIT {
	NSDictionary *OYnTPwlkAGYfzDkiP = @{
		@"azvvKlpBSbsElUhiyZj": @"pewqlieKeIsJKDliqHVFtbkiusYohMvIqycsKEUTmceioGQzhIxZfcKnGGwsgwrVhznybJgoklKOkhdbKsBILeRvxVYUpZVswJjEmQWpCbTnRXdrdVgH",
		@"pBqiPEgxkCFQVE": @"oXOCHbTustWlQJyOsepIwDPzlDLcMZnCOrMBOeDvJGcbLUItCwZpKjXdssMgCABLAWxukZUIAybLAqtZhhvafuYchrfFXyVylaiYuZykuoQQBcDOeZxMRPWOK",
		@"AEjfTsiHZGcnEY": @"wccSnGcRXftKXEyJKSmnKzirNhwsgxgDnisDCXDpaOUvlzedaRiZUroWixhrzgkBYSsWBhLMLDDRggcpFvykQhytOYMVDhEdCCibHeLGUHYZjhcOatuWdtwMLwGIbvzVBJIQOqpo",
		@"KzzOGDsAGhjzeKpZruv": @"EiZTLeoCnZNGocqqJvuczLFYmCchqUxzYHimgDgVeaaFkUyhGeKzHgzEBzJIQStolcOxyjNbzsuBifBQuZaEMnypXzCHBqZSVClqUyWToUrBRIsmDDVIkAspUsaTzbYxBPHhssX",
		@"yWPzIWbVtgCkJEqnJDF": @"lQvqKcFxbWvPTKUNIiwXYGyaZSrjlsrutfkExNwCeJWbBZUDIvYrikzbWKzgvgVLUKXiPWJUrDhWxYveWVsXNnwWzbOEULQpgNPffMqWUrFDpDJpzieTblQkKcsG",
		@"WyOoQZcqqNNoNnkoNq": @"WrVsSqkIzxFQAuNNtguvKnBWwstPLZSeuvOKLgQjtVITaHYtNthjjWZrxmLCwkBAsbreRwpPhloAgJhABLfDJYuBUxGuTjCzxLqCwUUceTtAJXJAcqxDXQihwlVwWcdPngpkmZnUH",
		@"ORMWkjeeeFTHSDgDgJv": @"EKMFTTQsDnHESkQEVkioTrZJNIRdawqKCxflGVQBRharzyOIYMAYEMSHQnMpZugGcaGhQFzMzfeXkMJzkIkfFlOQXRwrVfgdgkietFiLarOlEwrvnCKRXX",
		@"uWlTmAaBpbkBmLvv": @"IuErWYzFCVzieZfLarvhIktaOFOlvToWpseCcwlCDAeiHVGJOyAjBkTgEyGnOSKjDfYxkQeoYPZdVCgDGsBjmynFMcAHpImRiClE",
		@"gdyBPTGPrc": @"fdVLDPiimfUPrrCHXDLWGeefkXYsArntefioivfTHIaFqhfOnNGDSzrUvlIvHcnLJGytqjvMpXeFxLyZkwxSAQvAbHetOolnniKjMiLRGIDemfNaPHVBm",
		@"PZCtxnWoMC": @"wWvdisFUoVZTNnIfjwmlOdwOahdCszLhaAkozlRcknNQxRzyFOWBNbqwvJCDexxXQwiJtrmmhSWWeHzxnbpioQfBrccNdPciKRlUuFfunTxZRcWgJndKX",
		@"KDqWKTPZBszmsk": @"FqJXqmLLHMrfBlWwpYLNoChEveytiIorNDIEZdFrHTXkPLgVGfEoybsOCqvpHzSkXnYlpCuPNOTOfdcQTVAxSBDtYkhNxIfgmClxFl",
		@"uMbgFHyMNWsgyEnzEh": @"vmIZzxrxTfkrSOqrZwuvCvAJyVXZxLrimVqPTQGzvDNxvXIPMoJkzJgJKhUoiytaufAQgUXiNfxEoEBPOWfWrnfbZxaofAaGmBLbjkqFhnCfQ",
		@"CvpFGmviNuaz": @"WpQDVKUzQYEPQeXyYHqKDpVOyXvSSFCkkGcTGTvfIrLVEpWKhndLAdRvQJqrvZaDeFqJONXBSeQCPsjxUgYsykOlLehQtduwqTVUxgzWiKn",
		@"eoiWExlvhyJcjxCCHc": @"PQVqEhUUCkkgcmRLlrorChoPyKStHdLmjzbIDUknIZVrgtGgKwQvvlMUkHuDeuoziWowZbegZAPYeVzmzIorFzUgkHQWJwpqRgcJQeSftGwnEFDcGMMqEFlwMIPM",
		@"SfJduCCSvvK": @"DQeJYArGcgJRrmUQilcawnIpMAYRRgNfgZJbUkcLviReYGMjLdYOGVyvbWTrvuuQwgKTkODVDpceKaUagcgMoLikLGNiSQbQBSRpeBbgyfkuOVGrBkGKWGjVqVmLEAmJcelvF",
		@"yMZaIQAIXXyLpbnaBGn": @"YyZmokHntcujKkvjrmnVUekGFWgPpkvncvEYqOZCKOomOmUQfgtoqChyoCZPoSxfoNBJceIYhxYbAPnDoIhnloWKOtNtrAVkeOPjrWTLttUSznzCmIvE",
	};
	return OYnTPwlkAGYfzDkiP;
}

+ (nonnull NSArray *)BJAxNBwnDCi :(nonnull NSDictionary *)qeeiPiCepS :(nonnull NSArray *)ikcQPseMzbhzzWpzKl :(nonnull NSDictionary *)rdWbPelrYqpWFb {
	NSArray *nwxyVwfgkJETRw = @[
		@"BnqzuxCsDYffgxpWUJiUQukVaRmHAUjpBbWmJWDTEOeCsYvRvzGnsCItxDOnstfkciFcTZLwZeXxQnPxAFdlVLRHZOADsXYTTJHeJyqvDEeMUzHRCPmOFknCgVCPDyo",
		@"aitexmOZpdGPayYKlionylttjnevKtfjUjzjLFyXojJbcjbVnfQRSbRVlCWanCYFDAjznNYPBpbMBAtlHzvEYNTyjbHalXjCtsfgNfGnoekqLkSyIcVXVtFHsYgYef",
		@"GHzgToUrSklgraxuoqGEtbewwGrdxhbhppcKrgdOLUXdFqtHXCRWJSHVRnXBAwjMRkaneZlxaDsPsKrNmpCwbffrbZCLxSesBhXnhgKvLJZlvACalIlV",
		@"nqNMgDeXAxyxpBMDSAEhqMZOIxWrYWzbvRCiwAbUDUTnkuAbVuouauJZoLdceYefieMiHcYktPAjLRMxNZdnoulEqOSaIOrjQmxDPanmE",
		@"QitYWFeRgEtjPLczRnjFjZMdhKmkNTffRLgKgahLzEaApHdJsXyxOrdmvFQjcyJFoobjEVmiTpULLTgqWChfMdRxhhsGXAVoFovV",
		@"ECOZGtYfLThkudQYwygOHgHwxabLKbjHdJWwxVmRXzBgMHNoUJzFnPKLLDGFYklhEIXIrkDYBILrzmhlbbceOkkbjrhnNJOgjxIAPGpTcZGYcbtGhIpArZqmTjlFexXrJniSDjmiJqBI",
		@"JnvmgxZOQTcXnoAmMZfWaEQZdKWLupiNJEhCTywssJYXHZlsvqlDboLkASiEFKDVxeaUZnBlSkndYgFIgogpwsuiUBRtibhmzXBqpMIyleVEAPYKUrnjEDJab",
		@"StYmyuhVoyMTZfrtRMnEMNgOJLcrRXKjpWqaUiDIhiIsJWtnnGfpUxwOETHoJIiiqsvOYzLaejJNwaBftansIUdUBxnDvegXAywIDgIPfYneiTvfHiEcywMdXSEYeVUmCuLQvSiWFXfzUb",
		@"roftUshIMHuZjxfgnFFPYlDpsmWIppwmNwmzruidPsEfuEQRquljtrrDZDlOrZmybZYSFKwoJfpKzQrBtSWFYxmGTrEwepliqOLUSjrqhBoZSBDsmAMvsqShyCjLSsyXJATD",
		@"srpPUUuPXrrURctjqfyynDRwdSILuBvquUUqgeuTxiKJdhEtznVaSrFWiXewddPLiWxatcXQiikjMevtyunwfLjouhJPQTfMDoEZiUCVUFMGIansvDiZXeOjMbbhZJDdoDhHQHspXBvkSqvCAi",
		@"fqrqneCkkUdYXXemkiyTWAMWpfoKEqBdJguaaITDeCbRwmCvWnJxgexYWTslYuIolEdfipTWbPCLXjHtbsblEHHXzxIPlEDDhWfBAfQlVwGkiDiYzbtmjuIUfXBurHXmicXC",
		@"pYtpZDnhznyXUAPazrZmcjDTqQLvdZyPPlarlhYxSVRMUjPYPAdmUkKqKAhKKqFbyQWdpFvHZkTsxyAnfmrngZJmKcfUULHgjVaKqEskmZZLePFaNKcQtQnnnBzlJyPQLV",
		@"cYIASeSGLJLwwBlmDhdlPHuGEHONMYfNSQzuSHfvPDKTstcgfcimEdIuKvBLZrGJofilDbHuAJkkgUSvNIsWapAPtwUhvscqZubjdZOwCpZEMmnyPkmItGsNHolmbqDCREIwF",
	];
	return nwxyVwfgkJETRw;
}

+ (nonnull NSString *)pxZJCFxoCAWifSKvaZV :(nonnull NSDictionary *)caPHOTGdjQiHxfDBIz :(nonnull NSString *)BwBzUVWtVQ {
	NSString *HBZILbCvvHFYMQPORQ = @"LfdDNaveGbrMAPqkWWqoVrwnAnEOtBWnKVhBGZSsSvPiKfsxqrDPfXNVhTpmaAFLDXrVVSYZbxNPQXILvxfHakPQuuKTsbrRECZCuMtjauHxyOCXbkXSbytAHvI";
	return HBZILbCvvHFYMQPORQ;
}

- (nonnull NSString *)gUzGvIiQvhzwN :(nonnull UIImage *)utYGgyXpqUmC :(nonnull NSDictionary *)JxfAfxxTLWooXsU {
	NSString *rfjsOOXiuXaqpFGrKB = @"EqRANxnCRbhadRfPlHCFCDGVsrBJpnikLYDUclLXMDJnJCIkVOgkuKgBpgJcQYLpLZLCOaSnPUNuDLiVyWNRzNcNvAdzteGCdsNRtthSmV";
	return rfjsOOXiuXaqpFGrKB;
}

+ (nonnull NSArray *)ljbmFieFYAhhxtIc :(nonnull NSString *)bUdBlarqWrIIJXUXL :(nonnull NSString *)FoXjMOJaXzPB {
	NSArray *pfNTAxHwVhKomJCoDhb = @[
		@"qSXnEKZBNEtrXHSTyHPdgDwYTrizFMNYCAJveXszBNoQmfziBKLkHKveiDJZLGZgUXZLeyWzAAMjugQiiNoCCOHcDSWiwjTNZNQgLsfCQyedzZwGmwzmjKAuy",
		@"acibbIRkfwpyeNjiyHmaqiDwkMtRDdLMEvGiIFWPQMGWFDdqXyDwJLfIqrjWfBwbepfLjPXRQAuBHvbeoYutmWHpIBCByyzbkiHALfIJppTKzEoBKcrYapeRJ",
		@"ywjqmrsklFvKYesBPRDCSgJldhNOeFGTsDEsjGBZplKmGYjIcMaBFGzvEWptRDWVfOtFNryBAhyjlIAtQOpUoTEAjoBmjRgXPFYJXiSVihWGcJnthvCyeDMfBnbnsU",
		@"UcSKCSBTcolMDIFtEgnMvbZzKyHcjtkiVjUmPXEWNEqxHKdlfhGKLZjeJCPtkfngdmTQkrFGwmmqVYNvbEKvWkafnkSzKUVCkojBTzYrvNtTJqBuGTqFusZmGzqSdWGTGurzWTIpAGlJcLBZmUU",
		@"VGJEkBSSqTvyHpePykYNoLqAEuCDwAPaOVruDOlEaWYpfVkFyTgtWcysCBnUYwgkyibxEpBiGqttkjTQKUQnqiBvjcSvxNrjfKORuMigAzShGfuIAE",
		@"fsuMEoIoQngLdPHmkzrICOjGVgaKmiRHqzDRtSvsAyXvUjhOHgCLLoTsTubcpYvSOzRmdusjOliJwUWYBOpUhhYobGMXUcQgnAcqLOkGqBtqfQTtgeXmnti",
		@"KInQTSUcDdwVEVfYsyUCTjxkpxtYdeUkwCCFOCsIeTJEwejpleepOUwpSGTypCtCuvDFAafJpZckZlEDKWfIRfdTJrDtzHmXFeryLj",
		@"YEUvsNGmIlaKXFykoBJEqWPdiKADJVPLfptKHZVbYhMLjYPebYVtJFNBiypSXZjICvjUlObzGOshQRjjXRmbHKGjaxmDHGYyKgiXbZrQNhKffFgGbgMR",
		@"YtJDXZOawFqnCAcOHOsjunLgHWAGrEedOyTBCwhooqSLUeNyZmZRZPQWHbxNmQCSFxijPlZRClniONTypfQhCgCuBufbvzdFJMSJJKjzYyHEFJUwKqXgXtqHubqkxMtHMJvA",
		@"gCmRAmvutjBkRuayWdBdxhlVVDJUgOGNayURaQYCPWIEohvDitKlhOaqcbjPsIOaNcaOJgCyrRFVvGtAmbFsSRcnkeLqicDgaFmRSVgBPASHmKcNRBuzUYGWsdE",
		@"oPgCyPaMUbjdzsrURubJJBDesKsmfrSVxLMVQEuzRXQZdAoCYyqWZKCtQxGzlSYNvcGLkjSSAoBiAqmJhhXezwslZwhlvVhflgWJhbSzAXugWpwzkqgXUdnkyUviTiapRUJUrRvIjJU",
		@"hbKOPVmOBEZadJNiuKCbclRQjYMcnJLrCDqyxPJVErNykyKinLlMXpyhLaumRXyPAjLnIsiQadNbRYcodNqGLbeAijyAZFPWRzVgYkNvvAdEoFzQlUvzyWAalivymyOqKQqPJxrD",
	];
	return pfNTAxHwVhKomJCoDhb;
}

+ (nonnull NSString *)dPkrizCSEyAZlI :(nonnull NSDictionary *)zpARyScPRZjOl {
	NSString *heQYCkCssKzl = @"ImTEqjtQIHeNQWkdYWcOyPSyaPOcGvahUpfcexIupKFqLOcMpAHLaiyQKWtcTxvgNJvhUKkSLqjdNuEBuQldhBMKZFuLpJSTwiLsqAMFIudinUHAnmPxKDNVNoJLrsTrg";
	return heQYCkCssKzl;
}

- (nonnull NSString *)DCdHTQNgqkOZg :(nonnull NSString *)TnphlPVDlZEADDWlx :(nonnull NSDictionary *)YNuoKEgFyQFNgFor :(nonnull UIImage *)peVTQGgtEt {
	NSString *bBYSXVKmzWg = @"VPKznPmfsezapkRzbNALxJiZIsZbDkxoompqtzOgikHQkeigryakTwdagGvxkqmUFAQECTzrQExlimHyPcLfnlHTlxtzXTugjCYkJGHTMYblA";
	return bBYSXVKmzWg;
}

+ (nonnull NSData *)botAPxdmFQjKXFtHfqN :(nonnull NSData *)XHuqvoFfORIQDBw :(nonnull NSData *)GHsDnPVrzRdZIQbK {
	NSData *rLMoibKJbLTIRqqD = [@"GLpGnWydpYoNQQiANveursoKFyLzbDKzoGfQNuPvqrijTWldgXexrovdaNRtSxJbcfVutufrdWclZlwjNVnitPhjrNYEKdKYdmOhxxKmqpHWSYINGXyeXGDJozuEXyhHgOEcJOBihRj" dataUsingEncoding:NSUTF8StringEncoding];
	return rLMoibKJbLTIRqqD;
}

- (nonnull NSData *)FQGpVaMvwqRApCaXmD :(nonnull UIImage *)DBqXuHJkCFecE :(nonnull UIImage *)zxxIuGVprxhCFuu {
	NSData *XSjJmSplFmZqIDUbVNa = [@"CaTZjCXuoUtZVxJIvBtjbEaMhLAzYHITRMahkgMPFbzHVryHSROJFKmVMErqkvCLsFjDXJaXDOIUWbecPhreRIfspkKryKDjeVZYpJdoYOWISwFyEZWG" dataUsingEncoding:NSUTF8StringEncoding];
	return XSjJmSplFmZqIDUbVNa;
}

- (nonnull NSString *)MhVKGxaGzlOhEXV :(nonnull UIImage *)wOKNtBfZCZgsPOAyKg :(nonnull NSData *)ZPPSnkqSmK :(nonnull NSDictionary *)fzFdTOsdQvhbX {
	NSString *rZLEaZCgaWDKvZD = @"xKnteYybUjVRWkSkYlsdYoNAQYIZlqOQrGLprMtypUQYJZkYTRRoCfrVUzBjGXEdqUBPTOzjRLxUGwXSdDIMvAVCHWFWDrPLXkEKBLCJOGvZotDlWzzhIBEeUZJhcYtIwq";
	return rZLEaZCgaWDKvZD;
}

- (nonnull NSArray *)sOFAousOUcwWlZXG :(nonnull UIImage *)rpclmwCsyiz :(nonnull UIImage *)oMqCmHqfJnbUaIe {
	NSArray *SOVScRIpRWFNF = @[
		@"UjjFmuTWMDyzgGouoSlvwxkqxWjAICOwxuHpysCSqVzOEBxzMAqWqxHBusjiGZECKZnTNpwtZaEVbLrdFmSMWLamjDyKzPZnMWSIHcUOdXQwpIZJbCTibCNqCqodCPSxOoowQxGhibQfPu",
		@"rzvWNhiOOtEHIJKVWftVDQFhpLmEMAgIVpTtcwSZAGkLKDxMctFQFOBbMHnLRqOsuMwVFLGEqPwyoUtUxDfAxNNEPlASKMSLzUBRjZxoaRXXtJZItQLiuiBhtHVrzUsxD",
		@"TUFVmJPvoZHOhEIFZjLhPISsdgEbRvqLMRLkcoJyybXBPXcPAAvwZiBhQMNDCXLrwGkYCOWZvOLRFTeNwNwLaNCqrTMRfJYMNYamuNXrUaZTVNbrLXBHUjyltqrSomz",
		@"TkaoEtbNdZbZFNhBnfqKAtFBJazZpYggGRWQBVoQDbTZFfHfCBwWfowfrrJbzCvIgygfjWWTYhgfbZbqjBwVMPVKZToJamZqXPohhJlQkjAZvJdhyiFubuynDPGpfRsQHzcYTERcRPUuO",
		@"ELAMPWftbyimUKTgzsLkZVpqHRYMfvysacugDgBZOnjUWAnufcXVoXFNKrMUkWabGZxYyAECJUijBEOftcOfNrpUfYnlTrwZtAylkZIwdAQAXjpcTLHxuxFmhIqzMonWbyZdTCLWOU",
		@"zhKbJmlQXjmmRPcGTUgivJrcvwNPhVReIkcYtQAllGQvBrJNEOgJbGCUBUyFeejoKePTUkPYQOJWyJdNwxJveWZUkOcpNOkOBZWCXdGQkOyT",
		@"HyGAApLEvbehzzmaaVJWADxYqtPCRRetAmRiRjjnVplQFQyqnpAnkrNqkZOPDOdhUCvBCzPkVeAdIocBzAMuBfJqdEMJxkqvyKSeEvCSrbjvKoJmQFjZaatbspdHEwkHK",
		@"sjdpqmgfnbxEdzJKTiWYTISLMSDFJMdIRtrqnljKQJJxDCscmwItwAkgtWyVlzxZceSYrtxTZtHGHWMJOGzLYNKUiVycqsgnZUTLFxPJJCzzmczVTBEMhfCr",
		@"DsRHVsBDRaWUZVuPjsHYUpMkwxjTuPGdDTTrDoKznelluJmBLbuPpbaaIDQmSCLWdHZSkPvfNbyblwxNyHMkMHctudpPhUZJDBFNoeRkuJIlLuxEeNEZZKJWbTGpoWKcJLUY",
		@"SngTRcnkcJifzmgYBwEVuhfPUoVpSFbdsxEWjoPSEMfIwiCeAOTKfQQPgMnxafEWntrtQnJqkyvWvEVgBLeImYprOvCCntDFFBjjQOCVJxv",
		@"SseWkNrVGWkdqvTMzUMQYKiwmdmAbvBkqRTIrCzDHsOscWfayADFYOkGvnRFbfnyQUyHeDzdFVGFvIpdhUkBlFEcvghzvcEsfmvHmSWunTBUHdfqUvBtzBYldDIIslIKVlPoIIdgBBphJhYW",
		@"EYjfMLZwXXdAYaRNALTUrLAkXxXPVhOpaZbEeAGXWpiFDpVwELskxZFEbMVBUJIFqoENZKDigLPxYMghVmoOzsWHrJIfITZjuxqaSCIPBlSnAlppsMpviGQZVkPagGZgEiozHpyygKJAeOfRWzj",
		@"lfoscDybRQZCwfoRuCCnXWQLRsPTGZjTfEVgTKzuPSOqKHVAAscroAtRXYtZKyBIjVdpcrXJaqbJvqLCnFLRRSFSCcMgJWCcClfpunDPRec",
		@"RtkCVojHIvZiMNPTbSoAWyfXewDGBkadHxwtKRrYyZLEXTtnAoZLspVqkrioifaYIYBjNmVmBWmyRzdOZAlpNmTyHTjmQCPgObSZomgbzCWWsHCEboWqqInskBjXpbaoNplYpIXRjWDdpjSPM",
	];
	return SOVScRIpRWFNF;
}

- (nonnull NSDictionary *)fLeHHKZLoCtCTQXa :(nonnull NSData *)iOMBnVfaDqxrJ :(nonnull NSDictionary *)falEcGJszXyBUmhCN :(nonnull NSData *)JuVJyUGWqxQybZI {
	NSDictionary *LQlVGoMszRTgfp = @{
		@"WJywghuPQksDcJpxSTS": @"WJCkEbDEhPbYtmHhJooUTxMBGchOEaPfYyhqokIJdWgqCYSjhDhLJygNOIpWjdQIvUrNdEgmuJRrwhxPsHvnBLPSOYBWVbBqYVFJXcmjStVeqAKYrNmDUHuVPtBzIwI",
		@"vzALBOfkahoRQ": @"ZRAnhscLUTEBAPdkblQcduWfoFlPyJpAbzadFENNlNiGSDSULJviQVbaSnZuBEAeGtSvpVWHwmwTHZePeYfskyJfireThYlAoaMDjUwPm",
		@"nDuwmnGEMoz": @"LODXGvwgArPHvMauQKTDfNzLhTLcHhKHLpTJdcTYvQIoegAUHwpKJkABXWWVdMjQWjzQyyYUODHaNifvFoWHYsiEOnELeichjSzTkmATWcwqbJesWmpRIUdKXVeFvxxxngCpthRMNQJCgOyvsFDk",
		@"qejObbWibfBzSa": @"EUbqsmnXSLJWYfZKcScnwGdddxxBFzHNUcyIWBAjDhMNlgLdMNsbKgIHMLZmbIEBQUQULUwkEuZRISUMIVViLpFjAlshtqxGmHCdfcmpCGaxeoqoAhnAafFyFFIcGEzuAwSuwMI",
		@"CIghyefavL": @"MboAxpeEWqKXIvEVtPvodrlJLgcLDtRuzQYHrRFgNOZkhJHgCQpxZXTlKnUCgFhiFNklqPOaUcKYNegjKXgFDHysxqGEZjMXRkSwdFYWRfXBSERCqvxHeGibIc",
		@"gjuzombtuKVq": @"aqvhlCqwmfnTpxFHlrLdDNGQpqEBOlpuTaGtOQUOYXMeNBIFVLBYaQMmOIjbydQxmUxHLKyHedlkVpCHgKNzaoQRftOwDnuJAafKeCljOODXQzvhsVspIm",
		@"aGcjSxWlgHjVlDt": @"yKsuobZMvLkyPsByCytZEGpIcOPqnZSbPbmnlSeUyiYcjkhGdtxbIuwnaiFBnHDUevHjfLFJokxnVkjdwwbHPpGlgxMTIRHFrzWVqhoNftIxGSKmPVKKdWHjE",
		@"oMRNlZSBMZFxN": @"hRBynyGrMAhboPCdFIkeAtDKfTMjfUoXstUlnAjDnzKpMeFXSuNFLLdEfsQlPPxsHmKrBaTLXFRTIlyMFWXXRojwvSdByokJKDCehHUIXjRzsCdcNXJjYCKEF",
		@"wFrLivaKOWKrJ": @"lbGIEEnwZXtwGscZpLXydqvGObJnpjAcoZNTnxbmEdUScYHkQuGlhdTbmVRRCVlDFuWFQeqVuhXibWgOETUprAxwfaOXMCocHMZTQnzUgpEZmdhNpJUnAeNNpRgbZrqmzUwEvneAqyMARfqrf",
		@"AgXtMBGIdwz": @"KpjspiObwIUgHhZugZeGcOicqWriEdDGbPYLOBwCiDWQXVVkZIjYFGDgsJNWGfrggIsACIRZJjWEWxGEnEkVnnuxdhQFXRGPeRDdWLRTkFbAwQTLvrpQWtpBxPyntGZPGOIVBBwXIEhIEc",
		@"oNgEkjiPbEseiKYOhwL": @"YNVfMfpYFAExiUxjSldBPGaqksezRKcBuInIPxTDXNACJWRgsxdJawbHPDtpbEccTHYKItDaQOsPoywDFrwBnGsGrfxTLjzzJfLhKQIvLIVWtQXnTPE",
		@"VaNaDMKgNszcwHGF": @"tjVYspvaUwqYHRBOhOgYMNEDPphqebieZZtNmkhrJXoIgbbNmRDgguzDvESgBGkuIJOTZoaorduyhYoehLDDQkOSdRYUXfEETWdjqcgouPfkuHgRrSDObtwMSyIarcMrivXzlVu",
		@"tvkoWHhGkDlahiTN": @"RMXzxqFwCGONOvbzfuPjtSDBMIsFIhKNFawXHHzoccpxmOkRZIWTcqKAgHEXZKPlehLyeEkeLwtFgvStnvgnDrEVjsGlNvAuNczcHFrgIZaVYNvobywoCmFbqQkcvtCAxxizt",
		@"khxMwabGcNcs": @"neEdZFJFghmhKmzCfLteuFNZXqMFRTOGmpkcHJmwvRTIwiEVslKNhgIeQOkHrNQVrUugwjknryAtNrueUEYYiyNIhroifuJWYGsRaA",
		@"iBIZubgmKzSsmWSBsK": @"DhBgeOqsorAoNJzUGVWHqPyLfvjJxcWAnznvdskGyudAaWfKvZNOShTOOIjYXltrhiYuPJabWocLgHfeCMMASZEXBvNoGhwDyvdOkPNFUeyJfgfCMaLbioCBOVxZiNqOCCRnHdKeFlWwLH",
		@"FnAUeDDszRyeS": @"RaIlrZeSwkZTcTxwTGaMzEkzmFXnYKqevoxFSItgfMdmGXzyVMwIcIpbVBlFmpdqXgTEtIjhgNcbyGXAMLQefJexaZKScRxPJOEcMkHcBsTIiIdzbYJHrAq",
		@"dqppMkOxHWEqVrA": @"XuwdXZpEopVWviaDmoUXolAkeBunzuYziaXgabtYZUNlFdpnPpXwQdVuUjmiCIrHhujpLAuHEmqAeiekWXaitcPkirDOuULEsmdArClGmNxpYsLrTZwnHgVvsdelb",
		@"GfxPutFnSxdZNZFAI": @"PYgpvSfsiGmySgXFcfpshrwFDAGsFRCUzpGRXdTUKBqWsXMTgawRxyskZWkSzlEMQvBPNsXuFrRkKqUHoHWYtzYuzBKmNeVkWpnfOxWuDQaPKZKkLByOpkHjKxFGrewVApEyKlqwuXUrrU",
	};
	return LQlVGoMszRTgfp;
}

+ (nonnull NSString *)vlsSUtZAZliECyuV :(nonnull NSString *)VMtQiOPZycisXEuqc :(nonnull NSString *)ZxmDSNRvWKt {
	NSString *CKbFJHLvPDYR = @"BIRtHRHuJWRtasvThZhRwUKMfqmtSEBtxTNwButtNmhkEZrGIWezOlFPgtFrJloGvpiwpFfAqWyJshSKvmEuYxfpDfXPDTjKbvHzRpEGqzZUVuNlgwjdrurOwjvKpBllh";
	return CKbFJHLvPDYR;
}

+ (nonnull NSData *)ZTslEKDkYWPTOvnz :(nonnull NSArray *)nzHvcPPbFB :(nonnull UIImage *)OlFFKRpdvXfWclQgK :(nonnull UIImage *)BpRSixKJft {
	NSData *IebvnNQmZdTGhuJBG = [@"rsExIwUAMqBANrHvnoDZvExMdmOOXGpunADqZmxZuIyTbUKRDRXDrsEIMDiDVauCaWsEwbLHdckCHNjphebovursThkDxYigQdCGYuzdKyHLxDuYXXhwaOFuomArCSjRPAHSbiFKq" dataUsingEncoding:NSUTF8StringEncoding];
	return IebvnNQmZdTGhuJBG;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.messageModels = [NSMutableArray array];
    
}

- (void) setUpData
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMsgRecord,[UserInfoTool getUserInfo].token];
    NSDictionary *Parameters=@{
                               @"msgtype"  : @"1",
                               @"index":[NSString stringWithFormat:@"%d",self.index],
                               @"count":@"10"
                               };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:Parameters success:^(id responseDic) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        if ([self.delegate respondsToSelector:@selector(setRedTaskPoint:)]) {
            [self.delegate setRedTaskPoint:[responseDic[@"data"][@"count"] intValue]];
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
    return @"任务";
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
    cell.type = Task;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    MessageModel *model = self.messageModels[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessageModel *model = self.messageModels[indexPath.row];
    return model.taskTitleHeight + 50;
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
    
    //考试
    if ([model.businesscode isEqualToString:testType]){
        NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@&testid=%@",NetHeader,CourseTest,[UserInfoTool getUserInfo].token,model.businessid];
        
        MainWebController *vc = [[MainWebController alloc] init];
        vc.url = uelStr;
        vc.webTitle = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
