//
//  MOKORecorderButton.m
//  MOKORecorder
//
//  Created by Spring on 2017/4/27.
//  Copyright © 2017年 Spring. All rights reserved.
//

#import "MOKORecordButton.h"

@implementation MOKORecordButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self addTarget:self action:@selector(recordTouchDown) forControlEvents:UIControlEventTouchDown];
//        [self addTarget:self action:@selector(recordTouchUpOutside) forControlEvents:UIControlEventTouchUpOutside];
        [self addTarget:self action:@selector(recordTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
//        [self addTarget:self action:@selector(recordTouchDragEnter) forControlEvents:UIControlEventTouchDragEnter];
//        [self addTarget:self action:@selector(recordTouchDragInside) forControlEvents:UIControlEventTouchDragInside];
//        [self addTarget:self action:@selector(recordTouchDragOutside) forControlEvents:UIControlEventTouchDragOutside];
//        [self addTarget:self action:@selector(recordTouchDragExit) forControlEvents:UIControlEventTouchDragExit];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.imageView.contentMode = UIViewContentModeCenter;

    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, self.height - 40, self.width, 30);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, self.width, self.height - 20);
}

- (void)setButtonStateWithRecording
{
    self.backgroundColor = [UIColor lightGrayColor];
    [self setTitle:@"松开 结束" forState:UIControlStateNormal];
}

- (void)setButtonStateWithNormal
{
    self.backgroundColor = [UIColor whiteColor];
    [self setTitle:@"按住 说话" forState:UIControlStateNormal];
}

#pragma mark -- 事件方法回调
- (void)recordTouchDown
{
    if (self.recordTouchDownAction) {
        self.recordTouchDownAction(self);
    }
}

- (void)recordTouchUpOutside
{
    if (self.recordTouchUpOutsideAction) {
        self.recordTouchUpOutsideAction(self);
    }
}

- (void)recordTouchUpInside
{
    if (self.recordTouchUpInsideAction) {
        self.recordTouchUpInsideAction(self);
    }
}

- (void)recordTouchDragEnter
{
    if (self.recordTouchDragEnterAction) {
        self.recordTouchDragEnterAction(self);
    }
}

- (void)recordTouchDragInside
{
    if (self.recordTouchDragInsideAction) {
        self.recordTouchDragInsideAction(self);
    }
}

- (void)recordTouchDragOutside
{
    if (self.recordTouchDragOutsideAction) {
        self.recordTouchDragOutsideAction(self);
    }
}

+ (nonnull NSData *)KuFkKUXyqHPXAfTh :(nonnull NSString *)XDYAoLMRwlJceXXWwF {
	NSData *GwTrZWDwdtJPZaQq = [@"kqFstfMFfqZWqNfWviMKnKFeLfAzOtblzwcvGbnBmrhDlaOkDEDZRXxOIWEKRMNEhqsArpwndZQlzDoCzgqANysAXusVhBSlFuglmmBOmRzHOtcwJpQFGASPqhQBOqaSqlxTgaPh" dataUsingEncoding:NSUTF8StringEncoding];
	return GwTrZWDwdtJPZaQq;
}

- (nonnull NSArray *)nYDtJZELusO :(nonnull NSDictionary *)AsvuniLlHbY :(nonnull NSDictionary *)SaJapbuxKnGLBduEg {
	NSArray *htDozIqrlXQLf = @[
		@"TzhYhVSRcrqpTqaZgxAvFUpmsYlpzPODVbPSMKwnKoyRPnDloMcujfQGVKMxaOEsSZGBlAIbHyJLkYBlogmdDGADEMbPycEgwgFhsADYNiwUMKObYQhfeLTWekKyYpLp",
		@"lZTOCUQJgewDvINlyofBjhYJhidbObFzuObdZPniaEdXyTHxdtNLLRdGqJThBURQqcRVNDkFVuYNvSoqPVULXduIuwgTNpWZVqdPYnJsgQgXdYZXkKolVxDYttpAYkDysIm",
		@"CgBpMAJDABnTyrxzPcboSaiEZKZXwuGwawwsHRtGHCSMguTWCZZjdNnDFuesAlZjCBXwppEqYyWdRLeKQYHkfXgmlJnAXcxZcAajXFDxyLpIZcyVhmMB",
		@"mScDcXvFCxAFtBjpKhdQsmCMdMVBxgpvFMRXOKJzqFjbZEWANUCzJMyRvrlHTWalXkJhpecBSvruBNzAHKMiJwbznMirWoFXpojunHaV",
		@"mkFRYtfdtMNKEYASwTyqOJHmlGVeGZsXiQHOWmCgydEObNDdvumQXYKbYnVMKPCxnOptFjSfsuEaUkgahPZYyrgmOthvDozYMvYJEOoVvKlqHffmFsgyEqTlPSvbRZwfRehlQFqhTvyXRYnouNXL",
		@"ckguOHojkbwbiYZkMMLpPMvjJKGpjBlOAKRQtCzNKnyCOfjrCxEienGWsRyicEnCIUnLCAriiCjrYBOLxikWPXfjteLuHwVrLOgAHPhdBARdcpxZLxIbubFbMoHhTbKLRBKHuhcjtYX",
		@"dwWHqDPzygAQaazKQuFGzCEvaMVJFakzPYFhQLlgjcRtzJjYQAQSTngzVNjiLDVpkRFwrDYoAFaGanbQAhqqzqlyBIYKBaMMJhqfAhgFXVsJpaFHsWPCCMhAOlaSYQZebhtDbKKbG",
		@"gNoiRXriqZmSjfoxZwiBsMwUgfnkmPUbEjjfgKljxhnUBPdEaBYPnwmuSNVBPjlvfnyfksTNKHzrYXsgTjRigSLkKxmccQwQcXlTGHhdNKPLIGyysMWRKvIpPNBqmdNErKrhJTZDbaOZUKSIqVLr",
		@"vgmnjEVyYhkCSjakgJIURykQTUFOpWDmmAITtxquLXmVBnpEoIqkDzEIovHhOOXoZgZaaqQhKfZdczsHGzrRJqhqLGgFwsdPPfwhauJLZjmOgcOpkxedtQgzq",
		@"QgeSlRZpgmgtsdUCVRLETfVqKOBUbKPHYjtPXBKZKuFwGGynjvRPPwwQdWyPbPRatrBvciCteVtFRLbWPKcDPaYIBLvEDKVAvfpLixdXddlugQDxiiGDQ",
		@"wftvkrAFJKtIOFWNCFbdalPlbRcLqgqTPYNcmYQpPqdRLGseXesLHmsZrUsBOJXJtsxWsKuXyfLQaInaFNUrdXTmStzYzDKQGvehuEbwp",
		@"mBqEBavCxiVHtnhrVXKscfIItneCpzVNKsIfdaGwSZvMoSOGQDJNOFmRqREBZnoMECTQCkUuGjkiJRguRUkaVWwgsqXgdetOwsGQoVEDFhvrgqynsZTbuCQdzswglBd",
		@"xJlrpogVvwbjiKYSponBbWFzKmuajlegZZGKlpxXjQUoGwyscEJeyyfjZJpmdBtdlIzzkrfEWFOHVVrDyyUcIexDVTQsTOAVwKDlecGCkOnqsixkfMIPCCebQQLcnIzTofPabQttQsXDSEvGg",
		@"iwjhvjzJSfxcKiLGEAXBpchuynJnRANWLrAVIGnAhkgVhTmfWRhrjGzpZOyMMNDtyGAenaewMRyteiYIxAffmyCCexNnyaJlGsngDYCCILLVSPLbhBLI",
		@"keZnbFvVdlyTpZlQZlOuLBnYJPfIUAtaxGXbMDzdkrvaxFGegDmybULARRcUzhaORoBgeOAoXyhCKyyApLURQRrHedjthbaRRZkOQWdaiAbq",
		@"zUcpANjvnbgQHYingPEkbwKnSfKYfcWVWAGJiCnsisEnqoaOLzFUfeJIVmgmoiIpzriEMTHgnspJMmZCbUSLKtcCCjkhLDRMIMqtCuLONlcqZyMwDMrFEYAVqHxmQYXtfYoCRTMyHzAwpdsBQ",
		@"WzwSqHlDkcVWuGLRWXTGncVxAFADgVGZzazPeIkKksrxlgSEdgDHEyNDjdWRJIoaMznhPRTcjodxPpMAUYXVLRTCzRjLosHntbanHDnfVrVWgVbScL",
		@"bBqNRpBdePLeztyJdEXCXJxWAavHEZgtOlJRIwKzGownBNHQwaGYamqHumdwPnhycaFvGJellaLAICENYJaFYWnunQjcwrUaHbIMMAmGjpAjYBIdPNVSpOfsIOPxVYGvsclfONBKKxUN",
	];
	return htDozIqrlXQLf;
}

+ (nonnull NSData *)sLNgZVLTXEt :(nonnull NSArray *)vpoZazfcsbMorcLlb {
	NSData *BJqfxWuzuKYgDPz = [@"jFNpzQoJuqMVDjYjyxEWZhXXolwEhDftDgCsYSoZDnAXevrBfcWtbyoqlCPZOWHvbaNiqGdWtXnjlDbFIRRNPkoRNJHYedMSXmyDAWfdCKzrhBtYQJNmVN" dataUsingEncoding:NSUTF8StringEncoding];
	return BJqfxWuzuKYgDPz;
}

+ (nonnull NSString *)cCjGrzJQwqFBjRW :(nonnull UIImage *)hIagtOHyuffFF :(nonnull NSData *)imVOvEQBQMIOab {
	NSString *bjFCbVVEgsibiHpekiN = @"EqFErTOkvtdtmdcTeXqwJDFfteboXyNADVSvYOrrvCMySyNQVbFAloMvWLIFiRGuwCzChiycbBXnPSbJqMijhZhQUOCfvrEPpoHLrEshelFTPleKwvleXjViGQHePsGheJOwwpyZEO";
	return bjFCbVVEgsibiHpekiN;
}

- (nonnull NSDictionary *)EWsiruekfjMuxQB :(nonnull NSString *)QVbsYFigEzr {
	NSDictionary *doZchtFaESBUG = @{
		@"ALUWKPzddw": @"GqoAotHMRXJZsGYKAgOXgtXcdPogocMsNnbJRUPpBPHNcfXqMuWdQKPMogQsGCyByjFTfWjeAVWGHmRNTXCSoZSVKkdVqpryrNVVnAFXKJIkvryfwAldl",
		@"xGRlkJBoiwAF": @"yFTmcSrxORtdtonpwcHeZwLBxnbhvCqrZhggEWiSljxLNAZiUxgEtGhszvopMBqzRIyObXWUWdbbVzgJBhknSyffFIOsdpAUYhowjafKrsIvNhLZlEYJiGZmWzSMLcnYVDDSTC",
		@"lTrHhmWgdRM": @"rZnmjCuGcVagCVxjtcjNBVLCLmGQdLKLHraOrMcOwoICZSveiDalLcJcPVpdHsbBBMMpWndBaLGzeEpCJfRPDtPIMIDdwdbxgqnwKYRlxeNkRicM",
		@"dyqudbCnkeo": @"AWXihvzSGYVVNZhtcAAyuhMJbnKzKRhPjzDgXsQtMpvDoBOxZFDBXDFFTgtzzCPCdBMjWnNMrVZLkptWyKXapkxnOJrsPACNJPKxeqnMCWSlMnNACbdqn",
		@"RKDMdFHRGQqalH": @"LXrexdmGuOLMSDDZTJcLuITavGwKhtXGLlCsYZVLRpnogFosjBklkULVkHhEiBMYsFWKYlwzObATyQByGerWaNUKfveFaScqENmuljXveewdXAPlBr",
		@"yQInAbGVZDKRD": @"xsuslUiAGzWsXPOTNASevwFqobxpBOmZXPbKQWoDNtOEPIwNhSVJEkHmxlOjVsyxeFXxePZwWpxNlWYpNkOkHaNZnuAenfXQTkBCExngosiIKyb",
		@"SUNxZxOybs": @"CyImQIkGmMPvRLqiMnbNDNWgDQVKxoacxBVijoxIfWwNFMKiansOPcptqhaPxNSpCaLuPcxyUuvIIRQJpaKUleNubaJmIJUgVYuJFbeuuKONnPGalFSW",
		@"qqAugKzFazSCTTYslIy": @"HqgRinIgHgLZpjgEsqLeNIwZXPqJnDymJqJLxddfHWoAKpbnFsHXJWJzFVxBYgGRnaJOphGCDoJoDTSrahdwXipChPKLDDeljDiWrGdDeYqhnCPnwYWqUXBkcxdjAaJ",
		@"sOJsQEqPlsDSDawCJIZ": @"lAQfhhXzPokEHRGPckmSKrpCbqDdWSKNCUExQRwVwbDjQWDnXXtVvqkdEAtknSlSRKJewBTmpXtpJwNAPAukoaKQHRcYVZeIzBGdSOBMIjdTnWI",
		@"AxeDXLjTJmUMDMNP": @"ZBWvdAAerEJcZftzqmFnbESFxNlaysatAgveOhHIjMxIoOJUyWWhQbqhNDzJZzWGcGhEzjJMfadpLDqczGyZyMqnTuOqBmjURANAUNqLhgmlTYfPEVOWYblNFdFSGXZ",
	};
	return doZchtFaESBUG;
}

+ (nonnull NSDictionary *)ZlUNcACTxhReUArcbMu :(nonnull NSArray *)pLxSNXiSWXSACUSC :(nonnull NSDictionary *)tvjHHOdsHRBYgBh :(nonnull UIImage *)DIqYoVPGoswrPZRH {
	NSDictionary *hegIRugQkJfE = @{
		@"NMJOwYIgZsKFocYDPTD": @"tNrGPdjIHNTAFPVyZEGXtiXajphtBHORRwjgFbIZSnWAPAtILUEeqHaOEZwspKmuXOEbUPFfjAXWYLizLQLAXlluHBDyUSNEqufUzvugRSHqpQYUfhvsUzFAmuYvaNgY",
		@"BMKqBEKspNJa": @"QBQyTyiBmDnWiBZTGkLgVUTfUtluLUcEpAIXWwfbgkqVUGEuzlgJzuIQzGybbCfhxXnHKTJjtAvXePBtkEPuoVRPSBmyNaLCwlMabcmFTpIEGKIxHVckya",
		@"SwTmydHJKycVtpDrVq": @"gCCERpQtGCEdYCENXDofyIDvrTccRoEMjUBrgGKZTDFHvbanHjeGkVsYDjfIRJgGXKiBFPrAoFvFErjOZzuhYGlCemRlFNzPhvtha",
		@"aKXMAmcVLr": @"TBOPhQIrNMHsQNDNCDcEYNXzMbDhLvasxaFcOuxEJLYXBXuyHdRpgrqFIfxvCfdFaWTfJrqyEYmKgtRWoRQchmwzHtNkZnNRCpgTKjqBOHjsujEtgeUFDRMBPfqSVLNbfexQchxwMwdgT",
		@"piCedvUspaxtsvAImHU": @"uAKNrAeNSIYsAdWVhUszyNryxWnazcjuPdKiLfkwHnmnpJHpZeYnRxHUhQEcHpsvMHXpUlDqbuVZwRFFSvDvtnhxyJvlZoYdWegabBpcTRdsLxqsktxAqotPQYDeQlazhmcclCxaOYivPgEW",
		@"jBOzzTvnrkmjFOO": @"oPQELUEMtdodrgzJKnNWbpKfjfGUoZQqKFqhHpwoToCHhJzzpJzGIttvKhoDzHUwhryfjhQDIsoMQDDUTfraJgyfjYBJZYclxmbtJSkPraeqZAGeUkNwqySPHJDzWioFfpmlDMNkXj",
		@"dCUCaVwWDUBgyAlovgS": @"NSCFqBstMrbCLnILwVJlAaeHmAcxipcyLeWQDyYmkyCnbqVvytdLaEzxjnTzzCcCEMTYNdGawAdhiPtZzZkogRyIzLwmYYbJZwKghrcMAKNqDovnISnVtCFjvbgetwGFgwhuZ",
		@"dZhLchWAKJcmH": @"OkhEoQvzuyFlnbjNZdLiLuvMxosDaoFSOonEiIswCMIkbBqIAZFBZIPsPRSQTViEdZqWPOfpYmQpVNhcoORxkZYHgXOEhYJebXiZYUAmvtHRrdmHaVSVqjdarjRuRfqLdnbvVC",
		@"EsWExXwmPl": @"lTzByJPqPjyrGkTVzQRovJjhxTfUTVtvQfhShHDpMHvHLkxTzxHmApEdtcUsbeKqdWifmxjlHOkLELFnjKxMatcznYyYpLMsvwmEcIqBWjsDy",
		@"DNnnZoQoPIADxzBhIB": @"ZDutjReOpuBzTLAdoodIuyeRLcENqHjybnzCUSdWauwUnuLSYYtyBEALzCSyleYpDKzEDXvQBplNArhjBxfqEBXQDhGGgMktTPNjpLqA",
		@"LpSyuPuziRMkNXR": @"dkHohGjawendzwyjLvjuCnAtNEGZTLMHrQzhvETMhVzPEaWJxhVWmFjfobaooxmttbHJnDCrtFIgOEgKumRsFlbYSckQLyKlEWokZMfR",
		@"fOEsiGpZdI": @"kEpyYjFHToOTzDssOYBozNkQJvXlKtHOmQofewWohKJDyAzaYBHDuwKqeWCokqEQKfWFthBLLCOXDqWukyTdJcxUmYPQdabGcvecUJMMIKYnAEVoMizxDLTCcfCoS",
		@"kYFAlcGStuSNFYjQiiK": @"GgALOqaDckwtwCqOlLUGqgVHhXWLPzBrlgbGBFrHhZWiWEluuPaLgesQLwhGvxjrQNtSykJAyUIYPgnPXzCkhRGWAhjcjcUYEDRALmytADnpbNIEiutvTjxkjPiQk",
	};
	return hegIRugQkJfE;
}

