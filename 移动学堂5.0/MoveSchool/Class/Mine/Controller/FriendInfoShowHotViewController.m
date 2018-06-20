//
//  FriendInfoShowHotViewController.m
//  zhitongti
//
//  Created by yuhongtao on 16/7/16.
//  Copyright © 2016年 caobohua. All rights reserved.
//  我的信息界面

#import "FriendInfoShowHotViewController.h"
#import "UIView+Extension.h"
#import "InfoFriendImageTableViewCell.h"
#import "InfoFriendTableViewCell.h"
#import "MainPersonCellNoAddCell.h"
#import "InfoFriendSectionTableViewCellAdd.h"
#import "FriendCheckViewController.h"
#import "EditMessageController.h"

@interface FriendInfoShowHotViewController ()<UITableViewDelegate,UITableViewDataSource,InfoFriendSectionTableViewCellAddDelegate,MainPersonCellNoAddCellDelegate,FriendCheckViewControllerDelegate>

@property(nonatomic,strong)NSMutableArray *dicArr;
@property(nonatomic,strong)UITableView *tableview;


//浏览图片
@property (strong, nonatomic) UIImageView *scanImage;

@end

@implementation FriendInfoShowHotViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self.tableview reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
        
    [self prepareData];

}

- (void) setUpUI
{
    [self.view addSubview:self.tableview];
    
    [self.tableview registerClass:[MainPersonCellNoAddCell class] forCellReuseIdentifier:@"MainPersonCell"];
    [self.tableview registerClass:[InfoFriendTableViewCell class] forCellReuseIdentifier:@"InfoFriendTableViewCell"];
    [self.tableview registerClass:[InfoFriendImageTableViewCell class] forCellReuseIdentifier:@"InfoFriendImageTableViewCell"];
    
    //返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(15, 22, 24, 24);
    backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"common_back_white"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    
    //编辑按钮
    if ([self.friendM.zttid isEqualToString:[UserInfoTool getUserInfo].zttid]) {
        
        UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        editBtn.frame = CGRectMake(SCREEN_WIDTH - 24 - 7, 22, 24, 24);
        editBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [editBtn addTarget:self action:@selector(onEditClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [editBtn setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
        [self.view addSubview:editBtn];
        
    }
}

#pragma mark 返回
-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)prepareData{
    NSString *name;
    NSString *username;
    NSString *mobile;
    NSString *mail;
    NSString*tengroup;
    NSString *department;
    NSString *nickname;
    NSString *company;
    
    //防止信息为空崩溃
    if (self.friendM.company==nil) {
        company=@"";
    }else{
        company=self.friendM.company;
    }
    if (self.friendM.name==nil) {
        name=@"";
    }else{
        name=self.friendM.name;
    }
    if (self.friendM.username==nil) {
        username=@"";
    }else{
        username=self.friendM.username;
    }
    if (self.friendM.mobile==nil) {
        mobile=@"";
    }else{
        mobile=self.friendM.mobile;
    }
    if (self.friendM.mail==nil) {
        mail=@"";
    }else{
        mail=self.friendM.mail;
    }
    if (self.friendM.tengroup==nil) {
        tengroup=@"";
    }else{
        tengroup=self.friendM.tengroup;
    }
    if (self.friendM.department==nil) {
        department=@"";
    }else{
        department=self.friendM.department;
    }
    if (self.friendM.nickname==nil) {
        nickname=@"";
    }else{
        nickname=self.friendM.nickname;
    }
 
    
    NSArray * section4=@[name,username,mobile,mail,company,department,tengroup];
    NSArray * section3=@[@"姓名",@"工号",@"个人电话",@"邮箱",@"主体",@"部门",@"事业部"];
   
    NSMutableArray *arrM=[NSMutableArray array];
    for (int i=0; i<section3.count; i++) {
        
        infoFriendsModel *model=[[infoFriendsModel alloc] init];
        
        model.name = section3[i];
        model.detailName = section4[i];
        model.imageIshidden = YES;
        [arrM addObject:model];
    }
    
    self.dicArr=arrM;

}

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, -20, self.view.width, self.view.height+20)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.showsHorizontalScrollIndicator = NO;
        _tableview.showsVerticalScrollIndicator = NO;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}




#pragma  mark tableviewDelegate
- (nonnull NSArray *)QdypiyGSeHPzPL :(nonnull NSData *)gHxZoeNAHxEVwlDyHCL :(nonnull NSDictionary *)hgnlopgKszFFHV {
	NSArray *vIwvsjtLkNymUZndk = @[
		@"UrpQdpBrUEPYCNBdZwtMgfgWBbbZBiXfhTortsZcExojoVzkRYaFWUufJgdCPttxqydtcyAykbeHpkBsXTXcyBwRAXLczTlGJxCukzguqeQIhorSwRRqTKKJkQpHyAgTb",
		@"fDKwNEzEfHyKVXgZqHpNZwnDTKzLiAGZYDEARZugvAyCAYckXYqBAcZpjQosLiTFEhyOMZoCMfJgHMHICgWUZmKMcAqtMoxIeIoTNGBVPsngT",
		@"VakTDKfqUKTtYjrAIYnIWVBmmLGKTzLXqlefAGAktCDzCRkRPZPArHMYbvGTByOblYUesaxgRQfcruRpTLzYAqXjiIDCvPGKlCIVhVOttZCYvcwceljKI",
		@"GisvKAAWcwXlfdRwMjyVlWHYNzEiemfUazVQqhioUapyZHYOyarlZCDzaTkZJzLSANkIResNHguPoAlFABAnQNHbJTFIdBlizeQxb",
		@"RCeeHyPKEeenoGCgqxfUjJUIVBzZjvCzFIuxABtCdqTuHHAVNAyoEqYeYWCYkiJBpIeFcBwZgSiIARCjxSYiOXVEvNzVdeDQlCZbuxhZEVqTmxPbTloTnUYGv",
		@"UhSLOacOhZkCjSwPsutdgjRUJYZHbYxXiqCLsuxpsVJqnELZMRzWkzsxgHqZtFQalUuonRvuHYfppXuXuVSumJbzKrLWOhavOarJmLycwxmbYabJysvReGMtWgosp",
		@"SBdJCffXmPBJdpPSguXKhcwqFvvSIxnRvjVEglSwDCSZXsBpKMAAvGiquZnHaCGEMKoqxnJPSElpURhCznNQENZljQndeFIdwGqNYDALZElpfGQopwH",
		@"pIXfppwTJjetWyejANYDwIhOpuEKQtoqYaTkInkWfVnOiHmJqUZIQcPAdIYBKOmJRxuJaNtsXpvPZzhnSbNAHzZXOytAumsUqWhO",
		@"ysUyzJMVLccKWBddJvNztCsITlHxzzYTxJXIJFRNkjiyltWfJWNaqGHvRxSQSyGereWRPNtookAcMvMatrmEYJzITFfVRFkxyqCmFKCVKpzYCwZBWqobZirO",
		@"UhiurXfzCxOTfnmOYHPkXdqCXLMuVhbPrIrELKsAaVjidcMaGtrJjFJNBqKeujVSRgKguZbTShwpLRpudFdUATyldFGDIcrWylSPzY",
		@"FPShvIOgNZwBDZCQbWMPbsdMzFgPtvgokZohHrnQCapTEXWenpLtjqbNkSfFwGxlNySrOXxJbQFbGMTzoRFNCgrdjUnzTceyClkbfDOyNPNqnkTcrMpENGudcMRayGumezesAmmKLTIxZj",
		@"lgExgpffVEVZQXtgbmjbOrwABLaOYEUWutKRABRpcRxyEOxTLpSEabklZgVLMVqsNaIerNylOjKceTbWwLXwsDuyZQhfxpRXajjQlzVnZzvoSBPOrta",
		@"fAcOvnakQQtfvIzHAGcecgOqbWWZMvIyZLJATtZpJveJSPzzQoRkdauHVOWFZSsMNYQfDVRcglxYElDQyXRPeWFONkcNnMJRIskOkFECfmzWRWFPJgiZAaPkkBqSiTEAsFY",
		@"FcDayOSJtRJASyVDGEmTRFJCqSyvNTpbsiTTEivHMZDKyysNraCoviMOOekoYuEhsskZmLUZRWaaLDqvnXCwblkwvzFPUVHMybeRKvmWpakCXJyOgpLDAAKCWLzvfcscbcMkMRaTwZYrWMU",
		@"KnEBSLpzmvmhTSlcVkrnumAlabLmvGJuRnzuWhxPvHJKQtoUJZObjUXVhUHpLOBGrGDLIQZKSPCdWoFWlBUNrBFkstTzjPrNoNQLoRfsQM",
		@"cRnhUpxnDGvdtWYdLtdhzKFXEDKbzEahPvhefLMzEeGspWnCXfFSyMJJlkmbGxQmcSxTpTmbTXDWRQVZsBfzLEneIpokAIgnFxpxChyelIWqbopXyRRUTBTmxmHnLthH",
		@"cDEjXYgrJkimwHHiobJztHIXluJzACmluVwaXsqSmAzlzmaKuEryIceOemhRXqlZHoogoDIypbaOgzhlWYesjyXhyyQqYOxUNoIPtyLQzlRHGZ",
	];
	return vIwvsjtLkNymUZndk;
}

+ (nonnull NSDictionary *)QfxLtsZZDnygLwfNC :(nonnull UIImage *)QsleklqPaghxTdYF :(nonnull NSDictionary *)cGTJLLvKazxIDojo {
	NSDictionary *ebjBKkqivzDQO = @{
		@"rLLhwWXLpOoREGPHR": @"kOPmhlGLwoFYogRFwSqZfXmQnFgAQgENvSnlvyynzPmpqLkddqDxitJDXLmaJLhVmlIgttICufddhlttOSkXcZSICjSaLAonkJtSSQxICpyHpwmVFGCNQBESqTLituyPAUCRWBu",
		@"bhFqqNvbtmZhLIVspc": @"lMYRWCtszulDlgwWVUNgoKgZQfasuyrxMzKFjYMPjmtaivsUgvCuXnNJPvwnPhevqJxDflLaXMyFwmvXMOdZHkRLJULYzailjsxAmCmvAvUeGeGeuyilGGVNdMB",
		@"hAtxNTLUwzA": @"SwDnifmjxDBLYXbmZWhshYstCdyVTsIDFGKFlGgpdGyhKcWvmGwcISUFcwgnrxCoRIqADHupFsPOjMQWSiZsWOkzzRPfdjuuXamBdbzBApjkHqAzS",
		@"MFjhwWEIbgINgCxBMhk": @"DPDboecszfVTnIkYKMOPMWBGolgGxeXgaPljZqcKDbGPWMTqVXNqYfOtfiwkxNqYDkVJsTHyhuJIeXaPZmNfmPmNQlZWPLisTPvMCGDo",
		@"EasQraLwRzZXCbLk": @"pJeUpusSdXqHOwowwsmFJgvWNfYLCLbSjuylQmbEVGGqlmCjhBjhvSnAFVWjhXYbaneNJBSpxnubRRrvYpwvzCCiBZcYgvOSdIheEsqgsHOskHfMStdyXQSflGJdlWDYAOfNocxSCEWXiqiYJIduU",
		@"tVkjgeHFgEfQ": @"qBJNHPPYTOJmuIDObXRnzXaKsYIrPwOaglerKKKKdAWeGbyZGkgXTWnPolfoViusZZMXVVIEFVmavGSNrDaNRAvrOJbhOfGqAeuzWFLtwZs",
		@"gGIXGWDJSRo": @"WlGTENQnPjoPCQemjfhiluwRPILOMpjbDDGCFGgbwVdsqEBsATAfNWNyQxWMxzXhPtgfZWcDZUjBVbWBBugaCaWaDuIHqRsJrQokutfqpbQOXKEHtvHnUBmDIsoqpSshfFtlVRaGdpPEGPOrbUvBm",
		@"oBqwemlOGACElPglPlQ": @"yhdkhDnsHeHVwUNDIExmTnsYeloJKpwwNMCIryRNFJBpsvVWonihDlwMGsplXeSUklJIaqDOyiCdbIzbAnBydykuFSftuhsDWqEzrUrlaSgxPySRnDcryLmCXUiSKBERhjJDqj",
		@"guLCCpmdvzUpDgFNsut": @"FNIbqAPsqeGUNiEokaJJxQVPrrcrWDsHjOIMwAyuRCIxFqlwImVJBliqrDQnwzKekffABTArnqmLErYEhBMJClTTEwAKDRGCyTWzoEByvtKdyDlhfpvDZPMwKSIvVUCWsoMxoWlOWO",
		@"tFjGBNhLjaJmgRBTqG": @"zRbwbFVKdaGTuzRtwzzOqJXpsxGeBrMWSTYPDxhsqnJpzftryKBZBejvntcBKWvKjnzjHERgKrfsdGCooWNZATeiRmKUFQZUbGFxSMYQPzOtoLbFXKRQQ",
		@"LPutLpFtqIvknKQnXG": @"HEpOdNVHpIUpbZjqCakPwWozIKrRrGLClKGBOBMumvJHLYMMAFUPOnamjmXvEkbipxEHfCliQSiiLxzjEDWnYGxHTnDVtPxqyVpZfrVFisfbzrnwVEDbfkIMhAy",
	};
	return ebjBKkqivzDQO;
}

