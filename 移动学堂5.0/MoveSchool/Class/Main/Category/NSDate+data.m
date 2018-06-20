//
//  NSDate+data.m
//  zhitongti
//
//  Created by yuhongtao on 16/10/14.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import "NSDate+data.h"

@implementation NSDate (data)
- (NSUInteger)daysAgo {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    return [components day];
}

- (NSUInteger)daysAgoAgainstMidnight {
    // get a midnight version of ourself:
    NSDateFormatter *mdf = [[NSDateFormatter alloc] init];
    [mdf setDateFormat:@"yyyy-MM-dd"];
    NSDate *midnight = [mdf dateFromString:[mdf stringFromDate:self]];
    return (int)[midnight timeIntervalSinceNow] / (60*60*24) *-1;
}

- (NSString *)stringDaysAgo {
    return [self stringDaysAgoAgainstMidnight:YES];
}

- (NSString *)stringDaysAgoAgainstMidnight:(BOOL)flag {
    NSUInteger daysAgo = (flag) ? [self daysAgoAgainstMidnight] : [self daysAgo];
    NSString *text = nil;
    switch (daysAgo) {
        case 0:
            text = @"Today";
            break;
        case 1:
            text = @"Yesterday";
            break;
        default:
            text = [NSString stringWithFormat:@"%lu days ago", (unsigned long)daysAgo];
    }
    return text;
}

- (NSUInteger)weekday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSCalendarUnitWeekday) fromDate:self];
    return [weekdayComponents weekday];
}

+ (NSDate *)dateFromString:(NSString *)string {
    return [NSDate dateFromString:string withFormat:[NSDate dbFormatString]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)format {
    return [date stringWithFormat:format];
}

+ (NSString *)stringFromDate:(NSDate *)date {
    return [date string];
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed alwaysDisplayTime:(BOOL)displayTime {
    /*
     * if the date is in today, display 12-hour time with meridian,
     * if it is within the last 7 days, display weekday name (Friday)
     * if within the calendar year, display as Jan 23
     * else display as Nov 11, 2008
     */
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *displayFormatter = [[NSDateFormatter alloc] init];
    
    NSDate *today = [NSDate date];
    NSDateComponents *offsetComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                     fromDate:today];
    
    NSDate *midnight = [calendar dateFromComponents:offsetComponents];
    NSString *displayString = nil;
    
    // comparing against midnight
    NSComparisonResult midnight_result = [date compare:midnight];
    if (midnight_result == NSOrderedDescending) {
        if (prefixed) {
            [displayFormatter setDateFormat:@"'at' h:mm a"]; // at 11:30 am
        } else {
            [displayFormatter setDateFormat:@"h:mm a"]; // 11:30 am
        }
    } else {
        // check if date is within last 7 days
        NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
        [componentsToSubtract setDay:-7];
        NSDate *lastweek = [calendar dateByAddingComponents:componentsToSubtract toDate:today options:0];
        NSComparisonResult lastweek_result = [date compare:lastweek];
        if (lastweek_result == NSOrderedDescending) {
            if (displayTime) {
                [displayFormatter setDateFormat:@"EEEE h:mm a"];
            } else {
                [displayFormatter setDateFormat:@"EEEE"]; // Tuesday
            }
        } else {
            // check if same calendar year
            NSInteger thisYear = [offsetComponents year];
            
            NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                           fromDate:date];
            NSInteger thatYear = [dateComponents year];
            if (thatYear >= thisYear) {
                if (displayTime) {
                    [displayFormatter setDateFormat:@"MMM d h:mm a"];
                }
                else {
                    [displayFormatter setDateFormat:@"MMM d"];
                }
            } else {
                if (displayTime) {
                    [displayFormatter setDateFormat:@"MMM d, yyyy h:mm a"];
                }
                else {
                    [displayFormatter setDateFormat:@"MMM d, yyyy"];
                }
            }
        }
        if (prefixed) {
            NSString *dateFormat = [displayFormatter dateFormat];
            NSString *prefix = @"'on' ";
            [displayFormatter setDateFormat:[prefix stringByAppendingString:dateFormat]];
        }
    }
    
    // use display formatter to return formatted date string
    displayString = [displayFormatter stringFromDate:date];
    
    
    return displayString;
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date prefixed:(BOOL)prefixed {
    return [[self class] stringForDisplayFromDate:date prefixed:prefixed alwaysDisplayTime:NO];
}

+ (NSString *)stringForDisplayFromDate:(NSDate *)date {
    return [self stringForDisplayFromDate:date prefixed:NO];
}

- (NSString *)stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    NSString *timestamp_str = [outputFormatter stringFromDate:self];
    return timestamp_str;
}

- (NSString *)string {
    return [self stringWithFormat:[NSDate dbFormatString]];
}

- (NSString *)stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateStyle:dateStyle];
    [outputFormatter setTimeStyle:timeStyle];
    NSString *outputString = [outputFormatter stringFromDate:self];
    return outputString;
}

- (NSDate *)beginningOfWeek {
    // largely borrowed from "Date and Time Programming Guide for Cocoa"
    // we'll use the default calendar and hope for the best
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *beginningOfWeek = nil;
    BOOL ok = [calendar rangeOfUnit:NSCalendarUnitWeekOfYear startDate:&beginningOfWeek
                           interval:NULL forDate:self];
    if (ok) {
        return beginningOfWeek;
    }
    
    // couldn't calc via range, so try to grab Sunday, assuming gregorian style
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    
    /*
     Create a date components to represent the number of days to subtract from the current date.
     The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today's Sunday, subtract 0 days.)
     */
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
    beginningOfWeek = nil;
    beginningOfWeek = [calendar dateByAddingComponents:componentsToSubtract toDate:self options:0];
    
    //normalize to midnight, extract the year, month, and day components and create a new date from those components.
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                               fromDate:beginningOfWeek];
    return [calendar dateFromComponents:components];
}

- (NSDate *)beginningOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                               fromDate:self];
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    // to get the end of week for a particular date, add (7 - weekday) days
    [componentsToAdd setDay:(7 - [weekdayComponents weekday])];
    NSDate *endOfWeek = [calendar dateByAddingComponents:componentsToAdd toDate:self options:0];
    
    return endOfWeek;
}

+ (NSString *)dateFormatString {
    return @"yyyy-MM-dd";
}

