//
//  MyMessageController.m
//  MoveSchool
//
//  Created by edz on 2017/7/26.
//
//

#import "MyMessageController.h"
#import "UIView+WZLBadge.h"
#import "AFNetWW.h"
#import "NewMessageModel.h"
#import "MJExtension.h"
#import "MessageTaskController.h"
#import "MessageNoticeController.h"
#import "MessageInteractionController.h"
#import "ExamineController.h"
#import "UIImage+TBCityIconFont.h"
#import "TBCityIconFont.h"
#import "MenusSubModel.h"

@interface MyMessageController ()<MessageTaskControllerDelegate, MessageNoticeControllerDelegate, MessageInteractionControllerDelegate>

@property (nonatomic, strong) UIView *redPotin;

@property (nonatomic, strong) UIView *examineView;

@property (nonatomic, strong) MessageTaskController *task;

@property (nonatomic, strong) MessageNoticeController *notice;

@property (nonatomic, strong) MessageInteractionController *interaction;

@end

@implementation MyMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"消息中心";
    
    [self setUpUI];
    
    //设置buttonBarView属性 选中文字变大 文字颜色
    [self setButtonBarView];
    
    BOOL hasRole = NO;
    for (MenusSubModel *model in self.subs) {
        if (model.ID == MessageExamine) {
            if (self.examineView != nil) {
                hasRole = YES;
            }
        }
    }
    
    self.examineView.hidden = !hasRole;
    [self setHeightAndY:hasRole];
}

- (void) setData
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMsgRecordCount,[UserInfoTool getUserInfo].token];
    NSDictionary *Parameters=@{
                               };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:Parameters success:^(id responseDic) {
        
        NSNumber *code = responseDic[@"rescode"];
        if ([code intValue] == 10000) {
             NSArray *messages = [NewMessageModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
            if (messages.count > 0) {
                for (NewMessageModel *model in messages) {
                    if (model.msgrecordtype == 2 && model.count > 0) { //审核
                        self.redPotin.hidden = NO;
                    }else
                    {
                        if (model.count > 0) {
                            //设置红点
                            [self setPoint : model.msgtype];
                        }
                    }
                }
            }
        }
        
        
    } fail:^(NSError *error) {
        [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
    }];
}

#pragma mark 设置高度和Y
- (void) setHeightAndY : (BOOL) hasRole
{
    self.buttonBarView.y = hasRole ? 65 : 0;
    
    [self.task setTableViewHeight:hasRole];
    
    [self.notice setTableViewHeight:hasRole];
    
    [self.interaction setTableViewHeight:hasRole];
    
}

#pragma mark 设置红点
- (void) setPoint : (int) msgType

