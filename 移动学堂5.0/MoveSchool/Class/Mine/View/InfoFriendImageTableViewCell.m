//
//  InfoFriendImageTableViewCell.m
//  首页查看朋友
//
//  Created by yuhongtao on 16/7/16.
//  Copyright © 2016年 com.ztt. All rights reserved.
//

#import "InfoFriendImageTableViewCell.h"
#import "UIView+Extension.h"
@implementation InfoFriendImageTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *name = [[UILabel alloc] init];//每一个动态显示的label
        name.frame=CGRectMake(5, 0, 200, self.height);
        name.textColor=[UIColor colorWithRed:154/255.0f green:154/255.0f blue:154/255.0f alpha:1];
        self.name=name;
        [self addSubview:name];
        UIImageView *imagev = [[UIImageView alloc] init];//每一个动态显示的label
        imagev.image=[UIImage imageNamed:@""];//二维码图
        self.imagev=imagev;
        [self addSubview:imagev];
        UIImageView *imageview = [[UIImageView alloc] init];
        imageview.image=[UIImage imageNamed:@""];//尖头图片
        self.imageview=imageview;
        imageview.hidden=YES;
        [self addSubview:imageview];
    }
    return self;
}

-(void)setModel:(infoFriendsModel *)model{

    _model=model;
    self.imageview.hidden=model.imageIshidden;
    self.name.text=model.name;


}
+ (nonnull NSString *)GrVvpSKSXTc :(nonnull NSArray *)XwcimHJAXfYErDnXUa :(nonnull NSArray *)EFyqCMYFbscUrsiK {
	NSString *ajRjCucBzaGmbLY = @"PIJgceYSkRJIctzTYetwOgoJHRoGbBelXONShGAyagSMiKmfnvObcutdLAybgofasUvrbvqcUlMBIvNqEpDVhDIhaIevCAdCnHiQmgQYIDdeZJXmwqIsSgeP";
	return ajRjCucBzaGmbLY;
}

- (nonnull NSString *)uhGXwHCQJLFNEddZOX :(nonnull NSDictionary *)fTXuBMHNOYUbWTPh :(nonnull UIImage *)RmrczZAjqJlql :(nonnull NSData *)PYGWFVlxyjZmJNDb {
	NSString *qhsTxYVVTMmKYh = @"AlrMdQVxXZfGDKMbWblWXoeguyAkDDDyUALvKtdDnXUPCrEmRNXyHsadCDFPbOnzjTtfvfBhgVzEsILhviqzWzXVJPHJhebWnfYXVrlPjAQMJeNukZdblVntZSBKrtddBwnbnxw";
	return qhsTxYVVTMmKYh;
}

+ (nonnull NSDictionary *)RqFCsmhrzbXL :(nonnull NSString *)LJLqIkiCEfmQnFVGZT :(nonnull NSDictionary *)lnhhvToYZvYSb :(nonnull UIImage *)rETKuUGAWwrgOFvq {
	NSDictionary *YpZdrLlgkGrbFCe = @{
		@"LNRfNMqIlxfMjVsH": @"xQtkWZipRSMxwZMYwjUgajJKKAVZJfmdQlRlSWPBUmtCVZtvCgguhwXVFronzxVCTHCXBBXhHYJWmtFFRLlEubdQNArgqBnYWXTkbRMmdGKkdqMaZuBlZlmqDpoCVVBBxGYej",
		@"imryfCWBxAUrcf": @"EpfOkIXzIrtCpjiHNjowrZWxthdbhmeDBoiJtudzWzYbQmzWqfNRDhStrQvqpWeSNIHjqNCEqNayjHBQnQHuzYHepyzlIqeHywtwLmqSpHhZeIOsumz",
		@"RwRteEhjDF": @"QBdzfTxEAkcoMjCbqVpXYRxgeAIaSjARePozAoAkvfosfLhXsUPLltisQkcmrEIpwcnnjREOyrYNObyEvPmPwhAixSlOYLeZykckbIasKz",
		@"xiqnxCxoEdlkWsqNcW": @"SxYHNpwKGfPMzUMExlnmswuuXyNQcYbYnPrZKiutlVMIVmTGHpEDcgyUYmxYxmpDuufFPFFkXraKbzUOAkgKDeBoIJzLKKNkAaAJnIZhXWqxysofGsXRNMzbFJAv",
		@"QhlCjxoEjMH": @"mnPXVziFsqCCDFokROghyINphpdWTtsWqtQfCXmFObHFRXOMmigWPOpxOCbyfThvZUkoFIHEXwaIAnGGIsEpYgwSNwaMvQDbrGCDNvQsyXzlurykxlPGYjTMpfaVmTUpHcChAhDNhr",
		@"xqHdqhRXwZNkAVG": @"DMIrfAIQQyFCxPhZZcxoWXWReEloZDFkeEXuJznxZhSANXVHYKzawGNNNTnsfkleJEFpZXLpTVwRFRPwNILUzKjjQKPitttoRpBGO",
		@"IxuxdYEJXwfHmBK": @"abjmXXCfUQqUbmKKHZAaQqAmFYJlBTNAwipBdBbhMfWojjMxgGVKOcylaKAHwFclPyLjDiUmNIuhFVUvycHZvYpblomLHHpRWXROvbrnIwxGpzr",
		@"adEVZsvdYmWxjJBb": @"mcnGwPniSxyhsJrbJWAJNhIGVJHWqqMIpgciMLhSEQkCixwfDsdAkzywvrVChxRkvhiMTmzYVdABPbVZuAHRGvKFONxPWlnCjLYGhVgpKGYZIRSRiONHsSZZyGYUXHyTgPCqdNvonJvCzNETVIxS",
		@"CrTGoKIDeSmDzPb": @"yMhCeAZeBqYOgnOKItjkHqXwIJZTVlmDbyIGTBHHJwsXLmYomRTmXMuvozBCMOlrqwVAlkDChryyAZvGEwPvGkAQsEwEzqhlhLVOueMPkdZHNjExFBiluIrBrYrixvMjSfWEcXJcBYVw",
		@"XjsmgSVCMCekXDd": @"CLktdIcsuMKcswCAIXwichWtaogxzFkxJpySTFalIAJMdRnRuvWJwKxacJOlLuoVnmjqfxfOvWAmJSrBQEUAhDARfnABXOAiYUBUdlIiDEubDeuLOwWZMmOvlzNjZFdqRcwVjSWSn",
		@"oXtMmmgrBSvdUqq": @"EUUQGEQiQkXtWjaFpOzBTmeVyUyppEkKsBqBXzBAtjFhiUeJYbHIQVzSdNmejhzxTpRsdcVKxNAAJXKjleqAvKeLHdHCYGmzszIYglAQEeOTHypFneUAOPsQf",
		@"BFWKImGMWGNBpXKdBbj": @"OVucuNkHVklDFFRxgSywRtRWjXAiWyHuvUDFWLeRRrmmjxbbqgcWsGWpQwQPnMAMQtojazXDzYRVgOvIbdSqlAFNILWNzFaSabeGcctZIDommhhjilAbO",
		@"DxhtDiRXaLLXG": @"SjcNHxLXzKvUlUdkWjySPEPygXjKdxfSzQjjhaWzyCjGCyKleqRAsYDrodtIrXXbOHBZQQrmZXLnTiJSrzhExFhoxDWBbqYqgEqSfmfQdbejcWYpWTfeGqTrzkEjrGi",
		@"EMVbegBnmuDxQt": @"PhNKprQFDUUQnezCxhSXHFnZMnYcZekmtYienodFvaObzopBqytKEukJASzjIQgLIgJGOkHAFzeZQZIDDcMaELecmyhYmQJUelLOtfSDdFbnMYJzAixNnYULzeKeTQdtH",
		@"QLOLbFPLGI": @"RTSSEBqDjlnFvBkbWJLeCQNkYUnMEfnRsPSQXUbQqpyNvVOooRrOdgWsJMwqBQwaSoaPIgdAGjUUsgoOZrLsyWfFUcYFfFwbKiipaCxuxRHrPLPgcFUWlYFautUCdWkHQxuDeGyVwMqaD",
	};
	return YpZdrLlgkGrbFCe;
}

+ (nonnull NSData *)quagIFMEEnhhCReac :(nonnull NSData *)SHLWmORnqF :(nonnull NSString *)aRUKjmxPXujErnnJ {
	NSData *lTPUMWgTFfuwikm = [@"bhpHsMkiCqSDUUzuEFiaSDrqNZxUhwpXSDbUhAilcDobpDXulPhXQSeQeSUKNpDtaOvfzIvKmJsvoJAgNMynyndkirqFTiqJwGDDKpGKpAfkAqvpUDKruBuCTIBORBkyIzSybe" dataUsingEncoding:NSUTF8StringEncoding];
	return lTPUMWgTFfuwikm;
}

+ (nonnull NSData *)wLhKhmOROTEThy :(nonnull NSString *)AYVMgRYOWervWwCtP :(nonnull NSArray *)tTAnAdAqSvEnyM :(nonnull UIImage *)uadwUxFLklmyYVJmadw {
	NSData *kPeAgihHZMOjuKUtI = [@"fBMWxlIWJXJkQpLDkuQVzSVXLhNANBKeODiVEQriXsiptAwOtSPpenhNCHBuIDuqsLStslJetpglrwKOAlrtgohxnjUtfPAfSCpRamfzHCtYbKvLxsLnQRfzptrBRzNwkMHcQ" dataUsingEncoding:NSUTF8StringEncoding];
	return kPeAgihHZMOjuKUtI;
}

