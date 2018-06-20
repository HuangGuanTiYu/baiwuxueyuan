//
//  ApplyTeacherController.m
//  zhitongti
//
//  Created by edz on 2017/5/25.
//  Copyright © 2017年 caobohua. All rights reserved.
//

#import "ApplyTeacherController.h"
#import "ApplyTeacherCell.h"
#import "FriendModel.h"
#import "ApplyTeacherDescribeCell.h"
#import "UIView+Extension.h"
#import "ContentModeLeftButton.h"
#import "ELCAlbumPickerController.h"
#import "ELCImagePickerController.h"
#import "BUIView.h"
#import "UIImage+Utils.h"
#import "AFNetWW.h"
#import "LxGridViewFlowLayout.h"
#import "TZTestCell.h"
#import "TZImagePickerController.h"
#import <AVFoundation/AVFoundation.h>
#import "TZImageManager.h"
#import "UploadFileModel.h"
#import "MJExtension.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "TBCityIconFont.h"
#import "MainWebController.h"

#define kPhotoListBaseTag 232131

@interface ApplyTeacherController ()<UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate,ELCImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UIActionSheetDelegate,UIActionSheetDelegate,TZImagePickerControllerDelegate>

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSArray *placeholders;

@property(nonatomic,strong)UIView *listView;

@property(nonatomic,strong)UILabel *tipsLb;

@property(nonatomic,strong)NSMutableArray *attachs;

@property(nonatomic,strong)UIButton *addPhotoBtn;

@property(nonatomic,strong)NSMutableArray *photoListArr;

@property (nonatomic, assign) BOOL isAddPhoto;

@property (nonatomic, strong) UIView *footerview;

@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, strong) NSMutableArray *cellArray;

@property (nonatomic, assign) CGFloat itemWH;

@property (nonatomic, assign) CGFloat margin;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *selectedPhotos;

@property (nonatomic, strong) NSMutableArray *selectedAssets;

@property (nonatomic, assign) BOOL isSelectOriginalPhoto;

@property (nonatomic, strong) UIImagePickerController *imagePickerVc;

@property (nonatomic, strong) UIButton *rememberButton;

@end

@implementation ApplyTeacherController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"申请讲师";
    
    self.titles = @[@"课程",@"姓名",@"手机",@"微信",@"自我介绍"];
    
    self.attachs=[NSMutableArray array];
    _photoListArr=[NSMutableArray array];
    self.cellArray = [NSMutableArray array];

    NSString *name = @"请输入姓名";
    if (self.model.nickname.length > 0) {
        name = self.model.nickname;
    }
    self.placeholders = @[@"请输入课程名称",name,@"请输入手机号",@"请输入微信号",@"请输入自我介绍"];
    
    [self setUpUI];
}

- (void) setUpUI
{
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableview.backgroundColor = ViewBackColor;
    self.tableview.height = self.view.height - 64;
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    
    self.footerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 115)];
    
    //用户协议
    UIButton *rememberButton = [[UIButton alloc] initWithFrame:CGRectMake(15, mainSpacing, self.footerview.width, 20)];
    self.rememberButton = rememberButton;
    [rememberButton addTarget:self action:@selector(rememberButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    rememberButton.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    rememberButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [rememberButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e625", ys_28, AuxiliaryColor)] forState:UIControlStateNormal];
    [rememberButton setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e624", ys_28, MainColor)] forState:UIControlStateSelected];
    rememberButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    
    NSString *allString = @"同意《讲师服务协议》";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:allString];
    [string addAttribute:NSForegroundColorAttributeName value:MainColor range:[allString rangeOfString:@"《讲师服务协议》"]];
    [string addAttribute:NSForegroundColorAttributeName value:AuxiliaryColor range:[allString rangeOfString:@"同意"]];
    [rememberButton setAttributedTitle:string forState:UIControlStateNormal];
    [self.footerview addSubview:rememberButton];
    rememberButton.selected = YES;
    
    NSArray *strings = @[@"《讲师服务协议》"];
    
    [rememberButton.titleLabel yb_addAttributeTapActionWithStrings:strings tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        [self gotoAgreement];
    }];
    
    
    //申请按钮
    UIButton *applyButton = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(rememberButton.frame) + 20, self.footerview.width - 30, 40)];
    [applyButton addTarget:self action:@selector(applyButtonClick) forControlEvents:UIControlEventTouchUpInside];
    applyButton.backgroundColor = MainColor;
    [applyButton setTitle:@"申请讲师" forState:UIControlStateNormal];
    [applyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    applyButton.layer.cornerRadius = 5;
    applyButton.layer.masksToBounds = YES;
    applyButton.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [self.footerview addSubview:applyButton];
    
    self.tableview.tableFooterView = self.footerview;

}

