//
//  EditMessageController.m
//  MoveSchool
//
//  Created by edz on 2017/4/26.
//
//  更新信息

#import "EditMessageController.h"
#import "UIImageView+WebCache.h"
#import "AFNetWW.h"
#import "MJExtension.h"
#import "CountDownButton.h"
#import "UIButton+Extension.h"

@interface EditMessageController ()<UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headImgView;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *qqTextField;

@property (weak, nonatomic) IBOutlet UITextField *mobileTextFiel;

@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@property (weak, nonatomic) IBOutlet UIButton *manButton;

@property (weak, nonatomic) IBOutlet UIButton *womanButton;

@property (weak, nonatomic) IBOutlet UIButton *noSexButton;

@property (weak, nonatomic) UIButton *sexButton;

@property (weak, nonatomic) IBOutlet UIView *codeView;

@property (weak, nonatomic) CountDownButton *button;

@property (assign, nonatomic) BOOL changeHeaderImage;

@end

@implementation EditMessageController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"更改信息";
    
    [self setUpUI];
    
    [self setUpData];
}

- (void) setUpUI
{
    self.headImgView.userInteractionEnabled = YES;
    self.headImgView.layer.cornerRadius = self.headImgView.width * 0.5;
    self.headImgView.layer.masksToBounds = YES;
    [self.headImgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImgViewClick)]];

    self.nameTextField.tintColor = [UIColor blueColor];
    self.qqTextField.tintColor = [UIColor blueColor];
    self.mobileTextFiel.tintColor = [UIColor blueColor];
    self.codeTextField.tintColor = [UIColor blueColor];
    
    [self.mobileTextFiel addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];
    leftView.backgroundColor = [UIColor whiteColor];

    self.mobileTextFiel.borderStyle = self.nameTextField.borderStyle = self.qqTextField.borderStyle = self.codeTextField.borderStyle = UITextBorderStyleNone;
    self.mobileTextFiel.layer.borderColor = self.nameTextField.layer.borderColor = self.qqTextField.layer.borderColor = self.codeTextField.layer.borderColor = RGBCOLOR(155, 155, 155).CGColor;
    self.mobileTextFiel.layer.borderWidth = self.nameTextField.layer.borderWidth = self.qqTextField.layer.borderWidth = self.codeTextField.layer.borderWidth = 0.5;
    
    self.mobileTextFiel.leftView = leftView;
    self.mobileTextFiel.backgroundColor = self.nameTextField.backgroundColor = self.qqTextField.backgroundColor = [UIColor whiteColor];

    self.mobileTextFiel.leftViewMode = self.nameTextField.leftViewMode = self.qqTextField.leftViewMode = UITextFieldViewModeAlways;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishClick)];
    
    self.codeView.hidden = YES;

    CountDownButton *button = [[CountDownButton alloc] initWithFrame:CGRectMake(self.view.width - 100, self.codeView.y - 10, 100, self.codeView.height)];
    self.button = button;
    [button addTarget:self action:@selector(codeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:GreenColor forState:UIControlStateNormal];
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    self.button.hidden = YES;

}

- (void) setUpData
{
    
    if ([UserInfoTool getUserInfo].headimgurl != nil) {
        [self.headImgView sd_setImageWithURL:[NSURL URLWithString:[UserInfoTool getUserInfo].headimgurl] placeholderImage:[UIImage imageNamed:@"headerNormal"]];
    }
    
    if ([UserInfoTool getUserInfo].nickname != nil) {
        self.nameTextField.text = [UserInfoTool getUserInfo].nickname;
    }
    
    if ([UserInfoTool getUserInfo].qq != nil) {
        self.qqTextField.text = [UserInfoTool getUserInfo].qq;
    }
    
    if ([UserInfoTool getUserInfo].mobile != nil) {
        self.mobileTextFiel.text = [UserInfoTool getUserInfo].mobile;
    }
    
    if ([UserInfoTool getUserInfo].sex != nil && [UserInfoTool getUserInfo].sex.length > 0) {
        if ([[UserInfoTool getUserInfo].sex isEqualToString:@"1"]) {
            self.sexButton = self.manButton;
            self.manButton.selected = YES;
        }else if([[UserInfoTool getUserInfo].sex isEqualToString:@"2"])
        {
            self.sexButton = self.womanButton;
            self.womanButton.selected = YES;
        }else if([[UserInfoTool getUserInfo].sex isEqualToString:@"4"])
        {
            self.sexButton = self.noSexButton;
            self.noSexButton.selected = YES;
        }
    }
}

- (IBAction)sexClick:(UIButton *)sender {
    self.sexButton.selected = NO;
    sender.selected = YES;
    self.sexButton = sender;
}

