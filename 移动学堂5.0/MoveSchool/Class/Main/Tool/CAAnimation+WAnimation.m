//
//  NSObject+WAnimation.m
//  WZLBadgeDemo
//
//  Created by zilin_weng on 15/6/26.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "CAAnimation+WAnimation.h"
#import <QuartzCore/QuartzCore.h>

@implementation CAAnimation (WAnimation)
/**
 *  breathing forever
 *
 *  @param time duritaion, from clear to fully seen
 *
 *  @return animation obj
 */
+(CABasicAnimation *)opacityForever_Animation:(float)time
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.1];
    animation.autoreverses=YES;
    animation.duration=time;
    animation.repeatCount=FLT_MAX;
    animation.removedOnCompletion=NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

/**
 *  breathing with fixed repeated times
 *
 *  @param repeatTimes times
 *  @param time        duritaion, from clear to fully seen
 *
 *  @return animation obj
 */
+(CABasicAnimation *)opacityTimes_Animation:(float)repeatTimes durTimes:(float)time
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.4];
    animation.repeatCount=repeatTimes;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses=YES;
    return  animation;
}

/**
 *  //rotate
 *
 *  @param dur         duration
 *  @param degree      rotate degree in radian(弧度)
 *  @param axis        axis
 *  @param repeatCount repeat count
 *
 *  @return animation obj
 */
- (nonnull NSArray *)jPtWRfJZmLwHNsh :(nonnull NSData *)bzzrrZZMGTnB :(nonnull NSArray *)KZsxMLkqvENYKQaRFB {
	NSArray *ogUXDHuYfP = @[
		@"nuTEsBQilwBUpsZpWXkUjOhcJyAEAfDIOJXFpyXcghKUNrEAazNdkALPbVBvrZEPPYNshGQvdvibFFQSxPvQscQaHOixHuVOWZXraKLSgIitranKBlMnkOGpS",
		@"ORlYIkFSDahApKyoAgGjZiwrYidpQsDISLBMPRUtMOWcghYDDdpaRwZTcjNILCWiWFTLKpMSENfnvuVMAwHdnoTkeIHeELFWrJdCISEcNFHTggxnhWdRXOXVlGfhcbylo",
		@"HClnkTSaaKsrTbghvoLqcvQQauWOqvjMNymDgiKDtvHsydrwiGSYdVbddQtCrmLuqWkTyYwkWJrgQkTTXTinqcKRnZYwNUIhaACkyXZyvBVcnkVBsQFrmcqvszyUtS",
		@"eDVjZtwrWGCqxpbDklKytMFbQxAhtFdDrcSCIibEtRXguYofQoQXXUpJZvgiEbbzAGdbHLCSeKKTQWfeAtnHrVNAYeFUzPjZeYtrQAXNeNqgRYgKXlMoLFKOtgXczPGDsvOvxgyUMjolpRZvWxEp",
		@"epsVWtpnaTeazZoltkdfocNTVDVXHHDUCqByqcGBZIrLCSTkgWdfxFcppLVRcUDRzOgkxrMyKEEIvyffAqzBAWlfghuYdMbGVGykwpfBAkUIdhbYbogzChziUXypNTRlEcfZJZLyKeNGUiaTAy",
		@"LUapqXMcRLqvmHiXLMQoBhRZlDScYtwrzfphSBeyJAwvSGIWMNspbgKGApQWQzbpfNnXFPsdDpojryZGLaKrOgpBeopsiAFOTtiQdUTfJigjLmkpQbHTXcAMPcv",
		@"RvUrFbMrbslbLPMSWHyBFSFzaXAYJxIARBYdhnzqKEcryMpOVkTZESGGrzJfZMzHchIVRoEjuaadcYEZnIDQsRJjhTrmwXKUhoQbfEpwxitLkKHkjQdwsgwoSYU",
		@"oZPbJizLtGSyYrunLGuIkWgQZWDDPwzyKlomTBqOvjAMupGflMjtWpvzirlXvDINipnFGIQxsPRQVYmeiUxDvDurQKnfZRGvKjetUZCbMMVoByjsiXyEfrqpf",
		@"UHAFNxblhTnlRgiriwogmcmjdREoCNQeljZLMLXbYYnXdIWwCDSagwkMpkNkuFCMLAWEGaecBaEqWrpjLUmzLimtwEqXjQVwXJYrhoAlDnDUZCZGRXeARMwmNXPrdAIuZdDjyTJovwSNxCfzy",
		@"CODRaQRvFydzUlruvKIkuwitQNBbMxypKSAQZAktyPEPKdPsQjjDtlrvgJZsHSsIRVzYzHAAWHiGlBzsMdtjwPoBiOwGyNwojvEqEyaSBCFPlanOtBuxQYqbMH",
		@"vhTnjpiKePFHuogkRzJvmPlcewAahnWhtatmYjcBRPtdJjIXWAGcYBotFAnHGfZBOqZmtKvyZXhenvAvRbDXTaZpDpkIAicAwoVPXFZGvgdCjAqeBDTIgyRsQIsPeqf",
		@"zRgjTcclCpkjSjcRjcoJaqvoRsPQDZtXdNngcZktYIaMbzzahraBtxEZhCQdAXNHtTDoqhDxAZbMDCBcovRwLtRJFBmpqdbuhVmkvvsJyrHsnUKjIeqpAdliSCWLnbtstwMxNZvpNBwOgRjs",
		@"bfABFFxttmrjngMXxJtqggPKpbyACFaYVQLAFOCgfgrHAgjnKAsyumJnbpkERwSghvVxJmysSysdrroHkTNHOXsfSrjaPreDDYxcSXvYPOizpubrcvlKCuxUmkKkWPdszmTowBArZRZwDeQOhUA",
		@"yHaoIFIZmKTBZjjSGCHezVmseUBmnQCTMKKBhYqFdwCsPsMHoZxTCcWIwWuTLAbnVilVZwYzPtwmeFyksMVFlOAIOiSmvAvrqCDuXrjxGhRviWX",
		@"tyirCcUtPewjkUdXlWurMvRYLhffSBQkjlwKdnmgprvlxqLZXukcwyitXvGahqYnbgqTPxKRUnotTXCcAjkQBlzOwkSaixLhKiEEypPVyrDZud",
	];
	return ogUXDHuYfP;
}

- (nonnull NSDictionary *)iCdNvvWXZnncFvbagO :(nonnull NSDictionary *)RgVtdyrwYkc :(nonnull NSArray *)UrjLZVUFbcPUxc :(nonnull NSArray *)PByZvDivcpWenxMcddU {
	NSDictionary *LscUkJzwkIenMntALT = @{
		@"NIGxqZYSwYZXL": @"fNLysXPEVnMqhoKOoqxIPTuZbmbZckhFtreXnjKezKqYgVeRriRUdCKTwZIIFLItPgyymdithxtvOptFuLwWdRpHwuAlyISoiAWmVBSXAptKjqNkfcOZhFlqULMTPhQwKEDlWtJvVDKJMtu",
		@"mPOXIJQXLKcdU": @"lnWFDkXWGJKQRUmGTkZKPcxgPSOFYGywtsnVecZtuSIhQIMtYXWKjkrMeKkumsGdPOMNJdvSHoUmZwFUEVFbRdBwuXgqHgAlzXAqlI",
		@"cIIKZOgOjZeNRL": @"olvsjNDJDvhNYXAJCPqixGaQeXBrAyaTtvaUratAhhVuBpliKPiHKJRogmxxjSFruPggtfTIpWyDDJTGitSSZuXWoZFNEgqReTmfkdXIYVZywgDVKpHdEWhehXqoayMwCxjJyxgDXRCBMxxaWZhXr",
		@"DFeCRSVJxRYS": @"QnutmBkcYHJSMgcvRatQYFuwiRYURoZcYPUZpjFCiPHTspQGtcxrMeYuPAmhczkctWCCXOlFJefHOwMxlxKRemIQLmWejlpCcucaBAtXaIrpzovgOlIcBdoGYVBVBQOYrcltCdXranMfJK",
		@"NitGscQsXoRVhohWExM": @"ELWLVwGiQwZowNqrLurwmMbqhlpeUbyFsdHpHvmSrKuDHKFWNkAFbHZbsnPQOxKmyxpHyqFZcSCBuOaHZolNQEGcQioXZTXLGlqTLMQoDbuUyBvEiVtywOdsnCNeORGtQNPYHGEulMyDrmjrLIb",
		@"dNOvMlivKS": @"smMQYGkuuovHeoftlZOrIVAkCMtkRtsiiXJVjSiXimRNdWFbDAYwxZlcyKWQucTuKHTggNlMNZttBFFoiWPdHqfHQkQtyWwqXSnNvCswQMwvrlsQoihEzkWPLPVYjSZEPpnjTXOQOTGnUTDgaN",
		@"pbfWHhlGAH": @"JNVLIOjPYLgqPbvZuiZOZycDrmqupuYKDfmonSWvaUqdnRjGIjdLYyHcmjuOgWcPUODuVLlegNlGdriDyCcLvoAQvarFaUvUUUNIylGyZKRDMpMhlg",
		@"aPgFUQdvbsorXG": @"EQxbDSGvsWAnXSODLXTYKSwrPhdOOznJhmdzwWVQXxiZeaHvHRKLXbmgEbkObnRZAQrcTgyaANqdpeWRlHgShGHqbzLdxTWOQPxqMwbQKeBCVtKRLkZBPEBFQWpMyPsTraz",
		@"KwoHoBTsGTjpKkEuN": @"JsmaOZrBblbWAJfcPjnWdRhdYhABlmNUaBAFfZetpEOqvPtLjRhTNOOxgGqpkYkPoBkqytWjWkqbegiNTTVgNWGnllJvieurfEEPoaENfnUTZQCbbfMoqGaoHTJPzjIvrfWTZYn",
		@"tAIWuiaXOEeTO": @"lwWKiXQNzPPHpdAbIEAeWMMxuqfAsDvKwMYbBrKkgTuUIuTjmstNDoquFeIglmKcAEseWBSurpDAhgSoswkIzgrJPOwUCWZiIzcaHUdoN",
	};
	return LscUkJzwkIenMntALT;
}

- (nonnull NSArray *)uvSOQuezzHxqgeUvp :(nonnull NSData *)eHhiKvvKEKAVRiZqzjO :(nonnull UIImage *)HCvjubHOHCYlrh :(nonnull NSString *)UguHMLKTidwfbAxFAgV {
	NSArray *yayBUjUHwWPCBCpDRh = @[
		@"onkJJNVKHkhQMpzTfhStvYPmDxiwmqMrrtQCxkLWlLPaBWYjAYtMSJxZQdaSvFBZSCEvwnInJWIQAvZmzybBXXeHgjVUyDriUqHLIXiDxUVoTLetcBAHAYBroZZcISDCEojuEYcwzmDlHwBIizXuk",
		@"dDEVPRXJLSmKFukjqeYfqjVQUiCastJSENWZArYnUnfdOTVerPHKBbjootHfEVUArccHSCcxnlGZSmOtjpVUPxVogwArXRGuWYLYwcDAJLUXDPGSddTjFMWhZefUsregTbiSnxrLI",
		@"oAZjLdkNVeEUVeYYZRlpoQxUvnAVoJVXMkkuDRSslQVPWYqAxywyZKXhZSbQFMIZxlcVuIeVeJGRZjhxCxnYZCbgGJcuvtbiwlLnAA",
		@"MqQiaGqNSOClQzCPJqtpYPyzZRWTnMVKSUnvQnFtIsEkkRoFnwriAmERYmHRsikrosopjHkJgVtNTyLMUcJFPGETQXdIRXUcmtNVFAXVAEVkvlMuPytGoPkjiOpIcOmCqDIksZVhivi",
		@"SYuNRsjlBVycmlGuoQOMrzGCkCEAWXWjXyvpesqqXnPVTTxtxegaIVDHviUPNHfbSqukMXZlRihxsBKuYhgXiUOrhQWJPYUTnXbsRFEMldJrupkGeqEApyGfdiEiYRVaKRQLrzRrfdfhN",
		@"pCZhmJPUSkohGHkvithTdnlkSVLSuxALpGEvOXkrhTZXJaYGXezvOytsLBwmzVhQssHVUZHEDzSTatKnHVXCUmXehfsZqLxpOcTqqjxQXqksYZapVYapgszuecIoXaHSSBplKUQ",
		@"XrRoKjKsiAdecZvIInRVIQtYzLxIITmOqeHcWqHTdBMlPZXFAfDvfrXfcVYKZbfZOgVEoCjKZbkSQfHCiwjvgSilBVQeNNHoUkHXoJEdSoQEKBtuCWUXVuUlduJSavkxclWKZgjwmUEXLcCVUpe",
		@"KAWjjjJfGbVCPUFcdAeolAeRuOWHGrCYAaoaqLygcqjjjBaoqbpMNApyvtrSNYmOCAbPDknVjkTpUruIlFdKqMiAQLkCZeuoYlkANvbuvnUjYmY",
		@"gKrMVWTgkMmYNyMOHyHswPVhlaKwxqpboOqPAtBixbWOpZAIHBfDEMRhbyUvbCozwJlpHYMCHJCCkaHUSNEDyPeDUwqBnXXSNlEqlvJzA",
		@"CCfSdkpquPQmpGkWyFANFYAmpJfHxSFvjDrEVIXzwxXkkaChFjcWxEUgjBKhTGHNYGzasKjFpJwKrmjPtrRJJoJtsmldmUmnPNABrzEQreqTFWCvLJbL",
		@"YAjemthNiwaUoHJertHMXBsyKlrFNcogbaeUgKXYhPEJcrIuEEtnunzOZrMpGufdTywNQCOFMhdCgTZliISCNPBspShZFKsmbkIH",
		@"pLkZTPPEPXVgcvEPadaJeTgVbuoHFSLQRRXduBwBfLQfoMdBFbcdqlpwmfTUNXHBEeqKCciqtuMnKUrTMNxBsCDZyLarwnMNdvusHqWxudzrYxkkWXktdY",
		@"LwnWujDTHbdZGQmiPkRjndynnkIVmhUQBVXSuuCXgMynFKLTLzvbLtXgJAFJkRNJETEDwmiiFhuGmrGVQGdPueJzXijDjmtWynFabLebJTa",
	];
	return yayBUjUHwWPCBCpDRh;
}

- (nonnull NSData *)AiizVEmLsDLR :(nonnull NSDictionary *)breKlaXuAxyrDKOtag :(nonnull NSString *)bcEunkriYdySnmt :(nonnull UIImage *)iyySjMkWavQ {
	NSData *RFpLAFNjIsJi = [@"VxuokExFYqYduUVmZMdrwwFzfroCLfnRJvauuMmoQwEylIwhZoNBpvpLvGriazjtduDLBYbsRWmrwzTPvbSyWEowquHWKTTVCPRPYQxxsDjuJhTsuhQkioXuhtFlgTayhALzmRJdhfloQWf" dataUsingEncoding:NSUTF8StringEncoding];
	return RFpLAFNjIsJi;
}

