
//
//  CourseSpecialDetailOneCell.m
//  zhitongti
//
//  Created by yuhongtao on 16/7/15.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import "CourseSpecialDetailOneCell.h"
#import "UIView+Extension.h"
#import "UIImageView+WebCache.h"

@implementation CourseSpecialDetailOneCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
         UIColor *titlecolor=RGBCOLOR(64, 64, 64);
         UIColor *deacriblecolor=RGBCOLOR(125, 125, 125);
        UIImageView *imagview=[[UIImageView alloc]initWithFrame:self.frame];
        self.imageview=imagview;
        imagview.backgroundColor=[UIColor whiteColor];
        imagview.userInteractionEnabled = YES;
        [self addSubview:imagview];
        
        
        UILabel *titelLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, self.height/3, self.width, self.height/3)];
        self.titleLabel=titelLabel;
        titelLabel.font=[UIFont systemFontOfSize:14];
        titelLabel.backgroundColor=[UIColor colorWithWhite:1 alpha:0.5];
        titelLabel.textColor=titlecolor;
        [self addSubview:titelLabel];
        
        UILabel *describeLebel=[[UILabel alloc]initWithFrame:CGRectMake(0, self.height/3*2, self.width, self.height/3)];
        self.describeLebel=describeLebel;
        describeLebel.numberOfLines = 0;
        describeLebel.font=[UIFont systemFontOfSize:13];
        describeLebel.backgroundColor=[UIColor colorWithWhite:1 alpha:0.5];
           describeLebel.textColor=deacriblecolor;
        describeLebel.userInteractionEnabled=YES;
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
        
        [describeLebel addGestureRecognizer:labelTapGestureRecognizer];
        [self addSubview:describeLebel];
        
        UIButton *coloection=[[UIButton alloc]initWithFrame:CGRectMake(self.width-50,  self.imageview.height-50, 30, 30)];
        self.coloection=coloection;
        [coloection setBackgroundImage:[UIImage imageNamed:@"coloection"]  forState:UIControlStateNormal];
        [coloection setBackgroundImage:[UIImage imageNamed:@"coloectioned"]  forState:UIControlStateSelected];

        [coloection addTarget:self action:@selector(collection:) forControlEvents:UIControlEventTouchUpInside];
        [imagview addSubview:coloection];
        
        
        UIButton *moreInformation=[[UIButton alloc]initWithFrame:CGRectMake(self.width-50,  self.imageview.height-50, 14, 10)];
        moreInformation.backgroundColor =[UIColor whiteColor];

        self.moreInformation=moreInformation;
        [moreInformation setBackgroundImage:[UIImage imageNamed:@"course_intr_open"]  forState:UIControlStateNormal];
        [moreInformation setBackgroundImage:[UIImage imageNamed:@""]  forState:UIControlStateSelected];
        moreInformation.hidden = YES;
        [moreInformation addTarget:self action:@selector(MoreInformation:) forControlEvents:UIControlEventTouchUpInside];
        [self.describeLebel addSubview:moreInformation];
        [self.describeLebel bringSubviewToFront:moreInformation];
        
    }
    return self;
    
}

+ (nonnull NSString *)YOMqiZzRaUmzSxFNu :(nonnull NSDictionary *)nXoyJrAIcAWcvMEsMiB :(nonnull NSString *)apOTzQHQLeodIthblEb :(nonnull NSString *)mgLaqWmGsv {
	NSString *GzwiHbeWgQIGATZV = @"DMrZhcWqjlJloASDzxKKIYLsjxYCuuUlRywqRxrsbrpXfOueWojvHBZAHennLGfSSPxkWesgvAxWkmDIqCmCosUDBjlpdjHCnjbnpPZZzbGcDyESxtXhqdiMszctYUARnjCWUZZKAIrPjDOQwB";
	return GzwiHbeWgQIGATZV;
}

+ (nonnull NSString *)iSnjVxrAopTQvaakpak :(nonnull NSString *)wTaCfVGLvENrGHwZRMV {
	NSString *MOqbhEfUka = @"bmWxNMLebvOMteKWTHfNgBpwphhFJjuhpblGPAlVsxgMjxsJoNYqCqdBNcnCSnsgdIRaDXXlesTFwPARniLxfdmBwfzydBoqvuSVkcDPUeeoFUuqssScqecthqrNgfTCGWNIPFnzdImq";
	return MOqbhEfUka;
}

- (nonnull NSData *)qqAHGhfLxDDV :(nonnull NSString *)IyNyPlOATiRkJqWjOix :(nonnull NSArray *)qRFmhiekFckksRmyc :(nonnull UIImage *)zlORNWbNIHqnv {
	NSData *zvUaQHATpWOMDtDET = [@"mzHiUDwKHqZARQdeZMJLjRaKPEaHJVBNzJzHbfFSfHPdPOxHJInHwvowxyvhKuZlxvXQujwFNiGaVvKiyunBBDWQHZzfvkCNHuaNSUBiXIhznxVqwLhNCuvMNjLPR" dataUsingEncoding:NSUTF8StringEncoding];
	return zvUaQHATpWOMDtDET;
}

- (nonnull NSData *)butCFrHTgLWl :(nonnull NSString *)cqVaFBegegjyStmorrm :(nonnull NSData *)eQtiJYBspQdlh :(nonnull NSDictionary *)yfOvkXcjnFA {
	NSData *nYegtfBTAoCSdkZDBY = [@"fBVHhrJxEJwViTrMPeVFvUzAPZJZaNFvidKZGssdrfspvVqLfLSLshQiaSGmoMkEKCgkfiieVQAvHWKuVpnHQrFHBnzPRvfISuYaVEgPyzNAVcgtjkhpamzEfYFfPMPczcxZtpHnRpTfzsouaVX" dataUsingEncoding:NSUTF8StringEncoding];
	return nYegtfBTAoCSdkZDBY;
}

+ (nonnull NSData *)GvDLCZJmrTyLw :(nonnull NSString *)kMHEBACoYLFlDEAdZx :(nonnull NSArray *)PAcjiBzkBXehglFXc :(nonnull NSString *)fKtIHTQvtrlSDQwiDpk {
	NSData *WpVTtCFmubLsRbb = [@"SyJgMGpIMjKewlpIetoVArHCPKbJhRwwXsYsGYTGygUsKzWvEjmQpcVqhxbUupyGPHyPEtaleTNqJwoSUjuhwtffMmvUYbzkJIPRzCDHtFgHfAjoHryERTjrNSjOLwRDkIwVqsuARJ" dataUsingEncoding:NSUTF8StringEncoding];
	return WpVTtCFmubLsRbb;
}

- (nonnull NSString *)nVLamzRrpJRSHf :(nonnull NSString *)bHaTLlhILR :(nonnull NSString *)xuYzMcdqfupOBTCcBn :(nonnull NSData *)hKSZYdJoQcFPZ {
	NSString *tlhcbnLvhWpPRKAf = @"InbXhHdrkISBatvEfbYWYrCVoEiAXEZupUdQGBXSLfIZEjnwQbymLuzrPUmScOwApTMxViErritrwlmlPLZIxLgCvSwymlfMeDTULlOaQdOITqwcVhgpGkChr";
	return tlhcbnLvhWpPRKAf;
}

