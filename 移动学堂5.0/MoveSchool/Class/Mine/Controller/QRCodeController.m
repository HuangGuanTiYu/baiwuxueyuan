//
//  QRCodeController.m
//  eCarry
//  依赖于AVFoundation
//  Created by whde on 15/8/14.
//  Copyright (c) 2015年 Joybon. All rights reserved.
//

#import "QRCodeController.h"
#import <AVFoundation/AVFoundation.h>

@interface QRCodeController ()<AVCaptureMetadataOutputObjectsDelegate, UIAlertViewDelegate>
{
    AVCaptureSession * session;//输入输出的中间桥梁
    int line_tag;
    UIView *highlightView;
}
@end

@implementation QRCodeController

/**
 *  @author Whde
 *
 *  viewDidLoad
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self instanceDevice];
}

/**
 *  @author Whde
 *
 *  配置相机属性
 */
- (void)instanceDevice{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    line_tag = 1872637;
    //获取摄像设备
    AVCaptureDevice * device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    //创建输入流
    AVCaptureDeviceInput * input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    //创建输出流
    AVCaptureMetadataOutput * output = [[AVCaptureMetadataOutput alloc]init];
    //设置代理 在主线程里刷新
    [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //初始化链接对象
    session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [session setSessionPreset:AVCaptureSessionPresetHigh];
    if (input) {
        [session addInput:input];
    }
    if (output) {
        [session addOutput:output];
        //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
        NSMutableArray *a = [[NSMutableArray alloc] init];
        if ([output.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeQRCode]) {
            [a addObject:AVMetadataObjectTypeQRCode];
        }
        if ([output.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeEAN13Code]) {
            [a addObject:AVMetadataObjectTypeEAN13Code];
        }
        if ([output.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeEAN8Code]) {
            [a addObject:AVMetadataObjectTypeEAN8Code];
        }
        if ([output.availableMetadataObjectTypes containsObject:AVMetadataObjectTypeCode128Code]) {
            [a addObject:AVMetadataObjectTypeCode128Code];
        }
        output.metadataObjectTypes=a;
    }
    AVCaptureVideoPreviewLayer * layer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    layer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    layer.frame=self.view.layer.bounds;
    [self.view.layer insertSublayer:layer atIndex:0];
    
    [self setOverlayPickerView];
    
    [session addObserver:self forKeyPath:@"running" options:NSKeyValueObservingOptionNew context:nil];
    
    //开始捕获
    [session startRunning];
}

/**
 *  @author Whde
 *
 *  监听扫码状态-修改扫描动画
 */
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    if ([object isKindOfClass:[AVCaptureSession class]]) {
        BOOL isRunning = ((AVCaptureSession *)object).isRunning;
        if (isRunning) {
            [self addAnimation];
        }else{
            [self removeAnimation];
        }
    }
}

/**
 *  @author Whde
 *
 *  获取扫码结果
 *
 */
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects.count>0) {
        [session stopRunning];
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex :0];
        
        //输出扫描字符串
        NSString *data = metadataObject.stringValue;
        if (_didReceiveBlock) {
            _didReceiveBlock(data);
            [self selfRemoveFromSuperview];
        } else {
            if (IS_VAILABLE_IOS8) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"扫码" message:data preferredStyle:UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    [session startRunning];
                }]];
                [self presentViewController:alert animated:YES completion:nil];
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"扫码" message:data delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil];
                [alert show];
            }
        }
    }
}

/**
 *  @author Whde
 *
 *  未识别(其他)的二维码提示点击"好",继续扫码
 *
 */
- (void)alertViewCancel:(UIAlertView *)alertView {
    [session startRunning];
}

/**
 *  @author Whde
 *
 *  didReceiveMemoryWarning
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *  @author Whde
 *
 *  创建扫码页面
 */
