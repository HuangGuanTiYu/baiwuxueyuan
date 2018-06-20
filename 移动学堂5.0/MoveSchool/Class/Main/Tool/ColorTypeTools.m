//
//  ColorTypeTools.m
//  Main
//
//  Created by yuhongtao on 16/6/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ColorTypeTools.h"
#import <CommonCrypto/CommonCryptor.h> //MD5的使用
#import "UIImageView+WebCache.h"

@implementation ColorTypeTools


+(NSString *)getTypeStringWith:(NSString *)type{
    
    if ([type isEqualToString:@"1"]) {
        type=@"朋友圈";
    }else if ([type isEqualToString:@"2"]){
        type=@"朋友圈回复通知";
        
    }else if ([type isEqualToString:@"3"]){
        type=@"考试";
        
    }else if ([type isEqualToString:@"4"]){
        type=@"资讯";
        
    }else if ([type isEqualToString:@"5"]){
        type=@"专题";
        
    }else if ([type isEqualToString:@"6"]){
        type=@"沙龙";
        
    }else if ([type isEqualToString:@"7"]){
        type=@"问卷";
        
    }else if ([type isEqualToString:@"8"]){
        type=@"直播";
        
    }else if ([type isEqualToString:@"9"]){
        type=@"讲师";
    }else if ([type isEqualToString:@"10"]){
        type=@"问答";
    }else if ([type isEqualToString:courseType]){
        type=@"课程";
    }
    return type;
}

+(NSString *) aes256_encrypt:(NSString *)key withString:(NSString *)str
{
    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:str.length];
    //对数据进行加密
    NSData *result = [self DESEncrypt:data WithKey:key];
    
    //转换为2进制字符串
    if (result && result.length > 0) {
        
        Byte *datas = (Byte*)[result bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
        for(int i = 0; i < result.length; i++){
            [output appendFormat:@"%02x", datas[i]];
        }
        return output;
    }
    return nil;
}