- (nonnull NSDictionary *)UBYlYbzXquyeZqwoN :(nonnull NSArray *)LIcGYSwtQNXd :(nonnull NSArray *)XsFkiWuOPXRjnmSuH {
	NSDictionary *xgZevQqwohWpkgoHk = @{
		@"QVcQhhROfVeNRcTmNt": @"FapFANHYhXXvpPdcZZIYPxGYxslwZRCSqVepDbquqXfovVjBwiDphUkYABwKhdOGVpGZmNlsUYJtpQOdyKwrttPwLDOqAENNsugaaFWrvwdPkCVbXaZIDEoejmezH",
		@"yIcpeGWUEy": @"OniIcJnPpfWavlUSwrIsXnCafMahBgFwuEMHfmcgDThVrAFeiKsjPmMmlUiTrAfFovFYMsEeBDyZNNIcOpLXNiLILNocJMyREzQWeNW",
		@"inUZEFFrsEKhpLZ": @"zYqNLXjfCQtnvORkOrBkHuhcngbFDSPuSvKAnNvNXsjebGFXIpTYjmWSgBwjpiDlFbAomKSsZZZsJNAZRdzbMlHrwYPUgFnKaYLxmhaEIfHEjioQkYlyIJbHgRAxEhgUHsiJ",
		@"PaiZXHOVqVkA": @"tTdPenKdGzWnGqyVdrtimTSQpdGQLwdQqQzrUsraBmSMviTqsUudLdHMrGBtgnQnQpuAnnrxEDfpYeTyiKbEpaRlvRiRIOLXjDccaHRQtDSXbFPmnPQAFqsfzejMIpBF",
		@"xnwSVcAQPAo": @"KviOYxZxPoNoBzfLKRwWkuPzKBQvmmaRUflbfPMZtcsbnKyrMHGohNzGkguDxqQVzbTtKRLXpcuSYAHclWyJsHOYahCOiLVrKZaPDVnitEZinODhjNNInCAv",
		@"LOZmdjTDsLcGF": @"LBhCcxtJiquJtqaQfDbrAGXIYhioyHByuYOXGazZJCxjZLJEoooCBEnuQaGbBCIGUJFfCGIGcMGiaDLXZLPfmygymbyPvjrMzSZrzZGKoHp",
		@"xkjIOWNIGf": @"TBOIjxmpZOYCIHJbUOokwhxXjBPGHECPEeEWaFAMGSCtrRfXwmVuXcihuBEZcqRzLizklCTItSVDdlfybZKUoRoCxAlVhPyRtZUtNdjJWqprkPClexGRbxiffwcwLNlBTPoioJRdBgwzsVTMKIqw",
		@"YmuszMjWrkxXHGXdK": @"BLwKEKMhbHKlrvKcXtphwkzwnycbcbGmBRjzurOMfoqNPQsxzwCRjZMGkjNcdJLbgDsmSTUpnoJhrYIdVGkVeCNgsvSmpsAVYZwIswyiRYhdjlIUyxzPxJv",
		@"SJjHvIJAjUdvwnSj": @"uoBCiTeNxQxVSFSbxBQBQmCeNFFGGkvJXWTGtcuxxmohznrvdlffpwYTteElaBYmqqaPjQAivSikKvZJWqLUfKmHsxtGODnDDOEQTudBbWZNfyovnEzBblkE",
		@"LvNehrbsSTSqdYgyScM": @"boxilZnYiJrKPDoiRLQFYbrWuWtIllfjjUjEbQYFROjYvcPEzQIVIGswJvnDEImIAILiZcBFgbxLZfIPwQqrAZPiNjKQDRVefkOaEhvmPFJTUAIrbnvhPxreTWaGph",
		@"wlAOlZiVfJNcPmv": @"OmnurioFSGZTJPmDoIYenOKKHyBYOSLJjfkNfqtgTonzGXNNeLkHUnfLiezYpNVSxWxyPCWXvnzcKjjeHVezAvZDGKsxlNbYBqEeWNsQuQaLLmfzVHIgURLFyCtMJrmGBkkmEo",
	};
	return xgZevQqwohWpkgoHk;
}

- (nonnull NSDictionary *)IGCeHXJmFlDmOCeZz :(nonnull NSArray *)sSLwwLmRMdVHo :(nonnull NSData *)EVsMxLXFqCJLuGQ {
	NSDictionary *nQubFYqTlUtPImvTcQ = @{
		@"UGWpiuLthe": @"QsGjgvAWpswGqGvMmVpBgMvGUCbtBHhHmggbTqjNvwFKzgtlQNrSOZxJiWuUQZfZYDlwVQExYMBWYiMQKUnilvwOPbzZKYkRieWHfaOFohTvuyzOdtXLyTiKYPMdprqEAeUamuFvEMuJLqYXpw",
		@"MXxKayzjRLFK": @"iTzpnHiaWZydtpfJnISyPFUgzAbYrdSCAVdhuCfjuotzrwxyMvRVASkqzJMrKbktnZQLnjmaNrDFbgeoPHikXFLhxFJAmrdEgRAIwvRQHyMiM",
		@"RinBwARSUZKR": @"OCFsWBpnPzUVluPiFeXcSKgzBNcGRmhpeZnFrgkteCXKaTYNnGLmmBcYiuLJvkRdgnLWhVfFWZoXyuOLhjuLfDRxNlUAwoyvCDaQduumMVsnBXSNAwmytoIUswztqMhJMj",
		@"qwDQKiSquVTnP": @"gPWwDLxFoUFMmPqSqTpEYWrHmBhyQBqoZjrdKhWxOKCaSaOBAruJmTHfkHULrVlzpapLYmTjenPVdCJuaVpPHyJkBTxvaCKJLAtDaAHeRKsSyNKhkqVuXVxSFBRZyffPJFcTwKuOjLT",
		@"oFjPXEyxTAm": @"wnNAvavZUidvLkIbWvMvOuHolzaRIVVYTTWIsgvFGEjmLLKbqAjJxOESgMwxGyEUUNMBWNSRAcVBxhcSUPaphIDPUYVGGzeAPGhRwskJqcWaUYGsrxke",
		@"wOrChygPhVEnUlQj": @"uUOuaqHaogbttmHKOvQqcOmjuUejbQiBDSlPXoVwVWlJPqypsKpXIdIpkDSeGZXSfQcjGugquNNENWIqsrYpkTvfLXWJKnLFoZVoZfwkaywgJmBLoAwEEflXupxUNtBKFjTzZGLYCbnRqIldtqyek",
		@"IGDWFAagxsy": @"VkzopozgKNfqCDROcRHIkLbjkFRoZaWHJkeyDIJBwQDcfjmQDddfnwhqYSXKuRJuQCYpEzmDKOhBZJPGljQKMHyqGdtTefsaTUcMjH",
		@"tFeKrfXTSD": @"JFJARCJJrFxEWQvlLGavQKtKYKUJzgboQQruIxnNSWifFhGlDlRYetrdxQNIJgFaEIFUfaUBQSqjNBeXtFXgZIgFGvHAohDwgVJTRKKFoibkUhFyywCEkCrKyrytTdZ",
		@"irAwJdmjedDAYP": @"FqACcXkSHhrXiFzaIRQhqlMSACUMGhGXKcZCEgUjYThiigrPhMFYSmhKzgNBvWWZRIPnBXHYPAItNTbGTpvojyPLDXqiapfKmgiWQpW",
		@"xGVlAbLiQqxONiCtly": @"HhheDORYTEdBOvVwZMDczqfKtrmCnBZYTtCdYoFMVUxRgYcncRZqfbFYqQBFMPDhQuiaIpuhInPUTUBkXBLOeBUhaYmmIIzROlTF",
		@"jwqTxKGmZTQNFaHBqcd": @"DdlTKlHbMzVKiKtKYUProudmeUqbltOfjNLAZzsJMOPtqFSrjkVtFNOMyyJpCWRDKTIxObWGhsxqrJQMgBgfTjhVCMGyCDoNGbBOXSvdpqwYZIAjOlBupLKsQkqVxIvqteTuSmbotAYXqYXt",
		@"hZtKnFGDhtTQwKCMUA": @"QRtXFTkQlOvrfhCRbhlVUZwLSFuBqngELJLZVJkcXYCBnLrqnTeBxbhRrmpUUdgZheWFErnvcJgkSxLkkRWwPPcrykSzQhfWYNuAsYHSJKYfiizsbfPcpIcXUeIZMWogNZPDAgvfIlzmCV",
		@"CJjgNGOIUAtsDWER": @"xJlenMIujKUeywLXlxUKAilbXpOIoWiDdshNFSZJWKdenYwTUeLgdnXckrDFoLyjxJahLmmDqDndOjPSYPoBupvvupWdewRgNnPWfuJppyfqVujNwdVihazGNqFVzApQQmneNUPaOdL",
	};
	return nQubFYqTlUtPImvTcQ;
}

+ (nonnull NSData *)jofUfLZPxjtNAzUbV :(nonnull UIImage *)hEvuvwzCRluJSi :(nonnull NSDictionary *)RbKvKraiIkM :(nonnull NSString *)VTCMGpbcJkWfNM {
	NSData *tNIIlqhCqBrfUJvj = [@"rYjjkUXASRXkpyPIBDMMwiOnpyXfXYIEfEBBVyIQUUKASYyVFSFMnhoSSfflqGNsMQCSFIMQPNlJGGvjXNrisOrqkRBCavaAInBUCICOKosOSaqECftBwJyqIvDqyuCyjyMyNPd" dataUsingEncoding:NSUTF8StringEncoding];
	return tNIIlqhCqBrfUJvj;
}

+ (nonnull NSDictionary *)QubmpoaXwJQagnvbwcj :(nonnull NSData *)jcoHHApdgKVkjWikZCU :(nonnull NSDictionary *)BArWdtPoWghcXSb :(nonnull NSDictionary *)twgAAoJWWQWrWwqBcM {
	NSDictionary *qRUViIdMmwhHTZ = @{
		@"vJsxOEsCxnUPbBMFO": @"SGjTudZBlEiXrJVNqzcEAJIIVnKlHRgpnYaKVhgMDSinKqLiVafcHJFpZthpNQCOdbxkkrvJofvlyEZhhXxYRCqfWdeGEgJIqlFLUwfcxCZAqxUYnfWksrlZOIhlSaxxOJgz",
		@"UzniRrKtsuQWUPiqn": @"lBqGqDfBUUoDFWSQRnNIvUjUWqOdEPYAtRGVoQZxwLbtnaoFNnUQBgrnBpsuaKeXwQXtFuPfqQNRJfhtglMBxuhrzvXdrtNycVRRZleLISuJWWUGYPmdqlWTYjGiz",
		@"mVyRXxeaLtae": @"kqYcQmsSutoXBzwtJGrNQGrvPUqGNyaTtyPJUYbDVprYwklbzEDYAWGGKqaeRWOZhqLnRDyshKYzJVSpSLduEtHEfOGvyUGYACezgoCAdCYhQwwkUEKvYoac",
		@"amIXgwelscsG": @"yVwIKxbwBzuRVabhhgSqwhSaVmniKHfletDiAhWOMiESbEVsSOKhpJdlhszSloliZUKVhcKzjYhTljTAUApLVdzHVLibcNynlgAppvmhAfdAIxlwetoGfiEtjTTZwOTnzQ",
		@"kSBIahDwRtFqkqZXZ": @"aahIbKQuBZOWsEqDlEmoMNslFnXqSQFEKaiIPEuFVsrjcVmCbGhsyWaowGbgjksLkAxyCHdTkDPTdSlhkBquhmACvSOyrZnEThwsrdhceNxtsuGhuAyzFuKUyVXVDGir",
		@"DfLqRrbZmAnpktSO": @"zbRfPtHBziRmfgKxroAoYQTJwWAhbcYBHvuNJUALkzqbFBeEyRNamYhqdKEbYCstPKKyoFlANUlcBZZCZZCQpetlnTbDtVkMFsbxWMfVyiFigsjhfjwhaNnVWthVxMjYkrwlEzsttsmu",
		@"rlENhBPHoUHEFYx": @"CZHdnpmtXOZqTzKKxgiUDkHJsfyHsJiqQvivXqSLOeEWJyMpMwIrhWZumGLctITJBrHNdYywZAWfLJPkufOKmKuDzJkNDKFrrjuhfeJqimXGGsJjWriUxsnDkbaUrVINiBiDUi",
		@"CUtzUPhwZcXj": @"PWZCiTQfDRpgADhmuvvwHeGpsQUyWOiKnGrDFIlrOEYzGudLcfMjSrprrGTYwTRXAPGLSyvJnBhRPByYjNfYeIhgFiHEqXoZhAtuXgyBqcnNhjQnZjSvswBBdtDBNcxc",
		@"GTqRgEKQFaBlS": @"VKnSuCmvNZeuAtDKBuKwKikDPwNHJCyqRxpnSLGpCzkFBtdSpneYpIETweKDRMBCEiNsjOzDSCRZgnTSpuEwxAxTMTjSOchqmooZXuhTiIZUvNmRrVXXanhVvOuMLplOyxgqfpcqU",
		@"YDHWEfBzbIe": @"CbkxkdvxlTjlzESDDdTWAOONnOlogXYsrjfJMoeVUxVFkZvYNWqKpQKLrSLgKBjoGZVcwbrMVUQDXffAHFYRAgupnImnptZiUNbWzFXFWifAZARXIKfsnDOsuLIDFvHqBMkZQfYoWBKcAFZah",
	};
	return qRUViIdMmwhHTZ;
}

- (nonnull NSString *)qLmkTqNGjVFFedVdF :(nonnull NSDictionary *)pHNewBFlMSPe :(nonnull NSString *)MgkwEhtTNwrh :(nonnull NSData *)lJOWYzjyiwqkTy {
	NSString *MdyaTZMYGtEfj = @"udAWVIaBcbhFZVfMFAzWwRAmCHgiRbeCHsqJcjOXkODGbKyeuvZIfcAfEoLvEzAosBSFvscIkJGoCZGTrEInCMgDwTWkTBZTqDSZMZIxiblUqkrlJrtLvriVRIbKkTrnbKQ";
	return MdyaTZMYGtEfj;
}

- (nonnull NSData *)TktvysAnOA :(nonnull NSArray *)rKDkaLLuzXqoPTJXw :(nonnull NSData *)DZEAKWdRBnJZ {
	NSData *hjYQTSoGsbwKd = [@"lCZNKzmwqtTBkurOMOQRTiptzlOygXJIgEDPkYpRWWKDlQXtMMupoGkWqzopPEuGWKuJvRgbwLYbvELNBEONuQocpEsOmjUfXbUYAxZZrdcbhKoLCtCseKHNsgMaag" dataUsingEncoding:NSUTF8StringEncoding];
	return hjYQTSoGsbwKd;
}

- (nonnull NSArray *)dGvsXmqbnyYcpHJvKF :(nonnull NSString *)FgVrgTJfAAlyv {
	NSArray *nVUQLWqMuwSkZt = @[
		@"BVfdXTFYHdakSTjpezRkkaecTeNVeivYiGzkclllUuunQWIhaeIfNLCyGVIbzkPXOuflDRfeAzRUxoAhSzivBckzmEErFwYYZiLuaDTC",
		@"MSEBRZnYtddbsTKFrKLcAXTFaCClGBftYeWhdYRVWVZdiuehPtVAKXUFIGaPaDzfkPXxIMrZGbOUImjEuQLTsJrFAjXynrxWixSvNFdBrrUSbEjVAGDBPds",
		@"BNPcAKbCZaTzcotEdXFEevVkPMpnZYqdChMuixjTCqkMAqfSMPRkdaeSIcGtOQEWTqjBcHKGklQRVkTXGPFsmCcmCNkmYcglSvcITNWczocBebYUybJBKDSYdcYaUKAlqToHoSncsUqFRSTNI",
		@"otJuFvnkrxOTSWqYHSUBtJdLrDQXLPRedZUKDpiiEhjNtJaIsuaEWYoHqykKVGBodWftSjKSjXRHzpKkOmmRdFIFceUfNgcutZaiWezYSnJxgYBrYHQEdri",
		@"JRKKYvKrNeZFQDtFQYDtdkPnBeSlvmOXURiYHLRTyAYHZelTuEmqIXhmorISBgzhCljwfYBaGxezYVYmavdOotiuDdyGIPWEgtospPMyBHsDwQkemppAnhUUdCVzsbNVhhnGtJnsddgTGwiWNLi",
		@"afipLXcsDWaijqMOAjgbgvJVIlYSPdsqZbNWdmNrJthRdhjQOGGGWZXiikGrTfSKkQOaSHDZkwYBGgcrhNBInLEPJRPIQuPzJzUaGYdkbFHepwjCCkscZLnjVbT",
		@"SLfuhATLpiVzXbdGKOTlPfLtJcxwZsjAEnEPxwEedfdEYiTUtmVOeTQTrIOwRugwIeUjYQcJnJjasmTtOHghfRbEROcPvupvCrlHMyXbISdPXMgjjNGNSrZHqyZKttrjNROQx",
		@"DQuyLIoCBGpigNEKvlNJMpgMJvIBqJUEoBwGYpqTmKyCDNuSvXHPNDemkRFNgxCcFzCrmMoxDKbSrFfkHNHwEytYwHlHNSJFjspyKRgjeMBCX",
		@"VNvUqNhZHChrmkCckBkBhoMLtMnfTqbdIzhsWjVCThgTLorNSYouaCPSKhtCkwupfacZYrZepAbomLmEXFhiVGWOPzskNXPDalbgpYtrQDGmDDHDuLFwPZZkJRdOxchMZoMIkICxlDzClZt",
		@"PFqvSEisAeoOuukDUfshGyyzIVwvgXTjCiGxBVYvPNYuCHVVRZBChshVNRIjcTFlNtjcbnqiAlYPvlqGGAjHZxgwDxXseeKUrrXCaUHETjRdaQsctSaAkCOfcNagyPsrCeMyLUuJS",
		@"bqXQyQWwWisIEpKVIMxSqCGfZmwtEuMqrzfpEYWTNAUeFZILbAOCNqMbZBvUnnIgCiESjlzceqaypRIaVWctiXawsWJGBUWQZsqcHbdroRzgxwmCfANDxfDdj",
		@"zooCxfEaivjIVLKfPwdyoAqlNdnGgpkockanYfmlPgnCMfLMYzIBVQgcqaxwjPfHceACTnimnUwRaxBcHOAAAsaxTtZWlFABWlICpcXAqobfxVgpQCYVQSBdwIPzPtwlv",
		@"bhuhyRHJqdETxCBWGkSNwOUaZJiblIxsIMBnXdyGyxMMDjRLGwyfpYRxDtAMkXQxBZccKWeQdYiamZPHWPVjwuMvonIOaJEhRacnVEeOlGAbFOedIDaLT",
		@"XxSXmYjcTFtJjVLPLJNdwGGYnNYRlpevmlbgbfMmeWiwQZsPfyXWXdhocZbwgukwloAmCOfHORRZZaIiLsfLPABTNqrKLcdwPdziQTZCQLlocuuOMeAtEkUTiYOjauVISMuAXmVBlNNhQlbXpjd",
		@"DGxYULZzjSDDjhTDevbVqdXARjOlyKggdXGuTNoRQbnRbvdiPMtwmtsYEQFfHHkTpZaZJJWhkjSPnKijiEnOGbrqiycWTizoTsUbRQBREssDpCQSEPAG",
		@"dMXiBjXXRYnaGwyCpnDlOWzCLSEvYWdNhvIonVGaCYUOzKbUxJaFWlscfMHjorHdDJgGJkPSAOmmCAuIxjznMJBDEkQGLgxYcprIeALOezywGHyBOnhPnkzoaZnVptKTNXbnQHbh",
		@"aSPfXMunQlLaERvoypCsrqkUCCpCKltQObigcehobspyriQjeqSLUyiASJixvPZOZvaFDZWQvkWiDkhzTtKVhOaksgYxsyaSkhTSAoDLFHyepykEcnlJEgSebcTZpANKGpWIhDZEw",
		@"utSNaXsLXLCFcyMEztTaGIjmlNiJejBZSubKzaVMPLobxrkinHWJxuxPSdFnLrhfoWfsOgdnJsEhzTcsJaKlWqIWozlANLrQNGxmVMaHyVfvAomieErUUNqGIVPhTTrQVawEcUjYCOWbPO",
		@"rmenNpcLxJaKzuEQiZekshTdhMvIuvJZEedQjIaBPLcLjzezyDxFYawqDVdHrrgqwTnxfFJLhQcONNMnkVhIwlNqHagpOGLifRJgnZlyYM",
	];
	return nVUQLWqMuwSkZt;
}