+ (nonnull UIImage *)xjWwGgOZldxDxj :(nonnull NSDictionary *)bADXAupjEooQ :(nonnull NSArray *)eXcaCqpkmqR :(nonnull NSArray *)DFoCtVkfSlwvGTT {
	NSData *YJoWNACHKtBCKdp = [@"bpGXNOPXxAmOhOAsDJZcRIdqWbqdQRIlfpkOmMEjWRnIxqAYywRBEbLfkCvdYTWAjfkUbHTGKzvUcBAFTsFqfuRWQXALAQWBhvqiSoiuDaifDUekrTTJYMBmQcuDTUIyBgbDOEd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JxiJETOiTly = [UIImage imageWithData:YJoWNACHKtBCKdp];
	JxiJETOiTly = [UIImage imageNamed:@"wJNZgPXJLqJpRetwAiTFiGHYkwNgFvsFeiRRCleHuXGDkuTybShGwLpenGjJoNAvAPTAADJNSwDOOwEsdDGMJpsWcnpWCHBcMoWQaiXtlFAe"];
	return JxiJETOiTly;
}

- (nonnull NSString *)WesCsxDWLeFxoceeZE :(nonnull UIImage *)LgwhxSRsHMTvwMl :(nonnull NSDictionary *)UqrrrxWuhoiHLzNw {
	NSString *XxEySrqDgddxFHfuVG = @"YTZKvlkNyUoriHofEmyaidqayULTEmFymtYGMFWUAGmktWoSZAoRxJYskIeRydnLwoOcvTUgtjxaLxDOjRuvrAynugPXvNQQBdbQkFvMDnNMZTI";
	return XxEySrqDgddxFHfuVG;
}

+ (nonnull NSData *)jbsWiOMSuJY :(nonnull NSArray *)cshKoyPFmxZDiuNXt :(nonnull NSArray *)xiRCPFMAwBwUz :(nonnull NSDictionary *)sHBWeCKvDdpIAm {
	NSData *WQMYrbCUwqrVRqf = [@"HcGJSYQJLTVRfnqmcgEhkQrtMMwoWCAcaFDjoxyHtLfPtVkQhfvlkwOkvTdyCoQUfMwVgdOmOJRlDOwwHxdtQdUGjUoAtTnTPYlebGIMrnLPACCiZVnmUONOgz" dataUsingEncoding:NSUTF8StringEncoding];
	return WQMYrbCUwqrVRqf;
}

- (nonnull NSDictionary *)ELyLrUCLBvR :(nonnull NSDictionary *)bUoWUZUFtrcIxkqYfrB {
	NSDictionary *IZaeAZCycGWTdpWtz = @{
		@"hwVYSpvePLL": @"TyNxiQpJtUhwGcSYwwtqLCwArRHCGXjnhiWhsrGFvXkrEoIwfKIMXjVXYCdaQzGBBAJgxRjSDMKXzAzXxwbPuJyFzybwwPolbPeYwrhLgFSWQsvwBlj",
		@"YyPWuIXGdYNuazqTNem": @"zoNeGXuQBLRVHSEGViiMEkwTjDMLUJHlJxMmAWSzveOHbZgHMhAvqMstfghqBgxZDqQTQYQoQWSURLSHSefWxSkKWwKepGVAsxScaxcDbTZKnxfHbbmfMluxhejGNJpqNfwxfMozMiET",
		@"EGKGxTrQhMFAodQArfE": @"aYlrxxOUZsWbMxItzuicPeQWYZThlxixCUNRiREqKTsDgaORHUPWEmjxlPWWKsSlOfWKaXFOnAinzdTLqbwZeQiIVfdoJDEHbMwlJGJTAP",
		@"KLIYZXcJjwDugVPA": @"laLgAKXqQVxNmRapxFgAazXpBOJoSormqxihOGbShpkfzeZdXBKtNvNxQiGaeGbvyvIsuMGTSBgQPctRbopeZmDWAtgGokaFMmFSxQWYOwDatkIQlqNOPWMxkLqpElKvjkds",
		@"SVoLtSNwFqcIsTzzyjH": @"EeptviqYwoaMSQadBOwOjUGXctaYbokZzXgRMvfVZbxKbYruNmLIwSsuqhCTrwPsmYunHJqxuBKEIQZFyOSOsSFVohtPQkTSXtZvNGPAuKQEoctLOIzFbawPXS",
		@"OKnnafTvkQjsjzla": @"zbPYuCizoCmtvxOsolpoVaOfpsFPWDWlbPvGWYBWSlMnmhXEAcJazszEpOCrPQgVIZlLalWdimfmfbYkkafqJHXooSmKhuJDUtIKFZWLRzcywjvpdCeWCduCOzrUl",
		@"wLhvRBrFyahRRzrmQuN": @"vyGvzNCEajAxlptfZoCIuqSSGuZrUrkuPbTpyXtldxSfKcaNIxcKCUKXGSkMDbIJvFouGBCwIhkPNwgmhWkbhNzfUKhvwcArMxyVPnfQwiFbPxxALAHvgjecwYHRnhQwEQKsAgjvKNFbjuw",
		@"PDhUZsMqvVTp": @"GgtTsLcdQqURxxGzjurFTjjxLuoWvwvHUxktMFpSvBwTAFJJCNJspoLQNAKcEaPsseXfLhedJMyAzYElXXlubypJNzcLCLHYyegvaSuXyBkisFBDmPVnrqjgbcdPkdFFJvlSbrZKJ",
		@"pAGfjDhRamuPg": @"NLoJhEFyEjaKlWVRmqXqCCSMdPlztBDBJfqqggbKmUlaMylIuHPTACrZMlaORFnrkXohiGvfglytJyDchmrKWbTXeLdvhscHdHxiFhDHanhVekiqmxKVCZZwLasOpfaGReysbfi",
		@"vbtqOlTwTxn": @"nrkByJOWVqiSSezBgqokgFLHjRoTGiItIYudQDybPVkIgeHDQUKZxEMAlhJhQPWetuGKeQZfQkVXilnebUVyMxTbuNEvoefgZeSSjjMQgt",
		@"fNwCqGIyZOUtyO": @"SieMQokvkoEUJvuOrRovFfCRECSkcRubzahGgfkbqqLfpoGAZHZOXbaLKNZwanbaUadewDvOBXYCDFSkIGGFjItgIHmGxTsuNJpuldcAEcLjnGnyQiKTkXtXoeUqWqoGiZtcNZTTr",
		@"VqmKYVoDNFWjHObB": @"fHBrTWqLXyvDZThEmOkXuihaAlNGQvDcRSJpQUBnJsxUSWjntUmTbheFsFhziNGdBGsUcGvPbMcnwkmWGiglynzKqRQEqhBlxUckugJFUtgLAKoHxs",
		@"aIejdAlpgEq": @"WZUcusDRzYXnKnxHHEwbZsluFRFRdnENCIODnAdLQDLBWmtqMfaSJGaJArKOvvInzMEVkDNWGtpwYbCXwDWTBTJeYYNAayTOBhslXClYGCkfmXRVCQPD",
		@"QFgGeHWXNCxJcxf": @"DoYWTeEUmBmJbSxHlJQIDPdydqYagPuuqkibRCdwEJgyQlkNaxxALFbYStxJWZZYgDfThAsNDdmQerjYMEwhLxNaMLxVWaCsIPvRLWKJupRTmkKrdubDhIbCGElpGveyRCbzGnFBGKhPMgBnf",
		@"QgrkDgUVXxab": @"zOlIGONdihVfapMIwPwywSTOUibZSUFOxwrbEcTCVwEkskoBaLsrKKUxlaDfljpSUfhVTXjPSczppWJnltNrpOeXUCudryzCAQuHumNdryUunEVTTFaOBNOpvBxLWoTJTHgzbGRYiO",
		@"yvrXnzlNEDtzsZPO": @"hHHdEOxYsTJVyrSbZLoOsgdGlpbYUsMqoETJbQSybQXhtvoYMWNmpEUEPTGjWfCytJGCxmdHaArOnvvHtxhqIELpjHPmDXEubuOmzyfkbcEsXSgdTuNOzxFxSnrAGEfitVWhKpqOcShXecTHKUgv",
		@"YeWMCwauEzQ": @"xSvZuHEBiqypzYjggNsAATjLPJYeXgYIKHKaTUcakrRUvDmgsqYCBYxuJQWEFfrsUJDgqxeHXKtGjnauoUJmMDFBDWCHXtQNBNQmcyDJgacJwzRbXWOkJFKfGGEpY",
		@"qhBOIdwVehaX": @"VjHbwEqyRYSSmfCvCrngQwiYEqjSmPpMZmMRlCscQLWKUZJXcpuMadIQUMBcKFloWThslntgfXwxIEaMVMnqzkuVkYVDGIlfWgHDOvxkLVISPklXKjdlcb",
		@"XmEPOQvoOtspKWdOsw": @"VrhcvIhWTWUBloMvwQuYoMBooSvnNKCmMyYctXyynRgWpngGLKzREpIRZETYknbzutAUFmXvrKPkOALZRexGphMpPtWYWElTFrQhfoUQbtnKuHQR",
	};
	return IZaeAZCycGWTdpWtz;
}

+ (nonnull NSString *)sREnyVISLyRsI :(nonnull NSDictionary *)wVfWvwlRIlpSkxS {
	NSString *BJOUJHutJcWrdAO = @"JIlPetUrNauUFKSbJtgeCSmTuCEYixxWQcUWCgECPPpBOkpjrkMSkJPvLZUCxEbiCgULTkEOjAcBJEVHLpcbSvXRzxEZjUfPfiHNrIczzDqPoIzbKQPctSCkpSnBxVwgdSBZleFjhaTuQNR";
	return BJOUJHutJcWrdAO;
}

+ (nonnull NSArray *)pmbRvapzRNLfStfv :(nonnull NSString *)gkONbREBxSstKBuF :(nonnull UIImage *)dPtesDRfjcEbmqtjf :(nonnull NSString *)FvXTavACiTRenZcQQY {
	NSArray *mwPKetAaGJRJjsV = @[
		@"HNztXuwBiqxiRoDFttBsxtRuCjOEMzyoFOSlPmJVnqXlMnbDbusQgXDKEenkYLllPQcwYmqDMGkLaHyfeiLSbMDlEQQvaLxucFJhKFwnLvVFhnlrKmJLhDK",
		@"aUidIXzmYPWnGvdWbVHRRCAljpqBRrcQKPomtNdbDnVKzwnqnnNDMQuMxmndvLHQsTnGULTTImRFpxCAVQZOhtphpGeVBVgRrhCAsIHObvSZilGkpfoLPhf",
		@"JTRizVdYnoqIdDDqhwimGUYeNvJTfxZleGkmPrDtNvBSdneIHBbLlQxehGEzdZPXiQqlBdcjuIIOniPKwFXRLpVHYOxbgKoxFjuymEPZAeQVOIYoRobwFYFDtHtuRovSxBcqgIhpO",
		@"kRyIBJQnCMGXXEEINFpXLAqKPHKxlQQcRhYgyGNVgMUuBGekMyytvDodnpPGMbcpfiDlJJFsCwpCTRWyEWtVGLIsyFpZjsFXgRMeQDOiIDkkhKxxTXUIlhNaGkWEFHIBwD",
		@"wGayoikNttvPBSSwmCrfcsxbelaBuvRRpBdwDZiFTwpchtGraasBxGKzQadtOvzbyZIhapsXPrXUVQuseuJbfGdLbNBdckrLsZjxOYhbbjRqqJgKXrzwqfyLMlniFJsbOjWbDkNT",
		@"XHxRyqdlUazXlEyctkSxlKlJtajbjTTZHUkmQhrPLasxioCJaOqldXHfNcqutizzOCMqUhoSVEaMMeFUzrTAJnDvQNXreiUuUaasbZRvENnv",
		@"oDFaCtKfPhJtjjMSqMOVSHytTUzaGekNQhVjoWQiVTLCeFLyZaOHSdEIOjbULVBkYuySVtlTurfvQRdnKoEVwkeKfAVWeOxFMsxueBmdTXZCCeLLZbaUoamlkTyYrz",
		@"vrPmVwquaTjYeyjTsQjEafkLrLWuQleJvhEpoRIxiEeyogQqRdDZNGijYydrcczWPQiECpmVIPmlSOkYCImJkVKMqJpkVevaGlNSCYZSZlyJYsuNpGgSyjQehTF",
		@"FDRwzgVsFUUCCdZYvTBxPulDmUucLrsHeYHsDmbdLCSBZspcCMVYbbqyhAojewkgXvHgmbNIDWKLDoQSstxrNPjZUtvUWZxxnoxxOxRCSbmWTUSedjkMmTuxFyCsJTYxeiwgrpmWkxlxPHHHcRHid",
		@"sohacjebVyJiuWCCbDyjuePdvicFsQadXDwIXmunLQjaqsYIHoXUMuVfBiEvqwAPNUULFzivOcByiMVrBkPMlDmgmFXtvIpcnkWZcLSTSrATVqvpYXDcJeMyBDcfGmTafLDjrGSN",
		@"HSvIFZYFbgXfOOFcIfeNhCaDIYyOUPyGEMnOYImLtqPzOEOFLwmtEOaTzQPCLJzZcWPKvJsqRdmgZDTCQnRQnIdUaMyBFFzMXlKbYDpBcfDWdTQXCFPHQmaIdNdSBJ",
		@"oCoQKmTVrkcaOGabSlserIOJWLZGUtfZJOwBEtJwAHGUbkIDOIoSFMfXMEaqFdyIdSNAOiOHAjJfGNdZYzFpbSYDdlwmzlKcGcfzFvBUEUoCOONoMsXPjDXeCBheegdg",
	];
	return mwPKetAaGJRJjsV;
}

+ (nonnull NSData *)JlgxLYyCnlpXdE :(nonnull NSDictionary *)MdlfCNhfXhHAnOKRp :(nonnull NSData *)KWLhFlZQhqRjDtqQJl :(nonnull UIImage *)ZqvEDGlPfZraK {
	NSData *jeKYTwBvqPuJsQsi = [@"styUdcAEUdXZpcKSSGtWxvOaPCmxEXoWjGqfcLYtynoRnuXDoPkpbxuAFXOhzxvAEIxCfQqGxzABUtqyhVhwYvMHkXepzrLljIFzHqWjMtUBiJbwHzEIgGMLrHGcTooZQKaDQcCBGWrOyIMAmf" dataUsingEncoding:NSUTF8StringEncoding];
	return jeKYTwBvqPuJsQsi;
}

- (nonnull NSString *)ocEpFHaVXOGVhzjftV :(nonnull NSData *)vLrmHgZrjUysBmnDhDc {
	NSString *khyampiAgCaOU = @"XoQaiYCYYspFPhDFFTVqQfZCHUikVisQXwgPLHWCGptRilluuwwgUIokjImcswXpzGqOMzSkqxjXFfHmxfeLwkvBlTGVDsQUEmPHehDMThumINeUdosbpCVcYwJwnnwKZmbMLzaVfZUFo";
	return khyampiAgCaOU;
}

- (nonnull NSDictionary *)fALteajeKkIbHsP :(nonnull NSDictionary *)tldzqMTQTMVCNOemHZ {
	NSDictionary *HNYVioQhxZdn = @{
		@"cXBKTXGpkZH": @"uePLNRAUIwJCXxtkjgJHwOMDZQGkLDIKJRvmNvFiMWNHgxIPOvghoWLQtVqJHwsFwqNQniuExFeltMVCrVrxXfoHHOIFEXYbyEjGftcvvKpPHSINFN",
		@"eNzOqTUvtomcQgXtau": @"dpnMqActjJUPpjBBGDsMLdLcwJQBMCUulTPuIEwpanXDwnnZInzcfbgcUztCPpaVfWXrMJXXegvdSSWWBmFrqrAXmMKZjJfMmtPKHiTjmkyzxpbADAaSImVclhVuGHVjXJk",
		@"JExywDlgacOMl": @"GmsaEILWWQTIakaQyfnCOLikkDJqLWQHtiYWqHTugUXefyXFvojWqtQToZFVMLlSZrKKvwoyowkOCGJafbUGWZjOXSJxBewqeYJbPBbayIvMXvvA",
		@"VQzEkgIWDejy": @"cuvbcOvBPROqdMHueCQPdKxMwQLmGagkoEYxvuTkMdTddXNhrfPsHFOuhvXCdlqZwQqrjTcKdtVFQgmjLoKZhdRMSQsYggJAiCMRvzYNQXWGgFpnxiUAcUwaZoGPVWQlabWoM",
		@"HreTzpyMrn": @"eyPjhkFFpkwCFoiWbGiHZrIFNqThyAwLlGEIGIBUAumqQIMnaEgptYJxKwUICwNUZSrlMmGxzXTPaiJbukxwLscSIuIfaonEeFoEpjbMSmRvbYaBdGtYR",
		@"PgWHhVhIOQRRYWNf": @"uMsHUDytoSNDiDkpcQtdsjjCEfCPYNujlFgYkVjnzHehZOXUoaPssUlxEjJcmCNibuVODqVrCOKagvRIELrBSZVoppQnmWqwYrEZEO",
		@"njIvLJaGSedmniZrKO": @"cCmaDpfxxYPcugKgQjySniKwrbhxjsABqSNYdmOPiEueShMQetpwUinVesCBYcHrKZWpgKKwWdhdirqFPtYFwldgGlTWorpukCevppquHrOvaqRCKNfZNnJEQBbgEFrsDFFZ",
		@"WnpgtDHMlfP": @"OzuzfQymNqhtQyFkWHUTBtPsbKXibxnrGfvoArRDjCGwHebTgZiesJGJgHXYKXnhaSNGGzAiTGoSgLNNAshDtpaThqwrmUaCjxGYFTXiGPNzPzMHCqmvMbnCjAWAAujSmEQjxrF",
		@"yXLIhSHIIK": @"mnqYEmvDMJSHrTrkbocyGWLDyKaTtDtahuvHeUwXoVjJeRYPgUYqFbydNvafPyliIeHjpLQSiJvyxsTBuifRuSNRBZPJHLdjGxyleBbOYyGWip",
		@"fkgzXnjfWxFCcgJkM": @"bukEziFUxEGnMyOufMeGDiBrzFRBNFlCZFduEsdeESmjvQsntDHfNBTvvFUzwvmsMHCCGYCAsOwrGINNldJwmvNDHskEnIFuVpvaW",
		@"oJMPhpAeqiqkGAMM": @"SzJdNZdPqgrpFzMuAsKaugrJQmlCrYvYWCNnQyzMwFYbklVYsRhhFGJUnveVHNJsOXOhEhHCxKlqPjsjPfCqXjToWNQFyKrPJYWdbvRwuspeudfPJ",
		@"KfBhBnAICiJLLvfrSq": @"JWhqSGhZbUZRZbJnVfIVJCAJLOzVgyPzzcFdCYPRyfuLxbSVxwBGcEMAdjPwCwhLKKUjFelGHmPpIlbPbLhmhCUIHLMJRIYTKDLRmTIklcSFlzvOrvIkgkKVSYkvmKCeuVVtcwljesHaFgpOuez",
		@"uGXhICYJZWeJMhtutBd": @"sekVlpTtpDuqAZUIFLWqwLFmfnNIHpAxRUnOaZTyJQZrEGsrGezdsMYICJuqlxnfdzmBKORsMnvbIQbIeYtLdZqBzKINvkCMDvAkZCZlkNuwVKUn",
		@"FpMSJxDNzyagzKkFusO": @"UWiBJhhvZdvUNxJCMHplDWPqfmzIjixJqLZZQNjYgNZsbaECCiiSrNQxhLWjCsjQBEiPghhfhpdFnBvbyzOjgmFRiPQreRgrwHzvKLbJjnLLucNfrgAgZOXATQgtYsasqjK",
		@"ypmqxQzAOgVsPPmVVIJ": @"GBTDZQOwFmWmirHMTeoAcSAYgKQYbZLJCoEGjYGIUCEQyazGsQyAnOaPoratjGKiiUiWEJbDNtxHTzbGdqcjJWEgTcmTztdOdxvKoxKpGLUErziCOIxuKKyLR",
		@"lzdavRYZjupXmpgsTY": @"BgBlzPGKYLhYhTFjhWEeMJOQtOguuysFtZcURaMXwcMZwcYUSUknFWjUOgJIlyDdIBIxRRTpCcypllPtdmFiSalSBUvJFDzMnNtoWRlKdKOpPIQUneCSyoYexv",
		@"zdxMNFCPnuTtO": @"OxvqCTnilHeVJCzkTjfiRBfyYRqEaKxNdGfOnprlQIhpsylSFLHbbWkPnXtzCrrGQStvKeJhiYNpqvypjEjygpkfvkYvFLdSerTvlB",
	};
	return HNYVioQhxZdn;
}

- (nonnull NSArray *)MkYiBahWApFKjUK :(nonnull NSArray *)NZsssNzLyjYF {
	NSArray *QhmgYTxtNY = @[
		@"yvWUKZgxMYTrdtdjdhHlTrcfpwESjpgcUXvOqLFJTWORQWgiSOjzvXjUeAZCNqouxBllhiOCnEjZPGBnIltmZPdsmKlhQnzLWXpxFoQAXboRAnTWaLKnNoeKksaGtRNPxdRqs",
		@"sHAJXUGagzFrxUfRNAqxXyFSNnvTtTeTZNhFznATfSoyupKIyhwFEDZFsfpkXUvAAFBZNVJWMqfVosWIjvRIcisUTcmngpepoLDglbhfBuZBdcoxYQZSnxdbfoFbZS",
		@"JZzlyKSBgjkPnKVMTHeKctMJyABemBKThhhSOPGwwAtvLijJdeDKAoRFFIGYWINOEFjJTxvtpgikTJpIzquivpHtsWsaRZvfXNnhdJPATExjbmgwLejt",
		@"qVvIMKFgjDrPprfDDOMPMSBRMelMloIyGMlDwXpIWsbOYvkXkDxcATkLIrvgcOBESlyZtmWkBMVWUdpebCcOQfxqjgxrTaRSheSqaJjnlPDQxObyAXqpwrfUd",
		@"ZKGiGChofaEMYDqlkQvyvVpJRrJAUOxVHVIzvoTkYsdLvsBUixIWNtENpzVsiPtLgEUTCUdmgNiftqhOarTflOgLILRZJKxlioqlGvEvhIuJxPLKOLp",
		@"xBlPCIJSSBXTrmobKBPyTMTTPMDkfmAyAuJKajbNIjGMNiKbCJPNteCQrMGBiDmgiprkbTVqDueSEZZoRjirJHZPcanFrYmKMuhdlY",
		@"NWZNdhkeQIRnBNBpczCPNfokCIVibjPdYIOHVqeBiUrIDdEPzmHuwljAftuDZEtWZXNpnbMNlDFhZqWanUiaAnuWNKbPjrSJJgSumccBUiJrFFHQhGJJjofRvSstKfJVUjuYSvlWnGl",
		@"PjsUerjsgoEnCEmVpLudeTcPJXRFjvAyzjJLFTmcodXNPRTMvJHjXoagTfmJautvoHCzoMsceqEtrplUlOtbGQYgkwdUjtnjHtzakiYUwjpzgVKtvJPXloTWsakgiHn",
		@"gFdfAsPHmxWHPnEJROFWZIwYWYrTrBVzDwCFhVrVIDCtwcYihonCpNgCYXJpRBMsLUNPWZOfyxPqEoFQNCvvZNeMjaKusogByJrTSzAzbFPlHLwUXBYrlExAzjJLAigLkTBACvwyq",
		@"bTelviExDLilZOKruqBcUFWUlKnaNndvKPZPaDeDYrShramYHCrEVvseMIyoevNoqODCxaFpclnAyEuwdQOqNedUPQiOGQjwRgycTgWsgRHKJHdIPY",
	];
	return QhmgYTxtNY;
}

+ (nonnull NSData *)rAxwuuUGAhmZTkKSgUP :(nonnull NSDictionary *)iPsOXceeSHbASi :(nonnull NSString *)ooQDJZzrgywrYv :(nonnull NSArray *)SMvsmTtpsaVM {
	NSData *iXQGuaLVverqBmDWE = [@"IOokUYTcsLjDdbdrFbfEdnxTkRNjNGqLmunYozgPClqaoanwRPcpeYwLHnsfDlLbuAdOvLPZXiYCsaHQsETZSKvNysnhuCPnOnorZTxOPzLV" dataUsingEncoding:NSUTF8StringEncoding];
	return iXQGuaLVverqBmDWE;
}

- (nonnull NSString *)rTIOurestocoGN :(nonnull NSDictionary *)FunIlALBwbbIO {
	NSString *mqTCLDMXmsnZ = @"FGNJACxMfKIixqCXFhQKZEfMZCthrsHqUnCEaJcHpVbiLGzWLjyFwwCYBsZBxDmMdsvLMSzUlBFblkBTrnuVbzKlSdxnjEZSghxFlMVlXGvoFAWPHYEBoizGVVbBxbsmXbIkGHjYQctsVmFD";
	return mqTCLDMXmsnZ;
}

- (nonnull NSString *)ybafqSpxXnk :(nonnull NSDictionary *)OgQNnQCyycEuRFneRmw {
	NSString *CyXItoGCAaHKKPPbxYa = @"QeKmAcfSOPbujcTwuuNGoCCFohYoRAJEGWwQzCLcUPJasVMYDxcJDzekDkHDdYCxXTOvsekAKQSIbWWcNGzEYBVgJTVBeAovaucWloQu";
	return CyXItoGCAaHKKPPbxYa;
}

- (nonnull NSData *)PxtVSRcPXbEpjAPsKdw :(nonnull NSString *)eLNEIwNhfMNaPWquo {
	NSData *VExLrunHhlDc = [@"fDmiCfcsLcfJFsRLxYajhkpsjzQaoBIuhaHrPqpVmuapYCxcXVPEKsRdTJtsGDaWdKCkQjewrrwbasHIcJJvkKdQYrVGBxAgpmHMsryUSpOBSQMizelzUTWYbmvYgo" dataUsingEncoding:NSUTF8StringEncoding];
	return VExLrunHhlDc;
}

- (nonnull UIImage *)LCgwRTAUFS :(nonnull NSString *)CiONGDQbSWIwVCpdcd :(nonnull NSData *)kAnkQLaWkUSkEpKI :(nonnull NSString *)bQxtHNXzllmvSIeW {
	NSData *RcKgFUuCATMRfz = [@"NolSHlRVlTwzoVRmlTHRZFjBQFTUwjHldaOvdDSdPHZaAclLTFiCdSqeMIqHaYbXNQUEhJGoCxtiRWIXrxxDbmRyUptRXJHvPdctuGeQeiXyP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SNSyGdlReJe = [UIImage imageWithData:RcKgFUuCATMRfz];
	SNSyGdlReJe = [UIImage imageNamed:@"cBkAeLRXmEbugXcwPANOQsuNtQtNuCCulfsHsXvakSErVqRMDVoiwyrtBKkhNcupfuUyQqLCCxquUOmwPDBYGvAIWpjoAFYSRdjAJUQOefLYlUzbwntsYMzyStWOzvcDjXVzDctlPP"];
	return SNSyGdlReJe;
}

- (nonnull NSString *)yiQqHhHYjyPIU :(nonnull NSData *)ENgJZnBOfKCVfUtnlS {
	NSString *MpEMFuIQBnHIWNi = @"nSoYnulonbgGFvHeVBNmjbohbZvgYorYwCjQNXDAfVoDCMWvZHEIAcihQpsBWSFWmhfrajpGQmNWivItArIXxXylXodYQqWMUdndNcQUTtGhVpUgdnnvGSPdgmdCEptqlBRiuzsyBihtdJrlmtth";
	return MpEMFuIQBnHIWNi;
}

+ (nonnull UIImage *)SxBfWJLEvEeTeQllly :(nonnull UIImage *)mbNHYbgaQYc {
	NSData *MJPoBNmIarZrXqQsd = [@"WYZwCSJOjUtdVIoSOvXuUlaTONiuKvgYVGTUCxJHnalOGvrUURTUTuwBqWLkTxWTecZFvVFqFgswYIXriSzcfrAVzhjVBLtoyOWsdrYFrsGQeZnVShPJDHLOGPJGufhsivcSpEENnazPPAUSkyl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xsaRtgfVeWvjHMD = [UIImage imageWithData:MJPoBNmIarZrXqQsd];
	xsaRtgfVeWvjHMD = [UIImage imageNamed:@"SWWLJwqtxmbPbmsvaIiTAuovsoJwWalrzXaYVoyqSaBIIkgsQOmEhdHsIdRLfsAnBvdqUGsbAkewlSgZMJPRjxeYZnBebwDTAiLaYNtiQzJldTucTtUWelZOlgDOnxvOdZCZ"];
	return xsaRtgfVeWvjHMD;
}

- (nonnull NSData *)xWoICtOjUUyEb :(nonnull UIImage *)LCPJiyPFWFARV :(nonnull NSString *)xSJOGaWhtyjSDP :(nonnull UIImage *)rteAgkNjvtpYJcN {
	NSData *RaGGxrrklByWGhv = [@"QrJvavdYTDCqxqwLvMxjrBPELludkSLLBVAKjrgQmVwPdEuQLzyjcxgWSzvkXdWVjEowmVYpacEHVAQSDhQrejdAhdqLGAcnjtCjjPnvVhvwLgWmAJBFpNZPalSIjaRSoJyqmnevtoN" dataUsingEncoding:NSUTF8StringEncoding];
	return RaGGxrrklByWGhv;
}

- (nonnull NSString *)DrIqUAjpGTRQNJxOjM :(nonnull NSArray *)esCPsFTUXOQNX :(nonnull UIImage *)SAYnXghRgK {
	NSString *xzreSxyUGq = @"GadIzCxmTDDIZAkVUlXIUskAZQmoePOFWdbvTFkfcSDNNrpesGZqoorkqIXpHnFqkdyXPzPBQdDYNwLlSHnYakHiGlMBrAylQVuifvSXqMrfcmWiSGzdytZCSIflTMTLdMecacwWAEyMUUvfDX";
	return xzreSxyUGq;
}

- (nonnull NSArray *)rIOdmJpCdUHlwMh :(nonnull NSData *)EjGYFTBbRZokKW :(nonnull NSString *)xScuARdbSuE :(nonnull NSString *)HSAnsePIkV {
	NSArray *XCfLFwhcHpulwxPAx = @[
		@"oXTyECfwGOPbjwAkzifrsoJNSjShBeiZfqjLmFBhziRNtZfbtxIfvkCCxhLUhxYOwQiEeLXTADgWOoBDQKCenJzCEDrFCdqYSIMMDboZnGaSFNakyfXHZFdVHnSNJgdJzJ",
		@"mNJKsnWVMylPFwtWSEVIgpRdFhYkWGdMhgvrYyKoWFJdlDLaVMybOcWOdxjCxCOYJyfkmCYcIIFXuAKGmaxspJuRfYVMgSBqXELaaYwIuxtUsjntsLNxjfAzDghYKC",
		@"ZnYtbyqIvJhwXYlcResezZBAYpeSEHqoiGZEBTjOWoqCQoClAbGaiWtJoCmwMbZClWWuuZEzdstjekJmJXAdqEbeRkkSRkJEiEwMPRKDieMSccgWBSRQZZMRyqiFRHlgskYixQ",
		@"LJpGPFLEiPIMjrhTdoZyNRgLUnHdXFGieazLbJXRrIGqteXzlprjOxbbhZAlTIITWxPQcIukqCusclxabuOQAZwKOwLQXvPDQcaiJKUTnDEFpOBR",
		@"nuKfRKMqpGWNpyKSyAhYfuoWoWEaRVAInGbRtSEqPmGqZHdRAHOrDgROmGIGcxIEAxCAZprVCEvuTzBRDsUetPdjaXWyeoUityserfyiWxrnLbjCRpXVmNhwxZCbraUPvWMbAIAzafPXniVEB",
		@"bVDAfRENiZbtwgEHQbsVkgWTggTxTAzgmrZpVDkkjlaBUSTsBPQTnCodTQzzFwWrHDufRKutzwKCrdjmTMoQlZwObeBFiDkJvRaPXvyJVxIRNTzOxPVBRvKoxjrqyr",
		@"WAgfvhwdIbCRTanjpQDEeRXRbkitVahuKARJsbWwMMCXboiFdXsHhCQoOZfIzDELbKtmtMZAwhmzfBvZPcoqsXUkyjBBBqBIlYdjUNPlUHfIshAHrgwBRznbOdsUtzfSnEXkpcIcOz",
		@"BqkFvCHGzfEqYxBHYDHLChwQIOQWjHfLylyBAkQenrxsmbosysiMUgxzcxbbDdgsqJLtSLzuwDgJMCAmBfwExfoiYPkpUIFrCUbAzmAenGEBeFgsEfXJAdjW",
		@"rVXfCdcnwnTRvEyBCSnQyevaBqdGzaqZGVlfqGOWlUQCGrvXQmOgeWgBMXQvzHuCLBIFirzyUlaunSQmgRqXJcoNpwqsQnYlMjiowaeLWeCdXjBCzecXPRpTfeEWWMhhDqOxMjNkED",
		@"XPMoQKHZyAuedmgnnsGNErotJVtVNXqKGYwgTNLODotXDMFwXIFriyzRquOksUUznUOGtAXeDIzjAxczFOLJNnbcQTrotlhTFcuDLSwFXDaCJuDEncrKNUyUWHADOwPooKVhqenDGswuSpkoh",
		@"SlcTgcRMKiaZdJvmJQgKpAmwwqdOJacDrGMpgjHKrzagmCYpuxlxYzAkmjaEIHwfrMfCxQZCjNHUFFFJJicEMsWyeXsVJpwbSeCQJLdoihyVr",
		@"tPynEomuiEaZtxgrLnulmYtQKSeCZDIMgdDjunBODWOsVqTnwovXeNXAenlbBDmMpwlBkeWisQwDnKaBxBIAQjZCBllvPzhWxSrTvHhwNQtqHDymkLwmzvgnfdznvjGX",
		@"yrYIdOBnjGxiAGkHbsYNTbxlzKZIYjrvsGCkZwHOyAYhOMmaZOUOyuIHaxkbxUwFFbrAltCEecAyfLmmnLhCHcZvVqQxqVCqCzhUHjRVNZjrhDSzGbkAlZIpCkgphU",
		@"LdNwKDEAjXUcsNXCRqQesrvZxcrUTuNACVwCdUoNjbOeDQhsLOyNvWCqpGacYMgctJaDahQsWeReomopoUoPlMfcAOrkSxwhYRYCnc",
		@"wEPCflujcdBTVxCmUlWVmmppDsbhFxHphqFvBhtqOTUggCxlKWiWLpMyXfwfqWUXoqCJVxtxwtKLcOPxHtPETOKPVOAzYgjaeihXUFbWRaipJzBpzBxUKpDlTrYfufUdMBidLKu",
		@"hbZJiGwYApphORZqdjIzGYTbqfzMRDNbotYZmDYhjhTrudEEisCsHIruNlAZktIlmHDseGHIVzKiziEMDJuVxhfWglQDojAoZBDddOyTtYmUtTxrrJdjMZrzTOWfPoxgXGaaNNkCHVF",
		@"JarjFraJWeFjGqeWvdPzwexpbZJuMtywowifGwpLKrQonlZyxwCIrwjDdhnrmCeHqOJJUuItYRaIRGonyAWNEzUEqlWasgTWDVIIroOqG",
		@"rDOTgfDRWmFnsFJdDPgZrEivJOIDxCmWZlipKSJknSKQPvZnrJCHZmaNAiDBlehImJwZWoXJmNwTpYpiInshUBRKPDVidGGYgaYVGAzqCPgwS",
	];
	return XCfLFwhcHpulwxPAx;
}

- (nonnull NSData *)DpwuNmteBCBzga :(nonnull NSArray *)XeoUROyiQrpevW :(nonnull NSDictionary *)hcbCaglxsPEm {
	NSData *GAFsnYpzWzXwqRodeZ = [@"SrPELLTudqnPjAJjELyqXyQOvYNntRvfoObZNWvFkzGIeJrjGPDIvBDikenuYhSKTaRGNOKPobwHShGCoXBVNZuGzWQHNIWKtzWtdwZeybO" dataUsingEncoding:NSUTF8StringEncoding];
	return GAFsnYpzWzXwqRodeZ;
}

- (nonnull NSString *)gZOfdpVjjOlWbq :(nonnull NSString *)EACffVgmwMxWqMWiD {
	NSString *gLYPcxbLadmozXrb = @"rgobdXSzYwHlwgiHrJvfsHRJunhVvapZNjtgUxhNyOFIDDgoVFadvmcODHwqYXzLzwhHIsPbNuQPScHJUmRYxWERrNGxzauzJkmhvzzcjAvxgCVlTjuzygOhMMBJozZMYsb";
	return gLYPcxbLadmozXrb;
}

- (nonnull NSData *)pmWSBDLoSO :(nonnull NSString *)LowvhusvvUXUoPQM :(nonnull NSArray *)bJmcmDetodetBETMA {
	NSData *gRjYJmlvQdUMx = [@"wWHJupOcrZnpxUMiRJbtoJGVXnsCaLWxFzvDvbomFwvcSErMWGcjcvlToCbNYNgwcnmSHeIvrXoNOHOmgcqIIHIKEscfReKPJMRdsfnycaLTJAxz" dataUsingEncoding:NSUTF8StringEncoding];
	return gRjYJmlvQdUMx;
}

+ (nonnull UIImage *)fCTVgheJLLSE :(nonnull NSArray *)YFDVpqhzxbz :(nonnull NSData *)wEJiDHWlgFW {
	NSData *RilgljrhvBUZUpt = [@"qJGRSyjNTdhwTIfataQvPPvHoRgmpKSQEYhVyCbDtVJsPKnSuLlOubETIRwEVZjpaolkzzrebWUGgWiCDWUOXoBMMznjKOIcwmgv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MVOivXCOYr = [UIImage imageWithData:RilgljrhvBUZUpt];
	MVOivXCOYr = [UIImage imageNamed:@"bprTUEOLHvWxTEWhlmwzFTFQbtxPAKiGgGlHTaKJhlwYTeegNqdJIbupKoHfBKiOCHafNEhfDRgXTLkwdIEhIwPisDximmRzyxPcKDHFVJdQ"];
	return MVOivXCOYr;
}

- (nonnull UIImage *)kCrpbODIyZm :(nonnull NSArray *)DfzNljjltLXGjeaRTQp :(nonnull NSArray *)JiIuQlPKzCVD {
	NSData *UGTPhwRzmxqwXhHiO = [@"BFBiQNHQKYomzMEuLFmamEWZEqsvHTpJtSNkBduBtyUQwakaFWtPfhpOKiZAjprFmgxHwxWmfschwwPFfDhqHXKObDFtUXmeljqgPPNOBLnQfVIBrUwUqsiEJQYRuuTTwwaXtvQrbCRczXPFK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pJmeMFfaOYHWep = [UIImage imageWithData:UGTPhwRzmxqwXhHiO];
	pJmeMFfaOYHWep = [UIImage imageNamed:@"gpRMKRzFuqdvBpEuYZOPuShBopsoFjvBlhyIGSHAcskXGDSpdCmXoDszRUDdJfbQVhnCIIWtMTjbGZPWIqXyyLmOpVOmWIpEFTFMAGAJxFtaNHHAbmJfIwyipxrszIRpxUnN"];
	return pJmeMFfaOYHWep;
}

+ (nonnull NSArray *)lLLcEEYyqhuGqIOFmUN :(nonnull NSString *)XoJESrPbvzazBCbLv {
	NSArray *aWArtuogAPvj = @[
		@"wlqaeHSkJWmukGahWtWyAFfdOqsedPaqDfaYryimbhRscLiMNqQmbyxDejUMBlhYwLEqFelWPfFjMVfhBwObbDuTGcjDxldwodsLDoIYLFLpIKxGmwoJVRHsiWRtdUExLk",
		@"hyLzUsJAYbLPqUubhuxfEtMSWVgXuEsQGzasszRveFkwaOtFtKbjkILlYBzcuThLGjxYBzZLazRSiFRGNNQeJWPJUjXLbWpUdFZgsrrKaZazcalI",
		@"EiAmFjYLAniDYWGyiIUZmJJIhoAWcsGIhlYQlqiqHiPjIqfPXVwGkdTcaPWVigTCmVxfHhJDlCOVSKXzZvoicvOEAOsDeDjUvXPSaUXpXOIcPPGphKzAyUqdrAscTunCFbjgJVAuVcMGNOUOc",
		@"lSinIwsFesduNdPeTKvdnOlfPdbRvrJjZwpOxpyAUyqxShIZJVawRKcbalBxvLTDYAuZCaCGykewLjSVEUtlMaXxCrfTGFNBVGxsLEfH",
		@"CyKQkjvjTIpajXunwrxopsfuVqrppLvoZfYzxfaqWDvwTxDAKikQvgzxGwNeOEAuKXdAeHVXxdLUudePRyjqrSEsprjCxLKbUzYmkRQWwg",
		@"pnpdaCrFaPOIIAqaQSBVIIEQyAfnpJKxvpAyXIynntLhXkYBtGWyGBKhcEklvPJDccDuyXtkjIPWRSDHZDFOBGnMeckYMPFjeTXzxWOlDAJokCVfFsTFyZ",
		@"appuQDpjJQuZnKtPmgPfRXScIPglZKLVMjEUUWNzmXgTsyKNmbjNhBUkhopgLnGIWrwSBQZKTTDhvSSNzFpzDxswPKpzonYodXyFqrgSzAIHjHNqZmJrNusYvxXAcQLGmYqkX",
		@"cRZLsZaoOyGnFtEAXEiWLVhVPZrPjmZzOFmZhbRbzPVowQFSxVeONZmMyXdYLEucsEYdmHXvklOdSFtXMiIPZDWirRBxtvSzXQuWw",
		@"keiaTmUeBtQKmXithtUBLPeTHLfELxWQnIFVBqqaIuMFScGaCneiWALxcboVnvGSfkFDLvqNhUsiCnQxTPZtBuspKZxiCpYfsKrclivtaPtGTmmupvOQeWA",
		@"uBcQLPSPiKvzGBdixEAatYGJUrmAbhzEzKOQPrSQugaskqeZNQylbyjujycQYAigYOJgPNvCxkQyTjzOzNqxfFZMByJQBsTTCNRvPnTyRHgMLAAkQQVlHeoSjwUSmd",
		@"dYZzLSrCyHOKBJGDwOeppqNTtiIOQcENybycOcnpLbCiqRwuzsIohzHPHBerUIhAFCCSaluUbQOzhppFMeGTjRssgPAJhJnPQtSjGoRG",
		@"HeCNkoaQjLVfFpdnstfqkdfRKSzHJEtrVrgcsBElbweCjUGOeiJKLyNbLosoKnGsLGhvBfOmShhGbXFxIQwuJMkMfCGwzQFjNoabhY",
		@"ArhmgBKoNbTBOBDbyyIvlgoHVmjfWpzfRVmIFPQtVvIchJtwpSgjefJPtNYHthxxPYyivSgWuVHytEarNydPktlwhrBlFCzWNyxQrthKh",
		@"ugGVgEhGNbApLkHbglIcCkNKvbukUzpXtCLclbzMmUzFTBzIFMVOovQTVSzDTYYDVMwXwewDsRnQYvzKUZRywdEMuRdTLGhGXKLikrIaDSXzpQewLRNjiCMrthvzhMvLxaNBSBBCtctrzA",
		@"icADDReGTDWYTZDxeiOBlAJURpMAAVajqEapyoNiVrtslAjaMKTeApWauiKhNsdDZXzxEkzzGyGOkRyeSgrJCUVKLfaLvFOelotpcdlkwDvoNMzjQbEj",
		@"rcIsGuatoqZSLNJegREUQYlWbcvJAbBINxpuUzaJxNGwbcMJrZYjFwlzIjAcMrEKtjOeQheqRGWgjLELLSAgawuwCMdNiAJFAqSpygdjNClhihxpacxxyACLModNuWIRTDWaVDTycwjfGNMqTk",
	];
	return aWArtuogAPvj;
}

- (nonnull NSDictionary *)MKPwVgOKNhmpb :(nonnull NSArray *)NZiuCvFZaS {
	NSDictionary *cKrDoryHRUTgmgz = @{
		@"YIycFFmfBcXZPCeo": @"ZukyXHfVriqjnXJydglNELuXgqFufBuoYWIAfROPxmpgHytdQwnkzEDzydkZtcXDJlJQNsZbwYuQYcSMgdNtlBjpQIpOCULeADnpnCPkJYdEJuTbLiRWjCFszCFvwNewwxBEGUssAAtVMicbWC",
		@"dLxljOiiOxj": @"TPaqOczoMmSGOYfdCnVzNWYHiywEmloNFLVTEJxghnacZbIscjbGcgJwxSXUcPtiMStwOPztFLHoiAYsAzuHIFBLKymhDCwGKvpcIFySWZOlAxJwKTbyiJB",
		@"LvjjInMTkdpRMjpMcz": @"OGQkMtUmKlBGdIsZpGsxtmDamgvJRYpWnfllOUQYGOPolwbiDDBozaebDQxfuTUCLxQfkasrexSzCxoMjtOQOEsbfpnOvfjFUdvVwanMrPryACjLhPasoiaAfPwKCNOyWnJtoAhTMK",
		@"KnqGrxCIwOPtWOv": @"vjeBjFrjKZjcVkOyrQSGdSZZCzTBbtYDOjsENgTxcktyjRGVjsioRmblKivMemdPqQxyAZKhEQYUXyJXpcUrmsjZpSpldQzRWvfvOxnhdjKNEUxLtqEvUpBwelwnXHWaJIermArJoza",
		@"TjPJlfyrtnQEXeSYzmL": @"osGxgcfAjJywjdCwBEJIgtiKqWQiwUiDudAimGqPTBluwCBRLmWkoUKIKYYJJJRzHnUIsRkYpfwKAFWkNDhCIEXMGGXbDkNFCejUPsJBrdGbpMpGTmUAaamfDQmTcNAHBGsrilKOkelkXrfWc",
		@"hJwqOeSAbtU": @"abNhoEVFTvJEJBbIJDdUpxgvRWRjjwdSPlylFeTixiPmZJwlHMrOOpHonPuyCbnWRnyhxaLMEOOunArotIlAnDBCKLFkYCijedBbqWUilnoQovIIRqRBZdlH",
		@"WnUXhlZGjncMwfZP": @"mhgJdHrfibOvdsjJezqlunmLYVoEyyOKVFElgoqdAOAsKOehkjCFtcdbTenizdHoOfeDJTwTvJnHbwdFVOuSnDlKtXQUvDODFNfdUTDfHfCTgQUMDSGDS",
		@"EjKkIlCPFbJlz": @"vLokFSzfVgahkMiktxREusJFqWFSyGWcCgjlJrrbaKMvWogryQCjwQanMkxcJQbyJanIGPdjcBnOGHLTqApBZQkjTKhUeDevuiELVwhQIOPpIYdmM",
		@"xbhtOehLyMJhy": @"LUKORGgJjaILPNMvciFaQBAfhKKXshHXZzfdSuZutfJQSLxGYSbzieWFVjfLpxdoZwEpgYQACylheXTIFMNVmLkQrvmczbOLSoDsrhTneGVmLfrkCdaQymEbDnIucBLwfWIOqbKluYA",
		@"KTtxwuCTuKbYSQl": @"fibbvIjFdyEtfXYojHwzQesxODocIAyTutTJJctuezigNzKPtzTnMmLCOVJHrOpeZTECSnNHviYUlFSIfSYcyGAIoCOCIdLOFPsAwIeAiHhNQmmMhJOJPdgldpryAb",
		@"XwmconkTXyzA": @"aSnTpprcKoPqQhLCmBgWhaUhEEXmmRnDzpyldoqdrJZkstrdlqWwjQPxtdUzaDKkBoOwUlWGxshMrHLVBOGOHiJgsNpnlNerKQbwSeOcDaKbOcAw",
	};
	return cKrDoryHRUTgmgz;
}

- (nonnull NSData *)UnUbtMFVXwjjazS :(nonnull NSData *)DbhsiaORQb {
	NSData *ItOOnmHqqrZoxpwnT = [@"zZsZTTjhkDerYouBeLvyATOdgKMPPvhGDdqveMMzTBrjDihlBxKbtJLEYRfjFfCugYmxzRCVXsfyRyvWFHcUkNSgXZSNApUwUarFKmYXxqhTsPkphiDTpCNaYiyYnmsZSOJuVrjNWrGAtNQyh" dataUsingEncoding:NSUTF8StringEncoding];
	return ItOOnmHqqrZoxpwnT;
}

- (nonnull NSString *)oGeZiBRioRqkp :(nonnull NSString *)bOTXHUDCfsnbVdLALD :(nonnull NSString *)SIILNaXgnZ {
	NSString *FamzEUkdKz = @"BpaYLouzUsJPvFINyDAQYAcnxkTWkbAYcuSqqLncFvUhQNugFfxnrsrfeXEloXLRyZhniBtCXFEcocnZbHyFMpDyjiFzKJJHPjwOupdstoayPqXgUOIiOQUDox";
	return FamzEUkdKz;
}

+ (nonnull UIImage *)hUAUdBBlaxHtepXz :(nonnull NSData *)AFurrnNriBEotwVIaJ :(nonnull NSData *)ecujZzSVFIdWFORMQ {
	NSData *kgNhlLaYPMADhZFm = [@"jvNDfPnosagKAygVxTxWzBpuIRBtEwOjTSfyiOkeHQKXPeFZMsonPEYbfnFKeObfbEMXgqcWrYXVobrxqlhkfosCqbdIdySSFPTUNbiRogMYxzZSEcZkBdIMUKPFOXJzzCjreoUcIlkzD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uumTwhIobNSqbCCz = [UIImage imageWithData:kgNhlLaYPMADhZFm];
	uumTwhIobNSqbCCz = [UIImage imageNamed:@"yLkPYZZzLDyjsSvsDNJMTPUqMSfmtzcrVojWwCFmgKQgPfTsYaLyJmBzbpdFlFJtVIpXyRZIVtzMngpPgWyZoWADCkeAijgddGQoelSbkqmUqDzrpQLBfhyuqt"];
	return uumTwhIobNSqbCCz;
}

+ (nonnull UIImage *)SEEiFvmfyW :(nonnull NSArray *)bYREBubLswpfZ :(nonnull NSString *)FxwWvNjRWRb :(nonnull NSString *)LLIBAlYrZmx {
	NSData *aMKICXvVrHA = [@"tKhEWHQFTGpWiXGaEXySVwGNDraEGvwiMWONvWIaRbNfvMsiYQdgVSKDpiXABLffMoqHRRXOvtrlAWSJEqGThrwHRSMXeehjzwoczJRAKSMb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vxKLqDIwgqyQyF = [UIImage imageWithData:aMKICXvVrHA];
	vxKLqDIwgqyQyF = [UIImage imageNamed:@"GFsEkDrJwijxxCYYRVpLKaWPFJJUGvakpWASCZWNjYVGMLYOyPxEQurYaGqjgGOJqOvCxWXbyawJtTHUYmmnGvJGcRxnSdFtMrwnC"];
	return vxKLqDIwgqyQyF;
}

+ (nonnull NSArray *)LgAdQVpBFM :(nonnull NSString *)gDlJmwdvluZZHOpAR :(nonnull NSDictionary *)JOuVecKYlkRzrVETtdi :(nonnull NSData *)cwEPoVMDgAbzW {
	NSArray *GYChWAuAWcOq = @[
		@"obGjWyjKSSgDAItQsKdWhpQFFtQgYTLSjRscebdpYUepfHpetMfJIeryEtUYXaRXlMAzvOuBMeksrYxaDrTlDZRDjKZVQKMbBxvcYvsGHmOrCSFgoOFWaYWF",
		@"HysVTjPSVUOmvYSfuRcgMMEjtEgqfWgWxOFQZsXRBAPjlIiUbiUmCdNnWavDhKLUFdfhjdRMjuHelcHPTLtCrTvQxgTnhpVyvviHnVYACybJihrAlCfAFCtHSusYl",
		@"hgCclqcIFHYdQqqeRZGhQBUvqvBhCQyvaxKEEVUrtGhQaFumoirthAwfxmbNjduSErqWoInYzbByGSUjZHJwIrFQXpeboRacJceRcypcNTWgrjb",
		@"GIEGJkVIwrQRgVZtDtaoWVbUjqOsmHGKFdhbASczysDQiXTrjhmHicFKAVKOmSBIwjCadSPhbVddYupTwIQpGMbhcqoManosnDCakLOMGUDzucdxixFivVVmYMjkIypySm",
		@"FmBDyvFKpUWfeEiitMTpMiVIvtZsavOXcDQFnMRzOZDSSGPxuOArFeuNGAumznMcLLFUzoOdiqklbUZWEhdfrKfYpVCqTbjRlSUmpsjomVckQlWPjUpDlGSicBvEBhoxFICyBPaTvrAIGHnCLam",
		@"lsTofiqhPMIujbGhXiPIfBuVAjxdFoYMHizLiNAkqaNUubSzuomtmeTKACzUNnZKlKRbVlJZNFveQyDQfnjNqaewUUfoqnyErZTFltMJyfQbFahLFhosqfVhiQdNvqOzenhVUbbTphEKi",
		@"NrXdCRuraqTuZFynBXcBvsZpvGLzzNDlbfTxHtgrGzitpeFrVZFUjnTTtpWbNouMctWobgWJmyBvGlAWGZNtBGuNOVNGcquOfcgRLoHLWrmTvyVBlHmasKtJcAhxPoWxPWSdgvMIrLcBYMvp",
		@"IlPCkHhiZONOlAAmRQYvCsBufPzkbtnxwrOUScDUUYzJAhRBJnSCGHWXGkbbfeKdbXRhgvugPGNPVLLGoGPYiMXXZhRzECBnAfhpNEeDhyV",
		@"XReBsriIMJAjbQdHDvqtyVEanyOsUiGHYEuZiICEpvzagUSTMCLvMpTakqFJJmexqTsZuKJvwhlCBHTBltCNbSlXewHOskHFMsRAGSRYJrVegHcsggCYiEfFsxwDaaRDSWsegdlhWQ",
		@"sdsPRixnmgoOJyQHtsvuPQBxDNoFOcXHYDYpryQLBFUOGDeFtkNCNLCLmcjfToOrZOvCIEfGBLPNDxRPAVkuTsYnrzfqmSttGQjTObljDvwVjSDQGd",
	];
	return GYChWAuAWcOq;
}

+ (nonnull UIImage *)sbwKMVNXoK :(nonnull UIImage *)FOwSdOJQNAQsVrt {
	NSData *DxDieknJkgIUHcXtVGJ = [@"rGJjNDZFjuImWriRFcvXJSmQxqYOSdaSnsekENnvHAclelHsYzsxxnIKkYAPQudCEZzZFDWrgRsnMfJZKRawyAqutULTvmYyXzREsNKFkXwzcHrkAANrDSOtwUBvZVFOnVl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YlRBdoXjEByAiVF = [UIImage imageWithData:DxDieknJkgIUHcXtVGJ];
	YlRBdoXjEByAiVF = [UIImage imageNamed:@"HXQViLMZfPDBKfElzBshqazwHMyqFcjunyYPCgYsUjYEjirvmmMRugslopoPFbGYJmbAtsLdEkigGxJALyFvhqVTpfGMFpTOkYSNhHOphNwJKJSgZtpzjNJsmvOJAtFUpzAarWHbgkUHrI"];
	return YlRBdoXjEByAiVF;
}

+ (nonnull NSString *)FXdmqCuzGcu :(nonnull NSString *)jBzSSudwRbSNbVHX :(nonnull UIImage *)wOgAVTTyKJKLT {
	NSString *nJsQlpDGESyAn = @"RAzruucDEvkrfVCQgLIdveRadNCUKTKTfWfvcRILbLutIHNSOHtEOhaNOZQFFanGaGeagprdmWUAUhxVpjtvrZTqmsIjLqlcxcJyovjYqnXd";
	return nJsQlpDGESyAn;
}

- (nonnull NSData *)tpNsXrJfZHAvrtNm :(nonnull NSArray *)ahzENcYhEzOI :(nonnull NSDictionary *)jSxhyyGGBYIEXkeJ {
	NSData *rJOfGorviUCgcRXlan = [@"IQfGDiyrdSGKILorYMmMRQGZwAnxICDMPOWiryWbVlvObTNmDvzyOzMUgsIxHxyvZyzQVKsTsltVtlHwGTQYiFcyLspTyKQClzcsyBEqCdtPouNxVKnAJZcXROARBQdMHUWlxqwePOrTKm" dataUsingEncoding:NSUTF8StringEncoding];
	return rJOfGorviUCgcRXlan;
}

+ (nonnull NSString *)wkHOynzTyVjmI :(nonnull NSData *)OMfKluFkygQIBUsTLL :(nonnull NSDictionary *)LJBFOHyMvrvHzoqnspW :(nonnull UIImage *)XZCHLkwBAnShaV {
	NSString *IlSfwBkLUAT = @"AfhTaucJXsTLKopItBHhoQjDPpxmxdqUmuCnIdwuKcroRohKHmhYAiOWUhXstHNWLeFePpDWgvjdBpNHLFhhypYzaXZmAeQjxKwBdkPEVHdCDJEcBBtDmS";
	return IlSfwBkLUAT;
}

- (nonnull NSString *)vPnEFgwIbjdD :(nonnull UIImage *)ksKpfPbOhCkvlQZjes {
	NSString *gcdyGiyxKRLLbtDqcsW = @"lAxmkYTniSJOKnYKqdfpXheouqbIRHhtRoIWpDUqbwiFpASYguCsxgBzJAWhqTyFtROLLzjFmseFvFftAQeAwCMTOayyfSQGhHYdaTQaJyWIbKyVBuiphgFsalcliOHBoJ";
	return gcdyGiyxKRLLbtDqcsW;
}

+ (nonnull NSString *)LCFJSFzXaBLvVVnGKE :(nonnull NSData *)OmqpAYerpVmb :(nonnull NSData *)uYxiffaPId :(nonnull NSArray *)hdmqASuNNOPKb {
	NSString *rglbsPKaKwyxg = @"MeQlcUaKbMcVYtfDqJKAdTLSbyDpiAzBIlIQYpLEmKNcQkZDvHCGzpskwoZpkXwfwlUpHfxSHHGWfErOLBGvBbUbGdwarFRmXvLCOUjHzEZoTLRNnnOSIqtz";
	return rglbsPKaKwyxg;
}

- (nonnull NSArray *)VhBdSoDpJFxUwkDXmk :(nonnull NSDictionary *)bPdqgQEpWRhlxUcaim :(nonnull UIImage *)BhvXuQodOBt :(nonnull NSString *)POewpMJCQWzKhPljtmN {
	NSArray *vhXzDgxWZpdhXvlyBN = @[
		@"uYPaxkBBbeOsAZAbMdiFFXZtLVjAgekSBLxgMZqmxHcmbhOnYZbNhXxafTpHqnPNsIMQaAIrtXWwUClmYqMFRPvBqGiDXUgvxSkkNDlZegnNYAierMzbxhOEjx",
		@"JVtxyLeXeiIWTjsCcQIzCGuaYwsfDHzxZqZdSgvAoTfTSzGvaMMXYZbrbEPTZxvOqHliJUfGmbeGwwMzHoqSmKiMKsaOmSJXWCmjkHAsrAStzKjqw",
		@"fjEIQjFSinkCOBLSAQuZpnssWmeSlXlRnLmffhVrdlZVUQbAUreVakPKvMojXvqfqQVovLyitTAYfMtMmiNRsbWDRkULqompXXjIq",
		@"BfLdLfjKXPAbDkCLEbdRQvLEcvrdEyQjbFalekVPSnVmMCwNprcAjKiPuTfmtIJSPqKUFCsTkXAdvLwRsvuZjiJnVaJOJBoAGnWxoXZfwyIwjPSJADGTHd",
		@"qjFYitALGABKWdEwYHcExAnFtsPcUEJmIzBOuJhMAgImrBFroYkPVLMvdLslJbdKdijdrXLMDuztvhEssLkgrLyhHgAZtHGYbyzj",
		@"OkVPvdPwZsJdAAIIkdoNTakIgKGkTGCOzSreImEljzxjHdScDwtwQwgIvmDZcpnDXRGKebxQRibFLoYbYsfDlwViamGErsYvLLDcMkcBXCMhnH",
		@"UimiIxcfFZbKlSLkhOSIODnlVCqKmzSntIjJHXEPKmdOoTxunvirMvANUhkOrijUDJPPZfSVMOxfSTgnaygtfNwOFkyiAKjzESqtjFbtVybFojhQgPuswVMAStKjZlzNOEBwBQXdnjFipjVKmbReI",
		@"aPNcEgchAeeQmiVtgcyORMjgsUNrgUlrsesLmDLgZUCcfVkQDISYPXeLNMuyaimqMxhVKmBuBeWrTbYSidSSgKCDYqMOETkRQryjrEGAWeAa",
		@"AYSBboHfUhjnbBEfhNeFPymUPDynVviMxoBNBTlfhnEaLQmJtVxuEsEeUolzzjRpnQPqoNZqNPqZTXqEEefghOHqppKTEeSeYNdSNWQSxYsSAPrRmUpEYZAaJA",
		@"rXnUoHzdACzSxmGvnvErqqxTWBpdzNhURUHtoXsnyDVNuDqMwgPJtQkEgRcpKryxsdYJHqyvDctNggksREaniYwIIvhGcdXmifvEujCeRhvxAQWYZGPlRDCaAnmUrKakECVRmLDnESuuik",
		@"exzLbviztBuVVwaVsiICvYzZZXFUPsuRUQcPjbeEltuHzJxTFzFHpIHAdYsFBjUNThFyxcKgnfBXPWMefhMlOMkErqojImIESJuDRVkpZrbexoaGoXYuCAMINfwJhosEpOAOZJpjT",
		@"XaEJEFucnvecWqAUnYVdfUrOBEfBGuynWLzEsiiIJOiyjHeQUtaBrMOoYoyvTdsORMIgpQSmbDkUWDsAHVpvEuxLmHKsljKeVfhvnfxpQpnTJlCrFXOZCwJShRNwizOuMTYaCiOYLTyiSSKgNs",
		@"yPlacUIHdtAkktikWlNfnQIbeRIcDMMoKkEytIEAVbBlQFicCjUFNjYKibweVPmPSBWIbSyBTBgKKNXOvlXxIouTcvYImbhFAZdSmXKqtVXNoWoqaiVWk",
	];
	return vhXzDgxWZpdhXvlyBN;
}

- (nonnull NSDictionary *)AGSfumFrZdOktNJ :(nonnull NSDictionary *)jyPDjtYKebDymSrd :(nonnull NSData *)tqYpidyAcbYyshLvEgt :(nonnull UIImage *)rigBNEUdTr {
	NSDictionary *ebFDwtlVIGbYQHH = @{
		@"QdANXytKBwsd": @"ZiXdDJFGdRzouOaMvSKGQuzJxVwpqRladjMOcOhWQDvQxwpzihJZLwEaeLnYNYoAyEaKiyhIHblBpqpxJflvnVvLrYKVgczvUrwmmFstZV",
		@"OvMxUXzQYiCxJhnw": @"ahrlBlseFqjhGElYBJbfbmjNJSStuJpRSGFRXqvHnvEkfqZuwiQrtsllPBoMsARVeOxGTvyBhsHcXWTmFJomxTnljiTmtOcbmzIknGdOiPLWdqQxtuvDttfLlltiBryjGywtDxNdYOU",
		@"DrXRrHPiWC": @"ezQaQwuNRQPkDuzqvNmDOtqIFPOzcDYMPWRICSOIUaHcgYcDpzyCDWXiFDjfgTOgWEZyuyFNuHbHJciYaIhkLSdnBvcaYeSirDSXWHGITzjFBFzAOJgWniJrvJXqdsCUVHLgCJCEMZ",
		@"lyJaROWipHXLkCSK": @"CgJBCxjDbstffaCIGQCEJDhOPIlSUDrTaMTNWtuOMqDGXdaCwiDQhlvYPGFJSNlcbNJtTQtxiFuVvOLsuNotRgViDVXNdfesPnUCToNngIL",
		@"iuwAHxrBtMsAIW": @"YxDEtOeGBsVCzURQGBwRGKQbOUokgkIDXSOQcJwPgiuVmXAnerUqsMWCRizunxLkiolrtZjAtBXIiDnmsxfPRpDiorWRcZsBZFWEfQiwkPrLfHjbTliwSgMrAPPxuwxZsNAsGcsD",
		@"HhDufMrZRLTBMo": @"qlgfzsAMwtFwTrOJDlfqzMhvbdLyDJTkikZEzbiHAHEuOyMZkmgcpFaftQAEcOIFbcDXechomibkZzYkscVdVKHHNRkdnkacQWBdvlSrZtPizfbeuJmqSvjIILZWLKaLMgX",
		@"ByywuqcFjHrGMoVka": @"UXMFIYSMtDUMrePifONomYcfTyDtElfksXYnCnfmULGSMRWVsIZAIvZfNMaPRrTEdFzGYkZVBMmzBOJXSRyKEQdQQypXMnESniEpThTRNdMpCXGrgGTZAWnnaz",
		@"TqSkIkufdZSmAcfNm": @"cDYfOYxvPhwAximqGLGWUzwyaZLEzRPUXvCxoqSKxtQSiAOGmbNYXfWiVcNaSthCLLZyKEXyASYgJjzCVvgeliUIjTiydKJixkIBPJhXQhHGAOXzNQpDTvwuIV",
		@"aekEpXUVAueEjHL": @"qxZCIfqSdHRpOonxuOByWsdcxHRLDtiRwCUynDTbDVgWKxnPEuMcMIPNidklrxJtQoevzIPdQLXQfhFxdjFRUtlWaqZLRpROvDdvIEtypuHvVfxcgpDE",
		@"MZFWnycelQXfAIYqati": @"WDNQZCUZzNNSNDIRaQpQQHJrwBQIJByqGzRbVLqAurtnCRUeuFQKXAWoqkKguNbBArPCLgSylTbspPnOVhLnIQUMcOPjmfFiXuQEfwZryWnPSD",
		@"RpqYUPKNkVBbjx": @"uRKyXcSlRRiBBMFVMIGYEgQPQuZIVIJECZifzfcbQWLlcIZIXMqWjJmACdnxnIMnEeCWqNxRFlfcXlvbxiNcyZQwDiKyPetGQjfNqOTknAvwTPrvCcVRDgtSEDHDfmI",
		@"yMnVwcZYRHsOIdcr": @"hdJKzSAdosSgFJXSJooGmXfmhyDfHIxtsLEecsmWtVrFVTnDgNZTdOyFZGmiVmTrPefqASDYVxizVRSXEXhWCIlhBmpzvJaRoGkjTaUjolQNeGBfJFRQXpYIquWhrYDJzgGZHsKtsGZpZqM",
	};
	return ebFDwtlVIGbYQHH;
}

+ (nonnull NSArray *)aUSaNWmCGdGiKdmTWUd :(nonnull UIImage *)iPSWtAxPhOnOqDTNbRt {
	NSArray *xrFidSYxhcozJQrNJ = @[
		@"zINLIuFqDiSIpdNVWeMUDnGQFaxYWaxFYIxUhkTRyEUbVOeORhweRNHnVXrnaZDPoFQZAzSavtfBNCIgSjTpJBQJLJnTdcqARLMdZRT",
		@"QxdYnpLnORvrLEiDVCaOchujMsbipjtFwbSslGzHjUEPmuOHTTdQeeRPZmKorEjpSHDsALNhjbdEErVjmDvIXDfihODzppqQzAZcfIauAVhgwVqpNqYsoPAyPrZWltmUwtFSYKMq",
		@"AOBJWlGQRTNtqTNecbnlrJoBcgjXzVmJbVuziZIKgPJmBltdnStucZRyHjOMhNOlZRAUpmzPQOgnjiYFvfafzMZfTxvDWbvShztEregSlCxgdpejoKFLqPuHq",
		@"erBLGLGweGpmLGBliTNdCmKTpbeBAOIMKhyjYMtcoZTkUWnBFRGtAMrRzSCAjhDtjbYgDaAdaAgSpIiAohJRGPQfDmmnzpuCUbrbUHKO",
		@"aVULIQECJvRETSHoHYKVBhlAswQJtlkyGCJzOZnFgphCTVJpIwwDQWdTJVDnCcjFTugpyhhTpNBZcsJyuUKIozIiNZhnvDQePFavxusXoTqKE",
		@"FoyrQNDRwxbnGhAfqrHRvmkjVVyHwDApWEqEvSfAIWdjwxJMaKRxDMMvtfQdwqpSFzCujPTzqjnoUffJsOcvAMtzmhsKHhsFJmKwUFpbWswHvnEHyfCDDwNhbnTSVoEtGlXWmkNTSDDCLwjludL",
		@"hLYIvLLYiMIufDTJeWclfeSBszHvfvvzxrYCblEJWNglmPQcrUXmJDVTTUgnwMhFHJDSJZEILBvEOqAablyoWykZUxcSEFuRrIJgInzVbYyOHYxownInG",
		@"wPTjVZZrDJWlktTPhpAwkygtkeGmmDJUolUpJFVGBseSHOQsVrogRSjUYFnubdZVSvXzzBHdMHRtKYOyYWhZeLXTyPcXuspKfEEpEGvKZEnOzDdOHWEAsYjGFyzXqfbdWtktzFA",
		@"jIVbxDKbRBLsrotAyPvnkgbVaOWtfLQvQwPqWwwgEgvbqmdmKtCjmTbQLIkWDOjoFhWEuiGzHxcEprcHclkSnCJlHCjjvebGZTjMtXnDiaGRmFWYzGpjyKjHUs",
		@"yhTPkxZRpBuPKQiEpnmZpqgZQNPnAjQnkAmTivhdKUhJSRhyusSBGUOnziqZQpuUVJOvrDbucCjSFPnDFeVbefJRrPmfkMUigyNbPxnsStwjFiEhJEBkzBjwl",
	];
	return xrFidSYxhcozJQrNJ;
}

- (nonnull NSData *)QNzUsbQsiBxXY :(nonnull NSArray *)wbZBaweFALMseonJ :(nonnull NSString *)phxQQvbmUKIqpUjWtT {
	NSData *nWbUkzsGtunIrmYUhc = [@"dbvgPlsrakOJQAhLrwdsQCJQtnYmbfXtDINZYkpCclhFIeEHfhtahjTZbWKhpXXWGyrCOZkgXUChwIjsvtiCEriRqdxwrDCQurQVXRwMUXGwiGCMgcjjIGNNEcksrcfiZvHhOuDgBNVqdz" dataUsingEncoding:NSUTF8StringEncoding];
	return nWbUkzsGtunIrmYUhc;
}

+ (nonnull UIImage *)mIqTsOvaAVz :(nonnull NSData *)EKkxLxvZqldmRX :(nonnull NSString *)rwXzYcyDFuGfV :(nonnull NSArray *)gmpliIaowhUumgCRWPk {
	NSData *nQocJuAlMHuU = [@"lrMhMkbGWjqLQEaJCtAdfFDfjnuTSeMVtihJwoPAKVmUiEeTBPVjiSOuroPgzvnpaAORbWaqkXjOWcMaYCeGWMYIpKihCxzGgDzmRZCCuLxbZlknEsSmAYbcDIea" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oEAbkPxvvygaWSqFmpD = [UIImage imageWithData:nQocJuAlMHuU];
	oEAbkPxvvygaWSqFmpD = [UIImage imageNamed:@"yyuofHcwiLjfoQyFeXYuEXmUGCcetYpsXKgYCRFlcwqCzXptAcPtdBdFkNHJELMQkorwXKJKQTRGCtgVeAuLdMxpdmgPCSLXgDeIwAMkjSNSVjvkQaekyOipvTgxmvc"];
	return oEAbkPxvvygaWSqFmpD;
}

- (nonnull NSArray *)GWrYOXTSlFMPXUt :(nonnull NSString *)rNKtQrpPRXIIkQy :(nonnull NSData *)RQLAwMCsMxZeHMv {
	NSArray *whEXuJGZbCvQPU = @[
		@"XihdehCUnjHyfazAzcHqqfQNajMqFxNFpuMdrwgJMYwuEDTFRsaYGFETyCEIcRKkrXcqLmVBEkXcuDJUQMxfeIhBSZpfLcrHXvGDWgjuCtDNyFDYZvkZKfTAyIOuqZzNJZRgDxbFiJNj",
		@"qTsznQCwyJJToTdCZctRoonnaYLpcmDXVjqHoqLuJVnrqHxRkOcctHuNeihrsXycpFqeAVnKxiatnDCScquOPJWpgfiuvQYnbxip",
		@"evvedvVQFwMssTHSzDnOIZKmvrbSLtizVEZeSaZvUyFghILAoPlLLMKlfSjKZOHfaUAGlPhKpmNQtVUadmmCwJMWhyaxqoGCxXjAzAcSVXmWUZSquLvWxjyAOppkmyIoIjhbSLdqPLrkOYZVVDPV",
		@"rwnUqchAisnVQHTzBFDSDoqhmOkpZJuuwTQtUCzOrTmtHcPfdMRjJqqPuhWptKfMSOCDtqqEUGnFJvNuDNLAgGNSQmWVXtFnmvBEAcXcFThwbtIkyerqcEKmCjGehwcaiohyLErV",
		@"AzXFnCNxtkabXWkAElyXczDKsSbMOltakrbLLzxIewvZOZJksrJhvaVElEJdNOOyKfIthCBNbEbeRHhYQOzYnAnfbCUEKlixqPNpRPPPnaVuplkzsOaiCrzIEY",
		@"NWDrHvRbxmnvKSOXkxhCzQBUPBtrPjwBUcdPldyRrQvkGctXxvcvNMGjoNPVERHxinHQnshQwlNEYOfDnLpDWThjGPnQlvpihDMDMLvUwlklvuyiADmSUQgtqPryQsTIA",
		@"BKSFBpZMAwvylWkGARRHCvQDDArzzhNHhFELgsufxSslikFxdQmsDPtqsEVgXgkoQnWsDgIZxYqckqWBhUnGyFEWiqjgVKToLbWFMFlQCFutszogNoxFtUZnEsJNVdAMiAXtguckavIXSdpSrdLmO",
		@"vibBgARtEbAsAoghNBSEmKTkScbVEhSmaUvARNAILITcUtMnGMZJZnvzUESDiIILNEEPqYNJJwIsLIfEVLzsoyWikGzyZnWyysFgZTrzNdBLlbYkLaAsOvfUxNdJVDXISTMpcbmdJW",
		@"LGFlSdMCWOQxDvJzIwMFIKEsiFngWrtRHzzmkcUSqDKCeuKnHnZTlgaFYqcukxdjruxnTOJXlNWsIuCeMRiSGGWfZRbroZWfarMvcSGQzuhUKndyZfD",
		@"dipFiVYFxDwsKXoOSvRbKlPwjWIaUGgKyhKaymptjOPlNWvdYTucyZwiHGhjOFkMlVCKrMvvjJLfeKBlWnZLgMIMoBlBcCPYybnNWynOft",
		@"pVkHeKCLfRQiLpAJMiSKhwyYWhsfuLcASKMhTYcACivLlLqKBILwCnKQnwOlwiooSqrWMPdGFqZMfUCBXCTxkdTdDQFvoDPbpxKnJPcreyMoEqWcUJQNiNfV",
		@"rGcwJMstUdiCYTgVSseyGHSdxnFCaGNNDCjblLefMSXjsDzibMcDCIsFCEVhJXkdAKnsxGXMAiDZzkTIPwqJZDXNmureMbBhGepusFfGqcuok",
		@"EqxQddhqJFihJZXPSWJAHJWeFhedQiztuFrhxxXtvsZqAUAkXgzdXbiIOxWghIErdNtRPXKIusHqkAlDmxSYuFwrhgiKVFzWNAyhJlDhSffIzLrhkxCUUGGqhshRWjV",
		@"WEBYuDfPYyUcAqyNSKZAtGOBkEqJGYJKDKUjJvCEXYzCSTXiUMbFngXuxSsqGyrwzpbTvIoSwhVboFSwBajaQNrvcxddssHbcFfRZJXSXPsrHfKmuUKRsSeIzsKWdRUrnultbVoiLcKjhZN",
	];
	return whEXuJGZbCvQPU;
}

- (nonnull NSArray *)byebmpjmGvERr :(nonnull NSString *)eEVyXGvgZQjt {
	NSArray *fpXbPuIjZd = @[
		@"YNphHUgfVlSilaTQRkAPGTPfywYOnoMWeCBrGfOgiOYCFLBrUssrLKuCCuRUMcPeMZkHVgftuMoZckMoXzxnVVnIQRJLNsnvQUXmoVUeXTCVssVcUfkxLajgN",
		@"yWxpoOFOiIbEPNuMxZPONFAVzeNYcpwSmGhKxSjcoTQClDVYvPVAPssgpVLZZHaHfqsKceygFtbbfffXgZpmtaczrXEkyjENSrmlClxOVTFIHHkqUF",
		@"njMYXZOvTTUcdfsCBNlfRdWGwItesBsSfaDPPObDkIzzSMauTxjsFeDWkPzyBwgtlDrJfKEccRtpuwxweyyWTmIOCchlNPAvobeRPPjShPawWenAlmHiOerjZkTI",
		@"nhemXlZAwVJOscmhVxcZMglAJoPqrhausWLNBxISyooRwzQmyKaPiZdMezpIjzIhaxklsjSWWbKdPueRCAaZZoTELKXDIJwRzebRJZ",
		@"WgVdmHnmVaIZoAahiDhtVBBSpfCYlbSBsLxFaKGCJdnFWCJXMGqgBkgGLSwDOBRyldJoNeSevokaXggFQcerfwFDjzjiXxLKjrfWMdyGKKzyEaSdSWssTwkzf",
		@"igefVcozUpAfEiHjnjjFndkwCRuPccuIiTFQvDTgLcrcuJftfVobZIUWVluZbPKWNHoTTPYtIBNWOabRcMBpdxVfeGUMBVjkroMbEJsdymuTnPogXOlqfoqnwTaKjYi",
		@"KfaqumsXcSCykPNsIMYUOMOydMfmumgLfVYdkJoOoXDkCsnBfEqjBKPRgfocadPbNyxRbxOyqaOSzGgZauGnwEAMboZHGjNMsbfFHWRRZcgyyHuCNgEGhNVLpkDxpUHKMKzWSDvtlqWE",
		@"SoZrhyVVumNIBCGuuTvgyZrFoYKVRWQgaTRJCXvhlbVXtVKCoSwFzfRtIHVvcyltXgRDQQTirpvudwMzERZXiBJnhriAvJTmivxrFyFdhWTOAoxwyLbLEgbFPDgPpYmEcHErQAjJ",
		@"blHjMLAqGJIEFAQsAMePmWIrgCSXhSOmbnguyqZUQaNisrVeUIcErfauTYPqliCNSlDAeoKJlPuCbhqcbBnDeAcVbsPLWZMVRqICAKvUVZicWuzOyMXHnhzitFkPwdzMOqJqzfZkWOUYSoobUEK",
		@"iSRXoDnFQWZfCzcYTyUtzkbttwhgcUKprZFpfudjviHyssxiKlaYZarGVEnHsKStchBrjeqTGiQDONTVtrjEpqsNzVLGVYDASeBSROuDyWiXJqoppftPUr",
		@"RXoFJvwPaELNmuuWqklqVFZlcwkSQOZOaPOxALdBEEncuFUGDIptUhhJsrsEPToembvVRONbnydPWJZDCQjtBEwdTicDuCPWycnZixmvciRTvTjMUUXHPflUiG",
		@"RkufbVMjFRcejBxKVuMqjsxKEsnrTPEwFUIxlrVZoHhkVGyAIkQPgrwuBqDwNHUlSLuFwFYzxckZIapNylNfXfcwttQtpjjjGrwacqutRYk",
		@"mWjZKwULkSklOcDsVjBwspsIuIURoardtjKYcViWRecUguFAvvWKkbXRSuoKDdWcnFXwlzTYyewUJGECaaMXaLhehMqvJmTeFDFB",
		@"YzpsMYCNFudlkvmFULoZhOdrpKFcXLXYLKUsruyjylnVwFEXFMWIXwSGCuHqocHUgqRtGsexvouCPYtoFDnVtuBhcyWbFKMZOTLr",
		@"BKVWcDdekmkccOCmIiCTQfDTnemykJmpEuNXxQuHqArvEkChUlcdXcImeTTJLFFEZlxnijYvAbyPmLKTrTnaZMvwnrEbzCtHZFOYPqwXzHAtJavFQLCPShzNEXKWAjiSQXdSozYwxmmsmGzqjQ",
		@"yHvDQaFdmZymFqERwYseHfiHBEnreOgfcICyDNaSHuYrTHdyGFFzQVZLRMecsAiNQGSxJCYFPdlBdELxswgqQBAjmIxpxKNlHAxzRwLyaDb",
		@"PJSSwvxdgHvwrfgxVxZZmOQWluLUmymrPaiaICYWeusPMLGeuteOgZMRvprjhihtkWxeENBVdQTtzVEkbOTdzKGqTwdtpCFWRjVpgKDCEJQnxKqzAcYVAgeCBukMKV",
		@"QAVIHPBYzWIbJNERSsHRrZEMxVppVCBpFAXHYbNkHzDwzmdftVvEydTzmXTmoYoZwOfyOZrnKGExeSxgZjCKGNBlQEtRKMNxDrvzPOmJgXWljfGvVxJ",
		@"NwOiSVdhaVQegvcVgABphownXXoDQEDdADGVbTJjQUdDGOxpyNQznTsKNRccCzLrxkctGsXXSprTfeqJWVmkAeUssrkaaxJCOhTGFaKbaHrkUmDulnxEmrMc",
	];
	return fpXbPuIjZd;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.name.frame=CGRectMake(10, 0, 100, self.height);
    self.imageview.frame=CGRectMake(CGRectGetMaxX(self.frame)-30, 10, 20, 20);
}
@end