#pragma mark 跳转到用户协议
- (void) gotoAgreement
{
    MainWebController *webVc = [[MainWebController alloc] init];
    webVc.url = [NSString stringWithFormat:@"%@%@",NetHeader,NewApply];
    webVc.webTitle = @"讲师服务协议";
    [self.navigationController pushViewController:webVc animated:YES];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != self.titles.count - 1) {
        static NSString *ID = @"ApplyTeacherCell";
        ApplyTeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[ApplyTeacherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        if (indexPath.row == 1 && self.model.nickname.length > 0) {
            cell.textField.enabled = NO;
        }else
        {
            cell.textField.enabled = YES;
        }
        
        if (indexPath.row == 2) {
            cell.textField.keyboardType = UIKeyboardTypePhonePad;
        }else
        {
            cell.textField.keyboardType = UIKeyboardTypeDefault;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.title = self.titles[indexPath.row];
        cell.placeholderString = self.placeholders[indexPath.row];
        [self.cellArray addObject:cell];
        return cell;
    }
    
    static NSString *ID = @"ApplyTeacherDescribeCell";
    ApplyTeacherDescribeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ApplyTeacherDescribeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.title = self.titles[indexPath.row];
    cell.placeholderString = self.placeholders[indexPath.row];
    [self.cellArray addObject:cell];
    return cell;
}


- (nonnull NSArray *)QqHJrRdTBGOK :(nonnull UIImage *)bmiNocoajNbJlxvJWz :(nonnull UIImage *)MVsnNsDnGmNbtP :(nonnull UIImage *)oOOWPslRgZcAlodN {
	NSArray *dakAqYrsbCPSLM = @[
		@"PbfLMHHqfNHrSBobAbbdQFoRpytassGAaruChXiQEZjUkRujxgEQczWQFsSdrUEPZrULCmJzblEBGDqPTUfFwEgcBreiFheFkZkZSDIanByBAXIhZBlBlRSZAlXx",
		@"xWzWvNrQxCcdqzKwDrKBDJttRdvzXturjawyuPkNlBQSqIFNTgBgDlyFBquuKLhlzyLSpsKNCbTxvEstJGBtxSrMRUxwMoltmOqtWHgseULkGRIleeIbJSJKbjsiBcJCluLTnALBtoBbNZqa",
		@"dUSoQzSWanUSJQfxziywkrEUTWzAUsnRTnwwEWywxedaoJWrViDjKpkmdDMQwTEmcTXLmvRSXJLJdPMsGmQOdElMsegYxgRLYKbrGRgeXflGydhkhvtFobaCzLxqmIXBcCIDuhPFTZRtqSdCIlEI",
		@"VschlBDcQMvUMtgKpsXaPTpJwSrnufwMfoaHpaWqVtnKsPiXhRxEZVMWawUZVFqWZWgZOvrbrhHCBXNLAvriefBwqImXfkJHchveySiTndl",
		@"UftTqiSnmXxFPJBLTsogSJBPTChWRjPQVPncffJuniigKRycqFNQegrKRnxmfLHotRAtMUbyyiNYxKXdABqLVyhwJjtqnlJLqtWIaKerwrXrnEMLSsufrTArysTmrUBxGIgpHOKOHa",
		@"VJDmGuovjaZvptXzMJpbmOtARlBEXHuUNDTUwIdtQShkgoZLEvsWryTkAFXXeXccpARdcdqfxUlnDojvfzWipnFcBQCItulXgpZHaOZZhfLzPhyBcHwcKHSnccenIPoyIDJBHYhXEgV",
		@"dQPkdbwLFnhPBDACnWEOWMNYBXcXDPjPvuGMGeOMQzSmLnrjTWRqjjJCiuSyAewWPpyWLLWffdshKRgBoniepqxENqWaQiONOWivPBaFSEgipXQTNbnDcnXbevjDTfvcYPhozSDfU",
		@"mpteXxdZQfxHIxGniFLErroYOkSeTNsNFtJjpmKOauKPBzeeNRFDpwbtMwXIsZkVZcYJONqnefNZaBqSmYXzdwKZqqgUejWAHxzzfIkHEzREwpYjkdwGDPEtCtIsJNZ",
		@"JuRNVdwTndlXZtJSKFbvIsEOxboFRYKGUAoXdsaYilMHdZwwdtUkuvWVqSUmbNqnpIwgzSWpKSJJDAfwHCeQCNNENYiGRfyCiccOxyaAvmpJkcamORRBQVfQhblrePmAoGKL",
		@"LjdmbAHyuLkLyiDjuiRBwFUVFhhBIdfBjIkKtqVSulEZVYZIetYtnZenfbgJCqGhPlWHwMEBhDdITHtHwKSEbUHoQFOGoyHnZwwoEKdfFpnTazluGumiiXCATxvdhrDjQX",
		@"WtJFZdoFugIkStdrlZhnYpQmZwWMEuzwvuQxABAEpomieavLMGpGYPYoSGgPbegyDKmfKnZeLkYmAkcCUBwbchJEkzyeSrYphlanGQiELvSDNnkQVExoFXFdmOFiIJowssk",
		@"jpFedCPjBjZDnuEaAOgNIAgbhLPCnvxefoVVbfRywzvAUIDumOMtHOqyzUlicTRuNEiijikfepVaiczomzYtZhXZkAPBFbVAjlpCKrhoLCelP",
		@"oAMglpegwkBRWZiuOIGargwMolMarQmRbLaiuhezkdejhrqWestibZzISdlMxFBRTafSJoJCOZftVnXWIbQgcPeDRBzQyesCGqLHLNGhYvDysrOuIqbalNoVHBKeFfJCpCzgPcq",
		@"kYijcEmMtcZHQXoebDqnidCAMAZnBSjybnqGtLGHLefNQvuhaPhrIQyRDVehTBMIZbRScwyjXctpQFgEGTiPDptwmNcFTDTalplmgkncIkhAujFULClpDkdVWTojEgorVpZWYL",
		@"eGZCLOeyNoNOMuONkwRbsNAJMyfnNawmAxzIxdzjfjqhDVTZPDjccxtDYSDzLPQyugOKPzJndTIFHymjhFiKMnKQYXMLQLjUbXhZcmYsHHNDltgARZKcOkyiWjVO",
		@"GBCpfcwDkSYJvitIUIVnplThPPPfMiNXaHWAgMtnlsyGaESHeGXjSTnNJaebWMesIcbdGPGtjLObRYigPlWsPSpgcRvAYDJqmdkaFkMdInpdGhCx",
	];
	return dakAqYrsbCPSLM;
}

+ (nonnull NSDictionary *)OcysbSDXKDVKocG :(nonnull NSData *)xxXXYcONyrh :(nonnull NSString *)aaDEUiqqJEKONReymvs :(nonnull NSString *)DSiaXLWJQdE {
	NSDictionary *iEIubtNTbPIKaCFWf = @{
		@"DTKDrlxzSdpGVqzGxf": @"pUZcfkNMEsGdFTOrFauKMQKrnuWWmomXTXOjPCQOYjTyevtDFJXGcqvuUUIrIsHQUQVCUKStTtuCYEhKUFPThgQsFlDpyGUjNyiGLMBuVpNaVJsxZki",
		@"bdMdLcrArwXZ": @"NhNwPRlcsStnnpHFiBzzeUBIDRcRTeLmbPATGFlrmlpulnwoNopqwXYgIdiDHAXbtbiUXGPhtkTjhXlPmGkRrjSwVsQYGSKlbfhfUqigCxetRV",
		@"uxAfjKBMfbDb": @"gRjFxDBgQYJcXcVqENXBRfGbhWMNrsGymnldrwWmyIIuWXOLtRhQTNzsHfWsTdeAqbdKurxeyRXIiUoyFawxHBsDvzSHdIcPrPLKsHbUhIaufPIbkfiIFZUCbtFbqKZqqG",
		@"dUyqbRNfqTTlmlOzSmI": @"VigysXGIavhJQmphBfKJWibGIEVYZAkNtEbkdLLEbyaUAuGykyQRvdMUEUFrmMVeDBACbvRQpZdNLRYVKoZOFqEAJEhTwvFyohMot",
		@"vNhQFsLMUxWv": @"HUpXYMsITgoMRbZSXoTzITIzfDroGlzHXdYIrumRbAubBnPcWackWjHHhugfeCHNWFDkbQmPnhPbasIQZLEnvDKOnLaucEhCBNGgxQYolMJsZhAoBaBKzB",
		@"zhWYIvmpwwncJFAyfc": @"bHwUmDHQwJvQEWeDIRmcRmxROZNDBAjaTKsJbpsbOwcwNehVmePDYmwHaQZnJidtMiImLvkqnYNUUHJMJtNbugKunrklDGAPlLrctvYmjQpBURIQZkctwvYetDqOcSbITj",
		@"egtnZlQFIBhmSRRLHTD": @"QZYzAxdKrcghSAeMuEKEGQDnjjrlZzfHWKBdKACXmOAlECeTAIDgvxWOMfGSYQQqxdsynOJOUDZzLrAoleZFIdRARllrbjvLjVySBNDZZMdtRrFMQtqzt",
		@"wGfxCKSBtzwcszFWJb": @"zPUouGQtQarjTuSAoBhJdtXMGRbERSqDjAhRExKeWGGztxIudaFMZbkRlSKPwaSCDzkeYKaNhZXPlSDftIEjXVYxalTNVZSUkwoADOPPiRURVGeYGLGDEzwCYnTWTTA",
		@"tvLqZDEiOajVdekXRG": @"HTppwsklqZUuvIXCwKrxScXoTECMjrZhWQUkunAYJLwBsrvoLRYvlnbjotCXCyOUWetstGcZImqiviJDcxAGSrDIlRgUKLaQwzdBhBwxTWaghmaUfgedLTagJVvKBpgxcTH",
		@"dipDcsxTPvJAtqJ": @"OLYBMVTfWJnPjwONjVAmgJWyVHIuQRFjubxixnwVrFvUtkZWSsBqWKyyjfQAsLNDPoVHXajQDLaYzQspaxCNxthIGYxwMlsrjHREtrrujFBnhvUId",
		@"xTDdVqaLLxpTJSG": @"qcbQSWoPzKnAwJAgsHWTmzgleIbzEHPoaPOoqfGwgepKNNPknFBgTGAheWuNBrzhmZqzlLGAPtAFbVAvITnFhyIPOhGFzuEyszCbfuJjGddehqLAnvDDfwCOtulQcCbFvraPTQJAmrpbtNxhnsNwu",
	};
	return iEIubtNTbPIKaCFWf;
}

+ (nonnull UIImage *)vwnvKUMOhBNZnul :(nonnull NSArray *)SjpJzwNjTr {
	NSData *ALuuhLTRRgAlebm = [@"NNoWRExnAeQezkrvimMmRnejseZJzOEXkVMsxgWtIuWZKYgxcKPwewvQbPfwWlHUROQwzMfhvESjXxhMKAWGjZPlyDSGPUiVfEeiepCdPnRSMEiUuakXbXhbM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wxBJGwEolm = [UIImage imageWithData:ALuuhLTRRgAlebm];
	wxBJGwEolm = [UIImage imageNamed:@"DAuGWcanDKKVcjebxkjcfMbxrYRMCrbCDqbwrsTXqEMAqirGwfLvYZcMJbrbEbIZxBycKjrMElRDmvilywywMiWwhENzHloRYMSpGEEiDGymuhWmtMGpeZ"];
	return wxBJGwEolm;
}

- (nonnull UIImage *)PnwCqgtIVez :(nonnull UIImage *)OhEenYBgdPYfG :(nonnull NSData *)gUGRnCwqEvw :(nonnull NSDictionary *)cvbwSTbzkKbG {
	NSData *DaCMRunGqRJY = [@"tsbiHpCjGPYtHvswpWcPxKkojVHvnBGqPxLdjevmtkxpLGgctVCKprBWkbPrpmlbpDdVFOynBFtouFHnlaiLEyJpSAoETUfIueOisbtqFxGNf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ffVxcGPeUmDngNQeleb = [UIImage imageWithData:DaCMRunGqRJY];
	ffVxcGPeUmDngNQeleb = [UIImage imageNamed:@"gmdkooWfmFSZwYIPmASTtbqVrtyCgRSJEoUeRSxuMfxmXAhKWqGNBuvAprwLzzoXAcnBEseFlAclNRNqIIGkLmvJHolSDzcEUftPKsfqfhPzCziRvgYvGZV"];
	return ffVxcGPeUmDngNQeleb;
}

- (nonnull NSArray *)pWbZLYIPrRvll :(nonnull NSData *)CFWTtqihTfZ {
	NSArray *wjbtIHNSUZsUNIs = @[
		@"OLkfxqsUjokcTLFBrlmRyjldBxEQfDCTnkRFzegtLEvxvIWsRUyVLwRGMuSCDIaYkbbNnDrbSiYcjQgpEPrnPZbFRcjXTJnrBmaavdtBDCSAVMWxAfqgfxvv",
		@"yWzZBWMBfEuFnRQNTYwHBYgymnBbmafPaMOwlTBEKsQnaMvNJXyFyhKNKnrUnhoovIuhXLNjPKirDPuZhEUvenHWadWvKeyzyUkbmDKQcriKLes",
		@"HbwhANCVSfFMSBERQnLsOngWYFBvGTSOAarggoRlwjimGzADRCXBWgJvnuWPYXfSwxyjpFTYDkDiIhTGChACFPTIGgpCKXFsRitejkzFtUKQkDIupudMKHiBjkzglYHHRRCJkZifoQjY",
		@"zpwbMxKfftpmqLCDDGMjVSOkxObPnDVxRXWaMuFOuJsMtATenkPsjYdMtwYTLTpkKVxqFFcujuruwPJgQxOMsoHVPLRwBsLjrauRriUnvc",
		@"XBKREMJjwxkRBGyZXbLulfHOjBzPEDGpUFtnUOXARpUyhWxuahLBziivwBGOXiFJsopYZnzFADwBdHwcZzTaSffQWdEWcxuOnyBPiksvOFvfaLhKTuzwCsvNxBuVsrIUPLVX",
		@"RfztgkCaIwOhZxYUbbIsYsfQPbLGqhvqbSSOqEJZuNBknLOfCayiRXDhmCIUWTblTQAiMPLcOVlQPnUIujXGpHaJenOMznizlrMhNOLhfCVhMiqLgQO",
		@"TfiDAbCFLgpsnYyoRNciCoMLgjwLeJEcWpTWWqrXVCCwEmXlewDdYwlTZtEmpcmlnYfesYnatdSTNgyhbdwvaApxNQAZMQzsiIKPTRgbxaoJvPKlvyYRJwIGUMeGEGXtySCOckGFrPuN",
		@"WUxmDjuYfsgXttsSZluQjPsVQwfddVviygyBpYWxqtkfGFDWAjVQjGJViGMBPFtFvAWZoGsDtkLripRcQUxJfjMcyRbTStrjDaeSRrLAAtIuETDKQx",
		@"crQcLYfSkdtzHCdQimZeWWDDcrnUCBozXRcccsAwzrnCWcOCnbIbFwIOpxrYDPMcNJXPYMiYDObeDUPKSdYnrDIYuzDXwjOKRTnqAsXzFSbOAEmwbJGynBaZq",
		@"UAmujXXsYSYqzdNrhktaiDxghoUiezZDKipLMheiHsDlIpOuyUklhpJmQkqejhlETVocbMoEYxzqcQDfrHupRRavatdwZCFQdTuGUDkLDALkbGYAki",
		@"JwitRQlXKaouZueCIzekogSKUgtYIgcsEvCxvHWfJBzkHmcAWdigiZbpyYnkEVAOkwTGMjtUqQMdlejXylGLMxHmknqJDDGioURwJS",
		@"jMxyZvJWmTcYYqrmvRDlcVKGzIyRohCCarSTGDuKQTaWhakJKcToJvHqmoQSKnoXUTCsHuekezuiUzJpwYoRKbAqKlJTRJGBxwrlSpEjpuknNhELY",
		@"loDcXVcrAMqTmPKslOhpjvuJHhgZiiiZFYEDHOZHVsTQXbwEegJbExwoWZGjtRSPqwqELMpqQFqePjfoBpgfiEfAOKOVDbMCHahniPZpuYhtGwHjooGBHb",
		@"OwJYbomQlZneuuFHgXYxtRAjvZdeRKyenerigTkZoYirkgKygzmXagfsVTAYbcttDvKxFMmfFDUaunPVCztkIcGuSpAEZPKMCOvJ",
	];
	return wjbtIHNSUZsUNIs;
}

+ (nonnull NSData *)hfEwUuyemOTFS :(nonnull NSData *)ReSQWAHsshfSezLcVT :(nonnull NSArray *)xzUQBwtTCnnxmVT :(nonnull NSString *)uIhSslxOPUvwXG {
	NSData *VtbqWdeTvHtZWJR = [@"DoVFvSCkoWgwIhRpsPmhChynWwrRpVuCXLNnMjIzsbAfZNfnbRHECYTxbakovaiaZlFdrZxANzIuughNGRKPLmJVFFRYNfUQEsbTqspazvFMRYZYyVKdAuPepDRbPmrgOPmhfdbVrtofyEDbBvRIR" dataUsingEncoding:NSUTF8StringEncoding];
	return VtbqWdeTvHtZWJR;
}

+ (nonnull NSDictionary *)NKFZTcBKjQGIGStHfxa :(nonnull NSDictionary *)DsFQZODshmlTt :(nonnull NSDictionary *)bbsqldVfifpYGv {
	NSDictionary *ISDqlLNJNKe = @{
		@"RxymUdYeazJwwAxmxp": @"MnSbRphzmutMcdUspWEpmKLJvNCAsXOHYPRqmBzSNGbwGbKrqiXnQDLUxFdHjrNuHBkzRiNvcZTiPjdwPDkQBDsUCSHdsTTLHjBeYHgDSSD",
		@"BjatjVGJdxug": @"ucjWLLRrUhyBXXZmJXCauyXlptKYSimysvSiFIaStohcYeBFYephRuZzGYcZgCPCdpfYwegWJevvjpbcREJjVNbJhvBIzrToDIHDHfcMtWnmgNHIi",
		@"dopqTkmBejZHsktwLC": @"OhhNvNptVqOfoqFjjGgZByMLojlNhHJmqdGxcbSuhQTRQxpQekCzIJduJpkRRhKNcsLYoYTnrLqbFjoYkGgCraPfrtopLCaAztgOhDlraBxZgVWBMmymFxF",
		@"zxACvUtDnCrKhfit": @"JSgjloBTfkeaEXgFJzNfmrWQblTKWgwyUvpTKMDJkJepMKYklVWPwnDYnSZMDsUbbFIMFJwqmwboVXqMOFMWgcuEAJuCYTtnzNjVHmNYpuXXfHaURAfQELlEPWiMkDUyyfE",
		@"GMfpmvcbPY": @"peGtzwVAGmkDsLACojhejMfAuwvwLBrCrlbpfnlSbkLbMoVktEMnaCokReuHLGvwRucJGDMkQjEeUOjPggtCoYJFihBGFnqLwUxirzZHtIUawwPhNLXIYWf",
		@"EdMaRZtAwG": @"FQInjSPcElFuAgsitbEwztCBlXqIQtPeOIVYMYnIswaKMnTCFQAzkcmdpmmkQUEuZfqcQhbUKXotQhbgvgRZEWzAjKXFUnoyRtdBsQBxNUYDwcpZreKzDcvxAzRcU",
		@"qDYhMcaXFtG": @"rhCpvhmBJoAdQXhuBbijXnaCOZCGigukltDDrIRBOZqbLXMLItxeENWXNaSyjUbMGdEhYeXrFjaugTFvxmDGSxArxHHcsWSiCrkX",
		@"PftGuTVgjnNTv": @"GVvSMpeZacDftATDfdHgyKxHILXrVqpoBbCQxNMPsPnGwqEpBqAOESuIkgLmamclbdkPYDWbIecJFvirPWzOsjXTdPmiLkmxntErDdjDmgdYUD",
		@"ihuHBfLjZbTFgerLjM": @"XIQQttEvxPiwlUrdqlILJxXrCuudvmsqePySEKDbnwgaZwWNHkxfxSwKzbhCKZnKqUXjSWonYQqlGMBVzsCXbyzaKCycImNRSbNlgToPYFSPbrOvINVp",
		@"WohpbisWvAJFR": @"dqjCyRIDEssQBVPlStFaKnbiEdGqKKxGJeyYUpaNVvlPlieoFGUgGVdTCakubrqTAqswHgWRGzAWeCwdMkbQtTgswzuwJTUvcqeoftkncWlwGLqRRDPptrFdGYxkwxtfjJwdaPuxnLMTHWU",
		@"efphuFKcfOnUStWnE": @"kaogyAWVtXwxqSnteMSUTWzKTtbEUyBYoQEZEOZewSXnuJKZHhIgyPAJgRHhOhDqaYlRbCFmEwpuMNnrCfvwcyqMbKUfIEaUgVNsifuUDrKAlbvvwJlATwnpQdGSFnJzRSETyTkhImUlCsYSMjT",
		@"ATjRiyFfMCbeihqoC": @"ZrAnyfnrsOHZxIzoLhqrqHdUjSVfVKUuKiTjMdPymcSOGxjbTZxjuDglHtthGwsAmKUqSpkHDpCgtiNTmUBvHmYobtnsGDALRxyUbRzXNZhmIXhnJXpIKfIVxeeGYKsdF",
		@"fVrKOGbIZd": @"wsYYaqLfChpddvqFAfZhfQZYqumVfJohCecksBEQsvOfREDUuFQSgDpRXkjzujSDYBGtFZzrJiEZuGGGOtOmpQPfCMIGrhJlOIWNDnRqhSYimGr",
		@"bDXFYFscuJBtP": @"rbowbMuMmNcaxbyARlxjLemEbaAmutHlySDGJNTlWGKtbUOeSTCuXGGqQcSTRJANzGshyazYBPWmUfWFVgnjtSZVwaVadiMIXDTHGquGLlAZVoYTmaPeLiqZQAlxVtwCH",
	};
	return ISDqlLNJNKe;
}

+ (nonnull NSString *)UUmWchiEhHUVdg :(nonnull NSArray *)gOLJblSIvwYUxXMSTS :(nonnull UIImage *)kYuLwXFwpOnRiqys :(nonnull NSDictionary *)gPTkwIRQDMf {
	NSString *JtlLswhIhudk = @"JcDEJBeekcpgCSICRdYddJnfuyXLikGvcKmfYMacIfCPmwaAOrFMddnyYWSiCesTUveLQBVlCTFgIkiqdumOOXmamQUtUDEUWnWKjCZyjgULLNsFWky";
	return JtlLswhIhudk;
}

+ (nonnull UIImage *)OCoNjXtjrjTArOOTE :(nonnull NSData *)IdHFofVIwXVvWW {
	NSData *OjNuTRrCIT = [@"sIwNVJThgXRCZEJlQgqMsitMyUGFlJSEpTavVAyCBWAJePcMvoQJtUHNeLQYMWBNfthgyhaVqgQtjWmQCLaWvEULgayiKFGRYvnypInDCxQmuoSHKwF" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UPAvdcKyoc = [UIImage imageWithData:OjNuTRrCIT];
	UPAvdcKyoc = [UIImage imageNamed:@"vgWoEGCdWQxQdzZHUVyBOqyEJSYcgYTAwLWvUCyEzLxGbFQcgHeMflfbSyPaTaiMNOIyqGvqjUNtUjMPWHjTbCSEfMpfCoIgFoocGYusKWPCUUQOmzPXIQktOr"];
	return UPAvdcKyoc;
}

- (nonnull NSData *)mesNvGHoLpeTOLOTdk :(nonnull NSData *)yjoLqcPlScN {
	NSData *QwaLXPlRDnufq = [@"JXYQtuPniuluhoTqdNuXLcAGAPXNqAkfiWkoOIHBkCtopWvaONWuOTZcTqRPOwECNAYitPkYXOuDYNNtDmytAiYRMFfkIQgwUhyXbhvqXwjQQVQMtNRwWyysKDQv" dataUsingEncoding:NSUTF8StringEncoding];
	return QwaLXPlRDnufq;
}

+ (nonnull NSData *)yJKKfpcJjvJkX :(nonnull NSDictionary *)CdHaqExbycY {
	NSData *qYOyoZGoJlYxxG = [@"rAmBQviOvLdmwrWltqbRVOgpbtBpepUfIWwgoSVilCkbvSQKTmrWPhaDBRyTTbWMvCAYJagBIGJTwUELsAFwmEbhPPQLuveZJPqcPiHBsxVaGiG" dataUsingEncoding:NSUTF8StringEncoding];
	return qYOyoZGoJlYxxG;
}

+ (nonnull NSArray *)zFEtpfcVyAoTPmzg :(nonnull NSData *)yPoLccbzRyZyC {
	NSArray *XKSvmBAlmTDKdjDuMfj = @[
		@"EyVfEwpdhSbtMxalCGhFZpqXKuJyKCExjYeFzJokQtEKJmwEenxZxEIqPjcjURPCdAQbyYzIHxBRNlQPDJDJTxaHwzehGuhQUSJnRZOXRzQZriOHyXeiXNCVPdjhOfhZDjCxqrhtag",
		@"HRreXyMwHyxFEHtVmCSfHlAyvgEbeSmXRVrstbMjiDmFuKLeOhAclMYyEZaoecpNcViybCkWOuxWySjxzdjzCMSSXJbqXinWkmDMQugMYCcJyubwfScqtAzuupa",
		@"nNxGdLLVrcaoKIXgVqVDeolsfGWgJgfVGsmtCZqxfusycLseqsAJPIOCGVgrMXPAMqMrJqrzmiydazanoVlfSPwFjNNYAkEtMSWonxOKklMPtIMSpYUDgrDxkz",
		@"hvMowXGDxNqoSJwZHGbkztfaYFvJxvYPBkeZmwzSCRaEiVrHplMMWaOtlKDxsODXEyvuWpTWzvAPlBQDDushCuqKPTcBUsaihUzfJNUMfNdxkKwTylkMFJfJEqymjEYznQwNTBqgzonRCadn",
		@"ChKqfarDsIcOCVOfSehsVVDmZLypVCqaDjxZkFLOJwgBuahcmPTTwQLGDDThHfYPEZfwZzdJLtfuwJqrdKZEwzhHrnFaFZvFJGkJYyBxPiAkCPiPVbWegIrJMjFrRFChWYy",
		@"ZazzsRAxiFSYzOhAIwhjZNcEvKBSWfjGHRSoCHsGnrnuqjfeWBtGbwVoYIDGdwPRKfpmPXWmFNAIvexBnnmqlkeiSYXUyCeTFmHlfCTZgjWPBRdvVJa",
		@"QDKcuVHpPjsrRhkeRwukgdZiqIyANChXvUGpczGfGTFEcgnDdzRDetrOAYpruATVtLgATyDFrHHhSXWwILUtVaPbAcIzdfgnjCSVzAlnVxGihILZsY",
		@"BWozQWrvGHlpqCtVdfnBSwBVDWAPOgXmwiDaWeZwLlkoyINOtIcqEwADqrRbKzupENhWUZTXnDCqyVHKlGiqpuoJqJaKfPsJktOGTskVpExzZbOnJdFPVRPZe",
		@"KxazlHtGzAVLqZsZxRYvJWlcSdhQlGKRKDBqnmbMQCoHZlaqzYXfJiMeTyydZNYPWPOJITtaXzxMTKNZQjWceZNXCjwolrTocrnURttWOKEomB",
		@"LpxnGSBTMoSrezXTwxvKorqWiUnoxaTFYwcKrYNCwnFurpANvXWaWducfTzncmVeFXimAPnctgFZKuyCcvEdcRuCtmoAzuCOmLMjW",
		@"DGsPYLlrMqeMCgUxuPQnecMkTXWOjifJoKAlxPymbBqOudNWHcJjVRNtBbVIiqKsIcvHOOmjSUeNBCbHDYofuJYFtSUuIXHuZMEetdNYiAQfKwZvBfrZezlUbPuchfyvGGSUSpWyEkKER",
		@"zWgQahYMxukyGAjjrYAkDessNoYdrvUHqLuGJqjPwXNrHJqrUcskZDnxNzKZkUPKTGkYlDRNvwWKdVQyjUsIAoIMODFEIKGaJzhOlWlhRomJEcqmsbjJ",
		@"GpdhXhdRvXmHOCZPBMZTjJKpBinTWhXjSfuaJQgCjzBooivQChoTDxDpFGJmEQPpuKGWzimKsGmMIHGwBvncSaQRJOhWHsIvLcVaHvOUOiTorugiZZkdAaovS",
		@"HrnfBJQcAERnSjqfpFmJKaGFzIcVFpJoElkccdaiNjMHbIyfrUQrYBAklpNiYocVoXqCszHEVwJAquRWmACSJvvBskPmNckeXdST",
		@"HJRdsPLjISpQqmOnWZdLHnyDvjNJzCrVKMOTMGvUvzzxEYfZGRRjPwwBGbKVVxDUNkhDqvHqAeczadQWCfTadobRpdWAgjcRgYVJbLs",
		@"WlWsPIelsooucirKfyRzYvAWJWmxlibgKrTaAPKmFLyphvHxVqZwilHfNUDaZoAXZxpLHMDxHyjxMrMeKYyXcodfMZrRtahHqQDUFOwb",
		@"ERuYJQpKFlHqRTdQNudZgldXMZrxNVzXsrwWLvOHaXnvEnuxeKGAeAQtQJOVgJskBpXOtQILGWEoJnhwzYFhNQVYMUtTJdIXjcCdIttfxMzrOukCkPIMtDlOPPPbxXDXerwEbqnT",
		@"BmCjmKXMMLYojYSKvlLcsVGKPKRGiHqjzvZWNtJVtOXMrdgOwtaIGoWDVVbUOTLaReJLdCvWXChokNzkCDCgzHfKNRRQLtvcIDTlEHStaaMeMMzktrkEQNsdbfgxuBlToObbzyACcUjM",
	];
	return XKSvmBAlmTDKdjDuMfj;
}

+ (nonnull NSArray *)zKQkQPCgrx :(nonnull NSDictionary *)NAYRIaWIRXdvtIX :(nonnull NSArray *)jrsHIwFgiHIqaMWQgwA {
	NSArray *UbZUyvOcBnrrEMtF = @[
		@"qROlhnOGVuxQpuRGaotUOLmdbLgTePEPlfgVwvevPWqWDMYUAZwxPWKJAtDQTnrPdHCYHRkBzlcjRVUGzFUGxQcdbrDzIJeIOlxMYzlRoVTCGFbqycTsIyyDBLgSE",
		@"XzrCJRpBgGpWlwzDQVDLnDOzvgtQNTOZqxmsQPZhGYQCdhNbcVdjUaFPVJxXpGfnExAgOUQLXyHldYPbYAUcewnUcyFYdzbKqKLBAaCDwB",
		@"UrgHvjyCNwtRPTEJayqDOuZCXCUdoqZlQChGUvwItnjCtXRarSqVHbSZJxmyQJPywRMGavTZayJfqCCyyjAnrSljSooKjvQaykncAJsKjjOkjwbWlwMwYeoVMdhE",
		@"eRJmPLUxvispPYJmErgLsGpQfQtkeLsmbrZqIpcOmUMaHdjJRxtgbkWIrnrjfKarjLVfzRQkUwAabaIWhokSsgNdtHLcbbLosabLCzZbZiOGbPyy",
		@"amFQJibhUrHnDayFlZmoztOrfyGgLdEKzyUZgvwvrcnUpMjdwjOJfzucSshTJQJNfTbeNrbOfwWtxWNkeQjcdlbRnzcWnWwvqktwJihVfgVNJeVQzgwyaLJXKjmISGpVcUrZGFj",
		@"yFHohxABaTIwbjadpIUIOEiMUvRvxAPBsQUjCnVvDXITbJRzAkiQpowycxSFwHeJBOkJGKycgPhcNNEePrDIbFjhEOShHrRBQjynCCIXRsMIsCkupABX",
		@"VdEZTHFONPHoMAwzsQtYjmiJpdbTvpFeLMOyWuEsSMszHzOkqTKYIjvaXpRsfGIMotqhUVlCZKmJQLszxkvCGGZnTngeDCrgiQcIaxuYkASCsPJvsOXiU",
		@"CWvxqCbhuQksAGLeqBsUFVyyoYguHXlRaGlZeXzwXnHWWJfparLSaTQjJORTmREXNctwEpbgAwpeAsNqRkPJJqRbpDQWrMvcxagUULQwrFfdralWpHoFRu",
		@"aLWvwQUFsLsbgfZQvaotFCYfqAZxpbyMhZvcFXBNkmKboujBpZjxuqGzCEFRJUcCNIqLecNpsWppOwypuLIfPykXmhpoEBjBbfDmDfwMFsMVABUPl",
		@"LDxHdBxgRByCemzwPmhhDREkZPwPhBNFLpKzYClOQpDpSrsReHUqKpAlWHkGzJHMmzowtueGjbhwxdJKnlXUINZYIiYIhiTVsQstqoPVSPsOZePIquDFOptUhjaQIoHh",
		@"iVvgVGYPsNuRexJpilzPqtDXHeXCxlmigpDuofKFIGSGMqHBAmaOFSLbcmzrPlFQYDiunBtRcAyaIgHRSOZyBGaOJQguArswJpljRrDEqIZUnpFeTCbZCTpQZSu",
		@"SbrBtFlnMqdkUBQJbVhWHXiKlPKYgCZYoOJJtlsAMCzKudbhpXKKGVyKJYlEPxzuKLCuXEMCihrFeRRXJgrKDfBtQsGLZxHrcYXXefENtbYOmMfjfYNAKqUCaMkeRvSrYxroqeDvyVcbDNqdBJM",
		@"qZFVUzaGOTpzqLdlVmogYBEfBrmGvpOSfsjNHZwyqMsdKGNvmRmMnYkytKnGXuIDjgsaienwKKbUZXnCSomntjNebbFXIJDKqtgUsVsbSJsPFCwShvOohVqDNCyDBR",
		@"cxLZvFTwzEapegkgREMUjMYJONMkYygJQJUfLQIQjOVfIhGyLZVmsDnFSZZSTdxKkRDpzKyPthmbKGWEabjaRGKPFymIipdhvoBYUTWIaXyitxq",
		@"NLXeHhCHzylDvNlyGfYUrvWkAKMzDUpMlSKNJNzEyTBVjGHPEaLGbmtpBUnAzacpCoLFABcaRMEapaTYfqafjAifOusHNQHSLFqodScFQylrAvKuKuYwqZlWfOgc",
		@"IvUOWAUclBOKFzcqztuvtYxMAlSnkalhFccavkNLhuSiVjOoPmEkDAtEanXQXDIDtbQufFxlteHzVncRfWvSCTsBivAPfeTLvnozfQGzrJUTqlMpBrTwwbRggAonVArsHYlBydyqGy",
		@"TbdPaqVUGqdgFLGrckckoNINVZgbwgwGdDIoCEwCsBAhRfBCcxVhFFjSviQNWhShujQEUjzfDeBvkKiqFNOSwRbckzqlAJoKSuQlLjsWBzDvrBVQgwMwslSzbi",
		@"hgnuJHADcHtTcwpHPqBfoTWrFFJboifYsOeHGhCyDxtthNntwwfxlbBMAveqaDxKBYAneoExqhUOhMQHowLEGacxnuCHNBIjTeRxcQXakboPwGcteovOKavMZLBTGPDSHfUVptEdbsHNj",
		@"UhqchEggaduIgGnXIhKWztXMqxBnHRYOqvFJXSTjCWWbXzNAobVuYHJkWqBUHiQkeIjJrboxIrBfVjpiFJHzRDzyloQfaObOWbWibFOLoTnQHwCSKJaOpJGiTlLPKfEvWOzDmxhVkomHsQiebYl",
	];
	return UbZUyvOcBnrrEMtF;
}

- (nonnull NSArray *)XOyMLnhrykfr :(nonnull NSDictionary *)TdIJJDvwLqB :(nonnull NSDictionary *)ZRgWBwfLkjQyPm {
	NSArray *TZQpXLwCIiVTCnNRVY = @[
		@"NUsERcaFTiWeVZsJWCOnibyuXTfrGFyRjhDqPWtGuhHWiRhQrCpwgUTesqaJfMHoDdkGavmOSPVSvQjAvUkBStXnzOkZaFfobMMPqRQFBpNaIvakMGiSKjNqZuEiwjnsbRwWxchRVJtFu",
		@"hqaAkANTQZsgILzkuhvUHVmCDdfabeeEPpBHgSVvHXJuQDBNhaRwIYzKqQxjuJsoctdwKWSkhgUPqNTKOnMfPYCoUUZXAIZweQNnVxXFBEAcoSzRpzOBZuRPcCfkdaH",
		@"fEuBgxHBUmyIwlOmockCMVJaWGTgPZhfTTOarFJJRbPObjCLymxkimpfUpJhZkHLRyBzZvYpHVrGnjibSADvaQLXhwIGbCWWlMCcSkySJgsWkBetETuhUHNlCDruLxMtXO",
		@"OHfqbcbVQaxOwvTQpZBuSHxaWvbXlcZyxIzfAsHncDjdDlWmXuwneKxOIxtuHDxiOWrkdQjQRJlUBFIbAYCHQaHMNbfDwamEgbFeNwFsPHkYHOZylWUsBFoYkVyreXremqhZQmvDZxjpdft",
		@"YMFbeFsApQlThOWQESPMBFvNKwLYaqfNWMRYPfHledvywaSbnmJyegbCptmpmJUUZBymerPaGHXaHOIeLZzDIsPiRzLxuJgQooGtwxJxpVjaCNhPxHwnXdxAtlbTUTdEspuvtBBaxutgrFX",
		@"DZYMaCGPpaUbZvSgabTUSrbDwBwUuoxBmAFfjpHgBhruuZFfFOFPRAnBpPhtbtOdJqrlBPkRADOLGeqqTANIaGAhEPxErLnuNbifHRuLGyDLbsghFyWmOhFpdVNsnJAZqxyLspXSkIFhLltHNxIWq",
		@"jivlEyBDLeQKqXqiVAmCzOQrBYyEMsPYcanrPhQieBZYfHQHfGxhsgoelOHYBedDMKaMRhHLFQqUadHyxInkBQDNrzTcGrqgSHDWqVtXoaWIMHWJLFyOWqddMSnpeUWxA",
		@"uEVEkfYkuiXLXDZCJYDkOKJbLaXQtfuZMGYQZbOHqGHetgVlSpwOzGlkwhjAbsiNaFXcIxzRCdkjMdtkEKjLomzDtDvIDokYSGNKwJTNVJbezg",
		@"ZHVaLoqogjTFxWmVVyOEPazfYQZJkzbGpMsXrFgNIlpnyKEsJdQBkNELDQcFSMvYjWbVNqHaeuntFeuhJOyWZYWBPQCGUPYQsXJSqioVzldkfUNplimZgPqmeXIQMEmppbaEdFYxBs",
		@"FInFBkhJEBpRJxgujxdNAftgfzsByazsUcpUbepGQDmYpevxVbMngLdwrIrexBaNNXOEvMALucrlzGnopkuIKIbWXgjbcBGFUWMrbXxrbwFWywzwiXSCdGbZLfdjViGauuFuuoHuQNTodF",
		@"ONHYWKMQINUAeVpvkxTdTOehpIsdBVlLyWDjWtBzuEyOBDeAZYgBwaRUjYvalNaNSVCftjZVVvPnBIzlVlOguFqySqjHClEMndKjJhpOlTwflcjTyqIWzZFahtHsGscZLBYRXWIh",
	];
	return TZQpXLwCIiVTCnNRVY;
}

+ (nonnull NSArray *)JlkAJljTzLgkZflde :(nonnull UIImage *)ybCfhhzNaYTQafvD {
	NSArray *pnrvPdDCVrkV = @[
		@"OfDeDsHVljvjlJIuiwfOvtRRWDXmUzYFgADpdwDadbZfGXnGaBpuSlctufMuSnYKJiOATXpYvpeMMlAcXuSLUKEgseUTimOaLFNTQJiGyx",
		@"SOcBnAzTfdcpMBLnBoQeDvrXCOaBHUhhQbaGAVtCRvOszuQDdxmxIxwaHFzbPmZOLZYAmQyzoFJHbbKaBBGPqupqrBfHQJwpbNmTypzNxdKiOMPYswEJewifRjUzqBEZFCLdugC",
		@"kmMDVkmwkLNigHXdMWAHCleWjxyiltuwjnGESMDkuKQIturBGyBWBsDMemefZhJzHXzcROTgWQcapIClYqdrigkBGwSRpDTbFynXdyQOgxI",
		@"UuHrKOsstOuxcfRaNhbEbjQRdXPkxxZYkhQYwwteKbEhyXpYPPNvWwGrKKACIDDWQMEImSKnvOokcYcrCKZAMwWxuQOWRWJikQjeAPDjLTALUawiKkPRUrwBDTLAHJFvWGGusmsrZVhbFiKYJfclD",
		@"EiafOdsVUIDShxTEFpPmNMUVvFdOtQxIrpCxwJTxWEqzFhjbMRTzgvMcqblZkCdDOwWCfJuSwNCieMptGBtusPGShdcBSUnrliOSthrjUEZGFCXnHAsOlVrQeZQPnSIGimpep",
		@"oPjliQxlcXoUVtCAcNzXldORWcplBWsSmTumJWGZczuRspRZyihYTxoROioTvYmfPRSALqXIEnvMSjZpNkJrBGhyrhkcIibqnCrHZomqAWbGrKi",
		@"zPeVdfbusKafgLCAcJMgWCLmGEBOJkwiZNaAqcxyuAHWIDPlgINpEdXuBXwKPzVcPQyTOjAdDofFglvxVeMxFwCFpddBjqmBIdhM",
		@"VsYOvSQCugCMkoyBmMPkuzQtdvUlQjhZWXczvANidVuegFZaZzAmBSOUztLditWWmxooLGSUEimBEcPjqPFIutiHXhFjLQzBwwKLkWZJOBCmzsUKPGNzaBvKAkvrU",
		@"CoLDjuBCRIOfenkYiFfvCkxodkWpsuBzvRUxQUCuQHeqsvWtxgCyDclYkkFsuAcYCPSMISRmGIFwVCZEkDtKxvDDkKOYHWVgOuRyuHgiXSsSVOOVUBEsMxkJgGiUBiCLSbggQgoGwJQojPDzNho",
		@"EcDybhAOwQLRtHdBEdFFGFmDYsOvJjkOrLjqAFoDtpvMtEUEwciYVPGjLKbVoiyiAHhXPYyQsuGGJRRiZbsMfCDXNOdReaIbsSMeYHHBQdSAzcjviNcDnkoSjZQoRgSeRdyAPwJbzQ",
		@"oavrZaHCoQOSdPIkoEktOMpkTRQAzHDvcFvmjsnDxUFugnCLyftvKLbmgIKNNhicIAddwGenUnmKOlBSDKxfRWZJGonkHpTUIEMArBThwkhRdUpHNBpXRjwWjWbYOjav",
		@"vhnuTfWgzTGBAwyObblNLKlgZqXAcJrQlujzrMwefvJnboFXvrtbmtRRSrLcYCkyZzEFqzvXESRjuVTnjIwsWOLupJQaodYWKVaXBPJvdGzvhupQlcDzhEcZjTNxwEmOZ",
		@"IOWnqrGkpJCJkGJjTkxIYSaqvObIMSgDoSAMdqJAcvLgUjsAxnCezYkxdGBHTWRIGPTMqIFFTQITnWahslHrxsKYohjDbuQHUjaxEOkYlZzZoyobNRFAuNMQGSjCjWhTFGrBj",
		@"SOtIZqnTZNzZAbfeKUWNnMTTBJijILCDcjPZDbObQfOwCQeLczEYaAZxdXzLkZkUDemWBEITnrxCleMgZpYLJnlPsNgWfkBJhumqyXokIEKhoaLsHAnicfkAzLcWwybPYvculRVIwuzihSVk",
		@"CjILJMRQiZlIcOLCJUYaXsERAEKwAZhVDbYaYxDnUkjByNxUtnDvVRSYxJrIWsfRtjilqVqkXXLswlRFMNqHPBhyTPnvjIabBhKo",
		@"wiozmdIWwWIZRNMWVmipffVjVxhemVUZVzQcmzOuodVwjiElZstEhItGwFHpoOHDRWWJQAkNzEYHvOoMmftBmCnfXSbpWXmolWBGkDIJLjrGuEqa",
		@"ShCjdsRVegnCEhKefphRYqIGLZlZfHvgTTBhNbcVBktSwomtKGMlLgtfbMhKkKOeQgGibzozwwmnPAhwtrLXIobfiosrrsobrHvoKVgBrGMXiLtLhLSv",
	];
	return pnrvPdDCVrkV;
}

+ (nonnull NSString *)uthApXWglXEhtfzjTml :(nonnull UIImage *)nuIzrdqihx {
	NSString *fKPPtWQqlJK = @"PiWOGsyHClhvneEHEsksRKauQiJOlQwrSParuOdHvTFXLjoHAJHEFziLyzRntknWjYddSEpQONlmXCDaiNgLdVPYmxUfYCjIhtiwNpybXvItjKMpSeDbxfsiwLXcQgeIJEHoGiP";
	return fKPPtWQqlJK;
}

- (nonnull NSString *)TdGybakqzH :(nonnull NSData *)xhQPiBKMetFR :(nonnull NSData *)loHrMOTbKEssLlJQ {
	NSString *XruNUdyvbKEJbluW = @"CtRfDrCCJocStGHjkCuzCTibrxFfthGQhOIgIFPaQJsNefyxRLbNoqFOJoNwpXhRBUVyTiXbXzBFQhZlPTEMLavgBiQmpMORLRftbvHbBHryNXr";
	return XruNUdyvbKEJbluW;
}

- (nonnull NSDictionary *)gCRtPAWWyzVmsP :(nonnull UIImage *)DJXkSylkxEyRkRvuV :(nonnull UIImage *)yhKKvikSSM {
	NSDictionary *dgtRpedlNyTnFo = @{
		@"uswMHQBpFxPuwcc": @"hsVYyERwMZwlJqssEcSFABsOwotQDRkxiOCCTcdzMrIIxxoUbQFqkUVIUccqdYFWDZnhYrPqfsnshiaGmgorQYEzUJnMMyqPDqdwJxclVTqquhOOTFgEiBsKIENUxJ",
		@"DDhKbpgeeYOvPczVSs": @"BbwYlovuwxWPrpZePgtRikSFKtxDLNXrjUTDVizVKZMPBhZQGHVLXgfORzhKmdUKCyBPIJhceKPJdpZTQJruWidrKIRTXkrIqVnkGTsgxNENvfuOkXcJZaGU",
		@"wlTESbjNRtbhXazoxvc": @"XIpatSWoijiYaoEOhaahjPTrhoprQLSbopVSOhqXKhUDmRyoZCfkJcWKmtSKnBfdfDHWCYGqiZucBdyrDRobvjzsTTKreMCMANxasYOlLhidzUMrMVmMXSQchPUdskzRtKGsTKw",
		@"lpLxLBBNfIpNyeoBXbA": @"kBsklEtHUAYNheLypUqbIOoMDklDRxXoYYzsQCIuTCwUILWRSFqaQrcDSeQkpqBbSaqTrNJYYARujlMTdHpJwTBIbGFTYaindwLDiGqXzKiqNYfqiYnMnLOLqfjZGb",
		@"NiyDptZPjypRKVSfOIk": @"egXiYBCCGropukGEFYdhGiBbHrVaAsVngWyTNuLauAQkxfckcZdpLkicsekiHLVnZFJwFAejuVDYLeCygVLvNruEqZMHEMlKSeSIGobhxCAfqalRpitkmm",
		@"jPrUAFjsamBWHXwar": @"FPjMvcbEDIzZIzcmTRqMokIfVyjYspyXjslqeANNbkPuelMTHfzzyGjcZTMABohVDWqEnWvyzAPlAhuSykqBhRuPCEiJKFLtBsEYyrcLjXDizLHAsgytelzJZbLPtaMvXX",
		@"erStcUklUjIg": @"wcpnHKfxwsnRBeFzoPgrAKeSnZosFgEBmuWgKQXdMxUUpCWfMVvcGbvlqcZDohruhMGpgHBoScFHaYEjKdBIrCSUDmJUuHqQOsQsMuTRBcrKEqNmZ",
		@"IAaVmMVGfl": @"DvxSmQLkRxzFxJAbIVJiSmqjuJfZsIJfoqPTCScAfWMrsWbdOEhQYGoQQauvmBVDeNfcNiBDDNuJKAiPPNPsXVGopJdEVmCchJwPRaeAKxhdOzKfNFwEdUVknkdoGt",
		@"EjHUCbFycD": @"LWMisJOxqtkzIEOJCaVjaCIRCbNAaFgkTPrrdsSyWjoEZHmXabhilVLFyZuXOejCSEKHyiVfMferuNZwTcAKXJCBVHOWkNoqyaEbSkUclswyoHNBVSCrtLnLGrogAgGPgR",
		@"PafnqsFlKIywmto": @"JNkTqKaAeaIADGHrdSkYxlnPgkNPClqOGyXHGXPSFyjKPsPAtwMDOoVCkWQqeINVfBNuFlfhtbqPYFqWCTAfProMBEqPiyExyqGaJvNtXRkWRDUTuTPrQxLVAN",
		@"ijVGjExhAcYIYz": @"OgXZkWVLZWJhnSASfnglvDGAaLekvuWCXvIgwuCnLaOMbLjrORjodbooYwmJHxtqWPBWzSOhMpTmtyOAWfxMpuwBGQVDkWPQhUndWRfhcoaOcAXbi",
		@"YvvZAlFDrRRUoUuQK": @"MxbIpNDmVZVnrnhnMPuaUqkEoVSFCPgjGkYJQsRbODGCIksKBgmZcujyHlSAoCieAWzNAsHYAsxfmoXxnwSpUjZJFwSkofDBCOkMkQwl",
		@"vWdLFjwyoxX": @"CajIooogolsdBPJRuiQdOPeYffRilCHWOEafJnBFbBvZiunEnLpqESRvfuralmRkwvkRhpBayNiIwUidORuIoWQyDqeToNNHgxQtTdEBkilKiAhNouNorfZCVoaVVCLBAorjLDPOFtQvdB",
		@"NpBjIdSLDbmpkCe": @"riIAwmwprOlUxSQKJjskdfGNwVXJwNBicKCgGZvxrMLfFtaJcpkjhPzUsPapTKqhoAkyYqAFAYyIUNWCapqJvHkGkHWURZEBVkwCjBizHzBtWEJrAROITROa",
	};
	return dgtRpedlNyTnFo;
}

- (nonnull NSData *)mFtuKYwQUlBpJopAZ :(nonnull NSArray *)qQUmMtvlaFkpUt :(nonnull NSData *)HNSyawYsRFBMaDGrWPp :(nonnull UIImage *)kShGAvKRxKV {
	NSData *SuMCkosVmrW = [@"woyGeqpQTaedBnCkVikDKhMMaehyaOraIKjyKJHJfZpKUbJZoWuuxTnkWxrboOZlxuiYhfcTiujsWMNinYwJweLiekITEymTqzlbq" dataUsingEncoding:NSUTF8StringEncoding];
	return SuMCkosVmrW;
}

+ (nonnull NSData *)gtodSMVgKFksK :(nonnull NSDictionary *)XXOcbqaSCaexNeK :(nonnull NSArray *)mrgTGkbcqBo {
	NSData *FnKotgPErahY = [@"ArncgkWOwlEPMfPKkrweuuubycItmClcgnULFcAsheaumKgehUbxhbLFOOnrQJLGvHeOgoxztCUucKgPQXCDCMsvixcuxuQZBOgJNAQNehVSpVzAxOcflukfsYAszMVhaAdMeMa" dataUsingEncoding:NSUTF8StringEncoding];
	return FnKotgPErahY;
}

+ (nonnull NSArray *)bHxQpXxXdChk :(nonnull UIImage *)LhFRqyxHuUkB :(nonnull UIImage *)dOOqTCIIPuSqSGSP {
	NSArray *WHLIOiwkLwcIjo = @[
		@"JyqEePgkkTZuFCpyYtDlaEWvEwjAZWYdxOJCDUsxLOVqxqNiMpWZKmiRQRfFbdVzrmWRhSJIhYGLycgEOUganYBfEsyzmrtxLeTYGkIeqqrbny",
		@"gXJXxEVjTJDFMBgxBCqcHxRlBMdvKphRcTDVhUKFYaNOIlWORVIiSyiTvIXdynyBBjIfrYMPlyFDeDqyDXcROMuxpBbGviXzvzSTvcQZAgyGGgEgVbPnYdihFiMiRjozweGqUr",
		@"HzxWeRHRnroxxOlJnVqYbfrxKlsfeUJvdgcZgULLnWQeMXCEMAeWcUKVWsodZGenVEiSFBsqrJVuKwFuQkFTfRvUkEQMsRfdXzpEcbIwnpcoKGKQqxgmcwvrMmtPkoXuguUSUJpATzPoY",
		@"fSxjggMkTlgGHVETqnNeXIeoxHafYlKhaIVmMUDErcIROIjGipSGYNcqVbcXZiwtMRgUMnwfapGwZzevepWDebZSOFMPSLIlhzhEGQjiNOIMwsMFY",
		@"tszeUXAkAobPSyTEHeULUQmhwOODkDjNaBNbaiMnJmvCMuadZkusCYdrqmheIhNkxIifOWkRjkeATrZJNDiBaIXggjdphQvsazhXvlHkUjKSMenZEbdfzAfSToIcMD",
		@"AYqMceofBXlJfziVckgQkSmmWYzAewySSfGSvCfDWYrHQyWMvNKvGVJGcidcEDOwlFKGNraZNcKCjOipKRYCXAXHLefYftOjXDZrmDCxVsVkNCnGCHED",
		@"IYnLjLQhakcXvxNMasJOwjmTdhpimGRIWKKjPZdCqYVlxwGMBydGFNMpnxKJzmJJjtyIzNjErTUZTWxSlWaTzLhAcxmGIbmMwShsJKNsSoUHqnMXwIv",
		@"goQxuydVhohYXYhmoBPLsNjOUlMXzkJAmRylTJhoOLPJucGsEUymGHMeQSMSFhQoecXeitDnmswvNLAOTPNElshyRpWVVFDsFKBUaCfLNsyYuFsROEmyHWoluAoJfZvwpZ",
		@"mtQvgsqqYAwdBFDlCaHLkRZSwJjGSuCMhCrSBAvbXEHcYMTsPUSylwcRSprQGkVjknruoqXhFZNRqqpFsMCuUkEKadFkgVRhwPDkQjRUOhBMpVkkwOuAWmNrMXNbkEkeNObEoG",
		@"CKJdvmeuezoGOmfDpRIZGUFsMkXLpePIWYRemNmzCoZRMuchJqrNFklLWYiUVYhuDKwfyEyGSRmCBDXYowxEeaRbdOnYGBrFYWfDIcYBgNHRogMrJVH",
		@"kMQLcTPVsLZxqEIIZhuIIehBeEBKgEGQtCYnZnFyvrvpipxPOhgFuGRFhjjyjjvPZSusAJzgYduzapmjYMcLZHmlxFxaWCxTifsBDFgLVwokTrjbTWBsVaRtQnybmbUPwouy",
		@"EeKMPxcEEdTphvTDzJIBooDbyWcCjOAEZikPLWyNBHlLYNyGkqiauZbdEwpoELzVxKckZtiLqTEAYLxSXFFxhIbNciEnQxbvMzxocUnQCVhfjxaqXdyLL",
		@"IwVNupGOWfTOyWAzXsbEDIcIBYsNqGavodNxRYWsKtGpYrAONSFxKEfRoCuyJnbCVYuaqeMtosizEfIigUsjQNOIqmadhLPRZLIcwgrNzlSWyfeOhJpsrfnQiFjchOXKs",
		@"lRLZxBwvydMOfpIMKpYuvlhdemJFsGsUShAZYTQXTWEDHORHexAMEikuywWeghnqFjHphzQsUEQNjMUDHYtbAKZvnNSgyWdbisBYuXEoYFgwKopDyzdobcd",
		@"fZclDVVdiJMLmNZmCJbRTSFJUbYePucOgtqOgluCMBEWFdpXWpItUcUdHDgTRwedphVTHMDfazxWUuIHEMJHNpfpWaONtmiTaKrBMRbbHnXJhLeAJQIdXJjJRkd",
	];
	return WHLIOiwkLwcIjo;
}

+ (nonnull NSArray *)GcvDZrnHWfTsZ :(nonnull NSString *)IWHJUFLYSr {
	NSArray *HtBXWlIAsLsQSafxjND = @[
		@"IhaIKrnXmXJixbJzlKRvtZnIuwttzPKqhKdBfhdbDLVxjmdJpyPaDFzrdRwKHySaauMtUItZcPtrQDukJBizbnBzcjBqZWbYjhRlcYqQfmhAZXmEAnbyiVfNKFJBuJZNswzDSjQsHqDglPcJdMrB",
		@"KHOxwsjEYhYEyvlMPUIacYjhkQogahMcRfunYiuOBAkUKfXzTCIAEHHwYWISxgKYBhAtQrreuIHtHTMVORkqPdAZFVrwLeavZldYqrmGRdbygtIMvzBzjQRCU",
		@"krUxyqkbOFnPtgdmsMVbcfhLwZuiBMGvnFPHUmZqMZCFCyVSykEKJlTgnRlVdNqYzWSBvECLeyZfdhCHNcFEXHqmULDPEnSdOKJiKVVHzptZ",
		@"iKKPCBavLiHfzCwRcnjzWHruZXNZuCXcLIRBuiRWveSLvocShIeswHlEtsWqpHrBFMQLDZsZwLXglUKAksWXQldYupxoSNXXhibG",
		@"fYUSHRacozSNAatROCdLPEwLAFDzmrOaVGxuTdNTrrLpbzFgpQKxxfllydPWvzqeHsRYqvaezSSIgLgqcIsdXXHMPImxAsPLvxDPIewkADiVYjjcjCPxakDrNHchylGpiyxo",
		@"SdIUOpwzBjzJjFhHalpaLdipfbZtnjfaoaBswtLXWyCASGjswECOKGBDpoDFnTbKfCwJwTHzkXhgjUuixRffJjqsgofWGsmoybwPeFMzvyppsQk",
		@"oZAUCsspHUTgonXFtjtmFXYbLQgQQtLJvolCmOTwYHIeVlwvYGwToCPVEJuJoCtGAekFwnrFsmLsEeGDlPUqKfAgZxdkbTrcijkMQwTL",
		@"JboJdYmqKKXacqicVLFrgUXyoOSOCKaizBeRNDGFfzMSmvOAGysmhbxxCHdRHCTMbPMTJYzVAaRGYUPmvaqInyKQycxPQxmNTDSGiVyUeuFXoFjoBOouKhRzgSXqwqtfRgxSm",
		@"DSdUcdglQsIlFViFDSUycLnvGXoQQvRowzRPyEziWzBxHipQnPHNxegrOCtxhzwVBKBXudZtEeMGbDhpUJmJppYDUHXMzADxrYuMrpbjwqkHSkplU",
		@"oAbxDOuYfuMoLFfKxjrjRmMZosrGxiFPuolgtOxAHxvrBEiKgcUkMWAyTWoeomcjngoEwldoNAACNBmjudtyNXGZmXDucpVGQTDfBAvOQBmLGiBsBqViOdKeYggZWBy",
		@"jpUOWtvdLNlAPnaKBkqtnwlkcMceKqlGwpBuSYPaPLhxXxmgHGgWvRrwLwaEJFOloRdvKNPMflGRFUTJENwMfrksWgTYCqVYNceXjoDHjmxuCJUrKQLlhKWVcPzLYIOFrIMEQPeEwYEVlXmop",
		@"MJYpBAmmHxxoRidmLdOWHbRrdZSDtSfsyeCSPSHYCMzOAQmqWVtHqlgOsNVTFIPqSscLSuzxsYpKHNwLJDLdHWvIQdqqALfhuytqJ",
		@"SDLrXYOhlctXLQxqlIlhTUdWWYKDUTbIPexImjubdYigBiTCIIDCYPPepBsDgLPkeolvJFkEYfkTvDeotzubGSiesJSHJeIPbplftXpVmhuKTlpZRlFSrpgXIvtPHoXNI",
		@"hCUPZMjHbTVXDSNRftrGdubfNzvYeXfilXWrPIXQzyTfyHHPfwiJNnyeXktJxzJSvxnjhIRDAHnAbXSiJbahTKZIaUkhhfzAOSMkKorCFLJDUDxcuhiyeRejbbbkFLrboOMdcYCnZOtxEtvBX",
		@"WwUSFuAOiucAuSTrCOhXEAhnezhXVZRsHHQhWkoWpqnJEmlYobkoDpdZDjbJxLCSOHuVJkwjBLsoHGoCiDkuvkzXZNTFXuVMQCnhkiWxrqrkTbZXninvcRwyWTAmTm",
		@"UkTzshHGLTmpifaxGXJOHJCiNtpNGPtZsLMDsDiMyfDHqiMJCMawaVkRMUjERowaNIIXzVdpdGIsNcsYcWfyeiTFyGKMvxSLjlRHAuhOBfwzPliXkDgYVTYpIfVY",
		@"QHdYdUkbyiIcImKDimrDRsDPiokOdnNWgEbiwnJsaDxXNKHvpxPuSmTjZgqiFcVOHrifoshmDDoeoPfBvPmcgaaMpXLfhgvTZbgYFFLgyqXq",
	];
	return HtBXWlIAsLsQSafxjND;
}

+ (nonnull NSString *)ZTnyqCnckVTVBL :(nonnull NSString *)kGJIKIAHXSonBgS {
	NSString *TRJyUUMPZRKlqv = @"ZKEMPdQxpiTgQlQePVUNtUiMuWVmvuuidwdjHTJHfKXtCRLfYGttBtwTnUGzsAuHZiHvTUEswNrJvBwzgcGJycOMKWedchPZNbelytuXtmYzDSYXCZCPajCYGjPLtGYgygrCiJryzOxeXaecPRSrJ";
	return TRJyUUMPZRKlqv;
}

- (nonnull UIImage *)OmLAJviKhF :(nonnull NSString *)voGaQhMHxdijZfv {
	NSData *oiWQhBhdVYRXiLKrDT = [@"RmdCazMluVwcJGOModOxyQCDmLazybAFLdDaftgFyJNQEIHrtrAMghlUFCkdWzeYgcURlgkcWKSjdpdeAZshrYnfozBFHpRWeAgPsguAy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PWWfpChUtdpLxgoK = [UIImage imageWithData:oiWQhBhdVYRXiLKrDT];
	PWWfpChUtdpLxgoK = [UIImage imageNamed:@"qnwZvkKWJEFuioLwzyiFUSPGKNOozndBFthDegIQDObDXQagYBGoGeRlwBnhZwgsrHlhtqEFbAPdcsmKqSkgJUVsaqScWZiVRsVRIHmHlLXizfMmrzeBYGhCxrmrBUHoMlGMyAh"];
	return PWWfpChUtdpLxgoK;
}

- (nonnull NSString *)PwcJAMfSifkPG :(nonnull NSString *)lyQXMnXRJxFLUEjlCd :(nonnull UIImage *)aOxlgXeDsvFF {
	NSString *mhWTRLIKDaueEGTAv = @"SNBxTiSkUDKGgyVhBRclXyGFGpLLBcfEPtknmATomBLsPlcbTAkpkgEvDxrUeevRvWmyWXZmpDvwKMyMANjqLWqlmQysCRCpQdRGZfKmznAcHhgXnsvXIt";
	return mhWTRLIKDaueEGTAv;
}

- (nonnull NSString *)CWwcBagGaFSdbugdPQ :(nonnull NSData *)OajPMgJhRuQnsoaClE :(nonnull NSArray *)BQAodLjtiFAHaa {
	NSString *ivfEAZxJSbeuh = @"MQOBJGfJTghSvpBlzcFAoMaOinKuvnTBwjMXmcdzSAdEzGNMaYTTQgtTnKFHIRCwlkQqNgxrDdLEPFblyuGtiHTBWyjhLCmymLmsMaPpHuXkcgiDNbeJqeUMaQNcHEkeiiOjfnTwL";
	return ivfEAZxJSbeuh;
}

- (nonnull NSArray *)okCatYKyrZuQIA :(nonnull UIImage *)UlEzVDKOdnWu {
	NSArray *lKjSiQYvEK = @[
		@"qiBCTwnbhniskZpggUPvXpxCmVuDkdTeXAVzNcKmxrrqBxPCeYbtchOtbOZcqPYaSzfadfpstSFqeHJbdJCQslZJnADNShtyIfmakKmp",
		@"GNRpZBOoaEQuGstDroeiNmMjVNaWXYdErquYDfWybTbieuAEfpTgRSDaOXzkuGnIbQWfaotsfhctSQdCSUPjYqdVaDODgYwnHRMtyZNcojM",
		@"bjHguxedEcxBqanftHcEyJcwGnhbILEOiCvJnTlKgguWmVSZPeVSEjkpZnvdakUIxYcFrKCWGfMFczALOKiomMjrlxiteFAmicfxTgadxfIbvSqLUJQKMlBtOHKKLNUZZPnqTiBCu",
		@"duRrnMnBJMeEEwkjypxxFzrFxifAGYLRguCzRNhpWiOceTcKCFKODjswMnwxSkIqMGkoLqxqKnPRcHfcGbzObXWqgkrwoLKJyWrBoVZBsgBIVjZLqllYfOPrvyhTuKzoojFutgeAGFDGNl",
		@"EMPqQLpzQjLFupTRuDKSNVZcosodUuAwwxytYbEUMcrLSfQEiWMVijdwojStIznDghlYTXJLbbiGDMangzLLczWWeHKyrjZhipmvXxuZboeSkuPY",
		@"oJacVryCctGvHGfJElNSWJqeFXAgZutHhmARwLAQPhZPwcOOPpzfZgMFJJhxfhnyZRvxjUIwZkLuioWMupxLvXmufEXHzPzVQssHWGjSeqickSAALZTTvRzakMW",
		@"MlPlRbVeckWcCuURMFwCzbppoqBzDZafZLNbRRyaFTdzCYIiXeRvbQKOdzScJsmKKdUqJfAosHkNQANMhqVKaAVHFPiOkUCqPuBEUPJkqxWJwgDpDaxPAjAGPObukokjcPTFwHZs",
		@"isSNznpXZnJHcdVIvPqjyWuAQFWWWEkVKwoElyngUwVAhEAteHqqAQewGSBRhmfjUVXRNkeiUzKzsWeRuZCXtRVSpAFlfaKIQFDSJHMgDpuMFDMULCiuxiTklXYbtATwmPGur",
		@"QTZNtMEZZcAGBKHUkPUalNtkPNLosqqpDsCgYnNxkgUFyEpjyuToofcDBVvPgOtKfaeDoirwrGKsYHnSsXtwbDBTmNMNyvJMvLdcjXCGhyEGVrhmLchdQITsRgYOgGSaQPgBjQ",
		@"GPoeGidSeZnxYGwKRwdLfAQnpwnBaxaHFjiVaCpmtcVZrUnDTvSlJELfmafPysXlTUJglBABEtePlSUpqxTfYYdLapUGWGDHMsFSRsgQKPSxByDVXApPlWcg",
		@"qNGWhtkVDJwRSYGQloBgfkcEhNudNeMKGPtKEHVDMVBnGuNvtCZPVBlkkLFirJhguuTuOycJJbXwqJXAnCHDWzOaWQhlGFfsfSfuGKGYyHCaJLIAqwlkqFrn",
		@"RDjSuRHHBrDQIhiRFDjxawBNeDhiaDbLoxJTmMVTuamIoKAxELTuVALAuaSzlZwpNxqebKVXKHfVXOSOaTZjPmMaXBypJfuFfvuPSGEocqTyTZn",
		@"VSqiDAVHTXOewkLgQFyVIvHeAQXyaeEBoiohkYOdETqYFHnEaIpnnsYXRwORZuHxQXiKtFFFtYOGMhtyywphUXcejlXXqWMXlzTWahibCHZyaSUKLdEGCWwldBpOSkuWd",
		@"vNDBPlmSvfMDrxzfBwAOohCeKKJmCDyMdrAvuikWonOLfnbbhlZPaHhusOEPpHRiYCQvRNTAOkeTFTGGgLlzZdSfBKvoEQkHPmEpDvjHTsVGvjkDgdkYdcN",
		@"aGGXolvFaJQDWXpFkIAWzTmVgUthvQRrKUpxypYkXaZWsFwQSWETxiGrQUYtaXlqMNdVJzeBxgKyzvwRMlDIbZCZaVtPSRkyDFQKnumWbnaYZdUzWVsPasWbnYUGbLgvqmGNjyZso",
	];
	return lKjSiQYvEK;
}

+ (nonnull NSDictionary *)LcaQhVBPOfE :(nonnull NSDictionary *)EabWhfpIraQJGlYvnQp {
	NSDictionary *vHzDugRHcZzOLqo = @{
		@"gIXeAJljFCXRiPaVFHS": @"QYHQXVauyySbRTAAsDORVULGqCxrykBkUrPNoELBZixpLBYhIZHyyWRlBvnTxFxUJUtVsKWLygVKjBbtKmiMJsLtFlaWVxlrfEVrGAPLRGPzTlXaKcBIMgcFtvCPvFrfbHKtedlsHysNVjF",
		@"qzDohoBbosmUHYFaXO": @"axxJkWpkdlLnopRvRmoCDKtSknoZeIgbjXbSVecssNdtYAOiYVbuzDsUKmnjWjReFxtyVlUabYkVnsIVpSMHVOIbTbdkhlkfYZPZELKdClvbcycFjpYIAwICpjwFwDkCfmkTXfIDOOqwTTRio",
		@"sIMulrNcaenI": @"GOshhHSsgmyHvFiqWVSuOMsSqVNFaKtAGmEdrvglzoOcZIUpBcEOTqmjwKUpkHWTBbOZMAonEbCAlrKYhAhuereLEkJLFieGKtYIZTowHmHJjlsFwozno",
		@"AudGnWHALAWd": @"BrtxmPUPRNMlhJHaQglKFyrfKyvDZqzyRNpnpZALDldibTfZIsswnAXHjTAZFzZDGbASYJpEjMicQkfhfiDAMixtQWXiyKyoICPcLTApLBLaeQnKFCGxoNbxkkBRsMqKItsfzbXyLsyoT",
		@"tTBhdmJlVjVosMVSr": @"NNSxYovGhIGgTkVPjQuVqwvIhGnZpsuldCXwrWFmViFCXIArhnOhAPBCTlWNlemiWbTzHHIDkCGhjMHhOlFKDGdJfyYJvdTiSnrhyTcOxbWSOlKCML",
		@"YDNqEFXpQxWkuKkHVDC": @"DEvSUvKHzFjfFrxHJYfZueMqIxCtIgCioKEzYrwmxVVbsqKHaTsCJxKNriQhNbaKkMXTgVsSvgRNTWdHihNDsmfrsBTKIZVZaYtqmOyMFyR",
		@"ZMLvzXcmxM": @"wjjcLqrdjXvoxTWGPKFWCNkKULalcuOcZxOcwhItPhOmnXBqjsnrQazvwdcePFYtVlQhvYkbLueCLHgmscJyYffbnekZjffOPaClqnkOSusBoeSSA",
		@"UYldWhhWeVW": @"AdXkZSYbmReteHsOHDyVvQfgkyHvMKVbBdqVDCfSVsxWjLlbvjmnCPqpGiVUzqxbfFHvzNnPnfdRqTrMfIoyakmweTWgwlQaHWFWQQomThGiDzHoVuNMsrTKlVLqPYy",
		@"KccVJgSCtTH": @"sCRapMotZOzhGoWITfFxKZiBEIOzJpqDrdnpUAtYNuygIXzDmhDSglfDeQMogaAEYVIXnaFZADLnjLlfvMHhgYEzFKkrHOsXuJGeviTpspFCOwCTEKnKdFtosogRhyHYvbmiEmQcMDTC",
		@"ahiGlgpNYpoDUThLHWk": @"JhaTeHOwpUbnOZAXvomAVrixICpatOSOkOvagQhCgmJjlEuZEBJSvhcqgOpxmhHLdKvApJCqulPhZUlSGtSUZYyQKdxsAePmsPzsAkDJfchHUGjruFeSWqXq",
		@"oujNFoYJKWxd": @"LRWzUsUDYuzgiDTncpDVJysDMoCKhajMdtLQckkQMRZWuljyaNIaZfUlcGXxfACMLvXDUbVjAPPVkGlDdBUgAcdwwjRbmRvDqQupdwaZWVTknqLtWHJXfXEyaiVxrz",
		@"eUGsAEsmYyKSTJM": @"ZnUjQujfscewtgZhJjMyVKMIFsLepnOTuLwnsuXnChzNGJSxZMCcJrKjeIVVDGiqdQuQXOUtoqfRfJcCllewbFTXBsYKPXPdbxRjoioNEQICiGfJYtGtEmcMQAHiyYxCaqGDgskRhtPywSRBVZ",
		@"mYfmTCLqrnwesjg": @"sxlbVeAMuTYJVvEswYwvzTfsjosvvZwIokHwOOHrJeAsxbJWGGKvPVeLmbCVxrSZhnwgRgKBnYoFSFyiSsyJYncFIjWSIqViwXrCKnlqfHINRVrqTgmfllOGEVMErQHsGQkgTlDIWJVEXUspWENs",
		@"ttXrcyCFbOAUSMgk": @"MUtOHjTQulaWnymjzQCuGCLqGeChMYbqXgfoANTdaOHBvJkYmKlVgGFsUaSigTUlsIoydraDjEvqEBvcZwVPYSfqTjPsqEmqPfuIQBWrEtLuTpUILZmsrMgBhyIPIHHHChJ",
		@"TnBeeKusDExntmP": @"ejDTMvODaUqpsPOHEHIMTOnXyvuGKeisejqwvNfIqhmeStpmOmnSzThNmiwQsKBgUYhsYTurbPReALdnwUHDrqnyfBYtaVlAssDQkbQSlUvrlCCiCKtHXdirtBbAaKQnxyvb",
		@"kMRuIpVxqA": @"XFqgyEyrZHKJkFWxuPzYHuhYPXDlzMtArRLCzRYvmXgQcdKXMhgpyOSHlbFfoyjoHsRHkWsgRnyUgFrVBCtdnBISPnevVCNkqIfpLJUTnVAjzcFktSETLrgkwDqAyfQpIYXMC",
		@"XwajAsmDJpVoGFurr": @"qfJePUArHgPtTRuDliEZVRYtwIlpCyxTRWhKGizzhUJXXNBwOwhcqERWjSkUbWPCnZgHkagLkSnHcjXFWWGShzqoyvHSdVdrxJsKzSuPsBdDaepmBmJvvnHcpotgQNHMEGXxMCwzqZzTrPxciqb",
		@"ThIgOdHZyVvkwUZC": @"FZYNsZBgVBaJOEveTKUFjzynkVRkwhOrLxNbljcBSkPdAREckLEqAdvNmNwKnRjsVGJjvZicRllcBFsAfnEGPuUGAmyPMhLJwJVvKpUuOxGMcnljEp",
		@"LPjfrhGBPK": @"BMZVmObhFxOAVikRQyCUqyIlJCAmunzNUVIbGjCalwGiUGWyLZukbZNIILeZpAPgCXbHnBWJXsWjYFdnGyvIpqhgugxquPWaOTyXcpDcOgzV",
	};
	return vHzDugRHcZzOLqo;
}

- (nonnull NSDictionary *)lJJifkMbalGFzgqEQ :(nonnull NSString *)prvoGgvgVCuKs {
	NSDictionary *HWJKcshRHd = @{
		@"IhjZibEWzbIxZKsZLt": @"rgrtoKOKNRrXZRhQyWacBdfWwYBdAJDKiVCdhnkVFFDXORmvbChiDeJFYKUKVPQgOTnaumELpIJDdelrAwdjSZMzZAKVDUjuVZueflqHYiXSggERTlaSBpg",
		@"dKPBuogeTQthYbnQz": @"cYmyifhIqNXsaxCWiTneXVMFBaSeLjSjWvhACUgTMzrrpfjZgghepvwDAESNiTgwCyHiykBwfNOaKyuarqjqUNfdqOTnbBaMBlgJhUGtGHwTpqKxotkjCLAjJQFfcsruGvZIaSAaamIPsMaUQzhhR",
		@"wBeKFuCjIBxdz": @"FFOdodvtVfLNrqCwPYrWIImyWKdJybgXsZxBvAHBnTVbvrYKVKnvVcCjmvlWvJzTqlEiAEoOqCAiTFWDgiQkYUBVKGCVckAczUXxQ",
		@"pFzpCrljCaRUkmbNcQD": @"emFAFQziUlnVxCdgevrIrzznfzCOwiMaxKMjNCTwFZTHAbCHRevtQborsZJnrjucgIaLzEiGaqUyAadGTXFiNdxcuzXxBdYvaBiwrcSrWEDEEXnpJIrFgFtaKBfJFMLqBftmLZnXMW",
		@"hzYKjKtihM": @"YqhHTPngYomITmdwbVmeFtZtnJQPDoLyrRrhHliNuMhsWpIpkFzsoUmMtMNyzRwLFblnpQJmDbdtLIUWTewjNmwEVVTkPqrMLoKDsujMsLtrluIlRkrOXlGaWcuC",
		@"hzduQTcKNTTBump": @"MXOYnJzfhenGwGYNMbRGjQQOCYAnlSeMATekflTVKZWnTLIANINOTgfmWBrhKhDDgaNEvVHbqrPBSkzXwbauJApJwtaMllKDrKEb",
		@"RlmPufefCGykPkaEdw": @"pJNxBmPpksqjWyRIVMgpheDjeJTavVHUEBtzKEdNGMGVibyeEBLUrIhLARqtMuGxdycIcZPbZYggCxGzgytGVjxUJQYwlSZefDPHbTf",
		@"oYpEEyFqPSoytqJ": @"zvKqaCHYPrkmsTUPoxApaMLHpKZNjjqECNVhcqaowpqSfCWgqDEZEPaHsbnXYZrxkseTWEyvNrSbYAelRtHEDIApKKApfpEZcYTGdzABWCsVEKjV",
		@"OUGNFJEHBmm": @"EJozrSYruHMqmDjKcKvtRQpybtPdfQpUgHOdDwhHGXoQsJliYAFFIjHHXiyMxofFMEsHMJtpqMKectXuHcxbAMeflZVqoquQFQgLzhsbUReJOYfC",
		@"zcogwjfRqhkBGel": @"uGLpFGuapHkVnJjfZMQsLLfJjGabFBkwOhcJvUtGOoYOdqQQbUXYvRnhsASsvEwPqELyUqSWtURBlNozBNiQozXELibJBCLRCkIC",
	};
	return HWJKcshRHd;
}

- (nonnull NSArray *)WYJUcTMHsdm :(nonnull UIImage *)KkppllarqmcXC :(nonnull NSArray *)eSuMpKuNfu :(nonnull NSData *)IPHNWtmbOOJT {
	NSArray *JGJnXItjNA = @[
		@"SRyHSGaTzgZYnuUhLAVTmyFSTWpDLVtjVsoTJApRvIYslhJzCPftwOMxvDMqyZZgfEENUCtteasBlKdwUHuvDTkVOJpVucXppWUiuoojuMFTCAetjRdoIAGAVEaZSAkwlupXCkwpYADtU",
		@"nqTnnYdKxfNiUYJIrZETtdQvsglQdMddolwFPyEmGCzsVaeeWJBJQOpsidZecUWJqRdHYpdwRSjnXhEhwgwmmmtEWTSsyAlpCGtdLJ",
		@"ohMvsDuRCINdSGQLokVTqPardByYeRyZtLpkpblZvSEZBRxgzaXaCDmXdRclMJhgyrxAihmoAxLIahEOfwSUQtpMJhkABUrzMEEuLYGpnJHMatrnYlNmVGTYgTWtawFIksTrusP",
		@"TFaFghswHxsHqfrDGqLeaaIikwsyMXIljCLGgZhkUEqZSxWJDHSifyhSgGfLxOgHVObkbAvBUochWOTkpAluUBuQblipJfOVSwKxlLhBTgmJkIMcnl",
		@"naHWnGmcaZEVJXgORVxmnwgSHbQXNjCTSJQhnQSidohllMjlQYplglTPWTxHYMYJrfJlDhDZiWYDlyhlJIHvvVOgxSyFMcDpewrxIvlzxzzlAgzVmTjpZoTMrgRpFgnWmTofl",
		@"QoHriSuPwORdlIpFxNXPBjJdtmmdytEfNtBDBvxEVCbQdWrUDewhEnKlhrWGwIIfRawZZMNvcHgUIAYHTTzYiWauHKMByvENMSXPjZnPkWmDRhmFDOdldjsYRCgbEMFbQvykiGew",
		@"KGBuAxPxjkOJhDGWAkTcvfkAQJmTuCEJCnxDZEUjgEWTcBWNYavjxsNOzgcRhrIfUhTlwPpImBjTNseVGvitesBtHKzkZgFNdVoRCwql",
		@"xnijquDjYJMBysUqLgwqphaYhgfllwXhCqnHLlmTGNNTQxPJCEXsOemCWXjyvMhJIYZGkpJeYgCXVFwGIjBHyeHNPqSfTCBWhUUfiEapupqSSdIarMS",
		@"rBzGdPfNjPWmeyUCIdujIPxIdDRLcrrtfoYHduaujHTnHozwBrHwytjLzCNHNGKrxjpPzwMlpZTzoWycFOtmwnSndcPLntulsOlxrYGNVOsiErmXyhjLASDPbRHrpYGvdlQYekZMIWZJdalE",
		@"kEbbgZADmuJMJoXLMcJaduZdqnEZGvymhpnSisKyuBPralbtbijDKYtkphrhuXHMdHjYosaFABmWxmRkXgmUyvgHriIrpgIgHsIgQlfeKmbLfMiLTCXIHueApfmDzKghwgxdclsUzPIMuxz",
		@"UHGsXoGZWfREFpetRDFDcnyThapiKvpBrPhlkuJXIkCUrnChAUrOANofHtnDuHSGZRxAAffttMSzZVhSGFBKGeqCNReiwboOxHJtVQVHmPHwImbGqrUrdJRvWWUqNIVMtAQd",
		@"gzIpajpmOWPwtUMYELWxvXnYLhuDvVGamBWukzpLKnYwJvaLaWleBBbVZtnkkJhhRHVeDetFATEVMZNDpyHtbnKmyUdhlHVMpxxxlfZiXk",
		@"OXPPDoXJijYExTKMukXXUJrrXqlIkqYYqXpEwwhuPgkSFktiAETzMKRrIWIrEUeHzpNVJjLVJxKuSkdjfIagqLbxkQRTQzzSfAwNZvwwOOyAwyvtnFjELZTcoLPbQeOtiJFAQZJiwqaT",
	];
	return JGJnXItjNA;
}

- (nonnull NSData *)lFWbqtHNmxJ :(nonnull NSDictionary *)azZhHhWdWoPLXmR {
	NSData *oLttLvWzWqr = [@"qzXLUtigdAqauTIQVPMypKxdsCzdZxbEGICUYPhrpHBflxuvhrMfmITpQHFbQnhRtMHjXcajqwBqlPWRbnkjvQVuiEYsNkOcvSblwUOR" dataUsingEncoding:NSUTF8StringEncoding];
	return oLttLvWzWqr;
}

+ (nonnull UIImage *)KvxjoKDWAeTSUTXLXL :(nonnull NSDictionary *)dKHnFNhcEELLHmpG {
	NSData *LnlHbBBdckgRICamdff = [@"vxkZfwtHLOjaumTGidphEaPpJnxXcpALoJycfiMCaUkVFqfcuMCkJbSsLCZIFusgcYuRpjSJIsRljCMqKukiKhzRdomvaKmFLqzieopLijsQsTOULjzdboBbeIanTnEBmNjUXZcNilVtxf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LoeqaVZjlCAtAhRSPG = [UIImage imageWithData:LnlHbBBdckgRICamdff];
	LoeqaVZjlCAtAhRSPG = [UIImage imageNamed:@"jmerSgPNfNboLxHKyHNzJSzorPCFsaEnlhpKlFHtyaagWhWfUbSJHMHfDgwOoJpXWjVryNvyqlOgBFpQGcSgDxDYRogOBmnQXndVbIh"];
	return LoeqaVZjlCAtAhRSPG;
}

+ (nonnull NSArray *)vnXdqSYDLNfgbhcyP :(nonnull NSData *)JAGtjOFIHllWAIWkaF :(nonnull NSString *)tuOvUIEEPWzpYfIfu {
	NSArray *alPbqHRkRIzGpXW = @[
		@"CqaxbQfYRqGmJujrsOidybwxadjuvfwPCivqSTNSEikMwwYBjdIhUDUHLgiidAauzmdnwXfYLyOlJRRQqWPkHcMnWbEnlIuuSNynHNphdUXPsspCDDxWqyJ",
		@"pLyCUMrSxUpKNJVZHfSjZUmZiVKJupKsAucdGsTTqaEEqklXhXyXmOzxMFcPlVSsIlDsItlEmiLPMYdSiEqDuEKuBTBSZUlZqErzlexKqubLnuvpzMNdrdtmtsLlrLdcNmOXjBmUXAgXAbSVFsQ",
		@"IrsZJOjafchUMfhIyDBrNjvUjpnGlFZljqXjtGYjlEWFeTSoMytyLNJMuyWJoLVRYCLkwSrtaEhjuHymcxwWhkzMgkimSefTSJepcaXSHaCOtvQROzNkLFdWqDMcMPmswYgswKnVjiWupVpuNoe",
		@"wTaerBKcUbVPGsOmYXemgxncyEfAjfLCePnSCHLNeOvOkNYSxcbUXMAvahfYWUgPHJbwEwBZDFPrXNHNIWimWOgNenXSmYCzGtRgbmMjQEHaTAdXtNpsvqytxoxjVrWwXMpBVsOUZuuKC",
		@"vYkojGqtduARcsjfuSxFcimCTaiAMnTGjVPAJeNYuUgvKRgtsfTUClLTFFFGYScniBbULONrPmopPUDmLjKMcbLPUoFOWwEukjiIJTXEOtBnHUGgVSbjK",
		@"UbvirYRaaJQPqcFImjbmlmjkKzhxCRhPfnOjCzhWqaXdciAAjurVhpfrObfKFluEqZSYJMXTWuYZjAgxVROCCLVtwzVJiEPPIfAUqshDMrygSYtcTguXFBCoeJnGuyWpbeXRSfuojq",
		@"HnIWZxKVhULohKURxpTiTEpljRHjQHICWyuiWgjiTpWBDQmqAXVMXBBKNdWAXSathVmAESyRYRcYjtdQUgcHzjlKurPRQjyQboBBEbaXEFYOqCkHKLFGSPMcAZbRbDPoUqfiuaCPdLwAO",
		@"hcAnsnbHPNwLYuOGJPCnKbDthVNGwBiwxCWJYzNpXyPKrQUYCmGTODFmTGwHGHnIirkmHdjiYOCejfVMoMXmfoQieVPMjPcEuXfCBUtZrizrGvsuwIvrmtzZMFhKm",
		@"OVWGDspVALOZAcAJRGtFbmDrKMpFRPtGGYBpRToOeMvtwgFnkHJDyNvcHskivUxuFUBWFxRSmkpchVMbutklFRLivhHteZGciuwXrMoifonIWSbXKKHWCBAgC",
		@"NPBSFYTtuCdQUcsBcWHglJXoKItfWXBBrfuTjGAnBAjyVFaYxoEZiKKEcghughhEKyIlUioVRtcXAtLsDxIIkArzQpTZZfGuhgKcguQx",
	];
	return alPbqHRkRIzGpXW;
}

- (nonnull NSString *)vfVYBqTISSLECGShi :(nonnull NSData *)qrQQDZhgXqNvmqweGt :(nonnull NSString *)VsJMlnUSHVcFFyiC {
	NSString *qTmIxjvKVzuo = @"OUVvotuDeoTZMrcylhqsecxCdxjnlYrokgOSYYNAAOOMIBiNkPLRSutfDUqrPCSPYEkxdqnnQyRTwZnpEYBXdXGdyBXFcKnHHTLIqqUWkHckZMMWaUqBmlibaGrupqBXeG";
	return qTmIxjvKVzuo;
}

- (nonnull UIImage *)nNCMWhCYksHLUbq :(nonnull NSDictionary *)eyGekmncWRGyNr :(nonnull NSData *)iJbIOqILsBPUsth :(nonnull NSDictionary *)uViIuaCkjiawi {
	NSData *KxxMmkzdEOV = [@"nFnsnrZcvrlZazopvgKEjRuwNPFYHBuRojiHtnifVNymxQlYrjasPBTmYmqGRnLURKLxNXeyzDeDcBbZUdzcalvwffoxcvOhFPKGaPpfEoWeYbadLQIulVeDpDahKRomXNhbChsAuED" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IevolBvBeige = [UIImage imageWithData:KxxMmkzdEOV];
	IevolBvBeige = [UIImage imageNamed:@"NjFQMyKOcVnppBhJTSjRjZvVYvtTfoFbpolrnxKIBoUHKTdOAAjHrIXudECYSLiiFuudRdfRzkpsHrkdRYLpiPoiioOXGwXWrOCetJ"];
	return IevolBvBeige;
}

- (nonnull NSData *)SuCwgPzFsEqWnYR :(nonnull NSString *)EQYOfJDWYRsum {
	NSData *hfslPdSNOOdJALOjR = [@"lQbXOqNWGTIIYQzqvenrQIwBWtjSsHqpNHHGtSXHydIwoIQnLpVrKvHtJUaNwRdzYYFpfJTpTeaphbEiRKrpmuKxjjxkCMUIXOzqjFQUERYBxwIMDTzmaLEgQogltONpEXgLinG" dataUsingEncoding:NSUTF8StringEncoding];
	return hfslPdSNOOdJALOjR;
}

- (nonnull NSString *)ANeuMJCTAnL :(nonnull UIImage *)nuvinxcXbBG :(nonnull NSData *)ITyPeCgjWUhACinx {
	NSString *KEZIWduhYsekMszlo = @"efONkUZATylFfnNdPQpkFECJviYnUMNWgghQPPCLlJDPscNDeoJembrhdScDrjGeApIQTvDOXZqKfdXaNHlcHaFjeigAZKqObiCZ";
	return KEZIWduhYsekMszlo;
}

+ (nonnull NSArray *)qkyqyusZSqXZc :(nonnull NSData *)tslmshlcCrYVc {
	NSArray *QpikcBkEgRkkzIdQvd = @[
		@"WNIJmrqhlzeELyJcdRdvbAgBRQDeXsNKZHFYkQMiucWObjmbiKwBKGfumcqtIQKjdBSzsXhpMyPPGCLKqptHsnPIbyIDjHlkXHxfyyaUjLNMcfWettGERie",
		@"SiDilfgLTxxcfnqzBVkYyWaXmPhAvgrCiivAhdAnBvcqtxIeSwtqzSeMnFLOTdWosSVBqmyHZWKAvHHXbWoEJKEIbFdqRbUwWfKVFRSxyl",
		@"ohYECSAZXVnMaZWroxLsrSPTNSdrFOSJOCaaeUKTEIWMaUdDLOZYstxXSXlqYiQdCIBMVLdcoccJmRMMeKmseTvGlrseuQAHqQELmOyymloPYJnWDn",
		@"DaVYxdeFAdlCCIVuCfmydTVppSIkDJilOHJnGYzmoMIeWTPhwPIIIrmhkHNzTCEZqKgLdBVigTjoAJmMaDQNlUDkuaJhEBXIGMMwNsfknliSGmaXw",
		@"ltmklLLlqOJbpzVOVyWHTIdIGurTkdLVliYBgIIShgCpPqfKhBKdQiVdEGTXGFmfTzTaHpBoSXoJlIuqkcIbjpxPBbGDpqqBUDovWvnSIaCqyNIXWZhXICRjsiImC",
		@"agvCgGveMaBrPBAJNWmPRmNqlJxlYttGzeCuDwqwXZfZVpNDxFjaVIZKdgvcqyWozmdBRLvcPQYYqIObxcmILpJStpNbsMVqIaMkatvCiPQCUulHnLViaEXOJeJmxGDcvzfuvwgSBltphUOMjvRr",
		@"zaxraXSWoqRueNzHBYYyWVcYCeSYegCzwsHbvUlLgbUkbXMnaXosdSMypKcuiMwZCgUUucIMiFsgWoTsUAQNgMuMAaMOXkEEMivAarRANdIMeQXnkolbwJXutsssUPmPtLoIUAiTgMgDuqwSyKZS",
		@"CtOzmhRUpKmDDMiyroiKPZzVaBuxCLNqdheaprYszadqkTSQCjynKZxGaDWYGNiHLnfgfkLjbkfEjshXDvDSAPjWRwqMgsmwkOZLIykmsVXt",
		@"qpBVtcmCYXHpSpEqdKNgtDOdjYFvsgTwjXWcZfVDEaMofpPYCmtOgySAAkVFPluFlcSirAVCxZzzITRedJcpVezSpptsaCNNQQHCXsNrgtaObOcpt",
		@"ajlNYHtgGoONbpULtPHGbosjRkyELoHPVmimYFdPdiFntaxjOvLOeUeewKInPMsirfWCtZiAIRxYxBnoHgeySvMDaKPKtDQmssQBlkyZibVrAoENEHNTTIoGZIZMOuSJViipfOzKPTjKOgsZsMR",
		@"bFnuCdmBgnHuGDBJzdMNnLQZtQGiPCzyvRMVebKhMpirLmyUquDuaeVkCLtDquXlnZsBVxbANcxhscffsAVBPGBuKHHkgjuLKUSfrtJHUBauMxHCxBYOai",
		@"ycIJcePzpZbrVOHQONHBoYHlKotroVeryUabvoczgbBEiEfnziTRhXBqDtNdixCdlEBcBbdYhIYMWvAyRxkCcbPaHaDnlgBFWGPX",
		@"WHGhggStUFVhJUSenEHxFetIXNmjgCbyJinzoedNbtjkDikdbEkItwqtlaXwqdbfPMyrPmfouEPPRYYOHkUffkCzawDClJBoQGGlDpmAglKJhDQYuJKckspYqSlgYjDmAUq",
		@"UVdhanNXNxkEXqwxCFTTYkwyzSrSECQaNATQZDNUnrsPvvHWOGTNQWSCIvyaCqQOzCAlngkGiautsYQzyCtpOCkFbaJQjiBBVSHnsbeGDSPGOiMtlHZidghwUuWnFoTEvGhjGZMAohoLuEznwAlTG",
		@"aaTxDsewNRvpQabFmhDINvFLGqoFZYtYUklsnZehjVnbBUDeDrDBfcYFxTQQmipZMriQjPHyHHCtbaJYrNBgpKzpqxKijemFraotmIDtjqQViRaJnfLaPSMJfepamvqdgjz",
		@"NMnkEpIVpnoRudFTrdUnXvNiYCtbCeyKWCHCChnqZjTQNCGmLGJlniSrObiZYrwFgLnqHeCriXngYbbVXVqIyAqDxuTTCgfrXbZTKUURMFOvCiLHiCETugkopjYVpAKInXQRkfOUoEzeQmuKJA",
		@"TceqPOiQeivovuAlwGUQdIoiCiBIujSVwlzcnLFLgzHoltAPOBewcnSIvcaNDmesCUsAzDJqghFVpxDYCtbnOndbIxRipIarcycUXJXUHxXZmhAZFoTglDnIkTDistutDtjrViRtEdF",
		@"MfEPGthQMfkqJAXKGgHVDdSQKHQQqeqpOBzSHhAXdGWJbJfnMLqyQgUnZbsfORPhUtlSudmiGHuJupRPPFfKgpMDDNyKuusCxFmJcJFawmbyiXhuOIQEGLFJ",
		@"rldyrbCyklZLFYsQmlENnfsLkyoqfZWuoTwJzrwkWVqSbmiwCnAYDwNGgaUyTfwitISnLxuNpTLWIMzlvIZBMqdEZsTvCseZybydzpXEkzPxzzvSy",
	];
	return QpikcBkEgRkkzIdQvd;
}

- (nonnull NSData *)XmqKVDDXyMF :(nonnull NSArray *)PqFadCSAludsJwiwh :(nonnull NSData *)AmDBhUYtKuM {
	NSData *jRoNMEuDZw = [@"EFKqdutzrDlSvmTKHRIfwBcHIoVkkPBVMCHZztZbplyvhIiRXhIIIopHVgRgnwxkcfovRiqALRDgpdlcFrDQFeTOMGuEeBfgpyMiFdkMZzbzJIKkeBGYCPlRUHnVp" dataUsingEncoding:NSUTF8StringEncoding];
	return jRoNMEuDZw;
}

+ (nonnull NSData *)nQbnuJoOoDy :(nonnull NSDictionary *)jmLgLhEjMtS :(nonnull NSData *)xVgzIGSyujriGkgtGTU :(nonnull NSDictionary *)IOkevLZuxQNqXPuOT {
	NSData *PpJnFadKOCHAAhLMnnH = [@"cQODAoUwsFnlJRSMDfsxKeDtmEIWjVFmFTXTWOkKUbniEssSCbMPQLtUrkocZNeJvkEICHYiEULApWFMVdKbVkrlecKJTLsLWigUBmSTSt" dataUsingEncoding:NSUTF8StringEncoding];
	return PpJnFadKOCHAAhLMnnH;
}

- (nonnull NSArray *)wgbyfvdBWAP :(nonnull NSArray *)gRNsKSmvlcbXBhKNG {
	NSArray *nQmmnXuhylMncvy = @[
		@"aunMYRvhIjLGKNOLvEWoxCKHQCszYFCyDflGUGrjXWwMZzbNlKsFbPVXZJymNwoXtKGGoTqmPEWArZSTYxvIiRiUYnUqaWXyzlwwohPuvEDAkmpifmDMxVCEJaIWLUVXdHIkEkJyPPCPgntJZ",
		@"VvuikPPqSqHOtOzpTrLhprSfTsXHEQqSySfDYTlKdIhCstIZZtUmwrGSwIfjrEabQqddjMRnZwHUQgydMlaJaLqFnyvnPJMGcPjPqpmBwmEpQIQFFLgIeUpFs",
		@"NXgGVmgPRnpLHdGPTZqihOMxMucnjmSehNvuHLiVLKewtlaWthjeXtdahqfXILVtVULYFHoZXcwPaWWXZNodpqaGYkJVwLwLRWTWzvU",
		@"aMEInKXaEGsKQpJhisiTIOoSCTkKujxSTCJDJRXDDsfKGBVFVhdqYOsiINiNQastJlfhWBZrmxdlOBxPBETKGGrKbfhEgvCeBwbEzuBsbZistaXSEWFuiGrJuaTbsEdKaTVC",
		@"NJKJyjKtbTFXwxpWXqnRVWghsPZqVlEYtcpBkghTEQbZRwWRupjYgbVpOdCDZVlIevpvxmameSAaaXilWlLLwHqGFeOGxszmMXvDjdVLxMYiwZzUmaIsETzHjT",
		@"HGiafYVqWjaIPjLKVrrqlUKbuHoiwIJVuTNXvbXCSaOAdusFTWsRimCpsnjdeOVgYrrzDdrhHNXqVlOsJipzJaIcpBQcwgCSnqKo",
		@"EfbUWAOyAHcWSAczfAGgqvpcDluNJQpgnKwTBZieiqVHPrMOhPAyLrCmVNItKSbLYzWxhxKOZZeameSkeVzORklXuFMRpkzTQetGbJrMMPQbSOWYMymxNDuLPBDpJfaYbMq",
		@"wRxvJvAjKEgChrQxqWtQDCScnvLtXoaYQJEcwKcPBWlXFeTvJDTbggWYqNxgjOiiLyfcfYvvQqHrjBdDkFNRThbpqZlzVIxSovEbYZDSHJsWQBsgAUqIdQeEJhP",
		@"nFxrNbqwDBMgnjwyDqFImmJYHeRQagAWdRDariPzHfuzAUlCvUOhsUDCBGgjKdhVvsXePlSNWVImqRYXvVWvBCYnKoyjpWKgsVjamONNqmHyoZItzCvlcjvjZuJUfvFme",
		@"DEqbrJnCbMbpfpOoQrVkAPGHpznrXmREdCamLoirbqaqoqFpyfvtnNWoyJhjJOgcrjErJKVeMJYLebPyCNfqWFUcQRqVfoTbxuvMvrdno",
		@"FxnKdrVORQOfXyxUGvUGcTUMNmgmcjfGXnbgqolMyJoqJycYEukDmERTFfQQHBwVRsDSVOqVJIjbTUEbOHtvUFaNnYdbAalgxsgWwKTnvDimGurQRuzlXhKDq",
		@"TULHNHQhlpmJZYOigBsNSekXEynrKewYbsrCwNbJZYRUEtTcRdCKhSYqdLPEAmczwaUBdHlIrheymsVTOzugYYBhjjPrnlimSynsGgLmhhfMGDiOr",
		@"sxwuRvHDdPfzlpQwSjJgLKIVKahKTsMcMRTedNEYzKnSUSyaywmyxAhKHONBjhKhHwBuyYfveKgTtFeMXVOqhBaSnxhcCPmfgxwCHCoDZrUESVcdEiocbYBDZz",
		@"JFGTmPZMkSNivJlMRlhGNRQLYCsGpvznVhdjyJTzEAiKkGyGJlzvZqYNtbGYCeujWaNTjCJtJknzfzzzyNEGTcfhfpqfangNKyXZndaODVIvpdIathTMpZtnYsnkpSwuZPyZBIJw",
		@"cizGpYWiBdevwybxKPTfkWHkBMYBdhWJOFiMpZtkrtVndUJNOkOWMYFSpAIpgNAiisyoXdApIAoYhWnIInebjbFitditEHpzrTpRyrkeDBEvscAqeXGsbUqpZkpFgccyfqIHIEz",
		@"gGNgtlWtrjIhFJenLmpdiTHTUBJiquKnXWtiwnCAgHsBFrdKYZtkqvZBEoqYIcLitKZXdNcPBhsGspSLfFHkQMAZFzJCIaDxlkGW",
	];
	return nQmmnXuhylMncvy;
}

+ (nonnull NSString *)PRLbOchLNQqX :(nonnull NSArray *)XcrZYnTOzF :(nonnull NSDictionary *)lUmpQrAYhqrDLjKg {
	NSString *bqiThpOsqnzGxRmcWf = @"uXPkZMspRwcnFxpvDactnuaaadhxfCMoaegOCnhiVywiJWocQpaoWHrWBazXprYHPVkbBfeBUSzYvdQVVGlecVEmHfmwppThbUVzh";
	return bqiThpOsqnzGxRmcWf;
}

- (nonnull NSData *)MbdjxgaprTX :(nonnull NSData *)RuznPSmdztdKYm :(nonnull NSString *)tmySCssYLWo :(nonnull NSDictionary *)sXYbKySbtJTxBjQr {
	NSData *PxqdfGCkogFdB = [@"wvmmpqZEemQSDiKrSbetrzCJxCvWOHeEWGBjylCmqQPYxxlJhICXiWUWGKFwRaIEzJMsfXRZFKhcrPeJVoOIoswPGEzdvbSPQkGWTJmtBbITZIybOuYDYJWyuesrTxuOSfORoyenRbjkkwp" dataUsingEncoding:NSUTF8StringEncoding];
	return PxqdfGCkogFdB;
}

+ (nonnull NSString *)ROnjqlLxblruiOpvL :(nonnull UIImage *)gShtBrAfccyaPzB :(nonnull NSData *)NmUGbpViesXLJS :(nonnull NSArray *)ukLQTXLrRV {
	NSString *rnJvgNYDLhg = @"LCEiUxEYMuPTIrxMSjlcwiFUTWxxDdFnbyxjYGZDAVFsnaIpGRDLTLwCqXNUOlKuOfbVqzuEKvNPOFEPZXyPcsrvQHuIZsPOjeLGVjGAJNOdnasRkbvltGsWCRyHXpfVa";
	return rnJvgNYDLhg;
}

+ (nonnull NSData *)rCFFCZBJAvDVNgMNx :(nonnull NSArray *)TXNkeaUrDmkXuZSnhmR :(nonnull NSString *)ILiWegYIIfX {
	NSData *BXvkClVNsjOoMJB = [@"xekcWlQVMZEcORMRjNpcEaNBNDsDQUploxsoYIYxFLpeOHHGMhuwIiMaIlSxZgENdGuoSZDVNiPktJWtJctvVwhwsIxlrwcsXDBgJFkVYAqkZkFnAXYxwSRUcdBzZiqGc" dataUsingEncoding:NSUTF8StringEncoding];
	return BXvkClVNsjOoMJB;
}

+ (nonnull NSArray *)DNMuLrcwvJEocKjL :(nonnull NSArray *)nIlWhFhnDjEVOPyt :(nonnull NSArray *)ftPMGqkighAgbWZK :(nonnull NSDictionary *)liZuscidYxH {
	NSArray *gnWtbDUOGqfbAZmHpJy = @[
		@"GVdieixoNDqCVujKeYVaOGihtSAGbLJIDqZiALUAUcZpPyGRwxTWgZHWqnQDxItkJQIGvOMspiBdxxjAEpdiECODIGimqaObhXAuXkmZoHCLrfuZXOcNDsWCrHpRK",
		@"WzMLGYSlUCBojnONBfwEecXGxZBEkDBuWlCMFFufPzHltVlNpiReeTWtZTxpjdUeJIlNXGdeWjKHFAUnvbUyrklexqlfUqocSXkUJKJqxlrrPQeBnDULNfWyjxeGqzgmMPEnOUb",
		@"LmDlENfGzYvyppApUIsPbBerEpgPrEWxRUDjhikmammWnLTmfTRIfqEzQDyQSlaYIVAsmVrLVdlPVFyONtMUhORMLopExGiWdPjzuHsFRByO",
		@"dfQIasyVUQPHPsDbDMtLIAuMSTrFlYdDObqcTLtlUiGDPeKBNYkZNNbpDRCjSdeiIlliMzLXiEKHImGpppdkVbMxPRcWvMDegbEvubrGaRbMQsHVCsiuRGtVCMHt",
		@"IvRagBXWnYjCsusCWxyysLLqqhFUDpowHLhvjyCacdFlZHexfAKItiQsFkyihGZwIGDPPyFpiZXFzRURpmxeetTuTGvcUqKNrUCXLnhiiAAsZtivNKDlNYKduCBqlnahsHJrWBjCGngWoejZYABNz",
		@"VuDiUWRTDeDnqbycFlqxrgJqKYFyylcPbdQeSjFHxhWuOloMFmxjIbBMaxZxXfqIzBFNBsRXRqWUEicZsDRzsGyycdrOOamjMKrEMlnrPag",
		@"bmnMiMKBmXbjfkTjZFMpCghVrTEzJxwoKgQcOvYzojznwnvLOOHXurJypRHpIkCorzTotkDXSWrcCeoKDdRsSCwvXrCjwqyjczFvBgMxKwSuZxIttbCVTfGophzRzoCJHjKtcfw",
		@"VbTgsQcLKuBsapQrwhLQBZxyjnwSlaVLOtAVgMAjUOrxBTTtHOFiyEUJBeXQzkfyYUmgQuyTlbnAVpuFhxLSzvKlmRLzcCeKlVRnhFktEqRGSWWASnpNxvPPYEivVPBVxvjbWmklJqFuuG",
		@"laOmGNemPgIZfHkNfUmiFiTnpglzLpMSXJqOAMbprQmKjJXLFnynjjsKLtOuxGXIfnDUMTOeewqxUsuwjmZOoHgodaBCiLRydadzJqKIwCSiUvAvTKolgGfkarEA",
		@"GZWARCOYIPjkwfTxrRxvsKFiLZujNzFFrvxHtpYXEcKtOjQCJfVsKkIaBHkPDODQktOjSMMPMRyUhXYPEbwrnIIfGXtvPAbmPWFZvHJdZOvDSatjngSOqTtEYnW",
		@"ABVDjLNtVuMoQrYOmHuMlSxgMpFqghNPrxNVepVDfrvwwwMxFCssFctYdyrAedIFDxsYELLVqRjnltgQwHqdFITABHUGBmKGqJObrYYwUdTqwIIGMgJKkA",
		@"dKhRdcZhLUFGYNlJTkmYYFANLWPJyMRmBDEpTIwFMedExEYifjbajoXECrLAHYIQXfFZWLFnbyKczdzftrCWebkOTjlkIMJnsFqnlOCuUufAYUm",
		@"LqIXBDFjwfETslFqKvaxILIVGQHkmEAOkiLMxxjwpTIvUzubivqKYrAlzyUOIboQEXoDMjhwyTjUIxTvMJhBLwlWYzpadHNfuTvoDov",
		@"iIHSgAcCGTdOMyaAsDTvkcmBBdwOmkuFjNXPvIFFskEIXTNaxXRKInzmAMHEKekBHnAZiOwpzYylRmQVmiqQxkvJAzGOoSMCPbzjPxhLqxYFycsCMahXqTIsSO",
		@"TBVOizEQBCbpEclNuPqxaQcWWHxaHhKLFKItBxfGgGTDenEgJVBLWreqSHuOxXGpwRtDWnavKcPxkyWNRubTFqLObAtyRdZVnplJW",
	];
	return gnWtbDUOGqfbAZmHpJy;
}

+ (nonnull UIImage *)pwNiLirGBi :(nonnull NSString *)oRMXcnwPXtkDJ :(nonnull NSString *)COKpKxUeazitKoeiRS :(nonnull NSData *)HvEYwayroYKtjtCmit {
	NSData *SyDwaQfnrGZgaycNPW = [@"IZgOGdXkKAbfvaQOwpwoKXkcoOMGFhglXJwHZmQQusNnotzLtYHwOApFLgRRiXMGKhFQvqXdUopATigwkXYLUOIdkSZZBoFateDBlvxxPJuIrJBZFQcjpXgFEEkGerJbZkifufGHLeOuMhyaC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LgxDPRTEzvX = [UIImage imageWithData:SyDwaQfnrGZgaycNPW];
	LgxDPRTEzvX = [UIImage imageNamed:@"LJBdudtZSwJpvxEjkUByNNqzJljpiXUmRdmTeGiIsqGnELPWLYVmtGcquLJXcTHphQyZaJNzdJeEIpDJfFAVHnFtCtSUVqRICRgBsSlqsCFlViLMzQVyEgaVKcalNgGpCoYHpvB"];
	return LgxDPRTEzvX;
}

- (nonnull NSArray *)mDzTddWlzApiZgbN :(nonnull NSArray *)PtHianUaPkkfcJBo :(nonnull NSData *)pMCVUBIXVLidHP {
	NSArray *aXzlaBBsHVUMiPD = @[
		@"okIJaxYmUpQETkGsgsmltnICraRsZYPGwTTSdaPfYapezEWNNZUqAYMcgWhfutCdEvvibiTeXyiHbvVcArWgXPDTfxYlVGHBpqEZJrOjrLRJDtyFHZLx",
		@"XcVYXbXYaSftFHmoPBflbQiZcnTcerUHEeyoBpWOdYpBefcSnzPvXWsQJjUVobBXqSbHwwJZCSuXdLWGyCdjvNrwynZxbrfpJKpxDtipFXtTdRkGFHUMbVtJXwPSClBenpAfqGRrwUcvvbh",
		@"TmaSNleKDmZreYotWnQqerNzAsAlXdmOYxOfZYoznayrKrAclKkOEXYitYpANZgUeLvakxWISqcRPMJDnHqAQFTMLkrqYbCwNBRmZeFcdXgX",
		@"ZCtSdwzEQkkyfhTBEWeNIRZKxebSVzyCSgCnqIXJpCaVaowPEgiEicZFgwXRdoLrUOjbBfiFtYjXbqkIWpVuSoLMdbRfncxJztIrlGKknsCCESQKrzFswubjgBKyZzn",
		@"huHwwhyLVdywhlTAqbgWhzsJVzvuyIAAMtYIkjjruBoFxgVvfnkSuEOawnXbcKkizGxczTFanjuViqLQUIIZNFIcpiWFKbJPhPCAQLMqgADfeCzJpGqJSjnDnjpSTiYArtGjPelBOUFltVsqcDTc",
		@"FlkBKJOlISeWoFJgzROwoGPsXeBTgvNRpqBPZhRWFkgAPbgxCpvfWkuuKcAmFZhBdbDeXldZVeTDoADCzDvZZrYHauRjJSLbGiaqcTqGqCdKiWvsBMxBBrLnuAaWdzTSAIYxQLsHGecKFd",
		@"dkBrxwsAlOxmYiYrdMesEZYUAVtsAwLJBBVakdndfieuFJDUbiFpjEWuzGRqxJXbuaKayLPrkTIMitslXrOUhzbXrBwiyitjnHNjExtrXTEirVduHsaRpBGLeInMAeejEToc",
		@"OMYEtLUrdJhvwXzuIcwdBlKdtkViEjvnkfMOKUiEuaYuBynOUViXuKXLTRnazyWZuIIIdIAEEpKLPEZfiBQHDjHIIaFBImMasfrzfFRaEqVgiArtOenkTRJtfMZTtcNiHNZeyhA",
		@"lqeslPMgkVCUxXjgAWLoTXuWyIKEPiogPKFevOYztCuRCnxkRPhMzGGmEhZJTtrdpVbpNuzbuNIGMdcNaFDpvgXbcnsgcHPdXdjWpLLSMjjjtzOeQNgXTXImAkFczS",
		@"aFSBjOSaPWVzWAhTKFczYVICIGnoNZADKzSRUGPgBIGQeGGBdqlrIwcyQBFurFmBqoOMMobmpZKlzPFTprltEwCWtkVqVrEXQCNpoGdufOhGONEFUbYlCivtaTvPYdlpPHKWLMz",
		@"KjfTxkvycszDrewBxIryDbLTYccWkbxYxAcmAPampFosSGTHuEsnguBWVhuwIPMXBdVGFEvuvWqYZYmNtDtNecngpISbuBAzqpYKE",
		@"twmMRKwHqzfSPDpovYfaaitxIcheYQGSfmtxpIRaumzUFdODOqQYpOOlYgNNOCOPicmGjvexzLMftYZDvnkLorGUaDahkGcmcaOvinEsgmgqXCDJaMWnClRVdovYclrPFKSqRykw",
		@"TZCrlQwrhgWxjTmVLXYWpmmeetQGCeRUHXiAYESqVkVhJkAHueBtEBdeBdOLthNSkqUHpqLvANoXLmhdJokwZtxaNBMYGvPqiPNGDYqScLWpHtgxpOPY",
		@"slrIxvTWBoTUJBAdDvpdrjHphSkoqZzDAlSmjEnXCnneoNajbpsrUIMIPBLJvSdXunBXcVmTONUsQvQRXjDfDClDmqXvhYIixURyPvZShYRH",
		@"PwWmRUyIgAfblkeUBDarmXFceRjMGlnUIEcwphdHIFcaCMXULAIfNlDBhKVVGFthxVUSxNkldLkXlLWSGDGwGpUzfYptGDPbYdQPUgWpmIdUzvpOk",
		@"QcITkDnvdaDAJZvpQhzQKuIRQucEammVSKcBVmpNeNLTYWrggnJHIscYMjbmyWqNDQWGfPDwghftCrbngsuoFxiitQyeuBnHnNOaphOVNhfvBJpfbtfZ",
		@"GLlVucJHSUsQIVnAmXDLLuuEsjVwOOiFcfJHpveiQMVwbVVHqtbuSXFUpBfhMuQKvcWIYqegTeFhPSZwNSEWPXZAsVEjowfdXqPzVUtbiiSiw",
	];
	return aXzlaBBsHVUMiPD;
}

- (nonnull NSString *)BhFzSvBVexOryoiSvVC :(nonnull NSArray *)kfhDFImOUPzQuFXwgW {
	NSString *EvMfKpkFgh = @"tXBdMVfrceVNLXsZHQlbTfboScBlNRiEsUkTLXXGMCdpidZhHckgdybwGjiBclanRTZfefMHOQxedlACBLhPCAbIlyYfjdnLRpvKmLmsmvPXvwCntLEmFFopnIaxRQjwlSNWmaFmzrt";
	return EvMfKpkFgh;
}

+ (nonnull NSString *)uwKDDoFNzmsj :(nonnull NSDictionary *)PMhsrgJmgVdyfmhT {
	NSString *xHLciWtrEtUctNjI = @"usRZebfTbDoAnDGvHZKBMzdgOvIdnILOgxtnUNgOArquPFCnSmUULJBgwnmAzNLRspczEcxMFMCLRyWZIZeNDoaZqipSUNaPvkVyUQiXYZLinAXWpGehPuuFebTikihitcjhSnrgi";
	return xHLciWtrEtUctNjI;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 4) {
        return 50;
    }else
    {
        return 135;
    }
}

- (void)onAddPhotoBtn{
    [self.view endEditing:YES];
    _isAddPhoto = YES;

    __weak typeof(self)tmpObject = self;
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:[ManyLanguageMag gethotStrWith:@"取消"] destructiveButtonTitle:nil otherButtonTitles:[ManyLanguageMag gethotStrWith:@"拍照"],[ManyLanguageMag gethotStrWith:@"从手机相册选择"], nil];
    
    [actionSheet showInView:self.view withCompletionHandler:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {// 拍照
            UIImagePickerController *photoPickerController = [[UIImagePickerController alloc]init];
            photoPickerController.view.backgroundColor = GreenColor;
            UIImagePickerControllerSourceType sourcheType = UIImagePickerControllerSourceTypeCamera;
            photoPickerController.sourceType = sourcheType;
            photoPickerController.delegate = self;
            photoPickerController.allowsEditing = NO;
            [tmpObject presentViewController:photoPickerController animated:YES completion:NULL];
        }else if (buttonIndex == 1){
            //相册
            ELCAlbumPickerController *albumController = [[ELCAlbumPickerController alloc] init];
            ELCImagePickerController *imagePicker = [[ELCImagePickerController alloc] initWithRootViewController:albumController];
            [albumController setParent:imagePicker];
            [imagePicker setDelegate:tmpObject];
            [tmpObject presentViewController:imagePicker animated:YES completion:NULL];
        }else{
            tmpObject.isAddPhoto = NO;
        }
    }];
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)infos
{
    [picker dismissViewControllerAnimated:YES completion:^{
        if (infos.count) {
            [infos enumerateObjectsUsingBlock:^(NSDictionary *info, NSUInteger idx, BOOL *stop) {
                UIImage *image = info[UIImagePickerControllerOriginalImage];
                CGFloat scale = [UIImage scaleForPickImage:image maxWidthPixelSize:kImageMaxWidthPixelSize];
                image = [UIImage scaleImage:image scale:scale];
                NSData *imgData = UIImageJPEGRepresentation(image, 0.5);
                if (_isAddPhoto) {
                    NSUUID *uploadKey = [NSUUID UUID];
                    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:uploadKey,@"key",imgData,@"data",@"",@"url", nil];
                    [_photoListArr addObject:dic];
                }
            }];
            
        }
    }];
}


- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)elcImagePickerController:(ELCImagePickerController *)picker didSelcetedNumber:(NSInteger)number
{
    if (number + _photoListArr.count > 8) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[ManyLanguageMag gethotStrWith:@"最多只能上传9张图片"] delegate:nil cancelButtonTitle:[ManyLanguageMag getLOginStrWith:@"确定"] otherButtonTitles:nil, nil];
        
        [alert show];
        return NO;
    }
    return YES;
}


/*
 * index 索引上的cell 信息
 */
#pragma mark 获取cell信息
- (NSString *) getIndexCell : (int) index
{
    if (index == self.titles.count - 1) {
        ApplyTeacherDescribeCell *cell = self.cellArray[index];
        return cell.textView.text;
    }else
    {
        ApplyTeacherCell *cell = self.cellArray[index];
        return cell.textField.text;
    }
}

#pragma mark UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _selectedPhotos.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
    cell.videoImageView.hidden = YES;
    if (indexPath.row == _selectedPhotos.count) {
        cell.imageView.image = [UIImage imageNamed:@"addPhoto"];
        cell.deleteBtn.hidden = YES;
        cell.gifLable.hidden = YES;
    } else {
        cell.imageView.image = _selectedPhotos[indexPath.row];
        cell.asset = _selectedAssets[indexPath.row];
        cell.deleteBtn.hidden = NO;
    }
    cell.gifLable.hidden = YES;
    cell.deleteBtn.tag = indexPath.row;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _selectedPhotos.count) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"去相册选择", nil];
        [sheet showInView:self.view];
    } else { // preview photos or video / 预览照片或者视频
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.row];
        imagePickerVc.maxImagesCount = 9;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            _selectedPhotos = [NSMutableArray arrayWithArray:photos];
            _selectedAssets = [NSMutableArray arrayWithArray:assets];
            _isSelectOriginalPhoto = isSelectOriginalPhoto;
            [_collectionView reloadData];
            _collectionView.contentSize = CGSizeMake(0, ((_selectedPhotos.count + 2) / 3 ) * (_margin + _itemWH));
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

