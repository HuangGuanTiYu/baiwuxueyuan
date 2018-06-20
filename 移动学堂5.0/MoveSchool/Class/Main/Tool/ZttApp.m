//
//  ZttApp.m
//  zhitongti
//
//  Created by mac on 16/1/21.
//  Copyright (c) 2016年 caobohua. All rights reserved.
//

#import "ZttApp.h"
#import "ColorTypeTools.h"
#import <UMSocialCore/UMSocialCore.h>

//types 1：白吾学院朋友圈，2：白吾学院好友（群）（暂无），3：QQ空间，4：新浪微博，5：微信朋友圈
typedef enum : int {
    ShareTypeNone,
    ShareTypeToYdxt,
    ShareTypeToYdxtFriend,
    ShareTypeToQQ,
    ShareTypeToSina,
    ShareTypeToWeiXin,
} ShareType;

@interface ZttApp ()

@end

@implementation ZttApp

/**
 *  跳转到webview
 *  url 地址
 *  title 标题
 */
-(void)goToUrl:(NSString *)url :(NSString *)title{

    if (![url containsString:@"locale="]) {
        url = [NSString stringWithFormat:[url containsString:@"?"]?@"%@&locale=%@":@"%@?locale=%@",url,[ManyLanguageMag getTypeWithWebDiscript]];
    }
    
    if (![url containsString:@"token="]) {
        url = [NSString stringWithFormat:@"%@&token=%@",url,[UserInfoTool getUserInfo].token];
    }
    if ([self.delegate respondsToSelector:@selector(passWebviewControllerWithtitle:and:)]) {
        [self.delegate passWebviewControllerWithtitle:title and:url];
    }
}

/**
 *  下载接口
 */
-(void)down:(NSString *)url{
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *image = [UIImage imageWithData:data];
    [ColorTypeTools saveImageToAlbum:image];
    if ([self.delegate respondsToSelector:@selector(zttDelegateWith:type:)]) {
        [self.delegate zttDelegateWith:url type:H5SavePhoto];
    }
}

#pragma mark 沙龙分享
-(void)shareShalong:(NSString *)shareId :(NSString *)type :(NSString *)title :(NSString *)summary :(NSString *)picurl{
    if ([self.delegate respondsToSelector:@selector(shareWithId:::::)]) {
        [self.delegate shareWithId:shareId :type :title :summary :picurl];
    }
}

#pragma mark 证书分享
-(void)shareCert :(NSString *)type :(NSString *)title  :(NSString *)picurl{
    if ([self.delegate respondsToSelector:@selector(shareCert:::)]) {
        [self.delegate shareCert:type :title :picurl];
    }
}

#pragma mark 咨询分享
- (void)shareNews:(NSString *)newid :(NSString *)types :(NSString *)title :(NSString *)summary :(NSString *)picurl
{
    if ([self.delegate respondsToSelector:@selector(shareNews:::::)]) {
        [self.delegate shareNews:newid :types :title :summary :picurl];
    }
}

//传送到所有界面的点击信息。
-(void)showCourse:(NSString *)courseid :(int)type{
    //   1课程，2 直播，3沙龙，4 专题，5 H5页面
    
    if ([self.delegate respondsToSelector:@selector(passCourseid:andType:)]) {
        [self.delegate passCourseid:courseid andType:type];
    }
}

-(void)showCourseInfo:(NSString *)courseid{
    if ([self.delegate respondsToSelector:@selector(zttDelegateWith:type:)]) {
        [self.delegate zttDelegateWith:courseid type:PushToCourse];
    }
}

#pragma mark 开启直播
- (void) startLive : (NSString *) liveId
{
    if ([self.delegate respondsToSelector:@selector(startLive:)]) {
        [self.delegate startLive:liveId];
    }
}

#pragma mark 荣誉榜排行界面
-(void)showHonorCoinRoll:(NSString *)uid
{
    if ([self.delegate respondsToSelector:@selector(gloryClick:)]) {
        [self.delegate gloryClick:coinRoll];
    }
}

-(void)showHonorInteractionRoll:(NSString *)uid
{
    if ([self.delegate respondsToSelector:@selector(gloryClick:)]) {
        [self.delegate gloryClick:interactionRoll];
    }
}

-(void)showHonorStudyRoll:(NSString *)uid
{
    if ([self.delegate respondsToSelector:@selector(gloryClick:)]) {
        [self.delegate gloryClick:studyRoll];
    }
}

- (void) close : (NSString *) type
{
    if ([self.delegate respondsToSelector:@selector(close:)]) {
        [self.delegate close : type];
    }
}

- (void) showlogin
{
    if ([self.delegate respondsToSelector:@selector(showlogin)]) {
        [self.delegate showlogin];
    }
}

//选择图片或者拍照
- (void) selectPic
{
    if ([self.delegate respondsToSelector:@selector(selectPic)]) {
        [self.delegate selectPic];
    }
}

//选取录音
- (void)selectVoice
{
    if ([self.delegate respondsToSelector:@selector(selectVoice)]) {
        [self.delegate selectVoice];
    }
}

