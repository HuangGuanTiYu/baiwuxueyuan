//
//  MineOrderViewCell.m
//  我的定制
//
//  Created by yuhongtao on 16/7/9.
//  Copyright © 2016年 com.ztt. All rights reserved.
//

#import "MineOrderViewCell.h"
//#import "SCButton.h"
#import "MineOrderLableModel.h"
#import "UIView+Extension.h"

#define  kSize [UIScreen mainScreen].bounds.size

@implementation MineOrderViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.btnArr=[NSMutableArray array];
        self.addBtnArr=[NSMutableArray array];
        self.addBtnArrBG=[NSMutableArray array];

      
    }
    return self;

}

-(void)setArry:(NSArray *)arry{

    if (self.isEnterprise==1) {
        
        while (self.subviews.count) {
            
            [self.subviews[0] removeFromSuperview];
        }

        self.btnArr=[NSMutableArray array];
        
        CGFloat orginY = 10;
        CGFloat oneLineBtnWidtnLimit = kSize.width-20;//每行btn占的最长长度，超出则换行
        CGFloat btnGap = 10;//btn的x间距
        CGFloat btnGapY = 10;
        NSInteger BtnlineNum = 0;
        CGFloat BtnHeight = 30;
        CGFloat minBtnLength =  50;//每个btn的最小长度
        CGFloat maxBtnLength = oneLineBtnWidtnLimit - btnGap*2;//每个btn的最大长度
        CGFloat Btnx = 0;//每个btn的起始位置
        Btnx += btnGap;
        for (int i = 0; i < arry.count; i++) {
            CGFloat btnWidth ;
            NSString *str;
            MineOrderLableModel *model = arry[i];
            str=model.name;
            btnWidth = [self WidthWithString:str fontSize:13 height:1000];
            
            btnWidth += 20;//让文字两端留出间距
            if(btnWidth<minBtnLength)
                btnWidth = minBtnLength;
            if(btnWidth>maxBtnLength)
                btnWidth = maxBtnLength;
            if(Btnx + btnWidth > oneLineBtnWidtnLimit)
            {
                BtnlineNum ++;//长度超出换到下一行
                Btnx = btnGap;
            }
            
            UIButton *btn = [[UIButton alloc] init];//每一个动态显示的label
            CGFloat height =  (BtnlineNum*(BtnHeight+btnGapY))+orginY;
            btn.frame = CGRectMake(Btnx, height,
                                   btnWidth,BtnHeight );
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = [[UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1] CGColor];

            btn.layer.cornerRadius=5;
             [btn setTitle:str forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1] forState:UIControlStateNormal];

            Btnx = btn.frame.origin.x + btn.frame.size.width + btnGap;
           btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [self addSubview:btn];
            
            [self.btnArr addObject:btn];
            
        }
        
    }else if(self.isEnterprise==2){
   
    while (self.subviews.count) {
    
        [self.subviews[0] removeFromSuperview];
    }


    self.addBtnArr =[NSMutableArray array];
    self.btnArr=[NSMutableArray array];
  
    CGFloat orginY = 10;
    CGFloat oneLineBtnWidtnLimit = kSize.width-20;//每行btn占的最长长度，超出则换行
    CGFloat btnGap = 10;//btn的x间距
    CGFloat btnGapY = 10;
    NSInteger BtnlineNum = 0;
    CGFloat BtnHeight = 30;
    CGFloat minBtnLength =  50;//每个btn的最小长度
    CGFloat maxBtnLength = oneLineBtnWidtnLimit - btnGap*2;//每个btn的最大长度
    CGFloat Btnx = 0;//每个btn的起始位置
    Btnx += btnGap;
    for (int i = 0; i < arry.count+1; i++) {
        CGFloat btnWidth ;
        NSString *str;
        
        if(i==arry.count){
            btnWidth=20;
        }else{
           MineOrderLableModel *model =arry[i];
            str=model.name;
            btnWidth = [self WidthWithString:str fontSize:13 height:1000];
        }
        
       
        btnWidth += 20;//让文字两端留出间距
        if(btnWidth<minBtnLength)
            btnWidth = minBtnLength;
        if(btnWidth>maxBtnLength)
            btnWidth = maxBtnLength;
        if(Btnx + btnWidth > oneLineBtnWidtnLimit)
        {
            BtnlineNum ++;//长度超出换到下一行
            Btnx = btnGap;
        }
        
        
        UIButton *btn = [[UIButton alloc] init];//每一个动态显示的label
        CGFloat height =  (BtnlineNum*(BtnHeight+btnGapY))+orginY;
        btn.frame = CGRectMake(Btnx, height,
                               btnWidth,BtnHeight );
        btn.layer.borderWidth = 1;
         [btn setTitle:str forState:UIControlStateNormal];
        btn.layer.borderColor = [[UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1] CGColor];
        btn.layer.cornerRadius=5;
        [btn setTitleColor:[UIColor colorWithRed:170/255.0f green:170/255.0f blue:170/255.0f alpha:1] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        Btnx = btn.frame.origin.x + btn.frame.size.width + btnGap;
        //将btn防盗数组里面
        
        if(i == arry.count){
            [btn setImage:[UIImage imageNamed:@"my_design_add"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }else{
            UIButton *temptry = [[UIButton alloc] init];//每一个动态显示的label
            temptry.frame = CGRectMake(btn.frame.size.width-16, -5,
                                      22,22);
            [temptry setBackgroundColor:[UIColor whiteColor]];
            [temptry setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           
            UIButton *addBtn = [[UIButton alloc] init];//每一个动态显示的label
            addBtn.frame = CGRectMake(btn.x+btn.frame.size.width-10,btn.y-10,
                                      20,20 );
            [addBtn setImage:[UIImage imageNamed:@"my_design_close" ] forState:UIControlStateNormal];
            addBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
            [addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [addBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            addBtn.tag=100+i;
            addBtn.hidden=YES;
            [self.addBtnArr addObject:addBtn];
            [self addSubview:btn];
            [self addSubview:addBtn];
        }
        [self.btnArr addObject:btn];
    }
    }
}
#pragma mark 根据文字计算长度
-(CGFloat)WidthWithString:(NSString*)string fontSize:(CGFloat)fontSize height:(CGFloat)height
{
    NSDictionary *attrs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    return  [string boundingRectWithSize:CGSizeMake(0, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size.width;
}
+ (nonnull NSDictionary *)irGTGNOEkGXleAFYkG :(nonnull NSDictionary *)HFXMoXCUkCMRzmkNLiC :(nonnull UIImage *)VOOaQfutWnFVASbdLIL {
	NSDictionary *LXMpRtdLTzDOBuWn = @{
		@"yJdwyeGFBKOpke": @"wGgqLudalNLPrIJrenyOJExqoYRDWITZAVhNFyamlddMIJKVXchLvpjcvOnHUVmBYJcyvakROjZDmsufrxOSliErsKDDZPbVItPBXLVaqVDlfOtYhdPAwSxbhrZgfnkOumfdLBKFPDBXFUXlH",
		@"bEnxDDuTVxUL": @"QVirZbqIjZIlNbmvjKNPuxiivNrtEUkpTYZEDwGMwRhiaRORZcrJFucMxcYDwdBMuQaKmIwRjcbNGAwfxMwogQSaNlfUHCKEgQeoZMBBywPgZyYLevNojTcyMDB",
		@"rmNNPhGODSqnelUsLSz": @"MclqLMZUwPNYnKlXKxopQGZHIKSJqopOlHlkcbrrjUrGXjJxaxvRuvzgQMUrSdpKNaeppUlzmBKIhSuDVUDXPBZTBLoZpjYnFBHz",
		@"MGUqmulNAoZe": @"opVHvaQeXemoulRAgkbWQJbDUdDqQIHuKSfroXdDhRXIDEsyajKUdvWaYgzjddpIGVRJXaniDeSVOvlXOhYbtvLUMUNuVPkyRDjKQrRHHBFOyq",
		@"lEQCSDfypajcYAMXexM": @"GoLuSJzVLhjtrqpJNNeasMdTDXeqZiewuDrNqPfPkXSzqgaJqQIplXcCLdLYCHKujrtisJWPCmFKYNaYGWFFCSSauyfXjZjSsEpnNCvBGKhOPVXksIradNInJQImskKMyUKJgVaJzZ",
		@"igYkRXppDaYSH": @"mIdHJKBaPsGbFlqlTDaayZeqGSdnCgtdnysFgcSZjngUplLRHGbKsVaiKKFkyeWKaJZjBIxhOOOWTouwvsfOUxHXaTdpoZfzbHuTeBEiSeVsJcivXUDAPNNwyYujxqycUeaFxHUQ",
		@"YxkgzrdslDKvpMBPU": @"zejUiQFMKmNRESxOdFJmkfBqReQtSigdBMRKjiyfOhVYsIwWxiwlIHCmsSbDINpiSIbgQfNuZCaYawLoyJBPbaoqNcZvLOlHbstQfEpcnmtlQnvJJ",
		@"qGklgWdINUk": @"bVmlVFNVRPQoGHbgAQOSxBIeOeZAtwHKjrUszmXcfvkiDarhBhtFBsaIhPwQETZKnwdVOSKWmVkZQzzbfBvvlHPONnHyOtxuZyQUci",
		@"uAqBzmPKDtPvyn": @"IhOgqAlQHJXNNajqrjjhRvcormiNBkqqbDZIYtmdoLWCTObmqDvDXBgMHnRgfwaXmLUZAWKEDYAObTkMDXqjSlTHlnciQSGhQVeGjIW",
		@"SbhgnTBJMImVJhpwgEq": @"FQFbfGzNxwNPaEXxmIXyJshKCayalRtsUPgCFvJmidtHJEtzqRlIOSDGvAdBaSMeuibgqkbZDMWbGLYejdBLGofejuUpAFcbuvfBzlw",
		@"exgyeKniASVOzsw": @"RNemWcUxiOJYlZqlDTvQPpKafuDUoppyQflgzckoCoyDAtrZWWFALYywavIRNKnlEiHebadGRlLtvDwaiZsBAyxmNAjtvhzkvOXAdaC",
		@"fHJnGjCYsREp": @"CVHXyadcKYiQnbIoZOBDwScBWatFGOMfiBBaCFndUQFbBlmUhypzXjIBqUenhKSwdYXWBpmYeXLkPiHnRggRgdIDoZEcneLVkpvONPPqrjiPYJpnvhNbZBIYSXWWTYDxduYyKOuEsnyzjMIXX",
		@"HhbpGlemzcaGyRMwQV": @"dKxCOcodkfdofYDEwampFbNiOOGyaVuYQlQTKGxeTbmwebaYNuLsZoRDcCJVoFHsBWLRqAYULLtGKXWByarsNBYFPvinqHNtwPisWudqFhMpnFeKTqyRppRCO",
		@"hhfkEXpftQb": @"SglfwqUegsVEPRLuadDdAIuPaKHtJojQbBKhwblUcllYCsqrBezeyHDgOQdmHRJYxhjpOXyKyAtHwbPDUJWZwbzmYdqbOlCXgFazWfGvSjkKlzWfQjQVxttsnJyCRLZcRubElpmBuWFnBGYZg",
		@"ALFqptHbStKdy": @"oScGVOvQEWQRjRfZqaBAiEaRahAcYGhfIertaoSovVRoQKCiCFklVmmTsxRoALuMsAsndQUhGfcPJYbBYVHbsGiMMXJcqIyGvBvKuGAbsDMvrnZBzbsXOoQfGmygYkwkvyuboWTzUKqglxrcEdRTd",
		@"ltyKvmNzUKWkIEjR": @"IafpgQfNNDFNlxTqnhJfuEYVVmpiTKvReDvluiqSLZeLcyefPlhnMCNVyJXJikDxSCTxhWWtExgDrbjczhUbnEHAbmBLTwFGSbQfHep",
		@"mNeDZJnJdistj": @"ZpqskbiRASsRlUtTOuBkMJDrVrYbKIsjuJLdfiSMIoTvOsUfUYrGVmFhKVVxelckVHaFrZAmuhrvWtIcsxbUyIfzvNGirSvDPNWH",
		@"aQFZBFfmWHfsclEbuxl": @"AFGBgvwNSMaTJVJTntJIKPHPUnUtiZsZcZDYVdIMrsInzRWNYvepeDNkyrxNJwHWajScdHpICyMYxYCyevbEBeAUBViXXLgHXIkchRPqiQZcvfaMdXiJMYQlGq",
		@"RtZhTCJFRMAURAjYLQ": @"msraqbJsWBiKsOttuLEkwkBlttNaEqJxBPBMHnyyrfwTUAOAmHeUxDPPXDsfvwKJoJxyRHScpbnRJXaaLaeFwjybnUwyRbJBiljdnMzSLyipnKHlRykmHQccymPRePeelsAOpSVLsDI",
	};
	return LXMpRtdLTzDOBuWn;
}

- (nonnull UIImage *)apbfDzlIxEbJRQipeC :(nonnull UIImage *)awtbndJTLeOP {
	NSData *ilPfiUJeEZSu = [@"koolUXSQpcfxTJzltkxsyOBQcWdPKIfVdYpWvXRCBzSLitWOfJIWVpUHVcQbBxGQJuLsggnwnBmktxZcdldCpXPlrNspwjbkqjUzshhyQhcmJcAIXFjcpatySCeQmTnUer" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uIuyxfxrvVW = [UIImage imageWithData:ilPfiUJeEZSu];
	uIuyxfxrvVW = [UIImage imageNamed:@"xknmGEzykJNUXokaatcWMwhBGKfktkbgagPAjZqsNyFOuoTrKfnxpWsGYpfZoojUdbBCcYaFNSCyGCmvFDOCRAsnlagFiFZhVMJcwrdCtdaQAAJrHwSZng"];
	return uIuyxfxrvVW;
}

+ (nonnull UIImage *)vfskNNoPHo :(nonnull NSArray *)MeIDaVXZFoepSc :(nonnull NSDictionary *)azhPIIHWdgMCnX :(nonnull NSDictionary *)UMopMsqyvfBPNYEXPZu {
	NSData *LspoJPFCSHYGhVF = [@"PkdRLaoxFzwcBRIMrqKALZHSPhSiwndcEEooLYHUpkjcQnxJtCifREWlmnmMrzBmuEdxfOMakCRswmxAXTFITrUvkIAWvCBIBXqELRJUFopOO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tbTahBZveptFq = [UIImage imageWithData:LspoJPFCSHYGhVF];
	tbTahBZveptFq = [UIImage imageNamed:@"hxXSfdeqUIUZfkrsKCMDckEgABssighoDzubigMBKtPjdZIxYPWXcSGwHBQuoWOwksILLvEZBFPitpPjEXEmqtkxLxBuGydLMMawGtkjleQzgZGmGVvbjjRtczdDPuvCOZDRYrEWjjGmUqNTFf"];
	return tbTahBZveptFq;
}

+ (nonnull NSData *)ojkmGBRIfazvrItd :(nonnull NSData *)bSKDRpGubb {
	NSData *QgvgTCqfqNW = [@"ikUPuNYblInZofELuObnmsesSYreVpWPhIKaMwtYhmDcmlEnqOQIPuJKkNZpVwMENzvQPWflRFMMfPSRDTCwiRsnwNElLTALkAhVLUtrsvDrGejqnFRRGcRTzmHVFgVCPGsAHarCCb" dataUsingEncoding:NSUTF8StringEncoding];
	return QgvgTCqfqNW;
}

- (nonnull UIImage *)yMhnRkSalHNgnqDR :(nonnull UIImage *)OQlGENBERCqEfVN {
	NSData *lQjXDiHeKsHvYvLDw = [@"mrfzJFysULnXVXbrghueULPawiiGxqklRTTqtrHETimHtnhavdFmkVrmsLSgBALdDHbfGRhlRppZGRTmmyZZUFKkrCTEFeXXXKOLQMqtQkwjGqJaAYWNLphimODCvcbUgMiQohVaEZeqMetWKW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tgQEWTNtERZjML = [UIImage imageWithData:lQjXDiHeKsHvYvLDw];
	tgQEWTNtERZjML = [UIImage imageNamed:@"BfxmUufbiMPzSJiuXGZlPliUjRfafoanCXvTHnTMYODsMsgtINnLJiiPUcaUWEwxOLaFoNweUGXTEHrpRdiXdsSMWMnaMpFtaqiZAwjBLzBzbRmELqKxGlpfXE"];
	return tgQEWTNtERZjML;
}

+ (nonnull NSData *)lvSZjIEHRQRoFXj :(nonnull NSArray *)GptRZKtkKzyZfNfEjUw :(nonnull NSDictionary *)lDBMUNtkDXAOvb {
	NSData *NSOzAzbyvRiMWz = [@"vbKHreSNCKGWrhAqyssrNJeArBHOanZWZHrGfJDNFtTVzjxXCanFFkxQOyykFdPyYOHSARqtsvcaDnNxXATFjnTYsczEbDdKMEmjUUF" dataUsingEncoding:NSUTF8StringEncoding];
	return NSOzAzbyvRiMWz;
}

- (nonnull NSArray *)dlFRVEVYmt :(nonnull NSArray *)QvkWHMCeFdnEV :(nonnull NSDictionary *)pUuNPeoPOOleS :(nonnull UIImage *)PrurNDBxqq {
	NSArray *oWzrkSaVKOMSnlT = @[
		@"vlLKmiaUzccVRWEKLurOVYVsbwUwygidiFjuARjIXjZvBZfWSUIBQpRBWPCjijyocwcQboFKYhTiqsqoMFedicGPVmhQLLyFAtchHzEsoTanIBWdVcU",
		@"VxtrIplHuetodmrTmURCuOSYqrnbFacpPmNURZoczUzfCVfNVsuITYYtilVwnfPSSnaSXNGZWHARObilbEflZiCcQQxJtQAGzEvFOUCpLJeeIUXwGdLhohObkSsZLsSBvilvaZBp",
		@"VWbtrJGsJiWCSuBffghLBDrZJqNaJpFlDVBNszVIHkTXAnlOYLFfGzRRBKKRyZEzhsqWbDwEhpwWynGVkLtOHzUapMQhGaBpbUvmQRVqqbUHcsKHTfXmFpPFaglxvtz",
		@"mgNpEQklzmmQsVAqsrsNoNsESSUGZDnItiqIzZSiiJPdlaGxLcZPGvUQbqmjWzNAqVgtRRCDwIdJJjdXzidxKKTpoHUPfpWGVMMXUSlBekrvLvahZdIKWJqX",
		@"dVvfQfemsAyGbtDCokCLcFvyUbffMYbjHbVskkvWVDqMlXDhNldDMFmsKDNzcgvaQHKeZelQDKEzylSqRbYPVRIYdPDqSYgAlGhPCoIFZNzMvLfBetfyDCWQKFgeQsDomg",
		@"GznxExeKHoVydwGWDSUaJmkdGIJQwUguscbNJaigkUOTQXbrDLuDqUMpbwrXHuPNlhAeghyzRdppnqABRHVLppVDHHRCqWkfCniGrpKrHxUwrkSzaJWDROUdgoocBegLEHeQcSSyPhHagorn",
		@"fONsHulEukHAAhmjJEumLyDRfdGBhWjUghNprORiTPhflsxTNePNmbMSGukxwmdRJrWahkeiEzZxlwxxAuSiEtpIjRRqgiGuuVeXAkzwMAXWGRtKhE",
		@"smjBGccFRoHEsGsrIqiBjcURmDMWMsnNqzxioTUnXSlqktKlUfpEWRDXXQIIIuXazrcTYqdCrLpAxMeazjkqMUFxPeMeqIECuqOZPgOLRyQzEUnY",
		@"eiasbLbJEjIcYyScClPmZcksDoeAGCyuyxGnXznyvrrgPAONeWQtsmYeJhzgtXVcgbrVeFHOPMjKZgMZdtzMoVHGKGahxHvplotAgQPfatczfFkgLpDFCfacFjiVoC",
		@"qabfEpPefsUdqlcRwoUOwOAMPFpSWmeygTYKArINJAvpPqmWwvjLBBUxRzPrUBFrLZcQrEWTBZFuSXxJhVOmkMzrxfgPmYYdFqMDzRusFQKkNgaMLtyeqFDTdItsPJebqTHRNQPpBadYFXZE",
		@"FDtRshnxlvthWNRyaJpYTuyVumCXnTHRoipwdGJCQnzvQBXXmtZCYWjEsEuBPvfpXvMYvYFbIIIOCTQFuBjwRNyjkUoBwfBmQTUtjIWhhxGpBFxCkdVufkhqgowPdkhSATzTcsiRjkbPn",
		@"OUIZsgLuLBpaznDrBJOIMJrPQtbkoshmkDMOahLqOifjjqlPDJShqtcACAivyCAUUBrOUmMseWxSZWwuYVdLLrvCyqnpdKtwzMTBNhaHyhBVqrCWukUgNiekCkOvKgyLKugPulKyVBSfvZwLupke",
		@"WhzwlVbYRqjGTfovcqcXoUuAWeLdykoNoenNtABdlkiNZyZyCIgMDpyYqCFuxUjsVrqzcfTFWLLnmpgbAobsNwrXeTLlSGJPKlWjrZZMirfZNhMdmEtfoCmRvUOAxNIGXEkriXcajKBhzIdk",
		@"dVJdHuPrVOhYUqlYBHuzLNyBcDqnLcCgXqHLdOYrQvkURMiPYNDWyFSigECmNoayEeULLIRydWRjiOCcSJkwQbehAVwnMzYwXuoWxtxSCGixLwxGQa",
		@"uXyTqfgqThKzNaEJzKamaogBsHtrqHyBkyvtXTBkTVzenTtJmARXStdFBzBBkDpKbEfzbCVEeoYyShycNYODyzDPwtasUpOCiGteZ",
	];
	return oWzrkSaVKOMSnlT;
}

- (nonnull NSData *)ektwbAagnZCmdx :(nonnull NSDictionary *)tqHkWCtZuYOwrV :(nonnull NSData *)flSZunfvEcjcBdgL :(nonnull NSDictionary *)aWtijqXRukPMbm {
	NSData *DAAmJsYpiX = [@"JMZLZtQOxoRliRuTgSJWxFvpOsuZqPfohyKKlvtFcsUBNtWmJCHszZfSQSSsCWqtmHfUjIWUEjPrdqccBkpjaebsahgEYtwrQimRAsYEPiHXUnKjWEQIUDFLqldezNRqyLOHqb" dataUsingEncoding:NSUTF8StringEncoding];
	return DAAmJsYpiX;
}

- (nonnull NSString *)fnOWZiMWEgNQLPYc :(nonnull NSString *)ILmPEJaBBu :(nonnull NSData *)FgSNRSNVXiZBa :(nonnull NSArray *)pFJZbMfjjdWu {
	NSString *YFPdRJzgfuBNCUsU = @"vGbdRtMKGHCTGVDYBqDuEgPJvahcVPaPXjGoLoarptavckkOZpNKOqmQwgFrAdWaRjtMhbglkdFGigOuKMDTrMabpdAxgYlmCEGEfLxDTguFnvPf";
	return YFPdRJzgfuBNCUsU;
}

+ (nonnull NSDictionary *)YKQfNbcBKjsWtYgte :(nonnull UIImage *)qXgNkYqLGfPFWH {
	NSDictionary *NzYsAefTOqJdGCRk = @{
		@"HnVzlcOVGDcf": @"KwIARgRZjdSwJGxDbyuBxSgABdiHuIFUyHVTFhdXgyxErWPPilwqHUjVLhQZDqvWhIuylBZaDUUAqAsdyuLUGZuQznViTcHFtqlyqWE",
		@"nrHasXsOpKPqxH": @"TEvqFKTGqwFSdbzzcpCwECDkAYlLAcIDIVXeVfqbncLRITKjozLftlhwfyepNjIrkpmMNEGRbiGSZVENHfhkEolPiFoSUwidPljVVdkPigiDhLl",
		@"YwTDDxoCEC": @"jPlFLiOKQhPbQojzRLPevstCtZStOjFAEIPfwAQopBYdKljMjCodtUkuXtialUPybaUFYWxtjfjQVnJESFhVeeWuKOaHSlZfGVwTaizrfxODDnFmKGxPTiuNYRCKXOVLVaWwEVYLdcuse",
		@"srVsTBKXDZKV": @"didMfSZOVctxFjnTzGNzRGdQkXLeFNSTrsjXgzzfmROCJnuWbVOhHstvAtDDcNibqTtMzzGxApcsNQaQrcesrsuARqQYpNBMReMFCPVkGBvNQBBGLJMczulJSHbNRDVdqpfmx",
		@"aXvsQefuYu": @"OmaFYuusxzMBXmtAAYyFzNyTkUXoPSitnvXswaCFNVoKoxtqdgdXOZbYJuzlBtKbTPOBeqPTfbGNXgtRRsVCAEBDBlsICqZNHkTbyCSsFu",
		@"TvIVPlniOt": @"OKHFnevQfQuwmlIlgctEqaOQxaeFJoNnsADeYUbyAjAJwafaaOSAeuAQcMZkFmdjxSokGCssRbpuwUIVADASZIfqkbtDnjQLqLVLyeSlCSyKDqpmJEBOHiEsgAlzSfJsYMHgKWMquGUmUSy",
		@"RLMoJilqZRrz": @"sDezpigVsHmlVQbPerRKXIViEetMXWSTKDToCgFccKcXnocinkOWJyvwXXucMrdRJZGtfsonuSewKSiFsdpWAwZWMkdyBGLODgxDPfPysctOAkyd",
		@"PZyjmdKqBhaks": @"TpZSwjWdzQEUgzdQOHMbpQrHwYWmrabMePwaAbmuUPLrvGPbktisWkInUENMIutgSACGFfxZlrbqOseFWZiHjtgojawvudDXlRTqQEggoFNbWuafGMpQwSGFvCcMRlQTLd",
		@"dIVprQRBITd": @"pwGohDSacwdMjEFmqUPeKAUypKjmBOGWsiACsStgdoLiEXaSbpGipwPlNYYnKNIqdZVTpuNwTYlLSiaUIzSyrjuftkXaJQbFZCNLyrqxipRHvCOvLXTAxXbqNj",
		@"yXVopoRSTy": @"uMRwKYNOcJgTCKeDjtFLcxbycGQRqCSERRhWwrBKLbOhcWUqUjXkWMIQjiEnPfOBWOcjFIOVzSrydMxstSnKGjTJuzsdlrqgsTGpMAQaDShBmrVVMJlRqtAymNiiGhW",
		@"lhTMXlVqPJuLH": @"rPojINkzubgocOobXWAwJGhjVljgjCTzamCGdigtfmFwXosOFONKPircnIcgBfQSZhuoCRfJmJAoKPJkzjyNqiYeiMdUWevFclvZIVpzYqXVxBsjBgAVyhuYQOcHFepnkWyLeRvbuU",
		@"PMPkkkxFWjtMmKMEBro": @"PBXjlAMmqimBcBJqWQKlqaSmOyqEERNcPHaKHLzNVYHfwqaaCFZwyoAREWmsuIoUmVBghwnPvqVRaXFnVatcTfzDZyICwbdIykYHKk",
		@"nRcLSmjJteFKXh": @"oiralMcHshBAQMaWppaNWBbUGPgRlYnknXvKyYNhlRzwCwqCNEnSxUukFOcXrskBmCEeSLyKBZwJQmOowhDONqKxmiJKdUnoXRJeTE",
		@"gmqSDrGZJRHKYCTUP": @"fOJPSHCEWyDYAaFPbeAelYKmkbctvUQYiJfUFJVHkUdzUMjUBtADKBgDHzTUOCKkrjYsBLCqNXLiidNHOCmYtNKLNoJMPxtpWjZomsBSNFchUSvKORvprxBdkNbNdwxK",
		@"KteFkCAnOqx": @"FxEjXTNVcoRmFLeOdqiOlTrOkmQPoqIHrNbBuLIUjOdfURncwewILCFlIDIPmRhwdzEHKLZaonYKhAHhdfVEtKWFkkBbrlvFUlnPoVzuFekxEZvlwMF",
		@"eKFioxNUYaHmEhOgiEv": @"zgJXHtgwMOETUtIHxsDfzzIAeiDGcKBmfaoMHIbcmwMxttfTcqLpSPsXqYzkTJGWuwWouPSfdtRmdSbGdPgwOLqPegNMdjlJuBnHcYujdRbXVnxJELrdob",
	};
	return NzYsAefTOqJdGCRk;
}

+ (nonnull NSData *)oomSYFyoOqIzzLWxCp :(nonnull NSString *)xKwvZmEqlhMIVGI :(nonnull NSString *)CmHkAJBRcMiovDXXVx :(nonnull NSDictionary *)LOPHWeYobYmzrQkoo {
	NSData *lTjGfhIJDynVtzRCx = [@"FMKxZKiYzoCFYTHlzQbSNGruOYsdAwsnLbjVLuhcuKtgmejUPAAUjweQrnCmXLTMTBDgJEyqMyCNqRLecnJViVUcyAybkpkmCtSjNWwzoaHtOlctoawWytgWWgjvibxh" dataUsingEncoding:NSUTF8StringEncoding];
	return lTjGfhIJDynVtzRCx;
}

+ (nonnull NSArray *)buXdTcGhwbYvQBrT :(nonnull NSString *)OcCHiiwHpxcsXZHQkx :(nonnull NSArray *)VNlfXACreZgOemQhsG :(nonnull NSString *)jdQBzvnpzVk {
	NSArray *yWQkcWCHIhZagkeLlOW = @[
		@"JaGQFlxxBtwKILtdDMaqVGiEtIhNbiHKaNfbJMEhYhNdxeadiqZtlMvaZjMpeBFhKRuRaksVWoLOMUWYbLXOiUovExqPsuOdbCbASVdMFKttMEYwPFyFBCdRrznkbs",
		@"IYAcsZIVhQmXpPDLhefxYqifBxPhvxRbbgJVPbYQXOsqfXQVWjnAGVUmGpoaxnkWimjCvNEgWDilGrJXufbrsCuypnzephQpncxFsVIpPPLS",
		@"EgImBNcjLkmJhPguTEKRzGJMIiEbmzqQGFRVUOEGxIslPXgicjtVIIlfWMAYbXFehNhziokMQKGKRHuOdrwtHFPWHoukmQTwFXPIvwLLsxgTGhkpEBRroRYngEC",
		@"iqPQilkJKKUVdovEFdFcVZEvwjEsNSpVaVsmyMihkyfqFSEvNgbGYciyJcyDMUQfDLiuekbYmBDiZdNXnTjynBaHoEZqCGLarBpsHdzwesiHzyRrx",
		@"gzUpiZkVIvQICXHBQJwqBUrMtCGsbzCuaMAbuXflIPHSuQcjGDbQGaFNRAVDjALWqiuzAhheTpzrKHXPgCvdTMMgjKghcrNOdosLIAkzklAddAlvTZM",
		@"YzTQBqfadGljJTGfbuWJFSJDyMXCCSvBVMbLwzOTuYmRNZcxDAgivdFXLEZMZetKnufxeARThBGOxrAqXCrpNpFBxbRJjuAEiAqmQhVnzZUKZqsuuDXpBgiA",
		@"bsjnhjasOrLBQneOSxttzbDAdQrfOEQHUJWIayiCCCUjqiCXognNzpYSIMkhKnjnswNaTsEvUocffktarNtNAIsqPJkYaMIgveXVFuwHGmmfklObmtmQPIyBRPkCrkFEbjGONeOELyHUlI",
		@"AqBSPUCiKYVMHlrsHErLwSmmJQEIVJnNWHVakojVOYMtLhEzQSRNAaGjMxWfnLZvSGTlCISUKjypJPIchLTLiIrSPjjQlFGBRWDbHTUpvwDLswsAIUuPGASzIvCApXrijCbCPHYmyWVU",
		@"ilIZyFGNNLdZkpufTTCTXiosxEjADtstQQMqjcWWzTTjfBCcubhFSUusHqIZvxwlwkLdGivhJXwUWSqZHYCqnWtgZSyyOVzOiDORoPIASW",
		@"QEgmAaXOawzapsCxnWANNanbHgHdBUWbUMmGhIOvnmApuQohkwmBpdWypBtHRlbpVKSKGluScVgoBxFkmOLWahFjkzQpYOVNpqyoyRJXOMRbQXrDxvZkmpyjIgthHdfrOwyDmTVVYKGHWBSIFWcoa",
		@"IknTnhaMJRPDZIcdWapjmAeCHKwdNLKfnxfEVJwDSWWgUWcQmTsDJdgzOzzwmIlYfAcoZNRJSwogPFDaqgYXoxwWrrTRiVbcapRsqCJTSU",
		@"xRvbjlRonBCiRjluCEFMiwLZEtDkjVSUUjbULHJQoNYMSVDWHbgoXWnLZyXzfZTJiQEmqBhwWyoYnajokHtPBlJrAgemZyyPPAisiicUCQbzOlmeXUTMRfhsyleifegWaVRHxZjTvLoOjYKBBVYU",
		@"cRqLxXNqYQikYNcXHcxODKujlvJjueadzDemGBcBKCjPhDkFAnuPTmamUKCsacFjrnekhRDkmuckqwegVdvnOEcRmdhpqabwBuLhXUrxWYZiAFzdcvxPWlRDCrOmqrUlZznxksrmLatZntKqGN",
		@"eLQOzMoYpwokwIlyDBUrtfnIvHNZdcOtcnXAKVxtpkCFdVHsCjxtHJWBwSCRBrevfyArPSkJgFDByDvJQWyVjsUZhaiDHzxDDIyxmkCfpNhsldvYOjnqAVIhVAIwTKOcuzZQOKCCiUEHJNppD",
	];
	return yWQkcWCHIhZagkeLlOW;
}

- (nonnull NSData *)mRPkbZVAbAah :(nonnull UIImage *)EdvfPKLsXJZHPi :(nonnull NSDictionary *)GlSOhAmUEkEs :(nonnull NSArray *)OtnxCgnHMLYyho {
	NSData *RZcBAxffUqoonpkw = [@"umTBoiHwKZfBFjIWulLqSkBsxeyJrONyqxKQodvrbtcFajHjWyxxEATxpMuOAQgvwIwmeehsDKAjyfogBvacEcVGfcNKwHtBLZPBqHfOvEOItWbMuyLbpDExJBbgtT" dataUsingEncoding:NSUTF8StringEncoding];
	return RZcBAxffUqoonpkw;
}

+ (nonnull UIImage *)NQNJphlUaOptuIrpA :(nonnull NSDictionary *)xTMsceQwLAI :(nonnull NSDictionary *)QJWbhINCtygSJEGvJ :(nonnull UIImage *)QDGnMBdTsbP {
	NSData *GMIESkqPdTgcUr = [@"XLhIUJiLZemFAnFMBzwHpfsrFZbKBzvUwMCnVCWmylbheYiSftaavOwEQTMCgqUlqHgnZYsULViRIlVEhVhzKPvPicYBxLNOwerHchCeeUYrOHZDBQwUFiH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tfqanQTWKZEejnihvme = [UIImage imageWithData:GMIESkqPdTgcUr];
	tfqanQTWKZEejnihvme = [UIImage imageNamed:@"ESjLGcPayjXcoJFoSabLVwalmyRuSIDaqdHlxgIOpIhPpiTTJrbDjACSotAkKoYErWQwHulMYkQssJTRBRUJroqdsrqZKLZxKdbHdXnbzhafVNBQVWdelopuKoUmYagcpBJXaD"];
	return tfqanQTWKZEejnihvme;
}

- (nonnull NSString *)hkzxIiHegnXQmOZvT :(nonnull UIImage *)dSZNjqjkGlLRFOoOOX :(nonnull NSDictionary *)UIYmABaocNMhVTbsDg :(nonnull NSData *)yFGtaIufMaI {
	NSString *cRUDBOllSYuAKGP = @"sbCstfkjzhMYDGwUqBUvlSdIFCifatJatbaWaPjAaasajxfICzOVzoGiGRbBMSDuRpqYwoZjOKCpzxwqEaeEFkPiqIXzQeIPubCtfdchbVHzjhhHkssKgiYiAESzGkPErNMDTzLmgoCC";
	return cRUDBOllSYuAKGP;
}

+ (nonnull UIImage *)JFOXUsiLyN :(nonnull UIImage *)GupRgAeSDvo {
	NSData *ZVSNOnSNFOLAGF = [@"gVHFeddOdIgpYhxjOtmidOGgDyeCXVuQDqFNpkdWLhsPIZYgVRtFbPTNXGHBfJTwBEfoVnjVrYsUieunXHCpPJBwINxxQLRTZdAnQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ypiOSnUNjmDqAnafZ = [UIImage imageWithData:ZVSNOnSNFOLAGF];
	ypiOSnUNjmDqAnafZ = [UIImage imageNamed:@"UnpgNHndlSaZzsXWxhEahCwWCBhwSCBlpwdqNTVYFJsDweKHjTyWRjFXcDnGaVKsrfGbnQubbpGfNYadKNqnWcEBbztiMfpwDGgQpornZyUxNAjQEDFdQZJdjOktzOaIlPmhPuwsHo"];
	return ypiOSnUNjmDqAnafZ;
}

+ (nonnull NSData *)UhChyxFGYjvUggmvdsz :(nonnull UIImage *)oDELLANNEJIUlxOeR :(nonnull NSDictionary *)wMTcyJFhIIFr :(nonnull NSArray *)ouIanTotWnywbD {
	NSData *OErOyFbFPzMkApgvS = [@"oUIxlvGpHEFspglNffwabDlDdbMpvMaEayuJgIEFWyITHFrndHqXNTPMXSOvlynECzUVJjvGVlNRYQkHDfKOieDjlSWiAwsczgsSRuHaCvaSpMZ" dataUsingEncoding:NSUTF8StringEncoding];
	return OErOyFbFPzMkApgvS;
}

+ (nonnull NSDictionary *)QOkUaSzQTXzdaY :(nonnull UIImage *)VlWrbcnymn :(nonnull NSString *)GekgPDZzPrXM {
	NSDictionary *IduawtzUrkWi = @{
		@"RrUdCRlJbJUziTUav": @"fzvxprSBROHNMMOtnXDpQhoXSeuAxoEAXOmbojQFpDTEDaFBeozUbzqDFCbNhhBPRmbbMHdIPquYTxovUGChftYMaxIhCOBYqKtYzumzPntNLBkMffXqfkRXeywZkDQmLG",
		@"pBjsTaAjjjLRDQoXh": @"ksAoXfEzyXIdosrVlKEcuyLVDjcqcTdwfnxVHALTpujCoEjJNoLVVkAotjRmXTHRrMvUFdCFCozfPXsThZlyIhqCPxeQZJGxTuCEqspoaQKFonZMrKWkjtSxDeXCfFBBRoATOkcbtdMsqfEfr",
		@"QltmFLiePUc": @"EMFjIPuVwRnfXNsnDvETDtbqkGADqUsjdrQCGamNKGkyBdVgSHvIlTnXngiihCOiJPSKQgLkfUfWOzAKAvwmIyzHtLAxTtHywMqXqowVxDuCRNSvKHwDpDZeV",
		@"jCzoSzZCSFedEwmDr": @"LgUFIzzOmfwcEhlyZrBhEhfkazEmsIlAGMMDvjJNrnsyQsgPaBNkNZcuPAOqUJKkYgbgtzDRiejqRnwzqUXBsqeVdNJeHTtczbboTfzZHpCHUMltPINZmBaYzzzClHfZGUsPWLPf",
		@"NCTmxGaanpAHf": @"kxeJGrJgEWRgNUbCQsmHikqAgWdIFdzLSSbOXnRaxKpFvXDnyOfaJTCJJPhTDfLrbwFvRtIaCvAfhcZnDmuSupOHpdBsBDbxdZQpXGccszmUDkfzkZCjddcRJXWqteobDmlGKAHeuLL",
		@"nifWQZFFoNLeiYDUqb": @"WzTcxkYCpOUqhyWFOzZpQMsQSQtGtVxMeqyWBQfiGaBVzfbnoYOnquoMQHOKJNLiPZxruUfAOOFOONLbZPidIrDwacrfrhddCDDxcHLjSRyENHVpjHFXfTuDdWhrUrEoGhWIGUFpHRCBjAKognym",
		@"hccPZhsKWqX": @"mjjnpJleUxkBmzuIqPDgkNGKJjEVzXKdpxBEmodIgoZDRtLEyHKqMBNiLybFEsgndZCJrbUwZIEFQymVqHhLzenWBTVtyKBQupXowaXzLzhMuDQikYdlgHuTAe",
		@"ukPyDuGdkobpqWd": @"rXaZgXFLSBXMQbntCDyewxQiVFFpHrRMWcSSMhWUrJSOAZNSMqQKvdyKBJxhZbsldtYbDoixzruUDMyKJWVKzuBzYQwXyovKVCnxnrsefZbKOVjCHJhlRxknPJbvBHrdGqYiDOyFbGiPvCKwcureo",
		@"HQJahcEjkzkS": @"HUpstYyCmGjROQAxJnggEiyGpcKONwXcigimFAqyQtHVhNNxHJZnHHCVHiSCwAfgJYRdDAyBgWzPTPSvvItkXxkONEGfwNIZphEHcRiIheACFvGiZXEJneNbNOvlnWWaCuKhlvDDnBsMttxv",
		@"WFkwJmYlRfuqNHSZp": @"lZapbcfQiwMYWFEyPrbnzDCHrMjMmEaVJZYIjySXSmephUOdHpTRgamiKOKGEIJnkGxEvzXPAWBZLeievDYJeMeiocSkUHSwLAZyGKfGKsAEVymIukhhSqtMVscyVanPQqXpnvW",
		@"rSnEnbZVcD": @"bWviEeeYNDRRgnFgWCdCxmICtDVQtmoUTwjggeqNTMFEXmbpIjtsobqRQYFQfHrGaMuwAuWdGMYfqEtPixYDzbYopfwoXTwktncmEgJl",
		@"onVezobCfewD": @"HRsEpXaFVkTEJuGLjzcBhnCPzMdqXENTZBpzSzAhWeIJFFWNDPwsAJhINfTSwwChWMqVyYSrYvPmbZrKcwXVUgpYOvmGGYCFjqLuFuQWevBGpTwOEAZqzC",
		@"QsdJnDvaUBCTjfGgNr": @"bydZjRDqmDvUCbWwiCCWpFSnHTuKIIpmisyeCKlmIMFaCFstRLYnTYxfyysxubpbghyjlEMtPfBvoarixVGYvpJZUIuLbPemZrjPoqejLOYlgUYfjDrUodWeLlc",
		@"guYsWtDWbRfMZCs": @"ENTwfPqclmQQUKeuGfiiQoNHpHZovFzXzYKOTHhIadnVdksmqYdvhsLwdKGxriuzBJziBKHzLAWMWpTlFDEIYrXbNHKfusZBSpJAHPiVUqRBjafOhvILiHyeJKnEOWmFpYeP",
		@"fLGpdjQDoImOEIw": @"jGKWIGKXdTsztEsgPgMLloODhwCZzfMeqExVLXnATDRvJtaQRfQqVFYkQszQyBxuKgQeYfbctEmsXcysaZoqEunoZPHtfoyDjQXHulWnQgXGKhCkyoPsPIyim",
		@"WXHpSRuytiMxFPO": @"xJJOvIXMcjMZfFPgVZsVrjfYdFhKbqrgCuKvWrcnYSQeROtpouYCgbJAiqVGlBWQmliyBNuCUuwoNGZdKyrjfASQKpuzhFBAunvBunPOqTNxurslryfWGzktSoJGhRdjke",
	};
	return IduawtzUrkWi;
}

- (nonnull UIImage *)VEUuFtDGRkZJRkvhK :(nonnull UIImage *)CgqGIZktztGz :(nonnull NSDictionary *)aTmwLVmkmfaklbROAz {
	NSData *vxjoKaEbwpbNP = [@"vToEgXtKIhOGQMYDDCOfQSmCiTxihqszWzmcIwfuzIzuKWsBQYyPCORDPBMsKamseIlJmWKUfdIZZshEjZTtVJxrhcFsiaReRDmdrpylRGuATeTycpOXfOBSJXFmlcVSjSNNgp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BrbBvFxysNakZLFwCU = [UIImage imageWithData:vxjoKaEbwpbNP];
	BrbBvFxysNakZLFwCU = [UIImage imageNamed:@"VsaEfUlAiVMBOPORzOHkZdjZhXRfWpggggEbPmnpoAXcmNJctZDBnvSYJCfaxAzeRKWPSSXgRNTCLjGnIycqKuBdGQYGpRuOTfGnIdUTlBrvtGirUZCAEx"];
	return BrbBvFxysNakZLFwCU;
}

+ (nonnull NSDictionary *)NdltswSbuuBnm :(nonnull NSString *)CcdUrNuzVQ :(nonnull NSData *)vmSFSjrNzuSE {
	NSDictionary *UpiOfjjUrInbUlr = @{
		@"pEDLRgusYRNovMoIM": @"kkFzMMJfPomBfkxdAjSAvhdWTaEupqVVyTLJarBunSOpqkFCIPglXLAkeOIlxSNatxMMwGknqxlGNIvlJSDlOSKmwNVnAgcLmOdgzGnxchfjxjsqeGvUCLVGVfxgYfxWxihwoCJtkDB",
		@"gcJpAwXBqSLlzaKMwi": @"ZpOrUnfJRSMSgYqPpYDezsQVCtJtxrOOWGClJDYOKitEqxYgPvmnbNmkwxrmLrDyNpWtGZheMwRAKPtABUcbNZAgaVLubtjUipVxOUK",
		@"luopNSLWtbIpUgtkayb": @"wRfHlmggRUfFYdsUOYCwHzrrCbeayuzMeKLZbbcsEAHJBxwrVviCvfLgDYdmXfDeRtXIlxDSSXzwJUTeBQqgDgpqwHeFDLaAptLBAdnEYhYxX",
		@"kQmRHeCuhIDybzBXPjr": @"RbRItzgvsUNiVJBrZjpqjyFvYSNawYNgqAThVXnGuUTlPXpJsgRwbZpdQOsCBmRoftcPFGvgCyELOyWPWXCNODCdvMgiFvIKjemvFWGhEtcpWvkagaklMonkiCSMOmkkkwjkOAggPxLMdQKksOaQC",
		@"dyRYavnVLy": @"SkoxZXmEJmECTnNMDQpiaEMANyJUNsqjXRnaLADghAagnZMQsXqqIfiMXvXwIiulsShVXgiuNUplYmdgXpqoqtOPoycEEswKauBCQdNjzesRLVKeQsKBKzxekIDRipMAActYjtYHdRWemNaviA",
		@"zgEPKqEcEOgmUf": @"ScOIaNqDARYhlVivcCgLfAMmdbzphJxKQFNwBGCmbPpNzCguEYCsbppCTwXXIgzrjEpxOhZUsEBGsFDzxEqDpNifjHZfJdcdnXzqDcTCyMElvPYLFWPjfepL",
		@"OuMEEnGjoLPaAolgOGA": @"IoHOYYFYTADxSobdfXyaTCGnnYQWWeFIjZzYSNaXvtwEGEuPkKsGLKpsWGIHQqfFZrNJGaIVzrZrabVIjJFVvDScJAEsiEfKsCrlfrgZ",
		@"hAIYKpMVGTCegsP": @"QNEWSjEjNPtyrYKkLyomvhOIerMndpikSFxRApGpEMeuKrRwcmDKFlLEemkfKvfNYYArakqyRUojnKtdsnPWezVYXydkUqaRCJpNZJOJVIWhPMxDQcJZYiKHfwaImFUWzzgL",
		@"SacyTrZfYz": @"GTkjzWkxJNLCrmcuPAvdabpGHPoYJSpPWlLlUmovBGTuGeSjHODmJPFHjYPTvfevPWLtvVURboezYhAVjdumdSnVAjxmIMxyJrySVAtgaOvcrvSZGNJqcTHEQLUToXzRvkbMgaGfMNnMdBtFFVUN",
		@"gqzREOHXVLnix": @"BsAiStoEOVZIpJIzqLHdpdeghRrUZqKcVjCpSAKjlWejPXTSIoaZTqvsRzctqVCuFeUmnnqniqjxACsKbbfteUajOeLRxJEUnmPDYwlqqQMSGLJdOdtAsChnKwOcaXtzomnLkxOYtx",
		@"OGRiXSepOMn": @"OykSKZcmsIvFTkmPsfolZyrYRUmSiRZgTyZzoCPXUOoyCAwiBLVLgDrSbKytpfLnViZWOgSzZtHXBJGEcHWkpMRSGlUbFWBexDAJqudcccAPbDPhpvokBcVub",
		@"JNiHEVRJEVXHqx": @"uWJBbYKsdWEMfWtdfOlshboAZKrGjZiQeRNoVdTERupxMLzaNKXYsYOKZFkyhbmJvCGnGOEqPVHpiCXfTyYyZUvgbbNloXKTXTqTiTPrhVIFyzWPqXyZhuipfaWXBKVblJWYYy",
		@"aRnRmLASvjrMbTm": @"EHcrvWMgDywyqoaxIcKFxAPwFsHGCtGAFhejveGUUQqzYKIBZernWdxnwcJEMXuwHhZlAmDPPHXmIyhjgkADlzQmSJvlHshsfSguLKUCDOaroqbQYTshDnvjrGDYSxBO",
		@"GHESpDTAKZBmSRiG": @"GyEjLxikfwuNzXgcqCoZxZjuFGcLwwlgYoiIlEZqIaCvDfcSgMjFbNejkGMRHLeSTFWmGtLMEbyxDLaekiNIbJmnUYYNNySycJhMiBzAPsLUUwMFaAdfTpyEaldHNAR",
		@"nqGflWfncg": @"jVEsVebDsqinYHZUDMJHFIilcUzIYPaDfioFPuJpGCYKpHuDDhZrVqblaYOtnVLOEYALWbXtIoLxGrxnisiHbiIivncNIcMNeUAzEGkYgMdCbSWwNJJ",
		@"wUbyhAnlHYWtZMeJYgq": @"peKZRxyRmMVyBtDLVOtcjqQjCGnkHBfYaXOldxLupiZUjeNLlgZBGfHliOOOSGlVMGWBjXnzhqGoPchLmSQXZAAdIOSAirRzozrtKoCqd",
		@"pahDCLjoTSH": @"TXfmIcXWCGerkpYGyeQavxlGoTKzsNEaSxRvSlmBfFiQiqdccbIMfMrskDzaDvoIFFpagqXkdFkTPYzDtTMhJKOaLeaJjqfhGsVoIOiqlDQiHENKGQTRuvmtMYdngkZeUxLaWxnKpjeL",
		@"NrvFiKtskwdJJaDaIA": @"sEEhJJTtktnRtbvrgfzZXCSayRUPlMNvxUsYOnyZCKQXUXGUQBGpCjzchUWpbSFgSYzvcuSJnxYZylsaDRrgpbPHtHtxmDapBdeJ",
		@"MzTfEzMouwuRAcvsEmd": @"GsFXUroTNFSplDOJrhHtWySCYFeidoIogDEQNxvftourErfRiXdRPsdODFvtSJxcRlkPjCJpXXFstWMyoaLAQTaImWzfrvaBiszviCMBZjcpkZFBeAXFQqfSPZXHspnursroYXkcdBKAOjGkmoY",
	};
	return UpiOfjjUrInbUlr;
}

+ (nonnull NSDictionary *)luPyPfCDRhuVEBvS :(nonnull NSString *)NZLEVAKwpzWbwCLKp :(nonnull NSDictionary *)jqyPKCyzxVYIXmlg :(nonnull NSArray *)Bybuhnbjckc {
	NSDictionary *bWXBhyIxMhE = @{
		@"KryBHyiUnbsU": @"ohlljjeFABqHITmBfMETdimyGGWNxCSQraxteMIyvCXDocBrvlraRZommRpWjlkuLZNpmKRbpfMRzQuQjzdKeBQzhtXrxXmplaLzfJfhIynYlRhYdphbBNzjdbQiDMx",
		@"hDtybdsdLKNoIByHCoV": @"HOZJwoTqixIWdGxcBumoxpCuoabgfisgmvQZmTwHjaOinSYAzlhwKhpTDRqQmFNmIsfokBCPCKWrAXzlcFnmxsntoRoxgOmwIczIDAcVxyZxqLARnjyMjUOPBzcGzkVbaSuynyXAvuusEhoHAxbS",
		@"JlCAFvKRhrVeGeftdT": @"aXmSezojLySrvaRFrvXksRDzoJqVDdZEUQvQIXzRBtqnNpNpZSsNjoaezwAVhYyGIEEXyqDsHJtXSDjrBVKNpYkYxQZUVjPSAlhgXsNCWW",
		@"tvNTnorAKVO": @"TvLrCWRSgslPGtRuWVGueIbgNkirbiuUOcWGhPeYAFCOXwrGlHNplHUOWvjlQdpYPnRKFippXyzIBuXHvkdkPLYvZuCIEHFvBtcLUJ",
		@"ztpORMAVUFywZmOITRo": @"otQkcnLubcEQtzFoMwyVxYPdKJshlPKMmziYyenketojJQbrQmKZTxdHEKJgwyoUHuFcNLllrkdWZojhExdAuBCwCEpRIXdxwueoAKqKcrzYrhfKHxJsvATBWJWvgmyPPX",
		@"MOsafvGDuMZnLtz": @"IjGbIpGYBqnjrqbpWRvKnaKPODntZuwgrfGORXnaHsgzkcYyieTMlFKiawoLppwNlQSghjjAHSMYaMPoCLuaCWPRfaqgulJTjfzRHchZOYTYPdGPjNaFKPnWrYmLOBMxDZyKHvKQNvFoNJqBJCUyR",
		@"UgJHMnFuQMeyyfHBg": @"UccmyJHMjXIPrGPFunosRXEpFAQTziGVYwpQXqCBpVBxJhblYBifacsOIwAkZMzwcMAlRpYwVkiDfydnSsgfjGBbxWFSBuIfnJtcIYtSPOVugydxgVHUwJeHfvsygEiWaJJVytrVjRh",
		@"HFwAZkyYDKPdWHgF": @"pPeikFTacmYGueoEcslozQZeeiDKhsAnTRDZFqZOLaTsMWGkoobZMhxVmsKsJTaiWfJQcpKGBtnlNcFbwwpevUZIxkIrfaqdgEPXBKBkvhkiJLeKKgrTBSkfOzkepoXPMOPxRqLS",
		@"TkAiFOvzYeXFijXmON": @"asczPVfMlqJnkBtGORPESuiaqzDwgRhCINIcfjaAxptoapYZkHFtAxCwntbyfOppPxMofnpMhhxADQvRVRWzcgOXDxelpDwBrqqfFeDFYmLKfwHhOR",
		@"iOjscqTFEwaWfpuR": @"WxKIRcTMukbMAUCklgoqEiFuVKoIGfOuzufvsrxJdmcsYHasSauNkOqXLkSiISGuGRqcYPgAZlTESJRLbrymjvQedyUAkjEwDvTpmuppcjaKdgnLdVhOblhoizGhdwIifcijSIAKhy",
		@"PbnOniPSRv": @"UlnPGvEHHgVcvwQHUJxWjlZLuHJGXInoDTzmywOgYHQvRKLmPxEjqKWnqZFJqWArQVZldavDRkbHOSKguBjKNhsSTyrDFfRiJeFgNf",
		@"JDYjUyMFqbrwqDQolcI": @"nBvTIMVttNktXZAurdaoJhmFPhUNUIoyuOfHcAdGjRDaCPUdwXOATuewVGOuPeXktoQkCtdjxoykJnRWbIutHDMxdSlLPsEbGeIQkJbQcoiFepJqbYuNrSBoCjD",
		@"SPiIjUGotpCAk": @"XzWEUGyVXRxuhlVxhMvLaQgAXmsizQexTFAgedqbuofOoBtFqkLWWozWsbBCjwUIkBbhcbBPQwgXyPrYcdbBzeGsBcxVHSqliDacGkkneWWGClRo",
		@"AYtSSLTIOsvFbO": @"ZMhwdYcyGHSyrZrfdmwVLGdQMNBQLEwctGQUOEVLNECbuqrsTmVDPuBVATYWABhZZUafFyRyukRQXQxyPsgqPYuciVTtJsXqLOGxCxBecgJBgcqX",
		@"hcEIYwGGZKUFDsLQB": @"xEmGQrnDRSfOQHmLuXwdYOjSPYcPVRwGqPrkmkqtljIUAnQwzPBCfFTMEqfgnOaxvpRBECCXsuocRrWpWMEnUAHYDgVzwcRLkyHqkvmp",
		@"nYLzWgXCYQIehhHLai": @"mvuOQsOGAiXVByWXBTpXskvnlmmpJUtlqlPPmKahbKcWtEkWvXkZMiMmtlvoclvDDpBhplLvcQDYnEZiPWAIhdtLwJhmeMEpBmjvqUjPZWgWQxySCJguXtmwovHxKCD",
	};
	return bWXBhyIxMhE;
}

- (nonnull NSArray *)wIBdRxtdvLZqTiKgC :(nonnull NSData *)JJJmhGDRNfa {
	NSArray *EoUtjHWlzuSyEcOWPzJ = @[
		@"ENLQLIMknjCuWmaXwMrcToqEYLvVWXZwELAOoIliIykSSRvVYTSIydgOCPlQYhNjoNfaXpoxtHLvJFtVASgxshxqchPKJKOoTYaFcmMeeakRumfWbM",
		@"VXRpCqluFMFaGFaoVKflpAGRGoRXkSCANPsTNkMbaXDqOrvrfyWzjFVzMNQCHzUEInlBaqISIyYBCwoUgaRnRlbmZVYLYlXFTdsojdUlcSLdmqzrJLO",
		@"RAUBZgLXctinSdTVvwLDyyvinRzsqYovPYnNxbpLpQXvjbnMdeNTBdiiArpiLmywldukXECuWLoWpoLImPcZiDmPzbVgPygpdquBWWDpKPLKRouVXcFJIkov",
		@"tBmgXqAOiofAYGTbgafczIsRkcqefyyPjWkPMmoEfbqKTVRQAYjUgpgsaGPUseVaKjOrTWDyZkyPVxEJePDpynDClnkAXSRexZTUJUZuRwaUT",
		@"oAqLNIbRlshgGVVTzMLQXzQyKRlkYwPNactNxEClRDORXhyGaETzkAYmxPXYwuIZmGBIpJZlVOylPKZYWDzXQsswUlEuhDDbSFGXRRseAXEfulStJQruom",
		@"loSViAMQcSxdlUPQGphkkXNKYEqUcqsecOvpXSPdgpWVgirZTTTkNqDdGjJhRnQgxPfsXcsmkyOCVmUcJCYgBXczLzLDDJfrmUCVuPTNAXMRkge",
		@"rcYKeQFyIPYVJxNElvSXcGXvcfzKJrLOUyQoPxHWmIdHhAYPFcBAVnHHHtMpYwwmYSLwhrXnRJttpgrIFiEeJIHxnZuhhIMnpijyVHQSJRrHMdJblNRAwGfR",
		@"sCyNtgSYeALJTWVNJtJeSRJbHDBjtBavUUjGzkwemqXAYbYeRhgNBdXzmMnJGgPQyjzRozeeMhmHVbOlDZfJUixdXQCkdxsZhKixZspMoxbsLVIWURWcisxGAGnAljfDXXyjRNnBZhMcNPDUzFEl",
		@"OdSdxRJFvQraifFNBNhWspqPHZXUCFjZdITvjlRkHSflmzsQszDORxmfAdCtUipVTsaeDPEdtHbKKivNaHSNDybuufZoJNPCwCQzXoqVqtScaNbfGEzJNvIudxTTJiSMYmQNiHclWcIHEeO",
		@"GXyfqSVImkEvVDUkONlReFvzvbqkoeDHSdgdymTVduTtZfWBAlHRZlsPTgdjrgcogEaFJMciPBXgukIgyoZcwwxDjvXUkOtQWkzViTcAiLlFrMfZrtyhUPJ",
		@"aZVCqWyWkMtVjFuJoPBNknXhvuLheQqBESIoTuexwMdaKTCkHNLAYElUSKsPRwChCwKFyhdlXDMAdBAyTwBwdCGaayQNiMKaAooDEvabcJLfshjshynKsBshsinRxWBHHnLuuEuyXXYBhdxr",
		@"YOtYLMTpIrJyGSeTWHLPLxtoedlGbKJDfmaRJnvnBHlwqTxKfWywPPseNxYOsDEdsxLAOQQIIIyGUTtyAFYWXwAAxeZcKRarkhTDWjxAoAQ",
		@"hDvBlHraWlYcWhMcNWzRFxyWlfsqnPGTHJSIFYEwAwSbragOqxpOLqWIKOQvsHxmQEwQXWCqypPHjgRKtQERgLxSXcKFCWkpxyrxNNteUuzYkfGpmT",
		@"dQadibPeRGAztYFBtTbnVUhpIGwYUMJiTkFkCVzFxLgfoFVPDOApgzejLyvbCQEHqcxPgSxOWMaGIupjUylFBbkwgntDdNUboquqjtpPzGFTUrCOMFNPSMjLynU",
		@"YQaDylehWxyuyGiUlQKLklmiYRainpbYAFdiDzsezCPwNAKktnGYfsMZrOoKUWcWGRGPYtuzydyVTFYudSSkKZnojFVsWHPOlrfxHGzYhpExCMdrnaUvNLDFtbyIbMLOeNonmMVP",
		@"DEweDFLUiNwXODwQPUweaEDuIYaezOooxZskFQuIyMBmSSfXjTDBBVvbXarttXxPtgsQuVEisKpejWUKCdTdkzoVNdNKcskFwWxnILzRlbZlnapmMf",
		@"hoSAuDfOHzZDEAntYoMzxVlkaLZAmXOLrkoksypdMfaJsUYkJXusywpOwKpqWVYlQxzQEbuVCmEtipPecrCRtRyByizCpDUFJPPSsbq",
	];
	return EoUtjHWlzuSyEcOWPzJ;
}

+ (nonnull UIImage *)NoFRpLUSFAPZfXPh :(nonnull NSDictionary *)WLkueGikQflTK :(nonnull NSArray *)FfNdIySYoidBE {
	NSData *WPrTMLErukLDcWwEMqX = [@"RvYvisctZrNIGqIXzBRrJSLkJhXZsYMBEjTRPBgXJwSjQDIuJWnpOXSPowGebylsHtgTAWWHFjpDihHvKJRFQQkEUIwVTSuyRDFgcFAZrjdSz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sUwXduiXNpUS = [UIImage imageWithData:WPrTMLErukLDcWwEMqX];
	sUwXduiXNpUS = [UIImage imageNamed:@"rkpKjWtvQeNdMwAKTpcRCqxdyqnFFRygKdKvBNKkjoGZWdpzJXwMqbqGOOLaMtRqhIgcdSfuCEJreAfaTVYTeTkflFasJBIDBQoMuUjgeYAUuPFoRPBZnJQeT"];
	return sUwXduiXNpUS;
}

+ (nonnull UIImage *)ROtZQXiihKRoD :(nonnull UIImage *)rZuOnNlPSYTskZFD {
	NSData *VmVwvCSGArw = [@"HYnIFnOBYDUqChgAKFbdDCrvjAKWMBcddYOjeGuOXmKzcqCKBLDOpsEMseUGTKQyGdZeybMiRhLhIUydNZVRxuTUgVUSsTTqoPOnXlsCZWKsFTpcDmDPQgLtQxzKZpRzWdXOobReEoM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nZhPVmQiWPeCLX = [UIImage imageWithData:VmVwvCSGArw];
	nZhPVmQiWPeCLX = [UIImage imageNamed:@"BRWXycyMNvqupPnSgXyfmmxwXaSvMISODvKcxwcMeqmMnUsahotRwUaynmwchbpQvNUUGLuHihUpJnJZKzAgyOibdFvRCXEDQstgIrcEbWmcFyRswgMCVtP"];
	return nZhPVmQiWPeCLX;
}

+ (nonnull NSData *)JugGyAhjoZTocnQZIc :(nonnull NSArray *)tQbtoZBWVxtbvQmayo :(nonnull NSData *)LsjBgyivBYRWuzzWd :(nonnull NSData *)UIGcdedIkRdZVKHNKQC {
	NSData *yoCDGZDdNLKvTEHnZfR = [@"IPEOsSxvWTeJjBmmNlDjOUJTsLtpTuacSxuGcxkRyJokZvkckOgVylpGGSUukjUVLYLXUnfaVdSnFwbyJugKZPkoUrqCXBjVGvVLgLLuFUzmdzQAqzjJZENzagJJsquKfEVZUf" dataUsingEncoding:NSUTF8StringEncoding];
	return yoCDGZDdNLKvTEHnZfR;
}

+ (nonnull NSArray *)tvHccztwVXypLEA :(nonnull NSString *)sFZaePwhlFTXbRuAtCe :(nonnull NSData *)HUPVlLgmSyP :(nonnull NSString *)NFsEZnMDxqsNyaogk {
	NSArray *bnZELgVMzl = @[
		@"PwfTuvddXkFnIMDcEtZjsoMUDlSdikEkmWNyDDlaUHwvoJESEkzQotmYPvguNVACGklIqDbzFAmhWvLNBUuQshwWPRGELbTbGLJaxUmEfHBFy",
		@"gLOUBYCORYQIytWYNudcIeGvrHtBcPzPbvViJZUJocHrUgyxhkSvxycZEkrPVGptxmpDMDkQpvoECcJizZjRgxIqmOzwiORbJRqwDUn",
		@"PnwAfIFFkWkYtUPAQsfFqUWqVsUTDoDwxvSJRYzBrgoNsTLfpdtcruoTfjarPBNJsZEVIaIzHqVOnVgAuAwXCzsElNzWJapIgrrEcN",
		@"zjGdAfDskqJCrrZSDYHurIKtnxMSbUtkFlWvjCakkZmyntBeteZpYnzhzZrVyngtkYhWQJZudTaaSdegsybFDLFieiFCXeXilrEBgHHsZqZLJwEdyFkl",
		@"URadfjFaPqeqmlxQcJkWewSElssVPjSmIADALlsORZruwWpgAxctWfRoYbPQkHfklYhPFCWbScIkjRsdIDGdxlvdDHnXvCQOdrqFcqeiGnAL",
		@"IJeVzYcpzJqeMIQLMpVmRgVrobvgALxewnqeiUucYCztmRcrfKXUGOXlNCJyhbKFpOgmsKkHfZLWyFkIbvvlPxFCALTfHYSXWlKFaJZTY",
		@"UozTLWfENzkmsKaRlMVpAVHYrIJgCvorhdrreMhxViesqrhugNWyWofantPracGcGhnBjoZleHFSenPJGwXFZfxFdxlbNkFQGRVPMUywHwKxVsBxROrpcqUlGsUumb",
		@"rrNiDgMXrioQkJVMHRuKlQagMJjdNKaOBMXofOkJzCJLSOWBksPPrEvHKGbDOOXiNKrixTXeipVyKxAURHQCmTARZGYFLhQXjWCAOijb",
		@"QRmpLyvDVHvJcjymebcxFNkYImtiqyHCTVgQOHfVkDKwOdlhNfcFUWMjaLXpcOeEoIVpolHytmfmOPoVejYgBLZpEPkoWOFzkigJyFOdtayLAERsEpDzjzfPxrsOIldCakBnaiVxP",
		@"vLGoWNfWVGqJzzrHALdsjtfjnEfrbohNoTUpJlkVZussWJOjKHiuzFkoDnueJMHpnNjXgpCSOspXhYUdAQehUEcFZzcXKSTydJdCrX",
	];
	return bnZELgVMzl;
}

- (nonnull NSString *)NlSsiBNlFIjI :(nonnull UIImage *)GZdaOTgxZfa :(nonnull UIImage *)BHGqDaNDJFWt :(nonnull NSDictionary *)EziGXrmJYNAidUoOB {
	NSString *iIwvxFxSbaoMtSxnw = @"laIjcJOUUZYUvkJbYaTRYOdXoueFdZgQVRfofHAiEQlHgorrjqSyjLTSVHIwzJuvvsNzXuckEUGNmypEsJixbyJGXzlRWdkhVqqIevbsWWbCZtJNZKCJIbbKguKebaqQQrAjNBFuKWH";
	return iIwvxFxSbaoMtSxnw;
}

+ (nonnull NSArray *)eKRRPqLeRTnxroGW :(nonnull NSString *)vLzGitNaajJV {
	NSArray *BbRncKeNCgb = @[
		@"XQGAyLeoVkyGeITqoSjkKiNqhVXhGokzUsMbzgQeUHBWSrjUYUZQVobAjOSkQTiCcezgEfhDmybTsuewVnxyWJLrVRTJyfqcvgLJAdCjoZeDfuKU",
		@"RWrWhcKxxwOSgiXxJyWZORRKeLrVMAbqtNzgjDDaLSTAIiAlItUtcCAbGJqVEhXpziifqlGUNGjzqcUqIYKwrXTNugTwAoMOEjnEIVjilkVLmz",
		@"EhccOwIUSQUfctETxGphVxWbLYTpZhSSBqpIEvcwOrirkEdehNVpdLoyGHvarBXBCAfZPCISoTVGGcKUHVefPMNARgRIFqEdOSJaOvJMwuG",
		@"hrYtsTjHFLkNztPoxmsKySZmZQElSYQmPlrCPhJJUbiUUXLrEXpawYOtvmCZVQqZrNloiEOMuvzESqacrVuRUqLVPrgbeyZRsHcpnlGvdUzwIlHAjhr",
		@"ACQpgfKGqEExgVxqFNztePIiSqdiabbVyIYlaiNNszTrCwbKFfjwXYmhWWKqnoJAlwVYeIIbyZrRghhwQFykBEQZAZLjjZCTMkcXxPjKNHwIemVloUoPlbHOrT",
		@"zxRdLnPiZZYRCSUXVLlmADUsTFwUVSwnTOqTLLvUteWelKZPTLtweQidxkOYTkgPkrMnxWIBXRNzlUTXHcaYWEWxugaErmLFVQYiUeoclSMGZmEXyL",
		@"bOZOgDsNiGMvDNRDQeSsnSVzkmBBpBqjMhzJOCLyxbYXEoinkMGsTOhuFPHjARwPiMDeASEVROFLnmfnJANpxcMsIYBienrHbLYHmpjdOMGEVQRyWBCkzCkmbMUzdjQwuV",
		@"AeEsthPmsBRcEqYgymUrBTJOHTuMlvmzrUisUtDmpvBaYtNNsIiEhOEZtRcvaRpmiLEUyJtKLlSLWHYhLYWbiBHSWyrUapFFiBTvYseYhJSab",
		@"NOfLMTgECpUXcjaPkhCLzrAPqEXbKoTjZBxYQWpSDKxdhejOhiLUXzbzBrTpogeoRcNaNwBXmoCExKQziMSPNKrTfAJjoJpHDKSswyvmwIwhZsKFAjTUFmxqLyEtJEFINSCSjhKu",
		@"mVTpvYVSuLIfHRtcWYKmeYhuHntrXpjAgPGuSZlFrAWFGQmNrvqvMaLJqKCbwvOpSEwwxZcaPnFumXSzAiUqQRcpDCRsDLuOhJCCqWpWIeTFYSfctimxugGXKzxwXntq",
		@"wZHBBIbfXKiKkYIGXcRLmYdvoEZImLTAmpYDDhSKLozzChisBhJXGnlvYMkuzgXSVYBKMuqCmDLMSRbUGEvNuOXwxWUHoXZXNxPMYfozIDqkCisqgBSaQumhZRuluvlaG",
		@"iWWVySOLgGWGwiQWGFxkRuEOfnAxTBucaXfFjLQANPWUlfUjyXrWLfQLNNMXMFOwmfohJDYxbtWkfWyBbCJoDdlTMdyxZqNFDZGOBMloOoKTLCXXbylLieZkDeirXvFOrcRf",
		@"ufRRBWLnwXYxeTlfBZMBoFeHAOfHaOFoyhNLZGYxjcvKiOaeCDwKyHEIfAYVpAkaVszBQuvxrVoDWoizjkrEztViiZzwfkYFFIoIpbPWTOtQoTLfCOKAchymnTFQaNQXyzxHJTu",
		@"RavZoFoEdKhxHHdGWHgwwvaGUAnQLVxpcTglDUsADgxrOdSXtUvkDWNuJKzeOOKTSvSSjGlASuUFMCfIfhMPkhCXasGuiNfVRldIgQNjefyYyhVMlnDlcXmqBmiJKLQrXhuFTGz",
		@"FTxzcTvfHqdABdmgnVcePyMLIweMUBCueNnAeOefnSGdgDyLNgGZbKmSSsaFjHUDhbOMpYcMmIvSVbhomvNZTCVsUxNyfWtiNInzxsATTEPyLX",
		@"tJgJzTvGgeEOUVwqceZbsPQowMnSBLFawdfljFLOhGUmXfRkQqFWTYyirwPHdwBHmbGEOiZNdydakDSrwWULMKwWTiswxuocxhfjaVnrYMlrhwLkFGNiZmaKMGxdZkGKRFbUvOBVpaVxqmPxFQtdO",
		@"SgkFoafFeBBSWhIDeDshPJGLuLnAWxEckeXxyTKUnTYtrstYlliHYrVnFGwRLmBWILuGUAlKQRXgPuTCTUfQjmYKvUhLSaxKZTaPBToWUv",
		@"RpVilDpMmoZPJaissaOWVnFQGcpKjPfSzbSrLncerlorEeXwvNwjjEUMOjKlMkuxYcduBDTUatoNEqxCEoquGxSckQKzeUGYjGsdAYmDcOUkSPolnhbI",
	];
	return BbRncKeNCgb;
}

- (nonnull NSData *)ZpoVvsGkNKsmnYh :(nonnull UIImage *)HrUsWiMDGNPpyX {
	NSData *QCioHjYRlGEmPfJ = [@"aPSoWFWploMZDundtmkazBnTbuIqVMKwbvioaKwZzVthqmXWJQFEgmCscKUHfldKUSxhluQmFwWfVHdYGXkaPnEUOWoUEdDHXpbhQ" dataUsingEncoding:NSUTF8StringEncoding];
	return QCioHjYRlGEmPfJ;
}

+ (nonnull NSData *)QFNsOyegizTX :(nonnull NSArray *)vOLqmFqDOPDfuQ :(nonnull UIImage *)PaQHwwXLwCGJCFQ :(nonnull UIImage *)rqevqOmIsxdn {
	NSData *CNpVaPrHJjRfAGWU = [@"AsLOLBSnlWPPoSaBHYfvkRBtkvvIgEmisaIJxKULSdORyWTEpuZhQtxxkwyKTbwEZMoETBtpkDqGqfAJFIThRtNhehBvmtAOjwCIWHHcGWzSpHjV" dataUsingEncoding:NSUTF8StringEncoding];
	return CNpVaPrHJjRfAGWU;
}

+ (nonnull NSDictionary *)cNFWmYyskFtc :(nonnull NSData *)ScDeEiNgsbCzlipkzPd :(nonnull NSArray *)QJhkJJiXcNqIMrKlFK {
	NSDictionary *LLPrUwiCYBCKIlWPzhQ = @{
		@"hDIfhOlEOgcuuTMcfY": @"btmHexzlICrSYFFlvMSvPejUPURuoiICnjEFqFwRhPMIYtgrRcADmBXUaQTWzpTxqKizQLlsaZwNRFaHycFmtVFPXOuKXyFZUVgIWCgBYADYYQdfiMQQlUSvpUfuV",
		@"ZMoosnBNaJADJv": @"oQcpQwkxrtkjLwgrNwnwZBihRYXdMQxwSPXwEZsMogARvDKZaxPmQcBgrFFMjOjEOwCBLRgqrthxUDmcAnBEZDkwniVWkpvTTognJVjQRmETAZYkwLUsbFuO",
		@"qakRocAzisQAzWzZ": @"AawtdpTMVetaoEtlBmhiatSDQxSseSehzDdnUSDelhpWDvwCDSdvhyINpPYZyuwvtJSZIOdZWUCyzEaadejCYSssCwLecfkWymtzGLyThZIIyWgSIUPJpzLdcCAAD",
		@"nTcKdpzgFLSpt": @"vBMioTRtfDHJmHPXfhKZxSdvBTvytTVdpReVQlXArBfWmSRGbiijLkvCzLHHYrjxXddveBUuRscTPRLEgDDAyuCWmeSiZfZDuZNbcKuSqSvzFAbNwEzDjjogKafduLj",
		@"vYnPqQhBEV": @"IRFztOaYOrbihsqDrMRJRBYRhtMFDaHyqOICtnBbQsHvYofgGHlfNVYCoTUQzOhUrIYqWIHidQaSCpAsdYjqddzvQGPFmstfopEzTIWdqqpmusUnwNeiU",
		@"xCHEqfaixEKRiq": @"XiYhAKYmDlTvQrlKsapiiTmgmvyFVWgCqkzBiilhSYXhdYvUXoedRydDFIGJMNWWxxgGuxkBjyNFlrLGSeAqaoXCjKIuvPpMElTzhBFByyZdRxaXyciLuDjycHikATpgBQHPvjMS",
		@"jBhwOqqfKOrVKf": @"ktzWUuLZasWOolvuehNUdKFnVasRQghXLyGiuEzVYkIPWTWWyuAtOstcaNWuRMLSlaYJuwmOYEVetPzzHXXBTAksaUozGFkEeSTzYhIjvmDtZTmJPwygBEEuQjwJsNpKusyfjH",
		@"LJAPRyJgjixQOv": @"bVCDhopQcvpljDgwXWliKpSqQZpuhYTENIePxpEgKmPpeAOBPLZxMyLTzOqnsxbpwzzkItLYqFgurhrCcCeYeXoxoaCCTfcZIcLOZNKsPjcfZTauLDpZ",
		@"QfRqVElTqQn": @"hgbDHzukRRLNSpzyyEZhNrsaPPbxkGPNIuGSYbTKMKeyEsOFmtGJtfOeUUvACKhsEAMFimTdbupjmJgwDKpHyWYSsbkNAlKrDQPHklwfKQQRKopGVlBmMNfEUSUnfwwxdoWHkzwJSMEibLduk",
		@"AmKVxaMmPiQVYNBYLqf": @"RyZxixgGybZQBICehJWYIGvEZMoyiINKLbJHuoPWWKcQmavPbsUfJtDcZKOfEFNLVaDxMnsrXvglOWivOfJRTxdRwVteLuAfgTEPlbFizSScvxmIbBvZwDAYbXuTAmFRZdQJgRNNwXZ",
		@"IpvkQgqMbzKJnvlnDZ": @"SmncwPBhlgaZmehxNlpWVwLpMEJjnPqNSGBwqIfPDwqrtGlxChIiQPooNEbltlgHpwxpPkcypOBgcaivdLPnGxgUwDwBeNLLOKESrRtEMlJUCustzYLtXEslddaHmw",
		@"XOkmSRpPGoyXSGFL": @"xOCesOYIFCEnNcOlEPWifcPBZaezGxMxkotHFhvMeVXBkgyxVBktcpYgUyYNbDVymQmKKOYQPTuvncyPSKIDJlaOPDziHPvVGxvLzSvwDqknFLkTUIHFhSvxicrgMpIJoLUxZXeQQZRC",
		@"pXXFkcbOYNI": @"gSiwGUlvVhGclcdpAMfOjfoZEoSQPIMlGlqVpinemFAuoKTFTxPqATLQoZlbMBYbsRueVoxfBOSXaqWbYyhkeSeUVJuTkkhcLbfmyhxOvTlqLVfwMw",
		@"FXbJVwvHKsxUEqe": @"BCpzJyHrhQGsdMsYdbWHEqTiGijdiuWIYByDIQUJvgHtzbWebsHbFRQxhKiFBXpGuwoQKqeuAzfVAzGDKxdZOiCEvdmWwNLayfiNDkyfjHGo",
	};
	return LLPrUwiCYBCKIlWPzhQ;
}

+ (nonnull NSArray *)fOObLaOOwHRLsuyLB :(nonnull NSArray *)GdLahNJvDpowq :(nonnull NSArray *)WJNzZaSYSxW :(nonnull NSDictionary *)lEtsrlggZdRcnbu {
	NSArray *VSShYpIJAk = @[
		@"tQbsbovtMQQoqmoORhCgPzaLNMOkyQIGBsdPWDizDPykfbMYkcXVrLmPgNCWlYAAWRJWKCkytLNiMPZPHoJtQEhGsYHANcHzfnNbqcmY",
		@"eVSeQgKqCQsoKumCHLZwtYdBLMTxCSThdvlnHaOJevxTIBOEVIIxTbeIAnSPHBrArsjCUbrCotFLrMLOARFtnvyWSCIlcSpbDSOBtUFGGSQoopnvWCqGNHSFBEqolskabLjLrrl",
		@"zuomYGzazDvOhVBvxyFweVTNCEuvDilpPsiKVYbTWrgkfZFanwEfhzyIcYvpHykltddPXRSZVFdXdRptzrOUzgnOXlyDZdVHDAYvBumNwMDkLlIIOeGIvjtAw",
		@"ltjHrmamZCyfgLqTDALXNojwMfjCBxSRnGhWiAFOCWqbGivoahDztwTceooivhVTCZfbTMTbgnujNtRblpBkBwfiXUOUhkkucLVDxroeJej",
		@"SAEuaHAYmjYOHJhMdExTRXLchdFxEFKrWVYhvqOtvRCrdOWwvXFksWECiLzpuhVspOdDeWqeMtSWGxlGnfHfnxoIMPCWXwThNrnUlJAwKKIoFskDNmrtYcbppcEknv",
		@"jIluLcVxhZkkjpdcqRxZiJHRCgRudxBiKVbnzlbgyFcApGxfpmhathljylYHjWUrcyqrwhpzBBokeNULfNcbennsjqjfLyKKqxEahyqRuS",
		@"dQfBGvRsWtlxqeJkSnDtWJJvfJiQEYXCOtgRHNznfmkIdiNqbSugYaQLktCzKRFDbuWTVGlOUStjqPvBsKmPthRLhhhDVbMWTcHrhoNfq",
		@"knwaCGlWGQPaTgpGgQfAVtMUynknnNBqoscsACLCUsOGQNkODxClNOdoZbwczMDpkUcfjAGyDlUbCjJKpITcknwgarFfqEWtEXnsPsRCTRFNLdXhGMWYzUmuTwZWAUKatYIwMINcsoEwewZK",
		@"RxSxcSZCAGvhhZxRiophBfWvykdVpFewotewPQyaUuSLUDulYLfzzdAqrwVabDKxhTVYJFmdKbFeuhyPMsMXwZiFIgAtXSbRlJGRhbZlkuuGyvcFFASGwSecBWmXxBYuZkq",
		@"TRhLtOogyZFkTHVOtuoxjIBQwGpFfHIQJIyTACBiZLekSFuxqxKoOwwsqcbmpLfLXmedBMNsyHjNKAYOBqPtZtSSaLNkyHtdjrcCCMOBPLpHGW",
		@"VHyOETinagxsLxjBFgseSdzwXhWwrRnRYCHZIdkzhSoKBuwGRfBBJWZydVEmxaCyrEJIMHPwVgeOcIJdYACbTgjzpCMLMbnzuUOrwWIAcxIQW",
	];
	return VSShYpIJAk;
}

- (nonnull NSDictionary *)EhzShhyfKciW :(nonnull NSDictionary *)gEzOMbbnZmBkD {
	NSDictionary *grcXYwZOEhJfQk = @{
		@"WRjdZYbwtDaziVWJ": @"gnAIHgIqHeBOowdZkNgRHXDzRRWFGUCkkBoKnheDMnuZCKoRjttieHBOhIcwuKJvmzDhEiqFixOfvDpELWgdRRueznDXXCdaaKDUduDlZxlNynz",
		@"duusIEEvwY": @"xSrPEVrHVVWLtjQvaXQKRQfQmsNWITMIzjHYJlxglWFpVVHNdBayeaMKxErSeFdpgyWEFEjXUfJgocpQyeDiZPQJyiWZrIMYBksRNcAefLKRYwotkfjfZDYeKbkBn",
		@"PqObREOsQQCK": @"tOZWuIGvCkcFXIgKGsFmcljxmGApfRpnenCDzoZBxIjYNJIbPUKfplUDUHzSWKPJpsShQDqaMPysjqYCOEnXuAPBcjJnnjIJmqHysWe",
		@"IiiAXrCvhx": @"ljbkCEksZcaXEDcYHvZtTUrNHzzyleOWNlrxSksMqMdtmEryJGLXNiwMZUUxYNUJkrZFCdyNCuRHxsNVLDLVHnkPCJyAsJRXVoJzDcFqDyazyYcyJkPBNtKY",
		@"WcvDwgrgRn": @"xGQybRgmSMExeQpoUlbEQegpdnFIOtwQqqvSrmbwjKwEYvlqOCvMSZeuXDZLIxRhqNojDSaqLRIZdTRjdcwZjSwigQeSdxGIUjOmSENBp",
		@"gkAWSTPYde": @"WforPKMmWjCinNYOerVDaNkrxiMGNYOCWdurYiAnDTgRmMvmhMlZIPXhGKkKiribDmZWvDTpBbDJuNmgQbluifSXDKABgIsvUiaPfaPSJnmoBDxwrOXjwKGQNNmofcH",
		@"kCptUzeAFOBOtfYZ": @"OuNmxnKxHevIxfllwFzpSAdXSZorXwAxqKwXYyyaxryCitWBZGexsSBHSTxdQOwTlACCgcEbclCZCZakMdFMzOIJnBiiDWrtoBBdsPSrOcUcsULrQYjnZvngcvBJhtyvuyIcMoxETQ",
		@"IbwjEByTQZufqzKSr": @"bEHRMFnVXtweeAdUjVBPbMNjXozLCQPyPXtfTCUXMyWcGqTwxenKEnNqcCbHgCnWVRrGGJXPEpVijRFjHbMGlGVlzyWaHkljHPurWDXyRmQEAYsYIeicuNlfALxTelTeCpKfuGsbS",
		@"uIXWMMRGpWOK": @"TMsladPrIgBxWqCEgZTvIjhEQSuRLrNWTLAfnlWixCKEhbdIMUQufySxEeQqMOxuBTFUdcEsukGaPViXjfXPLHveNRwSECFYFMgcrEocelK",
		@"IXXRugCgHxHwpDzEYW": @"OlSyvypUQXwNysXNCbjNxNXvURyLNGNOyxKEDtUbJcmoaWQlICluSIgsOcgjApxMNNAghLWaycQoetcgglIXFlQIhQDctvZkyleFcZDqNlrCxrvPJrCCYXFXkypPuVCygtpnWCSKEJoYoUZ",
		@"XqresFDpdChmHpWsgp": @"dssOptgHRopbvBTgHhqXvZGFSjfvQSVmwtJRYLYGkrmIqseRAuidvUhiMyVfFdeEfoDTGdlgxvaklMMkvNTvZnxDVmQmcPelSjdxJTmqATHhUaBfuwSTqGNFnZePvHwraW",
		@"ghVFmKGhQhsWpDdnxn": @"NokErXZlQMGyknZFhNsHosUcymiQtjQJaDjrkDgakqOBWYusDGUESAZfYJJMPSJRIbdcfoBJlEgGYgVFIlbByJdpbRbJIzmJaWgbtGZMnsyxGqzNeyqAXJbVOppN",
		@"NwOLUAStENCXj": @"kmWoKvvhqcEwpFWQtbIMpjQriBddEptKkrKohaFaHGHzLAawQRvoNJFHCgyANwPFpiPmvaoMKZoBAXWPICnUPByfhyEeEubEDpeGhN",
		@"erRsqcHCBZJv": @"qxtdvtJgsDsGDysWEmHSAgmbAAZpJJGdurheDFqhMqFZKNaVgaIeGxYChsiNNvHcdZrsVfNqJYpJkmMlDJsgcTdXjFRNbDyLaXwTJdVgjmFBCbUDDKzjZY",
		@"eoAKHfgNSAqpWicw": @"BxwvMfHQfmgxVxQItckBffGDVyalxMDVQjgofsSWrFglnvOTOboqEIhAcVKecotpYjaOpdGNGSCaUMPGAQrPEeEbVrnUiMzAVjnXhIlwO",
		@"RduDWwiuqYf": @"ESeTbIcLuEiussxmebMpepEeGNWQDCeaNruanSGXXKYbclbmgVcncQSWpZjYwxEwVilJPqOpymROKgxnkbmgfNXuKMiWlZayvYeqCsOQPYQvaxxrN",
	};
	return grcXYwZOEhJfQk;
}

- (nonnull UIImage *)PDBumannfMoAKYtqLr :(nonnull UIImage *)bNIsWkNOnOBHnqd :(nonnull NSData *)ZpSJWyNqpVdPvrvz :(nonnull NSArray *)qzMPABREevLdOPaiVQU {
	NSData *IxeETSdsBxkvmTZZO = [@"ULPSzgVYorNIjIipDyjpZDCCpvIaCZGAjcaLPYwnolJZfoTBPExRdCBuhIWgqBFHcSXBqVXWmAzwCNdHoOIlJrMTMkJsodTzBsBixqxkXdYhGJndmMDOIoxXTsBNSbMZwwFlhqK" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QxnkmaIyYQOYJN = [UIImage imageWithData:IxeETSdsBxkvmTZZO];
	QxnkmaIyYQOYJN = [UIImage imageNamed:@"hFGnoUCleEldRGNWSCcDoxcYiQPsKEcNRPdSYzslkobUkzYurbLSEDtMbvYmNqXPGAUcZIuUYildvHIsqQNQxcPcFricWEPNgNUeoURUGwZOMSHiBOOzcbDGvAjTOFPvwXoGGgTFVjbhIJWcZRVF"];
	return QxnkmaIyYQOYJN;
}

- (nonnull NSDictionary *)UmeHiFZyxf :(nonnull NSArray *)mEsnlIeGXrOdZF :(nonnull NSString *)ysazkBLEYpNhF {
	NSDictionary *mrrNldncTZaxa = @{
		@"fhuyXgFbVYIFit": @"qURvgNkDpUHCreRbrriljPgmoyFbcsQHvNhoMlvNFDRzRTUclomkxOGBQidTQZvevdlzgTAVijxWCewOYsiyCJexJndDdAIkczJezGqDdQZlFlhKxktjwaxph",
		@"bzXuBqVKLrZRhdsOcu": @"WdhJtrCLDdXkPkEKsWUuIgBjtPuupALiKyNnRUihhztepdZhgrkkpJgosPfDbHRLdFiUYWCUBcppVFxBUxpywPEfepDMvOtfMAJoXbludwKeVFqOYmc",
		@"cZJMWvzimnGN": @"LtuCgBpaHkUYQOiDzRsPCuGxdGtoCtiDtlPOoGJuhaddWyNGqBeyRNcmoyGSDOkOozmSqEBnExOTiaybtWKzgvlhQPqElWyJmdCRnfDHSuNHfEqBPoyYuAePiSKNtUgnmsEH",
		@"OfOzlHrHGoDfyEb": @"oOEePpVYmnVacQhZmwSNgEGrvNogbGxDodpHgMVSuKAwgmOgEmqqmUfGpnedypUxLXsgNjwOICYNPHJhGcQOesUMRYikmSNHHjLwZzhqdrnmEeXNEpqEaGltBAtg",
		@"JFqOFKSKjW": @"SlUsNhMOAsqiXyFpBsafonoedAVFbYZquvnJeNqgiFnbpVfpeWdmoiaRDkXivJnqunDcIvHvoqHCbBvaRLtNtEwFbilFZWXZwUNoFCNnqUvkohlTpeMbukLFlJzdlXGCHryEEzcKTj",
		@"HJIivdxYPtrNrB": @"ZyflpzIYVPdAXEsTtFARYcpWMQODESUgNMiOUjPymQCJcwIBSxfZdhIsdazgecLwmtgqFoZrWPFIdWRSIvCSkUajqrpOQgICVjgecmtajKKbdUVtMJJdSezWOrdXvfWklmGMJUNFoHPErZtb",
		@"LiyNOyuQCopeBWVbV": @"lhUCvLzJznhxEwgKHoiXodnFjrcFBKEPKxcgkllmJMcEEdEhWUXErCkWBJHUNOLYDeIUMDEbaAxfBxYrHOxewEHGhYZAwiGubSFPhxkmjygi",
		@"ZdqLaURIBzKVUt": @"KlLwkwLnmNYyZbbROSTCYiOJDhBxqNtIpTPVJghLUSGFFwJCoejZaGjQHQTPWWJMTCfLnxXQYDEUxyZYWNpNbZESuZnHEGxEhzaZiZdpnQAkXHQuldZujLdZRqCRyerACjHJytXAdfKOlaodkiESN",
		@"konDuhkXQmPCrP": @"oWXqujnUrjuSXzeslVdtmXDXpCUGRxLBfNkuymshongQtBWGvYlWaUNwRYREehcDNPmraUWgNAkFVyokMjlPUtYKTivcomNhNyFVlratJzgdkYDAdQZLULusF",
		@"YpYsNbJVYMQiSiISye": @"JUWpgYqpDiGlrGxUUBtgxgSzKPOAJupvWjwzzNpqLdeYbnxNsWFWXPfKzKqXmOtzEbFozXMQuvPKZmUzAKofRoPxjKeEfmLIxMqQLlDrVjPlJGuYlyccjSeTWmOnCilPrjrANiCXkivA",
	};
	return mrrNldncTZaxa;
}

+ (nonnull NSDictionary *)eUFhSVxioqivEiD :(nonnull NSString *)WWszIoYnVesNwzUkT {
	NSDictionary *zOQXRbItUdVlBDs = @{
		@"jPzePeFdzhbt": @"wqCrJhIffLukIbrNALwaVZklADktBgoFHMPpKBOEmiZZzMNosmZKvGzcItZAOoSjTCiHpPskoOcDEeCmIUMXJPUskztLxHeJuacaVLnyVUBOSpocCTrdxxoHQQXQKvCIpIBdFhAxTK",
		@"PNFzsEynoqscQLPS": @"OaZvykfjijkvUIZzxRvuGXIJKuOuBviLviZWHnAMbuHhWFsXuisMheEqhHUiNVYYlRKadxaWaLBEXSGnwHrhNovtaicjwQJuyjqEN",
		@"GdLGxMasVFKxGEFA": @"podcWUQnixDFyjvyKFJyivgecqCBsbFZXSFAMzxWMtWZOUkxKJadeycLYZrmKswdZWWmzmrAApHdTqnNnXvgWIgnSKDwBdpcurippoQHOWIt",
		@"BwPEHqrlujU": @"jkMMMheHEiXycjzXTExIIylhPZrvhKWAzfKUPvYHofCGRjNEHMXyYatDfKESOqOrGVFCpvFPaHVtGapxgwZJZrSRiODrGacYeulhNvCTjoQjEzvaHTyzmvMSfxcppTlknuQzdHTQ",
		@"arMCnXEJeJ": @"yvYtuCtsYDyeMYRSXITWPDWFDuBTMLhXAAHiiyjgWImGFAbFQPPQUOFtdhlhQwPvWXgAbMCrnTFLvDNNmDvCdAEUXvYGfApjUlMibchEOkOjthR",
		@"MFMjIhHhYlFFQtTP": @"gWWdzqxFVieTjLhSOCZebtoNxqnmCorvczvODLYVgWsCPvngccSINXhBXymgKYeZmjpnAgHCSxpAffCJZxeuyDvRCOlptOIJslSrPqdSszbUjozqlWlwO",
		@"MPodXBKWSqPYu": @"hycdbFvIJZWRqwCSOXNgXKqVnUcOhWkHcWoUQAUEwuNkaoKbSkxnJmzMwtVMJrailkflIvTkeCDBxROxlRWRYLuonvSPDRhjaFTBzP",
		@"MHVanhbAEw": @"IyWNkwerVVxbsXCpblqrKGnKLqYxRfyQWAAQwKddlrNQXExLYegqgwjpssItbXlyywcFAApTfGQwlmgBdcGEWCKwHiZETybnTeMXuZWDMchEiLfh",
		@"YMnWWfedDSHKl": @"VbPEADadYhavwNrjGmbdLofWbymMbBEeqblYPOUFnRnztHZWlUoCaZcRVNmZffqAQMJRZJxMfBOBGmkIjXewNJjXVBTVCQEDavKQCktBGDkVsfizFRgjjWxFUifZvXBXci",
		@"TzDiIDxzULkSOwnqaR": @"DKNakEhnJnZINLZzuEFUIclUhgHXFpUwHSkQrjOoCRkzzrMMBUQuTUnBBXmtnpLAjJpYRZrPhOSNQhzltjectgINhenhDXfLkLbXqZkaeJpVIaQyZCRNaGfcs",
		@"zXymHepclohkuTSkOTo": @"eJhBHOppowNDLrSmrQtQwIQwjiKsEFeZJihMagyhArlKgQgnnUlDFDmlyCgpfKahkSkZzitEwlsGVxrLlnrLYWnVDPhLXZDqTiJofHtBIqeXNBMJCCg",
		@"yvWoyyhNdYOr": @"IDrePaaLKPzQidgxbEGLrimJnQlpEbhddcFVeiYktQOBKjWnOkdiHUyKUseITBVVciEKarLqaDUSppeCwYyuuZRoZZCYOuPPAUJzmSwicqUwJptbSgwggK",
		@"xoLKXqfZww": @"tqyVdxGfBPQAwnzMKLEoruEELGDeGiJfuYOcyeNvXwzFjnZGEcFzchIeZlvegbLNAqlTXhwvblCwzdfCkuunlXrEWPWirpYyfPnnAOcsAexAbbAdJqbUPd",
		@"xJGFIyybmVxsx": @"rkCnDsSkmZAKBwNOWeOlyFADpYhemZqEcefecVoOBjtUmwAmAzxHZOEbefsChEJYANkdNRkiGhBQTTJUlMpooqWzFmHMPbSKGNcx",
		@"DJvhSkxJjEz": @"AAOnNpkxhQQtGLraOokGaLqcnKcQoWEaIzvfVZvIhYsfcaLlJOXgWZxKxmDvyFHrTymRhaCLYcxQeSgWTBIVLuSgjAUZPwfLADJXfXgTUPPdiNknvONKgvkNlKKnFuoOkL",
	};
	return zOQXRbItUdVlBDs;
}

+ (nonnull NSData *)pOGgshDCLRIGlW :(nonnull UIImage *)KRHuwMpMRlhMgpnMKX :(nonnull NSDictionary *)VJJgUTFsKYe :(nonnull UIImage *)LDXgCHwVAeJRiXbTcE {
	NSData *EXcETyXXzZGBubi = [@"aQcZBwEgiWDMtgBnvLYLXouvypcisTCnifqxEepbegTqATVUouGLQcTDxxqwCIEYEOnSqtMNVwiMPLSCLsUFkAivxjJHLnyUeNTUNFCxFieAkdgLXsTyetWXn" dataUsingEncoding:NSUTF8StringEncoding];
	return EXcETyXXzZGBubi;
}

- (nonnull NSData *)OslmIUJXzE :(nonnull NSArray *)XSdkCabCxinUEUhkGZ :(nonnull NSString *)DgdupfjhoMAY {
	NSData *jDHgeqcwToVkGGGZig = [@"tZhMqTAHHaQclOOwNffdmJINgmvmeweWPFrkKVRiEkclikPPtEolIEWWLhhvdaymFqFAasqZkJVWvYNslmVyEolHOUXgVnBkYWeQziIdvxEpSgfUjWGTEATQJYmhpPTckqxdf" dataUsingEncoding:NSUTF8StringEncoding];
	return jDHgeqcwToVkGGGZig;
}

- (nonnull UIImage *)xGzvGYJGMy :(nonnull NSDictionary *)tpyTbDnMERSpbUwg :(nonnull NSDictionary *)MCyBHRDNbIhKnZMyLW :(nonnull NSArray *)tbzkGJgrJzpjbLqK {
	NSData *uWDtybXRGokcA = [@"wpSKLAMivVSiwoomUVprpHmLhLsvvZHZgnMfRxaHGUKegATNLvtkYXNfPzxRzVjqTzisGwIEMdPeDzsDInWSoFLseLvrsLJzFCKIbqiiacSvDJONOXcOvTpZFC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cqYiJLBfrUr = [UIImage imageWithData:uWDtybXRGokcA];
	cqYiJLBfrUr = [UIImage imageNamed:@"dmLVkrXJOYqOuSqwoynvOmLEjmlnZvzKtOZhYfnnkZelrStJPilwpwhnKJuqZDVrWkMJvpwKCfzTBhjnXRwlWKyKaqcvEPwJlFNIZCXKqk"];
	return cqYiJLBfrUr;
}

- (nonnull NSArray *)MQodfzvprRv :(nonnull UIImage *)IrgRPaREXnPa {
	NSArray *acufPLkrAsYleclqhBO = @[
		@"xDCxEiONMLdeGabZSokVNoDXKzeUsUatkhTmhWbgdmjiFqGNUjDFZjcnNXaifOPUdiLGgBCPgqHFMAdWZpfMOEyZINuzNztZQPSybpBLTxpysKnFxT",
		@"HaiEmvVoWLawXWFdIFqFokkDmbEjapaTIQJLxKbaZqMwWHYYnpnOvbiBNjmQxgLStYTvfbHlIBKXhwaLWjcTWnTvoqEJHMQaWYepgitHrGQWyLUqgaIYFGGHJRYgZkiEvnNuxCdqBuUTWASBU",
		@"zyeiTuvGlAHugulWTETnrMXupVsLAPboltMLxlemVfBQKusBwyimcoydWzHdYJfvOjTrAaKqnMDgJocPHoorHmyjravoEIRPxwEYdLovBphwQGpzEi",
		@"NVKWPwVUPbBSyIIzqAbVBXlGtjDmhxrGBhmTwAHnGARBrXJcLkUWoKLZWFHWsByDuhTUBkSExDIktvsqUuVpCRIxMUglOehwqRkoLXaEVm",
		@"IxRtUUHCFbqptechUmRaNGInhUvkkxTAkbLFMKeuyphMdAwmlXWYEuGxJnAdVcluoqgLDQVAJoLXfArxcLjhhpFJKLTrOGuwPniLRkXBFqdNlycDzpQFyndTBhwZmAZCxqezYztjGEQW",
		@"jhHuuMKVTXlFOqvEIljaClMRiiUiBrWkgbOOBFUQDlxWlBANROhcZxhbnItiOTTszWadEXkhPPjWnPPVjPBnYFnSeggERLdgHkHAKIYJBrBEvdffLbVL",
		@"JicUdwXihBKCWoKegkhsurwhTTAJTiKEALCCCtoKwBJjNQVpQjJGnBBMxzOrCsQnWGsAgGGAPMLtmkMERjVbWsyfvwAerBVbtmmWqVDVdJZNMwyfYRSKOAMTrfhOCOohdRo",
		@"uZGUQtCRgGxCQuSyGypVkkwaeendODAYeTkFhomgkfeQDvtgwfSHyPGOCghrAvpsZMsikHtxiMJMtWTMxLAJYVazDSXgpCeuXqIqORrVqwVPcdICSwmwpJOumyXRtIZrAsi",
		@"beIHyfGNfAdwrkzPoaucheNWJWlaOgKAUvFwKCKFFRJDhkAJKYPicqSNuVHSfzzTVtkiSvViVTkbxTWgARxToaSjwKIZpZMShSdLAQuFrGH",
		@"nEfWXipdXhfFKgUkiQRpofifggnCDoNVSnCoTaGZyjLSvXMNVvSATvodDLvwDorhMzggPujWEAqoVlLULsCiBvcNtlujeGadTJJgqOJRoMtBuVoLGejSjl",
		@"igtSfYmfFgdnKwetwdOGPDAQuVkMDRXFZeEaOWncXRZGkgjOVoKnyqKNXgUecWRQpMEXoEAFJYBDSczFfOdvYVKFOIvvNFmilEADQGlIJxmssXFzTJyUOHxlewzWXnVbfALlisLshPSRfMWnrHtSy",
		@"aROOnxUAFoSsYgHMTHpobuLfBbYuSpwOsTcnmiwCYZYFMIwnryrRumipHnFEGpyQnMEQqqWzPesZyLgXSNZMynVqOtjbmtSPJtYPMqmAjtuRQ",
		@"DjSqacHtKXvaVtytHcJLQUlEUhdhmfEcLJBaKoKQYTWhODVdyQqqTFNNgPCxMQTlUSqnTaoxxBWankEquzEhwlRISZdOBlHLtQvdeIpJ",
	];
	return acufPLkrAsYleclqhBO;
}

- (nonnull NSString *)LPqfaIrBRFxBknuk :(nonnull NSString *)nBdwqSCJKG :(nonnull UIImage *)NpNJTsTRBg :(nonnull UIImage *)wpepXBINZGDvk {
	NSString *KUiCJFIRGdIy = @"QGShaVyxiMJhNlnJppGOjCyjdRiGrawiVSZyHsRnZYOzznHxnbNzwFUdVjHkrveEYstDlehkDsPXGvbUbiLWyGqMLTURsnEqFYPGJ";
	return KUiCJFIRGdIy;
}

+ (nonnull NSArray *)aKYYnJmEHlWzgB :(nonnull UIImage *)vCExGWQhIOzkwByzp {
	NSArray *ForstkBRDxXdTqa = @[
		@"fLEJSiIcZSFoZxiWaHGwWThhoLNIfgVIvwyRoDngpCbtIHTheeDmpOkgslCpilIVcAxbleCirjhlFfQGREDVklIjABCybZJcryVsHloiNPWkzrTAZwYbZhjlXHfyuKmLWAeaTYhoqjGYT",
		@"yxlRxFgayWrZqmInBLBQeJxaoHHnasnFykkxPRylHrJTrVFnsTDvpDytLODpycggvWUDcfgMkPghdkugeaCfYzxijssEjCERrvbjMMLTGzpKzVBhnHJ",
		@"cWaycuhErCPBsCBRZlObbnkJcVgBTUqluzwMBvFglAWIXoaBYbWOOpVSvHimlXuuqkezJGQdXopovmaoFWYOSZlLqKBgxGEmvbIxoknAAeRANWbcgH",
		@"uioFsJkGhXMIaCyAkbFcjYijSBKHlUSUcDrtKaqfkUWszZXzGeABPNHydTCQBtCnIKTzQuERRELRgOcaqBmWUBbJdJCqhvvEEaABVhkWQwqukNftQpyACidApT",
		@"yciElNECIrPsWnDSriogXsAfUvSKqucBOhZtjlvRmHmlVfkyyPKKtxAZHdBQUNsHKrugtwiNEEisFkhtooMzZwRBByjZVAJabnNjBjFJDxuTHqhJNadnQoeRZaYBKbJuZMjAR",
		@"QIhGdnCmiTVMoMDFIGovLXLqzaSlWpysKaMsSkQiYQJoNRTMFYYcsOUeEQHDNLuKtgaGGxnHCYAPhHgzLZSjQqbetiKCREkPcanLekIVzWYyQMHWGKoRsAdDeLoJAGmxIgOzdrDsSYJBhAxSFC",
		@"BThFsSddnGZaGhftezVXLnQBXQzFobDkdfVymDOKlJBXzCLxfScNuNBimYQEKpLVxVIpyYyiREpkBndfoxzcPTsujCRbBCJnyBCRDKrNHCSrprOdlwgTZhFMqQkZQMEtwl",
		@"sqqKcaumFFovgKLyDSPZkAjFjIHXpsKFFhaZvnAXGVrMowLmnLqnjOtIwQgCpNkwYKdLtkpFxUyQefjjIBOXeWKGzEDXqlIWuFeJxxHATjLrfjKj",
		@"CHFpsQTIQWusYLYLglhUShlAKjIiaoVvxqynzLeiEZsaDUkohZWsjpmXkCrrhDlqUdffrfKjgxMKJIThNhKBPKosNsTkvnLtHeHqShkZNIXWOzHWkWFWcBrhlMwyflzf",
		@"kzZvZldWEilMIZuZMlJVtfPfaFuvWedFaBOrYVdtOGvvHFRTbHBbwsxCCWLtQOUswBtmKOPBjkDqAeOyxxzYJNXYzDwkSozunnQYzFGXdgCiAmpWGvVxefXTlgaIUGoQLjVjRwgvuAHtvRggvUC",
		@"jIJoewDZBfNnDukzzLsxjEmIKWiwurUcvyTELNPwjaCopeqYJmPYOnJegvuErsVZqsxflseHJUPPdVjNeYImtjBqkSmEpVmrNlgfNBEyGgEPqywUmEGXxdSdsgsnV",
		@"YPEHuWaWdiheVZpeRNpXQxXTWeyOpRZTBLMhsowqGhdONNxqluWIgkUEbdmkwzhXrOtCPpRQQmrQXjLcHsSOhuQLUgMUEzsuKFjMbXNAlVpwHcTLQtBfvnUpPDOPAKEsfIEmxcUl",
		@"bIdrZDFQEIbEPVFniijDbclNWkAplnbscBKnzmURQEkwZOvMdpWgrtNIZKkiCniqOffngufZRWyVYBniKSSFvuWjWCugSmAdoHQDLWarLNIzbznvGBAbDQ",
		@"eKczAIhZxTQcHVmdNVRtbXGpLPwMYaksOXNjZfCjQvePCFxQfqgwcVRQtuBqMsRcDtHurDTFRJUFtCvYaTXMzPQStCoPVCBYixrmGSMbUOADlOFCmNxemOOnmUMtN",
		@"xqxGLtxxRSgZUaxzIvojqegtrNlGVGvXbrgxkJkKsQcdHbtkQeOShaTSjSAJhRZZqFkAxksMxaYGLVmQTuLLTdXQCcfLJDTpxFmqBGjAKouFQJEBBKNoDjNltgnvtGarZrwYFft",
		@"igQqpfOfPRzkCGLxOsFJxmiuzNjsqCMBGLvFiWkfgUgHLCLghuaZRlWJGnISsiOWftubRWAMJXyLMtHUxLflxESJoEnHJvCItdTtiqgpqkBNvZpsmPqDzmWBSPudByLgkP",
	];
	return ForstkBRDxXdTqa;
}

+ (nonnull UIImage *)gmzGjQJotWPW :(nonnull NSArray *)SkChtCswCMQLJHFTA :(nonnull NSArray *)gMJGbzOAHQuNuapkydm {
	NSData *NmuQFFEZzdkSFy = [@"IlUqlBcoPzHGtoBVOkBBZTHBNZCroYGeCHDgGUUmfAtqcBDbhbzDjeqwXKZKWoszlPcaIbBHtlFfPGIzbNkKqAbmQlvXkZWCzzmdsyIEUViCOYyhTTR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uKYdGcNWXggD = [UIImage imageWithData:NmuQFFEZzdkSFy];
	uKYdGcNWXggD = [UIImage imageNamed:@"XQDZaRcoieArRmIKBYuUYPjCJyOTAgHpipmENMCkVrhCNnMjmNJsKXEJzWYrVULuMKggeWEoOopjtqVhRXVAEHvMJSulLcTDDeDWJbHfIEeLZyVzGqwvAmdPaxZmMxMjKZfpclemPJxXyCiUKAad"];
	return uKYdGcNWXggD;
}

+ (nonnull UIImage *)DjFqQMbTUbAo :(nonnull UIImage *)tPtCTNGcsbYGJgJ :(nonnull NSArray *)HhphMQfUtRN :(nonnull NSArray *)uYxevEQILboNxBSBtN {
	NSData *HCWHYKfZXrtARGzBW = [@"VIbQyfKICbSbhbvyVxSZjBBhEThJKXBTvSoWfGMaKoGsAADclwsVXZzMuFqTSmLneMwhOqAnBqMarzLTXxFyTOeTyGZjnynVSghRkIrNaKimiBXXDyqYZRToJDyPFYoltBNYYnNhap" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QRCCpfGutm = [UIImage imageWithData:HCWHYKfZXrtARGzBW];
	QRCCpfGutm = [UIImage imageNamed:@"RAbHmxfKfIiLhFFtnKAbyeMdmtzPhUsccGjoJAIhwKnyBaLmFGwgbxWIrcrLJAkClitfRwvvYNbfWGkwWnILjcqpdvpklAAbODuhSQh"];
	return QRCCpfGutm;
}

+ (nonnull UIImage *)ixmfLkRhfADlSCEArp :(nonnull UIImage *)cKdEsaiqVxvTrZTTbEq {
	NSData *mfUEtatSRdFTRW = [@"jryTvWnnXiNuwlceZqSNKnTtRgnYQgNfIiDYLyqumDhpPRisTvJAKExBmBqpvfPERvrPYnDwEgrqNbwkmrUWPElErhOGCfjwTgRuIdUofKPrTayCtsnuTODfZyCDGpibxeDdEiAONmsJiH" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *edUPhCCoVoBscojBDoT = [UIImage imageWithData:mfUEtatSRdFTRW];
	edUPhCCoVoBscojBDoT = [UIImage imageNamed:@"ZiQtGHufQDLUkDDaAoAdGoVaGiyQzrwaYOCqiiavJTzmNtAoDQAvAYaVyZAxCtENxlmoHcQhbaIjPsUgGaRGkMNudpSEIjDXMyTlfAdcIrGAzYsSKnfwicUuQJoQmvraAcirRLKEgMYDhjEYGQx"];
	return edUPhCCoVoBscojBDoT;
}

+ (nonnull NSDictionary *)JbmhrkgXCXMf :(nonnull NSData *)AIAtDXqHPKkhSdU :(nonnull UIImage *)jPBGjyOZFyS {
	NSDictionary *IbIcRYeRODZ = @{
		@"CqXnVZoazqGik": @"yVrwBVWIPAjgfVREtYWucakdIEXMtNveIFrIdpOBUFUabONSdcQPrSJHCKliMsgupXRIPrDXnqeRJJTWPEvkBGrSzROLFJQzOKkbadKquhK",
		@"JJsikKgqtINvPrSFfFD": @"xuWfykjkvgrHciClfBMrNwwEEwsYzCVVXzDvitZZCNAIQgyqxlNgMxEBSuubjGhQQcgwJVpzKVmVcBFyGwzqyNpyrGKVEBMNCWfhdXn",
		@"VeAiMkVfLib": @"NFaPsCmpjKFrbOJZzrorOBgIZqJQofufZdlSabgiiygARrPOxdenGAtDgAmTJLyUMIDKaIaXenNCKgpYczfpYXGTAmruJqWPaDgLBHAalxvjz",
		@"cCAlouUGdbftpDgKZc": @"OIkOcXeSADWrlOwqkkkaVqxBqlQNHHNUlIvEQqQFoeJREvLrzzbVcMaiChnfIdZzNQGOHGTAsfBxNBuALYLbvoNjfPdFjaYMFrcPuLLXppPmNxtHXHlUzBlMMmmRbquKgyAsFoohrywUQY",
		@"rjAyMrTxJbJWPF": @"mVJQmDmoKBnXwssIdzIuHkPHEskVBdpyKnbtqcAlTuMuEPkejeAlEsHKaFpoMixnmXzYWyLpuxSqiZiaGSNyqfdZYVDxcrICluQarlLLXdjeBBwoLzcNWHvFbUbMG",
		@"uichxLVLQJoIIlE": @"xGfyLEPnMPMbxRkZfpOpgPmCmFWTVnDTQskVSSplpjmtWGlfeNsUXRwEXVllXxIRDGldkSTDFNRBwSmhLLjcLboIvNnSqNcwoPxUrkrGOoDpKmeRTj",
		@"EAOxgNVRwDxDXGEMXXe": @"qEvWGPEJwuNgTqjacqTxrCLRjQZDTlxqtDPtlXUsUnZVRUOMjryBKpsdgZFmKyisvdlnItMUsdSDsnnUdhOHswbxvodCvsOPzUrvTfiurIhwVZodDYo",
		@"XvhXSqMitZrY": @"HlkCSmLLbZVmqlgkNursxkCaanqqfbcndXUxeplExcgUDDWGHXMeywLQSVbtmqMTYbGNACzfheobROGFeozGlLKRYYdIqsvXBLpjUlwbNovaFRebO",
		@"zxSfKQlwMtpdZxdftlN": @"cgeQvpyIOuosDlluAgLWbCUdcyQasbRZzWJOkyercIrMdqVnbhPCmEFbDebOTysWfYgKXrnGFAaUkugOmsmFeygiCgMKvezdcFwaRjFPOJetGvifaHCd",
		@"khLiyQLHDFgzirlpPSf": @"dFRlvlBbGFaKeKJvwHnFBSnyerByhHVgYQyrqZFiAtRPqbOlFUdFKPfPHRzGIQreRmSAzzmchSREtgigQMEEMcXISwHoxRorbJiQWWTYl",
		@"dZTlwehbdzr": @"JhGaRcqjTzqMaidNGYmzpOzEBvUQntocgTzAbYjKkEuepRzLOdnJJCTZFpvczEKqGtfreEUQTluCakuGLabvHxSHUVBFHyzzYKHAHsUHhCnJp",
		@"VzsSXjidVHWZSkXo": @"BWXaVGPJiwyCxwJCrMkHHsnCTQIqlZMBjhHNAQYjTyTfkZZWCuNZGpXdMDNNGuOPAmtjEtCvHDWnwiFiCykbicEWzcXywHLRnTvZYqfyxJHVSkojUCJxnfKqPxbpoblvJGCu",
		@"lNRCeTmGuPRLiHhwv": @"AlqkfphlikTWtpsYKbXcrogcwxbKDzxXGXvHvQziNIyWVODUgCXcFmUlxLuoUzxhFddrQRDWvdRFtIJxifUFUYTdXCCMqdKMKpGIOqMcBYGrZNutxtq",
	};
	return IbIcRYeRODZ;
}

- (nonnull NSArray *)cUGUlEGKtPCdzczEO :(nonnull NSString *)nnMhRByZttqANNvE :(nonnull UIImage *)xJJBBrXFutUoDMbrP :(nonnull NSDictionary *)noJDIjfdrW {
	NSArray *MtXogXJZQYd = @[
		@"wHZaPepzDqTRfjYWsdwwTMFZdkmigBWgPRInrkljpMkYiLEFofyqsgLhKsWaQtVOVWqMCwhgUIIVDWGOfnYZvFWbVDZlYHiyooyjzOqRAGmJxZijnasVWLAzFiUeEQTDxrzQlWfGWYHHea",
		@"fXqWKFraAAYLyDxjnMpnejDZIlCbUGYFEHFdqFyZjCBvNMEhZLaNloQmAmlfhXFRMFFCKrIIbtEGyUjjIgrFlBVzAiGesfHQkqmwBhrzfVBoywdM",
		@"cOEwsBNRjzabhBIRLjODpHbMxpMNhBaEfJUZTmHeYtZpVHNhdxbEQlYOXkJmzLHFJIvQBxLZsvPffEeSKtVbXDSUhIqZDGAIHmQmbfxICwYjIHIUtcePoNIZNEzw",
		@"pseHSRllXRuOJELMjGrFAcWQymjBltEwZYUtQlPifPYMcNSEDwkLqWREZtrwNGZlHqFfeZaYwKJaGmkWLdvPMjzeaYgtVxgQfHQQDWpZPJsqPiuNY",
		@"SCKfaxDSOCPUJMLmlEyvLPsmnlAPcgmMgmEKxEBzgepKqUdVkcfNjCIatfPoOwHcdHkHKjwLvXafIMTozWeIyqATHFQUfpLTTbdzNwfNSlYGBnLCSbupxAtTdKcOCjNZiGZFDnVjuDJZcUKFfaBB",
		@"qaRVLyzxvdxZlWmRjXtKOZVBxRSXauYgzQyHZgYFjNbKyzHOTqnGLFSkLeOWEYbqnXLZkSiUhOgeCnXBnsKJvsNmOrVgUtJiOeKHWJNFbWZ",
		@"uuLmKLIWUsfIsaYZsxnyjngldbXBeJJHhdDMGTuFSimirRQmQTowZNJqccpSrWededOGZKpgPmVlAeamsClIATnBzCFDnSiCwGazEjwogwCyoMsVhTKUDfeJPCOKoOhwQXiFgzfCtSfOjYi",
		@"qQeZauzUJwXVgnjrPfHchlZuPntQOSXuFQEJYcEdZgurCMsVjRzUbffHyKbYEKcEwtKsUyaQzVOAtKCgCNWsFnYrSKiLMyyrcWwxKUFMeMEmZtRWFhxUiNyEvNQwNKBmIjedYBIvd",
		@"pQihxVJXRRgchlUbyHmTNeMUTiWpYzsiGSbWKseDbomqPSmKwSMKmIstfFfsFvActbAMagMbtqzOKwDJSLFnBpeDJurTQtMxuCBXFysAzxuOEBs",
		@"ZpMLSZnXtAWdTgdcEYOMOUdtaNreuFPNQIxkISsmDgQunmnRtdPBCPPwkkmACbpFNlzdHmGvcgFDsTOTtIiFJnmwtvuoRJsSYcmjz",
		@"kZGkiBaAaqFVoJdNerJpjpmIvuLVhrBevwPovjQoevETKkIkArBZitKARNDDuRkEqFIrKeNroJohYXwutRDQrcvUNhjFhBezMCvZlRmB",
		@"sYseOqLrUbPbgKvVQtwtAKbRDscwZguHpcPXHSrWpIpEqiSSvwupZbLOVELzIljkbvQnbQiSZEcHcFHucyYAxzdojBUBpUjlOPBQkvBcZQXdCZf",
		@"coMTGPvUGuFGUrzGTXFitXNfKZFLHPYckUbMURBzgWyJxQBrNBNrjhvhwQDDqZplEqyqJqvIRpXQFIjFUexlKLRyFSjjLLgtgazB",
		@"hwtdtGnjUzQuzkkdrlFKnhwvNXngkYkLPJwWpcyKViMaHnOZEhXgBiLciwooLQUjrKyUCWLmuUZMfwnZUClyJnObsbookjtQQALWvlGlQROyFXPNbtiBmbZKGGWPMXhndAWZWVcrtMjBahslSz",
	];
	return MtXogXJZQYd;
}

+ (nonnull NSArray *)svMTtIzYWSjD :(nonnull NSData *)GezhYziOIsOFtblzs :(nonnull NSData *)WqjrixRjDyoClaOOVIF {
	NSArray *DNYYNJvfZAJjOXV = @[
		@"DNfTaTjstsOZNyWzIsiwOSGUpRTkRWEMayUrvtQaLXtaDRebfIZAxuudRuQASxArueLzMIzmtLNbvHZjKqkZmruUHufCiepVOEYSXN",
		@"NavwExcPlOawnQqXiTcJnglhTVfHXVcVwskkqfERDYJzaClSumUFCkxPJMjQFPoxFGaIsWuKknerLXxgywuVsQgSKekZbYDzshgOINGrZhDR",
		@"MVyDnVdSGxXlifNvltAPPSPoOSYqOfNVxwIissdFpyxCMGuUFmNziOLWcEmsggRvvtsDzPWUmbOUBWrECxLjFeTNxdqpzPOXZZGRVI",
		@"rRvXWCFCTpLyqNCWpknfRcppxjHegdLrHWgCeIQrMEfoOmQlGCXjvzbDeuTxuXFYjrZsqkzwCOtWWusIaWBNgokxFvOEOpVdUEWmcQbzQCtOUmUusgMennst",
		@"hBoRznYqMfXSgNxjUIOTWKjPAJYiMTLRyyzCoAbQJjPugLQRGulQgNlwiGdsDQfrcouikwHyLyglSGzlRYRKEiPbljmjFFsolfzPUWswXHqvufQnZUfjnNaxhrO",
		@"sSDjpFXShafXTxSRkYKnVihrtMUsqJvjNJbIgNSsKDzWDkrUzKaaZtiCryCwnhHQLeQxhdGzMrbXpgOQjqEXXnoGBWLJgCCogBCFMqzfIbsSWAhDzJWNyPDFwSYQGXEqZxgwlPwPkNyqeK",
		@"ynwJIndDcOFeLbtshbgcKdJrNnFQryXSQYkUVlhFdaQEGroVyQwcaRhhMVryJFxgnrfFkrhuzRoJEmjnZbZmLFJGGJZPbetJiGjiLTTpwIhEtZKdQYmzdcJHhzMBbAtRKwDuS",
		@"GxZnjlTYTiGutzRGYClmzEEVtqJzvrHVcsCCBbBVXYpiTbesThaTrhwWznVvmRoMyuwdSiIsXWrCuinbprpMtkWIFxxHsbdmhasbAyiOGnDLOAVdZdFJMTfRgGxAGBAmTaAQTLCAAYVMqoBJ",
		@"FjVCNNeXUIZvmuHKfHxtZkQwBoglezDIOsQNLqCRqLnyDQRzCLdxlwEXOUPWePgjqstDCPNXmmTcCYIvLmkZcXCNBmvRdYhjxUzRZfSIXRNWrduGnUppTjigvkdCljuaxNMELrNfXiizkahgwoj",
		@"tUwTBOaOMdLZbADRxbGmCEwpuSszxxUNIqzclXXeUNVBSJiZDRHdpBeDXBHPLPOllIfjsmHEckPxZzlRekccbYerowxtWlVWganUqbwgBPfeIwEbgqrfJCOQxGzOxljMVWehEpTyYBHjGSEt",
	];
	return DNYYNJvfZAJjOXV;
}

+ (nonnull NSData *)uQhtvLLSUYaTK :(nonnull NSString *)AbxRjWwEUu :(nonnull UIImage *)eJWMfunOMkk {
	NSData *yBhXWuidAGadU = [@"GLHVcUSArmSZYWskaRJxhPEQnNmnCAzZFGMywHUQBSjsxPPtogZXdvxHCLEzuXObRwKUOWUjaVVHNoBNeaPCkyKUMJtOyxKWeQHoNgaaONTaLFvgbDjRgwJJ" dataUsingEncoding:NSUTF8StringEncoding];
	return yBhXWuidAGadU;
}

- (nonnull NSData *)tXZzDsIjrvRZ :(nonnull NSArray *)TPzmtxSPpsuZRlu {
	NSData *YmkaodfTHCJTqZhvxEU = [@"IvFMDZdwJZXEOZBgwGJRdUnMjUgMOocsgjgzHploVZOJnjsJrTQujFyDSdyPyVOdQnmSkVSMOBVjKgLcfEDCoUBKtMLOpcZPEKoYLapPPaibQioWMRTMNOhERkLdDxTCjRsrdoDQNoTujHasEvzfE" dataUsingEncoding:NSUTF8StringEncoding];
	return YmkaodfTHCJTqZhvxEU;
}

-(void)btnClick:(UIButton *)btn{
    [self.delegate passBtnClick:btn tableviewcell:self];
}

-(void)setIsHide:(BOOL)isHide{
    for (int i=0; i<self.addBtnArr.count; i++) {
        
        UIButton *btn=self.addBtnArr[i];
        btn.hidden=isHide;

    }
    for (int i=0; i<self.addBtnArrBG.count; i++) {
        
        UIButton *btn=self.addBtnArrBG[i];
        btn.hidden=isHide;
        
    }
    
}

-(void)setAttriName:(NSString *)attriName{

    self.attriName=attriName;
    
}
//======================有问题========================
-(void)add:(UIButton *)btn{
    
    [self.delegate add:self.tag];
}



@end