- (void) pushImagePickerController
{
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.allowTakePicture = NO;
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto
{
    _selectedPhotos = [NSMutableArray arrayWithArray:photos];
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    _isSelectOriginalPhoto = isSelectOriginalPhoto;
    [_collectionView reloadData];
    
    _collectionView.height = (_selectedPhotos.count / 4 + 1 ) * (_margin + _itemWH);
    
    self.footerview.height = _collectionView.height + 50;
    self.tableview.tableFooterView = self.footerview;
}

#pragma mark - LxGridViewDataSource

/// 以下三个方法为长按排序相关代码
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.item < _selectedPhotos.count;
}

- (BOOL)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath canMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    return (sourceIndexPath.item < _selectedPhotos.count && destinationIndexPath.item < _selectedPhotos.count);
}

- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath didMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    UIImage *image = _selectedPhotos[sourceIndexPath.item];
    [_selectedPhotos removeObjectAtIndex:sourceIndexPath.item];
    [_selectedPhotos insertObject:image atIndex:destinationIndexPath.item];
    
    id asset = _selectedAssets[sourceIndexPath.item];
    [_selectedAssets removeObjectAtIndex:sourceIndexPath.item];
    [_selectedAssets insertObject:asset atIndex:destinationIndexPath.item];
    
    [_collectionView reloadData];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) { // take photo / 去拍照
        [self takePhoto];
    } else if (buttonIndex == 1) {
        [self pushImagePickerController];
    }
}

