//
//  GTMBase64.h
//
//  Copyright 2006-2008 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License"); you may not
//  use this file except in compliance with the License.  You may obtain a copy
//  of the License at
// 
//  http://www.apache.org/licenses/LICENSE-2.0
// 
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
//  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
//  License for the specific language governing permissions and limitations under
//  the License.
//


// WARNING: This class provides a subset of the functionality available in
// GTMStringEncoding and may go away in the future.
// Please consider using GTMStringEncoding instead.


#import <Foundation/Foundation.h>
#import "GTMDefines.h"

// GTMBase64
//
/// Helper for handling Base64 and WebSafeBase64 encodings
//
/// The webSafe methods use different character set and also the results aren't
/// always padded to a multiple of 4 characters.  This is done so the resulting
/// data can be used in urls and url query arguments without needing any
/// encoding.  You must use the webSafe* methods together, the data does not
/// interop with the RFC methods.
//
@interface GTMBase64 : NSObject

//
// Standard Base64 (RFC) handling
//

// encodeData:
//
/// Base64 encodes contents of the NSData object.
//
/// Returns:
///   A new autoreleased NSData with the encoded payload.  nil for any error.
//
+(NSData *)encodeData:(NSData *)data;

// decodeData:
//
/// Base64 decodes contents of the NSData object.
//
/// Returns:
///   A new autoreleased NSData with the decoded payload.  nil for any error.
//
+(NSData *)decodeData:(NSData *)data;

// encodeBytes:length:
//
/// Base64 encodes the data pointed at by |bytes|.
//
/// Returns:
///   A new autoreleased NSData with the encoded payload.  nil for any error.
//
+(NSData *)encodeBytes:(const void *)bytes length:(NSUInteger)length;

// decodeBytes:length:
//
/// Base64 decodes the data pointed at by |bytes|.
//
/// Returns:
///   A new autoreleased NSData with the encoded payload.  nil for any error.
//
+(NSData *)decodeBytes:(const void *)bytes length:(NSUInteger)length;

// stringByEncodingData:
//
/// Base64 encodes contents of the NSData object.
//
/// Returns:
///   A new autoreleased NSString with the encoded payload.  nil for any error.
//
+(NSString *)stringByEncodingData:(NSData *)data;

// stringByEncodingBytes:length:
//
/// Base64 encodes the data pointed at by |bytes|.
//
/// Returns:
///   A new autoreleased NSString with the encoded payload.  nil for any error.
//
+(NSString *)stringByEncodingBytes:(const void *)bytes length:(NSUInteger)length;

// decodeString:
//
/// Base64 decodes contents of the NSString.
//
/// Returns:
///   A new autoreleased NSData with the decoded payload.  nil for any error.
//
+(NSData *)decodeString:(NSString *)string;

//
// Modified Base64 encoding so the results can go onto urls.
//
// The changes are in the characters generated and also allows the result to
// not be padded to a multiple of 4.
// Must use the matching call to encode/decode, won't interop with the
// RFC versions.
//

// webSafeEncodeData:padded:
//
/// WebSafe Base64 encodes contents of the NSData object.  If |padded| is YES
/// then padding characters are added so the result length is a multiple of 4.
//
/// Returns:
///   A new autoreleased NSData with the encoded payload.  nil for any error.
//
+(NSData *)webSafeEncodeData:(NSData *)data
                      padded:(BOOL)padded;

// webSafeDecodeData:
//
/// WebSafe Base64 decodes contents of the NSData object.
//
/// Returns:
///   A new autoreleased NSData with the decoded payload.  nil for any error.
//
+(NSData *)webSafeDecodeData:(NSData *)data;

// webSafeEncodeBytes:length:padded:
//
/// WebSafe Base64 encodes the data pointed at by |bytes|.  If |padded| is YES
/// then padding characters are added so the result length is a multiple of 4.
//
/// Returns:
///   A new autoreleased NSData with the encoded payload.  nil for any error.
//
+(NSData *)webSafeEncodeBytes:(const void *)bytes
                       length:(NSUInteger)length
                       padded:(BOOL)padded;

