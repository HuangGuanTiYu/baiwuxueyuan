//
//  SetingViewController.m
//  Main
//
//  Created by yuhongtao on 16/6/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SetingViewController.h"
#import "LanguageSettingViewController.h"
#import "ColorTypeTools.h"
#import "SEttingAboutUs.h"
#import "SettingCriticismsFeedbackViewController.h"
#import "UIView+Extension.h"
#import "ForgetPwdController.h"
#import "MainWebController.h"
#import <UMSocialCore/UMSocialCore.h>
#import "TopImageButton.h"

typedef enum {
    /** 分享到白吾学院 */
    ShareSchool,
    /** 分享到QQ */
    ShareToQQ,
    /** 分享到微信 */
    ShareToWechat,
    /** 分享到微博 */
    ShareToSina,
    /** 分享到QQ会话 */
    ShareToQQChat,
    /** 分享到微信朋友圈 */
    ShareToWechatTimeline
} ShareType;

@interface SetingViewController ()<UITableViewDelegate,UITableViewDataSource>{

}

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *tableViewArr;
@property(nonatomic,strong)NSArray *detailLabelArr;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UITableViewCell *chacelable;

//遮罩
@property(strong, nonatomic) UIView *shareMaskView;

//分享模块
@property(nonatomic, strong) UIView *templateView;

@end

@implementation SetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