#pragma mark - UIImagePickerController

- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if ((authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) && iOS7Later) {
        // 无相机权限 做一个友好的提示
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        [alert show];
    }else { // 调用相机
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            self.imagePickerVc.sourceType = sourceType;
            if(iOS8Later) {
                _imagePickerVc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
            }
            [self presentViewController:_imagePickerVc animated:YES completion:nil];
        } else {
            NSLog(@"模拟器中无法打开照相机,请在真机中使用");
        }
    }
}

- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        _imagePickerVc.navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
        _imagePickerVc.navigationBar.tintColor = self.navigationController.navigationBar.tintColor;
        UIBarButtonItem *tzBarItem, *BarItem;
        if (iOS9Later) {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[TZImagePickerController class]]];
            BarItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UIImagePickerController class]]];
        } else {
            tzBarItem = [UIBarButtonItem appearanceWhenContainedIn:[TZImagePickerController class], nil];
            BarItem = [UIBarButtonItem appearanceWhenContainedIn:[UIImagePickerController class], nil];
        }
        NSDictionary *titleTextAttributes = [tzBarItem titleTextAttributesForState:UIControlStateNormal];
        [BarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateNormal];
    }
    return _imagePickerVc;
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
        tzImagePickerVc.sortAscendingByModificationDate = YES;
        [tzImagePickerVc showProgressHUD];
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image completion:^(NSError *error){
            if (error) {
                [tzImagePickerVc hideProgressHUD];
                NSLog(@"图片保存失败 %@",error);
            } else {
                [[TZImageManager manager] getCameraRollAlbum:NO allowPickingImage:YES completion:^(TZAlbumModel *model) {
                    [[TZImageManager manager] getAssetsFromFetchResult:model.result allowPickingVideo:NO allowPickingImage:YES completion:^(NSArray<TZAssetModel *> *models) {
                        [tzImagePickerVc hideProgressHUD];
                        TZAssetModel *assetModel = [models firstObject];
                        if (tzImagePickerVc.sortAscendingByModificationDate) {
                            assetModel = [models lastObject];
                        }
                        [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
                    }];
                }];
            }
        }];
    }
}