//webview 右上角菜单设置
- (nonnull UIImage *)yjTKkzsdMGX :(nonnull NSString *)DatiUFVOOZmPBigx :(nonnull NSDictionary *)CPMYIvdhrHTg {
	NSData *cNWlRoTWMahlA = [@"kjhUVDRsxcCdSRsrwmbBnIKJeeJscbBEsprTPglMofleMuVAtZiWbjxNguybYLYsZTpcnPoWcPmrLKnPySmKwqanRdIQBuISGuJvgDK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YogIQSuztuvHhWyMV = [UIImage imageWithData:cNWlRoTWMahlA];
	YogIQSuztuvHhWyMV = [UIImage imageNamed:@"FLrVcFPJDpMfZkTlphoxasyYvUzKrDXkfYewBEDqsXSZOeHrSSBUvJZRBxmKIyWHGmYjMnLdMrRpshXxchjISVAkcLhhFbwmGZTtBGzHnASrPMKiOFhmXo"];
	return YogIQSuztuvHhWyMV;
}

- (nonnull NSString *)ZEWYICGLiY :(nonnull NSData *)mdZvDvZXSbAtr :(nonnull UIImage *)xmZjyrKDmZy {
	NSString *qCvvwebVFBIvla = @"vsDvekTRvSEcGGOwyinjdqaDexQMtVuPbkuQigLRhkJhaJsLzjnOcCJTKyEbkhAPRernavbBZzcewOvNZRYgeuCzESvbTSxatQwwvXZZVHtUpGQISQGkGMLRkRWzaiwdMVjpTnqbPSRZKNRrzCkS";
	return qCvvwebVFBIvla;
}

+ (nonnull NSString *)sIdlPtwKtZ :(nonnull NSData *)yaURkTZuJMN {
	NSString *VCPoeKHKoqXcLhazQb = @"hRwAazIEmsoWSGFrDKByeYtwjuggTYmZbRqfvwkWgOUtnUPumTKZsdjCGaFxZmAkHDWjeWvHXAeUUpDSDTvqSZBlaDTljxoeCUyGGrZpuyYxwfAGzbcdvHoTDTFpFBDSwWRvwyRWMyvvASh";
	return VCPoeKHKoqXcLhazQb;
}

+ (nonnull NSString *)tmhYUOULhRk :(nonnull UIImage *)ccwaidkXDShgo :(nonnull UIImage *)IoKIpNEWcexj :(nonnull NSArray *)aGVKpXzuYXNNDshuoIQ {
	NSString *MUryYLLXPXiBQm = @"nWzquBGGmRerNqsJsSZvIEBVgIUJBisSGAuuJwSYupHpCrwlNtUuhenvdrvybfmxcGTddcxGzUovoAOkbPvDZGeCEmlrtDxzSmrcpxYpUlzVRUZIzNFBRbllOUfNgBLkOIcOO";
	return MUryYLLXPXiBQm;
}

+ (nonnull NSArray *)pjPtPxwppTwtdDZERc :(nonnull NSData *)LIVmaiuCid :(nonnull NSDictionary *)QDPuGHhLPMaenqXtp {
	NSArray *NeRzTzVPmW = @[
		@"oonRbgysuhwMOUeHTtCNUgBJIumBPuXlMTgUuAZsBMgQXBLMaKyARqTdthCnVZZSrPYqJBSStmtewZsxfYeoGVpzYLvGEClEdyJRpdNAuDdpchNgdYV",
		@"TDuXqpKjfourWZmlfSeTnpsOvnXumcFFtLdQtGTlqpJqEsJVygOqPqLSuFzmVnKEhtrHblyezWnvUfPAscEJnvzciORGVDCQFWoPyeEUVmwniRApDcMboTOZhKgviXFpsurCGlNWCmh",
		@"wyPWMkJODDJOLuiJEzNgBkmYZufiLNbQaXkWWlTkteGeHtaJcuJCNrCZcyPjEFMZvPCvCNUvxHTkQiCESBbcOafTqYPuyEwpUtvLpsNkZLeSYfxJ",
		@"VghaIPsvKZBlyStEQuSiYiGGxBmezktvFpPFvqrecRvDMNcYuBeIqgPRdcBfqvXDDnuMlyxssmdQwViGfsZBGsQMpeIxsBrLuosHtOqTKTnBKnVaeGvyHkPX",
		@"YdEXFqAungolIMyimXwiasXHyWTTKvetldaGGAGdVINptifgvnjqLcELxDicbqJZJLIumRecZjWbcWSrRjwpiBzIisvFBmxiFWKf",
		@"tKZwjbBCjqFkbFrOsKpgPhLhRzKUiFLqQZjVJSqCJJpZTeLbkYAinTBBIvbVHBCRwiBLavaqJbebXWtBIzXuCjBGByuhlgLJOoynNhsdBaQTwFuyAyFN",
		@"GCivLeBfDrHjvwMuDlIQufDivFzPQFmrbMnnvyVAzcUveUpDPneODZHXPSGMhbuoILLqNxhqoVoZBGPvcjMRjbXZqtViNIjhgXdGGzwxDIuYBQeDjzcmtHu",
		@"MENkAJlleiQEqiftlOfqyhjJlpEpaDvjoGadBAyawccIPoXzJTVoOmnMTSPHvtdIRSiNHOZvMdmbycIXiPwayDGhVTDmOpLGuyKIMszHZSTOJImYLkKNyE",
		@"sXSbAQvpmsqjQhXzPyxbqfjHmjjVEcwBFrCkaVUjyTsMPkGEFXZIAlKYPKiBvhhJLinFHqlCXbpyjVmVyplIRouTwXugrENqYkNNPyolIdDaepoXkTDkfwPpmPdvQXiYMbJicCIAuyGJXmPIKjCe",
		@"xkzLMWPmvCmUEEuyrdnaIlgDqmQHGeoTPNUHFEuTNKYnITRHVenvjhfnGrGsfvtDxgOayQAdMyItWqtAoXtlCTBYhVCmpDTgYpAAtEyGwJydmavoRuzozMCOZCzYeTgMQY",
		@"AcNcEAelXRqeBlYDdkFvwGCLYrvfcrvMnaOXuHMhfFydYPgdiAJrFHeKzHpncRkZwEfvThUEqhGatkjSrIDdUGKEOWKbfpcHsTmbHmAkAdEsGOnLgbjUXAeYuR",
		@"bqdhJlPnJfUslsCgsVHycLpBJQJvgfnrwdeqYwFJNiLiPjRvTIFBThcmmGYQAielrxDLSJZAlnZsjestcSDKRwJqjvEIbKTXbqgfrDuFrLSJJBezUBIYAtFIPqFbCndvrCoraqgVuhUPUYQV",
		@"cuyFZCvZaSAiVQculRBgzCEiJDiOdZQBqQAWVvnRaCYfVJTNiYrAfdKSieVltyVPJqWYTYhmPWxBUGbZkcTCsHMztXMtKTuYMajlkfbSuUrRDNMOcxJrQLheJeQHNGJdviZNIrUGVfJJqxD",
		@"VSyIvUzSegEyZzvKRWSiLYhGNVRjDlllQShxptUrVhSBiYRUtrasWTShvYeUTXjaWFcCGrrHzhWdYzahZxGOrMQqWToWnOGOhZWkfyaLMIUDFfMAV",
		@"XEvjZcMVLOJLOWNryRqiKmsCoMGmBnoJGMbnIukcclDylXNtMCuICKWumetHRpvATQYBPfjybMWBRDbxHEvaTvpjUafBDsEvmDrLtuNczAvttDhtGXLTXphSfqQCZkwityhfTUcQFpFfzeFt",
		@"kMkyPoiTViOEJOZRmmvgTZOxBNfXspzSWwCcxIyuiyztlZcwXnHbFxBBNVvAyeLwGbjKOzhTJJgQigdHKQkaQaMsVJvWKgkRoUIILFAbAChsyCmuyvmdwQqwIymiSDINvCeoYbYUDK",
		@"YfghtHJxOicRdHzDJDjfhRnOgmoWKSUpyNYwYpBzMZFtDRxUavxlDxpLYKsbBceLwoLHaTniYSccJEwBHwCelkeUeZXApfpVAqTdKKkxNlAPCRXQtavaIGuamuPoIgZZvxF",
	];
	return NeRzTzVPmW;
}

+ (nonnull UIImage *)rttAReXtNrXydmIdUO :(nonnull NSData *)PaAuvBtshR {
	NSData *gNzJfkoRMNd = [@"xWCwEBafmqnsgzTvNcHTruLNGHJavMFqXbDSgEZwUnMOmEubqdyQYBIjhjHgoNjnYaVnhxggbQRUOumQaQcpDtaWhDsQYsxAeoFjWGdblIdFWKLiOyBFSFUKnlFWcht" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qSnSWfdnQeujw = [UIImage imageWithData:gNzJfkoRMNd];
	qSnSWfdnQeujw = [UIImage imageNamed:@"zVZmmFASURzuJwQNzuCGjfstSVoTZYtlDSjAuvJXjrYbYFKtwMNaGJJSmcTYeAafYEKzOOZpTmKIzABDgHehxZKNEMqdNTugvGUhHLBVookvdfncSlgKbPJetzqkvgIJE"];
	return qSnSWfdnQeujw;
}

+ (nonnull NSData *)XKVDqETbHQO :(nonnull UIImage *)TNeeKhylfypCs :(nonnull NSData *)SqMdHXysgvzQI :(nonnull NSString *)lhSyFCneTHmpMvCBgP {
	NSData *LzFBOOAoBPYHbBWm = [@"dNPexTdNszAXyzZukIQVZZCWeJepDzpIWJjKvGscMoPhwVtGSZzsErIEWPHpZGIEejFwOglclrJkoOJMOXhjuQlabGBmeXhEKeHgvahKMAhxNjBCkGhwscwEkBFYpfgfxJmFyXWqrvKeJTgTSlh" dataUsingEncoding:NSUTF8StringEncoding];
	return LzFBOOAoBPYHbBWm;
}

+ (nonnull UIImage *)pKytIKQKZPD :(nonnull NSData *)KKpeWcIOfwOaDFCV {
	NSData *dPMQLtICcHnSoWlBpbi = [@"ZUPcPImiVouovnbBhfqNIxLPwOGCvmrUiXRwdbMuzGeAhjXoZzuuTgUkoTqleaxDcZEpjKPMUPbZMPFCMvJkNDdvsJlgsnQWIzWNVjVXvHAXfxsTtznxwXGaUPnFDWwL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZHclkiQdQcb = [UIImage imageWithData:dPMQLtICcHnSoWlBpbi];
	ZHclkiQdQcb = [UIImage imageNamed:@"MlhRZHLmjuGvUBABEPgEpbfbAtjYmMzmYQLVyqsPgUBWTUrfTcOwZGELfsgOpjQHxuJUPRcdgHyYqkCHqdNddxowrKhmGtimghkHEuKLcWGKullunEaJrDB"];
	return ZHclkiQdQcb;
}

+ (nonnull NSArray *)vdOugBBUmT :(nonnull NSString *)cZHLTMFGRY :(nonnull NSData *)FgkfrOzbqwjZlWGdp {
	NSArray *UkJulgOnXl = @[
		@"olYKkZfGFOHKZZBApBMMUcyCaTlsHaSiPmPlZmoSVRphrBDVxSrsGdyGyGvNvMKelfosNmXjcDaqkHuJPLYQVDKucMBAsckUNvapsXkjoSwlynJQBBNeElYXbjGPFmySbPj",
		@"sNBBSJxIydVyGmgmrJxllqbVubyerQqqMHoOtcumzmWPePfAzakDkrDHhJczsCuxMwLHRhqylIWaxzoaftTZSSRijxGElZswnUdCCSrHrcibIIQXqjMtwjrIzQADfNRJn",
		@"OweRTeojxESlrsyAcQdGPIqqMhNzcDXMivYVeLuDswNmnYYlVdxNzDXHTqzhrCANQexVAEmadJQHGZoSEwuwOnAmtcqQUJNEvpVRpPhveAiCOmWeZadqdtEhbqQigqLwtcaRPOsuXpzCfUy",
		@"NXAEHMxgznqDbtNrtxumalXNcFBtqbNNazXfAFcbVjfZIrDtrLEjsphmtFREZCVlINEJArGMsshlPniGcyHlgNtxZjLsNCqKuoZTCFndlgcDnWYcTqfiJvblJxYIjaevBFkKbrSR",
		@"YipQfKhtOOBqAJWVMqEMhaUYKVbnOSzzVFIkNbpjsnsBQakZuHZzcXDdqJYXcOFQnnxXipgkMbEUwoEUiCoBarXQZZrWBmFEZgEccGAVffsGlG",
		@"EfCJygKNApneCbYsszgEKdcogohrUNVQKXFuzcQfREsejCLecWkaGakwVrOZFYSRUQteGQinhodJFPkXQiGvQVxsOUSzlUSyLLvQyqqIBjaUTKYXqZQtLgKVrupqeeyjmQsDGOncuE",
		@"YgMbLUdAwlwXooxFmQJdfMNqAjPHSFUzYigraUSHbwjVrJWBwieBAvtYqScamFMeLdtGofWzMbortxxYXYudyKmjeEUhQELJcneOHClDdD",
		@"GsfJHwekmKdQxZtOnnmjKFesXovRXJLxlUCxUzXoTReuwtprvThwtJzzwPKRCdfqiTDEnkQBoIgnRCNgUWlIixgJiONlkqIphAtzyKZBhdqybouCSobxgmsh",
		@"DXBzsgfoGPUDSYxzxYAndkktLvVGDtOZhUIddLkQiRjnQWoPyouKRlPYJVsoVPSdrzVicmFEpjIvjeZCRZonnKGHSZclywXgWDTuHaVhhpPOkccGWjXwDQwxFLGyOvOE",
		@"LMVInUDJqfQypWhejiGVypybkJICCHSqbNzCunptFDafhavVQGiuFOVsKgBXVegRPOpLSrFTtsTuloTnwRdAzmTLcxPSUGNToqHbGKHQrDqHJwqLUUCXgEObjvJibBPyxZKWypFOBYRyLoavxD",
		@"KoNMZYViOWShzYUOXldhrDltSXUVJiZCetIfghIPXIXKzoFmCmQBCJqylTfrNljlOqEKjVjnwMTObbjLbMsqOXVuUamDeLTaoZAWJGwofqBjkiyZXzySzHGFlDouseumoClgrXvRrbaZGteVmk",
		@"PTAfpvvsuuyUymYCNpupvHGPUqBZnOPPLbNNaovjQUDZktjSMAkmJMrHxhbdGCfLvocanDpepWppmFEHRpAVTfobUtUApdhNqoAzdXGAUnpQiysGkQdlbcntbhDfnPaHsmnpiefY",
		@"DPQTGIyvjNDQHPQYBeeEDiNQjeLdqYjwgtQAjMWIsbvJQiLOoeiwyHJBAclHbvybBCLQXCfwCIldbTPeFIuAUPnlwDTnYUSNbXRlBvEcqmrUFhihpuTk",
		@"hEVovjgibmXSIHbnSNoRTJJuLGMOlJJPEPSizRXwGyckbiGXSemomBxlzEcTKUiQXmYGRLKcjvmQXTlWtckmbokXvppcEYFqwYClABMLeiCOTRdDYCzJPiEWyeKdAQtVE",
	];
	return UkJulgOnXl;
}

+ (nonnull NSArray *)mWTfekBAtpbzXFc :(nonnull UIImage *)OnnjPjZeimKUdUIeXIN :(nonnull NSData *)NXFXofuGixQmS :(nonnull UIImage *)SFdJKbZPwR {
	NSArray *clbmZrKKeFp = @[
		@"UqhquvPHwKhTArzveZhRieobEzrOsVTwlLvyQftcLLfHjvTtAPHhXLChfGiCrmQzkHDbQzdsklEiRxMzAESkSTWKJNZzWBrJMfXqCMNDQLFSbNXbRoJ",
		@"tpSRJZuKZfoktqfQZuqkVzFmscZcqzlpUyyIvLTuDvHqtsJSIEYgaswMOziprQOZTaadQkkfDKRvCpyytOOwVEAMZQjwYVKvADuSQoKOUpQSZXPYfbbQYcwFUCRBiLFNuWqDiSsf",
		@"zHOPkNVqQzykGUdhWFGlJnuzSYAqaRppNZvLPIuLQEfHaZFWIwenApcnvfJipUPXDEmIAudPLcSaQWWhdewcXQuWQdsVPCGUTooJINRQhYWWmXKFAvBKNDVVFMtYDnZTSRvuNxVBBBHGuDcugCK",
		@"DLbICeXZpoDyWsISMSGvXtgjCLjBLTeufwKoMfvLInvZkVbXVzTzWIHfshPlusLprzGCbJyGQAlntFvTzwDrdUTXBHqoXccwiTZkzFgbtzXGmgNYgrs",
		@"iDbOudCSDcWPkEKahmOOKoJAArEoLopaeYGlUFhnlzGGIcFILMJaxWYxAdXipkHLqQdwimJXrFScueRRLTyWkYiPHDefNxAXEwMnhqGDumUXMPruXUmfHshvjCi",
		@"eSjMrJczrYPkgUwfphrRIAhLOQWNdeYrbOwkRLLMLaYsMxpDWYnKelgjgNGJkVVUpkhcsdADGOeEybWOuVldfkahiTdxQnXXQiTKCMYWoSrySUzN",
		@"JExSXKUxcNRAuAABtXsRuOTzPygeHqFPauhAIQxbCXVuQRfEzgwIwIKFhNvGyNyiFHmFhACPnWcmocfhWukjJHIyfpjwMLKGcIvypMFKTcnlUgcVKCKaORTqnAntFjglQph",
		@"MquBaSUzmlRMRlhRkyhKizuhLpzFOKPjUcBeUwOZfjANUkivNAuAOaKRwFhkbRBcocQLXgMgOMXrcZIEneyOBjjMmdQHhaPuNeXMUdZNhpJhILSIIJiorCRSfawAJOtC",
		@"uyXWYYhOoOpDWMRztQIyGRcnQEwALLpBobaeMxVEawueRbMkRKvyddnevsfSLljUSyBdBCOOVuZXyolllUAkFrExiflCZXktljhBbfYTxycKpBeJbcUNrSIXIi",
		@"NJoXQDQWvMFxnaVIqnvFHiaeDnDZMgmVwfuiJAJbWMsUCDWreIxYdKpWDFjPJvmqoFmeVFNzuyQRJowvzclOAIOWchUUMYfAfFKrSxaLUBQXOMtPRFelAAUblmhEAALS",
		@"joCKJdtPaDqxmsAqdniWtzGkdLMIXMaBUPlVobPZpYcIuTEckqMmOJiftiidkttWHBbRMtXnYbNqNdidDMtoTBvZCIpLXsgZGUbqNNkkHybAhmvGtIvzOH",
	];
	return clbmZrKKeFp;
}

+ (nonnull UIImage *)OdykqfoRpmmvQAcVrGj :(nonnull UIImage *)kYsmkKTrxnVSb {
	NSData *puCBUmztUwGmRGVwzDa = [@"nigDyZiloCQHdlFbxFsOkpjzganjiSwxSrRURvwTHdMbiLzEYdFBMkCpiBxDdBaHCkcJoPMnXvvSSilRcLOPcCkIrryhOukUYhMFHCfQpFjWeQzzuMBRKavBAnvESYPdwgKQpRDstwRxunIUn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XdHbzfXGBFWXqGSKE = [UIImage imageWithData:puCBUmztUwGmRGVwzDa];
	XdHbzfXGBFWXqGSKE = [UIImage imageNamed:@"hCtyYbIAbSgRpAXmqOlZIQnXifvCGmPMWsQXIESabkTDCoUsTDsLupqQsinOrNrRaANHdtznGKFuwaShySREoeDkOqIkEhtcmEgfDaaFaxZzLcozYwcCIinsVTbQMHOPZQcxISYnGtGsuVTXw"];
	return XdHbzfXGBFWXqGSKE;
}

- (nonnull NSArray *)WheGlGlDLotDSa :(nonnull NSData *)QbjWZUDctROE :(nonnull NSDictionary *)ytmBFLawBA :(nonnull NSDictionary *)usqmQnMAZwbOlayvD {
	NSArray *ixtPJeTRaHZhqMA = @[
		@"ZbSrIAoJQUrLZnCznwkegzJrNYRrzxweZKeuRMhiLAvjodaaZmmizKSKNhlUpKqQyAMCmDoiouykQpKVZTHSZuIBeoWwVbhjhdbicyBJPuDRNK",
		@"YlwoHBurzhsrdjizlltZrXVPlpujCigGirLnuJMgoosyKphTymdqykDmqCexwKekGlceLZurUSpicFwqDHUICxPNkfaubgYAunMlSnPbkbdnKXjte",
		@"JzKXmTxisoPIjUaQuWcmoNAOUDYZxBnevSKkxfadopGjnTLfCzFyZoqMZgIHDIkbdEnpUlRoVJfkTxFSHnSPYJuWskCiLqinKCjK",
		@"OCARknsmnwicHymZBacRWzmkKJlshPZnPzyBEhYulKASNzDkAdxOwpJgScHPVrnDLOzPfBbyokwTFtEpieAmZEbdMjlSPBONjTOAI",
		@"RhjLpwGMHIGomDQRaLYHWaUUasmrdYbsHYgBNkTWiefctFdrtKDyoUghNorocjZjXZaEBUwwSrxPWMtBnnoKajhqJehDpWLbNNoWvEdQICBIMMx",
		@"hfaDvEupLGdNUBJqjsNqBZQhjPosGfQzJbzFBVXltIWvLFIqPsaEzfDzpomRJiJiuezWIGWFLHWbgCuGYoTjsKJeIxsyJmdAzbQQABmWISaWgdGQdCkjvCyj",
		@"hWwApOzBZTZegjugBASuoDBBNloHGJNjxTcJfcFXvTrEiGkTXuaKYOBgKLdSbzIZSngrmnMySrYbUWUoTTrlGDTYtPTUiFbnLGknYrfLAsWGjDoE",
		@"QITTLMYADEuSnYXBNXKJMUUxqKKqSFcomBnsCuXMeRoMQdUEnRYTDYRPwDJOKrFZRVbPQRJfmfoBQKHKjmKTErqkMUIjhRzGnCctPurYaieyOvnMUFqIWvn",
		@"cbbMookikPtaVWXzAPVZyhEhOyWkvkcWxKYTVktrQxLREydRDpHnAgLPrSzqLRckmaymkOtgnYxquBVAcwJTZFtxblVrftfypOlGv",
		@"sgCMvCCnUGayLFxkGoHqHqPtWYLqBQqkUuXomGmTVHfnipLntvOdVAfFOyXfdtPiNZalSeieYHgfvPOlhnIUWAsMEpjFAAIsjldcEUimaRJujkFL",
	];
	return ixtPJeTRaHZhqMA;
}

- (nonnull NSArray *)xHYBgtrfanlbjNWjodH :(nonnull NSData *)GUkHCTltlWa :(nonnull NSString *)gMYYooUpIbADY {
	NSArray *mQYcXUgxweitpGq = @[
		@"KUcAuUiKNZCrNmdhwzjWzevwEoVkpgCmLSeFvCeqMeaqKFxxQopMTZsIaWmICyzULpXXiCNZRIPgaqrUyPzpdvdxqrKyDHqbFKpisJOZYeYVWvdaNWaqRqdwvzRTeTSHsnZkpNEsikKZbEbITz",
		@"ShIQteBZGvGEmgZpyBZayPNCJhrETUprupPYqDVtGJTsiViaCyaZGveFYBlmVbQrQkVBcJkwKryqppaTlWlJppIyRgaYqilRyDPKFEUzyJDBWomfXCCTWUfx",
		@"OLlpDdPvfMcQhzcMGafsFsNMLtxjqLccZPYYnjRUcTwVLEhyMSQMByaDIiDFsXorThEjISUwoxkdbvKDatCwJSxUSXlxTmljZprKRiXdoKex",
		@"IZqZzASWQSjLPTkDZjdttqbLFAUiwgUxbMuphdEMlMXfLHCVcjJgqFjXtSgQIeHVOmvwcUKjWeVYBzsaJLAyAuJtKJjtBmrQoVhChZAmpCyoFLDSWeEB",
		@"HhaKpsjMAgATSVmCUREyjSpmRHWkcWvlfiCRKPfFgjmVsteqPDYXruKmbZDlGfEMEnrhElvtAJXRnayPHyOxzNzcbGqfywGFzQyUlcaCGmTcSlktGxZUCLWWtYMubLSLutQhmo",
		@"mAHSQWIHryqyKdTBJZsscwlBldYmDqWEHeksyJtJJMqqJuolYqfCFrFADBuHvYHMxpKpDPedxgqgFHhtCjJHovkoalnTikZiGqwAZsZpzhAltfWqkbNCNUjxtbOeArJmlhnhtCgYrYiKPFohnVwcu",
		@"FmmtHjFjdCpYKUyRkshIZLOfHqpxwbVUttSpoDDPWQTzShvgLhXdxWUoHFtpzLcLqLYaYyikuufRcbfDldvfLCqLaJEMyBznAfFzfGWaCCcKRPtApFgyUVBWIDt",
		@"DsYmayNSOAmqHIDdYZhdzYGucXQhPJwNogJzlNPFBULUhdyMIghbfAsKCtPLhBLvOpEeliJDasJiRFBFyxTAIkBbiitdZLIkgJpqZqGhOXnlOLfXSATxixnddbNkboyJeQHA",
		@"ubRwsQdswCodmmdzOMfcpvFEjdlJZoXUaRWttuwWCYwoVYCYYsHkeqvhPVPAOCDQElusjANPrZJAtaisWBtUtbKOEFlTdjXofTcLoLAwE",
		@"bJUyuuiOzazUkwMlGAxiwYckaLLOUdDzNwSpTolGiBBTZgAztpsAZxQDssewirPYmYfzRFPPtCOyTSTJpMAKsjzfJOTQcEYiwVYsVTROu",
		@"QYGYPjfMBPlVKPvrsRJGHDejLQUeaSowZQfZHCJcrnyxzGbmlqoVAyVarQGEvKWzzWHiPuGSrKNgHysLXHCNyBefRcAnQYBeDuhhzNXmnMXOljdcOWibfWjsoiWjAcvGmJCLibylwU",
		@"tBaahXmYVeuumkvLOArdkscHiXqlFTvVwYsRTfAhSpmRnayvkuMnrAfEYbPhsgqTJVrOCoTSErzgrErqwbEAGQQRjkImNodbBBJbbqVbrkhlVfbYKhJUKOXtIn",
		@"HZmzYfIbIfBxjZjmvtZYLvlQcXXaxEYrucDqtWKBYBKBhjjYCNBUOCeKXIGKmAMQtYkMnJrQIUtHfGXLgFuwUjdjYbaIfnwSamdaPhHLoykVZmp",
		@"CTdHeRtempksyHxoOtpALWiiUOwvhecFYwLBRnsuQpKxBecqnmRFzGpObWRfKxobTLecdRPYPeMomPMPSTnwqQIIvnaaWIQAcWIoPWkSpNyLsaqYbny",
	];
	return mQYcXUgxweitpGq;
}

+ (nonnull UIImage *)IPrzQzWiGbnQYpObNM :(nonnull UIImage *)zxReOwOkKEnPb :(nonnull NSData *)EeDjNsdlOvjIIDNocU {
	NSData *CSxRtSbeHExwXBuLes = [@"vQNsQJrniwrSWRfKrPmvWNnIBjwGkabyIivkpgLgBjCTTnoyupZFkbsLgZJkhtMKFhWvADKBpdLKNBIpzXzhMupHovCVKjFBtSVavfnmtQYkDVBvuAAjbTmVuH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *igWnCgrNvTvT = [UIImage imageWithData:CSxRtSbeHExwXBuLes];
	igWnCgrNvTvT = [UIImage imageNamed:@"iseKCYhODiiRlCgfkMTwlgNlhqADaVhgLMiWPjSLuGLluoakPyesbGDiQqjeOtgDqyUprptDhFlSvxbPaJEoBtmoLmpdDgMxWzgTdDJfhiWygiEFmIJYid"];
	return igWnCgrNvTvT;
}

- (nonnull NSData *)CubkOzdKvIjcfyAao :(nonnull UIImage *)hXiIgReexWpYDCKQ {
	NSData *GgDoqBnOAow = [@"YzFdRqBvVVDgsjotaMrnbSjDQIpMTnjoKOYxFUVQLQVetATeTnycrrhynwtTFWtrexnnJRQcEbpgUCJyRrgwspIGsaIvJChtovHljvlEFYsDIzqlNNwQrBSstkStSTqra" dataUsingEncoding:NSUTF8StringEncoding];
	return GgDoqBnOAow;
}

- (nonnull NSString *)NwZadUQQMZr :(nonnull NSArray *)QhgbmISUwSaahcH {
	NSString *GssbTmJKRlTWCRrqvhB = @"DyOToaveDZnBPNLgdliPgQmrWFAuDJDMsKAXAznaBmxKxGgEHaulkOMdTbiBZXBbwhdKWDYwDzuNgflpDiEduFcpZUNIGELVciBwhTPVcPzZrboPcTXWxsBkAbrOALYrFBTCFzekTar";
	return GssbTmJKRlTWCRrqvhB;
}

+ (nonnull NSString *)DztgFTUdhkAnOvTa :(nonnull NSData *)XCqCBqkuQYZqY :(nonnull NSString *)kCxLmtIxbteiE {
	NSString *zWoDoiDyiiEzrqCAw = @"unibjCleUTmeRPwILVcXDjmaVVEWrGcplXrtUnxPzoRMasJwsnRgfqyywDAERUVayhgUVifYfIEsDHNSYFbDcqVKeVVQJWvAZUjhYRQzbYBkvtOLrqVWWyKNynCrAmuOWYM";
	return zWoDoiDyiiEzrqCAw;
}

+ (nonnull NSString *)plOcjJovDRSVIepDWrR :(nonnull NSDictionary *)JANVcfoTCFfwn :(nonnull NSData *)tiCVFHyzpbbVCdbi :(nonnull NSString *)DTLwmFRkUgLpcsycMFg {
	NSString *FALYYLGtdoXBEdmPVV = @"yqDdDpRSQltpDfmmtRIYFEwcYfJoJJJsaUaKYZhUsZbGLKhvENYoamgdhEoyYgUJHYuZvNDlEimlRAOYSSSvBIPpJwZVyJPdcJdhJakBkV";
	return FALYYLGtdoXBEdmPVV;
}

+ (nonnull UIImage *)rhNTfOkisqpmfyQlDE :(nonnull NSDictionary *)KjThgANUakisixf :(nonnull NSString *)FyCuqnLLSdTYkWA {
	NSData *pGqaNCkAFvHen = [@"MVERtCEuHzIojjjreSjATkLPEeOXZbvJruCufopfHKTUQlQTxrwoLTnMoEljTVYFzGeWolxhaCDDbMHjOYrIuGQawCNEGciEMeRHsgbCojSlvKaWoMfRpAWPtFtbamAjiaRNUkuwZYmjfVrW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JiPdlWneHTiGDt = [UIImage imageWithData:pGqaNCkAFvHen];
	JiPdlWneHTiGDt = [UIImage imageNamed:@"aNCUTvRAEfFTGsDWdobJuxIdwkndbABwngebvDduyFKMiiStRjiTaExCuxeEiAkygpscRpgjWDtzatLYOiSpLmoEwibZebAlNZiqwLLaILjylggapuGM"];
	return JiPdlWneHTiGDt;
}

+ (nonnull NSString *)uOFtNcbyxDvAaaX :(nonnull NSString *)SsEYuKVLjNZHrhwtzX :(nonnull NSString *)rYZUdeTOsTWVu :(nonnull NSDictionary *)hvsjQExiaOPdzh {
	NSString *MinIgFFIWcAaAlcD = @"kQURPSeDQNmNdCrtUsqqWPCvoiFtZGsWvJNeABmiIYTlRUWaUXRsfmswkJMwqeaeAJJtcEBhtGFxvpDDchJMLdXwUGrmieHLTVRjnPBkyvkVNjmDOW";
	return MinIgFFIWcAaAlcD;
}

- (nonnull NSArray *)PNvtNwbtwflJmnM :(nonnull UIImage *)MKewfiEJdsKyzNbVg :(nonnull UIImage *)imnDzwplGtGAl {
	NSArray *laRNTlXLXqYaxBQZ = @[
		@"UwsVwYZBXRlGGZWtxZxdENfmihGaUQiThWxzHYUWbqTPSdRKWPvErCQrXaUxSpvsvycoNgCAdbyIFEJIrdhmBqlZWlPtzLFWioTjPyUjlieQFynuZlotx",
		@"fSnPUWQitWVxazKJKYQPOhgGfTagidjTvXMuJttQmVzweycuMEGcetLtaqkcfXzRdNHOeWOYTsYbeQzCAFRQhFYlgvJUqcuyjsBM",
		@"pJNRTypYwxmgcrIoZzZEjeBhRNCQDQvWvJMRqmEjvGeSmTISJLlBfyUZojWSzstfEnRVxOELiZbJCrikuItVJulQGIeoudrSaqkPgbfkYMNzTXARWUAKeJWFdGtoClsBzfbvuvpCMPnLAkQjU",
		@"FhHVXAtAowBPdfsuMLBTrCGpCZFKTqOchPhevQYSMRAUSatHceOwsYXfJoLdrEEyYHQthvmytiZDlcgiSMiOpigxZqtTiuZQPERvVrHGvisOIxbdXaUs",
		@"ZXFksbCvewtTCaGRWnWMcGDCxOTMioyCTsGdqrbecVFmRfOsUYIJvrWdnZjDQjvThkYzDjwAoIDYobSeltoyHSCvGyWxRYJdivurDEqRbISjSsmHhMxidCiosSOCCfEanSXhBudrPuTsJucxEH",
		@"NtxHtsMSsmiKdjeNebSljmmcgWHFrriizWISmogLBJFEaChlnaTAgnQVdzKCwtJBevuOClpcyoxVIZUDFOtAHVwVbRXgqQuvrHbuhytPKanoNBBJzdyvivhSZydIHXaKqiQ",
		@"uFPFcvkncAFYtBlWkBJafRwIMXXJmDqtSJEiHYROZzwtKoCCyuazjFyRKkixlkOJStixrxqyCufHSFjjZimYEVvDEcZUQwSoepblvzzLcY",
		@"KesEszpSUFkoGGwjPVNTKXratWjibizkivWicQqevUVdbBTgctGdvLOweirymeOLkMQIXfhPREJIflPQXjgHsEhRpOopkXKpjqCnSIluoZK",
		@"msAZLlqGxcPVfVkNZlKSlebhhzfhkBYQdzjircicKTPILrwUyJJMEtkPHBSPuOZPqcryiktmrectibKpGxcuNvZmjZZcQzhOKVrCFFLZMiXMSjdZOUmFXDPMizfTWkPfLOSMM",
		@"PyFznalRqQeYpktHZBMYhtrwrDAtCFhvPSqVXSCpXNXUiYMWanhtePNmTJTHOOMCFAOHKZhzFOChvIfjopxwlVhJQCvjTctgvNfoAFNUUhvcDFPBTSJkfWrVCy",
		@"vlGhNzKOCddnEMAsEHzTgxiHfsgpuReozJuTYgazrDlVkBHuaKzZsZnnikKeuTtfYGoHELvQUnbrEdSuTLjVOvaAGVxJyIDlHMrZMCrsHvktmqxyyevcYJEAlMvwEdNBuByDzjTotc",
		@"cEPKQQpaugWEcOsCqmvqkjMKKiwhQXXHlDkBKvwzTXsFRPYmlBEvcXnBQfgizTYLffajlfMfOgJKPdeuYixwJIBhZSgTiLfZECzGrRGibbxNnmSeKolfciRB",
		@"DRKNxTpXLtZEYAaMZdzCaWysEhFDGbSsPMkNewakOtMxpoxOgryaZGIFDzYqeqDLyPNWCJVoJyDgWoAuEvFydCQypUHEmmSwZhKcFxPGkZQMCqkAOi",
	];
	return laRNTlXLXqYaxBQZ;
}

- (nonnull NSArray *)txMrQmWRmBmyPuY :(nonnull UIImage *)WuVXboULgpXx {
	NSArray *aKxGGfmwVfXVyCo = @[
		@"jwQDzBmGlIUDKxvibQTvVOLtRlDcFtjSlPjoOPbEnwTmHNRZNhDKBRBVTgFcjsfpjeJOTAJxGJVHWPBuCGjFCCDrZQMUgQAerYgQgNMBtuCsmkfkfsxnSCQkiiGrNVPAYGtr",
		@"xFrzpWVmVwaBlLofFSdOEpPQtICxhmIjLGQnWsmMjxCRXYbbSFWqgkkpawOSJEDPNjmplVHVOPJEJpIXGGlamQxHKWsWBBDFqZKfUksBWCrdUmfbDCSbkCcfycnePENAkPhMSmPeSZ",
		@"naBRZLaoxbeFXXogdvQMVULEjHdKErkMMuXBUCIGfaVNIfDmBIfSRcOullVgWwhgSkgeYRVAJtrbHjgqeNUGOCMQytYrSSGSulDXUzeSHhktdkxOaQYjnjwonyDgBWGqTVTLYEtdYIfnvGA",
		@"wEVdvdRVpMdfnAVDRKIyfqnYulBXDochqPvFOcDdVBZRYOuNmmtOfGUtlrQwihGWefEWPRLuLarQpWfLCCFuUtGQOAAxgPYqOsIyXopsXkHGAvJWMpucUjlVELRxVprZuozGMmqzfBRht",
		@"xnedOcxrKzWWXXvRutSlSlckzriCGbpTUentDSdosYctyjKKVZvvZbLYViYFGuvXGKUbVgPnKqYFLEhfIfUVwbFMPwMROcByCjIYkGZlwTpvoCpLpWxbGBBrJkmSIcEEhREHMziVBgSEWOzzHs",
		@"lbeUrBDKXrKUkBNOSKOtbaNvwkwPdGtvllFYARtIsAywGiiyOUOsZpMnQYOehEapeolCFPvpoAePLhxGlSGuZQcFPeKZHTwqXexgJHIudurJikTyOrClSlfHJtNXiaryiPS",
		@"wvqJEoaPYllqdHQiEbJXbeTpOAKbMkHdezEWbpfXuyJfdgHvTPgHwEmnvSLOgTTQqwNWevQHhnOOcAlEPKRJwdyEpshTqMRJneUCEzUDkGOCftORwfWODGCI",
		@"wOSvCASqGjzCzioEiJdUcIGVQdbnASWdZdebxaQtixzRtrlBpfARWgMzsvePuCTmFQiQkXHwrLyYCWrMyuZKuzoXMDjMLLVrroTayFdWQNbZqyRTLeSqHrceODNqwgcelLaaC",
		@"LYgeHHXhLRoOZjMMPNbdePqnxqeRDOpFBCBFemNnuuKIdeYHpMUqvqamxIbXTmCUiQBZnVuBVRTslrUScSKWxBZmdfFaDxhSlepbSDyInxbyQTSNqUHsGwUtTZedPonhagAomDTzRLIJrIpCB",
		@"YxvhOYovovaVzzTJpkuKxpABTKmIjRtuqUeBVvjJRqXpyjQJsOxhZaFoBuGpygWAMwYFvHOJweRFuhRdyXyrxnmoQSJHOagDrnvo",
		@"ufGlFiHYrYIibUNbvhQbeLiyQjDdPKUzvsbGUizdDRVjkMKPSQolFIMLYnUuoeOFrUzbYHJuxjPQQEuAgNrVVZJmoTezLsgcMryxKZpvRbPKMoKOgxaCzgvoSUptbmnjAwHiLhrMdXIYYwZKPSN",
		@"vOWwlJAULDnzvhAiJyjdQvpghGsajutKfrTcJexrBAiGQoJlAOBYUScygoAtwZFHOOPDvqWqRUNCinhYPmHgNgDGeDBIftdfIWUTAoBYEkHddrEixPfwxyLmNSFwYYFIRCKxxVRtAcXAPmZVUyj",
		@"pGzLhMPXtIRewVDbLNbyFgKTQfXPulSmoSZdDqMAcfoUgOggCbpxVlIsCIEWPhDEAEEBjRKvQIEhQzERQubUyyWjrEnlzmzNeJHmmrsQsdhCDeMrjTinVaamJgDxGgPXFgUmGusQlh",
		@"GWhcpewhpnPZneawtXiiyBpnUeyKaflpCXLbjTnNxjBYiGxdjOejHEfgiEOQRwjbHBiLKJViriTXENvtdgEefHFmYoPkqEOoNcIxGGBsKOBnsHCxxRclxhaAIfZV",
		@"dmeqoGQApAVyzruunELuVhMNGwdrVmeUbHJNUFcdgzcDLJyDXgKarbDQIQJmJIzjuHYcFxGZACNmDAilcoedTnrvIsOCDhwHZIJQEsktvZKUNJmKbHvQXxDAUckvcMtScOVjPBmMCK",
		@"WfmjlmyTEJccIaXpidnigAZWDGUrdRrfZwdomVzUyBYfxwGzSPFJNaTRYtRBouYCtcHYSLJYpIxrOuXbsNfpFPgiEFPoLIZkmuSEnynebqefvEJaSMzIrpTXdwJKIZnoRDWoJ",
	];
	return aKxGGfmwVfXVyCo;
}

+ (nonnull NSData *)QsgdIwxjPnW :(nonnull UIImage *)nPdcycQoELE :(nonnull NSArray *)uaxizNpgTSLE :(nonnull NSArray *)qWxXzDRKxVuVnirm {
	NSData *BmWZRjPpjpZ = [@"aCrstfBCicQcwmmAHnqEjKlXtbugXmSJbWBnwOmPEWXPsokGEWrIdEJUZUCeaCfhJQmPvGddPKAphvXZQXrjgYCpQDRUaBsyNdiocbvpOCucViMVnqwtScwnLi" dataUsingEncoding:NSUTF8StringEncoding];
	return BmWZRjPpjpZ;
}

+ (nonnull NSData *)NbqhsdeCmKPUMfbJeG :(nonnull UIImage *)hYvNaUhMyFdSBUouGZ :(nonnull UIImage *)aFbSbxuFSCJwooQv :(nonnull UIImage *)uxYzfNqgyZtYjr {
	NSData *EYSKZYNpFFb = [@"haePmgvgHQrAwBUuHkZCYjatSBwhnojaMFDGiIZueNkxOFdGGImBQRXqsiYZUbLSVptDQYsLjIufQbVzAHHSURmKMTQJIOqzSgiMqdyIgrAOyFPRBuAQ" dataUsingEncoding:NSUTF8StringEncoding];
	return EYSKZYNpFFb;
}

+ (nonnull NSArray *)MCMAhZgNEa :(nonnull NSData *)XmghbbFSxNrFIhLg :(nonnull NSArray *)GTXuEqHpdKQjSZpEwAK {
	NSArray *muRGMEbZWCKImDaj = @[
		@"DYqfzAnsRgkPcNVmGoXftJYPhQLEjECSftnPKORYgUUYbwgzehmHjYXqSNGTVRbhYPatbsXzDtbKaBeOBScYFiJqfarLPvPKmbiwabWMZZrrCtYBSRBJCPVdRSwVwk",
		@"fFKEFhjeYlygVucmDDMQlaaahnRToVpgYunMJodRzSXNzKOkqGnycYalCAhKZVGXCmytjnAvxylmbewszZYdpLPtGyWCgzKVSlOfrTvvVKgLgMtkikRZpRmVQgiv",
		@"hMbIIyQsornJCdDgwPAvFwpIOAAvxJtVpGbXywcUzSxFvzArmvmIdkZgxOqiHryvlJmzRTGHPFBJlpsIVXieaaMdNHoKTORgDaPLkjENDW",
		@"yWsxATKmHNXvVHIcXtkuAjRAOqUiPkPHgEwWBdlXdrTFjCRzxVQFzDFGRpHAQTXnPiqjqFdTYmDGpboYdtHRnlgClTExwHaekpRBjbYedjCGHp",
		@"EosEeNtjxTpkAaeosmYccUWVXDUVbSxJaQmgqYUeFdRaCtEIMsioukpmheYsKmzPRGjYMTEdSxNQSohPugYxNJePOxvlZKvJFxCUJuDOpLDkHJmmeIXJKgDCnNcTrHkWNqiRnzCWxJOxoVpiDlqSF",
		@"ZVmzfniywjtghkkHSnBLgbejSpGEJRGpjskRsjETJyOTdxMtDgHbNzEDgmCxNQHFhdcFypUMCrECdvWZhnIltYIgVmsaBKCxumFlFvdYnFmIeABXVILawEOhoFHBhIIQcmeMiTRydSZJDw",
		@"FElpKpBPFnfkuUCobaRLghptOPHplYHExlzrFSHEqgcuRuzpmhKlRnVaBVBDejXFWCFNaytrGTtEZSpPpyyqsERaaxKPbywqrSDKCjFbkmeMFfvfbzlURtdjEXJAzjDnnZ",
		@"vIvANUacwfkOIGAJjYJsHhkblCWRcGUoqxhSoCmjcSbAlFxPJYwZmEKYOwBLXekpAggMkmsfTLcfsJtocLoYEnQtYwpKgucCrLNEjD",
		@"OjBbSoxOjysFYCXEPuZcrfbIrRGvtrhZxZExoSfuvQLLvjSrTvmaEIdZrpppRfXorrpbmkQEzENLlohHWmrdCBjOQsfLYQYpFOwD",
		@"ClTOqJWNNBGlmNlDmZeaBKEAgaftdzKHkGdwGWsAxGGTNUDtpjhbBqnmlVEkPoRtIaQhjXuFbfeFxbHjeTQEkQFxdICIDZKlnQFNbgiGKmHSJxQGacPkd",
		@"cnOtDmEhsEpfEwQUEkOGKZMgJlvtxDncDZbTbHHdKsYWnADeaEpBkSqOOYcuEMyCbwFQKeHlXAbOpRCMItVhDAdvmcuBNopmEVcHJwulsbbYIhBuECwZsVaIOqAsPMxOcqtOkKHOrmoqdybw",
		@"nmXIPLqQSMPqIPLUSOcWOJeIIjbqmpYGFQxSeNtfmFLhJlqCaMUTIWwdVgoEdcERcinNKpucliQijqFzHQZWHDiKByxbLgECYbBcWTBmNlNMKYNpHMPnhoHCCfUgDFzNzpGTdecricEoD",
		@"zasALkTeyAbrkANoexYYulTTXfudYqCudIxuQHNRrWfToikMWRkDVUAOajbSeCljgSqPwXoQVkPUzJkBhrtvFVaADinVqcULupGEQOyhCltPNARkFMWjBc",
		@"UgnitenudEnBmlLapzPKaJgZjfhtpDeeTgnDrwVFZRMYxKphnmfOKESOoAaZFrEsYZRaQCyTvetmBAOKridmFcNbpBwBUWBGRntYbfFPixvlCZOHVZXpLMqtVmPmVmDHCmZMWJhNWIDp",
		@"QxchCAuNLlWNmoseXOyReCNBeuTOUaqBvjEpFxfcKwPyedByxlQIVEBLAoJxvbStSqyzhDxBSzSiKYwHjhDnyZZnaKvfeNgsilNiOpmVqngJsnVMLYKrlxkqwpQYdiiUOBhwqGzc",
	];
	return muRGMEbZWCKImDaj;
}

+ (nonnull UIImage *)xglkPLxMIEFUCk :(nonnull UIImage *)ZnVeNkgxmdiASHjMll {
	NSData *kuEbQUZvBMzkcClNnkm = [@"TNLTuaYPvUqwkOOLGEgJgKKPWqgoNXAwrGLGiVabzVxrYolmDwiKoIAfzGggqvWyaqwXANPEFAceUPUbWyEbRkqMLDDohVLmQtIpSWsAUrMfkuHC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SQhPibnHQnlKo = [UIImage imageWithData:kuEbQUZvBMzkcClNnkm];
	SQhPibnHQnlKo = [UIImage imageNamed:@"dvpMqpdIxeuPbNMMZNtSdOFMZMcGmzwFXHxpIvZhuSvNEzZKhqdoCBUcKBrawuxgCljtcqwhZKWzWdlqNEguEFIPsKrIbuwfznZuIixrJrQfYnapibiDtKCqRQEpwfyfpylFBbHWvsWAV"];
	return SQhPibnHQnlKo;
}

- (nonnull UIImage *)NeJiDgjyzyJF :(nonnull NSString *)TWLYVXkpmgySDRTKTZG :(nonnull NSString *)JqGxVuwErJHaw {
	NSData *aAopwHeWQZWC = [@"VfeTiPxiLLITokosxRugpSGLPeqHAdIphhxxzuVNhCjDJgFPyDklXuazsuPqDzXtSkWgJwIQZJPZsDDpADWoaXluUQkZwQmwXWYCZdGFXwdGSFjulVvurgHMIKOBnoYyTONZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AHQePFYHbNjsHrHUlbs = [UIImage imageWithData:aAopwHeWQZWC];
	AHQePFYHbNjsHrHUlbs = [UIImage imageNamed:@"gYNvKHhNPxuangOVbWQNfhXeyYJLUwAwpStqGcJnkfnGTdensAOGHsbVmzEcRwVnGxqmJJYmLVghIrrygHKHLFwbVoqWmVcpcpiaXvcoNLd"];
	return AHQePFYHbNjsHrHUlbs;
}

- (nonnull UIImage *)LJOlfucJkfyNtaWCI :(nonnull NSData *)oemxINeXFKkJcmWjYCm {
	NSData *kpfaIYdrjxGhGJ = [@"WgOlFOYsloNzYEliuFYfVDMUvtGzvWGlTpcsCrsdlSMaZGtYpobgAkwZTjeIjssWzTWEOuqqGjVAWohPBrWGPbDGsOFcsoDxNnHUTkJdKC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kaZXmtazYCPekldjXRl = [UIImage imageWithData:kpfaIYdrjxGhGJ];
	kaZXmtazYCPekldjXRl = [UIImage imageNamed:@"NPKwCVpyxfhXiOYhSZXXgTbjqSuzjxtwFqxIDGoszkhtuDRaKvWbCgQSSDEEeLRVGRhjhqfkBAPDXMHqHLoWEkLkTDbeSroQYvvkWCyJkqSrTNuzy"];
	return kaZXmtazYCPekldjXRl;
}

- (nonnull NSData *)ydQetEhtEmd :(nonnull NSString *)HIiIUpQhprqHnoWEDau :(nonnull NSString *)nzkkTYqgzBZO {
	NSData *wXYBUmiJccr = [@"tfmDVCokiIZuKblioYDWfKGYWaWoiOsWTerUUScmFmUOPuXJfuMFbRljPeWrNZVWSuayDSGApzwOZZdZWLXcBZgSddOharNIaCinVDcxuGMQLHdIYohXWV" dataUsingEncoding:NSUTF8StringEncoding];
	return wXYBUmiJccr;
}

- (nonnull NSDictionary *)KJgyIwlXHizz :(nonnull NSArray *)UNhxHSrbZnu :(nonnull UIImage *)gauXbIlyzK {
	NSDictionary *nyRhqXhYNjTEjlDbGTn = @{
		@"mUEecNdBHBjvGWaZOWC": @"jcPuePLpAbPqdOBNqygCqXELQnCKKmmqZAJuFMktCyxrxplEUAKrOoyHecMKbZZAJNHGScHVBHjJXBsFKszkPozBkyCtbQtIUJkAcEgTygvTzPMkQzOtBjeQJCTLJKlI",
		@"CZkwTVIglzvQcdGZLz": @"xqnYUrfZPrryYpnpHCYDCUBMaqkIBHVWdZrNfZpLqUGfYiFclTIvdwFSVOFoqFpGeuJlVvNFOgBjRBXzbFrEEXwKfFpbRpfxFIuQmCBMdKXgwqTmfvMjqYiBeyJkkUQ",
		@"UNDBVMdhyipbQm": @"AilYPKaqIdVaTwbkNYYsckpPnTlxwSlwNOXLlNhQhwZZsQVRMwOYqoVSBPNXhAJDFIQEvXtptwwEKSgJEqQBxhadgFMmivXffOhEaoulPBcz",
		@"NRFSFHmYKMX": @"qgKHDeGpXFPTrUYZLAKOtbZDUZMtdfeITqvSENwHgUUVxzfZxIzbKJTHcsvzwyUMgBHXBitWyhHxsZIydpQumHaIOGUdHVuZbgLpPKUBVgnbtEWcSrAeookLShnGqArurTcRmPBcAAOjX",
		@"SXuetlpGMnLDO": @"TRWNvRYXxEOVOeQPWAORwhGRgAgrALgffTazjvPWmCCKWRbgRYmvyLNbYBbOxrULbepUOTPbhSkmeWKSivUoirIfJKpSUYyzkvAZHqiFbcDKjPvbdOJlYHeuMfsaNVFKwqA",
		@"CxMbHmTnVt": @"GkZuwjsJfvSzNlgGQqLcCSzxbTepTAwoMIXjCVDShXISSThyrSjSHcJjIkaRoqCCbuIxAlJgAraFSQxgxVvlsuZOaxQDZHfIyspCAFEIRXAMwwVzMrrUzffEJBclDugAhjpwWZ",
		@"sfARXLhaNKmTLCXB": @"VPsYnTmPGsssmcnuuBnGIVcdUpznnARffBDxkTJYZZMPVdwPCyFwiWmrvelZSLXDnuBGoWcGcJqOKIRbmJvkzewowljrKsmqhtMncLGvpYPhTojZMzBwQBcszNqLnxTmUuWtZGzGtEY",
		@"APWAmagNkMuSylu": @"INrHvzuBScivbTHUgaHqxktjZpQBMQQhEXEBAtSiqKDIRFssojQxaCEbfFmaraomvtxZvnrcixGVSSPSyckYFcSjqUOHHVDwHDZmszgLTKzDSRMSMlmDihssoiOYUHRPCkyaccrpBHiAhkTKi",
		@"VHTgTITmTJIbyRzeqL": @"aVTQyJTLzrdlcwyjcarWMkDzdifbRtuxINGILolbcdfNWIwjqYZKBQrwzBruofgnIRDcLlnEqdHoHusajSMbeEaqSDZJRnFOupMRlMhiliZuoPfqmwYyTZgOciuiVXki",
		@"CroxKjfFQs": @"mJlTnmxfzpyveMTRsZDUDdPStFLNlALfGQonIJugZOIhPVTvxxrufaxUtcyMjFQAqnliiDacoPAfZtgsYTSmSJGYXhmHooWXTwEyZOgweuI",
	};
	return nyRhqXhYNjTEjlDbGTn;
}

+ (nonnull UIImage *)wgeBIcehkqTc :(nonnull UIImage *)ahbsicvDedqIQjESwSG :(nonnull NSData *)oiXrXjzQdebD {
	NSData *abFDsgadRn = [@"nxySNfZbNJdhqtOXLDlBXTjDdZKsmTjGtIAxaqfpMFBxDWFDwGbBVTZHtSaUouBUnhBNMehBRtptdEDcsHCroxDFtXWbQgdbdKiIEJBvtJgPUnWqUEM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JPgKOeuzixgKO = [UIImage imageWithData:abFDsgadRn];
	JPgKOeuzixgKO = [UIImage imageNamed:@"ZUSDfNhVjhCVBszyLdZIpfUKDCSYZJfThcPcJqsfuHRTSkZBxQHgTlTqBPNNljiYLKPzckcVcWLZxMxrrzwgbPZnKaGuNvSdQGoBwZlmzlmiCWEcnbWzrhCpTLCxg"];
	return JPgKOeuzixgKO;
}

+ (nonnull NSString *)nZEFzgHAVVcMoq :(nonnull NSDictionary *)dXmDnagFkkLOm {
	NSString *OIRmNsFiTOYoXbJss = @"YFmTlbtMQZEEtBFXVpihESiVanSyWASXwRYQoRtDvqMpjAoQKQenpvNsyClysqTJFtGbwRkryEYPySbyVgFkuNucLckXBeDUoevYXRZYURSikajCywDEaoLPSRuVxXFuxtGAsYAhxJRq";
	return OIRmNsFiTOYoXbJss;
}

- (nonnull NSArray *)xenrUYRkuR :(nonnull NSArray *)avibVjOVdKbtP :(nonnull UIImage *)UHeoqvdXGbTKZAY {
	NSArray *mBbGaLnhnofRAEHWXc = @[
		@"QlaIBZzikCplMroQHyontmbRtPpTWRgdkDwaWIXQVVeyGgavvdFQLpieSFSYyCYEdmCkLIKoVPMZoyYcutuhyXtEzJFiLuOHRzaLlSEXtjInDsqdGQccuRFkcSncAsLnQqyFc",
		@"fmzSNMeTTcjqWBgKMCnQHQkZfqZwefnhZsESdkLtzqBjaqFeBfHbmrWLrjiGzlIzTgvgntRknfOYjrKCVIWTgSvQkZKCCFyzbmqVZXKTOwlBQEuBuRmnZfRYmb",
		@"XLSiXhUVmKvSXMoPPAqZXZuhBFHgoYCqESUAhxMzlonRCwKDIGcYJTPhGhOmAfMgftyfIouuwefcWyokDCVBksybTcGTVlSvuEvnqGVmKwZZhyg",
		@"kmXQfTmiDukigyUkjUKytBDErzwvggGkcmFganSDPXhUJzmBHjPSggDQooWsrlmHCNukdOUesvXsPaiXwsxaZAscREkLORzcmmjKxJNWAm",
		@"nMGIgLPVFLGnjfypmSbPXLYwRIpJAOKAurYglOAckLaLwntziWyRPanQykTjxRNqkzpgRkXFTLvUhuZkZDLmJeAFbLlImhDaRaHAGBGnmqcwUZhJLxvlkXfeweLKcUkbygvPC",
		@"mPZmIOBWDuNmnCaTGLQysYafReKxHBWnPMgfIIrUfzPPyyOGinpArjjGvLGUbWAauxiexlcUaPDjcuObCTKwHsxwgnTosGXsITYuJanNnhypvptSNfJtSPFYeaABVTQT",
		@"pLAiYpksRRHnYhaefgldAlKBhqazlxpSPSfIuLGykvTMzBgFxWMvtLWiAzJeIqhSgPYPtdGwxbMfDmqdywtQvDIEhPToHHFcYXIHTJkJKWbrRNCHFSjBzTcxnsSztiOon",
		@"prVyKOatisIFTnhCOjZoyEgDDdYLPcnTPkMImXHetJAAZIwvPoWkSpiJBdlfQGfytcEcErsUvaBwYkfiPqXTPjqXtReLzAnUjauLjQFmsYJEBMXyQqEvG",
		@"vjfZpcJZORgTyzGkidYHYwBFkkNPxEnefIDIBxxrNnQyHdAHsxDOSOWRqBpwNRCuGpnONFUnNzJiSGcbDcWiIfeBlRXxiUcMUqRrRfYOqRAkhyyBYrBFNFtxTftfkUHZBnwbiIUB",
		@"hRzxkjmmbeUwmyWTwnbqkYvyRiJzOqvDhtSKYlFfhWgxDLjMYrAoMeQVGHJTFlgeqrMEItorsgcqshdfvWzHgmOITxwhcVCPDVPZWznWOaabYazAfpCUyDmVQLPbPkZGlvuEuQjkeFBUhJj",
	];
	return mBbGaLnhnofRAEHWXc;
}

+ (nonnull NSData *)HoXDnMqPbIa :(nonnull NSString *)hAWMMiQDXhA {
	NSData *ZGStMNvnvHd = [@"DMgTCKXPyONfmTwcmSJRgYtKyHyOSAnDToMyBFXWtiNUXTepzWGQknoLpuswWlTDXVuHUkwqyElvwscdHjuDxFujwWcEreSUxlmtfmaySRcTwWMTQVjCKxMgptM" dataUsingEncoding:NSUTF8StringEncoding];
	return ZGStMNvnvHd;
}

+ (nonnull NSArray *)pLdHrrkOcRtXAPxdlRL :(nonnull NSDictionary *)OtIWGmbLggSSMFPAtG {
	NSArray *UXfJkZrVBkskNzRKGk = @[
		@"XjkaOfcBwxXaAXbTxpPOLwrJFPGODLOtmtNcsDqStDxibygeiGfmwpzLQRPMVkUrkTZuCxHAgNHpgrqcSAeZPxxoHApdHOrCWUErCBkiNcqctrtfiKWPYnPiYih",
		@"OhuDkgTwDtbpzLQQEIYNmJzWEZrNSWaZlRiNPhGavuUtMlYdWjtjLJARGszPiMQlHbCytyAmHHjRyGfIoUnidMWkMfvpTGHlXEJU",
		@"DTEleemljfJuSoBiWoiqCyJxothNLfyfruWLmqUzfiILEQqfDNwJLPCPiXppBiKqQtYwCadGVgDnExiOvWeSuBkvMABQvziCqcvWXXffLgSesXtFRSbXbHGPzPtbFEiTOCGXkPPUjpkIJGNavfE",
		@"oSzLuzYtpVllGcVaokDjPBHbzuxhbjETHgTYEryfCNZZlrBWMvnQznQobXlpLMEMOIjTiDotMUqugBykWjiZNeLwDqvSYEJMDtAxLGTkChrPzp",
		@"JxdHRMEHwifbKACyUqGgmphJzIlEfnGpSWeXUarnFTazWAQmeNmFKIKmrxvgZIWpADaiqxXJVXqXYahYXFrIwZimmmfEsRUCsSFWGWSwZAWRdAEltpQpnUopjs",
		@"mwvbEvWlxOQeFGyBLJoretUsbdeEvVzJIthiDbiobEhSGJpXJmVTMhEHpIQeEsfHujTFkcajTpvenkMJDmzkURYUBSSqxSjOhwzCikGpXoTGSeCnsPDexMcrzZ",
		@"eCNIIjasykWLQLFlmmuPdOPWDCUYzlNApHwYyKtCmxmHdRMSyxAAvYbdLaSsZfdvOZiZXVHlQDWIWHKoJknlEgmGVYimctQrzFSmiKyURetBbYiNeFDtWFxPXCPCmZBFDSyxbvmyxUdvRbrGjfTwS",
		@"QbznVcVbGFZnIzYoMUvSBnyndZrelKWZRnTLjXbaBSdPAtZUyNNNLvnIgORNmiGXnGtTKxRbRUYIPCnXTVSVQcLEBbJaAKhjrbaUXfCXBdjpJABJYKpruEZGJFDPz",
		@"TMXNLsXXcxHVCVHrRCxDpiZAddEcWztBozIBvxsMtIeCvUcsdOUjCDCBHVaWdjgUSqpJPDhRQBJObfgpLCRUbyJubnplTYDDtYlJphXjAajJhneRCIgiDliEBbmJJMEWNUQtzhdHF",
		@"nCBAANLjZHfWqBvtdZRKWCummKWYuSEmhnHbKpasCgMFnBCNZAtJlMoDvKxJWZGcBmtNDrbqcilyELYHvinfBxBGPPdZkDskibUFRXIVgpECcQdeCOLEdGgfxJzIdB",
	];
	return UXfJkZrVBkskNzRKGk;
}

- (nonnull NSData *)jYdtFhGPwhPMagtjWD :(nonnull NSArray *)DpAsyADwZfxJvt :(nonnull UIImage *)PymzauEsPQuUlwe :(nonnull NSDictionary *)vmxkkkkpIcJ {
	NSData *ubUZEiDjqlAbF = [@"etumheGusUmTWJBqOrLWQRQAnaMwYjPVJiJZXBIlQSceULHCgzynkzMAIbEJwbMAgPLFcWUMQPJMPLgsLfAbsUogyCIdaxjfQFzgmswwwekQvbUhfBzTOelFSXOGWsYBVZBuuIfDXouVWYXJNS" dataUsingEncoding:NSUTF8StringEncoding];
	return ubUZEiDjqlAbF;
}

+ (nonnull NSString *)OXRutnrpczBSHPHMc :(nonnull NSArray *)ClVgMjmOxHfb {
	NSString *eJMoFQKqIpzmbO = @"QgptczBcdplHpNmgPmAidkTPKYmFhmqZfvajmxbEDpJEkUExIsaiRUrXvVnZCvvthydlfWmPKEgtjfGpqHqqehrsXrsgOkcQAAyFO";
	return eJMoFQKqIpzmbO;
}

- (nonnull NSArray *)fhiskDokXZuIU :(nonnull NSData *)OojiplclUgtcgNJXrn {
	NSArray *liderpGfOuDYth = @[
		@"eXIfQsINsdaXkMfuHIEukPiMOXdVyaJOkNBASpFiBrmDKQsNfluPImMJVBaPsXLVaoqKxthURNttvCrpOnMXFuTGLGMBoSDjzgbmpkpOhtkNcKivHQwcOCOWWgBQlTeGQjeFZrcld",
		@"AHCPFnlMjeABSGsHgcmnRUVaobItnLODSaLPpRNrWUWQPOXhCmQlhMuYQbqtTVsconCoVazyoROqnCJsXZwaeOCYTcTvkrlLUODfMLysKJCbVcxAiuCsBjMbunqaPghSsIaZMTorDcw",
		@"XOwhgBXhWRqDFpWVeSbUcvzuXbKLGZsrlayJCImwrCukoTVnvZdJlVJxuaxKCRynBhijjWdMCChVHTuqxaAWjKDhEvySvjwQeoZbbmXeVPvrePsXgs",
		@"zAFNijcOflCQcfHuvpHygGIkLjLanBnfgStRiHmJrEWMIlynufhGMiNUlBUAuQLmDrAbpNUxElcauflkSOMMGycXpkvtqHaZFGdpivEShcUBKZxZnlyxVlUclXrMjjIf",
		@"mQDQxqwiVzfFOjIaiNRkcUIgrZffrBRaBMrdNOnPUXnWVujwqgbOgzOULXAHnXCHnsTzXaSJCTHmSpNPfaqXLhJWURlsPesftqdewZYNAdpHtMPhlRnOZZVvdmyCXeCzHxpPTUBInkZYFlUvaCvET",
		@"gLWdyoojapiQMPCnHJZaHjwdWnjdxAEDqbhqcrGTiFRkskQEkosylKrnxFtWtOEgGrhRZBCYuLFRHYtgSntXUZebQjEStDEvZLNPnWRHKxeSWuyonRomuZCYUVrbYXYRGrUaA",
		@"YlYnqyAKirTMmjdcFKgBHfElFDUqeCOlQgrcRtqIheoCnLIgHmfigBoPnbLWdNvOVHVZsbcrMdjwyaVBiYscVHOvvnxwiImYMCjXgeSEiQSmcINKJKUdHxejLEcivAzDW",
		@"xlAvIkshXKhChwRJkpFXQZzUPtiibtnZhqfsvCdmgsSAwjsKlhWZbIzxSfIBLhnfpdyxgfkQRWPOPJYVwdVPDdVuxpsMMMFlUEVbEO",
		@"AZxLNcNUcptGNjxfxdwLjOrBckMNymRyctDHOaHKnXGCnxAXRmHUcvNRqIhkkehtyVeOVerkpBBKysweisPEiHSGQvRFbYdGEjiQFuAN",
		@"IwfKYVWAANjFdArQbtnWVEHUeQruxHwgJQuXvScYvVIOIObrIzjzFiXFrCktDvkQqEnNADyJkusEPOFhRZVELkDHjFmzUiaoUEiqj",
		@"ULqPrLaxXVSRrDhmPeBuwbazviXrOmNTyDWZDKApkSDoTjlwJVOXPGNQWlawZfdkJCEmdTYKRuaMCnPdORoJNuxgEIZSzPnzXlcQnh",
		@"JqxPWFGaHHdYlQEMLAUKXjgEdcHrXowdwrhQLsnkTkKNLprAPbFHeQXtGjvuFDxmloRvAiNmDZaGeDoLLoPDaQdKVVPvgXUbjOlnQLZOwfytPPVzSY",
		@"QxsSyeluYibdLaeeHEsclYvIpkIfuVSDoPoybxWtRPeuCyAZLmIiktZbNLzWpwleRKUVMrFBPxzsVglIxPXFzjlPGItHBdBdwqmQZpCrpnJpSIMQvZFCI",
		@"VlCIAlbThpxdhSZixudAgCDnPQNUQTUclXmOKgUqSkQiKyJTfQApMbJaoXgikSHDtyasdEYRdpkfymLVfcYUFFAshmtojlaYBSESlysXVimGqhtoknKKagZpddQLGLz",
		@"YORQOnfiskuIkzpATCmlyRfpUWptyqQtXhdYvxulmEzOFdydgjGPKVhbWDeXECgHDeQNjeDAKnqLTQGPdtOkCFlxCnPMnSsfPafsQvozMNpEJgNckwT",
		@"TEFRALDmIHAePyVAjXcLxMMVKsjjtxmHbHufJStBinrqNIpxPsADAfudYBbxKZhnFvEBRGfwylbycvkAwqidZTpyHENSWmcWjPjEellXMikJPtJiUukXqoHJvwdofY",
		@"IhPVmwLqlYvmdoKppuYXiKtXtfcJtwYakrBCVEdYwWMVlfiBUbJQaoKBCzcyDeOcDjEcPscLGJsjjUEVOzyyUtkdAOOPBUHRGPBpvXplGaQozZcYIKDcADNGhFPxsvLJvXYXYeadcVAfITf",
		@"BuCcVTrVeEvmzGkyZGxIevgelLXwnjkDiJgUODNAZhhSMczGMEItrkVDdLPDQwRBuZxFsyhccPvYsTloeNLRSckCJxKaiJtXCyLEdpvjruNQi",
		@"TsaGQXlPhEgUwUGLPenGqhczCibMERARqRhzVOuOTmAnKdIQWCrxcjuXhvSUEuGFbvAuEhIeSUevvurjSeYenNBAWpEgXvJtVggT",
	];
	return liderpGfOuDYth;
}

- (nonnull NSArray *)yFwXXLGHWQrCWYJRxw :(nonnull NSArray *)oqCiklPNHvDvGBfwLn {
	NSArray *GkQapzFpAXIm = @[
		@"IPxOdQAupLfUFSoLhpgsURKFXRDudewsGOKuNNTwlSiXAYbfqlGQFYsDdFgGUbFFaFHUGSWmzjHrqXwIlHTzcBSHhBOzospXCPjMQkEefnFNQwloUHxTfwACv",
		@"GIbrslzukBaurACKFibbRMKYrQwQDZpkzBIpAwHkgkyOyWJnynxFaNIhUKhrPWvFYaIyqutmbYlPxdXREdQVHYqzVAPcvldZCJlUMagIjnKHWBAtugxsEmbnppnyzFzW",
		@"MIPceDSROzeFSqjRxrBtcFzdoLBwFHXINSTHIaJFPsnfHnKTDEKFDyDnPCxrlJmfhmfIPNaoPIpohNVsKnscDrTinRAmIHGfclDUvXXxIuk",
		@"QMgikMUfQmuzVgzzEfHdGkDiRlwpgivnnBJHSuqfdcaRsuvjkLMKSJQBACaUWQVaWZWpPPfRlSwqknYLXaRgbHFPxVVqPQRDxcbWeRnEoRhqIKmfEIbplDEKrteZSn",
		@"niYzXQIMFMGzcqbqGpSzBoTCKFTyqzKJGCSjpewxwdtIVYDHoXSkDmoCKWiydHEfjjobcdSglDsiVCpqqEqCjGtxESbGVWcGuKpXIANlwSHTmPObyebbuATRxEVIftwpIlxbH",
		@"YlERStWxvfcKWFJoTxyEUnTGMmPZGJciMYrWyNQowvzVxpRmImHDUOWJoNZuAGJNfBsbGQiGliqbPfesYmxTSpsjCqtdraeZneSCGgkWxddpddXfzi",
		@"PmYAkPYEZExQFpNciRbjCOEHrXqrAhAQaGGZxdYkBmJhmwHkZSSsDiKQUekhZmHmoDiAYPBlLkseDRJtZedJxgWYjFmoBUdryPiIuCqHuNzLGXHKFMPmxwdIAmWo",
		@"qpaZTnqdcVotQtbKyprlIvEjDvkewGkxTORQjrHsyTzlbBNvVlOBCoGIgPWajzIczVFMXnJldSIoRQnOCdKpUfTqrmeonQpFMYYmYokrEIolf",
		@"kRFMrmXskHqepSdBoFWrdvGoFkbScIdhLqrsCieVRnlUjassGHPFPFiQGRcVeZRubBpBGVsefUfTiCmQIlkYSDgVPoYxaPjOgXiovytWINCzcOcnZYfTLrLLgoJxp",
		@"JZDZtlJDHUfFOetXxHzRDlRxNCecSVhsqBUTGmyvfmVjYEtYrFQNRMMTQnoKrIoDtZRprpfrjHVTtVEFIQiVTeWTcAUPmDFEQQiYkuBarwOxY",
		@"GeiURPgZIsLelKFOzPofCBWoSpUTioVspanfNgxCRxpueCrNEwYNozBxcDmDiuYindZgHCjFpyzIVlrnFayZKpWyDFFWROEyuvMwJmoFdgmtmYQ",
	];
	return GkQapzFpAXIm;
}

+ (nonnull NSString *)QqeZYfaNmblZoGz :(nonnull UIImage *)FqPiRJuyenQsJto :(nonnull NSString *)SasBkFeOXZkbIpGX {
	NSString *FvgsrvguETGlp = @"xlYscSEIhwOJZJWOBCOTxlKLpaSfBXCZvzMMQOnLtkGXCuGVKxYWXqXjfoJTOQCuajKQQKFQDzGauYXalSheWXQoyijltbqNSyHcVHrtW";
	return FvgsrvguETGlp;
}

+ (nonnull NSString *)GSYLxRgcysqd :(nonnull NSArray *)DiSgZqTefs :(nonnull NSDictionary *)FAKGVhSYnRrAmvewmbX {
	NSString *kRpMpWyqJUZ = @"zIiEzaWjptrWqlSjZdVPhyONdMwOOKQHWmWLNQMQxMcOoAolafMgasbhAYoaWsavqQdiDCRZzzWidzaXMZeQwJXICPFhAPxgQPzOLgMnVKxVbqeFhs";
	return kRpMpWyqJUZ;
}

- (nonnull NSDictionary *)qzngxyNhqsn :(nonnull NSData *)ZljSXsHFKL :(nonnull NSString *)mQWMOJgkUbVMtoLiY :(nonnull NSString *)iIsRTGgHfoVxSsMGIxo {
	NSDictionary *gkNYwlpuOFLxrS = @{
		@"BLgXTyTvWIcbjELDS": @"ouReYYWPAXGmBtFskwqDfhjjlfltvLWCUkHNiegfttPOycIeYtNNnDtkUbXTNStlRPNsLwhDyzobFdohSJZHJsUgfHbgEMaXIFXIuwhVWGlTeGoqak",
		@"BOtIvPWpAC": @"nzYqAtODGMUkVoqecCGSbKrdDFkLXtcXQnAhMXAhwNEShAZOKdtgDbChYiiKhXOVLNMwfbhzqarrPHWMCRaqmIjGWyTEHaiWUrJAjrzwPwNcOPeTyyfIfczRBKQ",
		@"xgCjnqUPSkldKIp": @"nkZVMAldMbHwQNhkrsxOjlXbMivYpFPmKXJUBSoWvzrYVRBNZcfwhhuqZsXSCbgYbWGZrvlIlcAugaXFPbHzgZppyIRTePpyHoCnzIWXlOheVNRVJwv",
		@"xYqkhqYDzw": @"ObnkElBzxFzzRfEXGmOGhncfMXDeRSONjYNfWteXohyREenVEcmJvDYTLQAKkanwqqScvyAEVOZnKzIhEvtlexItZAjzRVvXqMwjvwvUcIolntrvdLYA",
		@"YfbffaQvDlyFOa": @"KLuCxFacvZZuqTdhrPrBINFBBIUmVHiOSWpyWnkRiXtIvajiKnkCkmbSbTrSKdqCSQeghSdJlavBgnzDQyqPmpYzhwqvqNfKrnlQRdwSdFXaIcjicMTHZftQOGSULMTIfjSzAuK",
		@"QHzjrAFIHSG": @"ANkXzRvlLyngAbXAJxmKbfUyCMSKJSsQXlAtKVUZALSAdgElxjwTQtdMNuNzddVheSmLaDBPZdZxTVgOlbXiKaySfJgGhhjRSfJSZsHGzNViUMxHpRzVsGeHYwOtrFRywQrSZFDxfpBxpqbVGkRZi",
		@"iAMAegubdPKRGbQWC": @"YkOzwLbZengQWIAWtTqqegavXGyKwsxGEhpQnIdkDaZkyiJxUSHOTdoOWphKksuiHxjbOLiAAmsXGSrdbiJOoISTqyXcjMeeElmmJedG",
		@"exlajmOayNFXhDuPidh": @"GFCzkCMIfzNrsIsDDbGllIhHgIRnZSgyxRighdgRJNqgBToKmMZUpxcffdJDbmxIZHcpXNAhxDjttHOoIPcjcxypmhpsDEHmnQVoHNtGAZhHgvfKpbCXunmprWNLQoRGJqALhwsgDJELkm",
		@"UBETtaNFqu": @"QDnwswCBakKKrYFJQWaiuzOOHcaGkKlYjArwxiawuhqIloxGDGzzwFBDlXoUucLOxrNvwAhJKEmvsmaDjNLLRdBbVjwnslTBSQMvvhVKXqsbmxhjLWaXsrIYRfVxvTzrI",
		@"mJuKvMzqHLKq": @"PbjTDaStDnJduqYOfTRHdHDteQiWIXJzRafyQrtQKfmbYfrkmaHlmqbpYaKisTbiKcARbMCtKKfYMqmqMZeGIiGnNFQZqPtRhBwQDlZioosXFTlxQyagCyDEWwZbI",
		@"xtMpEpHNiIQbbwgtl": @"uADCXLrjFffUtQkptSFqhscLHgwrQOvlsJUTTJCdivTxucJxxEhycOnFlkeLGkmiKELMWCyQJDORPLUKLqXWxjvCllBktNBrdCAaBJLUDbsIJLxqYrdUtRcovuryFrmBhjnbgPbeTEOHLJ",
	};
	return gkNYwlpuOFLxrS;
}

+ (nonnull UIImage *)JyWyfTFjPyDdT :(nonnull NSArray *)ZzSKwKkUVBPDeHTOlI {
	NSData *BaJOddfvBTWlVwaprm = [@"hnBOCDsysBmGkmgEbLzQQPAQPEamzdFTqvBISekqSWMEuJfIvGbNMKscOUuBVeQhqxlIpwnAVUDcOTDmGVrYLNbEqcVtYkADUByjEhaOfn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MxXQTMqjaJgu = [UIImage imageWithData:BaJOddfvBTWlVwaprm];
	MxXQTMqjaJgu = [UIImage imageNamed:@"AGCbWtHRqKrlVVHDGGQjQkxPNWoysQDGPxypxsPTuGWeNwkKKLDBIOhVFwWtOQtRkhRDuxqQLUtIPhkedjCNzYwKeYpGwlOjqouQqKtuItHVFwytiynQBWvHlFtxsOHQyGeHTDTfxbymFYTN"];
	return MxXQTMqjaJgu;
}

+ (nonnull NSDictionary *)pImqwWKDLyhIYUtxq :(nonnull NSArray *)WlQIPqYBoNXDFZyF :(nonnull NSString *)mLkzjTjhoUjVG {
	NSDictionary *QBrLTSuUJlKUmr = @{
		@"neUZTAlkzwkyH": @"aGTllYcfVfLxquMDLpVnSYVWEyENYQCidazxsneDuLrMZRmzLRhFgRjwALddkTgIZdOeCwebVkbiwoSyLXhhjWRifmfTirITvdHdLAjwQsUWHBMdvTzmfBtJjrWrEUuZocn",
		@"unPSkEborpmk": @"wrYCjbfMdjrNGXAtzrLqwuzGhivBGWOQiVvvgiEkVuMlckXHlfBzcnSBeARedWqBdftcMEYkiapEMRXleYNjUlXRxKIaQzUnNBafnCZuSxDctDLbKMBAWMP",
		@"iNqFkhDJRQYXOFAABH": @"kcTdwwpSlhRhxXsxsuZEGMHmMVyCpAwbQJLAKpausbVJkKsEBfoiekVxriiYvUYWCbEmFqlziZPZswFxMmQaTLLySRTcLYehQgSylOGigzQvLvIUxBfydmcM",
		@"dpVGCObSsVVg": @"kluKpFIalOjrHLzzfBkxficGoCpTJfMzjeVdSqwdclkBXpvLyKLjHznnvkJOXqicPvJUhbPMZMCrygdKfYZDnsgfMDzyYPtKxqlLcrxaKmKCFmFoRBGotDlCElJZXmSvnasIkeUbaliEICE",
		@"zvJrOmfXHzpv": @"pdhtIZjiuGGDrpVYRrTrlQHLpdtnldRWgsGtrRHoXowgEvXUGbBEQIMLTHomRuvSUuzWVBCVpCIGftOQCjHjFpmspkubrmAeZdvkKHGYM",
		@"iKPAJIYAypuNoiit": @"bDIEXPCYIMNiuPuTjfMvvvIxJAIVZhDfMvepdojVTyChSapoqsdqHQYHBsfkQXTTBcKMbqcqDyFBFLtDOhrOaqLCzkUlbsAusjVkLbaCz",
		@"OPXCgCIVFJ": @"hkEQUYKARpsSOfnAtVlNIpIIsBXMbDOYcYHekdQVEScJbGkNtowqfZSnQyYfGihJCxIuitHylbhIaTFEjESEDEKHAyohlomRaCIj",
		@"WLGkPOSNODcR": @"BiOkRtxzUMxUTsnaOKQlvSrSEkFNXGiikEUiLXXgSGFLLUbaRMAIvbBOVonVrOfIUsGrswcANbPgBdyZINpuCldDWhqIiHuCwOnpsZzMgCMpfvLQOLnZWVlScTgaleOqLX",
		@"HMEvMyhwleMtT": @"ZfysGlWTzhDMcwxRJafXlScKwONvMDkfxqFvZuoZrRjgSJGKEpAMiOUUTgJwbnpefLxdttTNiOsoTrjzXHgUIwuzFhqCGpViuagZEtmZyRttzZGuEXkQdjhGmNMZkNYzLlaLNkEPBLhvAg",
		@"LAwXQXMPzrWxadHfJhR": @"vemnNynixWXKCgyFavIQdGXGMljgPcgfjMyCfTSHKklYorwoCRnPaTtIXsOwtLQPQshoPdOBBSkyGhvEpIScELznDtttTitsqACkldxLQnxWsUDVNsnYnpthRxyaxTboEHrOKmFRbGsYUeHfXN",
		@"bMcFIsiWCFeoiMAx": @"wxJZuhvFIkmizsqtRhtcTKlxfaGNYBzNlUYckQkcKCjRHRcbLvhntMRgaIDBaSRrWaeGgFWrRDkiUHmJXuTZAkTTOrxoyMGGJKXOUW",
		@"blfHDCHkxlNyWihts": @"lIojZsVZzfjFgZVmfedqENaeWWetqvRNwtSDJHOFGRVkxkjcApnEoqTElkkbAjNOSsJZxiYRlFuZLDetKMhSkeTSODydDhhZDOLevkHMtwWmMTCUMSOPwMOtGlPUqKBpwVuKmsxIzmqEvliC",
		@"OefZExQpYvcJglae": @"zywSLcwUBkPagPaNhydcKDakvXYSJnwlgzSnAcxnOsomAACSuYElHXrpUBObVQBFTTAUqxsrQozPJtADedflcwFaYlIXlDvZKXLhiyEKkezPPECWiIqtSMqa",
		@"oLoeejWlsZOeMTDdajr": @"paWSairfCnLQtFQtxdVrBYjEmgPYsrtpFWVMQCHExyBphqnTeEiQYLYcbhcCjbsNNtScgHyyHDrnkZijpsOgxkfbUnHcddvveNpTACHc",
		@"eZFgllbeheYNyKYzgf": @"KAVmYFknFTOkCtoRsDVURwSGvepSkRbddLDmFhHoldoJtIDnaBWiFcBDdKwjzYLsesRKEMphAZfeAFEAwjfUvvsXoKJqiBAZOIChverYGYtEgmtalpNMKAohKDlPmFKhrXactYuzHR",
		@"EQMvvXAgmPbTfq": @"nrQmSBNriHZRxstAizDlsNxmyEZnwfbvtXzSugKmAFmHgBaarqNCKkPowZXyxLoulULjphlyqxAXUEgPQgRJsfrQBANCbwFEEpLhCltVrkVq",
		@"XzwnCaZBHnyMP": @"OJZDVqMvbRqertdPstUbzGJkGruahkvmGDOKKqyCqAnFTwbCXUWZIermsmzejHeomLcwBDVnydHYXbvsVCkIewbsBLlfStjhotytXHwSGnfmVCeQTFDfkxygCAnzbBeKEUEridDh",
	};
	return QBrLTSuUJlKUmr;
}

- (nonnull NSString *)eFykMmUadgvLlMp :(nonnull NSData *)AcxuIxHlNPLKNdzpHs :(nonnull NSDictionary *)wWhcwUgWghlOHxKWGCr :(nonnull NSArray *)myGYPSRBEAr {
	NSString *iPHunNKltmUajZDHrKo = @"lIweqQEHcPlNvVsRLVYmqBwHexRrMJCGSFgzvWOKKdRKKXiQpIququlsekGlMetJyZUUTyCSstsqAGchKeObPTxSwqHCeaNNKdAVWPrgYQxpKksksLDYOIAuttGLk";
	return iPHunNKltmUajZDHrKo;
}

- (nonnull NSString *)SGRRtKZUZUnjCXPv :(nonnull NSDictionary *)ktttbPpBxJFPFLpQ :(nonnull NSString *)IujnVTyhoHS :(nonnull NSDictionary *)avBorsUXwYTnEpiHaKE {
	NSString *BkLWzedJTBfAHWoNG = @"JXsCIponCGTKavHdgqcPxTQmZfNCpfgnmbqebOgfItREBHlwYYZjnMblQmvhVqlsIundCofGhMTNOrBUDugUaXNASureTLyxsERgxOtrOlgHooBflhyyBybvYKZnKdio";
	return BkLWzedJTBfAHWoNG;
}

+ (nonnull UIImage *)RzJxVnpCFhwqzaez :(nonnull NSArray *)gOCwTHBjQxFtqpT {
	NSData *iNFxqxetQVyugpAheHj = [@"iOspuiZIbIlxlMEnfOgdlEuwYwIGTDJMECuvwrLmdRNFjYOXYtVpoVUfDVTKjcDzSHmRVcEZtcLahwsIrJHUTkzWIPpeyNJVlcFneNEHEpY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LImxDbwxIVbKoCp = [UIImage imageWithData:iNFxqxetQVyugpAheHj];
	LImxDbwxIVbKoCp = [UIImage imageNamed:@"AXvNdoGULNqCnJueaCpPCxSnwNUXXHfHWFiImOQdiGyQcUonvUHxGdlqvyKZGWJJleACRrxzZKqRpAFqLLWdemQNWIXeKmMVzISRTGV"];
	return LImxDbwxIVbKoCp;
}

+ (nonnull UIImage *)kNUieIOnzRrS :(nonnull UIImage *)XpUHghBrncZilz {
	NSData *wNCOtmlYDhNfjtvB = [@"NCRaNBtqwjLqXsReGohBcitcWIJIZRrGHMDrlNwzJhGLbafoaLodOfSOdESNNvaRVSVwxROohRpqtEfgGKQeFrQAKIlXZwFZYsrPvpXFAZtJzRIhxO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PeUqrnsEtEnBNM = [UIImage imageWithData:wNCOtmlYDhNfjtvB];
	PeUqrnsEtEnBNM = [UIImage imageNamed:@"tFfGQmcnqdNmjRqUcykEdpLimkuXvdPyqqAyaGPXyKwNuoUTzDKRmCNPnNctWbIWxPaugjSQFQvAhQPWuDZCMGkWUQBSBtOQBdqEjy"];
	return PeUqrnsEtEnBNM;
}

- (nonnull NSDictionary *)JCMZRSfcwqfyb :(nonnull NSDictionary *)PudQBELxGjXJN :(nonnull NSString *)ASbyCKOwKkrPKzl {
	NSDictionary *dkDdTZZLCV = @{
		@"kbBYsxwjxKC": @"NNscPLWvOQluogerfwyYegNzZqXcbDiKMAcGDfzpAAibCpVHmlyYxNcHABNmfStmPEYwBAkQQAcmTecnfXRuDIeUyWTgQmHvaTTClAOhBoVLSiyosrScwzrAWfOxQNfqAP",
		@"uLXkGmHsLbNIATvo": @"UwJEjuVcPKtmjgkWrNOKhwUWAGtGqZrCjLCbZuzvXSXbCuWoiOQhMxbvYObsFdpJeRrkMbUynsahLPMKcwiVkslzoKeheYeCdeXxUlQKVjUhdYjVlIkaFL",
		@"SENgKjoRjGTMbGkks": @"yYErSdLJZeQChYroaPFzSohZitXaEQzbydrrbeSZwKLjSprKcxornMmmQftpAAGoxgmypqhyqnKSTTstwRjQArRMOyjCyLZuHdOleuVitICvvKYFRDn",
		@"VGRXxebqFV": @"JjYIZSWxkTuiwwcrzQOnpzbLWvfvdZRFNiLmQSIHfUMHxilJWhGyruZcvSfVMLoWOnaDrccBlpTZtCxAwhnjRHbOwckXIpxSfBPhgHYpsEPkaGSMLHomRIwOdnPKkXXOsbUnYmDPyUpLGMPnDVy",
		@"BAtINCLQyF": @"fpGbKxywFiitrvxLFYGPNctctJsiwbXlULevgubIAbECQvxtSKRxyvPCUeNrhHBcxAMTNaAoaamhxOEOWtzUATaZkyZKjBLSgLNckyPfKAYfCqpIuHeHcQHtOEqpcECTqvAYbXPgtjOVWwghWCOn",
		@"JwrvVRUMSidFDHX": @"vPGhNlVPYmrPCRQYZnLyAePMzJuPxwwMjGfGwaIxUEYkddysGkzfcMEfuQrPuxxlDYzzykiEtIYuVncOpBwpgXqdnunRUDDaoUDCWiaATFjgUVKxMQKJHuvBeWtdEgUha",
		@"yIyXyzTHvW": @"pNLERVZFAjROnXsqGcqKXcRrfKSskYrWkdPXMqKnpvooiyqIharvfrdkEKfedtjPyDBIGTJydsmcsQtXzCWIIZfthRyRFWxNyHvolBrjBnlrTsZMcSDhUgLfcdqfUI",
		@"ERflFbIGWMqrUO": @"zYKumQnYPZRqbXOFeydvYeXgRGSoRXSmuERRKHsFftzkixKgoypyjsCjgWHXPWJPolSiKiyOnRuIfKyDBgYAGQQldGGjiGLDSbJYaYCZJvCJgzxxAbYrxizgATpgmLyjxejFeouxNDqQ",
		@"fqJvNLnEQb": @"IQJuUiXcinrleAVFwvpAmbRdyhKybjcbHvsTCAZXApdFtWMSZOZkDwTHSXTQWinuUWbVvLOqDZwSeADkBzAkBoOLzKVxuTzjlANBjqCHRdf",
		@"TcAeAiXkmOR": @"BUYIUpDgVEQkvOTBRekmZdVAPyxdNIndWmXqbVzkixbtuYQTmHnfrdVewpLHUAiFonTRLUrpCBvcJPvHaDldhWMJaUvtigGDGszTPToUDNuLoIqSqGTehsaXwgtoewUXAikauKnd",
	};
	return dkDdTZZLCV;
}

+ (nonnull NSString *)ykPqEeNQmbAyGpabWz :(nonnull NSData *)tzGicfYnVdfoEELb :(nonnull NSDictionary *)WBQvYwHZEssoDF :(nonnull NSString *)jIwViUPJmoegCcai {
	NSString *szFUxRtmqfdPoTrMR = @"BRzPArPWCbgtDuUdNTXgUFXaKkahBZlasIPxaxbqIPlzZKUSWCAvuIQibfscJyAxHFpvlrebXLHyhMAPkpBBBjHkOdjAvsEspclueDXeZIL";
	return szFUxRtmqfdPoTrMR;
}

- (void) setMenus : (NSString *) menuJson
{
    if ([self.delegate respondsToSelector:@selector(setMenus:)]) {
        [self.delegate setMenus:menuJson];
    }
}

//制作课件返回
- (void) autoSave : (NSString *) menuJson
{
    if ([self.delegate respondsToSelector:@selector(autoSave:)]) {
        [self.delegate autoSave: menuJson];
    }
}

//隐藏保存按钮
- (void)hideMenus : (NSString *) menuJson
{
    if ([self.delegate respondsToSelector:@selector(hideMenus:)]) {
        [self.delegate hideMenus:menuJson];
    }
}

//设置webview是否可以下拉刷新
- (void) pullRefreshEnable : (BOOL) refreshEnable
{
    if ([self.delegate respondsToSelector:@selector(pullRefreshEnable:)]) {
        [self.delegate pullRefreshEnable:refreshEnable];
    }
}

// H5分享统一
- (void) shareUrl : (NSString *)url :(NSString *)title :(NSString *)summary :(NSString *)picurl
{

    if ([self.delegate respondsToSelector:@selector(shareUrl::::)]) {
        [self.delegate shareUrl:url :title :summary :picurl];
    }
}

// H5 登录
- (void) remindLogin
{
    if ([self.delegate respondsToSelector:@selector(remindLogin)]) {
        [self.delegate remindLogin];
    }
}

//h5 返回
- (void) returnLastPage
{
    if ([self.delegate respondsToSelector:@selector(returnLastPage)]) {
        [self.delegate returnLastPage];
    }
}

//创建音频课程
- (void) createAudioCourse
{
    if ([self.delegate respondsToSelector:@selector(createAudioCourse)]) {
        [self.delegate createAudioCourse];
    }
}

@end

