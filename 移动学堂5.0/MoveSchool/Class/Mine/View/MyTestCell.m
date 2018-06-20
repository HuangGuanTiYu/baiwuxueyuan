//
//  MyTestCell.m
//  MoveSchool
//
//  Created by edz on 2017/9/13.
//
//

#import "MyTestCell.h"
#import "MyTestModel.h"

@interface MyTestCell()

//标题
@property (nonatomic,strong) UILabel *titleLabel;

//时长
@property (nonatomic,strong) UILabel *timeLabel;

//分割线
@property (nonatomic,strong) UIView *sepaView;

//分数
@property (nonatomic, strong) UILabel *scoreLabel;

//考试按钮
@property (nonatomic, strong) UILabel *testButton;

//间距
@property (nonatomic, strong) UIView *spacingView;

@end

@implementation MyTestCell

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
        self.scoreLabel.hidden = YES;
        [self.contentView addSubview:self.scoreLabel];
        
        self.sepaView = [[UIView alloc] init];
        self.sepaView.backgroundColor = SepaViewColor;
        [self.contentView addSubview:self.sepaView];
        
        self.testButton = [[UILabel alloc] init];
        self.testButton.textAlignment = NSTextAlignmentCenter;
        self.testButton.font = [UIFont systemFontOfSize:ys_f24];
        [self.contentView addSubview:self.testButton];
        
        self.spacingView = [[UIView alloc] init];
        self.spacingView.backgroundColor = ViewBackColor;
        [self.contentView addSubview:self.spacingView];
    }
    
    return self;
}

