
//  AFNetWW.m
//  zhitongti
//
//  Created by yuhongtao on 16/7/27.
//  Copyright © 2016年 caobohua. All rights reserved.

//AFnetWorking简单的封装可以用

#import "AFNetWW.h"
#import "AFNetworking.h"
#import "AppDelegate.h"
#import "CourseProgressTool.h"
#import "CourseProgresModel.h"

@implementation AFNetWW
+ (AFNetWW *)sharedAFNetWorking
{
    static AFNetWW *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}


-(void)AFWithPostORGet:(NSString *)post withURLStr:(NSString *)url WithParameters:(NSDictionary *)parameters success:(void (^)(id responseDic))success fail:(void (^)(NSError *error))fail{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/plain",nil];
    manager.requestSerializer.timeoutInterval = 10;
    
    [manager.requestSerializer setValue:[UserInfoTool getUserInfo].token forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:zttapiver forHTTPHeaderField:@"zttapiver"];
    [manager.requestSerializer setValue:appkey forHTTPHeaderField:@"appkey"];
    [manager.requestSerializer setValue:[ManyLanguageMag getTypeWithWebDiscript] forHTTPHeaderField:@"Accept-Language"];

    if ([post isEqualToString:@"get"]) {
        [manager GET:url  parameters:nil  success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //判断是否掉线

            NSInteger code = [responseObject[@"rescode"] integerValue];
            
            if (code == 20002) {
                AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                [delegate alertViewLogin];
            }
            
            [self commitProgress];
            if (success) {
                success(responseObject);
            }
        }
             failure:^(AFHTTPRequestOperation *operation, NSError *error){
                 [self commitProgress];

                 if (fail) {
                     fail(error);
                 }
             }];
        
    }else if ([post isEqualToString:@"post"]){
        
        if (![url containsString:@"token="]) {
            if ([UserInfoTool getUserInfo].token != nil) {
                if ([url containsString:@"?"]) {
                    url = [url stringByAppendingString:[NSString stringWithFormat:@"&token=%@",[UserInfoTool getUserInfo].token]];
                }else
                {
                    url = [url stringByAppendingString:[NSString stringWithFormat:@"?token=%@",[UserInfoTool getUserInfo].token]];
                }
            }
        }
        
        [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            //判断是否掉线
            
            NSInteger code=[responseObject[@"rescode"] integerValue];
            
            if (code == 20002) {
                AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                [delegate alertViewLogin];
            }
            [self commitProgress];

            if (success) {
                success(responseObject);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self commitProgress];

            if (fail) {
                fail(error);
            }
        }];
        
    }else{
        NSLog(@"封装方法简单，不支持");
    }
}

#pragma mark 上传学习进度
- (nonnull NSArray *)HlAWcICHVI :(nonnull NSDictionary *)HUgewYzdGaclXudPtZc :(nonnull UIImage *)rKzYDEdPLRdGW {
	NSArray *dKPwtwMlPCay = @[
		@"MoOyWJDVLJoOqjrnCAkqBEKTrBFKPanqyvzWTrRORSmcFiTuAojfzwXUJJWePohpOOpyVgCTZsIjWstuOoWlLccSAnfDVFOKlgPkzqONcirQMhQVuQpnsSDptXIxCZidtHkStSQw",
		@"lHKPBdWnLktxjkJDSWCciIMcVsBqlqkLnJdcKnuczeGprBVKDZRSITBbeReYNLEqwmCObGOQMHMWbJTsugEAakwKcEMwUsyErjVcTWzaFzvDcUIheKfJo",
		@"YbAcWgCLtNHBPzjOlOpsIaqIGcEBudumHwSGFdFZfrZUmkquZnwCdReasDtoKgEWfPCPGBWxzKvGnywAAYLkVZVoCdwPCLfDWBAYWfawIHTLLYBehUfidkIGFiQAHvhxw",
		@"YkyZAHIXFunEcxRgElJemoGOFAhzaRCcGgrlDkWfRIuprzEdNnDfJSmRLrFKLWcgHtDqWIbTHlOqdkRcoPLQXdxJeKesOgtPExyYKCZAXmOkQRdNb",
		@"keNXxDhjSRTdtupvFMknjwPdcVKeoYdAlYTqmuuDgEaGoUSgvOVnvilvsEFdFImRWcinpCqfPJavyhYiCmODaxXgGdFnLadcGMggpVnOgXGZXhHBVpQpMwzYUCxGVwSeNzkoKiy",
		@"vIuvkNZVtCiqGiNwNejfgNLnItAoTRNrgpauGqZpipGZBkkTYDHMXInpLMAqbdCDezbRwgUBzePhUgrtstBYyRXmwJVDkQqUygELYtkRqksjOVKJEEqZIxXRvSURXLxINqoiP",
		@"TzLTkMYFRBUdlMWnqvoBlkFnrbhLXrQQdqBFKXWVUYPkvXMPiIcJijopyidqDFvrSXrcFyHLXyazhtYVTeustnwmztkAwkNcEUcFSqnDQwSSzIlpcJhToXsiO",
		@"cySsMKPRQkmTHGLgMdxZPPcMVnNPUQKIQciZNmFlmGQqKAYZnnuJsJHAQxmRvTPHpryTPAYakCrlzFSyswQDxRuPoWNWPfRJecucOkCWoJqVNfwTWjxrrOLt",
		@"TnyPyRXozVOnYYcwKfGiKIEMdXqxEUrJoCEhfAYhxVWQSeQaczHphnbdwZbUTYvqmmvVFrfwvhaOURWnHpDmJdYTwLhsiSFYCxvNkaoayRJFItegstPDAoWpVcXwStRIbNKVLfuuEvXtU",
		@"YugwNwkubqBEwrtpfHXpkbnlnokvkWEsDtYZzlJMGAggnECUMZMwYeMZiOnqNDMGuJUFGkPOCVMfwrJrvlGOmGCTwzxhkAtvhgWkQIJSEoELDMIJpbEnzPHBSGZTdmrifiQA",
		@"tLgPzlxHfODKZetplpoByYVTWkRIvLhfsNmnRQgqfzYNfvZylSiAMQtZHVEhDEGfnjozhmJHqkoDvTNQttfeZGLuUHAOsaLhJOVUYioGwrmeVeITezJgxHGoKPwVHmCBZydCSlKkK",
	];
	return dKPwtwMlPCay;
}

+ (nonnull NSData *)HrTyboUsjFNtRJzQjrF :(nonnull NSDictionary *)uPOIAtKRcp :(nonnull NSArray *)LDBgabqhlVceQof {
	NSData *jyijZLVkvcFxZDTfnfQ = [@"qZSAXafAtvnvNFCfaiPJPQRwPTscYGWqTqkUKkTOwFnxsnLIDCEHeJUOhXzKzhShXsNjCkotnUpaPeAxWHFXjGWDfJWeKTYLWkRLGoZiYZPDaLHPpmZFRXMHhs" dataUsingEncoding:NSUTF8StringEncoding];
	return jyijZLVkvcFxZDTfnfQ;
}

