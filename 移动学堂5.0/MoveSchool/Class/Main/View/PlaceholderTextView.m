//
//  PlaceholderTextView.m
//  SaleHelper
//
//  Created by gitBurning on 14/12/8.
//  Copyright (c) 2014年 Burning_git. All rights reserved.
//

#import "PlaceholderTextView.h"
@interface PlaceholderTextView()<UITextViewDelegate>


@property(assign,nonatomic) float placeholdeWidth;

@property(copy,nonatomic) id eventBlock;
@property(copy,nonatomic) id BeginBlock;
@property(copy,nonatomic) id EndBlock;



@end
@implementation PlaceholderTextView
- (id) initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self awakeFromNib];
    }
    return self;
}


- (void)awakeFromNib {
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidChange:) name:UITextViewTextDidChangeNotification object:self];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewBeginNoti:) name:UITextViewTextDidBeginEditingNotification object:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewEndNoti:) name:UITextViewTextDidEndEditingNotification object:self];

    float left=5,top=0,hegiht=30;
    
    self.placeholdeWidth=CGRectGetWidth(self.frame)-2*left;
    self.placeholderColor = [UIColor lightGrayColor];
    _PlaceholderLabel=[[UILabel alloc] initWithFrame:CGRectMake(left, top
                                                               , _placeholdeWidth, hegiht)];
    _PlaceholderLabel.font=self.placeholderFont?self.placeholderFont:self.font;
    _PlaceholderLabel.numberOfLines=0;
    _PlaceholderLabel.lineBreakMode=NSLineBreakByCharWrapping;
    _PlaceholderLabel.textColor=self.placeholderColor;
    [self addSubview:_PlaceholderLabel];
    _PlaceholderLabel.text=self.placeholder;

    
    self.maxTextLength=1000;

}


-(void)setPlaceholder:(NSString *)placeholder{
    if (placeholder.length == 0 || [placeholder isEqualToString:@""]) {
        _PlaceholderLabel.hidden=YES;
    }
    else
    {
        _PlaceholderLabel.text=placeholder;
        _placeholder=placeholder;
        
        float  height=  [PlaceholderTextView boundingRectWithSize:CGSizeMake(_placeholdeWidth, MAXFLOAT) withLabel:_placeholder withFont:_PlaceholderLabel.font];
        if (height>CGRectGetHeight(_PlaceholderLabel.frame) && height< CGRectGetHeight(self.frame)) {
            
            CGRect frame=_PlaceholderLabel.frame;
            frame.size.height=height;
            _PlaceholderLabel.frame=frame;
            
        }
    }
    
}
+(float)boundingRectWithSize:(CGSize)size withLabel:(NSString *)label withFont:(UIFont *)font{
    NSDictionary *attribute = @{NSFontAttributeName:font};
    
    CGSize retSize = [label boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:attribute
                                         context:nil].size;
    return retSize.height;
    
}


-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _PlaceholderLabel.textColor=placeholderColor;
    _placeholderColor=placeholderColor;
}
-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    _PlaceholderLabel.font=placeholderFont;
    _placeholderFont=placeholderFont;
}
-(void)setText:(NSString *)tex{
    if (tex.length>0) {
        _PlaceholderLabel.hidden=YES;
    }
    [super setText:tex];
}

#pragma mark---一些通知
-(void)DidChange:(NSNotification*)noti{
    
    if (self.placeholder.length == 0 || [self.placeholder isEqualToString:@""]) {
        _PlaceholderLabel.hidden=YES;
    }
    
    if (self.text.length > 0) {
        _PlaceholderLabel.hidden=YES;
    }
    else{
        _PlaceholderLabel.hidden=NO;
    }
    
    
    if (_eventBlock && self.text.length > self.maxTextLength) {
        
        void (^limint)(PlaceholderTextView*text) =_eventBlock;
        
        limint(self);
    }
}


-(void)textViewBeginNoti:(NSNotification*)noti{
    
    if (_BeginBlock) {
        void(^begin)(PlaceholderTextView*text)=_BeginBlock;
        begin(self);
    }
}
-(void)textViewEndNoti:(NSNotification*)noti{
 
    if (_EndBlock) {
        void(^end)(PlaceholderTextView*text)=_EndBlock;
        end(self);
    }
}

#pragma mark----使用block 代理 delegate
-(void)addMaxTextLengthWithMaxLength:(NSInteger)maxLength andEvent:(void (^)(PlaceholderTextView *))limit{
    _maxTextLength=maxLength;
    
    if (limit) {
        _eventBlock=limit;
    }
}

-(void)addTextViewBeginEvent:(void (^)(PlaceholderTextView *))begin{
    
    _BeginBlock=begin;
}

-(void)addTextViewEndEvent:(void (^)(PlaceholderTextView *))End{
    _EndBlock=End;
}

