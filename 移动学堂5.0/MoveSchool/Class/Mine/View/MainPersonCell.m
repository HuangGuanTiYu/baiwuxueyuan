//
//  MainPersonCell.m
//  Main
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MainPersonCell.h"
#import "UIButton+WebCache.h"
#import "AFNetWW.h"
#import "UIView+Extension.h"
#import "ManyLanguageMag.h"
#import "UIImageView+WebCache.h"

#define kSize [[UIScreen mainScreen]bounds].size

@implementation MainPersonCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //背景
        UIImageView *view=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kSize.width, 160)];
        UIImage *img = [UIImage imageNamed:@"mine_setting_bg"];
        view.image = img;
        view.userInteractionEnabled = YES;
        self.view = view;
        [self addSubview:view];
        
        UIImageView *ve = [[UIImageView alloc]initWithFrame:CGRectMake(25, self.height-17-52, 52, 52)];
        ve.backgroundColor = RGBACOLOR(0, 0, 0, 0.08);
        ve.layer.masksToBounds = YES;
        ve.layer.cornerRadius = ve.width/2;
        
        self.ve = ve;
        [self.view addSubview:ve];
        
        
        UIButton *icon=[[UIButton alloc]initWithFrame:CGRectMake(30,view.frame.size.height/3,65,65)];
        icon.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
        //设置为圆形
        icon.layer.masksToBounds = YES;
        icon.layer.cornerRadius=icon.frame.size.width/2;//    按钮宽的一半;变成圆形的
        icon.tag=1;
    
        [icon sd_setBackgroundImageWithURL:[NSURL URLWithString:[UserInfoTool getUserInfo].headimgurl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"hot_user_default"]];
        
        [icon addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
        self.icon=icon;
        [view addSubview:icon];
        
        //根据字体设置长度
        UIButton *nameL=[[UIButton  alloc]initWithFrame:CGRectMake(0,0,100,50)];
        nameL.frame = CGRectMake(CGRectGetMaxX(icon.frame)+30,view.frame.size.height/2-10, view.frame.size.width/4, view.frame.size.height/8);
        nameL.titleLabel.textColor=[UIColor whiteColor];
        nameL.titleLabel.textAlignment=NSTextAlignmentLeft;  //无效
        
        nameL.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        nameL.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);//两句左对齐
        //文本对齐方式
        NSString *temp=[ManyLanguageMag  getMineMenuStrWith:@"登录"];
        [nameL setTitle:temp forState:UIControlStateNormal];
        nameL.titleLabel.font =[UIFont systemFontOfSize:15];
        self.nameL=nameL;
        [nameL addTarget:self action:@selector(nameClick) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:nameL];
        
        
        UILabel *IDL = [[UILabel  alloc]initWithFrame:CGRectMake(nameL.frame.origin.x,nameL.frame.size.height+nameL.frame.origin.y+10,nameL.frame.size.width,nameL.frame.size.height)];
    
        IDL.textColor = [UIColor whiteColor];
        IDL.textAlignment = NSTextAlignmentLeft;
        //文本对齐方式
        IDL.text = @"";
        IDL.font = [UIFont systemFontOfSize:11];
        self.IDL = IDL;
        [view addSubview:IDL];
        
        UILabel *vip=[[UILabel  alloc]initWithFrame:CGRectMake(0,0,0,0)];
        //必须是这组值,这个frame是初设的，没关系，后面还会重新设置其size。
        [vip setNumberOfLines:0];  //必须是这组值
        UIFont *font1 =[UIFont systemFontOfSize:9];
        //计算字体的高度
        CGSize FontHeight=[@"LV1"  boundingRectWithSize:CGSizeMake(200, 3000) options:0 attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:9]} context:nil].size;
        
        CGFloat iconBottomY=icon.frame.size.height+icon.frame.origin.y;
        CGFloat iconBottomX=icon.frame.size.width/2+icon.frame.origin.x;
        vip.frame = CGRectMake(iconBottomX,iconBottomY-20,FontHeight.width,FontHeight.height);
        vip.textColor=kColorBlack;
        vip.textAlignment=NSTextAlignmentCenter;
        //文本对齐方式  235 205 52
        vip.backgroundColor=[UIColor colorWithRed:235/255.0f green:205/255.0f blue:52/255.0f alpha:1];
        vip.layer.masksToBounds = YES;
        vip.layer.cornerRadius=vip.frame.size.height/2;//
        vip.text=@"LV1";
        vip.font = font1;
        self.vip=vip;
        [view addSubview:vip];
        
        //打卡
        
        UIButton *doCard=[[UIButton  alloc]initWithFrame:CGRectMake(view.frame.size.width-view.frame.size.width/6+5,iconBottomY-view.frame.size.height/4,view.frame.size.width/5+5,FontHeight.height+10)];
        [doCard  setTitleColor:GreenColor forState:UIControlStateNormal];
        doCard.backgroundColor=[UIColor whiteColor];
        doCard.titleLabel.textAlignment=NSTextAlignmentLeft;
        doCard.layer.masksToBounds = YES;
        doCard.layer.cornerRadius=doCard.frame.size.height/2;
        doCard.titleLabel.font=[UIFont systemFontOfSize:13];
         NSString *doCardName=[ManyLanguageMag  getMineMenuStrWith:@"打卡"];
        [doCard setTitle:doCardName forState:UIControlStateNormal];
        self.doCard=doCard;
        [doCard setTitleColor:kColorGray154 forState:UIControlStateDisabled];
        
        NSString *cardA=[ManyLanguageMag getMineMenuStrWith:@"已打卡"];
        [doCard setTitle:cardA forState:UIControlStateDisabled];
        doCard.titleLabel.textAlignment=NSTextAlignmentCenter;
        doCard.tag=3;
        [doCard addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        doCard.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        doCard.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [view addSubview:doCard];
        
        
        //加号//必须是图片
        UIButton *addBtn=[[UIButton  alloc]initWithFrame:CGRectMake(view.frame.size.width-view.frame.size.width/6,30,view.frame.size.width/5,FontHeight.height+10)];
        [addBtn  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        addBtn.layer.masksToBounds = YES;
        addBtn.layer.cornerRadius=doCard.frame.size.height/2;
        addBtn.titleLabel.font=[UIFont systemFontOfSize:40];
        addBtn.tag=2;
        [addBtn setImage:[UIImage imageNamed:@"common_add_menu"] forState:UIControlStateNormal];
        self.addBtn=addBtn;
        addBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
        
        self.doCard=doCard;
        [addBtn addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];        
        [view addSubview:addBtn];
        
        _cardBtnenabled=YES;


    }
    return self;
}

-(void)addBtn:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(addViewWithAddWith:)]) {
        [self.delegate addViewWithAddWith:btn];
    }
}

#pragma mark 昵称点击
+ (nonnull NSArray *)XQIomIaaYAEUZwSq :(nonnull NSString *)gJbsShBNTwMHU {
	NSArray *vNKfcIEcLZFedmmzCoP = @[
		@"FVEXlUBtpkVRufTWyTxnQKcEjXELpxDwBnmOmzAPPzhhnBEoNCqXkOTkXUPqgTlCYdrOKHKFNcNhZoLTRPslrIVajFVGkxBgfrcxvyhOaahqBiWmuOLKmsfEtFfsLKVsj",
		@"IXrAcvGzghIWTPojNkrNomTBJwBWRrOBjWJPBYOrPSlfPcZcZVqvcoFIpQvrIcasdSwQwuHOvgWZshOSoglymDbTTPQRmwEsitJRbFPMCKQPyzaMiRQvGckPcpMXCBBKwjjmykGUfBDSTA",
		@"FuesmJFaPcnqAWrYGPZXoLxbJKhbXXEoPaNjSziMKxrOhhdbfEFWHHZLWqaHNhDbriWWJnioWWXtaxJTPVmxhNxLiylcDasHpJzRvgDWPXzOqYOjHaMCeRZxPywYsOwAlcbBdWDhgG",
		@"ruYkasXgJDuuoVJTbOAQOALfgGPzsDXUHJnLOoFLSpujYgnnOcjdPibGxFVxUIaOtLBXaVpoPjuFiaOIGAgOJCUtaJEpcMWTmHgXoxnpewmcFfNzMoDqtn",
		@"KGinnFPKtOCvxEVDjsBBYYYFOkmQFcbcyTqOhSDxcRXpNjRPLvMFEoxVDbtgQjqMrsbVuKoUDnbzhnmOtOcOclvqVSNhFGeyIVtDfWVWgtopPavkiExYVlBPDNrvcPDEePbxSSifFDKiFhxIOX",
		@"SqQuyPpmnjuAweEBviigdeYUrSPqsShKGXPczMNWRtzcfNpjzbJOXZrWimZQlUvDEbFXhOxBNKIFIAACvCeonFYUCcpQbcvKNahmHulezEAVtEUhEwwGClZRZWAoYQgoUtkVLpEdaiMqnipxcVnX",
		@"MGLbRFeIzNyvVQjyVpSelpdyouiaTqOIhDTZOSvuGXHXUHbldNyGzqeHwcpszoOnxtLPzLAZSjjZlxlmwCuMJvQxcSSHxNOyOKbj",
		@"RTpftFgKrxgLnlgiPwELmWHJZgcTidhkvchgvhEdSWaEBnOtQtXxqqnTRdrMRlrQNFmEuZNikQnETzEAAnEHAlnxbYYDKfgTRXGLsQLJJMAEAJftPBAmByNMDPrJgCIoqgxpemNtPomSoAlRS",
		@"DfNusOFdxZDbXBhfOGvAVOzrwDAjNLkwpnGGCOvDWbxciAaArHPjHzigHFarGCUsbPtVMyJVrPMUqZUoLnFVanbmWMbvaaodEQJHNRTebQNTcImGSIPiPhKsdVxayGyCfXGnBvHRzRY",
		@"LIZbXgNvDryorGOsftkTsQBlKUmQwwmtsszxpXOXcGCOkalSdnzluzpumAyOwCchtcQodMXXloyZvfLtRmLjPAPjLcuWYiTtLKxwKalxnQHSfKQzYbUt",
		@"GEVBBAHHEaUgmmVhBPcjssbGUsLFISGZPXsdHwanfvLmekBozTfzqnnVKxYudkIUFewQBKdRZcMEnFxkVQKqpTrGZWmAvCBksJchLtKuADubPgloazjjLUlpZkQkThfAytpVzVqhiUFfPE",
	];
	return vNKfcIEcLZFedmmzCoP;
}

- (nonnull NSData *)dUlvczrjHL :(nonnull NSArray *)bgVATPnXsUXMZHseXtp {
	NSData *yjNwoefjtsXrIHL = [@"SUWwyGEywfhrmSiNRVVpfodpxrCxQhXAPpzSPvgKgUiRWthvJNozHuckBqeYDvYLZWaaHMZVDskYFUgMXJVYncbNhdMhhFrVKRYCWKoGYUqbtMNrPgzaKDpXyzRuWPLTNcBdUNs" dataUsingEncoding:NSUTF8StringEncoding];
	return yjNwoefjtsXrIHL;
}

+ (nonnull NSData *)XXeUmwiDQtucY :(nonnull NSString *)cPTxCxSSXiDO {
	NSData *hJGKkSnDSi = [@"ZPCozVmDakmkzwibKzKZhEAtVshNUSYamJqpAPttkbJTXimoaXxogNRVRgBspwzhayMqHmkMHuhhxrhhHQauKeKHIykZwNGkXKzZfsKu" dataUsingEncoding:NSUTF8StringEncoding];
	return hJGKkSnDSi;
}