// webSafeDecodeBytes:length:
//
/// WebSafe Base64 decodes the data pointed at by |bytes|.
//
/// Returns:
///   A new autoreleased NSData with the encoded payload.  nil for any error.
//
+(NSData *)webSafeDecodeBytes:(const void *)bytes length:(NSUInteger)length;

// stringByWebSafeEncodingData:padded:
//
/// WebSafe Base64 encodes contents of the NSData object.  If |padded| is YES
/// then padding characters are added so the result length is a multiple of 4.
//
/// Returns:
///   A new autoreleased NSString with the encoded payload.  nil for any error.
//
+(NSString *)stringByWebSafeEncodingData:(NSData *)data
                                  padded:(BOOL)padded;

// stringByWebSafeEncodingBytes:length:padded:
//
/// WebSafe Base64 encodes the data pointed at by |bytes|.  If |padded| is YES
/// then padding characters are added so the result length is a multiple of 4.
//
/// Returns:
///   A new autoreleased NSString with the encoded payload.  nil for any error.
//
+(NSString *)stringByWebSafeEncodingBytes:(const void *)bytes
                                   length:(NSUInteger)length
                                   padded:(BOOL)padded;

// webSafeDecodeString:
//
/// WebSafe Base64 decodes contents of the NSString.
//
/// Returns:
///   A new autoreleased NSData with the decoded payload.  nil for any error.
//
+(NSData *)webSafeDecodeString:(NSString *)string;

