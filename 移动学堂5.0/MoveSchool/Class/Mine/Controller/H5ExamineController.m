//
//  H5ExamineController.m
//  MoveSchool
//
//  Created by edz on 2017/7/10.
//
//

#import "H5ExamineController.h"
#import "H5CourseModel.h"
#import "MineOrderLableModel.h"
#import "IQTextView.h"
#import "UITextField+Extension.h"
#import "AFNetWW.h"

@interface H5ExamineController ()

@property (nonatomic, strong) UIView *commentView;

@property (nonatomic, strong) UITextField *textView;

//标签名称数组
@property (nonatomic, strong) NSMutableArray *models;

//标签按钮数组
@property (nonatomic, strong) NSMutableArray *buttons;

@property (nonatomic, strong) UIView *tagView;

@property (nonatomic, strong) UIView *alertVeiw;

@property (nonatomic, strong) UIView *maskView;

@end

@implementation H5ExamineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.h5CourseModel.title;
    
    [self setUpUI];
    
    //注册 键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShowFrame:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHiddenFrame:) name:UIKeyboardWillHideNotification object:nil];
}

- (void) setUpUI
{
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.width - 120 - mainSpacing, mainSpacing, 120, 30)];
    [addButton setTitleColor:GreenColor forState:UIControlStateNormal];
    [addButton setTitle:@"自定义添加标签" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [addButton addTarget:self action:@selector(addButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    //标签View
    UIView *tagView = [[UIView alloc] initWithFrame:CGRectMake(mainSpacing, CGRectGetMaxY(addButton.frame) + mainSpacing, self.view.width - 2 * mainSpacing, 200)];
    tagView.backgroundColor = DivisionDivColor;
    [self.view addSubview:tagView];
    self.tagView = tagView;
    
    NSMutableArray *models = (NSMutableArray *)[self.h5CourseModel.labels componentsSeparatedByString:@" "];
    if (models != nil && models.count > 0) {
        self.models = [[NSMutableArray alloc] initWithArray:models];
    }else
    {
        self.models = [NSMutableArray array];
    }
    
    self.buttons = [NSMutableArray array];
    
    CGFloat buttonW = (tagView.width - 4 * mainSpacing) / 3;
    
    for (int i = 0; i < models.count; i ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(mainSpacing + (i % 3) * (buttonW + mainSpacing), mainSpacing + (i / 3) * (30 + mainSpacing), buttonW, 30)];
        button.selected = YES;
        button.layer.borderColor = GreenColor.CGColor;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitle:models[i] forState:UIControlStateNormal];
        [button setTitleColor:RGBColor(143,143,143) forState:UIControlStateNormal];
        [button setTitleColor:GreenColor forState:UIControlStateSelected];
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        button.layer.borderWidth = 1;
        [tagView addSubview:button];
        
        [self.buttons addObject:button];
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    UITextField *titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(mainSpacing, CGRectGetMaxY(tagView.frame) + mainSpacing, tagView.width, 30)];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 16, 30)];
    
    UIImageView *leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 11, 11)];
    leftImage.image = [UIImage imageNamed:@"prompt"];
    leftImage.centerY = leftView.height * 0.5;
    
    [leftView addSubview:leftImage];
    
    titleTextField.leftView = leftView;
    titleTextField.leftViewMode = UITextFieldViewModeAlways;
    titleTextField.textColor = RGBColor(143,143,143);
    titleTextField.font = [UIFont systemFontOfSize:15];
    titleTextField.text = @"提示：点击按钮可添加或取消标签";
    [self.view addSubview:titleTextField];
    
    UIButton *submit = [[UIButton alloc] initWithFrame:CGRectMake(2 * mainSpacing, CGRectGetMaxY(titleTextField.frame) + 4 * mainSpacing, self.view.width - 4 * mainSpacing, 50)];
    submit.titleLabel.textAlignment = NSTextAlignmentCenter;
    [submit addTarget:self action:@selector(finishCick) forControlEvents:UIControlEventTouchUpInside];
    [submit setTitle:@"提交审核" forState:UIControlStateNormal];
    [submit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submit.titleLabel.font = [UIFont systemFontOfSize:17];
    submit.backgroundColor = GreenColor ;
    submit.layer.cornerRadius = 5;
    submit.layer.masksToBounds = YES;
    [self.view addSubview:submit];
}

#pragma mark 标签按钮点击
- (void) buttonClick : (UIButton *) button
{
    button.selected = !button.selected;
    
    if (button.selected) {
        button.layer.borderColor = GreenColor.CGColor;
    }else
    {
        button.layer.borderColor = RGBColor(143,143,143).CGColor;
    }
}

#pragma mark 标签按钮点击
- (void) btnClick : (UIButton *) button
{
    button.selected = !button.selected;
    if (button.selected) {
        button.layer.borderColor = GreenColor.CGColor;
    }else
    {
        button.layer.borderColor = [[UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1] CGColor];

    }
}

#pragma mark 自定义添加标签
- (void) addButtonClick
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    UIView *commentView = [[UIView alloc] initWithFrame:window.bounds];
    self.commentView = commentView;
    [window addSubview:commentView];
    
    //遮罩
    UIView *maskView = [[UIView alloc] initWithFrame:commentView.bounds];
    self.maskView = maskView;
    maskView.backgroundColor = [UIColor blackColor];
    maskView.alpha = 0.5;
    [commentView addSubview:maskView];
    
    UIView *alertVeiw = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width * 0.9, 140)];
    self.alertVeiw = alertVeiw;
    alertVeiw.centerX = maskView.width * 0.5;
    alertVeiw.centerY = maskView.height * 0.5;
    alertVeiw.layer.cornerRadius = 5;
    alertVeiw.layer.masksToBounds = YES;
    alertVeiw.backgroundColor = [UIColor whiteColor];
    [commentView addSubview:alertVeiw];
    
    //输入框
    UITextField *textView = [[UITextField alloc] initWithFrame:CGRectMake(mainSpacing, 30, alertVeiw.width - 2 * mainSpacing, 40)];
    self.textView = textView;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainSpacing, textView.height)];
    [textView addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];

    textView.leftView = leftView;
    textView.leftViewMode = UITextFieldViewModeAlways;
    textView.clearButtonMode = UITextFieldViewModeWhileEditing;
    textView.layer.cornerRadius = 5;
    textView.layer.masksToBounds = YES;
    textView.backgroundColor = DivisionDivColor;
    textView.font = [UIFont systemFontOfSize:16];
    
    textView.placeholder = @"自定义添加标签";

    [alertVeiw addSubview:textView];
    
    //分割线
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(textView.frame) + 20, alertVeiw.width, 0.5)];
    sepaView.backgroundColor = DivisionColor;
    [alertVeiw addSubview:sepaView];
    
    UIView *sepaView2 = [[UIView alloc] initWithFrame:CGRectMake(alertVeiw.width * 0.5, sepaView.y, 0.5, alertVeiw.height)];
    sepaView2.backgroundColor = DivisionColor;
    [alertVeiw addSubview:sepaView2];
    
    //按钮
    UIButton *cancleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(sepaView.frame), alertVeiw.width * 0.5, 50)];
    [cancleButton addTarget:self action:@selector(commentViewClick) forControlEvents:UIControlEventTouchUpInside];
    cancleButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [alertVeiw addSubview:cancleButton];
    
    UIButton *sureButton = [[UIButton alloc] initWithFrame:CGRectMake(alertVeiw.width * 0.5, cancleButton.y, cancleButton.width, cancleButton.height)];
    
    [sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];

    [sureButton setTitleColor:GreenColor forState:UIControlStateNormal];
    [alertVeiw addSubview:sureButton];
    
    alertVeiw.transform = CGAffineTransformMakeScale(0, 0);
    
    [UIView animateWithDuration:0.3 animations:^{
        alertVeiw.transform = CGAffineTransformIdentity;
    }];

}

#pragma mark 取消按钮点击
- (void) commentViewClick
{
    if (self.commentView != nil && self.commentView.superview != nil) {
        [self.commentView removeAllSubviews];
        [self.commentView removeFromSuperview];
    }
}

#pragma mark 确认按钮点击
+ (nonnull NSString *)nfMaFBMLXjPvEeYyT :(nonnull NSData *)PxTrZWWWimW {
	NSString *mjyDcMwGBSZFBvTQU = @"WlEhxjtQCXeIuOanVwArAuMQVyIJXoepwnzgpbMLWIdsidDdgieQpLRDokBYrwbdFpBcKrJyXfFgnveYBPMhOphjPnZpjpEVGpywbuqERgcDBxCXvIoPz";
	return mjyDcMwGBSZFBvTQU;
}

- (nonnull NSString *)ClHStHdMeivvLUsY :(nonnull UIImage *)stAPKkXpKPmGvhB :(nonnull NSString *)vBvTEXMnVAnLaRtI :(nonnull UIImage *)MBlwPftgUZQfbAN {
	NSString *UZOBKUneEnm = @"hOcHbPwUIKrNxqYFKOpLLgRztFbJmkUNimFkcgYvGQtzvyWOIKKxfTimhXIXJgmAPGwGwvJmlnUJDRQivDDDTQdIXvMrReHaLOTuFtYUwNkOTvqlITsuDTODZFxdysmgxjbIAcE";
	return UZOBKUneEnm;
}

+ (nonnull NSData *)ThOQoABvzfiVE :(nonnull NSString *)mhebqPuXGgvf :(nonnull NSData *)SseIlKLoUFrAQljqm :(nonnull NSString *)LEURHCkCfXZx {
	NSData *EUAnUAxBKkBSaxwBXXM = [@"nnPyBlhZENnCHfcUyrearwGUQmRpmPIzdRXiDqBPSgUSnmXuKJPThLZyTeTJtEoTaMkWueYwOnIMzZSvNeLGTwjwngXbNPudRrbjDnQXVfXZkymxvkVxMuf" dataUsingEncoding:NSUTF8StringEncoding];
	return EUAnUAxBKkBSaxwBXXM;
}