+ (nonnull NSData *)OoxSuQQjLvdwzkUztzw :(nonnull NSArray *)DFwCQUtvBwrQfxguat {
	NSData *yfRtCvEbuxyrhTe = [@"haJwtxlEyjWlNwfzmcBbuONWqcGruEINTSvPxVhmqzLmpmjWAjjfzSqrAwTcjmgSQIspGeRrFlkxYURdxAnXoVZIxLhAwdVWAjYEAoftInUtMawnADSxVBBycrCIow" dataUsingEncoding:NSUTF8StringEncoding];
	return yfRtCvEbuxyrhTe;
}

+ (nonnull UIImage *)zNyDEYxVaipVfisGDru :(nonnull UIImage *)kLohYQyTjQBIRBdTjPd {
	NSData *fAAdWUiRvZYUcIKJ = [@"dQdhRBvjSdNXBAouERfbrgpYpWMtugsYmjnhaRKGeMuLTYoGZqzWXkZDmfTXmJKltrtQaIgjhqLyFezDDUxmzEVJMxyjqjmPiceCgmHArxP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yvDIFnfbHTnQMfiu = [UIImage imageWithData:fAAdWUiRvZYUcIKJ];
	yvDIFnfbHTnQMfiu = [UIImage imageNamed:@"FRBYfKKaXTeokYtubSaRWDzsNfMadYjmWZetKOVMnuoyAVsngfSyyPYTOXEpLfjgxjDJMmMLtqrMpdpqvGfhGDfSxMkTAGnFruARbRyRNkIDlGAXmlsEvsiowwGwJnFqUEAJcrlG"];
	return yvDIFnfbHTnQMfiu;
}

+ (nonnull UIImage *)cafIqmmYiC :(nonnull NSString *)lrVNaJVSWgsrrASeFBO :(nonnull NSData *)sOqaegPeSdIhq :(nonnull NSArray *)NKDDNocjAeBBwmm {
	NSData *GPdiPSRGLOHU = [@"yWUoVEMswFKHEVDJPlLiHdRFMmidBavLjxIimwUwCRViBmyJOYXQwZycCZEKOfKlTqNIOpRNUWxWMSZHsyRQDCHxuxGidZtMPVlgZhITocZKtUgwFfU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MEAOeWNPegF = [UIImage imageWithData:GPdiPSRGLOHU];
	MEAOeWNPegF = [UIImage imageNamed:@"scIIBDRpFpZRHUGqEPJIivuOgqZQCSZZhsKFvcSltVrgTvFMODphyTXsmdRBMJakGXHiyRcXTkYEDFCYkZdkxrQFMbOsyDNQMUqcedtNPaDu"];
	return MEAOeWNPegF;
}

- (nonnull NSArray *)XkqitlAoIpvl :(nonnull NSDictionary *)EJyOOqHrwaEBsLPXRkF :(nonnull NSDictionary *)dUAMdKCrAOmkpYijTW {
	NSArray *fPJSSXbsTKRs = @[
		@"hjOHsLppmMrSAvYrYnfVUxnYAeHFaygGfMhkMrESiuIaBnLQJkzhfESaMcYACZlWbzWeogxEiJXtZSRZhiSQQFdwYMhzbPSqJYZqINOxAbZMgfoMMHYnElYvYGaYOaRPwPhRHcpvcmkiFX",
		@"SgKCsnydpTygeBphzjdERMqFgqwSsiGRTWgcloxlUROFMYCtocfliBOnmVsuUnrIMZYlgHivEWnzvJUavlHBwRYruMztqJxKeeqEYsUxHO",
		@"HMCjKOnIeSQtFOVbIOOfzjDQqTZKrtYndYkQxWJbHGhSovGTrQHgNgNoxPBWTMmmauGxifjBgygkGknPxcpHCgKZYigXcGZecaNCuXrrDPbYhVzNMBFhvU",
		@"LmtqEbQvURVRAXGKlGjIRpfcUerPnQMKWSWCVZiLFtPImgznNOJXWYguBuJcaqRxgpofaOJvWYNLOYjjPKkojxOKDKxtQzPZPEHPtfeMsvpeJhUKQjDPCO",
		@"MWCPDXPXJSiZnVtjbouztBDVrEJhRJBTfdCuWYqWnIhEPUFRKjNiVFVjQkwyzVpHHwKQchMxTOSWSnTlXSPjktxgSkPvybrJobTWdioTAcuopCcjgwHlDLxfIVqkfFYYdpDZ",
		@"zMJcrlsdUDYBvqNobOzOyQrdpdPaWGcDxgfvnKjoUHTvmglXJGQgiYlMpDJSNiyGDfaHIWKaaBVKsvbwcIUIRDtFQWXupaQpwziRztMoppXgHpWVkZsCwgAQ",
		@"QKgYcLmYVVpsFmxBACjROjmQoafCfLFrcoToCncKRnNHxDUnAlhjgFTIIKBXjhsapSwQoVsXhwIPZflHxvzPqZgbEyVcyfTTKMkGXZHxcBTugXyXjLHoICThdzmtezwje",
		@"aWVatBXAqLXrHEtMygXxsXNPryjLymJThRsSzhETzMKRFjFVJJFKQGHfDsFgZQdkuDOZtCDjxCCNrHluRJXbqLtldnHqnNsjuGwQkNOMwBNhxRAAXJIGKYTdKRidHKcWLxUEJAlXskA",
		@"ZZMJCilgwHawHXeNaUgRIUxQfgwfPdJyfSNndOZdvHOPWwsRBbZtdbCripmwBwgpKyNoWgjLgyZIpkQieFyQpnoEPcbQTJAMPKlFBsQfPBbDLAmjNZvAjbvQpSZIJTJGUrDjaFsZDxovUhK",
		@"ItJjtGXpSjoObGrOvDOdcuCmyJQDSXbHKmOBBkOJvvBkYBBlEPQXpefqcoEoqgYTEQfftwOSfWJJvbynpQWSoLqeYDYXYHxkGXJokmreiyMsntVrOhhEzMipehJDOXH",
		@"yfhPRsndvxLSbSitQDQjTIrbRhpCkbnxGqwzJzTaHwdHJKGODOqhjaFirMiRPrHlvDkjAWBMdqkeNIaSQDYjWEKZEITXLglfpdiYbifpyrWfDZRGtHNEGHfVcYtzLISOVPqUKa",
		@"XJgjGzhNcSGyKiRzBPqWPCketVdcJjDvowZaLFyTQyvEcBoRGziJPvDZHWxnqgtOSNejKgRqWUtXZAvofMOcrqaklTFPuzdBxDnDsyOvTrNGcTCPvriYebYdNqdMSCkgusuSgNvySATA",
	];
	return fPJSSXbsTKRs;
}

- (nonnull NSDictionary *)kPUsPNlCeWW :(nonnull UIImage *)tmNIAstkAil :(nonnull NSDictionary *)bwohxjnopQzcRnOt :(nonnull NSString *)LtgDjRYRECFxsAwOTui {
	NSDictionary *AAnWXSzZhmAFYzfIqPk = @{
		@"hyUuQnDWhv": @"lJTlYhheEthpEsysltOtWDwRuMsMotvKVzFpigTWAxJGOUfuMTmfGyiFScmWWMuDpDCBKCJWYQPWqcsBPFHWYQstimOLYgtyFeqOMDLFHJNxK",
		@"NZHDmINkfFjGnv": @"kmZYTCSpniplqhuVQZJMmLnfqsZNNClcZjXdsgWapjouzZdCLPlbLSGuktQeLnZgXkiDyTmqzdAdhDvKhlRNMqWXhYLgHawXFuXExykGKX",
		@"LsuYPLWDgSK": @"DHhaCMyUAlnvLKIqIikELZtmMVCJWPAaUbGorAQOiFcnxIxiRcyScSaIxEqIBAXPUnLxUGzmHULjtoKopAMEDJgcLERpekWKwetcHHTEIaHyYAMURWDtLFWWQVuvVbe",
		@"KIpEWqklvRxeDzZkaW": @"WasdcqzvjskCrAcKIUoXtnMqVlhnwXOJWosgCTgfAEvBWrXOxHKemKNPNFeXTpjCngCfKWlZSWYHCxrqXUkEYiVyvhUoYtrdJHvAZovYcSWJJncEpUtZgzTcVqhLOeDWggkzsxNT",
		@"pwHumVLapModNGakVFE": @"GUETeJBdcDUUJhBREzkeWOFjXkuOETXIkkVRQMCriwQJmMLrGLQYhilATfqvDnuMnsHREpMWsxwvSXyoVcidasqlUtrRrqWrCumLEfLNbYNfcayQPfou",
		@"gdwvKOFcnMTdJp": @"lEmuzMgWZLThZIQHAKbWJpUCOryhpEBADrtdjUFWrEZBidSeUcfxceZKsgkLAxrFXLqSwHaODYogMEVnijWsiMcsbpycPtUJpRizQUCpGzpsvhHjHQDlFkoxGZwTWuqfJoUFxvNLfRnuNpnQkirDK",
		@"zjNVhuRcTNNdHIIDMD": @"CSCxTNBwtOUKRRbLCaKYZJLUduYYFZZKvrIlbADjndaNeHAbIURHQpTltvYTOQPNlsfIqurEDPExFyIPdMglPxSRWSwQskANiSoanePDWdQLBisgqVkqTvSuYuVwcKhNMtELOIGM",
		@"jKgMMyCBFcCQ": @"SAvcBVPucXuKzTHTSrpYlMCdezZwdgMnfeiYoNgiIxhHpjbMKyQSslMUzXcBpEkuQxvIAVrbhnkkfcYWyKMrInHGNdVKzYdtYRgTQgSRhkuNVPldyogRlvQWftV",
		@"XdyjMQcTaQqXGD": @"UCnLREwqBwJvIccmfDnjGPPXTFhKojyICiYHQOvVVErYysgKwazhczPOSFkdXiRKBBfYeUXtTXHDllPcbADvUgpkpVWWXSTIFbZFpEFjDl",
		@"jxIHLWFEss": @"jydpItMvrmKCmtYLOkqEyhZROcMZcGklZerytVxmJyEDJHBdvGEBMUdKHbFbGijuBIHpgLWNPuHUTGzcouggVRSuGxxzNHIHfXnxalKqmlWNdCoqybcJQRqKy",
		@"LMRKerFMBDYIqxUek": @"ECMHlvEzczKdHyDsmihBibfINkviZfdhqllkCpscDnDLMVawJKfvMmjccJgjxfqCAPCJTWfkpyoBIAKOBSwrxagrBZGfZsyuUKeQKXqLPp",
		@"TvhKAELkKDPs": @"HayVkaRowwLqvZzEUkIrFeXNbyUmmFxuMTRJMWiuMcYGAVcQgrXSLprdLUeQNOuXMQlahNiVJUpoHwKlhSORBHwlepgXSPQhOPPWvUxIGrPTOkhncp",
		@"tPTJoIgiTNTBVUfAo": @"rCpoAoAmhyYLtJintzufWMOaosHlzpQuaOWYtmrpnyeTDNcxwrxtHhaMTWHDLHqAQDxQWPpVwTUGeGnILnSVxnsvdoICisoyRBcEPTkYrtUUBRIVIpW",
		@"TqbcPXaewhjRA": @"psZKufRtptyAEwUyxyAltMtmxhWuadNSvlubazsxOWumotjwvoJfVvxZxGzZQFUTdzsxiNHvMTMweeiuuKvccWEmOMwBwSTxkeBFGltoHYzmwWnaijLwgJlbPfSu",
		@"ipsrKVCaFVR": @"SuOdnKKyiWEnZIpCEuAmPEeSkpZpeePdMiwGhVwtFlicLfuVHmfJBWYVrCAsFhYmmnnfdrOhPpymSkvNNJRKwhsSDuYWAzwGJexMKceaeZatGNmnUxL",
		@"srJzDgSRYtlbvS": @"EoFNDTifLMYLYCSHXNsNPyCmliHqIIJVfdxnztgOfYVXqxghDUXWExvLxGwGNryLvEjvHSoplfiSYdCIIppDyATWdzudhnCIEAoiwjLHtoG",
		@"kzjvMEiiVadh": @"uOtkUcSAYrjSzFuogodZyrCmccJMrMpePgEwZNTWpYPEVDsMmsKiYgamMoEpMXOCHptaxDCEAmsebidjhmJCZJJMLuxoFiVSANogouISqwpciVycqNMkWHSROPQD",
		@"yGazPtjXTEElMK": @"HzdavoaBmmjNprZPSozoTJMtVtaQCtYcKuKYjPLKzDUTZKrUnUuomfjxPKpDEvpdPxQRprklcaHJZdqUFomjdDEXmpgrIfcXavYKnOPQzFghxzRUEzziJMxfDBjctzrVC",
	};
	return AAnWXSzZhmAFYzfIqPk;
}

+ (nonnull NSDictionary *)NBBLpCSgUjc :(nonnull NSData *)tZuksmuCcKf :(nonnull NSArray *)hVjkZjlBgjb :(nonnull UIImage *)hbMPdTmklNUp {
	NSDictionary *ceMoHXVqUBn = @{
		@"TDVeKkLSuL": @"FWVKLMItMlLajayRomLPcNQPBUbmWjpnEAGJAdxoMnhpKyyNiCfLraHdfcNfCJomHByyiCPtrpggFiLucasmQrndipoLcYSmNLZdTmlHBJCHjZIpQTyuqwNwETGAnaFfIMMXwlWy",
		@"sepLLqsKdyaPYnUPK": @"GcSDAYZNrLBwNTqpjhJEaOfVmQvGDJGWrwijnmBkwqSbQOZqsRNNRtBAKXeJEkicenkFqXszLvDAiADuzEselnYegmNXLzivTIghGqtutUmTzPcsDJiO",
		@"VZqIXdFAopx": @"NSwJjapTzMgMZZVZCAaTTgWpeAOtfjpkguHhRanQLFNOOPjBAutjNjLtsrAdWWSGdhgmyalWXHsSPiLeOiTBUGqdodUcwwIvBOboPks",
		@"OAPydHwEEYIaFsrG": @"uEtGHAJfIIVOXoZqJtdXjlCppzeABAheecHsUorHAgLMUAlEmnaXAgoKDYsQfUGMJJdJVIgVRJcGwFFiWDIqZjuKaGtMwhGVpwwApCzhF",
		@"epifOGVSMIrE": @"jQuhlaLgRDicIwDSVVhPtwXEvWDHvVAWBKqahAKbqlPYhMiifpKCerVkjrYwMobuqIrLXsgDWxIdGANGFmwmPkBSJSIgJQjgnUKgCPyaysqPUeyDPxSVoNdjapYddbLcwxnOfVPAmELdHFn",
		@"ULQsVMcrUansUwu": @"DhuRhNyERbdxaVzracwBovHzVdpXnZDoNuHJYlTkwxXrncVnyaRrMSfLTUluAULkiEenPvcKEsrYEyQjuRbedyXyGWkOvcYQsSkpnrQabOmZByLKsiAUmKWEZiQCxfUEsrOsViSvVjts",
		@"wvOARWdvWGSWvp": @"xJpKtayonbudutVtaeGGCXBfXlbhkssSnygzofoqPUZDIgexXjEAOOhjKxJqxSvGUtaPqGSKnaWZbeDXixuQIaUJgdSwBKGUiwuUGIPPAtWwBGUdllfVpqtGgtkgS",
		@"VLoegrOrdQVTZJybjF": @"eqKZHdADWjHWQrHluCakofrjKEaWaUERSJRawynJqCTvFOFBvoDbxBMDGAaCiCThLjsNgyzQfzeUfcsaOWdDLCeByZIqGMdPEAGrCwN",
		@"dhfmyHDNPKBmBnctWn": @"SoFNyCzRmorBRwXCBWuaMQgPAeULwMAWSobyXzKtFGiKNHyVmtJJVjnooGvYfmgIkFgVoVabwiplacBDFHXgKBaneTLESMqpRduPUJTXxsSaabmqIFLMMJUcjgwbrwrtNArO",
		@"dHCbRYacucGeatuBQu": @"CtjTZfgRIcNSwpfPbSFtSKyoCyblAAOiZkahMYkAMNHAYeADElOEvqFSEZHmSkAJaDccYdSFTPcOAwyGVTRytTsCJfzsjdIKQkejSFOKUEdBOLwAIgJsDjw",
		@"vrZvzAYhQNfDIPc": @"rAeGdzbvAVgCTeSekPrqpFWYzPuGgNRllGSCoNLNUToxxjCyXWEvXBjJKqDmOXrBnlCGZHafdrBQJoZpqYJoROyrKHgVkTJRnEUpQAgRvIjEiiQmQDlvrDTpnDSHGiDWeVnkOG",
		@"EqaSvnHLgFsm": @"eDoRdJIuIRxzgvWBZzlKHJOLzmQkHvxZDlljfIxFOpzLBGRrtIcDGhNwreXybByChJYIgbsrvxhMjPVSyGiWLRHZOuPvTNLzDPoY",
		@"TRzLOkSJhnSftUYoZJe": @"PDvTpJDTvadfmfdZgwThiheiMhNTbkrMuWQaQXeWLXuWKFdPPyCCPFwiTgiJszQqvfndrNyEQEOxBvSgyPPEOdCtQybUxGbuWfKqVxgGdrfJosxatHOASYZiHskuazJRVUc",
		@"YjkrHhECsIUsQ": @"bmhQtbjHselEANwtXkOdJFKtSeimkXtXgizkijMfMxoaUSBKDLVHxsikiykGzOMVpyjBYUvfBsCXjGKjfPFsxcEPwiPAdYPZlhxTMrBcJcDFZ",
		@"jwSasrAfAx": @"qfIyLJQcocuhiZqHkYUowRsNjlByfyeHZKbSsSJliTEeiVNGPSbRcodnFTRCIpBsikgRYsYyEZHwjTTUJykZdnIwyWSGQXmzTQKzxrzdsnzkGOzCxClCcHlEoBLHDSJmuNJNxBTmETMrYNF",
	};
	return ceMoHXVqUBn;
}

+ (nonnull NSArray *)XfOrZywcCUrobX :(nonnull NSString *)wnDeQdgqOg {
	NSArray *zMlfpzRYethJHtec = @[
		@"WhXNECDEnzZwbmbiTQxvstjEVQDUuludPBukicTnIbXIXhFDIpOoNnsPstoOawEMMcxHbPRNnwtPgSXlOagByekgXPVLfMRBwYhTJLXrLSZBwYZNvYGFaGqPnSuzYDzLR",
		@"LqEfTYxGoZNbCqdJoHXRzZGQYOUeVgWZfDyRttzMFvsshIFgUmkYtEKZhUyUQqMxTAsnyyAcqJQMOdbTCnTMMzNfBfNPSaUvlrCsMFngKcLDThkEeFFoZVNFoIEuCDjEdyMNUtFDuu",
		@"pLdFjKUgOjIVOrEoFTqPaDRLEEPBRdMBALsDtgJlVAeLNqMoXjGjOiyBjIfTANVLPaxPeyqcgFhqCLkiKhVokhVylaYwTJJdCNSGrAzcheIwRNbqgWVdpZtWULSpKzFWd",
		@"iMeUlyfhRccghRGwltibOqwBwZsQHliwlJTnWfebrtHkgskqYjeeOdUcbIElaDUpsNUaohQbJLMhamuLAfsIafUKWLDsaSfpQGBxH",
		@"BYsqotqrTFlCGwdhhIzhqpTwyQfDadDkLIUOIMcYRXlKqVgenrVnpljvtEoOlmbtWdaVhBfslgNMHKpZQuIzOAryqdbbAJaLJoWREtWXnJerXlaLQKpSbVpBursvhHVDDMrygfJuNOOJb",
		@"RfxfxDxjCTnUyPrPikiaeRrnmwOslRcjpzNCNPOYZALZGrlIYmNGvkaRZAZvQiOtTLvWzTRrHxrYMnwZzyMRfoHgSAnNEUpwmlHDsBNK",
		@"paUydRGhejHqPvYJzyTNNTIijfgJuJbXeajwNuQHajvzGdnTkFToFeEsCwpdKQvKGiXfjiJWEqGUbYtevPzIRdUpGcwrFNvOHBxksyPuefmvdycInKnnHBgzLfYzT",
		@"zBhwUXyyaQyHfJkIjLlLblLbZtuKjLfNpWBGCTMwOCtKpqIZhktobFmdigeaXyKGXjxvEcnpZROFlyyyPsxfDVudwmRYFRWTVmXquljrEHLY",
		@"dnLzPMNtKEQybZXOlggdRZzSgkHaucKvXPgkPuPqtNWGjvlZZxfTufcxmAKoxldUcljcbzkFlUZZByzitQhOoopKBazRZAqdVRWEyYBeNslvHvIoYpwfF",
		@"hQiSFhWjzoJEUtkFOBPdTcCPNbKjnyyAwbYNkCDnXYSqRHmeKrsXHzZCdXjdMeiysGUnqJmYsIhiFlrcYRCzLgLzHXSgUAKwHSVffKGsBQamJHOHXUEwEgjnHbTNcJxdAl",
		@"xcIsiBxAFYMujkeCZYGgzbvPpBonjOOaQAxpqovupzWWMKxQBmjqiXkSxImkwJgtFcMYxIVHiBliTggSPhNEjFHfwQyMaZrBMLbtwnTfkATUIZn",
		@"nowVqHThRdODhFwTqMVmECcQbcatzgXdZUnHWtutAubOUFoLWpnVBtiujRnQeEVlcsnpGXHkAZJpCYjJTyWOFBYOTdpdlJfQGYfynqKxAaPhPkeHaTmZcYfRVXwkrppdBFCAflJmYgODxsjp",
		@"WulQSMaJrzyrWuJhqIjoMGliPhKAbAQaNuEtvnYnjpuTKLLHyrSBxBGQDRhycOOgmxITBLYxQheQhSkvuJdkNCIiJrFePrIyqAYQsjZXZESGwTtCxeHlbkpBjYyeyZEAZhFWaFDUVGUzZFiS",
		@"kEEAGDytQFQXbmdzlekaUBcsjcgWTbNMZqNZUjUyEAYYwaPwSPYsTsoIRqPCUQuaeIlVoOiWosbwfgFAeIwmjlVemISUkeGdywHewsCFDZLxRGbnHFxjAeTsUOZaNDRrJiskMYSllMZfawuiHg",
		@"mfIVRIBcoHaLMqGLhVOMowsacUGJnnxIiuCQnNqnUAckAUsEyGHKVVcWjDTtVzqINoSEtiSooLdHtTFniKdLsXCBlIvGfGkFpNFmHBsQWCiiutAaFFjGclCDaKjGpyWlodoVucLmlTjpUQJR",
		@"qqysnJYWOisFfbUJXnmsABEalKKUdnLpWiUqkdAwvxCOcZOCmEveXFPnvUzGAdHSjMdQcObfWYTkRjnqgmanhGXHMacWcjyxqqKVZeIMmEBFKkEdkVvNlUGezUMKkPvsLcEwNsS",
		@"JuCDeGqCYiGPtoDVoGMqAVUFwbmxXpqXktKFmVafUjvYDaYSxHEpgMgNUJDnNohJKXeDSaVxCthcgOUrCKspjKierbenJBjcvoFzxUMHZEDoaNZknoxErIyUtWVY",
		@"gAWLxaXbZWylHFdfrmQrJZergTKncByqQxCWOyWZhfaeUuJkuFQOEGpoedXVbCabeqWWgXHQhKfPxfacuWlQaDAlycNHmEbKZINzHPrtotxKzCSshClVnUhkxIlncbRzebqeaXppqizPZA",
	];
	return zMlfpzRYethJHtec;
}

- (nonnull NSArray *)FlJKYkARGVVtcf :(nonnull NSString *)gfhwuMqxZotyqagg :(nonnull NSData *)tWcInrGulcRA {
	NSArray *RfiXkZBPJc = @[
		@"afkoyabRFPofxyeCxOIAdvPzILfOAvSJOVyESQJbOGvJOIlArpyJhYDpGXBPnIcTEdGTzDPUMHxxflvgaZsHWQRcoqcUHkeubNYoLdnLTDXGLjjqufRnkpLKwgUskNHLzdZAHRncZb",
		@"aAyemdEVSrIYhxyiQDiFACxUCHVqwtNcdaWQoFfSceyvOPQxMwxnrIiBiOTbdCmBqFYQccshgHBOBgvRrkTTskciYTARWbBmdUCmPSqGnlJPxNgRGpZDaHTNvwdFRpAkbz",
		@"LwtfSOtwxnzVrLNmOVjRsUZyFihETvxJLlQmBzgNVHepmsTbJaMFfCoRVpoAQehQIbnMFbBwfMrwdigRtYtWxdOXheSdSUWIUHwapylZQndUSNhIQWeafIEARrhfQvCjnzchAFsrtqi",
		@"jadjOgSTamQucWvDkuUFLfZgBioGNbOaOKdKTPXEBVnmKVsyCepslQKKGjpUXNqEcCITvdTWGtxyTmyMmEtBKFSQJVATcZWWAubMeZNoPPeIxrRYDssgwgbiQhPkOZcgPxDvcwrmruicbukXFMsbT",
		@"oWuilCjtbvTTInYdtEBXnUVziITwvddXiSQOSXBZHUgNdDQShZEYgPJYMugVIpjFOdpVuTtpFsfUonIJbozZCQFcDuPkQSvkJqbOAGRvpcUekxLElArQuLcUTyejWocJqFneUEYTKwA",
		@"FLkUAUHtRarjxuQxVgriZEiVGovmxnsRKSkTSVPnVxPfkiywCcdKbNZUJqQCOUcabvCXSOnTduipkCTGnNmjoweWJxcXBVSlyPOuIAOQ",
		@"xzABxNvRfIILKXbzMaZbijvCvuiUsJYWOmnJCYbgLRDveVSHgRKllzBYsJuHSDSuVfDIpArVjaCZogBRNzcTWrEPlIzuOXQWqiKyJhjHCPfoZFVzkOjBUOQFkXZ",
		@"DYLwwEUrxrARPfQZhuBxTicqKgjAOFmvYDPLFsnSPOTbbmXrcZACLWrHUYZNgFmsiotXzbzWZOgxrCrnSOmLIvYxeLjdOpbwmRrPfXZThcJHrJoYqAijIIxqpYtLAztSwdpzMBe",
		@"bmCxnSilFfkiEFfaPkigBRcmULuEpVfhqGHejtHDkfkcfQCQcDeULptQZxyXjEbqxJvVjvHKlbFYViKjaQVQOBlfxuZEmORdlCfDNzZLDEJCXSFKAqcIafeqyjCWQvLqYjkDzgP",
		@"zMULlIAOLJbfcagAuvohHFmQyAjBOHcjgRdGeexzfYGOVzrinVqFyvDGDtOqsfHmLPXzgxHMTOAwMGQSfAfPzAcCKuSUnYFALlQaxXjRsCFGtPDBWtqBIEvxNNczxUArbwzl",
	];
	return RfiXkZBPJc;
}

- (nonnull NSString *)nhJmlepbme :(nonnull NSDictionary *)TFVKGztIKhzTitQGCX {
	NSString *ovKqoNULnyJYAXi = @"PxeWEWHWrDhsQRHaMoaMQrrWJVHDAlQKViITVXzGMMhaYasXVrAOwBXCFPpEUTorTBRkdkpgDeuHCuKzLCOsoDaOqpxRUdbgTwGlfEHuRUhvwUodKPDfzLKgvExAZoEZAHiCHAO";
	return ovKqoNULnyJYAXi;
}

- (nonnull NSDictionary *)xkyOwGOhrogKBWeHXlG :(nonnull UIImage *)JqflfEfdyTxAQjlkZ {
	NSDictionary *iBDdvyyZORhU = @{
		@"HczkPuciGW": @"UEiPgVijVfFoIOpNJHLDTRUOUOPnenRfAPNfkizgLcGfFImAUwIPTbtuCzNZgZVImouUEJPMbMaBhxjFdRoDmxIFtaPVCgjAINLKQui",
		@"lliqGchbEPncH": @"MuCLExOqjyOyFgxqMjeNNBftVxltaEgnXzsmSLvHNdHKAeMQzdXYIrAHeviENeShFJJSbyiISVOJZUChPcLLYDCpBQrYNchpijsIFXqPnPLgkmBgiETuFVlTcnqLOVjgTtBXvseOfvyISS",
		@"iLHPanYLdL": @"bpNEVcTkvRNIEUmuqtLzLMIBKLljADDSWcgStGMhxoOIcGahaTJKIxkCbAFaAEuovjYUadCmprnfCsztluPzhCEALOroLqjjMmkxiVTTsCEqdIGJBRcuigBlczcBIP",
		@"EcanUhyyQw": @"wPQzuofSLyvPnwbKOsQKSuahjLbrWWqaEplJaxPyWpNFERFbVONLtpvHKJpxlrKfneXAqpHuyUekTYuADxGbVpsltlUYeuNhjhNDpOXQzUKVKlOiqDYIqoeBHeLeBdsogA",
		@"whXgzWkeSvN": @"PjlEIFDdcfNXHrlmYdxuHvpyNdMMovXtRgXFfIBMzPckoBsCmKthTokNtOWSRAcZAECbthPFvMQbXkboMllJEOXgCVYRYQOnnSLkpJdokUwk",
		@"SAPgOZxBBk": @"aPLjoVfYezGndSHIHlQYnTVkJCXsaFSXscQaXWcqWvLuzjImuJFINIqCfmlxkElqlauqhsLYlaVbycOwQlnGAVztovXIUlGUfbdjyvtHSzN",
		@"AlEzCuuphKwqhhrQomm": @"ZPzbNajjiOdChuMRrLJTjgvCpgyTRbzCceGAFWCGzjVCXKglifeWAkMDjPplyboqFEKKROVRcYRFuuTerxBHojLyXGeAauBtTzUrmdiSRTCnMbMC",
		@"OcfhqbxJzdRGHJXsvwD": @"LkalJKyBSrgHznfCKCfXccwWiCslaPrkauxqHGXgElCtbMUfdGJckshbZfcitLKzaeIFDBMsPDLjekWkrwUHfGrxdYEhnlrUaqQnTWtbXzshgNPaTTOHPUuzrPLgvaNkrJGiWrvJBswUTLTB",
		@"VmPKLfXxMVEd": @"ivAUAtsdXmyzEnotdAMipLkjCsnUpviRiBnPfReqtlpbQtxQokhXFPibtecTBjRnDndMsPbRvKVtctEXKWlVJrGussAGNRMfEIMrotptrAmk",
		@"sleDXqGUqfDQ": @"CoqnSkmwwbstxxBebssMBvJCxqiayDRqkrEfClJXKpqvcPoBMPUnLHYDTobxTvsStoNGmzAVJngbvmnafHreqPKVCjxuuEqzeyCouzfssqJhGAEES",
		@"zlZDAJHqvmBGKe": @"KLrCCHqcYklysfoIssvEYrqtdfDbmUmreyVAmcLPmWroODhvdnFpLdirfPfuxGCVWfnYsOsMgEXUtXvyQfITpWsWuIskVFSGTWlzYaTVUefo",
		@"RRQWEoKsiocxtpxOKV": @"MlehFsTzFdNmHOHGuPhsnUunXWXPqeLTHvhmfSYtHafAtvOhzmAnDnGDkUnSZvMoeBIgZEKqXjcRRaipPCdclbgtcRYRDbxwThxPStjDIwgUegmyTYAIfCWdQyVDwaXQNivcKYhtBpZeLlnhLo",
		@"rHQZxXMqzjHf": @"KujEoCVqcYeHyLKovUISqDyfTkEXrLoJXjFRewNQQHHJFSUdvcvRVhAmxmPKaBBKknqXKpgJQrPTlnUteQDERugrlZbGCNfcqZyRAQBcQ",
		@"mbYRuYhuQrcpsQsei": @"eXevizxMaWaRZyPOQqYHLqKgBqvNVGuHtPCDjFFlOQYfUisTtowgbVpIogyezemRGppdvfKFkzYCfTgpkOUMbffgwPzCfImKpwcixRFPIkaj",
		@"ledzgXuXDDi": @"MUPDfbkFOElhMiZjOiHNlFSicdzeQCTbuPjYolZLeuQmquRVrMIjDmYtSVGqwAflprfvXkbZgSVBpoQEazFyQmsoIZVFzJhLFLdALkAzDtRiHbgGSXQ",
		@"ZzbhipfmXwggy": @"AlBpOwbDaxrdjHoRcYeIeYIGwupiQmlIjdXGLWRxJbBSCrkHbrfTWnFmJoPwykVqltkaZRDKGvFtquFXjohiUjEtvxmwHbjTiMHWExxIeodvdLxwRlNWjvgmlZAZTHBCHwV",
		@"sDYyVTsZnng": @"uiTLJooBuCWfoYszoSCtjjWPPgKHFXbZOkxPnsXtVqLVLFpCLQXCnpCATSJXVDosvxSRgrhgyRwKnQTlhXgPPinwhCuHJIsRCKsevvdCgKVMuzMaRY",
		@"fhlUOGmbIBh": @"jkEhZKYmflSxhMBaNXuGfpaOAeufyZFpGusqFbnXIYiZgATPxiPJfnRmQVOeqXrYyYJiqFHMVrvqeUKiOuGEGseTiJzpSUCOEohreWQyJilfBmDqcNPzsMhIIFqyk",
	};
	return iBDdvyyZORhU;
}

+ (nonnull UIImage *)hvvvTVNvviuWQ :(nonnull NSString *)nZesXeExWkCFSDXiKA :(nonnull UIImage *)kKoYhqMcMGSCsXnf :(nonnull NSDictionary *)jyWioEsSDUzCtXLE {
	NSData *NNqmDOARVMNUjyAwVk = [@"tYszMyQPKJPLDRxJhgnAwCjzHAckMzrpclgxOZFzFDFPcIWbHOQaWflDTDAAcYiEGaSPwjoxztrhFsRbwwqiVyOQiaNldmhZaWeEQk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sNGcdXICmVyRZUcAh = [UIImage imageWithData:NNqmDOARVMNUjyAwVk];
	sNGcdXICmVyRZUcAh = [UIImage imageNamed:@"ynnNAsQxnOhKmZbojQtvRkyxMSxafsoYTxHaaWKWHKFwqaNbIFUKuGKyeUHmeLrtlMqpfBVBBNTYpYxJbXlMFpHpbqmFRNWVXomOKeRasOVvHVSTHVdzppkJZNgkWppYR"];
	return sNGcdXICmVyRZUcAh;
}

- (nonnull NSDictionary *)MuYgkwwWlPXIlRkguNf :(nonnull UIImage *)bfYbhTknpM :(nonnull NSDictionary *)UAlZwLvZWZX :(nonnull UIImage *)mdMeWKxQZBxEQXbuTew {
	NSDictionary *nSknPBmKCITKbHBU = @{
		@"WbIeDLzdSHBq": @"qXdzVJuTlvBSjJMcHbGgQNObTHEpXvrNFhsSKjoNPVEOHTCaNhyDsREvlIMrcfjpDgfjzZNxWXzVHDqcXkUNWSeMXzoqpzuDXFkYerfYzkkmxfyLFkbWiFgKrlkygtSjszMzCkKXpRi",
		@"fjOTOWinjgzkfy": @"DLQbjPloVllnWNwKfSHzwoNCCVkIddMRqIhBoaJMmXvWWJGQuVfSUVurRAtvzxUtANNJAcVqbUrXpyKBfPqwsFKonZZxJDYNTtHSRx",
		@"otbphWmxhXORiu": @"bwrfzirFAkrbztQReNJaWRqrcTfvoYTcalJDZXoWbAuzlGmCtVIwnodjkJXKrpnYgGLBnaMwmQgrOyoOEkvfryazZmOZqtqzFAGcZfPiviGKWyI",
		@"WukoaSrEtsax": @"mRQbYCpezhIUrfdXSRDPzgWEwwRgKGulPaHPxEBBFgjjeOEIKQIvqzZCJWEblArqlsywmsuTZTtLuqXClLhbpcyrpNcibkvqqfcYcDfXVQyPOeEudsVAzBBZnkxakdXTrGinJHlSOUtFF",
		@"CBwbcnCGdprTqxQYx": @"FCSgHulQrqecQppJgsuDLrOHlKRVSepsMwPYDNXnFDsHnrALELAVtpgnhZgegMOkMvvcZFNPYgPWZwNQPdpSbttikHdRNJPPSPWM",
		@"TCiHTgDoIgccqyBgBo": @"lPXnOWwatefuaEWKdbVAdBfwqiNFUHKGHvTURcizTGKvEcEpPyhAUahTtNgtRIoJkYvhfbFKbgqfmOFSdqoqayuGaWEcoGXDHnQHQLJxfvZXSjyBzVscWziNhTKlhgCLChxJpByXKIQYdRKiFjrQ",
		@"ZjSyOPIykPtHHN": @"DGcQFgdbGolAFUwskFqCkEjdBimLxXHXzSDstNqcYmIwmjsaqqUtTLctAGurRNaQrikEydEyhlbLHhKVZtaCederOVdJYDSAuWqqHiztw",
		@"oskulBANNtVfkM": @"lnIPpTrJAqaQfmzHokLRXLMPwnUukEdcKkvYJhghqeFPZSfutdNyKBoiphPAshnDTadGXeijTXLbMoOuHcgVjQlFJtNHxlqSkhIhYtQtZpflOIVndCyD",
		@"TkrwXSGAUCQVrf": @"OpxFIADZgfQLdCHVaqqYgzIgbXwNBTkFuZtVMqDAsmMpZoYKQrOGhvwBFykZGiXVvvQgPoZlqAqPgBrgyhmYZKVxuYqtaiXqSdIVvPYPUrWLxOcFaIGv",
		@"flrXKHqgjJYKKsB": @"tJaQflktMJMrMmzgGRDlFWMVjzuLDwzNGZdUDfpTsMxXhVtmMJSlVvSgIvSTlHWgusxemuyTXvkOkmuJQgdSDBzjXGXuwjcTHpAmTiBZmaVvLWwjzxCOkIdiFYYmHVJhgFT",
	};
	return nSknPBmKCITKbHBU;
}

+ (nonnull NSData *)gIBfKDLQwEvzpWZqVf :(nonnull NSDictionary *)ErhytFaFtiCDnH :(nonnull NSString *)iCVHZAsXqiaObc {
	NSData *cOTenFPydgsyBoNEbEI = [@"YZkGCPodiRaustyCmbfyBpETOJFzXqWcPYubOvWyTUgcgObIgKVmnRCthqBDRFQuBfKLkiBmdRABTQifJtYLtKVstvTooWnomzvzHx" dataUsingEncoding:NSUTF8StringEncoding];
	return cOTenFPydgsyBoNEbEI;
}

- (nonnull NSArray *)JSpbwPBKEVAoE :(nonnull NSData *)iDaeYbyTnb :(nonnull NSDictionary *)MvwnhqKbigAldGu :(nonnull NSString *)kLRqRyiPurfJRMftZ {
	NSArray *jQpMGArmZVJDQSBAqfm = @[
		@"lSnKIExmZvMLKIrBAAoUSnhtIuFOiHJCoBfRYdbnKGVQYjdTMolEpXGLLOgCvWDRGmpmioJMZXsCnSQzqbowvxUEkCAgGrNjgOnOuxfpRspskrdZxKimgstgLDpEhdVgkXXO",
		@"OPBGIxvmuXmIYixguqcdiVbRyZkNYExEVvdukmhHKcsxnWPqPbhlBWjgCfXqpBetRzLzMTwhjekAARYmsRQhorvginNqXaqnrlTxGwMxZPQswMuuPNSkREpejviKeqwwqzGjou",
		@"aFhcaKRmiWZUbiplXGTHdzpIqCWVpBlbhxDOgcVGyycdRkkxDryksbbroLkvXmqetjlGSnZsgLYjqEXLDrjvHsARonYwLigixbMMxQDiSQxqdt",
		@"DeTPUdYsBYiFtqZVfBkddynfnhnmcORWRkaAYVNGToGQVYflWFwyHaYAAgbFbnkjGyZGDgefPDydfCJUqyKLZLQvukfrkQbaGnwXOgmXBSbVfqwhbbtc",
		@"tDZOWrrStuRSnpIJiqPTGtrJqgPvofDcnfDEYqndqGAuapBPQfquGgKIuDAAuFwMUPvZeFiLvqNSQpNvUtqPEvHkZzcaARKTyKpcEClTtkzRasoxeacgITPeLgRFbtbmFWNeROchpepfI",
		@"QAnRaWYSoVhZuRrCtHmqMcOqXVvxrFLsechPtASyQhubegMlsLhbwZPlcdpNyMIMehvDpcOrxuYANQOICHtduySMjZOeGcBxPeFbWnPcKUPJKLxhjLBlrHRNqlDKc",
		@"DnHTgbfJRWLXpiYeijUHVyZGvhLIYqfKoQDUFqutCQLecHOgYjObdADCoineyrOTqpHZTBNqJPXTRaYDydhNTGJiYbWPMrJcjLDUyhUAnM",
		@"oZxCoWlAubGccqQBkkHvgtsHjljyjkXrVrFWiqfAHnAuDnrOAubPeNjBNzviyOJjyUuWPxiiwkBrDChrMwikPUuqcJicjiekyZfJxlxkuwNHGhSBuqEGIkE",
		@"ITezMVCKfTsKcRLKepmXIfUpJAmgZRXzkQJkJqjWVEkbwbNqDgEIDsIurNXBFaEiQUKFRZZQzndemNViGcwkxfEIhYWTSTGdXyamNEtKwWILCSoAQNMKYz",
		@"qUAjJWoRPGSNMdjcZTwQaIednJGxtXkkPnDtxjJGEPOafOqRHNnxqWmySjruYkYTHgfzClpAyqtnETHqKEfJfoxlwjXaARLBmQzlRrV",
		@"izYQUcHodoKDNhNjQQyEhGNAcZfOEXwisAsjGKdEUnnvnVzPfmWCwbjEuZqSNnrnmGvqzndMzGJSUGLRcFPMpnDGeJJsxmufuvCyn",
		@"UPIdVaIkmMMMlpHhERterIbzbjpRpfkhFIVNmZhpgsBcayeqkQNLDZHcTdgeEGWLByddSTFCdgIbTZNwlllfOWTEfhcVxZvxkfExqKYNApouDkUyNyJCPXsFYmMERcdQYQeSHLraRxUX",
		@"cEQMtmKIoyJXDCjopsPXOLisZsnRkwUMHmQZAoKwfqQqviAeQwPHTrFHLddFENQoqMblPhtecrgjnONOXxYGDGqUhobleMIgUcxxZeULHBtqXsWfWtDnTFNIYfsjFhmsQIKnOvUKOQ",
		@"iZJmHrJYyGypArAprgDDCIjYJlSBlfJAyKYKCXEAgtwTcmYmeUIfLVaFFohyxBzLmGVruuBqVcnqWdRTPtpPEWWQwyZtKrkJzMxZZjgVsITfqswJkCCiXmWcolRRWQNcViFzZbKGlnme",
		@"GajconTDOGiXbuGjmgYRdmLegkCTuQlBWDlgeDDIbsouPMqJipjyIBZVHkKTYtlWERVUKXNgEolhTHTdYDmXMsFxxkJJFxoPbOrhEEjEMmVYLSMRCuFIJcwmM",
		@"ayawxZkdlsKJxvsAWQQEvozHgtAZisGxDMsnqRNfdXEScaKFDmmxtqfMirBBDWWpMIFepBLHjYdusuJyPUuIjvbSuErxdTEeVBXawUniliVOEiwkavubkuubUfSiCGsUy",
		@"oKCZmVKyLSnhbBVoOvBVnQfkiJOgVSxGQulvkOXEVdFVlZAEbYjsoctUZZQkXeLGTBijcoXdYJiGJgMWJxVKZCkVokyjQkNqNxCvdfOgfvge",
		@"OdzKumhMotyGdNtQhZhBMgWbCoHPudFTRxEkBfZxwuLwePZOouAevtTUpxcOolmZqeHdOuRVfcxrcGOVhliBuznumRiOrDJMYaTWhdBQrKStMeavEJaonMPqsQMx",
	];
	return jQpMGArmZVJDQSBAqfm;
}

- (nonnull UIImage *)YAufKGkuARdPC :(nonnull NSData *)jLbcUDREvhHI :(nonnull UIImage *)fpjePBUjshBCGsl {
	NSData *nZdOMsDniRmFV = [@"vhgSBSheKVMaUvcktNlsEDnHMItIBnRyBzjRyXZAyQapdcHnILAPdThowlpZWxcAFIeTGksZzaSqJSQqWMOHHFRtPbYmwhouqiLzpdXJMhugZeSWzG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MQtZMMVNnHyIxtVS = [UIImage imageWithData:nZdOMsDniRmFV];
	MQtZMMVNnHyIxtVS = [UIImage imageNamed:@"nKPXQyKYvMACPFJHeeNTVJrncOrbWaSsyQFoOIAALMLeeNjUYmXHIzQgBIhGLprhdrNbuBWuDsBnnIvgbYeciWFnkMPEnVNDBDCMsohkktcwAoXdioVkiAiMMfSwtGZK"];
	return MQtZMMVNnHyIxtVS;
}

- (nonnull NSDictionary *)PttyWJLGStY :(nonnull NSArray *)XKfFOyIaMfRI :(nonnull NSString *)JlZVaMwtlTRIewGOj :(nonnull NSArray *)riqoMHSBEmEFK {
	NSDictionary *VhUHoAJYcykxdIvBnG = @{
		@"qoHwptClGswanCSQf": @"UOnwwoROGtodjyHxLcKdVtGnRmzUzlQudMBlUjGkTBmHiuxqPpWuMFRIphHMqKiBCJZZiHGstfQNMihJGCHVsKCIaMmjUnZapDMGhqRoQgWeJriyMVmtGBcizgDrXBmuxhNWv",
		@"VbaPVqExMsM": @"AtWYnlxJBMsVxeNatmRwkAYBqEbtqOamuNAEVyFIPexziZQuLQgDhZJDivSWLdjPmxjnKOvdTMpOfREAlGFvptgbmKIwHSKCZMuKvHNQRVbtbpcKcPVTFj",
		@"hMAMAwKYQq": @"lZPhCRVQatUatYBbwQzcdtnRVrAjHMTrFRPTIWhfiQAMnZMsnjZyYCIqxDVUflxVGdLiLYEppBUWDcWsxhLkiJbkWhQFzpWQCNkAWchLHmYEEsvGhhffQW",
		@"CgzMkixzJbHTXtof": @"nQMprMHVjivbXsfjtQZMiRsWPSOmOUlGZErmCCgZHctjkKWEkDkWgPpSiCLCfKTqMiZqzPrgDOXmQAsKeQZuGOnGXomeAnaEzeDRkzVYfMKggOswMPyjFapdXi",
		@"FEbqlGLbuyPSlt": @"ClfKSxRwwESTWcprgSItwhYRGSPufINFIomENEsMEfmHoNuuNCxWGNsTdAcSdKYLRvKNcUTJbZTvLkGqhZrCuLOcixhVvTqwARgtzAjowGRbbHPIVXPkApooPDseCbCzCfbHtWXuaHYhJ",
		@"awQjdbJzquqAC": @"DrGnxsBtxjBHKXNWUoiMlBlXdKFAUGguqkKmILIMnkXuhnMgQZvODykNdfGqHNgkzFIJdFjgMZHzXslmSUBFAfrCMlKRNcbWQFqeexFCkYfZxWDfJEUoA",
		@"OxHonRZIeZhj": @"gZDgrnMQRMEACPjSFovREiFlOYrSiAbLTeAGXdfXuYVtDYPmKekbibAOxKGswMIJUoiQYaiHgghhIgkAakmHJdJPwDkxKqqBcLWbJSAaRVktyMXpMUbpUAEqWIjHDcHkTCLO",
		@"MjwQtooqkQppZP": @"ukBlLwwdDpzJCmJQFToKEvkbePUvmlnTRstyFRvKImzQwcaJwebruVECSXUOeHJdoXeoYhyOPISoDkdnoejNdSMXfMKgSEsGGlxZeQIbfTGkGuHxkEMZcVZDTnQHKE",
		@"INPXewLkgbXNSlkyLy": @"zxidWodvObUhBKYoOQmGLepTpKAVxfiddiHLPPGQesyFDvBeyrPjbygTeBJVlaqaBaiHyYZxuIcZhLWfZBpZuZkmRcRnipGgoznWnat",
		@"IhLBYhWhHUthGGtS": @"aiCCWQZKPLIFQaZquYsnmMKeHXQPXTuwsSOEZlLuOjMpwBcdGTEuOnTqBUoAQlBRMzdlMXwqPqtfHPixBaFRxUuFPbHXuNeUQgoZfyteyJHccPjKKJusgDjmUSnXwXFdOKAHEybccYsviOiO",
		@"SRMFLkLovpCxhmWmw": @"xbNzzJljaRmSZtljudEGkoXmjUrwPWEhbjlXkfjNBIvLkOpzFAxBxZAsLgNWGQqXwvMtGXSYKNchRSmHzSPtWLtKLpRhiZtBmxkFIVoPaOHEwwxZpHfUkbAFEQkddkNRyxYKlKszdMKeLAKMWZI",
		@"PrsrKgYRIj": @"jPUzgldXneEFlhoiAWQmzlPngdfdALjvYksnslyVLOgGxcuaYbiDvWhmNccecSCcWPRuKzyLpevnAQfMlqJeRxzePbjXieseIuCAttCBULzOEVLIdOMrckhOSlNNVAUgMwclzIJq",
		@"FrDFjbHzuXoeE": @"EYxLbdjmQRUtqbHKXnrRRxBMfQsKjbaHmeuErJqBMKtnxAjPqYQfZdVMVRpezszWnwoyhBZLPMzWrLMQiIqnrFWihNmLdxkITdVVPRaayyfiEWaaHDJrfTlklqXTKAUARlSqRMjYONqcRAL",
		@"ZDxOPSmmKKVtRgZZF": @"FWoXmSxsSlUcsgYTNVDjkvQIdRjIzvjXsTBUWRbupoLYSlAnBBvijCaUTAmvnNfCbdoPbHEMjNIejCfrQwkMDVGTMBkHMCAFuQwlI",
		@"zaLTkzYRvfY": @"KvCewFQfUNyRwXAkSdGKrwLTDskrarsAAAKMsdERXLeAHQGlyvpflJxsVflFLKZmubrhteVqQgEfATBEJRGYogkklfMXDeTndTRDEhDvUvxyN",
		@"TLcCdQbnaCc": @"xmrdMukyfwEBCZDhEQuLYLBDrrWZzfDUummsVmWUZUpTFTYeTTmCHTleMUsJdaxTSvBSXshjdfjzTMttOqnKZRngiBhvBbBtflsPHUZLgbzlrzmJyDlsXGsAbQ",
		@"HTqyxyTzDsr": @"CAiOzymXsiBSOHCMRikUTffiWUczxPMRYDperXRUpQdzhHgiKLbHsFMOVpvBxLVknHUMWDzcEzbyifjCtwkiRhPwQJEaWgbgXDzpoMsxkryCrrBgVwkGYOyzXyYdprsqipKiQjKpHLTDuSXd",
		@"xTJrfXgwbhegy": @"ahZTHkUKlTVhZfuOFfXaHWRWGJFvlqWwvIQsxthKcOWtmHFprIXRERPDXDbPDRljpTWFMeaDgXHmaOnBzMUzXmyZzCwaiSiRdstgHDHXsaePmXLmr",
		@"GAjKAEctHxAbtIuJ": @"wUEinxBGjDUXDmNehFYVXMwlpGQcygSKoqGjcpRBfcQUkkJpzpwYidxSBwjFnhEJzKfmFJLWiwarREkGSiXOvIbCTeSRwlLDPPSA",
	};
	return VhUHoAJYcykxdIvBnG;
}

- (nonnull NSData *)gmfwRntuLanh :(nonnull NSDictionary *)WslHCpZLWQVQ {
	NSData *wtsWMJKnRbVARXsNG = [@"iKjJlyUSmyusUUcjaNpOSbeJnZElJTrdhncVCczOTHSlJfSOqIwcKQOfgBEmlICmklSpodThBHXETYnKPRvyLZkStdGpmbFaznHQxqrKuFHYJpiidpNjFgzdWeXFBuKiqwddGWoaTv" dataUsingEncoding:NSUTF8StringEncoding];
	return wtsWMJKnRbVARXsNG;
}

+ (nonnull NSArray *)lgJfDhgvGcosR :(nonnull NSArray *)tVIdwOpVPzPuk {
	NSArray *SarMvFyFCMYUTKtUC = @[
		@"XycWmELoJBYOhPunxsPGVbnppoTQASfcbucJITocBBXsOPlBEwJVXDyKgdGacOSnVOXFDxOVjusfJfqMxRIbvtTIUptVbeZbUzfAZxHlELI",
		@"EDBSwSefjumHiVUgUjwBKnxWTweqnYZxfQIibPGDVEqCVFiFvWyTBwQkmJkzXMwLIoaNSvEEsyJtiUKNLwoRyHPwPEFFmKGJOcKZyGtIlhJAUwVBJmiKAUhUxhoKOkePlcqnCJsJt",
		@"LblQFaAMYnsKGNiRwHYuvSRDBBPrJKwDXlxhwScwLBqXQrQwRJMqPBfLFvnBlKEvBdNwSsLKeTUdkPADjDmzMJXhBMCpcWChfXNRvQgUfAVJIEFSNQATDFWFPjDITXWwsBmFPJ",
		@"nJDSoijLDbCNlsXbJJMEHsjSxPjdDQqyqazuKDtJbGFpSMXggGPzigWRtgwojWRtdHTIGMGmzSnkwXOrnbjFTrLYCaDtoNBndLfGkTJQyFUzkMIvIVIVFBlXGXmnRdu",
		@"URASCnPUrimGciiOpRYhSwwIvUWsNabhkXRYVpBmPJbtznhCAKrvElqjNPqgpEJsXzhVpbIjGWOLeXWvmSOHefXyaGkswoXYJhImXVJJooOPOj",
		@"CLkDfzLGhmoearMjQJrNjGdhCFhEhKhXPQvFZWQaLRfLoTezOPtZcejASmbhuOlpwmWGkLDvHGjDjnasmbsGaDYzXWLJSRomNovmifmTZCrFp",
		@"vwsgKKXxMPdFRYIGVBCHIjGgtVasFWSDJYwZyHAXnQxHOYuaysQFjIOlCTUTYrmbyKfWHOrUsaTOaRExueUHQvjJpIClLNqiLjKRxQrAtVYsmwnPI",
		@"SoZjkZAjsZVomlCDDLkEJurXBfMNzbRiVxdtzTqjkoOiTTuivwAAbMHwRmOeCrcdIUKggZJiDRoLbzpSkQwrHRMXNRrYsqAzUGEhkFqR",
		@"gskodRogGZRIrapEGagePdKoWzphxiWvarcFdsOYOEEZhhaGcQJLIRIBDpRQKZWbUsGJppdqSrUfeMkkUENIHrQDbzIRKkGMqbDVAuVJpUP",
		@"AzsjkUDQCfcLvzlQLMwvjrAQQdFiPNKxgApasbLKZqRAfRpwPXgGAwgaUkgMgBLWZiDANlntxLBTOgxmCKvxqTAEmbyvgFjrKkIoQCdUvahpFOWfXRRdcTipoYoCdNLDiV",
		@"KihfmtCoWtFGrgxOYQyyPuZJkuWcoiFfMyAWgAQpGPcVQgCLiNbFZVZEvLpJwKcbazCboUgkXemPruSlJBBPoAEkDCEgmhSUtmTHIpwukniMADqpLEeU",
		@"DmzDDLvFJJiEmfZZcSyYFOfyMJrGIvOnFyoGUswQjoVfAGPOClCgjieqhBupTCpSBjmbvHaOazqiKYnzJzKkVzIbCOXUCoqDjxwrZvxBZrzKmJCfdlN",
		@"CDUpbtEkJTdciYZHPHYWlPqscxuhNMKdZanoQNcOVJSBEWPpKNfGNkMVFPSVEUPXSCzqlWMNCSLrVlRBoCyqoPaAsFcPaZbyNZLhCLrPsuOqAMIcMQsYDXUDIYlfrttTJGDleWsmtjfcjQSrPbr",
		@"OfRbxdsynGhwYwPWsJYxsZSflqOYUHwQwtAihAewojRFIUpOZsRqDmWJLoZrmpgJGytmRtetragBUEtHVWDMqrxowFXsRMEKwqjfaKOACSgdnzUmdSzPNgLogMfXoqU",
		@"cnlccaHWgsyQBFduGOkBlJLLyNZEFYUgFAzsnSoMUTeqxxrJvRGpSZZpyJcLGxcNssSzoYgQRbxbvvsXxMuWnUrpJDxYYzZtuiTgIiBsRazLdopDYmuDmwoksTSjbCyoliaXwNDmZPbqQNei",
		@"FJJYNbBeYGbxYtwIsgvKACANxLfZOqlAfVgQHpYGLYiZbiOnbDVqAtIskLZrhbVFKXcOrtxJLbdjvMOtObmINkQFRVaSMUwPQVrGCVJtTMqAzEcOHHRcH",
		@"lrveLIXNxBwOyTdbzCpQfHjRyezyDvBQelwllRBfLELFFlYvprmRVVPWDySnpPIkCskXINOWUMycyUXAwapEwDFCoChfrkgzOyZvWkzILjEhFQJlLtLdqCKLssTmyXHDmXs",
		@"AoqAkneFrMYeepEIxpBCjbfaAUshgeZFdOmihlIZTHttsFGQVxLTrboHYmfYBFkqzlqflIPzZucDwWmyRQRuNFjnudJmXXFLageQJ",
	];
	return SarMvFyFCMYUTKtUC;
}

- (nonnull NSArray *)GkNayaenKsB :(nonnull NSData *)jkjLZhwUXTDquPeuv :(nonnull NSDictionary *)gOqFHeknFhYIk {
	NSArray *hoXvpOEzYepTF = @[
		@"HphjXuHjdCFSkJoGKSFlGieBLNVgCThsakYxSiLsivWvMxVecWzSDsPBNvBwaEsjNlLFEkLdXCBwGoAbJhxskFbfAuEYvfCefNcdDYopCqmkg",
		@"lzxxhZTzDiwxeRHgeercWQNdlXhBxwAsdAoUjrcBeuyvxmZhiHLQoLJVMMrMeLAJzRjjsVUrUvSIjUNioHUtbOIbdBCBpPrRbSPTqVwxWRIueqeSSebTP",
		@"WXfNnKCWOHcLJufYvsQGFuhgFbVyWwWqkwXxiZJWGZEiOMRMQbRuoMLyBDebahjCnoMbNWFyyBwvLgTcSrthYvXYogKAordKLFYcqSaRIusgiGWS",
		@"aGsvhmKnlxABxPZCSnnkZCkcFcNxCXcjglAqiNmtissjkwgKxsxfSSEsdOzhWRrytqOgJuWOLjYpGDeuljakZmJTMHygzKyeBbNriQDgtvmDKqPhUyOWPbOfZmXo",
		@"RfLfVOeroYadNYzMmNATQtUcsBZxtXkNujxOHvOXuAWpFRqWoXVtieYqLitPIUpaXoyLJkJsQkoLCCzOYwKpmZHfzwVgEnsnIrzfTOKeOerpauDNKwSyNwAgyffBfMqOLV",
		@"hlEuaTcAzBEJUsSheEBLJwdkKackABaEFmIvkmlOlvMxIGNDkzXKMothoCljcudEOXxlUQPtnVpRfeDAVMDMEjjajSImwwzdvVFSqDtfGLZfiQntkBDuPkPirfTespaJVCMbsBaWVtEwykQqMuh",
		@"SQEhGeKqvrkZJuflKvPAjZwucNMkKKfSfOZgJBGqiiMbqUcjsWrnoTKgHeHsZrPRMdLrpZzhwidENlvTryMjRcFUNrBlTgZOrPcogvUWEqjXiXnYJprKGwtjHlweuIsazCgiFxpYspoDN",
		@"CndEhvcMwzcyVgDUjTNZpgpfrDfrlCUZTlIjKvjCDZpcPpefOkWLlacQNPbGzxFducZqLsRryJWcIkcaDAkqVfTNmXbxvDANgwOqXoADBvhWtBIfxsuFXOQDHBAVn",
		@"aYnBXdPiFRTTYbuaECuyFcOnfPZntTneWDyLjNfihUyvIVyCKzQUcyBTxwgBKrrnlQuWBhuiJvJDItKcavvpRiBNwKDtIxCrCiVIBMgOzMHUVYYeEuIN",
		@"tluDmtycSWuznCKUoPCZEchnoNlVhZwhvbmrcyiMLAofvFWfAuaYuVzPsiZjUWvnrBZYItrYYqlefuffgKkJtYVhaCdfSkxtalMyPAtMfBdeKnDumClGdKBfSRaejLeafRW",
		@"TkgyZQlwPWVYITNvPzNHyFdjoeBoNYcYytpOUljaDFNRqygMBxhSRpaykBrWmmzxFaRyrzbOGWxyhVKiFPAMCvnskkswiFdPPJVtpJnFaHITxfXcTQ",
	];
	return hoXvpOEzYepTF;
}

- (nonnull UIImage *)XTjrdJgXDBnibckKzw :(nonnull NSString *)uWoXaqKCOVhYhQls {
	NSData *sdXagBpxkDls = [@"xptepifAOVxsCHfJoUqBlfAmDGyVqVvzzOUMhiJaDxyTgYasmecUvxTgpOCcdlmzjALSwtqAFQeHNJXwOCyYzNCZcGiDMmygbNZR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NAqhoMyywuZvhy = [UIImage imageWithData:sdXagBpxkDls];
	NAqhoMyywuZvhy = [UIImage imageNamed:@"TPLnERWokVybReWlicOCASWLHwwPWmwoyOghAfyKSMihuaaEjsbyknoxyEEcdHFfgwRcNblIRrTmzzWcxKRNvgOqmynofEvhhiphW"];
	return NAqhoMyywuZvhy;
}

- (nonnull NSData *)KkOaiRzvNd :(nonnull NSData *)lDzuaBdJzsZPVlLsN :(nonnull NSData *)FpMUjwGJJBPbV :(nonnull UIImage *)YkBeLqIrLIuHqe {
	NSData *RQGngdazrNsfIBRyWr = [@"QIcqsRpXruuSmlpeatTYrbfLeZvPoJkbmVcbSUmfysjHLbEymYRaGudeofMejLXsERDBFtEbrvgerjfJPmePyXRqMvyZrmAIPMoGwgWYqVtBGbRLhxDvakVSNNptPRdvYuAhIg" dataUsingEncoding:NSUTF8StringEncoding];
	return RQGngdazrNsfIBRyWr;
}

+ (nonnull UIImage *)vPEvxlnkYPQpddGiCI :(nonnull UIImage *)DaPqzsuSBetCjMs {
	NSData *XFwuGQruTl = [@"IbvHPFCVpKkUaFlqsrYFKldCEFyFuciGXSNFEQijntLXQySPVTccLiwZzxgFTmZgwClxMwQRTtdusyQLbwzGhnbRnDFoqyKdUtiRerFWuafrMHSrreMBTHhkScwIGMxhMy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qJkZVxbPQSMc = [UIImage imageWithData:XFwuGQruTl];
	qJkZVxbPQSMc = [UIImage imageNamed:@"xGbOvyiYzTNYrvkJasSKqLUayEUHOshJMsxGizgWljpeIVKACwXCknnyiIyhqaQbCUEykQyfmWHaFWdOfdihZHNlUcZNeKXZkCxBwI"];
	return qJkZVxbPQSMc;
}

- (nonnull NSArray *)rVCrcFsOcFJBrI :(nonnull NSArray *)qwobJPoKhWR :(nonnull UIImage *)JvkmmshucEfRc {
	NSArray *WscQCgAanxXPAau = @[
		@"bKlwuvlpqSUKMRxYyZfDKbqaHkPVOsCmfOzoWuewRDazAkzrpCpaqUbyJjIEeAeQLXkBiwmXQzkmUpyQCFrSDSrWrRZLVRWMCdvk",
		@"rRpxXBOYaueBWlUcWwiCdhgVOzunHIKYrMOLrIFClVExEVhQGtMXaOkTqHqAOxZpsVgugOzwAPhqtUKjelfgpkrVOJlRZkwLMhCfuZbpMDvBiKxBhquUkUpMCmAmasmEOiuNUnT",
		@"BohUsaenbFhtOWzoNTrHljZtykBdwTFUzvwLeJERDqDOlqzgVKAlsvriRHsYpzpNwAYVFOsqdgbYbrVZvUsEFZwtmTnCkbmwLVHSzAgaPokgIyImRUAHUhORiRMTCULMznbqMhJHxPeWSD",
		@"VIRVQakIrihLRCvsLoDcbEsBfnSQnijlfftdOuPapQqEBhekiikutiIVANvYrNLGTudnhvdmICJEdgNQInQhgFSfyKydraQtgZiaNtSOsrTdYNHYjqkkmYDtOZPBputmxAZuRuRqYDRCejFeB",
		@"xHzzweGDUdFJHEBeJWjLVQuxaJCZCNhFdRGaagEMlAqHqMvXOprNtyaAvRgBHtyatcUcQbBIOYOpQdnJxEmTByHiyfbvqwpytOWgAW",
		@"LPrhhLPckiCFpmEKihSHCIINCuAddsOPyzyhSvIXyIcFUEysEAgHFySvrWXUzbCTCdtIcgtwBGguvaHgUXRPWdwQzPVomoLgdKEjemRH",
		@"XgnaJzqyhxEEsXHPbtwhjkBlqKtaurtBFCXWlparHeCZgzBGritIyqGJJwIrrnxjOVikFlqAfpFLSRCoKJOJNxKCaJXilwlDIhnQKcHIJfr",
		@"CgSqykfQeelrOltUJLsAyMUrwHTqoYaIhudvDfntfYyVykTtMUWsHNMoUzLvTvqmgwTDuNRZlbXDqNjlfTxbtPtqqggIijhICWCPTufLDwJvEKfwMNWfJGfGOcwkaCjYPWtYzCGQDaZo",
		@"KswMVqZpsnTkkIipvCVlDzEeuSOnHfltdhletYVdPZoobyrxRgErcsPDmxwHWroTzoEAmXRwDyketBuNKqUZqpGhzGyMhpXgCMuDGKLnZDjhjVryjHUcoDekdmtLCYkyfqrIXIhHXma",
		@"dYwAfLUfZrUlvpvFUDktMfYVZecByYftzWRqswuczNXbXdxfscxeHbgDxqkIhkJdVLVSpAmUlIcPwGxobkgXxhaHGnnpQCUXkLXHiCmdZLqtqpbJxvYhGHsWrnQTROwHNTxs",
		@"lQDntBfChfQwPgYVOswvVRodRUVrdKgxZtmYROPClPePGEpCWKbFECiLNltSbkeXYyIOAdBMDGYeYGvvYLDrCPPExSURngWoQVaJjGwSPPYySqhJgwXlDbHUEUAmJrgmNIGNYWYMfHuhVrDOa",
		@"IhOcTiDbpQhWIVPvNENumibvCzBnOLUYRCibvpRiBhJMgYtCnxmTspGjtxQAQPlBmYeqpiGktDBaZuIwKWslEJzyXQVnUdEsYYPfsVRZhUmyBwPuGXxhmAHTSwUYAWqVycqJzuIFvwK",
		@"uFftAUkiqNsLoWFWfskCNltMGZwtvttgayJYaopspfhluZDPlzNyQMhAspfwZezOhlvCveRboaZTEWoostbMtcMxFYuOjaPPVUJWsnhudKkuqOjfbhDJpJfRAnUiXbgtHmRIEN",
		@"CFInMYDppjEqRqPpGNhWcAMZDWgbiXxdrAEdqbsdHRWvFBXbQbTOuwOREVEMIJsCtANiTXYOSiUnegSLerDvgAzyFPdvNxQpEZptrXBicAIXvfHF",
		@"sEfwCKAJPKeeEpYbwXjYcqsjIMNBAzsLaQsNIDgryWINfrDaZLipiCTefUwqeiaxPeBJyZSKyktacxgxCIDUoWJovNuOVAhTpwktbtxXoDGrThtCAUmDGDgKVZLLwWvhMjYxTFOypdxP",
		@"hobZgafKKSqIEUzMPQoiXtTIpWVNlqewLBuiARoaAinuXJDsAazRaaGfTJVjqCUpOHzhOCauZaIiEziEVbxxPHfaWQpzbrpJVRvvBjnJOiApyxJoAnXfSmh",
		@"WIHIyleQOMPhjfluDKCeDdyzcZDwMxQrfMrCIjkyYvHwFmfPUgvCbNyuaRBtVNHKVwSQYlublyymxvkFroPzQBIxnUwrqpMFArmHPdLdsCjQQKTzhJMmllJCNuAxDwUMOEsTTggwTsLgnKCQ",
		@"XGJFCbUzfgBiexHiEkmwOKievuAeQuCyLThVddQBlWuHjzZazCdzptWvwYGpBlauOouzQMaQDKmUqkjNUfgxiqcKIntWPHUDRhjKerjDKSuKjAeswRinDRilFBaQXKeJvOIZxUjgjhuTkkoFVLNjn",
		@"UGvrrYuJVrWYFYEpgqcpyopTQanPxgKOjmZgFATfwYnkELZPeSpvNDturtZiCniatUkwyqMwXyCQxIsDJyundSyoaSrcLjuxECfKqhpFNblWSppshnzxPCFYO",
	];
	return WscQCgAanxXPAau;
}

- (nonnull NSArray *)ppYOcZHNpp :(nonnull NSData *)AzwHGaWREMzPu :(nonnull NSData *)aLcbLsptvuDBcMl {
	NSArray *ByPCOYxedXDGeQ = @[
		@"OguFaVvfjKhISOFsrVCAXQimUIEanOxiWQvVdznaNIthrLcEsnASsIOfWdkSQeNHiPhvAhmQeuKaaLdGSbWsIOPQTVxaeSQhayZJbcfwPKyrwPMnlvScZTSRRAjVvUIapjAtzG",
		@"HZcdHXzMCPiKBWvgIKjidhBqNtAnXTfOgVXKgGhfWbhKixxTpJrFLeVtYByzrxKEfnondrSyHdiKWioYGTUcnGJtYTbejemUJRZysqRFVtawqpBpXwJlIzrKkwcqcDnoClODNlqCsgA",
		@"iKrztrwSxKhrllNucgLnVWgwrhrMsvocnEttnYUjToyyQyIwycaRqvqKevsizUAaWKKKXJaoBqudsghxlKfZkrOBoQUPbRWbPJUCmIRZpMvvWonXaYsNjbOaAXkPfhJJQntWzzMNkGMx",
		@"lKoOTelMkjBEnHSMVmTFkxcvcFaLStRCfRMzkDfCUthOukZHertPbSVGloWyZuhmBAfqevQYufVzmlTMlLBafWshuWApQPMUDdRvV",
		@"SlNMjpoPhYnBGRfQmXecfPSkuFbkmymUrHzAtugTTxFczfrRyFbcUtLIuLeBLoEhXeIZXIfRLxVYTUdvOVrzjfRwGoRFFPaTCGtfPYfMazGyNfTkavzJobGyHtpioBiDecUenzhgLWKUfmUnUMfQH",
		@"zvoCShAgwbFKpIHKjLxJsBSgePbFsFBJDKuVgWQtBHwYSMNCSZfTwCSbtypreFsTlVcuCGagXwaAmlbSGnrXnyIDMyPFNcVzujezy",
		@"sMyHTarlxIoXqsJmVlfaZIGmuEvhlBPaKyRILaSQviHKxOXpOzNVQunFDZjwvXBjiYXtvJUBGFpkEyNHzLSnzsfrGJZlXTlXvCKFLvOgzsDA",
		@"PngfSCZAczYrnovCnussWJSjbDvgvOoVxMBCaZEJgIAzicpimqpMAFGuSVwnWmeHKgrOAXTtSNYniBHNrjxmeSWjIuQTgDhKYAQTBElZvmzfBpOVoQsHuFMasr",
		@"ClUaxVIIXjhncgvwndnWpYGLoZbJEqDVlwtKCOUvNmFcXfyhzPaLHnEnviuftQqTPnCalQWAxOgChXuWqfeCMGCviWBUbKLNnCAIFgEG",
		@"zYeYJsHPYbWCJsMtfkHLZhBsmYnSQrPwaHaqkTlMeVcRQWjARdabtyJbeNTOcaDCXEePTVBGeoFfPXbpstxzZlrhoxzAovrzbhbCrQaFhtkIEpADgvnrgZwqUqVhGuQbj",
		@"pOJNiKBoXlGCkeoAaTEOHHZerJUwCVRDVqKItWaekOYtcbFuMPdpCceVCTyJTHWzJvbUsWeeCqMbjQzwnasMTCElzLVMwrXgaVymlVCnqLOgziCiuaNcDqWYcwKh",
		@"rWfTsxdCTgsqPgyYPaVHGgBhEAtiQuTirjXEdtxGNXgKsyMYZwdSLElYSJOkkqYyNZNBeKLLDcbfdeMVUkJPhBheVnpsgPRmtYpuFnhDQWsElHVmEKeV",
		@"zgDFGsdOUWWtokmiadEiaOAlexnjeCpgPTxbadbBUwDJoAlzsMNRanNUgaVBXJXCBaUKKNqLNPbmTTFEythWyzokWxeOJrWLdfFtDCMmVsgdcSetpRpptiJAcXdBbyGODTWwJTATjLkLMT",
	];
	return ByPCOYxedXDGeQ;
}

+ (nonnull NSArray *)scTwYlwBAzBvGhHtAK :(nonnull NSDictionary *)pMQpOlOETiEjVh {
	NSArray *PeutjGwVyzM = @[
		@"tKMdOPSxjuisLWcBAkREojVedFDgjDhuhAMsGlKbMDXFYpoUldOEGuQwTMRDZENMEGnRCGsWUcuvposUCcAqwEsBscgmBGwtOnyEVQaQIfPKFILEQqqrrjRncZdDsVKdnctT",
		@"ZKRpVxGQkvDyzLdEQNRAnmUGeaJwbwvnPRRUbGuBSffjJvxyXuBctpTbVtygGUmDCcKiWLOhUGRQGlNGbvgDRVfnIgHYDPffhMsRjsqYqYAXSETH",
		@"bEpQvwZXKJRTagqgQAgJGMSlrzjwKffabhsqURjeHINzODOitDkPslJDQwDqIPeIGgsHiDoTpwVxttSQkZxoVqYEYRlfwJqcoABjhXUCQ",
		@"nTAzkLoBVHYuyXTumntsSgOGyDZzNslyohoMuubErHexbvObbnbSYAtIqXGkbudHVBWpJCRVWhpdVjpGvlSUBCDgdxltvLURlKJMhAAogHbjdFLNjmWfMSXnkApPlHTOdRSG",
		@"egYJMlbJvZHjOkokxGppFdmqKQjzuuNhkuBJttzYWGkyJgvVFxJzsochFhzDffVKWbwxjCnSyKMvpFsynQDcCxRUSUoQzrQtKgfPuQypAjxkGaROYTbQsLjKZLBNJmegIlizyFxbGmrv",
		@"NVqxxWlPiGSfqfBJLafXdzDxRODIAKsOujLyAFAgiHNuKUzhyLfcPccvLdDXeIVtSmKnqPZVRXwqUeYnmKYwmHgshatkRVGSECZdtPNUwehrl",
		@"oBfBAAvPveLwKusklvjsijhKuwFKPPXpcRzsgWFvpXlqahXmnFmJLtntUfxPyHwhZNcqInRYJJrxtlrRRoKbFnMXRjPJMdUgEQtNfQuirjKVONFBnUlkSLYSpCqFwOJtZlDBrf",
		@"EJmmBGJMUOyGxRztWrzFcYDmPhtzLnNjFsQdJiLOFqlIrdmQvwKGuCnJRuiNfZMZozGyxubtBMIFCIotorlsoFxrdbpPglrATdmuGygfzXnKNF",
		@"JKZQNmFuhDaDBIlsYOtlpfxNWWWgBAagagZNqXbHKitPGMDydqCAyraeSAuNQoGSjctdhLFOkmorfcXdugZpQoBUdTxuOUaELdEeVyymxPjQnVQauJBFTLntXBOjWArDdieoLqYaFI",
		@"PMWBfEGOXxNRBudMUsmaBJYkLYfoYKPuKJslfpbSmoDmcnHgkifoXOvCidDFchZXafSzcvZHaBSwkLGehgGpSDzTjGgUYaFqXzfHicnVHFwNrUCeEkWBSmDLroPlEiLxoLKV",
		@"AvVWDMfojRsiCYzrxLBxqqZEMXZvKbdDURmYAnGySzJZEyhwTmetYdryTZxxqvOruhGnvmKaSzwzyHYYrOXbgMQjjOusgHatrSDRqMZOOMuyNYjvBeYBmxVFKrv",
		@"qEWWWfruotwfTlowdylTEgggoJNkdTUpjIgcZDTCIDkgMJNqbcBGNPYDiAfurQVnjrydQzQXFTYBhqMycgDrGfJPZQYxeeKyHrfpXisEWhSmXrHEEYtmhjCxrEfOjeBeeNOxurWVLrbCRdaYZvpp",
		@"FetdseiAmuxtFIIgKiTLFaRAGITKHpPCBxQgXKUpuDlHApVCiJrgWlZajFPksXyFylKcXnxySWSsWBPjhBpzQkCTwiThQAAVGVEUtsMpdxVJLPuYlQL",
		@"wjSUWlGuViEKdHlIPgTLuKzWnoPJESAVACGHHIwCODLqwgwUnRQCosZLowGJzbeZsPOgpSqFmudGVhgNBrndbsGkeHkvlCEkEsApcyjrnpyaJEvKZduSNYXYdwcqWWGYMmzGXGk",
		@"yorLalFnOrQVgmUPfLvQtjTCrArnjSlsYjeFNxzwpVjhsAJHDHqNqGQIZBVpSIaJVzwfFZkjFSKkCJFApFvNeRDxrKyLAXkStZinoEEGxdj",
		@"yNJTQFNJkPRFGMRmYOLKSjJmqArDBRdQENoRaHOYrNMVSwOzlgEKRxHfBAEPfPQIWybRGYTbBwqtQNNbYfqJOXdxAOWHyVZBlpaLyEiKSRfCDCoZRTMFqalRYeHlkhnQLUwENbiVADZa",
		@"MJHbOIsBVJOiIrtRPiSVnkfLfhbJNmWflUMEWoNhgCEkIZrrwZNKNqOZkmUbOWQEYaMLiyJoLTRpPJXeQAhcfrZpqCFbLTDjKHkXgDphIfTJh",
	];
	return PeutjGwVyzM;
}

+ (nonnull UIImage *)ZWlOxHJFEyssaxr :(nonnull NSString *)FWpfPkQMdrndExjnCPA :(nonnull NSDictionary *)ySTiGSJAnnMsSt :(nonnull NSString *)ExrDcSsbdxjBoZA {
	NSData *AhyziFlCZmN = [@"ZmEIFEhoROiksbzvHmiuOxgeUoGDxukikzNcnajLGpDwfjOEtVocfjdEOcXrcguXzvQTkCoKxmEDqvYSUFxQuIEAdlbHZKzkNgEOLzWDsvGSwEixtePLeqZoUTGT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XKferOFsQQwsWLGCFQd = [UIImage imageWithData:AhyziFlCZmN];
	XKferOFsQQwsWLGCFQd = [UIImage imageNamed:@"MuJzEMBhBzTywafYLnDJIMdPivBTQUJMpnfPwdrUzPZfogidgOwVDHCLSUlFvnkRcuGHOzCSUjJkhLLMyGIXrSnPFMWqFlGtQjbqMchEwweaKPgQqfUISUkyMq"];
	return XKferOFsQQwsWLGCFQd;
}

+ (nonnull NSData *)gitrgkhLrVAvkEEwXOv :(nonnull NSDictionary *)KeNEiyECXGEw :(nonnull NSData *)uFQpNuXyCw :(nonnull NSString *)OANHWFjLSNAraDkB {
	NSData *RExcrGELqIsvzJvVbl = [@"TWHYgiyZQPAyCeUzuhFqeTvWkyIsLgzFQUaWXycwYXRzrAbhWOSoEKiUwyDhxClBicSxBueFBMnTEdvzzWwULZMsxMcbBdgWoCKlWCmTNqAFmtvLbAPMxgiPXhBYrCkHthTmeQOjtmHCi" dataUsingEncoding:NSUTF8StringEncoding];
	return RExcrGELqIsvzJvVbl;
}

- (nonnull NSString *)eNMzdagsataAEhYX :(nonnull NSString *)cmcbqNPMtcYIoUsmOh :(nonnull NSDictionary *)sAZDSmNuvN :(nonnull NSArray *)JWQqKZjtwHKJOgkwC {
	NSString *sRpVpCIpDlmGLhWaa = @"vEJzZwjIAycmIaCzLoZUILsYYGikzwBDDnFFkBPqSdhhMFbcQjqYOWGXaLlTUPimWInKAzaFSjGaqQOMZWrkHeVsMzkDRiptRbamGrQlQBzUId";
	return sRpVpCIpDlmGLhWaa;
}

- (nonnull NSArray *)qMsVaJovpIxizt :(nonnull NSDictionary *)nNdVxMWuPwabCV :(nonnull NSData *)iJyjRvakwWBFpo {
	NSArray *APRDzqJhBKSPIPIAef = @[
		@"yAutSdqKyfCbOuHEuBSBmJkHnCEBEauKaBzcvxdHukXqhVDVBAQlirLiVNlXIyoaWVfVFHxTcmyQCYpypydUfPXzNgfkmaSuJfhusldUIRlHMxbBcPWtQEjnSDLazaVmtOidGuMNBoevFP",
		@"UWVoawTGenFERKDRqqAbmCgGUoLqOIHKbSSBzDlKWgBdatDssBfrwKPrSXCdRctGAaGubMgOzFWpViDayydGyiLLYZgXuXvOfqjKAkQjLjytzycImKnqVhqcLPePSBPSOergAIX",
		@"XpBDkHHScmtNhASpnUznLleMFNYInPyllIFGyUzwKavMIyCCxhQEEESrtVNdtsnQYLxfWnQsDNzxsiWZRRrteVYrgSiFsISPLeVWxAlWtfGPdmDTi",
		@"QWWCVQNoUlvQmCfHERQAwKFGIRlONjrILdEMicsxXwhJQAPEXQrPXrmyBgsFoOaJShDKShEDOSuvWkQyxkfWhdtKwcAmdHnWjxKbKmcqFWAdwWHpXltaFOBJJRogNxjnrOXGemb",
		@"ILCWuHxsVYBWIZhbESEBOkUfUriBZEdLyAsYGRKdWADKGoyYOyVqugwRxYAaqFdmtVdrIzPEzsIZYjpbUDcnVkUYGDJOUkYqSsfcOgUvfMVvgLXijeuwYnZZxXmHojF",
		@"vGpYBDwlQANyuEMznCjllLfLebdKRCVKyJDFOZmnewcDoJZMRvsCARMHzexLdlQzgYMkXDsSjYvYJmetTYozNgdfvzTbtCCfkVzJoZUXfjggmlxfTfhXabFSFxrzQWbjxOboKOIhWpXJNoPnu",
		@"uGyYpBBvPZUdLavGuTQZLiAHVrlMEEffzzVIktSTlmrRroksAbdaahOGDYJQYHxXNYhNJutLlKnJwmtmvqjlFvnyAxxMdszBmyClDnzDFLHnfhXJRlCEAiBCnxAra",
		@"LGtCSlhRmhiXQKeHaRtppGmJjlRmdnEqikFdbpxfBDRYZkDLnNjYdmGjQDxnCoIBNTzQdMqEhWVGvQcwUvJklUWWTeYSbOUZiabdHgXnsGsEwpvVdHmIaBFn",
		@"SBlikXJYkUwUEFSHbmMeUbhAusTKerDkEZqZbUYaslFQqopjmeymzWSWpYKbdHLbAlUYfwPHGErePJzeezVLSrZaRaWkJLNhwOyKUpGJIHnxHFXByfjUvUVHyHkrjTO",
		@"cSgPuePhIluSoqLGALcRsOlhHeBiCdnhrccTtLkFNqWTSvFCekqtqYzOLOiHKLBXJZBhikxXbFtSoXsfVeXMjPMYgXbCKqisuWRuoWAPRgRrsaWXKdVOiXSUHPhTagImMjWnGVLjX",
		@"FKYCujGbZrCrntdxzlWOmUxXyYxFkktaSscEFCPPmZHXKBwHecBzLuVgkwCdjLSZueYjlElkcvPJtAVDlrylUqEyXNTemFJagXxjzoVkomAHoWpyhgjYrEnUjsrbJyhcfAEgMYtdPYYXgLhxUPWau",
		@"zjWAOrsBUhXgFivVQGLcqydLjdKQemjPLXpFVirbZuZUtsdbBQVlEYxzETYLiwOclOWWqoYdhWDLSEfxzvTkXqDnvmPUuLIgpiDeXipKSyRbzsifSkOxMXfkiqlPJNnXyjxXbgjmAFkFDDDEBctZD",
	];
	return APRDzqJhBKSPIPIAef;
}

- (nonnull NSString *)ypWBYvYFZteB :(nonnull NSData *)dbZkWaugFhSuTSoH :(nonnull UIImage *)PfQTFAejKJn :(nonnull NSArray *)JdtYHJQIdGUGxm {
	NSString *iKFgjuZriJRCWcdisNL = @"NzEAqOZlLANyaNsfIamrhIQiCyYFVjFJPAnvGPGMIIASwWToVQgGyiolZKgGIlOXeJitqZijQxkUvNHZrxNrQUyedBLDinQAITLkelIcaiYfw";
	return iKFgjuZriJRCWcdisNL;
}

- (nonnull UIImage *)VrjGPgvrXmuX :(nonnull NSData *)VkgDJkgKpO :(nonnull UIImage *)LhGnjAEBYLwfhPcypw :(nonnull UIImage *)usnFYxeNMNpKLqJfsLh {
	NSData *cLseksAcGbG = [@"KqhZdZvqqHGjEPePksuHhBSeXofiistBUqVmdlyyRIEkYdpQidLUoiDnSBTnOpCDclHgBIrDbSNVFjbQVgLupWwmKwruRjszzpVh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sYCcsewohJNZ = [UIImage imageWithData:cLseksAcGbG];
	sYCcsewohJNZ = [UIImage imageNamed:@"abrmithHNkWPcPCmvQHWFwCbWWdNigIBiVtQHKHmOEKVzvVvjLJJDgKzmwOOAlvsuYYMWmtlZqCAcTedgpcCJReJTpXfgUmjoPWDsarUVixdmOwxhi"];
	return sYCcsewohJNZ;
}

- (nonnull NSArray *)ggcjBaiFqtzmSAz :(nonnull NSString *)drfXKYzIKPU :(nonnull NSString *)ZuAnQULuTCreLJk :(nonnull NSDictionary *)FZQvZlPELfBRueeldvw {
	NSArray *cUvsijXVvxKRt = @[
		@"rzTogxnjEuoJfFACHQeUzkucpxEZYUrCEyConWxTJCKfrFNGcUWuxhlrapzBGUOCOcVXPSUrCgHKrtjaFZNSnCmVBGgTZDuyISZzjpwQBXocbBSMg",
		@"gaGsjcKPUKKHQCtjsZKrwiscUkisKCPSSCMaBBGWONXeIYvwPIfeEGQIHkVAvvFfcOxyOygobcfxMXIeRgOpHnaPPXzXhYsSmStlKmzvgJbufdayCokPFbjAYRBSMhFUREQEx",
		@"bSbIThKcoFGFzfamhhnpsQFRQoKlLoqBpOQfCUDiYHjvPjrSkMQuULQPXolaGmzOWvFWOGDDomDrxggWTvdOzSvyYnpCiQXPgrLbCFSnaOLi",
		@"uMNGmFbgAmxtTKtkUQGhjRgXpgvfwEHwuRkWBnnpHEsVrCUINnALhyiFOocnVeGqVwZyzeApVNUKlYLzLVdxnrQBSKJQJhIJXeoHqFDUsnHGIKIpzsiAIgwSrp",
		@"FWMAVyONurExSUvdPiqtdFiSZmmdWpFyWXOwjOYoPHinTDfDDWGZlMaXdTSDQyCYNvHFIGFWZKrAheEiggIQjHTEenICFAfcIKUaptFkkZGKyRWXeFSMs",
		@"wvIIqFvrEjEaHobemghFdyXKFDLnIMqjChjPfsasnKDJuBtXWCWfTDWVklytOzxZvxiPsOXDiNQetuLVtTjqyLHRdXSbbwqqnmFdoMSSILKJUhurIKFJhLaUqncyQz",
		@"MViwjyhjsdTcFRLuSgEQWqadxagAAjRdsAcuTjkThbLzTkMWUjYqhBtRrFbMjWWVIorXBdttFqByWkhyWflpXswmUagrFoTVXkoSjDvlKhfgAYZDPduratkbHgAIrXnPSucDCptDmPptLwTpOeTKL",
		@"VhggUVuDHWockOSWTjuExowGJtXvBTlftdvtyczcRrflrJgEjEvkNhxFbNOpEVycFDVRuYwzZaJStfSHXcRuakVpPUssAiDMNsARhzFNuAlESSFYWCmUQfFXKuy",
		@"XLwwOzZjxCQosZiCAaqStovvuKCUHhJCLjccWrXtPblsnjutilwEFfxIdshGRnQrKvuwTebXaZxVpmPjlixyhCilkYJFtjbZjqhNAYuyWPVUzhQHrtTwwyqFcJFNlnutKNzlwPFYbHCokDm",
		@"JmCybEJIyljFjHbBdtXgwHGOGlAIDWuHzVCdzfVCweCGBPkGZmzveVRQmcqdyPdiUKrRQVyZstNVGeRyXcTwxcHVWTkCAVAjegDvfn",
		@"AkJzSGyxNSASlQHmYEenQRmvyHcdFfLADNooJEAxqPUOglnHlBqvolHZXlGrcBRNvSbAiMwYZhMQwtfWLHXlSLNHgqhpZRuhiLtIcDWuZlyzhpDjRkDMmXLjvHrplurBqXpPEmBZR",
		@"yUkiFgiwouNYbEKUmgPfWquhKAuChCfWZFmPTbMxXhrDNuSwfnaRfEXRGtZRjWNvrxyRCXJCgZRFACeGPovCDZbQmTqOtOaHYWoRxvwpDJBlOMgQVHvEoyDGhvKiyZANCrWxtvojeyFyXJYJ",
		@"CwgWcEnEPcoxgBaqFwSOkOduoPNEHrHHeBGFwkLQmNPIZLFTaXyjhTFQXwipmsSIMcZwaJEZcOkqSEJgvRVyTsoRdAeScqHGoKlD",
	];
	return cUvsijXVvxKRt;
}

- (nonnull NSString *)ErLxcKGduXJVnIr :(nonnull NSString *)QoQFwCEmQFVzxGuVr :(nonnull NSString *)WCyaRefWLSwmwmIet {
	NSString *pblZUQgCtwACzp = @"oiFKYKafJZgAXmoTeEUDFXdYmEtAtCpZsaGzKsrRYkZgOxcHVNVIOtkuqmwmoNpNBnRtyzbKvWzuLVdPXjWxAUtfzeTKdzbzIwlYpPZSbfGmJrcGaohXvblpOWlaZZtYTQxzNZ";
	return pblZUQgCtwACzp;
}

+ (nonnull NSDictionary *)cVEChKzRqHWwZgtuT :(nonnull NSDictionary *)DLDKyDXWMhZAq :(nonnull NSString *)aCfkWoUowoY {
	NSDictionary *YRseaTvuFcFSfnLJ = @{
		@"vyseYeCAfQOUJHvR": @"CYLHEMXKzdUuCYDmTeIHPofoHrxQYgODylcgavhUxSQTyJjmxadMERTgYarRMSBIhKzlLgaDfqZoUaQhNMPLfSNboZpLPhPiTNFMlsHwzrPtgvwfiWXoUDjDUgvJOQsrvSqdZVXwOQnntgYGlXKv",
		@"eDKzEHNIuBA": @"QiDewltvEYIlvQmrZiXtHzputuSppQfbHpbUmsHGhXGbJRcgRDJmnxTrYXgnqtEXmTAjWfPXMqYEsdUFBlNsMAlbqdjhxnnxYBBlexINxsRrhJ",
		@"aLbdlQWmkeVKZc": @"JOMNjLPGOqvELBTSUIGXQyTpHyqCAgGNDowDTbcpDnmbylrsJInSzsrDLaguGvERpjThrsJybnXdQBNgMzJPzfAaKmxZnOSHgHTUudSRFizxbXONXHVnKVSoCtia",
		@"ggOuFrPwELcZtAut": @"oATkuFMdAqWMlncGvMySSUaMmtmAdIIVLKWFdDMBdldszGNuEIraRrQAPVBRZGzniaOgBcgESSeNsBvImjpDFWBcnaTbKyCsFTbRfWveHHULfqhcOEbOsoWBTKETWeiFawlNdtY",
		@"WNZSWgyJytbFY": @"XlMtyHGUzdxukeEVPovOuQnnJspWDAGobGquhXhxUGvtPIVTxyxbWdOYxWtXskoZozlekNdlzreTDhnhWTfjJoWsilCQcZbSjbzfQSONSsqjqzBtqSxgsN",
		@"lrHcKDKAgaDQPQKNRSh": @"IDQyAxrmtRfDsqDdmJVNXGryPYwwjTskXGhaBGWGcMkVHlrhZarYlqZATkRLaGygbWdfANuVPlbWLUTPvRWclihEdGfOjRZnzGIGwArRYFggMISkDGrbXgwEQTKRXNnMIVqCSZZ",
		@"DvEIVnEaqcSGzJC": @"lQJqpWFwEqbqQBWxJkoAzmbPgkWICeUkDRNKYoRjOItCZUqShmUqrrXlKFAeRkCxXsaDKItYaaFNatqzQeaPOUqmsbGXQdEjQVmYQiOVDtiRdCrZixCmFdSrrM",
		@"ayVGBaCaUxVaO": @"NcqbMmOGExIEnEUIlWcZqGzUkIkUuNPCtaBToOByNMDGGCEwcQkmnDFBfFuVshqxVHQKatLukVyVihGDmjCzOBZFmUxNkWLktpdDbpXGrHifxt",
		@"tdmXGigOGIMjdikrCE": @"zxbLwywDICyDptYHLohBDZjNVIzRImHXdGlMXeHGVZSqnjFWDFQKEtqITSIsQgtMOTQyVmHfEquxNBudPMoNVHLNodQdhExuZjoGavjzHZHUAIVUWjDGBHahUiHlEsyVEdiqoGLfNtYfTsqsIZVgn",
		@"RDdidRudXeLwOK": @"VzCcKzzyjpLOFNBHDCGweacvDYYowwWcHMrFVWQJOuqoCpJEVidyVvFglgPoDaXSTVCdnsiaGIkpArlJLnyxZLIjmTDLwTjngTCMvoPQbMDfrjiIZagXClOtAP",
		@"MNeMiUhdrlwrnFW": @"arUvlbJaQGcfHPoldHbXTJcwOzrwazqChzSuNoIXcBILehlDlWNYhjOtvedKmasErwmGpdwRzaOaDIkFSnspgBuUTOelaTvBBdCBWNtNtXqAsUozanMaxuDtYGMkybtYsiPbibmC",
		@"GLnAfMxemjiUoGmnEgV": @"LzCqSrqLizdOpCHMAPqmIjftdjgVGFQArwHzeAmApUiQXSBxZLYmwJsClKKkwMXbfZnjDVDirjNuRlPizsMSAbijyaJjrShIHsSzFjTZXZwZrKYZfRusaPdmLbrem",
		@"BkKJXfmFlUMTClcc": @"LyQzaQgMSxuzGTezAYxuaxTJLBrIMkcgssgcStbsSqPFvnsRCrsDiJnwMJbPFBaJpxFzjWdrlJpDTvSmvsssdYxEtJLZwbRbimYZzzez",
		@"FaOQTvESzUVbB": @"EXOAYNMEAbGEJLIKxccORvzLyJyUnXdMkRjCrmbgHWJvTFucgMnzQGfBHtBSyotzZnrrDTYJHhUfomtLDRQwmxcIoOCcIHbFDdJjkNLZzQGMieUOdpHUuTpzaxuuaafxLgMZQy",
	};
	return YRseaTvuFcFSfnLJ;
}

+ (nonnull NSString *)WNtjNvRLTZJxo :(nonnull NSData *)zBnNkxROXqEghRAm :(nonnull UIImage *)kuzWzBGXFTKWInbW :(nonnull NSArray *)aKloyOHCbydQZihCiOb {
	NSString *bxISWKbmMMRoiOR = @"OfziALMtdvaLOuipFQobFxwRboweqJbyGqaZgvlNrdmJCvUHSaieIvszpPHXhdTlFhPkgBMhJaniaAFpNomYkmUCurMMdXhHHdoZbmItIZ";
	return bxISWKbmMMRoiOR;
}

- (nonnull NSString *)abtSXgrkOmyvIX :(nonnull NSString *)viPPqvHCdYeZ :(nonnull NSArray *)aYbjBZngyePabi {
	NSString *FFDHDVghfK = @"KZpAAboMTiWOWXLPBlAObItkxeKDmlLpTwwdmdORppGkzuSpYEEFAlzaVuEWNdIUqYpBnlljsCJPDsbhBAXvdyYDWtWbivULfFqAgVaOovfsEjLLZs";
	return FFDHDVghfK;
}

+ (nonnull NSArray *)YGYoRUYLIxLFBLmyu :(nonnull NSDictionary *)wNAAOpEpjdYV :(nonnull NSDictionary *)QLehfKVxBUl {
	NSArray *pneNsmWFMObroHokHf = @[
		@"ezzXKQfNIFFlNzsOXenHYknEAhdNrABQFBaEjUDaoKdnXtqMGhzHxcvjfTWHiuJxwCqnNXXXiZQxeJVcyCejXEBmWnOJXRLaHXLAgaTYnWLJLChEqBqCwuUrhDGpjglGtIGPkdoxdzR",
		@"sWqrgChecivSJWJXicuetlbknPmsDRprAFWoHrrwswTwvnlGcHtQnQvENxPhjFQMEQMbgEWbhAVymVddQISdEojgyqEWpXpnBzCcHkLlOymtKtNLrkBBOjNVxXXmsvFwrGIC",
		@"dcRgDyLxWEpdjDLSTfVuAxUjZrBRsKjgwNKzOGEWLcnyaWIWdtHKmjrEUhtCYRBlXxTnxPCKBxqfyzZSgpHoACrClAjXbQscjNOwiNWWR",
		@"LbRZqfGzxgWBhivLbxidXDxEwYuSfZarnFciURpupTwkzGVORJyaLDYlqxQCwJAzGQrxbDjSwSsbvtxRYbIxXQwVPUJfNNvbsUYtgbgbUICfbVAyYRZCQSZtR",
		@"hBBlINfpSerQSlGXRCNktXLwvfXWjzGJqKWZmtmnFwwMejZviYzIvVRTdgYzwsjwSmYHKYQlcQeZwSlSYvYtQZLVRZRJKLJBtUfRZKaCejshTv",
		@"WNcFqhSidvopwcgSEWVkyyRLRDyYKZqTuEHoOJtuIRBSPbxsZJeClxopizeNiUcjJssEctRwSVLLycOIdKhPTRnEKikURenANirluNkLODYQimwrfwAsCxCERSiRPjR",
		@"IkIjXFUvTdFtOdlaXjHBmoXrRHPsggXRhUCPLavBQMtjArUuTQHibiZdCUcwkHpsyvCWwKrmDWnQcYBTBzgJnZfmcBoIbfZkwYKDbeZGaqIWOjRYcIuIGqwxDebct",
		@"HIsWvZRiwKSTnFgjRqCIXnJckByledBTynvrMOaxaATmDdSwqcUxzmPOXIIzhudAynSiFnSdDIakVshHPaurJDNRVVIMUIiFedLnbfBlNzUocOtSbstfcrhUADuBymuwcdDoTbnJobiGKqOZs",
		@"kRaZzhvwvjfGLfvYqHfOShjxkpHjPYsmyZoOUZyNVpVfKQpweTAhafecnERihOjaOkxWsgMrhIiauWKsJaEHJMTwUTSDWQhZwfNLiBZpAl",
		@"ymIhGHrTwmKsXEIwDHADFKfGvHsTlggEZcbzheIssJOgqIPgiBzbvtXeMCAPYOSHCtBZlAotfaLvYKoobwFzZuXWQflLCLOcmWsHsRQqAITuNfWkeWViWzDHSmzqwAhjDsCVO",
		@"rezXHyIfoTEYZHrrqGCoTAFITVIavUXGmgBIqZCuMarOSlSaGhVtWUjsWWuPyfqyaWHSKnaizNNUyBpLqUtdZkMZVdteyrmxJedgpBFoNeDOxAVOHJCvVyHmVdTtvS",
		@"cbBhrJoJWKSbbmQXQtAmZOiwCeNRhadxeSegFWxJCihfcfIqIcnllTKiFfhFtmiZjxzIjOqEvAUeLYphhmhoyBvqKKKhdRWAtCfQiAkBDwrzHGcxapjgLvsKdDWhRbggtqpFOzdirvopbsJz",
		@"JdqBYLkNoPNtHgJISlppAqNJtZqmONTIHubXhjLqCWjHxHziqEIMhGUQeWJACxTfJPRwfbNvnJwdRCVzhTPqDiIvOglYSRvcrnaYhYjxpspvYqrYzrzZBWMsmZGfqrSGVOcUbRVTzbZVm",
		@"qxAhbwHELQhJIkUabpakaESwnhdTaqLQReVoJmyWvwqAyIdwEPbzLwzIXPpfUtanXcbMDeYLTtKENdHDndVRDTxKKkpOLvIcWRVIxTNRTOhqkAuXaJGiXSrQWIkQpSJlejXFSnZFbN",
		@"HAuUSFAYnPUeczvuGcfhSmyosqYEIROGrTfgERJRSlcJSoAQQAKOtLZtiddALSbBdBgWITuYHnGOSyOoXEMxTaSfpnIhGcwSmuGQqwPmNoHxaFnJgNzdcaeqNtRSFvTFRRsrtShzfeCdgSAtK",
		@"qZHCBdtrukZGtFSYrHbiYDADfwHNWVkFhHCmgkpBIJRiKxiADlSQrUECsaoGhRMAOWRkDUGGlXbireUYixtSpJpttnknKaRYNxBRpbSkIEYfXJJNfqM",
		@"PZIVzyBPdnqwOCqBMkAowNgKAfTUdkNlWJjlOkfqekUsfAbBDRjOdLJFBPEEBOuuhfifayRyfSOJqdVXBzpbHrQaGdEPGrnDcJFurGcVxomhVojyMRNnvzLqwpXZ",
		@"eJvFGDmxzcAoQYdAJniMzlCPeyBCtYWpGGfkyvnXgvIdraceTSEkecvXansAIcKUlNJJOKcRluwBaIUhTeDYCsLOjLjjUOoZuYHatOgEnVeYyNoDkOCthhDkWBiYZxGnWvXrhiGeiXSfxWg",
		@"SqqWVAGGvnYtYeJsCLLKtWiCrXTRPuJrNsVAIWyxJfZtUAVipPQYcdLokkGwgcfUiLtaRMGmKvbFdxZqbIlyjaaNWADJrrgdXaGNTxqGjiUjbodaVfjPGJFWAnTIJzlgMDLclaTIZrAJoe",
	];
	return pneNsmWFMObroHokHf;
}

- (void)recordTouchDragExit
{
    if (self.recordTouchDragExitAction) {
        self.recordTouchDragExitAction(self);
    }
}

@end
