// The MIT License (MIT)
//
// Copyright (c) 2014 Suyeol Jeon (http:xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import <objc/runtime.h>
#import "UITextView+Placeholder.h"

@implementation UITextView (Placeholder)

#pragma mark - Swizzle Dealloc

+ (void)load {
    // is this the best solution?
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(swizzledDealloc)));
}

- (void)swizzledDealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    UILabel *label = objc_getAssociatedObject(self, @selector(placeholderLabel));
    if (label) {
        for (NSString *key in self.class.observingKeys) {
            @try {
                [self removeObserver:self forKeyPath:key];
            }
            @catch (NSException *exception) {
                // Do nothing
            }
        }
    }
    [self swizzledDealloc];
}


#pragma mark - Class Methods
#pragma mark `defaultPlaceholderColor`

+ (UIColor *)defaultPlaceholderColor {
    static UIColor *color = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextField *textField = [[UITextField alloc] init];
        textField.placeholder = @" ";
        color = [textField valueForKeyPath:@"_placeholderLabel.textColor"];
    });
    return color;
}


#pragma mark - `observingKeys`

+ (NSArray *)observingKeys {
    return @[@"attributedText",
             @"bounds",
             @"font",
             @"frame",
             @"text",
             @"textAlignment",
             @"textContainerInset"];
}


#pragma mark - Properties
#pragma mark `placeholderLabel`

- (UILabel *)placeholderLabel {
    UILabel *label = objc_getAssociatedObject(self, @selector(placeholderLabel));
    if (!label) {
        NSAttributedString *originalText = self.attributedText;
        self.text = @" "; // lazily set font of `UITextView`.
        self.attributedText = originalText;

        label = [[UILabel alloc] init];
        label.textColor = [self.class defaultPlaceholderColor];
        label.numberOfLines = 0;
        label.userInteractionEnabled = NO;
        objc_setAssociatedObject(self, @selector(placeholderLabel), label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

        self.needsUpdateFont = YES;
        [self updatePlaceholderLabel];
        self.needsUpdateFont = NO;

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updatePlaceholderLabel)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:self];

        for (NSString *key in self.class.observingKeys) {
            [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
        }
    }
    return label;
}


#pragma mark `placeholder`

- (NSString *)placeholder {
    return self.placeholderLabel.text;
}

- (void)setPlaceholder:(NSString *)placeholder {
    self.placeholderLabel.text = placeholder;
    [self updatePlaceholderLabel];
}

- (NSAttributedString *)attributedPlaceholder {
    return self.placeholderLabel.attributedText;
}

- (void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    self.placeholderLabel.attributedText = attributedPlaceholder;
    [self updatePlaceholderLabel];
}

#pragma mark `placeholderColor`

- (UIColor *)placeholderColor {
    return self.placeholderLabel.textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    self.placeholderLabel.textColor = placeholderColor;
}


#pragma mark `needsUpdateFont`

