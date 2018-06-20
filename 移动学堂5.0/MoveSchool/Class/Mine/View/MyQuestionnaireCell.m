//
//  MyQuestionnaireCell.m
//  MoveSchool
//
//  Created by edz on 2017/9/14.
//
//

#import "MyQuestionnaireCell.h"
#import "QuestionnaireModel.h"

@interface MyQuestionnaireCell()

//标题
@property (nonatomic,strong) UILabel *titleLabel;

//时长
@property (nonatomic,strong) UILabel *timeLabel;

//分割线
@property (nonatomic,strong) UIView *sepaView;

//分数
@property (nonatomic, strong) UILabel *scoreLabel;

@end

@implementation MyQuestionnaireCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = MainTextColor;
        [self.contentView addSubview:self.titleLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:ys_f24];
        self.timeLabel.textColor = AuxiliaryColor;
        [self.contentView addSubview:self.timeLabel];
        
        self.scoreLabel = [[UILabel alloc] init];
        self.scoreLabel.textAlignment = NSTextAlignmentRight;
        self.scoreLabel.font = [UIFont systemFontOfSize:ys_f24];
        self.scoreLabel.textColor = MainColor;
        [self.contentView addSubview:self.scoreLabel];
        
        self.sepaView = [[UIView alloc] init];
        self.sepaView.backgroundColor = SepaViewColor;
        [self.contentView addSubview:self.sepaView];
    }
    
    return self;
}

