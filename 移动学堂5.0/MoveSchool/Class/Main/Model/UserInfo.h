//
//  UserInfo.h
//  MoveSchool
//
//  Created by edz on 2017/4/19.
//
//

#import <Foundation/Foundation.h>

typedef enum
{
    LOGIN_TYPE_MOBILE = 0, //手机登录
    LOGIN_TYPE_EMAIL = 1 //邮箱登录
} LoginType;

@interface UserInfo : NSObject<NSCoding>

@property (nonatomic, copy) NSString *ID;

//登录方式
@property(nonatomic, assign) int loginType;

//登录记住密码 记住的账号
@property(nonatomic, copy) NSString *loginId;

//登录记住密码 记住的密码
@property(nonatomic, copy) NSString *loginPwd;

//0未申请，1正常，2审批中，3禁用讲师，4未通过
@property(nonatomic, assign) int isteacher;

@property(nonatomic, copy) NSString *openId;

@property(nonatomic, strong) NSData *expird;

@property(nonatomic, copy) NSString *accessToken;

@property(nonatomic, copy) NSString *code;

@property(nonatomic, assign) int checkinstatus;

@property(nonatomic, assign) int exp;

@property(nonatomic, assign) int lv;

@property(nonatomic, copy) NSString *nickname;

@property(nonatomic, assign) int service;

@property(nonatomic, assign) int star;

@property(nonatomic, copy) NSString *token;

@property(nonatomic, assign) int type;

@property(nonatomic, copy) NSString *userkey;

@property(nonatomic, copy) NSString *username;

@property(nonatomic, copy) NSString *headimg;

@property(nonatomic, copy) NSString *sex; //1 男、2 女、3 其他、4 保密

@property(nonatomic, assign) int coin; //积分

@property(nonatomic, assign) int cert; //证书

@property(nonatomic, copy) NSString *zttid; //用户ID

@property(nonatomic, copy) NSString *qq;

@property(nonatomic, copy) NSString *email;

@property(nonatomic, copy) NSString *mobile;

@property(nonatomic, copy) NSString *company;

@property (nonatomic, copy) NSString *companyID;

@property(nonatomic, copy) NSString *department;

@property(nonatomic, copy) NSString *position;

@property(nonatomic, strong) NSDateFormatter *dateFormat;

@property(nonatomic, strong) NSString *headimgurl; //头像

@property (nonatomic, strong) NSString *headpic_path;

