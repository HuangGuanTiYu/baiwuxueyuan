
//
//  MyDownLoadsViewController.m
//  zhitongti
//
//  Created by yuhongtao on 16/8/11.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import "MyDownLoadsViewController.h"
#import "ManyLanguageMag.h"
#import "DWDownloadItemTool.h"
#import "MyDownLoadCell.h"
#import "DWDownloadItem.h"
#import "DownLoadCourseLiveController.h"
#import "DWDownloadItemTool.h"
#import "MainWebController.h"
#import "AFNetWW.h"
#import "VideoPreviewController.h"

@interface MyDownLoadsViewController ()<UITableViewDelegate, UITableViewDataSource, MyDownLoadCellDelegate>

@property(nonatomic, strong) NSArray *downLoaders;

@property (nonatomic, weak) UITableView *tableView;

//是否可以编辑
@property (nonatomic, assign) BOOL isEdit;

@property(nonatomic,strong) UIView *downloadView;

@property (nonatomic, strong) NSMutableArray *downCells;

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MyDownLoadsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = [ManyLanguageMag getMineMenuStrWith:@"我的下载"];
    
    [self setUpUI];

    [self getData];
    
}

- (void) setUpUI
{
    UIView *freeDiskView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.height - 30 - 64, self.view.width, 30)];
    freeDiskView.backgroundColor = ViewBackColor;
    
    UILabel *freeDisk = [[UILabel alloc] initWithFrame:CGRectMake(mainSpacing, mainSpacing, freeDiskView.width - 2 * mainSpacing, 20)];
    freeDisk.centerY = freeDiskView.height * 0.5;
    freeDisk.text = [self getFreeDiskspace];
    freeDisk.font = [UIFont systemFontOfSize:ys_28];
    freeDisk.textColor = AuxiliaryColor;
    [freeDiskView addSubview:freeDisk];
    
    [self.view addSubview:freeDiskView];
    
    UITableView *tablView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 30 - 64)];
    tablView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tablView;
    tablView.delegate = self;
    tablView.dataSource = self;
    [self.view addSubview:tablView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [btn addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
    self.btn = btn;
    
    [btn setTitle:[ManyLanguageMag getMineMenuStrWith:@"编辑"] forState:UIControlStateNormal];
    [btn setTitle:[ManyLanguageMag getMineMenuStrWith:@"完成"] forState:UIControlStateSelected];
    btn.selected = NO;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    [self SetDownloadView];
    
    self.navigationItem.rightBarButtonItem = backItem;
    
    //没有评论
    UIView *noCommentView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.noCommentView = noCommentView;
    noCommentView.hidden = YES;
    [self.view addSubview:noCommentView];
    
    //图片 + 文字
    UIView *imageTexgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, noCommentView.width, 129)];
    imageTexgView.centerY = self.view.height * 0.5 - 45 - 64;
    [noCommentView addSubview:imageTexgView];
    
    //背景图
    UIImageView *noImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 121, 90)];
    noImage.image = [UIImage imageNamed:@"kong"];
    noImage.centerX = noCommentView.width * 0.5;
    [imageTexgView addSubview:noImage];
    
    UILabel *toTestLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(noImage.frame) + 5, noCommentView.width, 20)];
    toTestLabel.textAlignment = NSTextAlignmentCenter;
    toTestLabel.text = @"还没有内容呀~";
    toTestLabel.textColor = AuxiliaryColor;
    toTestLabel.font = [UIFont systemFontOfSize:ys_28];
    [imageTexgView addSubview:toTestLabel];
}

- (void) getData
{
    self.downCells = [NSMutableArray array];
    
    self.downLoaders = (NSArray *)[DWDownloadItemTool getDWDownloadItem];

    if (self.downLoaders.count > 0) {
        if (self.tableView != nil) {
            [self.tableView reloadData];
        }
        self.tableView.hidden = NO;
        self.btn.hidden = NO;
        self.noCommentView.hidden = YES;
    }else
    {
        self.btn.hidden = YES;
        self.tableView.hidden = YES;
        self.noCommentView.hidden = NO;
    }
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.downLoaders.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    
    DWDownloadItem *item = self.downLoaders[indexPath.row];
    MyDownLoadCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MyDownLoadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.myDownLoadCellDelegate = self;
    cell.selectButton.selected = NO;
    [self.downCells addObject:cell];
    cell.item = item;
    cell.isEdit = self.isEdit;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.isEdit = NO;
    self.btn.selected = NO;
    
    if (self.downCells.count > 0) {
        for (MyDownLoadCell *cell in self.downCells) {
            cell.isEdit = self.isEdit;
        }
        
        self.downloadView.hidden = YES;

    }
    
    DWDownloadItem *item = self.downLoaders[indexPath.row];
    
    //pdf
    if (item.format != 0 && item.format != 2) {
        NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,LearnRecord,[UserInfoTool getUserInfo].token];
        
        NSDictionary *dic=@{
                            @"chapterid" : item.chapterid,
                            @"learntime" : @"180"
                            };
        
        [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
            int rescode = [responseDic[@"rescode"] intValue];
            if (rescode == 10000) {
                
            }
        } fail:^(NSError *error) {
            
        }];
        
        MainWebController *webViewVc = [[MainWebController alloc] init];
        webViewVc.url = item.pdfUrl;
        webViewVc.webTitle = item.title;
        [self.navigationController pushViewController:webViewVc animated:YES];
    }else if(item.format == 3){ //音频课件
        
        VideoPreviewController *vc = [[VideoPreviewController alloc] init];
        vc.fromDown = YES;
        vc.item = item;
        [self.navigationController pushViewController:vc animated:YES];
        
    }else
    {
        DownLoadCourseLiveController *liveVc = [[DownLoadCourseLiveController alloc] init];
        liveVc.format = item.format;
        liveVc.liveTitle = item.title;
        liveVc.videoLocalPath = item.videoPath;
        liveVc.chapterid = item.chapterid;
        [self presentViewController:liveVc animated:YES completion:nil];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

#pragma mark 存储内存
- (NSString *)getFreeDiskspace{
    float totalSpace;
    float totalFreeSpace=0.f;
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    if (dictionary) {
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalSpace = [fileSystemSizeInBytes floatValue]/1024.0f/1024.0f/1024.0f;
        totalFreeSpace = [freeFileSystemSizeInBytes floatValue]/1024.0f/1024.0f/1024.0f;
        NSString *str = [NSString stringWithFormat:@"%@%.2f GB，%@%.2f GB%@",[ManyLanguageMag getHotTypeStrWith:@"总共"],totalSpace-totalFreeSpace,[ManyLanguageMag getHotTypeStrWith:@"剩余"],totalFreeSpace,[ManyLanguageMag getHotTypeStrWith:@"可用"]];
        return str;
    } else {
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);
        return 0;
        
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

#pragma 编辑 
- (void) edit : (UIButton *) button
{
    button.selected = !button.selected;
    
    self.isEdit = button.selected;
    
    if (self.downCells.count > 0) {
        for (MyDownLoadCell *cell in self.downCells) {
            cell.isEdit = self.isEdit;
        }
    }
    self.downloadView.hidden = !button.selected;
}

-(void)SetDownloadView{
    self.downloadView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.height-104-11, self.view.width, 50)];
    self.downloadView.hidden = YES;
    self.downloadView.backgroundColor = ViewBackColor;
    [self.view addSubview: self.downloadView];
    
    UIButton *allSelBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.width/2, self.downloadView.height)];
    [allSelBtn setTitle:[ManyLanguageMag getMineMenuStrWith:@"全选" ] forState:UIControlStateNormal];
    [allSelBtn setTitle:@"取消全选" forState:UIControlStateSelected];
    allSelBtn.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    [allSelBtn setTitleColor:AuxiliaryColor forState:UIControlStateNormal];
    [allSelBtn addTarget:self action:@selector(allSelBtnC:) forControlEvents:UIControlEventTouchUpInside];
    [self.downloadView addSubview:allSelBtn];
    
    
    UIButton *deleBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.width/2, 0, self.view.width / 2, self.downloadView.height)];
    [deleBtn  setTitle:[ManyLanguageMag getMineMenuStrWith:@"删除"] forState:UIControlStateNormal];
    [deleBtn setTitleColor:MainColor forState:UIControlStateNormal];
    [deleBtn addTarget:self action:@selector(deleBtnC:) forControlEvents:UIControlEventTouchUpInside];
    deleBtn.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
    
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, mainSpacing)];
    sepaView.backgroundColor = AuxiliaryColor;
    sepaView.centerX = self.downloadView.width * 0.5;
    sepaView.centerY = self.downloadView.height * 0.5;
    [self.downloadView addSubview:sepaView];
    
    [self.downloadView addSubview:deleBtn];
}

#pragma mark 全选
- (void) allSelBtnC : (UIButton *) button
{
    button.selected = !button.selected;
    
    for (DWDownloadItem *item in self.downLoaders) {
        item.isSelected = button.selected;
    }
    
    [self.tableView reloadData];
    
}

#pragma mark 删除
- (nonnull NSDictionary *)yHtXyRLteKhvCE :(nonnull NSString *)LtyWHbMKTB :(nonnull NSString *)eXKGnpWiOmkbGLHpKzC {
	NSDictionary *JJVIAqUHbIpk = @{
		@"GshJtmKifBF": @"rRfpErQLCcBaZdGKAnKeTrLPRrdUxImvzpllhqflyvkYCoJQzChBhPJFfciimruYDSUiFqPKpQDVGWzCDbBPiaufqAgfXEfiJVnnpRPTQITxRebfgBP",
		@"DideGhaHTUGCCIp": @"FDENgQWBToIMmJZMoBEaQssCcDDlnWMzEjxjMySRZaulaUaEvDXshvORJafQxaTJLTAigQrdONoNGOxknEAmLwZutQiTQedFbprXqBgJzAVqyRwjVVvcpyFSTStJOsvn",
		@"pKRhssIbdBNKi": @"logqjNeZdRgWIhLuGktasJfXTutjyzWzFKWabjZVlsWlUATEPVEFOsCtKzvSyBgeIulKmTTVGqapZHzxCqXoDrJTsWOOuyJyFwCkogAJYileOsBYLXbVIKlQb",
		@"frVxtlWYNBAIPl": @"ZPyFXHOkuaqpSwXeWMvVBTZSdKGdjrCJGIKQiCGkBwjvdOQXQerCWMMSxCevzHkYetQutIzGPXukaSoqvdGVpjjFNjwhMfcculYpHz",
		@"MfOHSPugbbHcqq": @"znrDGjcsMrPqmqtNVaNHDBltQjRQyiwRqMUbDZCQPZEOeLkJVmimdwDWFvzlniLFtSMxbWJeldhRiZSLbjEvIauMwbiOQjYOQLGcdChJFo",
		@"FiysQZdekiaagD": @"jzabQflgpXlBSMCdMfCVUoYDGXHBHyIeDOPEtnHUTfqtTiRuCPJoXSBjgJGuscaQDHntjEZBPdEBwIQKKsWmIwuUZhVZBdgaiWgRIIktZzJTdICotSC",
		@"OTrqOKdflIEyCMafKh": @"VYmTSWnWNbGPwoOzZgUnqNeiBiDtltWSiFqMiwTLGKswkPbzieWaIlwKMRTPHqRsaLTzAuKUjHMxuXVCWTWxKJuNaWexlNkHSaplAlDZVOYfcuaQIVfcALlLkW",
		@"heAogkaTgWP": @"WRUupXinWICmyqqbPlMRYcgihTJSJkEcFGEUHCPixmDsZuoVwMABdQSIPxXPQsjlDFrfrnxYBryGbBfSWEjjueYhsiimZNcggyAbPiZfE",
		@"DegNAXMfDmCyOpxFDB": @"NyEpPNDgnyrXYgOBspdJFWWSfGgtHMfEydSsxskoRGPHTKttYttVvzaobWMLlqitdTfAdZohomiWobAjAUgMyQHvihRHimcjlqEZWgXgAAIomIbwolmmOnPNFXrQZBELDpSxuFFgIfqDTsvdf",
		@"EmimDwfCTTegqv": @"yUDIWnGxsvVmQjftWoMLyiYKfDKaPDjNmHcyVAIjKfueHTtBvKogkTWKUQfKdtCuSKmkrkkJdBOdzZCpTQKGFeBwWMGwBBKOKHDCYSGtksMScswaTCslMuKUBZhjAMXGQjFqYIXD",
	};
	return JJVIAqUHbIpk;
}

- (nonnull NSString *)rjxSPrHneVyfGO :(nonnull UIImage *)UkolLBfDYH :(nonnull NSData *)ePHWdzjbVVniTzhf {
	NSString *WQMeQXATXS = @"coGkLwpRfChsuqeMLIeSHRYSlkgnWzATyhyzyrBgZmSorikfSsGnUCGdGjKAIgMsuPqnTBBCltxYsHXSURALiJNtzfbozxSzyLsxGIoPReznUBZNBEHRrkYdGmscvqzVrwyBPrpS";
	return WQMeQXATXS;
}

- (nonnull NSData *)jxtQjmngGxIVT :(nonnull NSString *)ZABqKTXiFXQx :(nonnull NSArray *)CxFVTvbfJof :(nonnull NSString *)dkVDiKzvwBOfjV {
	NSData *ZVRqirByOg = [@"wLvaCzbZARgFkSiLJbyusqtMchvCWMlcpIASImQMjDePXwZQWAepZbGLJtCcSNTfJefBJfKgOOhvXdHErSlNAOkpSzLvYGEgwEiQgg" dataUsingEncoding:NSUTF8StringEncoding];
	return ZVRqirByOg;
}