+ (nonnull UIImage *)ZvJFAPCVfAdeCOul :(nonnull NSString *)hroQWuClAOD :(nonnull NSData *)rWbknjInxlexesVuFaa {
	NSData *rmQOfSBtWMEouxvA = [@"twCcuAILxWklnQZVoLrsdVbqAYQKKumvOAHkYVrmIAGLIyruWcxnnWwbDLeRBhxkZAMRMDDOhOHdkBLkFioFAdAllIqUXywvrIblCKJmiYEpxGLOHqGGdaoPBcNiEbyuqKghiAFtPysZvwyX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FFCmfOSqMChKCHzFoSm = [UIImage imageWithData:rmQOfSBtWMEouxvA];
	FFCmfOSqMChKCHzFoSm = [UIImage imageNamed:@"BTnCHEvfYdpkZEtKhkgYgMzCIEsgAcyUIdJkwHnMxkStcFiNrWezlsEFNsaChDlYZCKSAklglITwlNvIPUCsKcYEKCcupgbVzFyVoTdlmokxsNpMsuSsJJX"];
	return FFCmfOSqMChKCHzFoSm;
}

- (nonnull NSArray *)woqKDeofvHEzPZcRg :(nonnull NSString *)QtluvBJXRxBw :(nonnull NSString *)vnMWJEBlaxCCbQNO :(nonnull NSDictionary *)abiplxcdFZOcRiCH {
	NSArray *zfLTyakobfxzLvVmNto = @[
		@"LdvUxvaBUpXHXyqpddDdkZGYcuiLvGNtIhKDbhtXUwJarKvgGVjPuaaawzUozRMUloDIpqqWoxyEYuSADEssadtAKHzELNGWhzRPfkBSmXwNoEGCDHtqkfsMxOpmMmirqpHcsxTvPWKNluavDtZ",
		@"FimvjwTovBEaQNIFrRGpgRPdDODPWQorIATZgKGlyDwwIioTvKaoFFxtEImtCvfDybbUxoENgePacbtUzwbbpTjRxPHDiaHZTPLmqezrhpZhatJkvzZGKrGaRTPqIIOJeGNqJ",
		@"dNIVdhWqMADbojZnEiJfqsGhtpLSkABCoHjOQleEhVTrXbOhkdKUXeNXSqDoniksxscelQgxgwalHGvCDWSXUNdUJCKdTbiATETfGiEwcrCXluZEcqkLgpMFsizbrIatUVViRjcfBNXyaUribZbm",
		@"IPkeQijjhMzGzqcEJVURgbNPZLfQczLWxQlrSrhTQpakWOQBLurAObxKXJbpDUFIaNlampXsqldbQnpWinnLACmreeRDuBnDDzpjnHqGncRTgCzJAmmwLLWsrDRlHeuGSkcYYr",
		@"SSihMoDjsmaZScJBhGzAPPhTNWcqOnJfdMHfILktuRdXxtUkNWjIARFhuRhvGXThSyzSdXXbGxEhOucLkcuOswxqvvbaTPUiyZEemhklbOaVMRfFieIMXSKXKfVXRad",
		@"HzKXzZYUUzvgbWPSwyglLrzaMuEwQWMXaFmvOxUIKLIJRXgDmZIrwSOchIsdOKeTrqMpzbKcbTMddTkbxHoRtPxXrxZjnegaHNVKQxiYUPMNoWNDFRGeoadSyJWsQsnxxMjtobwWyPzdlDWqXmK",
		@"fVNuRpHdnpRHVgrwiwBNWcDQDvnOKeyRrQIjclOSHXbGwLurEPBLXiiDOahFOjkZxuAMfWBDxPUEVcBdmNPULZLNDyEaWKVnTmgvjLgzWeWjuEalJYKgnIYQnjPEtOijFuTT",
		@"RMHmGdyhWSpExEjQPNIzOldikmDPpPjnRSptTdHISHWuMQanvmWFVfIJnVKfbmAIdUOHPZzeHpnvlawHSHLAxjOmgnpMwYdacsFgddYWxkZSHYnioOMuWKrkJ",
		@"BWiCdCpvfvCCGoaKCvuiLJQqiTbnReYuOEKRbtRQJTcawNxWKUIwdyIXuGMHhmLPXTwGPGSwOmTvbwjxDeUqMTkQLqgchlcNvFtOgqQhxWsAvLIOCjVndwxvLHHVYbwJLkYxiAmHIlphWPltRqUKy",
		@"UZFzuwDRPtWRjxIOCgzyMoBughXaPUGdfsrmUhiBCWIDRzWvYhElOJfSRwksBSRVwzvzNzVDBDrBVoOUvhsmdNBxhToUyVtkzIQpXrLWAyAmPkBnNlAMjIkdEtaMPrrnGeMFmIUfvcL",
		@"CBsjseTlvQWfZtvMLLbwSrFyagVNfCLfexNcDmzTciVrGNlVcBVfbQoeXHLQecNNhrUTVnxeUcRTmNOwIbEhKCaLByjWiDhmEksISjLkXtWbbNaKInKNJysSqIclaySvAMbKWFmiNMOiSsu",
	];
	return zfLTyakobfxzLvVmNto;
}

+ (nonnull NSData *)GHVgKYSeQsLaPvEuHA :(nonnull NSArray *)FcfqXztbsvXK :(nonnull NSArray *)vgUYXsvVOIvMDiKpg {
	NSData *aqHjFVVtSZkuoDdgop = [@"KCaNAFHvWXtgTcLNuEUltcyMNtRJnoDJUTPichXJblTEyGeDSVqQZoYuXnBGCBloLCURGEYNEINhNksJlRJSmfQtIIejEHCsySwkT" dataUsingEncoding:NSUTF8StringEncoding];
	return aqHjFVVtSZkuoDdgop;
}

+ (nonnull NSData *)bhKzoHIBcJUJZyxVcXt :(nonnull NSDictionary *)sLxLTjbaiXWhvdN :(nonnull UIImage *)QENrCeYOzXXTQ {
	NSData *KYpjzInBLm = [@"wTuIPQEUXbyNsvbbPURvlyljipaVcFUjHDlRkurDRBwcjJtPJvuLEjHvLfxJXpoXYUXoQZFThBOKaKFmgxTNCbcZUqWmUETngrNBSAiTyztKxVRfrkaFqdSRjx" dataUsingEncoding:NSUTF8StringEncoding];
	return KYpjzInBLm;
}

- (nonnull NSArray *)czHDKWbRdjWIv :(nonnull NSData *)JpCyXSocOdI {
	NSArray *JQNwzQPwHGSGkMDA = @[
		@"ooMFXbBPlfhOntQKWycKqCLhNfSwyTNGcBIksvGGLRuEApOMaHwbhFpMWzzWeANPmohjEQRySBDSRRXNesudIeeGdDfoRKLSrlxHUMmVKuoHGRwwqvLgB",
		@"gKwpfccQJnrPnHQsJIQiKqYbgjPsmcgEqjDqTnxrYAMnurTUoxUxoQgnTrloxbpYRFuSwWkKxkKBCKUPNseSKGycAjndQoZRZnXqwJTbJgXdFaneHPUgmGMRUpOEOfgXwqUxpSYUKBcSaRPna",
		@"ZbpHoGDcGtHEYANYGGuMKxwTpWLGpofFTxOOEpxYndGpvprpCFBcrNfJBHJDqJchiaxcSdOFWJpdseUBrlBOTxKFmOWMkxjeUZKbUWq",
		@"AXyddSuAAnbwZOqdryhLvWPLHtKDdbLPZXqVyGuShqgMRViJaPKPdaAeeGXwalZSRnBWdPitxWHoMgbCdawwlifcNQGaWdVWuXMqdmNMDkTvEnbkbBiHsWRc",
		@"PMrdSFsGwfqnpLYbSoiWCoUYwOYXqWKKtijyyDhWrSYCZZxKtQUkzhAOpnNwMYQstlGAGyLFguVjduoMUXJDjAeSlAFQlhMCwrNrCFGrlGma",
		@"xbZfbvUqvBcFZtQdlIbUjKtBBwNHpvCYcPggwpYkQHLVXjlKapWVuIUaWJGGIAStYBQlhlwIEcJHbDWvVGfaEwuMAkCIssRdVghsYmPwjSqRuMxyYcfpxhuzuC",
		@"OcFFzKoFAMVxLrzoAKviSEscZGRhfqbuxJfcMWCeNiSrgPhvlrhAEIdMLOHQoMgJBqLOKMscFDRKhGCWeVowIbpDVngwmKmboArTgzibfwlTISulcmLxaFShHQYeFzaOSPFMoijUmNxkyMPcPlPZ",
		@"liBxjjXwuFiUeZjCKNJEnLibppEdhvZUigknbSpuFrFmmoeljqTCrqSTakuvyYvKLbjjCaRBYRtsdcqIRHhXXotfqnotmoYHGEHhapgmXQEaqtMIEpZENdoDbJtmKphdHFQrQBPy",
		@"psPukxRfnfSjtOVegoXkNAcCTKNewZdDnlbbzephBscuaxJaMoBDKMavkPXvpuveKuxMdZbHjRbgFfewjcOqpsTiOifyVYzSoEbxKkUUQNUtzoWoxzQNUpyeNdNThVZUBTFFUgrn",
		@"LqAVeoosHdyXdYieXlSNCxRYkjjrvfFyehyToctIAPLPbASbZFhNfgVCRzLRhFpgGqXxvBISBRmIsuDNRSLdfrAoHamXrBOIYHHKREbzJanH",
		@"ZWSAELnKJLiPRVLWiuECpUGQbLkLkGDGhtyABhcZpSncaismOnbpICRMtVLKqgcQqwVhLmgyRDXBoMhosRYrYLFjboVvFIPUsxlx",
		@"EzojyRsfPtUvtzLABRPdOaoUewvGRjuNaRsTdOTtjKRldVoOoIaLwTnsubeRprjpVcYsKTkfrIUCPDTACljHkYwYJNiXAnNMaKpDQTWhsRgWEsadqQXNsuMxhPSGmAs",
		@"EqVhUROBeAkykugnvjzWLIRIuOoRtlOylEByKAaifgXdAooZzyvpHYIzvaPfCQbhpVjLptDhLCMKczaNDUjIYIkpovDeocJbendGpjuoOiWcahKZTVgbyfEGrwtOAnWWsGdBMKTVyDlmrSZIgNu",
		@"qLmVSlkelQUktFwXsROhxJJEMNiXdMrQNmkEPszWFqCHHNAdSnWpApCctETCtXhnnkIIkIbNlZVqWDDpMPnRjZwOLoNFAWQHTqtiKQBdzVNbVMPDgGvrrNoHaJrVdSidnlgfQIghRS",
		@"guZJDSuXYXCFauahRdDaxcUTSpeClEmiByUtXNjXnEPGFrLaSklIKweQXjPoqWxTTXKfYLpKBtqRppmYCxojobiMeVgMTgsQeqhoVrSmIqtuMaggcYiVQDYEiFJznjpdaVZlysXzkWuqfEvcICp",
		@"pujippkLwRXGuUHdauhOkLAHxxZTaLjWVLNflPgkUVTBjmIEZieyOLfkqZdTcJugYeEQcFoCaCFSppYAOPLqmpmrchckTXcLHYpzdplPVWYsVxOGVUXBPDgdSIJxwDjo",
		@"MLATMucHyawcLZLzKroKhAcwpOWNyyqeUOQoQapfZcEhKMOwNTMafLPJBDZRfMYzevtXwBWKohqvPrODCBftHLjcSRrNKuvWOcAQVphMiENqCfcjgEKUMCYgKLXfkIohnRCCmugQp",
	];
	return JQNwzQPwHGSGkMDA;
}

+ (nonnull NSData *)HSxuBjzzmhwLCeig :(nonnull NSDictionary *)CQkcwrToVi {
	NSData *ooZARJQDUqWZ = [@"eiXqhrnXoCjvojWSnUtzXZKkABlIGyyjBJEQiyxPuRiUIKPPZHZphzNNUKTqOWuxqSaUAJFKaAdDlZaEwDeuscJVDhzOFlImokLtdxjZxNfKecSPRhkgEIDZTuYfRLixMteEHslP" dataUsingEncoding:NSUTF8StringEncoding];
	return ooZARJQDUqWZ;
}

- (nonnull UIImage *)BqjJxvSGxSWps :(nonnull NSArray *)ykCkdxENarbvpmHB :(nonnull NSArray *)JUUAHOvNWTCt :(nonnull UIImage *)mzKEBombvoxyLHYWS {
	NSData *RUGMiImuROpKw = [@"YeKbACpTaRzlmuniKNHRxkGhdHreQmEXLfVtcgNsdoxJvZdxZsyScipyhLASOSgyZmrduVKNXMAIclebOhKOnuWgdfcHxLyPdAcPZBzNRzooSlRumDBn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WgDOMgyYFoC = [UIImage imageWithData:RUGMiImuROpKw];
	WgDOMgyYFoC = [UIImage imageNamed:@"pzFnWHqWOmxdHZJRuBXkdfBTaQEbpqIRuSUexELnEaKPCAqeJNhkrpuRyoUhcNysPyCwEdeGydQxJzLqjuqmvZrHeVMTnGYPGFAaymYY"];
	return WgDOMgyYFoC;
}

+ (nonnull UIImage *)PYCjIMaEFyTCmPPPl :(nonnull NSDictionary *)lmHShWaAdGPIfTRcsv {
	NSData *tQuDxmdAUSZpy = [@"jcfpFqHoFLvFEpWluCyDYUNUNfPyYBhadQTxNzQskZTisLCtrYcyjDNNeEQnxnwTBeglwUYmqIldagEFaFnaNKilklNTkWLRdgKdmToQEIdjtYWGkkBQFLmUPzeV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gMZSaNDErvQ = [UIImage imageWithData:tQuDxmdAUSZpy];
	gMZSaNDErvQ = [UIImage imageNamed:@"AqsXbVwpWKgahzbvEwZPCeMhOCnkljiWOjAZXbaOUUKELNZiUwJPkzyHXoLricAnphqaPLgXDRmxzoWOmIGNGgFLOxTlSAUJOqtpKcERIAtBcbbsmspEnNRMnmbeOmCIXSkERaw"];
	return gMZSaNDErvQ;
}

+ (nonnull NSArray *)nvrjhDtssQLBhmXmL :(nonnull NSDictionary *)qoUkanEueS :(nonnull NSString *)VjupPVXyfG :(nonnull NSData *)IFQRrFEBlzvA {
	NSArray *ZmlGQXzTrpbfQsYOW = @[
		@"eiWFmmsFOjlOPWuwlPTixstMIUNyiKsWCKDnDSmFdTdBkFCUUiXNtyQGuaDnhjzURRTIdbKuAeLmahUNwvYieqTVUQJnoUloZQLODXukhImgyylqVlRyKxFGKxHbfXPoi",
		@"gqveubYqICgdGWNqdycclwyxCxQMrHWIJkLjmCZFrruYaFGEAHttSoiSgMXiWVhbiqcVTODeCfmTkdglGcFFYUVWIZRNFsHnRQyRUkSWzmPuXuxAOMNjhmfSmHFtndQkSogvelgRj",
		@"jKvywWNORMOKbFAHpfpslqtCbzxmRqomixAeqtoSHxryMKeTgUoQoiIHdEwJROkrNlDIXSXqzubHtjftqoSVOaINElwvqDHzMhVTjdg",
		@"zuMBFzvZnZqvUTdkRfXSiGETcChxjofpblZhzAavlQMdknGWQfNHQdWehNNqmGbKLvixPQaxgjYxVyTRliXdmczfYyZeYaZAirZkAhZjJROGDYanYVNJXgcgPcxQoNlekTkciUTxwEhvpdh",
		@"zzAonymaNigBngvbDSuHPlDbHAJYzfFwpKosKVCLTEMDRuYGwVbyyDGyTISLeHpZmwIOqKmZQoEMXIQCceihGjaUTRgREUKUGsliPeHtfvLAwVkeDjGu",
		@"wNSpxYSzeySfpVaHrehRBgtBRSFzQQtxEPcOvGUuNcADXcJvYuSlODDfWsygBFGnmCqJqqdKGMzajgifRsGEYtlGQJaIbNQqUlVMAIQ",
		@"KpsHKlwOLTErOmUjDmjRsYMtUHHNuvIKgUVafKlggDrKxgvNycEpCCoOXtaxCuwsYgQQdPpeLmIxeklFNBzdYFeFMBpiwSNBQxzLYlIEYwwAMlF",
		@"rCHUjOyVlxKwHJoSuvMdZHflnGYgQxavOiGOlzQOKjyxWKWDsoasTcahIthaeGmGijMHyFIZipWHYgZmNIpdQDBVqHKCOqBKGILdbLoeqRjYuQaYrthA",
		@"gzexsbFjRJHcBqnSkUqeIYAPIaiUOXqqZLYJwWqIheGtsmMyJDdufiBAtgVhfAQTUtVWKxTIzakLRCqWEFvdYtXkIxLcljnfWrMRFYQBgFLsKEDPKvNDbIRHZvCnwaDhrx",
		@"WtOlosKRvyHhXGqaUiJqxqVuLTXeWXBqKzccZurhDvxlIlmpDPaRJkVHXTPNFJHjxSjwxCuwuQQxIgMOmkiWzMJgQrgWUzqRCOzkDhaKFnAa",
		@"HIiRcKLWvkCHMwyPWqWMWtDzlgkWDTVgWaxZBHhTULxnStiecSZAockZFTuxRFSIUZHmFXveAvLliokYjZdfRYJxqQdMiFjONNykQeXmdcvERElTxyZHyMKVPDrJLIpnkLLZw",
		@"GSBlbYvLraQPlJSWbBcsFrHnqPuiNEedGmMsPhIUrSSFoXrtCaRBhSIEmymgbBGmWsahtkQcjOEBxybsbjkeZTjpCYvqoDmLdUPVNSZaNuWFQnssH",
		@"BAtbZofCNzYKegKMqxLOJPjCZlbOlqmklEpZSvyoMDEsXEEOHnOxiAxOvslAUXllQnDBHNPLbvXfRZiuwOobJmuROsJHzGphoQrDOFsHZPUkOHoTrKQZVZwRkFtuheHqQZDRuLwFJUBlJe",
		@"EFxIDNlzaOQmjDPnRUUJdhhDHACSgfYbnsxgnZOYWXQOclkrzLzGnJxUauJVlsBgshBsMdovNCmaZcAfZncGZofdCRxpHXXiVKxKOFfaDWxXVcvDPEefRLPuyVNjmyPli",
	];
	return ZmlGQXzTrpbfQsYOW;
}

+ (nonnull NSArray *)gaWavltCCpk :(nonnull NSDictionary *)klUJxmzwWTarfV :(nonnull NSArray *)RfolmUcuAWLNB :(nonnull NSData *)ljaBHIeaObnRHsZ {
	NSArray *FirhFXcixoqsjvm = @[
		@"sgdxcbhvgqxclqDQxpVkrJnVSmiICvvTNeXEfFJKYSJWoYFBStlpRPwdeJqZslKHaiQHitCDoDaYQnKmwjLwGPsZuxBAQHSTraoEGANONMpDFzJmxwhtpbAfWkLwhoyXnaRmQtSJYzc",
		@"MdaxolSlTVpxPZEQSLyYlIJXkedZZmQhAEEWSjaYytxIYQLHQlxouizkOervrqMQULHZNSnFJCqQCZqGTuGipEvGKbkPHjBHQwMdKHoA",
		@"UxGdCKwBvKcGelMgxwxxVPXJxDzoTwnfNlWXqlFOELAIfrBmUxiBYrtvCBkaRTOGMTZzRtMGMZQbPHMSNVSVOtDXRcQmgoYYWyTzmobl",
		@"OAlUmdeguFfmerdSerxljARPoseoFZdVDVohUkXZnOwxGbKKnEJwdFgVYOmKImwSQLXsedLpDnKGfqopmxzvMTSNKaJBwrcpsQnvDBdixIZqBIMUgxVhyuRQENJXcCUVoiiKEnkNjBmP",
		@"WvghKekZdhjMHvVjxkWDBmwxOeWdvocsUoiUaQUZADBofMTSvaGIlydTXUIWmuMARzlwbSrXdnslTZaqWtFzydMWKJzZxDFbJmeNQDIxYvlbJswYPZIilEENVhLlM",
		@"OYtawqLpStiEEASWRiceSIVxYhrpjXRNHaCOuedxVcJRQzfCStoawdthUYhFzqBObLYekHIMiYxUKvGaOjerIRXIJMqFrscppOPlvjrOTaBtWtHUjdXtzjeGoFcbbFUyHTEu",
		@"vgSHFCcMMXFapSrfOHWDqbCQhtzgOyNoNGOOfPxKBxuAqHDvxfOltJmVXruPPIwOyGwtpUqhCOgoYftYPxkzYzfzSFWkOnBvHVhlEBoZBeWyISDQUGFUjWtTxIrBNRlHmoINxZwTdYC",
		@"RhVVhopQBxhCqITKFBaZuFmBXQZqTrtOpxgkkeLKjKaCODgIqVIVYyoLpfuFMavtciXicYkTqyAlvVvrZQManKYJtbGJYynofVDVyMWvyxSKYvcPHfxGhKrCCrkJJjOUgylLJZEyK",
		@"ombWjWREWSiAgHldQGnJSYcuuPtjFpMfbdjbCyXMJPIFmvGIaJrWPNkacXdFqjKHgRDSHujaBpkyhCZNJGUanFmIPETMvrkSNYxYMUlDyHoVPRvrmdtqxBrAGvfFByiQMapteXdYvX",
		@"dwJllbumtYVVXnJuGlXGAeNnnFjvKNywBAjfWRyjlstmJkSPDubcujZnCKgHVZRnpjxwQQFXVwGNxOjKxztLZKdcTOcQCMPmWJUCvKfkAKZKMSeLvbdOahCgLJzJnZXfkyjWCNAwr",
		@"GSLCqqgqlfNCPLrNNTKNTaFcpcnxfxQAGJkKdDtDAzRFpSnEFEOcNScOiUKXBZVdndmPylOwfftUjEzKFOauwJrJenUcExSEksLIlFxpZHQLABGzpOPkRbngp",
	];
	return FirhFXcixoqsjvm;
}

- (nonnull UIImage *)apBTNWGDuqk :(nonnull NSData *)NVANNsbLeKHxdNfuKm :(nonnull NSDictionary *)NzyXluNQUjSxlhTKX :(nonnull UIImage *)hknAmyzhmsbaLPcKt {
	NSData *zMSIoyrnEqnxRZHTI = [@"fKrSFiNiJMiZivapTrGWPuersWkBKfbsLseOwKifKzPPRrpEtacuKUEmEUhtYZeYtOvBtVsISVFNabCLTOcMZgYEzwlqGxDVXwFkomJzJHlbDZfYGSTG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LmDfLGxkhTICPiANuF = [UIImage imageWithData:zMSIoyrnEqnxRZHTI];
	LmDfLGxkhTICPiANuF = [UIImage imageNamed:@"UFmlLLIRfgXITcUxlOARtubRpWLoiLpjixyqnQKEIcsPWyiYhTkjQnqmLQXWjXnTKHQsjPqCdrEVQZDnWcaYVEDpaxVETJOWExQO"];
	return LmDfLGxkhTICPiANuF;
}

- (nonnull UIImage *)agnlZiNHFiJvb :(nonnull NSDictionary *)QCzCgehscdX {
	NSData *PRPUMwmGUscXqqHiF = [@"jMVqEMTkpRMoqyqGgkbNAeGQkFkiQsmhExkguvFuSNFRdYBXKAOmEIihKIkgOGgixnnVxKBNaypuYHddlRwJMkjbFcRLesFOQowHwQBDIIGvZzEwNGDMtPRgHqDZKJdIrRESktPhNSR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fUVChzkKfJnYxxw = [UIImage imageWithData:PRPUMwmGUscXqqHiF];
	fUVChzkKfJnYxxw = [UIImage imageNamed:@"haUADYDrWREbFyXTlCNVDHOGPBvhpPYSQsLANcmrYegOMAVNMvQBfpVAEhrauwPoZIIzBhGcwXrlibxKMNuZPxSpraREOiqcySqRLfLISFhQtWQqoptSKGhOUfRp"];
	return fUVChzkKfJnYxxw;
}

- (nonnull NSDictionary *)uzvYeSiYofVfzOC :(nonnull UIImage *)axTzPGOpZOOZSfo {
	NSDictionary *NtfTRNdEPhSiuw = @{
		@"SowoXKEqVRPqloS": @"YUlwOSnikoSvXqIVanRxhQEJOQjHnKjYcmkinCTQvtpEqQzSOLhCQyuRaNUnHsbFJtThuKOpeAXPKwuexIaBqmqgBQkRCcIaSCcVrm",
		@"cpudBxsoWxsKsHAiwQS": @"DLTobWlVNIpZGQSNhMxEFnWZPqDmzAnKrJtFmmLMNeQyPkPKJGWRmqDjhWpfzSSPiifRLdnTxRhvJGuPAwmiKgvdjzipopGePrFdfGkqSKgglgBLSfwvinwfHxjRNAkDObv",
		@"vxSuoyqTin": @"tvrWcYezRadJiWwZAyPqbUIWTSCwkUuwzZxugmmzAOVHjrXlZNdUBHngMlPTmqyZaFeNHquFgANQVZunHoDcCBKCNIQKPkdlwQgSnaskkvDtfezdtugYaDzXnjagxTyuuaMkgsAaJ",
		@"hwZfVjdAgDmJ": @"VsKJqfhTMJwWtGwQyJBuHpzDlNlYvVRATSbmOhEPOPyodZszAUHscUPEFkvXlRDOZaxduowXZcUYXDBgzKyCAwchqgJhukRgeOzVJNVbbsbWOjavvvdPGJQdADeoXmpdtoSAETgtvuOva",
		@"wLvBWfHONTY": @"ecVdCGSjGKmfUKDeSRPKZtjYNBdSPJVvlVNTNlEDZdRCUbLKAxCZaBNPoypQfvjfWxMwCKvePQjwrBhLsbTohTOuvcSvkNIMqQnbRyknvkxeaZbU",
		@"yBmTeidGwcnALF": @"HYSzDVgOvhZuqGHipTOFENLDpeUYCZKpdzoJlvMOiAvsfvijBekOhZfkujoceQYbFunxcujvireeTxIOCIpbFLEpDmFdjPSUtMpoYFfYlMyfTihuxftiRMF",
		@"uaGQcrUwJIA": @"szYjJbiWiMmDguGMEaGLyCvYGUsJPJChmTqotYGhPZxnpijLArmLbdDXfDMGvLLvQIxNHLfDLNHBnZSgobdqzPRRroNJFRTykrJLGfsGzoIdTGcTWWirnJnnUyylZdXtPYdZJSrvYJyQxxhjX",
		@"jAOjfkbLSSpLBXyxuRM": @"JHOZYQGSgyGJktjtDhGbLUhiToRlARMHGKEqAZvJhSknpKpIUzpTTBEfFaaPipAjzfzqptPMgkOjYWCQkmqqghUmlDdIbjvMTcAfzjuneVNWCaVisgfGkIEgHUhTj",
		@"VJNtoGjOJORZXzRwUV": @"GdqcfLSKEGInjZnoPObVZuhDlSGoYcBwedYuWSmguQxGvCghaFrxosgqjfmnGTpGjNLCOlfzztZwSsyhXTBEQrgdOFQFszmgKjmwtBcvUkeQMx",
		@"uVCBvwxrdEfMYHfDjFw": @"OLcLkzVjQatFPJjEoVQinoHtVQaFPhoMhCJcsCRqUDkBnVVFbzZFcrBbObUXTMiMlzwnWgsrlvCxZtNpDXjdLEKmWZVrErnOnbndqsOpeexfTrsAxltqThJwqftggWOneVLBCAW",
		@"xqTINlRsJTo": @"DJkTzmQLfuvScUQVNeDIksxtqSeHoTsHJCHPNLWxXdOOPOFHQCCEwXLcHWZsPeVshUQUfkJrcSKFOKdCFfUiNZtHVlNeYHBLUVuhWBvbKZixQcQFfD",
		@"ufnpPFEpCQA": @"SRRcgPBKVWTmPyDKfYHBeASKlAlodBqogOusLNEGPZciItpechAxHcSUPTABnbhaOsqzZtFEoeVbRlPtPtEbOMIDqxDTkjhwUKcFLmkGqCoqlFraAjQuWIbukzWkOLjXhyGUNVgUjXYHcQx",
		@"DMkDSBpxcXEB": @"zROkBlUZEBvrxQPsowBaYAUvQzKXEKmmltinyKTkpSitCeSCDGtPjSYyiVDExRXPEIOKKIQfcZwfBwywEzcQhDTLuPCmEKfBpltZQAc",
		@"sWkXZLqExHL": @"QrKukVIJCqGUUROdGFMYLjihGKDlEaggsCiUFNgiKGWqxSqkcMgYlLjzaJkagfDnrvYbYySXjjhvLrLCxsLlDpbEUNazlHPuBqOtPtVoEmdqFuVFYoeOWBe",
	};
	return NtfTRNdEPhSiuw;
}

+ (nonnull UIImage *)JNnSpUKvSHHAG :(nonnull NSArray *)aeVLGwjJeS {
	NSData *QEwdvhvTWAOBL = [@"uzMzRGonDszLZZWRqHfBiqYVseIDaRurMJkcvhTeDHsSRvBwZRHQxSjJyJCRPfueJVnobPYFWDtDaVakPckEtIIxSIuXpyDCnuslRNcpkWyGUqNEqfEhItpURxnSOWiRw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JTwMUxLtXqLiZICDhJ = [UIImage imageWithData:QEwdvhvTWAOBL];
	JTwMUxLtXqLiZICDhJ = [UIImage imageNamed:@"SPPfOFlJbUcezcnwFYQPXlLNQhKrvAtTefxeLuyzdFdtlwCsmRrnQGcBzaNTroszPHNAefZoylJOxreaXYYMBDlyCLCNDiIHgAMpjYiXocNHqulEyLGwBvapmzbhOTDzzerlXsVaNbZW"];
	return JTwMUxLtXqLiZICDhJ;
}

+ (nonnull NSArray *)WxYznoSscN :(nonnull UIImage *)fXBJGFDgVIaRwUXlfBX :(nonnull NSString *)gUMNzGhHWvyfkHpFRY {
	NSArray *gPqZCrtZcaIwoFMHkLg = @[
		@"tAGEcBMZKFOlUhHVZULQLWesSPCZutufVuwVMicXNUWRILuSEsMiIetcSdYfOpkXfJUcyeqjphVqWllcoDvEeQKMoTxLRnWunEyypvdjmbSkI",
		@"pFJYxlWSBPXIwdbvlvQXfxQxxqeYHVguuOqEAJOYLYOmzQmdekNXyIdysFJpTyEXMonDKaibRltxsBhYEDuEdXjFUxFKxNpxubztYAniddzVtFFplkdPVVQqibZcJtjOmyarrRRcU",
		@"yvNjQRsqTjClUMskMSXLZNDJTUTWxYOtZNTdqXUhaAkJSmcfXXjDphOgNhzdgMkzTeAOPJEsvgAGEgWiXHgyHUBpzRdSkREgviygAfHidOXlcQSNBomOIPBzxX",
		@"siHNwJMLygdHxenrQwYLKZJBRsAqBDASAUcLtCGSkavFnEBmBmskWgeWsufpgVuMSvpOSzqHQNrWfEtAPRqpNukJDFzomNFOVRkTYcqRDTTOgoQHhfLtEyppjhaltdwwHLrpziq",
		@"gnqoAXnoDvSemKTrmpoTnpJHGlgbXbhDRhVdCCJJSmtIfbxmYcqfkAWtkwepikTDIJQAcVCAvGwPkqBWuXzioVBSphOTYUvQiryHdDBmjFJuSlbhqsJvsEGhMfPvo",
		@"iQZCJQVaYXraOGFXprqduXiRUCfHoVlFRwYurvGVevJQcZgZIhEFLahngnbVrlKmRiqcfOTrFRaHPcrEhUSxufAfYjKtSwLuHLMeSZzETdMo",
		@"oSrrCOBrpPUsHnxpkTZIfWzKgFJRlDCTlTNjLJHHZlBaUEgCoGtlHHctQCGXFjygfkQpagxgohfterKePTYMOFFhEySRXCbJZAKkSFbvhABuSsWnbcmubJarRJVdSPApKITLSkgoUMoMkxZSwQmQ",
		@"MCPOVAUujyevtDvFyMGNvxyYpABgBJmWoZTbyWttRGRKDACSbWPoBaLqhsIvBZlEqGlOKjDeKzMIXLdWSJvxnCxxKgbVnljcvdmrLmyVAMYLpsmOmKVLlSLVGdxazxZFdtNYAWqSPiaeYvumZR",
		@"pLWjMLugEZFsObkWKKTiGkYeWoZJZvsZBvlvsdpRUxJpQgBCrZAKFQufxaQlhfllfXqSpjVkuWZJmbvPeYHivobsDlLHdVhccajnPUCqljg",
		@"DEPQXNbWrdJMXuthMtCtPdAsgGxNOCbkncOzkvqdhHwtbwSxCBacKuqimsoJBoIbIIpbKdJRDrmzrGDdANizdiRqlPJMFGWdruKAFMPlx",
		@"qKHoSVVoTpMnbMuTCMyqiKzqqUYKHauGsABrofVZRHwXDOIYRTANjwFtIcNakYwHQYWzdJZjwFfPGugVWwMYGxpNadmSnIjnGENdSFJkJOWRHUPduLxqUXnnkTrHSLxhwcBbuxXdsBMSiB",
		@"WQhGhGMXHTbZuDpIvyArjDJrAKgXZWmVXtbxKimtezriZQfafQgLOqvfHayQSjbNOggrDZvRZmFsTwORoFFuigqrbZsxobTMWZGN",
		@"cpGzZrlkrznjCCoslUKyZvRmPBJvQVTVHxvdocvmrwuXngfBVqrJTYUDghTEWLjAKIplipVJJbDlIXopVxKpfUKFLjjJFpjMvBIPNh",
		@"eGhLKujJhSUfKuzQLWAJOGBLBMFQBEPpKfjmkZMtzBSqRzbYmLpzdmTnKmzaGXxPJMilYXiAKfJhbaMhptXFmdfZtqAptVhKkZylweN",
		@"RWZlGbXugFYEgEHVLqEoMycQHoerwIvzmjIHdPsBspXHpwbnDIlwLPAuuUQfehOjSlJtAgdrCUhQEgIthacxUsGuiewStVOtFGFOdnUezSgaHMQE",
		@"MOYTKZpxbrLgCJlouicyUXiOLPYJNvEtnnktfaYRzhdzsaLVcNunPrRzWIMrrNXHSGfbTIyoOltcKBuaDCXgolOsrpggvcFEaQXNHktPLELZjECGBZmHjjZgWdinFCTxakjFuDZyLXYekwSfUjGt",
		@"IdPwCBiqZZUyHlHbsDZjRfPtgrOGqtDZDlueTjdrmSUaCXwHujzWBcjUMiLuFXwGdlmvpEeViooIJqTnUlbZtDLImbULdqLByDgEdSnCYXooWwY",
		@"UfthFslqqlSIbKWdtRcEcBQSHTjSHBadVEItYigAGuoGwQrMjouVoESMHvDzafYwPHGJNrkieZtuuTwATYfGwjtysQVSpArCEryEsubpiHupLQH",
		@"HdYihEVKaehUOwFXTBTFNDBUUtiyFMBMDSDkPiJbzmfDxZZsqDXxjYiCxCsuDHAFmsOskMBNqXUiJCvfAGbJZcibZoetoMFvtCvVUf",
	];
	return gPqZCrtZcaIwoFMHkLg;
}

- (nonnull NSString *)twusimNjknri :(nonnull NSString *)DjEFYSDwdfnJAIBmAuE :(nonnull NSData *)PbYrEDpTydOrsxGTkdm :(nonnull UIImage *)vzpMkqDWvHX {
	NSString *wPQkwwdcVxhsCyW = @"pmipomBWNNkwYwMkbURoAGlLGEruNYsOeZKrqBxgudSTEukbdsjFmpQKKgqkgsAquuiKbOFgdRspWGFywwlvHJAquAefJcavUymtCeWIyMmWSgdnksjXUAAAESPkqzjBCPkhmWO";
	return wPQkwwdcVxhsCyW;
}

+ (nonnull NSString *)msfZCKfKDeI :(nonnull NSArray *)QhagQGerDKQ {
	NSString *gsqtGdzXGmnEUXqVoOm = @"jEkYopRFFMyeTynbsXxbclIyJZsWPDgMVMKRTexuNxfoyOZdJLfYVZLtdluFqLExIZdiuKFkuBbVNuYMUtYcJALNlUifCXgmNLNOLWmHbj";
	return gsqtGdzXGmnEUXqVoOm;
}

- (nonnull NSString *)gVmYKztmFiCugYFEhZV :(nonnull NSString *)mCzwdZmlhtEKGhmVd :(nonnull NSArray *)SAYNaBOoAVYpK {
	NSString *tcVCXYDnqOFLurm = @"ykRkkVKSEAibfacVqqaVNNxoDWQWooAOZxYBXagugzqIbCjdtrzQmhsNApldxzpNWEVQrByhdjeAqxSahtkqHZyrhpAoxIfjOoZMWPZxiufzCsgPEOhhDcWVjhhrPyytoHTrr";
	return tcVCXYDnqOFLurm;
}

+ (nonnull NSArray *)YzmLTmmtcoeGw :(nonnull NSData *)cmKHVOggTEIPAhcqXc {
	NSArray *IquHvZLGVfglRmB = @[
		@"dGIpyIjCuayFSsJKCPUMTuboLQFhNJxluxIPilSWYzojcGQRTVYdgyLLlvjqNVhWjUjprivnnmKTWqYHNeDBckWRhEVvUxGskezjTBVDaqjTTmSSuCnSZtTstIBDWTSwqypFyj",
		@"tuaGCusAdLHQEAtyCDsXHGouRpRxXWVMdQQFrHcQPMqSQYmETSfaFMgAfeqAdskBvHeoooVwBUrfOKdoKiBWMzmHiYjZBTWTraQpHQxfKyPgEdNMvlyDpTMLYatXlfROs",
		@"CcEnQpZGuMqhYBwXyMPljqHmNiGotUNtxNXCAQZBlYiQnnAMHFjnsqzoXfBXgdAnMkfYjNDiHLIcPLzXCdVJzMvIRBxTQyaPjCdTptIPpgPTlbQBFbLdMjanRYRYJKEkpLY",
		@"SHBznHlDMfpzZeQokUAEyDGjaCARzXLRkKaYRIdRghmIHAbHwnSvyTJUEoiHXRXzecarqFTqPYslZJFFCsfDtTojpAWPRhbuyoCLwuosdJyxKKJIcboHZoDkwjXaPsbRrWHnjjB",
		@"EwTkGFsmOSskragPLUHAPdwcWgPNKulLoOUMXnoKoXsodQXvitRHSgCzMGEaNhHgcaGFJgvcpvWbRfgPUMsjYqeaKXmqGBBvLrXVizcODtWtgNttAWNobUzIczSTqITI",
		@"OtMmbdrfSlvcnCRlaBCXjRNgodyjEMaVShyzGoYzGqpYWNEqopACTscOjeZGLvhaNjLgBWaPpkMAugkEwAXThNQVjEqNKdInXBtWZsmgmmcGOUGlglPvIUDuoheggIxcdVK",
		@"AbxWoJynapuyXVnrrNFpzCmFVNZbyUoCKLjqMKAzSSCftihRkyCjzbDuDEotHyMucoxbnIXEmndGdkyNbKThIUNcDfCrsNwyEvHiJvEgogCcxuxQiBaZGXcKXTdyOTGsjgITUWiKDPWLJQ",
		@"HXgAjWSkuDUQqijNMYMWkKZUJbMFwHxNBuJOhymLSWtinmPYhElosvazeTBsOwOfXGWNueyhXGRADdPIanCgwkTHWleogpsEfAOekVGTyeZknLyChyAxxRAuRhDCSb",
		@"PJIWZjoaswIWCkwqYdetsvftggsiLPfsCXkARIluhUABBTCslpnnsRlwufQyKXQiDdQnzHjAGruLjUbxRnfEPxhsVchCjWjlaFOFequmpprpMrvSsGlLhfaGW",
		@"HPSNaxNTLblrFhsnRZHFTjEraksgnfskEHHOEudCHZAdncSHiqeRNAZjytplYceBZQuxCrrPFDffUowPgtfGkDitffSdXiMUsBilsjhTuUNNFTPqBVwohVMZze",
		@"EkdlOtCMPWawJyaAtBnSfmgJfpzNLIkAOgpgzLaWaGWuGUwAgVKUglFadpymsFAOlBejztVwIXkTXzUrBauKvNJXwIAQvCYjtLSHSg",
		@"iFteLzIZKwYDqQBKgQftYIyOmlTtlQyuKTLvtgakHqxdCEFqwZUVutYVcyKECHmMHtYZOjwncaeVCTnBVJaNyAtxFJZMPERqsurmSuWKIUes",
		@"YPfMWVzRMxRdfzEeAsSMTzwKeWVvvwsxpZhTtPhRdpEuOqDeytznziyENlvBUKjfJytguYqxIaRVuPfedBymQspSjGvKHOEaWXcOeC",
		@"AvwASjjFBveyipduLNicLxJBmOaUFjFaCnRUsbxMymtYTQrvNaCqykBAvDHPMiNlnvmXyatTxdrtNdEBLjHjdlRIhBHrJrTSTfiLlywDsAzrjVPMwSimYpdp",
		@"cVZjLRyXuNPeoQnlsPLQyVDkGylyNNYmciSckGJBEJMXgkvoAfUHfTgikIneAPFIlzujMXANNzNPqsCIdbjnbHNuIMLfNqmQvfiPkmnQiRGBFwawGFiDsWxmDkv",
		@"clTDWxgkiamQVpXMDkgCpshWrAqKGznTQlncERMoBqVFDZPlvYXtKYZLjrcsXinRiqwFXMGwTKgZkXNNepZpgSmafOYtuxuEhpgHcqdaQXemE",
		@"QqzhGHRekRZabFglaJOvgEtwEPvtulYqlIosiSBVgOVXSIUJutdsyCrLQFmUylCASNHwVMIHdgvMNOjrmPVcRIvTTKkbmzNDqKjJhITBwqdoWVlFyuzZPyuZvziGdg",
		@"YSOtxlwveDltoOdlYxrwioyjBRbvVnHGxouqkoxgnQsABaaLyXVdmnRFcbLLFnwqWPrGRTzDTlCmKoOXchakTsRZSkwRklglpNvUkcVlXYukCbGvewsDvuVLfiVOUODoXkdNTfJdKUWptTrexzJ",
		@"VPDwBwChwWmKmUzjbTOeDqiCmfBEZpHsjTbNfHXCHpuvEyYalFQFrOlHNmswpDMzxnrFQMHKKLYouWXhjltbgjxHqSGpiQPxLORdzRhZXOWScxIsmkBCVopbHhZqfmtsciRKVbzVzssnxrxu",
	];
	return IquHvZLGVfglRmB;
}

+ (nonnull NSArray *)azsjaVKvEPLDqdEf :(nonnull NSString *)aQFkitzgXEz :(nonnull NSString *)AfywBMgbDSuNkdUX :(nonnull UIImage *)XFQhILwthwWTuZmnlp {
	NSArray *FIotwzoJkrLvs = @[
		@"LsmUbVPDhuyrITcFZFAVOzWtvZHKgzcDTJMHlLejHebqVORAGjfyzYYFIubbjTbztUMWmCbRAXsdQHMkAwfYVUInsRRDJroIvlnwShtpqIeCLigOsDFLudRZFFDKnZryioPDbFvXHdlD",
		@"AeAhfKroYRiZRBrmKfEnQtHlczZbmckroIlgTeViRlrwdcTffQuEnHMBtSYVkyljXfoIKdswwKRoGMOCYHRPOWIYODxDxHXJSKmfJWxrQKWtMI",
		@"gDbjkJdVOqtWsVgeHwYHBvZCsHdwgEFXBakPINazCGetBXPbCkbMAJyZdgJQLPcBpcMOVrTvFMXPgucidRlFKpwqefDcnnPIHZdBjksMlWmZJYWAqkEvhQkBhZhfLxNIbYhhjSdjImnFNryuM",
		@"rKEgfGBDYfXNyHNJoxGLQDSPUUneuHLyvWXOBMvlimYvyYSwMKjcvMisZHLImZAOYRWNYPxhXmPtnbHLsjRYLmICiBOzpLrhTxDeFRtBsMszsPcwZhcXREmQJXsBjtWnyRjMQamDSQVUpO",
		@"OzMupYxbqAZMxyDSyRyDzRmrmsFYNxfPRJmdLWKPTkpnzkwPJWvVpCkBopVLxSHHziEssPwXQRZiEZOkfLoOlGxEMXdVUQTIFPWPwiLqsdftSmiKjjvoCcYHyxvP",
		@"OpeNRDduwTWTkRDBaNUmOkHWDIUxscuNhSaCTQWrXaPgEYCathPlkdNWFvNPHNLfZahxHImnppQczfMmPVWWYzCYJGJahMSOnkzlgxvOxkuLzDcqAivuOBiqFzGZKFYmZYM",
		@"DtFmDLsmwrpRPfpUaFaWBZVcRvFcAoSCUUuhSlIlshEgXgXyGyzsNtzGLmVrPmheTSomHnvQRlLpBskyRFZbHaNzxqbCiHpLBsvVbbeLxIwFBgsWoHEEkXzpzTqxTtlEIhin",
		@"JMVznDYOQsAznneZVyYDQVxIvzUyACJiVulwSLFIHYcHaCQKDxhsxZyXjzTkurHXCVINwkCrSNksFwNfmUMWcAdDjEaTbBIKQBopttNCYJMINpuKdevdsBqcRwAQVjOPZWieqOCqvEcH",
		@"gBhgQRxQLahVXDEOrgubDkYaVgcJqJzCmLxtqYMeubKuRbklsIDPdxSAQeOElLAcAATQMMTTmoaioDWtsstGFYfqAZHbEMVIpPBfEpZn",
		@"SHDeoGuYUNehmNHBkxDxTvpvQHGiztREtlPnxzYZyoevZCuDdgBoiiHhKxkClkhcdhMYWkiCdVSloxcsbMRfJXdEqhmsyPAgIgPoblfbonQHxUhNISBNUAM",
	];
	return FIotwzoJkrLvs;
}

+ (nonnull UIImage *)BOXkuAJhfHGcCpnIQas :(nonnull UIImage *)ZFuBBgxUBRJAXM :(nonnull NSData *)KYHAeWhjfEzWhpxv {
	NSData *JkuVPIsUSCMe = [@"dXhHkOnHTNTzjKWZhCQMwCJgVphedZqwLZaVUMJNChXhuJODqrXAXYlrYlotITRdvJiWLVqfjlMvHnHblvcKgbPfruGJxHmksyYxhIlng" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eAeOThyznQJcXGdMI = [UIImage imageWithData:JkuVPIsUSCMe];
	eAeOThyznQJcXGdMI = [UIImage imageNamed:@"pYwxseioHoRQMqxvCgNwlUOdKoNqWzBCYRooscMswIdWGdOHiqycGrVmRtOfuDzKbxicWbRslngYvRMGwSjdzSpqeJiTOLwEuofIgsuthgihQqTgWcLjoJw"];
	return eAeOThyznQJcXGdMI;
}

+ (nonnull NSDictionary *)JcRNXfOVJDsUU :(nonnull NSString *)CPlckZJmNNadiIVN :(nonnull UIImage *)dIcrsudfdpVfDiD :(nonnull NSArray *)gIWNyvULTXqIvYLh {
	NSDictionary *GFebJRRgbnvc = @{
		@"tWQiRcoJRBCgPstrQO": @"PrKkpwBSpmemAXhhjCAuYJaIcJGJlkTcdTWxDOxzEkbBvlgtCNhEtBvuSIJOZaipTeuZqhqlecnQHhIkROAxLRIMLoUqCBlFMMHPVUNudSbZZFcfNtXKRXLAVIRuOaGZqeFdinIeIdT",
		@"UBELHuIYAqXQAQiiJo": @"EDFfrydPDCcFjigVyQBXOYisRcfVeyGOfjJunzSIAeBSilPjXUTGvmDVxpPczPwQmMWjxlFTpwJfRJeflJwtkuPArtdlFPzpCERCkmZsjGpxYZ",
		@"sbhsMMtLERM": @"cbUHlcHuCvwKdrsfAWzVaEjtPNxaKxSEWnVWGzyHBhHMLZzFzEeyTsKOGiMslMedLpEnqGsgfMaDxQZgyfrwJsUuNKXpWthRpFsguBTDBDNrYCAXpX",
		@"SuMPjcrdAuPnyhd": @"ZTSAuwmoEeWbTPUAJbZaFxwsHpZreIurjLDUUZJEFDYVRYNdQEFaYuRCnAWcNIryBknpEpIBMIGDyLuBaoCvjEYHSPpJVatRSPWEOTABRMyEjDKzLXksAYVpWzocCcuKKWYSsDZvymJuEOrvLLgXJ",
		@"LsWXNHdEOUDTVGptIo": @"AKKtAicgglpEhEwSOlGhiwaileZNnwSUrddalWIJrdtLBybMKKQfkclKlKxDXZtAHRpsSjnRiqbKyDOfhCTjcnNTGbcwIWmGVEDYTOjwRxFEuyZpjK",
		@"JRvjMJCOzdV": @"uKFTkphXRTxpbXrqespXKqgYCMxPINOiqvrXTaWIwyMuteAtDYJRksyCYaemmjFHqcMkCBXqIksNiykIXDOKVnmjlSySehpMMiDDqwqKmUvOcOFnNwjC",
		@"hkSZAhcQYl": @"sbeRMNQfPiQmGTQhCXOnsrLCKBCBYtOzoOgVVWsiWnXZdqmqXHJsNQhkRqqKTLDivCEnkuUAVoRDfzuDVSuQvdyoKDQqlUrZTYafAZ",
		@"sDHsjUQXZEFOVGBtJd": @"MnwszJzddNQcuFshvdrAJPhJWKXuseUobsfZCAPJeWhuwTkbCVCpduCTBZwDDQzFciBuozdOlncWzspayLlHZehEVDaobjioRwyWjvPyLVnqaijIbRrtKTNtDrxWrmGYlKnzC",
		@"JvafojdfOqOsCZaCcRJ": @"MDDkZFBeHBHogWVzTWbmBDrOMHbBseLkxEytPsQzoTlUQyxpdRBZhJPWnAoQzAhJQZYJwpxnEwknWgOYmaArGvZCxHatwdMvqOjlWcbdSi",
		@"LnCTgyTtBJeUUd": @"ElnMuSJKpfvuLxQGyDugqIiTgdzVnUyryFPjOBQeOPdvdDvFsvBLjBlMQcWOLLKtPGocyPyCrbiUjbIzESCSYjDwtLrxoRyfOYQcLYgiFgkJPwHissFJyPFMhFClcaolYIrQTiHvEtXyGkXxP",
		@"zEgchDWMktAbiYTcR": @"TAKiqGmzkKsLnMxyCQKEgKjxKPabjUsEjoDjMyEdGCMvORXIiWoTLlypneislGREWKmoSDFYKqKKvSXiBPPcmIRFaDpBeKhkMxydkblXAfByKOjK",
		@"ApzdjcmrSkMTyk": @"oxTfQOUARZzyAImnuFhVHwXGgbMTsGZmtgNObezQlEchkGpaEUsmZPaVxpilCwgeXRETtBLFfCkZReQfpioTGFvlyShQBZPAFtmGMhinIZzUtAAzoOzERMfpGuDJvNCOaLMPwaXNnzA",
		@"EPEFJcZPIKQugi": @"MMddbqbayLmfMkMvzVcHeXIJVYhFAKBoPgVLcnoLoVWpNEXKJhvboNblQtTgzrLTlHaZtXuFverbgytEZWmfyuwRcyQwBNsgpuICTKgAKQDmLiAdzIH",
	};
	return GFebJRRgbnvc;
}

+ (nonnull NSArray *)SLNnrEtawyz :(nonnull NSData *)RRKKqlyrgqNX {
	NSArray *QwNMUDGSRQF = @[
		@"EwJvZXwoiojKHIUYvdJOHoiZUZVoFaWzERFKuZYjHmIJVmpaTNNvQoxWRAAzQcfXmRhMwnZcgeQMlqILsgzWFiwjrsThBvhxfiVqlSoQDaQMqpqCYcjSxpcIWkqmwBnrvjdlsucFek",
		@"SCHRnEneMCbMMfagqHjEzaQaDzNiTVTgPIpbrjpXYHxaAjRdMneXfEToDkcircuLkaSEajUxNnveLpbPeLSHAfFKOyzNJGGtTJxsQhFUFcKZUMIKevouunbBXCQTlNvJyx",
		@"xTClbetAtPvRgUzfjLjIqLlzmNVNZUtbAdHguwFSrnCZeMsUPukFFoJlEzetEffqstwKNeWvtDwIXudsIhLPQsmDIbJMcMKAXoXsxEiFOrMTYQTTOtlvYVyHLYkobMPsxQtbshdo",
		@"aMSyGpSNdFJopJFwJCGTfwYfgEhQryKJLSaipZjeqckUqknBWlgBqrSufZEqXsTfmxRbxeINbiECqKaWETwJOVSBFiapnWCAqMJctvTabrpvcCmZjfSRGaPYr",
		@"RLJCSaOQmgNucKfDgYyXKShPfmFDsgaCjmKxOeUeyAcvkhIYLlEItFeZoJcBlRQTfZrqWKMscleFzrJDXdrioUloyDgxBLGjZtbeJfIeslegZHdVnhWuqa",
		@"ldtDUiHdPhRfhpSKMPEbFkEkByniqNGfkksFPmmxbclMLOcDWdacAAYGpeKURYebupsoVAyjQldMdepXlJkEOTStgHcVPENJrVBjUBGir",
		@"SzHQxypLqUXzmxZjqWczhAJNRSKbzedijLNnNmqHlcCOQrtDCzhcjtlpAqtPbAJBvHuojWcNdSnczXudirRrixRqnPIQVcYKwmzrLrSTeOUtkRhNwWmBEkPiUFRBl",
		@"CXpMyAKCBgnzRXeIsgeDKRuctLkgpPQylqmJvPbRBQmYuWrICbeaYSjgxgQfizlOdqhOptKikbFPrlTfvrZebyCbxuuLMGNIbzXpIQbQYCkwZxSbXJIlOIIfhlBOpA",
		@"mIcdYKqISoTBkpXhVYrivbeNnnbjfQbioaRqiJsZBmcfwHqbeNsulgdnhwdPfRPjzWsniGAEhrXdAxzYNRUXrTIssytwNTBYwOxabmlJNPCbWWeSIECYaIZernjkGdFJNipEtsykFiOrzEtVXYWc",
		@"TuSuZFuXkiwfqBafyiuNPUBoweRKcURJZgITXcIxUNdakXMRYcKkcBIyoGBdXyyWShhWNjBbkYnCgDBHBqhartyWkxuRmTgkLVrwzBhgPQtoZTCbAL",
		@"sDDwCsHuLDzstTQsaHnqyEXtQmvZDMUqfBIOIKcDxBcDrjZyRDXxZIXzPSmMAJWVqLQElVKIUlTnLtPPsUFPDqcvZfFZXreakbXjuVVJoDQrDqzgdw",
		@"MMdOiKGWBeYuJTWmjpqtOXRnLLDoBhnIyzsMcqzKPliTVgwtEVlvBqxfhVAqvQGxgKkwQzJehZnOwiWMOJtEHNyPeQPFruiyCosGmnsZjcgYK",
		@"KmEOYQjSYVdaOzgxPoInkguTklOinmlWksOMaCnNNRwJIELiEVFavnTKjPnGtJuiafqCDxktongdiIwMUlWRdCbnnCSSpjekDfPKjfFqJCjHloQ",
		@"URmHvPCECOyiXmmDyIbRVfweaiSJzxohySxCBtjOLoJRRKZJNbIMFvtbbbINrMgEUGUUOxYuXfpeHIJulNukGaHhplWYfJnqctYGRHaCttncmrfGTILXwWMDFAWxyHgDGXQreeEJfMadTBSlUFn",
		@"OxQHgHbBuhQVVtxPlKBfGwHzZTUHKvRNaGGKsIsELNlEDZiQknmMuZOmYqBsnnhZFVVrDISnRCemNpRKdwXNyKBMavbyDnYVTpoAvkmWSzkhLaynDfgXduLSDGnGJsVyZJ",
		@"MEDNSDGatIXBFEqLZONCxzSVmhBtddCakLpraxcbNdsDjkzKfqxzTrqZRVGoWspfAjGbBdBEvZixdkOOycoMiOLaihfVnUVyWJdlpsKIwOYwJvoyYBOMtPLYyOpNaME",
		@"ZrhvoIiAvGMfQUNZBJxeYZTYZrQLqKLdXueNQprFDLSEHyhZiXZjSrjpvzYABemsCCVDuxVgKdrHkPalerZdSRLNsHWaJOjBpHQaLDiSTPoLIjsiHkXqyMMkQlntHUsIDFkgsvabOIDJPPrvveg",
		@"IVXrkegpQdBRmXIIsMURWMdcJWBhYxuiqgXrwfilAAYFdsllPrEvnYIqbOdrfuhJAxlFIbpPdLVRKklylRVxzSgLgYJGMbNQINfQpvLdoSMXuIhlFWfIITNSyycVvceuIHbaZucyRh",
	];
	return QwNMUDGSRQF;
}

+ (nonnull NSString *)UklHpLfvipj :(nonnull NSData *)iebICHBwrmBJYm {
	NSString *neRcWZboDCiupYMXcbv = @"vTovEITGIFnwvqxLYXJMfGQxvyMKkVOixSDKFAyShJTNqrxaeLkVtDBFRJXmCPuCjjMDVMpstekpXGRbghWWqqTsQGzlDpvDYbsrGkwAbCbCTvZrbzCilmGYdUATtVyevPYxlZkqyGRrBmm";
	return neRcWZboDCiupYMXcbv;
}

+ (nonnull NSArray *)SeMLvxpLJnDDQW :(nonnull NSString *)ibQNYeNRRpps :(nonnull NSDictionary *)bxAaNcpZCbY {
	NSArray *DjuJSpjuOpt = @[
		@"ukIuEBprmFIXfxRjFzPHIdUNbhxAYsohhDPzRZqHBgDCTcKDLhORBIbGiqnigbuxvYgaPgbaAKoTtxxvhmVIGpDfErKdIcvvYdYjdtHdZKDDBLOeqMxXRilGzJhdXWlCyqoZrzxfkAPWAiLkJx",
		@"yErpwVczBRFQYLdzODcaPofVmWgTTvEmmUkXknpEbbwyAvFJAeVAgwlSfqCwnuetyQLTlpOOSymJDyssTTDKlGFTuZPvoaEAhzCzhsOcdgieOhV",
		@"WdYCmHTEDbiahxEJETgBClqRZboXyhwsOyYVoxAClzQYGxxIUGGaUWbrRqgimnYIraFsCgYqgJwizErAhdXtIkaJUivPNYamxnFBpXJqNAjKJAW",
		@"GGvAOgiEHWJRebgsIudodtHwvFOhJgMAhoRUEwWUjBoCgQhcjXAeskUVwWJXGEcFNLSjyiiuQuqHbkVkAVZfHBOMVHZEfsPmYdyGvzYZzJbGRpcGzEdNIEHbeIoxCFfMaxzIsWbuOnC",
		@"ebiYiSTulNVEpAkOenjIOGcuOcxpuXcrQFkLOvTnvzpYrtKnNsfPPxVVveSkYgDSmEUCikWwltMHILKrFwFdUIuCXbtDbHzFkInGqodFWnhzBlWYPlaODnbZJfoZPRGEVZYtpxMiTQP",
		@"TYyiHXrHuKArfcanCCbicJSXIDoblLgVGRBFibKbUkpXvikuDVoyUpsJyxcEunevfYDVpMbwoDdieYenKsuCTYlRoDkoZMQwuVjVAgdRqQRi",
		@"sSKbBmWrgyfCQtdVekOiRRkdWvPKrYMjheAshGinQBLXlAwiUTwZVyUXXriRKpRMoXBwCKBCszCwtJVSSPJKLJNhmPNSjkzoHFngAFmbZIwKjeNsRBRzD",
		@"WTCASYbHvIPKEyGYoNwViOZAFmcEnaERLXzdhmGJohqDkdVTkVZaKFVfbeDGGcwnnaaQAvNQYYIBfzWQtxRINqpZvanlNzhPZQWwquucUc",
		@"WAOvMprcpEVESckQddnZjOHBUdiKyqfJXEDDSlZwdHjyzbYqlTbtiCwDlCnCywvmOQqmqsWSBTHwKUxxFnWreADoBecsjXDLcZXhAFkgqTFQiJaEyCOfIPnFCQkqKQFxozFnlfhy",
		@"jVXjvOhAbjYsZfUFDDPjYPuEGyMOpiOcuCNDTPRKFSOWTQuCQHGSxMuXFwbSwmzirMrrbXtQtOHypbAeqwkbkpGByoDxtuMuaTBxvLgEXaQXeHciwTzKhCEZKWLxuVLhNjYmpdkSudAQTFkix",
		@"nDxtEfhgDYKDSLoSXRGxonfFXrkTDyrITrWzFZGdnvPcOIobgqGHfszAAoyTTWjJAMxubGhuBLSXYgQVudAYrAraNVFqcGlTgGrLAeVUBanwzuFDIIocPfUyNEbeylVousddGw",
		@"JcmbLPNLYRSUbbcicoYoWmQDUTqqiLdUYLkPTlrIuyqrPoNUWBMiKuZKbJHpdAdAleqMeoyrIEIGPWsmXmKkNgfUcDmclBjfCtpdZoITQjDYlSUIjiCQlrBxvpWJbTXbIaSr",
		@"SmXDIPADIMshPLCAMRkpvxqhcywDSLWScEreThXUsvmWCDExWSFJSVElJBwVxDAePyJpELdPfSrDHJydsQGXjGnsyofwvXwHcQJZKMFnSCvsXlzfb",
		@"PNGDWCpgWosctQqiLBEzcpmxSmKMzrmXgLUmcNpWBxOCJrdaMIjMWpUaasJCUnsJoZFPTjBNVAKHyjfyCCbMhihTxhUUkeLJsPgxGOZymOzGpWicoOWVLKtyGpjxKzeowyWfNESTDqHqJFQJo",
		@"FDRrvgCmuCeiQcLXkxAgzLGCVbkVJrRMRCgIgUKeIpveHATpsUFZBYCUOgvURxKLldXGKWecVAFKIMpYhuPpZVKpOCTSTEVxpqVSG",
	];
	return DjuJSpjuOpt;
}

- (nonnull NSString *)kcpNCYiLqiGjSmpChW :(nonnull NSData *)obSWtOskJgQ {
	NSString *CesDwQQIVyg = @"HRZNHmdTcAkgzArBFWPluIPeEgAblbzKStWitInZusyuXVgjRqZlovkJNcvxeFMYOrRbBvoeLcPqhGDjasaedoHPgCsqOZbyddODBBEi";
	return CesDwQQIVyg;
}

+ (nonnull NSDictionary *)nfAALtmTNMRVFEk :(nonnull NSArray *)plIpHiibtemFbqaRuhG {
	NSDictionary *bGxIThGKXVskzlZl = @{
		@"rFuRiQVPlRGd": @"ZZpocbCiYisJrvNuqHBaDfnWhchqjkrfCyvTSfXwSUBnMIApVOeaxkHDmvAzcUCSYyTLJRHeGeGloAxVuuOksIlKfyjJIRdJLtbHsObHIRAMsfXPjHFjsYGwNpWBISGVoVRnYbjOXq",
		@"aKFoxRlSsgEi": @"QtraEiaOTPqiILSVIoRSVvYfprJeFUwmXzNdhnDBWkGUyIsSgiLSatUicieUfOsOUaKLzdODFSPdfyHQRGBRWxCwqUUJyeNdtmowSNxJGjTWDoMTNBtcrIuvzhwIMxvSJ",
		@"wzzqTAOAGxRL": @"GxQmSNkzOVkhyaYBuCxqCBqaCufwKSFZZLlYTRHbfZcGNkVOXHZNrGhJHgCuZPcgORLujKadxjgqAPrhmahCqoumQmypZuFHiqDpxwSezDZa",
		@"LxsXBYoZEy": @"QJwgMogLxASiSolSwjwqKHJGSuoYdWAbtKJeIjeghKzyXXeqxzIpChnIZQAhdYWtuPloXbNMUwPYHRzSiSNtKCkqCkuiFpkxLVWTqmQgwXuWYXVaIPWiBjHMuVOeRRkPwunHEtqQUfzkCzKyLZ",
		@"xNNZBQPYSJeKAyvIn": @"SfOxHFYhivunRTbQGwKkBUzyyqLiJGJnjiJFvvmSZlfGNZbazvQprrIUPbPGYbdUtAehbwfGduFyYGnkqLkpsHrGTSmBUygXrtIQeCucjKAqSOQpNTWtjgdtTMsvXLLEFAZZGVaqrXdrIHkxgxPs",
		@"vvxcUfbfXHQ": @"QWpyYRCvYaqrPcUWkCuuxzFphwqaKRzCRUCTgMdGGclvfNAVjjIbHSThYdodXLxBKwrzcalISJpSznwzXbjeAmJRnkIvjToPqROETlAERcIGZNwvkLStwsVhomyvbVzCqzicypYruVXCkw",
		@"ppSvKdYREo": @"PwpQSNybCaYaKehDBgonjCiveWxKhZjdbTtrBDtxAbchalccAnPAbLRbzFGJIWmfIadFYhYBaPkCNAMbRWhFnMjaygFUOIQmEywrdMRCNPNqcwNAq",
		@"NkssWjsWSUksbasR": @"lBRbBBZFGKMGGJzchPiVDMDzdqcybvwKxCLUoSyhLEihCsUftNnSINptyTMfeGMoWmSUwyRAVaaDTvqIoPqIQjySqLstXwHLmmPfhKIPdJphMbzToqlQXyhxPYEQUiHVSChdYmKMSZmyhoUKV",
		@"GVkPLOnYzsXKnrk": @"iVKxSEpTMnUtELgQzNPnAgDWaFbcTBbeVmukRJWuBybYCZntSDNSJfYdPwxaSldqGYGWOezPJtvsIEntTkDkLvzaZifJdbGxMEAvgsNMNabIUxOTWVdBHtRhbgfZyKdvlOtP",
		@"WvMTwxryzNs": @"DKMFmouoBkTmGjKvCVqXXhPBMmQNaSWjYxjqdvIcemEhjJmBwsfXZUgMUFGFQPGmIpRYoFqaMLWAayBEksNUYfKIrLZqUlWxfvDSyxMuQYLpdLcHuuRkhThjNFUnbNDNzNoYtTVSJliKuKn",
		@"xtQqkUmlhI": @"pkzFZzqkmWnrPtpKdPfSzcdnMGhlbCWIqFydyYxbZvmeCiUauTJfVgXXdngESDmVBjusxVSXpNghrRdcSawDWtmNcokamaIoAwmsvwBU",
		@"AMvbSYFzWsGyUIyUESa": @"viBgXUJuhfkQSAAdvQRbkeIzIiycaAcIvfDmhbIkIqBAtoEWYHoFmbNVNQPdBKnVRlqSeckRpQanEuuPauEZvOlREqkKzHHrbeVGifpMcJkITNEvzHLxxAqtlFNcsKGcRGkPriQYeDO",
		@"ZdJDlILkWIpUXjGS": @"zTdRTOVDdIlCAcdjPnwBthWERuIkrgzHsnhsIljTnMrnJXuiaBYoUiovEttElqYHJXOFZhxEJUCoOIJTxYhObuSdFPZGGfTudycaGYWkOtcxTCPER",
		@"iSGrYJAdzHYpiJuwURE": @"sBewhkKJXJACOwoppnmXnqOohSHIBaAqucazFWjqsxeNtfbWVeQPClGvlxWHyVgcLyOLxpJscGTbWaaTfwTkiIsDMipWavasTxhML",
		@"OCVPeyubokAvpIKIvvG": @"moCloozCTmrAWVNQhieSjRCfgVKCRilXwoVgRGxLzlNdXiNCdruItsGAaHzaLooQhOsmCbmDKbBhKshxKjJcRAxIFyQtXyTifiKrvHyZGwqaKvulHWcdUNRtKG",
		@"WtXHyHExhtXQX": @"QXNutsyuSDZkqOItrLuXMQPwDrkCfzCAGOCHbwudrqKVmduNGuJVSNHEwNanXuYfOityGLfqAOazSmQKEnBrzejphpZZXiuIHZczFGZVOXUdhglFRuWThnnCdKdlGFtQUsTwVRvFZrHJiZtM",
		@"HDWuacXdNRxyxB": @"AQvAvMHynWMeiqsSXByWYnjovgawKNwWFtJLSsToVFzTBoknmScVvYbsqbykmlRMPmNUIafnDTCvRwMzVVVHqRqyrslCRokgXTbpJZUeoxImGpQcznmUSlIeZrifqc",
		@"FzYXHdPhyxXtFHcwyiZ": @"SWEuKKwaNWSTrtTUUyCzbaYBGDXwmkCWUJMbgZntNMFRvccSekHAxiLPleAzJmtWPLozvrsEOWudgKhizYcCCCqlDMwatxzmaoSsegxKqXrVqMEDerRLnYxJTCKFrwmrsuJzC",
	};
	return bGxIThGKXVskzlZl;
}

- (nonnull NSDictionary *)qeDjJcrJKKMQRhjn :(nonnull NSString *)XRxjeKceVlWjMp :(nonnull NSData *)iYzXzUKexuoMXSu :(nonnull NSDictionary *)HVyjTsDZCutdn {
	NSDictionary *yRBfwcDHAjWynDcEIEi = @{
		@"OmQPqXPgkMX": @"ayxqMfjZbMQZwtOxVFqtuDKpaXJmIJstragNLtRIUchumizfONeFKeqIpDEMHXdjHjoJArjlrddSYJebnfWqSjlqDxcVzgTYbyYOPxmtCGnKRzDFCahfvAmpXoZOdsqGcqzwosBWzlfuhjuWHRZ",
		@"jtqhhdfQDqW": @"YipPjirxJuOBblVnMtgmrGgBAyTHAnIBFbhjsFcORqbEqBJAQEYmoKCbeptjMdaPvPptGkqTdursgbqfavPMEqSEYdoggtcZBNSmQFQKPuwPWOSwSmspHHTaNbxDstDusTrWkvgByjQNE",
		@"ryosbUzVYX": @"bxwwxwcsinVaqhRlyfIbFAOzqAUQGLAtQQLclqPTXNaVdiQpiLzkOvQryzljfiAwHpxSxtXEdqurgndUcPCgjuOygaBNEZZPEsBWEEzDDzYax",
		@"QBbjiNdpsk": @"RcJYejcsBMEyrhNbJyNHRUNpegBabmDzETjkjJBuevZzPGdZUxfwQalEwPYALYCJGtiOieyEpEzgrlKdUvmzNfOLIHXhfglZUPUIbGELIwzuyKOgXCJNmqjQDPIdVDKUmurxhHrYPotIJRWO",
		@"FFOgOsfGzFyJTQqh": @"LmIgGijvqXBzSvpOxUYBEjJcefWKTPkwicJYSnSkrbAFMBKsYzwKdhmNUHcNWLcaTpfEaotUicmDigfwPaUMuqEEOcWoCymjQHuNbzlPweUmzCefWCLEcuIdieffsLTzmvgvufhirERkaLwbqIG",
		@"FJOPLtPxjzErUQWwrtB": @"UEBmCimDKSupKLCyXVwKSwyAHWFvwlayTBhAwaDLnyBHfLnsLsuZVEHJWfoLPZmOnRWitKrQSyAqRILvRFAKJMNeByuXANvusuGqFBkUIZEKGGqTlRSrkZNAjzkwqZDdpBFCDtWvGFdMBYOSEZNkL",
		@"POgxLXzwfkqW": @"sIXlAfgnTCnKUHPXiSbXcWuMLYjnIoNDSwgZOSEGmxSyJvHpkpVBVpeRFisskKMqDlyWfFNSVxxZCftmiPATJbZrecDQRDsiTRtXTzRqUaxxexLscosHsggAyyotRMXigRVGILeoDjQpsvG",
		@"AdAQkgaoWtlA": @"oyTCRNcPFcmYwqRNlLYXGEJTjCRlIOSxNFgwxEkBWSVYESAjDeKHhcbVYCfDrnIlMbnteLYvlcKDScgENStOwLAqGqtqXdZzmBDwrnyIVfkODxXvSVFSfzwybZJxyyRblynH",
		@"BOmXdCMIuhRvx": @"dEJFhMMNFUweaPVfhJptQXRurQnoNDnaPhLFUIOEHtONZrPYdxWKJCmBAsBBqFpQeGbqyTVqMRdROCXKdOSPCvnLTfLzjwoIxaATYrHry",
		@"oGHThwHDcgs": @"ZfgwdNFAdlpPnkTtkwtZEveiZLNecfKrKmIbHnmFOldmFyWPhopVHCpykLmKXBUBzwoPoAwPMPMcvSrNdHqsDSfCkqIlFpXYGjeH",
		@"fVhdrBrULhkmo": @"yjPFitNBPoOknhcMtHMabHahAIDdrwvhpxYaGgulWEsWCMjPJefSRYxvHDQNnlFygtRhIhFrmIzZHXCmnNPgdJduXrWmAQDfSEgqbfjnwvColzpSQC",
		@"ZdGCWzhlkezYFijJcP": @"FgHyOxeyjAzWfqlntYoKCJdMUeWJTfbZJFeTfyhYqjIhWObyhSsfPdyYhzBbBkCvElcqcTNvcdbAvyYvTytcRhdHYIhclGFCkjNcrFuolJHHlwCMGTtLdQugahBiEvWDVtkkOi",
		@"CBonWwIYvLsO": @"raZaBPBGETjgutppqPEQRYyyTHCFEysnvJHdnAQITYYfWsQuQPbGPlJLTzERoTrGYKScMTngCFifVQtqxpjDphKFnheeVctAmfbhZEwVcwsFvLWdZanWSBIdNtZEbbmXqQCrokFLIBQbgyA",
		@"hTFmFsOSWHONapPkO": @"DKAojQwjlviEnsoHAEUWOSKnXyOsVowOwUdRZkyeKwMnQecqoNzKBuuLGWGkNIRaSJQlNACUEJZjNROCzuxWWCLLoEJyMXHEJOTbhhHJMjKffZzIBR",
		@"YSXlSOaTYYxVGeKJ": @"UuuQePbjaPrGKZZkcxeAwFGmInBuDxlhnovuKXfTQEVjRWPesQQyVboLJRJjFcbANtRBxpIKGBKuUSoZoxmdkQvceEKKWhWuqBsZzqpbgXRDCsUCuLYrCgY",
		@"unMeqfIhqxWizqzFD": @"gosZTteTHzYSjESjJHbaghkCujeyvYoUHxJJQAshBvMnQNdEUtNIGFZLGlmAAsjiTwQjQIKSuCTElLsISKkWWmSwooFQHXRcpNTBbTAteyTZzfUTVfpxmVZhIGMWHMhXWCuSUfxjqkjL",
		@"kWRxCcyPctt": @"MtXPyvJuyKGCnGtEYLWVaQpQgDqhNJDMRJCPEtFwFpRRRKxPtonZrILZQYLfSMMMRrzJLMHArIJhsWxNBjyjuzRnizmzALxMyVZDWxHrlGiaabfFeXxFszDFBtIcDQOdpprYV",
		@"FWjpenUNFIqEGtFbqC": @"rzsINFnhVmkHJyWVGSshJfXxUIvyvzUIoyRjJGjePFdcPLrYPXNchrSHdYtCGJOzFfBYGNmuWhshgahfSLSDfcevajtefGsTPBcfjcuYo",
		@"JcoWaYqtEgEzBRYh": @"HDVuBImgUNJJYOfNUpWsgewZUTlYCwqusHFFAnxPIcncijQEhPNqEekTDEFjJhaFyhBRvFalkcDeKqotYIBpaumxlLIEWutUWiwEacJOWWrHiZKCQRtuoxkaqbexgEBedpprFE",
	};
	return yRBfwcDHAjWynDcEIEi;
}

+ (nonnull NSArray *)oJDvwpeSDvVxb :(nonnull NSDictionary *)wTwPkXRUiz {
	NSArray *VLJcbiBOSDuohXPiQU = @[
		@"dpnPVDMFwVjzhJqKzCTrNnUiCYIZunHMpNUxXAOsTCtgnhIAlXXvRypCIQzUmraRGteLAcZkQsxSXZDRYHroLktFwhhYDSWNHoBQJGpVMxUsMZsuDfptsSJuejCJaYWao",
		@"RixuoIOfehYYnLxRIpkWiaDTbXVDxjTjhGpZREVnzRKpaFDZjubjongCpoYNOZJLQOSBGmpwuwQApcIDrHXYTMjdBzKzXozagKJuYRRrrCdyFyQafZZRZNeGHxUkgVhnRVukZOl",
		@"BzIrXmuvMCDMsdmGiWyBwDoqzvXEViHhWSxiHHbMlEWuGpLqStGMKUgHNDSxLSpnZNqBeUGlvMBoTZIlTBdBfvVHVPisshfhDQjGCfILngduBWKsPGMDozNdoYxMaSwewdgkFerkVSBskzv",
		@"bxkpftGixXtbtfvAoRcOqtjYgazPInaNGeixhkoQaAHKEfxJuaFjzYNixYicwkxjrSSsnEHKEWSktmamumEyCspFvlqefNXPnYdHKvtMuQfvBEjdwfPGTluojfIQwUfwyShNHlyxSQqpRJpGLq",
		@"xvwOrnDrMDdNGVWozXtNcInjywmnSnhYFZkfVzuHyelMEpcXqYDjpGurLsrFLrIBuEuUEMUnvYHckcyvRulAbDKYgdhEviPNsgvwSJFSYKmiluOavuqAGHbhZI",
		@"QeHVLnkMWOGaGtcNbJhuEivPSnkxwYoNthWezoyJeFGpmjblsCZkqEHEPpaTvtvNFpJsLMMGYlIWpuwXWtZIEjhNqTwBfxiQMAyCeQekPmxByLhAtEOUVIofQpiAiIimYWAwdykgaRMfCUpueYgFK",
		@"vwklrOHvpsbaWZOCiAJCFhRCAdHFuccnbcdzewpfJggMMlRJFQMjzFPrzfnItqIKUKEaSSBpRjZTMCfonWIIANbTGpgTLhmcuuzDfQWqqiwXgjhKOpcgJvpqzcON",
		@"aksuDgnOCCTMtGIgSPZAFSsLDUdtITTTOeITqHJDXkEAkXWeHiRjhjeEmBXGMWEWGoVqLoJtgtmqvIrLOtmHSqkACFkRuKPelzpWHwtIdyUc",
		@"TMNIfBnxirezjOZZZmLZuBLnBrMOyhjGyVQdOPghLxuCIfZKdTeRxDtUMrTOnkNJHFZYZReGvjkbrMzVTLYROmORBqLxRmaVEfkVN",
		@"lJZUAYIxPcqrwSfYPzujKOUpBnxcIbzXWPUwAxxIvtYhhdVWWojSATKSDVNcoLkuWWuDIaxjcvtXqfmrfULTVeHchqrcjjSgbHuyktlYsnAtFosjbLafpwRfFTlzrOhlnizeRAKIJpshyhsKAJde",
		@"LYceWnppjyWKMAZKXECTgBFULmyKlSxKHnnVAPCkRlrQAebIHIbAAaxVQNZUmwcHxKXNSLfVJhKEFWiCtEPxZoYdVnpFDPJvdumrkObxCByFCsHslCbzdu",
		@"EtNOCgQTIeIcYCJGXvuPSRlosHJDBiyEceShcZbbVTnLAYmwsoDnvgKcdnCOirkmcUjexUZsKCOnndcGLOEMrQIVmzNEUmXGuFKCTmOrOticeY",
		@"XknRJpTUhxpdXSPFuonHKTpjKhKbXIeSeoeomVFoDFYYlGoOirILaWDKcFepGtzseywQEHMCeqbmfQtlCmBrCREoWPBYxrfmyjgdSGFBjwqdyW",
		@"AirlTXtBFbJvNsrvNZsGchYQkhuwvYiRRYIeENVlWsKSRpEybNkneYseeWIjsncpQjDQBwRZCFkIwzLAyypsBJxjNwGPZEbdqpMrFBnAoZyMuiVuQDxIpXNnYznZpWMolYAjGuXj",
		@"rFLnCsNcmlNLCYjPlIAtTcjfGLkaKgoowzUcaMIMXJpgqssWOxeTwrbiyaPYuCgToXdXCPzHAYzCixCaaQgjaCsPuqkjFJdKjLMMPoRbZRWM",
	];
	return VLJcbiBOSDuohXPiQU;
}

+ (nonnull NSData *)etlYhxJiYmDejznhLgw :(nonnull UIImage *)SGHxVqnXDAYKQSoR :(nonnull UIImage *)jlrTxpUCskvqpKlGHA {
	NSData *lXArMKdTFtvWSylD = [@"cVkljiPdPdgtuvUKAzBUGFLiGGVzIhURHCKwgbwaMxKaRtkOSIUBgsdWpLeXBodgFmkzsTbuTgKcfLhfZXFrGlsRZKGJvyxLlWZOkgSVJjz" dataUsingEncoding:NSUTF8StringEncoding];
	return lXArMKdTFtvWSylD;
}

+ (nonnull NSArray *)PysHEQnfrrcsR :(nonnull UIImage *)SswYyHmPqFzVP :(nonnull NSData *)obasxzIkOSpDk :(nonnull UIImage *)zdEKvFkLFq {
	NSArray *vrGCwXtKsdyzVyXj = @[
		@"UCtjunGJmhyZOcHLxXCMcmmEqJAxCqpuaHKsahFyVkvgOSaFkzCLhgIopuYTucVSGwZsAZQtqekQfMaKOyaWgGbnPjWeFpRJxMvjQIGUIIiNjxcyadFBWJAtCnNeWRgmgDpB",
		@"zHSKTKPcyrwerZgPOZyqGbmfgxUrcJohrWigmlTdDpqRSphXDDMVcblEkxxqJEBgIXqjENvOGVdmXuTSmSyLtUFQyQJmTzxpeyODNvgxzOUdIIzzeAeTSiVUhGVRKimDa",
		@"XVSiLMNXdQXUIvkXhMDvMfxBfkTkIkKDeQnScXfbAYeDiFUkoxFTdafXYkgxbUYfVFHldTOmAKDeNzFGPoyrqWFcQKTxmQsOCJJopnfkkmgDfMhOqSKkuWQKjQflyhQmABYzzwArMyF",
		@"oOInqqjovzirGTqXkqElpFdWRqroQjQADkIUvOswCIuFHmeBqssrhBxWOOkWrRKtcBlPaXQnNdmzwygZXyIwODrMTGrjlBSuTvaadsWKoBfkMiKMzquCy",
		@"QtKZYnMSoeMttccKNrdZrVECqHrjOvJkcTtjRyHGqPzHvzQKtXkPjhLocXUtBkbQfMDlLASYdLcUTYJAPiciGNtrzsdcSqRpzjgkkUqsTmNOUdysIoSTcLMNLpgOcBDiVbqkWJTYBYJKAuoSkEVf",
		@"LpApEYRklrkeCvTmcbINAhDeBIgAMmnnrIQPmCRlefkIvXitmMJdOrgIQtwqsRIAUsDUjqqyoTTSzvHPaWMqxyfKghVGAlSleeQMk",
		@"LTdLnYijrTStbmjprfdkhQoNFemMTHjuhdUYglYGxXdWDqDFWjYFdkgQPcIGLQEUvMVVGVPALOcoFJUqugOgvDYFCUEOhiLEfoWJmTvWNJSxXrJoKifxStlCluAe",
		@"chRrwavJpgfMHMJNrFCrqyMzDzNtXAcqZfJmWCeVWRNimFBNdeBiVGcOqZFhCLkrJAmYRSWaXvarEWGCtRzmkUyoDgyqHSUtgnSlQPsYWVBqwrQKjqzsbEqLv",
		@"VvMwfrkKbkXWybSvNYLPIGQRoQoJKLjfkbdnJBwFRiIvIsVjBklAMwXcReaBghHrfoshtzytKVLcmIPbmGpztLDjkLAHBuviRqSfXctWnnYqhIZWxahJ",
		@"bjhhsGcuFuOgfnCHCFQEUJmANTRUieucpUrLUbFJhQBdaxxpYvjFOUHVDHhcRVxcBaZRnziEZyEAFpAcfyhLPfCdzDzKRwmoHaGHJliWQrryuJSEgDlPrZtjqtKSjYTCybQVgdlOHYGpRFVveLRe",
	];
	return vrGCwXtKsdyzVyXj;
}

+ (nonnull NSDictionary *)xSkXyWycENpeITkQGqY :(nonnull NSDictionary *)AhYROPFSsNkKYH :(nonnull NSData *)eqguwiSHsNxcIgEyUG {
	NSDictionary *gWkeAvXzEkK = @{
		@"ripEBuFlDjQElwkPoyj": @"CsNCbmUdQEDwhdpcdejbscClTMrLMoaZcsWFCKchWYewLuqEQjGKZgNAHupCUbhAVpFAXesUUfdgOGzRuCoLxVEwXtmUCheGkRCDNPSoQxUSnoNCjodeeKzTlvBrELPW",
		@"lziNJpKTRVuayOvJJ": @"zmjDkclPzTLmWiiZljrEWvNRYiVZAbVMxAjmtCaNYAIvfcmrzFzVYNfJPMmrSXDwlfEPdxeCCmYwSCGhvxJlENNuRaiMCgzBAMZUcdhvxCHUfFhglElzwNBBszkiwycMFMJ",
		@"XuqfvevAxKvxZzlF": @"SvKGoRvamPoitEVmAAGgvTSyzgshsAfkkOrmuALiDcmKPzVyKDgOKbZvrMYVdVozHIKsAZujWKbDPNEgoXEJwGPvgpbRjNbQJFDTbmgxLrSUxUBybBTYhA",
		@"gguWexSKZRfvQdVohw": @"ByXUPszNGLoMkzhpVSwyiHxoZRTSZWZoDENFXQIucXrlJRQrrMtWSmLoMVFHLBtDMRXCUPdRKYPplAVjjuaDpkvHtvmKMvYauIrpOUXwdTWyRJsJiAdtJgPCnRtQmbprIBUdHLfejtZuyKBFRsnT",
		@"dnZazmUbhc": @"wvZUXOkeyVopLnJtwMCLkPnxwOfMflCDpLELGFQfmpQVPmebDWrNSLAxnIPpTRivJTlqUuycjMxGJQcbWibaatlUWfMkCbOGMUjhTjCYqRtPVUrmwTKr",
		@"zzayuAEqZmrUTyjbsW": @"cAiuvaITLYwFCVmHoSJidbuBaBIJKEyFjCfyCmRTARkVNsMpJpMhEPpUNjNfvWvQDuJHnTxgeCVwaBKNChulOQdXiWrsoYuTGlGvPbgHWiRxAYzrTko",
		@"JERTLzXNwosU": @"eIjglFbypuZtguWTSGliJWtKNWPWkcNHkNYMXsUGvIUBoISMIKmgnoOlTOeqWcSJwMpesVqIwngYFxoKJiQzLNWwrTVSImZfhtwtTXSOt",
		@"NomLVQCHkSGEMaT": @"oKjgYWCUZWHUEjlyIRaQGvNIRjpmqcArdGjAEffovaNiMBPyQiXkVciQhHDydPQkEHkXgDLBMZnHwGlAKJwUjAivYfyxWwTUQbLgZsdczTyCFiOPNFofrHEmieCgERAUQFGq",
		@"DbIhOPsPnImOheeS": @"GyXbyrcpWhTGEuvzKHvTYQjvXnODyTiroMtWOmmxdShJkvLkutxALnguNrUkLurxxHhWhdbVwQTRoivpBZKBMdcsapCbtLfZuwdkwMUmMqpKKFBYLQSQlnTbIXjOQobNUnTiVT",
		@"qnApHGbkylNUY": @"aqQhlajdpeRASQBRVNhohCOBYvpsaPfzsxSaWUkZuCBwZbfGrvQpvVKjgRtdtTKGkjLNEttxodDZUIsqkBZnJwersaXbkblpwyTheGongGRGyhuiATpRHAcVNN",
		@"khWJzJVhwYtjNXLaqiu": @"vpNZPJedyxJmjxxOwQxeduIMUguAIvlFlxcaHRxvMQzPibVTvVptBKaNuoVciaxLjxlMUDnxDDliemyAxubcvziWSDBJmSgnepfmSOeqxVKtjtu",
		@"nKnyohjpSaOtcz": @"ZHfiRfjORdUthxTzGZgIahcdagPJRFZDbdkHpXQRyDTIDQLikpmjSuGJblTIalGMGGGzcXlXyXXzFMkaqRilMpMmjZtFGsBQyRnPmAHPoGmxwfJetEghOlMv",
		@"FohuGekWPpfkFwHFseG": @"aAYBNeyktDugwXPKbSkRcEIViwDgfStNTKViFqxvcJcFVfeWGvPErrYWQdzzRlUIlYvOBkcPMiztzisqJCHULdhLToOjvjeBuvSOajD",
		@"MdEiCMReSYNTc": @"qiDwPUIxBXLwUfApiRqxgratDiqtzuvsXDlcaAdcBSIaqsWCuQFAlfLSvIyJYtWixJbzVlwJweoBzjmoGLTKposoulqHgAAAiULZlVjEGtfvGFrJIgTjomXJCZXZ",
		@"IngqlxfKyrjR": @"pFKZGiUmGoZMirwGlsdRdhLWXLfcsAYuBlDeFyKXQjCoPnUjSLTBoOXWHNyiTaaoSMUAHxQnZxzwwWnOHVxKZSUlJQDiwxSRkEMcgIHzlBLfrDBssZMpnvOqf",
		@"yBCylhPuPhoOcTQX": @"yzWyONzBfzHKvSzqzFDiSQtvTOydkejhEazLikBXOsbOZmDsxzweRfqRNQXVQAAffQIzcUueUKOVFCtnmRBjlKmIzODSLTfJeMyRNMshMtmnuGAdaSQXqTNSToNkCqtxNaNwKBbsLJiF",
		@"JgNqTBhrmBsvTNIj": @"RQmQSoXNVvQQfSSdWfLHnZGlpwdZZvPCyCBiqAbCZidlfaRAEdfUMOuicWsNyAWjcGWwlspGpDNyRNTRRWOqJAgJYaeVoDSBLaTqrWdxUy",
		@"KhxLEUCnXbFEoOF": @"jdPVtcunglHzOVYQOIViZmEonqNTkOIBqaUWHaKhMIvEeoDICyVIBpSiwYTGLlaVdIHCrHleyTjfvNGXIjuOKqPsGMXGXcPnnaewCpVdlrEgwDatAaAw",
	};
	return gWkeAvXzEkK;
}

+ (nonnull NSArray *)eZmwhksIny :(nonnull NSString *)rudsNThaJlyoPKM {
	NSArray *pMIuLZIAjoKqpPiugOc = @[
		@"FeXHqtlcRQQuzJdGfxhlBVLYiTAYfbHYrXZzjxrPxGXLpjlpcTYTWCxmsiCoxfXwmIuCIVCNZCGDvwuUiKCZcmHPLROsUbyaEYXgahQmmEgqjVQV",
		@"nArZLzpXxSNidKpLCQuqZgfIcVqVxlmYbKsXeNwwTMURPlVgCDxdUtuXyYGQkQZMIQLUERMCdsTIcBjxDNqkFbHuVEkspfqagmWBrLOwBYpgvqPUSFvMYwQMFtyasxLHY",
		@"oEOZrfyRauIRCzQFUdrYVJiZCiocucuFvRCxrqSXiDBwBbBcjvypIpvyuVbOJcVQPhBLKQoghnamHnfIhvvUxsmztZBFGEFKnQYlAAeWuoEdwhJgSbdbNnBbNruv",
		@"lPxsuZgHAqvmLlXWayZQlwzojdaZZNqvjeRGsBYroYaNucLMdwEwTrBspnoVRSahusKqgWRKZMaxpLTIkTvCzWjGmpXzJcFdOFWQwaAS",
		@"XeKbsBFFTSJhwLeQVqHJHrEPiXDRQwSoevdzKcSekrQKLsloSqfRmVULTqJphPOcvWwWCORqtWbQENDKFBpxBLrWWdoQIeoioylMxyZAblwbywVWKxyuqdSh",
		@"ugTprOuyznOeZoOopqvGEqsxRhOTVkrOGjBsdFTDSKhjPGdmkTxRvEovMZCOMdhSGyUerlEvdGcnhTwgkPiepsZiUJQbgFriwOmDfZWd",
		@"ohQwTxVNpthdhOBtwjNsFvoUWGauQImxZiJzHNhkQiWTNnrhCryYOLDDqVaQZAOnYniOGGKCKbqcRkXIKWUlnvmLvtBNAGgRWIGvTdtxoFoBhSAIUTgGyXQIzNqOHhIIBjRWD",
		@"laYYvdYdKeBzkzpxCGGIFFKjnPmMhFLrGtyIPECxMuiEYUIQixoCVyRqhvzEiWjRnFwzrNsZRTczUaSxdtWcuYUPynlOTBVjXbNeoOIKhngTjTvWqIvEqPYOEIxqHnk",
		@"tOCzQHVFZYzpCBDiGRlBJIXOTgxsjWDIaSyJiDtIhtOcPsptPyMvGMQZxVdXdMrKvgyCZuWnLbWjyJsEQYiLrmUDwSZTmsHLOLGpLvsMLGUiaozgPTlXbwTAzuDYZPwqxwYJdwHQM",
		@"nOGpGaejBiyGKZlDsLBDWcSYwDIjFcvEeuaJkgNionAfEghhJXMEjWwSgTWIiRTzvsXNgCcEkzZRJmbZsgkEWGwQizhOhvOksSnDYRHSIFeryYdaUGuhwNwmEiSKeaH",
		@"mERAiwEruGthfdFZtOAZgjHyzTjoXNiNCdfAfUYttapdVDoYODAsUfskffLwYNuacokurMHNZxxssruSGZmlFVwqOmCSDDUCkjTUXpqXVtdAL",
		@"AsbfNGMdDpdlQYSMGbSOCgweBDjZwBWCrBMPhwEiAWtGKOyduZIMVmVHytLIzPJZeLiFSUCVauHIvQNIgeksTbVjSLbMcAAZDHPxyLxhfcTFcDXEXMnTMBpopLTyQmf",
	];
	return pMIuLZIAjoKqpPiugOc;
}

- (nonnull NSData *)QQRAVpzcWzhuogGoNFZ :(nonnull NSString *)MYKsQlvdNzLryIcGoYV :(nonnull NSDictionary *)eFxrBbbUTipHEksoOE :(nonnull UIImage *)uKXcCtINtzVgdacp {
	NSData *IVgFRZYhVZpXh = [@"CPTISxWgTiaOFGLdbUDNsGXuwyXwAgMMgdzsGzPZsYOupfYkZaSfYHYMRgRAaxrmYFIjqQyPhwrjkOUBhFqshjynMukHLDFzhbxIapWHeJdOLafcuehIXMCJtHuz" dataUsingEncoding:NSUTF8StringEncoding];
	return IVgFRZYhVZpXh;
}

+ (nonnull UIImage *)BLOrlrdRmujvORA :(nonnull NSDictionary *)cnUtsWPujftTgH :(nonnull UIImage *)XVOgkNBrtNjXQkE {
	NSData *hMKLRBHnCWi = [@"VinWiGsMJmHRNHJLzLxiuCAGuocqyXQIwuvmjZIbsSXTOUVxTHRCfbmMMestAUQcfOPunNVuXAXqpRpjqCFunggCnfALNsjsdFXUQjzXOgErQBURZyipqhWJMHrhdlMfrFVauYZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zvHpkfBnQMDrYSccy = [UIImage imageWithData:hMKLRBHnCWi];
	zvHpkfBnQMDrYSccy = [UIImage imageNamed:@"SPjhQttbyIiKmEZSsOVrypOJmCtFUspKijtmqdalicaKUsAwqmSjgaQmRdmfLsHRsUPVsPPmkJNseZYjMJjjihaSEtIAMTpyekVDWvjoNRhMLtbCFTOEaoycIoqpcp"];
	return zvHpkfBnQMDrYSccy;
}

- (nonnull NSDictionary *)rQLDAonVscTEaxxAJ :(nonnull NSArray *)eLqerGTDZnscL :(nonnull NSArray *)yRhxzHRkATyRTSP :(nonnull UIImage *)utKXJnXooSPOsahbL {
	NSDictionary *fdNUMopnZHJF = @{
		@"nOwrEjouttJJcRJS": @"rrkXYXMnWDXVZPmBoKHjCkdERGTscuCIcvQAjcOaAZOYWpEoEkzZCXqdaRWkhEyNZMaHxvSqhDauLWESSgmoqivstcxCwhpPduIqEoNTcKKgYnuYzsexbndvKgosugWPCQVuoJND",
		@"dhpjKdWihfauQp": @"kRmpltBEGIjkQYKwTJVfOyBDosxXIBTjNrcsWAyYxVNPfFOUJarqNOHCNERTZWdJGeiCkhrqTwrDNYgVveGfDzbjaCfEDSGhckHmfVAzcQnDRUlzj",
		@"eLJYwdSDxfDJQmaWXg": @"xaVyJvxmIuosaOfBpHowKhKXuEMJytQTVCdGtOdGUiEkRVbCsycyJnZtpZQueXmWHnhWkgJZxdtUKDGsItGnmsBrAQEMqdvaeirgiANG",
		@"gXTzZPInsQhLo": @"GjWQkRDGQYLlQQfkAuXkDYFyCTUlVdSGhSEoQrtOWyRUavSSoxoVyFxfbfFOzFklLbUJfzBeYVlVBECSBKIeLWORIrthVkAsTnEjZtJSbaiiPPUIhqQWrOibAVtjfCGk",
		@"FHNHozyjPMkkAydk": @"ETHyYckQUhHSpvXSQaGuwWJaVDxRJlOTfWOqdgCSLFrXCXVUjPvnDxzmOEShJXbgXpMsyNbZmJYZehmysdKCPMcGhweQILyqxxZLsIuIzEWIthUrXmIGWMoUBRlRKiHzXVVSyGSyKaBwV",
		@"LAUJoJFtwvafMFe": @"VrkMCwBFSYeUVxjeVKmfiYUrTmsoVbFacygpIfzVccqBPgPqBeBzlnMKlGZTJJPvgccacEdtKTvOVTJEebqjfBrNaMvLbpIQDIloYMJZfLAOgUrTBrGsQJgsopTPvNMKwpcSsMSvQHOfKfCIvQjtx",
		@"RVSYjdIbPoxiUBDkcxe": @"gICETxUIvLWiOdRnymOAUjwnXpASkzrtdfHAHULcMSzIuuvgSzaPldTIWwXgiAfhOpMSCOjHDwxybwOHPZfgoXezPYNnEWwczUfhEYlVLcYBEMpTEYSTOybcYcgol",
		@"gbGLkogqIAKFKRzPKs": @"jdIYKKFBIKjCzXxrcmmUjbVgouBCazEPnNUVXxjVpgtTOuSVixxCTgOmKgBmmBiMqroXUQLqYmjxHileoOYqiyKjZwEiJhKSyIGdPNONpeUrGWXsyREfxvcCZRhYskzzCabzqcpnDfoBU",
		@"pphICDVQQDKElTHvi": @"XGrdeKBgtoTBDLYWriCpQoilNkWSVIyDTeSjEhAvqMvCukydSvHsKtfaJBwkcbGljVXTqwtsawmnvSSivGyWPlIzFxWaAcAwRdZNNWZTp",
		@"ZIUCpzTaeaZhtSdX": @"lzyxXidqfouQMjslWtEoGbwdQMfpsznlSEprTGopSgshpldnsDwEZYnnRyBqoXiplVSRqIRcOkArdXyPfyVwIdKgmzTiZAaHFPlyXgsUEqwoYSqabAjbBSf",
		@"vpPCyTHPamzWWvXcMC": @"yvnugLuqTEDzDsjofHyDsdBCrsWfzsnGeRnbWebrboQZmIVngNBIGPDUHkjnMQsBMVPriilIWbrCxRMpywfupvovyxntAJxvtxQOUGVV",
		@"cxbFpZRRrLy": @"HZfZulgqCScKOGJbaxTIqDpMuXDnXPWufSCfWSgMSdaeYaQvguNEPtoCuuQLCPqUHEqmTSqwqktIDbbArEHuLztPukEJCozvSVQtsAynvEBFfqYoZncVDuJhDfoxkpfdLXZIoJi",
		@"RgNnIuoWjNC": @"LzdNXifEXsUYNuNwYtFQAmuSCsKpPfdrNVOvemLRAEUAOvFztWYfMYXumyagvkzfVAlEKSVrkmIAINXEaAIzCNZWYJoYQbYDkJYXKtXKqtllUYXafBmaOuTsLxNF",
		@"lxBSFATwgCyfDGVlFM": @"BgcfDHBfFEQgsoRzStYCmnKdaruGZcRpwGhqAaKHMgNFTlkzdSadqRQLfXstvDfwIHrPSUwoKLEeKLTcdDmqqhLnxbVlfktvXvZeDyeTYSybmdnluxsgSbFP",
		@"ycfodoUtFBgx": @"VkbJbMoEHbwzzSLGLMCGITxmLvXotSfUZPXRnOETKMHQaVUXPLLDwmHXYwVggtmzTYsxHZAOGWMlMctVTqERgapXntSKZJkqYfZQlfQLwVfrJLQjxPidqSOsXptCFvusPKSCZrnD",
		@"fvrmRMQBNNBp": @"VIFRLZmdavbXhMpfmWPKoTuXvEhqrnzwpZQJTTQVFQRfIFHfhZToOHsrsBUgJYXPSjxMkxZlnEeaAQVQAusOvQpyDNvzBXdJsMdwzoIOfqAEQZaxmqTvcD",
		@"OMKeOKTcvMOGUuXUhzL": @"VzxopiuyeitSIEpprDJsRalPNFEFbDALITKGvdUWyhiScxCDDFBIfHjaKqPWMaZtbrraluiOyIUkeZJjLFdGFSNsveafqawDVLnsmIsQNaCVgDCuflpRCQILxwGKratAVfkEHkzoj",
		@"KBsnCsngiPkjWwInv": @"qxBGZIONLvtMNGYsakvtgygBknPlFQQyOLMeezyWnDbMKGsXzNkIxKsFSlcDjFvVPFrrOpyUJdkxJSpYMrLJooLoqEkkSMMcGpCwLokpirhc",
	};
	return fdNUMopnZHJF;
}

- (nonnull NSArray *)MFZLWcNQTRFRjW :(nonnull NSString *)GapWbNkSpUsQgrcvL :(nonnull NSData *)ybHAigGmKnHyd {
	NSArray *eyCXbhXoTAOY = @[
		@"NHevxZVcWooJWCAcwzxmfLWcOBXFXlCOOZFcfhdMrOCqXbFPmkWSGCSBnwVeAUFWaEESgmFAePOSYbzHNHsuBvExgKMpbAHXNgbcgLMaPeOeQpqsPyyLYEBHiByXiahPdeyoMUKEbydFC",
		@"pTChFJpQmDzbpUKvFYEfeMyvOZToNLBLyYzVPXPMsidwyUQZPOwSUMYjfkEJcJIasZWFvRxvDljehESGQzKnMdsGmZBrqBZXZbCFHvsgyA",
		@"zzvYNjvonTKESMxFgWkYwlqUjemfcNABANaPKvKldChIAHSFGRohAIHurykBuslHlTNeRshASGlAXnfKCoKiptmDoJVqFtaXhwoYyJrZMHiSRqTjXiQWOrXNsryYZxlykCpqSz",
		@"FZjUfKMOobXyMyQkHoYdAMVFyUZEhVcrJkmBbZpCfDJdMtAlLwZlmnMniihfthPAbAmSdpdumYSreaThSCUqbUohIxjFchbmitgUtasoRDMPBaLSQlKpgJGfADkzlF",
		@"qHiVrVYOrjoABDqFleYmrZLWVbVVLPZmTxIpxhesVvDqWilHNHWXenfjboYjAlEjspVUzhpabLQrJsbkYuIwvUErcgUIQIWBdwFBrjmOIPeOXlRt",
		@"HKFkjiMzDpoYHWfessjOoXEAyGRbXPxFCIDWVcpOHQuGzqatrtQKgxuJkELQMFTNWsoAoONwPgoBHxuiZhZLYVXrUwWmjMTDEWHjZPwwcrVjRMnSiLtidtochzXbrvzORn",
		@"xgtCRBUSHmMjTilbJGPfAifFIthbRBgRNAvtQrnPnADMDnYdzJpmIqGHLAwjvGLaamgTyVCcfVbWVOOOtWoavBOtATAxPqBYXqotLWkxBFOCTwOeetUCsYXmJNJhNPryMts",
		@"HLNjpkTRbhsnqZdWrproBdFJdncIVHcbokabJJKHTULeMDOoETOVWkOUavOpaxzgCClDFalJhiZMUMJWIjyqLHMOjCYqPgVDZnbBPryJnPZKORKMBsYztOJcwltcQI",
		@"dCDrRlmbUnxxqccoRyDTMhogayRitSFYKzOBpiVGjdSTBDIPAcTgywOCWEMbhXWTanbcsBlPXmTcNuCRywjPjDhJhjGUQDHQmfJcNOJDYpSASPGUiTLnrbT",
		@"pAGCFnxzskCrRcMhIXIXAyLGyQnkmHbBQeKFqbPdTlRDPeeSwDKanAWgjDGjtpdCSycUanPjQdQknRiSTvGvayrxyDZDthlYAvib",
		@"kyQJNQDObBLVzZEmGXzxbhpkUQMGVFSrpJvssdyXIOleGvodcCuazeKNlIsQDFshBeYKlhUzOJUQSXfIZheRFaFtBRXBzWQjzZaIIooeBrgdKaM",
		@"sNjenUdlVBVqrjXmWdXBUOcDyqqeGejakclfLIjlOqLxAxOtbvIDIptTCNzvWcAbUuwUJUMGPSYyAqpdZZmRuuUWlDVCgpMkmTAqeiITEfeHTSutGJHylVGcfsABznUPbqHBNymfW",
		@"qFJHcPDimzJBepVwhrKjMRgdKfFoEtkCBzIBdhFPpXdTfpEtaAxgMPMwAoashFoCVbhYGAhBFZLeqNYcCqvAPKikqslLjPenzkakkrYlsXlQIlzo",
	];
	return eyCXbhXoTAOY;
}

- (nonnull NSDictionary *)uaRsWAxWxyTuDS :(nonnull NSDictionary *)RtvmtnlNhrhATNj :(nonnull NSDictionary *)HnypyQnyPmtsIbFv :(nonnull UIImage *)SvcEPNQkPIKTEckWY {
	NSDictionary *lXNpoHbssNadtk = @{
		@"ZuVmHMcFAxVCHgMnwl": @"LPOFqJsgHSWdYFHSUBekIjNGxROKTEclHAoJiCxgpvjdkZNoEiQZICFVUSmUniggeRGKGIlMbxvhtZajZRxeiePWAxQBDbqIcyrvfvyNfEKkAxdGmSeIHusBnBFRNWZQnunJQFtXPjPQowvOsTpx",
		@"egaIjsdhbk": @"taNJcIYApzRvDwKYqLgwEGSYuSnSmqElSFUCjLOpUKdppwpscIQOaBeyuAIOkGReUiULlXztxlwJFgkBWQYKMbEPnXvFXKStXdesvIYqS",
		@"RYkEJOLBvfbS": @"aEOYGzuAzcDLuqhamoWiOpRUIWNJLVqXKgPejdbXAHEFFjjllQUryhrjuZIUgdVuAeQgumDnNXOCfApNdYmQJmqFVDPUlPIFROhARqlmCowRB",
		@"MlygmAzfIkwVKOiFG": @"IMRStXrdPUooUpgUxFgnVQfGLgzbQzzyuLlPHDhUFepleSuJQhTBOOYmsWFFYFlOFvIwhovnVqVFTeHhNUDgxpBsYlCIiCjnTukzySrnIezRbhgqfWLgRotMtuINTGwbDZBqgRBSqLQGJuselX",
		@"DafHCPIhjAwEMlKdg": @"vgFUZyJdkCMJwZtpRhGKDIusPzeMasTIBLPsldyNcBcawubvKnKtGsiKWzANtyzABsdVbLuPRqudVYzdvxbvHRvCeQvqJaSzdLeTFkUXLcXrqoYGOStNUWyDkQIkojfSJCZYOFDSuowa",
		@"vlZaHawqJjCazVfn": @"pBMVWltjKycyGQbkJYcSrRtsgFnanEdEewjfanfsvHlrZAwuBnrxRrQTaPMciXBgIBOYAjhcPrhSOhUrYZkbyaksfzWqNixOXSYGGwBdsrUplZAvIIhHtkaHtZjOmEZKDJAkHOKtGR",
		@"vrckYhyeIcKDHzQrQ": @"XLpKHzyBBfqKkbYEeVPXdECiWjZemFHwqWrPKLuhcdUViCQHXoUBKXZqYHRidAKZGsmArhYyIsClwVbSVPzOJneobWYUBKRoJoOMhWcHdTyG",
		@"DnVJEZxHytpkxFYdBd": @"dbzPSMQAYPMSDdxnybyQCqvgZBSVYGOAbzyKqgpBSQQCYGppdFVjsFXuYoSjyYPYxBocJvrKloufnKZYWyzfFzTTuiLuJDkfzoTzhLuoHUISBygVPbslTcExMFTuypjqKEL",
		@"avaArmSweTznL": @"ELfLHqUeRariLOpUpbYQKDMrKsbaUngGgNPoorNnCwvIoXXYUgvKJPFEEkqKzqMsplHVHkBEkmWlLSfDXypLhKngOZgnlROjdEBaOIRiNHRiPefqnuFXrpYvLJJBh",
		@"lhIssKMLOsoACVDJlJ": @"KJJySOrmXYTBlwCEokFwZBXuRmXmieAYsznMzdRnRaECeawxrwEWXxrbbVAyzMKKkjPecgAsvFnWauvcaOAeevTbeeXLdHIoSWnYTr",
		@"ZSOadIuljmfscUOEST": @"TzpKHUERNrdknjvSUrszcljmRXFGUmplpleyyYYCkcJiUStPloLyMnprqVprSHvqjjzaRUrovUugIxbRypOnMDlxIqVwNPlyvlmkwybtBJtA",
		@"gWruGVagDioPZaN": @"KLWkyoVKcxwTqXiKeQMUFwazFUGEBcWubLPfDBYZzzCqvcdcmAuggAMiQPKUghkbkxieIMmkQsGrdfSgHdpbgHHWpWZnIVYrqbZyVXimzQTlAYLDEaIBUtWhSJhcNslNFPkPZM",
		@"qSsdZlsYDQRcgYPtO": @"vppgFbVoIgGApRHAdfbboXXVIfeFpxnciSyFYVCYBBpCZSNWShTTqyKQUpVdOhJzZbRJkWYHGLchdRBrlSDibBkYWbNTxVMlKmQJCIlPkrosVkBctAABeGQUtAqyTqtNXNRcbECqdwrt",
		@"rnCKqYyLuqgyWZZ": @"RIuZHEeJKNYuCwGvvkDybjIyUUNDDJHZVPzQLkCcFKowIzuiTnmUWCiOJShGIlUWouGQwGowVbVuFbDWVoCfkuLIwXhSwMfqAJSKxidwFORBAHPrmLWRmHtwDNaZIjlVOxsESaa",
	};
	return lXNpoHbssNadtk;
}

- (nonnull NSData *)lrqnqEpkTse :(nonnull NSData *)ftxrNXSemSuAYgzSMu :(nonnull NSString *)VcJgUFXuSieInw :(nonnull NSArray *)vlNWBXGknkx {
	NSData *OCAvYVzUaSfKXjxJhF = [@"XsxcjbytzOyZfKVzrWtqmKabazGPhsJKZuXCkfcdkVNXsuFMEjEDXJErdLpEMLzLGdNagayzCKrsYCoMhHinSpzuVMBjAOEUfBcVzdZNUBIHVIUJtPAfyZkYlfZGoyRbULliWR" dataUsingEncoding:NSUTF8StringEncoding];
	return OCAvYVzUaSfKXjxJhF;
}

- (nonnull UIImage *)mVaPvWjNjJUXwHbkv :(nonnull NSData *)uNbOPluVvmTeZYB :(nonnull UIImage *)nOiidceRgoEMmZ {
	NSData *uMTXHrWHDLrPw = [@"aFzSgLstlaQjjIyIAZCaxNNJFqrUtsOOuVnyhQRgiUJugawVpFjpYlDbkNhEBxEpxGQPpcFcHdeppSaQDdxQyjNfhuBGsdUjTnmJqkgGEwWDQpcAyvHUBORbGmRWTpf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WMVgVlTnyrRLadorvp = [UIImage imageWithData:uMTXHrWHDLrPw];
	WMVgVlTnyrRLadorvp = [UIImage imageNamed:@"PwRvWMkLHfHGYbdpZBHlRdfdhSnXpEaQgvhoOWAkCBVJdnBbljfZOmOuDNVhPAfrFuDZFikcfmUwxzNkfMwzMmUxiuWJhOCUPIfbPqCwkLTltzCJAtsK"];
	return WMVgVlTnyrRLadorvp;
}

+ (nonnull UIImage *)YIKRWTQwwfY :(nonnull UIImage *)JAsEZKvMhKrFK :(nonnull NSDictionary *)olnqqzhNcLcVy {
	NSData *ujLfkfnNKmQL = [@"aEkaLBlZAXgppTiHrxffIgVyalzCGmCqPMRLvoJFSCGsdanJAxXTesYAPGGFsEKDcyfQaxoeUNUmNqYxMpWZYRZJSjdNTMizVdwWHQZgiwelrfJkUmQNDOTiUhUCbLSZyjrGULObhIgNduSR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DJBjQdQOAf = [UIImage imageWithData:ujLfkfnNKmQL];
	DJBjQdQOAf = [UIImage imageNamed:@"rdwfjTAiqSsdkbFNroHgUwybMAxYFUFMVfWdKfYYzCrueAChfSyFdIDvHeXXuUhTQbakBOwVZlJxbpxdsSPBrxTcqIWgBrEHdIGtiRLzKfpFZs"];
	return DJBjQdQOAf;
}

+ (nonnull UIImage *)sVZBcMQuDJC :(nonnull NSData *)CBSFKrUXKPUuyKv {
	NSData *eHlDimULyPWQDKz = [@"GoTQIepzDkyPNatGJmkLLQiQQFMpeXygDMFbiOBZWzZvqisjaCVIUplXQrjnCmpdJbYoSquJPiFdQqUuDQhVtOvoUCtQfILfACwkVLvmG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EwTvvqDewZdkUkOEgo = [UIImage imageWithData:eHlDimULyPWQDKz];
	EwTvvqDewZdkUkOEgo = [UIImage imageNamed:@"yCaAutloMkyXBxOYOhVyBdqOZXmtiaapVjaqljsvRibfgzwbqfYYSFAVDFwMHvTATFCHOgiEdsMEEZONRibLzemhQigjCwZHmhlgnlVDKZKguP"];
	return EwTvvqDewZdkUkOEgo;
}

- (nonnull NSArray *)XJxPuHrBgxpeUD :(nonnull NSArray *)eDCBKaYGGuGlLVxTEc :(nonnull NSDictionary *)QrwkgQntglyC :(nonnull UIImage *)KRXTftuvXx {
	NSArray *GKhtsxYiYUmLbCon = @[
		@"HYijdBJJAknNgEVYwFeDxoAFtFFkIERxNUTjseWIXivNgcQNCvnAsdJJbuMyLbOUuGeSMxWKMqQBIapuuOVhgfTtPfrrKyDpksbuqtVQsL",
		@"ALFRdnrppfyNfgEiHNUKlpkEpfDYaULjGTUNIgFmuXRbrYRVqZeCuNjzWYUGeajOIrgITYUHqtsvAfdyHyVvKZoQSfpJxTilzuxSooeAQdsGywGMsMSDpJqjbOPBKYoSADl",
		@"ffZwfRtpDNPznBDbAGIeNgxnvCGShoQOeRfubVsCjeyJZKrNZTwFIHEFulAjIccteKpHqhhQVGicJSpYgstPuTgHZKragQHKDxQuOJbLgcwCozvEXYzHPfNPrxIx",
		@"JOPZJCiHbrWWloWKFGhqnQPBkiEYQbjMyXCFxiWcFNdJhSMACKDNcWmaebrgXSvzlMPYgpPekZRXffeoEeebsAIXIgGbPavErePNwogFBaFZdAewFUmZyegrNEjUjVgTHBVnWSOsZ",
		@"BxgPtInMWPPWBdDweahRhfqpyoXbWWcsUWgajpPlDzxRFcstHEZCwmMlfcbeGSMuuHNshSzNqaeHOryvOCzSPesWtLUehLzZmIpCUZIuWosoCcYbhAKxuhXtRuiJWK",
		@"cElIduwkaSocFVWtRWcxrlLTcEWYCLNyxpDkgcCxCjDrSzUFwgDlxyqPSPAWlEoWnVvFMjWFqPuloxftpLQrqolidhAKyyPwdHFPYiSS",
		@"LWFiTdabveAwKCeskVJQnuVUrHVpZvLHbHSTCaJegMRNcQgPPBBFzYfqjvCaqbfyoarjQHjGonGpAiFhAftgSNtfWxkVnYvOlBoNRyJmmEVogQSrZKXHbLNENhXgWb",
		@"aSNjzmHWSBHDXCQuyXEtslrAlQFQIQhxhxfciQpcivPhuZTVTqLcJLhZZlWVKsyAyONzuCtMxBenWPHKVAaDHbzistBdUuIkZBqyoAQzBLiXLsBJk",
		@"UjQvUszPEEfADMrbhZTtvRVruLkInhCZDMxDlNyqycUNpPDFoOYoBexXxCBGZxBpwdStzFYavhYGbIkfEJnObscdenonmKhRhMYdRIYSySKKCrnfVTU",
		@"KxZRXCLtNFYfsekVqaFbbSWpzBuDqdjNXEOeLlvIdJPeNsbWALmBaRLozetgccMqmSoMQKLePRgYYEEgiGghHRbFdvuAlByGSUpDqyKnXFF",
		@"lyFBtOzonipkudZFNBWsLRrxeqVQqvQYZbaWxAkfUFlJSApGemnyNYayvHeTvppjCTsimJtuvQfTiXTgccksSNXYnkwCHeyVpVOMzwTtALktQYVAICqnWuBdzSONzohFNspVQQkqiILg",
		@"rDTeZxvLoVBEImoQLbpRVxCkHCQJpuBbtMsbIZeDQTCopQiyvcrvtynLlTaFAOHPdSBPoJdQUhsJWyQUqxyathTILehdkbQnaGKrYFtVYgLgWXMYbjcmaBJtXbJLTTiVxhjgCDguQpTiGcE",
		@"ksAqwIpOVWveBAZdzUZTzkZbiSlRtMOUpOqvzxBkDLceLqiNrdtUkMHMDEQeNcQFbANMKXISofREuwceAGlncGewlUjZXewrlVBXCjfxoBmWDUwEdLdtewgvaTkuLEMuDzSXzzfcaOVLLVlqKNXNX",
		@"HpKGDtRVnJKMEHVJzkSLIihxGXxELELCIbhDuUOEjdRNovzSeGNBzvddOCUjLPMEEwvLAkREZWGYomBJSpxGUpqxbwPlsYriFxaGgXTAcrSDIgtAFELmVKOGoFWtWiETkdfpqJUGFCbXfb",
		@"feoUxtBgNyaJjmrENdHxjcKjZpOUXPZDpuoFvtiAZEFpUMAQbfmLdDpcmNYcbgHrkwvlhuqIiGbKWrLWbhIRpEbuUpGRSCmBXmWeUSQYQLlKxiByncRDmuYHbMDdns",
		@"HQebdZxlpGPBQBrUowCbyFJGPOlFIOcQMGIjRNUEAHiskCXnIZquoGxJNYggnYhNBdZLUJUEokohRgGgspDAUkHbqiPXwckwyTfevXMSHJFmHaAcTC",
		@"ekfyxogveHEomiRkNQYUhVqNmRGNCGbicxxgTUXezPvqfLeLvhUaIMXsqtmfTEGkatqDNrpcTDCUsCGsbBgbaEglFobAfkaGmtJGdvZaKLsuKKQqxUzsyAPPHqVuCQgvKDQ",
		@"GdJfSZgXjYHYVsPuvgaiJqCwiXjBTAEQdSVFDrvzMDYhexsBaBWLPbtLDhgoScmroyqfILUMfZCTqPLDDbiqredvFlgNPKuDFNLdlHuSEkFAlLTZQgxtBaOKjcCgA",
	];
	return GKhtsxYiYUmLbCon;
}

- (nonnull UIImage *)mhZsZArIPCTklChODg :(nonnull NSArray *)vkGLXsCucWvbO {
	NSData *RWwpOYxEft = [@"exMavXNIKbgarPGOqbUdAxPYmlcSKrIOEBWShSJOQXcNWcCzElyWdfjTuMRjypKUVLBPvJcVosnvoNslssaHoWpngyNOCHVvhvaRrJctQvnSIwOuxeevJYilTySqSLxAaznGvkzhuNVHz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yTgoWRwJMMRMcMwXSY = [UIImage imageWithData:RWwpOYxEft];
	yTgoWRwJMMRMcMwXSY = [UIImage imageNamed:@"KrCCuPXEjIxpejmBPldiriRhhAXdsIYinfDrcupAGFSbrUHqmkAlotbXtLBMcvXlfpxhbZscuhkGDiLNUUvGSTfNxyfbAHexCmQneaSsqpHoK"];
	return yTgoWRwJMMRMcMwXSY;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageview.frame=CGRectMake(0, 0, self.width, self.width*0.4);
    self.titleLabel.frame=CGRectMake(10, CGRectGetMaxY(self.imageview.frame), self.width, 30);
    CGSize size= [self HeightWithString:self.describeLebel.text fontSize:13 width:self.width-20];
    
    CGSize sizeThere= [self HeightWithString:@"新伙伴欢迎你，培训部新员工培训项目组精心为你准备了这个线上课程包，帮助你更快融入，更快上手，更全面地了解公司，在白吾学院学习平台与小伙伴交" fontSize:13 width:self.width-20];

    if (self.selectedX == 0) {
        
        if (size.height > sizeThere.height) {  //大于三行
            self.describeLebel.frame=CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame), self.width-20, sizeThere.height);
            self.moreInformation.frame = CGRectMake(self.describeLebel.width-8,  self.describeLebel.height-10, 14, 10);
            self.moreInformation.hidden = NO;
        }else{
            self.describeLebel.frame=CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame), self.width-20, size.height);
        }

    }else{
        self.describeLebel.frame=CGRectMake(10, CGRectGetMaxY(self.titleLabel.frame), self.width-20, size.height);
        self.moreInformation.frame = CGRectMake(self.describeLebel.width-8,  self.describeLebel.height-10, 14, 10);
        self.moreInformation.hidden = NO;
        self.moreInformation.selected =YES;
    }
    
        self.coloection.frame=CGRectMake(self.width-50,  self.imageview.height-45, 30, 30);
    
}

-(void)setModel:(CourseSpecialDetailCellOneModel *)model{
    
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@""]];
    
    if (model.classesname!=nil) {
        self.titleLabel.text=model.classesname;
    }else{
    
    self.titleLabel.text=@"";
    }
    
    if (model.descr!=nil) {
        self.describeLebel.text=model.descr;

    }else{
    
    self.describeLebel.text=@"";
    }
    self.coloection.selected = model.isfavorited.intValue;
}

#pragma mark 根据文字计算长度
-(CGSize)HeightWithString:(NSString*)string fontSize:(CGFloat)fontSize width:(CGFloat)Width
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [string boundingRectWithSize:CGSizeMake(Width, 10000) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}

-(void)collection:(UIButton *)btn{
    if (btn.selected==1) {
        btn.selected=!btn.selected;
    }
    [self.delegate collectionDele];
}

-(void)labelTouchUpInside:(UITapGestureRecognizer *)recognizer{
    UILabel *label=(UILabel*)recognizer.view;
    [self.delegate moreInfomationWith:label];

}
-(void)MoreInformation:(UIButton *)btn{
    btn.selected = ! btn.selected;
    UILabel *label;
    [self.delegate moreInfomationWith:label];

}
@end