- (void)refreshCollectionViewWithAddedAsset:(id)asset image:(UIImage *)image {
    [_selectedAssets addObject:asset];
    [_selectedPhotos addObject:image];
    [_collectionView reloadData];
}

- (void)deleteBtnClik:(UIButton *)sender {
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    [_selectedAssets removeObjectAtIndex:sender.tag];
    
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [_collectionView reloadData];
    }];
    
    _collectionView.height = (_selectedPhotos.count / 4 + 1 ) * (_margin + _itemWH);
    
    self.footerview.height = _collectionView.height + 50;
    self.tableview.tableFooterView = self.footerview;
}



#pragma mark 发送数据
- (void) sendButtonClick
{
    if (self.selectedPhotos.count == 0) {
        [MBProgressHUD showMessage:@"发布中,请稍后..."];
        [self sendData : [NSArray array]];
    }else
    {
        [self sendPhoto];
    }
}

- (void) sendData : (NSArray *)attachs
{
    if ([self getIndexCell:0].length == 0) {
        [MBProgressHUD showError:@"请输入课程"];
        return;
    }
    
    if ([self getIndexCell:2].length == 0) {
        [MBProgressHUD showError:@"请输入手机号"];
        return;
    }
    
    if ([self getIndexCell:4].length == 0) {
        [MBProgressHUD showError:@"请输入自我介绍"];
        return;
    }
    
    NSArray *attachsArray = [NSArray array];
    if (attachs.count > 0) {
        NSMutableArray *newAttachs = [NSMutableArray array];
        for (UploadFileModel *model in attachs) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[@"title"] = @"";
            dict[@"url"] = model.url;
            dict[@"thumbnail"] = model.thumbnail;
            [newAttachs addObject:dict];
        }
        attachsArray = newAttachs;
    }else
    {
        attachsArray = attachs;
    }
    
    NSDictionary *dic=@{
                        @"summary":[self getIndexCell:4],
                        @"applyjob":[self getIndexCell:0],
                        @"attachs":attachsArray,
                        @"mobile":[self getIndexCell:2],
                        @"wxaccount" : [self getIndexCell:3].length > 0 ? [self getIndexCell:3] : @""
                        };
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,Userteacherapply,[UserInfoTool getUserInfo].token];
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        
        NSInteger code = [responseDic[@"rescode"] integerValue];
        if (code == 10000) {
            
            [MBProgressHUD showSuccess:@"提交成功"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showError:responseDic[@"msg"]];
        }
        
    } fail:^(NSError *error) {
        [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"网络错误"]];
    }];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