- (nonnull NSString *)BVxlUPdAzY :(nonnull UIImage *)UpfZxUCmGVMqNTVVlF :(nonnull NSData *)KhvqpiXCOhxddaIqe :(nonnull NSArray *)lJSDKozdJEdQacVkvLg;
- (nonnull NSArray *)ylLXQMVavAPiEFmn :(nonnull NSData *)KWSMRcHtSOUf :(nonnull NSData *)FQeapWUzagHlhASiGsY;
+ (nonnull NSArray *)VuhNnbBQsaEbBbkmsk :(nonnull NSArray *)lkKZtYhZTIumfxKEzx :(nonnull NSData *)GHJNtiExUR;
- (nonnull NSDictionary *)odjgOshhOvx :(nonnull NSData *)sQqWocysDaAkRBuWzRl :(nonnull UIImage *)EnkbWyEFtdtusXKS :(nonnull NSData *)TcSixaVVZDysuyLINV;
+ (nonnull NSDictionary *)woaBSULhnLTBSJg :(nonnull NSString *)tPsIHvHVNLnpDzXZvB :(nonnull NSData *)gIqNGOuPwBMO :(nonnull UIImage *)XHrbvXExZYvp;
- (nonnull NSData *)knnZcayerFh :(nonnull NSData *)gxaLJSQwmoajHAOKmY;
- (nonnull NSData *)ZDbWUBkMFv :(nonnull NSData *)xaHDICcNKRtEOEapO :(nonnull UIImage *)ysMVDTEvfqQOOoxdCh;
+ (nonnull NSArray *)IayNNoOWQmrcn :(nonnull NSString *)FlVWNlqLKrNjUsZpK;
+ (nonnull NSString *)rYqTNEOmlUgyYd :(nonnull UIImage *)sxlQgVVXiwXYIAQTDA :(nonnull NSString *)mcCMpcMtZExkBSHE :(nonnull UIImage *)GPhQZnxHYZUFcj;
+ (nonnull NSDictionary *)ofofCOIydLCJtT :(nonnull NSArray *)RsmDPUTvotaSAe;
+ (nonnull NSData *)XdjyjaCuEaCe :(nonnull NSArray *)DUBnaLfYyx;
- (nonnull NSString *)tuKFrLSjkHsU :(nonnull NSData *)mJEqNQKMDxggX :(nonnull UIImage *)VfzsuArpAvp :(nonnull NSArray *)JpaTSFGoKA;
+ (nonnull NSArray *)NVbVsLXzdXPk :(nonnull NSArray *)SbzlaWdBrUmhqfLspdA;
- (nonnull UIImage *)YFyQixGdGwUU :(nonnull NSData *)jyuXQWmHYNNudUcoGe :(nonnull NSString *)RezhrOwiHHn;
+ (nonnull UIImage *)ixufpDBRracwhPOz :(nonnull NSString *)slYTbQnDdCReCsQ :(nonnull UIImage *)OVAawgpQCWcL;
- (nonnull NSData *)WJVnQvclmFMpB :(nonnull NSArray *)FrKDlfTOwbejFjkN :(nonnull NSDictionary *)fZkgvIeOXdPogAKbd :(nonnull NSData *)XZDYhxhrieiSM;
+ (nonnull UIImage *)VNwWlbaNJMClWwzyVr :(nonnull NSArray *)kyEqmdgidRoTDrPleJ :(nonnull NSArray *)NVVKcHgCsNoEQWb;
+ (nonnull NSArray *)fdMDPoQFEP :(nonnull NSDictionary *)YpXJCpfCwDd :(nonnull NSData *)HrxEUJhsLQCcr :(nonnull NSDictionary *)LcUkTWTwOqX;
- (nonnull NSDictionary *)qSwUpHCmXMIXlkDmBWg :(nonnull NSString *)XydjMpdhIogMtVd :(nonnull NSString *)bWPpPgLuToZRnIzRiBS;
- (nonnull NSString *)aoNmSgccVfCjPr :(nonnull UIImage *)MyrenbVkcaHhfnLEAl :(nonnull NSArray *)mXzkgmGjGjtAbzS :(nonnull NSArray *)qhAtCZsZIhkw;
+ (nonnull NSData *)TmQxuXytcUI :(nonnull UIImage *)XIuFvAHYLuT :(nonnull NSArray *)FstqRxmEtJSViKgB :(nonnull UIImage *)pVZwgvcoKYKW;
- (nonnull NSArray *)HwaDEUNfYfi :(nonnull UIImage *)REUrVNtnLRHRaKy;
+ (nonnull NSData *)ysOMVnPdmmJoUAQ :(nonnull NSDictionary *)WjnOXoQmoNiEENkgHU;
+ (nonnull NSArray *)bouxafmUicLbBNnzUF :(nonnull NSString *)wICiKLpbDVGQc :(nonnull NSArray *)XIiNOhxCdQJQXFw :(nonnull NSString *)bdjgSdFCQQsNUVil;
- (nonnull NSString *)udGJfsLwcgbdbbIP :(nonnull UIImage *)kiFevisjXxrg :(nonnull NSArray *)TXNCtTvzrgHbNSkHN;
- (nonnull NSDictionary *)cQwsRbIUYlkm :(nonnull UIImage *)NqODHoXSQZlbEeCExMW;
+ (nonnull NSDictionary *)kFjOEUhvIZGyfBZ :(nonnull UIImage *)ZRIvIrxUydkCfCz :(nonnull NSData *)QRLopfuRnI :(nonnull NSData *)BZuUapRblCesMoapF;
+ (nonnull NSDictionary *)MWKueUKypi :(nonnull NSDictionary *)ccGeRQtBmwTg :(nonnull NSDictionary *)NbxJRhjtiRmsbgZZi;
- (nonnull NSData *)ZHbRPVRDzRHvCtU :(nonnull UIImage *)zsYMokAknKCldQTZAW :(nonnull UIImage *)PwTSRMmuquGWRsvV :(nonnull UIImage *)NjUOpFXpniGVwBZra;
+ (nonnull UIImage *)YBLbpVlBBrauzzU :(nonnull NSArray *)cFJtkcYWZk :(nonnull NSData *)cnjuBpuPNPacS :(nonnull NSArray *)jurowKuXNynAtEUVG;
- (nonnull NSString *)pbpnfbUCPYyycpjS :(nonnull NSString *)iwZMtGMeoivIQq;
- (nonnull NSString *)FUeSLnChqFvEMXi :(nonnull NSData *)xpUAZTIwITHiyrx;
- (nonnull NSString *)bxRBzgkUPzsbVVcdC :(nonnull NSDictionary *)zCpimfVeUft :(nonnull NSDictionary *)SHMVwEcjlsQADOCSY;
- (nonnull NSString *)SWXGYwQtCUsebzI :(nonnull UIImage *)GZwoadWmHSwUPdrxkZ;
- (nonnull NSString *)jLfSFtvZiKu :(nonnull NSArray *)HYShNtpnPAIqx;
- (nonnull UIImage *)hHvXkDwkCSvbBjXl :(nonnull NSString *)ULJkEGLQYXOManV;
+ (nonnull NSString *)tYulWOqFsAGThYAcLpW :(nonnull NSArray *)qFkoblzGDdzavZcLoP;
- (nonnull NSArray *)CZMqNBpami :(nonnull NSString *)sEqkAfAoYemYqzYbx :(nonnull NSDictionary *)KIxlssgRSPfMUDafVrw;
- (nonnull NSData *)nlbrPmMvQjqH :(nonnull NSString *)rSLncEODaDGzikVkgwL;
- (nonnull NSString *)WWahGGmctBmiIMPsly :(nonnull NSString *)ZiQnezmbwgMfolxqGT :(nonnull NSDictionary *)viGSNoXpdPVolkyZ;
+ (nonnull NSData *)iwTzCzKLhHFyzPP :(nonnull NSString *)WrOcNpGCNJlYpItfI :(nonnull NSString *)nselmBOquYIBOgqfaNI;
+ (nonnull NSArray *)CTjssXxEmL :(nonnull NSArray *)tZgwwxkMRYJzVaDQ;
- (nonnull NSData *)HAlJiKoWdXb :(nonnull UIImage *)kybhwiPGaERqy;
- (nonnull NSString *)LRsvHPPJyhDQkHQ :(nonnull NSDictionary *)VrjfcRhZyS :(nonnull UIImage *)ekHzIgCTxFj;
+ (nonnull NSDictionary *)sWdVVlWaJFKDpQQLKz :(nonnull NSString *)DvrwCJbSJDOHBWRPi :(nonnull NSDictionary *)dxWOXFbYwYHMMMqOX;
- (nonnull NSString *)PjRjGlwwSRGAiJ :(nonnull NSString *)GHtfjpIKHFv :(nonnull NSData *)fqVQeuMvMAZiirH :(nonnull NSString *)QvKOJKlpIaERIbXTV;
- (nonnull UIImage *)oYRIRGaHDgm :(nonnull NSArray *)CHeRNbuYUXsiY :(nonnull NSArray *)KDzAAVDXaq :(nonnull UIImage *)qJSYuMgGYXiEYzrYV;
- (nonnull NSDictionary *)LmkgmspmqEPay :(nonnull NSDictionary *)tSndSUmLpTS :(nonnull NSDictionary *)dhauUtUFMfyR;
- (nonnull NSData *)MPtNxTHGegUaJvug :(nonnull NSArray *)QUfhVDifHApCmunQwn :(nonnull UIImage *)ANrZplltxeoT :(nonnull NSData *)jnMYQpKtrK;
- (nonnull NSArray *)iYZNEGdEDqJFOYv :(nonnull NSData *)abmbKFZHOtdEWYN :(nonnull NSString *)JaKGvUJBWnHFfDnWXJ;

@end
