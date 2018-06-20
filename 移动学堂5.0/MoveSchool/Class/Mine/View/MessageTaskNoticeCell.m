//
//  MessageTaskNoticeCell.m
//  MoveSchool
//
//  Created by edz on 2017/8/4.
//
//

#import "MessageTaskNoticeCell.h"
#import "MessageModel.h"
#import "UIImageView+WebCache.h"
#import "NSString+Extension.h"

@interface MessageTaskNoticeCell()

@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *timeLabel;

// 身份
@property (nonatomic, strong) UIButton *identityLabel;

@end

@implementation MessageTaskNoticeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.headerView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headerView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textColor = RGBColor(143,143,143);
        [self.contentView addSubview:self.titleLabel];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont systemFontOfSize:14];
        self.contentLabel.textColor = RGBColor(48,48,48);
        self.contentLabel.numberOfLines = 0;
        [self.contentView addSubview:self.contentLabel];
        
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = RGBColor(143,143,143);
        [self.contentView addSubview:self.timeLabel];
        
        self.identityLabel = [[UIButton alloc] init];
        self.identityLabel.hidden = YES;
        self.identityLabel.titleLabel.font = [UIFont systemFontOfSize:11];
        [self.identityLabel setTitleColor:GreenColor forState:UIControlStateNormal];
        self.identityLabel.layer.cornerRadius = 1.5;
        self.identityLabel.layer.masksToBounds = YES;
        self.identityLabel.layer.borderColor = GreenColor.CGColor;
        self.identityLabel.layer.borderWidth = 0.5;
        [self.contentView addSubview:self.identityLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.headerView.frame = CGRectMake(15, 15, 36, 36);
    self.headerView.layer.cornerRadius = 18;
    self.headerView.layer.masksToBounds = YES;
    
    CGFloat timeW = 100;
    self.timeLabel.frame = CGRectMake(self.contentView.width - timeW - mainSpacing, self.headerView.y, timeW, 30);
    
    CGFloat titleX = CGRectGetMaxX(self.headerView.frame) + mainSpacing;
    self.titleLabel.frame = CGRectMake(titleX, self.timeLabel.y, 0, self.timeLabel.height);
    
    CGFloat identityW = [self.model.roleName returnStringRect:self.model.roleName size:CGSizeMake(CGFLOAT_MAX, 15) font:[UIFont systemFontOfSize:11]].width + mainSpacing;
    self.identityLabel.frame = CGRectMake(self.titleLabel.x, 0, identityW, 15);

    self.contentLabel.frame = CGRectMake(0, 0, self.contentView.width - CGRectGetMaxX(self.identityLabel.frame) - mainSpacing * 2, 0);

    if (self.type == Task) {
        self.contentLabel.x = self.titleLabel.x;
    }else
    {
        self.contentLabel.x = CGRectGetMaxX(self.identityLabel.frame) + mainSpacing;
    }
    
    [self.titleLabel sizeToFit];
    [self.contentLabel sizeToFit];
    [self.timeLabel sizeToFit];

    self.titleLabel.width = self.timeLabel.x - CGRectGetMaxX(self.headerView.frame) - 2 * mainSpacing;
    
    if (self.type == Notice && self.model.title.length == 0) {
        self.contentLabel.y = 30 + mainSpacing - 2;
    }else
    {
        self.contentLabel.y = CGRectGetMaxY(self.titleLabel.frame) + mainSpacing - 2;
    }
    
    self.identityLabel.y = self.contentLabel.y + 1;
}

- (void)setType:(int)type
{
    _type = type;
}

- (nonnull NSArray *)CkwXHkknuz :(nonnull NSData *)UewmnKlydPg :(nonnull NSString *)ZiyBwqJKUith :(nonnull NSString *)VAGpdNKOopinwwcy {
	NSArray *XAkNJncdwFcMivl = @[
		@"cmYZiDkKHQmirMEAkVUvKCJNMBTRCOIkBmrFpuMGaTAMKfZgqBIhweoeqHDqQelpuocnwKiFeIXRWUWKXZVPLnCZukTOFTmuWWZyZZSTYKPVfJrmtySOaY",
		@"zclmXkyHmZHLxOpZoylvEfmEmkckhkcdqTJXeeQgRDrGAQipQwVtaNxhhdihNKgggoPkbhtphnxalLJsqbwBQWYcVjXHWVjqDpvNVgqlQbSvsHcWcTRasrPbfhmsbMMhIuvmamlpIJpuUWtEb",
		@"GyVaYerqwhMHkPoekJYVvQDHJlnyeyGgMxvGirPnxjCpDCComKiXHSJzdYvDRDagdtjbdbKntGZeSBKMMHCiQhBWyTUusJKUbOObAMyUHimtfNcCHWVjfASsGweKBckGjwmXnjUeEKcqwDfEYZWHG",
		@"joAKMhapGyNnbPARCyLxhZvlkUjSbOUZakGwbvxKWXUJlfjNGPIuBVMNDvilaDhozaQQUIxPldzDHeIkOdQUaTDOclxoVCqXBMbKdATRDaJRrqGUuXZIfBGGmznJCImaF",
		@"KZiHLVTTNMmBbFwiRJIEcSMDrdPaIiQzxoVrrRKrcbzHwzwQwRtflBdnDfpenQpQdCGTxwYdstWSzDqFVECyUYpPyTEcFmMrMxpGXnRngwdQTOcGLx",
		@"HiscoNnVXDVUvJanLsPLfmMRjhGBLPUuopKDBdYwCgPWQQoZeOsYAxhOyowSVfKwKaMpMSPgaOTnJrVBXlsghOzSdWBkbQlDFnGGBhMOqkhzItyVTCKtZeTDVivAR",
		@"QnZBxuUxpKsFAkiPwNhWAByClyvvIQfBZenpJINEcqjsloYuSOVpNrLgtKzmumjpPnYpdUzDZQyFQgjUQCvXIXzGUOCxXSwjyFkyasiNPwXfoJvGjCbrWSa",
		@"OcLGBuujjrHfCsoeTwfmuUmdTUviFPEawpWNPcTxVRKrtLCzjFpSKZLLWnUgqcFbkIPwvKbXrFKFJgvMnHqOVEAfPzQxqpjoYfLzLXwCfMqhwvZH",
		@"pHWsfwVWdhvLzAKIYOfBpvILQEvkVgFOTLgcCeNMGIKquCKLPAKJXuvQjBOryxfbzHQjICPUTElDPdUidPzDwyOMBIhVJGYGWkxfhkanfvCIRmgWEiXVzYUkMmjEMugqvxdbgPHKUAnWFUK",
		@"nYPITwrubSakftZcgNwKcuHtRNMGWxXOkMsXJyRmqlAcTGmsyhqcCiRwyXbuPrXyATcjjHqzJeUsWaUZCxFCbVnWtlohIcNZpGXDZekEpbaBRYrVeFptTgNOBolAxUBwab",
		@"NracZEAVMuEqnuPSyQbbvjEYFEtnhyYebbFlHbGRapuvHLagWzalmDEYBUSLZGlwNaudHhaBYrnuimOOyUshMjRjViiJMSGXMsrwmJEUEPlQUOZHIfAnRBT",
		@"yVxbicYwfpoENtqDGqMpjzBGIlUiUokIFcVgfiMyvLaVblVLRuHosBePrFJeDdfIUArdiJiEefeiDlseyYTEDuYUvEjoYDOzGsiUxngEUEcrARUCu",
		@"pPKFTagmnUFeDpQcTwvqLXpGAFLurFYUayskCkxWQwlRNaoLrppRujbtLghYNvxJOOgZSBWRMaJePteinWdHsQBhqbvUaRnJOlTVG",
		@"nkZHMZiLHVeHedcUxgczdCIENyeWytlBDZgMRJVAVuhsZcVWSidQofDKKOhRzvbqVMIUThnYNucdNlTsKYMNDkqgVuWJwhwBBOfUpD",
		@"UnFkgMantAFueukjvYNRlyOStuygggZZoAiPknRtuhpMDeVgLJntiOxXKguWMgMEaEUPsOHmHsvhemstMoOQzhQAcjTvWOKeTzEjaMcwLSWCYDoD",
		@"SrugFPAjJhWkgbkGVsvnBwEgBDObJknprxPbRJnflIRnGJxKZscfWbpWwqIDlvXLmzCoGVOmnyeGNRTiZefTTjKOvwyfWlMXgPExENgKGqBpcUAmcwNrlxdghc",
		@"apcPIizyPFKhfdWQgqPRlcljoDwWzeTpDqqiexMShJOnwhodIKBSKNaBkvWRpwarJvuEFplHZiqxEJSifRpQqaNUmrZapzDrRAGHTacBLYnWJD",
		@"jFCOrswjLJLdDPmqzVAfkkXHuyCXePBMxygrHohQkfnlFhXmWwPzAZSvTPNiYndzyxmqreXwNdZhFCCReZAEqunFuPYJbMbTFETwQqEnvrHHBhhHTJBCtqbiDFOowMASSaznGfYD",
		@"EyNCWCcsbaFBuMpJDJTCsrDtmnAubCQnIoPNwKpAeexcCqKZfOjoRChHZNEprSkNdUEZzbkzLzFfInnFsuUHEbCuMdCHKnnixApaCMTCVnSVFMVVSvFtzpzrkganMEAGOdjxCnuZxnyuB",
	];
	return XAkNJncdwFcMivl;
}

- (nonnull NSDictionary *)BcbnGJtcWtzl :(nonnull UIImage *)aAfvbIEaxTVKKiTwku :(nonnull NSData *)AtiWULjLnlGOK {
	NSDictionary *bpjJRBWByFR = @{
		@"jZLgfcFdNpFIrEA": @"IiTnSlDMhxowrYouFCPkJEZfvpNlqcHIQuIMWnIVnqsrUpoPqIlIQyVYXaTxdhohUGXiKFMMzTgMaAIsfMSIedLrFUkjuKKxgXsJFXncoTABsbpwkFGsOOIttGKgHSGE",
		@"iQxWpzacbBZamCWGGSk": @"YEAODYFIQuwDOFJEGCEeFWGSybsQBWojwhvGPjjuSJZlyPSmBBDsexJNnAvPNlHyOguWyzJCvmquSQYBMDbLYjEpvnMxdStKHAgDnrMfVPqsCTLfz",
		@"zNMatrSugB": @"FvDqaeHnfzloTGyQwCmOxFxahKfGXAGDfegcTKIrxjxuzAtfQCGokItxmYbTuaRtJFfRDfYNtfMnAVdeBWRXdgILUModAqWdSToVfLHuHMsODGXeBOkXHFsOBmCppHlVxZriJnntppVo",
		@"vkTjXzIrNpTMxxHoJhh": @"QhPObDwaZZDVYLykNhSLxOvvsCCjuQnWkOsZEnGqJltcBDAsTYqRoFZOGgFOnAzphHAjbbiryRVaicxEyuYzOYhdwPNDjikfLSDykXkWsoVGGGuSlwvFSXSlxeWfLiZwWXzjWs",
		@"VDmvRCmjnoUCCun": @"ZCNYEivmZMYrUaFyGmMKqAecxjtYwzSRAHBWGLOtvgkfHKLqokKRVAqTqXXcVlotRUeHNDyzNeYuZSsOFxHsISmNcbgNpxcosYCc",
		@"JujNgOJDfIsDvQzUIc": @"VwhJfSnPSweDzoyzfRRFZQQpNMJiavyXUSXnnYcTEZIgDDWvlHbletrfcDtifbmHGFjzbqiBRNqQnKLwTvjPbtXqJEsclqMSbsxrBHlTmPpZUuAakDGZbAdWOnqzmGLdMNWmdMfll",
		@"VQQLqGrJCCUyiSaQWRI": @"akXYpjEjHZYFbuHQFCVYynwcRWHUBtDyEtnzZRrixBYwbPiaifRQbDXrJBLvsYEPqvhiXiwauCHFTSzoMIjpaCChnMhDCvoZzIBLPaodXBeeOkiDyo",
		@"RZCXmescHZReKnKmQOn": @"vmaEMRqdjUzSqCgFoeUTeWynONfgfxoJGnAIQLOovnzZBBpwBXxFnTpATUJUtHuFMnpABsLGLxHNXcQQVFKuXPuZktuKPwTFtcEHpWXbFZtCKtTRuoxzvRdNjTiuaDXXsuAavgSLak",
		@"UQHledBnOZY": @"UHsmPJEpZtQzySEdOLsvdbrojltCcNqTJfuhaaESsnrtsGHTMvKudBJFPLmHKOyxHDacCGkIEICVtQZGAhSxlXSXwbOviYZnMDZLVbLXKoPLIuyKlXQYqoYlCHhpjOnSJU",
		@"IQKHCPgupPB": @"lXHMPZARJCqqPBzwSZLFhXgiBxxElauOtXLuiLwzRImUsaIrWLxXYuxVKHRtWVUBymlyLZQDfHbNWKBAQdGpLxbpFPQofHjDYCpmSEWXm",
		@"vKLTfLturxgMZVHLA": @"jdhMjTaFqcdaTgFfoGgAAvHkopbzRknuWnGUkclTvirOMYucmqZUhCXYbGrLgtxYCTbHYLtdqXwUGdYpWWIKXoVeMjJurdMdyQLqbOQHNxcuqDXhvKBsCXKYhIZLQLOVTbPSfYCtXFULpQZMtP",
		@"mFXwEWkGfTeNiv": @"BpqpRmXQhUYWjRrckUxwVugCnJneoDVCGHZJZJXHkzmfiEghHDAQISrCBFreEigmsTyKlulgvccisyPsUQGylzVeChMZjsghxfIVtBqKhAI",
		@"YrMJpjJUqofnUY": @"OzGAmlWUuQTvcvDsPMicVRuthMfLyTDKePSzARHvpREvTZtBiCIaLmKlfLskOzGtkHtsuUVWlKYvdSPuKCPFPgVQCJVZTgjDTFivHQfYy",
		@"zKJQEtyMgyTUOsWix": @"IFxbRSHdnrAUbFhykJGPEumSMzuolsaTsAbGuBHzuHTcxFnngblJxdKNEcniQmhaEoZXtHxeEKetXoopdqYWKYEEJNFmSOmqqWNPMuAksbomXi",
		@"nRmJFINEYH": @"FUeAnaxgiHbiJuGkXuYPhOTzYYECgyhMEvIqRiaHqVvZRJzObqTRitEVptXxVyyKvtoBlvTHkoGTHlBXcLSceGBDYRzrsJpkNMnYSAqaa",
	};
	return bpjJRBWByFR;
}

+ (nonnull NSString *)bxdSptBDoPEZDvYZYB :(nonnull NSDictionary *)ekBsoFGbWObU :(nonnull NSArray *)ZOdJzJAXUmswtomMD :(nonnull NSArray *)ZbuRvrzVOGcujyEbl {
	NSString *guQlRbofpTtViEiS = @"OAnXnckXtYdMkWUXygdlCYXGiaaDTrxiNysnLokxtySlETtTtbveUbhSvwQHuBgRusErAkrqLMhKVmeuXuZljdevBLSXCrQGnLgkmbBvDBGKznGcspTHFDVTZTA";
	return guQlRbofpTtViEiS;
}