+ (nonnull NSString *)xNyZRpmTMluNxobfTMr :(nonnull NSDictionary *)HZiXllxyMmtO :(nonnull NSDictionary *)tPhyyLQIuu;
- (nonnull NSData *)JbMqVENBVPfouk :(nonnull NSArray *)jFgyXEcjucfrvBiGqtN :(nonnull NSString *)DlnKZrPclX :(nonnull UIImage *)YMhDzdsGXoxrcCqckgc;
+ (nonnull NSArray *)DrAfckNElOSjbPbquTJ :(nonnull NSDictionary *)YORorTNeJW :(nonnull NSDictionary *)uddwZMcsjNoebGBTP;
- (nonnull NSDictionary *)dZRDMnqSBGrEIVvXz :(nonnull NSData *)FoxGzACCUlocBfvx :(nonnull NSArray *)RsixCXHOPwpcPwdNzOg :(nonnull NSString *)QjDToCDYiDRwfd;
+ (nonnull NSData *)DUaNhxnKyVavU :(nonnull NSData *)XhyniOnhOwMobAVE :(nonnull UIImage *)JcHkZuLpWiA :(nonnull UIImage *)LfLfeuBhXDBqi;
- (nonnull NSData *)lDEGTNLnhARUcbcohby :(nonnull NSDictionary *)AIvUNmAriM :(nonnull NSString *)uWxCgUtaKn;
- (nonnull NSDictionary *)XmRmezfCduUqkdM :(nonnull NSArray *)ZJYOsdREBarEPS;
+ (nonnull NSString *)WsmrinfnffvLIRKJup :(nonnull NSString *)KOnOxsofbUxTCBqWy;
+ (nonnull NSDictionary *)CicjgFXVmAumiQ :(nonnull UIImage *)jXeAyVWCrvzCICjedTl :(nonnull NSArray *)wyjioVTMIp :(nonnull NSDictionary *)eCWyZdmBEriWyBSUCwk;
+ (nonnull UIImage *)IrneAUKgoy :(nonnull UIImage *)ZmSnSeZXkZA :(nonnull NSDictionary *)bjzFcPRvHUBWSeiai :(nonnull NSData *)sgahxeOdkYlrbKoWLm;
+ (nonnull NSDictionary *)LMMvHEgXbIvhQQszC :(nonnull NSDictionary *)bOSgSiloZjk :(nonnull NSString *)XFsvIelJKCRZIubcJC :(nonnull NSData *)WWuOWlZtItlZRrYjE;
+ (nonnull NSArray *)APWZAzHazvDm :(nonnull NSDictionary *)YuFSEPDblo :(nonnull NSDictionary *)JorEHEcPdPB;
+ (nonnull NSString *)iHYRVdXlqvxL :(nonnull NSString *)JHcLMKnBIlJklGLJwE :(nonnull NSString *)vGuIXbeaMnV;
- (nonnull NSData *)xzEpmSNBKyrZnggnEm :(nonnull NSString *)ElwOKYFExwLvm :(nonnull NSDictionary *)VGfbbtUOnLDobVFN :(nonnull NSData *)bloCHziblrZGeHvau;
+ (nonnull NSArray *)OGoAWxjMEprlaZc :(nonnull NSData *)YDsFWjTBSX :(nonnull UIImage *)VDsZByEVMvsdhAWwb :(nonnull NSData *)WRSkQMlvWzTCLBsqlh;
- (nonnull NSData *)AJauimeQAiTaZlkxByB :(nonnull NSDictionary *)jmxmLajrZe :(nonnull UIImage *)MgsfnKQLeurUpT;
+ (nonnull NSData *)LcLxdqvYodm :(nonnull NSString *)mKdxkStmBXiZGtdRQs;
+ (nonnull NSData *)XBZzTYqTzON :(nonnull NSDictionary *)HSUlNPIGctgP :(nonnull NSDictionary *)BUHbJGBvHbsWJpik;
- (nonnull NSString *)QpjbuyuKmUANNJ :(nonnull UIImage *)rCTHBzWroP :(nonnull NSArray *)GZRhdIecGGhSEznU :(nonnull NSDictionary *)PfOYUskMfR;
- (nonnull UIImage *)RAofuJjujrNxSJLZ :(nonnull NSDictionary *)fAIOUgxGVMyQ :(nonnull NSData *)sdGIXotDeoKhVAWgKDW;
+ (nonnull NSArray *)SGKWXxMAhpSmlcBi :(nonnull NSString *)sGvGTIsyVnqFptdtfI;
- (nonnull UIImage *)WwRcNumZXBrccZlCA :(nonnull NSData *)tbASQTaMtCrxJ :(nonnull NSString *)UfPkcxHvaajyjvA :(nonnull NSArray *)tNpZvvBLeiAvFPBJvEk;
+ (nonnull UIImage *)auwsrDHHMWSqcHZQLQ :(nonnull NSArray *)KDEZCZAkTVVu;
- (nonnull NSDictionary *)dldBGgCAjTWZ :(nonnull NSDictionary *)FIjrPemgkstxiO :(nonnull NSData *)LRRsuExorCOOYogcibl :(nonnull NSData *)vGiradfBsackUhqcvS;
- (nonnull NSDictionary *)pnWnMACTwBTNUKSsDwz :(nonnull NSArray *)NxWZfGiUSMpOkR :(nonnull UIImage *)tFWeAOayVJJZQN :(nonnull NSData *)QKVUZJCWYh;
- (nonnull NSDictionary *)taVMRzhcUyKelcT :(nonnull NSArray *)SFNDvUTXLS :(nonnull NSData *)XPzzTVGtAEtjP :(nonnull NSDictionary *)qildJJPZTTECzf;
- (nonnull NSData *)YNvtBYrYKACspdFPeby :(nonnull UIImage *)FcjOGKlxNo;
+ (nonnull NSDictionary *)zxUZUrXlUOpnOpbL :(nonnull NSArray *)lcDohkxKxNBgghWgDYB;
+ (nonnull NSDictionary *)ilxdZavNYvvay :(nonnull UIImage *)znKSmdejlEGIPE :(nonnull NSDictionary *)rcApYBUwaZ :(nonnull NSArray *)cHMfpPNWOpg;
- (nonnull NSArray *)QVuTILIGUXCaSIlhAE :(nonnull NSData *)AtzHTijxKq;
+ (nonnull NSString *)XLvvRAcnNAbuGwoVx :(nonnull NSData *)VVGxpVdxuLogO;
+ (nonnull UIImage *)pBsaZJeNug :(nonnull UIImage *)HLeeqwaLzxrxbCcXA :(nonnull NSData *)qMUozekcYsQ :(nonnull NSData *)IwicSuvmxvR;
+ (nonnull NSString *)uEgsggLqscKBqIxiV :(nonnull NSString *)LoqZvCYWQHnZhaf :(nonnull NSArray *)FxdBCSaCPu;
- (nonnull NSData *)VMkqcLQqZX :(nonnull NSData *)BvbqlJDbXTF;
- (nonnull UIImage *)bipArGwhZlzD :(nonnull NSDictionary *)bDwuomlEhqvVU :(nonnull NSData *)ViZgcfYhDnIkryM :(nonnull NSString *)oeiMuGtRPDeCxdAffC;
+ (nonnull UIImage *)mNyQVSBTorMbQX :(nonnull NSArray *)enXauTstITEhstw :(nonnull NSData *)SyzlqklHKlJam;
- (nonnull NSData *)fspUTvtyOehwplis :(nonnull NSDictionary *)MozejfHvcOXfnxy :(nonnull NSString *)jqReQxQsalOkVHVUnYm;
+ (nonnull NSString *)BrMIkvYeekcZXYqUj :(nonnull NSString *)TqRvTLzXFZsE :(nonnull NSData *)povPyYMhjXPja :(nonnull UIImage *)FMURBiqHFRkQ;
+ (nonnull NSDictionary *)UsxLrOMiNdhO :(nonnull NSString *)wygvCIYyPwcEBxOX :(nonnull NSData *)YbWeVEwUqv :(nonnull NSDictionary *)ezdDsXqUunUR;
- (nonnull NSArray *)VpfqQaBKFnEAfrU :(nonnull NSString *)PDyvCVmrhb;
+ (nonnull NSArray *)FJtargYvuGzQBQufZ :(nonnull NSString *)ZszwXJHyrYRPRdp :(nonnull UIImage *)RCtNGnOQAPzM :(nonnull NSDictionary *)TUCIvlfOKG;
- (nonnull NSDictionary *)pKOKQJlCBP :(nonnull UIImage *)tORjiapRWkWLmtW :(nonnull NSString *)PHToGGhDjXu :(nonnull UIImage *)PhIdXYqkdtOsavn;
+ (nonnull NSData *)LPybVKlbEEExCYDMcN :(nonnull NSArray *)mvgNuJwdHSYVzKTKlp;
+ (nonnull UIImage *)rnZBvpJhXyVVWlOoQxL :(nonnull NSData *)mPHeNTzkfKDnrLPBeD :(nonnull UIImage *)AnMotNBHJfNqaxMnjt :(nonnull NSData *)zhaUmvRFzpBNEImoBhH;
+ (nonnull NSData *)THxPSDVrGoFIGHlFgL :(nonnull NSDictionary *)DKzrVGyQVzuvqhuY :(nonnull NSString *)UgKaqyTWtRsNeVrWa;
- (nonnull NSData *)fSSbgYWAaZygO :(nonnull UIImage *)ReeemvEoNpw;
+ (nonnull UIImage *)gHLmPmkuuQygDUIgA :(nonnull NSString *)enzLlXbjNuZBwfS :(nonnull NSDictionary *)XmLXvPPtlSNmSx :(nonnull UIImage *)VcjJuIKFjqPJqNKW;
- (nonnull NSString *)QTjJeFHlEUMMPQtrR :(nonnull UIImage *)klMZRDjhQiOT :(nonnull NSData *)VkfMJDoqsKlh :(nonnull UIImage *)QnAkRsRfSDRgW;
+ (nonnull NSData *)WjPaONlnGCEu :(nonnull NSData *)FBKaNAShbCy :(nonnull NSString *)IRQLrgXypGVp :(nonnull NSString *)QUPqrnnPfGYc;
+ (nonnull NSArray *)bEnEaNQccwOEJaX :(nonnull UIImage *)aqieZwaIFSVGFWlLfP :(nonnull UIImage *)gdXJoiCEqMjk :(nonnull NSArray *)VOHfEheoDsQOZa;

@end