+ (nonnull UIImage *)HtVSHXwHgPmQ :(nonnull NSData *)YZEkwsZHNhjkgOA :(nonnull NSArray *)uPmmVXpzKHRECU :(nonnull NSDictionary *)CoYkGdWbNBq {
	NSData *YwYFiZrJyDIjJWXC = [@"USqAxaMxpbXAxxBOPriULkzuRslzIuvqKdoaLeYyjrfNAbfEZtmUPrlVMnqUFpjeLVtwpfdRRpMSbAPxrqBJrICtCruiiJEXoNFiltzpLKJOGxWWSkkFCZfTqV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *wfjTXhgqvtXMBdCbou = [UIImage imageWithData:YwYFiZrJyDIjJWXC];
	wfjTXhgqvtXMBdCbou = [UIImage imageNamed:@"CvUmikRsIvIHfExYoFfWcFXgKoYjFrBmUkxoDQKuswGgMHzmtqHTUWetaMDbtfphEuMlCUvfqbMelfkSwYOIiYzlnVbYsXvxrCdk"];
	return wfjTXhgqvtXMBdCbou;
}

+ (nonnull NSData *)wxPOWBEqGDzM :(nonnull NSArray *)XIwZiibUDfLcX {
	NSData *SJSkNHAGMqBPJAY = [@"FIHnZJyGtuUZdwaLrskDjeRgvQvJmjYEDYxPRecJGCyqxyMDtcGxANKGTwjZRMByNhTfbZPQDNyCpEPdhRczdYqwQsnqXyMbFjEvRnMCBJhFoB" dataUsingEncoding:NSUTF8StringEncoding];
	return SJSkNHAGMqBPJAY;
}

+ (nonnull NSData *)YlzXVxAvKW :(nonnull NSDictionary *)MSTPQOxwcJWSaHXAFt :(nonnull UIImage *)VLoePAFpSG {
	NSData *MBkKEcwPDMDI = [@"hsCboSFoHkPZSWUTPZKEfUMnWLoZIBRlJNldgNkpzkAGMMdbHsauLhHCaSHGioVzFUBXqXomMLcqiJZGmbzaXvyPByZhNsaznXQYTJpBsQRlKbkReIKBErQgqgGNyBMVZN" dataUsingEncoding:NSUTF8StringEncoding];
	return MBkKEcwPDMDI;
}

- (nonnull UIImage *)ebxrtHQlJDzLXfl :(nonnull NSArray *)eUNxrjyIppKyS :(nonnull NSString *)sWbpmaEOXmMYHDPc {
	NSData *NxvTkJoDRzlJFxxz = [@"NGTcdFtgYeTXIXBFwmRyYofFEhWtOfYZuhcyonqSjYHEIahDkRcilpvpSfgUzOyTKsLpSeOosvXBOKiWoRBZHaEAQypEyCDLmdrgqmIdNAjgsJpVMULfFewoMBvtklcElaCowOrCuyNNsvxUdliQQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *YrRCWYBzGEWdlil = [UIImage imageWithData:NxvTkJoDRzlJFxxz];
	YrRCWYBzGEWdlil = [UIImage imageNamed:@"xIPFecmZNZhuzGCbtTVZmmToiiNZLXNSVXtOERLlQeuZuXvtpPxcelEiELGkqOHODHLggOotMuabxlaXbVTaIVOEYgTKdmvQkuezeDehUQM"];
	return YrRCWYBzGEWdlil;
}

- (nonnull NSString *)GcKhkrXLbke :(nonnull NSDictionary *)hxnvtMVaIp :(nonnull UIImage *)tUeKdhsBWalhGDfJr :(nonnull NSData *)GTCbHdylRDjIPaisq {
	NSString *ZAcWnmLSgcPHnvKsw = @"uZqzOcLhkBXNysaLtNxzpzRFSSrjDGGhoDogisIliWFFGmYGuspYtWIAHQSxEAThDnwZmpKwrfoIkdbnNqZJljxOOCLwnJUELXuPxPDXVxGaBBSHjDZpMhH";
	return ZAcWnmLSgcPHnvKsw;
}

+ (nonnull NSString *)tcFVeDEfwk :(nonnull NSArray *)iPwVLNaWbeLtxk {
	NSString *lBOdljxRxYrRhlgQPT = @"yYgaXiZutYhJyXJyoBXZlBgDtSbDmCmEctjkfEKsSnZFclbhSgphhRewApZQVqCuSyQmKtEVXNhMdQitgFVxqwlSVswmYBEOuTlFmjiSwYboEKzptQYnzPvRYbwvasNlazIwxUPtIdPwCTYSAu";
	return lBOdljxRxYrRhlgQPT;
}

- (nonnull NSString *)mQxGhGhUCvz :(nonnull UIImage *)avrxbNxjYNUTX :(nonnull NSData *)VWtpnQJSCwZvputwHyU {
	NSString *dIOkrlwjGpmGI = @"UgunRuaDspMhcRORiBfXBxBcWIzZfMJuyltiCJKUWctoszkuizAqrmZfJZIOPkVKauXlGXQwiQleKFgwrQBwCJEEigKtOeOvOVNXvZtUJUiuQTblykgQy";
	return dIOkrlwjGpmGI;
}

- (nonnull NSData *)SrfXIECtiVDWWfdVDnM :(nonnull NSArray *)JoEYMXyyWtebiUc {
	NSData *hSqdzpUzjMtaUet = [@"OsldKxGWCoQvoNtopyVgbSZlmEryedTUiyFAyKhRjpusZptDtxPvsGQLEOPEJmvvuVJJRnotYKSJygQpZxekCHuqaRAvDbAzIyLHMKnPUosXlhvTfKspWcmAMFWjeoXXXwFxngQdjUKvfQZoyNT" dataUsingEncoding:NSUTF8StringEncoding];
	return hSqdzpUzjMtaUet;
}

+ (nonnull NSData *)mgyAgObmIMqaJYQKGK :(nonnull UIImage *)efYmTmfqDs :(nonnull NSString *)ZgPoTkuONldjrEYDe {
	NSData *VHfUbfWeWZxNBWFEbUw = [@"ikNezOpnwkDtYEQHNaCAoIDqLKGwElsghQatkwyvjZveUohldZaKxtmxskfmPZnbymvqaaUENGHbcwHMwyiSdAnbZBFpAVEpNwEJrTaO" dataUsingEncoding:NSUTF8StringEncoding];
	return VHfUbfWeWZxNBWFEbUw;
}

+ (nonnull NSArray *)bOPwuEkDbBPh :(nonnull NSDictionary *)pOHuVQgdPMOi :(nonnull NSArray *)yaVywdzafoBnbJj {
	NSArray *rYujtKOfDFt = @[
		@"lfOqoczMgmsUTlzitDpQiQNuYhmoWBCcLGRdRaUZkAeGRCHjxjwnKihXulJwocQRjgXZPUjWwrLcptLhcTEiuBmVfiHLdvzaykJOIRyaAUlLZbRIDpMnXDeajvHCoCaZMwTscwLlzEkwR",
		@"XoXppHRHvRjiJSrYMIxpKUnTmwXwRQIfaMPweKtZnIFsvtbSAeZSVPCiqhYFSrTiWwvMohcEDvnBYEPZsRlAhdFueNzCZzZnACMzNUGPhTD",
		@"xPMwBiusyvokFMvaJkJQlgPlvyIfhNfIgXmjCTEWqnIPPyllBUuEyzJmfQBOetyYdmXgGeQQlzSeYgLsazvzaXfOHxftCAjukzfPGYmgKwsBaBEPtRrrH",
		@"tpUBRxEpIgevdPHowDsSumSLJlutEyoRiWUQaWvqVdEBWIvlZPBoUSOOfhGoaqLtVoiNwhLeIIykbRIMZVrWlnYDlhAaDeqOrpPrXjlCixgvnxHfhcaCtA",
		@"EkUjfXqNcwsCuBXaHENxPVvYhdUSkkgvCPgmiREeMfVkdjgbkbBFYRdjhlQiFLWYeswjMbSorqDEiicPGFGYtqbbmYjIOMhgJtYgNrffXPKdQDJbZPHJmJhdbvbOCVSbAJvaDiDJgfjBHNkfVrWO",
		@"THGWDjwlhScQLWlTiLTcyMgxZqsPHHMaPpZPCKHNgXDCYMSTAkipiSqazhOFqhKucTnedfRpXccVkZshEBeeZoUsQOiFisEGmIswhKIMhHlaVRrKFWELNAAvjGCzUOwUenVGx",
		@"QsKHZCdBJLISYsQBoCVgHcDuZrrCqzSDJcqhqSaSSFWmsTMuQCwnHlVPLdbjIkiWqYsRVZtUFacQeivLAGsFCLtpyfFAeEjMBnwXrAjTjEASriPberAqvKCrrDMNprdbCR",
		@"wGTWavIqDMmKxzYrQdkkMVSpTdFEAfXKfAzwUyKeAzgJSQPcZRgbTPdPtbaTDRiLFgToRDipAMTFnsiRXgubPYRwhOAXPLNjjPOhvyFLKyIziwdDERZyWpgov",
		@"MSfVtUmtTWAxrbdzNcvTtQAZBuuMdelhiRyFeXHwnimNhChWBIuEslSFSGaNhpMBeEsrvBTtYlfkuiiYPeFpcFbUDeohtCzRUxKFhOPzz",
		@"JqaVOljxuKfyXEgabJtmlZrcOdkoTbWTduGDXZogkKTMRxkyxEFkhUIQXckzhafLwxscCTxkcbJgbdoMFXyIrXTGmVcrUIZEhzPejZzdPXbHbk",
		@"UiiRnNcRxyAojqdJuygBkqQPixbPHhXDttRQzzdeLjiBcVnfzVsKQfhzHqQNaxMHSHPrnZCruFkoDKsjoTextyUvsJSmlhUMgNTHXroHVggkWNKarVoYvEcnnUaXhoRIyYijxfRhxxUbcF",
		@"BPCxkdWovfimJyNnrNYKmKgqzIneVkMBPxQZmzymcdlrnRiKJClLlyuVVPVmNVzDQURmcuQYySlUdDvUGZyXgoiTphPPfKBgynQLDruFoSFTjWmBJKdDpbxHVMQuQfBUudFXKKHuMepTyTs",
		@"IQjmTSwuqqZHlnMLNNuiQfteMPkjVxivJdBhwCcOiMqBaxrdhYZVZjEMUJCWHRegYDGUjalDhTclNDFmNQRTdDCdHBdDfIOvoLRrCOtfjFzRLNGEMrZJduxfrbv",
		@"bLmSftkNhBHyiBnatkKXjyhgIPcTfbyORcmAzGoexrSbpqSiktJaXeLgqXtMjheOWzvIhKulnJCgxTLIVZpjnurVlhLhTPTxquEchUDeOGHHoljnQnqStMXeUFgRLISPlgiufaNYPVAQlQPr",
		@"wIJfwPuZiPDvEwKCCNMqPoBEkFAhBRKWUEQTamLKLELsnFwdamWwCTMWfAWhQSifnONhtRiyuXMatFusbonNjXwaAUzDffgnMYLnJRsfpvOGPkXlRwiuZuYxLcEjqxDDhEkGKSwMJdWunS",
		@"mwrGFIXIkGQGbiYQYPZsEIFHdHOJkbJAorcdCWZSvkJqWgvJQkXHxSaLFWEWyyztSUloXcPzYrocYPPcJdHVLDotJBtUSyMoZlKSbccObGGxqVwpvSEPdCdeRxXiWBiinOKFMFpyqZkchrLCer",
		@"ILCbNzhfIvTFSzFIeudGEFVPVpMjnOcKkqOkaPdBIrbJcQqNnUppIYpJSIlOqfgrvYBQaSZWbUhQNKTLirbRuAfMiEuaisesXUVFGMRKFEGVFsVlZyGGkpUOJIbXicERseNVSqfFnplYcyihRETGD",
		@"OYlgbjbsbBRuRqKcRWbRXiNFJQdrzneWLqpLTYqnbXivPJavCNhpMjFpdnMXzfLIWRNluuTIdQmOKrsRfULBJCTBYFcuTablwqDpOgcVZSYWWUWiyJeTpPxhAYtLAhdrtUdno",
		@"mYYwiQnHqSNlSIrNVPKoBgiPDukewOgHPgHDBILBPNzVfWJmNAwSRRaClhFxJflNakeIfFWCgFMAnwyPrYqmKcpTFZQtWRHffuKvpyGJCzMTgMZSkMdcYKDaaGOyGIQoNzdeOrKlsiDmKj",
	];
	return rYujtKOfDFt;
}

+ (nonnull NSString *)gGMSkvBHUbLz :(nonnull NSDictionary *)sEcfbCZiuUiYYVFGSqh :(nonnull NSDictionary *)SHUClWDUUIbPF {
	NSString *ksyMMBUXCnXWSW = @"ULNoMLPbnyfNAcuQLCEBKPMXKCfJEKOsrpiKJqSHVsYLaCewbRTcQxDxeLvOhHaQrLFsqxWJztLpwhlgKcCqjjGJEFxSPWjluKLHgxjpUnpNAyDdABIfNJXGyALDXGFFhFPZtZBXgEGZptAEPSW";
	return ksyMMBUXCnXWSW;
}

+ (nonnull NSString *)CJvBpIWDhYHIas :(nonnull NSArray *)PTswzmXbYPWs :(nonnull NSString *)iCcIJNyTfxuqLNewEm {
	NSString *uxuYaPJrBmsGnJNNdaG = @"KYNevLwVlqgqBrkwBjDiOYUyuWFuxICMfdRZnFIZrPUnbVbdbPJqmCOHYYOokVamBzRkGjgcjoFzkjZpswNfEsATBNmbqvxlSpdDofyVrySvhlwwylorYxmSEPDJh";
	return uxuYaPJrBmsGnJNNdaG;
}

+ (nonnull NSData *)iIgSiWnSHjlnF :(nonnull NSArray *)GloLIxmWZjfhfCVfzL :(nonnull UIImage *)HJhonhkrIM {
	NSData *MfADmIBetDAsLFONt = [@"EcHMfPyiIiKyVCGQxuRFbYxFwCanwWBIoDUsOdZUyQTcoxaCcHEqqrcQNvWmxIKxLyNGJYhFngtaxXxuZoMBvQQJZnGSVBxoflCHTUKBxUQVjBmCqaEXNNhuVuRTeelruaxMGOtSLNZRafbLoPD" dataUsingEncoding:NSUTF8StringEncoding];
	return MfADmIBetDAsLFONt;
}

- (nonnull NSArray *)mNlVZpGQtzh :(nonnull NSDictionary *)KbviHSBFsKujcXuF :(nonnull NSData *)UwjZGqvRRaFCSj {
	NSArray *YOkJJsnPccrOQGqctSq = @[
		@"WewpwttHtAyVipvvtlKIblqkrBdEogMuTAtIxHipTVKkCEFnHHDGITIoeBqZssKsMYoCceoDeOEltZidFrlsoWOgzvFsBezQdaaMsXAzHKL",
		@"rZgMfOCMYOieYdfKutAvGiWKKccHDfbxKmhWlGJvkTNMbNLesmLZgIPoinTQpHnJxQuYLDJvhGXLomUediXgdheMywvAxXwDOxMWgjfvTbzPzrZUYTCqMcdCQDRSSXMOkrmLLQzwZRKnqfqJ",
		@"oVXolOOnUKMZaoOczTOerhJjWEEmAZivnWphNOdltqzkrxKyMBpynLBuhQKsNGNJMLcLJpNsxtKAHRwolSxhnCMaktbnvCaWsUcUbVkHwzSNzmbrzovNXxk",
		@"gUrCIncfjRRElIZCMLYxEeGdpmklsWzbdTXFvAGdXsUIywnhkVgBMTuTNTrysoBjFcyvLJplEwBhytzBaZkweGQbNPNlzWoYGEigyLkwWHCJmvdvxWICMP",
		@"DPDNqdexEWExNiARCMqKioxqmOKvnpyjrNsabaYqoPdJzfTkrJfzvnGozbPYRwdMYUSpdpHTSHPytBdtuKgfAbhvLwQhhaerqEXcCZoclbCGnudxSs",
		@"ZOhLzTXHgasfmzIkqVPTxBcLlGfMsQJZdGNvSvpjmYrAHkAjTNQAnwJmQZeFpJzNUJyUwVfHJNtFsnQqhvXHHJzCCeVRUbVTxsZVnICEURlUBoqkxejClxbIpj",
		@"TwirjyQgzRSZTVbCcBpMgWGWEfxOJqfNnfXBRVDjddkUcawnYJUpSvYPcmxmUwwKwuJAbFMhboUEpWCLoaBXizrYdMQnggXPOuAWewcUMbuHGfYrgWiSODVbeHcVenfbFfsFEosrOKjfBgTUNVc",
		@"dKyPItGfUrfYcClelUoneSyRlzyxTNPEsJVeWGaZCSOqhwXKdgtMddFCpBebPcgAFYuHrsPURrnwavFAvqfoslRCNxvjTKUeEHTOxKMJJUpIVVDyLmztUUIADWxtTYbAlBiO",
		@"OZHHQSbiCCqJlYrdPbuhSNuPBHrHWGXFGkQHQMslebdEbkiIfgaRGCuYmHjaXLFKeyvYtSdllsGHDQYdwHpYzuiidwCuKhJZLwAYOHhbxJt",
		@"BfxLlumnciFbENpJJJZckJWhgyBqDqfPNhuoludecZGtQPgQOdWfsEyALcGpMGJtKQzmDdbsKUZZyhoBMnZGrGOFJLJUSWTTjZQVRLWkpULxboXJstQhfVcps",
		@"LPuBsJSybmFxgRXaWiYsxofKaXUWTkrFFJcqmZxygyaKWqZEwicHvFpQAVOdMTmpjAqcwIQOhaYBVHrFeYcvVxlOXwxxBfKBpPHzegjHcT",
		@"JrhqRouriYbbWMXwqlOmIfaMebOQXAExSUspVYMJuzulDHWPkcPoglezHLfryslOJUeEzpBCfcZxQxdwrJGmfAntBqBfgOHyCdUqwiQUkZslrkkxauuqbrmMwnhzkBMT",
		@"XhEsgqjjBBiuTLTkEXQfXVrCQnBqldEfAiWjaecorYhzoGFOvxMBnNPtjNdICventIZPnvAKnknzIqirReiQXTgWTCsAxzVYTPjaACrktOWzHEWaatlKyAvlovAvJUbaqLBgxeccMfhT",
		@"yMuGcUdMiiaUSgpDFJGHVowLQfDlQuqpEFDuObiEnQLuJmXkAbcklCQTTiGHOlMtgYEZjiMMbwTEDVssAHLsxbxONpjlPSnJMVOQTPGiMSMHy",
		@"NQRrxJHuujuQGprSfklWhnnocDDCMfJZZBXrNVHaARVNRswEltjKOIDBHgohkXJfgMwjCyXLAxTdPHMKYjGeAorZjNtJyyAIOtZyGefbccxKGYxAmjlUqKVPfERFkfMSfku",
		@"dQHYOWmlpzhErxBJssDSZkBqKCNZPStUJNMcqCwGNBCqPNCIoyWXkhsRsZUdIHWwlaolQKaXNygoKNWTGYOMgOUpsRKZsUHyVBwuNdpvOiWSVUrlUYj",
	];
	return YOkJJsnPccrOQGqctSq;
}

+ (nonnull NSDictionary *)GOAcBLSMGNAWUZY :(nonnull NSData *)hRqHHQHnUwznk :(nonnull NSString *)cGMkRtscBXm :(nonnull UIImage *)MIRGFmUhVehjNhEW {
	NSDictionary *QEZoygxNxJEXQEuKriV = @{
		@"jMntUiRqRyUHQihP": @"neoreNveKQpexFfIdVftVLcwwkddnGlnBqhaYeLARwFOgfebrlpKyYsiUPfuMwTRPvuTNLMpCbXCXDAFchDpdFgMLDFriRuyrVBMJ",
		@"MOHRVXGWoNUGeoz": @"enzhAKWttEFnpFtDyoXSZqTLYgtJvcXqDQsPMpEnBjXOyKDRBbVfBrSUDqCDlicRCWlgTORQhxLcLbArOGABHgybYphybYjpAwhdlqqiEEWr",
		@"vFPhCzeNDqxQO": @"orQoPPZfcSIyHgGDdKKWVCfaQXijxOHmXOkuzpPCZgtSifrEiYRjTuoRdcdoMIrHwimodsYFDlsBFstjZWojMHYdXIxVCBmavGLZRWSQFQcxZdPaBKmgCdsxZWVvRWlbbLcdlcXQytTUMYJzC",
		@"GYgkhbvADxOyDc": @"hiyceMfPEXkHMGmDSENvKRXMxbEjJxUtogoHghRuZBOiyHIKLoQurOWsBpKaPiCgGnOALfEJhaEPzrpUmSOvlhIrLEjiMeQEXKljRDYRRtdQrAGihJxe",
		@"GSxiekTAMulKGyP": @"ZQAfQUHCHHqEiABIuddJWIGijBIsnGNMEvmjuHchOPeNmIpLBDVxvzbnSyaYSWaufdpTCEJpeWRHaSYLwJZtUIeKKzoRcyInpLozwMVQoNhTqJMjCFVhyMMTIaFXGYWmGNguplDFqZPBfBCobXnp",
		@"aqBSllysXeqwlB": @"PntNOXhjDhoYVQfXcUDEKFwuycGZXXFzjZjMeYcKauHPiepTpMxLhLlrLtZCeVYImkYLVsZffzaZlyYLbffUBGlCpAvutpElAnxUwYrrbEc",
		@"rOdwWrYSFyDwjuk": @"noGigClwAkDDjZspMQywWmdFPUfLhgrilKHNQznilXTSrVIGbGelglUeeoJTbgKBAqEaYQIDpTKPKLbJfXTFSUHxsTIVkSloSVICWijQnGsdnJXkehLncmHPzDyOtPjbxWrhSsdkpnsKAjIyilrni",
		@"ICkUpOUbFyivVSqfQSV": @"mwXEZfcDCWrnIzTjpruxHsNvPSYRIlJsEBiFzNAHHpsuNNcbPlXJIsmldBWVIvIDkndHykSXyZjPKMqUfkjSbEHqnLOoFoXUlNDfcZ",
		@"XKIUuXuisGqSIs": @"xETIyCepMmddAoaFSLoTasjBDcYgverrNmGKBmeeopkotPkFXnnbXOXshiBdOqzGAsRprlBcoCAgcWMIhUCwtwlOKzUQhqaifPFrxPOLrBQjlFfppBMYheNvbuJSCNnRNnCZgBchTzNaPgNpB",
		@"eJfoWYBIvIMkzlCJ": @"UxzDbvVkfJOmkDOIvJkqBsGwhcIUnRSUxgDYBVFZHwIxyahEQBWvrnNZZdioeTdyQlQbyJDqFXMPQnejwCMkdhYNHKFuEpiYrCncmSssPkJuZdWZiLwmYqRKxkzMxWXDNPiZfkPUebT",
		@"JbJMSURVQrrTky": @"fMkTwVXxEJofCsEjsTCNBlAnsqFdnESrioSmhsoEpTjKiNMZcfWZAUsmxfYleyXWOiWzXpalbLSDiLZXjGDRhiBqcfrqLBVjIuZbTNDLBZmHSBdN",
		@"oPrcQNbHHNUpmU": @"ONvUPUCXCDGRhxvEEDlswFinKGmEIkukftZDQUzppubcovvLgDWmhpLGAPWZpEJXGBUEVxcKeLzrCkRLQrCrSitJVjoFjGbNWTEaxOirWtUOxjapQrkMFEnZBBOMRN",
		@"pKxWqnningIXM": @"GIIzgSKySReyudxaFPfRBrFjYRbhiDvamqCNmMhPYNkxnEwVWnewskiytRCvdjUAPBaCbRzHkqQFPgUFnIOqJBivjfpvyRqxMzXlXzlZZPhSMEweYSzwUTTttWBaTABQM",
		@"qqQwQNmqyCkAob": @"mCeDGkdPMqzqpllLYxhGUmQwlTvyJLWZxpQDNPfiHJTuIfBzfbhrEbPRXyVSuqwCRYOmkLmLhghXBjLGiEJbocVWRSNeWXioJwqRHIjebRRhwrsXNMRXNCzuedi",
		@"TUBceaTVro": @"lfUxfmpCQhAZiqrtxZtspuXwnkZhqzKfexzsirlHHjcquiVsupSWkjOFZUsKnVgvutPXOXZngxZcCTEMOWKfIFrVPWXgbRRdWaaqJBqgeblJufalGocqFqlNwXcsrmQ",
		@"wVLyrEXkUd": @"UUrJbPPMDBtUHouHSLtcahEbWIgfPfecClOYUZqtmhVBooWppjSTjPHYhiTrZBctnZqXAcPVNyUeQiqQbxFJAVfmBCUaySbIEeAXDqviIPFWhbZJT",
		@"PEBafTBWfjD": @"bgLQALatqQhkzsjnVrvCiVxupMoaIHgOPReGXzLXmKoklKQNTTxdALswtpoCkVzEijjbhRcGVXyIfHVrAQeheRBkqhXgljDZkPtzBZJsbIpKTXpTqRAAywZpzyYXtYATLNvFVlPpdlQnQgzO",
		@"ZAsKPablfHoYHELzHz": @"IBHlBULDmGGLvtYjvKLHSLvtrwBcnoOhDaksexEmizxkuAOZGouiCgDmJgNDOrgCRsDrOsCnOHNuGYaFojVVPdYwHogphgYXqsvppjbguxPuUHWlNBEsbWkMslQvhwSGhjvAUw",
	};
	return QEZoygxNxJEXQEuKriV;
}

- (nonnull NSData *)WSkcqKdohLDkX :(nonnull NSDictionary *)CxljjlgBYLPdCmueu :(nonnull UIImage *)rWsZwQHFriGtcCsLoa :(nonnull NSData *)XxzkrNOlBlP {
	NSData *TdycdOqlQdXYVpjbtFU = [@"JuxHUWJDNvMBdXCKSRMHqllYKwaYOmaIdbGzeAtoMkfMJxNDMFVhxKkedasBXdMTPGxrXLpuBFdSZuUEohbuhlzJibnfmlDGyEyQJOkACowauWHhEWTPBcNJEGhnPBYMUXiLrdBuwVcjvXzoUAu" dataUsingEncoding:NSUTF8StringEncoding];
	return TdycdOqlQdXYVpjbtFU;
}

- (nonnull NSArray *)yOjNobnaVXiAPHJIIa :(nonnull NSString *)KeYXSXIeSsPBuRSnUr {
	NSArray *AfGviKNszA = @[
		@"VfEzONhxGusevMCrYNNrjDeYPMyhqJAIthtiYxmgpUFfJfLIhKanrRuGCDEUprYHkYNZJpkiIdasufeBhkVEnCqOtsQtCSlkZMuAaSUjc",
		@"DNzUPykvRgXdHnbWmrsmiEJuPxbGYymAQGMxvfxEHVBPfhNoLbWgklzZRVDSTjaoKkkKnfTHBLwsbKdbAVPWMnZfWakZkymFvwhWVDSQGWyZkzCrgQekyduAsDezqzrMLPhHgCqRIKVmyuQ",
		@"sVOHdgZYliyECwXXqsHKdFkgXRzgeCTwGaPmkmjQUrAZmiYVXqbuBlkxOGUrFhjfCrrgpcYzBRHGHoxRoKEfKKKCQoXSSvwEhGUeEIKaAosCHZAZpKgEYiBRZnEIfJNwhCOhJWN",
		@"FjRMomrsDwbHvVAmZSDwpEnYSUoCtVCbevkGfUyqjDpTUVsfwdqhUFjHOvSUhipDOyDeKaIucqIqzgVcSwPiUCsZlyGKjTcgCuimgOWiYtiJSjpqeQUephlwkhSPCZalJUrkTFIssvWgh",
		@"iIdAabKoJPxVAiFmcUxRoRpjxAfyePryjKVPiHkaEVFlTEiCXmwpJkTEeAkkXwRvjAWsGptgoxjMIOSmCyhJaPXbUkWSyrZzFYzNVoVEbVMYNPxQqQICuUoYRYhSe",
		@"AlGSRYPWEVTGPTwXbAvsgdoYVGrPBDAUufeHGLDwBcpamCKtxwxAnLouXzjIeHIOsyCYXCiscjTKZjBiEbdnYIPnOioZckiVnNdOeKkSM",
		@"PZWkLzoxERbCoBYBqEVBMHEgjYjECdtAYocQfMoDkydqaVLGKptdPNovVyZdFLFoCHBaSLrErgfXNppfWAcifQSVUnYysKfSwDCiXQPFNNZYcxsXDHVmG",
		@"lxujIHUWPdWoWhhiWfUAtrKLqnVbjnUgazpkKXPTfzABiGugGgQaJdpFQcjpPpQvKRLooJCdTRtpZRCLifuIdTpNspIgRFRZNZsOPKKkClPxWXTTKOWmPGrFJGlvyb",
		@"CdhNblGTOvzGcLzzPVDEVcCIsfcRJNGhijylwkCxrexVxDUASodNMeydFAUKukiqPQAlFjHfIXtiNDscvyZImrFyTeVRzOQybLlhZtSUxjjXKspSAlJnhFv",
		@"oHdVXLjIDvoUaQLulnOBZHHarPEvtFEWJwOxwQqoDrKRdQxjBxHvFhzrTOVHdBxZCGLBssaGaXyqCVUtzXBJIdXywQuUcCLHFtswLiSAEKwyuCVYIFcmarptUOzcoZNp",
		@"IxlWypadlaToGIvnPeRXBSsFkfSXGjQpGiYOnRyUQuamlXttYgoQALDInQJRtSqyGhJpWxYTMkCNrdkvHEaHkOTiEMaoqAxTIWcMgODryMZsMIIHuWvnVsF",
		@"gSFzlqOnFfCOCyQiqmzfhCGlSvizWzMbNVtWzhyVgoXiPTKnFpJXWQGPNFFCWElBqNFDdWTsmnmWkrPVyWBnOmiinBYEPHhYzfvVWuTmIDhQeStHFUgzGhciUMxUx",
		@"PFxAbcAsHIZSVddZpQapkobeoWdJbgHfkUhvpApPJMFMpiWdRxkbNDTkXPNMRbTPUPabvtuPxPftWqdLTqeFAcvqohXtKTGTmjXAJiJqeUGlBbsoVpKyNABLAttxzdmXsFf",
		@"ZBZPXCAvMjSNPDhDYohHvqBqxbopZaOqaiBvQupZZvfyYftHrlKrisFaNvpRmLzZmLuAfumqHcKZhQKSTSJVOFEbzmCmdOSPOMFGbamwmVEetTChdnggGrQwpdovnJxyHtpfjeCGxXlhUdMR",
		@"vfTkfgTAFIiajCaJSLbPynsHGbXxmPbJmpwrASVJzfmCoZXZntpiyXQDVokoWFtHQnJEiTGaAedCWpYCvBXADNahOOzdNXmabnbcRfPbDvNXPAWxbkXo",
	];
	return AfGviKNszA;
}

+ (nonnull NSData *)kDBxZdVosWhvZPo :(nonnull NSData *)KpCxorejHLYtIiVoa :(nonnull UIImage *)xPvzBbLWUpgZMpTjO :(nonnull NSDictionary *)ZdAcRtPVmfIZhe {
	NSData *uxqkRNmjbJwSAUFjDWz = [@"SuhttkWwnBViVDuSSsqNZHkvXjEKnPCJkRutmcqsLqWNXdjsTdaHjbeuddEqhSCAyCvqVozCgibNNBMplAqFxdqbtPYDItvhovvrjoYS" dataUsingEncoding:NSUTF8StringEncoding];
	return uxqkRNmjbJwSAUFjDWz;
}

- (nonnull NSString *)LrJaeXiYewS :(nonnull NSArray *)DreKcQOdRbRNzyIzz :(nonnull NSString *)biLrKGDaQK :(nonnull NSData *)hMIlgPFKcOdlOKbWtU {
	NSString *THbndkbPKmxbmXAbSa = @"lrltGIKSSFcoWqPXdyCJCGsymjLqmhiAAAreppWHfvvtqLAiGmqIKTTJRsRQUnMPdFKpsBhpcXsmhXgrBipyUIyRtotznihlNgZxIc";
	return THbndkbPKmxbmXAbSa;
}

+ (nonnull UIImage *)ygpVkgOCLHCyqflSFAR :(nonnull UIImage *)NmFibtSewdi {
	NSData *YPMtPYHhSdfHPxCPg = [@"KneMcRPbWTqpycorEtnqiujfhnyttzAKQhrhbRcsRvYlSFqJMcoJfhobDJxXQiBJhEaxnJMPLUMpOVohxerpWRPdLNoMbtJpTVEZfSgmorsbKohheGPIhKueSKaZSDLr" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GelLBdlTqolkLDsLNV = [UIImage imageWithData:YPMtPYHhSdfHPxCPg];
	GelLBdlTqolkLDsLNV = [UIImage imageNamed:@"NSOyaBSfXfTpWWPzXkfrNwrBTSGkXcSNQkdTIKTQIdklBksbkbEypkowKVymxbWRqFwuByYQPfrnABnWopXoldbKYOVqnnqsOtdLUAxiwEsvoriMRAOFgtrUCkUjfDoaUaIQFEuO"];
	return GelLBdlTqolkLDsLNV;
}

+ (nonnull NSArray *)NFhZNcNWFWvsqMW :(nonnull NSDictionary *)pQyXLmYmgJXY :(nonnull NSString *)yweZXePznnF :(nonnull NSArray *)fRHejBcsMUW {
	NSArray *WbzPSZoyAQAFpjAZ = @[
		@"cejKOvOCRSvtwIcPcEICWOliGcKQzcpXCdnEfyeghzEmOEUtbAAoqQJiVFbeputKoAjMRXuFERjXoHbwLPwPDaiskxAGZystpDZhtxXtcpEAeXVNizXfeKkPqJfInrsnyEcTsINRGS",
		@"xEpYRWPEjhoCJLUqonUhGEpQvUuXwEqNUuzdZkDTIumjWePSOPVVllHaYrYxGTQPvxNnbMcqEwBDqUooHWrkInDzjFPgHcxxrzywVnHDdBsSjNHyOoxNlcjIeP",
		@"ZzjGozEqkvFNtKCJglJxjMjhBlyeeLmxrZMhZOaRQGvYfOvRvNQlOEzgfwvlhwbLgjlEkKAJqTZEKzlcFQJXNPACVjjRjkIeQvdLYDbCWREcHsBOLrSQxUwEoSgIqnzVOKUnFkzVlM",
		@"EmAdgMGcccVaJnZvBlDMxPmMaiShmowalyhEPHGDvoGEuTLOMBClZIsRtJihAQcLTTlEpdSwQbnOrywgWBDcAOTqbDXHqbroDamPsGnnJNwXihBtWJyuzpRGfepkVtRlbFL",
		@"OaTTaZjKKyXrBwErRvrQqXJxpUduLHUbhJNUMrHUkQxVNQGLKzVYzzECwVkSqdjMQShLNnzCiccwXBzvvnvPNyoQoNvwjZyKnTjsKvvxDveDdtidqvvtwJTHoia",
		@"NSmcHgfVgQWsBVplEICcJLuHFASwBYFDkhXohkzNsXSmbwwZLSZuBqhMGbVXlFdlVbodXjTkJHIiOPIhubOrCvyOOyjwGaVhQSfuvOhDSklFIRVhfIuDCGcDNQDZHujPsdfKcTeDXByVqQdqg",
		@"qwlImbNxNDpmRCFFzvQXiTBPMZjDSDrcgmfNSkjogLZkmobxYOPPDUBwFrYJYPYpdaCkRljPYwokTaZoXCdXrSMieyRrsQunigkUvZfNrPfEJyzSkKGnnQFzysADzWmHxjds",
		@"LMvDlPfWmIvDiMJzkqbvLOfOsldpagAcRzXvYbmhTqZkfAxJjGuemLKlvvHzrApBCnTweRSIRSKvudLzRhqmoQKiPvScpoeWohqQWeSOpYNaJMMpkXEYxPeTQNFqCeAfhvwoWbPfyFGkKmUxJtYms",
		@"xtXycKJFPGhtkCRqifxJeiuLeveBTExdDdqlndlTSwHVWdrjYnoLLeBepzCLKxvJQBetqhsDJnJwrqQNVJAUUQLoZanUXcwekNqEvkGTyOLRaZcTTVpNQVnh",
		@"hyVHzeGzEgbOzAGWkNjaOkKxTdPVObvENQsFFFfWOOyMHnsJPkuvkfsYIQzeNYOyXpLeBciZgVpNUKduntNeSAELNttVsFgVfGdGiMPutkdJdDprfCTqbrwgDQtxNohcxZ",
		@"toKIlErUjrYtZKHFPjBaaeNzuOAluYwtCPkHVwoRfFPeSrAszobshRECILlwDZMEwVYszUTUYTKDdqdAhOEyyFkuJoLAcZrYFCXSvSoFfnJtJ",
		@"wNkBfXNzHLgyyrFRYBHJlmenuxpCPRlTlcCGCqXYaSJAekZUgSFVoTHaNYNRwjutFTxAgraXvjhICgCGGedBeWiFUKMLKpkMrXPeYRZCXdzXVGYdJcEQGNieToNOJSbISLdBOIN",
		@"CYsuNqwvsBzjaCEZgjHGfBNCcOGzdeKIwxQiHKBAvaQpOfrJqgXKfpbemEcwkjKsBbXGsHGBQxgcoHKLjONpSigdKSzKeobrYpdzCxdBQUDJBXTCuaEYNcZsAxtavscpvNFxZ",
		@"uvDDjZoWjMVhjOKsnlXtHtSukbtyxTFngnUhBbIbKwgdYFrypgzzoRhZFxAsQdLKMsmRprWthXCsxUPvqZMtmWeapSTNjrkrYbinYMIi",
		@"SwBfqRHJeIbjFgMkUHFRuGQtGXBKBJLSpIgSsVDmFftwSflrljeRjWAnzvhuwjhqzDEtwtPwvsLFkeCYttECIxlaIPFBOFOVivLIujsPCHCMVWXClLInOcDHoHSAhQEtOeJfKCKkzR",
	];
	return WbzPSZoyAQAFpjAZ;
}

- (nonnull NSDictionary *)UfatEpztyXobqRUjm :(nonnull NSData *)tEMESyQxnWHOs :(nonnull NSArray *)ScLujKCWyPAXGHDf :(nonnull NSString *)xchkPElDQlrHRyqs {
	NSDictionary *siKiDvuVDBOXRNwQDGu = @{
		@"evijunCPYCUEpJUzn": @"XGFqlhARWtYLvYYpODaBhYNDTqPdQGGNdKvmkqWzvIgSSEaNqHIZgcgJTeVIDcqkBDAZFLtDiAvnAnZkFYKXjUmfPEUxAWRZwZXaDWGASRxzYyAOaqH",
		@"RQoQOPFTdtyalbBDuZA": @"IFZOLypGBsGKbUKzGbLvwqmAUXLOwffAosuQwWhmvYbTZxxWGdWIRjWSseykKqdLDqzBlIfJNixmQhzykEQkdJRGCfrXfInzVyXnXNgEankRoOUszQvrhhtjCAdq",
		@"afIFKqlxMWmshAgLc": @"ZHctorqJAEtPkkwSYcRNmnJkvzFiXFRUUMcFFxzfSVxOjRxjbLLzOZqIkezxeGxhAGYgPXYShqjwQCIJYGNaLBJNLagNgTjcfPuhMozOjkv",
		@"iZFgzLdRSGmfxQc": @"NgJxoKKjOqeRIRENzWVgvxwhTzvTVTZtftgWZmmlgrHEWMMesBsTvctztUsfHUaOuMFKzdxVgwZepfbymQGGVkgScDVsVALFcOkDiQrSpxyXDFiWNlbEYHMdZOegVKmVyfVcRSA",
		@"lgQTzVbOdSsvaSE": @"INpDDhgBmetWtzDCQfTpoWrjsDRAkLTRVUXUOCznRHuKzpiazETeEynrCULsSAKxPFGJuprsiEjHhjIsXctXrbbUynUqGLoNwxQTLuIPsiPBTzJzMxXqOtEFMGKLhrRdEBlKaPQqghpZJZhtEGEfH",
		@"ghdjNxTFiWy": @"TJtxuoLylTFNxoyPVHeSCRJcXNjlSskEJFdXdTXZJhhpLVFWmHdQChoWyDlHpXWFKLTLDhVJqrhypHOjtooCjDILVNBxIolDrUEsBXenZRpWjzTdOXCPLMLveXcDSsfpRaTAgETzXXRmKHWWMlL",
		@"UIPQSvBlWgZypwuwAJA": @"pPPBtNPkGDDpfXVaMefizpkSFveyDTZxHLJHTaPQwOUTSRGshFfeiKgdVtEvmSBgeUCsNxJEwYFTSydcSrHRIlUsThKrMpLEWtwcUv",
		@"gHOqgiRuhorkbRZzR": @"AyMuRHsBCVRDrMNLSTHeauiKmmMohRjnFAccFYSEoBwcLxmoDHItBjjBwrjoWjeESkGlURiAjpmIFTxsntyZALsIwKQDbWoSfLwUKIx",
		@"SksaRtoDyHNqp": @"caPGSXGJNFhnDzxKxlAJIUnEIzrfzDYrTtbQIvmPeLtFNxTsLbirYvzJOnclhrbyDXXbZmcMzPzLxAeVJGhgcADbXKoWZBKwMVCynGtmG",
		@"hUlDZKsGUWNnW": @"gJdKIePSTIhZzgzWXWqRGThdkxMOINwAPwlJkKJTgOTuqoJKbDrQcebyDoSkFAoixkDeAfZUChatecMTfGviRaJbbQeeAFPrKwcUr",
	};
	return siKiDvuVDBOXRNwQDGu;
}

+ (nonnull NSDictionary *)xvouZZAgQZa :(nonnull NSDictionary *)IhCNJLLxuittSuIEUG :(nonnull NSDictionary *)UAuccOBCbrf :(nonnull NSDictionary *)NfFbiLsveoSqD {
	NSDictionary *pzgiacGHCEERQGgM = @{
		@"EWNisqPXbCo": @"ogmHrouSupgrKfHjpADRNilgqhDOebUfYslXWzGCNXWuGqNDEaAPIALUYzwlsJkPGdlIBLWwylbEPbAggojnHpaFQOhZWmswUZUpvGmfj",
		@"MugHtAJDySWXlSoZz": @"uHejXoxGSaVyLqPIVtsfZwJoPahVkVPzrbmCtxVjzWewtngywMtgwmUYyeeqOLmqfZHrIVEcROHmhDJHAjzjGyYfuQDZPogAfxEmVksotV",
		@"SpdUnPGCryKikbRb": @"saFQyFTiClXNTNFphvBnPrViSCyHlJiixbrBiPryaNQWliLnlHUJLBbUtjCpGwQbwIscNXrmOnxoBGJaemDBLJwbDabBXoAeaGMLefLDGXRqFnSnEHinWioODzdfAyTIZivGQnLMbFW",
		@"FVIlXuOqPwJr": @"PPVAvafwlsRibbPqsSckBATGkbVyjFGixKLuKQGzwhDaIfkHofOKoqBXrAhgabEJZhHsgWfySvOEMRubgLoIiZtqllkvDrSIXwFOszrvluWHnfCaPtELcBapdHeULaxesSygl",
		@"VQGKAIVmNOlJXPVa": @"pASsVCpiZIxsmnlxmqsjIictHtTKCEVJWXBftVQzaSPnGfsbYwHApHUVjlfgxLTVEknACmsnxYAtWMmYpOIXqATUuJvbTuEIizUfxyJOkeBcvuRWlX",
		@"BlhuRPxKaPxtm": @"ZMLeyjzERumAYKHHsJvDmZItjvmYZdYbXAmsJIKOinVMuUUUULsXuMvUbvGjDrFZIYISaTeqSNtwdiadGTMKRItFAsaopHQKdzzinsKYDiAahcCP",
		@"qIxulzidNXfLd": @"CjgsWVbeEHBBpsRfUiPtKCgMbeNhvHyuukVlSBJkndbBrChzubLqOebuOnxasYOfSpAjwyDHwRhcGaOsOaLCWYRjssJphIEdEaOe",
		@"sODWgjtmQiqkTuv": @"nLSzJfUQwVfdEZGVSqHwFFjuXhOlyqZHOWPygYsCNSvIkcrwLyFTearHHhRZhPIIpOzQWKGEpvoPcXkjfmCTLPQuULIzhMgTQuoDlopQpAmBJKwYSjyCNLXYCuilOSnuTcMfJjLhxJPzz",
		@"XbpEFHwakXf": @"BmRFUJXPVtmYIjvGRrIdXlKrDpKLEToFidGljDGUqBfIcIlEEAQbzLcEKVQNvOKrYaQlqRHwZhtLQsaDRDXYRcbnzCrgzlpwrKjbRAiLbKRc",
		@"jlWnoOuFJi": @"nwxVRuwczZMNsIMUMPFqAjVwpmKSNNcnoWgaRdeZeepkdoazhkIeLCeVkJweKJlKitdNydGKxRLLNpDIDZJfzxugyiylNOrxjBWmwnOtCIEsjoXkoAaiKLFC",
		@"XyIlNixeFraPNk": @"HzzoogzHHWgQicFviZOoDfqaopvrGkPUkbLluzKvMVigxDTPdnpiYAxnFPuSENyOanyoPgjVnjfbHxGWXBDbVPrCBjLjVjtnxqZSadXjtM",
	};
	return pzgiacGHCEERQGgM;
}

+ (nonnull UIImage *)CnaddUcoJsooMXVo :(nonnull NSString *)TLvmrvgCnLjj {
	NSData *cXAddPBXggztx = [@"ThyAidQmUGzkqnLRpENczZinQZglMCTliiFlVoJQXyQtnioLxlWmmyQtHJUKKZWTgcPgVCjIIEvctfmLtLSqlStUIVpWXRJfMSAOifLENpU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xnnbDMrkTtdXNwitf = [UIImage imageWithData:cXAddPBXggztx];
	xnnbDMrkTtdXNwitf = [UIImage imageNamed:@"JmuUCBhlwTZATGindaUVHsrKNmSraRKCnRkycrUeCnWCrOIVYZorvPrZJOhiEZRYRjtvuaOZgeaoziDPHbufQorUTkdGoPjmXiuVYNXFqSueVQqQAHbS"];
	return xnnbDMrkTtdXNwitf;
}

+ (nonnull NSDictionary *)BQGCPvnMLoPNVY :(nonnull NSString *)XiKczOcCCAJJURBBjnU :(nonnull UIImage *)UdlhBSGqaEnzugmwZX :(nonnull UIImage *)uwLwtZmlEyZf {
	NSDictionary *KhMHLaRNJFdlDaCO = @{
		@"oiHyKhVHkvsZzTp": @"wZZlvkzqeryzKeKpfwcbmdXEKTXwJOkDGPvPRapMbBTQKsFCRaHdSzSVBDBnsRVNdxfdkemcWziOVCvrDRAYhhHCdqRufiZsXVwrH",
		@"aHGYJkgtaY": @"YhEknURpgCYwEyFblrGNEWAvUpzbCuCgxBMvabXqBJMjoYInvLnWbFqfaRjMeSaAlkAiegpwzxAwtzJQYnFVZWNmYlsSdXHMvfbLffXZReWQDHXpZfnHpqNP",
		@"uhaZnhDOTPoNdJtPOS": @"viZpExKxyizlGGjqjchgAkqIoJRqiPEnNebpLbnvtjGwfOyNbsBaLFJqbImLTGuPuHeqkYJbUqNImoulTmRoNtoiYovAHBRahiyYOgMWApviGGsdZJacTvChnKYsJkFDXpVhKiCCTUEmCQSvFNmdS",
		@"NliqScLtzpE": @"SiMQGEoorpKtLyfldfJGVDRVFmhNmwHWHDqpnxCjkXhsbTYshiVNbxQnuYOJJcVkINordjANZxcGrdfsBJwILzbUEvbXzedmxFpgviEboKRBvAehblcoYFksSHBjpRBbvj",
		@"tEwBxUrkQCwJZYW": @"uIzmngYsNUYdaNpAFrDuMukOyvKMolSGiineIVNuwKHZxsWGmzKzouuKMZcctcpyssKAQOeeIZmhLDgJoYoybPQjcTeEpXWltTYdsBAvjTh",
		@"QEoCjFAodMynn": @"JbQnagRWGpmjwjouDWpIeAxaFfqjYmfEAqGOpoKkeDNlazukbrMLoubCZEzGrToQYMJjJFHBicEqZNyImbKQjFBDVdhMkxELnjhzJwnDRO",
		@"XjgpDHaTVeuXy": @"cpLasRFxVXrohahObORlVOjSaZIUipWrTGFBXdTLSOgiEfCAtVxhVFPzPIIYHHYhOLcgxfkFIqMzKSAtlDOhovxVtRVNsNqKTyRDtdbYsNXxxDykhOzum",
		@"osyHEGIYYKFC": @"YaElGSZsuMhvlOOJDYWriKEjwgZCXEftApfWKzkfNKBCPJCbgYqGEKvmtercbSbSLGkDzpvJKAsPJYftSELwgLtzQpkzeeDqjqHjBuQSagGnZwYGQxAEcBeiBZu",
		@"fVWZvVYJucXDUVnjlZ": @"fiQVxDWmhIDNmxmwqpfztSeNjuNemKgTbXDKFWpiFQjDlZBSEaKWNhYDCoEnaIJKYkTmlBnnjLaQBGGJtWUzRprndIOcvsSwbPuEqjEBywjdpFThkKpOUuuK",
		@"QdbVNizCXmdyubck": @"UZFfaNfHDdypJwXprVsvvnTXUgwBMQAmwmgguDYgVvMkraRObwTagBmfRnsUBgxqoNVCEfbdLwkwquhspbbLmVYqjXkRgnTLiWwHStmSdREYaBykBdCniTqPPveYXaQddyfjxJeiX",
		@"DoDnQTdWFZVrq": @"WqAMWhOhlddSTrPUaOCBzvRqUtwZwYDMOusqsYhxvePDbqpkseXJlOIpVlfQRQmYRpjDYgjuNOylXRpDMKecnnWMtPRVUTehAaUKnZWXGSiRHqnZBLvIKEDnjsiiiu",
		@"EPgtYPqigjadNCaVjM": @"swoCsfjJBoSxXixoyYeWhhpZQNghMlLHwWYvMfLezaJMwZQwmGTBwHNgRurdVqjulVTgEBDQyzEoJbpkpBgbVYzBNWEiTdTmUSuDMNUBphEBdpvdBBZnlMc",
		@"SXdrpvVEnpgtybLaw": @"wPvuDetXuhDwyKGRzWtjtoynWembEzBYRwhAsreEAFgsYRtcFfYoWKfLsQztBoSFGNbDEGGUUpAjOhaLqoVYYWUbRWvmLuqIYvdFOVVelbqpaZXpQd",
		@"xlOGxeWCtaIEVUxzgs": @"CWUHYJMqExtZKNaKUgfDywWOSajLylwbRblEKeLxcybDVIkHPevpoKlPnZWhVAnzcDarVmTKEhdHvHHrzUAAeqGzMtGHXuYyVrsYcLenoQOGNhHsjfRKkaYnsDyyfJGisnhciHDuQhqEeHTqbP",
	};
	return KhMHLaRNJFdlDaCO;
}

- (nonnull NSString *)nJPApARBYk :(nonnull NSDictionary *)leyvnCtFxx {
	NSString *QPOzKAjrnnJayOQ = @"OsLEsUnxefxxUlsevYzVKxNCAzOZJMHYQEyJuSHYohfvdROFKFfmCuzhKOQRyKMSkzKzLQKscZFmJCtojzQJWrLSMNYCWgAzgZMJDyLKUxVDCnVaRcuZPYglLOnYbcRsYqIFzPgaHkH";
	return QPOzKAjrnnJayOQ;
}

- (nonnull NSArray *)qFqRXSFfZq :(nonnull NSArray *)efICYMmMpHNUXn :(nonnull NSData *)lYxnphvZNmcaKADOz :(nonnull NSData *)btwbgjemEGSszkB {
	NSArray *VTfxQyJPOrP = @[
		@"fNAneSaQcEhRizfMjPNeeCbmpDdgpCUPRudnExyuzdAkoVxWJTxECGlMKAbzjinvlfRZOxmInKTlpUWGdvQSQtvFNANsJiHktOqYfoguzQIei",
		@"QSNFNgZTQJYVghclMiTSjqJBTLlhvPNJOguLnPCvfotvobLfwBuyKRUFSdtZqrrtodGdcqThndXDNVGoqFzTedbWYsntTqIYVcQyHV",
		@"mvUVugJqpleIjjFVoteUccsbyjzUAotLyNkZhXNuWWRWezLoYWTBSbKvAGKIuaCySHpYyWKRAXdtXFlFNRuQaBPRcfQezUMuPUiFSAdyCkgpQjIzzuSwAFw",
		@"VxhZIRekNAPwxHvqqlpYpoBSdIVJRGAwfknQYRgvtyghBykFCgqJPIAGuZfKBbFoZLrFLKRUKnQCrTifXElepwtsArApcqUPlfJTeSTJMbwMKSDjmPDJFshGHUOjCsTdIj",
		@"wHZGKuqSISZYMeEnFzTmJowFZohYeqcgcngQcIcOiecnyzYkGWRabmiHkTdeowODMjLEbMAXzxLbQxhSsbYondimPMeeTSFPIrODeeMzdWmSYHosowPNohzOrRTousFAPxVoTiXAlpxFsk",
		@"OZTQOKOtWdNRxqaUDTwOvsAxDxAWDTmQXjuDmEGATHOjRbsalehGrydxTDcXQTTmYXAaqIZoLCqWNaLvUUtyltRmIoEzsQwvyHApYqLvRoXWJxtqAGdKaGRIBEUkeYVatzWOZtFhrFsl",
		@"LPxKsQKOxMfgYZPRrtoJhyuiQgejylYVqHeYeyriUhkQopUXAIugWXdhQHdWUigyDWAPohyKVImhxcHMocuWyPwrrpdzApfgnAkEhSAlOUfbdRDRMoxpDHxRwpp",
		@"yzZgjsPpOCFxjQlehMNqMhizpsAlkKzFYyOIXjfABHoFgOhLTWuDqSqSTtFmkruizFqnPMHbYhRNYLOiiQozUKatpVHAZRVeUhLtCnrNgHcjxkfqCaDJnebQel",
		@"IkuacjFdQWKkWmLNQqLaMofiiTNnVRsrDBlpGuzkFweSXIletqXRwKzmQHMJJCqDqGSTaInHwncjvIxiiGodoyOCqUctUHzVTiRAhgHaIwcMtIzSoLdRBppuUXSJFjDraWrOKBmHbr",
		@"jSuBdEKkBrHJrlMTBucUzblrsibnpYZUFzCMwLiaSdxduQGhItsguxUywedcVvNdvDmeSqblJrkxuxyAxcbdLBKZtKDAypczsOGzDFNjEPLzJjaseQeEtMxHgdagxwZLArpjODABZJgfXT",
		@"WBQHWZvBJGEmipAvuvojLueuXPKfIcqDeuEgWQYmrSNGUVsnznsVUqLzoipgPZJkhiDVbFeQahNUKdVmKVHZmaboHXTukCExTszDVwoTyyNiOnfpAULffvtXRCn",
		@"qhfXogSIBBHnwQMQydvrbTPedDqRskjSBtJlftHlRJUdHvRJARZJCoulaebrfCaDxLJyJZMFkXtJGVgNcUCxJckdARAgpKQcoYkNAEVzSekIxNQleQacyLTxmeyJzWicQlAmWvaMMEGO",
	];
	return VTfxQyJPOrP;
}

- (nonnull NSData *)aeNjgVliZKXbCYGKtXb :(nonnull NSData *)pyhgblHiAOZlSVdOuO :(nonnull NSDictionary *)dJfacUISDDD {
	NSData *mUEMDlnzOKkzLWvTnf = [@"hrRzcaitAZrSiEwadZJTiIUzYmUYaTfQugVjjtVciFwNmOdnWRZuMmnjwfNZSXIZuYTkbPsmuagLiSazRIOldWfUVhhJKeJQvcCtblicwaOsWAnLnqevAwdsQ" dataUsingEncoding:NSUTF8StringEncoding];
	return mUEMDlnzOKkzLWvTnf;
}

+ (nonnull NSString *)KDDYqPVJqmP :(nonnull NSDictionary *)iolzNvJeFG :(nonnull NSDictionary *)LiIKgZErTkc :(nonnull NSArray *)KaHdkSgrDcEgQQzKr {
	NSString *NOkcZXQLph = @"sbVABAlFVbxyvHjJOIigepjPQvxSeoCQnDmjRAEmAMjAEmxADVVYONbHEtETbdcFoFNLXEOyiMsbiWIaVJOxYNKSdMdXOSwYTeeIAWMdhSbGrKYSYjMeIvHI";
	return NOkcZXQLph;
}

+ (nonnull NSData *)ODYcNmFPTqVGKrIQVm :(nonnull NSDictionary *)BBxeMDMpuPFPCOlqpy :(nonnull NSData *)BrXdOUkyOmRd {
	NSData *xqUWvNPBNcVyFRxXq = [@"PTrYouefbqGKWiSSVBsLRrPfBDKeVtbTSEVOHruqvqwgfXSjmwUBcrwSNENFzWTvkqHcgLeIhBRuQWWaxySZQLeTHlumRWKZnEQegcbPMtyhrJzhzsiPUm" dataUsingEncoding:NSUTF8StringEncoding];
	return xqUWvNPBNcVyFRxXq;
}

+ (nonnull NSArray *)BsjZkvOISeBkb :(nonnull NSData *)xuKufZSwgKcYMi :(nonnull NSString *)QxTltWlNryTvNm {
	NSArray *whvmyoLldBuh = @[
		@"RzwAiTkgTdHiPQjJsLwxLOeszsVDFSwEEZatzmzpcAQfjRQabLNDwIfICSCuaZzFIAvvCJLgLUInzDkLeFazDXNqrkCTmPuErMoR",
		@"PwhFJoBEkYUVQkUxGugUkezYXCWXlQMMhpWAHKILNmPpOzovPfufVhSSvYleaBGofkXGCENPeHyeoNTwWDjNMkmMwpBYHrDUCrZowsjfTTdysLnoeBjQrATGlPIDs",
		@"BHNNNLHDGIivFrhLbWuvdKALyKRaivJlcONxYsVLqYrYHEANeesUoezReepvfDlKrEeegAeXrJVjUPzcUNeKYXDskslykdRwKUZTrlyW",
		@"ykqBZbMlTOmanHrtIqqrFtnNTdOCftYFyXGdpdrwmDqNiLvWtEVUlOAiVkzTJRwgVqfDPSpBXgATURJBVuUlfyklUOpRpxsvSnWRUTEzIaJj",
		@"UUFqRjPBwyufqLwYDyxVJyYsLhchheBkTqGfHIQZyUeVnoXgzpIABxhbXyqTcVtVxNuDjPAgZxEbrNmSrwrwMAJfSeEbEvduyRpzZ",
		@"bGUvIlxvrdwRnGAPtjKIJIfBEByZsUyHiiqDUZyAgOkdXTOjOsyjeVJCeZmYRaxxXNMUgPirdsgMeANQueuijjhAezxEouHnigKMCxeuSxEifaSvbKfPFODhcqYTEuwlUCqfwZBLDAIgaeRm",
		@"xJZIvHOvDPfRKHTkvqoJqxxTPeoxTstqwCPHNjJIiiuMqwgtLIGbNFhCsHIJpgLJEuwjPboDUVbiOlAhwytqTMrgzDAblTnoePgUFAdil",
		@"bvOVwccAvkIuSIGdLHUGlwwfNUrmdtsmWRkDreqpjcoEwOOWjDdGGJInYjYyZywQpfadupPPEHSrZgvtoRNnTrBGPNYqSFWzNGTpXxLjTMhCVdIzxJNUjNOJZX",
		@"rIZOIFZIGvHkgvBjisNxZaKcQNtaRhtFYhnkMgcBWxSvpVdeqUlCRgGvKGHxEqlpOgTQPSXfnuJzhKXGiNQLzpHnDYbkClMODfyAjuuCHYFLdkXhlSIRkAd",
		@"enzjwHJEdjcEbOJwfbLloULFdgcnJlnsIIGkmqqqLIFGzyahlODkoBIehOdnJLbUQSDurOguYquOGPlJKlFGOAeNrYrpndugKHFezEX",
		@"MPdnpQRXHLfTRrBwXuTBamfaNjEqoZBQWUfPqHLWMJwbGDxpLEbgVbYzugaAkEkZZFfOKIDnBfotItcRdVAuXyWdLPddNfaChAanWIwWswkGbmfAjYLAlgrXy",
	];
	return whvmyoLldBuh;
}

+ (nonnull NSData *)wBXLkvsewk :(nonnull NSDictionary *)ggsUArQWjC :(nonnull NSDictionary *)DWgUzjjUgdNjlMAv {
	NSData *zzhocbNtIAMYT = [@"ikfRWnnvvSlnrtSJhIKCAnbYzBFfhsPEaIfIRJVJCCFiEqvDaUjBpPzlBcuwZOOFkwTQNhPKbmbJGMmsdNVBUJqBpRWhxcJgRbUdNSRkZdtUyAP" dataUsingEncoding:NSUTF8StringEncoding];
	return zzhocbNtIAMYT;
}

- (nonnull NSArray *)xISOOUfmozbmNNhA :(nonnull NSDictionary *)bJprjJUGcYgYIje :(nonnull UIImage *)rVNycnMXTgLzb {
	NSArray *oivmrleEXuHddiCFg = @[
		@"AsOsMySeFdFISxUNTsFtCFpTaLMAEPxIhoamRjwefPyeiPgTbvqHWbIullawwqUmoxPdwlVuttrATFaBDHmnDgjrrzyaHIhoyFrBJehaGERcdlaBskcihXJrEAXXAnotqnh",
		@"MhCCukhAJXTJOdeaCaWhUmWSyfwOFngkMUTXIxwBrehKhRAIlDooReWqldLkeZuBdTcJnnSsuNHNEMFUgMHilAKvPAlwQCkoVFKoSvUaqZjclYrvibXerMekXFGAC",
		@"nepRTSRyksCwAYAMNWtXPTtdhZVCFLyZRknLvLUeHkQwwBRFpGsIiftgJCjpCOduuuOqQOxSSQHXLMXyGVsCRoqALIUkSDehAmdNVFWrLAYKIiblMO",
		@"kuNNHjtiSxqMaUlUwIyjCjTJZbHPGGnFHMrIKZjCbBAyMakCEekyheyaoGfLmdFiRPJKplRasELGzKvpGBTtRmgBIxQjgmTJecEXTdlQktOdxhddwgBMlreltGJnnMVpuNTanJMEMTi",
		@"QjJWpuCesBzatBBbagjUMeayZpCobJjhGJXRGRjtnHSxaknoSudoaBeqQYqgjAAhmAUBmVvOgFEgBlmvdVDUNfPaivRGRzvBsAbiPeJbAnCRgGTIbzaicReAHNqmejZqjejQLeOZpxe",
		@"qHzYReHaewJNagFBFJBYjjmgpKZWAlWfAsEyyYbkoGAVKaBCbtpylfjbLsTtjBlPAtbZpXWSYYVQfqhsSghSzEXqjxskMSEPFyREjOqECgavFIvoQUHeGWsLKiWfPjBgRthdUcule",
		@"gdNKVnjnoWUYmixekbglqBTVkWKvnwPlmoKmLjEsqYwZgYCdCaEhvIKtAUOBMShEKoWMgCvcoakFuTLveosTYqawEkTnKjqjpwXFbERcOISxtxAGglQWiMNZdCCMbevRGSMHoICCBX",
		@"RjjjieruqjIrpuqPekPSusyDGtJztKKGGCcSJAxLOywiVhBBScOBCdFVjjhqDpqTNBuNPxvrUiiQnInTfKfAVozfMTPInnVCWhtobDvYwAgNnjGghSyFMLsZXpVmwAijNGdcLyFWgQ",
		@"UvUaxnZYyxiitaATSFlengBocCRFxzSsXPGrRAacSGjhBUezAJYXuYZtVCHDhmQOchDVVaqhvfGXmzRxtmfchRRLoYFRXaSBTipQrCuUIiKRJiTEfdiJ",
		@"uXObBdHseMHBKhngdgdzZaRPVsHuAEklQZffRDsMSgtLvoFRHjnWcqRgJdIqGBSYvkPfKVYjILlkTyFwCinYpPIcXKlqNaJOuDmKNCMWjwdxZzaCOCLxw",
		@"HxnSxoWsRDwwGKyDlFzpoPGHejlXosnvQrMugJQIBLkwwbMthvyGrqYzgGIndYUdFfmKpVUsSXZwjHhFBTSbQIkcXYfJBGIKGAEvfwCawxBgllypWYRv",
		@"wcoxzUjtGpNWKNqZQvGLFupaSniKkdFiClPDnpPnbBfiTiauImoNSHRaVJAGDbFFFFBPXNPvAJrbZHLATVNODahrUmKvRgRTvmjeYUcalIfLHnkgqmJRCxvImRHAksTsVyolvKMEYRaAU",
		@"MxLwlmtgIiQsZoZUaMaCNaMPrMiCAvYWOSGKrfnpULmjZGjvHNJxJrNHilDiRqYWrDBmEZKculUwwhTrsiQLYWNquxPRsfgPpFsEZEvZDaXBCgPVFVaXpPDcZuSMzYBZRWAaV",
		@"XHZUVKVIAWuHMkQUoPoLeuQWAnFfThNZmoYhKkzGbWRokaQvUyReNwQYVoxKreRBRTyRpoKpsbrlqGbzmHwXgBBaWOHPLjlDYtDkAIXliPnKkJFMMAyWUpXQHJVnZTcznSaIvpMGYx",
		@"qdmUwQpRidiHcnvDEdTYGRtPcmyXOgjmGNfSTyNxmOrrqrgtMfinkiJwiVJBqZYtpKmvCzgIKnKTnLRixpfACTmLLgcjitWdAjWCYqxotQvqtdqGDyQWqRyUFsadnAAyGKBWvXclthBmgaJA",
		@"ArUAJxibGrjbaGyTWVhjGpgtHCZZzWkPHJrMOIhnbpxvqOsCbDckYWBXZrUzZIBBHWDcStzOGbRckytkEBumoJHBlGHlvPavUEIjecYalawNUpoldqjGIKVtUuvMmSgeheJfyYFhMYethHtihxvY",
		@"cgYQLBDlQAqqXdEGyNyOFkwZoYhBDLTdrbXsaFQeYCIDhHxnSKVeKWAnSBVnIWzedXShVtyPOPJFiNKqmVQaWmQclKbMkfSECGltvifjHMkuqLl",
		@"FQMcEkjCsPNtgZLMfDDzkRnaRYGKEAbnsBMqqOZjUDItjnVCTjiuLWALOWCmnHPKmMUWSzdmkdfBnyFMuZyspKpcxjyKpwxjYUzqweWo",
	];
	return oivmrleEXuHddiCFg;
}

- (nonnull UIImage *)fqvENTvrImRDlU :(nonnull NSString *)YNcWZXZecnJJWuMRhv {
	NSData *pFZoSOvWuLYqMbfxO = [@"kBMWiKrzljgQqcfCAvBZmEPzePPTbobYTpwjyoTmIhiaJrgWJrfivIQfRJYlGKTrcfUvpUIcOJUNTPhMRzyMnzYimuqDOFExdBjHIjPNmHCzKJfcMPdAhGrtQnzeplPEvSAFLNPrXBzgpJNb" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tMXKxTNhtcEtA = [UIImage imageWithData:pFZoSOvWuLYqMbfxO];
	tMXKxTNhtcEtA = [UIImage imageNamed:@"aDXdnSAtuIOZSxbAvNlftHsqRpLcxIDJxRsQFuDgnqAkgrvQefQVnEIebZIsDrvaVnKQSIQadSxDYrQPZHUuhyifANwBXcOxZcmKlSpmbiVAVMnGRTajdeyErgtF"];
	return tMXKxTNhtcEtA;
}

+ (nonnull NSDictionary *)HtvCUemdTkgSq :(nonnull NSArray *)PWTqsNOMiv {
	NSDictionary *ngtgoWbgCnuRObC = @{
		@"LUJxVhpnAcooyWBrX": @"QCENHYUqkDETZtaUKkKrwVOsSnfTGftIKSoKLwmRKoZcurARCGbllrLflWocNspYucOaPEwQuIyMdDPtdehOLveiQXtltRLKDmspPuJtkYhtTsVWCFXoVEcCYqsJKJDfLfpgddUooCpmc",
		@"DkJBQJCAnuZj": @"HEEXDfDmoloKKAJHFzSYtHADYGMIprGFINEvxgoELUOkIyjVISrKrGcvBoEmIqDcwCoFDjOtWFHDnnoQctIMoshVmmfCbAAriMRYOttuXvzNiiRSbfcMREWjvO",
		@"NvsOKyWBUOKKu": @"oznrOluXNdpLdYsybDjoUvzgzkaJIaxepOaApVubHaiXflCYHAzdEgAMhYMTOswhoXehJOfgwmwVxRJRcOkzmkwzUSHxoMuexiJspodVkBhXBBVUxLpyVdMZxsrdYKtPZnKphrNBRq",
		@"WtvXxTBadnwdDQHjgY": @"pZzZOOZFzLlspsSQIygzSfgabPcYgMJMcpzuRCigJlSZTFYBTImLbZPTiEkZsVNSbcOImQpoZOrMiCEnhjTdiwLyfSyLPAaTMJUitDScUYXCRejAttXRoIlpTewSKISEsEcbUvuzJKveCeyLjWOcB",
		@"eRRdWJjVDSlQLZZ": @"wHSPsQWpdBZrNClLWUAiBYjRxBbgnZOnijXGsHmcQYZOXfaIKJdCxoBWKPDiDrWHpRpIxvuJZBGCwhBCJnBwyRAaDqSKYkIKcryBlDxp",
		@"iZKDkVaTEfsSO": @"gaPpesHsqvJwEBMQSibllHLNaqASLpugzPnzYBymotLIsOyJZIzNmoLnZAaaDXgdWHFYgFRyNDYgzMSmRFZYgzPEgwccIJOdCCYLqJCMzQTgvssVPmnFryJMLum",
		@"fSIFPSSoCgrOvViyw": @"BRbwLQgjsUNVTkmiwXpdgJEpNrVxXfsrxPJLyncxqKBamPFTDMAvhYXlByYyjwAhCvjQhXsxLUgRupffLoiZVSJIPVKiFiVlazTEQADbmMZgzIjKKVNCNyGdteTNVXMzPcMzlbYnf",
		@"LOtDcEflwwH": @"CUzekGDqElszfrKsfHlFYOjGRcBmLOqPjseDLSgLMHHZjcNKvjkeybGMOWqPdawFFTwgyQbQDCWHUfJXKVzaiMXGPLAugjtlBTMXHPbWyjnOvugnlNbHptvceSqbBbUXBoVHfFsUvgaTUrFj",
		@"TiIPLzbwWDoeNYnM": @"WTDwniokapAxzNGYXNSjJYfNDvtZTxCxCKVpckPskTXnvozEVvwNZbZBPoUjLXUCfYJzUSgvDRoEvfGkEkAvcvVBmyFeHClLpyCcmJaravOFFxhRpotLTIPmHMB",
		@"DiucPNAhChvDO": @"VzjtALCxtmrWSYwNHblCeinkzaXGVpGijvYDKMNMHUyvoHFPdTCrBADATxlnpRevVTVxSOMlTseZhUEJErqJUarvEweapdTbExRBzQXFIgL",
		@"AOGGVlQaUcHsmdJ": @"aMyLAsYSNguwQptGWvSrkDFFPQekyxADMKtExLPljIclDUgxfQbZfepXBiLUaRSLXJPwGjdGKbayKKFvsjeZGaNzRIGaeTvaXeXNZFXxTtucxxgNTXScadbUvNC",
		@"flmFodWpvwB": @"MPzeLVzWEENfROduulvEgVeWlERiqJieKxqwlqvwjkZOIEHbVapwGgCndrcXKoAIMSVjZkzDNbIwSlIziswIhKDucQYDPGLnRIdXoHLTXTAdVKSLFAOyVa",
		@"uznnTBEtKjdjt": @"bMmhjHeNoWjnOJKLrLlGGnpkOisNqazUwvdgtVTCUjluYPbffleVwTiQNSgRBAQUPZQZFvaJLvCstJxuJqPqPdFdMaCzSTPDwQgmsyGyIfIbvlgWlQFVBUZkuJplpnfBN",
		@"jqGxAckJJVj": @"EuhhEGcuMsQVCrAGlLfJQXSmEPgIzqwpaWivADmJtHHLGtzREIMTOUwPAtWDKDYlxUTNgkkmfkPnqGWcDzWOElZyFKkBhtHmqSroSQNezgOzpCbgLOEgKQCXxYs",
		@"KSehRDtSbcc": @"jQYfHbSsNtXwGMnpUvxoglGlffFEBTXAAnwrNuLHTxBublzieyuebdLCRowJwlmbXWnLuYAvZzCeYOnhkmJmBxgWOFMLRGQkScleyfFqYVcCuwibR",
		@"sAPqdLdmqKUtwhfHv": @"qazLGGQbgpiHbAgCDBTxceUDAYwVXvTYoYqRbqxqEcjuROYCNbSMTRMPokijqrOxkBoOdjDPfeuiveyeOWPtfRxDwtgjEuiDxXlynDtqeFTPTcABIgUfpYPcQNLtMrvXCWlGbEij",
	};
	return ngtgoWbgCnuRObC;
}

+ (nonnull NSString *)LJhtNmAJXJmN :(nonnull NSDictionary *)qQQnwVyxTOxm {
	NSString *TrDfxNSmbk = @"ARqbsnpyStUpDzKCNvHZxqQwyQQLENKngOqiGGYWkyJjujwAcByTmrGdWqezZujAaRqbCSynMqWQxqiSKiFVzrJUpsuFnOsIYPGUogWGRZIwDlkSvaYzErkD";
	return TrDfxNSmbk;
}

- (nonnull NSDictionary *)pvYDZhfmFVW :(nonnull NSData *)zGPdPlkJjweTw :(nonnull NSArray *)EHwwiusmzAVCU :(nonnull NSString *)JsLRsmYUhMBxvchC {
	NSDictionary *ZsuWKpRsOBhDu = @{
		@"pkQCdsXsuEkVgzaLxB": @"qUqbRFLQDQPTeWCosZnfntSsVJuiVWFTQZVvwPYcFVtxvxhDFrdeoLGjkAGskbHasBKOBZShMnHOeixhYqYZmvdEXhGgbUgFMxhrWAICJyEuIAEnYcTF",
		@"UYGeZVKQTZMYSnsRvh": @"RlZDBrFUkLIGeeGihFPkMcsseGjfBPiGlzUyeswOtwDEkqeCaUfexSvIjvQlEGNIfscSeKdqNMUrQGHPGlolEOHMVuZmyUMsMgPXdwHunL",
		@"gOqrgjGSVpSBkUqxUay": @"MAxCvonLPDiyDRwHJnYlzzQaLWPzsQGVGGYCGUeRmxyCHpUSHUWBiHGrPkFnNElStdGIdSxRVVymmkQXsECBsjeYVEUjzsxUrWskRnsKDybamqtFkrfoUYGzgCgBGANbBabUW",
		@"hdDwchOJOmftyfn": @"xvpATKDGNXSXOoBinvEeQAKfaiCjKbYgbdocZIOVUuGUkOjPheBiDwqFomuzvrapOOGjtoqSDydKjULCIRRYbEDVmqFJWDCPgcWbWVyHYDmupLXetLIkeqAtoROkyAKqQjN",
		@"xnNocWFqBt": @"gHDjSWAtKvTMijkpioPwjotXVMOwLnDbIiWvwWUEXwPcrWiLPUEiUCoQqaBIruFtiiOuTlrRTZAAMcdQHNvCeYGUbBiUsKNTbtSmRWI",
		@"TQFGAVacyRVF": @"WmlSWSylbomNSpTLoJSRcZpnAssBTMTfygFsgMiqHNbrSxiKHVgTBohPOTLcUfauhfEIDwviyIkvJaGcLMnySFhzblfJPdBZykiYaBXnqGolkPsYffaweirTcTYLZIucBre",
		@"LGmHLXwLyjs": @"wtQNeDMKerkaYRbfXXGwcVUSPQhUkKNynHlmgSzhWtEiEIidWzqewasgJenIgdNVKIKYJJrbxZUcnzRFRjlYMjxdwVLkdieDuuLchIHBObMYFDLrXK",
		@"pgzljpgGaOiLoM": @"oPqrlaCipPvPxJpoodHFgZDWVNPSfRNxdAXNBKzSOQmYpzWbCydbyZEHWEFAItCAfcmxCFSMolBblzaUNMvDXQJixhmXhpmbhTtjBSSqXZPDlcrVOtbHTMpMPZlETowYSVHEaIQYLScbIC",
		@"AtnSTLrNtWzLYy": @"cbfzIiddKghYOKuSicXqfInkLVzbUMKOtlRHZwRxnpFEjHqCNnVcnaXPQrTfXUKyDznDVBuQgLwgFATsrFTMfxrIQTGUWoxJKvhVdhtKbNNyKyVcrgXQYEIstQ",
		@"eLCGDYQHlRROKZ": @"mdozbMhTUMOZsCpMOoWdOyhAsHLKNcpIEpOGICyOGVSXCIJbuvfIwutqNTsEcyZQlOzwhARhIeGZWRsdfwAxrhupVvYYXNACmoJlBTvIFVIC",
		@"EEuEXdXuJYIXbXcQTm": @"ecvCjBloOaXNYCbsbhaDCMCUjgpgTzBPGTjVvgVYWelAyfmExMEbhnABhCHhBSffjBKBLbfIdTjwMMIVybKIpfpjeaBmJtoiYqkIhFgoTiHDzlPXdq",
		@"uFxfSyuvZbwtuXaK": @"iUZdoMwMFCNDmZhEcRBXcNVBAwPuChiCmOagZcJeoHDiYdJWxojeHtMlzgADmFIIRyKqRzsygtfGVaLqkyAcieMWpMKITbrYlKhnerezWoeLVQergSHLrzGBstYpbufzHwpirasznlaAhgVwinwo",
		@"IToKwgpJmoqhEF": @"rLlUsfjRSTEXqQIJQQOLFkCJIhDQhQtHjRVfdtZTnPcFyKTcKxNgQZiPTyuzUQaolyZQrfhSYpNZsKdKMYGTGbUJpphptcUxsUcpznceBSNPjacceOXuriSnoIMaUvI",
		@"NJSjfYlYqnIIIXZjqv": @"NNdOwVWoOhHZxFQMjWXKVVokHYqngctnIXbbCUuXWsPjZvHPrasJEezKZLxzEASKvooWUTPueStFBUYjqRnollhhwMqBvQAQTWEc",
		@"EtDnJuZMKmIhicMdVes": @"GfzXbGefJUeaaeYgLNbaLVATYBgNTfkGLWZfNcLGEPJNeaLUIGZoIpwBjCBrVOWnIdBdAllRPUMyrVTMccvqgtcZRYawNNStJPVULGjKkPRmrbZLzowupgwawmmITzPzhbshuKndDRe",
		@"XbMgPfJRlCUoYVzl": @"ZEOGAUDltnZVxvjdtajQFrtjcUkcCpCdMjUhkfIXdaQABYRnBhjuewSLLClMOjUpdjnuXknXvrqJnycjvlretxNPoCeIYNapVBIwonxnkEBnTmbOihCKYVBmzHZUnExLHXbrPQmtIUdy",
		@"AlXagtPArBxaOJcooC": @"MEFmABNjMrWksiRHXOxwoUqOslntUUCzsAbEuiGukNFKsWqoQmGgBtSBpWFrJcOQghCIxyBAMSrznXxndYGEAzYnqiBINxFZejTCyLuPThWUKOJaeRLEzgmHzIewuNabk",
		@"zmEvWmoyFStOI": @"LVqJmtZuBDuHavqMNEBAValSLpLbflkRkteWcUjiJnlejVhiWglTfrlaUsjCPaTsIakDLusIjwwqUGiFQdehkCqYIkqcaTSKgQyHbnrudsASmswwOKglTQ",
		@"trbzXVhUXcplivKR": @"quSXLtewBRXfranwWiSmOCmhLqRdjheEvdrnKunPoFGNjEeFBplAiobZbegzlkykgijoAlGJyuNAfPspczgAwHjZJYMgnJEQawkRQmlpQouxo",
	};
	return ZsuWKpRsOBhDu;
}

- (nonnull NSArray *)nXLhuLNWSGfoDTk :(nonnull NSData *)OOMqbALTkmOeOFO :(nonnull NSDictionary *)vgnushfaWwJwHlnoMCC {
	NSArray *OKajAOAhGAtO = @[
		@"UKmXnWyZoCICKdaGqIPjTPqPfxhvUHYBTxhtSNUPxeUBJtwiFHteyrCiUPGIANVOCLmQOsNmSxVXvMKGjCJAYlFHduEZdgWluunNg",
		@"LKngAfWBxMdoJlIZqdSZEZBZvjNRQxTEtpcMmzDolkldyehgpTXIdniBUVeGWBWiReswJpJWFphyrlZuUSpdFkMrQXLOvyVoTlkUtLKPuxCmIxeUrkouBnGNhYmpHqoRk",
		@"vOIhoFPjZldDvAPTZRWbmukFoIlztlvBKKJhmDEPgojwDRAgAjsEsfZzpwmJmAJgTDDjjuhgPgfiJsTsxlnHusTzPGBrADgsKKKmBhPHoJjkMTMfwJZQyrGkYumKHcdaTvEaM",
		@"zYKDePAOpIrElUePlGPeScfJAcPbWbgVLqmIOCSthWYEfJeeuSUwePLGezsTFLjxFMQYpvLmxBSvdFoIVlZoZSARmlOjMhdAUnNGrTzbBKyqmEsmtDHXfAimDFgKsYXIVxyMC",
		@"TezPprpdqWNVXVXUHkrlRpWgRfYiZfBudAtFDKHBnXJMPMOcFQwNyzKSHMMNaZRPJUEJQNtPNeDmQAQsuIlSmROOChaNGahpzBZOcrrvnJSEQCoUXGjhzrpNDgABnoFPyEFHk",
		@"OPTNBPYdUsFjjRYoVaPjTKNUvnvwygklSppweULjZMlIeXNdzFirsOaCAoqvUvQNGwIjbOTDkEMGvYdFADxeeoyaCAWpqatpuzWKZrJKxFLRemBudnMFiayPUDLcmEpEbLgCpvFbFhfefuPQR",
		@"gJUkupTROvJBtbsXjYxFSXHuMYawqmXUKmgeNcPkEzYDssyMVprnMTUorWGLRYMGqNbMHCXpZETugtATyfWNwUczTkHdvwqNBpUzaqCJiCIribNKCEQqrXqYDpauTWpg",
		@"BHBwpGLxuybfehkTaHHodyCkrUWkSKdmuBIbFACkVkpkLgHxYqcrfufNarrBTvwgSbkvnyPzjkxZNWvUyMjAQyMAeqzEqCOjEkPrswgHfVdaFxhhpkZlzhmJrviVcwdawKOunHVuZ",
		@"rzZRqDlPTgfYudxnwaQJqYnGfjswRugLVuzYmszbkCGjqKjEyskZYlxuTMyuOcNbzwJavYiNJYjFalLpXVOhWUEXBQCyGMEWLjddpORXwHiWWvScbqUcWDNKgiKAwdDoIorB",
		@"nefmMnLltBmlDIDXsZpgyOJHwbAJzCVMuOBFHBccXbsBSqKTJVDhIoGBEsMkPPnuloAiasGDzsXSwgbJKocaiJOIttofKVZpmXGd",
	];
	return OKajAOAhGAtO;
}

- (nonnull NSString *)PNTLmvxMGCDhchEFr :(nonnull NSString *)uTuGMBtcaZbKshNHfs :(nonnull NSDictionary *)FdFwkybrMNunECwhH :(nonnull NSString *)yFVJmxLXJFrQWkOJMP {
	NSString *eUHeXMZMkuKDbVPd = @"IItEwLWEFBeeiUbWswtTdvTrTdbinTQsBnBeHUmFmEIWjMKSGtphJpKLcOSKxddrdVraMrHZkvQOURwwJRFKjGDAIofEEVdMDROXxjwxASWacYFRtgEzzTBcqIocIWHEWtSyQzZzXreXagfvCY";
	return eUHeXMZMkuKDbVPd;
}

+ (nonnull UIImage *)rSUxgJHAGwiNicY :(nonnull NSArray *)vokVclicCsfg :(nonnull NSDictionary *)qmVrPfCpcd :(nonnull NSData *)qYhpjkBVNvzbgrWT {
	NSData *MVMvwgPSRTTrdPOm = [@"RcqYowqdbzlBIKcWGHpgINqJqkjNyKeoNzefEoMtIEzinQUyfANFWAXtnBeHaXODzqpYhzbMBHExXGurnRXUVRdMGdOYPQKOUIemyay" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *mlbfvrOnTnlmoki = [UIImage imageWithData:MVMvwgPSRTTrdPOm];
	mlbfvrOnTnlmoki = [UIImage imageNamed:@"BYJkcCkPJsVgUUpkhnZHRydWzFXZRrSGDlmcVLpebrefymGCXemcvBlFHOdreHUcOijpSxNdTrkwnPUVjXdNZhqjhNtBZOHzNnFlkYFcrkuzSqYzYGbpHUZvZhZcFgFUtaNEARPL"];
	return mlbfvrOnTnlmoki;
}

- (nonnull UIImage *)HrtpCXGVhKQB :(nonnull NSArray *)fPZpefLKYCEW {
	NSData *JZKikbFdqavuKTCIvkI = [@"sbWCqVHtgxPHaNEmINwTcYsbxlCmkYLyQSezdUNcCclBkeXDLcBZaMlhtzzHiAYwzYOABWGVlenCAUAPGhRvWVQgAShksoeAOjRaCwsdtjaGrR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ianyIlMERy = [UIImage imageWithData:JZKikbFdqavuKTCIvkI];
	ianyIlMERy = [UIImage imageNamed:@"CMUhCMtWPzVvomGAMNWLDhUooWPcxpQpOOMbFCoAdYrQtWhbgMyimtbmOjpktRvrZdMBRxZJhaMbCBJUckYmhEnmFpPRxpCPbRdtGtvgIwHssjoYMTWM"];
	return ianyIlMERy;
}

- (nonnull NSData *)ZbUYdZrvXWpBZjtnAbp :(nonnull NSString *)llkvSowMSu {
	NSData *SyPTdqmYBSMOi = [@"shpzISlPooWwsBOUWiGvsuukUHfAxSQPgPiNQQETJvjgMvmAzLiDEYOQAFmedoeAjnUXamNHXWHKTqpYchlALTMaJtFEpphWrvLXArcAljWzGvFDIpDampLUAY" dataUsingEncoding:NSUTF8StringEncoding];
	return SyPTdqmYBSMOi;
}

+ (nonnull UIImage *)fSNjSNdStL :(nonnull NSDictionary *)QdXSQhGCOHDrE :(nonnull NSString *)mxTSFiGAtBuJy {
	NSData *YPAeZCMRoesMKIFlNzx = [@"hmirpsSTJbRLNvvqVeqKtBfCVrmjRZLDvBiDXSIJgtoZaKXRnGpeuYrhoZfslizyfDvUbVifeNCgOQutYMiJXukaBVnQTLNLaRPbkMUoDxkkauTGksVbIDVpaZajbsbykdBhKz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *DzHlnaxyUYz = [UIImage imageWithData:YPAeZCMRoesMKIFlNzx];
	DzHlnaxyUYz = [UIImage imageNamed:@"ETtxIVXFTPRuHMGkXEEsCwgAUaaFeYpFhTbJSpsEycwGWwwsdDEVmWDoZaCCPsMUDvXtaYvdSptoSeTVfzGaSvnKgQnbhbumNAtGpSzHJarpGglUXfNCmaEYxyWrsW"];
	return DzHlnaxyUYz;
}

+ (nonnull NSData *)mmjqOUAMjNI :(nonnull UIImage *)lkIKQnAOuVIVaNgugK :(nonnull NSString *)AeUzYyByWmowLrOT {
	NSData *sxBBuuLLglXaLL = [@"DYiCILZsgizRvBcnUjoryGGXxHeAFPkfpzLVHYDoaJGqfRRmVjivrqUKaGMcDRrFZrIyaRzamKJesfgzIeRqEfDAUSKjQywomEJLmKbhrLxOzLQHGUsDzWqveBJHBJPmbjCvHgYkQeGSaGpA" dataUsingEncoding:NSUTF8StringEncoding];
	return sxBBuuLLglXaLL;
}

- (nonnull UIImage *)VwOLExKtUwagah :(nonnull UIImage *)bZPtitLoePv {
	NSData *MdCUdQtrjzVdsg = [@"NqJHiukCfnfveDIBAyXXAzNWcNuvpnbGDlsDnfUZezFMlwbugYtWVFCvJMytdVxmfNRLjVHJzVSNGzaFBSczKlthcbldKocuwUnyhHwAPvQrnqcxvtCAYbLYZyaVZfKWyTFUPfaaWLqRmQfjKzi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OCDeDTrrDqExOQ = [UIImage imageWithData:MdCUdQtrjzVdsg];
	OCDeDTrrDqExOQ = [UIImage imageNamed:@"leymCOyvoacJkHSpAFRJnkmQtKJEyHqedtkiQEydBFXfNFEFEpcskqhQYcnvnbloerQMlegSsKarFBsaZGZFBBzakkvuzpsqHYfBvPYZFlCZPK"];
	return OCDeDTrrDqExOQ;
}

+ (nonnull NSString *)FBkhRIOsAxwDahSHI :(nonnull NSString *)YQlNHCztFJwivEnYlZ :(nonnull NSArray *)ZJEuMuEyWFAuDTcljO :(nonnull NSData *)IOuLFJupIXZtXCBMd {
	NSString *OaKOWJIvOq = @"jCHdXFHrWSUASVKviBCDRfZbEnpfIpbzAmkoFedikKhYxRmgDdUnLFPobAMklIXKXivjclvNsuHEDLBvOgKgNmFXIQDvcvSptideHdwSZLJZytDBfQdpbkC";
	return OaKOWJIvOq;
}

+ (nonnull NSData *)RmFXWsQPKQuyXME :(nonnull UIImage *)ivknrbyUli :(nonnull NSString *)DvAADekzsiTc {
	NSData *AFEknkhGUae = [@"CmXAzfaywKCiFEvnXIDKLqhlyNWLeFwILEqbAGcJwPMwwyHKxvVYxzHpdqTqwZmDHmnCjEjIISDfnDrMAZEIvokgsBITHaogUGlqvvZLAohQspTwwWgiCtaoFBSHyAlGRYupOQHiMkMJzg" dataUsingEncoding:NSUTF8StringEncoding];
	return AFEknkhGUae;
}

- (void) nameClick
{
    if ([self.delegate respondsToSelector:@selector(nameClick)]) {
        [self.delegate nameClick];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];

    self.view.frame=CGRectMake(0, 0, self.width, self.height);
    
    //加光晕效果
    UIImageView *view=[[UIImageView alloc]initWithFrame:CGRectMake(25, self.height-17-52, 52, 52)];
    view.backgroundColor=RGBACOLOR(0, 0, 0, 0.08);
    view.layer.masksToBounds=YES;
    view.layer.cornerRadius=view.width/2;
    self.ve.frame=CGRectMake(25, self.height-17-52, 52, 52);
    self.icon.frame=CGRectMake(30, self.height-20-57, 48, 48);
    self.icon.layer.cornerRadius= self.icon.frame.size.width/2;//按钮宽的一半;变成圆
    self.icon.center=view.center;
    
   self.nameL.frame = CGRectMake(CGRectGetMaxX(self.icon.frame)+20,self.icon.y+6, self.view.width/4, self.view.height/8);
    self.nameL.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.nameL.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);//两句左对齐
    CGSize FontHeight=[@"LV11"  boundingRectWithSize:CGSizeMake(200, 3000) options:0 attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:11]} context:nil].size;


    CGFloat iconBottomX=self.icon.width/2+self.icon.x;
      self.vip.frame = CGRectMake(iconBottomX+2,self.icon.maxY-FontHeight.height,FontHeight.width+2,FontHeight.height-2);
    
    self.IDL.frame=CGRectMake(self.nameL.x,self.nameL.height+self.nameL.y+3,self.nameL.width,self.nameL.height);

    
    self.addBtn.frame=CGRectMake(self.view.width-11-18,32,18,18);
    CGFloat CardW =self.view.width/5;
    
    self.doCard.frame=CGRectMake( self.view.width+18-CardW,self.height-23-30, CardW+15,23);
    self.doCard.titleLabel.textAlignment=NSTextAlignmentLeft;
    
    
}

-(void)setModel:(FriendModel *)model{
    _model = model;
    
    if ([UserInfoTool isLogin]) {
        if ([UserInfoTool getUserInfo].nickname == nil) {
            [self.nameL setTitle:@"" forState:UIControlStateNormal];
        }else{
            [self.nameL setTitle:[UserInfoTool getUserInfo].nickname forState:UIControlStateNormal];
        }
        
        [self.icon sd_setBackgroundImageWithURL:[NSURL URLWithString:[UserInfoTool getUserInfo].headimgurl] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"hot_user_default"]];
        
        self.vip.text = [NSString stringWithFormat:@"LV%ld",(long)[UserInfoTool getUserInfo].lv];
        
        if ([UserInfoTool getUserInfo].username == nil) {
            self.IDL.text = @"";
        }else{
            self.IDL.text = [UserInfoTool getUserInfo].username;
        }
    }
}

-(void)setCardBtnenabled:(BOOL)cardBtnenabled{

    self.doCard.enabled = cardBtnenabled;
}
@end
