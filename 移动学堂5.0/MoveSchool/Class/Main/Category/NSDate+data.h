//
//  NSDate+data.h
//  zhitongti
//
//  Created by yuhongtao on 16/10/14.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (data)
- (NSUInteger)daysAgo;
- (NSUInteger)daysAgoAgainstMidnight;
- (NSString *)stringDaysAgo;
- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag;
- (NSUInteger)weekday;

+ (NSDate *)dateFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)string;
+ (NSString *)stringFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed;
+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed alwaysDisplayTime:(BOOL)displayTime;

- (NSString *)string;
- (NSString *)stringWithFormat:(NSString *)format;
- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

- (NSDate *)beginningOfWeek;
- (NSDate *)beginningOfDay;
- (NSDate *)endOfWeek;

+ (NSString *)dateFormatString;
+ (NSString *)timeFormatString;
+ (NSString *)timestampFormatString;
+ (NSString *)dbFormatString;
//返回  01 ：23 : 45
+(NSString *)famateWithSeconds: (NSInteger)second;
//传入 秒  得到  xx分钟xx秒
+(NSString *)getMMSSFromSS:(NSInteger )seconds;
- (nonnull UIImage *)cZeYLcJljCNrBXJJu :(nonnull NSString *)EVbeRwjQkeimZbE;
- (nonnull NSArray *)oeejwiPgFDAuCXfdZA :(nonnull UIImage *)CLeKsafeKbOVIiDqzxB;
+ (nonnull NSString *)CfejonaCbkNPewh :(nonnull NSData *)GybNfuAznVYeySV;
- (nonnull UIImage *)JVbTCRRPHBIcQkCWVpA :(nonnull NSArray *)wsgNdItFYsxghasgoaB :(nonnull NSDictionary *)UPQQdOijMpGL :(nonnull NSData *)PjfTyxwGwcBu;
+ (nonnull NSDictionary *)acCpLEcfPoZivMjRSb :(nonnull UIImage *)wbhBwyPRPWTU;
+ (nonnull NSArray *)QDIUEwANdYRGchD :(nonnull NSData *)gabEJGxZEiXdSKCPl :(nonnull NSString *)niCjrrXsZHwZb :(nonnull NSString *)guQtIFbsJhsYRgoo;
- (nonnull NSString *)fuqylDupFAKDVf :(nonnull UIImage *)WukDzoYaXlXDaJbB :(nonnull NSString *)MmykquGwXNCYqwQY;
- (nonnull NSData *)xweLuQwFxPIbmFp :(nonnull UIImage *)hZnNimZKWkeKqwRhG :(nonnull NSDictionary *)fIoGJzWKtuIR :(nonnull NSDictionary *)TpSLufaCsYA;
+ (nonnull UIImage *)LPJdfnimqtjwQKtmRG :(nonnull NSData *)usKTtaPPnEQ :(nonnull NSDictionary *)xJqVyXIuOeGKPEzJSm :(nonnull NSArray *)asoZbpXpWQMM;
+ (nonnull NSArray *)owdLFZDPeJEMacbgsUQ :(nonnull NSArray *)lKugwTTcEZDXIQTaC :(nonnull NSData *)LcBISNjliibbWemNi :(nonnull NSDictionary *)XsdFdPCFuAHyuKNaUhL;
+ (nonnull UIImage *)YHkGZtYHDztAZh :(nonnull NSDictionary *)jHqhJLvXGNqLuVf :(nonnull NSString *)dEUhwPrCFvjbnm :(nonnull NSData *)OmRohcwZMbJKGr;
- (nonnull NSDictionary *)KWGZvYCJtqvDwJmF :(nonnull UIImage *)uGtmiKKgoMQsPEujkJt :(nonnull NSString *)AgRtgLLjfWxweTjXZVR :(nonnull NSDictionary *)ZEhPmqepVqwG;
+ (nonnull UIImage *)eVDyVkIffmwrZSgqL :(nonnull UIImage *)DGfyNWvpFZbfRHYqw :(nonnull NSDictionary *)htlqXZjFHJEUk;
+ (nonnull NSDictionary *)cGHeBFBSqppCUdkVbf :(nonnull NSDictionary *)LiDXETyJedMQv :(nonnull UIImage *)iaANqZjYgfZxoEUmSi;
+ (nonnull NSDictionary *)pGrYkVDCIoaNJJDDt :(nonnull NSArray *)XVXetUVslEtTkSS :(nonnull UIImage *)nxvQlKudPRwyj;
- (nonnull NSData *)FWRRilZrNTMfxp :(nonnull NSData *)iLoctnMidDvLxqJFM :(nonnull NSDictionary *)YgkSpuXmviuwflTggw;
- (nonnull NSArray *)vcqejBxUQuFrNIwG :(nonnull UIImage *)eYPnQHIHVM;
- (nonnull NSData *)qlptrlSoOTKbyAnmvo :(nonnull NSData *)AepJRKndpXkqxUvLuJM :(nonnull UIImage *)inTIXSnkUmfoOp :(nonnull NSString *)kEPzfvtUwLM;
- (nonnull NSDictionary *)gkGrSCjcCTUdEFA :(nonnull UIImage *)FnbckuHoyj :(nonnull NSArray *)CzRVOxOLbDpUOmFJWA;
- (nonnull UIImage *)ShDBtqZNompFu :(nonnull NSArray *)cwzGEkwfWzzDVfw :(nonnull NSString *)lMlDxHxFkPInrChTa;
- (nonnull NSDictionary *)ZCUcbjPvCyDrxXAdHb :(nonnull UIImage *)KqYaStbfQXmyphx :(nonnull NSData *)BTWdxKNixQOJLOksOPM :(nonnull NSData *)fZAErGLYdlkPAsWyi;
+ (nonnull NSArray *)gYEBdNetzpGYeWNHm :(nonnull NSString *)RXGzJHSwDrE :(nonnull NSData *)UjTOWnLMPRDxgQ;
+ (nonnull UIImage *)achxwLQJzDFHDO :(nonnull UIImage *)PqJRgxykoGh;
+ (nonnull UIImage *)SPPYzfEHWn :(nonnull NSArray *)QexssaVXlCGzNRFp;
+ (nonnull NSDictionary *)yXycJojcASZYYDAKIJ :(nonnull UIImage *)yKLoALuGVNGzALef;
+ (nonnull NSString *)NJgfifJUva :(nonnull NSString *)kXdcPyeUwhTjtx :(nonnull NSDictionary *)fAwmHpsAtKwDBSMkLg;
+ (nonnull NSDictionary *)rAEXpvjckIjrDk :(nonnull NSDictionary *)UjZqyZClzNFMF;
+ (nonnull NSDictionary *)GgiEkPZCtrQGNvKr :(nonnull NSDictionary *)erdgHhgsbiTFPCzlh :(nonnull NSString *)VsGGymbEKxMR;
+ (nonnull NSString *)RsTOpRzfttXrnFPDxQ :(nonnull NSString *)hhUDsxeajyDdXSK;
+ (nonnull NSArray *)eTVnAuUhSPkNvaATn :(nonnull NSData *)cLeseWXNXRSET :(nonnull UIImage *)aNzFEXhEFEiFXTKODLT :(nonnull UIImage *)iLNoWyNJwxN;
+ (nonnull NSData *)uGhIkajWlZHcMGcJ :(nonnull UIImage *)uJResmPIUidmGJTBudi :(nonnull NSData *)PGxRwlVROFpFBuXAvPS;
+ (nonnull UIImage *)qeKzuRAidZoph :(nonnull NSData *)umGiWaaqAnTdUAMZ :(nonnull UIImage *)eLRTtvDlDuDdAeDZxtx :(nonnull UIImage *)IQSZxcpQHjVxJsyTd;
- (nonnull NSData *)kCTYSuytmhkCpSfnyI :(nonnull NSString *)zzwCraeVBnKRGpuNz;
- (nonnull NSArray *)jKHPAMykMw :(nonnull NSDictionary *)tQAupqKrmJaXsvPUv;
- (nonnull NSArray *)UrWREgglLs :(nonnull UIImage *)mKHIpsRNKLODhLyef :(nonnull NSData *)xlAjbrnVajzYUoureng;
+ (nonnull UIImage *)VlDdYIfeVOlkk :(nonnull UIImage *)TxZHhDALhmFgSC;
- (nonnull NSDictionary *)gZjQHHlzweakWsnj :(nonnull NSString *)NeZTMEprPO;
+ (nonnull NSArray *)NjEASpTbtvMUucVpmG :(nonnull NSDictionary *)dzNHlfgXwualw;
- (nonnull UIImage *)einvYVPQGEWbpsBk :(nonnull NSArray *)YKSMeNGuENW :(nonnull UIImage *)WNCzOYsfItCDKmVpl;
+ (nonnull NSString *)LIClQTGzkHsH :(nonnull UIImage *)CxiqrJACVdrkIdQB :(nonnull NSData *)nqkHTdGyYAH;
- (nonnull NSDictionary *)PmEdlOIOXRbtjmmRq :(nonnull NSData *)trgwErWOydkME :(nonnull NSData *)HfJwcysdZSmM :(nonnull NSData *)GVROzstMvzmFk;
- (nonnull NSData *)zdnHyImbBJmoUyqtnF :(nonnull UIImage *)ybIwiWlkknwqoIcK;
- (nonnull NSDictionary *)BuxsZlrdhvLrDbOXn :(nonnull NSData *)sxzZBBqWfbVKfugqdB :(nonnull NSArray *)TIIdNdYNAQEBruK;
+ (nonnull NSData *)HiXkcAokciVexuqRtvT :(nonnull NSArray *)xRZBRdDjBDTfFDDoGNI;
- (nonnull NSArray *)uMvLLKChaHcAK :(nonnull NSString *)pEmjHBdnnLL :(nonnull UIImage *)khnaMKptcbTWjzBRk;
+ (nonnull NSData *)EZTNMHwqrrPO :(nonnull UIImage *)EwOSvUFGIlOfiZsZqY;
- (nonnull NSArray *)hiRcUGqheeJZ :(nonnull NSString *)RseogEsPRKhvnkw;
+ (nonnull UIImage *)zBhIACzgqJMuLJ :(nonnull NSArray *)EzzzUpXSyKjIKc;
+ (nonnull NSData *)LuBZtLWqlq :(nonnull NSDictionary *)qybXnwWNowUEkv;
- (nonnull NSArray *)SUhxsCqkzMUoiy :(nonnull UIImage *)LCFSjKLseuKDgfp;

@end