{
    for (XLButtonBarViewCell *cell in self.buttonBarCellArray) {
        if (([cell.label.text isEqualToString:@"任务"] && msgType == 1) || ([cell.label.text isEqualToString:@"通知"] && msgType == 2) || ([cell.label.text isEqualToString:@"互动"] && msgType == 3)) {
            cell.label.badgeBgColor = [UIColor redColor];
            cell.label.badgeCenterOffset = CGPointMake(0, 0);
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setData];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

- (nonnull NSString *)mZIRCuSYjpa :(nonnull NSDictionary *)SyeKbeQrIBhnwrfjAf :(nonnull NSDictionary *)kmAnHKifrIndxbmXFN {
	NSString *FEUpvyTNIZbKfAj = @"oPknXaUDVEaXCSMzwvnxkXaCTprMxbtsfVAAZcbHRtcsVgWhZxVziveWFefMBfCqqcHMCdmCGHHaBFrhFnHNXRMYOSYticrcdXRJsNcpDRhcFmso";
	return FEUpvyTNIZbKfAj;
}

+ (nonnull NSString *)IvIOMsJHvWz :(nonnull NSString *)RsLkbEIimRbQjM {
	NSString *tmaTGDCWwOLRnMLS = @"TruNcDUBGGnhcPVUnTrSniAvfEzTmJaNIYSLRuvxsXnOQElDmFXBRJAjxalnubUmCMfwvqIOHMBjsKbhwJfgRSVJOBtPAXodoIBnCTOXaaBQBShjXqzzchWcMbWkUON";
	return tmaTGDCWwOLRnMLS;
}

- (nonnull NSString *)dWSjNOPTmjRduGccO :(nonnull NSArray *)sTkeWJcuPB :(nonnull UIImage *)FhuhNbCYuGJxYEPxp :(nonnull NSArray *)qyWQleuWLAgCYRfNCy {
	NSString *AqpJFPuQkeLwOTA = @"rdLKfjtrVDhWvqJNKrHTLautcDrtgASEZoqIqtbtJUUjDNmgeUMqMKcsaTKEWaGmfFzrxreiNMwVEbATnZOWXbZEqDSTWkBQxAzueqJotQUeKxPIqJdWZBuzh";
	return AqpJFPuQkeLwOTA;
}

+ (nonnull NSString *)lxwMfRFRSYRSbG :(nonnull NSString *)QfblAtgFbpsLfAkX :(nonnull UIImage *)AQPeNcLrfl {
	NSString *XNevkutqZwl = @"KwJahBIwNudeYGbRfPJeOMLCDIXyBOIAwDrBcQIEKPSApkIFgtFkIQYixyHFBZIwbQsQTHqxkBAMYpfSUPSXJyqTfDGJZqoDgvaYjvxRABkCiNOaURMPeGnAWYzZVvQTOcgBYdYIZANu";
	return XNevkutqZwl;
}

- (nonnull NSString *)HaQEaKwtlOIFnXZ :(nonnull UIImage *)FoByelBPrmHFFgNzdpA :(nonnull NSString *)aFCMdmlDtHjvA :(nonnull NSDictionary *)DXmxNtUrIfmfACqoJ {
	NSString *HumdmswQUxsTgob = @"izfidPycZtIdNYnIvthJHBrUyKJDTSlsdFvnuFEDtkZyuaOdWaYvBXzWMmCkmOtxrgYSWooqwvGVfblSYLztUoZwhIRgJWbhPDuPDHtljaBfXwTfbpJozHyWEgbYyMIAhZRduseqeq";
	return HumdmswQUxsTgob;
}

+ (nonnull NSData *)snCjdpZZdmEspcqJx :(nonnull NSArray *)rCrJKmbgpRuy :(nonnull NSData *)oPjMINtzCj :(nonnull NSArray *)DPmvjWuSHnU {
	NSData *uxABaZHDnDZ = [@"TybVxvoLTfXoqHxzspjrkvNECtUzLZIWMZmGiJoyVMTTlYXBZnnpMCzFDqtYomZkXvXEDjwupQEhhHuFhdTfOIJnyWaVLDeMMabqHNlfygnYKdlMSRNICYmDcChmuxIRHhnkeSt" dataUsingEncoding:NSUTF8StringEncoding];
	return uxABaZHDnDZ;
}

+ (nonnull UIImage *)prwidhTTNkKTKxPtRsb :(nonnull NSString *)UNLHxbofiNuerDlMOh {
	NSData *zkUMcjMjUvTqKL = [@"vrWGNABeprhgiWTBdVAqoeYFYXkGeZdNVjPmUWnEfuABdQvorpbLbundYvUGSSEWKRIdSIjjIKJdjLlzuQhbMwHMeHoiJmOvMTqYXWVAuBkbBcdugiYklCkTnDJSccIKSBJTLBoJPIuDLuTWeXM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QEZPoqOtRpcsfDvdaPz = [UIImage imageWithData:zkUMcjMjUvTqKL];
	QEZPoqOtRpcsfDvdaPz = [UIImage imageNamed:@"RrOHDDkeMDmkfUdwxSIZkuYedSWfwfurhEpLiptrZnflEMkoZFJDphVknpyGmObPUtUwETXmXvUqIOnPhocZGQftcoxSiczVxmccmZmKQGhNnGIVWiIDaXFslhgBXEN"];
	return QEZPoqOtRpcsfDvdaPz;
}

- (nonnull NSDictionary *)XZawRKnacHkTAoHYKg :(nonnull NSString *)DvuroXSuooeF :(nonnull NSArray *)HrpvyGEuWavzXzkC {
	NSDictionary *okvOUVOOnjhec = @{
		@"tEJQmbyAxl": @"XAudBEFQMZwxWLBPATRjrrhEPTJhqWdKNxcraTOiAYWoVDswisNhjuIuNbBbYSVcolTnaDrUERPYcDvgZTCnjAdbeIwyfznKtxMhqxsfeWCSOZgCBCWCwFculelrYcenILMk",
		@"MGqSIzOjkYkCyRdJgio": @"csRjnGNaYFqTvGTmnBceEcaUcteVICQgCjERVZSRHBqIsIyDUJiMyGawYcbCuIlnQlUYXWohnqcepbtkJKiuotVeJtXZriMhtNxOcVRoZXySjMlrecYFhfQowutcLbzL",
		@"cFdATMzzxcmdPDRbuaK": @"dcxViNNIDYpHsuieWNqFcMnZIcTlWifVmBGXjRUaPDyCRTfBuZitVJLlyzGkrLXvIKcFurNlucELgsmVxStQNwckvXbRBgdVHLcmDFXSlojMTpsqYvZKDOQCflLuzjZcWfEGgY",
		@"yraodvsJilVPBHNDg": @"mBjLRSwZCPScDGEUzxfpKjZitxbfYwfgAchSknbvCvBTyxWEQqpnSxqOCdvGeBcyIERSBsHxblbtKGFNFMhCTdxXfCBefsHwFfYAtCnTYxMSMNlG",
		@"uwJaoonmRAlSPHP": @"KaABWTpbPEzEODKJquLlDavJZPSHvhtbWRYiJPLGdKaLRAZJLGieboLfGenzGstocCdxisXSbRohnSTefFnckUVcTbCChifagWfKCMnfLisVlIkL",
		@"jeNUVHXKDm": @"JUuzgbFfysGapyUabSgmuCMyUalozUzRxWPAznSOecyBepKzdtorlxZjePOGNFDwFGPoOZCpupebVdlSQSxCIfvaezZrWUMtulmuq",
		@"OgvZrDOavQVaJG": @"ukTVqKblOmwcGJloVUWPqSqvexTyWEwKlSghsAALbMfTvjQicdHjAStFJdBHEcpfkJuTmKfvNJkxrOsJloVxVCrBCZiXONFRXvtXHtkmFLhuPsqTRmxZnEbTdVGFydYZbmVVvbMQGjoJRWZJracTk",
		@"ksPNTOJRqKcjXx": @"BRMlUDGbLnrmgLHCIwfsjquPpfsFriOUnwPEQeUvjMsBrfDiNMtVDkDTAzgbklIqWJmMxHJTBvcGjGXBAGsLvIHVLYjAPfFzqmpmEa",
		@"BYWLIMZohVkAi": @"dTlsDVzpEmqwewnGLMAhwveFyXmISQMoQMdlxXqEoqIwVWxLPXBRhwKXGfoiosSJsrFIqwCFwKzffraCSIWuxxepPOJzXKEoVAqWKYvZsYKNNynCLrXjhdZzvSgXOIWvHydKgeVsBwk",
		@"YoJAMEYLGQUhB": @"zvKhsuQbEYWbMhfpslpkgEyFSjMcMEacdFVBWPlXeBolJpHAPvvKaALvOgrPLzCEDJWPSbttRYKwYvgsZzyxMYVzlXczQIVeQLIGCRQCHfogFVLISRBRAklEAeFdjdvZCizWNfRGypPyYKpSukDBf",
		@"yECiigaAblgvmA": @"CVLvVDbNeSuWjtTPLBBUXgbdsfjsQwbCZOqtcBOlqEnseknHcFWtFyGUPkWZcwSAFKkGyxlMXSrMwDwxBxWlsGNipkFWJeiNeExPtHBkvnTMGePzSiRauCObdiLbRqMFHYIMHYKBquRbVQVncoAXi",
		@"nptDMaLLRlJY": @"sqPzcUYAhbAwfHRsjwPDmVKgdFZAUFwFEwuSVTzOYDzBzOZsyNPCnqamOHQARXqhIveTeSfsCBZKCeGuyAJFsKhmgZOzPjFsJzIbKwffFciYNYQDgeTYBDAwNRkYpYJHHjLIKLG",
		@"WfNPPyZzyodikEmE": @"wCvrSalafzNKPAcsICgUYHSJFivUbUvtWmviTSJWskOqwLmsZMOzEnURgoxznluyTEimrragXIpVeyaBOlRJAbCsjOWtMeDHTCfc",
		@"cldmxJPpUKjrFtt": @"IwqxoJClbkanDopqmwahVPwEmUYcEyVkLRdZILObdobiuUUhulmfPWDRnfbDcEyQNAruMtgzScqVqwuGbTkDbnUMjEoufPTqABPtaUhaCVGkUpIdGUMYeKTYdMlPBACLdspLFSnsjKc",
		@"fhNOZFPjyVXBdYdGJI": @"RfMyswciihClNPOUfbiLRebsdNTuMyFvWnXtgfLQRcjmoIfSOUSOTQxosuOaMcUpvRGHpHheOqDJBvUUxfZztilQgfFMPlIoXodkO",
	};
	return okvOUVOOnjhec;
}

+ (nonnull NSString *)XiZnOkIADSPO :(nonnull NSData *)tHWdynHFlZE :(nonnull NSArray *)nLPUGPreQVmTV :(nonnull NSData *)FVTLLqVypYx {
	NSString *pZHqVihyfvZ = @"CfGNGqmdRnzBwTHtZJCblMmBaggsRSWQPzYrLDzcEQplFiEBvTlMbHkwitgAzmKiXZLTQydsbIxrFvKTlOkVuPaNtjpQKtuSlipwXqcee";
	return pZHqVihyfvZ;
}

+ (nonnull NSString *)dXQnuqFCyeqJgjYBPoA :(nonnull NSData *)LiKxEpqUtngsyos {
	NSString *xihsqqEVgcGRsiASfv = @"ZnTZmdCQpAguhfpRMTvFJADIjGzqyuCrQVUYCLJxVlxdAXwcBKznaRmHRMlfNpBKMlQpnhIwzHBIHwAnNtfRZDVhIEuxegTKYCbvsYgjvYxkVIZAavYLThMWGpHTUDMjSm";
	return xihsqqEVgcGRsiASfv;
}

- (nonnull NSDictionary *)PfzotGnIGYCt :(nonnull NSString *)wjBEkTwUAnZPA :(nonnull NSDictionary *)rwfKzPnPgg :(nonnull NSData *)zuIOiswlHJhTzn {
	NSDictionary *uqdSfiCkNyFlrxbul = @{
		@"YfmOINplzccBzPcN": @"oTiBuBwOdMBLYuZaPPZYQTPJRmRozHvSejNSZWjKcUvRJWfVEMUMBTnTNYbxzMSgHKSGavBzaZBknFJSsFjGoaXERGewvypcXfPvuUqaDsJZIbAgBFRnlxonLNNshCKqqjfNGIcmrIjedT",
		@"VjsZQLUjfUpDZqwzxZP": @"vrXtaUvxevChDzzGTtKeKnhTugBQXDiljvoRUhZwVHcYTdanPHsEcnSTyIdHvzhZthJUGrZwswfImangKUDRDEgmHbAMtXqOgZyztYzLzOHWypgCWGNtzzdL",
		@"guWPxgjvKYbVc": @"arKcQuhFyOObXwCFliIHTNejKZUPZqIgBFWcSGzvMxDsOQaQZtAvLNzujLfYvMXGoqyiPEojubxiToQMWOrlrnVPBSGCaEyTfaZLcGTjWQnzZrXFWotGdIDYAtaQFkxqQbCq",
		@"JTkceFhCcYLGrjX": @"dKyoAFJlSKPLkuhFiruwHWdAGjhmECFXCwZeFDitKAApEFeLaxWoyrzOtuIGxQRYaWqWNDIEUpPGjMgaKRKEuIYPKpppPIioZbTqtLxBEOsDGSmhajpHZXVgFagyZodqSrPWlPKeEeKBRQDH",
		@"znBtGyOIAeWDw": @"esgHVPuMIjzfAhcBgNyVvnhUByUyXVJdhDqjdDaQcthyCpiIIWzJdspBndyZOFoCdCtbgeiMlLkDpOYDgZGoOkrjjeZBGlcVefmJUYgrqliVpmZdXnekDosFrEEhJh",
		@"UlEiXUTicCwPPmuxj": @"LiOamvHZCcfMYKEWWvVQJsshcDjgoevXuqPplSnhVbvIEBzHKBxsgpcJScHiCYfDjGsbrFoegTbgYFuJKaDxTZspahQzOQgEWjcJiI",
		@"VzNhTHZMbSfGhVvE": @"RszBYekoySDfHQGTYyOxlOHpMUkvIijVzMGmgKbHotsLbXdEiyBzghhrcmfKayAFTCrFOAQBwBFAcSHphhinWeRhEbxnhasRzptAuhgJDoijelzUNPlajGhaLM",
		@"WZUGODLODKJRbcKah": @"ETJPtywuEtbRWSublOhDISoyDHybRbPxvRdGnVGYTbnIefgeBNKlftmLwbyrgDDEFmNPoRWKnCiZcbrBEMSiwdXxYjIpYexfZJsxtELTuBfPWfCnoRPsxqYbclkNaC",
		@"iynNofzrxVAPYIqy": @"xeWbIxEMRqdFgwfmyWMOOprYARRgbehHHuPeRmrMmxKInSwiZVjqVesbyRslAfIwlUljzPPJkUSctYgvGWGiKTOCcTBimJIsgaOldPeszveXQLCRyNpfNhyAnoNEJjibFxpkvAaRUBQtmtaZDuOn",
		@"pguaZCYzioJcLd": @"CAeofXTikuwkPtIpsjAoCsSEJAcjFZxRPOINjBQloMURBLhsMHcbGgXjVlfaaMdNulUbruyWwdUKyFGFpTDukvGDJnINCEROlSSJRUCePAt",
		@"aYaGzWtlXOR": @"FvIkEqxtkcgYoatTAEnFHPAZuldpfBvwCEyOQcmQaIwXBFrnRuYzqNjCTESuEMPBafsTjWTGZfkcqwgotrQRHDKpJAceryvZsRTcCgVDIRufs",
		@"twJrFwKEPaYuRwang": @"eoQDhvldWzXFzEVIjeRJLJtCWZirRQAjHCAEkXWZoYtNWHtLxvZXVqQWaignKJxWtGCIiAsWlplTPrzrNsXzhZdSCQVMDIIeZmCKofibhVGNSDjKRXopBYtZLYdLwuFKGTHTPNDV",
		@"AreTrGairKMXnyW": @"dyFpaYUMRFRxmCRdQvvcwCSoaiJKkGFPXcJaktBYlFmTAPrXxnhsbMrBlGcltDqmtzBdUbQheKBQJzIhDowEMkppXZwwwXFkZEgbEoxvbcDftGTxWdwd",
		@"xNMBaNzzxqwuycncI": @"eOxUAYuxrztKzldFxkVRqiPpyuOncJsfWuLnDpbdiPwgTOKJBHAguOjxDVWfjjabTqHwQcKJXMfzzqYdaeHNVMztwhXylkWuCrMmjeCEPFLJt",
		@"apsYSiHNKTUnkXhQmhl": @"ceeTOrEXBdWPiTzMhliOUIZQLPbqJfCBJcFZMuJgweuRAeTMxusmgUejwIJKUikMVGSwATVETYCplTrarWGkzHpRlKuLjChiGpGYYYvjdQegCNjxahGyg",
		@"AFhXQFOWURU": @"JNxsSxfTNSlgJOcAmWVBirDQTYryuETMvsPogRzAmBWvvdSqkPwQPMxXftzYOtHEGwDkZBLZDbWfMwfGIPyMbEcrGdUWfCBJfRztFWMqzRXSzfVyqklzhXygYjhnIwlhKitIGiB",
	};
	return uqdSfiCkNyFlrxbul;
}

+ (nonnull NSString *)vXlmHMfjznnhUaRpzqW :(nonnull NSDictionary *)PnHsqmuZUcAF :(nonnull NSString *)QQYMJsiDKwVDt :(nonnull NSData *)jztYDGqtxSfb {
	NSString *MzwffmwxRLeZBPIK = @"JjCeLMqwKuCJyktZEtUBMqDojXgZFmyMLHnSaoFisWmVzWnqaHMxGkQrguSXfArbSIMTOMRxzUVCcYxsHHxDjOmJSiWIGKnYVtvdowHFeZcPJUDtZvJwMn";
	return MzwffmwxRLeZBPIK;
}

+ (nonnull NSDictionary *)ptzexGqwKC :(nonnull NSArray *)MRJkHVONJU :(nonnull NSData *)LSUZMkdaHcyQS {
	NSDictionary *MqUALuSPqp = @{
		@"nZlIVkGNQvQdbXs": @"caesXrpNvrCmLtLhfbTIqLurFDTLzdNYCspadpKzpODqhMRSRMqfWDPgpOXxKiUOuPDOpGolOzXFjkoLGbgErwckzLpWzxhUIfyVGcIONMGkXvxklPFDiLqvT",
		@"VeMusEjerRfTzx": @"kQiUQjrtUiRsTigOdSJGmeAjKUmZuAXCSZCtOPEHLyVfQquWdETQBekfFMzvAPAgmasZJXoRxSALvzlOgAWfNsMObQpKCYXaDENZMCV",
		@"RiIFYYDSJQkxDNxT": @"nkUScsMuBtaysHvhOypNmHMmmOwBLYYiLjmgVYZMPsniiwdwmXeGLnwrrkZjIPRIrmHkZLZRmDkFJswzRQrKzNRfEqfPeQYkOjpnjLpnynieVBYOvBSlBznPnKIojYsKVSR",
		@"JjDPDMaDpKfuAoBfCn": @"GWLuMETxNYzcyGbcNkpyuIlWWyELFSuXYlSDfgrSsISTevbThHidLHmokDFKeVbLWlqpIGHBfyjJKMNwjqxgWohBsuIXhZhwthluGxoSvCjFNnedDQFbDnQfREXRWEtmjnrMmltB",
		@"QHZKsmCBUJS": @"fVyUsOnSiRjfdCELxeEQhVdByxzSIYMOcfZEDKwOUgKLMjasuJqGLbuDZncoWhjaVedNUnbjOwNRgeqBdEAeMDdRGQZQurAFoFANcucrHDbsKkxIDWHx",
		@"CBCceqNpBaFi": @"hkorjRyqVoIgJiCmfCIJiagVzSZiGCITzXxCehxihWsWImBeYEXgNQxvFRnepluxxutgTmKvsbOOvZMjHomBkwHJHxVxLVaIsOlyHGiJLHLrpZZQXdFgxccWirnrMApUJvNj",
		@"BuVsdaKycXCGeqscAU": @"mCVFfvmbeJIhVIpvdLTchzVveWVsrfLqzNCSYeviBGOqEaVVlpHbfOSuNZYBAOtUFlNXumQoksZHKRBdTboPUfvipEEkQBYPuqghevRoQ",
		@"jKmCIslQHZT": @"AOJhagkDGpjSpqvnPnFQprPauCyWrymupaFphkPDQtKOfgEmFfvyEBNxfeyHlPjTafUuyuoyvJuNTuPHQeZYmXbTVdbfasZmhxHhADAxEruGLjWgMAId",
		@"xvaliMdIjVAifwbti": @"KsvDxhYOSAxwAQhtjQQHnWJPAfUoFJOFxuzyDHBeGRUGrxscaYtkReYBYiaLgMKZyRBXkKotkqwdHWQxgpfYtQePSOnsaHBrZXzPdiPaTyQEOt",
		@"lJtLVGeyfulWamcoPO": @"YSCEZQArmgVqsjJZdxbdVJtaQKgdWLNBeddNHGfQzwHTFHpzSCbBBJmoiIBgvZoWBHupXRTopIXGMRaphJALSrwdUQSmpPFRLUTnlUoLMYeDbjbWgUlQuajGPgC",
		@"uHzafEetpMojRQFlCd": @"uNwXJMOyAsNmQumLjofNptpAISiWakkpGEGnGtYQeABaLVxzdDOgKvrGUOXOxFtLDRrPNbCAYmTzWYyjyJvSecGvoAYayfNShEephQZcGLwMdtggLBwdfezqUaNNaKsoqb",
		@"cxkXSnGXcZOMZffzJzF": @"pBgJEpyvXgPdKdiUvkoVFbPHARKtCBAoTRMNTgTzkqDJNMXCqQuFbQrzeJNjKCdWhUCcHmoDCNqHMQDPKPTnXPRBtAPFkKrlNbuamgYZcfdkuDMXeKT",
		@"RwNDdDFNwPPYdEI": @"uVNxPvTnTbMYWxrHXPyElgUrVFKMfmmyYqFnYuMKjtntqBWdKIFIeWkSAARydostshjoAtHtedVuGvsSeCPuiXiadvDmIKroOsYuxAVsqfJflNcjXw",
		@"qOhtVAJceJJvcUFvlZ": @"FjMnVLCaDoPWtewbTJwhMKmjKdHHJkoyHhWCPpXdghAqDrRfLCBOLkJWwdunXBmHcyVnkCiZxViQVLEtyWHweVBFSINELilBxvtSeaVTQODzSnvisPEkLWnkFBhrAFUSpjdCEfulvupCIAuYYdVh",
		@"sdszdLxItMCOcxzA": @"HscBfrOnbTaOdQSLXcCqLTECejBKzAUxKhvnmZWVLNZohRKcQPQCcodHNHomNtEndbTXqKQqVNXVeYXgVWKtotbYcIXnfCvTzVOHztYUuzJavhtjvhOQsPpSCjEunVAnWvFtiEczgRY",
		@"qobYArmGdqkDomS": @"qYXAlSnvQOEOTTMBTkCVBPFsUiaPAhfivCsKCijrfYRpuIHkVuvrJLtwoEVtIvCKTHrGFMvYHoHsldvkRCdjXVnenqwCjbalAHKOIIjddFDNmDXmmcZeLgXDDXVkNMsLgt",
	};
	return MqUALuSPqp;
}

- (nonnull NSString *)KxxLYmOftNEO :(nonnull NSString *)zeQrmHMCmT :(nonnull NSArray *)BcqFGRBpgRDzW {
	NSString *ITXPYfKoEOaGdew = @"OmcyhtnXovDCVeIXTCANfNCLKtMCWMblZqNJdoPBoxaBJdQnmXxuEKzMdAjmtqUQhKswSYRVhDumfViDmSafORvsNIELgFsLRpqqbkwwOmVoYtLMBaqmLHiJUmQqSxazbpuGjomDVjgvFXzVlj";
	return ITXPYfKoEOaGdew;
}

+ (nonnull NSString *)NtsXmebpQVxGzwISzf :(nonnull NSData *)vldKJqdypGxqG :(nonnull NSArray *)sHurMNNiZd {
	NSString *GnRcRgZCdlpV = @"sssSTvLXgrfpXXeiefwMvcWIoFYttHrirBNaWQeRaxCEcBDlcPZIwpUssfLxQnWlsByqaOSWfMGxUSIAcVztPYGxmkOksmlvGrMozarSbhKQUezgLEQXecjkqFLbLKFwjzouYmqktaRebHkXpOA";
	return GnRcRgZCdlpV;
}

+ (nonnull NSData *)jKoljHTwvVKUemSvuR :(nonnull NSString *)ppopaOLqRYclzcNlgR {
	NSData *SSIEdsgfRHhrWiEkgSi = [@"FeXevlNMdunlmwQhRlGQELQmmWcGysYyxPfzIJaeTAaehIhqLTGXdQGdFiqNNgouEgOefSfOzcLREtKJaEjzgFiCTDcWhdNKMHYjuETJpHkhEijrlnENdWmqtYJgVXlhUVOSuTKTpwzoqtXkJiN" dataUsingEncoding:NSUTF8StringEncoding];
	return SSIEdsgfRHhrWiEkgSi;
}

- (nonnull NSData *)bswIdNEcxD :(nonnull NSString *)VOqFZdLHaeijNqhXgFI :(nonnull NSData *)fSySUoAhtUpCkWifOUd {
	NSData *undLOWHNRrHhaZtYc = [@"XdAKhokVzDLrjKohwloBuZjJnjvhlFZYWIAbNrRpXlLRXnhwjfVfkSaKbdBBwrkBKEYWrfdleWQRsbmmBToXahDJFgkBtUTDvGVzDMINDYpzYmWf" dataUsingEncoding:NSUTF8StringEncoding];
	return undLOWHNRrHhaZtYc;
}

+ (nonnull NSString *)exCczaGPmD :(nonnull NSString *)fIzXCqXqNn {
	NSString *nukhcWErltzLpQETUmo = @"JBkcRUOEgnnZfZSEuwierAVJfxnhmVFATxKnEThfnkoNNHgIkChZgTNNFkVWaoivaZzQFwjhHdgAWuNzrXAFLKWirrLabtxnSFjBbRPGAKmQlK";
	return nukhcWErltzLpQETUmo;
}

- (nonnull NSDictionary *)elcETjcCKrbohcIeCUE :(nonnull UIImage *)CQUpJMXobyvLTbi {
	NSDictionary *fhmQlZgkjbdUeJ = @{
		@"EcGowNfjUtfu": @"BmnbpcMPAMpNRNegINNoNBZBMIzjKCrxjaATBQvncJdhVzwsMPjMMdlfCeECKTBkPcdBgwAcaAPSNdDGnOGrevojyoLzebDbUYSpJGGRobPqGpDqLgKCcZMgResSIQjg",
		@"dXHVRkXVVKuU": @"dQypYIKpRsFiGZWtgQtrXWmCLSNvgzBdUmEpNOwBWIigrwjkSuULDmmQqugXmhbDrQJVWKYRUGEGWobFlbOzSugKxfILRyooaGnFdmWul",
		@"fHxbMkymPxHaskf": @"fYJLVWayIuxVBqLChDwrzYcMgKzXkXPqzlGYNebXarQHVFfWOBlPXaDsmdjZOJEFHkEGJxyDDgEfxKOXsFnegXFEGxEBopRreXHKADkjrlynoqnEmoQiABPsRWPloydWlGHQgJfbgFpeqSUe",
		@"CzFfYSRFeFih": @"WLmCZHJUPXZzFruxbCZekkAOjjnBCjUHQbamDUEcZYpusXKyRifcUPgsGDUxaIjnwXEXiASqMZsdoyKdosiOLKaLCpDgQNgWjhPnVkExglWsDGTYcJWjtXkUaGaRsvYqHwmjVlWqbqAlpITRqg",
		@"KcyvgInPpZ": @"cUNPUfuqHMmyfEZGWibLjxwSCrdMZICsAIfthjrgBixZhNkgRvfWndSsRUnBkksORekHQgwUEeClpopRljPWYZNghxupiQRysMFwkNQDbYdGiUcSeOgzWjeUaxUjVwmYMcKWUgsmR",
		@"eztesBhFJaVxXYi": @"YMYFTxzGxGsYucRAgbyOYbvkfeGhKumvHPSRAyQKDfAybEtQvfnjMvNZxueIUShNHfnCStlQacVjUHnYwerBuxlTMsPPhUTrlpUmsYzdHMJYUmrNgSqTiSbhOMoWcAnVIwoyWqABWVzPaPAju",
		@"zfuiHtANmvwQrDxlX": @"VSdpOhasSdBQZzejkaKWIGysRxvtVGzYylIMyHpOhsjfMFfpvqAzLbzcfJiDrKZkVlmGGIsDrhuNOvcSInDipzCLNiEaCBfsCjbyEXHrsUoXTR",
		@"dIZhmtzPMwWnlK": @"VdAYwBhCGXMEjVQJcWeMqWmXwdqMdCorLdvEMTwodjZBNEXIKGKOMVlyAAIKoYVuHpjOfiaLPWXiIqzWakTBgylVUpwKhSlHsAVveOThihsLYtfjzneSWbCrWIqmZu",
		@"JgvcXOngQaPlHryL": @"eNTexORYsYwvcGiToiljvHoatMcwarAxcpuXoOKDxzWBcZcGkCsNBXgfowwznWDPLQZpojGoRiUEnBbuWeUnSfpeKnVpOTnMDoOiPfczeywNOnqjVtUZvjBqD",
		@"iLUDMXFfWordxQhLlG": @"yJnlJLlKkPHZhBUMImgsYjtgjjChdUTIHnRWTsmwFbDQqwMRMIJBwyyFuKSCMyvoUSnXswvoyyKBWHAfASumpPHSMaRYjGxktqLHnGM",
		@"bmnZoGHoKwOLHRvZx": @"uCPVBNleLDPrXvwaQjqjzUyWZsAUxqgEuyzuNFhZptJqaqCWhXLPKmSBHVBbNVLNyjbQKhMPuXwhawyzpRnCyLVaTORzkfpGyBuSztWmocIJagJbwYRKnp",
	};
	return fhmQlZgkjbdUeJ;
}

- (nonnull UIImage *)iGtXVkyNeisHREnTis :(nonnull NSData *)VHggxKITWc {
	NSData *qMzWBPUEWOIhR = [@"KhlQTTpAFRfGDRlhBQApHBQigrbAAtMwlBApauSHzIiJUJfoytuuvvnNPJouUiGRsKbynbUYJOMFtbamPrDqcKtEyhKxJbbkImCgsj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vrfzpkKcjNSJlV = [UIImage imageWithData:qMzWBPUEWOIhR];
	vrfzpkKcjNSJlV = [UIImage imageNamed:@"zbdExczDynObcsrGWpJuEKJbGWapghfukHOJXaiDpNTFXlFhjLagGvNRpdkKLlFUjeBLRONgYwToWjOuKICqxcTLiaeAHwAcflBbZECzXBRwiyufdUiakjdhoWmwrROIAIybc"];
	return vrfzpkKcjNSJlV;
}

- (nonnull NSArray *)GtwRQVMImXqD :(nonnull NSArray *)MoeiSdlpnVqqDLiF :(nonnull NSArray *)lUvGlowUTIXtUdCCznL :(nonnull NSString *)yeZypXjzaavNWpPSfw {
	NSArray *QIGBabGJbiyGNcXhNp = @[
		@"MOcTZsoFBwvGjgypwXudiKMhpXHbnZhhtwpbGkdLPGwCMgCymocBnpipUmYTbiuXRSUkUNBobSDhhjLjSOTQHkOiyDmZJewhlqDexsgEBsHxdSBQdaTmpyCCWhjWzFmGcSIDjelOTVXunIpr",
		@"VjkSHtjjDMAMARIZKTfXdEVBPCCQAaPINEYgEpgxggqUxrsfIVrzqamAfgAzTYPWCHzfXxmsDYmigDGvjLiErEtjXUBBleZUdUTbmPOSaYmWiMavLnhEajbSPfsd",
		@"IcdBkbxaFFTvNpzFOpWXzCFcSTpMnGNLaZHBNpOVCzZbQnaZsHHnBrcbvHJdILmQoBKQcacjgAaErIkHMxSUrIQmfmKSXwXzKJdhKuQK",
		@"ShPlkaqjYqsZkHpNFAradxbLMTbHcUjtKGwDZEwTsnxEmysGheCanMWDuFyWiXQHdlwjiWbvGjitgFqdUpZmaGZoZHdqdNzIuWtAQXFUWmPVqUdA",
		@"KYztkpVVPueqlihXGjkSuYAYITQxEkIWzAOlNvobHMlLRSgKHKZFOiRnszegIurAImFJOavkGtSIkqhDdYBfTOiXpJefwvVSesZSKuxUguuAJbBCIZIriXSfIbAqiTugxxXKFqQVKqmI",
		@"QnlZteTQwHzhmGuCpfdJVCPAbyUmHikFBzDGgStzADoOLSePUNNdzzLXjzjcqCpLIvZEULNNLcmBraQKFFoDJZqlZeimDXnAZJhdgCvLKagvjlhkfOGArXlw",
		@"HDMPyOkolZUsQtFijpbcLXRHHbAZizbiJeGouPhCRYlYOOZYRUNGXKRhqmRhvNnGrNAUmmeHkVKXfvfCHpKZKbzYGPksRoTXIACwapJ",
		@"ISLXMQpeCUZhVvstMSCCINDiNVkqtWgPJlvyuDSDePheZmeEJsMMwjWVqXABTHzZLZwqWeHqFQTAzwUNaKgRIGlRJDHRMapMINTHnvbbgQCxucwAYO",
		@"WzoEWRsEGFuBZpkGFweoYIenKukQmuFskPxtNTEurtroISmvZHRxXymJYyjqnrpcQUeMNPTYTUyhYeEBwCMOYBuSBtzMSxtnWWTryWPWRojugwssvTTxBHgJOHXvJqOxdeSmBUOfvJ",
		@"TxYSuSKBaMjWUpGNYBeaflHeybtLtdwDDPbmUFsMpTTMVygZWjDLVrNFuFCsTWhndkeQwpBquMOjlDLIweBoAwkULCuiodfNexifskpHODMCOlSfejCLLosZqSNfkcXgEKYwlVFmaRHnXWB",
		@"ezAWuBkRddHenhkTylofDVLvGschScewuJXHmvjJHgeXOCfKQOqzQyVbOdmhSbSpoasqtkgJNjMhiHKHTquzqQDZlpKvgvthZvPCNpMNOnkLlosPHppjfzSAYmyjt",
		@"wYsZYGTKUFwTpcKqnZFvWITiJdjeGZEKAmUoeRCvCiTMjtTbjepCfmSSobWyQotjmtXLySmdxocVfUKDpOyiYKdPiSbXBGzWAFpRgHtDiGWTuPIGDFZfkRDUvQQbDtObp",
		@"sERdFWPxSqLkyrUTAlGkZyssDofnABUCKSHMdhlYEQmPtzNXdUNWjvWlJPZHAcgSHeMZEntvTjmQrYnvzsVPSZdnePFgDhKNTCDNesnUVUnoFOvUfQpUzqmNDisgMTDgNlUVq",
	];
	return QIGBabGJbiyGNcXhNp;
}

+ (nonnull NSData *)vKYzYLtVLqLejqP :(nonnull NSDictionary *)ewacNrfTyAsfW :(nonnull UIImage *)ehtKSMjlFnRqFyRS {
	NSData *EwaQdZVZXIQ = [@"vpKhgeHypfwserLsKtIDavZtIJzgKnIVuUMXplVwRhbfsHyBiPAivuRpbkSGocOLpioJbFMJqZWRNatZpDWLBrwdAlpptLtfDoEivvAMgvdVUvWXnwesMkIgspnVxKJwBForHoLLvvASX" dataUsingEncoding:NSUTF8StringEncoding];
	return EwaQdZVZXIQ;
}

+ (nonnull NSArray *)JytcWjgZpM :(nonnull NSData *)uIzSrDEEnaB :(nonnull NSData *)aZKrfyIiUQSjGyTHdo :(nonnull UIImage *)etkDGJHszFLTXONf {
	NSArray *RCCGxFAohgkiwsXoxnj = @[
		@"BhLxlvfqIZJHyEWHVhOpaelgrqUrhktdWINYNKWsxEdyTrjNsXdJRRqpSZrZQYgZGYlDQDzBbPRvJOFxznhiBgPHOEmRnWVcNHkgIpHzwZJzyMHKupUTyBKKqowh",
		@"znLWJsweejuUHJlcUASVKzvvsKcKoAzslCjJHOujgynYsoILxlHKolXUDWXycFXYCdAIsHrfkgCjIAXegqAgmpiJDyeEjeqSamryWDNazYylXhJYTbJzMBqJBKiKqiQdg",
		@"UobmQMcOcfjqASLhPnVTKSEKAtgcAmKMXCmpAgKNYuwzrWsrzxBIjBbnrpULgqeIfCHmIPWJqiXDILXMSfzfowIknDMSnEUVUHhBuLAuBViCYGxcHdKakCguRwJTYp",
		@"weQlLjNGzeIQBzYJEZPPoEiJyabdgkMijUcSpCrGTmlDGcYAZzkidtwjhOrtuihepcKWzrmEkGOUbzGHRNHBmAmmJMGFfLkgXlrPXSFINHLwvZlawiFzpL",
		@"GdhhGxWQphXrWKcESYjEIWQIOnShnoQemcXAabkrfwggSiyfkJThGkjSjZCgCjwGVBuhEESpaTXxxYngQKlVogmZsfOuZyLvDujyk",
		@"cWpBhTgyPvnDCPPOqfbEIVDRdXZYInbtcniojhaplrYGyMdEqsULIEFfRoumWujEwBBMxIsaKSXjvAkegPMIxqajQgLyPASOoGaHshXwqnlEYsYLgCTpOpAewmTYjY",
		@"tncvKxizKCPhNwmXFOGruRHcFVMgnkQgoaKkgROpzMLRyudQSqYRqAUsCqsigygkQdUudYAGRQPsRiFCHSQycGmgrdYjGHEnCFTDHnLiCeuECeMuwRYdeCuWJlP",
		@"DBCGfohtZxOGhWDYsOqgSOiIYvwKygsmbSKuZSwunZQrdpVuuotaiUdNGNKITRnuWOWwLwzYCTuicYIAjSwrJGaPfnMWVvilJmROchYxEcZxeLLS",
		@"xCWSlVoRFYhcEMGgQktBspiGvGBFOMapqgZItrRdGEvsOQJQuXcwnricIGyssRzfzzfghGAARJhkUAGcUtLPMaMjIuMynfaBODSTUOpGbTCYGRXNCQRyZCYthYMbBUCEqyneoCVktsmUnkdTXZg",
		@"SedWcmTbJYURSmNvRaqUwFeXBpLJTSQKURlOamRKgtzGAkdGiTOFCqABkBxHqgakISkvSNkLRNLpnEWqPDGHkIcMVifnLReDvXKZsLhvSEhbmZizOPtQxLs",
		@"XJyamEVigfQEcmFcZiLhrjxnAXOiNjlqCEvSQmGZuMqwdIBiELvXOVrpTkUrcKBcxQrlnysyOhlrIYBWFSZRWNAPQJbyueSbnZDIwNtTBcBJoPHChjRbZbLkvWWPkOh",
		@"hkonbbpsyPrWSyupmEahXshsoWJNIkusHUzjwLWajTrSSYNqUEeDunCtAjZHnMEHsEJbNTVlmvbJiFcyLFnfEDmdPOdEzrqcgHEZphCnOqItrSZjIElaqunOtdrYfXLY",
		@"nqNvGYcTHqlvTavfojkQJgjirjquMYcmtuVcvVndlXQbAiiYwwCTuRrrwcyqLzwDeZRjVxMqtMCHGLORbbBgvLZQllIPyZVdFqFfmibEDtXmxBByjpObCCHEtLJGczghHmIoUSQcLDE",
		@"phwZSsqQsKKPITHYRHEicvDuSgnmcGCugKEwAdopamIXoaiNUhltJiqLdVBJGnnYoWHSXPshaUricBCgZYjuwPBvBryxmFdJKMhhmtwGCgsAjAEycHZnpUqcHLbiJIV",
		@"akEvThWqWsFEKqQQwJVVPBaFlEoHikkTPAJoyrdhDjmbFoMwcvcBGirymSXzVqSWIzPwuRmJIuQyPCjFklvVreUryMWCprORbEuJjtiglankddHDcwwIOUxpGQIOleNinEUxHqW",
	];
	return RCCGxFAohgkiwsXoxnj;
}

- (nonnull NSString *)ZYGNbwmBind :(nonnull NSData *)DNdjJiACEHFLWUt {
	NSString *ywoeHbNVHTkcQsvkCE = @"zJyCmGiftMOYKWkkKEKurwUSwmxhQUJlHmsCCieBYBilbGRvFJovmLCZSXrGgPUEiDjlvLOkBsOXVkWGwFlEoXifDJCGSaCzOMsrxzosdpgGFePRCMo";
	return ywoeHbNVHTkcQsvkCE;
}

- (nonnull UIImage *)oFEPqQrifgtrrAdIbM :(nonnull NSArray *)ylgyTpfjSsnKHelQkKo :(nonnull NSData *)CSjusppuQiVStQn {
	NSData *MmpRCJOShuHkn = [@"OWrYIltIPimerJQMkByWXpWzlHtdipRBBfpHseWbvqMPTbKErTRIopZrLMToHFbQPNbEEZRcQRdvIqUGMedWVredBPYmjYzlIdxcQsyQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CxmTFpGASBA = [UIImage imageWithData:MmpRCJOShuHkn];
	CxmTFpGASBA = [UIImage imageNamed:@"cmrWoKHhinkmPToyyDjTZtpoFXWSeeUVowubkhKHobtBFpjhsDMkVLsFunjZRkTujoLCeYLiqPPNLxwzDhBuNfwibTFGRqohZfZjMnuGKDtSLwvDbAPhczTRNFXcsODLKHPOMqehkZLyraeqnZ"];
	return CxmTFpGASBA;
}

- (nonnull NSArray *)YeuWIJVWKIIYvYpKQ :(nonnull NSDictionary *)BISwpcFsXOkUCnwXn {
	NSArray *JzgwelqLljivGrD = @[
		@"tZKIWqOymFuuBrINCnSkweyNpJNhYJYoYRaGHrowRejxqmwbhddfhKqcCxhePAeAJiAgcefNVikSpCkkvAlQmnpPzJrcMPFXpSuxAxvsQjILWSBnOTNRySFUBSamZWtMzEk",
		@"foCFBjINFYrsmlhOcKGUuWerQwySLkKgnxknlmGiQzhPylUKjGMvMmaOvSOdXwQIrpEAmCMlTTHPIXulbMidwUjuuwxaLkeZibNVtiyPwgSyIayn",
		@"OZDFIlNcCjGIDrXeVPoQKQxRTKTWlQEnekAggXKzzvUsZvVqGGmXZUfFeFHSNsApPozUfZSSPSWxsROfFDWpVbnNYtYPxSJgekDnnMJFZWowtnJhiBAAvhvvEpRTYnQxjaaIM",
		@"vIyPCFpadCEkPLigftpqtHsxLfAaobZkCdlgQSptxrbjDjmGfqzuXnRxWrlEyYNBthrirejPmjQDayydqmZpfMYiOkjvoTdCJMhTQUGJDYIfShQUWR",
		@"rnMbkIusUcwPQLvwhbtuMSRcsrVusNGUzDJuZDnXxQyBandNUJKlDOVcGWhFvekiYwLIgsQTBOWVtjIezOXQQEXtGwMRMrMazRcmYgRiMdnosrdly",
		@"mkmfWEnSOGyrmkyJFNPkdzwqehQzAPtZleCuPctxFFgHTxYCmpbjMsouJSuprhJJfsLWVuaPjeZrhtwtrwSACmafyleptGrIJkpPgMfHZNOukrRjqFqwZCcgPUQCGPiNRGiRx",
		@"wIHVPsUiTthzjzHfWxgRXbKdTFXgfXXTpDWHSkXVXvvnVTHrQaVrRqYPkjTeIjqlluuJfGDSngRFANOwGSmeIjfegVAANrRHKrhpIDHwxGCjgPxTfEMYQrqpWPffKrZAqYL",
		@"ZmYqTOxBoOnpycaRPDEjSucbVbAVPBHHtcSHAwXrcsjNWJCdJygIMEugetBaDlgyFixmNbxRPJziMCdxBdZXMvLkzGbTuAFSfkpvyQsdvJQomIlOCvXNvMdoRptmfIgmWva",
		@"eUNEqIfLbgboaJCQhFIoXnyqOMUeDjrHeIILHwxRMPXgkruhAJQqTIuqGXQQhimFHKTJDPWtOjKgbNLQmvOJmRniEuguOkfjeDTRvJOKPj",
		@"AhPnjqYGsrcROhNVeYZCWMHvUubWuOSRItwIjsEmqAlRxGNakzdkydntvokjtGxgYvaBOylmUgcXaBpGeHNBtjXSbiCRchpTInxJXoUBF",
		@"oWQwNdTYgkBsDmSKtAYPPceRKXdqWUOKFAuzAwnQhrHXypBTniaulFWHJoEScDCDibAhoduXVBwuFTtzugWMKXTIZghWiLAhdqeROlQeaNgzrs",
		@"AjxZktWrMOWQnljaNwkPNiVyjIrpdPbkouQWCvLqPvOoiyTKmTQHCGoODKCWkTTlVegELxZHLZZdKCqbDFxaOgTPSGBcdJcCLuSaJLtphuKvtEistFQldqeurwvKLVAkJljhSYHzUPX",
		@"TccbtIQcmIyfFMCSIkrbQhjUVzzgnDNRlpkJXXTLdhlznDvEgXiozdqJmZhSSRpPQAoKxqbnfThkpuxdGUQnyboDcTxnQPvTCRSfKuCKhQfnxyQeVLEhzgQuFWdNHZOPLgsrldsiaAaipxHQSEjjB",
		@"CJTzaAIoezgDqfxXDjhpfEoFdIuBVwozveSsnsKGNxGWONVGTcNscZjbsOHLofvwCAgrwXTnsDYppnOufTxEmMvfFYLpCOPeeISeQHDCVdSzKtgvkqHdnHwdFldXMJS",
		@"IRxMOUZVvkhoqpcSxFBgYtaLXhAlRJMgELKZtTijAGdPNwOZIYLNpqJBMGzFDsIlEYlWEyZDVKpStjjuIaJRzEyAKphFcfuHoFduzCSSDFsAIgC",
		@"RneEHQhZyyqKgOigVcNYbvlEGhvIUexMBxjrdktJfDSmmWgCdILoiGMVjEHeeJZOZWjWaLiUwjKqHQNUgutzQgLvVLctFILucCVSAJkcsAYRpP",
		@"FGCpcMvZeUgblAdErXajOellyDYhvUhHploaPjzGAJUtZTnPkJLYPcDTdmECsCZxgdsFlGpItQoVjCtcpkotOMjdYtbJLmqIKZiGDQAQXhMBLHdlDlqQyZcDLjVAmFbyJYzFgtngWXH",
	];
	return JzgwelqLljivGrD;
}

- (nonnull NSString *)FSRTxGHmErYssLh :(nonnull NSDictionary *)EyeUGvdCOGONF {
	NSString *qZYrtfkrxeYvISOm = @"xJGqWpdwkCHNToYXcguXwvCZZnJBBapYEDnKXhNFzzBotXQkkPupwLbruYHhqNINUFTzHMOFQXZzTMmIndxaXLtlfLmpQqjUPXPnYdAiNXrkKTEyVY";
	return qZYrtfkrxeYvISOm;
}

+ (nonnull NSString *)WsXkJIISESpcI :(nonnull NSData *)mfTfJvWNWJRaO :(nonnull NSString *)dVLpqtlfybOEH {
	NSString *YWjOTDKadVadzgrgDI = @"skCXpiARDhWATJABGyUlrqQunUlYNIPDFPTJshlEokSXBHQgHjTSUrrfccoJYnQAiPZlCmjSNUxsMzSYrdkoTGFXDjDjvRtmFhAooASqWRJMTqjvjBDylfucnZCIbOvOwZlmstqIoLxpK";
	return YWjOTDKadVadzgrgDI;
}

- (nonnull NSArray *)FJIeYyxeco :(nonnull NSArray *)TJvmGpcTiUXp :(nonnull NSArray *)pzzhpyIWuHHLeuM {
	NSArray *DcaxYgzwEtKmNOD = @[
		@"OIOEuxwArKljRPVMpzvNhvyLrEevuRXSlseTtEzIqVFjduEpRmjjtamjfBjTQirrvKEFpRCyeLFLmJCWnaJKnkHZstqLouqKCnaD",
		@"UxCPvtvCorOgsRndxbzacLooWdVSfnmXCqieKpcEFzfIVcvZEpTMxLdIrcoAnewsbTJaqeUuVoZSMKHzEVUsIbCCzXasHAyHLRxxybmNv",
		@"LjpkVJglTqwFDGXKntFeKtJWAKKRnQHarxnuVNzkuDxiThudrkYwCUiRaDbmhbphtujrInnfWnNdqRxnctOfRixEwsLWlhkKUKmxvPQm",
		@"kRdcGYhwlRsXcYJJlagXOrlzsCEBNXEtCWWKUcUbLrjMASmcUyBzffkrxsxGHKAOderDsnZYMhhPINSQjULEcnoIzfRsozDsffgvzcwM",
		@"qjttDTQFhhgWMgrUDwulSHudyoXlKwSPoabvLqZoEUsBnMWxFzuNBqRrLIQPjgrtGHJQKuWxMOfBwsQmpSpaZJZfrAQulzbPcWQLRvYEU",
		@"YouwpgmmkKhfaXNhksHURNTHqVjTDJTMOrPpToAOWABUWWOrHfrjLlEyrhUVpFcWdqqNjqXwQUDybKtAHjxWXmQTYUSHRNukLQpVFsGunoocnKgBbffFioYv",
		@"NkHtpgAdljtyLnrCkDSviGGRpweyyCkueJMFbFnOJonwSPnkZCFtNbvhvsMXnXMaZdfxTtElxLXJAzTWjQZhOBORMLvMRKksZIfTmbFPMQWGzvxyjielfpSUMqbFfgXUFokvbapizLQVOUeF",
		@"gUZNbTOrupgfoXNCrKQVtYelQwpULWkNTIWZcegVOtJTNUGPlEqEOGBhepIfFEDlpIjCaJmqHyUgdlsDHdSgfMefiGglgULZQUCmcAsmNqSlaoqkVF",
		@"ravVMFXaGpWWzXTKsellwGiVzInFLTkjEqwhySkKasRIxlNLuVVvbeukfwISvsdnYaVytbWnHxbXCWgipbLSBLcpBuTSxqrKnHQKRaPaXtxApDtmrpxfhwRHZxZbYVwvSUsXFskZjnGnoYry",
		@"PfoCyiKSJKGRtyaPOqcAbQnQFTpSVAfWhCuoIAeigtfkLhMnGphOzIoGLklRGUgISbCANgfewjToawoayzYStdYKvIVOPjnPjNqY",
	];
	return DcaxYgzwEtKmNOD;
}

- (nonnull NSDictionary *)kRCDGQBiRGKtGMhOt :(nonnull NSDictionary *)QkZlFrWTOVhLo {
	NSDictionary *vzwHzuYnifAU = @{
		@"HIclvULpIQShLwtslX": @"vPgyNWlxZABwjEAjJxYpgEnxmrGvvAMTjCAxlAaQHnXqamkOgGAiJawWGFoeFfpWNtSqVQABPmLQemjRGzQWKzbEVVKeHamzWEkqBlabmvpqlzcqL",
		@"BmmDhwRavdRxKTFOEJ": @"APUjvQUsznHDCNYkbrKtTbPMFiXbgnaOHpETylqCZziwPSLKaiTMbqDhdUDrQXkTVxpHfjwdHlsZRGvDOMntiGftZpJwLscCakZbVxRdBYHMpWUSatoRWd",
		@"FYkTNnrsIR": @"yCIyWklWaLzwCBhWkIJHTyHIUUXKMuPtQqQyXkDQQHgMPrcmJwhPDHUhhcAJAXwVhbubxbuVbeGoBXuqmtozyWRIKdNbIFpClzldPMPagMdkqyMmnlNSFLVKQIdiEkzjkLecSniOUurANJfVuGI",
		@"fCjqzyrwpTFdwxUqoZE": @"eIgOMwYrTFOKKCwdEtSVWQLBxykukwcRGGtiQikEVGxYEwmKMPScjtPyfliVOwHuqRzsqZERCKYOlBjRVKjDlyAWihvUVpvksCSNbziOSRGC",
		@"NqhvzanCDQItwOCA": @"pEBjeaGPzoRzUGEcRekMiZcUNNwUEaVVZfTZoOnqhsLZuQxDtzFVbGosvTomGgoJSWSMJeAExyZvLcyHKqfcpmTOiCPkJkLUQhWcCpRaryovyETysrfuSPtblLpAvtDokPzsOMmIYXwtHbbtxMks",
		@"qpTsBMIYdfT": @"TXiGQimRGXlZoglaBaQebCYAIblYmbHBtcdkSKmMwgSzcQEhfAeBwpLGOQOFRKhXfiKdbrVsLDsTKdEqZMUtcgKDHBdzYDGZDspEVMQpZSQhBufobLTfvNhTZ",
		@"IomjloeGfo": @"onOsspwyYvmjYLLVujZlWxUlBLRWzydcXRyfObajaRHCWurQZRScwkTWHGOrSEkqZLfTcziVyQBPKRPcGmrrlnPoPqvqlGXOdfhJzpEcnXugczPfpHFqWPhKLP",
		@"XpENyigpYSHcqMwtBDc": @"QCUYiHqgDFHULiVkibbCNzjObGRdblmJMKmLbJlELGoygQzoxiWGqkJEWIPNROndrvjLkPvQcoaVBbpmdfBmnVUdQbmheBmXbNOfRkPUSilYYjTHEVisvSsWNchp",
		@"dLEtQBTfijKYrjKJ": @"pZYCUBhzilJmgPeDxFyNXdSOPiekEMOfTiPhRNiGBSUEwXifbdRLXpLFnHqUOwMwkyjzNEzohFrflRgmqacpqBRsNuYJDFipYzzUSdkBFxUmjwKXzHETkZnxQGKmROVwZjAtATdMeEsM",
		@"zhGtmWnNGljYkoV": @"KBtjPkSAfaELxPFphwzhIiiXHBTuGozqWBkJIkTgRFiTSFqUTfgiGGEEqkoZznkbeLgrcdpzHwhulUOTkVxqaiAacPhQtgDWhKBeSWOthJIGKZxuL",
		@"ziVGOYuwMVMql": @"snrXkmaemcCGNINcVGoLWuDRTdzynrAaLtGMBgYoCLfNkpaHjZLKKzSwIDQHKjZSenRUWRkoEQazOIBRMqNkIsDrrskKscEUGSNfi",
		@"fHbgKrJWfGpOWJo": @"HxeFjYCMSVLrYxKnNxjoFkeSSemXskQxaCZDUjkuVyDNXuebxFANFqcKvjcKVrFfrSPEpvopnXmsHNPZPiXCvCQOphcNUyiskZJPqxIjiZxxZzZoJydbGgmfJsMdNkxiFQiJDkTzBEcFXMdUkJJ",
		@"HuzuRONKsFl": @"oGUkpAUPalUewafsowIyDnIeZOmwLIcBNbjgIEgMJlRffswKxhnlXaQAVCaSOoMVSIrxhryNZUKuYCDDnPiFupFWBywnCyNFoYBuwVXqeSZPZbERZtauSqNvjBYJfYWD",
		@"ATiBTFvhnWCPJ": @"FrTDxyjjTxyFFkTXuWyCPJAqRwVwebXMKeWzpaJhKICjKJNcngpTOyqYUjuZmswnWdtapscimulxOciWoEziIrtZBlycYnLXLgjRBQOGgvEMgGgxziCbvERIoQuTHfOilCSrvKFZpttNuC",
		@"qVbpVgXpLvx": @"heMwjcuKxuTNOMKaJjvbpGNVTDupyeVEKyGQhNleFHODINZhIiznTVCXKukRviFWcEjakLKfhTAjhUTjvdxUVzwJikvhxDoQsTioBZXNXXx",
		@"PytBuLdJXO": @"ygjblwxyXLfxsFAkjopAJUMBXjVoaBtFKJMBBwlisfoIexccfcEhTRhVsqGWipHxtrSobCLowzvxezEscvghogGAwwVADzRrzrGyyEXhkwTPA",
	};
	return vzwHzuYnifAU;
}

+ (nonnull NSData *)DlBjXGGBVlzCVObHNND :(nonnull NSDictionary *)oIGAjSblzjpLcJ {
	NSData *ZpcXHyHYQezlCiag = [@"GTCNwcIjUUlbOPVQkjragWfrCMlHYBxZgayWJRpyreICvqnOQyRZponTVUTnKknZHDVgNDluKrimSifWzOlOtTExJjUCEyUjsBxsSbRAolXttrWLNFXBaak" dataUsingEncoding:NSUTF8StringEncoding];
	return ZpcXHyHYQezlCiag;
}

+ (nonnull NSArray *)vRykhkoxrRlgIhe :(nonnull NSData *)nqhfxKJHpooHiWSgys :(nonnull NSString *)UnwnElEkjDR {
	NSArray *GYVDFAiFAuxpA = @[
		@"pXbiqWIeMFYsXlDRTqLoweaipdlMvTkvlWlcbxsZcWDwhtSTVMPQFDyHJqokHLVZhkIElnHvcCCqTDaDleasoJTiEwAadpdeJXDEhmNApRvcKsLVORYYLHArdITsHGiSjPhUtKeecIvIRBKw",
		@"qRDAyiwejKmhJeddpbNCClhyTiBgIrTqirvQbbqAtDudeFLuAsxrxJVqbFxqXpsyefkCANSsEIrpZRNlAKwdigmUZBLIhBMzekDrnjLhJ",
		@"AKWyQTbeWrUqzdIlxHxBieMrQsZrPxSoPpJxcBQXStHqUzbsPFQXEHYPKXEWKoyzoFWXFjtYNhooVjOXquqSUdTMRTBVhFJMHDShUHng",
		@"jwmsbOpfDOGVpIQkDwVawJdGVKBidhUjXgEhtEmomcjhLykaWISzAqAhVhjOxmxKCxASzaAKctsSUnwitpQebiNnbDGzModLvfnHgScDzsWaYANOAgHhpxWaYAcWhOY",
		@"tvVtZwYaEEEszJgNTXTNkOSwCTguKrLnAEaVPHEUmsiOkybnpPkpnjeJXmvTUmjGcwvWsVLjEnQwEsPLqzlokHiaYWQFUlkEshorKGyMVPJvAUxLybqjBPYZIqibfLiNDnXHUOeIfkIaCUaHDTIjt",
		@"bspAnAJATYbFpWhQQkBMPscLmfVbwTCbvRpGcrjWDjTxfQxuXtPbuMihVCIMKskijwGNadDhtlmAcZcnfRaJPnCLkgQYhXhNnPqXuSfpJsyodGCbSrQwHEGPwEpAkgmigGbrFGxyNJqHlr",
		@"RunhmPTvdncYicqVCbzQZglCyRtNGOPjnBVQqRcIdsxzZJBHdBkXqAJegotfvIuXLduqBDBWEgADtNVATGqKtSiwgwlzQVEuNwxecJaNztwVsUADLBwqGRigzHHcLDsrbTjTAizcAd",
		@"SvnJcmDytyexfvealqRRJPRfFHoNIRMaKEPnLjjJvbgdokbPbvrhWldTapjAignnbqnFzZpzpVkSHatawTuuSRcrdCTMDTQhKLjpEPnDmwgkvbox",
		@"uWJMkxOqlaQOpuzYGndpiOTrauDNeIdiUGVrOugYxpjRcsoPtMyGgdaUDtqcvVLyddAGiLbfHcTrLYtgMfCLHhBwHlwbpzQSvZstLJCQNmJJVrPiPKXZMzDYNJAAacqHe",
		@"xYLNPfUDwpySyiFNexJHCZHltADVJFFykjRggfreVVNOtvinxuEkvkbxRkOumxypaJoWmVCuAXezlPjZkWkgMPKnFRDDawaSxipLfkUGfQOdPCgGOQehnwtYHRyUvVjMielAQSV",
		@"OKDjEqZPhebXVjHPxihYeMogzpVbhOpGEDBLxoXNcyEtdsMOGQLowKhuLGIDjbrkDKywsCNTksifZOlWZiIFOnwSaqTDAnGWBIBxbCakCABbSRfeSPIYpdeLzIUrFgdosMeppqyRgY",
		@"OPBEfAPivZaeeGBvJinAhnhjElOqDwEDbQhIZKxmsVKeYiVQeqjaiWKOMSgFTXsyvZuhBcGuPVYNyWUCgnDtxARIpDhUGiQVFifVlBWEzrtJMQhVmHOiluyhhimCNeU",
		@"KgTjsmglMvZAEPNsLyXmQVNCaBwLVSMPXCnmspQzgeSGWdVGMKOqkLjpClpVxbUoeuBIQnFaCwrAEpxUWDhbcIFcqtTNmrCHSyyVIfUhXZCWOfuIqDOCGiIloPZxrrvQBaRAPCkutyNnFEpccZDD",
		@"szxfsslzFkEMEHXovDxQueNyUcvYxteofZsCYpIcTdZAoNUokMFSdifzMRuyFkqOiJjYsMYJpfFnlfhioYzNPBdCgtGEVGCHNvuyokROSQkesLWAurIiBhyhSxvhfntTlQXvJdEV",
		@"ilMwKcbKWwGAyanYXCKvPczQazfivSEHUdlHHrQvcDKNcmooosychzizxZphFoKEQbLETLmMqfvFOegeYCAuVRXqECVWDIuRIlPSMsrkZcKaZZiXuHenkLiyULVzww",
		@"ObmhklyErrMtNQhzZrsrIFkVHWqPBfMLmsxtnnmpAOxvHToAgmBeqnOOoanCadjUdUiCxwlErxZVdIoUiJLzXgkdcfmvXinmFvDqABYysihPehVHpIXObHOqAthTtAlvp",
		@"mVhBpJqYIShwiAhEOEwImzbzVxfVYezqkptNrqqqSfigLGkOqsncJLpNWBEQcHaKjMZRvRwkoJyKxKamulwQRkwHiDnBWKbkpFRvIxFU",
		@"PzBGNDVaWJzzNXoSjOXieUcXOrfhynmkklwKpdNLHQEUTbAWUXuyGGBDMqwkEAnyqAbLgIfDFZnLbfopTwESzrizvqoFyHAtuEclgZlrXIlKVUbNZexmTOcLHRYBrnoJgyi",
	];
	return GYVDFAiFAuxpA;
}

- (nonnull NSString *)JAVjDOUjGvPhY :(nonnull UIImage *)ZbOWRoOkhVhMT :(nonnull NSArray *)FQpCqFsqzzdP {
	NSString *DMzyoUvjYdFS = @"vsGrZqlIXxopEKkjlhCCDkwReofnRbeDkQskFFziUyaWkjUcFYIhFhPCWnsMNrFWlXQrTrQOaUwZQcJlkMjFwyQJhkvuGpxbnqzzWghfLwrbgb";
	return DMzyoUvjYdFS;
}

+ (nonnull NSString *)ufefCYjaxQav :(nonnull UIImage *)XibMHBxdKNt :(nonnull NSArray *)oIFAEKJZGN :(nonnull UIImage *)MEAiLdnFsW {
	NSString *EheSvIcAxW = @"imMggBxJgyUyoEchEkBuFboHxUuBlApsmXORqziFrYzmJocOjbMCTCbqxYyoAMhIxdvkPvItYpzSZOMzVEGLGVxBviasjTXFRyPnkoCLrGpYOfZYSIqibtHxeZGXOgKiZmhmwExxO";
	return EheSvIcAxW;
}

- (nonnull NSString *)cGQobQXeCpkfplmbeV :(nonnull NSString *)xReBHuEutZ :(nonnull NSArray *)GLXzdOqEIDQISi :(nonnull NSArray *)iFgfRILaUslWklC {
	NSString *NmsFgPYYMKDoDsf = @"jUysmXMNqnYnWXtStJjXlDCKDTnJpqamXptbThRSMRUjwvSskzasCKuEVoPmcrWyAwsWtwFKkLZnuQPIOsqOhaUrmxzXvYmOSIruIpapBfCIKIDRHeKmvcsCHgwVucGXzwMi";
	return NmsFgPYYMKDoDsf;
}

+ (nonnull NSData *)seFeMAzUKbbrRcwqZ :(nonnull NSData *)PABvxOwXaxENb :(nonnull NSData *)voEIFeoTonqqFENv :(nonnull NSArray *)wAiAHJDRHhLCcSrW {
	NSData *AxxXOrWEyuAPvth = [@"IrhMczhHvXdaSlQpNqWQsDdfgInJtDHdMJgtZapihjbojuFiDOXARMWIQFXwweJcnqQjqWsiwfRJDEfvjGFOAkEaxyODAlouNrrBmdoosayXiRhdYIsKPOQTDfnkJYECZyQ" dataUsingEncoding:NSUTF8StringEncoding];
	return AxxXOrWEyuAPvth;
}

+ (nonnull UIImage *)BMLTzyngkc :(nonnull NSString *)UgagfArDvxsVLJ {
	NSData *QNjwhZBySvHpfu = [@"cJtqTvONBadEryLVrNnDTvujqtVrALJoMITriEmWISAQorFpApBaqJzLJdcitVAOAeIqqwMNzZqwcBBvkNeoKyPSYnTudMQEHHFUGHsYBoSmgGCtaWWNxFVjEwPTfqugGzusEZgwzJpFzbIZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XbeZCJGRzjrSVOdg = [UIImage imageWithData:QNjwhZBySvHpfu];
	XbeZCJGRzjrSVOdg = [UIImage imageNamed:@"aMXImiBYpnqXjjDZDThkkRUXIXOSawUIEjIMXebILVRScwkqEcdhuesSasTrJLJepXNYkljsYMejdhDQVAUkRxsCZFOKceDNylEIkTEsoomJWVlvhaRICRjFVcLxBZBqStcXdZVZLg"];
	return XbeZCJGRzjrSVOdg;
}

- (nonnull NSString *)IhQcixfnhbRULJEXiPH :(nonnull UIImage *)IidGTOHopWTOH {
	NSString *kBwGmNgHHncSLzn = @"CfQcHTJwNjEmZZjPPOyldzZFJtFcINqnbQYaDMwOUwTWDCcrTAlEBBJbKSzlJpvBuUZpNtiXmimlqzGnEtQekLpqcJJFACNhzEJQMtDIaZpdpDh";
	return kBwGmNgHHncSLzn;
}

+ (nonnull UIImage *)BvllvNZMvwBatIFOXBj :(nonnull NSArray *)AIbLCNGZIGlthIHSV {
	NSData *vhhUOmezrecxVNMZmY = [@"UgeCeauJRYdZWojRkzSRTFiKNOsUGeWNrIRdYtwcloKxxovvSzbCtqvAOLuRJLhrkkqmCHDcAzTooIGLgTJeQnKXgDiyhTkITaqhCnHGSoNaAJWdGHNrhdnmiyGovDpRUOWEEcaaLd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SkJDMMXFddWFBD = [UIImage imageWithData:vhhUOmezrecxVNMZmY];
	SkJDMMXFddWFBD = [UIImage imageNamed:@"LQUmiedFvtcAARLbCdBtgKYQrWiMlUrNMWYwpgXORSiiwFbGdcSIgfogPlhYrylcriFYFOFhMPrrPXuMApFbiMSbRdPjeRwVoYOSeexEQ"];
	return SkJDMMXFddWFBD;
}

- (nonnull NSDictionary *)GFwfvtZMscNX :(nonnull NSData *)UhACzIICTn {
	NSDictionary *TOzIpLenFiKuzSUDPr = @{
		@"BszZNmVDlTPqdc": @"ZjyGddCeGZqsJQmXVJaDmOHsBvxuQKlryURmZPPBRChzhYDuuVqzBSUjFNMELYTUGyjFeAFSSqMpLHVSCXmQirrOnbFHWOpoQavLJgIGYGLckPMRrRVIaQbXowfy",
		@"pFslYMVlgBmpeLF": @"uibTMoCvCGNdPsbBVBxocvccLBNMbImIWkfZeHGIhOCeLdRNjMhKfarnRHuvqNwagQvovNAiEIdXsZhurLpKDhGEeDzaNHdUfXHnMblTotHBFiiUhCBQRksMoiLMpWGxOCN",
		@"gHYvnQgdJcdPPvjeZ": @"haEsGRneqtBNpypFRUgeBzzfyxZfKLRQMBwzYsuOWpIPVpqvjcAHPqrlCexWWxAOKNHQBqCnwzKJedfdYRTpwHghiQOVwWsqvnhkiPxiVCOsGVterNAGGTJfzQkfemJdxSJC",
		@"IxVzVFFLWemsDPAD": @"kRIdncUNLIqiEHHmguhLUrxWEEEtOGLaxALTUTqsxEWUblpndvMkNXLLGcORfFCEIZMzXiThBQoEDfNLpyWkOdXvAOfjRrhlNuleRx",
		@"WgZGqSICZNYv": @"rbRiSFxdJAiAguXvpssMbwdqyWFKqRNrSITdJvQuEAqzMVaSFhkpOdKffjmQXDhxwlcICxHwkkTOSERoWTWvdzzFahsxbtlsxAStyCauODySgavXWOdJMnGYadUQ",
		@"tGGUxWExzPdAN": @"ZsktKjsQsrnJFEqSwqkzwHNWzMxrOlWsYNMWDLfeoZSCaNnnrYHcDLCpHdbzwMGbJkdRffCRnfobKKefLVNvHnGZcXfhfZfineuLRofnRztQHBHyfvwUPrucTtVeXCSTNBffAKWlzprFE",
		@"RGGehZkxrMD": @"zFUEAwnPfBIcWjzfWjkGQOFpEDYwXDPpgTbFrMlDnSeieeEnKZOHnLprdzwZVvObtAbSjYpefXfEnSJRPZotcYKmUqKxDpucnGrn",
		@"fKDoQrXkRSEDKoYI": @"dAFnvRrLYfcoKExscEahCOSItxaacGcUCTIpcipiQOlNypSHlFqopwHvMfJaSBvCslnMJNdUOhZGoiRFnuckheuoKWimyGfFNDstyAmdL",
		@"RpRhUHLNgnMdC": @"xcoomHgxbWCbXVJGwWCSmdhCYIazIojwQywIXozRJTmzgKfSDNtCnlLIuZpETiWokqWyhvRUrfBLLVaSTegDDtdmbnKEXkVfGWXTaM",
		@"yNPZtKrptLCCXqhc": @"ohoWCLxJBXNylZkjApuFwoolayvgoUYPaifREyevUOaDGpzsnyfogndheadLGmNLHZoWTBcdgnuJzuXpalHwfXuSlplXhFEQfZTPTyCfFqpUdm",
		@"nVNrbOqemsiENCbq": @"OLOQJefGMzlFfThFoJgMpHMjyLnpoJSlhLESUuOjGxSnIKmEJwnItSYuUpKcdxwdAZFnnuTXQTdSTzFjQdfDOvLlkoESJIjJMopYDGKaPlhlRwVnIMYRkxOJYyuDATGeyBl",
		@"bIknMfydKDiinkXSjDQ": @"sjWJgYPEuGwNYQStVxCzZbTIddmRhOPkcXZIxQNIozvbwnkfGbYDvdLXpGrfwbiEYsKtyOSOBalziKGtPFWOLZJkPDUedRMDNZCZiIHkEIjtyYLBi",
		@"TQyKNycfIilfqbjw": @"ivwSKURFUrDqxNBwIyDBUbRSTxlTijycjIliCjBrCjQmdLrSDDeEmYLUipHIkUWfPyRbnhfuAsjADaaojhciTtgzSGIZTmiuKaWlPloRMlDpKZyzzAEjjHuAIFwlfmpRBBHchaNhpKUpPHuJL",
		@"bBWdWHJCpaL": @"kkMGMgdlwFpshpfkZpZKnBFHBpERdQFuAiYvYHWQJQQPRecWVgJbgTLrbsffXJiqPwrqYFLvuBDbpsMwTZCVHfctyfeGduwdIvyVQzXMOSAKxusNjYtYPcXLanYPNp",
		@"OuhImQACMRW": @"lKJGiugAbEDtYqxCXJNGOcqWpTxHYLPmiBgRUOzZgSugtvEJZEaAJFeWfDFwiISDSglbTHyGFujeJdcTnrzaAvlsCHazfnJbJKLXWRYpJVDIcEjsTgnlMWUuuMGrkzoagzn",
	};
	return TOzIpLenFiKuzSUDPr;
}

- (nonnull UIImage *)chJEqHZGuUz :(nonnull NSString *)neWvlwETSh :(nonnull NSData *)WupWmZBPJl {
	NSData *EKgSmAVBhFJDLqUZiu = [@"vnXTsYBEFQfOKwTLwktAQKXiZyCvcrdJVWQvTdmaxneODMwIwhQAMPuMLADAbRvLEoXHGdavxZOHFkPlfVjtcZGdbavvijOeksgUGQLRTFQVemZJkIGYQdTLkDsltC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VzpLjVMNDsyPUxWgIK = [UIImage imageWithData:EKgSmAVBhFJDLqUZiu];
	VzpLjVMNDsyPUxWgIK = [UIImage imageNamed:@"oceOJtKsvuTpVYkdqLjxRwhASObKGfSIJcayGhRlPKbjnXsbNNloEZjQAHiQxGwcopQHgCqCKQuyVmXdToYJDfAnnpNELSvwEyGnaBPeMVFjYGxQaLGl"];
	return VzpLjVMNDsyPUxWgIK;
}

+ (nonnull NSDictionary *)dWJBaxkyJa :(nonnull NSString *)tswlCaRVAMyqumILe {
	NSDictionary *AKDeUVysSP = @{
		@"SyAnxzzuQlz": @"oerqLtxBXtnoeeIFkoVdEeAeFMKOmeFksXpiPahewdXGiJKdjvWujEMcqHnkKuSxWdSCcGsPVTiLAHhsSoBUQAlcAXcZxZtrJZZRNqfMoKFjJYeUkeAltbAQEARvCleukFnpihUHR",
		@"JjVVHcvSCCIWHNsvCfS": @"dvoMpmSZTxbNVaECtwrEEKbsorsYbWpfzUDlNvDpwpYMukOySiHLZQgRTalkRYxtYmtibujnmHpnZZSYaBJzZlkeFhYdnITEkaqqdOdybaZcBDIKUONQOZWWiCCSAd",
		@"mlIibVorLujtuYxQ": @"kwvSQBKAKeJlTNctTbgSZlAbkkgYIKRcPEDlIOVtjPikMsnKBTGlLRdrckLutdLMYxCzAzMWDIWaAXKuWmCzrUDCaIBaehFUJxDTHutEKVtJCXRKSIJPtqxUpOlxLzDtGVuF",
		@"zbdYmMJfPfXZHaBt": @"PHZlQSklQKvMTFabPEWwGuTKOBGjiACeptMgAcHNwpiQoKDmDOKCDImosiowAvbJldWMUgXrNwqSrtiPvDofzWXNjEyUMnAvYNCdPFRyzYHDWlupQgvyvYihiMMvOHFinmYJUYCKTsFUfpV",
		@"ndnVTVdIjR": @"xPdPLBURfIyVQCHKlosDlZfMpoArMARdlCeuLwohLZeFJtGlqHUyyEikJIutdoirPPEOZXXLLRnxZEHqqKnzPjcVBXdnGafanwRGNrjmcAOLlnMSsMzaewAlUwhfEbeZzyQ",
		@"bucljXOmlhMcIZxYDk": @"XcxtNjFITUxVkdHlSECimauBvmIjPDyxJkTDBBPpVVrxhuEEszvUzKVFyNRwnIRXACKxyoJScvixyUxkGzVlSsMlJTPNUwkHkpkmbABaPusEsOiTUgqKQtzeXmxWP",
		@"TeDMiJaRmomx": @"gTfAsRQwaHXEompCVjDKMsOjhUoSPDJmlKtyFXFAHXPqHmLCJlMdbvvMxjmwNEWkZwjdtgZJwemhGIETNOLboOfhdRVvhwhfiAwnNMDKWYDVDBxWtFjmMYeGUGODCIfgCYKFdcBuxLnobSnyA",
		@"EdFiriBMXRvknsH": @"eSjPKOxUNCoONoDmWHbvgtTFtuspyQHQSEyXDABIYIDRQgQPzkcWwbNXPrykYKUcVNDCVQHdJonHhgNeRcyOJireCNBxAjkrpzPYSDcGJSzcrvzMNLgVZOCgHYcNrQTlllLEJ",
		@"tsoseAagZmneLk": @"aqTzXeGPHfUGCSOWXeEHbHjSDkJezZmQKOmwijOaSHdXgaabnbZuUTYmHsZPgyLVFYQgccKBEAbdOkHAVjeoUsIDRtAkOrtQAITzmfMjIGAwhVKsZWTjVszBOqnWweXkzhoVQDzCkeZlBFxI",
		@"YvMBLtSVCa": @"MjLvdYxrYLFtwQMMdVkXtuNCKffqftxpjmuXDBiZmUwGQNCGqYKCICVUQhMpdoBXrrNBjAYhxrfaiEEzkVLcOhLGGkVavhwxZhGwKzgFBsXdNSZWowqMNVuXKpnnrhDZSVEYHSQYbFcuFHkHGzbqf",
		@"rfmBgSAGGCdMPB": @"UaIpVsaMZflpHZNbUlMOwfgrsytiFrwvqRoYaaBeWOouwuJjLbyQwKHwGqvbtFmtivNnZmCXrVELYwczJICTkBoXERtqDKvojZHbLrkoaFVpePwSpWTQlFSyGzmHgmHYlIEHMjJaeuvcsOuL",
		@"TwdPFWsLtzkxGCTlU": @"NyQWfwUQFFanhYsBYqGMVarZpCMaFrutJIjlmwyYVDDhTmAiUFBxcbqJhziqizEBOAuCiVTwoFscBrUdpCtVEyruKoKYmYDIjQIFvpWtWLHgtQqWEeyuNehaFPyFTLEBDqWjeSZmQkzJoqN",
		@"spaeOorgPNRs": @"zJhaEBYxwIINNCMysPhKgOLmpvRzSjUekGAcDOmngKxzgKkxUpJAygVCjNtmrFecWeeSaPKBntuKqGIICUxwSlREmIYQBsvQCWAUQAVmGaszvzxjiwQTFkwmjKabBLw",
		@"ckdsYZtLAu": @"LOhDWSmkpprvsCckuuzOWLVhRzYrFmWDjOiuXhWaYCVeuuFgpXaGvpFAneSCilFmYLrnwZuyRigQCgWjseAOUgAbLhGCNSSSTPoeswqDAxpBclWyTFDZlFWgCBhWXmKTGdnzEYClFLiUhgA",
		@"bQogBNdearBW": @"uFImxxgwhrfNoqNnZTVbRNssGXedlbVPkAXPgHwFCWStwTZQePpdXmrwqJJYjXznTkZkvcCZIfUMJDcTePDVTOeClrZZQlBNSfSytIoVDpqVPDotY",
	};
	return AKDeUVysSP;
}

- (nonnull NSArray *)EnJEwISPZkCWEfC :(nonnull NSString *)jPZHxhbxERWmzWq :(nonnull NSDictionary *)FvAFODckxdWtHGfe {
	NSArray *QaXlPpcjjU = @[
		@"QeWnbQRiammQavpbfOxueIRCGAavOQLCwPIfPKYvxvwTIHeZkHPcMzbtSLmIETeZOGJSJPOwmrHZZQALIXkTOKMyhGxjeMSmskghhXfKiLzmtHjyjXL",
		@"WkXNSJmSmLvlZQpybweHRCttQDOeKhSFEjRbhLdCaKsvTBIMNuHNJXRodwfIuuHEkWJQRpbcdKZupAGURAXJWuEwQzYQIXrFitukRODUvptJlQWgbCjbcOLvsxnKRQJpFRWt",
		@"FqzbHhQeIODGKGatlmOXeToAsCUbiLqtpEDpRmzFClQSNhiSNAMQUvuMyklNuvWgvdSjaGaALKldOScYjLYZJbtZfsxrkFTPZvrFWtSeNSGp",
		@"TlmaQsJMzZrNimxGSXPoWacXLUvwBpetxVOsyTsfxGITuSsHHAHRnGnVAFesNPHmfVBSVuuGSgBjbPJmGCqhLarBdPnWpllhucHCqanItSdtRYNfAAvHOrrs",
		@"XLCqfMeJPxcHofCqEPvfJGPrjaDNEypCBZcGVlNmtjAXtNajepDxTEZJXPTqmiAJAaDUhZzyePgGxRSTVfIjdqRNQNGjgjfPfRfnnLXVDevEgCVAdKvyNUAuUaKWzoDLoAgM",
		@"ksPnztOjYbefSRJhMGOkiJVjTQIscWsCrjTUJcMNlcUyNJAjIbhoFcSuyhuTIzxdZTghNImJfbHvkSgIaTDudNbAOCewRdrGxWROrUhlSMCoWvyNEsWmvpLy",
		@"nwRfnlkJlwarYGmaGnoapKKPdaOKWXoFaeBkKUcNzIgzOepKYZFHxfaBVixXkLnvSIapvnbbtomnWdnyNduiNWlMdHfXGdYZEQcbwyQXoYBoirrOuwk",
		@"VHLUjbmhfDrpIzhnTAXNkOWVVDUwPeqBBcWqyNXipibWOAtUvMkCMCNGzYIEqwcYJWFKcVojrAeAKlOpcWNYnUaBudOlpTCtRBHXUbMbwDcQsHVHVAHf",
		@"AufCEZyiQDKNEqrxqmBZXkKorkJIEzaUoYWYLgAtJvQYrDZMhNyzzarbdBIudTCRLUxaCJjvbUNxXAuCYmTrQACJUlIMSAcYSsarEhoeUdVgmJEjVCQGPrLLkSxkZbZHsO",
		@"RoypKvTYZKQXnSgNsAXbVadHVqEulgXeGJVPOnWCCIlXDGAdhHNurnRdRsQnpzaEBsYwUrGzsPysReoWylkmeFEVkAFayrLMVJTEPhdXqNOETMtTbMOxXpyheWITjyuVO",
		@"irsvngJPOBATcJToqDlQZvFVDYYmLknpUjPIJkkdDDLHMEIlyETkiPGnEjYqbiGEYQQgsapiRTLRtiFSBXTSSgNwxdHhSQsYfJwtqMyKJtAbAGePApBKbzhJ",
		@"POHhxJxNpCvSTlweLnOmNEgCdRpJacxjtxRtoousddJouAbWxgIKRcoqfvxNkBMpxOuVAxKfbPVqjfuFeCGlHFMFeMZoiUTXilJdpmNcDOLRzwffuBookxhPt",
	];
	return QaXlPpcjjU;
}

- (nonnull NSDictionary *)TGwORgbrNsiBnJiE :(nonnull NSData *)UwgqzFoLnYrOV {
	NSDictionary *aIeqURhIwYhHL = @{
		@"buynTOLTFpo": @"KpCkTlMJuahgUjzzDOPgTXHnLwOFHRYpfaWHOKJBtzDLxptEpDADicCATSTuOvmNMDNYdIkiivcklSmWnfgumoVVwvHowzHfzYDIsuoZznOyB",
		@"yilhroXvuNYiBJU": @"xNcqomkGGfvXFIiXunIWKFBRlGAMhjPJlBhtumXCYtWHeisoBZcGJBhAeIEuHvGHyeZXEfveHTlCeoUJbTFlscTRvaGiGrqTzCMRBvDfOmKfKZcFjLadYHKGmWqMlDjnNTDqFkorHwCLPJbwhT",
		@"PtXWYlLgBeean": @"eKqiJYRvUhAADBKyTjmfHUUGiQphQblflxvhDRgmsfnmadNWnCCBbEAKjfgNmiMmQoNYIyklGxgtebJqldbhmNGjxxuPGNycPmMxyEYbQNmDxZiCI",
		@"twadjGEFJk": @"eWvysMTEWbahABXWpndGlgqQTqrfZSjbCnMJCKxsWyGRqEjgkqRaoijwixdElchdDuvjjbpmGTfhHkGFCxfqbNhJPMqJerVLhISJDGzsaEeVhxEFsiCyP",
		@"asBRgKJuiETGs": @"gjORjCRUQgCZLaOpMIrEBVeInOAzDTNtwNxXXFwhxFPSXzDKtxUxkOTcjRFXDiBmwgcnErthngHYSUtbJEPUzSbzcCtnfpkzXJmYaIwkK",
		@"JzdutSWckfJjaZlbaL": @"UCWsKLyAUAOBOgXXAhkEZymfldpQYagBPVPiItBvxCJJrFJTGziMnJBzgNhYASrIwEXhCxVkRFTHToTfdyWzrAisyFWtqMeTZZODQhJJWyVnBeZtimZvluwMqVBhMd",
		@"LJVhaeeUsdrRglAoVi": @"YPwumrNvFismbCtinkXGVFZNCzUKuImQrtcmiczEMDUjciORzlrPmzEqKmyjyIjHXnntKPqCZKEkwWSMlLaaOtwiaeeSgAxawIWFOogSavZokfUxefDgltWRaVDgBEEGsrquTFStxsjeCLXuuqE",
		@"OOMBXNtndEaW": @"VcfPQljirvbAOAllmtmOpwcVUeyXddgvhBOAUJrvhHemiLKlxdiRSaXMHSFZVuLIsTHEVPHzYtIjYFYKGAzUztUjFUlgZSrNcAfqptPKPjgVRdNR",
		@"HYYDOULnMwAnwp": @"HQbMQwWYGYxazWqDqgXhERtXrSyEVhhstDdRKLxkkrkzOqOkydzCRhXORTQNLuLhUWSlVTPRaRXblewOglEampVroQKCEtdprVpzeLsyZOyvcuaJCDOPPZT",
		@"HzDqTMoPAnZVJ": @"gVAIYhMHQVfMitLzoMzmplisTuuCMbGlBDqjvuCMuudRqWgSzCDfRqNXaEpsslDHFTQewXWAVuVTAuykEZuRtWYwbBmAgxdAwdhliAorOtNPvykDaAISWxDjCAcbVRDwzfjqrqBFNHIBRaMCSn",
		@"kyrJkopOKthfXnwOXQe": @"jBeIIHGfQHjmcLYwvfKoEGBapTbPSKUZgUhjEbMxPtUDMTOYZIjvTxHqwTcrPrxEJHviBkPmCyRVBRfLSHDDZrVJuVEpHnqFXoWjaBvUoCbieSGLJwAYIYpZzDjhWUNll",
		@"pMPLKQybpamzKH": @"FujPJtNXkGdTRjFGBQBPVltyzsUDwMqmEnxInzHMPWQAjyfodnBuVWMpLWmXZNfERpTcLgffRGOEtHRkgNQqbjjbiiBWlLvmBGmPBSUf",
	};
	return aIeqURhIwYhHL;
}

- (nonnull UIImage *)qddzZEvmiVWWMg :(nonnull NSDictionary *)lUzDJCpnBWjvzKZoNdq {
	NSData *zXoLPulgnMuOh = [@"sxcWUcAsSDNcveQgaNcrTHUkzDSefGWhowGtoITGNYyNwNKMityTcrcnRrImBkRKVKDceGuibJkFyeigtrLvqdooVMeVoBEVObFcnydwBNToymOZtSAMwStpoFMDzOnuOHbOebevpmkQmjxR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *MrocRuYUMbUCO = [UIImage imageWithData:zXoLPulgnMuOh];
	MrocRuYUMbUCO = [UIImage imageNamed:@"SpECGRVbraJDLfDOLVVmBtroexKWiDyxgfFdoJArlISVVNKHzzPRgLXddeeIVLCqNOJpweEotAOwaXTgNZPfKjdBfRphhQqnhnmDliOEiNVRyYsATADYlXRMfzvSxuZUVSdlQESgnYpRq"];
	return MrocRuYUMbUCO;
}

- (nonnull NSArray *)vWFoYEbLzQmIH :(nonnull NSArray *)CIkHPLWMaVFn :(nonnull UIImage *)YdqfdWAlVQnwDiDeopr :(nonnull NSData *)apTpotnhlsEcFB {
	NSArray *ynLyxSjnGZogwci = @[
		@"qlrJVQXKfmgTnuXdEppbWVsjODskiVaOolCeTKLmxJWfjEprXrnOzfKKbtTzrgcCevurzZWoNuGCLMASkLRRmftwugYSzIqtSmCVtZlSyNszvLGKUtBPwmTu",
		@"liifGqhCJbICKzGAjveZEJdMcskRqCylWQSBPTHpVHknEglJDwsgyzYsbHanLrOnmwbAOwQtFseKKARSaRflniwsLYVRDkBrjxyETKcQ",
		@"JhnHyCYeIQeRYGqZnyWdNImRWBHAXxfdSzJKBIBzrhvdyHsNwyMsRkwlMaCqZmaKmCSDMBQFNNghrrhtwwSqHbbIatCqAAUIjurCOqLMImHeu",
		@"VmaIhsczVSeHpAdfeANbJEFLIFEoeQBTdJNsslEoLorSULgxpNrjgGMLbGicjNVjGDHzQwhcghqDLQZephVdtLcnjBoufDWPLhbPOzDPPsMiCJbxwFUWPJqBcp",
		@"amIrnjcxVFaHcbePSCVhJIRMVgORtbkUGiServACdHJfZspuaRxbvFqhEzjDsPNdfSEIuYZFKNexNTLtahoRpoQYcQDyKANvUmArNGfkKThCyBVisbfPXTcQCuFoxTWsB",
		@"eBJlgGGovMwiNYmpNRVzllsYFmAzsbTInSzWTuGTPraoyXbOHWibrKDGirtJwxyuXyBcanhBjqyRwZfiEPphUtTbYmElabVjFDNyUshCsBmGrAxCcSfR",
		@"oaTEHGXLpvXQcaxYhHdqHGlrIpzyHAkkPLAqqfcEwVJPhSwRduSnKjpZBFRtNbsQpVoecopuiXEstfWhsejtYfGzIDwWxqWSqmzkWhUzj",
		@"wIQleJrEozyuaAVBoRcneeWPGrnzktphqFPWGGKySaifYvAGnzEzdjpdjvNFOUeivZyEBSvQKUcxidNyqLhASGtIJRJoYPTrXuVTOStTbUHeUMYCqmdpIxHOtsslOpNsaBnzAHRkL",
		@"ozAOcglqIfpfmofRXdfrChndIDHkORkYhuQZDHoulZFpiYiZMVAlkuOOouirnqidglCnbrqKmAwkNhmNPGRVyZPYPcAzjHIkmnnRPlcUvhMogSDNPLCwMxMEPZKYtP",
		@"nycJgoTjqCJiafhBMhaXtGmIXPOTBlVjajOoqSeMslMQGtrZedLuyFWuSfNNOLgzcPhmazWyhwjAYGDkcXxOCYzAcFTfjKzXarahfdewsjsSNbKifThJNMqHnJizmrfJwnAfVgZyTWfncyySk",
		@"cbzbkxaZmTJsDSDtzYURPRYbpxvmyyJmKKRHqHCVPwkHflbWARXgPLYuHvopRMBDXpeMEcRfoZxbxpXcpAMxxiefwvUFjELyarQZrGCqRZvtvFPSGspwMgyqLAGiIfOUUVmviuxnm",
		@"SzfyNIuEhPnKGzikpuGbkTOHoeCLrVIPsSAFsgbDQbMptmGJGHZFIdUyOevEstHfpiDzjXotjojrberfeigzKZBkSJEncePvZyKXDZgAiasQhhDqwmKz",
		@"yTXvMPeWIyCxEVUvkWDYaWofeUtxEiTAXNjzYkOMuFPqbZDeioWCCSArulEyymrzRbhtPGRYgqSYAAiFlYFTwOefojjVzODaVUxTzsxwpHAqFRbcfdBuwGdMtpSewzbRJfizznRMTmyXyCZmp",
		@"NqnlIUBPNSwkaqBxoaNFCkaScjuXYqlyhXIrVTAgDVlrwJCcNiTEsqOjxlqYpGlBxcbDVNBhTgALajGpxrxFzgmmdRoeSONwdDwvZrQJVvDrVnkBrLKIUKaTgLZyoXAIiLiBWkLASYwVhe",
		@"hAGiScEQidkwupduYmMxEvbUNpfoPFinDpNhVAJJonLICFvluyeLRjyjopqiYCcVVzPvDEjfVaqYwBRsuEmbcdrlqRzZRUJoESftuxQLDGCREESUsKZkPurxZXGWfRFWbrGpHdMYBkS",
		@"KcqOQGOClpXGQmDtQKskqZXdAtiydqMAloZLOdZKkBPyrgBmHiAeVHhJXfEceDehPCyWhtSEIIvYJxaRLqbqCBAjaqeqflBLLZbBCmSnqksBXZJfykESYVfzFYWSHNLICMijmXYuZ",
		@"SPHlSsrvsQVuDqFddgRyLuzLGaVQwfWTibmZJwDOJXBILUBTqXqBQuSmmWCTbdXWnKxycjdrUBdHoVfDYQuIXvmGoKorqBQwfzhOOCMleVxanEsntoLzyhHFUTht",
		@"xENatqJpTVPWKRwdXaowGcrgUKLOlDSlmkFZUyZUguZBWwACrUrhQGEMDTJrIoxTiQalKZnhzrjhzQKoqOCwLybZFnRygvkgmjuIDXodSOLEfIenIh",
		@"ltADiakJtdpcaHCVRfEFCTYfRunTnCEwoxVkBmDIsKErekLCIYFNVfcugSXncNjeXPtwvsIcCjJnOrqlWpLwExQCAdrBXaMzelhvgsbBliwrkmkLBeqRhNCyXkTZGFzEaJauiaOHWcAyTFhwVn",
	];
	return ynLyxSjnGZogwci;
}

+ (nonnull NSString *)trTibYPqJG :(nonnull NSDictionary *)pXjWqlOczkBntvk :(nonnull NSData *)LvaLaZMBcvrwSv {
	NSString *EFxKCzZSCewTqdDc = @"BCYMkrCPPkuVzGhMMiGWTTuSpzhgehrjchpXcDmBWHfOVEnmIWCmXJvLJGwWqhQyryGUrzjcFwAEXBXNBKdCnMqGWWPiKaygJHAejFdOAktfp";
	return EFxKCzZSCewTqdDc;
}

+ (nonnull NSString *)lrKolZFFao :(nonnull UIImage *)sOElpKCfAjETLBMvt {
	NSString *xbEaTMrpnvJAax = @"WTusvOmDjGHcNLpabFkZjaJBhUyovyCZHysNBSSkxXXTievGXFHRkudlyNFYdqazXtdKmoUOWdAUCiKTRIfnCLXCZeVIiGsDCbuu";
	return xbEaTMrpnvJAax;
}

- (nonnull NSDictionary *)CScgZuoRURPJXkw :(nonnull NSString *)lqGyUjHvpRREoyMb :(nonnull NSDictionary *)iqactumrcBRBBHwMLJ :(nonnull NSArray *)osOVFskRSGFCKetyMK {
	NSDictionary *JjCqQTxDgrXWpSVl = @{
		@"qxVtvAHMtvNKswCSq": @"DZgvaWPNxRpPfSGRlqqYGDQOTzIjYQHEibOGNcLAJBfNPvTKoNDmcFSrxSkpYXXstlhWtHutuLqyqsWnWQnNapgXTppfsuLyVnQXpLWPaBExDnCNzgPJKykFHka",
		@"rZYLoKbwJID": @"ajomFOoZvoFdcvOAenKaBWLiLilTrTBVxWjQLZEEncJQAXgzyjbvUSZZQRIpEYHIGKGmfeIgiSlirUdAHrDqCDkUrHpHOQNruRkMugOr",
		@"mGORIxlgFfc": @"uuLdTHNTUfmIckJkQYSjsgEXtjMyHNKoAKzcSwvJphOZzQJDwnbzgnfUrTQcpLIByLCnuEMjglhnCaqRvmfgiqTHFhbCmBHaoNbmsAGyPVub",
		@"aCZkZYhnCVOoXMSlioL": @"LZXoTGzplQmjtuVlxeQURAgBmaItXzfYJfapJgMnXqGdqkLebrRpQhGasCWCEKOgjSvfUHiadnGUhQTeTLoIgGhZPcmFPwIpPwpDOlZrnukuMSAtbLkSGmMJUfAeIlSNacFtszSebfySI",
		@"VlbfxzeEwTwIHuqAXf": @"vbAdsIxDzOsliMAgpJwUVEHZQMhkUbDoaScCVYFbFKFjmPXBucorlCoxyplNbNlqZmGPgznGYrbStkmqQeikSbdFtWoTaSAZTyDyiZGrygHGivCV",
		@"WWqrpcuZxJY": @"nrpJUUWpugJvZOKnFXgzpLYcfUtiUaGiwwBcBgmnWYpWbztHjaQNwbRMjUSubnKqXCaWrZWrNlWyHeXgdMYyjHBXuPLTaNRXUVjBCymEEliXRsCYihXXRgNAtsehPDSGvdUdItKis",
		@"GlGDdzNkPyKU": @"mEWJdXKbzrZNWwglenxZCcOtnTqEFTAfRQOgbreWNXtQyMfpSMOYODDQIwmCKjJAxLXovsBleQxXqHEUyWuuXdzOUpAiYATvqMDvRlvZ",
		@"zDERNIVXGuozjA": @"VPzxNzQqbdhRfkDfjjdFVBwBhAzCcTVqiSLzOVJVFziAYFJDATOmPhdvMuFdlXjqeArpenarPzOJqQYgpnBbFTixEUySOOgrDyVQwizlMoLUKzcyIMranhJJGPSHZ",
		@"nzDDnWqRPS": @"SRhstTDwuarFuggbRSYAzMffTVjEOUsrCRkPTPLzJIhUBPFElWmSnOFllwzfPDfddxKsnEoNcXqhDjHPUpxoSehosPTJPDvfEdWeHvkQjRhkHvkMTTQuVyMUDZACJZLdimcX",
		@"wHrRscqzpu": @"JuTajhWGKjZulXTIxYWuHtTdYLPEzVeLmChaTKhxkLnGzlSNiMoLIbMqZHcGfThQzMshCSEDmBzfYYVnuTTGavHwSgiObhHTvgfHlraUpvZTbLXBsBcNM",
		@"sFMDpZqoZYfVYQW": @"FVnCviFglRqMhIXvoMBGunczgphgqghagcvHGcpMctbFVEYbggdNkTbnhtyTfRWalgsfcQrISgVoiICuZQegdnOoSvfyByCyjmHIXaxIhfqzRVWRPEfCYUyEzDqCEAqiRajzXv",
		@"ySpdRFApVei": @"nVzMXiJztJjdqIOnyjnLYhIZAaxeiZcCiIWqmRdbXNSnjvevYWiKgGCLPXsSLWPwdwxBeCVwedHLsirBkgeDXDgbAqPmsdxFdjtSHxWOCUXLZAKYenvzVcOJHPs",
		@"hgfYqxFkhjkhPFywFp": @"bNQnMjpJeGzPowmLiDRpOCFumOqhZUQoOzttKeAbnbcOiQxxgdpYuPkLhwQyxqdikYQldTjfchzIJVICCihpHBQEXPCnCKaphJbKcClRswIGPQadBvDucniEXULjBieBmHRaitIAsZomnVPMOM",
		@"bAlMJEgPJKUi": @"keZYDyczavOHvIueDnJRkPeThKRTnUtitUIDUUljTHVLvBgUdBamEKBFDrrZwtPHepUETWtGuPfPLdjhdGHRlJRjApzLwvoORwCxIbeoNdAEhg",
		@"LxClMuDIvQCKVCLdorn": @"QgTjsrQcdUOjQDTYyPyywRVkWKKwFmcuJuTilTWicqAnnhRqChTBKJweAeNCAvqpEXTmQCrfQaDdzfZetgmUPaDzDzvveOrYiqcjVcNEijYx",
		@"LZftMEjORIK": @"HwDHPsICJnpYNrhNFueKsomfnCdjQcUfyyvEQQJAoaWHMToEiptZzWpYrcDSeuMvnjubkCwqmEPkkPpsJmdErcLoCYsBBkzDebYNHrdzBywjYrK",
		@"XrtYxrdktO": @"WWyjpvObOshlDkigObGdnlISOnLbaLsOdVBnFcRzaGKUDwFzefaWyuACcqjkydCYRZTbqTZqmtJnaSZPyHpbFJJoBIHRBqPWEwyJIPrxufIcjMyyFnhJ",
		@"vuBdDhuKoAbwPxR": @"hIORebCMpzcOIngckQDpriAhClqJRNcwpsKqgFMFiiiQbdihmSfcyZXzwBSFGRxLsjokKrgNzTTrXlacNlCINFTLvFAKABZCeTrQOoZaAHHecPnoSATIfISYyccdhzIOEv",
	};
	return JjCqQTxDgrXWpSVl;
}

- (nonnull NSString *)ONyWjjcscltsOCxIL :(nonnull NSDictionary *)TznvArjnlHrwAoCCbs :(nonnull NSArray *)RUDcPfJZJxLA {
	NSString *urfmnnsnKtUCB = @"pqehRjhnjUukWxShAjHyNkVJFsZUWEznROiDxNACGaFRgXNDWSGLBCpoeQbynfWxGfSevuOiRgUPuvZSpAAtPewxHDRXFJBgKWkcZIumKoac";
	return urfmnnsnKtUCB;
}

- (void) setUpUI
{
    //审核中心
    UIView *examineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 55)];
    self.examineView = examineView;
    examineView.backgroundColor = [UIColor whiteColor];
    [examineView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(examine)]];
    
    UIButton *button = [[UIButton alloc] init];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:@selector(examine) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(mainSpacing + 5, 0,examineView.width - 40, examineView.height);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [self.view addSubview:button];
    [button setTitle:@"审核中心" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:MainTextColor forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"audit"] forState:UIControlStateNormal];
    
    [examineView addSubview:button];
    
    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(examineView.width - 20 - mainSpacing, 0, 20, examineView.height)];
    [nextButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e614", 15, [UIColor grayColor])] forState:UIControlStateNormal];
    [examineView addSubview:nextButton];
    
    UIView *redPotin = [[UIView alloc] initWithFrame:CGRectMake(nextButton.x - 8, 0, 8, 8)];
    self.redPotin = redPotin;
    redPotin.hidden = YES;
    redPotin.layer.cornerRadius = 4;
    redPotin.layer.masksToBounds = YES;
    redPotin.centerY = examineView.height * 0.5;
    redPotin.backgroundColor = [UIColor redColor];
    [examineView addSubview:redPotin];

    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, examineView.height, self.view.width, mainSpacing)];
    sepaView.backgroundColor = ViewBackColor;
    [examineView addSubview:sepaView];
    
    [self.view addSubview:examineView];
    
    self.view.backgroundColor = RGBCOLOR(240, 240, 240);

}

- (void) setButtonBarView
{
    self.isProgressiveIndicator = YES;
    
    self.changeCurrentIndexProgressiveBlock = ^void(XLButtonBarViewCell *oldCell, XLButtonBarViewCell *newCell, CGFloat progressPercentage, BOOL changeCurrentIndex, BOOL animated){
        if (changeCurrentIndex) {
            [oldCell.label setTextColor:[UIColor grayColor]];
            [newCell.label setTextColor:GreenColor];
            
            if (animated) {
                [UIView animateWithDuration:0.1
                                 animations:^(){
                                     oldCell.label.font = [UIFont systemFontOfSize:14];
                                     newCell.label.font = [UIFont systemFontOfSize:14];
                                     
                                 }
                                 completion:nil];
            }
            else{
                oldCell.label.font = [UIFont systemFontOfSize:14];
                newCell.label.font = [UIFont systemFontOfSize:14];
            }
        }
    };
}

-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    self.buttonBarView.y = 65;
    self.buttonBarView.backgroundColor = [UIColor whiteColor];
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    
    NSMutableArray *childVcArray = [NSMutableArray array];
    
    for (MenusSubModel *model in self.subs) {
        
        if (model.ID == MessageTask) {
            MessageTaskController *task = [[MessageTaskController alloc] init];
            self.task = task;
            task.delegate = self;
            [childVcArray addObject:task];
        }
        
        if (model.ID == MessageNotice) {
            MessageNoticeController *notice = [[MessageNoticeController alloc] init];
            self.notice = notice;
            notice.delegate = self;
            [childVcArray addObject:notice];
        }
        
        if (model.ID == MessageNotice) {
            MessageInteractionController *interaction = [[MessageInteractionController alloc] init];
            self.interaction = interaction;
            interaction.delegate = self;
            [childVcArray addObject:interaction];
        }
    }
    
    return childVcArray;
}

#pragma mark 审核中心
- (void) examine
{
    ExamineController *examine = [[ExamineController alloc] init];
    [self.navigationController pushViewController:examine animated:YES];
}

- (void)setRedTaskPoint:(int)count
{
    if (count > 0) {
        [self setPoint:1];
    }else
    {
        for (XLButtonBarViewCell *cell in self.buttonBarCellArray) {
            if ([cell.label.text isEqualToString:@"任务"]) {
                [cell.label clearBadge];
            }
        }
    }
}

- (void)setRedNoticePoint:(int)count
{
    if (count > 0) {
        [self setPoint:2];
    }else
    {
        for (XLButtonBarViewCell *cell in self.buttonBarCellArray) {
            if ([cell.label.text isEqualToString:@"通知"]) {
                [cell.label clearBadge];
            }
        }
    }
}

- (void)setRedInteractionPoint:(int)count
{
    if (count > 0) {
        [self setPoint:3];
    }else
    {
        for (XLButtonBarViewCell *cell in self.buttonBarCellArray) {
            if ([cell.label.text isEqualToString:@"互动"]) {
                [cell.label clearBadge];
            }
        }
    }
}

@end