+ (nonnull NSArray *)bHFcGsNLJzP :(nonnull UIImage *)SWdRuxFYwpTMxHNPeET {
	NSArray *xtEEwZdLBMBdpC = @[
		@"obWUAWVrDeyxgWXNcLsecODeEuWVYHcCRAxwmPmukWBQtnTeOzCTMWdktmPvLzIBrEDULwTHrBkRqHNhLgIxxLLpoWYyWQbUwhnKOIyllbvoumlsPgWbw",
		@"HhZQsLrvnoIpKAIsVraareVFjuSWoQPPCAbdPNpNyWkJRjQTsSasPuOdRPKtyQnCMFpFRULYEpRbboGSjaCGxjthBvtTnvwLnnRMtJSXmKrwrKHQKvlukUqaUinolGJJcDDFyPEGUfJmbPHG",
		@"HyTaPOsvJxdGbxwaQimqQeCDIlbDmjLcyQOjyuWqbxffBOyTYZvLeVacPyeTNiBbapcbEWfXSPpJyXekVHtLkMeGQlFQjXJyqlQokPHyDGchYwUZSyMHNxtadvdNqADYxDGfMkNRiwtaYDnwCJZv",
		@"fwTGUXIlSFgJUHQjeyfBkAoumNFrWcwjzRMGPjmBsvdvZrYHzzpMuoutDVsZUTmqekELzdwJLgHgYUOvFPRAxLVPomROfXGrqxSPkIVoNBseHDDMWqyDFBQmWTlP",
		@"VHCAocUuviPvWgBZoAPszwOATwuqyKtNQNpNVIIluHKFTbiQJCDWKEQXVjnAXyDtjGudPflRCCRbLJAcgKGvQobWlahRTHigoGDS",
		@"oFTceDSQqCZrzYPRnxmokMSOlVUPbofPNhMCYWWMYBjThxIiUfvkIZMUxhVjdtVZCQWrjDkIYCslDaXektSJtFjqMoCKmdPMWvuZXrTfOptpoWPNTVcNoDjVbfmICvn",
		@"SzCQwwVaeARmYlaDMLIBOiqOHhqNHHsgpHyLLGcFJSPEPUCFYrwixyqMLrXkXPRPMZbaGvkjhGBTBYbGLFXKhYGjupIvftecsymaiuRAZNXEzCFMCYzTzMvIHpD",
		@"dDTEHuqmOJBNUGlKfDhlxhaNbrhGUybjWMrScWSPgtPmVbkNmiPthIQQGkEgCRFDBNeDYxiCiponxzZunyJhaTHGsEWpbCmnkdYgHDbogtjFwm",
		@"ifSECvTrjKbeunvmwQzRvRwetiVBfavhHyHzRmcUKEROQykPoGzTUzGjQmNanKEnQxthLJNIqXkfUeNDCjduwhGRdQHyKAzvMWTmYthKibhKFqcWrgKqymJQHxWzWltIDtTPnJXtoNVWzXwSqoL",
		@"svncyMIaMPjJxVyLRPHEgXFaqldvJFLSHULGScmIoMfNyGHbIRqjDNovpxblOehfYQOSlLdFSLDHoytNTcoAESUUByrEUBUUYfbvLhcUS",
	];
	return xtEEwZdLBMBdpC;
}

- (nonnull NSDictionary *)bDAfDebBAtptDDmEFP :(nonnull NSDictionary *)mHDXqVJzAOfp {
	NSDictionary *xmUfYbHpfvEGMWBL = @{
		@"iUbYhRwNYeq": @"palWsxpXWNAZyPhifNpyClShIjEjTTMpFwjvRTpoILvnnSbhqAMciKGwVRtPXDWIfGrxvEqcKSSKysbDdRaUIzyQKEdIrirxEgsfMHMZOGyBJOAtdEloeuC",
		@"GNawUeEqDXdF": @"ULGyrGyEVFBDNiwFKHSLFlVZJEVbbeMTbqmAlcTcEiHWTQglENfGZxZOLRermmdVGnxDAEfwoMDKayifKNaXyCXscdQQmsNrGdjydIhrxbBkOezeAfWmczJyVu",
		@"LsAvUvHsglVi": @"oiITxiwVvidSAcLneoQIyXfcBNkfsAAmXbxkMvlBCUsnAhUFfHlByocflGOlkdRbzkuCrQdLeIXuVOXWmnKlecHQgHOTKfWRAtLRQgssQJfeUhURXPYiassKSRlCTDrnFmVQutIaTRttTdaE",
		@"fQVfpErarfiLt": @"lrCILposKFSlqfCIQhxnPaWezHHszYkUEoHroZLehHwNHPCQWtCwtXtinUHSyrCqAAaaLfOgaVJSCOOgoBzuFzAzlwtuciXcWtasBPQKUUASplkbcpBtmcPB",
		@"ZtpgREWuDEUURiwXQbe": @"NiBMYHEOOtSWAsxjbeVDLXXgIwaQWKahvetLyuKdlPSvcixQZhOYHsalLOLdiOgumLQaXdjuowphhDPaEduCXTddoUhCPZJMPnlNqWeXGSvyFuwjzjZbcbNOAbacjaWNkqsZ",
		@"hxItEGrpFgzS": @"xDSfsaeHIUhCOKINUGYhkRDXeTxtSgubtvbQdJlHfkoXxpMChQxCGEGBNcOitAlwULwwAWywyPJjyFHnSfWlNgWJGDwjbtMYSvYlumgfWVkPnYIyUIIItyARmdVTtVCfasi",
		@"bptmKqJPQTyj": @"vZzQDhWSjELIpbQUrtTwAqUcJyPIRKrYHZENAUZmVOLCUuQDjGRjiLtcXXSUMYseazKPTIAsAJUrmVmCJirAFvoACKeOAeYyxqRUzrDngZfNrNIiidz",
		@"GaBJWCMBKOIJAifsk": @"RtxARSWqqknQAElhVCsKjRgWLKEHeVAdqJFJohhvExAAzCSOSznIsIDAyDiwMseAyZHOrVUBJFpcuIjSIaHNgGamDWImLpWDVbMKDBLCqTuY",
		@"fhvfxaneUxVzPqz": @"UrUNBjoiKPjpcGTyOCfWZEKmMSmqXpJdZxaioRJMkinBcCSPsJVsGIJTVJobEGoljEqPEdgoPVWtApfyaDoLvuVJsOvvdzpfrZFDrvDoNl",
		@"fSXVuBGCjckXzZLxDWy": @"tTgacrAheXzPDDLguHkeSCPnWmAzhNXNkoGzPxMijaqMlQwuvsFGOCSqgwRNtcnYIUkEOYdyZntaFQbdhjdHtnIxhyIlbCNPjKJxGouFdSuVLBASVgqlkxjlpiaRHaTQFvJmCNwUXxQiLL",
		@"VzloUaSiMCWZXQC": @"rtkHwTWCMswjDAHalvhcbxmxkbkodWonEmsFHRUKLRzVbXXNvVMSZnUchnJomaNsTowqgXTShGHaCPemKDrmKNomqiUVocqjfwcfvcLywqLydVikthdCVosCFfbGRFDZoM",
		@"XxMvnQQxQfD": @"lMFcPBttwjqMbBeBWZPqMxrEYhwtpcgdQCpaJqpflgXmsfazwRxXCGgvubBypEKMDdqskpRNuSrNxAAoANyWgfGiGZXfCNxqDcMxBmwWrQRvHfMXzzvnQFcTxU",
		@"PnAkdunzFf": @"xzlXzYvRHsURhlbbBzcCtrbzQsbphdTPASVVKFUkznECGqEsqjIMDPylDEewdaTSSRPcciOcVnewGrAWozzGDKUsSSRBufGwhnQGDRKrURDC",
		@"thnpfuJEqm": @"ZJzFzdQeTMquTokorBnQLxXgstBcQPMlrHyxXeLhFQOQdLOqcfGNCALRdixajIPnBOBqCmeHgLlbDnbzPTlNBHIaXcJuEvByYUAPji",
		@"EbFhqAONGKHGSDAb": @"iNEkNVkDoyYguWWsKhKuZthFVPYbroflkkokbaestHJgqsHJhiAhyrMAOPmGiYydBlRfYuPkTqFPUAQPWzLHQucWuFiPeqMizWOPbNgLsoFujkHMM",
	};
	return xmUfYbHpfvEGMWBL;
}

+ (nonnull NSString *)CYdyyAEqgfVYnlHDx :(nonnull NSString *)HiLdIQZAMgYjTST {
	NSString *WxteUovRdSzBp = @"rADfSUiXZtogyvEwPAcNinAUFSLerVqiBVgXRbipMZohVqViKJUaUaESEPpFTQzONwlGYatrgQPTZZLiZwNztrQXIyuqDqpUrzWYLQgIcwVHZfJnQThBRXDoGACIKW";
	return WxteUovRdSzBp;
}

+ (nonnull NSDictionary *)GAAGukFrMPIScgVqbg :(nonnull UIImage *)EMqIXWywyn :(nonnull NSString *)HQlufEBIjwwEmzqg {
	NSDictionary *oQJiUWRzFR = @{
		@"rYxQhxVYgyMbj": @"TCfYVKsRDfdJQIZyQjBONjUjcwMEBcYykQIIpAzrTEulcierbNExijFJPVkkoQlRXArMvCXZlYHkUtkMMLBuGiFqUhfaEOBHNZbRZGHlknj",
		@"bOQLHSxoeltbVaNPLSE": @"WFDEKCIAXNRvwOUmRRXpbsdhIxDHhigJPqxLObBzYNsulZSHpOyYXaBsDvySdXHtxDLULgpdalqOXkjCSpJVAwOVZitDkAtxgdTfMacxilwZovqizDOsUGTQS",
		@"cRyxpYOxiFgG": @"aGhgapoZDZMoLSCqTITWyPEKFpMInZiaNUablcsxzZQDuhPdaudvsIyezogBziSJDGcEEWkFeWTRNjgXGLDXjaUtkzqDyDfBTeImSchyksqvaTNXOAXAGVhSrqblmuiiUPGkFPnUeccoQiVhXBBy",
		@"GPKcjYKZAJdam": @"cjeOaPYvzWRhgnoyxFGGbBisLSlNlirBauQApdbBKNOIgPnOqzUiZoplXXagqhUHHjcMxXNnGoUKjTucLCqNRDexpgFIwOXxTomBNTOqzHYJQFrPtWTAzjnirfLn",
		@"YowFdzgYPWNs": @"uURpGTxNxuFGdPeFDaXhUMEkDQAfIgoarjeewegcGopIozJDQdUvBnLubjDGZCoNkgmQrTnIQLBEtxAiFrXOfDFJREGZIJdlYMaRESDPbTFZCSMdGhYdmxVwOsKcraklmsIlXzfThqBj",
		@"GCMywxCGWlLZUGaGcS": @"ETepEWHptseeqKGxHFZTEWfndcKCOrVjJoCrwAsVKxaMeUPAkMTRUVPurGuatJwpBGbdddXxkPIEZTyFYPwQVDPgmUgKTRDNUdLpUcwMfThcHSBhBUnvRz",
		@"QRMNvBxfAUSjG": @"JotJhgUHOEIYFsiEngTXUtBRyayteIatEvaqAbZnwoJJfdSjJQlnjqjcXmihYLAKBtUsFvTIDJNDLMsnqPcQgqbvPFLqazmFFjgLVoHAGaDXwTawawelvOtXKuCUWb",
		@"bWaMEANXRxEVjYLCwE": @"wWNCTBdSioQCopBcsPvXYyIzADRShgYIipTxLsFhomDahAElPGdXvdzpZGdZCSYBxmcNWFVNcygNaoXfSoUOytrfLLMPYmuFmBqYhtuAtChuyKNzhqDCzJgGMbmcEematpxhW",
		@"vijcMhgPehnzdmy": @"oChboTcGZMxpQArHWtPtTdhuMtYwtstsXDgePJZjWEHhOuWLzBnkRxnlYJVYYjDhQthpxRANAZezCjfKYnyXXDgGyLydnhcFfbmFwXMCTSQ",
		@"KjxKprHWWvDOIhlNQG": @"ehDSvrArCumXeeRwhnnjyAJyMCreyoaEcHfSxKCdPBnrRMFzxfzaYuROEPvDiLjTTQaKLYrlLawwWLtMEfTFyRbsWUZSumsNfViYoiUELwmCWyuFdZWjhZNCGcCOcwTuiDDIjQITgkcGK",
		@"GxqZWTktbq": @"wxBxhUfGcbTEmiIgYRLmuYjBwThCkvAMzZwyUyfgfhLJQKWZGdAGSkDGZHGNnolxwzKuiifUbWRAAXYXXvSXpmgJZCIkriIgNknOwylpJjqPKMghlpFQTRlbfXdDOHqJsVPPHdXIGUeAlXlM",
		@"cppzpyavXEY": @"gChUaJhjuHhqXMpBjjQxwgjiluvwKxFCsinJzSReXMLxDQBLEvgveThCVJPTytGQwzEMwYdcNNXBVpJLXTTLWqNHGoAwZtQjBYsZF",
		@"GvOEmoKrqOHQhz": @"jPPgipbZFvtlIcGYCQnXSqpfiaMtMuIwJlRRTSxEulDEDbWFvnUPkyzADtTokwESMiPUGujZyGOounlkJXkDnWCdyeLoSiirkUUWShiMMEacDDmZAWuBsFCsO",
		@"QaguICLkGPoqPSbFUkT": @"djyLzpccqtllaycEXGZTFZvDqffnOvVKaVVjdJxdaybJOIHzZglgPVepVVuHkUxqLFZwkuNKhDdjgGBbixlMrOhEQfzUGdbUkimRdRgqFeJjPhTtynYPVlYILSdyDxYZruWAP",
	};
	return oQJiUWRzFR;
}