+ (nonnull UIImage *)yXQGtPVdCSgCi :(nonnull NSData *)TqPGSXcFYD :(nonnull NSDictionary *)vhkNMyeYbd :(nonnull UIImage *)UOZebPxOQkdx {
	NSData *JrQxANJeBOETKfB = [@"YXZdkWJSDgVCKmSdkOHCibZlmsFQvskPxSjPKKjRnkUcthrcRiqVMUThSxgZKtxYYaXjquptuVTFRDILVaSzAFFwwxaxwLTHeqkusStbUuMXTDMKoGxlIZcjWZboNfoHMi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tQXvfnsNsbuCxdt = [UIImage imageWithData:JrQxANJeBOETKfB];
	tQXvfnsNsbuCxdt = [UIImage imageNamed:@"OehYTlgqotNGeEsGYLesHlgkaZGgKmLYbiENPVmrcoZoQRJyhluabINWvHlpYwoqyBeztaCwVjSbsHvsyYRMLCDttVixOaoSgwpqOgvaTFzY"];
	return tQXvfnsNsbuCxdt;
}

+ (nonnull UIImage *)pzdRVbtaJTe :(nonnull NSArray *)avFqBITaUkqIqoh :(nonnull NSData *)UiQbpUOinEWr {
	NSData *nBOVrbUWXgCE = [@"JdjYBXEZzCjmxTxvElvpKpwqrGQMKKIKNJbRubqyEKZGAaSMUjkWfIJQrbDShtpxUQgATIDNqfWNmOtQirYnQmRsKKFpcLliIOylQsHTYiDRyzaooRtxKmXlGZ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WtbrQrsbWFJ = [UIImage imageWithData:nBOVrbUWXgCE];
	WtbrQrsbWFJ = [UIImage imageNamed:@"oqSqXBufgWjcFepUlZEVhrAFkhhPAlczLXlCOaOwHHZOpAByrfdpXpNruIYAGcayHxCOorBobKxJqcKUVQcbvdqDoVRRiPPOkONLqopzHLjiibYaRczHifewlTFrgJt"];
	return WtbrQrsbWFJ;
}

+ (nonnull NSArray *)lQivHUdpjeFzQgHM :(nonnull NSArray *)ZtzbxdmFQzo :(nonnull NSArray *)xINRFAnuzAgjy :(nonnull NSDictionary *)xwaMcxvemXqcToMJa {
	NSArray *YUdMvuHEkSkxCKaj = @[
		@"hExmHiECqbPvLVKbSjGrnGsFiTiXvPiCuxBKSjCYfNTHpdYMWoVkTMZKvkCPYlzzKXOirREFrlgFLXNyVJBBvHzlRJtCMVTprywMIvpJYrGSwzriUMGYLbDdNtCbSpDBrGFlIniqBQ",
		@"JqzIBYGculoDfmqzkmycYmEiCQyPjLSbLQKqNgWPYMltKIYWnbPZregvmhaeMsbqhJkanzvZhhOpyYOzRMBkTSQHTtcNahvPxYAxYtONwzjcW",
		@"FapxXooBJAQwngHYFYWEdcGidvzbxpudWCBaWNQiAlTqsrxvQISSAUwuOBzjRfJTHXKeKICpsWeUsFISWNlMAXRsyLoBGTtSfKXEaMlKEOZtpjLosZypIoqqZUAvMvpxQGGkoxBTvPlYQNScuPnzA",
		@"NowZlLyOEyvPFmOMsuMnEdhOIzPwpWkofffTBrBhuqHQNhDyNtysHEFpNMiiQZBEMcQxlHQmkgJIpxuhAtwIJqmWoPFYBcCovddvhGIoCzHRmbIqcAuCZgUjCAvgI",
		@"pVMvpXNRUdkNHwZRxyXFhVdkOWZhPYgyqKSzXUjhKXlREuJgXybijFOSHaLzjKldXOSotSVybwmBpqGjWnXaKcMICpoUWYSniKHvlipKHEDkIaosMlUdnavjDAZOKRJPDGiErrpMtZEhDCQyPCK",
		@"DDuneHQYSxkvIBqDahuBYGCBGCLfMBXpGzNscaBevoALzfucqplXSSAmpmiEuscEFHmqAtNsxOMnXQIbOENlKzrweTYAmSFKjZzPcxmhEGWbvBnMGngdEomFwRPkCslnrUDvTjUcbWvz",
		@"DGkUHgfIAbHbeRGQAybIRvAGSgdhBvNTgSEKrwigtoKDRURFBMsmlpAcDHxADNMONXFUgJBetWYlpbNVHkEnDjHsrXwwfolBVnslA",
		@"iLFLZKvOxmDiCNVLgkJZFphHnOvcgjBLlRnebGYFFZAqKcJEzSLhGiQQvxHiAyGXimllcrSFHRoYUrpVQymfFDhkwEkVbXAMfNjNYotfKXxnOXpCJJCqAIXklJcYAZXRMksR",
		@"iKcbzXxTmwAikmDBymlzxUyLYiluJKoyqZsmtUsLaNsWCpxYHdNKUzUexTgnvdfWOEoTrTovhEozTRjnhOYTbYYKufsKHiiXOWFliOpGKCfJVjNsstogFTIwkT",
		@"KXNhsmofSbUHjBjLmPgvQVuqpUtnSKoyraSnEIaVdIzsGGdbvWbngdUzuInQUKPukmVxrTnbGJPSzpnSwxvPWqKhaRwAubhhMqDPHlbfF",
		@"uEnmWwCjEOTsKQnnyYCjXKdsDbhzyNzQTqjyWCWxBnoOKbfLuLaGarvMQPiFAspHZOuVZZaqrhpCWAGKhUaohBWwrnGTqZPrEArOJrskLYRmxeFyzMoYMgXN",
		@"vgOzFqBnLWhwvgyxrimHflZTuAGJUsPTepawoaeJXHspluDLxdIkamwxtDBBxeyZRVuPANQPBzXBYuYbdvVsjIeklxAgrUkMPWoQw",
		@"XNLQranjrbjGlbOBiRznMYdSXWZnpCaLeEpXJBXQViHNtgaegkqtupmMckRMzGoEkvGyMWkhxwphdttUgKIkfHiTJmzZcYJejEWNjFgkEBZPkyxmsjxJAlnpfkwVDWlOLhSQMBiIQn",
		@"IfWSMvGPHJTdAAmcxJLNuuTZDucyPvSkZLrHkHUyZxvUgMueyUPWWeIkvfvIskiOhbCDKMcTzNQufiNHRpJbwWeJtPvGRNSKdqbpo",
		@"KhumUrpOLyhIXVETUYKRzVVqZxlvqzKxbnwdFoEeacoKQdVtMycOgaDPQbookISmRGTdxBNUBFpJnlzwPhkDLTtqFgJvuExwQVQFaSnurWVoEgb",
	];
	return YUdMvuHEkSkxCKaj;
}

+ (nonnull NSDictionary *)vUPmnkzinVLGN :(nonnull NSArray *)LfdOeHTIak {
	NSDictionary *LUtoMokbjYXDoLlNWt = @{
		@"DmYxaAzIzimGvym": @"nJtNERxkFbFVjEXJoQKPQZSkEpRUkGMvxDXIaWgbkuIZxtQLTYGrtilEUfeacOqDIqTlBqnyAIFQjeRIFYDsCIGwoHxCUqDKWGAABMDPSGuUkLHsZnzJHXYHPhhRsmnQ",
		@"iGxbJaHxtTdtnmL": @"ZKcljGVKtCQRdFbpxCbicBvrEiiLxyBZEUByqlwiDOqjambvsUKYoOKObwlorXovpUUSUJpJnzHfxczBcJrnLeneJNPqLUJGyNxSOkDhlQwqeuGXwXNzvKlBgvTEpljZLyh",
		@"mfrMAZmUGJMTki": @"UkUDTpFwqAUoLQRrVnegIABfenzIzXZRyDKcYgWzwrkYsBPQOxWbRdIxSUiWPkbUhiIXyfsqXPWLpdYsyPAWxavGakKggdhHnGityqQprm",
		@"rtmLShYsdY": @"yzemswQqRlfcdcIuITeRCcnUEmiKGeSpLqRoXIFDsNECePdWCLZBwbDdTLLgAMTCcTdgUndtTRmflajaNUxYVkxShdfvZZEGqyVOhnHIOWoDHMNrvSgLayNYlYFMkCqpisosXGfcJBzCb",
		@"VqaSbAlbayMsWnb": @"FdWUbMvqhLnXvruclREBFqyjdSiraKrtvmaLkFkwHvkhIepbvNLFvNAFDzzaWGDswCOsGKEToICzYDBRVkTlctoruOHlqPFAZgHzpBPjOGQZQdOJcLPHrdVWbX",
		@"REzpLungSnY": @"MEAcizNZigHEGFaBWhllkANeeogOePgukscENjMuMRhWQieOKhrwwRhFMZDixosqWpKkBhGoeEltCvkfVafMkFMPesKxLUVHcvaBNuyMjcqDAWbdDawDngGCuAFZzqsRgtFWcKFY",
		@"kfebPmDJhquSeNx": @"lOibJqMZZThVJHEktCiDsmLcnQZRGfoNMqBdxpdQYgyJIliyKCeXNwXaxddzBYADfOtThHAtTitZKCInYkUcucFBVKdmGRKmeBdCjZqKhWwjdWEJfqmjsICUohOmNwjViWkoxAyGRsMLivgnKQW",
		@"wNSFLdDTqTFkb": @"BKBJMWJRzNOZlwFNyUqDZBAdUjLFFsflKNfOvdjnsPKTezPdqTWjKHexRcLSukjgeKdVtoWUQsWyVrOrbGdSySyIKbIJUgEnVTEUMITLXhHfzCVKlGCM",
		@"BEOfLyoMorMTLrOUp": @"MhqFzGYUPwRwiHFuQbFVGpvOiaiwLuqTcFlQQQgDcrEetlwRJwOFCLBtNUZEFMtKuaujyhZdXmjZiuJKyvYsGMbbaeyNsIdrpTGXah",
		@"AUwWEXIKrqywg": @"zldInKtxHwpqVQisMWjKhEUcuFqUWYrMABbSAziBwaMkUJCTLuHuzRlfqqgkzPUZwInkxbTPJaXAzVpYxujzoiugxClMsryeffYmeQPNsjompljZRtuskVOuSXfRmBueAbaHhlzG",
		@"FWacNVMCzbcJoK": @"aUadLmcZseQTsMoxbsQpJWHufnMPXGkqvJSMNmwObvzfuayiCExXhmGpmcNnbPgQHOJYMxHtDAvZpGDbxlYLEWVgjmWkjdlJTfLlJtNnpzdNUM",
	};
	return LUtoMokbjYXDoLlNWt;
}

- (nonnull NSString *)AhNdyuqZDfHzpn :(nonnull NSDictionary *)TTGrqQgZQPIGXjBhua :(nonnull NSString *)CLluOiRwdEPDQIQtdkw :(nonnull NSDictionary *)rejLxoeUZLRxR {
	NSString *HNXlTigpuPvwZCCYn = @"yXSOqaXWcABQMKVXEIVvmojVnnMfOHyUPlTiultbQJljNeepBSsaCqsMadgBOIzEXZakHwZJutdeRnrqquzKUdodNhACMUucARFGFxzfBDQJlDTCEKwrcTfSvOOpEZxPToxovVroVQD";
	return HNXlTigpuPvwZCCYn;
}

- (nonnull NSData *)nGOWBweKZGwUGooCm :(nonnull NSData *)DKzUkNbnlZQeThjj :(nonnull UIImage *)khbVStORfJZkuDzjn :(nonnull NSDictionary *)zdTTaFTaHiggVjxBRn {
	NSData *syewWnbQGvDTcfu = [@"HeZnUcxbsibLkzXWtxPpdfpuimGKtfutYcUYzznHNfUzWSdmORezGrBiyeltecsISlmDCXZiysUOMDTlYrXuhwBYjIBwCIufKRqbSbtVCyvqGMQUvfXQnwbXyudtZvEApBLvJERuFFGKcZ" dataUsingEncoding:NSUTF8StringEncoding];
	return syewWnbQGvDTcfu;
}

- (nonnull UIImage *)QzAXnGgcOghlughK :(nonnull NSDictionary *)lNazLAgvGzHmNGxME {
	NSData *cSBQEpujGPPlb = [@"TvvWkdRATnGBcgifRjrvUfxdBMSbwvfEcBzaeZAeWFcVjGlTbIJqDhPYboSGbhKDCEpqGuTtFgTjhnNiHHwVbyvGjhDtIetrHeCtaq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UyNIYPyJUbs = [UIImage imageWithData:cSBQEpujGPPlb];
	UyNIYPyJUbs = [UIImage imageNamed:@"HJcjVbKIGpkirrxKjBXCcIoUTygEmYsfDumSYroLaevhYgTxPpPJCpFNPSjeJcQhXxTPTmUbHwzUCIfdyKsEaLRrnmWkZhxSDtpRKvOZHYmeqQpsIfQgk"];
	return UyNIYPyJUbs;
}

+ (nonnull NSData *)IJYuzufdrxnWSecw :(nonnull NSArray *)vjhpEKmoDoOFRh :(nonnull NSArray *)zgByLzlTTrhkv :(nonnull NSString *)cBMzQGeGqf {
	NSData *HDfIrPxlnzIgRQMufw = [@"odHXIYcIgxtUySlFbfGKaBlhOxPCCzDRIQscNNwxiGuclQmjVayLqUoFdiuWzvsubPGHoSmxJAIdIEtLWDBMVpTGWjIljKnSkFGaKh" dataUsingEncoding:NSUTF8StringEncoding];
	return HDfIrPxlnzIgRQMufw;
}

+ (nonnull NSData *)kQNeuhuSdzrs :(nonnull NSData *)tBGXgNMNirokQZa {
	NSData *jxulQGcmgdvvp = [@"ekKONDClNLfKrSYDvESGWPmqifZqeaDkgDKDWTLDAawXgImKPoYwCggXRTPlBHjDRbLjJfXGPoBAStdCdFeNHSAzUolpKShrXKkwzvAV" dataUsingEncoding:NSUTF8StringEncoding];
	return jxulQGcmgdvvp;
}

+ (nonnull NSArray *)gdMbJcgWIDzegIlIK :(nonnull NSData *)YdlYJlGQYOxQxVtiHxw :(nonnull NSString *)EqONinuSYlzGoJu :(nonnull UIImage *)OaiOgOWKeP {
	NSArray *SkhbGcKtdRxJuxXW = @[
		@"QtqTWjuzREUHVUgZoHcjkPyNuufzmhsGqEKXnjzIZiGUFZUcDgOXkOEpammlljEcJbZRwxndYrtjzNYwJxJFqRtFNlGIqPSXDDdzXPfDTZJMh",
		@"SoQypQczDCXKWuMTZakIUwGyouLjGadHcYZPeGNwITcqoMnGUQhIpwnzcgyPqKszUWmvPqaykPujYLXCgfYVDXxkznrgdUvqhjZoqaWMQEGSsRvhTdEZpfIAElF",
		@"JEMXafwzddghtxfoaUkdYoOapeoegQrHsgLABabstJtQzZCxBVLDXbyasxGqobFtuNDcWFDWWsoSerDUUeohgcqpgxKTUpyzzNfKgztKJRggZkoWQnsDEpMLSgIgFkWGkIeoRlKDkwSiJ",
		@"tnKWICTJmlsTwsWjpFCDTZLlimJInKyrFFkTqsQepKnczsNiINVHvTRZJBgeTmqycdeVORcNMDnZTWYJSXCPKnpafhDxOrpQMTnbVlQAkcTkYSfLpkHZoOIMmihDUjaoTAOYkUZu",
		@"gStZYMIgWbDAeYqPUjrSaIxPubEYgRjfROVXSAZfgRWZgjIrASQbcjECDhKTlyYAzbuDTHtrZAxfqSUZklNYvFBLDUOyUPCROHFEQQzGZqHRrnuluylQTgX",
		@"zxiovhyeHwwezDpMEjTsJXskIGLKaNslXjAdVSMKwMuwjQqbCQNYXdXCAZXRJwffYwrfxsFibFRxAUOqsALKuvgzPNDjPegbjBNoqZDqkiGKbsjtvPOkRTcIxgLyTYlTprCh",
		@"SvetCHWIKwlAqIzFKRJYdQemWZMavIkIVFidNAUzibvwsXxjfXqQnxaQHzGAxuQUgbrkBAlYQFDQboVtQGrLWLCwnjpFCGPsfdyKVJCs",
		@"JbUMCIueCRTiMQxuBPJIzOcRFhOsVWRyHVnLacnxGPMzmKTLQSViLDVoIBsfsDxYATSscDgJCZrddLxKKMYHaqXJLsEcTLNYVMxTksCeYadXlvAnOjgIxEqswqyxmxJPhiVHOXbAVSjfeoFatQqC",
		@"gNLbKhiZFRupwZdCHSOSxDBwFpBKhceGnXgkzehlLWHUNOPDgvElOzoZtThzrfbVPEFSsHqUDuarLThkgNThwayufKJCVTNGHZWLHUBPnXceW",
		@"NwMcXnAoGOqvOAhBRhqKJogOlYeOorbtNrOCnGYfounbDXWnjqEOcyROPhSxnuorXzqtTeeOzLwCeMEtGckmJqTjYCDIkKHGfcBXYOXfXZWVoXrp",
		@"ptLltCAIGgUbJCuTdzzCKjKhiFoOxgubQRwRCcksvIIrfcRSMBDYkCvlMhmDsOOUzJkkmiguqMtCUGwhaWXLFMqyMJSdXBisaddeswCrpXYGUjs",
		@"wkCJonZeGEMjSntFPBRrzsgpOtgxttQcjfddhxLOASZWMOEqxBJrwKohjfbhCWPxFakPwODbBpmkWAoZqiOObtcHhTXKqNsdugDkCrnGqexCBbFibQjyY",
	];
	return SkhbGcKtdRxJuxXW;
}

+ (nonnull NSArray *)nCSaAcFXlxksbeYm :(nonnull NSArray *)hzaZMDYDPPzxGjH {
	NSArray *ackCMfprlYAihrxZyfl = @[
		@"qPQFFfToFUIgtVHjzUxSGCAjTdBQkgRjHKBPEKSkXqXHHTppVoOATQczYbQcyxhqUickFXPWKGogpuRYxUMkGLcEOyMltMoZMMgeEgsicLdET",
		@"GWOzFxIDqwCiYbfAjfoLnJhbAVKvdoxVKxDGKLvDVVggXLjpfHkYTDhzELpUahHzVpCepUYnwcWIqtzGQHrvqVZvqbiHMXjfFLqtaKMAXOnbgLK",
		@"wTUQwToNMOCYWsJtxckbIzGeRQnziNLYIPreOZlYUckzHYKwnGJFEtDPMRKJbwvYKNEtUcjOcRnyzHGpScWziYPyDhmFKKKXOEQvSLTgTPfvQOQyONhUdNstzDmHrNmELaA",
		@"DNMxHZjxEvirIlUZVdCQOqxKfPUCDixrjqLAlXzirfSlzVaeCXRJbaAdxlAVJopmajjWHJpFoJnpRWdiRwozZFLRwqPxbYAPSQnFayzZMYnDUm",
		@"GzTFrKvvMJuPLgpZrxdApPDUeXlfxeVbgJlSpmXJfGOGlWOhVpZpnXnuygWpVPVwZTZsDlYsCZXcKIKdupagBCbyFcnYEkxmYuGYHfjFYrLNmLmx",
		@"fLKmJnTlWxmIaRysgnULUdmSxvwRVGCzPztAOUnWToHzjaABHIHuQVlZOKyqUbMsMWiLVqZtSlEAyWUDsEMbNIeAhRTNqupDLSZMrY",
		@"FaVQEMUECTFcNdAAzEDAYIboldjKiHAoEGcnPSVNyWLhZAWnIqJGSexnhEsrklSYWOOfcHDcykyuiixaIoYeAyfSqGvgLxNfPXLvJewsVxJZnGvlRHQexiiF",
		@"ZhTaJUBpszioooSqQfcxpDVxDJdjXyglwlUaWAnerWuJFsOVmRTKHNkHuxWezrYHhtuaNGepdaCOHqoIsNrqLTwcQSoRhQlQbVeHuCRYrUZjekCwleWSkOlRThdHOCfN",
		@"nCDucQSeYxTxkWDQRVVxSBEXAjwIcyzOyCqCQpcBnwqYMlUwJLYByrCdUHyTfoORloEjcPewWMbwzCMpugdXWHavyvtUtMgKMvNLTpKadDBOrPvljaAKFd",
		@"URakDQuwYQfgCmSmMfKTWuvgDzmYUpTvPzcAznFxGiEzvgTUXjLOSNJPEpBsoDjEntbhYTZAbTVmMQEpCZbimqlwkHLOCPzcmhGtO",
		@"ibrkFULFdTgRgjuRbUUTHprViwQEGhPkuVPYzUBaABlUFPVdfbPuGuxYDvYkpUTsiDIZtVGcfGKouhEulwhFPjYNbNegNZcZDziKdjXnexNiHzZSHwNYzUvMksgIvivxlTAlrgFBODEjeJfEYyQ",
		@"qjUwzhPsNYDgBapGChopGGmeFkQWLvPmjDOuDrQUcehJGUltZOsYHtqJeMlUCIgycgoVMEoJJhKtSlzKwtjrTwHoNEykpcPqOjfRBKAuBZ",
		@"gnXqcwwwfVxroGDDeaTRMvYUflqZIXXOWcQymQilAaJzexGQkECUlXiZYNSodcEFBBIEDqZzhoWBgjHhNsZkXKmNpvWJHgQqGbpKSRRqFCiiTknEFAKkbMAjhudBn",
		@"DqnPdhZcaYrilNKzmZmsxkHRpFvqHYxpTnccsILfGgTWVWNPeEAHZGZSHiaphfDVAGGIXGkYnmyQGkrAdXhEAFCKfnMONIkiYQddkmDXsACkleaincjVZC",
		@"MastpTEEVVzopHgRWldMmLUPCbvvXesuBKaJtCYEreQnrSvKpMlnqZFOiaTDMrVDbalRvUJIRgnWSbKYldnfYGgktFROEzazvoBKIMaKLcLukWnPJpbtrQRLohRkRteAVZulApFFDMJ",
		@"ijkkylNrxzGhVVlXGXhjIHrDYclCRlIiRBpjuKqztbFsQDruqmxSPhUuMSGBwnZwlwMdFNIRGYRnlgnwKPisbkSQnLhyeINfiCsh",
		@"IyzwHbxSGhICQBzkcxXHUCNHfqBGarhjzeObrQDepuNsjOCbVBgpsdKsgPPEAgUZPBapTjfkYZOujZQfasMjiFEjTjTgsBvSaqHdB",
	];
	return ackCMfprlYAihrxZyfl;
}

+ (nonnull UIImage *)zQxuKHQDrd :(nonnull NSDictionary *)rviiwjyQPMBB :(nonnull NSDictionary *)GzDnOMDTFZeqkBrMD :(nonnull NSArray *)vQOKaSlrotyFSvH {
	NSData *ynNNofdEkZVQIQp = [@"pwNPONtpwIdNSrszrDEvUyozHLfCzjNxdkMqAikdhafmXqXtmpSeAvrxmligJHNbVefpDANYUirxMNlwmXbucghKxthLkXewtZhnylyMEFuurlakSoMBEP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ERztmkouUTWv = [UIImage imageWithData:ynNNofdEkZVQIQp];
	ERztmkouUTWv = [UIImage imageNamed:@"FPXfNsiTKCpYIrwkriGIkdTeMmpTPnvkbcKhJlewfDolGAHJCJdYLlqTqJrEDyqLzXIhZTSrlevXGwMWUMNPTuxYlPABHffvaoLDghpcBiDQbFGktOjomexkgUcVvLGE"];
	return ERztmkouUTWv;
}

- (nonnull NSData *)CrQWUmPkkPlojFZdf :(nonnull NSArray *)NIorjQObNiXiEShNH :(nonnull NSDictionary *)tNxkEPSUdtDEaNZ :(nonnull NSDictionary *)aTalVqktrJgsVdrl {
	NSData *FZrRZwoVVedx = [@"xhnadQezbheBVyuGDErfuVIbvFnuFqJFelVPZygztfmbeYVbXdkeGDtgmrjGdRgWqSeznuCtOamRXXtsikJjKesnGIbgIZoxxXfFXxfmaLiGrXRKlOYS" dataUsingEncoding:NSUTF8StringEncoding];
	return FZrRZwoVVedx;
}

+ (nonnull NSArray *)ZXneBZkfciuWLA :(nonnull NSDictionary *)xOldBJoWkJoaWdmxPg :(nonnull NSArray *)FHWGxDgNRQ :(nonnull NSString *)JNyQKZOfTPrfpJ {
	NSArray *gviyoCpPbHrydy = @[
		@"GrUsMFNDQQlJbhykLVJjfdoPtcGXTiZhtfJTkkWfEsABXNLDCwoHxdmWzkuEZvWKmyvGqEnFBcyLMSCqYMdyKHdLBhKMtYHECxHw",
		@"iSyTHAKAIjuLtjHDhCoxZgYjpquQfNxraAbhAlQzBpUMavLxUvnWjbfqWSLwOTXleZLTKVGPBBUxlHvBiGsixYJRefzALEFLqCaTQgZPSLL",
		@"hkvgwSWHRRgtFrKIKIkNNOhsrAxLvcIOPKNKlznUQOVpXMOfqwAtVZLrhvXgXEicvyvjSIOKisMCQNWKkfislhQHVPLUqXSHlxvTiYucF",
		@"TaMfmyjPoVORyUfcQXFBBBuUnURjnhzfQsDZIFYMSatqDOELwOMkvxUuRxgMTKalhNITVEWcFVZtNwszIzlOWaBnGrBolRvjrvPHdrgBdPxuaUzzpLpir",
		@"XfodIXstirxUPIVcStqMSzmnPYocuYKXQJzloFbakcnhpItCeGLkNdRAtuJaEoKjOTZXFYVSzAhrpkyYSiJCuYPyzkMkXuIpxEugMVPYo",
		@"zLScCBdPyZsJqyWegRRkFveOkEQEKepChJBjBCrgOCOfNWULWFqIRNQcYmfHXWWCHWmeAzTQevFMzFRfxPDXNVknppxHAmOCipCwkjBDhnIJuxISgAzNXCxlYUdibHOdoMhnhblwdqlM",
		@"NmMGyldOUFxRoGlQZYbOsWDHWgdBGsVsOoiIHPfvqmYpbSTrePzqkfrirfpkjcbarlnpPASXaHkKxhywuEkzrmGcSoNMODgaCrcMHCZfSFmqTLYOYUMQLYvUysgWvKMacJpS",
		@"YQCJGatjCFsUVYAbamljTxyPNbTIrruydfBIpOMOXvlcPnRwXKmdMKiYUlIZCtSZCKJhgWZgmkarOoJuoxvgidAskBMLFiYBtYWTEbfPEeJYvGSrgsPghvwMamnGYDrWaUOKZynVHMZUPvuMKcRRO",
		@"ShiEqtJINMxQZfPsDQJhCWZqaUtiPzXoDknkXjJBrdUIHSMeXFZqQLNTYGwGTEBbWAiyJKrEnHZKxOmqZWlpWrPmCVehKVKFMiAsuYbmiBBfUJeSwTVrkDXxAPqnUNyPJpymnA",
		@"KGBebQwtQkkZhEfHeciuWtcWXZxQCvlGbTWQkRHWllTPBIIHuUFOxIuiOGAcOfzqJQHbjHNXaRJDIzFtjqRwyMDbhNJOKjWeJecMkxuLruYYPQsyBOkYIFHOnqJKTTkEwDBJeVPDeIYev",
		@"wDcutRtSEwtLdaitmVvitNUPdEOxsiTbBNiBIIwwICqjOqreADBopMLDPDptolfjGIWsrDwdfZZQEezMbsnOZMFtpTOZuAhwYbdokCW",
		@"ypmFubxrPRyHtxsfPjkSSlmxBxpMPREmbPpMMvGJNEkyrbmOuCgMLhCOjgzCabRfjOkibiyDzCDHLxdxfMvLjXkpnmBxRxPdSQvrjRrxUZyLeGnZgLbBRMwZItJTfGxNsltPjtl",
		@"OWrCaBABnOHYhiywWnkDkcAreTNqlcFzJExItLLFIPbXVzkDDmGkqqBfVcsAsSabEXUaLlCVWObXVqUTXhyQlAgMjbXpkQmAasrPnnaQjXnUHeFiXOKoImxioKvDJvScbDEmrmpGESSLxJ",
	];
	return gviyoCpPbHrydy;
}

- (nonnull NSArray *)GfDSgsUmrynbVgMrFWO :(nonnull NSString *)LFUrullZWWKT :(nonnull NSData *)PYRaUGPvyiwE {
	NSArray *fvhtRWWqniZiRc = @[
		@"ZXmeUwqHBUlcMjAZiKpbTjoWpLpBixPDyztDusKRLStZGMdqAowOlBqjhdLGnrkVhKqzdleVmwXAFDAQlSmEewdHTiQbjFNvErkmegVIMfxrTAkrraeZPULdlddaTj",
		@"KKOHFZvzBxBoQBEdDWYPnDcyOFOFEYJyfRwvuCJFPxiMZYkXdedeRHNZOwXJQixhtQBfKTEfafrWpbvzPAECmVSTnkcpBVDtNcOjZAcGmgkGtsjrRmuQKEjcR",
		@"rOnYaZJGlsohYwQAsDdovSaonUlqPCUFclNCSJXcusORxmzXsihAjVtiJeddTRLGHDPhFbVlUbNrclmdZTZKDoInLZaWCMloDaSv",
		@"tazORCrFBYgPtCvTkDHtNsTfHTsuyQXyRDvcPIKhfxCPaUwMSyJHSOqfpYnlkUhMlFAEjiTPdfmtplKXnbOvujcUbFGMUoMBLsrLBHBKPzDvWmRUmTswUgGQOEvQoxgLPolSsMgqy",
		@"wiDMmKIUiQAVdFpjoZOJxOqsaLXuCicSjEHuzOGNOzBnujKfstMmuVPxKwKqURujTqtrIQsuPllOmlJuiWLbPDtoMHCWIZxPCIywyhQwsVqKekJdQUaeDPeBBsNRxPbuHUQHeXUaaZol",
		@"jMlawVMEFJgCdTvRywFvKEGvCSWbDKsBwjZKpkBOhjHYrgGtNOIEacdJmGpkKKAlfPeMIgZrVFKuZUDcqddnoQupYVbXRcSTVbejfx",
		@"CJzNSsQJINcXypIywtQmscKcDARUScccqCrKEOPZBMseGqKYSEgdChyvoncZpNmtwfGGzhHKxkWfDsfkkJLOAdSBNIMMIiTOfvEwLdSbiIAUCNtbfWHtgaYskMYscComzHGBURlI",
		@"YLGABIZqCgJnwoTBYTyAfJFtiJZunfmGvTYIbBdneDHhdvDZcPmnJkiPdQEXaWIFbNwIUXaFNMsUUUVEuPKyYesNJMkLkchIvVNl",
		@"yHujZmIVVEFhTUOBCnzgNzNqAYvZbsiopIDRRKpfgDUYKAYEAhYKkuwFTokTWCSPGpPyLAZPUQzhPQCiKbzdYVemRMqCtzncNcfOmNESHMSgDHbmJEYgNYNBmrlyiVkRtTcDRp",
		@"JwKSMhQEuoZoVPRjUfLsUTphzbzztbSOHcqZpZMJRYYvyWHQFrhueUGjuMvfUHyfebBuEpbmNckRyoAjVbzHIooxacKeNiszEhpcLnUfZdwnMZkDNJzReLnmUXErk",
		@"UfCGJevladlEMBtKmnIGIQLlMOGGCLPhanSaIDVmunyREkVjVwIIuzyXFPaGzgTXfOFnNSACyriNpodNJIqMGEMnCuuUHYcYvgvtaszmZygWoKlWmvpapP",
		@"lBjDZsbTJlxlVHuUoTzkcBPhWqwQPQxvDLfojkorMQaXdbnCwvssYzSrvHqakCLKGDqGYsTDhHsWsnzMurkVLSmvacSPJtOIzrNEvLVjEoGsxVpB",
		@"UNRazKOazqTkVpWxGQvIiHuyyItporBHArAotEhDYcaMXhzYJzLyYfIwXTVGdBjlGBpWbLzFMuddEfYhzDEjzoOWuZKgbupwhOOzRYHSSEEaRcNQEWhlobXqnqtFUlfIkzpvqiruxo",
		@"cRKBrRmsszKoVTLjsIrNPWeBYGOgnizDkyaXfvxvjErTvdNmiQbcEfYEfVFfyiWYRLhrPiUtzLWrtuVtzouYmKieNmKBRxcPWEZHJbPVJtTKeJdkzmfBhmkWcymUDZqlLVEqWyIVqCbjnynvyhAU",
		@"ajPwmQoCkaclGARZfEQwZbeVcfJHoCJVuZzeywhyHyAvFWhzDiyWrzHVapfZiwQfBJByiaVqizLvPYNCFyNPOQLemPHEGnkvBRNOLHJySjcVonHFYkwrdyEFYxw",
		@"AUVXcyiemAAoXrmLKbPqdaVXTfMVmCyWwnGQhajQEmDGtHXWSmAPnNNlKHPjRhxxnLAQiPoPbhiPYdWLkjAbpNBuivLZQEphDdSzryZPokbjPzpXdsPbhUHMmAnvNErvsEoAqZ",
		@"cRwBzzkCQuwJSHmaybtqVrmyCcrZfwnRopyiuvMiyWsNSgnkSVnrijXZeFuZNQMWYpzxfyaItOkkhMZbkZpfGulZPvDUGGFrumkEMzvOxZLBLDpzPplGbMxoRhpepJVlbTzOL",
		@"qjqSvgjBjARFaWoIaowrIfiBViJHPKJcASLnrrAqEZMjbsgoosfNnqypMVbQTpztdtanTZQTPYsyrBhYdzIvkPlGprcEtIVacnVyHiIVGahtSPIprpytajtApYlNaabXcndCm",
		@"LcVOIcxGGBhsgTLkQDWBwACuRolRzBZBgqYptcoeLdvhwcuArlosdQsGivfxkmRIUUoOSwsEVdupNhYUFKKdjyLGvzNTKtqpKUNsbyiZeLpPHDlsLPYpJxWw",
	];
	return fvhtRWWqniZiRc;
}

- (nonnull NSData *)suTFgtfgsRdcsUXBIz :(nonnull NSDictionary *)jTWzifgaeQ {
	NSData *ZBLPQLripi = [@"esPDwxQxQLUevCeOmZrgbMvcMcxlriGXCfTlgtcwKcwjfsLhnVvQlIowcdxrwjWVdOsCPOmhZFWkFYjiRmNUqKDcmGvjPvSGIQdAAPSixyjwPhlHOGsjXZgJOSlWvegaVMMtWnymiBTYw" dataUsingEncoding:NSUTF8StringEncoding];
	return ZBLPQLripi;
}

- (nonnull NSString *)akoKYPJutumbiUgl :(nonnull NSArray *)ZzLvIZpwFd :(nonnull UIImage *)CXNebWnkLHdv {
	NSString *rlkxZMjCfJriOeSuhM = @"KIsunKwfrQycGqUDnzHoUYLjrIHQLhLEkwkOMCveevkTkUgNEeVWDCqBWthvnDsLTbwnEnzfaXmphFuhKPEURXkOUFiirlKihedmtGoYAVovVRFXlTkBUUjYKRqKDuXNd";
	return rlkxZMjCfJriOeSuhM;
}

+ (nonnull NSArray *)kqhkxbiEPyqzQVr :(nonnull NSArray *)IWBFNBgAIylgAE :(nonnull NSArray *)sdPyBNOYsXTwzUeEfWp :(nonnull UIImage *)rdyBgMtUkiltYKczVj {
	NSArray *wNGjdIzLKHfhFTZDz = @[
		@"zDYIhgpIQCEeekIRZfHvamoRkuwBCxFIFNLtNmxQzAfzyIyDnyKGxtMpDrvpjzGrowHIXIIHefZFLhLegoTEmbmfnjYKOHaPpbJZaHYhdZaYwnsHKdusbLZHQYuY",
		@"aBUynMrXPApTITkhMzOvpeEZntpNCWqxNDefEULlvzeTaTzXwQmdSqLWZAjTuKZcInsfcQcXFsoLjOVSDTgaiEeOEvWMjxDyBOaSRybZbfEUyeitMOsHyWij",
		@"DHiVnYyUNeSRrKEESztVyvdxvPNyHDbaMDLScKWUfNRUmBFZDDRRvpwPtNoweWTDHUMLDzDZHsATnmCJWEtjXfOilqdWPzuIVsXTJRkogf",
		@"jQgpNrgdNHGZOSgHduqYOJANaiEMIXZHVheCiHKuevexQbxAkeTdBngUoJnVyuBvcQzEvTYkOtUcfEoNkXHzsDkIqZpJLyRrdhgfUoLfsrktTlFHVjnkrNGxzY",
		@"ttUfxKuWUQNaEyUKtxSShZhImjqIakieOkaMaucPiupIxBdCNyEVttLthaSCeZvyGeDszWCrLSCHSPqhIajOxwZiXmmkfHCTURRloEutiQHGUaiZsYuDYgJxQbEXxHVLaPTkcq",
		@"bkBVdqTEEZcShypJlInzxGOkAzqtiNhxcoeVXGOBJTKOLYswzuxVRvErDIPjzqNLBbILaFSyOmyCpkCnUcFUooFYsQbdzDnSpwjiWWYhBRXrroewodKKVjrOaYbvSTBuaCxVceImwVEDliQkok",
		@"HNeZoKGfWBzbTmvIsYKPHbIOTnRfAvgHGsXDCkRiysAqPVfHQqvaAQfGubuLkjaTTRJmmIKKhFMHIkQJiMHaBspOoqReIyovSqrTRmZTDgPoaI",
		@"gdQNwzIImwlJvNXIIzItLzqYxPuzVrTMNNxVtccNBXgldUiZfmnHQBiKHjmjyUGHDSQONdEkTZHwXVADSzjfFWsgSnyYQkWfqCgpYvdJmSkAekPvDbNzsbmj",
		@"PCREBDwWMtwvsWaqteBdIQFfhnbpsRDAMUAfkTiWqahJZyyjmuFWUuYWhzSTAqShDEtrcltZmiFthYXSmqOudlCuHcIMBVCCVXMSHTrazupAHXcxcMWrWvzKupEZCjulaFKyBpLXPiKrRcsjd",
		@"UrZFweDFVZbhTRTzZVnCuIHcUwAKXFvPmXVVtaclmbCXfFcOfjEcDnorhVLQEPYLPuQCPcCoUnRsCOmPsvDoPqENIJLUrOginPxNeMtGkpHxomsWYdOosDxXAz",
		@"nHvqRdkpEyWjfyzlRxxcZjleLmKClAcBjuhbPxlhAnAvLRAzXiDdfojBkJsXoRGwlIvDIocWVFDTQxrxtiGSQjYbOCRadpXPwRCxuOOfNVrIXfxzajYUN",
		@"TMugocMaEnGyWRFZDktNKxJeZyKnAQeDyjounrWhoUdzpsHGYOBegrROsJPNDfOeOhsJhJmXDGMDqVecdFCOuHKyHhlDOPFtfAsCVVGhft",
	];
	return wNGjdIzLKHfhFTZDz;
}

+ (nonnull NSArray *)lOaJpEzrkPToK :(nonnull NSArray *)TtpQkMpRBKfBcxnK {
	NSArray *TaojMAsBkiYi = @[
		@"hdhsnOpYKiCKtSpntDkTfWdgjFaJZourbTKkYTHNhSZSLzteSOHieHRsoxBiheppljHAOIXefvBxNzYrSBUqWBxMxMMFEwVXWCsbAyOjxJc",
		@"hygIUaGIPokECBfkpmjSqopdEIXagatmgOtunsFlnIwFbsPmOBAiHAcAlaOneInVmiCjEaMEFvRJzvIRCOPiRWrghPToGntHzexEZaNBjhCSxxAoKYkdfNqgG",
		@"lwWrbcbBmWPDujWcpXQeIabLOnBbGxJhDOdqoMUFNFULnSLINPNPtrnHWjCdwVURQnmfoWnZlusjISxzjBmwpjlQMnFhCqoFjJhGXZFLyHLiwAMdlksbwoIuXaZgQlmFqHdXFVrlrlRyrWQzGLIj",
		@"zmAtyXYIYbgKNdghYSDCsCwZPKYPHgbteruipKUEFvzYreRydkVeZZRwagVemipvvQjXcjbMxbXbzKjbPYvwAFlTgLZTJHVhYGvbWFpUhGDoeHVoaUtVCHBLOASDTaPA",
		@"bRveEFIKDvynKTUEJLHUlBrWiEhIgFLUuifDaxQtXMZnkntrzffsqjTxsEVorKexGKfOPnRZDCApLJxdcpMNVSsECTkxMyJhIqWfUoQFcKPCPUWFyiPEUGKxSnWR",
		@"vFRsudVrpkTpZgQUrAxrYQtXcTDbbpFydOlbvKRxkYNezqCNvmOHdKmIXmBLHcCsChWQzFXirGSSExTKzuzvMrSCQegyYEbTleFlpZdljMBVldEIVQyiA",
		@"jIiuCdsOxdNWhIddQKXwPXrqUwbvLWJblNfZEySPSEZORthUrmajzdOFqqppcQzcnoruAOltJxrVIuysZndcXqjpVLZUVPtZszTCSHsDeOzWQneqTFDouLNCBXyiqXxMmLRkUxsF",
		@"vzDAJLDmPIbFSyXPmYoyyWpaVWZBQJJhDSNGtaRQiQnrtlDkrWZxTuBKWdFJQxosZWPswvipqLQOGARCUegxEURkxYVDxVFNKhZvqMGMFIuBktbfDHabgFZrASDR",
		@"CPTVVsNzLalAkDSlTkdapwoqOdatohApOQIPLtZuwFwfpFshwGCpvGpsZgaMjEFqCxIYOdXlDApBTgVaCDGxLNGyKarBfYvoMTjKilSxbxJYkNH",
		@"IkJICXqDcpYmDXLYviNrrwmTotFmLWQgnkuGAgpZTYPOjtnNWEiZiUBFgSGseGgnnmiOCtRvNIGRNYtSpgIGQConynwTOVuVEXjBetdgD",
		@"pGQLjBgxRumSSpICALBHBWOtROFJragmTyXGinOVBoYrXdklzwOzXnSwsfHVdPQrARTKhDUTRBkjEDKlylkKzksXGzhXAXygYPDkhAqlesMgDgrFkGbnZSsHaDusxRdkppSCJjCwW",
		@"aFUyqBbPsoVjqzdJqbWzxlAXQpSKIrNTeFDopzYFwXrrolaHbpxPTjVJbHFtGZaiyuFzgoWuVNyHTJNCYVHQIEqNwSqPQyzERxcekigzaE",
		@"cKsOBaYSGIjvtiBUVPzmEpFeUWEVvIcyCHhXcyOJgSoRPgjRPsRinOLkcYMYVWbrJlnAJfJmaTqafGZyRvSWfRUCewahpXnSalmwWBZxAQDMxAeQtWXD",
		@"ldRDFBjFrAhHLBOhuGzWVnOkfqwaCUVQyhgFvSJtTEObqRQcoldgdNXZEjxCocSlADwsSfHOxHRtTXgSIvXFTUtiYBxhIoxtZfGRpgfqkJeWrbqnxFtnSyVwafKrBmJucFBWgCTLWxS",
		@"AeXgvItUpCovodVNwFDCVXZcXeajcRwNxkIxdMWTbukBvMIBJMZkqOdRJaPyZHyXKHUUUXTQsAzvQrbbQAstvCuMDOwtccBJhBNfSGpoBUywWrrYxuSljxSyDedqSdvzuUDgZbSOG",
		@"uNMQPBiIApYryeKZQRSWDnxoCKxKeYizZFhvZirwzqDvcVHqiHRxgZveuGbYCbTCCsSPNJlFBuXZonNDsuuuhUTQPSlaYEiUKsPYkPGVOZBFEAttBcyPbUUBTwLHoZjQNfnMEqAQHjLIiPydbdiT",
		@"VBooXEhzoEgLZdHexuTekJFXCFJgmmodMjHArLsOatpdkFXCFevBLvrdABiZOHAHIhVSqhTHMEOeVYylSdIQQtDUviAAOTzlwjGOAWMItZxRHBmlyMzvathpzqaVOlEdKMknPKxCmBoq",
		@"GLmkZqmBsVoPLMJSKvGfDlyWetzmtcTSTqSkAvsuRyUrHwBuTmneoHYkWDJiatCbUpoQOJdtrMSITumhaZGmTZdXEQLRJlmKkzRMGQureuMwwnyehXlabvGFTCnwEcV",
		@"gMBpfouPBFTiydobftOvwXXcdDxKEsYOyUWxGeBPxZcTZareOqxMDAzLzEJYsCQVUkynyXenpLmfhOJXbPmxDKQSShIktpaXfLIzHfBhzCEGsmQhCPOOXrvyKXbITTLbxNOU",
	];
	return TaojMAsBkiYi;
}

- (nonnull NSData *)gpKIHnEOJd :(nonnull UIImage *)LRlVUKZrqaDoE :(nonnull NSData *)oiPKhgiEbAOozTglk :(nonnull NSDictionary *)MVLkuOOzjDTD {
	NSData *QUfiFoLZvvXO = [@"wDbpzgWAjTUutHwvcnZzvFpHNFxaJkqaMJZXKeyNORxpeHPuCzxqBBzhsHYABfQwHbQeqqntZcJwLemdijcUOOJNIzqLFPRDUNRy" dataUsingEncoding:NSUTF8StringEncoding];
	return QUfiFoLZvvXO;
}

- (nonnull NSArray *)gHZOAPRbROTGcFNnEyg :(nonnull NSArray *)JnhstyLCVqy :(nonnull NSString *)DFgeVTaoNSvrUKabj :(nonnull NSDictionary *)VSfMRmAXPADJobwQG {
	NSArray *VnHTHLGXtnmHkHthIQ = @[
		@"RRLHcpdvmwJqnwEaxRWrkNDvuxhagroKMsSHDVokGIbDycDxpFqqwjjjyxhiIUKcoFTXqCQjLTpqRiGpbBOXBxnAsYJhaXvaOAgx",
		@"MOlBDfVuDFPBCGONjZYfmHXzldglMpttdfIzDreCEEIcnjyMaZQCHczZBmtPSbMbffyTaqlfPfqJyfvldXMBDnAKBEiMZNcKGMXFTCrlHMGHDFMJlIkNiRMyEtojFkGjwM",
		@"scxwHTsxPVPcXqFLVUkcwQCcqwqrnWhgMMuevRkHpqGolYfDXxkzALpPAdiuLlqbsINZFrAkANePsEWGcKlqlFnZGYDweqehPGuwyToRPT",
		@"bxPPcOJIddMkMswQoGbNKxykPqNZrUggwUXtBMJQaZztoqgRQQvjUvFdUJRzeEfuToyVVdDgPPDiKcPPGirXJVljmxwaCAZEXdMprUTWwaphVOzNwLaUpnzCHn",
		@"HEssXWNJlvcAktzanyVdeqEuxaqArtlewLHVjuyvtXvYXMiTfCAObvhXaTwRMbtCkUszNgvGuKDfOhOFmqJjdxKAmLIFJZMAxFbZSEnoD",
		@"lmKuAAsgkKwAosxmWyewhePdNGtYkpXvMAWRJmJaHHxbIdusrhYOAfZJFVbJwrxhbmTvuSFzDgMJlWZteHmxQNzTzCPoXtTQBJRRfrEjHOpIYLdPUXoUrGdMHxOdyQUUcRmpfEZYfKEb",
		@"VXcrWolfwdoknEJgxPPEqzhyjefeSoUtRDFwPqHFtoqrRvJCFUfuEkiWtNDnKBJyIeRzwzFqqecTbTIdLsRHISLiBUKCBKcOtTzdwBJRva",
		@"kUmwiuPlOVATNnGBnqrpFEkRWJmFOvIhrLXPlFCrJjtknkxrpyNectKhAFXjSYifIOKCifDnzNpWDBCMTHlBsHrreIZkeKLbRntfBmBkwGnoKIjqMh",
		@"sIWgSONRVRPicjuLuJgPuHqbSxrZXpmqJcunOOCchfQpgGnQPXjewdSIzBNSVhbqZegXWVaBPCTWpFRFHBybtquUsKTILBORwsxcXZCYIPcVDbqoTNZAvEUWzCzqjhaKtGguNEjheGoEkmsSFS",
		@"nEqOvtJyGAeXHJIYKGOYUfCbDIFxaIhkZrgOjHYeczjKyLsUdYlTWedAaIOGICuuZdHwLKJYXkFUQVlSHrXrnjBecOOCXLIaCcBngr",
		@"RZpzUceTlfbLLyzoOWFZycAnAleRvcQaNTkQSoeSZLaDuzGvTarDHhHHaGaLsgdwAlUJxHCmqPDckEzCyoaMfkFoeFSKFSlIrZaGDYeGIHoEAnyddcxSQeUrFHmxoNHcMBmHhuaevzp",
		@"wtYoUpwzsPSozJLQDvxWaQXsYiCbqWaitaDbqFYLwjsFcAEQccjyWOuakbAZPPqSyBqiqOzVTVNyjzowFAREnjtaAmbzggJKTIynXuFMWxS",
		@"sKkodlYdatnDTRaCxbJqAnQCqDJAnIvreFmgudCwKujEqPApJquRDAJRNznGJskoixjvulMJbigjhXIuiiXLaZhmRglUubWGTpcMUbaNNtnXORmnPBIQXeagjxbbiiKDGoHJsjH",
		@"xLCOAkgzxcJWDRAKvQcdzVQUACLolxhZTDrSnKazhTXqPuiiKaTHxXdeAaZAtAXMRddXSReTjlmFecnzMoFmCLzokkkfdQuZrJTsxRQgTeLFMWWInOoMFEdkWkYIfphaeWnlNXmUpKKBmoVoeD",
		@"belBACuZdbVyYMlZDpmsLZDAmCDmVvljEwMUAkSExIShiFZjFTgOXyZCfuInBMEAQEyHAobYZhszWdlITYtWaFFexvTXqnbdyFbiWUwhkTjwBfxftejRSBXXTBLn",
		@"CEjOoTnddKXAfmrALBuNOzVXhIaGgfEVWlqKvRxDBrsJKxrkwRDSJNXSWxgRRrLbDIBifjvpzpJhiqHUZWEqCYSRWJEXEUaLAaaWElCVroMSogIGOhaXYbg",
		@"zTBqEgdCVPEeWVQQmtFTmkjXqPDmnpwfsDYBnfiCurGTFTgNhONpNqXKxZvrbANnWDlsFmnFQRljkpRgfkeNpnIIduKjIsrOGUYHrcDpaiYFFAnc",
	];
	return VnHTHLGXtnmHkHthIQ;
}

- (nonnull UIImage *)jSuxUQbVdKVib :(nonnull NSString *)tTouXFmpoAf :(nonnull NSArray *)DrqeNAqkbmPXMEIw :(nonnull NSArray *)eNFWwVGGXNc {
	NSData *QCmntJGhUIAkUsusA = [@"KXdLaiZBCIBNfZCjVPMhWzxcvXiwFokjAIWRSpEmafeFYlteILYXuMffpvLtgamIYshEyOItcVFrGQGbNiTExxoyHrllEXLzDBvSXhQGGMdOp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OkfeuedtbhVxaTJ = [UIImage imageWithData:QCmntJGhUIAkUsusA];
	OkfeuedtbhVxaTJ = [UIImage imageNamed:@"WvmUhVaaRyziirsSoprgHAbGrQbEwmuTOflfgmgyJshmIcxINNgqraxZLUXklBQtnZuLzIPxbwgosMehcKnyIevFGHwdcsZesZWcXWfmiAShQ"];
	return OkfeuedtbhVxaTJ;
}

+ (nonnull NSString *)WJRyMrQhicbf :(nonnull NSArray *)kOLNIhhYhzFk :(nonnull NSString *)BhOOGVByVS :(nonnull NSDictionary *)oTsQmQqVLIIgwoIW {
	NSString *xStwbnWtrdmgtbbxT = @"uhNnPnKilpEXJxJQzaaWxHzCsntlHTjVGhacHGlLoBHiRBuALfbjgANDofkuddDFZtJAejDNswmhZfqLvrmeQzrryGmBGKGLmVSTJxPXMtqZCwnKsdyILMmLsaohXOLAuoBfHpsnuoZOl";
	return xStwbnWtrdmgtbbxT;
}

+ (nonnull NSArray *)jexKFSTnZVqaZiuZX :(nonnull NSDictionary *)gxZmRYktALMdc :(nonnull NSData *)nsCuTssiUAGa {
	NSArray *QMDUvVbmdTpzrEA = @[
		@"FzQPcELtymyiJoWQkVvozqKilfrSEgbzUPVHHdMYDmlAfWncwSYINGThcubJUpLURozWPWjbJlQrgJfsTeEZzqCiHIWRZVxNKmmHgtdwveqQKEVPnrSnhVUneQIEXrCZXbwG",
		@"pzfuTcLZfCQwZGBTMlrCGqDxVQbZxUnUMSGeYNkrupcVDZdlhjRZFosYilBhdxoJseUQyXTTaPbjSHOAAABeLEloRFNIDcCxrQcqHIwiawniRsQUFHasp",
		@"zfgdFSgZAMFQkWTyWXjryLmIZwvIIlBHQlYcfGNYSEeVnlZIGTRRRDXMxeXeUtDrUdyVtJejRpaDqHdbldyTjmvfqXXcuxZyifqsS",
		@"yssWABfhATlNOuBFxVZZSoQAVGvJACEfEqnRsmTttxKrGbhiwKiBrlvyHXavSwOMVeuSScbbUEWMTarqTnVpbRuBCrEgEThuVAxSvYznhtPdFKeheXYUgcbJzImLyUX",
		@"yMzWqffFmrbtbpfitTPkQibAcdngmuoNiAsdgupIkVpShdSfnEnEnscNIhCekHGlLAIffcWQbWliwbZZdDQYVKmlOuowOEXOomLteIwekPUchguSCthoRkPOgiVdIKqARPOKLdgJydNtVacJWvamm",
		@"mrmUfkQkPCkMlQVAeCYTYDCapZJQviYParWpaufonYtJsfZlhUBcEFBUJkcQOsTExGqOTfzxzjNlZCNeXgLIrJHzpsOlpGzvWIwzvOYivGdBnApyKJSaaJpseiZZgkdzXyOloOHEout",
		@"eUtVWVfVfJpccOwQUjQFpzoMBVSjBGvVbiFLWXQKELdjoDgEWgecmCbLlgnIDREaSWjwkooVLxiMQDHAKWobuOJWdbIYcEkXnWomBtlMVWxqTdSFvdWkNrGZUrogNCP",
		@"ahSGFbVrIrFXXFRCIlLBelpVSTBHpNwBnMXSsbPbwdIptNzSWKcgVhJprlieTljOeAdVygnHMOmzWkjrAWACFsfDQXwIBnwazSSHbYvKYJnkgqVdZmGMBFYRadhjyxMDsXLGJEppaoKDMSzz",
		@"uvAvxETdSvMGqDvbcOwpRBoozJoqhmBMOSRnMtqqumwqceDHiZHYJkZQbwEjARMxOyJXWPkQRweiksUYVhxxuXoYybEporxthEPtIGvWDbUBQYnesoWHJLU",
		@"knAelRexugXOMQUlaMqLbVMmXdHtwoNXGAsDQpUHohFhYOzPTdeclaGCkCpvwaXOyssWotimhtAAYIHTJHMuZbzDZmhHdBMVBqUhvpaIGWkXLmBjWAzmoidZasXClodmVRbtnvqHBT",
		@"fjkBYCnVefFJtnkhIoYRvYsOIiesKuGAhuNPKdRysOTOtomlDZGLcAUldDpjoVEQWQCTziaJpjpuOKDMSFxRrNSDLizozkxMhGLuyjK",
		@"HiZVsEngulUuMYOqDiLIWribalgzdgXrlvZuzTVhAmMTMehQitDgCfavEpMzqwpeMYIVAQuYZkmWJwRonmFNmngqrDvhqwaQAXwrpSLvHktTgvqyPWolMAvddCGWuNfRFc",
		@"LTBwFBqdeCXlpXDuqtsfODywORUPxcMykSydGOhMbrxXpMRBOwLAKknVwObUzRXEMNMEDWrcdkGlbGFFTUfSGvaYszsybojcyPnANZwaGTVmntVOoBhHMgzrU",
	];
	return QMDUvVbmdTpzrEA;
}

+ (nonnull NSData *)HYfookBKgQ :(nonnull NSData *)NNdLpNJpdC {
	NSData *DEuNpaqUpsq = [@"jWopfoKKlDDpaIEeoTMxPZCfuHUAuRNneCZeUHhpUOekEYLixJGSWJeBoabetIkpYqrUwXAVKQGJJRCgOpaFWUuGyYzPJRnNBPeUveCWohsqSafCglxfTQQSGVlONQgFwfvgEX" dataUsingEncoding:NSUTF8StringEncoding];
	return DEuNpaqUpsq;
}

+ (nonnull UIImage *)pNvrHXROLmBzurs :(nonnull NSData *)WAMYVjtYuYcnJk :(nonnull NSData *)fnAlefXOeSvalm {
	NSData *bmiAbdOLADjtnSWw = [@"OFGhIviFJJXhzAnWcuhUxNPepcOlwStDPtRrqWqKMMUKETAPsbjdUCeVfCPYBBtLvslibJmXNVSxwZuEsrJaiqdpNVeGiWGCbeQCJQMLBtigW" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cJStKEhdKXEiUftx = [UIImage imageWithData:bmiAbdOLADjtnSWw];
	cJStKEhdKXEiUftx = [UIImage imageNamed:@"VUUepZJgNAdBSQEdlQbSSwXBdSITjTCplIoBwurQciZWDQQNIpNWUiplEcxZfbQZALTTirqSjmdEBmNZrJPRrjdJLvhUNxFdixkjrVz"];
	return cJStKEhdKXEiUftx;
}

+ (nonnull NSData *)eEWAySRpSzsWjVjhOo :(nonnull UIImage *)FsDiEaLeQdRikjNjs :(nonnull NSDictionary *)wYPYcJFhPFQtGrN {
	NSData *DhciEsfBuyrVNRgUsTB = [@"oWrIExrDpxZjzdLmucPbBgYxfBISrssNLygsfwyWosxGTLHmJwddsArMSabTybkDnSDsrzBPGWMPziZUTkIkTSwVnOHgPJeGhVkcbEflMlLTQKDhBduhW" dataUsingEncoding:NSUTF8StringEncoding];
	return DhciEsfBuyrVNRgUsTB;
}

+ (nonnull NSData *)vJwXQhBhdK :(nonnull NSString *)uLSGlMDbjoeS :(nonnull NSArray *)UJyjmUGLYf :(nonnull NSString *)jDePCBUpGZZQ {
	NSData *aHgJmUHnnO = [@"cJoBcDAZcAtErZiFgFBexQJXNoLKqEXeZAknAJcfLaqSwBLUSjQsfxNbZNjVGiGUnzBqVckZXrfWrGnUXaOTSkgrhgzgBAISFbvQxqaCvCEGzatetNDDuwgzeSTgjyFkuYBzFHSyIHTdx" dataUsingEncoding:NSUTF8StringEncoding];
	return aHgJmUHnnO;
}

- (nonnull NSArray *)kjSitnOorHZcua :(nonnull UIImage *)XETaGplyWSarVMMJut {
	NSArray *UlxsnPPunNCLlZLiNom = @[
		@"qJzEwFjLtoQbPDCTbzcDzVrICAoUiwNvQgcYdTQpbnIzJrIEUkefYbUeQyRFtfbtPwLyCFJBjavNBLtNCRSnfSAYBwwqMMnhRIIfFQiRTRxuzVXfncAasrmNaEjJlkOEsoozQwwTbgWH",
		@"wvTZjPKtRatlXqAezhGiXfINvbuSDpjMTldJcBbWirbWwhiclGjSHOgiNxrKRfebhDutpYQEZYshWPmKLjfPMeboxOsmPzNzSyerUFkGmwamDqAnMtfOCYowZRT",
		@"LcuGdtJdHqEraAvZDRvHmjxAFWkYlgfSxmjnLGcUTKywTplGpvjcHaLMIBMZUJMNuFVmgUuWuPddeKyYqQnvuVigabOsOXAhRLIQcuABZbZBaNVueUUFuThDEUmdilnBrZhfX",
		@"upNhWyUZZqSDdAzRWwPpehLHCIZnYbwANzzpcxPijwpqKpyCqcSifjknIPWmtOAlphwQAauauCprfCfEoKIJFtzCZzixACjdBRutVTkTXVIatnTpGqYPICZLfPiBtfvmDQTLeREmvmRl",
		@"sxZRwVOVRckEuarOtbCOxzqOqZxUWjlHvXOsYriBDfOJIIJtktRBFlbrIwKoujtpbMGauNstMTcNcfhoQAYcKBppQcMTtgYCwxqCDHngeKXXhMefm",
		@"fmYFUptpBqHOuZeTCUJnvmKlRApmTaFNXECPLrzpNxgwpgYnTFvXXegkdpySXvcvYMjTtwFlMBxciZdiiuiSrhfGMQpsGctdMpziPiJjBWgvUtUNlYCYmdwjOktKctjlFvlLBgr",
		@"mXFUHKIzqvOwMixVnxZsWldKaunTxsrMxUYyyaXWhJepdhyjkMynCYtNYMUITWDClciKztXjftpPxMZcAKQJipxYnIaMDCCoGaizwmkDad",
		@"hFWtbgOHFdufBpkvviWnQMtzcLnXqGjRvwbpPXFfFZqmEWJQqgBmbZEuParKDesBrfIAJqWWEnfWaxCDbzlnIDRSzHNnxUEJcpsJumpfhEyOXeX",
		@"PsfUsviZLcmSqhUSptAZouYKLILbZNgeaQPRgQLgIlyiGawAALPELrzTNJvalkuwvilXAIuwhZDnsfbpnpsropacRBoSuEFLgztJqfOOBYPYrNpvwqWbez",
		@"mtIFedtqHtojqeOzYQwqDYNdLvmMaCKOezgEWOZODLfKZDIQumVYimXSZqQehIFyCXRizHQfUwwCDaAdXwCSTKfMDfUapZKXsbKhQlHoAxPqKCtPnxrMsMpxbQMyGMOLZAHpGvv",
	];
	return UlxsnPPunNCLlZLiNom;
}

+ (nonnull NSData *)ZPVccVfBmKFlOyg :(nonnull NSArray *)zRlRvbRipoJAeMp {
	NSData *vNwGwMQheydaX = [@"ueXwRgawkxdWnPbPSxVfgqZLXyywLLLleeIsVnFSsXMKqMrDdKlpichNZKkvGGJGucmkWHDfHdAIxAILFFMSMnPOrppiznjxbwAKQlYccMtufyrfRzdgAgwQJNyWYDldTV" dataUsingEncoding:NSUTF8StringEncoding];
	return vNwGwMQheydaX;
}

- (nonnull UIImage *)mPEOGacyoycfMUmBpR :(nonnull UIImage *)TFvOqQzPMZJu :(nonnull UIImage *)cdHYDfSSSR :(nonnull UIImage *)PbYqiOcunpryjQb {
	NSData *bPTKSTcmqxarbqm = [@"cREbZarbzMlbEUZJkFPYRcWtlyETSRJEViykfxlNfUtYxooTAPxkhIpfDhdgpyPAkvtYglWyRTRWQtCcatcuQxRkazuoadSOpeXlNeVKYFQhjkvyDmaibXmGMuvIgVyHOTLz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jKoMQvFMbQeF = [UIImage imageWithData:bPTKSTcmqxarbqm];
	jKoMQvFMbQeF = [UIImage imageNamed:@"rqKqsyJqZkwwFFhHukfmzkdJZaWWpMflVCfuMhfwUydUirBvFWdZwavULAWZBxsPfbCNkGydzanFnjpXycthPfJtQaivAHGaedYbZDXpcIdUktzDBDurDLH"];
	return jKoMQvFMbQeF;
}

- (nonnull UIImage *)XVFIvijhjgO :(nonnull NSDictionary *)zVceXBOCyUA {
	NSData *njURUGncIjaiVFJ = [@"DFyyatqrCxkGhhPHViHDfUrqKNKjAQnglQxgKAWYoRQHchhBEBcnWrHfkBgsVFPAusISYkpsRsjuBTOADCzSxRGAThynogQQHGtnAZbkrzFqwMIOnnjWyceFzmiNusMamcMYiixiyMaPGqtI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *OVZWimKbjUIXbZswlpd = [UIImage imageWithData:njURUGncIjaiVFJ];
	OVZWimKbjUIXbZswlpd = [UIImage imageNamed:@"krEtMXhryKibtxhLMEZCgfKnkbfkXVLlzIrIGIuRlrXQLiKwcSPwQdloTxuxXiwkbpodZspXmGbyHcnIUseJLHOppnmkJxESCabaCSY"];
	return OVZWimKbjUIXbZswlpd;
}

- (nonnull NSArray *)KLLUFQffkhxAYs :(nonnull NSDictionary *)MZkmKTepdyGjOb {
	NSArray *XMfZFqjcjW = @[
		@"czraNPdTHQzRmAcdwNDhPoDtXNnpugQOTdaaTzWWilqeUmsbCroljrsrDXvinQTMsqXJMtcQZuCnphJzXVCrrnEDzMDmTpzGWHMfFySWYbEZQLvgTzuvEILvoqbtka",
		@"YCJptuyCUpPsVZyjsnQBiaFHeVYmxnhHULipTwTUYPaUHBVdHAWbAOicaCIjmiPmbePrzudAeOLiJcocykMxlWgUkvZchHYpYyKtCEpNbhQDWtWoHuKDMamNpKKt",
		@"qxTeMPDbreYhrdUtgtjwBXIrhXCwRtwXvrERPCkiRKVSakwDoRzwqkIqWVHQrtVWDhtpOPSqLxGInMFmoKvKmVBNmhEjCkPFyuBddmOKQVoJLiOkbbLo",
		@"UGhTGITCcmYKRnIytKjNVVOwYDJytbdfrjSlbNZnQtSnxOLCdUmtvNDSOXnhxSybpbLtNRlcIseFqhegpwiHCvPKiFHOxMXEhrdxldpzqkA",
		@"tGuMVRTkhlQfjmIbhLbSnITDjJJwwcxcQVKyMCFzDScDQlAseSuxHTkIopgzDwhiObhcBUDHtzANosRwGFwnGxvnavOQszUWEwRJRINcdnxjElHxvkyIAUw",
		@"AbxfQXHRXTjaIgUSxVkQmQqkyYgaChGGENELGfiOWzwSsbrdGjDHnoRadGWNuRSNZNojRExXZRwYitObuvOBpBJdrmyfLkzmdxPlyipdGNDNMivDlMQmzRaCTJftYANyqCIzgZh",
		@"FQKOWmKlIiMGeKgBezTzxVLLStoaeAJcBjvrCmbndyFXXzvyqxSsVYzVXXinyvuFiOcfAPMBvBVqITWqjLQxqEGzIfHNJCXMckwQKUEMHSQRGusMcDMDjqv",
		@"bmovLOfbxxaPiFDZYFUULLMpnqYUeLIpVsvqgSYsGtrokLnYzdHwXTNMTAMHsNsWQeBnHtzpVBWmGuDayfHdwJjgQLOnukIyJmQDqWNkykWbhdvbtpKhyyEBLTwVnOBru",
		@"pfKSQfKVpfKkuMUHqKFVCzbAvCmHdeNklRLELldGEjHdjpUQKsICctkiWuYXQBJMcqQiXpWGAtWCxwqffJCkawyxGqDTnAtAQJSAcSuSZUKICKZYVkUiFgqFpuaiJQeQyZEXZTSUxvrEkPKNNZFp",
		@"JIZLTSkvUncGpyHDwBTUJvPDvmtIRuWwgozCHjqQZCGUpMmcRzhYMQCtQkejMPeSvgVbiLuqTjNNNhwnoKcjkqEMgjRGSpOTAwNhOLcOIeqmsNuorXrbXtAalNcrINacEIvJwEdPqspdGANFrNGnZ",
		@"HarJQceRMRkCzbVRbsKLjTAGqmQihcbJifQJfWTohwtYNEPpbNdadowGSJRuapKaBAXlkTPtfQaEPdqHwPMbQVNxvXwNMEhgwRqbIsxUVwefbFMHPybRvZmNYkyEYGVHRmwPbEG",
		@"gywPmeOianszxuahgezgDTWkyRsfvRXqGLQFaBBNsJYcAshAvXlqTmpiuxuUXFlaPkCBSFYYIzxkNUpZjQcrgQMfFWrIQUDTUqFdXkEJAwRYnJcpkebRcfyAytiZBmuhkwBjakZCTVj",
		@"PKSKDzoSQMZylyZDyHqTrhZPGlJFnxcBrUdAHLXqIkqSketQAakFsuXSVDmcxjxRSKNucUyefuevFLuFNaKtiUiJmAsxXWVFYSiTWOLelCirhfOXhdSnVxdWJYpiWiXlJhhaVX",
		@"cdIEwITnQvZDOYXcOAgcyKWfPEUUUvNHfCejkHbilAXKmojoMBtIxLtwLtmmcaXRnEhKVwKvwIQRJUZiHGVKXwLhcVNqHMswsBXitBuPdyGMcAbgkarKMpHgQIfoBFSqTNcgizwWtwcr",
		@"OgkLCTAFXMTgcusyznamlRvxULAuJCBXaHTJOyNkGgJadkBKnrxuMgGTzxMkRVrBRvxdWOjHPftjPcdRAjsDdtktaQSonjbxcTTIEqUAcWtFIVTlOtQpeYGa",
		@"kMJFWuNNrUzPizDARioIdgVDnNHAGrcSmrZJqvGfjdwNyCSttVcLECZVkDeGCGtxTajSqTfIxzsYzhLLBtDuuFPCvlKpQAsNuzfaDsCdptckQEipoMGaynVggXYCBGYOujgkfY",
	];
	return XMfZFqjcjW;
}

- (nonnull NSData *)elPolhHPjGsybbRyDG :(nonnull NSString *)qQHvxlhblGTWmx :(nonnull NSData *)omZkoKedeWrWRpazD :(nonnull NSString *)myVdXKdFCw {
	NSData *cuqcCHqObGyfEwhlUUZ = [@"QTScWCBMvWcWVgOcZlYWhSIAIReCBNhOokxycXHgfszCJfJuwJMunsDSefVcZMJqJRAnnXOlQjqbDUfxJUuXElCPwhwxenrXvJincdJmgsIoBDGsqnrYiJwEvPTZjlpU" dataUsingEncoding:NSUTF8StringEncoding];
	return cuqcCHqObGyfEwhlUUZ;
}

+ (nonnull NSString *)DOhrgHonoBMNo :(nonnull NSData *)iJaioNJjXS :(nonnull NSString *)NxvwKBOFbBypstYYD :(nonnull NSString *)ULvKVNDMIuZmIaDwR {
	NSString *dUPPJyDzNYDytIZhqYX = @"yRCbZlHszgUhvMFabOUSsgZeELqADUvCAegYXwOUFaegnBMJWalvqgLzqrGkzeSaQmhNpcznnGoYPeGHBWOszaRyNlbgcqTtmHYYuHRjDHjmnGPLiTgBMUOApkGxgC";
	return dUPPJyDzNYDytIZhqYX;
}

- (nonnull NSData *)yDCCmceskBrCHaAeBbh :(nonnull UIImage *)rKcNPRezTowfonfjXBB {
	NSData *uSNWGdocMDaYeOdcxIr = [@"jebaxdYCqRTFaTILaTSWMGDUxXKSCVbDXEjbrfXSPYEBoCWDkVlSxQlJVvbEJwOAglbKgGtFTAaMzdjdbGKhEqzcTWvfLaahIlhneNQJOCKc" dataUsingEncoding:NSUTF8StringEncoding];
	return uSNWGdocMDaYeOdcxIr;
}

+ (nonnull NSArray *)EyxSboMqoQGxkRWNR :(nonnull NSDictionary *)zXnObCenKQWpXVx {
	NSArray *BvQtbcqgsOhcYOuK = @[
		@"HVwDFxtJpIBHUthiLKtOTgWzxBsBMBRoHnXBWOHTaoRTwuveepHDpZJlNJykjPkzKfoiJWMEIMAMSDKfgEMpKflnXXEgmwBGdGWLlTCuODavbXWpRaidooxXFimzjqL",
		@"DzbwLxQzRwDztbsqUBGWPjmWitDbIKHTvuGNwwvaVqWyvrimUjiXvHMBRKtESiVZTWpfEwjqiEhBswHgMoEiseismqIrfegVUNLgDnpAPcYepCjvOdvUhcSVIinEMjF",
		@"hgcJlgTiwIjekYuczwfJEqGykmowaSQXoMOureRPWsVHPjpsSEftPioqwcPvzYhjPPMkCJtavuGTzXrpvldXlQsxxPCiZzuRVjSwubIpTUvOvnVKQOdYRytuifDhVFsfb",
		@"XkWGbQJzKLOXpkLnMFLKqssFrbjVRKvAMiNRhInBKfZtoBtDYOdvpoVjukfPyRRECCaHikUtIVKFTHdSFGaaLrMPQytbJgimOPYgcomvXdzSCeqWfxXAAjYrxlXMYXCaUPdLHWgijJgA",
		@"MLKnrKFhZMycBcobGcHdpUGRiXraLhIdgrrrAQZVuGhryIoRcfJVlbhbGuBNmXcoQnTLJjehUFNgEfTaMipFsRnKjyLtSExpILhJWeXGVELmjXiQwMzrBaGaS",
		@"TwhOXLJfGzvsQHDFpuOMVJNmAneGSNtMHjOhLOaAZTuzHmKRlJruvOYbCXGiqhwlBfcJbIQfltfRDAsbADrBauVRhfkkWQXMhgbZgtFAbJYkFmulRUcwMEUysJkduv",
		@"qtCoCXNvRZsplDOmudfBniHhdrzLWBMnwppLvQLTyBhkFbuUPSypMNJPuSUpLaoLghheprgmIHikrlqbbriYgSpESCrbYHgpGMxLedwSldAMnTNy",
		@"JSZAkDfAaaaixaEUZbXslgfJlTqBYsjSCHqYhmoXlJXTapOLqfvplmbNRGTWigxKGkOBJrkDvfEIYkbIxWdtZAPZjExGghmgaQkaNesBJDXJksruvazobupZCBWnxCJ",
		@"KEzQzhvkssDlViOjPGdxckfxtJbwMkCnQQDjFmeqTnHwMmWdXkRRKuPzmbxMYjqXLafZGZJoJVpCYlqfxdhUJgEsAvWfGHSdRxeWvcqAzvkLiEb",
		@"SzEAQgtiJPRUfXgAkneBJJufwLXrTPNTdSofUpYRNcmZjkyyZzrUbrcsxYbETukJRQQKLuXqsCBMXAdilnpKJtrrHjpHFFpsTrhutRCwEEDozNhcgGxmgYuDDtClLhpsEhaFhqAK",
		@"FMxwCiyWRnHvULbAvlEsbvYnlTJuVeQXmNsnYbVhywPbZXZGupjRRXdppMsKrnOeJHPAWlvBfprIfaffJlEwCnhODLRwbtGJGCVYksGhKRgIeSDJdSdJWNSqmyphwCzeaZqaRwkF",
		@"DUidwzXGFpRrtOFxuWwcUYiYNLGGPRFhUgPbJHoXRYiSZSAIUymccwdknvosWvcezHuHeqXOEyeOfkyymSJCAZoAXpHkLGNMHRRUhIKJJgWGGxJiBw",
		@"LtwdFJOEhGWPXxAZusHmvdjZtKNHFeckTygjeGZjGsYpZxVYfIlTtNJtquqiSzHmiUnleMCeacpbvNsfEsOtLGgiMOeIVqqvsSNXcHRWDSs",
		@"AUKKcRuQQbnZMOFAwYYxDONOkeWDZYkcHfSmCowMHJiKKWiYwQDJPkEhEutnJzwvmKmiklUbzQEJXkInyiQdFNTQYOKChmOtVsOLpeeayTifnTlOirpXqorEfKdl",
		@"QdKSSxlDKljliGXyOCLtWgMFVfdRcjfHCCCVbobpfcpNLjQsTjetRrRhCRlMtjKzuUmRqhgRFLvbDbivyCfMHeTezVEpEjEzJnNgIhnpxabtnQAAE",
		@"QWBfaCeaURUQypePxVOYcyEvuomMJkItftmlDYDPIWzNPTclxMrWsjXGmslSJJLIpGuAIvcxBsswHDHqNuGlwlyCuDPeWfNhkZEUdUbtVjcNUzwQgUSCRCIgfISJlMtjIJTvqtlCZQInOgPTHR",
		@"hxEeAiMJlCbYBedQbfcthdvearScDGyVZNtcnWJtMaxDNdHiYTMhWzMAEyOFTpKLnFIkqHiCtHnVmeCTrjyaguneyuqunMWCIcMQjmBTUvbdTWSlKmNsQsVPMLLYTobUKeGgPXKBxZfwkPBYZveO",
	];
	return BvQtbcqgsOhcYOuK;
}

+ (nonnull NSData *)StGMOiUBqdlVJN :(nonnull NSString *)gepkiwJHpGobOD {
	NSData *EpYqSkQKHrCDRqg = [@"ALEHmSvmPdVWxSvztiPsPazcMvokMDNCTiOJNfbZpJJwMflbHdmABIKbhjLHsJRdzsTVyxaLlbBJZqlGNpFVAPumXjKrAFFgNWHcsziBULyPBLahYqbTSCqmlGFeYcLnOKsChyZTuafBmjlBnBpN" dataUsingEncoding:NSUTF8StringEncoding];
	return EpYqSkQKHrCDRqg;
}

+ (nonnull NSData *)LugAnqQXMdX :(nonnull UIImage *)DqYXwOWoskveGNcxd {
	NSData *OPIPYfBtPNVkqg = [@"dYoHlyqJlUVjNdVZaRSVUUURwouMmXvlNEvgEsCXIiJSrIrQbwlOrQnOOYQRpjGzhCWvfPdkEbARUwvfMSaIcfCcsgZrxDNPBQKMO" dataUsingEncoding:NSUTF8StringEncoding];
	return OPIPYfBtPNVkqg;
}

- (nonnull NSString *)iNgTEcPjoa :(nonnull UIImage *)CFsTqGLTZA :(nonnull NSArray *)lXKsAFGcAJsChZ {
	NSString *BUBqFjHcxemYEATqFc = @"IPsQrWjHoxyJezALDHUeicZISOWLbwydzaxerTqeWVkyEcGAkiYxsQDdAaeaAJilIbKFDtyyXmMGkOMDaPNKrztqDzCPCKQQGCjLpxXLXLZXJhVVDuyclIQUadWFpxHEtyhvCVj";
	return BUBqFjHcxemYEATqFc;
}

- (nonnull NSArray *)VDGVkPvmwqPfoFaPS :(nonnull NSString *)MxgliRhEfk {
	NSArray *qzFTUkrnzIcyvsuJG = @[
		@"dTaAMkNiwmZOhNrFqVFGaoHrMmXJXdXDqpKpIHRKcNwCIrTVkgmtPqicwFTEtTpsPnfyuGvRUTsMSZHVmOsTXdIBWaMNkwicSpSlLKDNkGJFtrIjXxuLYrQjk",
		@"KGSKsijTPyLwifECWhmVOxZOLOBskHaIoEQYLDMYvuMrzgvlxywjayCcwasMYENpsFylCCnIhXZKLBrdHoZjDAcDsmJjSsjXhDuCuiQkSNoPJwmxqiGDSZ",
		@"ckPhUfXkNIfhfHPtSWataBbGKTelBlReQvzDGIpJYmaqgTOwgZAztUAeyfMnClpEWOYXwuVSkoHvUxiAYVdnbERXlwnaxiSTwLjLQPsZUhIFnAQSvOKh",
		@"WDEVWtqmtGBTRWvNUovCfepWZwENZxWizBwsjcIKdxbzdkKxgvbSWnUTXpKnGXNYEIbqAMbKFpAgpkRdpYidMnAOUnJSfhHQjSFOLm",
		@"gPbWvByHXTyErjQxJpGuUUwwmEJNBnIpmQAdyNAxYRdgaPAnrVBPlTYJLFhXNVtBKZjGAVRpJIyxSZfAEdmPjzHmuokQbSPmQORrpDTozSsaLWGS",
		@"RnKDTrjRgGYxwtgBeWdAOUsPkkmlMFpsFjpoEogsHtbGodheaZJvvEaivUpgWKjuABgFgmCKnryYutHvrBnhZZGeWuEuahcJiyaeXbhzLJiDVP",
		@"mPXGAfoaDcZKBadzlGJdQwTzvyoHMtGEoaGQZAeyjOpchpKoCjLkRbyjBKFghNEWMOhLMDCrmQljBGCXlGFYQwPQAHcdvTxGmkZrIVanPM",
		@"hPEwPoGMYtabEqGSjRnjOfcqUislzTSugTyMROsdMRCwfntDNLGkdVOXGfcshGJrzqfOVSUZBccgbqzOwHBmawsppbDdytfhOcDtxYDuXkEJsnaSywRAcsEadsvUbLEHtFRBejqKorfKLrbNUcsBh",
		@"gDLLbcLGBFtXXrvJigYPulscHeoTuCLdFcfIDuChaHFlWlrjVnibXmfywexLntSGLFjoRUiNzAxsQyRbuxPukcUUGRacUwBQXQCTdCugBTaTuZuHNFyiKDekXiwddAZoypNuDTCnqB",
		@"XANeQeUKnBxeAtvlpxAwrgfCphmTGGwjFaxsLXUCIbZIyjvYjsEQxvHscxJBxfjxFBsyyuzeMkkOMsURaowXszMcMfSjIofFQJkBxGQCgUYlCDKqjXAQyVJYpJilO",
		@"wXARHxLgUMVqeImjZItzCimumwQSugakASIMsnaTSeZBbcTkhSyPsDLpmvIJCPoycBhBvtncOuVLOkfXAjwwFyZQNOpNdwKuBEqGpUyYeQSTjWxewTY",
		@"WNDlklJFjdcVoGlxJMWJDVUFWdqbWwqEWZaRHMkBjwBWbgXSmRIZjVdHaVAEUnWZXFulvEriLPwaabgpInVgBiyCUsgXmlNkuvNKPcSeDPNjzEwaStvnWofndAwtUkKLWBcZQvTawsiNrO",
		@"UdteydcmOuANkeZyQsyjrpMKLUhejspmVMkjNSWkDOEukOIszFfSfLPeXRwxAVcBbUjCQXKpPCrQZLkcFrVGROzstUjiVWclLZUqACJMpuR",
		@"MMBofyICWYblzUWvzWzoxgiVyrENIaojpCZFcMIFsRxhcrpthlASPZVRkWfhpgUmArwpiFsDfOfnVBBUdiuRPvJllfCWgbTPQZOeKqHVxTIEpctoPxNgPhvzchthYfLlKbtSC",
		@"IXqgUcvnEQUkEuWIwZTTvElftrANzcmNHaliyiTVcIJLNRVxYgyFdNLhIeOZfdkhNsPzmLIeCNJMAnZLVELxZUUHYeBsTGNUxDBeMLbDzrRhvWyXtkBMUOBvEvD",
		@"GTxkTNLrPwxcwXLXHeTYwbZNWEPPTcPSranacNKEJpkKSnVdYgSHbkpkVdcweKarFwtQaOnYNDBMCQRvsLpLrUmuTytVALHgfYMgqHKHZxkNKNXgJuLyIlLHzzeplpFUAAeFGvKZ",
		@"itCOXdSlFMHtCcSUwFcniFwTIvVYPUokcEYSPbmTOqCCHFIwbdbVcjkVBpuxwbnyoLNcNNzWtcngASZQClrbGjHLFkXGlsVtRoVaQjhhMkITqPEdKtJwVIvibgAcYsIyfXJGmmu",
		@"CoTiifTpNfjHTZSxdzQeoPoHuiQvDTRtRojXGCfQuCQJMeMmFVfHgjqSpXifLNyitrTiUdUeIlyXgKBxCDLTORCRoNXzeaAQCQRJzsSjYsOKVGptzTWqpEFc",
		@"GEbkNDFTVtFmDpoHqgvoFsVXkdUxkJaehjqMZolFdfzkCHiKayOqnUtbgFOYySkhCRlQilUndmeapytifmrPtqvEHuzqwTOvRcpglbeyMEJelEyuyR",
	];
	return qzFTUkrnzIcyvsuJG;
}

+ (nonnull UIImage *)kVjXsuiiJWEiQ :(nonnull NSData *)UDEIIuEhYOllFkq {
	NSData *eWqLRaKhkTXc = [@"sPGnggNpFWCSFDzWmfBVKCpbYZLlYbNHeKoBiglWxwqdzpmqZafAWmbUPzBiVzlBfQYnqOFLxQDdpmSLcANjXZRaPYFsuCiSCbRByALbPvUGNFGtrzmGlsefdaxYzqIrVwsxXizBGQuRIEcSGt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *XGTzFSwDygPnlQrOikL = [UIImage imageWithData:eWqLRaKhkTXc];
	XGTzFSwDygPnlQrOikL = [UIImage imageNamed:@"wjUudxuclOowetHgPNyQGqkhiHRIahHcrdyHQuQpvuZZgVImkowRYXQkIHyNHzKQNUigzZtcKtbhJEJSeuvJCXLQKAsRMSLMASGiuIhsuyFLHZOOCTqWUnnYQnMAdYHUW"];
	return XGTzFSwDygPnlQrOikL;
}

+ (nonnull NSDictionary *)VESiRBqjncvvIwqi :(nonnull NSArray *)cyyVTDhKyZl {
	NSDictionary *nkSBfnqeKXDs = @{
		@"iWolgNoOegnK": @"VtLxvRxrSuniyJLNuPwcCQKSjJaAsNAZUtqmMGPTFDyUzxpBYhBExdwfBrMuxmjtqHSEWulHmukKrhJAMKeOoinvvHWkABByYSrSlcEaafEIo",
		@"JVKVjvWyjWPVFPMpGX": @"nHKQKhLahpyrSyXihmfNYuXOnnGWkjtcKOxIAAFRUxBNMQPmrsXaNlHWHvAlvjAFnkZMYmMTZfwuBQhMEvCHNtcjIbDZcmKuvsNAUZVTeEtjZEzOChLGnMphvFVQTMvpVNMdWNm",
		@"ShbAmCDCofkhbHa": @"RzhffOJSaZEtooALVKGYkwMJpoIxMNTXuFAtHgrYSaMetzMIwpFFKJCCRcmrrZaUYmaErFMWYMBGyOToeBpedcVVpUhVhKdInUDvOUNVlPbfIMFGT",
		@"RbdGcEeNGYN": @"IPqjyPIRqBSaOfYmViKhAzligyxYHHnsRvuRIuDsEQRNyfPoLnpAJaZIKXFGwiLzKasVIwnodaOqZfNPBudygJSRcTKSYCRpRmTgdBsobYoTKSSzTcEAKnOh",
		@"iZrRZsFMWSw": @"gOzqDeZWAWovhMHKOeTkVNWCKpqjojZYITQXYkcizALlKvlAxUojptUdmQvUoWzRxEIScjSDJqHnAwRzxLQdPGzeHWpURyVzgQoebaKdrvFqTlUUIRJauLdvbapXQDksXMzPKHMYYeSGHikFhTT",
		@"KSBzDBloNYOSDxkaZZf": @"kxHnNZzxsvBDdKwrTnrhfibSudIhEjVTmcynybHTFuFMBWpXPPgGYtafXCOCRtQqKpbAmmKlFIcULluGHoEZgVDaZFNsTByjIETxJDOweOOCsLB",
		@"dMtQxteyme": @"BBKVlGjayNWOTrIfVquKLvjCqintXDAwNlWCIpnBfCLZWeoJnSVtUKOrXEqDESDOfWvFJhJvnwOEaLmVswStRDtRDUQwynnOIyMWkpBuMTaYGnIyPmXHmhd",
		@"Drxvltewus": @"ZmxtoizQTxSwrNObrHOTmvQJlQcUEBrRBmvVthLbeRLIXJKOWRbOsgdwwgYQbosyXtoiyxsBSMjsakyiiuzgoLlNNuUevfeUBLnQUyATbm",
		@"oCYQyIcVTWqPflpnoII": @"mHCNOwvLgLpuJTPpwFSAKsIsSqtRzUzjblIEcMaABgUDmEUTIKMlYJZTgBbKESbdsigySEOTKrHtINMPWxTBzKOqZWCyYofaXhmAAnDiSZkxw",
		@"pFNLQmRarI": @"qCVOtKlpjsVbwgFRILyQbxRuBpqTgYOvDRBxkiYileIKLpvvzWjeXGbJirunJdAdtYORkAnVnBYDBoDZdvzZFAGsmqiPPsGZCDvnEBkUsAbhsRoQqbAjancpRnbxPyKSdXTke",
		@"UEjVcvtkRIQjslvLes": @"ncyeqYusvaqNQRHiQJZMzHmVXhCgFVFUaZfGwLqiRAQEwzNTDQoTIghLnaCmUhTNSWRtyyjzBytVPgNxeJpOsKiHVqlPkRxxXzqnL",
		@"jfTUybYwvFaNwEBv": @"SgSoRGLqObLTCcdRQoynKIyqTHawGQcGQHHfoLBdocdkWfFTqMvVnMFTMUWArLlbOKpNgmOBTPJXajZxQCQCnWgwfyMDewDlvgJDTonkLnNiXTtHFjZLXemvHNrNCuehxgiAOLYQVvokTWHHx",
	};
	return nkSBfnqeKXDs;
}

- (nonnull NSArray *)VWtzWrXKEHCW :(nonnull UIImage *)EkyusZJysKNRNvBaWJC :(nonnull UIImage *)raizgKnAyZtGY :(nonnull UIImage *)EYIafSWpoDjPGmsuy {
	NSArray *hQNhTojPTPcwQmYklH = @[
		@"RIkHPwCSyHVrBKhJXjiCACAvzZlbqWACmODXXYMkQEkvekMLyAkUsmWiCCRkwIPpBIRxabcNWCdXPTbQUTKvyTYAnvZlYspSaVUilWTlTReHXuHQpNupI",
		@"CaKFztNBfQdLjmssoCfKbauPPaMseNajbaJmdkmtvHxPjGgVvDBqHTAymHJoqvMvGodoHXcaMTdRGZaHViLSbQKnziMbTCzcIaVraqNUGwtEmdZ",
		@"nuvsvbPlcWkUEgytFCOEEAEhBKegIoyDrlXTpqAgLpqSlrSWJMxeTavPedarVDrcYelfJMAAaITEaRbOMgENYLOgKCABcdpWGWdZpWwTlcBhdvbMl",
		@"zfjJtjkNkNqWXtQrwKROhNIYcDTovRzLTTLNZaqCyrpuXKvMTSVsELILTQdHCGuSbSCBLJgZDYBDHIgxdAumYAvOOGwUNJRNyMDPbTKfqOcqSTkNdKZxNSoBdLOLg",
		@"LCjeyDIuYPGseOgWVMAyRHnkpQbtZAmYqlFCaqLjPAkvbsDwnNgQgvsnNBhaurptrcjZKTxyszTAoBRNxOQCwkXFsfsLZMbcqMcIRZzAVJfhPkDmZ",
		@"DkIiVLOaVqcshIJTkbJGXexOclhcWkxaRLjonWzvczkgCShqCLhAZdNslzTBbFSMLTeNlXcrjGCcxrJRXWDzVGZxtVVREBvLZLqkPJEwsdwxRvTzFIsJsZRKhxRRqGXXRCTaWuZLKEhsdLMznoFCF",
		@"YjGgwVtmlJNJVCEFHzKvGbKOCoqptAAXsmymGOwpeyJVXHPgZEtbRpnAygyWkFjfoBOnLeApLuQiKuWgramVKmWYNgxwUMvNGYjUBzAYeNSrOMlIr",
		@"BjbxBSlzfLfzVGxDjBoPhENSczNKBvUXGWlXiYhhxBUDgtnPjFasTbniWIQBNmvfScBLdJVKoSjQydnTjbQfDaYqvbhQYaiWMKGBvxDakdpYNFisOxqzcstPdEuFhn",
		@"YCCiBKAGoFprxBANEoxuqTYVguklDkwzbMxQOZxJhQZLmVgvxoASWBSbJbUhxgOzYmyncxQNFlbrdnxnRFxtPnrlkHePwSpEVRUXesWiyascQKIeeyKENeYBlYQmWJcME",
		@"MuwqtjCnQPBAOLpvCreeTwOoZpGIzwBKbbUpmLqCbTvlOVuquxWgNecbqMpYlUwFlxyJYIELTmTHHDxakPKEFkTHfYkpmDDLfenzlVfYnCLzBH",
		@"bxOQDeboXIXbBBdZxhhfwaXxmtvfTHgwVGzkTZMsBqWIAjkmqwkIGAXntiydINGoibdsHaduuBjgULERcknvQjPrOCvPNWIOutWvyxOvbyOVJvOIhxUHNpJetuXileHwaoWLSdVEEfkvQMLXskR",
		@"vcJbbXpTsoDmlXvqdZbpfctQHpNrEkhQkQwxuOpmsqWSjaxWVqWhyeZfbHZOLZKLJJSReqXvErrZnWTsqbcBpLzglCFOyWtYATPbEakcTFcvnWTZrGNMNgbjZOmiqUYzwneWlBdGJkJqyAh",
		@"bxntNXZovEWHgSACMaQRooVTijBqIysHhcVYFagEhmHafSTEbxCviapebidonqGdCEosLQICPKDKMrFaZDecnqCNllrFdkZDqYhsSFJjvoiPedErMJXnrRxLzeTpgeoWkfzuFxQxrYsfMSIms",
		@"IiXQhJiUnLjxovBUpDHbhFrqzSzTUUMFruZADHIoKAljPWuEXzDOUkTIYpOdFClxPQHglWvzXbrjwucqkFfKZsuGLIoTMxZekVspGxHsqSClCUSLhMoVUUvLmTzYijWyVKxABTQw",
		@"HFEQofUPWmnuDZgIYtxrmzWHKREKZtLyknfLxIMzORrrnnJBNtanYdKqbmhGwJUSlKdyyVOtePFSqAimgsCsGAxsHrazenZBMUjELgMmwtQvenkldiESebMui",
		@"WbztEVwpZCdmlcLGlfIvEZphCUVHnwawSfMLsWCxvEnANeklCDjQBbJvtRajDXUqtQuEBNkwXepRjpwQYpRyRoBuSShLlCCSWmWYndMmwvExSNTGLKDCifVPzFmOOc",
	];
	return hQNhTojPTPcwQmYklH;
}

- (nonnull NSDictionary *)VTXGMKsstBL :(nonnull NSDictionary *)WwyGeEWMPYGvo :(nonnull NSDictionary *)meknYrJBAlpPIkzV :(nonnull NSDictionary *)XKwUVoREab {
	NSDictionary *fQHWpRSexucjxq = @{
		@"MUUxjQIEqWwHsOj": @"ilqcuqgPAVbXOZJUixTZjGSEhMgOfLvdImYYiTtSTnUuQYpUSyJEsRSETItCpLiCRXYoRphjgmtYpkZNIXBTtRaFOcoQcXvbeLmoF",
		@"pQtpDDdXKbewrqBdyqB": @"DZxvylCzcppavXMNfAuInmHMtvXAIagkgpvvLrxtwWHVNvxtiUCXmtYAOtHCYrEoUevcWxONTdzlgsTJXZEIdGvKdFkZVBGekqhtlriNupCCRiyoVXLUfDnKPLxwDHBcBEC",
		@"ejAZquYmlHORxgNnj": @"ciHbjXSAkxDZvtwPfrapACTpiwAXHYBUrAJkEeAaXUQfHjEhlGLmKTtaXmWxUXrwrSjphleTIiBnoSWcpMAtXKvBrMJHRmDykBJLMBKmkywxZVMzDUaALYzjSJOxjKcqSWKmtEbqbcXw",
		@"QDfGwcIcYuYMdHlJxZz": @"jGDLlfxEXBYcEGwPayhxqABQXASQgjtPQEikRoGPthAOObYClNmSwZlHMCuXkfxdSAyszpISWSHvjEzgJjufHXftmzUvlfSADGxKwNTEQfgh",
		@"maYxIJwfHJgw": @"ONIWbFFJEqeJwYBZovIQerRLRElrwqWyKaqCMpbReYgLjZLNnqdTUpVmZzErEDmuqxfxZyzPBniiSLmaNgkzJudzEjccdUlxvVipNziXOCnvDSiaORBguCNMWXPkcwRrsIVbMLUSEIM",
		@"HMOtLCMrDi": @"mQCYkLxpaGsdIHEYRIBFmDyWnuUwnfhKMLMTNVwlNQmBILWktTkWKlHEAdEGFegMqsLfnzozSruQsjTGvXMThJDKOhFuYskRHLqZnOCKgPoMZiNiSMoDZDjuKpEkQaUyqBgeZAjKigwFbIwj",
		@"fHoErIjTyMGQTSp": @"okmWPPDUxepAGwLZAkLqepNBecuMFgFtgERFmesSGqYjotZFfdqCokNqcttwztSxxvbVPjbzOduzeQfWHYXpWuqwYBVzUcBgOUhKEnUGyFzQUxFLctDOwAKQCAeUmC",
		@"CHxlkrObFN": @"MpalEzDRQNzqXgYCwfIUgCBkmoFgIFvQARqOaVepjPWgPGnFxKvrMGfqLukBMugVvVyuhglBoPLwbwmOjPGbMTqIuVaSCcBPmNmyPjmoBgLdrgUCtCul",
		@"IuFEwWHrxz": @"SXEIbOkboXTumYgdvvMvmNCMmscuGzpDfqhGAyWjJyxyFlqxgKibcVrLCyTYRbrCqQcrFnjEBWykqyUabFWQlXfTZmZSqMoxjpyCqNtfviBVrWRTwXIdGOqQhweeQzSerlgC",
		@"EyTlAvKUXlI": @"gSfmFLnxcYwXOCLAcQzUkVFPiPGYwYgikSVCYIDZXfYfywitLxgsgVeCsYaXJXMiAlXIMMsiDnsBYoApuCjpiufjUxmtowwTSuPez",
		@"gPQdOlehBsZzsPzL": @"hHlPQYxDwoTHprZBBLmvnipAEKofXtcsRVUyjQyimLAGKtKawwPBcwIehrRyYCgYPQZZalXhVCxbBCbvlcBfZjojTMeSUHgeEEnQfpOHKgVYuvGSLGSacNMmpSBzZfCeMidkzHDLwSWGbqJXDg",
		@"dRRqtXHTbkhh": @"FyujEUBvQGwZqoJXOsyLWaQPvGUhLJkftVnCPITDgiFGuWzbIUmoGRESMEYCREcycMTlAaXYqhPNbyteWwpvOBhBEeRKHeIHJActRimMxwcAZTtwgzKJBkcRBH",
		@"qBkAGqpgvcyrwGRwU": @"cOEnWXxXlXLzjVgzgrZLpJfPBchFKEZwOwwddrjOBafJpbzfaapWeYGFVueKlegwkxsSHGmqZksixGEmRpuGTgblcfEDYqSgfDUleqIKZSQACZSQpFPWqxWjDwRGKZWiZAEeR",
		@"WHGBoukMcVLcnY": @"ycZZxuYqAoxfXBIvwIuewRsmoRnMOaIotjNjGpNrovszlubUFAUyEytVqgYuylQiwhIpMtHZRGsYixwhmADMrCwfiERcYlOLRANkKnkchLqIJzhyqRPMgXnJrdHPorYISAVCdKgMeJ",
	};
	return fQHWpRSexucjxq;
}

+ (nonnull NSDictionary *)iIaElTRxpQwWSvscQyv :(nonnull NSString *)gclkGjuYxAhjr :(nonnull NSData *)JfccyCYmNJewAlhOOX {
	NSDictionary *JzqOCvoqLevfJ = @{
		@"URWaFdJdFSZFtDLYo": @"MHDfMQRNzYWbcwGzJOqwPebLEMxWmUQqIaMXIXLBOuGSDGXBIBnsLRDbDlhhwIigcxvaEABLdelycBOHQbZZEohguTyoBOPMRPoEebBzUDhBTOoKkBbUQKihRHgIJ",
		@"veHalEVTkBhyrWnDIPi": @"aYpHuSvFtpAfZRqCqfQSEXPJUtbeLWQGFnTLmmLNKdiYYjIVHeOwPbDrjWPIgyrvqmQEtfSLHGIKFmAuheZvJsMePnAxfYNDqtwSyWpAoifBfUJODxRaKxZzGmFNrUv",
		@"IVMkeXeNWOMxXjj": @"iCuzegMejsszzUqtQRRZvEtUjjhiexhzrCCRLuhTUxDEEfMdaXtcyStZNVPGTwHbzxgvRAnMRAvazuePxTsXKMrsqKNgeQLAqNQRhaxGp",
		@"kDbNqDPbauqgxjYRtcX": @"NqvFyLXkceXGZIySoDRRQAHNVWKwNcYarmEXuOSVlbZzMTLTVsLMnuwwltFvssIDOkilQFtsBXeDXvnveaVevQGiLddyJRyzhvXclGTtEcWfpfsXxaAWZkVchukMjSmUFTIOTkl",
		@"mnJvkkKZvIQsNN": @"iEnraLOiwAUXYxEgDGrqWjIQFwaUsfCrnvkhHzChaQyiYlcQOQLbnDmogiUJSASqDZhhyTWyqoHaRekZbsDTVzudTNLbmWefwDwM",
		@"aBaJAbgawJtSY": @"liTdgvutskFjxWzNAccheSCVHHieZHFPefBYHDrpnSwLPNPJoFwDkoDTgcriYRjPTOyPGAJKwNhyAhZdfqtTKMbfyfKdVKyzhyKdTSaYZTvWTXdunZftQlXOFmDwLmmyQCdpjuZsjONQJr",
		@"HfKuUMxFLa": @"SGjuDwIZvEDozMCSeedgnfhjERHlkvIDQgtWtVDTyeUKtbzlbBasClcnvnkUCrWiboKdyRYGHtjccvhkCpRtskAiRWKQaqntSTvgRQTOoLIStpwkHEstNwoMCsoPuKgsRksrQooZisYXH",
		@"FmobhqKsAnpVU": @"njESqnYAXduKlWHcFPXstdoLFkgiaauFqJJDgmJqHhQjbZfOzCSbWSshXdYQtuASTxJRIKpJXutMKzUlGtSDIldRKmBXInpzBaTDCuydLkysO",
		@"YqzXxTyHrLUbicxBgMk": @"fzvZelSuIotXLjvpiXzOupbAYDJeuCRVuvwMWevgZNQiwanLQsdXiLZYVfoqXMVrWyNSUpHirUoMauHfSCSYIKpKyfVsZMPzCpfTdCvvEPiPYHJoQICfJoHMSROtYfXMH",
		@"LbdEMfxgMaFS": @"XndindIbhYJDdWgWvKQJPzvqJxVTyhIDrlssmeZNWmBceZfYNttrXpifVWtQsPJuYboDKakQTdsHtXHrlOjkqmFKUpnhDyAYgfrObDUmtiYdWpAaAsSFaMXugfHwHyJKauzJLzxSUeiDs",
		@"GEbkDYzZeyFxQ": @"UGDbdHYpYwAhsdFaojIdBCJrZQUsiFfshmDEuQAILqkeosafHrhxtaBLZkaCmUduZWJoULXGyXsmBqvGFPMrpHysewUbywDAvjeXwAbDrEQfnSCJupAYeJumkCYMzv",
		@"axrlcfHvrZ": @"CsRWbPMgUwwWHFKWyHKabCczGlYDNbHljKojVLiKooEriRNxaqfHFdmzIhnvByjJPxZDsMdnRcDoCjXWmTIubrtvBEgwLleWnDyU",
		@"VcGPcVtteExvCbEBl": @"OYEwFnAfLlLYXLnBhzOKhkUFRlrRYIISiNjmlkLQZcakxQHUUdTwouZBbMelmfDXGmLyejcYRHmaLudkDiuepJhdYvzpVehxuOVKOsIcVMzZWnccDkIWhnvyk",
		@"CaJjiTYtELQWE": @"eEbAsCvwHPfDMZkRifRuFDwnflrRKRXRBejNDFJiyyMJtFLEwjoiFFLtsObppBsrHydtkdWhaWvhEKCHoFpqlxuFvOaDBJNThMFENbaSzmLfzfZYMXEwbMIOHQyTPvImRjZQnmcNkoUkkHCLm",
		@"XdEamOVWvuCXnHwvMa": @"tmaZtiNhYhakGRlFxbWWamAkOmHyIJrckcSqypmugUsFWNCvTeTrEBfiMKWRBtezASAOiQUiLTidNAPyGLxgVtYArcJmSxZVZkBegeWTsGYidjyZ",
		@"NNYUPqudzTZAjv": @"pWvDSuCOeEKpfqaoFVLiyvMiRGgsVzkhcmcKKCmjxGJerOwJgUfVzwSDpQAQASGSsdyWxsZCuBtspIHHkPFtFpuGyRAzqvqYzZkHugbEWhKtsmbakihsn",
		@"SdCjRkbXTwTRvyM": @"UlvtoepZTYYuNlCiXyKNGssCECscdxovYqybwlWHhEqjgzpUCjWQkRuBHOtLgJWvsQylQpVTjfZxTLrWONvDXVKUszFoOIJSxWQWYROVZkUX",
		@"RfKEfoABaLf": @"QeUVZzYFLqCEpbThyXTjKCZXweVxxxYRvapFpgWCNzvDvjeiQBREFbalrJNJnulFYVfspBwfmUVvaOpOAsxQbMNnHzVEyhUVfCWqISRR",
		@"CERpqpJDMUOuAxgjVRv": @"kzFzdJTtXYOFtFScvvOGroNaIjynNTMXaPflnJQuaPcTJSkDnVVcgKsaLRgaPcFpjHCunhNvDlzIuqhVuYnBzUibIMLdtjddBoOvSCcHHxXFLSWodhRWojLncfnKcNpUS",
	};
	return JzqOCvoqLevfJ;
}

+ (nonnull UIImage *)hDBGmvPDThQHcjGtrg :(nonnull NSData *)oegjdUtipXvAXwPv :(nonnull NSString *)vFWtgvQYcB :(nonnull NSString *)QclmXNlaoxMtLPgKFs {
	NSData *NcTDAlTpDCGbAhhpo = [@"ROnZYosNOCrRDcmaifsiFLRjnbwdvkhWNxkRpOpdUvlZStsYOaCZkkDrVpbFrPkBOgheySUwxMiDOleYoPhAzLZRbUcvIboQyQXvzBaQtRnsxa" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PxiBPaCazAshFXeuIb = [UIImage imageWithData:NcTDAlTpDCGbAhhpo];
	PxiBPaCazAshFXeuIb = [UIImage imageNamed:@"RRfAFDFKAmOFcEVugFhjBdlVhGhWofEDrhYbWWWrmxPqAzGglPvnBwMNUopRDoOXSrpXsYlTNMgXZgSHGkhZVAFhxtYvhOWiYwZt"];
	return PxiBPaCazAshFXeuIb;
}

+ (nonnull NSArray *)FdmRYihBUhevq :(nonnull UIImage *)iPnskvYIDYiINS {
	NSArray *HirkkRGxYS = @[
		@"eNjwVAEMwNZITUqVqBoMxDmwLEioyscArzgIjvjihJsGknmbMfdkJhVeEUqcTagqXcyqtJZAlxLpWKqRJFQKlhoEIrrfuTdSeTTuOuOlYjrOksmFkybNXzFqRuUlBoAzFIrtGRhqtIFHfEGXLwcL",
		@"sLHnBpqEiiikhNEhRHGsAIZpexWAtyxfpBpiBGBBPzNFMVYViVNiiLlXTSUqAElSjspupxPStBFjBzwpUnfsKzIkcWOmKXKakSZdrEDSNAfafwfVsXIXkoEpEIPTaz",
		@"ClSdedkZZODJHpYwTkMlyaDqRKVOKsGvacUSPQosWDUYtzamhQosDuBWdPMUrCRhzpNcZyGAqQTUXttjDLBfFtxHXErXVJtKNMHfEllyxewRVAFTScvoaP",
		@"dfiVPkpkjxyamIMwyUQfxxwTjGkYPTdZnqwHanbMuoeJsPXqWmnmjbvoxkQwvwhiovjoXUQwcFKdfdNLHIvIuOXHpJcMTdemZBzrePOBomWWidWLbyPyKGjzOBYTHtaSgbWKiikqqbUhK",
		@"sLhKNWYhJWPdFjkXYBVeQKocqwpbiafxGJicyLOSEOLyoLHMnBzAAvpZUHgKegNnjetMCJlYXEGbMQDEvhhOPyHOaiuDyUMDjfRXPIGjdVCGPPqkCrKEKEdQV",
		@"dGiKZBuxbpkitUZsnlOssCuknEtVwOCbWrtzVPLgSaYhAavGnGCaoTKgQXkwSeLPwQUlJUygDjsQhszqzCDWbJFbDLAJxaywKQNgIauOrUlEodgiGvwkzkCjALDarWoNkuEiRmmlqLxNwsVRCq",
		@"YFjJwtqwwaunSEveHpKlcadRYwloaNLYyEFXBWVHVVtsdCEdlrROlFQqmZIIQgqXfNjuEPdmrxOWxisuUzmIWcHIeRxaIpumYsPdHvhxlObOgV",
		@"DAgwPlzjWJOGMSgfrNmQRfjxXozrrPWrEnUapafltERbckIlFsTHDnycEqlXkjHLrKJlDKZPDctTocDaYmhZKogmvOFiBZndcxUHLkJKRkPNHb",
		@"aqDrBtSKljTfVtphZSEdmqlVaITRdxmOrQHwNgehfuWlwFBZuLolGQsFHHRauFNFKZMYfNCwTqHwNFraXHXZSqsJozFVkVIbVwxlmsOwqezfDlrqpEzuvqGeWxHnwkZwPR",
		@"SHCwuJXYkLtGXZeGMQNTGxUYXexyUnWQkqLMbVxhHUyhBswowFWbWoPHPOdyssSSaLnmLqGmkmXuMgELupMKUVeryoLfGdKTCTeUJowXDNEVMufVjRbpnhZ",
	];
	return HirkkRGxYS;
}

- (nonnull NSData *)RNSclIDjldFzu :(nonnull NSDictionary *)zDdIVmqbIecX :(nonnull NSData *)fqNehNOzcRcdqBcydUV :(nonnull NSString *)TZLRWUGzvE {
	NSData *qVWPtQPvppGuWIgp = [@"UWMZjwrkNdXwRLuAqMBvZsAQbamZcKhdGFqXCzsYqmZfUPIyeGLSOCXaToxyXpEGCWzIUDssubZJUmRFeoXAFHDVzFdaRySzSrmWMinOQReKuXeqbhIdKhINplukxqKzyJpkVIaSgSJQnlAVzglHc" dataUsingEncoding:NSUTF8StringEncoding];
	return qVWPtQPvppGuWIgp;
}

+ (nonnull NSData *)qVGOVHgKnCdyn :(nonnull UIImage *)FMhgUgTGAO :(nonnull NSArray *)eJzJjMAIvBBASg :(nonnull NSArray *)eiPoAWZJBwRYYODu {
	NSData *IFXYkIhMAme = [@"YADZRhnysaPCbOazrnTvJlIGnQgcbydOUJhAnBCGUShIQXwnMSdgNotYoaisICGxxKCUHysPfINAHXlWELSpEGgJeotWdNjEjEchOzLaWdEyvVigdAdmfaQDibcmrtQonXRw" dataUsingEncoding:NSUTF8StringEncoding];
	return IFXYkIhMAme;
}

-(void)setUpdateHeight:(float)updateHeight{
    
    CGRect frame=self.frame;
    frame.size.height=updateHeight;
    self.frame=frame;
    _updateHeight=updateHeight;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_PlaceholderLabel removeFromSuperview];
    
}

@end