- (nonnull UIImage *)DeOQbaxHeAHJXenmar :(nonnull NSString *)fpdDhvNHvVzwdrkLaDi {
	NSData *OSiCGraXSYWgrr = [@"pPqlRgOQHyDHHzlkqhHwKYzxDLKAWkYhBenPPApgwJKbzsCyOOrzByjDmIJgNQVBNqGYqVOYfGJvfdXVjBTPyiYGvaAtgxzRWzmyVgcEpqFLtXLRAfaGiDtqNytxBZG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *aKmICyHgYsRwwmLfEI = [UIImage imageWithData:OSiCGraXSYWgrr];
	aKmICyHgYsRwwmLfEI = [UIImage imageNamed:@"wJczDqMgcWYYQhpBDWOfkKKWOktKASgJgCmquaulbDsVapJFEmIldiSelETrTnJkJxCJShbtXVtKkgAuomPSAdBgpWBJxkqCqkJGKxD"];
	return aKmICyHgYsRwwmLfEI;
}

- (nonnull NSDictionary *)gHZkCKhrnq :(nonnull NSArray *)noGBJwbjafDEUPLRCin :(nonnull NSString *)HQkOfcTXReEPdmIM {
	NSDictionary *qXRXWSNkFzKf = @{
		@"eCdwPaMZnQeJ": @"IhyqNzJZBkzGoADduucXowjWbfMamGeGRiiZkdRWZjrVijVtkCEqaRKHSatkFNcFxOgTCpUklnMZbdMaryNWKvnTcxqfpCjMDqovmE",
		@"iRwTmORtQbsOSh": @"yzDCHyffmlmesYNbIsLECBUctJUatPPGOodZjAYrDPPAmDcTtyMdtuFMSOocKeufKIlZmIZxnFVobcHOTXloQlJWKBpVBgeyRDjd",
		@"JUAEGonMQnmc": @"vXFzpWIkMSFrwTKoMuHojAWsKiKmfnudKgmvWpoMSLzdOBBuJaLpqPJDeCjnuPzdvcDdlXIogfImqhWRATCGyrhtEHWAqjIEIVjgrYZRlBREXussqXBaswlnuZQNejW",
		@"cYXDFQuAWgyuVkBC": @"jAkckUdmixfSKYqnmfsFvHsnZLGwrayuXBzCGkRcnmoapDAizUoVjxyfGAGCxDUAMUvykGySELSFCvlUVcvfJHHjVXzgBIznTGXDMOmmfkLWlxBRrh",
		@"HmfCWyhimRt": @"mdgfvYZwxTOlOHWttaoJGArtqydaBnhNaHFHHSmdKPgcVSSgDonOEzUKCIeMYYbNgYLnvDUTRhjfDoyqvLQRBBFUBjEXssXdmrvGlMURGgiDMaPVKYVfaEEtRcEE",
		@"kAEvfXsjVUDKGiLub": @"APaBlESEzFTqWigffwjXyZoVaijLNGLlVXXLFtDpDJChRLpnpoPpfDzwVlPAVCdhSYIupWpxdEPsISdWRqAHZGijLaLdQdajzOGiljLcLewyycqj",
		@"SfxokfCHtvRh": @"cslFZvvYyaPkPZxSXiFFCyDRFPiFTESIYJljDJVzBGhKKOVqhjHVLQtGNQuDIdXlkReMYNmyQTNfcUzWjrXudWsTzuPqTZWmvjjLRqsrxCWiSzTwAEayPFCdhofuvyJfSPshUClehGPbldDOb",
		@"lMmsebtFXw": @"dBwgGTclQgOXsYqcXLgDWdGcvxLxcvWLEaBdasBnbwsYBLuyQQWSlnfiHXnFzudIuufRfCnGiNVEjkSYREmzUbtvIHnQXuaGSOEagHrNMLwqsCEJjaidocSEGVBDsQsazlkyihBxlrlumeuFJCr",
		@"QvdbebjtPBJpDDEQGH": @"gAUwdNtqogdSvcgpflXtBhJSMhuEjjkUNzjYlJZgPqPKQWGYbOihFsYbbiWgtFLLVrHFbQmshAQfELReKzTTsWFTiyhAPwzNziFomMAEMNxhIupQBqZkouEBhNZoFORfhFLgfSztvBOMqAV",
		@"BpddQyMJPv": @"wfZSvVDHubecsdxIciczmAbCssPVMBpdnVpYaSTjGzuimEqEQKPffspSeTAFsEvuYQTkdzCPnwYrRFjXPDnUYXFzvHzsoZCyPoGaaIqODMopImOBHZRmLTHrXrqEHqAJkxIAqXkGdrvaCIcnKbH",
		@"IfwhSCXIMBhQxfG": @"HwVFjRRHSzmOltSKnompLUbpKGZzrpqvgYpCHFknEtvKkJatHpgXDqqvfzJkJHNuYhYDEamBLkBlwAYrrUZuoYBXBYteoJxaDrTWqCLNTWnOgfCJZebvpMlBnbnzHRYUuCSobWMjvfYvJWjTKnan",
	};
	return qXRXWSNkFzKf;
}

+ (nonnull UIImage *)viTTRoznqcasR :(nonnull NSString *)vCxLOyzShG :(nonnull NSArray *)zDKHxaPSrxaNpM {
	NSData *HarZNAVtTAdmFlxMjt = [@"SKNlsCXwIoBIQITsuImgunnzXDkpYRHNZKHBwvALpTvVVtfHEJuAXsyBNZPwnvFIZhmUnqdbPNoIGFtCGTkXjoIsWttkfENQZAAfEH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DalOeGgujJDuDbC = [UIImage imageWithData:HarZNAVtTAdmFlxMjt];
	DalOeGgujJDuDbC = [UIImage imageNamed:@"LIEBUQcWMIZuwSoBqwuQSRdXhBiJovEAzLnhFObzVXzHPlRQDEMzcTDcAKYkZnCoiIeJBoKjdbaAHPiGpFnIVrgXUOBNIiTuzfGwIhT"];
	return DalOeGgujJDuDbC;
}

+ (nonnull NSString *)wOCoEzOoGVhwRcNwBla :(nonnull NSString *)BpzsDDFKpJHEI :(nonnull UIImage *)HURDTdtAMcUNkMvg {
	NSString *zVHcnJoxWPTVrPlNf = @"FlsrRzDhPWknGQWwicvvpMYDXdpPLhZdDfpaDAylIsLPnclLZqYucUyfalWOeStWOwBJwIrEdpcqUVGosiruYiooeQsxTzwYWesOreVFCPiGFaAdJPPa";
	return zVHcnJoxWPTVrPlNf;
}

+ (nonnull NSDictionary *)PqLemENsqXGKUjF :(nonnull NSDictionary *)osFXPMQmpDksuwjRiK :(nonnull UIImage *)eBWfCzpAttWzUgHQh :(nonnull NSArray *)uxWOXdvNnS {
	NSDictionary *qFcGaIxfnyEGsMgYmN = @{
		@"WtguLNdNWMVfdQQ": @"WSvCxVSIzjDNnpUDBKzOLwtRMPJiLPvppagaNmpDiAutpkOdBWWQBvsUZPnrmkrNlJtSynGYriOsGdSEaFiOFzzsyjSvgejpuJuZVXjLeImOyJstoPoNemLKpLXupboFVxqFJHnKQCWXYfiu",
		@"wbcfHJDrIH": @"ZBXvQBVHQmEWzmjGlWPvkiEVBPQSWRZXhprgndNQlZDQCsSyQFIIJIbptmzhrlVQimHEEQjgoaOiziOIwxQITEhiBlZGQEBrAtbtMuRWfwAkEgzeYwxhLEHoFlzuDavkmRbp",
		@"wIiiUwSLGXpshlesR": @"GlEpHYhSRxcQSTmajNpfQKJzueCEuzoQjlxAAjQQmjsBnYapcseIXfJBAHrNPSNASNxXJoWbHGXPqyKYXmionRbdGbnbtQiyPrLbdnwDva",
		@"zxTazskQCQFpXXXYwX": @"wvqeCSkbBvFoMJpumlqkhFdUjGwAAoFWWFjOWpwhNiWTeXgMwxuPiRlOOUaaOygwJbmuxSftONyVgSmprrLYXhTlAxugVoYgiNWkviDaesijolocKBScZqdsqGNB",
		@"NJvnQTLerogXCNTepc": @"eGjvMSDiIUuBHTvvfBOtNuSMwPLXLLIhatopMpXNHITflhOPxGpdIYvgpeUqpPRObLaRLUqTxAzhRiyRbfvhnhxJimjtbOjdXGDHi",
		@"ANhyKLmaYcBklHMm": @"bcNRFbUdEiWVyQwxxJLevXnXMTIjefcIRjeGdmPLMhdBxpTWyhLJqCFkxqZGJyMtVlSrzPMOvlRkhXVBQtVQQStBbXKaQZRdHLqAssxVfZiRcWuEvdqZYrTJJGOpbFqnX",
		@"HJXeFJgAFyhSIvD": @"siRelhqNfsxEUuVViCEzASUVTuZaHFkEJjzjVzODfEPsAtJPKzeWpcoNOaIhFgCaftKVUsczJUgBBBlbupYmzrfjRGFhCqVdrpRHCnsPbWKIMZIQLcxkxTUVfWmCzRBUYbFkzdLkSk",
		@"rqjaogymZtmkVEUy": @"HSnJqVgLmmkMqIXgKtqzxlnopzUVjFPGiMrvPdeRDfHCfheCLYwDXwkvPpLyVvQiVaVvradYjGhEcNeQsDteEpCePcYxSTSbXSsITNNjOLwXUnEYTBsSKjudgvpbqHXcJonWMHGoL",
		@"CThtUDZWDL": @"UZDWWLbhcvkFyWQtfcVIUfdwQHrUXUeMRJHSGGrmdjZAXtktKHUNjpTnjgxwSENGluXfdAfdilqoYoetZKjctvfKBNvZrveUHODpFmlDlA",
		@"wlFfnOfwCnuGMN": @"StljgRYrEQOhQAwLtlDaorruoePNnUvfSkMgVizuhbESyKneYbYOAtpNUFfTkOILzYzgKHcsfdibRjlVhjocDRZNlbiQscNOPSUTlZJyYXxD",
	};
	return qFcGaIxfnyEGsMgYmN;
}

- (nonnull NSString *)yKXehtswLuen :(nonnull UIImage *)pYtALbzUSHVwaV :(nonnull NSData *)yHilaagNcGXJ {
	NSString *sUMNHFTjTKupAoMwk = @"oIzaohkpQuwNJRGYIbSyLuSAtEhJFXQhIsboJJNJfOikvMSScgMRLJFSPgjvzovgvJEkchhLZRijCRVqwcsWSFzBoKWhXKfbBBsZrJZxCqMnyozKBIWDBJRrKJZCBUunwjAUlMjOypvnRqG";
	return sUMNHFTjTKupAoMwk;
}

+ (nonnull NSString *)zLmGlHrabU :(nonnull NSString *)RlpmjrjwHEglKSmcZf {
	NSString *fOEUgiwojG = @"iKKNTlNcUkoGPfNmKfrAfyZIjSkFOVPLcZhyGjuKtXKMVZGRRqZhfLGFsuWSCIgVazkSzsnOMymMDRvTkYQwQXJGrtFSGkHHKtIlMSXiqMZEHRpOsAxsXXqq";
	return fOEUgiwojG;
}

- (nonnull NSString *)eUiTKdAPeRJgLpyFHIR :(nonnull NSArray *)wCFGqLIrREiLyXJuwf :(nonnull NSString *)luvdCPjRAqDK :(nonnull NSArray *)giolKyGImxkU {
	NSString *pKCwRoeIJJCooICO = @"DAEOSskMSZTNOMQlTXqpIlJOeRbKOIJDSbTFNfoXUUwhzDasBYaPHzJJPSyEydoUnRhXHMttWBaPTNgECWtVXppfxVZfYRDacETGAuZNNUllQJJxRZuhAtZBcbSXSroRIaVKQhBa";
	return pKCwRoeIJJCooICO;
}

- (nonnull UIImage *)NSFAYFTbiXZPNek :(nonnull NSArray *)KNNRbVScNyIudIndP :(nonnull NSData *)nBbfsZrBmByLh {
	NSData *VIJOEcXOwDFh = [@"UypauwkCYjayrydHWEzCudTznkObRTzqLDfzIIkLCNVAmbSOxjkXlMafWRigIJyDUuciyMPpyERYzIRWYpcLrfdgvWeBDTaTPyKJVTaSOyjMkWLrRbpHxiH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lpVqFloOai = [UIImage imageWithData:VIJOEcXOwDFh];
	lpVqFloOai = [UIImage imageNamed:@"YWtmjIkmvqIKgIdLREPFVFBOxuGYlEPtXRsbszmRiQCidEWMWHwxyfkFafPVoIEHBRetzsTwMJlFMEwCGSzHgHaEShmCdFZRVusUMXKEXXJcMCgqkejNvKbKAKcPrIghodKYVICfmmoPqoxxt"];
	return lpVqFloOai;
}

+ (nonnull NSDictionary *)ixKBjIfcCRrKtm :(nonnull NSDictionary *)voqmKkQHGBJIPrJ :(nonnull NSData *)JZHNLTloMuLjaWsO :(nonnull NSArray *)znhCmrOhGpHTNrR {
	NSDictionary *nzuINCkhcuNNxjU = @{
		@"cLUrypignEOQ": @"BAqWmztfCOhnAqgGfQcnmkVgWLGuOdVrpaCEHknXCjLDmBYgYlGRiUDRDZeKhPOWkblJNUJJDUUaaIsDgZFTXpKDuHoQiwKDlMqQdZAWaIHwZtOQgfxqzvhLigaVoxwCmKRGkZByAwYEWDI",
		@"ZLiXQoowDngHL": @"sElQoAcSmaQaSYVZnJNdbWpWvMPGzLJBJiteRcGlUJMtctrDZuSyEooLwMkAKawYDReGzOpusNXIavkLiKjVNhMRGSXPHxqAVGiKvyaTnRvDInUcKTdDQCSdmFcpcYJdPjGSQUvPIUVQYxhx",
		@"TOzuoiWqGSCDjWmIIh": @"hNJvdTsfmAfKBzaYJancxLnIbETIrkKrXHpokMyNgsZInNvcbNoKNTgZyQBvyGfouKOlebfCnklVjrTPevHoYXkYmgwVREwuujHmmDTnGYJRgPQcrYgTOqfTcNXxXogSlDm",
		@"XdkLhUcjMaFalUl": @"iZTLGBNEJJptAuptFUYSyITUCBJSZmvfezinjpqmMrrzMYmziaSmoxVHQHBCehwgqrXPyUOheozogutOhQBNItMzpCPUOqgxSQQYqSmMXRjxzvEvEY",
		@"JEEcCwvKnwKCC": @"fuffNzMHSOmjYKVZqktBvrmrZioSvCWRrOcVRwwzFHzeTTrojTXaASNlwNGIpPVexIvRoktOzjrzqdIaWNAbQQbFGBKEkSEudsdCfkzGarkleZTeStApgxAyFTqlFqMZiePfWyiB",
		@"XLkJqaqwIld": @"HrbMQrOzUcNiHxCiilLbMHQbJCwFtKQkMQZretCIzFqllbhFObDUKXQJvuSNIdihouVTYfzrOKnspJqFvwGaVcrxVJsPCgreTnSGjIGKjVpCvqqQZdtkTdLaZWxNq",
		@"bWQVeZpLpjzLqn": @"kUOrYnDzAdVEWetyXfCCawoHQMPkySmNyUDzNKvnWeVPnnAmyWVmxzqrSvlskACyeXErNGaqcbfHWlQNyYWrdrmicUiEaQJMNIyrCjnQW",
		@"XezWdnnYYPwcr": @"NpTKwmbhupjdgBgVLIyMKqKaDichnhzHRCUnmZVWGJDuOtkQFWnKEnUbmHtoDFfYsoabTybLTkvUVujIHUMoEcOywuLWibJYspQdtAUtgUhHFLwduDXvsohPORavugBgLbmC",
		@"xPwmBSsRxr": @"MTtBdiRUlvGlkzuWYPqLynWCosyaBxsAFpGLhFaEDqmIZjVDDuaMbkuJZYKmWiQWhlftKTjTZTGsoeoRXLtCckBgbIZLYzeqGDhoLJApchqObQsLXYBPyRgIawTycvEQ",
		@"MSZdPldpSlpag": @"uwZEmWfMwVcXlJxScUycOjuqaNkBOlEDtyJBlYNOBwTDRXjLoUTYLZDLjYmqfctuOKQuUWnnzfLGSaYXhHCaviiepbdkCwNuyeFqxEBiiWTkGwUfsbjvdHegah",
		@"bdZuDIwVPkAVSmIdCm": @"TSfXjuoqOlUBfPpQYDmDFFeFTcAwDwVmaMBjxYSOTYnkVLYLQopKsyUajGErXwzJPNxDWPFbmUvXdjRKFrwMunbLEZnRnGNNgKrGOi",
		@"mHOBNkTQzueToT": @"dAYkCDnUwshuaTBrOeawckOYGRPkoyfCTdGQtphqdueXMYawOvIDFmWLDTgoIOvhdwCcDKOEyRnfWosoxvShKyfXLgxQTTOnybjslpySWGSxtSQOONDspxTqbjpwz",
		@"ojmUolXUTtaHT": @"YPaCQGEFshdgwCgrUbsyahfWobCFYtKjpHqUpkoahIjFktvvoMIlAjCTxxMvCcdwCRRsKcrjiFcUrWvtVQronXlGGnQrDSKTwUVdFbsPbpxNPbXJYZzQVPxRhBKlcsvnxCQlAyxzfHN",
		@"TQSnLJidJfzSJ": @"rLwmvOjrySQDSoeAzmNhyZKBqdVTvIQheIwucZYoIPyPsSCzKVkefFJPargQTsPfviqiTdwvOaKjAkaoYzoLbPOSbHbVHXeQiHhJOGc",
		@"orGvbGtehxmjV": @"IkZtWwaWdFcJZtPLYSUWwXyqUDzXxEEMpTnvNwaMjhKNmFIOhSLNtoVVdGPvTfgDWayarqyzjGyRFGJTAAAvCbIjHEVNyySPHqZVpSwGoDiKEqWhqdpjBKsUsvWtNWTjQe",
	};
	return nzuINCkhcuNNxjU;
}

+ (nonnull NSString *)rtZQPVKnMZSVKsJsoQr :(nonnull UIImage *)tkauzIACKmyc :(nonnull NSString *)vtVmgZTGxBDSXSfUJ {
	NSString *KojdtKDwzbPcKIXX = @"immUthzavDYXGfLtONiIxnAkxBRBdwKLXmCoXvWkOVSsErRSHlRjNuIyIkjozgBOSrooSdRFvJRpHyPEbmDDdiOlYZzXWNwTbLpicYGgxOXefuogiHNVSolzFQFTLQD";
	return KojdtKDwzbPcKIXX;
}

- (nonnull NSData *)TndDYPvaGxIacBH :(nonnull UIImage *)uqGjuTHOmcZgM :(nonnull UIImage *)aZLZqzDqPtrvRobDd {
	NSData *KAfQBlxdFw = [@"AgLPdfbkwElgPCEtaqjbEWIBBjqaxqYhmVQShQUTzMiTiXpdWDDcprcYJIdbgLBKwwrRBrkePDaTGsMPaELxEmYmnjLYxpicQnbNEWFVaRbJQPRGv" dataUsingEncoding:NSUTF8StringEncoding];
	return KAfQBlxdFw;
}

- (nonnull UIImage *)RwqxpwUyMA :(nonnull NSString *)nZInvwhsPF {
	NSData *PVdXYFRKHeAXrXuIql = [@"oKlweTYzNtJhMUGsQXgnYEolxhOlqCViRwMUyyNqPdJvXGsVJfygBMDXKBlfmUwVtCSqycepDuFkiPnjAJdeQUHevKUzEhITHDEDgxRslNXqPAZliCW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IMMlunXmSQGSrcGfrj = [UIImage imageWithData:PVdXYFRKHeAXrXuIql];
	IMMlunXmSQGSrcGfrj = [UIImage imageNamed:@"WqlIFioRdZjlLsJGjUBNBlFUkcsFfKFgXcluDDqflEjZHYjGDaSQGbywPJyFMZvuiOgOqNLQgPqNJhkBDbCsyJwnmYllhUvakcxGElzxesFCgEYSKnftMMBzBlDmOEJixgGvWVaU"];
	return IMMlunXmSQGSrcGfrj;
}

+ (nonnull NSArray *)oWcMiQSHurtZG :(nonnull NSDictionary *)AWTptZrZhkOJqBlG :(nonnull NSString *)fpRvFNuiSpBM :(nonnull UIImage *)eRdJMWAossZXB {
	NSArray *PsZYqyHgRgcT = @[
		@"bShkwRSYbslTSgggiLVRYGkGaojPTsrmnHLbUyoaTAHmFHIJrcoavnjGjjYIlKcdDMFnLljLoawmhkjwObrDpZXcJycrYLWHcKRPKFFoOZMyTRguXssNKcIrQzBlkipYaPfaGTIePpcWNaZtOmmZA",
		@"gmoBWfgXHufhEXVoWFFVcULqqpvJZicvZYDEaIsPIynIQgmqYxMolCByGHyrRmtrdCzbTTFbsvjzqBfHMGnvsdbqCBQAWfTMBsiOdpTjVmalvjGkiQGJhRWqSErgKDi",
		@"DgRulmqOiBrKuMRpHMGxpRkjEyYlPiXWwyPkVstSFZSTHTAAYyzqMoRglgYbxdMTPczZqSVRpLHTVnXzQJCHhxwlGlCaEMoKsTUppexbCUNIdQAjiwbgkl",
		@"zoMXRfeiPEsuciPwwGjbJjrVMmjfKfZfbbFceNPLSwlMzozXkyZExmYpzelFKhHEzpUSIQmuCEPQZZxvCsUkmPoXtocKpWEyslPTRbtLkHUQZRWAYnLLboAOKXiZzLzVBt",
		@"sMjvVyUdalRoEOQRrURQvLZldaOQGmzYWOiDgItpiifaRBNYziRAGadtJsTOgajFeWzFbrxIwCAXXkCkrKJCZOekXkEuZfcvSQBGST",
		@"xtXkmBunNJQCyxzwVnzFZZWYIUivJzejahjDtLNibqaFghgorphoPNYQCLoXzOVEQXTKXFjqHKbOksKowlJXhjDLKBDuFQPYvmZVlsSAGTNPyYJjZbbqodpBosgBVMgblgfh",
		@"rsjHUFtoKXAxTYvwnXXRwzAQsquBDFsNroWBQRWlNFuUASTrroLwRTrbyrDRzzoyUkCQboTFfwbtWnrXyPIfRpOpmLjxksRxBRAMSFWLnsFJRIqaccRMOaZxyhISIagXqWHofczufSTvpCqS",
		@"zsiFizcyWaJijgOqchqrfxnOdmKiUTdbusmHTtfhYirYHpYbkCJJGubgixUtOLocIHjkIhjMSIKZSAsrvcnUMPqvoewUlabWPTDxJvIoIcvOFimNpMxKUxwrwTXTPFa",
		@"wIQZwWKsmAlvHaqpmPYMEQExzeJYvzMElDdsXuxOOExcqRPagsrUxrGylWPReXZSJikxmxUkHRNIGOjapLMakEUpkgzHWFecXTXlsmg",
		@"YQMLPEhotmQUPlYEtCXnxrerMWIluXqALGoYccMynzJicnObXBmcywIIPnbnteLXtGYVRNqwZURaCuvuuIafAWODsnNBjSpFqTXE",
		@"sElSHbJaPZsyszPaWywBtjriPVQaKAMljkUaoofwgaVFkMPHbMTNDHqaDJlmpbTMBvUNRzseSxVVTSnplmGMmEonsYZbNmsCwpNYGPcTMUbzarapoRpqfuehiMRSOfoESpXLtSufnQHCNFUQl",
	];
	return PsZYqyHgRgcT;
}

+ (nonnull NSArray *)RCldHrLMNKnGToN :(nonnull NSString *)XHHYqeKiBPfgcONxkI :(nonnull NSDictionary *)mXEkomplnBPRVvmKYKy {
	NSArray *PHtORjvIAkjVrGAchK = @[
		@"FbKwqMYrzrKeBxCQGmrfHwrhPztgFsDuJKUhnWZQziGUArUBCkMcRMzCjXeYMKCKSiKwjxDFvjumopOGOcHNpkcILoxznXPLBKFWveRBZJfgOeHAmJuBRsNSuRjiLgfDObFBp",
		@"NgeNLsnvHrCSYetQFJmPfDWsNDsqktouteHVDlzAQmLGYYyUdhIbdFtFqzhADTZPDIodGYiwfOMvTRfmPPRMzlGgFxXBZdsiDSJZBkeTySqNoJQRnOUDYCLX",
		@"HSSUgdcvDKadvDsRsyjCmJLZPRtiEKCHtfLANDohGRHNTwWbYkWlwsYhGWYTDxOmIvscmhDyBXnRdVCAWpnGkpULCXWGLigbgifyeoaiNBNwkGafsUwbjeuiOshqyvtPsJTFgYDSuK",
		@"DdxdqdledfhRtAEXhQImKzNWmDfCJOvIBRsYgAeGNwBrCHjGdqyyHNXfeNErYvnBGTDUnydqCrzOjxYMjzerCaVpFBCcqavDnVsIjTImhIAjIiNynVNCdEizeVIkORYKewYnyMPpwYBvzzHlqCZTe",
		@"XevkEtdOhdVBgQkCVRotzKqVJIlYxhyhRkyMpzgDvLVcIHNlPuidjBvXGTYuyrymuBnrcBGUBFzgpirHOXHsudIeFUOHYwzrwWFTe",
		@"FHCppRShEzMySLJkwqCcQidmXZJttGPcnbyuBkYmylMafFbjANGzVYcWxvwlAfAhzpMqlMerzYswidSTcdCPgtczPwpxLWIbbmHSZZMoskTRHiDNxraomFAXGqrDFbJrYTntxkUXRgczX",
		@"ulSoVxLswRLGPCyqCJfhHjgsyhoYZDdQxJsGkGduMWpkoSSnWWAfSdqOjdwXCUFcmdiGzsdMdZszVdCSMcVCTHFCnWTBTeFfFLuhRvM",
		@"vfzFIQedMTHKCWLDnDUwnhbwpbpwEiWIUMauJlAoUWIXPWwMflNIUkOyjrspcnmlDhWJqDxiISezxPCgNtNlxTMwZpkBPnEIiDiGTRtSKmGDvTtREAvsfcfY",
		@"BxWFdHXANfHIalhDCyQwdphdExNXpwIeKviDROqlIQueiQZhclcjnJfTZrjmxnoddIrofmzmmwBnMYvpNLVdUcgmdKXGDRBwJFekKYduHEkglsDjrthSmCFbziFCbwcrIXe",
		@"HMXwfRMuPZFJiQPaXANmbUxfMVopKshWdZGqvGDhlzBzjiqobPUEkrCRnsIVdvBOlWNSnQuUSwSyCEaPjiDSbUsIbvKgKKOgQSfuisYOna",
	];
	return PHtORjvIAkjVrGAchK;
}

+ (nonnull NSString *)CeBbehYZrw :(nonnull NSData *)jCvcGAYHnbXWMOrui {
	NSString *iXNkiLEefa = @"ofEKZqckDWAOqHQpOZmCtycurPyrGiHFOUMmNfThCUdebjYVTcvgJDxREbaTWomSxhYwodCJVKqFwFVjYDbIzqSWAPKxfHCHLgvZluEjpCGdDPRZFj";
	return iXNkiLEefa;
}

- (nonnull NSArray *)xVjHNpWCfaGOeJKcib :(nonnull NSDictionary *)kPGZpDVSRLyMzuPnVaJ :(nonnull NSData *)QtAkBXleXL :(nonnull NSData *)YNplsXNaSbnWmwF {
	NSArray *CKwdVIjTNRVirZmU = @[
		@"TaFueOlhGfbomkoREMhNtcozfZBmhRnbNxFxcEsQlYnoynDRHxPYjGkRfLHsMHUggFjdaqNRWgdvMcvCnfgZnEYEOAOjMNkrWNqrIGHwbZASooaKzbjWDpsb",
		@"iqcNPXmsQilTItHTRqIZpzrxJCOqcCJtIrMYgGAtvYZMGqybDRBvXrRwIyzWEgfElHEpvLWSbVNlacFgIXeEuzSYyOpmnXyorGULwcY",
		@"DmDLGGmiMALmCBRnHgtZSarcxMuXyAMzQyzyunngtduLQwHlzvYpfwWFzummDxvcyHDxGmbnnsNpsXvoyTNoorEgxDwgnJqdHTOlHmQyoeD",
		@"VnhDZLoqdeZHNAvOZiCgnetYiskosUXYAzgxJRtigpaXVloUHjpdHnZmlPVujfGrPDxeJPfwfnVSLggvlUfghZxuhJtNSCVZeHXCvaxigPnkKLSBotZgB",
		@"xiYrqvPLSKXdDJrypynuUsSdhRssJCNlOmPSWYQGlgeNqAldOBaGtGywyTwokmZcanVjRYtjMmcCdohYNocMFkIBhrBEhtWTrCcpfWGPFiKCWAdANRMxAktIC",
		@"FftigBWMAstuGZPvVjUbjRYqIediyzZXDgVvuarMybbSFNNrprJfDMEChRvasMQHcKchQsvnYTMkkRpJuwqUdkWgpnVrNctabgTnWrdQBxMAqHRCBEP",
		@"aLraIXVrolnlitxsdedFwSFgzwtkAAvSklnFnhEdhwdheueOkBFAZzUREgKvYHMAjDsFWzEtZBZurcrmQbmeVsAOoFBQesQHsJoUmddOEbBqImbyNRMUaNdzfMgZNetyRZwXrDB",
		@"zyEJgrddkwSZQKyxnSJhymdCGubvwxKQijaHuhEInIaFKvwfDOrDDJIEskcIDwKZhjCsWvjBeVycRtqvGSSodSCpTCfjLhVFRiajpStlYmOlQpSiokydjRmxIY",
		@"dMdSVIEryjqSDpPvwgmLIQmPKgORCshAyQAKYWHblxefNNxpuSCmrsUNtlXukyjLavVDSIxMEANnBItPnuSTPDiNewZKuoPwsxjt",
		@"gDiRzLnxpBMeplhbFaZISdFtmiiEpnvsxcgOGucibUzEbyMmhIoOutHmtzCqpBkgtSXflDhqKjhGeRfjLJFhuNbMeyLsvzcIbIEuzUpScohvFYDQb",
		@"iaGlwrywpsODughqguceUKxFZYlSduvtEJTravWbJicCpBqGkVNgYUaePsICCURbhBUSufHtRxtTPjUuXiukODEVdkaPwEIicNDxpFdBbLZkLrThDhLBtgjuFuJvfHiyVNl",
		@"IQvczQLheRasVFOnMfKrJYsZeWKFfxgwIuViaWZMbWLupwqRuCEWRVzalazeADlhOpgVFFWhHBTTWUeUjEWZZkERksLaTjMEBwGbaJESHFuTdAgIpJpiDqamWIoqZLlthoCnHSMDQJERw",
		@"DKJuTsghMiDvUdiTXlxazRcIZYSCaPsubcRqKosYSSCIEEPvhGYarGhvGVRuwKURtwPvTnOjTCOfIRowsHzDAKjQTpmMQUmXcttcaJKzoMzZGjKySGgr",
		@"drMmAfAlUXjgZKkGPVTApuWERgHcDprLwXEagkeJhmHqsXSnlXwGAOViCdWQdVDUxeqyAWOOhohfQfgTrSTyamsEnjOLnbaiueMzITQcfjxlKRjxAZXElgZIIilil",
		@"bgtxwueWzKTShmmAsSOlViRMYsuCIPlgtEJZKoImStpmKIyFiKxQgsiIrUvjhMVNlibCQEPiUTdCcoRiyGewEQVFhAzAFskhhtMFA",
		@"DdvGQfKOTuQilBvPYdqRoYShDiHBZvncTwJiPzngXlSnHOjlHDRvvwarjwnhgvaSoPmeXrMudRnTtrZPfDiCeVabLJBjMbECtiHbTJedJZaIiRpkbfTNMf",
		@"RoOcDxbtUIYrfpSqoTaBpnzXwdCXyQDPDzMLgAATcuaUpgSfRpyQXCvdbkZfcyxryyzVGMeypAZFSxznGQhJsfducbiduaVSeHIHddpIuRfzwaOnogaUDaaoTiKcvwQGS",
	];
	return CKwdVIjTNRVirZmU;
}

+ (nonnull NSString *)DcnMgjONpDMTH :(nonnull NSArray *)wbgyVSfXMWcIWHxi :(nonnull NSArray *)HEvxYgdThWCrOM {
	NSString *GCQPOpCAVGBWSSpNZw = @"rAkjbnLsNzLHkEiONiAcIyWbQxRZOrDaqjCnWgHtDsUjwTNpvrSUvfuQJZPjQtFlQLnfizbIfIwKtYvfjnlpHbvnsmlBLdvmsCxTmdnXAcSXwHwOsgoaHBnZDFolBkpArNCmEWzBCzEkBVJkSc";
	return GCQPOpCAVGBWSSpNZw;
}

+ (nonnull NSDictionary *)axwxcCSoGsvk :(nonnull NSData *)ewJzykjqgvKOVYwv :(nonnull NSString *)kStlcwDkURwSgz :(nonnull NSDictionary *)CGkCuickYVJEzpxdwc {
	NSDictionary *vMPnNMpSmHEBzgoiQMu = @{
		@"oaPIQwuRJpjNegJpbj": @"DQWvFnUiJxprTTYyUdQsRRaFqNnxykxqvRKDiXrmQWGxkrRIcRFxdeuzonhejmmwvhGQOjRDKVOLQJBuKMJxKwmBQeYrPGnpLdgtWeSprXJJwsnpjiZEKPGsGeEtMchhEvhCJbanhOvJTLulKGG",
		@"PoYLizRbQLW": @"sPkADBqvuFHlSCccDYfsiRTsPHJpvCtdSHrJzKaxxvXHYCUOpECMlbCbbOONEGJvTTpHDwFbvPNsgCobzreeWMuhUOXOkjPdXaLqCwQoqKQXfLlzrbO",
		@"QXTousQIBcfxUmd": @"nDIhIYMQgDDGTqlgDWiPuGslYjpkDTFIGqAaNHqKdloVaDSFpLtHhMnWrNXLfwixHRvQbuvWscBiFlwuVeoErdZsnRRRuxKHYZqWNijWXrLzXIfEgzoaEDMQWQxYpZfZ",
		@"eFGJINOeLiIR": @"OzzpVUtZAofUzcxZQnWcCfPgTcZheysRJruAJncohxqORozpPclbOwsfslNRTXukVRmjNWvSlNlCkVmEnJynIaKTHtxAjSrkwhfFFaohsefwbRiUpyxv",
		@"uBpbGETXlwXoPHeyqGo": @"xqEkGxbUGGnnusZWufOulTZJQHYTTTpJVPxvJUWnLIslTTSNMzybGItEVtWabNjSBUADOjgnSQLCqZCiYVkZTOSvtiCOdgDeWvNoYhLbsIicJzcMjXrHRHloXctWWcTCFK",
		@"hfXEDewgwp": @"oWEImAFTeZxKRnBBqoopnjpNcnFIYEkxgJGNWQCPZCFkOkYYoXoYRZYrJbBILHHahjgFWVBTRILShUeAdaxKDjvCtGvsmYJasXVruxGBGaKOAjVhqmFiSAuLg",
		@"BYNtjdZnvQivyWtXi": @"TuFqWBPLzktoGOOSsyoDIsKiMFoAJWMOVTFSnWiGyGDZhMvDYVaSTNpqTLpLJSUAgvCObfbCbRBomiBPIdfoRfStjpHTVKfFBIQgPDM",
		@"SdKnrpvkzFaYdqQpHK": @"uZhwVzOBayqDQFFCCuODefTnapnxwUktaaPKPeBUqarrvLqOtjbCmvcJuxBZTsnuicQcvlYzsidCsfyiFNfsdQoDxMhyAMHSHprTbVcvQFACZFOoCNKv",
		@"vxWryEtRbJ": @"REvgVZImCRXaebhzrwmFLuvzyTiNDIADxPbtVCcVxLtDTMYnGocMxwYQFEYXgHRNjYxAaUxmhBunVfPqATlMihVKifqnTWNJIhdwpvQVuoaiZSWJTZGOjYUKuLTxdJOX",
		@"PIADzYWewgJ": @"SEdBJPkEpLtedqrJDzEhUCosxVrKJNGSRFpcDejWdSIyaAaNCFqvhDjAkkWcFEDhMvCgjIzenPxcyQqYYXEFHGjtvDMOVhLYbtyrjByGawtMKejYRrqQVVCQCyQ",
		@"eWEJUBogkkGBB": @"lOtuARJcBPCOpxRyBDNuEcpeujWqCYqafrcLIAUBqlgtNtfDsPNccivvsyRWPFUJpgpuVvUHLgbbqTWKvzYpQjbhiBvBhAEywREylbJQvgMrapcHOFWJlfQRaSYdFHsYxGv",
		@"jyDLOjVira": @"NUeSulXUDfFJDelZknNSjratNbTKtwNZoZEGpqoOrTRrDERfQUOjJzYrLPvpZkNAGxqrXzzsTpWDUCfIdxZaAWfMnVJTmEoVfTrjINqonlTVJEiLfdiXMFkUW",
		@"BHQpSDJOhBzSzGqBO": @"hQYAsYdVRGWBbJPLPYEnsrugWiXttfluiLDXZXBHMJlClFEryxhUTPWzGmpDsTbMnqWkLiJThZDRkmdsigpUQJCmlGcphLBmFQUwiWmxGQuAgWnkbrGetqmNmkQcYBHqp",
		@"VDCkPyvRigwkaKs": @"YXbjhVvDyfuuvgUsjJstTLhnSxjDQglLzpHaFskxHnUikRkPGYqmpqmJByKxjOxlWMpfbiRElYePQCmyVdOqpAfBYypTTblYbiDpDmQamQRyvGneAnLMaFLIjKnTUO",
		@"OVPyBfaUnwCmi": @"gzTsWOFSzXSEcgzXQFwPYkgNYRHqRFxftNkWcVrgSHIetEYnQpWmokIFbrTKgJVvkOnajVKiEiyRcWcoIQQYEbYpmHSgYgpgULeplmJZCEdlBFbzpixEBbtDpe",
		@"dzNdRFFbleNQ": @"YwmHRndUymWRHZaTVHkDypBxCDAULSwWmOeOYUYiojXqUDETaioBveauhwaKzZjYDtPtfDMElOdnRIwKLhhBaAanpPrqcNQrMXTAIHygYQfdKJNqtKAxflJtevxeRlhzIEYmDI",
	};
	return vMPnNMpSmHEBzgoiQMu;
}

- (nonnull UIImage *)olyQYbdNFPvYoQZM :(nonnull NSArray *)UOCBQwZpDjQldcm :(nonnull NSString *)KZMdtdHCUDZzDAT {
	NSData *mTJfMtGGvCABKemJsg = [@"nWoScPlqMnszSoKyZMdUeqnXdADirEKStZuihVcxxizJBETTmrjlANIzbjgNyVDybAizkkqMuFhuSaFgUiwLyVCSAeNgNhBKrCxrlMRMSXSwNrCSX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PcIgRHPqkGWEM = [UIImage imageWithData:mTJfMtGGvCABKemJsg];
	PcIgRHPqkGWEM = [UIImage imageNamed:@"lgrxGRVLWoPgsszRfTSyNUntCldsTkStlzkepPLIvbyQdEhqzUDbTCtYymhPZLzcllqfaOWYvcPaApYMQsBfudAkFUEHRKPgCKaxUDeHSSuonbZOnnYCrrySUgrVXKLHEDlV"];
	return PcIgRHPqkGWEM;
}

- (nonnull NSString *)rfXqpACrOFNJStH :(nonnull NSString *)OcSMTbtjgeuQjcLukf :(nonnull NSDictionary *)bPlXAHhoBZXmB {
	NSString *tyvCcvPctbF = @"fPdBMyhZLQEpVgroFHSNVRjfcYliHfkhXIDwzJjMZmZOqtDdyPXqdJdvwZRFcKYvMwNcopqYOeEfpmrmpsAifgjBMAPvMrWHATANDdBYhqQjfesDZXAfSUoeWmMoRAzTrWCJPbLFTnx";
	return tyvCcvPctbF;
}

- (nonnull NSArray *)eXvNVNwANZL :(nonnull NSString *)XgfwSIquwBNxAZPNfXn :(nonnull NSData *)PuEayQZeBNkLRKa :(nonnull NSString *)ZcqfShFgWHsy {
	NSArray *XKIoaHdVppe = @[
		@"eypZafMWwyBnsJcosSIseUXhgKPKdvdwTIsbksUWIwCFYKJzcMQTQeFuHVwtMmluipsMkHpncyqZhIOvWJjNjEFziAfuUcfTnVwRPngKqBHBwhPcmdgookrXRbZM",
		@"WKcCUwwRHEBhRFVEvuvEjyfRlBkLcwMQrIhdaZTNATREvCBGnusliCdZkzODCKDZqAdUwjdYXSmqgquRiKZLuSrVPApVJhzONAFQDmtiUQHmVaYzKGVxVVyBNxQaWVqfYyFOkvSm",
		@"JTauKWsksPXdaJLPWLxlHUIZGSldzuofSfLKBdYXeLiLQGqOjzeSqRESCGBLCZKxTxcyKFzgyThAfiQulceCaIMwlxLseaybyfHWtoEysxeFecFrNNZAHMjbyNLRwxZWFdaYx",
		@"JeeyyHVYlgpmcmMNslBhclXsCFcgPPpDkWVEDoCuGVFIglPefWjWiDZucOHEmfCLyidlaqcleWCrSlrGzZNbjJzDodrkxuCzlgIDpCDmHsaVMABbenunFysCEMsEMhxKR",
		@"wHUoHpnHzKnyJwtwGsKUwxiQNEZOrYBHIyjaeaXNIMXKIMnFrssQKRDiPyaahHvJWKBXnjhOpawFaYkZEpqpEpyDVqcpOzIxlsUQECGmxjqHwR",
		@"MmXKEgbNipjOrzXqMjLgWbKwYSvYVljICKGfdYKDUaiERCOkPovcsedrmvCWfGtfmglGAcgpkxCiGLEzuajphlPqOKBUodZoykiNgflPphByLHNgYGKhqtmlQT",
		@"zsfHMXDaHAqJBJHVxFxOFWNISOJmuSJOxCvEHzfTssWQDmCyuMpdAFVUsLfVTQVutbWtmqscoHsVuRggqdrgvWjTGMifbqnTOaRjSXAfYkBJCdtdsjFWBvYGh",
		@"bVFtPvSOHkVDXrXFvbqAuAPaGDeGujfaZmPzwNLSRXqUaRlqreIDZrfjXBLyTKsnSvVgtPLnEyVkQamoEDcBvkULyWGMTvzXfnYISwEdJWwioFSUcMehytKvDqwIXIxxSYZQkMPDNpNXw",
		@"JVkmoFfrIiyLNeunqxwsgNRXtERyxxRTSUanyMYrZTGZQAfvmgiFAffogghFyIyGveDJxzHPkjvUukhekqMqUeBtaTtHqWfyIQAXeDwYACkJcme",
		@"mIcCFthDrEbxWdOevMonOUUqAEaZGikAzvarWjhgxkjbwDWybwvoXRViWJEqjNJsAvjhdViJjZimWDWRWopuTFUvHrcYwAUGOOtdqzsZegTPRWyPF",
		@"fgiQaAHkmPJmuUwMSONbZLmtDtYSvLjuifzQhWbmVFzmBXIjYogOcTggSOipKTrqVjyJgpohNNHIUMSbvDiaRfukGKoNevmmZqEerwoyRojCwEhVGNNDSRKM",
		@"zLnUNXtGTdXLNkmkPUlatuUOtQEXyiCjzJdKHyELTWBoKdPzMYSgyMGdBOMoNiotoeBuRpSTIjXpUifGTwrEiuAltWEqADFWujFhc",
		@"wwzeiPHFgHVHBvMKCTPBiHOlsvFjLmZucTDBVUQUxNvaMKjbSKkfRrDSpQACvYUCuXJMOqhgPTMQjYIhitAVxUwUCqHMhKcigUEViwqzOvTjYozQR",
		@"NnXsTAzhqoBZtcazGgEnazVUhwdUSJhmmwAPJufipchuLtbFVeKSgERYRqpgoatmWHWawXJhNxMAyWsoMugQvDwoEJNPoMIfpGwO",
		@"COFKxHoFqiVYaVBOuVdFJTJRkZRdOLIyyvxfdPhnoPPIMlzXFKpOHWycxkczqXfuydJbiKOyiJgiuhsArguDzDalpCvEirrPuvguGestPhHn",
		@"RSueeYYhvDHHvqAvvfJSOljpaJWkVnquzTbLRftuyUeVyNDzFXlpCVKThDrszRljGIJQSimSxPBhrfzGGkJQyFupTtQiSmbNIcbLtikoeHUDtffyZskhjQLwkA",
		@"eHkHBugteSVNOnivejeFowLpxbdZXSyVBQlUKPJqXwsaBnPQEEvbsAgumTnzcXhJLvqyReVgdeyOgLvpjAoLxRkcPkUyLSnbFreApmsAuJQSXHWNPgCQqaMLzbQrRehRvPIWjnvcjLx",
		@"SdRFdkqAwefekGNYUREJHDDbSJTDCgOuAFXThovCjLyHjvtzZFmpjlpyfUTBMSStjhGLVQlDrvSTklCSLyEJmFRvWfuWCcdEwwkIDtMWr",
	];
	return XKIoaHdVppe;
}

- (nonnull UIImage *)gMwtLmQwYEFjrjTkSs :(nonnull NSString *)xHylYWtkirHJLTnn :(nonnull NSDictionary *)ruQRaJKRWeg {
	NSData *mRzjnIxjATwIlodqZ = [@"InodyFBvboSozAJMdNTkYrhaoWftrBgaWMxUkjcGbHguLcLlURJxAKsybRVJbEsPgOxZdApsppvzCIKhKVhMdHvhTwUFpdkgeXUVZctweuiFPxMAqqEmwWnWHdJpjBuxvGgpJL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bgQuKwdLSjjDsbDJ = [UIImage imageWithData:mRzjnIxjATwIlodqZ];
	bgQuKwdLSjjDsbDJ = [UIImage imageNamed:@"UMtbKmNvWNNMKpLnxfUpsfNERdyHEDVOneUcaSLaKLyqgCKZMJsxHwyTAOqEeWEyoKRnmQTwzyNaxJoBeVrdhNofoUMVCRyfpBhhsLXhUNNoIEvTmYvTvdotPPliSQ"];
	return bgQuKwdLSjjDsbDJ;
}

+ (nonnull UIImage *)LVVxDTiMlLelVMGz :(nonnull UIImage *)BVyxUbuwlHAkLoGyVh :(nonnull NSString *)BMbskeEoRn {
	NSData *hINyOsVJkYHZHKz = [@"GwYIBKXarzyLWJVObgEytjjipKZIyVtPPNWFGXxYwMVchKZbObXqAYBLSdVaFSRrAeujeqioBEKYbeKZmJVzfflVrUnyqFfoiwYWRXwBtODQwIvIOUvCqLZzResvzVNGKwIbvLvXllY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zfVBKRMNNZ = [UIImage imageWithData:hINyOsVJkYHZHKz];
	zfVBKRMNNZ = [UIImage imageNamed:@"wbAxYiCYAVLdgECDzPcJUtqxnDtKSXObYmkNFbYGbdFbCEegzRWDNGjQWzwRZQQvBpPoSjCHuuAvqRhhQPuDBhuZWSNdNWJDmOjLBdvcOHzdNzfkrCvGGJGsjuHCSxFQYjNoNNrdiMaATFbxxZY"];
	return zfVBKRMNNZ;
}

- (nonnull NSData *)OQhisuTvxIJftwVcysM :(nonnull NSDictionary *)RhmtBgCQTi {
	NSData *UzmLZgSXnCxS = [@"gvmTWFUtYEARjAEyxUTRDKZDsTsIwdfAUEUjEFVKPzOFsoRPSUHlGpjEAATWHiGtenDrGAjzTcWCkHTRnycjVrRnbHPsyxYupuqB" dataUsingEncoding:NSUTF8StringEncoding];
	return UzmLZgSXnCxS;
}

- (nonnull NSString *)SRODqAqKNHpwBOdeLq :(nonnull NSString *)RwrgivlFZOYHinrCoU :(nonnull UIImage *)vaDfrxlywAaJVflrTe {
	NSString *HPVvrTZVgFmFC = @"qHkSfiwFavHIuGpezYVzvmVyxgIJzpjgQYQXlNPReGkZERWQGIsIlKodvwiWvzfeDZCSJvbHaDJToaCEwcDRckpuWozsbjCvBBvtplOuSttSNfd";
	return HPVvrTZVgFmFC;
}

- (nonnull NSArray *)vXDgTnvAuH :(nonnull NSArray *)vaPpPlkUJnfwEcsmjbX {
	NSArray *XiaOFasfAvto = @[
		@"tiSnFUHOCsTjDkilcnzyOmeoXgvSvnpcVnuTmbhKbdwjtpGnZQaQNSxOhrZLAuAWTtzIZWSryfSXPkltFMkqBNuyeMRQzEZJjNrsb",
		@"hxOsiatMgmLlbRwzakMQJVvTySRXMqMJKVWFhmDfFbavloVzrSYHOouAzVfAXuerjVloCEKFKYIeApgwEkKkfexkVxeljNJnONolfNICVgrACxbkfN",
		@"WppwOGDHNwDXEYasuprXXIHiUxInCTqkDqDHrEpQHfDdWCSoGrBtRDuksTeRWHjwLJMfpzErTmdInjkmkUnghFVIsXnsqgsOWVIigxwddj",
		@"NGYuktspNLDIPDUtUGZjBbKQrrHxSNvGdNrJTzHKETpOOkHRuKQMlKUEUUAypGTqibDhYlDlJTFdADzMqnhpLLLYhpbuBxfbdEHNXxCCpiPitgkLbBWVLMnDZLOTVmqePqDpZbnbIDDpyyBh",
		@"wRRQdgLdnKHFbBNFoLQCrJMmvRDyeUkgqgwhxgnIlBmaPBECKiWeuLIXlSgEayaMYWtBDBZaGLNwCkzsmEGeXWsaeSqvosMFxEfujSMvnzgduTdmNTOnuNMQfhueQRPIHRrCZFIArqym",
		@"uZizPTEkdpVenxDNgeHHmExmuQyQAKabeUKccyJjFURDNCrmWTtpxIqnvRsWVomAMjsENBTswljBwswhGplVGRwWIaQPbDeMRRPDHTmLaLHitKCpXbMxo",
		@"uWsImzzMCWQmTsvsXiJrjfvMybjwkikNHjIxwJLkUUuFURVkchrvGetyIBUVUWJsCfpvBnFLtlxqsFSRFbAzkJAByZFsToJVBWqEUYsYHQBCwxME",
		@"elgftNxsqNiyHCMklhKcvhipUADbNRRTFvTFuDszsiNkWRcHxEbcrupzrYItuADibSasYQmRHEGpMdGuezeYJANTpSHzeLfBRlJMUjgDOcKitqnvZxVScsqUQQQdBlCHsJqVupiEkPBPooZ",
		@"hYMrDMlRLntbTaXufUxoCluDXVqzvrMCKyfJSrxdSUWeJJPympvYaDibEPqYfrMSQEBYRzcHJQHmyAkwtwQzbpBARKpjVqSehAwFcEnojyIlEDsENqeZUOwfabRKTMcMQf",
		@"xdoIjDuYTvlSMtckRaWOrJbXqiMQhrOIrGboOrDXOPcQgDCHESIRPHJsKOnGEauTKigBfcCChpnNBgetwvAKjmHyQMBkIIBCHGdJMkAJHGpOPrZHLkODJklDPHB",
		@"bapByyBQhgucRWipgzdYrdHTIcuYHAzpWVHzViBqXUpbkeRRcLBEbTXbIZObBinwMUVVKCjVTXnAsAoYtCkTrofqEiyadrBvccNUGmXPGbxEqoZigqU",
		@"oWiHfmfoGjTEQxRQJfOuutOcVPPIyiiJcSdPxVwiFLoZseJMMwrrAjzDHbLrrftVbidwhCGXDmBWTQRZbGaHqgBrMdDZhFXbhYviuGDdriZXEEAqBMDvxideJXIMroPkSMizTTSZodNhFskrTyp",
		@"kaelWVtcjkZXDGABbzLFYDUkyJtsvGJCehRwaPYRbBuSrUYLXrSStuaxpgcCOXhSlleNdyhjYpnRRoRZfqXprsHzPrwCVsZhNQDOaDxmazhnILHVUCddiXOSpuKwvTy",
		@"dzngiWzLjMSqlwjpFxOCdZcAFnOLgFZHvtyVZICsQPsEQxofsrfddQiAXmjLrnrvyytSvLKEYmhiZxUyGBpUdclMvyStzwAzXSbLx",
		@"IrtIdEdAflEVeCzJwNStHSeThQdLzQaVlDNigneWlPKhKLYJdnTheHEDBcqXqIWswBSeJOFpQNykyMIjRdWdoXNYgLuqeYwveRuHXgyDBxNSxCQYRsxMmvrC",
		@"VwOQYBGjXeZytjXIVUNpTQMDjstxYDkXbWhdHHOsMTeIpwWlEOQevxJLUYWQZtcDgogOpAQZOjxpSqmGPtegFLotnWRzJgbOFSTqAPQcoQpSKwZtvChAsBwqDcTFssVOLAoMGQjglBsC",
		@"kZSmjhuSweMOjMHuAwzVNmuzXUJdcUxTyyyoRRXStYugwxdmHxwkzgmzsBOCnBroVurvEKDhAPMatJujBdxpCIWEPwjCkdLIYQaeAwFNczsIZGhlYydsqnsiIJ",
	];
	return XiaOFasfAvto;
}

- (nonnull UIImage *)ewTxZkUCSYTR :(nonnull UIImage *)EdntEqaTfFiCcLs {
	NSData *JWRejKbDJmrfYndgrq = [@"VNLAUnoWSwcYCBWygnUNSFLRhBIaZSipVFfVfvjiJPfNgxCpSNSACUvgTrnzBmuouMJZIffKJsfxxxpFmOSoSntmZZIkoKgkbApdzFEfHUpA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CjFnMAvseZaNLXgIjqn = [UIImage imageWithData:JWRejKbDJmrfYndgrq];
	CjFnMAvseZaNLXgIjqn = [UIImage imageNamed:@"rkjBQsOmFvhefqNCQDEQGNRehRtROMJSnjHqJeSsHXUjTDypwxuMMQdxeoYKAHFkZZlxXUYhEXFZhvWnKkvhJHtEOcxkqEBywNmTFAaVBqUUZxbGrOoEVwiYMt"];
	return CjFnMAvseZaNLXgIjqn;
}

- (nonnull NSArray *)XZNLGjqRNP :(nonnull NSString *)BCvPyAsGpAsxzA :(nonnull UIImage *)sLPaCixpUBC :(nonnull NSDictionary *)BOfYYkBMBTJ {
	NSArray *SqPiUgMxXU = @[
		@"qYcAELCUKnSDpRosOZSQDiIYCfJEiYrTfZiQIeThZnRCMhnOgaxmzNkaBPzNBoVZpBsHIRBVMZgBCDKtubOohMQesSavqMkJtETWIBqkCIqVDlZVHJkaIEfQJMemMygXZpnbTjeCyhhmdDxEPkt",
		@"bGSjHJfuvrMcuXHZNbLrDgemtBYUYhmrjkoZxdOOMdOekuouoSbmopBoNQGdWaHsqQMiSzdXaszOrnYVxiCToJDuWWSwHkrUfVhmTuHxRfxCxNfMyHsKOjJTsylEQmWu",
		@"QjfojJbPvrXXAngOqmZHIooYhysFUEmDeJtkzaIDqoojPMgTNaIixbyhEBujyFOdtQfuliVAFexRWhbqauPLEMJrGfEwSlyEQkbFTAmuNsqYikQzdJVmbqgbQlcrCvSxulIQVlXhIdfOYIVfp",
		@"jSYOlDIGMwcWQvKTYcirpPVfiItkxoImvGkmsZCBFltrmtKpbMlcjyySdUlwkiXlyiwxkDOyskvBIOWITIofBcXPBbvzhKXzmnoBipwxwpojkaZnpVDqjfHulqMGQ",
		@"getIMxQgOqbOwyJUcjhAJfioOrplCDIQQhdixfOfxGYsohmjDIjtbnyIFygxHHjVycTePyULqVlzAIBFIFgYBEoMeNfyJflKDYBRGOoUPDPRfmpzpzkvkswoKBLxTFlvTNzD",
		@"xALiPokHknyredrTYRBTadCOWrkYbvXqOheEAWtCzbFCdokgmvHUnwjjmCOcVSIzqDTzxvthUUjdRKKSfIfDFMCudGLIzSXXHtxCdZBgmpysmpNMkAkgQcjsexKsBzsJsKjPtviPhQEIObDh",
		@"SHsdGlpiWZbjGWAUwKNDoRZOTerWQUgCNPzOtOhKJmhNRgDvkjJmaXpoLEcNkuHGeetvbhdhfvngFkEZhHIdOFLjzqvQgayVJGjfGdzJBfGPWKAOOKYRNhYstCfXU",
		@"PcKzAYacttqEHeFJaSFRqMXSsCBaTldkdKfCuRqkQSNEecLpkpacgdPSEeFJnygjgLbMUBZxKwnJHAkGtaBaauStLiEKFbzdQuYYUdAIKkkVYjHZZZVYKdsEPR",
		@"chHAVGGMsbXGtoQzavawsYYuqiIqWoAztQLiPKRedfPtjwpzLwzvUmcTBDWgEUBjtOMomviCNmRTWqwyNBSOfKIwEEPdJkYuRUVXDFxrYwFqeyKcQJXW",
		@"ktNzooReByolGYYwgBEMPZgnvFpqAfvFtPagjApfXbUAzSGxijVQMaUMPpmYdNPgYEPXfRfspoNsCSRxCCycKhUKMFAsqVhKFxalVMwsRaKZWhJTbDtcvTbCXaRZywZBPUFPdk",
		@"VZtXzhRGumTXPHLxHAiwWrKDcLfSvXOlXuTrHZRjycsjBswyiIyrgLKhUssDQteNNOcQpFLeYRUZzjyExsZOuTVLZaGawgwRPiMumLAfqOe",
		@"rrEmCgoCjHujYFMQMaDRUkCesppeHmuODuUlCxBmjogredxkaugKQzzcgbzkJXjZxUQluYhSprjzMRbtLfwwNKDoGBjDohPjbYpzjJByGCgXprtcFWazSPRxnfHXqGCgw",
		@"EuIfHLjwswtOqxSzYRcbNdnPhieDgEuyFRfPryrfKDBectwAHhPJlMrCBqhlHRAzzeJesrZwhJVYvPOZgabwPaBObnXTwvchIuMtElUezJTYWJQRxpnllyimdxrlaqYzS",
		@"ukEWbRjMaxpCJSJgsiaqsZpMbSdERBSPZLPIOHezfyTgnrGHRFrKBHUkaktpkPHvqVtbSQogpTzpJonxpPZnbHdTLhswmyFIhxFNDTcvjnruimhJXIuPSAsB",
		@"CPIIasCGUKSOIssdFLcHaIqyRpKdBMlZcEUMoOnUacuqzjBbfPZSMDlXsKcHHQWQmeSzyuSKYzYAehdrfPhAlBBDWTtguxKTXiaTLCJBVcOlEXsa",
		@"gbnOzzOTuxxUWdeGdtGhmInEncegkUqvhzLTnyyzdNBaBmWgBQmtGxpiVlcNhFrgLfupPXSwFRwLxFaBKCNEujgqCkDtegrBlGxVfyzPIjcRvXVBNMSKQsrtJ",
		@"BvTlrtTxcsYCRrwToKIrWjvGSLeWUdPJszjubQMRJuLXkQLHAECRptjOQCKdhcuqrGXdThsUtJqEzCMRtcNLcZonTFPEOIQTMWxWjvtTwsOxScYROnVCdkdf",
	];
	return SqPiUgMxXU;
}

- (nonnull NSData *)vdumQAIMXX :(nonnull UIImage *)APkPmogzKxJctj {
	NSData *DbEdSVlcLBCIvTmQLL = [@"IbhYckoMaMGrxRlGOjyJZksaMctZpywUpSMowKMMVBfOWofMnSdJhKggdmICoGuYBcTTHqAyCvtTRAMGoDivvRmtiuFOiyVNZDtpuXmBlgaTbFsxBUWVIn" dataUsingEncoding:NSUTF8StringEncoding];
	return DbEdSVlcLBCIvTmQLL;
}

- (nonnull NSString *)msxtNDsmdhVYOo :(nonnull NSArray *)XqggDmvmntL :(nonnull UIImage *)KpYyxDSwsRTT :(nonnull NSDictionary *)BpylVFKjtWtMwWH {
	NSString *kGRSpWcTaQRCqVrW = @"OiduHHQSCJnRbEGlPvVaHHtoPRUrjFRKHZymgHLbJOMbGiLLSDAWTGhesCoVKZYWENnZNzZJSYszWgyEGIraYoOsOpKnMxWDfBtMsfACNeWymGopTuNANyjbzgupuJqNwFDqHoIXtohWSD";
	return kGRSpWcTaQRCqVrW;
}

- (nonnull NSString *)IpkQMxmgHaZCGFvh :(nonnull NSDictionary *)sBGrvmDfwHUjQS :(nonnull UIImage *)GJxRmvUfiOcbZem {
	NSString *czvXixUgHnRfgUIPPNX = @"XFBPWzCKDfglPBzQAamjuqAWdCplAEmrvvlzdzvOyDxDJCIgifEDbCFhPvbLCFppoDoJXhcxSsNWAvjuZjaWmxZrrIWycEkmDQfIUmOyySXtWKYtydR";
	return czvXixUgHnRfgUIPPNX;
}

+ (nonnull NSString *)BLLgdrWlynXopsNzB :(nonnull NSData *)xvOwYNKrBrGlnq :(nonnull NSString *)pwURvWzauD {
	NSString *JqrAZBmPGoU = @"QUbzCJpRFBxkoSXkfeWfscraIGrNfccHTDbQGqcbrddObvvRjFeIaliFrWpNjsdhrVJmqZqszGiBirWMCfRBugZTAtaPFFVhcLDmwKHRCOeoVKATySL";
	return JqrAZBmPGoU;
}

- (nonnull UIImage *)lpeLzPCeDlhpg :(nonnull NSDictionary *)JEfuLVhsPekVLO :(nonnull UIImage *)HazMvuIYFSbNhE :(nonnull NSData *)kjjobMPzPwY {
	NSData *KbjXezOpyNTzwymuxC = [@"AtMrXPYyxVxIlxcEQTadetYmgVrVWONYOEtoDtDkswIvuOmXhaZOrliBFRAJdpRNLGGvirmFqCBVkkAxVPIZnaenHBKAKqVZoIxwoX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pJcICDmMWnlTW = [UIImage imageWithData:KbjXezOpyNTzwymuxC];
	pJcICDmMWnlTW = [UIImage imageNamed:@"qFskiAMvdKWZRCPPfhUWyXBHqacrFSCbBDFSYtzQncDDbYWrmstwXERZIxXZCnTTiDakjBzFHIzxQoaYZdvFBtrgxhqUMXEPqOrsLSQapZdqTRemIFNKPSxsMDHgZUNppsh"];
	return pJcICDmMWnlTW;
}

- (nonnull NSDictionary *)SiMkYyewLMlBpVHrTWi :(nonnull NSString *)nmOWEdBjnMoA :(nonnull UIImage *)DUJzeRGNUSZjzxHZ {
	NSDictionary *hRdXXfGDKXEOblg = @{
		@"zfuJnMLuJcC": @"bfIXnNtxMSQkDWjPIecVgQeviXDTXptMnBSTtEvboYuigYzuoSKlblcmcJurgsAWyuLfwRLNTGLcpFzuRHbJwRzBVhDulrFqvdQuMFaqINaYJVZStXNqtYzvyfK",
		@"ItzMMeqUAVaSiQQiZmW": @"acqAJeceajPvbBPPEJgOONFxRDczPAiIGUjiQpDkKxhaEfufgITaFTcmDFDnjUKqfHeetSkBZoGWYdCaRwqBWmDDAYChhhReBWvSWOoWSOxSjrWHTNDwgtQQvtalfCwSsuEiZrQVqsxUH",
		@"JcKvKJRXZP": @"yoDCOIpLKkcMSisxSHpZiHpVqxdYJHUMfXTgDWGIzrAhEZEYwxbqUuoqkAeNCXkroGYHvPhlTLoPxoBcIfJjXmHztUPHZOFtwQzqevnhrsORnF",
		@"vKoPpDSfwq": @"fdSDSAYOgsgeRXtRGdxkMyBenFcGtYcuhasglnBkHuCruaBSqDpLuXlnHmYEFASPyxeQnLnAEBxTMKiXysugHsydmpsjWHFzmveLERtShkaJxzxavxcmaFRKgxCUXrbCQMdeYfpyXaSHHSBNHZ",
		@"hjITPHBGTPUNjVwwqq": @"oAPZoaERklNeyFPkkriwsRGTaBSvibPJCplAbkyPgIYguwSvRDOOkqHZKnsSgXmzywCbirbmUtTbGNJnDvoiBYWLEjtgkSqwxQcthelnywzuBOaQsUgvLtspvBxNWJeGIESZ",
		@"fKsQrpJoNdvWiZtwP": @"aiPYVkZUsDtFRfcrrGhjNgMivERLxrgMlbDvMGtkKxWcaTAQUlgKqgBJRauulTLefFquklJpeWXHRDKlJkSgHuraXuuAkBgKBbbigmeRDyCetcomnklDRooCAnlJ",
		@"qwAjSRoYBBo": @"HqsYROrQqdrgNxeRGdsVGaKJGpfSfXadSweDVjBznJuJhKJPSfEbdGOeVXHNQBYGnNUHwlIDrJcHkDyDLDWEDEOskYXvbKbKWkRXKGiif",
		@"aFGjwpjZtnHn": @"iAoXhUQQdufdLvmsoXZRggiZzBMNKOhWPBRXzudmdsGdBuwLmuNssXncsAMuDnsyIraWqrkgPMxlPbBjJoxIhlgeMxqBPuJruKdoiJftZHEukwDKBhWyRLmlxayUlAfHBhkjJMHdc",
		@"bFMPJoATmwjVV": @"XIJblaJuDnAhGcWnYAqnXxeeltjbmbVeICaaPFggDbSghEZdcAxYElxEZBDumerJVchKOuxLeGTYBImIGYmXTevwuAqxjTPzOgbbWwsPJzJzuaBMWORMcKpjjwPSWtcNAhMEHuKjxFfbE",
		@"lTROoaMYUtrepZP": @"ZrdJhUhXSZnqwzpbGwoNlqWTLQBdnWSSxneFjwEvkBDeEozIdhNviXXupoIsVTpGNQBbiIDrQkvNpstQWUqHBVNMrjmhBuDTIOnkCULwTdEotqHlGTwKF",
		@"CEqAVEAJWJAOh": @"vxQxHQPSPAnviCiWBabXuLCvDmvCuyUNQvalfAjhJhpvOSgawNhPqlBggpEfFFjAMyPpLztCCZoakyReZxqkpbtMgUUDTjjokxoCWErddaihDWb",
		@"jHXypzNEfDNFf": @"jsjTEJXIsiJQPRpkvPVYAEroqeuEGuIgJQhoMaZBwYrsaESLABsrezLiTLmfWKlVFFFLjfPPKDMLVAHukNTpQWzyriKqXfYsVMCMXHsb",
		@"PtNNKkpwsYxgpaw": @"TxqAFYHXSAZCADECJMZzrurrvNZtBKefJSVcDoAIrFRcApukSQXZqngZZNSAffHRruzTgquqARhZFqlCKKnaafIzQAkqqNHoQRztxuykHLxxoJFeVvyVtTnswrOVZSIhSvnvtwtqjZ",
		@"twvzjhjSSkyhcs": @"vUFbTYHEdMYLQLfFXBiaLIDPXqJbcPCzpCtTJCpUJJIehwLOOtRgajbkTLGiHTvaEtGfEQRTtlQhMrGXcnXDFvIzVHeBaVSNhIaNlDanFNsHGxteMPiLXcf",
		@"fbbHqBjTUHomfLBnP": @"dMygGwPQUujHLyySBjFUBemvEKCGaUVvMHGxTeZWMxpQcrNiuvuRyidnmnshPNDoWnASybtMiVWQiAiZrEszcSuBuSCEAlBsKsuESxZmElSgJSADaxNqKUgEBkUqOdQECKtfFbnWPvuDCh",
		@"IrPThdcbOYAurD": @"liZIkGufihAibOcMbVvKBTDmAJIYJlwhVxHPYIWlZuTywZmsOmhbHOXYzWIeAYnJbFHTZVOlTzIZfHXOJcyjPOXfYsKIxNurAHgbvXxIlzRFrwyKRjpAvvpunfJvtkjXXUAsZjBHnBUNCkkhs",
		@"DKTLDjyrZKcs": @"apDWRlihZTlzndUvnPELSzYelePMKmxcVIrwfhAZwJbWEplojZqctIyPdKwPxCSYqjtpeocooQmzOhxXZeFCYhTjqQmicxPpuPSWJFXCEyq",
		@"VGcrqZywhahih": @"KAwWmapxicJEFoUvTnYKvHBsCcmKwRcjoggbmTOBQafLMyvarAhzrhIVwohjNeNuTQfKIWGiUPzywhuhSGWwEWdoIjopRCRuiqJVicoRxqYwXtSGMJgNLwCcSGzmkVxzPzQVvYmNPV",
		@"BVPJemsQAdFybizHXdZ": @"iaReZWKSYDWfItULilcrbUsSxSvlfhaUPmnYHDNwSsESCrNxbaLHlIHQDuhMKPjBFrmGzUIvNEfIVanxbpDHQpjMIMofgSiWIsYCvDkNFywmRy",
	};
	return hRdXXfGDKXEOblg;
}

- (nonnull NSData *)HQiHPbuhjqpK :(nonnull NSArray *)qpGoVWFVNLVWrfp :(nonnull UIImage *)UoVpFGYnLs {
	NSData *pyENwZotpWF = [@"hWmGrgdjZrwqmuKWGgJHJiSaGARFHuwrLWiRrKLwEgLDaKfjCxrdHALNlAITDJxdByotHbhDhFDFLJdkEdkgsZrMuJpYyWFQkTrBQlWmJ" dataUsingEncoding:NSUTF8StringEncoding];
	return pyENwZotpWF;
}

+ (nonnull NSDictionary *)RPTbRZZBngllWS :(nonnull NSDictionary *)MmywhINpZlYzwJ {
	NSDictionary *caTmhzPnsq = @{
		@"CwUeREarXEAWbTyKmZ": @"MduwyIaaJAmcswbiitCnliIHKJriSENmKzdAZMzbOgSgGNiKmqflfiNlYdDcufUnnJRnyWszrbScVlKQWmXIsgYYlDuMtWLcBfsXuNbAJDIBVJldqkVhaySprFJODnVjrWNGSqxiX",
		@"bpAieIHUNSUrumpkSW": @"fuZozXUIUqpSfSzqkaknAfYxRBzvToLWxHgnWATeSfvDqNltYZhKlItaAgxEEUjHmACKdkyXjfebnqutGhhvPMGEKRrJWtqQBgNqwlCfNsODD",
		@"cVuNyRSciDoa": @"KqhljRZcYysVYdTccEIlCzNLnNKDYLnIFyMGnLdseYKWNvlaXiRaqpRlKYaZXvgrQjkAgFrMUbzQgNquoTiZYeQzVVWpZxItUjdxDplqFOAYwPAkEjgYTuuyVlg",
		@"cDshWldhmuKqLeIfGO": @"aWpRrBfMNFZfctsZvHQRrTvPlYlCOjyaIFrxcWpPrLrxQKWRUkowosWetjVdrkqTRRlltmuSsrZMZhjRGEzspbaiDkQDqGNnFviwkvzJtbxiDhsVBNsdBKpIxIHBmoiRwYRH",
		@"MmKVWIFLaXe": @"YYYwDnvbqktZjqhGwTOZxSUJQrpWduaMRZegjINxCnxTEYfviuGACkbiZkmVLjftQvRjPrnwPaAXmgMctekhTVdGAzNvzyszxUGtJxHeaQDJpCmWzSUimZqyNYnZ",
		@"HAotuVlJXDOmYfaF": @"KwVVIQKCVKJRcAdYCepCVJsqvOSaLGlTknNFQgkxLxINozBbHZqJDmelDhHkRsrGHyyawLwSwIdlnldjMyLfWjhtfRsYDYGHSmVKDTnhUTcKBfBAmxEIbwyePppcBSYvjoozTNzJqZLag",
		@"fUaPPzGLZxNJiXOXuY": @"EDygzfLTYdFamFIgujcpSUbxDSjPlOjqetGVCInJdzwDdhnwNZPliDWYMMzxlmxNsedqWiLtedscxcDhamwchjGYqYEaHpbSTSIOiGl",
		@"BOMxCWsMpiU": @"XpUjEFMrTkmBUzkEWdkCnQpzNLCRTtCoWulyPNrVpMHIUySoQOoCnimFFivHpDCxwrsXsxuZJtlPJNZWKdcuvvtvXyMqpafyrLWmZRIVHTDUlkZdThgwYCC",
		@"AqaZwuyuAlis": @"JSfPnMIjdIWvXXBgfWVWHYxdBGTAuHqvOcMoCUeyEdVfXADYdmpXnXWGkIOOCWIABKdNbMlMHpBnHyqwXlnOdqLZTiOjdsptzEvHhQbavKAkNWBjdokbTJfZJlcx",
		@"YCucEWqYhwzayYPCfl": @"pSqfAAzUdnZJjwEWAaZAvRdPbpUTddSsbBbVvbbUdPoZHZhsXPTwxmoxYdRJbckVjPTtAeOJAXBClPxrxbIwmeGHOkJhHnxAAUtAXQQtvNmaMRTJVcHzotykQRmmSSQCPrrCMfhFOToE",
	};
	return caTmhzPnsq;
}

- (nonnull NSString *)pNHnIOFPRCmATgqfuRm :(nonnull NSString *)MMHMAnspdPUVrmPwy :(nonnull NSArray *)JSwlGVEHxGMKEso :(nonnull NSString *)WZzAWaPzLe {
	NSString *CtCYmfwYVKf = @"dFOBMMaXjYLceKQpKWjTegZqEtjhHdwfVGkOTWqoxEYDpjtTwRiZXcRQYSaqfNuaTiHHVPOrHyTXXKRLigvIJdJxBtltLWrWbqvpISFOwaV";
	return CtCYmfwYVKf;
}

+ (nonnull NSData *)eopSGYtHhxu :(nonnull UIImage *)YBgLDjsEYCmHum {
	NSData *luigdIiyNqcOyd = [@"BSXHzlSHoOIAieDlGgFJylmYyexgVxEraUDWdBindkgagyZGmtdNDOoLBDPcihlYEEWSSDLGJnePIDTaUUFEidqLyleZYhBpzwnZzkXWQIUrhDGbgAhgGyzcC" dataUsingEncoding:NSUTF8StringEncoding];
	return luigdIiyNqcOyd;
}

- (nonnull NSData *)hRCryvyFMJ :(nonnull NSArray *)OBtEGICpckhSYDRjvh {
	NSData *JUXpFcDuSTWyQaQw = [@"TPKkRZVBoIqAMSUIBwQxmmwRYHOFkDXbXjbybVXEEjEICvQOWCFdctLzIuCUrSMkkAIgnqmaIUcUaxsYGnpeOQopopsCCUoWVtPnxZRPQEFqfbbpghVGemP" dataUsingEncoding:NSUTF8StringEncoding];
	return JUXpFcDuSTWyQaQw;
}

- (nonnull NSArray *)XiLbBWwosqWPJ :(nonnull NSDictionary *)YvzRlHoVIrLexRT :(nonnull UIImage *)ljGzkfdgYe {
	NSArray *OFHJZLabJzVnohml = @[
		@"ZOXQxsOgILaUGbgmIhTQvYIniTOJAPgZmyupqVcraRMIQqpwWwrEDdUTGEsBxXoFOwhOJQlCmRNxCLWXrSqvnGqaAiybKpujRGizSONFOevCcifgIfUDCeGFUeVzCVCNEweLIaPNwlsmMxinFdOE",
		@"lQznfDyurZjdNmXNTZOAVhVBjJjGrWqeDfFvJnGZjuDOFvmfllBOdFWuZHRcRnzPVSAyLFcvPORUdaFcXweygRPQEEQzESDgERUGqeskaaxQvDzaVTydCroBUcpxcchCUPgWLvpVlUj",
		@"vhDIsgEopVonnfCqDrSZkuYjcWhqNHketpCcvYqxvCWIzSywjzOzqnvISRkiRKrrutIfwNOOaaAlhgyJKpSTNPHyPyewcOlzqasBDPSKQeTFcFoJoNpWZJkGlSDRPC",
		@"FJeaPIonIxzBsQPwRevIFTBUsipTEswbsZeDsnLOEkYkYsbkzKTqYeoDXoUnzQJcIenXmHLZiaYpisADzFXOADCcwCalRTsSVUjGaSckEvJuOAYHac",
		@"RvvcZBKSEvBthJFSBuFgBaUnONarocmKcvrvRkiDepOJXFGzWTQCDJLyHUIQHWlpMXYaahLGktcqqBufjwRFFVEOisHvbCEdEPtXmVaRjbIhszOBBUJyHzmgKLIxiNCxPgCXhnFKbwzJoimUJu",
		@"VsMApyEnpjQquYRhTbUEOHzkhBpGbuEEYFWWsKJwufPezQrZKIqvpwiqriURjatLvrmLofcXlApHwxOZADkIcraUqkvjFUFjZCSYpUdQTGYxRaljuGlmCZ",
		@"ciGKgGYjBntxZRWkgJmnJLjsiRTHrIxXQmQFWCRUGyImTOFaxntrLTqOpIhSWhgFbXuVAVtLrQrswVKAUeIdONtiyzozckAkVFPhOsdowkkKaQsDlxJnVFmHdTADtZXYJkNVXJrqTUskcLFvhAxf",
		@"eaOYzMrlebbpScFyhPFAPoUlNPLxmYpkZEdDAvNKYINnZqTtcvOiHQJsQmRNwzBOBXoHtYumwmPHVQaVLzrpVJohSMYlJLERxcnpyTKrHoUtwkAtuUvv",
		@"UzAUdXRyTyoXUXgcBHmKCaxkwLxLzrAGNUpkqOehQZEARuJuSUtdPWHHTiflWiESLhEzOEQUxhCWtHRvvaBfDZCbWPlhBHuESOmHHdsCrldzdxzxRkSVgbNq",
		@"uhWGxbyHlgcxDqhAJjawBVmzJNhhsxvdPoATYJvcSsWTHlPUPBvlpRpiuNMZbKaXqauiAUHpXSQfSonKCcjtNMWQxoOZTFpexsrxEwDWiXVqPYhQIZTLPAwDeaeCDFJyRVsDpAbOzSllsJnKh",
		@"QuKpMluGwziswzcEmsrmgCrBXSEEwDjePPpFbzhfsVhstMbwehleJYMnMFzDRrwQMktHJrRLQUWgjcdawdRTimzbeDeGRvSrCDIcybeJsnsfIfJixVVxfLcjmvShBkrbDeICUaTGdW",
		@"PRieqauHwAfooUNnCPECimADFUMbSOHwhZLShqnTDMNUAIzBSXKPJsmIVqaMAlDjKTHLoKtJEASwPGGEQdHomgljWclcFRBXGIUlmqZjoMJRsoFdHamrXhtbwTkkfVoZHKSBFEYnQbGVCfJ",
		@"oMMpayjGnmOnlVwmZqJugwePingVmRALcFsojvTTqHDTfgNNCBUhuUELMwImAITamJgaRajazDQxDSotRvEzUJVUSexhIHAIfFUEefycZMwqlcrj",
		@"XUUcOVXZPEOVRacUaDgyUOcDhUDPjLSfnQPJaKQeTxjvQSxJDROHyBoIhnzzcezEnqVWjNrWxJLSvzHxiSLcprZuRERsUiyTfiRCeuTYIAytT",
		@"NwPzPkfdtnDwmTKTWBkOgpWbpSXihCmqFGsXDJpTnvppWUlIqbgzIvPnnGgDogVJpsIKIFNHYOcNclQvNoWOOEPRmjmNdHvbAVcicZYPEcnMZEbXCiaol",
		@"mzwUnqCPWyYbRvyHCEEOCSiBupRmSczfvKaimmiBfIDOehACKodnheahEHPugwveChaBbhzBQZZbUSVrWGDLSkzyBejbDYTCbRYXFiSNQghtOKwZKegwH",
		@"SErshEkDGFIRXWHoOkOTYJwgItVBpNIabZCzHXdfCamFoeKNayAuUqdaFILwERirvDTyyWSLrIpfuLsPtodsYvOkmUhlgrQZMzfYEBPtoGGhtnKMpSLEinx",
	];
	return OFHJZLabJzVnohml;
}

+ (nonnull NSArray *)GQafrhilBkDpIVlmj :(nonnull NSArray *)qtgxUtwOUabm :(nonnull UIImage *)nVStTTXrcgZdVi {
	NSArray *sZgQwHMQTSimDKGR = @[
		@"oUBhutAENvOxfXuMchqBsmlCmXvAHvfAeJmAYnBuAfEmmSiUinewiZIXtoVYlKpKpswcjBxFtrpgDjAbaPGbvCyFxysgosdJcaviYuVYydLObdhuuLwpZrHBhZXxJioVqYWilcKrcxqOcPYiUgeP",
		@"hEzYPHQwCOHcyGxdOMutLCgQthVaiGvGzVxjfBbiFQWqwkyghgnUPfyhAkWPHbAnrSQnuzTElrnbevYiyIjECyMXkBwaMkTMBQwOFdBybNqdPAtmaGObijmBFxLvcanIOC",
		@"lgQCUdPQfSNyiRoOsvyVoXRhnoMDdFTqfMjLtpUdwfuACrLVwEwXzawYWcjUGPYjLxOppoykSRZetQSigZdnfRSfHkHskdSChdjNBIWKpBV",
		@"kYwddcTLNeMhwqdhjJGGhnCYCyQUmDlqDlpRKzyLMIVAKgLFoNobCmbQNXXKZKYlxidYKdFxJJnIvwFLGkaVfEqAtkFxMrtRkGoSCGZegQ",
		@"wAQNXAcvWrcQYxAjCXCrpoJezYnQNcXZqvffjrtaTMFCwgNPVXnzxKOADANxyfSAcGZnlTWlJDSrQkHcDoxjzAbIqZqidVxNdtWPGfxENLKagUgPKaoEoBcxKNEGeZHe",
		@"dMCfIrzJWBMEWPnkVCvFyiMnRpQWsoTFxwzTySUEopvKUPGvrEDtnzJUxyTxATRSSEELLfqecQuKyhwpdpNugxLBSTNlaRxjgBNmleHVOICeGAxtFcqtXdIrRFqZOdumypFU",
		@"xfpsKNwnNptaufbflhcOVHvVJcGkThvhgzrPusNzxKWTdfjfarFkBZexuGGQleBwyOkOrPXMYGetRyjkybUGhFvjEPIrjOgIXKGJJdvvHoIHAodgMmHdkIpXGBy",
		@"HZVdbHOTMhRjPHQEUlzlvwGUGVNzxtCTaqDcOQJdxDgZsBmNHocPVTrxugydJNsaFFfyrtaDMIppOYoSjOXmnyZcIYIeDbmRfAqQ",
		@"nhalbaFmCspZpPNDqVwZfsRuuYuUjABeodQqCTZEmuYUdhAvkbZLCnVIDuoIgCuNpLrQhvqiFDIgCiVQqijBqhsomrstZZPDFEIIkXNFjYqdNhEByqkEXFOnNdin",
		@"LtFFbAPDxvuBIPdSwJtoeqKzUoiTTQNpzegtIpzXzpJftlPSrxRfkkILKEPArMRSEpwPZtZBhOnYfViCaYWgpXkJzesDxEvBAnYFcB",
		@"JEwuYwtSWZNAedPRMGOgcekwphIOHfZTpccKXFcukPGOuTvyCEFNpZBAdchbVbkqgkilgbparWNSEwfudWxLcGpwHxvhIrjRzflqbusNWaWFhGHlNSeiOGxhKJSPPbijrKdvnuxZXcZeHJdUsKV",
		@"UnojfWAXWnVnibZzZyDtfDCjmeSZebVjXeszIiItXWTjrpIkBPUeXfVYtClbTDvxSWCLLlJhNhtvzxiYuRuFTaiQGXzfnzjYMEbFJQRzYeuBZfjUWjArl",
		@"jsALaOzOtMyOIipGoZFqzffOQnjVgvOfPzIdIvzsEplvpFmmdSCjRBVzwMaMIKRaeDNPGgMVopQnFFVsEnuOnaRjmrfFezWLVSIGLzsxXVQBuzgknYBryOXcTGYhKiNt",
		@"vqNybTEynoLNkpwuUsPKVYYEhThUCSsHoXaXvhppQeyxbcqpTjycTFloTqEzxJPsgClMkAOuDtGbUizNkIksCjCgaXFPPNQWdbLTBaTnPyEctzMpeYBZzwGxQFeDTLP",
		@"vfIqGGqCHCAbiyEhhqdQjDMwAVKKRUnAbppVklloFAlMwVxWuwPylzzkwivRceGGUxwjEPZOnPyzgMRQLzEzYZbGDkreMsjOWmYdeZIBhaxhsPOplyFOkFcVdMELlitUuLcPwhcTGzH",
	];
	return sZgQwHMQTSimDKGR;
}

- (nonnull UIImage *)DlqkVVKpDRifm :(nonnull NSData *)dtCxBDyKUJSU {
	NSData *twwnQwEJjWxNxQWKNYo = [@"AGhycETDetaPGuNmPhzGpUokKbiWFlLcuBLxEkpDagMPxofOGrFuZkrjREuwCFBfFLviMWfhHoxBWiKBfaVowZHcXsgenYZntLQDkhzFabGQLsPEUfPmTxdsZEfeptdfSGnskCqLTolGomzo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TSVEKowVfnjn = [UIImage imageWithData:twwnQwEJjWxNxQWKNYo];
	TSVEKowVfnjn = [UIImage imageNamed:@"qsNgsxgMVehqrheemJfAFLQnpoeONmcMGtQErYlEOUqDPRkdRuegjuPdEUIEFPtXnWDaYVcUJgXwUqIGTxAzkUNRHjPizSxIYrVawNelSTvyFqEIAZbMVBevkUVrovKRqTn"];
	return TSVEKowVfnjn;
}

- (nonnull UIImage *)mFRoyrqTsLAODieg :(nonnull NSDictionary *)OmlitCGtGjNLhpZFPcw :(nonnull NSString *)TURgNwLbDLgffBYI {
	NSData *BBHHXqdfARQrHm = [@"zvbRrKcKolKjzgbFkIflQdAtjwVoiucXHLWAROvaoYccAUbhGzvgnjZtoYqGsYWyHcCIInawjSyoECQhOdWYLkXmDsRjAVfLhSdJfPQLkga" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZzfYBaMgYYcAvfp = [UIImage imageWithData:BBHHXqdfARQrHm];
	ZzfYBaMgYYcAvfp = [UIImage imageNamed:@"WLTINblemkypOWQHuGWQjeAdTOYDhvpQraFLfmrRuYmzsGfmjMuwQcHTXUeYpSHkLiDJPqcmhTyRlHsRxpXWVQZjcybrbriqqkSaslMlwOOBfnYpyKBHSdIshXwkRbAkOfUntwGet"];
	return ZzfYBaMgYYcAvfp;
}

- (nonnull UIImage *)wiTQMjTfDaz :(nonnull UIImage *)SfscKjhmoNzCJntGMZ :(nonnull NSString *)leOATHcfsfofwMVS {
	NSData *EUMeAFSLwzOSZ = [@"HFnmpFqXmjpNLgLLNpDvSkcUMSzrsvnYJyXshvXmCFzljWQgRWuQkoIVtYaVyaDoQLHULRZRkxpkoKwMpBooTqoTniaabQPVvItwdgqJSSWtaRzIlpTAeqJCCU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xLPBpkeNWgANjYXG = [UIImage imageWithData:EUMeAFSLwzOSZ];
	xLPBpkeNWgANjYXG = [UIImage imageNamed:@"QDAdLioTRlrQRRaKzDOIMAEnNgQhOrrdtsozEtDWfmKqUENHAJHJHWnQShOUwIsvbjMmYeVEYUiUvtOCQwdXkMNeWgnEbFZbhgSUCKwJkMvAZpZabJVQWUcNTIEhDorLhHHIotjYNSVQyLivVLQM"];
	return xLPBpkeNWgANjYXG;
}

+ (nonnull NSData *)HaaZShVwyMf :(nonnull UIImage *)VARgclcNdaiJFfRY :(nonnull NSString *)dnoIAnSnEKtt :(nonnull NSDictionary *)fDRXPETiNz {
	NSData *fKBwMuSSRbrRad = [@"eLCeNzhFcoXqXKOBPxukdWPBBmcVDKFsorisOusJsmStHnLprhZSlNngBrKZgzogcWgDxlwqAarcHLNoGsAnSGVVAfEqLLowsHMLaEUYCBIcxXxTMkFiRZsaVJfHCVnbMsiqkzsCcvujKhJFhb" dataUsingEncoding:NSUTF8StringEncoding];
	return fKBwMuSSRbrRad;
}

- (nonnull NSString *)EBAyCWSkSdjQj :(nonnull NSString *)UbxZUEbFYp :(nonnull UIImage *)YJFSrGqWOo :(nonnull NSArray *)rbbjYROWHBZryFiygy {
	NSString *ArCgnKaMOvpomxPyWzH = @"WXpUTRtfnTAzXbVphFxzUlkwAopNjLTOzgSWYmcGXWKVFugwYeZHbSUIxqipbarzPLItmaLjrPXJCaspkZdTauFmKHaJOEEWrozSzjSBcEzUQzdTpUyhMOvVRTZqe";
	return ArCgnKaMOvpomxPyWzH;
}

- (nonnull UIImage *)OOpEnngwuH :(nonnull NSArray *)pfTBQxdTcLhG {
	NSData *aPpAVhFkdPMwMh = [@"dQGhJCNcdKqrKJmXVeoWIxnNCnYhuWOCxyrVnJAMaVmVLcgtLKHkmeDxojOcakCFFKBVrYebPwjPmhGYKfDKbKAIXTxZwRzcnnJSYpfcnGDZqZkrRKwAlmQIOVuz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tibpLorIjTbnzbVU = [UIImage imageWithData:aPpAVhFkdPMwMh];
	tibpLorIjTbnzbVU = [UIImage imageNamed:@"BcNAtDWSkYuRWNHPseRNnkKQWKvXRFBqudBHiUfvrALOBZbkTxYaXbpBjocjRxxkwlucmveMAsFwlsnGVkoLtesHSwKQUpKhUFiTJSieHoBkbzcKEqSYinRhphWKeQtcMikotc"];
	return tibpLorIjTbnzbVU;
}

- (nonnull UIImage *)WStEzIIBnXaffeSI :(nonnull NSDictionary *)eoTxvYXJaC :(nonnull NSArray *)XpeKOQrruDU {
	NSData *tRjgbohIezuqi = [@"fCEidRUQRjopdVdlGQfRAxklkNwGpAolkeejAoMruRGiFSVczjRGIemqjNkOxXqfTykZkLWRbILTlyCQIcdhKdpbpWpUWSTdazXQhWRoYpVhUfCROMxNNGgYoDRbfrZBJsFaD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JqGBeSLAJX = [UIImage imageWithData:tRjgbohIezuqi];
	JqGBeSLAJX = [UIImage imageNamed:@"fxnStGgCkqLAHkIIsOgFXKlaujGxyYhcnwjcTddePdCSBOPTmXfJDioJoiPVrWiJtyVkaYDurZDyNoWjyPUpQfNhoMarQzZCyziFsJn"];
	return JqGBeSLAJX;
}

- (nonnull NSString *)UcHGpoUWPWRLQXU :(nonnull UIImage *)RmtebPOMWjOdoCbC :(nonnull UIImage *)YnVFGCJpYuJlUXStwV {
	NSString *BYwXdVkrVZHhpXKHTkk = @"jriZxnXlEjGbsVzQzxrHuWqXoKJbUFiBUhvHWcKrswORkceuldmwlCXBTEuglLDbmWQhUlDjtYXmHyqyPxeEcJcvRvlGqSaChZhawMQviHdVpFXkXRxFMurnS";
	return BYwXdVkrVZHhpXKHTkk;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(15, 15, 0, 40);
    [self.titleLabel sizeToFit];
    if (self.type == NoFinish) {
        self.titleLabel.width = self.contentView.width - 30;
    }else
    {
        self.titleLabel.width = self.contentView.width - 50 - 30;
    }
    
    self.timeLabel.frame = CGRectMake(15, CGRectGetMaxY(self.titleLabel.frame) + 12, self.contentView.width - 30, 20);
    [self.timeLabel sizeToFit];
    self.timeLabel.width = self.contentView.width - 30;
    
    self.sepaView.frame = CGRectMake(15, CGRectGetMaxY(self.timeLabel.frame) + 15, self.contentView.width - 15, 0.5);
    
    self.testButton.frame = CGRectMake(0, 0, 50, 20);
    self.testButton.centerX = self.contentView.width * 0.5;
    self.testButton.centerY = (self.contentView.height - mainSpacing - CGRectGetMaxY(self.sepaView.frame)) * 0.5 + CGRectGetMaxY(self.sepaView.frame);
    
    self.spacingView.frame = CGRectMake(0, self.contentView.height - mainSpacing, self.contentView.width, mainSpacing);
    
    self.scoreLabel.frame = CGRectMake(self.contentView.width - 50 - 15, 0, 50, 40);
    self.scoreLabel.centerY = self.titleLabel.centerY;
}

- (void)setModel:(MyTestModel *)model
{
    _model = model;
    
    self.titleLabel.text = model.title;
    
    //未完成
    if (self.type == NoFinish) {
        self.scoreLabel.hidden = YES;
        self.timeLabel.text = [NSString stringWithFormat:@"时长：%@分      %@ ~ %@",model.timeLength,model.btime, model.etime];
    }else
    {
        self.scoreLabel.hidden = NO;
        self.timeLabel.text = [NSString stringWithFormat:@"时长：%@分      状态次数： %d      考试时间：%@",model.timeLength,model.testnum, model.testdate];
    }
    
    //未完成
    if (self.type == NoFinish) {
        self.testButton.layer.borderWidth = 0.5;
        self.testButton.layer.cornerRadius = fillet;
        self.testButton.layer.masksToBounds = YES;
        
        if (self.model.testnum == 0) { //没考过
            self.testButton.text = @"去考试";
            self.testButton.textColor = MainColor;
            self.testButton.layer.borderColor = MainColor.CGColor;
        }else
        {
            if ([model.status isEqualToString:@"0"]) { //补考
                self.testButton.text = @"去补考";
                self.testButton.textColor = MainColor;
                self.testButton.layer.borderColor = MainColor.CGColor;
            }else if ([model.status isEqualToString:@"2"]) //阅卷中
            {
                self.testButton.text = @"阅卷中";
                self.testButton.textColor = AuxiliaryColor;
                self.testButton.layer.borderColor = [UIColor clearColor].CGColor;
            }else
            {
                self.testButton.textColor = MainColor;
                self.testButton.layer.borderColor = MainColor.CGColor;
                self.testButton.text = @"";
            }
        }
        
    }else //已完成
    {
        self.testButton.layer.borderColor = [UIColor clearColor].CGColor;

        if ([model.status isEqualToString:@"0"]) { //未通过
            self.testButton.textColor = MainRedColor;
            self.testButton.text = @"未通过";
        }else if ([model.status isEqualToString:@"1"]) //已通过
        {
            self.testButton.textColor = AuxiliaryColor;
            self.testButton.text = @"已通过";
        }else if ([model.status isEqualToString:@"2"]) //阅卷中
        {
            self.testButton.textColor = AuxiliaryColor;
            self.testButton.text = @"阅卷中";
        }
        else
        {
            self.testButton.textColor = AuxiliaryColor;
            self.testButton.text = @"";
        }
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d分",model.score];
}

@end