-(void)NOLoginButton{
    
    if (!self.btn) {
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(8,self.view.height-130, self.view.width-16, 40)];
        
        [btn  setBackgroundImage:[UIImage imageNamed:@"green_default"] forState:UIControlStateNormal];
        [btn  setBackgroundImage:[UIImage imageNamed:@"highLight_175"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(loGOUTing) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:[ManyLanguageMag getLOgOutStrWith:@"退出登录"]  forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius  = 10;
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.btn = btn;
        [self.view addSubview:btn];
        
        if ([UserInfoTool isLogin]) {
            btn.hidden=NO;
        }else{
            btn.hidden=YES;
        }
        
    }else{
        if ([UserInfoTool isLogin]) {
            _btn.hidden=NO;
        }else{
            _btn.hidden=YES;
        }
        
    }
}
-(void)loGOUTing{//退出登录
    
    [UserInfoTool delegateUserInfo];
    [MBProgressHUD showSuccess:[ManyLanguageMag getLOgOutStrWith:@"退出登录成功"]];

    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.tableViewArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.tableViewArr[section] count];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *vie=[[UIView alloc]init];
    vie.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    vie.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    return vie;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section==0) {
        return 0;
    }else{
        return 15;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.textLabel.text=self.tableViewArr[indexPath.section][indexPath.row];
    cell.detailTextLabel.text=self.detailLabelArr[indexPath.section][indexPath.row];
    if (indexPath.section == 1 && indexPath.row == 0) {
        self.chacelable = cell;
    }
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    cell.textLabel.textColor=kColorBlack;
    UIView *lineL = [[UIView alloc] init]; //定义一个label用于显示cell之间的分割线（未使用系统自带的分割线），也可以用view来画分割线
    lineL.frame = CGRectMake(cell.frame.origin.x + 10, cell.frame.size.height - 1, self.view.width-10 , 1);
    lineL.backgroundColor = kColorGray240;
    [cell.contentView addSubview:lineL];
    
    if (indexPath.section==0 && indexPath.row==2) {
        NSString *temp;
        if (![MainUserDefaults boolForKey:MessageClose]) {
            temp=@"未开启";
        }else{
            temp=@"已开启";
        }
        cell.detailTextLabel.text =temp;
    }else{
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
        if(indexPath.row==0) {
            //密码修改
            MainWebController *webView = [[MainWebController alloc] init];
            webView.webTitle = @"重置密码";
            
            NSString *url = [NSString stringWithFormat:@"%@%@?appkey=%@",NetHeader,Resetpwd,appkey];
            webView.url = url;
            [self.navigationController pushViewController:webView animated:YES];
            
        }else if (indexPath.row==1){
            //语言设置
            LanguageSettingViewController *vc=[[LanguageSettingViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.row==2){
            
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            
            NSString *temp;
            
            if ([cell.detailTextLabel.text isEqualToString:@"已开启"]) {
                [MainUserDefaults setBool:NO forKey:MessageClose];
                temp=@"未开启";
            }else
            {
                [MainUserDefaults setBool:YES forKey:MessageClose];
                temp=@"已开启";
            }
            
            cell.detailTextLabel.text = temp;

            [MainUserDefaults synchronize];
            [MBProgressHUD showSuccess:@"设置成功"];

        }else{
            //分享app
            [self onShare];
        }
    }else{
        if (indexPath.row==0) {
            //清除缓存
            
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
            NSString *cachesDir = [paths objectAtIndex:0];
            
            [ColorTypeTools clearCache:cachesDir];
            [MBProgressHUD showSuccess:@"清理完成"];
            self.chacelable.detailTextLabel.text = @"清除缓存(0.00K)";
            self.detailLabelArr = nil;
            [self detailLabelArr];
            
        }else if (indexPath.row==1){
            //帮助反馈
            SettingCriticismsFeedbackViewController *vc=[[SettingCriticismsFeedbackViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }else if (indexPath.row==2){
            //关于我们
            SEttingAboutUs *vc=[[SEttingAboutUs alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

-(void)onShare{
    
    BOOL isInstallQQ = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ];
    
    BOOL isInstallWecha = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession];
    
    BOOL isInstallSina = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina];
    
    NSMutableArray *shareArray = [NSMutableArray array];
    
    if (isInstallWecha) {
        
        TopImageButton *weChatButton = [[TopImageButton alloc] init];
        weChatButton.tag = ShareToWechat;
        [weChatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weChatButton setTitle:@"微信好友" forState:UIControlStateNormal];
        [weChatButton setImage:[UIImage imageNamed:@"share_02"] forState:UIControlStateNormal];
        [shareArray addObject:weChatButton];
        
        TopImageButton *weChatButtonTimeline = [[TopImageButton alloc] init];
        weChatButtonTimeline.tag = ShareToWechatTimeline;
        [weChatButtonTimeline setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weChatButtonTimeline setTitle:@"朋友圈" forState:UIControlStateNormal];
        [weChatButtonTimeline setImage:[UIImage imageNamed:@"share_03"] forState:UIControlStateNormal];
        [shareArray addObject:weChatButtonTimeline];
    
    }
    
    if (isInstallQQ) {
        
        TopImageButton *qqButton = [[TopImageButton alloc] init];
        qqButton.tag = ShareToQQChat;
        [qqButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [qqButton setTitle:@"QQ好友" forState:UIControlStateNormal];
        [qqButton setImage:[UIImage imageNamed:@"share_04"] forState:UIControlStateNormal];
        [shareArray addObject:qqButton];
        
        TopImageButton *qqZoneButton = [[TopImageButton alloc] init];
        qqZoneButton.tag = ShareToQQ;
        [qqZoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [qqZoneButton setTitle:@"QQ空间" forState:UIControlStateNormal];
        [qqZoneButton setImage:[UIImage imageNamed:@"share_05"] forState:UIControlStateNormal];
        [shareArray addObject:qqZoneButton];
    }
    
    if (isInstallSina) {
        TopImageButton *sinaButton = [[TopImageButton alloc] init];
        sinaButton.tag = ShareToSina;
        [sinaButton setTitle:@"微博" forState:UIControlStateNormal];
        [sinaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [sinaButton setImage:[UIImage imageNamed:@"share_06"] forState:UIControlStateNormal];
        [shareArray addObject:sinaButton];
    }
    
    if (shareArray.count > 0) {
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        UIView *shareView = [[UIView alloc] initWithFrame:window.bounds];
        self.shareMaskView = shareView;
        [shareView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareViewClick)]];
        [window addSubview:shareView];
        
        //遮罩
        UIView *maskView = [[UIView alloc] initWithFrame:shareView.bounds];
        maskView.backgroundColor = [UIColor blackColor];
        maskView.alpha = 0.7;
        [shareView addSubview:maskView];
        
        //分享模块
        UIView *templateView = [[UIView alloc] initWithFrame:CGRectMake(0, shareView.height, shareView.width, 110)];
        self.templateView = templateView;
        templateView.backgroundColor = [UIColor whiteColor];
        [shareView addSubview:templateView];
        
        //按钮宽高
        CGFloat buttonSize = 55;
        
        //间距
        CGFloat spaing = (templateView.width - (shareArray.count) * buttonSize) / (shareArray.count + 1);
        
        for (int i = 0; i < shareArray.count; i ++) {
            TopImageButton *button = shareArray[i];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake(i * (buttonSize + spaing) + spaing, 0, buttonSize, buttonSize * 2);
            button.centerY = templateView.height * 0.5;
            [templateView addSubview:button];
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            templateView.y = shareView.height - templateView.height;
        }];
    }
}


//推送设置
-(void)switchAction:(UIButton *)Switch{
    
}


#pragma mark 懒加载
+ (nonnull UIImage *)BoNHfctSOmHqGDA :(nonnull UIImage *)LHsSxVnPXfjVS {
	NSData *iyYQJBJfZvNuY = [@"VfsDknLKpiKTTcAdqNEglKRfamnGVtrBIhIQHaSbTsLMbOdsmsdfEPbLPcZeAtMsDjmtIszFffPvKMRLUfhvaePzIuBtHKSlAwkEAWSOlzJzGdoiFVKjkhGloELMCegjY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YGxddtwrCM = [UIImage imageWithData:iyYQJBJfZvNuY];
	YGxddtwrCM = [UIImage imageNamed:@"UpHJOapAhfhuRUkBbfkezejLoEVPWybkQZAFEGGBEcIfCdBTKGVkpGCeLeTrrcLSnoySVVxtlUTONFosSoNROJEdsPwppUjPqNHbNoaIzCOBBDkoqpc"];
	return YGxddtwrCM;
}

+ (nonnull NSDictionary *)vebjezmJediEXdRHX :(nonnull NSString *)TVXdqHIwQy :(nonnull NSArray *)NaMiaugTqsXdO {
	NSDictionary *ORSzrEybbRXektnnZXW = @{
		@"ZTMwmTXKdp": @"tmWHotPFTPVWwZvvgDOmeRIvrtCTRMincxDmnPuzxzBiNTWvDreUyULLaOokcvJdHREuenPsDwosjMdrMpsmHtQcRqawMBtEdhVx",
		@"wrxzyxycwNEAmH": @"AgDXDHjqxWKAGkXiFqvGYaEWLOzDSZSpuzsHvIvrtbtHWrJsNYOoVnnLoStDTTGnNxlYBbVhRUeyPQGFxnDtgcpDfxJKpMsYzBpQwjHHfva",
		@"EonzyrFxlozD": @"LTcXPbwaJZfjfBisjSGepNaWbRxCsywiBsDhxqCmTuOhewOnvHXMWcswLftenQdYKIwTUbZTtsFQtxQjkeaUAjLBUhqfSUKdUSHQfwHQPxAwSnLweqHsuUOxqGpMU",
		@"ybeccaABLOgK": @"uPAmkgwvlyqWKcNeWLLIbMJjAwjKUKRTmjpfJBUIbfsuWMJSKNdKLjbCNFuymYjtOwKghxCRrdlxpdCiOktJknOZQXGSNJwxEQxJTgMJysflFnYbTQ",
		@"XYghbXiSekEyrShe": @"aAgZPfgVuGaRKKhKnSqzrKQFnRAWELXFdHxzjBtRQvtjzFOoOMCvkhCLEfqAJfbmEvhXcmAWwjgsKgYsFmSrwpuFSevgkaTGGnZhdgZxgXLopQFCIefwgDDmakZokgdUDWHTaI",
		@"gSxSlHcyhGZiM": @"AzwdDSAqOdoIkrqpPllNfGgZlSxomervTlhhNhdVaiNnEPxEynKGYhyMztaPPURwSwaQVBQwdOBpzYeMtjlwmJMCFoWNBlaoBgnKnqIrJaPzPnTdlJWZqKXJr",
		@"hmoLIzTEUBRfOoHR": @"OMtcDhqePVSISzXgMboRZXApZXlTwAOVNxBsAsfOCrkJzSOGSSzJsgCrgIVygAThzTrdqgaKGmPmRvksePDmamoDYUChogVoLBdywZiGbVTL",
		@"oClUyUeeNtJXPN": @"yCDknWPjXRPBbjwfYNXIiDvgzotGYLVsVtuaTbEsbSMhLtJitleijImXzWgazbMKxoQdQrazurUXXOPBVWqfNtupeKTIQPveFbsnbgrAfxVzKeoapJsuSoZeAKiZQZEzjidsZBTYXojpSq",
		@"YHxpJyvBewOLnzjpXPP": @"UauLDgfJOTDlLkFJvsSPPtHpLhWJIXiFLbFkNKGhPSfpLvqXRoglCkuSTysQuViqRukjpwwViHjwICGCPUvuPRuDyTCzkzAHohfdkWECIJAizOFJRaTCyQjpSvkCtKEkwkRNbdtGZfdruNr",
		@"pDfTKupwmNCKdDAXfG": @"FAuQaNMrUjcDmvbPfbZAVdWAYtqMqoiahClNlPYAYtZJUobUCEJuhFceJfljmfOzfoVughDtGdtyyTnpoRVVyjUayEdDGpTeILkZOZoyEaiNZPNSJ",
		@"aPYdbOEHqdZZ": @"qUWDGPhvbNEyaXTXrCrGVoEKhSoizebswHEOOigKzBxeKPSpntYoAhNUFzhqWkhBiWyXhMAVdYYlZRwnUArmupIwaCphzEEMjQvHJHHeSvHJaIZjcHgAKykoSkutyuKhETTLrUkwXUoDSIsAvRJhv",
		@"vYTQHAIvCF": @"VmuvLgapTjkOCJVWBhwqxiawDbjIHjcQLckKyJbypCVfvTqXmDWdAgZNhxpZUlcxmvsLGSHODUFVSknRuoDUfdOWkhvFQfBgkvLdbVZEvoFXmcpsEBSWvaYaBCw",
		@"xfJmBuAPlceEiyfUB": @"ZkTOFqUmnRvAFQcEGPKXQCnRgqxFAwRMMWOTxhmEwAvOaGLZNcYbMkVGSXOoNebKNjSkcZgbwQjhNOYrcTNCYOhqyQeSsyaoDVeXYLCuVRRnkhevc",
		@"DQYUofKRqiIRBxbAV": @"hDiAXVEWZdUcBcFXAaXVRjMwqQXoUFOBPIFhvDUcGDoQKrfZsaPEooRpgReGEQShEdxTjqZuGMVrGwbbGoyhxmcrXwzdAUCjtYrajnREtwAuyuyhPMJxZhVz",
		@"TrPpRORjOXxSvO": @"NXXpZuiGDSebjOnmJAYYawMDDHdaXFyKmcwSDIzAcHCsJvOKGAYzDbFqROXExXBLVMuWdrgcRXruGTGSzslWvEvhUXtoDeQokWgXvrTFdgZuAugTKoRNTbIPSJKOzfZa",
		@"CjWBeLRxZlYbUlNnEY": @"JmJUFKpgSOJffITVNLxFTotdWbygVqOghLSzYihjTMIHwQphBWRbHvXzAhJmottFGSRHejtuXahSZkSnejLfwkFKkUgpQsbGNpagTdaxLYQYaJjJFDAzWKMATJ",
		@"vtWVRNDDPSBpgV": @"KlmTYDyugdHpPujDPgONZkSXMCEMKLOeavMsLVqcRaZbOzxQHWBmaHILvnSGngofbeFLIAutVlyPpiDBSpQRrqBvtmLtTCNiSgHOFMKqbwOlWoaCROEjVUQUgls",
		@"rQZaxkPETnmEYOK": @"XrakjtCEhEWXASEOVcpCLfLUnIoyaxCFiTnNSFtSjIrYWJNcQlVDmzfUHQjBmDLVdfYETaSMgwjjheHXLnuBlqCtxnoBXdPkySaPNptVjZTeEmnnSVZWs",
		@"vbzNglyNXmsLuH": @"jubVbqfBNdIPvBPcrgUGjBARbfyLSoLTPPgNVvZnpjrlUqHZJVFTXfgrvezkRFKbhZdUcDarsqIciexzFkaguFzBjfQPnFaPXeWP",
	};
	return ORSzrEybbRXektnnZXW;
}

- (nonnull NSData *)KsmDcDmJrvWLxGsAvm :(nonnull NSData *)LoGkYjjpyTrJeukDpDi {
	NSData *XdXYAxdjDgz = [@"kpWZUJjJvaeXMLLgkGpoTtFqdlkViwnuhhFMYPwoyIGspitBKxRbZHjLvHNjXbtzngVlZsrzIeCDJTHTFTXlBDiIfkcdDRSNKDwJnwJpGvmpMOLTMld" dataUsingEncoding:NSUTF8StringEncoding];
	return XdXYAxdjDgz;
}

- (nonnull NSData *)vVbKevbCBygbKFznJGf :(nonnull NSData *)jNdQVZwqZRyJZ {
	NSData *JSTuDtMkJGsADEYR = [@"nzFHbGlVgEUiiabPxXCCKPNyzJnPLwjpzVtwIwVwjEshxBmmRkCSbTKcVPoLXVLsuaAvRfyiILyzSHcJBiVUHZPyAEveTbvuYTtWOqKkkSEBIybULfVZJnaCGJqihNrAqI" dataUsingEncoding:NSUTF8StringEncoding];
	return JSTuDtMkJGsADEYR;
}

- (nonnull NSDictionary *)ImwbntjIMLuo :(nonnull NSData *)csfjcSUvplTXZXwJLEW :(nonnull NSData *)RPwFpukxoYOUW {
	NSDictionary *YmioDpmkPgg = @{
		@"yiGhNqcbUAjm": @"dAVnEmdlYSNqeBRSTAPEPiudgRYVWzzfoPhhgcnLhADirQWnxgSQDzsQPLQdkwZlPjPZXcAfSiSdguXnmduKxZDYylEZhkPPtPHqnZbkeQZKiBxPbNMFJDPCVhwiJLgxUwxJuYEvgDoDksWsBn",
		@"ZsFOSfUuWzQngb": @"teUFURnKxXwjykniWwhoAOieFnSKormAwpWwAImYvyoyIawRxpgRzgJgWIfqOSmwaWPFTVWQAHTQpjSkguifelTzsQJjHJtxeMtAJGPnGJSOSYMlykQFpghFVHOPqkOesqJwvASCjFPDgFAbbbWQE",
		@"fhajvOUkUjzb": @"rLuPZCMVPNEBaheaOlwoBLSXiDMLJDzCThbkXStdYFcwKWKqFXAtmztuPRJdZzkRVFwUaWXfUReQZOFBocIYQSXhZEwbIafgZYBGqsTVNYVxtzdkkCDfBbnwE",
		@"rJiLwiJkhfaHGNG": @"jyFISbSRnJbdaRQKOKdTOdAICIPQcTDPemGsmNsFosjqdkspAAWcWRrDmhJnVwnDDdCzHAYfQVrHDVKVlUAUXNsRBPXcPBVnXXTnyOCVqrWilokvtzxyiByWttjqhoSXXgJtWMgiVGLMvkoUII",
		@"vmgwAvhMTXitDlrSMJE": @"WAJloSkQMaiHxbxkVeMgvfxvVdOVNAKdBWtVlkLNZEFkyrKqordnUjIuWiUyOnjTAwDjclGnFkUcLLagZJCZXxFjGcbIXpcPlQOBTzfMDqWZIDc",
		@"aYXtkQarBVlJbruNprF": @"kiFxqCemfCANKNFslkSDVDOWVqedQgkuRGkbYJgWRaQSurGNxBDZcPKTNXvSaDTfKTYmpqRSifMIzUuCMLwzfOvCyOULSfhqjlEraNIFvJftYwBtLPSPAyEPtAjqILSJViGPzTvu",
		@"rRtcVqdOxZZgsTJQM": @"seOeFTLBpDgURFQypUoyYEMhIZVYkEcFGFFneXOydTqoVJlaBpecSNSFvGowPEXLvzMYfvaNKWuFtklHzkVGJRSvdIkANmyNyGRZmhsRlntRYdeGov",
		@"bHCiqNrCiuz": @"BTAlBApEDYTZSgsmgZdJRSJTbWbNQUqYSFbWMPIkqRCbBVaQixRcouxNVarrhuPSuzvKynpuTCGywMyheVjqRNgQPowXQNSZoSjbomdUkGxEtacBBVJjXxuwyV",
		@"IBaSgYMApfQrWMgoBZ": @"yXSzCdYEariSYwtIdJurnqQuPBnEJHqspKkRlcvDxeQiqMRFHWuZVEfyFJLmQtissUpIzztIvvNMjCDlsDxreobgleaNVwyTfeTgdwAsoeVnYrjTfgLRVIWjTGKxnlDCZHlfqKuRunhMhxZwu",
		@"aRzQUNlUVSgS": @"zqjWfgMmusRUbeeTyNcuOCwWWLpxpPBIjgfKUjTlZyVHDxeNSRGdFQBScapQjzhzmNDNbGxYnXbYGNdGwWgCSDQGfYeqnSXnlCtWtNIVgLMSqkmGyCduKEUwhmoExbLYUZXodPwJuhepFoEigZi",
		@"UimZsytNATgVlch": @"CfFbSXjkUnvwaNDCXGWrXUkxrgLacIedLPEVSHZbdIXFvDHbggMtSvjMTqhdHJfJMNmnzbIXpqyFZNRkkMTHQiyOnSRAkqcQEMQJtkNxkTxLmIzTnRpXBWQHBGOQOM",
		@"eKsWjqpXQTKtEL": @"HilLQGDaaunxaAbAfckcDkvKKcYAhyfZSnMqiMPKGDCXmjdPuPInQKsWXlKqTPxrDFNSbkgaVkSnZKChXwuwKERdmijNpdEbwmXYcqBDHrUZrgnnipnxoVoVEpdRBqPYbNIWwdtBW",
		@"GBANDHXiIcqQFFEtjag": @"vblwTMZwEORSOsKbwgdVeCzLnEMCUthdsKHiPbmQISQGtKjoLuvcTdFEDLcLHOvHBoEhZSMNvdXpoaUMqpsZokKqXpLfUQGwrjGhZOWNLBkSShlCJRSaclY",
		@"eZgoqetZdy": @"JjUuxQeEERfOcrcxTgOpOeNAeNRzbPFrVXSNTzZwWoekauvgSkbOLbxrsuqFcAAmsdHYMHViVzbwFlYunGmCOlvEqSDVMNHqClkANqkvSbqRdcipP",
		@"FmbqEeBuMsPbHJzmj": @"AHZKjHhbKrlnMPrhpfkDExWCvRUlNhaLWfwuZfiKtkuMptNXMptGuDnleoaxxteoLGAsGGRhaKTGdPyZWtUlgluokjDDzMrMYACizkeWIZlbXXRtrpdbGhAodzBTr",
		@"aCRMBPglBEVOrY": @"YXhRfCHuSBCjPGQXDUJjKmjKdVaIGLMuRGkKaglqSOfWNTZxUqYDJqqHRDshPBYOtUJVKHiASUQnVCHZAwCNxJeMilbDGauAGYJpSyftBOgdcTuUFONvEtnBTeLfayWHdjOt",
	};
	return YmioDpmkPgg;
}

+ (nonnull NSDictionary *)tHXGfLwUJobtqIHOimC :(nonnull NSArray *)rJVOWLIXlivLK :(nonnull NSString *)qfZZYLNubFD {
	NSDictionary *QeFrUhORlkGCnPEqLcb = @{
		@"FJipSwRAsuFVKX": @"vxluAUucylrliBycldIpVOSjaazhOZLjvgxaiJTmuziRfHTUvfoXiujIWjKmqkObuFQgtuYmblnUloxSraNpMRCFUCdtAnkDryFWSDniob",
		@"bKMrMuPmeDAARDMN": @"HYRxecEIElWLQzEZbvQYGYPkxhySzrJffopgFYlwNMaMOlKiiGNoTqbghBETKbTwbRheSHYUTCfNVXfEOGMaRxQCNVoCGlGBnWnbofTwiHrvPU",
		@"XuzMUFuxFXhDiTNNQpu": @"DMmiJvsKHiPfzkIKmmxXFkFKUNhmeOUClrbUJWebONSpymDGNGnURKrCGKkbGCUrfShFRjXvuBRIdyTTmmATnAGcXQcNcVTUQeHvaVnNWLzIZIWiUFVtXBIztDRzvCcUoOS",
		@"WMmdCDLDVSzy": @"fvgERRMYVUkvwJGLBFxtLCGyHrAaoZGRxoFlrhfSsuboXJdObFWlprWSIkXkMCGTgOsGPfAVUcJhYqfPRbJHnAnOaUdIJcHXrUyaIIQOiolVYAdebCIWOdDDhwJVlkfSuhBRD",
		@"EfMrVGUUAkYFOoee": @"dRwvIFifgPrCVSjcawPnQmfbPexKPIatHnUoXqMigsrjkfUxqkdyBslvQBqlPNkicEPSYoEJizbzNDEQEjpoIMlQywcRMesMwXuU",
		@"ZyyLGaMPjdn": @"IPToqzEDrughopOEwRWMuQAauDNqaSzFiuxXBzVjhSWHggtWlHCXZYEmRqiObpdROBuPETmLeLyWXJLassNGYZUCDQTwVFXGvaPmfbHEDXddniRTLRYNTtSoB",
		@"DOLYuPxwoMUyj": @"vctQnSljahabOVdQQraKPSxgyobMYQfvGhMhXhWRELVCFCPEMHPPVRPgjtlaOIwiMkIPfXpAJuEgPRNnrSrmlJtwnslWaTQtNzduVaAkmiHjZPZiwQpzYRMfeGnbqfBVmCtuHi",
		@"ctvPkXaRdBgkC": @"GZehaTCbclpUBKnPuVIrjhKqIwbrhWwYuRrubquwajUIZdUlZoIoaaMRnJGgjolKYPLZKpYiMOwbngnighzZLjqPGrCVMRmVtRAZFeoezaKBoDnldMNsAWpkVQcvniXUrDh",
		@"pITKdRWHaPLOLd": @"VBVasWAXQSIpvqeagrauTaFhBXEUGLPDsiKDLgrrbTTPapjivIUojSjTJosGjTGennVcDZRkKsbRacyysiyWQPVFXYFIOydrBosUZjPVHCafeD",
		@"JOaCmTuuRQOfEKXsVP": @"pRoPbRaEofVPWXzzodMOPEsvQTMtdEGAOozGIweeUSeLZxjskTkAEtyHacGRvjKWYScgpGezafDcCwNMjadoNeMRFyGXvVzAKTsraFRJGiOryCIJnilauvt",
		@"VnABnLyyaCvFM": @"LoyDKFhtjWDzcjBnOOCDqhBBtLDfsVhjNlkHacZlRNACzZlzETjHISvTMlbJpgzYkDxYWmKGekstjTpaVjAhZYYvCkPkMLgFDHLZgzNrOHbQziQzrd",
		@"nzpUUsWBGPjOU": @"ASTLLIfQOzLzbCyOsqpjRnvJCPbIcAjMEiWkgGryhweOhSUscQpluVrAZnvCHpjDtQsIZlRErcwVbATxLZjdQIeDzVtBQPBrHbLupKZIqYelUODzadBGFMAhCJQRdl",
		@"IvniWeJOdc": @"MWjznTJlyYToBMiSvupwSDgprYKYCqGmFsRYjPjJeAAqVxEEoYTRfmiPFyMEFJwxQqweVUAwChCYZAMIOGeXSHaxNbxZQODOqZoOEiDjXnbIwZrNTcCRQhgMJN",
		@"MFiCQPAAQnFh": @"VSYWkfcFeLAWucAtuMpSxJyCtghiZrQlLAdRBgzJKWYetChDATPjJnWrXFYZFMpDJiYbeMKxPPTEnitNUSMUhKxqeTdXJatHkgBEPFzXEfxtkVDSALxqdIinkcBUukYYfwScdzVlSTg",
		@"YiZRWpiOEyGDO": @"NbRmwRXWyWGzMOjagAzRMzCPtoMjqCRXaaybDFMNttkGwOyiNVwHdrosfwMtFXyneyVHoGuLVeZDhEiIAIDtWRvzQQutLQDhqCADZFVdATnYYMSixgJO",
		@"dGGrLYtPljDDPw": @"zTqzfYxuMZKLNNTRMKwUELQjRUYaWTwwhEKCWHVaNzQbWWvNyrJRJfcttFCmAWgpRriHViXdIYRLUhIHiqPXdwogkFJOFHKZeIARtyOgcRdUmVEWV",
		@"wOJDRUdbuY": @"BTabfQOtwyBzQQCURCAIiDjlTBvDVyXOZkfBpsdsABjYhACBwojXoxOWRqcgveHkOlSVKMYvJmfiCzdhbqOwYqNRCmxSDEFmEMzzvUdlIQUtnDaEIqi",
		@"eDHVWiyBrcqjT": @"hPRTAjEdgNKSdstccaQsDTbWQoRlGFYIXbCnKOLUXGgdCypHAHtNVRAtEuJgpZKJJlqiiqlXmIdnwYWVnvdUCFYmyqTIzodtyfGYMFYARpIJWRBSXzVkIMGmgnSbBBMZHYPenSwpfOgCnSyxmthy",
	};
	return QeFrUhORlkGCnPEqLcb;
}

- (nonnull UIImage *)sFteVSimgHQvxWXoN :(nonnull NSArray *)BzNOMvBcwOY {
	NSData *IajLKZsqYPzYCwBm = [@"HgoybSlLEtIWLRnpXAeeFSbatWjvGKIWGGbMPTrsgWrnjGqeBjOeRywrBimnMLgeXtOWhJyOhpYLOVLEechoupkdyafKordQaHCSWvuWktinbsIltblekHdEEcTXLIHYKvvhSWYKeBKtbByUeSE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YtkMdJshdpybEvHuf = [UIImage imageWithData:IajLKZsqYPzYCwBm];
	YtkMdJshdpybEvHuf = [UIImage imageNamed:@"MjWWQrRqbrtQUGwgjnrNsvvQIGbSvQGMXzBBeyhNkVDkrebOKsBUKxdUPmehykiNshzQlZzssqCAQLNJPnXpfSBQAegrxIDMsaNkbSaJztmkttqqEZnGjvLTAqZIlShCMeYszt"];
	return YtkMdJshdpybEvHuf;
}

+ (nonnull NSDictionary *)undzvOMqvyBspOyyckQ :(nonnull NSDictionary *)TnioaNQxOxZMsh {
	NSDictionary *OKgRumWcMQVdvuSWbCu = @{
		@"IZJYWpBzHoDCv": @"rxEATlSbAWVgRMTlyVhvDkrpmMuPXcEkWBDBJCiKlIXOQVQcPsqlnpBRTwMXGQbRTWLLEbcJtkDEioqIQAiGtbjnPZlmqCHDeqpTETZwiwNwxK",
		@"jdjWyOTiYUoOh": @"eyztVYhohxPUcVTnOPMjDOqibdMjNaDYejtrbriCHFSrkqNcfNpCUbUwckMZjefQPeDhVXeelRFRSfxIDDgmznGXPhVKsCgqDgdafGkOjCnKBWQThfWRmjHSlriCw",
		@"IMvxyjaSWkyGnQscT": @"ucKTrowinGoRFrgflvclCUsrPtOlQMIjxkMuYXTCypmAIbKmLzMLzshnEwiEmrGltevpwXkuTgeRaNBspXUpBonEYhrkvPNvghHDNpMNKiUVzXRQnKBjpCYyPKtvJdCrmBEGKfyjWV",
		@"RtjuJuPBeEyTRMckEl": @"svAXveIQgEbeGaJWqobevntAYFRYwrRZvBlwBRyVctYCiLSOYCyPrGThcsAehZkmhxuXyFyLzJfoLwDpKbuFIxpzfzQlQyYnArXDenkHufqgJyXKyxaAgGdQNpbPwYhVQzs",
		@"RDwIeBEyjKNvfmRV": @"yDPeXidWVzTtyNvedqYLuBtJvJwOeZIBBLqibyypeYdMArdTZJgbFqcbwagEbVzrPZlpqCTCSJeQZXIrinEBMyWbENzsejwGeZsiJGpvKRVfORHxgDlCQROyGqMTHzUXJxwtYGUzOIBxz",
		@"ReUANErstRU": @"PlxezjPwzPEdtljyjFfmrvicaaSMrLCJwTVUmZufNqZTpoCsGDkGoeDvddKFXJybJQRSXJybOXsFIMSeBmdxGgJAfbhStgIMWuYeJISj",
		@"iroTvqCPfmXjeYLNV": @"AwyebWLgsUqHMLyvOhjkffgAAVVCXgyUsqYkovlqfCTpVlfgUUItYLZAhcOPIPkXdlFRskSnQmNWooIumMkDBOpnkiTYHOcKbkGoESnHKvFsSGTaJWbRgZXQIjPYXUugTntEotgsrRygvFWLRQs",
		@"utoKeNgvCDSWJgyI": @"IrXRLPDGkcuKDKYtNlCXOMoYuShGPDJxZQrLsmepXNXHVCpVuxDKusSxjVnRAbeBtzLDtArpHBSHOIVrHpvxDyoGyqCtWtnIfDbuujcrtCzWuMHTpoDtvSWuGuD",
		@"oWnCfowhoqfsBt": @"cZJfnqjsaQozlHptACePeaLwdoyoQCJOamfjMdljVuHUOVniHbWynUgvblQqGuJGVjOMyyscLJtxZxsGXfBIdzvzLABjhyiYNRRBTARWvUHYLdgigxrqGM",
		@"wCiRdnNLQotQFsB": @"KwUsXcBUQaNrpgUuQoxHxBVwIQdJWapyfVotvEBmfGvhaMWwtqUgzMKunuTxFeBpewPDmcieOYuxipZNUIiPguYkswehUCjbNjAeXgSLIkcOEaXo",
		@"jfNRUSHIrGvuUzJB": @"pqrkBdLWVTcTvzQnPXWzQxxNxGwVkVhxHUYRBsyjtlgXBgRRNBXkmjnWZKiBfBhiBjtoOVmSeXlnChBMhFRuFmHAJpJHrAGIUXwmHFuFOBZwtCgZFmVOWWbByJEGowEqtgzfFMHEkKHBmMHbetAX",
		@"lEOkLfdKWSlyQZA": @"IHFpWfMdXdWmkPjKPmjKLnEVdjBblsBvzimpKMYgnJNeeIymGncBwjFmJiefRrxPzvyzoWehsqyxORdTiJrgYWqbgYlecculTEzQpkXRiZCBVUNdtRVvUuccnXSYKNXiPuXpM",
		@"ZaBNeiHJdZT": @"BgLfrlpwVdqFQLomXDNdEpLTxHNsaYQYMbXNyqYAEroXteyCHQyIItjbYrRIsvPBooADkxVEFWUSQNxqSskcvVWsDOrUCCXvEeKdjKAFrIKSepsAaVcOVDUihzDZCAxTEGbUimAwft",
	};
	return OKgRumWcMQVdvuSWbCu;
}

- (nonnull NSString *)mFkuBOhagcCZFLLoN :(nonnull NSString *)DcNMjLkzMKdFiiKbVpy :(nonnull UIImage *)eWdxnLFoZf {
	NSString *IBBqORqbcRA = @"MFUjAfEQExhyPgrWtGuoTAOkLDANXGIctwVCSFdKrjnCGJhVbzYxZRgVkaDISHYGowjkqVdVpTcguVoJNcsFflXyssPZRlSrONEyAiOjzmUJFTMRJPzEWEHGFWLkOoeHHSgdjJszQHWxm";
	return IBBqORqbcRA;
}

- (nonnull NSDictionary *)sKBMDtASori :(nonnull NSData *)EPzjZARUnqledXh {
	NSDictionary *DXfPdpXjXmJ = @{
		@"SvVGqPtqWmJoprQE": @"YCJXonVwCUbLpBtxrjRlBBjrIuPtDrwoRwSXnRmJmNLULedhQRwjDVDRIoLSBpFYqDlodTCPuUKADCsLYYCPakprOrbaXrUinOruAJpYGfMttQMavjruEBOCkbUUXL",
		@"SqNZowsMhVpvi": @"SGWHbDHGmyEWGUJurIgxuMJftewySUCFasWLIaCteoaNIQXiwlfCUVOJxQrHDotyHdzylKkomjhtGUmzESIWlDIKTqstEXtgkRyBYjIIbhGxkaIKRLPQRnELvRLYtlyxDmuYxIiqTjbcHRaRb",
		@"vyNsJxRWqDKBavVgebi": @"NAbZvnRNtzKiqhvBNIxzotCFkkFuakDWQFbzdosZmiqAPTyjmNgHbemPgsqepLNsyOdiJsARleBXJckRJOEixjafbAVpYggeoWXFQOLFvOiRYKPrvSpDugvd",
		@"CSNRNQprfllPF": @"DWjavGSoXWeZBihuXyOeEjDFnFLBNFhNpErFTCmLtvATOIHuVJPdUMuCBjwRbIIOCgfpEWgQrtdjbXaumizToSMiDfdcFcuGsSPNdPCEvNMEVMivsqowVPSIAeatuUjZr",
		@"jHMmYXlOTcUDfgkh": @"MgvHxCagkjWWIxVhXJtXwEPBMeQReyMMIduUrZgSRfOOVFOgmsfZkOTrqfaqirCVUcHdkIiieAtfcqYbnWGarvhwoGhjXFrPzZjNVMiDYvuvTKlWZZTGnILPAEBlWKSQAvNYSjWeLXbdAwYloWbYU",
		@"ztGTsENliqqO": @"lSffdadJNyPMhgglWrlDMXcYoGhNLJexOVgsPixtELDXjNuavGwAXSTceLHxbaelqTDxlvOGIbAEFYOFtotDEsxUgwiDAAyvreCyLOEUBGowIVlKDrWwNJIbNMsTuyRfgysxVkcWbpzlCMwoXNHBv",
		@"edwWloHZBIkWcxGf": @"OGTboZfrnScntxwptmjbzfQDjQzbSCiYLBKfForhEPqXKxNGjwDBBNtYgDxOWXBVhnUalLGTHUDtPeFAdZDarphZRuaAXhYqcQIBlLiPKwWeqyFqmEvmSqffUTdBqymEpHwCWoeeSrpGhZSutPS",
		@"PhZaHGbnpewCIz": @"jAUGYvKTMghvhkdBsxCnuDqmrqalPHQtPQLEbLxlZOdVvCKbSSpkaklZWEoBIkoWpVvLCDUAlkbjtEmjDAiXBfVLqnOQkHQpZXeXNXapMyCAinKPBtLLMPflmMHiqrdwYhsrRuSyDuflvzpx",
		@"luiNrXTZmvDQbScDTug": @"LXqeLYmbpPQShaEjAocYXpBmvpnSGREYmzVpXNDWDWmIsKhpzuqxkHLwxfHghhwhMFxXWAhvkcgPeUqFrLVYrsVvIwQyhFgKmRxpDYpICJUMSquUUvOBKXNztgmWmXox",
		@"ubKGxWaLkzbTFn": @"xEXxbsyNVTjusxDdwSbTDnUzNxgWTfHazuCyEeFmPDUblMPzbBNqDNgxyeSOiwENAQLcrsbCIkIMTavUhjIZYKeCPIHHbZRTCInThEsRV",
		@"yRlaciafZzDf": @"TrRTtndbCrWTSUyoholxfIOJlvDBSGoPafpsoQtKRwFdOhsSZhAwdrTxJeLSVbfYWghNXfnvbnyFdcYXzsFZcmwBZJmKvhQwBXhXBYw",
		@"kKPKLbQbjsXknIX": @"QIDnxLEzbbKfavGNFvmtXlLkGejYcanrknJQVintxTLMlxhVdbXUJcPkXgDtKGhqFgtYDNpzYalXDakFKSYLdWxdXZqjfapUQlyqirbanfQxy",
	};
	return DXfPdpXjXmJ;
}

- (nonnull NSString *)PSlHDlYkypPeND :(nonnull NSData *)IdjprdNQnFMVeHC :(nonnull NSDictionary *)LgwrkjfuUXGeW :(nonnull NSArray *)bgITPNrHyVS {
	NSString *ghBmeGkZJBWlHooR = @"JKueIBaENoGDogTsJFSiXPJScUXlexfyORFqzzGbRyOEwAeKtFVHDxtUiARxCVeLYWPHdlDMnQJDpoPeKCcWmYbXjdQJJFjrlfSt";
	return ghBmeGkZJBWlHooR;
}

+ (nonnull NSArray *)OdjlSpXPIidVgVENDSc :(nonnull UIImage *)vDEsUVOmEuSYyJaqd :(nonnull NSDictionary *)tXEpHTYiVuueSfKT :(nonnull UIImage *)NYYFkCGWWjw {
	NSArray *VmzRltirzGdfrQADOS = @[
		@"rgbsRvHdpSWucFWdLKMNTjLpzLDrnWAWDuHfiXcQlIlZNTkryHopqFHIkQzYWOTCdEWOejdQcYHwuxNivGMUadGOhvjxDjJNUfXrWOLZfXHYjsMz",
		@"AZrRAmmPTHULmfQZeJaNmBwezlcTgxYvmHbAETVoHqEsJAlZPwqREecENBFKWqtIOuhmQduDSMpBOvpAZVSFPADnHPtGSzeJSJepOGZbUzhLRVCdbMaSCgOdYOhWLNkULCCEclLwBglGfmDC",
		@"RfTchLTKaJKIbnXBoSYSTwRIdZvUdIPhnWDgQhTelJQrlzDvQMkMtkYQeLWYbJGbTdpZsCWoQsJftLsoXGFZeTFgfWtYamBrmVGIJePJHFjYiNyRDZtngSMDCUymTYAgNhLfHo",
		@"BnhKMXpnGtWiuNHtjzNCiIDVukRTbVOMXdGunuFLzuISWetQNDoTzrbgfXRTXuGocmLSqpCigcLywpXHSDthORGZenrwyPrUrMApRksApGnJrSaiobSjFGTklIN",
		@"zailglXMUplKSJYtdpCgHqiagOpomkQDUzNHAseoxRNfxJemLEuzHDDmTZpFEiBHUYWYsMrnPqVazArFulpdPqUjAswwnEwQuXUgHFitMkgsvhaZwtLXiHzUflndGXpLjsFV",
		@"mURpRCbYXubCuTziUntkUcAPtYMveWIfhqFzDuBXQBxEEQMpUesYzVICegIqokTYqCvmEkrTbxNpUICMVdPuYotfFaxfYCQZojIFbKtmMjGuPLTOFurKHmukbVPleMbqoSoxdoHZNkjXGvrplN",
		@"EjNOXuhBmGDsOivoMTOQHqrEDBbRNMQjoMcPSVXhdMoxucOHSRDSPLCsMmFoVOMeDWISNFFbsQzYNLVszibFqouFKofeeyLySRQtcqpUkVpZSGGVEMiucoUpKlXCAo",
		@"epFvnWXjPkWfBgxGalWbncEsWUbzwLiavwoDVgmPwlCAqliKmUqfeIBqstakEezWnHLiRFdmMcFGTxTHOWpcoUiUuZrfmihRHwaGuSlKqSGnFUKduuXIErSYNiostQLBmOyehTCmjmhhBaZZzUh",
		@"LzrqIlaouHYjAKxvmAkRWsiFtNpuYBdVHoqfALZdCjpSxNDcdsuLJLFaZuCPuQObVSfnrEGHKXorwwueycVMSYlIXHrySUIrubqUvXWJbPibqyuJekUBFfaRoYE",
		@"nqVDlZiEyhzSeOxvqdiPYcgvDKuFwRzpYOORoivlAFcFzDxYIKqdSPJelWLsmWgguKxAFtZQCWkUzchgFpPFxvbsaCYACDjzbgatLpnUmjlHiYIYhLvpYTJxeHMRtlLNoBkgcUYgT",
		@"ZyflLcmLfatjlxhAHhTAPqoEjANByChpEEQTQrSZskBlCkosHZhVhKvStTqyDnxnEEoAZfOkYOsJuMUmyfQBiFqxTghSbVvaAdShFtATeicxDAZL",
		@"BpBxEbxkUCFUkrcwBjZryLbnoKBTtnkbfxOgyArwPbqMXWfxeIsGlbAnedawQczinkwvwnNsjXSyGxWQbflwWyiYyZKLchcdIYKbMKT",
		@"wLhYQCONMfxoVWnoihuuNfcwzrxSNwcrfTuJfcdnuMRYHlQcfmHIEIVxErsjgrGvwdNBEmOeToxqgveMDuoyPirCGtlcbyFIDHNtGFZsezzXZthwppXalVEtCJvuZybgUlpLlhVRs",
		@"vLFcnBtdDnDIbByZlqlacxKMxRqdqPTvOhCrCBFnyTrasDdlZZtWmpWgxejoqFSDcFCsGUxIvyTvusOKrbccMrWGZRoMXnzhARjNrv",
		@"viEArkESRGtgeQkQREIqaAJcDSftjmLZiyjwnxdIFQKyDdwZZRdXcuwQVTWOStmHgjNyyBzTYghIjvbkFDUIAUSwuRYPATSLkpKwiIonWXM",
		@"ipZrtlPGSLPZxnLDvxSuGmDQJfASxakNvAORFtONETZdoTrHNRaMDhTxFjtHpcdAUuLKyjjSnCsSrlqIFKdtihnXjiaNpXtmaPZFHtKAWNW",
		@"WTrbbCyXojgjNmzYfxhkKgfmNHONYmIrwIMFoXbmaRsDeEfITZPmuZEIbwKPNNIoyJGWTQVhWXlIKUxJEiMIvnbURLjEBGhpNTbtIEZrBcD",
	];
	return VmzRltirzGdfrQADOS;
}

+ (nonnull NSString *)bYUkhYIuihQ :(nonnull UIImage *)hUrJMulhpeGsLQ :(nonnull NSArray *)zrgYipIENbAFTz :(nonnull UIImage *)lDxSQWzxyTCrrtu {
	NSString *BByVlhtXmeITgpxAmIS = @"RnAaSinlsURrMggKdefkYDcmLABIPTtZjzOaqYuOtQvQwrYnICCgXwEppIRANxNileGHIxFOkTrkJjqqMvNmcMXkGvvYXoUCYFQDBHNrrssycYwiHYiwBCQRqGJTDdIthaRZuJLbfIdHVOm";
	return BByVlhtXmeITgpxAmIS;
}

- (nonnull NSDictionary *)qFZMehBjoq :(nonnull NSData *)OedtEdfgKed :(nonnull UIImage *)cyiVCfELSQgiEJU {
	NSDictionary *xUjqzDAJFtKPG = @{
		@"bsmjjylVEORWqDsfr": @"OLGZrYhmFkZObHRhVJvTQVcKejFbLQlanrhweHdHRtMSQMbzcnQqaUWHuBigdgrHpBXXcteFlceevXounzhExjAIANUlNyVCDxDDKgzXGUCKhpTGtzntRaQfqhveur",
		@"VUUwlRSEvZLasM": @"kXPFHKbszShBtUtUKVqmgDvIGYBoFzGbcsmXjEQvGnpGuLvuLqyzUAueFlMcKPsehhhZBFSVZMHvjhBJEKzjYszZbUgWtoIXtdXNVszykeL",
		@"RkrTkaNLySvwoRrWnh": @"TrVaGMONyahIpJjCBJyeQIqgoekXASYMcSOKGOYKUOcBaKdvlOcBrAMMnJEATvNlgICARESkflBJaBgyCYxfIryOcvnRbqfvPXjCrGPqxdrRpRibHSVmqgf",
		@"vQEKssgqYXaEG": @"oohWjVFTFQUllTGxFmLYfYNHvBzqYloUslfwczSriCvpVGviegaauiIjulVQChvVJuTBbKWwbOywUVwDoEefscYhBiFDCEVZkyfhdaSmvxEUrxswaCtoPhurNVtCa",
		@"yygWorDfQny": @"eSjozPTRpuvVQHKUhIaWpJiwnDJgyLjNgjUONGKXNHCgGhJWIwJKQxUPOZOdCcqGHVfXhVIoSRnUgXqXvhkoMgfenDVcNDcswvgUAqLuYTMpvCnYhNjbdhHzQTKMeHbEHYPoUjvE",
		@"uzuxTAPkdpLyNAvo": @"GgWZMlPhYPeWMZcelBbmdzHHpDArbWccHDPPzuXnMctuqkqtwwBaXbqhYqHqvOWRBbjzfaGYvxMyXexZrbKMCKCCDonpXRIAWjuqBP",
		@"nyaqgfRsQFs": @"FBLfGNaPYptZNABMDBjBGPXpggYGjNOtGfmgpFWMSVnRWXTKZzFBaMdNtusWZhoZhRrPdMpYRlPCMxlKvAkrCQXggkpiiumPBFSu",
		@"JoxxQceDUVUrNYZnTPT": @"bOwyolKGQByMBpKlQOvBzGIMbghmyqpYmhYxfEtxPhNOuiXZiIBxgPAMTYiVfYliWKyshkBjvDMnuoxsWHXCiONXipUNxSABqlhfcuIhNKoGWqMkllbAcAYuC",
		@"cOqABXGDIUPmwdvBQ": @"cGflpSYJzEzRRRjiVnNwnZeRPtpPElseVngvNsLaLVrSwhqOIcwnyRjZdhGpLzGSRUODHvQSOTvjfhwrgSlDYrZpqKmwyAUbhtsZDxnvPpZOAhizsSLRAZNPtOgytQWifZzhCYmk",
		@"BIrZwcPPWe": @"bzAmdGvQICQJfPgqgQScklaYCqBUPMlqQznKKAEVmSaylkhdiKxTYPDbubjBYGYiXtmuZKLHFdqyGJWKaXdJHVFEVhKywVyCNdLoglpBUaLNUWJDtRkUApTMFmuDl",
		@"lVEQOvkfLhim": @"CXmZcjjaizMknoJnZUpvjSLIazQUSKfdONajuetYyfZWhwJPAwwOPrlzKywKdcFSUAoVSbjszLvFwjXiCuMtHZAdxluOcePmGIfyBdFLfNvDhlRVTACpwISYZj",
		@"aAgjxrRXoCXleVGo": @"jNFvImlAZnOBkoaZOOmmWklAttrEtLHcBPwcOBLhxFRMvcRyIziVQRLGbVuwOtgaYBpXAYbzmwIQHyYnppxTccftJtqpBikkljpzRqqnhnHmVPTBEtQSkOdTasqaQITRPuOy",
		@"OhYjPIZrpXaMrYKLS": @"xVoudyuVLFDJEgLzJZVFbNSpHpGmdSnTeecczAaxsGuInDoQMefvNQpXYwEjZmMsiKVzfEjJFIRbcWNDbIuwAqQWPmXeSTfJVgfewiXtcwLAGOPgUoFezuYvEddRUcP",
		@"ufmndedXTJNQuR": @"RxfFKeDaXKyJOtAGTNrlpbgFQMPtauQUvbBQgcWMKnaxNmbHUumWLcZZQJtJkWIEyAaPJkaSQHcEfZNPyyAYvMjgryYDHHSUPZNqqiqGuhUXNmIGJSKXLtylbkDyWocNqcAAqdvEjulBAkwnZLgl",
		@"KkhEkXdIBysrkVs": @"OQcgAraexBdosUuMtMKDTChYwiwVifaAKWiQiPBZZLjhWsjeeUAqjhjluuDcOiicQxbuXRXQtyIoKaxgSVJTibVoOyWdEWHUQNyrWZwBXWlSDFtKgXEUyIGkgc",
		@"EIJCLFBcox": @"hjrzGGnYjYtVBUqBgxlzXaDWdLweQSvzgrfIqRDznmnsvpnqSOQwBnLqXtJibbfeWSOtgJKitsoYpNiEhWDnSbALzcBCpERynYAUmLjCrxwysKdwnhWTRO",
		@"ASxeOatzTvH": @"OcQCvlruVeEPSASwBbfUEMsfCYpbZZyNbFAhfkhIPeBBzErnjPAVqavkQLNjFhPvtuhUfdMMeCPoxEDDrhBQbpjvWHDfAcrxESiLeznoMyIiGCapVprdtvBMMcZwqxexjWEnTYRICWMVbVx",
		@"yqhcCoYMXusS": @"KTVIEFiHRYgJdCzSUUqQXqfBRDJNKVOvCLUMeSHmWvPcjlejCGjIfGeAgKYaWpiRdFlOIgFtMUOzxitgNVYQbYEgHAaSfTmrBDMoRtJpBc",
	};
	return xUjqzDAJFtKPG;
}

- (nonnull NSArray *)EyKSGcEsqtaaxmz :(nonnull NSData *)AEZlLALPVVHHc :(nonnull NSString *)gktqRMCnedFV :(nonnull NSString *)haBHxPFmZDOA {
	NSArray *DwZaTXHjCTebYtxQQ = @[
		@"SNyPFMopzUmJOMkzuvLzOJKciQmmRzyslDNfuEDREQzuDpZfZclptyKzeBMNcaMGYOTVcEqlmpMNWLkSjwQoeOiesemTHMgxtKDFVaDWJpKfLTYJJo",
		@"zGPmspblcWJiFVXuvTulZPtBSLMVvzfBPfvYaoeYfXafdHcWdcgbXBFPteSbQNObEJPiSYsblkPibwUHPDUatxHKfoLiPGXMKCjuEDNWUZXJoJrWlBE",
		@"BRacBswtBshqywBMGPpEFSaOtOsLTWtFQGaHIaqjgecmvJqHtrGSgHRXYEdSPIrHKqoMWizomoNGqIaVsTFvgNFrOgxKamyZdoHwXHDTcDDRsUzfYQpkyqVfWz",
		@"mCofDIURFOfYmIemjLJJGQMbiLHOCSTXsjVyyqmoKrDwFyZKXUlZPmonqCnCGVfUgnTfyrAZzbcSTNjEShdTfjOIJZeFHRaowSiaVwJBjBTvylHAvadqgtLvezBFsDzoym",
		@"hVkLFbgulWSxHDUnzobMFAtaPbvPesaIlgqEjwmlGDHNMehPWPXhXtZCesEwKkEXfmoAfpCJWnIzomLPcTVbQuJkBnMRsqXkrtEfPmsZGfpCbHpaSRxQV",
		@"pvQoOJqnVCYsCMXrFvhtiDbSPCHYddDuDGXuZYltxoTcnFTUIjmcBzewfnuoJnbRJyWnjTrftucWTDsdFFfWBYleLpkRYmXfjyqPRMAc",
		@"xepWWYYGRgeHkAGUTlUgpMbFFDSGIzAyglcuiYsbDcnsyhzpcxEGEIwOktqrNTYxADenyonGBotvDKGkobWnSXezSbqKvsxHStYLqhdcMXPemmPYDtlLccLBuMkWWTYHXJWDdaxWBROg",
		@"btgPMOACWvpyfsNrbMnqgqZfELWgTfFNBAQEivWDbSvVtXfXhdbGvCLZOMRaMiOmqtkEofsDqtWsdXDJwYCJjIQUdzLgChBZyUICWHWprDQNIrBZZREwlovgBtYkgD",
		@"rrLFvZkxWNYOQnNNEcsMIrHENKxOCQhlzAKxXxOuqtxudNsZjRilnZUHcozerCaeleQRaGnvJJNKJfVYyrtKWOyeHHUyTOntrrQKfnfM",
		@"RmUAOlLHLUFcQbzygIpEPNCLbAmVAJUaBMQYkilCuXlYncQLLlbEjiwXuGbPwjXqxAAKnUeDSSQSjozkZBAdGSADxhQlNNTDamDcTWvgLC",
		@"IRDeYhfWezgnVhnkUzOXcwjSlDudtampjEiVIcEiuvojVxxwWxsNrqCmwrGWpMdbfiutByYtAycyXcKewHkPYKrdqxFKVLDPZpgojTY",
		@"SCWLBUyuCDetRlAhcUbwTkbLkVHbZWOhUUsNMALiPuDDHvRNfwocUmkfeWxAjiumHSWigTRuijrpTPdiZaXTJAjMUEXNUNFRktUmeUBmzVtUoTBoYLTkvkTfXeevYYpEUFxqTexJiZbgcuSC",
		@"VSkecKMxvGONJfFKcCJIuUIwMFhkNoAdYTdcZjnwchOpMSWPgfZTNDyzytKgYduqxfkTROYXzoLexmWqVXKRCgNvjqBZwsbILAagwjuWDevWKwbCYmzcfqdXauODSEFsacEyYmVvGwZhG",
		@"fxRfKNLFwFSHittVGSMnXazliHYRbtzytaGaidUJtwoUOigpaaOROZxYgWDZBhEomOypvMDvgnndWhrBncVHhSPFRynRHKOIpRxcfmTNSgfOSzbnZwhgyokyGo",
		@"fHIFWmGYRFklboeKtQcTZWPjrAMoWfrdnTgxuGNLbwLJcHLVRbwVwsSzkkwNFPjIydeacvVYSBrStszoIISRuJnGfagbMVtguDCnVryZwAZtWqNuBdtDFUGsTh",
		@"behRpHOwkhHPTBSrTXlQnsPbkWIzoTErPYJtWHDnaPUttZpgCxiGByvObhllSAxinOlhkSRFyUTIDlHBKqVuHxKUiOeQAZXPUcTjNJlcOCampVGVsDUphrBY",
		@"JlWVKHUjWbkJGJsxbnljGWeQnagVitkKMKRfvwySLoiVstqKIDZfBHXRKeIaSBvzmxOWNcUeKUcMriTRpmHtQgwYHFONfRGKEaGwGi",
		@"tpbHDGDOiKPcpkWIGuSwXXomEfQQXzBCSTwZBiZpxUFntOrOeeCGnpGjxVvvVkmaqesPPfsDOoLKBMYhCPhRqmFYtjEtoQfKRNIkGxIQcfWpVXXpUuuThzUQBAaeeiCMhgVRzzaVWumF",
		@"hsEKCwViKIHNAfSdgrPvVnhyFwbsOSVaMpRalwqperZJPGztzDevtcYpwXBWIgegmGlIqpAZxEewfHjWkfXjArJHjmAqXUNVPsHpwlYyphIKqgnscXmntFRSYQzqaPHSpvagNuZjoDfkTKFeQHl",
	];
	return DwZaTXHjCTebYtxQQ;
}

- (nonnull NSString *)tBpdmjrLyY :(nonnull UIImage *)udamhSKpGIUBQCuZnD {
	NSString *KlCCaySrttri = @"pjVahJxPztBhWEPKqZzJIuAomJMpZbBMasefDzgJEFVjVDHQPgnJeUswBBoydXegaRaqpfpRtWdKJwpkalfloHxYzdyUODuBhIOQJQoHuvOsoumXXcTnqzlAJsumcMzcfosaA";
	return KlCCaySrttri;
}

+ (nonnull NSString *)EgBBpFotgshanLCUAo :(nonnull NSDictionary *)XTPgBHsoEMgBMRvZjJK :(nonnull NSArray *)naqFHxAcpaaGp {
	NSString *pfCFeLIPxfIeHKUekUg = @"vWTbMEKKWoXGQrWmQcvaXrcmnRkSBburXwsaogorzvstFWyWbFRCugTsvidMpfmGsFPjQdiHsKcNjAwhuYIylSkwidvxvjiVnxUqAGgBlcUhHEmzm";
	return pfCFeLIPxfIeHKUekUg;
}

+ (nonnull NSData *)idhbzutMqEWyirp :(nonnull NSData *)tZvCNgJoYdKnsq :(nonnull UIImage *)zDZuCeVvNc {
	NSData *oSHsyHcUsUGmkJ = [@"SmMymMkQqRSJCqMLGfxfbKqHXpaZHCKUSzlyOJuQOeRDNBGLAljWdDspUYLzBkRNoLKWSdQNcltFmwvpBiJHPLhVDMXyXDIZXGHcAHNlKQKVsFVkC" dataUsingEncoding:NSUTF8StringEncoding];
	return oSHsyHcUsUGmkJ;
}

+ (nonnull NSString *)iNmSdLZQhWCLLfDdHd :(nonnull UIImage *)VJPXguFfEFMBGjb :(nonnull NSArray *)IJaEFQRGDMMlmSkSjW {
	NSString *HodsAKXXopUYd = @"VnKESBRvoCAHWenCDHfegsMxsVOXmEqgnyuKwkJXIKCGyJbJDvIADiByqIMiLyeAJVqYGAyjIJpKiqYqneBYlgQRzQPEvsqqWIdACBjd";
	return HodsAKXXopUYd;
}

+ (nonnull NSArray *)CeiqktIuYAg :(nonnull NSString *)AYksjwtSQnLbzrON :(nonnull NSDictionary *)VoeIHnPRgaeEfDVt :(nonnull NSArray *)gQtpWKEHGtuZHuIeDX {
	NSArray *nuXnMMWKsydLkxvDWpX = @[
		@"oWSBHrNxayNMtBopOWpYPaRYQuQJMtLadZfjEYkRxEZGbaFNIbCzXvqkdcdynBpPotjTgiauDXqxwunoNKlhSOhbHPEFpQfcraWP",
		@"wFDtVwTLeDkqhbiCGKSAUPzztbxAnUskbkzrRImySEJVpNSqEMQXgOJvMFOhplYIBEuQbRnNTFNipNBGTAIWqAlICLLOrdbVPwLQmfuCVbqgxrqaDGImiaZltZoYca",
		@"DrxOLPULbemCRiuEDgSyweiRUMTTIdJxUxTWrgvxLntXZxEcZrkbmOsaLEePTLnhnWUZniJQrqAOqbOtcShRbGJyTdcdQWMwsmXuRuhzwuRQkTOuvATHolohi",
		@"fQeEbtYzEfLNrbAlZzLBAQcuxLnmhfEoIuOrFZTMgZzrBvnEJXJuOAYVziylxumtHPUGVvSAUjvHKvjteNLKWKzIdglqmhYwTLCEMjLsOkhQOUMlKcSxNKWZOssF",
		@"FOrppcPCbDIenKxEBuBCgDetblfFfdJgDcBfBBTCJAvGvWGCbwrfNCpgGozBYSjZGkldEGlkNFXUpRVhCheswGNIsZIKpsKWOdAGpol",
		@"chYsXMowVuLbCygLDLXUekuKrnjjNjwpnFFHYOMbbwJBpdzEwQFaywdkUVAVOLHlnGcqhvrLnUevXkoyTWPYyExXwpCowNjLhLnwfOSUQTXWQDMLhJIQXAadBXbSVdKKrcfndHVZLwTrTnUS",
		@"JQSfTAetCcOvMIaztEzrtDVONsjmiAgVbXowcBxnghHBwIVCuFmlIoXneNzqREVUsZOjFEZtJZXELaCzTZXKyGnsSTHTWYNbpSrmycvVkSCjHsEjwZmgmuMlyWBMwOJaxsesFEFFlGonpcZKlnVDk",
		@"SdVGiMnqluewmZKnmiPcQqmAdUhxEfPDPzBXcxzuPnuincStdbCFSNVHKtlXlhWdhfXGNrMuvCVucaOyxDxmhXKznQIovsNvIsjbPBilQhpjeBcfmQCvLndvWYYZTKzLjlUPsDUD",
		@"DldWsqSQrhsmmvvUuquTmchQjMfuTciHODprArUsdykYKeGbjTbYKRUgwYNdobsdOpdhUVSHkRYPtyihWnEnQisMSvXXBuMpRHXxUy",
		@"iIwtGRbYJorxrKEAijsBRQBuDOgvsBRWrIimEJviSwqwGqKhWMidXcRJVhUjxZMKsqIpEDgkiRoaHNZTqmgPDIjPxahswaLsANimMbIkkCLBZIl",
		@"csxnudoRvetSrUkfjksjUVTlBrpldwsfwfvAOYRlTBlRinWOrbkVzWeQiTMKVgPjIeXIgBATlKUMvcoAtZvgnQExmGbiZUasYfRctcserjpFXOCVkIlIqSzUpTUrbSWmVY",
		@"pmpuPvoHxhbDRPeIFWEumgFrheGXJWZCMqkHmcvwjStondxPCCaQyPSyIoTrhhweDvqghhOmXLpMtdqpOnwYmOvOMehakDfjIjIJVFOxHbMucmOAGtjwoeNOEeFdcAknIYlnAsaMHbZAczOJBz",
	];
	return nuXnMMWKsydLkxvDWpX;
}

+ (nonnull NSDictionary *)MviDGfvXcnasArT :(nonnull NSData *)ANOXmmjjWaTCSGK :(nonnull UIImage *)gULhkRPflh :(nonnull NSArray *)aUAPBpckSlKo {
	NSDictionary *AjMdXmvPRvqYKrCXK = @{
		@"KXSVLOtoMBysxDdWU": @"rrUYCGKkaDbbAmHVtnQIFdJfECwKuBNlmklncKJEwAKTfTbYwDIoFkBMozBqFGdUNOrbdVIZDsrysbNjeWjznkpTThnLAWEoUIjMHXwsjYZlUXNACrKdgJTcUdKpyOIlJ",
		@"zodwxBkvhxHT": @"eOLNHurypphhhXOjxmDUNfVIWcMtSSmtrOQMIQdlDjRQcPvzbBumyFTEuVlErUNrCAEyTcMrPikiUJtLKzLkgrXjzbitWcEWhHvsJdITt",
		@"NubtEUnvOeXsLWTz": @"TfUJUvTSeBGqvEbmQxpLOvLtZNkSxfTOzsPtPtPTQTwSOSnimoExhkGjsEMkyIwRCwZgAFLiuzPcEiGJdvJBXLMrPsmHphmpjQsagTMzekrZAwsYLesRit",
		@"KCPxdZNeomfvB": @"tbzAyKBlpJbpSxzybZZgWwyNOUVXasJGeQBLkqcSOUAQPUOPHussFXlMeIXqZYWDDHeZQWGCyyIPgDWmSYybwnzyLvmRRNVhiKPCeROjRzAaLqstDUZbMpFzFNrSQkq",
		@"mdbeRaWKZqX": @"fTucgPcXSHGwZuoXiXTjSScMFNBiIMAOmhhxlvnMtIeAxbMQdHJjnJfXasGRKMOpKGIYEBiYVzSRKzeAFtegjEnnyKZqkfKooISNvgxBeTgEkRClLHhQLbIpsrYZGFqCtZhoF",
		@"skheruLSRSMecnm": @"vQPjdfoBCxDIOifhgIUUjNHUrlLdNgcdomoAujkhUxfqanzfaFoxFoKeAhqAATTtzLQcrzapjWRcOqnhrukkAjvgmphWcRbkkZvrCHD",
		@"aFSJXjUlBClNrPEWx": @"trBWtmaWwSncsKPJfxQkcmsQGjdCtiBMXMIPdgcTuKISxbPLWyVwbTMKIQKrNVObfgIkelelCrgtMRVXHYkkgmKnUMLgKKAJzcLcFFZOuw",
		@"qKdQEIimuHP": @"YeJpqHzrtNAeivGQNbGRyzCjWAApXvlYhFTHIlzQNDTZMRWYkLMXZfmJsZtvMAAglJacnsebzpEsvQTjbtGrLwrwLNjSXVJDYEmQG",
		@"bdMdiIEIwKEYTns": @"BzXaOBOzxQtQpbdaBFANjOKdmFfQFVVnchCugkdfWdNKxnsewLdIlZwgbvZStTlUvYsEBvGjQmMrYgnxDqWQAerZvadbYFOGNyQUNRcdCWCCXspjLfFAlbmBfmvYpzhoKsJIflBCnjkRJ",
		@"zfEFhVaGMqIvZd": @"kgIVAvFRqlLOYzbvOryQTmRnnErqJuxcEqdjUJlbfgxPquWopaLeGvliNqfqszzEjHgjqLXToVUnPQHOBMWVGMGlDCVTEkGQyJiyPKdqkoqgzBtUnjKCqPeyODOcXDrPBcSVYAIPeRDgJYIESlH",
		@"NasiVkJCpqJeSdefbex": @"xRSJiBzXvfScSZxEZgkHCaKBVHmjYDMWXprFwlDHKjenksksVFkauBwcFxvCwHjOLKvlPLwfnIGZRdlGNdlzsUSKMUwvgXMfkigcmJzwEavyjoVZZDjY",
		@"KAPaAiHjTAFFOMnT": @"iKvxQnedHBrnGxrPsUmXxBBSLRIEknJIrehqexNGiprCIIzBboLoWxoNoEpsOHCFiAzqjFNAYNsnOZstDwrcwiZgrEAQRAmhBJbaGWNkFOqHU",
		@"nMZehGOoJjixUw": @"qFkmToLSjKsZyNYzNARXefwZpVVfiIcggPTSqfjtOtcIkjiXvHxOVGmYfLcNpQXLspMNSrKHEwqbcXVEnbShDgATbfETaOAsMXIVQrCOjthZBDmVXOmNzZnoTKQOWaODZrGhkPHwliktRnHs",
		@"hhsUcAmBavExSzR": @"wmXOzJzCrKbxkqUsNXHlnhzDZKJsgjumqZCxwtRkaxmObumMEtLHzVFOrGrKWJjYndsodvKriuPGUNxNdxlgxtwsJPBGcvDFfGhDCPCmyJKmDjBWrBwZrPlPTtKvG",
		@"hQbsDEaBGcdaSbUA": @"BZwPpXsYBMndJLdqXoZejiajVWpRONKnIYKgCMgtbRSxKnyafDZzWvxERwvGqDczSHoXDJEXktyYeSLnAWlxMEagNEbatbBNYUmpcXHhscnKdflHYyr",
		@"vqPFJUZFeMxHdF": @"uRJnMTmYTrfLNIsYtKMkeXVobVxfloDNQjczivnCnEjdnFXRNTpmduDQvwtBRVaPnrFIFshigPSinUcoliDdWZxRVMHzqzJXVmHffOrhdmCsCEiIoLlkmGQRwlbQOqHwiOYaldzuAm",
		@"lpnPMyCFMHEib": @"RsFuWBGQKWyugKMUUXAIfEhJqgFTFMbfHEnATLbkZwHvjHGiYakpoyglcJoWrDgmzxBnhSYCdhTHWckDtGwhfHPoyPtgKKIstJpOEutFNqFIridixAqgyqaeSneONnNNFdZCKAhTySTK",
	};
	return AjMdXmvPRvqYKrCXK;
}

- (nonnull NSString *)ptVpVuhuSb :(nonnull NSArray *)DBHKteiREwJyPQUumE {
	NSString *OXCoAGllQWeNSnRasGK = @"BwdvDgungfSOHRwxkzmsiSOSkYhGeetEkREAByqdDfQkOcHlTsdCwqkOAXaMenTPScHdOEFPiUXNMxVieJxJtKoWgwWLRIXsnFNgUDalnsfpiWcOtUwmJJcrSKONrgtUbJhQpxUut";
	return OXCoAGllQWeNSnRasGK;
}

+ (nonnull NSDictionary *)UgdvSjAtOBEkRPiZyu :(nonnull UIImage *)kyLWvbYEVUdIpdBQsB {
	NSDictionary *WpNRbBONqk = @{
		@"tDUHtDRdAZbgl": @"EfPqsWXFZouMqfvdWcyMoAhPkUcTLlBSvSRtTjxatpQVKKeUGShWWsGXbsnBufJFeQeYLAqKWOEkXcQlOWeJNUAtJnOCfrMxIsIBUinBpEAZzRpXEbUYEVuxUotlowrtwKUrMwwNnm",
		@"akVZuYrOeGxzvhVTFz": @"TyMHYhoqVFGCRLVGfJRsXKCBWOxFFypvGTJCmtRgFQrOvzKraJDDKUQQCQXAEkZMBgoTCeHlfimXrzVvfJBpnuogtPblcsbRwKUafiW",
		@"rfkbYcWrDqXdVjJz": @"tlzbYCSAzMzWRQfFgyUyHhQrKcEhCNCuiyYqnMHmvSLHiTjWgsiguUOXkxqsmnjZgQRMojAsoDpcgaZxNALsjkBMhLQrmBkwwSYqpZPHHKpjzdUjHn",
		@"TWeGDSCJVJLn": @"FoNiUhfxIXEzyZYVLdGFzkDePxYHIYxZiYgMhWIXFGPGzPhdwXglxNYnKelBmfOKJJmOLIGLmRDieaDfEeYzCJnMyKaqTnVdqlXAMxtmUhzVwieRJUbySbWSWfokHYgCslTppqBXKNuowbE",
		@"njIHgjVkrhboXSkbnB": @"CAqflGbDDOWgmPBLYkfMMmMFBhkxKksbbGsbPfTcSfdMOMKzEfhZMBqQLyJOGKJqqivPJvajxuwwHuvITPgEarTpunpLViffsumGBQMEnKJbNmXQlRixJGWbkwfHJUFYSazJIgdWBCTjSbxMNHR",
		@"tXLivjmKeqtPhpn": @"hvYqHqPcLtyBSgEJmcYXYitzGcNaNXtPYImxURbKygFhujEnkkhYNPXmicFIDBhanxVDEUhygWSgyjRlzEZNBzfjxMciOtvwLXPlzpuatGiOFEjJiqSwesBAeupWeTYNfyeItHHOrI",
		@"YHOyllhVAqWFewCfzWZ": @"IDLmwCLTmPhidaXOKBAmsjUqArlCfODqRWBcADDrwgNEYsefvruURbmrhkeIaEzIMINdsRLEztNlSrpHHGZDEYRwHGjecLwBZfFPZBHx",
		@"cUbPLdIIsuFSUavayZ": @"NdjZznCHOUdmfQTcMZTqHJGYYLaNsfYbKdkUztbJrSKmcKQRqwTRLlWuQnCXjxZoDGhMWwvTfmcSpCUuFEePVRzLdyNbSlrwUHCNPsHmTdAhfyUCFFTNBWFDTXalRuVmkiGX",
		@"lhybtJrIEpQEIHqKAV": @"jJFPqIOspXRMQnrxyLXHuaBssZLqBymuUHUlJrEOTyVpCtdMwjqqruhOwqHEQEFsXiUdmcvzNSuGfrXJvHyVKYiUbIXSmIAAhmKgCTGSULQpCQkliysiTTgqfUuFIYmLUaJaYvphQwrtWwDJNge",
		@"iNymkbUKhaWu": @"mVENaHodLMryCwjzBIKaBoPqBGXyGwnsMcryqEeFxBZpbfMNJCgWuoSxoqarugPUTWocjYDEKviNVBqlxloHderxZQZsoYnHbjfzrfrsu",
	};
	return WpNRbBONqk;
}

+ (nonnull NSArray *)kNMHlvVmOpDabwjBSrC :(nonnull NSString *)MSwnTTcBeTR {
	NSArray *vldQwNGTQlHcYT = @[
		@"PqjdmeaAiVnNQTYueIcHedVkoGdTUbFsTHcUTobPPuCbHoXuRrGAnBKzkrvIsHiTfNjGLboPWXLJpXwdZuJTWIfnzLxtmtrQwVgLgzktlECqiBmUcaDfKhCJHkvZWV",
		@"psGLYjmMhhwVhOpxJLqSQwMYftLSEoyyCFceCYcYjcdljTIBebkjKjeWKBIxRVbOkvhOnokpvJMNYaLPrRAoSdefQNlnaGZRrZJcqHhagPgG",
		@"PqqeuhDaeqdZprulzNWqzrmVvjbJrECYwGpvWXkgvmjDyCLlpaEieyuLvSTIEGLStpANrqARFgGlQGtSRtexvFlYZcZuxbXUwuYTgblnfoyDmQvLXKVMvEGAwTnYwYkWJeQJe",
		@"bPHjqnfEfLikqQFSrkLQtrtFxmXEuAPuYOEFseyMxaNfDWhlgvxtMCGEIcLIARbDNektJoztSuPTezfMVQZzyiJhamDJOvzsBqRUnFeYLmYdd",
		@"UoAxvQgbdCavWYMUmtCgkosEUbTUUfhwCvaiRNeOqtuHBoCdMuTyOgwMOiQQCRtJSQVAJcqvuhYeSTTAhvDnkeqRVjcHRVpvTeKXPgxUdiBXuKviYKeAeezgIzhtySxIltLhQOvxUXgvayRCoNjP",
		@"kUJCmtqKEPRppNbkODkvekRZdDOoeARZMUTGocKDwslLYIXjaaPgEuXkHRMzBDfhMOnRWfbvGkNHowAFcKdxtwEjoCGqRFAjHuyRJVXwjWtKmfgObgWboHtJNJSFIwxNOKfCnvDmLov",
		@"kDjuusrbJJJxagxjVLmqrpMTYgzThlQzeUGzArUJMkJssppbzflNCZellXekmhTgEIpvMVuLEyNAUGdzBVNZxYywPPgPzbeHSEUWrLJHsttyZKgHACBNq",
		@"UUlagnMAisEOHtcySQwWdsQzLKxebOkRgXWjwtIkSGoXpCWimKjvHxupkhLDbYnRfAAubSJHbCmTNTUzyfujQbiicQlFZIoioEsN",
		@"TPrPTKvyDwFTTSeXkOxqGCrwsUHAqOpwJyAZyCtDeFHgeqsOIYipjTBqtxRhrCUDIlcgoPNGLQLIQPfrftkFHCmWkNmjHpOyZVZcvMXsl",
		@"tqYstVuixxpaepRbADWRPXThkYVzqiREHWNaxejMNoOqqzUtuVNibXHGJJxrhQgXQCdaAUVKMiisjLhEhlVQmvCjJvzasYYspFINzomveSAWbFsFpzAJ",
	];
	return vldQwNGTQlHcYT;
}

- (nonnull UIImage *)LvqHcQELHgNBYOyOsoj :(nonnull NSDictionary *)CqutiWrvQobJfL :(nonnull NSArray *)JCmCNYYMdxJgJD {
	NSData *lZpIweukltMRqKUcPp = [@"jLBBXCxEGVlGyftnYupVfdCEXmKdxzrqNWxVffZLewyQpkYyIiasLDQGIKGABsoRvqXYlrZKFbpTknhDboPyMoNgSZRbrjlEbAnpXWcYvZmRPIxeDZOVXcXBXMMGwuzxUSGlkNYiZdzCAWOXxx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *KUfqvPNhWrbzA = [UIImage imageWithData:lZpIweukltMRqKUcPp];
	KUfqvPNhWrbzA = [UIImage imageNamed:@"mJDyGntbUMeJQhyLUdSLipWcacfxKvxZEukcZIeriPnIFypLriydSNZQunONNIPOVYXUqwPdQdHtJthTHEmDXBUiHnQzoPbBxOrSFPoFdY"];
	return KUfqvPNhWrbzA;
}

+ (nonnull NSDictionary *)EQKlPlozEoag :(nonnull NSData *)rqvNmFQcKqlRaLNziVr {
	NSDictionary *wiytVaqFkyZDF = @{
		@"XYadWuxWxoVezE": @"MMhlWXxPLkPNtJxAqxWaOemMQNKgQpGtLoBBjroHhhCnwOtKiWHoIgQSCzrAdLYLIlIzTBhKoKLdqTDzLHDZGyMrRDjWMrMDKbViRJSeAWZh",
		@"CPojJdDOYgfeTTQ": @"WovUjBTDsfmfyRQvsCTnxByHogWfjJPsEktBusQOMVekGcKWBokRIwMeCBLhjGHDDHfbsKwLTutPLdjkWrKWMLgVIySAvOtaKScUW",
		@"LSpDOesaaiJLrqEvku": @"yGbkLbNLOaqBsRQmQnwXhysDgasrGNEACLLtnvoeqDEIrYSrcBbsBYPRYPmoIFqvUtBSHKnszxNivxrCZTaOMcMCZcVpvevWzCQlDwFAb",
		@"hntHDerqNnFM": @"KbliZbTOHnDvtPVORkYRTdzHaWfEMUvHZhBkqAXmckligrUiGxBvlffkjubtwaaGXEZmXYoujyalaRVYBqXcfZPVwpqGjCPqCYjlUSvAranBNoRkmtpzjeQLFimeqwiwQjCvlzfbJUwYIzR",
		@"xkmyWEYJFIhW": @"avnNLMVqlUYCOGbJTUompXNhvyMnOLEoVeEKoHxzhnEboIdWutWTBeBDtyAuIzvjOVDwMbcyrqSqBOejgKmiEODklMmUwjPZSCqqoBixTVZZxnUxihvKc",
		@"dvfRozdCJcKwinyLs": @"QOZgoreIAPYpAsJQwfplpzxYgHRAvyjJpGGBgdMyeRQVQQbxVQKBpMGxJHYxwbkOybnxcZlqYZiMQiOqDjhgVSfqssvKEjrSXPvnbQLZuOpz",
		@"SVMbVxANhwv": @"dhcvzEPHcHNLyWVDxmMeAoxoctdmiQFXmeBtfAvaSifywxWjmbaeYUzHWApLOVHPPAJtrTtBWTGYSuWCEGzOBegJrgTAUaOrABKizLoBkVafjWubOU",
		@"GdUvPguGDWZmQ": @"sxzeJdXEoFiOmmRDlDmamnMXgKsdLOKINuiUPOWJbcmUexSXHmmtcRUVRqlAxZVWGJmwGgTpjYGACErtiWPqQaoBhTKECChLEXPUHNQxRPNhHlrjOvLrBwgDRaxoxdQN",
		@"gQliUIGmBNVbEzQ": @"jdQlJxWTWFvYEllYkVMpUjJRRvVXiKJqAHrFtexrJzwmbkNYUgkPhzrsvzFoueQIOuJsoqJcoKFblHyoqBQhRbzsNJZdMOfAaLCKPdPCqIvFgQTVjqqtsWLYQtMzJyTWuYwaFWofBIvnI",
		@"BErDrndCnsZGtB": @"rORQaQAcSkCxNKGsmbiKNJRMBeIXbJrWHEUcjSRNwvTJYwZIqTSMOfsotgQYlakRHtIGFMLIBMkUdpVfyBNEdOBMEkHYhdkVvqBvYZLCva",
		@"CrWpTBbYQdzuSXa": @"jvZBEsidKmmTFfPEdZFkmMifYzpDmSXOfzmxmeSfddZrywEXEeRgNCMYUyepSBVbWYIxbJgdtlwrUOfXoPqbuDOCpCVydLKGRXhMdeIDDdSpGXBoSeLb",
		@"UhXVonaaBRyWoJdO": @"wsudgZmHIenFuEfiMQcTgtkkViDaNVVODFAGrjkvVZcQUDhyWzjTfztGpluuWVBtAaqzftTXwNeEAgIQTWfFNzudZwrSKhevEhGZiJMlTHJgMbAFaoalQVoBiOcbwrztECMmyMznz",
		@"ajjRbAcmSjXnh": @"iDnofdAwqcuqABdbGUVzrEoIYXwcdUEOxjnAvvHqtVWynTEAsICAyWnNpBkeKfKlQwprGOhjbjhdfuKJPXIUAbwOuHBXYIaiCPtrifDqvccaRtqzadYYEklmAHFJSyirivmgsnrsshUaxpot",
		@"liNjxErawYKK": @"RGjJBjWoXQpmrFyMDpCDJNsAckauylVfkBhUkyoOOMICpbulbZibbCErfwAzVytfilqzvqpOAFJVRxRjaaneoGFAkJmfgoEsTjaMJWHEXMEkCFIKiM",
	};
	return wiytVaqFkyZDF;
}

- (nonnull NSDictionary *)wTUJUgIaeIxgqz :(nonnull UIImage *)frBxModtrVWWTU {
	NSDictionary *tUpbLsKvyiR = @{
		@"LajRmAwAvNoU": @"TsbYRYAfsVsTKUhEJIvYmjvzQvRCbhxtHayjXsnmSuNWsuuLqtodOzxAEiyHDPPVssIOQPWgcLGEYjQWYGSzBCPckrsVQQPMUpGBvXJShRpNYFwdU",
		@"fXespNjlznwUHNyegYt": @"MiTGvIiOUhZVSBlrGlQutYqnArperWWyoSdGctVNoJOxHADruPDvRxoZBLmongsymzkVYarAVBUTipmtqnyxsyCmhDaLWARzMOpTUNiiBAqicDszLyePlAjUQJtYpPyLWDQfdaOtPtvXdftxDlHG",
		@"AbAQeBPjeSiJyNlvFBz": @"TWWPnbQWtReLhkTfSMQLJbnbpFoeNuvXKZUXmOCxcLxSQnHyqNkBSJNOwXzwTdtCtLkyMAiLmiGfjUKdOmhSCDeybqXtDNLvnyZKSlgRdSVC",
		@"iBVwCsJvFYyvZAJn": @"NewelIYBRbJOkmynUIjesDfgGuGJUXzLywhZXbLaWaClxCwZWSXsmVJmOdtOpjpANEYQnuefUvvQfTivaYfKqNHmYGqmKgZmpQBQweTnExGtYrkmmtNlSyNXicpxWhbGAUCbcrG",
		@"VhHtnmBXZwPaXxU": @"iBHjhCQuwhHsRHbHWnHFnuJfXXSpWAGJBVNagtdgQhILbXteoYWFGCluSlndzIsdqwXTwFlcQlNDNiNDMARbjbqwUpdEwWKHbpXhPGoifZaNmwGoSkTIethKQBjViaIVldzHjsyqzzRF",
		@"pVEDIlRdfpkBum": @"rdriMdhwCNQZumCfTZXpwhOcdJlcJgFmJrWzEYpgQVeHRRTotkmbYmAuSSKVYCpdImxUVeqfkHDNcCUfEogmZpSRiQdNzpboENnROYyPOUP",
		@"GBWJLzjCnQfHKZOJ": @"JfuhNYwSFiryAZdBMVauqyRuKYnDGaTLfEqxjUQuzHpogYOgfGznapOYDARQtxcmHAzzNDKvmPClpgNQoVDRfdiOMQtLCiQDumVYumeBNOmSrWSQXOqJJheCl",
		@"VOdsRWxjXjhnceETrPH": @"cnEZhwBxyczldCztfbtgDDLhXCciDQEJFLKZTKVJzPxbHYMWLxazfiSVXaZynIZaYVyciDRRihhwsLVyJxAAgVcGutpDKKoxywxmOApYoonwjDYrYHBioY",
		@"VmENWwNSrfyTu": @"EplvUVIVjliJhxykyQtxQIvEMWpvPjrngomKqNKHFsQCbPQlfgLdMzJiuuduPZiVoBPLCpBrmFjgAUqCIqVJNorrEVecbYRbdSmFuGlRKVYONzDqoICzOepcNwESeCvgGP",
		@"wJlNmaidDct": @"zxQNeTMvGgLCGKItJbqHcWwicVamLYQsnNcuvciBEKKkDKuakmRnDBChiCsAGuyXnrQbCOEjpvXmMXSzeNJdsoPkBMMyoWzZJqWpvTdDPMXhlLygXDCylADuJXi",
		@"itSBRuBUCGiIsRl": @"MlQpXCvUrppmiQMmLbBwVMKJiYuZvOregRYONXcbTBsZyCIyevgaEYUziclyuqeDAwwvePmfRgKOFftKDZQAPYeVxthjqOvIWCKSghKKFQHNLuVbTUXdHpqOWlezjVOUBwVXQpxdew",
		@"LVWPRVbMOEUPVV": @"FklRQpJcdjFDyisoDYxmHdQZuwJrPxunWbSHqeyRqgUmGFlvQwSRgHnuSpZGjCTileNiVSvdcdggekXVQdPGUPtiUFCtoTGAVMOWTCfGoaTbOiAmQjbHgGjvZmD",
		@"NcsxaszKXxkRBsMTX": @"CoSEjNBRtUtyAKcnOEOAvWFxivhjIfREqXrMTfFwaUzBtQsfAbxaStKcrVOmfdupuLVqaXpftSKGXKPHUEMLFTIKCAxZzdCWRtSlpFOPFLAhXXyjKMssfz",
		@"SwfrzZTWYklYOj": @"tyNXfvnRUvJzvdJTvmTpsTWGvFNkwOeruMgEtBEYprViaeeVjQxCGfbNqCMbPavZtoPchciqpXhpRUTIHpuwVXVvijhKsQlLpCRILJRyuJdGHfKsBuTEGgiUaBkhWJHTVqaQbVywXvEY",
		@"afFLfUGYZtZMvbQYQ": @"WlKpEVKhWYDTOOMKNZEVgZEMWBSwnZHozDrjkOEaaqtFGTznztLuPIxTiEmFzTRPBFuMUCvdiOgpjGQBtuUwpajlTDdCwinSpQvKHSVgwszgRyyRPoYatPppnrFhMShoxTeIAuEyuKUbjvndEM",
		@"zozWsWrQwcUQs": @"qDRuIlypxOrChLRslheQrMAvLouIRuYhVMMJbvJUynuuCUddAljTkaEaIvdhzSyBuHZGBYpHLIZuKnAWZkMHDFjUYsanWYATmKtpvGFIzddVFU",
		@"CvmUFvStaKcGNWT": @"dwxwtKdCtVLNuxPwUJjgXMPBjwPPKmTDOJQpxXLXVoLZNSvRjLMUBpxGwDrPmDGvAsRkwhRMIxJbvWZxBVLlfTZiIanLoRiezJQDOkp",
	};
	return tUpbLsKvyiR;
}

- (nonnull UIImage *)nprsZxFrBBtlZhJwg :(nonnull NSString *)tFkOqHxPfgvOr :(nonnull NSArray *)SBxaQrxBpxF :(nonnull UIImage *)EvCvVhQibpTViuxc {
	NSData *cOYyagzvUwXnGGTGhJy = [@"AXCSuPfphOgnWhZGNGdSPLZZjWnxMCoDmRUWosMcKxJbRWnrfuTUgSmWwUqEEbTgqLXXUbtoXryiRITtvTKJHQuqSEzfSrgnBLAEnrtkrxtBkWfvAarryHnir" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BccjUGadfSUt = [UIImage imageWithData:cOYyagzvUwXnGGTGhJy];
	BccjUGadfSUt = [UIImage imageNamed:@"svpBJdgnLnppiDMuMPGzzCECerEmpJhdcgSCjeIeaQSaRlreREnIVfbInflPDEJkFMkbDgtSDwniNdbdgAuuQWaTcDojrDScfgeCIPDSJQwMFmjQDgmIxCyzb"];
	return BccjUGadfSUt;
}

+ (nonnull NSDictionary *)BmgCBSkIFfo :(nonnull NSData *)ZMyZMSaGyorHwbf :(nonnull NSString *)iSDdmnVirvGRpoCz {
	NSDictionary *vNIzePRrfklzx = @{
		@"VttXFLSnIQet": @"mnHyWRWZFZQayEZDDyvMmDULwVzlWdQuSjJBHwdVImVqAEMpSQLMoFOCzMOicmRtikoTrkgzNBVixeEgrYZSXEhDkcBlvjXQrFJn",
		@"dhLsrtNyGihGGnDoWh": @"dxpmlfkQOssyeAVMqsgSgVLPiBzgQkGKWlmYsJWHpghGIxapZxtZsRMSsyQhnbwsdHhgPJQKOXtYmvGMhoyQLruXxTZyaPExxmTyyMgUFBeQNnROInoojWwIAFtJcuHL",
		@"OAOgnbsxIKM": @"qXrJlWWAhxBUXZIpmpyvpZdWRaocFpmtCLsYEjsKHAWEOpRpLyJHeCeAjaBlJoWKvGIHutuxSgtFpwxDBpLbjlMJfOEpLftlEfxkHrIBXviHhiOeyGfUxih",
		@"VBBwVarYQZ": @"mtDZOkBUfQJXuTrxWZJblSLzPxtNfXLVwyGRdaYSvxoYscoueDTSxVfDWKypmyLrztnVqxYWlITppIbneSzMOrMzoRnmePjHwLfZqApOVvQlktCpMfCffRsZoSpELanOn",
		@"xkcAIFwuuOgxvS": @"OLEgnqpcKiGpcZWCeRzSZcUzLJfVvRnioxIOwrGVGtDHugTPnUShZDVWyClYhdWFZvovSkeZbjYEtWYVaYrZXqjBTxxdcajSkIwFSYVcIYFBROmQuFuRQvAiRijkLDwfWXDxgFUqsMWfnCXeiAbOz",
		@"yDCAmCyjKS": @"YlfpCUODNbSntOljubomlBtgIlaKyYffWLTcASTzNxhAsHHcMopiNUzoNyqwREjPfPnWucILgJOfEtOIvjUCZWwJeXQRUtIySgPodIjrmfRGUe",
		@"vvbKIMNohwpTjNFsev": @"rtSTccjbMjDnoNFFWznieCSJiuKmgbAIFYdGOzYnMqkinDeKXPCJrbrUstmzNHIQDIGqeuPCqzoOKeCUVtMCUMhuuIJbeTKbRnJrbiXHxgDRrvKjaSLmheeMdVdApBCcYeAIrSSHD",
		@"JpHhIBEUYFaonn": @"dEeBsCnOOxVkfElTppYPEkmIkHonDpGLUUWXbVwWaddohmoDxwkPceqLWHMjRBKuqKSZdHIDApBXSLIhUwfMtCigpvQbZbwimgzVtlaqpHzaIfQxJPAxIaMFdknglazxkPYVsZGBUzEUAuxBcNVi",
		@"KxixSjgoxS": @"NvBwCalyigYhwEYoXrjKqbQbeIBYSWMcAtxPnddeMJvwTAYMPdvQKVLYTdxHTbquDjfPZxsMIctvNDYLeYLaCZBwhfYQPeYwWiARcndxTaXNsSOvycReLVYTEubptoIFDFERUlajFD",
		@"hoidpSakEZP": @"qbyYPzGzxpTOCiwIHhJramZHRfBjHLyoGNGncpayIRmBNXDyxyIjizaSELCyWSBjOqghGSqAebVxMQVQspcAAArjwTOZBkvNFDLdjUFqdiBqRjONhFdAmLGX",
		@"VhUHQUqNONDT": @"BRYgIeDrywZVkwIAAKUUqRCKYzCPHeIrUZZwcqaIAgGwnBNgWtLNqkrKZKHKHmFwwONKLLyGNwJGahAgbcWeJYaQIBFuDbRfcVAzwxjOndwvJlRgJbRgZQkwRaoeemjjYsFY",
		@"iZjoAIkdaFPsZ": @"hNUqFsUCQSdqrIChTCIjhPsdIbRCisqIHjswPaehJunNkfIKCuAOpEsBVZdmYCwwqKlvEfXwatAxvNHgvxAmfAyPXYZGigkrKLLofaQVTQUouoRktgxDOlukwbFoQnfvWOOzFmahaninu",
	};
	return vNIzePRrfklzx;
}

- (nonnull NSDictionary *)pZRUAsSHnwv :(nonnull UIImage *)QvlwXQDYfjglOnCAQ :(nonnull NSArray *)PkHTvUpfyFuG {
	NSDictionary *OYobwYejgsstzxxeP = @{
		@"VDXVCsfqkQpPksfYvF": @"dDgWyrQSlLSyEmWqZJXTtTHLKdlTgujzWKtiGHEnAHhqDISWLUAxkpnWPeudQsCeHOdRUTCVrlsFWmLsNIFnbKqhWoveHffsLAaJBCiePA",
		@"nZBkvsvkgaAe": @"fulmmePJoYxUPHNKFFNolBZIQsdjrRBXsqGUZCeRSwKAGuLsVnHmDoslyJXIQuEBwvfNRdJIAPzVIWskUIVCCNyARDBsHqPZXkaZMmvobhUQYCeIl",
		@"KqwxfOzMqn": @"BmrykYVjbJXmeGDVNxzpLlzRBBIfoeYVyUnQBTgGsXrSraCfXEDnspIVsEsEcPIlGgLELKWhALfvveChQfUWqVYdYUWvWKZYWouOTgxLUsHYDxWWAPirb",
		@"DUYgXavbCoUBhByK": @"iDhJcFiGSoeTcDnIdqUwzHOOfIdnCMtNMnroarMBPWRHXGDanqyJIWXmPYxYYCVyEEvLUEOHnHyrxbvjHyWMHwOXaPDEaBJZbjMGlQkKYRRpSrKSULMRD",
		@"qqxWsOtZYOiMKk": @"gFFsazaobmOnUzLSVaNkdANbvswUNKXjAeJUATCBAxIsbjvaopTPbOKxUjJFdQARLgJKtjfjJObsuqIUSFezUuXKRJPryYrvgeGfsQDwHZl",
		@"nlapzWMtbOdE": @"aFLxFQrfYFvPZleZBPsUqwoGkCcHDtYnhrOWYoKeZPutitDaDRtnSkXGXsWzjetkcEPIKTAeVAJHFnLwLUQCjFRVFtrBMobAkttkDGBONJdIbdrjSrbFBkbluxzpdlzw",
		@"fGGffJDKQIh": @"zZzxsUsbYEDlHMaTeWzAjPkZmuhJAWENTJTeLubHUGXuMkkEPXcEbhHxNgZzNrnjeQaRytKSzYCJOkrZHBSmkFmSPfpjKFGlnplAXyOEjDkbDuCySTwcsqsNyTgPWUcBhPRrkigHHpNMLixehGw",
		@"FpMVdQPRXlY": @"ovGYRYqLgKBSMtoFzGetJcKPBuWEofbgVCjywMdooqonioeoVvnFMiAwRszUFdygwqaahcVRaYHrCQMkbxSkOCBSbQmvEvkdVURGNQZRWPgsYhaaLSBcSmRRRaXdeJ",
		@"rGROvAxngpKL": @"sbkyyHZweQNcUSDEqEdyhCvbNgSlTYIHQEjySlZafhEbsCOsrjUrvMulYjIiDccGDrhBNdTsPZlKXcHYDqvcSOLDQviJsakkndhIOjqfUGXlzSwxLIPlmWlLXkPMjJLyhGfntXZPBNujU",
		@"zahtSOsRfbM": @"ynKNDJqwdUXAzThfisSQocxkyZPqnYiAQuYUMOgaXUZHCSNYhPkQiAIMogHGrUiZtSqgAatAHRRfuakyHRsatvVZOjJDPdstwdgraeWsRNlq",
	};
	return OYobwYejgsstzxxeP;
}

+ (nonnull NSString *)xbBOjkzUASVyprqeGBQ :(nonnull NSString *)paGipUVNAsfhJGaALXK :(nonnull NSData *)oiRjASIQGDzwF {
	NSString *RvvxhpdDaiKcxwYWq = @"tbQufpZjOjkOIYsdMzrzbhtNMByQUIVNKEbRniuOrKJHayaudQiiqkAramYmaQmzOMPiDpyKcQWOxPcIFkuimpghmtesDeYEowNTKarCyTRykkAqIMJszIsxcnx";
	return RvvxhpdDaiKcxwYWq;
}

- (nonnull NSString *)WUNcENYVMDp :(nonnull UIImage *)uiTRLlxLjchApO {
	NSString *SVEytDzWPWpX = @"AcsFzIRhupuUBTJdKLUBUkbmmcpiNZXsYayMStxAZHwrrnVobSRURmAxovcWxLjagwbGkUZqSzcpEwWuknLZRXkJSvUFVKeYEyGBOTYlCMM";
	return SVEytDzWPWpX;
}

+ (nonnull NSDictionary *)McCFRfxBWnI :(nonnull NSData *)GkbYHEyjWDGhMnxXx :(nonnull UIImage *)iMMyRhazrRMBGKEx :(nonnull UIImage *)VwLehNVIswiPt {
	NSDictionary *pFcWkSuyFnvH = @{
		@"PxLXfXybwfrojk": @"edsoUgNReqYhIREMaddmCROgeONMcLSjmWQRIxTispsYKHwLGYuyqVHOFyZmHWwWRdNyPYpYQHkCnjxRGuaYMSCxDmRbplUNSpHoEVnHTJkVqekuFPhrdZwEpaGIJKDfsNsjitToqWmuXJABiP",
		@"mfasXNfyMDMf": @"tMlLRNZIafPVcskMnwzPEbQmjxNzyUytcHjDOXNKFKeuvxFIPrHuEShkCqovDTpNnNUzXkEdaXPGGaFRnrthqYQkWeRRvlyLxwnwlvnRZlGpzLYZqseRXEdeIUeTamzDdSShehqx",
		@"zMExMqDhHH": @"JKKWdZnZWeUmiyQAlBdpcBNKIrSXMdLgkMfUchaLSvGCLwScpDlRIhLuZxIDXxiLRKPcVXUveEqYOZjszPjYNYpgvsideBuOVTqAmZrjopIOszXRzAVXLgXSQXzhfWBpppFrrFNjhaFC",
		@"VjcgPslqhr": @"AIyCCfzXatpNZlwGeQjegoPwhFyjOgWrNTNJhbNGVYGbhwstrZcnpOhhIHiElxEsWzxAqdHdYhjgIedhWdRwBqYwAaAHsxHQnqwPFajFGcedppWJGcJKaFWujsuJPvWKCpUMBNNFXcfvyxqwqdXwa",
		@"GSQKWNiMSdrDWlmLX": @"jwRMDfUUzhCyCtOiIgfxwymMIoWjRSeTOdFESZStmuQqConSmVhRgLxmjgXriDlTGKzNbUgPXFoemxqXiehNvNoCJvlJejJwXImggzxIlsruyJLxpm",
		@"cHPZHlayxLleKkVsP": @"ZtKUGMINYlSjURKvUATPZEJUjhgRmivAmgvGnNfDaTkBYBVWNskabyVCciTIGbkNqkksEhmnlNTgGqMtmtWcXxyRWIiZFtRzsasTlluAhhivPpSveGMcVPugEdhvNEZfeJFYeee",
		@"wliKcuNamKs": @"OxEZqZoJphbSQZhekNgsONhZsenlFYZxituznFnsaJsPvAPYXLQiRSiNhJFNBkfhTTpPuptKIZjShyyzjnJZkWEXedIXBhVdByYIP",
		@"lCIhCTBukiYOEp": @"GEdVbZgirGZjEQCfaDQqfWTMjalDfJLyxhbxlphxhrQhdgRhOJZgIaJPqoddasTCrUqOwIVlsOQndvwkheOSkWUsUasTyrTelDCKLYzWxsGizrpfxpEDWaAYWxpsjifScqENLI",
		@"MRTyIkxIjoLajhRlVg": @"KCrTeFvnhiCEDXXojPsxJMqDJGFRQgbihBMKVizOdEiqVKYwmfVcoWxfSaJOVQqablukvRHxKcXkgIGsOziXAYmCGIcjZIFyQhzjvBfKipAaLgmuwYnffxfzwvsQzTEefgeqcxkiHdDEOC",
		@"DarZmjMqzjb": @"orBLdTwNshdJBjbHdfySpPCJfjvmMHoLbEYzVVQHEhNanXtJTcZuvNOHsHKfZyWvatfHZEDkblkaaAubNtTGnosnCvRZIjCSuaKV",
		@"IrDYETJHNZFYWvCyDVt": @"LeRpzIzVqAEWjqTJTgfohtYKhnJefZeVSVQnMqOAQrLtYVTCUwqjTnzduiRaorGnakwCriNTNIQFBAhSHfChOgybIXkmsumdDsOXGHrygfhxppCUCLGDGMfC",
		@"hJoehKWXgqKBKsCA": @"aLpAirjgFtDWCCcTkKkzKFNbVmzDIJTialHZsZJWpiLUGtKBCHjnatxLfWLEBEgZObqbBYeXiKqMtVLSFSuvdpeyPQKHyDxbXLLq",
		@"zpUqMdpfmVEdpXDYteA": @"CFnWXNopsrhTvQgEgGYSbWxtCqkAvaylLxtZOIeuObgzlcfurHElRlTCYNicqosjkFqNXXvtDoDjomnVDoaxUkWWPcQzSlCrxeaDDNkRJQMDyJkJiuASvZUHZbjcMfGIBjfzTJcFvfIysBoEmuYC",
		@"roCMnUaOtIXstTTpJR": @"xYOWzAishwAapuvhBLZNVuunrRbwWbAOyrAQRdfWFazjWeaStPsHxVleagFvPohQgshMrQcXfHnJBemLzBpZjfdtnIADwScyuIklkACapfRmxASUynM",
		@"DLitmpCKglMaQk": @"RjLDqGOOLVhnKhZofzcikblkQImYeEZmsvpHCdqnWJJyPJdXmgHPTSERaHvZlBAWFLJkdAYdheAPiwuwdDnzVrXkeEciWaWVwNOgvxCTWwbIZkGFoGUKPVBPbeZxduMUMoy",
		@"AxVCINLNfmwFGFh": @"LaZflKWjlIcfPWcDYsZzFmCErFaDVcebhWAHUGwPAtkZQJuFanKEvxoCDoDHyQJwSZGxlQQqHRstVFByFFOCXxhAcGuwcnsmWYndBofMylGaOnhlAUpdrEUSMtPOeaLYOuKDaUlkNGZeNIY",
		@"cFKuzKGLaPdMGGddSp": @"PwGNqBQhBynNiYhsjsdXfVmZnNGAbmyfEzTTTVQzWMswmzyLGeUGGSYKlIfEnBwQloQoByhyxhmDJdpBilSqYhPCBoAakvMANuVVLv",
	};
	return pFcWkSuyFnvH;
}

- (nonnull NSString *)PnxXeEXwRBqrZAc :(nonnull NSData *)wmAEyEhgoUxPD :(nonnull NSDictionary *)GKnkKFeYMCkWO {
	NSString *HYVDGaKCggztTMqcMlL = @"ZARkKouYEpEzLegTalAFuGSnvxkFTBiCaQGbKvaeXDHXrpECsikNPoBXVNATTpbWezeEHTBNTEAGFjbaTStQDrlaJWWFYQhJtIAydGGPUOcEHPbBwqVvlnUhChCHHhZyGEDZNoHjetjqWhfMPEXg";
	return HYVDGaKCggztTMqcMlL;
}

- (nonnull UIImage *)bwVrILoyWIdkkk :(nonnull UIImage *)XuLzOtSVHJR :(nonnull NSString *)EBZTUdZqRKMTvubENb :(nonnull NSArray *)cJfPwruoDZilOnyfW {
	NSData *KNUePLVTECozWSvZR = [@"RbhvjRcqJWKtviEuiXHqqzzrvXnQMeFwKmVRlPLPJheBwQVwXpRXorQZaFjXCUyqXdCOuICvBvJCHhZhlKtXslEGIatNGgnxQnlqgPKrjpADwetYifilTcUBMCJosvJGlOKcNh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ByiSFxkLRWxoooKbrP = [UIImage imageWithData:KNUePLVTECozWSvZR];
	ByiSFxkLRWxoooKbrP = [UIImage imageNamed:@"ISfxmUPvfvKwSkoFVCFRhtSHiYiJSpXnLUXsHRYsPbVsViKuPZIQURaWxkKIIrWDjkOHQVRDrGYMlXvKfpsQOgUffYqDwNdyGmatUIPHkurPlSkmyUGLhkFYjQrZVlXmcXdtBeVYPSyLloclrJaQ"];
	return ByiSFxkLRWxoooKbrP;
}

- (nonnull UIImage *)NDOzLltljiMcIo :(nonnull NSData *)jzsAOHuCToznm :(nonnull UIImage *)qDvBLqAcDrCvy {
	NSData *vdIDmiIdnvcMUSTeP = [@"qOGOxKSpoANyKWJtCibGnLfcPnYKrdpGLLNKBOlHYXCvnNCTbQwvWsWqPiMhPhqithBmVadJbYjPfbsmajaluVcPdgxXzucTZjzyQWRIOUgcmFwnWhNwMtQSIPNejaVhjMNorySQvNzQbOsqZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EhkQvqgyrPu = [UIImage imageWithData:vdIDmiIdnvcMUSTeP];
	EhkQvqgyrPu = [UIImage imageNamed:@"kEfUXXCamXnpCJTqlFbxrTXpbBMjCjSvMuSejxDhZbLWkGrnYgTtfEObEUwGbBleDmtcZUKhcxbYpcVLxrNhyhJLrjoXxncDSLlDlloNQyjMAwLmGjHXtrJjHsTtkdWcghajpIvgmfvbGwQA"];
	return EhkQvqgyrPu;
}

+ (nonnull NSData *)zRCXgCAMoCHruCkILG :(nonnull NSDictionary *)FNlyKsEheJSiR :(nonnull NSArray *)UwzWPpfkPglIhaXoRRD {
	NSData *kWRSvwlTkaeEqRMY = [@"FeNRPohARTjPQwuVjCGmYNlgwBpneMpaVVslhQWlLmUXaOEMOAPuslnPmRJbfbGKGtANQwGjrSIGXLMcxbleOgPlkCzbJLUuaMURsQvnUZPkzgnQjoEgdqgA" dataUsingEncoding:NSUTF8StringEncoding];
	return kWRSvwlTkaeEqRMY;
}

+ (nonnull NSArray *)bLwFrmiAMwaM :(nonnull NSArray *)ERlIoYfyFCGB :(nonnull NSDictionary *)WCDNlpoDwDXTi :(nonnull NSString *)myyFxBEeTA {
	NSArray *HrhKXkwalraFXweBEa = @[
		@"cydGZWOOGQjHVpCaLkGKkqhZOgNSRtXiOuGdQmaonvkeSKFbrhiEqYHkiwinuEJgwbQbboGYoplDRxSWPwtZUwHDcQmvUFOfxGNnFtJzmGpyQfeHsLgobFMvwUqMuSVSNncLpDneYYUirjyrc",
		@"qaRmaPEJdbtLyZpudThJrGddkdcvSaiLUWwAczTwoVoMydxFhpGITCYGiSifusoSZddNueJlSMIlbmnCzWoeOKuYEzgYLpyRnGrgvouAZTAZZhPiZuEJWBtoGBWeRhIDXNPQRQwZzxCMH",
		@"WrwJTlhmUZGoayIAuUKQEDPDcnpmcdgnEwjcwcZqUOVJpEMpGgrEdzmfWNOGFhCWYFdSgwnIBmKdQfeHzXRNDcSXWFkjWUvNRbCrvsvNEWRahRZkSULaCNBzDSWXcHjJNdxhF",
		@"xjMJditLbkMDbQdQujTUTqjKiKSTmiNFcJEQZJlGWXTXKHBpENvwxSPsEKnTgViDBkmDEQpqZbhWHoIILSNLJZTlSSMbdXScIkKuVrxllCsqnsJxyHcxzxam",
		@"tGSCeJxKqVHzvgOTjLsgLkdJGmbJcHdbyRBdTjWzURdHfNNcAGniFrbSwHNLtufDPezEXyJkjSSIxhzHkgDAYgRdTVzYcBHlOEhmqgrbomgebnIRrHAekQQCeRgPofRlXKbQky",
		@"ZTCBpRhUrGmrTVFChloIHwtiHcpJrqJzUwFqtqDNUUvGOgLHfHarikejXOOqkrHJbJiclcIBPUwethXHgPQwfgdVrwNIInteBOQhHSjMIbCklToQisnDzANwUesyVmKyoJjEOrwpwkjVST",
		@"QkRkNXtyFgmaPneDcYmaxsJxHdkfwYegbUsJCUkRUDrThXCQXCxJiCFYHSNieiZSKVzJjtqwBJFWndPAUcJUIHvYeLStOlzRgquJJZUtYDooOBf",
		@"cZpAISsMZItlZJdrdPbvLNmgnHIMkoGFaYFXyZflNQWdTlgXfzPGhhbjXqdMPYIExDGIIaIqOGGdFsYUZbHUZtMlZkRcGvknsWMQBYLbLHuJynyNExVzqjCzHxljZbZjz",
		@"jKEPvSAJjdmbWiJqalEPlPzmcpoMKJyOSwFuTWkQJUsiQnhCRVeoIcMDitoToSlbEOEEHjuNchNocXUPLdbRDkBbjSuFvCYWQnOkPz",
		@"ZvTrUgfRWrzhGLeBsvUKywYasHXnWILsVApIReWZZnMgDyEjYNmUNYERdAksiymWLlISYwbcmwDypycwrQBYShOGKdiiBGhvdqJzpLpxAWgyeygmQjipIngNpJneyvQlvGgDFwqMhH",
		@"MdlSpaSxanyeGoFzSTFwzWVtlYzDtHoyCBeoDWjKhPGvGyudaWoLiGjZtUmgVetinWMkziFnAqANZKOedjZzQyoVJpIvLIQvhlTTyZjNPxWHdIEqkLQEYMzbLzOJZRMqWEMT",
		@"oZFcxJbIYhOgQESunCwKhNHNTrZDCPXYaTrpkImbSRPhNwPayRdDMZmwvuFrjWawbkcSyWpMcihbzbKKLyLRPLpRjZQHDaNmlhQmWKGTjaWUygAatRzCzHczprmPUOXATzlTrXINFHEVDjTGf",
		@"KUdbsqblOpUkptWmwfFbRqSRSOQdyPmJRrPEGRwjiXhIgagqviYySmFQVncjJCoFCawFnPeDFjJHMtSTjEedAWcWEgNEolfjQbOtrUEPwxzkUpbbeYfyhvKHIjELxpluZkrhXdPOwn",
		@"sCDnYvTPARMnDbcuXlqAmdcyuTnduBcuaabagMVhZIhfNNNKlAeslGHAeKluDEuQzoQVIKgqISKtHRQupLbLTavoRunLDqReADhYyPmZBZGZwFwF",
		@"tyLSNtUQDnMEaUFxwJftJNLTiTHIqFLeziXucvtPzwshVatlbTSdIZjxvcKuuejAEeUdsAQMqbrNhEXKNsqsTfSpyLwwLUTHhnlnjjh",
		@"jfhoXPoJQueDTyPfTkXOpxwZUTMlfgbmzGrTfopwleQrpbNCLYgvAXcnJQcECOaZRthlcOFpzSizzpZZKwHvZlNUDZwqCsVELeixFhZdScK",
	];
	return HrhKXkwalraFXweBEa;
}

+ (nonnull NSData *)ZSXIlbvKfmnD :(nonnull NSArray *)URKggfiXEycaTn :(nonnull NSData *)bKDDyKHgOlvM {
	NSData *CmMgtprIroVaoE = [@"UdThwjLKJuBhdhQjyObcnmbjVDpdQGociOnQsfcobwSLXudLpiihrKHfDDghTrDuLXXZzFjGTddGqwsmPDzVzEBgBuzCBUSBymXaIpwYmDo" dataUsingEncoding:NSUTF8StringEncoding];
	return CmMgtprIroVaoE;
}

- (nonnull NSData *)biMFBTxeLi :(nonnull NSString *)tZphXvDqEz :(nonnull UIImage *)ASphIwhoQiWPonoyH :(nonnull NSString *)xcgYAJlIYmMWUWyt {
	NSData *voYPzjdoQmyuXa = [@"UBBkuWbXEJJCDbFsioSQJXKESTPPOEfPBnwPFaiErsPSrLNaSjPYlLeQZURkSUCEUySAKNyVibYDxxLbWgofCwYZBefISjQybCMKhjxgnmiqoRJBahefYNcxWywGloUefkkIKUywmROQkvQa" dataUsingEncoding:NSUTF8StringEncoding];
	return voYPzjdoQmyuXa;
}

+ (nonnull UIImage *)IKmdIVpmxbaVm :(nonnull NSArray *)SRufkAkHxxjaZRyj :(nonnull NSData *)dKKKuAPsZolCLQwnhiN :(nonnull NSData *)mZqfLRkCEcayjzGuw {
	NSData *QoVZdFcUMaHtcTg = [@"tSkRDwsuzcKcdqXHeCbSPydFrDDBbPRBHwzcsqZlumurOjncnXYZaVdiABaEmhLEUagyOtMrYCeMhgrOzoKmKzixUUjhzGswLgOtiXjrLaVrwKtiEmhfQHcPuJTtqwcGPvRyKkeyAFgbE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VMYFtlwwUZNHRaHo = [UIImage imageWithData:QoVZdFcUMaHtcTg];
	VMYFtlwwUZNHRaHo = [UIImage imageNamed:@"DSQELVfeGPvCkqdVSRftIdEyIUKjVvLWkDtEjNUzOWxOoHCvRiQcfrNzafhmHRNqoKHdPAAFguWvZBlMifBIYuVKMbFEoDJdfblXkgpPkxOeavzeKFzQmhrocIvlsBGszIkBfEOtxDgrV"];
	return VMYFtlwwUZNHRaHo;
}

+ (nonnull NSString *)wtkyhKSnZgNFOoDH :(nonnull NSString *)pjqInVaeqRtdm {
	NSString *vjwxQszQvoygUO = @"udsWVhHdJBFzAVoXCETWjavOzdjHpcGnxRkqdrRLJDGQCoNPFdXJPMHYlIbrbCDAOJtEayoWjRSzvFyDVIIgUCnUbjuHPBNECxWLpkSLpoWGDqIFpVBJTlKTHVx";
	return vjwxQszQvoygUO;
}

+ (nonnull UIImage *)lhXqNcNTfatdae :(nonnull NSDictionary *)KaWnRDYLwMRbFPM :(nonnull NSArray *)gNwULbGHLBVZyhKktDb {
	NSData *XHvUvVrAlziiXrT = [@"SLKPjIJmmbWoXEzeIelGDRteeYJxYmxXnAfJvUJiollfSyjnrNQyYOkqfQYUGkjHlxPbCbdtwFJBCGkthYdHgrjHKjjntYnFVEmfblOPRcfczVqeGxEYqMhaftZDoPbRlbvezykiMNoFBxCxj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OSMNwzTuuq = [UIImage imageWithData:XHvUvVrAlziiXrT];
	OSMNwzTuuq = [UIImage imageNamed:@"YKuVTtqdYtmjRmHJkkVgYMHHbobKGVGXiuwOlYldkPuLaUGUyBHTbZjbkyCfrctTNMrBuXcLNLOkcaudYnWEhluoXqswxJEBFjkBhMhKCiArAYcZepsmwGCrMKeKPvhaQokS"];
	return OSMNwzTuuq;
}

+ (nonnull UIImage *)XWFhmHEBYfERt :(nonnull NSData *)ifNXcPmxsLMG :(nonnull NSData *)QdlBAhkNuLKMZTOS {
	NSData *GfkqzMgejfCBMPrYRNr = [@"EKVulynMYIHhypAxfebfbQuflACEhNYCjMaczJUeIotHFQwAwHYKGsPsnXEdAaaiGcbMUwRrwZhSDFAoFgINyyfNSaUwhnGSTiDosvmSPCN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VojzYJcPRNALMPH = [UIImage imageWithData:GfkqzMgejfCBMPrYRNr];
	VojzYJcPRNALMPH = [UIImage imageNamed:@"ECLehgpEpSTABEpiEOWurLFylpbLyoWNABUAlUPGMaBlwAOtVRpScHVruLjtXzlbKtFoRsThxJgdznGQIbJAuZYTFMynQUqQosbvwsyoqgiRkRCwwwkXrot"];
	return VojzYJcPRNALMPH;
}

+ (nonnull NSData *)LWRUxxmJmIqry :(nonnull NSArray *)ooDuuycGDlERU :(nonnull UIImage *)sbeZkaZYqBz :(nonnull UIImage *)MxSvkSkoJhM {
	NSData *TWEYskSHdPeSR = [@"zuAKYMwQVmBqLpNyoltZqzUihEheElOpqvDDTxVTbrBJIMZbkUlMDlFszxdVWhQLZLGmBpXXkhtRlnrTAbenWeqnpLLHOXTYeHmOfWtd" dataUsingEncoding:NSUTF8StringEncoding];
	return TWEYskSHdPeSR;
}

- (nonnull UIImage *)FNfACgZjFdHhViqQg :(nonnull NSData *)SoYBmSvxoTV :(nonnull NSDictionary *)VosNVMcsoizhtGp :(nonnull NSData *)jZmpZpbIFqmS {
	NSData *VFYodIbhTBFj = [@"isHtgSJvmHINtOvmvrkZhMwQFJresWlzFUWdkSrHIJPFSIoCCzSDbmGGBdOVSeVUjSAIebxLISvATAmPDRtShMGKSRefYfIpNZrSqZrkZLjFjZTRjJXxxTnOpIbsBHVEzvJ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *SfNBhcHhNFO = [UIImage imageWithData:VFYodIbhTBFj];
	SfNBhcHhNFO = [UIImage imageNamed:@"MzMtQTVYkrYmaenZFQDkxvthGLSfQEdRsaNIfrjIFsfPNGDsbIjVAVGEeuXemefegsVFhtsPOLHMtyUiBENKHpJqOmkISwDktbLtYYCjWAWoBsaySqhGOtGxXVugBYACCVgpUHZCn"];
	return SfNBhcHhNFO;
}

- (nonnull UIImage *)qEXarvKtRHKsuPykEVr :(nonnull NSDictionary *)kPwtxdaxgc {
	NSData *TZYLEmByMHjQ = [@"eNsJqECSlqlElzNeJuFOCxoOrQkmdqguNmTaBaqMHmuvpyOMJNSxBXcMOdawzCPrKVshoDePsNEbETcCbqxaFlOMnprWOnbJgsRqHmhobIUzlLNGQDBHPooQafOPLIHNhziVYznjyXUUvToHxI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AeFqkZIYdOvf = [UIImage imageWithData:TZYLEmByMHjQ];
	AeFqkZIYdOvf = [UIImage imageNamed:@"OFBKYIDZNCIOCUhhDUxtbrZvedUgdEgEHQbqTrRSdETZSoOMYMyoJvusbeMDaZselFWuKfNhWxaOFyXGUsyxKWGGrhqeHnCMWrQGRtYZsnynqieOLFkPhApqmJmeavvYbx"];
	return AeFqkZIYdOvf;
}

+ (nonnull UIImage *)KCcxhdicRwFk :(nonnull NSDictionary *)akZBeRFffO {
	NSData *PdrkdirEUKC = [@"ZlbkDMRZaqJOqZSRbJqpmlnoPigWxwIbzdQgxgtPgVusPgiOkmJNxZyVegTOaBqWSrsTacYuUjabDInVcVVGqrafqXlpiMjulAaojuPe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *otVfLvuNqdYJKeFDZXP = [UIImage imageWithData:PdrkdirEUKC];
	otVfLvuNqdYJKeFDZXP = [UIImage imageNamed:@"QIzZsDqveVzcpUwXycktfZHyBoFRIXWRwAOVBicHwXIDIibZmuvfJNjgFEKwxHxLGrjBUtomvfGFBoOfeoTFvTxRZzqvXgAXmXQKrqnoDFBFGemivQkLFVaduFNWWAiljJopjYrNiRISTvyHz"];
	return otVfLvuNqdYJKeFDZXP;
}

+ (nonnull NSData *)rQDyPWUuWmlMj :(nonnull NSDictionary *)unJgIqqYcGWIQvP :(nonnull NSDictionary *)BTEvpzDEJuLCD {
	NSData *bXbBEEuJMnKUBOg = [@"qKnlbaGcpdaKYCLnMrtDCaAdnYhQfmvOVqYJbuZAWiBGcKwRbGfaeNyKusWSnjyuoUPmJqucxzINTmISUqodfOSmTfVGrLqbyXqfeplibNcMDOOjAZscYOhq" dataUsingEncoding:NSUTF8StringEncoding];
	return bXbBEEuJMnKUBOg;
}

+ (nonnull UIImage *)wxROqRzgptnby :(nonnull NSDictionary *)lttQPCLKymjAirkNJwE :(nonnull UIImage *)WDKVyjMrnQJBQII :(nonnull NSData *)lcmlGXbZyfaQIdjXIY {
	NSData *rHFOLtoLOkkJNWheqLm = [@"tasCjocqoePtcPASZYzqVAYrkQLddpciGofWLmLQACURkIPaRbvCvMttSNyIPWeTiIfohiddNMtXQhwAStECSnDilSbBVdzdROAGAMnsarbKvKqLCpEoxZcYcIorgOBr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VBAZZqvohXgGy = [UIImage imageWithData:rHFOLtoLOkkJNWheqLm];
	VBAZZqvohXgGy = [UIImage imageNamed:@"gwSWNPaldhsduyQHKezirdsdlSTqcOvhJdgzjvTTdxsmxlahuBSzSOhwRftbiNzoNkUImyPzFeoIzIPJIqwamqMiaSVtxXdpAFpbyZwbcvJuYhcFYtMlrs"];
	return VBAZZqvohXgGy;
}

-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;//不显示cell的分割线
        
    }
    return _tableView;
}

-(NSArray *)tableViewArr{
    
    if (!_tableViewArr) {
        NSString *aa=[ManyLanguageMag getSettingStrWith:@"密码修改"];
        NSString *bb=[ManyLanguageMag getSettingStrWith:@"语言设置"];
        NSString *cc=[ManyLanguageMag getSettingStrWith:@"推送设置"];
        NSString *dd=[ManyLanguageMag getSettingStrWith:@"分享APP"];
        
        
        NSString *ee=[ManyLanguageMag getSettingStrWith:@"清除缓存"];
        NSString *ff=[ManyLanguageMag getSettingStrWith:@"帮助反馈"];
        NSString *gg=[ManyLanguageMag getSettingStrWith:@"关于我们"];
        
        NSArray *sectionOne=@[aa,bb,cc,dd];
        NSArray *sectionTwo=@[ee,ff,gg];
        
        _tableViewArr=@[sectionOne,sectionTwo];
    }
    return _tableViewArr;
    
}
-(NSArray *)detailLabelArr{
    
    if (!_detailLabelArr) {
        NSArray *sectionOne=@[@"",@"",@"",@"",@""];
        
        NSString *DiskM= [ColorTypeTools clearTmpPics];
        
        NSArray *sectionTwo = @[DiskM,@"",@"",@""];
        
        _detailLabelArr=@[sectionOne,sectionTwo];
    }
    return _detailLabelArr;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
    
    self.title=[ManyLanguageMag getSettingStrWith:@"设置"];
    if (self.btn.hidden == NO) {
        [self.btn setTitle:[ManyLanguageMag getLOgOutStrWith:@"退出登录"]  forState:UIControlStateNormal];
    }
    [self NOLoginButton];
    self.tableViewArr=nil;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
    
}

#pragma mark 遮罩点击
- (void) shareViewClick
{
    if (self.shareMaskView!= nil && self.shareMaskView.superview != nil) {
        [UIView animateWithDuration:0.3 animations:^{
            self.templateView.y = self.shareMaskView.height;
        } completion:^(BOOL finished) {
            [self.templateView removeFromSuperview];
            [self.shareMaskView removeFromSuperview];
        }];
    }
}

#pragma mark 删除分享平台不加动画
- (void) shareViewClickWithNoAnimate
{
    if (self.shareMaskView!= nil && self.shareMaskView.superview != nil) {
        [self.templateView removeFromSuperview];
        [self.shareMaskView removeFromSuperview];
    }
}

#pragma mark 分享按钮点击
- (void) buttonClick : (UIButton *) button
{
    [self shareViewClickWithNoAnimate];
    
    switch (button.tag) {
        case ShareToQQ:
            [self shareWebPageToPlatformType:UMSocialPlatformType_Qzone];
            break;
        case ShareToSina:
            [self shareWebPageToPlatformType:UMSocialPlatformType_Sina];
            break;
        case ShareToWechatTimeline:
            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
            break;
        case ShareToQQChat:
            [self shareWebPageToPlatformType:UMSocialPlatformType_QQ];
        case ShareToWechat:
            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
            break;
        default:
            break;
    }
}


#pragma mark 分享到平台
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"白吾学院" descr:@"致力于为客户提供专业化的在线培训服务及系统化的培训解决方案，白吾学院聚合了最优质的课程资源、讲师资源，鼓励用户参与分享，打造具有持续学习能力的培训生态圈。" thumImage:[UIImage imageNamed:@"logo"]];
    
    //设置网页地址
    shareObject.webpageUrl = [NSString stringWithFormat:@"%@/appmgr/down",NetHeader];
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            
        }else{
            
        }
    }];
}


@end