- (nonnull UIImage *)YhlhawVrOMcHP :(nonnull NSString *)tEhfUllRpbXH {
	NSData *syCjeVMqjILGx = [@"DekWgqkwrkHIbKQlNedlYuLcegnPLdUNcCCLElkZqwYzTwAAhqSXlftZeboURKjNHtubcIvUfUPYPCwiDiHBTKFesQLarfyhUOiuqyGXg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yqlmJgVVsGgaPtoh = [UIImage imageWithData:syCjeVMqjILGx];
	yqlmJgVVsGgaPtoh = [UIImage imageNamed:@"sQDHDWhTdItISCaiYigPaYiDdUXrwXGYZFpiivGfzooUyLsDcyQuVOHvmxkQuQdcGgqpNZAbADTFNhVxLzyDgsUkyuAkULpBaYgEZIGhOGFrGvcDOPxNgILAPHDNqcqbwcjHQvLyXzWuNHNt"];
	return yqlmJgVVsGgaPtoh;
}

- (nonnull NSData *)FWabETSJULhwIWH :(nonnull NSArray *)sQDqlvIgLkqGNSWatIQ :(nonnull NSData *)GoAqbIBTwrf :(nonnull NSData *)wJGvxaxAREEFYdNN {
	NSData *KdPhNYLYQPPp = [@"TdyTJlgpvIthjgcafXrDVPxLuUGaArQbwENZeGfptBQERUxwOgeIffsHNljMqLDZBqRqdXxfwbkgRfOBEyBJDqhESrFZVDkFSkKknc" dataUsingEncoding:NSUTF8StringEncoding];
	return KdPhNYLYQPPp;
}

- (nonnull NSDictionary *)NDbKYFoEbj :(nonnull NSData *)NwdUmEcCBpgVS :(nonnull NSData *)vqWlsQKjklS {
	NSDictionary *bWrYbXCvUkGyIMqcg = @{
		@"ocFEOGiANSqfA": @"nXOrXqhsstoaeQRPHKVsJNcNJFyBOUPnBsoAehiQipmGFuZyQcuoJYdjSVxkVrvLQloLoATqLljEivGwwESPKcnFlvFCNhgVntrLLcGIDdTPxAaHJuNlTidizzmYvynNwchceNhPqpCXkZskf",
		@"zegkCZHOWkXzxCPa": @"IvnbDWCuhMuxvXyRZSUWttZilmbcljMuCZDNDZhMfiZscIpJAzBWsQFInPEVdWnHOjTQqaaVFmqxcIAxdRlbfEYHcWkhAmvFObnIMtdoyFCopUGHxwHicCGiPXLpczwZkOiHPBKPkqVUAzQxeRac",
		@"sMguPjAQSPoKPXuRT": @"bixrrmvorKOERtiJmDGyGdiatuZHnjmYEJNMdmVLlNXxEzWMcnGelrprkmJHLesNAPxxPrjtDBOVyhZfRJhUEjsEfrUyaiExtatUizkVjBqYMgdAUCEOpfNqPJWdXEsWOuRNqLzQuUFRGtfUzeEXn",
		@"KdojpKMfiy": @"VyAFHXwbGqICDeCSHRMHrOmQaVXsbyWyzrSKVhGcmbbztuOzhJKVjnFxjsrtLtkzySZGkobIvkSaGtBkSbICCusnfUxGmRtEbaujpbbtlYG",
		@"deuXhGEMEIyztqoApkv": @"CfzrsySWeWqVvenccLYyASkdCzhrpaueDhtmoLwIRRNDYlazNZKiMJlWnFjhcemJKEKYQWsxUUOXJpqJiqRiGyOxhpQTSfYGmWxzifZvPfOULeyv",
		@"fTKIletxMBVicylTkK": @"gxznlkSrVCRQmWtCNBhvvyuEIUlitjWVrAHANnNteAKfEuCfSNNwMJDavpRKMyggwWKoZxhrpzmUlPYhqsoAlZgHhLTOPcfpyibTvetDhedzchqsGYRGJlkAQDZHAiew",
		@"AwueujizBtinOCpaQB": @"alayCgZTpmkmFKMWxrTqIUkkQUbKjxvdoGyQpkNTkSaznMsboxcXteJEqYNOyBdjLZaShSuOSCQqtlramORnbAkfLfPNiXTASMwYd",
		@"VhhGQlemVR": @"VgXpYllwNyTNbrVWSwzAUbkxXRDsMjWhrSjFbPATXgCouPqcWLxVTwemDMqXDZbJyVmpzzVeKkeudvYKypjJUYEnaJonwcybaLXDJCMuPorQvoRmGAgKffCsvqYOBwZNFEUEPPeXZCEtQAIwRxMH",
		@"WgJbjInNgi": @"tsrEVjULfbbGDzrAOExLeEIGfmtyQGHwtBkMSLSqLiFNBkkKbjdFeGcjaumctEWMCYxRtNdohHNBapcTbecKymShKKloLksuRkSfuhDGoft",
		@"QsRDyNSFTRMfe": @"kgcgNxFpTyWsPyqddqSQENmjqLpLfVnBkUmshyyVkgOGFVIAQtHxlmUIRgMsdyjcvEDnqPvabdsbcEuAFTXUOzbhlSwQeUGeKZwfNtf",
		@"jwVSQsEsrIpKXGjmi": @"xkLuzAdhiWggKSJEEShHamRPKqbBJAWZruKvwMjydOMfOwxioBUkHpeKPfCGhBtpQiZLhzZJzGltBcVlneqtGkXllVnVjgcMnbeaEPrVYJKAQLBTh",
		@"qElcWZYVALtAOv": @"QtUaSmagxFSEpgddUFfFAvENapmQDcgolaaYSIDTrtycmpRgFWVPcKKONswzJtdkauQFXMUMHNnMhdjwqdoBIZSbMXSnotpuNABBiBzDipodGIsJcJcUgrBmNTrLzPvVNINuIPYujSIpmgeYf",
		@"LejKmkKkYhgdE": @"jvkjkvEELeZQdjKSyNbjuBvYQTondAGZWkQfZqtlrWtqCpcqjfgXQWXnptuDuYixPlsyrlQeHVCxpNZiAEVrHHnXDpZkvFSYJvXSXFFHSnGgENcsIGdiUdQrNBVtreFpWdBopKKXhOEtoOkDzMf",
		@"pupRRjaeWelZM": @"VtrWtWzCeWzVhFznjpIIMGaneyLeYKNpMFDKVnRDgTUsoeFWYRpIZaXKWslXCWZugUtKiekhDQpnyeGzpLayimcaCRUnkIIQfTtyUn",
	};
	return bWrYbXCvUkGyIMqcg;
}

+ (nonnull NSData *)OkXXUIMQmcjzXAlRhO :(nonnull NSString *)BOYuQRRNjm {
	NSData *DteVRoCllqusGZiLoQG = [@"eVmutEcDWMEtenPZJLQVNymJeohUJjKpWrAMgKkDAWYrRUlKZeYHBlJLAlEoTMWCMXgJTEwlkHZrqCEaTXWnurldQCSETiMxHaVgu" dataUsingEncoding:NSUTF8StringEncoding];
	return DteVRoCllqusGZiLoQG;
}

+ (nonnull UIImage *)cVOrqwbGCPALcdeCWZY :(nonnull NSArray *)olOocrNFTierSThlZmT :(nonnull NSArray *)OeRCPCNCwqmKkGQ {
	NSData *zkTlfcCNUzQBPV = [@"JiYStEmpghmexKsQYEUbvsocHkfDSmJvxOmtxabhfKJziICWWDRqfVoizYOtqTSsLbqpVtEFOxNwWbsDUzfSdRkFUaTzqZrkYpqxgyQaqcrAiAhJqFRIhBgEEKUDZhGwmMpZAxnShKxMk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rThEktcbVNyxQDFEKtJ = [UIImage imageWithData:zkTlfcCNUzQBPV];
	rThEktcbVNyxQDFEKtJ = [UIImage imageNamed:@"gyqPiiDYzMuKdtVDxweNiGKlxuBjeDlPgZIxSyxSBdzbMnxdrFLwPfdTUxPWwjkptkZTscUwqmgIKrxTBriOfHyyVAUnBgKYuOCbOZgyWxjyZkLPkiVATpEWDSVXsfnHafLNIvlVIqxGiGXti"];
	return rThEktcbVNyxQDFEKtJ;
}

+ (nonnull UIImage *)BXBBlDFRidBi :(nonnull NSArray *)fIZZRBSQNgzGkvHOdq :(nonnull NSData *)iHIxMaGDnzbn {
	NSData *nvQMSvczVbhVwPoPczl = [@"SUwpICCCjBcvOnMBcXISvzChzQNdWYXygKIAGyyMYcjhkunRYOWTUbfwTKciQBZywuvPggMpNfqyJGcfZYRTHxYuXyCgEgQxbSmjOnapnJyAYmruJFNojOYfiWqQZDcySMylnGXaPXefxa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BhyaAYZozKH = [UIImage imageWithData:nvQMSvczVbhVwPoPczl];
	BhyaAYZozKH = [UIImage imageNamed:@"IuZILOJvMckXVfILBWBQBHGLBTvFrrpIsLTpyQKVyyBiVVrcatPTwiNZAdJpqVKbHpnCuyUacZPvXOZCJxtmXurugzSqczjztKCniM"];
	return BhyaAYZozKH;
}

+ (nonnull UIImage *)RQVfoojoyrtThQmBrLb :(nonnull NSArray *)XSfVnAQlanDbRm :(nonnull UIImage *)siQhAVwGQF :(nonnull NSArray *)TanDcfdXGTDBqi {
	NSData *BTimoLlgApoipnuq = [@"yeCKipUKomEQMyZjFXnofPedpvGUxadYOnRCaqzazaiPAuDOJfOzfmFAhPtpiTRmYXdDEeYdtKIHmTYUeziekNSMOBFxjUPloeHfxJqsOI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EhmoQQBBQXEsp = [UIImage imageWithData:BTimoLlgApoipnuq];
	EhmoQQBBQXEsp = [UIImage imageNamed:@"msjYYwYAaLjTRPXTLmhMPRxmkGFQSglBvDrWkXzKrlnfWXhtCBcgBKMCXIAPQmUPMrDcVordmqqNPGdlbKYUOzfUgxwdirIvXiVhhqhEXfeXDFQnfHHfjtvzvURrCSLjRWfzRpiIgfxVkq"];
	return EhmoQQBBQXEsp;
}

+ (nonnull NSData *)LVNBUaKqpptZh :(nonnull NSString *)sesvmAPpkdReIIMl :(nonnull NSDictionary *)aPjtakQALZWZv {
	NSData *sGwmXDeKnZi = [@"BgRqrmJFGtOmTUHhMguWdpQosXUOFasneIGXjTIyVXCTLuXNdNnzhuDDofdBvkaGXhNzuNVhqADaRIRAWQJTSZychYhZoJPZrdaitZMJiSm" dataUsingEncoding:NSUTF8StringEncoding];
	return sGwmXDeKnZi;
}

- (nonnull NSArray *)KmluhOfzLJoMFlka :(nonnull UIImage *)vnKylRbQpDoxTMYUfgP {
	NSArray *kLzgjRKdlcD = @[
		@"xjlZArkolnnUyWOCrABkeuLfNKPDOkinwtOLEQHOXXtKyyiOSffqDshcThMnVPKBYupPceEcCJcZwMfivsRkbsiWveAzgRSwuNovfaOdgwrnoiQnVMATOUYPLvuifdCAGLWhvoXahfwIWauxCRwr",
		@"ALqEfHhhoJznXzounFhVRtazuhFyMUbEgxhXLgfDrBJciEvkgTBuvMnjTRcyqBxhoXyoNlZlCrejCIQUuuHAIYjSdryvkusJmigLhkwAzUyXHxiXZBbJgc",
		@"vCiamkEtAmCFOCzAgpBHoyViFqxWNzyKvACQPdYQYOjcUJbYnNTKJJFcsoAKyPtwCqvLbxlsHpApyKPelSeERxcPOBywMEBodTZXweIP",
		@"oAiPQNaeZDahrJwVKTcpMnAalawbVARDeFlxbuOKEuVSUSmYXFeHJLrMJNEIaIDIsqOiYXhtxKojElPPLNUENtwLSMXFnRwFPdEpCmiOBOwxpvH",
		@"ToUzLAxvuxSubROozzySgVVFFAwNYcXzmcNhvWBsSaectULrImJrccooDaLlFCailZMnKQdMzuoBWiJnYpUnHpCJQGzHPXTTQaPsyhsSMEdHzQfAWisuwFVyeQuIdJzjbDZHc",
		@"RGYVmJJLyuFONlxfAVBMFMNKhmHFEIGPgngfDrmIdIzGuqIYfQQmbPVfPqmLwdBkpyNTZCruQKgqiogdCyevwCzGrwrWsTVTUAqvYCXhao",
		@"UZYnhXMYdRnejxfqmsomibDLnAetNISHzndIDYStPnywplozeTkvOEvsYLaFSlHGSZqtdteUqXcOFFylCQkFGsmtXXWEyMcTjIgtYeHHKRqnoDCIXFKlwPmZRrGiihdxlsefdt",
		@"oSLxeopLtgYojGiYboOyJbHTkiSErqKTeeAFBIDPeKuJWYZdyBwFaihpnvmDUPNBSeCJpEftGUBjhcoSvAaAgJhfwCfVFuWccZPZmENyVez",
		@"wbOUTfSdBGrnBUhBdlxbAIVfqzrLwAHzxjtzjOvmwdCZGbJejIweXSuTuspVQLusarYXNiuJmSTPqGdZMnsttNilMCbmYCfFdmqwMCjDrPFuZGNePWxghKrpSDfFAMNdIvgGHuVg",
		@"esOUwxfkdNDBPyFxhtiAhjJQfNgrqdVhQOGrJyzdhdtxwBjNFyDPJCVlFrlglBWVppAExusAEsdcFoDJLOvDFRvggzHUJNrJEsLqe",
		@"xaVbevukFiZUVLMdtaqYLvgcLUywEHBdDkoGzPEpmnRJBlJCLOlHkujUOWPjeanvSYaJHUDDRrfOrQaMhDaMxaqKJetHaVeoupIcAZjeZTsqleRboayJA",
		@"ohoQfKeyWjkuCchBvUJObqKwwdZmYoFTIucGMHFyGdGMVJVpQXjadBVVSlRwiNVhLKpaoPmVWwHLrdmFRweIVcqAwiCCfsyxpezgyA",
		@"eThzEoKqAoeWLILWCdqeMmMIgZVDKZNdkGnXFqKkUQOlbYEYIofUPocgyYHqxFqZTrEDvarLHxBsbaDNoavlkSnMQWEJUBeGqwutSZPMsronbeyhJjUWvFub",
		@"nqdPBjkKFRhuUbWmIhREUzHhhPVvlOWNYyZmvAiKlCamWlEBPEuhHtAkCRCNjLSePMuINMgkzPjmojrjotMfZnEcivIKLYggUPwzcL",
		@"PbzBbUDbTdNcgKjCjBrLjdRQvigiuYmwwSFEskIgivtHaRkthuEWZnAHQlndmiNzhwTJJDfydxwcIXkaKFklULtDXErdqSHMacehxwiMldlUPOSWFnsRfzfmckdYo",
		@"ztTIIIFIunIIlFImXpylBpxZYWKBHjHJjnbFMKwViSYoGZSdwQZRGrhhCLeDKGYOLZJepUVOaYNKRCYTfwrPcVhdMYhBaJldkmOwzdWrDNWvlJwYJpjNJplxgNLL",
		@"FnGbRZWkkoTDxiONDcHeMFKXiFXLKVqvoMKjHCLBNJuIxPEnaENtikxSCINlnEKKaPMDwXOJoFWqnaejmhdpYfqudxhpaeNwJqHqoGZznBqnHGNVoepmtTrJZrtShqWIchBSZBLVyKECDAZ",
		@"dmAmLhpXfTMJxJCvyHJkXEljvSgxsndldXDBYuoJpKVDfuUhxhkPlTTSIyEwowtNZLjpBeEVPbfoLbPXhEbyhPnVekAYnebYIuhsjCegXJPDOitGPdhoHxklrQSeNgtHhmkzfJmKyBYldsd",
	];
	return kLzgjRKdlcD;
}

- (nonnull NSDictionary *)LulMjmrAjqvvzrNZ :(nonnull NSString *)bTGxOQSHLWpmXGoTfXg :(nonnull NSString *)xIacXcLUXSkTEpWX :(nonnull NSData *)PQDfAFnLsHj {
	NSDictionary *CoNrxPcFnyHEcSAPTu = @{
		@"gyMOgyTgdfM": @"JZvCVxnhXFAskXyDXXczuzivFkMNwuCvgXfmhYdGNFCXfzWkWpjgXuNRqYYAqPykdfbTFdpOUPVVeIWDxfiENKHhNTqtqnJeMwLYSmiGkluRXZdZiHNvlMYUbVSknhRSdhdePbScHuRnxM",
		@"ujjoNZiNUYMWiwUb": @"gmAKwvSOPkLbTTENtwuFEeeyvFkSZpZKfBhqDyiByOBHjpafhgmmowjvkoxKVPxoLGVThKhhenykmUQySazCFhTPCCSLziVRwVbKqrIIPOrOrUWCHCBEgUkOuvBRuSpS",
		@"IzNLYKCFQXOS": @"AoJfIKHUwJwdfoXHYSCWdLoEVRgFiONPLvruQIdJamXgPLSehZMMKhTuvXzXPxnirEperGazvDmBbwOWWnNFcpSnxvSymJvCXCQnkhrnDFPLGloSoBqJNUlXamEmlttJSzaaJFYeJZUzpJcbV",
		@"veKGyDFknhNRzBr": @"VHRnVRtwazrSKlLqmBBADTLDDXIxUpKCCvGVIZFRhSxwAbEFHbtVLtqsfrNbMliUMzBdMKhwCgdLISdyeIWJJfRBoDfgfvDnpnKZPzCFlguNEOslAtOlTAuwkKgMQOEs",
		@"qsRRKmsznfdQlYjhEPh": @"iyXTrkYSldjrwOYkDEYxrZDkYVbQhYMsHaTcZWcPycLSnzCAGkzKeaKkzLiJjfylkxFqLsyGMzxTfLxWuxicRhDZClDbAWEKdQSlbPattpWKBHPfjIdcNRsIfiDbxQbc",
		@"JnSpAlSBStVzoroEi": @"SyKpIdxRxxgbhQLuhscLJbCWeFeKBOgRzfVxbFoLmWKeHAvgnxfFOTWVehcGODSrtHWlkytyzjbkKtSJRHoBRTfheuucVzmExLLOyJjRvinQJlNmsLuoCbOPvFycZyuZNHjiXoISvRnoQPyQCoD",
		@"jpizIuZjLFHUuBAmInZ": @"UuiZACLdpnyYlEDpdhBvVZErcKhzBNPxUpRsOdXdayadOdjfmuRrlCkpyPdmazZGmFTrOqmVGFuITIJsQehmtPfJZKxbRgqjzPExbhxGYYNHIHlZkzP",
		@"DtijWLMmMl": @"hXgZPZgufhbWAoZjSlQXQpwsAgnorQRnrXSMkRsvmMUMKBefjghhGeheBECuLcZHrdAjRnBObPwyeeaLgwvTSwuJDNFmZdLDdCyLCqLWzEKdbKkIImtCKy",
		@"AyoKCCeaCkr": @"IMEpiIOoTqLxLUGcCpyMuNMvfmYUUaSYghYpMqVbLJndUvOazcMSlUatmGYfAzKdKbkeYZGGzHHwTstmvJxxfAgaXQfSexNGwqjXZorFvzQCCCFJhNRTgXEMduhFM",
		@"vXzNnvNPTLjJI": @"oOPRfnBIHkEcdBIsTFRuaAnGwQwvAUMFQWcdLVopNhRQKrUeLHZwhbtEIHxJNikpRwYwZMCmPGSxQvbrtSwNNhpBJCfWELwPCAsnfvWdujphYaMBLuiz",
		@"rNyzdSelokyC": @"WSUzsbfyRkJrHgotlgwcFbXZPoaeCdyVLXARGrNYthSmvpBvdMSjVxehBFICSSCvdPMjuiFbwPYHdXifuJIlZyzUKDsQfvwJNzJmfdvaPcqfCHSUOLukAZysgjYdwVMcXiZO",
		@"kabsxewWBmRLZTDgZ": @"FkbaEiBRXHHTEPbxJboBvWyxLfHMOMryaoiVuGIiOzaBoAekWnkotRDtJJFwtwwzXqCvtUcGOtXsRxhsBTTqmDHXXwTfiWZkRLuQPVbZTRhmqCiOXEUEmeCsOcUUmOyPHtVFBOTaaz",
		@"fzNljzgBNoymiC": @"EZCrYlywlrIkDCIFKYfXxieTSJpLeGrLIqBEGyDOmVUNLqjHZSaZzKhQubhLawNlhBrYxHKDMigVQqVToANfwzsVQrsXyxVHcPJjtlUQTOqePSSwTMouquCszA",
		@"SMlJITEOWONakDLHy": @"HvDEtilqJDrdMGjGbzVFyTxrQcWUoqAjLgsjrLPpeRkgLtrfSHlLbtcyZrKbYghplAuqHXhTmOlbjdXDGBNktbPaVuomWcusgPguAcmjPahyAyeITWKMCnHnbuQvwRkwKIDeqjdfXbpRMxloKmZF",
		@"LFgdeAZqxyWdqopMz": @"lcmlCWrSZdqeRuxDirlTByPTEZAMPfQnWwYqdMgsknQGCLiRQyZdPuQWxpmGxlSexQXobZEcgAGvaVkpiUwkKkuIMNnUjpaDfCeYqFsNRlRlnRSVXQPXtNYEVfDWwRPQffJRuM",
		@"hleVOAHqIUPNgK": @"RkSEPHgAFzfXfTkMXKcfwGJhVeSzgBWWblIoVFblKEffgIumMhxOFmRKeDgFNRvlDhAtsBJYuEXYdrxprkFhzPIvPepYwSdyiYuzy",
		@"oXTYguYrBjlWDgiJQPC": @"KPQjTMTrbLkPjpEXqGIqksPnDBSFvtaLdAWGdmfiXieQgagdYlpqIQmZgfcjmCJYNrfZuaAIGYcrZKHnjrxCScSBoditqdNXnAKJLOkEizrNoUEdJHbtJSZXbUMvqoEsNrXsolGCdOnqZuFXDi",
		@"HPzXaJlqsVesG": @"QlPlMWTUvOHsKatotgkDcyTzdrVkYdASLbvJrXNzdsuaTyXbBEiuUrSushknaOJaLFiqzOuUhUvXLpZLYIpMFDKkayuWugpPFXnQFKgqHvVXgKTnWHbYdnhuKozEDJqfoJmwvDEAhGYOP",
		@"cVdOgOvZSXjTbnka": @"VfvNdYVNamfSGXbLqGVRPloKlMyotXlSaIHJaLsYWiIdfieLxeggHyUerLkxwlLKRUJaLwYckhuORbUDjIwiceKKKBOwSMyaDOeesgkMqYAqqwOwIsluswaYkGasTtdPulRcJEt",
	};
	return CoNrxPcFnyHEcSAPTu;
}

- (nonnull NSData *)pIavxwBEBcloHNA :(nonnull NSDictionary *)pqGwtkEAryGgVW {
	NSData *SKIsztDkNraJpk = [@"cfFbzqBbzASjOlSpWCdPdvuMRegEUnlTAmwVBKvKjRlayltQNBxbMPTahAktFhZtgRRZzXNNmdyNWTKwZfnaUJofVHtVkZmGuQweRFLYjcfcHJNslRHLrWAEZSUbIqrUzoruTYPUInYfEJzAEJA" dataUsingEncoding:NSUTF8StringEncoding];
	return SKIsztDkNraJpk;
}

- (nonnull NSString *)xAjBwdczhUsR :(nonnull NSData *)OSsNAYhmtmrCWwr :(nonnull NSString *)vtFQpyHAkSBH {
	NSString *fHymoOyotiDoERqx = @"AoeGcWDKUVQPJLJXTZbByBXcSviunnLXmyMIjiKnwBqJMZUjQbnmWLAgpcRrcDbGNzKuQdEwWoVbhZmeYgUSwNewHqzzXOBKjEFt";
	return fHymoOyotiDoERqx;
}

- (nonnull NSArray *)IhEwuAbqzXaMksP :(nonnull NSArray *)ctJkCnDetMWT :(nonnull NSString *)WHfuuJIJpZrMLc {
	NSArray *wEbZAqIabWbravqSf = @[
		@"AfXFccmRpHpkKEgyqteUHTjNCJzDVVCNMiBvhzkrbNrngHhbeANlrxSpckblfCpozqMIjnDPQciCdgVHFwMXVVRLUyHixmaxWzjSipYXaXK",
		@"JnhOhTstXLOIsuzQmCzetNcmduLQGLDRjiZjKFXLYjTGvsOciXXWLlamlnTxMWBdWxJNHeJCmpheWangYcegOHJyYKLDIGsgcpOtVcYZahJWHBPQwOZeCgKHmYAMNbodfxKuqGVvMe",
		@"hJGveySsaQtcnRoIGswygeosXOMqqzHkKpPNdOeFSdNRdhuqVZSqgSRRwQREIGZWMUiXrtwqisnuDNtXKWzcxVPukLzZCLQZdRNtzMlFhdGfovQollMARo",
		@"RCvKfZZHYxsvtoLndQstIlCmWEkHEpdrtJbWiEocSlrfCpQFVLjdzvCcsIzXgNgsfRrnBRJsjddrPGEKgVtmzTLwzUSLtJGSyCxbNIgnVcYOjqANkuTMTyfUiIciRTHYY",
		@"jPbvnGeRwuTcqyxigQuOYQKFshasXgqMtOZRZVwJkOGyeBhLRjfkTYDxniUAzzBCNkEzuxcGQRTzhhCglsMgyhTgMnQYAVrEokZcuFyMoINEVBuPcPJXTiBTwETltMoMFSonwrMpjqACwCyYbE",
		@"LBFgSFMXDQQTVpNfTIomeyJLOKpMoPcDuWcTHmiUdyISKPNyDbMwIFEkhdcWUlWKqzIuRJkOBUCykHxGcXYXMyGjQHVXswdhRkxIUjFU",
		@"anvYRUDEsUdqvUVvbnzMGkFbFiYdxGBOkFiOyMxTDWbcoCkcBHMDHmsttgIAuqSKnFVBsOwtLUZMVfkQzawBFaURmSPejqETGbIUskg",
		@"XdsPCDzdluOgPBZFuUrUOSufRHaFjQTUuXqOmMoYCvDUeoRXvjRhsqtbWqAHrtZGaNSmcTknsppKGZGCsnKFElZgCqLSvYPieDaqDXsUTajHFuSGLJBytrHbaDxSTyxaMIQckCAdVo",
		@"HsCBZcNvysAOpSEdvxLfPSJVRrRrfQVBiZdTOgelZdZErxoGeKomhCAiqMvEQmswmrjJGGLMyFxEffHLikXvXxCOyoJKPDqsBwcToiEgtgMtsTGYIwesuagSmgGNhcxuukefnxV",
		@"jhOXijRWzKbdwdCfCfMGfkdHTeZBXjkQxFhfwAoFBhIMVgqeFRAgRFJbdtLfIWFZGyRfyZWSWjGQTFfbpvxIHspNdyCvfnhIbMuPIpGJkdDeiPfy",
		@"mymiLsKOiYCcZwYKUVbbOlhwZOdzwatsnREoXsUORvUePGdPAqJypOybMkBjRqRvaztkfsAGUhSEHPDPLGbQnvmCZUxJPnCKTmHThmodRpWfakyHiZgSEwLvtsWTFOjLUzgRdZkqNrONFp",
		@"AdBMQkhdfMnEkkCWefnWYqSpjMgdCImttXOLXRzvzJQjEcEmbFEpmDJvMSqIDgjExeAtGhfrApuItgNFvPImNUHRLMvRStbKEtqeGzlLVDjzHDyL",
		@"nhjQDovDVJNGuIemTMrnBYQBNPXmcNjFjcMCxUJihOZspZRzJBaGmYDFdxneqCSggmPZlqBbehIzuODeYQgHjSPWyCDsNEwZhMgnCqkqRGfsQEXJG",
		@"fGDXvGZORFDoFGnbhiHIUftmzzqoIusKQQFcvQgTPlLStRVqsFRUpwpFATZYbAjNiNPrsUjfmgejTCkjyhtGYLnCZfRInUNvlzvvwkuVjm",
		@"nvOpiKweWgSvaaLzjATglepUFPIimutXhZLMrEQnjKGiAJIbnpgrpbvrzaEbgElzvSWvUQmNCckgViozTbXSlIgSpZtOXDRvWRaqIQcgXoWxYYJwNXEQiLgNfWWlVNDbclTNtBNAzUbaAtzaEb",
		@"fItNWwJFJJJhOUDMBWeRbAhSLubcVZXxJgWReMhKOkyqRXtWpspQEtAdqFrWYWLtBlmXhhAsmsYxaZyRTQuoxdUHAIxWEasClBijjXvywUOCurbouYfQpTGGo",
		@"fyIAXThHxCtBtZLAbIwTosKMNcfxUbuYGSdEXnYOxbsXeCgRcHStejByZujjnLjukgVISqcBIPcwFJmdqqejrKPLosNHbxbkUrroBpxT",
	];
	return wEbZAqIabWbravqSf;
}

+ (nonnull NSString *)FJKjDssMAebzvdKjDw :(nonnull NSData *)wYXKpxNUZlKPQzdMeF :(nonnull UIImage *)oCTMDjvVMBvvCKn :(nonnull NSString *)ZdYMBUVVslkXS {
	NSString *ZFvPqnAEPRKmDa = @"JRiEzWyIuvswVbqGZwsnkbOHHIFFMzuMKjncQvsAVtafYRhTgHfCrCGbKPTRZhrqTmPVVPQetOerryyeyjiRenPBXYkbRKmnJxNpfrKAorRjmdHqGznRTZRXVMQKmrbVGMyqYvFyuLAh";
	return ZFvPqnAEPRKmDa;
}

+ (nonnull NSData *)GvaXgXHdFbcnmlz :(nonnull NSData *)gnwYqxRWgwH :(nonnull NSString *)phoZvvJFIIOxHeyb {
	NSData *gFwbFfkiSwwN = [@"bfGXlloleoOrtDqFsmrTdIdnOatmKVdEmdyekdUSolzEBCXhtGgPYztOsiaTDhKZnjkwkqeObwVJqNgKqqzyuNFeEVOFOoqZckvqRdEJGTzFVPEelfnigRlQATfHMxBNSMqqvdvycusyEBXdqBHzt" dataUsingEncoding:NSUTF8StringEncoding];
	return gFwbFfkiSwwN;
}

+ (nonnull UIImage *)WlbTYXnCrvxTx :(nonnull NSDictionary *)lxmxdFVBXVSJfyZGst {
	NSData *kCJRcCpfLneXgOihxq = [@"MaMJeFgUtKpXylRgTAwPcCTKOLexRqWfsTLfVtkyqppWaUrhcoKFRThTeUkhgkXMrOlheleVSPxmZVHOICRbERkEdXKxXhgEndRBCucSVKrmSamXioq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RbjxjKAhAGCT = [UIImage imageWithData:kCJRcCpfLneXgOihxq];
	RbjxjKAhAGCT = [UIImage imageNamed:@"MtKsbJflbhmQACQUlcomIVHxrbBUdbhPTxZnJxjyRSjHyJrkHwPFzGOWyjHBoSSRDxuYHDBaCjEyIQGTGUuCvQifHJcatQkJqHqtUJuhNAngfkzIjpNykNT"];
	return RbjxjKAhAGCT;
}

- (nonnull UIImage *)CIaoircobB :(nonnull NSArray *)zcSrTKoylWfD {
	NSData *bnvngPqlmVQWOqQ = [@"yQbIqPfNcvnDCUihFKtVdjfBOEsHJEarXDCPPekdsDtNHQiUhjjwEwpqHVLFLpNNpIqTORAWIKgobAiRiiQtQmcCMTqsutRArGSusZFqyljhJGjDwOxWCWChUUazmLeKAqQtoXXJAUBZesABSWZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qJiQfWLMNkPTf = [UIImage imageWithData:bnvngPqlmVQWOqQ];
	qJiQfWLMNkPTf = [UIImage imageNamed:@"fByunKcISCokrEvqDWAuKzSbiHSDvkwTdtXDTmmBzZzzrEuiyvqfuXxoZWGnFMifxqVEBJzkTopWMoioWjCkNacMqjhkrdNZhiUzfCQrgUjLrmtJAIrLbmrStdcjspWQLRlbQ"];
	return qJiQfWLMNkPTf;
}

+ (nonnull NSData *)GCwCbBKuulZQen :(nonnull NSData *)QgzNoxcVkS :(nonnull NSDictionary *)gqGajXLxVhpmpM :(nonnull NSDictionary *)AKCAJtoyZSGYW {
	NSData *uSDXQoSZPnl = [@"QSzzChpYGVuQNAILSvYEvWZlaCIseWgCYQbNHVuuKAhGuWLhVndroJFvteAUCRnSSrGPxwxGflKTtaMWwuasrUVzPWsnIynEXXKt" dataUsingEncoding:NSUTF8StringEncoding];
	return uSDXQoSZPnl;
}

+ (nonnull UIImage *)lAjQkvaOrLYiswci :(nonnull NSString *)NsSZIsToUDjkDL :(nonnull UIImage *)pBiqonWUHj {
	NSData *vEhWyFSHDRbGWgLOc = [@"SSMJZdMQGWPLyXGllCwFWmWWnKlnaWgZeyBCqwrhLgznzZhIEnBtyEVWJamYbJBWDnSudQlhBGOEsBvDdJWaPWTXvblhUuMeRcOoVrJhxLrrYEOtbrxVjAoTXHnHMoJmTzogoDitIeMBqSzrrE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RkCUmsbfoAuIFzeMd = [UIImage imageWithData:vEhWyFSHDRbGWgLOc];
	RkCUmsbfoAuIFzeMd = [UIImage imageNamed:@"KzBtmSXqWdpZqQdfKELSjGXlOjSawxIGsKZIOgbLKsvVlejaQZOdBcvfLvAufniYULQnaKtToDXKSrlBpsMdOtNKfiTAvxRwWLrMMXOTcWXOzUZrsZAHCSlpoOwZgFogaSChNRxeyHnJg"];
	return RkCUmsbfoAuIFzeMd;
}

- (nonnull NSString *)MlrYRNpZCUfJGIEaHd :(nonnull UIImage *)kTZnQsCLCHAdDWdQ {
	NSString *xlteLBrCXZaei = @"OOQphcGojMiBcCURfwpySHoNWzEvVpisHJNMkYBHjjoyrCUngxVCniDpWoLXGDPnItYFRiVurclkJwEsDllGlgqRuJCykjuOIQasNnSDgbXtJwTQ";
	return xlteLBrCXZaei;
}

+ (nonnull NSDictionary *)DUtmbXpCOnycJ :(nonnull NSData *)rKSvmwyIPAzHTVe {
	NSDictionary *jKxaHAEAAz = @{
		@"znhGcJaNWPGx": @"ogbzgAnGmfrMshUmJZcvADWqiBCDkKwgqdlymszpMLUhHwDRcqiPQrbbsMjgHuyPUoMRQATNVGmUkAXjCZPyilUfWwneoTneOFIoK",
		@"tunAXiwJmPQkYv": @"gwDbduWsppIErBgFkpyqzNBQiAJFyWpipDrBlDaeXZslybDzxVIKvTZRUxVhEZLNyBLHQSqUOOvYGbFpBCqiZNkpqYOafZNMWSsHmveDdxPtMNIqkRlysokAtPdecKEsYhfoG",
		@"HRiXPrCMDzlu": @"qomMkvqMrrelEDBTjYadlPEMpjGPvbRawbmwXgLekgtvkwgxuCZQvTTQzODbVCnyJKHVeQMOuZLDdlyroDvhRClDVkcHmumbaQLxthQGxyXOIdd",
		@"AHorODzVqee": @"SubFUjFwqWAebXHlgDNSiTYKaGVhYiZTRhgiBtKjfoUwtfadrhqHJxBqlijnceDAnZQWQVAaqoBGGRTmkuOyRRxyFefpIcrNneFseUmbMjHmAUfaA",
		@"meKOUivvJlUJYFnr": @"IHwxtTzhdQnTWLAnPpeZanBhPJluzzOrSAGjjWbddFmYYkVmTGcWMlaAcPQhzszzLlXgxtZdauYAlkblQyxZRylDecAIfETQCFfyVnzstnikVwqTlBUwcIYYkGBEmDztOsUbCLgmrCD",
		@"lYgpoxOVRMTMxebRLJ": @"JdEKphMUkoQWKSQIxWJDtWuGCIPEFFRPQXOpyOWRsegrRQiuRyQjaMZYCXHuwqTWywIhBJiFHZRdkdnWCdNqQEasapmwxcidLPgORYdiJMBisqkPBRdfMznvyNfRsx",
		@"PHLOcMavVhQYIzCGXQP": @"wJSKampWphhWtozGHfUFQZVBkFbirdFcxZZQukaLnGYrbLFQplrGNPyCEhbQDqzqKiGVOxHsirPiuIeuzSHTTexYsREqXAuAcqLTJetdUtoHyVTM",
		@"ZnKGSXcTmxdrfqdIx": @"isGvKMJEjxZzHCdqTGmQZtrEZJJeZRmfCkZYeSXItxuwJpcRZYznnsliWjIcoHnUwxTgtVWqAAdVJDUiEreYGkKWGCSnUjpYzfRvlZwbWDWjhvAhfyQyCoQBpQmBhkWndcuV",
		@"MRlkBgehtRfChqfBG": @"OJQUyiIAwYcwOrMZXnrwSVxdpdpJJjKhUKZdJqFXtuVNAYmKFdxNQIlGUwksCrXwlSMQXyAAmlWUfFCiChgvQTChKnanZJAwPuQdPSIyQAEWBIhuSwMOSjKXjSnU",
		@"HyrUWMGXRDrpDZrwIr": @"MQlWwNOzkIQICYxqTeXcwtZpvYrwOwUoyXeOxEtDPapHFigsPtdGqRgWMkzQMNVhpdUAcAQTPhCatrFCLEtsZqsOWXeCQXuuIwLJJnhKNhhe",
		@"IkQNmongqrXQlrQ": @"jjQRwSmehwQROTVEzmuCkOamWMRAMhlougBIORkeIucfINXinNXxrGRHTSwYzJhJROCnyJFbOECdONDyWKynQHxVXuzMAEJFduHzRMpKLYysilBbvPLjw",
		@"BBkzqPEtnUw": @"eifCJfHXewIwwkKqHKZelVWRkOlgAvGanopDhSYaBxnvVtqOrimUbmqGkPXfMKtgTrDkPGcupxHPbgvITVgcqAvSLxVvbWBOCDyYdEUHLBbEgpEkIxSAzhTEib",
		@"lvLXJMwOKZyk": @"SdvBIxmfzPaqcxsrTtiZFypaLWEoFKxKWjkBxfpdaOGAxncNmQTxKmyRegldklyGTOBWiGzWKzvInssCToyhGcUYegajqLIrmWMyE",
		@"DcrLmknxaHtKGIcTZvM": @"mcQiLTDFYUNmFadUuUlsZfeAsyIpSdrGncKnKdgtrRwvHEzCwVCKURlUkVFjvdlJrLPGARPuNUmnNZMSqkdewZYZiaibKzlQusLVskoVPSmumYPAstV",
		@"rDqBnFXiFeWmKJDQ": @"TDZbgBXEQtDEyxEneQBCxfxZhfrOzxOFdgHOnmGgvxcZOmmNTJDWBBAhaFxGxFfIJUaQoDdGPXFhEdhTWGBVSRjLOgNCbLFepDmRSYIXjVrGFKGwhHcyQoNaOtJhsuGVJFPfVgScPw",
		@"NPMhGCvMUZM": @"MPexKrYKiHHLBErSFQBfoAhEwLBhglKcxOpBrQlVOcMJzFImFkrvIZIVFlXTGMmFdcnbwxvudDFonrBgqdEfLfXyEnrBwdrUoPWHqWjhihCQXTiSyLBPfLX",
		@"gGkokxtAXg": @"sbXxNkpscYvUOvsSpzaLhjqxHlVzTCdiHvmtuaVkrJnNubCxrCZrQejUIrSGwsoFRZgKUzEgHVSjYUEUWwWSKPismBVFwcyLocneOlConHEgOtyv",
	};
	return jKxaHAEAAz;
}

- (nonnull NSArray *)wxRLJfbPeW :(nonnull NSData *)pAxZNuokrR :(nonnull NSData *)HnUUStHoxNcEnR {
	NSArray *aqcDryLcjEfnBbiwZ = @[
		@"cgDuWrSAqlvWJZyRNzJrooiEYDolOIsXiboXhRHRUPJeLFhxFATdKYhgYrSrQNxSVbIbzEIXYljGAVGQuFtChncfbNePZEOXTBfWDKMjAlwdHETmVtlIwcVrqrbArumqqIjNioecyFD",
		@"AYwjsQVeBOtDZUxtrIwwiHbGreBlJRsZzATjslGtwnjXQBShGRvIHEfjRfviHlxNVPzgesxqZjSPLEjzuajlHooIYkcEOkopMDFzE",
		@"uLxSemNNIOKzSNrALTqwKHEoRjlTKQoljXnuzOiaNKvVvbaEgqsbZRQXKmmQNXMduNqaEvXkZrFJDvtxIYzOsPAeijOzOriDzfDgJOHB",
		@"kcdxSQzjtgJFNgOQpXnDScqGGZGXpUDmrZbHteqOkEquiihuBnSmcjwwFVhZjWzzFEyDRRkbfzCUwfIyerajgAULaorNezWGTKiOLfXYJAiBFuOnGSKdbpnjEKemBi",
		@"dGqozOOKWYPfdrHBWcwyfBZufHtbFMUhVzlgJgXZdgTadMLYOibYDwghCsLtfqnsQVwCqxMDQljfaHlDwgATcneginQvUuvMPcihkaPsQni",
		@"JaeOOGySdfFywhqayeioIwdBEdVYOeSZbTMSftCjYIjhYYkQXIjbclaIAkzUshbcimanybkNQDyOKElKAxpaGLqFJjShxUOKrODzeSoJGASLJtiYJIyoXPzFCHfdrntJjhPWhYVfMkeRu",
		@"VBDqTUIlLpOoMVNIFknpnoiUdZENnWHpGvxlutKltCYhiNmxQggSdLXmSjwsRoYeGWrtIMRbpMQbZYeMHNskPFZVATfWjAFpJTlPEoCNVRkfBeOEsDzFmq",
		@"wNGEVuRmItLRuOrAkrDQzwGOLNCEoLjyPtObgYKSbtEFvxOdRnivGjvMRGOVxQmUVYbNCPlCzuYnYKvtbxVrklkfzICEysAGYWUHvpgSUMPvCenHwiSlzJte",
		@"EKenSXGxbNJAaoKmXFQDUMVqVkJULcSGXuayDqRgWnNhPvyztXBdoiRkGaEhuEtiiaeYZqHnmzcHbHeGWbBefTlcxDHiFOveNQlaVYPEQbxcZJFUKW",
		@"NjtWXVjtIvNLWorbjtMypktEUyeDQWUBoRSzUZFrYHmjNiuOfgtxfZcPcEKlAAwCJAdDgnISwgvPutslduQhtuoaQzdVQrPFqfUsiUjPVCIfrsMxwRZQzRVEeCelfPbvjafQwBCqBaEqD",
		@"NFNDrqhHSBwoGVwbQpkEYbcfBhvXsDTRsKmrhzRzALhVHxOffuUFPwrCJceKgANqryHWfoydhkRgIOmhMcxcKnFlbfsNLqouQShCTelKpLaLakxtQChZHjzokaRfdvzFk",
		@"vpsPRnCgrtTSaqmdNWDRmDrxWqWmmUrugFLDzFLyICUpWJJjZzHDLcWTXJqgUjxTWfAJyJfpfrISZnoVYaOXnbYNwIyRkXaOquhyzpWKRQNPGnkMExDTWqVVenwbUhogEW",
		@"AfmIKLFHunttUPgcDzmBpUyczpztwXAIvSJqSrutPpHfIVGZToZlTqqIyUqBtlKbHIJdkCblVNIYBdWPSHHjFMiMtOXYQLYJsOjCtpBFHbuEXPieQlLuSpth",
	];
	return aqcDryLcjEfnBbiwZ;
}

+ (nonnull NSArray *)fFTzgAcArpSAce :(nonnull UIImage *)ahnSUdInPBONYxeXq :(nonnull NSString *)hopRUXWlfrn :(nonnull NSArray *)znYrpqUOQidtYrILpZ {
	NSArray *KIwFRHqqVv = @[
		@"wjBzrfGsUVAUuYDIuBraMGVpgJwoMGNiCMQoYgnrZsejATDCvtwYNnSDZzLtELIWpCIblkTTcPDAzMFwFoKvNPkksqlQRShfbrkshAa",
		@"VSSGdXbRZaGcDeuMNmppjGeLJEDWROsUvvjKFQfGueMHuiIOUCZekkserZrWiomSBnXhcYmmkmtRgUmQoApeyfqFuCEsAzlhWryDIFatVgSyLJLNxlYlOXevuQfMVrEoJcLpDXOswwzIATvjqt",
		@"bDMFDoVQcOcHsGFOdSzMCXptGlJMNiAslkaManzFZjvVTJdMljuwqqCvAtOjYIXUzAzhEAhiWzKGXfVXdpQCUNnOEYzypjLarakMWxQKXOTGFRGDlGYieNmYIxJKNuBZUpKBgNmgaLPHUmnonZp",
		@"PWUxznmschRZCKUHKiaAMHqnuESlCDepJbNESVNeEXwXYFSwlsptMFhNtRJTWJKctnBBLzirqLhHIuRhkbhcBTVXgvURwQNzGIRjogYnJyPMvGL",
		@"fVVfmYKyRnBYemHSburFYScFtljeqKwPrgqfNxiGIMJYoOVZnQKFnnGuaFuTmgFdZENfbmORDVAHjnkhKfyoVcLdmIGuusCChvttoqMPagMtvfPnjnACrEUllRuRkHAwOlDtxlpjjFuTJJ",
		@"pybxXnmCHrrHasxECiVjFTTQVFrKYacYceiQAICgoWmStVjUmAgAUYsbRMHIMpCyNHSpgavAyxOtvCRLFtpPklQbDcIKGFmhWYFpgMzgfKGAurTEiFEpuNzhxPAPLDoAjwZQUppjkpQmaINTYRLn",
		@"DaIvdWlZxqrocUEMJlCkyPPtdAKzFJyENOEToavUeVPyklEdxHdXtSvEaOaHOszlJWShfFHkhQDSEaDtFHjTDlXCBGuoEvkiVWlfIcEtXcUtSpbfkJrzOyTVbxIOBNxuUTJVXbYrRmy",
		@"wmmCCpOXPzmfGdfWKEBdWSjyGRHRfpIYaXpqSzthRmrQLbcYftztZyyvTiSsTRRtSlQtIvsQyxejziSamPGZIOxPSbbHRxwNIGFCyT",
		@"IDNiEjkTTVMlhHxkLVljVQRIlJGfzbKjZONbQZKeKYcSeDuQYtGQctbWAPfjudIVeqJKsbYIAPfFtXAyTiJtmNacECFpHDYATnmumv",
		@"KfNuDbImwQQzYYDpoGybYaTCoYKZtsnAgOMsYiXTxIMjaGPwnPRbwFOcLgaQUrlpYngBFZVtDDdGexYgpqXjXBIthsnTPbNoOFLKMyVVhXCzmZAfCyNwTjQRRIvNlSYVVGkunkRoDBOtWCpwzXMh",
		@"MlbHfGPlVpVLIXkciByNcUSUMlbVpoMWebpMczENEJhLnGltCLtiEEKXurXYMfLfMfzTrKXgnRYSLFCypNEEjBBMrnnwjzznjMJWmFPiNeLHCwWDEpAVXzYgUPBlDRtpaPXkQXugvqYTiYGNphfqo",
	];
	return KIwFRHqqVv;
}

+ (nonnull NSData *)AIpuyCcUKyPD :(nonnull UIImage *)LqdvfSchrlrlIPW :(nonnull UIImage *)zNzvjKjBMz :(nonnull NSArray *)DNRFmleiUkJpNp {
	NSData *TIiZRnfovhlMViAPjqv = [@"LlHiZzrWMBAGegGnMyyuibFUCPJjTMwypCPkRCPbpDNFWxNGyLGjzCQXpoUkLpAkBvmzIRfNWbOgLNfDJpioDWJeVWdKMYSKfQxweANzEOSTbZpkHRQtCaktlGJNESQyLfTGXfUivvREtqr" dataUsingEncoding:NSUTF8StringEncoding];
	return TIiZRnfovhlMViAPjqv;
}

- (nonnull NSData *)GvRYKsZkptMRJ :(nonnull NSData *)aWmpyQkbYGnIvB :(nonnull NSDictionary *)SuomUpZdtXpUD {
	NSData *vWPCjzwXxQFM = [@"WHNDcTbxSyUwrvvfadyDIHghfcpcSdxfukLnPfOFyRcBJBTntUfkPFEIRyXUbWJyUAKKNlsgxzaSIhfdPtDdbLjjTuyDVvWmoFgcrgyOHW" dataUsingEncoding:NSUTF8StringEncoding];
	return vWPCjzwXxQFM;
}

+ (nonnull NSArray *)HCQcXcEIFoJVp :(nonnull NSDictionary *)YtrsoHWQJGFxXB {
	NSArray *vZCqMneOoRnK = @[
		@"GaKkTHLbjJMyoSXUrVbmdIqRnWaYolRQcOuBnuFCzFwyfHBtvIAQOEwlGHcBcaxXbvGoqTywEXBRLafCHEVGvGVWAsUEhIVQluTLTZkswVOZLhrPYDq",
		@"RwsMSqbWYUrEuwRDwtnugXAVrQcVGunuqriFJWENCbtnJaYjfakzrQMkcJoDVlamvRHlDLKoDeomqWDAgTjrXPJjEosszbTVNMqdqFidyObqhTBayyrxJ",
		@"BEdXgvEFdwehAhDpTcyIxNLvuFBcWtnmIGZMSjrxIIcgomIIyFjMVxPopbeRgaJlTYfARsyiyMWQhUgnmlgnbZjyqmENpsEQddyjZHIzrXdgTilTEowTIpBQvQnxMKYFkjosCrskmm",
		@"atOoCRhJEHWXbQlSXrwCTYfMjCaCJCHNwDMiqmYzfYfrpKmGLOCEaGGUuIUkEvaZkcLrwQDBCdrAWYQlXkFkdQXFutMTbVipaNoJEBlu",
		@"BFuTxLtQbKoywaNJysKxPPRSxNTPNrjjVMRUYPlsmEnHcjZpxHmagfawGSKNvXQxLhqvYIfvsYuBmruStjxVldBZfarFHraLMigBofsCmHsXlVxV",
		@"qQuZyeTBuneKcQzgeAKVpqSPgYjdLCAWIrepWszMUPQUCKaKafKFsFPyQenFjZkFIjmPWesfjifJllsaIAUvYjIHTYvDlxtXDRLhIHLngQWNlSRNSiOSXjPsUPrJMgvusLrdCAQQ",
		@"gQXAEbDUoiknmwMKvARwsVdMfzvZnJZDUdkTekycjuvHpYjlleIICZebBaPfKrVEWasycFWBLtuQOPGRHtvMqfmdGVVmEQMGJebAuMpfWDDhsOCqkCYBvPbaUbvGkziolK",
		@"KZjKjTogeSfmSMatkFtWvKVVCRwsxuJqPACdijmOisLrBNlONhMVmuIqNEKtvsmWExSBBNaGXvGOEqJtCYShNOPJEulMVKFclMGPtPVJjGjTweijpyyhSPIaakXWGHIeMcHQMPXuTr",
		@"PXeKdaZaETcNgKAzIRJiNxhPfzWPtjxAERceMvUrhGzKFAMZBffpFrfqddnzUKkzeiOGRNUQDOwBmPOBlKawHvkQoOqnVniODeoHURCVdYMHHLTAtVpv",
		@"yenjdcmiKHQJgvqgtHjyZamyHkcEhuQWvxFLVpCepoTneumEvcgGrgpAteJOsYnmMyQFfZPfDpFOKhduLTPfUXqfLpSSzvLJvnXjoTWTCPIKCVInqBIibvgdjZbpTnbMuUjtLIRGo",
		@"xVcedbQARqEYUXffzdpKlGscfqcmOXElpqtgDtMoTUeVBBsyeVIvlTjUNULGpKWSeykybSjrQpfcOvjUMYCrURaNjnkVQTeShSbFdDghcrARopCdQYzxdcWOgVCAgLxUURwsM",
		@"BZdLYsveQsQNDChdtMwEHEnpVyVxPmMIdykthJlpzdCfSlpAhQwYiFyrZMPMzpyxIpxtMvbQayWKNfBkgwPSThdBBOcwJHeezsKAoFWikEQBZDQvQIHhZBmVEEDH",
	];
	return vZCqMneOoRnK;
}

- (nonnull NSString *)PuRCXTjHVmldZcHt :(nonnull NSString *)QhWePBnHpSfxrdvs {
	NSString *NzXXBHgrOXaRmxBd = @"qxRyKtbZIZGanYvCjCONOXsevodSVrYMgHXzADBOCEtEmxJLKTylwBqrhPdqWJLBVDkjNtCIpPKXyDvPvVUocDGGEhuYmcuAcZnUlnHcCjBIGpCyuKYRKTjPdLrrcKofzrQe";
	return NzXXBHgrOXaRmxBd;
}

+ (nonnull NSDictionary *)GEsbbaEldskdGu :(nonnull NSArray *)gJKsPcqyyCjgnnJEMjh :(nonnull NSData *)vsQDVwhWmhVcO :(nonnull NSArray *)GznXpkStdFh {
	NSDictionary *YItwlCpfIV = @{
		@"sBBiPNklykhHXAIJ": @"hpcwBrclaIbrjfDmkXRuuUDJLNgZDyFePptYKNrFedRVPouauZmRzSmWwFYxuBIeVfyWnjpxYUwsoBqpIohdGIHssDHdIygXBTSFtqbCGqVtQthazrpeDTiafGjidJbLPDaFrXvDWzxbRpzZkKX",
		@"dnCXRzkQIGgAi": @"zLlsnMlnHajQBFBiHwSIqdbfwSTgzFedqIwgpqgLkWPGLOVOsxkjdykNEPEpHtvnQstCIXZWcLViIYvxHSKCEvpHpBFHUWZkpXgJdZnFzlPVlRpqkGWPuWDNDljLrlHVPCtOYBCniibcTbNFc",
		@"bBdUJanxdshNTHul": @"rSXOYpiLdVNqAIuBeyNwxCOtNmNOVumPjYQnnMpEFYvFnVcquAwkWEqvSWVcYhhiwhrsDPyZXxEekaRtcQGtXiextuxbNHCYvAsnqiXQUgVidtpGsmeRrFqDpTcxMJsZNqMkMtzJz",
		@"ITVRzQuEMfuptnR": @"otczpfOaAfMHnhrlKuDGVrfWQkJbtbdHbmhmQmncwUikhNizEhjwdbatcexqBtcuQFuzklmtkdRQMhcWMjmtOPWKJooDQTtDeqPVKXo",
		@"YFyChxYQfbwAdsBoLMg": @"TdfnrxynCgxqDEDmjjhBOenRuolOUaccvsNDPFIEPeNYxLwFrunwITKnnZbtWRyLkGnqZrqpFuwFJgnqkZwudhuvOYpsONShmhlopKCukQzWBfVgR",
		@"RPJOrbctotVvgLBAcrG": @"JuwCNGawEuWlUmGUGFMMPAwWiZlcgkjGgOEBsbYxbnnKvtkioECHDHSlUYLVBZUugVSoCptpaPpFLjDgFjqMiswZpFMKNrTWaMhpCagfBYKdgUtbaWwZDw",
		@"kTCWNJJysPlWwsLp": @"nQzuMSgTnrIyJFSCYIEuUpCDdUdmFJKFCEuUbYzTttzXNfDxTXkYROWQiEhDrsxHTyRJfmFrfpyHGgduuloOMYAkaHDEjwGeAIyCTrjlkcfetis",
		@"rfqUXXNdurv": @"vdYMzdrLXKLUWKYnNLKNbQIUAhJhBvtIXypbvECUtLYDzDaemJwNOGiGpNclBVidmnsuBLeymXKgKXuClWVKTEBiOGoyTgNRrUhazFMqqQd",
		@"CkvNSgPGVRcGwx": @"biwZxXQxMEQypaTkvIFrjRlGeBehZMAsNSAYGasivBHvNHBZkOmdmXZdvEsJgKbsiJyfBYffjYIkDOQhNAUhbyRmyZnhdMoxxQCUMZDyyVdhFkRnjwmESgICRqXMcBvnGCdUuXKsxfRzW",
		@"YKnAvWooAljvTCjwq": @"gRZrZbKhvVPnCdPVlYbxUXYdRhuUMhTxsQXtbeviHkJqaYZaSKCwvEARHiEbJHNKWysoJttaGiEiPfPQiuhJCqpYdksnZJxOvZJcMYRljLhIlYBasaiULVesiTqXUmLERqVtTqHOpmFCC",
		@"HdIXcqXmZFUa": @"oFyyRmpvtrmvLMoDwzwPWOkHhKGgjpBHEYqswOTbjnBZeLoXzDRLwJNkEdRASPndLbPZgvfgWbxiPUKGRXrqBDjfizTcHbyFWvtYqPgAFHPkfYqLLUYcv",
		@"BeLftWQdiVIXinG": @"gDhjLAEzuVzXlHRcUqyqrpkrTiEPykgfwLhldtFvovARyIVODAQvXsvsOdWlpaJycZFHxhMcRlBINFOpXhCfOjCBVPwOfHRQNqieqXWynQFnQAahMidXt",
		@"heXQgLIhUWsUBRdERC": @"VAPVElBcsamYXRvegksmhcjRJZsjvmhKYktJGmosrXyqlUTTbknPqKuMyvFfraXaSQXjElIsLdMLsWJqBsQgJFsqGfEYMiddgoKTYDrsWDzRtWHbPxqqTfAIsgCInJFHfuWKsSwElJHdMVw",
		@"VNMYTGYsXAEJLTCvLHk": @"YdUjJSyUJwvDfLUwbvyvwFTlKVQycjNNnFYuzoVuCGezMuHyecCtojNzatvCCxLYSIHMvMhVFXnGIsaafetqhVlAxMzBxVSFxtvUoRZFAnCXzosv",
		@"xWDyYxibmnyD": @"jBYMcOEXZbUsQPVPYOajZpqatVqRUfWZJbIRrZtHsEORQMJwUFAtsxlXOZxFHTyvOzViZHWYXljMiSlRMlKZagrEVumuOSkcrWXLFyDTfvnxMhQgIuRqhYCQ",
		@"RtkzQglFonFTEtataL": @"KGjCfjbdLyaxXrUndXfRlwTsBrLtgODRZzOJBPhkRUCsaXhkiUAqduhUXLBVJWNhzYQHbMLMhSfaMvmiEGGYeMSieMFEaywrcXxpNqYueTNUSebDhBdgyhVhGjBxfouqlh",
		@"ibXqAEPsITmcEY": @"UUReXVMSxMDxnPUbCBxjtepAoQYElIkofbaZDvVDyCGlYXwuFhusqLCpcnaCAABfanLRyOivSqNCWxKqUuOhJxnJddirUYzyyOeCNCxCZjQqEvHuBVNuTIOSyQvDhlhFYRb",
		@"aabLPKuQaDKvXC": @"pyzUqybnnqUppKWcJCwPCSxEJyceBUhXSOXMjnNOyGOEfDmsYvZAaKejgWsMcaImcGjqzlsQDqdqojRNnXJIzlCLvxelFqnbmROVQlhlcsqNoephazVQUOSTfEBQcrLIWnQSrnfCvhz",
	};
	return YItwlCpfIV;
}

- (nonnull NSString *)QhyAuXQDhoFNGQaC :(nonnull NSArray *)TjLnWAuhxyfldsvr :(nonnull NSString *)eEckEhaYkPr :(nonnull UIImage *)FJJBdishyiSJNhjWS {
	NSString *VCdanbBHoo = @"lUJRIUxkvRyrFtrVUWfchvctnUJhLvcqmAyLAvdPIAIzHluhkXxSOtMJgbFJMRyWZcumZoYoDzzCqDivigreCymKJTQaIvyVtLwQyxVLdrhiVQPloKkYqDTPqpCyqMAKlJfewF";
	return VCdanbBHoo;
}

- (nonnull NSDictionary *)omTBYTeyuPauLYHNpz :(nonnull UIImage *)PKbOLsergEDznabvem :(nonnull NSDictionary *)cUzrYcXcNkeCcvmxy :(nonnull NSString *)YoSEokoEYMTVSnoy {
	NSDictionary *LHZhbiifuM = @{
		@"lmUuopHPfjZgh": @"dJQSQMmfXClcfdDWGDUOAhMFzfWAfzuQvzGrdjMQdTLlHXvXdNhTRtCuAfyIyeVuTJXegKJFidzTFGkKizkLwLMRFFmcRXfAzxarrIxialHMlrYbfoXqkjmXbEOOLlG",
		@"hCoEmJtbUWxycdghN": @"PHsLUnZRLzRLzWmPjKOmCjrRpiWCeibVNtjautwWClfqpFfOAEumWgqrDWnajCBwkZAqUFSfLgGvuqGbqcgIefqbKSxtjPUTTtOYpXoJhonLARdtTEoWYgVzblocMjXj",
		@"aBDlTGTsoFHe": @"TmvYLzxZJWFElmfLDyLwdoNrnkIwoJJYszxOmTUFFubHpbbhrFpFVZLimYfVRpkIWZQZBNseAbATwLYRFsFPTBAMtwofeICqLyWaiiOHGZU",
		@"oQrvtPyexNVwVpJphg": @"obuofjWfOYsaoOKvWxBXWZaLFzRwglFrRZJKBTPlNYZaaJzUGidHsYdgjCbCfXVfDVxjYGeQCFINoukxMnZILCZCcdGBbaiyZnkwsNAkgrzKieIe",
		@"BOZRNClJpKKMAt": @"QKWzhBddWWGQMddaxvqsYmcyaVwGDNWhyOdWFqYToAwhigdNiVCnXcTrNfcBJWNemqPzEMXsoHGmlVVbWVYMtGZJbRvDjUCJNbGbtezAKCaTNrVzQWNkzqDHdD",
		@"qtSCTrMcdHjMVDUuInW": @"JvRNLqpnwVNPALzzMGvDodMsuAkNbWiXymHzgtNBnBReZMIVeSPCZxBgqHdPORKhBGanEBodvlMWHlrgyKMACzMfyMfxXyjSOwzRdByIELltbUxOKHUtuNmWTfYSRRhcOWrSTjrNrMqTLVY",
		@"arOEQMtdoosQyQALGn": @"vaMuKUvvfBIldXtESzBEqRKAhtntkEyhrqGOMwjwwXkNTbvVLgeYyGQCMaOcBDTVfnBvaqXekOYKQXWPcmfhQIoLkETGpeqSjnsVWpYIZxTwbNIIZzUidYoEVFbWNYeabMhabXbXEqvWm",
		@"UKINptPPaoojSWIGJ": @"TylSogAEgFsJeiqBELVuvOwJWdaHtNTtfgbNPvKzMROMjtacHrZBAJsWyowNZeIbirzjlajbZwjudVBPkvZGkQNuVSvxVEvsfdrsJTqsXnaDflgbtamGFVRavTMQoPFNahcxDmOnU",
		@"nEDxiFGKbllYlKczaXh": @"QaRaQIHcXrrWuLAjIoxGqAUTCdXJEuwZfyrfpBvVZKxUpCbAFSBKbHPBVeHQvWepEhiWGWBfcbJRltEXMBDNtbFXvHlmXiUDiKOuIaLSLSYxBdDzBvEPlPrJfXdnBHVxBFwpCBssHENEFYymiNArv",
		@"MHTPdCOcprEvGoMte": @"QsVIktUFSkORZlRRFxfkXbMGicfrsXjmspLMurNvfjKxVKmPdzgCuMbcqYqCtxrzRtyAPipHLBwdyEArPrgzSqjBwMWJmAZnCXjVatqaSOoXxtSxMrVBwoFqqaQxjDIXv",
		@"YHkeBBlznEAth": @"mhXlOmeiyKHNyZJQUveZDfqobzuBIIZzGsMnwfscFqQLZGMMCvemonvJOzcbGWOGJjGVnaVPHWYcOfqdNnQKpaIEEKaXypAgHyyVApjhuleDKFWcSLKKsrBrVQwFToy",
	};
	return LHZhbiifuM;
}

- (nonnull NSArray *)iqztdlmGLdYjypkdoU :(nonnull NSData *)aWfeBIHuSULCLZ :(nonnull UIImage *)SdYrmQCkgezgmW {
	NSArray *bLttMxffDbPeq = @[
		@"MXuPpTWuGKizJstqdVkVBIKhOdofknsDDNCAMrDbwHlXHEnKRvBYwoypaMnPyhbLBNxBUbejPVDezgYZTVuJLNZSDIcBjZCflvRyOaGcTosflJMyxES",
		@"ZwgIxygrceEpKvuZLbMjXqsbIBvMQIBfYHtXoCwKfSneXtXHBtAerZwSTSGooqCEMlQggbiTRTuryVuRLICYcFqTXsqOLQudnVOEgtSTsnxFAWBHWdfAZrOLQSilPBOy",
		@"IFfVDjTxKBYzNuIVLFQyIUQJcodLVVLOjCBghEzUMDQyFonVCFCmriOJaJOPQTXdNsLhZbwoSiBjZohWlBYJShvJpNauqkjkEnTvhGziATwBYmgQMFPXxtDVNfkIb",
		@"rPEErTJcyJaRZQrYDzdoyKqikoQwRLSeeNNJVvHxRKmEgWUFbnxXddAfgnAcQDbeHxJhVpLCBrfjGjKmMBSCPrRkAoJtBZUDfJLasbvxILYobjXdorokg",
		@"iltvHMnJflFfgNZwukIGzJPMuJTyQuJPOwMOWOscdIMxBGJgsqsoqpytAAbaPHimgMsZmdlQefMzUxDmbIutSDbhHkOZpLqlghQZZzKfeWJ",
		@"yPIHGauSZSCpaSJGwLsrIqwZWBQzRAwMpJtbaZSzbimKiCUlbpvlYnrFuBFhnRobyrCNLGTZFznahTEenaXiqFDZvCbtvyYmdXStRGteFHzqaP",
		@"lexxStjQeDypdsWamOykPvfAxgOLdQoPUeZhDUHzidzyRfspzvJyYIfLGitopEWbgMmJnyEoIBkDFSpzJFioZqbeaOGMWRLrDpoTmoL",
		@"pFoaTThRpKILhyKsWkYtpbvjDidvOZCTLgfrUFFzmtSRZkXimIlaOoMbAXtXGQxnDpnpxChAdhDyqahYsBNBDbfZmTKnPwJJokeVGzpQatLjlHWLcKiuxnVOlcWAbzvFLkmwKhfLrDRFGhKlcQ",
		@"asbHjNInsxIzRipcIrGqvopOySaBSXyMZsSvLqKxkNSwqCoXtnsIRjQYGvWmMlctRCgIlTApHVNnOfIJZLCrcpkLYScgUEBTtEzHAkfgXiDmAqaalcCqvBvmdfxTWeTOyMKrzQh",
		@"ZgSkxiQUczinvuFGWicfPqnwMgkYsVlrjwmFFIQYjyuskgSWNBqZxBRLQhElWoPYoxjFAqqOMsRAsdUDXjuBThfPCvBpXhUzuvTvksWQvVNfGGIDV",
		@"TqaJjwkfSjauiwjKFcSnTLevzgDpTIzdsVIPBknagqhoTPkujpOVnZGhqFoHCJXWhmMctrmLMCYwHkCZFVwevxctGsWXXejLYmhaxDNccKChWiEmXgiJlkUeZOxPKQBydMkQZdBwnMOUOXoHS",
		@"HQNhSnEYhkcekbRPnSyWezGXOXuLmXxVfSuFHwNdFUjyIpNjJqtSNVvmhbENSwNCKlRzSFeOoKbQKQynsqUYsImjgEOBIxtHbODXSwA",
		@"ueBwjCPPbNnMiAwocISJxulHOwnrlhaBRyyhuNyTNqMamtIinZEvALiQWcoGXptvApGAmyNUGEXgZlzRwXsnoEJmmWfbNiUkOnrKzYwWCq",
		@"vpqnxYewdsfNzUtqsYQiMeCeuLIOkGcOcYKyRxYFRCTVCfVmklUMzEnMXVEVntXDcNhIYTBGuajfBeZntFAxdKZaJKHEfZNFGBdUVttYgVMY",
	];
	return bLttMxffDbPeq;
}

- (nonnull NSData *)FCllzIcRio :(nonnull NSData *)RJunYGyyUT :(nonnull NSData *)LNKJppVVoEvecZI {
	NSData *CBiBljRTqnsAEyxEmA = [@"TUVvNCtImatWwsPFYydjRJGipRDHhWrFESSLCFVvdSKAmljWCKOwXVJTRysaoMpNxGPWCGjBLZZbDuaqTQJvGRFOueTiYGATUyMlDuJzZYjgklbCyOLJNWavcYvLUFlrIuC" dataUsingEncoding:NSUTF8StringEncoding];
	return CBiBljRTqnsAEyxEmA;
}

- (nonnull NSDictionary *)LibTWUwVIQPGktnM :(nonnull NSData *)wVYqwRZhrgFep :(nonnull NSArray *)CszFHGFyVHed {
	NSDictionary *IHpJxbwiNOsU = @{
		@"ajmDoPwyKRvU": @"VjbldWLByMEPtFRsmjZECJjVfCulgPrVGERfzKxeBDlghkpbtUkplJMMyftfKjLpjUagxNaRTKUYPVSIsmKbvEvvlCbeihYeaOPbJufsFma",
		@"MHAcHhinNzBwFmWCGER": @"XaxkVHWGHIMRTcMsSddkaHZINTJucNrZwjuRKTNjmBldWGMHDBkvngvtZATHsEuvlbHiTXYLnzUuEJMMNLWuThqeJBHldUCkzCQBUBcbUjDMuRlmOQvPMnhltFBgUqvHlpwrsPixILTjnygxWfjF",
		@"RmasYnvEcmt": @"mfMIEWBaeVApuKVtpEwHHesecmhBmsBVIPXWzqYmeDJmIQXVPRxhTbPibjhaygdyIansZhnionRJDXAnutCIxllgmpxaQuKmqmObqiHUJ",
		@"BDctRYVQUmNsZQrgcX": @"WOoKLrNBKrPFtRPjMwJliIWpmnxgipPjWDWqmaTRLlkpJDyYAZeEuteAYiBMrBEHIftVkuNPATCGVSrVHrPrvuyTWJKVUKBGbIdbqCMGylVZupkhyIrHAySfNAmaUOqrmnjdVAQlxqKhYSPq",
		@"mhEWsbQdekUC": @"FOnRNBTonWRIVyqcuCAWFdIlVDKZJuFEPRPklBRFJFgpVDfrGPrGxFcYyucqcDKGUYKXIszsIkixPeQFEPHUTsDapWsuSCLwdnMjmzPrPNmcXohxuqVJPaNAyHj",
		@"cFnSrKjDCMydLohBuA": @"WvdiXulvXgoxbMnakqIBhCCYRNSORFOIqlGWKhrsPhxknXBTABxwgYqEHhpBXTcaFbHHnVmYGogjZkrNpirNSZzTUmtoNAgyFVaZZMCoOYJCTQTvWoebvmneDX",
		@"YybOpAlkSUZe": @"YCEoJdgIreYSGTBOxScSkQDPytijIMqxHlaoxlHSmBnRTIlChlfqMMSquOiQUNhPVJWLesWbEojGcfMTLqLxefjxwAtPGiXsuLEQNuKCnbeD",
		@"tGHqWoseRp": @"XcHAOhXSStJndEOmLTGwGbjzPGEYSItXTeSNdIMHkbopcfmvTcyMzhzLaLzUmfhFDLETYSkyCQSlUvROWcjOcEuPhfJYLmcQjatyCUcQWFTaqfaJdpQxMsBQyUGeIhOHryZNsPlDMS",
		@"UCNcyizwBUqj": @"NCKsXGXomctnJICtPvrZqTtnSmpEqlaRKdInfdEUhaSaBpaqxsdQpjfftZrdiJcygEFfhqQQUgutFkvtpAfHXpAZXSnWogojzBUfIkppUWHGiCSGhIrYlKoILBJDuRgOJomqVidHJfhRhvTqcKo",
		@"ezRMiYqCKpBKpN": @"hKTtrUDYIiMMkYRTimGXYwXMWuejzPcZPlimLYokqwAAXyzWrudnKFmkzdIOIUnuTqvAoYKefngPDWbNfiNRQuifNUBWlHsvEOczjCILzElGsIZHRBwkk",
		@"BkORqZhoRkVyV": @"GDiqALLLUwPOGQUGnAqmGxNmcHeVJMhkkUWMpKPsgZaAiwuUercBrZidfWVFsbYimkCsilbXEMaMYCNNLLogdFqEMwNXwFbZYoHI",
		@"FQQDPOFPviX": @"wvpKcGcZBuLbnibqEMryySAXXMsdcJaLFzYbtHbzgNuKAkqhrLZkOqmXZtArkvnOcxgycxoBHRTlXgzhJulKLKIqvHQpWsrTtmEOKMWSUpjPJvZMvsBLSHqHlLAD",
		@"ksRSDdhedPcUuKXl": @"cSSZANlTyVfIMpDptOitOGXAYNlsgmXVwTmIxKgMYyXCxCgCzzFeFfAVeSLFZgVjRdgRThrCQQhZUxoZpzuuAEFaosBuSowKNovWnPXQYDjQypnFEWzybhWSwrL",
		@"kJZwsxNWXtyKBGyfDYL": @"CPXfJnMDLtOBjercLDNNnVNyvkhDxrNjZrYGdfBfLGQjyxotlVnELEdQtJsYEluxeicHelIiNTHNdDYyhgYgnEjbCztuTeJeikNAPhPUkoebd",
	};
	return IHpJxbwiNOsU;
}

+ (nonnull NSArray *)ysvaredyPTYkiAAmjTw :(nonnull NSData *)CWEvtrpPEGSY {
	NSArray *ygkiBZhLBjIjxHLjTT = @[
		@"IgrzfqemGseHdBuDkdwuLRALymwzxKqknehnrYROaOxrPyafphLQcWstsOAIomOVBHIfSHTTjLApIqsiANPMnOSTJzxElgUUQdCnmRQIJMqRtJRzkuHNjAjdqiMCUFaJDdixhhvUJdDe",
		@"tSxYYnfpqwlmhahQNkRTQENsHZyifAlAtnWxRHebLDKfQiNfHXRxopdxIhjqkbZssNpSHdsXjxyDtAfGPAkEhdJNatgonBbhRzgLMRdjcNvxUVQcBfmNc",
		@"wfHttZKYgINNUQGxbFFdUzbFKAStDFdvmpGQDiioBUMbsJWrpmdTvIPpCTpARfZXmFipnJuFLDLWCjItfzPCbMRcvMljwMRKQOiCSetqMMCmiNIufQIYCfuUImPDtedHcqvlXTImJbcHffY",
		@"pCxzLypsWdzzPMHqJuzwiDJqQOmsGqdeeLYEcviHorTjefBfTaHoYmARwXEYVVCycSKmOeBmlrtFOhIyRfuJJHmypjwrmaFqWMuKUAPsCxWjrilrMeAMibXZEFCoPeGsfAPFGkm",
		@"adRkCvzcEXOVJGzSVVKBkiOhpIvIFBeLygapekgRNkvIbGGhSlgBCLworbGArDixDfFOOqotBqRewJvSiumhKCSYafsshXgGFopLwTfKyDUSvqoKVNcOqKrdHxPbMrYUfYaXetrTOZBxJ",
		@"mKzjWUrPoJCoNgcwBUKMTZRDvhrkjtUanJubjmQAkWTTPsbjvIXystHtMzsviSjDLeDSnUObPUoowhWYGJbbIkEKZUEVyqucdMtcVFcLeGAQIGGEMQSQtq",
		@"JtApbxmpJbFzYRjJQgcDlJDAuiNpVTjvszrpGEkDMSQaQTXKlIWKfheueBdNKPwaFwFQhGwqepVBtxcYmZuCoXopaNinkgJFKGhkf",
		@"IwPTXfpiymrMZSLHRQaNDkzhTTJpXrUKyEPUbbNRmzZYudcaSPesIEQgLxUsUDrUTaJDAKomALtBPXxAFycsPCWBwrSedrvVuBORuHPFjLyEwdFrbYXRADhBxUroVGBjwtOliOqyrD",
		@"TQRZntBeEnZgkOEGbbPynFeiOrEHhCLrDOyFLqVpxGvymJBMJVlTHjzwEyaMscPrkIlbtIWNzRIbTNodkWGtItmBTtoBZMMaFCtnxbvUNWYaESbHpXqU",
		@"rmlmEzLXIIVNYtOeuxLWdxCXNlyKwSGXWjjqdxmEvhdRtgxYiWgEyGLKWzsssmoYfJXAyVZRaMtnvTqFxlpAdccRolQhDhwGkIPQ",
		@"XglWqbeHXoAXXoiIoVkZIOFWWNCaBPkNKyhJTQJKuYkAdfgooSvYJZSFBcLqkLZsExtQtloMwIMLEEZWHLHIsiRyAadCIVymgXXnPrzwWVXSnubEARjpMaoeAqZuoDxTpPUPyamaeilvorKOngXoW",
		@"wGAeQWmanWMjSFGDZDwsjCHWAQvJVmFtBWvqYPbfIAFXAUtOpeCadPdmISygoTCSZZfnaKBhbOZZBuEXwCGfsTpYynwwwXZElJCNGMvXeYvbUPuNXdfBHmCAxtSSSRfRDLrK",
		@"LVirEPLbOGjLznwTFAEjPmRdrGvarhmpseufXIvMGKFdIvdlqPJvHXtrvbfIHVjMNsgrPpmNzILpaNuROZXmBlwIfXZpSOOlSbrfXHy",
		@"SZjdEuAKOJTZLOPUCdAKuaiIHNybXVnjspwsSaYlZcYMeLQjEmRgAMvjSAPwGjOrZPJSwjSHvwooxGPoXGDWyZrlhNTpuPZejFJGNvYBYNctKuNcIWaiZydMpryDSCMjcLXjl",
		@"axCpjcdXmaCwoToUMeVLICQzOuBJKyfUczBcqoyeMPjKoyvtYdGbreBtbxwyTPEdtnUyJTJCjipSleyPIRLzUzKipddTAOHWWzebJcVRecLetxbqMlhaTTyPbAYMrElevrpm",
	];
	return ygkiBZhLBjIjxHLjTT;
}

- (nonnull NSData *)YyFDiIhNhBQ :(nonnull NSData *)UOxTnysWmsb :(nonnull NSString *)sGOSFslHAUDhmLMvuJ {
	NSData *iYEoAuTvtWYkxanhz = [@"GBBuqizOBcczpWYlKgnYjPvZvFVZoxIkRyPcJeRJreGlIBtdzTzgOaKxjnEppoVasazSMVHuJXUkGqbFipSyxDYtLhdNgBiMtEEEtFjKcCKEykSCAwxPb" dataUsingEncoding:NSUTF8StringEncoding];
	return iYEoAuTvtWYkxanhz;
}

+ (nonnull NSData *)qzCHwvqutMZ :(nonnull NSDictionary *)wNDsuGjTuxqQ :(nonnull NSArray *)llcemRwkOROfLsk {
	NSData *zCzGgNVFNQdzXlOl = [@"HClcgrQySaPMZrKMiYvqXFRsweyjZmvZHyrkXRetgxRvjKbosSkbHjcuWffvMKSdyPvnDfvfCHMZMOGpzGOIZtbGEqFzfIxuizgHLTQP" dataUsingEncoding:NSUTF8StringEncoding];
	return zCzGgNVFNQdzXlOl;
}

- (nonnull NSData *)BYbancbelyyCkuKCUdb :(nonnull NSDictionary *)CEDNxQDTLdtrjiLmz {
	NSData *AZWfFHCKYbyINzI = [@"OEoCPLmKFsyrAyPUhqGaGkDaeFghxlpZnESyQFBGoyVPSMdOcIOADZOxgmFkRdqSgXSVcWMLqTuMklkXoupbeMLcFVskWysQnDtYVmdheNLXFznFdxDLZqYEjbLgKOMCCFAUXeMh" dataUsingEncoding:NSUTF8StringEncoding];
	return AZWfFHCKYbyINzI;
}

+ (nonnull UIImage *)ggJKpOEsolBJtBHHxy :(nonnull NSArray *)seCDfutWWxwlie :(nonnull NSDictionary *)CyKFatNxUy {
	NSData *hKgYzLxFfOc = [@"EqjpqhodMGmIgPYjcryJBCkZgkzOHFoUmNnuzMUDuLgEwOQlurEgGiKdojnajivzWACDeruZpNaEISxZhyCYxAWqPPJgCZAUROyubnAXxmKdPyPMGrAcQktoQTLCmsTvKROiVMqKHVrUnZaSlHvz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LowncfXlld = [UIImage imageWithData:hKgYzLxFfOc];
	LowncfXlld = [UIImage imageNamed:@"VWmiaoFYfgbxeczBPPiJPlnFluuksgLqwilOydqhGWLcHcyDEXJsEwtIEGtlpNyWWBcwxlMheoZXAPDsGbJZPcTAlpYcxnQpQkRByk"];
	return LowncfXlld;
}

+ (nonnull NSString *)UpMKrfjzNio :(nonnull UIImage *)oVnMChElpFVBgrLSCWp {
	NSString *CZhVNHaNOIt = @"AqCmqNIgArxwbitOqPCijPVadiBJHFvsdpkDrwuaqtvRLgrCtheimDZYstfbEsAiXVUGYjInfahABmhcWeRgpTrwpGGBLNTYfxdtcojdVGFRmJvq";
	return CZhVNHaNOIt;
}

+ (nonnull NSData *)yavQKVwweRLlNdbz :(nonnull NSString *)nyGyriPKIUUyWxuVRD :(nonnull NSData *)FqHeCywrLQZtouKgcLG {
	NSData *HeBizTIAIZNiA = [@"SpGMGDHIZalpVNCyYyqmaEqSnqBggaFOMHRmFPdfsyXJTnsXyWrzbNzDBmeyztySCyykUJfIbCwptejxpxkHrBdyEPmkpHqfWHSsMRunFGInYuuDlVVCXlgusWS" dataUsingEncoding:NSUTF8StringEncoding];
	return HeBizTIAIZNiA;
}

+ (nonnull NSArray *)dncBsNIpuLiK :(nonnull NSString *)PLvbDBRjDOSmleZVHWh {
	NSArray *usaGhJZWoYsShhwPm = @[
		@"OCaGwsQUzVtBGscZmLXggNLpcnKtFRSxcpSVkqTjqUEALSfWGHkRGEMzFxCpkMMdtPzozPmBHGtetknRgghHAvZQeOhoRnjkcjDWrbcRkCCeUrQghqOG",
		@"FOahKIaLJOoBTczgJjGYmmIzeSTShiLdxzKPeASayRwWXLfLxTTmbZvTyzdKRqOWEXZjZAtPZsZqirzHQKyFmMhynMPCWmCJaCCuXjri",
		@"DezFvVtEPjMtWINUlVRSbfpylTtOjQiEHSIPBNWoLtoPPzVLvDuodGJSSkOkZdVShTyBbWtESiNFTiBRalEsiIUqiwidvkRpDAECSQTHZgnWngPqqji",
		@"OkQwcdaEZfxtbLoSJAXmsdErAhcihCjazSlbqnCYFLgvftMpmfwXhwoBINueTojouaAWVFJjWUsdlkRcPNfMhTHDEtdDAFnmwOwQODYrkSDEesmQwdrnLswXNghKqBOkUemdNZoauouUDOmHkak",
		@"afLBJtOhHQcJgVNwbrRKFWNCUNULUibHrHpxGvBKZMLxLaOUomrWZSWKAVmEGeIXnKXRmNrJluCVFtXKkRJOIjCVPDYoBKSDycZzdPuAuNFFYtvraLRbGHkxboim",
		@"FqqrHHXuUrSlbtgkOpiEgmzFajhKXIyBzQjnRBUefhKTjSsWgfPfZLXDofoQnxzGGSkcCvqlSQUlyGCzdYfmcTovUbgSEMDOdWDmrSvmtIZDUDtwjqBwKA",
		@"eSWmxVxqTrEoYgBwBexcXTEVIIAsxIcorkMsDxnAPprXXwHRuFWhNFtgjxBgrUYbuUXmdXyzqocwBLBAHiIjZhYATtMODeHZuEFHrTvsRJxdsjAgsllTcAvBbojrBABNOopehgCgpFaInAANIG",
		@"DziVmEvtRyZyugVHyvaqqJNvEIMTVDxiQlEvVVZcHgIDEUGucFzTzAxfliwXrnRzkvHOpmfcHpVxBFpxiFWfTMkZfotjzhdjOEUTFnIDinjNQyavEFaRwsHhwAyMCVTNW",
		@"eFmCNVlprOkDkCGsqsZPozHZAvLtPKelcIlbVFowmxKQNNAXPxPFikWxArGAAExpAmstpIFpVWyIEWKjZKNekbSrAIdbqiNzOboMpqlSyZUxDcVBcTOofWkOlhsPYnlLkfSURYkvEqeLDDUVmsPf",
		@"tUeIDcLlwQGRimFNoxlfNHuSBiswZsbOiSVhaMXivMvFQxjHIHgBFWVTEgonQgfYjTsumLMRVNXVeGEstptcDdqiYTXCuWOcDQcKgSok",
		@"EbjsnmNjeYlKYTdVbsGbPulMQjleZFFNPonRJJOzJbBopMHWtjtOACGMCeAmvlXIFohLvyhOIAqkVpoYZsAZbQrYPMAFcSDLJgmJPkKMnXURWrAlHkN",
		@"AwxljRPRepmKzfmYagfwVyeQLAjTLzDrWOyEvAbzoovMUbPLhtyuFYMLwtmkCrqxqGtYvIrVukxusjLdCcRAAtnKekKSgkyhkdqrhkbNbcsS",
		@"CSDAesCwnUpgksocMfHQpoKlopNqFSEAWnPSJnDDaDAVQknEDyNuMjwClQXTDwPWMxlHxvFYLKYywTExtKDUPtfdLVrzLlQvSGgqlUSTpoIPGLgvZQbJZTcHVLyrfql",
	];
	return usaGhJZWoYsShhwPm;
}

- (nonnull NSArray *)HXaaLHrAksAwvvnTFF :(nonnull NSDictionary *)VRALYFpYfYJLHV {
	NSArray *ptwkXgWfOS = @[
		@"srPmgFZtUPniJPqJCFQfAfzOyItiFhmzcjDGcAhjKauQNqEmskNGeyjNaFynGTRNPnFDPMdYiOHDBnQyNYHKRJVDuvfPLfiRperKUZYPpXbRMJVgRsFFHAwiCqwFXmhWfVvGIZzTFuVR",
		@"XCNvVPqZRwdbgOxOhxJYzbhskfhFIzpsUMThLzzdLTmdtkJoMtYZAMzTTDzYHUYpoaGwiVkvQpiIPMxzLKGELQpoLBFcImijITpEtAYJLknFEozJVemfCKLLnCCKjdnprCdEeafnRmvURBmIjK",
		@"uhlGLKDHTladXciKjxmpQebrOQtRaSOGzaogVvMaaXpHOMDAzOiHYwRBsxZGpIrFUbDWhfgFJCoHgUYWsezDCUEWHazeXMsQZKZUqOtDeIORxdHy",
		@"WfdkETAUbQpXZMTnHVsRyapikihXCLmBcvUtJpBMzTyabjDnlPpdGjjpTvbYwISEEexiQzWIJzFPcVrnLBcACaRCvfAOvilLbkGTgosQOGDgZFiXvjKLbHlLzQHFb",
		@"rLHlLKgDfMLgKBpBzIbvNGVWOWyPNOMUyFvBkakBibYVtxLCJBjGNCXDptvTcDKFWFhIoAiVkmxKtTdJkTxmiwhLRaLFtaObqSRMDEYth",
		@"jZnXMGzuLVMsOMobIxAlumVAhQFMPBeMfCgDujWFjGFyFDFaVgCWGVwOFbuAGKTEFPtFuzhUFrBImzWLImTRrFSAHmTELOvijCdQFclO",
		@"zOjZzwNpVNSwgnySmiyQVQEuHqhEgtcgYtuNIxFcFDVmrkLOMdOlcIIWOsCAruXIVxSJCVdAWTengTXNYAdjLSqrykuMPnTchFoNFLlVUleNcnQE",
		@"hOGhbQjJPmsVzruMpKEyYrZpaQrxbZvSMqqKnhsQevYaASsJRTFValIITOIssMXTWNgnuemFMblRXzKxGuffCtefRuuumvExkXYnnlkAYUqljJdSTiyvNGyXomtDHLAyloUHGuSBafcfsTPVx",
		@"LVVTqHHuazIRHCvhFXcARGTedkmIYhLAucbzBkczoMRZNXgZksPZceckRTrYvUDMWGmiXckqgmFSTfnOHhfVSbzetVLLJbknMUTLdqocXmnGcWhCXTdIljTqIOlqcTdUDSsgypQkLzrS",
		@"epatIrsxeuhGdiAHwoMuOffAVZevnDPOdAOrbqOvEspfaAhgxbLjsIRxVbNjdcXTvtLHcbJheAeNSwCBsjvuOIrDgCXHGvNMicFChriHEJixmnXtsRwUKuLziExlvRwclNEVLo",
		@"UOtNCyguDeszHaFJdANPvnGDrCSBRleEdeTRDmVRmlQxPbPufLWKOitRzsZdVQKVLGfjOXphUbmONmSjMbOAMQfgXLFCjzmGJDwBlbGSWyBdbHlnojMzxVdFSTrhTBKIOmQJGpGSTX",
		@"oPmTOXMtMIZymlEgdUOOzUQrrzfShEUgRCjstNnIcPYiqkmLMXBJBpuSITBjPNuZxlDjvncFEpSfRsHGpCTGyObHMgpiGKrUexNXrSNGaSNElNEzobSJoLuGcUyWIKzPr",
		@"NIbEXGEOLHjuCaZstPmDcukDJnmXrwzPIpBogzzQjPuZnRkuiUsOIKuPyDrPijuiKrxOdiZidXmxMTOkhqKXLQVlRhljhskVTKhiMyWMGqFvPfhytxCzESvAhRnMPSmMQKI",
		@"dWqfXtXklVYiWybgFwXNTKDKngMiTfbmGjnFreCufduqnfPlnPXIBghXNeMiuakCxecCvyygjnIokQSNbWKkjVFwIinGtOkRvIEmkWwjBYUm",
		@"hOfzmMzOnkOCxLygrlkDRuvtpreMaebCFZCeNDmYurfTWckvDCFOhJjRrgzOBWcMlMwSsaYZsTdpLexowBSUjXWeYGulvNVrSalcZoHreMEWRZtV",
		@"QyAhnuOKnnFDOzNSIwYRMRvUAnDRIYIDLvIKnRSimwSTeCSsGubHAHvUeSBNUnLiMBqufvXkxmrTHveRTSOBqfpYwyVCzSXlgKkoIzUaJRUVddNqUjplU",
	];
	return ptwkXgWfOS;
}

- (nonnull NSDictionary *)HxXAZqJKzhqy :(nonnull NSDictionary *)igPhJsXUPxhJZY {
	NSDictionary *iWhqmAqLqXkmrzgGy = @{
		@"xGMyBMewrbRfHPh": @"AADrEmIwjxdFoWRlnrOZQZRksXIuCZIdURiAheVgTrwTdtZQJFRMtRtbYDbxOETbvvfohSyofbQmfGmZMGTlpIWHnrYMJdUVAuENBIJmgrK",
		@"XEZnWJQkLEXR": @"CpCcGFTAVsoYEyORjOkfOeWabTMgznifeaEadrVJPzpFSLHWYrdcSGKJIwiqPYkEmbzbYYBjVFYDgFKQUIYCKNYKkiEhEuQUoEVaicsdZPqAByOlqHGZ",
		@"KDCCPfdIUkXCJRjWJk": @"vPRMJpdniLGAsYlgrpNjQRYYFfvpZzBzphqQzyCUvwPJpoLqOdwBtKmAxiWBvmTwVMgudMELbObJNuvNFxCVGDzmAcoFMSwyIQvhMJ",
		@"jODfKKrhnbHsQ": @"sllEjztSWKTQskGaHSgcGvLARgXuxtVeqIVIHvjHEBIoRaDuEWLkYgnLWxzNiiTXJfbXUQpaoaWpnzHgYImFBenWsfUCmtNgPeuOTlzmxoQECZhcCvSJUdmTw",
		@"oDLIqGAjLlqNx": @"EvcPzJNorvwlqEwXebfiTsCehCfKDhTSACoEElKCPYJifNBxJuFcWvRslOdyycmnUnhSTSAllAoiLZxcmTPbTFZJkgAYsZiqfshJgacAnpGuYtrhdYkcZMyzVzqXFgePUFWEmJUsrEHVhf",
		@"kamwVumhvkeHvt": @"NqrIyqrRWgKFtCkjMEeVyEJeNmIPvAeCDJojBcmVrrTYoHfMNtfKLLsBDDpTeSRgZfYAfwXUVXqZUQcTCZVOTLKkNRToYyteGaKRrOqWIzjk",
		@"KheguFieaOFUm": @"GGTZZhpNeyobHGcgnAFOpHIiySIfGeAKnScecgoPXyteSdMSqCyylvdmiFLGKVItMYbmhOdLfvoxViZbqSLHdEcdqzErjJzHNUqbnkgrNiFnEUUCOjyrwDv",
		@"ryxoaQDKmYX": @"fpwYHjjaxYuFJflLdCxkEdUQwuvGafPVXWRCwwLlWFqaWxFTLqGoUCBjPtksvKBcjRHUYjrCAxYYTNaDYzMiHgRRvSrhWVERBbFR",
		@"GmMbFVygmLBvPW": @"zZmMjijMDredPiVpXyjEFtXBtgUZzKazPTGuONBXtPpVwOCKIefxgFTxkIlHuBGmSlvVgSnbdJQNiIGCbBYLlYFDcrvFzGlQKAVktEyFbriqZnXtnWENSHQTWoquBwuzudxDMuvCUrmcjbj",
		@"PNXEfIGgUiDqQYR": @"LDSeurciVUQfKIDqnLWpuyWkFXoOMugZRroXurACGySFkZIUGPijQzcXpBFtWaGhMGQMewqEZuoxYEPuLXfLQpzxsaLQSvHdysnpftKEBQcCO",
		@"oQiToFGMDoXOAgREFUs": @"fdSlBfhyjAVrdXUOvMrXGXDtuIVZbqQlwIHgyboxxcSTzIlDKNoHiDMRpeAdSBQVVgUPhiDIWsotOpwrCPNOhtWesTXFfraqTzENgNEP",
		@"KrPlDtKoUBTvRH": @"zMYGSDWKXhxAIRiwjdtuMaISwKzoptGLQwRETCjPZlbWMtpJlNYprCZPoFAboWOIxdCnOLKmFAJjkGUjBIytfffrssqTPdhQOBOuznxvKzKWyqMDgBsmDRChDfnfSN",
		@"eJaxZZcQoTiSuK": @"paDJbbprjsOQxbcsrgCjnVeKMzhdDOpzjqCKtNFfOBwgUaDBpKuHhGwZLNeZcAMXvfeoQycauBNFZWWfkMBZfXmXMErUnjTIyYBStwiGZrgkVOqyTuJryxwGjcHskfKSEKkzQSFumWfgSjQ",
		@"PSmEsaVsusBw": @"QLgmTuVgwcyCbkwxzaMottLKfMxguubyMlnniwtxDuXXxSIlmyCBGqDDIPppbGKooMzVzIOkemqNVQMcgGzkpizlaafahHtsqNqvwEUyVjUAkjbvcZCJBmZqegGRnLFupYUjNWeFBqAH",
		@"UuNlmtaIKpOJbxYk": @"HvaHSiHEWYEJTqpnvPrkfrnxWcbDixvSnUccaXLEDjbGnArKXtzQxeZDiRcAMdyJzpYcNpVHUJgsXPdxKclNPyEqyeVTxULEcXIqKlvrk",
	};
	return iWhqmAqLqXkmrzgGy;
}

+ (nonnull NSString *)wGQsztvefn :(nonnull NSArray *)mEAFKgdJMkUa :(nonnull NSArray *)jEzmOHrnsatjx {
	NSString *StRDdwufgMVugzvhb = @"xzkUACLChSSsHhtLNpVqFdSTLuAFPlEPhdvmuxeOAjxHwHmtJQEIfykDleiAFOUYKQdUCkOZqTxrBeiRCWSHjRWmKcdEBbTsGitLokNS";
	return StRDdwufgMVugzvhb;
}

- (nonnull NSArray *)nOvAHDiVzHTVNSm :(nonnull NSData *)EftHotwZcLUxsaN :(nonnull NSString *)ndtzcQQjDX {
	NSArray *GNFggdrREAXIW = @[
		@"PODZfIFbGyetUwZwMTCfwoLbroaCOLMYZqmGiVgpuuxDenldimlDuSlYvQJzCSgBkMNyHATobppKCjsGBmVlvCuoDLTFHciRKVuWMGljhRmEPrrjDqCsoTDbLLU",
		@"uiCNrYUAftjxbVHbblSAkCZygYwXHBXoIJjwzvMyljNzxCZAfRqURiWCWuubXFpAzqCMvFaPEykCxSRadeKITXrhlJUsyhniDKNuVwFTkpdrJpukTqME",
		@"IaReghCHAvYtBFBFmjxjYlKKmWDBvtSKFZKFiGYeBIFCeXEtrrQSwSTBjlfVSgxXLVnzRXvBjdtRpyicgFFILPmekAqDJyIivldBCTINnUlcbVHSirRhWjGmxKrfBiMIOuTCrPbx",
		@"bwnyfBateohgFdidbFYbuWUTiyApgKhSQBixsrnavmShONPciCciuUgYXFBBjsqKhhLBewMFsDOyyMTxIOcfhtmYkzXEOLXKfZgqhcsvQJDWnNRywSli",
		@"eiFvbGIXctlnqChHrVFebXvRAyHJdZAAoUGOOomMXcjaJAfxJWvEkevwWaafEksKvDaPxzdaGYjjHVIByfLAHLLDfJQAjoyuEBDWJOle",
		@"raUEZfpsPSMzupBnezPdbLZLlhMInIXJXKhpQYrwkQgwWwJpQozenIhdvaAgdVJvLAtqJFnmiIcZiuLSlJEkjDNCsLHKMsHsHfAnTXgmNYkpjFLdyXMvsjUxMXgCO",
		@"vYzZIACTinoaoRFwyZXzytexQPNrzDeWaFaWXJflNlBInsDuTWTsMeUcNxMaLehejpPgqfjvoxCNNvsVzYfRauKWjbGbrUfcqwfRYHsKbRqcSexwhaCssUoTyKWjWFNyRLwwlhRndycKkQELAdOL",
		@"zpZweqSrSfspYqogpYYUsqTsmvyOyNTMyEKcmCDzXeKxLuieQlQcQQPETzVMipKvfxMChOzHnRXcHPsVYsfhixUgiiSrBYnkneeEyhKaqRPSaHpYqeITIIOekhtCJDR",
		@"HnoYgpKpTyFHYGMEwVzCVsfdlKCEbfkwKYqEPFVkGvlPpJuVKnOrrDfMvccfPfVhQSCuNBpvZcMGkcOZrQtnUkjOdgTccfSveHdworkvjWzur",
		@"TCRtiiYlLIyHZsUAOklaFCrSJFpziLuslXTytuLEPLqzGaqzmBsyiICTrjzoGUUdfKmLsgxgttgdUdoZULgpOTItOFbLfhpEiGOmnCnYgn",
	];
	return GNFggdrREAXIW;
}

+ (nonnull NSDictionary *)JJsMMyzpWYQqhcSnr :(nonnull NSDictionary *)UcubZLhEiEBYwZ {
	NSDictionary *uEpktmeaPi = @{
		@"pmhnfWmDpXUp": @"FrjscpIrXyZBaUKWxNGvhGBxrjLdOtdKYSAckPPFUrCMXVklpXjFfmFIvlvmRGYALQdlyUJVfBNxfVtYdijNMBHpzMdZEllJGGiGVYNauXRCYBSMKMfii",
		@"waRgAJVpfmnY": @"UAiDhOBjyloGbkTgNdCFuTcymTQcpiJPakRQxXPojqvObCLdVGtisEmEgBGEZPrqwyYbOlrgtmiSFvvaiWfcriDcsxJCmldSqPQTecNQEtopNldNgycQMfgtxwvvXWJTqpDoGaCh",
		@"jfhsENBXyjWs": @"DdkPvxyIDUIOVNGjmVKAkEdqdazEkLpdCmbGFbvQYcFwKSieLgZBtzsieAzxxPUmzgDIxyXKBpjJrOVPLFpASubPhbPiaYBFchSuoPQJIbknGVcECQCOndBiBVAJticuNbhetKWKYftrg",
		@"LdbWixpagao": @"gMxRDTbdZBJrtUIPKzjWpxgMdCUevQKRjekBGDciOikoeYOCZKDCoVtALgEchKoZCtggaLPtMumbFrFzWJgnnXLeiTWpgsmDYZFqpUojPsUUBMzuRuhFLXfhMX",
		@"faDXzVtCvmlnceNOI": @"xVBSwHEIYFmmPooNZYBsulLDTAqKAJieodabvbgHuajDgAAFVQHCuFKvFIiErDZefrMiKNuuyxaMogNvXRdByFvBvdZCOciDwcyeZgOgFYxyfixbtRAfJAkekWSiHHituCQsQH",
		@"bCRQevhzfJTHL": @"ndGtLchqZNOayeFIecPKjtrKqAypXkZPEOhMGpGWvuXidlnVehqFoCrbCBStSqwTiezyzahGIXSWRXJbtIiMGENByOVPpnkrBFuTBlBHReZGASCi",
		@"PUefoJgHYJOCBWkjBV": @"WdLoegRrSorjZAjLfxIdbhkFxMgveYIFSEzhBIBVAylAoQkvmcvgFeacGkXKnyDuRjuoAKYWaHSlVBjyddqcvkvHinIUngRBpzIamkUr",
		@"bHQhoMJbjyQpgQ": @"hNWZbCIcgFZxMXrGhXEbGYCtQgSFsJPnHWsgHsryZnmxCiYDOmfpIcvoflTwJPQMLehhImrkJbuFhmbwCzZyRwPsKVJBDJQeOJsaZJiUrbBDBAHqhCDDMRINlISpwFWPNuRlEGQ",
		@"FfIuGbZlAkXrIlNpP": @"CdUrzXomUyedNYYQLvCKRBCupIXedgQsRryBWVLrsWpDNXGxrFawIXUzKVZtETPwbIFKeUQoyGuaoSnJUaquMdiSeHUAFZHHdmDWPtQfqxBDdnChKbRTcsPnRMPCsBmmmAqQkTQu",
		@"FsJWfgCjHLja": @"sqUFyYmLOdgCJZajZITieqYuSFkqLDoxmBTZisZKLMmcyZiOGfTiGSLEiGRkADVhrHtnJNTxbeoKcLQLoSCZnoMYxZTUJMktsdKHCMaVlgwOOdFMBRJOaliDERIpSs",
		@"NychSCIBLCpck": @"OukXomJFkuvsAAWwpnsjbLoqnYHOqUteQDZOHvSRivMNLmSdrcKaqGluhGxuOVySUSguGKCanlMBPgUiHGkVazbIgGgBfeBujOWRoDOcAlAeRxVDI",
		@"iYKDovZGPRPL": @"jMxJLJyUodgzMMCLTqjOebNHYYoTbahchYNwuuyaAKPcMaQDyTXyXVYaQwfsHdwwNorZDjUeBlTcpdEoNwMEtczyvEOdXtgxqsSunxlkbgoOmqnWzeWZqfm",
	};
	return uEpktmeaPi;
}

- (nonnull UIImage *)wxjFCPmUHJtJzrYr :(nonnull NSArray *)iWnBdQhouRjIKDgctF :(nonnull UIImage *)mucOBoKowrKWARDb :(nonnull UIImage *)UpkwOZDGtTN {
	NSData *GoMGQipCLXWUN = [@"SdVxEnLlDUQOjIarUCkWlQzsCwwNHjZVPEKkmXHLdHHhTFNRWbMtMMlKovXCDakpmkmEAPtOBrddjTTliqcivRhsWzjZWcTSgDeGZZhkuLJvSbd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *quudPVXPFzpmcD = [UIImage imageWithData:GoMGQipCLXWUN];
	quudPVXPFzpmcD = [UIImage imageNamed:@"mPRxvzpPsHwhOWLOqYPutaPKuQAPeETaprfuckcIfmtPgkdWlPHbOtbWwORldlIRCJjwhPDPMWTCEJstgjvdNEoWobtdPBIlRtwZUfKFOUvntoOrpMrmX"];
	return quudPVXPFzpmcD;
}

+ (nonnull NSDictionary *)WHzMkSgajzYKHsTpV :(nonnull NSData *)kSadxOrHTVbJWKzBSpi :(nonnull NSDictionary *)opABTxPSeK :(nonnull UIImage *)PXvqrHioMZGiujLHneL {
	NSDictionary *ZnHmqfnQcDXVX = @{
		@"fVLcblVbiVrN": @"vgUDgSvjIRByFkyWIeYbHxzSvoiaaNmNQhUZGawoTypswWtdJhSxkOZajoTxcuEUcbJVLSmePazcMbstYBvjwOthOQrqFtZVeUUAeyPqUXUiVJEgThcFQskujtwVq",
		@"uAoIYoAZAAQmVjx": @"TNMArNpICuXHmOhHpAEOOsIiSsULBVpabHRGcxDDrtRaQPlnCWVxGDkolLmnHhrFIvOAABKOiQkZYMcSKtLgCVbOTKVFkbqpxCKXaQmolkIxkMCvUWlGshKObTZpdaaIjdCUuhnNm",
		@"DCrUuuhklW": @"qQTNMryghMuTSFbdwtCtkinpbvlcqJSqwrsNHBbraJatsUzJkishSILUtQJtaJGXzuqznoXyKdKxVQYfzaAJipQrIyrsTBXuzqYlHJmMoNJnlCFOXGUaftpWActCpsllxbJtwtONBortnNzQWhp",
		@"XsGEjPMEcYNVDinw": @"FnJvrwdQxZnexXJdSXHjLnNqJlWRztJCLPOqxrpYcAcYlkHBQIVqXHlAuqSvCEzboKlkXlnbZyhxGTIlopQXXtutcElNHvYtRniDcuwKRzsSVXlvwHgAenEqcKwOhKJGhViOUwXIMTFQTEQ",
		@"rNsFcdMYRAGpNic": @"DBvfezbKaqSZRsNufXSopuxikbCuMkbfCfZzgCklARkJVAoYluBWkpQsnoXUtOzkkcewucsBPSwdPQFLlzQWRMybiqxFyGoBnElmpAmOkshiTQTyDED",
		@"ADGanYCmOwppHAsI": @"nwRmyIlIWwjAZwOFZeBFseAgqFVeMwNKBxrkgqhDvzFqgAftGvKOCOvKLUPpKQagtTsNJpYOQEmnMPCrSUkmBoFKaXxPaYWnzFeXNleXqWlqIFOrmzjhctjWkKsxLIyIotUcpcztUxErUOZGLci",
		@"ewJaYwpTiXELgLA": @"MZTIvQNvxNaNlgkcqZIKqUDKGLkzcBRIViKiGHwYbbTcLMxzZAuDEkazUdZLelwqDLBpTruIFPbHuOjxXBgiuyJtIEzNYhYwqjXYJsEiNUtcFWUkyukePhiQOVPVvJep",
		@"TRvaIAsNLPP": @"xSLOQeFlbiDKLuvvOdjvLjYXAhKyUACaPSWoCZechwOTEfmxFpPsdwbkKPEwdJZJNTUQftFlpdqqJzmHGPgVsryuLhrXZGghYoBT",
		@"vUKWEUGkRH": @"HaXABGKgyQdPXdEzaPkEtXggEYteVxRaBnLssRrqVHgNrVIQalDWpuuNmRsTINcJFRxCoNuaxSnZPszTkytbHRucekvnyjmqfELJVJbXANkOeMAGLyzyKCXJnCWZHMeefvWWrMHVhrfQDLCkmeyi",
		@"WSJHVloepvxmg": @"BWDmywatCdGbneoXmoKCnTDIuiDJBxSGRyYnxygfNVnxTGpntwqwHLjGFiRtHHFdeCfBCEGVstDxQLSbVkSmvywvKNIwXcjvKgTEfsSbVtbRSuzfvBOZJuEusXOOF",
		@"VQIfjdQncaYMFOrgBrm": @"DnsjiOfAnRnSPkuBMXijKnEoitaAyATFPUOccGoOVPgDFxwDBjgOicejEHRqRCCFKwScLoihOljtFTDAnLTxWJhyyECuGnOznEpUqtYnJKVHOmi",
		@"mEpCNlOiIBvQpSew": @"GSLCyWCdmvPbBrnKZhzkuGSTvSGNcozfKDmFPzlSgHmDIhKrdGlvskapcRDEsTveJNioBExUSjYidgDBwXTefXkBukEKojQaFoiijjajKfBUyFjUpdWTGNKrVT",
	};
	return ZnHmqfnQcDXVX;
}

- (nonnull NSArray *)rgqarnXYHoTFZsyMWdK :(nonnull NSArray *)PwGkaJSxCxwFiYkZGo :(nonnull NSString *)xLCcyGzPjpYuttPJJwk :(nonnull NSDictionary *)TXJRyGDiKJ {
	NSArray *CAHeAFSnPCgyHd = @[
		@"AeuPmkgplARLRWPwBkfHAAIuNEIwPtDymIWGhMoTezodrxuANCmGuWTGuFmxIdUpJrdCklKNXQbcLnySgNGiTExLHRREAsVLwzQnnJxiyfnzCkKGuBLreoKOBnVmloZMRBMVtKbnhktS",
		@"pibTiPusatumxSPbDhmYzHNzTJXlovAwAhHnXRlaNOsSmXLJoIVPNlUmakbwFbPUyhTOzMyaFyCPLPKFxHzpgRfOYzxRoUhiVmVDZvAgdCMuEYzLZwgAzPjPOfBguaKpKEqWAwZmWSmbHhrypxQo",
		@"AyIdtmowwNEOnDdwAocSslzpHIkqwabeDXXWqPRqQPzTumyOpCKSXiLziSSGJWggjuDcqgdRslCUrHVGyMeyWbcODuNzCwYXragPiwiuxxuBoANLWnrKfBYNRjwmStCv",
		@"uYeESOSaqJEdpeqNAsqnoOQkeIMFSuCrRsdMhElMrmLGjrjEAouiehFMYCefYAeGWjBjpPurOfPPwLloVFLEBIDTjhiDIPZeUkWCFvaVEkATfFrKKEzLMqx",
		@"GIjMXdVXInisBhBuLEVOHbFpIWsKEtiURtDcPCgGgbFeXdyxyBdUyJCMWSWDPxDrxExpKxLuCDPcFTadrNmQqcmuoWbetsCYZFWrPSkakLBwpOUnJSThcxyGoTrTwtJbYNxpEbrzkhFfBiwIR",
		@"bVirZMxcgsvjNihFneCpHuEBPYtrgEdRlIfncOmLgXLkxZrqlWoEmQkUicwiQvQXMxhidGDpggryOwjPtHYlinBVOruQhhuUhcSDdDcTSlt",
		@"LDKdcPTqoHzyPIlWCDffttDHwgkUKeiNbTtWUZZXMZUArbZvTuThKcDovjeWIYGJIZFmglfTHmIQneVUWCMHHKvvbvNHuzRCNUOI",
		@"kWOglOaxrmkoZvVbktuSeVAEpIsabuYEgKZdYjgFEuvtHlvlDOTjYeTcFdLHVdoaFrroqgCpKelGTAuyuGrSspHpsOiACnCjeLNPcjXbyyhhOWTxWREHsRxUhSjBmVpgqLBaepgcowEINWKfIgQ",
		@"tTUokPmveljxYYdiBNbgFNMZXWCgGrRPPyRmbLINlcdJJwUEaoCIzJueILvSUKVZrJTCTEBeXIQEGeJrVeSOoRcqpvMmtyDBiDMEWAnEZkixoUeAEztvyJhXpMzzzdQBGBIxXEvT",
		@"mUCUItOFnTVqEkpFRZvxTzYHEhCGOUYPUyoyYERpOUEpZSRSNKQHfMDSMjhEfgGbOvydMthhZdBSRdWxtiqwVQetdpqPbltTnGbzxDMPBsogIPwWSlUyUefIBnR",
		@"MnnXBvpOzoHCgHTEzndrCGHyAexAOgocsSVKomBBevBrdFeKKbBDrXOyYVDOKwKFfPFyGkZjwGBUEurWBfAYnjAAVkeJGgBrtqVCpbYFkfvDZM",
		@"QDljPibojycUfpUUEWiFtoRmfJJDNrzdqoSwvfszXyyepDUPaVpkPnGtCrOsulVfGJvZUCisvKtybZHojVDOuNNYOkXnNmSoHWBlMHzTwnyHzsEdGrKEZLFPMfJwUPDjzcUYMrZzNvGOQGoUxnhJ",
		@"jcDNtvbnkFWTtJASsxxAXgQPbnlNAwFUbQnzVZUBAdkQAvTYaaNsivKzFHnKhHTyndnrvBugpfGqdzUxsPxYaKESltVGiUnTUvaEqMiYgAsVCRlTPonDMDsdSDrbV",
		@"AOslZKXTZvdbTWFGdJLCISMKbuzmsrbIQCPKdANnHzWjQHiGEmhjGJWYXeLGZDQffMbdtAASrLXCgPsdQFGDTQxaSUlNWQiDhVTVnwysNFoBewzbQdkxPaqKkKiVGYkiiChbbPvqRclZt",
		@"ipZyEGXwArqJoSjFtFxxUeIGQADGjfXxExSLJsPzganbDsvPKZNfQxKBvxivMkGXWfFtZcGTggmieFAzYqIcceloHVAGNMeMBrgyHOpuJrRifsTyRmJeeOzdMAzXAccNnPpXNVugn",
		@"zZydaizImeYIloVAPAxRglZWJSsQMBXefbBvpptzMIcFcWQEgZrOKEOjQzUCCtPaQqcSLvtzcadrdMLrcGwJQxCXeQxWIiHbpuOhDJcdcydtrOybvYNyHuFLlOuwmHaiS",
	];
	return CAHeAFSnPCgyHd;
}

- (nonnull NSData *)qWtHZDGQDqfCJN :(nonnull NSData *)oVIrCUgDHc :(nonnull NSArray *)LfIoMrvrVWErzJH :(nonnull NSDictionary *)niJQgPKSRg {
	NSData *gjDgWacQktiK = [@"OjMgdBPPpbVUaAnPwcvIrylKIaIJfKzQvEfKkUOlVfAjKIPxYKosduLUbYPnPWSjcRXuKzAVTieWlYwTeLtiSVSJafiWKXwLWtYCUnbbviCMiLxhWMfuBnTslsPEMesMcBoVjCtGs" dataUsingEncoding:NSUTF8StringEncoding];
	return gjDgWacQktiK;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(15, 15, 0, 40);
    [self.titleLabel sizeToFit];
    self.titleLabel.width = self.contentView.width - 30;
    
    self.timeLabel.frame = CGRectMake(15, CGRectGetMaxY(self.titleLabel.frame) + 12, self.contentView.width - 30, 20);
    [self.timeLabel sizeToFit];
    self.timeLabel.width = self.contentView.width - 30 - 50;
    
    self.sepaView.frame = CGRectMake(15, CGRectGetMaxY(self.contentView.frame) - 0.5, self.contentView.width - 15, 0.5);
    
    self.scoreLabel.frame = CGRectMake(self.contentView.width - 50 - 15, 0, 50, 20);
    self.scoreLabel.centerY = self.timeLabel.centerY;
}

- (void)setModel:(QuestionnaireModel *)model
{
    _model = model;
    
    self.titleLabel.text = model.votetitle;
    self.timeLabel.text = [NSString stringWithFormat:@"截止时间：%@",model.etime];
    
    if ([model.partake isEqualToString:@"1"]) { //1未参与  2已参与
        if ([model.start isEqualToString:@"1"]) { //1已开始
            self.scoreLabel.text = @"已开始";
            self.scoreLabel.textColor = MainColor;
        }else
        {
            self.scoreLabel.text = @"未开始";
            self.scoreLabel.textColor = AuxiliaryColor;
        }
    }else
    {
        self.scoreLabel.textColor = AuxiliaryColor;
        if ([model.guoqi isEqualToString:@"1"]) { //1已过期 0未过期
            self.scoreLabel.text = @"已结束";
        }else
        {
            self.scoreLabel.text = @"未结束";
        }
    }
}

@end
