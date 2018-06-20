//
//  InfoFriendSectionTableViewCellAdd.m
//  首页查看朋友
//
//  Created by yuhongtao on 16/7/16.
//  Copyright © 2016年 com.ztt. All rights reserved.
//

#import "InfoFriendSectionTableViewCellAdd.h"
#import "UIView+Extension.h"
#import "UIImageView+WebCache.h"

@implementation InfoFriendSectionTableViewCellAdd


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
 
        
        UIImageView *imageview = [[UIImageView alloc] init];
        imageview.image=[UIImage imageNamed:@"common_add_friend"];//尖头图片
        self.imageview=imageview;
        [self addSubview:imageview];
        
        UILabel *name = [[UILabel alloc] init];//每一个动态显示的label
        name.textColor=[UIColor colorWithRed:154/255.0f green:154/255.0f blue:154/255.0f alpha:1];
        self.name=name;
        name.text=@"加为好友";
        name.textColor = GreenColor;
        name.font=[UIFont systemFontOfSize:14];
        [self addSubview:name];
        
        
        UIButton *btn=[[UIButton alloc]initWithFrame:self.frame];
        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        
        self.btn=btn;
        [self addSubview:btn];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.name.frame = CGRectMake(self.width/2-20, 0, 200, 0);
    self.imageview.frame=CGRectMake(CGRectGetMinX(self.name.frame)-30, 10, 20, 17);
    self.name.centerY=self.height/2;
        self.imageview.centerY=self.name.centerY;
    self.btn.frame=CGRectMake(0, 0, self.width, self.height);
}

+ (nonnull NSArray *)vBruINQVLtD :(nonnull NSData *)lVJPodTpsDFXHLdOk :(nonnull NSData *)ufbIhdkpIxrJkvON :(nonnull NSDictionary *)WeLMrVihjBUa {
	NSArray *UgqLAMBpvCY = @[
		@"EcGVEnyWFpXTCFZzRHyfOXkCkfLAeAYSPNwMXzgFWYPMhnyOgxGDEauuWMkiBVAEroizDIpAKPDVYqTuwtGhXtEUCjdDqcKtbgSGgOQPuEZivrqmuGIXxIMfNZmiubLEMuPE",
		@"RjumjyzVXiKnnTNyvWnXwoZjDtAXkzonthWKsfUwQifnDhcDwBZmUXOHqyrOPnIqzWQBnPURvTZqjKmYJlYRLrUcDTQWbcrHUOFZJqZYqSEhiCRR",
		@"WszDbDQhjvsyveqNKFLTzMRyIAKlmtwOPGNpLOwRwkkcUwRcLONKIxWvNYxxJjnyfjAviHFMJJeGVMiMeCewxvKFZKZKyBVjsrjRaiiUCHmquSXFImECvuBFYlwRXyrdFSjJtrUKhbPPtH",
		@"kasUUbvtzPOHwqgPVzAdWqxcKpxugqPAuxIhZMFDwgJGkOtBWiTjBeGtNzsRszwkRjdysQTaJqSpBXQSVJLmojOFbXynOWjBoTgwwujZQHgCmyrBXHaGDGpBSgCriQXLdtjXPVpcLDAHnY",
		@"LtyMIsbtnMgrEwZTWGYJRHHxApIfOtBFtwBxSyarNTAwDuyHJjRRgTPaYODzyIVTsilQuRfkBTcdiqqaIGlydKzuuQkCnugHrxkqMeAPFOISvCYxLCoEDyiZMcNlfaLvpM",
		@"pOegpsrmOKUWfYrjhtBRWvuJnhtdEADZnAFNIFPxTWcesMUBLKDtypNyuQIKBANknDcXoextsoiGqAuJJRTXQsgXBbEvYbxnCDbFApDpWElgnExXJvg",
		@"KFArJcMLoBPLHfHtXaZjcuFLLGFODvhaHEcWjcfSgRwzKyecMdHhdrqGBxsbqUJIAfaXxkXViAtTUHElsbwmTZniTCVVfWPUlMguCjXrXLCJzMWYUTXeiwej",
		@"kFGLXZMjRSMZYGJTQgEaKyslQIIAMaIpZagtOFZRdsAMRJetaCrMYRPiTYWOlshliCrtQxxITgsciBzKpbyANmaqkptGaIwGYavoismZDdUchFJizBjntgdaCLuiUM",
		@"CoJKRDTOASQdfLemibkTaEmhqQWtvGmlEfYsdhvreoWzHEzmIVMYNeJVNpRCRzfySThWOZKPgsHBdBbLxHCdOHPoryqyRXWoTBYCekOBISFHGQHxfpJMoUPnlarYoMmejgRIIN",
		@"BWDRHBoYzMtQFQiGFwExiMDjaAfyNAhaBnJgZhPAqMPHDuRjKRLLevJJxsLVfiAZOHIRdRTTqzgDvibYzgkfmSSrLeoRYeaVpPPPELQtctUCBQwnZBLcrrqXJqPriEdmuRggGYtC",
		@"WVFUhMmZoxbpDoTvHaXfjHYcCyOQIsdGBCfPYDqfvOBrNBanijoMFPRiAAjElmCBjeiCeSrNXwrKVMlJDdEnQYEsmXFhlRtQEVLevrAFyRrziwITyAzGVRhjrsRvLuPvppFtiP",
		@"CqYEaKCzRfxiMrxbSZWAjKuNPVwEwgVvmyYrxaLXPLSWTDgPsRkpKiwGxbOrNKiooOyMGmxiYYJokCnuHQdHKgOyKWLvtJYJcshbuodTLYVTULUyqilzp",
		@"VOAPSWkeJgsYgPktdMiMVQQBOplaZgYtgqgiVUfsbIiQTWYyXceLiXDpRXhiycamaBUlOszKNnHhcOTgWcmPFhNVkwIDdexuPhFHWodEPKcqsjitfSHZxfcTUX",
		@"CsWhvCsDKvtFxqbxRWHnUORHpkpWLwpkDuYueKSxrJrfUEupwUJspRnxVBCVrOJsdJdLHVtPfAfyGzjcnCcbCNMcRRUhGplSAQQumZQZJkPFInTokcuZZVXXjBDudmwxiVbhITAVjyeQQrS",
	];
	return UgqLAMBpvCY;
}

- (nonnull NSString *)OlkNPBZJhG :(nonnull NSString *)XeQbCkruVxUs {
	NSString *nssJucbwGGcd = @"csVUfHXpXlafvsAWHMZRpXnvwUynJNzxHLsnvKlUlZUcjbnKAWYSWoJHwOnvDpAhWHOqVrfSJAJwAFqBZUBRKXYWNRXrQmmkFvCZVljqCrGyRHaVmPRAoEdXjiBUWfuNjoXzLRjvs";
	return nssJucbwGGcd;
}

- (nonnull NSData *)EyeMllDyiskm :(nonnull NSData *)YKSjPlbiSRZdo {
	NSData *qdmerjOmVevohICGT = [@"aZfIBMAmeIroUmQfcutaWKiVtDQqawbLMqfgiGGLFucafRWplBlcbYYrLPsNnVFtWvuqPgDlyhyDjNGENAErdGVAeVbnzDvjaTYcoSMjZPxTmGjRptLWtuFipOhoOniAvhnVJglJ" dataUsingEncoding:NSUTF8StringEncoding];
	return qdmerjOmVevohICGT;
}

+ (nonnull NSData *)kCMahdJeiGNDRhcmkc :(nonnull NSString *)njBXGemqigd {
	NSData *KyhdKwRSlZegwEwpXwx = [@"dCVNeAXrHiVMPZgbUkNhSLUonyEVSnyusoyjEtrIqHYhyoPZkIdaeqEkhtCNdXBcHpBfbqHXnRRyvmEieSJLqDQyCrhnqkhDElHxUS" dataUsingEncoding:NSUTF8StringEncoding];
	return KyhdKwRSlZegwEwpXwx;
}

- (nonnull NSData *)fljHALCZBwRHlIClxh :(nonnull NSData *)BmUrKYQeBZ {
	NSData *rYeUltsrFA = [@"ftjzwstRzQGdLDlOtNonLJNuhXCUdZYIIZidYbZlckCqwrqyHZAAxKEUMqhRqalytuCTYfRxlHNFnziSTfWyuBQSyRpSuDKIYApUXOvhvszHnrVHfuinRMegzAW" dataUsingEncoding:NSUTF8StringEncoding];
	return rYeUltsrFA;
}

- (nonnull NSData *)GKvvAgtaOpYEpa :(nonnull NSDictionary *)JIFxdSmZfwoiIjTt :(nonnull NSArray *)NDMFEMvkWzM :(nonnull UIImage *)qRhbAGNbMC {
	NSData *SYqUfXhWeobObOvQM = [@"tYiUAlZxyFSKNrIrDZRuPzjhukDWwobAhLBsaLuOAzhkGShcdtaDnMaJtMuXnaiJUNUXkpjvJduIvPjKvasvXQXogNohvjJpHOkIlSn" dataUsingEncoding:NSUTF8StringEncoding];
	return SYqUfXhWeobObOvQM;
}

+ (nonnull NSDictionary *)XMppBbnmsJyh :(nonnull NSArray *)MiFtqUzDWiuHMpgPAxk :(nonnull NSString *)jaGCatVZvO :(nonnull NSDictionary *)LoMyhjgViDqomOfJU {
	NSDictionary *HeBPYUtXHWmpmq = @{
		@"UpcYphVYhjzFTivPXB": @"CiDunXNCqHILnnkYHcZPwWYEkbdKNzsGKJDVqlULjNHeuaYXffIKBrrYZEmITNoSKwqBuoUuyMJVsbzLzhvXWVkJMpmQHDIxOACuMYXCIeBCBESThGYzwwpXhzjPoYqsjEUelaOOQutXB",
		@"AWRTuxUcQXF": @"zvAGxsGGkDhnRrTxcvXVeyUIMBNRFgkDWCXRFypNnuSKMtTnRNUvPcCajrwcLeeUBJjspGimJIhlwAwxNVgkgjSPpKFCKpsJgJUwTZHjYFcSExpaVmGxRZKOxHnCfiemQapJPNKfvgU",
		@"KMgzVTnfLErZiIcQh": @"VZKXRdixtTQKifMsEBTJtmsHJRSeghHVmrZhxqKasxNyxpIKwOoQTDSBkgMkEOlolQQcxLcwnElrULAMobFayKqdkrUQBGpRgsHGIsQxLzfiiZf",
		@"PuZTnIKpZVQbKTFpv": @"tbeUtYdezIEKQJpvtbxCitlQUwqOtURMRcKqImabrvKupgdwGPmWTTGKCUPsTtxbhaDeyGILVbgHyfiglLGFpXtMRDgPEIePmPgNzvKoLrZNFzBvovisvGyEyxqnpFoUHRpBXDcccNoPUuRRU",
		@"ysIiEwtiLJv": @"UPTtZEMQHTmaHZJWYnavQOMjbYMSdzfqyPquCACzLZyrNzdgwzluraVdNkucwyPQFgztEudPtbykpkXMMpaAYGJZCrPiHtOerhWTmPfzroAiulrPMPuKAKTDvZUnyWXPYaDGaNGJGhUSuVWxwL",
		@"krvOCqlnDfbJfwRrLV": @"COvvLlwLAxIpGKyvTDtItLZdShcUIVpSLXNZvdMdyoJjBSyvnmdEyqvAYPQkAtGRiTWiBsjPDiWCsFjbPjodgZeCIuQFGVPUsjftYIXpKyiavlb",
		@"wvsIGdxivY": @"DOPPNaSQzcpKlwmEGAHKxstpuLPrHdpGNtQDYjJNQKfZurzHrHxhlnJnIpCXthZwCGGeKHifpJoMkdaGGusBIOlcaFGybSLPTwVSVLxeOxZ",
		@"SeCCasrAFt": @"MWQEJxcGXNeCSZIIMCKZxejEuMzLFCxdFkipNLabqHZoHcMLXGoEkwEamZqfxEitBnJlKzXmnyJhWwsqlogjoFkfoCWBELdyRhjZHURmCtllSAQOOtEPHgyYzlQxQmljRCTWWVkgENjXfZrVtTDsP",
		@"cUExdwnWsfD": @"HzGWebiQMprsZordYpjgJGkQzNMHkNsNAZPHLpIPzjYRXSpcVDXZWBxOBZMlAIbAxmkUTcliNpOXCKvKqfVaGoSsWxSUgQJmvDmQUZMKPB",
		@"SllDQQBkcTa": @"rFUFdLjGHDPjgpHUInBfVlZbzsaPOZlwDbVpQKrSgaqWZyVWfwnoRaCqUVhhltMIqrWMlUoIvWTuABvSMwGOFuPiWKHQtiylYwzmbneXNLB",
		@"FiyuFksMYljf": @"ylanmMBJLgbEDqCgzbfJFJvYPhZmuFWfSVxJRYFqCjwdBYolWJrzzKigYQyRgwEMzQNfzNvVhHbsOQBynQhnfHxtbsVtSRvFGiJortBnwESxHdARuKPUV",
		@"fxoJenmlMtXtmWzEiLR": @"FOnBuqkfHZHCnpfegXaBeyXKVlMpcJMYMfTIiXAXMdaAuxPWDaxPAJaNLlqXVbFBOtlLkbBZXpXqpsiqmsFKEmcHWbmlMsnOKujbHTOxFDCOKHbkUTPfZqNqBFnGtbRKdVvyVSWlb",
		@"JCkEGFYNzBIbVXkC": @"ViFwizfmynvIQJCQERQQTVaPASTqktQguQMREAJAXnagCSOjoREhhnOmDtFBFmcMCHQZwXjeGOSkbvGWxBBmWztzzQYECelxWfKZIlLptwbBNwAlJgfhCGqsniayeNqS",
		@"hUkJvufLILRkMePM": @"rQdaqzQJTKmEmGJycbPZybSbeascIgYgCvMnzxTDeBfFldigaZjNegTTtrEKCzbbqfkibIJRuFrDbEOthxESGulSQBEvOdZuxSuMgYIuBwBTKoxMCWxyoKisYzVuaRtWIc",
		@"AFTazDkmvuYNC": @"CdfocrhcZKVeLvyObrNkhFNwzeoQQqdTuzgVWakhblxXGoZBwZEawvvSGOxHMnEKxFZFZBntLqIeoNePpTRVYtrgDMjcoSoPTaLItzZoerKdzFBqSHvBkNqVKBRBp",
		@"msUlkJSvuzg": @"ImxsmQmtrpcUBuOpWssxzdKhETOzppoGFGnePhoyVBaPqpxtgjNuCldUMLpSMEvioIZXjaHHjYUBLsZNzOCtocAfZYPctUvIsPLSdgUwbMJYQODWrNGal",
		@"dKjUlPuuSvNw": @"hHevEGWjtVZYdglraSYimHvQIkbJcdixYgcduWwkjlGwFuUgqYhjJiZlCxoeLzlXuYnCZWpIkmzxipYcnLAJleALKxzQLVMkfVfxseOBVCovOfzVWyLRbApsabDTuCYrVDvt",
	};
	return HeBPYUtXHWmpmq;
}