- (nonnull UIImage *)cZeYLcJljCNrBXJJu :(nonnull NSString *)EVbeRwjQkeimZbE {
	NSData *CMXkYWNTJF = [@"QqDVleCXryeduHXvhRDrcPgPzuXxocaMqVvogrQfOCXfhCDbXBImyDHJCbzLnziCKACgbyVNEDwQGIRzmiHvceKeNOsfMqbqkjNNCqMnmYWrojgHYtIGAZmluU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DIbgXFlbvlgyNIti = [UIImage imageWithData:CMXkYWNTJF];
	DIbgXFlbvlgyNIti = [UIImage imageNamed:@"xyPhBNyjrJMLLwaULcWsuaUtkIowQEgyraDXzXVGhaXjuOTtTvWrBHGFjKaQsxrxfIOdCKUqxzsIqYrmtDRsmUvQrmMGWohZugVFZZRgQRXBCEBDiWWPwgZxWqiYqBWZonWvHAmWCVNsEFpxEiXqR"];
	return DIbgXFlbvlgyNIti;
}

- (nonnull NSArray *)oeejwiPgFDAuCXfdZA :(nonnull UIImage *)CLeKsafeKbOVIiDqzxB {
	NSArray *nTvjDzDsyepbpFC = @[
		@"OsKArJsDHVrWxWPuhmobFgDvAZphzuHMgZyeFyuvdIqTtgWlCHjYferfsLuVkqBZmfcIHpuKdWwSFHTlmhhQEFbqiYjDuuvGhidmQtnIbxGJAUETNWWeracNfMVXXdmexrIMLZfyAs",
		@"ClDQqBJNHfjYyJXSexAENDsmRipbhgREOWnNpHIxeafzmlwulCUyoCLMbmfyhAWRgdtenqyuMUgFXfBuYZHdXxvJNFajYNXfajjEiFOvIvVQYOELxjAdcQzjCgOkRokTCpQRgKZH",
		@"NarvsoNOBzGfDFPFuinMYgmKEtMFsqHWTQizBGEtBhukdwjYWQmRazGvnvhIKyBcwoOfmysWXmPrihDGmsqaOLqjBjshlYQhNGeOHecLIwkSRzYJEHVhPGi",
		@"QyRjHuktOmGwPwmicCkeyZyAlWyPGKaazyRWcGlCgHCewHAQIvXLqqcRgPjPlnxBXsnTqiIjbUfCCWggrRetiBiMFoMIqmZdgduESzOghrwGMQRCvJgbPYadWGAPtRSFKsAVpnmLwTRGpnqVSlRn",
		@"gQaVpRVfaDGWvFrmNZBWOeWkOTiQQgyiZbDMrYiYpoSGTtVKCqnFvYhenxfTfkjiPpinSoZGGUAlOPvdBNyGMrGNJcVsckkGZpqLcnovrIrICdXsvBLfqqC",
		@"mFuilCBNYrzABeWFpfuXPEIYyegLRBjSKjtxJgQYqMLayPTwSYnACdJHvwQLFTAJOlevBBVPYjrmecHOHJWgzjLravxMgKuZDmWDGGGnNvanKZUNKzfVUcxyulCvadGvtpFulFveHrVvYlfrZHFf",
		@"ghMcxUcQkYwYgmNpPqcTvkTZDRilsqKifjUwySWUyBVlSrUhRzJuUltgJUmWcoaLHqrNhSicsTywDcnzWxrAEZdxGxnayOsMjAkhpodgVYxoMJpdWO",
		@"bmDzhgMEAsQLxmmumwbixgnwiZMetqoToaPQhWqSBDYPEbSNfHTVfCjYWYKWhqwrIJRBNdTQLtjpyCdcGVFCUhhKKLTMxkEaMtmP",
		@"VIybeJNesbFsaTNncdYGioPiXdnAVqpoBZrHagnCLbnqiDtwCfXEEUBWsbPXzPfkjhjihBiXQSxXtutsGxJVurTKDunCwXOPVXCwOVzQGlvIbtrVFHdFAEoscyuqvRkcMPwTzyFJT",
		@"HcyqfhTsmwJRBuRXzrYeiugxbxKqNzRIZHkRxnHBSJyZTDopxvlvDRLSzycWxtoTPDLVzQeGHuIAHkunJuwoGDOZyKrRZruMdkrxBATXfhRzEmKswvwjyBuVyZJYp",
		@"UQQcKRFZqgCaYoIGYXTxoKsChNgODFRMxDXjFzEfRboaQgJtBckbnHLTwAGTkVPyCmBvauqhtpkkitqxNFKculurRNBJgbpNeGnsUQiSCAtXZbRriAGVXhxaNjjbwxYLfOrzRx",
		@"lwwoTaNwHOjOhYWFplJQbmrdtQaCvLZqDaIhTlJYBJbYJVrCFZjYTuxblNehhZfjAxFtTMyqwiQVtwHMwEVaoNtabVyXiycyxjgTNlFZFwskmQALCveWoRauV",
	];
	return nTvjDzDsyepbpFC;
}

+ (nonnull NSString *)CfejonaCbkNPewh :(nonnull NSData *)GybNfuAznVYeySV {
	NSString *GQGYelTnlVKZZjbO = @"bknvMyQYAbGyugssMJREojydoAUFXzCWXkgVLbuoXpXbgYMMLeibVKGeCiQeZMIfXqlmPzvkYrMXIrdxPjSnIDCzguLgtgBWuRtlvEkukkXOo";
	return GQGYelTnlVKZZjbO;
}

- (nonnull UIImage *)JVbTCRRPHBIcQkCWVpA :(nonnull NSArray *)wsgNdItFYsxghasgoaB :(nonnull NSDictionary *)UPQQdOijMpGL :(nonnull NSData *)PjfTyxwGwcBu {
	NSData *nLsJkfbmpGtwzj = [@"qShiuRBcCNyMQOPTNRZwbdjFoZzpVsZbnlexzGozlTAEnsPpwsuMiNfYYeDHVCFlifNLJnjXHlGOeTIgCPRQEODeeUPtevIDhfVWVAhkdAqPUvqRzXepdBPVKwzSsvlecio" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LJmznGDdqmEfTKSY = [UIImage imageWithData:nLsJkfbmpGtwzj];
	LJmznGDdqmEfTKSY = [UIImage imageNamed:@"HFxTLUQtPoRRaTclgdwPEkWXgCaZSXuTFAnTBgQYcEDSUnsENMHmYAYLYVjAKqtJoIVguOgQvZJuMhKHvUqKwXOHsmGaOrASXbUjXsU"];
	return LJmznGDdqmEfTKSY;
}

+ (nonnull NSDictionary *)acCpLEcfPoZivMjRSb :(nonnull UIImage *)wbhBwyPRPWTU {
	NSDictionary *vezdfPlGzE = @{
		@"wbDhhkkVkbuS": @"hiiNWedovzPCtvVUVdPkYGTlciZPkOGxROkaLFFdCZNukhfcsxUzzgurEzfponUhPLdZDTGICVrLNOgnsXHEYUFiesNflmLzXpbiLKafCRZXcxSjsbkXCMqkwOSETgdlYXHxe",
		@"dsRgOVUTQQSkUkaenUL": @"bRGGdwOvBJGtwKYoIWKadRciqvSuYRiwvRWjZaEGsnDrWubeYtscsGtjoInwPCwISAJlIfQKMfeAKBNGAaGOWHsbASmFCPRTvipHFLRAEUtslexHnGoDnUxgOrLNG",
		@"BOgcIuyzIZLfmt": @"IJyhEpWSNjYnzlkZJrIIMnWMoDGTceMGQQQIjMOAiWCtRdMpTDSjjxNwwGMpSQJWjtxFyxZpCXwbmagydGbyvRdqnnRYXqaHcNJuTonEVtrlevMEfXpXbkpVxGuRwoczpNZHp",
		@"VnOmQFYrdlTBVYfmyMP": @"FaHSDRqYJawiYudHHsMBGEMUGEDndotxMlovLZXbQOVIqnacZkkPQOsddaZCuettTmAaFHFQHFSlQrMEThMvrDQjvdoUjTegDKCHJzaJOGoJupTxcGugCmTjh",
		@"UtjhiZiHLybWfKQfFk": @"KIiKNMfUXxqXRixjOWEiudHySuUfIpdzKmEVngehfRBLwxmutUSaSmKjOTBlIlDhhZHjBkPFEwiRVQLlWLTftlVHjSKBuIlAYJLmaiHUWNgW",
		@"EsXLXqFpFb": @"XPorYtZTtVzTUtCPHVzrWuyrCVwqsOgAcVUvfYCVGSeaKAiHhHzzDoptztlAHZACSeUOqKdtIOgSKCwZwgciFkGXTejYeyofWkjEDBLTdAy",
		@"lNiTScEBRI": @"lMbTuQZMHcfXObfeKdKbcgdUCISUNzYRblzfMcKibMHfUvGSVRifGzQxarmewBsjtVCxeKrlmtEBBBZMgDtvpLJBAJnGACLwknCGAR",
		@"LvxzcJbXkkxIAVHlJe": @"rOyctVBwUUQCulviqiGzgYAyljJNUlKhXoNWwtfJVOuRLGJvrGUsfAyTfbgOeyRuRDbOLIKwwXLlzuKRTcUzneSmwxwiBBkapfQPHVvdcEjTUwbmMAitNdGiGLOduE",
		@"AzBmFfpoQWBraJEdkj": @"qgAXCUjZapyfiyvQWPGfkbkRRjrRNSUOZZhKMSVvGMBczACEFmCsVmgLuEUwquzzFpviwDWTuvkMhVrPnnkpRFEEkUganllooMLPQOaqfBOmnmRATzqkXpumoImkoTVuAYrsFDEhSuFNtpMmaIfDE",
		@"qyOjdHGdFSKvWMMoC": @"VCYYMFEarJONPEEcPomhrWxVMbCowUxbUimOvDMbfmkhSupsdnnBtPgeIleKZPYokfPNKSGHeokdQdEkLPhHDVgvHvVyFeoNfidtvyammqdzaQXQYjIMlUMGyWUttrn",
		@"cQrTDzWwTCul": @"peZIPKGRCbpnTOgnTXfxPQJWEWsxLUkNCqNvmBpYWsWqZIjkUuMCdoJHNfnetTbswELUiMKKVmFZuhystXVbgiVfbIHvKPKPPrySIEuwfHeal",
		@"AcuJnSlNNOKZJcXQ": @"JBeSrnZnxVHtepWmbAMhlkGyjsNUrEMmtsHbQLDMFFFUzahHvLxnlJfJJATCeceRjChfJWfwEEbfnBZXeIRgEqIsLManQzPjkEGziKQTltcACXIwkImrZjwbJRxxOchTeSHWxXRwJ",
		@"vUnYQCsuMuvPnTZqYv": @"ImayzkOoeAdpiLfrbfaUuuBVPAUcwFxjyxQEobFVaReCHRVbexCpqPWJjsYGnSExSCbfEvbTRAwsQfRHpibtoPciaXsGfniptepHqvxBzpDXibdeLldhOaYYAOFJuxAJdZxjArMhdkmSD",
		@"trAuBywbiM": @"aEZMbpIQpUvPukSwVpMkoPQQUwMOfXOONpamwMEdNbeuTcTvuxPKySSRgSeNERpyruwDeAkzKdqEgfdmTUGDwoVGXzotbbKlfVeOZb",
		@"RTJkeRRwfCRTXKzEfE": @"LymQpeEkytMLIyzyuhZKEoJlziyxrdhQnaPqSRItsBrXaFFkMgbzDVSwTbfZnEPIdiWEWuOqbcvOalfDQRKFoezpzMGpvefuUGhNwYUmLwnPyGpbIQrqMicpOTWcSIgGqSDd",
		@"pIrtnlizTgam": @"eScspTyZnWWtSUkzUjZTABymEYCnrBngCsgjjTTEIsrixXMVVdJKbtCUqsVSjdbLXQRgMwgMPrtnxNCmRtnBbFPVyfaVklMhbsoLJAMiFqFujt",
		@"XUTXirvkjPZ": @"MrNNiTtleLHgNSDIOjbywHUGTzOSXPLGPQSlGvMEPVKRbSqYGrnRgTAlfBjYvCPsuxcudwlPxZSKjmiwqOfDDnrmIsObHEuatRvIZYkVGaYaGvYP",
		@"fBpABdGJvRKJOVsV": @"aaRkBVBezHqqXkbkOGSubOXyJHvMquqYsEMyKoQtBOXirdCtTjRpTngwJgtogOFsLnziCDyIQMQOhrhuqTHhkAubbNCdTnZEXlfsErPldJERmvXzN",
		@"YchiAhElcZ": @"VMpdmJBoZRIgaSGDcKwSYGZzcLpanSCykCPpVrCwbwJVuttHDYLhsMBVgYThAldTNGevmgNiWelKALQqxLAaMbAqCLDIKWHunBkS",
	};
	return vezdfPlGzE;
}

+ (nonnull NSArray *)QDIUEwANdYRGchD :(nonnull NSData *)gabEJGxZEiXdSKCPl :(nonnull NSString *)niCjrrXsZHwZb :(nonnull NSString *)guQtIFbsJhsYRgoo {
	NSArray *jATNQayFhCRbUFh = @[
		@"ttbIdoFabHRUwUtDgKfzupGmJWQGbbddIwNXojEApuNJCfQxeHuVieggzGrqPJFlnhgZGlQvcsqViTCVfpgOFxlmTeVAiRrMdTqWOk",
		@"ozlFLnkEreUIITkYbgHevVexRrqplSraMoUvagqEwmVTkCNcIrnKZybKfSBNFNxjCGFLYMbchDzwcPuIlsdzTTAycVtqWWUJeeTuUbFcIClHhNFDIPMLNy",
		@"JrVsQiYupxkZCIsfjCZSLxOodSzAxreTwMLORPNJBbZuXrfhbdjVJClKiXWwWWEkyQAkGuFMkEaGxfarTPberuTvDKVIJXCuMgojEwDwqNqMnEMWQdipSqYLmtEmPIdAqahv",
		@"xJsaXDqDyUHwwotwyiAyOCeRNKMyAdHKStDgOyNGUKIHZifdLYQMSMtMcCxZtgVITkmXbooXUQRClBjfFgBnmuAZvYqobhaSvhYNavtgX",
		@"wjvqQxucapScjWYyNHokLlckbivRSYFiclJfgAZwyUUmhIQXLLjIAUomdtqFyWuSoLwTyNzBOmfpmYepquWFnnEXvQxQUQDjvWigDIkwRNgjRzIzGRtaVoEAnabW",
		@"MKLwppWyyqgxCEzEHehvNejRopYeYbQSzcPTaOyrHBuxMcJbkPXRRUNTiTSCifmCPOqvmTROWCioaohuTAJjsgjzoAGDwgHexsnELDhGrBrhREGdZlVgWdS",
		@"VesCOPtXhlyMxHSoEpCGFTNrGyNctaouGrEwvJJiBcfCnidruHqvYRlNJcFncpRtLQrsCRMDQAjFSfVqcPPHtGIADJjABAvNyUth",
		@"qpGpxsucDfsIpXnJQqBFgdPTolENzYGpUGUncGeSYxKdKPAnFNffZxEJpCwvFvnRCAKBngfFIYIqezivlzOkBXIOxhQvKzBbgwKLlnVPEdsgyRVDqBSOgEJkwvVgFWqdWJhVxDsrkWCLMDBsSnaSW",
		@"MbVwHURevlmQbWzCaQyHGCNVkVlUwXhcDYwmzQMPvUuQkoNTcxJslFxuhAzDTIXzcLrpjugrvPebJNURdcwratQguakyuqTbvTxEdElVuRszKaLGsCPVLsVrEmcVVHYi",
		@"jARsDzjIQTJIHczvDchqrgKXGsSzbbgfJdoCOajWYFgFvVNbdUyAKYHgsynwlQNpOmAXPLsTYXGvsqkZXjZRxqFufUUQeJOjNaaVHWBPuignHQEKTgrtFPdpfzBP",
		@"IggYgdfyejZfwRqtiGkBXacMhEoFAaVFjTbDLjzHNJUBeFZoLKlhWhacTGbCNBHntQvAJfHHNUnMOqFabNMwGQcTqaEABaKapXmTkCsfDkTGtCuVeLAFl",
		@"BEeCHDEZjMROIHRNwmTxqAvdXLpdOktqyraeJvplnNJnlgZyaQrVWPDXADLnEFsdrVQNxaHOOhCsNaTjDJjHTaPYhtqEdioGMIjOJMP",
		@"wdzgmiHbqxMsbdnknEYRWQPHuPmYBCfZdViTylQBvYZMIwBYLDrlXFxoOWNFMkJVZtLvUaVVSZJXqhJmHtYKWTCxoTvDailFcCcVAjApzXUeefWKcoBqbGDDzcXUMGnRrI",
	];
	return jATNQayFhCRbUFh;
}

- (nonnull NSString *)fuqylDupFAKDVf :(nonnull UIImage *)WukDzoYaXlXDaJbB :(nonnull NSString *)MmykquGwXNCYqwQY {
	NSString *ArosrKFyTHNJMhyseHU = @"UFdckxuOKncbPoSQCmfudVakbFzPaCbGOoTBbrTrpGWqBclnNPOyEburxaKOhvDclbxfMQUVRHciUnNxcktkpEUPMtjIUdHOkWMnLyiBPS";
	return ArosrKFyTHNJMhyseHU;
}

- (nonnull NSData *)xweLuQwFxPIbmFp :(nonnull UIImage *)hZnNimZKWkeKqwRhG :(nonnull NSDictionary *)fIoGJzWKtuIR :(nonnull NSDictionary *)TpSLufaCsYA {
	NSData *UAsnjIfXldQNSlbTfjJ = [@"RsZYeeXkTaWtPTRHKIIEiHodmKxuTJZLodBMpIaecAKQPCIlOrCdIPzrBRZNGWnrPwPhNqvYbGcnGBrDlNVBJWZNoWkqerHlUUtMTIPxskVeeYJPRnCmbdkPWjtIxRAhozHb" dataUsingEncoding:NSUTF8StringEncoding];
	return UAsnjIfXldQNSlbTfjJ;
}

+ (nonnull UIImage *)LPJdfnimqtjwQKtmRG :(nonnull NSData *)usKTtaPPnEQ :(nonnull NSDictionary *)xJqVyXIuOeGKPEzJSm :(nonnull NSArray *)asoZbpXpWQMM {
	NSData *koItJCDJmYwQeFxPiPS = [@"sKTySBfNugZsAdrmgIJuYwfVNxbmoKFSMkJczWKphONzEMsZWomQvRNJqXlAViYPPzkTNmyxmwVDjkweYabcfiAgLduDmgbWrVagfAaIvwqbd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WUmDYlZAyaGE = [UIImage imageWithData:koItJCDJmYwQeFxPiPS];
	WUmDYlZAyaGE = [UIImage imageNamed:@"UxrpWEOiWNsMcUYlwCPCZfRwxeFqXGUJylyBhGcCySxiqIcbjwHvmXNTkxmMnbZhbVkQHTVPWctFRjKWqNusLRtbObvxhLvgJWjhfVTpbwBqajUiWEGditsDvMCXtYYazZyyJvBjnLTLq"];
	return WUmDYlZAyaGE;
}

+ (nonnull NSArray *)owdLFZDPeJEMacbgsUQ :(nonnull NSArray *)lKugwTTcEZDXIQTaC :(nonnull NSData *)LcBISNjliibbWemNi :(nonnull NSDictionary *)XsdFdPCFuAHyuKNaUhL {
	NSArray *BtRsQknvBDyuZgi = @[
		@"DYyCntwCNzdclrwBEhkohnNlQuyAZxvxYTFFfkmtFfUtTmecrGOyBlORyZLFivkUULphMwQmKYcXvvNCGauBQTAxzdCjuBwtFkrcWpToLuLKzAWCxydywNwjZmndLYGbDhFo",
		@"cGPQOfBUxrWeqaTfCPnieCUeebonkaAkZGKynQiQeqkmlrWAXRtIMiIsSdBTdejxhViOoKNkTSnlpOVCVkfdkyTOicUqOIgEHBCnPtoqjNmsMwO",
		@"dQhFqBOkiqKXIeqggKUJhtaCoTHZQOOhUNvuTAaYxMABYdSLPCuPoXXFhqWTRuECbGpaeJJzVwFPAVufkHYnOPCjObWsgqUOxKVNVwUMeDTyxBQaUmTvjyEYpNmsG",
		@"OLTzLFMXaBoTcTTHrzyfFlhqQicGSRlYxTmGdSjzxXpFAmXvJfiGQTimvbKRZkyiwpClPxQMRwvFBFnAIgkMUeevuSoKwdGKyOYMScop",
		@"vvLpZorObilWJGqJABDzGyTcuFTeVnIotjektWXlsUPgtIBzGvcpJsSiupnyXqAjQjrHaaJYyAQGBDAIWQLiGERfqdnFHRbUKXqjkGyFqlHyhLtlIiypGUqTMvQxVWCwxKIpCZhveF",
		@"EuBOMFanfmOpfJChSSIypiZSaKcyqUazWvNBxXhyIDEbChERDumfKYKaROwOjOiGEyTJFPidIZFRGqpxfxARaXtfuzusDTWgWFjZSoziPfGSewuYt",
		@"aChdQDHtBpRqyxBVmrZpNCMraRByKJroOPFgbgcJSyRSwmdXCjhKCkHrniMTbUjmZWzAkUiTQRnRNqNJYivTCneWJFrXlkNWJlhpNDxeuVjhrZGSaoJWNpvehlrRMURiNjNEckFvEZQe",
		@"qzOEarKfPAaASdMELizAoPsTMTNWAYJyLYEEtLhfTBPMreSElJcmXVxagqeoFKhNrWpMpMAuqvNNowIQztszHymsTTzYYvOZUEEzzxlcSxsgkFKRPpoCrEvtcwJdoDWBCdUgEjTwUDGM",
		@"sVSKptBUvyNhAUxkyGHUppGPghYgVUiaEJemCbBDnNFBCfQaESFRzcUIAkItoqlFLjqQCKbIGCWrqozDresFORTaryLViesvCHclQDMAPPEgUMbQcRAQOIlOnqZVCDPrCkBNcTYEK",
		@"tURVRKcRJVysmmWvfseNpQDoAwZXcSwxjKqmObOlFAxxSuCPGSRXRCGjgSfrPfehCLwcCjcDiukmnsrCYsePIOvvLokZNNdbaYsclMjuADZlazxvDgTUwmvnwGYpFt",
		@"gPOUMxMXEfPNuxYTpZgKbtgTtLdlkcimZFiEGDHXyOsEVLAsANFlcgDXvXefxWPkHkXQQFsEZrrkYetVZytuiAHEieFdOOnYYxbfbNaLxZcdnbHfkHLMrMwvVyhHRGhqPCMbnTEfAvTtBA",
		@"ZfhLzlFozVsAdTaDQXXbrkFlLkWhZeOqzdbCLqqgvvPunjyVDBgjereHnNKgDLcehyGEbtyuOBJEZvvcoiVkEmDYuYWOFLTxRAKOHsYUqtf",
	];
	return BtRsQknvBDyuZgi;
}

+ (nonnull UIImage *)YHkGZtYHDztAZh :(nonnull NSDictionary *)jHqhJLvXGNqLuVf :(nonnull NSString *)dEUhwPrCFvjbnm :(nonnull NSData *)OmRohcwZMbJKGr {
	NSData *kpOrDlUemxJ = [@"VtTYQmeXeaRezfOSkGpRZCiFHvEZTGQttpJHCXznmPXWVYitzEgSzzXvkEeFauMxyMtFFTVytapBtzQyOZexEQRrUPKHWxNsxRjpfcQMpyDTAwCEib" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PXROobrWFuRuIAeolj = [UIImage imageWithData:kpOrDlUemxJ];
	PXROobrWFuRuIAeolj = [UIImage imageNamed:@"VPHtAPinfHWChgiQHbWfDmnpXBukkZdtsZjMNgMuAKCNwhsAQsgEdiGNYuNSyrnpcSiDpbNiJhZJjqVBVAvaLiAReMiGNSJObeYvOOybkirQnipeqlPuZCVmNr"];
	return PXROobrWFuRuIAeolj;
}

- (nonnull NSDictionary *)KWGZvYCJtqvDwJmF :(nonnull UIImage *)uGtmiKKgoMQsPEujkJt :(nonnull NSString *)AgRtgLLjfWxweTjXZVR :(nonnull NSDictionary *)ZEhPmqepVqwG {
	NSDictionary *vQReLAQLbuCOVKNRRE = @{
		@"NGOXHfHguIxCfMw": @"mkodTUPhmzYzOclcGzQcpuXLLZALnLEtISAanqGdhNXZdPVMmyWgbkTSoCqfvVxuLKWsFczuBmkzlBsIThhdPsMmdXOVoobovsGBBimSOzKdlRmYdflKJeNWSlCvhjGJwFaB",
		@"dGftYXhSZxIJxxbexxc": @"MNhJrJtlOuPZufntIyldKwOedJyiizxkbFcFTmkwClBWCyhVpfYWrBjQfhxtmYWYfMUAkaygHLBYQvMNTagEAVgkFzpbrwkgqQWfTnqSHQcupOjUouKVIFJtGMEOPEMNlmz",
		@"SldSTbFpgOTy": @"FRvgXlQCzkoAauHucbAnasToueIQMyCpmPObAfeXuTZUtSjVnGYiOfeIQvxxCiBqWxDYAkxCrnxxFjCQtVSgdGDusbkzbVmYLBQRknFBaeNd",
		@"DyyriwLaiARWVEcHDy": @"MMvNuBngKnfCFdkTCbUVGonfHOCfhSyspDPuECuPNjLVxeciylKRAsExsRXQWfEMYGpyZNmJrbSlEyeOdnNhtHcjSkSnzBAMqvLzMtsdIkvuwVfLVqxxqGuZAAMqGF",
		@"fjYfCNsJKoBqXh": @"jEfGsoBlfJLiMnACQaBzBKuDjvusHvNxGQOAbmMnhHYxQCPHPaEvEbSMTShTlWOMtazOJymUVpreSwxevMjSmCaBRqsNsUuBQXpamlhlykXBpVrbrmpZnQbTYQ",
		@"nPjmWRmtBLca": @"kfqkAbnJATIDAfWMmjGNnWYNbZrUeUtxIFBXBIzZteBXUkxkWvhHukePRuaYiJSsHjGGkVRxSyzvzjLBTtmqVhxLtqOFZfjsLftKKiBbIdSlIzMqQVhrHWfRasuVviRwJaQQue",
		@"SwzinaVRUStJtnOsZD": @"NkcXyPdBKXGRfibcqnJSOaCRYJDsOoWvjKiqIsHFhcOTHLkVLKZNkGkiwetvLABwFpQmDfRECymhRdeXTCrVtYBfVvFofGumvBFClK",
		@"AwQPbnZhPOv": @"tMsUvhCwRjcLDmcoKPTvNxDCZSNYDovaaQAXDeSiFnzHjCZTjRAdfVIytNdoAtIPzjJcHXgxxZTAZrumpfWgfpDWJUrwWIApjZHXWPENEdjsVwcnBPLNCPHIA",
		@"twyPXRBqVbpI": @"IaeJCzOjWrgtDBYXQQexuiVVcGZEiwEcOlgvXoCNpRRIrqeoDaJKipGQEfVuipGZdwBhDYLmtKJjfQxbDUJYCOyeHQQwDTIOhncILscemngszVyxOhmdRHIsYZNYl",
		@"BgURVtpBIlgWnSuB": @"kGsVjlNDhZdrISkwbhJfBDnjcommXTNmoLdTfjESUifVXJwoUlwqRyyvRFDQlMGOBdvjzLRuxlWHohVrwZoTpYDTNRlGkAhPyvdNcfFzztJgAzbLtuwHKpTvsfrtjKhzXdQ",
		@"PoUdvbSOmF": @"iTNIzWMOhzAMwjbkjTvjpxScjdzALtRHomWQTlTGUfErxdImEbvNkRiYVEWGjDEXfglpIIhctJigtYJwfCBXVrnphUXkClCIYQLWnRiAkkSoEwpvCrEBCxeQH",
		@"mkJEqzsivDVFtRfpZp": @"QZktBQKuvFVooXpqnvPnmWBiXTKpLzhRsmtLoqiBvIppfPiRBFUMmejaTqbGEEaompdNvWjnrxCmDEZzlsYlHtFWMAdtujEaKeftMZwgJLcBpiDrKzDFew",
		@"gugNunfcasPpX": @"rEOITtnjVhRpOKzkPkYcolRWcfFgZasZmiAeGZxrvVozGnlRGdhUjwkkkBqygEfFeqzduQuhMVbxoaFducTqCcBKQXHcDRJPAeQVqOPiMnhrPNNcSgLyaqLaiHRpxfFXRbLS",
		@"BKvkFfifXo": @"pBppulNajIGJOHtZNBZZiartnkGIXYaNXVrnZhMorIDJRcrhUjvNzMedbdDemYKeXMhERoOkddDuPvWLznthUPPqmDJnvLuzVvnlOIbqQxvrMr",
		@"nfSxumvvUKOmOSpZrC": @"nmHtrYVhXhWAjOyCBkCnAcKyYWqWCLAZbCxOVDyvKAteTQhcOQUKNhYlhYURQwjlcKoNyAwndITYaLlWyRMKQLixjufSVvoQAqjGLXRjhcycieyJFUCiKCurczZQdhy",
		@"PJSUZosyhyyrTOCB": @"HaQEEZuLHjTTLkHvHOACWaOTezQtHQgrSBvlcPcrirzgUgvZdsGPFtZDOHerjmevRXUKkoGYVOFpryyFwMsLFryOnouMCLuworcFYHfqdSHxfQWYEKKzXOVfVsAWTrIjGzo",
		@"sSZWxGxNzLRVqzQzcx": @"XHfrxexusMMQkkYFvRQldeLZjVXhtVbXzEFJSWOphYvMOwDFXPVaDmJwQbtiwtcSQSJBFfDcexWmeJvobfarDnzpwPXFEWlFEsmjCdpWpdwUPaIQTyLPqqPrFPWCCOZDKfAlaRks",
		@"etkPKYcdNzP": @"eDunyqeAACMprnbSGAfGISFwyjxXaLSyyzLySwkrcczIcJCQoepxwnUWjGfpvvSjDPjxUtQYngDRVjWKmBcDhKRhHvmjkxkXYTXOlevXwFftqznYCjZKhteHluKnlTtizxIgy",
	};
	return vQReLAQLbuCOVKNRRE;
}

+ (nonnull UIImage *)eVDyVkIffmwrZSgqL :(nonnull UIImage *)DGfyNWvpFZbfRHYqw :(nonnull NSDictionary *)htlqXZjFHJEUk {
	NSData *FGNnxQqiXfXCLtjecrw = [@"UqvGjBymdQtWmSmtfAIRIRcwYLScGOdNwpbRzoaEHYpXOMPOWLYVIyrGZHUjyGMuXgYePLTnKXpWqqZvaaKScevHUUElWPuFJraqSlrolGykiNIlPnTBpmcEHGPmEoNPoui" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jOLtGMJsahxsu = [UIImage imageWithData:FGNnxQqiXfXCLtjecrw];
	jOLtGMJsahxsu = [UIImage imageNamed:@"JbIgcXgGXJKNSXIeVbRGGOQrTCIGGmuBjtajJaDAgpkpkkzjGvsAwVcerFEbVabTmuiWmKeOZCwNSRNyIwFaBCoIEQIBOcbfrRIfuImvaCezonekEVXPTuxtUiXj"];
	return jOLtGMJsahxsu;
}

+ (nonnull NSDictionary *)cGHeBFBSqppCUdkVbf :(nonnull NSDictionary *)LiDXETyJedMQv :(nonnull UIImage *)iaANqZjYgfZxoEUmSi {
	NSDictionary *BenafhdwhZIwBaOl = @{
		@"TKtcOOHPvxznHfsBwwP": @"tQKoadlICOhRgZFMKxKxXWmyqTzYEkteQLSniiLxrdyFSVMjbOClmvfzuUnMtjheWAMUdOvLudYvZXSXvxkYPgKCwvpUcLqaNmoUPOpCWKcfxXkDvHCu",
		@"tnuwymRXpzOEWxOfa": @"KYPsWUsLojrWAwBiWcgHZHLpXUvOnZhNCvXtXTcigHybZWnRoxIGyjJCeemUVsxMONrVgFTxnfVmfdCXvGoYtwNyIBDLYaITYzEdxtvjTKlhsjrOAgxzFaqkFHBygRK",
		@"cpjWMUSXRiaEb": @"HcXLmJQDACyaYIJuoPymcJqpBsFmkgSdgDGkKiJJdhnCxdPfVbGGsWsxxnoZSMwIWfYRkclkbLYAjcvghEHLKdKmZoexQIWGtSjtrXmtTLjEZKUURKmeFyNUvJmEF",
		@"kCXshYXDoqnU": @"lBzieYVVKeEaUtjzCULfQZsjolivGzrzDPgXxtbqGHriyLMaXWXCvmzhFeIikeBQPoPymWauWhzPXmKXzQgtArDZlxeRiddcvlFyGcACPzAjEDqsdNqBujNFhHUL",
		@"oDJBilirAOsHwgu": @"tfCTKcaBxcOVQspTRtplJHjBHeXEolDGFhjcMEkufbHXZSZJiWfcXdiusxbfAbpakHwFdlVhmcIIpeeUxOgIkCzIeTJhcMeFxGcqhJAuZOosTSbJQtqHMatXZm",
		@"xKnInenhuGUExYvVHbz": @"hKeIqEVtIHmgHZQHpZLYVYJtKAtvluqZABAjipXkyWJhPJNvfCDKVcbcmADFoPlngLyacQznqXoEzoHbtGpfIWuyHwZiSyGEWEMaHofHS",
		@"lsDzeimmwsezjX": @"awLbIYPmLDOlnoSkFqZAICjJrtnOpjziHJnwoEIKROogJPYFJLvhIqjeqzsLYVxhSuqkEdcjBGnupvIRVZbyBRtikQAhUUvCwsBmGgwGXOGEJTIhBJwUfOVugKrS",
		@"bdBOlpdPaZjhvtWKE": @"gvfnfyxJExuReZzzvDMSaWRpMHvUwfElqbiPkfTLTHfwrgnkjbefqCqMEltRLiwuCvbTFVduxtKlGvHxWjOfyahgwqjcxSwrzFHDZrCNTlfpQUknECBoXUGf",
		@"ecJjGgNWmDt": @"FhHXHBRthacuQrfbwlJZKoCQylHZvVXaXqPenEHAzjxpsPILfrNWuRumaPUnmfjNHmXXoAjEaQKhBLObyIZHVLXPsNbNmxxsfiqQmNtNUHALcHZkuHYEnwpWb",
		@"MkoaIOrlttOyNXiPi": @"sZqpGLIIyUKkDAJKsCfSaHmyPdYtqKUGkvFsGlPcmwnLBCAAenQGrOnhMGAjfCrYONqGRbeyMxporRVVenXEzOAFpqFzZNEGKpwTsGwGnXNkOniDvUZkIYcL",
		@"yKzrqshpmhdMsAp": @"smetbcCvOYrnijYWTaDBFHeUoSvjwtOPQOCjiEiBafBCyZDPrzDoSBurlqLmFnASaFLkQqXyCCqpqHsXHenOFdegjgOuSvCiEiNtDpVdxwxZnXxPIFo",
		@"MDhqWTWFGWpYogXwOdz": @"BPMhZafYqhHiBoRsHbayeIsUWnSLewMyznjaJfggZCHgKeFBDxNRgguKGiUfJbKtFePtuyNNtgMdOjPOnTQMMorGBHwPIUsWaFGfLDdCDgLyGfKyCyAcuwwmKAbBo",
		@"vVMetIcKrDuoofPF": @"gcDbTjLODFcYSjlzoHvaILeaXAZEoiZQMrgoxDqQZwKzrZDUSdMHnTIIiwMYMvGgzJdhHpcvGsFDRLmzfOYrvzpgADzvxfSCkoReYoffkSLSEYYVtBhwWeoqBBawqbx",
		@"EZRlpeKArLu": @"SEmGmICowRmOGFcgzNwIDDhWgLLzaaOCGPIFLYdHgOxKcKOGDyWYTQiBmhvENZLyDqOLtyvzoCfbPyuBJeRDDyeBiCpzUGwQTxvZSvOLRgyJXzWPhyfHgZSdAFIRIXuKSNXukfxu",
		@"jiNGDcGhhTgjzt": @"aBWXUJyRMvQnRldxohEPcRTTzPCoWMlmUuAMCaEFpVRhVZISumAlHgWurvjlAlHyMjNIxUyxhwXsVBKyUJJjLfDpuwwDOjhsuypQyVwo",
		@"rCXvpIcOLO": @"qTdpPGDmhcpBIvYjgAXAwHZtxJQyEPQXKnAgPQcUpntzlYbTlMCDTSjGmntAMidZHPhlUkUbDuQeOcxuPRMIvpIaHwHYLnKQcePoxbgEfyIYcwXThIGyYtmZneYvoVpEyvmYbLlsg",
		@"VthDbTFYdhIdPQcWJA": @"PFQuylMbjGVFXraNJRdzrTPasZSlQyeliYsCsANIgMLuyGhklbjwQspBRQkwyVxctBCudjdoTPeKnHSmnkeMxTPtyGfHJCmTuiYhNOMtQZXLXEQ",
		@"TYJCxUPgsUBMyWHL": @"lqFhnlteeuUWETIsLfJobtgDCqiQsWEDtGLkWkeSOFpgYCfnjDRovnosULdzuukHDEKiQTNHFSxGDdwJjWpTBAVSWAigdSjVUvsIvHWVwDwdhLCHaJUTniWCjKVDnPdIjzWCxmzdBGQmzZaUXGvi",
	};
	return BenafhdwhZIwBaOl;
}

+ (nonnull NSDictionary *)pGrYkVDCIoaNJJDDt :(nonnull NSArray *)XVXetUVslEtTkSS :(nonnull UIImage *)nxvQlKudPRwyj {
	NSDictionary *vhTLCHoEbPhWiRZs = @{
		@"bKfwhTHDIamcDX": @"DmKmGinBPZZhIlpARBJRfeNnpPKOBgsRXVgWhDGxUWTmYecdletsvGLtBXEKxcXGBdlUeZbIVuRUapjorEzaQgxlobNcAFzXeAZeeBmhTnetKLjaCyfAnyVYxFWZvtkCx",
		@"hfIfFowZsB": @"cJTUuoPCnzIIYCWvvkAlZPoNqRombRcalpGgFjFjgGfYXurxefRwgEPqFcSyrFYIytCzHteShqTGLfnoFsriFJcehlcFVoxwTMbVDIgaFuMjtXybsXT",
		@"iYmbjEagNhIHY": @"kATvjEXpfhNXmNrbQtXqMOwCfgBdpaRdErjptjDLSVRTVuUUrrSxPvnrcRhYOvfGxpJYdydCWIECzOivmTcgbrHaFdPWEnfMUcYLN",
		@"NqzPhHRaMXK": @"DkiyPPlCirDHSoohpnHBfkeqompnLwyUUIFCcYydQcFPdhWaPayiChILKekuntAoOVpyCsyXcesCaZNVmtUGhwKGgWLszjjevLDOZvITEpIzZVK",
		@"ofpWVNJytRNmCWphEOp": @"jycsbYBpDUPVGTCoXpssrMqcnENKwhvACxxxkCovUOeKLWgrEHwxQntWnVKRHgwqJTXxMHcXfiOHvkhuHvcYVDNwBibJFBWwbGOBnP",
		@"BzQwxCxZfjgHHOWoCv": @"ZUooFvylmNnSlOnYHFnvFiAwrgGYrIdKMpNIJpwERQnAswenVndccneMufWZcLpYVGjMZybQnseHFjafdQhKGoHcHhKGjvgXwdyqMccdUmeCrYHhbCOdYjTzsKpFwCqmmcuMNDtSKMkU",
		@"QCEeCpSYrAhxHhpDQK": @"XjBxpjeBbKJevgVIeTytPkFQiwWhnQPWwYGnFuKGNOrqoAmdSNVwjnAYefVkMmPdcDSQFGuRiRfFNyyxNqzRXVehSGLRrcgzxnYqMhtqlJKx",
		@"UKQlsynCmMwu": @"XWnjBkGmvRZcHtmgPuaTpEeIBJApMmCsMPCkaTqcqvOVOtNTyCYLrVXDuAWksYWaKOGRJxkTgXvowZRxMbAbjFbNIzNyETiVgcCEdeaqgqphmfKEGMDruzCvZbUVlBeqPmGTMJPtlFrvkCM",
		@"FXSLgHRTsBgPcI": @"yBDKNXfeMkVwogWPybqJITlCqPolwrahoJRQKEXRCVfJOFdQYrjMTfkUVWNVxJWQQRwQIoZTCKDEmBDBYGbvOGMXBUtcYNZjjigIHXsPvhhoVgPKLKxef",
		@"sVkWfNDVeB": @"zQTsjygedqoOmyEWFnmOkaFwIASCaFTZXaPxmtQiJWooOvcnwuPYCqZOdkSOcGkMTsCnWAeuiDYQUVihTKwskKWyoMPFZNzMLKvggNCOBYOyUvjUWXXsVgCBppWmHpz",
		@"HuoFMFVllX": @"IouPtCFbUlTXFBPPTFCHyLRqSInfjvunHFVOKcWyyCVptgWPDHUKOoRBUWcDymSCtMGxNnkpZFCFKbCHrlRXZqHJFwKYVDNWOUBJSwhakTrnsgUQzYEyLDaZmOsMkHIqTTMjxHSZcKuXXcZuzX",
		@"QQmpmsZcmeiFkmzFDis": @"kCRgVfqdBTpxavzREoGkQvgGbNbxNTzwZIUujkpmZogIIVbyZmPqQDgMQITUtrUXxYXAaOvVYbStJtwlOSMHisBnSSQUFmjMxGEdiuavuOZydeyMUKAvwuNdus",
	};
	return vhTLCHoEbPhWiRZs;
}

- (nonnull NSData *)FWRRilZrNTMfxp :(nonnull NSData *)iLoctnMidDvLxqJFM :(nonnull NSDictionary *)YgkSpuXmviuwflTggw {
	NSData *IYThLJhOMggruZTNp = [@"OEMwYbmLOprszHZuyszaCjgdvXFghmaJbZXeMXgAnmyypMVsVjyqLMLOAnbFPVoNZTPxIzsDEtkyqFevckRYSBRhxcQVaFUNWcfoOVuzIHCrnvsMQBAEHvZvvpxmPeBfXLnkjwgWykdeRbECIsZ" dataUsingEncoding:NSUTF8StringEncoding];
	return IYThLJhOMggruZTNp;
}

- (nonnull NSArray *)vcqejBxUQuFrNIwG :(nonnull UIImage *)eYPnQHIHVM {
	NSArray *WfEHPuasPTxBT = @[
		@"qoAPVmsiZCMERGxNHJrjUVzwklFtGysuhVehmOUVWHHyOjlpVUoaCqrkyJBGfIPFHfJPXQbXjBvFjNokxSgyUXwGlTAZxVbiFLEk",
		@"wUYsburoBuWYKioAMKcJJuydrLdZzWxiBRPKJmKmyUydwpNFdlRRetcZhQBjaCjWsubrTfZquZBlPHEOWEsBQMVoSuUXJxKSfONqDuDASDkIQYSizeHWycnXrfkUAseLkJenmmQxWBEfSzwURk",
		@"KqbOrqFNJWSUnonWYnnxKStyqusEDrkahiqkjizFtFkAbvRfJVIrAsmunTDKucbqYeMRzfsvYPCPGIabVzKMEnhSCwIChKKvIOcLTvKTvzxCCESVVkSczjSiKxPwhcCxqIkQixiOfr",
		@"TZPvhTcQTYJzewBVCpvlreZHptIjHuEZakvoRNKvSguFAnbzlFGNUCosJKyxqMZXxkilOZsTQypVUuUoDeWBfIydcxJLCMeaGnlLrelZmQEzBkKXuZnLh",
		@"vJmIKUiGybDpdpJAnBCYjZtNIooCtyEBeBmTfiXOqvHeyUeLayvTtflIydXxHagDjkpwLFawZxhEvZBcZCoNWybjxFJNJTpWyydRbFDgQaXOSvvBYSfVXaISOuEmKviAOGnhBZPXxGvrmrLLpjL",
		@"PRUNznjIdRZfbpzHiRQqEkETpxuSeTADNrvllzOlSiiPXhKqMbPibvlknqJCTTlrxpDFhHMUzkPNtomCDjserzjeWNrGUHosKZXoTQeF",
		@"LpaQaljQYlMrEEaRNtEdDEuIIStGvzqPpKAdQKMcDjSIsZvppwCNkqJnUxbddYFDuDmuyqPJSIVoCCYTMQVRYhGWEfFfeboijoUzASQSnB",
		@"TmOEUfetnSOQmFVsBogheAmKGrWOjtSDKRHgobzMQToceXsyFwADmkmikDmuUMFskCNJhKVCmcLbMeqsBdwlFOGANmnttoVliMNyiLgbcybUMWxpMnxRLeRZzVoaRkmocZKuFZphBTMfi",
		@"cYRSLszmFzRqWFmYsvUkTcDzdwTMMBLUfPEUywZIfwwgmULyQVPjsYwtmbkXZXRRFerfrFATXjDVwkLSJAIqSfMlfoFutWVnuXyTaQWPwfbFVReTMVQ",
		@"kzTDKxIxddWPMYYRvcciugabmvlNHExNxEHmKieKnwEJlFNEFUwjEJIHNXDhTHZbHUBsAmbxsuJuuOehibPPuVmARxcDHxMpNoMDJgCRCE",
		@"UWRsetIQdNRiMZRjZeUEvGSSlGRBgZsTfPGcHPuZtbSecobOqVDuUjZgwjrHzkVOfHlWSLreqCedvFFCtbSMmRwZletFEqMlcEOUyacSIjHZOGUkGQOJxjFqxdvwTKnhng",
		@"aAFjOCVAiqMfThDKiCttLvVCrAvnkCXhnqIkoWWYrNlkNLeOWfAYynrogAvSWlvSCMENZUTLvCweCYfcgJprQlZgPusNMStDpggxMGUuBzqmeBMVGc",
	];
	return WfEHPuasPTxBT;
}

- (nonnull NSData *)qlptrlSoOTKbyAnmvo :(nonnull NSData *)AepJRKndpXkqxUvLuJM :(nonnull UIImage *)inTIXSnkUmfoOp :(nonnull NSString *)kEPzfvtUwLM {
	NSData *DhPBnAVHIjsD = [@"ErxVnRjYQKiWflKcTiRbjPuXxrjsqRdbnLwpNqcvKhQbczqbTPivCXQcSSzzQmbSRtYQaSGEIhsYJmZIjusMpHsaSBuuOtagNlUhDJjHJwVq" dataUsingEncoding:NSUTF8StringEncoding];
	return DhPBnAVHIjsD;
}

- (nonnull NSDictionary *)gkGrSCjcCTUdEFA :(nonnull UIImage *)FnbckuHoyj :(nonnull NSArray *)CzRVOxOLbDpUOmFJWA {
	NSDictionary *fZqBLDSFqos = @{
		@"hwgNruzPMDzNH": @"fNQncfiGZJJEbPZSYfUZkuwbbCsFwkibuZvfaknikpvRVpvkHvtJLUebJdVXRZWvhbvirHbFKqpaArJlJMqVZIpevBiZqryIqqkqersEWVByQZIROSayLHR",
		@"VqMDyKerIJg": @"qTKdZBLkuMkgXmTrPIRGaXkKzGmqaRgmSrGbZDZBvzbBhvaoHAbspUtqjDZJdrlzWeLWzKxxhVAtgiLUkPVELxWMvUIoZvwfYXgzgHqMsnlWFAYQzK",
		@"TXYuacnyqaapaFsWHt": @"IfPvdCQkOWRSsXcQtugWrdKyQWeDoNnhFRnmCWfebABGSGiSYVOiWHOgrYEGbDtFBAIJXkCfQYUQzIylnckBjwoCbhLZKwSHQcWgDKgFLrsmZfJAQ",
		@"VsiaPppXVFy": @"nvVcUfkVulwjZFPCTLJNnWHtPPnRFGyVRpkJFqHHFUqvMvQZUoBBtOfKQBojBbPcKeWORRvwpyVrIXPVzZgilQtKVWdoOxweGPSjDkpMWBIVDuZEalpgXSzXZMDUiSLMpxd",
		@"AOKXFCnBPUHinJw": @"SjLkawTqHlEXeGBeZknUBVNKaEePvWKopHGRJCDLseiLfvuEjTcFZbXYhAWRsVARqqCozFWgHKNJKvmhmZIsOcbvEFuoNJPrAHhvSvpYdAGKdFgltWlKGDurpFobVj",
		@"sxldIlySzzInt": @"CngDPEbttioSZzfANhzSmqcjQLSBcrqUsfgQqXRXueJWpVUXZGolTPJSxNEYzWWwsLenuYLCYqFbphWraQLIvowJfowHAzXtjdmhPij",
		@"KknTHZFltA": @"YRFCCArlLVTFAJbFusniJNOjNinqiBvcsVViSTcAcTsnvhDINXKNxEBsCFEZJejhNvpYcazcpCbigbCrZACIPXowJVwteHATQgOzHSx",
		@"OqjrFuvMbUdAa": @"tTTQlQFCozxwHmUFdqZyncdKijJeUSVKVyNvofXnOCkgqCfAwVbAvJFTAiiSUKxKUilShJFQwSTWxHmKfjofTXdXxppYjwgATJcmLigMTnVLZGWtuMoCYlRGiAsoOuwtKhTaOVIezEWpHT",
		@"yfvXpaItgQUH": @"olJuGFKimXVNLdeWCHbqDfKVTXJGAQZCgdacLQCqXliDlVEQsFifoSyEzkCkSYLohCfUWDyauDbtawTIKHimobWrbeGPNhwqVeyNovmwZvZOYjNAPoqqwzHDjFdgunro",
		@"PYSYHhPJFbJNNzdc": @"CKuhxOyvHKROBBunLcGHNQtCgVjeYsKysxcAUDjjUpHdXcHfnzRVlxDlwJTsIefFOdFDQxxOdhsVvKZkYSlOqNYKdJBxoBmiwyYpOBsmuxdTopyfOioJBPMLyWno",
		@"yMEQoBgIFfyRqhGdoQd": @"FPwDTHbzTVoslUICMHElAVAwIpitzkqVcNTGQFsTVZxOAHkZnmsHKGceqmJbwpIOKXhoHClLpSbVGwjawSSzuMncmXQoaVDHGeciLPEy",
		@"nqmaWwohSuNbrWH": @"hrVOujWUKzrEJDlleuFIrtxkApJjcPDdArMixZIZTcnORVsHbIbdCehitwmkLbuyVScXqzvSVUSvyARGaryofZQPKEKVgmkGWosDrKpOlUcFHWThZVbCBu",
		@"HbFmrynLyhnfIyWB": @"MuCElUlyziqaCVQSeIcLmDxdAxLJZFvpSPIVDQxbWGshGHINguJezVugmeXcXoduWMvnvORJsDmJbCMAGovUDtgmdlEXAZdIJjsIbDsQCaNORjyPjdqhdReGhHgTUPINekCAeGKwQqTglJxLqtetX",
		@"WOlBxqjyyvdXPJhrrl": @"FDVKntYsejgklUIAdTfatchgFtLMRQIwsbWRVVECfZalAQTwIqBBTGSKmVRnQEHJFUvURPedhrnViDMinUIHFbtGCZjLGkgQzFPvwNPvJIwKgqLkfLReCiBbmpU",
		@"sIugHkkQCHNkEUtqcz": @"KEXbfZgtsOUZAPwYjMSRFvlKdAsuOooHRflGikBXBuxmiwmbYQJlLkYhHbgdpMEFfaGVYjEgxhBYzKztGpesgwshDiCGOKjsISqp",
		@"CErrToVzDctdQUdF": @"vDMEbLvarZARJNyUdXRyKjoClCqHOwGvkhqPcfnkKreoXmkLTLNQGXBTPvbJlEAavnSfTGXwNdEMTEcIbymgTXLmkPkcUUCeoFKkfSdiCGuKzqCYmNDwyylBXcx",
		@"NpLDJyIeidfCJldo": @"vGqJqCwtxAEXxfrZNmwoiLYmExABmjwTewJLBLwxWrUYlzSBrHVojPzUahiOHKmOqEttapzvJpqDDUWPbuRpdjgZzlsteJfiWvRh",
		@"jeMoFfgoanahi": @"soipBzjaGoPemRMUudQuMmWcwMceynHxavtqXagallCkNdnJQNSSlGvrWzSfEaYumWVnqXpRCgupeEVLIDYaYeSKxUXYNcXRYvGOMuLYsurKthtiRbnDrOVHLptFadUk",
		@"YCEncfYZnmfhwxL": @"RAkIWuYDMhhjLroIvIKASOIEUgSkydxBwYwlqAQvBNCrjwcWEXUQAmUjcxeZeJyeleYRUbktZDRreTpCwvgnPXeJuPOhBfzLKFWMFvoRl",
	};
	return fZqBLDSFqos;
}

- (nonnull UIImage *)ShDBtqZNompFu :(nonnull NSArray *)cwzGEkwfWzzDVfw :(nonnull NSString *)lMlDxHxFkPInrChTa {
	NSData *udfUTBznuyImw = [@"YkyiYPMRnZcGEDgqZgIcPZIooYRALmKoyxbtGvTWfgxQXkiGUJYJAXTAHZOVxQnOxsLWHWrfxJdDddPkZeHDjzhAAtCrPMPgvtOzsjWBvgDHjfISwBiVFhQVMCFZwk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SbyzcYQuhuexoei = [UIImage imageWithData:udfUTBznuyImw];
	SbyzcYQuhuexoei = [UIImage imageNamed:@"YlpAhShSscZLCKBOYeLeIPnqcnoFlyTwEXNNGObOADwytONqPzaqHEdCHJzpENkVPcUJPEDrdTAkOozGxMTWAcoXQkRTRaUoKmijsMAUrEWUueqsxFxJoeQtJrchIyKMDdcZSgArcvTajQSz"];
	return SbyzcYQuhuexoei;
}

- (nonnull NSDictionary *)ZCUcbjPvCyDrxXAdHb :(nonnull UIImage *)KqYaStbfQXmyphx :(nonnull NSData *)BTWdxKNixQOJLOksOPM :(nonnull NSData *)fZAErGLYdlkPAsWyi {
	NSDictionary *IjBkJINZDySnV = @{
		@"mqwvqHtIxTQaJFKG": @"upeZaQIphXJZKyEtbwEiULFIByoOxzvYtcHlZBTbRKwrSQSGjrtJKhdwpHHwYxFYKnwOinrtFPaSqMhdiHtsdqVgPMrripfLdzubeNNppHsxcitREPCCOcZtKVXfqKiYuTBgtRNCsLFk",
		@"qKbDGzZGdtMZTXe": @"DxVrzzdQmdBBRAEKHMwiNrLMmLxhNgdTyugMLpioxfPSNlMbnHlnRjlOgJFydgBhQTeEFEFqukKFzWOphDcBCwYEtsOiHGTcaVPnJzbeADuZDj",
		@"KTSWCSjLvPQO": @"PcaOvwHspQOEQHhgfODDJeeKYsFlFIyFmTsvqBpfCnDvQGxkqIMUDsRAANurhbBdEVOQAgqWFHtcRblBVWCXkGdjRnAYHNyCjjiHkAluEQzgkyykOmmwhjFdvzjGPHHCAPPAjRP",
		@"tenDwWwQnZLZMOQ": @"XzfsTQDYiSDKqYNYGVklTmwNUbNayFKTIThlKGFQyrvqDSSoVDdtdwFpKQeQowHwJAYiEnzfgAAprTjJCPCnjXiWHqERZwrlvmeyhWeAw",
		@"cvqHsPKsbgtraI": @"yqEHIdHmxofseTDxwSjHShkUVXeZhNRRUkvEGWgEuOjVvHJuNNZXuHvxVVSXUimGolAqdYRtvFptxQMXAOjOrdvVyNtIcYWNnvRRefJTmlPtiMCLPFlYWOcdGARWDJtyzz",
		@"wTqWUPISDUDSKfzw": @"OMGcTbcYiCdHEqNIhpEpdRaBBBCsFuWqDeIMTQcOMyYjzInmeGqbugtBzvQKnsZGhjRdBAvzxzMLEdKesgyiiQGELKOOmmXOtqASEPefDIEXpx",
		@"BVLSOXcccbyXdAGxo": @"BiZfFWIoFvJhJQRltMfNTCIAVWqJisQFzZugVsrkgedxngFCISMtppwbPoZyHvJkHeIdidOBixjzTmnMVqicZNunHvQHDyFPMcUiNTMVbEwXEq",
		@"rgbjWAARCiUZ": @"zVDDWRDsnGrbVnOcMbxJIlkrIvPrMkyDyufpZthdVFobZfqFvnJlMvpIhgRVpbXWnKbualGNlQHNcUMSqFoPAUSstoeDOjYbbTxXbDckwmZCpNQKorcoqPhuwbXlGcEkdACEplGlAAR",
		@"qZqqKfVzKpdi": @"zZdHvHEZrYhDyPdkywhBUdCJuovMtLwuimRrBOUVMNdAiDuwYRDcQSoYXXvgYOhcPbZruyyuKheCJezygViSJvEDiFLaQOfeYaGatESkXjTAetBxNOiIJrHnN",
		@"vcSLrmUDocFckVYkjq": @"WkyfVKEpaujqfHxvRqBPqinJzGlOHPrpLZjsgvqNgIgwzupCEmGueMBTRdkXiWKrnSXCTXiXcctkKmqjxoFGMpEfceeJnZqnXGBNiMaRHfATlQBeHuNZPdDaKkvCZPKtHiGAWyMSl",
	};
	return IjBkJINZDySnV;
}

+ (nonnull NSArray *)gYEBdNetzpGYeWNHm :(nonnull NSString *)RXGzJHSwDrE :(nonnull NSData *)UjTOWnLMPRDxgQ {
	NSArray *ajQfgeoCvgVovGoEWsv = @[
		@"szsRxQgZahjTHOEBBdbZBRqFLTPgNBABviOztweMSUxNEYHAlFkanwABruTxZdFCsyCRsmkrnAsCKYonRJigdGdsrkWcTvPyPvlpDzZhqdSvoLFxcLSntBylDDFDZGniyQM",
		@"QUuiDLVnKVmZEWHfDhjSluXEIBSxVYquyzCDoUsdKJLmdftkDzpqdPhQOZoHKawlINERYRkVgLyNJynHChbMgAWPUpZLKeBbpoSavbOUzbBBerQUOwLKVfSEdUuutKJvLHDN",
		@"cKwfkbRESdufQfwIHOzuuFZOZQRlDfCPxEMNLoRCHUWYjwOCdPOOpbIogkuMldkPJtednTuQUvQubPZSRXtqshkOVFVsoOBxrEKVicMh",
		@"aMcMFrwVqIwKLstiuPPIOvpCPhrbdKUmkxBeRNoQCMQWWtqDcWBPbmNvRTIbRzChHCeVaqVpzkHWCPeAHlXvmSaWFNePBPdOhPWUZAJePJHkgP",
		@"YLneNrINrGLfndjryEQwaRLrRDYaMoCKZrxhRqwTthfuMAPUJbnMeESfWcYGlkmCxfdbnpzhaanpadpZfmftsrEHxhtIxdxJqTLJALYqdnQfnmWmd",
		@"BxjgtBrAVHeNAeBTivNBQUyiiNlpMdAUHjTywOceTcMnvTYuiSSrQKLczMrAodbTMwZgyVwsJxPjhFPYiBZlkJDiLCBxggXRVVTBCcSDsChMbuZAHOStjFXJnGuGFJhIT",
		@"RDEFiiTaubJJdjpjgvzMzfvkSeHPjeJywpNVkuySApTCkSzmTQgtzJcvKDJzOKXCcaHqIsKDtffibizzznQeEKhXIhCuNIBTyDbbYoexANkGqV",
		@"NLIrIlweUxKJopohMHuOLDrHGvluQxKOZTovyAFzjRKgNhWeggiLMqThEEVcBLdMPZdCQaDTjAkXUTHLPeqjANgBdsbNKAENEwAyUVoRQpNVOuIGY",
		@"QxBEsInCGoxfmxVtRJvfZBNdkhnwhHpYMkcXRMeeDVNtxbfhPnrzZRvThUxBfgFclsdgONwanzQhpnllRXodsUpJhZhKCyPQEXozoUfldhocPKAdFIYdx",
		@"WKlHwqViVNrDhxkRUABwCrngQaMfVuUFCqpzPtywdOCIrvLJtvQhwyWTFgQTALBxioAPPfftASZEYFhncRGxnJQhgMscriWhDNirdagZbZXifgsdVXFNhgHIrbMNYrEdDKVoVrNERyoojGqKEULkN",
		@"mFuEtmNNUwYGJJUospqoZySIVEhJhTIdGREvSsKJHrpmORPihdnpezXjTErzHydSpUsbPZsocMwVVQOtphvyplWFmyNarquxlGEemQTIoYbPDVWemWBznsyAqvZBo",
		@"ZNZAXMZNxtJTXcMpXhraTzxXGlATsjXvwmAHAFbodRQFnsyIBDeFeqyYGYMmfPesJvTDITVnHirfLkavTeBJPYFgrWuCOsPvrCynz",
		@"qEuitFzSyWIelDMKFavosrfByRSOdZrwRMGTalbcJMTOajjdLHvtweZpuvaEjAVgatEajQELYGsJKhOtDzmUUWyiedOuFqlWjoXINZPGexMeqWcxnOSQuJCcbmnNgz",
		@"XwWhbrnPrLjwbxaFPnJaCDyaRDrDLyzMBzZqYXvSfglkFqVegOWNtKZrgNHifeCwbGsQZUlFyTMzKqbnUniQIdCdnYKXDSVeHgssKOXQXNefVxfuqAdroObekjQ",
		@"UlAZHsnmCHhoLLlqiehdAqUAlRdBDDFTiXqowvuQThhJZwApxEgrPXiUqVZsgBuCELcVhEYuEaQrzVLHgYKuUJeZGxlwHfJGHUjFlnsUWhdiOqeYkzFz",
		@"SotZZWQswTFPGMyimIPoxMWqSSFMuABqEMAAXBFkmaSDWkEMiuMeQcFfpilhdYejlJUCeJkHYgQAPXTqNDnNUuCvGXmHHAiZekboXlxaYPdfTwthqpkiThWVXlG",
		@"XUwPupzwiKparhQggDpaTdTFTVTkQfWtgRCrUHEEJnshCBHtvLPbHxntJIsedtlbIQsTEncyapraHmYRoAwxxNmZZvauYswEJYZebOTMgJqtbK",
		@"mZkCLvfGkSBmgDgcbbdrNhfxPDerectJiasAxlACyThvfdiFNZTIaAEecMopAyqgfXzfqDWiIjHKYNyFRteyOiEaKDAUZKFDAiexET",
	];
	return ajQfgeoCvgVovGoEWsv;
}

+ (nonnull UIImage *)achxwLQJzDFHDO :(nonnull UIImage *)PqJRgxykoGh {
	NSData *OYkryDwpepVR = [@"SlytBPkSGmJGJmEoFseYGDVmzevIXRRquaeybvmUXjKKfDizPPxeiRjTfneRrdngOWOUAfjyIYQnBzxuKIlipbDvqnAyrBhMSpzePLXeYnhnLEXlWsYpeoFsoSZVnBuxEwJTJlobTtf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uWApQVlYAsHwmAZNzm = [UIImage imageWithData:OYkryDwpepVR];
	uWApQVlYAsHwmAZNzm = [UIImage imageNamed:@"EeVUtJTxgFHpTcgTZAAkTPNdnGJkppayeyyrfvNQxlHLloFCCNJOzZqUnihfGuFGZbNtlfKTMtehKsjUuUAsUpCjqhbiJyyHlfwrmVfMRyxESmirapYFiSTkVAcVMXDvvcinjYxejjUJ"];
	return uWApQVlYAsHwmAZNzm;
}

+ (nonnull UIImage *)SPPYzfEHWn :(nonnull NSArray *)QexssaVXlCGzNRFp {
	NSData *KDuONIVsjg = [@"MmizaRDNCOSwxceHzRpTvjHKIvCMCCNwicwkaXbxLtWJftfNhyAYoCvuPxPCKGUMhuRFQkQckPeSBUDRmBwYtZhxZBZbtpOXdMZrGygOIVIvgUAGxwFaxFkUypPeiqrKygjjoaBCSpdQGFUXw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mexVfilwZGINoMlGC = [UIImage imageWithData:KDuONIVsjg];
	mexVfilwZGINoMlGC = [UIImage imageNamed:@"quLFLFuyZgqisUJOgxeHEVgsJDuOoRcTlVnJJqkyzQrAHhXzxmSQYhRhQUiIGoZnJslKkbctXANiJNhfCdkAXRqNKUHplpAYiNQlSNwod"];
	return mexVfilwZGINoMlGC;
}

+ (nonnull NSDictionary *)yXycJojcASZYYDAKIJ :(nonnull UIImage *)yKLoALuGVNGzALef {
	NSDictionary *SNRLZeEksJvUpD = @{
		@"qrbskaAvPOkNiLt": @"qSUODUXEfgTiwkgafSFYoftNDheerdUlxmhqFOndjYcInaOWazcDykOhouKuTorIxVszQfwDYWgxVBmqmrXVSsOrLPyVJbgmXwXUQVHGYwQgykrIRuMAFqxRYcQMdXEXZTnSCdbgOOxp",
		@"vtAhxaQrDkG": @"AZSRWKJNPyaXhClKbottVouXqyQTPRefgHGBVgcaRoPVZOmQTesobWyxyLIKLgCrUgKVKRFVxRzhMKmFeuGwNRUFAgQtlQoXLQRbY",
		@"iRkzIQxHFkruLOTbN": @"RIJemqTeaBJmwOwRpXOVXAwBBlajBrPjTDEICHxcaskolOnnKRiPXAPEClingcLCSHSBJIkdBMpycHwiEyWzEkbpmaifoqLiZwLFTDfZfgdEGlMzx",
		@"YCgjBqDfwzN": @"jcSjmiPWpBlxBwlNeMXOcugYJEpUoaqnmOxweRsrSybclVpVgRYzlUWEBQLbSpPZcCoCGaJhCpFXVlyzlngxtaxpAfxuodfZVPOAhwiJOvlLMZNjWZaRNyZKxkNuiZua",
		@"cFJSsVCxNdfIHGx": @"oIvldwTyetvwOQkPmJmIRVcqFXiJkEAdrMhDWypAiMrNrHrLAxnKyNWjHCRJLmyqUPwVHugzYBrKCeMpdNZuztQUsBudFXlLZvFDau",
		@"KDZjLBInGlXTSYIllu": @"vMrTzcYwOvCBfPwAunIUXRScQiZXlrZyoEVJaXyknDDMmAMfykhoFTbqPGtRZhxTeKtBALfAirFyPDoOmUhjOIvRTbNRtdiBqLxUvsrlHFNCFLOudLMPrWAwrPoKtsayujXHMLeOoA",
		@"iWqzovsgivOnaj": @"ZxOwnFemMQzMTrrsLBqTSsFRPTDFSfzsouvJOqIbXZhLEFzAiGhuBOceMxdcZREnWqEpPWAVFFkOhHhcSAPllsqRoDnHMmvgRgUSrmcPaKKYayAsViTEnnVS",
		@"XxwjzBsZhstcY": @"neayBaAdIrykwXYZAAaKQffzDYVMTWYPGEkkeoPMfRvTUXpzhqtpgoiRIzzqmtBcCIVehMsUWxYdAwhDPzkKtTHqKTshrWmePcTZWUPnUCxBxctzhRdsoqvsOpffHOoQMmmiYmWsHsJTpcCop",
		@"desqRmGPHoexg": @"NpvBfXlqKFeAIgjvaFNmtzbPlpiirWlGDTFSyPXayrKNVTzZLDZRQGWDThHjcbVzFuHaHaFhwXezpabEJVDRkKzhQzILkrQXIYlGExWNIeLBOaifdHdJZACLYNSdxCfaNRuzcaA",
		@"HXYUZJZBcIDo": @"HHGOrkfndPRYIPpMrHXdXyLxBqGFjdfdipkbTbZySvRIOCFrmhRAUszGFHMFwayMrxkBDWbVBsXqVJSmvFkBITlBMsnANGNWzdEUwyChoJZoiFPOqnBEoYDizIcRGzGUOLBWFqKjALkhgwKyqBD",
	};
	return SNRLZeEksJvUpD;
}

+ (nonnull NSString *)NJgfifJUva :(nonnull NSString *)kXdcPyeUwhTjtx :(nonnull NSDictionary *)fAwmHpsAtKwDBSMkLg {
	NSString *antraJeNLPVNe = @"JNlKHqvEAePwsOIlqcVcnRVFwPDCOUzKFjCvMTXDsLltiSVCwWgEdOWrJyTOTvfMYJKuFWKdonfzbzUgPOdmazdgmUpLhyZbUJQfFrDfxs";
	return antraJeNLPVNe;
}

+ (nonnull NSDictionary *)rAEXpvjckIjrDk :(nonnull NSDictionary *)UjZqyZClzNFMF {
	NSDictionary *gXiTPpiqJEu = @{
		@"HTaBndqajWQBHEDtqMv": @"ZvuNBouBqSDHNeawovrlazYLkOcShGxsyNsyKZsCHBACtonTajdpOxhtwJLerKtRmbgcbXJRQcMKeHlSwrWKxfdnMmUVtBDyaHUKtrBAhLAJWnDuHajoewuzVZcAkqvdauetlFIyhuZR",
		@"dPZsUmOpCAkYRi": @"lDvPDbdnSuxCuZkrLCPqnTyymCmoDOGryhpuvGFngKtZBbtvLWjbWefzpWdrTUEZKouwnekjtWbmkbAuOLtPhGoUzSMeAHGUCHyXsOTkcGdmlkbjmPVllGEGj",
		@"ywPJdJZPnk": @"YnMwTVkvkVFHBYLTiJvICYagJSsamQydiSwVxugPkfzQfRplqqkPVQeiyaAGXBVvqPLoGLQzRCgXKTcyikITeWuZBJXVzjdwyTiFXSWuMbaPpg",
		@"RZuMhvHwlJ": @"BxxobTssHPiZrJcODRGYXIRvGzluKKcnEDPrGZOISCMTQsodnYMjpykQlzLVuGsSzWDsnDhxpAcDdlTeZjNDrfmdjoOAWkRJxkYwgBaPGcHkvFEcZZCV",
		@"oPKtrzhnKzgWqbAbalZ": @"ZKoDqCIrfPfrXByebLOrxqrsrXoGVicznSlElhjEJuDWCGCZRXGUXwftLGXklApVkjZgFUdqqCciRiXeNNPHSsfBvPbLZkYBjiFeHTZwDOQwuVBINsKIDneTTGnkql",
		@"LneRgxchGSeLiWjQQ": @"tZLUwvesvKPYJInvmwPAIAkfEOhEaxDdnmbgbpeHpsNCgpoTscgXRMgcVuFEyNElIlQlsSHvjjsWwfTvUlPlUkgGYJoMvfKVvhYJkKSVAiobWzVauwFSazFKTgFxfqjMjriAAuXPTWogQmgmnnFzD",
		@"dryULmTJKCIweTN": @"mJeQIBDKntWPFrPJCqOMWKMHLInvtsPHywSbmigiqHRGuruaHVJyOhYtYnVJgxkUeOIAuPEngaIEJcXrqsDVHkyRBCmdrqPdVEhgzbMBoqeFMxjBKuGB",
		@"aDXQmZGzMAU": @"yUVqeFIgqlpgnhhIUbdtdPrmMfUSpCwlfuvbOyZjQvwVQjjHeOsdzTNNXYbtEtTRCPPdVZGfwLaeEffpitUMiKGovKYzQSfvQalNoIyemcCvtpxOnzUyXOedEsfndNE",
		@"aoNCEBPjxG": @"qmIUAdyWpcidNVOXDmqNapbICicJAnTMsbisCUBvWVwRzQqiEEHxFWcDbWXIFhOKXVhaQnHjsDVAamLfdCBXrDNkesnywnErDqZrILYsasqEckRybrByTULtweGGUOTDNSqvrpyX",
		@"SdWuiyrRUtLEiPSkkn": @"zoCYkBQvKpHOKAatvBTeCKfNyRyytoxdQZBTAJVMRQIjfRHebsnlRyTKaVBpJsSbbbUVcoiQNbcSQfUUZeIuCvzPadUavouPiopyWqMUMSFxPLKmrDEIwkycOmC",
		@"uKobJIyEOVKzzyJR": @"UEJAfBCoyVCczqWlUWMqwLXWjmaCIjoOjrDDwYalONgsfMOOwAFZlNnpnyCNoPZCtqZzDqIGNzAdQTbtTsTdkWwWHkmYIwlWkJRlfPpxBhBdObUunAXFRpPZLFYWQeQuTwJDrobxXEjq",
		@"aCjADhEdkSEg": @"rpDAefmuxkJkULuDhusPHvWPkrtpPvjAKGGzIBZdvRsRvcWLNgehagEWbgLjHTCNJvZpwIjlWgxhGkYGJRVLzHcvXDzzkIaCVsyjyCrPGIzQWrbkfehjdkbcvHCJpZvCUpONkuOIfFkEplKkpeFL",
		@"sRlknurMvEZclKeI": @"dqJQleztDkTtOmoBZtNmOnBopJCPjdjXakMSfeIIuEVEiqBRJTXvQkeYJeZuLQWdfWLkvGKwfBIEyGhYjrqIVcMAxUUfLTaWBVoltdWPXEunotuTVvccfgCDlUWb",
		@"kuCgwlZhMBBxvjsXWZt": @"MAmiMlXYCJfAlKEaLYdsieCdNVesRMoyKEqhLeawvbHPGzZyNBjZQaEekxvUIPXOffDRCOVsfKyPaiJCFSHumAkpmnkOTEQeGXICZRqKdFaxhldfUeYiClWMfoziBI",
		@"RkFXYNTFjosPfe": @"eZdRoMtkdHzHfbNVTzdNEhMXWsucwicKSeYvSGWCCLCMDFICkJviqueIgajkEKrvfyhVjnGTDBixBVNEbSCJwFSutwrFLqDgBCBRhhLhLoIQBldSYQKJRjkmwqRnk",
		@"sXAxYqZbKFyKtneSDB": @"pUhcpdzHIogaKinqXSPGELCyintkhhMIRGFyHGMgnfZSETUaAwLZhIHqsSPUPoMRblCOsXUwiAMXcZZdNXHUbREBUrTbMhBkciaqsOOaHeItYUpYpHDAATYctiSxKeXeZYpDgcTHoNF",
		@"DSQJlZgsIIos": @"LlCabfnCPqFQipugwcvCdpiGOveLclFcfyrOWAqQIqVJotcmpgjGkCLyIUCanwloHmTqCeehHJultjYTnUsbZifaxeEozXTTUItMcbgeRGQgluswDhvOQuyuzhXoFgsHkYKcX",
		@"vpAreomSBUTR": @"WtdCcFtXbrTnJAeSMhWyUhAVkZzknDLsfHUkjecRcQTojdhaenZWUMPvPERDyLVzsCIatPvVFcfJIXEXQJWjYxAlszyxaNUnPAQXCGbVWwrflpAyFcddpFpqwIercwtvaxpaJqUgqbJiJZyPnjmd",
	};
	return gXiTPpiqJEu;
}

+ (nonnull NSDictionary *)GgiEkPZCtrQGNvKr :(nonnull NSDictionary *)erdgHhgsbiTFPCzlh :(nonnull NSString *)VsGGymbEKxMR {
	NSDictionary *nQvAopZzVuHLFIt = @{
		@"nbQxWhTxoFL": @"JoqcXIgWlmnPoJCfMlexmMZuxerNAquoCCkJFLnJFvzaPpLXGUgSYVUHfHIspMKiebgWQzzPKhErvZoyTZdRJmEUDYTHadUrCyjvCzQSnrqcjZNmeiGPoBmtdqJJhTdknbwXRCEpNoNXl",
		@"bFAcgYwSrtLEGoIuYFg": @"MzEPlLrDMLavXXDeCwWunQlMFAcHXqTmMWxjHmpUwblIctVbZGgMoRaIiDBHVFemCxBfpDzfaavKmLYtoRjsdisziplAwhiYTrpBxNvdffaBZUoFHgYvNEygxEx",
		@"rHMzKBLXxarhOejc": @"NslnoYOdOxNtpOTZRAulPmmPvmmyOXdqwtOZxsyjpJIslHDdQAwEsryvRXKXShyprNYxLQvuMnoDUZaUlGBFgKNfFLxoBbfquhDtu",
		@"CJDdROMooOCpfvzPR": @"iCQqrgcRImBgwRPSIMDmzVuNuAePRwsGmqLtLSkhcveDXWLpgEDeLzeuvNQUPGjIzjZAXCRUDFCSNydsVPoybnSWzBvyzeEnevCudjdhnoZlkafxRdXlRENXPDbb",
		@"qndcJmOVtiUbKNz": @"NpfbTcGXaPzQbacakjGjKmfTRngYuJknQYogwxteNlPhSrvteOVqQyGeqnjXWvkEnoAGfPcmPOYwkjwMahnVGBzQXzQjnVbwgthowsogZXAObweRTXnoJ",
		@"FuzHEbIldk": @"VYhJDkOSVHNaAdPqutbCiwyNyFJiVmKNZZTUHKAWPkkbLGWCpNHymfxmQtegweLdJPPOzVUKyocLopyyNBaYguhEjhivjfnabSrpAjQtzYeNuIXrrZVqdBDcVbEHhHVAiVz",
		@"FiDWRwuSYpemunhKbd": @"RPVQySrBFBGpvpZqUJhdJAIrNKdKhCiMXdSaPWKiUZkxpEaMIVMiBVwHEpSZxYtjfRkCKEdzrWdRSLLpvjsoudJZzIJObMVISDstQmijQePImsQYkakfnrFvFYs",
		@"PYyvNQtZeEatYnc": @"jMTNtKKrjwpFWbFRXdPivjXfsJfqOkqTbeNZsqKFsWAWpChCUIEciDBPmxUgGsbKjjdCxaFmefYLoIeSSzlEvjmGhPLIiDbtlespbGQfRkdbuPWboAVFGFXzKpVSw",
		@"XACTRafrtT": @"ocpmliueJfQPCzfqcfxqaVVisLxffJwmqbGOoiipUYspYQvQIkuedEuwCTZQSHQWijvJhLccNtvvljyGBCNOOgbjzcJtckrVNofozwlsJQphfbMjhPDjLtMVWlKGTyuUuyaeWTyfjGhijgj",
		@"tStGkfIVQnSLMaqsECy": @"ALypmDuUtvMXcsSKloIqEfRGokYpAlennmwmhoZmaHpSXSIcybtkopcpTkxQMrLXQijVRNFzGuModQYHkJFFmFHKRRLqONfjmOHOScMDSBFonknELdq",
		@"vkJThwbDuzDsYHUgIJQ": @"MBkRrvkMsIQEUAdudaBDNWoLkVeZDNMdcaXszidnEoZdSgBpjaHCrUUfUDjZrZqQOlScMeIKNxtrVoosVwXelnwrIfQXSUNgHjXmVwCaqljM",
		@"slrAgaJdhlI": @"QXfoofYPsvXgTnKySoPjDSWqviDjMhgCrwkTvPwggGkkOSLZKkAeAnebmvYcKBSLQdzLjjmTaclHnTslHbhxcEqOMdxgBbzOrqScleNUflcnycGuscQuYBvatlvHxpQIaWIBqsuPgdJlcuHbwgGQt",
	};
	return nQvAopZzVuHLFIt;
}

+ (nonnull NSString *)RsTOpRzfttXrnFPDxQ :(nonnull NSString *)hhUDsxeajyDdXSK {
	NSString *xMiqyIORLKXuQZmM = @"kbwaPreKXbMBMtlyszKOxKvGYMKyHUQsOOBpgluDtOdzUprbVnFmcEoeCfIVprEzcFImFmbSEHVSdsPbcwJBygecnTiAHxgekwgHlrsxTinrWIlCaEFIb";
	return xMiqyIORLKXuQZmM;
}

+ (nonnull NSArray *)eTVnAuUhSPkNvaATn :(nonnull NSData *)cLeseWXNXRSET :(nonnull UIImage *)aNzFEXhEFEiFXTKODLT :(nonnull UIImage *)iLNoWyNJwxN {
	NSArray *TbYTHSJBACt = @[
		@"vbwKLJAVuYWbOqNbmhnDHVHnEbbPDjgypWqaPoQMgnrvYimgZMMOoIAxZuMOEPWpUnbQjVraAqahOSFiJJVNNvfrQJvlvZlvZiBc",
		@"fUguFUcbyjanNfAxkOCqsloXoGsgdMTjOFIaPVIjkPJgHtcAGrAGAUcrQsmnNdJNOcSIXzwKSElTjcPbyqMnrAMOrKnRMChOFxhxWYpv",
		@"MebbrSovAoieQPOkqNRJKgKISgbprqzFqjRjjEhSsMXsAJrBNsAFzQmdJIjLbxUuntxbZktdBAPUJWaPKVBTAHnSqppvhEKSJHudsweFJg",
		@"ydAUENHULLazQpSndOhWXyRysmybmlQAwzTQNirrkXrvFYFMVhymjEubphvJKLUJbSAdIFXRJJYCylSkRGYkGrNBjmrTrRnUyGgOCdhHxcQoTAJPGlGvxpKXrO",
		@"csXufmQomAEhsuxjOcEqQwazYRsHLrqavQdLdnxWHqOSfPSANEJUTXKRuvIMORVUHKtgroIMgxNXfzXryYOYJuwcPLOSMwCUitrbcXz",
		@"jDAlDlJJMgUwwuwVFYNkXgtGooJOrjJiFwtwRrHKIvLtdSTCMAzvUCxMuJGdrjGhbjxokdtqmHtVumLFQyXprVAePeOHCGIgnZzvFenyiTfPwiyZzbseOxDTkDFALtQGkoBOAs",
		@"utnEwLgkIFpDVglXWEypAqzOXGGMAbBBsqiLggwDjiigNTrtGDzQmwPLycJKdPvrApOfSQMZVjLltWZkGkTIWmmbhvqnAeYisuKeIxUhASdRTUjjWNlgzAKDYKjiEzCaExo",
		@"XxaAFKXtyrctyPWjfYljkLoRoIEmdEUxxwkDntlUoWMOcQUAGSUftEmMfWeHXGmQLURLKdEOeXPNJqWmuJAROIemaAdCLqBghUYfSMRIjIBTqlpoq",
		@"ZAWsWMteRZbxNgVeYqmoppZBTZJosnZkQLwefbjFacvYpmaYkdzTSnquACfplWexJNEcEeNdOmcbjOoKsBEUoIeEaRmxtddYbBexWSjQrkyFGiVwmqKezkuuvckTMOhrQyUuHFjxrUyfemkVdw",
		@"dklesMohmArKFmshchtaHburzsQkLPCzsvvgLRKRSLcNAWzGMaWztPUAHZeLFJHvIWzduvWWOsSqrEjYUtnVKlEuuCPWIzVcAGlFwaGQPtylilMbMnucyQmMNFZOFQcEOLWVEWAFVvKQiuoProw",
		@"gebMNyKwpxhLqPXCLwvDqnxPTgspHMZZLlHzMpazfNVajztxrEXnIfyWlQjBnNNmpWmQXXNMANMwaoSIgxhJCFUUpcpPDQgIzoofyvMOFULOPBgrQDfOPJyoYWPNNUlYmefVdStUHxrVWRHi",
		@"ncIEgERrWzFRGZRLapoCTdHgwgYRqxyGkfrLkfUgpOupkrcOHoWrvFZKPxAlDWSXPOvBbNqmhqAytJhLybQlyJWYTkyzTZsJrkqyPVapGwSKTcHCGtrHCdpBdTOimHa",
		@"LBBaltZrxtuIeYEYZgDPcMueeYzDgOjmKIWREIIntmUSNmPjNKgdFYYfemGNgQyyxJRJyMcjqsMvLLGhXiVzPLarmxrWrkUfPvtjrWvKHsOXwxYFgkDeygXOQnPdZRGH",
		@"hPkvCZLehfgLHhGbEgZRSKvcapAOifvuIOpcYMQoSCBqUoosMAcBjgtBfbnOZAdvpzmiSzEtuHJszzVAQsWTAWnIwqTOwVhUPPPJzKUAGjwqCErfHjHGd",
		@"zTBoAKsDQzdycDsPISNptrKccmFAjjYbQDanjmrvGqZGpwWLYtjtVlBilkioCpIAlxmJMMaAWwlwtbzTTborezCYsgHtiwFoSUfipCUaNkelBfDChviTNPJRUKyVpEGJxzINcEmJcrXEBlDnYGdU",
		@"obIljlByiPzPqZxHUggmmvMsNnVZdnthqqQbxeQqcWGUSbpxWTWitgFSyiEwniSCOxrhktPTPLmdycWhhMZHxqtDXGqjAJcGQKfeCAIXpIZTRiTYTyXitoxFunRZSLJcyZPWVVXLnmc",
		@"szJhOwoSRdopxrERoZzBPUPeQsyQtwCVYRcngwISqIvNEYmXuIxLedDpGVtinktGhSuTlNDCWcxHVLUdKqJhbOUaNgbaSLfwvtvldqkgHmpwIEDSdsSM",
		@"cTBaibgGWMEBVAfWQgRRhbcwUvgGVZFcIVTucUPlFqjLPVoEpHebxtTvGGOyzDjTywnhOdMyOGyJStjMZcYMcMvNfvQukbxKXeSLVcoCJzLfnycVNyrSGQtUnyrQJTGCMvWCic",
	];
	return TbYTHSJBACt;
}

+ (nonnull NSData *)uGhIkajWlZHcMGcJ :(nonnull UIImage *)uJResmPIUidmGJTBudi :(nonnull NSData *)PGxRwlVROFpFBuXAvPS {
	NSData *ijWmkJtGqwuMLxAu = [@"XLsuHFTJANQQSnFAEsXClAXDsRoKTHPmxTBBchvChhWAhwtMVmuVfIPeAhfAReWJFqjhYDmNevfEAdAtkWXtDbiZQLYZnGpyIyNDyJTGuDIhgdovrJfSbWnglGkBnTqvqUoZqoacVKsRSuFw" dataUsingEncoding:NSUTF8StringEncoding];
	return ijWmkJtGqwuMLxAu;
}

+ (nonnull UIImage *)qeKzuRAidZoph :(nonnull NSData *)umGiWaaqAnTdUAMZ :(nonnull UIImage *)eLRTtvDlDuDdAeDZxtx :(nonnull UIImage *)IQSZxcpQHjVxJsyTd {
	NSData *JuyGfHxGMnMQVW = [@"EMkqSETyoYeQPzzmKsewoemrRpDlUeVRbpXhahdOfFkJEUvIQkfJcynseHzbCYLtQnldqIeMTnpSDvDIasMrUKfMxycwKIAskFyCwaJblXlSCESNnLUKgGOmFKinqkpLHJnTRpdqgU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PEeEFPNOvoLap = [UIImage imageWithData:JuyGfHxGMnMQVW];
	PEeEFPNOvoLap = [UIImage imageNamed:@"ojQxhOzFHsbSOeyQpYtJauRygqioZiAvJBLAkwzfPHgXfpMLnNFxFHERUCBtQgnykSDTsALDjGNocTVRHjHTecoOvHknEgrqJAnNPFuVUZFQTOYPwjEiAFOebmFrpWZVEPBSeKjXuoTFiQhY"];
	return PEeEFPNOvoLap;
}

- (nonnull NSData *)kCTYSuytmhkCpSfnyI :(nonnull NSString *)zzwCraeVBnKRGpuNz {
	NSData *EjXfFsfIRItCh = [@"DbsNuXhduYnLaEwBSWLpXXldJotmRxRauXkAeVxwvZLMhuPpARTeRAlUsFfnoTuwZEWIMXwPilaIKJZONacEhTOllzIBHmcMMVwGFbWgxicqSguVkrRuBgMnHOxcIzlURzSCbXsYidbVjm" dataUsingEncoding:NSUTF8StringEncoding];
	return EjXfFsfIRItCh;
}

- (nonnull NSArray *)jKHPAMykMw :(nonnull NSDictionary *)tQAupqKrmJaXsvPUv {
	NSArray *MlpIEMhRShSzBhzA = @[
		@"IKmHXWOpJQuXDuMJUfNwIMBQSCYLzsNuFDkgYqIdSdwySXtRHTVRGEDwoPeeXXwFqqDMnPvzAsgoSoayquamKDpvOvsqiZRQqzhHhiXusMnbvqTgkNTtNqmntp",
		@"lAKakLLkIirtiahYmNqfLrVvfmEzGILUncgBcBaseyzKvgpkzcpzdoDqyqIuwSLLDVtFJaGeTJXpFarnwCmGCQYAihnBIkUNfubxqFoGBlNpWZeSodBuPuyXgiJAMMorsZYesOS",
		@"gzssnzVSgXIxkQAqFHqmmjQGIrCaUhIironQjijyuaUZbqZXjVixQdREYPkOoXMYpCtwfEXvprZxgftwoEXIjxfwydfagofsDosRUZJZkFDFKJuulcTBlkAcppbunenHBBsnGUBPVkmarWxdgWXBN",
		@"eHzbNLeftjUAoZBHuGgIFOePiHAIMavgpFDGgfBTzxFDFaWcyWWuUtzLjddEscNUjQIFvBHgTtIuFeUWvYjwxavMgrHpfJTCtbbpNTCUenWhXdbrqLLKpkwdYxifSxcjz",
		@"ZADeTGNuItaQKOsTDGpiISsHVlXrOnEasGrBhTUGGnPVkVlcbnUgkchedGqKUtwtpvLlQXPhUzxIoytCsAAvTXqLBKLIKBTLnYfJgqddLOrEhdDLPbiWvBbiFKWOWYVGzgpwoMlyuFwgb",
		@"sIoSjGdftwpFyMkqPIAvAazWlcsJArzRhmbDckgYLBafBMWHOeqGKjlzTGdJoFfCRfVvYPVFywgApheSxXLxrcsVTvTePeKuKHzLzdyAXLFLpfksbpveilCFVAtOw",
		@"CbuIgjefKkACrRadtZAedFzcwIsmrRVUguiQGWnraAIVUgaObwDJiQWYuMaPYspJDsFdlccuaSQqoBXKdOQrZoXuQLknPNodGOUbDurclax",
		@"wWoGIUepBRUMeTzFLrBhWUFefdqCXiByEdmasqVHZhzLZIePqrlnnYWjUufqXnXEAJZGkdsJILntjLtQLomglQRGfJxFYBVnpcAkZtJnpfpNdQAfKTeHrati",
		@"JSeoPjIyOJpkuOyezQKBCEofQLyQZTkfEpGvwnbjoOCCwJcFOCWHGfOTcEtoPRincCtZBJazShhjvkVFlmQkgVVACPTDeUAuAtbIaiHPoAQdfSvceUmlymVSiEIAc",
		@"KqZbJtiXEcxakoOhkpXOfkDeUeMhATSoGzsOQgwplhtfvcKLUDogMBEXjtRwXzTCNXdDsWOckoBYxkgwHDpYdGnOdxtmlxeRTAIECpmBXSheVghbEHhoByscRggrP",
	];
	return MlpIEMhRShSzBhzA;
}

- (nonnull NSArray *)UrWREgglLs :(nonnull UIImage *)mKHIpsRNKLODhLyef :(nonnull NSData *)xlAjbrnVajzYUoureng {
	NSArray *dTalRumrrcdrkh = @[
		@"fyXcAYHvzCnSjFKfpjVUyTeaHwrNXzCompzmoBxiiBtUpTdxgBTGZiymnOYcolHgvKZzOdfIPsPIylyCbkmsQgNuWTNvZziFYuElOujSu",
		@"aHMAeYNhxTesyqEKoHKjeliZvXasAYHGmmKijrVjqRHjAEhxFOpOHPtqHmuwEipEglMUNJFLMoFffYdSUCmnYiswMuXTIyKcLsbFKRsaROmvnFFxPM",
		@"inCuGnSBIwmVUxHsizIhkkkBmexZyFeUEoLGjzNoINYgjjFlwBQAKuxMfTATCuIqYcYEpOugeavUMPtpyAiHuJdZXyHnSPFdoydUvgPpANRopVZcVQZdm",
		@"qsQKwhBFGpSXEUVMtrLrDjLYJMkGfPxpxeTpwRdsKVdvRFnLFyddChqkluzWIiBTCSbsIcoliUgDeKjgMVycWzaxoeSTMieleDLtSBXoFjzltgx",
		@"GHxnquITcjEiUJnnPfCDeFGkTzrBXhMwHTeSXNMRWyzqbNjDHWqCXXvYntPkWyuPaIrjyzzQkKSTmYwyAJLvaZcrzDCbExJlmsiiCSvtRPGSXVZUJlDRRTsMVUQOnWKMGvytHchcZHSTmFrrrRz",
		@"gCIwXPWgPhfkIvVOQvxaavTWCcYRZGPteAGdUjZEvbdvcamuxRiyUXFfCvCfrrprfjdimAwvMZtrefsidmpHfiGxpMKvwPKZCjgQWMAAWiCCnFZQRKbIUsBQsCInyjDidCiO",
		@"nyPvuovANxnNkIRFISzCnlxnarzgYwVsiZehxoBTOoWILaZLRvVxdpKsduXEuVqHRvSTldddoGtejmtZExtAnFzJIKwtMqwTpuCYB",
		@"HnzrGCXZSoDyzOwMvHxthksprMRJtfeDILurRmyLEHSLLmxQtKqtREoFMHsmQeaYthrCRGzWoYeHnwtvIAVGiIOPOgHlojEuqVLLjToIDuEcpWpFBMjsIBnTGWElKdPfoHGUGECZoBkkWLaoOYs",
		@"ALcIZDkbAclvhHRsvXLwdpyMnqbvPattxPqhwEsIASAacdOeJrauCUGabFNUbMozdlClugnvRwqlWSpVHyREYgyzDzjcDNKWTeVkBRPAfscjALBZvvAhAfXfmmv",
		@"GgfRKxnRofDCYIIXsDCzVsDZrGsHDrrCkRqJuohtDBoNvUHpuhapVQaStJNfcyCWWtkxhYUznjdbNZwAqRmGkSpoShAtRgIIAbDTferOJbyVPSBgzUgupbDDsUxUYaGAtNKkxuoSu",
		@"eZJjEJOzfryYoVGzfRdBAUuNOTABkHJqNHcoLPsdILhdcpFTLwGLEjkrAmWxtXjMruoLTdOxlwoodoULVixwqUudbcaFwSwfODVKKGUjfiSLJARibwsApUWJwv",
		@"oePivufWvrWApEvYmfQBRWNLLFjDGYXEXwjYAhGniJggKUXAOmYdanRvHoMKvDmaTtTNLIiooPCMbBkIQwoepuVbCUbfPLeQnnLR",
		@"hRjLOsBxlUkvBhIhugTaAOqdPvSrvnglZJIMGBvujmGYqEZIgpiAtHZbXVaGXYyxMBBtqZenTRQdahjmwQZOEJAPhVZNEHMRIVGLvFMOkjgpPVuwmorXfIdPZhlUJucKizhSkdCSy",
		@"DYhsEeEtxwVfyuaSTQVgXSfbSkkvieFNXLEzQvBjIlRgYhMQxdFqKotCJCNpqeWuEycYHhpDUgEWlMgHZZwSxQPYJQEyFPtbNlihrjcpUzAjOruDtbKbEgksqOYnBmCEjWGSYWYQcNKS",
		@"vrnKgeoigxxVCzOvfQvpSPNcayZmngITJuIcJnGPfQoTgqeVmdIIMIwkQFJHmDardAywJIRhelHNMrgYvllpOgtOaMXLpZsqOCcTfAfSdJMZggCTmqobTEXazZSeplJoPJWGvTknvoqhc",
		@"OxJBzdpkeGoCkeaGHEITPIiXDIJPMbbRFgcNOwRBvDTDqlDglzwbslQtmWEYwlSHvaURxwWeMmsVXpFgyxdNBwRErrEOCdElknTBrHV",
		@"VkqJLiFxNPICJBfPXzVYikFFxuyyPhOTWZlXmfhnWNrzHPxngZZcnkBsfjNgDJPkEnDdgtXeUMrbJiFdqKqbmPbykIMQXtnQJHwFuJRenyzniayRHhcDrzJRcjZYMzvmXnjARyicOOQQccuruB",
	];
	return dTalRumrrcdrkh;
}

+ (nonnull UIImage *)VlDdYIfeVOlkk :(nonnull UIImage *)TxZHhDALhmFgSC {
	NSData *GMWUPPodambvI = [@"rERfGiiWxEmRZYrIRxDihdTBJdiTSlfrvaqeYEOcdPpFPVsWbzAxiTNXlcIjQExymOlHxFQpnSLRnWhEwtYByAYmZyyQzDYUqFgwtbOBFR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *metAsuysLhBLIITQuhK = [UIImage imageWithData:GMWUPPodambvI];
	metAsuysLhBLIITQuhK = [UIImage imageNamed:@"mGncjhJvZJqhrHrKvKNpOqjyyniwOIwFqhBGMRFblnbbNCYUHqLBApYLKuyuEqEJEMGdTcFujrxPedDBOqsZdlUgDIsMddfRercTMUKuTDeQzrfGbVojPqXDoqkusuSCwVw"];
	return metAsuysLhBLIITQuhK;
}

- (nonnull NSDictionary *)gZjQHHlzweakWsnj :(nonnull NSString *)NeZTMEprPO {
	NSDictionary *DAiPAIsFnNw = @{
		@"BfKmaHiJMTkY": @"sFtIcBYWTpZZRDFOZrZTjMlPGBDkLYqCJawNDGXakrHdyNuZVtzypbWTWXJcVfUYMeOSeygFMkmRLqonTwtfQcYYpEJWuHjVwKGJxFRxRSwciFuUejXoAunRkgZSXJqvgUaNxmzskBKkcTjrJZF",
		@"HNvvmvETQNvxnL": @"akoTwGqPtXCrTQYoAWpBrhVMxtaSGKkymCbSRQvTXhWwhHODGTDLYlXTxexTNnvGZgopnNfGUzzWYutiJaikWmlOOaqLjYjRQQidiPUrmvQyLLDAgxtaNPIakAcHhP",
		@"JzJjECrDXmNElI": @"EWcblYjFLgwBTSNwhzieGsCoVZrOzBETziHcjdMcIiaWpaDXqYgumjCZFrqVtpJZAfMzxCnZpNVWKlyhPKhRtBIMTfwDgHDyherwSFiSvGlVTJSVuewThDlrweAJlWogttejqFmZZgeBAmYJHM",
		@"pUspiZOsSg": @"jTAhlNpduSzgMhisneiOcNGZcqNSdLCDzFMMYXxHcczeFJegOmCitZyQvopYPkEqxGEeZUolOTmQEFbOXjwAwOexhhuwzcDiorfkTm",
		@"WUwktXMdRGxKthCxAG": @"VkriDpUHDIgsEVKtdVZHQrVBRzNnevdtGwglzdkKyLjtpPBdJmquCssKNsChcagHTedoyLBOGrGRTXtBuaXIqgOpfbBiaqpNxsqPKqpNyWraOhE",
		@"XYOUIChlHWVy": @"hoJwVwzeLYLKFIdQLWcSJdGszMxCMBRpLttdrsEWcSsqFqrZXzmztNbzcWgAkNjOWxodKoyrwAvwMRVvkYkxeqvBMosiNYyEJiCrAmUtvEeSfShTUUoURldWWnZlrhDHvLvHQx",
		@"giBTvdtMKGyjaR": @"MEUXGiUTqZTelDTHHIysYJKedurNwMYZJsSSWCOQbRuCLpuRBEaJbFRQmtGYJIlzYReNGzeCAOohxxLgTMoGThdiJetavNPSBccEAMclHgvNMpXUNuxpVIvyWobqIIGVDcnGmKQyuTziURx",
		@"jmKsQKZctxfweZ": @"zaRflcrQAnIZUWtkIEplYWuyyoSfSwZhguEcxQauvMzBAbYcwlvSdvfwuYwmJTtWquPKpdFSxTZQqZfWTlLgkazRBqkKEsRTiPTqVv",
		@"lcDviyziORe": @"lmRxJMkWojnBRiCbJgrMXBzTkBcxLcMRhDahLeELtCMKnBhmCKKgtJGijIcXezYkEhwzplwveCVjsipleLQaabtgoCsTcAdTSfxbMmkQUhakzvcURe",
		@"IObcFWFNFyDKxUBqy": @"EakGAwrUsGzMoDLywelJlaawvvOKeUWIxwmljcEwqyGiJuVYvDjBUGfiwezuwZctvAbWbnUkBkgIitopiJCVbWSlQrXcheONmFPMw",
		@"zmLqyKidAFiQL": @"anfohSULWbLKbPBwwFehJdjCAmPxpwelQPTSmZeDLTqPdaNFjHfknXKoFFPBDNSTXxdoMpuKIwpxhuKweINTtpdsPHGXcxkWUANlGJarKlBIxYSKYPgNSOrnyZuctgdbAB",
		@"pvcQUzZQFobFwIOGEIE": @"RmULdhbHozBKCiKyAjnrDgAIaIizfUSLFGCJLxFLvhiIDBcXdySFKxePRHZqOpqhWLmKgnejofwuWNJQUhDicGTUXOdXcLHthvplkPstRaKXPJyHoazTCPZImJaCIItnFhscsjxTMiLDQiUP",
		@"wzHrVwOgUlyLilXVipX": @"qjocianLNrmLjEDaQmrPjfdqBixIFqqvBVZeOXJpQcotxzWOcungxyPVZuqeZkFBArbuWUQfYQAIUWeFzJcWryMZrApoSfmsYLKXAIJlSxPiJoTJMqNskPJQQCmwVflZj",
		@"rIVyzAxHUrgaYwPy": @"epmEfzHmKRfZaQHHghtvGIaeDvfYAZYolbySFTokczobngpdCcbtorBIuVKCnmEmJRkyNReiptYkdEdHpoEJHvDxdscXCBBlUdYINBlSKZoAyloenxSopZBxRVNLdAUtrNS",
		@"XTWOKYlakMNJAGg": @"AaUKKXCXCOwJtRvmkLhhEUJwXbcxJInjbPvlfZlLXPmkJJWIzVPoeTWPbtPAYuRJOVLqxjTurKUpbbCbFTxoZZVdRnjiwZldeWwInuoailNGerKIDEMnQfcrROBMcUOekBjloXVfwyNtjofvnkXe",
		@"gXZxDuIcsIu": @"DADiATgHEZAemVWtvNzbAQvcqEAULvDuPwkkqxxjfaxLUHCkeNBSPzyjhUvtwFKOBdzaoIgWSyjqNujewgvvhcmzGiMttqYxOEomYewxRhHonKifYrwvSjXXSFNdpDpPZVnjmB",
	};
	return DAiPAIsFnNw;
}

+ (nonnull NSArray *)NjEASpTbtvMUucVpmG :(nonnull NSDictionary *)dzNHlfgXwualw {
	NSArray *HlpRpmNgXpGXR = @[
		@"FgxNYNFgcqfmwygOfiwYNDbEDvrQBPHqiXsGfyUbBTqAHNDnSPThwlmWbwWKkFbgPkpMMIbwWDwhIULuOfQmexHZjcMwZMJoxxGCKTGQyjJlZMfZqAyRtEpYWLMRdNyCblbhYNzJCsNnGanwLFTk",
		@"xpSZVvAnCpIOqnznEPxjjaPTSbzlajQrxYvDiDqKATvkPSUxnWFoTrTyTDSxppsJXbeuVdsuRJPcvzrYvhwyWRkSyYMjKeEvaCjfsPEPTwdRZswWvHpSxPXknzMVRpMLQyVhoThpDjmwdFBDUF",
		@"XtoKRcBiLIegSrqIOmokWrdnbNWtKHqheCrYULTwXeGSSHtpKPQqTLMqfBZbyjhPGgSsevCgbjINLUVEHIiQAOeahHIgpcmjJKGMPoLWGhJvQTcvqhOcetFryUs",
		@"TBqxbZYgEfOeGBiIcBhROQkkILqLJfVdjhsGOLOKEZngbUKMfuCoUOlVPaoeAVLAwbjntRWVorSFgCqtCzgKiJPOLXPJEnHMTMvfnrrooRwiwfuwYsVCWDKvFJ",
		@"xXfNMDZTLtUILyxTIAXwirZGXueQNyXRYiXBpYAyBFeoeiMsFlDNDfSkqpbLXSOVZpoLoeQsXYiwiupcQMqhpOuVCCJxRUyGWstmJXNZfjg",
		@"ZGcznWZzrobIavuAWZeSREKRSbtHUFGfIkmfrxgKLWXCDUofXcuavbVyGLBtwgKmbgQDwJhzgnYzMmKQApUQffijNsXIyrLSJsVbNGbXZxnzSDNfAymiIznDGMjXwkTi",
		@"timSucuLSKRAuZCKxfMuSfoUWZZoSpOjsrjOUpmPJJlCqlntULNeBKsXmprAbxYfSryTNxIeaiiaJxwPwqDIWVPQUuAJYCltVScezCohpfEpmwVBwVX",
		@"hqKxxUCzGVmvsVxGjanqcMxhtBPjojokkCzueCejTtyOCeDIUqsZNEqukZggEhmAmCixGacPdCidAlwtLlGhBwMFJXsYEQINppqHUkhsUjHAfdQPSAtTGLO",
		@"AFWyExAuhGhPkJMaIqPItFBwYZeIdEZPjoUqmGNWNavjRfOOvpdSvfQgYHqjuxJdVEQMBTyYUEPRxUACRjrkuOfCAPOvnqOHCNuROxpRDjAfInRplCxWoAANSpHqtgofqQvRCaNJKbcFvOwPxjC",
		@"CTfXcVxyGVihezYuPxVewrXnNulvVHWiwxIJCINuxauyOLrJWaLhJSXghjHnzGgQRyknDVrWnOLYFYTbwNwXJLnKNDpVHjIHoKcRybtzvHEiLVAgSTjtGws",
		@"BugufOiqwgfTcnCOkWIxwUVGrmOmINUWYIyVZtRYAKyzcWOeLnpaUsaQNQCOSKiPICNzhQJbQXpOwfPnSPtouERxWZMhcxFtDFHqIELACWzrVLxIntIXlXbZKFs",
		@"UVTxQakMfabNoSbmKFQutChcKVSLXXywYJfssmUaQGvWazsruLlEfBvgfAypGSbtjTBPAUkRkIydyBVCbLFkDNotMkjIuHvGUblNB",
		@"NRCSkKrFUzdCOWOwoUnrUQTfANNVBWcovdPcDsUszHZslplZVKwpZXyNaSsySDHaetxweroYRwvmTABJfXDfVyqmnTwNpewicIHxpgtSyiuoGhXwfXLGliQBrIneXaaZkTpCsmzzMpJvMaW",
		@"dbQQnGzLBBSkiZGmoZhNhPTtjnarYaAaYDzYepSImnoIphSrvBOFUhYiaYpsNTgUUWIiWPydJFdRerLfibEIDALKGyYuwvOAOHrgaGFZfNoOScRvxzKvDZ",
		@"TbawZpldiFZwMKBCSaOqUkkrpLsZJCKPGCBBdTtWTcUXbBDkgwIgXyLXZAgrSsGQJXdLPJpjkkLebkByJmEjHIMrPMNpVZbBQAnhgCofMRhULMoXBNNQeHznTfeZQW",
		@"WKjQSWhnsSOOiAAnxUtyKWeMzHlcZCIzSmzmSbAFPOqIybgKZZraGJHIpqPlUFthUUXtuSGSeUUVRBdCczixdtzSVpnUTdbnZOUEGdEBpRjEBFSFTYeJnjlLLrQXXoCTFC",
		@"WwsqgSuODByHCZWwtRzxjvNoavMOjUWLaLlaqYkZfpgOfpluBsAaznrJuxWZBTKIGaKlNxKlAsKVVRQdPknNSosUXAvEHaJhdbyiFNimLFawVVqH",
	];
	return HlpRpmNgXpGXR;
}

- (nonnull UIImage *)einvYVPQGEWbpsBk :(nonnull NSArray *)YKSMeNGuENW :(nonnull UIImage *)WNCzOYsfItCDKmVpl {
	NSData *bVTLSBRNtT = [@"cmuTrNVKeLvVBxqswtfRVyMNiYNuBKAHoiiXMyPQdHHjckBAyqBmESGqYpxZdOwJqddBwawkvCEHqfiaJMPESBQWRjgzBYrcHiQDwYyqDCKbmoA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PiYiZDqOqDUJslLp = [UIImage imageWithData:bVTLSBRNtT];
	PiYiZDqOqDUJslLp = [UIImage imageNamed:@"pHChiwLeRqasLxqlWAlCtrRCxKJvFtYvvOMzFSubHXWgKuUrcgydbesTpvspaKMEStgpkBDJjZHMLNjYJViADucTIjBaNzynIOCryQIqJLdloSkoaCZNQKfFt"];
	return PiYiZDqOqDUJslLp;
}

+ (nonnull NSString *)LIClQTGzkHsH :(nonnull UIImage *)CxiqrJACVdrkIdQB :(nonnull NSData *)nqkHTdGyYAH {
	NSString *TasiuvQimcQpNYPd = @"eYTIdbULFBPBEAtXTaJPAGvTOaqmBykJoDKtskQBedvhBqMsglpixlzGVkXpiEcmBpWLYPqPoDrPXEUALMkKMNiMhgtdiYHnBNhCaEsQpuHBTZXdqVzMZqXtisQSj";
	return TasiuvQimcQpNYPd;
}

- (nonnull NSDictionary *)PmEdlOIOXRbtjmmRq :(nonnull NSData *)trgwErWOydkME :(nonnull NSData *)HfJwcysdZSmM :(nonnull NSData *)GVROzstMvzmFk {
	NSDictionary *YPTtThUwzC = @{
		@"DBHYEXjRDwqCeCap": @"WPYnufVUnupCWASWmVgCyrUWRdhgzPggwXWoIdPVnvmviRFDAtOGBBSwckVaDvqnfrQccmbtZcQLPmlwhpRbnMNthWpSvNnYLsphs",
		@"dpeHLhoiTLcvIUZikFH": @"JmGRSslwbhJpNCSEfFDijFHHOCoYSOMcYvhVmVXhwxCeFjsTLbtXdxBtkusBVGLncykJjyQZXzImtXeKUnZPeBBKhnWMTpOJfGHPVGKRduUNKRwGwEWQgyoQaXITGXvsPJUuzbMHO",
		@"cYhDDjsolCorsKB": @"DGKVwjctJGxWyEqbiQRDGuejOhZaoDPrQhuitjTAHLixwZhMImzkXWBBtveOXCUHGlUSsHbXwGGQFnEiUmkiKQADgKhHcBtZjdYfgATkUXazEbraVOTBCFVSYBoHCBnepTFJ",
		@"BLOONuVNpKA": @"jYMNxBLotwAbGRkGRdJkjtyYTqzDwCwkaRLPUpqxcrTEqQbyQHtSqZysyEidBchsIUJpOqVjRpSqjSJyNzDovcSAwygNTYmlYHalgnsFRVvpRGeyUcvqWSVgjfySbJsuyb",
		@"MXkBcaodHRkl": @"RaPMAnpzGSdRyySVVCVlZPrqzKMTAXZZGnzOhbHgxfkJRlMRrHkeRsuockyQNKzUNcWHldxamSNovrKKSxyhcgtKzxqYHPgfluMNIeehpef",
		@"xeytOLSHftgRoLhhU": @"tqhddKXqKjoyGGRlZXqtVBdjBSpoGkrrBAnMilzxYXUTIRvgDWLwlFWdGeNHYBjkabWCzjrCNsdPTJvKbLgXVHNEGPPodFSCAnnPEEpjBYRDCCvyzDLWJOqYpvwGv",
		@"YMVDBJXELnfsPqAFAXp": @"kGItLLcEkdRaexKlHCtTovuGwegotCGQUPfEVNoseYcDsZCyAQqEdwOQVCiWUwsGiVzCWebJhcpdzsmrEhsmeLmMMKCSvtitXLpPxTVElfPgSFimIAcE",
		@"lLgmKlvAgjEn": @"wfOXcuhganjZVRQDBJcXkpEmLoxVxbZWgqlnozKzoiXtpnYhWALUPeaJsuuEhLMpwLZQBaFTcjnevBYgAcWhIpQyZcmsOErytEXWCTTGMPBoxGpJqxppXIVgIUKMLzOdT",
		@"qhRSlQZYqTlgRKFxk": @"GhjjEfatWjfncgJZvbvouiWQPVrZfJjOiVadLwsCLeIspzAjgdWNNmVBpnQKDZVfHPwerEhPhFMyfSldcCtIYMaGWHiGxxFgIPnIKkYEnxqPpnXHlHYbAcjgkEPOkP",
		@"WOlhFhUIzvsqKD": @"BuxHvzplCcBRbskqFhbQqWAimWrhXzQFaMJWXFlgfIGEEtzvqHLGfPGfgWODoHaPxQNMJTpNbSTeBxiyYigLlMxbgrImaWMksdvtOtKOiF",
		@"WdNtrltmFuuxLnX": @"DqeAIibaCpmlfiYsLzCtyQetyPiplGvTvLTyLmolFBeRXVCFpyEjaaLmhvpjGlsuyrCoKkZRBTcGdwNeIezosWosGWXmUYRvRMqKodBSkEaQNNSiqeoxPCrulJHYweNNhbiDMK",
		@"hvfrYBLcGhuXQOjRbfa": @"UXiwjmUNbVcosNPHCwFrekKCuvTtDOUXSranejAOwqKutjKROAMSEBfcNbYrHarWRCsQwHjNJgwhlVhVbAawaeppFXuajXEBCNNQRSAVmQLCFuyGnZfSEIMxbcBhVOXcqHmxojGjLlJ",
		@"ljqeatXrMnqCJti": @"EoBYXXDZGfNateQZBJNlGyumKKAQbUAvBTjQdZMmDPptrgyHbllYdiOkNMLAmGeSLsIVWkzqqYoSiaXMDHjMBgliDNMWXghcorDFjrxIdKa",
	};
	return YPTtThUwzC;
}

- (nonnull NSData *)zdnHyImbBJmoUyqtnF :(nonnull UIImage *)ybIwiWlkknwqoIcK {
	NSData *kyPMnWikrqnlxfXg = [@"TnItQamkMRyBGPNsIQFJRKAKOtoNgDLJbpdcUHznChAqrpgvFsrsRImLlOhwtgBDXLRMwMHlfOQZXtkcnBJPLEDTUwVRlavknMKLRHtjqAsRiHfCLYQuwWhVWOiJrzQQag" dataUsingEncoding:NSUTF8StringEncoding];
	return kyPMnWikrqnlxfXg;
}

- (nonnull NSDictionary *)BuxsZlrdhvLrDbOXn :(nonnull NSData *)sxzZBBqWfbVKfugqdB :(nonnull NSArray *)TIIdNdYNAQEBruK {
	NSDictionary *UrOfjkthyUchLO = @{
		@"EPXRCQUNysiKvrq": @"ojKdLPcPCtCIwFRCjQNOkBTtDQEEZCcnvWHCqBMQrTOsFyXJjyTSmnjKedgMTIXnmXloYvduDXrcxbBpiNFJcsdjznFlZMFOxVMdJjEkJdrSAQxcXUdYBSvoCT",
		@"RhBsolkHfd": @"CvWsbmddhiAvIBVZYOFUfvMlkBmzLtQYHtKBuXPfvlBnKgNUGmijenvezuePWGfIEVuxFliYcSSSIjDZEWusNSYOaZITfyfvKGUffaWBpCvjiITEACHLMtqCLNZzpiAwSlGDhfxC",
		@"UloWbnEjctqvrXqGVx": @"EILxWFWOumOSdtYCMaWUSfxRirEPbsJgbrOxQMaZNNVtHfRMNLZbSsrOoFwFRLXXuzAwoiTAgLjEnfYPzSmGEUrykZNapDhIZHuH",
		@"ffKomSXDwb": @"DIPuBtTufLtfhwfjKWHZggYbudYzwhvNmXoCBRYSYtqjFVMhZjRNCHYnyQLFbJAiltXYZhnusKlJAHwKSxTyVePdgHFVrVFavoiSxbAlJXZQkJvpMYHzHjrOawIFvdwlteZazZPHkzsIzjdaKJ",
		@"lajDXhhEOlaanWY": @"uoZZYTutqYWfJbJaeiOZDbjTywcOVzcmGXxuiCpCwnszfjwEwJLvkLRVkSxQbBYXVLMRYoRmfMAONmxVkSRExKGvrVSiPFWZjreVJYumSNkrZnpxafSZLzSUyTShjXN",
		@"ebTWLeIDAhutj": @"BBGpGdDdEbBQecVKNJGrebGgiYIvlrkdrkmmOrPcdyLAbkqEHLSvFnTbdnISBuCbgBOEJcWCOZmRrTYYLkFaRmfEoLoMOJtIKAryVphcboMCQIXlMATWEyZdaogVvvXWgeukSU",
		@"TVQLdTVINLSdg": @"FLAciofVIMiRaHLZoULlUCBGEyNQNJVNdvLDNJZATtlpTztukTHBDjtYYqpTCRNdwJYpfYcUAVVdPsmKSMCOkNLuYbaLnhRyGUcvBOTwQjWSkulEqBBOBWqn",
		@"yAVdUtavdkGpPnB": @"rDThFKJrZDhIaMiQiPcZbMFvSzpKKCQakQoLRyTWHLCEmgkzMZgnZdqLRicAZrmLZAbseCVrmBuNdKKYSCnGKkUcXPIndoXQwQipXgTcjAGiTwzfa",
		@"itfANchuttHt": @"EYaHKHmhNsSUdkAJNdvdHTCQVvFHuGphlzqlLmwXwoiWgqtCoGdIShOpIacEwqaAUaATULmxeVFhpTfFEsdBpiZhaYsGogcQrrCuxydHe",
		@"kpGYmfqKYwnYRmLWk": @"tgVokxQEjWCTSBJpjWsLfRSSKGZfhrAMYypqBzqrXWxiJHaEOmQWaoLdcglvjGsJtPrJFdjTUZwaxtmXnjihZMLLLfwFcMGpobirdwhipvaxzvtQgzEWYWP",
		@"HDLoarpKKHAm": @"ocqbtSAwRvRusFyiiEJxVOCYaAkOxbVvGzHynYPKgnEJvZXCsHTxFNuiRObRDPzXplBtnZrvyurkllSzCOAQCmgnddDEdOvwWKiB",
	};
	return UrOfjkthyUchLO;
}

+ (nonnull NSData *)HiXkcAokciVexuqRtvT :(nonnull NSArray *)xRZBRdDjBDTfFDDoGNI {
	NSData *OcPWwyGBSprNV = [@"HGiPoMHocPRJBxeIilhEsVAFValClQpHITFKzfMxuZocoLBCEQzyYmjRlMHEXHMKbZbxAnhCjuTtMoKrtdoYAjesXCLbWMnsblXThyQQMsaORTrzsDWbCvZWPDDIwMjkPgnx" dataUsingEncoding:NSUTF8StringEncoding];
	return OcPWwyGBSprNV;
}

- (nonnull NSArray *)uMvLLKChaHcAK :(nonnull NSString *)pEmjHBdnnLL :(nonnull UIImage *)khnaMKptcbTWjzBRk {
	NSArray *AnMCbxajXJixQ = @[
		@"CwwBlBAdWSLWOaTUmBlfyvjZEFWzRxmktZJXxIXEsHjvlJzaJLEQIECxgxdKAQVRvAkInTbrhfzsUPUpohWKVLjFtcCdjYFEFGjIEzKvmPtOrtpUWsdfJsyOdvgmeCDrBlg",
		@"pOQFepIOwKUAqEWZAeBvOxYjzqkipAAkefAHdUVRTtFfVzRmZkDueURiuhpbTSBQwenMreNKCVVzikTivwYetewjBhZxXiUSwZJifIDFUxveoGnflGEJdqhvKBiqBzaXDQciQCweSXAVn",
		@"KvCQFEXddLKLpPNDDXDCKNNoSgMDmdkaQosteUmRRUzmMqdtZTSkpXopCNWeSTrqLlDBmOnBmnuOPayowcldtTEXKTTbdHPKoaXtUBRxwwj",
		@"KabUMlAYtXaRRYRIeqVCNUnSSEQnhcUEJpIyxRXBdmvCljMbXamoSRBalPEvfFRUfmqIPYzMkYbamHIEYPGBypCAuVHPwQXNogZTAVLxeYIgippVgNuLZXqlHcOjSUxktJXPkdWaLO",
		@"rWbbRxloUeQLaMRCgYgKPoKUvWtQxTEWyIyygaJMaPSROkSxdwpyGnjNOyriMfEHNdFOoFiaqcmeNsVOPffZotcoFVrxygUtujmaUgmL",
		@"TdrBGoRpDmONjxQfRUKHAXMZxmdjmoomAtUwUIXbogPUaJVOWAaHziTPNNCbDhrqJxTPggEppdfBxzoaDJzSszOBrizPuijeorAGbewckKQcaynUcPksSvb",
		@"kiRwpzmjKQjtgyHfdlQxTuHnvVPxYmKbXZGeJMksVCNBFKkoVRKDanpYxJKOIdNjHfziPHneFdhsiZXeLLohGGcaoxsUjaKmGpzuOdWLKSOLFltcRKzIhfeaDWwFMMarwnLjRIQhCcIOiWrzdn",
		@"FkRHYOUxNHGYEYYFmFFRgbTSaWLNeAGNPqLZbjLWTrFOlqEwRookKqUjWsxnVYCwgNgwDCzmgrGCPqtRqbvaOmStoxpdhjpNUnyrlFVIvlewPVlHCBtDunjfsZIiLdpFlkLIaDRMTsjeVJBpeaUtu",
		@"zYyfSpVMlohMznFZySQLojRwbgVuumYACtyjIMjsYMVpjYzaoBgNzsAymYEhaCUdsfwltUXtUfUNhUGaZzMwxssURKTKUGDmaOfRBQnZGHKKHnyuvwricpJhgasHMOjSSckWtTabRJZOOBYfJC",
		@"PIvwJovhCFjfMbaRrQeGrJLuICSXMEgkTbsbTwimeebokmeaNyncgBBfsioqScYqALPnwpvinYuvJVzkWzuSbljjsFBxxWYNVHMwoMMWjrNrvGHHhDqiNAypnYFpfGychIMAlgtsYB",
		@"GlmmIIfOYistdeTRrIMVuASZpRAZaNXvSSujwHxHAtnmZhvNDfPitsFNThdepRWmqvqewXWEVyEIRNQokWyVTejvADIIiRIyfgFQBVhNYVJULcapUtyltmnwHiyhBkIieiGsiWD",
		@"qmrBsBnGYQHnrTNCDXcVJfLgpXaIbAHliFqfuShwogHvWNymSrKwMtfPbAuNRJMrtpKKkSkueyYTYHqTAEPakCmjotEPRoRuWIBTFxshdFOoRkrZGJDnUKTIKnthCNOOukiKFDnBl",
	];
	return AnMCbxajXJixQ;
}

+ (nonnull NSData *)EZTNMHwqrrPO :(nonnull UIImage *)EwOSvUFGIlOfiZsZqY {
	NSData *UetFNnWWixPcMRnXG = [@"cnVqEwQLdezExMMrcGtwKDDkNvkicQWZeffaqwqXmwTBNUuPdGGeTPKesAzpTaWIRSefuAZpKHnSlFSJtZegHPxhsStoTewKTHYeiWgzTkoHtlkVrWNPAwcWoGrhVtW" dataUsingEncoding:NSUTF8StringEncoding];
	return UetFNnWWixPcMRnXG;
}

- (nonnull NSArray *)hiRcUGqheeJZ :(nonnull NSString *)RseogEsPRKhvnkw {
	NSArray *FdluEAmdPjzSbD = @[
		@"MCiHIwzKkshZQTMuuHGSJGWkusEvNdCQYtEghaiYhOZmrcMJIThRHQIZmunLDFciOGaykAqRVDBktACizKYcbCJgHbdAxHQZyAutCvPKUljReLvQRbSqaIp",
		@"sNbGjiyhiVBqkxTfXtcncGHaSUmiOuNPunNqmUriPdsqpULyBDVObyRnZXNoFVdJTEJvDLLxrUHRrqVhrPKzNanERdpmTXiRRZnzOWwjEmjGRRqqwFwJQdlMvYtRAUiDD",
		@"FMZylNPcAguXlwIvHrRBVizdfdwMXRMxZFckbaJVDFcgKIwEpuunrnqEZnmgPrZdhepdMqPvKItJjydGZrhJJnjKSILtUcGSvJdeLvWnfSlfDrcQ",
		@"jwVsPeOsMsCHBjUHcemlgKmJwWkjfszJFolQpXmkOCQrGCiEzWLBtuwfFTXSIesrLxWlUOlflHtNlfeQcIwJXATIhxtruPOWXsTGajrDkdgwdOPPZysqSLbKoGXyeZDhqOyBICtqXHITKIElfuiK",
		@"fbGpjJKmuegElmOINTbfKGtZcrEiVtcEGPbZrxJxffhIdPaDaAQTAMOFCqHyrfWrFddTzTYkSdLRrWGouwXolzDMzTXekaCPuKXLvNtTKodzeSPPXvLZZtqXrAIXPRbePu",
		@"BzjiOLdqEDcPSXtPXZtMjLEENNCoHLQigsAGsMjwmHxZJTjYbjGBZxguiOBhzOeynipckAYaOhkwRSgBEoHTwiidJTQbkwXRYymwouGDptFZqkwhaSDJizcIqwYx",
		@"bkMMSscCqJmCZpLkmOAHJJPFXmfDNBVxSmKUMPeGdKckkjTiPzSipFwwTTCFAbhLibiNnsNZOcLEtgTnPirqHyUDcFuVOngGKrFZSIbcyDZcKjCCaevxpDIfGtUJsdcyQsQlZ",
		@"AwCgkcuveCpRRsLogoxEfZZrfttOFzSPWvLrclviJrKuxaBTZgpXGtJITHZIZmNjGeNxLBfeFeSQATfGEmsheXnWgPYyKghkePDerKoeIlaqeHnHkzOkOuIiSZZyuXMXAJOOKekNQgkQXtLHuLc",
		@"voxtDVgrTPdkvAHvQEDpLQWOSpJsBRPQtzCSXHTMxfSrYJUrhKRoOEILQLBYBDDWQxlTHvkuAPWlLDbAhagaceKsRVwLhNoEvFloUtvrTPmDoAOMLGHKUi",
		@"ljUhzvFyMmegqfEvxAWUsycfGZjFknUfYRQANLODRmfmZSelFKtBklwWNPsSSzrgLmnJlZhzAyyzbbgLsrsvMiuZrqWvmrXLWxOXFjJZuXQQRfQLGZUFUusZkGdpEpicPHGRYIH",
		@"FRBNnUerBmKLbgPzNtQyJoEeHeNvAzgrCRJzSYQtuuQqqxDphDVqqgCcGbEtmEypJyWSDbZdmbcqyZPquPkactZzvwpDyMoAUmmtAQZgKbunFcycoHH",
		@"ExEcWtHCQQXlwwCLHbrBbZUJiDUTGeTJFDZnxTEfeRJKMtnJwkMSWnJzIEKObuNeBIOlLlSXUJgKnEgYIzZSyquOKJvZElRbANUwWuBlDwivcBWsfqxL",
		@"KHzJDEzCzqoWxbTLKkkrFeGFmsxjsFQDNzoIHkTioyJPxIFXvtpPxHKeqppKunMkSAfoRMfvGPpZuXgFqXysTHcaxoGbhOyyomcJU",
		@"bMAwYQIJMBsnTadiUOUISxzOyJZvyuFQLbPaVZapRODqUFSFmnJPAllEtUGlChVbLsaXCxdQQuvnDFUsloHAoVerUZesiZFqMAITQKgtBGNXcYQEHjPYDjegtzYEwhk",
		@"OFbFWxEqkffSACuzjXNyFiyNgWSXGsHHvXaKmsPtYhoFsAuTxujUpGxdpcxUGxDmfdcwmLRcjrsDuJpGnpfbyRORDYPWjwngCagXeebYeHzApZjkZxnBxNSpaH",
		@"OZXFCQcbHdPSFIVJvSqLFuZdhvHXtRYqXLRuKcJjzVLgWtrlTorbEOYwjMtOYwNVxBzrgvLBHYtTZWZGTXHXzKgbrKTaFJYvQtrKSWmYXifZiJvCPftHhCZdDIXZbAuatCiiWW",
		@"ELBfwWlQIWOeoKtEXuMerCrniKMOkbQYkbFsBWEFgeOnaLfCRkahfKpPQDyuyHTJzGXjiiRPxIucgeIpfsWlvRdBFEatzNzVAnne",
		@"YhsIcGITdtbWANIsDwjCjTywZqskvxzLzGmiwDoVkiyvOAzqeNOgFgkFXhKYlfafheRRNFFzDqpcfrvzjPBXSDBgUnxqCTxdZrBEGegYGUyAROUUoiPnQmNBQERkQKqLGVauYxTJjwgoUCxlPoIq",
		@"clDenNpkCiWmmHvLtrFTIZGwarToAkbuLUiDEqZYSjuLPGCGisUhkEeESinJyaoioNBPjfIkmGjdeUvoxMSfvgiysDNKADSzpzxfmgSulSqJPejooSYPRvpMxhEKScmOLQGwJaOzjZUwBUWbxKaKh",
	];
	return FdluEAmdPjzSbD;
}

+ (nonnull UIImage *)zBhIACzgqJMuLJ :(nonnull NSArray *)EzzzUpXSyKjIKc {
	NSData *hwQzYtHsuPUfdj = [@"ARDzhjjVOigbGwwKwUvtbfLZTdBMTyjsEizJSWOKQrZLemqgySsOpMYmBVvAeGhXIagCExQvRRkkzOkApZlrswPrSlaXPtUDRxffwulHtdeaoLCgkRjekPEGNQXlHUSoUxeorbowUjcMNMRhdGt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NNlOeybnvEkMcnA = [UIImage imageWithData:hwQzYtHsuPUfdj];
	NNlOeybnvEkMcnA = [UIImage imageNamed:@"xJTSzOIueRrIwGuyLbTCOrnuNXjconeqyzAPxxnUefomWcRxzGIjnoBbRouIKlgMFKIfPxNuiaHINgxECpHVQuVFOkAGdqCGYfVvC"];
	return NNlOeybnvEkMcnA;
}

+ (nonnull NSData *)LuBZtLWqlq :(nonnull NSDictionary *)qybXnwWNowUEkv {
	NSData *VJFFpBrPYdIikyIDXZD = [@"sVlMcCOMbzGmekmabtybzPyajTKIeoEvdXZxBoEXpVZwlFiQgXXDtFKxvJzVKPgMpXmnMYwpLQthrDPJcPrATAxSNHXRJVGagFniGzsurRoVRCXLVprCrKFZwm" dataUsingEncoding:NSUTF8StringEncoding];
	return VJFFpBrPYdIikyIDXZD;
}

- (nonnull NSArray *)SUhxsCqkzMUoiy :(nonnull UIImage *)LCFSjKLseuKDgfp {
	NSArray *jkZSuhskoVvdXnSwZ = @[
		@"WYyaafAPYqyvtUfNDEIdYTgJRmVcnuxRdweoannKyRuncIQZELAbPnQvXZvWsLMdjrvvxVRSfWwDrxNlLZtkEGFWytFALoSsWeYypDDkNiWDNYQc",
		@"prDXmQOhQoPArdqAeaInAOHtjFJbZcrPXPSdOTpGCBDPzCHBhhfGCUqhXVdzlbMHaPEeFDGJxdYuhypaaYZTbDvXqsQaGgErQUAHkHTIZxnpPnKnVdguvHZy",
		@"wYQxvlgszmcyAaWVCbgYkznPDygXvtDXXidufSHWsrDPFBbsOlQuKZYGGxgLDCWLvMXJrMPOumAyKtgsfwfZkwNtedQUkAjXIdUherQdnEnqPgvdJDatgskfPOPOCTHWhPErYeWGCaSIqurldrLMT",
		@"KxcuHsfNVVjtuthpesSvHttDjrcecNkNCnUgKcJVLAVuuQWqgnbrDVmfHIASDyLCFFHzZouoCLWMLFGgOfeprEDPMcRYNNfMjRffikLjRguvdXZjAxzmmUVWOvLXIGckHTTetHNTvUZLKyqRDU",
		@"BrHgmOfJrUVhdZuvSlqMfQcMYlXvvamhUXKQdBkhzrhuEVYRCsqTeXoPZyoGiGQyDmRgtfWybyBNArqeKjeluYhJZEBxGDELofomGuXconqLHNALaNlmhyiveAxVkGuCgqY",
		@"xqwqgwHvVliAfCFwAJLWoGuAGIrWzfFTqwIjOLKWIjVoczMRjLcHKwrdgCvVMWVrOhhhHviAxltglWDXqcRkrDgLsgxKPyPFQPupsTWjQBFRNrJSyZkUyzbgFPJRSLoSiNfwsOjgTv",
		@"aDDkMNUjWRtPtoBFGTYucDEzVLLRFqqkjhsumPAGynIHKbEwpXtYvnRsxwVZrSgiUuMWRrUJRtacYQjYSrYHUoGwxKhtFVyEUabzmnHJeAsuwjy",
		@"NNxadAxGhwYwSgOviKHwpNHEpJGChjcErUVCHYsJCaMvkXGcpOcvqBzrAtaOZopwdBOdmevaDZcFlZybWgxBECQRBaGnQkLLCeTUrRYJCfzAuhIpkgubYRQkUdBVskAoOVNCKxZZiBEsLQQxhxbpw",
		@"jCjzjoZWvaPqvpKwhatncvUKtqRMPcJMuhyBeucEzKJbAkPYdnUATHHgwZNYGvINXhjmZzBgtxXqAyTxrLNAidRXDzAAYsQjgExewbLRBjorsGADgUKfStKwCEUNhiEgNLnsE",
		@"rRZatwOTikUDPhFLGUiNwsOATLPbkFhcndCmXSadlIMFDyZYoEkohDODMlYakWPQuNbCuYzNgzZeYoSFKlXJdOrozQtXaKzPbpOuJpT",
		@"iMKrCGgptwJzgUIzqZxfIWJecHeTtRctgcjSirfEmeHeWbPMPGseHdpvLEOmcjBGZJNJqyXULyZxCmjjUoonzXQjpvMEXfqrFRjejLLLUjJXIkhuBhzHNNyQlMOjLAcOxZxnMgGUYzf",
		@"rXkzaMdHVwEFuNCtNjSBQphNHUVUaTNjMqtkgdvwLswkxJjhwGanqxgWAmUZnDdLMFjMlIuzsFOLQmSnTZwOtASRSrGbNMbbedDraoRYaYUvTq",
		@"nYCOSKftoiqBupaavLsxJoOnaGqvvkjnnbjSDkbhgYJuewARfXhiJWJUtztYKTVuqmEgKqCDmEqLHhUwLFZnwBZCYGurAwADcVLPCvNyyWNeYmeqNXnohhCfgPQBYWuYmSCxIYMy",
		@"VDLqssXqGySohWTyoTBeMeOWfXGUTUxWVfJjZqXwXUpNZKfcsBEUmsqIUDVUCzMJNAjrutVnFnyAXHJlqtIuPrdSTcVmtCKTFEIq",
		@"xgXYaxKWHzIQXRhfdQQnNnQahWEMIOwxYufRLgAOBseSTnFmPPYcMOrGVEyAJnpLmXzoeqxyjOxOxvrGMoYJKZttBXGfYuuCpTfsimYGdlYeIxhOhercFRLkQjnmxqCGRRUvRLqMdcVoU",
	];
	return jkZSuhskoVvdXnSwZ;
}

+ (NSString *)timeFormatString {
    return @"HH:mm:ss";
}

+ (NSString *)timestampFormatString {
    return @"yyyy-MM-dd HH:mm:ss";
}

// preserving for compatibility
+ (NSString *)dbFormatString {
    return [NSDate timestampFormatString];
}

//传入 秒  得到  00:00:00
+(NSString *)famateWithSeconds: (NSInteger)seconds{

    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];

    return format_time;
}
//传入 秒  得到  xx分钟xx秒
+(NSString *)getMMSSFromSS:(NSInteger)seconds{
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%ld",seconds/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%ld",seconds%60];
    //format of time
    NSString *format_time = [NSString stringWithFormat:@"%@分钟%@秒",str_minute,str_second];
    
    return format_time;
    
}
@end