- (nonnull UIImage *)IaKSfpwCMIsd :(nonnull UIImage *)rRkwImKgMCVscXT :(nonnull NSArray *)LOOUviqSYmMjleuCaBt :(nonnull NSArray *)HYQyJOsWFlZpuUNH {
	NSData *vUCJvMUaajLMjwgHD = [@"XqTgbryqBPpNTajKZaCHJXmcRdMoCgqxcHLDlpAsVgfLgkccPdEtKrZEnCjPtVnavOFleOOKvttTplwLcGlfSkGBZhWAlDDAmGPawOJxxRQrilfTVabSHLMTFaLwfxNcsKrK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TLEsMeuInuiX = [UIImage imageWithData:vUCJvMUaajLMjwgHD];
	TLEsMeuInuiX = [UIImage imageNamed:@"bJUniHTmkzSJuItZuPuBBZdWEcuvQRpZdVRqoAJHLecfudEORrwQLmxNhatWzWzezcpFqKMmWwcIForHKUBmbtCjvDdybElmUjIFNpcIiJxgoWRw"];
	return TLEsMeuInuiX;
}

+ (nonnull NSArray *)erjUSajopdD :(nonnull NSDictionary *)RFaolXlmods :(nonnull UIImage *)xbkBOclFwNG :(nonnull UIImage *)dkyEwWpAxi {
	NSArray *xPcPlqtqrX = @[
		@"yMCPYOKnLcpxwMFoMVUwDLPgDOPcmefYekMIevxrcxLUhBTmWphzMnarhkWbFqFgVEUiNkdtlNuHgQzpGCQWPWQyyJxxrnXoiUiTUKRvFEvDPsNEng",
		@"TjQsILBTVmbwyJqFHiLBdzXrumOCTlpeuhEYQWRsAbVFXtKSGxANkUsiTeoSoOpRPysjyBMoKqzypiWqIliOGPTLueVKGPmNdUUXmGwjTgOyrGRIVodUtHZRCMe",
		@"PpsOLzQfdQoFIVVcQywtMyLwUZCUKotNDvPGvpFKLKNhdOmemXlCHdkltNnUtuUxpLbyYrrvwOwbPVAGnkmUNQWvfbBshGgJYDaXspukLYQaBvwMYceOHPMCqqEldTIGg",
		@"cXFrRMcwZpQkZpTlVSNeGvGHUYwBrOOmPPVpiOPqZfMORPKfufDsRqkPrYjiOWSSQIEGFEBOHqHqVcBvMXuwBSRsBjseWvQfGWxxKylXxJnqEDspyb",
		@"jmxhvnGeDJBFzmkaffKRsstHvAGFhKpQhazcKWmkRPZTsScLezGAQwtogwFTuXhSnBQaRmSfEDSmbmNOErDuxHkVFpiFkyjlGjfUEbFBucRucjfkiaeeDJKdZpykgCQxsIeu",
		@"BIyzxrQHsZplcVrjUlOlFvpMzwkfAqyjvwoWBijsWoSvAutNTEgELmblFQQfbjmvRJqLVRVBsFiUpNRnwVFpidIVAUFqXNLtbCTT",
		@"PiPkNSSWlfGQmjSkvrcGkXnJaKKXKxulqQQgenVIsKTWEZpxomNSNefaRmodUZbUnjxutzgyEmXGIEgKcafHycezZuEquBMPITxr",
		@"hjuHENiUYXCJODbUxtuiVQHiPqnHKemiwxEWXvRCjUhnoGyNTnbkMYtXcTsPdDuwRoaWCignSjexrWhUdWqdQtQrPqljRekfwaNmkIDlydujAZWGzy",
		@"pYSHoGeUOODzKrsXWUfroWGwdweSNrldapksVEgeOEjnMVuHJrkgXtZfZWPFjipTbOCUHfzWhUGaoRORuZSisFktphhIvgTcOXrdVSHwEZkgnXrkQhBzJRLoTJswfrCXGMDxHuMfQBcXpmjWqyphU",
		@"OICbfCdNFPJPzBBQEXZYMojPReDfbKSdGejIHuwuMXFushEehovDADcfxiLKvIrMrxjKFMStQkWviKtXaksxaZwblJICMYJWsSgZLscUmM",
		@"AzEDoDkvGckXxqGqPmrtoXcibkxqWknLxIiTNvrsZIgYXnGBhsSJpUHmCYFcPMutOSjvFCMGRPreuTwJZiBrmycNggUmygyYjPYKeLL",
		@"KpUzIUWFsSCUFfQAWJWZliBEMSUHGKDZIPQlCJVaaTBEUIkaoQLQTfhHfkxqIENhGjtuUANLYbzdmfaIjnAfWZIarQjyZGhbQvhvsdeeGcTasEqJpbogibxjTeCqWsRexZQjXfhG",
		@"IhFicjiCJSGqAshHMxZalLRoaiUPBbABEKvumGZApERhsrXPVRbYGadRTbCkznRJTdyQGMzdCjestAhIcpnSQwohqJDxKsVCYCEuIRLNWuIIVthphzJnwXQGuzLtGylItNt",
		@"VreGqBxiXGmgRMavYOirGfPlTaLWkHmIObYSWvWYHTEWeJlSTrTLULHNYvWOWjauKdcRUGETUJpXhVeGYHwfrszCHDJiCKKhgaIkHHIJvmEyBNDhyzpeGdhMRdMmVwEIxxcDDMQUxfdvJXJ",
		@"MBzxvAbRhGEPdogRkoDvNfTBeXnjMFnRgGhqTGGIOyPZMvYXTJTUOdHiwODIlcusBuKfYQprfXILTFdaSAEHGFfmnMyboSTXYJzDVQPQaEsTIYfauVGGsbMFpkEjBTmpNSQsqnBQdMPcnFoCz",
		@"wgmyoMKIwTBoDytUAmblCPasswbMyEFXUMUTYtwaKBVsLCUzdOCCLNkukmOzuvVAKbSineVQcxTglmKjRzOPDmiFSSejcopfkNAuVdeGgUZVKkTMvJwUj",
		@"ymitoWoboQebHVwXdeVWopJOwlLJkjDmLJKwfkdmiwYirUzhUOSTfmTDDcIJJnRABXqyojWvFYZiyhMclcyrDUwiOzEakPLLUTpIaMJdezACrDrCZcHOoyCgCTRvVqMqUOpkgcSlWThVPZN",
		@"mvfbQvOaRgVLtAYxSXXoGGmnQSJHpKguaTNUxuhNBWQdcnzAqyQIJHwgNIcLgoLrYWELWbwuBGdKJtBfQXXihHqeGTOjueHoISrCWuMFkYzDIcBFcDPBszAPyPRmmYsVZBK",
	];
	return xPcPlqtqrX;
}

- (nonnull UIImage *)HdDUYOZcueBlHkRzhS :(nonnull NSData *)nmlzsTILNvYGjnqqeYX :(nonnull UIImage *)cTxMskHQsEhpqgd {
	NSData *BTDgepcEjmHyANlHMLh = [@"VxomtfWgkuAQevaZpGqRvIsgHKLaOaNiYJphesxFFZNFwtOYrzWBhvBIAVIJmBjmfUxBvDNvDglTBaAMkQYBNmvvsvbjwWxRdNwFFoFcqCTQgOQgNYiiOXRHZchDqiGKLlcTim" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xumYExKbiTPGs = [UIImage imageWithData:BTDgepcEjmHyANlHMLh];
	xumYExKbiTPGs = [UIImage imageNamed:@"IxSDaImSqndzJaRlbzNExiIZcxltBFUKLOqlthNmFdApTqjRJKJwXctUTNGaDXwvELfqxspHyvfvomJxZOnMjYGkZOGgLrzHsLKVghnBSatGH"];
	return xumYExKbiTPGs;
}

+ (nonnull UIImage *)ZvBOaDEthdClQ :(nonnull NSArray *)RFOEWbzcrUgqkTqP :(nonnull NSData *)EONDFwzdPVCVWLvih {
	NSData *MhZhzprabtyVMwHz = [@"occiNHApZusrUInhMbZLzdTOZIcBLAGkpzpZviwHXDCDasdgPpKBRyRGwQzGLcCFasMjrOhneJtCwvfupcVqEcAWbplujEETOrCtyYkeGLeIYLBKwQjWOYHowPLWWVErGzfbXWNIg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YzbsUwhLFbn = [UIImage imageWithData:MhZhzprabtyVMwHz];
	YzbsUwhLFbn = [UIImage imageNamed:@"vWRndnpgreTaWsVXSdTcUIGvboLEKbgJyvMvhOriAGBtwEGqJMYCqYzGQEVIicIuiujhYrNmkorUrrRdOiCDazFjlqvuIOMPgeXBNSwfYhaiezfgbdjOQiClimGP"];
	return YzbsUwhLFbn;
}

- (nonnull NSArray *)rxWgkNqpYmCbuJfKQ :(nonnull NSString *)NragsCvqjCKEbSleEp :(nonnull NSDictionary *)VOAPDqTudcQJS :(nonnull NSData *)gtPwkGnTJTZNFDLiLe {
	NSArray *FKslyJHhnd = @[
		@"UjOqgkrORValgQRcOrFryABKSGfDrpoqWZFTRUBCunAsNbHONMflFFDDzZGbeArhqExyTGEJtOONcsBlTqomYCpHsYgNgzeCGVjKobE",
		@"TgSaXNdicoYLDoIyazMVVwpyHPGqwkpTCtpNkMGcQRTkucbgRUOYCIjCBsBZcbUmFqcubIqmYrXehYFREBwdPuYEurTCYvLfxGbZiqMFGvAHJwEUWePgQAgFWMCAT",
		@"OTCgrZEtpHbMKEaPhlTWRbYMfMbdVnWisENxDKClBkxHhLPBkXxyTONweVGydigYUXsNpSMnsLmFSiBxRdYYSqYYymLeAsAELGfwQKRiwBxbLLsbSwiqqCqFvMFKJuLokudackdtPH",
		@"evMcVuwjdYCiHkJipmbaNZsIalVXpAstXgarOppbFckEfwLiYnBDMPwtgdOizsqfGjlofCmpZxnOSZNUEmVntmLTLmMMjZYLnskIwsEyGQhEyUvmZzUXMStJdjLBghDCdSGecO",
		@"rkiAcUOwOWsJhEjphFKoWVUXgFZtrarqNJvXNCUayIKBpVQwbLPtWuQaRUmQnEgQgNWFTbyPBaEqpmcBRtYKUidmolNShgtzYqDAkwmZMawUzOgPuQJGYIExtxOHiuFfacW",
		@"yjSFmVkHLgGqBAgzLivVolhZeDCorrDqOYcqUCBIUrDKhVMxJGLQeMRcEtFMCeMMMfYskxIeTQbIhAOlwuguIRemSZZUAXYiDDUKtFmxNGDmYrhgfWlkMlcHMLSKRVOPcvjdYElqhpkMJrZgKz",
		@"IzJfyHTfTLdgmPnIUlKVXFVWBCQcyMPpGnEZqeAHsoyGXUUvhqHbDYtRttRLDBCCDxHvJhmmqyseWQKqcFtdqHiXoacJQnbYrvybDBvVziWIMCMRXBdCvcajrckskyqIXuUzAvZmqpqmJKYeliMUE",
		@"cvDPNAUGPBcfIAnDFseVrBeBuVkiwOIVbysabgzUfkVteCRBVCSRjIxbrBwpXmlenhvMqPCLKtOkvxULRCMgkShjhKqNKEbPXBXiUvYLSoVPahzEoMzHoXMwpMtDnyjArtmbarpTQiJMPFhSeVNBB",
		@"zMAHUWZXarRvRVsVETayzUodjTwKTogJAlGqpRqytYvOWOhIFpXjBUhOqJPfmrSQtuyuWwDyGGWwPERYNYgIFAAwUzrXdCSuMKbccCfAdqwqDtnscqxAJwAgoQFKYMxvFnqbQ",
		@"hWGJcwBFMTgqowbWYJgejVHAxuwsQXifiFTOeHSEgohiJrczkEVbuBekJObFOGlbdaMQxDAGpzCKKLbLyywmyvamFegNrqixSedUdlJpUE",
	];
	return FKslyJHhnd;
}

- (nonnull UIImage *)OAKpVkSnyAs :(nonnull NSData *)DIKLrOwGtRcxeW :(nonnull NSString *)HWpKoxsjwzngo {
	NSData *ighBBwlJoqKw = [@"BosxOMRwOKzNBnfBTNWIkOZkwloaXDcpCyjSCDnuEcRrjZzZPppSeipyyXdZffAjyGONZpjDgMDVJaWIVGdPWLyvVHZXZxKsxlogszHNZpsTwnVjiXyLyvWxQaZxEMwumTgRUXXlHeqRV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AfezYnnSZts = [UIImage imageWithData:ighBBwlJoqKw];
	AfezYnnSZts = [UIImage imageNamed:@"QriLYiQCGATLjqoaiHuKekMsqyazrmLwPJLGQWvxtbIYwYNHiScQsYhXhsgNTANhMlSpGesOsGBtBHCUvQrDBuxYUIFbtDIrNYsIWjgSoJElEQrwRhIvKMHwVOvtnCAnyyaywP"];
	return AfezYnnSZts;
}

- (nonnull NSArray *)PbwWJcSiucm :(nonnull UIImage *)NOxKwDDKwCciXaqKac :(nonnull NSData *)UEjsXsUzIpozNv :(nonnull UIImage *)DUkOZHsEJulEnfqu {
	NSArray *DqaWZgoyRufCqeBJg = @[
		@"XHlAEMxSFSoFTMoMXeUNNGCxcLAltgGGwPvfokgUemLzzHPTPSyjoHAqTaNYGZqvRUDKUyPkTNAksIeSBjiMvKHomMytBprjnkoDZNWoSakNjojVdUfHRUTtSEXfYLHOG",
		@"QMzANxkElRQgWhQbfJpxwlXEPkfCXFfFMKiKEGZJiwFqbmHWIoBdyreOqwnwuJLBBzETSbowBusQEQGDfusMfTqHjfpLmTmZyErNEFzrlIIOzUMepSWdXhgXvkzxMGsUOxBySXJnlc",
		@"fJiMyrjtOrhtFYEoMmyLFLiVFzgvVllBzmWGwIsLdtfBtvVFBzeMAikYYSqNMTwcBsWjfIViEhYzaBubHWpzADlnbvWBcBWXMEWLBxP",
		@"DUlRXFMUFwHrYNkRjsSizIfpKkCWWIPwzzAEUQAMrhXQqKDKeGkVzGteOoesMOKOClynkgiiyqLtXQDqXbSMQfbADojhaLWcAyXzAfMzJqMxZtaRdEAmlosf",
		@"tuwuLFSoBXrUcasQNsePhjcOYqptRrqUqiuiBgAYfkiMLpJjegUumLPOumgrBRJtWxnizVPzqGGibBuxqICTgxcPDxwKrckBoOvHHICCfltkZuEBiPuDO",
		@"PanheEjoXWGXtSQywvKSNyrFLginrMjbcRAfPWBvNvBHwQcdvaYpUbydNZLkQQQsidYLXpEFgVxRbEIUoHTNIDpXwkReeAFYELtkjCCXbPGLnN",
		@"HroJBFkVuUrOfRGqWUaTfOFXCKXDHVYfOxqWGgXpltlYYuNmEwQkEXvFCwYwJomyPrbCdqCDsqVqMjZkFfbmoDOZDxWDGRUjsklgzArPzSZBLsCPfMrzDcscznyEqbhwYmIdCxnwUhhgJW",
		@"awKKqDTAYMaccYnkYxFOGisxFOKBKSmAUEnPjOmObAMfZCfxKRLqfLScaNolUEoKiUIFwbKoFmRjrQNiKBvGGyVUsQQOtpjMfacGibcAuOxVWpzgNciAciJrXJM",
		@"gAuoMMAIwUtwxTZRXhVxKPmWZZIndMCfCpXwtlAmlxrmysHdazKmgVePahvdRHYjxFufqdQuJlFDkYOsKOncQtZTIPBYuPauDiLaUVSPyzzkSWwoPgkOBlttpbjZzhYWDGUKJDjLdDDVtWX",
		@"rdRZJBTboOlqzuDeNmMbcptzEllDeMotuAmOhBYMXFwiNIJwHnUuYqRvqfQshCvrPPHneXbDOsIxzdWjvAafzDZLcVgYCTNbsKYzRaQFvNJdDUvinpCUKsKWZPXoQqRvwav",
		@"xFTfGhEkSlTHDlBdBFviqCMPeCkJrOolJfEMFWTdSNsSLIrQgoywsjwZywNbyPojpsVVnViUYjvqdPAxNYXlyGPKiCXNPOUVSTIteMheidlvDpqQEAvOgsckcieDfOJdrOjH",
		@"UdBohkSVIgbYePWCqnGVnymNVZkoscxziqULUCkjgUjpMOrhBKJfdrGMpLHaymbvAEsPSzbjqgJriSGvhqQZyHFflgoqRQkpLInPDpcbNQVMztopOaBdAdwDTuBdnmVbIrQeeTpgFdTtWgowZ",
		@"uPtmHHQkJMTvpsTUjPJHZDHlCdZmRIVbjUjzOnKyIBEkCxdjLsEsesVPzyhAWjLpAgKftmRhuFInvZjufeCePTRKzPMBEkLGTYZaqXZIZxNnsLvarLgCGQeyapkxsG",
	];
	return DqaWZgoyRufCqeBJg;
}

+ (nonnull UIImage *)QZBdwWHkVjTdekWndb :(nonnull NSArray *)SgEduEMxKiySzy {
	NSData *wwMTAlRYSmWJF = [@"csYprlDJxejEuBONNZQJbOVvnijWlhdjJuPJAxGbcsZaCjhQEIcGkxLlMxbdqiFdmlZmzqFROCGKNafOaJJpsFjhZnTUvELcXQkpqaqxmmVKMbcwQVRKORxoVHRaRBgiVgkDTqRrY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xeOhzfeGFDJT = [UIImage imageWithData:wwMTAlRYSmWJF];
	xeOhzfeGFDJT = [UIImage imageNamed:@"xYHTjmjJHrxETIXhHgCUeEyzYvkFLAijqMZrhzZUKyfcMUJbIRHBWzabcRFurdWQsSaOwNolGNCTkUyjYGwiMemjmXOQCwTXUkWhuFg"];
	return xeOhzfeGFDJT;
}

- (nonnull NSData *)byEQtaBgZZYzwYe :(nonnull NSDictionary *)WXCmIpfzSNHAO :(nonnull NSString *)sniTwgucmpOeq {
	NSData *HEgnmBQlId = [@"xJXxuVocsqTaqmsHUdNTUexLvGVVxBsWtAKNHDGsCTSPaxtdBEKNUghevNZkTJICeXgbGJjrlGKKyYtSEVAQzfuaCornloRgBMOCRpJzALPtxaDifcgvO" dataUsingEncoding:NSUTF8StringEncoding];
	return HEgnmBQlId;
}

- (nonnull NSData *)TQJnylkxqwYiqtX :(nonnull UIImage *)gJjeYZwhVchLLxvajX :(nonnull NSString *)DykunNQvJjfuUsVDbne {
	NSData *poEruaMKGCBUPLhxAwZ = [@"TBGqBdwFcLiXGEmMoYeVVetPSuONhANyvtmURbIjIpQDrSxLBBjOAdijqtBkbnFsNNxBPgLDkgjDjephRrwItEqMjYLmgvVQkaqHIRLZkkBQa" dataUsingEncoding:NSUTF8StringEncoding];
	return poEruaMKGCBUPLhxAwZ;
}

- (nonnull NSData *)kboUIvCDFqHAhtFPJ :(nonnull NSArray *)EdSkIANVZW :(nonnull NSArray *)iSnMWuSvaaDUsHOsdR :(nonnull NSDictionary *)UICaVZKNPujnReBYWY {
	NSData *KSgogfmuvvxrIXgbS = [@"WuQmnyXMVfRbUCQajNVdpYwzuWqUhCIfMWiZlfNDcaFhFWmsUDSTitigZmmOblXVmcXqlUdsOirOUZjRPMzPAMfgEkdoGJfNmJghWmqCkIeZvfeadCkWagdSyYtMStyruQbItmudIn" dataUsingEncoding:NSUTF8StringEncoding];
	return KSgogfmuvvxrIXgbS;
}

- (nonnull NSString *)pHPCAZMFLOJT :(nonnull NSString *)izZrStQHAKNcBkyv :(nonnull NSArray *)IaTyGYcMyy {
	NSString *dVdriaOxvEBlahqJD = @"fQpeXDtPIweZQkToXJPLezPAZbbIGkQJuzWKixBWGcfeqmYAbIYTquJYsQtcvdfBmWIamUHEOZLxRXTzntMjlvNXAtkzaIZxnjiVzuhgAJxSVgKIRYSsmgyScfQutpKCpWaxsTHGW";
	return dVdriaOxvEBlahqJD;
}

- (nonnull UIImage *)ydujNkvBIFUoBxZi :(nonnull NSString *)VPCqEiMkpkFHbN :(nonnull NSString *)knKlkfWzXknPGFpyEpS :(nonnull NSDictionary *)kVehEhGAnHMjwFqpDG {
	NSData *aLNxflkpDYMdaDolWS = [@"VQulhUYMoSSpzYiDSxYkszJcYKKemguxVznfhobuiXIIASndJUCAYVBOOdQNrrCTdhzrjGLdSDTJvSeZyrUOlErkZuCcMrExTGAsmDKfWsAtHHfsUJeJZWbHSMRmePGeOmqzkPhlIgcdkOXQwslOn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *vaNjXDzFRERNZolmqD = [UIImage imageWithData:aLNxflkpDYMdaDolWS];
	vaNjXDzFRERNZolmqD = [UIImage imageNamed:@"helhLKkfSOxBrxEuvpeYkjIPylTHiPxsgWgoapAqHQpOHpMAJebVHvzxFumBJWzRzkLNbOAmNsoXfQGzsiUbfhNTbqPyKiUTGROQZJotifUrEffVBkKRWibrwSoLNVMak"];
	return vaNjXDzFRERNZolmqD;
}

+ (nonnull NSDictionary *)HULTfDifTVxjCm :(nonnull NSDictionary *)ArUpepWZqj {
	NSDictionary *fGltsTXHiKzlt = @{
		@"OltJJwXpniCgjkGfpJ": @"QFwKYTLqRRwSnImpkQIOgUXRZymDGfBaZzkRhUouhZEgyzJLXOAsSHxgFmlefZqHNcKKNqvsKCbUBSUmEeCenkTVlCjtnmxOQzwCTxtEBpp",
		@"JVjAvEAhdePdVUMq": @"KsREDIfnIEzpsCoGFYQUozbYqsvdaTSKAjJItZhOpqcwnBnRpUdYuVCCFGhxPFwCvGMwSVcgBBBxCeJVnuGWwpabABLjeMqiwByRJBGnEGiJErxVnPivsXNBVessaKAhlL",
		@"TtEWqkDNNmcYStCTqky": @"LebErpLfJPBibQtIRqIiwWoHgHRLRfABqNsGJwscqvhOkKoDPAiCFHshXgSlzHfPCyGDTJYAzbunNPCTNqnLExnffpwHJAabCUELnXhVpHtAhamgTKmOpwZjUzKhlfXYuBsIHSclLvXTYRLjmsUB",
		@"nDvPjUSpoGaWW": @"vDtAUSCaSBhlXmyOsZJlSEvBIZwNvtjAxLmbqgfnxKJQhBkbFDSzeJcCLbYBGbEJVXkDkDtNvZFWArYLZoATMbbvOQXigxYdBFpmyWOHoEhtOFCYtZBLxqCHpFjolz",
		@"aaHgWXCBtxNLsozR": @"svDVoqDPincvXHxbFPZBUMtPaqvYHzuMcwvhWgqORjFrSbuJJtwZxUpLRwJyMAFjNoyyPwOMvUZSgVPusMBOHZDGhdDKJBqAQTDwISMolaGKeCEvNmI",
		@"vAgnKfPbNLrdD": @"FhsGxSNfvtVAHQDgoGHGmgejbRznqZcSsyIyfccrNhQKxOrVuxBUWuZWUAwFPuipBzpMJnpQwJGTtstPphmpUEGJNOytNwSghZaTNOMlDlgRAPYWkssFBpoQIslhhnbNO",
		@"bYTCiXUXyG": @"CtSfEvPPyfZnWouUrGJkuhzUAruyjoCrDrQPdIarlMAorVzKRgkejCbcmJsWDAXABIiNUXkpHezspVTosKndnvqmIzUswaZWlJJFerywsMnCoCTCVQpVaPAqxxgsqOhPXARLGCKImOQPYZv",
		@"mbyIYKgzOSI": @"TqKhYUlYJSmSMLryzjiwzAAfWyyJQoRFNvlAfuVcRoBVMPFgVyLlegdVsHnPQkQEbmWRLJOQOcMUtfwriEdTXlVCiaKhlklvmYOPiqZUngjaXgwEvShRYlQUMhKQCa",
		@"IhmmXQIdEmHv": @"QJRhGGCQogUfkHKAqvkanHbncxQcPTBvKsvwVVElklccEpHdkeTzuRknHiygxqNlbwnPfFZsmnGRfJcTtOXyPNdhAqaYozldBPgbwLtuRAFfJrTxYMCWuiGJlEgIxTKsUBzHlQnhGIQManNsuJrnD",
		@"FgshqFHWyiy": @"uCmeTosfHFrjfGDepYfWhuMXseATmfHtTSWVumrqyFbJbIUQHPNnPvCJnoTFQGizupMvhmXYCjUkZQHwLHwCBXCbecvUfwgkReJOCtwPrHxTKDGCWTbEEBsizXSbP",
		@"iBrGnsxMelIaAdvva": @"oCPBWfcswodDYsXykVisWDOVMXOsaFzHgfiAhLepxrchQjviykAuIxoMjiqQzLJHmSMbpwfpvNGmvfEQCBvRhdPtOJPwGJkHpIJYlSonKtGyEvzqUNpnhuYiWdxXamYi",
		@"qwmMBhIeCjQamysE": @"BpEKmyeAdoNhPMZvqBeABfLTJOWYcuyOFlRBosqULgfxdLoJfJlXTwyynJpQQQpunlrkfLtXpkLOgERtgdXrGgghdXtVMiUMvIqlpgVwZreNMZj",
		@"uaqhXzHQtFsNLBLDsAr": @"gCaeNbSwYRhyFNuYqVfjJxpeDChGmWQNOmOAfEzbetFEzQyDgQWtknmdZTGdLzRDOIkiQaQCESvMZaDIpUHlxVgqiSMCZUwOYgkgLNkFxtyNZfBQ",
		@"oHGyWCvkZC": @"wcuzHaLIKLYoFtxHJktrtUVsqjtmSTdTWideJldGIWGeZkBzofLjmEFHocanZeIegjSjBlcRZkfpnvKkqzBcmOxTePkzkoIShLUb",
		@"HJubKfZeiiLnPb": @"XIgyfPoFKqToyYcDUgwSlcoHerJEGMAtyjazDuKBTrXVnAHHxdHMFdZesmHtSLLXibAlmjrTglTqiOvNplFNapqkJgGuQLBIoeBsERZszLWPekkMDzPqWgmYeVnfvNevmMZssJGcezM",
		@"mfwQGDojzLjoznWdTx": @"wBjPkrwjxodzNrVNnmirWIQuqYKtlvEouQQTjZSNwagkZgpEgYsKGXWMQttAxrHrTHXcYKFBrOrCbhHecYHRbcfmXNRZYtYdDretYZjdbTvXXEyM",
		@"AfcrYAzhZoeWHZIb": @"CKGhYBeVNSgQKmmuVMtQnqcevHviarHCRkMmzwgcmCKvVhfpSUytbTxQxnFCteppExMPhvdLlHjTyDDjtBMGQrktkerGtANZjBqExloBSdPSbmDkhzMzMPmIdvRcAbUrLvkNgjSNGMoXO",
		@"DZehBEUnQxjqEJZNo": @"hipQWGOadYNEjoxELpExwlXiVfuXxXFCZRwLyKyWpFCSNFYhzNGMwqUwMDDDkfdzCTBubmPzEfVNInmIVQbuDWdVcOecVtZSJNKd",
	};
	return fGltsTXHiKzlt;
}

- (nonnull NSData *)DvXWiBDLTZPJGMgSBm :(nonnull NSArray *)YGcZcgghdNqDc :(nonnull NSData *)zgHvXuQCOSyxwikWbZY :(nonnull NSData *)cqTYRcflDtwPLraIYw {
	NSData *lCJpgmaTmmbAzjVXg = [@"JHrTwoHuFpeNZehXnrOBlSOphiXjYgNVokRXxcNbTWDgatPYCnZdIjuGLFzduzAldFyrNQMPSaSeEnpaGAatHrdNdyplWLOrLXraBYQKdmeRUOWJdHsdSXbStCXEeOtqiIzkLKfxaiAN" dataUsingEncoding:NSUTF8StringEncoding];
	return lCJpgmaTmmbAzjVXg;
}

- (nonnull NSData *)ZAqRHMLtbdRzzLhq :(nonnull NSString *)KlVOwXtiEskdeIwV :(nonnull NSArray *)BBtDDDISNekNgMgPnvF {
	NSData *uIOMYWhhaeJGh = [@"oCvGvUAFERIosurvJyIZZNwzwPBUPnrRoKhHMkVEVwYuvbuPiKXbrocwbZCbjUuyiMgHXiJhaGQblqaNWzicZnmiuzwFaENHVjYBiGgkegSICdepqhybIYEElalDDuIaQKKjpT" dataUsingEncoding:NSUTF8StringEncoding];
	return uIOMYWhhaeJGh;
}

- (nonnull NSDictionary *)gjzRpoRwlPGVnZwKeU :(nonnull NSData *)SYDJvOXeNggRcxOE :(nonnull NSDictionary *)zpumvXpoQZy {
	NSDictionary *NnurgnrkQT = @{
		@"TOzHYAamqrGqVR": @"ivAudIAtzHhnmcHCgPqSvKuomZAHTPIIlgBAyHlZnhqsJlzeBAUCDJXNSfOGigGBazFuowBzayKNbaNEJGqQtjVJfQcyfSJamtHWktLXcjpNQ",
		@"BJdRVtIZjcdXj": @"iYsvPEWJrrYovNtmRduhrxhpZjHAUWKJzZbkrpeRjBDizISRxxpPDBAYXjfIRWXGmHhTuffQisYQvLgvCKVludYFGHzFRMGFmBuvlrzixvTXzuunIOqJJsHy",
		@"gsIQQpUutOk": @"AuXwFKLFBQgNLXbtEfsBsVITNkpKHIERDvtFvOuJDowNsLExtRHRYsTrzueQEglbioeKrgJYuAmWeYotbZYMZkaARLQlKaGGqjNOaLPzzdxaY",
		@"ftOzHlyezqtuqWsfwKH": @"RAtTHOcCnXqQxLGySLMyxrjeUsJIKzBZhVVIOJWebCDWngcOGoIETTxczfpoZuhWAssRhPREnBbJgltPBOuUbZEiXfoBhsXijuWaCinBeTUpiZWllbeZzcVEnMnEyHYnHRY",
		@"SvBFKjhuUxEjt": @"fndlNUJEaaADKeuvkcfIomhmaCuVLQwSDnrZcXMJzNfWrLnCuTRtXIYVNhudalxpuSgbLZDfmsBPMDwtPqsamzzqGzYjYGrpSZeioqaYCIMKipDCNteCvAXfj",
		@"vVOQQOEIRB": @"acFCnPdsmRjMvSocVIYcdrtUHOADfxnchiuJTOhDuzxflCoiJftZAigtmTSENfCzJZzKHolgZqKUssIIlnzddLDjUfVlEZxSCLInWNRUSQBbRNSoVSQfbLxfcmjrxJVEadmjqHcnb",
		@"xzGMhrkhLNzsSwWnjMl": @"zsYGbOSfnSXqWVCfUzOZtljDpcZWkQtbAcaUIjxpzOfXxCykYmiZNSCdpPpoeGjNgOQJYsXlaWWiqyBrPRVPbeAqEmbcsNQTEcmTUsdATCHjKQAVgRecKnaJlh",
		@"eufJnladWs": @"WydAqNyHuXSHxEGnbUiLspePdRyAwXylhHcmyPqYlgxUcISupYQYfHKMwdOsqhbdKqNsCWHyZmPafbphLtQayBimnVoKzODxRbuAGPURxiuClBNugFvfQwsQm",
		@"hJTCwNLMjtg": @"ljFLSPlejzbpjXDzxXmsAlEOIZdkfsdguuHGcJBIPrOqypiVxnzwPiPmNQRlLsGofntNYiFLEBExOdaGHYGIkFYExmfagMcsvCVdxbkhSYIOJTeSLqxBgoCPkAAInHGJZZZstykYAu",
		@"tsyHHufGNmOUZJDEPw": @"OQPAwXzcRyadnlWuJiuKsjWrmHrJGtagkAYkmMfrWSgjnpvIghOclUNOhNoexYUwVpPbwlaMGIlYMVpjHGbLDllKYDJkmhavChdvCuyLmTHYlvwJBD",
		@"aGpoAPuJIBdsVOcbSH": @"VzxPlXJssYzDgUbAkeHKxduOiVrbcEaSnYnECOlixvuvsHxMVJshQFfmkzHHwUhFWUFNOXEebvLkvYTCFtxUaickgXcsCqwXNUtfoBRnbQlcoxodzQuNxpgIISDqFMHhZwzyBKS",
		@"gDiaPeHyGYtU": @"garGtVIXeSvFZNAYAnRMGKSUpDYUnkrDjrYzFDuGaQxZZGmfcMuMfQkpfCKCwpNavbULhbkjvninckLgcbuJgyqhBWvKPNZnyeaZiglLBxsCaBIpxtrCZTPHIUXawECfeqfxUW",
		@"ZFnGEzgTpUOhecAA": @"ACZsexUlLZLYHJYpSScKbuTtSYMJglRuaQKDxvOrBkHHACUwMQXRjoRtWXudJBDRTlNaRasKIXOsPJPQcmPPZwrXtzZwWADlUnJZhQpRaKUuInjscnABRWie",
		@"JzdfTumoCtzwutolf": @"YfrBJKLlVraenlkWKGXddhxXXaTBlkskxEhICwwwHkTVMIuQnAYWEbPccwlPfqCHmsRVxVQKLNedAhIJSDdMrodoumjVgfSLMjfsxOi",
	};
	return NnurgnrkQT;
}

- (nonnull NSArray *)wDNzOwvkAGHvQirv :(nonnull NSString *)KrgFzTbbYQGWGzQInLU :(nonnull NSDictionary *)vLirxZWJQQ :(nonnull NSDictionary *)KapKsHYbDiZhqasS {
	NSArray *EkJOKTavrrf = @[
		@"IBYDEJBPWrPaeRuKpAxzAITsfwHySSqIhLvpTQKLBtxDzThpJmNriEMFzrIrmkcENKLafcmhdZBxbyCFpnYUbtvlIamzyojoMgIRaxoVn",
		@"HMNVBxOsAxwLDIITLeqAhfFdxhdLgLvPBclxHZnNMSNoDtDibWwVmersapXCbRWaSrHokGwnwsKgfjbgHhgmydmljobVOptuIBHBdlFhUKmSXiRACXnkGgKlSlqRwjc",
		@"lAupqevQEQZGGlqaCnKhehvUYZNjbrIXLzGwMJIhzNWTlHTRfNHwcXNRSqjHQRNnkaRqEsLKuUsGDckVzDGHrfYcCHqlcIlLBIbyIEKVWcKUx",
		@"DNluFtWcYgazGUwOIrqHAIzoXGkyChpIBbVTZvUGnqCfgsLjIKITtZakymOGwbMHMeNgrWRTfwkpGbDtEBiSckClWIFKkoFKivDuMFtCQCdSPEiPCLLNYwqDoQVnnDosQcphTDNYgJgMhPkomUlwo",
		@"kDzypntLiFqCnHwzRWxcJpcYvuaNrkAJGIkBojRGwcKoCGYcmiCrYCRHxnkkfvwKiCheAjNNJitoOtKeJvvtCrAjEChXDHtXGmDgcxueCQzFtGKXcoHwOwjwnSWI",
		@"RGmqQOySDRATSmBniUYOiDPTxlkiOstwUDEEqWdvaVAPiULPpCGJsGydqRcFceCAmgkSCVkzBlXEpkPXjBkdpeyRfLqJxZxKFCCccsuSbZWwLswOglpbWUgFTCExfxFbV",
		@"zeXbdujvScRpGYFstAoGHfQPUeXHYFXhaqcpQHPskKgTQVEwsusAyokFbOBCCqHtTSbqrZOksPwQEFaNyRMAStKCPxBpBgjiyphdszspjkuMcq",
		@"vmhYyHpuoTesnIFNfmmSigLdxKjKQXTmnCZoAwzpUmKAmRwHuFiMprIBHmmzKfudKcnumYrcVUSmSkTezCXiGVRUaDoueNxTBFIhbUUWXSShWSAPJ",
		@"GvwoPuEGSmhnJuKFrPddJdQrWxlxXYwwoiQoXDqeMHJVGWTKBYxznEbAYbGUICfGqzFdvRByRVQqpvcrzvQfkmioYIUnCznYclrQINTJKSlpvLpbpTPRi",
		@"jVmyySCfVwvmGduiRxRZuCBnvQxdGawWFQAegHwkctlgyCQYNpMjXBETlMnxXBRRxmRJmqOvjARoPEhVHMtUiqMQPzvxWYNGXBRKtyICggU",
		@"dUVAdSjAXcAaAfqonYvozpAwvEekEimDXjajNEWlKPvAfJWReIcRfthuqJiEFuzpZafkulBRnQOOUACkOYYHllBiUAvrlfKUeqSgdSIGdoXkmTFarwmPj",
		@"WcDrnQWTKAmMRGDhTjPzZuoSvMlHiVmehUWMAghvyGomUHRZndHQFZRlwKumhwGQLINrnlqqIjuHAciyytphbNJayBkjlbrcFmClZPYVRi",
		@"XwJlXDqvKCgxJjwymUVUVJRrvHTiBBHkorcybsbIHpSgrpbiBWnagfJsbEIWcneekbXKboxZsZjAtpKxNHATnRoJMoPunMqvkqOq",
		@"laYevamSjMNnFRAkqirpGMQtqxuiRvPwFuiGYSohUdcJwucCgMleUbhgJRYhOCPdwvQQIfTlQHHgidWjGFhfYImpeoNWitOvZmABdTJbuEERRmGCLpcFpLtBLgrKLDpsJpEjAK",
		@"huOYsaJwzTCKCUUZnbpLhDCLGXCjbVJsrxQuvWoeYhhUCFlvleWVcnbxQsynEybPicdGuQlqvUaTtGIjGpvHOFgKAvgkTjwghiYMxsITVyhZzltVeTdWQQRttSoslQzfJQPCKyum",
		@"JasXLhmzujMgKVGTDvlYqppPYZOyTfcqMyboDJWrhJFSSlAEomzRpJvyjIBclmKgknHzmxuQUtPPNXWWDjFHFqbJygaBxuCcjcJryrHgaXXAC",
		@"fEJBNRKcdDSbtqqGXxOiRmiUmXBxDyyvOsaWUZEWbBAYfBAirPhFbJMmDTtNjcNoctdlqzApxUsqGRxFPItQdXpAiOLadnmSDgcIbDjbmqTflsiCOpiTUoJiopfBrFcyMHjHnFUxhCPxyxHqEZT",
		@"WeiVrtKtRiaJgiXwyLUftFtLjCEzrOZhVIrVQfecHSkFphmIiPavdggTORpdtbFxnXfNUBBjsfpPHRbLfiUDNFoXmFUkDAxWDIkaBVyTrWYFGNdaLYHrgqRKISNXMMAsqPSpVRFlcURpHGGUwZWD",
	];
	return EkJOKTavrrf;
}

- (nonnull NSArray *)fNHooWSllRfvUPI :(nonnull NSArray *)hYbUiWLTdBomWivpP {
	NSArray *dNIxEaiYwzQ = @[
		@"urnHNygPDNjeuIINdFNwWfNAVqhDHcOoIXMPTAaWisUsOogQDPQNQIPHxFNontjlnhIIudletwhmAgzIrxcPnFOEwOWWFNdLhyXLdzGZHlhxLLVRSvSuxcPWiRALATNBhTgPyv",
		@"cncZWgXTjudGmmCDZgTkXUUvFOREjOzUteMOXpEfyvbYcMFJFtsAYHwqGKCzqDeXvTBiVjsERSglvWQWSuWhJHdPwxfPyUMZfXetQHUjAiNkcsngAYmQyjgeVdWeLGY",
		@"HacpEvMTMFKUfMTEGBcYHwVGKoZmYUTMbIgFXVqadIPTZqkABaZQEtGbbobPGSaheBqUFNXhwJXpiCnFKqNJIAkyHRUaUXnYzaGcvtdSofJB",
		@"JeTVMoVDXmRYiYHWPpXOFaaLwRhUKeXYopiVdutkqGIPKMlHSxClocImFXCzAnPLTJvcTaCEkxkeKkNnQyWLqRasanELHYWGoptcbNSFzbLdmcngztlCjCUomxoBEfqggTRgDDypmweppcuDoemPb",
		@"aluQGeJyjosBgprnRlIMpPfrJDyRSWSKtmEPNYVrTEfJfWlQKjAMHjEHDkSBocWGxkzxFsMvxjwZnFvlbBKuDLHcCuxvhyCUbDfgKxPPkqxJMFWRLSaHpGfzOu",
		@"EJhIjyDmrsRRcMsbVeDwfZELoHuXEPlsetXKBEEVWhJsyqLOaRLBUyEmIUevCpBtpcdMhIgWixkbLpRSWHYxyboAjjoWfCUYMQJEjLvWyQZjUkddYnaluoBJuqkoYodniFKliJV",
		@"swVHMoTKODOTQQClXcVZrRUUeAhewbXGFLBzmrxVcgetGPVhIgXQrQQYMraCQVzglKlPEYdWQTkIgnlqjvuXMOdSZHHQUbYvUhRoPfTaLMEljgkWePTSAmyfIUFmtpOgyuz",
		@"btKHjPnNpckgRHaCAfHrtvCWMNbJAtXLZyPkBAsiyUqPTIckiYETysbQjTfwvIoAHLeryUKjwQpafwYnIgABqDXZnpGNXnMGADNtvYvpbQJGvaY",
		@"OKVUnvDvYXFcOGwaWmrYvgbJscJTYJPonGfsTbKVOtdeLYvLpGtwsAiEgcvgylRHYMGUZRgWoioRohHSbVAUAnRiMfnLmQnGwFJEftJmRJAtuPSonnxQpL",
		@"ozdBhzxtoCatwmeaBCSNZIRRLqzhmdGkAHItwfNnovowsNjGqzrwXNgcwhlTposlmVIrWkidcKWaqgatvQvwBSHQrpnqkLOgxSLkkwLnjqplLbdUnACZcthA",
		@"yJahmviuVfYzYrnocotLwevqwstaQSYIMAOcNtphgpCgiUczMpCwFlXILANXSwQwpVeuvcIWcIRzNsTbGCxeQLnaccLDIYoBXfVZbAJKpNvOzkVtZXHRahRTJbtrtMSUIRwNxsqqhKwulcqrIJfd",
	];
	return dNIxEaiYwzQ;
}

+ (nonnull UIImage *)IDUWjNAUzTzzFLHlZe :(nonnull NSArray *)xvOaMxQpFH :(nonnull UIImage *)vfRUoQYMmWWAQ :(nonnull NSDictionary *)XDCPRLJijyPNFzqvf {
	NSData *WPSrXpMXiXDUnhy = [@"yWjdyMwrdZgGkyahkxIPDHiHBzMGNSPLnolximupQxuZatCBtbWBEUHHBVwNbUdAMKAbKZEZXTgQayBocCwdJmpIQnxsZDFHrDcyIOhKLwnZaGNIAOKGqhzw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GgsSqpZrigPel = [UIImage imageWithData:WPSrXpMXiXDUnhy];
	GgsSqpZrigPel = [UIImage imageNamed:@"gDWCRLFmnaRXsploOleaCMHSUmijDcmZOMueXZPTQSenmgpGaKNasKwUbZOffPDKdCHRSKOspgMlfaTsqGIIQpFBHemzBpcMNAEIlRbhO"];
	return GgsSqpZrigPel;
}

- (nonnull UIImage *)SUVsAkbKKluuhbEF :(nonnull NSString *)DXpQRDMohrxk :(nonnull NSData *)fBTsRodHcGZwqnaK {
	NSData *YnUfeHiWgyKlQ = [@"RGZurMREvjzzCzbQHmliQinkAPFrAyrQKYhzOlFMdihufUTRRCcHELDiCtnZyiNkWxJlloGftenJuqziCwhLMbFjcrrxhURVqBzohAAjIxMWRFFVXoafdgmYrP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *veqQCNGEAOcMF = [UIImage imageWithData:YnUfeHiWgyKlQ];
	veqQCNGEAOcMF = [UIImage imageNamed:@"yGgHpgQUsVvJcbHfLkJBoYoryZylKydsDAKAceYoPcanWnkWBGPqzYEGwYQhNTwHawuZwmOJSsZOgmIlPCqElYRzoEtXadKvjANbHeLtjZpwMuNqUHHyiShE"];
	return veqQCNGEAOcMF;
}

+ (nonnull UIImage *)HJfkYWCZJBwN :(nonnull NSString *)EBIQFxqbCIpxCJQ :(nonnull NSDictionary *)asBwxJXeAqE :(nonnull NSDictionary *)GdAtipWVnlY {
	NSData *eKYHweWDTeiEwJDJiV = [@"tlsKKnPxOyqtqSQBrRTectFxJbNiHktkcawnPwupywbNksydvLdlCnWnAwyCEEdSULgGFiCpbIhKzbRqdxnqbVFfRnfYndkgoACOqKiYlYcFcaByLQGk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FgpIsEQkhw = [UIImage imageWithData:eKYHweWDTeiEwJDJiV];
	FgpIsEQkhw = [UIImage imageNamed:@"VWhvXkFYHaUqDaLtqpJNhWKCPUSNGWKWSGNkYlgdSTeOYXZMfYEquDMsLNkwqKDpZkUWzlXWATmOAfUeKSijPRqxTDeoKEzAuEvbvmOxXXwBCHwpDcmZNIpbLLGsUUQGhrYtDgzsRYNW"];
	return FgpIsEQkhw;
}

+ (nonnull NSData *)tJiHNwwJwKspovCVX :(nonnull NSArray *)DfVTkOWkWM {
	NSData *cqCcleFHOxbY = [@"HQrVOVFvfZwJoAdckiskeniOGCoucBlAthWVZxRsQfmQmyYxuzODkWCKGCGehjEboatKuDdzGteWTpMwyQDKbDzERoriViftwdoQIajjGEepZWPnxBgvykxbgT" dataUsingEncoding:NSUTF8StringEncoding];
	return cqCcleFHOxbY;
}

+ (nonnull NSString *)ASjvhhKOfsPqRbpAX :(nonnull UIImage *)CXwCZJmMOiBWaquAEIM :(nonnull NSString *)SdKIpvJBEJrpSXGb :(nonnull NSData *)WbtntUjWVbBRRsPlZ {
	NSString *qVYlLMkEqG = @"lqNqiOCOFoUQytMhxsVZElUZWSjOaGaeAjkGCmvUkbPlfYLYrANeHurosuSMnSxhnLdQPTZaMOXlUKzSdQUoVhChfJpeeSTLuBDAcLydXjRrBynBEwTmiZBrLkRhEVVfvkyaYvVkJbZPtOnLjOUC";
	return qVYlLMkEqG;
}

- (nonnull NSString *)MPVBRUWSuJJJhjM :(nonnull UIImage *)MnKZVnjcdILAHOrMiS :(nonnull UIImage *)ZxlJtVMYZln {
	NSString *nhTNWLVrQurLog = @"TPfAUPVegYhvYAnNPWCNNyKxiRLhyLDHBibvmDfHpQAplhFeXGdJmaAoUIxrXmcYWASVAFiuiRmtrcsyIpSOnZHfzfoMonLKZuKtful";
	return nhTNWLVrQurLog;
}

- (nonnull NSDictionary *)xisaKVMEcEjkce :(nonnull NSString *)HHkuSmwwpVrXL {
	NSDictionary *rHcRncyoqDJgEykeWcU = @{
		@"dsIJLLXUQWmmdlD": @"glVJRqsQMYlmCRolzpjWjrYxRtqmPhFvvoGkbfbuxHvNWJlOgxFyyCHoadNXqkbPBjsrfQNCvTDEPayBnrgBciFdAgHgwqgOydJautweVrLsBPanCFaLwSlJ",
		@"OZhJPQUSCFhtV": @"rqANwZTZMqcpUOBbYCpauqTqYmDCsbWBEFKvypnbZhMrBmyDOXGCQrcLlmNRkMyTdlalqicazJDUPtaqbtkzldbtuFQDYEpUuNNh",
		@"xdMBqsSEUNtmEpq": @"skgkZNEuqtcfLYzlpCGVtqkbHUuywTjsLRsjsgBPfrqxvTiNxRSDJqjouLUiPPfgBJNSRKmAzbhweDhEkHiwaMvrCuDFDMDqgPqjwximvDVbZiSpytjrFciToNfwoBBBeCfwtlEfincRwQ",
		@"MwerDFbAZFDXuCLLCSE": @"otvLkMcJPIcZaGcGMFCgMzHaTmUwAdifFJTMtXtUBwChQrksvWZervWJYpviQzJcfjsQKJmqDAAHZHTBdLHdYKlXZmoVpoBKympwrCuHBSjKJUjlfkeThGQeIiDEipuyIk",
		@"HpCBCwcyUh": @"SUQMtfRqtVThuiTZwdIexjgSHyoZXfrdApbxPztAvZVlElRdnTILHhOdggVLFWYAjuGWAYaZAGRQvwJwPtqfKalulEEErGJZAtvwpLovgJlCvKlHpMkLHPvXLeFdvtYxbFlIjnXhgadgclVF",
		@"dnqpgjHaigOf": @"ULObydkjvbOiLhnfjvRSOYHwpEbDkluyLRdJMFgshiAgDDleIHmRpUgijRinrYTRtOTnaEJWmtpijmqPzugLDJyWLtgZttGdUaraEtgcgFraMyIoVUflLZtqAVXZMmQvthWgjzJaBZYjCUDPyQa",
		@"MmARuUJQoStskbdUr": @"jEtkUVsVkRGKiTYcqNmoxQIAOGubEHHvRTKLGTPRdRXkXrNbDfgRmydIInQtKcvjBqbDcAJvYABghgktewhSrvpkEQKRIIdbIjRxuQMbpqLvqMPblZUdKKHNClMeCidcbR",
		@"yctezqRaarufyoAMr": @"fvMiRvfXhzFnmKLPpnihtVlLNUJTVaFbWFrzhyhCvipBdGUjVDALjOxtjBLmuOxKeHciYsHGJhuzAIHyGcXbRFIQfYgAadoFfSlhgWPXjkrnUA",
		@"YqEWmcuRyRrQ": @"nLNNFikdTnnUQxnujoWHfKDXPRtnmCekHnJAyCxYWIcxbemgYXmLHENxKYESOvbZyvvawzLgrbjyptPnArrBslrzeMWyxSOrXKRDXeTphnrnlPOcbsDGRP",
		@"FwdvvrCjXvTbUutD": @"KgyGonRSImsqpQFfDbKggMLfglYBYdkcAwSjQuURKgVAXMuZCDnuvbtALdUbfSDvhgWDbIJDfYwBzChMMDZxskrupVavpWYhdOCJBGttjiyVPLfXobIcpZGugCWcWYNK",
		@"imgNZBUTHyUryXK": @"PWmuZilgsBosjzsLJfwjrdrpnARQCLjjpksvDKMtqyHKIOlSGZmFoWxOYIBMqTNzQYNcgyjeZDQtEaSBoBNuvvEMDgGgFQKJKHXlNSujygiYDsLRmWhAmclzuhYPCmOxgiWsxiDeXXBjdYFZ",
		@"APiUlEWUjrAwHZXbg": @"cIPKMGIGZQGEKYuxhrgNRRQMjprbsbCDBiNeunXFrnEfqMrZUlzmhnJOWaZiaAxXjjaZmdENGkIcnmYXTjSwySYNuLyncaEftephABQFTxXdCgT",
		@"evElSXNiqlpi": @"ZlkHbhFmGwVioEVlDNlQCAIvGMnnUPhklFwdprVlDLLsvquSVBHKygQESirKodqYxvXWJxFXOEjKvcyBWEmnMhWXuxnaBytGaormGDgLvagIGvg",
		@"qieraKihdTSiFqAikv": @"FHcUJEmbCyuIHyltrSzVckEQJgTkaJPgNUBYxwnyYlBjkCOhPmyjsipBIyISdcwtkZYIetvPCZAxVEqDAHayitGtogZeCtPiVEKXVLhlRvwBezW",
		@"zFupRghkQt": @"QOLqemIjMIBBSFTXwsTxIvnxwSISsvwWxiegplLZiZVmDUKCePxKlIUXFpkPWBYYzEGCPsiQTBJnPlQeNbRHbOwPFNUYTpLkngOJECVpDLcxNTeCSVqmtMkcIvBaSxZUAHvEHcajXaaZMRVrZ",
		@"jZqhKSKyboReIRtPo": @"sEexdOPiobWpVxSSRjMduDCDMTlBvSYAjXCJciLFYmigeZtyTXwqdDpKBwVdRObkzFCoFHQeqSBhthPJwvOUivsCTnSylSJQasMCXsybvxbrzsfuDcDywfRYfMdQLiNtdiNPu",
		@"AGuSaTYNnao": @"TBpOtpXZLJeKRrijsCpMiazDTWhDJKNgSrHzCyeMacSGOBPSPxmhRMXIlPkYgHBWQCRJCjqBLswMXZfeFvqbXRpkQKpvmHvUXwHOrmxGvBKUBXoABuBmYrc",
	};
	return rHcRncyoqDJgEykeWcU;
}

+ (nonnull NSString *)VGCbaDycrgLy :(nonnull UIImage *)rRkfwyyGbjW :(nonnull NSArray *)ipLmzNUbuKCAE :(nonnull NSDictionary *)EHTAtQmwQamIQpv {
	NSString *cDpklhOItFAzgjMmr = @"iSkwZVrJfigTuYLtYENirPIPJpNEIhsbjoihVYStSmNySgMUKRocKWPBXHdxiDNEApJgVEfjYONHNJItuzTmuXcAHLZFdtVxrkpmxinbKvbOt";
	return cDpklhOItFAzgjMmr;
}

- (nonnull UIImage *)towqpcnElnGPcO :(nonnull NSString *)ABMpWFqZJSbFluRHbU :(nonnull NSArray *)FcggrpCtqa {
	NSData *aXdDOaiThRULrdKgj = [@"ROQqaBrBwjIRfQljcbmfACCuODznCgCefYpcPZuXwHsODoPHpJNXnQCpsObTHoUPhSMHYxNZFJjfjVSNLfHgDzwxcVmkjuekxrrthPfKBHHDsLYwjehMzxuGvNkRDsO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yHqRhEZjjxzKG = [UIImage imageWithData:aXdDOaiThRULrdKgj];
	yHqRhEZjjxzKG = [UIImage imageNamed:@"FWHMNxKwOnnKNVniLxOVBMeUCRofoigAOJUEEaemMNvQMQxCnoEXxBmAFOfkzHLtgvmmzRvNKafTHOSbqaXjwlEMwRypXOwzWauLFdaLDYtVXghszQwXiUgVXHlljRwWgcntnsbWruTbdI"];
	return yHqRhEZjjxzKG;
}

- (nonnull NSData *)FAIBbRaffIYVBhi :(nonnull NSString *)XdJRsHvdQR {
	NSData *PolExHHdOPIuuFxrdz = [@"nrHZVbUERMmwIwcPyajjDdFNJyGQRYSxVUqyXSRbUHTLWVAAyalVOpAKvGiNPnbYaOdEAZFTdCAqIGnHOvliPtpCxdBcoyicAPOlmNKLRHaaeydJkyCNvbeIUErAIRQlTGzq" dataUsingEncoding:NSUTF8StringEncoding];
	return PolExHHdOPIuuFxrdz;
}

- (nonnull NSArray *)EScAhYTuyB :(nonnull NSArray *)hovaMrWrlKDCdw :(nonnull NSString *)yrlnbLUbxKQkcSkcLd {
	NSArray *sQPQjJoFQnIks = @[
		@"vYUMpJkbXFiWECQmvofZGSEcGMNxrVJhoUAmqazHAHiLwGCcPyWDbzQJqATIoIEOfpalsgmUssXGsqqscOdNTNVPHVLBvYmnvhrPqsJRtIcTHUEpLhVloQjrus",
		@"GXDMHWIpDCuCKReRFWVXNrtATowJYpZjVilApXzhshkbzPFHuzrsofZMxbRerOwFsEQIDWImTffwsrksONkXCofOUlBvBDgXUgTYlNhZSWGeDHiEbcgvqOOjrApTCMKpWkNFKDUYrysmDZxS",
		@"rIwJsuinKktXkgACmAowJJhxTJYSYoPKakVIakXJNOOdPmoSDwiRqHYmprRshouFAdKZwUGOyrmEzwhfjQlMawzwNNHSWLQypnkbFskvKvBUjtbCYNKMRlikByGe",
		@"eWAbMJGIoifYjuhEBOPKYnQYonGhDlQQxDGBQNMFxnjWNEQQtVOHACTERRePhdsAdgpuhIAmWDSefPEWmpfDIoSxMHpKZWtlEFHuKLyk",
		@"jFJjyBxgJLKvimNxXsJdXUWAseoBmpisvRDNeRJzNbwKPLIiqNwkOUYLcSVVNIsuibyZdjfQOUsUedXLnPIiVxJhLZlJElDuuNncldzSpFIDjySyWPC",
		@"WimqwrHEEjgAiMdCNxyjcXghtglwiDoAajlYWvMKXYqfznTrMddgAieRyxualtmVKBNLIZYZetSCqYBvTQyejatbornTiMXhkFUElkKpnjauiKIPoyT",
		@"bMovPdjFXDFwkKtdevpoiolOZeZDRWorVDcokMMoMhLhEvKwzxiJXctivOFWPIYJcsfaRDoyUDmfEgIuBTZqMFNXqIaFNSWQWlvFiyEyjkTaLiYvgzFkBBG",
		@"cVRQaMLnwcJuTJrYRhLTrDjGWMdQHXwnhcZcdybZwJyZiwckdKxcPuKUSLYpMzJJuXOsZXuwkscJrBFHbLdwDwkwXzTYZQLzNmQvhlkeTWSnTllCdaWrgikXuDiLGjnyVkqbx",
		@"fLpKVgmzksoLhXMOtHDIrsWZpzDQlaNOgdBtPzxoyrgFVEyWAaVXNPxZHezahWogjxqFMbAGRZoNSurCgkfJLsSWDcBHsjSsliwCdkqfsJqebZTfDLgKtfUHVVYzF",
		@"qQOUYioVZxGiGaljYdHWzQQANmXjaZsYbLsHGvLpOYcwBlSyBwFCQvDPPBIhPZEBlQKxPVtBdvWeySQhxAZGrXvpgWqgWdgVQZLviOlfYGTAoJlbHvCl",
		@"ZDzVvCMkAuVBHzthirZdXlbZJppPZEVALLPWVVOwDWkCrabIFnlRBoBEluSXXMxZiInwOnyQbaJLJavkEpQHkSxYbdGCuJVndBkTTgTViwbxNczgbnwJaqjOLggLzcADh",
		@"oVcVtgfNJpClaSWUKKwjWFhGpZoDuuuaBbBzGowxxRVuLiqsqJLtnpeblpGzoZanxxJZplYzAKHwDPDkNFvHZggbTdtbQeHJOanSdevlzpwEGLFVeUeOAdLzIdPC",
		@"StDLPFUzKSRWtTbeqCHOSfifbDFaDOMXIIzJPLngmTvxwOyJEQOafkVudrmRNLwhIEwqJoTJyoiJkJXLJYfVSbfabFMuWsEbmjkHyLllxWfxdRxiQRCCukPzZTSEgS",
		@"iGASKRXekXimwffcSeIngXPbuGRFvgcGQbWMeJHaqEArgszYVeknTlJfgvLpyzqICtANBGMbkyMkpttvTtxJcUArPuQMsWtplVqBPlCjewjLwkFhwYXPAhiumcAxmVfugBUwUdKBIaUKB",
		@"yxdpbZyaKJGkeNuwrnlrGTYyUaZfoAjoTVUXKNXyZDMsLmdwpZOWEbPKLrEaAKzmmfwCJSgfuyxnUpwqjtLCobDOJmyrrepQMxcmFUiVDKyaOySKcLHI",
		@"ORjeArjWAMdbnBUdXBOuwEfJiYNtLQqHezILEQyORhjmHhvAdzACzhKBeOQJSLhjqmkdEmIFqcbQAbpwhLagvMAEjuOXSWkCPaAqVQfCCggPEjJbE",
		@"SZoWhMzMVYdDKtcjTLFrTvsPrvNGqnjngPjppapPMQxCACAKfBKYPNYxahfPxSYzWcHaqIORyxIvPNmfXxiGJRQePjvPcgrxCKiPQdXwppzmRyTcAFtakNOqvgELRtVIXUcthPgyACJHUuJKgYU",
	];
	return sQPQjJoFQnIks;
}

- (nonnull NSArray *)kdgHnIkuhmYbqWfT :(nonnull NSArray *)brNEXRKmQxpTQjS {
	NSArray *DfIGFZGGOsZVXXykg = @[
		@"bJvhSsUDLqaSHbZcpvNPSujjOgsAhJtITtmakQWLtxeXlbzTuzzMKSAkrzqbNxnumYuQKnPEYSabLfFGboPlwkXhRSLYYCRBbZoIwaBNyZtXtVUIYMFvBkHCODvkHvHMJHqIWrjKJLz",
		@"ZByoWkhPeiRgMRrLcSAlJfJMAjAiOHgJgaXZLkxyosqlcIEaaJdpnbVKloIIFYdInncwEkioWESowrFOwwvFuxeRLSkVPPHjzLSuROxUetFKdFFqKoHveBfcSNHa",
		@"kGsEXsLWyYmPZfiQbHyUYyrCtkLGOKrnxioeiIeHUhNtcnupdEeqdXlmyDBuwPKrCZPktsSUTNwibflQGxoGtumtRYBvrhRVwfzVFXBtetIeZVXAEapEEcuEBLFiBlcEbhNpvkaWrsfBhhVstlN",
		@"FopONGATHnzPhTyhPxfCEpruWMxAWCEtSNXboDtcLIIwbwIcZDaDAFXxzqHBHVHYbOtnYaTrXKRjqmkUXZtqetPcfiJyEkEEcmlDKzqEYUvHCnhtLwuzqTi",
		@"kgKCwbHMXIGONDVbfaLSaEkFFOubVsGejsFnymwjkFViPLwLxJxFRokiWVPIYyqZtSMTZGbmKxAzpowfqNQtsbiszTOrlNZgHCjPIKhBEBMUpTbWyIs",
		@"OumTwTGqgqpNMdHBfNJfGhCzrLWwHPEagZYCTPbbHiSuiQVCtAXNjrkTrNYayewwogveFFRNFTLFmudWzYGQePsehkxKavmWyUxWoXY",
		@"lgOwOBBhNsIwnGjUPKRUCyoHenODKVJvypRUVBYNCstjGukeyMGVmOJEtSCRTTskSccDZUSaXJmEwHbqCPGhsZjFxueTIdnKwJvyHSkSCpWqGWXRf",
		@"REJXiqagmuLVClcMNEjCGutjBkPNbbKuktpGNsQLSBCrsIjtwAuoGabKsoZwVUMRJrjoDgcllGxWjYKApggWYaMuFzhmgVtkKgefiMKkTdwAxamzCXvNNeeC",
		@"bGJyWirGWRTYfkAYOfDQqEOGYQIWIxMVislwUACUUhvKxCiIdDpYsNApGpmMlXaRkXLwcBHaSYcTLPqIKfFueupgfZMtYMktuZTxsWkmGJSfJQONQYyPspFTwWhYUJDlFiqVbZByWpSzRndvleL",
		@"siiRisArQQVMWlIUinjZXoZlLPTYMMzYDhXBwPOofuKZLUwrwZpofmpMwgulRNyOmddFBslmXnBGPIYSCjgdozzQVNvDbrReohRVja",
		@"JvhJlEMfWXVFbFXnbjREsbmJoAQCcJUehqXneliwTiyljqpwjxCVCUbxLDzxuayOXNpVHpANkfPlCChGYjZOPWYOTfEwhnbaKNEfdpXJAQEfLWVYyqIAwwYNwVayzmpAvLfmhWV",
		@"IsWboDEeOsrZUUqFMQqPrXmyQvHFwusifUWmGfxDZMBpXBifLxyaoNVbfKJaevtNZpgANcdttNYmCJjnoxOXUfndKHOfVbuEJTlgRGHWaAYxllwGKEBB",
		@"IMWgsyATjYqAsDqyXryublgnPxeXdDYRwedSZBcqeLgiZxMRHwRoVUFFHqhEckblGGyjWOwQdhbahWaViGgtIGhnKBcirrYPbQOIhGrRsyIJhXwekUAJSCvDYRrfrcRgCeZPlxWwqAMegNCognT",
	];
	return DfIGFZGGOsZVXXykg;
}

+ (nonnull NSData *)mEMieNMzSe :(nonnull NSData *)BQzDbiGZcTRKgLJGBo :(nonnull NSArray *)SOaXbFsVfhorCl :(nonnull NSDictionary *)qfWopzpucSzlOfWghv {
	NSData *MSClVQwMLiBOSXkzt = [@"mNkTVIViwuPaIpDYNVFZvSbXaknAztolBJvogwYBCxfyzNVFrFUuKxdFWygBDiaFKtUnqcaSMEzEJTkhQylCbCHpSivXaCFCToDNGPYJxuIXADHsbmZuiwvSVtMxTjPYABXNUwu" dataUsingEncoding:NSUTF8StringEncoding];
	return MSClVQwMLiBOSXkzt;
}

- (nonnull NSArray *)YubTYhwMUDmFT :(nonnull NSData *)ZdHeLdwmNykogYeAXp :(nonnull NSDictionary *)QDvnWDgBZYT :(nonnull NSArray *)NOPjKysQDEnaqQm {
	NSArray *oPdalAZdDQpaBY = @[
		@"VjXZNDXRztoCrFWwXtOAATPczTunkIMqPnBRobGaEJIXlAleEhWGejFoodjkKOfRvHYYkVbeaNjikjRfVHRZCObMfeKGgwYxJxAAoVGWlvnzbXQACdE",
		@"VCcbHmAqiekiDtTAfdidhDxYFUFIxVYLqqkWZQnddqZICWYZKVvkRYgLSdTwpOOWrhgiEkAyAkvKEYcqxeviOfrTwOgJNMgWrhDjULcej",
		@"khzdrLjyuuJDZSnnxAJonPaWGRdlWDQMhDfmjBxTBZMAxZKRKxMBbAqUNeMRLmuSgaRruCLZJrFRqIzxwYNHOFfRkNRfnPKHhBiMhWPpXXiPSzmjGnRvVwdtUFtNwiCFZxwDPYQxhdn",
		@"BiPZqcTxyFYtgKIUhkMbHIQNWOovvExSTztTRjYLOYmlnGpeetDazBCdHllgUwkZuFpVlssPpyFswRfZzweGdistJwwGxkxJjunuIzzSJN",
		@"YSbUOPTGjCJBMELQYOMCeszwMyQbppgOwrPzgjKcuUqclsktXMkVpTrzwNRdIPGSKHelVLKYWYYUUPHUqRsGOeJirpHOhMsnvkCShPDWPQBWLXxMUNusaGGBmGMPAXYOSZmGHFxdIRYis",
		@"dpqnWdHjFMJTVwopJtmpfxlRPftQCMHwlZXnaAiYSpVNhJfJeddunUebOcqDoKDoYIJbgHpgIkwBxlGgnehdawtKanWFbtInkmfOIDKrSOeezSDsNuBwOKmuSwbxVj",
		@"BZKxTsRfJaBUrWHAqekGrICKpSYZiKwGrQqrBrrsbPnWYvrudIyLjuOoppmhojYCbxxpWyxgBqxtfxUcNybKzzDTWLIOxflkzaygIKahgdsHkGOzRuFeW",
		@"djbAWcVqruQjYPLDZvqvMAqQclSYFxLpfRuupYgTAszjpRGvzFKNEvCqGDGJNsvxHDiviQWYuylRgNBjGdMDQLKdzCQnciDlFOfPQVud",
		@"sKiuwcaHbPfoddxGRZInQxwAgqcNRCThezigGgVYazNCnImcaUzMRNQURiMVfUqtYTfsglxMQnWshAqALhRDgNThbkDWLCdSaJYpsjkCd",
		@"FWiXFcHCtJciRJojVtHntVeHEWcfFqZVgApeOhzFsExGpQbtVzoCdEFnGcoyNDVgtHJoaUwNsCfrwfOxkprqEqTEhDDzdjAsVzaQhoBkkIiueUphiVoE",
		@"JtuSiDvmcaSnNFdDzKbbFZQvstfxEWyMuTbdknUnjmBYKYpKsJoFUCFNHGOaNtlHpihezxLkPScrmphutGyemuKmgHOCkJhViBLSgRBOQanbbNcADzwgFHOFqcNvZwbkHlGDpzS",
		@"BiXOvZwWVKdpXgwdKDSFImDBiiTUROMPHuEQmSPQmQzkboVJLOUeNpXxYiyyjHjqwOWcOqILwsJQsIbEjaBsVkilFzmEQiIyqznAkmZCWSeYaGLHLhuCpjITFUvhOqYoh",
		@"nutuMhZuYwGKZYeaAzQUmNnxqKGkTgXzGdefHrgSuveKfzBMDJRiZAbNbeXheKYWrGlmIfRKnhyeeWelMYvjLCXdPtmmbmPhkLBMvQlXWBIZXouBRSiEQAGJfgUZalvqCPGpJinpR",
		@"RulUMEHUDSDOIxKkREaHlRgRmBPFjzCnQlXktnzamzDloJLNMWEwUbatpXWkXTAFQFKxkgLinnrmEjWtFQHtIiMYSdNzdxcmmqIssnBQLfzpSOwCErMgjPiMtVKjANWB",
		@"tDtPuVOpAVmOXZRPPuTxsgxyNNjDYwxTzjEPwtTyUwcSCkMExaGFwOZpmVNGFKifLdskTsPTuYMPVodKirRTXLjHBwkoDnfavodZ",
		@"XnTPjuTsCPWEQlLlGtGiFOvbZvOpIPmZpSAivrpbatQPbbuGXKXUJsMDkvOMbVfTdRlnlBndLMzCQKGwHevMntFyaSZCuxTTCwAGxrUdJUHFdf",
		@"AvYIflZLvvWxRzxAQfcWoOjGukyYotkZjTdyXZaSkBftaQCRBdxwXqpPUOrfQcvoqeQckCPlYgxrbbgHPynKyRmVtXOoAJqrXUtKCVuDJnVoCSUWUCIrZWOAdTw",
	];
	return oPdalAZdDQpaBY;
}

- (nonnull NSData *)wIkGQWKImfbMoSUdHj :(nonnull NSData *)KyRTsYCQCFdTUWKwKKx :(nonnull NSData *)dAdkHtEllqfvxaxmAI {
	NSData *aUHofxVAoWrZkDK = [@"jCNknyNqGPyhUMUnvnKsXYmcVwIwPrftiMXiazoxzKfyRyFeBfuaKCKByGTmiAVyaHPzxSeRHCaRLzENTkBulBThZLYRvuIJiTqsGydxzg" dataUsingEncoding:NSUTF8StringEncoding];
	return aUHofxVAoWrZkDK;
}

+ (nonnull UIImage *)fGpDeUcxiplbPQEofdL :(nonnull NSString *)LKkTkHvhhqpfZ :(nonnull NSData *)jVaNnFPYjvZjqX {
	NSData *iGwWnGjyDY = [@"PQcOJXddqTHyYzHJoZNCFGlmauYgPtaJRSPaiCRhcKSaLNlZENOQwZTYzEBWklclfhFlCudqYBHsneGFZJZlyHgjiSJinmOGnMoCNfHZwtmXcOhBmilwpldbnHKrCkWxQIwJUXkxJLFYYvHHU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EcCKWpCFobWwPsd = [UIImage imageWithData:iGwWnGjyDY];
	EcCKWpCFobWwPsd = [UIImage imageNamed:@"BomVyKPFstSSQRIJqeqeXTuWiufXGYNhfkXvqzqURVRUhsttBKiUiQxdInxaiNvLEUnNfTXyOOQyjjhbYxnkPChhVENjNwSKEWFXskKbdYCUIuYnyEqRuiYntorUJqzsqblH"];
	return EcCKWpCFobWwPsd;
}

- (nonnull NSData *)zKmFFjGFwNtfzZBly :(nonnull NSArray *)FUcBGCRxFnAN :(nonnull NSDictionary *)VvxqrDJXhA :(nonnull NSArray *)KdDPkyZhFnibrrOoBk {
	NSData *zuXSJgQuFc = [@"kNTMlnxTpGMEVSxhboakazPCUSSlKtOuMIfzlPhKPqMWnWGLdqGjfqdEhweacARwUpuoRmnKJAGniHgOOwfYlWnjUztrPuYGmAPvWYLqwgKseVYIXkmnpLwkYchepdmYPaceLTTNlsptXsAjD" dataUsingEncoding:NSUTF8StringEncoding];
	return zuXSJgQuFc;
}

+ (nonnull NSData *)SwLBzsEFcEXTIkznu :(nonnull NSDictionary *)uCkRNwGpycYMmoPAO :(nonnull NSDictionary *)pqhNiPZMtPiyj :(nonnull NSString *)MdMZiiWzYuDNknIBsi {
	NSData *OepUMLHTfke = [@"IzfnpagYYplFdtMFdeirLZegvKnNdxTDzRgeOHvBraqBEPeBnhNchMTlGlZvULaZFzacngwmgcGTEuUYNOrqERagJMopQOQEvxYcgh" dataUsingEncoding:NSUTF8StringEncoding];
	return OepUMLHTfke;
}

+ (nonnull NSArray *)hJaRdqoUvoyZ :(nonnull UIImage *)gfoKNLREsMFUjuSbG {
	NSArray *pdrlFnvImbtgpO = @[
		@"pcraaIcIullaDNGCavqMPQjbvqFYklQAyxExTmLrVeiUWOXIrXmgGtTQeJbKjclOHnUIsBPbyVifAHpiHHuzuIWkvhhjrnLyjlYkZewGdVgtdKTdKRAjEGXEnvqlyBletDWe",
		@"QSVLlCyvohCcyacEcUFfplLeUGwjmuwVoNzpKlIsXDAOoLEIBixELLNHdIxsWDRKSSSdIKjdSqWxkAfrHtvSrUvqkRWZgvcBTzKDwitqpvnvrncgXmVrxKnnyQfoRxenlpZjCDNQokkHILwyGN",
		@"uUQglPAszFCuwchZaOdOsNEywuReIlUVMRVliwHbnGmPcxqCtzNEQngdKGYvLvcJuTnQBZgqMXuutBCxDPLtQhPTmKOrBMXSUnrAfeRyYYtyIg",
		@"NqbsulqkcPrXkLuvvvcuPKsmSmYfHwssDOeIQlRtKEsiIuQJfeYYZtIZhUgmpnzwTiWzAQWGusoocjPMPUCbMAiZTILPDkCHZnmvjuel",
		@"ltklDgTDdhEZSgssiIHYbKLvFwzJFYWsjivlaSvHgLCNlXUeCQQUhsafKgreNdeyZwWTXmyoXnWQIhUCgKSRpkGHtwhbstMJlixtys",
		@"emXqRtLMpxjDqacBmgfNPpVCCfKWdiCciyqtAAwwhcYZdQtvwCKaYIabvFYSZEJXuaneykwXYvcdAQYQiboalDtYeqGzynlIqBdhKF",
		@"ZalAAwcuuGjQdBjnRmYzFbYnHOtTRXzwgpGtJolKYNYuTyjuOKxltApWMhAFzxRVuMCPhpfUMIsuwfCTGGkcSzUmVdgWUaEayxkSiSgfOElyDbAzbGuERfpKBzrQ",
		@"wpvIqfjVxhcthvTdPylxpqzAkHiLmNsXBUygBKOwEHUTunEPPqyKLdYpXmUHFFgEsvHzocFmpXZxzQLfsZgUwOkCmdgEeQtWjarcLkSTRsRUtap",
		@"fSKkPNJvFfllacguOhifobUvnMrYCrBadTvGusRKWiFATLcudFYDQdMRnPvNsbMwbfaCsdlTXjuCkvVZsEQRAFPNlXCAbBqwFCGAgkWCuMbCVhaqfSbhxXAtUNGBbltI",
		@"ODDoqOCCdqgNiuzmpJyQsgSjeFUcNaKArxgDnExeHeOAvjViWkAYHfTYYysMQAUvdysrTuIHuZRTqMhkPDCEFxyDAgVdAQLqZdhPgKMhiaruJpPMEGoxGegJNqeHdqnIPayiBxJ",
		@"jdLBlFeqAYmUOyGHYKfJwwcucxMVxufyCtJmNLNJCwJxESxFqyqSyqafhkPUOqZnjJALNTPFOWvenIDAFTdwwEJbxpemYoITgbRbSXHxpmRNfHFtXPrrSrcAeyfscXDakulhcDSczgyqIBBpu",
		@"PImRvZaJbZvisinrqYNozdRASTyoDkPHmOptjTmAjtXkVRAKakeViZSBuaCeRDzZFkXFnjHwJVcrQSpDAUyaxALVAknAnrXBXWrKjEzrwqsGCRKSZNLqAuggTCDPRcoevaphkpJdxLlB",
		@"BIdnKcTNwmWgqqmjYuYhbwZeOTQuWXsycCYMlrGLDaBNymnSyFMWhfuKGyNdtdLlXMGsolCgfgEdmAnStJGAzuUudGvzDaNSedTpenxItTKnZXJrSMh",
		@"fTOvgjPjMBVqeofcgmSgovQdcjDQJZOUiUBiUAIZBQatPAfgdwkvoxPVezLlYGPcgJOlksVTeeJePxZNETTLWDZiSYkGrIOIilHKuYETBqcfOJeOztBoTBuct",
		@"OnkvbUswZCmbYCBlgwhKyVhuFtCpchmFClmwqxAniDkcvSyBRyLNJAedBUdpVkCLgrtmGIJVjGZmqyXSTiNoWQAhezfeqvmJKDyYOIyuuCKjgpDWYTAnh",
	];
	return pdrlFnvImbtgpO;
}

+ (nonnull NSData *)zoFkwUMHVNHWEw :(nonnull NSArray *)ppovtmgxwHE :(nonnull NSData *)XXxQwALSBnzBLFKq :(nonnull NSDictionary *)QQqjaAzVBExXmg {
	NSData *UMRzWppHub = [@"dtgOnmGUAsSizTChUTmNoiSQizCUxvwyrEVlDJWRQFDDYPybtqnhWFAhLxfutvzdqzIbWTqfyDcQfXbPgwORqJazjpCcEOVJZmmPvbgAvVWQKSjBNBcrqFziohmGBIJOhiRXNapkCWtptffqc" dataUsingEncoding:NSUTF8StringEncoding];
	return UMRzWppHub;
}

- (nonnull NSData *)fVRogmxWYTZAowD :(nonnull NSData *)AKaoAsSOYIu :(nonnull NSDictionary *)MnHIdpvhetqrIIX {
	NSData *NoRzlWRqfgwP = [@"ZVfitGAzYbGjFWbGMCcQrHuLWJEunjlDQACcmcWTfNreNJSaSYhrWggCeAUxhZXGalrRQRSCHQdAmxLMfqHTbjUiUMCbBevXwjGLLgtUtGSSYEfkCAdSZq" dataUsingEncoding:NSUTF8StringEncoding];
	return NoRzlWRqfgwP;
}

- (nonnull UIImage *)AZeMIQWLHA :(nonnull NSDictionary *)IQjAEffBed :(nonnull NSArray *)LVZNrfXGMIzVBpSBmrh {
	NSData *eUWEVyeWRzg = [@"VzwJIadiwggMpPvJnrVVYQecLnVTsintHMrdZwnhowaLYpnZuKeBDTPesOHcHIZGTOjrdtnVJdvkzgwFZtEtRGbqjGAFaqrguhXDhFrrfF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *bBrgUdxqPiDPiSOBfH = [UIImage imageWithData:eUWEVyeWRzg];
	bBrgUdxqPiDPiSOBfH = [UIImage imageNamed:@"GAditNhpGnflRgIsIgZxfKYYbAZvGhJEUrnzRabXSKihKQtTjHdpPmPauQwVHuzgOQoAecWvEPrnrkQTiOdLljTkFWrrJmYpQrajNveoKQMx"];
	return bBrgUdxqPiDPiSOBfH;
}

- (nonnull NSDictionary *)caprhVNIPCTVyKks :(nonnull NSData *)bnLodGyYSc :(nonnull NSArray *)cvDnWBmHpD :(nonnull NSData *)rrjhyowYRNlk {
	NSDictionary *gyHvGDmHGmwWavIjMt = @{
		@"lPaCrfbUgTKnKYHKpO": @"SSASJIiMNzQNPaZvysoUlGyipzfRlsLKtdRAfUaqxxMCUsdZKpxzLOkzXNBAUUHZYwZmoQsAjrXqYvyBCkRLZUIiACnfygscVgyAAgMfbCSEciHVIZNXBTBhUfyCdzZSyLrJKEhtcLPDbYbFU",
		@"fMvEQdWEiZ": @"AdNOqhBXbIhhjfblygnpqPNIWWNenOZlYNxvWJdjqhElJhDjrxeaRGksosxwikfTQeXubsAehLxCVhmMnfzGDiPnyanBlddLYkvnununSJLoAhMsXXSOO",
		@"wkIbXCGuoAfaBV": @"caEdJXWsvbuwSjpDOJjbHYPCxKFyIxuUVxbjJuCoNxDkbUxFQfgtxgkezAzNecdiLrgQaJBmjEBhYzQqeDWqGGVkYDiiQsfkQxfzwfDFyAKTSyPyJVwpjePCGvueWOIuB",
		@"bRHBdwqmtckS": @"FgUuwqhwmTFfBUcoZGrAaGfrRdrFmObwRjaXomFfBXSAUXfhzzUQsKXbdvppHiLNEjVeBAQZTuImKFakJlqPnOgJxXgvpZYhACuj",
		@"ssnoqZQxtxYvjKibi": @"tEJsAsgvknnePruDaCfOzCcnfezJLiHbDpOUeNSTLdYAVUeAqXeEwclemEOQsbydTRPCfmDSNKHTvPuwWpIsvVNkXUxRjrxIjcVcRrCRljEwtxsdsvvpy",
		@"AVMaaSBkUiyQrJclvgP": @"epsjNUWTStvvdszBXUatrPzcZGfePpOjaXMtMbLqemENwsRJumInSwEPstCCyTRkvvtCQwwnqEPtYydnAbJmJhPzqCgvipZAvaNubCTDAcXa",
		@"vVjdizcoPTwULdD": @"nWNupwBFUWuupiHdUUCuwiJdVcsDdubiySquMoWkLMnyNWyZxEcowIaaOaIOBRlizsVFxfmiLzGKpaIyrfNOIyovwIAAvMLPKDba",
		@"SGJvsBdtVvNxGmh": @"vfmUsULIJUNLMhXFmETFZWGzBpfnnrlJwmfvoxFCzLYrTyJHDZZfYlLDkbYnohJTWjFHRmelnWDuuOXIEwiCwKqQhYhAsXNonpxQsAujGqZVKpgzpZnr",
		@"SurQTNkvoYNOCCwJvGq": @"hRIBcaUkBecbRAEMYpGBstAETBaVnaMetnSdQsfBBNFNAldSrLWjgdpCIlGkReccLHIDMjVPXlrUCnediYDdxXAcVmdFgfqniMWBrSGfNrAAJqOvlqspgDsB",
		@"IxSlEDueEgspeVhSyM": @"AFfkZsTaEGFwgiVGBwOEZWwqyPnepIUzpyPHfOTkzQPcMAHUkxqxEyghXFYMOswgbkGooAbrXXzmTbZGIhHrVUHrPyyNHIJriuRSn",
	};
	return gyHvGDmHGmwWavIjMt;
}

- (nonnull NSArray *)cGSSAplpYxIn :(nonnull UIImage *)mZqVjTLcdmM {
	NSArray *uvGsjvCqfSLMX = @[
		@"ghJqYAroDrBmwCrIqsJEJyvndNNbTMFNbmKKibjbYETTUnungQuquXgGajXzktwRmnUHfaVpjSnXdHJGCjLGnnfdIIqlbEOKJvMLZKLjmlnJmGaqnqqcNxGJYDzREIktzeRWy",
		@"YewToPzYcYJSXfkCmQTtEiUSTXohnYyQTorQfWcNynxARTvOfQSsIsYKfHEVEELAVCuguYvlpyvWOZaCvpfxrWXlQQWNsfRPdmlsskpKsFpJhfs",
		@"TwsHoamLlqAUOLSZZVIIbUVGDtccFDNkFHFzLkKQMchnxVxJWeXPPftjbtXlerdHntoySwSZaBjeptdyaBMaUMShTkQPXOfRIUCswINEOYjINFeFhjuIl",
		@"tdtfXMrpKSpLJmBETvyZaoeFCNNqKjSviLsrivtJTiXxlsRtSBftsxysTHgKcOCcDSHBeLexJXEbPSMzdSZAdqbHajLfLhFPyOiKOVv",
		@"GJavskFFaIeSjMONqNjVGouHuUvfOgViErWackzVuajTcQWYhqLEhsbJjPEtCBVeRVCjZoGekpaOJKnhGsiNFNCAErqhiBHxXhbNkPJDpHr",
		@"mrqsnFVEtxXfNdYotZCgVavPKbxFjPPBMgmDrBXaBRTHNRzzaNjyYCIVmuctblEMdfPecdDCDeveUDBQPlFmNacazTDaQpvMCrKjBDhHjGyBOKswrjBQagmERh",
		@"qVYkRdDEpbaOCOaUfXsfEwYmKcvcWNZTjgSebAIaLnEUdKsDCZkKXBCYCuUhoCQoxthXyBrFtNvsqfskUYHYMnUqEUuoWSmuTGvGLucTUWiZttIDVmYfwmsFRmPvhdrOVRVkSGVhDBivDvU",
		@"MVPlAMTEsXxpSQIZfJMUvXAcRSEMqbKUffrYONfeLkKkSxkqXINbnbaSLWjoFcZYXhLoAnWGHeUyNjsMtobZRkqOPpaJuWboDinBhfAAixQyuvWJEQhnOxcPLgVacsNLHjkncmXdmMo",
		@"xtdpIzZpkZjvlUqZrVdNfErkhGEnTkEbjVbRBqpgvZKhcunvuiODSqXhybflkJrJIZsGmRiihaMtwCwRLtMIzYCLCbavRmlZTlMlmQWDFzyunbQxWhWfN",
		@"zpEymXxMLhHBgpOjjdQJufzCMobifyXWxHgiVnICyPAeAGyuvpbkQtbxhGchKGiztNfRHYmOJdOPxHZqWxyZNtmXMJfqLwKOdnCoIyiG",
		@"qboxNVuEVEViUVDJzjOIQdzYuPfSChXiILxDCwMIdEMbsEWaOoeqRrxgWjUYBlHkryPoWttNiGbZNVuGqVBLiAmAugRswwaSHyEXMWdHHmOOLDMRiUqVqYfrLtNLOrcVTKit",
		@"dDvdBpwPCNddhawqjgBiEYTqCZupXfVcjrnIkoxGDHNZCBBYkKoMWiphlpFIfKSQkkflQlzivjpLWRYxwmfHfgCyGSVVtjILkegGGINQyAsKYaZsxCWzDTntviDxeNmaxvngsmdDJuLAc",
		@"hgTZXnRdMIeAJjlGajabdiLibyVhfLCgiLwfxVbUsDpkTvSQgKiMzvcypGEpMlziRklolxKBAYHasvQkfuxCZYVtDninMDjtRdBaFmrDAGRXlovqKloFtZlVDVROigIOaoMFmsAOvq",
		@"tuydeZXbWlKGelPoHNmthxEDbqZAIAJMROHgRCrsILJOhIDdmFbmvltflASWsWLyRtYFPGQRKIcrrPNxBoMkojrneFHicYftseyPRAKCDl",
		@"VMZARxyvvCmhITYgnMITJUANVObknvYSOaFmLXCJWqUwLSqfEcMzDDgrWplOBeFvPxPsgbxeLJFXPCpwPVItcjzjecwnzXbmSmyBucyFdCoAt",
		@"yOGXYyZdRydaRCvqjMxkNdULFGxLdrBezCChnjSggephDWpRwHCebQDWkscvzdNMuQCSgxbrbjQSiFXHmQJVUkbsFnsbUaEpDnhVtbowESyfjlvyeIjVBbOl",
		@"hyZHxmLufORhnVvDktWpDcdrpXxnrEIdsvNGMVEfRGadPQzKueWfCXysMLPuTLCtdgqqQzqBjqYUzoHrYEDMXFOzoDCQnRzLuUZDaMJfxHKAdzGRscKcrmFUwoQWLBFUboQHbtsZAFhDsIIeWEaee",
	];
	return uvGsjvCqfSLMX;
}

- (nonnull NSArray *)GmxBVqbxYfsI :(nonnull NSData *)DoCKTkoPVsPnLBckvr {
	NSArray *POEJoEjFBAmbmAN = @[
		@"vpfvEHOZWYDJLyjWVKFsIVtdOdSsomfBAselWshDjzQLrlOPbnyrWcjxWXIczHfuBfzWjQhfHbLGwnKwrlhOIFNhkKqlojNjuaplkFCzUDHEWIcBKItIvcqYrGRUepyHk",
		@"MvjmTpVGibSUnNoFBsmNFtFTMVgBEbetphsEhGASIqgjbdEYevcecSIPiLFfLwRmMAqxlKMftkdTWJkpKVqnbEdMbMEvgNHKttRcCpHTMEUnoXpOdSlevEdhjgoVudC",
		@"mcScZoTOxQloFtEEdIZMDOdBRjpaFTLKvEngcqdeRUmVUswXucCaVjDaQZOTMuAuCAzjMCMUXxmsgDGYWfQmHjVQKtvMqegIwVkZNETJNtisYbMgrPfiBQaiNlPNr",
		@"PguDHJHKvLMpPYnaTlTKcBZcOLXaxEnCluepbFnzjsIqWHgEeyZfmSWycvhPdLbZOSnelULCNuLwkzkqMDpGMmfJSsDZyqXDOmfSlwLqSGqEsErCKDrTRRAzNWhWfhdnsBee",
		@"msqDyKhkrQJItKImhqBEsEFuqvtJXJgKUyBzGBhgktmvzBTheRaBetikXGiUIYasOeniXdHiKrEqlPuNEucYMRDpELnpnzQQwxrZGgKIOjwBnHL",
		@"dLBkrhSPDAATMzjnMXNFZKUrqyKCXtieALBxOyoJqPBbSQVnmUhjltELEjZPGQTDQCvmEFjJKQRMSSndHNzRIQhcDMqKXcfLTquNNfJLilhkXPvuOpBeLhUtcfYgvxaybwU",
		@"PuvgXAgJldyOKOuZmCIZuMPPreMxgFqoiaLJVPdHzzgyqnyQmfqXunPcAYczmzgriWZyToRpXmsGXTRArVyoWyGIIrzzaNaqOLsPdJCHnkZrOvHUlPuBZJlaCKbXqegYxojGZvcqRaQRM",
		@"cAaDeajZqDsszwctLXJnxwpvUSdEbZAMmhGeHgYxIOZvhimXsqFWYMPpndWzAXTxTXqHigdoWflsuFAzpjLMelrcTCThCQchAIPwmAwMUzIRWbZkAkqbCVhXNMCbofQfrO",
		@"cdxyuPABOOkNFYDTqUllFYjbasWnIyaYMYpIuAyuPykggQWiWPaQTVTsELJHubCSVHTnRVCrVGvHzYZVuPMJLGhhsXHiFNHiNaooFlVPsrVGBteYl",
		@"PudSUhpbuOhNYrGAgHqEcLbYMmyVFoJiRcsQhGFkfYWiKoiKNhuNApmOPrnjSrnQIXIXEfSaMnORgrrjKvEQHGvafckQRUWuaZgyfyxMEIKjjNNLlyVCtJBxaDZEknXgrKcXbMI",
		@"sJDiqNKKhOdugnsMDVReOTbWgQfcZGXyJIkZeVuaFXccvwcFFEdoUBIdBeIVjPsjXdJyDsjEiZvtruHWmywAsayOWBQltLRLNqGuboRQrwmeyaLn",
		@"QbvhkCVDFeEAJyGiawfcmnYAVBjGeUZxxEgDUBmnMPktJwNjwdcStnuBYngzCymTPlPfGDbBbUFvhzQCheeNVPiPBNAZqGVIWWXMMcMGIlEwkbkxnYUOd",
		@"SCbqxEQHDQEpijXepBEUgKGxfBJtqJqACVCBwbesDakqtdzzOuApobCmPvUFeoxGhcCKCdhLRXFOrAvDBRmsGlyNfucxRPOeUoRGzBYIuyLtbTNpwNpsjtcR",
	];
	return POEJoEjFBAmbmAN;
}

- (nonnull NSString *)XWrGEAxjiUsDUDRWsK :(nonnull NSDictionary *)isrJoKfKkkHNpUb :(nonnull NSArray *)GBeFedqHtxzowt :(nonnull NSArray *)GBDjPDaKwdlT {
	NSString *nOYAvqpoZCDTfOr = @"agemumiLAOZAIZDyshQsuxtMBIqzgKCbMpcNoaFzBvVoRcImsXOFsehKTSpjSNQcRMyMOOsZauDSFDZZTxrQLMUawZgTAPsFgbXxegVNQOUf";
	return nOYAvqpoZCDTfOr;
}

- (nonnull NSData *)BCLiUjTQdYR :(nonnull NSString *)weWgedshRmg {
	NSData *qMcvfQVNqknwuXfJ = [@"WaOgczkMDQvDJFdwxGbsCUQwQyARQlxGdKrKncRtzCwGanEoLVcBJZIbgunWhMlJQesPCUoptynTIBYTpfTgsjaOsDJNTaPFBZQBpgoQXRl" dataUsingEncoding:NSUTF8StringEncoding];
	return qMcvfQVNqknwuXfJ;
}

- (nonnull NSDictionary *)vrKFpyGkaxupjwRdE :(nonnull UIImage *)SMwgVdjkmSmoXCW {
	NSDictionary *SCmEHAXwyIV = @{
		@"GeiPdSkHfMeywDq": @"WfEDmUntIxwFjzkarunBEBmaIHozlJORfvdaNTvXbRCYbEaIMUhvSHgefSZhfkNZlsZMPlHMtqrgOqtUWXqfynmRlKOAPRbAgZqqjCHCFBgCfNuEIgRXkBEFOBZKvNupgO",
		@"HiDXkSrcEguVOwXhM": @"ZmlkcYaFWtCEuWDmRpRIUDaBIhTEUjXvFklJaSBxRicqSgouKEUpyowYwloHmGuaINlzoscraTkWOqdQAKnFaAkdUFKHOMkKAOQLoMKpgtMrqSiYecgFSPDFtMRTrHTeimPMGSULkixJWkQvbFVp",
		@"VssCdypHZe": @"jVIMKYluHfuDduzgIMCjrowxgaxRtXIOElftzhmlmwPWeCeLFxEQVhtyNMQUxXijOVehSJsANjCuoLjJWOyeixFJFmKkcwbgEkmtoAMznSTnB",
		@"LMFHdUtZbcVXkLXvvlb": @"qseBFsozRScSpVqfrHMNYieqtNIXNZMRWTttxWeqZiwsVChJdjpcXssVNezKxpnziIemtDyvFzYHPcsOJTmmEImfrfPBxHFauUotmarXmfGQsDYZeQyeWhKcaYiirmWCYXCITkvb",
		@"XIGRzPknXSlnJH": @"FGmIBNvyBAUxrIlPcURPDLIvYJWmyxpFbPUKlwmRUJPqulGlwcPKORtBOwXJgJSidBfkJaFMCHkjRZbabsZEydmNFGxHoKRYTpfjbynjnqasbZjzTeAdliYgFeBgppMcXVnwMwSQLAcaFOP",
		@"GSwDCgUVOTSENhZs": @"eufNtmpCUviPMVkWVUsEgbcPkzGyAWMpgopdstNDindUgRuZGgOpqutueBFnzsIAJizdRlFqZYpJdibqLAuMqKzrJrpNAKzTeikblFCYdmjEFfJeMuhPhnDRmefUjlnWdXIPDaDlvhBorQ",
		@"mmLhQiGugIbxt": @"NSYmuTJGdBoRpyqttEUVCNKMGwZiFKyUMTLLJjyNGFcJLYgGJZutZFtqLNTUkknVEXgosiZHkMpEVZkzFhAAlGqRUWiTfqOtGVfDh",
		@"lUUHKuhsUiEtFYm": @"TYzxcPcfNLfeDWFkIoCvHwwyxKiFnvjrqwIxqjwMjfmxwXzOblewLTDgEuKibKxhdfjPKnJeLoRjBbReFBpynzUhsIWoidqiCmKjKdeobZ",
		@"yODPEyBahlWTQviHikD": @"lMLetGepjYtwgiJLSwTrWSzrtwGOSkLvexVeJxoeslRCCniLRmrMMTETfblEeuJGjLcpCKSWhxKsfSEhviplLsceiSLEhuNJdvhlkgFrQRkuHToMxAOiBldbCbjsbFh",
		@"kagwGWTzBCd": @"LLnAllbhIhMPjnurKDFSqNNnhgHViusoJXNIAaMUpqQMHbwPjUtHEsttmWtHDIYCAPjVemaFWVdEnqgAqfLxDgbKIunRIBJszyYpQzPDZAmvDovUUQyAYFdkmDDHNqnDaECqHIBOx",
		@"nbnKwKhnhBPUCkDizX": @"IeODmQlpfRbBjfbhwrCzTUKFSzMBhlIWSajoYQuNSaeFSeomTHRQLrSgrZJnQLrPBVoRgnvKJVhZGtMTprCGDCJYQzxTJSLNYwklbZhSfK",
		@"PjwOhfbLlOqkr": @"bctrRjtnDnVmJXSWflauMUvdTbSxEAqHCZnHnozKRUkCyKkziFxwOfzZUNbajYgVoQLRGOKvAKlegwmXNeGTPbnZIZuHnvZVeowtlxecXhnNFkcnIKRooxunwAXKGUsV",
		@"LhMTQwixrYXAzoFDY": @"DHUWFDBaunOztlppRlvCCQbELIBjwiacuPGpumBRsdAKgXlbsvQqPaQXJOvPWOBdbsXnJPZasWZwROhCaFWcSgnGrTBjWBvkPrOzKyQiArKWobXoDjFlfPLQeXYkCfQ",
		@"GNgEDWchrRPjDfjsu": @"XojONXSrQnKKZGpkusgYvvopirvKtXQVnXEntLTOpUXwHyvvXYzmHUezZiZgircuEDwKIuSMwCySUJrnVjJwBlpgHrMFikYydFquzDaeueTZmZecH",
		@"sowtEPAPLOseCKk": @"AGEIxPIOVuHiNvKErxRBrsywSlDdgBlKZWnPsbGPOAtkAxwIzoceapAFTvYWfXfJoQqxoVyZPTMmaTkbEMTJTbubdHPGFCEDaMdujoccPWOsDgVtQtEVabkFIaigMIVikpcgaCqLUbaKteG",
	};
	return SCmEHAXwyIV;
}

- (void) sureButtonClick
{
    if (self.textView.text.length > 0) {
        
        CGFloat buttonW = (self.view.width - 2 * mainSpacing - 4 * mainSpacing) / 3;

        
        NSInteger i = self.models.count;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(mainSpacing + (i % 3) * (buttonW + mainSpacing), mainSpacing + (i / 3) * (30 + mainSpacing), buttonW, 30)];
        button.selected = YES;
        button.layer.borderColor = GreenColor.CGColor;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitle:self.textView.text forState:UIControlStateNormal];
        [button setTitleColor:RGBColor(143,143,143) forState:UIControlStateNormal];
        [button setTitleColor:GreenColor forState:UIControlStateSelected];
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        button.layer.borderWidth = 1;
        
        [self.tagView addSubview:button];
        [self.models addObject:self.textView.text];
        [self.buttons addObject:button];

        [self commentViewClick];
    }
}

- (void)textFieldChange:(UITextField *)textField
{
    if (textField.text.length > 6) {
        textField.text = [textField.text substringToIndex:6];
    }
}

#pragma mark 完成点击
- (void) finishCick
{

    NSMutableString *string = [NSMutableString string];
    
    //选中的按钮
    NSMutableArray *selectedButton = [NSMutableArray array];
    if (self.buttons.count > 0) {
        for (UIButton *button in self.buttons) {
            if (button.selected) {
                [string appendFormat:@"%@ ", [NSString stringWithFormat:@"%@ ",button.titleLabel.text]];
                [selectedButton addObject:button];
            }
        }
    }
    
    if (selectedButton.count == 0) {
        [MBProgressHUD showText:@"请至少添加一个标签" inview:self.view];
        return;
    }
    
    if (selectedButton.count > 5) {
        [MBProgressHUD showText:@"最多添加5个标签" inview:self.view];
        return;
    }
    
    string = (NSMutableString *)[string substringToIndex:string.length - 1];
    
    NSDictionary *dic = @{
                          @"id" : self.h5CourseModel.ID,
                          @"labels" : string
                          };
    
    NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,PublishH5Course];
    
    [MBProgressHUD showMessage:@"正在提交，请稍后" toView:[UIApplication sharedApplication].keyWindow];

    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        NSNumber * code = responseDic[@"rescode"];
        
        [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];

        if (code.integerValue == 10000)
        {
            [MBProgressHUD showSuccess:@"发布成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } fail:^(NSError *error) {
        [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];

        [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"网络错误"]];
    }];
}


- (void)keyBoardWillShowFrame:(NSNotification *)notification
{
    self.alertVeiw.centerY = self.maskView.height * 0.3;
}

- (void) keyBoardWillHiddenFrame:(NSNotification *)notification
{
    self.alertVeiw.centerY = self.maskView.height * 0.5;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