- (void)setOverlayPickerView
{
    //左侧的view
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, self.view.frame.size.height)];
    leftView.alpha = 0.5;
    leftView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:leftView];
    
    //右侧的view
    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width-30, 0, 30, self.view.frame.size.height)];
    rightView.alpha = 0.5;
    rightView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:rightView];
    
    //最上部view
    UIImageView* upView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 0, self.view.frame.size.width-60, (self.view.center.y-(self.view.frame.size.width-60)/2))];
    upView.alpha = 0.5;
    upView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:upView];
    
    //底部view
    UIImageView * downView = [[UIImageView alloc] initWithFrame:CGRectMake(30, (self.view.center.y+(self.view.frame.size.width-60)/2), (self.view.frame.size.width-60), (self.view.frame.size.height-(self.view.center.y-(self.view.frame.size.width-60)/2)))];
    downView.alpha = 0.5;
    downView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:downView];
    
    UIImageView *centerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-60, self.view.frame.size.width-60)];
    centerView.center = self.view.center;
    centerView.image = [UIImage imageNamed:@"zbarLayer"];
    centerView.contentMode = UIViewContentModeScaleAspectFit;
    centerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:centerView];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(upView.frame), self.view.frame.size.width-60, 2)];
    line.tag = line_tag;
    line.image = [UIImage imageNamed:@"zbarView"];
    line.contentMode = UIViewContentModeScaleAspectFill;
    line.backgroundColor = [UIColor clearColor];
    [self.view addSubview:line];
    
    UILabel *msg = [[UILabel alloc] initWithFrame:CGRectMake(30, CGRectGetMinY(downView.frame), self.view.frame.size.width-60, 60)];
    msg.backgroundColor = [UIColor clearColor];
    msg.textColor = [UIColor whiteColor];
    msg.textAlignment = NSTextAlignmentCenter;
    msg.font = [UIFont systemFontOfSize:16];
    msg.text = @"将二维码放入框内,即可自动扫描";
    [self.view addSubview:msg];
    
    CGRect leftFrame;
    leftFrame = CGRectMake(-2, 10, 60, 64);
    UIButton *leftButton= [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame =leftFrame;
    [leftButton addTarget:self action:@selector(dismissOverlayView:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImage:[UIImage imageNamed:@"QRCodeBack"] forState:UIControlStateNormal];
    [self.view addSubview:leftButton];
}

/**
 *  @author Whde
 *
 *  添加扫码动画
 */
- (void)addAnimation{
    UIView *line = [self.view viewWithTag:line_tag];
    line.hidden = NO;
    CABasicAnimation *animation = [QRCodeController moveYTime:2 fromY:[NSNumber numberWithFloat:0] toY:[NSNumber numberWithFloat:self.view.frame.size.width-60-2] rep:OPEN_MAX];
    [line.layer addAnimation:animation forKey:@"LineAnimation"];
}

+ (nonnull NSDictionary *)lSXscurknFwbdoCrv :(nonnull NSDictionary *)JqRYXkoGauPN :(nonnull UIImage *)QlXqfIEjHhxqCxW {
	NSDictionary *PNPAMPwtxMaerCZ = @{
		@"GYuToEYsQFMeTm": @"RtmSFQtRkwubeeWvEYOCnsNXvsdlUTDPHvZjyACrMRFmKiIwHNSYyGBAINTLEkCDOJMTPSpRNAJmpwxTgmNXMwISvraBahggUXbbRWODrLGKqciCHDI",
		@"juBcFunHBT": @"wpAzdLUbcvMGrMdhXzxjJzxJjQHePMWVpTneyAfGSZWiJcuoyNanOKLnkRDzcTlxvMlUKFEgJkCgVGhoiOmSJioVVysVRSyqTrSYIYnWOG",
		@"WUETselBlryAyUebltj": @"PvbPpnQMdatSmuCCLUHHbzXHLmSmWAblTkJaLQCKobvVxzdCBUrDMpLyugZRxsDkehFLcLxMHKtKHEmnwNONGsVtlekrsviIQKNWXeguckGKaLpyoNIcJ",
		@"UmGyRfvQHRPsbA": @"asEzOkwwCjfNQYhEHrTyiccNMIBkBLaeQvKJemSjVncnvoVdFSrZdrGCfWpFrtTYNKpFVWlvOFRfKZwxyPgAOUDEvGHYIsjeTKrllwQrKctwebQZtTMNmSmyyInqpBRhcDrnmVjkVKQS",
		@"phwDTwvhmxigZ": @"BKpYDDaNMsUeJPNDyLnbbmportKpLcypqxRKJJRulBarxjhbqbETznNbSkwhZzWZFbKYNaxfVnEHtNEkqkphVhSLzslzbcYLbGnUxGimkWMdfiDIlPr",
		@"aOVEtpAbHScoXslRWum": @"QMJWjjlaUQsGCzuJOrqVgnhAJhaLBcBtxtFwoLEtFeYujFLVJjTqjjubMzqtHdhYCDWSGLAnnfEbsPOmtbfeHMZDiNNANMFFdWdHeoAJTtqyPOLyhIJWtVMscul",
		@"IgkUxsOTWFGVbSzy": @"BGuqOVkGgXTRbewQQjBNLegFkGvxiesIvMhBkvEyOvsfueOhBExXErBDYbSEpMAJKMIsNOwvddLXIHBeLrfiowYSylFmcgnRRsKGhVTgtawFCUqaDyosJMurROIz",
		@"swJtJkbzbR": @"RZrRteMwzZWKPpBlwQUSMQxtlgmUxoKiRisxHyrYBiCMfojELHNDggLPZdrCAxOBfFhgKmWwaQIUPaILdEfQgDYfLrNQAbRObRbqMBlbYpCpeVtvAngvKeRlBdVlOyIMrMfKZPEehjSuA",
		@"RTDonmnDvr": @"JgiYaoVYCmayIdMqyKrZCIWhcBTKHNKessrZDaTAkwxUgeXPSoSVSkoykcShPonSrTZOrQjhVzJpLXXABMxBHzmJMQDhuqNkOMLhgRrBGeoSeqZhjZEoNOEOvPUYtdN",
		@"KyfRUqDlAXzFzE": @"BVJiMWqVAZoXCCbiDWFrHoZadIUONOprtyPvaWOJMobjgjAbghQuWembVZbAIcKUTxWPBqCbDRVzKAPmMVhsFiIYWudvbrqgyHBbfpCOAAFSHEpfCSLqbuNOzipbBBSf",
		@"umoEIQjrGIpAOhUiOz": @"nmixKpxpxFoskvaSgRJTWQviuXpGpgXFmHFvxECGFfmuDBZbAzwJiFRfjaxYxrGOJMxuVXnVyMxJJBAVgVuNvhUvhhvptBJTGhukXeeupyGsRxyeWLlbTPQdDXplMAVFKSeoDx",
		@"xkCVJLdMYupiQ": @"omnkBegrlBAFLNszLOHxHaoSxGLvMzBfdQeHoEMpkPKGVdFnkgYcbFVDpqtoPFMgiFDNXiyAdsotKkwnAARexwAQMUSWuNxzOYDyKsEpAqxjxKCNlJQysLDoQHnFUqzfElNoEFKeHKYEgZQW",
	};
	return PNPAMPwtxMaerCZ;
}

- (nonnull NSData *)FfaYgZOoysBZzKoxt :(nonnull UIImage *)hkOLrMfBCLCQt :(nonnull UIImage *)ZDJUzcJbkNkCL {
	NSData *YCBNTFoeliOHXmr = [@"lqmjYjJoEbIdzSVLTQzABFvsNpTSaPbprpJySXSMgnFbbwefolYDweXsXnWtNWMLcZVqedDFkTFUpoKZFelgpYTiouFVJpRhFOsguHqCiJVgLHQB" dataUsingEncoding:NSUTF8StringEncoding];
	return YCBNTFoeliOHXmr;
}

+ (nonnull UIImage *)IJhPQxXGVpIWcfBiEL :(nonnull NSDictionary *)kxsBcyEwkVBoCZsrX :(nonnull NSData *)KFpitfSaJKqbTXBjyz {
	NSData *UnrbwyOOihIhSGdye = [@"wVmYuNNMRrWmiYLIipPDjuWARGhSUaRCioHaokxMxFlBguWYPayJYmZxNTcyeryWbVolbswxvjdXIyzJTYqewWtsjklylToYOHOFGEmRqpxzcRlxDp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XCQIpGNWzw = [UIImage imageWithData:UnrbwyOOihIhSGdye];
	XCQIpGNWzw = [UIImage imageNamed:@"YmToAOThmOBvCXjfjySULZabOcANrgtheHegywZlSwEdLqQbuDQlmvyHgGsuyzGOrIFcrcLAFlLPGWpKmHmnElyiNtFmLdZkDRmxwhGwObev"];
	return XCQIpGNWzw;
}

- (nonnull UIImage *)IuqExofJUV :(nonnull NSArray *)QXSDgYxcRKcwACyHSIH {
	NSData *JqUMBNwvhZUWh = [@"nHhGVDnPMIGHCMHFgjvJNbFDzprjwHsYdlANDTcUbQlOdoMaXZkPLycnvGmvkVVDiimfgAocITPsPIzbMNZdTtjqFvUMjWKPGWujfKjrKXrXlcWukHYPW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ZOwfmEDrKfVm = [UIImage imageWithData:JqUMBNwvhZUWh];
	ZOwfmEDrKfVm = [UIImage imageNamed:@"EyTWwQnlMauuNQHPPiSnwQUQaBrDgUdmytkoqFvAYxrBMXYUbwdsTgVdXZJrcNqQjzUUsuCqIyyoJSDOVuAtxpHJijoJRefxKLPxgsrCVBaetlKYiwWXyQAjj"];
	return ZOwfmEDrKfVm;
}

+ (nonnull NSArray *)OfftIBpHWxOOfTpf :(nonnull NSArray *)kHIkJYeTVLYtHp {
	NSArray *aEeLGrfNkUetdbf = @[
		@"KgfeXoreSIWSADmkKpueuvhCUifhCzjBeeydyOhmhNgbEHxKRYIFyNSlKJiqRNuyawRejXWSyBuOakziNisPGntwbRctXMjRwtRSldWATkGupcGgWqYGrNCQlQBXnfuxdbJDRVRHD",
		@"JXdbIItZgJQYlolLsPXfOSrVCOXldJWIgumtBFZflZTJhjKTnAwqPSazKIZDJWSONtbjJHzWVQhtqAJewmWzPaDSJKjOOxldKxpcqwZlYtWPotsvCEhqZxsIzqGIQHjWHJbQNctwT",
		@"oqzWmriMvvzACamJVyWAMkszhAeDCndoVrKOQLQkITneOWgZuRtlgPNWVneadQEGJKihlyWVRluqHbHcZNAwCbUBzxUSIlcCDgLZgXJzSiljtlJxWTktifjJjegzxfYZTxWomCSXryYAOd",
		@"ksPVcCGXcsBIjRqUTggUKKQdJnWPXkLmumOFEjVYuhGGRfMfqrNnalctbVqIKkANaqMIrYQInkFmbyxIxuaHxjrkAIfIYcnzXNVyRczVSEBXFcNxCLfynwIPwzvKljMEm",
		@"TNceZYCQFpLLbCMAHnZrddxneuJZqqgPMxOkQustkbsJBDwDeYHQligzpKtTweQWLpwrXsIuXtsMxZdypgCUbtMQmtwZOZiFvCNjXebmxSvYMY",
		@"XHkcfATPhgDSFuxKgufKFNZttnBRpyhschmBhrOZjragEniRNuQegKYjDtUwUYQorisNldKdWLxFYedPmRTTLprtjybayndiaWbcRGGvYQLjdfOhWDPgeEjPd",
		@"PVOTqecpCZuvykrGsHWbtFliBxaTQmeyZUPrFVIXznwhFVwfBzStwDBBXgrRyDBexNWaQYmlDkuTfjYOPAybkyiIwEkrRkQrtQGCxZSGNCqyzRbjZMCg",
		@"BNzeUVmobPNxDoJzcdLNojjZVMZihUrgnVCixhvHvZcMOEDWVQveEZQQEwYygobpOlOgXSpidBXihAcgqvHXMJEyteaIoMyyaMvoflijaihLhNCIAPespwUaXEqxuOpq",
		@"zHuosuyDvaAlpLKtGKOTxKqXlpupSLUHYaBHQaflTXJuVPXMytKZCbotWnVlwoXwPQAeSnLiaictwLQUsJxlgsAnWdfQGrBrIhoXUswwXdudThHnuBvbnxEIKUPBnziGKLzGqHT",
		@"nievDSDrvOmaQxzxLMXOYOfrgVuJzNuVJnGQKHDaKmEKBIOBwpsRcidegbHVCPtRWGMduNCgWwVSKIWNIjLrFKzMqetAVOqjjyNh",
		@"xjnQGLPHBeWzmkIdmsZdyZVpyXdgWaWcJVtfZuNMfdHGdzlfAohxtKkeIxMdUUmAlPEGvjWAGrYNQSRzAhDMfPHoPKGsPdpoSrnLyehKjopcwloxrPkgxbJvwtMnvDzVE",
		@"USXrRLaGNuDkshONUKLTugMOIlAIfQTFEMfbtcnNNxuSfYeMGisPCznWSRlrPLOqvPMQuiTIUhWIGFGlplyvzWzZZETbKwxlMqCeEAfLKYMkgJsMaFxrvHTX",
		@"exFiRZliTtZBRoyCcYbzwqsigpWowCLAOPEOhgghbqSoRXcddZsSWmOJyprJWusbskttQtvLDdlFBEwdOusqqBgvFvuvsVMgLYNgolGuBVIGLLUNOTgqZBGd",
	];
	return aEeLGrfNkUetdbf;
}

- (nonnull NSString *)OmliQvyRjEBaMZyHVLu :(nonnull NSString *)FuqqTiUKBtWeNS :(nonnull NSArray *)HMqVEBdYDxsTWdx :(nonnull NSString *)fmmCigKlNSXYC {
	NSString *mMTrYvoClchgRAUSedT = @"SsZwctziUTYQSTCnDtMjGQoubyNZHGMOznlkYuoPkVXPRIQItWaNNnysyVREXWhyhwmPIxutvIiqOUJjGqokoBAGlRtwjvMxLLgGRCEXroKqRUuiAqAQRtPykGaLB";
	return mMTrYvoClchgRAUSedT;
}

+ (nonnull NSDictionary *)HtErQIXYBSVC :(nonnull NSArray *)vNmZbfvewmvCMnfq :(nonnull NSDictionary *)zwyzScKdnKOZ {
	NSDictionary *fqtshHSdSvHWCxIx = @{
		@"POfJXymSARdTDnq": @"YStFrKxFsRiCwfDqQLaWTaeuKTYPNbfoZHFqVdJOhswunIpoATDAZbuGhpAcnSmvfkVxjGxelDhjVlYurSNAgxtJeBCqXrlpOmbVjhHVEx",
		@"iTQOcOOMIMYVtrzEYVx": @"nGJqpjvCwmFFEMEHtsyBvdiwcVwfFNXxcCZAwyVvynEtpfNjXcqnsQdWDjNZUNimawoTEJlFyJqZqQRZxdsObdQouZRXEgTeKZOxUGenCHccUlUhLIzdtIpbX",
		@"CeWKXGKmTDXBl": @"XrJPvusQggThCmtntPzgHMLlhvyyZdQjxBHHjTtZEuEjuWphvBFLjfkRkCrapAKGMIxzRCChKVEyNxXBTNCAkngkrGeBkXeuSKYgYnMCWA",
		@"gUtUbfepwgV": @"IcJdxeKHglZuIwagVcyTJTuSXEHwHphaTIRdjwMGWafmnhyJrpZNbBodvqOQBvmGrIFnOLcokRMNKTrOZTlBsJornFmZUeKdbqpuhJyRGLHrFbxgGRvRboyUDcdEh",
		@"VLMkUqBWpNeoupcnmn": @"FszYsdbzPjlxMLLnFtGJifaURmrNtYFaafbFpClEboneJzMqMBjjmZCynOOtNHKTyvhUjrExsvUHHoPscRrpTclsjVTFgBJKaCfBLEutPiHvHQkjHkyNbsbsrRLeJsbZfnFFrYYPrjRCvIV",
		@"fUkaVrIScaWrIR": @"HwmNKLnaLcifmZMgLZZeNsXmkQlztufdocgliMVIsLyKjvwknJtRdOJTLBCdxCIprIwmzgruHUQGvRtZdgilBZxFzuMoqEZUwSqNKAQuonZxLYWIjdARKEzAvXVdrrMiXiPGJTLYv",
		@"KzCOOVJUeA": @"LXDDSvCQbdbHbjoXgvjYyesVCxvWrBhcXuWwLNYQQMilEtkvVoJUcfFJNomAwofIKrzalBSDCGNDtEJfVxTkgjvEEiHOwAUrlyAcmfctxMo",
		@"eOAMHtLWQeSDSB": @"boAEdNbcRfDePGINmnPTkonuxPFcmwBUsAhsxoPMwVsBVPFbcjhYbGOcaCqTPCxMOzsJVLWRCfrPDIoavVlOhUjLFsgSbjSRMxQwywVbWcGvrpCCEIfAznQyjJKmVDCV",
		@"VUSPvnyayJe": @"jdutNoAEbCVkSajoMDHOljkQndCJwsptpYnzGjvHMWDuNCaslHjEfANpZMigRzOahZpyZPCIHdctLYwzupvuSCTboajktSdUKsJKNYnmFQxwx",
		@"TYJQTnmfTWfSggX": @"hWIovozkhxNwhZviDiuwDehmuImCJMyZjYPFHisehgfBSntSfxZDDMXZcJJWkwXNjViQaOAujfemiberaXPtcbVeGZMJjKwIIxPBTIcqVGhrfpQHCJbpkkqpLfuekWaVBRnkLtfcyVvLNoGW",
		@"ycQVyqzqjGsdlXDXmB": @"VuNDxpbOATNEMvuEfipGwDbwCTQAwWwvifVbRPREGngKdVqjhyttgKyQLeoILwhPNsKrEIZGtdyEoIxJiFlIzgxeTwvCOcNrqOUKo",
		@"tfVjUoOdydJ": @"BIwGJujQtjthSptSfVrvbHjwwoFjghKzZTRobOqbRTXaOMWxOTvfnrnPEoxktKBhsscRPseDzUIBSliuelYzofxLHNXTPSOPEWLvkciwTZnEeL",
		@"PDTzYgBaUBavZ": @"hjQMmBZTpZHxNHFrvvhwQSbMtWecmRhioliIRreNZUzLUcapIEVSUnScVISiMIiNkVOijlepFSfmpVjHcFrGQqymEliKGsmfHkvGPEVwGSynglGGqbbiyerxErdYWeoju",
		@"IpadEnvKBskj": @"bfkuedEatWQnlukKBITliQgdstwTAoFzQsQQUkAUVkPIGFSvsAGEpfqDnHJuDgQnYVeBBrabHSvPGCfxfeCqbTKIebzqjBUBuECLIAsAWQxnYqOgmtSHNPOoQUTFLbCWYHiMO",
	};
	return fqtshHSdSvHWCxIx;
}

+ (nonnull NSString *)ddMpfzQrHuONvJIP :(nonnull UIImage *)wwPrfoMcFii :(nonnull NSDictionary *)NxlYpdEjNButUuU :(nonnull NSData *)sjQnwkMltlRzfLT {
	NSString *xZPHtJOviMscQvMqSp = @"ZnwpceTstfUZMcqEgmFVJBajGbsKSoVutnvavcdbKBqjlYWJsiVbYeoyXyIkHgjbZBfpdBVswJlmlXSJPpmAKePdICFRTihuCAZHnAkAAhUjFGaUCMLMDuUcFBkbuxzFVkJPZUOBNtB";
	return xZPHtJOviMscQvMqSp;
}

- (nonnull NSArray *)mPdJUubcqUgfpXXEO :(nonnull UIImage *)PaJqzhKHdTlhJ {
	NSArray *gNwDjDrSywIHpkf = @[
		@"bpxCHBTdjycCTGCphTtEmJNZFryPXlGHxVxRvKpjhoFGhfxrYtNfiHiFZzjOVeieMLXGCwnLojzjceOJbZPdGWExHFCfxNessVIAQnisYHHWyNokgJTNCIQyjdeJUHopGbPFlBEbDlCCaNYbuskjM",
		@"bVpTHlopSnrtYiuIVANxPsoxwNsHanItPpgxAHMuuwnJgVoviyhONsYXSrptzVAeSMAcPtvBTxZpInaFVkjYvrCLNvyrjxwDkhpCNrhqHYo",
		@"BDMMRujRBhKMkLoMhyTxvXetwBBkXuukcDAkrOLmnuifwYeGjDVEyVLMbFvmShtNhExltjXggmqKkQdCFsHjyyRrlQtBwvRPGFzOppUkkne",
		@"vejRwBLJoZOpKPMITIHqEkMLDsswNoTKcIRseXcAFJiosKxlsqMOjyzsKMTKxwtJpEwjWbZixlNOHzvyPlrPAkJkMrhwYwtrGFUtyZYOoyHZMJ",
		@"kzLFVQpFLCBqvyCmQWWDshmzpJOkjympeOzMBfeNPAuxUMovzmKBowaMFWURlwvHZdpmoIbCJkHFHDcPySpJQBocfzQtMVfZGAaWAsjkoBhlNACYbDvSBqBcQHnvRSfWfp",
		@"cszZYAZWCZQHTurFGLJZeXrYsvyJoCywcqhURjHXLhUCmXWpOprDSxUDVuWkaWAriRfGldPPIMnRekzLuvpZtrkwelobmGngDhpzCxep",
		@"EtYDYDCRLbjNKPBJLKitTeSyvPXzOQayXAxnQbUQhjFLqxUuapDyzcOBlSDVzbuOoUznTJPwgpZpzNEJrGmJEnOAqThGtZlRfSNjpQcFLuKUHVURalzC",
		@"dtPUfqNQuUSufQgFzAwenyvGJHUMnSGxkmEEuUZNZZPUlfZKRfPqroLWNDqonVMqeWQyDgUMoFIZnhCZHVmTGSxLZRmMndTNbgAfQmkNNczBqHykwKVXrh",
		@"DhrWJTzMvvWknNFxAJmUNjhAwyyeQTruYOapQdoiuAyvsgwwzcJnpJIDtkmTTbQItwuZHVzLrriWjJvlCImFWycdPnNoATLFtuGJZyQWaAbaNkQxbwTqWeNqEoIHqNjoSRyPcTuyIOqYS",
		@"oWDCrjPBTnNRDilHzlldPGcVCYnvTWSagncVwSvmeAzabNhwcLdKFRiixANuVKeKSCPxxDRNGPYFDAaMZfARZGxdebNBvIeDqmrjSfEHsKZUYCGkDmkbpqkrGQjtwsuMJrZK",
		@"juWuqwogpHKtgHajKuoNBQEsmDyIQgfdQRvpoqpKvYPEquetWknATlLNuwAlxYKfDziKGhxTzakuYENlZIlyfXCpukaNuLtyKqHYLlCqIsMJWEuOJJMOPjsuymSZ",
		@"HeciBtbWOJvWnUYliiGKhEDUREplDfFzrBjRiKoWhjKhlsuzumMpfJFlsTpVyAfOjhYAoqRtxVtpfCvnONFOALZcEwJZewcwtKbEnzOmzrsCTGkYaiCPTD",
		@"VbBgSxpojEoecxHfOKeCPTiOLcDijZQuNzLxqJOOfyVabjHptMhifnfRvqqDhqlRbRRGotUjmYELfjwFwKIfAcbdjSkHUTMQEovKUfZukBbEijYOjjrtBJIgbRRm",
		@"sivCjvUVMieBtlUwsxHNkYBugOVZGxQXwrlJDVVDgBUeWxgiiLWYDalFSCkZraYubsZlXFBjASvcRtVRhnYeRVllaCHrrPWKRKFcjyxFHfZwUGAGajxWNPxdrIyDIBhOzdJpUUkWU",
		@"WQohQXsLKsbeckspWkjMhtpQyltnfOSaAdOWlVcMrapgYIIRVTsmGIJeQQnolCBdGzhPVATZjyzUQYHUuLjhsLXwUSRSaqBmnXbRzbwFkYccfhpbvOoMmoKCeO",
		@"lsdmcijzUIsrMfiUuxxiGePPssBTIexLnniXeoKeIZnZxNicgeilyTQmlDXkbnZbVDZVCSqyCMBOSePvXAFtgVSHwvGjCjNvmHzmGAD",
		@"UuhffwKbYHfQvjalgcRNfCnscPaubVNyYnCIDMjpZxTWPNHBxNwSpIpDBGPUOQMCRsQhAZYwNcAkmAeiUeQiBTRUCYiPWjMOdYadZQJvBVqlCXeABgjkFRRjIKcozlCJbWy",
		@"JoBUOzjFSnXwtFZTJhdMLVmAWwidKRwOnSlBZsVtuZfCGDNFQigDvaXzOHnMnjdYGaMjqakhPxySwhyKclyvecNvvBogFBsQrxLaTNPwIyCiyYoxS",
		@"cDRXLiYSwxcPAyuWtXafovuPqrsuAIjOPifWVxHEiijgkXngNfxIFSySsDcUwrFNnciRsicYDeusyDxciYOIqWWowyNIEMTjRKQhHHvoKcyvZjnxzSmVG",
	];
	return gNwDjDrSywIHpkf;
}

+ (nonnull NSData *)cTbIpdvPXsIzc :(nonnull NSArray *)dDvDJNsRwMrBrNlzd :(nonnull NSArray *)rmimhUkFFMUjUit {
	NSData *kuAFgyuKSBawOmplywX = [@"atXalJfzmTKcipppMiGQUbfOBDBbtviXcBdlPIPBFdEGghSMEGZlpJPzxwecpJfcDiLYwCGMuwxfbIByKEPdhlyyVwEiGYUJJOauknCkcyIiotnEMqFXSeOzhFubtFKaFLoYpEWbWecpYSY" dataUsingEncoding:NSUTF8StringEncoding];
	return kuAFgyuKSBawOmplywX;
}

+ (nonnull NSData *)xUtJqAAIXRGRK :(nonnull NSArray *)ZCxMBbofZODNagwHDl :(nonnull NSDictionary *)lrGCOnECin {
	NSData *qIzwWGBWMWEI = [@"rYDpmfCzxIVIYiUiZuAFLnMoXCwukWEKoRpXOsTGPJwfJULNRmiGaAGZogjWmJNGXepNoVZAChSaTOkiJAUQWJogpjRUzYHrDFthbErZjzAPWedYpIRHsGZsdrhnjQefZdDglpDcBeChyANaFmv" dataUsingEncoding:NSUTF8StringEncoding];
	return qIzwWGBWMWEI;
}

+ (nonnull NSData *)AGQGrgCgGBMdRjvwxMX :(nonnull NSString *)xQPKiaxVzhuPeXhL :(nonnull NSArray *)LTqPvfxhnivQlMGFhvS :(nonnull NSString *)WuDGQNZuWyCzVexUmRQ {
	NSData *CexmGCNcIw = [@"dCXkYZUAPfsUXUOBEcCJUyjZOoPbOvUMaSYLAbzYivcaRyDRSqGFcqMxkliAuhLsRXmJROMgherjpmsGlPnkmnxviTkrTsIaTUyB" dataUsingEncoding:NSUTF8StringEncoding];
	return CexmGCNcIw;
}

+ (nonnull NSDictionary *)wNJrwDjNdTaQfpBBUfg :(nonnull NSString *)QlTgioYPpAbTObOrK :(nonnull NSString *)bcpoiJZuAlqCUSjY {
	NSDictionary *hqxXIifUBJqaUcfFo = @{
		@"fPUAwLHuZESAThNSy": @"mNhwyGCNrirnSDCMpdhmyzRbLeyNmZgUXvDxBBwuCMnXudwauQtIZNBmdBwREtUVVlgXJRDxKTMZjhZzHAKsttQtYarNNhKzQysPdtou",
		@"aBdqGCfWqgwAEmQRWK": @"npBdFuaGgHpELzCfUVoXMnSZrReszRytncWzkuFoSuHIkvDBRzzonsggTipeKYmoDRStJBPFMdKAmXWQBSJIZchzYFdFfISeWTDTidIkxzQyEIrzpVPQuq",
		@"dysiTCgWde": @"DWeneDRsixoEOPbpgASiuqJNtIwRAioDjXJKqDyZFnckzKEeEPFegomdyLgqmctuppXhMysTjHnkbHykjAuKrilTzizZSNYoITWYFvwEVEeaMxKHzcGTGsHmZZINqZpjtBeMegHqvVCrLwbnXFKR",
		@"FijHdzVmbeMHWj": @"ulzsHteoMpmbDDMgdriPdeNHJzPKwmnPeINLGelHNsfQgHDWhKjmrQHQLpuTwMSkxCAwfsrWSkIOnYDrMdoAfDVNXcFxgSbQeJdKuPFtDUIiEa",
		@"gZMJxDWRCswdMbw": @"ZoxXBdHVsydfQqTWuXZQwkwVmiKeXGEfhzUHNWlnMbnuoxNeLmrKdCaBEdMbrFXUiKHlgkVLezVPyUwJyKPFPmOhYkmXxWgtmWIAOiUXmQ",
		@"euJfYGQdqLvZcXjTgWA": @"XSLFTNeOuClqlXxdstKJCBvRMbXRxagHnfhcmdDpxrdczjFtjYZKauZGouJjZrLdtDCxzjRnfuUaiqeTGNTbVIAwuMseitLbolNGUSEBAxujSJJgBaMR",
		@"WQVVXyDrmgGATdRgNf": @"SVhCgPIBUlDhagsHhaJcCAmAFgQvKQyUOLYQeGSaTNbTHNTsssWKbqYoAThVDdwsUwNsGaOtwfIHmLYyseXvDglMTXNtubYRAerKHKdMOowrusYEBmsWTmAfMJWYBScEZUSGwHyjwgaQ",
		@"zQAATsbnzoIzhbpMEM": @"GNCGZHnxahBtCMxbEzUXBVjwXYoAcjpwdalqWaQDpNZpFCgNqSZnDnkutPgYYQBdyVZvjeAINuJDNmKFnKpxAwhUcOGXNPBtcixMiWbaHNcTyVTzunRpQckdLHvTpCfRZ",
		@"cUFCdaccoCHcCZUahU": @"XeeKIySUOhyOCYZgNEubWfogunsPAkTmRaYSQMvVfjUMhHYhCjItfLkLjziFOshHbvrGmjsFppzYdlKZkTzPKHZUZUhXYfjBZerGKBqtCxVNfMjLjKKWScdtqktsxaoUXzOlz",
		@"mZWxSTPHtqlqRMYF": @"nAVYLSiODQECzPrHYVsuzaGXodWsGQAhrChGZCcNNhHdZxIUSclRfGrURcZXIHaBldbDvgmzPKBqPEqyEVPdHJLgNPcLLewAFbcugtMfCXw",
		@"OmmehIsLCfqwbdRXG": @"TLpyoxMrmePxULuHhOHdLeMUOEKgkAfYSrCXdBbsogRZAteMGzIsUqeQmhtTJlPFSGRRmrkBCvuonruMHbiOxRQFkpixRemsokybaOLr",
		@"cjnqHESsiQxiB": @"LWaCHNfJdhusbNvwmRIVwjRNCvZBrUMttIKDdqaZhmBAiykqEDrLRpfhQnBSRWOjpfPuVmhiaWDQvpDfUOJjgMAEgkCyoupGidpgZlv",
		@"kqkynEIitIqIVaNQ": @"qeUWnOGnfAiRVmLGVvtdJoDxtPWDRkkVQjZEyXmODsLMVRxpwHvKnVyyaVgtArOexLRTeyhaTgwPFJBrKEnBqWKLYoPaWldqNkBibyp",
		@"RNXYuVSmGn": @"gNhRPNFbDEyxkJPbFNArnYwFiBrbKShXQJVoYEyvfJLvZVjQWWzVuoKImfdmSQqlRwRktwHrBYIhSAhMKofXTBSHHuhdHDfiZHbOTsfvvYWiXmp",
		@"xckLStnHGhhjYEP": @"DxgmXLJENDohjhCRNmYlgqcTCcUCzdnerzBsnDFTQTTHenvpDjnkAFwIYkUQHplbCILmNzaltJyYoZOAyrxzTLmlwQlZmAIveLSsAZQpImia",
	};
	return hqxXIifUBJqaUcfFo;
}

- (nonnull NSData *)FaGEQHjCnMqUddA :(nonnull NSArray *)tSsIRHoamCHCRS :(nonnull UIImage *)SciUsGzNBWvjCLuYVRI {
	NSData *IxCsUggjOLztpHHNYLc = [@"XlUPwVGYOauYJLZJDpSdXeljAXoDPAEpTGoMEVGtULOmqsUEMhneboTbbHVMzmHAAUYKuyzskwvGuYAbULMmAJeEIHrdKNsQVkTwcghHjiLLzNZpAGcWloDhkOSpKvqINuzmbmofVRFrhka" dataUsingEncoding:NSUTF8StringEncoding];
	return IxCsUggjOLztpHHNYLc;
}

+ (nonnull NSData *)sBorPzGSEucSzqSZ :(nonnull NSDictionary *)WiWyKGbGcYlqn :(nonnull NSString *)xkHbegugoU :(nonnull NSDictionary *)keotIjeXXlugLR {
	NSData *tyHRdqtGyybbUlATZC = [@"cTQmPEimJnwNXORdoerdgDAZoetCQUdsaAIzIaegUkkfzDFvgVAsLGjMSCVqnvnBdhJlolgCTNOohXKXyvdnTPOeqAaIJXlgKmOIqAP" dataUsingEncoding:NSUTF8StringEncoding];
	return tyHRdqtGyybbUlATZC;
}

- (nonnull NSString *)GAGQJzMPSbXoomyY :(nonnull NSDictionary *)eENBcMvPwhcUwV {
	NSString *XxLiqHhmSuUwy = @"iCGzKoxpfOEKkgrHnvzbIgytgDkabLqcnVQAOnAZNsyokSkOXsuJDYFRkYqKwNecmJlwNGFzBFgnVhggfNNdZrZjMjqwVKIctDNoSSCkuAFdTPqRKjrcWsmvMigyYDecE";
	return XxLiqHhmSuUwy;
}

+ (nonnull NSArray *)yjXhxwQTdykPn :(nonnull NSString *)XxsgJIGJhrbGm {
	NSArray *PCtQJwcnImFZI = @[
		@"ZXQOwmTBkEyLNJQRbRioJBhxRcSZoqbuPvaoqZBGVGptKffmOHyVyvbClDqfwDbpuURudbAVNLtLhOvnIREwViEOKqbsYsnJvDKEbfPFe",
		@"EhJZymbZNITFUKbZFFNjXOfYatSECDoUEmUSeYoqhJcjKfkgIEwcWBruPsLnrRXhVEMhOlHIGzsPLyzUIwMGYuqnqAGgYUyWMWgMdGnKwyKtJwfXHIyRotDfiKDlaWoiMGaza",
		@"jCTWhpfDokLqGoBXuuqXukBDhweAoILtJCwgbUqGAfOOokieJrqdLoZKlMQYHVaVwkJxerldREYVUtfDygxVYanxybpynyamSysvDIgpVRMbI",
		@"YLdAigCtOmnMCJhViTmCjXZSrXDlrnhiEQQoYTZFaoHGPBUXwseixmBFGyXyxIzIIvsxKOtxlmHnHoKsffFhFhNrnuKaccyIwEPXUtBJKFrGiuLbTvGJDxWBEFzvQtsvlUCNT",
		@"jnAsXDylIsFgXJMHLMQIOCBprMtwckWGlOTUoMaULAovfQoAUSVgNTMolrbHGLcQmMNFgmEBhDMlQbSWRSkSVwBAvRQOFRkxlDENgTwKalpX",
		@"vRGFgpDcJMeLgMDkSLkUyxOqfgEvOmYBUasfLjmGXhsdVZPMRoTsWSbrcGcLgzFHCjILZbYsuMynMXTYXKmTVAoYYdFNdNWvRptWlMToUuhSBjtJqEXzYtAHmokIvdZsSvjeBl",
		@"NPFGuGswUYKXqmSoLtvxOWmUBStvIQYnpdQxSKYdlkHzUWydsjnduwPxFALCixOHvVmLmOquqJOjBBkSamUuwWVIeKhrprlLDmLXINaKfDCurIVfqLJiHcoRcDJCYyyBmpLyjYoDvX",
		@"pQVSNSkwaIcfGRzflvMiRTdQIhotRlpIaNriBVTvHdVxBEvqUMRZPNQrQHPpxZauvQzcwSMqBTdbZKjuGRCihMzxvDceMYHDWREwvRQlIGEMXinJJjMbBvDNadeUpSGCIAMopixAsyXwuc",
		@"pMvVtAdoVusKJEYDuIRpVjaaHHhojjyCEMXWyauydKlUyxiUDtevhQjuQlsUeQccqVYHlNSCWfTnSizhnjmEfplrYRzURCjzmXwrjQykiQWmduCiDLtMaKrn",
		@"AiqYIaZqwUsGXeqtujVEVfFeVlcfXgLwAGaDJefRNnLPtsetpAKoLLmhZbYUdNoXGGjINuCgyvABRxHzcAvBXZBCCDlKswfMuAoLJemNFLjXyf",
		@"ccGdvotfxAUXdNmqUSoMTkmzBpNkHjpBrepKzAwKePJHDLjDoWhcLqZcfeKdqCtAhlbnqGHakZnHQBrqdIMhucppeYEhKeCnHcJIYfhPDukrLPjN",
		@"laIwxwKKWDHfMePFrLztRBXxwAmOHLdFpWfwqGzTkjiNzczeiKmTsBSYIQGcsxoPixAQQvSoBIgXvOKyyIpmnuapAXWjhDsUrlXsIUDFXrf",
		@"YeBxNvzlDlKwhZxuWDzhdtJuFGyHnDqdgEBAbgeqenFLsWWrdUNWcyifrMAchyWDUUwswjbvALsiKJyNATqVHbjZEjtRiphGCvqqvpKJLzCQAfIGtYINQQwkw",
		@"GudiUOUybxIIkRbkrmrIkRNFjJVQoJhtmNciKUjOpNimuupXGSuQZEtkUrjYFbvcVQUvjlASxXUpPXqgdWryLghnwEOaBHOvNNkTtTjpNbVFdNdkwMtRLuLNQUQHKCJQyGYvXUfbHBtyzm",
		@"xxohlIUlnMiGACNEJoEZYYnUYVpxMqUCruvJFDnJgEjqBtLCsPuGsWNWGftRrMKEdzjEJVsErcbduZPfytRjsZHITRLxNEmMcgmzMFxQjdAiGcGvG",
	];
	return PCtQJwcnImFZI;
}

- (nonnull UIImage *)lJIlyLNEnJ :(nonnull NSString *)BZIuARfguK :(nonnull NSString *)nxRIAgQiOmyJg :(nonnull NSString *)VFixOnrUcgtNuPqh {
	NSData *vTangItHNBLyPZzR = [@"WOrUnemdMYFBQQMBdmMgLQguOSNbUnJnmVtNvDyNSEJTxDNzwvPXLvIuHIbXXnxEDmhliVpfZOgLKWGiVACQWlcKWfMlchPDjmcjambmpWIqXuMgQfvFEANRABWuEQIockyrkGeuIbYhfvrFZvJpD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oDCMBkWgZmONrdQwtg = [UIImage imageWithData:vTangItHNBLyPZzR];
	oDCMBkWgZmONrdQwtg = [UIImage imageNamed:@"zGtGCwRJDZFOgUQSQJZgpXiyloJeaZrJJNZXZUAOrWMEYfgqvkjuWgfshzoEdOnFaNbglKCRoOcPZhBMwMFDlIbTaRwTWktjEkCuFlhQfiuBywfUZICvoLIRE"];
	return oDCMBkWgZmONrdQwtg;
}

+ (nonnull UIImage *)BPPYmECtaZdUxXENQ :(nonnull NSString *)wPwKGJzzdJLtcCNJL {
	NSData *QDJiLolADYhDI = [@"rkHDpXejCmDoweGlcBrrrcmzUNshCTAYmeZMFIcpHdvVDqoEJhUfzaUBkMBxgQEXVkwhcnxuKBptprwqELQFOifNrpzCwrLMZBqg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DVhMyQxUeVhBscObaME = [UIImage imageWithData:QDJiLolADYhDI];
	DVhMyQxUeVhBscObaME = [UIImage imageNamed:@"PwakRnyFaTHBxWVVeMMArGXAXWDlJOOtNMnVlbsCuXpOSalPawjYWOzTEnwytlmIiZVLJWFGWIehiIezPdyxhNscyozJSKwYlCRRJJMv"];
	return DVhMyQxUeVhBscObaME;
}

- (nonnull NSDictionary *)cHzZcFOjilzfzPPnPY :(nonnull NSArray *)WPrbaywXMvLuMjPVBb {
	NSDictionary *puBoFLhtNEyCUAXFqR = @{
		@"VbyxGbGAJnIC": @"DbsVZZFENejatewjUDxCABkFrHvSGIsXKpqxqJDLGkLQtVkiLsEvpsbSgDZWkpBQALRCLxybOajagFhlpKrZgQIJoIkXWawodHWPNyOOfeQnNAeTnbuVevxt",
		@"NpQRgsaXreGZACEdfeC": @"KBFKfXlfBJUsIxzPcNGHQlYWcRVWyELwzTfGbksqqXiRWMaQnxKIXFoUKFHcpoloVnUyhJNKSvuVPLIfmVGGgDvCbBXpMBQuBuVIpojuQXeaytCWmsWFlO",
		@"uNXhNsRBQzinqZDgN": @"pioScjJpHOkBkLMAPSauIDwDOdIcJjPcpBirUDBnxmeNfFgPOCbOXzhRqigboOiycHldMcUEHzzzTHyOBzEkUitCnHEYjBulmclTZyLWDqjiMhqNIgcjtHQWgyxiXmqGXbpCUiLBZFHMZOG",
		@"VvAPbKoLwHdzUpSQgtE": @"SAComIsLUbBFyySgOblMmPWrxLARLemsrQXMuYMtpuPDMTwdgLZJpWHCQrxDWkYiNxxsabMuSFnFKjtrhLeosoSJoMUVHUWVaUJdKAUEYYtzWbEqaragAjGDUOYpkjzJQZviLJOtESsHLd",
		@"PUhCuORNrOdIhRwmqbo": @"wfwtQCjLldxQFtemZdgCeRPyeWjqCkxhEaXbQiKZcwKwditAWtihbcMPZSkaADpinOyJJouPpZULPlQXhsNGOBkJtthdIHmWAmjxXIWwBpqADGawgpSQXaCppuhmDgbxJtLQGTXXeCHCMCHvv",
		@"vfBDJFTwjYuzQ": @"DHKrBMcYxjVxcSiRrzPyjELEGwpKBjcCMCTZOYkDSsdnsNFovLTbnsCHmdsZrzTkBkritKIJzrmYlAHYtTrAwhXYpOyXuKvygPTqAwzIpEJNUlziJgwjDaLXSrTPkISlmprlkhmQvjAaKTthcEqLj",
		@"mjFMFfUDBJnqssHkqZ": @"lbPyLVzcHBDqSdUuMnxQEPYvvwnewdtCbFnhBmJFkHVskivEyPHcLOMJcTTjIBsFXWEfPiqbjefKRcIBFpReBcKlqkyqnltQmoGTfqtLIjMpHJGNWLsOqlalMmH",
		@"zVgWZFJHnHRO": @"lTvSPsYjSnWESFocMcWbmhaGQyHVqZzjSAkyxEtOKLdaVoEAYAdXPWSnGVZZgmDavePoLCXWTLtSdOooKjvssOJjyBEzPhZHeWGoBYYRZHuZbQHEbhtjhSUORFXJHk",
		@"ZmcJlPcAwPhtEkcm": @"GvxDyPKtChpedjWmdAMeZoUTysstYASqoitKKlLNjyRWsbBcUlxDlkmMnKvxXutSYpzvEDODlbPoEnmNmkMTEyGRcdgTTaKrCtnDbvwthaCwCFTPzYLBjKaEa",
		@"ahgsKqDKloSjjkZFyO": @"QGWhmkMIlixcIeUwyLAYeBLvqsthgXHsPYiLLTXvINlEuLgBASuxQIkoLkCGMNihmutDIGKcBltxWPMtxLoyHOuoZbodbJhEveKHdKlarynBoAmhNaRmWJkCfLfyNfJQBkOzTKe",
	};
	return puBoFLhtNEyCUAXFqR;
}

- (nonnull NSString *)MBgCZUwusQJcz :(nonnull NSDictionary *)aelWYeyJDT :(nonnull NSString *)lrvOnUXPpQEHUbPqF :(nonnull NSDictionary *)jFqXubcgUdF {
	NSString *BtokcAFwKBqMnhAyRg = @"dHonQjCxGWsZGXMtQlXutrhjCwQqlTSEWMJVIMrFrJWRgKqvSSXLEiPYEGCBcynPIdSDxrXsoQRsjbJpEkkWrruXeIjiuQuqVpMXusrMNSedVGjGoqhXHczKlneACiAHARAjPzqOtvI";
	return BtokcAFwKBqMnhAyRg;
}

- (nonnull NSDictionary *)YxwJsFBhNreAt :(nonnull NSDictionary *)VGvmDMfjaztsXq :(nonnull NSDictionary *)QpwZqBudosZHl {
	NSDictionary *uOJCKDCthf = @{
		@"wqweBsDReMvKM": @"sdmMaUnOxHjalIJZQEnYWeHinPyTIReUlWGSOyoMUpYzFOzIYEYTvZJxYoqqvYwzfvbViKVDunUeuIfuEQnAsYOGMakNmzzaJlDZxjiKxWojVqAKzveAUurrOwVzrDm",
		@"WBLlYdmnEvMdsJz": @"zyjbuEocVgVxlbMiJyRifmxOtXrUcmtbgwogWICiPCwoMLDrARaPINcVQwouInBkaxiFiPFDNfmulzPAlEtVVCyOwXaQLXegzZLIvyyJpjYnYkgCYbTeBpwxuPDySxaSkfPRNPNCKrWCjcXnClQ",
		@"rZAUQNQGouZN": @"UlteiXvKxJPHlWLqFERxdEYEGxYDRDKpAmyWbakGDccdEJSEjdAMXlOUggvPHlpBAdezIMAZSLCkhmuotwQtdVuLuiDoASlYzYCIVULmpRTW",
		@"YLUTqikUnvHmvFqI": @"TpxPVHQucYFxiZnreaMaUitUadgIvLSQWGahkrTLzYEGsfentPpWhGGNeSjVpKjArpffGCMZIYInkrigVnZVPmsAmblGsTEcrcoaQCiHCQvyNgsslEkQlkMUAYDwXiyp",
		@"MymtSRvenCH": @"CxcymBQcfaAtfGShGMujDSshfTekIukHPsvvMMBMQjqeyDuIpitGxUNZMrqXRiBbWyvHEhYjBhdpvrXLmumToUyctVXMrLGKajWOg",
		@"tzTlSnbpbv": @"NoCNJfeXPUPGonrYMJkdMGBKOYVOLAxkDtgHTmuhWHcrbyjKCKwqCwZvfrqEqVXmHcfQuUmjxUzfIXrwoLqGnQSoTnIDLTICYLvKwicgvAIXpPSIDSHbmrFgSWcWKoDFHQFWhHSg",
		@"WkEJlKRUXgQ": @"TFklIXSZeVZtzQWAoSgmfuxAdeUfMtFHrrsPXdDudQJZFjoBOOjZoxjOhuJItxEDlGAtKnoPXMTMOpRiDQfcMinlYkcsHYtnYAZudtdrMBexmBJnIpWotVInhrwUlfli",
		@"ucyWFVhGabobWSNjy": @"GALLZRiqFmsLxCXAMnyAarIRgcYcAnLjzjevOURDPoXnspXOLdUpvSTfJuHvjFRwzMjkhchrJjlRfJfVxpUbGEfdmsGEhPxqYoYvLvwIAIH",
		@"HEDZxiQGcxFuaT": @"jiHNOzMfKvItbeBVhIRvVqimnPjgkhFNqHVyvlROuAFRCCeeNdMtKCGkrvgZOprcuZenWilKkIHwRmlHGiqzWevMBhHjFsoenZHVrCzLCbqylfCtpdvk",
		@"kdFQbvLMFEMKAtnkYt": @"BhRZbxLjXpXHJrOWOpXidZiDsYflbMktSjllPdkBHrrwgHrllRXQkeyIMkdLcBCoGyYlvOtXnBguoJERbbGpICSiCkQoTFYTfNDanUUmxtyeYLuaexzYyguUfwsOnrsEAkEPRlgFKzoylWuIv",
		@"BrIToCmJLb": @"UaFqqbRnnenRucQoHbybhnWvZnsdMunprfRDptRmNizGyVaPkTfPjlRCqXXkSOUrtQQkfNTyfVXhvrHJQoWDwQkeRDHWqqYgJzCpMeGoQGimHbhPuzxTdwzrBaFmqwBdwTaVNbMqzKCXY",
		@"TNTjUPvuEgyHMovZ": @"ZrUvNkZhCMTNfMyAMtcBVDGhzQlxDKkqHKWLdFUCmMnmrycHlsYLHvDEpsEUNFxhJeuUoWuBSEQYbHVpjMbGTfffKuLEiBRvbNnTAqlZyMyxWgEWDzqawahtSGntcJKpetDfKicDyQtaNMYyetk",
	};
	return uOJCKDCthf;
}

- (nonnull NSData *)SxooPLrSasRU :(nonnull NSData *)DScaLnFdpB :(nonnull NSData *)zJimRoquCdGYaiSdodl :(nonnull NSData *)LSyCHsqFMtH {
	NSData *AwcGYSQlyJEDdt = [@"ODNPuMxlkSkQIOGFzsEgzlTegdmCsyvrxhRERnjhLJrshlvrayOCqCIXgrWwYJOEgfWRWiXfhcMBUlaJTvRkIdFqDxdRlzyrHiBsq" dataUsingEncoding:NSUTF8StringEncoding];
	return AwcGYSQlyJEDdt;
}

+ (nonnull NSString *)qXMIfUACwHbVkvBlAG :(nonnull NSString *)MfbrllAoahJaxgyDi :(nonnull NSDictionary *)OoQgvIXWXQmcrRq {
	NSString *vKepXRkxIzptVyrUaTw = @"tmIUXiCHdaaEgHrbNIObOWPyuinnCAtMhdhFYMsSSCGEaCWgdoonmrsKpqebBiTFRkrDFRBpNuiBjkYShkaKqxInXTMpAfkHuZKHXtloPcDfuxMiyCIwSSKLkTnAXOqcmlitkT";
	return vKepXRkxIzptVyrUaTw;
}

- (nonnull NSString *)mAWUiSMyQw :(nonnull NSString *)FTQndEhjeHfo :(nonnull NSDictionary *)LgKTDmREBhrCcw {
	NSString *iQDLxbgyIvIikXXc = @"vwwdlpdpBslOLCLhbyZPEgwmPOREERfNTaysZeJPmjLHpsMnyYzzSgucLJqmexXSuUiFVKsxHHKqTJotLLKffgwsccCDsZwoiRkCcsxVELDMhckWEzkEMiAVIHXBS";
	return iQDLxbgyIvIikXXc;
}

- (nonnull NSString *)uxiGNrBQnZ :(nonnull NSDictionary *)zouzrcNsRUb :(nonnull NSString *)dzyLbxdhzOtlwsVMce :(nonnull NSArray *)yKVnKJrBgpQtswRxv {
	NSString *vXMatjTbWh = @"RiyiqYCLEvpzIhyzGexdJyhaoNoymEzxGQpYuqAjWaQArRveXtsBveBfMCVwPenlZddtzyEwtZWWXDIMqOqLFFwTNYNGRwBUiCObNOsQULqKLsmzjaAMfHEhNOFFEWZtcKmBNOJbcuG";
	return vXMatjTbWh;
}

- (nonnull UIImage *)DlijdkfkSOm :(nonnull NSArray *)UUFLSSvDYdWItaDHcMX :(nonnull NSData *)huUtSSSEHCz {
	NSData *hNpyMAykMM = [@"FsDJtsBaJwAgzwTjwUmHkecEDMgyiknKSKFEdDXPSbnZwKNcwsNugkTAIJkKXFVxBYywZOGjnxViTSgQbvKKdObGSHXbZsbMMazXwhyysxCFAGAWsnKONaZRaVa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *myVSPOScrs = [UIImage imageWithData:hNpyMAykMM];
	myVSPOScrs = [UIImage imageNamed:@"QuknieJnNgwwwsvbGCfEXwWRglMVFbMwMuwbNQUzGsnHRoFGbFQXZwegkKbTJsicKwTlfrgFhgpyIijPjHzQeQghaiQeZUFpBNRwI"];
	return myVSPOScrs;
}

- (nonnull NSDictionary *)BzEhywOOmw :(nonnull NSArray *)OLpKpeiQLWUeeunBQ {
	NSDictionary *tmPfGATXvVjOLnkpYZ = @{
		@"iLNKXlbErlXlNK": @"kgWuGitPLpQisrCXMAoVpWzrxNDrizHRuIhmUYzGqXBfqlcwukmvgzbHKEttukYejfXxNWRekryTDZToyhEkFLunvPBGEdjTdeeAbZVJqqOQdXPexgkYNMZwpwfLDLBUfvnjwdjubstvgd",
		@"QMtVyYUoRv": @"hvioNUphBwsUNPgJlmGcejLGXTbusrJWmUoALryHVwopiJCigSmqqnqiuKAGxYuPnMztuEmcZDsYrzXlIZYEldtbSmnZpGcwmlweMCoaJsfakiqAjeGcnRkdJqJycxVWBDtvbeWuJI",
		@"TtvKqnKrvB": @"LRkoVOeXaHwprtcBAYbVhnnTFojHvmIFJCsorsnouDcbAYpNgtjaEHvEmbGHEZwGQbQWritDeORjOJWNNPeqGOWACKGJacxhORXdoUcDihYSzLzogcnGmBeoXNdrSAmKHEwGLZqelvahoIY",
		@"zkgZvmBMgqRZXZk": @"TabCrQhppGdBZtoBsBjlbaTQyNRWbmvbjjRidHExQJnOpbZrMYEvYYYGQxaCEscaoDhGscyiQAeWXXSvIUEUOZTbqPEYBAORdkTcdawHGnuduLVLXurNWAAeLWqCmEQmG",
		@"tnIypkuRZljkmDzio": @"kSREGAPSmRnzwGYRpxTfEwXXoBhDJHANnoXgmLGOerCBkcyVrZWnfizZyaNkcuJFwNAJGPzArcupmxzUkIWlooJgSRqnFlarofMfXySBwnLEORfJdOWqETmKghhfWbUwgitisorsvOVBJlVhxwr",
		@"zLuRsANWUSCCZQj": @"tFcBxRonrBpQYJwKEHdhYuorByVIuddiOSqqeZDaWGZVipLYvbWsBbavWQyDlNOZdhiSWLUEzhoTjaLBQKBfaNXneXOVMwHRxkPOCTKyA",
		@"ExbzLrGHXGn": @"wMdBsHwiGMFfAoCzSgXgCjLsFganVxuDcjsEPDLkVZPbxMspnCDqQQrHyodPAtEXvkcUeVKLTCCdercrrofnwBaGxvJQYyFDgEuYMVesaQYLonUsfOo",
		@"xmeUdvGTklj": @"dRipvuYOSHaxMMtkPptNCDMoBfsESyJXIAkMqcywsMXtHRQpyjffxMNnKFfPbZXDluSiqzQnUspuHmMkNSbgbTTQvCpPZNFgFJHDPfDVDgioAAzkdObMeazccTqwNHAYnqcwMmMWr",
		@"OdxDEwryBe": @"cNRwvFJGeQCnGfobIkDnyEGzyfIBVveiEPTYbAKSYWMWQwloMUVkHWaAZVWczdPfeqUlAhfdoMXiLTuugqzxrjSEOfOJMuchAlOWmJBU",
		@"kqSyAxEajqd": @"rkZbmqlNlylgDJCFFFOpakGMUnNgUtoHRbNsDNbUogSwJFNDFAXPVJsXvtFOkURoHmlOQXDdSWWufPoEqtpfRhfYoIKkemnxICvHcmtFVIYSRJdDLqSphsuPHNSkstUJyWLeTTfD",
		@"THjoLprHIOszSgIXfkJ": @"UHnFtjHRWCWoPfjfacpIAacoPnWUlQDRzoWJXHrtgVAjENoFVwnQkLLZozpybkeyBvJQuJHjLbGEXnipyzpYMYnaexBPBZIHifyroMwmrHMArpnRiq",
		@"iFZJBbYCHpXkU": @"PKROhOapGfhRAgsfFcOeJMCmBiWYTmlNGmLTwUzzoDUTYmLfRJZvCaWVKBPommzoKMiQJYrbbtPfDNLCKkUrfDjOfFZdMUAvJQDpUxATVmbGiG",
		@"RyIVXXPTIZxBuS": @"KdRSrGoruPTJkZhuUtQkgkutiliOBnXrcQMjAAscuTlfqctqEsDnqcfVAlxPFWTMFSldoMYTTqlesWYQsKQtktPOCbTAVflkAVocQmnOowykptEeOrhnkAOtxChifGpVyAMNRXpOcJGyaLtbSILdf",
		@"WMRAWGVEFrkVsRhvQJ": @"uSjhKPprkncNXtyxVffsjzTzJwNISZFSspQwQGBXRlcQBzHVmQKDTAHpuTwVChLyDtKccjyFTPyufNSeDtgahzvWsYqllTLbFtSNnOJsF",
		@"CJndltcjSf": @"zIiGrqwfIkCYoWQfPacebjITbIgcEFjxlKkIyyxzCMVPqsykMoIhffKVLeCRmVLAQlPGBYErkggchNuiYHVsoHNNgbcXacxtduMAoxPSrwQFAyncGcshSLqhOZSDVBsTUBlBtEVNwB",
	};
	return tmPfGATXvVjOLnkpYZ;
}

+ (nonnull NSArray *)WqMOWYYsLPfY :(nonnull NSArray *)wbFYLbdmlivxmPRgU :(nonnull NSArray *)KzZewoGPsjjQzPBKvVy {
	NSArray *tExULBYHcbrW = @[
		@"tZspTubPmDoBpLLDzafVNHKlHwRHRUEBcMWHiQSenWBByBQGCUKVbGsphDPhTodCVvKqMVSHxmJjerSWttUZcTcRaFbWgTTyKvNUOsxNqkOhkCiOmBMhdLvYaOmZha",
		@"knOEhDPZxSeUXKlInFsqTaaRxHeYOuEXGZVcUZryRvBTFpmCjUUvQQIWttwyudtHMOJUqPijXOPSSDVBSfVoRrGdYlJnAVyXOgkKOubXuuAGlEat",
		@"FZlDodLyFYZNsJLPIpwYkrBbJrLyiRDjrXaXSEBtSCEBxQbcQrSLVPiphUOOSPHyFEUWAgDGgtsJsdiyfolztMQoBtxnhItvFNuMQSNpWjWGwPsoAJ",
		@"quCWPAMjonVIKHKKLNpBnQjHiAemCkCSPkqIZRwwSQskdZlWmEfECtqNhrpOVkaMdKylMAZrPoAhOPxchzguteMmJjpLklgjsmyxuExaMCTCYeyyHwpEBrBaWHNgZkaITIpYYKQZGutJtdHUv",
		@"gxGOmWgXApUfPJfqOGkcAhnpVJcotrQKeTkbYboJccdMKpIvjtlAuizGNVwFPAkYKJHtzJdaBkDVoTlSuFsQWUBoyChwQDVTvzjdWiIwaPwvlVeMluGnVJwsYEKmEpSKpLUnI",
		@"yDmINbyNQDXXBQdfdmRLavEWIrSiBEQraZjlnXmtdMLcwqnDLisZplkZoIFbGvuvzdQduskyFvBJDTJXCgVNLRdklWRwhfzVZTAelJcpESNBaopxDn",
		@"IhwYMzbJOEYIzhQKzDILxXOXlthrVdeegMnKegWtfCdlrQqZIYCLEwmhtxDoAZBWoqxaCMpUfpqUAXZBGJyzsqoVULlEYKvnFOEDPguGqGLajCCHuXimVsCoohXPfDFgygkoFmlEagVnzVMrdjvP",
		@"ACHKzJWyMRpRZAkrrWNyaaRPzrjJbTSUEJzRdTrhcqjiWdZQppQEgAOysgWzDiBQsdFPasysGqWIYcyrkFyUyFjDBwGsuulBedhvVFmWUmc",
		@"xdGkeBIHrpaxrKTXxBZOVFEOtJPjCOAsaWcntBScGEUdHaygoAMXmhRZIpBiCUHivEsZmUdUYWAxKmBOhqtVuQcmhRhgdyfkgWLSDwqikdBbPGsjSJojhdcXaLnKSESYktshU",
		@"WgzxRryOYwSEgnbUoApiKgbkJJiADmYOiSpwfFjPeozSYiyGkTWHMmsgeKKSZkXMucjCZszCaqzAiaZUVTBgRuXBhAZyRqeTSulglmOkwcvsap",
		@"PByQesnCYBdMKuCnfLdRpxdmzTkQyxduOImnmxIhXGidgUSiIfQANhKoRBMrWwHbPWcRyiKzpAmHKGeZeebdxAVCAObkoQqMVAFaYlEeVrKAvSEVbOnzYIPaQmTTvREHJdnZpc",
		@"cEhSFpKxyQbysBeEaBwMSwvScQMIUtbEwCTBwYeRYEesFWyomBfHxGKQRJtmBVGUdRUKizTlyJgLPyJPdggAIrSIvgYoKbHnUoXNcqyavepTRYHxkcUXrVDVNBHUCYQAakXxhgNPZfjX",
		@"zdFlqUKCWokpFcknBaOgzgrnzbfVQpLEaGqpkroBAqkSVLAvHLvavilRtItLCTAuukjaoDrEgyxOVQfIMQDKzTxTJEfMEKkgcPMunTaEENWjgtsKMnOOmkgyAivKfVaGMD",
		@"HcgOVnGfUjIaiprAXkETqNPJjqiyxIzlKvsUPsMVhxNPGVnXZjPxmUNYOUzOaXQYTHneAzoxZeMNERyGCErNjiPMTaxYmVzDlYxkOclaDCjLcSCNfySjqMDQeDDqQHqudPZDkepLgOFKUwv",
		@"qppXVbzCiKRvQxQiyBWNYWUYgbLVTqWgJbdGbJyZgpnCSYyyKkqQjtZyEhkhcchkATnDJzrofBGofpPPBZwEyFVcmCtDrxBIXAgc",
		@"zQOuTyzhEDAerrwXSvdGbOpnZEiZgUvDvgIfKJiuBhBFqnmMpysHNfzQqxEdDySRmTmabKvbXBeGufkTXDPtQhRUqOxpPNVJriNIbIkimdPUVoFvj",
		@"nVyfKAfmDZsUWwwQSPLCjMfAUsdhyVrVGuGcWVdwApjIReCmHYWLWHivNfxGEKgYHMeLCWOTKqJEcPsVUoWKLGzcpJMMCbzWhxRyBKlG",
		@"ialCgKPjyMKIbDuRYCNoPVlVxdRLhbvooTqviuSBNEPSXOKsualrofwkpgFOzlyBsBKdLmVykwRaYIjlpwQcIuhtOlCyLpeNzAKD",
	];
	return tExULBYHcbrW;
}

+ (nonnull NSString *)LIlIbmEswXxJiice :(nonnull NSString *)IaRlZOvHboNF :(nonnull NSString *)gFhGDcrQmedXf {
	NSString *fWDXDJOluZsIY = @"myKlrHbsMsFMUVJubbwUlEHIPSmzNISQBRwubXhzfZFrgmCnBRfjgJEnsnOOlPvfUEtYAokyVnWUVWxyxkMnXErKGcHWfdHgauYaccsGHpexWD";
	return fWDXDJOluZsIY;
}

- (nonnull NSData *)RPzaKGlnec :(nonnull NSArray *)JEUmYCUzpHySQD :(nonnull NSDictionary *)nbVteKQkzp {
	NSData *NWJcoyIWHf = [@"gAkuNLITVNJFulyaVYEZTPtrAOuZnhHIkeReijCAfihxbKmqlFBnVpIBcUCzTalJSAitKKJwRFgpENlATIvUDZlokofgFJBRRLSUjRTCigreyItO" dataUsingEncoding:NSUTF8StringEncoding];
	return NWJcoyIWHf;
}

- (nonnull UIImage *)ySdHZJVhpTZm :(nonnull NSDictionary *)OxNhBeGoojYFVfn :(nonnull NSArray *)fMtRoHPJBnPNjp {
	NSData *AqPoYAVZuV = [@"eNFGCvSMXgpQQqTuONcLzXDTPSsKLeoRFzTlzcoUCaiPlPoZeiVleJgIltPrGKhfdARaAXhCUZzSrFzxkHwfwhYQREOccsZELzzqbItVgNh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *giFXXJJymp = [UIImage imageWithData:AqPoYAVZuV];
	giFXXJJymp = [UIImage imageNamed:@"GFgCJmWNZjPodsSLFOUAoJnCPAcHbzyBEjMWHSXZAOnbVoOEAmQTSafokFreABUgZREwNtAWdBvJoRyyYNYilyUoxklaNqGVCUfzoEJEzgoMXESYNJOPGFsSMZACgB"];
	return giFXXJJymp;
}

+ (nonnull NSArray *)oMnKrqJINuPoiJmu :(nonnull UIImage *)AebkarqNocRNs :(nonnull UIImage *)MiNSACswxccaVxyJjaH {
	NSArray *qlfRRiESNQlp = @[
		@"nVhMOkrSiKLemHmzStPvymMEqyRVLuBSHeRhhxhrxSHzewPDLHiOjFUJMRgNXtSuagrgeLoVaNBQtkdKDxkBpdRfuGnmkMWTHVwN",
		@"sAIPitpJHjSkeEZKRDHwDweutIcbIIBPSGfxLXnCilioknXcBTJkqYshdrrmhSOseayOkJbsfYCWWLFRGewPIcBQWWNzhOEPsLkyOBHIlALjUBzhnztgiPtWJhaRY",
		@"iGzmNKvoCYWXWlBDmClRcWzEoSZMnvvZhgIPDEcIOYdanfqtEZIPGcLpWYiyykVcuYxdLHXZLsvhHSpWMiPCCQxcroBBavUuhRUKyGnpUJRkDrYLYEmYdiJg",
		@"GtuNVxsoWCDkSkqBQrqJeCIUVduwcdrTYfgQFOXjNXmElbpNmEypecJavSOTFvBSeoWiIVqrcjsVSscORgJvlFjIVkytJCrxEGOxbpitYBTjFITXMAFAjjFpRmSnop",
		@"abbQkwztvPmpRrxrYOxyTEGDuKJNJxjvsTusmSHguXUMsyljfDGucIMuIzlTFMabagTqPKhhtSsPsLbQuVSLqRZcyCAEBhczhcbb",
		@"WKgkMGaeCRGTGpLnZdkqXLpxtmQCllkZFAWVuaZUUhpVnVAsyyJeUxIJOicTHcvbHNCSICmamtxIBiqxteUcyYGqngyvPlnJHmseilFGmrkiOefrwiGhqkzIecoCEsDytZk",
		@"YwpPgchoGnzveuvTjlUwjOxbKoFLOQnVmHaZIpBwPYDLJjrIPMLJkPuDiiTkGheJgpqkDzkJcuKhkecZEckiBvVkYXBvayPRfvmijpzMsxTZhEmJhFNLZDGWohj",
		@"pcxQFffzBApUHFxBdidyPdsvFMErplGsFwpaaaWGXxQlIfQpcnpWJkncbgXQfIzZmepILjPOCwEyLyPXFhbSBaOBmDEYwnqsYYBJkztYlVgoEbgbQwHA",
		@"pSJibJbWOFySyQJEzfDWBzSnJjUXoknILXnIFUbexFZUwuzOFRbioOYyflgrcZgMEdzexFdsEkqqOlUskTmVonCVBJYocahUnRYhXjgUjaHOUGrMyzofpoq",
		@"wJeeygtohRvYeNDYcoXpJjUbPBAjOjCPXMuhLFYHZPRArUOUduVhMuQaXMxDKAiJisaFnioNWqKzUXMCzyrGclperzAxMUCCWYhlmQCUKnfwplwczbRd",
	];
	return qlfRRiESNQlp;
}

+ (nonnull NSString *)ASeRdvtsveFoPud :(nonnull NSString *)qeJQwCtBjN {
	NSString *DepXFPxyvIqW = @"UggXgsxQARuToEDpqCREbtCHhvLnZdsnlnRAQAFxvRDCAHqlbTrcCqwVIXtpTEnnIqgepoCcyTICNgpWbOfGTbzlMtvUpNtumFNTEuRRFpIjyOWMLPplinBAgWxLSvCmKspdckqHq";
	return DepXFPxyvIqW;
}

+ (nonnull NSDictionary *)imbKFFTEIKGXHAM :(nonnull NSDictionary *)FMGNCdhfjQPFj {
	NSDictionary *MnsGVjhHvQrbjsUnkg = @{
		@"ntgMUMKTyLEiOoe": @"EwxovCEcQnzdrTnSZPudMBLqPlWdXpWhgfkFzdmEzsQvlAtDPSvWUNvVSEzdpKGgtylIchtUNVoTpSqgAhNVLuszfzPJPetXMUgfngTxebrytTLIEPzCwULwFZLVtEbIiXQzoibbVOJu",
		@"zNxtrQyNytrUcFmL": @"tbKGYFUBzqqYAIuRbZrxmrfHMDOEVPAVQVzpYeZWRBEXOnZVUiOfTkLfBDCpEquazlpKmlangeTahfTBiCeKwtURAMflUyKncRRnPDxddISUxufheFiytILjSyPtojiYWjdOebRRshtdRM",
		@"DocwvwtGeixcJNZFD": @"FORdSUWkGWyyQPvFsTqMbSRaFtaoCDSiuVqVgruMUdtGFPxqdHuEMysjpXCTWFKHstbLQZTbIorzCoPAVYMTFlzcBQbiDgHbJTqtBDAGloTugbnOzXmCniolRzxos",
		@"LqmYSpmkvlgCb": @"HHGmPREwXWjpnCNdFHidDGqsIcczqLjjDhtgFXLZIYeYmPfWiQiHdoHCVPrYsocSQlBnGOQQuKiFAhfFhtHeftMHpqpTeWczYuobUDNzFUJJUJJHJBroQFItGoJvhYTvS",
		@"AmfIllYMbMkvhumsJsg": @"zKCSWZfGVkBnAaVNqImTYMOVgZUfgvsBzsaerfQalVAOJAvVuuEdwRBSdKdRgupQXRPZLLoCYhazcTrVNdwROcoQmNheMarGiWxqqdIhCsNeHAjqt",
		@"AWZlKLMazsvSt": @"oxAgHLrzEeKclBDIJAupPJhyqWPwPjjwJkWlXRdXRmpELWuHnGpRaZhLvRIoaRXqshtaicSjLdXZyhjWmofQJVPBJfgWfIKoEvNiszDicgNvpVFPytorqPLXcyQhOERCdUff",
		@"ddjKqGaJpIHFZxO": @"yuUcyBkPEcsJiOFYQhdiHdLVmMviZMlISdAYyRYwXqMAXNWvQDJwXWryAqktiHqxgILjLGWOuguHjkdeHwzpMiiBWFyWYOhrFQYzcggEJwMcYYILTsU",
		@"tOrSaxkjrD": @"blHNjKNFmCckUrhxzedOEYzUCRQbpzHuMYCcfSigmcCsqWtdZJBitaMOuefPlugaAUcMYsJAofZdyhFuzWnEDuiVjQuwOogqWEjqyRrKJaQNTzSoYPeKswyqZOZbi",
		@"waDAFpStwekjEutlwt": @"hWwbyHuHxSBpcbOsCIuXnkCLyIPOjEcDtYNWfBHGTEuVZkFTwLeZgKZUcsnuBqivqnYArFWWBWxBLXiEidIaHeUMNzBHeNWqGsmxGHirnPsDxePgwJtxzQFefjqRSQyRpXIngPBVNdNwobW",
		@"vpgyRakMZUzLZmQjPNN": @"oyNBPUTwjqfxyMxNIPIMRuvuDsOvhbCuiXupYUAAQlpsWSIsejmUvJtMeeNdQITkJkLsVzIwglavIskwEJrROZwRoZEbHeXgoKmelZzhAvW",
		@"lrttsWeeoy": @"BdSmMhwvTsutidpxOqLckzxdEqDTkyZABrsvwbXueuOezXtfGGsCKfrVlZYPglAXHNgdQjCDkSShavQjRIIFFkZpVYDrnFrTnEFvJqyPPDjFiejDodxkUXKPJwuSLatSAZSXiNIyxdjr",
		@"ZGGbLyCKZURDSWHl": @"IwVzjrPziYYFWwfcHHvPxIXfRrPnmWuJrVelcubwqamRbyhuIHiaiXQMsibvbGPFhyHBNKOnTUynQdefFEztjnsujHYSOiwXfgqQGkoaANGANYgTYvSE",
		@"EKCHfCDjQE": @"GleHZviJBvsBQQnCdRdnnqgsmWmtVIBihpQCBXNZDlJBEPVSzxfObqtqKvSEIxjvpplxDXdkSYYHvSkTQbJAyiyePwdoDVjTuwJoVhanRYzUzcvCFOnPZlkIDODqlEUfDbFlfncugnGaaOfkXnAr",
		@"njnorjziFrJU": @"eREJhQuGcXbCPqCDmkxUaTQcQgBGelycYrtbJLFNPrtsDgsDbHjminDwrxRLpuymcpqcxFEAwEzsJIdWCcXoWiPrMzEETGkPWaPdoMsDZtYFjuTLgwa",
		@"oUjSPBWiScwV": @"ODdyjyTMqkHfsLXuVqpLeqCvGMJtceFwESwEtWwlmJoMyAdubPTiajyQmnEchKmoBwveNnFWObpQQmPUxPerUnisktmYrLrLBkBFezseXDmAFJNCPLzQIrWFsIfTDRWQ",
		@"QVAWWsZhukZeU": @"tVCrnmqoVIJMCcDiXLpOGVSyZovDbymPpRIcfBZpiYySzULTjgpFnRPlCghDoUmbWgMYuVEUZxgxhknvrlBWKKPNcVrkiwBBpJgZRQ",
		@"MuueonwUGWZ": @"RzqPfVxPZRLGtcAQJJkwGJsAielUqeBTdfmlOXPjCPgNxFKrcxpjUzklrxJXKRDoJHuLvFwOCwcwXAuUJtqsTnMNUHIBfHIDQwHhipsJTIwtUlssnAXPksgOntovMUHHSD",
		@"vimwUcYJaJ": @"QlBcbjwnvCuFLZVuwpKyUsUPaizRaDembyECIXYetTXqTWLJuOMAnmguptAjIRvRQFaZlPkVfgqTGQqAFhjdeGlMchOpBmdaoeXXnofCtaZm",
	};
	return MnsGVjhHvQrbjsUnkg;
}

+ (nonnull UIImage *)yvnowvwUOmI :(nonnull NSData *)tGINtCAQkNe {
	NSData *cqffisqmFBIn = [@"RggmMtKZydROfwITWieGMNkmFuwhvzRNCODMUqYZwtfyecFxNtwVXXIvIurqnGOZSwNulJwkCONIpmnMhzbOKwGBZJDmCFFACQRiXGLEtgbMDJUIgSrpuGhmeFShOQymxFhxI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RHNwvicVMKDUtAmDyFU = [UIImage imageWithData:cqffisqmFBIn];
	RHNwvicVMKDUtAmDyFU = [UIImage imageNamed:@"fDSyEYPBePGsjgJBsiNRQqjbkLKVMCrPdaIrfqvEGKERaontPKjrnquUXOdWaxZKSLlWPSWAHchrdJxnoaEGeMKhmGqZEqLXJceSXEAeLvZxhEsQgjtzSBObugFcWEFOvvwWijzg"];
	return RHNwvicVMKDUtAmDyFU;
}

+ (nonnull NSArray *)YXFeCBezcWgbZsxTg :(nonnull NSDictionary *)ZosCdzQMHZdE :(nonnull UIImage *)aPDwHYpkblMCfpVO :(nonnull NSData *)aAYZaufRrIvGYLDbMf {
	NSArray *cWGAOeWRFPQdHqWeCRq = @[
		@"yzclhyjHzqFNpZwjRxMLpRWTFXRnDgnVHtCrJaHsuzzbsfCwMyTpLMHssQAWpgpqUxNDPkViPpUoWpGnSdkVrPicwNVRSjjvaLhVPrPUkQNIhaq",
		@"raBbCfbGkCdXxVzXSAyRjVPCwnzctNJgXyRxuFMANvTjmDAqLUXhHoHcnWTONOLJPdUtTNtffrSoLYuqWJJqIGYVXLUXUZozrUGFiiapDjbMZKqKogLGKghWlEoxkpQkAjchyv",
		@"KNXJFUmZjqwTsWzbcxodlnkbOXTQRddrZbkNjVFLFLiXKNdiJrstgqCbMXFYUJaHXDvArXxujVWVgzONphUZDBGWxPiVkbXynIzXboePdeUwGtNnhlmHNqqwmALYo",
		@"qSvHvGJgnMnQESlCEixvjRTvUqkQCvBIIYnwfvkhFulvsbxpxsytOhGBGZBujUFdJNHeKGKBtuvqXonJTLiZBEtECaJQaWusNCVlwvQLSPoxaIuIMTrQpVLNICwgoSPyOUWhrpZBZoKcm",
		@"ZdBIqTxHtFdkqRSAMNHuEwbBZgeCHwpgwtWHpyBKOYtnlFGDoXJOPOokjRdeTrzdWriAvYRJcokEbWboQnFprfNXmsckkmKASuliEEHNlKtHCNGGpVxsGdBHiNLniqAxmkrOGuXomf",
		@"lvetPnSjhOZpfiBdRfqaByHxMHVvHiiuDeKrJRgpSjZMSQIvBkpmaSaUEpGXUkbEaqIEbYlgFMzmpDtZIKDqEaLipftTmykjKZtkIOWdrWUpbWedLjbkDcvUbyzdr",
		@"vPKIeAOfLPAYapVrieXAvKeThhDNaSjnhMdtfjUdOfDjprXjxHdtxUtSRLoXraIqEtAiWMcUOcilHtpYnxrbqnrbVnOtXIMLqoRhtkzKTBsOTqNcRBkYyIPjBBtwOtakxjxsUIWyWxqwOwBrpmIKE",
		@"oFWRlwbjHyxgaMsLSlXmXMjlnbaEihkBQutQwAbGfQlTrhwNVtDgTjfuHFVtMNMTXWvYTFqgxZdNsDlRyyvLgkYBacoqMgcNxJKHRdbNNlpwVviXQXlFNTFerS",
		@"vTTyCpBzLAmtdNxMsVBYVMsVnRluOsDebLRPgtQMRTeQnoiTeHsogvIcYXgzzuEINwvZgaqOJHHxJiDViwOuBgqxHMgteTsIyeyoXrpLmBKkjAhKiXEpBToACgBhzOfffEcGaegvuGbQz",
		@"wKZjVBiyYdcBcGpaPcCaepYHrEOVXxPVzkvJoBoQIZDjBeVQSzdwpIISMXGVqlvLPbXGGTjFTuxanWJZoYewuTEzYMihYIOqYkulaDeQyxtEWjTqsM",
		@"BZRIRQDpdZBZeUejyrJAlfOvTldyfWqgSlHpfRQvyGFkvfBlQmAMSYCYuDhGWrmtmsRYFWQPdYkljtQGRLNBeGmcjQmdfhwnsmgmVOJLHuxTOdFQZkwupDKrBNCvjgBzX",
		@"fkcBXiZTUasEjHZDNvKZLqpfIKutpeAbDeSdFYNOCIzKzNtEvVJWFBOFWREhdrslaMRKeTrsiRphukNryZzrmRbwDgRsikCpsunIiyu",
		@"YDcYcEuLBrvgIXkyGXLYNtzWoAOmdiNpUeClDufonCCVDvTiziYSdzNwYcOBRHJPtCjtsgBVeGgSOOOEzSnNxPeTAfUvDjGjKscsXSmYFFDXLxQYLeIkPssNxLGENOAlNaFDOdIS",
		@"PViQMwISPnGorucQVkjQdXEqejqneMZaKpqYhuKKiduhLUMwSrJWkPVyvVlNGsCEOZzwfaqlyhrpaiqmHpfBlaoqZeOakrDsEEQpaIENKpKDOoRIqWsbTGpVEwWMHkJMiWBAwDUGlaQjGZ",
		@"BxTfokZGqpSwoZOUanRzptVVjCHhoZQaiFXjDLKqaSniHMnAEKAsjzlGogbqGHUkuACQuwKcMedoPAUPjRfnZsYJhBgspsCIqoTPBQgYWYXDINdQZJXewFpfUXnAiMFaU",
		@"qnkyyKIgBAkdBfIpwGuZGKKoTaEhQXSazZDVUIOgneLtdhblcDEmTilnXvHyOrbXOImaNeBQcOlEMlSreJMjVtyLgCNnstywsodtneopuBmDvnHcNJJnMP",
		@"QjFamlcdOqrIbyUuiwhtvGPJQnIRmeEdCAdMXViIfGkYaKqfvXKbGxITQxKmxSRfYTmaFGDwPqXCxvfzAieBTpAHSnRMtVWtPbErWYlOzYrMsWHfiVOPNoyKrkhIYtWrYokolMLhdB",
		@"SGFxXNNyHGeSyjTiuRuuKKlLfayTCpdxVtTvdkJJEhWNlPuAblvKLoksgebmewkUWEyJQxjuYSNcwRVCKCUvUXCjTcAbOZdzraYScvA",
	];
	return cWGAOeWRFPQdHqWeCRq;
}

- (nonnull NSArray *)TuAxzHrnMAP :(nonnull UIImage *)nUaZitlyFE :(nonnull NSData *)yVQyUCBfzBqyiPmc {
	NSArray *mlXrpqiENIAfa = @[
		@"oDUUVKQdVLZXJQsLpaUzYlFGhUGxdoKLowFAmAJGwVDESUUZLfDzpxRwHIjcpqrZzpmRSpgsEFAlyHbcLFgxSEhvCwMQcvhiZxPyoStQwxzItipwFKRMrMrEAkDRteWoEeDZUPMtKn",
		@"JkJrSwyBfweroUKourqUeoTxuTUjtCZKJqZtgPsUsgzWfGvqraloPCfMiqNbGauknqfvPahnNyiCbTMhcETAcFWxtCXLBRDffBJzSgYbAJpCEwnzJ",
		@"VEoUgHVsijQhohwHMyqGbcnGDppdMHXIKiveQGGTtcyXexXIhZlmYAMgEaEBJGXzPSrzYUPimulzhwgNIUpZCmilwfqWqrpFSNPUHRydSgJiQZFYntDCHwjlFcsJavoigeXXDNzs",
		@"QbWCgqVWQFDsTSXVLRcKZjfJqUBMrENnfyavYEFomiQuwzkKhDyczvdTyCBLihIWaaAxPUKbVhtAgcWRxNpugCgdDRaijDGgZLivUMsCJnjtcgobe",
		@"YlmmVcsLALSzpgqNMMPLvErIjtXWMBbgTOLXaNsbNEejXKOXkQhkhnsfhTcLwQfSwOHAsSpIMJhjHWmRcSTCCrGeJiuJzwMYUaPWgkPUfuZYhAxcbGvEaNClVdewfoPjUfGS",
		@"lhQXPErOswstQJlIBUlxhOyKgieDjYYnQLLWLErASFBskSOzcOhOZIVtIfJqhuAZVYnnAOgcPhdsOLVijoRuBbzPcRmeorVUlYagbthgZysrJQcluIDyOQcsfwBNpVCvCnJlVn",
		@"OfdtqUfQPIHebImgeLLuKHKFEzNGYZGwurjdMWVnqyOOekXsciPHjecVyLKwfDBemuPubLiqBjkdswtnzuEZEoePMaDRsYnnWWsZKpnFeSvILoGHVJRFxHmhGCwdaNjoVtaMECOXILrxlFuAWiISa",
		@"VMIhZbivgeNedqiilyWvXwItspnAMByTHUSGVlOsoeYceaBOCPqeaCXaLlhWlDbvHUFvCnvZfGuToAwjiWImviNnvJGRNjqOoOSqKLIjqVfzgjjsNwnEigWFxRvumvjwxeorbyKIqdBaRlFHqKhd",
		@"QeYhuDKdKWTxzSnSiVIUdCRvhNkIHXmtmcHonwAlgJPfZBbaNSDVdFfjtLSSJSflUoIPefDafknLAPxHGgGNwcdyUzltAZkwFuMS",
		@"MznWwDTShCQaVyDCdBtZkRnDWWSgGMBHizGfmqBNyILMsigUOMcCemECqedVZLQQPHMKWyBdkjVZmwoxOUskeRxadZaYwDixgTUACQhRJtbj",
		@"OUJfnOOJXkuDmDddfHklPpdnKjcsDjlZpBnTLPrDHQwYOdITQzXMFrVHGchgxiCZgUiXjJYwzhBlRLnxgDRqhbpjPJbjQkPOziNtvvGJpRwPcfGUGVOUNqoSdhxplBdVBkAbcqjyxZcAgD",
	];
	return mlXrpqiENIAfa;
}

- (nonnull NSArray *)mjuiduLkBKGJaHLRaEN :(nonnull NSDictionary *)IowzYNKneu {
	NSArray *fVFsTwjkhs = @[
		@"XLclWYTOWFlwYvzabhBpdesEZTwNUIWDvWiyzZLmqsiWiWApjnWuYVpHsuGRRYgvSkRYgDAheAHVQmUAKUbIHwoyZphIebwGTkIo",
		@"niMzQWPXjKkIPpHkLPokjaVFikrLjKvXYRxyYWMcRXHZmFaaCzigGomHESHXFsXjpIgWXWTVSZnHMTIjqlMwdPXbLOrGgGPSatRrGcrHbpCZYE",
		@"gdlOsJwdUFIfgNjnsltprvdjEotyYBlbJvCOMbCAZBwuFGCWqKKzIVYubLUcCdTWmQoPsaBIZGaZqQjFZgDppEhFpSuXRmMPlbEiCwLmA",
		@"QFceMKnmmfEWEmqgpScONdqHjPIiYdoCsuffMpVyWTprSQKVnoxtyUMGnQGMIbHkQOhUKSNyezghyMHlsITcHOCwZMlFpKJWnIYxskNjlAaxZTJAuGDNCfDb",
		@"nIimczuhrcpsXoZJQzUWpXlifturMVqrfCcziAbrAEadJBQCDojOzcMqnTjyNIlUCvnuTAwcdoMieMdyWFbqUrXfJwcXlbUrtxYNm",
		@"sTKGUidMmouBofgBdIIclVqIDqqhsbMOLPVpJgvCPgKHKwHcxGTIvbkqoUmhPjuDRbXNbFiBWknCJAWhTvHHTJqcZSoyPQQijtDadbL",
		@"PJWddZkLsHlxycCXoZBmZCKRzmGbfzLwVYsjsUBKWWrhhFEBAyPNVdlNZFeKpoeKdTRweFMpMbjQLsDTiixQKzwbFMzqsJvGvjxvMDUGBUOA",
		@"NoPbswWhnfgvMdMmRakbaEtTmZXyjUJfuFNrPgLwLtTMkKttdFhqTKfhaspPngJawKlOBECFRZkZthhhorRqMMknJpywcTBPHDyMEsfhMKlWszxdhEmFFbjaPDGzVy",
		@"fnoomtkLEqGHmXtmnPAZXdHpCxSurvACPhrUDNMkRXxAfHmMIcRvAFVVxCXFgaLVdlbuSXYxJHVZYbSDVmlsQfqIihGUfvrlTAuMDIPUcLFBJCzafSliRhqioJWojNukzPApMLisIAEGwF",
		@"uZdKLQJcuTBYjTNnJVQPOESCIwInQuBpAxCyxRRLlhdbqMlZHAFoZCEzRoVXViaWBKOKlVrIsVdCFrQsnPAPeGcXTeFjMhsltinOyWb",
		@"ejEfxUdBUuKbNoALMkFQdIFEGevfkYuLWvUaVxrApqQkHiphCAbTTGkPCFceZWxurPkjpmszgJcEnTXqJXgOScBQyQsFYZHqdiRhZnUqqBNUlGQBOH",
		@"btXeoBbPaLAuTZtUzWAeixzKCpNgWMAVjBkWrYmFCtZLndNPIrrLwsWgRMVGNSotkPnjDLpmMrJDzxwCWMkIAuQQZVbIqOxLafJNsYFVeUOKahJExSfWBBgL",
		@"aZrRDWctRGMknumTqtOexSEeEnzfOvHLbCtXYWNBqpwFJnOdmuAHUurAuuXaHscEeGhwDzAmWJVqBsaJnmcDOdOrEVDTuSMrTwIKiOmTGtPWdislHrnzl",
		@"IvZOnhyGPCwTAHXyiSlmLnwoUdZjMPfRjfzXzmQJMCDfknyesqNVPELxJDcVWqsFIaycpdvtAYPMEMgLBZHyPcfWYxmQxnVBdsHNQxwfglraOGqZNn",
		@"XvosbGYVlszwjhSdccPucTPaRXhMoYZazAkGKOEWgyVrVgAVUNOmXtuEYtSZStlXGxiuQVyJwzOkQWsFjWMhnNUescOuxcJtCAYubFTyotwhSaxNJjFpIwVJTMJWYJdaZDhmnGlomdhpZ",
		@"xkzSTOOlgkCHRhTCezcVZtsWdTwfwWBKZQaNVOcQEyZhNVoFCLUioqPAWuMbRbJWwlGdvcZHfBqFxWXWxWRIcNAswgWxUPzUJfZunzdRJGQpgeDzzlfZAJAGCPbVIodhgqUIcKYhK",
		@"bWIOoWnPeUPfUNMPNReHUofIwEBgcfJmSfKAmnXUgIcEwReJCpdWsZOQicCTTzwiPZOqLOzxgqLaePKdVAUoKSAzAEBVAdZabeadQMHRSisosF",
		@"mZHJYGYGjihCdjifAdvtTzuemmbhdwvZDrjpGLvRlPWhESekuFcjIwrAwOnyJjIrjzTHmFUCvCDPmwFuznZIBuTNLwVuJydJUNAuKLtbIgyWH",
	];
	return fVFsTwjkhs;
}

+ (nonnull NSDictionary *)RlnoBorYbEYeAm :(nonnull NSString *)YoTYqGQMHdDKXAUxbR :(nonnull NSDictionary *)GKcqWzdTxPAC {
	NSDictionary *gvznuovoOf = @{
		@"wnsAHjSvKvgBnOloG": @"gnHNxgIMLqPxKMvUzSpbSuMTPHDovpmcLqnnmtPzAHUvBkojGybkNiezNymxiBKsEuamkOyaraClmfdBrcwZazfBsEUhXHJoNCtldiTxttwXpXXLtdniNCseqnjKaBCIfGOAeDskOoTxPoQRNleLm",
		@"vAjkwVmoeXazHYogV": @"tfAOYhlfOvpWLulDNdTCkaaVzfsTGaYbdFYMOjrvISAGEngGrfqXPJWZbGJsloKwKplBxNFAkMtnzzAEsDOJXfdlBzizgqIXIKysHFoUIybAyQGpCcaAQCMoFcXfGiGrPrUgSDZSaxo",
		@"MVVqnXPfaNk": @"GkOdCWMBERymjApESoaUQFwTZNVIznzESYJfukTfRVTKPvNePeWLhwRqleNnwLwtZUglbQdvinPvKblwSneUCkuMsXZklFfBfKhsmGwdjdMKGwFNncnsOxjOngZbzQCAKucxqlqiAhzba",
		@"CHnhPmOTgCvqEuuFJvk": @"MzXFYBKbQhAVWekjRhhPWyPYaYXHOOxHnvIgCXRdGAAigtGyUUDLlYTyJoRIgHIXkipRFRcMeWmQQQLKgRrvZlFuWxZEhPGQBJwjsQYVWbDsvbvUuYDRZyKAlESXXBjUYspODhfeIeZhGS",
		@"ToXDmPYYKDirynRqXb": @"uYulAowFgMpZUnMCmRVbvWxPEyMRGmqBWlxMYoyvKdTOipCCJolscZdVPPWNgmRXSzeFAFAHOaTIBbDSKFIVSqfoCpatFNKinLYnvBjGhK",
		@"lVhHcqUxSDHyz": @"npmWxrpeOiogSLGkNxGgZuPGgohKcKoImnbOVvlrpKbusDWHcnHDbGUGznTWHbyAhWxGHMLxlEJxvNZrZfkEYyOBGwvJCCGwsaLrYXl",
		@"zaASKVNzGtTANoLM": @"cAdTkBSSASRVnpmuAMVibknhqoTAquyDDfWuCUtTPQEhyAKsqDFhOcCoPjZiRxMSMcikvAhEusrINeKQOXOHiTLrbKscZcmctjBBPrKphtQYiYrCzWdYBjRKBvATIKHcFGvvchoRzLMKm",
		@"NjhgjQyRrW": @"ZCuOvCcMqLKhssmZMCzHUEDNHKjXGYFpIhnQBeicsONjVBLiSDFzQlomlHRaWHskXvSmQQVhQxloJtBsQXOwGOaFOIEpVsgnyYGiNnaoawCajisdnCovmAKsKAVgjDDmeSmYSzRfFKoNxt",
		@"RVPvbfnVseY": @"EzvgMzGXaQjBBvvTZMDKPqjKzUxZrofHLzPiaVgnBbDwpMEaHXdRhunUCDacByOHsbnIFDpgdpSFEybPMhvOnpEuDJjiviloOctepPVtbD",
		@"nnSFsxTDSbOvR": @"vLXhFyVONelDDNXVnbXQQKeYRDcwJIDbJwqauPupXgzyHwjNEscKYytEyzlCsGTmPxQfKzgiskxnWeDsTVGUxduktXaGeRewjffzuZyPdOluBUzawFbOpFdFrNRUHyYbajYNSgjkh",
		@"HdDSXZrTVHFcwgPxuyc": @"CcRBOSzVwIPjeTFxHhUhAkOmTjEbNdDmiMtkiGhDAWQxaPSFFCIQlYBZGHnKxqDOTFRuhgDcmklrfssekLpcPEoxAvObyiAVqiCskyh",
		@"BMckEKerecSRjBcLoVw": @"lLvLnwLiSrhVBtFeQzRVrgoGlelnBEISuliZhdIpMnGEaBJRxqMCiCqgZqYoQjneooUgIkUeCAIokoeSCufECLapMYoGSvDaJHkawukMdPNhUjBIRIAVqUbSGhsmJFIQQj",
		@"KUEGavBmQt": @"mfkyOEHFkpTmMBolUDwpnbxfkDjuWXCmOjfJDsomqaYCzLqKeTrBvqzSXzUyxAWRrHqEzUyBsIWJmJgsuqXRavsEWBGSZOVITQMIN",
		@"FfBSOTTrTvT": @"OoSOuaMscMCoMuCbSjlRlgsXndSsfujXHFUNTMybovkhSbyTLffRgSVVzAZWDiBfDbWOSmklSnOPMcFFPCBZQFwUDHSsJHBomHyKYRxnqCCrYhlpGoZFiJgVPXj",
	};
	return gvznuovoOf;
}

- (nonnull UIImage *)BFmZIYuFaCIdXOQRFEX :(nonnull NSString *)XvlfERcdFyidNEiMVzU :(nonnull NSString *)VexgECECJabgKaxbn {
	NSData *jYjEJahabbSO = [@"sackhIYfoqGBLcwjpysbjJwCZWszMFrkcUDrmejBsdOwIaZNEsvBulCDVMECnUNkbNTdZfBprLmxncgFleMXxaGtkUgBEVLdBNLpJbOpyauqLZJCcRZnWGndxegJqSauaKru" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uqaKbNbikzmE = [UIImage imageWithData:jYjEJahabbSO];
	uqaKbNbikzmE = [UIImage imageNamed:@"qstQIdyuvMylXIIiqHxNwJZxCRMbfczslnKRgVAXenZDcpXNbQjMxlHyAZQyRFFROUAdQifljAxTdWEQphVZnkLZzpPPRSXbIezxNbpUtlLPwYZJpfSjjdbcZzRnpmvt"];
	return uqaKbNbikzmE;
}

- (nonnull UIImage *)eNsikSxVwU :(nonnull NSData *)MidzbYgSCUlCQBm :(nonnull NSData *)vSCiBraccIvqTALxD :(nonnull NSString *)PxDuVBzDAyMPCREOoFS {
	NSData *vwDOHYxmstsMWRDbjX = [@"WgNMiIqwslShJKACTypiqJTfJxxUcUanKbfTNMZRudNqqefwDdYVOlCTedlGPnrlsHhUvCIfMgbFAfxEBbmIZKSqTQJxvqhlFsQmvauiHIUqtiRjl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wBbfKbivvGlZ = [UIImage imageWithData:vwDOHYxmstsMWRDbjX];
	wBbfKbivvGlZ = [UIImage imageNamed:@"hlskrKFTEGYnKSjqowxUdEdUaPNbGsAkPBOomhguxFzfCIvfaUjJXJZMbPTgVJZAtGLGUlzZXSjtSSdIqnOGBxoIllfJEkCXGmJulbtBzWx"];
	return wBbfKbivvGlZ;
}

+ (nonnull NSArray *)XNqLmPPdNyAxfK :(nonnull NSDictionary *)WiNydYHYNHDjXbeeej :(nonnull NSDictionary *)DpzChXKQaKgCpEuQZo {
	NSArray *QsEcRhVLxVpHc = @[
		@"ehKDEwHqhBvFivQBKdVKhMAOFysUuURRxedLvctwnOSpGDYiNXMjqzgqVbadCpjJPoeATIrzYznvppFEwVcgWJeIVFmqTwwswcZarI",
		@"cqafiQTjnNHMUmQGvxPXngLzYPfEVKBdBYHbsovtwHBSrXgfVwzSzkuYNKMEehkzPWmsyRPPSnNObnYdhKvKBlNqZggCWSIfYOlQUWksdAeP",
		@"rLwsRqCGAwsDchzQAAClQkEbDNAeaGnKcsIoOFpgdVGpZFYUzGfhCTcJKrhtkilGKnAjruFbkGdFdYCkXsAcdBAoYmpABoBXVpnGgiXejgQAOZpYWEcfEvkNWZtBQfbKgCPFIdkDUDW",
		@"yhtfKBiUoXJmtNEvqZnrtsbYbKOtwUyUhXYbGgTKSLqFKDryvPWruLyWDJhjftSiqYFTjIzUhapmZlGooCAfuWwDrcMdDbOziiASlOGUztvLIWiizVKIVsETUZNb",
		@"AgceMhiHWJBFddYqEXcFJotuvUInGggsxrouAwosNNTIfSsUywtckjGVWPaRqmNukyMZNuKmHUcRAwYXaGztJCJuicUcKoguuWCUydJdlMTMmuCiRLLmDAzgHVRQnWmB",
		@"bKURbIXcriGTVaBhtqbYYiOQilKQVfIMEknBtcgYahRDKOTFNTDSWomrmRAYMJnBxAsOQvtiWKuJSVDlShhknCcZijHIFgZFheThXLCsAKudzELNCVJZFZC",
		@"ktTIUidZGNXanQOAafnZGdadLRjUNtqiIeIodnjtGAGvtZJOJrDkzbhHaFauMRXChtKLZfCIcyySXKrwXMERLToDrqCAlLIkhzrdLwUaysLPcJmzSpBfXjNcIMfjUGfSYYYmYQjZD",
		@"QAawNBbQApPMlyTjltQCwkYLiLHQPhKXKhIrhYKtICUxQUkzlooDdXqEoGXWXxYoGunXEdmAePZQbaVvOIpuUSBRnCnCRqVQjlJSinrPuqoSvZAmB",
		@"znwGAUjMkwyMgyULewmNWWMzOOGwClskmHYLmKLKksvvqLuKxXANIdCYPoMQkkDNMFuYtfboZacDLeImCXJOgTiApDHkMKhInPEcFotoicKNLHihmvcqqRZyLYgocihWXGXmsmc",
		@"jlXgVAGvzWzzVGmJoWcsEbVEdmxUxyrvNWmYXsEzXlEIMVcYAPGstMnHKasgaBqHJCRJnlEPfwdRqZYtIpdGmysUnquRifVjUHyYLyJyexlHmrFPJYdMVJMhNDkBSscsstIuEablZPszmF",
		@"owRTZnjNpzbnFeKdjMrrOsQaFvYZuqwytluyPQcibaaJgvPJMKIBbaJUvdwbSbrWFzTapfdTJrkAzMxhgrNKxJrpFXalcVSxeVVWAmkqaidyZIrqGKkjldFIvpilFAeglBVUnMb",
		@"LbQPDWKlWvISedCiKdyDDnUEuGiaFEfBsOQDvMCJgMQCkQMcYiWmmFwWyYoNIeMdvoVfsywpQAlgDaRfeZZqzajebDvoKDUWGdktfrYtDUSOpVvumyWkRsjFztQwmsXmzdZnZRgQLvlmd",
		@"IqhqBTCGyRsImbOKzmMuCRiJofAgUpIOiTFUMmRCKMvKUxKqZdpohBNAYhoIMcacKxnocHAwmNEdBikMwQJZMYAfJtrQzHRByMhrTqPZHUeEnQPCxthqOoGaELPYanM",
	];
	return QsEcRhVLxVpHc;
}

- (nonnull NSDictionary *)oFQclbYJjJxrnpHAzs :(nonnull NSData *)GUhSKSqFNegEe :(nonnull UIImage *)IFSOOnXWlVqpPS :(nonnull UIImage *)OHqIOpjVkEpW {
	NSDictionary *yorixlQvqZpnOYK = @{
		@"AUCPiNWLmbhpAw": @"pgtrsqqllqcbVHoIkIIjrlpNJhsZSsAPLqkqccxuhkYqMnQOlrubLoStqIASCOnDWycnLcNbQTwGUbTyqLQtWOPtLxQllqCiCXkamfhthCI",
		@"FMRBZjOuCvibbbunr": @"teolXtLlLAyNgHenicLjawsLnUibWirJyQfASulAcFdjDjHFNtpahGnYYRFjMzMhmKIKdpFumAMxCXvoFhMNEFwljKncIkqqiHholrR",
		@"yjwITWwkBNfov": @"iZmVXDtUfWUnQZTbyCkIgijiMgpOZaZHVdAKWkvhjlOXixUXzafKsmWPUnTkYeklenxmeZpnsVRbSJDZUVakdjtbpKqAptytiOUkOBbdNHYBkOyRETENJHwqrbSQbDjaMNfhgyGaMoCgmJ",
		@"hKIDSHylwAVQBDlr": @"ZvNTsBbVaaPPpHDSEfaHReklBLTOjdqFkqtREgGbtMBGXiHDrmGGbPrZOALrHcRwSJoObbUDxZVagVGDriKFzxnFvlecttkCNEKmOFXWPhVvv",
		@"biwQXZsSRjEncS": @"PtAGwnbmfJmmNQLGwgJUCFtupoiqednFfiUyiRzWiJyKDktgogsZvQVhifLZwZAcyMKBhBvcrjSGjdqESXJAcqNVLeaxRluYVdnYxaXObgIZRIkEUD",
		@"scqQrzKhThmWFRA": @"ZGwSoPdNrOvYYIgyWTSSoeRxtHHmRziNONpunxatnLJyygRvUyhRSgYSfeVZmuxsVewutxEpupVNrEeVHmhHCCIoWQLveQoxjDfWQHnWbByUqcwxHbgnjIjv",
		@"FlWbRoWdneizHXVwp": @"AzGJzNOqjZxQRgEHjetPqTEUhmEdlzuhgEADVmqnCdWWkGsKsqTIzzYfxfjTDHbLEqMTBdMawxLkXEyVUknOYhCotFXCXBbXjvUJgpbsiyejeNoORpNZyjvKLZIGoGFHwqMxTszXpocQsz",
		@"UVZhVMzzxYSEfQ": @"rxiJKKksyhnTitUiorZIwrhEaLNCVHqjnwlYFGOgdODuSUMEEZDrrgQQnhvVLUlhvLWpyBnJkKWhjNyMTrZSNCFkKLFGbAFiosbmPfCpWLlZZsBvNtLAVUZzWORTfrNyxApk",
		@"YaeJopELhTPSgKuRO": @"vnwDcQwvtFcHoKmjCVBCqWMPqtIKArvdcxIQitLrFDFoHfWNAEnXdphVIrPBcqvluXsGXFwNSvVhRHZRoEOgleAhgKLbtMhQPqpkSVbOIzEQfvtwKNvtMuCTyYBB",
		@"jIZwfWpSpqhnSYylBXl": @"cKZzBtapLDiMPITHTACgcadXnDTXAHfxVvqdaBxvmOqAZavIOzhUbicfNJqASjgkDFIePLspwKIxHxRVvxkbwndDjzcHGzvtzJXtmnOgZaaAKeBzThZCqcgYXTfByOhMKXdemo",
		@"qPjXdKtHsSbI": @"ghcSVVcYXmTIQSYbVtwlOOKCVSpWqtnqwQNtknRzdlkqUUbWmomDoqOKTKMTEcvJwPiPKZsgayvXynnOkDGvPkjuLQSxwkLfcBuggxAdaCyPhBeJGRBrqptotomijN",
		@"WUYvQVdpdoGMP": @"tYPeDtryfaEaLRNSpwJwaGUtSXiEqUcjuVZrGhYskIpcPliRxZpXoQspjbtyrbeorFLVsUHvnHPDLpnOztssMvFZJpGBwQkvJkoKJtTLAPdaqdnfwyGhZK",
		@"jCqQdKVsVJUN": @"dJmykNQsfGtaJeExVyiXOLMGEQLRSrZLeAmfOxaAHeVDPiLEcMEDznsTlTNIDAhznnlMhicbDmKGuUtHNkPXRFfcyAMOVGjZptbjwTAwggEccQPLN",
		@"vqKaTOFkUqoWx": @"hlTRrzhdTBkvWfLUrafotEJzpKEDCTZuwKpTflqBnwphBpfQDRoPNvPVnNOZnaeTUrlZBDxTypPnBxrtYZThIIxPLvtqTtLbwfLPiXckdDabZRpHctfpLaRxS",
		@"cCGFPpIbmeyPZSPpO": @"GLSumRIWFYrdDuEMIkGSqPNUSnONBnegKEjtWlyjXAyFgWrrEhvszFJpMmpJhiSmPvqSfkwcxEAmuYGPnJYIJnupeAxqKPuTHSDYYbLvINNGqEvvSLbdqkPEPfVltJWZHJAUFWtOoimQMt",
		@"ELluVgyNHqwG": @"klOYNjGXsJRQbuypblzAExTlLARJUpQxKNbQOKKUlMlUcQWxnLUhvVsHhBfSdMyiRuAYBZlDYmsIraOYcEEOoBqOddvxpIDRehXwQsJezIK",
	};
	return yorixlQvqZpnOYK;
}

- (nonnull NSDictionary *)tnnLjCNaMuHDhENla :(nonnull NSArray *)MwEFkTuLVGJFxSszWWn {
	NSDictionary *UJHTfAkCTogOr = @{
		@"TkaACqUQnG": @"peusfMckUruOBdemCQWXRYvlszxLLpziuaANJvYxogoczpsCAHcBRiLhsVfQTWpISSrNvTSFyOaLXGwrfnUshdRcOqlgZkmONDkqGZAXVzyPeJGZQOAJSGSBqKahJqHlghSNEXx",
		@"ZFdbbinsJHMzRGIWpV": @"rHIEhqitshMVxjozlsHuUozTIqhvTnGTppFZasHFiAfBJYOkGyuPDenuIJEjSahANWnhrFsiBJicOzlzowUYmagGfDHmleBeNCXrXZRybzWSlrUvJoEUFZCxDXnEVBBnRQOPpQ",
		@"VVbmzBtgQSrbLT": @"bhXvbDGFCFNxYpCrAuUPSQFXlwipWitTowoYHoBiSgRzkyAeikhhBRWDtLcpVLfQrtXrcDMhGFBdTrbZOFbydMpcbmSrSHuQrHxuBOXVZaQRfgt",
		@"WGhWAiJNdBqpnRjHXhg": @"tAuapGVTRaAXLhYiJpfVMXfeUHeZgKFiVWifankyPPTrEXxddOOzspoRbmTEUfbEalBWzgrHQxiBiMbGLGCmXuRNRJDxyAZPQBWRltgQrKjjEJlyuejQYzvtUDBCMPVYkqEtdlbMUqdNXet",
		@"YUXevMWOygNp": @"kGBwWbeYzPaPYjxJjipUYksArrJbAlGydNkbmWUhBGjbdZMrlVYBMtyjkDjscRjlnrtyLUquVhOUFOwCqoPrLxxsOkEDtQkwEehzhwwLo",
		@"kRKwvQIpUrhHJ": @"AMduQMTPeguMgcQZLUMbWmhbmUhKYYczkxaOQBdIrbxlkxPlLounqoBEciQJfxaMgYMIoNHXCHBqSifWIDRSYlNlARaUOXmYwlAWWtIbuofcVyalENcFbKInoSPmMUxdyQckORLHghIsEijtU",
		@"tkMhuKEIzQ": @"busbPvMggLvgyYQjtfrwaYNfZUCXMbdNJsZnqCYazsYJrTgwSNjiCxYwgpxooMpZyCovAWTFhkCRXRLwFEJlVPbjAlhcCcZgbqsjNCNaFwsGYfdxEulCEhOVqKxtgutoQoIzAsyLbWtZ",
		@"CkaSBGjPSQJXnAniYhw": @"DxqegeqWKWIFEMvyZnzBheoggkJVDcjWTzWSyLCoIWRugSuFUhhpxcbwJWZUobvRlZXaQYqtGzglGfTxIuzcLWfgNTshZNBbXfDfAIpUVWRuuaFmKVzexh",
		@"mBVHLSyVMxECEjGTH": @"EIbMpPnwDBnPigRVGWQiqtSLsdAXYXETNESKXFbFKaIXKTkWmtUUhWkzSKfcEcGFODlGuhwugTNFcyNpDQMRcwkSRCJEnXBUxXyimPIKxzskCGcnvlYVPWCgIrlsKDrHFySeAHdNZPKMPp",
		@"hOKmpJqsoWUmeumJm": @"IDYgWqWZxvubuPhjpDiqZilAVybTgkBpoUKZuPOxYHxxbAvipfLqFWoJISWaRdtZKPJVYaPugwLdaTPwHxifOxWRgFfSGgRWZIrDmbDGRtwVcWqeciy",
		@"VtnKrXGMxREHJOJco": @"hjJWUFSJPgjBLwVUrNjSCLkYmsxzzltVMwwcNBSXAoZPHkOKnudYpqNJlGEnrVtFKegUsdLArfxVPcawqtXMTtuXSZSVuombugZlbQxYudcJbjxKFXtYklypCEIYsEYJcclAvFVFr",
		@"ZddKkugkmwUnSO": @"BuxaHQznHEgmEcAEBCkPAXPHQeAJlagXlnNbVVNfUCgyTWBzmvqTOMjRgkWQsFUqnkfGnvRfYCaXqunrdylIxVqzvhwrEvkRRWMlHhFBLAsvRNoYtOUOWPajJqzpUyWiagV",
		@"YzCruipAjJIA": @"QvmnOXDDToEStIrVzpWfUAnkIfcuquNrZjatufQqaiybFveVjucVFHRifDlsiDRHdFgjDgHlppOFwQoTdExDveJUYEBtenoQYmfSsGTMkGqimhGMLtMVsdBoLrKuoQ",
		@"jwoafqUsLsRcihJ": @"cLycygTNqmnDCyijOnjPPpHKBwXBDhXPsnQEUPrLFRpYUJCeqQdBtBVvBFKureksoKojXVmUFssMPukLZsOInvdUXxBKoZVYEQQzXipDIdrGapxafPwKjSorjGmCTIdEUCvjHlwaZzhlPWduIqba",
		@"zfNNBaZRrrnar": @"FDcrSlMXrqeQSbKQNJMhRLYOJnEAEfgJPIyhiOEVLRaDqlMueHVkpXpDKrtJfvbMOiwbhhMHbykjSuiFizhRDDTkbPAsXgcCtUuxpZuzZJRTFLZcA",
		@"KRfRDNHzOxfD": @"vtomrvKviIHEygvmOyLkucFrTLoWuKsgplMBMjIAGfVEAsBZVMWAqjPunahNLnXznBJAFScbUOELFQrAWEDmdpaRCxFHopGyqGvJvGTXPBaasimNzVkEFzm",
		@"uXNHIWPLSKN": @"OnyPIRuQGbJvCYhpCqcIdzaZZVkxrxUMWYpzRgeeUUAbMvFtEfkZqqjsMPMTWDBvrcqJglcwfzNCDKECKlxNcoFRzjYRJuercZFiu",
		@"iEiTKqdrPoZTpAQby": @"HPjJWCCiFgXVGrqYnwjHfzbviWgjxqBXOjqKbxwjTmNwjfOhYChoLwYpgLGPWlVwxnpTFIqHZsCAjQZByQXSmuWdqIqKoiJDCrGqkr",
		@"nQjUUDSMrsxPGq": @"AZnhlPXQUvStHlAtYwwCwYsORJKzwOzDoxNweiBEiaSYcZtwiJPohSQHoxBZaTsseHLqhqMCnXVjdLYOTozUwRUDHIYJwNCyBTuiZmosGdUAlWO",
	};
	return UJHTfAkCTogOr;
}

- (nonnull UIImage *)ayDsBSYRFHUikDJF :(nonnull NSArray *)HqXgYOpCUKHm {
	NSData *NxdmoLOXigZ = [@"DCLygyFmQDDBmvRbJmnxpqBmiogkskFcbLTiAudptwJbWbCHXKFzlnQDRYrzBReZTaPSbaNhULNaKpqvuYlTNobMvLPMKqPsPHgBOmeHiLwWmgWFONYeRnVZzT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gOGkfdyLeLI = [UIImage imageWithData:NxdmoLOXigZ];
	gOGkfdyLeLI = [UIImage imageNamed:@"EmXMZaZDYAjZpCtWqLRJmdDumNyjdokhxFMknIdVRnmDZYjLCLaLEBuNNMyugYMTWRQCqCGYPPAapTAwDVRMcckhQDLOzMIQkfYalQSMHLzCUTUdsK"];
	return gOGkfdyLeLI;
}

- (nonnull NSString *)IyCpBQJnHqUGcsYj :(nonnull NSDictionary *)SPWPgywdgDPROdD :(nonnull NSString *)BuYXFmPWNSKtjq {
	NSString *HEhPKFFDCprVIPpINRc = @"AlelhbqvnDoDKhdYPQtpMYIWDWISRsgLSDKSSeDBkydmylfCqUCPZgQZsfWVnTBskClVtvjEAXUwzFIplVtaBfdEJlyXpdZjlHZDHNQYlvVujhapDgYUKhHQQa";
	return HEhPKFFDCprVIPpINRc;
}

- (nonnull NSArray *)lzjgcvveECc :(nonnull NSDictionary *)fdVBYbSiFdgZo {
	NSArray *ypmtnvMDUfjAAxGPeN = @[
		@"cSOZBRRkbdfVVzhwQTWTdLHXKfzzDaKwSGsLgazkPWThtGdnJJFuzIrevkETxRXKKjRMEIFGTgqrvyTSVsInkGPuHoPsoYdAacTmQXKrbfAFlIWzxYPGYUFAoyINnKpLWKAMqiFpoyZbewZ",
		@"SuVQpHxiaIHfYEorJBRRtmPKRSBNqYqWvZXMUhIbafsmWrNaTDGnYcvxdikZJtBatUzuvJKKzdLbtLouXAeVdHihFeuQGhokBVkcTUPzV",
		@"kEBUkvRQvoiAwnoaGjgJzcwaVPzRgiLmFPoGEftXGQuQaGVloYzuXyUcOefHIoOCDnRvAkxjUytLjhzbhJqyCNTQqJZRGidjZuvkipSMfMFOZGjbBWWvStJbuYfQaNmrDfunqUKqyisso",
		@"iqATovGFVvqcbScoRWBUOKdyXQkfjJvSDIirjDeOtXdxjjkohCKnNyzhNgRzcEUbdDrGCICAJlyqfipkBvGnQZpYrNKSAMSKLQTurK",
		@"BOMWfCuCvtblPZYtIeXDEBwcRoqOcXPEevMpiGulJpJjclnTbNbdkVGHXKHTCXeiwUbUnOoNyXAvFnMNVdzIhIXNSXHAZAyHkhLrOzvtYMvlcPjqCpnyT",
		@"yztmLBccLXNNVDvOxCeqqsLMWuueqLlYKPatbbKomMBDCIVJCvJltmwfVyuDwahYgwXUvsuFgrXTyRiRexEJCQncBqeoRDfjuqGXEqWVO",
		@"tVMGkTVfWZQrmtsZzoWvFEAkcaGBrRAeiStHpTlgJLzFCPHDBLnJATDAPUfuLCiOvDjGpxegEmKHrVxzfEvLuEYfvBRlTPcWpHPYEESHKHhjeyPxklstApCCVGuBlHuUGvaffCBFnd",
		@"rQKrbjvGMxOBqbCPSWlcsJSPBKvvZVtebEVftNtIHBSTbjNfrldDmBCjAfRQzMVcFGLYIQSTQwrMjEzYRoqsGhAHqscNAOChgySsRLQHVaRpoo",
		@"foaHsgQQuWhHaKCllpycOerFTivouwhoFUMsjlVCcnPiHKUtXFklVCIeJvsVovTkKYGIcpFPylnzFPVbTiwloouEHzcWOYXGJjfYtxiJDEotigPPvSgEbptSZdKwdanvbIf",
		@"RDYrvmJEmFWUUhAriuyvuTmjlOMsOMQYqgFAkxCXSnkOUIXsWIyBkTfjVkoEVGpzRGWfQJTSqXkxKZBDEzvxupKDTXCFouogCVaCIuoVkgSGnmfVVHNdLDbvRRuqkgpQFKgkzHQLtJLu",
		@"PvuumwgyYaMHEOYFrKNXEthsJYPCdPixuhQDenlpsAqJpklkUsaGJyTHBmLhvEqbscxGHOJGFfSfuVDEuBQcbkIhxAyGtTuftFGTRDyPwGHIIATVAjPrqMPildvQkgtMSZSkmLfsFeu",
	];
	return ypmtnvMDUfjAAxGPeN;
}

- (nonnull NSData *)nfTgVOEWkBRPbI :(nonnull NSData *)VaPhySPgtzPvQInn :(nonnull NSArray *)OSWQyiMkgHHoMG {
	NSData *ZHYtAksHtt = [@"MDZQvTVnMuLScTUSnrlTqomcfgNgIwtpEujhzoFIpnvJiUvIrnCKBinAIbpLdyQBcPZrNEJBqNnWUQMNqQwbHwVvHgWkUKNmlTWQaGiYhiRetlHvgUlPiebnWgczDgiuNjkdXIzCOoXUO" dataUsingEncoding:NSUTF8StringEncoding];
	return ZHYtAksHtt;
}

+ (nonnull NSArray *)STcMRkWjjll :(nonnull NSArray *)xJxSSyExbhdl :(nonnull NSData *)nrGFaoioNBsBx {
	NSArray *JhNInIPnZYNNUPJRAGH = @[
		@"idkuHGVIDwphQXrhxCRGXfOzylaLPgufAvCmipxWREyGQiLvoGUhLftQntJPiXzqHwpxCxEoblmuKJYaLKvGHtUHsBFsyBPeYEzeQhGBrImoWNEugXGIFLbYngNZ",
		@"rhjUnZyyQRItNvimXuAefEpJSlBKShAfRqWIDaDiNKPbGqgFhTZvpqGAiDVZISbXbhnRQxhvPWNdggMOSlOkUngtBhejrKKjKBWgbnfde",
		@"WzGSsWawpzUATVClsPbEKxGYzCFuyumJOIEpYFiGHswAeFNvSDEpvqRodwSkARmfPGtRZeEmhGbjUrFAKbUwVEpyWudtaVHlkdHEVmuxrADrNjvFUaZP",
		@"TkzNBrisTxEDQIOlBJJWMXvgwkLAuzgQDZjrYNuVRHLhhSyMqhggmQyHmPFHByBWmcAcxUfMdSLKeHpdyKodsmdWqMpSMLEUUZXkANEgjJkrVgXjMfTmgsiivSbXIMfYEwJ",
		@"ZGDLpGWVjIsmQmpRZrKmkbaZnvOTAdReWUHbndBrGYWvsRzzNWkftHKUVCBNRQmHtsMptXGuSBImIUfmIxRTTPmpCSlpqTEnVyjgfOSLPLoUXEjeGzXLCkHGjoZQFMLGADRenlQPTSXrIxIeZtn",
		@"jwTqOyqrTcstVZMalCjuHmMZtJdJkHOqRpBVJIoezTmariZCqpDIUXFxALHHspxVlehmxUmQctYamtcXbnRmQJiUtffpMvShANBXqYYlvFxSPKlY",
		@"yDCWbsqLmJRuzByjEbnGIhzueiWbxvZseFddtgEmhvKJFxofISxgkCmgMVBCNuNJDJxJOKPfBcwvEYGojtIuPmvEoAsQymJcSCQTGEwlleseoLhbDVNqRylGPsLhTOyTWXCmdijVDAYzRrbrES",
		@"PPZcNOZfmZOSGTevVScjDHVUtQHkeBbrTydqBJDXVaiBhMXBesNqFIJNGViWsjbNYLEtbYVtqrHycwbNQrvbKKeYGQDYmlbsLFiNuxmYIdFNidcjeWJDlWNptXQZag",
		@"hRwdHimcxaMpZGWdSPTmdgQbCpqowCWsVKdbcsTIgZpbJDVQUHiUhsNgXgylSDFRzXniQPOVXNnHqeABYnbnspYOHeqsnjbHGqiJfESTPDMBvwaVEAzWCMVZKbvmrEQsHnELoWqAaECZT",
		@"wmXmaxEoviTPvbyUiQVeYbkrvfOvyYpGeIoQzRQPyqThZXShsQtdmeBCcxiYbXjbCKTYJTTLdoPgKbeDwWwBxvUxktDAsKqPPuouD",
		@"gboUJGLdJOiDQGRSsGRCSbIJXbwnTqRJJxLLPuqJqlreYVQOWxffFYeDyBHxemkumFSNVSkNPoWEgnTshpabbBezwjELoScGMUAiHNWJipXeGAyMngqZzFhFqAzZyapjFQZeASSYhE",
		@"LvAJkIngcLSrmslFFndnJtbnImAbpjQWuWWleRKzbjbogqBKoUDvpEFslFYWHQPGwhvlZWRLjXzFWksnGcHgTlBzukROiwpvEvdyIPxzNRMIDrHIwdmHmXaGq",
		@"WobzTwPJdBgYjrzhzXGewMbLcifsMwVCwlSeSoGauZoVjzQokRuLohqGNYmtiCHjtvyJEeVdKQGTmlNOqHhwezwlSRLdhHZvGHdwpkSyXmiJEEHSRonYkhbRajOrzgIasbtsygXFMsBSxIBVd",
		@"QlKDsCPfmMvIUWCTkuJwhGFQbQdEpkVvsXLxAdNpmyWGlTXabAONtZTAYqMhLPFSPKquHVuRsvFqfSuVLgOUPuonopmHJOlMHklgdlDVbKuwsrmwJwqKNUuvwzhUXhYpsKdGFJZjtv",
		@"QClvRxxjipfTzhEuPFZLRmsfnahpkORzBgbGCpDElPASofOZcfdCWoRfzUtaYqZBhSCvBrWPnMTTHTRphdvHbZBXHKSQSCVjfAlvOKhIgKhcSFRwxASvCFICrKPCcrNsQt",
	];
	return JhNInIPnZYNNUPJRAGH;
}

+ (CABasicAnimation *)moveYTime:(float)time fromY:(NSNumber *)fromY toY:(NSNumber *)toY rep:(int)rep
{
    CABasicAnimation *animationMove = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    [animationMove setFromValue:fromY];
    [animationMove setToValue:toY];
    animationMove.duration = time;
    animationMove.delegate = self;
    animationMove.repeatCount  = rep;
    animationMove.fillMode = kCAFillModeForwards;
    animationMove.removedOnCompletion = NO;
    animationMove.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    return animationMove;
}


/**
 *  @author Whde
 *
 *  去除扫码动画
 */
- (void)removeAnimation{
    UIView *line = [self.view viewWithTag:line_tag];
    [line.layer removeAnimationForKey:@"LineAnimation"];
    line.hidden = YES;
}

/**
 *  @author Whde
 *
 *  扫码取消button方法
 *
 */
- (void)dismissOverlayView:(id)sender{
    [self selfRemoveFromSuperview];
}

/**
 *  @author Whde
 *
 *  从父视图中移出
 */
- (void)selfRemoveFromSuperview{
    [session removeObserver:self forKeyPath:@"running" context:nil];
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.view.alpha = 0;
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

/*!
 */
- (void)setDidReceiveBlock:(QRCodeDidReceiveBlock)didReceiveBlock {
    _didReceiveBlock = [didReceiveBlock copy];
}

@end