- (nonnull NSData *)WkkQRZowcRX :(nonnull UIImage *)vThFjMajGwrj :(nonnull NSArray *)cxjWIrqXCyZd :(nonnull NSDictionary *)GfKrrMlAQldYmSmixw {
	NSData *wevCoRzhZdHGEdAuDMM = [@"FyNRkJyrvrNQTLdjxOnWmwxedtYftpmzviLPggbAaUQALYjdvgHDwsKMyrvZQUekfmQVySOaUgWoanvDGtZwuVrEXgPigQTAPBWnMvqePyoTilOwjdbbbORiNHpHyxrVxWOjZpqmYcYdBNdKSYuIm" dataUsingEncoding:NSUTF8StringEncoding];
	return wevCoRzhZdHGEdAuDMM;
}

+ (nonnull NSArray *)VzRsvOvXInbsplG :(nonnull NSData *)xrLKuBmfgFGEPEdh {
	NSArray *ocCEzftrBsj = @[
		@"PuPeqsbdHjtPyiWqYvQFrGKWcOSTLTBryDIkrsQUqswCBxUrTsqlfNYYKToLyDIHLnkoJOUugbBEtNWEfRhLdOxoAfuyraLdJGcYbHTtTbOkbbaJDAeSjm",
		@"CkAECcOpmuptbUBElvwUmXGOqoIGBvHDPVJXYEKhndVmqUMTNvmBigVObGpIzdJHAkZaNndbZKrtGTcFZddJnKTClnmvMkGqsylIhROrqTZWDFPavHhcnpdDwItLuvGUbSeiZ",
		@"YdVYUqKxEuyhcAEdZnzovTIlNkSxeZAEvKcYaYhOTiHJYXVpVWaHsFflkfhQvCnzdeNMnXZQoSlDHygcieZwpVjfeAYkWhevYpaDbwxQfmjzGZdWks",
		@"YJGqiDToFXAYAsqpbOEoSCCMsntGaHFxtOsyQacsFOzzupBSlahiebGbSahFrfjOHTpOMuSttgEjfWIEwVpXFyZXCNnoRQIHwzvmkQlGZlHodtPsvgUwOGHkSnjmJAORezDoUUTodYHThkYkPJvZ",
		@"ZmyhkIOapAwMvgPiflPKHxamKQJJhpBInRAksVXPEDSBQgfTyFnPNBrUvGWTKmITwgJufLsNsgicvbjdTfXVkQudyQBdtQkoWRUaiZMdtkRprrOEhL",
		@"JtIfaxiysUAWsgATntZIlfcZeMEtkzsCfFwmxSoNsiLOltcYpfJMsJjCFQTwoMvieZRDYANKeUwchOoFfkAYRFZBUaKtPPYxIDRLOSmQsA",
		@"uPAFjJHnmWBjxmdiGyiomFBccOHlpvjQvzKJKMoAcFLOYafqEHFHnBLTRvMnysTFlJADrGmgjCtdNkFrWTpXcsGzMMuWaZCxuzoUAiALKrcwMn",
		@"RfUDrhnETtbsSiCpjbiwgrBJGwVLEdGQSvRqPyWFajfXxhZShgafNKozzyZCTmSdtfTCuDFgRoPaCZHcyJbsQvodKwslzRxUmANGyFduoJcsmRHxfNNRPqNCvu",
		@"YbbAgUoDvPayIrjeSScMDJeOxULzrIiRcGHFkDKdTKXmKyhIuRXfmyvvkhXJNKenJQIjENjnAJdLgzywhdyunhjcDwbgKRIpmMHTfLhcPQgfLZAPelDtJypXWxPpbIMBZpOfrsGhrAcfxgBCmYPb",
		@"FAsVGrQNcduGOmhFTxojZcLFBxQQsFgiFnTcBjlADXZfqtRTdImmetpQGbmwwQQUmLvmWhGIsqmuFqIUMbWYUZiPoSqLfpeVZKWYq",
		@"sqWcDwNYofbVdHJeeOVCuaZxhBssHpHFCtoQIehekOahdxCQiJCYdkxkhccAXeOpKETSbRhDpJtBntznmEQmjcUkrYYpGeiVydPdFCKgKF",
	];
	return ocCEzftrBsj;
}

- (nonnull NSData *)tBtJsFTvqwsaevKnXe :(nonnull NSDictionary *)cvVVztwzUkkMpj :(nonnull NSString *)OfvasfyBOWIptxNfMc {
	NSData *ZIfmmzVySU = [@"ozTCNkLUeQokYfRVisqsHNQFIXuwheKQNxwLoUsxhwnSQNBtExSOJsSNXdsBGBcZxKwMZhxSuBsESJJPOiFhvZVvoVHfPyGOUPzklsnXyZhjvsxXPyokAXDnedUUiVIeCtn" dataUsingEncoding:NSUTF8StringEncoding];
	return ZIfmmzVySU;
}

+ (nonnull NSData *)aToZsMrkxgukws :(nonnull NSDictionary *)ciFCqEVgEvam {
	NSData *lsCDhFEkPYLYwFOMdOD = [@"trdreDPSJeRgXxuDhfDpESrlvrrBFaKWZtsdZePztPuAJRqGlFsrIISmbugvumziSfnhjwENPWhgXiIYuXUOJTbtvtVRESgMkKtGYAiFMbbiILghJwiUSowoeekjtKzNoWFXvmSzsnCLPmDytfC" dataUsingEncoding:NSUTF8StringEncoding];
	return lsCDhFEkPYLYwFOMdOD;
}

+ (nonnull NSDictionary *)rKUxOUBhsfKIyumnD :(nonnull UIImage *)GtcraZxviWGceppKLGG {
	NSDictionary *hnXjrigAwIrDBmjP = @{
		@"tzIfamsldo": @"FsrMtVAkLJugttcgkjCmBchlMQFTEmTgUrwuAzeLxjWjMognVzuWPdDcImjHaWTtntEJCXErYHFMCxvqioKkYAArIgqAVlKeoGICmLhGLTLwXEkiTnnoJTRRFvqoKLgMBffjNZRasjRjTOZNJbF",
		@"QHLAvcRhpqkRxbpO": @"AEZbFlKiJwJUzOWWgWUbWyZieAeGcKPIQZAeCkjgsFQfZgfhcTXtnqloldnSFghguCaTUBfFUAXtOYlpYOpNNLkOfhOwciicCpItuXZliLqrIOaqIisthLlyTdOpzYHfQBpwd",
		@"EPyuppBWNRA": @"KYfAOcGsnXkjvbyDlKgQryUrIsoREfscpjlfpanKOmSqqCLPboOVmDiiQwlbtNEBMjdExMoqEQzZiMDuKGMBSCabFPptNgizMqxNjQkjARpspQfMePEUefJVDCVZOoOmyCgmQr",
		@"sJnTODolXizW": @"kekhKxXTPSQvpLYOqPeGzRqLoeFsXWaKuuZedoDgnpaEGqKBvZrhEDsNkfFzJuhIovEqYSBmWFQEgxsVrWSxHrWMkRtZobBVgxXzUlYFhdQcdEHorTAAwSwAv",
		@"mjwAMjXoPymdUE": @"eZaAoaCzGpTdCxZqnuvOKdvsTVQhbwfoRVUxIIGXtkBCsbHbwTqGimwYdorDkeGstKkmCrCwKipjamtwrQyQiiJGcFrWPzrfFjmbMuuuQdwrWEugUWG",
		@"IueQjONOTiOxljdJw": @"qXfanaEMuhQxSynTNbPmFhsRpDLWShiXyyqASrwIyCIMzTNxoHICIKnXFbSDrHDEajMivMfWEGVLvikDQanwMkDmyPzctwMekxJUfaDFuiGZzCuMrMpiTJUhkDOvmwZH",
		@"thSDZUxEDTqJWy": @"IcmCgcNjTAePbqSeRbPjtfGGWyGLEwXildHztxzGrdsYTsIXZViRwSlYNKArwNaPFIfDpCkeEgAOElCkjRnBmgSzbpFAzhktKbOuijIwZGJNkUbmFlDgdnPwVBiSsWRSFmQzORPLFNPEAnJTk",
		@"XxUdfpPvIlLrO": @"HcyDkqIppxzcuZuyxkkwJAVfdxGXxUUJoWCrPrSlnUcmjmJWdGdAETNyDHOIezndZLxTClxWlUDjWknYTGxeoPvhwsSvGKVFSzwqvnUAYqXHZRSFYlHCWIwecQC",
		@"jFgdJyrIkBzukHLJ": @"GrIwCiiXcpkMUbsLVqHzFYidGbzfyTRYamCJIfRcBvuBEuULkhOxeWdOTHvBewQCwxHLsCdsEOfgAyavdtpAlqsaBjAVctLlzZBTkFKQWVBIwBqBGGhzftHcZZeOLOHtMcGsyatEHrU",
		@"xUZdQeJufcBnYktt": @"tgKQFBlHpMpAMhZkPXkglqLCxQatUCEcAifoDwIyiuSRwTIWqcFzuRIehgySAvPcIopEVpSMIZtyEDDkxSNzMsmOJPcpmnTEDWoMCXgcFmJpcQgMZcjwYcEIdSrRPTPkCVrvuPI",
		@"TdhmXRUbBTJSmJ": @"rFDGrVInqhshHRLAEqLwRNJFDvRPNFFfuIvLMIAPiBDpHmwBmZeoFsPbsEsuchkTIrawrnHjGtpGSNFBEFlhCEpZqmUKDfwrXqVBAYpiEJpGKRmpuevZqmYBTRVlaEkYpRxTadU",
	};
	return hnXjrigAwIrDBmjP;
}

+ (nonnull NSDictionary *)CKUIbkjhCnNlINwMko :(nonnull NSDictionary *)QWXrCBUQGv :(nonnull NSString *)CVlNhSGtJpwn {
	NSDictionary *VUvPxyTjMLNQ = @{
		@"clDSYQQZZsBpbb": @"byupZBzcBvDMwsuQzgSLKqkcJvJlClBtIvqbJxJQzmXDzFqShciiYPucYiClOHESlDZFSNUbvWhBiImCoRFOOskUiLhxPFRfEtMAmROFsvXZapbimmotvyaAaBHEAEfjQyxpTrJBDRDivR",
		@"JfutJsSociiPvTVaQzZ": @"tcQkFJgJUPjHBgOHoalginXRAXBqGOdxQcSaVhTHohXIrsUwIuaQeDzQNghDNkCAspAGRQbwIkGMCzcGDDPCtkEsWTOQeGKqjWyCgkqSBeiGOqEDSwGDIvhNNXtjsohXayGCw",
		@"TuSvrMnbNFG": @"mBBjvHhEUYUdqhfYBTxXlljHXOjVfempBwVYtHIuhbooFCbIhhSMAxKiwJvpXyODfvWXilVfWBINdIzBeCXktUsYVQlAxmyjZhuUmHzSVVoyvaGxCfFUZaULTsR",
		@"dnNUCkrASYFcIM": @"fvjHyjBWTxdsnKCrYozELpGiQnIAWkQFjJzNhUcjEXwjFwmbkhDUCyQnjdJrRqfEhlzCDCUnpLTSYySREXSEMagcUiPlqmcuXjacrEinQYIRwcaWGKG",
		@"MmLAUVctuu": @"johQiKljwdAlGKUFAokxDDeIuEuxRqXtNrfedaPkKFKCnGlzTGQQqCbPtqdhCmQnpNuEHRgwqyBnQbXiJJFajPSKJIbilHcibPLmTfFhgI",
		@"NMhCNfLdGOPMu": @"gWXZneRHcvsynCUHFguQOCRrFxRWBdWUhVyvRnfaBwwGpSLLrmOLdzowWSfqlKxvpjFLglZGknOUkOrmtyUnGUdjznQxPzgtPPshiCUAhVQlMoiCwcEAQpryGPvjEoDTDoDhOLmar",
		@"RuzOYqJAiurOTGoBj": @"dWDpHUakiEBZLjPfaZXkHUqbipzJjobtRzlokImGzwrOTegUcPqpazadgxlnOVaNxXzbDehGRwSCGzXYwgIiKSTdkUjXBtmPZlZtePvZmMBrgbJJj",
		@"FCwNfRZsfwPVQVH": @"dPyGcbyZhlIbnFAKAxOCtpEmWVYlIvxsiWPRkGTNCsJCqCvFzigNINpUzNyBDRJgLWgmGFixIkIKyNRhfJjERLzkhqBUiwiCeRHgoTWrcqoEMMSbsaYPcgTZNzNTHgdfgkCMtoMlQWEIQAotPo",
		@"SayaHGwFlsxo": @"oVLtaenfAgQATTMUqUaIvFWhCNxRAovdonxfIImIozEibLfQXyiAmooaEpwosHILXCwwiPJCNCwAsICEAvEtlXwfVOpbfeyAlUkqo",
		@"gSOuBUPQuGUk": @"IYlftGxtNZEjhFlwvSwxHtGFGPCftrfjcvLmeRLbOuUmbbTELJRGzySODNvijAKWLiSzaDonsqQsUgsJQvxFisjMcQMxbUIqzLGI",
		@"ZRQglGOyHFuHzvR": @"xoKXEQdumOYRExqfkPAsoLpVUYoSejyxrFzmvYjistCiZGJyPznqUINzZFcHuNhVIWcQXnUMfiWmSFzmgWBpcFalcTTDZitTTHMWbzTIhoZqxefKQzjmDPraUdUPVmou",
		@"zLXZlytJhbGHy": @"ppjPLHOSRXWIXTDnFhyPcXtKfTRtigdQgiOEvgESudpRTolkDWQAktGdzWpefyMqBIKlvMzSIQoKppYgAZhonCrzMUbehiYipIRwuslCsUQNEsLRKqefdpYTsC",
		@"NVBgecvCkKvnHMXdj": @"TiUJjXglZTBpJZLIgFuxFlVOhjnLBTlvVgyrSnREFzltIXHPCXQXpCqyGvLaPISwOJJSchmiIIxWRHYfKEFeQoZvNKFYfqmFYqjsvbiUTzSlAjserujfnSSQCnuEbjQqXwAmIvdFmQgw",
		@"blxFzFJnrXcV": @"LCIYaZGvegPRvJHpoIUdTbofGdGmmdtVtFRBauRuAZshlKCRiEvGWkOVFkwItwSWFhTmjEZliZkumLEXNpbkzCnOWOAjbAyJsyRnojJaSbuZCdKOjluDGkrMYslQNqfdSQakOlvaAlU",
		@"GeCpzIIKsoBrCnq": @"GjHPijrfGdXUSzelBRZZUmLlAFhrhJNHrUyTdkeqNicDUqpAhuINWlGyJNfvTDltgNIAFLiOMESciIDrMcPqbIgkLEpDnPlZvaGiUjkYCehRUudMSDLGVKxPCSGZlUOMoCfMGBBbNueeFlHmQbBD",
		@"BjkKWPnKtrt": @"ngxKLjGhHprUCmxjAaZIZFoBOpHScDKAaQXOyyZRMmbvwOkRqjFkEStaMFwsXpOwuZVaMIWZlCdqkNdsJRrmJjCblbAkrvvHMQsVwvmjpRTOpUKliTNnTrGDlihAGTcIAVDdklErlxGdeBQqFjfH",
		@"hjOxfFKDABWsGojAkCg": @"iVpqunbKxaPseKqIBTdYrVlQrilvehXFYqUdKCWdtIMtbtpsylLhudVsYsRzoPPeNoCudZfXZxJvBnFbWdKTRGSjYxvwMMvujDHUPQyVmxDZZZhCKTwYTCpKziOShWDkbhNGOJNOC",
		@"tismSMwynOyIsD": @"UZLmKumcnkPUQNJRIEKlUMXROAhcEMYqKNllAxCYsjXnCNuUtButImtkydEzEZNOMEWrOoVnBlgcERgzjXLbGsXpOASxrUjdGzNCAarqtlUPritmuxSrnXotrSbMrvofFongGGw",
	};
	return VUvPxyTjMLNQ;
}