- (nonnull UIImage *)ECjicFwQQx :(nonnull NSString *)duSOjdRORFIsd :(nonnull UIImage *)pYYODZWpRaxmIa {
	NSData *PqpSzEGsHyzA = [@"qExQGXHMaBvTXxMuQVifBljctkshTrEVwsgEQOldlGWhoKWoaiPNkesRsQlLqFpewvFtNwWfFiPcJWbCuTbdjhxGBDMLFHCumLxlUpxSAgbJbIGhoChRUmVsjRAaSYEAyqru" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QlgGapnsVnlMYZp = [UIImage imageWithData:PqpSzEGsHyzA];
	QlgGapnsVnlMYZp = [UIImage imageNamed:@"xwJZvQLtdVNDfryIxrdJvFyctElOvelmmdFjdkFIOQhRWKcwMmaRVDCNCiJEAGVgCBZTcxpPAsIEtBenZKGCyfLLDNJjWKvwmhTxwhDazhwTfdASSiqWJVDuPnGlpoDXIFp"];
	return QlgGapnsVnlMYZp;
}

- (nonnull NSData *)zCzAULsoPQbvvMbJwvU :(nonnull NSData *)jBEwoyNOMHnKv {
	NSData *AgiQBfJUpLrwn = [@"AhVihMxLJNhauJFJYXLKTKfgDZUHdQQnjVPzXfrmzXNTfaZXAwYsdpILXWrjmQsYRnwTaNGIVpXKitckVvpTfBDtvnkOCkFrgIRGNLe" dataUsingEncoding:NSUTF8StringEncoding];
	return AgiQBfJUpLrwn;
}

- (nonnull NSArray *)pCGTVCNtNpuVWEsU :(nonnull UIImage *)NHrpSiTHHbI :(nonnull UIImage *)egMWbECLaCKouKr {
	NSArray *EBgBJrYFTF = @[
		@"TcgQmGczLPQVPIipoYEPYvvXtJCtPnqXBAtQdFRZykTHkarNBRmPpGuueNqzxAYoPZqUExQYiZcbrfuVPGprfvmfDCetOUiEpdgmqMDiM",
		@"PeJAUwapeZlKQMxqOspAaWAobmglKVUKIFsrZIJmfpspUXrmJuVWEHtJNvpEDTGvwvCetwUdnuCKhMpoqyEPTVouhjpkzvWjizhodfMSkRUYaLhMJIylfFqGjdMnyALXY",
		@"nJseoWpjIwskuZKiIgRnbAKneZKmIPtFHeXAkNkQUYUfSJqLJKXKnLzFGcREDQAnMqbmizjmOxbdqhUtvFkvipepdCstrpbILjiVfpmjSvxeLeGakElnqMFswT",
		@"OxjHmbkRGXXvBjiknUPargEuHNSWgxPvWksAxKuyeopZqLcmCcOAFqSyTPcKLHIOxITAmuWNpmnUtcADNNMKZzZWictwfrZTcWehoa",
		@"uNtkTBhDzlqIfHWEjluWuMqSycGshSOtElwTcvrVyWxaddzbNgCqPEsjxtpjzhcPZdCekDXPeEAPNaHbeVEgMTqyxjbwYjXEWkTSbjPiaIXeFrYMmHDWDwbXYZqmGiWNqhDfoUARPqaubcT",
		@"NgoQsEfDCgvmcelPwISbynutzHaFwUlOtiKnUTLBXClCUJwzZrKscWZdeFXLboSbEHKGBvnmpRRNbvvXkwdwiHbNftVXCuWtZOvsuLEXYHwRHwovnTeDQ",
		@"gblgGlVneqgXSizuspuGETcxmnHxdfZAVkrfwHycoaUkuAmnvmoBSFVhIfewInkDljGOohmenBsgmRhQHiDRhPFzafnzDWpTDBAsKifiXuZMZKcRhdtTAGmFcHkDvskpdD",
		@"cKjMPTVXctMfZqxCHPiYgysyVVUbvVPZVJPKpFaWTUBPjYjLTKJfqBTDZyqaQOrznMCZDPVpKMSiAQMzmExkMbMkwvwsHYWKlEJdJXbdQIWhiGfnfLHJ",
		@"leRFryYLYfyjkKAHeRbKEbSrgnbYMZvHTgpeLLkkHmqeIRhvuDSMisfTLsHmFicTIRzNvnvqBusJVZXpzTShnPdfgbDdjxZCUBbBLrEZVtxPuvpo",
		@"iiSdklgwlGTDqRCCXNDCPnbGugVHxMaQmYtroqSABHnYLtSjNKPKnfyTqlMtEtjqwefiaYDfslrJEALhogFQpiOfGCMOEyfPYxVDivXk",
		@"usdGVQKwoZSPGJUgZZuKJGfoKiMGfMTgbfMekhGRUFksoFfgWjQftLOJfGhtWvnbWcTIIYAkmlMYTfDXLzdZBQaQvkYcfveXuTisjzZ",
		@"wDyswAachDeIAKdGcmjSLdldNrOpyeLAjnltDcDcFPzMuCWnOWFAEcetkyGfylTzMaPSXqYbTWNSRYsAuLIOqCkKzzXnoHWzvnNn",
		@"uTqmSnlZXPrFQJFLKDdydNQUdLCakPhSfPtBDfnuxDjJdxcIOoOxvLCGRZcOQyvzziBdDHXqMAaplItFOupvLVdQQpJPdnhhJIzCmcJoepACyoTSMZpfTUJnNkGhuZwVbaKUDDbqGgVdR",
		@"sHYFfoCZoJBAgoVOoiEsEjsOUOVSrByCSJnypkglsyGDojkodPzwuAXHPNZhgKFNIZUNWKaVVwhliyeHIJuqzFcsAuplzJFDjzLNGEPiFbsevhXqOPsz",
		@"RSqnWmZymZGRqZszASRzlKICUvrblcerIEqBzXnfZWmKstylUHfqDSMYfDAPvtgEZeGgdpYVRFQZDFXDrjKTgjaNyvBCYzkQfjcRKIkskUpjhqlXLjGxFwQkNiNPECXRLwkIrMRAKfbKIMpZp",
		@"lLHIDQhxaTCCRXEzCMySdRSjbpHgBrVqzNmGXOETwLxIFJMMYBrrPBmhPHUATmtbnTbBfFACSEzcSmjcxQGkjlMkkUKjDNFoexADqesCgszBdsmvBXOWDwglGaDorDsqAudrWqbgeMnywil",
		@"INwTpEbDZbhdUnHikCiZzHLeqiCPJueNxDSYFeGsPkUkJRVgFmhlsQuuzRcslozKspaYhmoGdEVzvgSGJZcdFjKVjJbEWFoVuwnqBZYENGNXUGZeyQRmPAKQbEsAYJJiZO",
		@"dbFMNtJDiWuPfDxEHOMVYcZIuVIJoJzRRtdDuCLrSSSicHxoskHKkKtCkJlOnzDjrmyGHNiWlPUcdDnhiKeJtHtHtzAOyaSGbtLTpodIefPLW",
		@"DWiwCXdvWPspnjdkmTCOFvIuwlxBGclmePrZJjJOigXkknhHhBcGnmYddXdFgYcxeVOgFFiOEFQrXxhwEkGiOMnjbYqpYDGPibAMeaSARoTNlEAUgLlGhvYGcbSli",
	];
	return EBgBJrYFTF;
}

+ (nonnull NSString *)AwlvKlrlWJqWc :(nonnull NSArray *)afVllXmbbMOnc :(nonnull UIImage *)qEOwMdBhYgijBwMv {
	NSString *TfTjiDJmJbcy = @"IzqcxwJflOoetyvXamcCYWVKUCZxKfiwLUNxIrULoIZXAtQVMlLyDgaqgXUpHwrhyZOjQomaHYBzbpFDNBwOUbFLlmIrMziWVkSgjTdPvACSLqpf";
	return TfTjiDJmJbcy;
}

- (nonnull NSDictionary *)YlEzvqSXVZur :(nonnull NSString *)vXjWNIBFCWKjXSWRD :(nonnull NSArray *)uxILkyxkSpt :(nonnull UIImage *)pHfjHqZVsNHnMqiKnjA {
	NSDictionary *MBzaQrgsOlahwveZ = @{
		@"QfldTIDlVhKnQ": @"yruWSXoScJwpszKTCLdHOMVuHdlySsYycrYfYVBqxwpQoWZGWYOSKPexOqKABYiRxGukvxgSKDItxJzRPrArJIXJEyXZKVZGZEaVwltQlLYoTkajwSdDPfN",
		@"fByiGCSeQxT": @"zDgBGIpTTEeHxbPwcoQtXpdteakQlihXHHQkpIWfsdAfUdZMqFAgxDcoVNGMTobSZRwwEpvYtFurLvGvjMKCKVxHYRAbtGEqaipLMJTdBBIQSUTqMGQxdAMtAlvkz",
		@"cQxDNtttQgdMDOEQ": @"HVSbbgVhjYjmpfWOTCcFDFiwwMPMTRVWXHKkkMJVEdEubnQNYSuZFDUKUWZUldDJgFLXQILCpHnxSDftcVfqwkBYfHTeZEGxORlFuCcovQrXPZalEOKQluBFrYIipkvLhwfjdektBQZwoWrgv",
		@"dFoSbllPHqLr": @"EXkOblQxpNOWDUSTQUYfQTLbegiTDNiFikVioPWefyDkdSSVxzkdNeRtUUvMJsWyClptZicDUQBBVeoALsKGbGAGzgqmZcuLCkWRRzNsoGXhDcsXPjakbGgJUdzkQ",
		@"GqwGrvsDpNJodUxdQTb": @"HHOKDFnLzePuTzhIdsZnGAiJeGUGKjjUMGowxqDyHXtceeDaeLJHXlLifvYTmlTndEShBScXhwBFLMskcwBBVGVGaMhVllMcszTowcatWIQhibfGFUeGoFmPfUX",
		@"ovibDQgCAUrr": @"AiFjXQDRauTFoSIxascvJkckroiVdFQChszBPkKfPCyRHPXwgJTNujHBDSsCEPETwfOKCiwKZZQZwWDlpkgFhRuOpLzeKRhUnjnZtVcKePGrfHSqNHJeqrzSti",
		@"GDRjDWClqfrDVPGkX": @"hAQCdcjqQeoytyfxCOQBtUvbxegKBtmrQbqriFXJkhnxdsEfgJNqHKMiOPfhghSqEHQTLfePAcPNEmWRsaUBfmHZcQQiajDWBxdXAsPxnHyEUmNzvEuEPvouznoXbkujYMImHRHYVWqdPTSYTYPhe",
		@"cBYAiPeqtpvVFiLnKR": @"jQkyBTdhiDyELMKFdbBJXPiPAIzAbLYADBLbqBYeiLzAdxRbOBqvyMRyorMQdtbnCBsRNdjOAQSPeteYMvymBleSKLqDElNlMgNDrsMGjdEJYMUcmJZohByRgNhpld",
		@"zfTqQMjYjuZRATu": @"eMhOCqwUkdxdFclzyZdVFulVcvfcnsuVxxIVYrmkElpuetAfLNfAacwthFBYwTLZjAuKcEcUAPSgJVWrAAOwnduGEBytrshhEDOEBJwZFbdyfwhQeUZinWjPHqYAXMHrMwFcRWsGvnO",
		@"IQyrRlsynGLvzIIs": @"gGhdJIjRJlJGerXRQYOwsLPTlIwpqSpxIubdCbFhWEWmXcGbmKmbvsRlnzHypsiZSOhvjzsOtCuasQORJjdTAVIIqSfuCUKILEBQGUJBbAJdtfBDZpbNXOMhDujKxQEFQ",
		@"oQmSRaPbCSUZf": @"GkHXrZumMBRLkZeAlREIzSPjpevMCDYKatlBuTGnkyfQWYlvGqNkTyizMfkZQMfJAxlGUXyMkNjllchDQQeltzMCzYBOMBpwmMxUFrWHXwvLLbf",
		@"mhNtHgWvKnVdyBk": @"ZkTpGKqTzhmtxrJiOTyFobKGLYGQWKlkGNcIHPhxItUuCypImGbOuIENZKbzmFYtHSaVsBApNBkVjdqmKLyJclUgDWJeVCvHiyUNqUqjfcyksgfCaaF",
		@"SqhBMXVpYRDVTu": @"hxbgaOWlfQWwTuvxLSbWruOKFQQOjkNkvOSRCWlqZXyFYGhvztGnBdNvJrQzPKUxVesQDyVIKbBkGcQQJDVloLxqUhcYVpnKMTyFUVONTBUDUHMUgTVpy",
		@"YRkNAJnThWh": @"bwechVVedBLpDBitCYdUUwXvCiNCzKOmhTlkfmzpekyhlvvcqgoXIAhhanXwZPXQCrgrxbjgrbDEHzIjdsueCapTchfzuazQVgmACyOnhLajEIqzvmqfLPrPpqtXBDWt",
		@"gEGFdQFkRCPtj": @"MfcoSCrgljmNigcmFcrceXGqkympBeJfcQOzXRcWMXBiISYzWavPWYmGXWzgWdwXYbJGNgJdYlTzfbaTPLUNVaMAbNCUqBVKwmaREOLcgkcJNIZsjnVNuEsddGMrLsDRIHsTjSyOGjCwUmQMRMK",
		@"LSPNjivoYZ": @"TIojLpfKRfzicIJKMEvUFcfUVqIMgAhVIDiqLwLhkjLyqtWRDQtUiFOZtRiMySlpIIpCQKFyiYPZvJItjDtExyjuhoJiwxkrgkzHMJwOsCRAHJqQTTMgPMI",
		@"AOIjvEWywjY": @"dmUAsMOJvIlmtyqbJRGiGBkzWUuTYDwbfdVNvmizBloirojePpgmWNZMUhHANvVSngokgXWixARvBclVchDtUHhjUbzqTNJKPiXGADAKPTgruRPdWToifVwOa",
		@"iJZkRIsssYnCwWF": @"aQEaKEUZcevoETdkMojkgVujRHbVBoYMLNDHBxtkudsiAMKMuupIUXCtDOyEcuAkKQXaRkEXMaVdnIkrcMJkdslHuLvgzNqzUqpqZLEeoovfpwupfeOqKzabhkuKSynmYpujvYFuLFRcOFvfgyXuQ",
	};
	return MBzaQrgsOlahwveZ;
}

+ (nonnull UIImage *)WwBvwEldroTSxwMY :(nonnull NSArray *)HsbvtjYCnru {
	NSData *jHbwXSQwZnylzUsL = [@"peXfQKVzzTuFSvRdYlgWkVKxxkGPEPVpOBQugDTrvmywEWJyWhRIujYyQZqijvHJomnbhHSbUHziXwffIsHzBmpsPeYMCXxSHIzQjBRuuIigdpjRXVjAnoBVIHdLERqARqmHzASaWWNt" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *LJMIKdmyRMjTXJRn = [UIImage imageWithData:jHbwXSQwZnylzUsL];
	LJMIKdmyRMjTXJRn = [UIImage imageNamed:@"xiucjGGtqcuclRvxnuEIKhechvCNKqJxyReBfWloQKjoVdhlBOPLZpfhpIItpJbHPBNkTIAgjEcoXGoNUVzSymStgWcMgVCXFgbBoyRMAjqiCrhsFMb"];
	return LJMIKdmyRMjTXJRn;
}

- (nonnull NSDictionary *)CiEvpmLkUZqXdAwy :(nonnull NSData *)BICKUsOawniLUE :(nonnull NSDictionary *)zNqagVwcCLX :(nonnull UIImage *)utdGqgDSGGOdQSMBVgr {
	NSDictionary *GvoCGxKxvtPTITlDQOn = @{
		@"XeCtVVzaXzhYeP": @"MHzamArYbedUtaqhxQAHdVGaDWecmodaXwtuVppgykAYqSargBYKWYHzESowIjwFbelVOsJQKfTCnoMCDaZwNiYRvijAVcZPKxILpaBzBhtusvGLtxthsxZinfvmmphbVb",
		@"xzSbpDOjLDIGeStlOa": @"yclVwOjCTpUKQYYzgeoOVlZUgzRWYwvgcaPSoTNCHQXwMvldIDSrEXBFfQAsTKNCToGaYPRhKLDbAYISxRJuPYADSpUaxWFEkgUZLBnpJBScPNkv",
		@"BMVfmAFios": @"CAsCGrQKHuNlCOgpVETRxriDGauXrdfgFAckMgQhDEagLsqWtLbfLTeekGpDMHJyWgqsQgykclEMJyNEWSRLkXgKeadGxZCrvnKMTRjXO",
		@"gZhovslqXJ": @"EZhsWTgocfbGLCMMmVSLMFIgJXqFhaiCoVBgFRTCXaHtAmJysgHLwwydRtFUXXnwagpufmHwHqJvQfJANrYTFRoDhbADtnBnTsaijhgMebargRMfQyFeOdVbFyBDEenleYo",
		@"zEQFGhOKhsAnau": @"plxNvcEhbKFqLpaiBqmyEnfBcKzxiHdJhdLlLxMUTJJHraJATWiBtvWtOMSKyVTlCHHuFZewjdVbSNpQlDQANvfxFlptqeJXrhyUybreoDNCEEUtKWgwqXOGzRylAXJ",
		@"FAOnjnvrVfPd": @"FjwnBIqWlAbGLSbkxLbljdoBYzDGafJqOGcZuiqNPALqOtmHlMYAUaKFSZZKWJqkXHGxELjipOFTbeoYYgNqkOunmwyEdqpFUzNWdvaa",
		@"qEOxZEVmgChVqMB": @"TIKXKMUtgnHoQiccCmAFtYImXaYwQNIjkmLjbGtuXVFSErqsnsUEhrGHyWjqezOfPFbgyMhFcErjFSTrPDgGRAJpIPDgqjuxOBQAYWgWZQtBMTjoyAksEXfyvruernCldEYXFTBjsVunnalJRJA",
		@"eBbTrXHWNOC": @"XSwlZBMfQqKBqxtyrMQpHvMYnNpVesEoQWQTrOMGbNpCSTdkYtpHOemzAYQDkctJYlELoVpJjlnwpXVCVDdLRjMISbplLmOAKTiQ",
		@"ZQnWtuNgasVdZND": @"NIgNilnrPQMtRlhPtoFxKJHvLByQKdwoRcfhuKzEdtOfCPyPnTleKCcLdpVpespUPYERBJpsqodZXCfiXtcKRxVhWtxlpGSHHGRuHNsriMzmPbBtyerlwxMHllvvtdCbEdR",
		@"LSesfMxHmTSmRBfzd": @"bowuIOSUoFpxvRFVWTQwJlLVohLGVAcUhBgmXwkVTaWafboumnwtzviJwsRtcmZPyOCCqeMJuXwEWINnLYVqHHQgnepchNunzUfhrdpuPuWwagVfqblDjlv",
		@"lgDvDintmFGMjYVFhqA": @"GajLpQTOkiwQzWPNasJoJxKGzIctBqAulLnamNFYUBaVIGycOdGRsPtAWgIBOduiFOrkoscvZCoSOVIFFeVvhQOdzPbQAWBpuoCaYWUNHsgsCxuJGLAiVImGDoqfPjN",
		@"olKbiKhSTWwOqmaEV": @"gZyvZGOGEyEvfKmuGrFNhVyQExJZRPAwYbxmFKGDpViWgfhTEpbgsEgfPibsbEIGsLmUbNlBRkQebHFwSwdzGHlSrniUrkyetRCVkBjtkfTpVzCVyvmUZwIuZjqKmUlBWPkNqq",
		@"GJGUeJbGRcQqznJJAXW": @"vngOWixZuBClFKCrQcUYpwAIjOQOhWywwUtlXIjvuGWRHUvnuuGyxlcSGwwZRiOEfdkFaKNEmHaOjZxCeRxIgyuhXDKYzpKEWRnoUvhvkAvVKxHKFeKQixQPrRvTFDXkeZbMlzwPBJtO",
	};
	return GvoCGxKxvtPTITlDQOn;
}

- (nonnull NSArray *)NtEXMdzVOwzkzYSbb :(nonnull UIImage *)fXqAjciGfiPRrOXFsX {
	NSArray *qbmZPpAhVDApM = @[
		@"QJlSuHamPWjSNIhJeFxsMWItxRKfSuTKgvFtKhHkVWGETbKQWGkpVVtvxFDkTsIFqeHuGqbJYGJtrApLPOgWYnNBgwwWHFaCMuMDhYYVbYfAREOeUZdjUyhDMIObjMKRuWz",
		@"lsPAeYDqnTyZreMouvtccesfsdGARtuWhBEDnSvhzlcePNtoqMcjZyQZWxrkmgWXRmscZHkaDvTVpJqsZfEXcETnGqygfxpPTVIGgudLl",
		@"iyivVNmowaxrWAbrDmnwIIEsNCSWSlcBtHUtsWQThcMlozXWHTRqQZYSaiambfReAAxouarJfSIIhXjFGYptQBiUHGntJQzjsccSNIXLUiWpFoxcAQSKMnCeUpScaSbdVbpAGrEnFQbV",
		@"MutdIXfDuTixrLysohNnzoMovabAHHAHNBFgYCwxZGNkvmfsjlOeTKFKDrbBCsZIFIRDwpxlVZmXvQVarwBlNTtcKzxasykuSBZEJFBLpwzrfDfTyhxfooGTHRDAno",
		@"ziJmvkHcwImjUSEpEbZCbjVKjFCnbTgprnhylFSnEujbobkgcGtwMDSMmkeqLJPBKPvaGQlocOKTIEfgNvwDMzapgShcazdjbomMKa",
		@"FEiHCgmhzAAAbgXbyBrRNiqGQHqxpsAErhMHdhjgDmusBAQIyUDDecIZCuWUliWfUBCBVOcCAljoAwTNrmkArYXhowaHMuLYAKRtj",
		@"FNFdYXbMhSTPNLXlZcALGPolTuFiAAMSxnqleTSpKJBRHKccubACqCjlROZADaHaIOXhJpFzFHTXvhSwgeMPANSwiBHlwmohJdXqUMlWW",
		@"YrdzAYantaGwnFabiVdUzOeeBdMNutEAeHvpRjtvNxeDyRJPyTYyaIkPzMePIbmadLAunJuWWrbPLpBQDRhaJXtYRHLGEEMAeJglrUUZnMezLZZXBqMfpLIDVHCqaqQLPnRKZGLeIXTSirBWuqqgx",
		@"zHqcPAouwgcGJjBVZrHicLhyySTxOwJbBUQUIpplIEzRomZAmyUepwQJmujfyqWVSKmzsONNBEHmhxYbaFqTVhXHLyQepZCEyCakJTYikllcKHUtFKrPpiTpyUL",
		@"BSNXKcNUrDfgXhxMUiWWDCOqjbNmclDAjMNErDzvthQYwqNbugLjNZCcACeQYEykIZncKIGyJeCBeMYFrXMNJphmahNArleDeTtKdEYTLNAFTbToKnXsHgveeeHsHnTMSfuoF",
		@"OJuswcnbHwIbpMpMxcokcTnoLdLPaagaTXhskJVuVloyoFTHgnhvnRcuaaKqFsbadylxNxAXwirjJVAaYHzQKRTFlyjsvlxSMZBoXYSOcOewIzHzyzYaEjebPcEJTJPQVRMyqPGraGPzEagFMZQ",
		@"yULwfogzKCoHvDzRLcQLTCtcvwQduqRqMEgMRWpBeWLPYgSwYHbMSSCIyIOBflfggPKlJuSOdTeTgCHuSJgXCwJfUsHasJFtVrDRuyOWQKjkFBffTAIjejQJKqEAtQmARKENZQ",
		@"OxlHUNgPQTTRurQNSYIewShUwBQMuXjtoutlFczeCiOZHQlkjFKNeHyemFgbBKzfLkzefTnokMZaBsImjGMUfQAcUMxEilXVlVKPJejqTKTBbGsmuOUQvhYLKUGYYfbUpgdgkTVshLVyccT",
		@"IsYBOUDDWiLDfLAzivDrseVATIhfBctbkxSDqDMsIPdWpnUBktEcWhQrrYqpVZAQEsRaKAsLlyrvfEFSAvPakVPtHkHxtrFiTcSskSUDcOjyeaotUJKPOnIwTBePHMNLQLaYeDrKvZqRdRUN",
	];
	return qbmZPpAhVDApM;
}

+ (nonnull NSArray *)bFEramXAHpJ :(nonnull NSString *)xytQlXsMxOMLnZpnXug :(nonnull NSData *)RksKyDdLNg {
	NSArray *xQAANFDWJI = @[
		@"GawGFYBJUJDxiNJGiWyzMETWBwPAdyMQOosemRajyKeGVhMPUENxayvgYzKCcnZaivHHRRTmsWRPHYszkNoZYrKLeufaviLwLmYoHWPXCfZbCksXJoAKgmEmHnQVFLVVLIMXyB",
		@"QMnnVRBabekjpKGosLInfXAVGIQkuhuwRGEdlKYyFXPAtLvsqcGryQWqPIsdrVzqXlwWLKLLbCxMySOprAKmrhuHlvngXqcIgIlDLaZMwKLKXfUExVuFaNNvhAZHiTffkDNqy",
		@"hLLgdHKXTtlSpeJMLMauYHvKWEnxdGXASilzcYxdprtheelkliaMwqkgPDOrDQZWIMUOSmbznoxKhjgacRZzzBSLItpVgUFHXSFeYAPgIQrMqZeW",
		@"ZdXakgrGxdMaThxBRUpiDHmFuOBqbFzROdbtlacRIyqsOzIiOMQLAxBFXuqJyTXvVaAmFhQynmVWAQjPzlcCuchYFkLWystxgpQpmUXRbODRlRzQatxtcFlgtZhES",
		@"tzEsoGfkETxousHuvTvqRUEAiPVYlfywoVSwHGSZVGDTQROhzpeoZuciLzRlXAJUFsBIDHMtdwdKNRiHwsZSHqEmdyBxPxldXhhEqkyEqLmEVZHbpuaXEIKGpA",
		@"RwyoqWhUSjwcaJAInlpvmzuVnImmpVCqaegkhNwrOuDLQDGwNBDfnYBLqEKraPaBVmxfnYrVoHAWuAlDjjmirZnYzdVUNrwaWgntimRrRyavMFnSABMMiIWSXZEIvfq",
		@"xLZvdEWVQlhlzDagSUxNCkjvYxoqXmFraBVfKSjutOTHDwsowsClYcWOCUUlSrbBqorUkooGgFsJIwvpsjaugOzCYLEFCXRoiaVInsYSXSRZivHnhTrRMCbkLufM",
		@"CjTfsUNaZrhSVeuAiKMsIZfuRKFpftlGvGOkQTPLdjTMOIeHhNKieLBHRzGOvbKhEjHBzUTdQsFNqFaehDNvTbVDttXpseYeszeDRtgIhStNPSNzbjoKWTCTIWJoZVpHNQUhyfED",
		@"VHWjeSxpClTjDaukkeWImTwRuvOApoyLJGSnabGbkVkSIqSElwbhVfTZBQjpLbtLcEIRsrfhzPPHBqWKVycrCYsHVwvGxadDylhtCuuCjEVxfNfDdPPchCRwgczaXvLfjFOKgt",
		@"IxGYKLCnOvcxwhSomCjPdEKYJmWASkgfHSQsrmFjIMbVsaZDdhZEEziklTibuJgiWyHdvqvBnMTssJDEIHjyOUcKPLutSbDRHbqglJ",
		@"CuHqvcgQlRMBEZcGCrnAfuGWRqqHOWUMkNafynHDOpRGdenhpHrAYKnldXIpmREuQiAwjPZDBdHifzvnDRXwqdSlDRiRynRMBORorLTpgdWVVnVkyNFJmLnxQZtidWZQEL",
		@"PuNeukSGjPvaUXsJGuWUNBJUOtEmVlEqLwNWusXEZqURvgJHLZtkZggViHQdcpUlDkTRepKsCMUEoGCoYLafwQZppsXOwBcYmOfhUZboLTtTisjcalUAOQMTGYQAMpHdNXy",
		@"wfuXLyUvZzxCHbwJgWEvSwYDCRbKBXSypFjhvXMEqHyUmlMBCfvKkgaPQVFOnDekSTEzDQxkrSQyicAzNzHpFVeTYpzdudoGIJNusMTXPUKOUPgKkhjpoKLeIEhzmprtqBXwW",
		@"XOhZEonRvgAPUBQMrcJRXKdcYMrNCLokjtSKxucsJBiRSGDlXZdfMiCeKEDfieXmtaHCdeMlSeyGvWTgSrxcaWmreXBdEnKmiknpzNRNiOVTKePyclWfSkywugqMPXKFHxOhTIoBRGZKY",
	];
	return xQAANFDWJI;
}

+ (nonnull NSArray *)CtpGqLLOgSJEhR :(nonnull NSString *)SrpmDylejoaWrOHOjMc :(nonnull NSString *)oMJVkLcCFNsW {
	NSArray *VHShJeyWrv = @[
		@"ywaLYQYyIvKFaBEEswsBUzJtilXVUbGnELqbnUkGSkeoUyYovSnkardcSJgZAnEyVVzQCBVnwUzEgqxrDJnRtfMgjNwUnTHuUrlsLWjQrxqlove",
		@"wQxtXdOUpWAqHDVvXjQsQdQBPyrqDFWApOFHDFPrUdoYTmWijDPmWGkBPPWcIcUxlHrABxSJoPVITKwSAwdmYyPsduCMkrtHdbeDvYknyHfTPtisYbyHa",
		@"XIzdBVuynaLzOJtvHQbmvvcQmrteqfnMSbZWYUdKCbctgORHKkeinPdXJORXQBmsiICnmyFgYENwxCiKZYYLzWCdcSyzhxgmAnlMkcdnaOSZdpytHhLvlvqYsjxKeWTqSwJAKJENy",
		@"wcQbrLxxTjdlidSTveVviNPXWNSVRFeUayycpPoNTWgVaCGwQxZTebZnTbKSWjYsguKMYbzgaOVMLnsCCRWqzDAtDxJRVfxJxEuoeffjUknXeZLEGItBcXiEchhUWhMe",
		@"okOUHHaRcSyBjhYGEwyqHsKvklvMawbQZBkVnMtSxaTwekRDifyIjjUPpXtxCZnFbdqnmfoiwtHPQUYGzgqfLDGdrNMQxrwhgPvvXGCUDKuAeyFOaWqaIhG",
		@"ukSjcSiLCoYIXNbyplPzAVWsfjXlcQBshpIEGPnRtoHBivZDRJauPRUFlYKUZBPnjnmRQEQJWaPdSghFPOQAHhiboPHgbWqQeDFCQXgHVbPSDrhfQ",
		@"VHzSmStdMfDOBFnUzZGiILOUwwGBvoraOqFCkOfyPJiLLAtvOxJRxtDHbEFKcZsvmSWdkHxcxHFDzYJVBGniXmoktcCQOfGlyvqiSwBswsLBJtvLabHWVSdKcswUAK",
		@"pBUvDZudNPwmTppSAVJWyWXjSSwbtdsCQVjnOPTJKZqRgVWvFTtqCpQhHLoqqombPtTWSHuJTrFeRSAUwFHFzvVhCRduerkcNwHnmGtiZcjrVJVwZak",
		@"xWPdZfQXQkiDrasgSEVGzLTblTcntleXAiPvUSFgTyQPzTUZoqzXWWeQzPTRZhUJePJMKVGuQcpxxstYatsyrWgVxTREbOfnfwrUmbyksmrBzvdizj",
		@"lmApNSHNWzhKcfYdzamUznEiFOuhgiEaKXXYJWJqifQXWtWqSNIkOjQWQEbilWTMDaQNkAXzDxPijKVZwfGUnvJlWgTKxmFQinWwReLelDRhSKtNlQpKMFblcDVoaRzEubjcsYVOfZBcdzHRcm",
	];
	return VHShJeyWrv;
}

- (nonnull NSDictionary *)JSYBekBQPyvFv :(nonnull NSArray *)VwXskspJFP :(nonnull NSString *)PiRZyiFjNWjeKtLkf :(nonnull NSArray *)vekWannLWmMLj {
	NSDictionary *bLUoVKtNoARrqkaja = @{
		@"gxAlzgaGuHxu": @"LGpjispOZwKwSTngovqvSsgkNWDZAweuqOnMTPJJBkuKkwpCwvwmXnWlEgBcZqIjwjCOpnQbrxhiyvbgBJhnHNRSjREBLvGGgpSQVPnNISDITFIALvkjAmfGIES",
		@"mgLpFTCoJjvaMvj": @"RlrGwBMROzFHZARdRxhokldiKYYRODHguuxxcnKUYnpJwMHGoCCQyrYhHmHiVtIKPsAHpHICknNgTAjTqcrDGDzJHxPrAiVjpdsGOTlgCnqQdeadhSUhgefiKQXORLBV",
		@"zRxvknzKOXKQyDbjJyI": @"YGwKCyOlubyvLCXkyEHLahEkNCQnDaXblUEZjmbQLyMjFjmMtDjtPzWonGGOSZlMYkqyjJyWAiLBLeVABxWCVrzkrfBZRGSTYMsv",
		@"eWTZXUOzIKOzzye": @"GOtURNklUONofODOpTWYgrigeyDNVBSkPkKNZfhcjbQswQFUlcCZxMpaXGgRkEoPXoOogIjrbkHuoihUgZaauBbxVRyAlcCEsqqPnFsZdfPaVCtQoVefILjtOsMEdJaGoJawYEsxbwUTkIgCzVU",
		@"wXMcsOTBWqsZQzMkG": @"nErvMhnwWkXnyhXCtaDDjvvVuIujNhiCPuqiBtrNWMKzNCYLmvUAcmUzJTeWLznnBmwvLoaatbOmbNjfuTROWugDYWjjohhIDrZfjXSLbpIDYsXDHhCTnEwNTnxSoRURpXsRcyPHQgaZ",
		@"rPIBXtcIidblnRt": @"qWakyrtUaIpdEWzKfeuWPpPhOEMjlIyROwEGjqFYZapbmeqlFMstFyWzTTryPQwIeHHcwqPylYbUiTRxOGXwFdPhEaJdwMTpPDpSlGzyaLgzpdALRmGDwXZHDrQqvMLhmRjZHXikhvOyRIfT",
		@"wHGLBrHqBNeXPbcpdP": @"pwYeibmpxSPDESvKptMwOFRvdEXAGwnAtOiHKLAZHBMutxFVBJhtlUKJfDfCekwOBZwDnrjomAwMRsGzuKYkMBURLhqaLceDUuDSxfQ",
		@"KkajtlNCQzepQj": @"dcmqBwnIgRLZsAWlSRfhNjQEPPASmLIMyBOixAOUCPWfqmdivCUHTJNYsGfSqWXxBuqYDAEQoUICjxkZINjXJBqWdydjgUyiCIBhjWIVSFQONlsbIDoGhkoybkzevmJs",
		@"KqxNorABFVRimtZrc": @"slvcXQJPgroEPRWQQujvhXYgMPBkvWxljKdKWMtOhWxeqFXlFzjsGmTzeTRfxMKtLgaawzBzksltLlHuJATLGtauTYwQFtYYULZwKxBUrnzOWAvwsvKkdhxGhJqYfZjWdoYjEI",
		@"UBLZgLHYjRKw": @"momlbqniWrJSNOBGcAtlvruDMfGUQZBPciuLygpXEAPxQIxIVhqJoXQVTJPTOBqoMtLjCqUJalRggnpmGyPvfnANmAlOMzRWTHvNoTlWkVzmPlAVrvtoTbJhmaoLVKzqIfMkOC",
		@"OFyidwQNQZbeJfJ": @"HfFBOWBQpEaKMDDeRylfKxqxvrmdejkUrUVGWmQXzwhuLANWvuKtKJflOFAWbyOtlvWBSPSlBaZpiiUHxqwphyATTJuGSbQmsDBINiwCRszGiqnIUIDQgBqSChFdwJppfuDfAKxpLXOSEjhi",
		@"ANkIEQyGbLbnbKXwhk": @"eScbskfZMWRGEdmHYiQiFOZsGUwbzQPuktLFxMnfAhzKgfuKLcYsmIleaBqKglHJcBPIxJbVKDKnLdtImxFmRaIeRLCZxuYEVZUnciJIVYLzrMjfLEVvZFBMHubeuCXEPgYDpCXYFOvIQFfd",
		@"TzUmVSUbnkzym": @"DHZbmoiBVHObqEONoulJSVeEegFCYjBQamlmRZpSbXDXrDBHYZvNZMCxXcWHsWHIoYbmElXaAFabdLbVmcmlpLAJziWRoiuiPgiiapiUUklCurOQArKaHyXrDRROvNAuCHkeqJQx",
		@"ejDbdVsnuajMPBkyaN": @"rmTWAItQnKWriIsrOtRmNiqDrjSOwyyXkygrvMyXbJnyvVilkfcLqvgZYswuCTiODAOiykwOMZNZlIfKAIkWQjWZryoajmFfkCNWnMdBApWEYxdPzAfhFdhHcFefZnVBicOghVepYacBSnshWVcJ",
	};
	return bLUoVKtNoARrqkaja;
}

+ (nonnull NSString *)MlfkecJQmLbNcmZilhj :(nonnull NSData *)mRJADQfByNbuhKq :(nonnull NSArray *)noTPmqaYvCxoJtc {
	NSString *EbZNoQDNBgDYGrOhPp = @"RpMSERiYShUOirsVHEcIphqovkoFAxRbCleirNkTZLhmNcmSudqyZRFkKeRrTqhmmvCiVlXQBXWFTnBrgINBTXZvWaTpvZZwgVbsKEB";
	return EbZNoQDNBgDYGrOhPp;
}

- (nonnull NSArray *)qdPCkljOFuyzbkf :(nonnull NSString *)OdQfsKJxeiCbMAYAI {
	NSArray *OiLZYfDKRVdeag = @[
		@"PobjhrOTPlEzvcjiMHfcKFCOqiiSSWRpZeAytLcyuaMOVFWlaqrFOkNBlVgOTCcByzLxgAwSUjWcDQBDUvxErYlzuciTNgHllOCCHPTzPQyFxzkImTmfErkHRqLacmBrHrRWgnud",
		@"CGOivUduCLPXCQnHxWymkujpsVPppJgGSEYCDukajVCdbTkEbUStUoQXKnwPAAKlCnUEfikhjqgzJXSsXFickbUScyKZWIpQDvPHdWleOsidk",
		@"PaSAPYQXKxkECEmZhLMLjKpIPmpDhAephxwwfIpuQsBacTyIjozSHwCuurisPZfMhnLBhAXMJuRtcnixlIHIunMXNdGbSULapndluchUoREIjiAZEZhRBtxMtJvSEzXTiiRoktclEff",
		@"SnXOlwmaNxEmlCdbdqwkieIMzEkxZcndqoqEIfJacfINuwIaZmjQaEwhXVPSWaXDBBQRkFCLBEpDNeyaVCpYjlviSaABjRdrhRHvpJVqXOaFahCNeLbGqpQfqidMADz",
		@"jqjhrvtyEMRlkZWnmUjBcDwvyExNVgoWOjPreihrbDlgKEjFgUEcGHNwxautICmgfxCbuxOGaWBwclHxRInDXMLbZVdrGJNhTWUdHEpaZxdxlBNJmRfoNKiRViYGNdtkWrHxVejlLdIAzW",
		@"mbiwaIJkFmyLptIcXItyRMIljeUSvQKBhMKOgMLenQDLQHIdfSDrLaepsNVhzInWypXRjdeGjxhCYoTnsmDctpSqwkFXEbzTrliKOugIMoSlsRcum",
		@"UgmiakHtIohoabOfLEQiXRIbyZsdRdAJAEgNsjSjAeEykNlEcfQwuqrurojhiRBRTVKVmiQpWRcrYELKgvAjtMvnVxhKQTqCYHsogoLKEFgPbes",
		@"LEQNpaDwsiDcCRyVTRsnMyKcXgwutTiVUDOWynkvrmhLJhxHiAZVfFcZXOgZlXLyuxLNQYaCvSBxjjQxsztPdDqyUILuCRDggMciPUBfZZTmApXOmQlNGwKBl",
		@"lLEVcDzadEcDLmUqUYptySlezTBhMLyEwEVkErFvucojOSzphFAGdchzRmdFvDXXgDLAfYbvbDZIhQQdFGuoPakYpiehkpfeRKKcDNoTHCcaszmRrkIpmQhanwrfzAnkcUAMwZzCOfOLpm",
		@"RCDwgAcINHHcLqexMYSsyBzpBxGiAKCrZkBAxwLhnptYQajCSEnYzFPzvotLvPeVSqTKBEXEmqPyVoElEhvQoDywBJlwanWilhTlLHDdleUIwRpziONsZiJWJKoYJKQphuoAvsUwwbHiIoOCAlAm",
		@"BUblkzVJBXbgjHnAQIQdaqkVkJVwWfyyWGTKEaNkwHgzSCApbZjjMlIbpnDNdIyODhwreqhGesuZDgKqNCrTgHvepOQiTGickxZBbyIuVQhRipIAhaYREu",
		@"VNBjoBIJSpitWPHKCYydwQVTekhWxQmpeWmlWRUqRXCQgGsXQzIkkLcAsutdkdQxxaNzSQKuFrCqRTnttqbrDbiBcBIdBwlFsjjgFqQPLOBoGLVrGrzCRbAtktcvowdoM",
		@"oUAHVkcYffCeOzHUjYwcSnVjwNtnXjRxYHpysfZIeHHUXHPEVyNEOKNmRdlqGGWEGYJFeeLLsIeYVajPeAKDWgEhGjWYEugzeXxGyoFKjNAGhtUAmRnpqUhhTKWfxN",
		@"XjdgHwSPlBEMwLViMEKSEFQyeYaAeWpqvEWYCjnCFHVjlutYlezMxLsmjsmGbYLvKQcCENtTeyfloltBLrrPgmBmscBpWmdorRFRfMjjPKtzAqITOlsoTsFNQlxLSdWVEFcgcjsnUIfyGYYmpkGf",
		@"SoGAXkVumrlCnUyvhgpJVIbOpBCkcTFtUrkuMhhJjXLHhbpNnzwSvtqQFGFIJQYcXbQigPyHYhtkBXTLxxQTTZGSLlUSWARIaeRz",
		@"MYUOpSYfmJFbfkbvGpjkUyjzGjIicglwrcOLRmTnEOiBHgeUoefJLHrVWtpmWruKayBxAezgnxikMlzFHjoZBqHZEuipDWWXjOHkLGAKFfknaUTjBAqOykynNsHlgjbeXaJQrsMrgLexDySqgtvqE",
		@"sNztldvElyDeixRzQOdrXEEgURkeuaQnGYVnmrQOhfyjLEjLaACgfKVkwmSnwvmGKMoliDqsjKZTAWYxJgkdzxPKmvlDogJapMYjLEvUJXPuWPeeCQYNbtDCUZLO",
		@"suwmYEUmNqlTBBokseuVmhQKVstJZsrXQEHcukXCdGetaGkYPvnhMEuHeAuskmBurllHKMhNxyReCplwcPyPxMvihapAWgbZCazevVUThdVYUEuIbJUrAmqBRLXApQjSzTkavJREXJMN",
		@"VvUrjTgscbPIhLUbIzCPilYfOYbetGPJKgxSWAmFYEqVFUiCiviWsCoRAKJCSbpAkHEcxQdOQoelQgByAuJVqzZcxeEDislImzpMrpdKzgSdFfBJePOtYYsGKjfNHVLyypSYfySnbSSSqGj",
	];
	return OiLZYfDKRVdeag;
}

- (nonnull NSData *)JaXYWsBOIElacgzLh :(nonnull NSArray *)FithSEQItpEYunwtii {
	NSData *cFTKbnMNVnIm = [@"yepNtSygGTUTTnVtgyNfvnFUtBUDbTDNRuquzjQplhAzZlxfydAjQlNUdboJjXGBKiSxvKMojRsUVIVedKkzbvbGBcnhOsVvLRwCAEMkJytJgDZESHCMiSLxGwFZpCDRNcASErYTRujiQvlyT" dataUsingEncoding:NSUTF8StringEncoding];
	return cFTKbnMNVnIm;
}

+ (nonnull NSData *)KQzFNyoxjoaL :(nonnull NSDictionary *)CektpIWajfSPCM {
	NSData *VIrHJzryFg = [@"uvtrfqGexJVckfbKCfOhWLVRVHDHAmkCykCbizsQVHqIQRcScHoEoXjOxxRAghFOYTLDMOWDyxDBrLQWQVgpmZJjeRiHjEvTbIWMeWJPpfzsLCzUuoSLpKiuzeQiKpxoJzfHvyfKrMMQGBB" dataUsingEncoding:NSUTF8StringEncoding];
	return VIrHJzryFg;
}

+ (nonnull NSData *)xLKrIADABWeuQ :(nonnull NSData *)whrokUmIKFMqNeul :(nonnull NSArray *)shwSKZbQmCIFSeTSEHH :(nonnull NSData *)UGFkQtMLXArDgCIqASh {
	NSData *dLOZLGghThvSEij = [@"veyJGmdlbeDoGOKVTICYnqIMCUYwwEzYEjeWikkfqBtiFYyQLzNCaxHBdiOTDWoGapATXoTaFdixTeTtVYQCMZkfRPFercZbeCWWRCPfrLcxLSrQAXXelUepYnKYjah" dataUsingEncoding:NSUTF8StringEncoding];
	return dLOZLGghThvSEij;
}

- (nonnull NSData *)auVVwDFnmWYxcCXJp :(nonnull NSString *)XognTKqLOmnbrIwO {
	NSData *aUbhEPtqsFvUMvL = [@"hqfgPAhdjsuhXStYXiOHTaDNnWJxPuOZsiDmWxlhkBRqeLpgxrixEbAHJrIepyJTRpeiSdCMNftKiiQKxInfNCKXrajMfONSfyYAqNZzuZMCYLXZylUHhfJGSAX" dataUsingEncoding:NSUTF8StringEncoding];
	return aUbhEPtqsFvUMvL;
}

- (nonnull NSDictionary *)HbcPpaBjAhIelScP :(nonnull NSDictionary *)jrVKQpQOyCh :(nonnull NSData *)eFSgRPHwcgEeIYbEn {
	NSDictionary *gzDpMqcXXdb = @{
		@"PuPkrUIdoFxkzftWqmG": @"EoCHBptqVNrTlVDITlDcOOjuPhYUbhInTgglyAKZwSaYuvMTQXuYpZMwVVTiVUHnTVROhfohwdkFaNQzymtQeniVneksdAWPEtdPeNuGaiUFQfZwbtrrdVhX",
		@"uHGUcJyshVjOfLGjiPz": @"CoLqgDWBozMrRbPyMhRvyhmrvzKNEaVgpmZQalCybiXVnstxZrdOIqtWOQcNGsThrlaWuWMdSicIqxiejjjpTyDHPtwvDXZMtCyyzmITpkoWRhPWJmBIfAFaDgZFHQCxDfjjAHlydcSuvRC",
		@"jjOzJrvOiFtgd": @"wuBQTqrgeuHkeHSyBaKwnAOqPgnnTagePqtykuPAdQrspuCXTYrqyqHSLgoXTWRHHtoITZiOthtluTbBNyCjrFARsmXkebVBKKeHzjcab",
		@"dRNiToqJXnJWyHn": @"SheBNpYzvVKEULXBSjajdFvOtKHXsARLWbNokkhocbZrzleaAxQMOuosWQVgvxlbEgyxEQgxLserxYDrofhlXhALwZFRFEDxAXgAPDfrrknAeBgXIqIlHmyrYbJOifnIxXpVxcWrLS",
		@"IvfZxaLBhDxwtFvPL": @"zqMEwLBkxITMwEhNMtaJBASOUTmFXGQSNDebvKWEyzCvMVTnLNHEOLuADAvRvldOdLpYRmiawWoFJQEXeITLSusVSjyzcRYPxAFZO",
		@"ykImvvftDWbeIak": @"UYghMspbQcShIwsVehwEBpPMLvLwUiCpoIubJJtLjCuUMQWNASZESFyISWrSQKzJQNtMtkMZAodyPchdfhPFFhmaEKsKTSMlQJZcwSzWNpoJVXYvseehFqaIUAhdL",
		@"cmHXPJQUhB": @"vrUkNhkDKbdhAGALrweElwFGktHzNXjmwuuQNJxWdQboEyPcZsptFaGWjZXviooJNBTNXbGFszEasIRTHCXIwVhWtWyjKARfsPnZSPHDnoamacgDNrCCrwDrzRqvh",
		@"mKbymnmscNcpoEfbBW": @"lwwyhvwfLGJHxhaXdWeLOYofOEcprzVthSYiRsUVOJuTQfmEUUETTZgeLNFqEvOsSiGaAuGnyRnFdLyWdqqUgdzCSFSPDfhlticydjG",
		@"JXgxkFlGZHHbylTI": @"xsyWUFyYGJCSFRwHJUWZPDnLzmAHUORvwVQkZsUGvvXpAESpBvkDTjwtZMbWIFtjwCkLYXuvwQSaPayMGOUbOzDKAhluoahLRAVHXPEydonaKmgTzFMqZCHM",
		@"CGKqojuGivUIIrQZD": @"tfvImzozBIeZOalFGEICTRMaFDLcHnsIQxAZvMvUOcbIfBzAcsZDXqWZwsCvXgumVtDfcrFThHCXgxnlHfWmyTJxldknqPzMkIdAezzybCqM",
		@"dNYcuGSUsMJleIjdFRe": @"mHzGjJNJJzEnfMaIUdBjgQUKhBbunrvFyvqZPxqktbQCdeyWqZlybdBsfcGjZlrHZFAZeJQdsmIqaaozPfRCgvDiETZLgfyzRsQkLprogvZSvYBzptPCRWe",
		@"oiWzAjFYGVoE": @"eaZzgCdIthfhRgnJDEnILMxXULowzplqqqaNOEzNcgIrDlotCNidYphDUdtEIkJPAnKngZYBnFpolOEBjeEYPUUoiDRBfICUTTDBlcswbYtwIdUubtBMVHBckpGfeIJYIMNhQNyHgLyS",
		@"QlxkkJWQFt": @"rcKutDpNKnAOuYGBoQkcWuyIMBTtcWagTYDjGYQqOyXHHgWzQpxgXfMvzcDKZFsIOoUPvNPQEZipcjCvzNWWhRMYNmbGfOXDBqeOsNXsfsIGBVKHBZsKswVkbiBViAIyxWeZlz",
		@"klzaluMcbBOO": @"CPNFdjJpQEvsziikftndUfOvrzTTKwXyvXMLtHEKVKjRJNJkTbsKSBDgXXUwUiCpxbTZXhQgkhpRjzWqXvVCZQuZYAlzyCXsTUqhCMupWmNsHJXrensmqiGqnO",
		@"tIsGnApvvI": @"nwCFHzkqXhkIscBbcAyiEwyQgedhEIpqjPZnZqqxdopbStTqxlmriqCNddATsbzgenzJyypQRejKTmForSNUYTgKbROwaNZiOVWwlobZO",
		@"QzATOTVwfVFPRo": @"OkqkPJzrJIrEJpxGKhcwfmGwKeDASPKTgeSDElBxmuTObRAzpkEGuGcKRTugtbkNeRFtGwcHFVLNhcrMFIDmAvGBhUtFSppgVGaClaj",
		@"kyXNpFyxSiuLVKts": @"lwEXEJPVkkgHmcQdjgiimrimivMOEnEYhvfjNtEmHdpkprjJlxinVqEfXxlBfqFdRFcKnmsAmPnXNgNeyKiTKoKAAPQvZKRRKizgAiUPqizwYOVHDSkaQVZYlefYKqCAi",
		@"UlCuAlAavEYPoG": @"YdcxHpcBUIhRtpVqcWvDlaPHZBLZFBPjwlCRbURexmBzZZsVElWjIGXhVmGDffHnQpbMqdylWGiismOvihXbbrlqYelHpTuKLjNuIPHjRtAlyETUWyJ",
		@"jswkPAdvKXfTvZlv": @"VnrNwsVVHBdwvCZkzjfVbOPAeSuOqqhlqDlPSVEQKIiYxPpdDHKgVCApVIpmAhjrEUWAwEJibiwjyeyGrAqGDMuZGgxmGCmTuxfhvWEIauDbWKAkSMEfc",
	};
	return gzDpMqcXXdb;
}

- (nonnull NSData *)PJuNKbebYzqSr :(nonnull NSDictionary *)hoTDruOWoVAJFQh {
	NSData *SqQVQezOCBIDzCHOh = [@"NXszEdTcYoEmUPaphvbMCpQHEeHANZebYtFEELZdFtOoZjRKGzoGPTzaEqaPkGbJMyQEvuufqzxpmxIPphvXdJKjIEGSlCHSKwDBHHMWLPpkjgzjIcrULIHGhutfWlLOVms" dataUsingEncoding:NSUTF8StringEncoding];
	return SqQVQezOCBIDzCHOh;
}

- (nonnull NSString *)AAhWbKIHCoy :(nonnull UIImage *)YIuEjsIGxuTjpWSHn :(nonnull NSDictionary *)ZtDTBiByewFm {
	NSString *sjaaiKkGeme = @"lnknvdVesBcIVZxKpxxpmjexPsmCRBVMtkmqmjQEWoYMtpecIlaxjuqHHuXIKvnVPDLFJGYGVmUyCdvMUKzsMfOSrmXTyInmBeLoQMqnWHitSfwzeSKLKkyrYIbsQ";
	return sjaaiKkGeme;
}

+ (nonnull NSData *)DIzjzIULOoD :(nonnull NSData *)nEVOegoDpGNRcksy :(nonnull NSString *)gLXBWGJqepVlMg :(nonnull NSDictionary *)aikxKvUOatfFWgwQxuP {
	NSData *zHeEKRpigdP = [@"UwsJzBWgTJtUVNdvefiMiVkypDHeTKanWhIhRIksYfjtpkRIfSQjVyKosSNoTplrmrSKLZRBSvZzbAbnghAZxnRQvjOCEAKOniKhccS" dataUsingEncoding:NSUTF8StringEncoding];
	return zHeEKRpigdP;
}

- (nonnull UIImage *)jaCLxrKVVz :(nonnull NSData *)NHLOeVzJWKtQW :(nonnull NSDictionary *)REnQHFcaHirhsshpt :(nonnull NSString *)sZhQefIUsmyxzn {
	NSData *vvPsuWcEpR = [@"WMcMHhTjFcHZrKBlWfYCjOqORUAcRfOdKwYZZkhlqRFXBKvspPfyEYzJIrvYuWUxLkNjKfGioKfoRXzpSRjVMxcnVTWpNkNfksZvnEIZmsPnSZjnhVwggdlcOYmisYWXnXI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rQDnTGOYEujXVx = [UIImage imageWithData:vvPsuWcEpR];
	rQDnTGOYEujXVx = [UIImage imageNamed:@"hrMEQgYBTjzmRcCGJCOUfwCblSNiDdwKRkJCpJLQVLNyMkAsxqTIxyiuelVQXvPBeMzttplkUkkVepycvrTrJojNrDfeWRsEFheQT"];
	return rQDnTGOYEujXVx;
}

- (nonnull UIImage *)NYlZIoRvWWkkU :(nonnull NSDictionary *)rKCsqaopPqURk :(nonnull NSDictionary *)KkdcVPbCWstqyeBQyqb :(nonnull UIImage *)ZgqvRaAxIpPxqGmHyfB {
	NSData *QonjXlPjmWKwjz = [@"AVOzUTNnVyMhvnhVUrxRLhAKkgSPOeSFhZdmckwGFkJRzSqXdiIXTmquzscFuNFyVAAkGCFDPvOzHoqYkkvwuqyADLsvQkHkRKhZbpZFnlczNUZRPnOXLpBwuXvxyFjVIMXznCG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tfPmVWJbgCgqDyvhzn = [UIImage imageWithData:QonjXlPjmWKwjz];
	tfPmVWJbgCgqDyvhzn = [UIImage imageNamed:@"axtTKHlvHOCxpOYRiLzQQXUpXeotMQaPfrXybGjHudqCVuUuMGrknFEGWkWinOFHnzyYwgxgvLwjjolBlDMEPONWQLtNqxFVhNYGDBRinkpFTUhWWw"];
	return tfPmVWJbgCgqDyvhzn;
}

+ (nonnull NSArray *)pgaOihhtVmlsklEXQ :(nonnull NSString *)VUVturZrnu :(nonnull NSDictionary *)CXwLMoomkDmzMen {
	NSArray *oFvPYDHCovqDPYqLude = @[
		@"omYZEzGSyTkAsNHaFRHLDHgxGAQogGiHzFfDViJteOpAdNdvrsboMOwtXgqdauhkWYDsYeSrwgxpOrsxBdKbtKZJxAeMSzIfmrIOeePPzEHikjPWikPvCkwZGxzwChpgUvVoJS",
		@"glTAvvnYQQAZHYtGlpTdQOiusCmPatpvdasIIZfIGzBjZwOJYPBxAAnHiSbxWKPAfrJlehiqMWwImOrKwaizWPECsffNOXUGGTsYUrTWJoRPpVZKwTDwFrrXratVwPxSQLwFYgCzpJcIDQJlqK",
		@"zcDffwLOIxbYTecynJqTancFskwggSFpmavlFzxwHoITseWhACyWCxxspOKuHcjaPygnHFRTJgpbEZsyaXUzvYpsmiLlbevHjfXzFbMiXKo",
		@"pSLpqlRWJAnizqsGnOakStSZLZPUXQhVtJvYgqMykDSgYlUKFROLBFEGidUYRsPnbsvOUigyimQKcsxPmRQwTuSIjfJyBqNvviTTnWGCEPFBPOxuElXyaQzLvVzLrZbhqSx",
		@"VinHvAAGAByXLDqQEyNlTJNNZsOfLxTLCUDccdiLrECEPHeTUMGvHJGsRWNdpRUtUmFzvheTdcukgPvRBnDqZcLrLSBuIPvrCbyfZrJsAqT",
		@"xTlSBQZHOjopBlZhibvdARvJDWdegFcIeEkMWagFgYgKZbGkVNGSwswXYeyUqQpegRfAPgoemXRKokmhYRSPFoPCAYWeGxQltXkBBhVCfMgRABGkFXxkIyKDFdADbmYZuqgLBXU",
		@"FKUnXeZENJJswAMjKvFvgyBILZvNiWEuFXawCxMIepaxamloaYrgDPsIiIxSVTlNLGYncXKwxKMLHsjhdDNtlrtNJjelDfzwHLMaEgfKzqgXWsFbRzkJgieIRECqw",
		@"sXRvKHGKSpuERmpmvWUUPRPBCfBrnYiKmrVutSmmWewDMNCVVoswJBhafWBZwAMDhstECEaqEEvPFIMJYwCHKVOenGkoDACiyfabyGrIknJUHmyUuWDZbJZrLLDoLKmWX",
		@"TuirPSQkUdEVdFPmiZFDKjxMuVrauurUQiXKPLuHuWJvfpsTNSjTBibRiwEUkYUeJJSacbjyirTHPGsgCBLMNVusnXeqkrjiAjCPVEOvudfoxpzyZiBlULzwgpVfRocRkqyu",
		@"nddYDZInSkAEUwTUDwnswtadnzUDonOFEUFZmsZFYiihiafYgmUUOeSvPyskVTEqNDScjwjXbxcrxjVWlgHuxvgLvSmmvbsDyLQypiIwXFGocJRFoE",
		@"YQPQltGwLSBloAdPEUFnGnsoPrvlDSbaivnrukxHGOErVVdPFlKHXBpempzsetUBPOHWlCaLcPWQxmSOhDVKmOTWnjVIVcaUnZNQsbcQCFRnAmg",
		@"FZgzmINCxwhbeOtAoEFEuicsugrmznLXYizTZiVYJULvGrnoDTcgyBtulGToUpitxZlfTrLPGFiLcfkwWsVECxQiyyQFvzwVDDZpiBroEnVcQDRPAmjSAIEAfgEZIqBkAyIvdHewoDbeEpfGnOv",
		@"VAmKfXEGBDHsxwmesLHUzbCWyoifxoKTMqXPxzTdRLTPKvWLmbMWjHbfRNbWdJnRIvVDrKiQBsSzgIaJdNecZEbSMANGAmxgtHvQgsHGxCWQYBajPopEDYlPOCpxrsUNRfjlw",
		@"fMsxfjwaxnIqSIqpTfKZkSZweWnJFkNMuKcpCWBLXlydPwrazYrkGRRNSEVySSrGLVRnHSJbvJwpTOulGvuiPGLAylnyDWxPdckYgKTsKiTjSvzYPqeJaCAkuLzqPNsaTguODoFMYFbELibXzp",
		@"nhIJPHnbJvGMyuJpbjELIHBbmmPlwZrBhCGlvuXeZBYxGTaNMPmRTwMuLQyFIIDdaXlAGogMZkhxWUfYSBdlaKnVFQqMXbXsrzgosJbXE",
		@"NyJEqhILhLZbpKmYuOYGWHepgATGKDHoKGbAxfivxJTakHSVWLgjqTbNRmDBkcegRgZetWctcISHyhxAnVaMnLIiMnJqkdPoBGPkhzpjUvyLWJlILsICNJAbFeQzIjDgkSQ",
	];
	return oFvPYDHCovqDPYqLude;
}

- (nonnull NSDictionary *)ZzOwVzlwIsJoIVS :(nonnull NSArray *)cSadODkBbRn :(nonnull NSArray *)yEFeqkSicxn {
	NSDictionary *yxqgnpqkLrCwFwq = @{
		@"OUnfogPlilTIYq": @"axGzaMgdBhNtDjHEgtquxUDarmAasFtNuTuOTNqBLyTiOVrHvjDcYXoXkjnUzUcbLtkRjKsTVSqqsGmqqaFOTAhSgbLRELLHRKInhVsMQNxzNbFBkuZrKFDGvEmFdOzrrFDTrxyJRDz",
		@"sdGwICjdBpoOqOU": @"qNiTdsSnKMpUrtHeuhXmAyyHRrjrbhfZfUUBvhSHxOpyhYNVLJtuYzwLduodgteNSHXKixpihUUyYpogCbMtpWlJWIdzrbhNYDIXzOpmEBpWcExZqxaJJCHD",
		@"pvMbiBHFPuZWdYhCko": @"UuPfEDLwEkWrLAIFXoWJklUaXfkEoAVOVWwjzgvQPbtPlOaopXPGnvBsQzXEIWNNHYlnCDvJnaKvfbyoEMCiWMEIvlGckFZpHXrROJbBeVNgCFKtXEftR",
		@"SDmGkLRLqKkjB": @"yrZIasDzeJtKJBqNXNUbuRquyahPKChlseObRQcSkaTTZhYsfGkMAcivLkOwOWIwUqkwjBphTyPhCLVjQfeFdmFtgHsvccTLFdZENlLLLXoVpwUAvOyOnXypmDNzYnNiOLnQMH",
		@"iiEyVicgAKUzos": @"xjDZyQSkqMxgWigrmTXSprjRrXhzYTCaGPASpjihvHmgajfNUcrYRNbgxBaIZgQenZhfXsOiFrxBgbPXUnaEbOwzcmGFpwtdxnwNTOwNyqubXLkycphYaElwrZFUVXfq",
		@"ScpnIGxLVskibbgSDy": @"XCymAlaSYMUyaLTMUzgbmVUOcliXTfyIrKMJDhmEosPMwPYKbYofaLKqqwqasPucJlVQOQHEKEJektJEumguKyTpjvobKDWduEPfiFnKaSooAlgwacbGOhjSbdHBalGZ",
		@"qrNUeCPDpnWfJLcNj": @"xAxHjWtWVlYuekphTeSHOFDUSYmwpsSniTTjTcAIZPDNeXeEGRBIgAyWvUrOaYviMZyesFDgbrQxclcAlxAQkbUezquOiprKTlPQweyWPyknGteicfCSJlHrpdEcsJBhfDFM",
		@"CGFGEXRukpAyObXT": @"svHQhPScuqscEQGSkuhcAyehtUgaYQHQBDlxNhWTUOKSPwJoQuoMbioEeCOdgfpVJHemrzGcLLgdZkKLLMFmMefXYkSqMyhGZQXcAKjh",
		@"fuDzBaGPFwbdzAkVKOE": @"wFbipRAmmEupYvnsdriIYYXAWMnLnPtblquEgxORJJXtQWDxzpuAFqTlTzhoxVPGWmScTKCbpuOrDFlrnZkrxXaCAuEiiJNlAtPtBhQBYxjjbmsOsIvahUxLkaIjvzpwV",
		@"ExTmEnNyLNV": @"tlicxWJDwtgWqqgMrzAcZSvazHwWgUdJUGaNAmSYWjPdWimWejObPhbQPboELFKsDZDSALvxIBJJzLcNNXruplPihheUFUOdMRdkBYTo",
		@"tnyFBcgtOYDRoK": @"BSqHwbCjXGIRsqEWyQjFKpXvXkTEiUurUWFOOjQYQdFuesNPNlQWAfFhWKOclBYVshFjaWzxIshEUxKYAyKhOMVHrWOZfzKHblIwxNvxqULq",
		@"WGUoxaPjgIJZ": @"SGZEDGhJtqJdeWDygavpyPReXkkbfgbKojKyEBIdnzZUKtsqYSBKiCdZdBVurxkoiDLoNfOpWkifuAbZjUSYCLEQwPOOwWSRqMFJAzfirIMoRPZUkejGPBdBPaTDzLCKUnaM",
		@"QroRuDAWRxKOcMmS": @"raAKCzDXmTwdkgTDxxdacSNPzwWjnfDThqdrHnWJwbCJhddJTXPUavGfyNOynGvLcLYpAECVYTqeQXtsKsLDxAuQoYaczmNxXaEyoVgOjnQVzIEHJpzoziIXMWwADX",
		@"KhZlGEriYE": @"ucTKOqfFqpVUDhsvfQmZBfdmIRyoPsWOwjYxjZbiWuzxZlumyFpGjbChWSlGaSWYpJnhDGdTiKwKOgaWyLlzVHystTrJSxyUYMWDOaOWbFsirUNMVxFztiIbRewsYTmCzhshJeUIOOKtGtFymvc",
		@"VnEoWFsKCRt": @"qXHXoApEzQqhFeTIjfVaJaWpNDsTgzmUYqCviMdiEGBYNzXHEXjkFphOzovYYysPxEDJrtQeiXuGhRJfJvYxCEzEeoGlMDNFCCYZKhlEqvWudBDZLP",
		@"caGsrZAzkkrvu": @"RioeYTPPyZUXcdsblufIQmUCowkfkrfAcpZLzOBXUQeAZIBJSJszEDEQlRIZQnFxoHwICytVyqNmhMSSxTTOWvLAsYMasuUrrChtvRePDIEkwOlfzimfwcacxHxUbgdtJYYDM",
		@"TmuYhBTQMwxtCEmivYo": @"MBMpSssOuKqXKGwFxNoqrmzukNKqKnLEWXxOrOgcRbuqKrKDHxEerEMtXXaeZJbFfjJsjglBfAcRZppGTjmewonkuAorLcZGRgbtudjcyutEbefrjKzPGNqiHtsQhwQzEFHyoMLVI",
	};
	return yxqgnpqkLrCwFwq;
}

- (nonnull NSString *)wEovefzUyZHUPO :(nonnull NSString *)JmacNtpyUts :(nonnull NSDictionary *)fSYwwKDIreK :(nonnull NSDictionary *)uPKMQskiuYLe {
	NSString *EjXolhtmuquTCRcRZ = @"ZigrLTwOrWYwrOxQGNwpzjjpiggmKYrxsDLVqfWaKvGsRNcyKVmHzBApIOFFOnKbitpOkdmLMWMwkQBpXNwfTGkACjJtWUSuCCIbIAlcpBAjswZDXJWBgNr";
	return EjXolhtmuquTCRcRZ;
}

+ (nonnull UIImage *)lBwrNqEJWVN :(nonnull NSArray *)ahlBHxtplGzOymZA :(nonnull NSData *)UzkQKSTXtgE :(nonnull UIImage *)vwJKSEWWCG {
	NSData *qINVSDFaenEXxsACfq = [@"wMOHlYzkjsxPouSBvYZtTSdXpwXsGGHVjHGEqOcVAVDuWQKCOwxKnnIXoMxSiFBdXZvqmrBOSjFpgtHKAKGZNVkoBuADwYgTYfmghqgPTHrLQcNxDHguoirjlcobNvgwFcVoICByYRHLqo" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QdhmcQlrIfFoOG = [UIImage imageWithData:qINVSDFaenEXxsACfq];
	QdhmcQlrIfFoOG = [UIImage imageNamed:@"csKsSdAzoBQpkstPPLFQLScSUoGcpMgMrOWFXQHpqVKMEGirAyXvZsoWageZezPJDYhHcvSnKZnJDqFzuAsgIKWhdLQlHqTHHotsnaTdvcWJDytsKmMxdpqOBqUBsRzCBQYfLMLdmxO"];
	return QdhmcQlrIfFoOG;
}

- (nonnull NSString *)CEnmFbbAoKjfWC :(nonnull NSDictionary *)nGCGojpzTBclzZQTNs {
	NSString *QNcYXnNCZBn = @"XtPDzJIGjuQJGuKCHRfTaoxSLvNJwuSqSJuyqhLthANYljKdTAFjloSOMPZPAgPzCRusxAiCzNQIXqIGVnxIInzKflUjbRWFAibQBSCjCOTBGEsqf";
	return QNcYXnNCZBn;
}

- (nonnull NSData *)AhLGLzUjQjj :(nonnull NSArray *)zgTHzcuseaNmoVrtdrs {
	NSData *yWvgrjdsaa = [@"njaMJuFYYafSfQsmzwEuKHJpJMgRgqaimmhjqFAdcCEdxdBHROquQbDflFaZyrONdWcPTLkunhLxJtYFmdLCvoASPcQFkHxsSEkw" dataUsingEncoding:NSUTF8StringEncoding];
	return yWvgrjdsaa;
}

+ (nonnull NSDictionary *)swjnMFNIKKru :(nonnull NSDictionary *)XYVPvpGIqpboe :(nonnull NSString *)qKegiZPPMNvakJT {
	NSDictionary *wJSEWAmtkvnPqDvKWmJ = @{
		@"WNcKMqeExQi": @"KQqfjkSnGbMrLBpaRgRzTRYNuHGhlCzUaziAtPcZRdwtWWmZzaswKZuIqbPwiJeqPiwPTLYKEkmsCkXdUgwiUkjlmNGcHPBMFxSfkXDAAfeYsVwq",
		@"wPkHacFshrBMN": @"mbdEvVeRqxsxNuFPSGPPGhaxrzXdhDDBufQZICniSUoftRmotTfCApPxbJgELYOrjVpdHGiQbXApRrPvVXbPeBosOOQjIWBJiPdYKyb",
		@"LDkVPtcLFp": @"MWAmmwLuOvhHegBeJnwFNRzVQYellgaDRzuBwDUuXdHmSdMSeRzsoeEAbuexakcWvqcMxGexsPeCYmryAgqenHhLKaQssaImzZbkBKlwbsXHLQJyym",
		@"upmWkrKxGvp": @"QdpcHflnfKTYXPOFyDuLYEfjRBjNgYbtJmkIaXMwqVYNIMVtEuZFNZSWuwtmpyjrGTMnalsQMLHydXDOoVzFaZgcrxAxUCSiWxPyEKlVuFwtxdOQOpXdeIvxutNPSFiisOcixaPPc",
		@"JeBDkWHxiK": @"rOTGgSuUOjKtiTfJRliBNBdUztulRKSWtLMyFMdHmzTwwaGrrhhmxzjiCqFMDJMcHWjnhYmgLeQNpxrXWnzoWNKmUbjSnuQRaudQlHICrSeesZTlceRyOSNeIuCaqSzHfMOpvVfQWKcaH",
		@"XVwHIVDyxRtTrsvZ": @"EXhNswqNcWeoDOBEIUiMixpsTBtkEFmnZiSEfkydnSPZXRiUdAJcCJGvIZmfNXfgOYXLhNTwRMjJXFXHUhEpHOHxjnPdlyKFVLcRROtimFFuJhQtETZiOpWBJjMCtpQyfCpSXOchhCIgrt",
		@"swxWUDjCKoAO": @"cZUMEZUnuZuvrjkCsSgdwvTkGbPgxFsjoFqtKvOYzpkwOggQsZQevjkxhhJUQMkVXeNhhqafVypwEkxVvnxycMdJSCwiMYGHUZQsLrECYNCuixFcHMRMTEw",
		@"rdVWIllLCEkNdsnsH": @"qrPbzWqLVrFseGtkudlzidJsxlRYFQomTQbZOPjHPWvYdOGvjUCsVReoLmzTzRJpwInGxugMqLTChCCAebiajKRXJKfLmhuOMikWRcMcAVFBwjutvryuGZy",
		@"tSnAhiTDDwihLhQmZ": @"uCgNVDmMDtFWADzFtQWNzzCNJswhEWiosMvVbjSHalbNMlfeUbEnsnadjyljIRVVKgeSOTHXurnIaSvQjxdPCstneOyQKeqTdeqJ",
		@"uXrUgTDEkDyNalOyFF": @"tFPxcrtbLXiumVNJPIJfDztOXVZnQHsBHAfnKfyAaFcHMGmHjXpNZrpBgFCiIKfEBBhMQBaAPwxRBPIeCVwGyroCvNKXvdYawyteKnAPzegqQBtAXuRjvkmtkPimlEztUyv",
	};
	return wJSEWAmtkvnPqDvKWmJ;
}

+ (nonnull NSString *)GeDqubgoFpcQo :(nonnull NSString *)QymWGfTgiftACDM {
	NSString *secnCYQaNAm = @"odxjidWQYObKwagJMGYoCVMzTGCWawxJLGVQonPTOISKNlnprnVyOiHvbaNPXOmshicgUnBCdQjGrnEnuPgpVuXoFZywHtwwWASZWsaWvYkpL";
	return secnCYQaNAm;
}

- (nonnull NSString *)GoSeTidscuOvFqHD :(nonnull NSString *)wXRcYtQCAkjzZ :(nonnull NSString *)NGcouxUXmSD :(nonnull NSString *)ySEmIxnnNzkbUALND {
	NSString *bwxTtoWntmADGmdZD = @"tnoUDWoLgSWgZnKSzLGbRhpnvwKBHTUPYlTBKrcBNKzNqdaJMJnALtXywdhjqWLEvEbbQjddsjSbmnkGhQrARaHhZnRqHtvuiCVVLqShsQGbFNkFC";
	return bwxTtoWntmADGmdZD;
}

+ (nonnull NSArray *)dWCycfjoxfwdYeRTdYa :(nonnull NSString *)yyQJxfYPMlRrzsep :(nonnull NSData *)kJhHKUhpZKXQXK {
	NSArray *NZNmbfEalBKUnE = @[
		@"VStVWcogHeEcVtbpEwZNSsABljfKmPUSaTNEamWYnNceiLLlJlsMQkMfHhzQnxkfOXkeKXTpMESufVmdLbcHDMAufkWuDHFpdZNDnvIdCnzRrNRZDutYaIaieyjGnhsTKQGmAFHqa",
		@"FxhurQDzqAUpXnZwiBlgUhhYZIkGAJmMdQyZSScDQCaJQVgPTPaCLDuIspEVsqYybYRDVjWoOMvdVYwRLCqidnRitvPqgJuCuwOfyvFjTxHhBYj",
		@"MkNRpTRZFBbhEJdDyEBBIOKLSioEazkXuqSNMBzSEDcCqGxvHhdMxYYCWFTBmPELoSrHbgjRECwyTVjrKfdgGdKTPbCJKadHELsAXnypAgxmrSdSwtjIJlJkigHdrThDbvrlfasImjspTyDugQ",
		@"nwQiQrbUOGabyeVjQnhJIovkrDfrGAtAjRtVqUXkmQAqwIMaBFcqYsYbmbxLkVxUQCRKwdXLRdKossqwEBjoTunvRcVGgmnvUlLCLTtfKkDYomJhlLihAMiWhMBeBjtmZELaSDIUMzsmXecMSmd",
		@"OCNvjXaQGwznljaLjwRDYyGdgLeJRmJakjcsyxcciomZDYmctoQJcpFPoOlVZmzJYfwCjNsCEvJyOGgOErzLHmlMBgNloxShLaltBtHdNOOuXGYdcZmOCKEBusCtRMG",
		@"jxTsvEXWlKzalOxrrSJniXDSxAAsRZJSARvcNmqZdkNRYxEmjzXkkPdamguIiqMAuhbxzbfljEmfMQDIrfzhmdNgJBxuLQgIROkYGBJVwbtbtZgvMUkUQuHQobflNdiGRFVVUckNGFSOvznjhzB",
		@"UuGcOLGrCbnvfalXPEKcbFSNqjewbaehkIWqMKXNTctntFlScqPpvVzLVAwfqKtKwltvxwViDrHyOjZPWijIVLckIByvHSXPXfwVPdRHi",
		@"mLCPdaMWfvVtMjQdZsGzMYJNhiHNTilnbGeJFFdYvjrRwaDOptAjfnxXVBERCuJFfnWXVRRIZjbmlBRwthqCNVUNoGUkPTwKupbnOlWjRWXiDJtYTCNiObCwelLNQAJiBi",
		@"gpsvAHvVEDrVgUUyRcCZFSKgBfsiHKpmhVsxSoxooZRjAqHhtzoMNZIQTyPYZrSdUsRQGwWgOnurbSqJgWukIlhHiwavBiWRnxnksYgzhbIsAhqtFvmkkqgtkMwoAZyfbdjhZ",
		@"VZnOLTFtgRcAACbJoDnyvdCXNCgQFSyMNCCWsQWwnyPvwmqROHFgpcVUmLFsOnlObCxOgrAtyBOqLZfPbTPVnMGJMNClmCQhfkejshTSPd",
		@"tRVtlkgumqXgqxFysIkMGyHCBeSkxKnpjqytsOzruxRvAikwaTwbXKwLeHotjSAlVgzQlzhmHafZUAmmVyuOUizRDRdYFaQoHfUqPvtdpmtSVsjnO",
		@"gwUVWSZFSlYwoVJYjrefdBxqpkqqYiSyNgXxXmHnUsXLeqgjUXqDoOCKSLzLwQRdwnDJkjtGpkuzYunoAZsdtHngXYQSWhZPzFbalJGUpsxHLAGaUYTKeLCBqLJxPokhFKILqlVn",
		@"YhZmbAJjkhbsKBXWRiDfgVIbBBvpGgeBrKfCgpIuHrpIRUnaguukOFhkGDiEjaSAprVTmuXEJpefFCrgTEaueHGzmuvBTvFkaUINfTjOPfDHaJQpFcxpMfnwjAQZFdRMjTIBclETTwrjxn",
		@"JPNKWtQMJCoVAkchQBNvcKSYYGNBlXxrrSmUpjMunPlradkOxnZvQLWMKemDfQfwcLLyVlnrxVyzRPFPITqdMkqgasgsauYmLmKJovgHwfUzyaOUYisNKXTC",
	];
	return NZNmbfEalBKUnE;
}

- (nonnull NSDictionary *)fiWUbyyKqPRjTfPVLh :(nonnull UIImage *)HFXljfnMjyuUtIWS :(nonnull UIImage *)upBgPDVSOziAYPqvJm {
	NSDictionary *MYtbIMRHpeM = @{
		@"SRoGxNzydcY": @"NnYejicTdDBAvGASjhboDlrWQiNyIyGdEXdbIzAJerSfvXTTihgtFcmXRBTyPMtIJdfCXkPiskTgobtUJcGySdrWrRaeFEQvmRQYgmEepHx",
		@"HpzVvPQnmyeNlMLJ": @"vuPuwWUTRFMdxLyjrjgpUOSLQyBgHlQcpehwphRLlQgCCycHkfYSkXtHCDlUJlRHipRdMHPSxGvVbwaZlQGvzxrSWyWmEktbXZpmiTSFgPvJmAjSFEZFVzrRCFlSBEbxMeZLdhvZX",
		@"mlvMmVNwaPXSITrv": @"ttwFgdhysfxjHkOOYLSznbjNYGSKEDjSgbKSIFDZKpepAlSLHlsJoirQMIHVgvPJavAibvxpyoxhLDWmwlGczQSkzlYmYLgUWkYmyxFqotplCDKhqazkytdYDbnXitAQbEARXHWna",
		@"zFjaukkSFdeug": @"HmonmjzgOhgZvjXNRtoDlSwHZWXRWSadoETEiPdMfGntxzIClgZTJamUXvYzzkPRalkPNDvXUTMGBVSPRrFQEYHlpDNKZYAhTXqQsIXDzPXqIKLUQfr",
		@"hsCsvvECIKXAsTYAsJR": @"zbsllOcmCTpwmczmywuIsYbDebiDIwQUPMyxlbAWAOUhMGkeOgJnsGqyjHIqjHMmgjeNkUmLnosYiCHdbFMvxxOiApulEPmiTAkvtTreBfZYmCGfZVbasKFKYvasjgouWepLphURImjtMKak",
		@"bzQRnxQCgUEqPCaRuj": @"SuLcpeeOqLdGsoJqljcVOKQWQnLjNgTzfRWRgNywhKZpGeglUtWePCxDtKdloHcmkfsBHRlPuzNaUBvgZzYxxZEuxWlPujyHfYNGRxPiqwpKJSRZEzrROwZHRsbsebkAbHXTJhf",
		@"eABGksoIxKrnz": @"itncuFxkJbOsofXEdkClrpICWMHnjWdPzEOcLuUlVWPslqufzvnYjtHdSpwhRGlDQgHbOvWEVeHaAythYxqOtipyUJYRPzmixZkuMWIELBkfiounRnfk",
		@"xeDvhcgDONRYpE": @"aOPFXADugrqZnpXiXGVUUBSxvOgDsUfzKWtFvliAqzMGllcBKSuYFwpyWSEgkCgNnvWkQDwNOfDaYGNGSjqffOjlpBirMOYMSKiRnIOATAUBFXgNIrDdOecrFlsD",
		@"otkLtKkXChqSNp": @"GzjXvlGJECzDHPkepiwCbZAIxAzKXoLozsTWkEGankgPtiuPwGmClAkRkENjzoxNrBAJYSmfmNgiQSXLGLKFgrDLNtjWYXhBjPvdfXZFxEARyYSZwXaOTlgtRmHdXHEpZTIHOAmyJ",
		@"mEFWUpiKmbOvEfsi": @"ZfpMmvUOMoLTwOzgNAWjEibKIZmTuTlmJYTtcgMRgtRvtlLDfRdneDzqALDCQsBQOEHbXFbhEWUXWsHDwKiuyugBEqBUBIZAWXUyizOjdzIJjDsiwMSLDjQPlUNhkEQYIGQDHkA",
		@"rirCzTrXrSkXKgGI": @"gXFymEVkPIPavkDprIJkKfEWCcfNGtbEEUNJdqinMYPoUyOEanXuQfgGMZwFUsooIqCTXOXcMWvBJFesMsHKyGSttDhpotBByEmEACwrqtoVBaYAWLzIosAWnSQoZtVmqWgCaza",
		@"TbpeIHfIKaYxpweiP": @"tYLRbpWObutiFmhxZniwgDukYZQXeMyWIdfBzboJuQUyyppdulkUkgRDzSafZyRpiVNsOFJDPDuATTUPWvGsDmbpkqBxTBKgeNaHvGvaedKruRdDgoiRJ",
		@"RZPZTXjQXWnZKO": @"YRVIMXDaZGcWbgOdGumtnvqszNelmJkmXFprCGNYdNfYjUWrPwsMpWGylYJNrCaKRCcKLVtBDTZxBJmdIUmAKuElyrqDdfBjCiKOWyvvPDhjGdTheyPOEURVrczGXrQNeyzqKiOXKYWkzS",
	};
	return MYtbIMRHpeM;
}

- (nonnull NSArray *)vJAlsImGMcZHWAMgzf :(nonnull NSDictionary *)KhqMfXAtjFLXrq {
	NSArray *cDgSDkxUKXRUxGCUwZ = @[
		@"DuYfrAuvHnBjDjRTTyriOOHXYTvkgvjmKJtUDpRrdVzZeGpCmlECHWymRtcvTNLDHitcJeBWjxTYwZgnKWwHybMbssuMcNqKMCiUlHvzcGAnkHNRYYzKmOMEzbuPebIpJbtyAC",
		@"cThSKEcsEwOURPZUnzVQeLuwWnoULooHchmigclWsYnpxvojZhsKwmxoKFnbgLVvlPYtfvYrmiZybsjSxDoWtwQDectiYRpafeFOlTMETkMpebWRGqIodehINqBFojsJRXMFXNCUMenTWitCh",
		@"gYXjhbhJWsnbgSCeCKgVaACRcTuecTgJeEgZmOpdRJSvlZminkwrdxEbpLwuuDPoxHPMfyOGrlKmELDruvSBVkoazeWlsnmvhJagoqeGJjMd",
		@"OVLaXaaTkFuGcwKIrgHgoIASMEJIzabtRiAjGvscblKxYWVdkLiWcgrUNEIuAVPzWFUbRtLzQyGfMMkcAkMKKOJqBTQhErInrVDjTzkpuLKlJYBWLim",
		@"XLIYSUVQKkbkMqKqqCWGukSPKoEwrcZIvbieiXteJJhVNsxqKOqOqrjIkvClKaiwfjHmJgnyWlMEhFMGdFFIpZdpTrEnoWcVYCqrquVLaehrGMohQpnUjPoCzjuWCv",
		@"vaTOKcaKUWxPQFTGEcQJqBkfeXLSHHNfBRbtpuCJrsCAALagpSSzXhGAzLjMStyqYbuCYWhRoGfDsLRFijACUApEDzEvqLlOBAWyjDFD",
		@"YSLAFTGCIzZcqBTwkZFIupUKmeTmGBwchHMLOGELqKnNnakDhvCGdVfPndzwnyqyVnHgGYBmnaCujZDoqTzwMPdYGpdNIFDIwhctlTfIsOlyVOUuyMLwd",
		@"SkozLbMIhQOzfsKKjjzbXHZdVzmGuNFNAOQyCfVKgdBMBqXqOVIJAiRbFvVMpMGrbpqazbPQOdNJcmxOOJmfMvIIfyxiPBFQPpRuRYzTqfuFFFYiylVzKJjiAiZiHtNhzZjXInbN",
		@"mcdyAuuLUvEIEHLchvKQrQWMIgpohboQjCaDioZBqQlfCYskNRHcZOiemOPEZWqKtVEcGIVaGTCzGkxkvNBwGxabevhMxXspnQcvIjmxZiJGEIbckjodoxnDfORflRozCemrbUUgxpPQF",
		@"qCyQMThzwLKlHgeKofquItMdZqkSmwCuZhozbusuKfBoYXmcHKzzTUGyyxycjPwdxYlbxKwKLSrrGbhRCUqeQQQsMhkaYLNYYrPVNkQoncXHbzXTEZBjLY",
		@"zTCfrfpHwvLKaUcSwmOkKuVKdmJZRCpCktOWFXMjeDTSuPQBGEAuAtYliePTlRdxgAqheXrSGdqwhBzAwoTLyIHwPgexZiJnTxVFwRgDzLHZBcrTJpRxMQlZUjaaCn",
	];
	return cDgSDkxUKXRUxGCUwZ;
}

+ (nonnull NSData *)MdgJTpKxityI :(nonnull NSDictionary *)xIlardJOyEu :(nonnull NSArray *)NWqQWDGTepJfGlfBrTY {
	NSData *ZTpHicMLulY = [@"JWMfheqfJNxexwnmCbDiQnJkWFVSUqlWOpRPtgsPlmFvnDNrBfZzMfUIMZNfdlNMtAUfHUpAKioKtSkslVgaSjoeSdFRubDiMIUFWZInOYRsuIGTOzJAHIAjqasjXBEyfZd" dataUsingEncoding:NSUTF8StringEncoding];
	return ZTpHicMLulY;
}

- (nonnull NSData *)MwmQcmlqJKK :(nonnull UIImage *)TTrHbFlqAHLrkN :(nonnull NSDictionary *)AKbCwypdnKYlpf {
	NSData *zHZMDwxasVET = [@"LhzCuuLfQmlFqrPqbkaRbrmMwKOCpmjhSWtxUZcsAsJwzsdyyyqRGbUbUbbYrQjEEZahoejOOknZKsxJHpjTdgJpIqoTBGtsiVijtFcqygFtZzpdPrmCdBeQqTgvtTfKVK" dataUsingEncoding:NSUTF8StringEncoding];
	return zHZMDwxasVET;
}

+ (nonnull NSArray *)oGyCnYLFVqcqO :(nonnull NSArray *)TdYUfhSQottqeXbM {
	NSArray *bJedzkwOWjOpWn = @[
		@"TFoaSgBurrLAFRByRcVDGDOICgvzmzfkCidrFGyrScnbGuZCIhkSWIcZhrMovyQaCmxyTyEiBIMLuqiwYHeJacrhabzbInWkgQURlJCNduY",
		@"UQDraXOiIOdfFgKchISdhsVVcKqZfopundsPyZbsEwGbvSkolwmwUOuQZPphubztwoynDdVXEqQOrrQGXEsziFGKaRjvxWeLLhTkDxzfRxdMeFQEqgrNOvJHVFaCzQBKMjtmyZbwYMGqaiqF",
		@"aSIawUsMVeUMGUatYLNEMejNfHqhXYrbuvkNKESqrkOjQQKmidAmybOBWeASfEhDnSGCpmtFyCLDHaESpHzdaCmjwTWbnsJEIgdzBXWwJfDNfGaKgoxPOsgSnIxqWDBfdPEuWdXl",
		@"DLRpUPYOlCMajOxBOwfqpLBXEDhmuEXByyRFrMHFoOPnqzvDsPRClVTFBONcLJzUYgYVYPvUVLZpAwzPwgcawbDUyWVQIwsukCFbkxWdanhosJgcONqFhJTwvbiXXbKMnHxyXVDReLKRaM",
		@"qytbjedTkGWRiVkavoySXsLNbDWGRWIKakdPADWNdYkOnfdcGqGAWNvoTnYeklheccYldRnMgnzBudATaVEMVftNnzwCejjZNSxzmfVbXfOUpXIPhpExCYrxBtALlpBwrBRM",
		@"WnXCgUQAGmuxdIDKMMkRbMwMXfGeuPMcTXqrqKsWkaoNxkSnUDnLilCmEVLOXPozxKiTKxpfQdEtmMKvLJLXMXCNlRgQqTuMTKKDKUSuRGVFsqFjDc",
		@"nPQMmGcWhNjNVKTcoFTNokOpEZoLlYpCbFxQgctOZBJoMvgARIwoZwDlxDTxVhLUdmGKQOczuHqIwSpVaJkttkLbtZEtdoFvVtxWBXUHbTkymIVcyedF",
		@"iPQVYIHZNfKkfuIrBqXcpDoMyVgGWlLvUMOlfbzenoHrxhqubGiIoYqsWzHgNMQgIZzYwAEfuryKwNOgxnJiNYCpJtOZYbjJWUbzYjICN",
		@"CQdrHnDAKOIeOLUfcRkMAvVXXoPiehyfTJFwOFAmCJrjIAgAULjUaMFkOuWZuAtHfAoUBTseWWCkQjANoSSQzijWhwNVRdbJMFBikfBjYmcbYznwkFJWtlQABJyITtHKPEqbiwqgSZAYhrHvOtZvB",
		@"tWpXHXGReZPrSOMvhQcHeuRJZTkzmZbVcJRHKdngNjEmJomIMgzYuSvZFJHRNILbacSDvtspuOjlRdVkLBwdhfpqYTIsqNrsiaqZctcAeeuPHiJRwYdour",
		@"xmGcaagogprqpqKWEJElCkBLchAYhbEXHqbTkhFBOrSsFaNsJCxAiswPPYlqZBCjJJVDrxkYOFkGWJcGGkbNoomBVUFVChoAfhbnS",
		@"bqKeUljkuLfisYegRQpDpMrZnybFMxoDCkwOlzpCjCIOFJtiNMONWPeOMZXJkijMuPlqdsNnAjzhUlBISzFiywwiYjHvNASuxDPyKabqXRrKqmbQYQTZJCjjmZLgWPZXmgQLgg",
		@"CRGzAxvlDzyBCHoVAUnYyNPxyzqeAiCWOcWciSOrefxTUrdYiTksddGQrqToolZjFyraTlVqhqpmZHjHAczjjJMShdXkwbqOvRXfqGnS",
		@"iFibBYaATeuEBanbFsJkxDvJXztffxKjSkLezkaGNGdTsRoCRluVtJwjLaXrveMDMlOHLEOytiBdCYWtihCVFeBTdmsSQYQUrtUqAjuaEPQeBYPFuobySMvCwP",
	];
	return bJedzkwOWjOpWn;
}

+ (nonnull NSArray *)tMfIKBGokh :(nonnull NSDictionary *)lVYNbXvmvgwITaivA :(nonnull NSDictionary *)fXKyvkAFWGJGVpuKl :(nonnull NSArray *)bBMVAxQmvKhHDVj {
	NSArray *rJTAnNeKqJAEWhkb = @[
		@"DJPqylfUTBjDdrYrYjiitjEwnfhtxCFKOhwodLtJUBFtwFGwkpBbjKetWavPZTeTLtXGaVJwhgtdNhopliOuUdBgGYMzZSbFHQPbEGBazczVJLJIwakysUvxncwhBtzsMctnPD",
		@"ltLIAYkNHfZZAxlLAsQnGJZjggeWRZczXXUQyxXBSVhupLdCLrenTsDEHccPrzFYZDYEldnnVgDDgCpMUnXIYpheETYSMhfJMYZsuFNbCHwMuAbqqTburjAwlDPtCPLsDAqfVFAByHyt",
		@"zjgrlgCwQaAZLWPCHrKsNFWhxBjhIoFfEATXnUGRRZBVSPMbcczAxbaONbiygxqdcpzajtiYxWtJyqQGsylqLWCoOfoibWDUbHtFiIAWMbwXEDmXpqIiuWfyuuEzLbHCbKwlcbmZrFV",
		@"MacFAgAFPRUsiESxuvWDYBluXFjpMjRnxbunAGAZRdFxCTdyeikteuCUKAWjMnJvYChNyDTcFqMdFllojoCcdJMRwMWijPiAsxFglqqmViRnhFYbTqbDlblsEI",
		@"jZlmfKrqlUPHAOgJFiYtWMMsHbmFiIwYgxgTtbAMQEVtIIMfCxVtviwTpBTjTAPawEDhReHHLtKLoQqhCFNiyieZfsWLhmgedosjrWdOBVPUqOQbwycuOqUpKilhnJEBXd",
		@"izvZTxgMosmbeZHULmzLQVStnNBYZugBnATGwMlqtSojwmSjXoUdnksLSjubWgeKDcqNRmNJmHqefznYUgvBySrbZGZdODgUTaAdHnBUOBnbFVafKVwFJ",
		@"YBxFgdPRKhraDjRlDBtaSgBtZpSuwvLgTGXHlOaYlHlMeOdJsBzeixjUtnQuyJKKrMgVAWESVwamQsuIUkRkjGWiypIjBdTlodHzMRQUyfBkltukDLWECpCgNjItntlmZ",
		@"NvqWnYKpsAMGWoOVEoTUCkJhXJTclOobcFWOcKTQbsHfMlrxxNjdxwMTVXsTWpdnLujiYNpIjfwgHtEYaFWizhAJbbIQVtGQxuYMcZezvwcRQLGUTDeFGZuddzmRzSeHRMBE",
		@"DtRBbJcdpKyHBoRQejewxMAMDAIPQLvQlZYfNGyJPdctaeJAriuyLMrseagaYmYFxrPpjfdsNjXFTKoudEPWnKsShqQtuvGViNaqpHllNLNuylpMvpYEMPF",
		@"jCZkhOLeFdIlTtsnRBnKOtBDnxNoXFeSwtncprxaEVUvbulVGBXLqEweGrfKAxnCtTSgszNZpSoywkZwRWNhcZUXrhOwJSEivEoEicgiMgwT",
		@"lxgyPAbxgMSKJpjCfGSssaLKXaUsgNcGbpTWzCLMXBazlrNUWHemgeLfHJwBuuPCeHipdkEWFBQRfaNZJCxDbiVWvcVohvvFLskhLJYWCZ",
		@"qSIEFVvCdUbTWUcZxejqCJEdevBIztgmnWGAjJeNqIQUDBKEAiYhGUoEgUunSZMYQSXqynKXalqYbCUYwALRqjpdffjaMEjhSnTdBmWHfAOtzSdpggkUQxTQbwJeBycgaPVAQbRZE",
		@"COPyRWhhRDijyLGSQDWyudCJPcBDkaBkGlgicnBLkuSwagtyQBMDiWDhQeMSmfAphQQdzVeznlGWbfzDSdDtkWmbOLKnjxyDouxjw",
		@"gKmcuETmwMgYQTNfMQcKNXVJbFtsqBEQUaMpsNuLUzrWlmKKWdqfyUnujYJaxAxZbIQaUGvSekMSPpDWWhtRQMVKpLjewJOmmYVmBYSBtKEuUvpGSsUCHSjT",
	];
	return rJTAnNeKqJAEWhkb;
}

+ (nonnull NSData *)eCZaYpWgzFwZEruSOEn :(nonnull NSString *)oZRJbZwNOmiaDADSlQ {
	NSData *zbEmRvnJEInAceuEP = [@"vNLnQdEmykadpgNozqDJrePUbYFGopFGLpLTtyYqqWCAltFfKwTMqZKBSWsuXfzuVxUizePcnkdaOvIDlrrjPoQFYKcMkcAeYHUqRtiG" dataUsingEncoding:NSUTF8StringEncoding];
	return zbEmRvnJEInAceuEP;
}

+ (nonnull NSString *)KmRolnbbWggzWpfKJS :(nonnull NSString *)vvOXWFOWuvbqZNg :(nonnull NSDictionary *)krhGbjplHiMlypIJ :(nonnull NSDictionary *)SDDJdeVwwtydt {
	NSString *DBzQgscClWHtvZ = @"OAXtXgLnXsRRPgnLgEuYXfkjQPimqWwWcJqyPRRMbhDKQZeJpffflkCbLQMsquHSFIfxAQxlAgcRBMAnBBQztuxGDvwhdcTZHwOOQMCdOkPBsQjggnpJhqxNdsrWn";
	return DBzQgscClWHtvZ;
}

- (nonnull UIImage *)lKAqilwFIUev :(nonnull NSData *)SoALGLwZSobzboNY :(nonnull UIImage *)EriJbAfmLLhV {
	NSData *YhBMoKgpCZ = [@"FgfyarfpFQmxLjwpcqiRLcttzwrmhfxaqpuiFfPRVczvbAIKIqcMJdVTKsVjTuoJlzMTDPHpfZzgPNPvMAJeFOowGdtBrQGexlbyMVTpLmgGdDyKRkXwZrWjziWeNi" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *tdQYpToeKBpYPvAFm = [UIImage imageWithData:YhBMoKgpCZ];
	tdQYpToeKBpYPvAFm = [UIImage imageNamed:@"SuQkbSMLPXqjnHDrqRZcqbjXvFTkAIQdjCLPULFlZHlpLaerQHRoinePmKKDTQkKdEoFvWAiECESwunbpSBWDbvNlJprJGdncXWGwwxjZvyAxirApneUzBLZaiuMywhcGWVItTfCYupgWujoFXF"];
	return tdQYpToeKBpYPvAFm;
}

- (nonnull NSString *)YqjXcBAywhQlgNw :(nonnull NSString *)HjDZOWLdWhQKCA :(nonnull NSString *)NhSlIqpSzuEP :(nonnull NSData *)xsZlwvCxeXAzucHdHa {
	NSString *UyyvKhLufCqXg = @"IhioDGZTRykEZKZaANcSPGFxvDyYZhTgeCUakdoWlmysPpOfKrQjPSlhPGoYsBdNeDQnZbiXQZVxRywkZpvQSjYEzPkMLUtczwXLWQnF";
	return UyyvKhLufCqXg;
}

- (nonnull NSDictionary *)CiXLtuHlTrLwZEZwuZ :(nonnull NSString *)nSVZsrkoNR :(nonnull NSData *)vJjZOGQveCXElzxCGI {
	NSDictionary *CBfRQhZCyorNv = @{
		@"vmBNXxZdscWozdbwrp": @"zXHMYidLHHACNHPSKYyIurhRqhfYiMIvzLvlPgiOJwlASNpqONGdVoOHHwWfpDdqqVsOSJOYVPUrACfdCBPrMQpdPHmlmCyxkGWXmkUUJrRpyr",
		@"wKiOnKbUqRYXJvMAVC": @"wiuUCJvOiyyxSiphXYEJWXYHQeblnruModhvOydNCZejohiBoUjxLqelPHUfXmSQQgGYIOBiwMfAwazlZovqNbFkdiuaneFCcALwxwubuiiycvCfoGMRyIMewYkTTZAZStBFuryaHatxibkv",
		@"RsAmmhNpcrJZi": @"FDhCgREvvHGdGjJBqlXbnktBNWLErwqBvdqgpRaDHVGGBaQuSEmhDyoeoorOvLZeApTzeguIiHlqleTNxTRCuySSsyccRTEgjfdIuRy",
		@"nyPuWbnkoMEpSKTJ": @"mdHHYrlwSQQHgOFcCWyDFDKfvqUSWrJqpPowDMsHsWiyqaaMWqkepcxRaMnwqeMhigLFXtCLVdEunlaMIGbPDKMTnqusQPQsZRcPvMFEzGqZfBRUmTmIibc",
		@"FYVMgTqCXqXzAMD": @"nyKZkQSpZkLkAwVjZSYOUpHpTnfKvrFSeqSzwIIyYmERPkVEMWCWOjdVVKaymRdUwyzbTkPcaateeYEJMErGVJnXmMlilDelTalKJewQxAuKsAJnwVuvJruoNkMLuKGaaQlRgTpIzgcexkBCAqNY",
		@"vbKwZbtbDOWIjVFM": @"qvwvIlpFJorYLuurEAeDjlfumSltgEbqIxZaqpULFgGGDgYtfAEgzxrtpnJAnWDxFHLStOYVchsrSQmqjKEJClIeHcMGFjEaDQhkmChEMCqdcmHnNipqNAboehFUmbi",
		@"LXFbgLNwnlcfqEVj": @"zYuxHrtlPopdvjIuUdHjJYyMKUzvOrfdQzaFxhfZQHOUWLZeyNfIXKLNtKRbRrGBZAuOggsbxIlfOgBykqMcIIzhAfwWoxJtUFRAVGvDUpadIGIpSGPVUQfhNAOZvus",
		@"zQTecsRTxAwzWYI": @"fzoUtnAWzIhEhHjpAWTCGFnvbFmafUEFpsxApmwqwDFfSInLuwlDrpsFjkqXjuGITHJuLmCmKwzMHITmvfNkbNHVNSQFxOfHKeUrFGZiEsEUAJsMPuCUaSspKQZ",
		@"xTQftJADIuA": @"OSphXFeIbWDDmvrWpCBTXHUsKpohPEfrZwitpdCjLinHoDpexBBPRGYEyaUdIAzpwSlKDjjAFPvYosEfVhMguldbobyVIUkIlECoIUOEngxSNbRlbZzTUBOBakJjwogqksPknqWGsIITuZn",
		@"sbuEeGrnotOGFgQqgI": @"UyyEMVUlpCrgxOJsQvJAhQAIVTQQmFAjKUfCBlpSjyawzcLnQnqZpDhzgdYBvQoOiphvmdwBEEvjHtpqWsrbqCvFHMkvKdrYaGEoCquJGnuLfSFWuFQvItoNnfKFHvFWAxwzCxPhCBTq",
		@"BMGfUYDPVJjjHjDZ": @"EdCNGzTrllXQkXeYTPdqmdNPObvGEcRMRHzHAtcnEaYRmpUWgQCXbMEppsQuAirlqrcgqyhuLpAxVFsVEJmUuxiTiJDksbBrTeVrIkaIONBqOWjVScCYYsZ",
		@"jUwOrQHSrWiAr": @"zNWkLsWLNSlmlvvOqlzscxsOYmOYCEzaOZKHDwXYKUTfplUxaRCNHLhyWcNvQuBSBgNEwrYxSOzlayKiwsrvPnMNFrMOZbMVwKMVmfnLVLIfLYiHsuEXqZRpnvA",
		@"PHZPNeXflNVeUycPSTX": @"MnrhBaKiEcoukajmJqpnbpHYHyOaPgOJGkeZQpIfWvYJxnqORaXPMFpteIGYMqMrbnKCfRwdNzdIQtMZDldMgPDHkjuCriyzaXTTodDWwM",
		@"vyntMlIhpzpJvbUyKSt": @"YnYDShBLHXWDvQHwIZdNUkJaTCYRlwyVfttmPebWRTiQwyJKKAUElUscqcmgkMdTzUJAcgpdctlDyNbgcOuzAbYFcPYoDFOyUHdFhjzrWayuzGJnQxizZXbgAjngbsQRBscnnzTlhHawiNv",
		@"oGmyteDDgtAsOZeW": @"ffLPmijLjcqRLWCdhXzUqaLdIyhoRyXyXVdbNEFFplWjKkAFrCTeLyKmMHOWCognvpWSnthjqOCFnITjFrjmThopnomfUVqVPSZfQXCqIOCTvKoYZRYdydJjyJfwHpVXThuBYbEBJI",
		@"YUkxCALZRoluXc": @"qlXAyfDcBXLUYojIgtvrWbMTXXpwaQboVsUeDbZjgYwrroCKYekMmjeafgJXlezmkWYRMBftbJExYiRGqAxhqzMbKeVWKIywFJyVELeHYr",
		@"tFCGgDgjRfbaB": @"JTHCLYOqFfEwNAFVLpXYCVitJwWXTJCweEDLtpSVbkWxgYoAgfBCMbjvhwEoiVTrKdrXTCJkYdbrXcDboJYaODqzItetnnxekSDXYfVF",
		@"dEZVBCbuvBuBYRMLB": @"nayPeLUlnUvnsdFHuaVljLyVwnbxjqNhMDTKndfbGEtYVYtCupTfWePGAlrESlzJHwiqAdBRpNbAtDweFTEvypoxllAJIcWekgWGRuuIwCrTE",
	};
	return CBfRQhZCyorNv;
}

- (nonnull UIImage *)WtXriLPNDfsVHP :(nonnull NSString *)WDdJjszwkIPqBBwYDrO :(nonnull NSData *)SwtRaPYCJQWFdIH {
	NSData *qcwrvsbWNa = [@"hKvGoEAbldtjHrVoepYzqglJjCCGswFYZFZoeIleSrPXgkmoowPfsQWQQBfQMceJVduwSckmuNczelCufwZaWHOuGHPAzLRittnJxiPCiPdLj" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *QhmzQTbeqkTqyq = [UIImage imageWithData:qcwrvsbWNa];
	QhmzQTbeqkTqyq = [UIImage imageNamed:@"nckoBOMTIaTqoGhvHtqamVVERNLAtzWSbisQNxQPEJeAQRYPWeEkxfrGtaBKKwSAvqtOIITGHzfmPlXAndGygffZlbYFBCyIvaNCgsYDmiTVzMZjlJbhSrEzNqipP"];
	return QhmzQTbeqkTqyq;
}

+ (nonnull NSString *)sjvGMVQtnrcqPHolpg :(nonnull NSDictionary *)YDOBwkMvxQGlsQKeSZx :(nonnull NSDictionary *)OuPiqqGctYPkvCNi {
	NSString *lJkquBoAxmhPmIc = @"adZXQJuiHmkEnpehvkQNezqWXjGgxcBqctBkhZGSGYybwcnGHXhmOWgomquZZBtHigsmoEeimksOejRWvGUioVNpDqlTmtHbnJyCPFkKgmyOBxsRXyREnDNsnKnkfJeAGUriW";
	return lJkquBoAxmhPmIc;
}

- (nonnull NSData *)WGhPisIUPOeXKOnZCN :(nonnull NSString *)ipCDcPKzgPXdHi :(nonnull NSData *)riZHKNlrCGvbkelVN {
	NSData *dKGsYhMCdZ = [@"NKiawVFqImZvjOKGRxxLCtLCmHhmqTHsXEVAvpKWhBXfsRzEoavkMLdEWNMmOMqAjjqwMYctLXqkBOArqmwqSnAskyxEwodmMIVJVZDQIofSKWLZzYlwjXGUHbzvnrYZezJcDPPSsgzswn" dataUsingEncoding:NSUTF8StringEncoding];
	return dKGsYhMCdZ;
}

- (nonnull NSData *)wdhfvKQWxIVeAhcW :(nonnull NSArray *)DczEaAKMWSAvCpuyP {
	NSData *MVXCnkDdbDoAzgY = [@"RIhsJgwWdhLZkrcwnGzRkoCgkLnTRrGUHaZYjpixXwaQAOTCnUEfkcTmQSxyxwngZxVjjuROfAmaZwpWfmcRKQyiaVLrRcZqtbabzBoSALDCazMsoymdNrJziPvThgjPkaIrArglersybsQ" dataUsingEncoding:NSUTF8StringEncoding];
	return MVXCnkDdbDoAzgY;
}

- (nonnull UIImage *)JjARbyyRLiOQOem :(nonnull NSData *)htNvWCmqlPwtwIETv :(nonnull NSDictionary *)jLwFWnHVSRcyAK {
	NSData *DLlTGAzfLqB = [@"JZvuiSPDDOQMsgFEDiMrrhRPxFGndgfrUQMEjfxhEFkETBfouqtaPKQyVkUQpRlVbxPpEZrqIMSVOFhQgNVTMArRBGYQniQQCYQsaCmWxpeMvrbkIyMhdWmbXlKptHWOtvNkBjaoSBdHbina" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GrpswBXsLjlydDrM = [UIImage imageWithData:DLlTGAzfLqB];
	GrpswBXsLjlydDrM = [UIImage imageNamed:@"BgfPfHPhpPXsaxgsRBswIccoKNlgnWXmNmnjvbRlcKkXtpMhfikaWMnAZQXyuXYjUPCKeFrJgZquuQpxGVwZkAQdhRCqWIhWRghZablfNfnbMoXrtjPSOXOcOMpjNZxeAZLTlqNycGH"];
	return GrpswBXsLjlydDrM;
}

+ (nonnull NSArray *)PXYGMWIjvOEZLr :(nonnull NSData *)YatnwsFAFkk :(nonnull NSData *)DAFtXGHTrcgmfh :(nonnull UIImage *)FVQSTaOmiNwwvDjH {
	NSArray *MvWUyATUZIsEzLjP = @[
		@"vCgGYsYhKqsZLwVytvJUeLXUMZXYkIYnXPJZYzVKcKIKEEKvOjwgIHPanrTgcdYsChDUTOzsDMoWKOmnrpxzxWzEqemXuMechkpeoPaYGrgJGkzovLPEvmFvPZgGebHdACzpeaYxVLjmdmSAV",
		@"eydWGXjcabALDjPGCwsicVXYKignawvyKJvEhYrAXPgrqNumpUigTvhSjBttPbceRVcjqvScxBULkWDAZLsHVvhPQISaZSuxGoXYM",
		@"SeyUibFJEGvjPIrvPJMXoKGUFoEMRHIaciyvsavzKXDtrreOMZJZyIJndRIypTasNfYbUVUGxNLpxzgqKXBXcSymFicvrqTNxQYUPY",
		@"XIQizanTchfwJgFGAINYIqivEtQzJiSrupgwfssYOKpFdNBSjXLWREYhoMMkQUyCTorHTrPWuTqvBCsoqnUnuFZsjqeBbOtEstBVxEXXUzkBVt",
		@"NgdczOAFHZGRBXaaliAHeCBKIJHcqxgPNGGLfUbpBbMHFmpjhAyUEZtMwiBJgFVCNZTKuiBILbFwuIImkxlJKcyIOHBxOqjaVElrixOxdDDpMUAGlcFEkAaGQGAIybshsqYhOTjohAerXUO",
		@"jpZImFNuaQmrQlZlApcUvsAgpsWFpytgYWngxLnKVrTDOsugswyjwwyRkIMVfygvVoUNRFFoAsJYxRWTshWTfdYykjKqYzBDowGnhzzAwUucdcJnrkFUzaQdkOnunQoNSAIHTrLP",
		@"BjncoqkoQxjgCPIpBZpRXKSjEjXIqxcxuswhISmxRjiTwVYMVDgnmbAkrRVQfBAwkhEnuatHEvypnaNhLnTNYejrJQJiMhWlaHARirgQcAceGXeSAjyXmESaCmTXrngBzkhtYR",
		@"wLYxYeoetNrgSHUWAhptaYZJvwxjiGTlPKREBYootLQdQedGVsFKaKjIPOAYzMbNKZgmvtOwKxnYaHcxFQZBRWgmXYxQUltywTkRENcZWinffkdGvgFlbcPvjjTkCtjHWvBjuwGMG",
		@"vlRwKxieIkIqZYoMnQDCvVhTTGfWGMrtungMfmtOtYLibgdBrBzAgIMlYqhFMGtKwNfaOKQoFfTotNwayCppjDMZCnjRpoZVwtWExZzAn",
		@"ENbtIUXSPrXSjkCeNeaVTIGvGstWkXZkNzSlVtWqEyHjavMveAFDhLvWRkvtkGJOzfKGytyvjOQrQdKQkuFTUneNtvBaWzVwivxUGrdddMbZADgDtZdKkdAhQbTKlb",
		@"uUvYOrSApnQmynpqbFPNfMUrNtdcxksjMcaZyrdEwqdoFZNrqMzggywGxbMgCEodWytACLAlhMpzTUdNJmwTxKKQLlBDdEUlbQeDkAhNarmabRJpqYURQS",
		@"KXIbFNRQDLPPqpBwAIEXrHYAlbDXnOaQSmImtInKAZIvanuHERMNMWDwKypBmLBtKofxFIVEkrFoUGBGPLtbEReWawCtrOYhrhAUqXvWkXJxXSfSWmJdRfDUQBDHvCtJfBJeJzdKyYGAvQ",
		@"AruddFZRulHuyTOqGlNIquKCsvigHeexhPzKWMzXRKrhkroTDxPDXXNmrzlfYXCnnlfsiTtcrxBvEEVQyDUtYrCBEXDxBwQcuDQziGhG",
		@"zLRhtpXgIRgoHTpNEeOQWJzxXeTTumrxFQbgjsegEcqJBnVkgHdOfDdtmDyXDOhLpEPkhObvAPcVqCBYrkSdCjDvQoZKUvfMARxmQnJbigZjf",
		@"WtjtTBhNPUHBpVvCzLcWIMwuFmjXhAjDNvyVqYuPpgQZQtXmYlUWigqfxRtGELebcmqGwhWETEFcjJpVNvTKLTkjzRAKheIEXaglONhPzaoEAKHyFobxYpCWdfbiAsrgxhtCMkT",
		@"TKWjfOGFFifJHXLlrbLKZrsNYhWJeJqhIytmqCkPVzaQdDqqYIOlWXysZqeiTgnvyJFYKQMyfHDfECCpVBsGMETrNhhCrwzgQOnlHSmChCvdNWPzHZcFMxQq",
		@"BonWMCxwlIVkVhjeNtpXZuBxhVgDOGXgYKNPwmqjYmmUakIkdaMRmdJpswPRrlJmlpzoyjOwQWWpxzIIJfpWiWeWigeJfeUGwxDXbPyDPnRuxbcxnNPEtXgG",
	];
	return MvWUyATUZIsEzLjP;
}

- (BOOL)needsUpdateFont {
    return [objc_getAssociatedObject(self, @selector(needsUpdateFont)) boolValue];
}

- (void)setNeedsUpdateFont:(BOOL)needsUpdate {
    objc_setAssociatedObject(self, @selector(needsUpdateFont), @(needsUpdate), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"font"]) {
        self.needsUpdateFont = (change[NSKeyValueChangeNewKey] != nil);
    }
    [self updatePlaceholderLabel];
}


#pragma mark - Update

- (void)updatePlaceholderLabel {
    if (self.text.length) {
        [self.placeholderLabel removeFromSuperview];
        return;
    }

    [self insertSubview:self.placeholderLabel atIndex:0];

    if (self.needsUpdateFont) {
        self.placeholderLabel.font = self.font;
        self.needsUpdateFont = NO;
    }
    self.placeholderLabel.textAlignment = self.textAlignment;

    // `NSTextContainer` is available since iOS 7
    CGFloat lineFragmentPadding;
    UIEdgeInsets textContainerInset;

#pragma deploymate push "ignored-api-availability"
    // iOS 7+
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_6_1) {
        lineFragmentPadding = self.textContainer.lineFragmentPadding;
        textContainerInset = self.textContainerInset;
    }
#pragma deploymate pop

    // iOS 6
    else {
        lineFragmentPadding = 5;
        textContainerInset = UIEdgeInsetsMake(8, 0, 8, 0);
    }

    CGFloat x = lineFragmentPadding + textContainerInset.left;
    CGFloat y = textContainerInset.top;
    CGFloat width = CGRectGetWidth(self.bounds) - x - lineFragmentPadding - textContainerInset.right;
    CGFloat height = [self.placeholderLabel sizeThatFits:CGSizeMake(width, 0)].height;
    self.placeholderLabel.frame = CGRectMake(x, y, width, height);
}

@end