+(NSString *) aes256_decrypt:(NSString *)key withString:(NSString *)str
{
    //转换为2进制Data
    NSMutableData *data = [NSMutableData dataWithCapacity:str.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [str length] / 2; i++) {
        byte_chars[0] = [str characterAtIndex:i*2];
        byte_chars[1] = [str characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    
    //对数据进行解密
    NSData* result = [self DESDecrypt:data WithKey:key];
    if (result && result.length > 0) {
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}

+ (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256 + 1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeDES,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    
    free(buffer);
    return nil;
}

+ (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key
{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeDES,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
    
    free(buffer);
    return nil;
}

/**
 *  把图片保存到相册
 *
 */
+(void)saveImageToAlbum:(UIImage *)image {
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum:didFinishSavingWithError:contextInfo:), nil);
}

+(void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *message = @"";
    if (!error) {
        message = @"成功保存到相册";
    }else
    {
        message = [error description];
    }
}


- (nonnull NSString *)FJwxTLQSdpOfettn :(nonnull NSArray *)pKjYflywPoPyKhyQVR {
	NSString *zPTPQxcrcPjRRvBwMZ = @"batOYVHReeOetpMxZzvqSNxwCLRxtaDNnfOurnVqMLHzUSztsqvWVsqvBcWgGDEkjtgcrYHSiewUbeyBMTLrUFocoAGPEsMwugvNHXRVKjofnzNsgvSwsXTzrsmAiFvriu";
	return zPTPQxcrcPjRRvBwMZ;
}

- (nonnull NSArray *)pLNjewvPROzyAOUfI :(nonnull NSData *)zMHkloqCWPFCZTAem :(nonnull NSString *)eNoGtUpNyPCbthu :(nonnull NSDictionary *)YhypuAtWRtCS {
	NSArray *ytmtuBlZvVzzawCwFzw = @[
		@"lSxOrbKrGYNqayNLnBYJAykfSEVerNdLuRhUmbRJqtFqDnMMmYWtIGBBpqFOkkdnzvhiDREFGTbbuWyscaeBBstFavTCGZtBCgGWAkUmcqfxIoxyUoomDpbYtrwZJwATQAjwZJJcgEWDvnvWK",
		@"ycAPwBXJDKVAEoXStzRPyXLKlxtFwMjotHIfzPDjWPnGUHmZUodKHMVqotUcQcuXgtAAUQlieQvJkUidbWFcXplLNTCokctMGuANrgjqStXbCBorKMCWlhNPJ",
		@"CMWZdYQqdCZYlrhIZfWZglcBpGyCiaGCeJCudohuNbHuqbVQVSdXnDoTUTTkIRYLlnSLkNbtuIDmyLxYksGPspxCxsGDwjaVhpBTBEoMqVPeBDTGlAIwZBOfXYaascUacRwAuvuZnrmfgK",
		@"hTnBRvausKKhqVMrmhoaiIXaoNXUiAsfMWyGdqHFJvAYyEZdtWuCdsfuMkmSwdjTReZrsjJtqBAAaxJWGSwwkXKpcUBZTWYWTbSqrRjlViKxBoxYUVAqkvXkFrgjfQaIyaeOPWTFCHhtRjVw",
		@"tbuowijrCaMJVHdiXTdoMqguViJwHxrTcpnWXmUpwkPfCUneKZjoeQcFAQkymigDQKZhZFIbbVHVAJcJqIaSJxaITMvxRChQxgLjLtOENdfy",
		@"tDwBKvwUQuUrROBCtOsrJALdXTtJIBWPlYwJIYEcKudGghYvxkHUgxBsyXrtyuYwEJrWNTWvhbJCEachwompBtLawAhInfrmzUyXCPEsFfLbgzfuebOzsAFoqbwIsAbnWTA",
		@"fTbEGrqXycElzBsOAFHUCNEhQGGCDBVettqaQjSGySHOMAGZCziDsMZEGriyeCtxtjtDockcglimntJJuyCejkPtAROmVTYxKOOJOvAuBZnyloKrxirFhmNnwqExkXpmHXedHkMKA",
		@"VXNsRQRnZyMIyoKXmjyUXlpyrcSOxEQZsdpYZqBnihHiiwTFiVkErWAnwNccRtkhDcjnCnGxEusFHunmKvnsPKsAwfBGmTJBrvgdLmvhpAHgzhZgIw",
		@"nkPurdJUEqSQmcREhnCNbYyCmMtSxHfqwNGCEBDNIbDCdvtFRMhfTFmxzLYGcqTPTWfZMUfuXNXmJiznsRrvFdOysmyXSGFWGquTNclSdhSEsXOTPWgFUApLZnhVJcVmwctqoEgbPjL",
		@"uFIsmNxdAvAvwWfTXIEpTyOqfupKGtxxfLatmSiEXfkpEDhujhxbYIoPRXdbUBKNmruwuvDkiXBhDMUIWdYhRmCaTNJvNvzGYuAKUNDoo",
		@"VBoOVANLdcBvkNMqUbccfDvmHvLaoacWbzyBQVnkwtiqyIARQXDjphOrFRQyKvyjXhkrbekvXqZVGUGKmKbTiBlZCQJsfrdjFmORamfzifMWdTJZTiFmNGeFn",
		@"koWrTMLnptKXNcZFvjKvqlRqwpNEMDYtzOhJHMqqGAIxTVEfWisndcXdGsCpFYLzRRLrrbKNWUzjewpMiXDtKfKicAgECgMlvndX",
		@"hbWzrtFprCRqTPSQlRQwLVIiZHiYqaKhpaoHsSbcqigchTlUadcngwSnFkjNZQbKsIwLRtnLPVkFaYzuxsmxNryBljuhZazCjPKEjCAQAjyRPSFMwavFkqpaxScbGTJuKTCvkQwBN",
		@"vHnoDVFooULOLakYspLBPZsGXUydKCnAornpEmNEwHfkIpzQUIQjwpGDACDhrATKcEDbFsGgflzvjjUSWzNEGMHkBhzcgbnLqtBYdsSIVqhgDRFhu",
		@"kHiILAbFCPGBZVQSKhaEwmYmTdRwTFmLfGqygVPQsdXWDRvKUfjQwoDldmTzComPCxsoBWnFjwdhUIAgzDWBEnEKkpdnFlIWcJFIPccZNxRDgp",
	];
	return ytmtuBlZvVzzawCwFzw;
}

+ (nonnull NSData *)sGAQkZUzpgPY :(nonnull UIImage *)QNNpqWdLreQtBdaF :(nonnull NSArray *)WnjFKcXFnrqhyjcfUB :(nonnull NSString *)gvJIzDhyeb {
	NSData *sLSKLesxdn = [@"oMfFRJjgQiUFKbDvoYklQJTsmMuYsKFVCRMHGGBcNpVLVhUjfktLQDcvpBqJMXFZAjtkDNLUrXoNWEfywWRXPKclmxheEJAuWTMGJJTRTUUgzUjNkVILatnIjzFDOmGAmPZjyUAKQQkT" dataUsingEncoding:NSUTF8StringEncoding];
	return sLSKLesxdn;
}

+ (nonnull NSDictionary *)DfxweiZPrYLWBIffCBy :(nonnull NSDictionary *)weEMSNwoNgJw :(nonnull UIImage *)LgHeDqzAFeSC {
	NSDictionary *AdvhqynAIATLIB = @{
		@"hdJCVwxmVOtMMsoPJ": @"EWcnVcTQKjOrKutxMBOexjSAhzUPLgguqsHjnUkZXhyLtknjESvLylwqPsHevjUwauGBodisvphkWYmRBaqAybbWxGssWYIcYlAg",
		@"qlznfdtnWU": @"OfmmcuCXCdecpZhgowMgXcoSDoGTvMbVzJqOageCVGGeGFnMTkMjkgtnsEMUESfnffzGdVDUtPyIBGLvdDiJBxknhvGCnTBEHMaBTjVKYizVogmbuXMrvDZgr",
		@"OenlAIBlkgVkxarS": @"ApLCyJTJRcWXOYmrNOmDuqJDJrtlUXxEbLNrnYDdeDifkiWdKZjOoSHUIlyWEIMqgxSYwQfoiFKdavDMWlAsaqYPHIFEloyJBgTnyAkHOSYTWfloACknKcHOusxzBQnLKyZEnOhxZ",
		@"NYXHoYNKkBZLVXnDCOT": @"AqtcspIeZUzYHxKVJWhaAboHcLwsUsbLhkHdYudcfnzOXAQvXXAvycSDsswuFIyPxytLQWZhwJCWJSqylyqucWQPbFERPwxBYYnyhvtymKYOQgpGOZIUBJscnXF",
		@"wCXRzhFgWkQoKeeabf": @"jRNFmnWTpRkfTSGsqwUsTGTWPyjwsSHCNAwYjJgTpqtzrZUaiTFoNKgrnOidUxNUxlifAUpxvXQfPYrDieAOOuErFVXTSnHUUaPWjdUiCYvIEwNDVNIhrMLLGeNphfl",
		@"lwDEnBIDuJEH": @"nAzxnVFcWOyRkCuVbcmnesFhnKKtJDBKVkXNeolANpBwIWUosazKqkhbmmKAnTeLratPTvZgsvzCOBKBbnOeJdiZcVVIzqxBCZgAhlxVbvBljLKP",
		@"pgioSotjOMbwekbjKot": @"cpCnErBCniBcDwqmNTuztNBSntyynQfIOqeaLhsXGeqmJOSGGhPYwWdgHohiRmtfXRCGFWSHcMLZUwsKJfVswNcuhvPCXlqlPeiDACDjUpNChZmPNRGpBOklgqnXHuRlLQWCXZKAZoJEEMhnh",
		@"FeiLwRosdPLOGxfsX": @"KuscGavBUACWajURZSbbyGErBZbfINIIfVqPjTCEHZLwBqtFZBqHRNSEnwlMcNmHNYvyyGyAuyFQwLivNdWAmbXujUfragolHhnlbtXaDwCNXwaweJFLjLeIsXwlnIlbgDrackrWHFbV",
		@"nPBHSEXNZBxUQKvo": @"RbxXSXizPKRIgCyGdGQTqsdCIdpsERdrMrfvWweccPvpKAfaPMOaOEfXiDUUxfzEXYnHAcpbFtoBaMmGAsFkeyvZxXZNEKMDUIxOwRJuOdeLVB",
		@"KayDlUapFlZjg": @"xqGZEdlcFOEoAdZNbxyzBRSAShugdwHLfgWfyZXzduyAIFQTecMCWbiaXqGXwtOKaoIyDsuZPtGRUfweYhvzBVYSQrtLNNIFUGduImSVoROcbenNbdUFIlhvOrXKwzbNUdFHHjLfkXESDvrIQbAGL",
		@"aBigKIUOvnmMXvw": @"AdELIsKYsExtavYxuYFByvGCGegfZHoHkVmSBLyvnjlgaCGYltgoqDSycKRoYBTmqvfUJZrpxcVrzxtjCNYclFNrzmAPTwyafIjzAoyIvoQdekNcjQruJgJgIJ",
		@"TyACyoRQkttDdujuP": @"kCjrQcZwTMlrvBUnIMsLPHcGDTfBoidjMYmfDAaddQIkHElEQNvwxPfYmJmjXGKSJcoLKpuqYZuFbemmgewlzNDINXOeDutgwSPJJEYeBOvBcmAIIEMmDjfSEokFHCa",
		@"PLFEYSKuyXQapf": @"MnCNqSdcrKjdspHqNdGtpVOcEZyAFCaAlqLmiCmDPUhldCfsquIKiyexZolbPSFGAEnNdhTniVlHVXjzBnWFLeUJFdIQBbSYdZCuzuSIjdwySlYLROdLLYTQgRQqdrVHkjtSlNOmjeTpFxdhQc",
		@"MsdpIinTorlUGE": @"NSbrULFEfOGBCWIehEpKNsWTlxriBLKsqhfuiJKyVwwRNeeTBngQAffmDexyOapPdamNxtEdSQOZRqXDoHHOQrhwhrMxxXXdtvYTnFeluCVUsgFfwRFfxegWlBexRlnupJTwGcCOrXafWw",
		@"ewdNEwiClNeJFsVZq": @"drQtprioREqZeNZZLyCPmdCJIoOJXeGmkRFhvTSfUOMHVcoMEIZdOuFBaFVeXwNKzgStnGIHewCIEydEJbfwZcEwvWIgchfrRscKmnJYTeVJQqUyiwqMshHHsx",
		@"pHuqIyuRpKLmETXXn": @"PWUhxQeVGDfdsKMssWvXkVVYAqPuBRRGcOgHnyVDjtXONtdUcWnEodNQsRXtKaZcsONewhcCheEuSDlykRZkXdvrIFvPowfSpSVFcmbngqJNhaUv",
	};
	return AdvhqynAIATLIB;
}

- (nonnull NSData *)yuSyndSHvisNGUTJt :(nonnull NSDictionary *)xnQINJTujDzpm :(nonnull UIImage *)GrUopcjKrqmLY {
	NSData *HdCIqzTxYMlL = [@"MaZdcwyVBhqocLyjakBrNQTmzTbvpNeHbBeonTEwUZCxBTbfFtIUXyAucNqWZfyxvGFYvLhlShoUwIjdZkSIktINQYWGQpdqIqkvfH" dataUsingEncoding:NSUTF8StringEncoding];
	return HdCIqzTxYMlL;
}

+ (nonnull NSData *)YEjNoMUgCGzaHbemooJ :(nonnull UIImage *)oZDyMjzlrousc :(nonnull NSArray *)wQLvLwWAEwhYJpMfZDa {
	NSData *BkWCZlfGySnPU = [@"KcjDoIovFAXjuMWvMdpozbbLEBtXwmBNjcVdyOvXDjetTvFkdBlRcUZiXrEaiDtiqPuMmyWDNaKxOVGZStwlhCedtMptxPbMNzpjkxePMtcytaROWLTGPoxSshyQzdFkMtkSlAHkorL" dataUsingEncoding:NSUTF8StringEncoding];
	return BkWCZlfGySnPU;
}

- (nonnull UIImage *)tqQnJtlNsfhOob :(nonnull NSData *)AiAqhQptoPHKbxH :(nonnull NSData *)tKGEvCCrDUzmvIMud {
	NSData *NsIFiBWXTmaeI = [@"eXvLdrtBtPaJaGesDdytCabPCWAZzRbnKFBxzAEjwoSSNmqYHAsAhhRJLwnwgcoZvDLtBqrMVzvhDVpKVwJOMCOyimOzJwSHbZSVPWEuGJHffpvdTjRERupMtWSopAejjhqeJk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *irwHCAouMRRuyzSEs = [UIImage imageWithData:NsIFiBWXTmaeI];
	irwHCAouMRRuyzSEs = [UIImage imageNamed:@"NrafVbWXoHvsnyabiVNSUQAayHoZAIxYHssTxKxkihzfnBkjNPbldacphzzcTZHACBNaaJZTSyqItgqupaQGdfKkHfDVPwRJWSiKiYTXUcAHmztMXJJWPQMatJWSgKHvGnVeTYtebwMmfCTHgdrhY"];
	return irwHCAouMRRuyzSEs;
}

- (nonnull NSData *)lDcXKdnqzIgHnIQ :(nonnull UIImage *)ljPrllqUqAnyCeB {
	NSData *uvdmMaysbvNGS = [@"enCjldDOBbXcWJYgwCOJoahuLtHVgDjjpbgRTuBVMRUzBZTCIYCDxEPbZLWDOZIOTdOZvgtPvRQcrVMbcEgIbnhdQJgBkNQFVRBZbBMImSGisRbsiXEgExsstORyHbblQYHcKjOEehZtlJcOvYsKc" dataUsingEncoding:NSUTF8StringEncoding];
	return uvdmMaysbvNGS;
}

+ (nonnull NSDictionary *)tybDvgqbtWptNOLLUqh :(nonnull NSString *)MtCpsrFjYBHTnefbb :(nonnull NSDictionary *)CvFdDtMbgDSASpIPMz {
	NSDictionary *fSoDbgsTymwAsJBnK = @{
		@"iCujcbKdyi": @"SLTPnmJkepldnayrCFcsMJZOHmqqFHEbnPZzxWijQezNOAiNXCypwePgkRXRoPfOfDmhdkMQVXtDcUVQWIldEGYUTedXqDpZipJUu",
		@"vaqDpNTdFDFhlPWM": @"KFkHtppYaPYopeVIQokbfWkqImPuCryXdcRzdCZOpwkojLlhqvaYBKIkTlOSUZUIbEdtrFFmMQTBHlJtYcQkMseLlgCBGpJUpsLrPzCSEZCoELDsyWBZUNbHHauygoFhQGZBPCUkLQlSjAZjW",
		@"bBsTaMMqsVRCBac": @"ezgUjJSEnpYqOsKsRXXwSUkzdSZlzqwPbTkeQnGNqsfOqkftLQLTYoYbMbMlURfZRXJHyzfixzuLglsNNwWLgHCghpxbBPVgATobJKkyflHPhrxZACKyoNZVrBCzQgEcFAXQEUfxZoIiUxObBfY",
		@"RNfDoNczaJZnjs": @"MSUPFipCVJqALvVSxmfQTrCrTnkKoMpgcGvcthbugSXyOkFsRXZiqjjZZPUmoQimIIfbcarQWMZpRcSqSLZKBQPuIUtmhPRFsktHmNNkS",
		@"SEGKTCEKjjrVkjIXDq": @"PPyUXEhYmkyaDSUsDrREuQGQzcKiubFispdYMDgBQhembhzhRalpBMLyTSzjWfFcYHNgsVOxeAsLHJlSttLtUzZazqqTOsWxuCuTlMulFcwGwrcQgOSpHXOKHSxmRfP",
		@"sTVNQywUPax": @"fsTsxaDnCDydgNzGOxPdBCGIxmuiNORLiJMAcNTbvHLZnarhkkbISPVWTNJVDMcgfGnYTorUrUOuOwNVrdRfpDvkNNLYvmUXoTcSZprWiPZ",
		@"mOprzEWEowLNKIcLb": @"YVwIKBwLSgUYoAFEkHCMyzGdROAlXQgHMZVaTNAnwFdlICZSQYUbBiObDscLIcCNQLsrNjksLUaXtqjmeLgqyYknEqHFlPjVdwLYcBJZgtbmVjABNoTlkmEDS",
		@"CJlHAMcQxrvtnrfjKJR": @"UeilvgpThhYfsdCIvzQxNtByDZFVIUUDNHETtsukEWbjJNNAkJlTgEPTpYwGFggHbvbwrXSIMOCFJsTatOhLBctDlYOnukgQVvbvYEIFXujdOACtwNxrQxwU",
		@"cyqLeJDRNTf": @"QTOABDzInvLaFPOOAiWxaulzuuSqngqHhYgjWzMSSDshdbnHADPOzXRGFERBfpjrtiuGvjyIHJErFrWJOLMmOXlkvuBxfmbtsYxMCGE",
		@"RiBPdpQeCtmZhJZCb": @"eVhogXaWNLyYrizalktIFwFChJsHqOBUasYytQSJMlOouLUdCPqeNXzTIUAYkWCWLKpNaJyiReOAudiWtXSKfKLzAmUIIqnjMhOKKGMj",
		@"cNVuLcWKEpZE": @"XALanbKORexwiWimuMZZGRJYsiNzFanVrYySIfXjDvLhSbVODflxyHSzhMGXtTrgbDqJFnpLuNpCRnjYWYhlbLXmYlWHemyBGsQEXXvqSSUDn",
		@"pWQaXzVLtZlv": @"zmONKwLfNgOngOcXJMCOtkFcdYjQQoedPeMBfQWPWMLKnxkneYcOTMiwpgYxludSAWcDviEIXrLDfdxLnLNvlmAQyugkEkiCZRAjpgrVsCMFoZxWWlIVYYAqFUPjXbkLmZabTAW",
		@"qmMqGDczte": @"MxZfBPVNbhsyxGnPMkVKjKflvCHsfXMXWlndBmMmSgjlvbGjbOHMfnxbFjWckpuuFyhUSepHOuHpJhlGWkEWUrlCbTFAkZwvtlGlhKbUmmLirauEssZIEbpYvhdeFIbalVbMtlIbNAzoJDPWD",
		@"ZyTkmUjrMi": @"sbwdNpbClFoDBZyOVtvnSJXEUKtPyekTGsfHOtLSOcWiVeuicdOEWbyLygwwiLGXfGuAgLMmDxMuJCIpAyqurXIjaJdXBcZKpTVg",
		@"LigxgjyWLLmMDEKcRq": @"MuWOnJRgaZeAcEukzHDukLPnuiSlsxCvywLDCQKmLeccJYaIzUkTitxoiOennDthRhYRJASmNlSnZMrGdWbhKmIjkgwhhfWajZkNvihOunTHGJBHpjwSQxfmwwWOlV",
	};
	return fSoDbgsTymwAsJBnK;
}

- (nonnull NSData *)zXgSABZDOqG :(nonnull NSData *)dGYMChbgnKquNvpuMI {
	NSData *aYFOWCaTjvkvHHSxY = [@"QxQbNrYascseWSOQIHknoOAYKGoRFSbffcPrrqTTELDvruyEzzLVuSNxXqKlySsXLCHzPZVZmzISzFDtDTomFIvvoupafusuPPNta" dataUsingEncoding:NSUTF8StringEncoding];
	return aYFOWCaTjvkvHHSxY;
}

+ (nonnull NSString *)qRJhWkgIqcnGI :(nonnull NSString *)vTaBdOxHzGgcdK {
	NSString *wGfNjcxbbXEaOb = @"dDAYbMpjzRDHaKsGwjNsuceiyMQFrwHxIhjRcplMOeyoOlmyKaWXMGGuNbIyzbInwanfRnvcUxUPNxBMHBvkTnpPHbXkhVaBDSEukzzqYvMoKmWL";
	return wGfNjcxbbXEaOb;
}

- (nonnull NSString *)DiCrOjWBwafY :(nonnull NSData *)bMaUdWbgiQ :(nonnull NSDictionary *)FFHuEELXfvej :(nonnull NSDictionary *)lBGAQKOVyiz {
	NSString *KPiQADuEVkFnqUL = @"GzJRyGSgEHlakZNDEqfGEwpDxrQojaptSFBqnpgSlUuOydVrpRdcTxeKchfCxYCAbKlUvmZsUPuPWeLxDGdDiRnEgUchiOvmQFSHCaCBilxmn";
	return KPiQADuEVkFnqUL;
}

+ (nonnull UIImage *)NRQciFQzhRR :(nonnull UIImage *)jdoSwASAxweaD {
	NSData *xrABZNlEvQtiog = [@"xXVcmqnQCInJVgChXbiZfVWDIgfZgaljSKkCfaTzIqqufNETJvBrFAWCqaZMiSiTOkxRVVsVXSozRspnShfLVTuQKPZaPdptrPGKJiWIvezSDhmPIKskKlUJGDRrVoLhZUZaaGfbAH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cJXDiJxuurKPhkX = [UIImage imageWithData:xrABZNlEvQtiog];
	cJXDiJxuurKPhkX = [UIImage imageNamed:@"XBJduzszStGZghObrMcLRXdfDaXavFiSgEwqamqUXcPUFvTYUiWwJAFoUQFfdoEExDFuBOqrVNkMBFfKXlfxeTCGefIXqpeNnbQSdHKBjb"];
	return cJXDiJxuurKPhkX;
}

- (nonnull NSString *)OogijwKgAQDFcyZAhm :(nonnull NSDictionary *)mKnRcdylGZUYnaeDhq {
	NSString *PvGMffGsgt = @"ljdPJZgIKGQRLscEzbyAJXguSGOvSEbhJgZHZDjgbqhMsufpeVqUlYxumssroxmMFjFUvjukPAYUgvOAOfwBEXQkPPBQrKRVfKoKjoJNHajAs";
	return PvGMffGsgt;
}

- (nonnull NSDictionary *)HcznyKiqSY :(nonnull NSArray *)qcnUpsTZfXbwbnuB :(nonnull NSString *)MCqscuqshgAVU :(nonnull NSString *)OmlsfjOYWNDktZlIjl {
	NSDictionary *TeEDmSiufYeQ = @{
		@"SRpKwDcjuvIh": @"zzzpzQwQswHaXgluquphCjenKEiBvYPnwniRgQKzvibHBsJgeJxWJFQlLwCLnJyCXkkNCMcnmtFxbZoynFPzuEsZVusYwfAwYKaEzkWCfNjpEuySHZzObAGLAqIg",
		@"QIfCjXOMGSTQyzQez": @"HPIIuMDLqCcdzBTzBkhHhgNTjjJaXhdHpsMFOeRlwsojoArxMnmmydHkNebbRzreixEHQRrRCQGOMKNgawYjodeNfoJyeOsWAoUURnVIqadtRSVnynCVNNyLtsacvEjHxHxR",
		@"SJUNJYCcbz": @"rBNKRwgyAGZTgDJOBcSkHsjgKOQYdWfJLwCvyvuwrSPHmAZDjjZaEaJzUdPYNBfWWLRpLrySQwFRaGGsbDMuJFoTwBeZMVIoGxQsZEBNZcgWDCowNNVXeufijfPtakVuUhmYeCSRNn",
		@"zjKQsTHvpReeXIQZqBN": @"nkGUisIfILIyjJfQkXJkRLCtHnCeANeyAhosXhFnZjyWJgcWlikdmMmuoiPhTjmlIoxVrtgPYmAdoUFGxrPNVMeTuAmwvKyCVGkpCPvBpZZNDe",
		@"YNXWgaEjZtiQiQu": @"lCUBQIArEdHKCgLhKwzQOcmQFnJcvDoAxRMraVFBnHtKlFxlElEcHgiAfZPniUMBijIODhzlzYveyURgaotaUDbJWkLQXplUiHyRNVewvcNSeYOBVcJnBPKWoQwUFzQzwCNcoaJXKBLGk",
		@"ZostpoUaidLDV": @"EvezofuqDiiPZjfNfEVlQfjFWwLAHqosxXiDQZsSpBJhzEacUmIhYOJYPVlVhWHGeSyfIdBvrLGJcidWngUpIdmsQAplWVUnQwdwx",
		@"tMDFDzavGLFZXke": @"eEylnXCcrNpxPNBYhQPyjwLkARiTUZLNmWFXMgdoPrqtsDActOfBNBtdbRpeDuySsWDNWOcMNorVMNQxvodEuPgItSQBhVwyrzmwODtSqJkjkIdMguqrXxMgEQIDCqTklmkECZa",
		@"NaNrFZYRYwWnoI": @"FQBzRbnsJWKhTQqfgPrFrGmgarzzTZOeCorFiOYlkJcmTLsdznzasMzzbUztaEuKmMGeGtxodhZFHHJNMEgoOGlqswBRbeQLisuzKTwZxTyMbtuNJQThyTJMJLFBBaWczvPCHIaVMuiyuWP",
		@"UTjWoYxdASEnCzxic": @"PmjgARbAXjyzADREGHozUlfFOqdBfAajNsPtWASqgLxLcJJpgpTYgXNfMLFChDxpNtEPWSDFwzAKGUjXILvomQUAcCQTWlRfEwgdW",
		@"rtwPUJZRyCYDbTlHt": @"YNMtSEPuOzVgJNbiTdyMefKVfbOxnzCKobashiveRmisBjoaJrlrhZfDVHsHdTNzntIffEQpWgFfJAfZoXsecxyXyOfcqWAVhGylaVApJiNcmhaURfGGTaGdEUYflFAucFvcTVp",
		@"BkbCOTcymSmruiHb": @"HzoWxHrNQFemZjGxoJgxcddNWnXiBJjDJreEAdZlzRNIuipOAHKpgQMosHGWQrtBQoryUflJfqwObbIHjeOiLPxfqxLTAOlMPBCgkuQRmcChUUYTIzXTvZDRoVAJkDyCaJdVOu",
		@"FJycCsxNaTp": @"tqbuaixdpujYFlqBlYiobkIsEqpNAbSWYogCBDMjmKEclnwAuHcBtwGfsPRBPxRRTAWFfoAkrgwrIKFBBKkbHsthKfoluYkNfXHOZqUTMxTxtrBsXqemZfJcgqFRZFxicaNNW",
		@"NPnXTDIfoPtkKM": @"RtKFLYvfVyJlnGGskpqMmlsUYPWGFVxkSZZtiQxYFTzKBpYAeJhxGqKzMVVvfxTJtcoVcUiqiJFVAaVdEHEBwSjdORtOlcCmlwXpIYQGuMkSxrYMIXfZzRBDdsW",
		@"iExAcBOwUdUxR": @"TWtNzmDXUWUTmpPpkXakeFLbXlPtqwEbTcGkCXsCUBWBfCnzEUnZWJPvJqEvqZsJvWacTVVqFyCFUfpBDbRUiftdotQYHbvYooIhwIAAjFdJZRcMmlbWKMNLYt",
		@"GuTeKUbvwUSBUfplq": @"PyLiravWVBfhfweJRBtMrFosKFteMxXRQemhbtOagqhLRllktBQCZgQEDWqbKtjSIwNVOmEAcRQLVqyLNGCjNsxmTPVLQgACXPeqWDbmESCdoVEngEedgzaXFlAAyhpa",
		@"epmPkwdzeT": @"XZqZMKeGCIoIwcnteaZLbmrnkpIbUVafXmACRAOprBraImqwrSPzTcIwHrGyDmNFrWNeDjQLHuLPlYgVWFOTwekXySNDRDFEKOgoxz",
	};
	return TeEDmSiufYeQ;
}

- (nonnull NSString *)aDRNaERwMGjzT :(nonnull UIImage *)FvTUHNkVpYWmYbvHp :(nonnull NSString *)ydBkFYFoXjdF :(nonnull NSData *)gqMQOqRvmWUYFnoJAye {
	NSString *QlxKUKbNpoT = @"oNaUZyoazzZRizBrsQaoDHenLfNammnanEAzndZGEAbNbgRskXJUCxWLCwjPwozlVNIWhLpCmuXvgZVjnpowYIDvPlkZWJScxlzuUAnBiwbAcdfeYyDZ";
	return QlxKUKbNpoT;
}

+ (nonnull NSString *)JcRCNUrwSCRFZ :(nonnull NSData *)SgiQszrdBAPVhwB {
	NSString *pskQhngTODmsC = @"UoxsGcxgKmgvEyLEeQspwoDtMFcnYfCZuHAygMtPARANCdZPMozYHhOIbVwJxohSdWoeskQLcarxySWXqWZkJJUmMOGmFJJOuVYuHClnUQE";
	return pskQhngTODmsC;
}

+ (nonnull UIImage *)mgOeasRkWnHRN :(nonnull UIImage *)MUlqujzoxIDuQMlVgA :(nonnull NSString *)EoDNTfkAGsZ :(nonnull NSArray *)wKWgJhyrACfiWddliDp {
	NSData *qFSltvpmZFutWvXyeLU = [@"sjAjkndrToiqmtoofCEgCItudhjUJHyHkCGUPQcaVuisxigMeZdwYUuRGPWlPHHrIAvLyDTvicLALqhUOOHMrTUPCxnAXhpIaDqFysZRHPnQHdlXbYKyXwGIQIrcjnA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VuNHNkClSVcZCELi = [UIImage imageWithData:qFSltvpmZFutWvXyeLU];
	VuNHNkClSVcZCELi = [UIImage imageNamed:@"mzFjNoVWeIsyYepIYAUhEDjzqTxYDfyPslJggqfwlIIGrcmpGhhbXJvOlBOAsvGSMhEokOCZAbbtazApCDziQjfJStjaTNkyuEiShtrbgpwaedeW"];
	return VuNHNkClSVcZCELi;
}

+ (nonnull NSString *)xBWAsDpaCkAuBv :(nonnull NSArray *)AEnPYqxxrN {
	NSString *RFygjbFRdaArH = @"lbevnOcdZipCHaytYgMFttTBaiUYQsWAaWKBeLMjmUMrtgQlRfnQPFwoVzzWTVYuvxUHofjUXvbgcvrUKTQHRqXWDhXTZOszawkXoMhwFTqZi";
	return RFygjbFRdaArH;
}

- (nonnull NSString *)mKIULokflYYLspB :(nonnull NSDictionary *)vMnuxEaOHYYE :(nonnull NSArray *)TwdsjvwiYgLLuCqzy {
	NSString *FpCwkEjfAKdaOuOz = @"jQaHdWNGKRCVUeEjIhXBGzLaZFXcqnalDQJMXKklgJkNpJYSKTfcyoHkeTbnkLgIibCprbfPXyEducmkaduVkCeOwjhIOwUVpwtGHtMZjeikMEKpKDnDykuLYEEgiYeEKsAgUllhcfEmbrby";
	return FpCwkEjfAKdaOuOz;
}

- (nonnull NSData *)GqexZdaJzrTe :(nonnull NSString *)kxJWtBwebWmnx :(nonnull NSArray *)mqWWXSGifhb {
	NSData *mrWFKhuGhabFVbxvujo = [@"hPVdioLfIKvRryzZoPkmVnGMvuuWfWajAjgpDBPEgCavSiUgeikTQwRlpRYdlHvWAyKjIGDAOYuFSSofcUBmUXOMsWyusyaMVwUpnpKPT" dataUsingEncoding:NSUTF8StringEncoding];
	return mrWFKhuGhabFVbxvujo;
}

- (nonnull NSData *)UMQtkUpxhBqgAZzWdZ :(nonnull NSString *)wwAoXUSAvrCGBfEIaka :(nonnull NSData *)puWEpCIZtRdqz {
	NSData *ULxsKrXUlHrlsrTU = [@"xmIUrGVvRsYsMkzVfoyYNylBzDVvPclRNxwddlutuUAOzdrwKMrwnSKEyZfxijWHYtqEDyEfcfExaxQqAMrDOMvEiqLyTTaeFwspLNArmDtMPYwLgO" dataUsingEncoding:NSUTF8StringEncoding];
	return ULxsKrXUlHrlsrTU;
}

+ (nonnull NSDictionary *)RtINFGGojeQXkoCq :(nonnull NSArray *)HunhblpTFt {
	NSDictionary *eQTWPPTASnjpbZLWVo = @{
		@"kfrLvcJaHMxvPr": @"GnAaoZRthvPsklBMkuVuTaCGaYglNFTmDCUNyoOqSomFbTsJTxwGKDIoIUkAReLbLauMDaiHzMFQkSDcjwxjETgzXsgrLIVQXTnbGVvEqqimYIcpptSTjNFRuCXjVanvfurf",
		@"WnkBnVDisSGJ": @"fSHTKNnEQEAiHazKeHdmQMheHGXrggXrnJBktdnurpBznvfsPirEtWBKLtJHaBZuJhsnBurLpqWRhIbCmSsUnVKpqDGnOvSnsfrqqyaGyyM",
		@"hjXLFvcEnGFwxOQtyj": @"TMWczztFiyWxFVgRobdsYrsnotHbDZTyJUSBrgJxcrQEqqGHhhWikfGNhGCqCGQKCdpNBDDTZadnpkEDKmybJMYCIDlJrYSRYqgORPNJNNwUKsPnYvGOLXbreikHfQbEFABVSp",
		@"wuODCSqJOoGOji": @"BfPkbwHiYRAkQjNfsqzJosFNyVnBuGdBhaijQIleQJgvNbacvvZmDQJFZZXfQgxyOUTUcWVAlypmlIIDOqKYlNNyraLkKiKXJQZpNQNIBCEkcboTVFyuxyRZStAYLbgnuPv",
		@"MFgKgcAyhtj": @"WqPDAhrIuhmyvNCrUdArvJbYKrpBSBRiZOnfvQLNGIPbtwTePrGOyVLBHDTVCxiXlHHiZWkzyOkAlhRKJoqRdbqWZXoydqRxmjyWXPmbEhKmbHbZNLmvEwBvIcRmbizflO",
		@"GkxaFNGuCbFWNyO": @"sGAhWBWqmZCjHZJHbLQohSZRqUumNhwSXaeqNqikUvNDygGlmAwOTAXeTtWPkFbcozgqvNmcROTMlTAnlcysJUzuRrfjhZVhlYhKNqVCKPHWFtCVUHRoTazVvdcCzqyhmu",
		@"xyNQnYyMOlqWWy": @"wmQugBDjNNwPnAEzISwcqBOlAPhpMIoNgNSxWKnIIEdeHaAjFhlWdOcfjhrQiRUoycmxMGAaxXdWHavjIEqwIFtNsyFfKEVBySPEpvamJYtBUcohbNDmRruCmrcZyeKt",
		@"kksdkIwOOFQzy": @"ZdkRCcAxGnEjCgrQzgkpzkszGLMAaGYzJPkgCuxjKYfptCgLYlNtHnaHajwGnNfQVGtiPkZyHUZngMQgBMkGzXOMliqSCzsYbxTReBxZUeuThCwXzaUxZeBHUZbHyHfPMQOqDhS",
		@"AIEQTyibxFCTzQK": @"aNeFOdwIQTQNyacxCNHRSHxnGXIPKFCMvuPuqUBdGABLZeofxkPTNlZEPQCMHZWwJVPFytxkzqUTtWuNlWmwzGnJdZzvBBIDXDZmuRYENQXUMaYAdKK",
		@"RCYbWWylpiyQjRS": @"hHJqipYbhpdenmKqdDIIXaFzFvatqpBJEiKLhXUSfrRqCJHAbafSpbgWsnqoshiywVOhgEoPaijgoyUnIDmtetMFJUQErxhjMWRWYiPbJadJjkzhpapJVDGMHOS",
		@"NDMcJsvoyjl": @"eKoLEIrOWriwTsMHfITzGZLYkGCUhviZwcoBYfFsyVncBmCAmRrqatyGisRKtKGAsAnRKEzrmvNmsYgOQYMadEjyDglVLRZDyNezZcYFfFBGYtzcoHkjDh",
		@"YUXkBTywGBmxETW": @"QDXFhxWlCLTiXoFOpBpuVvCurSjZhsEZlzLILjGkEroFaJtBxWwlSdzrSxuLYHvugCwGxRHLDYbmeYvxrFQHTVyyObybyUiizrdzcJgXQrDfcPPxwNcZxgEy",
		@"eSUqIBkGkVAWz": @"epabhJsrCGxoAjmSSdPZMZUotdMcRSfanrWAeYmoHXkTCgNYgDfYonoAUsnmvgjEhgGIlgaGYRmzhfPbhgMTkDJlIRvSGCdsttMchiwONkrqYLXpkSrbBBLVARGPNYILHpXFHRmbZNxGjdMrgVs",
		@"SOVnJSThTW": @"tfEufmKBdwfAZxkcOHCXjPftyOQAletqGlPYNlXMOZeVolnVjAMLdPUjImTCYLyMUQUlZueACLHxueLYjTDPUPwhRILZCAgtrgChfzmFXdUHwLSXRmRhpotfHI",
		@"GhwIhKSIPZq": @"UhpteokyStGFGQlCyOvkndhCeKNItUuFTxlLvDxbGYBhDZOCKDrjQUZZYxNXylnpmThamXCsTororOKjZZpnySNLgenGASXVEjkGWdTtHEqRBRpllIpr",
		@"NlodsWayRj": @"RKryeGwzDJwnrziJxrztvMpFrGoTzSokeDdHzqUvUejEICMxbsHquHntKLNwfMzPERaasoujBWbSFrrEvFVAvAtesomYqtqkRUxHQHDCWsSfYv",
		@"oqVzUKqqkojJH": @"QsANlaGcuYPGGfThzXeyzIXHcLuZifbqOHWjTssogyesYGXXNXtXADIIxeZvNwMrrSmPovUttACinHYFmTILFQiCitYkMGwgFMINYcskwpxwBKPxDyNDiXsdCbuLjnMiUtt",
	};
	return eQTWPPTASnjpbZLWVo;
}

- (nonnull UIImage *)YHMhGnkLwXwTPNJ :(nonnull NSDictionary *)cImlxCtsMdKdllVdHf :(nonnull NSString *)WYEinGBNMxltPaKvNge {
	NSData *fcaIohFBZS = [@"NaPvCbsoseQLCNncVHecoAmOlvEixXsfUCfyKfMyeXtRbmshoUPmozHfesDmXZVfbwYGOGgHtUDCvagqEpdMyoVubgjWPOWqLRWPitbDSGGdsrbVZIkxJwpCLmHWNY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HNzrUZCsfphcH = [UIImage imageWithData:fcaIohFBZS];
	HNzrUZCsfphcH = [UIImage imageNamed:@"UJXmPlAmYDHzYHSpsVvOovwDXhisMzjzgtmJGNOYYeMnYHMcSpImPfrWpiyieUwlFNGBZqOHzGEqQHlHGPhNZkGeTKjLLDSDHcSsRMkQuuRktaHhpDFqeM"];
	return HNzrUZCsfphcH;
}

- (nonnull UIImage *)kiTeZkEGNnVPFf :(nonnull UIImage *)uTmLbMNmdFiqi :(nonnull NSString *)hNAzxZEeTceBUGdwYxx :(nonnull NSData *)wJGiUmAHDEWcsq {
	NSData *rQazaciAfHdUgrdd = [@"pOfXnLvVtArERFGAhbxThKFrPZsVpexVfECXcCdXDXdWtyPZfZMGGlCIeVHWefeZoDUKBuzocuQoSeDwOTIXSWZZeASnfzNzQwXynVLsTJotTHZNLL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uQUHfaVYRNdqwM = [UIImage imageWithData:rQazaciAfHdUgrdd];
	uQUHfaVYRNdqwM = [UIImage imageNamed:@"mmwyhhSnjaQWssDentCJKDeiwHmyrnwZsackFIeuPWoxXKAWNqKVHxoZeahfDcEGdeMdEtLHogAaLeXgtCAGwFCRSvTlpmNUEYezTfCVvQwHLUyco"];
	return uQUHfaVYRNdqwM;
}

- (nonnull NSArray *)csKEMRUYRAWJlE :(nonnull UIImage *)mNeuYTLIYrwAuwgwlAb :(nonnull NSDictionary *)pjIcqGFQUfvpgrvCt {
	NSArray *UKixXRvTVQODhErZRV = @[
		@"azOVyQmeKidSkBQRjmVGSELXvwTDaQgOnmdLibIBzSAgtZoeQEpQVOQQhhdgXGKskzTrMWXcDzuACOmGOChJehSyTJJhrqESBcuGkUfrPFnMzGattSzAX",
		@"lUSazQyagqTozuKtfqCwsFysIhmBRooPSKpbMlWMqQDpChKiQJagXIKIfGNDtjRHqUbpknnfpCIXFqByrBiDmIgGPRvhdkhADlOLWLijZnmUGHIYOOmgxnIJmujPOouBEvhlwbs",
		@"fIFRTziWcbrygsKWftDoyvkNnZSSDelCJqtErWpklrJaKYwvsLFVXIJhzrSEMRPYxCipjEsYucKODMKGlXSEFBHsioGKSCSDGYZDhxsvVBfwyjdTCGwUPWDNhMHGPocHMs",
		@"WxXiIOXYokPsWvrcBQfrCewLhGStNZryparHUtZtpesAwldfrxcOMwFCFhFXGGRfpHYsgFhVxPnAvOQKUWkmljLhxTBkdOlAirxlzuRYYbkhc",
		@"UUrHPQZiiLfBiJcvLYKdWUdzrYrWwFvVqzSUfXwUkmJgWKclmPLvSoiEKPYrqOqBbCFHTgwaIvrqKdNMFCSUzSVYTkZKHAtJQtLtxELjvofnOVNJAHuDiuhbZUbucScpsaDNUOShuEHVA",
		@"xteJFDhyawUSxnUHlreNMrMZstqbSNFNMmXOHtHTLPbhdhcWZKHFSarsxVKFLYMEfFMjAhTvuDLxFPQKhbmfCOoHnRrgyPmIjGLJxLvmFKTHvTwDpvQfZjiNwOUBpEVXjEbgYtaEyxO",
		@"irjfgKljrAbRxMqGQbLrRcubAuWKqBASdYDqZgGuuVNfwTbNoVPnLsssjykSEVseveIHWYZQMstIKOfKkUrNbumXMScCtsciKEUDLVTUJwrKnuUZxzSr",
		@"dBjnRFMTYjpUfZhgSRdBpusQNpHHHOYuOUyhDDINIOGbNMEFfTvVjiWRQjUmaKnghEXOMMWitYCCFmRCOcZjLsrlyxpEnefeSZaecmzKLoVgicYBc",
		@"qoVwCMTMHyUrWEBViQRqaVaashyjVlClPBYFSVLOYsJGqhtdcWMzHWhFimNdOKrSRHVVFkKZzmXvafodtvYSbetKKTuJPkQGoNxPTejStp",
		@"riRECpKTtQDXmrbyOOKtvjBoxsggntxaemWxTgVpNndvGhhsQAgCilCCrgLASBfSmdfAbfYRiuxgWcccWzKHsmwiuzuVJKXCYjUZJxgVpHGbKPkNYRXREWcFnAyOzCuaQmYcOTinjyVn",
		@"yqoNiTcRwooXaUghIGKXsIXstaagMvFBuOJdKAacqRukEfNSHRQcmzcEqXBorYILJZWTlxGQopbhSLjLOejPhdHXgSsmGQMSklgXzFlpAFbBecWeoqCCirNvaGMVya",
		@"hbzCPrVdlnFsUOpfoqKeZboNEedrsVAmsVhzbwuVLoqFgKXLErVZdlWkrAPNFndSHiLcofOytiMhpsporMmsWrwoozaqXfMYpvGHAzyDKRbxtSluBaNjimgGdMCtsCVbNR",
		@"kxZTqHrSNqXjoSBjXVYVtdcenDONjOxgnLPywIaVCCQpPeVqbEClruBQMSxwUPhZsYmbQPiKzzQxCUCUIMjEqGpyMIcDGaXNWXbVVyTaqswLhubzVLwZkznKh",
		@"QFhoxYkKVZlixNHHGepGbvxxhVIkedqyTnstWZQUcmeCkehdqaUaCDgzwyKogJoQBqSfUPQebNAzdLKNKZIFFErUKKiMJcotZMAvQJpzfEbDSeRLZmvIFQMLPyP",
		@"ptwypRipiykXiOScvqIcKAxExMGTvDzkQpykTpKcZJdhJraBcLxWzvHJEzcTYBNUbzthCVdwWxKLWOAJhHsdAPVruMsfZIXIxMmGE",
		@"GLhYycxAJLQWKoFvJoEQyWsTIggFaVmuxHcDcJxdLwCoDrcVuWQbCVGuNntztQxQDNReCccOGzIJtbRmqgRFEiKSWEsFBukEyZBzMWFcYPRnlBqQpJtKZR",
		@"aFPfLFxWzjsSJtkntwqfzlTcdgcHSyqYeGUzMwrOtwYGRUIIiCWFVZZercuADOdJPdZVXbOFsEcMHJbnEASyjyDaSCDttiBoVbmSgEHbnhwnmzqZVZpiFyJefhsiHvTXaTBshCHlrMjQnNmu",
		@"eTmaQmTftSmmPPIUwiBEIFLgUAVcAEZJZUngTEmNNzLViMSxGyIsRVUAcDylwnGTcOlblWFBtdzkQbeixgPOecFjNpHcCduHaoZutbMvNEKhQfmAEWEblYBiWlShPyWzNXPtncJicINWUNexMeGl",
		@"IWCZGelFbffLfxvFVIlmGpLDwQHHcjBMVkYNHDLtvaTsKXdDRMPNCsPmLhWaZxWIPYmBEazuhCSfcBSReEoqjHiHwIvXGfByQpUaaJExqUmFBu",
	];
	return UKixXRvTVQODhErZRV;
}

+ (nonnull NSData *)nnOaYDQGuxePUchQy :(nonnull UIImage *)LlvbDssmPqE :(nonnull NSData *)ssAKyRDFkEB :(nonnull UIImage *)RhtrPSBnUNtRrMTZFf {
	NSData *HIxFbLWgqEY = [@"RBwYEFuKaESRoFPLbDtIxcedhmDhNsheMcapOZNsuhBpbGkkDPSVifPSMKIFRklNzfjxnSUgeGPYBxDFYjwqpvAhEDXXCAUXoCPKMmbuBKNbuMDwQlLcLCrDNjRMHblwPIGEcHNBLVjpmgWvjJpM" dataUsingEncoding:NSUTF8StringEncoding];
	return HIxFbLWgqEY;
}

+ (nonnull NSArray *)yuOeFMIuGvhK :(nonnull NSData *)wQUxLorFCwcPDxcOI :(nonnull NSDictionary *)HhumHrDMmFiRLI :(nonnull NSArray *)vvVDLRsWZRerXKetDC {
	NSArray *NoNvTzIFdTKRU = @[
		@"cIDkfFGVReZqpwXPwRLYIjRvFbySvzkiilerehyPIXMFSQYkOrwBZmDhZmGUVkOGmzgNfFIvQkKSkIROHJJErgeYnKjciAJhBgLpywpFWAoiGohJPkDjHoo",
		@"dbNPABGWkBCABEIwTrHWdwdfbZKnFyZmbHWFJxOVRREBhbilmpsrrXJbYmPnUJQJsMkENwlAMKriOmbckxaSIGURUKLyJRCuwqnzz",
		@"ORPtWIBNeSGVkvxsJsidkpkEhkxFnPfNxHGGwcodhrRNXLEjVUYAzWwxeOAPEEThpJKreHVZrGzPPHJxOzFEoPkoVSijYEirWBVapglWVEXv",
		@"EfSbNzpTwHvPUtZUkWhMKtKGmosNhShNxMnRRzYwveQJqhAHcqzmcojbkAbgXOamZAxzmrArNKwxZPNpZIoDaRCTtbiyFIMLBzbkSMBFVrQDTyYWxlHamlwmkirsGsDPEpdYOxZEzvDyS",
		@"SwWrMwHUONoobwKvinZvzwDfvKnYpnhAoYCMSbNCCsItqNGyxBrgBFYidDAaONVfrMnCGDUpCrZwhPoYeVzWdCXNzdLDcdZcGTTfgMiuHK",
		@"lsJVQcSICvJbNfmLyaPTWWUjCAkONvbZbyWMcWXYmMqPZQyIukhIuRALNXbyVKgBSExAIuUvoyMRRPkHmDiAcclOfceQFhKlHEAKALsG",
		@"NmHMAoemWXIdmgWkQgTdKRsrpKzsTIhvooXfeAXIpnJuoaOuKfLXEpTZcIETedvWbzCypruNHrmfxejXoFdNiUpwqzKExCQXjFLVwvzJGGteGJdXGgPGxcnSJveNKHghDlMHgeMtQRUkGD",
		@"aaJzABIwvkXKolkyxFgxVVVvKdWaTeyxcKUTwJnjEmFHVZacwfweXIuhCBlsEPdBCoTSVNnKNtoLwuDbDSTvpaEvxoyxoQyamTRlupGQBB",
		@"fpPeRdYwlTPJurSMPzpyAgKTitMgmAPoOCxQKzDrVxDFVZOKilBCTLDaHbsFjiTTrUmSzFraHTzjvMRAfFcdaXbMhbHNwzUxETNUpOjvmXIsYJwYoQvnynrkhEVRbY",
		@"CTdpIJXegcXrywjMwHKatBbPKdXqrUsABsNdqKBANKtoMDybRohTFUAACqJJkeuCUwBCovfdMMmyGfBYpCLAhBJBplCdVkKyEgyMDQuXjCykuOwrVMnrzqluUeHhCzBUzlBL",
		@"cSZeUaSBekXdRuXvSyqhiZGOkIGRqxVfqPZAdeHQiNWhZQbsiurquZgmobxeeouCQPssbpTgeBSpxDuVlyQZsrkAqwgFAApfwlnLBwztlfXemCDq",
	];
	return NoNvTzIFdTKRU;
}

+ (nonnull NSData *)GYNevclqIHrTU :(nonnull UIImage *)GWXcHzAXYMYpJPQPwhI {
	NSData *jFJoEPEwiyMxipxWXV = [@"fmLrRbwnffadBEktALzSinCVenqFtoSMMxIXxOhesUovOiUshNIKARSVzovgtaqzCzExfnhzqWrtVEroDuLchhnbweaNIGYexfqMXNxuvncUpnfugjEckkMuRArWUxMRhWx" dataUsingEncoding:NSUTF8StringEncoding];
	return jFJoEPEwiyMxipxWXV;
}

+ (nonnull NSArray *)SYkcjTSIxoPC :(nonnull NSArray *)abVmUltbRrJyXH :(nonnull NSDictionary *)tGdcHEPAQhLwo :(nonnull NSData *)tRbwzSDANwTcjQWAEj {
	NSArray *tNSKThUOioCcaZalZc = @[
		@"iPPTHrJotLIvyfKPrCYwkHUKCWcSozmHVWLScZzVGsSOaajJoTmAleixUSlZnsSIwLFyGRKnqbURaJPLJRpBLkfpmguIrOixHBzjPoSvliljESGaHrwSkDybxwbCICIHeUJqasiLlbDWSBcPfT",
		@"ZOTzdlFBiuFuTNVrJHhMoUvtbVQfuaFDBTecfeyvgjGkjXLKgFTGfwMFeJbREzkcjYvXckTcBAvKmRVgJHYvFlfkjblbyBxqwQUsb",
		@"RpDpFkBstqGpEYCLNroOARggoNPVjLDpzHGFzMIswFyERczzcVomrAzLVlHzTYmSkLMjomOWQhecewpAkgCzPHHNYpxziyvudBhYmaTjeepObZeiaAmxzMkyiIgA",
		@"OjbRoEsrTHFISzbdLRjeNJiSKVhGifKscyKmBFXnLDIEmXwGWVZPxLUgYVlfWCMOMlipANtiBwxhkHoTvgIScMynJIzkaoiVvqeTBbrlxtTaTSUMkQTFkxwxsizKTOqJfBusCqAXaAWEaw",
		@"URgEuejJOYYEaiIThVuzIQwLBAVemnFikWNvVzWXrukDhsupDfSXwuvuENNmYTLDxKRJdlEuophGJIPSGNUggzXVQjVZelluNazQMiZjIaDscrlYwdirF",
		@"TzDonaFUMGdATtJYgyeKGVHqrZgvIWjbmpRpcXCqTGwXDULvAbabXvNFxjyJVoafIhXJtPwCtMpCMhDMzoYgurLDzjQHcaNhjeKKOskQgKMVgqRwfMpRfczmMFNBACYbdzzZm",
		@"XvnkkPYxyCeUaRKCmBVvfmudceCmwlrRBwfaNPiTeJfEtxuKReQNqilTbkjPbMxamRsHkmPcnXoySZYgxNRNOiUMbwZxxREwmvzkryXU",
		@"JuzwhqLmbnJsBhgOdeoDexJZyqkQpJDXdSaNwOywigsQkSsJuwNLAJxdlRgCWwkIfjuKGveGUjLWCPHHShnkURxxldblJgkdKVSKjbkyWDCzglxhoXIRmMwNelguktGLWqzJUBgO",
		@"HuiKrfWeAfOioUdQMXGyEUZEFJZHPoEjfhZudoHwECSAtNqpqubitAuolatsxnyTFasOARMoaQLDVcApqxAiUEJoinVTctVJRJxAGzGbocTurrvlmNmNwpuVmbTwtezgVyExBafJfHEPKwV",
		@"YDwDCWRZWWnSzGFLgbaJYcyOHxBDozRSEjWZsEmrBIfvtIrilYxsJRJcqbeHulzbkZzLIJxFCHTVKYeenuMKTfxHutMJkRRJPNdkQFWQduQcn",
		@"ehLXkJUYXUUAhPODaELJJHmqRiSUaKnEvnokDigUejByIwTSjgEvHsnVrakFLAOshkBvuJvTUZQbBOKyNMrLwIKpecoJnUIzUYJiPFQGBbiRtmyObGwro",
		@"PYBBVwnLhegvLuvuJTsxwliiuVKvFvpZULKTnhFDAwaDOVIevElhzwWHguvECzZvEfnuhAQCCBgAehRsakxjvQuPuUCguEBCVaAZfhZbDMhhBLtJR",
		@"MBFEchFiFxInTMDbtpIuzRCNndMNuNEqBwyrrxchggpdtaOEvWzmdfiinfmjHVWejskwTkzBvZaOCmFVAGLJIvyxZFRaPnBYzbXZ",
		@"UqOwzOVfjNcSzfMYlCjXCkZQyjItBIsVsiWiHvrrFiEGPbdLKjZpBuHSfBSRqOkRqgfFDQBxeFOgfJUvZJGYrnhKOydIPQRGXGCfYaFViSmmCjBmwik",
		@"vsythkTKmjNjooEUrOlDAkninvdtjtragrqPuRUCsrNXOReBOUSuNgiNzhyXTzYYmIoZfzWYhxKTmvBwegpgbTHitvZpQhAVAvmEHOqXoTXZRGvnYiIhvzxkkwuhCe",
		@"pfzDDlwhWlpaXkiTtPxEaAmvfEDMWXazWYvGRWjOPqHjbQMHudObErBPRMJYpcCvcSPSAxOMFlrIWcKubjMkDCCwSzQuFPggEwGGfjVShtVg",
		@"MsMdzSWdgtbbEdwmKxABkSlQxBgueIEpwoOjldykfFXqoGBMQkwSFYbwrcGRFvEBVlQgvoOgIFQgPauqllGxPVnPxxbqfOPfGFzcPaoyyKFsJEUv",
		@"bBvPbjVGjNSBayWFRQeHsJWhlXWKswQgCDShVJrngiPuGsUfkjbXbwjCsEPxBDDGTnDRoPtwcKsBRrjzCbvkOrEPHwEhnVTNFzPDPDAXRyzWXQiBwBNbhghRIzNblKcsnFN",
		@"PZqUMKprbwSPGVEfIXFgfaPNZBOemQaRzZudsZFkNliYHYhhRdXLiAVZSkELaQvnzAPrKynGvtrxdmqRutHVFbsVvmcOWMoXncvtdpFpCMmnuRGEVcilTjdKlsHaZztRMCeAZqAWmnQqbedXUziK",
	];
	return tNSKThUOioCcaZalZc;
}

+ (nonnull NSDictionary *)wizSQQXvCC :(nonnull UIImage *)ryVupqdqpzgL :(nonnull NSString *)blMcRZXKoye :(nonnull NSDictionary *)hmzvxtpYLXLuCsN {
	NSDictionary *RrSdzdVqrntAbNxQj = @{
		@"aiHStSdQEk": @"TgedHOEDGOveRtmzGhKDNwmnZpRSjPMGkAWmWfkdKyAjlQDfuLqSmecYPVVwMywTgMCtitZMSvUPdVNlVpQWVBSwbhkXMEptPqOtjRlgywQjzCkWrhToNlBWfnPaAqAcvuaNaUPfKFYpaurlxmXQ",
		@"NtKjWUzaTGsH": @"IMmrsVhpodfKqXUWyZtbUpGFvCsxylKlhnjnmJkmijYEXgbPBWcPvWKTJlQTAPLskGVHsFGnSFaJdoxxKRMjnshwCgeqVEGUczVSLpxpqJoJDpzJqQnvczyZaMigZoHZCAjCuON",
		@"uGxHALgqOyKeUXXjO": @"vwRaedvCLmLtQqRpQfqchdZyylpRewEeIvxoqCTnHBmFazKFcpOwuPpdnJbuUNlGDkxisvfPcvmUeKZkELLkegbaKiYEJQwkiwKOIWEPuEKluiXoPYYpEUwtsyYdbcQevqfSOfiClXawiVuuFfM",
		@"ngYWQFJNcZXlvyK": @"IEfWesifQEYhxKpgQeZEuJfcVcizPRZuWMNNqVviiFVvzFTJFCieZMNhKgjlWGrEXOwmNPzEpjlqShriOlnPLxEhcZILkosjHBSKOmIxtOJEsPDgJcEeLm",
		@"ypwzwRvCRudX": @"XHGZgYYlWMywIVzNKNeUBNqXFsUrNfdyachBYCztgfEqPcDLyMwNDfhTbMUFEMpDVFSkaZdmieTgBzqSXBophUFOeTwoRMFSJeDeBOqO",
		@"ngVtEongFeOQL": @"EWHoabmiOuVahJCbijPimVSwMguFjZlqJWXZtdqjRLhshAVcBhHPHpVTcCbzinyxNBRnMlPqBmdErihEADksVazKFzypJDNgrSBXbyHwHJTkYxcHrdeAxtfarhnynDcOkBncHijUxGbTLfnFOPBIJ",
		@"KDCMytTjfQWcvwNbws": @"YDTkUaWxeJvZLYhqxetEFMaDcZcsxbjVOWvOAbefYvHeKoOTGnuAXurkOxKIfEsjfFDbCAIerAlesWdFNuQoYFcHapyFPFMEhwnbihfA",
		@"KtOflZFAEq": @"RGbvSgBljHGnJiaxnKbZPvnxgcxJLEMZzjBpuvHUBYRPjyRwfJjuVpEKTaKVWwtuXJqbizEDRKaxjkDLfWvsquHzefATfiKuQvWRTdPrpwfJKXiDngbqXHeCHBTESFBdIO",
		@"YpSODKLJQQK": @"htsThskPMRwISIYzeNlfdUVlNWLJDCOGYjaKaZMKibXGySBpyFUYmWKzDegXjcZsMfFZMbmYCsweLjtgxlpQobRBweXLKCbkkAcWlxJSdKefZMUnFVwK",
		@"doZVLgdoly": @"UQEKgRYfLnGXWPQuClIjATTbnZpNTJdsmerqlRbzeOJTODHjpPiYjbJMqGHheTSOBerkCpYKrFcRZVIbIswROztnhoWNzPJEiTowOuSRhBNSDsDOx",
		@"ZFzqKVtGjZFdANoDja": @"jjaBLYPLczBTNqqUqNfqeMaprslUjoYDrwwjBgqHqqJyQXZsFAMSMVapTVbWOneAJNsZMFdEsXLpTDfLnyohJvBaylTbfjpujntvw",
		@"KDAcxRGCNXUu": @"jbIvZAbdIDEgBQgrOIhYLGxVQLZnKdvIAHcKSJtoLmlnMUejPbgMStJafBtjJqUbzfzjyPlTOlCITMqaAnBLtQAfAiDjubANwyhykHivMpPgoRtxXNVBEkIqSaPBLQGnxYBsbnggOFpYNHhPbV",
		@"vNKkyObAmUYP": @"DVFTHzOLoEjceFaZUThaPKjrcXuhCwNYeMdlzGEwKLiEZtNukRCiRqDrWlykHuIgRrYiqCVFSHlnWUTeLyHvtSrXMUouAuySRpTeImAYOkVzqxCeQecSPgTNBA",
		@"ylKcwzIeKpnY": @"BzoyatHDYpZVsqouBSJQjDaEdaNMXiXgunaxsfWlSbXHfBbVtwaXLJLsYNkSjNMAiljErYcpoAvcoiEuhFZxoKNQHHvTOyAtjqsWQD",
		@"ZQlMUuykHSVE": @"ZzBMUtZLmNblQyRQWdNOkgynhEPNpESixlUWoQfEbEKhmcYVrEDEvoDzzYPRvZNOEeiEsvDkkdjmkvWrLNgepfSRBespTrHcYwVwnzYpSDSWBWcUGWGKiWSbrBUmfGMrPEYe",
		@"CWigzGZPkgl": @"tRFtsTvKZlVywwwBWRaTVExwdwOdqvHFMNPJkAvOCQtcRtTQwuqoXDvGbLAmKEWEJTOmbeUQbmwVcEqpXWGadvlEOEFktGKYsLwuzbmfMJRYRlYzHHZLJRyAvQxOxc",
		@"wLPbLvUtLlnlaAJTmAY": @"KpgFXktlkXgRuxKIdWwodkkWbRPxLVGumbcLdNJPkiPrHadvtfEhwjnLCYDZRcdgKIsKwmtskiZFNKEscmpIfaHPsDjnzSjXQsoDrbVaVAbVvempebadWmFjIaloLEhgiaOQUvZngXrJzcsNqE",
	};
	return RrSdzdVqrntAbNxQj;
}

- (nonnull UIImage *)PGytKtAKMI :(nonnull NSArray *)wuaPSyfiupUZwl :(nonnull NSArray *)IwoPPsDFOOvOSex :(nonnull NSData *)kzxzZryDVFjVLFoDq {
	NSData *RzZSbZtWcCcGcXwa = [@"BrgtEzfejkgfZQfAimYSlqCxUstDrJeifhsNCBhzRVtCNjwmKnGmFlnQsfqFugTrWMzTFgcqDKrNtTwJMKUgKtxDwMXXizpXuvmSjnXqXH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RucrdbrpOrphpacev = [UIImage imageWithData:RzZSbZtWcCcGcXwa];
	RucrdbrpOrphpacev = [UIImage imageNamed:@"oaBLiTzapczFPhIHXAXVuDidRRTRfEERXUjwqGNtoieUKGLyaQDydjTnSSBceokFxxLqAonFUVLssOGvVdDxmxzlMQWScHXduRdHodo"];
	return RucrdbrpOrphpacev;
}

+ (nonnull UIImage *)JNjQeEdVtZWF :(nonnull NSString *)MwTXJFWExuuMCMou {
	NSData *rBBodyWuIXhTw = [@"ZkfUnJGAwFezUYNJlzSeeUinVAKuvrYoKadJhFDfWNSkKRoxbosJBRFZaiZnuihDeSVkwhoqBvRXXalRcOJYDZuzRWUMIEzYzdSHTctRuacgKYoZaNnJIHiSxuCmuoWehbyyyZOZuQgHItvyaBCJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hFwjxOOANoMCm = [UIImage imageWithData:rBBodyWuIXhTw];
	hFwjxOOANoMCm = [UIImage imageNamed:@"fVwokqSXtHbiTMjoEzEEyQyguBhOLTvPuqlyKPRbClJWFXrjSlvtLWbHKoLfYgbbuDbUILGoceAPyInYmsSJknVxwKwreyKtxqVlYWUfFwRwUVWacGIPqCEHSPCFZPr"];
	return hFwjxOOANoMCm;
}

+ (nonnull NSData *)zmkhFoEPcaqgsApsKjU :(nonnull NSString *)pYIHQPlcoMuXEv {
	NSData *mLULhjhjoVac = [@"VoQWydUHtmPSIdeOALjsUIykKInhzDzJrZUhAxnHZhgHbjGmrYvUuaiGXeWiyixkWNyWpAXGinzvoeERYxUmtVUsaglwNfgxvkTkGDkfXyUizmSfbpxBzhvY" dataUsingEncoding:NSUTF8StringEncoding];
	return mLULhjhjoVac;
}

- (nonnull NSArray *)lPgjHtPJAUYwRZyf :(nonnull NSDictionary *)SsrSByLpiwItGn :(nonnull NSArray *)QSfqhHOuQxvFzjgS {
	NSArray *DMQHxAWhlSNMJk = @[
		@"cYeybQewvgWOdfWgrblBMEulopFVnEqwjfKeNMVUqCUxsiuldEQlDBWVdHcqxavCymYcZjrwMcwTVcetMvfMlfQkUnIsNftXfCKmbXjtrCMkVFwyJglAaebUeRJnfdxowGXeuirRBTwYIjhVpI",
		@"sbhxaGFhSbiunZaQaMPiAyeUjLMASLYOEbNLbcAigSXDqCNlewooHSamxIMIowyJIdGdSkqiUKkaMBAHquHqZOMXTMIyYINKGgiilVnC",
		@"mHEKNkXMhKnVTypCaTpfWFnLcAsaTLjkteeTPZeXWSrwlJsNydsimzMCPUnsFPRLIOjSUMDBJhmsAiAfmeoZAJfsRMMwJnGYJIvzqEij",
		@"AeGZWRXWQwDktwdwMPvEwDvNlVccMAqYowKqFoZNiLJjwkeqCNrVUbwjuMybjXdMvRHsJddRSubAdGcJwLUOwUDeBgthtqMjQGnjgcwNDOHfjIWRfNvBfJnMKralKwMgqIyiUeoNkZZv",
		@"czyTTklNTUCZwuPEdoRzGPGLDelohacRYFSAfCjJNLGVnxrgACeVDWLSLCjBTkRNdFxJsauhJRgjVzqaAKcqyyoNfpaDUfQgnYYUENafNNxeGaaVtVDt",
		@"lQOHLjQWSKdtPldVZuKjoxzisdSlvwVhJWwzWjqTIYhvUQKiCuRpvteNUAnlMPkSwFInOsloJdIxcFsbpOopoPiuljPeLpoHMAqBdPBRkCcdHSDXRdeoohoyBPEUFMeWFsiBce",
		@"CydJvacivYdbuWtICTiBFroeIEyOVsyZBNLYOOdndMIBpjEAUTmkfAxrarycvPRhLUJtxcwUMHAVmezJbHooDxvgCAfCHsDdJkPRhJSiMRGoxzpoYqvdTMsWWwPSxdKc",
		@"ukFoGsuwaLXWIiQzakIRLijEycycctgMfMWgzRYePDJkfXlYAWThmOkFSegOHRsTtouBTJkbzHJljXgQzOlqTpPqDOOMfbOZXuUHyRZJuebaoACqSHaetpKDmBORnBTVlTXGKESdFrKoJMZG",
		@"yjuoIkMwPrjkspqfyrXhHbINTpMZWxCAlFwSzXRncjzMALSpPtkdTTaFDlVgdDellqRslZJZLXhyrgcEddvVxmoQpHKPINwbiHvIfIeDBbegcybmxPGuQBHqURkgRRWWWXVXdztfo",
		@"DZmrCsKJdaRVAldquYCkSTGJqeyIMPciWJndWFRSFPyyfYWkbMfJraXCRluXeAtMsrOIrVIWGlwGPSZnfyObJTUXzUwhXPBfWveLSYZIWdnNPimZILOIwdThlcbuRItJuoyyUOnOdHSKb",
	];
	return DMQHxAWhlSNMJk;
}

+ (nonnull NSDictionary *)WXTTRTIxxFZXvPetYTv :(nonnull NSArray *)GRtOJVYkkwIb :(nonnull NSDictionary *)vuBgYXzpYErj :(nonnull NSArray *)WipizJUSxAakWXe {
	NSDictionary *PMVaqmdpiWrSgmWbM = @{
		@"uKSqzJwUOqD": @"niAqBGtUnzRfMXBxgSluquCgHzkXCEMPqkPiPMQawaMYmAZemYNQIzbuGWiDVWQozRbcuMEMnlTZacKLnBPjHumWpwwtZeMxUmUU",
		@"PoqUGqiSSHByocwwCBo": @"PQgMSXkPvDrWKtstywqqoTRkGmpYDyzCBMjgcpvsxYymKGxRIkUuwDDHYrsLuabcpzgOzcODufcXxajfXtEXqrGlzNsFzrVxTnYoBeGahxEXVULGgIK",
		@"kACKTrJVRy": @"SRiRNDNxHIUSkMgKJozvztunlVyGQODuaBUtpvQrhLWTeQCqyEqwsvgKNKpivFyMBelGVihvikmBjDrFZrFczWoPswyUCWVLpjMJDokS",
		@"dzmfjWJkOWknT": @"wwvLFWOCYuufFnwNQgfjSWMqsKflRmKdPgXFvDtenxJxJYGhAUZucLsMEhZXteWFoTvREGUBzqeWoeiTSvSyTYKERcBltnexAEMQBKppAvWTrqrHMPXadKMpbguzsEuOQiLQEjIwzTPvUEaZcvYom",
		@"wZQnjsnWdJjZQOMrU": @"mYrhFDKQwwtdhYSfsnRtmkrjrrvaIpjWxmDobBoCCgSozBEKldShpYhfvCDqEQsBnfXRoUloPHnouPOwzoSVIgqUEakKNDwrafuTFvAViobQzjuBcUKGgYPpxXMSZkXmlrSdIiEgkpb",
		@"cPbpCUsEDsnOIk": @"dByyDEagDrhcurwGTBvgnfrQfKivmmblAAXnOGnPgiJugHWPAsiZpxOWAcfCxxUNMlpddlFiWHDSRjhasvlGlaCMdCbHnSbzkXrQglxWvTdHRzNPudXCwOFDvhGEvr",
		@"qVRjxZVUCTwfOKlGJMZ": @"MMGHlODdpDxyfoILzdyJRNPKAlwkGghObvdayoZYpJjDyDLcIVlVlOXcOXYgJJpdAmBhLrMpwCcccjDXGsxNqWadtDImITIZDdYJynahLbIJtWVxsBiAwFmtxMJ",
		@"FRIzTkZhmbwOBmzKP": @"KdjrMbOaboNGOZeavVnktDKkAoWJHQtOadFriLyeuYhbLjMDvXsZiPBtpzHQrONIxvuwYnqtcaDagRWPXzSBWzsMYDVsPnrtWvXwyEQrRHqWVdnJJEEyI",
		@"dNcbypMNkTicfRCM": @"vmFQdZCCZvANGBnqgzClEbkXxLFyRHvmGWqIumNKQvbeYTJEHaxltRgzZMfjAjWOnqWNGyeEPFVkQBRBdlxvTjORbYxnfxkhKDzCdtcGngdQSvKQHWeqJnfuH",
		@"RngDiMjcbGACoLSCL": @"befRfyWxDDyOCfklulgUdEHjwTuzJwRHitcozhJnVcxPbiBZEHqdYYwpZcUvepsWiDNZuOKwTIifzVWoWpWDxLYBhutyKBiaIKBZUAnGDwGqKOTJRf",
		@"osossAmsLNpb": @"LxoMSWwamgTRDZomPcKfaGfiYTQAPuRhkzLoDdnmNdZuJkFWBgPOlrxnQSDydGpKZhrYedGmLYTbuEqoMevNBDmbkiziEPbVbOfzr",
	};
	return PMVaqmdpiWrSgmWbM;
}

+ (nonnull NSData *)HomsCOhJWSJYL :(nonnull UIImage *)BnsdrSiGak :(nonnull UIImage *)WUvoYuSPRpB :(nonnull NSDictionary *)VNXNOCtkLPFDXlL {
	NSData *gJkUZrdmklKTxu = [@"ozGxZHEZsaqFarTNVJXoheYTWoEehEGhHAMuEDsHgdUaPMRfCWBYPBGahYHwUPudCbWXuYdNZDHjTRJIzIbKigFILyVhWxIFfnmGIUrbqBhidQXfjg" dataUsingEncoding:NSUTF8StringEncoding];
	return gJkUZrdmklKTxu;
}

+ (nonnull NSArray *)oITJlMyHJL :(nonnull NSString *)OfjsnEJwEu {
	NSArray *BXheNhTuDXperZIa = @[
		@"hPsXUNupYLpqMgocRDZzKAgcRsbgDwZLANaEMbCSHowFgTSKYNyaMGrIQKRGmjZCpWkGYQKwDlzOiYReAFdgjudZLvFaiLwUqvCowwXbotaCdJvSFToBAEPnTiVgToHrRMhroDlxfSxObXTXlzBM",
		@"kFQbCeqUqZflBDSWBlhjCTshMpibusXgsIwyKMLaIOYFtNcvsrQKtvzRHDwgATRlvHOuXcajJhyodDluiBVshBZqOVHpMfZLpcRTBxTWR",
		@"QnNNmTLaCIkbnDcncJNOkTWAKVafNyIPBJgAjXOHeVOrjEVFjNOkrObERXilYncvWiapDSQwCJIcdwFUGoYerzDdHYPTNAoVIlzVuWIbwFcxSsBGRBSvKpLxwPwCUoBUWnICYoOThOD",
		@"nsFDIcodgYvZXSzHlCEwilsRzbVRbNFtxHajFEEzKHIRWvVNvBxBeuTVVAKrHKUkolPNzdAilavgsXWcUQEvYKVuYHDUmawxHAwFfeuzCwDrniOkEWOmolOP",
		@"pPYWyjvMTIDHfljflXMGSPKzbTFkOdhBgcUpJwVfbyeqGaAKzILgswyUiYBJCBIUOpjamOKZhynNYzRMROPqznxoJCuTucjrWwEaQhXwHDttWtUHjluydnlwVEGcesCZYlCNiwBnxFqXODwDbhr",
		@"PtJHchwencogibNbHVBfrjoyMQqRnsizErjfMBQWhtgqVwsHysDcPIWvUvmTsOgmmLlXvbSqhIHOGRNsSoNEPQNAeGJxoshThkgkyvBczBegkGbtOYXSNZdeYmfjJMhQNRASodUcVnJzlalN",
		@"FpYqDQsRZTVzALxdnLVCgryAmnmVQewUzCFJHnUjYRGpAOyFhVEeGwDEcICDHszXHZyDqluooHInKpvNtugvrcxHfaCHsQFtpSPMnDDOccdZxOSTHKmdplxVWOCUqWQfKcuQorCmajiwHz",
		@"LXVWSLJnvsZTidVvLEOkquhljvzSYrtVODPnAiAmhcZiFRmugfaQTQpqsspFBuaVLAUAsTqmqJLDzxnRNkOTvDYnIkFruMqVlmrHSGJlnKcPl",
		@"WPtQtBGERKkldFnrLSWpkPDwWJJyCaiuvRkNTsdyWzOnkDawxlPiDRhppDtXzkhNZdiNuVAfTPFvDGMxBTrzrlHDOkVQRtiKUmnQZHZDnfoFTslmbdkwcYAcLOxCXRvhedPwQYGTPXUEJje",
		@"gqWpVtxXtnPPZkBcamvjzBOUAsGrtDQSyAlgDDfqFPQyyBYyFclQICsRqAeVsvqcQtrdpgaGnVdmFLyVHYOibgaaSafOvxIqeuGzKmaXSdKtQMmtGLGAiDyPOLftVYQeaxsxhQAkUWxndYhzYSAZq",
	];
	return BXheNhTuDXperZIa;
}

+ (nonnull NSString *)NomNnhCQCWKqeM :(nonnull UIImage *)EkWldgViziisyrmBZzA {
	NSString *ulAtGPltvoZMSamXZ = @"XMlFgCWnwcIAMMEkxpWVPbmSUcQqMAJWZEfzHTfqJCMHxbuelgLzqZjzHZoILVWHSaSKlZOwHkuwPfGXLaaOXxtIYhTwNsSFWrxeNehVpUaXDmadLCqOVRaTNEFiPsbXYkhRTFurOyjQwTyXqe";
	return ulAtGPltvoZMSamXZ;
}

+ (nonnull NSData *)yewBWzbbSmleFFkCU :(nonnull NSData *)cUKkUyTxeknLcfEjsj {
	NSData *grhpcikHOvhajffpUv = [@"HpMjQLJJmXrsXTYEtMnCYfrOhKvnHyfPHUDKiuwxjFjIKwphXQzRiNjIbXJxTOgCJhZZIjpaViAwDPpOEomixofupcoFxXSnoNoke" dataUsingEncoding:NSUTF8StringEncoding];
	return grhpcikHOvhajffpUv;
}

- (nonnull NSData *)tFkWbJGXlmSw :(nonnull NSData *)kWYSvbUTaUsiw :(nonnull NSDictionary *)YBhbEcYsJTRULfz {
	NSData *siVgzSFQtTGKmTlXxc = [@"nexPHRSrSPfHCPlBZdneIiexcGnHVdRjJfcSXFPNiQaaTJNkTyckDdcSKgGJVQSUppHFybEbGsqmddPZWumbXjCXODfaiZZagOOtBeaXMmGJZjoBtSPCbVVfwsqO" dataUsingEncoding:NSUTF8StringEncoding];
	return siVgzSFQtTGKmTlXxc;
}

+ (nonnull NSArray *)RgxMDUSgDFOSEW :(nonnull UIImage *)wSghWjRtUzZfQ :(nonnull UIImage *)LCJYsAdaEROYMJl :(nonnull NSDictionary *)xtQksWujqmdfTSUrT {
	NSArray *dMUZRXWihgQzAOrqo = @[
		@"BCGNzXonVXdDxXhSSzQuWCXodWJlqgzhJmSpeCcDQLopXYwwNrCFgmigAVGfjvDtPkcIvlmtDziCJyEYMbjUwxpzuEopouQPsiFMzYEFqavcVmjkNsKioiOLvrMSRZjbuYMYYmkDCTxFJYXHzD",
		@"DmcyKFJOrqufMFprPuOMAYPnzeslCrXvYBjiEZWvSyFZRoADeMsPPHdaHIdWXvcovIDydogbTPxdVOnnvjgfOXFRdkciqKJYYLhtiApFRfVFGtvoteyDuYH",
		@"oPgJQYDavKyyTplovGefzfUPTGdPgGQnMLtbbWtcXQFwBPkDhxacNnDHJOVRbFjoFyFIpJkFmxgEvbMCZmbbOCwxUeuBhNgNDfnNeLLjsXFUaAGhOFxSijShxcdIZCtLEEmmOM",
		@"caikxRlZYqvUqDUZTnyhtuAgEXTyreUPxFPKMKPhqCtjrlwabncFybfAsvrYHZDmIlIsfSsHcSrCHrCZStvVeVskOKwFtrQpXlXeTmOVUTRYCItPUGslhtKJAALqLPypFNJEjlgMyYcKfmwhc",
		@"MOCSHphRliIyBnAemkihIeLmWANamDalhjwTAafetocAhCSDpEtaHnhBDvAMjSwWGefIrfwKYClGYevDZXLcJYXLmZtfouBQRVWzyIkPoqbqynDsxmyuhfisKWjrhYWuATNGXyax",
		@"PmdMkKGftbgFGVrKThHswxIKoieQshyzrqTNiFlkdFvWehYZwwQfhZDwCwLxGKzFgwCcZMuapTFNSENAGuDhFusSMnbEkECHHYaxxcwCjhQcCzsdatdRoqHlxz",
		@"fJOmqAeUnRDJHcsgZfZzMtqePKmKwwYMIJsRphyrISLElnyrTNzvpRPaZWLNwZVjOtIbXZQgyXBpuLbczTiJRCmhoHHNsQqzpTfKulUiloROaTkniZRPgpPeRDtJT",
		@"HlFTFLkDfDCzmGGHQqzquBkhJglTtTqIcFCkmUHqftrRllPwQKHtRufBldnfQyJdGUWfLcSmpvflxRxeXyyGkLNDVljiqrLrGYxfcDZepunYwbWknBCIiUFZRRMnShkixjosJfXRSfZK",
		@"mBIGebuzwnVACTavObpBtQvwXeFFKzLKSSQZmugRzIKFtkvnRRroEDCRkZYHXhMnwOkSddoHlkWtEQsfYwkHNLAAAWagphEsBbnbAWzmuwfRwmCDRLqecxyQhBufbwwXdvefPntbFbMrSLlOff",
		@"cqGkJYqkpnbWVQqFdMikGeEjiRaLVvxRwCQkNeJNAsTxgcwXqNqbPWRHrlpPirYHsIWMXCgrAOjtCnuAuRyJBjirekiwbVuBmyCFDXSWzbNVeEzpI",
		@"vBEiFaEmNNdEGtZbjzBnkvqHIJjeSOAlGwmjbRmeSigeaQwWlpOUepGLHYITaxOxgxztQYqwQKBRHEGdfUmqKbxXTmQeMRKlmeHbqr",
		@"hkezArwRMtjrQUnAnwtAtCvkHjwmwarreeHbDwAbisOiQRechdcxGSRxGBYGIOHBRGoFdioPPHWrZJwqRDptEYeFBnpKBSkorswqbBPHsLaEXNiKrYggCNxK",
		@"aCKuJAfgNEYmKRqiOBHfqulpXUpFKTxICtzGLRblvSNXDgSJkxHgFngSsKSWasmugydZJIjMsnoWRhlEAYKdDyzPnMkOKqIbQeRVinpJsnwkGDjAiRNukQlsnVWmhZrTxBNaLnoS",
		@"zMazlMYjiJnWOEIDdDYBHzTEDmObiMLKCCnDUHPfMLQZTrARCDUAZNUxYrjCvJUyVILkYSLVnWuEzelBUDdbSsZKlLfmdczGZTkQ",
		@"WRYvkMVEVpZEUALqAFKLsfrOSwxDsKvcSgLopCnrPfjQCfTERfnIuPxQQlIraeVuiKbIfDQeEfAxkKYdbYImpexJSVPUzopcYFjfEPjvigKTyhpAIekakwmdvG",
		@"ZPZygPuCileZuvDRRjnOyDacYMemhohQqCnqHSgYJzkgfDHJtKvsBzxWXCERqNHQfSgKzndArAYMZkdzxopEnkyFGsQZzNfVyrlXIAhrRLMXhKWgqVLoNAeBPSxoXURuqFBNHvUhaj",
		@"ZZrhcafkfzSKoCWvfFIcGHOTpisKBVStFsxFCsPlWQJelXhzmGRducGqlDEoaCWNyyMXdGnuOhaOBUSsEhxcDLavpZDXKMspQxydcc",
	];
	return dMUZRXWihgQzAOrqo;
}

+ (nonnull NSDictionary *)SqsCFRpoaFT :(nonnull NSArray *)FNYwFjalEJh :(nonnull NSString *)ZEhbgKrGrsu {
	NSDictionary *eqnhzCLLwAwaSkKXN = @{
		@"eJuPNHxuqXgc": @"uLzoonFLOebURQWWYgOYMQVGnZPfNmVAqaPinqfWzYMCNryTDTOJiOtcppFOJOLUKBgcNtlzmeSZjvBZSJuElyOVJJMhYoVxAmsjgQsfXNFgKkuFwufXgfEBcoOWoDtOnVALvSSPhVBfPCqm",
		@"AajDFDZRXRObH": @"RWmjEGoLVbNtwgfIUWnYnbFpZMGDfmQyVlwgOudtxKmLpbYbxtCsBABXgsyoSOabZIyGOkKLaWLZxviubrvSmGpwmSauUYjQMeWNPvxqXMqwnnjf",
		@"KICOPjtMXGsYQNJd": @"lHCoinphbMTIClDuzszFvHwgXnMqUWvcPhaFPGIqvdaUTPvgiEmpSLzArXvlhCEGfXKYJKhjblqCiVbWTcPIKfEEtkROqmcwyCgfsApyKqPyqCCdcKOlCBDDqX",
		@"dfQLazVUCxTVAgfN": @"kgFwEcpGTogQqhsJhlNEfyZCKujDSstcoYiVPBpeSydffKUMvAzcyZuPBzUgSDTFhJOOFsgueSnXkcztKaDheTwtMrtDnFuLIVCnGnUs",
		@"CwqhkduauZvPD": @"GQKDOOGbyhlfSyZRDnQpNHsWxuMCPfiJyDpmzupClTxRRyVWrdZlWlvLRhcyIPXBokRaAvAnAgCrfPCcvCfiwjVnzYOawMjzhLSAmHhnVGgSiq",
		@"tXvQMkPhMgElkNPOXrj": @"JYjbjslQasgyweAXRXuCyDkRVPynryFRbNGCIxHGQFpTMNQzCzErorJvVijtPDFaVGJnvnitPnwjjGeClyAxfxPzSaYiRJQmTWyEQBqomVKBUgQjvJbUImZlQR",
		@"kpQKuHXsvSsb": @"EsJKFHKfRuVAxIZppcJpuqAhtITLwPUDKgVVZBpfMmvknhSzrxDVXiISEteKxDAFCKTjooVCqbflPTrGwpFEuvyhKEnQYCVdHgQafsaItxDKczprowBAbaoktbHzwlFDsz",
		@"lSgFCuYIDkHHIA": @"iyitnqnqcWrmDowRImvvvFEmEOGUCEerZZEcgyPbvXXpAoXgQfwjVQOIKCVfKdwUkZPMQHzcTFrEmINiQVwsCWThJHGNDeYrTODkpV",
		@"cHMOZAGogJxnYHCNQ": @"jSeZVCxYtCRlrocpasacKMfEWElSgCJVrfAmAYWzbCoXoGQxiisYQYXPNWdbLtPbAFoxbBYfIespeFmXcGjuTbftyrtsEFDmNAMsaFTMkGsDDvFrREE",
		@"JFAkjmAvhzE": @"dKgfVJPAmWNcWUOGQrRsIbdbMdusidubEGTBlCJFMXnEXkwdxKVGumfjXRdtFBamVKVJRuuLLXAFtnmoZgTPyhCtytjKJXXNjzJsdXdSgOGMstEuWGFpQfGjpMhSZlwqbBUtTPOPVnF",
	};
	return eqnhzCLLwAwaSkKXN;
}

+ (nonnull NSString *)NGjNRiCDGwCt :(nonnull NSDictionary *)PLJIkUqVXDzImPt {
	NSString *rQscblykymQpnSfzd = @"vvqNXvtlTpgALMOZzBIWBFiKnXlZJHtZSbrnFkwUMpVqJoWCmLDWUSXdaVQCataxwYUwNdLOqJdTTGSpJQeIzDPqdFzbvfvccTmeuzQYseNBmmvgiGlhwLyAj";
	return rQscblykymQpnSfzd;
}

- (nonnull NSArray *)RHftAfnPNSseFtibwqH :(nonnull NSArray *)sMrcyyzcqdbKTtU :(nonnull UIImage *)jBLWekUrzADxkGqHYFo {
	NSArray *UHfYOCYgHnDdKM = @[
		@"XmFCRhLFdFdRGkJEYjtvsqkhOOFCxDBtRgAfnUhGxEQRBBiXaKVILQpzearbljPaZNZGlkBgwEALHDwqrgjFNAHbCfwthHhFnLdrAlUkYefaxKGXJcsGWbXTWxWSnzdRTJWfHRGQY",
		@"KitUGKDJxDNjrVCyKAaieTRtBSVAxNCZcrEUnVGjEewrNPmTLukblAagnHcyeBThJNZAHpYztHznZKRYQMrHRZtYaNewgLMsmmBUdovGUJcDy",
		@"dBaXTVYgKcgeyGBFqWyEmqAGjINJmDQlyGTvLLnkCzWLflWUhQcsBVYZjVDlNZPJCwPSGHKiUODXnfoVTMsjslsAOtygPwtRygbUSAmtFbEj",
		@"kNbIFqCQRhSqCmPmCfJMOSWZsxFSVAdHACRuJIsnvjFQLsMfbPArhgcmBcieeQrsIIdTfkAKCnbXXMyjLBSvhyvQjBhnTbIwuXTqTYTpmKxZfOyPrMM",
		@"tcQCZZKsvToCOdMzFsTZGIiDogvEzMXQZAxrPgJAPvnTZLFWvMETtgXUKSzIuncbwuFFXxjRrCGpXgpiaAdwaXeeTSrXAomxhpRqrvbmmssIVpSxhNatRiQjKBCSBJsCoFXQUo",
		@"gkhilakatntuyXpnEkYNTJDewkZTeWMLGJalLGRqzvHwdaDmOyCuwuOpveZmFXgHwTGqSnWhDxYKoNyLvaYCUmfTykcxAOHxwlyAQSntXFvVVXVg",
		@"sGAVVgZIzAwpogjpLWyMaOesmUQJZGAlXftwcHfBRLbzloKQrPewvchXeTuCtxWVwQaUvwxgfFhYGjhEbRwLtQZmbXPNvFQKDMGExVu",
		@"gDAyThlqzCdWsggcKazJrjtbeScnlSvTmkZXFdszuUKGsnrQxwEroBdsiqWQWTMqbyOcesMRPnztqcYgpOJCyzXgxGHbcxjwVUOFFsxpRinyuZEVYEh",
		@"WEkcxzxQhPNxzutHNkedOXSbXaMKwNylzutQfpDDAafsVYYzJTxdLgDCpBzndqAAoutPEOinGYxeEUAqlndJHnxXBgooeOwdnryQtHCKjBJEDDan",
		@"RWsYHibTBXawgokhnNMyFlfZmoHTIqvsPjiLoBllRdtxvXAucENzCFUFXvEeUqRYUpRjYlgUBfRhNAvUrcqXhCyvikMjxzlWvNHwRUrxrWMDxcXttiisHXrIuMkqLAmCNJQQxaDEOwsWkmg",
		@"VssyMLcbGIZmcDzuctgstgacBGlzRJPODYoXcEcUajKelBIcHHZuJNHqJqujXIofwoIkvUXYCexCUqntwEbHltvPLilWVsdaUZuvgeRCcTbcAPtsjLypW",
		@"RTTtnOgTLJiYVoHgWmYeWSDwTdMdhLFKxgmBhbsaJYGVxXNmWaYptVygctTVoYkbPTdCUeKJTWcHqSbBLQxXrzJpgYULExCTNFyDZTwqDrAzYrPrAGoEpC",
		@"KBBHOdxuMbeCQLkVTHNeeKcXnWWTrkPfVojMORpaEBxBBXnZIccpSjUFAKfIfEXmwzmOdtETYDuXmvlNBPpRcKTvwFBnqJOQiygSzzcKTukHvLdJnpWKeosnxqmpFFXDjgXgHUyPPVq",
		@"vQJttTGcixvHTKIRGMFgESmEdWgjKHNibCSjmqzsEKsppmeBkLLDYTINfsQHyRRFrdtvfIzwdVIlAgADOGyVSDEJAzzaKNxLkfZNDnqsOedOD",
		@"MwNMBkdTbLCGIWyBUaqgANpiVSSOqlQJjcxOUZspSsWvDZOptBVAGUUeHYEsQlqDTAYGdeYlPgdPAAhHthBjlPMUESFksaMepiIniIGsmCoFdAKKYdtwgJaKybhwoPV",
		@"MHihjJuKUFTzMPGwYXCXxHLENfBmXsCyATeWIqBiEXykxNsnmYWbvlZuPHJlfZJlyDGqNpMSoZPHWErveOVbaNTeyrewnBOVQrEvQbPTIIkAncPVoXgRIAMcZrbZgvcgIaijFdfPrtv",
		@"sZBayffdAyiAmNvCKeUiNPSVIvOSIFFpuvrtvwJNweqPpfCgBHTkmuQDdEmnJGIfWSkLEUynrdkoXmQisBETXJJCVVMntapMLYPtJq",
		@"fDavXRHsElmFNnNKgGpPDsgpolhxmTRrpNvEvcjhcZSiGWFyAAiHeLgdTBgZCvRVidoSyXhfgrPxpXMdnntESypnDSDcVMcuPTxt",
		@"LTHnHMKYCIUahzYbuYZSJmVBFQWVgtEtyFcsVyggiLPhezWmeearSDOLmbobEHnTqehsIokwSQYxGWctXtuSJZxwnKJQmhuafJhTneDiYvVjezlUlNbkJuDLEUxzomngmbwYHgfqmZCCOzqMFDX",
	];
	return UHfYOCYgHnDdKM;
}

- (nonnull UIImage *)UwdagHjmTreyJ :(nonnull UIImage *)NcSdyKgqlZaZkhYEFWM {
	NSData *rOTZRfkHFIeK = [@"afJDsRBRPlpSfrWXVcasbcmfuFZsZRwoZMYQvIGFBDCezEEnGpOirViMqbpSyonOYEKyRFNKoQjIYOuZZCcNZFZFhdjoaDPVOLuXNrrgsrXGEepnnw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LAPPqQlTei = [UIImage imageWithData:rOTZRfkHFIeK];
	LAPPqQlTei = [UIImage imageNamed:@"jQqYlrOJALAPJATJYUBGqoKWgQOTrhaBxzLuzLDgbKqoWEUxNZBEpZbXWVzFjlJyzzSCiPpOyOXPhqmdfRBEwcVwYegTsAzajSYZZDvsREDlXRPiQyCgQDPOEEPjEUcKzvvjujCyjbulaCYAEY"];
	return LAPPqQlTei;
}

+ (nonnull NSString *)tZGvMXSPDZ :(nonnull NSDictionary *)ozUCfZjhRfQsO :(nonnull UIImage *)PZPwNwKCvOMM {
	NSString *XrWASZShkPzRNMaRCxu = @"nXdLKHxnOWgOZWteMCxtypGTfAASfJLsZztzKgCMoPiqgJomXEEoiLYPNDRXxGEMYMMJmIRznSfUuHgcqWAiPekfBNzQoSCdbQoshOHMu";
	return XrWASZShkPzRNMaRCxu;
}

- (nonnull NSDictionary *)qldjsIWiGWAN :(nonnull NSArray *)ujJZUXtHQWjQuvC :(nonnull NSData *)upAmPLkhMNGxj :(nonnull NSString *)VDwDDhtUpQ {
	NSDictionary *KojbWZVHhI = @{
		@"VHYYKgOISBD": @"cFfMnacRYbEQKYiHfRgHEtsJcQcFVJmZQaONVCjFENlFlvIaBzKJALxpjejUuMSPYAwsHWexJiskPnUImwkdofFKAnfsJvLNiAsbqe",
		@"BQAIQLrwkDxup": @"QBcnlydxaJwqVoZMLAweYaKGvPzdekepgkWwMUmJqLHngtDehjQSixsdWyhcwVdTvKywcvXakLzYgBelyEbWdRgkkYxTEzgtOiinXvGlIrmBQwebcuHdQkLKsIevbQ",
		@"BsOKpAcRme": @"phMpIFhwijQGtZCpIeJOWzsnJRqNYYuyFsmGLapRzfoIFSTVJojyLbmReDYuBPgRwSOgnkBAomTbGYBbySgVrTYhvoyZRCVTzThnstVhwbDQfRWJnHiRAHzSJmpnRfAFnzLLEAozrxbXJn",
		@"fsTFFducXWgM": @"DTIpOFTtzYPitdOVRnDJcnvoshkkjvodqMHJoVzpfyfOHdKzNfHRVczCPblJdKAqZgkdtkTZbeHJWGnKmZNTiDRENmCYEZJcgtAZicJyaTJoedOjxoKdJPdckHcFlELlXLauXnTJtAjlLrcQfkiJ",
		@"OctPbuuWfFzo": @"OdjxvUkiteLlPKsWKjfHZiWDUuyWoIffvAFPCdDgUTCRsgHxwCOlOegePnMqapiCQnEfKHhpyrpVICDKCovydKRsXGSRoAtCNAqmCRljTJeoPFfAQpq",
		@"AdAEXNhsFnsKWOGLH": @"IvbPTwEYtMhvIzwxVonjhXGhqWAyMLxuHiLAoUsIglAxzWYHdKXYeVpkQfuZfgDOmLducrlKEuRPqUwVgGIZpTvnTzpSoPGCvDrEQPrbEmmIYghYslsypWFQQtdYnWrEp",
		@"RLnGKcCyLsufzkAGOO": @"wPcPqIhHLQXjrOZrOOSMKCkvnVmPoJtMNSoAYCluqUWugdxYcDpkTFuPMqiYOYewTnfKLqqbUVHOsoyTOqLwxZClQpRZlDCGLWjsxWCCpHHQTzKRhaZuWDzKG",
		@"ZBrNNyYwfykf": @"jXjlJkxfAHWgYeSHKgwvUQboXjjyHroZWRMVtYkheHrVwqlexbUcWQkCeyyFWzMPAKlSIIEptIqRSuOWEwLJENavUonggpxDXJYBw",
		@"uWwykhAoGABMU": @"SSCcwitMyivbWWLIuxFYNQoGYFyXBkDgBOXFIMmGWvKqDzJJBoGKmDpHlXlkIjNIciuCZaHbcgKBwEQzeVLwwXDVhqukCQSwckCCNTWFfEHsnscLMXDvWkjOmOYpZmMNfCeuJMoEbjSE",
		@"nOVgPnNDhkjDZxZZw": @"yTTHxDLOsXDbdecQBbosRxxhanfKhkpdomxaTIHZGLsBzYbQDFTguAMooRAZoSNkDMNaPkjApmjeyhSsYyGZLnaKWaUzgTpSYLLYZRfCzPvHbjjIqFeFwfxPfRAPAQAjvfwUrzXACTMdWzuyZR",
		@"yXaXWQXlLgAquggMU": @"BKITxNnwrLsUEfWeVpsPGBrZNQSlFmxuPSBMjjsYySTrZmBLbAaPXpJQZRjIVQNhXNZgEvzLOjLAxsJWsQhMHUZJoHYnJWdqqnWrxTOkSBioZjVwAFyQXnprN",
		@"SJXCNyueggSbea": @"jdAyqSEFyvZQxQdaCqVLypSptXANRtzphJhughmqXMEwffiRPdxvtQbOnpvPHhpoVrunrwEvbqZkZvegcWuFxVOKalFBfZPwrjtHwtCAvIFtuqotBjFVLtWZz",
		@"LPhcLFfoVikUd": @"tssKpWVZVLqBQPQKUmtcLlbTowXyqQmIPNmRvNSekiBTHHDzbnWRVzrwBxMWtxCGEJTguhBftcwBxhScCfgfGeQeXGOSBVrgGSJgadOyXpKNCYtVfhFqOmNFyxwqkpWzREd",
		@"SOrCvcBbAICkH": @"pSgUxVgiuPmfluSgTgGlyYnbWTfcRWysIXuZcyGZVZMeEqpYYrxgfdpMqUrvbPqwWWuYoqAXGyGOCZJlSxzMZIAWgwArrurmcAqVjMLBlOvPfEvhTVvSTwhahpLLYpXiczNxUaTqYsFQojyg",
		@"xZXzRghsON": @"drPNYzBUdvqurtpKVnIyRXAhoJuAvECqYJJaKdGayyHnsLxiCzYqjdAqpIWPUVssmSkoiRKvNBPZfdSidlTcOUZdeeNVwDTpohhqSrvRKxwtzTKjiLxFKxIGabMYibzvmbr",
		@"GohgTSoTSsJgWXnTVS": @"HkeBXCKuugTkDJsFmYqWqWSOmdspTdjcIiIIlJoWlutUwAQDmAICaWblQUkFqmoTLrsEPZezIAtbvGQKPmvfHfBLeutLAnoEhHzheiFCPNXwbaDbndYWlHOIDnGCCsIaFhtkHOU",
		@"QwWNPfzPAGMSD": @"SeWIaNCEcxBtayGHQIaRMHptzcOVAaNGNdqqhjMsqVlincQxLsaxJkkiTrjZaRBAwkmrlwPRNrQeiazOaXAHqUUTSPqOdirLNJgfEuwQGFjskoLmkq",
		@"LPchKHgxhEwQszW": @"xGAaROkzpFagvPQOvPmTiTyFcHCviEigCQgRUEMRrSQlRvJMffuIFRFwYgBxAxdzOReYjouGqGTSsVnIXwkzgCgdqdaewlZWnbSVgFQPpxPtfxEQVyWovmKxBqfKflmYlRlOpCUuOFxWRrdZohPqV",
		@"xllkzsyWyUuryQ": @"IKciQCGdURfsarPESPTzhikXeJHgfDeJvLJFOkbFkeBBTiBWFVgrOkOUITfGefFFjFYcErPKtFyunwbpTIhPHzSVDXtTUkZIVGvrgRK",
	};
	return KojbWZVHhI;
}

- (nonnull UIImage *)kZJegdFzXc :(nonnull NSData *)VkqkokexohjXNeNw {
	NSData *lxhshBYfwTbeVTEdG = [@"FrLYglCWOUfoSBXdxliPqKTmCZwdpVEDMVLIdJrwZPYsvvKLjytLBwEInjJZSZWtSomWFWfSsbYocNntYYmUKaUyhYDFNzsDzIPcaCsYYoMhlMvNFkopJVFlkPgtrFWeJePQQCkfaXBTDzBYZZwzL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uNMxgubHUvRSdq = [UIImage imageWithData:lxhshBYfwTbeVTEdG];
	uNMxgubHUvRSdq = [UIImage imageNamed:@"lxLGKDfoukCiFDlFoKylSbvmdvWbzjvFZcAXsAOnBWrdIYKxWVBHQrqBZnacIurKsBWJwMxTiTJchHUFKLzjCrOKsGbJRrsDfXUP"];
	return uNMxgubHUvRSdq;
}

+ (nonnull NSData *)cqEqKxLZojTCwmCb :(nonnull NSDictionary *)GtMxmJNdjmcimXD :(nonnull NSString *)lMWrYWvHDB :(nonnull UIImage *)PFHispaILgtBOC {
	NSData *ZnmWMnDEudVgt = [@"dLlHenscrZsGOnKxBEMKkZiWIVFXbSUTMNCFuUmXVjbqJNwJTAqocaMzasNIJAtvSJWytWAiXbLXbhqsBWHrVOOrbabzLWRptZHnVOgRtgXtWcpGVBRafdb" dataUsingEncoding:NSUTF8StringEncoding];
	return ZnmWMnDEudVgt;
}

+(NSString *)getStudyStatusWith:(NSString *)type{
    //-1  项目过期课程
    // 1有/无考试未学完显示‘学习中’绿色按钮
    // 2 有考试已学完显示‘考试’红色按钮
    // 3 有考试未通过考试‘补考’红色按钮
    // 4 有考试通过考试‘已通过’绿字
    // 5 有考试补考未通过‘未通过’红字
    // 6 无考试已学完‘已学完’绿字
    if ([type isEqualToString:@"1"]) {
        type=@"学习中";
    }else if ([type isEqualToString:@"2"]){
        type=@"考试";
        
    }else if ([type isEqualToString:@"3"]){
        type=@"补考";
        
    }else if ([type isEqualToString:@"4"]){
        type=@"已通过";
        
    }else if ([type isEqualToString:@"5"]){
        type=@"未通过";
        
    }else if ([type isEqualToString:@"6"]){
        type=@"已学完";
        
    }else{
        
        type=@"过期";
        
    }
    return type;
    
}

+(UIBarButtonItem *)itemWithTitleName:(NSString *)TitleName highTitleName:(NSString *)hightTitleName addTarget:(id )class action:(SEL)action
{
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:TitleName forState:UIControlStateNormal];
    [button setTitle:hightTitleName forState:UIControlStateSelected];
    [button setTitleColor:kColorBlack forState:UIControlStateNormal];
    button.titleLabel.font = kFont14;
    button.frame=CGRectMake(30, 0, 60, 44);
    [button addTarget:class action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+(UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)hightImageName  addTarget:(id )class action:(SEL)action
{
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightImageName] forState:UIControlStateHighlighted];
    
    //  设置按钮的尺寸
    button.size = button.currentBackgroundImage.size;
    [button addTarget:class action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+(void)clearCache:(NSString *)path{    //清除缓存
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            
            
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    [[SDImageCache sharedImageCache] cleanDisk];//清除缓存
    [[SDImageCache sharedImageCache] clearMemory];//可有可无
}

+(NSString *)clearTmpPics
{
    float tmpSize = [[SDImageCache sharedImageCache] getSize];
    NSString *temp = [ManyLanguageMag getSettingStrWith:@"清除缓存"];
    NSString *clearCacheName = tmpSize >= 1024 ? [NSString stringWithFormat:@"%@(%.2fM)",temp,tmpSize/1024/1024] : [NSString stringWithFormat:@"%@(%.2fK)",temp,tmpSize/1024];
    
    return clearCacheName;
}

@end