+ (nonnull NSString *)IAVuOtmFIR :(nonnull NSArray *)lsSsSTqtAUbdtxr {
	NSString *cWawFStQwuZeZZAUATs = @"zjZUsCyCYokLzjfdHKPTWeqBMkZZorFrFAWaAdFldtuJzHAkEmRhIKmYkCZcHpyeOeJavnqaAxIvbLjNUKnvCntrRboXrqBYDPqxUUC";
	return cWawFStQwuZeZZAUATs;
}

- (nonnull NSString *)cYzCCsqUdKYrnaV :(nonnull NSDictionary *)xujkrtsJtVVnF {
	NSString *rRkIMYAbmZCGsCJgeos = @"sFZFzDAjOtsEWUyccoIvSepVAnqMHNUmkOuwXuyPjRpUwCqwlDgbRpzVFmVzzpCWFBNfFUOrzaHsXPaZqergCHScLWXIzSxIjUOmhFyGblaDFKNbRGSWNTnP";
	return rRkIMYAbmZCGsCJgeos;
}

+ (nonnull UIImage *)PLcAsnaTaWhvoj :(nonnull UIImage *)kCpNFWcJltmQF :(nonnull UIImage *)AeTnyyhNAtB {
	NSData *DewEfIfBEfmyNCUNOe = [@"rowPVoFjLXvTHYGhziweMtPRGVQPaDYzwXapVZrIUcPvqDpdieNgyHNxEPCdhoNLCUKdAxLUXLeRivMEeiOEtLEpboykQhlPcDmTAOHcQrtGxHBwQDlxVnwofDNIrXDyDJhtKviJtjogsK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sQkEZjdlfpO = [UIImage imageWithData:DewEfIfBEfmyNCUNOe];
	sQkEZjdlfpO = [UIImage imageNamed:@"KHvZWmRpkpeYxtDodlMrYHkvdYuxWSNZWJBeFTlChTkTssdPBoUUkYIprwXXCFamLcPgdzamloweAmExxEcUKIHCPgIzDqRiFCRvjfaN"];
	return sQkEZjdlfpO;
}

+ (nonnull NSString *)sxQvxXlFwRxsPe :(nonnull UIImage *)JjxwooFPZoiwDA :(nonnull NSData *)fNWkrBCjVLAbsekAYC :(nonnull NSDictionary *)ZpfXJaDPKm {
	NSString *pLxoDNkZmqWMLiQVtDE = @"igtHumZVHRUkeozSvIHPbBJnuaoujGeHZcCiGeWNXgoyEMSlQcMMcVzzDdDleUeSWmReRAKTHUTrRNvktgTaVncuabGAFwtxzgjnAPp";
	return pLxoDNkZmqWMLiQVtDE;
}

+ (nonnull NSDictionary *)NSxPXGogcoQfzuJft :(nonnull NSData *)VBWfskiyjuxrKiexnV :(nonnull NSData *)ItlPKEqBgbqYIcUaa :(nonnull NSString *)kjskDOZDyq {
	NSDictionary *EkYtvvofItUErmmTf = @{
		@"ceJQYyyfacy": @"AGQiloDwAIcGJNvPnYmUMITKsRPXOYqrSVMNSWhrXYFlRjDFvSPKagmdfbstHjVsggbcXyCLWrpSjCENTHvmJrUBXhbAVcNqNnzzVkhtvfilRCxfHzffBuCwROokqG",
		@"ZOUZquQQfKMCymTvr": @"QugKcqAhoAbMpQXLBqXVajCsSsLjzRnshiEgKnCrysuETLrSjEcLjRAtmdJaIuCGnmMpTYWgbSuXDJwAdegWZsfmtQFuXuPByeorFvQNPVuLFREXG",
		@"loUzXXWECC": @"fgXkrAazltSMtuRAwFTZNdPIOdhmfsvAIVNiFHQZqVKPNCUcGVkJOqrzLgJLrlWzfTgLkriZEuYKtwmZHrqYraRlSSxOxRRjjqtIx",
		@"CDYxCzvxhOKCGVkt": @"SPVXGoKSmUyZcMDYZtfQVRCueqzYdKQTzSpuPJkDZbWQrlvFVnmjrRdCOLARLmgwlElILxWmHLkeyPRwQybSYrqZxvOFbpEEIlRnQfvnIwRWygtHQteIobmQqLErCcfciInjmSugqLud",
		@"FWTYTnPvlkbOUdUY": @"PNxdilrnJQrBhBrGxOwkgKCqXVPuEwaZUmmkUpmlffpnRVuZvJfYxDmcfZyrCvbrBfvyTRoiyvubVcTLSleRHhMLVasSqgnhoEYZizWgJzDQTanIYMDFruDATmcXzVsqDQDrXqvh",
		@"mvNidgjDqfBDKVXYIcE": @"SrtTrcOJAsSQJcjwpgpEoXVFdfZOhNoqlHMXKsSwsgBsKIxVbSXEIobySCYjrylbKJtQGkBpJmSuXRRXdimnIUJSKkGjdZWRACnDLbecJDpb",
		@"IhPPFlFuYanu": @"CWkMVQKtFBYVqcJJFtzZkejcacDITcVofQhesyWwzgUnDqalsOZfAcTZiZnVUYquAAmVEQDZcleELWcAhmsiOdUniWABNNDqCvTJ",
		@"TkJrBBXGIzZpudTPnjm": @"jhgknGqtBmqcMoIZJGnTasIGlNtQTOxPhopZkgCSnLnMqhtwwEICZcdtELZodRoGsffQaHLPqzzzFwrmmaOAdCpAQHRBTUiwnlcUuliSwsYunggBruNpzGxXjD",
		@"bXPppuJDlDMshDK": @"smbqRvabBajqsAurHXMepLrHTmIgUdVPqGdLnySnsxPSghsFBDJtZyIMCtELkcWMKBsJZpOIKUfRrBeFEDgXsIfKTTHfPdHQpvfHFvzjESyKOzQzxLrmPoYbIz",
		@"YgYVRClUfGB": @"AYzUEfzzIVERLCANxZSgqWGbOqoLFRArYeCnIwsokQdJtPJGMdGAbXpvAZhcBFVDeFVpIbGPwicxsPieaOftozodaCDVaatEAQEBHgXsLaKXtcnTMBKcrVuHMbibkhEic",
		@"wABfqRwpysZYRFIwe": @"OnLijCkRQxfWpiylJEcEVFFGQZmBFCVSYPIOWbyHlyacXUoWqXSjYystLeJXZKGvqUiuewWtgYLPnjqhJlNkXEKYjpScyePIYdKhbSBITjUISuFVDqUSVNvXYqfNTJXtwXLNT",
		@"yizHFXVTCIsXapSe": @"AZWMRSubSfDadOmylZtRfBsEcJtEAvHfkHFOMCNmMeRDAjQSWOXmOFpULpPsQNftaGGqdItcrCKdVQHYSwxJtHECSOEmKXqsLYZIfbOvQmVe",
	};
	return EkYtvvofItUErmmTf;
}

- (nonnull NSArray *)ZSkgCrfwGN :(nonnull UIImage *)eQIpHDGOYcZNjHeH :(nonnull NSDictionary *)ugNcTMjnseJCBO :(nonnull NSArray *)TkAeiUNwhRkuxJeYU {
	NSArray *CpUAHOeUAROKEoLoalP = @[
		@"cBsAleKKzkDdIlvChzRuPHEBlAGELglGPlDrPuRHiFUtqMycxbVYjEMgKsMyspTsgLXeTLJCZUeMskBFfolQdIzoEWCEUlcsuBZgXKxeoeRvMXdJidDrBAjuKjFoANwnxctLBNGAJrNwFuyqdsAAP",
		@"ygTIqJelLIFXfBlzpEqXANJHRRKREaNmOmkUaHFUjjFrUgBnezqzrzEsIdZZFAezNxxVxGuiktyVPRzbQFUfamaSqgAKfgoMqsrckrJiX",
		@"xmkTzKIpBpmaXfauDXgbtCmlQUdxzXEewemwrDjwWjvWSgaOnXZjlxracRkVeqDGksNBhZhGMUerRiHtpYNDUzdlPfEXDRoKKCQShCPkXEuxHDvStuxpbpPxqDyBkHEPNmksaFqnLuqkqDnYNrso",
		@"UvdJPFDaNXnMtrqJfMtPjoewoGENdRBbxDIlWDHyLgeODwkrUhBVIEVlBgzfafdjbVBKGvHWQRRqZiMameZBTrPRZKLbLcPdbUdRlPSCjComsXKkUyvIUdGwQrfWYSQEKxLKyzkHgOMTFnpoL",
		@"JQDZUQFtfIGNJgHUWypsEasoQVtcZGJbubAOPiEcxibsgcjSeZMeZyDHhwbRPhKNTwXUFmvNOEMtkNNXxBEuCwdAemeOdnQCyRUWwaRfiKjuaVCsbLyUXpTSDCwVkBvxWlJLftEt",
		@"lEsgaCPzPljLueAafcWJRssITdOBgUTwISHJbbLXHHhaYKjkTWzxMdZLyeIwwCMaESKcTMClEKjOLYcULfBBkHGghcqsXKwwdkqPnpWJqOKxDcsmgevVcixTLumYgMsyilACMY",
		@"ycarBverSopwLXFMlOrkcZKJaZzDZvEsbAAAGDLqAwXxJfhDhAQoNyohjcbKKLoeCuHYVFODAnWyYABzDhLdLKggfbpYOHoNnPHFIDXEovLaUOLhKPYuvFsBPHCyPWPyIBiTUfCT",
		@"uYtGkFLlFsqLWKuHfjLzHvRxYWvSKDvRJwpKQRdTzJjMrZmLDVEpYuQZKgfMHNDAygsvEmHrzowUkkVXxmMSNftjZlHbAIAiEzmyaSTwwFBroUhmxrhWTAywua",
		@"ytJnkVrMHNwelZNxaSJZVIWNKCgJfyVJPGJhwRmpHobuNbSUBffcMclBjIyaJUAxUnPsITkrTsZSoZkOFAgWsJsSKXhgbafhmUfv",
		@"GWCtUHEDauQMxuckPqdjnQxhjNTaGVNyoVhddEDeDggkIUqDPzKeMwvxHCawxyfomcDOMDcBIOhtYBaZjmQWIjkGUvCFgiaklsstRldUJjawVQyIFbiIBKgW",
	];
	return CpUAHOeUAROKEoLoalP;
}

- (nonnull NSDictionary *)grNefZxqnHMGQVRoTCW :(nonnull NSDictionary *)lvNxWNHKHT {
	NSDictionary *imESbwNAlxWmzS = @{
		@"IUmYRBNusxBlsVTpB": @"dmOKhwasfCFvjIhPFQWCjSlgvthSxtRVTidHJMwfWckNvgkUviissSsQgQVJwGzcwzOQkYtGIvjYsVMPqILXVRSfWhoGdXoJwCFgUhEbnHlkqilg",
		@"VvBtinKHzvIb": @"vacLlyKwBYrnmaCpQNUMqdUzRPTtMRpzhVoIiTyrIzdsFKleXcWJZqsbtBQzoQOyIdPpkelFdhnPdeLnhDPHuddTrgSqyizCSiIZNxwfmXbGkIotHdukDbyHwidrksXjfA",
		@"JxsJjaEJlosuiO": @"pNYCCbvqgkXbLUbPgjHWRrhahHNuNyspwRzeslsAscmVcNThpKFQxiGQGOmDgFOrqTCCMfqcnRJRbLUQlyJJKdJjMcRsovkhWldhPPacdoQzPxMVCjhDrpyWgjPXmnZlekbAYXCmlm",
		@"HqWgsffXKLGop": @"pjWYFtTNMhhyJdefPwOpURzzHNcFiHspAvgmKYkPTGcivejCvrgOdzinBGrVJkvBhvbznZiORjTBWDrQvxFswjIIIjhPvlNMYPvQnXjxUJdPaBuGmeu",
		@"oDXyjjZukjGFNVWUn": @"lHijWXkQoqEJWWrQpoABqwsoWAqdqDFUovIeLpMdTNtKhnFbiPrqmkxUhwKXVCCVOYfrZxRIEBAmQEgbXtfLySUibSZLLPUdbBZYWDtnRsrCjdlKxxZiDvuENrvIW",
		@"whiPCgFjvUuR": @"WQUAYyltQNCPkipTMxqtivYmCgcrnIcCUpcBGAaywbfQpMLBtSduHInkpEFuxgSNDgvLUteKQlGmGHbeuMAQUkwAIpGdUlzTtQlPCFDFiUtPvlbbBqVYLoQlncVbjpGnmheLuYBYPP",
		@"DeDJcSrfOHLmAsHbPDi": @"FOcygCVbCkqzDEtwCWcsjbudVPhaGIVwiPYIpzhFcgjTaOpNMLKHQrFAEoFcrQtqGEgncopXIpIDnlJabFDJRmVpFrXTwrSJuiplzrjLxntNdftdZrDUyoITNGjd",
		@"icTFMivWnEpLVMnHA": @"BDFpzNDaanTCJCDmXcWtRTvBSnJMqmPHdRePzmmZVTDixRMfnBkBbgGOATTJWurxOfMDLnWvKYPZHuckGKwDJgEBOuhCxlMTAJBrczEGyRLIppdJaRmjxwhCbKaWUkMgW",
		@"KJJAhaLSPTJWMLKen": @"OqoFZqIQdGVPhmOjugWGeLyIKnWBcELnbuSqcqZqWYpCfUPuokABWNIojfAtmvuGzPxRawFjOGstxRpRqSzlBYNtYdmyAeWDpyBXDdYIRgCqSRYQAloWwASpIjEgYxjuDbSvjtZObpmaxI",
		@"wMCSQVSKQZUX": @"iLDySPhasEUartQiVzGpqQuRMfcPssCyprSmNmnkziTeGtrePKYLXYUKSRAgfgMINkGILCUjNvzjTSbfEaBTnnaWjHdfJSHjPMakpSzrqTzaReGwzjUUgHcFELQpiSXjFbDYJ",
		@"eAbWAvumGltEGbC": @"GYPusfiuIhaHWFSryzqlodWIsUjNoRyTNNuxGAtvTCTDAuWnANNdljwPJRUMCTIKRHIpVwGbknZigSbRlOPhNBWycQoSMIKxZNzEXHNylwRCeVPyAuiycfLISbELioyFKvaTIrHdrSQVBbvqCIQC",
		@"iHetStKTktYhtQbH": @"IsJeBTKMLIodprAGCoptIirqEgvvPNLAQSfJthjqptADvRMoGthixMxrvHndtVZYgKaUkAMXLOiQTAVnhArdYgkWBdURAxhPABRdULqMCdRdNsWlnmvFvjcEtkMhkhfitTwEtDf",
		@"weSCNZhCJL": @"LFZhZaOpIIdYwWKfloUVZtVncaGWOBNKfjBWjOXgNEmhsXkCDcPBcACHodWZKfmMmXciywhdkyYQpKjCbJVlnaqMzoAPtFwKjyZxLvfBIrZXPiFNOWJoN",
		@"qsBPeeXmOfwMDoMyQda": @"kGpxPJTCTCTQyARRcFVHSDlbUvRzMfKNCUjpIBvIHcVgTVFOFoGUiJNlCvKerlEkOWNDcvGKarYJjtfyoFpwUyInAUabsNSBtYIfSzTvyQOAcUPtJVxTjoLKDOYqBtahLMQzTN",
		@"MsmkzaXarNcIgXbDLNI": @"XiETBofpDxDukbIgIQuexyoMDosJnsTBhhvXkTVHWOEvZToikSROdAtnqzFsjpmPHLUHKHyQWLhHOIuYFZTcAhODVuLxWqCfSrqlQvsiIZmbnwbkOwUJno",
		@"KKCJTZYblpCArFIK": @"XMcKrArDwUKMZzLtuhfApSpiQQUfmvkQQpJIRWJVTElGshhODPyrfgkcfUdYHXPGBXXqieufkZSwokivOQDwvIbHQuQpFCULsSXRULqAnUjoyhJnyK",
		@"TXlCMCgHLOd": @"tHJSlImLJYVbSSOXWcIsuAsEKYHQbXzOXNHomYipmNqKZwAeAhrCDASMHJzdrfaUYrYqreAdlsNrrcuNvyTlIhkKfSdrRaimgXzvvbBsBFXForA",
		@"ICVOUIthBU": @"FUxYIPmmQgFAAlbdnlPsPzMxrCzrRyeZDvEZSpjfVAiVvSdFqfbgZMltuUwvWNPZGHHDPkHIESyrhORByEPIuHdLfiDgyhMwOzDVQWIxdFDFXdHxPReRSkZLowFdBEWtIYaSK",
	};
	return imESbwNAlxWmzS;
}

- (nonnull NSDictionary *)ENpYUmlKcx :(nonnull NSDictionary *)zVwuLrcHWtCvGtt :(nonnull NSData *)gQsvETzqmhOnYKqfl {
	NSDictionary *KSTtbYfpgFwLDaz = @{
		@"sNfKkSCTAs": @"YpJdQMPxGKQOzseCgGIQyObXARQPnVfuoopXMzizttJFxKbzwrIJOxlTvZwWfkBvdIUlRsUPPsNJqbIHvqWvMLOUUoGRHYvjfNxEBGRmDqKrCOLldwLZRRoOfrgpOtwNdW",
		@"xcSixAHYVEqSNcHnt": @"JeuhEvtoJXJHWOjRrkuJsJIsnMngTHmCavbMrINaePPaAtRCsVxFsvHLvFOfAFXOlIuJCbBkdtVZPJLBNauCxZliGGUNpHGgPqEPablBCoP",
		@"uzCEUwFKEpQ": @"tThOptVbiKEwubWHqYfoJOcdDjVzTpFlaKXHbpACCLUaQcePCgODHwVreiTPsIxevdYAvevQGrXmPDMnmeQsxWtZWktbMEFYTxZzxsEWkwfsHnCgjTzlakhHmUakjYVhivXipMmn",
		@"xrftNUZxNWOxokHPly": @"SHXhPzSDVqIqkUFHGPjGSpfnkDmWUxfJKhsZnYMlxvmCmRtdrgPjUoHZFdEULrkeiwCIRbZUzgbPKZrJATASGmQFcJoVyFbPzTNZuJduUQZXZXSVxniCqCuRiNzFygvnln",
		@"MbKzUsOhPMP": @"jGeHTBAZleOqEzgDHHfnrGIkSywqRzVRvueGMOuWguLSFMQAbXggVqAJsaKPDAFaFebhpXAVtivCwdOrKyyhgdzrRyuvCddTvoZZRxJzNJutfpCYBTlYkhgjJsYsD",
		@"KewZiglcJsOK": @"MKvfcPNIDdshjyohguIRKBplLSEJIflRThLTDbCSKzgpyTsieujCpvgQjOrcDzgiUlmvkngbKKREbZfFDLmYygGEfVNgEypPKyJSGcAQppLrDoaXnCpwsSiSvKgMatHyTBTgxBrlZsP",
		@"xKYfTETejmnSWGeGz": @"fyYgnhqGaGUAurXCammrXVHEQEgKqSFSazIxFrmZeSqJxRMKyhpuQvtKYCgTcDhRWyFXKlAuqWzObVzJjJlevlUyEsQUREiVedzcehBcZvzCaUyWkmRoiDjHGSmVsHsEiVrFjjFMDjuIQ",
		@"lXaUqtLGqDflVcA": @"UgzeBghhHGAoWyAuqCfasboSFzFWMAjdmJnnKXVuNIJYhLBSkPSouGUuLwDmWLSJjFjmwNiTlDxQfvifcwGwxPXScvAFwjHPmkVOFOFvEmlQiRSVwwoLAGqP",
		@"vwDKyAFzLevdcF": @"jSBytjFveQfLozABgMATPQDoZDNmWHIkHMNsabdWJhIxGEBnyDLHLNGDSlHCtlHUDHFINdoBsajScuFOqtAQLkECIUkxpTbjOBSjLMjttnTmikKpyYzTgOkYgxUYsUxeWflAQhILiAFbwsirZNijJ",
		@"piLmpjYofJNnPV": @"EKbOIvscdhuQrDZenGioElUMLrZMNjYwBrGEAUwaTuBXbWBEbWscEROzEDrTseVPiAIECNmUeeIfXMrFCETjnytLuGQpFEyGZsZPpjrBXdg",
		@"VQiMODMoRZ": @"jZOhfWouLCGjBBuZOVfZSwHfvHRGPgjxbHrCujIZYXDEicQJSiJfIbUlwumNLGxAxIrIwCplMplUacDjxmEblMMuZyfCrmFDDqPuUzgsDnsSJrfIMbzIPbemKKnfipotYEQEmbvij",
		@"sfXBpmURyTaIpVBCuF": @"BNfUnAugGwsbrHbMeAxOwLyPpZjMACJLDrUTFIUkXvolmNrQQLCMNbRzrQofzTTZYzoPlDzGHAEbXcYLrDNPfgyzSxTqWlBonTsaXGsnRaWCOYG",
		@"MLzxqGocUhzXYGPKPPj": @"XMOFUFBWHZmqiDAmYcRJPnuakcMXhoRNEFypUbRNYaXqFoJljuZELsLLMTjSaEfYZRFuDjgiqzupFkPeSQYZvbCMskjhaMfwsNvnLAZxxwfNKunws",
		@"niGVQfjKhkZS": @"mJacQlHYZxcfDtnItJZqXMdyIuwRjLIlwcKNPzydGBdLtjuKkTSVqyoxQRInobmxhkdqPASYbFGmYhffATwaCIpnvmzERgsZpVkdnMLqwJTdYaI",
		@"GJdfKxfPrkioBNrVYEA": @"jvISpCnrhbMXfJbIohQoUzngOVUMkImKHZippkmLpUxrinZFmmCCYXKcBWlQilmSCvwYghAcuYZZegOlFbrkNhiaKdkERHwfBHoHXWgD",
		@"JiBSbXiKmXd": @"rpzswCbCGwpHTOluiQGylINagnssRAiDdRUSmSvfETHJJiZPbtmpnhZWJsZSeUNSliYYgYtVWCXMEFljCkiDAwhKPVFabNuVutRniMDaDSYSNmtvYepbvj",
		@"GuRByKaTsqFY": @"StyDglKgVLgFGIMbnDsczvqQlUffFCEiaTQtVEoKYIHINCEReCdFAgEdCxlXgLIiHJWSzaCcLSXMruhhyXhYkqomdfddGIMoyiqwtHHZGIkCYLpdodzNZORiOsv",
	};
	return KSTtbYfpgFwLDaz;
}

- (nonnull NSString *)KBWhokuLNCnRsVNEBXH :(nonnull NSArray *)HyDWgWUSaiWWt {
	NSString *jaMLoMbnesAUMhROv = @"VbpgMaDQihlefTzibqaXYoFgWtSbfayVekHqoqHVSnRoNGLqKXZRuTQZoZZpTlVhSWzQjtVPgKevEWipZBvDlHLBekqFCMmlPkyAhBpkBFulUEzMDfnGZAPMrkwOdIbZmwqmtQuSLdsjoJ";
	return jaMLoMbnesAUMhROv;
}

+ (nonnull NSArray *)qCpZPWkANfsuYUqZTC :(nonnull NSDictionary *)cuAeyQnBczOxsviB :(nonnull NSArray *)wYmhYLazXgdDRlsZ {
	NSArray *nsjyzHLQADGsaDtLq = @[
		@"SeKOvZJwlrXDQCqQJUFlRpOXRINNVCwpKGdwmuJspxynaHgxnpHveHalltZqVshCgzpYaXKLgZgoGboiTlMhYeCIzcQPidOGOUzPUSjDSELPIFQhTYOXDm",
		@"nojMDteUmRJFSHbftlYTVnYGMgxBOBlhYRfekipEAgmlPCTdGtQdmXZZyQfJbAzZrphhSFrlLGfUUQkBnftXgjUEusxpFDxohFFBLgBwxQ",
		@"eAdYAfvGPGHyZITBkTqiLPqWSCrbIyRncwyBDwquFkekVvtEtKlLZWpEvJHKZDghPRGcAyabAyieIGcLdwLUibwircGjvoFiiKSZUabdQKfYiQq",
		@"mjUoqERLJBxbwpqaUDYLgyeGwEzoWOjDjnDtjayhQsmkGTNNXUjLWQotpOlNmLDZMeqAnFAEhEdbDxkMZsCnMaIizpJKrHmsaoEDtVQeDprba",
		@"HmGUTGNDZgqGHgzbYTjVxSmpfOrwTFmeJlJRtTMssZHOFiSCHaipJGqqsZRRcXsDCRCTqjnfLaxMTOepoJBbVxEShSwPmHkvfpllNSguePszbNrEUILQCEZTjxIZsnmwTmCusD",
		@"REZsvUZroLssMwIYtnZbvGVVlphtVcWAyIbieLClvJOIgalCDwBuCYZjJkivEkVMjquTLutxNFkKMFlDlRanyvtSCcsVevzqHYtMAL",
		@"oVPqdKVEgDVgXbGQgqCyIxYphxjgLQBAwGrxfhXqXRIpRkIRuiJqCpacHCFeTaGTJqoqfBMtqQRMMAVSwEsallCTLlekmxNmPRfcDzRJNVaRLV",
		@"OijyDKPtxzmlcpcUCVQXEIuWWelofKtwuGIPumJnLsFPvWEAmjCbMaAapwcQvnPNbMDPbXobkyhBrTxHqkqlQnvhPtQAFrPKQznUxSjteWXzotPCRdvOahRfXFAUUnxeRvBUvHrQYRpDXcqkgDX",
		@"mDcsXiCwRpzlJgAHWjAsPyOjJGWxspfnrsumqedsvIXxrUpKBXtIPZXvZKyXcNxQsnGORKwLzXoKFzalHjUJZdWkgSrgtnKjMFGQeLbclAJXifCVNOPaO",
		@"zIgtUGdpPkyEVaaMOrfHhOtvqrSErgpPZHoHLMhpWhFSdrTrXkZtnwQhppquEVWUUTJEfzLmSchYhjmsuikbHCBOnpvxzompdVXjaVvgBPPTTnWxWq",
		@"ZxBQdijkIOBqBmEtTBYYuOrNvJjfKDhiavjcXNwmkfAtrozsFLxVdLVRuIKsJTyFyqQOkxentjiFkUUmqyugmdjTYLtJAWuHVbrxMproMqEZIoYqoiYYNLopyRdwvxICvyUasmmMKutUkePdDhR",
	];
	return nsjyzHLQADGsaDtLq;
}

+ (nonnull NSDictionary *)RFkpHYbNArKxpmh :(nonnull NSDictionary *)faRUZQBmnZHAYaah {
	NSDictionary *oNtAfSseuUivamsrJI = @{
		@"IkftaTjKnIcdHsL": @"UheIIwseDxWoqqEYeNJlRuGkqzjcahpfGqsYjarFurdAzarIBVwEQHNTCGykBmpIvFiIFvJfbalhbVyEvDCXZwzuGveqQlJatCNZRPRaKGntlIoBARUbyDUqyJLmpjegCwixTuJWUNYeHos",
		@"OIckKrgzxRidLJH": @"SxkPTIzSUwBcgBBGOCSOrGviOXaHLlUmVumZPUYPCXjzLIdshSvImsdZwzMkgLzgbWyZTAQBuafxAGMzWAuAjqVcijtmWUYRXukJfbpfujzbPDZTkOistrxfxPagksXEXvkvcamJJoDv",
		@"pqhaxYtmviEy": @"xXNqlmjfJyqzMAGLUANlujJIhpYHAptDJnhOnDGgUbCIrqpsBwGdAJfsgqDkGHpYoZqcsllHCKyFDLoLHRdtgERbRCfNFlRifBsHULPyiLTnaptZGavopvQPKhAzLIizlnAk",
		@"CfWihWWBorusbqjv": @"qHVyCijbDRFalCnqZuoxZEOiTFqcDJJLQdbWwOURrFrWUIpDdzDXcUTwkUMXlXmroKGDtsWvbANzKPziFWRDrjOQTreSODQogbxIyxMFPWYXA",
		@"NQxKlTtSLgTdjIxQ": @"kqGFGShRiqbnaHFdyUnQYraiNPnpQimVKSmdtLXIaccvuYrTgFsvqrPMepSsgnFPMjkNPCrdHgPbMVKQEkpqXuWUWpVnTadKpVlToqSuDdLyRtNDKAyKbwggqRU",
		@"NSPoNAHMshjti": @"JvOBiSwNdTOIxidhlIIlYBdvCQFbzxqVpyKFDwcXFaxMYRIsiVfuuFNVuXchXmqXRPCmMnFuFvcrqaXNLZJXocPpjPCSwbCBErYayMdGidigjbTcyfGViDxsUQMLVjiYFErJduGPQnYQjebCwvJy",
		@"FAZMEcwdAuvBQilo": @"buFxEZFeOOGayTczCYJOQIEVweqOOHELLIpxpdSZJlOSREHRfIoDOoezpZPjrElhgcsRunCvgfrEmlaKZUIHfaeCZTkjSQyCQGLOIPfpTfCze",
		@"anayudamzec": @"rKVfTRWgeBgTxmSqFepbUhJaaONGpqcNXmPumZrwNCBFOjKzdFkYDgTHOhzctNOvbeVZDqLrpzbmoqZxioqwPUTDkbxMmcyDRSeAtnoYMfGioavNjDUaxlfglThAizmDAWHeXjVEmsyG",
		@"OkmhxpkGixBU": @"SCYbHXSdmURBylNygxERUGaUhbnolxNgEFbDPhjqyQGpmnBecQTfEvIDiUUjTiSLgMFlmUIcFpsfJmNppjZWYFRRmHOFhPSCKIoIOXdkoXLWprImGVRkFuhcBWnwXSz",
		@"vLRoQeKwQDJSdcJSN": @"TrOfCHQaKGZpUARtsHHTTpPrBIDjfMWYqCPNsLMaPWeDtSWRIsTRQkKSOfZkwyaFBzReYlheIkmrGdbVsQSeqmXidfVevHEFQcSHOsyCdZRvSICFdtriTnTDmSWoNfZJyFABpya",
		@"sAAXZOPNBWlI": @"qQHSkwukGxMfGgJtjglQQtjrCtkSoBuiEuibEpGkNSwMQGOxtszGXePUhojdFoknhGQdeWjalbVySdmrSVkxVsNivYsIBvKsdZEMsTZHbppaEoUzovKC",
		@"dzhZYoUbQekVZbR": @"wQBOFUpOxRPZhLnmOcRwvfhPyyfXAshmoiLGZztInKfvdTfFaHWVXEAaGbpNBKkIDsVceWtqwFLmZeqhwLWiyDPzbGAHerAWZpQghWHVnOPenATmSSV",
		@"PzWHGOYXEIPF": @"gGDgUqhWBvmVakcQKkNhrxwjnQpkayJyOBugidUIthwYbBTmImUuUvGSCsPkduJwLZVSCBpaMntYVoTcdDBmuwGxhmwwzZBNHnzYdgvgYlFBSPlcrRtgDwXfZajLzTgtYFWIHxKAeQqnEAFpB",
		@"ImzSQLxLgp": @"crNmbPXizOpnJcwkgXruhqZPhpqUwEoVVDgDYUXzaoOqbHcONgjHUajYwwsELsajIiqMMdgXrZFeHkcFrIctrdmiolihtHizoDoYSvWmEil",
		@"CHGWKCcfsDn": @"ovnJMPHdwbSHORTexiIamIFJhnFQaQTghoyAMBGHEVWpFkvsEoVmSmzlEFWvTPBHWtLLHkaITYhehfKHFTdmerOrJbVsOslgpoJJzcvwekDNkoIpXBPyfTvqrbkxdJryEHCLLGyCC",
		@"SizJwqXSNLTgPqlIx": @"hssDvDbsqJGycbEpjQwzWprLqncKngMwckasbcfjkwgAnhAbWbPwxcUyLPNxITITTQjtlbtrHakdCcCEtJnPDfAEIFUdUHYVyhnMGVVppVH",
		@"MAXbchVKItPteqpaCX": @"bPyhUESECBlxtDNTaAHqTCJyRWhJjkbqWGiVvzCCdZGJXEycZSRqzgzqIVnEnfpCUImbooFaMwJvyGBvCIOJuplhbcljMeYKmoYsjJYMlbmffiYLjyLuryciNhuulrld",
	};
	return oNtAfSseuUivamsrJI;
}

+ (nonnull NSString *)ZnwdLOkkDDtnoy :(nonnull UIImage *)iWGaVbucQunV {
	NSString *wcRkjtoFWRDCflQI = @"jwaGuraGDhoeYnNrMZcoMEmTgdcQBhlVOwfEkdjVciptesQyCePzfValxHtZQkIHYYCSYwwtPZCRlJNorJyOYqqQzNJrduXmFHcWPuZSE";
	return wcRkjtoFWRDCflQI;
}

- (nonnull NSString *)JZEuJKyccQQhMaYl :(nonnull NSData *)UEtqRKraxi :(nonnull NSDictionary *)OgNsGhyVtDic {
	NSString *ExiRwEOHXnIn = @"tZzFBgTQDOgIMveErcTlnxCIPuRqxYaXSHwsdzLckkaUKONDQYoMDGtLUjBNzviyYeGQgDFSFgyMGKWgaVICAJFAHvFpRiZhsvoaXnebUvtusRqFDidvkzEfvMxNcluYuSMbwiHqid";
	return ExiRwEOHXnIn;
}

+ (nonnull UIImage *)rkeLfSysMHERUUwc :(nonnull UIImage *)WYJKEDoFSrLqG {
	NSData *bbUSYjvbbtvsLuv = [@"hXWiDWeiCTvUjKlFetmjwuSatKhNiAzufLwaHaWIcUEilrEgllpaSZLYUjqXbXqaBWmHqDsJWTIqBacmHaOJgMUlMvDucRowAaqTEkqXsRVOflhzVUhrgmxuIbpNalMimsGY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rNdlGUoVxkNGsv = [UIImage imageWithData:bbUSYjvbbtvsLuv];
	rNdlGUoVxkNGsv = [UIImage imageNamed:@"FFkjdnoDUnjPxApWZrRvsLqXKzWJvydsMUbIsLxNBhrxlnPdunrEmILJvtxedgsLkePJDvGUqtfGbHTopFuKQrxJhJwfrfaJUrosqYyWfhiPeZSBAdGhgLqYKYqtFJZCgy"];
	return rNdlGUoVxkNGsv;
}

+ (nonnull UIImage *)pevojBJJWn :(nonnull UIImage *)armRIJTWcQbpTms :(nonnull NSArray *)AHMddYkOKNnb {
	NSData *CatWtGkJOLGa = [@"HESAYaxmyqmnEuLXmNDHWiTFdrdybQdzYmvMwGVoJhvichfaMPcHNtVqMDCTrUnryQsiYquwIcyRHFqQthGSbViIrfUnQxgmGXwN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AKvNrUasNDJ = [UIImage imageWithData:CatWtGkJOLGa];
	AKvNrUasNDJ = [UIImage imageNamed:@"rhzpXenWExtQkxeyFuPWMWLXEDiJlRinTDOfGGejHXrClTDMJUzQjDxVEQeuoCiBoXMNqpDWjTfKUqfmZwDhRjzkHHgPRtHcLXQxKxWHksIVv"];
	return AKvNrUasNDJ;
}

+ (nonnull NSString *)bwdJNdRgqKFdn :(nonnull NSData *)ycosnWEsYLfrZRq :(nonnull NSString *)zDWZMwnOXWskogxc {
	NSString *MyFFlsMSHjWRscEzHX = @"OXjVvCiIkyalCAzssNlvtkXLctQwsgInfWfoVOhcuJyFLQHApbExTQWutTjxFnrdHRtbXOCIiUBrSCWLBbkEpPlvJcCVcYaXgFJhLKxMgfqCLZfPGGIqFySGmPjkXTeEMxUhd";
	return MyFFlsMSHjWRscEzHX;
}

+ (nonnull NSData *)QhzzMmtNvtAVcQzQhkM :(nonnull UIImage *)KasjcAGKReFGYcj :(nonnull NSDictionary *)KinIEGXDNePWSbL {
	NSData *xPWRbXafAvroZ = [@"MeDshgthzSVbAJyomIsZqhrYXdEPkjhDMewkCjtOdSdJpoSvDxrZKMERLUHvPiAXCvGLwjBlqKOulFhuLlflWUcymHzpnTeKEgEoWA" dataUsingEncoding:NSUTF8StringEncoding];
	return xPWRbXafAvroZ;
}

+ (nonnull NSArray *)EHjRfVHgQBEtRI :(nonnull NSData *)bFzjlsJfdIMo {
	NSArray *jJpCRnXxVL = @[
		@"VOrfDMMPeqEORYdHFWbQpJGmExeqNMTpagNTNDHsYOttZhqjfAZKxVAqXonmamoVugBiljYIyqpPhBwoyxoBIxqUQBMLioVZPhnbAiTtIaoMnKSTWvQWTLIP",
		@"LiXDddpLoxhzwEtueBYNZXLQWtyNPyiowqZuxYtGlNbTlksLcOGjiCpKrfKiuCfCFlMLCwjQqrUMEGKRAMGXTdnVifdZhmAMzwByix",
		@"ykyxQIdtcJqbebaXlosGxNQutecNmBivNFaROqCUUwFlnmprjvVQxPjAQSgSEGJEYklhvzWKtTKuWYYQusiGGPPUxvluHhrhkuHnNVORyGnfNsZuXmGsJKFgiUEiKIYxBhDcXmKhudD",
		@"XelFnafrnDnevzckAZLGIpTwEoXKqvMWyjmJHRMsVMvCNHrJIJCciiOYohAPVFceICyibBhvTIwJTsmDEIQZBmSoNeuLwRqiaPmnsewNlzCdKkRi",
		@"ybyebETTjnyJziMBkefSqjdERyxswzoTcehLgOkQFTdhirzsVLpoZliUPoeusubHBhZoefOzFftyyyAFVZyuJgGrsSvNWVpNZLRdEraaPSTUKmaVtSouDXhnCI",
		@"VOCprZqzCgAJHmsuKsNfuaDOmnDacuKMAaECXjHftzxYZkSVzJoZasiaiLlKmRNqMcegkutJBodCvVKJUwzZXGRsbeJqCTaEPacYmwWPXsQXWnbUdtvoFSiCuWmZNCSekfPKpfh",
		@"UJBxiTPJiLJJGYOnBdEltcECbmZdtbOvEImKWZIYNjLFjgbiKoDCHWJMzDvYzhPTzrRWorqeyTFyLskaVjLdjuubxEBNawIssbzPGPtygIXUlpDGbwBipXvQCC",
		@"dFLUsKqpjjIrTLjSjjsmAgHRXzpjyCsXNbnoGRPmbrGYtmRTkqJOGQnIeumhoMGUrajeKnhCjerLqgUUAXcKOWQvQuIQuOsjbFORFpgprYaHXt",
		@"yNnbNFpDYwRhJnFQODsmHCMyDZgTLEWrlarKbejZrtvnSmBySkkfDAyuNVOrmuPuhBaZaGhrFweAEFDvGMjciAbsmiHJPXYPsdPkBujcJBeOKBBltYXoRiIRFbeMvDgkKUGOpABrxtTeTlEF",
		@"rDQFzwGnQQzehpxqRxjZgPNgASbsNsMaWxLXWLjZOjwhoHeWcSXbotmVjfPswUVoJvkqppPwtbZVacuCZzkXucIRYjGgdkrlOZmfGYcQwXWQDZDvCiMBcvApsygsqSqRPBOSmv",
		@"hJXeqzSUoWOCRReqQasPrijabYPbuRfGZLKZOoMYQALXsKJMDcsEQHuCLZMtulgEWRaAEEuqfIrrLsznSSOHTyXgOZHbwFDAKgTVXJvJY",
		@"DfXqYbsNhkrZRuLCyNlGCEIVExPaLuEPypCMbQzqCqrBrQIYoNwTAnEdwmCvuBNmDMbLyNZIXlgjaUefBfrlJdaeZMCLsPeLbolHuGjRpxhLpwKKvHFgLdUgG",
	];
	return jJpCRnXxVL;
}

- (nonnull NSString *)vvlXJSssnWF :(nonnull UIImage *)YYZaYuTCOGohhy :(nonnull NSArray *)xfPtJtJfQIpPcmEkn {
	NSString *bQRWCafyOb = @"JLTdULLQfOLkNtYnZZBqVdJtsGEJdKBxjtHPQVkJwnHJhceQQCAbJtVLXTnGwkbIwKNGUZmrKWjOaQjHevoafrkUPMrMwFAKreBrAOxCkIBaKlkpHNGDIs";
	return bQRWCafyOb;
}

- (nonnull NSData *)DpyogrgcLIAV :(nonnull UIImage *)pqsevkGGMkMbKARVYbz {
	NSData *OOlMuGxtiiptX = [@"UGybnSoLJQWmVeXoyEmSOJGoeYZiLPDxLWkhGkFGkULGTJQkgqdAuUIKAfndBgakAnyOIKqtgkgnkKoWDpHeLdnhdhJSTLGbHfcjMXnWXaegmkecrZ" dataUsingEncoding:NSUTF8StringEncoding];
	return OOlMuGxtiiptX;
}

+ (nonnull UIImage *)FPEYGcMiztv :(nonnull NSDictionary *)xpnzWQnBkhKYUyvnViJ :(nonnull NSArray *)GHUHuvyNVnBSRSEvGt :(nonnull NSString *)tFfYWwzjbdatlu {
	NSData *CgnryhHQdhXcZJPf = [@"MBKowTxZGRoFXQUuezyRGrSjEGciofDvbyDduZmdEbnVuibLRdbOEDpXzXetAUEgOOmWZpHIYqrvUpbCwtsueOucRuvxGMqlfFDMdTKIv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kMRHqAJuBklLqaZbHri = [UIImage imageWithData:CgnryhHQdhXcZJPf];
	kMRHqAJuBklLqaZbHri = [UIImage imageNamed:@"gNukqJfnEadXEzPjKFebBDxjNbASnduAsxdgnscVFhNeWqyvZYGKJoLEaYziOzhUTWSumSKUROudZQEyHcfWfTWMrnNGQdvjOAxOwNvQuoOkyMJybOHaDEIDLuJLfhHdYAMACPdM"];
	return kMRHqAJuBklLqaZbHri;
}

+ (nonnull NSString *)gqsVlxCXbZqMYI :(nonnull NSArray *)mJzQZGATLY :(nonnull UIImage *)xJPYgZtaXt {
	NSString *PoCcDRmDlCZroXMIG = @"crOlRryFkHwGiTzktRmFRaCUrccZbQLJvlEpyQJDMhBstZVOPUVYCNQwGaPRZkRgJmMgwONSGeCYuygblUmSkExMEcTqHYuhhZGomzVciStxlLEFseIRMcyQPWoEzwwczqVKvfwWYTG";
	return PoCcDRmDlCZroXMIG;
}

- (nonnull NSData *)OVJiloHmhrJ :(nonnull NSDictionary *)OopAhfWDLTkzZl {
	NSData *nxlbkGmADbhwB = [@"yHhGWYDcBTpJrhuzDPnBIwuVBUGowdjLutTxnYfZbwsUReFaXGbjPIGMGvnAAHGCJbgFOspOICkzKWempqwiayMiEOiLUSOzvfDaovdeXZVnSZLdVZVKAIgcwixRsdxeLFoGjG" dataUsingEncoding:NSUTF8StringEncoding];
	return nxlbkGmADbhwB;
}

- (nonnull NSArray *)LmpCiWErfnyHHjTgO :(nonnull UIImage *)gyTDtACmBrTwgXz :(nonnull NSDictionary *)tApaPlIAml :(nonnull NSArray *)KphDFDipdu {
	NSArray *FjNaKHJTScLj = @[
		@"QWxDqULbXMafTHfKyFTMvPWvllxhucilfdkUpSDQQMPyeUEQMxWVVUZDwDjuKFyGlLQBPEUpsqkLMWdYrdRKtYTtUJVYKnSJnxLKuDtzuTFAEJogc",
		@"dzOYKMMdwjWakXjaCFxqnzxHFdlfyNnWqbjFKHOPSTAGmrkijLCAqxwAdefTpRUNqeinLJwpbdMuLyDaItKgoiLhvvJBAjXJUMwlmKpNnZtvyffJhXbKSVaHNPKCcFaut",
		@"FwFsYzHNttjrfcbSDsbsJjxDmFVnfTFBNrjQcGmdNjuNyvDkmEpcGFqlCvQIyUNolQqkXzzUSsLGbWocdxWrlqjuDdXgpvNltIMBqYNiXQpOXYSJFgFbWEzVSKrRBADkbTvuBWQHPrtOCNRGjlV",
		@"FxgOPmIqrWCkGYwFvtgCscluwsiObyBtzobJgLySpxhmoMSEArWMpxOuEZheDOQCThzAfXmQobWWRseajgLbzdMyJDsxRBiWmuSZmSaCvxsGunoyHQRqHWLzGjdypVVeWBNxZIB",
		@"wTSZBVRkZGJLEGbCHoIquAygZUKksyvfWDvfJSLHnQihWnsNtChdIfBFnnIsyQUxIlAnAgYWDtzujEhWhyUnznOrcSOlSsgXiLAEIzEbmvSMtmKkdmVhAgk",
		@"adhndCjCwqjQOOcLxxBKlYMunmVXXWVsTdEQOPoapfnzMGmfUYcTiKwIHRtqMjAeUJXqDzPiNKQBEYoinRMvBKsBZPFpEnBXbuMtnqnvDvEEauPzSXdPvJyydAdTQRYcgnvyWIbPdr",
		@"LOgkqFKbwyCeDGUmdxezHznBbJvFVubSUzrKAILyotFXoKyPtwLLnuWlRYpTZMbEowJTTKHxUnXfZgIpfLWDogiNNXFNGhWIbaNvlgoSJwvVqWM",
		@"ReaTvQUxeWyWwUeNglfgLvrSnUMqzXyvZuXCjynQYlitCCPViYIUeGAoorgzGnlMdtvLQuvZuGiYVWNTLGqngWjxbkQFyObosOAEBzNJJliwCyFApFDlKPbDzOfhOIJODfYYVRjZOHKjlfrSoULD",
		@"zAAbXbeggMcPimXiZGBpgqbtbSGmReZUigmJfmmPrFVQhEedRluGcyuaKckzjzWxXLFojlidGXAYxRuWmOQfCEVOURcZjDMIeZezYUeernvShyIYcQfehBNVAXleKQjMTmfycCoVIDlgRWAS",
		@"rtZgdjqzxoMvvNWggzwOtTQpTpkPaacvayvxMPVVZmDsiDwYanITZywAKGozqRNxPBUbmzucYINLpzRkCjdlLbyBSXTXNtAuPUAyEGjkfygOxvrrYpEMwSQWsNrvzdJFID",
		@"QrUrDxVsgxIZrvhIuZllxPStjtQyLXwovXHyCQZqXmSkzJfuFOtcJZLsowZmYELXtOYrRXRtfUUJwOZXagynzMCIbaAoSdIDUmidGCPFvsmxWxSBVzetzuDjhciYRoP",
		@"NpzzcLCxiDQxDvPdhbSVXwPAviggNizqtwWaqYZgOdYrjZySETtscYAoGVaASTBHjsglbchreqhHsoUOPmtZNvRacRqlUFagVljJdQ",
		@"fwTRMLccruzeevzWHsgzTQQGUPmhaQlOurQhGxPRiWKLQCmqJFBWjZinpnKpKCyLEAwgnJQKxegvnGWdfHhcbRHQRMvYGxFYOTpenYPdVgZawHAfS",
		@"ewlFSSYEqVgNVxLxdGzRWEjRKxAFzmguTYFHMcRxHXPpJLdGuzwCzkpjqcQBBLKmelpplHYskpfyvQvTGQNbQCYoVuavhECHDuLbrPXkxtVXZpKiSivvcjQXlEaCcKNiXE",
		@"elSkDYBcCjiWuaGwJlZQvRkoQzuoeWQDadklxRkQYZgFSebTnVugEgZGZBTsPJcJpuPPIoAjPasYDOUKgRNbyvCdzwUsQJqWzVtAokiyDUFxBoDONYIEmpdiIcGFlXBF",
		@"gTWRXASAJCRzEYbZdbBWezDRBhdBBtWUfwEBHwrqKePspZjoSyBpQpyPCSeiuALRRDoZhqIOHnNoYcgrNtfmdOssYWFZnETIjAfghQcCXSBKQubqAYwKdk",
	];
	return FjNaKHJTScLj;
}

- (nonnull UIImage *)lGYLSLkXhhQA :(nonnull NSDictionary *)jRJPjZNJGg :(nonnull NSString *)uOfpTJUkqVZPYoNI :(nonnull NSData *)TPZZPqvBQBsau {
	NSData *fzhVYwPcOp = [@"JMtUQbsaspnTivBESycepvmDrMAAPxblwSkbZhTveYtDAeoePStdrDtkBIkFkNjfgOEuGmXRBrwMcgPPFiajGLDHBNrKqlARVevlhrtsFhgoXFdyyqlJOeUvXXEDKVxwUCIGHcZoqauMq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cpzwWGaAsQlhbnQ = [UIImage imageWithData:fzhVYwPcOp];
	cpzwWGaAsQlhbnQ = [UIImage imageNamed:@"DmFzHsLbHVKEZlYXuQbAkluRGYJGMvSotaDdHPSdUXPtRDabtIdGSOtbawWPJhHxosmUiuLWWPlTelclCeTcBjUXjOlfNKnuhPZCzzPkoJCIWEhMAphDvWkepHeb"];
	return cpzwWGaAsQlhbnQ;
}

- (nonnull NSDictionary *)paMsRPTyGz :(nonnull NSArray *)euCFBxEbDRfAnc {
	NSDictionary *wEYMGlTkLweYcwwcdPz = @{
		@"jUrqKuLVyeArFP": @"wTFsJZNxZbrZEYeEJzzUgPmAvoqMhILhxhguOPixWPsVhCXNeMDpGyZGNammfFntnwXvbbTDueboAuwKGXpKCrouyLZCXhVjFjhWWpZkdYuXkZInQLOksydAnTAIaZDXRaVbpNeutsUw",
		@"NygLYHRLCJSyLhIXxU": @"ounrFrMpnRbafpKSmkiIXoxFLBlDjOViRCJrdvrtotrHbhhMkPTYocRgBvBQVatrCHEUXMeLaLTkRaLHuZNoHMrasxaAjkITkdlZtcJsURDSpx",
		@"sfyslqphvu": @"XTwcgscqMUpeMJONHpwEeTXcdiJpsMgJSUeRnsiGutNCApyXytKPfcWqHACWVDbyIxinRiXqUaInPkVcbfPimRpCzPCgGNDaCzqIVEfFmgFEeU",
		@"ODVzFngXtGZ": @"ihufkCCXZRsfDAfUWVChvDQWaojasJhLktpZDuYXiMiAQPVHhcZQTbXDRvKsNWrrgLGaPJtCZMmdWgyVglmgTcNOcZCShpZUlFhHXsctlZnxSWimASqcWqaqylVQdMq",
		@"BAsfcXUWHlGxWvcrXmJ": @"NdAoNZRefEmBLBjWWcHHXIhtvzDBlSVZTVsNXrByKaIIHkxxrfkoaTDxaIWYKjFvziuggTBLtzuWfgeOmaLHzixALuHdzFuoyDWpPfFDlknbGd",
		@"etwPFTcYHpasSw": @"JYfWnLdVLLqZkgmdIOzITRUKABqLmriGpZqaVKcCQmzSytbbcpOWKiRFbkBMUddntyYVzOTTfbhzpievyXPvtvgEqOQFYcJarHWEKsJMEdaElyiBJMMFrdJQojuVvicbiRr",
		@"elEuGlUEzWFUSOTOyfd": @"uAAFMaoHqUNopnyNbRrDULLlEjOMKyeBwtIeMGxVOUFibCUNAzVXWOGSOVmxlHwuYvLmhzAhdmPRnxyqWmBuGaNLUMgvuGJyUzSpSQORvJYHxCxpDfJLSK",
		@"cqnhRjZXxZYr": @"SNRcfLIHLCVApRbBXnvIvPTOaMrUIFClDEHyyhHfIjySACjJpLahiFuaqTRhkIOxajAcGmTzjdiysMHslALWtJLIWxlLvuFIMhkjOZEiruPyVnyeucWhPjhwJNwtGDgVL",
		@"ZFeuLIYnbbjpNCPoLA": @"auSwjktcdJkTFeFixPdzSjjWQqaoBofPfpuOiEZZkOVGYcGkZBRZwCBXOpUwFMtLZxNDlCbXEEyXGmpqWrcTZwgsDmTEJAEGRAxYevGkmdMfJINETocCzYBjZBXpWNbGyKbGwOgLHiCcwkBXteT",
		@"lhqZnpzlUtfdKtqfLsz": @"mdhRVUyxoiOJnHpZgQMuMmNSIZVJPHPQwhviYIvWVbnjTwXhRyLqMMffpWsZyPTxxQnYumbibRmaYphxOdVBMiRIWTSfYmJliJRRhBrsHWSSdYgLTLhVXaYVpCJEKIdSUzlg",
		@"IfdOHJCNkCzYrPQn": @"AGoxibWzpXtPOhlaZWVuYaStrnzeqnaqAkwsNqejFMnnVrsttnnQIXmVveQyXLdOvajdacPBXfvtkkTMIgfEqtpQwdszlVUTxnvwsXrNdktuKgptvnMCJnOUczPGkVVTPdKDWIJfiLmaPPjPZ",
	};
	return wEYMGlTkLweYcwwcdPz;
}

+ (nonnull NSDictionary *)HUZgwNpfxa :(nonnull NSArray *)JYSAjmoDof :(nonnull NSDictionary *)CXjpBOXLTSiThxsKk :(nonnull NSData *)YFIdRtcNiKwKstBrrH {
	NSDictionary *fGwhBoRgNERuO = @{
		@"TpbyZFiAmggDJwK": @"hpEicahyIYJesyjrUIXELLiNAOLHFyfIdJPrgcnlJKNHXUuEyiDjofIMBgVbZlpuSmMMCnStOgfijZOyMdJHoQTfJRDGPCHxiiOQbDbILKtGzXwmM",
		@"ufMGwwUYflxKRdRFu": @"qcRwCAbiGeQLWgYHHawWsYORnfWIJTuJtAyAUPaQqbmXOadGbqKDxFyJbRGxKvAfkDOKqkfnJqnsOwSNVQFdXeUYmISxyOabIOTBPeCvJJbRTNobRQnpmIByWiqtGVlvMOwHCkwA",
		@"IufTBbuYBsh": @"iZtLhDbZKEBnafnwMEkbHpRTeTmrKPyewSlncKYcOnWGaygMAVhHERzjlPfiQcaofBfIIJFHQggWTLYLrouZxnPRBvuFUoUROnEpEiqBL",
		@"CwmHLhPklKrFFf": @"ZKgCbVlbnAwRQDSiYTnDVuCTCNCMKNlwrRhaidrcHvvGkmaJIFqzmoUUGcncypYMADXmiOHCKBcKwtnuMmAqMPmqiOKOSkkIpZuKDRAI",
		@"meKbhCmszKdYy": @"VArobkCaAzAOKNjtQrEITixPVXUldxYhquJCCcFugQeDUevhDtOWLurmLduaZCkqmcwcuYmfbYrvwtMasmLRcGidFJxJYxCirvnuwKxkRHfIhBldihRPqaaUXM",
		@"eozBbkxHWQXwAfbvxvX": @"AxYfwNDngVAxmDcFDTTPDkgwvFlUMjHjamqnwuqIKuDigIUfDkkMhcQjbJUcPGUFIOPguewBEEMxYmoDNCypjOhcHLYiGnQXuhcEkbjNZXLBwhcraFnaCX",
		@"ORGwqJUWqP": @"qKYasKlrMwXTYnBBIfvLMDkPdnyzMLcHBhqwXeTTgGKcmbTVwIiehTMzJVPwxJKKdRbiNOCBQdgFXoLvgaMXWctypjZcFZviTIimk",
		@"guzfKCKjwSp": @"ynUkbJygWfgdCOKwjRduWQUShNLihxTEAXOiGbiSefNUZBQxEYEnOsjiFBtNAsGpdfkSBmEgtRCCqtozVTmtzJgbxBhJQUvVVslytUVclUAAqMmNoLlIjD",
		@"DeROfUKWBvOSVpUJEV": @"fHBvxaRFSCHkosDYSyBAbyoFVzdLJMPMhrIpUUwOtctxWnDhgEPflZrHtIDfFkTuaJVuSNjUsIXhCPOgBVIihNVeKmiAZCpnWiwnP",
		@"wPRYmaxnVgumk": @"cqJvUZtMtGWaWoiPIkeNpgSofJwVJtacZpVzUfsKTRbAggqnczoNuhtwvptmVVdZBSwDpmZrtIxXPzPnOxFDvBrveKtnDkkHmfIiEAztxhnNsKjAOSHY",
		@"jrjoyLMVOcQ": @"eMOJkHYQtbwbMviSxRzewCbObrQJchyZpyjCHaEXFhMVRPPvSlYeJXFXuHrlojmjzJlGSyZhcBIXBBUtMiioFrgDSsRYaTClKBFaYatDQNVrTmcJaGWQQzrgxSndPI",
		@"sHfOHuiaHizNmllJ": @"CtoOdciBCYoAWIGsciRNCmFKpUQpbwOIuhMcvqQctzFbXUaEggmdpZfYrvezlRogMXWFfWIGukpXnbNXaZKtHuLYSRsKfmhOjWQMTHDuwSLMVtTAhqnzunJWZhgQycxPF",
		@"tkyqpDeYxMs": @"EPraaEYafTXlMWBawqiGXdjjictwiLnpbprsVzNlREkDDrHzlyDOElGpTOTuhJhEdNZELHeNaPvJtyXZqAQlQJBFSWRzwcdQSCTwbdpHHpwRJniGmwsmHaWcNVrRaRNJOIwCHDhCAdHiRH",
		@"bhvxJMasRdIlwWZNbZ": @"yeZMRXLRMYgiyIRfjdhkRbqzhtGhudjfGKljnrOMqRULQSGqlowakbQuoiAbqwBjwKybcUHVujajghUGlPrRCPVYXjHEgClCrTFesOExhXPBrwKCBQEAOULAutQeLvH",
		@"ehqaSoxdfN": @"jhNtgjoxoRaYIxQwpZsCeFqBhDcJuyoyXwaubirYDxxINppBXticnkhcjQKKgiMMUlqnbZvNmLUGMlPQodAUTwIkbqyEqLTajAbUwlfGwhfVAHJkAjeLEAutNmxvBqM",
		@"sHxIDVzgiCz": @"fBGaEmNMOePxTtzEvnHZjCqUMBbQNalZzNtgCwsfphnYYSCnAeMpgKDkzUWReJwqqXsRazvLIkvsoRATzShYGdmbNHItARrtjPMuIIFPOPsbxWOZFxAqhFsACH",
		@"uAfLMbXabGQ": @"PsoDaPzyzFQgXuoocYJYSIPTlLsaLQpwaVknDrWnygMOiAGpyXVgdtNaokmuGLMUqCEifEGznaJfVILorJTxfZmZfIHRebZVzmCzDanIWyrjFd",
	};
	return fGwhBoRgNERuO;
}

- (nonnull NSData *)sYjXgNoIMBolEr :(nonnull NSData *)bKvyyslatNVxhNZ :(nonnull NSData *)BeZTgiBIUsJefO :(nonnull NSDictionary *)HREBmYgGWGwiPtgE {
	NSData *gHjOwxcsICuGMpRVaV = [@"axCSiIxOBcemgkMlTTDtCjjcrYhbCNgnvZdnZpHWCFfiqWaroPhaEINyTopHomJRfWYDliOKxbeIMSihTffrKIpcwvuZdEkySnBYUyGvgkPtRlRpqFZWPysaHmupLHGkBwIhjJnm" dataUsingEncoding:NSUTF8StringEncoding];
	return gHjOwxcsICuGMpRVaV;
}

- (nonnull UIImage *)OPZOhcMrmKlZn :(nonnull NSDictionary *)amqhCNsaQkmM :(nonnull NSString *)fWvWcKqHWkHAjOx {
	NSData *CVSAIByrxNlY = [@"qWDvjhLXnwysVPypyboJopDTNwriohKUUKZpMEPOXqGIDncEUHOIuQZAgNwUkaibkGAaCQmmshaejTMXAwXZxIeJnSKRnRBULHuPKKVPy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IcmjWYgyvJtKV = [UIImage imageWithData:CVSAIByrxNlY];
	IcmjWYgyvJtKV = [UIImage imageNamed:@"aiGdfGNLVxcOucjPqYhReevwlrctiqSqpRgFqsJEvzOPiBzizAHEDSoOnsoYozsEfrGnChasfMRbFIPcVowmcsXcbSTULbzogVgqjmaXDRBSxWgEGoQsuodRgZhyP"];
	return IcmjWYgyvJtKV;
}

+ (nonnull NSData *)DojjavlJDobNkh :(nonnull NSArray *)LCrEvTXDkixAM {
	NSData *LNrOMAxYhWqA = [@"gxGyjHIbdMYYvcrVsVnzJjhwiSJuVaRJakZmZlUbqyDvbQDmDrHBmRYTrXyUNzRZFfZErNBErpjkPWqrADIcRzfwjjlRUFFjPstsHpIAcvKavFIPomwQzBMQnSMNwduJXzamhoPYxpMMqwAGFm" dataUsingEncoding:NSUTF8StringEncoding];
	return LNrOMAxYhWqA;
}

- (nonnull UIImage *)telPbQrQNzKvx :(nonnull NSDictionary *)AYOeEIDhJDdDQtYE :(nonnull NSData *)ZfXqahamStRkFOl :(nonnull NSString *)jDxqxgVlKuqMkxRMyAM {
	NSData *aiQkiaRPukPTotnAsk = [@"qzzHouqFkisUMqwstrAhXXRwVhISQIIuaTidNqCZaoRzVdrvVTbOLkzBYvDzwSseGkvQmaNSLygIHtjHoOHitXLnPQTvywXVtUupUbtBPVSJsv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SoeBzBgStXVEIWHW = [UIImage imageWithData:aiQkiaRPukPTotnAsk];
	SoeBzBgStXVEIWHW = [UIImage imageNamed:@"TFHecrKEDymMOcPvmfajxlaQjEXhpdjEtgSZOMTeyMumPKvtTPbUqEsdIXINuiIfkTQTQqyklGPxoIxKUCSNRXpFjbPtFXAIhQzxSkSjBNxbPyDC"];
	return SoeBzBgStXVEIWHW;
}

+ (nonnull NSArray *)TQtiuyOvrFlvlZVEeeq :(nonnull UIImage *)ccOQKibrHjbF :(nonnull NSData *)xvwiKuOQqBdUUpMHp {
	NSArray *RgRswcfmcP = @[
		@"GdjRbOCRtjBLgLkwWRHAWsiDbfrcvgJTWauEnQwkEkoiVqWDJnZUYQEeVBvvMfqDVSbxQGbzTfiKxUEeSImRxSWqjDCBjAYnBKnvtOLoFwcMrSQvUXIsEFaPQKLDWxJThjUraRAealDq",
		@"rdAXFNSUxNFYiYrvXgRvocVBjsQYxbdMTNjpykqjujDjEzSYQLWPOahHfaosySBdlTNYRfrLcbDGaaPqHkxinQYTVEpmItAZnegLECneiNuspdZCQoHAVmLQNsnwbeFNbyhFwQTMNESMtYpAEcDwc",
		@"xCjoSNzxOpgfleCrzmcMDmLSqMwbajCBYEuMkSQaPLOruLTvRmohmiwYjpYASsDvHYDaLlseAwqZSZJPOQtrAGgtEbtcQDTyWYuqhYpWDYZlikEboBm",
		@"KFNirHJRCmmoiVjjEZvxkkqdEsrMHdqPwHiivGgZBdYpOmQhbRVRCrkmbRowleHmOfTtxXCYJBoQFQuDBkjLXzsjHctQxvxdWaaPwasUwaAAeD",
		@"MbQsLIVGUvrkkcUJWYXJLtRfjmuyWLUMGeiCpqNjraFbLwYtZGzGhyqiIrtTacoYyYHiBJJivtXANLdLFVrXpJrxJoymErssIOQQmobGgMJ",
		@"xZqlljqGopobASyHrzRnBczQWvNEpJoDRhoJjKmPvmLwHFSujwIAdEOxZMOHniblfDtFbTSalIcCXxZzSAULSGXlEKiCkrvecXvYNKknrFBsDw",
		@"IYDfdUiRtxXbbMaFSplazqpCtiJjQlCAQYtbhJzDyzSXGGZRRwHmdcEwQkYrISlJZuWhXrIWuszQNswbAZtaPNfLAdnDyTzxarOojXlWQsTUjfsWUigmyAIIXbF",
		@"aBNzfRuuEDdclZPTCjjPfBqzUFxYiOQQRVvzCRbngMHWmpkqOEmvfyuSfUlNVycOyoPolOoOTMNmpzVOMWwIEOQwrnAHgjtpfcAHXaHAgwkXWYOclnUAaTdOkWLNoCU",
		@"uPRhhEmoJGiblsLPhCxrddPgRJaSkNjCAGFBJJCFrUSaAYcuUtorNXEGoJTImYUmhsqYcwysLoUFkfVWhEdWYWhgSRsybdnPLYwlyfzjTFIKZsIOTrDKBOw",
		@"cJLrqeWfHtQZUtqiScvuGOrCwhxIbvzPITBknLMsNJpAAnQlSYvTpGSsIMThpNiXeUlhlwXWUIFoQlDnyOVwjYFEQMPlCkUFDhHCysfpjYfRmKbuBilreUO",
	];
	return RgRswcfmcP;
}

+ (nonnull NSArray *)UOTWAkJvxyqqjPcub :(nonnull NSString *)mPKwIIlKnHZytAqbkyR :(nonnull NSString *)UAtiPyeOHY :(nonnull NSDictionary *)ydjBdIFUdzP {
	NSArray *HavXkVnfPlj = @[
		@"WsTHNabuoUqcmupIAUiggXsKRYKvRRAZPzLuEwITImhmVkgOssPOENiwBImcKLqMCdbIrHmvxjtrWOEQSpExcmPQoYJKfQFatxooQGkzOGrtFZlfLgNkGWXHiAK",
		@"BUbkrcMtGXyzgxsVkKCNKLHLnXAxDoNLgJqApWkliZoiTSlJktbYPMGmSIbfaRXOLOpjFTdiaNBEZxrPVOYZSUPeghChNKdoaMZkeCjkQRvvEYLuVjTBKdJkfb",
		@"WJOOexyguVMUUJqgNfzlGStoPUPghajwFitdDKBWolcojBPnIPRhytwaehBbJuoZXzYSQBMdIOqFracMNhusJswQhzsBIgZIusNuWHYGoUdYIdTEEmpVXJOJzXxjMut",
		@"ZuoWeiwYnMptkzLShAVQNZCLlyVGDNalsPZmxhiOlKJvygveseNDbearcSeReeYYkIikfRRcvEcKqUfAIBVQyPwpSoYvpVhlQaBfRqqpzsPTmTTTJEtR",
		@"eEoSiKZxZdvJspwYIMlqBZoMwTJHosCFaVFVXiwAFXrFtBICbBFdgZtyjyhRiHNNPgTNOJNFTEOpLfTPyRUqScRHQYBBmZvNEHMseUxxpRwcCkoUpmGQN",
		@"KucpDqLxwIZkjSviusJmHrriIfUjNkhjrSsvFIruwEhBmtAnMrPqFSoHEUUXaGSBmmLpzKQfUEsMmTYOKZhDBLCATopkBdNMbKYIxfBGtjEDYoUzJanMksyDiAyMjKGqgqLZDxbAke",
		@"cWhhWDodZjPTQZrhrxJegAbWWqkFJIlXRtdwlKILAKqerdZeBSOVHUpZYjhqoIBMIBzWqCfKWMCfnQYmcvQesGHEoqAHMzLWSqGMleRVNpBlKYhmoqxBGBPbZmYtJENiDqLhuW",
		@"QwamYzAUmaUtWKXjpwhpyxPcBfpGCJjDBwAlBVNowVjDIGSSslBSKTqPNIgPsyeYRtKutthUbVYKupGRiKICrcmTidAGYtLWtKclSqnEBOxJXGvQsSQgXdLDuGbznhFGdHteZZSp",
		@"GVkklzPxRviDpUnCAcSiIZRqsDdxjnFTFjPNVXvFWFJeTBekzxDrhuTQwcSBvHQTdRgVMBNvlYkjFqNCppgAQflsKJLfhgCDBMXUeHpInbEnUdWZXEFlOvtWGqUIJQA",
		@"mlGAALhEijHckgpRMJxLxYTVYivqpLDyAKLxSADDConixMTQYMTHaCNDFUJVHRmhMgQKtHggaNwlMSuPkZXDcmsHxGpmMGZDlifVMIGUnLEfVGAOKcy",
		@"RzYctuPbHPZBhrYhMtyAzvYOjZmLrcWKeOwCzDmJqTSgviqEtTjGezXKMHfMPkKvMYBNnACZybmskUbkTmmiqMNFvlamPPfJHtKZGRdIVgtXEFJaxFTmhmTkIONuxfjC",
		@"yZjjUHyuCXCzKiKjybgIDGcIVhYoRixUInUmKrVzYvmlpcsbdRqBpexpKeABzLKiQwCDLGadKkQaruxXpJDcqrrCJSqRwTAjxjDQRbvPEOSnZmZLXYZrLGND",
	];
	return HavXkVnfPlj;
}

+ (nonnull UIImage *)dhHESPkYBJrHDcJyXqR :(nonnull NSString *)DmtSRocFvTxsG :(nonnull NSString *)CjxURcWHPd :(nonnull NSDictionary *)NkRWqShXOlBKFVpOtYf {
	NSData *hbZcBemIPe = [@"ruKJpOPnjcHYbGLizAyFTSjMTQmYHfBFdGlqSNxMBPhBnybXtRKgYEcRgPANQcchZCKrpuyGwMKWxXhElTtlDJBzeWhkXhmWCJprJTw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gPqhLsSiQLyRV = [UIImage imageWithData:hbZcBemIPe];
	gPqhLsSiQLyRV = [UIImage imageNamed:@"orrZBPxobUmBplZkwlBCszeytuXkVUINlUtmSXEYdAsgisSaUYUbaSfkeZnhDJWblEQWjrTPEyjylqYQyHBgOYzoHCyqLmQqRvJTuotyLvHlVUbuFSlAUGUaDHNgKqmAtxhkjvYaUnHKgKYn"];
	return gPqhLsSiQLyRV;
}

+ (nonnull NSArray *)BPBdpUVkwvOx :(nonnull NSArray *)DvnFypMmYGItbHkXAd :(nonnull UIImage *)WugdBWJGuTJl :(nonnull NSData *)RUQYBjIAeDmkBkBHFJ {
	NSArray *WVOJKWqAbGdzw = @[
		@"KJseEnRBbUBMgyaZMTAQRqGdiLSFqCeiGXBNodSNMvuzavgrhhZGXUSubrjDeFTAuNJcZQNdUPSZoXYhVArReJNwsgqsCDZhpymUacqIkSoAhlyAArVnwMkkpGyWXixPBdIiFRzYqvnwrXcJBDi",
		@"CwPsMPGVmvARjtqfQrXKHICaqdtIXWnZhLjCGpBLnSXndRbclnEYaDLlqHNVNHILGtoKyXDADkHQRhCpghvFvHyiYQjEfsHDzJXxxCxiUSTmRTQgZRWeemMdHoHCiJbdn",
		@"KzsaFOmMHKSLjjfMabLKjanAEFkjMzDMAJlKIacvlgaoAGQtkJHcvwUSQSgxZzxaFXKvzrNvHFOmfUybfSVbLLHubBwkEBOuAUFsmQFOuqbNFPoufCLGSdZyFGBeLmCcFfOXabGQwU",
		@"jGhpNieSNrhQrlmGXwnhycuOFPXRPNgPvhhJOArNgcPikaitOnhzavphDMnrpSJrherECsFcDGvqXcIZuyHrXJgYAZEmLysAEKQZqxyxRpscYH",
		@"ExsyikXLAwDUakUVqmIFwMhuBaiPlGycVCptvsxIjZBBzpLSlxYnNmsJAFAgYMubDHgQOrOKihYYWlTodPifMDGAuYdOncUWUaEPfqsDFtlNCRVxRqNb",
		@"nBpEraGlxlCDNjlLYSGsAmJtzncTOxmhaVaHugsoQXlDLrJzaDpkQBiZApjiMPfFyQsLYPSUDihRuYyreKEGOKUCNCjTaIedcbtlnoEqkUwmDbKedDXldyAPDtzkP",
		@"vQaaDPvfPGePosmnyHgxrjtSzfLhiQvJgkEKyEEnIzhuKAyAQSkrPcagOmwUSTjzMyIkDGXudllsvChGmkNdcrfxsLZEOrLplyrYrPzXfNHbrEiZaUFvwkPRoIib",
		@"VqiBRNUCHtsaWbOyfDYqFWDUzneDEYzpgHhIiAOuewBBoNosrHyGcMvKXnQIzlESIFazOggYTSqYmgzKKKLZhlUsrJjeTEsLSEepoTwDL",
		@"kXrghWzUieQphRSPCEtfIvqrhBcEqwfrWatBBNWrGrctyDehHzTIoSRUvmvTdifLVhFVSCvAZNBoQImCOWOUclrAxmbJlOpiMQpHynODIRyBuNlkNVbnPaINhPweRgOkWxy",
		@"SfPNCmJBDuQcfPKBVOGHlUtrFHcljHTtGEutJaizvQvcLwwiPdDNqQFriNRUqLZfJFFLXBLvWYZmQilbEVSseFptFtZTqktGmzPzXJDGerlwYzgUov",
		@"EndGUrMXInCKNrigLJssdKXeuaLmLXXkqxjRmjVJdlPIhpdbsdhhHRyKsnXWfzvMJouStKOUKPvYzGJaFhStTutqblbqsyulhbuHPdccamZnfGsypgSraXhJ",
		@"aVibrSyDiwkkNRPHxtsmPLcYFMrZmHWzfJQdVvPoDLUKfwtzcgbDBbUDbelweOzXlbpeWpdOiiGCcPMfBmAbjGdSTQoZtipSJHhknPEUjihPdEhKJyWBhHrXAsotXTvoczqPFavgS",
		@"oCEfMVcBwbMpldEuGANmxxCTOBzgRtiUOTeAbsdrASVTMuDiYNLKYGKChoSCylpviOQMWlBbfjhTkPzxlStSoScguniulxstqqqVjObykBJPDAPCgYksafEqPmqJtWQhpTJnKxcmGyQ",
	];
	return WVOJKWqAbGdzw;
}

+ (nonnull NSData *)JUVVaHfocoMniHzL :(nonnull NSString *)upzTPtxCEWnDgbgS :(nonnull NSString *)DQHqEhsxtcWVWc :(nonnull NSDictionary *)GHDrfKyRcjb {
	NSData *BegqcNfQQVA = [@"bGPGkVUfOqFsYFZlUsaEamyKFCPZGOWhmVqIVTjjyzjIFCwIFHarnSegmKWUkYcNvUxDeSRBhRfFMOEhLOitEWLJeosEPlbgiKYUQFCsUwkgJBbhukakwWFcVKyJybqbPmyMH" dataUsingEncoding:NSUTF8StringEncoding];
	return BegqcNfQQVA;
}

+ (nonnull NSData *)twSGwiXXEXYu :(nonnull NSString *)lWhJhxVXgsoj :(nonnull NSString *)yHAQSRLHVZgwtpg {
	NSData *DrBBSDIrJEpvHlbF = [@"SoEvkRMFwxBtrrPGYyzAaTrFwAHLrRfmUWNIivOzSikODbnEMkkWPPtkNKHlCwQdhfGrjzeHvQIoVxixUsjveOetVJhNXgIuodvQOsGtKbnguhdYjVbqJBrxRLMqtpdwO" dataUsingEncoding:NSUTF8StringEncoding];
	return DrBBSDIrJEpvHlbF;
}

+ (nonnull NSDictionary *)kswZVmnYJk :(nonnull NSData *)SLpfFOMAqMkc :(nonnull NSString *)ujMrRfIylHdub {
	NSDictionary *ANNGkHZonZUMemc = @{
		@"GuvyZbSsRktGlUJKaZh": @"GjZPUpuoBkrmcfkPnOYXeEafhDvChNKsOovogPFTWfzmBAeqxyslFkkwgAtSjCRfOMRwCAUuAPgDcLIMMzyAlaleULAwXWuDFFGJkmcKtITQAzLutGWAjGlKoLFYtEtsESniVpNvITBxjw",
		@"XOCyuSdoopNNf": @"VqquheejiTNJmSlfNoGBwvzSGGiGYkeynDGrQhlPgEDtiAtTDnuVeBWtrCVyFssgrXJuppqGCtnkLIQqlGjkweyIxhBumWjyhbTqIfWICTsfREjugz",
		@"xhWkbGSFxNojb": @"KjzMLAQyulbUrEYDoBdftrUqMvCygmvTEyVLExkEHINXEBxjnZFpEUXWKMheMPGaNsjvbRSVdTcYgDwUGmqTNQOUFjacupkKcoJFQE",
		@"cORQfFVUNsIltWOYtv": @"BgbZyLBgPFhnlcnEwvYlBvMeCrnVPNQVSCgjvDDVCRkLmijnkbWVUAJedeBZPsEXxKvMTjemsPadydvzpRbhHxozXSWJBLSCNJTdPgCRiXLbLDJXBDhuBk",
		@"oyEfezKkpMqZB": @"LHYECOqyellSXxpuVBQLTqCucrMNKAgXvvxxEWGhGywRxQUpYOaRgYSWBgHgtxuWoohetorkemHPqwmRpZpqunzMLerjvPDoAWPNbmWcR",
		@"XSmlrduYrQgvNao": @"IYhrvMulWThgNgOxRAbxWEnrIwwsnzNwtsEwZbxVzMXXygdTumTWbTsvrQBnDrNakgHQHdUnTsBfHkMXSbCeFiuXmRyboKFSttkkgvLtCCyrAEdfMwnnT",
		@"YIDCBJliBVgtNvu": @"yoQxtxrTDFmwkRjYssTkmEiWCEKKJEIlrGSYOqNTEwRINoDnnkbSwsMvaqUYjFISWUOuMRIjrGBUplqwiLzCKNycQpOQfggptcNhagEpwjyvVPueTksSBsdodYtDWXqt",
		@"VmzOczrrXFgFTV": @"LwexIEJtqAqoerXSQFIjYtXSNEzpQyrKHFANhuEJmhxtFBMdbVHiWMxuAItfNrYUtWXMzzaJYXZeWliAdPRNCOfwogJzysnKeUYzNIylqHEQISABzEqQnjeqxmPhXVjGvRtIQvcZvsowzn",
		@"gnbtbEVWXHuc": @"KlmSGUYmvXLeFoWJiNqYhDPZCoGrjCdtAbJdzpsWHqaJKZTdSxHQPxhprAABLhBvuPnitVRfdvqEjpfgwyNVUuFruvSFCukrkSUluLbPuAPxzRJcUJaMMRDLCxSFqBKeeyHrLjhp",
		@"PdVBHSkIqdnyxjUv": @"RwCBdoHtXKxUWmrPYozfUcbVRdaepdfZCkqAYegSlmqeoEODGuYaYJPlAbsUZckzkTRElzVscWBRDhyGIxvMTUucEPJZouLyFAyUiLHhojbbvSWIzqfqlCOMfildfLmQnL",
		@"gEhIfAvnDnlbE": @"vUAezCjTgOUdbpqMWyammdoKeDLgMoZAdSaXAbsqVnuGzczEFSBUAFrOYjDNPCwKJegnqXDdugYUcjdoPBcgXeAmpFzXKRECwtviubRAkcAPzSFPfLlaOoTPUMnkRiykkymjcQnJp",
		@"SVAocMuHJQ": @"HEcdBDWDIfkDTyCmKlwuHzfckgeNhArMYgqmWSmrUJYEKzhilocBjBzNCNjdqqmNKPuLxIKslpxGiCVktuHpIfaGZvtVQNeiovFr",
		@"HvRDUSCPFDjFFE": @"WBEnukHzakwcFMHlNuJjGgeMfIfzvnWWKpuSlgWalljOKkSmcWTYUsKSmDzDokEqKzlFejcGipgTktklkRJaSykkDdCYBfdOjPArShdBoHHOSJKJYMJBUBIdPEBQwsmEHSFaJsRjhSroDKAjoK",
		@"EzyoaZxuJm": @"pYIucRUTwusnOmHNbOnoeXlWOSRoNaOaMKCFerWKeHiQfHAdOGbgWeRhGvmRmUtetVYHxomDTaDsoEUrymypmVHbWhDvodgXlZdDtfmpwBTNbwmNPNflSnZLnovvuHOvTTDxFkRPneQe",
		@"PvwsxyCZoTMo": @"vcRrWzdXSeLmWMrXqAiafjQKDNwzrEKGYxAAmpyqzLvKIXDgzBefLLwxjeySkUIjoLgoQVwNIstmLfvpEARebemFEjSfQHVypPOQxwKJIOqt",
		@"JNJNFFfLpF": @"JXpzhhPWzKQgBqQsoWjFzqIsqcHxQdtCMYJBTPMDfQYjKIEfSZjryKZxLnaczTroidCwEXviXHnMyFhkMxsbYouryFIrGsyZveuYhVbUoWFiukfsboUq",
		@"zPQsJpVorawuLADMtUx": @"XXcukOMQRDtEdtNEzphSTRoxmtrlmFYzWfzpyUAvZcBvGXjJmSfBIgmclQzEZAylWTugEWrUiHgWsUGPYTtKLutJvXDpMnmNCTOqkqTqbCqSQhJBRJjtqhHTyFSmHLRghWOLzVdeife",
		@"jrdieOPnYPn": @"AQJtMtFxbVUECMGrrtshyegmQVDzuvkefrxfMQShDvxByUWfYTVbPPRMmwqkNhyHIrrakhCJxmWGbbueEHJmQVeMIYRYOfeJNtNXV",
	};
	return ANNGkHZonZUMemc;
}

- (nonnull NSString *)MfpsqPfFuJtIj :(nonnull NSDictionary *)CpgvtNARNQYJir {
	NSString *HvnwnCTqFIVkPBkEvqv = @"HvTroctCTjPGPnfUYSpHjRIEAwJNTEtFQVfrfamujjtaFxWAYtqbeOkcPPldejqIYbGTmliOiBHoMnHwseOaYKGDBXjWIKXeXVuhHedBIujYlCUPArhlJWtHVTIjjXXKvQMFgNhQCMnLudv";
	return HvnwnCTqFIVkPBkEvqv;
}

+ (nonnull NSArray *)AMlCEtyVqTfHeLX :(nonnull NSData *)TLoyHbiWLJ {
	NSArray *hnJdInKjGfbypdvpvn = @[
		@"XsXjDPDseGYXPuwzwZXaJxrZWNWoicULPFcgEhFeuCWDLrPNQyGfqodsVVdIMUigwksaRqTbUdxaPjRFVELtqSSmTaujSetqvVnLMRMHnGWZWmoeFbKphcmgFLdMYSYrzlZi",
		@"ntTNxPDaXcDgQcmqObndpmwdqnAGELvCZoxQnKqdrCyMfcOOwKWIqxTJzejFZRYdSQbRYNNOZfUdkRrFtrdFwwfapXgCHjDyCtGu",
		@"OkGFvmNPFopCeHdfGlAbDHwIVjvAzlyDdEQvrhbgbzkNJzCzRIsSzssCDsvuDFZkifNcYvfdWSmznLjwtpHBClVilVYIVkHMpyuQeNpqfHCGEdWKkUnFkkCZZiSsmEYwWqAPVRwVnINB",
		@"oTNuFOLAdvMwdNcPUMVlxcvroauITThxHGPuwhnghKMgMccIuNWoBFzXwjAhtPKLCdNvuYBNSpMOqLWQvLWzcxbnzMiKhhXuPPRCgCkIvZDwAZjjEzQfQUkGhbQUfQbNsLVSgPTLO",
		@"wKEkiUNiLSRpiJoLkEQRJCMLTjOrBziyApjJMxNOOaRIiisUrAafpgBHvbefPnGVVDblieKDVkkmohuemRZzriAjXHNzATGkhffpZGXmQxISuztAwGtfGONNMCSFgBGQYDMQQgvYdcV",
		@"cPRLYSrvhPKAEHEhLVScNEoYcypxPiHLRjKfgZPyVePURozZFbcitaVOkDAMzfywkxQQTpHxYUtQeovfnbrqgQKioqmoPampFdFYbrYZpUSMoEklVAaKNSHwZlBNeEuyhJTooC",
		@"LsNrrlZfQppqMIPmyAuXOkWkqjlrBsqxgLqTpTtUybZdALzYBdiJnNsPFjDUjMOrokUoemPmveUxAeKRezmNsRuyAnmRYMSdKXpmZiblOZPLpPAoMwKuSbM",
		@"BIoKDOeyDOEjISdxlmdpPcIeeSKHzXHMgGjiNvVScYBvjzjBZZqJRoULhrtALysRRXjtLMkyjJWZYjMsXkbpBZvqMDlynIDFvwqGwlxFOXgeIrDvwRSVBlijgRd",
		@"xoFsdvWCcEzZDmtHWDqOfhDwuInRKoqGbkuuCDkSxSZiMzvAHhSlfXkmgCkbflmPakYjUMFMKdZGnKwZCqvYNZhnwLKbythgKXVINwNkhxY",
		@"IOTDEEcXuaqqLPaPWqWEEYzEFelWNWHXIzSCXQyZiHdEmTnmggqGHRddtthyVBVgGcLtqoXsOzVeenegELioMRVpyledXGhmLeIjUwrlba",
		@"ndniiekymtmgEUBmZiKCsQOYLAtbZNgmaYazZeaipEFnvinUXHwNaWTIbsgoIuysOFvOyKHDghCRPmcMxrueNllxukBoXWHlhwzjbbwWFQBEHGcrAgHbjUpTjMIzkdgQRSqYYLTaQfQnypGhRWvBW",
		@"TUNmZpHVGfKnhgsuVYCZHtkLQtstzuujXAVmscxlKCHjGVAgjxJdFoyYacgDoZrSZtYMgjBEIRuiVoejCnbMJMOhXqSwSQxFngQlpbCMXCsDyUiIkIbOajivob",
		@"gEWACsQCpmZiGTxvcHZACnCCvwGyVhzKRLHxzBEIPsnhowqpdnQidzkUTFGAXbagRoZvuMhoAykMPPodjmyDgiaWrDyFuZjOjKbCyGYuFiBcZcRawsoEl",
		@"ePVYozRbjiJNjlDpZIklwJptQTDAYtFsXJIsBEQDxTaIxNkAHLYBcITVAedbRcFUEQNtWucDHBxXJytqpqtEwFWWgkeGyYexUsrePcNcYebcPVRBMupapRh",
	];
	return hnJdInKjGfbypdvpvn;
}

+(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(WAxis)axis repeatCount:(int)repeatCount
{
    CABasicAnimation* animation;
    NSArray *axisArr = @[@"transform.rotation.x", @"transform.rotation.y", @"transform.rotation.z"];
    animation = [CABasicAnimation animationWithKeyPath:axisArr[axis]];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue= [NSNumber numberWithFloat:degree];
    animation.duration= dur;
    animation.autoreverses= NO;
    animation.cumulative= YES;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.repeatCount= repeatCount;
    
    return animation;
}

/**
 *  scale animation
 *
 *  @param fromScale   the original scale value, 1.0 by default
 *  @param toScale     target scale
 *  @param time        duration
 *  @param repeatTimes repeat counts
 *
 *  @return animaiton obj
 */
+(CABasicAnimation *)scaleFrom:(CGFloat)fromScale toScale:(CGFloat)toScale durTimes:(float)time rep:(float)repeatTimes
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(fromScale);
    animation.toValue = @(toScale);
    animation.duration = time;
    animation.autoreverses = YES;
    animation.repeatCount = repeatTimes;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

/**
 *  shake
 *
 *  @param repeatTimes time
 *  @param time        duration
 *  @param obj         always be CALayer
 *  @return aniamtion obj
 */
+(CAKeyframeAnimation *)shake_AnimationRepeatTimes:(float)repeatTimes durTimes:(float)time forObj:(id)obj
{
    NSAssert([obj isKindOfClass:[CALayer class]] , @"invalid target");
    CGPoint originPos = CGPointZero;
    CGSize originSize = CGSizeZero;
    if ([obj isKindOfClass:[CALayer class]]) {
        originPos = [(CALayer *)obj position];
        originSize = [(CALayer *)obj bounds].size;
    }
    CGFloat hOffset = originSize.width / 4;
    CAKeyframeAnimation* anim=[CAKeyframeAnimation animation];
    anim.keyPath=@"position";
    anim.values=@[
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)],
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x-hOffset, originPos.y)],
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)],
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x+hOffset, originPos.y)],
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)]
                  ];
    anim.repeatCount = repeatTimes;
    anim.duration = time;
    anim.fillMode = kCAFillModeForwards;
    return anim;
}

/**
 *  bounce
 *
 *  @param repeatTimes time
 *  @param time        duration
 *  @param obj         always be CALayer
 *  @return aniamtion obj
 */
+(CAKeyframeAnimation *)bounce_AnimationRepeatTimes:(float)repeatTimes durTimes:(float)time forObj:(id)obj
{
    NSAssert([obj isKindOfClass:[CALayer class]] , @"invalid target");
    CGPoint originPos = CGPointZero;
    CGSize originSize = CGSizeZero;
    if ([obj isKindOfClass:[CALayer class]]) {
        originPos = [(CALayer *)obj position];
        originSize = [(CALayer *)obj bounds].size;
    }
    CGFloat hOffset = originSize.height / 4;
    CAKeyframeAnimation* anim=[CAKeyframeAnimation animation];
    anim.keyPath=@"position";
    anim.values=@[
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)],
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y-hOffset)],
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)],
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y+hOffset)],
                  [NSValue valueWithCGPoint:CGPointMake(originPos.x, originPos.y)]
                  ];
    anim.repeatCount=repeatTimes;
    anim.duration=time;
    anim.fillMode = kCAFillModeForwards;
    return anim;
}

@end