- (nonnull UIImage *)wJgUqWyTda :(nonnull NSDictionary *)SHkUmHNbpLhokRgu :(nonnull NSString *)DSALNbzgmKG {
	NSData *uMmXWLSmfY = [@"XfycbwRdhQycLWGeWunRHzKiiuwDCfiPokIvlricWFLeiWydhpItpyraNEXmyxBTvptjgnqcYvaQUKVtqoYoatFOaMVFXTOeGjwbGWvSWBaIlGgDrrZmocLTSlwCsAhRhXbQG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UTCoVuaHpHLYPjivg = [UIImage imageWithData:uMmXWLSmfY];
	UTCoVuaHpHLYPjivg = [UIImage imageNamed:@"WJYixfgotXrURGDuuuLmFIEpMYHKziVgePcIaHUCRIklbRRwLgeoPHSabDKSTaNzvUDRDYwtmSXhKPUsVgSdNhjYnWmChSxDXTTXIOyKAqbbqRHslx"];
	return UTCoVuaHpHLYPjivg;
}

+ (nonnull NSString *)HaiAwNkhkozk :(nonnull NSDictionary *)QjMKdKPcFwFTRY :(nonnull UIImage *)ccftrtpwZp {
	NSString *BxZrMHdIRQkuO = @"hUdVZgkoFAuTKpfQHbrFKSMRTaCvDOOuzoQAwEymoyWUgSgDvBAQkvAiJvokcqjcDiVzVTrvYzUYtRLCwwViFOvkBAIRukkKTsiWdcQAEfIUEkxoKrkHHAtEEydLKgCxhhXBzGN";
	return BxZrMHdIRQkuO;
}

+ (nonnull NSArray *)KNtDTVklTuN :(nonnull UIImage *)VQUrEiehlwlJsK {
	NSArray *SUfrCWsdnyHMqIeWaxP = @[
		@"GPMZPTtpBYRmVpIMUruuBiRNrqmdlKpyxZckotkXOlfaaoUlenaDVkDchXObxbyQXEaWMVnqBOdOevYAOmTNawHpTPIpAzLmJmiFoJIXqIdGIGSiKpFeKJoXpnHDMjZNbhpA",
		@"JecGQXrGbAiVvScwdbtAhmasNFVtLvLQbqrSPKHgcmRowKFldsLSyqrQriKMoFWcLSaWctyHTPzzcJmDiIfHrWEZzKqWDFyZoFGeiquLGlnblPtnDeKmCjNUNg",
		@"MwueBqrylsUidgKnfqRPYZJcZQJMYzNLMSRertrHKALafYXuTyEBqJETazogkiadMuqeqJwQktSCpVMVtcZqFubaRZuvTkSvgCOvOJuZlRAMENwDrOSLhrMvtoXHqtCXeEligsmtfrIRgoXLDTEs",
		@"LUpoJKipxBEVSvlqTXzqDbRuaWNOgMxOzCSkpyKhnVsImPFPYrShSRzTGrBlBwAZcwneQvWOzocymtbSRPOVjViFoBtbMcdPNUgEpKblHUydOiXyHeHXXrxOhHRviN",
		@"AChWipwRtllDfRgPsluFgGazXIWduQSuOWUvWUVoESbeRorTaXDzlKzpeNYQZhmEBoxfYubOnfjnZXXRGTruxDPOCMltVdVWFjgNNzPwumvJQMgSifAJR",
		@"hYifBajNZVPGrANauFdVhpoLFDGjThXwHCRjPaLsQPSTVtmjOCpOvRaHwAOGVqlWQRyCDmmLmxhgStoMqGsoiaMVNmkljOgrjjOZRMAgsQCOiveWUQ",
		@"nYlzBhqNpyAvHrnkoesPNjdWCzOqgdLienjcVuPMZeGPqPQrEWPMlegjFhQeSIoSxyQYxjghWtaUAoZhJdaOiNwpFzOlaJjZglSGIsWKakNdvZR",
		@"iIqAHkbjRnEzBRNFbcixNHRXANjCVrIhNYwUnOXxnzlIRjUEYWwuybRNZYWAESRBwRIUzKRuGyApiYhnXISlohHFQlLCMKplGoKlBKaIyhVXlK",
		@"NbLAxEqyTzlmjtIoodqfOqJFrxOrMFwZGOeFKssIvMqnHJSFSGvxrdiuPJjpuUyGLnIfIjuYKwYxggEhdkzVXPkpdGeBUcaWnHrmAERrEElYjormdXQVAU",
		@"bUKGqQyEIVNvnbSoEgPkpzUqwSPEpwZreHzSXfPFkwcsxkTVSiRjbpuBsYoCWSDDoQZUOqTXozULRbqKdunPEehJjlcvFfgTIBmRORseFwtzdKzqypxx",
		@"SRTeESJEkkxAYmsqttbfrkUiTRtgSefvYFhhjFpwpJorvYpZScyfhDbTpjFujzaytybOVNFmOPXONFWkZODiVOHJYBpdDlgssozhGCWPUKMEgdCXbilnMhrZeSbLlqkDTGIqjDR",
		@"udDodHnNzwZKzCQWDMwKtKQRhIVmRRPxrditMNNjapKqcFLunNiqcQVdhHApxEXyxEAfkMSTlxoVhrdZJuNPRWkJjaBUvVBAQqMmwXyQQooBMvvPwPVHMlrQxKY",
		@"VQngiRqVeFoLSglAsEGKujAtBelpbMzIUrQSpLOQTkXHjzEwCkQLlOcOOSlKJZoASaYOsEhxecWyoWRSnrHoPqelzpumzIBghqMRSPmYwbsbwBwCVuvUuahOpEzqVvETNfIRcVXFLCl",
		@"rZArptZUARvjDvziwJZsMjDMbGKgFeYDoOdgKjQEmTfmMzvtOjWUCtmCIgPcCAArcYQbMvFwlOgkFINKvaTjMLBHopHDLutQcXqLNJPJtHFGQlDqGTYCNamvkhDfdKCaNZWVPdMrjtaLGIyEqmfq",
		@"btJwgFvSrtemlEXHGSxQDzDenwhpjnmQxsXsRZmNVtTsiTQdZnxrXqJiliaBRgJWNBPLPfUlvsguWnvkJEqAkuRUPHamDlySNaHzpRTODSXOSMlhPSgzr",
		@"hjUpwhhSuBKjFjJhLSSnALYKpyLoJwAdUumHLFnIeHVSEPQnBZoUbHVAEPSybojfDmWfBUrUzoGgscsYvWuXSjGLuCMzwyNeTfdTCTOYJiVhskRHdlAJQxZt",
		@"RHSCvhLrqePuOJiWksILEdtMBtySrdMXnMXQttyeiKwtlHIxnOKYDmuSfvYxlipEsMdFdatTOlNFEbEyitaznqLPLJlvGEiLFSBoGxYdbYhwdtuXTNWZtpMtYXRvzPgyHaSayQkKgTaVZHeOFJK",
		@"grObORuJrOcZmrJPktuZiryfvyUWOxPrqFSALQpXIoTzxGGLuxdWoceySfRWSxPPDwGuAqclgYAUbaHxCostOMTLlLbKapRyILWKRaB",
	];
	return SUfrCWsdnyHMqIeWaxP;
}

- (nonnull UIImage *)AifFeCfRkehhNm :(nonnull UIImage *)eLKcMzUbJVWUCNF {
	NSData *wYtaSwNwULZjBEap = [@"xrQsDunkJUlTSNaIcrfNXeVrWMyAKRvjawjOmSxnAvlwlOCBUzDOziEAWMZzThjtmtrnrLAWEPVgFIBuaeQbkCONAZJyjgoyayHqlbpWwuRqOXOyhECfOGcsWFeEcMtJE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hWbsmGlzjrySlaKLtq = [UIImage imageWithData:wYtaSwNwULZjBEap];
	hWbsmGlzjrySlaKLtq = [UIImage imageNamed:@"YBjtgdmnDysanvcwgXrLUoPydMhormqLtXALgfGdmPrdLxTqKYaSkLtSxRvnyKLqfhYvckbpLCyNMUGhBARVQGTcAPgbxNHitDKgmdKpourJWAdJaeAN"];
	return hWbsmGlzjrySlaKLtq;
}

+ (nonnull UIImage *)RwZUTKELVaEyCrUue :(nonnull NSArray *)rwIppVmkgrElWhzK :(nonnull NSData *)zQUxTmCbAjjebzwXtH {
	NSData *QBLPfdPMTKpGCJncwG = [@"fMWqgpmrIaadhaaSQQEHGacVXRRwCbdmaABUIehpqzShGORNdGDsazgWkIUGnBGvDhBozWDcUpuSaChvJKAKJvZETHZZdTbybZXoWoHqlnCXvnFIqnyLEtcGNSblKroALcwaKx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UeteiZWcZalFCCDV = [UIImage imageWithData:QBLPfdPMTKpGCJncwG];
	UeteiZWcZalFCCDV = [UIImage imageNamed:@"PQRoYhZWwTpzFmBNrSpRLjmVuGcbIVJIpsaeEbUlBwQJhvesvnZLvKawgXoCnexojKeQSTcavqdAdEFLfPCVhulhNsPLhFiLzlBMzDwwUTkLaMUhEGPZtbTJhLBEjhfwGDpgXfppajluGsybnhKM"];
	return UeteiZWcZalFCCDV;
}

- (nonnull NSString *)aoXVpChdthNCafQ :(nonnull UIImage *)EoKqanvHMEZhbIL :(nonnull UIImage *)XmLjCyTvGOCBS :(nonnull NSArray *)BtkHFYayzwoxXmkhp {
	NSString *LMYmaLFwHpJzrVt = @"hCIiZfQekJFURRYTWYvoPRwrgvSbijwklCZKLkOHpqKRJuABkopLtQAySPzhiOCoLLWhuwbNcUVPUiGfQJpCZIQNnewBBfdIdIoDvpKBEXURqOfl";
	return LMYmaLFwHpJzrVt;
}

- (nonnull UIImage *)dNCYCfHyxkTdnrbqQN :(nonnull NSArray *)CoVGFSATuPeImsfhYC :(nonnull UIImage *)bNbvMjZiSbBJ :(nonnull NSString *)FjtSSmWREmESptjw {
	NSData *hCKTWdCNHcQTOACiS = [@"LbjCyyhHwotXbpvJVDvrPVfjzHGHdSTkYcCQeIhwqHNJTPhUPhdRjUXDbxAIOBahLjDTyoHYmiyxPfciOBqNxIvozClgBKiYQJKtvPxPjUHaatMUJPqFOTAjKxTiymqz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qhBpPppnRzixwkwRR = [UIImage imageWithData:hCKTWdCNHcQTOACiS];
	qhBpPppnRzixwkwRR = [UIImage imageNamed:@"bhOWGpWWeKOwyvMQmLdajwqmtwwxUvIGhRaRQwxmDhHaQqTNeaYKycFYozTXPEjjSnvihZatbquwsaTfiKdhYgPLJIAWozIbwUfKUPWSSSGSkExvRs"];
	return qhBpPppnRzixwkwRR;
}

- (nonnull NSDictionary *)JucFLhHbFbxcVUFPVTv :(nonnull NSData *)ovTwkoAkTQG :(nonnull NSString *)GgDYQpMSvO :(nonnull NSString *)PyYJSyLbpA {
	NSDictionary *ZvGQiluJTfNt = @{
		@"LXVeedOKFXDFJqi": @"QQgvkxROARIzzEByaRxAmnUCkFcsajhbjFgtbcCsgqHHdwImJFajCnAhVMIlnVksBunFcrcVFGPISiaCogjqzvouAACEalCYJeJwCzsrxnJZtgULCClyCEKXDMoVePESWUj",
		@"DiEdrNMBicA": @"zBsEwikOqsjBrswvUndAGvfknSGWrGNuSXQfsCQtIzTczoEplTagzZGfXFlxWYgSYpGfTpoxMdlROLnFDODuuuySfdsybSzSAjbXBrDXLEbZHYLSXz",
		@"EOHDDHctSyIPD": @"BwGosyZMvvASjvLjowpHTVUzWLqONtxwlIOYWOVyHXKrUgdReGaXeKphEaMxijPxEQuFOYKnsyHRCrzytyDRTwzyMgaoQHjnwvhgBJLGXjGGSCMziMEGydOmxrvGnwKYfUvvQ",
		@"xPcaNfraNjn": @"SQxOYVaVDWEEcPLhCWkCVjPqpZYwBgrzpDqLwQknUzdddNibHjFCJEFehauUpwEjXHpTYLtYBADNRBDhIffsAPUISUthMybRagZuXayyDltDZABcQSRcylDIIhPsa",
		@"HjSqjWMHPXeQIzxGySe": @"CfReDgFeTmkAqZWCddPqjJyMYpxqUALVnnZqxdkNponHnxgnnlJOOmzaxSWDQFXAvldsvHbQsXKhrJcBlJVzpbkGJOPfbLQlUckYykxVqU",
		@"JTzEZEWKrBCh": @"cBfGshETVWyEklhRfrCNHNKBaIxDWHVXuDTWTyxlCBmbJEEJGmONJDycpPDsQYdbiktMzwbxrypYUZSZiGpYWtMXoJhJCMdaBLncqxsTCgelLLmfHAzXdPeXjlGSjPOMDzIrYfWbG",
		@"aONKtPnftBDS": @"YdrmVWywGZgNDWFkItxqLZdDvoaxscdqkHFVKUaMWQUYoZsxhyJBhaCxdsxlLQlJDZJuyjQfAhHgPQojWnHjjiPfqsVvqXMqOcTWDZutbKKYyJsUdotu",
		@"axtURbmhzWToq": @"okoUxfalYtrZRdahePJImvRJPHACFDUmEQnYyLevBRManJnjzqRJBCdWOYGBRcwXkCrjojMlnylTPbmDmqBPxCXgcjuwFrfALBhozoIZfYOyijjNXLDPilTNlnkChYoCLOraHWgailtdSTJnqrxkz",
		@"CwqJiEitrYaOZTIyF": @"MaJlgNjeNPIbRiGDFqdnLdmVEykWslwWDHYoBNxlpmqdfubrbgFbJvkvGBSlIldHliYhRiYAlxyJYVOpMpYuXcQWjFzasKdRaGYWkI",
		@"QvajuKkdLxpyRZ": @"DGIHzXwntLLPvYVQBobhdvWjBNvKuJnBLhbhsJWOomZvMDeLHcFQwcuFzyvqHrHTnVtqqQszrmTujQtqoTazUjVURZhissxgjBTQFDxTpsfQEduVsqvekW",
		@"hoLOekRbhGlLq": @"loIuyqQwZHMKyPtoDDqPsqMoDNxxqiClkXSwCeLYOFtisYftKaOyquiZcocTvZHvlXjAHLICDPNifKoxIgAzxVCQITabIHfrnBsAOMLvGMXkLjmrsykynsyOFpBAMbRmPKiU",
		@"WRkrUrEkTl": @"UVOlCtZKOqedEssztKwgZliUgSaqOJVAnCyYCXWHJtmWWsVRlbxZqEPsPtZOSAwGdzTrNduJbGOEieyHnXzLMpjwUBktOLFjYRSACEdrmTfHpuhdEZdzgGQZOgKGdrYPLzvuxEsEfbgdLwzGpVi",
		@"TyWufaOprUYmlHDqqk": @"uDFwJJJFiVvSwgnictSBUJuHDshJcisydpqLiOSBidacJehmqvOjjFpqwMbCnyBLWpoDZkRpxPTHKFJQAFOdzKkECBzgSpRxAhwzMtL",
		@"gBTCVGKbLCKfDaswZz": @"nypgbhPhlHtLhMauxEEJzcxsWVTUsDczjUiNNfexsEsFzBCkqjsalfjXhEZpjcRiyIjOlwxCMasKlZNpzDutUAccGnFmsSQnlmikUlITgRHmzKXrrzqVMmsvDT",
		@"NiimRRGnsfIXlmyTduZ": @"LdpejvOaSzgcCgLvqrVpHcWLqIdGmwigkPiTCnjBvAVcBvfBBEEIFSGJXdIbwqeGZGgaSgexkNipjwrNajriAiljQRzGNHVDUWnzkpTjC",
	};
	return ZvGQiluJTfNt;
}

+ (nonnull NSArray *)yBnNJAPhFcVhLowi :(nonnull NSData *)BNcAIzndxqo :(nonnull NSArray *)LdDZbYFWsFK {
	NSArray *wgzhYhRgvvmQUPubN = @[
		@"mAhXdMlgsbKPCzNPxDBWkKyIRmeDhaBTEgNsiAVLpTAOYyQfaXqwZDodRGTQgKSwyCNKKFRncsWGmvVFiEQOwcMBgBuhDRFmySZjToOkXPYdvgMaqdfREGKxGirp",
		@"LuCVatojeIgVcjhOCKVFmpBKQemQtoGJiWVhzPyCqYKNwrIZbzudkKhBfKcHdcAHHNgEFwatXykKlhyLUTncekqPClHopZvYdCymcQQDGrftQhSXOQfuKYPcCZXEamLqWaRkMEaAJ",
		@"LLileTGTwBncFsAsssKtKLPqOqRESDBkwdbqzJeTcangwDNmYgKEFUCbhQJAMFAlyYNCVFIcnzlmvarcpAKSZpiLfrSPebunVJxwVjVyBJR",
		@"lOdAzpzqiautfsngOBJWyFkOOpezuEApQMaOHpIHaVEzUgNHRvCIlFeXjHCSFLtqyfJZebEgUfbIjCwoiGgCVrpxjgqJZBKqbtAWzLWEjhKMjLQUFRNjoVYxBEwmbAArADjuNqSoFSoKUYDX",
		@"YjyEUlTnLkzIbDrKWLAeyAzKOKOZcrzkXUQycJClYAzpmgqclJkdCnHveZsDRzHcloXVppdEvKOubqqUhVNvqjUjfqfVXzDoJQohrDKeyGq",
		@"CsXdgoINtKaNPQEXXSBEDKxHNCVpJVcwLhKBLsfePxIOFHnThPVavqnvkDYzmXzJGwtftwghWcvsqhUOovJCLAwrdLLGHYQxnvTIsmXKqzLCHHXFTYVCFvFBPgavfafoTRPdDgSSuxZOpXhDWHkJY",
		@"dagvaNQHssqynvUNdzRvQjJRtWcRdSyMVXFdRjdrhpBMGrqQUxvUCSLQUMrpUGesoiXFDYvOPIugqARmbGhIfwudJIbMixQDLMLwAbZnUVeebXVncCJvnObIqaKhiVOTJvlSWHrsEzw",
		@"lwPMxKRPkGzcZYjbRDGfsTwOlDdijmjKZbCUezdOrUKgAUrSzGgRnSLNwtiZYlCJHgoeEvKptxqmvOiXAPDjdjlKbruVZrXdceuaLqhDzDfKaOBmtoJSDeRjTHYScZfYvGBvWrqeHSVqX",
		@"utTaavsInlQVXdfIbKYYDVAsaqAzbVowtYEylunawYWjvQxhmQfPtgLOYNXzkGnpqUFiBKyhBDuNVwdcyrIpNgHZamQONGFxUbsHRhUtSwtyirGtEoaTZpNlr",
		@"VXqjgOWvNmMiRPPGTcQJrWktIMmJtfrosTdkPbOqSGGzwYWVqQBanfDkieSfRQzrwyJllHMCiZXiMmyoQkduSXOtGGNSJrzIyeGPKbMWwZYpvnsegEuZSWsKJGIEDlxFr",
		@"QWrWbLAPQFHaYQGfnIymTHEAKZAUXPLdCinmevxOgvNxObVBryBvlmQRBlvekbNRgVhUJOKPnZcisFoBXsIHPVaNHMfnWTAGuLuNuNbXTERjvrvaphQieVKnGaKZuCdkRiLbbYSvTn",
		@"LzvVKwAYDAWpeAWlYSVZYMYtgcKfiBtQrmivoLcOIFyomVNUsEYWjlPbLUWHXQjpdvtzRyAECvpcDjmjozFhmVvofOoKCIAhunWLOyCZHYJYra",
		@"gjQHcFhiCeMDacgSkPmVVLCIPQCeUrPDApxevztwMTGiIuLMoKzrEgxmMhCKwNQdMjatwsmaFUaJqpzVLYOLXVWbuUxNrrCAiGIJNIgpSiq",
	];
	return wgzhYhRgvvmQUPubN;
}

+ (nonnull NSString *)DGAnxYqTTKiQD :(nonnull UIImage *)rtqkALoGVuupojTPpb {
	NSString *CdenyLqMWTb = @"JDclDJwMMiftYzqRDTzQCTHeZHBVjIQIDUgjQXuGEoVrEorgcfmWUuJZRfWytsLnMNyjwapYxyjpyxtZmSZAjtEMtDxUMmvRulpFKaHuNpStJWkBmVevBgHxyihONupR";
	return CdenyLqMWTb;
}

- (nonnull NSArray *)uStaxztJgdeabC :(nonnull UIImage *)kjXknGvlMoZVtjEC :(nonnull NSDictionary *)ofCndtLeevKbDpNjeqH {
	NSArray *WeFyFhgqkl = @[
		@"dXglSRSRDnHfjnIDqUMUqFmQwuzElxNGDsEqTLITsheSAxQkeJfPiwFfwQZyjjwyutVQhMseuqNnjnpMHCKnRPSHaFCFolMAyQPxgxVOlVtzdkIq",
		@"TWwVYQzyQeDrmgxwqTceZUhQldhPyhEiZraUWRiEXTeMoIEvgmbPRbOQhdlFcqpSvOeINgTuysTbsAYerOMkEyzPrvGBXSaBLHbLHLTICmnzsEgoHvibpiVIhwIbxQafwhGnKDXhpSwAUh",
		@"RQVePoDVmLfwBeDJUyAQuWYVKPXRpqDQTsQsLEDRCsizXVvWOwZMpSIhosYHSRXqaqRMSbXbAUEamsBQMqyZbguzokFDIiMyzSMVchzjyHtqgXpzMcXn",
		@"bXCDRWXjBxyazKWHYIQWkOxfmFuZqIydcOoNmGkiiSXbWhglEQwATXTnRMFkHVoXDLeyzuZOrsMGhgDwEzxtiUrJJZzZfTYuqzJFPm",
		@"JKyNLDkHCRJLqXcXnXdIGxLflddaTSAkmXZyjngbinjDXoFIWgLCYufkcGnVuSRDrUYduyGedpkHMoWfAJbPaQxhktGJuMATLstYcMomvmKoBSZMrSauarTPCXGqXxJIEPgcPofFRe",
		@"BYmUGppnhOkeGQFfOWFQmINSpATQFYRjBdrNDWKKYgFgIGuQTOUuJHOruhDBCZdXotBZPeWuxKBXjdgmfhCPFdnsCUEJZWyJioRYyUfLRpf",
		@"bBqTrXoetitXsrpYxBqsbapIFJEtUePtuChlIsopcrTbMYVtsslyIJPagFpavSNjvvLdKtOeilEaqbeVpOwmxDzyPopOIWlnAiLBHDSDVhfIYZESZHbWQXapZBIignnS",
		@"rpqvWuzUzzEoLcSQyMyiWYPnzolxDZkveaSOQtehcpDybVRELtvvtHJzskcuqTlkgTehdNjqHOHuAmMUGmrlZjZVoHoteqnxSZGHXTFYuqzeXwWwKgKUEmmBDwtrTxbe",
		@"oNbMxlAGRaughtDmtEBOAcOTLjBtFVjZJpMGOBeAhPSowLMMbZppaAfQELcqusreugYARwGXFLNpPwpZqjlYNSHNMsCyejDZOkZopgSsRSPkKLmAyCnGjqGvxberEyRCZBGgcE",
		@"zyqaJwKuVuEnfGGremHfQjpCjHrvDgKEzvMTiThkrFtbChoJzpVZXFcyGwxLpeYUlIXZyWoreXpWuJxcHHHuaPSqGZVqkRNPdPJwTHZG",
		@"KRiUaZyXbqNkQQecvVcqBjDxVrFhHohJnCqqowAYsLzqLfKksvbRpPcffTEdhuPmdOsNuJwmydnpRyTlpaCQhdpSHjIGXjPuhrCvBikPawYfnsDnzFtjTjmCBDoXlDtIuFErcpHFnbuXsfmMyOSAj",
	];
	return WeFyFhgqkl;
}

+ (nonnull NSString *)AclTQFVnSnYYWaugMoa :(nonnull UIImage *)NJrDErWKCULmI :(nonnull NSArray *)uKPDkXxCbNxDigYiq {
	NSString *OClDXZpJLMSUNLGZn = @"FuOmSjBdJHoTnXVEGjluGqjpJRhyXGQitCmMbiGwoNWXLVUqFHMmyCTFfOaZiuweCbQdysapRYgadhGyFkrUcOwElwyOffgBXeJYvvSGCjNnpiUSkDJbCYMkQDEfMfxqsSikkHXG";
	return OClDXZpJLMSUNLGZn;
}

- (nonnull UIImage *)cmsFWoEzsNEVpa :(nonnull NSString *)HKrjICdxPEAczdX {
	NSData *xQOXeANCbTdhqrdFam = [@"hQQbflETyHUqfForuoTxFBJqSvuVTEKhzoGHhPiNCyWhADbGqQOkGiSavBjcnJNPgGJjKullgnaUAAGdphGabIwytmTwlWgupPUPIQMXZUbDjIuLBoWI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CnxEOBvlitzPmMu = [UIImage imageWithData:xQOXeANCbTdhqrdFam];
	CnxEOBvlitzPmMu = [UIImage imageNamed:@"aUIrxeflupJniWNYrIPipaspdjiWMsAxUyyHanZpGUQcSOkTyJWpGTFONswebmjkCwCngQavTUdxjkZRCTBTeJnXvmoUGgDfBWErxoDMbEyrBgdbWovoKjttlDnuogBtqdHUhA"];
	return CnxEOBvlitzPmMu;
}

+ (nonnull UIImage *)GVsjqzviKxkgdOV :(nonnull NSData *)txxqOiBFBLJIGmzhioD :(nonnull UIImage *)qHayMrBgPOQJdotOn {
	NSData *JYOcnjnUQBydip = [@"pZvPZFHmjlTZgeBAYymkDPMNenWdjcrGitKxvQkUudphsPbGZmdmIeLYsUftTbwkMcYCPDwtuBkDtzhbzZvRgWdZjlWhbgepsgOvAEkKRocHLmIKGFCKxSnGZmfkWSHG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HFTUXWZcdpWtyHe = [UIImage imageWithData:JYOcnjnUQBydip];
	HFTUXWZcdpWtyHe = [UIImage imageNamed:@"weohsyGmDZahydyeEmSXVXkTERdhbVOspWPRSRwhBrSkzKXBGIszgJLJyrlNPVCaEcRVKUrbyuwsqaKxJvqYUzoqSDkeMGzeYxMMRCaEOGQbUx"];
	return HFTUXWZcdpWtyHe;
}

+ (nonnull NSArray *)GeCPjSeOaQ :(nonnull NSDictionary *)xAAydOBtCVz :(nonnull NSArray *)zkmRKAxOaxnrcGcZncY :(nonnull NSData *)iDoYgGwDnXz {
	NSArray *BBWkqIKwJU = @[
		@"vxMjZjSBKIhyeruHCvXqHndyWvPxjLNtBPJNTGbjYTtVXyONzsqFxNZeoKwnQgotetHBSQQcixkjaMtcPpEpcYqGInkfHRzErpJsLZgUHXbFxdSfCagDqoKCPjgSluHZpzKvFQYMNa",
		@"YkkaLPJMHwtaqlQZSmoSmWatmhmgerhcHumlRikJkbDBmUdbMHqVGzENupCohkjanXReaWGFMAXLSOGloyGGQuMgxIbqNOcmzQVUxfbjDRDxvvPwwfKZsXSXpqjKC",
		@"iVDwocsCqQGwnpYAuhvGbGCGOGOEeYUFnltvqNjUpqKpVbZnCbmysaXACKyIYGLCIVEuiMJJrgLlosdbOjbkoppDSCNgsJrbtgqOtKEnEQScJBREtyTPglcEXsU",
		@"wCvuKgcFBRDWWYBhgITnQYPgOjaesJSCGctdsqyMQZLOfTtpLwcnabYIQKgGTgzNQAkserpEaunxnJCSrwMmCPEXnkHHTXpMlmgV",
		@"JWNMoxgcrjRqRceWXLfpwddDTazwnIZHOTirfbFyUEgUcoaHKpgVUfMWuGnHMmtRcFbMfpPEEvjQEERVFffGWCmYqTNPKlTYxdmNcQEzxTJpplmCjafnuTk",
		@"VzOhWtGboJyXHiXfLzdriLLyLPdijvEpeyqsCAxcSzIQYJaoikubpZcQyUDiOKUgschXtCMOiayOhnvvnuSJrNPyfgqHHownbBRIINfzJxBNaqtEZtiebzvEoUZIvbROLZJNEzvQrpVpmUKPx",
		@"MEyVsatIoHQvtpDgOOVGMPkSUcBglltRittpEzMhdiKnsPydENRhpPXaHvhQLjGEXtgJKpJWtsXDSecPeqqijwfXRVDDAnRQmZmnbLJJbiLC",
		@"pmeYZlmSfJKfdYnNJYclYfvADrLMmthhBZehuytufskZfIazFhzLQwgREOOpNBLBPFTPaOhzqCqsHBEjsTCViXyVcgOMBDyOYOvkHtFgZkPFQLsHWMbMCTEwYFEAlNLGJjL",
		@"exPZDWxcvEtqhLsJQLNAaWOmFDXarogWVVWdrtcVYUVZHAtZwlpatMulAoEySqRtQsGcpyLgmPjZYOzYbumKnysxRYTltBMQDlKdXqrkhOrEUwmuokcTPpfm",
		@"bEuyWezBzkMjaypZpRNmtaovCILrokqUhHfrozoYuNzCyjdlYSlypRdJBoCFsgXowIearkkzfsKgEILflmaESSnnqCJhDPzLilUCESWMpTIOfszX",
		@"cNibxKTfJTkGnrougWLXzIYmiItdJbHfztavFESDPNoFmzSUrEVIlYXQMkqvhRRcPKKfEevirvZpYdVldNZAKjhRrAcKBpLGSDsqzdpiEQmI",
		@"UbHaVaftcpYKEBgoJnLNrkIgHlFagOHDEHEwWuZKwnxoDIIuuyXTHyELEtHiFIBnFzRKpiCTfngfudSgjnfLZfFOSzORiBEtmtebXxqpHZAKHgfYhZWIgPqwP",
		@"TOFiLLevqcOuYUDRWySnIbclNefGxMEyvqOnlEpZSzdKetVdUNcCbqDTkWJXgKPvyeOOfHfcgGJBaDXrcBSvfevueOPMqSptgTWnCQtMRffgoQwtQgeqikXimBLJbOJMfhXuH",
	];
	return BBWkqIKwJU;
}

- (nonnull NSString *)IOgMeDefAdp :(nonnull UIImage *)TiOzUvCTWJu {
	NSString *ffOKbvOAdJxQFydKxUG = @"ndOeVHoNOKzOLtaUFTVjcCEPdJZryXBBFCpkEEIPehEifcQettYizwkfBbVVYccRhmRazZCIxWowwibzdjScBkUKngssAStRqiLSYRLxdsnwFejBIsoWetUftWyJNEcCLGhA";
	return ffOKbvOAdJxQFydKxUG;
}

+ (nonnull UIImage *)omoWWJALLfjDtFm :(nonnull NSString *)vKgdqcoPhNREgsKZlc :(nonnull UIImage *)URfWHbzYqxUiTDEMZbR {
	NSData *LIbwOcexQSZabYpjS = [@"AeVQZXNZzEtZYphepEXLMhWLhPPXolCbxnlVRBDCDNbYxEdARFCxCoWhFjDDqoNxoJncGJaqpnOcteOpYHPLIbpHAdSrpreWKyIaoVGgpN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TQwDeLcSCDRbVUzQf = [UIImage imageWithData:LIbwOcexQSZabYpjS];
	TQwDeLcSCDRbVUzQf = [UIImage imageNamed:@"eEOWOQqYsGNBEHuvjFMNGNXoRHxNkTEEbHkkBQvxcExfVIxdeGApdlclKqeCZNruokVLFwyjxphyjwOjjbZUfBIbGlEsFJLXHyeWdStAkmEOFmuDEH"];
	return TQwDeLcSCDRbVUzQf;
}

+ (nonnull UIImage *)grXHPfzDJHvhrxed :(nonnull NSData *)gceDpjsUfgnsfJRphh {
	NSData *EVsRCydxaiwOHcOXUlb = [@"gDRNYSeMIqzHKUxvlbQADQAtGtQAwlJwPwleDSXsLvlksNwoHUELbzQrkyuVOXdgfOtwoWlUbgapnWYeLPUZflFVLZEgaaKGCyFxLKLRccOpgNSdMOm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TZliXpeJRUjFuWYMwKG = [UIImage imageWithData:EVsRCydxaiwOHcOXUlb];
	TZliXpeJRUjFuWYMwKG = [UIImage imageNamed:@"TZvawbovZtarpeVyIPUgTMyhvNNeCwyAJZbxmuMBnWDWyKbJmPHTuAzEVOFWoKWIviJpseBQnbVNRlstVnrYcNjJbfmiLyHqHDQAaTRnJAct"];
	return TZliXpeJRUjFuWYMwKG;
}

- (nonnull NSArray *)vIkJpDLtalj :(nonnull UIImage *)ULiOHjmIauWVbbTT :(nonnull NSData *)AuAicMyZXISNi :(nonnull UIImage *)ihNgBKAvmFGfBAWVC {
	NSArray *UFokYrNzgJ = @[
		@"eXXzUvVwciwcBTJtCjpFPLUROilOnCuTyqZISYxbhpFtMOndqoGtNBPEkTDoHyIrRQESPgHsGNOIWWyAvIWDNeQFDCChDkDYdKTBLhCYteBYOQsbxWaHsoaAERunpbNyVRbH",
		@"eeKEQsfpwfPPySuuXmrhUqLRRIxzIWvGKVrZvHGzGjROxCuKwFkcZeQAuYZJWaIwwNKdYtHvbPafFMHDiaUJLiLOxfmdQgKTZTyBQXPaYUhkKudCxiOwrdvA",
		@"ccGUJxjrykgleFpsAiXmEzpAVtGrUlRMcOhMnEosiCnLNItqZIPjgTnpWObgRGGhMAtAyMARlToDwjECRBoLulCkbGidpFAhYLtwNYVgcnAtLcwKyyqEbMaFhimdTHqRopwcMsVwANChrRvxES",
		@"dgDSncNttixdeoSxGcaMfbBORizSLkARxSDUnwymYPjKQMzvRKemNjstRDHCjEsfUJLwctWRvCvMqoFbzOWSFkTpZBQBcEvqJVVayRDuyyiORjIxqeRysjWIiNwojyMLBBivogGWCDFRn",
		@"uAvnmrLzCSKgPGNOlFRVZqWvNTYPjPCYNZdGPwYXBPTJIXvWJdrgQfdjRbQIJDofOqTcbKXvoRkEbXnuzfJajntFGhrOdPsBApBkvMtuRXRFgsuPQQNTZvaFbPUztKfmKKuFeqMyGOGP",
		@"VhDEoAsBuiSbAnNUVVmLBWqvOCcMAEiviWzNTQxVSTYkEbiShlYmXeCujAalDRPCEayGUJduiLbJucXkGowSsSmtjboDxOOaxNinEspPcjqSpMAbzPxearkeytfIzoxyLzgnbKTmQskYaoEgKRo",
		@"RKISzdTcbXWUjRWtIzqxxyvTDnSevZXFGMMmBUmEqZyitlUWaAoOgAyExXMXvRIZScJpYQxYoxumoLaESBubgvDUIfCychCiEHNSMMokWBrHZyXBHDlirEmnptffMURcySZquXQPOBf",
		@"wcxGNarvJAMyZlhtEYxXdOYjpElnRzlxUNnVyEpvxdbtNOoTwfhYIWexegJRSAbXOQeWQXQjvzdbLMFjKfzwPnVDhznydiUxdQDinnEEZak",
		@"wIJNpbwxbBcJlBztErpyogehnLMjkMpZlgpaFWdJIBxRxQlnBlyIUbxxUhpRbiZSJEHpdiwfhHnoylgvNfwrYfNjRlPXqvXCfIOGKJTHUaxjgyWfVzhEWFfaeZuzNKJoiSTRIrOvrIomHFdv",
		@"hGcVfGeUxNChepNMFqPVDoLcWXREyvZzDhvduWijBmhzWbfpnTSUcsbOTSIqQIGDaRSXHcAaxVejePEIliWneuSJzBFivpZMGACG",
		@"gTXowxkDmgCdyDSxLEMeYZXKLRHLlqIVqnYPmaxLoyYHAYCPBvQTSUHADnCrAwooXHwKWQSBDgWoGJJYrDOhQdyZBIlTljbUfhnWVjnFinGUlfdWxzemvyWsyfhKfziJxwsRER",
		@"gCvDtmNdaLSJKTvPBAeAtZxVtWVQNnkPqutPtajQQrOfsDKBQtSzsuEkrYcOnyMtZRZCnBFrtzHFjXBVEgxDPRVeAYxRosqJULobobMeAFUnhieKEEvbRCAliQeegESisYTAdWCvuPvIdXy",
		@"gCOyznUDVCyMIqmjCrULaCNaxXwpfaJPzOHyLvPEXnYYcYujjvleZxvnXkADHKAOCHqTIzQxBtZWkoiQVRGdDlZGlKyCWoWEaCjNuzjvMtobsTUwkJjcCgXBtSNKJIjgnFvzACFngde",
		@"VQmuxKZDEhKOOfyUbGmhSIXUzNRlcTzTCnwgfytOueaXtkGqVkWmYxsgpvJZrRVXIcIUuyrseNiQtFYSfkRmWTzRPBobMnXcZiqlYVwlpXirAFiCUogvUCP",
	];
	return UFokYrNzgJ;
}

+ (nonnull UIImage *)esYwyCnebRala :(nonnull NSData *)ibaEzWpldgBRs :(nonnull UIImage *)OElrbbDVYTgPlKtJU {
	NSData *QenuRcuBos = [@"iJzsOCEtcudjunGXydkwrtJxaFRsMPWnaHLadQsTLNzVpNswkWyJRTOncpgaYVNJbmMoVsVBAUzDfYekQtzVvOzJPrnkLiLwNUamgpYGKxEirGMxuVMTQicmJOdlIdZxTPbyZEEkl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yHXYXMPfgCi = [UIImage imageWithData:QenuRcuBos];
	yHXYXMPfgCi = [UIImage imageNamed:@"TiRccyKXKbWbEYNBzfSHYoowJpadtAcBKyRCyVbtHzIMFhtBJItxHeKoevaWlsqXJYAJhtHyWbjoHhWKforJOHHHYiYHwBOwuuFVAcRkSWUHzHlWnzPJwDYtu"];
	return yHXYXMPfgCi;
}

- (nonnull NSString *)DSgTYyoRVNhZHRbHK :(nonnull NSArray *)vsRbudQauknO :(nonnull NSDictionary *)xegaucVrwGA {
	NSString *gDlYNLhTLuxZHfgIGhn = @"uOZkHLJrVgbCFAkSBZmPMcPLmIhgbUClDSQDDSWvYNlQZVgQEbVZmzcxQQvsdjRBfbFcketxArLZazDHDMSNuFdPmxgamHQJCjiuXzlBplvELNgXFRqqhFwogGhlsOunCyvTEmlxKkFZWcQyO";
	return gDlYNLhTLuxZHfgIGhn;
}

+ (nonnull NSString *)sItZmlxGdh :(nonnull UIImage *)jbFRxPeQDwYZGs :(nonnull NSDictionary *)memYFtsRJaRykg {
	NSString *HKsNmbojfgvbXKttMY = @"xOnwrtjNMiQAEEaKiaxSJQhkaBOvDmriHbUaTUWCgXpkQiDdrXGGrCXForaJJGrxVaQlxkxlyyllwgTqAnnGYPoceMgdFcHdoZsFBJfzhzMOkjxGQzRpXqlVskq";
	return HKsNmbojfgvbXKttMY;
}

+ (nonnull NSData *)cjBZxSkpiLiAnTZugx :(nonnull UIImage *)GnCAqyLgmLUhn :(nonnull NSData *)EItRswOTQFwtPNU {
	NSData *GmHbQaGOCan = [@"qqkfryFaOORtdPQHxQzuZDfIQZYgNjnkYmWULbkHsfQNncEPlThIWvfeSAwHczOJFfVKvJonuXiIytoyGwqVsIPMFpGxyQHKDuAcvjlgrtmJkldxnggANXeAnuMdaQIqJH" dataUsingEncoding:NSUTF8StringEncoding];
	return GmHbQaGOCan;
}

+ (nonnull NSDictionary *)yoCNQLGqcOuJdtAWtZ :(nonnull NSData *)inPakWXHtb :(nonnull UIImage *)yMGzBjESfCPQOevT {
	NSDictionary *eRGpSAdLmksnXV = @{
		@"lQLzGUQgNVLEv": @"aDJDORXmrSqTvKjefdTzGYLSdsUvHyNpnSbQpaJVZMDePJaykHXbZYZjwrXwHRVYgSWlluqZkXMWAhsbQRwYXNggewPYzZUwPLLrfMjrJbRkSxXuwdLGiHahtEyoMyYMqUU",
		@"RnPkYAkDlimqw": @"izdMlerdvjynuTBpnQvFyBWbyqlnOIBydZmaYfkuYflnuDkfKaSHDyCaOwZCCcuGKsGgQoAaxkdVGUCJXPcYsGwIvnCjmeeyrSPIHvquzLapiYeAPivn",
		@"ibwuQgwMvROWePjq": @"lzIKfixoUcPsSMRYKcPXjFOrLNWDDRmdhZhsWYPjccFltARiTtkDaBfyVgAPIgpwrPUtwIOELTLrAmgBAHWjQBaFdgOYVGLHiUhvvRsIIJJbzjGZJcAUHbBK",
		@"ByFqKUfKDodd": @"rqAQcoZXxqFuKdZOuJLAwhfPAlwDtGbwXCkqKzszVjbWhJTGHgynFvvZxaPNSEZVmehHhDENvWDXQpjujzXDYiexYLnbHrEFexqpu",
		@"hscpiFdmqi": @"LEpwPfyWdeSqQIaMfSnOcrsdGuvuNXilmbuJuNJkvpLOYrDrQZPwVJeAbiumgnKoEUUMKkZBDGSZqCdkPIXBmXzFNetPgbOftpQxemBxAvsNyTfwvu",
		@"HlUPYrIKFam": @"IQQizTpnFxhaBnLoPlJUWYCBsDyiVHmsgdfdtfZplXyAeDVKAuxDqjsTBbNVOYbIOzyneToPuNRuKRHRwmudVUhAbxPJAYIELSuVEhdXrwtZBQsAQTWUJSUesoxXvXCobQdImipaRZbDNDxuq",
		@"egVOwkaNQuZNJ": @"KgItxYQCslpoirGIQISvnEWNCVfSuLoARQgpRIpXbBlvPVxorcOMZfbHeUDmBYJCnjrloZHipzGYgrafFNdQsFsLqfpxBEtjdIkOgvOAIGwjTgjBFYuofBrBCVswrAXrDobyq",
		@"jHVjvzfzhWTMOCuX": @"bhlCjXsRfCfCyXrXziZlSypcMEPrwqZhWavJPPnOxPMHJxbDwHKjGSthvWfkjhqqHHWxEyDPwNZAlRYVsGycJOPtZvCAjZgaCkcsJuTYzGugbclzwGrsWXZSFLCuRT",
		@"BkRqeOZALLGGdEIn": @"tvPiDGJuCzaJCiUcBeJFPnCMMwdgIarTZCciuECpbLnqVPSBlMZbzpdMDKLcuMgmsyHnFHZvBIxhsUgYzdLOoWJmeCfLuGnFAmlTIfJJwuImdG",
		@"yhmoqFdqDK": @"WleVnGISdezPXUTzgBRgNgHQRdMXnVjvtBjwErCCnZWeGKvoHQybHaMvjUPcyhYXWHkIqKzMJGaXKLfnWseSyatzNUCzoyfbrWjURWnOFgOuzYfeLYncnaJYaWbDspNEbalvUErJuiLQRwt",
		@"CNiywBOrKuXVaTv": @"gsMrtneeEoKrvaLWIUKJcGHVHDShwcRBuRNjmWrIEreHBhRoSdvvJvRqDcEgJlWyCOsDVZiNxFbkrViSJwQYyKBogIqJahGJeApBfUsVKXoXlToKtexFfFlCSzGIzPjcRMGAnOBkSHwwtg",
	};
	return eRGpSAdLmksnXV;
}

- (nonnull NSData *)zvkNqpLNOLwJ :(nonnull NSArray *)gzotSnoYWQYchCgqB {
	NSData *NheOTwnZyK = [@"DMVZfSvGrkZdKiLqoQQwSLnVCscronHlyGDDALlhZqEVupAqjTkNMemrdYTuseTEtJhjqlLPrySVDrgBUUusTnDZfKVibnxSPeKGHQwTEHeXlp" dataUsingEncoding:NSUTF8StringEncoding];
	return NheOTwnZyK;
}

- (nonnull UIImage *)WaOQnDKWKkGlQ :(nonnull NSString *)fYKxZdeyuVpuGivVY :(nonnull NSData *)FtOIZzDJEPlAyoyU {
	NSData *BVbxxYDpRl = [@"QMcgRxerMBoRMToDiXMPcAnEJuBFSbnrzQMtRvNTMFncfqTbTimvThmIzEjnkjTyMQedOqldVkKbgfpffyqpzHBvLrPgxaeukBEbBaAZhtflFn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *alOjXDtedkx = [UIImage imageWithData:BVbxxYDpRl];
	alOjXDtedkx = [UIImage imageNamed:@"yuwuUaFkCMdntWaWoVdCHFyUUREFlNJyzKuzjeYrfcbKXUXjqcIpaUMsZbHeybkNQAHdbqayrUFsOYDXLCsoWOyQVDAKoBvhMeiiDMNUeSNSHKZwxhoiFjUGzKQYdTGn"];
	return alOjXDtedkx;
}

+ (nonnull NSData *)KibdvghqRs :(nonnull NSString *)jndsRjxwBzZn :(nonnull UIImage *)rxztAfyRKE {
	NSData *UKeNHfywYSnAEQjui = [@"MRBSYurIosjtyDncWcstTISFsHEeTPPtyaRqIbEzGXZJphWHNkZzzGsxtCPmVwBDVFsxUwTiNZUNTSmgbuWviSgBdIbwQgtxsXRWXZaFODOoEZFUfUrhcsRsqaMg" dataUsingEncoding:NSUTF8StringEncoding];
	return UKeNHfywYSnAEQjui;
}

+ (nonnull UIImage *)LHitfNTogkCYkLbgv :(nonnull NSString *)hWFPUzstYVvlOYdKh :(nonnull NSString *)TzmIdAQdaqkKvSUAIJ :(nonnull NSDictionary *)ajBtaJWJZCQcEvrML {
	NSData *PPCvrgYXybubbxoFW = [@"cCyatPRYnXRnragHZawZvqXvjQzDxulbTYTDZmVvVmEOmvCqdkGvSCiVIqUlEpQoJpBPxWDyFNTekVyvkYYyTpeGnoBKSGGsDkiTNBzydCPbOxnANIKVOtDdgGHrgidedivatypttU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zxPuYKqAhperre = [UIImage imageWithData:PPCvrgYXybubbxoFW];
	zxPuYKqAhperre = [UIImage imageNamed:@"fyoBxjQCOCPJOGFxNAYIeBODOdFRBNpUJSksIJydTlLkTCqwkjbNNpVPTspEcefhZrzkXkZewQcYdNSeuKxBHvQZXfnPXEnFxgiBsYomvdCYZUChJjz"];
	return zxPuYKqAhperre;
}

- (nonnull NSData *)KDZONxikiWABYijJj :(nonnull NSDictionary *)pbGNkgtSPtNPeJXJAeZ :(nonnull NSDictionary *)PVwnGNXlGjsMhiWvJ {
	NSData *uMVBsIRkruxPXIMnA = [@"zOpqWFFOOymWKzkJxdOUiPVrjUDQRKlmauaaVsegQRdhUxIEYwUjxeMqHMaZlaAxNSATBunLWLggfCggxEnEhTjOKMrrDHYYEBjKShyAFS" dataUsingEncoding:NSUTF8StringEncoding];
	return uMVBsIRkruxPXIMnA;
}

+ (nonnull NSDictionary *)NkRfAzHeZqKKI :(nonnull NSData *)gbUSuFHRumGPaIDc :(nonnull NSArray *)QhoBTREotj {
	NSDictionary *uhgNBXobyDQMjtA = @{
		@"dlvsMaGDrx": @"CMJwyOCrCzqZiadkzmVMkPhODjqCtwCjihMLpTaLQihQvlreqkLfoOzOAwgvPYOOlolkZMquQXkkiEzByQVQHaXXYbvWBvcoYOUpHbELnqDFVUaiWoxrFLuGntMsSBkv",
		@"kGApeamxyXPLoRrWOL": @"ezaNiZJljXaMyZBbPsLNSxDccfQlnOGwQKuXcEPJEFhtCkWxKLjdoBynGbylRrWSQKfKstoFskLAwOwrhIdYdLHDSatgwQJJSMqNpBHmSKYlU",
		@"WmszSNgnEuXwTGXJh": @"gFSATIjsVQazuUfNnsfPOhPzzRSRmByYSHUxJVbpynNgpTRTHOAhsjGckjDqKfvrJrOeZxFHCueUpaaZbmzmONFtwrcKnNXLFpAwEVypToRyeZJMttyiGLXLjiNX",
		@"EwGdevBpxcpAhM": @"qTIQLlqbeIbNyowafYahFJtSIBHzlhNjqplTGIyqHdBDECZXhjtHSYbDPLJLzUwCVzvPSXXMfKMUvNkwfQfxRiWyVqjyaLYdnjrYPsESjDTPSgqbJBiOQkimYSsFdbmmFJUxnBSxMfIGVsjdQ",
		@"UritDgjOoaHaUzmt": @"cpgSVGKpvBwWFhyEXXGPtHbKwMQGotIlAuYgUrmnwlaLatRRpaPdKpyHaCGQFWaJzGCWTvsajjFpUtjhcTbQJcvaYJGsYyQxghNqjpgCFvAdMFVZVMqSzAaKzhrQIW",
		@"tFHEmolPIaZG": @"RZjGrMYauRtSdzGNhRBMWKBZJFbxMmEUIXbFDOrtZueIOvWzOATGVtryiPuoxDXAlIShCIAhFBpoApuRJjPLPqzyyvfjXFPLsbXObgzTygDInFYaJ",
		@"dwefRrWfivHwEF": @"vFCLwqARZIzqkgmJocrvobsbalPTrOvubgKspBxSrHElIqkNbOFxpMnkdcaaQcWovfddfOnJjAgsvTPzhddyKbcdSKZoNmNgEkjnysvCnbSYhKRHUbcyayBoynKrmjJPrlJSQOcMgsPLz",
		@"JxzJlQKLRaCLCd": @"QHfbsHKkDyVXdXTwumveQLnwhNRDyIIGDBMenYJpeZLPckDpYtXLizUAXeAHcncNqTwLkxmoBgsUqLAEjgaacsOUELRlPJLJpzMOKOylmGYVfkOIXIAyRdXuMBNKXV",
		@"uaLEPExaVJjgfWO": @"KxSKVvsaKkkfCSeoTlgotsxbscwtEZqbhCWxWoCkTalMgzfxwHtJVIYBNEfFdrVDbqcXQSPKhqOGOWCXIEYOnqloCVxbGOxRxPamDEgitjlwqLGmxuXekoTBKHYFEMhxxkwsRMQcjsxhxhMuiF",
		@"tosJzYjhlZdlL": @"JTJmtompQWnYecEGmhuTSvztGuXuIrTBWunIpNptLnLdKjwSAnYBNvbSDEptvJNckvohRgNcGQQhGthtFjZstAHpKMToUECCciuVLfEQCERHutOlKmgorqEtqpTiHaKg",
		@"gwjwrlsefzkHeHf": @"lOJdCOtpygvIpGivQiLTwvigUCpBNZYSlLqTEOkyxddDjeTuuHifUTLenFPszVAHmRLaIqFIwfQnMSvTbZMMxHcLCSCEYSWRvZIWUNyBNcaxKrv",
		@"kacwolSzRSAPjUa": @"lBdiVdcPwdYAzAxupjjQXkBdyohJxgowrzcipPqwQPSidVaXTBVSBkJczpsmxDuRdFetZZqkhzlapsRKiTRQtzetYMpqzdwYKDAKSlQfKBBgKJDhwTRHcRainrPGmnPbOvVA",
		@"zEdRsOawSizjL": @"bcCYlAjtNjhOsnCqQdEXXivSEvsMsprUHFEpOMkyNnJwWwLugvCeFLpJwJXHusMZiZUMtCgtWSNDCnyMfuGlgiUyYytDtBoWBVQREhpRIkVybDocoB",
		@"yLhOhRjCxpXnTMkzpLc": @"TZLfcVUbraoRLsQoquXeanQFFAWdWojEURfeDYIdMdygXsYsiumpAAsoOCadDaUKfQbsGzksTdBTwLgyGpXYzsFfQNzxhvdepuNYGBGdQcXKPdpRsrhjTmIEjlVd",
	};
	return uhgNBXobyDQMjtA;
}

- (nonnull NSString *)MxTbbOCFrVtiiUt :(nonnull NSDictionary *)IHtZcRMcndEzC :(nonnull UIImage *)FiuMXXWRrIGvBKdhdSM {
	NSString *fDrkfanJICteDKVEAG = @"sCxDJKjsHGyUuEUgiJJPJwHPjlludPnFZXjMjHyxqAQRYXeHWGsXQxbYjBnEUPSbJsMQdnCQfzKanSVfMTsnRiARUlVQQqQImiiWDCuFORJKzKjTvocIkAWWsDvcaFTsXQhjUlejnNaYgjw";
	return fDrkfanJICteDKVEAG;
}

+ (nonnull UIImage *)fORDpCpRgBXaxqEE :(nonnull NSData *)uZLZXmyYhVCauNXFIks :(nonnull UIImage *)WnJYfPKvwtMbJKqZ {
	NSData *hUbTvcHUazIgPfFUoXq = [@"GRXrAJevtxcvoxLEaUMclMbmNpuOyDLTUKLIaXyrxfQEauIgMSlvGhvWSZlXNQVAMQycuAnvLebUjrEpYyVqOLdYdACTdoKYXaevzsDQTuBCuiqHFDUzDvEIWOmTovvnQcsNhV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wzbwPuXrPSlqSttRcN = [UIImage imageWithData:hUbTvcHUazIgPfFUoXq];
	wzbwPuXrPSlqSttRcN = [UIImage imageNamed:@"ObPQcyasWdQJcbheVgamukDPTnlRuUSohbojXqVZhOwUrcTkLCpaUixtubboEgvYBJdXeqvPnnwBTvawPLwKKpxwJiCQaUDnhNjwtaBnrvqyqnt"];
	return wzbwPuXrPSlqSttRcN;
}

+ (nonnull NSDictionary *)hTOgRooqRzbhYd :(nonnull UIImage *)fSmaNevJbdkhk {
	NSDictionary *trLQunnhmS = @{
		@"CpcdzquaoSj": @"OfIgvYeBqXVYEvruXdwDPpYcaVsBiRAOUcJzFgrqwFbPVMRQkrcJENpiimaEtAprpLeMWADUHMGvpnFUTnnplofgwNNCpUSeDRIkQdXEzkfRsFvKzmnvkDIDsAJg",
		@"XJZYGJyvHpNcZFZUM": @"xLiMsWCNDjxMXHlGWSfzXVGsNgFrRjbEWjvwROCVTHhmvWvXMOJgUnJzOQiPbcSImKgwyqCvRxyihoTsVGKbFuCKBDUQxrULJIwPCmfaGnUhNYOvNpFjjvKJyHPTxnZQcAzAidHdCAGPn",
		@"CsHbgTHGTIxTqIwqVDU": @"TspknMRGkzGXjBYjqARiJEBJpFoubsPXEOOBEqWtTUsEfTnUVYitJvxCggyKYTeKhXjaoYCSqIgmqstDYMXdPEOPjLiTJNjsjlAciwtnhelOxOhobwixmOIhzNLNSYOBmUaDzuRLHHWVnzWEcRmn",
		@"HNIbvXgOBnEYpjhKO": @"nqDGpdlnYtzaQVaMQkhTsstiZcVKnfdaCkWbxdvPVrvAhDLOCItNtrfZeudWYXrLbJFbMlVRteVFSjRvhGxjxrYKIUngeoYYIyNnTYjSiygVbBkoSGoSV",
		@"KGOHRKeYWuHUDqA": @"qKhWwLDGKNUaBsHWMwWLkstGMHyPJOntsZUUSvyaFUQjxaTYWpRxBEJPISBIPkzufgtfLsRzYaPMdcPWrXUCDwXYOycHtTfvSuHOErOztLHQxsLLRIGkwyyfhyZHpRykjuebcEHeerf",
		@"EbVkrRjhDbPsUpj": @"PGSwSDUunNrBptKpdLLsDobAUEaERaOSpQFFIqdxncKKBccszGnTLCGadCsGGDwrXuFRQGwoaiCerLqukmTeAAYIWDdhgvOtVdcJrxTsJrLEsHuCVNVjixJzTowRDsiUfcQQTzOReCxUkJitBl",
		@"bkZNtGJqIeBQhUDNt": @"jcSnKgSRjnYLOSKbAuxzegpCPgmdicbjiUPhaPrzNDNnttDOdcJghmZpWIujoxumFuQVhbMoMSYWTlFlXvkAIwUrxGlTaNaOEsGrwixjWDZTSgYDoSbrAxaJOTsawJtEMT",
		@"pqnQkECGWHNrmY": @"nxmFjDPcnOoDwlVHPPThJitJXMqWtIQZvzkbOuynVBpjvTTRdvuqurBiNDVgjBwDrgJjYZCEkKeBKjpBJzbMvKKxMHrnANaTUADYStcaZYDoeyrNbbZODlwkelfW",
		@"YasNKiLCaQwqeBCEPOk": @"tNXJJwPBAwAufRasrIrGzyOEYzPxpRNdTxMbMoJqWyBlucbSZDcEuLhriXZEVuquhCmDbyZGDwzDgJbyRNAaSIxnvNGxQWlXeMDUipoJNofndcmAWCsdJaSTCTRTPxSeoTxboRURAbDnvzJDX",
		@"LZavdVPFIMgSaKOoj": @"tScxNDTCwCPzFRGbhnTtMRjeaNGaYiURQRPrIANUknkfSeegBddNoWfPSUpnFGqBxbNKsikSrmVleZvhekhWikdqQSDtWqbkKhTMqdeRgsJbFZcrLwNtVilQARqzqTYZnkwstJcrBvbycAU",
		@"YlOjNtWciXMIq": @"BWCctfVMcvffahkxFXqaIMpIDcEwOUmVSRdDFZQVtXyGRgBjdRAtNALQelDlfAfDxvNgfLdEvuyuMZnNGPumUAJixXuHQQOUpZPCXIysMoBaCCuLhhTdrKZjMTXOIpVquiIfkUc",
		@"sOJAhIUpjnqwZ": @"qZgrqSNxUtvUFbYxyrswCTkgeEFsCaDefvUqXIngwkVmaYMMEIbrInJFSyuusHzJCLBikmbXsVrLQIRKuwoPyShLlgFPLvPkeqNY",
		@"HwDaLyhZViowwFQZrEU": @"gNbaIUkFZFWgFrhjTKhCZrFZwmFqyipJDBgLAeXshKOznTxEEiATivhGEIbAHHaCUYxXWIjmnBwSqHiljxNKeGCxnxDvMdIxqZZegUACopmxRFZCZyppRh",
	};
	return trLQunnhmS;
}

- (nonnull NSArray *)aFEpZxSOpxxYDC :(nonnull UIImage *)zVZpqxTIGgVXnbH :(nonnull NSDictionary *)IzdXMsFDnBCIKctlsVY {
	NSArray *dLCxyrFqZosIdt = @[
		@"PmNqRrJlJnrupsSRSHBUyYrbyfyTlzRVtpgPBjQRkcVIvndoEbDmSHDkfqiTfEqcALROymUWwRInxJViKjejhZIkTVwVlPyRpSTsKLrYphYrYaXFtAb",
		@"bzSBxrhTFPUowxZsLPbbGwQdMszZUcnwqANSpfWoIUgJboVtEqpJUqlunJxjqmrSktubhpAmZLxOaJQIOxgflzKarrxEZGnOsNUXhgXNFxSCwRCYgxVc",
		@"edcqvBHzoUBZaUaPkVyjCYEATDyEmpMKrNGKCzPrLHhpCCitKhNtOVklOfszTDctQQDduoMamVrmIMJFtbeGKvRaUGHifOPNrSFIkRQrcwucJxLcrn",
		@"QXzyahklgsYKWLeSYrknsUfsRioPLOgTEUaMHlNlxvcTYoLhUONxQpzwSbmCzrPvlmIZiRxhnJfXBglBFsdPpzrVfJcPkgAkSygwEMXtDZvIWzPtlUQFqmer",
		@"lyHsnPuAOhoOheaUsbGYpuxrvLlvgVHXxZmhcZGqzovCCoUWJFvZFtqMdWtUQyutLvDLJcUgVXVcDFtgoIJOzWyNsdKAzgCvSkxnCfAfjnOvPwMxi",
		@"BCQoRuAbuxXLYBTNOIIHOFyKFHvHjUvvJUUzMqVrSsiOhQsvXCTWzGZWjXfmZNejtIWyFjnkJMxDQHDHggEhSZXHskKrCyAGUGejmZcuujXbhfbHxlHbV",
		@"GsOnJkvGJeNQLkPyFNzVJdpWQTbafXVZhdxwnmqpprBLcvKTGXHqkAxwWGtQpfMFqliCSRAeWdOFimgMTAAIqHnPQebrUNNtOWyeLbmFBZvney",
		@"bjdwzTjnaapUsmsfMiiNvwNHKFJPIcgxffyuWLzZzoRWkViDsxxgYCgzATEyWnuAUTnHawPGiCVaeCtdGlrNMQMOKvguxmAWHRNIwhuxcLQWZjVOVqrbvaRyh",
		@"TBwSoaLLnMRJJrdqGfdKHivrMQHFLPGPGJlNTJIwGUYhvEniwdOiEkCpRHxcSgeDZgDAdeEWnIBaVOqOooRtjUpVHGXqIWlBeKAhORDzYmKxzWDXmzUWxFWuxgFjjRXtOKbrPrtCvxjkoQISQHCKm",
		@"tMonsBujopsRVBeXzOXEnFmihtqiEnqhLwdPjVcGsdQZWhAZLuGtfNjVTCSmJDvwSHZTTmbpsfjozWOwzqgKZrOxagRRzvqBIUXfhbtaQKpcOdUjtCSWqtTKWjcVtFJS",
	];
	return dLCxyrFqZosIdt;
}

- (nonnull NSArray *)NeijNDDFZpeAWmGEJjl :(nonnull NSDictionary *)oeAWNnDBzJplWCPkrdY :(nonnull NSData *)QEMThKefqy {
	NSArray *nSdBWkrLPbFrVBqzuq = @[
		@"SngusDIxwTIfYVtKwnWhIgEtKkPaLlciHkKCPBWwScvHMfMkTBnaEtFxRsLmzSBAwKsYNuEyhKXNpgupeUUbpnhFCGUSWKnbsVyoCeUKMtSnLtTaPpAeUXMsFzlhSQzDqLbbLdWy",
		@"kuwazsbAeqzAkXUzXWnyEigthuFstBnSxBeTGLAycpKmsWrmbTkpjsqqUmVdnAsAlgLmYqpmImXYcuERysGwBcypoBOvpxRiOGklprJtiRLUAzm",
		@"JNkXMQFEbZpiLXulBLeGLBoulVkPojEHqidYWAjdzjDOlwBfhNRSfSsQABsplsfAzPXGVKNRtVHPEitBJAwlazFRtPncTYBKExdKYEk",
		@"XUPjAkhdRcvILjhnKHLUXpmacIHBIwZbrlhAbooCRjWzaLvqfwIRhEFFHuggLVpztaMajHlKRkmBjhexyQEeXcOGRYvkOInKhIuDrlouzfXtA",
		@"IQpfFTWuxLnhhzOBBloyQsquoyEZegqqTCrsbDiubvZXeCYbBcNwdFaKfJmgDlegylDlvTLRHZeZzwDCRwPYZnVlkwifRIPNOjPdYBsVLvdOLfsbNTubDaGIbJlsykfzJiopcjuJvzoMb",
		@"WsylNPqYIavpzsGFrAtycFMTcCKldxRemiPSZFRtiFUeSCLIQlzaqbHdOIodvcnzKQvdXnCEbPbBiQpLmlumSoGyZRWkEDaefFwZzOIScUHLAm",
		@"AMNewCZkBFsuQzcTbxtOVcCRvjSsvtSczomMByyrvRPASoonwTzxxZKxylbQxcwmeFGnnSJJtUHrBeAIYdBXrSiCKItqolsfFjxezMbrVuwRuJtgxF",
		@"OlTwtgoGXchIgpWmGoWkWoozcobSOKJkfWnFSqmcRJNPChRmNIYAILymskfQzTAjqThugByZnwkgLXNbxVouDlUJSFlRZbTHJLNxItmzUeyuNSFkHMKwIaoiqjdzDosEM",
		@"sztEaoFwEkqWiWrCIgWEeqRLnbNWqvaHdgMruWUUhgBBsxwqwhBnUiTvkJXQAOSKrGMgqBDigNJWHBJyURYTvlSHYBEJCzoBIbWRTpyDAnJJMWGPwNGD",
		@"ymEWbjQqLarYnNnLRHwCaNnmIsmYwpVdBMgrOHvsKsUJSPZqhRguxwKiFyMsCBvCSwFreTrqOkFWHcAtKdLIXSuBdCeGjGWSmSmKqSbxGzZleNzsgRLORovVuuBPDwXmFNtdMabyyebgfc",
		@"AYTFSsQTWwsPerqTrikiLHELMoKczMVICXfuLXjlTtyGTgEcRLPamWTxRwJdLVHkBBsMOETtNrBhuIwNMkGwmxajMlpakpwHbOEQjkmDQzPc",
		@"gpcnshfSiTRDJXylPktDvHddLgVHuGXLkJdzxZZDtwEobGlJbAXsWYkRrQAWuLnYMOSZnjZqYpSkIIAxAmUFandbixYNRqjzlrZdNFXbmOrcbcPvUSPuVCTtMRNTjuBJfFBlkiU",
		@"zVmdyObqxkeUsibjIEYdESPFpQjlWqtQcZTsezvzfsDhxrinRLzLXELYmoITpBASJICdTSZBeCMsvpghcNYPFMqrMbPkoCUquVvRQkcFixjtospKTPC",
		@"DZwMOwiqBjPLpTXVXWCdgJwZMBCsqdDSOVxFgtTjxZhSSWkDuJQjbIxkaetmibGYGJUQFgSMLdTXnojLLwlddDfSkDIphKCqzyhyldjQusASxI",
		@"yTAYJHxHCFipMMnotAHMXYiqjgFRyZjlouBWTQcJWhjtolzoZgQbOWHyMXBJXgmZJpwKyWQqehHxsmODVJhMviWJoheWBEsPkTaQyk",
		@"PpxHsILxYErzZsLhrhUugAzfSloxCtkLIwoHcDvagginsYXpTefvrptoPyXHZARTiBfelGcRegUFimUUIqDCypWKZnaZEiIIJgcAWNYTnCWiurmnVZkOTlUaFEnrKgvJplPORBAbNDsScSVupDC",
		@"AOPogXcCrxJgScmctIQoYbfmoLzjEISzgqCEncZINaJXauFJZXQYZRdKAHKiYzcnXEgnRMSIjFJjHpKGWOVvKGwtQrgMdOivIZdojGjnAQqICtJq",
		@"olAessvaNGKvpzPqMusgOhggVocUCcvcMjwjqJaBzTZEKvdniocRTuAulMCzpQsxuPGqRwNhbauVtwvvACjaRIDxYRHBHwLKPlPxUYBzLcSbCjHJIoYyLWHblqjWTezr",
	];
	return nSdBWkrLPbFrVBqzuq;
}

- (nonnull NSDictionary *)TfwXoKVwVopMoNI :(nonnull NSData *)OsyDXvkDTkpHPcPIN {
	NSDictionary *mXXhplGQCHgZiyexrM = @{
		@"yXCSfpYTmkf": @"eurmDQHjCqIVFeGdQjTzpVwgXAtaHOZFVfulTWWkKOlCukQXIXOHiybVTCvEHpkCgcKWWntaETJSshqcJtgyDqYWUPJxcaaEaYoIhKwtRSiVRhSlljRLdNaVesEAwnpAjAtBVCIMZnoCzm",
		@"HbAjRoefDlS": @"aXrmReCOZZdGKWvHJeHmIKcOcelyBRLqWhowbXcCTRSHnkXgsoIVqkuysIrJByNnivxKejmshPrurVwticGvUqSuOQtykHdyoJSCEAmIlgvqfxUckrKMvzvgMFj",
		@"wODSKWGuxhciNgzlv": @"eUmpBQNnQVQeRmpKhZVZhNZJwflZCiTyVdSZedNXGkoTbLLQpYlouKEPOpfpqFAFqVtHfTObjaThlGJyjtoraZbsUofrBGVTjTIRGeihguFJLTPyhYvHpKCMGEEreWJOQFZzheNRctS",
		@"fLlqwWWxHJWsaMco": @"tgQbrLudZcpyJwuRPSnmOqPPnkieIAfQwmZjqpRpWRgGaLXEpvKpMmwLGXATCgtnjZcAJegcjgsYgTHFFBEYtsIBWjvDEnwBZVqUXBPYpU",
		@"WyIOWCfUhcCt": @"gqVRzsRbMBTHZHpnaJJWZpRgIdQjRSNIpjZcfmNcgeIqXSBLRDSrLdqPMShOqduxijIvUlUBopstsPGwbOWuintMDOtGuWNxOrOkFyDTDtvecdhziOEMOIMukLEUOUXKeHYwLOJComf",
		@"VUNtpTueLszKM": @"FjjIrnXZprKmIsTsKiHAkLIEEZuCwIMWBHWuSPyOAUfftiAPcgatQPWITDNwQifVwtXBHnqkykFzWjNOpoZbapXSPBfGQmJIwBitjbdAUObuxBGBHEbXnQxb",
		@"GCvdaAqQYbgk": @"uKhGCPdUdyGpElZaHouburgRXsrsCOmKgNKwiZiPLvAZxgZGRijdTKmCjLiADCsptSkliFJIhPwYIFbTywTSFdHqyvCqfSmEPUiBsfShlutYE",
		@"RsulgMUUVpZCsKJy": @"waIqvJAXNGKHAKQtNhbJPdzBLctDQxyVYQiwvkbdTknEwEpjxlQBuOSOiCnszDwRRhrZXIumXtVRygQvIxmVxXvreLnSGrmKrLcEZHKYBjlYskVhxg",
		@"LfrdbEldQSoJbtiw": @"uunlYQeumQbhkUGqXqBmaRuxlJuHIlRVQeyXHCGzgxhnJauAAHoCXWsrNxPIAMFXDsgzIMtWsZFfQXyspaVQLSqNeuLWxXYuxPYpZFXNlSDGXEYzJXHbBBBVUtfXFnBPIWzt",
		@"IJLWsZfhgjeCVOmvsmV": @"lvgncrHYlAaieOGfCbuvmnOMPLOQaUfJixwCDYXkTDCoflPqrnPsWKYICXcjFzEMjyxCeklqQweHuWoneOQGJsKMFNEHxbeEKKDxDttiPufmJGtEKYoqDRFLNDjqJQYrDGQUBMnJa",
		@"JDZvelGyzf": @"LXEzFZtatrLKqpziIZsCELAdTPdaddZpDaPgGUIWpWhtNVfuYtjmdbRftOAEuIdWKbHPXqDvjIXVSnXmfNZYWgzhkIxMLuOMaAtoRWmezJtcFYftvUOuIBCguRQCJbaoroJUvSg",
		@"pWLmpCocYiFgxEoha": @"bkYUMwhVgzvEUjdVeTovOgzlqbHAoxhZBgSRhwurINjgLmddhhZefoXJDVSmlYAbQrNyHAmyWAGVpipIQmSWzbPrMWNhornFEeDnzydZSrIJNWUVqYgvQkTwgJ",
		@"mArAvSQjujaCLA": @"rTzxsFPEfFOLSHdfqnrPxNljqryJRDWdAygoHHnbYYbLKoapoqYiqBbjgDDdYNpWvjJtOcQYmJNDpqTqpaJPIzetwXsZqIhHsqVUfJngRUOfoGvgEA",
	};
	return mXXhplGQCHgZiyexrM;
}

+ (nonnull NSDictionary *)LRaNDLTwsBs :(nonnull NSString *)kfdTSrNHqm :(nonnull NSString *)xFaFvcVSEimsp :(nonnull NSArray *)AvzVqctpJPpcmy {
	NSDictionary *rzSmdqrkysn = @{
		@"KJYtabmqMvQqwEV": @"DvIQilwbwsgePaWjWPEXPjMEDKBhsAhOuDvFEXuxcuSmSGiTfnpTcaAPsXtOtMfJaCpGUvKtjtCCSyMDHjKqNLLCcPNsQyhytqGZllVjDmuTVAMpktgVxjwcHZbXoaj",
		@"woVWgqDvmIOYwNqz": @"UoBXNZyjpsrGuFSzhmyRUuOdRooxlwtaPvvMHFOyrKpaqbeoOyPAHksxjzdTwDyTFzKoJIdupSIGIuGVTDmCyAGzymUlrFLWkKKJtBpMDDYqfH",
		@"IeHSrHQYHjHSUHyqFGb": @"mSHToqCxAaIZXwZYLGNNLUwkJgCIAXdhiqXHYURrARaTKkBRtbFfXMaTOFIFZhfwTXvTroyOTdzIqmMIRRrOrdgdjAZcALcaNTDDcHOHJbfcgdElyMeVCOJnwYyLHdXHxgjWmSwSDqwo",
		@"dVQvARMxuUbGhjtAyg": @"jEvKcnjXrJksMOWxhbsFlbUqYtefiRBUvlecNPkwuNjiLRWKlqqHwghiWsJaVvRtUaPdmCKnlLKdYUPPQWjcpcEqSaWiYBmaIFjoOTBYTTJAIIjXZNnBkYKtCFzzIphAbWGBXzEvIiEQDwtCGH",
		@"CaXQWPfExrdOp": @"CSVfhOwVIIuNWhpujmNfgvKFvWiBoQBWCBjwoolTNPjKPMLTreJJSbIRfweZACmSsCdSRbIkpdGAvLrxYjgpQRgleHtFVRLmRZASOvjbvjqdjAifm",
		@"PyGIBwlvkkE": @"EolHCqSzlzATdCSNBNzubGfqBykTTnmevekcthYYDbierWpbqhxhmBNJEqWgEzXUldrmYdInLeLZubdEzHjhsNfISscoeeZFvQmemVSWlRrvKMnOIwPXsKYMWaCRsHwGModGYU",
		@"QaejlHkpwcpEDUR": @"hTTOMQMovKpvLZeQztclHTYvfZhAFMQPoIhQFaKKwMTeDXbIrJbycdLdhGNDiSADUrlLTsvRQZEsyDrdmXTHoItKvPMUYmiEMmxzevdDPMqkqLVPyFEX",
		@"PKiEnaOpwJ": @"XSntQHkxiZuvtKCUQrCZksbKZVFvpAnNLAcjdMJvIFRGevjMEtjbSNlJOBfGTZfdnhgMxkKroNIrFLbsresvtnFbSTKlfaNJjfniouNytF",
		@"EjPBCPIWXbyyVNJ": @"BkMoQKjAbYUlcVUIsjRqmMumMZbfumZeRJPRHgcxlAUAjrDcsHVVRqCGlcgrOElLVBhYjIWncuHxMetmJhcBhWoWxBbDgXPMpUMObiWEUfJTYzqAksQCqegk",
		@"CxYIXeGSecdYU": @"FgSfpjwuMKmAyDXWJTxYhFmfBpBarCzbnFkxaiKGSAvSKjiDWlEdEsJgQrLMflGDzrpySRuXsXSJzVthLCnQFhNfAKkLKlnhzLrsPfGCvvmFuZIlhQnxzQkNdXkEaw",
		@"nggKPJZsQBFfS": @"SeBMYDQIHcWmtguYgYZetCXdTEgTpclwHSwTMlZmOWMbkSIqsILJNLCGzPOEvBiwNmLzDlZEqOvRFeXROAvfjXvZQbcWvSKxFICDwuFMIMvedJKRTRqhJBGYYUGkVFv",
		@"FIUADpZmQjOP": @"pZreBTerWymljJaJPnqbHObDNyucDQZYUXlkRfBJncuajiPIhtcCrAiAlMVZpNavHlNOOweWGvkzFqMhzCXAJzWenAWKWKEHTgmJclYcadNDMmlLtrfdoQg",
		@"CGoIJpyWykYHZgyeEP": @"MymKOhRQFqKAuZwjPZbJYcPQvqCdoUOigBZpQzIRPybMSatJeWHgopGHYAdZRgSTmdbXzmdrvSUFQIbOfgavWmkQpmPWvmNZiQSVjcPsOFbIDIxJ",
	};
	return rzSmdqrkysn;
}

+ (nonnull UIImage *)qrzBXnOKvPILaqS :(nonnull UIImage *)lElkgvMLGCKrxYsj {
	NSData *nVtNLIDiJan = [@"JoqFiFaNhoFNFymptgvMRrehRtcRWAglSkorRFeHHeBTZYFSHDdgjtHRVysOqhtnpIoSVOGHEUvJEZzaVrPMopZvdCEeVMVMGGMWfsxLppJJdQHGuFyYqerkzJEmHDvbtWVaSZJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OfrcFhTHouL = [UIImage imageWithData:nVtNLIDiJan];
	OfrcFhTHouL = [UIImage imageNamed:@"YNKrZmJwjPmVIGNvuJLRLWyrGVLBODVWKtJWuvieUtHVvqtkiGnYMkxDnZrKYgzNTbdkKeJCNmXqCXtFojcyzsHMbAzMJjBcBunPeiBVIJOGggQmNvIUQHaqesgDfmutbQfhvxlKURPSJnjBVPPuD"];
	return OfrcFhTHouL;
}

- (nonnull NSData *)tJKGynKjZopuvb :(nonnull UIImage *)NIpMSKndLNfocdQPXJ :(nonnull NSArray *)DfwObVbMnH :(nonnull NSString *)usAOmQGzfycDwPOl {
	NSData *gTEGNKyXtUHNas = [@"ksfrucFduteBRwCIbXCoSMXhnPtOkhUbTzJxcSaQOzznTOZvBIBNuqSARtLCCLhyMGBZQkkBSUKHeOZsLyJYuxxVwoPxrONqiJfjXDvVuDIniEnYFbMNWYGPOxpHbaplMaBoyx" dataUsingEncoding:NSUTF8StringEncoding];
	return gTEGNKyXtUHNas;
}

- (nonnull NSDictionary *)NpPVOzPpVANyanySd :(nonnull NSArray *)UAlSVDUSyeWQuvEmdj :(nonnull NSString *)qONECYCwkgkfF {
	NSDictionary *MTncReUYgXi = @{
		@"RlHQxyuYlPE": @"DpgVOupXYTGvSbuLFxeaFOzpDiqbYQZOCmZFyfUuOUMyXnxintqEumznpSczZWszkrJMGQbioVWkESQqaIqDcNkixXaIPFJMlCeQhcmubxaHOsiJVxsoIDMvRpTyZQlFLgQLMFLVDoGvNYZlg",
		@"rhlgCRsIQhWxEl": @"enxRjbkmnKPoYMtZrdPjHvYMpKqSGZXkSqvXlHhasnuYdyBEmyXcJBphjhhnbGwwAhfubUNZzWCLRMNpjMUcnZFRvTtZojAEMkoFqPHq",
		@"BgVgPRoKitgDQBnVSC": @"jYWFKOQzSSgmthwuWKofvKmPoddnXYrgQuuVWAeJUJmcBYYhxthNophdmnHpzMyBsakPFUHdxGakOCkghpkUPZattcklTMWVXkLtTFDvygSWauZnAtDLPJtMamNGPV",
		@"SSMZAiYPKR": @"vrMErtsNqbGPJzRBfMGnpmZnoeOcuwSDNxqynorRFXNNvKbAVQQdorGGyOWaJbfLVrIoKQHQCEaxhkyFkOxrSNonWbGdDAAfGxRyfVa",
		@"mzTexXBfaMSew": @"FhkeNPGOscGhZPODQfMMHfvHFyZrtpIwzmPezIeXaUntBnPccOORvuFMyKueZoFnKUHSpxfbfBFSZaXMYxkjKIwCrfILusfYneUb",
		@"boYChoaCviqqKXDEfD": @"xshdrmITcoGmtGiQsiMqdQIyOnkHlzdllXqhLFEmWbbwOoetjmOBuJXRqXyeFQVQCKTXxCFmOCBaUsNoqGHrIKNUJyusgbsXIAdRpRitA",
		@"MclebtvfqrT": @"qMGzgWoEpjuXDbBhMNHdsSgUonAwDFhbgbQGIwFHrVeSZirpUJbWWhyzHyjVLxGeNAUnlKooSEJcFYgROWzBUhSmDfnFJmyoftfmVlnpuPXHUv",
		@"QXLLSXcEAoe": @"cOqQVbVCUzBWXVeNiASDXwXDHBCIDnJBNvXWPCtSgDDWWDfzJGZfTzrGxhisEdDktCMpyMbBSlDrdiTRLzWtkQhSxLwUSRQQeWExdRSSoTPadJNoXHQibIKcbievgMVijmgrb",
		@"vYzogXKyoN": @"uIdKctJxJzFTdPPmvcwrxVfTiKByHjgwYbqabtpsOTSUwfLtDnZmstnNiobVoxTzJIkOYgkKnHwuMEyLXgDgYuiyCogJOHggNHfkuDuUNUEwpvXJSbPcSgOZhbtYi",
		@"nzpsNGPORrU": @"ozEvjeTAOmNMdbfJrmFtFnsNUTyyJeZGPPGHqHpqywnHfbmAqpnKiItjwRDompMyQTYkzhjlmrzUcCxuxJathnQYMkxGgMwTVQOpFGjInXOznzpNFbDQytWQljzQ",
		@"TYGcgAjARdVbKpxtOr": @"uMWkjpbcYOKMELHLXufGhTpkNktvCKfAZcyFTkhGwghruAyeQBrYlpXQPbQbNfcywKeBwfjdSTUnEZvdNLegYsBKEvemuilvAatKFoL",
		@"tGEKJdlbvksl": @"azZbfRQizNRfhSnIGCWKqDRkXsPfWrPVJpULMmdaKhnoEasIOpKryVOnOHiBJlLToDhXgbzkMlMYCuxLtCTGULrgRsRECewJXIrgTXqtNRjiMnBwcWTVBynusmvpDrHRBE",
		@"QqqsBJdQLKZEQtreS": @"ZomaGNSlOqgrKdYcdhiyhAhrURtMTyDUMzyUpVgUuhhrHfpPOWSyBAHDCwFpHRnCPVOQXNXGoBLEDzInyKJSRRiVEVPUqXLXgcsmfOlFSiQDZGDPhFjBYnXxVFWSzyLD",
		@"AEOwOuKyjPFkLh": @"tZNXxqhbKhJcQhKmjCXvKYzjTiputDGnMclyVFZoGcYjqqHvbFMQnjSkHtgJdIQAcnGSIMIQIJBoGhbYVeUYOYlZNMMrvKSGyzbo",
		@"CVhwzLKJRTVBIb": @"xnBmyVXaPsSCckPorHBdPIxGvVuPlXmEkSATDdKTbTRYXchQpjrseisQEIJmzvUOTKLllEJcmNwDmuFrFzlVKiHtxsFBflHmiPYFeZLv",
		@"skjdVTrpbxxraobHXFy": @"ydRxvWjhjDNsscljLCOYLvCfghYvKStmgACURvihDEeIiiPLCJHUWBSusbocIDGacNfNDMNoJlrcmKwLtyQxfkDgxGygHnAyprdmGVMpdjdcWPLz",
	};
	return MTncReUYgXi;
}

+ (nonnull NSData *)ildnSZCbanedx :(nonnull NSDictionary *)SeURdSCZBLmBJbzejz :(nonnull NSDictionary *)zoOlCRvjUNjrfOPaK :(nonnull NSData *)bvBJwltdIGOX {
	NSData *wbEJOSKrCXnj = [@"LRqclKOlNCmVWMbPhbBlzzFwEHbVNElcFMiSjufkPWUlnATJEgNomQAFAirHTpxedAAVIUuyXBJacAQuRxOWFWiEopQcWRPgUGbZMaNjZajbuxycOXDTxhEYfaZLmqJQyZNEfASCnRLGxdoYdFEjY" dataUsingEncoding:NSUTF8StringEncoding];
	return wbEJOSKrCXnj;
}

- (nonnull NSDictionary *)aOvZFZDmYOVlcKZ :(nonnull NSString *)rJEQySpjEhH :(nonnull NSArray *)RktMdQpNjNwhbayCVN :(nonnull NSData *)kEdicdQJRMfZ {
	NSDictionary *UgmhrGRAvvfEoNQ = @{
		@"kGyBhJQNDZrKrmL": @"FWsjiNwpTZaDAtIlnArauTltmYVILWtjfIxzVGBQSRhOaLuIqmmgpXkoXiopjyjNMtVItmVntSkouVJpWWjilxFOddGSSFljkrPFMPktWerV",
		@"amtJliiQpsmuNL": @"HgDPhuKQShjydEiZscdpZRcsyIhaIhJuppzpnwOdoxlpdkGDdiBePWgiMThXUQWVlFpusdmgzhBQCrvakUoHyIHOLoFGtGFAmOvbLEsdBxB",
		@"MiIumcpmZrxNCfkePqn": @"xFuhdMqmTkoEsyjLOcBhUKOZhvXIGcMlDaxOAvLymRqhviOToBcEnSzFnuzKpKCxGTMdkpcdWZATzaUCruehJijobMBGQvpPyzfByCmNTezINSvxEWWVnGFOe",
		@"cocZKyzVrx": @"wDLUycOLEbFosFHiuWmMMIcMuUjMEYeEmrhKelMWLNgEOTowXvLbhaSJEUhowhAmIyjbpkdpRtrowWGclatQbyVQirwfqBwnUbjNDQoyxAMtwosNsrrynHQikpiakYnnUEjolkplGTUARVe",
		@"bCXzvvnWIQ": @"ZxjgiGvccsGBJlBGVFQGlpmvIOXqwsjJCnHLOmoGhTHsRjXZPRAHSRTISaasBSxznevGXBlcajMlnZAaCyiMZYGDsPYfxTUBfZahaUtwrTZDJWCauchrgXsabyyOvWOYJbRUgbgdJCqBpQ",
		@"XUUJNrzxqixlQHFTwH": @"qMJChsReruBHTcUwdfrvQtOXbqLaZdFuMfvbEgXbiSBoftiKyrqvaRvZVfaJqLmUtCMaVHzRzOEkktQbIMARnJtnOljBFYQQiBiZBBtvObEJUGjDZjuJyMTPsLmVSiNjXTwypTNEEmhTOXqgFOz",
		@"sQdroGTliLZpqSbAyH": @"efrCchTbVsUXtykEMwRoAwbkgtNzjHdlBHBvNoxHYnKfzXzoOcbQixtaDEYmXmJAXHiPyCqeGojGeuzDJtHAARiluUXinYXGAYqjRLdffqyMQSizVdPIsSFlocXIUPTcMrgEquUu",
		@"sAbWDCGfcQOH": @"RrKBscxnLIDBIBHyjjdDHtwmSrYXnFpHNYSONItWimPKswzkyMdWfJXAJcHuDwwnLFBSGrbEKgWaojZruGIKkBlhIjJkDOVKRovRTgfSzVGLrESgRDGsnILDQmO",
		@"MXoTXFTGtX": @"loFRuUxaUwvzmNeKdFHnlbpLIWUgRaflWNwpSSHTSGzIulcmEUMIwQVqjqJxSZvHzxmMdPXhPihFdMQGXzAFAgqnuDduLGhaNHbPJCHRUCCjKdummpYeygoojW",
		@"TNHTJeBEXDz": @"cKAGidwVSLUuMxxkmjmyZwdVOQOOeFSfxPVRzfjQTGLrLMsRLikjhWlRumtrGWUucmkIbzAQbJZqQoRPqGZuSWIJNJnVBivmPJcpQDOYhoCjPAtombzF",
		@"wDLaYkLcsGPdv": @"sYJdYkfHsHbmslCReSIQSJTQOMaZRuUBKLPZlWKoZZuDOkeSKiAhGlMQLnLpxdnVKhGxjfAHzIbLANUYgojXqwaKrlGVeingWQaXfcoWHAIvSfWqJdcNkRRk",
		@"jTmCpCVcFYgmDHJPj": @"ODeOYJYNutlTNhniRgMEPMyJJejuAOSNNUbfMdVsMSGTWNZiQqcNUflabeTHLHNuJabEDHhJgpvBIhNBAogReFrAcVvOIhXcfCYKYFdDgXDbHHLmUJZHMiCVSAsKLtJHXHoTNszoukwAlrBVSr",
		@"KIPQiaAbswZnYa": @"nAZzVBsJRIXXDRPOdPEULNAMVKUBCJUmHlPFGPMASxyJzKYdgOpgSivHIqaCjTzxAwQVLqZRqjXgsNuSpmXnhPjxHHTkmDQTFFwvnZIccHmiinZs",
		@"xDdaOhiyChUzFURIIA": @"btnWIZusOQjeCtMcNafurvGKazxPhdgAxKntTZhEkyIQdMvZEaipufljuAbGAcMQvxNbXgCwemAJvJYSPBQkKdESCPRKdzBspMkJnxEsxaLjEtuXEPSiyzwxnJibtfIMtMrdCKMnTZvr",
	};
	return UgmhrGRAvvfEoNQ;
}

- (nonnull UIImage *)byYLvZyQHvgsnNwg :(nonnull UIImage *)hIDqjJuchXpYHkhQ :(nonnull UIImage *)MKEwSCnRCdq :(nonnull NSArray *)HFFHJgkJrHa {
	NSData *gkqdfKRHXsAtLUWtjOy = [@"QMkLtpeIVSQvwlddWCQgZjRJjOmmcgMylFUHRxwIAfivXkAxqEBoDksVEmImeiRnVAHGgEAHPXmffoaZUCJzhHQEyXxyAMznYXLrdWddU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *qtsMwxlUjSE = [UIImage imageWithData:gkqdfKRHXsAtLUWtjOy];
	qtsMwxlUjSE = [UIImage imageNamed:@"QWKHPuSvsxQGmwjRYulIMDfcUUQIVGnTHrfPqEnyvIUJTZtrGyJuqeLyUzYbFQjcLyrUqJZAmxNbdwMorxQrDTPWrdJeRZarOXHvzEIpsAegCxWuIgJTzB"];
	return qtsMwxlUjSE;
}

+ (nonnull UIImage *)MJlxsXxOSJ :(nonnull UIImage *)pGyriGhUWmmsTV :(nonnull UIImage *)IZoBTPkLumVRQ {
	NSData *OPJfAsmhemh = [@"BMbFfYzQVClwkJrlSETcdYeBfHgwCETyYQXtHYkmOtyqNvAbGdLhOyIynGqczGXUsRDwyVGqpZiHGlFfprCZsOnBNbVOWHwNUaNmMicKzfxmnpaoBSuVfyspGqlgSFxSNeOEJWWKgN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QPjkWxamRHMx = [UIImage imageWithData:OPJfAsmhemh];
	QPjkWxamRHMx = [UIImage imageNamed:@"TSaXpLPgfEllhNAsvQWEvGvlBsfpHEietKtSnSriFhcgpVJEBBqEttJFhAJrDMVkFTKFsqLYGPJZoGqqrEuYsiwIOdLiYQhGNXOYHhOROelZwQBW"];
	return QPjkWxamRHMx;
}

- (nonnull NSArray *)eccYqZCTKsygRRKWak :(nonnull NSString *)DhpJqZTffrM :(nonnull NSArray *)EbKIFManTb {
	NSArray *AKCDHsroLil = @[
		@"qaBcyHSqXejVALxswwOVyBTujYrdCBQpxPFetLByoCaxfKBfVNpqFqBIqPoWFjehiQugXEqKOAAjEqUuBOYHGEXemnOVQuBQJoOdYhCStSt",
		@"PfkmZLdlWVtjHHGpGUgkHfeKkWjQtBvZkzQXQtsRIYqthkVpRwExhpiOnvJNHcDAKeHsRssKHwrBuunJkLyCpQmNeyGIeuFIsLyOKkMUiAhgsksFAoKAFzREOcQjyvIIw",
		@"YKnJqDTVhLQDNqCuOuYiZDRwdvxFwaHNNPRbFXRnPtpWsPfWrywGspuUULryCHsjFPriLMeTvXozoNXqJmpXjWcVxIcPDHmnwlNGKwgcpiuI",
		@"IJutIpVSklJwLHSfatKwVukNSScChgVvWlpyaQYXToVWLhvGbUxvwGeoHHONTbNXiFMKLXRJDxlibSFUxtpuUOreKVadYfLwEEtJITYlXZOW",
		@"rjpXVEwzeEjqPOQujuHIctYuPSYvcHxfGNizIGcPSUeshpCGLRWsBrzdzlUqPicLmaQWPwEzcHaZZJQOPMrSnDweSlzCbqCaebAsBUfjXmjcbEOJBpWcEi",
		@"TLWhNGvMsKwsnpHZLmGlyKPEBGDwgCfzDsdvmMjlcWoWLzVxkShLXQnQoNSuVaFVcYQygYPSOOLJRaXdDAUhnPKPZOZbYIHgHmryePHcnvnOaDDODdHmWG",
		@"iyLEYltFdRWWLLrPswIqfEHNrTfWXOTVvwQXWeqkSMhdfljEEKCMNNTewyzZnAhdCVgdWnmxxePHwSKYFdkDoKyGrEHGuTYtqTjKaaSEGXLPfOnmRqTT",
		@"LgoSSpwZQkpsAKtEWSSzbJUlOznYWyivqCmmoLLNhJNblXeSFmXbfAKetflUBVNyFUobBbdFZbBXVCbQEIlZIJcxIUczrkySZsyuqGoXXwRUJojw",
		@"nqYOPIsbDZQxmkDkrDhaRoxkiJQQBNVuUspWgHmpYhaOiUwKrLWajCfzsLYjYJKLQSKyFpNssgOWvXuounBIQRltHDWZqKYEEJUdxsZhlhzhfXcEseHUIbVMBegshvpTcXGBo",
		@"vdKVXvQocvPRrsfXHYrkXcJYUEPpCKVGaEcyGdCoNmtxYaGEeePhioCMTNYQWcaDEtWQoPjvMAcLmTHkIIjVwbcrvyMLJrCgNosMOicJYIAhTqgKFMCscnMriuCpVdjqgkRxzeGxMEsjCcGAnxysA",
		@"kzNhrypKZUJBmVAZmKtYfbLRXlpyuyWaFPhduBRzCzrBbDeQsPdeZFouufYfsHhZFSZurNiqhPwIdhQErlosVImOgytvHiMCesJedRzqzTvTVqskzVTUwxnC",
		@"iresEYNVZHPEmAJvZkUFsxmknUqcKzTMhBksXegWDSgxOtyiUjThOAjPYPZDDNtyaqvCLkydtNjIQGJruzKIZWFaLDRvJWqLhNlcsIeQQgOmafLpPkFkQxxxyCokoXrT",
		@"WNRNYxagVxMHOpQCTrrAlIRriiaosRmhRTRwnUuUJSpAbguJlGigfIvyYnCxAQWORJwjLvGVwfQCjhSKowUVQYbcFlxGtQFBoEuFcNgPigUxlrxIrVzSNDvPwDhkYTkXJhqIoGuDTF",
		@"luonJISIHRmKhJmSmiLUMYJvuWrlBrRsHCUSKnKRIDjtVLamHuuwMqTGhXiYaeItZcYeHaGibTooUUsssmqlEslVKMWDrteqlXffqffIfxdIsKDAGDOwcxakbkToyTKykGuxY",
		@"ApzzZwOSeoGDpjcRFJOtxWKAdSFpxkrZLHFHgBSIUrZeCjkmvjspmESynlnrsmxBWVkzISXPOUbQzPPXNqKizdcZwWAxLnUjMpHBzqFXnRUFugMnOqLwCQhZzcQxsFcFujZkDpUfh",
		@"oxGnhrkWSpVgiFateRRRzEnnoFJAqJZhoFbxIMfVqlWYpsEgNkJSLpKYBJpliJrFJBOdtshEosxpOhXwFIASXQCsOqZjNfiIlrxXVuzaPWLUkeAiyYgbpMStzvcnodRyDGsx",
	];
	return AKCDHsroLil;
}

- (nonnull UIImage *)UZIGkfIEUkXmwCp :(nonnull NSData *)zUjONcxkVXFU :(nonnull NSData *)OVPSswENPntoexL :(nonnull NSData *)qFfMCIuuMYM {
	NSData *VzcIuKLxtfJ = [@"MXKGIUtwwCKterpZwMXZXtGqeKbaHDoDisRbimwpQeRZtTlkxBLIBeLGlqltknqNrCyNTszuMzLEMQwumZbsmvYIqEkJgQQDBlEXQmAgcnUsGVRuexl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SbARkIYHVJcR = [UIImage imageWithData:VzcIuKLxtfJ];
	SbARkIYHVJcR = [UIImage imageNamed:@"ObXtMHMZyuefFOXIxcAbKHadpwbphZIvpxPbYhvCvQcBDlQGsmDSkQcjGnKJeCrOSUtiPNWPNmdULfCwxRLdeRWFuexZgMPPkwsUllTiCMvZs"];
	return SbARkIYHVJcR;
}

- (nonnull NSData *)DjqloqkaTT :(nonnull NSData *)NRhljIvCaJE :(nonnull NSArray *)llBZAEQzGaUko {
	NSData *aOBOcjMjbUhLwwJji = [@"WtdRJdZTLWrizfNZHgujEXRWvxYrZHLeYhlPIhOhtkHzowZCMYtAhvEpfoHPpcIsrdkEOLCUfFQxuRAvbNrlBWdcgxRLBnaPpNaUmwlvEKBdfKhEeQpeTFWywdWudichwWbqHBijzTzIwXlISw" dataUsingEncoding:NSUTF8StringEncoding];
	return aOBOcjMjbUhLwwJji;
}

- (nonnull NSDictionary *)yJgcHYGpqvsGuHrBqJ :(nonnull NSArray *)wrCykyKVkBXnb {
	NSDictionary *ZcgxkDmEEnivH = @{
		@"YNAFIXxzSU": @"uWEJLPotuzgkHrqyfZyQoGowsyMDDHhRiNpdDbSCfZiKgyZJPmmLBtEOJPIUEoeYXEdxyDmLwAdIFPbbnYXMNBJcckMnpjKQUBzld",
		@"xtOzBhymbGHHZOIQ": @"SjIKqOTVYTYewqMWHExIkEKjajYspSeXtZXCiOYUPkKpaGOTeCcNCqKALdLmMOZOyLcjASWEVqoXuTuAoRrGxwVqpDlctrqDqDTlXBwzMXLkfA",
		@"KpimGpUihLzyCLsZA": @"NCtpQzCSOKvFuymFJqqXfUjWFZNYYonJwlKRRLRdqsrUBqIshcTihCAjJqhXlGKrhuMiyEavEkGqiLbBrEVtFBXalTsWVjZlbjXhMPYjI",
		@"cRullQMXdshsZIZpiQu": @"WVOIrNwthhoUOtTpLheVgFfALmMUYKyVTgTgTmBCjPnmDvhXYUFJbeIXOeWJWSDzkwrajMqGqlBQjUsNcTloUhrzcwDMPVPOfoxAjKaaATsysCXKxeCXpCGM",
		@"jTbcyrvzuzJnt": @"nMFEOErAaIYnJgFpIlyeKRFJfuatFcuxHZuQGAsHlXbSLenVivLQwSUkLZnYfVetUNXSLRrVYaqcnMFVfIYYXJQitvaBblayLuKBReqsq",
		@"pggpOfnaOmrDAh": @"RVdicjpUbeHuzmlsPswSsSkeySXbdPEVGHiWAVIxbhxIrIOpvaXsEaahCrkLcVkjLIdZttyOuWrZHYNKFmIDgBmCEplbmbhYLxfxnQwTUlaBexdGTbonxyWPFcjjQMlH",
		@"mvZeFNqdcUWZb": @"SISqyfGFPhOKxplGFLLoyPVxwGRlrGCeDriXwLkcxEBjKYmVhyCrlLQIssnlDijzPtatBtYVoFKkUalScpFfTSuMVKifkufJoJYoRceNvGkgiwbevrIIPcgxVjxWRVkQttvokuPzZuGqifIgRAC",
		@"KQLbzsZSCtMC": @"PbqgrIIktQaUSpDYFMtKLSYJIcEzFukJmURQZwMsqprCqWMQlemTOmmwZqEbWNcXRfqVsmJTsUMOiAUvfTHKtFxjUKuwNmqCkyOdpiDToNfOupaUXCsiOLLnpHiPibbLenTQudowmtWtSbw",
		@"QDQRqrxZjfSADm": @"QsCgTNflifapehTKfKRpGVlvdQXNQCtJGPhgTiEVFwueyCpsKbWIdKhaNwkSlUwYmCqPZPytwaTjFpzJvARDbiLuvHVKhxpoGhOMmbKyvRjgUFqeArSLpatVmQUyqlpHcueBnrH",
		@"FehYXlxEJismfxWCL": @"oAaqmIMLGwSaPeJhCMDTdoglWIlDODqtYOpgQvkMfFJUrYfkAIdevLemdSxLcaJeJYMmmNjznfkovCAGuHRyCZxsobkDWVHGNRDhQlvGRITZNOxUdwuuXOZuyeMWgfXdajuperS",
		@"dtewJMfZyMC": @"wPXMgYhwdZCnVnFxNlBHcsZsAgSygwEnvcpeZdxfIREMKMDjAaVcfGXkiQwsiPkDPrDxlpVGnfOBEFhhXNTukwakvlMyHyGjlkeZFtNWRQBCR",
		@"HLdNNNmPdJhvluW": @"ovhdSfCMRUUinLzAZNqqIaCRSonMdxjsAeVcPuLQUuOiSHsXdsFpKNINgTmYNuljaVQyUUYqFGxPJmKcxgxZsmZenvDlSKJtrvWjjqjDmtYDMXRqJRqJDJrjQThYLYn",
		@"ubGzqCNfjWQfexbMb": @"SPoMBfbPJgsMUeoFEKzwVYAViRjslqnRGorQRBPJCCnotoNmfDcrxGkTAkRyLrGZUbokxxbqECjoonWZYyBjksanrNLZEHVcGEGAIFZUgSuOL",
		@"dsjslwUUTAWaOhzc": @"VtBWIXTErdSsqTsBmGSKRYmfjPIvtXBNpFazHHPriWdunAlrPmMXcgtarrLNUfLQrIvaRkUMlmRgOnLUyEgKoSpMtDLLCOBtMgsDEHuOnhJRMmnAQIhQrzPF",
		@"QBikJVeqJLXjDO": @"zGkcwZQjfSbuAArDicHoxELdqauTbCMWgRitvTJzvLsiFCNazUakVOpHtNaimJnUZeAVpGoOvRVqhMvisbqILHoGMrcUUnznZBpeJVyjkBDutcgFXuFUArzCigavSXRaKPMyfbxltVVXLK",
		@"kRqSmmmenHDRfhiEL": @"jsFGPTRvkcOkPsHDWNhafLpBQigmEPRIEiEygQKMOhGAgXlHoHBqIkcWDOgncNYhbZlsyHbzuohNwCCiFrcVvMGZmxKHepvaJAanviYcvnFZhhWXPzsECbhFyhzonWKcgazvMkOSqc",
		@"IULfNDsQKdgFiVwtN": @"ZxXsOHyvBJYVcYeQUWKQTeRSNGluPJLXhzuQBiZBerczrdPVrbIPhBKGnmRwQqzaHXRpZCDryiuyEKPGbWtOANnsoQegjgdyjIqtMUFeERdg",
	};
	return ZcgxkDmEEnivH;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *viewl=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 20)];
    
    viewl.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    
    
    UIView *lbl = [[UIView alloc] init]; //定义一个label用于显示cell之间的分割线（未使用系统自带的分割线），也可以用view来画分割线
    lbl.frame = CGRectMake(viewl.frame.origin.x, 10, viewl.frame.size.width, 1);
    lbl.backgroundColor = kColorGray225;
    [viewl addSubview:lbl];
    
    UIView *lbl1 = [[UIView alloc] init]; //定义一个label用于显示cell之间的分割线（未使用系统自带的分割线），也可以用view来画分割线
    lbl1.frame = CGRectMake(0, -1, viewl.frame.size.width, 1);
    lbl1.backgroundColor = kColorGray225;
    [viewl addSubview:lbl1];
    return viewl;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0 || section==1) {
        return 0;
    }
    return 10;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 1;
    }else if (section==1){
        
        return 1;
    }else if (section==2){
        return 2;
    }else{
        return 7;
    }
}

#pragma mark datasouse
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        MainPersonCellNoAddCell *cell=[[MainPersonCellNoAddCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainPersonCell"];
        cell.model=self.friendM;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled=YES;
        cell.delegate = self;
        return cell;
        
        
    }else if (indexPath.section == 1){
        
        if ([self.friendM.zttid isEqualToString:[UserInfoTool getUserInfo].zttid]) {
            UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ccell"];
            return cell;
        }else{

            if ([self.friendM.ftype isEqualToString:@"0"]) {
                InfoFriendSectionTableViewCellAdd *cell=[[InfoFriendSectionTableViewCellAdd alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
                cell.delegate=self;
                return cell;
            }else if ([self.friendM.ftype isEqualToString:@"2"]){
                FriendCheckViewController *cell=[[FriendCheckViewController alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 0)];
                cell.delegate = self;
                return cell;
            }else{
                FriendCheckViewController *cell=[[FriendCheckViewController alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 0)];
                return cell;
            }
        }
    }else if (indexPath.section==2){
     
            InfoFriendTableViewCell *cell=[[InfoFriendTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"InfoFriendImageTableViewCell"];
            infoFriendsModel *model=[infoFriendsModel new];
            model.name=@"昵称";
            
            if (self.friendM.nickname==nil) {
                self.friendM.nickname=@"";
            }
        
        
           if (self.friendM.sex == nil) {
               self.friendM.sex=@"";
             }
            model.detailName = self.friendM.nickname;
            model.imageIshidden = YES;
            infoFriendsModel *model1=[infoFriendsModel new];
            model1.name = @"性别";
            model1.detailName=[self sexKnowWithString:self.friendM.sex];
            model1.imageIshidden = YES;
            
           
            NSArray *arr=@[model,model1];
            cell.model=arr[indexPath.row];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.userInteractionEnabled=NO;
        UIView *lbl = [[UIView alloc] init]; //定义一个label用于显示cell之间的分割线（未使用系统自带的分割线），也可以用view来画分割线
        lbl.frame = CGRectMake(cell.frame.origin.x + 10, cell.frame.size.height - 5, cell.frame.size.width +200, 1);
        lbl.backgroundColor = kColorGray240;
        [cell.contentView addSubview:lbl];
            return cell;
        
    }else{
        
        InfoFriendTableViewCell *cell=[[InfoFriendTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"InfoFriendImageTableViewCell"];
        cell.model=self.dicArr[indexPath.row];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled=NO;
        
        UIView *lbl = [[UIView alloc] init]; //定义一个label用于显示cell之间的分割线（未使用系统自带的分割线），也可以用view来画分割线
        lbl.frame = CGRectMake(cell.frame.origin.x + 10, cell.frame.size.height - 5, cell.frame.size.width+200, 1);
        lbl.backgroundColor = kColorGray240;
        [cell.contentView addSubview:lbl];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        return 130;
    }else if (indexPath.section==1){
        //
        if ([self.friendM.zttid isEqualToString:[UserInfoTool getUserInfo].zttid]) {

            return 0;
        }else{
            
            if ([self.friendM.ftype isEqualToString:@"0"]) {
                
                return 0;
            }else if ([self.friendM.ftype isEqualToString:@"2"]){
                return 0;
            }else{
                return 0;
            }
        }
    }else{
        return 40;
    }
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}

-(NSString *)sexKnowWithString:(NSString *)str{

    if ([str isEqualToString:@"2"]) {
        return @"女";
    }else if([str isEqualToString:@"1"]){
    
        return @"男";

    }else{
        return @"";
    }
}

#pragma mark 编辑按钮
-(void)onEditClickBtn:(UIButton *)sender{
    EditMessageController *editVc = [EditMessageController editMessageController];
    [self.navigationController pushViewController:editVc animated:YES];
}

#pragma mark 添加好友
- (void) addFirend
{

}

- (void)addViewWithAddWith:(UIButton *)btn
{

}

- (void)sendMsgAndDeleteFriendWith:(UIButton *)sender
{

}


@end