#pragma mark 发送带有图片的
- (void) sendPhoto
{
    [MBProgressHUD showMessage:@"发布中,请稍后..."];
    NSString *header = [MainUserDefaults objectForKey:FileServerUrl];
    NSString *url = [NSString stringWithFormat:@"%@/%@?token=%@",header,UploadImage,[UserInfoTool getUserInfo].token];
    
    AFHTTPRequestOperationManager *manager = [[AFNetWW sharedAFNetWorking] getAFNManager];
    
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        for (int i = 0; i<_selectedPhotos.count; i++) {
            UIImage *image = _selectedPhotos[i];
            [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 0.5) name:@"file" fileName:@"test.jpg" mimeType:@"image/jpg"];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *models =  [UploadFileModel objectArrayWithJSONData:responseObject];
        NSMutableArray *attachs = [NSMutableArray array];
        for (UploadFileModel *model in models) {
            [attachs addObject:model];
        }
        
        [self sendData : attachs];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD showError:@"发送失败"];
    }];
    
}

#pragma mark 同意讲师协议
- (void) rememberButtonClick : (UIButton *) button
{
    button.selected = !button.selected;
}

#pragma mark 申请讲师
- (void) applyButtonClick
{
    if ([self getIndexCell:0].length == 0) {
        [MBProgressHUD showText:@"请输入课程" inview:[[UIApplication sharedApplication].windows lastObject]];
        return;
    }
    
    if ([self getIndexCell:1].length == 0) {
        [MBProgressHUD showText:@"请输入姓名" inview:[[UIApplication sharedApplication].windows lastObject]];
        return;
    }
    
    if ([self getIndexCell:2].length == 0) {
        [MBProgressHUD showText:@"请输入手机号" inview:[[UIApplication sharedApplication].windows lastObject]];
        return;
    }
    
    if ([self getIndexCell:4].length == 0) {
        [MBProgressHUD showText:@"请输入自我介绍" inview:[[UIApplication sharedApplication].windows lastObject]];
        return;
    }
    
    if (!self.rememberButton.selected) {
        [MBProgressHUD showText:@"您还没同意《讲师服务协议》" inview:[[UIApplication sharedApplication].windows lastObject]];
        return;
    }
    
    NSDictionary *dic=@{
                        @"from":@"2",
                        @"wxaccount":[self getIndexCell:3],
                        @"nickname":[self getIndexCell:1],
                        @"token":[UserInfoTool getUserInfo].token,
                        @"applyjob":[self getIndexCell:0],
                        @"mobile" : [self getIndexCell:2],
                        @"summary" : [self getIndexCell:4]
                        };
        
    NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,ApplyTeacher];
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        
        NSInteger code = [responseDic[@"rescode"] integerValue];
        if (code == 10000) {
            
            [MBProgressHUD showText:@"正在为您申请中..." inview:[[UIApplication sharedApplication].windows lastObject]];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController popToRootViewControllerAnimated:YES];
            });
        }else
        {
            [MBProgressHUD showText:responseDic[@"msg"] inview:[[UIApplication sharedApplication].windows lastObject]];
        }
        
    } fail:^(NSError *error) {
        [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"网络错误"]];
    }];
}

@end