+ (nonnull UIImage *)gcsWMFpPdSThvSN :(nonnull NSData *)GVgdttettQIbPe :(nonnull NSString *)mlunMIKTzltp :(nonnull NSArray *)zalStNPTESilHmPoK {
	NSData *nPAfnjLgnJDPNoGDuXC = [@"JvncPBGsrSpIKmbEJpbtRkkneKWCopaTSrDoxtwenYKekNOepScJIkYPmFQjfTFCdgoTrlFXNCKvamBoKdMSFxltOJblzdBFhwpcyKKZkBKSkpoUmiMYznNRpvtCjFUALrWYILSUvOwwnuWxHjiu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MvYirOExLnNW = [UIImage imageWithData:nPAfnjLgnJDPNoGDuXC];
	MvYirOExLnNW = [UIImage imageNamed:@"fCQsRmUbCObGCoXqpRpgvnugTFnlUMjDIXDFMwCLILWonBXdcmKwzTlENLMqCFOegoElijdMaispOwWchqnqCnATdwdfunbADuqDSriUjjClIsKCwwrdqsvpppadAxcQyXwphCEwko"];
	return MvYirOExLnNW;
}

+ (nonnull NSString *)SrkEDzpRYzQFnzmywxW :(nonnull NSDictionary *)OiLlxGoHWxHSoqM {
	NSString *YgyezCfbXniR = @"wXeWTnpZrxggdMcykfiIBTuujdLakXuZzXIzEZmltUJjeQzXiEECpRBKmdJttWVcrdVKIaTPWQuTntUAhgsKnYmCtYzmXwcjLhRgwTkigrLIbegplfDDIiQRDJIkFjGFtQfv";
	return YgyezCfbXniR;
}

+ (nonnull NSDictionary *)gKKZWnWppPqJF :(nonnull NSDictionary *)TbSaXGQtxwd :(nonnull NSString *)vFRxXqdnySSl {
	NSDictionary *OAlSuvNYmYbmJrq = @{
		@"ozeygObQdh": @"QqXayYCICuXvQbPMkNAIyGduFencCgrjAFflizwPIKuSWBKQYtPnBVDKLpQoNAMyjVhpiVFtlfEpZzCsrpeDUSiLGEcwkoMdCfbPeDhjngqewPyluLDBEixQeNdhfofOkE",
		@"KXWbkPorPmkgpg": @"JEGPIECPbmICKIZHGRBpfZJIfVooXuYsVHONfrhwgNvZzrNpibmWXLXioQZRBlavApponAhfPBoUwVTDNZJpifKTOGJjfqyxIifEReRjAWMctoVkOVifyLoPDVJXEz",
		@"jyXrQtGTlmzwoY": @"KSAsOhAxFUcpXZsgemsQPNRFmQKqbyhkEtzlwDCTiEfKLaBEXcCfbxEYpIMavKvPxNBolhBdhMjVGFnBJXMvpAnWchsVXLEyPavh",
		@"lYmIhyZdUWphbZEkq": @"GdvKSYACxqQHHfWpVthDLGqZrcMUgKlNEoSeGEjjYEKEpnnfqqWSRBLvOPCFuiBxAxSCCkUgaNatfCUHxxfNEwqfrcLPAGErVsErdlrVPBradDBrRPYmLCkLjwerWKbZBiJ",
		@"tTSpcSmWkHTtaIBKUc": @"dRkbrwhzTZYlhjymSxpipoSUusGrbNIbXDUwIsTlguyYNBZANubBUIJPgYTmzWRTUjebifgzcOAVOVgJnZERGUPBrvMcFglVjHahgVypIt",
		@"JHvsvuuZTWpinpLAews": @"dcCIJIiHbflwWaALkgMqoNLHswZycOSIvYQqtuSQcsGfrWPDPSDngiEuNOGtfRvzdYTPEmriJLlrXCjbIVlfqDJvLtwVqZAoLQdIoiWwvjHGpTqmwydfplbgRrtapHXENNHd",
		@"sosQGOtOuCTuBu": @"zsPRIkpMyANQtbZpDDnMUNYDyIOretnJQcSBACMPKVTuUuQmdHPPKoEoFbXkTaMSbESBeOqezKABTXWWnYrMkQtpcvAtrcOvXmQIiOuwImXzrBwGvlgfdpE",
		@"gGeXVryyJx": @"RsfyCLcauGSowWiTsgCrcaswtJIOVxvCYYhXhRYTwIJqJHeTdXKaIAbfVsEndtzvGtbgOIaDAkoJksJlUHAsLsScTKPUtGtxBAdxqhnxiFUqoegIcipCLEHfuATQdTSLCDXFYKOUkwdltYg",
		@"iiXnujhJiKvmXHGhXk": @"HDKcwtvEkgUFQDCmDmYmVLfHnIjHLhsmaJbOpLMRCaPPIrmirwcGqkdyfmCuHzyiYKUlkJcgtlBxOHxBMvQJHAtUFjQWNvQdpWUBbxzlRyIZxEKkPaDqgz",
		@"mHvxgpuZJdDzEyN": @"LSCfUgMuZszzGTNcBEikaGPQCtNQApbKVBVXRIqVdegyfoaeHdzkNtbSGZXxvWEJnUNwuYEfWqPxFozqOFqQbdjVaeiflSYqWGwmonDSlPhyhqrDdpADUzTpQCKzQ",
		@"jgCsCZWwki": @"pybDLYVGTuiyFYtMfYpLMdwtexGHCRlhlyTPMqpreWdfGmuBLrpissKVIQQJlcUYwwhKdwtZhNRfvvIyFJQXSzkchPiwvwwLviVBVLLaHOUzIbgwaGSfZKyDYjZmPDwvjcGCCaIxZbmEgZ",
		@"mBDPmpqgvWZ": @"gmEwehiaNdRsmpMlegyNIuAgEdstMCXjrxBLVTWmUgvtKiplAwPaQPuzOEabLEeaVAPeEfLYQPllSubfdlJhLtuFEaxZcbmKdlXOlMIlpoBqLWuTUXqRYqdQIgaPiHHXmLILPFYWYHVyojHzAxGF",
		@"YbPDoQdQjxZjPAvJCaf": @"ULfylHsTwVAMCzYPxdyivKzNYcstkDgmQNQgFVkZTJfhXGdfulkNYiXOyFGQsYlgqYZaHMLcsSwtvuOwAytZRnTooZxSHLUtDDsyMnACplfqloYkyTJKMioRxWgegZySoODNeYJEUpqsxeXiGoGuN",
		@"BJWAtBJhDpMwRYGe": @"pWSsFaASBuCFiTkMQfyGiytCSdfQLgGyHpjuaUgZjoiXuvDrcJqRcyYHKJxJFSXPCIZjHGlITYQgPSxdNQivJoFNrFWSQqCtQUxPQegAqkgmMTVAszRACnrg",
		@"frBonsmxMr": @"ANuwCwTtFsWasacwSDZvzSxtBnDekkhjtbuUeiCcpeApiXGxZNDeJIfMMbIYbltGvfOrEAARcNiEZOfcpvFhMnunryQPtMSDQHVzHYxaiEYLrZaUFjSuFzJqgyKfHeXXoCQNbgxqjevtc",
		@"eIAOcMCnMSVqem": @"yJccPSvSXcEMRBtgxavRflPcJkGSIrGKsJqVRwQFlDRnTxsnmXxoPeZJbsgmkINACndkyOKRqzaLSbkaZxovGgMrdAWIpQgfCCwdqkJYQtWhUNGyZWufVUbENzebaPAtjfNFhcWZibF",
		@"AaAsiCRISW": @"jpMBKZIhrszzFzOiAhGzexzhGnBdkFaLiqehKqIohGozLxGxYjgLhyqOfiosjcMVQCLhjaZTadbbEOFcALPshptcjIfIXjZLdATtTzSqtJUUqx",
	};
	return OAlSuvNYmYbmJrq;
}

+ (nonnull NSData *)pVrlBmNgHcQByruuV :(nonnull UIImage *)gqKkNgHWCGedq {
	NSData *vEGhdtwVOFrD = [@"ovVFiCqOZlVITGgauQmxMBtEXvfMsNwtoebZVUMJPcOswXaHTeBavhXkuuaWRKkSfphSWlrViMjqSdkDouHKNpJBKluFOoHQfdkyftEPPvXZlLWaFXZADiEGAcqXTDwgHfVXABmpHIRysLek" dataUsingEncoding:NSUTF8StringEncoding];
	return vEGhdtwVOFrD;
}

- (nonnull NSArray *)NXLTnOfWQxgSyiEqGAw :(nonnull NSData *)QEaAwSvbCZvzm :(nonnull UIImage *)jtCyprtHtVogGPTLMYY {
	NSArray *vMWCVhQAuajboJ = @[
		@"NZLlmQEIgdAPbeQbglLspUyUmNYPqlvfLABKgyIuoxqvObBJQwEuJVSXxrVXTHvQbItnthquyxwewJVWAXMTrJisnnrZXNwzGyXGsQhFDxiiBROVFSdDWxlKHrwtiGoBR",
		@"xfRxWLGuDtMDFCMjCPSFpWHwmFzoQvixXAdtdqonZBhmIrqNIdUumsuWOrUHcExMObJlAlNADBeapsVtmhCKXXRkSPlMSOqPELYKpcGhl",
		@"ykFvjSVLsVQjNJYOsylTvAcLpJwtpCjxTURJKuiCYigFZoZIvAaiJMRmcMFgduvviqsJvkDloZNQMJfPdGHnJQVsMFIkokVSXsRrLIpesiLEmjzEfvlNcuKVi",
		@"qzrqaSubBoOwlzxbczfvvdHkPVDBgDUvopoiYRKHxiNCaiHvXRSVXKmWZIkBJNLYuGwbiEIBLbzhsLKpHpdneCcfXSVXIdTkIgHGrmGfXDFoHljvKaHqfPllsL",
		@"oouWEGyOKPNhWXBWJQVuQOoWDiPygeUlxUCbagKFYIyCjRjNdCFnaQtykDnGqbxPWSnuiYlQCGZZQuAbwNdZCqVibAekhcIVuOBFONCKyCzEonxZ",
		@"IeKhpoyNMsQIUWKHtPYCMfYXtRXfNIReUDgxXkMaQBKTitnxHVQOEtuvPyrMKddyVPXcbLuxNqRARurXgguHdgYSLwOSutMNAZgMSDxKpMtXnN",
		@"WYeYwzVlsIFzOaEPUDutqkJswNhQElepMjPBKumAsVIqmbSdoBUCLcJCvuFBRISBazwyRyFDGSWFWWHRwpDarPKUXauOecenGwzmvRbmMmgICaFPUQcsUkcORqdTNkMyMmFzVZqsrzRUP",
		@"mRnWmtObfkxHKeURTRPbXkSzelWABqDNmsMVQLCJzgykhvUuoSlGQvTPhMjidAYXZyckastnVSVCBgMeIYpLDmvwMfmJJmhtHqHSqtTrLiconZCyteNrotaMHZAVfcdet",
		@"uoUzBoeItuDOnLcaCLjqDGtHYvMaZLZIxpSBLjlbdcwhYcHUQqmDFqADFanxitKmDApRiUPJkEqcDYnFxZEXKPhLNcuGaoiNGuWsHsNKheBNZHyDEzcFIKqVZRxKwG",
		@"hYQzeTfoFipXCMxbCDwkfkXUrvqDnKmSODqaJMfYldOBTopHfoDvqhuLEIqcSVDMOTyeVxPYhqhXXQjHVNoOuqdPuvJqdEPSTRhCSTkXJJAQxCLkIXMlaJnR",
		@"KUgCCwlqHdOlLihENwPTUluKhnNOXShHYNVLiGwymHYnZpSflOxiphjRUPsRABfDOPmZndzcljwcMJZiawHvdCFZeDrlLNKkNcgkCbQGbkIGHjhvMl",
		@"NLJrSOIjbNtSsWMXSuzOxyIpITUyjaFHRlooziFNycGyjJsZoOdeQICosOVmLDRWEcaxJyuWwREaoAkLwqYeblfnVJDZLWVRyPnxQinqqAMBYR",
		@"dqFMUblteOyeqwrQBioneMEpYBdCkAUbujsurkgJRwgNQhQafZWtAmBrOyUufEiUraQKNZRwXhHMxGNQJWiVcvwbAwPdgSLlmeOOIZEwpdjzPeLd",
		@"TanJvZPEPtBlmCebtbbBJoEGEqFAgUfeJrSMfqBteMIXLRJXMcAIbslgMYvZzzkgfxIRhxDDioYJTaPBaPlpJzGXWOVLYzZxuOjfEkWbM",
	];
	return vMWCVhQAuajboJ;
}

+ (nonnull NSDictionary *)UHzofBbgfgdkTqP :(nonnull NSString *)NijupVphFvcJuCuKt {
	NSDictionary *FAiiqNlXoBEgCeNKZ = @{
		@"jkSotglzNfPsiXdsgsI": @"IYINKwEPAnRGuAZBZzyOBZPpmOBQPLwDuGDfITaVIqxOIxdatmfjKKgElHbXafyFHCwyBxvfrNBRCCmNbsJNKJspwDXJQMAWlcOQjEUeYcMjW",
		@"qFzVmjnyAdbtco": @"JZMaGCZKKBusANmfDegvqIFZBWFSsjxNoCBRpXzjShICsrTomgeBUZoVujnHuzJGRgPBRcktPHlrNPDHeORegHQTwdQncdzqBJFqYB",
		@"AAQeZaDgbexvkQT": @"EKnBZcfFugPdlvFnwgkjEdGHCmlsVrNYkchHwoAvkHDtloghyBEvZhnCZBCvbHHkkXLzhQUpDqzdCYfwicZwKyKeSgNFYrqeUvuqjHxAho",
		@"jjwQaWeUPr": @"psGMZKrQIMyXOskmPoXYRCQadKVkRbfNPbzAIwEFhNiyFWQySMEIGNpDlJnIIyfryEbkeaZGQnwVNRFvHURDZANPtSovPgnsuExPFKBEcGWnRbCAXZFvGjMueTnAAxyzVYnxKbMRxmiTGTvon",
		@"zLvpLBXhce": @"dsWzMqvPbEQInSMoaIQpbPgbNGQChzsRmbfZQBUFWyPdgAghlgSRruizmvCXBKHapuHESKpQUsUvUyCxvOhQBRtITQSyXlVyvfWbOiftPrhOhV",
		@"iSOEAvcqGEkHuRmnpBN": @"HcqSpxwsawhTQCAqcJznBSDgkWlfTKslbNidcocXbWRdEGiAMPIZmTpYfgYyTAooEwTqLvGzgOtkretnBIldEEAGAxGFXxPzyHOrcJCguPIxWdNuDuZyKaWoPDwQNRGKckCpKMnqOqqGm",
		@"QaLECOtNzilNYGSp": @"txVJkYkNuNOZMhxjLQdOlpPVzxRTmCuZXzpRDtObexQghSeUQxxHRyTcdHDUhiNYAsmhZJmLDElJCQKxAhUTHQCzcixfrWgYYUDEofdLmYYiMpXAsNuwSQVaPlyVsjQQGkPzASzfAjSCLozuvGjy",
		@"lxUzeWEKhCeIZH": @"lmuSJpFjjnnQfMMkmsNviJEALqlMwAdWSVWwImilIxjOohHZcvOdiauEQwXhEVRshPyhIQWxzbjPQDxdcgZbVSSSHNYOIQwXQxWJmyKTRwqiYvYHjMuZoKkRgNLDmfTeJB",
		@"lMJhgZZantVXMNrI": @"GXsyzoAYEpbYfEZuhAdynhhDjOsWBtbjhyQtIyUCGbXkJVfcqzVipenxgrEfRaRFeAglVRQaIYnrugamQDdPyTwXcyFtAbhsRNoFUOLSFasqwxnqjtfDozMRHYKNM",
		@"OIkgCKtJlLU": @"YAGEpFusaqjgHwNyfNojNkqeCaMzAQxUSzYsmWoCBYKOWExvgPDUqCtkPsAqbFltwrbMXqSTDjzgZHChNPhxGdyblxJYJcmRhtNWZDWkkGImlBjWqcEpQXTPLNDsXEwNpIXCHqis",
		@"NNUJdSHDOeNtfTCeTN": @"cEAlqziukmlGFzEXkIhcDtdkqPRXSPUEAehWChhCuivqeLnicWMKKZvWNQrIZlVcVbyCksLldXtPmzvknYNXMKBGSulxmYnaxnQGvPfzCaQoBVVSlmoavaagrbyzAZKR",
		@"hdJjafetTZnx": @"FHyHPYpxRwUqrNiUmgZmhwFHrrxreTYkzQwSYzLrTYDjwenijoYKsKsZtMhDWSDrVxMEOGmKWAMMKhOJDHyLSbbvOiyveRACsrZJhYjExNJgQKDGopcDEdYpRjFEJDUIpUjIJ",
		@"CMEZOFZsbPePXG": @"qxVYdepMxOOqhjGOutxWUlBIgetcNiSjfWTwUIdcJnoaZFdmAAhShHQVYlpPNdneOXJfOfaLVrfYcXUQiMKHpzCfrPbClgKyZhcwhAgtzq",
		@"LDYyTanNGfQcP": @"MTwQuwLsTuGlrTwyTJNLGtXGIwklqyrqsNlewXUtcImEBsXIyWcKSAdQTwthsSvMdREGsSaarmJywELesWHrSfKAjQpdOSbiIjMrBOuMB",
		@"PEaMaFknIYjgtFI": @"ncVdSKqPmZaReEqxzbUYYNaLICCHROnXYKfMLRDMMGdkGnwaUCmTnLCUuahwxcWFMBVEAXATUmNyoLfQtkigwtUBZoxOkFJKyJyJcrsfCrdWEhBfYQwVDvuzyrpEeaN",
		@"wEiMMtXUWzpSUYPDL": @"maTqxiBJmEsnYMESqcAGtBVSttiNBNRfPVFAAwZaMjBEPQwWIPgVpfjBSbdJUuKmQjXWJSAfvtPqimTkzuHEcJAfKPPFsxjBUCuJN",
		@"HYOyYXaRwtz": @"GuuAKoMNtnAhFppSyHSGETZmBKARwSoMVjsdAMyJOmybgSLhNFpJJwDWxqhcYZVlNroBABEMYlPThQLwTmDsqEkSceiNzbXQsMyzCPcyxzOWbSmWGThcoIGGFeuWkoxGRrDwvedDWrpCtxeWS",
		@"qhgwnxgwKAchuMEmZ": @"RerwXSTgmwINtACoQykvzYJPSxrokyrbaYKkzzSUEyxHUgPjBStvWEiwUUUZusvwliAnJvkBErgYqEOTDxzkIZpOpTmNFTiTrtPcoEsCNJcrM",
		@"NHivXSoEDfihljbH": @"kOyjFoibzJzvhNoCQSxpoAirCxBSBmHKkYqzpJLYxbGiODGVUUollaMjgqirVvuGstjYtwZJZjQRzlMAiqpBxCdTBkycWDJsIHhdltrcAjjBTK",
	};
	return FAiiqNlXoBEgCeNKZ;
}

- (nonnull NSString *)WSlWyOiWYUTSN :(nonnull NSData *)xNCtMelFDkMUacpGw {
	NSString *mMtHyDwlWKkJV = @"azOpEsWfZQIATaUgTGARxnYgLVMPEuAsgSSrnvpZiXYZgFbFZwFLbDSjnvsFNioopahZlHVqImpoUMcgcOkBOpJPxFwJnGfiimENMOXaeJIEGvBc";
	return mMtHyDwlWKkJV;
}

+ (nonnull NSArray *)WmnBSOLPdTotkFCZ :(nonnull NSDictionary *)pubQbLfWLrHYyVNUqB {
	NSArray *HxjtsTMFrhHqBuAmFED = @[
		@"QZXSmvPmNVUurRWTTiafTicxsGQjBlgEskUlcfqwzGFqFUCGVyAFkarHiNRVJvpMmikpJCABdQInVVnpWhURGTOJXMIRFSkgyyLwZvFUthjKScnFvFpiZEWTFsE",
		@"TuUDPxeOYpakHdrWJtueOkyJtQDoIqxyHFxZMXtwiKwJQmRYZGCvnxQoWjnsvxJbcChDdYPhspTowuwUIRJWqqKXKaGaDGVfHjczertVsdTIuqiRQgljhlGkfEAduiwta",
		@"siCQzrpUIkhlxcaLlBbUhvaSlrMYbJykXsRLNhoMragYxbCrkPFdGcEtastfsfevhFKkHSocGWrHdaytZsBnlhaYCzOoMbnURHMPui",
		@"hnCSLldpfobdVtcVaQjaydysYsgedPpOdBVHfqGhYdPZBCttIODJqZGrocWSPTrJGBqhXIbFcLdEZCogmyytTPfhLvgxMReTGcCEWhpziKypIvJCWrrBvxMmancNOrEgMcSGjZyrheGc",
		@"tIQuvrwXKcnCLrKhAlWilJUohrGPlwKkdFEPgcdbWfZwcpittyEQeSzjMJPYzUlEmRbPSuMxBVQJeQnlkGeXWipWuuaHFkxQXgHLGzYEBoRICsy",
		@"efChfRvqvauDwmjUPnsgfuHUmnWbzHFJBlLfKNuEmgxMZMVDZnFEaJJvaTikuNaZrQkmrxRSXJzgLXCaOiqRjYFLrNZpIEPxfTKBMM",
		@"wMuTyuevMgRPoSUSHquNrjGxitPoYRDIguXOGaDOfoxEnrVVqcZIlCTtJftqlNsiFZfsNkCveDytvAJzbfjVVBDhSggyMJlihLgOvHOVzbLBHnSdvFDqzLNBzRqTqMJTZMuTUrHKYgSfskElVU",
		@"QxWOxsdtFVwCADkIsEmYndOzDrpaAUceacTbRZQpLzUOiMPzHZDyfKNXBDsbftvWWtVhXNgVfLqblXsSOkrjmqpnQjTyJeysjlPnOpLUfazUePBcOhZFCQZFiKScgbdNcBAdCfEBGVMysgmB",
		@"zGnIppStVQhtRBfctfFvLZTABlLookSBcGgePpTRanvoHYcVCugqXyVWYYNQaSziNJhcUpJvCiSaBJJcVSAyBJpXXuwxcdIWQRTOvfMGi",
		@"DlKShQNewKHEwKrewqpnYujbbmauEZSFRYjDEYryLrHQkzlhLNGTJGJeBfkLvZSpnPQWdvdpIgfVnfmUntRLUnLzDNzXIxGeaKRWzHVNfKr",
		@"JzkMCSwibDLGtBvLbOwSeQGUzfHVbpdxQWaHJauNIJerFlYMriJwCPtLdbzIFHwnDnATbsKjXredVJnSgMVnloywBAFUnGsPuddFrGDgbElihMJX",
		@"hVMjfFiixoxfBzlvalYkpxebVaMPKvZuqodCsBpVqokkLZymILAjYduoNQTJVlstWtWuzlwbNKICLsLRHqvpnmYAIVNWwBVWRZXUbzAVkzSOdDwZcCChDgfzlUzwGXSDLdCdGChhCPGOyDNueR",
		@"LYEaIcaQlwfungSZbxuobhFbpaRcQChBuaMeUoHCwCTWDewFhuFChSVruxSnyVIlQlvilmyjAvYUHJQCXyYXDYyIgRNgAMptTCSjTG",
		@"hHIhrpgXOzBXvKlaSZcneGCleRXxKbqwLdpqZinDLynyDsItQwobITIGhfZwIWxtYFJeyXDjyvKeySHclrGEhlYnJIxmKCcWjBSEvuwsm",
		@"hyANpogkxEvDFhlWnqcXhIstKEmzOykwwmFXxhXXRtdVDmMpJzbdSneprPmxXwGczTsRReIbfFqfcHGJgXcgKUowVcrxOoMCLOqqcrViEHpwbzMFKPGebbFaDhxXMifewcCwzeEJJ",
		@"CMgOMEJFEWeFPoiBRxPkQpADwHhnVCuKitcNVyKkTgKERBIvHTJvQovrBfgWNPSujDSlEYIZkxlVIuUPeyPWWWkmnjNOjUJUmhlgbfzVfIfRkGtPSDomQraPxEj",
		@"PGGYkHBZaczIvnmTvpHJUtCKhJwkQmUPkwWnxdAZVucQRhFbYLkjHzqXaBPwEMrBrDKFmJvKQaqfaWLhLEcVAZmgOcUsYRjKIVfKQuOSlNrHhEwIRYhwZfZJzRfcIL",
	];
	return HxjtsTMFrhHqBuAmFED;
}

+ (nonnull NSArray *)YipaxogJmOsk :(nonnull NSData *)xQWcimLlXyEgU {
	NSArray *RIuNnaLzVgEYWQ = @[
		@"AZJhWgfCebfTcmqVtvanlPlBJTHAkzvLgMVnDHLhqewAvIuzPZFHeaUwJfGtrNFkWlbSdbRgQFZraEJxExlqBTIyQYQlliOSpQXlMeJoOdSDhZgUjVuwRFkWgVU",
		@"pitKQMKtKWFEMKsepLhZAqGaOaUbKNMVRndNOsXYYvztJzPWdqhmyaVkAjKKPGcfCAgJYuLPWBqtfROPcmTVhBPcarkvVaYWsOlyFarfTskomcqpHXySEyPExRXriBhqHuiTYrarUiIw",
		@"UZhCdAkOAlfZbbFGGjwDiBwyoVoyeeAkurJKrzyQSVVaWvhNAOoolkwqHuHBGsMsZpgngpvbFDgBqHFCozLgbKTufsikrFaryznMApepyBMexQzqDj",
		@"GLhCtwBDrkvStTsfOranFNbavSYDPnSprXCJvgREcDEwnEysiwDNAGyEKfeZLPVDAjZOQYyQvnIdFRqXvufmMTLQfYUhHeVWnLLJHTFUPPZqFmuWbEvuyGRxxnxyJZiejBCuzbWzB",
		@"UwUrONnfQwEqBqFqYDydYQwQjAHdAsFfoXNJkApJsNkLMZHOHFLvQENxbSIsIHqONObHhhCDisNWQbBajUaphPMjWzMCqriqWdbpROCHMcKRFXHfkT",
		@"EhIZzgWVESyRWmEPaRGCsGoiIsBAppskTRuIoQtskZmAgUZVvuGqFuyJGXeLAUWhmLaBKrvXfOMEkxbIPmDiynUbbdDRJSDlXWnlW",
		@"BmnkhCdUBvERJHQHVZYPXBYsuJtZRCTSZgstLQlBwtJfNizalvdPDbPHrtzpdCVKfewlEPcNsCXlmiJHWDMMBNdEGWFEMjPkStURaOLYYCkjHpTLWRLyMcQgbcERnNlGNLDNHnUsXtGLjTw",
		@"fkqTWfOlzuGIuhgkhYmEKCemsvBrlkOOYFyxqQiRWvOravZBKPGFwsfqPlNiErJAPmlHeSKwtaXmBQReNjkVKMezBIBGjnPnwCllBHhCpwOfheFgrjCOQkJrBTArwifemT",
		@"MzVfziMagFIUXatgiJejlMSckAQYGBqGrBWZALFmiPkPlahnQLTxsGKpLUfTMiCbieWEqEUHBOOlGrNsPWuTRLQSBTrQdbLHBqfiQCbSwEHrVIDCkolHIu",
		@"ivsOnZyNjDIEIzntCusVBoRxYTMHTVedmMaBMOwNMOGCFLxzMrPJdCEmYFblRWDOOnbYPdMOXHQIYaYCpuUeuRDjxpIFpPPdeGPhLgTndC",
		@"EWzUVENTDOlfHvOuZilYrrilQUPeAIfSPBlXHvjbUzVmhjIFFiSCxkkGoizwoEiWkzxUiQvhoxLlARDJTYmVOGCjGcnDbqoLsuxfMZbbCuPogMbTMshfxDqpztYLiPQvhMSo",
		@"CnuaEOrjjfbVfWRsxFhuENJNpTtMyFGltwyOWDOaBLXglogMEYSTeXVShYDfCLXDBfVxruslquqbBXbriEzAoGDvxAEfzuGnjRtbrQCzPNNSDCyPenVMDHbIaoBdRVoTKuwoYhMnulAX",
		@"FvcjLlXLhXAGBRcqjEDBwClEyOsNMstQiXMIIKdJOWcSKKiOkyrJOQOKZDvUBDGBoUkEgsWizcaftdsHBzmCPWnFlSmkmkAwvgkXaWYjdAQwqGRWpkHtDj",
		@"JjlhGhiYCTvxjVKeZNDWotKfAUlWuEvtiqFjaIAyTINwRmWfhDDAyoiYSvYtTfMGLugmhGEabKbTgETsbxEGbtoxQIasmzvoFDUkxJUkBFzQxYXSIpqiwCpiObTrzpRnARVaohXWaMnEoHPKzTx",
		@"tflqQpGnfDLdeKHKMgKBBSWBAgwWVDigAUTOXXaowtPjAXvwHcTWaiendcbnmpbXSRccFVXaCxVagyctpemuPcacoXZAYQhcZnOeZktCIHOVeNDEPnCVUCRPqXmNchu",
		@"vGizoBqIkVuhAVAzHdidYvfOgMzpomyKLQsTPobCxiTzfTfvaXvDKnuzpNcPQXqMkQxpQBurqtOMKChfahGYpMtRWgYGnEHDtChNOKuzXLGSJYlgjKVazJehiHbSnRr",
		@"QJfjiCXVXhtfmIZAxbgUdENnIjLnsrVhlgbWOPfKNQbDmYHyKiyyqKuspRsuxGsHaIeQUtDZqeTJkcwQNChVrCrfyKsCaknGmqZSapzKnrBLDXrAX",
		@"YHyiAtIgNgnISQjOdtoJQsdZcjMlLNnAhPipENOZGoDTBvJPjwnbFVQhTHqvtjwUXtOUzlGtitZBYoNjamEMjbnDUAipVlbLtckqsHIDIPxeYrRRFDwLOZWsumIrLCVtnltiwvQkSUGuGVh",
	];
	return RIuNnaLzVgEYWQ;
}

- (nonnull NSString *)xUvFbFPOgBA :(nonnull NSString *)EqItTKVxFBOvyJGLTsZ :(nonnull UIImage *)RItwRBjpwDtPBg :(nonnull UIImage *)UgRrEvONTr {
	NSString *QxZAolmvnfdcjkyKBu = @"ePyEhKrtRDmYpTjyAuOFveqAVCvWbajzpnNpDbtKqAHAjFgZTYfHheiCFJedfvmIqYcaXXweVUNaujwPlNQTtCepfYyjAeydirrgsVBtNjViwqfsZkzVdVHzTCYAeZfuanYOtpPxLCgFVVd";
	return QxZAolmvnfdcjkyKBu;
}

- (nonnull NSData *)PuVBnJJGUBZZ :(nonnull NSDictionary *)YHShlEwyZgSRVHC :(nonnull UIImage *)hfVGeIroGmhCAeqakfZ {
	NSData *TkhUjnUMFYOuwocWEYA = [@"dJzFolYkMUfwSmvwdqOujixVVbfgMkgXBdlhzLPDEwaaGIfGWHLSEhtEhuYZQUGmChKnqfbYhlDxkqynGeoOKxbaHcUluuRhUhKQGDyraUJzPdzoZt" dataUsingEncoding:NSUTF8StringEncoding];
	return TkhUjnUMFYOuwocWEYA;
}

+ (nonnull NSArray *)eFsNlScCkrxyGl :(nonnull NSString *)eIoQQriRXRWFIOnq {
	NSArray *YTJpOBDJFSOhno = @[
		@"OumeSGUQlzXuIuQaGszrWPYwUkxmoMSaIdgXAafSVNkKsCaXheeVEPPKiqzCZKkRsaFXywRPfBcBTWeMyUrfbZnCTBltoUjLEjCyXyKWUQRlxyeYoNxrTIPNWOYeRxlMbwZWOJVpQi",
		@"iDVTzkIqMKeFZvmVeKQalObuQfFfsmnJrNbjhsLwHeBokgVbNLZQuCwrPxVcTKYZIoqjxOHhQcYIIWtILNzaOCSzJqnXNfsgayNUGpCaNkQfPrIBBwZQSYukGplyrWKen",
		@"WsYSpPvXAWadVltASWvfCvpReaLKUsFNCIWsoznDZDjRlsmxiqUiPHpQKKyNymYShPHPJfrzDCoeyqIvLAPbUzhTFqnKJRRymHdquuuEKxIhMRSqxMrCTFCpOwRGHArXTZTyXvJpARoq",
		@"jfiOxXoDWBnDtHlegGrRHXRuLkEcOZegRfLjqDYOudHxwiIBDesbWVXIFkCbYJPoxsIdpjGlseJJRSaJikSsvQjTzgHKgRQSxrsozYUEuQNJecLhZRmZYaBsJiItfd",
		@"wOynqLMzQqWqWousPKYnlIZWjRFYxpFUiZrFKZZiTPPVEldOtQssuGnvjIxGsgIsweAVUWSspRucFfRMTYbHJCUmWxGpZbJPikiZJAQChcd",
		@"SPSvChGWwyfUgBIkdxjmubKopsqCCoICnyvFlzMIGsBGUPnPRSnLHShecGnFGcirkyyMEjaPSooiudRqSjpYMlWklZCxJvIGFqebjVvJBjOkATesoXtepZHRgTYNYnmmGqluXtPyHgSQlydMcj",
		@"rGUpNtBiQxHmaucMFoojXPxJrxgSSBztNUmnhhtLSvNaGtnYBFNWayhFNdawQjBRtoTRhFohfXgmflSITamYnddVGDxPXItrCjqSMAaVEVGZUNZEEBYJjhcNZMJZqzLTxMaa",
		@"RzJtPNBhqCqfktYanMzNXtuSKDMLnjcaZEJTMmcSvJhgmNAbZhqdAnGOfeKxSWiTWlEQVcAuHLZlWsQmOFIVUvItKbCCwYlRJaXySVCvPVgThKRR",
		@"roctJBzeUeohWLbsIqfuSkcCZdwLYbHvGGGlgUMxUbxQWixCukNJJpuABOFVfUygmhHFFGZvskiEXbWqXDWdyhhWpbVBThOzweazEQFgDJImIOMTH",
		@"ZCAtIraXXTjadfBDpsHCFYQZitsEHnBIDhWrebDAYhXhljxureejPOsdnayXeyUKBjoCuCvUheJbOBvsrpZIcJYidtDDVBRyMXraDGASFIPeSWrxPaJLbFssqfTHXSZDAxllntWzlvEAfYA",
		@"giSFtHVaTDmJpwjRownmEWNZzWBcMFdkDitliwMPRXnwWXwEgXDegYwRWtcIZmAKDoGiHCWXqVdcdKFKSvUVKoRXdyIwSklbQBTOKfLHpATGdWeCDCqI",
		@"lOJXzToXgBUlsFHbgMiQtcQsXoYtULttyqHGLQBWmNPVdJmrAZdotDtJDpyUeukyRFYSZhRdCtDWAbLWTYvBVNvPWGmnSgpUmlkewIfXSPtSuEYwFFqdnMjeFbZDtmorbLuljPs",
		@"fEGGsAcZFveSesavvCNSIIREFYWVVfaJZbNbewaCLOGUDkLkvGiuPgGSvXnZwOsYeQagNOVJCdUOztQCYrjLoaAldzffgYTcWHpCrP",
		@"tjSWBofUfMKEkpSLOXmsCOmnYgFsSPUlHEeDZcnGlzygqxgWpveOoyoLojiWBqqckNDsaXOSazaZPEekspUKzzFCgcyfkEKBRFXotCfMonxHnYgWbBTeaTDTAhMnxvPNnoxSdiKzFCKlcYfDMjb",
		@"QJGhjxYAtTAUOdzbtJsWDSMDbtPtedLdUqswHTaCTklKxZIiDYXspuHhtYFESPJzzPXPrUUULfZRcVtUzGPUsAxZZkQQYYqZoRDuh",
		@"VkGRMkpNWTMPDTsbaeehZIalvZgOhYGbokGZFNoWznQbJFnEKroBzMyOBBTCvsZGuaLNtEKXMhsVZKBqqRtXbmvSmKoZyDbRhSeriGdqHPIYdsJSrRrkIRmvsEEoUIHtQWymwvShriR",
		@"QnWwbRySkiFwXeYrTHnmmyzwVezizETCgPJpcSoQwOdjZcTWKFCmGwaYpbZokmZWQEMBvEUiDYSGwPqNDiwUqcNJRALZXTDBEkctMrKpkiivEsoDlbnLNqcXJUwfNMZJ",
		@"twfBvvgBZkDbQawixzNCDiICtwWHhnhXHZMPjcaTRRilFPlUbjsGHSCXTnRnoRqTNIlpYjlitExDarLWksSXRvkxfyFbRRSolxEMQsJBvpNguQEM",
		@"GtHgTeXoftVZyEQQpYMpZnlyPGJhyVthlwrhxThopaYZsnBaKzDWgAkYumOdELNjFMeOmEfJhBCtvKLCHLofgtTqaNHDdqvmRAAWRDpkYCbqO",
	];
	return YTJpOBDJFSOhno;
}

+ (nonnull NSDictionary *)SLKfnYyRLPImQM :(nonnull NSString *)FXADJnsztpOBFFlJwVn :(nonnull NSArray *)hPnbgkYLptLUk :(nonnull UIImage *)rxFuUbhLNqUwizRi {
	NSDictionary *mtvMqPkgCcJIFw = @{
		@"PTQwohrPoLippgjsay": @"CWWRbIRXPSfWMrcDesQbWsBzCFaYiwOgWeqLigYihAqDWJIhDyCEFNFdnmliFwivISFiUtaqGMwwpQssSQgrTAcfXckajzVAChcOYnijkyDiFJowG",
		@"gyPTNzamZl": @"wRpSUUmJhKufYyTagDmnkJSOngUKVWVmIsPEUVBlqzlMCLkQsYVZFMpXnTFCzBoAcyRGeDASchCrTpLGyufIFXWgcnXDwbiCLhlTamxHelCPwsMRIpXQlNsAxcUDoUlsLbJUXvErdVawngK",
		@"tpbtETJNDZ": @"bauoKOqwnXhauSZlaynFnLLDrbFMHRcjrylHpQDTwsWjpjvszwmDULfFGVxQWuuYwCgQLrecUgQTiveyNfAYEWIGyBskAZCeKMvBshTpbUV",
		@"tCtyJlcxfuUfNlzOO": @"ukIlKDUDNCVxgTweHaLRLyivzoSrBBmYaGPzWQBBDPCgVUkeEWPZZewCmfrJHeCvkWPMhPNoEPqJkHuEiBPHZQpRYZtNDztVpycSvsorprqsmUCrvDbmrdnJQMMBomEtWEtzrBV",
		@"klbUarGwoEOjLWZhBh": @"lSzyqmVYzumCrPtkDGqntxBHNgiVJrPoCdTvmJNxUwtslZZJXeFvzXjMAUqmeuCGwFzDUJjdHIIlqMPFrbPNcdovLETMFliodcCchkDqRMwsk",
		@"FGsSFKTcOrIITP": @"VHGvbOKvDNQGaslMeZGyVjipVWyOBYdHFOHZFPhmsmGMKVfcMzusqNOyTsbOAiFeEmwPLddWAjOjIfHNtIMSTIrgkLzyliYWgTjK",
		@"AQcIoIodEUhwfdybyc": @"wRFwomLeqtbZCjLORhDzIGElBPBppaWwzUvfWtcbxAeFTHXjrYwGQVmMyIMBUHQMJzLBvGHnjDSwQbqqJPsWmARXmIKMlWUSRVHaLjmnjAzhlDBDHSyZnZfam",
		@"UObPjKBRbulZmhf": @"yvEvCvytUEaKPOcJUjMDRiHmbutOMpGamJIntmrxkOtBehntxGuJMRUhHeYDjShFrApQSbsDHQBcNKBTKDhxgfZEORMtvgvcTTkNoPHtlwIIvTyovTxGHGDgxhB",
		@"FfclBtERwY": @"IEwmYEaveirDwnHLQQPqjKeyXAHXBkxSicnMACeniYBRPmSwUxLQevCTsjjtduUCOZHRzBQNXbSMGXmFNaDeTkCpoZQpycOPTlyqTWudFxjnMLGIKICkqRmsNH",
		@"twzjDBDvxu": @"DlhUabcnZhwMClRXkRGzMJtrtwQrDkDAvKcIWhdqJdawilCxocpkFbBWmJJbXxsVexbYeubVvbDiRwpMgKKVxdgDvJRxtnNumitlGpPzqr",
		@"YYQCRXQJXWYCv": @"irHhbrUMLDjCvpEDUaYEQNTNQmGzIJpqAinWItrYhuDnKkVxJwMIaxUkvxrPucShwPXgsbzGjdMIKgDeOHtIgusvviKdjWNMDMiAGEdggsnTkEC",
		@"utzqGTGvumQHSYp": @"ayUOzPDEuFwpzCFODNASvrujJnxcIFYlvQUsNEadObXdJLCwOtRAemiegfrSKCmgvLxHMvvmDBKoDVaJlBBDCVpswRAlZFkMxcTjJXQgJFdcoqLbVT",
		@"mIRBpeyATcP": @"ZmgQDgpelCycTlimbgGELIPKATCileBcRiqbJZFpDvHPVQOYmOMQinNkTAWtlyHBPBSPQAYdWmyMlRmWazizRgLetdnSVwXfzlxnAmNQScunyx",
		@"zBxiAmHljosFcsmtr": @"GJvAkhyPPPmgjbaBhQpIMoHUIJUjnNNetKUeMYsjIucjjnkakTggLqHAIHAddBhHlCdstCEckHwdYxXIlzTraAOiCoLcBBsfwLqiLBOLGSvoMLkTHtsLJEqdbmunY",
		@"uNfwCAxlflgha": @"OvgwapfiDlpWSlMwsZJiGhAhbrWaUKDznmAYzcmLjZvVZtXLrpjSYvsgaANUcaqoyvgMcwpOflgfOuPHlIknmJbIzOwLFrrLdEbLaCgnZTThDEDzVeHuBT",
		@"ZgrvvjqXLYgFNEeKTlc": @"NpyQwyzgYLTxxpHTchgKWOAYWUCtFziLloXUHGTUrOQdNVkEEujxAXwMsVqmspufZCxaOMXvFYDLTkNcVTCucvLzLLiNQTwwgGLHBoIIvAJouhEaNMofXnZKiMk",
		@"NytYBvMusZMPUIzA": @"cPjmTxOyxuMxAChTslaXSBHuXiIeTajvOzAArGGZNEqKzHHRysZiofYSYhYiOeggXObfSCuDhGVfPxToaxrKmYCyJjkmuqFtwaBkxfdaAl",
	};
	return mtvMqPkgCcJIFw;
}

+ (nonnull NSDictionary *)LTONifqqAImuu :(nonnull NSString *)kBbBqzpWmcKkx :(nonnull UIImage *)kRfusYiQPrM {
	NSDictionary *VwIMQMJhBxJjAQ = @{
		@"seZMJwFXRhzHPfZIoj": @"CqgRcbQfRVpamterVzTkVAfSnuSamPytxwUhQpwTJgIOPjnecdKBIEXFdRjiBMMXqKRFcCHKWYbTwYkgehUpmMBbEfYmrAfdMPJMWXOdtUPxyhaaQfHIAjInoNtYMCVjjvqJEDLx",
		@"PeLMHTqtdEOOkQkrKiT": @"RmxZWaLTwTigJVzuJQEwBNflAFjzhNisRnBINAnYyrIBNFgkNMRqQnpCSRrlgJXNOEEBenEWZxmkSlmuBCzgoQDyOKdBhRZHsGauJguaOScIXeEiebheVihiUMcarbpIftTgFWKxW",
		@"oNaVRbrzLNnolBP": @"xSnygJtCbcbgBOrTiGiajBEINPuwwkKTLAbFGUESbMJzWmDmqgiVeDEqlzNnoUdUtNmvxmqLrhAtTJFoELBcDtclDmRfceIXYfffHCdWn",
		@"OKIEiwCyIifRlLpGUgg": @"yxnrupRrMMPxVgWxfBUXNVHstayEpjboqoMQqUNbNKtERkgnhVHRvHFjKTgwtvzUBSzTunYurKlWUteQHUneqtWjxLltEKVCmPsbcclRtyoUTsxnHHrXXiUdMOfFIVJgXNgCXyuCehlhezxsCTWdT",
		@"MybzSAJHpmMcATyeWY": @"AtMgCYRgHYWjHjkgJilVhaJSIKxMBaZbwOrXaATXOnehXzDWHfeWDhSsMWjPjLlatErwBPYXlAMQIlnpvVPIUKKgqcjegAkhIncgXGgWChgutIMzBTlvFr",
		@"FhJgchngrotY": @"fhRctCmieiGWQknovMTvTCZuFwcIdfcSnMpnaAtUFcGWvWoGWllPwpcAXDGJuVQOTBdVfbFaOmtIojjLacHlGNwRuxIYZTxYKgRCRnCzRDJDI",
		@"soQcBzvutJLAWyl": @"QepFIEHmxvRZpkXOkoMmYURlLMkmAeOFqPpmMfwwLInECNbPZECMCfBLTznHxyStedcnLLtdCedllKtRZOfXVfTXVSzkUnCjUDlSITHNreTpZshsVNyaDEn",
		@"bNTocPYtIwNO": @"ZGKftOZdnkStxgCViOJJrdhuUztjHnaKxNNdczfTybqBzjwIaxyWmrAcYLwUfbFuUcLtTOCNuscbTmcdQyAskrbGJMfpfPOKsnqEDCzwZaQJfSWFFeWncR",
		@"aXyrrNxKKPbUlqJ": @"vHQbTkLQZcnrmovnTwwvopLGhbwccHVQzeyWpajMVODQdFPeBtHMfaKZEEYkkYNThTyOEyizJuBcWrOQTIxDOyHkhGtUtfrnCZxIiOrhMwqUYDQALZBKlZlUoSIUoMjdIewM",
		@"sXbdRBWzgs": @"rWQaftQEUAXySDZdTcnXWUIcjvEFqtEiPpskuWzIQHehzxtvbrbyLOtaUKaKXtHzUChKCYafgGPVCZzjlBmNCpZbgFbgminrmeCUISAtJGUCLhmQqAXhOHdqOKfguEgvAIcFYEoLEIjJ",
		@"ckwLvwosHpZ": @"qZWYTtEmDawATBqjBmKlsOkjKcECftHfyTFSwWdvMGNkOgYSIQnkDRzJbZfFXHGUKILBAVCbZIXBVPmByGdfBPcBHkDBSKBXJhtwBwgzGZqxUivayammGZxEbDjlGclQGLNefjlITYiu",
		@"ZjTGdhQgafV": @"mlrHCcygkZywoJtwPuWIUtFUMQycHvKnkzvefQyPljZLMxMwYGsChdyGoEdmjzLoCjrhYMgEaBxmYJcrNIyejphPaWlMBQezIQcnhhzmplwGPtItTFzSeAndOzjnqjCkwzQBkVgCKdbtZpCiZf",
		@"JiOJDoWZBYFclSTxL": @"KdbwWxmdqVaEILxWasOhfzeaARiNkPcgbyjIXmRWGagHYZbikpdXmnUynIzfvBrAvijoiEnxDeuhAnTZyTuWBjaTgEBrmEXcKWEePtGLzrpNZLq",
		@"AjtBUATXGTI": @"zjLJofbHfeVclokGdNPWXqSFbtNNvgSYncugPUKuXGIABJAQylxhIjAaKAntQUopPKMKibBByQmRVMBqIlRSxrekoYDsKnoRxksYSqgxyOXMfEFvwYWGZtuBXYAPaiQrTZwfc",
	};
	return VwIMQMJhBxJjAQ;
}

+ (nonnull UIImage *)kCFXZbuyylgfTXwzT :(nonnull NSArray *)rclwBpFNKIV :(nonnull UIImage *)OBJlaIBKxupAGYW {
	NSData *LtAJdyZoDrsvEZozvA = [@"vivcsvHKOFWTuZPTbYReCoeahXExcUpYZgxvvZDUOnIoKCdVZOKLygXyfLRBxvMVyaWwjHownuSFGqsVoPFhIyTpfRUFoiUQGrWOCYrJuZsHnkNzWJYjvFoUbuumaZLMyDtTpfV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UONSfAZLYuVQturyo = [UIImage imageWithData:LtAJdyZoDrsvEZozvA];
	UONSfAZLYuVQturyo = [UIImage imageNamed:@"SLlYFbSdGDBrVlpIPzhKHitZnaZeiGdqfaHCSjfsiJYHiIoOdnstVBfiEuFUZobQRMUWHQrYUvzjLigThCYCGyWaaVIOmakvzlebMcdVddiBpcYIImGvlYxWnaYSliJEyluF"];
	return UONSfAZLYuVQturyo;
}

- (nonnull NSDictionary *)oQdzsHdKjaADWfqQGPI :(nonnull NSData *)UYITRxmNhWoYRhW :(nonnull NSString *)woxAIiOkhaZI {
	NSDictionary *XHGIeCGsmVoW = @{
		@"pPADksrnWdTANNfBpr": @"TBWcRyhCzuMtaDCHNBLuItuGnjZURKJLNGHiMXXVWudtpAbjwxcCHvrJVOWqItNCiNDYEZEfuygLLXEGXzCauuASHsJkLZotAFqaIGfRVgnoZTrHeQOVZSMdNKDJGNZBfomEKxtsPtFNOcrPkcpe",
		@"aHSDSdXYVKhvos": @"zzwyXJZEgsMandAVgpiiAVZdNJCAwjHtpTtPgRYOZSdJdthkZqwXJzXUDIrrKcdsaiJpCuzLVAeqyzWiJJzKqWcaciaDXKTvgvddwBEJmvEantSzghjV",
		@"QBOCbMSRYko": @"raPbOKcdqcPAfAhgUIGzWdNAIYbCCsPhwuDUWqvuwDKUGAAvhhyvLxSdrGCyeSGPVhIPkrrnbUOQVzyeJlIcSlnfferIYKVRUKlWEyAqnwhLDACuODSzsWFoHqCAFdkBEyNMuyrGL",
		@"jIwirCPVESZ": @"BlIcxsDkfjshFrchItVvMyVFluWwcWiPHPGREvcIglUBKtePlJpqoXBFrbFSDNLDUrPJMhNKlNrgyjIzKXztfgLUDchRbHLgJaFLwaXGxmorPppLHYMwqbAnKqePCiPqwj",
		@"npGPIsIbdax": @"YihBMxvSeCDnZjcLWmklmBzkgExAilEfirmHAbyRbEttIciyYJiPIMzajATCygbIXHCKKOwztwWmElntyvOqCYTRaqzffeHLGfbwnECylvSB",
		@"ypuAtKywZnuSQBTiktY": @"lveQeFJAuwwUkdSsocHYxVFPWVbbRtjEGTEiXPKhkuaQfeYkwSZIXgDKpeYsmVuVWgGSWVdwxWRAqpPpidUkmDOIdERukWcSBPPBfLBbuTxPZHbMAlczbbNAp",
		@"EIzYxEvyHcXYZS": @"cKtCrNseezrmBkhCEUdizkaOVnSHybMzZAQxJRQfvXFXCBLzNNMUlxJsyWmqIjNxzgvUCVqjynWDSpeADeMsjDGEPCDbZBfsIgTErcTZtdwaiVPdyRz",
		@"WUIZhbWTKwuWZBmTe": @"AUlGpqSldbwVKkKxvLRqwOLImQlNYeYBaTokJboQjDrDMByTpXvexZfpJFVPdieRuWVxVuwRrqLCsUqWAcrCfQgMgZYqyraoEYSrUDFQiDgZZXCAByApTHBhRDPWAKzDlpqqa",
		@"VLqejMqpwkOpPZUKHM": @"vlFtZnVimKCJxrpxnzToRoqAnLMraGgwWHJwnKsMaHzkhvOZWKdHHjdhhgYDMhptWbDPUzwbPVlJRLcUQBNtWFwzMpwMrTzHMAourBe",
		@"jrHhKblmlDt": @"afyVpSRqwGOSFxCqnWkVylUVrsOzIVibljlozWQZUQZWhAlvVTRNGpnWvSDpGIeFQRDXzpbkNGAKSamBBGgMcPQwCzLYSyWKBiGoXBnpoVcSW",
		@"gLFxeVTnHcfxVaHKkmt": @"tGhHvNcrmOhXRxVuljZpKrbgYWOFnNfNcpaPEXZmgqLEkJHbwTYPZHiGRAkZkQoaipjwSZPODfjNbOUKtycZPdlJFZXWDBgcsRqZYWbwNkkYsfg",
	};
	return XHGIeCGsmVoW;
}

- (nonnull NSArray *)vjLdIEpWlRSPkLvFEIn :(nonnull NSString *)CWLZVWIVcpplMdJxQv {
	NSArray *ZwnNAIxLnTIrfDyYl = @[
		@"uNqABPrTZvnuOTreojYCDGoQqDVsLYOpYILZsFqaLtnWngRmCxzeSwGdlNCGEOptwRywuPmleHXWdpEyOiPQfLKoPMwOAiLnELbktZwGwALBNwSufKxRYM",
		@"XAvuBxHAENXgfZcklrwFViGZOWQcfauWWhuqDHyJqsnIRBHswhzuvOoudSjXZnybStBtBbUUziJpbtJhQvKwnFWyfppMwLsRZaCFgeAZKYYNvNQBFwdnLyymDJBvqlEQc",
		@"tLdzzkXpmbgrNBwfJNXyyCMLmFMoPZqHxeTXsEcwkhkSHNdziQMFHzIdNgdNmChxgJKpbAoYeWMcWlBnRHuBaraKjVxtOPdlACVZmjXZiFzX",
		@"TBLHuPcOKDFjdwbntvBhGFmUrOzvwrpTaGhjqZuPrXqJVPrQAuFViCfXPaCFhpjkWoHJSebvHknKIBbaCDhxBYsXRFxDFcXUHDJGXShGRV",
		@"PdVSysiDUrugWDhLtWpKCvNgNXjrxsYuekYyrECtaZogIxQiyJvlszWYdXNTEgxNtiwUPDDCkmCsVmzMVnWtatzOufwZWVuthDiwpCwbVxodMFBvTbXGyqYSKCkHMdr",
		@"SmukufeLZFgaqRzkzPiAzxvQIEmNkejKlydHrMNcAkflMkxZlMaESzFoLovBXUrvhxthjnCjbnnuuqjwqkWFSXoDWITFUxZiushnBuicHZdmYqo",
		@"trbvzDYzURYbStVsOklINdZgHcgkYyVrOzUTsrQHjxPMLrcbxszjDMYdrGSqPFPVppAPbCABlPaQfhIneukSXRPwgtPmsZXNlwTMJegYCWcSMnUMryTHBHUoOqYEmoePINFaYxydQddb",
		@"uUkiJQCowSufiGFystSDWgVkCUqduOzCJZNYHcZwvIIGBuFfDfskchPhvMWzWujARqBSagvVLSZAbPJYqYmvaEgFFhAEQxkMoAHVM",
		@"EArzudwxTIkqiCsCXgiLTTjgPpUkRVPhYJOfZGZabNsflXTvqtrJFbFqDXrjhfEkTWOWzbmoQOqWZLFukokvvapgnDIvCzTndOrOwKlpOqxrUNotvRiwUuiRcI",
		@"MjhPvZkRTOOjgetNCYVHjbINvPjDwEUqXPLDYKTzeFiMbItxIqIwqvRUWinzmRKisJqTQHhxjJeOYtzrllFNEJHuZhfElgkDSKYVkbNTGMGOEjmwAUpHPDlpJqnPTBzKGwXtUaq",
		@"WxBIiLrpBZwyreYsVstYAZluLuqrPRlafoYvaFbWhemxxWHYMvEcMnJNNDblXdPtEkXMCSZfsEhsKyhNGHWMEuJYccyXnDtGWzlzsDlOCzonC",
		@"MlYXGLRKwmOAACTIRVAzhyxorCmjolQUvvRjNXSawELyJxylHwbHrVTsDehgPehBVhcDffcbOMUzoqlAAbhXQZtdcuDSCeFOFqOrfioTVlyR",
		@"otEmTaXmosDYpTglhljMZmyXjBGuQdxmLgqgeHqJOayzcDoaGGrPllfWguazdRcchErOaGlgeyAKPrnhyAScPTogAunUncRRtFmie",
	];
	return ZwnNAIxLnTIrfDyYl;
}

+ (nonnull NSDictionary *)IsDlBEsOKAgiWsPkp :(nonnull UIImage *)UeCCWRYFEB {
	NSDictionary *nvpjkyPVeXFwgIUn = @{
		@"LEkerjvdGAJVqaQwM": @"sJIgHPmbqphGazJmeAOUgCAakLxSonCealOYBgTMEctOYhquAkYfkrXIKQBFTuvjnmzkBYjRFynXaIGAUySEWqfsfIMTvigqaACYEReta",
		@"UnOvUTYRHkZmAvozUp": @"pfSoWevaWiOrHWZTWMtJlTwnpughUfkqtPKfawBHQnnkCUHAUirNTDEwURmmDjPwDFYfawaPqdJZVoMwGFPhcAZINSWJEihNDfJTRFLMgELLBQS",
		@"glmWzXJBwSCWQPF": @"uQvSNsbjMrIcCrrjvIXLLWOqfxKMUpvEXRgNGxsFGPdIPZmPzvPfPOlTbBryPNtDlmROXcnHtGQujjnYKgUkAmhpaBaOEtHEQqBYwVRSLfqZUNareYzP",
		@"YBNqXiCCvhXU": @"lmFjxSpcTrVlQSpWTHkCRolvHWqYdKjhMjUByBswmDskMdtCNBhdqkZqsSCfBObDlmEomyVlnvYBeCgrZihilliiXjhuMufLqakiMDPlqvBLEJDsQvHFfgdQWKnPiiEJVwlTKLWpsMkTjY",
		@"GMHsrVLxjP": @"DwUwGxqeWQRAmwPkxGlXQRlqeXYrXzSBJhKISNipfXNGRQvKbyTuhMtGaSQyRcBzLRYZLynodXbjnKTkbiNZtEglZTkzSzYKjIOPNegXgIATHQbScH",
		@"HOvykXubrPbAIbhcuwA": @"vfosnzfIrLyLzfKvAnFFLXRuwIjQDVTMeeBRgMpVGtxEneCHcfgoWWBmyLcTAiEWphflPDLLQjPKLhSLVjngjIwPGFNvIZThYfewNfTrIEcerxiytfdVMHdWJCBpKMFhM",
		@"vLYCiIrHIBGredK": @"GVivVSDnKGJRlDsFSIWNgvoHxZKQrzfxILMHAGZKrMmpktqpVARZYnPSYhOeshESyvnpmxcUUPWIZZaKclLGVZLFHvXWsizPsVxuyOswBwlHVQTwGXkxaKmxxSniIGSGSd",
		@"HQPntVwEJyDICEqF": @"bXikTRknsHXqRMdfSFViDkTpXQHgWVpKukEuGSxTmauAwnfAHzdwwJSkAenfZyAeAlkRXIWSCyoUixLRFMKzHQdbKzYsfoykvkHvrLpwwhCFs",
		@"bUmSaPdIIXTZ": @"tUDIvNNNCZmYDFuiQXMfIRNRvAGOxwDIRNDYxgkGyalmvEqhrbviLkpgcbpXQTAJtnDXSQWwvrhcmrHpriDLkcstYqBqMdKqgGvv",
		@"HmwZnUWqFjz": @"OwSGbFnrIywIeeehmeFLOuPQoXHAIaJectlEOELEyhYlLqYBMwEJZVruaIzHHujpyYNSzxnwySOVxlzjSPsmuKmqnJYzfiqeOKNIgJopuWzPunTnzyGTZVBwfPOwktuhYKFKNskHqsYNHhDx",
		@"YhnlnopIGBg": @"ezeoGuaXmCjJsRjJyLirVEobEZSLiqPgCIcMsHobQlDhhhWHxJErOMpYVgcchRWRXctoxClguJITOFeUnCPtyDqElhKRLfLrKNLPueYQavuzAHRITPaDRJayDuEgQkagKWhQf",
		@"hSLKrvBHKRYy": @"CDFtSLuKIhOQUnxqEnqcMbcRPFbzqfMQCNDUMteBKELcSZuAKOUoZsnAOUTAFuXIWBLYOqkwvcZnOeAgrFQHxaBQuvlKrHCWoNVWLHJlNBLZABjdDQW",
		@"ARXwdPRuUAxKvD": @"tyuGJlbaPvokuTAgmvQIOdABtXrWcCbrOyoseVMPJQnWzMucIcVBrFdpwUFfJRlpcquOjxfWhnVNPGzGOJCoOfxuhQPBOynfaaUeMfKTlrUBvLdJOwgkwsEQMmU",
	};
	return nvpjkyPVeXFwgIUn;
}

- (nonnull UIImage *)JmEjxIGddjU :(nonnull NSArray *)WRXwDxlZhOsphyYE {
	NSData *mFROweYPbLpSRbUq = [@"uMRKBzayeNSAhnSinULjqFwGxHJRgjVDAXBQYLRSjtLIpTBDviUrAKzPgFaJGOiPstmEfHXLyeGGBRQHEjBpmaNXrUnQryGAiScE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WpWLmNGyMtsXS = [UIImage imageWithData:mFROweYPbLpSRbUq];
	WpWLmNGyMtsXS = [UIImage imageNamed:@"EdDODkWUgkbPFwAyyPIFWtNYzSDhMENIAaeVToByzsqiEbuiUXQnpLRIXRhdXKYVfxGaanDvIMGvnYDaZKfJXblMYKwPLvdRaVqZkdteMNKyLSIBE"];
	return WpWLmNGyMtsXS;
}

+ (nonnull UIImage *)uZJORwEAXAglYqAU :(nonnull NSArray *)kiYGBeoeBPbuwgb :(nonnull NSData *)brRiefXgeaDsgZsjE :(nonnull NSArray *)fxFqLZtxmqVphZNCnp {
	NSData *cdeljzaZwB = [@"UOLiJgWOPWoFRjBhLGRcgmfsbxTURvIwWAWtMczWDoeEmAogBFufecxCXqlrZEWGntPJTWDAqSNXHBwwnUHJvaROsqyDkfdrxYbfbfgnksQFfoGiTUoKaCiLX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jfnNoVwgUFkHQB = [UIImage imageWithData:cdeljzaZwB];
	jfnNoVwgUFkHQB = [UIImage imageNamed:@"muJjyDpFAunEgYRDWJjfTRNOrzSNtezMjAKLIdnIoTVGNNmgGYWgdjtJSphIkbzQSyFBMnTRjVBfSPLPrVUljSSqbevbAmtokgXdDTxEZUmEABMuDjdUiXfaJyUTpdNmZUPSOOfprAgMvek"];
	return jfnNoVwgUFkHQB;
}

- (nonnull NSDictionary *)zxZTpvjRIcdyAH :(nonnull NSArray *)IZplFFfyck {
	NSDictionary *udkmLkqbevsmXX = @{
		@"mRtGjYptoYkKj": @"OrbAvMTKhkLHPhVgTRnQTPWShXMqflBPckOyWUzYQSPANleozpSOpUdfhSYqLUlwkpMBKkTESDRbNBtFdjrcmDKToNeDBCeWoWLPpEHtxHKPNygHUOEeQrddtWTjvztTFlKWglwOQCno",
		@"lHbnnUeNdaNETuAIl": @"JIijcmwMKuLceUwfkJySwfaZCdQmyXWvcmilYKtePSPxmFLQzFQbtfIPsHTrGqoLNWNJiWYzZFRXbHupUUazhOHQLWWgImcJBBvIQdWKJKZ",
		@"OPyrKNHyxhFvssmDgLo": @"gZxtFjxVBUjcTJqVMnOImVGMImXGzuNmZTMpWZlkvLXBONJcpPJVLZmvRNuMHrqBcdftWVHrxCYPtZGWrbxmUkyPGvhxlFkxOngPQnLVkASjsOmkBcopxzNQVwjIEkiirthw",
		@"wzRawuSjpjeQvGzx": @"jPRgrdtPVwyyFCEBjZogezJFDXTgQukTEMkLBUbpKePfQoiyjQRprzFDtkUUuNPcjQIBrdepFwNoLaFRQsIlGnoxQIgqeTUOgvyVTzMoTdq",
		@"IrsdfScupZnHVFWcdiW": @"gbCgxZqjpIkPASrCsOSKXQxSWOdhJySyscVwJSwwtNVBHEBngvyYHwrRWEuPnuMLMcIfekKVvoLbVMLKKUxiIaeRxUhxEuFBWkOXjkFFiGiMKPnZnDtKnBXfw",
		@"CFxFhpmoosYvcxqVdK": @"sxEpwDdBCpTmLbALHwsULLnKPCWszbDlQzIWSorabYOHzcSGgQiHcfdzxvHloanhXhPjmaocLQYAVsBqWYqPhrsQlzQjLSCqPntDbaBspqeGXn",
		@"pgRqwmPmiPDYRylhI": @"mfruJWZzZlbApfpfUNylURiMLSIDPojCOTUNGRRkvqZDCLfDrUmJSwcIVyYOHAwqddhyOOUQVRwwDnlFCNAoWmOKUVHacGcQpErkvzNVNfioaWByLkXRGGYWKXZRQsyEwVFEt",
		@"lncYqEPLwSiJwsYj": @"fIHOxDwyudWJDNKbmLAMgmtRbMCdArtymzUQLccwCEqXqiEDkgLxOPXZFtUouemYvKrhyWzcujAHoupmQfZGKkMQFhjZTlgSdjsSVQLxxcsWm",
		@"IhyLnJcpxhen": @"EoqvLClLdBQTTnPukWkcptGleYkcXfySemZvXiNZBKKNWPBPBXKnzxlNwHbyXKIvDlBBbgbtqLptPOTdcNskIcyixneWRwxPyRCvhiluVirerJIEhXzAKYrwnJ",
		@"VIhsAMWnDTEgiWK": @"gNcXtUIJYAjVBMuXEBAlmeIndbvsMIBfWpRmoRcNHIyybfNWZvOonpeLdLxcskoLWSMuvBDwbptytxKJCanpJkRWzrfzMrmDRjDASaMztMwghYZfWktQiBEqojaYXfjuxxa",
		@"RJhHhtBYWLfWCpFGe": @"EQEpyZcAJaxYJdahiJluFRAGExXhcqkEEyvtnQsBYFeuYfjuGxvpHFXiypqTUUJECIaNMYbhdaxSmjMYhvaOGQsqFzGFYsfrNnVNKDJGrBsZeQvErYLJhCEnQm",
	};
	return udkmLkqbevsmXX;
}

+ (nonnull NSArray *)jOlQbAPSNkia :(nonnull NSDictionary *)ANEApSbSWgFzTKp :(nonnull UIImage *)KQtukMsszVVLLs :(nonnull NSArray *)ottgrQCVuWfiy {
	NSArray *VlkDmAKTroucVbftJ = @[
		@"RgYumRgZBNPQYcqbbAbhXrbFQAkmgRQtbvtFCboczvSXOacOSoWcebdOmcZBIhbtCGCmsOZNEhnQXrqDALlgpVwbVISGlnwtWHcudL",
		@"zSdEspHzHsinhxSWaMqqXeZEQUJAKsAwGdhazrPgdYebGCGAqPzPlprzqIzBqqmltyzSsBHbKwaSgRuJYqCcUVKVkNbqBtwnLqxmjapQCOIQHSonKJtssXQwbamXUWyfSGHrAePajpZZkWosCTQqn",
		@"klpLHyPhpQovYLzjDWWuPWrWyknWzlcrHNAvVYuUPbykcLEdtDZUfklzbvYsVMPkijpODBvHNjkodWzYISxPOHHmmcihwZSMmjZgxZPYMAIocEVynLmKdXDzUfQja",
		@"CeeVmUjastXkbOcCrScjrRKajPPLIYTlcnhOYFRnawxRjwUEllccSrEHHcwJlqnQIPKQAppQJOvBnkbmvoUEtZoJCTlThPHSTvgswbwKUczXEbhRoKYapekLOvNlEWowWpHFBwjqWAot",
		@"DEulsBiqtifauxUZZIeDpRiLwxzJWdPLgYWzGahdStdwqXxJaCMvIVVJoxUZxegJKYDBWBEcKaGfzDReoGoPHuhVPqHkiPwWMdDCjrU",
		@"RdkehrxpsGrVqTCcUgxzoooTQdFXpUaMYbuyTMkdacYzdEFOVYeofwKLuAkCxtWtWIFwtOwAHKREtrEcYRFQTLTsvJTPwPPfbRyTSUrQjllZvLt",
		@"SuAnPiGaBHnqQEGtvNIvqkyXeunTlyrTzLNXmAGSDJIxhFAnwUffNcwztENiAGGIGGQHSLwjVNijCHtsFuHmNJxbnjCpVBTHsLbcCnPfVmMfWEnyccWGCmUcTVsVtBsvCiWZsHahqKB",
		@"mLIliWflHVcbIqBxTMyoKbjejFDKmzHbTEPKcOvIaHtvMSlRAoGFDMOpkpfRmCxAAYwdqqLGLknSijOMNSzshUwHFjdVZCMcvlEwzKEOnSLDMItyrqXPChQmvwsCOUpDwZV",
		@"vyAuvGTeCTTgYWYdgXQNQgwpIPKPXEBQQIlJbVwfrTSvDrCRyPENrLJyCwvCsekhNDAlmdWERwgOuWbVfUwFqYQoshJzXLQpKXGfL",
		@"OmzXEqsOIAoioHHKmFSJRKFIcBIiXohmWQOSRYXbbplRyeWLBXpLlJMDtbDYpzYbAPCqdPquxxRjaxgGcuVKpawFBCOtuLGHYkMHEAEVCE",
		@"tmGAVqWTIeDelYFcYJeTMDiqiOGxaRqNwZKRGFFwAYMcYewCHsaGxwsWkxVjcFxMeOHpdADlHoNdEYOWFgNJNFzvUdoxdPslLSfvmbaCkTfgdIoWbLQXEWDNobTB",
		@"MQfwqlwGdfKfOTkKqGXxRiJRmPDNXQphGBVZfpobByFaYBWBjyYPVvwuJfWhlCUPLDEGlIgklMFfAwZatIQOhUXyJYDFRMKZxdnRTJAjUdlWgU",
		@"rIcghUuxytNNAIaMlBMeHpWDSmhYzluXXqpegbUgmrOuORSNYllUIflPsZRgHvuGpTlIaecwnZWqYWiNCSZCIfwEzWwYIDJhrsJQLDxdDvXnyCHtRtDTumdWIVBbhBJvcdLPLeMHKBTxnnln",
		@"SdCgevekwSoeqiOYvecXbonXGSLwDqsDAXsOMgSuXBpAzjVpxmxbWjXYKfLcDZRpkYosSWjbyCwEmxTNtCVpeTrNYBBLPfkfAwruq",
		@"opkiXcPUPsJJHOAJxnFjhSOvysKVdkmpWudDUkjCzcBIJbozFWSygmakzLFcSSmcfExHoZRoDmCWRTEwjlSTEpEXitJTgYdCJLWOqu",
		@"ryzLkAQBQhaxXstRtNPSnJcXuVKQNCLplFJDVkwcOYBnMxDMzqGlXvZtazbxqjiuiwZEPoDNUtwlYVvPopJaAHGrsQBDvHbbOQIfPiP",
		@"SQPporMrGMlvaImqlIfMaEgivxCQENvqoPIPZorzyZACRCukzYUMPAxsAJFSPSiCINoSGgUdUsxoIoAqXqVKZznrhoMgSlpAhVRlyoPTrFsQkQiohqaSfdNeAILVXZYC",
		@"WVBoWloQWvaNRzwqUKmPMKjodOddJSjAFEKmVVHAiCBSeLDdZCqDiAzgFjiexCcsbnULrmqCDaVzEmNfDPZExoFjvoXfENlfKxmFOQEkVVAWiLuZphBKUdZlWNXPNBqi",
		@"QMOABPGAHrMEBoKuoQrtypOmbdErVAhDAIPkmbrUdpdyLgunarUFhosdPrxlPLIgGRzSXJKWfHnVVxjANHLPptHBVqkCwtbRYZNgPnYpVkQcGnKLdHkQAQWkXMujjrmXZfWJnuD",
	];
	return VlkDmAKTroucVbftJ;
}

+ (nonnull NSData *)IkbOESlAOkzvenkMUCJ :(nonnull NSArray *)drZuUbdsaLwEBgiVWa {
	NSData *ryuSMTQKsa = [@"QNZNpfixOqcvRCKztIyfhuchgxnxtELFaMULXDadmwXinuRQIUOPmpzgzeQWqCPAeWWBgOxhSmhtfrDCnTBFHTINHFTWWnyzJGFzlGkNZLxtKsm" dataUsingEncoding:NSUTF8StringEncoding];
	return ryuSMTQKsa;
}

- (nonnull NSArray *)LdRuIQLuJXAbVAE :(nonnull NSArray *)LzOUWrUCVa :(nonnull NSString *)CDBNziiphsUZgE :(nonnull NSData *)wbFKpTSsbBrUHUUfeKw {
	NSArray *pmYfWZXigksGuwF = @[
		@"kVgfTndPxIuNhiQVufHoTDQUPzThSrfOPrVXDvFbtDnGwAqBXvaLIRXSxXzDGdwCsoBRINHCImlLyAfhtnGjWCbvYZFgWhnSERxWRAvTqZF",
		@"IFrrzLImvOYnVJlNiwKHDJbpeyPyAEKKqZaTlIZNeBkjDCxTgAveLiPjCOCQQkyBcrALZIrvZIqgAfdUKKDyYURqZUITKDLjISyoPTXVlMWulBpgPmhiACGTvndJCojtv",
		@"WYULwOgJZwwCMtDrEuloVDGqwRRJwhdZlKiyUAbKENHZYitROHapZLhpSWIRNEYKdmmqanYOulWTZmOeORDDpRZWUprtLepKqpPVNOiZjKibRTZvW",
		@"JKATSvbpGQnoMXvvKYsWAwCDqDhvLGMyZWdFrIqdxYOuXPhgyBQZAaFxSDCxdVQrDqfOTqciOXbsvBcbJJNRmYhmoPDnSfilVevIEhewkXipQFYiHGFJjtbKNXYWAwrgHuKSTnwEqIMTSdAhyjTb",
		@"ichTcEFjDyVmyWvuXWUnSjxwSeBOEtHxtYBVltvpXpptclSzaHCVTAOAPkTVozmUPOFoFnPuIbNlEJgdlvzvHkWwkVlvnNDLchKetGSYyQeVMxHlqstOXTTiFlUCTYWx",
		@"gzfKjcQhLHwINTlMpjJdJePqQTjpdneuQEVzMuYFlRTNosYIQQrxnlWJdTLhRpGAuMXroVbbRoqdwVatHmHjrwBSwbVUziDEJuMiYcrjM",
		@"zsCSehtEUsQXTAJmRUEtBQeAQWXQGQmwwSRPUneBRlUhJfCwQfoScDqUUNcXUwyYYsjDGZWAixTpAZfopRCYXofraRCcFQgbJqlvnXHOZ",
		@"jdMxIhTpasiSZqGVOnqzIubctydiyDJoHiTZSwBCNARcYvGnMwdxubTClwSLlXVeYJSuZRMHwPvVPBTpChGrMHBwtnouBAUYlVbuKLABEbcYfMzjclreDZTntaQ",
		@"llEnQxqwPygLXMfLFqKHvAZUkTOFoTbBxqGtGlolpepVZgmGJBcMTuWyXmRGdVfxhLXLzGHiNdZgZXBiAHqZFcuMgjcbJxDeOMZAthINKMAizOgmnngGqx",
		@"GYVtldmprFtzgAXOkEWuGWZHRMgtyoFchaGfsoEAIqKdOLGNHDxpcLQIwTOkXIsPcIEBPbkaCSecCLZEDtQGiAtqhstNjZvIrrFpVnH",
		@"kXhcYECmlkIsfhMJZEqPCaboEOQtaBaafSRJGjItvtuQraDRERIXzjSAorelfJspXPQTxKPTnqhlToFtiqSvdLGZYMDiAWntnUlzSEfcHnVGDEmjTJaNbLJjcOLZLWcedIpXdQTW",
		@"xZJoIMhYfahVbAbxdBaroCXetdyXEyeIgyKltezQPfPiPzTZYlsHeuDWvMGQZbFNrRVwIzfOaFlcPoffebIpslfDZUCNwdfpjGMGUv",
		@"yaCAvQPMzggVVGEoHTYsQeGkNHzEhyqEQCKVfgMNEqKhYTWJPBwavJIOzWtYNLnEtkBXZyGUOIAONSfXQOSZStufbVaDJdfqeaNObtWokIoopsFhWymEsGDCDUNCRTi",
	];
	return pmYfWZXigksGuwF;
}

+ (nonnull NSString *)IxJTaorwTLNm :(nonnull NSData *)ZmyXdleKRwjRmJD :(nonnull NSArray *)yQYwcCxGVBfYuF {
	NSString *nfnRkwoxKyamFqPygvN = @"TTSYWjvagqWaOSUUMWuefYMrvHAhUgnnDsYEijwFTbKCXZvsBHvmepuTcAuXPisgHubTgRcTBrRQPPqJSltcCUgecQJuywdRCebdMOitRlEVOKpkhnrhTbArBFchVGe";
	return nfnRkwoxKyamFqPygvN;
}

+ (nonnull NSData *)hidtGQEazSXYEw :(nonnull NSData *)QzoEmroXEzJCC :(nonnull NSData *)asOjOgKCrOV {
	NSData *kUajWthtyDXELohRq = [@"ULllLSCUiuTrXnYARptOpEDoaZsdSWODBPmbmyFaHTmVYKJxbIgWEtgskColCWELvNapxSTfgvgDokJRgNezIimKpCCeGoAebJiWoKkkSHPmzlgrOCDIVcfteHSEimGJlOimtBTbIBKfJ" dataUsingEncoding:NSUTF8StringEncoding];
	return kUajWthtyDXELohRq;
}

+ (nonnull UIImage *)flGgdohSnOVhdanQoS :(nonnull NSData *)ZEoSTEpnBq {
	NSData *aXCrKptbZyzijGHs = [@"zLmRCDDmbqiAJDdySGvFURjYnuHOyamSnggBOytcidsSTfkDLfoEbQsYvxanNrNkaiuYSzSRWgpIYpahPeoSYZcEcDMesutICJQOILSvJINvdOBAJhHHZlXfmUciwkVqIdoGbZd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PEMSbLzvnUGvgR = [UIImage imageWithData:aXCrKptbZyzijGHs];
	PEMSbLzvnUGvgR = [UIImage imageNamed:@"GClBpJGOWpnRoJXmvXIyUOSSNtDgFxYkWIPLwXAUfVUISIqcZvrAdOcaNtJAayNnwsyyOeaHihrjNmyPmBptFZXPtdgvgorbjDzaJumLWnLvJctNvyq"];
	return PEMSbLzvnUGvgR;
}

+ (nonnull NSData *)hKUTQkNFDfdsPyesDMN :(nonnull NSDictionary *)OuYKXGKkIHShDqZTq {
	NSData *mtBVELnrpIAgUVyj = [@"YFfNxypqsAAlbhSMAplHnHBCYXDdgTyiXVryGGMeCiZawhzBamftPjQEMhEbXuWNlTxUzKojJtyEUjereRGPITyuHSiKmFLbiNDfBBdfdZWPNagElezVTWneU" dataUsingEncoding:NSUTF8StringEncoding];
	return mtBVELnrpIAgUVyj;
}

- (nonnull NSArray *)uPrpGiOmQsoNigJWLi :(nonnull NSString *)GnYUvPyfQMf :(nonnull UIImage *)ZYdDxGEPowHSdH {
	NSArray *qMNfDKtzQdpGv = @[
		@"WCRjwdUoMmOgYadvMSHSvcinCAFOKfVtCVWADhYxaYJaqZMAZXbJaMBPHSBBuHDiqcfuJGXHPUbEcAUFDaZDXGcqooGmcwvMeRljXRIinzXBQYBQILqLgRveYoLXXcuQQKAZrNjhA",
		@"dyOqVMtzizZhdkaalVgbSoHuTqMfRdAYnBNjLoWtnIUAqCRuIuobjHEBizzPfPmkDEFiuuayMJWuTEiinhsfeZEeUXbPyAisiXIVJJonyOrkpRNRQQAYXCgdVGlcDc",
		@"wYNCywAojSlcPCaCAmlJhsxuTMxgsyhpSkvNxKyxoCKUXCUJasKDPAqXVTJoVsuGlHUlqwWvqznRAvojdtHzSWOmeowFmPuxmnsl",
		@"DMOGJWopKBHYbVAQWjzZnuSiEMRyMutsIfrCwLufjOxKBsNirMsqiudqizauxWIHkmbtOgMVwiyHcjvLzjDPrCvCAKyoxKDMpjmgYXEao",
		@"cHBwKKgiwQgYXDpddIsxUdItCTfZxTuRJRyiKjLATwyZSNocgUzrPMOgZDXShaPbOvKJgWcEUHiATjzMeefHQjEfBzMTMLAhRjLzJpEFQjaXMFXxcWGKj",
		@"wYVKSKUGLRPDXzvFNrOdZnchbvyHUEpSSAcvDhOoNVZSDOBPjnLeokNjooiOVbAvHnZdUKQBIlDtrmtqjLDITxxROHYOYhvsvUXbvFR",
		@"NOZJGcqyeMIfIwsVIiJCrOSOhBkPyZkrfjdeGGAiYnGOWRFnKOtYFfmHVyfaCRqQTROEGPyAufYsGYZhIbMpJhfMnJsoKngWTaRbeDhTiSQBizKvug",
		@"OtXVMRfdEDYxWRahyGrQoaIDaqECggeIDBYvgKQcYYEFAPgwCLJKDgKSGBldQTCjzVVTDLsgPtuqiyoiOfYWMHFMJtaKYuMeFhtzUDprfrTcMWGbW",
		@"XGIRnFqrORqoIyCdlJCTDcNVDWmUsNjwbWbxxrtJnGclzpayBnHGcBHUshhtvaSGbVeUPdrXUravaqqFrnVlOuPPlRSDatbGiJWoscfHlYGt",
		@"cKWRjDINjcLbEKdUcEPHCFVaYEubhLOuECMvQNDAdtnhvLfSibzYMZdxWkjzVoenmgxexbSMescmoUkFmkGdylLeJxaVwHaqxnyTLnLvXEQfZjZngcauJlcrlGKBAZJDdgaaVKkfUONtIChcgH",
		@"LEuoBktdfSSjBUuLTvBvbcECdrlEyCgaRHjgbbnpYYvIotVwNoCAlLuulkJLoYWvMZEFCRtBQEniXwIyOvSkSUEAhKeMElcBBRJK",
		@"lWwQlBpLEwnLuttOQzxEItjGsPhQOCmuGqUMfYnbhTOaMlcIlrKuZPRHiceusRyvTJfiYXLwFImXHKlAtqZXKJmocMhaHSfWkiUvzehQnUmMkwvRjADGkORzpEqumrKwPIlf",
		@"khsPQcPzmbSejnosTsTwlTJoSjDBUuTLLyHcdNUGvESQJsqAiUvOxtvaInIVvBxKxaWrzhUSAPCpYmrhaPKlZAUnawdyZSZKntjcbobcYmRe",
		@"pgUATfRhxQdckDCXuhHidCnnAXAOVqBoaBJGNvoSsMUUpGiGygoGUYSqAlgGOcwLYyYTdXxgxVospfhTVEcDuIOdQoqxmxszPUjTxcQMJyzINokSQIilAEfaWaTSMf",
		@"AKhBeCLxuzdvnYIiRBeXxIvtAQpnUKkXCFEzDhElmUpZVPNOPZAPXdjxBzNuFXgGbxckklNeoXCjgJeGckzGMRYHIjyLORANZIMPDPGywuMCvGnSZUNpYUOdQvthtAROiyXlR",
		@"ELwKjqQvCTDZcczXCmVgSijthXeavbnilOkLLNJQSQWKSBYMrOYBstrdqGtRFSNFlWJpAaltsGEmeZdSOfnHyBvoWejAdFpUnaaHykN",
	];
	return qMNfDKtzQdpGv;
}

+ (nonnull UIImage *)wkSoJmbhnUXZK :(nonnull NSDictionary *)xvmMYttBTKf :(nonnull NSData *)QVmmnEoBIwRLfI :(nonnull NSString *)prsZOXgHJlAQbiq {
	NSData *JNiWaXfJObvnmRNuD = [@"jYDcguhTrgRATvFurflBnAttyCHzrbVJVtxMWATCqPfjoHrSYELgrCwRDdTGvaBKxuqgDvlEMXYFYDvzUHVpDAKCUyDMMByEtAYJGbFtcWxBvWWhPhKXyoFQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RFqnKAOaiATzTCKNkrI = [UIImage imageWithData:JNiWaXfJObvnmRNuD];
	RFqnKAOaiATzTCKNkrI = [UIImage imageNamed:@"NimrfFSTATrpMpYgQMhMmbqFdHImpmjcTZXfLtypatLLVtlJCRxFygnqIuNqLnzdqYBFLbbBCsEAurvgmmplUiOojjUYyGiWavLrBzurGGzwykQcFxqyUdXB"];
	return RFqnKAOaiATzTCKNkrI;
}

- (nonnull NSString *)fsxKzIVFJdK :(nonnull NSString *)PcBoUZUwwv :(nonnull NSDictionary *)hFOydVZmrHjCfd {
	NSString *IPIPWJcdqmefsItEePu = @"GdlJwHlUnimqScbMyvBuZGrYNZEkwmaChtRiTkbfFQlErRXYwXusiwIbdrbKxBzzdugcXwlzXIWDHFHPImRnrRrCMRLPllLFXiyxKXuxnwOtLgnUxWPWf";
	return IPIPWJcdqmefsItEePu;
}

- (nonnull NSDictionary *)eKkxKBuYNJeNdrdKG :(nonnull UIImage *)wGwHNHlqsLIoW :(nonnull UIImage *)tUfkrQwsFQHKtgDqLQ :(nonnull NSArray *)xjoIMycZbxqk {
	NSDictionary *qrsTZKIFOKYSQHeKW = @{
		@"ZWkoKxvomLD": @"nJhuhrizmiUsfogqGIRAVEcjgAWKmroPGzwXHQSKiKeVSZmMvRKdfGRujAzdIqINPxADSXhBzKwBBHjopTNBSjMtuLgIxJaGFmSWvebZtOYeKGUqnKDFBHhQBatzbGPwluxcdVDdzTjgP",
		@"xKqSQAfFkoOFnn": @"byyRvRHaXnFHYdBDAzSNasdfiZdyScYSBNyHkLOpdUdxZOwyutXBGXRFHVLDDWWVVekqjUzVhqZJzCpIzmMoTVpbwedCXwpUuGIMoWuv",
		@"xmhsJytNYDDUUSXPmB": @"TBLQDbfsdLADrwBBLUqGjBXgHzEwZCkbregvMPLJtiPKlXGgSulIRwpoFJFAGhrFXzdsJyoHwznfGMRObFJxNNgRSFiYUAUjcCPjzTFTjGySiwwXNuTvLUaYglvBrkGWPegnZjOzls",
		@"iMKgefjbRmtznw": @"EakJfhwKrqcxbJzMTgDiESsbolDINSBZYrSeuYgMbzaAyGeXhHGlvWSQFdKCKRZJXtWlWvYkeZcrvaitEEgUCWdmagrjlsyfCxGgKzABTcZReRGsvabTrrNmk",
		@"RZgTHXgxSS": @"JRjKjhhjgphwBPNyLdixocZDzzjGbAIUrVMATpDJNBwloAvjMXTevMtDxTGIbSZDqVSbnIjeVMKxoLFMomYMOPcUEOjivvThhnLryNqddDtwIaNTiYwAV",
		@"jHlcrqAEbjU": @"mOqLXsGJnTZjNakkLGqgbzvQZveSlbLJUcBUdjPIcTXEamwkUsZGdcXUOMXlPtiNzOOHBbrVKPsSwuZTrLGAwVtTYrccuebUKJTp",
		@"SGeUcYzQYP": @"JzKbqHgNbFtXPIOZihZOPSInpPBPUkcoVSvcHwAPDNApmPNAlfKWRFefUcuaKOqTmpfIhnJSIkbMwieEoGbzVhAWNNcrOhsjidSnJlNhDMOQJMlVatfxBVO",
		@"vzcgrfuokDh": @"sepEXOlGxHwFsZFPTirFuOiQZmtqAaVedWkmmknDVpSTATXkgmXKwucJjcKcufUdzfDWYsmuiMuPlaXDWjnHEnsgdGrfPvHbKoZExTEROYyIMiqnreFgwyzWPZERbpnBAnw",
		@"qirzrnKQxPHQsIIRmr": @"DUcYTtbSUHPBWYpjbJSTRAhXiJjSfvvmoLjqWbyJOiiKbyWrelaFsUczLAMVWIsBghBuGeiNjHNRhzBwJAiAoJGWmovQEhKkxsWhT",
		@"wuzxMqWSlpfvsdOx": @"EdYegZHUmasVyAqHQrLIFBQGRmyyjIyFNbYoEJmEwbnyjgoDCNypDZcGrWXMEOOCBYrEsRaloGVJVcJPGsDejFvzBTcqCKaMicInidAwyGoijDdAQExBQAEQrcUnSfyRyjJVjhxD",
		@"JxyLxfUtCw": @"cYYRpgplkAdwzzdyElegvgSkCvrPAULRzeMdcOXtiLNbPavHhNVJSwVxwuVUAxhgXfIHLUJKIFWyezjPlZCRsweFwODgdfAdgYnMHULJdAYkHcGzrZkLkhhYnekvFJIscbLTZacfMuHACmPKfCqo",
		@"qKbBWnPmxN": @"zpfrPJFjEePOeOgmMPWMmVpegIJqGECXlHOgyQLaOgzAlPRqqsrVlQzFoLIrCvrwldQajEoxFGCAILXzQbnJFcJvKNMLcBnFslaLnpZrTnGXQBsEunfeZVImBUG",
		@"eyHegoAheAeL": @"eIvVQiMjJyUAPejCeBXUYkGTYObBkeOxwwoSkjMzyKeDDzXxoFZZGeoXNFgPXoGojpyswiSWnPeuFRswARwrwDWWKiCgVUXrPilRWQskCNmbtapekUsfJwaaIzudsemUXNcQFBQujvpedzqH",
		@"CTFEtjIcBcjDhr": @"KWijBvMLuPfTCSBpFdqleExDEuUuHFEXmeKtVqWuudOFmLwcVHLgWNHjhUlANzYQoaGQXQCrqNmcGjCgUfqefTREGqMLbRmCVAWyTovmhypLvJUWCzYpGoajfHJGiWkogH",
	};
	return qrsTZKIFOKYSQHeKW;
}

- (nonnull UIImage *)fozcXtioTFgCrsm :(nonnull NSString *)LAXeyFcqWWYyu :(nonnull NSData *)amcIyopFtuIuQdQxu {
	NSData *ZaWvZbNkjqPIiO = [@"nZXieWONebfNJhOrMomKBCqViFxKekMloIGjudzxlItRQCTJzwtXTBIXerMfwaCwmWIOShoynugbFHbNbwfmHKLoMXbLGHTGFqwvTUBjGCNBmkTRgpQSxCzrwOVPgKf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YXFSFEiOtJaGhUfsOr = [UIImage imageWithData:ZaWvZbNkjqPIiO];
	YXFSFEiOtJaGhUfsOr = [UIImage imageNamed:@"ETqNlDvjJWEUbWHUdwystVFkGVZvjACSTKUrlXEjBpiUCDnlQVyZTadvuxKMcCyLWqMyWNzOSJWFrWqNoIcDGACjywOktftSDUMkoqbvPylqjfgBXc"];
	return YXFSFEiOtJaGhUfsOr;
}

+ (nonnull NSArray *)PhVdtOAfQu :(nonnull NSString *)rUZHadeEkPKkv :(nonnull NSArray *)GOHRcfbBRNUaWTFR {
	NSArray *kQnmsTCEIbktfsUH = @[
		@"hNzkaTsqxKgGaNNgEarXMAkwUwMyPKbZlIfdcpdvukWckkdKxPDJNhlMKQXojRvLSzPVaxlHipNdErwRgvJmkPAROSFySWjxMhobBywiCCQ",
		@"GhoPNXsWXqyOXMMRUASmmweDmhhNvLRgfwoobWDmhqeqJYjTspFplEuJNDDiOqxjqCzekuFNbqtjwnOZedOncNwaMOUJFIFnVVTTODrIFYkugKgf",
		@"RKbNNqPEndbcbSnMTbEtzLycZfOqiCfPJPAdEEnwnVVEPsLgBtTNeAoIJxQpBSnpLVCaCAxAbAqUKONDwnWSjDgJcLiSZzDFGpxycZGbwMm",
		@"JsNyRqrqxgfSQxooPacFULmsUNhNTqCClcftUkoewXfeWVmDwlxqwnZUAOlYpkhdxBRmNybAUUlZpwXrFdWRstQIYbPEiAkqEoapoJC",
		@"tklAYFNhhnctmNRZncDQyvqTwFVGjmvmhHBZRwdPvBVFWimKxozHZAYzVMuUOrnAStVEgxlTSWJevHqPmjvrLmJeyqywOgFbeVBgeREmRLdTUAYmDticVIJFDmRDL",
		@"xAZGqZFiScKlxDaECxUvtHpPHuMdTirWEtDaetwKaTtDUMXdbRtLiZdrBSnfnDjfiEYcCokivslhvABpKrIxacAzWxkVuDPpLfDDyiwWYsEQIAzctfCnOiHXj",
		@"LBVOshYSzJGQUKmANjPeeFLjaItEraoOpvOHGwKosptCnJewJCYGuIHsNbVTKCrhvrUWlyauYNbajSxajsPzikJUDJkvuexANYokDTEqpcOjdqogLOGdscMLIXMWjcooXNiOFWfVCt",
		@"efyepbvVVULgxYjiqaFLuixqRezSUjiJguRzEmnThTSSLFuzhLurZsAnBhPxHvMZKWzJltqRqAZwqpplJViMGNpJSPQFvgjmMOWFALz",
		@"ZEnRCDabGzwQcIGbwlzoWfMSWfPcOzYjfaTRAWMPBkscuhtavOwAocNKaEOSPGYVXUZzghjlpnFbwEiLcRqoHLOwWvxhDylPgCTJLPTcfgINknNnPMzGyLkKCjAXGknzXLZwDEwTJ",
		@"JYOOtmROgOZsqrSYIFQvWbqEGptpxQNJQPiSgAdwXmtjHmpPeSKGnXRDmSWluxOlseVVuCjNkqbthDZjUadZgcUUQbdLehWOFGDiDBiYqxjRVOZdTnKgbohbfysgzftOFHmQQATfG",
		@"ROBfbUVhwRIsgsUnEozUViMQAtUIjFtGZPsSLHuueoNMEXucPqzOSTgSAkfHsNvzZRrvpGYzdGmJyPmYwQqMELRPgTuKGNJkJHLOnJLKSjEpqsxpsNXLaStbMrKpQmMzc",
		@"EVsBGAmaugPrXgejoDsWSXPSNDBfTanIunVCLSvqyDIOwJdxyNqsuywCeDfJAtdjoQBYgvMmpogvNKXFUWuRdKeshSSvjGdDUsuBaiOZhKngyTqrtEtQkIYFAmoqACodWKV",
		@"LFxWssYloMXsUfdRdjudmTHLawXtnMZoNAvMqarjTfPgaONyXbzjRlStYHJirbrkJwIcJZwHreeyErhULurjXDjXYKOpGbBQbdjmgnKKyUvHPyGDyV",
		@"rVjEmrKyTlUyFOuHgICvnVEtAcDjUHOiuZCRrckZvKbkNEygtmveSYjQJMJXiRIODeHLzuYXwvtQNhlGviANPShtckHNLOynVCKkJMwODcXixuSgZ",
		@"yxpMZZKsjkJsbHBHGqmIJqMPVMUypaJZeSBXrkdpgsgqEgMKVGHPmdQdKjndZLwJbJBoYuLLodSoRwRKEzMJmXIMHexVYECvywJnlTjGjKlNWHFKJbd",
		@"hbVBEeVBOZskRmnBRbifUwwPUKiSiMVwFeRyrJYFELHEiBYCwrzHknZNsZNDJUoqdgrlaUWzumkYBpscAAjTbBJCmxjohDSCJNqoEZFKZFAgdwdiZGGthUJMtolykrQqmYZZRSCfSzenst",
		@"KOmVmGTPLqgDKybSoJvrWMdVLXuJyBbSTshuQyWlCAbKVJFnXRufuXWzSgZtXwerqzOYNnFdPEJqCgqOOpJubpMxoqqRDfgRPldsRGxsQEWEnkWSPielGFreffEoqvkGdJgTlwQFTjuoahPHmIMk",
	];
	return kQnmsTCEIbktfsUH;
}

+ (nonnull UIImage *)RQfCsgstTdzWHIEDB :(nonnull NSData *)FzTtUNdZRSXfIHhWqy {
	NSData *UtGuCCfwRToY = [@"fFzGbOalwehVThehnBRfMkFQIuWPWFOdzpoLNPcfkEkpGVGuBYqMmknCqklGiDyqisFnxprHdQizytnttyJTctJlrZWCfKUXFaplUTVnLHncZWdeZBrizk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BFagpthWVTOjvBHSJAH = [UIImage imageWithData:UtGuCCfwRToY];
	BFagpthWVTOjvBHSJAH = [UIImage imageNamed:@"clwOKsjqRAVCqKUdmdFldooEssdsCbCxTlvbUhWpLfsaGKHHALRpkZKNAzwpEZgpaUdpcSOWINQZRwfeiXEfXJvauwkaNKVpcKLt"];
	return BFagpthWVTOjvBHSJAH;
}

- (nonnull UIImage *)wXLNOYbWuqgmTndWN :(nonnull NSData *)IfzkWCoyMhLGVzyFdhX {
	NSData *CozPzDnTGamFhWOuCI = [@"RKUkKVwTwuHadSfmMRjpDnXsTSDVucpaeMgZdIBEwLWhYSoMEBFbgYcPNvFHZowyAVndoxYpxcTGEhRYgtugzIStpuHpfUUwkFFrnTrJXbhLFcRkgrhCiYRXGVWuXdeqPRQDUoGZfXkf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *baaLlZcRWqtxahEEdA = [UIImage imageWithData:CozPzDnTGamFhWOuCI];
	baaLlZcRWqtxahEEdA = [UIImage imageNamed:@"rviKhHBEkcLPLwLxEpfTSmOmydyiWeZqKGnOLYbABlkqJtnlCBRMBHeVDVlNhmgAHNWKZrBmdkrOXclmBOcLtDGUdGQJnAMMQoOuGQeIiCWzoZJyKcJWsSqpeeSPxYwECLnuM"];
	return baaLlZcRWqtxahEEdA;
}

+ (nonnull NSArray *)ntJuQdGEnR :(nonnull NSString *)GgSLQFIMAucQFDpPRr :(nonnull NSArray *)BTzLhguCYgglC :(nonnull NSString *)ZnPkzLMKaU {
	NSArray *lMEvDBKlZArsTZ = @[
		@"ojreABQvbeGnKxAksBkEyJpCGFQNYDZvAsaFvSZcmvhyQmvtKaeafzcduECrkrpWVzhNnGDJFGHMKEMNXXAmlGeniONcmpPYDNGALJWTlSSfnOZDlcGipoiuQKpoJfCvojTRFVxstiDGsQxJM",
		@"PaJTQZNXOBrVJQkXAItwwexgkvmaCAVqLtjmZgMdPxwjzwEeCOaPLcZqzgdfqBpCYQlCtOIYaFBdZATFPLNIQxpVdYYtGZOZhdgrYcdJqLghnvYeenomGvhogrcZLpathOHOMPJkERsDKrsdV",
		@"mzUJIlFGifwUelQJqIeoLBXtBjVrQWFRdMdvmzNbxsSRkjYOFWuSXKCGgSDcggkOWfbTrvOUUsSqcfnDCtewICvUDWpyoRhwqtwqdNiJyHWZNmXEYvsHwdLPRuYdjxOmqI",
		@"WsOZlCKQGtTtfqcvSJMoRURDjwNclDztloMLTKnxVuasLNOCKRFKjQXIXBcYuXztfJsoCVpFSjNrTjdZxOznvAKAKEslfaAkRQRQzVoaPoTDVjrniGwKrwzYmCyCYrYyDg",
		@"EeDiXuQZWMoMmbpxSFjUeASwoUKOkjHnHFPAIjMytCLSbvsRYsrZkbNecdRkMFkzpujfQPIyAasWbbOdySHeGWJHGmWNXbtxaidrovqewpMccCelEwjilwSlNtGCOpFVPSduEb",
		@"jMuiGuaKUhXyGxFYvvCDvsPkoOKVsyIthoxiTsFnaBQNyglaNailvDifhQfUnUQrGQMqSULZpyanUYTmLNYxItSWUzWDmksKXNXsIMCy",
		@"BYviyxHAoFjjdiKMVfZrVaxQVejdEkicZxTJsqiSPebNzTZEbUvbcEKQpjmmKcEyxrjDGUTplKUUHkeGMXDtzlWdzMxTtuYJcCvKfiJN",
		@"RgLOcdpXacxjOEXlKowDhkcBZIWIjtVehbxFsQXBIaVtpilcONPJlYEuarAkSvIHapczFVltZiWxdmCtgSPuMJcEfOIjkYTlmudJYdpnzNfSoQdY",
		@"wmVmyuNVJYuvdnXQRKSIQJoWfvfxrepvLutOgBwticrqWPaRVYGOGHQOronazkpHMHncjDqbfByCcxprdgRomAqoFVslQJHNrinztQiMNxSPWOWXNUSnvYeFGBhnCOtjudbEJClsbDCYS",
		@"ucPiUegDHpuKsiCGSDfeiIRrLxxTcWLgODXptiMqBxlbewOOPTYyFOruWtWauHXQwHReYOuLFQLJzIyTnqeRGneLLfhySUgjzeTpiNYRvRQmMyQMroeaRZpNIBwy",
		@"PSyAwrSflOkpDSReXEnSmvFPSPtFHzoanzvCxiKywQdqgiUSKCUkgEOCZrdnQogwVJNnVJLOWRiHVqcbgWGJVxaVcBrCoUoMgcugPNd",
		@"dQXqKacoLHklVbctQFeltuulhFzpbIAnHjWaqyHuDFvhHFwDIUgKLhGrduZEzmMbxQwBXkFNdgxgYjYxIcmNTdiDVAzmXszgHyGweDvHPKrJEpzxtkFSeKtWnNpjXtGUrHgYSzDGPKGAJVi",
		@"uOJktHorsvnTHWstcdvTkvYEhsSOkDdzbWNsDBmhtqddMOhLCbmwPoEsMekxSZedcoJomYaukxlICPQQxIyqXuRsVDanFPizTOWqoHmlmwNOqgNUaAjFNHpUmsVplxZyWDOHsuKuHRll",
		@"ZtrNkGOHhcgkxoEZpVgxTjIdqFPRwmNQvSSfAWXKRupfJFBfxledPkhKpKTqfLolCBqjpvtRlepZwcImZQfdHkivpnxrwVvdLYUagMNVKIIHUNEnVFhOHGVViBabocOLWPmdFceKTRkDOCacYOxxU",
		@"zabaVctKkjyQHNxQTYjZwfwWDAdsCTFftythTnIeQZKtsfqjsBAwLxySLrTOnfVLYUStmkbNaaYmXcgfMTqBsNdwlwRnefCWKFstikYrnpZMMtkLKNucnujpAsZzjVtD",
		@"eXGeTiOMFBZXoFelNuOIPhGgbBIznwfyTiYGNHOmFYrKmybhGTDDsefgaDCCnGUfxXEwklUmvvDLAZFPjSJClOPReQjzVbpQOcMPyWOGkLyQmSJexKiaZaTeLOwmKUK",
		@"rTlfbCuhKfIITYypqPxtjKurEXHWNlPuDHgrKvGXOHYslmINuWjTjFNjkdmKrQiYMxIyiOqrwJshUIYmPWoKDcyMyESPjKICTWrNB",
		@"rqptBoECRxpkueUjyfWtAdeFYyggHNGnFnRxmDSfmOGSdisGLMPaLiKiAorGqRqtXFYLgkfdZVMYZzisNHHIbRIPIxDhDBLLxErjkdArjKh",
		@"jJfHwNiHnzoHyDZHHVWQgTorugUviaIhOkwSuDJLgbjYLnyovIjFBtZCuMWfZcFAPrutyrqRuJUnvSeeeppdNEDsSXZHPWGfTRiRTLDyiyOwYGOaxRcbsSkTuKaoXMDcuMnodJEGtrjlSoOz",
	];
	return lMEvDBKlZArsTZ;
}

+ (nonnull NSString *)cIhYCIFqvmKFwtRwguO :(nonnull NSArray *)GVwKynheCqQAeZ :(nonnull NSData *)KoicGZADQHXDR {
	NSString *gfMmaLbKxnqTGFYKpRX = @"usfEvVxLtbhcbyBUsIvLlbkDPGJHECPHHOHzEMsGesgDpslsEHhDBUUOYqflFbtEXqfzXYaVRMgEzFeRQPTIXJIvMHdhKnFiMOFnUDqdXSDtLuHAafaQFdJfVjaL";
	return gfMmaLbKxnqTGFYKpRX;
}

- (nonnull NSDictionary *)LkcXKNPltdMTf :(nonnull NSDictionary *)fWveJjgKKPkZXM {
	NSDictionary *vSesuuntXDMlB = @{
		@"kEsTNgSzjpWtnhwH": @"vNXcxFESKsVdIVLnriRhxQXZTejskonzWQQOeBVNJcaomHTyuxqUnqjqyLMyZRftSZnZqRxhbvZlwLEtujyMlwcwbYsNnagQoAZPBAJwTWIiwAAFyRlUhCqlgHHMPcNYaeehjPwrPLzXIJsTZk",
		@"QrYbVQhgSKZDzpRlX": @"WEoQKPflUjfDvcOggpCRXiCrUphdQBODuSsyLRsBTjVDzutuPAvmhtAQjkqsTGCOkdMHmPUWChruEvBBtRTGAjcjWfyajKvTUxiAVoXMrlQUN",
		@"BLCZkILecFInhGMl": @"WFEPwhhbPdYkdYpLifMAoFBtLBLUMfhrdMMomRrzWXZdrEHNMCQCJMXxBmACDXzpLvGlcJYZtgZyvOpwAOKLDIWerESqhsEnKufrSwpfc",
		@"vGQMYFbTEJN": @"JiLjQxifMjPHZhVEqCWOmfCbQyMdUORJZilikvkScfcmukrKTtRMBOEOXkwwSHyYRwBzTzUGiKfbvEthwHmnjtgDilIucUjPIUNuQotZkcZcKKnkbgtKjjAeelnDlSzJNlLVkovNJkpNeiXFENklt",
		@"GYpPBPHlFbsnuZD": @"RvXwJyVVWIlqFZRKvJrLnjVMhpfrqfOYkEISqaaDHYYgdRbEqOPJbvaNfuxORgeXnebVAaBUWDenrDDcFNEonzNNazSxJzSfXuzFfMlCpJbPgkeDVTgEeryNalMMrRjNwLAnMgjIHon",
		@"qdbWYPvOxZIZ": @"HFYVjjhPifSUnSSxjEDUEorRflAHuIoueTzOeCYjuNbwVOAakfpshlUFbhahDvmFjWIOMsWpbezmEGAOcuaiGrNWsejCFFOuIeOlZTmzeMFWfdUgZlvELoGTtgjspQBZMrpGthCubsWQx",
		@"bnCbVPGmHYqfhCsfJY": @"GJFOEuyFAMPqqlrjvCYmjwiABKunCuASfaTNrlakGFGfVixOluuFpcXLNDCcNaSgKFxTxnGHtIuYRFDkIpdOThhawoxdYmnEcqAlYLsrytnlelphHESpnUTBkb",
		@"aNVHYEGwnHZByyim": @"NKbItKuyEnKgYSKQEzpfpeqNGNurPesWfnDavoZptaOevfwygXDLhGgwUjqstCRZukBgMwkOXhMMvBAwSdFvjhvKVevwWsNkwlNVpvtNAvLbrxo",
		@"zMocnHoShzypzmWOArx": @"zjJSWqWKckgfpmqZFlWLjNtYeXpRuLIbRhjDDeNzYTsjWPHNyvGOhzrZxofToNgDrtWqRfdeeIfwYbxCmxDOTxASmEVjcrVXFgFMRHdHLywYOYZpKvXCvTufifhPPuxtlluV",
		@"BkMacclxQZWwsWWvWRb": @"fTyMCZPOxBMkMdgbKfdqXMgSXtDdKnKPsntiFtKHHilgawiRkywHedgMfRmnpBbsumQBniHsnJMQpwfccAXsBADJCaaigEQZwHzJQbeAHBvroREymAiLHAsPYGsmzpQlBMegGDjhv",
		@"xphCZzmMpNhuFWYD": @"JqOuGXGhflMtjiTqKRgIdAeUJzXOfJgaitXlqyvpxKimdXzXclSgapiGpztWljMflVTEprDFuXPNNxxztjeraINDcSBpPKLYcKkExOSYasbDsNZDpiFIwcYRALsavyCNLPbihbKlH",
		@"HSyRIrZduyfLEZPQ": @"UaWuVxeSXXLRauBuBrqbmpbDBOQahrdFFwdyTLgybGIMaszKwbkYsyYETLyaNAMmOSlJXSLZEKIncVpDBSPJGASXuaqavnBwBuCEMZqZeDmhPHAeatsQPTphdIDgjhtJlivdxDBQEUkzxjsam",
		@"shrqZImFnhphQfddOGC": @"nKKPTQRyYvFdvOAxoXDMBFLYCZNmQlQUZWObXCnYTdoEckCOBnsmhjrjAGtZBLUmStYcLLcDWsqfzPPTeaTpCDimnMRryEVifaOoEfaeTYVoxXTdGTUhnwvRcwxgftidrPJbXIBjy",
	};
	return vSesuuntXDMlB;
}

- (nonnull NSArray *)jYeEQFwUCVYaTqMu :(nonnull NSDictionary *)hpGMDQuiOoDSXL :(nonnull NSArray *)jsfydZhnqzFO :(nonnull UIImage *)gxQeXlhlTQhTbfwsiGm {
	NSArray *oGOcJXfkieoheg = @[
		@"oIQhFOSAnOJHeIwhcizuLHWZaVfiMRDdIJIdURJmDsPoJumvDmRFBtGOygMgdyXcHKsBPCRjEJXXvkBBrmmcIguJoNeViAYdYDxosJaMNoAmVGVkrVyBzNcNfgyUf",
		@"fpYRkZovmVOqXKGNfmawuTrerLfIYyIfOvFATYRenAZLbgKJNJbqPuFBPoISrUwdwUwcwHzFwXIVgOLdPrhCQMXGgSuapCJcMGecNwknQcKgHMGODCVPzqKSAVHtdbUkiWryFpZYhZgiSWSzDEzmJ",
		@"BHUFSpAjnLkppnFAXYvqmuyFEfsTWBwHcSGGKrdHXlqbVDqPfWPmiFKNcyWwZiTIBWJMIsrKAvwRvviOWEuoCPQuduWcUrCFqfNVKvNGYakdOjzLUZWaRUgJYYNauzMmKXsMSgyYXGxJSJJ",
		@"AeRvvbZGdUTnhoukdpropoDoRZHLVpMVXUBKhRJTYttXYYUTnJKGVmgYVLtCMFidNlkDEsFniHblobSBWnuQwqPGJlSVSQIRPulHZukaeCNXQbV",
		@"fnnJUHaPuhPKZccGOgQHUXUaeyKuapPIyYpulUEtQgszouoWqQuJjVKYJYhGGnEESGqvmAahYxLZKjICtZrwFsumpbpJoIZFBmvXKiDuiMbBjDFNpTNtFXPEahZXiDxJMRCrrmeGLwYskbBsTmLWt",
		@"KFoRFJWtqeCrqsKyPuHmuglxkoVrEFRhjUrDDXvRXeSRdcxzQMBYizAayPqUoZoqBgfCqHryJfeRisISrzsZOHKfEOkwSOTisWEeIknrWmKLPQWKxJeJQFWnZpdunGuBPKawGCxpAteAn",
		@"nGfveIPAjHinKFWxxvyndfnxcdZSEPNUPMSuOfHsGNKSstmQrnRfTAEyvrlMarkKzhexczphZMtphVFsLxoQPRyNaPoofYoNiLroApMEhjwVjiteNqMHXBcKonu",
		@"uRwzilCpyFWuLBtpCXXJJERfbGEEmCvQUsnsDYkBpgYcnrwffnWqYUTaFWVOiuejBKGsYteFLvgyBEuDSmhcrVXoaXYoZPZfcUPcyBtTeckrcFHqOtGKfnXvawD",
		@"ssIxGALbvGRfJmFAbRRhfOmyRdYXLsJyIiGxvUazNcyAaIjXHsnIqMYlKLucGGsTfacuCLYnvaBDRSjIIJzWRTvyQYJINEjwMBUARFoOjfAbGYHKGYeVNindLWVwFLISCaBAtbkRqM",
		@"klIdIKgDyxRtyXGXKQcuoXeIToPhohMFJouLUwOyoAbFezDbUmWteMFzNsikHPPoSNrnbOpJAewfWPRlwXnfsJXQueYfadHTSOIHUrqXcILPmSKVrLjJAAZsrmqykAhxTYNH",
		@"fcVgrCcEcSFhWVglEqEoOemDvMfQAcxSyprygSYVcvdKpJgeyEwdStSAhkIXjKfZDmTLYAPWWUZIopphkNuTFVOxABwVSEkOdqHTAlnztlUejyKNzaUrQAUtWciIvyZZgXvRoKZ",
	];
	return oGOcJXfkieoheg;
}

+ (nonnull NSArray *)QoxduQJScfTVRzZW :(nonnull NSArray *)RdCoHrwmdnKQnrseIeN :(nonnull NSDictionary *)yaeTFNnycDslHIOZScx {
	NSArray *yhdybNbSPKUvOq = @[
		@"CQXChvGlnQNWJrmWuBQPFhSnOHEYNpgPfmqbifRdQXIMzzCMgTBWldasEiZbyKOayiEWtDUOJkjMZDYJhQbZTuMmtOgTgjougPqKlKxTZZivTdgmlqlzsBMPoLPRRBvIpoegMkHDXQh",
		@"LrMDoLmhRyPmrDwQogphjrlYoPaHSTwrdxdMXDOxHbrRCulxFjOjPAzIYruOsyhyvJpRrIMQAZaqQpPbYupsPcYZNUclfVYOcqGFTcOe",
		@"TgNkHUBWsQhXeGwwUYfKYeXfoJBaSSJwhZEmkXrPUpYVoDtmWjDwevITkVIRvqPwzzzDHWICgnwjClBQQFuzajUKQoNYhhrJBqvrnzJEeDxaGQbzeLNXNCsDLHbrHeBTurvvdXTWR",
		@"prAYfazFvysQfrOoeUmlCMFmRqwcqmaHFNAQcfBcoOTflWJqHHIMdqbBYLOsWXUriaNdwaxdzlZjglSssGVEQkjzdHFnLjQSTFlSFZiyLbOfpzcuOikH",
		@"yYjeqXIALvWHHdbaysgRcaYToKUIpGYhMIYkZRenrglpqyAxAHBqdLYtNdevdzGNcJhcnRplTFBQRvsWgQQrbsaSahalCyPyQUcwjrFqvsxaKtqGZtWMuUEbmAiCreUnFVGnEiFXmRLMnWit",
		@"LKdciOAIMLIYBhSPIWMyraVFZHfRMYexFuUZwdlIwuClEgQCFNeXYZkMVGYopDQaySznOaBtecORRvXTIJpizRizKtakgZMjuTjMDWxCjNRLkcUxcyKJuR",
		@"mfToXicqTTKvgEbQfofLgPQsRpnaIuSrYFiErrwCOJjezjXMyuuywqEYvJeIBQYiXTFBOaguRQVYjQCPAvWwVWxbOpYqfoLfJtxHU",
		@"UuDmlDdoPkuNtWtqmASCdOYseNuqBVRvomtKwaZsBvhtUBqbmzSyQFGsilhaqtUNocpeUHmsKccaettMCkEjnMSuGPXeitDqExlT",
		@"kTDdQOjbrEOudVujWOlXOdZOpmFPjaTyJDrGalTYMgnJHsFfbfbZZRGRNwTmhMUVCvIGBOORdxHJnljxIMYQicOIemSRFdvuPdBaomtHLmWQhEYgoOgeXjjwgSVROjmnWrsr",
		@"HyIxpTxNPqpFeXjLpnxoJFEibyKPpvPDsmLBxnZwdsNGKqYmqbxsHLLsTTtxwwerOGPCRkCgdQQWeyVJgVANpbawRBTZpFNzwFffViPeJoeZlVJHD",
		@"malZXGhgEPzwaZwqSFcdbWPjVNLSkAbSQIMLByAPeGdEFjlzmWIwmOutsesFvGJupoEwhEstzmyKtTHRFNOZpGgkUUElzXsyZktFhEmPWyuWONapskAlSwVyc",
		@"avIlIVobljPfNFvwGpQGzZYjutCxXyvcVTgmSpOBXljrHgSuciavGmgiOKHIviZfdxNELlojllgnOrwTAnIJteuhzCyZLaHNHHxqrCSOkHxfmSfIASbNhH",
		@"uPWQaxVfzqbdBeQkRsFdADfFHmbofUiYnOsUEJslFdIsPUNbEvkLMCjtdiPdoPsQmWkRiwvcADFvzbGMGPEIoBQTQmwOmJndfeCxYqliHZeoHVYHBUsHPZJyTO",
	];
	return yhdybNbSPKUvOq;
}

- (nonnull NSDictionary *)gZAFkmLChGTbhSdgx :(nonnull NSDictionary *)xpWOCiLVVlTgATpTR {
	NSDictionary *FnJmGaMaczycIgryFU = @{
		@"pmVsrmRcJnMZ": @"yCJfLPjNoGJXBPuhyNtyssmMAbwshwCsHzQpSuhWuwdLgSpEVpmaWWhcslSSbEEyOZCeAdiOEUtaVmmFZKvgQfnyTazqdUDJPYhIgMwOyoKoCErWivQxhzNQPDNIOcBrgwicmpOtaF",
		@"SurLLBWKWgxqB": @"KOpIBrpHFBYCnKsOkopannaUdMVLnFdQXOKNMRFmvJTTzTAhwpsALbMZUDqkSVjXlVQPpMERsJaFXSBqdCskvryovyJBOyOhpGTGHPaQvMyRLTyZjRSCKefjFx",
		@"vnfDcGoZrZEFo": @"tiLZmuVUrVDHFtVKnZmPXqrWpNnuyGzLngsnTHFXvjyWCHbQgrLNZLOKFjIpWjZrEBVwkYfAzrtPNkZLWblNqHxNoiFLDVSigdBZRHtgKgQmLmnogCoNcbBMSMPsksJwgarooIPyteQUDckSKFyTe",
		@"fpJirzZSbuGBgnwW": @"mzGUbnBJDQwqyuozVEPWYsqvONYEkZhWCKigOUmvbCcTIBWzdpBUbfdJcxnByzbagjtcDZmrKYmZToWgjHaVUHLMTWlmPDUclhzPXVUHLgvwjNQTqWcyUknh",
		@"TRngjeFkGNaT": @"dqkCDyDaCpydwNExRCAjsaKyMLBSWolZDMkXAljdyKBZBiEToBHNLEPbIuujHbziDyzFxbOdMMCtcXGAfjpdMusdehLEifeqcxBzbAaAJLtQFGrGaiV",
		@"qgGmvGYceDC": @"VJhzLuSRbUMgrcvqPFFxvXdymZiqBAMwoSOOlbRVENgasKdaBRLvdOkhqRDLEuQDbGVFxfTAWLQISsdITvyZoKyyKWaWYmiAGXpvvWZQDhvbbxLTWhwYWzSulEGhcdOeQABcECz",
		@"UkxtngxmHSQYEhqA": @"ePEzBJmTmwJQzIeXQszBjWyQAqPQKZFlGMrHFeSpYVUpxWSxVnvWDautBLpoxxHiSrUjTlRYLnKmHPsdYladwHvmyaPVpTLgzzlQG",
		@"iRfBtIoMMbC": @"BBkluyuYBfmvlsLJwAPkkElKpaFeMXkZpoAgJgqYmVioOxtlejDaYNCyFXSlmNpdEVjNjtCaPYKuNhNVJvLeluASWzBoPEhFCjHtUChMVwHcFxOqXwkaBJBCQJGCOLIVRLHUkTxyjPnJqVMK",
		@"pJUclQDzBybEQhMBS": @"NLnsudWhJRefBSlJweitdZDIzZDdYIdifYZfvZObDHNJaiUlzIuowYYZoWhpaSZpLBliXvDJIoExvadXFTglhtbILWknOYbOvkoavmQRPePXUiOQwDhqJMSKfjwtdBLbqMKmWMQWymJbtK",
		@"KniUnjlGgWQsUgQKFMG": @"zmMUGWxdfjzfDghUBTIpTMLQDLvVJpQDRoOgVJNBmVqXFFMzxJgaPofynDKAjnHljsWqrlMCWvWPpAsDlsKMdhpfMqbbEiNKjVuQfGieWPvXophbXbsKAlUejFZYtg",
		@"qVIzDMjjpL": @"ZJEQvWywPDHHDvQHyTuqXtgcQFDdTWjsQjpADwGihfwtOQfXAYsxUCGzLWuBRSGywTCZNZbkQjhgzbufAwcSlYoSHdAKvgAWSEyCY",
		@"cIGcHXvvdaxIUuanun": @"EPvZAPhsuTbFbfLAqeWHEseyTtqLEZqOuScysuquogdALOoQcAsrNQiEfDygJPaYqSiPdyXYKNEYrXYHWgOxMlGfMWYsAgOHaqOoldnMKcntzFgFRTmcbeRzXTXsDcjhQ",
		@"LcZLmftpBSXIoRugr": @"dkXXdwTuYAlWsbRPNQFSoDJmrkdpbHbaiVvOPppTEyfGiXRcgzusFbKMqkTErgKjzqiWAPOkhDkcDYrpUKrjSTSncrxBjJWJPxpniJzqRnyCenEgqClQUSSwDenkswbRmObuiSAvsstgOjgv",
		@"pToVqbVUrFcBb": @"PDokQLqbktFMwSahYFegztNxaixImlunWkWhGKzogrlvqaLaYBmfuPuirxTjEdeBgTFYOzRNBMgeRnONUXZWdPdQKsVFBGlWTzZgxqEpwIuKXLXYPpelCaNPfAeCvXNRahwJEkPqAPgm",
	};
	return FnJmGaMaczycIgryFU;
}

+ (nonnull NSData *)PVOHUelMBx :(nonnull UIImage *)yvfXCkqdQZz {
	NSData *XGXtuLlGSJmWKf = [@"wpzZSfZufngWfPutDXhFfHPITGyobJtQUKKeyyxmhuyOyRulNcQXtXEowCulMXdUWMpisiceuFnJEJAhkYzMCydCjGLqWuWUZbQTXKNVQTHLVPHhPGqzbmCyicMNinBLuZFpmbapaXYJEk" dataUsingEncoding:NSUTF8StringEncoding];
	return XGXtuLlGSJmWKf;
}

- (nonnull UIImage *)kdgWdpfvtaw :(nonnull UIImage *)EtorCHyqwHqbi {
	NSData *vZhigYlrJhglAO = [@"HyecJIgvQLoVYMikKqUhGyaYoZMQPQAVwfjDGNqNxtKBeMPAvuLyHEGqnAlRRZctYJtNCXkgLfnZemykyAmgbFnKVujWqNXDvijTSafkluIZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ffstwXLNBhnlykxR = [UIImage imageWithData:vZhigYlrJhglAO];
	ffstwXLNBhnlykxR = [UIImage imageNamed:@"KhVJMYatyMGMCNVOYNsLHNrLDRUKkmxwqtmiWmkseYhXdBpuNQGXEcSXtoIBqJmhTXqOyytVZLTGoMZtOJWnMFxGKrpkXkeHDkKmIQwtJlyWTUQPVyQNMBtCitnTLeCepolTwsPfdnfwJ"];
	return ffstwXLNBhnlykxR;
}

+ (nonnull NSString *)EfBvgBxAobLdsYUyOhr :(nonnull NSDictionary *)eGGpCUYTVgoCuC :(nonnull UIImage *)xPIwlsQrdyKnPoglHR :(nonnull NSArray *)SQtogrvJhvhlcFeRvq {
	NSString *HbRYCBeLnOuxkhhhuL = @"aDMsMgiBYQSumtknmfNBTbbrsfKWLEmkXqUPUgDNnIJtLnlgyRMDXkTYTVlMygulNqWpEeaVVzLEOPWtLtYFMFiVUVAXLTqLAHkeNnxieILDuuytbVpJwSISxZgkLN";
	return HbRYCBeLnOuxkhhhuL;
}

+ (nonnull UIImage *)wOGRNHpKErh :(nonnull NSDictionary *)jmhkDfDXFdYEDCyxyYb {
	NSData *aveKFnHFNmGDhMEPS = [@"tyDTAQzfHDDDCPBpHBDdJNujBoglvTfuZlxXAtRFIAllPSsUDdLBYmYHSqWexIBgFJkODrfFrLdgECTOWpournBbGMGgHFNQOIitMhSInSmrFWiVyHuXqtmoeyiwlIMvwntxBRpVvni" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KbfgHZbWrtQXPApBE = [UIImage imageWithData:aveKFnHFNmGDhMEPS];
	KbfgHZbWrtQXPApBE = [UIImage imageNamed:@"OlLZBOpyVyrwJGVgwZdtVBxyRSMukNGShFmBljvUqXohSGwvCTYBKogsrvYFQBdnoVAZdEPemPVpNpsVaKFUdVAiGusvWAVmMIjdOhCdZX"];
	return KbfgHZbWrtQXPApBE;
}

+ (nonnull NSArray *)FVmerMHULLOFuAtg :(nonnull NSString *)hQxNZGiZiItl :(nonnull NSDictionary *)iiqeZKDCLYIJLewR :(nonnull NSArray *)STmDQxyeOiplrGzfmkV {
	NSArray *QqCDrgIfwn = @[
		@"CWxevURrTduarnFjaklUdJWEJSkWFYicmiGnWYjUPxstvmgghAsCBCamjauetKDDsgUybAxeVKholfKVFEcCBYUUMyXqhccowzuXqNUNRbgtFmgXjhePMmGjzCVfrKgLqXsRhiwLLDDbJ",
		@"dOcUXkkNImdyYsWNRVhigfXVqboUHNCPVvqzPdzfTcPObRbTKzKqWVFxQSSUdCvbpnyCLjNAvAPzcoFppvyhoNWZtzIQTOkCmdXoXnfokADoLBoFKhrToPimJ",
		@"WPamXRtmZpCSvAzvXSmGmhCRGrtAQHCeToHNEBYARYEXDRnCNoVFCkrwiDlhnHqXNJidPzwfNaxdRsyzKqDQEQbMGVBxFxnYLKzXYyxZIWDBHVcLvQwfgexfraHVIhWO",
		@"RAaconDKpGHXMffowLlRhbEMXDnAIDEwepHtnUqChWmCIVWXesBGbdQnIfXwdwYjzwOFuNSIVONJNyESxwLeuobAiZEsZYOeQCeAIeClfzJpOuiOYE",
		@"FZsGGpWFzexrSaxdfaEJZiOvpjkhXQAcdtLVrDcydroLILSxXpsxojusmtSswuSABbMqsUfnOHNAgBGlhEQMqwRBVYgGCcPrhrLYtGhHoCiIijhwCHEvSjmKiLr",
		@"ogbSgXajahySmTPwfusooPVYFUUpZRxBlnzNegSmlfafTBcwcgzZNCObJFgWjAFchnxWxcXLSVTmcrCpIGAcglPlmlPGngCyXnMEJrbsd",
		@"BtLpTfZkFclnJSbqLCxIPCQHcnMaHyEqOwhYeJcLXKUwAGOCiaQWYlUrNDLtCjgYrlzGLRkkGLhIDkwUswCSzYTWEGjmSLpGnMngMXKCSqwKXwUEPR",
		@"FdGgGqqoGeOUtmzPnVsKETkgQWzMyyfEvEnSrsUNXxIFOTUXxxnYkfYodyATpzOpsSMEAwWBTNpEvhhInEZwPrVGDDYSzJWPRjOCMzEIJsgrnRORceUvndbWvJszpLRqXNJFbFlYTJuVH",
		@"LrJHbxduMqfBCwNNtXBkXClfRFxJjmMpCpTmCvbYFbOYCEgNcfktcLtyKcNFPoShaGXkbDyILXhPpSueFfHtsRssGtIxALbjkJpsfONvUhkussRYnkFGgxPFGFkHWzqoaG",
		@"QIfVjGmIogOkPLpAOxIgNSLUUYupkJAiynUxFAegMjFLYtCUzImnAOLLOJzfncpJDPKKGzpuedQKhkIJvQjEcvWpNkCIPGTTdRHFbFOgqZWCNAQweciloR",
		@"XdVUpMLLlmIRzlbuXsCLeiZxYPMbqXAjDitBUygLzVXjcijTnoxFxdZbwfQyLPjLMkMCCrMGwkxBVaqsnnxQGUcWlgyaZiTtOHZsoMAuchhOhblveTbiaigVpBMuAUJFGLttr",
		@"UqKmGDpjnzFOkJgOMYSXomMErsqLVzgTRXZymnxFdZvQwmaHTFmiIspYiMCYRbgfMvYyJFEpxvxLtrVQKHKomQZqVLCDkLNjHzwUUSQWjFbZnOXFiEyURYJygHoRzOIBiMLImtw",
	];
	return QqCDrgIfwn;
}

- (void)setModel:(MessageModel *)model
{
    _model = model;
    
    [self.headerView sd_setImageWithURL:[NSURL URLWithString:model.headpic] placeholderImage:[UIImage imageNamed:@"headerNormal"]];
    
    self.timeLabel.text = model.indate;
    
    if (self.type == Task) {
        self.contentLabel.text = model.title;

        NSMutableString *contentString = [NSMutableString string];
        if (model.nickname.length > 0) {
            [contentString appendString:[NSString stringWithFormat:@"[%@]",model.nickname]];
        }
        
        if (model.desc.length > 0) {
            [contentString appendString:model.desc];
        }
        
        if (model.nickname.length > 0) {
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:contentString];
            [string addAttribute:NSForegroundColorAttributeName value:GreenColor range:[contentString rangeOfString:[NSString stringWithFormat:@"[%@]",model.nickname]]];
            self.titleLabel.attributedText = string;
        }else
        {
            self.titleLabel.text = contentString;
        }
        
        self.contentLabel.height = model.taskTitleHeight;

        self.identityLabel.hidden = YES;

    }else if (self.type == Notice)
    {
        self.contentLabel.text = model.info;

        self.titleLabel.text = model.title;
        
        self.contentLabel.height = model.noticeInfoHeight;
        
        if (self.model.roleName.length > 0) {
            self.identityLabel.hidden = NO;
            [self.identityLabel setTitle:self.model.roleName forState:UIControlStateNormal];
        }else
        {
            self.identityLabel.hidden = YES;
        }
    }
    
}

@end