- (nonnull UIImage *)mzFvKFwajV :(nonnull NSDictionary *)GYRXdoNXcvqvX :(nonnull NSString *)nrEWcnYaaD {
	NSData *KuwcaauIfeoYopt = [@"gfpHiIvOJJaxtPPaZmmiBAtKbYvKfDYbzWcgEmjvMBRhXRlBLsxlssdtVrcHuDBNfbZmNCapqOsiNaJYfcxRUObAVhrrycOuvuTnWbOZCWzXgaKwLR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *HLBxrZycXwSewK = [UIImage imageWithData:KuwcaauIfeoYopt];
	HLBxrZycXwSewK = [UIImage imageNamed:@"JjgFMMcwVhvCEQumEJtrUtRsqOOFdHViXdpSPBhzRFZuPVhJCbWYZgaGIGwTycOsoRlnOynBTpctJOBtYulYISFFlZoVUGeLieFCMfANNeTrJapJtxsDAqDrNvPQRwQAQFc"];
	return HLBxrZycXwSewK;
}

+ (nonnull UIImage *)SKRZImNXst :(nonnull NSData *)AOdGbtCjgxUFT :(nonnull NSString *)KNrQCeYghaOkvMuo :(nonnull NSData *)JztoxlCWSGOv {
	NSData *esDmmOOzBCZTxDJ = [@"mhQwXRhHXRTSbpWxmWjEmeUoMQjhGuCkUkYxuaHNMlyYFHWYnUpoLBVoDKBbgeadJDvLAtxVEsfUzIdanNeVSJixaqACQEgrhfeGAprsIyThyRpDQNcSCSVVnysWmCepvfDoqcfRsCdYpQUx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *goINFyyePVlB = [UIImage imageWithData:esDmmOOzBCZTxDJ];
	goINFyyePVlB = [UIImage imageNamed:@"evpNkdjHHsqqbJnnsWWmWGAQIyCShwOmuOdxSrQyMRwrEWnbMXRHwkxIVfWfIUSnjPKCxuadiMGdGkdTENgSCKqvZkPznJZWgdflzOZGyTukenYLsl"];
	return goINFyyePVlB;
}

+ (nonnull NSDictionary *)WLRtyBTQvPlOLhmcII :(nonnull NSDictionary *)lmxxuSjbvhFBrTWZsp :(nonnull UIImage *)TJZtNWRQTRNbKGdxj {
	NSDictionary *npwzpRnhdGNguPgzfeP = @{
		@"MOVSiZYQwarigL": @"poZfMJzpfXBAonkUCYkCEFbZxsmdbIntCODaDyeLFeikYKaNklAdlTMvOQnxQeZVjkHvkSATbcyBfqhjSCuPWflNMdYJdZxKvtIAtLQNpOvkOyVezbcLjBWhMmWhKpVfuVIiufofNMmNwKtmjUD",
		@"BTiDgmNetvFJdM": @"FnmuiPtqPDZkUICmWtKrSununhLueEXcnDPWIsreiqxCUwfzeprkrMDhZSmydtejzaueJYSEJFqCkzaMeKfqHLngXAlRNIpwqYYWaiyVdhVsiqAOiZSTtGLYvfUAc",
		@"VprsTvfEuAAUDO": @"zZncvcvkCKLnshcFwKzqMVUIdZsivETJIEhPKxQxXZKRCXwOGdyOeaLyNbjEDrUxdEAFoiCSWgfKRMbNTmJdysAAjSMoGSnHzZHfgeFPQvEZcHmGNrBTxGStPmf",
		@"uvxtgzQSRgQMBJwxpIB": @"YXchjYjivbTpelQWsyQDpzyQHGBmOBivsFkONwDELzhaPVxdfAXNpwmdAzNWhMZnCHQItshfRQqSJboKPJjNyRYNCNzllQYFByVrvNbNpOhFOHKrUSGQQXMdjsqYSkWtcPsInLjB",
		@"WVIvVhhkrRczG": @"YFQaORDNYhYLyZQKgKsFVglVGlSmyJXkeAaFpokeVIjLdCfxHTrBsqqGnPvvAHPrIfWzNpOZeZIGiiAHTnChcEmSIrdIDWhblzbYvSQDrnumxsLqDHmFwWgtjy",
		@"PrqAPeVRoxgrRrwzJwC": @"FMgJgAoiLlZceRhvTfzojwQWFlAmZFPAphbDsXlNVAMgLaklAtBPiwyLRPIyGNxZOhgeXpydcCJvSybHnyJJNenkjKmoCIIuqwEswaoLxNFOzsicVqaLaMV",
		@"GvJypnwCePDzZXeIH": @"STUkWxSigGjYJWYaMkBiVCxznAwaLRJsOTqFqboCgHSRKhenYPUMMdBfqyLzmneKlGUHSYtlRHtrxnbdZrMTukKaJxCPxSuMQrpZcNXnNjBBFnKQGzXcSIZqXNAoPXlzGpLVhBC",
		@"KDFlIqqtCTBLgz": @"tiHIcyjirvEeRBZCAdLKNWZTSUbNdwOzzERkZzQWgtBTVHJLYeiWVBlfzdCuKDdNGoKZxjusKYdmfOBychlscFFEviMCMKouxDKOCdjJuFiuLozzQToXaZQBq",
		@"PpoyJlNkfuKlNfibidD": @"nqandZVzjuEmjnagAVIgBaQlhFLJGIFxtjZfGLHiGlmdaqdDnEBfZFNHtQDUySgknsBxeEaNqQrDllqKukMiExvTBqspsMWxqxRPtpgJlehEuGuEbUIHu",
		@"bsiIUYVSOwdg": @"MNtHueNEcCzJMzcNpyCqpQEdrlSUMwIBXeEPyAAhrXUTidvSVLdCWYymTFXgZhPeaIDauZFQCPdgiuVGZaKGutAwHPBGosyjvHFpTSYWhxwhrfHjgjczrWyYTkSzFwDBuMfeIijTpEfGdptx",
		@"iYqLrxfPcwsK": @"xpJGDotkTfihvNQgfIMlSgdnKnLBigdxXfADFnefKkqUZgPscpSdodatlMAWNNwEfKUFnKKmlbiIqTJZLZpkYLQIyHROLdfNyzQMfBXeoaHmVNxZDgbQbJFGJEaxtgoynOFRc",
		@"VpLcgLWZdwOl": @"CwKPTlxGJmyHJgXxgSkWEubpbUifzfqqqRXbmJTGcgAbpnNrlNldJUJYMBrIIxWWQsleEZzemXNhkgPSFcetRLZhzleuNudGuzXOEMbzombAgEJaDLGsSQqnqNlL",
		@"solCYUoAOv": @"FeqXhbpMjyICiQRJZISgxJbEOAsDVdNILVFJSbAOZQpoyZknUESnYcmemgqkFSWezmSedNBfXmJqyknlAwLKjRwroZVGrCHBNTHwEazjBUbXgxNxLhqsvvXydPuaqZApaRRCjsydoPQkWJpgRi",
		@"mNqfrsftOqWDMh": @"hgfpzcAENGcQNFLiITQWKHZsZNCOwoDFsSMNUqJAcHjzvqQQIZUaSBtYVKtRRfeNRWvHzwipuhJnXvmqDjhKTEogSILJYkFOzAVduZYWkAaQmMZlkJSBQIhXYtcmyvxFU",
		@"uRrfKJQjQbmZIoZAfHs": @"SDXrRPvugoUfUfkvkudTxiWlibctiKNwjmhVNkdNgGAsbfIqlcfAkNCjddiTrqKDETAFEQTUIYZTRyEAHwXkJSDSDpavVhQQbgDwDbmjdQNpkhybNgHDVtmbxqek",
		@"tzqgPitZauNy": @"gIvjXkZKOOfoPxYuUYRISYgbkbWArdUcWlGMqkzYtwiAZxCnZJkrgxrMkRMPOzbnKRENbiaCvoMVHRLWrfdmnRxGxQUeRPgLZGKGKrfinPkRqJldhzQVBTFLgUhLxZrLC",
		@"BbPpIKBsZmzSNL": @"WLTwqpMzsZAqODXNooUlxZfJtxoSxbLhZwTymnISseQfoayrBCRmQmJALOEznfNLmreRrsnUACNmGfyVhESUOYMTjihCoFmpbYjycSMBUErErjBBLgEA",
		@"manAnAvmtZrZQujs": @"upPeRPksDTzkmseTLKqZFbWZeAJfgaWtllYjiMCFifkCVUgAGraaokbvBLuoGIMJPIFokwJTzTuVpONbjMFndmSzrDGuPnOXoUdxdLcnmDxxCdXtogcWxZudkkqezIv",
	};
	return npwzpRnhdGNguPgzfeP;
}

- (nonnull NSString *)kyooEwVyDxns :(nonnull NSArray *)SSBJbynjnfOImsqF :(nonnull NSString *)vrLTpgXNUwwqSA :(nonnull NSData *)ehYUyrWlAggUmYpbky {
	NSString *nYQfOODedfVp = @"wCoHQqiKKdUgXmWnDUZTkwkapMzTHOTApzgCAapGwnSYocIgpVUROUiOpNWePANUTvxlhULiFYsOBccgbtietJkGDRkVgAJsXqhAEVAYczFxHddNGSzBUR";
	return nYQfOODedfVp;
}

- (nonnull UIImage *)hgXQovMEkpTNVHlnzL :(nonnull NSData *)WjeYexSKIiMU :(nonnull UIImage *)uXtpDdGBSMUtEIuw :(nonnull NSData *)NMHegXeTQceeany {
	NSData *yDYZDWSLfKCSJ = [@"obhyVWzVPWrbxobIihaHVjpTZOCIqGKkzFJMuOphZJSlgNAOFTzJEmJKxcYUtcSzuvLIMFiZKDaJNfTQskpbsIbdWazYELdllFJUhOjZjuRQzJjzXci" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jeFUOGlKAIbwlmgFm = [UIImage imageWithData:yDYZDWSLfKCSJ];
	jeFUOGlKAIbwlmgFm = [UIImage imageNamed:@"yhRyOUfSQYJVxypHJPtaCekNOFmjXordQqJqbrQCgtoXDktzWjLFekTXZfKDcNyynRRueVkStzvwshmCriJSJIBXVPLHSIoVCjRDSPYvyifhP"];
	return jeFUOGlKAIbwlmgFm;
}

- (nonnull NSData *)OqHjWEjwnyP :(nonnull UIImage *)GkAbGBcerV :(nonnull NSString *)fZKcEbWxTtstMmRcuX :(nonnull UIImage *)ihlipaZTGDZgsuq {
	NSData *opwdUhdOAdsoRiM = [@"YDUdJVhJTDfSUiTcPbKWFGVnWvhWDKcXsejGUuwGvpDyBCpgpYEaGKiTbAYNHWTzMIqgVTejsKsIcVKRKeWnFrmOXtVdZrXQSOYTkFHldpMvOHKSdsHHEaJefZbNYqdpuOQTvNPINsnbdSgkrzn" dataUsingEncoding:NSUTF8StringEncoding];
	return opwdUhdOAdsoRiM;
}

- (nonnull UIImage *)PHjWWEpisriyo :(nonnull NSData *)tncrzdKYne :(nonnull NSArray *)NyCQqmWnkptJqOM :(nonnull NSString *)zJskuYrcKhlf {
	NSData *rMpumWlTUo = [@"oorMqepqFIvSniZpuADgVBgxBYsjoTmcFOiIRIpGgpkuVxuSqnoiLEebDoZxBTOnCCmddoyMbjfIXmAKPipFieZsLqmstGwgKcvcACddzv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kUSRxHutERrVVr = [UIImage imageWithData:rMpumWlTUo];
	kUSRxHutERrVVr = [UIImage imageNamed:@"EfOpmJPtpnwhUCiOwXXYKScqVgdZykjFdoXOubfKQjkLBOuGTjIaalHHPelZCDaVqEmknUlifBkCvdyntumQFlINdSUCTHznmlOqqhVZLbxpPoEctmzbqFZgNZoZFGBSeieg"];
	return kUSRxHutERrVVr;
}

- (nonnull NSData *)FlrzZqOZlyLsgxB :(nonnull NSString *)ZihavORBvOb {
	NSData *KBMdaOtmkY = [@"EAIpcIMYAVjhRtlTObzimxBRjraZBaGZpEIsdVZgIOaibJyhGZhWPVzevkwOdvdmAIkrLoPjPOxmOApzOEZvJbbNIyZTbUSjUBuJGXTXeqZaywADPutYqiqYAPbHn" dataUsingEncoding:NSUTF8StringEncoding];
	return KBMdaOtmkY;
}

+ (nonnull NSData *)ZSRUmnzAMuaWAkhLk :(nonnull NSDictionary *)aKtsAHjbpTrkbRqH {
	NSData *MHiPYyYsGa = [@"bdpEEkOIDvuLfcptTupIXuEpZvQIopaAhJXCvtdKumSjizHVFdZjlsnuSsszEapiUqpQVFNTHvwFGagCWYWlYHLgrouHSSbdEOeEojQZjiyyKPdgVXQHGUjlSILOiyFyGkA" dataUsingEncoding:NSUTF8StringEncoding];
	return MHiPYyYsGa;
}

+ (nonnull UIImage *)sqdMDVFrPcQaG :(nonnull NSDictionary *)hntzHusUhOdjxHCV :(nonnull NSArray *)lherLkWoww {
	NSData *GmMJorvJrxeveh = [@"OxfBnvElCSKoVyxytPTXwqLRZZcjUxKUccOkSRwEHPHGfhViuwdPSYxBVAFXRiohoVdgDOTYbvMUVayJDbpYKWkagPqlBkFclvLywUDHIYQaFYkXoidWsk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hwqYHYrotaayBrWN = [UIImage imageWithData:GmMJorvJrxeveh];
	hwqYHYrotaayBrWN = [UIImage imageNamed:@"akSMAXdHmQINhAzFLlqVTTdOqeuKDfKxPcZymLvSdzCZhACDfJvaXcNsoUEOBVHGzbZnmipgRJSBLfHEDYPelblbkYrImFYFrDelMVqdvRzHDOkbJNiAZriEWrozXLQSMe"];
	return hwqYHYrotaayBrWN;
}

- (nonnull NSArray *)yCsdKpLKzrAAluImo :(nonnull UIImage *)ayMxtECYGWXEiI :(nonnull NSArray *)BbkhaiLlvbjoifmD {
	NSArray *KMhiFroIABcwmzBZ = @[
		@"VwaDyjWgVSumAZArYvOjrCwlehmmwmrlRdsgOfjfHnpeoDwgJnCXjcdsVLiYJCJpwNQugVMljfAlmjKHHSfLbbElAHqZwWYyrKtEHJTls",
		@"tNQbeBFBYDuAkWBFwxeZbDEaArnzkQZNVVhqOGvSOwNmihxWbRWBVRvUHfWXGicxiHCUpXECgUqNtePuGywwsCHkObRYuPfnGbGyozgjSMcqXpZJEDkOm",
		@"BzfwRNxNuwqIdnGYgWmaCqUSChjGOkiWGTICViyWEAwZsqUrOgjMHrhKjrYODtkNcGOiWSVdhAtlDEWbTVGBotrJuSkNtsRFkLznDktljQZasyTECRlbnZxlroa",
		@"rFseahdkkjsibGzdhkCeGqEIYqKGFgvxrrfoaWIWLwOzAYrkZwWTzaoAOBLcxAFCGOOwLSowkMALxoHcHxFUPCRJNysbrfYdIEIVJHgxcRmuPRCbpewFRrJjZJCidDTJxHB",
		@"reladUExXObAszQcbNbQfemtXEVZTaNYqHMxRCwzoiFEwVsvMMvQQbezuHjRQoZThbPZiZkqIxNUQyEbiSGwlDEXrVyDBDWXGNJmVZJWXHlQtdcCQMdZRBcniyKyUYGfLsoTBM",
		@"SwvmaauErnQwbwWegaasgVCRGSrjYxawtLyWplcmaIfYxDnTSyOkVonUQpYsIlCypUNcOspvYikkAotstVXzQKHhfQhdlSYvROMPSSduPCrTWFFITDca",
		@"XjslPRHBPGWCnxEXJBXuzqxcSnDsAQFVrznxMYNawVQhqtXfngGqPKjOBIEgJJggzQaKQRdQYQBPHPsomOKQVUNwVFknNOmWCFVPDUtIHxkVwWLLLMDSRUlEYAdSIPAEseCphTrMnZ",
		@"xYrQOqTKlwXmXbxSYYIVfEAEXqiRTQYWRRsDpntqvoNSuXTybvcKSNqYKbAJcYthhUdOlpPgGKENmHdsrBhhqWSuALwnXwppRbJCejSJAOmOrKXZllqFLxWozkOxLYifNfXJpalDtQwqozaGhz",
		@"IiOHMUBtKclVUtkKjDLtcxQYZKJqmygLYXPuOULVgzMpohmAOGWOzYbbYOSQStOawWZvdYDBpCTYnKIuJbZVaBmOSLtcQRwqjeFlkZqHFcwcbQhnhzdhXvNQxofqrOCVzqlSwdlNmLuaw",
		@"mjafLKZwyiIwzLLjxAgsGEfaNUYVEJXcYrfempnYMKDRPFytOzKsIqhTojifvRTATFeSZpvPGshizZyqwnolxJFEgaqYYjSCmKTUyqxZagieuXgDgmPZqgHJdRhnBOLw",
		@"ZPxppjEtrwmmkcGQPnibMuTFebeeYWsjCczIGolhOEXgmjedYUblapvHnApuKuhfMxbodAULrekiwMnlQAQakQPXIMHFnhXwAhbynJFnXbGhtnydAgIvU",
		@"BnhOWIDSEIKsxMaBoDwPaVpbBbErvaElhPYTQTwThFHKnqVmlrrMiQroSWBqRaQuHQgQHIirENJJJLetiAZEtdVtEXgvDsAhrvwDZUHKBv",
		@"octkypvvUysBcsajIChhLnDMyTDNLxEsUGamjHHqJWCACXNKEEmRvftqCCFJocVgcifbnczRmdYLvaVvDQnILgwmsGAqCoMphqNVLHgV",
	];
	return KMhiFroIABcwmzBZ;
}

+ (nonnull NSData *)UDLKwtQeyJ :(nonnull NSDictionary *)ugpxdXwgGOLRDQ :(nonnull UIImage *)jDGqonYrfleyihBwLM :(nonnull NSString *)qucjDjlzBXdERYSvek {
	NSData *HPowtUPIBvy = [@"BhgRCrPMzejuXqMqntSWXqKGiSmNcpmiqdWUpdkKPMLLRFpbWnirzzcqxmIXHHbOqfFxLarqbcmgmzDBwNuLBFoqRGTXOExAwTwAsDGYSnSttNTFH" dataUsingEncoding:NSUTF8StringEncoding];
	return HPowtUPIBvy;
}

+ (nonnull NSString *)ZeIFQZsyGee :(nonnull NSString *)GwnzEcRzTtXYV :(nonnull UIImage *)uVlBwvSinWQExX :(nonnull NSArray *)vplRruXqlxuL {
	NSString *xdJYfLeMkC = @"DNMqiYIBgOMvFbXjHcDJWYCCQYwEVXfASMNGpcIcHGwGzzNgglaPnLoAyWVOyNfMeXKjDphRrOsuJepgcYZUmqDEOsZmmcgDDIfmgUQ";
	return xdJYfLeMkC;
}

- (nonnull NSDictionary *)krWQWizEWlyX :(nonnull NSArray *)vpNCErfuwX :(nonnull NSArray *)AQTwekjArEhDfdtvZO :(nonnull NSArray *)GCcyUSxmyTbCV {
	NSDictionary *wbVNWCDPGpxNlvQzVZG = @{
		@"rAJSIplFMqZ": @"QVYerzBhAXQzyAGGXgRrGBIyyqkYoljAFRgTpawrRxjMzuMgWuMouLCnltVKpOfQJbsHjJSbVCBoTdxaWnlmIeTFXFaBIDDRqgdKkGYycddAQUqVFegnqquDbH",
		@"hBhvNvcmpMVvCZ": @"vWcFhiaguRSCaMfpUIuDdGgFtVkJisPjnpINTwdUOLXlDMUtyxGqFkSHUCalsLglEfsHkfgkHrYhMewpjkEpkWWoFzIIAvWhuCJqWKooaYlDvFejtnQqYZZFehcasjO",
		@"grbDIGlYcEnc": @"IRNVDaJEJXeMHFBghOWvPQjCpRiqoAgScrJYndmNWPFahinYWyBBnUTeiViEdbaSTnihEhWdDwUrqWOxSNQpEJMvQKzwxhCVZwQFCOeGVxzfhSmdYJVjBxeKbCCWtPJRPovW",
		@"kaKQIugHardC": @"mOtIoasIKqPALftgSQDQHFSNSbWBeVcLBsTeAuhzcCZWYMJWlGdJCkOZEBtwBMPvVhikFOtfWGKBhgsjpjbByFNVtaXgBXhKUGzRPQMIkXLcpoyWdwjnsqaKtDX",
		@"nxOpHvIJqbjFFAq": @"KlBJtsVRXjqHiJvHJNdvUNhXdEAgJyXByCOFGdBPBPBvbTyfCCZqpGvPQdOwrazrnGSKrLIlVqGgfePzlShWRwKztZwVsrFZBexGrJiFxHTdvHRpplExLdWtimqCvXFjNlBJYgG",
		@"NuOZPGOoFIHxRlZ": @"AayXolcEuDByLUjAGRGfEOWdideDGTsNtYTllkPeocsRbYxfuCSpmsgwsrpvWJOdtBaTNLJognlBFcHOMcNWMOzdPYvFLOMkChJXbvUcsXDMporZebfGw",
		@"UlrPQHQyaHIgZsI": @"lrxlOIYXpreCzDmlzlshiSeMqOgngwiSTHgPzmzimaCdDrygFrtTpIZIZSdEWdBiKoSKHoZvhjqZDwaEcTVrBYYPxQNWQGxvseBjJCPpXYSAkkVIHor",
		@"WbrrGsErbYb": @"xIOuevtLhGrviqquMANItuIvsNuDkFjyFhZdhsmXfsjsEJXumZgzGPJDGiHqGTTPpfHGmsgLZDsyUQeGwEaEzNyLWtRoLrxuhKMskvEwqZwvLAiRqFaPwlMAYqWmiBPYJttSVZhfloTQjnQ",
		@"iLdMqvktbdFTs": @"YrccZESarZPlIFQLZURwnCbdKMLEnWnfSoLVQibZNXZZSBnjqolZGeKAxVdGqpESFWbZfPvaJPmSJWZEPlNiLtqSrdKsQnaalKOnytwPDDoSEUMzpsOdqFHXir",
		@"nFJZDXIJkpkhMbJ": @"CIleGnOSyzNCPGQJhlggcmURrNRsXyHrFqfBpjPXOyzMTDIKRlYdZtzfNnVJBtOUphVLVZeEXSEVHxzYvAxdWQdfnVJVZfiJAPOtlaTIOsRqEEjBOynNZBcpCJjdDZWykYpOqmbAAhbYDzjbR",
		@"ihqUkuMGYkdKcJ": @"iNzaKszZDpEfsqWbUcUivmHBYMxyxWfoScEPjPVemTjKwmtXoVOVtCwatVLFgqhlaVsvUxACTWTTQWzvRqBxYtIGFPSqVCjovQJVVPMOpboRSGuwFbZJJISfvNvNxRLORD",
	};
	return wbVNWCDPGpxNlvQzVZG;
}

- (nonnull UIImage *)UDpuGsLbCnaNYqFcrwg :(nonnull UIImage *)gpUvAVbGAX :(nonnull NSString *)pTJqAIhMsPmUsCsRvAH :(nonnull NSData *)fXgfdvBnAOywUBkBjR {
	NSData *snDXUJwtJdaDvAjEPfg = [@"FdPzeyetRCowCPvCKHEpmgezDszWfZzfypjSdQjDglDSsKqaqhvBCTIbMnzshMwaTXnMWPyvhEsytWZvKQZuyEBJUwCpeYrCSmRSeIsJYCr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *haqGmNnTDuWwYWZcmJ = [UIImage imageWithData:snDXUJwtJdaDvAjEPfg];
	haqGmNnTDuWwYWZcmJ = [UIImage imageNamed:@"gqYuDQpNsvyMVoonzljyXfBPxnDwFloIKWDBiAgjZDGUATPkukRexaUjTObrCBBTSIiWuqAdgXkKqKJomDDDPZljdtBvVpCPNgWnADhAbnRvGUbMIxbKYvGxiUzgAeRExlBupYSoLKN"];
	return haqGmNnTDuWwYWZcmJ;
}

+ (nonnull NSDictionary *)LFmfhDfJZeNKRowc :(nonnull NSData *)VyEKjqpUMjHtYD :(nonnull NSString *)vEVvkPjYrkIdogf {
	NSDictionary *CDwualZfen = @{
		@"rhpZZxkiCSbvZ": @"jrebbdgsGltrRZpHtnszgLRlvSeFhbeQZFDJArgVhLYTznXfEpxLSdJfScytVEaMMVUYTgQAgaDlBPbRgbVENnWmzTXNLAdHxfNbrAhkwXQgmYRDVKmbYarjUDlLfJPlftgCKsFPYeOXfEQ",
		@"XLWvTJnUGwhE": @"ZPFgfvWtyDlJYRufvECbAhcNqzEvGfgMErRAQqyDfAhxUjOHHiLiLXaWxJBwsuwNppGTXMQbXhZrVvRVozieIjRTJVEugJpHSGWjffBRDAaHefjgrJdQbnNSTetGgYsHhv",
		@"YHOwisKYvFUipCzi": @"fieaMZqzCkPtziDhogIivlcSrYkatlUEGHIIOkHgIqaQssuFjriLfzvfCgRdOFIXmrphKJPfTClhWxjsBXHUzovwJNYoLNCfKkOOkzqFlBVu",
		@"OxxgskMahRzzRgW": @"wkYIVuSxUaDrpNluVKWiYepxMAwZnynRgCgvDVkJFlsGXUsHRoRFmVyuoJchKHjgtUFyCmIDrodtczQJmpxlJbdjnMjlOZmfotXSBoUFxaVQvHpDJGXvQhfSbs",
		@"mRvlsyTsrSvEo": @"ybUkHqOKlbAWRneaLZwHzUeTVmwLSwsJHnmvModcvgQzFzsLacgEBBCmFDDhpAEHKYnPSZCnENcicdSVLrsXSiTJhKVUaOtZQOJKZBVrSknrzJpWlQhmCqAMLOIYVzsiEMFFiYRwDQdrv",
		@"HYWLhxcdaIAKYZJFb": @"AfjANgriQcmFVTmagyJATGzCndapDtdHORjoJojeISBLjCVVaiXMtcbPhXbsxeydkPBOGaBegOkgKRAFOGJbqIVmytuYqGVDHXfgAsvWMVWjjZEkdkiwvspyb",
		@"hpEzwdgLanMOsrPnO": @"UNIoBusxrEOgVtNKXRSPsXVKopWVqeMHhCZubIbZCzzXJRtSHFPNVDpliJsZJlCZmxDdlTsBolTUVLkHqIEwSMREmtHqCtPCDkOTCZmDDyzeFdcOTeGjVNhkxSKUvrCulZvhxhRSQsVRQTyL",
		@"ETyggIBQDSSHZaYb": @"mrJevKTnzFMcuvLWrqOlXyHAZbwbrBHBWhBRuwPMRaWNbRuMQRekenSuAldJAQzywIkfJGJmMWkuubVZNFfMdKGANmgWcAzYjGGkOCQo",
		@"misFXNcexttgTvSwHni": @"ioZTgVOaFOXomYjjCtLbAUybOMCpkKXqvRJEiGSJLXukQEGdNFitZwRWqIxZepLSaKOsnqeaHUOhKFGNuRqZSpKkeAtRPuilutDLhpinBAhZFkFanjA",
		@"SyNbbLEKDwbipJIqNl": @"lRgjxoAAjcZffeBLQsyMJHHaaJHkYvrrsOCbsPAjQbAvXoHijkehbOrkkvYuzPgPVYXdpQHXyktzkGKspWOqgNOmPavmXQvcRPXeDmwonljtOUDWPjsgegIwCm",
		@"YFyoscCtGZvVdEyS": @"FGTwsOLygmGHxdvarQfBelSbfdSggLXaLrkZjhBnWrzfcIduxpXmCqZjtyoMUFtcEyJrxFmnHmkYmjbHmBsIeaBYQyxYwmxQQMTwebWzGktLZMoedWBiGsMuGUnDtoIjwkFZWtsjgxpqkScJlI",
		@"xrvhbFIgNCWWZHfk": @"ByMiziYNMPYXVbIoKAgLPKPFoVRfSyMxWOGdOMikMEOiVNkumSTxaHxsBCUqtLAyftCmUmdorghPiZqnGXSBjanvavGGrJmCaMEJaSraagJgbDSmrahJEOCISkbdwiYivR",
	};
	return CDwualZfen;
}

+ (nonnull NSArray *)aaWTmplhbwuKud :(nonnull NSData *)FBxJwqyRUlRyYFmg :(nonnull UIImage *)WlovpUZGjLRKJcAjDB {
	NSArray *MYUBpotGtvKdCIVkoPc = @[
		@"CGgWDJOdxrnWqHKmscsrLgBbUPWtwPQBJCJjsOKaRVDiglOqoosmNdyaKMxKpITCidaWTXdMTeKIXrMpwwWAyErkiTqqNiiWMUUTqNp",
		@"OWnDuxgVLIamXfYofYHRqzuPcHydOzIJPtWiVKsvgtEuxTMyZrSETZiKTiFTusIPksDJJNGiFKWeHHHeLSdbpohPZuqJAAOLVTnRPkFwYxVsG",
		@"atyOvrOHNNMMIgEDxdJLGDqidAwetxgBspOeoRwUoTZIEZohvSyWJydDfrUqJjmhnhNdtLICrEmZQFnGaMOjccHuxuSFLvjMZeFm",
		@"ldtOGcPaJSmSYhLZcTkBGQjiwyMmnkRgUQuDQQhrTmUeUPseSKYXPFKsPWsOIEVIAXYpHPlIbdRlXaKSbzrFObyuxViunssQkNMYGyB",
		@"SfErKzODdwvINBvZFItoDLhRnsPxcutWOrGKiWHjSubtGSVkNrmNcilHVfMfhfVxhEzefMGIpQaXcsJPRUWiSJFeZaCXcaoYHhKlnHPDDucixTjmOnxNlrQeoaawrRbyniykIeq",
		@"aeYBaoFyTCjihhqukLtojhYjRbVfpSIHjqnUZdxkNBePdEZcHMeIrEDtAiXINAaSqaJzPOusbsoVwhrAUKfRpmVdWSEONnLfUAWunAnPdLncvoTWJcvuzLDhFnXW",
		@"pstFBeWGDFBGKxRbUuxIRRnoqDjSanGJpXsyoCjJFQTOrnNlahJdolKgkfeczXlAEPzEVLnFaONGJQxInAIwaUmHBGZLIBaAfXaJaNTwqGGwTCGzPnrnlwoOJTwWOMCCNJUAhdptTDoEai",
		@"WUbmROildAthWNrPphnCrXaJCLxswngRannbriiJhTSWaBuAiJmIsGaFfZAJMrrRaEZjOjMpYJaAVoApXmxDvrUGQsdEFKnbDyvzCfOIkEgfVwgNfJBYtNFUrMNEJDlRl",
		@"OxHcyhQiKxezvxLOEEtBtfcCzCUfZVqUOfmkwRflRMvlIhkZHHdXaILqcZXmApiTAcMOypDnmcmOEwxzjMflifPqHmhwbZxlAHWqwgulylMPByWHTywGmWqsaPFBLAGOwxLFOKDSyUxdDpeIAht",
		@"BeAjnymXthclRKCBqpACpCpDuFUiJTSurcjQUQPtlMLnteJQRnYVkkRDGZNMjiyoOBKuBaHUmsMqTHLHNOUrpyApBzSduSkWSlSiAlHtebjbkMc",
		@"aSQdeIFYegZyvuLpeAESIjewHfMyRStJCvSsLKaENxDkBOwTVeeiZFulbUGRwRtfyvdMZJjvSdJxiePuGyCVDHlyaVXChZLHMEBAwZABCepNR",
		@"vfablGzaMWtsZsjGPNgKSAuVSoDudPVFyzVsIwAmQUlkZcYEjIcxpYIUSkGVgsogUBsjJXbgtFytOntmfLxUbBSNTbcxhUvTSqyzGrODxVpoEcjEoBJbXfSIkvpJ",
		@"bGqWNciugdWlYqJwZZsXKoaOyStVtBOMZrkHuvhNDnBYiscImPVWtHLuRgZJkInuKoWcdnQgsBxMgqqPEYqXuJdhrYCfMxEOUMOvWIVjMKZDWAzPRbVUWSIFPXMgofY",
		@"kfNlPCyRIzdvuMXCDAcAZLtRPPfxNrstDJJAgxQkXzJeXICagFJkpLgMjjhPLUduqHbyAQfsbcyFOqWUSRNTeBSJdYqEaDlXTxRHJMgTMKtGG",
		@"HxBZXxctnhfcbTvxBUWGmCpspeYIVadDikYcECdWdrfvZeKSqoLGEaXtnbkEWGzFMFwNROAEmsEMuNcLumleYhESrRntALfCkbbalhGVJnUIYheBGbaHlaRIaHbWtjfdtsPRMqHAVWOCkZfLILfl",
		@"JOqAknDbIoFuIWiYyJAYrUslkhuTnhIeaWYaHhyKDJMxRxwAWQJaPiCqJPoZpZABFhMpeyGJbtPdjBjKOOemasNgltrkBjpsydeopkowSTLYKVYyIqmNhbLObPFzVrGvmbzNShKllxUQtyuz",
		@"ePMJolKFWFtIINEicZxpxLlZZEyPlnkRkSwLVLhvJZBEKrdDCaZUCZCFqlIDJAPzYofpfCifhwqZMWjUPBLoBxjdiQSsNCcDWuuGFReLTVqyTm",
		@"CyIazTFMwaCGZspVDECumUdsnjcFWpLLCnhwvlbILGnrVdRoYcOAvjXhLsjcRxxkWeiHBHYSNanNHyxrsIUQSlbJEVnoFtUwudqvnddWpST",
		@"GusOmGIMcuqJLpZjANoBQLbPHRXjsskTSTLEeKrAFFsGvzHtFxJpgokeRzfvWavrkwOSnJjgWlwzcKYPqGnjrVZiKSKZfgxgfSdppVubqakMzCfpUStPs",
	];
	return MYUBpotGtvKdCIVkoPc;
}

- (nonnull UIImage *)LzMsinMMFjmzrlMzs :(nonnull NSData *)xGkzixHvCUxYfDop :(nonnull UIImage *)MQQsDGyVIsJZcBwEn :(nonnull NSDictionary *)qcJdDvhdlD {
	NSData *izAmAtKCswHQdGIh = [@"yqBvhSxfvMcaNSKvllGdTpfbHFNWjuHYLVwKHbymPxyXDlpSCbjKBuKcwQxQMlpCmuMhLNqxzbXLBJWQFMSeQXnYfvXpEgMqlXfPEQvaAIWzkQXKVlWEvnWy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ziePVtfqDGVkzsgB = [UIImage imageWithData:izAmAtKCswHQdGIh];
	ziePVtfqDGVkzsgB = [UIImage imageNamed:@"nFWvDNArKvBZDtWkfjQMVCpZpckfigzLfhKFhAQavDicQBIrJHDCvbHOQiinUNYHLZuVRkXCxJAmtdxzMUkPDVtxdwtZOiKOFttXMSdJKhoKPBn"];
	return ziePVtfqDGVkzsgB;
}

- (nonnull NSData *)ZJoWnyYKOub :(nonnull NSArray *)ifzwDwCYwqhmfzTu :(nonnull UIImage *)qprLYkUmqpAPYNqZaad {
	NSData *WUBIRZIraYUoEHF = [@"rJIXMEGbDOYjHSTltdZMKqTdfhiyFuVPHrFKLFgJkDZPqwxYHiJjOOMDqrrEYLrTiirKNwzHhQkYqbtqQJDDCqlCcuKeoDSLVpXEQxppyWPZqAtpVgOXrzPqkDcqFwovXUhJHFxtF" dataUsingEncoding:NSUTF8StringEncoding];
	return WUBIRZIraYUoEHF;
}

- (nonnull NSData *)EfhMYCBnoEELAD :(nonnull NSDictionary *)eNjiqKYOluQ {
	NSData *ZjBCScMPZneExhW = [@"tTvUALhwzaGrzTBawIPyuApleBLbFBUWxGbZBfOoETosHZHmdQgryYAIVUdcoIXbpvpOpwSkytsgKdIsXpNeAzFdeMODlkWroyqiXpAygOfGbgjwusLCHwhFgkOLKrsvxSujgxQjUuBRqBjoN" dataUsingEncoding:NSUTF8StringEncoding];
	return ZjBCScMPZneExhW;
}

+ (nonnull NSData *)FcvoXzHtVnnVjUZjyl :(nonnull NSData *)caOwutDfRDUDvZ :(nonnull NSDictionary *)ervXdrQrUwRoaF :(nonnull NSArray *)oijaBnTKcQosjaSH {
	NSData *XOhkDDQxJXYOMOerEH = [@"KTqeUUZsliYLUKIrbUObziBwEBuoFiSZAMhANeASuPvxXCdeUMAbDMfchJlCQLZrPVIBbeMGtsgRQurxyqnBTtdsbYQthUtHJLDzBcWEjxahkydpsTrGgZXXdtorVlWRLsynCAFZarD" dataUsingEncoding:NSUTF8StringEncoding];
	return XOhkDDQxJXYOMOerEH;
}

+ (nonnull UIImage *)geuoDwygYEXtugpR :(nonnull NSDictionary *)kRxTNKewyKAN :(nonnull NSData *)KkNcBFtknBMIIX {
	NSData *JuMSSvomAIYCftpjA = [@"xbRqwYXSsdYElaRIRKPQSOFxaoioRbqfZzktCxiaMHeXDTGpqGdIRZZdofJDTbjlAYTvWCfvZOLLbCTViNzPjTURpBoyJYGyenZEVdLnjlgZMYGzreipKXdhZfRvtmPDbPrstPe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uUWAeKlFudVi = [UIImage imageWithData:JuMSSvomAIYCftpjA];
	uUWAeKlFudVi = [UIImage imageNamed:@"xjHZaOFUonavaOgRyHZBwvuhJfmloBUgTFyTQUFBbofMFgjrxjkgjRUjJWJDshVBxtaczAtyAQTlLvCQMnizihWWYHurfDXbGlFsloHwlRvaRMyN"];
	return uUWAeKlFudVi;
}

+ (nonnull UIImage *)gMvSlHZgXzXXPE :(nonnull NSString *)IfCHiiMkVmSPA :(nonnull NSString *)HVIZJIfgYoJBiogyCq :(nonnull NSData *)OqoUYBsnyJrvVOMuiz {
	NSData *CrvDvNMEDUWASohiV = [@"pgIZXqjHPxbGxnvvJmcuYcflYogKKFgFHFXFpawCgIvfSMKZEipYbxdtzdlPNybOjSwoWIuPlIbydfDVNCMdIXSyXbeECjXqYKOpAStfTNEAwhsZKJTfFwBuHrTFNuQnAIstyuNCEeNljlvzQa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LfZUyounjKpqHcG = [UIImage imageWithData:CrvDvNMEDUWASohiV];
	LfZUyounjKpqHcG = [UIImage imageNamed:@"XoUUpopMqhQarElPIOUWwcaZxAURxHwUIoJZrBOfBcyxlOUEimZRgFbHADoTMNwuKhxOPJYvZsKmNaMIvhcVPigwVaKAqaeapGyNXOkkcsXskgKQkclqAmAYKKJIrynkyPYuk"];
	return LfZUyounjKpqHcG;
}

- (nonnull UIImage *)FqaXKFFkEhYuu :(nonnull UIImage *)CRCEuwpYYdwrgIVxZJ :(nonnull NSString *)KjctgUlpwuk {
	NSData *yNvsadnPibGRGBUoX = [@"QwPGhFVFpiNRhLCGOWMGIhUNQlgCLByKpzGKZGVxESClcSgQfBxPFKliqXawEHRtQdBewvbZduFHLSxpkXyVgzjZmfcWZAYaGAeywiGEJVPzCEntXBevLRVIwOiyfGPGBCbapsn" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cSretNyMzUHNVRwXit = [UIImage imageWithData:yNvsadnPibGRGBUoX];
	cSretNyMzUHNVRwXit = [UIImage imageNamed:@"WwozwxwsnYobfptDtBokawNQDYbNQmuPIlifiMkOBocLVTfqjXYCvoTLVUTeYgLtcUtYTLzErqVimzfHPXgoxyGIZcQfLoNnuEQTPoLbPneihOMKwNcDCIyroyitQvEDK"];
	return cSretNyMzUHNVRwXit;
}

- (nonnull UIImage *)gnvAsyprYqgRm :(nonnull NSDictionary *)cEOeTGCxsro :(nonnull NSArray *)JbHmiGjmIuBjxttxRp :(nonnull NSString *)MtjAAGTFcta {
	NSData *CgjUESdAnNnIB = [@"JyrOWEPtZCScuACcqjGMxqDwJAwalyzvbcfnGhUTINMSRIhYiwzdGfpBzuOOOLRjAMKdLEMmXWzJIkZiDJBCkycJgJblRKRRbDylwdQEjCINQvbKpVMglvNAOeRbYuTVusyPdVCaoNenOK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dsKfOEXdtaGLTRhNBec = [UIImage imageWithData:CgjUESdAnNnIB];
	dsKfOEXdtaGLTRhNBec = [UIImage imageNamed:@"kdVqLDPhNPxgWIaqDSetBLvvwXTiixDWBetfdgLAgHMoaBUFUKznKeHPxhTbXWOeuCHDKYlUUbzbiGkYLgodhNYlOQrSaajVMLkTlmbaBNtfglMdGKgoHqmf"];
	return dsKfOEXdtaGLTRhNBec;
}

- (nonnull NSArray *)LlDUTilmFCW :(nonnull NSDictionary *)KwiqqFPucacN :(nonnull NSData *)ecLVWrbHJH :(nonnull NSData *)wdbrGmTMbR {
	NSArray *cxVdbuQRzXdFUlKnWaX = @[
		@"tPHwjOwEAkURnwsjMhvbRWniEhpwurGbUVLhnrqJdunmaqkYdsmxfSZbYMZqUYADhEzRYHPDyfDPdkKJvhysYGbdFnUOsZIchzXfJmPeuWqDLdfUbBszRtHQKz",
		@"jLiFmgwMIlPfuabhqCmbcPijJPuCSFvqURxVMiPADcIaGQeebCFtMJQYsVZoVoXhdSpxQJNVuuYsYBINhNkdGXjMcfWMlMXrlAJEGttLAnlANqkJvIsZWTaupoyDucKNgRcj",
		@"uZsdEhcvcnSjMIBAIAJyaWsRkVVjYgFwJXOQgMdOzNVDCQtqGhhrPWTKdDbvpsdMPDWmPscCdTfgYLBoDtQQqBhVsIkQQxTfxubAJwtrQrKIaoTtxtgeEoezlAurNJYmoApDgu",
		@"ZajNdVGIQSTpZNTyWmVjhVBxtPIyvYTgiFjKECCtGPAPffhuiqMKagiDCvFPQjgkOhSvKEZPkDDnHJyxWitpwNVXcFFYQIKtnkHjWelduGdIuCTiNutCGqfTfdLU",
		@"VVxwErtQHqPYBitPxIkPnsdVXwNsWsdxKKwPfapbBYmlKNbpVwEbbiMDGZcljrcIzusTbhGicfnRboBjoObXfGmtBjPjvDTPIqyluiXYugvg",
		@"dsCdwafAekUTbvnFGhSkomQBtHZEGuNEuvGjnEOjdEOmmMEmqTCtELefszfLcWPanODXTFdWvTULDZwsYGxINvpJhRYRWTmFqsJYGVUpiWktbOCOSNpWVnPJYYAhewWaxM",
		@"bUQpGjlqCDkoDNggwiltWBCzdcMNbRGXJVgqhlBNrWYnoqeZabHiZTObArnBaHaScFadsemAuvJhphshTKAFOzhAsRzrdKlBTxQiHTNlESrCGkpEnkKFZjonyDbYb",
		@"eYStxdrVXUGzbSKWfgnrvKhmvvEGLDPkRqTohrbIiCtotZutafDtohehEklwjiSJcNPbHSlHfJseNNklbNgCjASITDVHzHcITBNRUmsKtlpxeHAfPJ",
		@"KjggXLFNDHELMerxIpienypsvPhWBVZGEFrevguSnEuIbBZXxCWmyBLWAGtquTsnKZkJeUoPrvPvXSNMynGLNFmCPtkcPCjrVlOtxRMcPqksUxspnkFBqUeXzqcasDdUNJUunsEqPaceMBXCJZHz",
		@"onuPiVCAMANqObfbhTYoQCKXrsLFtTOOWIOhizoKNBwfzRtlejJuFbQnTjJDxJmQPoNhyXxjBrqfviRJWsTfdKOrlmKNEYdsmLZWjHIcQmvKComUOEXzWOgKzMXE",
		@"YWpZvgsuDqyMiGtIlQsfVbEPCWyXvHVJWnwttDOGSvLsdyvDSjBuTRrTLZkxEQbXebZSgijFYxOjyAhRtgzGNubIzZpvpICRyONWNsURflVRdUtTW",
		@"umvJqUnnAgoskwKbteMpSSlRQqhwjEmDAhvAyWeeZwNemRlZyCOzIKopoImyxYgoKbFSPkJtNMYAPOLKldNhqaihVuibwuxkmXZguLxvfaxyLzAzLXRUUQDAStWFgPcvrpvwxyy",
		@"rOZqKEUBwmhYwGXFlSCmYDdhkWedJntxTVXwlGRGjDSsNpkyuZGdxfByUbpBzCVgBAzUMFTCDARDZrOeRctgLHbrjyEkviwXLBdt",
		@"choMJMetKfZTesCWtaKNzLdpxkIiitpsObgEQFPbQVXuekrvhCWLGelsAaOIlGpytyNKLPvWEhkEInBzAaBmRdpXhrxfZwDvhuUUVKweZQfzZeDkwUKgogNaw",
		@"lxMyTCeIOaOZerAHHGVKydBibkaanNGxbaOzxYOZmnnoPDUHyftiqaovTxRHTlQeOzrcprmrZswNftHdLFlXSMsgtLAWRKnQquPdOXIdokCEZiSEzWcFwodTEIRViVOHoXjaM",
		@"McfAYXhEWdCGqWWkYNqoOmGNmOFLgidzRRmzJMWjhmMsiaWqLmjnoQyiNkDeTpnrzZeRuUPcEQiGVjLWlmKTOSliLvTKjbjBYdOWGumWBakvKsrgcbAJMgPI",
		@"TMXZkucukcAAuWiWfjCsWIpknZRfZCqalfpQyhxvrqtHcENPnBEeCVgmHhhlkNoLgYHxDrOcmnFJBEIGyWccEYdGoTyhcexDtslFniXxgHPeEnRuSRSspeT",
	];
	return cxVdbuQRzXdFUlKnWaX;
}

+ (nonnull NSString *)qDNZwTWQgts :(nonnull NSArray *)DkpcdpXxpNVH {
	NSString *cLrDbiGXJkYXdBNcV = @"svNOHHkekqBhIOtlbNHNuTFCdMhavLSFbXjebbLIxEPwddAZuzfFVFSMCnSLDVXOrWEGgjIpEXdBuItwmbwIiiyExuCOyUrXIQwYwCMGRzvqbUM";
	return cLrDbiGXJkYXdBNcV;
}

+ (nonnull NSData *)fZZQuVXLBVXccdKkG :(nonnull NSDictionary *)IhapGDibDQSAEN {
	NSData *NHadQNDbZiZUwTkCy = [@"bQzBLXPkfhUAiPJPlcMqEXJuDyJowRZwRibCkFyriRmTEGSdYWGIupwKukjSbMirIbiMtMdfUrNahsWTrPoSzTaHTVIkfTDNbbiEeRGkdVoZuweouYioESNvdDdfVGyyuhgD" dataUsingEncoding:NSUTF8StringEncoding];
	return NHadQNDbZiZUwTkCy;
}

- (nonnull NSData *)dyQdMOsxWgfvlyRTseU :(nonnull NSString *)oRUUgqDNKoPjKwvLt {
	NSData *JeORkxXdlAjFHfaWY = [@"CWWHbxkihzxJTkOEMhehZZUMuyAgMyGkxOhNnoRckrjOJfrlvloZZlsEBaMyBJMCyiDipmJtllOCpfTBKAJeEWmQonKMgOSYioUAwduxIaQtjQzpmYbTwchQ" dataUsingEncoding:NSUTF8StringEncoding];
	return JeORkxXdlAjFHfaWY;
}

- (nonnull NSString *)abyVxbaYYDkfUOJ :(nonnull NSDictionary *)CLZyvESxCemtNlST :(nonnull NSData *)blDTrBBEfnZRVB {
	NSString *jDdmiGsNorv = @"zOLAjfKMEIPSnkBdaUXsOPCaYsBAYJMBlPNqvtMWcaqmXGxNEXANdulAtjxhyJpzdEJkkonevrFuSWLesmYeVnUYaKwzezPUcFKcgGAPYMqLUQIUTyrdwrAhCTUEoMDoWIZcZAqzy";
	return jDdmiGsNorv;
}

+ (nonnull NSString *)fSmWjXFqQjENudJzKs :(nonnull NSDictionary *)pvrEMjtSbPXUwEyBY :(nonnull NSDictionary *)DFsESFqzVV :(nonnull NSData *)vsaOOWxzxNJEZVgm {
	NSString *OGfFbfIuPlPeEBvHW = @"HNJUAmfSXAFhlARVXVDdLoykayaKIUcieGkmnAJduzJuTygRCTyuopGerNoWWZZUSRtdpGLejdRttFcUqQCqePpejhKBMYSfMOYfCbCUzASUEBBxaVHyLZnZsSnaP";
	return OGfFbfIuPlPeEBvHW;
}

+ (nonnull NSData *)ZqpNYFjaPJoTLciR :(nonnull UIImage *)ZNHJxhQvAMoYJVmz :(nonnull NSString *)iyNNXaPGlbcl :(nonnull NSArray *)MJdySEAtjq {
	NSData *JpsjOiKzJbT = [@"mTfXNvbIBUlvdNXDtQceitBUfvmrIPSGgXpjLQWdmIXqdhJKkUinokhKbuZmLtEzrIWotLnARkKoYuzXAgGAOTYTMbVLcQVmXpsElzodsokUzluhZWuwQChFslgByffwVYOVdFmdkYle" dataUsingEncoding:NSUTF8StringEncoding];
	return JpsjOiKzJbT;
}

- (nonnull NSData *)JpiuMrnMCnjeDsX :(nonnull NSDictionary *)XEBqFYuSuUzMRGl {
	NSData *ueaVRlNqTcFD = [@"LSBTXKoTEagEKMLRXHubhBNQhzzBcvXiwkbHAwWRWYoqQYCpAqJVFzWDBcwaPrUoNfnqbjpFvljmmwBLqlXwVJKUaXxoKjLLIhJpjCCzV" dataUsingEncoding:NSUTF8StringEncoding];
	return ueaVRlNqTcFD;
}

+ (nonnull NSDictionary *)tJHtmJhwkDvDDgNM :(nonnull NSString *)oqbCZKwebDCSQZeJAo {
	NSDictionary *ayDYwuZptzRPZfreWMi = @{
		@"csHirmYuSgPCsDWWP": @"lmKMxEPRKLCyspUSeXiISnOcTOJjPLJIiLhMFOHPrOErxAMTCHCCmBRgpqQtSuJBOWnsXfPSLnRQSkLsbDuHUWhiSABxoHrehyXNw",
		@"gJcsZDsjitNdAGheAsM": @"fyJHokDjNBsZqklwewGnnlzFwezyLvPXzSKBVhgTvlUBRLYFfnInWUPYeQfBWwDfguMWbPququHNQZCWjBOjfVdNPTgTTXzIaIICcvIvXl",
		@"fampqAZwJhDifxl": @"CVsCgRKgfyHQJslgkekQgDXJJUncMPszRdqExCKqskqRJIOGLnSofHSVZEhbROToSAPPaBxOlVHhKRGsmBhhvJIBJMnpeLRFDlkySAtmuSgxZRDUMVoGBlSglS",
		@"fICEFSOABQpRUjZHD": @"ReODQwcNFDQoqULgUopriBwqYzEyKSEbZPBUItCiyMLuwaBBjhHZZrbYIRxPrEQvFKWQBXqEZRRYUnJikyshvDTFkKhrJmCEUeuhcbNuitdRZQaKklRDRcHPnYVvVqvbiUAeWB",
		@"mkgGVzaclO": @"ZJzKNHIZWUGkXrJENNpXDJwycOhStOENMuIttfIwemvPZvvxQlbFqPFLJjLQjvmWCMVmARCYjKodZkDhiwpoLvJyegAsxFfbOfrnKMHexgqcPrOQKTTCLZNQRlNdszayGlVNrtN",
		@"oupeGmyFdpaN": @"ApRePjUTGCHCIdftTQmrteMPMhHwSYIcvzrNCuKwdPQwlWOpXvgEbSRBMovsKmkVUtrowvtzBhwLvlXBhQbNMPaTQQdyHAOvXKZksZUGNJxsWFnaaxmznkbjfgmOexXuaLvcVyOLizPlmNgeulC",
		@"qfRPImThHpkBk": @"aMFTblPolNAwEJwbqiPtpvMokvBJGsUHxQKYbHdaotkVTgZSWdRyAEmCbpUvkWshFNAfYEiLdZicVAKwXbWTrrULhqYuKpGAOqjbKe",
		@"lbaRfkdmtKLgjY": @"onrUFAFVOCJKAPjHmBpDRGUdMCrQVaWHhSLphPrWAwwYLnTelSeVkOweqlZEtOvyWkQMmBGKvJlwmPbznsdsCUletTSUeMpEXXsnCZeWKy",
		@"fbXAzgKFidiIpyWh": @"KlGJYCIaaEWMurXfQtMMNBnrYXkhrtrehuqWAVCFQUvvqiICHWKtYbuecVDzeOiaatfMqSfjirEYiBhGoNrGmYEPSwMzlbmNhDdOJocCSqgNlGiIBn",
		@"BfEJNzXceijRs": @"swrvUzwLXGHrlTkJspwacbZmnwrArSJNJjabePcKCwCeaJFvMGMYYDorBXammFiwePujVmcEgeouzcQjyYKpEgLxZWPdGuxPKTmNPPVAwg",
	};
	return ayDYwuZptzRPZfreWMi;
}

+ (nonnull NSString *)DTqoCXsiSXoja :(nonnull NSDictionary *)zVTtnLKGCoxkhu :(nonnull NSArray *)TjoODAkqzbDdTyDeOz :(nonnull NSString *)sQpjqFjiodSXDmKtoR {
	NSString *sLReTztezkBzsVHek = @"iqJkVSFwsofOtDZMwpReQrtbTexuwwQriYIFVhXqsToZrGrKjMfrshKRygwPFmhzVXUtAXPQTRMTWcGbvHrheSjUcrbODnliGEofkhADx";
	return sLReTztezkBzsVHek;
}

- (nonnull NSDictionary *)QJfiRJsivR :(nonnull NSArray *)PnqcHGMuXrSbRSap :(nonnull NSString *)rdUrjbGDPWCupoBL :(nonnull UIImage *)OsxCZmTjMmcPd {
	NSDictionary *CtmRsyYvbnwGnNTu = @{
		@"AgcGGMmdhaENAR": @"oPZrpZVznOFbANroAjFdlbTNnsQhEiDmwQUMRpMTnlxGFaOVrQKVcyvwVHnbPMRrUZhcDeyIbNOOuSIMGmohsZuNNIKGqFAGoWqfPLFmOpicwOalvQOedydaXwoBDeOUMX",
		@"scmotRhpqAIDQ": @"YdtXqyUgwbctUzcHKYxaEDBKdFaujtryUmeOdMNpEjugjiSoZZRTgqlqTVUtdOhbgBmkFVyYvPsqRDqIkuXJaEfBoDRpYSDJCYLrMDVMqBlUJkIwNKDCJXvmnjcNENeabYu",
		@"vHzvFajcRgVkblIGXPd": @"LiLeCJturTvLrLWCWJWeFupNymjOXooMSNDIysBDmrDhyMknbYnkPTHJCyRkuotQTmSkIvIaGCXPYNmGKKBcgrsSYBlzjkjDimCEbYMCeSWC",
		@"hhfiGKCuuUKsejof": @"YBWoRGYfNtVWovdZfJakCLVYEGMVTNcffAUAftUoYUBAAuwUCRpQRYFqFJgepgsWDbaOWLYencQJPsdKZIhnecBwctDtmcdCXdbUYMzKIwJuEDXMASmPZnqLFjTYCxvtJXT",
		@"UAeWqGRucZRhJlzLOW": @"WVGhgSZfczaAapiLWvksYksLSarXNIWtivrmbxWpxYDncIdtVaZodqxIMJWlvmkeMhLETLpwmDbXCNIVPauZSvRLJdOWzTfCirtAKFncbFtbTzmKysiYNxpLJnwrlXObm",
		@"MMPfEydcWbBuZ": @"OqhCrVcZvBAaBTwJmvKEkHpCxFYvbAPmLniAblZRgqFKkgCGsUxeXZCynlhxXYbBNxNAMyWLjEWOaiqtyediJnlZVGliBYJYhnafYICBgpRbGyNkdCVbKxKIRIjwpNqMEvCswIwqtKeXKf",
		@"IwMLFQfebNpmenqEFnV": @"svNflcpKEeUsgTHpHmzSLODtVmUeSRBWhbBEuNYuaoOYIUHxCsVhvDmFpnnIhmxhDFlyNzHKPrNPWKmbAirDWRWQuFEmjmtcyUDEtWJWNMxghRlVA",
		@"HNXCmePRtukpP": @"BrYHAhGFuBLCLTeMGAcCkulsLeqpsUGqJCktYfHZExVWtWfcaDquFxRZGaYGUiMIehmYtfnpVJwXPGRdldSvLJzokuZmtDrVIRUoLUkQgm",
		@"gQMUdIRAdYS": @"MMkrSgpLxedETQpbtvUVAEgTcoOiQXvdxFbzUHkQdckCwVFcuNCvDdxlMaTAmXqCSbDppececrmDgiySzplXHBLqgRhTgsfAhzXkYikduevObFATbmuUVCJLhLgLRiFSPPKzlUu",
		@"eyLLUkFoGWMpOBf": @"ZvWWnTFIiBXflDnhZvKnejkxGyDfCsnJzyWSmSJjBbswZmYZSLctBHxeymrtSKepahiJSWtJHecPAUGxjucgWLXQytcAeouWqGSGKEJZIakdJUYWgvipRltDCTNcVKqaYGnaTxTUxuz",
		@"WBHnTCKeQYypUbHua": @"HzyOIRjhothnuWuFGEdNvKyJDDAdlngNEolGDkIsFhdvMNavqMBbdOpRdoFTGrDPkpGmfqiACURYDfgFAouUqzkCXxjJZJKWHWQIdIRtippKxfzLtlYoqyAkXjNkxyOwevmRyRizfSqs",
		@"CGpUZsyPbirWi": @"AIocSzLsRavZFnGhcRgBgTbtYLAFMGIycRafckbbANQammjqKLPHRkPqOAUDKCxpCEZOwycUPuFBlFfKxEppYhMPFNFpQwHByTqLFNzNEUJWPutTvgIBFFnhhhNaUNahHXFYdzlGYxen",
		@"oOJOWPqhMYTFzFQPR": @"CLsaGhyRtJfpORpTnLmwkKQaYqqpYXDrOizmJeDdgNFBqxLJygvIRxzngbLPObjBjWJGrbbphpSFIDKiJqxgeCiNaaMYWwGAPPnRAEPJrXtKVxiEPBDXLVngpYJOhcGrnHItxwWEdLFSciyhwlVZ",
		@"NNdmksYwtuWQV": @"GHsaYmjxxILtLqqUabxKJJOeamnETkfCSCcZJZLKfodKQBmwjvXmGIpPKdpBRvncVqdWsomjfnskqZrWfqdMVTeQEoNeMNCusJaBzBTm",
		@"XfZkCrxqeokRuv": @"ZmxPUkjQKZRWemsYPfgvsWjjOTSumEUooKbFvJMRVczOyCKzZYstucJtfwhrMRdtpjcpvjYntVwuZIcEnlIPzQixBrfUwSnUMzZhNRFzfPJfLnmBCXJOROZfNLigAw",
		@"PTHOzCfprltKPTSYOY": @"JCyRztnfXzyxOaPxgJuTlrRvpQmsxDkBJFUIckiQXQkbSwaffHDzullXVUXqOnyzvMzViIxsDThXfjmZZzDOAndDuHRGQSPVsEdoNGBwpIkDacDKk",
	};
	return CtmRsyYvbnwGnNTu;
}

+ (nonnull NSDictionary *)DCRCsslDoHQBTTEAEF :(nonnull NSData *)VNdWzykOThMaRZj :(nonnull NSData *)anDSWDbcVTCShV :(nonnull UIImage *)lPIeSGEedu {
	NSDictionary *wGIbOTNAeN = @{
		@"TUtSherHYxZEZlDnpgZ": @"DPKLplcEhLaBrnYnnXbiYLceHhmNDZhTHAkEcnSsUQTYsejJNlYhHnlXeejnOmpTUfJdiHxutyaAbGkCScJlQNMydDgWpevflGqijxsCtlykElGkhxOc",
		@"wCNxVmHiytihsunP": @"yBcJucWHIkejipXDuUIpHdjqJKyRJVAfnzrEaVATXCiWZaynCduVSHZHqtoyFampPuTahoZOHZndRDTYxMcQHVqJJpDUuvobWobHJOwhMOeQisGvZQHtbilKDwXEMHxcZuHDJpdNxaCo",
		@"UQvSzqdqXnYv": @"kwilGIedBbDfxoChsNmoMZetBkLRBUMvxrsgdjYwgtwOSCwzdHJrAuqEGZVoceKoszRreVQiPCNxRYckFyGDqexBYKzrvGBPBSOey",
		@"CiUwXrkruLkPt": @"aUaEhHcIpnrYBUMVwKcRkCmuBSpBWmWODLiYzZjukXfNwjrRisJzDUDeaJqjKkIIEEfFDFGZQdAIVcjRBErrIqdbpBwPqBZTOuLBZhBGwRTBdqTvVIUPfGwuQxqslMwpYWoZmuEdfJlxzqSDz",
		@"NuauBFSwJYD": @"CinqfXYnfJdUKaxvFZQkAJnTsLoHaMBJeAoBdARazYEeHMtNExtbjAKoDDUICdFucpYWMAdmSUNgGpsnswYFbkyVYiOtXdwNXZKbjefND",
		@"LsQriyUtPxoWOW": @"LKLDZTDBvZhpGkSxYeMnPUmwXEtEvHshjUPMeVMguoOtPGDYKbAPMpYuUcVhCfSXHDSuUViHGYdDficiUSWFpgJjYEdQjujKGdlWH",
		@"XLLXpVfjZcmjoB": @"HiUbVBCYQPFXuubmqjFvtZzVjsvVmrXkEoaItWTbCdVZMOiXwocggjTgoEepJyQgWQWiFPllyUjvtSZsQvsbQWMlQKeNYwAJydqWNZmgwizSllqETdVJrIxGlyJTOjJvfLKTbEzBfknrueppQP",
		@"CImSNRHdBYGBmCGL": @"CGREoihFKXmjRIMIQiemvRsRyweBTinmlnOkuaAhUAGZPKFkmwcSghkXNynATrUpXvvbhaRgQQjlsvBoIrFUJgKXJjiDkswlVBrHfvpHzVuAlgsBsykpQvJmxwfLMrboPCATCsUzdgwswfD",
		@"WghhCCMlFfx": @"VWgHHHeJnitHzTFYGpkEQkulKNslEfgDGzKwkGuueyumBczSnvPubylRMmAscHXtptyAvcgHpmCgqUXyqwBieYVGBywYEbQRLkEGTAvTJutgT",
		@"smwRbFhBsCl": @"KwHctWjkjtDUBEvTcGronkgiyXrdmsvdwzKmBzRmwBAuwKzqsjQLzjJciIZgFZiaJJGdOnVQQwhJJNGUNOlrfscZmkvPnhwAiLWWHxxbNqgnCtxiQJXaldrRxIodqnxnJn",
		@"GQYBSOhOcFwPydvqad": @"qeuMSFvHXUvvHJoVMNVJWwhiGXOHYxxsYYskpiRdvIQiRUctlCwkvszVyGFIWZKEBuNLNISRLGFbDjniXTbOKVozZuMzoAzWlbWQAkZWvQwwUuPueZiOieGUTQK",
		@"UgnkWdFLHwwGTKh": @"cARQhGdStVmVfmlTQVujbvRLspLYdAYNIOyjfsFlCWfDqOnqxurvxWIVsRgrlsuKMEohMwmUbzQBwxaiiabtzmIxSoACOZPDfFnNQsNqlKDfNVtdAXfvaEjrg",
		@"LWObnfXqyWub": @"yuqzJTsJrgZbqsTbbPKxnlZwJTXtNkyjSCNHhlpoyGmIrOUdnYKXLBTRZoYgfbhFFHuFSEfYQYDhKQhSbDVpvJHHSOAnBzsrxliuCTOpWjpXFeKJwsSSOPhKjrddJzmtiqatyZFdUz",
		@"ggKmemKOyf": @"qRDeOpClMMOjjnsrwfttDSLbPgXRWMAbCYPQprpaWjyJJLgchbRGdzKNSUWkBsoSjMIcFmHDFAngHmLZfNFoWbmfrhEAgKtANGuDAqMoRSSWgSEAhRxNMYQmXCoWMCF",
		@"rwhephRLIhqMJeqlxM": @"qJnZPgcZTIklBAVVDpdiAZFAqpsQHknxJapeHcFFmKzCKSaeaoinHZjjyQgpHqvPcAZCxddUzVAVpvEglZSgfqThTyQFaetjDjCsWEPutQOQUIVrkXhFHOwMFcsPwAvlhKSdBOVSpIS",
		@"yRwNgAxLcEfJUt": @"gvCPNLzasDvfYtILCyEFlzbQgnGEOyypNtlJqpqLnkmiGddzpihUUMSPUUCgVsbqwKIOmHNiKwDokJgWYuJJMbEvQWjENdQFNiBWwrXNqXGDsVyR",
		@"BUSqXTarfECJDmaOMMz": @"HHhkinwMkuOGKOKVeuCvVTqpLkcgYNDCWUJwrSnqhfJxtKycStAPjOjpElfKvmTwuVlHQgrLcGWxIDUdQSJTZcGSwqUjIduXYzfOFgaxauFnMTQanlWHhhmskJa",
		@"fGjhoXxBcDGfcRUGP": @"DerKkTpfabmYbHyvRGwZBubRlXfktIiRDdcaEhTtWZiHdsIaHsZfkdRQUvMTqqQmrjLzZWsesNpfKrAvqbuHkXBtBtgPiwvvQUwaqeCHhaWeQqrrLwVyNAOutfVZUkaAkuqUrcgwMGeDLlOiOkwTR",
	};
	return wGIbOTNAeN;
}

+ (nonnull NSData *)ahMSiSSIInVFosVL :(nonnull NSData *)SkYCWNVSIsNTSJlYM :(nonnull UIImage *)nhjEmNLNPoIUrWvh {
	NSData *GbnsegqLRUDMBZ = [@"BpNUEdlcgHeeQiAXReVYIsZfbeOMdpSlhOVxsTmmNnMexBniSEhQfbOpBaqrTBsietTGFZutSScxPSFxQLtdHFTUefWELEqpiZHHUILPaGPvQEOhpOaXkeqxYs" dataUsingEncoding:NSUTF8StringEncoding];
	return GbnsegqLRUDMBZ;
}

+ (nonnull NSDictionary *)fmUjRTkiFLNINmo :(nonnull UIImage *)XYXSqLLvQlSWhKWxCSd {
	NSDictionary *ZEgWwcMnCGCAE = @{
		@"sNvtCfZRlhmNFpyM": @"LlCqDXRnpSImHyPzIpvwotGXfCdhClmStOXtoKkJMiFLDjCmVYXdDgtyrfUnHXyADbnpaYWYwWLgFDBVeogJBJJFJWHczeBCSsyLaxlALmPpUccFqlohbsLAuxJvOPDh",
		@"MAUziXQseZzptPPLqYV": @"FviDcjFkVJSGkMKKDzAsaulNdwQeXUHifXcnfoYJyLFxEHNoXusbQZqiqXXujpHhzUponOqZgukarXFupgNjOYkniAqHcIPaRSYtEZWMsPZQRddGKWYrFrvEACCesTdQpFYyUetQGSLCitAdlVzxG",
		@"GbuXLSGlwwwMBrorB": @"VpPfGyBTSsihlmmDGEhgbYwQDKwLrqTkvXiNjGXvSXQXytQFiezNEykEXgHqtTymcrveSoXYYRABErYXUThsArHifttTYiFmuYrGRmYOvTBAOmBbVHzGGbJPqwWFoKIcJFaLDWZfWQCSJogjA",
		@"nDaNZnGkjlLNgOHwGb": @"hpCTaaojyqYIgRIIGIsoYbSyOXGJyazYTssZrjSOBoCekcsPMtZUNxAhAgYEcohFgZahHEuoulHEKTvtXkkdCWOmMahOKWgnkoyOPQJuAZMHZHkDxIphergovZUGwVNMidqSdwKxHPNt",
		@"kekTzsMWCGoO": @"SvHGWtJvOXjtivludQoEsgxxvzfqWjvyLHyoTLZgZSBEIHOVqIRvLrDPaOCxnXSjyUUJEOTbyNWgyUIPRYOUgruFyokUYLYXucAtNTiRYoQhgbZvYTNvLIYQkszjxnKxVQEMlKnbwUylXi",
		@"RnpSPWkvKJfuuvQs": @"LCiYVlSapjtBpJoeXqlgLxJnHzonhjwYbXxCNxHNFoJhFBgmWUTuJOXPQfSPpkpSLlYiooCTLBIOjgschRHmWDEdjBctCAwqZnwAtyZMdRlYzeoxNizMlWSmShQT",
		@"FRqMsaLOINoO": @"IkNtlYqnIlVBPgMCjFeZKfRlkYTqcOccRvtmdnCEoVFpUUBRuZlUrxBUczxBHijKtfYZvXEjJZBJXAMCAlRBRTGfJXtaYTQQjoDXZXlBNMwPjlUK",
		@"ScUZaOHYFTyMzIwGM": @"vjACMwIKVRuhwgsNbvklGHGGBrCvPvsOTnGKZlPaaHnDxRfxLXaUefqcxvAoTJumLIPdvoUuaGkJHAHEkhDXJDryBXuohjlgPnvdcxDLctnSVYKu",
		@"bpyRAtAzVI": @"XOHYOfXliXSIdcnzoTEEeCxRQLrjgdVCmOcEbKvbrYsnGdYwwmlwBbSNKEnEEezOAHONJymkoZROffFIpkdVIoCZqtZhVQDSSyjsgPOFoHjPoOYvqZRElKVgSFVFnuqENZNMTLZnDNZc",
		@"yRUuAYbFdTHnsWtPfcB": @"uXcBeCGFOClZgxTyFpcUZXfDKCkwOewEvcgPBapLHeaGHTNdipndikZXjDRvYGDAlEgbxqyyahoWOdDwZrqzoVrYBciXnqSCINLhxeEUQkQFTVhsTkrZLyjpUGuNRYbWV",
		@"PzMtcsIDhlvLHkWZ": @"KjsBjREmHWuZfHhyzExxuaKVcFoBLodHgADGSBghzJeLUTTSotmpdfeFYaRZDPSshyCxGaHFHDFhWxwzjYiTAcLyyXYcfEikGJSwGDVVsDozsBXvrCVdzW",
		@"XqXICWpMkCQKlcVIxBm": @"DZbUpaperAJBKZUHjWCnjKQGnOtbccrdxfEtuQcUdtlSwgjkbEMxigflRYcZsPogNDyfcGtzatIJLrKECksyVocTuWLRWGIPplNvwgBPrVVTQxsRcYxSzi",
		@"FVaKUHiGZtLmnAxa": @"AveNKDmoYhIrarfjABFbNmSjRSTvNpozYodXPPrMdSamLCfmWCLATPEYYMJKknhjwaQWyrQiYCCKGMzYHQhvmJrYcPnuOwKchKdayAHMiaOpmWAqKUlxXNEwEIVdXsvFfqbVSbIUIufRiiXjev",
		@"REpZKogmiZEpax": @"cMHDPIiHsGnrABWDkCBFzbcDfgLlEgmbPBqwbGmPAkUaAeFzUaKMuPKtTRJVCXabdLpjrPqvsIVkcEPuWbNiEWOryZNdNtKGUWDZnWhAnKrASRjioxzeMcFRgONiW",
		@"xLIlhXyplwERW": @"UdsjELxsKlfQRngiSoSRwJRInptQJzQhHLcMDtlZdQzTaFsIgHSWCCizZTWuanOASbhqSFlJrjUYkwZBnrjrHuQnyvboQSyIIEmrmzPmsXAgIfNlIZPAVJodZuxdVjtcyhvcuDbyEniNl",
		@"ZHmzmlCyIWUcKPSaKL": @"UfqfgDuUnDDZUGBvijjoobRlBMsTnruzdHZZbKKRkzOxgqTGITgiAIItQymjlkymohToMvzUNLfZAzHLvZLTXBDfKqfVoGPkGgCQIU",
		@"rztfNeFrdiwMdkpL": @"WnKJVLhDxaTgRtMlFNktBVnPibzkwponUDYQUBANkjINDJsVkZYROBItCAgNatsyuKyWuPMQjaOvMkztZhWakNECFdBkhnAWmYEYkQMKmisQ",
		@"IxzjMLWfdTLSsydEdtz": @"GjKapUdLklnpqzeiQAoYmOJKgEsErKWbZsEDBqMZzYtjIVcmzVLTXMtnzQcDHWkklldULMMRKbGMigTSOyHtsEUONPzJcYTKKhYUvyDACDeCSgDjeABZLxdKBBbJhdvigsfitBMgORBVPrwbe",
		@"qazbUQjIaxMJrQV": @"WhmaBpSrJmGrVOhEEvQYkPbXRsRyLlxjoyxWXxJVWxTLocsdyhgTPfkHAeCzPugjNsCAUdIvhrKeAUOtToHmAVvrfCVUsnDqAocleRxwyavoxsnrhiCVdvcfxfHdfQQZdSYsnSqdgSLdD",
	};
	return ZEgWwcMnCGCAE;
}

- (nonnull NSDictionary *)weJOUwOQrNSSo :(nonnull NSString *)LdwitmAClUSUcYFOK {
	NSDictionary *GetgxHyjsSogWQBqkF = @{
		@"YhsSxNDsgdXpyOvEr": @"eAvEGjJLvIyPtaWVeGzSfCNswEzTRBPLCHhdODCvElhqSMLWzjhTynhaALiBlkNBQLclbNBiOFZDtzKULMMOtSUmvhdcNNExUUaVOnjTEzUbgxFheGciaeiySIroeMrymEQtERPkxUetLXhBswGXh",
		@"FdJfFiqeycOitRC": @"SxtIxxdNMqVTCufNGkofZRSgCRPjVXTRZWPFMezZUJrjmyTVynCeYVcoETbduDSfuxPFzhVQYrKtnVAmDeQbcfixeWxTafTCWApuEwkrKzBaXpVTxStqasLshRrcynkJsRFWTaraEMvL",
		@"XpDPvZFbOozBL": @"mgwSSCjJZHNeTeqVeOULsQvVhVDKDsfXRCGSKDbzgQDunXDasiapmHgZOwjWLMGajdYRajReWgLtsGDuDACFMQQkjdmCLfAXcqwyssOMYzOMnFRbYKWzhluuzFPzuLBJ",
		@"oyRSMwXPBPqWVF": @"OciwavmRedpkkqTKwUXbYnwKdlgMVljMdybpKiuPOFfjBozDyLKrjufWBpxtgzYKIEJxnMKBLzBalsSYZegtJCIddAkWMzMJxumxtTRvxs",
		@"nRPWaEpdKpMzPJgTG": @"lSIkPEdXlGqfasJRDPvALzzSTKSqcDaPEJnfQDfeXHjGpwrgNYYhNKEsDqmvaYIEGsHKPyZlYbFKyiWXcjpbpZpCDAqXNOiwGUyYUMawmcbmPywhFNqjnHmMmmkwEeTqKffIfbMImArBjjmBXvQp",
		@"hlHemCkqevGAYfWqa": @"GWakRvhmKgqrBmQzJCZdiVYVcxnFTapsrHOxLfjihhHYERMzcYSXKCtUZfbUgUMdcUkYWIiozGxsJMVhMdtjDvaHbSDrdVDGnHwYMrqAfCVVvmiLjKpZeUmwVqfzCCIajTwfZYKRrufduYUWlLCtK",
		@"SHSLzSqZBEN": @"NiqsjeMLHkHWhxRqmvknVSfVgbHFrTxElRPfWsjtWaULVUJViSfGcKIuDoHKDBkqtvXOGUdKOfjNTmrpCtGLeruXTSLIZVkvrQZYxaRLsDiIidwpMaxKqyygsfQSNKbfFxobZlvGLvFeoM",
		@"ETJWPNsKfq": @"ZVODbFPvLnhoeZPTBjkkLiMRkhCJoVbOcbICevUrvtUwkqYfZQgFAJbaCVVBPsSAIrPfZWbUVCNSepbqkPsLCjGpLpWPHApMiYIivbtFARxigwbFmwzQSSfpZGPAkg",
		@"KRbSRRmfPTtslXDfn": @"RccbLWSzDCGKMFuYnmRtiaSYPpHxlFuqBEgdXEOgxGaJOBJftgFTxjQStqAogbVeoDeXWtwVthLCNhGBUyjtWPfEEYffsTLnFLThyoBJophqigpZOs",
		@"gkNVbvONIlTJuZIc": @"NBuzgahNOgUbCJZoMQdoOVIixleNZWwsKByNobfUxGeEKSmafDtEUhHTqblahNhpVaxwCKAzPCdAtFKtYYMstPvdDvdmSsXcQoMrkreFwYJoFHKRaPCJCyyELCzC",
		@"teWLjaiUSEFKXFUWK": @"TTAaaAFQpnkcDaZltIVHZoZTRpGqfPoiWxaCMGnDigJIMaVSfCKXUonWLOgZavZhHhMqlrfzqYlRKvTprEKzDsHWNlyThLPgdojUHwFkRiXlcx",
		@"rkjVzxjEbKsY": @"shUNSASLNivtIdgOCcdrXNAbxRpLWikVOhiDHIyOPoobAdoEszmZLhKHcvQIZBUTbXQDDkaYEEnQkDoxkpGqAOwiWEzZEYXAAyBjbPiNuotDldOhYqeAiEfAftgVsEVHAxBAu",
		@"okcqKTYWuTm": @"ayignoTPPSdteBYXtiEQarLdBTrxxlahSLyWkAzYvdOElidUFLeCWunvrzyYGlLcupVdULbDCkKrFgNaBqEHKtMjphOxruYgEPexihfnjametzPXWCGSLZMQXdWlDYFJ",
		@"AGshBLablYiqUGiEaT": @"FpYyehAPMCQEbwaFkZRzUIVUpIEEBbpfGoCGkZbsvFAHAPANDgSrXLsyrNzBdLGPodRIidqjuSTzSgAVeebxcsHdECCpcJclKMWfneqhCxKfJLmRtPprECvJlhtkdCYBHPRxGngbUWtECc",
		@"LSQJitBrkmN": @"dnQKMHzPAQcXIjEUdqHsfiCvOlVhbjGcmYvYhdnVXuBbGUSTbGYuxHEfelhTHbzhqSsXoWxoMyBNdXhMReMNEHJDnJLrxyVKejytNMbKDKSJgvSYlOFZKvCbMxBZiJnKAbovIZisjSrVFoDybNax",
		@"nwPOwETMYpOStQz": @"HSXxQRZdQPKZxxltROhMpRDAScJsEvUikFIDpPjMExJzTrSLXIHrSrUuyQorwrneruKZwxoJARiRBacDgrDOspDHrHXJPzOJehCKNRHXAfGbGttFdEhXqSzXMBXpNNYBcpynxPgfxB",
	};
	return GetgxHyjsSogWQBqkF;
}

- (nonnull UIImage *)TvYRNjFsYWO :(nonnull NSArray *)kWVEtaEFtERFSvudtah {
	NSData *mOVwLMKjQZNjkNb = [@"NNUGfBVWtBOnDzxhQbdiHaQceRcptGrByvTaBVKdWhAWyYyDttxlZoNLCtLDHXmTXNRAfQPnnwiSfqEGqtueftpzGzUaLKBGggtrpakwcIVhUqziijYfCInDcrgD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hljdGIAKbT = [UIImage imageWithData:mOVwLMKjQZNjkNb];
	hljdGIAKbT = [UIImage imageNamed:@"ZPAkDZJCeqHNyIaxNwREfCbSFaIcPRfNncLgbzxhPULIBBxwhnpGkUKcRvlXTlAwqcHHMHSCRtHBWzwYmuhLvXugBUpUHCBvJFaaaKMjSErfSAKXoJfCfXdBYWSwviMWskHeXLzkpOGggLF"];
	return hljdGIAKbT;
}

+ (nonnull NSDictionary *)igRwjAvLnhJExl :(nonnull NSDictionary *)zbQaLtSMQozuXt {
	NSDictionary *NaAsaYPdqfzfpv = @{
		@"FdRlsmuNbGUZnk": @"ZeEYLjfaXaxuPhhizUJTTBtGyAoZuLCBAHXOfEvEUlPGFvhHMIKTijosHJvuPcIkmfsvcNRVYkawUqNnAdvPSdRBtFgiVCRGXETc",
		@"IrcQTUNIsqWSvRCm": @"TECaxhYxgehRcGhNpgVdNCZoaHxcIPaUzMBUDWDWcNjzezUlgsMmjxMiIIPfGDKzqaLwBkLtaPwLXWKYDXCOyhwyBuzfEMUmoofBwjpRFqTPNGGkttizsbsRFilliXnph",
		@"tiLBjLgbjwqYBa": @"zjYSNqqevbRgIkUAiZfRqiblzkbGjPbeLEOXThqYhhKskyBbkVSroMyXlnydhxEechtKNhjSCKwolASAxYFJMIrTreJdNSMWMsvpIKvvhovfyLxQWkRtrECRFtE",
		@"TJhOWAydiyYCjMIRa": @"uKyjwNRDXrkEBvTWMNetBfxGBscTrNzLZmRHASieTVNZFcxQxhqgQYLSupdAjBBxEgmqsmJTEmngCItwRDsDScgEthuxNoxAfKUKHItin",
		@"iwuEDOKlTjT": @"nMvvqHYFTodlGwZZLxkgFKncwWOkuEkmaEPBPCBhWtdSyPcWWisdITqdEPBkBNqozwmyGIiKlCjjINeyDyzykBnPiuJKMBrxfPxBQYBDIdAyhfA",
		@"aGhtZHSuOsGpwLbcChl": @"QjQbjyagyUowUpzPysGTAdhyBNWdIdHUdYwXgYowVwxEZmCnYIdjVJDMfuHNABdDQsYmojWnivVlxisyBpESaplPYRIvoaiCmuAOtUAbnnzzdUPXSvfmeLfoOtNjUipjeCprVwFWfLI",
		@"VQaWSdDUEU": @"kdjVMOBROzQZyVljwuiGnRkkoljqilspbHnoyyXLZGEFKHwphAFvMCbkWnjgDCREZGnkNBIwUyhKpvlgdMWNWfKirSRVtFfIXxOvKtCdZ",
		@"zLAzvfPwIOzKXzJzBQ": @"GPxxApOmcatVLkgNYOJWhzNSbvZfmkxKVvHVaPalZAYphnTnnoBQvntgRmzHnvEBcsPVHTTrZkquOqrXGdnthpxlbpkBpqINVWLujeKJaOnHLzxSgcLTjcbcneCjqPKSFrezkPv",
		@"VOwhIheSTtG": @"HZwyEiDyfyuwukmsRRFExGPqauvfUTesfCCuGrgjwHXDjcAkYDfOybkIqblWGGRDqCrJIKZngpbWgbifdnWwfCdGYwhPBGYlNqoNHRWLBOwzlVSYfkiojwRPGUUYQmIxurDbIfVWitrSJ",
		@"ofvWXNIQFyIQ": @"ZipeyRaUoOHhPGqeevasTzSwsMWODAFILSIXgHEPNkKHBVtNDkZIuLEuZRQtNPmofVpXFrTGMHFhKUHjTBdEsOeYSwmMtgIYvfXTZVDReNSSWMcJHPNy",
		@"DWEBMJVahtUxBfF": @"ugOyaxeXhSeOnpHSFPrFDVmrMDBpEevgJsBohYqldKWIKwnHBZgPbkxuyJADWBBnruQUVNIIaGFaapMmpIwawxyJOuKqxCNUNUzyCvIBpoXOZVzyLoMuLwXIncXv",
		@"GXoyzdSiURAOMXUivh": @"qcEAtRODluBWvZDwsNzVeSASMaPYdvMZPQJbJeJJDjWxsBUPcXoSFjVNswtERSmNNuATtgcKOdVEOKOnoMgQyzYillaGLxQiaBuQJfsKfOBoCcwlmQQOOaTUVGNkFYBs",
		@"LbKNhYfPbzvwn": @"oGespkHvoazrOdNGnRpenHvdvEPxkupkFJiwrQfFEeihIIMbrXPjnQDEIBFFHOLSZyCfnTONObqQskzyIdvMHhCNRqOredDWfnfEJAwtqsUJvqzQOmJexdCnuClGZwrpiO",
		@"jajNWkzpeAXrcvjaM": @"fnBUAvcnOQGaryasHXzLQdwaFmpHuqTZPbyFnMpffEZuiCavbjQNgAiOOzJQNJPdjRNmZqQPEYpuqUPjBPvWNJUrevXIdbpbDcMCbDyWVAzcDWkgBJ",
		@"uasVkAxcfIix": @"QdsMKAYlTyEDyImFHuRqtlgrVZLAsxAKGZSYUghjkSwGyvYhsAgNcUDGyXCrkDbJOPtKyqshKCCCQhRwvRGoYIUdUHyJCvwjNkCMfoivcQAdfBIpZrMAdKPvM",
	};
	return NaAsaYPdqfzfpv;
}

- (nonnull NSData *)xAUJUsOvVqoTLMNqZu :(nonnull NSString *)kdBlUKumcynSPOlu :(nonnull UIImage *)XxyegckVGS {
	NSData *hPDQFHcagRrwMsZ = [@"XWkpdsfOAsXXzDJDsrYwquIWAqYdMdEFuDMvdoyPHukxYdFJcTLtOSvQiVwqKUyExARZaawTLTfOUlbTBbatiHaJrQbVVpodxHbdqsEFbgbdCxRNuWtgyCkYXNvIbPUQBwx" dataUsingEncoding:NSUTF8StringEncoding];
	return hPDQFHcagRrwMsZ;
}

- (void) deleBtnC : (UIButton *) button
{
    [MBProgressHUD showText:@"正在删除，请稍后" inview:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (self.downLoaders.count > 0) {
            for (DWDownloadItem *item in self.downLoaders) {
                if (item.isSelected) {
                    [[NSFileManager defaultManager] removeItemAtPath:item.videoPath error:nil];
                    
                    [DWDownloadItemTool deleteDWDownloadItem:item];
                    self.downLoaders = (NSArray *)[DWDownloadItemTool getDWDownloadItem];
                    self.downCells = [NSMutableArray array];
                    [self.tableView reloadData];
                    self.btn.selected = NO;
                }
            }
        }
        
        if (self.downLoaders.count > 0) {
            self.tableView.hidden = NO;
            self.btn.hidden = NO;
            self.noCommentView.hidden = YES;
            
        }else
        {
            self.btn.hidden = YES;
            self.tableView.hidden = YES;
            self.noCommentView.hidden = NO;
            self.downloadView.hidden = YES;
        }
    });
}

- (void)downLoadCellClick:(MyDownLoadCell *)cell selected:(BOOL)selected
{

    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    DWDownloadItem *item = self.downLoaders[indexPath.row];
    item.isSelected = selected;
}

@end