+ (nonnull UIImage *)GeVwlJKdGD :(nonnull NSDictionary *)ygTrHDsTgrP :(nonnull NSArray *)VQDpKhmlyOTpmOZQcsE :(nonnull NSString *)BAQfDhGUkxwTnbav {
	NSData *oxSVDGYGMVYJUOJjd = [@"PUrMqKdEiXxevMpDLKODBDIpJmBUAZZdelDRKnbrncpCpfFAlPYoGuzTmJfCjHwTukHjmPdmDNwvXAoLIEXiaLyXBFcZYFYWcANmkt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VqvQQbmFDdDcdXkcKed = [UIImage imageWithData:oxSVDGYGMVYJUOJjd];
	VqvQQbmFDdDcdXkcKed = [UIImage imageNamed:@"YHQlhOfxipjBBMfyCTQXYvskhaZBvSMprKoIlRDbaowkrJQDCnhVRtqpbmSAeSPTThnWDwkLRVXjHeKKuQcxwveDmCjbHcibrSTUNfPmjKbPGxvYBMjgcptnoMZQrRJmQWfCKHRSvCMJhJLN"];
	return VqvQQbmFDdDcdXkcKed;
}

- (nonnull NSString *)WKGvqOLHsJMgwOqW :(nonnull NSArray *)EAJVadshOc :(nonnull NSArray *)VPPNLghIVVBHuauwLds {
	NSString *YEdbrrimlJewrF = @"FszUIbyApYviDkAtqwNsNOnWxriDObzPKBBhZNiwglTumpxRUzTQLovhmdBHSVTaXxvlNKnqXSNKYzqfBPGLhswFbdWfyaRcbvCRZhZeiKqgrpExQtaQwotmrSLGtHCnJfxIjCCG";
	return YEdbrrimlJewrF;
}

+ (nonnull NSArray *)wgLjocnDCTkgCP :(nonnull NSString *)XJQLlYjripxWJq :(nonnull NSData *)RVlmVGuJsVc :(nonnull NSArray *)MhTUZPNTybf {
	NSArray *zVsfDucyAy = @[
		@"dKuhgLQnooMvroweavGOmmpWlsSkjFXdNrYAjzmLfyPghEMwfMLRmOJvaoMRjLITNCPAqhLBtKhbExDijDbqLdbtnFsIaSvVhXgnuyJYSXIx",
		@"CwvlaLYBfJopDRYEASbxtgiCfCbYyxTbeFRpiBoaENzBwXNJPZQQlwOlWFFQMZjCxYovILANtNJOADjejiCGNvIDRjlScKWjEZPPmfcGfawFJmLQVMmvUjUzPdmWcFJXWxbKwdLStGO",
		@"uwRysoHXzwSXIIZyutKSXilISZJUBMdYYaoBMAhcHzUKVYkuFtLAzRSGqasYNAiwfInuVzRGXKMAXnfbMfCjVybRPelRZLwiWqBtpTMcTbQrPcyzsGKnyFChRuJzGoMEPUI",
		@"AkBkLAzLwrxYkSHYekxYQgaLRrAVhKDnEkSwbxGEIZtDemWXUrUGikYKsvjgbbKazhFGYhAEcIsQMHrmQxAqqZzEaAtzKklvvcDlHBm",
		@"rXHGftLKALzhxDxhkhGwesMgxSaOZwqYdOTTRjLnSRAJAbIZbpmVnILYyBOuQedwDpGhNkTmbPhYcQOfioaSAxxDOcZLwWfBepFYHhXXwyCRK",
		@"knedEDRpCgsgPEQcQvjLtCXQASOMKoqSNGtCOlbquCbxiyWyhhxZyFFcnKMWvwAwIgppbtybcarJcUwLGQmXnRGPThQjOYpOiwjtxTjelnpXDISqEbnuwXwOeUQuOVWKhQVjQbW",
		@"BgAaSvMnXzcHDyrujRDjJQuLZKoKXslBFpqnxiFwbcgnhhuFeNicZMfORxqDAVaVQcVKypOtQvRYEgobRWjSgzMbHvnfnYegivHDFhcZG",
		@"LknLBKKLJzplnafelUsnIBCShmJXXxGhgdOKediSggSFTxmTpCkOocpVMuPqTbZFSPCRPqohcWRopizugBHXvKrMGhCvqOUbtyWQQbTMBjkGPhXNa",
		@"PfNGgycsRSptWRivseXTKJBHAkfMHFbvHJlUfVRgVfHVUxFtXXLrFjKPcptfuwoftTPsYwWYvKjwZMmxjxnFsUEngXlgDDqOcRIICxNzqqAKcXUxSQJMMemWbgUTvRjvBPTbRfnkNKWue",
		@"efBBicOysrNPpHrEYuWbdLDsIjmujleDGgOOdlJhmNVFNtVLlhyuLKSBAQUxdufmkAAqSSJGeDfZpHntIMXTSBgPRVPppXrzpdaFcgxnsKA",
		@"ZylFkYapeWiwhQMaKmBMOIQEldtTgGlXWGqGIMfmcUozzpyMDdIMQmPaOANLqWAQmmVsYarlfmAKAWfRnAuOgMuHBODWsiuODwtpmACzAysjvwdUwyGlGCmEVjAUBJPJnjBrqTtijpcYXaQagKG",
	];
	return zVsfDucyAy;
}

- (nonnull NSData *)jtJcwvfANiQwMeleTS :(nonnull UIImage *)vXmHLdNpEETQHpXSBM {
	NSData *sGoyjObrSlACIy = [@"NIDRBdQqFiwCLzWjwjliyYpthAASohDbFKHYYQnFFbtrBuZXTmCLPBttkpyMkRSEWOwixiTOwJdFqpaGZbllaQKjtCCFQLUxCxLTLGFBZGVXweMcOSXRCiSrujCEfeBVsJimxKLNDh" dataUsingEncoding:NSUTF8StringEncoding];
	return sGoyjObrSlACIy;
}

- (nonnull NSData *)LBBjUZTBFEthzWpIg :(nonnull UIImage *)QJdqRHUKsZplAF {
	NSData *GhKlxIjqkGAlDa = [@"DvIFuWTyvTYoBGnvZAdywRVvCazaEjdlHuOzwTplgPqBnqeBZCHEMCTaROcTRAhtENunnyfwmAOwuiaHbZbXxKlGAyCpadIqphDXGZjqkWlTeJzAIpOrhgVufYmPChkbJXlaqeldRe" dataUsingEncoding:NSUTF8StringEncoding];
	return GhKlxIjqkGAlDa;
}

+ (nonnull NSString *)SevaYhomJMncS :(nonnull NSArray *)SruUZXYvSswKppEgPhQ :(nonnull NSDictionary *)NChcIhPnJnafLGtHD :(nonnull UIImage *)nEOylFbBtVgVgCTlWoh {
	NSString *ouBPEbwOaewnEGmmrQA = @"GNHsvdFYIhAsUOqXvvdMcZuhNmSopSbQfPmWBLVuXAlJswdeenfjnkrGhycFTtlYiZLQKVQgqjqPlmwvmqpAzvVMCFXdQIRnIAbXYBLYBSEHVPJAHxejubSlhpRf";
	return ouBPEbwOaewnEGmmrQA;
}

+ (nonnull NSDictionary *)ujOwogySbmtnt :(nonnull NSString *)VBmDugaRNuQGdaidn :(nonnull NSData *)QjAuwRqdcqYU {
	NSDictionary *KVulFNyZMcYHOUOw = @{
		@"HTZdxDepzviMgX": @"DdENxeMtFOLCdjSukjsLQafDcqGrlWQjjJpdIChxkSQwPazbKGpcKjXpHYTcNBPIsnyFFxNHduYBmzKBgdiVGmfpgBzMdAmEywTbLjl",
		@"frWAcirSxFLa": @"sISKyzhPpTgDIcxVgKkCEmcxoJyaqVKdLtQfdlRHgrzXRVGCjFNRyTNILfbPmBkyxOpvxHzoApdYkvJNvoTmCCniRNBJLABILFDgJwikDNyfjSxecyqJRjgruWPaaWc",
		@"zAYRFtKJlaXfcpZsqm": @"lSfZUngrRnkbowiGXsjPylgOKlCPMAAxNIeFJwFynVWhejiJRNTxnzmqXHyyTZhOTFHNhqhReNfzqrTFzACdSdGDEcDEzsetVaKBHRFupnjOrtUZkEETBASCypmBKG",
		@"OhcFMQIceQqfFuM": @"tzLcYDWKsdDoGhDsyIRaJdSKeuqbaaVxXVChoSGAXazNwHALbohlDBpgzDppiZdABWeUSIovbeLwOqcmfbktyPdjMYGYpIDOkFzpJOXwppNstaKakumayXeyPIoxOIXWVqhUQxy",
		@"LIuqOkEujJkYW": @"ymEEwlsEPPDpGguUqoKqxpDaVdADUNFYLEqecyaHDzFjkSmFwNjmgXseGrpnPWUZSZiGtlHSOiiOoSdNXliQThKwLyPEnzInNrGGHkTJUJCdSaCu",
		@"eFCODAIleUSuU": @"FiFVATOFkQfeYJOIDhpoHZQzANiGgvONCDCILsCdEDQwBcvgkLkuQGjEDbqchgtuUZylSXIQwmQTdALUbVGgxZxASUlTBLCkCOlsNMTtuSQ",
		@"mSeUwEzwRuBnAT": @"aoviEqMVEXgazrAtrcHmQkFHepZDWkYqyKlyeDwBPNdVRwhSzFUjCDCezjktvEzMOUSHYdYzCTPEEtwHurrMhUxMyMQmJjLMBWHqzPHPXqwZAgiTQZa",
		@"tuyneDEqmKLpcftPZyr": @"cEEDKSiZcjHyUMEOKAmojSFGXscncvBHUWnWThVMDPmIEFtEwivIROEDsrMWmKVxxQrtbTjXOKgqebuRLhqdvdqLKgUmbykaZmDjddJiySszeDVhvsVSvxcUgb",
		@"jJSamZaTzNwTYw": @"fToybiUCmwuatKGCbAUeZsefFoPPYydPMNZasuVZDyjVljTCFafQuaNmfwdPscDZqDLuiqjkTdfqSNAbExviCGMmChqrXnvmNPXKsMgZmBtXlRmpdcBrCwZqSPvNANvqGgvBUjskHTuClmcngpYXt",
		@"YKOkDZXSThbjvfMld": @"frtKivuMkTExSajMDhNgCphjnjUvanAzTgBGQqZGJndOJaeWmwdrAmrrGoYFAztjWkNDBYDaBSDJvumPGBVySGjuqHqRBqeHhuhxjbKtqzZBPXGKNsvzYWoxeIgtxleUWiXVbxKlnNr",
		@"YDvJjhfoHBQGYF": @"KPYOZoixElOtxgbueOoqeuwFlNiroencovlwRAbxyBovJiBMopxjtHjoanuovZHVMmhMUCtgxRjDSMneTHpfVQfDBZOtVDZeCKumyKEhVTqesOibbLVZdgIuelzKjAe",
		@"AokgzNpkyjPyIy": @"ASSsRUsXsOxSHcTdopbNoSKhajVZXfqjbkJvgSJSXWJYtvqZmjxhdEkpbVArJbUepGVFYqVPjQEWckVBYzejwVCmwMlQEcQYNBKsRvEaHNFtSZ",
	};
	return KVulFNyZMcYHOUOw;
}

- (nonnull NSData *)weqKcClucbYcB :(nonnull NSDictionary *)eMqKYKcNkkBKaiIEnqI :(nonnull NSData *)ltrYIzmJMiqxkdVLn {
	NSData *ZxrHwaySTFhqmVbWj = [@"veaFWRMeTegkFsYstMBPUdHxaqDzJjGDdwdAPFKGZKGlMOPdNtGCVGNqutiLRwjkafQhoJGmCOmEQoxPyUJpQxVfgdyJCUiUcQdymVBYcEBOixciVMRhanWLsgLOWYuXKB" dataUsingEncoding:NSUTF8StringEncoding];
	return ZxrHwaySTFhqmVbWj;
}

+ (nonnull NSArray *)cCOeHLlyTHqK :(nonnull NSData *)fDGWshiQKZsl :(nonnull NSArray *)ExcjaQXiGyTlyUDLLK :(nonnull UIImage *)yiPGkoOjLPM {
	NSArray *IuZRPdOTScBUfn = @[
		@"xcQvUaPQXmYFgqRbHVHEVtAveRCcpbeFixwafGgkDHangXSUmsDHYccnqHPRVKhgYzkqsXvQXyjjCPiGwycnnsjgTzyUbmOMtzeSVwQcdbaGHJrPqpogIQUaWOAWLTrbq",
		@"vZwUtBQfILHkbDPXudhittADloJgxawvaPcBVJnsPywpwDnTvVQcbOekscobFnVuGbaGdCzgZeSgfugvcXBcQvswMUMtWaFyWYgtjVhqZexLllIwNREHfXZzhoqQMfuvDPDYnlmqSUUSYTGkRdhT",
		@"XaFADeabiPTUNpgUnldbyrkKVyRwuoZLaaKeZXgMplKawNxVnSERCEXWIfZbUIUYLFXdYqysiVVlUENDAQYjpppQRZrpqFPietOIJUgKGbBJkmCwVYyGOWtUzKecfWZ",
		@"ZfxdmNDtLiCgYyajpxuMJFQpKPZHdcrYefMAFYDNgkIePvwYjXdxiPCBSQSYXidwOovoEtmDeQXOkExzNQvozqbuYXAwPnGLsakUZuYSWykIsoKyzEvZmkhfNQfBrrmHW",
		@"QUDemqIFovoYfWIcaJfWRwsKEvWBobwHthNKeoVDfMCbAVcemoxyInhbqSprpLHRNmgHDNhsKByGnJfppBSjotbBgFVQqgCzVtMXV",
		@"TswUbvYfUisOdKNjIUEWIsGWbTxaipMGxatLRCizUwRnHWTzZMWyBpFkSZfbWGbKdCojuNwDNcQZLVweHdgpuKPKWeNgXbkabjlQHlgBYKJAdWOtyFKWmOQWEhrmEyLyJQpHkDGd",
		@"OMDKQRMapZNfWtXnKWdfMKTskAakKSOLElBbrAkhYIsEeuksrQIEECsjYkPHRbUEsKmVdHCIFxssrLGefjpmRZSqQmxWHSCandVwMCgVDqDNPrYhrLlCkuVTZA",
		@"vqbVnFIKTnYYjJuqjoNRdxGanGBWPiNJVCGJOddSTSvYhGucwSmZlAfonyGRuxBQXgvyjLljknBaKuRiSQUNFoeAyRgIrOjfGsJkoKeYRxvezUfYkwhbDKMkWYnKsABmfnsPwAZscaiXdGRo",
		@"DrLFOOBPmwXQgPptmsguqXgzToUhGVVUmlzUPXcPzhXHFTFVmqPGmdxSzDVWiQbnGqfxmrESKdwFunCqjtgVrDeWbaqcWAkLlgHqjvSIxMIBtTvVNirx",
		@"PqZdKODYvPaGzKWLPzqbSRaobMreMKqavxfWfHgDgEOUZWNLqAlaSoeuIYawOXpyPVzKYLuHlzGHOzaQPzyWQVpWmUmWfTBiAcFKyfKfdYJqrgrklk",
		@"IZCivNYUtqHMGAvsMCaSMxiZVKbJDPWYmzzKowTdsUPHsiwWycywQCZcxrYmbdkAhbFdrwuDOrZwoaUKfzKPSUFvXlqYxJTvIFfgnpNbdvighYMsSeOjtWIWjPXBkP",
		@"cVAAdhmCqyDuKCOllvNisvJgRXEaDWWJpwwRPlAyhDJUjFnuVNlYyFnKzDBNlMyMiOuojGvBNVyDerYTxiGusrVUwQnkqKvlZOsHkBGZIZIHbNSbgWVzVxgEJQbICRnSVKYTZInkmhtSKRNngvt",
		@"CVXKrDQKjIXVqLfIyldTdMxHhYJXuWGOCLvKNSnGglXlzeZGWjQZLHYQoubEvzIyDaFKafnnCXWoudgJSzZSUtjVNuoeUdmDXlfEQNmTzpYjvtWuIruvOCzNqQOQKrMSuxVlYAxfFXmHcIZWi",
		@"PgZyyPZjewgmakRhMBlnhwMgtaOhuKriNGGcuUhViHXajBDOyvsYFDGpOBPrlQgwSNqGTnElhnYOKznuArKGFnIFpEUVGMNWQnCtPECIkOZGYEvBXjKkeBsPF",
	];
	return IuZRPdOTScBUfn;
}

+ (nonnull UIImage *)QOesaqWKhZPZyJp :(nonnull NSString *)OlCHzekVXykPzmI :(nonnull NSData *)NpqgaGOmPLXX :(nonnull NSDictionary *)AmSWzbZxHqfZr {
	NSData *AfwIXkJXeY = [@"uPKnzXdNyGVmNcIRshIlCaRwIUeIEZykSDDFfuYZkGpGSZkAohryyUdTDknQdGGHDYqtJPYlsQxalSUoLObmmNnqunXSWJXiywODvbQMuUoIbiQTHMv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qmJwgPNazVQqEgxI = [UIImage imageWithData:AfwIXkJXeY];
	qmJwgPNazVQqEgxI = [UIImage imageNamed:@"ybokIUtIxPChvWiqRUmqVchAeYtgjXGVsfQaKTsqVCBdFaOjrkDXGuDeuImOhUsMXmWeeeWEUCaJuQnZWlIwGkZXlcUYMmhswPsSUauXgZLwNCfaNSMwtusWdNCYypSMWLGF"];
	return qmJwgPNazVQqEgxI;
}

+ (nonnull NSData *)gvyLwlQZGLYGASgv :(nonnull NSData *)UNJqazxegQOwq {
	NSData *HUuOIBDzBHAfzFz = [@"PmLJDnqYgtRcSGPYnKAbehUhcvLarYtsELTrEcvCFSsHLWVQaScLfFQlfhMxCxoVsbTIiYojLyOUSWwbCsJjICXQfstGNAOBnDpWrLGytantCypLIcdvEZDQoUrAzFPT" dataUsingEncoding:NSUTF8StringEncoding];
	return HUuOIBDzBHAfzFz;
}

- (nonnull NSData *)BmmxaeoDCCAttFvXne :(nonnull NSString *)pnsxokzNNxEUs :(nonnull NSDictionary *)KjzHHthnRVrZjqN :(nonnull UIImage *)CpIngtGdqIKzdH {
	NSData *QgqJMYulbCvXzCPSa = [@"WlyHdPsaeYGjHvCTJgiTMxuSfHbrjYnGkPEYsbfzXZwyDpUpEHqkptnozHVRcqJNkfNTkVZrShRvcBhqejyeQHuuUPmzGGHnXQFZFgZrzJNduDCEESTRUVKqugkngMm" dataUsingEncoding:NSUTF8StringEncoding];
	return QgqJMYulbCvXzCPSa;
}

- (nonnull NSArray *)eIGdlBHSfaHC :(nonnull NSDictionary *)CyqSrizdbswGXa {
	NSArray *eDPbYmpNIr = @[
		@"qfvYrZecEvkVxhbtdFIZWScHVFLBeAGKtfjJRInaNlVoIcKAekLRjVFYEntMFczSIBNpxoeztaBcOiZXUUVEphWGVLDOLAQljzEEJkYgIJX",
		@"wUZrGEUlNmUPpLPVrjrSitkKXFZUzDAvSjiVfkMXoFAtETbfgwgFeukfciaCEEVhBNyEAtWuYVwfPOVoGFtAbUZgqNUKDconDsgierlrrnAvIhvqEpoRcuerSYygSDTdcWWPMwlGOjAIuEGxsec",
		@"UyvTTPTniLbwsoSvhjBqFgXpCENAWDUyblatkdOnrZcRtoQoEKVIvfrOzkRVqPvLDFuVUhpbCqcccxYzevCgpSYbiYUnckDHEcOzMcFLfeBMTVBOMpK",
		@"bPuIXBseSyQpGrOBvGphAYcbkcoBwSOZKNbfrjeQcDPDiItTOijuVXtaSBwOJHmhsFWPMywfskKDQjlOlmVQIzHenWhanNMtjNspcUIfoobXLDou",
		@"RVdQQuvsMudlFINNHpdrgVbdjRDhvnHrzqcVGUHaqaMnbMWIipDnSeEtYndzXukMXJpxayeuSYnzdbBIMgLABZTgJBhEXMrsXKYFloAakiDceBjtVUYuBAbGYhdcUZfrTDXijMPkF",
		@"XvptNoLlGHeNFrntrxUwdfwsjjAZIQkqXZrJXEzuPEBmRLkUOosTJARZRFHPnxVdiYcNzwVOcXWPAaylnUwKVnxSLCZadmyFzkCniUylfZxYCuybVlz",
		@"XrQsJKBKnZgqVJFktGwLbKhVbrLPenlRMsEUqPisahoRnpNWtGlsCFtytLkQslJpXJHpGIdyZYWPZBdsMmTcPRiEVMbFVCzEcplAvuPslBv",
		@"pfxcbOeDejKTLRTVLrczFAVPoYyjVkLfRPafpBRteECiOCdvAkRpxhTvhNgYzJxHUVmwZHCXhxMorLQPTpCbZrZYZCHcmFgQykfGGwGOqjzaKXYDmHRoUfzwyRgirO",
		@"ICQjKHthRzrBzfzSjjSlELqyRkvOlibySzrPPFJFuHUlsgqYVtslXoKVbKcvxIlxGeZgdrbXVAroaXuoeeOeWeHligBvEaDRSpcYckaiaXyAXTLkDjfCLESuibYR",
		@"EXBFPTQUNFaDgTAQGuEkMmYGVJwvSMAWSZghxlpPoZECaptDDYdRbVqbkACfCDknmrYFTkfzxnEPgPUwXAlnsDneqHyHiAlGbVZrzEstSY",
		@"FjUrIQQwWsGTOINvYMOrvvGkAHIfSUPGWHZOPOoMQbHPhVaLtNSOFBYJDbqVsZbAFreIBxhLdPOTrVljMLRMmyuXzlezjUZWxWVgQqIWBIydIIoPyLpTuqX",
		@"tmpmITYBCWHHJawXyqVDZSwbCCGUneZadsnVNsTULuZfbBsAEXwykjoKmxDroXENnaDwMPgInGKFuwBhwBJRzlHeJWJhssIKSAsZxFmGSiAdHFBDjFmxMHtGUCwxLIsDGgOSNJcRs",
		@"DcJdamhtMxgQeodMyqFspSiMbcErInkdnLBfdIzeetqUZuXlezjFcJbXRDEUsrBGoTSJWWkKmErEcHFhIOVOpkVRyzZZVSBvWazgsWAExiKByiNAVynwWSazxQYAAKLl",
	];
	return eDPbYmpNIr;
}

+ (nonnull NSDictionary *)uknunUjDsGASumdAjX :(nonnull NSData *)wyxsuOZgEGFLlZO :(nonnull NSDictionary *)ZzAJCXxLiechF {
	NSDictionary *WfEDqzpsJiOuEVjWNx = @{
		@"WazOlMdWrfWVsdiFu": @"BLrpelYqjsmEOIyeWaqkthhVjhKvrETzeyOTPFFluaGVHnrlPsTrawUnizNZrVWxlvSEAMMwbrUwJqtBugHnYCzmodzNpEPIEgWfe",
		@"fJmjbODoKG": @"VpdotqGkbItneMpEGVyZrrIiOBblYaReMQkOLqIPVbIyCYcUXThcJpxyLiokDcXWyzBVnnCRYGyaCrpyASYriWKNrijEimuKnvkWirPCBYCvSkFYb",
		@"OqVnrnoYSZKiUFblbFF": @"MNiqjGxEfHcBGsNcEwatUVMGACWtAnbnSKCFKQsGslTHyKFBqWQzVjhMJeDrqIDHewnaUKlNPHobXPgibjXZCJEkOIBmsqjtUFaRTBGGxGlecBNyHiOYxOfDyenrHJvHpnxOZ",
		@"EKKBsBObHtOz": @"ArLkbbCofzIHRoMFVAOoyhvzvRJvTkNuejbXjoahdjCZXdWQblIOecnDNaVEaOGzkUdNiQloblIomhHcucrdoKjcjoCdxZHXdYPgTNyKjRSEPxEuDrZLF",
		@"XsWzsGaQPi": @"nxhIcRnEAURJmzwxPRfcKbVQuekOMYXlJCFRtxPFmzthetbINLlTFWgJxjYOvFWCawmZOcDEbJhIZqmuXzIHGsKlzMlYFJjaVVGKiNrkVSQvJotWeENAaCxULqOtASJMjhjOyrDAJhAJPh",
		@"IRCioiEPLmZYfI": @"heafpNXnFwEtCBvMYLrxCMFGZVxbuQGvFCxfCdXZURqQEwXfFlPgnjfWoVfymlJnEgmIWuGBhBTmrwvPeKoHMAqrBJWbEXVIUKXdMDETfBubMsrATwdyMuEDilrajTErcTfEpdZUNWOLDsytQSR",
		@"ExjWxMOBrWrsla": @"IzqNEzqoezgLHDXcofwNenaFQQAiFkcinBUZxUCxGWEzdqIBEuflRAIClFjpjBuuxuoEwncGHYvKhClkApLowCYtpbyysYqliESVstiqjzDARogfnfVCKpaJ",
		@"FAGIilQbKFbFNtuGwOx": @"dHfpElrVfzOaeplsZZyLHdPOBVGSZacuaZQmKkneENNvNmdlMiJGhzPhpIjZGkdiPdFZQDoofvYGLiVrQJfQbzkuBlKhqXIudHcdWDl",
		@"AdkrvHYGbbzHqULbUBQ": @"dPvNAxyZvGUntiBsAapQlyQwLPIBwiUaqcNtoqqsgETPHfToOfZMAbxnHflBePfGQbgdfZNSQikjgBDxlMWUAbynLKJralpySPdStCjYTKDTQwivysYEyIWmjSyWmhzVtz",
		@"xTCcbDDNfr": @"lXyoNlhPjanIghBxCEoTFCyvVlpQfhSwTumOYjYyTZbMEoyYAOCSKHOPzwUvtsPXVAXclESHfWbWeUfwBvyDQtVuZvXnqGXZVmcVJFPFHwGNLhLWQo",
		@"fLzSEnDouUyXuRr": @"VWNUWcsjlNZTdLwSlKvBINACyobFChICutPsgyARCrvBZvpzqzqqeQfXwdrzwbUeIoYztxXbuVxEejOYSRViwXlLTQJfVilKmzjyHt",
		@"ZwxPhEKducyvtRq": @"bKAOmjIzMKjNvVRlVPahGDScKgPOOyJsMCPVrDAtiNhPObVPfhbBhfQrZZGnEkjOweDFnBpdJwuQeUcvwbSgSMtdjMqqmOkuBTITKsYTiFRkvAmjAPJOzmVg",
		@"lrjZTrgPZozHPXhZKb": @"MgIwrDXJfIdQtFAwOEKjhZbFhoDeQuhHuEhNBKDBFZXwGulqGYamcvQRDPIXcNRCuuKjEXeybZACbMgQBuhfSCHeauBsPxcWgBSTBpmCVEfQWnN",
		@"XVNMpmUcxoSNBz": @"AreoapUGyBkqSsnSKXqcocYmiKpCNxdixBsbNwxfBOehjqxcXAvQSbYFQitTzxeiAZXWCOWIbAHuYlrfaRttLBDutKMftUTiVxVLBrvSVHzeBcyLhSDjAHjA",
		@"uqPfVMHYQjBLxD": @"smDWmxeFBdGacnGRKMPslpDCFSYNVghUIibISXOmwthIgwmRZVCkHUPOOkrGTfxVevYkONLQxBPXCLyyxByGVjUTfbYfNUJjwiavKw",
		@"qdvqKQhEASEbQmfQe": @"NcXEIpNzdFqilPczeYGaFerlAbnlsXVWSnLQlwKjtPBLlWpntoekoxNjhAOMFXwCgYYmVULTuMTedjibBVyHkEIDzaqMTkKnaqxRjbJNLvBflEgo",
		@"GkWFwlldTR": @"CdBQYOQJDEIDZqYOGmpTCKfAtpDLJVHVqUzTsDYwsAIjAJpBCkvwXaBMxxgUAwmugmRaemuxVNYloJIjyAQIwbAIKlzDSWDaUCenbxeNmNTlaYw",
		@"jyzhvTCVudCdifsAyP": @"AYVUVNLNcieTfYLeIoAtMIwqdGNSaufyVmUNVOQabEIYqLaJdVPVucuyXVowicHuFkyacgVimMWQXxhDBcksTpJDXLVaPyyKTekorMNJYtqXbiZMcC",
	};
	return WfEDqzpsJiOuEVjWNx;
}

+ (nonnull NSString *)xkRRJoYQbj :(nonnull NSArray *)RcAxSjwnXPCYaK :(nonnull NSArray *)szlZZIysuRj :(nonnull UIImage *)GtVWtCMWQijzafiU {
	NSString *qWKnZQmMcEc = @"PFZjyVMKBzlSRvrcwdtbTLQsYfxZjnLqYVrHGDxySSRMEIMXMKboIYpETRMgyLerDPXCnonqbwHtGKTnWTTqiLJYbbljVxFfowIOAUxASzPJMFtiFPMTYRtvVFPGvTmPfbAVJwYOZafOxetBYulSI";
	return qWKnZQmMcEc;
}

- (nonnull UIImage *)hiSbnLtkRXOJFYHAGSd :(nonnull NSDictionary *)ukFADqfjcw {
	NSData *nzLyulVSrFAnbLdxZL = [@"DBsSHELPsitSglhVtvevLpkhsyVUmLGzoJSbvPMhmGQXtEOdwvtAYwuuwVXYpojvQwPwQwSvABRUFEKkBbzQlDNUShAzmGwMVZoAmouXe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vUbhrKJFxbC = [UIImage imageWithData:nzLyulVSrFAnbLdxZL];
	vUbhrKJFxbC = [UIImage imageNamed:@"SCuBUbCzWYbKqYYoENyHiupAfzGlcIgwGPxfCFqztFExlmLgKgkDaZZbyAzlCAvJyjPXkqoeIXtvmZRmwjUIqwwWFOcrJFjLoUefVVypJQYgmRLtCFjgAiu"];
	return vUbhrKJFxbC;
}

+ (nonnull NSDictionary *)IKymVvdkvYoRslF :(nonnull NSData *)NGbdDcLVrLnlNpwtN :(nonnull NSData *)IcsMntMkwDu {
	NSDictionary *LCTFkTKCfWevAoKuyOM = @{
		@"PVlQVyYnbrQcsspp": @"vUayPDwZDVKWnnljaeIylxEeIBRaaUlzEhXTgwYZNxmAEmYwVlCMeQpydJfGmGJnoIUnseVhLHyDYNBCrTQStBPwpHUtHHHwAalEPEzjhenvaluCGTDeDItIOGTTjLVJoORIyGfwuXEwBHGqzBg",
		@"KTWotFXMBdv": @"BQlMfXQigvGjVMTmolvDdShJkhQZRylvPenzaDfgFpWqRpQjVsvgbNeuMbpitMXuwdWCauOApmjQCOgrQlstfLevbjcJmEoXubaFUFAU",
		@"ABzNiCcCFGw": @"HRDYdqQJxdZIFqWUpiErNLTchdVZNYrNaSEoLRqMAkkEJstNucJUYgYiQxwvjnYkRksCKsKkLoorQPcskJEvZbobWMMsQIpySTWRKMneYLAB",
		@"bNTgVLJgGgffiobYdn": @"kiWzWHRDVwbqNPPKNeUnFjWuWjmPQUuomrsMLwVUFkhhFnuAtblXnmMRiOiJqVDiAZNFDcVIWbEMtakjRHXHznuOqJXrjFRZTjqVWnpFzrSPaKiUNXnlZ",
		@"bRNkPhQYRLzKSYpuId": @"grvolCVPBAPGPrDmeeiKjNFWKUbOSCSBEQnebpfrrtOiaQGtCLIestWBwgrDPAATdKdYbAvitOXkHMqBQPhdFbqLWCvSuZzALdnbHRbpxmXvxzpbNHwWxJeaRenfUsOqcIMtgCxDLYEwkgk",
		@"osNgMTOYNYxM": @"JTZPQflcktXbTVwPGpTyOOWvMEVPiqXwmMyhvUzaVkHsNpOkplNcrgfSKZWYeibkohvigowaLkGLrWUzdJRNdiuogkadFIoOrxxuGJoCfoYZdBnNjhiFFYstIcKLIVZqsLl",
		@"sCFkastSmnYFm": @"QMIZkCVeqqLppnWXEWMHFNjzqlNfjPTioCFtmTpzypSBOmpgxWbGqZhdiajbHLoXNqQiPkQPsEQHIDKdZjxgRjckfjBPdnYsOwJnXzdpvKYnGKfWmZhqKDSmHWVoXDVWRMFeUqpYP",
		@"vUYwpVvQUjvfMqwhuq": @"DnxzbipKzeWZwQFIbnYCQHGXJzvqBoEvrergiPjmLGAKlhhMqrMorcizHHWOEOQUWESzIifajURKoldKKiAgfSJAaNYPskQNmOXVeAfzfCpiqmdxJyfyCOFmFTyCRavPsSlnfFAsaaEM",
		@"NHBVJsNTcFVbNW": @"pwQuEoikaGRhioWSMfmXnosPONCLUgRAlLCUJHujrRFsSDVcMtrThDnRurOESCTshgLPJRVNQPmflNrrAXRGSNmBMpOIGwXZPgyKYxCAjzrEAxcjscNVqgMIDv",
		@"jQkOXYxbGMxCYQFDlX": @"XcXMGVdwQMqwSqLKJGWkoNvKsJgkMrTWgwfxQaPLcehbpzmmWZJAUXVnUgMTfynUWHelgferomtqyZfCOzXfRXCIkwtgiAtXIEpsEreJGiFVPuaBbhkXGJLkQUfUhfvGmvxqDnbLXQo",
	};
	return LCTFkTKCfWevAoKuyOM;
}

+ (nonnull NSString *)RswTlHraAsuFM :(nonnull NSDictionary *)PKSArDrcpjjIDQX :(nonnull NSString *)CgWPgfgmOR {
	NSString *ghUQHksLSZvXERvNp = @"FVXEqNOqvVTUNOYzbzgvWzFEIEBwQnrBhGVLFedLamEAhULDtsXZcVqbvQmeKRxHQuTLbwANYxRjdYqOLrgVcRpxnOaETcGozKtxccEqo";
	return ghUQHksLSZvXERvNp;
}

- (nonnull NSDictionary *)HMKuwBqYCUKchasynsV :(nonnull NSData *)TGMdUqmCnqvg :(nonnull UIImage *)UyrfECEakBhY :(nonnull NSDictionary *)OiZTAyGdxMfQwm {
	NSDictionary *djfqCqcLzkpGEYgu = @{
		@"vDrGlTKqygkNZwtAFt": @"PDERYytThPACOwKPHKWyqeAPAaAHgGJoNCkEeYxykNogBiRGHHIOqunclFQwMAQdexBkswUqXxOwVWbTwrRIWFGiKesgUiMHykZFj",
		@"LhWUtLlRYHE": @"fhVdKqbvYswNMDTRZSauRlbkzdgnkRnJQOyaycetsQaJQNJLPBGdNUKDzPjtQlPSRtRkqkhUzZpCosjCchJnuyJPnkjKyJkBKrAHdVyEzqYgUOQQqarzAuEtHvgvrPlfdACOXTjFUdPbiXtsTzJfo",
		@"YbzKhOiPrxGa": @"RdJuBSkdVuQuLLgDmIGMeoKttytkEEPgBbpkNfXDhUFRroxpxigcNkQLWkMBpncrdqthYCKUYgPpdwXdZoTiDyeonJOVOIrTrnxjGLPUr",
		@"qvYYkyjmXujd": @"HyGvkSnjkYegcrfuaYltNmDAtREImIlbJZelLRlTqiYrSFbegEdUHvoBTWRKxPgIGbdhMqQTarLeMkRbcuVExSDyDnVrMVhFifauPnLLKRUeXYOPwtDftzNrpaGWZIgBywypAYnBDaLYuD",
		@"eooctIPjEGCHJjL": @"JPQUjoUxSFJdUYQgnINPuqoKsWDLtgCMeGAEEYNruauzPqoaYCwyeHKHdSHZgMmETkDgmCyHiiNewOySEIvuuTMUKOmofvXkMVItDHAUuepnUwCmXrDnQZpKs",
		@"qbTACipIsfZnBz": @"HgGmcCTJcJEwRHFBgHDSjjFTAzKGIQpIGIVTnLFaFzHBPJRhrBcuFDCyMjwLjnovPlSsComVSbMenBQOIBTvDEKacqicxLvhWkSnTJDYEMfSGXWCBGMVPSynAUWBVJlZOWWNNwpYPcIsncyYsgMY",
		@"JZwdfXAyzYocRsCJqb": @"FVUpaPJRwZQlqLdesEAwpLnZuQFemtrdUhJVfBgTjiTxIUZzYvzTcPcZIZHXkPesGAZDDlqEKEjzIybzwhtvqSPSQiPSThxMZJWDvcevMf",
		@"rasRrhOYWnwLD": @"nYXcjBCyiQVtCkdDyiVnYHpKVUNrakwrzRRESjQtSeTHjdnHREVcHMgcZbIhCNzuUHyfNTsNyGmMeCMIPIbekhQxICqJNgEEIKBnwMqrbmePCMuwgtIkpZCsFDo",
		@"oivkGdIiZJ": @"FdmoPaNIHYFmoFpxkCVaWMwyFLyJuDKlQsWUoxtFByejqwZaZNguBzNxzBPTnFnNOptFeOMfmXWmOJXyvbhwyJEarQqcPEhhiTBANTlIERYdIKKleEsvvMzDTM",
		@"bzVIIxAFPQXTO": @"xuqkLbwcIsdRhJUiHnrdBZsOPbPCCzDPtxYxkIhIncvhaVKwRshAKFNqGbrEXkJlPoFQzYoVvEsDiIxgtQcWqSBbeUwOhgORwRefCsDYOEwTjlkxjeeYrzAYAFpLL",
		@"HpVclWqTkePpeDvxCa": @"glfDFiOcmrHxVipoJGLcktBSSMAShggNsVufxRHHXOaTJeLAurndXoBLSBDEOTNfDLvfSurzlBmzDfhATmTHOsGPWjINSnhIhElcZASGIZvMDjGgtlqezeNIfnKvbG",
	};
	return djfqCqcLzkpGEYgu;
}

- (nonnull NSArray *)uUUhEvhapHwUwmbJ :(nonnull NSString *)WehBDSGqGv {
	NSArray *hUOmtkZZhQUwrr = @[
		@"lOuRYAsztqjGXRExABjEFPTthSyctjcQVWSCKOPudeYocziElZzGjdBSFQqBoSVgdLFEbsWNtXXTfGzOhPoOKUOOaxVgnXDqCOmXQkqLopfjcc",
		@"DFQIpstEHfbCBHobNNSfcTKQdeQJWLBeIhXOHHOpIFdxljCtpNfWhmOuPLeINGapRSbwhKjFLjRlAvxyjphxepKWuwUjgWGpQESSdXGChUtCqulrIdQXDchWphovbNIsYYXDLTBKMw",
		@"JuBzrqRHFUICSXZCNHaVaqiMOiHUIRbFZrRrxeuGYCvXgUhCEobaeJxxmwNQMXlYNnhxHsvzatLArXWxeumjVEyXaxgQuSlTHewEwhsYHug",
		@"jBruAYCJfxTBJLgmwkGJWBIArRygurYckMkxLTZRbmTZTpnTXwiEmnJpiypysQRKXKwpAiHqdYareJYKXUmhUUUPtKzhyOxhGgFEOujTBERhNhQnWrDrdDkaVBghta",
		@"cnJQYInobXZWpPdckOdTksNbooHbRBUGWsxWStTFZMYXySLcHxxGmevvRbVnJRpbQiirpMGgYijyvxQnzkLyeDRbhyHFlZnLzUbfNKDQiTyHArEThO",
		@"FdzYbxRaTeAWvYHmHtsvMUyfNMdxsZNpWsOSWJXCgRQkXdPOiPwUXipGsmabSGSCjhhzKTPvHMmjihnXkpmrgWXgCThyeeRpitzJnaDFuiqulQtNFoktqBzrCqEs",
		@"sgbulAZbGEtXxPGjXPNglcaomCDFuPmSZKbYIbmUkFxsqfYCKbjKOWRTKeWayCxynThJiAXCkmiiCJjlcdubkRgwmicFsenrWoVzQceNyfTflHR",
		@"ZNyKnokcuSmXLBkqoAwUEeHQbEYKmlXVKuqbLGqTdWIbvIVFoVUHPShMhCnZsBLkaxCiFoRWXXZjwlzXdTGfFqXUmyMvVOnfVvTskVtEcVNi",
		@"mNnnNGFITqnXrUtpTFZmQaYnohzGftkwWRHywXFGyLFqpAGhIwzBXqpKOtTKxZGuceagvpGhwnsFvYvtmFWjHhfGkWWIfBkwkIUetPclwKmUQRBh",
		@"czQlcLyVdIIvmqFcDhaLXHNdyXdJqmYWdjhmIMzbuGSBDsWgubanjwpczmlxdJpnJAbUSrBdcLvLpRirGqXzHkPuDgzkPGVEXzGlmzuDBWTCaNlkjUmGjWhhQXKrIYDyn",
		@"tqhGwxSmBqcsmXlkJmHgHXfXpWFxwaHMIFJMvwRlflKMRrDmAeVSYQMAVlCsqXqJAprodQGcshsuPbiDuodVizRYXHkvVgpCwpPFBgVvfIwvsDiqtdTHki",
		@"ESpcvjDyjNEOmFyejQcCXOIjLjCTxdmxKSyzsHkHiRIhxjboPJMtHoCbyBHiTQWwEsXAYrYXVJwJVUHSENXawKcDLmIhiPdWQNojslBFiZraZzTliPNIx",
		@"TYCCSyqrOlgEvdLZjDDZcodXONnSQNNAkgPNliPwigjWLabYqtknfTBXhLwpJmrWsiPwTXxPldySjlxQuASukUPYNLjWnpFVEMfnzE",
		@"MqXfmYBBEtlZJRENczWxXiphYyROHBajJJkKatScaStxGrBMTqNkHQghwwjMqTEQImbxQyGPKBCoSYaikCVTuIooQByvtCvzMSIcnbQFEIagRDhMDrURtwQDnupbOFDJWPqSvLzhyrionpw",
		@"QrygZfYRpFAIbmHeSXIQknuCrAwsdACeixPyETzYRfwBBbnffaSDDBNNTEqKjbZsixMtLavctckeIFxyGMNXckSHkhqcyXJmHZRQffEEOBsQGTWITJwEzKdKyMHJhebdfavOIKSPIctCggC",
	];
	return hUOmtkZZhQUwrr;
}

+ (nonnull NSArray *)upksIzYGqmL :(nonnull NSArray *)EyMEMhMzHtbXjja :(nonnull NSArray *)NQltdUUSLkWy :(nonnull NSString *)dzMMLuhEfwbEQg {
	NSArray *FPPWvZZTrw = @[
		@"eQaNtKMmibhbzbXkvbLlSyAxFJueuqmBltYWPjLcjXsTvlfWXBvraHLnhgdQBQlUQShzMjSWuTvjRnUOZYAzyypUWRTHxMpzetZrdIKDoJtmDEkKXmGhKkBfyEhEXfPfOuQDg",
		@"lZvTFliFvyRKRLBbEoJpxviDpDSSMuySBubQfZXAkDRfpvAAMejmSRBGOXcnQFovFUjWmbZKcKfZbHGHcGvJpKAcRttIzdqXLZmoCXVZgOuqYFkWLJsqWBtyrWkKLoA",
		@"WANwDwZSiueCnOQTUjdwwJANYNkrwRcXJSHmxpMSYUwBWZTftndztRFPRkybFciwdKwQfzTQMqERqZxUHVJSuqXOuRgRmpoYEUPGtjZ",
		@"bdUzfuVqiItPDSIFiwvfGCPPJULhcpYSuagTbqmjGovhrwbuenLrlPcLYJRpxxWWJkKSCeebaHCbpeqevRwMLGSUjaVHbaOVAPALiWSDSCXbeqF",
		@"MrgcGdsYsqeEvGBHuUYSDOVoAMvGiHBoADZTqGemVygEtYWgCFxXYOlksgOrbvDOfYGKsvIEvuLGSgOUqFcVCjaQCmUJcvyEOAzRnQCrytvhQCeVZRdJXXrmErEwpBHEIyyypjZKOZ",
		@"rUPvXdkrpJlNhCKDwOiIHgjfQQSnBrxttUUvvMmjPItuHNuDzkgcRidTKHaOcpURkGqLZbnXecODaYJBeJvjCkmlmcKwTDubBBCFggaIwEeo",
		@"gsjcDKHRPaXjZkCOjKgghmJxxhioNkQraVEfOEqPRvbiuyQwPzGUFBRIrmfxMQnzwkvfkUjdqUTtTyfFwSdKWVUHXigrFJjvHoyqcXrxJxWSkyBhpWo",
		@"eqmeWDjkXSnIzBgaEivtZeLfXQgwavxJEUXtknMpYjcGAtOckKBfStWfsiQltnuCWOCCadrlqAaxifWhXfoXDwsfraBmsFrOlmtKhzltm",
		@"BwDwZdVRFsCBUxzwYnUUTCESOinLYmYuTSWhBmIusvudYPZZOhmxcevHPtEoQzOKCqZlTXIIDwvhoMZWJTGDQVAMAoNRmDnSbnqHh",
		@"wSlErUajfAyKrhAaKEnMWFNnzVmLhxmEFyqxkuzSFqImavHQwZJDcGPlwZKHFfWEbCVRRNNFsXpouSdwsfcxRVtsNVggtGmmyeyXPQxPsgulWPHMYmGjxRIFtckHIcOLxAGYUJZ",
		@"pWXhrgJIQreWRGsRbGNLQdefUglSjAXIhbtnNGivyNLiXSFpBrJGuRmfrbZkIFLwnAgJPKGAmGNhtepivDYcYNzYajmaSUiqGbpSnWdwjOU",
		@"nODJZYgfJWkYIpWqyWLkrWUGYTVIOXqgpZXDuZPpqtGKXomQxWuXPNNhcUsnIwCjmljxtOKcWYpHjxdygkmyzyXurUsKaMVhlitBiyryVBleothEUsUWHJdfz",
		@"FAnluoiAhBiCnFxRWvKLTRcXfvbwhoKFBIjsOGmLORhPKODWvLEzylLbTjPlcZJiKqmhmGGUHJfmWWDDPjGnjCxYLrkGKsuKWTrdvKyvxfSLPYATkMGwULfaBpaHhTrQi",
		@"WwWyhAuoCZKvJeUlODEFlfGqoGDVnQhsujlOuTWBQUONnvNpmOJcOMfYwBIabwINVljiZzxtGkmfgmuifgsReuESxKdSWJwYHSBq",
	];
	return FPPWvZZTrw;
}

+ (nonnull NSData *)amqsUqiMdwubhrKyPE :(nonnull NSString *)VDhxtauIKARz :(nonnull NSArray *)rIcdtxVhAQTJQevFH :(nonnull NSData *)PZhQawMJtsqLVS {
	NSData *YeYEkneKTyyHQrzY = [@"WULPqHLJTQGMKIHwvbuwOuvPhKLfERzBzIVWysLIZmDYtQezqiYDDdLfRHvFMWYRFkrmWYrdhbttTjkWQkcVJwBHLVJcSdNyDGTRPgAHohtRpIZkSBZbSlXTCVmebcECMRKmtVabGGXybLgaxJ" dataUsingEncoding:NSUTF8StringEncoding];
	return YeYEkneKTyyHQrzY;
}

+ (nonnull NSData *)VDdqjkdeutgjUJf :(nonnull NSDictionary *)WLxwTozuhNXjUJZhkXI :(nonnull NSData *)IXoGKLHKKVLMCIgQx {
	NSData *pLDgiygVRT = [@"FGDexDSRyVcLZyjIpqEZiulbCAFlwHFAnCcojXxGrfvyJkCZuvkeiqXSVRCQCTIVUsRXgOkLRknLhPsLEPcroZfNqygHsirDfefqRxYiiXFiRGceAbjNqABtgKIYvOqZxVGaNDnloqVjIURyVyr" dataUsingEncoding:NSUTF8StringEncoding];
	return pLDgiygVRT;
}

- (nonnull UIImage *)kIghZGaslHuxyqYlOT :(nonnull NSDictionary *)gXBTQdyrCW {
	NSData *ZLaCfpEXKkprbRs = [@"ILIsXbvdEVSvblcExGhfSINatODWQRMiyUHFTVkUQiQiOnJoyrJGFasZqBcLjkpoKufGaDOSsHSBAUAoiWVjWjkyqnopgGlsmFvXD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wsAzmwbytjhBadh = [UIImage imageWithData:ZLaCfpEXKkprbRs];
	wsAzmwbytjhBadh = [UIImage imageNamed:@"fCnWrGfIeckmpARTuaADBqVGwOwbIpLTTJJNUgzcrsSouAAjhZZcPVQnGqUapSDvxQRLzbgIJDhrGETFbsBAOrfgtVUxXgtEIgXKozdIopLiRfE"];
	return wsAzmwbytjhBadh;
}

+ (nonnull NSArray *)ilsrDkhPdwSC :(nonnull NSDictionary *)hvaazvhBnSFPABwZ {
	NSArray *GjzxPEJzEZFjBmUgfea = @[
		@"ibeqqGfpSAdFUqeGrxVRLfqdfWuQldRCYIvmipqvJXcxwfJQEsiAmqeqrHzzetXMZcSNhxXahuKJUsqcRtediZVvuJVxphGqgjOrGJy",
		@"XYndjrToMJsOOavemaKNREapNwukothADxmBgdgIhudFyFSTDaDCsEfHawARREnkXfYutBWxFAlKKzLVLrxmgljAHryyuWdYZbqSxLfbLkOcbzfhVeyilqQPpocwYmwSLoZN",
		@"RoyZHXTIvLPxMxrqEllOaVbbVrMLtYrzUdvOGQXjcqupzvhgobyZMxJkoJBJOlTjEQhllQiSvtUwOpVzNrdwoOvEgpExUhgWvYEticFwQGsKiNqAzLyzFRfxjtBvRwQchvbsOHIuUfN",
		@"dZmtzBBrhFaoyzKSQLcqpwJJoWWNaJcRKlbBHmxyDQZgDZeiXOyrwGSYJecBFVCvdccsRQYNmpMCPFOPviYDmygxAaGFNNHAbtFNvsSPtCGluIY",
		@"lLHqQVYBEqbMbFoMVyftYpFChSCbZWwrNTuLlCcdeJXYBODJdPtijpahTMfYDvwluazXDmpSPBaMzjIxCcYjwRoxqvtXPMyZsGpcTVXCmIufEQNdCQEVwiECEzGqJlEpTj",
		@"hUYaigrgCBasaCLTIdIaHLzSUBHxDsdzBNxztJbnWmZBiBUPMnkmqAoEmGhLCiWqaweEZrtKPbLkXTpdtpmsaXRIviqIKlZhvYzCxii",
		@"yCUUGXwKhXtBqfzZAKWlywcinkyGZNiePwbsNnWlXItJQkThxtLKXVNAZvjPKSLbajlBoVsjAiWHwKqzLkbhmeKMECZvCiwdZKeElZ",
		@"mhuGbWIuuGEVUzWQyDOghNOigYamMTCdUZzRplVYHkiKqWniTbgILcMwPDwfAxouFYTYMUjyUbsgjcTrwVjKvbIyUDliYlrNBmyMlsENS",
		@"MGDyHYeKHnOZQQQxVoEWIIukuRpNaQvcDvgClIvOCoXqFCQUJQqXoIsQIcuZyjGKIvkyrLcoVWrDrqZULSzcbIdJpIgEuGPyawHSsFEyznTRFQSpHxmoOgiGBhqumPbyuxPqPoKQyEOXufDxvjzb",
		@"GAvmaiojLwZRoBsbfkILElsBcXpzeScYdDBVQirodEoQRVzobdtowDtIaaQqIPYNgKHsVzIpumaFsPaFJopPXrZVwIUUpZkvHWDTIZTuXnnnfhexvhQppsBAMYnRiRbJXShKrDXONTGPA",
		@"HnJgUiAmytILkORZDiTvcmhjlqSTIGjvMJSIjvWgoUlbnUJQinPOxVPvnjqBGTCAOoeNdbbwdSPZIWefhjeQfsyGQLcOfnPjulBYRpD",
		@"vWNcKMhCZnNsdNPxmfiASxKlsSxsRfzpymxcRDzTtDHksmkoeTqbGOcfTeygSklOOyOAOjvXXtfuqmZEaVzMaffRnhGcGdrcisTSgRCayZECQOTVwnBbPBwHVoBeayNxnoo",
		@"lFWHKFPYFwudlYxYkvJciPuMrQJTcFxWKuKRuXHgCMYdEruHSawCNhAmBDuOnoKivPiqBNgmzMAHuUbXSSfUqtZAaRpatMEyXeELUAE",
		@"WioEZWLzFVVDkSYhPEOwJHauOCLSEmrKWNMVXEafxoupeCDOJGxlzAcNUBdCwrqRgVMkhutldkLefXLTYCRuCjGBVcmgbUTjekvHgArCETkuUWXMfGiVjBMDRmSKaYgYddI",
	];
	return GjzxPEJzEZFjBmUgfea;
}

+ (nonnull NSDictionary *)uJpVqylPRefFpjPcwT :(nonnull NSData *)zWURWYJQDg :(nonnull UIImage *)BwOrfklDyXFCHTEi :(nonnull NSString *)WHWzmmVQFfwauy {
	NSDictionary *ZMGWfdfVpgPYiNhAl = @{
		@"BGwxoEHqiaaT": @"tsbmPtJhCRvOCTtzCduHLCMBtPdQwPDifuQMprvFvkBNQoEiNGqFSbkqgtyIqfncJLgHKZrUoyhIUGtfeTkbEBpodktlLxtGBPtTPk",
		@"cuhkvKAzbMZqGliw": @"tJwFiXuXnTNIEdTejaORtQAmpMmmiXPeWYMuOZtbpreahnCZAOOtPoYzwdAXVfRMBZClrihAMcVWqPuzzPKoqojskfdmlVHdDsyeRWeIUmeQnwXdXhreLNFLWjdXMzcPIWXZkkFWCZk",
		@"YmIwGlkWgJwL": @"aSPmmcBaXPLfZtVCNecEBchkdOzwoiacxGwgFcOoLVWRSScQxokdBVjgmCGZfzVAClOzumuwbUenCSSVRhCvKxeHjKMjTWFRUcJTmRhYvMMZEpTOncvNGOvEeQiJiXMglONoMVLgkSDx",
		@"nWUsmhQMxCZmSqq": @"smmfvkSejKYhpsSOZFnZwUaevGaceUmBDuVWyCBRtwqwtSMnGBlhbXOfskdKgcnPybPCaOXbycufipfMFUlRMZBXdKEzbGTZjmGiKsUVkgeIEYWdjNPJmveUSiaSZPVcOHsBuEGAqxiTu",
		@"OJTjrKcNjsKrJmThYR": @"AaqzxBBAGJccrjqOioYJlxeGbesKAnfosfagLKxPiKwfQJVKdGTzYMWxlvilJiGLAUbSUHdyCHyjNwGYDfQNRjyJiFezlwhcLfdgrflQpdqJETyU",
		@"VGevMtNSWrA": @"itfJvVeTQsdksAMbgaOPGrpdBlBJQekqhmdwLycCpOJVCtMvATQoTeDYfbeczStxINoieEkwUHzyjXEWqSNOLMhFMfAQBuYEMkOEsAVYMzTtmtWtIkGKLEsiRPZEXUcQ",
		@"CBoxIyaRuybePGrOnSe": @"LFnxZORBpSmvnCgKfFoCqFWIsYZnTPgAYKPiVuDWPYaACNOwemmSUnZgexvyvBCAgomTDvMBEAJOWqgvxvVYugcRUakYTHiDxtHozmjwqSBlXWTKFIsRwB",
		@"EEpbWaOmBpSYJwJpi": @"ETrfTKdFMRUoQOWxiLzXAvGdRCvDMIOPebZzAWeujBvFSdoBWClaXleGkngyVBaOSPIBGmEKFGuzFeMKasRYKrBzPiklfVxhykVdKBkoIunRSGIIjFpcsxKBIwrlUwgDeyyLrTZNkG",
		@"HSifpODAaSA": @"fhRTLZAdQUJuRysZJPVwWDcTZvEDodXMZlqDDOCtBNzTXQYNJUOcxmELNaeSZGRvzAyATreABKWirnQuAcqsyYOtAQXcxufUvNzlBmGpvGTXfaURBU",
		@"TomBxbOuOZ": @"cWVsUAhJtkCyBPxCRKQbpuHxfVsyFoIMPBAKCtUPIKIddlJfvpikJeboXPYGMuDCSENWBbgfUrqnkziRnzjfavPkkCNOENCDhRamBJlQsBgBbPvUjrCBcQKSyUjzHlFHTBIy",
		@"pKNMDywxxwl": @"ZihMTVJHvtPiZKmEtesVNDaYTfUcfZVfXZVnzIslsDlQexilEicLCiOUlkLShLIghJbGMtbmYATfPsSttKVESSpeOqPRVLenZQSo",
		@"CifSKRjxlcrJN": @"oRibBTrcreBEyPrXYgwyMOrSvZxpdZqhHlsBmVRvliQlCznvYiwnXLuBrCPVFcRHePKPWFhWTQUMJbionjyaotZkyeqzCTIlTQerAukCyDpuvTezRtWjZSWazheOUVb",
		@"pVTwOrhVUUNmIC": @"KzADZeodJVxAVJQRwVwZwQGVXdjpOqKsLCBWAnTRiyyuSalatVxxEXTGVTkXdirALuDWYRkyHZoTclesaiKCqlaWbLMhDojEfREAYvQfvDMsjYYMAHTYEZieJ",
	};
	return ZMGWfdfVpgPYiNhAl;
}

+ (nonnull NSString *)ZBLjPjPnwkciCbyCbKe :(nonnull NSDictionary *)SLDQQZmnPm {
	NSString *OrktJDGTqZdx = @"pthCFQPovptgiPCdOZqnHYXQalVslofddTDaBJoXhRNjWRYpSaxkJgaDAHgslogzVtPffbEqmxTPBLAXpYiujNYzBuoIHoBDjGhoJ";
	return OrktJDGTqZdx;
}

+ (nonnull NSArray *)nMltYcCoUqnLje :(nonnull NSData *)iRIBaoqStCsMR :(nonnull NSData *)sKidfZysPEfg {
	NSArray *JIJRtQpFOO = @[
		@"qmeCqXsPHJBVgtqgqwqBWUYrUofZuHNDyRSnWEcabUTNsXsoLUxByQfTfqbkYJgdGfwRVUicGPQstgizJBYkdNQwziUWyyukCbhzWzuDbDX",
		@"aqTOJoZSDajOucdWnraDamfGKjTGZpxoMzDmoGHurdkvegfVLOgnpOGwioFtitqkbKlKmXULCqEFhfKHuQtEvwUijQWIsMpzlGcYSIkEwiqhTpFqIxhyYXyiwtmAFFVqGXAxdWaWtcqs",
		@"MSriCxvvQZRmckZvydUXVEvPAhKyNkfDEUBqgQNoorLDMfkWVarMoVobijmopWQegjrBtIcywachniYSLjZiEdbDnOBvFhODZyPjNcIHRYgpCqjZxDtPrBXzBiepXtcDRnAD",
		@"uwTbFSyhkcnbVoTsnzczHzDEbzKvYfASZElNGBHlXsMiORbFlIDMJluDizDqOxAQLEMcPpSkAqaLpFYdvHXvrzSHqBLIDenyahyUHwAkhLuysOfpZKTPyeEwMaFDjYWObLItjyol",
		@"IqrTGIfWGQpebbYjvbwwpnCkXwJmOAwbXGVNiwktgWMkZmEocsdRlXSsiKpgPlRhObOMJGJDVswnjcPRhgQQVppHgkLdAvtgLThGWvzOaRzRRVggCRZcFuKGitAcLczteFZlDi",
		@"DiebUxVRdIhqtfJSQlMFZFsGoaDYFOtDhZwvFlsVqDwTMmIFaEAlfznfCNrvNvkLbVMfHqmXuiQQoFODYTxNLgwaQGaYQalUhaaeuGWEMKnXZYwiSBjBVsgRoWXVsNMEkWSYssgltKcrCrLwR",
		@"YUSxbmSlhSPRUkIsmyNRGphHxKUDogEUgoNSvuYTASlKVsGPYvnGnSoJxJIBblzbzwEeJudPspJetyfBnHSKNKyVyQzkvWDLnSHlJlOkRClAKkGIgnfnRNjEpnNdsbRaPVLScIyxjQpYVBZNEM",
		@"hHuRrYBINyYFmvZsGdvUboDZDCYigYMyqqlqbrLRrPhZadHEZBKefPbjNOtRhkaXEwnaJptPuuXuTCojFNOIPunpRkHnDuMQvfuaIsNlpJQdnZxtaIAHQMnfJLuzDnrAeuV",
		@"NrEmfsPRObzKWJQWSbnfRUHvubfyOcwSZGQLCdWUOaDqJItDJDarTxBqKIgWeWfGitqarKwUbXIejFBGXySfLRfBEpyVanJBPhWiMLQBSEuir",
		@"CdUDohkvLQHjnkhrtvStjkgrynOixuogcluKEawklATfYhUTKmKeqGwxczqbzMCOFVXtbEpOzOUQLPtgpvRtqLnnjpfysZYSZvMgvaCkSXveIoXiZGzPLAbkCxciwPVFdZSC",
		@"SYaeDFSegpSwrgJPFfpTZCuiYgSCUoBYXOSgKqoJpbMWSNDErVDoVcuqKzLwgEAghKScbRhdRzLJKBjfPzKzFBzhVftCzMhypVBsDRNERFhwrC",
		@"CaUprKMAvBLeMHIGYhNtlBGZMOuLnrTpzAyHlLDQjxgKgIgUFIhZJhmOoqPDYsNpHYMJGIyoCHmZuvazJMBWcsMluEWxaiAnCjmeaI",
	];
	return JIJRtQpFOO;
}

- (nonnull UIImage *)RhUaxLvYbB :(nonnull NSDictionary *)VmphzdFWoojPIJWGUP {
	NSData *bdKPTpMhdapNiBCJ = [@"vuLMpiiIpNIvRvnHKAcYNuXIVjlpHzbsENkcpaYQOvaYKTfiOgpmTxaHsnHmnrEiEwYioSQkJcimtnykaalLYqTrADgLWvgTrstXIRXTyXpfOMSnShW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *roqPAeZqFz = [UIImage imageWithData:bdKPTpMhdapNiBCJ];
	roqPAeZqFz = [UIImage imageNamed:@"DMCRpkRIgjJIbRHDEYtYeLkpgMoJFCkXshoSyKCFAgrwLvLeHMktRlkodhoQPxNOpswaGFkqYDqPmWIdxkYhqkMgZDmTvqtzJkyNkJAeitVBxpSrfodwp"];
	return roqPAeZqFz;
}

+ (nonnull NSArray *)jKgGrPkodMBgCvxWFlA :(nonnull NSString *)XOZVIIhWOu {
	NSArray *luojcBZWSzyEIgPpePs = @[
		@"HFYJChYrcFffKSUapgFycSVBfwtHKvefqRKlqbextkBHOuTFrfslzEwadrBpCkLWeFLRfAVYlhaduLzfQwTuBDwSdrphcItNXVkhZZLdvLxtzXwJXpBZNSYAhpaQ",
		@"KyBfguKIreYWfAmDoFRTUQnuHbwQoBNvzCViBlhqNpHtAHvFdrwOCfhYaakZrxYnBeNbfwemFlAevXKAKrxGXQDmHlKlFPtGcDYYqVaOoLluvBKWRkDEVDyleuNilAsuXiP",
		@"UzwoDtPgPKynzdKVqSsWjkwGGvhdUxeAdYwSlGssbsjAXuTCYyHuTBHZSdQVBkOiumZoRufzUeojgzzqJmdESkWVZYQHtrCtDfYcOvrcSDzaczswnLwLmfdHgYQAhhLjwboLzNIvaFYhptnigBMoy",
		@"XWmLpSWHdUOSSedUFnyNpPrYIaRpuKwRSpIPkyaXgcTLPQGABdQQQqLzLqwUAFXAJHoQcYizieRxRBuELMoJxqgvGNFCstLTVVlVnvnfvGXUyx",
		@"CdstvvzGedNeXpoWXHnTxsStVPLDZntQHBgmflioBfYAUOsugsUAbdKVFGXfScmeJPnPCNqSlDMuiFbfSmggTpqtZPjJcmGOmaMvEowLRT",
		@"QacWoTSPgbXQobvDjVyCOSknvVoBCGGwcqWhjZcFAVcRFqFQGxqwsSMJxMfddaKeWiCINxBLPpHDuwxxyyLojUagQxntCRVuTubymhokpkgkRmzUqePHMUDGdxCzcQtBnGwZUSPoraW",
		@"rQXcjLBkxktvSuVnYBinbWRHxWyrcnnLIQKyBOmytWGnHNuWhyAHwpukOtNvlUpKaOWASIPJmAvmukpdLeWmmIdqrYugjoMPviEQOyOdEnSPMYvnXjmcEUoRunkFKHqTVJrCwPWxNOYPHeEv",
		@"dgaTuzPqxLzzabHWxaOfthCtRWesJjHvKxsudmjKXivwBIXCWLsCvGsunEOMeuiNmdAzlnuwHLgTujNejvGAtifdIszviFIbkjPdDJsWBoxLzhPCZkNvIAHMrduhyvnyQYVTtATlxSOr",
		@"fadqVQRfNPZZyIhDJJuYzvHITKimhfLhVClWHnGdncJFXlGJzmECsDPenPVzyKGyxFyXceHmLsgCaNuennaCVzaqRUIlInMnPvTGtXJTIEDuMlFDVyDVAmSJpxCJNDqDfMiQhThtiAsJfIVQGucV",
		@"xRqWtBqntvzcKXOOtJMlBrZgUkTetRGqciQKCsZFUFyCMddoPfebVVJXYUZDtxXgtFOIGMkHtIWULcovNpiXxAGzMJPCTGsXcGWkCwbxOUUEfLQrWuLWoGuVtxuIePNDfvimTjJqxjMZDiMQzDAM",
		@"cgfTIngMWbMkLsQbjVZKrfWfkXoGckQTiWIaCZJsxpOkFcfqBLeRToIuRihTRUsfdvoqlsNVesHYATyyQUGZeaUYvTobVrfZsNbmoXjjYoPgtOA",
		@"xkrlVYrhMrHveeOvIQlCrUQrcFeBgPCNduinhuoBtTTUnBgkDAHsjfHfFtegEHZPHPnSOnONdpNzxybFaIRYYBdQLliiIGTIKAheZRKXIpkVMERpAeiA",
		@"uURBcsyDnfMGEZRrVjUGrMnewGUaiLZjHgUfjoykPrWxwxZsKEGDYGpsBfHFLQpdQTiIkKeqxksgrkAHyHHSXTMuSAYLIMHcOAolWNUiiVTSkoEcMATceCskqXfAcdu",
		@"TvHuEskVfywVGipqEHEbpDcxOwdUWnZOfUfVLXTSZFceCbREYwSAbmcxQNPyEWuchJYiWKIUwZYeUmzHtxvRPLaKZIjdhIofSKfQkaytTXLbsUYxSZyyTXVofJizRvhEq",
		@"NPkckXMIbsQjvjXOrdkKyrDcdOFTLKOnqBNkqANyPfmFJyOWcLxWmFcmEeuuSVqqlapDwyuMxqEWxVXKeLlrebZmnJjAuwXtUAEwCl",
		@"EIWvaPmRABQlGsLpKoLkvTbLfJyBaCcWkrxrVwokyxuzGQuSrduOZqTPWztWqNEARcOgcWXpncLWBgdLWgGiTsdtnPMUCXwmklSMwplLFCs",
		@"wioGCPTJNHmuhssSTVgJTuxkHtxFHAErebNsZrguIcDAEwHLvgVUQFUrDnFkgDiXuWdUuSSECWvoGzEyGvDEXTDzQdFkEEooLAQvONBqYvBkgKFXntjbancTKKFlWs",
		@"forfSJxOPYVdrSiaSLDgtDVpcZSJriGPqCXRFRUKpfMipRPnZYZrdqubqRgXHGczfIwHJMwRbdqBMXubaspOTPguPwxCUSSdIQKmiHPHSliQmoEugIjokGaCFEzuQkXRhZblde",
		@"WYmbaRLPUDljakYtNfImizSwoKhfxMdaDmaKYiCOMEgdnkCgDXqoJRQvWcAcaeTPZzAMAHmSXMkQXlxQaYRQvhLnGZdlNsShspXTtxgdShkxkHTJpQcgsDjh",
	];
	return luojcBZWSzyEIgPpePs;
}

- (nonnull NSString *)XTpQfNQOBVfu :(nonnull UIImage *)WJYKngQWoJYDzzW :(nonnull UIImage *)jfxbMFBlFmZT :(nonnull NSDictionary *)LdLndLXJYscGcbul {
	NSString *FBsohepgzYqDdtLHlWT = @"fwlyBHMzhatLDKtZfowHwQftXlMrFzPjvzsLKojtbyAfyHjgXoxIYLIQOJRKbOLfUhqYjIfxHuWWbpkwwvTgpSbKtowUrhMPukQzeziXetjsoKRdfOsaVbKUCnEIyvbEaZwgOZ";
	return FBsohepgzYqDdtLHlWT;
}

+ (nonnull UIImage *)TwIoBhkaKrYCo :(nonnull UIImage *)itMWzVDJQarb :(nonnull NSString *)YpXPHMzulKjvjLqSkQe {
	NSData *ZLIjMfHHmiOCCWUsL = [@"jnHWYgLZZFRCykBYQpBKUOCtzkslnCUyPEdReJnWxTWdiRfGxGNqgRdqCBQMNNhgJloIdHHSFtNTgwKnTJoiMQzPjhHtbyzNlFhmRf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LbBBcvaRUbqk = [UIImage imageWithData:ZLIjMfHHmiOCCWUsL];
	LbBBcvaRUbqk = [UIImage imageNamed:@"wGTIIXssxPshZqXqJdMYnAYwpVylZmAKznqRkvZVZvuABdOkPsqHFjKEWxEqXijKyvDGKyUnvslqZqUqPoQqiMUffjSGAxPcAfRWUWBKvvKlEKVFxVFxylVQocGbyrLTSK"];
	return LbBBcvaRUbqk;
}

+ (nonnull NSString *)FLVDRbotgiLkYXVzths :(nonnull NSArray *)ozfdkgUqTSYrTkhm :(nonnull NSData *)DxhZbgESDEkc {
	NSString *lgLTwNPSWTw = @"UEpVkMoppEKDPWEOUSiqSZTIHYMtVgzaAMmHzuLuGaOYkEVRTresoIfJQlYqVwdATihRvJzdcoeuXbNmIAIZxrmDAxuqSnqBkBqDRgMslCztQtzdSlEOSjbFKlzTDeKb";
	return lgLTwNPSWTw;
}

+ (nonnull NSString *)ZrstAJEZRSpIqj :(nonnull NSData *)FVbzzwmGjqZj :(nonnull NSData *)CKEZNHrDmZuiZsBGXpl {
	NSString *YtMmtEgEaHXnAMyqx = @"TfjafbGaOEiPKxbyQDuziddXYTraphSJXAmQiMWisGwlsHqyOIoSHsnuTeFbDbEknalPeoSnhgEoWdbNuoblOgXVtRMwyZKIZlkyAbiTarbwC";
	return YtMmtEgEaHXnAMyqx;
}

+ (nonnull NSDictionary *)VeUcqjWpAGVnBCvxWiE :(nonnull NSArray *)mUMtEYtcQkpbulNoM {
	NSDictionary *YkNuxNVXij = @{
		@"AhqNcVbPfve": @"CgtIkUmboFskmmjkYFVeEdJDeUPMHfvczDKeuiTXLGWcUBEwvLZdkkmkoagxuwXUGeOsjnSOuwFlivxujvSwvwwGmvwPFHaQUvewUdpUVB",
		@"gUNPDXSnZSuQosMkM": @"ePyPcqWQBLmHpiYAIhWsTBnIrhOpLCENnXyJBzrcjCQxCJDYebNWyeSUagloqdawfMuRQVfBQKvKYjosoweAXMJIgLfhOBtvWEULjFNpcvdGFaDURoFFHooGeHDHXDZdhDsRCpuJhKdz",
		@"rtLUrAeLoCI": @"zVGyDxKiSgmLnqoxMshMohXDyVmCIEIiLLmFDQHyKyTObVvvHaIIHiLBUeUXRRVgvEPRSJVOOaCIkbLQqKYtFXxYUyZvrlgRzTBcwGGIdDOVKvx",
		@"PGEYBiOrwFTjOe": @"CoOMqRyPYODQxUhChqqmgywqUuoQMbzdiGPkphHrMTQDNiJbDEnyrzmdhPmWBtfGGSMoYlkebSQQoZIgadjPqxvXEseCyjXIeIRldJ",
		@"NjJwWvVJUtnyilwpA": @"QnvEAojLZQBTqyCTQpGDzxwakjUqkqrUJyQHhQGTlyLzCoEtkKfeNMwhQNKBhSgkEBpIXAgacGAyAWPpVPPSshLlXWvOlvfnqMkDBpTTFvkDdmAZfokSGaDaSD",
		@"rmBwpaAMAcIHMDGqGo": @"mTVgoLOuMglSvYFCumQIrFvUJgaRXuFzgLbyChDnVabFuelsUIjSCOUtwvwDrzgpRSNlJBOicbaZZypICiHfybEjEeftsxQjtYcOzwVUyIePv",
		@"TCsqsGwugNsDaQpBlW": @"WinhwlnxacTjYopVStnfeCztwejZORXgHCVjYLgnwkGuZWNqhHuPMBYJNWFVeARNGMemYzyohfjkgEKEsWJXmQmweDHGeMTRWdaCLqolbGmxbKLDrFpzBwGOrakSTAxqdZiEwkeDrYrqeHyaoT",
		@"dVidcMdzRpPJDGEj": @"OWTItLXjBsvNKBbGXZyEKdXCdEfvwqaWRdxyjxmTSTYTxijJdyflIdjTRCEZpKHTgBfzeDAjNbNkFPvHclfQavOGDLdzJkAzlDQPsAmKvcyhlpEdLYWrkyiFJwlrDQhzlBYenYnzdYBfqa",
		@"weWAEHAMZRVMQQnr": @"RgDSyVwnCcngzcqSsBCCmudRXERyrOeVbaGTsOUnVOOvRIQOLlJKcjMQgCqJPUqYRDCNTeZEQVnCYcVNhotmumwNyNLjnAUUHwWcnNpYpogcAsJdalmwJbTVoCQLpufgicKhURHpYwbigxZ",
		@"riOjBsSsBNJK": @"ruHTizouSUaknMtewLCnkQHrneTUXJWFTmTHFSUrxaIJtNdrLTXwpQWozswMEeYGkzGHAGXyOHTiOQXgMwMKgIFugRnFGMDDTNjgGBFsRRWyJKUGogasPPzpZfkjObwNnNtwPnKQLcYNqC",
		@"FSMnQbFGIC": @"OBEmEUAsfzylvnTYnwZWXHgdMcuHpYqZSaIkUJLcTskxNgvOjeYpjKKalcCnnVUlfKWuGVEqbbzXBJBXNBloYTyiCWlPpCDsoeZY",
		@"XxGtxhwwTWrEGmWmazS": @"uJohfwHDGHjwjglzrfOACrrmevnuiGHDlOjkyvGdqWZulgtxnDYfEkabblbemdEeUbcYFUFTaGEwuqdBmclMsWAhOQqEdZnGTGzoJYtZHnBvxwuLzdrHYLMXAttvNlAdqjXsGeXa",
		@"XRiFpXoAQMm": @"AuZFjQGJeLTKKEvQenOSICuEVfoZyzuFJEdkhXsJvNdSNQJoGvUEuIqMbDzmkcAjrRgZLbjPIgenFiYelROZWkbXrKFbkFDOWEtDCSHSaomrDJYgmUupYVAaVgJDHSzoKWDnvAGRNJ",
		@"NAXjGuLsyprRb": @"wtxMmxQTTgqNffVKkgeFzIKKhvAtJqFLeNGJtWgWfuHzixXJtjCVvjpfgiljdzIBlllHAMkABqRkcQtkQKcalFoCRhxDdFQaDlXcANTdyWnpJf",
	};
	return YkNuxNVXij;
}

- (nonnull NSDictionary *)LxfmrcDnTqn :(nonnull NSArray *)IaAnPKvpsKiAu {
	NSDictionary *WuXMHMdXOYa = @{
		@"mLRfhGloav": @"BeAhcVlHAcMEbIaEUcMAvdpnGpaFipJnibZttHujufJWYUaNYbUMUZQQjJoaoPsnGpqYjVSqOQtZvsTPKKSanhvGSSIsLAhnhYmVmuOegeGBt",
		@"hIKZawFziyfsLXvShz": @"juJWoZDldWNQBHTgGQSidvRraRDwhLhyrkSrpLlruIsMkeiMgfqHtQcUlFXGzMZUWIrJtjjHcpgJBXUqyLlUvpbYwDUpaKrUKQFzBanmaYjyXyZlHuFUV",
		@"SuzbcUPPRjfA": @"cQWwvfGfDoFhozrbGlnEtaurlJlspsZOOQcGRXevxQQSqtiTiNrzbBWEamBFSgSgjDLPrAhJYGaocOutCEcLcYePChrFTkKZAfJAFINHYNmzDyTHKBcvS",
		@"vRbashlfhO": @"QZZZHXRESPzQctgNbeFKvCmRIMVycapFAkTOBUktAfGVrjaZLQibxjUwTDNbmJZSMMVmknidjRHcUMwGAEMsXQkfeIGAOeLvJeYbwKVSWnlthyQMXvUVF",
		@"PZPinCdrQLiYhnJ": @"ZIpdeMIcnPnvidkRLTnSTEywNTqUkcZnzNHVzCZIYcCFnuXylpJWIdZLaKVOUbvKJrJSgMejpBnGHOBiNzgfZjQxRRetmgNPJQZpKeeKMyQZGiXkCSmXiTF",
		@"wJZPHLnGnVvIvODHm": @"NuGVeodgYrwhonpcuisKQTYtGZBSYgslWPckFarFOTNCQxJLytWakOQVqzAzvQgaxNTfZkyKNYzLJxmqwARMZkRPQngBOZtTrOWTljfWCryrgpoAbHpMxcVcyebszzhVoAYaqpT",
		@"dwbXkYXmVuiciRd": @"uGZNnmMjGqHEweYkoANOHRNYOpdVKAJdvEegtJKHfYdHDyiWlQCHgTymrImeVsIphKssciZgoUJORfLFQMUwjYGYAapIlhfYVfVFOiMSemEFjeQQWsSOUQjrjEPpQKiYqbwmCdEEZgf",
		@"VBiGdeLlPevksbHRAYE": @"xcILRPdMsIupffaSAAutrHSYHMQAGbaaEOoZtJqfVONTVPBBSOqoToaBXqGzrzmpGyUJibuSJOzrYOyovKxSPzFdEMYZLKHWZATssjgfqVtHlcWOhKkPmOgjOWzZeQNQ",
		@"xOWGNROWpfsZ": @"brgMGTIbWhqPGMzMfXrWeUTqwgoZOmuNABAkDwanYWGhtJkSaJHSXOmWmjWalfeVqgbPtYczxugfOLzajLUaFakePmhIiEeokvCqsRAOQlxDiYRlMdkJAZhyEAQHhvIOUxpRsIyEqTtauUdpSkSrN",
		@"xSZLqfscQoAyMlKAC": @"fNCwalDRmitdWqJFAfCboYxfhUhkAYvUksamfFXCQnPmDSAtyljtCJUyAkkAJYldiFmpHmzuEreZeUyLKhlkjGEHubKUstgZbiktrvACPrPTxyraRuWupjGzKYIclUQrnYLbck",
		@"nlePFlNQPtOhshFpSxg": @"SSRPWrdJTPDMcIGYVkcRknkhAlTZHmxGHsfZFRuYmMpsOwRbhvdbBfUtymeSdBtyAJzJXbUvkZsEDQCJPlKdHYrwAqXuEIEeeSFKpmJClCWbsiMyOvQOQKHcMnkqhwVwuejmAhPXvDBVdvGwcr",
		@"gvmhpeDddpISj": @"FyTLBGWvZyHCOJylEZLiijGgAIcPjkwxcmljeitVofncKUKIqgryiOtTEPSILimLJyyFdDDEqFDJXuloxSXWrTURnIjkeETiCGzhXXKofFybGlXrooLVCTOqrcLsKXxDKPLTvMjhRQ",
		@"cclUcGrjAg": @"evDCxQpayPcQaJmLQcozsvDdSRKxImaXVWBDWVlTcIETeQPdrVipCVvoBgJJJxoTQsqrFKnHpLIWugNsyhXicGUTPTyWfmScJDCGKXUdDUmuTCpKHxsLJzhRQyNVWZdJkxnqnCBeJ",
		@"lkviPpGATerr": @"OnzGbnpRflwqomTdCJsHfzQBRqnpulAGSkZivKDFzmkZZGeyOnVgkAGoiwpYOqrUzbHWrDYUUIJaUUzSPwmskkZqlzWxlJPTdQNyTLgNyfzpWpSYCpefZeFuNwyClNoImZKIjiVrCQaSKSZdYS",
		@"hLOBdQCXmLzIHB": @"QmwjHlTDMcTNeuyOCgKTiSimWtyMVSZzNDKpocSphqtqvvRtUpAWiHXhcmpBNzmnfodnNqGblzGxVrHuOQHfAiNNDtBFwnZJwetC",
		@"bhrEhkLukXx": @"hIuCqXhoqISuVaAfrpzeWDEapihgjITWnlRXeerLSOXcmjloZXLiIHDSSsfxuHTReJahdEjvRvnmjhXdIdYUCemOVfvvHHvVOkznWryzLAHixTRxwaMwb",
		@"bccrMLndFDyLCwDrDON": @"vIFDNOuLxgYsJFZhIvjzEnzGApuMntBaBLEJDqfTrAogWHlHcJRPJsePJyEDDKREXTFMUUFBReTGYeznFqAQVRmgUMJJVlYwSxwUIRsJuBdcPAajhgvOCbTOlwqigapEwRdyhbpmwtLtNpJN",
		@"dohlJEJQKwMAIe": @"pNsdxBYwnOmqpcEAMoOvCQzJLwMcwhFPUCqYSstHLKnHhLkdZmpkQFEdvWMzIaFgFZBiuxzWmXImJBQIiWXQKdMgxxxldompOpSdGQhbaGShXJrtADXTTjiuBVG",
	};
	return WuXMHMdXOYa;
}

- (nonnull UIImage *)lJgInGxdrNgIR :(nonnull NSArray *)RfQAqosnHwnp {
	NSData *xrDTKCzwNOvCNvpGTU = [@"eqaFvmApcHpPwvcqEZmQKypSzmraojIrEbaQyAobAzKZiDmKrMBJlVOnCsRjYPCjUafOqcCJcUBuZwsjJkZZTprHuaiDHENlvZxNrUGGogQPhzYrXEdGxsXxCiNIj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xEMVRjeoSO = [UIImage imageWithData:xrDTKCzwNOvCNvpGTU];
	xEMVRjeoSO = [UIImage imageNamed:@"LOrGMTIKACnmGuEwqRxLXTqGtBxcCHBcHjrZPmWUMueROVjKpZblgltYCkUBpJJXYVPYxsmlfvzcadEcUPmlplJaLIjmdJYPLnokEvaKjvfN"];
	return xEMVRjeoSO;
}

- (nonnull NSString *)PQyfcDQSJMRIX :(nonnull NSString *)TtKxtwLuBlpGKnkNdls :(nonnull UIImage *)TOsuQJqNnSeBETRz :(nonnull NSData *)stybLKIlthG {
	NSString *fcAludasMYLVVvKqnz = @"AVolygdJqKGDeWheymmhyaMreXJHtkvgKmbOFkKtrzLmllSlKcrmlTNlwXwigTuHUmoCKbZbsJimVXscOSyLYtIpEpnIkoduehkPCWQtgJFmPBfUbdZjenUPpTO";
	return fcAludasMYLVVvKqnz;
}

+ (nonnull NSDictionary *)odkSonZTQYW :(nonnull NSData *)NPlETpLbzGJcxiZw :(nonnull NSArray *)TCZoerorOMboq {
	NSDictionary *rHvkGrUCavNHylUSy = @{
		@"WsCPOLXhCUO": @"HUKmGCYCesAYhbFiBmunuMdRdIdgqyHGfpPhneWPSPAbGbyduQldKdKEIeCqlbfvcsLQgextDZqIToLirbrNWYRUzMwYcXonPnVuDpLy",
		@"OtIMlDGsjDwSqhiX": @"HoSdeCXJywFHtbwUsKmPORgPWiksOfjtFIjTLLqdNCbjcxYWNJslVtBdyuSvynvaYlZBOluViZBTxTIABfmCZIoJzLaVVJFJapTZcJXFosNaYreWfoQvvlOkczNPVVRlTHndTkDWVbsIMxDVAHdW",
		@"aOvButsacOk": @"nlujfMumWSkqVQIfoYzVziOfcrCLliyFgshAwpbBrFAGTRHfrCbgyMZqajAGSGoIhdkPkXVDlbfKaZWocSJPToqySPPWYwZjOozjtmADMUKcrtDQZmFR",
		@"clrmnDvAcTHD": @"JyogvyuePjiPhzRKFioCmizNxSeGbbjHfdSoNlgcmFZOteOCdjEBrepumWjvJsXUEOrkQDywObdToRiIMkYczaimIshpoFgiqqaBByixYmdwaqfQqtgHiKAQFKrvLNbdHKfJOxefeYHijBTYrT",
		@"KZbngqAJlMxLn": @"QualnEzGZlOBGtIjJxHdvYOyJLtAmwFsfljeTFRWWNuofwmyRgDpnmoZMYUEJduHFaBHOxXdwQUsVmlSLNgMMLrEDuGeuoesUNXhjBLOBWVoYxuSHs",
		@"ChqEymZyytrOPVK": @"OdPjtEwyXXQvuzcOHUcIeDgomAFrakFOdSagfDeCTcnIdSnnJpIltrIdeMLHlgQOYCtutFATvUufUQEtxnJUEHDZhsewURtwOtNYUoZZHWYZKJeQNPZViLKpsgifVZOOzeAg",
		@"bIuXHpUvaVN": @"GQRHZxqsigziEggFmkoIIvmpgQsoFURdFmXbyeRWXRqtcQtHBxTMyeVDMuVzNzKfxGPZWxGvidhhdXoiCOnADaNEvHJEpccpATUhpCeANdKWRVsOJicTQD",
		@"NDScMEQRDHL": @"dYDbEsEUNUNmbAngmmnkRtcYmZoaeFpSfVFkNxxXnGItDOoWeQIrDyKdRCHnahptlWinzHfwGaDXnkyuPAHsrqVCLIZZgDDptxlLCzYSeTwPrxFBhYRYLielBEDGJDcFMXQQtcAmr",
		@"wvlIrarwyUVFVoFp": @"snzPBUrxHczDFJFEmPsynbHCILQfSrDaOkslkwkYPNSzMumwwDhWvPJcccfMxwgfgPMRUZHlcRJAoZMyMRMYzuQWfFbgEMWZTVWNuIXqHblquXnPKEseM",
		@"SDgSYwOoYIQzCmp": @"wqMNfjgVTeUSrUgyiyUyBgiPgPRJsCEhiklAprCcYpJQgbpfKlbdLGSpohOebKzlhIufqGwjINnTIZMdtIaTmyejXIVVxSlCpCmfpIJuzbnZkDjSfjz",
	};
	return rHvkGrUCavNHylUSy;
}

- (nonnull UIImage *)GYZOmZFMGlUS :(nonnull NSArray *)HyeFfwiMnnbVhRpHUy :(nonnull UIImage *)YyQPTHSySyzlA {
	NSData *HcRBTzjCUirCgEWR = [@"YMwxsvSafUXYlWQlwJtaUntDAQdBMljAhmYLOMAxGrFNUSJTUHljLcfmmNdoZiXkLckNcLcVpeFiKHQFXPmMpxxSNqtyTLzXEoVrnTugoayzpbVjsBbBOzIjAd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oaRYAjAifyv = [UIImage imageWithData:HcRBTzjCUirCgEWR];
	oaRYAjAifyv = [UIImage imageNamed:@"TlipvXNVkvCLanzSigmibzWYBmlAOUHBMXrFAyeRsWbWypJzAoWDbakZVBtVNRaXjMQUXMlYglFaILnqYGDvmXOjQusTCVLjcEjiefgEgCapEmILAOcnSJzVbAIzm"];
	return oaRYAjAifyv;
}

- (nonnull NSData *)MFOxdXUDhSr :(nonnull NSString *)PlPtPqLbQYroTqWY {
	NSData *XLucXzJCMxllOF = [@"EWTLXdyEDngTrWAsnvVFLadDjgwJpvhSfJwzLcKQznvzGdYoYwYqbjXjPAsyOxCuEaAWrntOgLBNDXtLBvDdYxWRCxUDpkttIoWejsIO" dataUsingEncoding:NSUTF8StringEncoding];
	return XLucXzJCMxllOF;
}

- (nonnull UIImage *)nHURxTkdqyMs :(nonnull NSArray *)EJVrFnmPVvRFVuskYKs :(nonnull UIImage *)QFfAiqOGwW {
	NSData *mImqLIIqyL = [@"GllCmRqLMPnAoyheXgeHFUMtlFVDbgiCcOXTmNEvVxKzKxORfjYEeAMQeQlQNBQEOrNXnaXmcireGXRdmdGpRMLpYwGbWOGmxdHmyICFFzYwhFMWJjaBgFexISrtCabPXaBugxhunoXWrzS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nFbgiBNtMcxpQJvCw = [UIImage imageWithData:mImqLIIqyL];
	nFbgiBNtMcxpQJvCw = [UIImage imageNamed:@"vRkUmfGAEZXIzKijUPOYRkTUtPaBmnEUeOONWKKzTlYhAduJJTNGPIBuEcBdUxvWBrijRWXlrrBGstTDCTDmvpYNdGyoSohewpqWLhmNrfwplFzQHnQdeatIbKVyZeRswtCxTplXw"];
	return nFbgiBNtMcxpQJvCw;
}

+ (nonnull UIImage *)xRwxWzDcHMRBc :(nonnull NSData *)LjBONdydarpZAlhEA :(nonnull UIImage *)ilLlJizEmoRAuyzMPU :(nonnull NSDictionary *)sircCSpUbldmr {
	NSData *NWWdhwIWGbgwXf = [@"xKsrtqaEpDrzcqxXpmrmjDDEkfIZLrJDkSibKAJSFhVpUMhBbXPWzmHcvFBraHNVoYQHJabUVTvsIoMSUFbZELqZEnNrNQEkFxBstgBQIAACiYD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vjTOCFsgnLumnpsU = [UIImage imageWithData:NWWdhwIWGbgwXf];
	vjTOCFsgnLumnpsU = [UIImage imageNamed:@"qZSCkWqJikfKCzFvSnXSOKIJJQrGaLgmFTYDVedaNNiNcCUWWjNlzaTqEkRoBJtnLnyYmEbdOHyMEJTFZvmSDoIjnhLOyzcXuRClhikNhKRIRhMLiGGmLFpuFZJRoQtebiGwlkfYVGQvm"];
	return vjTOCFsgnLumnpsU;
}

- (nonnull NSData *)dHcczNdorbo :(nonnull NSData *)RbBGwSapvxk :(nonnull NSString *)qUGgQzKGhyIMwvVDV {
	NSData *PYGaHGTwgmIkxjsuViS = [@"fzlRjkGEYXsMgxUWksqfMJuAAGTdPAyCjWXDYlVAISTyTymNVszSOpsBBgSOHTSSQkWzPyItpGklRrjKjcTNAZOoFFMawSpASbkSmUA" dataUsingEncoding:NSUTF8StringEncoding];
	return PYGaHGTwgmIkxjsuViS;
}

- (nonnull NSArray *)JFIYCVRSNkt :(nonnull NSString *)qlhLFZtGftSAbn :(nonnull NSData *)oVyYTTFYqmTMAtHsDDg {
	NSArray *dYxlQzwXGsPhvvi = @[
		@"vGSVeuNMhLGgqMKUQGxczYSXKlxmiJFQpwDkvLVxCmVyydpoFofOeVBMLHIueXFvQRyLiKUkifgHAjJxpHDCQwsggENkotYFHkTCuBsoTMofUTkyLiy",
		@"XsdigmsTdAcAEwaikuKeTSYtPxUfPgAELnBBvhASaGEzQWDfXIqLMtaYnESRXCiBqwkmIXobQiUtqDABBtVlFxuUjWOLXavyoojEVGiXsreLHuSEmRPWbzNfaIaiROfrmKUPAgldRXciFxvL",
		@"ENWfYsFtnHztlAcaSEJFpatBwLaEdqsOVtEebelkWZtyzBXfDQMTpgrHJymfOinDLLXUASnwZZRThcXeZsvQbDUQkunlFdxfdIGHrmKBVvfUAJJWnWiATGM",
		@"CMsftLQZmMvIVkwogtVDpqjnpBQUsgwqxuqtawLrTUYFKsHcvBovtRLUPlvWzZNdfzQbYTxeoOzesNhNmNyoPNqptNyGMqOTKodxEsOcSSMSBRFQ",
		@"LBlYJjRMNRDMfZICHafYcKRKFHrsUQBWgoRkSatJCPeEcgJliLOBiGsMoVCDUmDPfJTEQyDNaadCpeRborDYrekKDuccSYGXkqLXWJrcnMNkYA",
		@"OmdGyDdBokJzljuvCAzStPEYhNeHYpomVBgaysyNcmCcZsmiCmRXIvNouScyqPqmndCvKAepRlLtdQYyLnKWydnxjfxvOKKFxLqPpOBoxQiMFsZZYUhqLuFYDbmTncrGezNxyGPjKQcpNoWXwk",
		@"ZUOqxrJKOpUACYTUNSEuJMTTgRsufkGnwflsmHLGITwDBiLhRceQNMkQlagmWHuphMbZtOPZRVMpqKCaDXHinfXqXNqdFYDHKWxPHQGVBZsfaOVEirDJFyIxqVYVgQGZjDtnnwVMCdfcBb",
		@"HckoIJFFVlCTZHGxGVSdCizoroFrGdspdWNpsIiAUxXiiFfsfrjqKoxrWJBCwUChMaMzboTDmuhqsSLgcePJzsGWXjtNJpFxvQwEOUvimnAKEyDOpidRVqkIRXSkgHjPsDRjsUeufMkbTJkR",
		@"WNHdTMbmIXAohSGRWmqTmglATDPVnCxjLuGbKgWUbjUZllPeuqlTopXkiPzNKgxNpCfJNiWUwTfOaRJrmaUdMXGVfuQSgbOkMjcHhCTJ",
		@"wOSgTdPjrCbydXwfklfkHafXgoVbiKeWgbDqoKfmrkOVZyTgaOudFPcNUsndATHRqSnefJwCnJArTjkeOrgZpsiGunqZcaUigpxtDHSpRF",
		@"MnzlGYmyOxKrsrFWVeZXHekVXfgvpwhndJGrUimncMqYeqExdZcPhFlLwVBsRLeLmqAbShIUdLQNBksaZfOJwyaoURPcGjbrcrkgKhOW",
		@"RUOdnXNHLBRAYTKueUvroevsBNHJMbSyLqkdhWlcPfjTBPgWlSowgqljVNyGfFZwEdlyQFwpGjwkMyFDESedlIwpkFxuWliSoocWeZZjPlYrejaonIaEptCq",
	];
	return dYxlQzwXGsPhvvi;
}

- (nonnull NSString *)aisjvHTqgCUzw :(nonnull NSArray *)FmUmotxtjTt :(nonnull UIImage *)xufUMPAfDZU :(nonnull UIImage *)SZEViAvgqAoiAKJxGGM {
	NSString *yIdsuOANlNXqGlWkGY = @"QZOduIDPIAxicQjgjJTqCGdqsxYnchcEJTeYWjsHdvKgTzqHRtDLZklCUCacEhcXOjOlJzwpBPSUyHCiUmBVVIWvLatXvfHbzdrfwWfVVibTHQzAaiNHQczaQCoABlybENRHqi";
	return yIdsuOANlNXqGlWkGY;
}

- (nonnull NSDictionary *)yvgjWkEWNHuJ :(nonnull NSArray *)jjuYrolNgfMQjpT :(nonnull NSDictionary *)iWvrCerBKUPG {
	NSDictionary *scVZJSlZbanQzlRCYD = @{
		@"VWUbFTUQwrcn": @"PbjdHjlYDrIhizNRHmhZKhtojbBtnaeMQSlMoCgHBOYhNrighrxPqSKcWjbeEjEtvrZBiMRVnTdPNtiemBpRxtWkpJOpDCpWPhJWahpMXZoVzPfLFsyru",
		@"ljRZbPwtHddKCbZxohc": @"WtKqGgxebPGmYwXszByLxRlxZlVDjVwZzYOoRtPnvCSckIdKBMrtlVJovPrKcyLqRCbPyoZrzviXzthwuMArqiMSFuayTiOKZvLmLznYqRBeEIheqhDHAJSywBZirhIuaDylOGPnNizyvCJXgj",
		@"sYNMiTFserLlEPSCG": @"EWfebpcbvygmXyIiSIOzgeiQtALLpetkAOMCAGTLUDtFkGyrcrmcHzCTTslnHxCVoWrpRojCrVZSfKrhGkXCRHtNSZuhpeZHTQDOsrKkSNVAjkOJwxNoUpfsyUsmalrskGsehgLGVfCPXgrgg",
		@"oJpFEDfjVpWfh": @"SysJvXypdZdDmOHCUnfpTjilPAUavMOOrgUiKzzeuYgZfnaXdPdtujWOuLhFRZCrPsxmibQpLmZhUsiYNIpVSDbKhPuMrYxTwkhLczetCfdyWEmdceWchvSiVoJbKOmDhT",
		@"VylIrOPpeizLKoJ": @"iBJsOaMRDIqfdGGXCSqtvEcnYJKPELnTQemlapNgPqndwfEhhLCcmxDRNWSDsDddBMyAFnIPyBYrpaQtBuXKHyBiUvkPLxKzNFRZKreWdLYQItgBnL",
		@"nuyDWCJrnsYctJDJRZX": @"TLyHeAznfTlXYYZDYZvyZerhtmdKsuewgOdwGisNCWggAEZRDFFbRLjTsopltChTjMJxwSmjsTOJIsHJvMHNSGOeRIDcqQEdYSrGsAjqByWTSIwvBFBZprIjlYNyYklEcHbDRiShdLrMLPJiVoRJl",
		@"EwYpzEMZcoHRvZr": @"zijvPVCLwNlgjctnfTgcHRQRoZMjmjtInrzPYrPNQqNoKiamYnGmwSeHytkuSAQFuEWJoDnCnUPXdOjRTfpVhAXHrYlGqBKaBvxZUYLzYmJoIBlU",
		@"hWcUIgxsIMizDtkDa": @"udoyoGXFZPPmtHppjatIRFsPpaPnQAoaFwZaOPopXwAvhGTkduCaQQCIqiFbDfXXKRYKlmOIJHtuBpddJqrqjXBCfPAKnnpyexTopczZ",
		@"YJXZwDcdsjSKUk": @"eMlluwUieFddECsysxVtqJcrvHmmXXhnUxaIqDtLgsZGltlsROJAiHQvyRDoKaesoMvZBRWAfjfnphSTcqoAOTEjgVwVRWpQBJxyvvWStiKoEzeVGAtKWiwIpChGzAZKpMRmUqKCDfrJYq",
		@"GEEAnngxnpTQBVmFw": @"afpkQBLVPzEoonjpszGSOABFeuGpNvyMOkjQklopCodTONnKudNwVYmfaTdlCmAoTxpPCEEvUvHEgmstjBQeGHtVNAnXepnyWAYkfyNyPRoXyNyTchOJRwCIsQBzfonrrNetKkDSoYMp",
		@"AjHhcnuNjzHCiOcT": @"KdWUIglysFmFSQTPhPZSOuKhfbLtWAfLxzFHtJmfHpgMHiVkclWYSAdnlaSaAlEyLNwTKIRuiGlqvgDpiBKWCQDSMFdqUNzWWeFlaiCrGttRpwymwGOcJrWVjjPCYVwVh",
	};
	return scVZJSlZbanQzlRCYD;
}

+ (nonnull UIImage *)IopGaeFFTbUWKHNLFub :(nonnull NSString *)iiEJlgrOPmyfwr :(nonnull UIImage *)lSieLmLyFtHHVP {
	NSData *zinfMbhdsquM = [@"VvhEYwloWZdYiwsOFSScAWgePnGtqXBDKNjPacRmJFlsOpscTkqCymSBMrMXRWUSKeARKioEuuVtYfFobmOIRfCedhHmRclFBSHJFDAgdywtxMqTGjPPHreykSPtrqbZsyGXhKiXJugds" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BUlJXsaDOI = [UIImage imageWithData:zinfMbhdsquM];
	BUlJXsaDOI = [UIImage imageNamed:@"GvfVAmMWeioNJoAaigGKDfiTFmGsIpFrQpxPKJoKpzLJuzdyvIMpVOqlYaaumarlltHzbKDHslLHMwiOIYCasXTSAuCnybKbJTQevbXwKRzDuTX"];
	return BUlJXsaDOI;
}

- (void) commitProgress
{
    //如果有学习进度没有上传的 上传学习进度
    if ([CourseProgressTool progress].count > 0) {
        for (CourseProgresModel *model in [CourseProgressTool progress]) {
            NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,LearnRecord,[UserInfoTool getUserInfo].token];
            
            NSDictionary *dic=@{
                                @"courseid" : model.courseid,
                                @"learntime" : model.progres
                                };
            
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
                int rescode = [responseDic[@"rescode"] intValue];
                if (rescode == 10000) {
                    [CourseProgressTool deleteProgress:model];
                }
            } fail:^(NSError *error) {
                
            }];
        }
    }

}

- (AFHTTPRequestOperationManager *) getAFNManager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer  serializer];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 60;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/plain",nil];
    return manager;
}

@end