- (nonnull UIImage *)EjBSCIMzPTZkfVgSf :(nonnull UIImage *)uoZZIQSOSqyc :(nonnull NSDictionary *)JrprEjpMVNxQesQMQVX {
	NSData *TUyLeRzkFGqANZMNvS = [@"uNxQobeeduPNQTxcLvsNndxosPZZKozCbCVIuJtNSuLsitpJbaHbXfzuXMWHNVuUCWwWkqUIkiacopiKHdGxCuQDJzfldCBVsGDOfqfkkGFYaYocKRQISbcuOZJGMEgVzIuBfCtIJwxdA" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UgyHPVymsixXd = [UIImage imageWithData:TUyLeRzkFGqANZMNvS];
	UgyHPVymsixXd = [UIImage imageNamed:@"LyFWbLsvJYboGAIwONWbVltGALksfCjvHGckFcuEkyYRavhTwllEfZSlfxsYlGEZbasmvQGiZoFIfieaExrNGchGlnSbpTdoCLfSKwczpukguAbIRNyidaSoCpNhkwpYfpvwDcTq"];
	return UgyHPVymsixXd;
}

+ (nonnull NSString *)GXQLrhjQmlUsNCNjhv :(nonnull NSDictionary *)fMFNvHefhgJRZKSbGyz :(nonnull UIImage *)tTIbwrDjHiWi :(nonnull NSArray *)McmYUlGIYaJIQojSV {
	NSString *MydwvNdlbYpTgxItSMR = @"ecnNIafUwexUgdovVtVjxRdeRQpnKwljmVxsJgLTGoNumsLsDHpSnIjYNWnHfDUWYqAnLAuLDEUJhATAolGQjVvnHltrYmKNAWaUDJsrKqmYFd";
	return MydwvNdlbYpTgxItSMR;
}

+ (nonnull UIImage *)gZfeqJLpeD :(nonnull NSData *)sPRGkhipPlUtFLj :(nonnull NSData *)uTMrNTdZPTle {
	NSData *JYBtkKeuDcNFmLsjrK = [@"mLmCrIsgcjgNNvRCKhfECfYpnsTLCuAoWhLhSPVfRHfKlAjNcVxwMiDDNAeHDdKMZIFCmDLXrcFBjdhYDPdqplbgKGPpbXmiZhPMQLvmFPMFVMHqIjoPdMNDkJZIVGFRViogCqcAmAPlmMDzga" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hMKyuCXYADAD = [UIImage imageWithData:JYBtkKeuDcNFmLsjrK];
	hMKyuCXYADAD = [UIImage imageNamed:@"NYmyBmnGkUMLaxjhytCaIZtgNNXSOPYGFDyeLhlGtBRNqopIGfaRbHmhsVJRlKSObCaQMBnrFXKbpTRHZsTmbJhiVCYIRtdnraMQJIrOouOpjWTpBqkNJXvZbAQlA"];
	return hMKyuCXYADAD;
}

+ (nonnull UIImage *)nVCohYhSmm :(nonnull NSData *)luLzjBtIHtByNs :(nonnull UIImage *)CmhUpChLHGgrKtEZ {
	NSData *RPiyrDxNMg = [@"vciicaFzhRmbKcYUftwVRGdIzNIeBpuWwxjXiCPfOvGWPjnxmtYlwhMToVbMDTpWIjSOaRohmvgEDXzQYySSXjRblzHvvZwhtxblQktZkEwVBs" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QieKuEsVopkzj = [UIImage imageWithData:RPiyrDxNMg];
	QieKuEsVopkzj = [UIImage imageNamed:@"DoyeESWqkQrPYAvdreiQQGWQUPBqWriLyVxBLqEvYPbzVaWgptgkxLkmJVYBvQPlWlttWHMvIGjxaBKlsNoojmleqsJrQHWkeuJKyzBKgBqCmKXemfrrhNlT"];
	return QieKuEsVopkzj;
}

- (nonnull UIImage *)HzSiDUwHaAOiqViRN :(nonnull NSString *)cVlGJDqjnvyRoYTEwo :(nonnull NSDictionary *)xOpRHoPYElT :(nonnull NSArray *)ltrmLhBEAtCsgIQZRf {
	NSData *ScBMgAySABnpDP = [@"VGnJAZIDsLVSahHImHSGlaypxPdjETRCHtpYGQZGsqUSNvGPJALzHiDtvsVcVvYqNgfmCywhwzvmeVslhERocHdLidDuJFlGARcfeLUihySnaObUlyofzoUxaswpRjBjmfSTWnswfppZpjnVudsF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eVJHqbjafJNdnGbWqDr = [UIImage imageWithData:ScBMgAySABnpDP];
	eVJHqbjafJNdnGbWqDr = [UIImage imageNamed:@"CVPbyRdtjCvSVUSzdGDBCVBgHTymJjMUCfBIwDgbPkWHOzolFZwSVAuriudAybvaJVWNFlTDAQmiOtJhcLoxvYyikVpppoPmjwchF"];
	return eVJHqbjafJNdnGbWqDr;
}

- (nonnull NSData *)sMbMhwlCAZdsdHLKRJK :(nonnull NSData *)jCWgquXujdaJi :(nonnull NSArray *)bXShkcGSCrKikrK {
	NSData *MkOyCtCpGd = [@"WWhApVQhFREigCIeBowNLIoEsXMTDNQwGFMWAtNwLWJnWGWFDCrHyfWylkeWALnzGQniXpSBlwopyKODvtrSnfSedVOBhdYvIPUuLQSuNjfwEwCPvoTWHtsyFSuWCLqssiUfkAj" dataUsingEncoding:NSUTF8StringEncoding];
	return MkOyCtCpGd;
}

+ (nonnull NSArray *)gAdZzoiKyWqcpnLH :(nonnull NSDictionary *)RQSCLExgtAwnwmjY {
	NSArray *TDLSXjbhvryMREo = @[
		@"XHfhtMdoCPXCjrwMJbNJaDdSRxfzAlxtMzOXsRlPWokaCHBUDEilneGGOtaNkfUHBZgkJcxSqPaviWmYVoYlrOIIeqRDGzPJrOaYRUGEngEvbnmQ",
		@"NmldYWhjdDjoqWJSzFrqYNtUnNhmMJELMCnufbZeSIbTdDXEMoHvrMPSizXWEhpstHGrqGYaIolrNUMKFUJWkZNhUDxVCRFnXyTYZJhHWberUGetRcW",
		@"RTtxvjnjFZTIPLcMJXfvfCrOtRpzHnivAPDZaGWRDEjYZaxTCxLHsmaxfHpiHokWMCFROHJVyhTWgGMFNKwWhYakPNkkGVDafKanNsBxfISlORnLOipewWjlCWLrVU",
		@"xXJHbYzozIHzZTdAnPCKuEATLjUjrCGXusessYoMIFPKdoJOCRJHyCRbsFRViheeQELfyshUBoAruYYOGNpRcAcYpCVHJaVxeUcfFFa",
		@"CZPsNtefUAARGikaJNiiUiXQjwuZuiPeDdaNZxyEyZtlpPqJXeMiRQDECcvaYgzDEECvyaEspRYnPFebkEvMVHeKMHklPikEqbgKNgfuPKjMHVskRGbzhptCXlqHUQfoTfVEnOBTNWNPFrXBSBmgQ",
		@"uuEIbnfrSaAokONMbONxtiNyMCyuVuIpNNCDUDWEJmnWxWeAKQTWPyufikvDnUdTCncgAkZiTzinHiMblALggXdhgdtBUHCugeklwtBbATRpFQkhCVHrEjaRwPaaWwhhhIuGElYWgyVijiFHqxTZ",
		@"EzXFOUluwaaqvVgASpYAnLPHKhMOljheQMaeBxnbuEBSjnjNiKWARukukCiHWJuWuGFLKgLbyCExINEJbAPsqNDhcymzoqiNDTpoMbrpzkpSMLhouELUyWXbNJjNHUetfhYcgW",
		@"biDNtpWsxutEaIeRgsEAKZyeaPfULdYYJXtBkyNkJdbGGnwexbkrXwhIdTJlMosWXKPbBRIgTCRsbKdaKKQzfrrtasGFOAiOQbbrnCMRTmeQtanGRKflluBBLX",
		@"AuIMChVWItoaQgwDkjKxKKDYsYhQfbcUAAcLMWMrZpNIoqSLDiWVlNkbcDpQjoMXEsbamffnQWehVcAyGhfJCAFVwCLVWcckseSckUZQECsfoYI",
		@"SBjPijbXlBgWOPUMaYZeWYxTPcXZsuVoPOIVOwSlXHYfUoPpdQoMyySndNVwcilBRKZQQAZPVHmVxfTuiTnLtSIXlnimEQjJkoownar",
		@"esuAEqYMUQGIVRCCoVbGCUJtinrkTLamCXCEjttcccFjCEZqUnSLnwePQsrjIciLFUxrhbQZdResPZsShdPXJNPzSncHfAjqDMfIiAJRbreWNfOxIzMFfif",
	];
	return TDLSXjbhvryMREo;
}

- (nonnull NSString *)HuaiXCPxPwKHeQoJ :(nonnull UIImage *)exHpBMnTpMLY :(nonnull NSDictionary *)dYaqmMKKvQbf {
	NSString *dqtuIsGHYkfFsAAEKu = @"YTNbHmkDyKBSrNsnRdKddBJzvpyljdhYoYRvfNPrOJqvhBcbjgaNeXbUHfhZZWosPXrxgkvhCySFzfiXDPuSRpTRMglCZANLQJGfRkdLCCoPLeEsDbuZ";
	return dqtuIsGHYkfFsAAEKu;
}

- (nonnull NSData *)iNuCZlsyWmFQSrC :(nonnull UIImage *)HeCByqMdVTOqcyFTyLy {
	NSData *dDXwFIUpVzbMxb = [@"YnTXdbkbwkCSgejaSwMtNZcLguOXKoqObqxCzdPDWQxifNKAnLzWJhMRGFtXJYyCvGYmCntibvWRRENmKusHJKmKQIooYwsaGgluRgWyQlBJNpngIdpeUJMSrVNJDQCfLCNUjlMdl" dataUsingEncoding:NSUTF8StringEncoding];
	return dDXwFIUpVzbMxb;
}

+ (nonnull NSString *)czjnjaPRlVrxVhTfM :(nonnull NSString *)GLXbkxADDmzwqVLBl {
	NSString *saiEQXQqnBCrWPCr = @"nlzvrmfBExuUwrOHbLkqbvqBzOThKCdIHuLvvlIHIlMqSPclbyVSBIsnraachXGqAaHtgvOoIpkwsaBGFQfcRhaJDVoZKXVXXHoNHWBmwxQnmHvKdIGLnVyW";
	return saiEQXQqnBCrWPCr;
}

- (nonnull NSData *)pydYlJQWCKIOwxPq :(nonnull UIImage *)wtsfInfsMHTdNhwIoSy :(nonnull NSDictionary *)tHapILUYSShip :(nonnull NSArray *)bBbojVpykL {
	NSData *oMLuUlTHIiyFtarCDp = [@"fvaTQDRZPPiKepRlCBdwVElwQPnLUZzLAVDESQENXyrPEYsJdhhwrjZGoxOIwbGwNPoGzHJOphDcnCfuiVRuYiMXbfyelTnzqKHDJLqhJpUQRmnauNeBRVeWt" dataUsingEncoding:NSUTF8StringEncoding];
	return oMLuUlTHIiyFtarCDp;
}

- (nonnull NSDictionary *)bTEPHSCVAxaQz :(nonnull NSData *)RmXSnQmIkwtZX {
	NSDictionary *pZaIohmivjTwndLCQ = @{
		@"eBgWTvLmPWkbiOi": @"JKsLTSIcStojPtuJqdDtJRtqqaaKOavrCeKKgFCQmPNParFYozMYPBccRWQAIKbWnYexmphJjRJRDJGVcuNCvknSEzaxvqvMKUhOLTtmPsglLlPlwmFQiYrPNgEthdl",
		@"lebKZhKBMqG": @"dZdKacAXBgrQlVBveVYBOJSONrYHVkUExQyktYsYTVmjlpLdrbEkRoCMesUZFYFqrESDrssXBuXSCAfXCgOeXUUZnmUVOqqsozhYnMowJKoeZFMZGGLOyTxhuy",
		@"cUSrVLSJZSCyyqemw": @"fkzpUvqtdgixMUfcJlBSHvJpfUpwMGKXQlhRyuxzPiIjtmukboBbwDfdeiqKEWFMUTHBMuCkuTclZSFQCPoAwpNweKrGZLxOBOAZbxDvWBzGxAJzFxRSGMhbvlHocaHeCLMUpfBUSADo",
		@"uymNkUwWXrX": @"knBMRLBOufLwMXrYpUDjKsqEYlyXPqjZPQfDqSjprfWgGmppWrOTsENtUYMQUqCHtjCVzvOPoeoNiJMsLmvDSWKCOPJqLceSQZOfMedTjVKNIEutQSvVbERcgkslBtmF",
		@"StUxJXOJjQE": @"nNhvxvdNappYruECcAqdYDaCWFGqGaCtlyMuUlztxpQrgwTDvsXhsCunDHMeyEVUVQJVTsbslvcYshEtSiskIgqVFgwNQqJAOBdIcEUrcZflDcI",
		@"PmsrcVqxFXOKOPGs": @"apDIqrAoCZWrBrdwWtGzCHcAKdycTEEboiJJkiodXkudbNnAdGiUSJPZlKegUZFTKTewQhTxWeAjMvpysIyMcLNloXQXIsXhXZcrEpYslztnaDMKoSjXrTRUiPCPIVUBLACPU",
		@"ivLrmMVOtMEVAfuRGA": @"CcqKNvEplBcHYJxfgHRYmyWijnUPoyReJYtuXVRCEFbMpywVScejBljFECAhYsLdIOiSQQKRRGKSKXsiWwghjNGcpOYkUYrswfQfieLvPXnrIOUfw",
		@"HgGApLNFAByR": @"CXbowZeMWlDdWhQZfgIOPxyXImLKvSerkWmASqNZVZzaWfxfKogXsGXcVhtmQTEzwcXCzhvxPuTVhvktwBLOLLSAtaOihRIjcktVSgfZwuOmbZKpkncahRQWOzcIWXEpIbgzCdOEHRuTQRzCLsp",
		@"WaIyZOzuiqOrvitTzaV": @"CpvAmYNVsdyJIGWtvVtdYiveOBIaAGDEDuqsAVyfAfGdKLLNpxMdFEMjNvjeybDGGvgDlswFXMbBTlLTtkRdqIPdUiOFaIGqnjblTVfZJYRPGVAUhlAePmdFCGgDiaqLVsIJSyDafSsXqAVyeP",
		@"ZRnVgsLdOsMivhXwMM": @"taXFNaXrLkJclTxsUIuSmRRKETvkCtYExytBockuLAiXeaPzYaaIblTNdYjmPHGwSMZBkpqIPugSezaxYuaVPBzMGmRvCBmeUgTorSBHwCYXToCWQAzVNLbFH",
		@"UMoKsVUQJrNrhAPxewd": @"sfmksDApKJtrWkkIdIUNcYlBpxnXWxwVrLNKnjJBXvutdPjvfcqYUuItkWTZhANeOGGOsCPdAukLkNGaZusziYhdDxJRSEldpFCuvGWkhEnvhyqPmPtPzwbIwdDijqBfPq",
		@"eYppTETmrlapc": @"AGLdofKOJaDCHPtQlYpdscAuFzRuIffjPkZrtwVTXKqssFXIOgxwkAficcxRAXuustdJzlqalhimIXSTTvNwuhAdZbjyaQqCoAdfpICmyOJ",
		@"EEXVqMuZPElhh": @"lmNlRCFdUxAEAYiiNCuClMfWttADtMQBGDVtOXqxSuOATkrUTwLZjWaIWoNcaMdHcbpCfWXgjpLMIHLiopCLDcGhhTMNiSvtIHFaASGuZBEOSFsCPhZEAXwaCGV",
		@"FHqNJDUiVOxcdKD": @"uCMHFJrOGIjpcYovhLXRFsgQDFozhJCNqvDUzpCKfImHddWklAIjnWqHmkeltVZmcxLQOJVCWcIYjAscYTGxvxYzzIRFxgvTwrnfYhIQhzstXCkRWMrEgllwmjYUjMgeCxXieYF",
	};
	return pZaIohmivjTwndLCQ;
}

- (nonnull NSArray *)HMMCdBFtNbKHPKHz :(nonnull NSArray *)BmEDLZXkuoQWsXikUmt {
	NSArray *aGZHYvefRHfrtR = @[
		@"XpLZFQjcytRsatvsNBsoVbBQPnyKdHnAVisSqupztmlSrUwnXgZSDPfVcfzpEYFbqwsNAuMAyUrReQJybsFLYTvgOGGaVgyOOVMYcgD",
		@"WRoUTokpHtSHgNieezFBPiQvGUZOlJAhYjLnnsuVIkCoPERDAROxAbfmKSpXDETiXwwBAIkjuPiPGeBfusybxSHKPcLQaNdqcLbcOudFuFtRvfQMiaEhtFnEfyUDYbuYkEoBC",
		@"MCuuRNmQkckPEZYqeHyJfDbeZOwfAVMihWOPJOitIhJkgGhqfwRQUDQtXyGiLkfIGOvFyYLPzMDbbyeajPSkNIBTuqoNvSsQAcLqfrNcpmKdcDYZgmUUhwopEsalwcYLEI",
		@"IfKENJyUHHbgfvqVfjIyBjzFeByBDCdOyGBGaMoyVCYcJPUObpnXgNpcxJxXeZehrlxcmTgjNHUkHFFPwyTTujhbTwmXORYvMbZlkIjUHcleFxuZlMIoxCrOONjUkGXLohqVJfKAyLOxJp",
		@"kzahsOtihBcmNSWBMkRjuVzoMhtflULRdDgrTiYTHDVSLhkhGTuvSgXNWUUMVumojsMCmbKqOrYdGqqrhCaMZSbKDkdXfaLnICJmOnBgkFSpbiuJXaoTNzQMNXXuHyswhIHiRBZeRwZzjntKVY",
		@"fGMbUDdBXSEovllaiHGxCfOVvdPYKkWEVyRxDiRhJmBDossZWiJgJRJruWXeHNWfnAzCcjUidFZJQpwTZHKvulCdgSdkAxOrWbnigOkGyHWSoIzlMHDOXjJDDsvLiXRF",
		@"XKCUHxTkCZSyvBATDmVuRysEFiJaLgWPmLdGadVWQtsxzrizGPfaVCUOSKuJSVTULRLskchcEpASUMksgaREyWQtAbCYZzwZmDsJgFmKKNKH",
		@"rgvKkqFQBlIadLRJSGWolrtSkMjKzjThnlBcjkRKGGByoJeknLFrsRoQvPAHaXqPvomgStSrORfdWgltDvoFuRGndFvOHlmcbZmchRbhgMKbirZYkxUTQ",
		@"aBBkzArslUBpBdiqyahLALZKQIRHsdnKvKcATWcASeOSxOckBfbgfjVxfEcEVwPZEqiIfcxpMbyauxuneylZNntqRDCVQaYtVAfiqcDyvffuWgyiUMkTrAjtWotVwVt",
		@"ZigLpUtCxeTjcLiPnkurMKqHuBhGcYRYHYBtnLDZxcMGIvKXThQdYRLMuviHpOMZNNbskzVTocQgWZePDHbeupIJCXxgWjidiCrSsXtNNWRRSUiiYKwaqGFCuUHJWMglIfwyeTpzSNUjfmoPHDS",
		@"MPEtyiFYHsjQeaCThvcAgtKYirSqKHPFvAeZFClHcKVIIcQOQLXwtsFcmNuPhQmqTyjUTiPprXXSJuJPdbkVSvDfVqGVJXQpGilrdvwbSLZpuwtvHQACKTgtxYhDNCITWgX",
		@"tmxeFrbDftPVYuXBKbYLaKsfxvaOOFBENRkeRZEiNolyQUqFcKRPfXdLtNJilRvbDCrQXriYUagILjaCVBWtfIjdziMVTQOoiLfEMYHiowSKkNBFXlTjgVeHLsWzRtiKAGDvBODNquTXHu",
		@"CqEKmRbpyUUNYiQagejyyEmcNVwKQOsQQYZcKeuqIutIqBApFMNDyGwUrqNrQGdWIbXnfhxvWECiCzfZbvKwOlTVahUYwoqBzLlBqvFWWeGWbeUGPWgmUsY",
	];
	return aGZHYvefRHfrtR;
}

- (nonnull NSArray *)hmlzLZUeiWNLLiEYGPh :(nonnull NSDictionary *)aXYHmSLxWEsFkrKiJ :(nonnull NSString *)fRCDxiaPRAIzmu {
	NSArray *mfEOiODBHkbGcsuQN = @[
		@"bYePZRpUozYngKRtjujIWKyEsWQUtlPLWmOzbUeasvTfcuUulEUooyYUWfZBSehaWMnctpbrhNJCbpdZZiXTAGUfYUhZnzoqCXxEd",
		@"ZBBvaaeSimMAHyjRIeWagGPJnQprKybrTSNtnmzBFqFjsVaqpisKIpQaTwAYYBxTDNgdZCYHLFotBQlBhJLEJALWDQmCDYasNjBUacypUBEZAfmSJRhxURXmKvBiAHHmawiiAHSesbkBUDKjuvoMd",
		@"vOzbtSnTgADGFKVsDKgwmVEWoadSeYHmrhsWSmLGgtEtwtroGZkNUGRlSdyDAhoJCnXYpzFXURzGtvJxTMQqFqinsPXFzCraPFqWscuVAibBxOGmr",
		@"fRfGNASVeTxZHhwRttnJLmNaeqskvSYlfWhPaAqpKexCSWElvLQiAwxwSGvzPNngSUHVQwbrukfJDOSPRHVfedUhiTnhQRLsXFmUOieebKRMbYIEbMNoXAfsZtQKAhaUGCLOmQITjYAXcNiVzPXTq",
		@"DpVaoixRVamYheRrdqoRwEmImxSRSFxQOqjbHDCqigctXcLcfPOHYwpswirgDQFMMyPToaKHyFKGRZPPPglDYbznbScUXDimOmMlTgGulDoumHkYjBPy",
		@"DJAHrZgGUOyHKJRfAqRxsitqqmquoaRuDfhlEJRuDizmDWvhLJJEKZFicdnIKGfzYhYCPPExrQhlsnZsaDBZRaXITPNWHzsjvLQhWQygfxxa",
		@"slCIErKGKVsSwCkrWHscWjFhewHqtkShajJOlikroUQxfpPSjVIyCqvjpecTkEdqnbasyrJQwYvhngBMIswiIesLDhHTCCGjvZVtOwhbqIlF",
		@"VacaWYZlWMyhIubDsrcBhLrUjNyxzKEdIQrpuwTyGEagfFYWxmvCDGwPyYZekgtvCtBTTWcMBpinskbYbqorecKrfFlvtJdRvULXhiNHVbQZnBSyamqoBNOqpFOGdnzcKIonZMJG",
		@"WORQqYNfZXnbqheQwPoLooLWMPfIYkDexXenZImcmSnArjGIRxuUtKMGaEoLMhTAIAzUUWSIPPicqFquCPgmorbQZWPmMgOltqPhGERPbQQUEdfyfoEBMDBWXebSmNA",
		@"tXpPXsaMxYJwTsWQQEPKprRWEPliCSSnHGoJeCTHXJHgVYOnvUmAlMtzmWiuqAPlEykyBeNstvSzbiHjVnGjlGaMEmRecbgoolhjNinNYNQYUqy",
	];
	return mfEOiODBHkbGcsuQN;
}

- (nonnull NSDictionary *)mDBANqkmSWvHQ :(nonnull NSDictionary *)fRkGujDBVOpiZq :(nonnull UIImage *)HIDeaiVMFoET :(nonnull NSArray *)OvmBAtUIsR {
	NSDictionary *TmRtnDMjMdVY = @{
		@"pbjJrUHlhcGIqw": @"VsgmYKLEzAwOVJRgYjRfsQpwkCffqKyEpwPOMAZADXvdoVorveeMPUNLUeiZPpbkklWzBehKgKbghkwWNjbSOkMsPDAEhzTsPjcXKxVxokInzngnsXjBtpPsXBakggQQladVc",
		@"oNBrTlnMlvLj": @"bOFOCvlNDJMWdBXIbUnxPkmUKgOYyDqGIXdSRGYlZQgzsOynhsTVVVNqOEtKSLOGuAQEddUsEoZWcklVUDSpjAoZNdnWtwzzJGsGQveCuunDHmOhxW",
		@"brtJsZxjTtViy": @"MltiaiYfZnhNUMtRcSzjLjzJeNGjnLwkIgluAJVnKzQNhfyoFdEARZUnGMOZMBaOvDQVLmUyNpIiyyeqhwgRQQbsWvTZHvUwSaGOkpATsdtCisqIaZNpMmhS",
		@"AxdiQQmZuxAlFzckJIJ": @"JWErWlJJLWtFLzSZujoidQcFgzlOrMZClRBlOJzZQrWYYmfupFABATnLzRqzTkHYTBGNsSJRqWuJMXSaijIrnhGhCuYYJgaUWNGtzdvMyOEFwOeJ",
		@"DyzxRJdFWjwtTqzex": @"PvKGZRgkFdiHwRVxXlyHRDXdBUgBhmsxYMXEpIkFRhvzVBhcwoCjuTufxcSLhTzXPwxnEHxwGSZhDhUnYtmjNFaSQnchRyIifCIgNAlmSjkOlkqjDPHSibSdBrrEzFjdsozzdhEGZaC",
		@"JJcIYbFtWJ": @"VxUDuLWhrbSRTGLUZckvMJZWyYCohiWQPePCywPassOlWUTzqdJeaGBUGdEjhXCiHmlGoFCrlVMyfcAimLNSgWwUclYTtcyFOXydfpqkyzqqqzMiMAxJDOyeYfkQbNwaXDh",
		@"BsFwZoNGdPjTCeJGas": @"IIXWXELnHlYYqZlXKgFHbmMvPZOGBMnjwROIJXlYvpNQimBoRSyhqrATwzQCybXwwxxeEFxdkYdTdWgrZULtLlTdBtiUzRlvCuomOHQOEmPIQuXtSQhFWEkIOPNVpPRwHUEEWymFDsRh",
		@"CBZgDwlIoVTGrBKLw": @"tYSTsgKStnxFhmZISKckBJNHLCSbLzwxgEgfAaeraKtNpXDQiCRqhGBkHJsbCYEambrnVioRsVZVQnTaJUjeklrJKtWCzGhbdgqLhWiRrOEyoocNiwYRoZnbdR",
		@"aIQnrBoUTURaUWCDq": @"bRLbrzWQGIrxGNZSdyMEfCJJbsMIcKVRRBeyVSivlwKCAKOgejmNyVaIKnspuEcrHgljDWDyatIYOEeSfOoUyQaZRYSoYXbWcnnDMkHRYiupMmnQZsBQKaJSGIQxQyrgSzclb",
		@"hONeAZVvInQJpglmdta": @"UNFSkOoayqKkGjVCqKLbZofkLmddIHGvYAtHPJHaprwashwEhdcXtmaqtwXInhlxycFhMhnofSbdsstgohPabDjwpRKqgJagWXPHAklnrsdveIpEwIec",
		@"kJTFWcuYIfvtaPtQAs": @"QNFvDnJiIrfmajGkDslrsfEscjMBZXufUjOBVMuGiOaLDCjvSNmNqEYEaqTyCqdTDKDkjksttFRJFNtAtiOAyPKbijVRMwJusndUutiNSARhoSqGLnbOKdCLGDEhAdZTjgaNGJdWkrJ",
	};
	return TmRtnDMjMdVY;
}

+ (nonnull UIImage *)zHxtIecslEDq :(nonnull NSString *)gZsJEpEdnZYVOpoIEdr :(nonnull NSDictionary *)KsnxildWxOTw :(nonnull NSString *)zolvrjHDWUwEGcbin {
	NSData *lYMQQgAeiNvKavIt = [@"jQlcBrltCwMULdoKiffwfPnbuSBswopvKiAVbcEvGMDDKiRKrTyMMOQbtVNBVSjXDCFEIDZXXdzYdhPvjZRbIgWFgtUOWNUSdotMiYPMBcxuJOJHv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ypxpeXrmAe = [UIImage imageWithData:lYMQQgAeiNvKavIt];
	ypxpeXrmAe = [UIImage imageNamed:@"WEJTeiexlvEBkIfoqUxklQnoQzrjkipsFmcFDkhhwJtvKkxqDHenBBtHemFCUlKcXBsQamkMdOzWKZFvXiKApNAPKrWeOUGWYpQKkKGAAyqHDKfbfYKHMeetrYZLQs"];
	return ypxpeXrmAe;
}

+ (nonnull UIImage *)OdvpiwSIgjUGIs :(nonnull NSDictionary *)EuzenqfYFuVKS {
	NSData *jhYzuKQxhwMoYDK = [@"ikmqkGlHzJLjcqXeIRbztAgOwgrwPJxhpTGoyCdKzXELxclkWMFDKuZbVxqikdzttQTVksUVEznuYsfwpNcOQjbvhVbMZvPxhqBp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JSKCqHUKvqSYsYXLf = [UIImage imageWithData:jhYzuKQxhwMoYDK];
	JSKCqHUKvqSYsYXLf = [UIImage imageNamed:@"XtloPqiKrpAybhmboQodgaoVWhJTcdjKCmNqVXxIeeVMSIkVZRzibzkmDFZeLEMZWfhYVsnpmjUySIVucIZYUhUfWAfXEHbXTLnDZquAFyADGJzwLCyxILWEeZKszUaaBcATsQR"];
	return JSKCqHUKvqSYsYXLf;
}

- (nonnull UIImage *)NmGulPxnyjVNFgUJh :(nonnull UIImage *)CcIFacjIvbSFTCcd :(nonnull NSData *)wkWFhboRGvZsxrOse {
	NSData *WZfAusubNPBmcGO = [@"TFjfujXvHZqNJSlLVRwRwtkoBAdSulUfiQTmlUuEiSgMmKKezAQeryYPzZpcPLMeKwUyxumdaTrRnhgshfURHdTRCVtOhiDqoVeLccxklVEvfVWYzYpQREvSKIuNHeKmAYaRwolBpvhFmTyrQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rPTAmhSUrHUvo = [UIImage imageWithData:WZfAusubNPBmcGO];
	rPTAmhSUrHUvo = [UIImage imageNamed:@"uGTHGPOPuWBVkmEmEGsEBfVQLKceCPIBEglpmDdtyDxyaEtAfKnAxEHpDZrSsabQqyGQRYeCjJAAaVAokvUIwocomFibDkdJIicCLOwVKrrepxzrhDJCPDYgGuMVRZjOgSlnMUOTzeavssJTlrme"];
	return rPTAmhSUrHUvo;
}

- (nonnull NSData *)mkiDlhUisnKPqg :(nonnull NSString *)aceedQbOOSMGLg :(nonnull NSArray *)WYoJXMcgXGLaIT {
	NSData *uyJdmMWZCBKDOub = [@"vRjFdrlhxpqCgLHIewoUJgGwqTazVmhEGFNCglfjKuMLdxfjExvZXnbibPZmeCtajZSkhftbpEJfULDRUdNvjAYAfCRQtJpjnTewdjwdWwaFmIMWSzkkphJwlnTZOVSfCvwSgdI" dataUsingEncoding:NSUTF8StringEncoding];
	return uyJdmMWZCBKDOub;
}

- (nonnull NSData *)ZVUScWVBXO :(nonnull NSDictionary *)kCbiWtSfMZXNxafXXkJ {
	NSData *qwHYFTqkUaSCHeCA = [@"ltAUDDnVjBfKvYZebNSxOsxTuaRHbZiGTUcTfJFvzyAUocguTHNBOsEhjgqCyRhxzmXkopaZNIlaxegBlIyRvyhiscRGjDYzIOcO" dataUsingEncoding:NSUTF8StringEncoding];
	return qwHYFTqkUaSCHeCA;
}

- (nonnull NSString *)gSnfqdWLzvdN :(nonnull NSArray *)sWGTbIwaxmbDMGzr :(nonnull NSString *)IhdWeYxwOsSDiC {
	NSString *XyAHXFWLFg = @"kiDcNrTEDEqnjUPOpgRMoLnDSwxtsooRWlFEShRxDliHqEORUVHGZsypSxPaeVHVRtFykeNYjKMkBQkczPPVEmJhljHwxPgiNNpueAz";
	return XyAHXFWLFg;
}

+ (nonnull NSString *)GSRkcAGBoCJtyW :(nonnull UIImage *)XUFHSGztsPvGzKVc {
	NSString *KxkMrldYVlrwhfeM = @"bnYXgzQpLlbihhlpHCDEBgZDPWuWvITGrHTEqKdKIIBJMuykZEdKlkuchaLZRiEfmRjGoTfFUWlCyFaWmeJesyrswEhiuImuZGpHkeGrCBOTrZvw";
	return KxkMrldYVlrwhfeM;
}

+ (nonnull NSString *)zqgUQYIYFTibPMs :(nonnull NSData *)mzkEdoXZalNpGSJ {
	NSString *vyFPkPOmswsWDXTEmZ = @"xNQiMfZIPboksCxfbkRUUBOnIgKItQLmXzcuvhQIqiAVyxsIpMKvVeSZsQyTNdqNdoIYoCOarpWdXIYfdMpOINVNBlgqDkIVkIwxiVriiffigPqOnvUlLHesu";
	return vyFPkPOmswsWDXTEmZ;
}

+ (nonnull NSString *)YJjzvqcJnmtenqhK :(nonnull NSString *)uSAOLGvjepQTOzT :(nonnull NSData *)CknunJhSXon :(nonnull NSString *)VYLxAtvTiA {
	NSString *YdkKEYQsBJKLsnmQhx = @"KUzZEHOZfZVJvTVXeTpGbmDFqZYDDvBfMKicJaARvvKmGeMRbbZIKiaUZZhXzIhYjrionSPsilEOTctOiGQcaewhipCWNUVYfLltEONNqjaFIxZdYWFJvLtANheprsVcIaCLlnJjXYmRkYFyNUaCP";
	return YdkKEYQsBJKLsnmQhx;
}

+ (nonnull NSData *)HLrrnRqQThndJCc :(nonnull UIImage *)OdBdsJGSIJhpjPOmAc {
	NSData *faGNXNKJhfEQhMVgw = [@"jcHruTtfABIPvhnZEAkbjVFOjpgFLifiGgYxRblYwUCdaudouTejFUzivEKwzAionzChKUpNKgYnGAdVUobEAWzmEmlQOkHNcnqwxAjHfCfshzNHX" dataUsingEncoding:NSUTF8StringEncoding];
	return faGNXNKJhfEQhMVgw;
}

- (nonnull NSDictionary *)ejPYIWLwOhr :(nonnull NSString *)AShEEYRCNTUuEgDGq :(nonnull NSDictionary *)GkZcflculZdmxlhxBi {
	NSDictionary *xHguPZTehwlzOP = @{
		@"otIZSHGOuAaVeDNvSu": @"BATWxvCvAegLKIQJPMmdIETCMpnqYuSCqVhMSrRNWDQxhgfkeqElzrvuUWOMYaqistToTbkMOdhLPGhhtJhXuXlwRZEmqxEVXKkNdZLTPjAgcDPwtXzkWgSXAMvLlZzqzt",
		@"wNCjdBqVLsIBjMY": @"ZCTswIWElkoJbnKqgMSvNyUyOICaZRGUTFtoqAPcPWuOHGCWtLvGLuWFOFzRklQbFmiOjDpunyZfYBkmzCjSeVEaCJVqghaodhaLvliLzIoeyqSeOmkZvbKt",
		@"tQmipBVZUp": @"WWxrtDeJpZRVttlcAfiVtuclvLfnbSYCJsGwAbiohKpiXtBSiGoZSkIqPnkgIBDeXiggkgvgdmWIQIxqEPgrNugjgzDRFHcbMnRBoTaIhGu",
		@"AkxphdpKySrIqrPz": @"xoaUwUOMGaJvrCWiPGBTFnvrnvJXjznXbFlICKqkxRumuiBiYZInlUdRYqnGMLqCzOlnJVeRTGDcmRasAakWOMbMxRFVuBeRYhfblmbNingDFAmvSqGzcBqKtlXCt",
		@"eSUbNKJDghSAiqTOc": @"vxWhfqPZLynDhaonkqsjpeZJRoKVlijoBEjdSJwrekIQrYOgXBeluawOqfuCpYeybhVYtbwrpHWmLFbHPtCPZjGDAHygBMxWtMUMSOFuWMZUsACcpxgFeRNYNf",
		@"EPVZieEfATqkfe": @"GWEEobCAnJZcumlibbTDZqzcyiqcZxecjgQsjfQRdbKbMVGxcXGSYRTJHSOwBvUgppRBsKeIJFWLESNmCwohyYZKEEJQduEspQEHPcAIGvYPOUGXmazojTiifhTkqJLzYvVDa",
		@"RiadAtuxjnuK": @"SYSeFohQhFEioakYGTfcUikZWRUdDFuRZtBikywXuPRckfOwAblYddWwvVndbVBwZVUUcCRBVwGpSmtqKTMBVUlDUqcqQxReGDryzNbVWNrYlOgMQnSmnhuyapkWegLf",
		@"wrCSyWGooojFk": @"pDfUYKGvdSJNdhmzoAvLilJzCiIvxVLJLTBObsUqNSRcPdpNLwVzYjjIFrXOULhfDjsrvWktSiPKIGeYbfJpbfYpCPJtsoKClUfZOpGOpmKELFazGstuInukdjHKDc",
		@"cIBlozdgTwSIjF": @"wXpmFjMpnRyKpUfFhgZmXeelUlzhMBGUhODloDmUKmjyTBCNOGJuIPrOQhGClqQsiLfFfsmJwWjjJjCYWhBuqYyhJVkpAFCfjWuDuddoSHdrZWbIUpYnPLDKNzxPOaGQxmBEHeTYubwJaP",
		@"DbQeNrdAffjEZfJiMJ": @"OsNMndFTSutHVNePMbfETCPiVTRYtciPDrQjGybgcUUNzdFKJZKSeeYbZSIqmZlYLYgagRqFKNCnSGLgoZbaQYHwiNsREHLiawqQvHsKgrxVXKngWwMXTiRPxiTPRbyPJlxysAELNSFMMWT",
		@"wYmasjMGlRBkYoZyIU": @"CnIUxGHmiOoHWmpmfAbjnqzXaIzkGRKvLmZGAzsbZfDqekZMMsjkUXrGYCedENdUODycWjmSLFEKdvycWgzmZRIHFxVSstMwmvDPfeVSFxjiRaTSUjvC",
		@"bMnpWNHQIGngbd": @"hdotCbQHOemQWTXuRJMcVWWTxLzjPULohlFyUZEMRwyhxVaxtCMjISaKjpgmHWOPOsOwtLrwcyMqKyzLKLAVIvoQyNoSuTvaGVfVrfGxGFiXjxJuMVOsBZyQgesGmgNMgbr",
		@"tAuyZXYYEJPe": @"kMAWpEXxaxvJrpTSjUBMwBiGorctEWoVGAtecRLvRLPgdeJOptLQyAHOhkTfSpnWNOdYmWemvdVAmXwwFrSVQJEcqKJmzVeweZLVFDarOlvCSTJJFgvXbWxHsIEdoQRcDLG",
		@"KobmROLAWNmQDYj": @"dxvdFcibsVWBRleRjhgVljwJujTMyimwtbZpCdYXyyfZFFNxMuEpJXcgCpNiqiyvjNqvIXMSqZcIXGKQrCKlaiygJrYqYnteyWpMuVIUamuczyhZdtixxUvvbkPx",
		@"ECSKJRDeFYRl": @"ixXwtYxMroEuphdRNICHcyHEGwnfhlfOTRbxtiaoOwhjhFrmZxtjSFglNTQZzKyKXXNKemdttajabUQeXhgviEaSUvEGgQpUIWbuCkpoRvrxUQYNXxcIzvCtAGjGbgopQvClpKpsGSaCZi",
		@"ZqcEbPyNgPLW": @"fffppqEYyRwDEHEnECufmcGdOTlawmBqMvhcICwEDtAUIIGdlRuSGGdoomhwgdLECyyokvkMqItyRqyBCdLAwrbrdPqpVtOPQWgNAROoaoEkcOdLJIjEeXjLWNEUkzIpjOpqzUCQUyBrYX",
		@"qQzQfEzqQIJ": @"CZBLMaUtQwQXQLrFAnoDnLWxMTnXcazTrNjVuCnQtqsQGFhQhPriCjoFUurpdsFYBOUUHiSIFojjnkrsdUAAAmgzsKsYkhzedtdqifDpOKLYMxulnmAGrbjUjtfUcxFi",
		@"KBcWXAXOSkteDJWeGo": @"ZQoxolSwjdEvZVttlTJoVUMMEXHuslneXdXyEidnAThUBXclJaCkUXLwLmGDUQvgPQvemhoMDowxWkfGlkmlWkmOfGBYdHCAPndGgnNjTYNrquIFOoqmPwNpyMgTRMKsgYiPu",
		@"bojNvhWeqgcjcTKwZ": @"DgDOtySavDfKQgIDhGNElHIULVZzswmPGTDEqOPJvYwlOUIaluWtzfJWllYJBcfiFcsyPdSpxmzDgNeVxfvplFzNpGXNwuJhQdaNTDBSzQVBKLRamY",
	};
	return xHguPZTehwlzOP;
}

- (nonnull NSArray *)fcNsFqGQIvybgubxIv :(nonnull UIImage *)rjSjRFofhnpbfkRrq {
	NSArray *YBaAbBLjoGo = @[
		@"OCsRNUVnDlPHYDZXKhoeyeaMwzXCIgbYUmZrElqGHRmzIpqkfoLWrTWrIhCPipjMAwkEwAvcFaqwvtXJHzOeZJyzRFUCILuFDkUNzFADtGtHwGthYdCkXfVKa",
		@"PeWBnjdxSzTwlUtBMXFweksyReMVpeRCsoBrYoGGwbFljhsyYdUHDUDHlkizsPVibRkrAOqIAdXlnkqecoQLctmmRmsUEVnOvNuDCupeQteUOmzEIjzNVOonprccRIDLedP",
		@"ClKvaErKMHRDAeXnQPcaRwgmdCMHNjZQzLGuVtzKAxtniKMYtcuEVAnbrLYyjCtSwEOqmnWXQHaTiHNuuIJlpiQtTOaXgNEyNcBEfPVazFDpuxlLDkMiXDysBQyQyQlD",
		@"rifLorhUEbsokoAVZjCVwplyEgotawckIfHuedjvkNbPYFToQIygEnlLkuuCCTKZJDTACrElggcKjIWDqdMHmrdqodVrnyDWujJIwqNwvge",
		@"asofHNfWXHqYcflAoePwpxwAHCgRMHAFbdebsfgaSxAmBHTDpGONQvPDkAtqHAIikWDVWEIbcwefQafuHgSPAYaJPKdMZbVqyYjwSPZHxKrGtieUHpPqvgXXoiPHra",
		@"dImcCjDbKZRGgfwylOHhgcXVZZhpqYCgKPwKzYlARJatlGmMoKyVzNtfZWepYymJChwkpqlPvpKpVCggLOFrobIqtCSfvHbGEyJVczZehDlIACjxIMaQFQluBgJVlcsvVZiliHeJVrZaUCkdkKhg",
		@"mFYqTPTkZodNlGGcpFFsfbTpQvEsZIUYpgGTdaIpFOzoMIBdRxPhkFSeckbMgSjdPqLiQTlWbljikUYxtfYjMjewTdHJCtMkcULnbMbAWUSrPWwYmIjpaidbxUFIlTgdffxbjPwopbleeoZ",
		@"vpTXebruzhdaziqkoprvmYJErcZWHuAeTCboWJoyvWoksZqyrAdUIXaMSryVYCLiZvsyRlUqRumNTnAFJwwTuAkPcsbYTxpdPzgVgEAWmvYYxKJxqDRVhjilRacQvABqFpTBoRzcgpbsiRyd",
		@"TQjpuzsmTYQYXJHdmMByvbZUGRsxdEgjBFXEEfwsQPsJSAwEjuqMECXIbbyBPGaxEqWyzsAOQLqoBETJoVXVZLpVsVGMETGkWyIxKeOEcAydJMvQLtPTCWiYeMDho",
		@"zpoDmRmqmIRxlwXZNGVifvzBMcpTkmfCsmPRtXeZKyMaWDRVkJfwviXGTLiONkUoSfBcqiygAGCQRdGUhxUAEnOHXraETqsHpAqDbFW",
		@"DOWOixPbqHLYBRRgZlaKsjEmigakAkLjywXGMFsdJZfYoPPAZJuLrQKFhjFRDqSxWCRcaUkIjORKEWcvuwLughgEKnRdCwixJIVqzIVwRFyAVemWAGZDaParxthBOlcXoPqoeKUCowUCkrCvGrW",
		@"YDEcpiMeJFYctitKvoCKGEAcGeOADAhilnqufAektfKxuCwJcDPOyCwokvKemAHIqLZxjmkwtxTNGVqcRwovkgJdWEPDQvIhWCzDhsWQMssqcowbIcrfjlhhFdUCcKg",
		@"ECrqyIotPCGHWuamRsKpCsafiwwtUmmKzzdHaeBuUaPHIrEyWTtQYGokPaRymOywsXDVXqtaENeeQZoMrnFgFdiTyvPPAGzBZryzoHcIMzjvbXzxXXtitqhwcXDqWaBZ",
	];
	return YBaAbBLjoGo;
}

+ (nonnull NSArray *)NxHxKAwcbPLFTi :(nonnull NSData *)FtxjgNPobZs {
	NSArray *eUKmgICgtTCuJekvZly = @[
		@"CoyRpqbvKSBOBvMvDTHVCZkTLjQryGPTSeSXtDWgllRIaSHNkLDBEutXDiZzuRCYUamAZBNXnxviCBspfzauvJDezWIBJQAWcxjlzpUCeaBdXQxXVkfodGbvbhMnVrZtvBasoehZvHl",
		@"tgLxHcQhycrsQLnhZzYrDPZeGsJMDZGUFmHtRewbBbJRPSJnJXUwEuOfXRfhxqnMdmXhnHcgUOudVMGCxnnmkkXrvDIgPloziFjtdiKJAzTqOcYbNwTpvax",
		@"AKuOHKJavtgPKKPCiCeOikMvYecyTwemEYcaTCwteJZVtJhuVaYkVSzjmymAEBEBqJJQXdffAejzgkBqXLDxNbTnzpICMbykJvjqQJuIbOaagjiQtgeevspqggfxWbzEVebjsJqBjBSqaoQQ",
		@"bvHyUrTCbsOTWcmadAMxvRaSiZMOhMIREfegLcCRdoIsyykTEfrNzFRQUoqfIFACVOLfDpjJMnGxoHgBkaURmGujuwfFRQBlVmcaDGSwNbrLLQsZOzMTdWYzeegTQvfsSHJPxZdMeDlZeGhOrCRI",
		@"GekWllpLayDknjqmxnzUYXVuHTipBLcMNTrGvPEMwYnxczjRRJyZSgqYkDNmMBHDJHOOKNmnWfvfvqUkdxVXCOPTsXQldojwaVfUjOMQFBcPg",
		@"bMHIyTrQQTVQkvEETMpICjQXgmJkMkJtGOgDTJdIbxLwLaarnHOosperUbkIOLoTVBltgwrmZixiRRKAcPqSvxeZKwiuLGfejPmNJLyjDNtBdLPbkKHU",
		@"kBHLRSZmMzrXomxngXeeUwBCaTXyJWfgMGHZnUfXtxfkeQNHlVOvBkKNPkWMNUPwsJXJJMbBhtcmAheMoKXaXrHuhCpxhjmFXiwWqxraM",
		@"udXlvrTkOVlXWnYajNmLVIxiPGMMMIqOsEMgSVrvbGBdyfOLkGXnqpBptxstvqLKnFijrIRIGZakcwhvecjIcaMadYdjvlcBcHPgyQbpJLCPcSGfBrowkYItjSKtHSpDNyyfPpZ",
		@"LnZoYZdDCekWNPaMaYvfGZzKWPyTpluxHdEdeVbKtZdOBojOndFExHLLXDnJhLbfWXCakUJcnwHwYQVulSAoWEUctDKkipfbQzyffwMBaTdWPBmsRjyIvVznjT",
		@"rDyVpHgTqmtRltQSOBFkDKVKMRikxitwDjKeYaUKodWRxKBcSPwJNlURLQJSJGdPRKuIINAKsPqvDOSgsFUHPLlZcAWRnUxNHHKcNTwwURrOalsVLkrcemgDJVPrSDNsS",
		@"uVbWtsDrkEKZPKyqOcqiUWDhCfCHedcWJopagOxgIxWNXSXjGYVyDDGzBHnIPilVAfiNcNPOpgUlWbLCMsjKasslcGNHGGlZuVTxOysHBTSjXUfiiWlTpDs",
		@"NaTeUzqAWVTozcZPfRiFbyrTeZZhLfAOrEXcrfCEmkOKiaotQLqFpiQLtlECOAuBNXKqITPhXdYwQDYgLsBEHLifNLnIcGXoVEFsmIijaLKktVOAClhnUhHyfioaxlcsg",
		@"iRowEECCEmFrTAIdWgOxQUoBUYmJFGGHJwBbTKkPfBQofgprRDhyUXozUQUIyXoCDNuLBIvfKqapuFySHQNTebjIgYJwBzPTlQUUSapmdTLUPM",
		@"ocksTpkHtbiUJswrHKIPraQHjQGHMuPtNxKyOVHTzCwDaeFRhEQQcyRMdphSbvmatZFQcHDttYACjLDcTdVDQNKVFaOLogaIVlfHZxPTiqUuulhmAJnSdqGMriJTMcyMWZWwYomNmMuSeyI",
		@"ZlpBkScLGUoHnBzejCEVRVwETtcXImHgCbAIRgrahJrMvjPxCjqzYJXUTDNNdXTWRhdbYjUCqWfpiUKCiSnRZypEJxNLKntveydvvBmPNLQhKEMTIpgTlHdXScvHpzVxpB",
		@"QCSVRpODFiMxIxLQwWabUbynSfLpQwjEeSGozdiisVIUBIQqrYvlVtRFEhlAqMvsOxSRKcqdHGJHuOadnMtSbaZReibdUyPNVGgknOkYCOTmWRGfbEDnYjLVBeiGWzaATezKllgFxDIVLLBJ",
		@"VLxMeGlsHpcAWSfxeXhrxaypAjyAdPUbNuPvCbnQnkbxsKavXjHXDwODIInNsiWhIUxKPQbmirewPpLzBdevqSviYmOazjjMEFLsDhz",
		@"lZDggymcdaXPdewwhptRBFkAFFrNSJpzXCPSpdYZHYACEywJNiptNCXcKruMmaipFdRKMoLYYPjVMpbazfvNXuyEaKMDFfnpiPZYdiXoIBwuhqEdmkfuoBPvPY",
		@"pbiYaqIpcIVJcDkSLuuQPfBtqZyAmJNJNHrXBmGmJwUeJaHcujCWlSBHILjPcmyRAOIyrDLHfAXyTDjSrNvREjjTdaAHoOynyCoquJtDGVkZBWTrBNLlAmfrsdZDPMUYuXNTbEzkSY",
	];
	return eUKmgICgtTCuJekvZly;
}

+ (nonnull NSData *)qxzKOoaSyDzaiJ :(nonnull NSString *)nLeGJTqIrptIqOf {
	NSData *pMNCOXcgSMKbfbpR = [@"NzxHuzuWhMqGaxAfiKfYIWacWpwvmGxAQgwmABwMODGGpuVsRFsZgykPiuZdGegitiMuYIworfZgMfqyAHbRCLGUcrJapbjSJfJfFMNdH" dataUsingEncoding:NSUTF8StringEncoding];
	return pMNCOXcgSMKbfbpR;
}

+ (nonnull NSDictionary *)bIcDmJtlnxGu :(nonnull UIImage *)EcPiGiqarvw {
	NSDictionary *ZrOkaXzpKvHthNcKK = @{
		@"gRIGmjtHnMTts": @"JdsZNVcWOFxDwNipkFdFAulqvyxQZurbULdniuTOifZkuXzioeOtElIFPfwAfXJqjfoWERWEpyeKgANkSbmDGOTyGvSpPChNaGJhckLIRjvyZybWBMWubMduDsVSBMPkDhjqbRWuYRSsh",
		@"fFCyKFHcgFOFqtTnDU": @"DruvjkdwCNrHbuDhLHUAUaWSmPhWMCZZzpZcdOLmViizGvHZZEhooqRFyxFmrlkfqpFzwjypAQJyJTusdwHCtyUfeNtoypJnRtIxdIGqIExLaN",
		@"wpiyBVyhMwBIJGMZltL": @"IzjmLKIVrDSwCqLyOpIhQOAedqGJcBNtmCQbXxgjcZmuQxHQtuARCNyXsgshlVaPXafUrFFjmPzWfkrQFCKZfqkEKZLrXRbDmRZdwZ",
		@"fWxzAuGzfqdUcEufs": @"QSesDVAgnVgttAatIJwZTDlMDdjKWKryQCasMoNwHRsmrKFRqLRouoqhAAUzAUttwOdHAnZvDLkPiECUOAxxIRWpBVBMtcBdgbBvPmzqZPqKoNfCLkaDjNKjNmhiWVGeTZjOQrbChcdjoXyzUHm",
		@"JywauznYzGMdZ": @"cvjeOeLjMSLKCihLLJYsqZeoQewqFniWOmenhIrpYHRMItOMBxoBjkYPesJahBjKBFDYhxYidCOFehyvkrOVCGDgTDYRlBGwgejfYKFTlnM",
		@"bhpIyYzZwYkSdxZlLH": @"DaSaiOnmYlhvXhnRrojwvCydUtgxxeiXJLMhjrZmbgxRbzHbjTcnPHgytufFUByLLxEwoIaMaCSAUjwZAhHQIkOQMkTuuBKfFdUuRhwUbYFAkkVjRgSHquBZFuXiEyCqyuUeIE",
		@"rQLnyAAcXmxCdewD": @"EHpIEjUpdLWmLQYxrEgSSYCZMBDrgLgSZtiSnkKiQnNgfHGZtHcnKHjMNEbQvEZMbJxCbQwhDWzgZkSvLEFpAciBPHbVfVVziHZxNcuaWGWIW",
		@"vFGdXSJXpnpQwZBOKRk": @"ttsDvdlJksyTqSmqBDPRNXmwkZBZRsEwmEyioyQuOsETWEfuCtCLJYnYPXtcYbBvnSmbgCYpnWMQpFRrvwuCXeeaLbVhYRBDWrZwXuJbqIdGs",
		@"kSAWSuFaxXO": @"nOkNbfQjvhySyZhQFcjkZQWTRPyEfHzXGJYcGebDerAwyWglGHIoWPXLRKzSHCTJzjqpeqcSmdqiURUtVYwqRwpxtQibtdNBZcJSCNmNSJeXWKnCSdDUTfOvISsRKbdoaVRGw",
		@"wZQsNVkxKzG": @"xfqaFVaDabKpCSaMJOoqtTRVcsDqvFjFocdYAtlafoVlkPFOZzLpGOxLsCPtmfHICqIZVlpdmGNTlZyCWHEBKWulxoRTMuPMkSBXtMXImY",
		@"QqanjdDkQNrre": @"RpXynRGeHAjKzLjjvBlSgIpdhYfpdsRjwxzCoGPTlMcSfCvKpJPaTQBvCOmgYjFUdOdlQJDrXueTfFRNSNygOOvLsXEWvKJKvoWRbCNVetNVauBFWQEDmGfNVqdcXCtX",
		@"khtnSRBCzswUJ": @"LLphkQZEWOnJDAnKqPkTNjgyJtNvKMIqEGMxaqFhoCGnbGtJHLhEZnMNeYtlBnhnZnAaiwQaaNJYJDrFnXPscrbmUOlsbzOCljSMZUswcHyAdgxFGJuvDPGaBmHPiamEfyNqkZu",
		@"PJHDxcIstosgUAs": @"BEDmHYUzYvOYdoWRruFjlaFAdIeOjcNVxFQDrhKdpcRbdEyVdVMStrJjRWdOZnYVBSkRZDbkUewrBLMafcXDIupDMMFIvcwamCLNmMTuv",
		@"dLRiFJzkzL": @"aLvXlYXtkOygxRhtPNkJpuChwGyrmyySAgkIhKMwVXlYxJxVWrOXcZmDwDwlsBZOxwxpYSlDkWWssOLVefFXCBKTSgankpmxpeYrjiDKfZKsPNwBY",
		@"MqWpEBthZRcGbJZGH": @"pdCLvsFSGdbiMQjizRMzvvJKOIflIFiFTsyiiupnRSLujVecOOaYrtknHkCvSSTvbgfnlhMtBWycaYlFCPfjUlFBnUxMmQnPuuqFgYQcgVtJKhJjAUNbctjQsrAkjBaQjYEAvyJuEIgdg",
		@"yVUxvwxVdV": @"wteyruvtIvDUkCFYJxcqktzNAITGPAjJjtMlZdMOvivjCxhXEasXmBDGIiVvxNciFpNlyZAcJmGacQmcQdxZaeLnAjkrcRKuXZcxeVcILmQDXxpWzxlDGlPGhsqibZowXO",
		@"TKSVCwygxyvdWsN": @"moKrvRapsbxdkYTkcIgzFPbcxxJHEbMOdtkZLalWxlKEpuXlVYxjRqzXEHQnssAMyqPbTttGABtUirJBneppFlOTHIGKmGbqpUCvgOdiGF",
		@"wehGryiTbiI": @"xjfmTAUagJEYefkhiaIVLmajhaXidtOIrmHVEkPEzovdEPKcsFoUfLbqiDcBpsWrPqjPlBSIMkgSbMdZdyMPzyPlYxNzmPADgdgoYeoTwJmEiLYM",
		@"lEpUEiaiovyGygHhvRW": @"SppDLaPahOaXgAyCFWNCfolqvsZOsIEnwJxEVNhutXDaFmgtwXNrUsMqiRzMPhqtOGBSZcnPdfvenEyJNiaMdYcWEUqRaDtBJxlyPAfIXzqWTmWunAMoTnio",
	};
	return ZrOkaXzpKvHthNcKK;
}

+ (nonnull NSDictionary *)whWPczFzAycEJUpI :(nonnull NSData *)AtTkpcSUDuhf :(nonnull NSData *)eLAyNDpxvX {
	NSDictionary *PzQkxHGtcFK = @{
		@"BrDhGoFTniGLl": @"uuPJGGenJPAhpBkdUxPtYpnUqEnIHXeWnmYJsjAxayxcbVBEUXUNjVcHybOdRbcvDujZyohUouRAysaEYXzKGiaVkVJFqtLujIIRGmeekokWkDLLiScaMWqhONqHaoFbZOR",
		@"MeqDGkmXrhuAg": @"OJxTVkqLcpjVWIGlSvpBwKwIYdhMGfotXBYJKFxWnIPGFfzIRFGvKhOKqQRGpzakBwSThPZgXIJGmhoYKeqbNVdtBFgZwRuJhWOJVxloDYXAGdAaEMYGTZAxVXlwCJBPEmU",
		@"KYArdCpVKvZQyPyLr": @"gXvgtfofgRbGbHUVpXDrxCGpmyFrudjWWPrUamoNwlNazXTMUbDbguxOlQDjVgRGvcDDotLHfZiHSZIkxXoNzlFGDkDGxNUprgSbEIIqyfJhPJSRGfWCSIDVABkoeokrRfvyhWc",
		@"gUBKvPyIAqGwsEcuo": @"MoCaNhrjvYvqmabWOzLQYedOCFzwUCuZCsOFeTOMkiGcUBgJfHPwZpwwJFXjrspOAvAkpcNgvBlbywNsSpFXhBJpmMGXvejroHiVbmGzhwNzIVLtDgeeCExCpTuZLooUXyvfApoYUVSsJLCY",
		@"XXZzwkTgkxJ": @"QpQAiFLMGVhAYYRzTfuVdIapJpFZBnevBhzgAbwonyydAPezbSVhxXJOIURHxJpgMfIymwYYhpgBPKtSoxhnnwoJRRHuxPgSPtoupMtoJRhiiYqfgLIXpnnJoVbYYPhksEHIzJsahlWnA",
		@"FMGLqNSUgVzM": @"LBBKSreksOiWBjAyMZhMdiTyEiFrXYVlDpGJDZYcGEiDUwMsfxaiSaFQDICokkrirGiwxHEPfxOWpQGWBrItXPcMdzNgepcAUecnckscwJHTwHzLqvlQeBvAbmVZ",
		@"HEbnNxZwWqkSDjum": @"easuPXZmGvpkktldxWYZblBpePkgVRNEoMdzJsaGiWUYJzUkHtRCXtmtdUcuNLWtTyqNMFRGDRUMbrfqjtQZuPgYXxBtVkOoSvDCfIXZBnbrDxUIRrgJDEThgMHO",
		@"mJubmKISEOXR": @"KNoVvIlOkvEwZXEygJxCPqwFeByFsSnktOUOMPzyKkBUlsAYJieJgjeJDGUWJhWRpPNYPDMtGheMjYEiehqBNUJLVjzeoPbFCRhmLozAuLtqJoHLJiAbrgfJCxhbJXoQKJErwAEwHBDSUGltW",
		@"suJgbWqFlVh": @"KIktZVulIfRNjLjqzawMbXEBfwPTkPUqvDJuTpJlUCNpFeplDlGLcNYhxfdCWjhYLPOYTnkSPaHAqipRQoCPcBhzdbgeeuveumRwshCUWlqeCzxhl",
		@"rqBBEhbIvPPewQUnIVz": @"DMMqmmohWCrowCDdjPNRcGFnLOBYtaspUBSZbBdKIlETxxFjOFDXlCYaouNbkOOfQUmmrQhYcOIpakQhbiCUKvyYkBXGdqWpqyoqfxPvqmYaGUDdCnDPKL",
		@"hNgbScLYpasGXJqdE": @"uhYLSCRiAjBaGuElfRUVvntJUUPuSPwYyrlMItpZXwDzxlgVHLyRpRGCFzgCDMkJUUfzWTbiizkNVmlinDMQGOiuQjsuSKIrrUUmpmAjQTlujJZylbfopJNeeafBVXbxqjFBXb",
		@"bpneAZcSYnWfPgFrUuk": @"hJjnPsrPGvhBDXEcCZUDPnpPLqDCnVWbUsYaZzpDNPZdRIuztshFhEhPmnnzCwUVPUuMuxqBvWXBoVbwqvRtdCCHxxfDdpoYAQWFbRwQHTOXkKEqUuzdqXIqGnTSkc",
		@"IfOEudhQgq": @"ZDuZGuEFvFfLsnvjaUSmlEdGPDyxgyjungFklHEcKcTMawsKFRemsRVIksGaTLioeoDvAgrJILcZStMuNZfafmCMRlGLvSJwhWoiLedzSpCQRVqRhIVYaPIwUIuzxqdy",
		@"kLNMUFveriMKZmGFSuW": @"QWmbKZkGEnvluJOaLOVsEvsIoHQTsOlZIlarZxrWPlmhRpRsjsQrzLVwyUxaQeXKoONteZrewHilVXfbjvfCxuPRHEvKCfhoIBrAGJyywjojZ",
	};
	return PzQkxHGtcFK;
}

+ (nonnull UIImage *)wtkLzodNlztyabi :(nonnull UIImage *)CKrwBpTdQn :(nonnull NSArray *)FKjUtBEVnde {
	NSData *cTPmhbTdTau = [@"yBYwHqnYYaLYgPTYHrSYtYmjiOQAMlriEhSvRXWjsBxClGlDXziEyNNSYkcTSrQFNtqnsGbuwVrHfVuYuCEcRLRZggkVIHImwdlutIDjyLxTWRZfhTeCBmGyAIOmxy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HuGLdgCfaDTQLHcPchr = [UIImage imageWithData:cTPmhbTdTau];
	HuGLdgCfaDTQLHcPchr = [UIImage imageNamed:@"bFMcdgKZjEnPMKBZPNpKcutmJGzLcpShVQGXfrQpupWZURFWVkHQBOyjIBixjrbPlvsHrnsgmgTsdbwZTrSFIMStYdBDntxxUlgeG"];
	return HuGLdgCfaDTQLHcPchr;
}

+ (nonnull UIImage *)VBpPnNPaBVrRaIoBak :(nonnull UIImage *)SAehnGNMUdFWESZptSG :(nonnull NSData *)BFwCxgVarSMPXxjs :(nonnull NSString *)vRXGaLFyFmEIaJoTPn {
	NSData *fYQSlxUwOPDNMZpqmCN = [@"OSdmTCKduwMJHxcdBGxmMBrGAhkqSzetIuulRIHSRoIGpSvkjIXByeenSPhIeXHAJdtfmhcUyXXIumhiBPpOIvwuNGjRKFOhZVLWmBDtKQAkxrADVFmqfklfPxGYBBmRFssTxpVyTSf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NEoWYPVslKPMYnqKq = [UIImage imageWithData:fYQSlxUwOPDNMZpqmCN];
	NEoWYPVslKPMYnqKq = [UIImage imageNamed:@"TvXScJGhzaWLPFxGqjHduqAHfmVXoxkdVxOIqnhmVAhagioXBLxJTCTTBXaleCRhNVggjjDYnugCUwuPPUiBqJJYMAFdevsIWJLyy"];
	return NEoWYPVslKPMYnqKq;
}

+ (nonnull NSData *)icwozXlVNrhJ :(nonnull NSString *)WlMoaTTUdlvTvRuUN :(nonnull NSData *)HtQZxgGKFGFPiHE {
	NSData *UCopECPQtqQ = [@"SXgaWKRAaPgiNuhaWgIJTYtYjYCCrImWooqZHjRRDuSOoggubOtEXAStDvtwWUagxuJVPsdhXWxhvhXzsvboRkuXCgmqUUenGGxHkwJCGeyhZWCBOuqXPQDOmqSPSqEk" dataUsingEncoding:NSUTF8StringEncoding];
	return UCopECPQtqQ;
}

+ (nonnull NSArray *)IiZxerOcyoWcLmrraam :(nonnull NSArray *)engztnKVtfnJqaKnB {
	NSArray *ohYYjHWDhGdYtcjgZW = @[
		@"YiRNAitRbhpPpTfQRRbCswJgSGOaxgyDsvFUZPtFmmnBrKJJkcFaKhENckqrmcQOySXHjabOGzCElWnhlWQwtfWpGFKUrJIvvwDaLiBFxFtLcovtqFaWShpeBJhf",
		@"aJoAByoOMgONgsfZhSikHljarAdJPSEMwhfyHfMIevMrBYbnVUogzIWNJGwPlljXqRTrflRItIdOSrLtTJNDhTcPBzqfjkyYyZtelG",
		@"AwUTMmaaejNaLTizMnJBBdUYXBOwTNGEdfwkrEVttMSOQLxrFxeXgyiHQvrVkTsBwoXnZAwYvNibYOYNxdUWygkFYwCUnKClyOKBbogJZQKbbEArFIkGEvKpWpWYKSQSyOwOYrpmYJxb",
		@"dFdBFNalqAjsUpyuXyxoZuyRpJSJfTjfOXfRiPcihAsKvIHCdOpgHCzCaIxHxjsZEYuGodfGftoZdRLZRCltBuUjhkAkBMnkpBMyTzCOOoARNRWrLOaggbPfhYjoJfmbbtQ",
		@"FQHVedAfaTQdDnwAdmcxPHLrOjeFKRDNBmDbpFNYWxjkEFApdVdQhawGMKRnSyXiUqJZQlwAvSgMirQcsnLvSwxLfaruYgvvTQMxceJtyw",
		@"bJDyVCNTxMdTYwNioeaeKFyvosVoNcgSvowgKwMTOTNggeBWTzOQhkYDqNRWTcQfSerWBtotEjQzjuXDxjXXYRCvYjZjhzZkziCuKr",
		@"gXpdGogkrmsotHwANcxLOPLxyofziOxrGWAOmAVRDaSKTOHXhUDdZPEnUkLKZtsnetRLyZiiuWQlyhQMxunzAiglcZqIlhikmoXrAtJQqTnkB",
		@"saDZKUClxRZGFsESnVMxmDyUoNWdWYuYapOqmqHMHrbYLlHVzpKOQERfawJEEMmPDMubfkBWMXIiYVPuoVKTFHfLveuzEXuKphIiFMTCNkYAtaKZAZBOSnjZZXOViTprHBGjGLjvqiPPUwcHvJ",
		@"ZLtZeaWanzYxClXYwKNkSBqXximejUJgshVNBkoPkGkhRYuyeAnMDhvVdHnUDbBGDcbkEOwAbbaxQduuSLLnRmTKEZpYIMpGKGkcdzPDgJGJBktTCliDtmixFQVkMlMVaONIf",
		@"XnkdVJFoXgOyfUyGsoDIJTqAmptKaowleiRiAHxpMIYCTPfIStlPmOuzWPyxAdFSXTKeBvXlqBGLFBpiShdxjOaSFKjllzZQgdggOzNxvixsOVlzgwajdqdevEhNLskRzVPjljOQWuPgv",
		@"eFtXEGgaNoqQIqLOZHfcjUixSSRpgwOqpnJBnBvocvxDoaGCWkFhQqFFXpgZCoDqERyAYGFzPkWkUdbeVpilXeIsRbldKlEisKFiMeDdmQlvhyrsHEkdJZsRrSOFycIOGlM",
		@"DdIjqenEpUwnVVHXtHCGIqLDPDRrwsSVrpJTNhQRVaxLkAgZbhmQitlIFCBXUFhpKZGSDWnOvJxyKclEOWtDrhdHRvmfrkaOyUpTbuErMrlAwY",
		@"vnlxmRXeNUDgWMsDKppBFiSKNCvewluMEaYQxxddZBjIvYfWsZXkVJtNfkhnNkTGkcHuItCOMaKRomiiRnEodnXddRAVskcqDpqZrucYWPjx",
		@"kovQSVQoylsybhuhFoSWWbQuSiNigSSbRhZHClmKFSvcgpNKqRJWBjZVxMpZrgyCUrEmvCzJcstZZMETuweuKqHSOSfxyMjaWXqluVtJLqnVQwOWernqaloDnCPsixBfZGCZEZHGjihqqwbC",
		@"BrfBSSkfZvfxVZtoJCVVybwqBbnwwNuRyrdjvvWGgpnwNzCxZYYCVeKJaEZnioziSBMwBfMQJVmAFMlYNnrrJAhoSTjmzBzEPyJqjbjwZQrQGzBKbroN",
		@"CmwZPcFAaAhZqwQNOHtfIwoElzJpauqVFzJJKiHvKmrZhkMdtcpnvERRDDYncjuknZdwqHWiNJfJAQqNOEUKqNvEwUbzoaOpOUEKeJlVPNalkVVOirggcswVQxwDTCRIJSawmZGWIrXdhk",
	];
	return ohYYjHWDhGdYtcjgZW;
}

+ (nonnull NSArray *)sMDPOLdJbAkoDhpbD :(nonnull NSData *)jZHNnBAwXRjwcOd :(nonnull NSArray *)qanTTxFnlmowxSQ :(nonnull NSArray *)KXEahTEuzyrSGlaWkP {
	NSArray *ItBlnLLYjsm = @[
		@"OuVhpNVliYOfdyvzWFDqMIjMWvsWaAbjHREGsDfLOEjdaJEmBEZBozEOLjfUOZQEeHcFZBEeCAdLfWLUhgokuAolOljYaslFuxdDRMYLLIITFUSdKfkfrnTbvDnDn",
		@"dijndCTcPTtVwrZxduYplZQleieLwxIdLGObggtUFnLzstvJBkAQpABSuVRwJbVyerizzynVFtKGzpRjiXXDdauXCAPogSXhBItfgshzzVRyuTJXJgFmLBqwaX",
		@"BzhyAjAXIRGtAPSfNMvIWSEtvYmRKcfvZDwbUUcumUiQePYMwsWGzdIkakLsPLFzYBsCQNnxPRgKkzqNDjUQstFpZzkTNTKOEShvsOLAziwHsurx",
		@"TQEzdhFJnYrrvxQuctIDhPfUkXfDBxYBPeXfvrvOipNZhrLNOIHhPcxOvIhzqnGLJMvkEFbkxhYZGUtxkXzEhtbzBKHwfAOtzPEonBFVzohMqrcYUbILr",
		@"qdQMExRVrIAKQDBBmqRDWFsCZthUSAQjzlajJhAjpIrufRTMxSZFaLSNmDeLmSVjCbbjSltbIYBuJZxbWZVWnlECvcWhVdabWYkOTHxlVRIrsXPpaazcETl",
		@"sMmuovVaZefSRIPVnEDiucKKVhFxvSfFvGYYaaxalUIhnKpkCushXkGjblEPuxOAeWklYfQEJOnQlBUkVNWShBzxoEWeUYrMyqUJilNXtiQCJuMlFcrRwtgBIVJWalITVLWdhCQhJxvEwRTTfBW",
		@"kXnpbViKjdEZwTKlgFjLJZDkEnxvxbePKcGXDkIsMwVOHyHKSplKbRZatnBJkXAzlIArNeccofSZsuEurKovxljbtsWKMVvKdAzGxJ",
		@"bYxEEKbBfPqwoklRsQegWJuPstRtfUWDeiUckkKulGVhKXWLNUSLOdbiEgXUFFOBVFagVTugpIwpJYKJhrgqNPxGcqDyJXvJYInsHmWwJElhHrVxXCJzCBlraHLEQgrFKCZsPTquOMXkdbvy",
		@"ePXqdzTquVvRYlPsNuWmuwfMWdEQCaBlXYyMOsMzIPTGmmqRngYCGoHSwviqKDzbMiCVurELKhPWYQDRlJubBxJEpfJqSHciLQlbtraySydKg",
		@"qGhMjoAJlNilBLYgBFnliVyjrcljTObOqNqHIhXdIxYJLWjBaBPVRdNDrecCAxXBRdRrBUrdWeoaVagDxHrIMWShQRwVxFfLCGlyuoygkTZvTLxRtCNyIdvOhlo",
		@"qQpXvJFpGDEJEjhUHOgAMRnXugBRXwOWtQhmquAesqUkqciswyNGeXaHZDsGMuDzzIqbQYlwtMjbcahtcvMPoBIvTLnjBzjvMHWfjQkAgOmbHUxenuSUbUDVVdCYDjnUmPvJ",
		@"xbzXKtgsFeWGDtvHESeOsxTiUdKEhLeCAtoLImIbLYvzmxckIbNGPjfVQknHFeEZhqeJfLsIJjUnApBFISSIctUeQOYoacskdbgyqdaQxqzYrZOtgkuZWKC",
	];
	return ItBlnLLYjsm;
}

+ (nonnull NSDictionary *)ZhpQlaReLMukE :(nonnull NSArray *)aqwhhpTbjwX :(nonnull NSArray *)WmUsrmgjvLD :(nonnull NSDictionary *)ZtLdLHdcZqTg {
	NSDictionary *WuDdUKwdxpFQHGZHuy = @{
		@"taflIpsBzqVc": @"GgQlECEgQoxRjLZyDbsnRxuoTLZvkumPVwAPYhgmOyUeShcuzkTPxxVCbljpfqDWmdFDwSmSmbRoJvQbrpQOCpzFxvQqZLhCkxRqntfvqWUkJF",
		@"oNLYiPxfrliGYTrvQy": @"NnQrOHYXenQYkQkgahOSMtdvOSvSGMdcEyodeGmNTMJSLKwfwOWZvMEshJEwMXpBhfOicHVDpXGlRGdTWPdjdNqDJFmWnZqBWKUlRcyDSZxSKrfQGAvRjZlAMFAebIBmuLBfiVoHQvllWHLoVCJeu",
		@"eANrdpFuSivUUbrgHp": @"jIMxaTgwGSsjiyuAfvklpOCkweXNBsRuriAMuSKjTsmOoCXzYzCjOAkRiwaIvSUKjpXwajofJzvwjoisWMuXChWoEIfOyvlFoSXaISXRNwSm",
		@"dTkKeBRMsawHZrPma": @"uNjrujsfelWXbyvUDlyysERQbyNhrANZujxoyWVZMiWaJlPmbHdfgYUoUKXwGjUGKOHLkenVSSTxHAwowbHBNsJtdKixQlAuxOSgvhnCYwjPQUKyvmXlvVYXbhirnjRPeStZJLJZAurGAOuOjKB",
		@"UxqsCnZGqEb": @"AhcEldDfZiThvsbwgmMcuaLqSBmCPrDRvwyYJgRzfGlNfeTgowaFvMkWqIiOPfPvzeDxWgtYMZmDYSjtHEGXtUXfQdoNCXYLNEhXIHPiaLzNJVKRuWtpmqYJ",
		@"opKPZattgY": @"sBFQdzNQZeYLoKFTdiypRyWBCIxIXcFFXKPDfiKhCHPKrIfXhvWobqnWxZQxcFFjHwLDKBqOJRPOdNmlqMVuKxqspVfBAkqSAncszVmSGtbnoyAdfGaGffOqbdWqkLLHQwWbPcuHx",
		@"OPgLmmiSbObC": @"AzIbXbKbAPUyWmEsfIUIdQApYIjepILGbsEhkusHWCwoGFrQiNjXgpmsrHslmvtXWKWFEbKbhjYAdnQlLPYokdkBcuDNTaLWRveHNuYhVlWgQPCiZFxoSmLeWyxTqZTDOUTyZlyvMnQ",
		@"oZGxxNiOMFzswayHhvK": @"CZCgUvLyRNLsOfQhhEWPptushnitdmZELMmQAZJfNPXEPEdQnejmhSrkRUMxDnRrVCtwWTUXeWnLcbFMbNqUkEsFVAMnnYemMTORBzFesDJMGFnwtTy",
		@"ZLjwQIJlmXzekgJyO": @"zPprxKrnNEnlSHyqRfkQiPhNxGQQazjvSphrKaqbpPQFlaFsGhnfRtYADXSfRkDtczTagvmafXeBZaXUlMAklgNxsjUoiiSQpnkFSpwLfxNnoxVjGpahkSeFh",
		@"KSEDbqnLslWWvxJ": @"PHCNqSkAkWdbXBPMaVgbHwEHKQyJvDAzaUCkFeyaXFATdLdcElLieFqeEZaRwwLqtMsxZVxJolHcLshjkECffeQgujEiVkYlJBIBIEF",
		@"UzXfOQWLkRuel": @"FXYTDsTYIipLPBMxvPvFbuSfGjHKhwlQHjruyHgSKGsKYeXUKkcLsrLmSGRTogasengyTZvrTWVAOYrVlxRKNnjnQFkPsLOyRNSpnbkHFkLgSVKnZJMoSvwGPJSGlVpiKGBZmPVntf",
		@"dgrLmaboECDWBakTiTC": @"GhHKnZzRlMEZRnKZgjLZanEoWjhjQlTmGITqxYuehUrZasgwpSBGLPjgfltqXynNxhSkKpQBRGvothOKDSTVaDLnfNAtNhJSmpjJWeiMeLKwWcgUMhyrkvmSlBOMNlkfaxetVXrQehNaLIIdgYlb",
		@"NkZYEGEZmjj": @"KIVHbmoFzIlbDUJbiRUXvrUyseKVddElkTkVtkpqHtLFuhgcsKPtRSkKbSnuSOPldocVWVwoYiDyRIPRzSvBwsLsMDxXatmDMwmiqMpbvLkGdoIBDbYNOwyWPvcCBFPCdzX",
		@"sSIeCUoPCvpzbEB": @"wboYDQzKWazgsYKbxeJCsVVKgFNOWehOsFielPtuiRUPfnMFgkmpUGwjMHBTSzCGBDpIbQsMsQjtscWNkFfFizVSNQNBvNvduPgrLbVKVFxdYCVLyikHhxjTviJIiTyMQZaKFSjPexq",
		@"NMjuFzuvVDpC": @"mdTSiyIAeNrcgXuenJMRkwzrRiCrngNiCRKeuKoKtFJVtnmymSDXhEpjuJdwiMrMRJezETlGDYuVvyMYtSaYpAVnrpXwIccmInfTjnbnPMvDdNzcoznUARLwbrQlZDCpDkZHlqYVToxQsKkfu",
		@"VpSxSbvoBlsVSVo": @"vCGUmEmEgKeKyhFWQgnxqmAsrqTFoCLsReNGcKnBMubCVFRbhAuyWQiwGlvmgagBtPhNolbAPPqsKgWNUSSEowwmWiAaCGWRZCOJnxUlfMSuddCXUAapBpf",
		@"UdIKdEjtbc": @"zaipDuiypVsdrDTzdjJGGyclhSJSHvmXhLUTSlIOAVIXKewIyKWXsnpSoCDOevPsTErdTdxEFhOwVniyOSdxdKJXSXpQcPCFZmEyiBIyDNNoKSVPiA",
		@"fEWfDXzETKfq": @"sqCHrXYtTlnyqAFbFiChQmNZieEaOGsGjeYfqtUHxrtKsdkeDZLxckExRDYhZgKZvDmhxXvApymVnNjcqtSmtlsJeIHkAtRIPDpoupAAj",
		@"xkTVUZbzmQqIVbiuKIg": @"mznaBpOQratUEWOehXozsxWgdVFFkTwnszxGDqMLgovbiVTzHunUqTcCHFfOhokdnzjaVVwSKMCKtlWwcSFHIIbNHydEpUvWrTOmNDdNjHStnpXRknsesnwsxPtyeDUoTrNa",
	};
	return WuDdUKwdxpFQHGZHuy;
}

- (nonnull UIImage *)qOkSSyxNqrP :(nonnull NSArray *)pGVfKmloFaYCrU :(nonnull NSData *)TDpJoVYKmQqZYAcAxCZ :(nonnull UIImage *)HjRXKFADKAPKN {
	NSData *gmNQHXZBPJSDTH = [@"DQNEaJokTqdSAfJDgjCogFPAoQMFKxRnGlClrgliMhTjuThiMCkXItfVUeFpLABqKpiHIxzzZADnGEuVvPMpUvKEuMaqWrrovDfFRTrFHQFNtPjxyrD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FegnifEBVSBnTmmerz = [UIImage imageWithData:gmNQHXZBPJSDTH];
	FegnifEBVSBnTmmerz = [UIImage imageNamed:@"bIuFbLNtqjIyIHMhITgdPxrTnhAgRuIDAZTXBztjzNOaMNiYSWTgLXKCeJQohKBbrVBwPybVfzQezFWdsdBfNiXZviaViUGFdezy"];
	return FegnifEBVSBnTmmerz;
}

+ (nonnull NSData *)oLFdfqpKpAaXZjMJl :(nonnull UIImage *)WKxUhWFGwqjbZxnknw {
	NSData *uLinLNTiRhASp = [@"cunPeuWdmgMoovrTakToIFUoIRyOzmvhLiWSPBDWCNKQXByZbNuVNEitdUzafUlHyNdYiXujOPUvXAPYcWqmEhzSQNaJNMAaCgXtDIVXyKcwfFwzYiomhIJzRCsHKiXJVCZ" dataUsingEncoding:NSUTF8StringEncoding];
	return uLinLNTiRhASp;
}

+ (nonnull NSData *)xEmsJgHxmDin :(nonnull NSDictionary *)GsnnQBBuSBAjm :(nonnull UIImage *)eOWYoNCmSjrJrqF :(nonnull NSDictionary *)NqFHLvjJejVTMngLWe {
	NSData *WjRvFfqCfsr = [@"IMKcoPvMXzaKhZaAfhoeUvKvDCdChZzNvHxLZzOeZxpbUWdGdapVTzkOjewmQYBOkczGnjExeEfWHAKHOtCgDEtuPcSTUqFkyrmySGswzNnNPpdFxjxDVbQKWEZizQBQxPqibLdccemWT" dataUsingEncoding:NSUTF8StringEncoding];
	return WjRvFfqCfsr;
}

- (nonnull NSString *)sSTgSILqSm :(nonnull NSData *)HqzHnWJJQgUJAHSs :(nonnull NSData *)puVpZmANTJmDcbbl :(nonnull NSDictionary *)MhILbWgaZbkeiCiz {
	NSString *XTMfwqNXak = @"hTYQPifStaqvVsMOCSXiRRbmbNSNhyPxEpQmHSnjFJLtnpWMkUAvoBBjzCYBZIGrWEQjlUIISggPsjIFeTljrFUfziXiGMfRluwearQZBscMbHxlbLsjVIcWgTSvBwHCMaWeVAcLAwt";
	return XTMfwqNXak;
}

+ (nonnull NSString *)uZtozGuBjpd :(nonnull NSArray *)klpepCKSGSSHsv {
	NSString *iMguGgNvwfECIwF = @"OuibLCKtGUXKPlyylqJpnVegpOTxoUeAotLcpFdOnKkwQlcXeZEEdAKdpBUfmsPoKmxMaMyCZpWkvOeifuOWYMfMoFZcuQgtFmizGftjIy";
	return iMguGgNvwfECIwF;
}

- (nonnull UIImage *)WSlywiUUyIfAE :(nonnull NSArray *)FTLDGmPofyuNlGlR :(nonnull NSArray *)kWilErNTHWWJQitk :(nonnull NSArray *)BqCHXOkzRQzVLRE {
	NSData *CWZDmZjPMQ = [@"cDdtmXXTarnOHHtUePFFBTScvTSQzKQfAqiZWrSOFWFwhGdDiApxzECyGMldtyoWRSxfPClHxqdReRamXbLpDAQKdcTySNboKxtNZyYD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UcBKXgyIvRd = [UIImage imageWithData:CWZDmZjPMQ];
	UcBKXgyIvRd = [UIImage imageNamed:@"GItPKuulaUTmHZfxSWrdSqMrbZzWnDGBerVGOwuZhrUhZQAzujESmRLzFkonfTiTVEKScBJUKsYHdktAeHQEUrVVbMhJBYwQqoPRstHlHaYylXXhmlbbEyLQeRJUIpg"];
	return UcBKXgyIvRd;
}

+ (nonnull NSData *)TqXGioXdWk :(nonnull NSData *)SUGsaAQheRaYOMyhMsJ :(nonnull NSData *)IavnbOqKAkUAwyOSnn :(nonnull NSString *)leFaoNIUGJta {
	NSData *bADmposrot = [@"QnSBArOoZGAuwIhrcwvHDkdeqMhdZtdSwCOlSLioUeCAesgkkdtFgvVKLwyCxVemYBMsecxWuYNzIxjPjuiAMtguUcCBuamfsWJexwWCnQvEjotEBSZmNlzrOcvfVEdJqGQAsPHswzmNw" dataUsingEncoding:NSUTF8StringEncoding];
	return bADmposrot;
}

+ (nonnull NSArray *)sYdrpRgxneDprPIVeUQ :(nonnull NSArray *)xFjqgAXssycTF :(nonnull UIImage *)MOVBGIpDXfDM :(nonnull UIImage *)zRHeZsUwWvcscowrTWJ {
	NSArray *RAqsURPzhEWiMLU = @[
		@"hBpgNNDLjCstBOmPLtFWWgTTmkuTtlYsqfpOJkPOrnnavZDvtfkoNahOxazksSvWcyzMKXltObOodlbFrAxOWBIADACOYuspVmjCQVqiJjzZFPopH",
		@"LcapQosvcYUWZKTjYQjWViPXNsScmeyLajAfkQXmdeuVEdTUgZfiYnmHDvwzyIgPnNgFDxviaQAyMwPdPjfhgjnieRYXJPhtpPRpG",
		@"UlsHMfZZxvnHLwBBEPLUOenQhEZlsYuagcIlMMpoLUMrezHgMbjduItWIFFspydGRvJJZrXXInCtESlGLijHaSKLtqygToDlpwlUtGynlSiwZhnVKDWTSbDUXisdMUtIvP",
		@"iyenAheehlcLrbbXFmDHuXdtjxZYtBWFmUNSuSVIMiaTAfkmTXYFKaLcxLbYDJpnrGAkcaJHxYrcKgYDgzoGzWtvpLYgjuMDxbXBDJNsGiNQACJjCNnjlUtKcALyxztNAxMbMWiHzKFPuWOubds",
		@"JEiUDgIwElYCOhVfKVfPutMambEksOjkZKpqecwpxjEzkJEaonXXyMCfxElxDTvTcUJFvKFkzPPYUyTFbQPitHauyKFhpspRjQWebPNrTgKcKAEFsHLdpAmMnsRMTeamFsxWnwz",
		@"RGLaLAaVXhXqGIHqNUrUemGzUNGlvAqbkltQDfCZQHNGspfqiblvNiPNdlItTJkmdjbKlIklShGtrZUBVTUcQOezwhPWjWfMcbrMg",
		@"DrWHlJsJBkBQIvFBPpcLtqjuJohJjqsIDMSqbmykxWGcuqTLpveowHmhPlNRVORWjPLsAwXUueqAeIlyAOnSHBChQudKzAiJJgHKZDMbINbfeHsvNydJFZpzQPnXKLJapQNu",
		@"ZRezJvjGGUDzqOtMTMnOnKivUvGRjCkLYqhajVbPIbLMayIqUuxromHGDZjYScbQXzpWSWRFyHGtnutFIKvOGtSnpVNQPXgmXIBefmxjxWiwHzHdKHTnWoOnTetZT",
		@"twTcPgsIsEXSZpIypgvZzAHdHkixXNVEDsJbHrDWQlEEakVtChduermSpGAniRaTHdSTSJnkMLoJkKmRgENKRIqOhqAszlbwdPfcrLqdcPrgEvXYrfQsDsLazpVeIwUaMqEbPEFIXF",
		@"jFCvEZpnLbGyYnUBdRDStifaXkQDWVNlMVGsWqQsTmOitsBYRDkWbeAPdYxTFInifcdHCsHBIkUPdDzcjOnzNvnVrfpPHnFcqJhtnpzHVgmyQA",
		@"GrCnSmMyiKUrfYsWRdORPcdxyKYcqsqBQuSROTYDiRDNqlwxuYkuVbdupdOLJJgZNqwrSuWHieoXVFPWmMcGmtHkZszNGaQMEwgsgOqyjyz",
		@"PADUPcwzONnLdtxglntWfSczxyczELhyKKeuqHPckCGncZSdmHndDvmCuZNHNLUeTaFyBZYLqhhBMuUibGJNKJxXDHlZSbRYRBcSUZdiKenuyjyhcoevWWnPlfoggeNAuoxxOqV",
		@"JWTyiplcxKayUpqGegcPhwGxvgKeAlSMCnQfNiHaFfryFWlCUmqjIkFtJBhzpTPMnwRFDKHGjRAYGGKfmwvngOQSqoRolDjhuKKFPugsSryDBGWWv",
		@"xTxmPprCyDDzHAbxhGFovfoEKduaLeeZrHDqetpqEPSuIogOhvmJtkQsAJgoSFyyRZXcfrogVFqFXsZgIIIAoGQNTniLoxLLhDWAIMrAkXysdpLSrExFhXHJUuowlrmwDhdKFcLQ",
		@"dpKgEGhJQCNpAqOBGmSGQQiZIoLAYuIxSVVlJvhwYiDmNOrSFVcygMmldoTzLRkHklRNhFrFgbeyyCzFbGxtshnIZsrBavnHWrrGHWwNgvGrTplxnBAoqeMEpOGvrFNaXLKoiuReTYM",
		@"vgVESBjxFUDvSCnVOIEluyyLSsSoNkqgMJiKOGadoFGzKlrXaCUPDuxjqXhaAWbFlgggYjroKWufrYbOGaYOXwDEXjLbjlUyqnAZVnZgAEdsylASmeBsrSKkxdBgWChF",
		@"bjTLvhsCQdFPhjyCffGxUmRwHebYBmOWORHXooUFwWeWwRUSZrVqMMGsXvMYZJdeaOTYMdFgPRsaczkeoNCUhWuxxAKUKngnpxHpAnFqBTMMlwDKwiMDBZouDPTTaoAuhBhofe",
		@"QbWJWIDUOVmgczkjcXPGVYgZNYGxgqexwJMyOeIkUMVJNnHSSWLhCQRGbBhTzhpfNLouzqaDKizvuMjTsHFcUqQRCgLKPechGxMULMlZnOZaokcSYLXFgZaOntPMUNyKmZRPRbzrMHXKx",
		@"tdLqlyyRHinLeGgjhgohYMcUOITOyyTOFoxCWarPEsVNyEdfdLeMmexqbrZTOoYimhQoHuqjVYTeMrKpgkxnsrtXPqjZZIGQpICzfVZtPVokNaETOnNaiSWQYhcoiXzQZsZstnvO",
	];
	return RAqsURPzhEWiMLU;
}

- (nonnull NSString *)kHdklBNTJdkHWFN :(nonnull NSString *)lewfHmrMCc {
	NSString *mopSwLvsZPGIkIWZwqi = @"XzgfTOsucNAyuxwdajkHhidvziAapudMXfKLxNyDSARfFsUbYGHencqZVDVUMQxCdLhUwSYZIkndKWGVAWzHgDUzppyzcKzhjESUlFM";
	return mopSwLvsZPGIkIWZwqi;
}

- (nonnull NSString *)OVyEAulhwfgQ :(nonnull NSString *)DoLKXgvlVFZtXl :(nonnull NSDictionary *)KnadVDeCflK {
	NSString *OxdYPdhGgNuBAHGmq = @"ETnWmRgBJSlQgYdpKnBYKBNvTdeEEOAsWGTsIrUrXlIgXipJJWIYKVOrqqrOrYtsInIqfJxEgCWPmznxrRdcrkNVcHSEnVeTsXlQeCRtvXJEVhYj";
	return OxdYPdhGgNuBAHGmq;
}

+ (nonnull NSArray *)cLgYgKjyGh :(nonnull NSString *)wSaXylIUAp :(nonnull NSData *)tXGfHiHUaaTqP {
	NSArray *fNWvNBpwSgHQ = @[
		@"iHqxoHmhzfSBqYayXkoNXjOBPXDMvuwxRHpUbTPMQDDcTHeZAXDTVzxKGTxruNOgECVqzTguhceARQOKKKBulZuVUAurrOWPrbJvmGnYWxexWaXWSRJPuOtXckHLvKSrJdeYTs",
		@"WzMHgPiEhZWiXARbZVDtfiIOjCZzUrUKTjrPZByrEBMfEHjoXzoaOMOrlushsBDmBAIbpraKoxYClzrQzhEvuEtXnZuzEFHToywmplrZAxsFiSxXPPUJTMCzJqpGu",
		@"zyGdXCxwFKZVSMtapdnomkjxJGbreWYegXYLFTasfMDBQTkiOPcRZxRKjKrBfKhunZlHTPYMmjsGSheEPpYEHubjxBFZtuqKUQqJakzWxUlHeLPSlIKFCFxyhuBlnJHdSsFlvGhvb",
		@"ahPRPbdkfAeqJNmDennjXrfSbZHESZblOFwCnnklnvyvMQTFkMIVpciPWTYCFmsQDRZluNWRuZKnjdBswMXAQZqoUxKdSPlXBYcMKoaAktlKJ",
		@"xWwSClXYYBMHmLCSpceLaZNNykMaYUSqgkdBWBKfLAFDwfrHcQMfuMIDNuMqITHyFHnAIGhsgnBfGoZPxyDoWuDqkqonXQQXNIuBrNhLbTUARUafpg",
		@"OxuVTxHpBQvKUebpiQOPFlsxssMPtljbwovJqmenbRNHVuRtBmPhjEVfgIwttwsezeGxRcObhUAHJEPVjnRRpRffEGPEJktRAtLTplZqLAZwhhBZahrNpkRo",
		@"lNfepTdCPdhDNZmPlowuzuHrPwzWjIcIrwXlGKAhetogZpLEiCUARunVpGRHPLFqnNWGcuFQlpkDfJDeWRrVuFafUEUoYfOCbImruixPUCePeuKLYZmrhPrS",
		@"ZvcegCAltbkjnplYsRqdjGbYBrglhGNfLJQshPmQjhhKMpxlcojZlGtDpgcMikVbCkLTZfFZhsyWRmhXbSFJziiStNPpltDhxZOiTvhBvmPHNOwIokIulqHrNbeqSkNKCUrau",
		@"IOfYxNWnOMjLxrLoOjVsSPHXhaBWxGPaoewoUjWDAwDqMowTcXBFSMaLYjLgWTDrtTswSZFYkulUFWZvwZmjACZqVTNVTTmBOKelzMNoTBhARuiEGgOFttoVxsGfVUOgIEuTVhzQsQCX",
		@"kWXCRLRiWNZttPCRkPzZOyrdPDaTtPcGGkFTgkKcWHlFGCmpnXxzTOilvjnnOJhjnmZPAJWdDwUqVWhqXEXcxKoKooQtVnFMZRBTOYpxBboogHKPmVSrHhOaEBHySLniXdaooIKYEbWeEXPXa",
		@"PzevqobOvwRMpPKlfRYQeviPZXEiMbPyxTdJzsLuMINKBJsRhzfaRgcScDjXFeGFJAmAbIUzjmRyQYzglXnIGfkmMxrvOoYUyDouutaNJMbKVcF",
		@"gmaVLoeyjbnczecVYYPeinVXNMefkyMtpeoGuDcxODUiSzdDdYsMTsZQFbGgYlNAKNanyRqdqcoTDULIofXFiOGVDGXResQoWoQbRXTJoYnM",
		@"dsvMpDdxKFceFXlpGTMdpcdIituormYocbqJfGWLhSVDwOVonrMyiOvOzjaCFjyQinHQAmWUVFZKAltvLjSDbnazMfFkvHfQbojAhPEoZHHyM",
		@"eRhmzaORRFSNibadKcjAtbiCDvAPFNeUIwhCDGtUFcExQqRTuRLYXSINGuZflEhQSxEmuwgXOZoOulPiKZBZaaTfOoFEntfSBWvDuTXYdCuPVCraWFplSAKZhfySYjYuOPGkGyA",
		@"bUkGFsFIbXIHWgOKOcqZDCPvqajJbMjWjFuwVYKmlTldoGVdmdwOlWitmWxsWvtzZYTQQYtDoEbipMPgUwcktDKpvdTbcOapUcGyscyUdCImZUCGxQxaGhBMEHevrgoDfwBzHhgH",
		@"XiDMloNDuNbOUIblViMdOYPwvQzlDgHOTtWGMWcXcAilTTBPCZRNWAIbtBvxboluglfWrmhsSilzjvhtHJlaSUUBQHXeRkZQGfmymrwvFuSYlpr",
	];
	return fNWvNBpwSgHQ;
}

+ (nonnull NSData *)vkvJFjisLmjZrQQJbW :(nonnull UIImage *)AzuMBmArgbUwiR {
	NSData *tXxopYfbyDBKBbyYb = [@"BvlkEAoekKHYmXWnQukFAxPfFYjsheYWjhLWOOwDPibMDTtnZAQKJAikzhbQaxVjAxZuyrBQAQQEZuNxJNaGyIXpbtVmlcvJJlVXBoydPYpkYGafxnIqmOwMzOa" dataUsingEncoding:NSUTF8StringEncoding];
	return tXxopYfbyDBKBbyYb;
}

- (nonnull NSDictionary *)XTSEKqFxHUPGoFpjVD :(nonnull NSString *)OwWrpIGqejlVFek {
	NSDictionary *RgDvCTTEIE = @{
		@"cZCgeZBYmxjWRl": @"XWBvnMDfydBwgGttXtwBUfuMajCfSsyxSqyrqPnrdbGuEtAzwCONRBknrwpiYuwMITzrpHEkHbMnLgErogQKpvgUKLTHVNkOqfpWwPneJHxLQQU",
		@"WbDGYmNESfLkkXISN": @"szqEppPHtySBSTfmPzAYossaCGhAahOeuhGSaDFzRzEPNEJtOWvgeqGjrxxcHfiBsctcPhrnfPNMAuboQipTzIDAAfRWcWyFflYpBvAjbdoTgAXMXodrnYuDfJUuLvNZyAseDkAzFIcsGeapNR",
		@"nsHTtpbYYGMFD": @"NOVMYtxQcsRdTjQxLQQwhTplrGUDhrchCPOfjVXisigXYBGiGgzmffLcBGvpkVbYbNCBOlrPeNaqkkMUMOyXzmSARlqYjXMiLrqJrGkWWbnMYGiBFWkbRmTAVFTuIazUioIDSJZj",
		@"PJwsIOtujBuH": @"lqcDoOEfVtHOjBejedCHdzvKZFksMkbvGXveluwSrnFuvlFWgGntJIArdPPZGxhIriffDQBektZGfMzXUBYZBmcqwkjcsvptTUtnhOOouHHPkLDfdByoNKsBgkgqkcDttk",
		@"wqcimUsaLqPE": @"fAHOqmOcBMZvpuAzanjaGbARPLLnlsfZihiQmbNAbsoGqRjQlGVNmcPlDpoEafbhjAkOcXSVuFsdgXusvhNpBZcdqQmqhOqCsiLdOntiiLmztjKgtP",
		@"pZgmDxxZzNYHFvsim": @"gVrjAPIhXixpdhWCacCQwMTdTkkBSNULItOpHCjBNccRgUniQcNWCzeWRooxTuRyqqOwAEEBTafdOPEQGWpALthZGTUQgVGukZAzbNwdslnZpFQYbWU",
		@"hrxZBMJZal": @"SpZbDpsGURKvZWQRFiaXQehoSHclwywncABkvtavLQfmhzMuzZTVEbNBzVDdXEBWYlRazlEYkQPHPfCNFUKBBekKBEfIJhydcKqVBHqnanLKDZGOhbc",
		@"bUfEMxRoObFjykm": @"QrOCLXLwYGZHHjTJHhlLKEHEijxhdkMEGNVcAjveILbHEnRKRhNxSZdqxWWHPehzpzmiSIGtmvbBlBoozZFweJTQHMiaoHYskqTezUyvDFA",
		@"jTKUXnZWIdK": @"LubADFuDxEEiQBbZiKznhYWXMLhqpeyMJNTeNMFByYZMgSSDGWIhjXqHdolswwSotaJpJpsTBjFaeJQoFemfxuDLoklKLYofpFneQJvpNFgPv",
		@"bVPiASIynqUJT": @"ngWCIzMOiJrvYbUnYwhQrgLVorfWJddyySfpEVKFYOKQwvfBegluHKWOaHDWGsboVGFIlVhsSNMKXwzwINRazUGUzdtrpkwBOWeVROHwtyMcBnQeJUYHCBAAOgzCpJmjEyDIdrEAKNvfNZjGZeXF",
		@"jtUGWvPlUBidiQqax": @"vdNiDeWpmZAGeRzxFTeFOCDwdyHvkAXyakQefXxcbZFPmHfFlYvpeeirpxtUnPwIeNEQUIiyRDIPwFAhIMQsxaHSBPPfANnYNcNKhfXpglKbOdRZNTBYVPxBlbPqfyazzViWNXjVX",
		@"ssUQqYDFISGnskkWKFx": @"UYIKnGHMovgKxXoBioKvvpltTTzMkQZGqLPKTEQmTIXrvSVlbmhipCxGFSsaniEfTBzOiLfCprmYlbLpAmrWPTBKwFsjKvjzvGzUUupUJHcaspqLvqtBPUYcnJeVhxIem",
		@"dvFdczJLHWigGLINCi": @"rQONXhLdCmgDQurxxcElUpUlifcfcEDHYBcSUNheIoAJfFWXssTCcGOPoMIdPExUSDRTQKYEwNYKvBoBqiMFSBCGJNBrREwekhoIwMTRmJewtFbwJYGJhXlyVSSGqQnjfKzNrVDsiDI",
		@"JmWuLYRaCMlNDRYBuC": @"stckaEodmaNdunTzZwEVkKQTkQtgMeVacslRKQrIfhcedTbtZCjbZyzwebBKrfFClvsaWbgrypkuzlGTfswXnICZerdUWWEBFBfppVSKgOgoVHQNsDGFJzYyMhU",
		@"IUvayiaawrFFCiuQeB": @"mxvWRwFUkQmPMdQvDisfamIbotVpVFYnsikrVJhvfpIfSTBYsZUGgzOCaWeWYWDTpzNHsCyFNQdHiplmcdBEtBmCgXkrtgbgHGxhFqpUfqVsenWVmydkYisHZJGGovNzuxUcJSqYxsMUWAFMI",
		@"ZIerMJxlagrPXA": @"HkSgEsqbKMLwwRcTjPRsbxCuoWbiLakRbpUqzhLdBmTXRHRZxBUiegkHRHiBgndwjnQNtyftYZyAlKOMPgyMMGKrpZTcKCgFBXjfDcxONixLoRVzsXXAQqqUKaqaeZYgSMRhlory",
	};
	return RgDvCTTEIE;
}

+ (instancetype)editMessageController
{
    return [[UIStoryboard storyboardWithName:@"MyCenter" bundle:nil] instantiateInitialViewController];
}

#pragma mark 完成点击
- (void) finishClick
{
    
    if (self.mobileTextFiel.text.length > 0 && self.mobileTextFiel.text.length != 11) {
        [MBProgressHUD showError:@"请输入正确的手机号"];
        return;
    }
    
    if (self.nameTextField.text.length < 2 || self.nameTextField.text.length > 32) {
        [MBProgressHUD showError:@"昵称长度:2-32位"];
    }
    
    [MBProgressHUD showMessage:@"发布中,请稍后..."];

    if (self.changeHeaderImage) {
        [self sendPhoto];
    }else
    {
        [self sendData];
    }
}

- (void) sendData
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"nickname"] = self.nameTextField.text;
    
    int sex = 0;
    if (self.manButton.selected) {
        sex = 1;
    }else if (self.womanButton.selected) {
        sex = 2;
    }else if (self.noSexButton.selected) {
        sex = 3;
    }
    
    dict[@"sex"] = @(sex);
    
    if (self.qqTextField.text.length > 0) {
        dict[@"qq"] = self.qqTextField.text;
    }else
    {
        dict[@"qq"] = @"";
    }
    
    dict[@"mobile"] = self.mobileTextFiel.text;
    
    if (self.codeTextField.text.length > 0) {
        dict[@"activecode"] = self.codeTextField.text;
    }
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,FixUserInfo,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dict success:^(id responseDic) {
        int rescode = [responseDic[@"rescode"] intValue];
        if (rescode == 10000) {
            [self.navigationController popToRootViewControllerAnimated:YES];
            [MBProgressHUD showSuccess:@"修改成功"];
        }else
        {
            [MBProgressHUD showError:responseDic[@"msg"]];
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showError:@"发送请求失败"];
    }];
}

#pragma mark 发送带有图片的
- (void) sendPhoto
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,Alterheadpic,[UserInfoTool getUserInfo].token];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"ext"] = @"jpg";
    dict[@"data"] = [UIImageJPEGRepresentation(self.headImgView.image, 1.0) base64EncodedStringWithOptions:0];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dict success:^(id responseDic) {
        int rescode = [responseDic[@"rescode"] intValue];
        if (rescode == 10000) {
            [self sendData];
        }else
        {
            [MBProgressHUD showError:responseDic[@"msg"]];
            
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showError:@"发送请求失败"];
    }];
    
}

#pragma mark textField文字发生变化
- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField.text.length > 11) {
        textField.text = [textField.text substringToIndex:11];
    }
    
    if (textField.text.length == 11) {
        self.codeView.hidden = NO;
        self.button.hidden = NO;
    }else
    {
        self.codeView.hidden = YES;
        self.button.hidden = YES;
    }
}

- (IBAction)codeButtonClick:(CountDownButton *)button {
    [self sendActiveCode:self.mobileTextFiel.text];
    [button startTime : 140];
}

- (void) sendActiveCode : (NSString *) data
{
    
    NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,URL_REG_ACTIVE_CODE];
    
    NSDictionary *dic=@{
                        @"mobile": data,
                        @"scene" : @1
                        };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        int rescode = [responseDic[@"rescode"] intValue];
        if (rescode == 10000) {
            [MBProgressHUD showSuccess:@"发送成功"];
        }else
        {
            [MBProgressHUD showError:responseDic[@"msg"]];
            
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showError:@"发送请求失败"];
    }];
}

#pragma mark 头像点击
- (void) headImgViewClick
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"去相册选择", nil];
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    if (buttonIndex == 0) { //照相机
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else if(buttonIndex == 1)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    self.changeHeaderImage = YES;
    UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
    self.headImgView.image = img;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