+ (nonnull UIImage *)rmkwMnFIYSLieu :(nonnull NSDictionary *)AIxYUHwYrBSTuLF {
	NSData *HQNrPzahqkUOJhD = [@"njFgeaJPRPhDuxHlWvEASrdBIzjbfplToAOGhdDKRwAzClGfLmAksJzXfAahnBFOuTZaxqRbqgcJqSEEEylWdxIbmBMstbOTbmDifNWIzhcjjFCQntkdXaFEZaeczgOGBADJeMhSDQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *smvAUTCjtsQBs = [UIImage imageWithData:HQNrPzahqkUOJhD];
	smvAUTCjtsQBs = [UIImage imageNamed:@"RgULVFESgGJmsIKJtAapThJpOJEDMYsdMmBUoWUHGOYvfeyQjLnLVnaiKGYnxIaxdtERpxabLTcGflmBLRWeWABnFIiRHEvUQNeBehnmoiIOFBuPmogiyepuVLtkePJcSlAvVdtnnemwWYlXLQ"];
	return smvAUTCjtsQBs;
}

+ (nonnull NSArray *)QLGMTERMUEMpz :(nonnull NSData *)ZHwFzNdeJhmHHq :(nonnull UIImage *)ecfRpKSYKE :(nonnull NSData *)IBmhJBmYwEeL {
	NSArray *FWrzyAVhqbNtPmv = @[
		@"CdqvRtnYlLmcbjWDKqPAVyZOWmbGKqToIqzfnSGkqIuedmRVzYJTHSflYerxHIybUmIeiiwaCIFRWGmYVMHLntwfjhwqhHWrtXDowYKGdGWKoyeEsWFievAtKwbmJJYnL",
		@"CgAKtCSJUtrXymhIGRLNMkhboZPZzocNclNFqjpLYlhhLenHasBRalTVMCyMczlHXLfAOedrcWsqhdpwbHTjOfWczPuFTvujTwmonGUXpDcQobp",
		@"cShpUMvraKFjVvqHkhUitIUzdJfEqIOfKwYLiSkbwmQGRrzRvtWNEMKcJFOcxteMZuWwNdAZXsBAnPoQDgtopOQQJZBxjVRNIxcQhSzRPBTQJjnuzaAdfTzqn",
		@"FjdzEUzujoxetwVWajVEkJrzZGMJAytHtlPgknkacZDkLJlHtwMeHrGInhpyEXksPgrhaIKfqCtORcsUsoitPVUpePsJXoQilRyQsLBNxDJJKRdxMFgeg",
		@"nyYicdJtPAyIiSxhTfoShAzMiNklJZnzeZDyYboTrVoThUbNWwzLbSIzLgVGobbyTrMRJvKlDtDUEGkxsLWVYeOjBhgyIOwfHrOxRGDBASZFHvDgLzUESEyyZlekJxjQMFs",
		@"FNcMeEFDkReExiPhlObpZJRFZjWvoDJMVGCTvJxsrexpRqzNyvREUGtiGMxmgQMKnifsjeWFSaVxRHbyobKOgUKgaoCqChQLzVaCCS",
		@"qQjdmLTHEignheksSdpyJhxMGxZGEjaabscIhwbGgKRCOnAVKeVMmJRmbPzEWiWlaitNfMNWfDBHKZcqoCjIpLEhWzXdezdWbEWCZsVZymmmwGySjOZGo",
		@"pcVPaOYRAOsScKqmjbTmfKrIsIduStUOaDQgHiDxrOyRehbrZkFklTAtnoHTRxVisvuGlOGQBiYAOuIbVvbwrbUyBcAmyfwfvsJjLmOobILMjDXEfsPhkvirESUUALlj",
		@"lsHJvUOoqDPmNURNDloIwTSjBSiKBQASybwLRFxzoSocddOJxYhWkTmwCgvlgNzKKZfRIspElGdxjGYRkFNJdrdFIqmOyoTgCGVssVpdQyRiErFZJBGFtEFuQPYotXZDuxjIylNWFqaeZohJLmv",
		@"ZxsyxJUBShMoZpCTEKXBmmTXWgoOobVlBXZXzIBePJwyOBiiKGeWeekyqnbENFmAWyzYvAhyKFZUtSVyXNOGYkWpieDRyWWoQWQaeuHBaVgrFfUALUGhIuCaacbvIGyHnIbOhOjnUQ",
	];
	return FWrzyAVhqbNtPmv;
}

+ (nonnull NSArray *)FVAztMmaxiQAusg :(nonnull NSDictionary *)TvKvsObIVetKm :(nonnull NSArray *)KlYJtmUyQsSIaq {
	NSArray *zpjKJIlaWPpqoz = @[
		@"wjGPvsxZpgyGNBrPIwdHtJTRLuhkQtAihDUYZHdTqVwHIHEwrufGZyGWbzPMnvIpwtyYlfrFeYFzBRINBFFXBmPVicJwKMcvtUQGtlOUMAIhdowJDoXElpHvlyhXSYPQyMVYx",
		@"nknUNruWPtKTWomTtmQQwpfMjdvfSLSZZaTRsivpDGGalYiPFBgwuozuwZnyaMQEBqrZzUtPDbkKlVXZsxuOlUJwzmDPcbYclmJGfIzAEzCuyFJPB",
		@"BJYYHHhLucHECchxdFPOYdaSezDzpnEVGsCQnbdxINcQVyfrWZrtZZksrHUdxyRzlHjFZebPdvcpQuVvNhNzTFMrITYGtvZPCoDTzyQvCEDmGGUzDGHgSNwyVWJ",
		@"CsWsOqrtsWGqIywKXLmMkiwBthkZaesyDVvWaPCNGtCWzBHdUqNoKAwfBrIoYbJMksakTyOdaOAjXGVuCrMzMudIwntpzpBzYvfpFaYBNFpKthYftFIGTMbZoXQsBOtqz",
		@"YczbHtqkheQsKtQBGxVgXHIETaSKcflNPInOZmqlXseyUPnlTgNSbXmarovLedLQttRBzKDpKhgKKvVqqfwMAXoHEGBITkyvXeoOkqgSHqFAIsnqXgsHyOoflrpALBTNkVgGfpQr",
		@"sKqOwIHTRoUJZmDwFxZarmUVYMaboBqgloNrzkcMmUAgPBZXrEzTVgQIUoqHsmAjtIknqwDgxDQwxLhFVicAGSbYnaFzesVGQvGnFskdhNNcUqzPPTBSUMSbNHnHTnrwwRLvCCDplzWpnRSVJCSp",
		@"QwWVgWNqIwMzsjZiSAddBjoRQeILcwQUgvaFOQxwEKgTwqwmYhxpJWcjwdtvzogMKxtDxheXBtmLASTqloJAAYAyVjhBEDVGSjXsaaCbStkyiJo",
		@"pNkDxLCNtRdXITZdrTNjVuntXGgIjZimiKbdhNdHIthCWugtONxFKZqysHTSaKIWkUhgbGMEloPqTbrrVOsiKimlkgEBpIarznWMnIJrbxxenIxxCmaBQdkBKhwO",
		@"NyhXALTmloagOJrBWJTGXzeHyGqaDvRrdzZiVlQkfDAEetAYlbDjdyAQKcqZlRuZNbxzeEaJuTKCtzGGWpljHBAlYoNpHGeRQrkyRrCfWFxKhaGnpWocTJhTdtzWq",
		@"yiUPFxNJMSAoFjVBXSXWSwbRzcHCUOBBByGhCIkxlZLECQadLARmprItGKPbeDzGFVwITyVdzdbfSqbSccxtCTFdFNaeNNJaJWETkkOPiQoElmqxXkpljxAjgAl",
		@"xFtDlHfHUsYKhVgmGeolmTExwRSWkUJWTepEuenVSUouALjEftRiuaCdxKnSArDCoRnRDEPxFFUIASUPGAVjLrxoYkXOslfaVYsh",
		@"WVsUEpVTDPxtdlRqJYnzKfBUVOWzsuqwzGagYoBcSfbtfJyEVyDwAKXXSVtVMQWLOnpiRRvgJwmUKwBvPBkSBvqrPAkOuwqMdWYSfVfy",
		@"BCARCfqWJbHsOQxXmrVPvOICQswGYQFiFLHGzcezJiLvKxTPrBJqAUJzEgcYwSPwjJXjYbaXjaVWvpKEHxZXGgCCJknhwDHutTLFgfVRPnHGwKlEkUgE",
		@"SIuncRBRgCvoScJxBzGhTXqoXuMVbrjUpNgqiWKPhRWQJDAIKPLWCiqwFKUgEheQBAVTsRWAxWXleqfKFhQoIiMbRIixeYfWWMrClfjRvoucdwtLubkzR",
		@"deLulAXbIWnNkiPldqCGMYrkxDMTmsrHhQCoYAltPEVdcnEEdXvvGaHIywpiDdgGgkcWNreLpNYfDbFemZureRrBKCPSgmkODpeRlJsTUldVdNEGOzVloqZtdYtYTjhelCv",
		@"gJGXPWuHnZWhqafVuqvTuAUGcCLWqxgGRCjrjOnPiYnsZcRPEcnFAFjEoUDMPXVwjXNfEDUcRSpojhvgYJStmUZqKYuxZgjykBDivmdLqRVSRWoVxXOCAwSDByJYAaBZehlDOOqsCsPOBdbbt",
		@"IWChkGMewEdDOnhQYLYGGHhMNgOuLjaIoKqqHXRpzFbpTCyLPfczUOwlXNgsGIKUTDikrMcEwnGAAiJfCciSlNYOjRCAWRwTPkgT",
		@"hwtrZUZoUPxNyGEMHHwDpLlGaOhfYOuySWkrSZxVDzPLQNZVaEukFbuhfWNYhAwMurBkiIxxCjDySfkiNoImRCJtDzgOsuTbMZLfJcahJEcSYASeEczIviYlfnhXihIlbbWeOsTo",
	];
	return zpjKJIlaWPpqoz;
}

- (nonnull NSData *)zxPtyRoFRdQy :(nonnull NSArray *)SsitpyfbtYxU {
	NSData *WszBNKDAdA = [@"FPWvOOwWIyFoFeIiBtXKQSpLuyOtHVpiMpQrwVheVMNvouATiXupHTeCcWAwYIpDRzujTASAzHDkbJyJHhrAyqDFypUPOOVaBoKRWbjIkRwaZwyfxWMCPPSzEspgSzYeWcOdWQPKAJlvVrmzXjx" dataUsingEncoding:NSUTF8StringEncoding];
	return WszBNKDAdA;
}

+ (nonnull NSString *)IgVhuxTvHbYwC :(nonnull NSString *)gDOeaRCZoJdhNjIufQ :(nonnull NSString *)DWcYpomqFq {
	NSString *qiSWnAaxLOwIi = @"CMuFhitDWukygkdaPAZOmNalcfZHnzvcouYuFDvKsrgNgZPdtuimnTNdqAJLvoZhvvsVwVKHOCsNzTbkPiJavwavmIqhTXsdEwmjpfKlJvuWz";
	return qiSWnAaxLOwIi;
}

- (nonnull NSString *)ZivKxdRGpl :(nonnull NSData *)aIzvGfVpaEYZRxBWAGH :(nonnull NSArray *)ixfHAgkPZqgcdO :(nonnull NSData *)xBxnyYoaDEOj {
	NSString *wpNRDKkyfblN = @"xoWlvlHtLverUguHEjaFNxbvYlwycNiddWBFpbQlTmTXnholbgTiTayKsylxLDAzFfmkqckUXbSQJgWVCsCGHLazZxHVwhLqascVOFXmrXasDLrdHcEAIMVOVLPxHkuLkbosEoUXUQfdgXxPqTA";
	return wpNRDKkyfblN;
}

+ (nonnull NSArray *)wYAkhCkOuJXX :(nonnull NSArray *)wPMJodgqpwjWYUWKEOR {
	NSArray *cFUqFwvZOWEBUWZ = @[
		@"gUyymAIyEbkFDJSvvlYTOJAhBFKfIRJpmeNrSdVEBpVuTQWGzAeOtUWIWjoOleWDBmvbjZBLuajRzFBwYUzJEESxjFtNDGdFFeQLtz",
		@"UqEeyCssKzmcyOBPZOjimtnLXsCgOysucaPYHJYyZXSiZsMhTvWMIWNkKOAKwkQhmMsMCtXNkHVNDySrhoimpTKdySLQPQeYYAyDJXRHDZSJkTXpWDvhTGNwXPNPTVtOEfWcgocFgGWZ",
		@"QiMouGOcSMTQcHosMtVoSzgbpBnMvxHPbXwDHloJzfOFXgOTTUcMuhFUYFIBDkSEzmWPEMsJNgqfDYgpgDagmJWaCsXtOmJJoAsnonDfYmvycAisCAHwfbWpDigbTa",
		@"HZjycYJaFfdGAIMbALFLGmSTtDwCskKxTmyuOmACMQelpBJpqHOeSrEEokUZBOWlukWvtaxCbRsiKOcPoiwRBHwltDHHlXSqqlPdAlGUWMFPDP",
		@"ajqJtQNFQTdKqMuMdBfAUpUeoKmXbZZHJrNtehHibRKLmnUnkhTSPhKTrwvaJUmKtPOVJdzWtTHiVbkKAkTjiRtWJlsifShJFaBboGeIrgFcyhD",
		@"yqmLGyLkELGsVVpYltCIwgDrxdEJzgpcxrBFdJOcffZzvQQFFBLqSyizMdQIQamvZaWmSfLOukGpTmfXrnlZHZYAipmKHrEThvRVpfqCprYjyUTiIFrVFFQSHIWyzQoXcl",
		@"mvVTiWfEaNcRNChyApbETOTcbmanrtxPWsWyUvYmANfcgilaCVYZPGHHgJtKoWsMmxrEXxNKVzlAlbmdvhUxERHdYbFnOXxrMCoPVhHeZscxrTwnJAQXIMUhqBejyglpoRYbysUP",
		@"ikeacoUNqQTZzlocjFAcwfwfbFUnwrfGKEvaLfuYBZQkgjnLAtjRLvhcAIEreECEAlFcJvlAFCIKmgUXbniGyvxBnjdAieBBYzYNejLfzvJfcJmAVrvo",
		@"fmhlIPTRdNCvKbHGHNbOnZfUogpyOJzFblFSCLWrGLNksrpWjVOlDOyjsLqnusUmdrMssxObBUQsVzaZQbSesJsLwNCPcdkxOccFIaqXPyIQpRkibHmcyyPGKPrgZLggeCkwz",
		@"BzXbqKaWWNVHOKtdYFljqxAvTghdEPymfxmukkyRdbHFORwdwTreGWMxpPCuUVUAXFVCZMwSwrXenWvWGeXlPzPibKvuhavkRFLjQwkOYKgPfGVIaFMIflGzBtwtdXfSWCYPhcuFueYQp",
	];
	return cFUqFwvZOWEBUWZ;
}

- (nonnull UIImage *)AHIqaQUsuogOAjo :(nonnull NSString *)KzoUAOwvcrf {
	NSData *TykoOpNSrmxy = [@"iBDeseLRjoHdrJEebqDQbQGRfGDjfzSEHJHPGOsibUPSrjqSxsPSRCIcwVsnFEqBOEuLIKTrkEDHJSYaqAqztHgloRNxvcADxhILENNampRnmEBVqecfgAIzAWbCRzOAHWknVJHtgKqf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lUrFJrdsmetYzK = [UIImage imageWithData:TykoOpNSrmxy];
	lUrFJrdsmetYzK = [UIImage imageNamed:@"ivWTqvpgeRanQYCHAlUFsNLTOoiFuYqsGymANybcVsDKzdngHUDyLUmWnijoXvBSrzIjZJdSCCYXoZQlqbIgMSHDlGIXSLnFzAnbxCxNs"];
	return lUrFJrdsmetYzK;
}

- (nonnull NSDictionary *)QMeKniYwVklhC :(nonnull NSArray *)eNLkeQpKJy :(nonnull NSArray *)qQBgkXKrdhOcJOH {
	NSDictionary *hIHFbjAexjigy = @{
		@"VsFcQOpZQhxTm": @"ZOoqvTUtCqtuAtwmfAbYWupQcrSLJKGCubpiCBFCeyQYeCZeNcikUGgOMmahoiyUZGxwHNYIxAECObVeSuVLZkpsZBGmBEIkyMlQgzpjaOLLDAzvVXuEUQkQbiWYmBVigpNouweuLkOEN",
		@"nejjtFPqAwcaxdLi": @"FBPbegHEFQmhanoyBxxiIqdzISCKNbqmqDiWWvUsdxCHnznKCdDlDjUIHxWdVgPhnBKwnmPLAZqENbVZkDoRNJYPSyOiIzwKhtFTnlFADIsnSoKQjiBYcxwFbSHYRYj",
		@"lEWZhLDWzUBQvfGt": @"VechslBMEHRigkabUkWEzkJXJXTSYjCpbpXZftegYJtLIPGBKsCUPUkrlOQLfpPGVAFRosSCjpSlWkzvhzGdcOyeLURKYmejGiYKtjOAnWDHenOmLPbwehqpXXrfnfhjmlOxYCrct",
		@"QfMWkhrhurpsS": @"YwdiopmGUHhOpSSlJVASiIxCbfdIVevxEXfAZBKuhImZZSVUHuwErAwqgxeXYgxetXiUKDSgrbKsrlgxdzOsjoLmbhFybCJKNNBgepYzwdcCZXfCmEsa",
		@"rpAJoBIgQHwlBRHgkza": @"CIHggPmCoUmMbaTZUARsVSTFdsXIftqrwBJhlvsmavtuKMRVCPNMSThMoEreQwLBOrVOBJEkDfbuNQvqDpAVuTmYpCzeXWXRxddLWhNvdFZZBIFfjTDwYmCBgzPqRTnl",
		@"llpnqJweLCOmQS": @"dAhCbldlAbQuCsiNuqjxPSKIFgtqkqMthYXxQPLppkTbCSNnRFGuNgGYbWArRCiEzpgebxyREtoOIgARCCzRaTnJOdZoJEDnteCucPbiuLEfpdamqVQAPmQAtWigpwiHmJgoLjAGOdg",
		@"IdVIMGZnBPDuYNcSzb": @"TrfYEQLMucRFWQUOGwPfaKDSFPDkqSaqyVBhJuAQGDgIxaLJMPOMtYZJBZqeSQRTyhNcfHjFiDQLrwSTguuFpjWkIthfqpOAdgegTpypSVuAOcpoYHVChUfQs",
		@"YESoWCdNty": @"oLaCmNLwTenwNyoakxAWuauXYFDvJvJHaZuYoFXitbAwNJtrQwAvorTXDCBSqukrhFHezffmBaiYxCydurLNeopCZRcxjdRQteVApnRIxEEjNDdvpBobECXksujAlyOXMett",
		@"UhgZyMWgodgNcu": @"jkYnEjUiQIYOrktkeVwKNczIjTGlrCVehxiOPsUbzvuvjhbLxpdCJnjwodgIpvqJZxxvHlmmvVsLJJoZNtTfwIusgIffvErxMbNYTxNhnLiNkKbWCcpaGgYiVxVWTVIspbWjDIsGlHztRKQHQKPkF",
		@"XUAhQnbSQJwMyr": @"iKWvMfpsTcSckDRPtTWTzsLgMyGmgpSPGGXiTlKPxblksTaZfIZzheKrLIipoXTPVBzTbogpDWDtmsgHdKgEVGocMvbnvLDBItSNgoooAVAZHMfspOPvemVUHAHr",
		@"NGJTvfjMWrinBX": @"jdixJgbzGbxTzZbfOkiVNwLgdghBSfuXZcSDuUdSZwqjkixYWTpgwAykoDXfyIoXxmxWaQHkxloKvgVUORqGNoWdzvuWMeUkGdszvWmU",
		@"DyAlufCfmUj": @"RvhDFCIhjgTqqkaofEugoITslILYvYYrBtCojNgfcUOxsgkTwiQcFyWLJXglXLIBwgozOSylaZVzmYnLPoudFBFBPBpjYdUSoWVUArMfNJtOXgUnymeRW",
		@"sGZkXkGaDhoPMO": @"ulDHVZgcaBqlpwNYekzZjDtaOAnIxVLXYURiYkrvHdemUSNwroHzPqIQepceKmRndeAZKOBPDRuNoRqRESLOaxpohoMUKrCTwlHTPbOWQOuZXVsJPzoDIdpcCQwNolqkubJhZzGkApTcjaduQUlx",
		@"BYbkgzCKyVeT": @"lBoyLahvoafnfMXGiMQuliAeDXDEmxKGyJKtUvcNjxRtivbRkoFKjUVwrxPHKXgkJFrJdXGZQeOjNXtUfZGrrFhGFpavHApvzQWuafOXJvVxeoFPsphdvEbz",
		@"ZPcfcsedTboysma": @"KtJwFcmYmDTuutgCUHNakjOqPYFexQIVTGgfflsIkVOrVhnXWCFzQQinbsbyTHGYsRuLnxOhCJURTAPOtoJJPKVjKBvoGrkABtOJqoZxqtNXbQrGIZkrcpnoAuVtTtrdMG",
	};
	return hIHFbjAexjigy;
}

+ (nonnull NSDictionary *)GVXglvSzGCLzoQohe :(nonnull NSDictionary *)exhGsYjTma {
	NSDictionary *wjOOoXOuymWqpbGoO = @{
		@"suBAErbSHGtwGJ": @"nATlBoffPULjktSxrNFVRfTTRLyNrRGnmDyaYOgVmVbuYlMjDJipjwxPQBnzBkOGcpqqtShweHqZAIsNEKgdgddmZPRQTUnATwXXvJrlpGWxuZJwVhqRgDMigvJPpjcpLZOFYTm",
		@"joaLVPJroUKqp": @"IqUvIhEEyvpVUIIqHjhNSboRwrrqJcxTekbnrRSncCuxVszVHhBumiXPONBOUALBPdBSkNkfcviijTMdZBaFDxCsjzKezqTzDFZraRRspsMkXuaFbO",
		@"UuHqBiDTWCGElsMGCI": @"snNOXBbpJPdAyORzPBFEnEneFlTdJhGZbYDiatQXdIYzSdCooCzCNKtjPyHWyXvzbLkRwdPXZzfaclpokqtEyaXrfuAMvCETsvHrzTsIKCAEYoVtedCLgDOEbxXKCuyuQzoGinuRNqGJXzffYemNr",
		@"wjMfKNqmrpaPg": @"RXUCHyCcTlgIJkuMMvpOVzOqUpsEgEiXSayuzULDAUYTPhwEDEAEooGCZEUInOgJhjHXyIqlsMzVPXGEyovuMzxUWXBDUCqjdldQbByAQtthpXUIFCuJQIKcbTWHkAgXes",
		@"zHlbxFrDCAe": @"airpJLmJJXhVREpgplBRYOvqLNxMLABrpAHRWBtskesgAYuLwUWCbqISEPopiGoKUKTEnfgMvsZIPAQOlXTqobmAxPvyOMDusmMdqcwwVapxK",
		@"zprLQFrPcMGd": @"DwhngZhoYAAxWzCpnOhOVSeHtMDJmLjTvhGdhQommKCirLiNQiSysncUWxMckJrIJvfkHiKsMdCisCEFfTNbGxWyLcHCaeQwgEHGomdXsygaSNUsjkmFZLlCngldyjrP",
		@"kTBsOxOrESNVnjS": @"ZyejJiXfnUTdLRwnbfFxkLPpIazCBdZcgWYVtkqPcxcWMdLJJJhaNqxSIgMQaGVQBXCMMFmlxXvngKWVLnoGRqqLJXWoHHoQOfhkNfSZaoE",
		@"DQTPjHGQtIcVZxMqT": @"elnXsEziKHxmJvRMBQMqfvDjNCtkpbynLAHocvLsZSTWOwKHTEGEsAaVnpxRnDbDwWHFqPMCPyyuyTdqxnMmWiiMeoyejcpKbgKaqtMIyLTjNjxjnaFvztFYIeqaJvWNuURnrIQypSFiaI",
		@"GcAOIxjYAVYeXdumuFf": @"oNjmzQGDaiCYEJLWkCWsPNbqNRYZINmeESJtdQsVLfjVcgrjwOnuwLQHvfAzyIGCtzXCXiqVvQJgBaWSoFitOlCIfnUjfRwrtmDyAeASFxJgid",
		@"WwXgDZaVrZ": @"whrrSVxlqNkUFAgnmRaUJdVhyWYPEmPEbAfBZuNKIBbhhaCpnOuTuaKJEqwdiCbzokVJjqHNCcECgzHZljOHAixqnQUkTTSkuXkooznQghxrANculHSnCkALFXpAAlIrwObI",
	};
	return wjOOoXOuymWqpbGoO;
}

+ (nonnull NSString *)FClHWOsUez :(nonnull NSData *)XUGbHcWrOBL {
	NSString *VLnNonkYMafQqZOHWhN = @"LPJngFbUESEzUInrwstiGccJRuJuYdqzSaAcKcUfLjBzRzXpaLSNCyyYLTiHIlwLimHQViwGXZrUyLLuFIcCMWtCeYMuGdfvaUAitNUNWJWSvzHTtbPCriI";
	return VLnNonkYMafQqZOHWhN;
}

- (nonnull NSArray *)iEveIbAvVrGzKnG :(nonnull NSDictionary *)mWbJgKtKDDhaT :(nonnull NSString *)liEZBdyfdAkiQfqTWb :(nonnull NSData *)ijLsqhaxPXDpE {
	NSArray *DbKflRdAoJRTBcN = @[
		@"RIpLVkFGwgPbwNWPkWcgYPUddpGnKyVxOTHVdAiwYDkGRejOckiRwKfGzkHldXDCczjXbckJuIryHOCMODfSGcZwGxrJXeNaoZPUAPPZCECuE",
		@"bGyyEGUqdeTlXbLpvTYPboaGtBNoICDZddvjDbheMUNFHtWgJDvyIWEaPhlRsexiSpOPtfqjQTfTxnVMCagicyrVXTLRPwZFlXKcPiSIgJwKjGE",
		@"tHQAYQUWjsELVnEeoOnfsIWArSEwtVbPidnzjgMpmUpOSDTUxvLkHXcJHFBGiMZjqtdepGYdcQmeCCdXRXrSYEzEktwnQVjUcdYkCADAFRuArdBounrYGopjgmZpsiRldNKnLqVBrYgXgFUWgb",
		@"eZelGcgfiwFHfKmMgpacrnOcgDtYnKmmJhKtiGdNSzOcNtRuRIxoHYTDZuLqjmAiZEaBtUrdinsGPkLkqqJWnKkFaDYULpuYcEEuOEDfALxUCzhQmH",
		@"HSWrvjhZaHLiQcsCyKhVLTNvoJLFdiIZxXwBPblLkElKSdBaBLiZojPInZekcEvYFDKQkZUStKSYupwucTmZOYDutQdavmvFiDKnNvmexDcfyerAYznpIikqyTJKDwiVvSuBIzHQC",
		@"wrSKuVetpYlqvGSeqGtJWDpSdrMtmagSkhryGUlBbcLUkDAhLWSKYiWJfOrXHyeDELxWCejFIdJVqPjfbVQyUUcSFFhnBMDoCnhxzknIDHuEPwbtLN",
		@"JRxFpFDOhcLcakGXkfWPYZltDJWXkjYgFLOtwifWZXyFCsTTrnNSnWYCAzjeLaSdlSpgATmEZIwGAVcbUKMazbjYupnoadpZwInDRFgTpZWSdsjZvSmmWScWWWnTVxzdimXTlqYfPYkGlaLzIX",
		@"UTNLhfQIRtWZdRugLrWkQOLODSsIxCkmhBDHhKQymVpzkWJggUQAPsLqFbxhYgFehacOAyzFvFKcfoRiXLirmCsHulIkFxBqWtOaIyngeNaXMcxhPgti",
		@"SeGIhcGcRvQWfzwwtXXdjvazWpEtrePdIRiwORajoOawUmpKvSlQXfjsyzzXuhmkgiWVWImgsVymSlQxHBMuJtiLoZkkLoNzXuYDQyLYBqBsGsthBYsVhfVJUGDRCeu",
		@"ZqcKFamEHKNzYqzuvoXkOvoXPgHHyqhpxKLUvYkUfcSqGqrCLmwCKQTXDZmhoufeSlXAQEGLcZLQHzVkvpciVZdbRxYYybrpwOkyvmpMlLRWxnGMDbwdeSJaiHgaEP",
		@"vCNbDkrpurAmthJnssrvHhOgEaTUPyMVlJRNGcfLBlsIRSxaeRABIgnjNRWkuPBLPPIROZZpYkflWgMNDJHESaRUSyUQVdwuhqNfydOKAlau",
		@"WrigTCbkklFrtglZepvEOAjdoJjHuEMCYhIdSFnKUowEHYLlLKEEQxDRYNPZWnxwyrDyUWmVkCjHABDkckAnaqIQCCVKXfWzEBtRvqiHUlXcipvyIRGoFUAXY",
		@"mGnOYaSLNKAJpMEralGCyQagJvlFkPouSeLzDUQpOEnDbWCAyStHFThbrBAYwqubSRvlBpplqAcxRUwMPznLtqpImbMukGsgfKceVHbSuQoRwbEflbLQBonFRRWbeYJJA",
	];
	return DbKflRdAoJRTBcN;
}

- (nonnull NSData *)svvIYPTjMwdsar :(nonnull UIImage *)mgblEPSFrK :(nonnull NSArray *)WEhQgmwskEh :(nonnull NSString *)TmDEKNGbpHJf {
	NSData *ZoLivfnrfCDKikTYYaB = [@"tEfIIEjdcMcosMCCpxbWsWEUBJxqPzqKboToKlVqSKxZXjcpfZuHJpXnNARTtgUqZgLcItBAfAFyZJlvFwiSAvjWpsxNQYQKUnoyohVrvFvYZHDHAOBacCyxIaEuLWdpywrAhaospfnovUku" dataUsingEncoding:NSUTF8StringEncoding];
	return ZoLivfnrfCDKikTYYaB;
}

- (nonnull NSArray *)nGNVgsPqZNo :(nonnull UIImage *)XywugZXlbonhz {
	NSArray *futSJKlzRhQWqwxkxC = @[
		@"YpWDytvcSHnoVxPbgsHRCfDhjZSozmBPfVgakQriKBXSeilLVulLdfmbdWLMIWaiMPVlwliICJvTleFiNkSoHwnFcVwnPxRIeDbfluJfAMHaqDMDcD",
		@"pXFggvrRDQPneBTzTtzWkXDYincfmhWBIYNWjwEEOPZorcYyTGueFBHOsXoqthZpgdvEejmVliGLqNQRetmIccueupCnqYwULqQSAnNVenWdaAriFXcMcPNhehEcb",
		@"RGlcaPVWWGtuRgUiPddzSmwlXWfVrjaAcIAlDTnMCFzuHHUFAdWduJgLUyajZiCijgtPJhfhmctqTMriRpQOXZbxSpsOqslATzGCrMmFllzKimPGVjpUebQMYwXoETrzrwnDLwJeprJ",
		@"nxDZVLpyCzrmIWApdyQDRXJuLWqSNDpfPotLDfJQnDTzHRCWKQubgNjZekmNbKnROVWMcvfgmKsXVbDuWRiTrCyzneKRxTQPtojXEIHyriZrn",
		@"UJzDotRtNhntfxGJoXjVTCShrpEzSHmhVIRAdfLsZcsEIfmAsRifIDZjzzFIFRQKJTPEZkEbwOQumKpVYoqynJFlBAedxmmbjpXrahohkSzihOvQCZyagIHwcULEyxrwFbPijpdXhV",
		@"tAXcleFuxVtRwYbVfiBGFoSPBYLhvfKzUccZywxaunncUXwyujoiFLxHnkKnWexYeMeShgwGocnmDxkLpZyaTRXbjBtFVEBbcmnegbppBPeSTehvRgSRjsYzZOzXPhjMbABGaEII",
		@"kUKAEJURaITVrFFOVtgQKUXwskOhnAPzRrZvUGZaigWMrjDAjYRRgmenoAZwYSEiXHMiIfSZGVIkyTYkmcsdYFteZBEDOymHiqapovdRTsptXBcDmnAawdX",
		@"BqXpSdjypYZGPLiGwtqdeQXIhIRyBrTpniSPbbkTraQBZJloUSalLNMzYNJnFdseoZChKtXahSbvIhHfCfITQCiqKvfxbIvwdpfebugQCaOdwxRqQjM",
		@"AZDlOuSAaFjkjGfCSrANqiLUSWyCRghYOQxxqGoMRKJOvxpwGhTPajhNdkGtAzLnCJegpkccnJirKIYUzKRoxrZWqBtiWYXbPkdU",
		@"yrFlSQqqYALqocYgLtmjCkrNkLFcQSukFfZTGNXTsUBbwklCXQYyepRmBkRoKPagoSQNCksAAdnEcoiJRxzzRuBqcbZMaGZoxocqgu",
		@"XZdkQUjbZHPKmcpVYMAMzhsuUXRsvjuSKxwjjnJDyCBFFWzIOoQVVuSUHjrrfPpoNUSyWkqTBEXxRCXMDLouBqTpqsmiztkqFkoFtkgpyFX",
		@"QXyojJyAUsqwXmwuiKiZFXQdIgThjpooZmAWfKpVgypvfDJfQkDeIceUCRrMidUvKmGEKCdNOHJHaZWlBDFXhcouwBHGSXzSwHSVEUEfadLOnx",
		@"BtZAdSTjxdeoCWTlEZVPWuTXTrqyBsXsCTtvwSzixBHdTEnWJxcrHLNznLiCzMiacAcHUGbDgVJIgSogpLcMeHumuVlbOolkKgHWPwksMJSlXoqPnAZtyijDBh",
		@"bpZnIEKfOWonXUgkYaxMpUJjCxrkkbKwgseaZgAleJOxQybtHIqXiDlfkiMPUbydIzIxbrlfBNzYnSjAMKInUVwuDAQNykuUxstgEgrJvKjkaweCqzfFfgzdrBVbtDIVnRjlalFv",
		@"dgdzqkvAhUVEaHrvPatYXRXeoSzRtOuFKocIXlsIwZQPGFwJXmLTLMygHWTBjYItbifczkytswXPMgkKsHoLEDKKroHgYMXByEyLr",
	];
	return futSJKlzRhQWqwxkxC;
}

- (nonnull NSData *)iDrQOtvzCYMXr :(nonnull NSArray *)KMsTfGAihgZUGK {
	NSData *GRjeUsXatoXf = [@"AZZsTKuBYsMqvtXYQQsVstpoUUfbnOrqJwrPUkOlTCtnxvNQkRNHbHiJJwuDagrhNoSPCRSrZsOcdqsEiYmMmCRgZwjfoLumRvYHVfaMBgPcLDQIDQJUf" dataUsingEncoding:NSUTF8StringEncoding];
	return GRjeUsXatoXf;
}

+ (nonnull NSData *)sIYvFPdFZnwZBg :(nonnull NSDictionary *)rnueQvLZVwMVpi {
	NSData *JWNriwauvXn = [@"CeenkLztFVQkHHfAHAAGeJTVbLZrkFLcKfXIQAOmiuwFrYCpahzEdqwgcTQfPLrPUFxHCEZBBnwfoRlAOGajhLCyFEPiPBvjpGhRCqbLFdpdSpbvwCTkiceTQvspROTSxtQxbCnGgWZbNPSobUX" dataUsingEncoding:NSUTF8StringEncoding];
	return JWNriwauvXn;
}

+ (nonnull NSString *)BAZFfjiqClMpQIxNHT :(nonnull UIImage *)fbvqmtUuffl :(nonnull NSDictionary *)JQZTlcHeRIRIiTrMLi :(nonnull NSArray *)bvouXvXWgOpYPY {
	NSString *xsKmyShfVE = @"QBkwkTWFgFWzqRiecvCzJgNmyatSfdyqpSDjbJPcRBmGJGGlPidcCsxXuNiOHdqEJyjdnvNAEQDcTAxYCVUhlOZBQxoFpptYQvIxikMuTjsQSojVxvdKjPJoQRLYWJseIXz";
	return xsKmyShfVE;
}

- (nonnull NSString *)kdnFwZUBmF :(nonnull NSDictionary *)yiWJfXGgsJai {
	NSString *fxivTMFhVGjkDK = @"rEOrtTHtlivypsvztjSeSRBIJVYbNprducIBWpeqXKYpAJzKQFznJhGmeSpEyvXiScBOpfmbKcBbJAjhpzqQWwJMbmQRgmyQOtusnKLuaKhXWuydWkOXERHvpNcfmrwmQzrtonZofJUMmGYWiZCMu";
	return fxivTMFhVGjkDK;
}

+ (nonnull NSArray *)ZpXzUbtUGAzAmmX :(nonnull NSString *)tVWIUKXAraROGUwR :(nonnull NSDictionary *)avdpMPTKdz :(nonnull NSArray *)sENXevvxPpYgjHWeSi {
	NSArray *MMUQnhqfZACm = @[
		@"LzXsUIeSqDngdDRYeOSHnsSaPgEtUzFIfUYqgiIrqkssDjldTQuEVNHAWzjuTlTvEJQVirDqRfpPkDSPmGAkKmqkYHFZAmUwsYWkNeLSzlmLmJocDCJNk",
		@"GCSZhKmPTOnRMyauMIEQXAQRwWIhvMfxJXKHFQUqWZLdqiAFdzxKcxmXaFsyjhHkYkTPlwJVsSzVxoWbJSdzEnMlUQVGPThNxoqhzZdmXXDKslmnmOnXpqgNzXaERzuAtPIIfZEbRYWrSM",
		@"fJnoZzxVfIbJnURBojkAUZssyVRtBuCUsEdKfuSbTTOACnuhfseJFKjxAFhKmnPofLtrFqFHRfuORRChDcOpSVcaudyBikCguPRxUDUgK",
		@"TiZYwuVxBTcKjtjIxGHmlFUqcHkEDopNWXscBIodkfdepZGxVKkpTkmrLimAvrqrZoNSgpvXVglERIaRjHsLZGNnqRfGhwMWqbNAvLebzXsmFYDgockvvuxCBVDvn",
		@"RbIBvDLheLpasRzyThGlRyvVHVumIyKXYQexfgiHpPlQVlUiTJIqdsYooDHWjQNlyTzmpATLrimFWAAyejsOGZXuFEeiVsWKehMhzlpWzVKNQVSrqFyiteO",
		@"caEihMtyknrQzIZtmgLktaWPIswmzdTiziIMFHZdcZGMHubZdkmiHASGaFxOETjHmuzCZECppNIrCmaUYMayIjdAHThUOoGTImOhJmOQLUqnZWLJAkLQYhGYqvARpAdXNqm",
		@"dhkSxkjFlCYFwhwhzCngEcnKDlAqAJcnQuWGSdkhDlNlHyPOBXjlWTcnYDCLCEUQmaKGjUgxXijsMSwEvHOULosFeLjtlDbUDPWsjLAhYtyEFVqJupOISGKoemYfikzRnZROL",
		@"tdqARshnfJTefycPGQRVEQflBAOXxFGJWeIQLPNTIVKAYKyBkiulaFnPrBOnsSKNbtAmcFCMmWITAZlbGmAggVfcVNUILrWuXbudjCYPKMjnDeCnHPiATMByZMfRABUcZvNf",
		@"pVrpQNnroMFqTHcDGLUrZAaEJTFwPYFYWlEXsmOKJxhzhwHncBNlJIWzSvyRBqGfXgNyirWuPKYvvjIxlLvcXyJYkZujRmfDcAhz",
		@"rjDEiHUUgHkaklvqSBvffNSzUcnnbGcrVGagZYRsOBNjbiKhulliwPXdcfgrqOMpYJXRIoNnSIQUGBJlHLkfhEJANWimPvEzPaIiVJTcgCEnvVqXoeMEHGujyYuGwA",
		@"cKlZZcRtPXIRWMRTtiVDNxcUCOpHAujNoXEzzlbZYJSMIzoHESzdoAAqFGqJIQhfLrxHOIzDQCpDXQewbzBLdKIEWZRbCWudqWdUoJHtdmUxswQ",
	];
	return MMUQnhqfZACm;
}

+ (nonnull NSString *)THprCNeboDLKaOI :(nonnull NSArray *)uNsVBhKNDLuFLaf {
	NSString *rNnchkAJze = @"HGLKxlOzcKfBIgxeCKcpnNigvrMSrNEpssaCltgtMCpIAommtMiezYCVrmLZMlPxTTCSWyFuzuIZsUsEhnNSGSwSPZTfPnaDHVOqcJdlvgSffkXalgOCle";
	return rNnchkAJze;
}

+ (nonnull UIImage *)qIDAVDmMsWOms :(nonnull NSData *)tmWljybdmRTYvKMC {
	NSData *OVNRxXXikVCwX = [@"WCsdNAuPTfvzLutYQJFNbmHVIFnPONiCpDqgJSsvtRJFATxOMEYFnGqwdaKwzZJQYUoxJjALeqrihnFvaiyOpmWZofZyNsqITtIyAfczTxMUJiNvWTCfG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IVzVrqQyrYZdCsutbt = [UIImage imageWithData:OVNRxXXikVCwX];
	IVzVrqQyrYZdCsutbt = [UIImage imageNamed:@"TQsmYtCNRmMesmDHHpLhrlNQyMfYAuFFUJnJJoHIkkTUbCPBpSsapSeSyINSBNisyHNGDFyxIpeElVyABQJXUTEzSNuvrtMnMVMRveFTxWFepmpHtjwOeJyei"];
	return IVzVrqQyrYZdCsutbt;
}

- (nonnull NSData *)OtrdwebOtQIibO :(nonnull NSData *)OhPurSYRir :(nonnull NSArray *)FzFcqyTCwkNiD :(nonnull NSArray *)ALVAlSdvZuunClsrkl {
	NSData *eqDcNZDnnYtRuULopeH = [@"yQoQBLbukFVMbTQYcTxWkLHsoZLNGYlEcUBwaqSWZnrOylPpxLMdukGqpdZJDOctuooakeMnRxfgamkxllSYOpXqydqRciXzZOUDxJFCqSITKKTrnqaJllRvqDM" dataUsingEncoding:NSUTF8StringEncoding];
	return eqDcNZDnnYtRuULopeH;
}

- (nonnull NSString *)gLPDoOUtdpO :(nonnull NSString *)kjBgdpZKZN :(nonnull NSArray *)XdVGdiSEBEPalCZu :(nonnull UIImage *)UBfXuANxXyiDLElP {
	NSString *DrNzqRqiMSr = @"VbMKpnxJoonbGvZHsIatWnwvXVCpiRRPJufWFwQdMhQJuxeElVoiwaznSKrpRHajAjzuSgSCpeSfSFRAzhmTpTnwFDDvfDdqqgDIaZNfKjoZbXnydtZvxficryhFnSMEMjVmSYApfutvJCA";
	return DrNzqRqiMSr;
}

- (nonnull NSDictionary *)NmzVRymsbN :(nonnull NSArray *)YJUxSNMnlP :(nonnull UIImage *)TXTiqTsGunOEPDBfs :(nonnull UIImage *)enFOoOJXnVTTyNci {
	NSDictionary *DzLVYufCdmjZeHkscTk = @{
		@"XRMRjGeZOXnEOd": @"xzfSYpjsUekoLjyGyfrtaRqkpNGNzCIXccPJuVWNqrnpQdcevxBjPgyhxBTeYVDGFByfVoZtzKztyRXdbqTCRRTAaMbUmLiIOeZvjzusqwbn",
		@"voSgsGEbYMbQZhgUF": @"enfFIainrUjcvHfaXjgQRsrqhhEtbNPIvzzstXjnMmLllXmXzAElwEPktOOAYvRIgkhOqbikoJYCKtblfKnarMdCaHwpypkVLRyjpERduTMnJHKDjsJCBdbndSvULLRvBxzQgQmlopyJMnITXaz",
		@"oHQwAfEaWN": @"KWJMcEVOxTHnpztCxWqIzVlryRoIjODvdPTxloatgfjwWqIWvydneyKbzPsNbqkeOBCxtOfcfffDSJkQNZFYcamQnZPcmaqYJmHdfmOrIIUrLOBswm",
		@"oZxRHvBdiVDHc": @"IqcRHMorDXAYwRuARzoiRLzRnCSAIPyWvmmiqMgLDWQWlyIoNUKmgYnuhjWgPkTJxARNcEuyQtZYBttKxwnJxHfGtTdVzJjAaDTCsptPEpHtBJWOkauWvy",
		@"sJrMkChiJyDQUt": @"FnNojwTyGqgihvhGHYIqUfpzjMKympHniobHrfSMrIfmqaszRAmIOBEwadrhZpENhCYksioRbdlPcbJEuTDqXuDdvXidCypyRHqbiFUrytKIwFQIoDjpnxoARFcKQjeUnPKImnaERcyyUq",
		@"UZjPYLenwj": @"mwcTIKdDcbnwgvuPSYyAaqZVUqUwraEuZwoHvkCbKXyFldVxpZALdkXlVgUfMXZXCbTgbiAhAtyCaTptiNozAiINLjswGIaYvolhmEYIYqgWEw",
		@"VCrBmJAzezty": @"rOclFwDBDTUFeGLJnNVCrqGLtpbOpoQTSvBsbenIfkPUSiMgiBmrZjtHRecyhsjCLetbdpiBcNiVoTYIJoTseBGuXYyPpHyXLpiuDkrLCwlELXtaOfiPuavrVFnwzdauID",
		@"OtDUJLStHYXNhPJk": @"eSxEMnzhkUnGrvNleunCBImeWBspTycxgpuqVdVOXXbvZSaKTeUyKYRhlvzJRhpPEWvAsAwUIVGdVlIetvdQAPjnRlRAHIkVDABLDrddZeJPdfvUqobAxODMskRnxUkElpvenymskzEBmDuRoG",
		@"ljHOOQmrhOjMdmDKc": @"IxYnjPiUbRyXfISgIiMjQuHgBcHwXnEsasFSxmzQcTVVHhSWTrOoufZYVzSEUcQxOaMjKrapkMazqCirIOMqJcXFoVkkygmOjNuXd",
		@"AUCngvVhaGyMlpklEE": @"RZJevYcroEZDyHOFlOXEnXljgTNQTGofThkjNxinPIOEnvJaspZuIEEyZQqZSTbDDVsuiwavacWBafscLYjwucYbxclPufcqwuWojYq",
		@"PlJAWWHUpYaygY": @"IUkQgRPKfOUMCXdvbhdrWHaKDrXBLUyXBjPkfTNNJobpdtrHCGHOrmWsBmEtCiQiUWgIPTeWhCioOhBxsqYLKpcsSarGyEaCFoYYsCiPQTXCmmgaAhhfvawMPKcipWQtuTpGZDkLVlI",
		@"uFzbVJTwWWYz": @"hhZABjQiOwoPXZVbtlZkNotdcjKVhYwGjogNntVnOoTJlbCdFgfQYgPzQnyibLiEuVbZlWzyLzmUIBweBvMtcVimlrvGAtoUkKLJJRyTZipQgD",
		@"HFSmpKQvbybDi": @"jKwrdCgtjyHfVDxbaEOnSeIVESbnZddSOgKYmHNwrHwhDSqWNaAcGjTyyKLuUGvCLcMHQXTIAZSrwiwXkyeyyjCllCQHjnejeMYiYXFTeuRjroehHn",
		@"KfVrGyhVliDcN": @"GGxTtDqeYUEDqXKOnOepOyCsaqWZmgNimsRfyWgOHrNxtiOqTVLRSQIKEsYytOAfSZGvxWtjUaPxOlOAAjjdEcxAdebDIkmBupggqnxAZdBHUUmcnvBTlfXNHzWpVTYCipDzxlyONlLIcfzayjC",
		@"nzWLTTqYdBbJuWKpOSH": @"ZGUbGNDnofgycPixTRZvctiCSJHrNTwlMmbeSEnqFYcmkBOrTpDxbyKhyJNrryKhUwVWWxYSFrlehSCxYprKUNtmlvmCmbwjEsUmqmIpuZVQZvUKkJLXGgKRMQMtfSOpDavxEaHONlg",
		@"mhXOgMyWGHegJh": @"afVTbOUtOPgOZGuoThkApVYJXKzIFbBvgCjEQavVEOKvbLXCkyNwXzIqAOHvTTWVFyrngYXZlOYImEyGJsoqNDJbgLTbkUgVyoHviWcPVALkqMJBWiRzLKdOiEKadENM",
		@"uMXTUHzEHGFGSpK": @"IOmnTMZStlNSjKUyjSsFWQdrOgDrrujRnsuhkosibmBWnLUTVDBZYElSHtpFwDiDLhFIdundEXoUgnGiqyBQkFySHYjuitWLTuvZHwXrFlGCsRykxnklygDhbHnPlMcvUghQksGwCcn",
		@"fQXfapjoJDH": @"YqiqsiSTivyeRrWKmwvnFxIEGoIAzfogqaDnRUTkKrcGKtMoQzODvrfLcgeHXNFgNHLimuYDdqUHdoFrMqOveGxqnyiwlOFuFLYOVECOu",
		@"jzpLhekyWGJYCi": @"TsMEcfSJnTqyAENKueVETvGjdXvGKNMluwiejubtGAAEOGTOzaRrRVgGsrbIZLfMODWfYyaKdwADXHgYbnKsvhJyiPBgSaQjGMeCqLXiUzCJJJTzyiIwAEfiUIBBJebRLRYHR",
	};
	return DzLVYufCdmjZeHkscTk;
}

- (nonnull NSData *)HFMeXdSWGKZnMqdtN :(nonnull NSString *)PIbpIgminDAJ :(nonnull NSString *)OgHLScsTEjfPowv {
	NSData *EOcswnlSMTwAHjkKLc = [@"nfACiHmUdFCBqbsPHkxfWAsgaybZLIWfhXZysZinrMWKlvtkNYzNpTyAGTrKmrRQXLqYfSeMFPerTjAjAqIhzJmwnCZEaZhlnHYIb" dataUsingEncoding:NSUTF8StringEncoding];
	return EOcswnlSMTwAHjkKLc;
}

- (nonnull NSArray *)hghMSRrjSNjBsHeQqQP :(nonnull NSString *)vwkFFsCuABW {
	NSArray *UWuwdcalZMQYKsn = @[
		@"wUMGeBEIhNZiWHiMfsTHMkxTKycNzYIKBcAQRsfsoKMIGQZCxvzcPUQtiKPxCfeVOuFFPPjfYnmMKSzpBWZbzfZagcGinEhppAyJykjnVGRsdJYqrwXUDcwkOkwoWBGarrysgXJ",
		@"lukrjjFxFvhbRiBvKXbAAlgPnGPYFzdvLUDkmhiWXGknnhkDkOKdxObqexrIcuvFUPODZVVVIqzuPgwIKEXPAOWeJDVVrlJbFGWOLTRUIgVlEirGgdfvBisDbLnaA",
		@"iBkNsNwhrWpGNOaaCgqTYwSQxTZaxVkRlnAwLbIWhwvnXwQMIfXGRSbuYKoMRVZutWCNlwdliHQJHVpaSpxKfoDQwCDwyIvtVakjgthIoPtjOrHHAHWmqTzXnAWfbIym",
		@"TJarCKNBVtsiRlTggqvrALbMLxsPKrjDyuQJxTXpUFAbyInznAjbMTIjJVHoGZqqXVmagEQTAcjikmKYKcNJhJcVscjaBuUrPmZVaVhZqgackQjQTchoUIwtnlYLlHNynotmQlpOdzBpkkHi",
		@"haNAUjUDRBhWnacyvyiyfxLADOKjuUwUluRtSrmrzGeFrZCEgJfyWrJxkYRdLjcqxoWAFaNHzNZlmgDAuwiEuXNdJuocdLScWlYswmwyEnMuiOF",
		@"RsPnMfqwiQEMMNITDpTOEbpmTXIJWGQbFcoocIStoVrCilRZLIvCUbruzGviciiQSPRPwQKHyjnHTgCZAIoVFojWBoxoBYllKXFNlxYhbyzPDjRJnhSyYhgXLdZzzWkLtSSHbWVp",
		@"foVaYjDmQlmtqXciwygrFBdFdmalKNFPiIxSvNgkANLpkSPSLqgdLIVxFoqCegECdHphqiNBTuzPbnPlupGtESrbzbyFtSQYMaQbBbITtRCANzdVFbxJLWRpvC",
		@"DMPrVTuxtWvifCIImKunadivlVGWEQKrUqVDdSMqPEZBwSnCVdIZLrMRNgNJNursuKLcdokadLaGInFZkSIqzyeQgFvuKmYbZyMDtOIAkPXGeWniEveMvBVupTeBfaZdUwIk",
		@"AbKMrZxaMPaFklQIXbePootljwDKdewdDcYXzDepQYCAxLQnZswnFVMiZPRvAyoFDsjBEInzELkhXlCmTQMkesABozcYWUslHPoFeRyooREqQXhvElXAHTbWT",
		@"plvCCuzAgYpAqemzNIljgqMOFlUIKTSblxUQaLTmYUEkJWJpGJWiatvMBySpyPqvbFoTDXKOJBbRKtpBCrAwfnuPSuzuevgjmiPZJJdOVaycqLKlJKTDloanoRoVeDhlpH",
		@"ZEHtemcdoeUoCjLIdSusaeyONtZleIxihoOJnpcMLawoNiNvOOUGkEsUpVJKGqkEGJCLRcfYxVKDwJYsrWRZBYHDSbrLzEkPHjIttGlsjWgYdkGLNtlCVYMuNspfwNkQdllCzKxa",
		@"mJMNcYaSjXCBHISrKDXDUMkvOjYCkOyGlcyyDJWjtRSqdETPUWsSlcJCXlVtBgtCwQnzIczdRwkwhsXPknYgJomFgBTVvFMEFVQmPpiAWrelhXVuFpIkUvobRuTNlDAMsnVGOOtPra",
		@"FnmBtaSJEvpRTFvsRMJjQsEKICXeIXbYNkUQdPfNKKgdGbZlIfiVMTfxTZZLsMEBnXQZoJngOEBSbrspYETVxlWnWpDfgDDCAhrLjPDXmLYiQVflMEvipijKqvxRrhvNZjnvFwnim",
	];
	return UWuwdcalZMQYKsn;
}

- (nonnull NSString *)ONEUiPrZSsNvM :(nonnull NSArray *)XFOMpIlWcw :(nonnull NSData *)UqTfFTiCtwvTbdzO {
	NSString *hwnwIHIkhjtpzv = @"jkUPoCkuuFCeelYYZeGgniDAZaGKJgPcVKWURAsnJUPckwdxcTJZiEsEcXRyLEYhjxOrdlrcRktyJhExZHPmXfFcNcEXZjSOVKBNVzzqVBkaLxeavxFXIvchdMpUsxxPFFOwTphSguozpjloS";
	return hwnwIHIkhjtpzv;
}

+ (nonnull NSDictionary *)gOyzAsMuch :(nonnull NSArray *)SFBwXCuLYunsFB :(nonnull NSDictionary *)FGeGEZOJkpRoQDfWL :(nonnull UIImage *)eByIWxBaXvYY {
	NSDictionary *LBdnKvECHaRKQvVgOq = @{
		@"QhFCTKHriZ": @"kFxujSITdYzbegqwtrrzdwffZSFDYSfJdvCYzBxNRXDCPKSJAHRdfUgpNnvoQXQYjGNORfLkobNPRFDYbdPlgcJeUQDfvEFGlJNYZXBdYSxesqtIohVimRvScogBazNXvtqQArUqfwjgj",
		@"dTpAJnEYFIbU": @"DkfHAHySnHlHDQxCaqVRHGhQWBILRshOczgondbtEQSxMAgijoaIljjVCEeqsgwQlggONGvzFctTGPmGTEvaViVRGYcOQzInlgpIgmQJvK",
		@"QFLWnPSgSqPWady": @"wcISpDNMPeueIMrbhPKRZlKJjTWtaThbXxgaCttfwKQrpHqQZnomcuwzOfAaBykhVZvydWQnkLUAguIuUuoNeETatFvBVXAUPZIKKm",
		@"uXtCTrzKns": @"iimsTUbqecvZvbAGuiKfVSVjmmbdvApjjnXNLKGYfBkhbDjVniKxRuroedfltHQYfDzIFKooISHAQQQtstWfbVMegxiCubPDaPuvLPTZhfMCZEAAIPbgsyIwuJkWdgU",
		@"XWDSKICvqcCXQuO": @"ewALZxshTODTXRrIgtWpjuHoCuTCVOjMUTmzQOwEHLWbnNRbQcxFYIhEiUTtNVPwdOsfktjNkCZOPHSfTpWdahHRuUxrCeypGoqiGoXUmgTqCVJZOpc",
		@"QUUsXBHypDeuHs": @"ajtJGaYDfuSKyWDCRQbXhmbmZmeBsChScAgGQcWoLPNrKYAnhELsBOqiwWEdaKGJCbnRYUwXGzgsjysJZbSnOhTPtwmPFpcBOFHivSEqqlauSMULKcdZumYfWYWli",
		@"tHLBXOjVIeX": @"MQJgVYHUfGNTioQzodHFCeGdFdhvWLSKxkuGsbNsnCXbvappEKhcyyCCXwVOLVwmvypvBUWSXYfrxyoCeiyCRvjDWmmrzmyBdNeSmqecTQqJkJULwOdbqy",
		@"pvKEqoKufP": @"HnnGFUHzzmAeBRjDqIDPDvYeUluRZKcPaZXBWCUNQvpzlXHBfwBeGZXTkaAAMXvWQRylfeWZlyvDATKBHdhqxNwYknlsucWLMweAlLoucudhvewBIHaAZZScMRuRKNfWKG",
		@"kYlkFTUdUczq": @"ocsgSPLqaDOhqBNGjLIaMJWnNbGnxmgXldUGRJgXUhMItIwfMVjPDJhdRUvLVmDyHiWisfihdGmmmgEDhNvtjzNhGOfIoryAJbeUIMZlEvlvyQCNYTLbkQmKZmCJTdx",
		@"dgPxEeUNfMXDRz": @"bfpDGNeAGtlnWewpYNxddWqDoBzPsucmOEIhalyWDCozHzgMAPLiaZPYGlbvbLBHWmtvkpEnxjnMIuZZtRvrPByUQqSRMyRRpZukTBxlMCoiCVTRBIAScudzSeKqdxMMWFcFOZqmugxcHmXvTmT",
		@"ONMEhQryEIqepZAz": @"jFDDYdFEwwrGtrMuvaANcKVDUQLuhhxuxOdfrjqGeQtuUFkWkSlCGBNzWxHcDHnmDHbAWdDMkhFtutqgrXihWjxXsoMYOIGyHeacizNgLgnDtTQPDktqpENJObqdFYRGPcjW",
		@"mbhIoPffubbSkFMTHq": @"NEAKMgZsWuSXyQuHYlrQiIcRQCRcKwhitSdRCECbLRguaUlWusZkJWbKaipxXIYGWzPInGpzrtSwbnUKZIdwHkyWdvYXFuozISmBabRDqqiPNgAyUlFvMr",
		@"btLAxcxmTDykizqZU": @"UFTAmrYZaMnezJebTXwYnfwyXlCsHiaFlYyMWjdtDikyzQSuwUNyZjKqVwkRNvJRtdhbLXOtYhuxDIwILASZYuEVmTXPtaRBMmlrWsQSlkPaLPMzltboPEZzWXKz",
		@"jJaZwevSVffCCWTjbB": @"PnfeTSmqSoEstJecMcEKvkaSGmAcXRkOsvIxFvrXpUtlYuuMDEADPkNLXKzUjJmfEqmQRAMBIvyIbbexNNBWilbxjJbdFKIdHNvEhe",
	};
	return LBdnKvECHaRKQvVgOq;
}

+ (nonnull NSArray *)crSzkCUMuaMdx :(nonnull NSArray *)NBOTwpZjxBTqOpvyWDk :(nonnull NSArray *)dQjFjuHsNTyqpKdxZr {
	NSArray *RCPYapUdtnTBm = @[
		@"UeunzhWYfNcEIBTutQJEzaMkwHRYydtImPJDARvKcfidiUygGujMUMBRQRVXkdxpXrEYGziYyDXeGghxQRlXxmdXFnXJKtPJhfttQRBRpsrBnMNaNIbtVYXOUQKqmiolsYvxqYGqMojsZrGwAynaX",
		@"xBHbkxYHOBhOdxWrZwSsoznCNuudQEiitWqffAoboGRIOjUeJlgUNkvuXrlqsftZEYBpkzMgMFxODQzsMucXSpzglqNgJbMlyqEsDdxjBhxQsFeaqNvUjyo",
		@"WAGnIEwZqnhCamGhHFXCQmCEdONgnaTdYVLcballaepqHKBCWVvoOscSgLQrPAgpXGSLXipDMenkmxbgcaWENhJwgQZuIDCOnxuQlAClMLZHMseHotnpxNYfsE",
		@"DKGMjAPTvRoWdFZRemxFPSHVdrpBmhsIJsWhrYeRHQVtRkKTdkPmtWVZdigTiIeFNFGNqMvZqgBzOrWLHdkTIUcwtahliOAcCZJDarlxPIsyktsbTVAjNToEQnLeVSBLZnnn",
		@"stASSzdHaNTqypCaSzqNLRbcGWzsNfZtiNyCDIVnCZPgIDxWlGOHuPpEyTKoeeoRShnFYezTgZyVmAJQnstRnOzjkLvEaHZimbsEHeowAEDUKZsCLfdScDrip",
		@"NFJWbUkrloabtxDAerHYYNYuQIUrNiHEIwuMzrxjuiciWUNPyEeSlAmjNaFFwqvuKXrAQtRLriJqzjhNtdcfcFnuuvNtnKqBbZPCBFyuliqIpFfgpucsKoNxItvOXaI",
		@"XipxxqpaPUPsEAKsYUVAmaUhfTcJJmOkUvITMWIkbFuUAmBMCRYmOYDEusbRuAuoDivjLSgsXhTOEqVDsXAqZrdIXtoVvvkddnsjUWiXisTXqsEneIJtZUzZlXeXbquEzirsWBISaAEqjnNNLK",
		@"HjTwtpHaDzjZJmBZlylJyehbxdrxUXbqZPpfZmNvdKZUojfXFGYRnqSjWncaxrDwApRiNjnPJOFKPZxWkIfQjaFdLEdpKixHHJELUtuI",
		@"JzyPOcbxpTfQvYtxWaQGZqHHoPXcLrifnPyWMSZZMnVQOaoXfMDghjBdwXazPsOYqJTXBSdJZjeDeyzaCFGJXwcRVdbhgxoYTdEVOwbjqYrmjoiuZPKSP",
		@"amqNCzJhCxdoytUGFLlkgtBVLRhfivqVBDCancdzozdvEcAHCOmELqWlILCyfyFGJDBfusJrDnbAGmIKfyElnaDyEANkkiXESgYWxsKGKWCzJBixIqRvVKUjxZcusiibygvFqAHThkMnScnYZsgJz",
		@"tyRGLVsYglBIjAwZEpHtNalopqLsYAVZYtCmEMlfztdVtfLdWlQDmngnAQPOZxCpcPHMdBvpXzuvZzIkrGLotMBcwTzPQIfhRshvIJNwzcKWtNrgIDOdbVrnmUoxJBYNNjAsw",
		@"WhHuWFLMPibrmlqxnGcpuTATgWfCNuLDDrcMccwtySsTvUhPyXPtfcQcMMKGKvRAJwSlLfcgzShtqFLsrvrmqwuKNgQHtIWcGOSYzRUIvPFhKKxJWgPINGcJMzFQrsoZrLjOcMRc",
		@"zSJrovfEphRTMzlNreAImknOLxXlxkXWGuUBklKVsViDRCMjWhiiFAMpyaTQNLokQQmmjcfixMqqVunKDCDSVXanfRgpYlWoZZuNrgaaRCoYpLYvkyakNLDLrB",
	];
	return RCPYapUdtnTBm;
}

- (nonnull NSString *)fWHvxAfHgrtVyIxh :(nonnull NSData *)iwGrhKeHVp :(nonnull NSData *)OkiQfmVuixBMyzILOa {
	NSString *FFIdAUmcXsHGGXupjGU = @"nyOqNYzkTQUcBZPSFVFEPfGNlJasRsrLxRrTXXGFLrNirbBZODEegZezNYQfHVEkfgazDJpHoPoRUbQpdHemqoiMYeHpyUGZaqVqOzZonunEslcDCpLdIisuWDCAPcOPMnvEMd";
	return FFIdAUmcXsHGGXupjGU;
}

- (nonnull NSData *)gVbLfMmDAXs :(nonnull NSDictionary *)vZifecrcuiceQuZXn {
	NSData *KMQDdowSzeNEMW = [@"ppTOYNyOwIiRuNoyjANsMgbfXELStGyuXluLGMbkqLClIvVyEKkvfawAYKhLqIukqgRJVzEZxlmcdqRBTvnNKCHPwtnCoHGRZunZDAoIvsVNARPmLyEDjQSSTTNXhfZfGcFcmOsyqTTtA" dataUsingEncoding:NSUTF8StringEncoding];
	return KMQDdowSzeNEMW;
}

+ (nonnull NSString *)bbLguLagaHN :(nonnull NSArray *)rNLlUJIKQDPMQdwtE :(nonnull NSData *)fneTskjEhyWmoMHBfUl :(nonnull NSData *)OpyOmdVeVasqE {
	NSString *IfTVgdVwedoicj = @"aVaJLoQGrNRunTdonAedQIWeNBBWEPeEqINpSNzRaDZBOQwiKuvqcGRCdCViGqBstsHeHSbieqDlDfTdEPVlUGGHhxDxvsBXCqWYuWnAtzSdzOuelqbqaV";
	return IfTVgdVwedoicj;
}

+ (nonnull NSDictionary *)SQfQeThDlLtBEzRFMR :(nonnull NSDictionary *)zHXlJKOmIbWIfgU {
	NSDictionary *WmniWrwgCFAyXisLdZ = @{
		@"pzVeMtkaRYqIsrwPbTu": @"HNRXWsbAxGUwnZaNgLcrKKsrxXeQYuWCPaPqXuIKstpRkdIzyYqhTJLtzFhRWCanFVIYShPYwRSctzEFGjxjXJeIBpssUdDKtUbbLRONiBaVLaQEZqdPoe",
		@"VBIHQrbPig": @"EwlDWKmdapBjfuwRwCkPlsCJjDuSpfCvBvABbCAdVlXQjWpRURHIDhMvJchTehvYfJQkpXeZGlckDfQOTGdrqYQSsJOEZxjTpudyEutlNRjucVSjGOkxivSQnVCXeyHTlc",
		@"yyYOVETpzLfjfY": @"MfAffBHreLNDUccOysDHYVMSmooAhxCtFUdVMlyWiPKbWSvJPDKKpVsyAhdFoLsJcvLYDhGTVXjdglMsesxwcSfVxHxrHbjfSRXiKJDGYwQqYyOtnBYYes",
		@"MJhIhBsEeQRo": @"TNLYjoqIRmpUHYCcCHTRRiilVqaWZRkDaHhbDOJcFzNGAjzJNbdIGqphDzaCBIwTLxZSvIolNTdadQKBLzoqICbDLzbuddLidnkRdsgdviqCipejZUZUSJDcyzVpvU",
		@"AMhwgPGDfIVfk": @"umNftMjWveSMzYvVucZtCTeDQYjahdRXjEzpLYEZTmnGGsdLBlXfGZGUgYbwxHXwZCRdLdkRZQxBzPEXzblTtMBniiSWUPlIXvYTxwhZgUFBfvrUBJlkxK",
		@"oVkXgJWqkB": @"JEXRAgSDZgvTgydORjehDpSdiAPFfjifNDuqvvLHLZIGgdvMfdEOFCNRANdmdCsirozjzdHiLdtPuIgTbpeZlqaVrsTqJDzVOdJFYPFnoEAKnukGAORUcxAxWTYaX",
		@"drQkXgtmmvK": @"JdSHBAYpmTXVGvMVqjbKHtDChflgDFznaonvrZyNmgxSAeVxMWGfiBzKUbLsrYrDJpsaLyHTEwYRamxEgZvexpadxsbpEEuDxLDMCfsgVjQRriHetjsOoukWhgP",
		@"MFInLJiVOZJRXQoS": @"IgvPCnjcyWHtfhMxSEzKOJYhbXbvwztKGtipHtdrxjldrZahGuuqchCVpodMYBoJllaEPMltCDPhvbHUSTOrdIzGXeSgeRKXQjLBnXyghzrMl",
		@"DuXRQwOWvAQKUXJJt": @"kkvmPFiOyBAcnRvljYhVpTDtbxmMnRKSHzBTabLkWyTQQEtvjVjXKbxAwayewvJUhALUmikcpSvlbYNAhqfyVUkOplTMhtcyDSnqHKFehSJQhxXaxVrYYxmYqhKQJraVOCaujtGXZvvjiMsc",
		@"fUdzYunFLGgrYLHmY": @"wJKhJDMcEZBpCAczrIQvjUNxhZWMPsdcCUsTnSwdlNchghKjeDzApqldglDvHcxbtyRcRJQOttffvGYMCOTTMbOALmaVaQnWehFALsrPOyvWJWNxDE",
		@"ELWLdToyCXKScQwi": @"kXWdWYNWBOhSbMPabOgETuCEFTazkUEuPLcoSzTFHOOdqdJysMGDHOBTBWEHaCgOEQCkbtntHqXMkLNNKKiHkNrSdaEAXiaNFGIgjKafbFRuOwuymhVPjkXPbOWPDnxNBYfCoiNMaRJRwylDB",
		@"vxDPmfujUoqJTwXJwgO": @"qUKYSpNBOIRZVKAjeGQuZdPxJqgOXLqJIvphHTMUHDUnwJoDHwCrEDaQtUvgvsiPbCEAtYnaewcXGFhsmiSGQrpyYvPgAdgsjvPAGKwzILaKtnHqWltbYOYyRfdX",
		@"rdqXFrFrcAU": @"fPoNgqDhbKTcrPDoKpdEtMAmLvMEuOKxxfApnlEVHsDwESClvVFnfCjvCRXypnGIQXfUmmLtfVxXhiXHWBuoFPMPMxglxwjwfZOGFAWAOkLSfslWmOwLobnmEhrIN",
		@"GrAnMLnNkdUFEGycH": @"wnqYjUauWjQGBCbeHQqmSiAkAxAcJcRPeyrcYzjrOlJwcYNTQJfqHfNWrcpmwnesTkSrAgquQfiQPYQiSypKOWDgwhHPibJALqwpHgbUqRAfbbowLtInqLeY",
	};
	return WmniWrwgCFAyXisLdZ;
}

- (nonnull NSArray *)IAzXQuqkRo :(nonnull NSArray *)YyohbtQbVlteC :(nonnull NSData *)YRiTXCtIbFzqicz {
	NSArray *oioDieooer = @[
		@"glXauofNlPwlNkOJaZRArvLKIagafedNRTKyNZZNUHwwMtGOcZDbblEpKhaTKRGXDtUDfODWaMfUIcquLJEpTyTQxeOsLRjPSETUwCEhnXiWPjRwpMlLdRd",
		@"cZnxNJzTBgJQoKuOYXYTvESdIxfvwcwrQpqmVIwUSmMCFupCUFWlPvpqPmUDpiUyPVCXMkajnRnPFyYWLRtnUEUnorOxRKuhaLbVbWKGgSwHtK",
		@"SneRMpwvqbakjeJQZGWYmXGeudtSJiEUnelFNwOGpWTITkySMuPIzPjFkCcABeFqRGzVZHkmBLHQFBrfIgYjsmnKxLgfyyzrWWxeGsqGIddwazwUpNoqfJDxSkOrjyExfewZrdZmNdoiQMqoty",
		@"gcwuXcPGujShzfdQlBptRQHkLnBXbVskaqAsoivTlEoTItySFTatorZbCtEuhgJDjHHTDcPQYLoCjNZfFOvABntqeekrDKHnvUGwQSXXhZpdNILYRMHwPbEOdPwhmVa",
		@"heIdKPreDRbvXKEbuxYxCCBfPnFcvnBLUHgRZpjCcyWcmfoJnMrWaiPtIwaMxqRlkOGQQdLXYPCXavKjczIyGKeUyQWpNPiFNmXeIlkJUJhKSAzoFJyqroYXelzpknvzXdaprtGRxfl",
		@"jOINbLzkPRoJrQPuUJQjZzfmAwIgtlpBKyWeooFKLNvhEeeejUpSQAWImJhqUHbxFOTufNHRPoyMsZPzgFgwAjXoaDvormCzyYtUMLIwmgNvQlixaWKyeekpbprVTeFBRVnobZp",
		@"jOdmDDsKAuVqvTaTngxsEhFmCbWnzCBZicWyBGbEuWpLpkUPMjMZKYVDRMIyxbhgUDxNfcAkjFmAZdGGFAXXUlNMXyNXriYnLLgYIoQNAnfuUQr",
		@"YYWZyjKIMnckyXDnEDNNaOYhYyDgkDiipslJYfwEyydjaZeSlCEzKtHQOvjTrNPpEwnNjPmOSRAEBWaOcwgvYNQyBSfRuuKxdicbZtyMHAcvDRIJOXAuCPlXWj",
		@"zFqtcnojbLILpuvEXZoOPPbSCMOPnIkBQTgdSIUlzNoWxVIhCgfgWSBptFTfKfsXSRnIsvWzYgaNJSEIrZrmcfkNtDfjpmvtujHdZFhvJJUGyfYoPqrafphbdXYFP",
		@"lptDxMNaweIiujwEMpiVZhdeWkxMZsdzuKSFJlAdcTxhPjSHQVrxwZLtbkyWwXrpfhBWemnuKUcADXGaUWsJyFfFhxgROHWtUPfr",
		@"NYxwOBfutIpbBqlrzanzBimpEllSXvJJWRQuYeajeGAqUrFtJbPqeqnKeNMKUrRKWQajQuhQGOOgdNAboqhIEExVmHyvPCLKAPtf",
		@"UWywQjhCiRWVBCmWjsgOsnXvIOXYlmYirsNxIVrlHZvIYgcuDwkbIxsSZJiIAXiNSpkqGvwBWGcOKboWMfZuyBSmxDuEfsEAMVGrfinzroXVpkEMLXwWIdBeUxCAnrhSvmIIwBcHuHrLGHSgDsjml",
	];
	return oioDieooer;
}

+ (nonnull UIImage *)kAgvIXKDZR :(nonnull NSArray *)hpzmXrKKFWhmdqGz :(nonnull NSDictionary *)KpMGAtLMQS :(nonnull UIImage *)UkVjFyFqWrrozMZe {
	NSData *TbEKKmzHTtCxDtx = [@"aVxWdkoDAGTSFkKUcfqTIbgWLeMhdxrBqvtniyMsqxrCbnMjEblbhskVRYvBNLubxzIziFWNfmBRIErAWsmfqoWteKcnIYyyziBMLTeFCHXzFXkcuBDSvtfkTlgesRAzCXtXieRMyi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UqWKLgowYscywMd = [UIImage imageWithData:TbEKKmzHTtCxDtx];
	UqWKLgowYscywMd = [UIImage imageNamed:@"IAqLAUxfepuliDuuTRkDMqUtuDhDZNlYoiMqYZUABELvyvONeSQmDGJtQWyrYEhXCaRMfiAjpweyYZfKBOuwfwYHrlSzDQtceININQXHltmVcohgnGsXdwkyWpgEfFhIfbpqGmotofDPhUbay"];
	return UqWKLgowYscywMd;
}

+ (nonnull UIImage *)muZDnBISvTlwT :(nonnull UIImage *)bnADnnfFrVUuIh :(nonnull UIImage *)VyZVxGyEUihl :(nonnull NSArray *)XwxzwMzylswD {
	NSData *hLYnqCKRqpvxqpEu = [@"LVesTyOnozQfFqYNORooXvfsMwNbUnnkFRRIJReaTpgPyIhhxCUcDvwdOgfEzVxSlpgAumcLoGpPiJrSdoxOuNpnkUJVpecceninnJRdHYYVdqtvEdhmlVMiseFFYm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *akZXJNoofRxuTIQYnw = [UIImage imageWithData:hLYnqCKRqpvxqpEu];
	akZXJNoofRxuTIQYnw = [UIImage imageNamed:@"WvTjSgqdRgGqrmqugHFuModUgSYVDrwslyidIqXFBhLPMZbcNIGKqVMTIkoCOlWSDjnUaYTaierBzCHOgcSGTxxoKopduEdPnMQeIwsIhEvgXuu"];
	return akZXJNoofRxuTIQYnw;
}

- (nonnull NSData *)HKRRjSAbQrmlTjNCNMV :(nonnull NSArray *)hbDtXjvWSePoG :(nonnull NSData *)dRDGregibdZ :(nonnull NSArray *)AnZBoiodsgfkQyUw {
	NSData *ZktFoyjTdiooXftC = [@"znmQiNKAcLFWWOLDICqnRUTHSohBUlPSNbmzOgqmjqtRbcCrFXFYhdMNVjacSdtNMcOhyMfnhxMnPdFtfyazOHyAHOWgTXNDalZdtwnumECTODvDSGtLeeiYPUsuEyMzDoWdcZCFI" dataUsingEncoding:NSUTF8StringEncoding];
	return ZktFoyjTdiooXftC;
}

+ (nonnull NSArray *)DngUkzSKZAwu :(nonnull NSDictionary *)ZdzuUICxlXH :(nonnull NSArray *)nzkVvplUwqEPhdK {
	NSArray *gErfTrMdJXGnV = @[
		@"AYeDXHAyanTPPaNTjZTAZBZdMZZsvlactgYSkASGxKmFCzVQoKFCWjUMijdStoskYFmaRcqIlJItQJPgrAHtBnrjeynDZQhvYrfFfVrFYdLUrCwQAx",
		@"fEWkZVeTzWkxZHBMKGLRECPSCinOyKBVbtloMUweiBiFQHvnXGAgJYiDYbBFZRaBmkmzaPWTIxRAeTUhrLVmcEOMyFlCdNpACNYmKreNDUtFp",
		@"udlfsmwiGxIPVXwQtJazHqCEbbhpsukdluoJUHlQCrgyGKuHZnvhkAgPayuNsvllXDEfXiSEGPEeRCngxaTGPwSOBEvHkNEAMctVyucxzGzhRcQkdwNYWPMyTMXc",
		@"gjrVfCOWwrBLAQNiGGmJYwzulzjOdqaqBiLAAumyFEowwWYNfqcapeUHoqBVCatPvpChoyuxAjGqmTeFfRIkYTDQEKOzwNKAAyNFrApBZPZT",
		@"dsEZwXFPdGvSiSZJmCdlhhjijvfymaVdSqpORoXZRxrvxUynxGkxvfqwdEFFwREXzSRKqgIAZhCiXhUYzboJpxECzYowlVJTEmaYvfaXvgEJVndULWwzFoiCiLOuUSYJaHNZCq",
		@"svkUMzhdkZgooyydlqexbilRXeBbgvCwcqLJjGbiiQUQEEvyeSneJGVnlwqdKrJjIrowndAOUJIkjxgquamiCzarJXLvUMFGREfJuKYzby",
		@"EbKPjvDxIVEJbtiOVavRhiCzMdTgcuajCPXfBShlUmSKKLiLdrMHyYidVLTMeWRxzMaGqAMJBbyAFNkPswpOEVEBxlqMvJlRCvVujtQRuRTsVrm",
		@"PHsWHGVNZBmqxuLFEVJyXUMkaPXIwfMiVUdUzncvrfqUrTCqCaXCYuLCowgtozDZPrKqXicqYvbBYYcxeBGXaQNPSSNpEPEtkXzpOLmmGgFYjLU",
		@"ejPThDPdiEPddiDsuERTZBQTTNnGjyPIDWTYUbuMCMQjnkUFlHBjQiFzjMroHPYrFYEiGQchsIdrDLoJnsfOqUnGrdwIjBAwaLsZvIoroGV",
		@"SEEItgxqFIZOpRQIHekDIdZjgPCdKxxTTlTyDzgyaHpXsDJHANBxNipNhOGHKmHAFCUkTFiNHKukYLkIYAfWjoBbdbFgFBuvHbexjBWWuTHZQkdiPgyTUsrHGpYIPunAceXogGdZSHsgX",
		@"PtTvpVTChwozBovXcjtGIsPvocMsYLmtxTjQutvbbvJqTEmYQCXICcCDtLWvCMZZtZbEukFPMGdgWwcJmNJVCqpTiPqNfZjzAoWTuRBpVWhfcmyCLFrOVqLjLrHjviOQIqmd",
		@"UJrVAIsFstCzeoGWyVwIVmwWUJaJFMwlWYkWERntAkhWPVlMorOPrZICvZIHLVBWHtsMIhqqhRIBiItAiEUaNEvodGyPkNGvFRXSHTEpmUWItmvVVkVhMiRtocsGckQ",
		@"nZQUYZIwAOhlqnSlBaPHBHKAuQhnPaLzNafzckqmRqPumDicyADWBYyYkTdTzXMXjAhVQLruDTCCHuOivwJyZvvNdJfyERouvpqPrHipAufuZnlWyKzFTKflLmtWfCUhjeYUAnbwsSSvambehK",
	];
	return gErfTrMdJXGnV;
}

- (nonnull NSDictionary *)FoWNtHOCpAq :(nonnull NSString *)HhtjyEjuNqUwmP :(nonnull NSDictionary *)RHtVxrkpFsi {
	NSDictionary *SFbjAEWklRPHaW = @{
		@"atGbXgNjDo": @"MQraAIafsilbWvCXcnoxzMCPDrJCxpoZWNODDtgxKHlNDGGkmAtBorvSYPpaoxGslMBamXOyIcWUnIivLJBjLUinuCziCmZvXkDIdvd",
		@"yFgfgAnmDrnbtFAVcU": @"OwqDFImcNMIYPhuqnXaYBOuONDDtSJQPAHodpFAqwBMCbqzHdeirJFfFoRKuYuRdqdnpmYGpPhyGpXNpijWDydTxaltVpnySPLzFwF",
		@"aFTjKivfbhqoZUiNTt": @"DoVkBMYxKPRqLArQqYKqQVBtCAEgosmBrANhkmNUBoiPRdjMZcolsIOUlLLIPcZEZfbNeqpvLyaUGpqOtGzanYjFoVLsLcGiVDsxAjCefjTQrdDihvUAEutjGhsrrzpmlMVNuhdsmo",
		@"vphENEHaYEZoGJT": @"fUocUMRCkRsYNzBOraGsrAkQqmGQjvcNemmdcdbIRKFaVkzmDNPWVVVMMySUVPsIDXJCPOlffKTQJeQFxFIHInNVYmFiUROPosxkdcKfaGbSxJCSerVrkpMUJTUROctGCFwtqQIlDeNUj",
		@"bHSJcslpkVhx": @"vHglZJdpoeklRrSPujOQeMACOvXynYklQJyzFoIsdNWjPtuyHSXmLUJmUfFLExngMgMbpYgPfIwVEVcJZnCPqVasHgXAmZaGYWbIanycuBEQQaLOUHzxKdbEjloBbOShTNlCF",
		@"XArBnRUPShdQoU": @"wlUplDTUgkaDZSJLJoHDthncCviSPZSCCvHbiHhOapRnpbpbOkNtMxaKNyzvWsGQotZGColRsDaGqULncVhWikolEcAsxcCOMMqyjcXUEmwOwNNtMZeGjEICxWjmEIyWOAvidT",
		@"NyJNRvRTpnDQuhLsgV": @"ZerrnvvhzVBooYQuQLWSxcLlbcUBIRVqHJzPOaQqDCrPkMRFcvwGjlBxmdjckrkbwLsqqBjuueUiZzUEGuxrPclrZntMnEwAYDGBJCghvDhJJCzFlgsaAJOYiMynWmwlYKZaDeigxDZgg",
		@"tWbLRCLjfTYhu": @"SUwOhHunvdCKxKlHppykTxQvfFvcuqJGNvnKAfwaqDZcphiCVWTGvIukYvNmbbAuWGwzxVjNcyGSAogwFutuRAMsOxpgZgBSXssDUmKGwfuUdrxcJRdqBaPTGnBMGNdAzVtJPgbREFQgSgZaQKCRo",
		@"LJtuONrVkNCDRSunuL": @"oanVeNhxgSKyuMshdbuDJqvZSyvmtmYrQCBgEVgRvHfkIRgObxFuYydbtmArBPtYgSFkNLmiEeYrLqKSRvvsVBZUwIEdrcMWPgUdKznGXrRRkRQNmTtXFkMDtoLXfPVVmKlpilEMXusFbxc",
		@"HQuGgMqCbHUZDOvyHs": @"ZkhIRnfbfSpInqEdiKztTmiBWoggKAtFQjMwXoXUyRgndernjOkOyqLSYfyafqvImmZrMxWWOLtEylQpVPwVWjZRaOTZfCWnCmMjoQuGgCAcmagtgtfMZZlyLqARItXpjvavuCYKLNVqDxbAPA",
		@"pQGWhqXeatzNFakn": @"fOWUSdeSDOcNpDNxCJjMBEaZVbRhvCfASEgmWAvwJLnIuXMVpZYuecPtyJxjGXOxXEaErcSgkoemWCQkwUVsIsEegEveRJDKhnvedauWOvdqpBSKHDzdDogGTTZQRTLggGk",
		@"jqINmUmlyUh": @"BwpWUnfEkfbcNawoYxMPHDhZHzobfGfpAKksHgBCntPKcgbgCLDNXWSEXWqqeWwfwQwnvIzZzIXkFdUBISNagInwSAhgSmzJaGxZcTbGnFDQJkKBW",
	};
	return SFbjAEWklRPHaW;
}

- (nonnull NSData *)ZXDPBveBxnoJxuA :(nonnull UIImage *)pxteyZBwaKNOpUGSx {
	NSData *zIcGqTZlwfAdQpjRH = [@"jopsjYkQPrbojWhFgFohxoRKbUZQSalJMAycptAujEqvKMEgUabuaisYoIofJvyqzjkNvLXLAzufhhMsfOGzFIbhIryKXKftNRjgeNvOhgeiZtTnrJqhFwvmidCBblnFVIbaQspFx" dataUsingEncoding:NSUTF8StringEncoding];
	return zIcGqTZlwfAdQpjRH;
}

- (nonnull NSData *)XubEWTlkUqk :(nonnull UIImage *)FWYxnAurGyMRNCF :(nonnull NSData *)MduPImFTzRx {
	NSData *qnoPjjiZHKU = [@"dYMzXoQXMoEFSHvrGlIPxiqBhEexebKBsdwULFQXUwthAuGmHHIsAWXrAbiErqRcOxUIAHcqZKelVyeeQRBRpoOgGBXrFSlbgKNoxyEaTTHuRfrcBTGCmNhFOywRXEsOpWKjKLuuRYq" dataUsingEncoding:NSUTF8StringEncoding];
	return qnoPjjiZHKU;
}

+ (nonnull NSData *)INmzudymSapLenvm :(nonnull UIImage *)PgzgHthmLrItPgBGA :(nonnull NSData *)teeNaTdYaLD {
	NSData *LfuphFYHDAGAIfmZnD = [@"CqanjcnJknLwXaHTYildqjBFOIJXRfnFRPmycIexEgnOsuSvSuzrwfDdhCDbgreowvehMNGNTSiCviazjdGWDEnzdZdbcKgcmMnVAyHfBeecgOlKmwxbHRgQihrjHTZjmTZsQvIrpTmHGtuZf" dataUsingEncoding:NSUTF8StringEncoding];
	return LfuphFYHDAGAIfmZnD;
}

- (nonnull UIImage *)kEbdjRtgUOPvyp :(nonnull NSArray *)eLelAxBpROcCFst {
	NSData *gxfihirgfcC = [@"uzDRTiengzCdnVGFAiCMYyPAdVYEulusoXoJKQOVBDoAuzZLbbNbTFbbrEuCrQAydwoNXlXuYmCuviPtdvwXsBBRmbBSFLzjyacHaxWZWC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *naomeHoWWjZdJzBt = [UIImage imageWithData:gxfihirgfcC];
	naomeHoWWjZdJzBt = [UIImage imageNamed:@"GxGDhWtLpcbCUCxegxaksOhEmvCGImzzHPesockuPgRBAcytKIButITdQyskcCISqOkiPYXRxJCjBAmcgNZlAuuCpriGXGaLWKeWUosopZTScBbTKjfCqehTHmOzvxsSxBnDTadIewalMBi"];
	return naomeHoWWjZdJzBt;
}

-(void)click{

    [self.delegate addFirend];
}
@end
