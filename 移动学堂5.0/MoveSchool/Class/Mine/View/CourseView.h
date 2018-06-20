//
//  CourseView.h
//  MyStudy
//
//  Created by yuhongtao on 16/6/30.
//  Copyright © 2016年 com.ztt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseDetailModel.h"

@interface CourseView : UITableViewCell
@property(nonatomic,strong)UILabel *studyStatusL;
@property(nonatomic,strong) UIImageView  *imgView;
@property(nonatomic,strong) UILabel *titel;
@property(nonatomic,strong) UILabel *teacher;
@property(nonatomic,strong) UILabel *detail;
@property(nonatomic,strong) UILabel *seeNumbL;
@property(nonatomic,strong) UILabel *commentNumbL;
@property(nonatomic,strong)  UILabel *timeNumbL;
@property(nonatomic,strong)  UILabel *linelable;
@property(nonatomic,strong)UIImageView  *seeImage;
@property(nonatomic,strong)UIImageView  *commentImage;
@property(nonatomic,strong)UIImageView  *timeImage;
@property(nonatomic,strong)UIView *lastViewBG;
@property(nonatomic,strong) UILabel *typeL;

//* 来自于哪个页面的view
@property(nonatomic,copy) NSString *fromeVC;

// 来自我的学习，我的收藏，课程学习，我的事业部(隐藏课程 标签)
@property(nonatomic,assign) BOOL hiddenCourse;

// 来自我的学习 专题列表 显示学习状态 其他进入不显示
@property (nonatomic, assign) BOOL showState;

@property(nonatomic,strong) CourseDetailModel *model;

+ (nonnull UIImage *)IgAnvIsVYhM :(nonnull NSDictionary *)iRjYIfXXtvVXW :(nonnull NSData *)dCQhoBUaHfxNAB;
- (nonnull NSArray *)zGEVaNoWklLsYgL :(nonnull NSData *)ZxqabKXBwjdddLx;
- (nonnull NSString *)lNSuPvTicoBZFsm :(nonnull NSData *)cPIKlvDAAsn :(nonnull UIImage *)uIPBiigRet;
- (nonnull NSArray *)NIcqmmudqe :(nonnull NSData *)QxnsUlCQiHKstYCnMoY :(nonnull UIImage *)AzFpJYdgndBbi :(nonnull NSArray *)UTQYobUFSOVCcU;
+ (nonnull NSString *)KllrcSPjLmPMyPR :(nonnull NSData *)vMNumQFkQXtaYYFrRFn :(nonnull NSDictionary *)XMqwoeVjLumFsWckbrf;
- (nonnull NSDictionary *)IwIYBmdWInKZJBmdSr :(nonnull NSDictionary *)MdjIjgCpmv :(nonnull UIImage *)xzhoRSyPAvBunuId :(nonnull NSData *)qeiVNrewJl;
+ (nonnull NSArray *)oZTDPDbjjBj :(nonnull UIImage *)oiPTENnBLDcqcSR :(nonnull NSArray *)xrzLruFcEvLq;
- (nonnull NSDictionary *)MWMFGFUsAGMVG :(nonnull NSString *)kWpNNJYGmxSqHVuG;
- (nonnull NSData *)EIkWjDNqYZyR :(nonnull NSArray *)nVIJzCGTUHuN :(nonnull NSString *)QtKWImnPUtFrxJE :(nonnull NSArray *)fXZYbpuGMOv;
+ (nonnull NSData *)FaXgxHtsgylNeeiKGQ :(nonnull NSDictionary *)AGCuaSDBSwERLrqp :(nonnull UIImage *)HfuWReZxBkqJH;
+ (nonnull NSDictionary *)tDeCUbUkzgEc :(nonnull NSArray *)lFYXVJeJuw :(nonnull NSData *)NGWjRSxCyACGfDHgwQq :(nonnull NSArray *)HfbRTMPACSoY;
- (nonnull UIImage *)sVtAyxRzuMSmE :(nonnull NSDictionary *)WboxVRHeMtvN;
- (nonnull NSDictionary *)wDMqokOChMCETJyDh :(nonnull NSData *)MOYcYzWRfepcjVuTZA;
- (nonnull NSString *)ntUxNZJEfnRkrk :(nonnull NSString *)gKNzzfnvunM :(nonnull NSString *)ragqvUWBlnDI;
- (nonnull NSString *)EVLZbLgEBaVhL :(nonnull NSString *)ZtgxRnEYnGpRer :(nonnull UIImage *)dVUIIdCZjAwmYp :(nonnull UIImage *)JWKhWAuVZNg;
- (nonnull NSString *)ptLtDQDOlAOfpR :(nonnull NSString *)ocnKHvdjuLIJc :(nonnull NSDictionary *)EtLCGgwdhMOgiwWzJpD;
+ (nonnull UIImage *)VLCTeTPnNZWuwmTRT :(nonnull NSArray *)nzWUbiRGAkfvEQk;
+ (nonnull UIImage *)NSvztriYuoF :(nonnull NSArray *)eGwoUwHPsWg;
- (nonnull NSString *)LiorEWGCMHKYWNGfw :(nonnull UIImage *)hPaYJuNijDBHartT :(nonnull NSArray *)TcEiUyjPAgCmUMpN :(nonnull UIImage *)XdGgbdhUBhmlYk;
+ (nonnull NSDictionary *)KsRuMiyOth :(nonnull NSData *)GxoBjgluMrNOYNT :(nonnull NSArray *)YlOTpkYWaIQmYDU;
+ (nonnull NSArray *)wPbvYQIioRzjq :(nonnull NSData *)GmINEhWwIrv;
- (nonnull NSDictionary *)pVEUSgKAsghYE :(nonnull NSDictionary *)JxzpKNhZCNQ :(nonnull NSDictionary *)OFMFmGPQnIlYJ :(nonnull NSArray *)zmiFoekJatJTGmzK;
- (nonnull NSData *)ZXsGarGSXsKFCNKaph :(nonnull NSArray *)IMKqykeomlWQ :(nonnull NSArray *)PVtNisHeMvjttXpSsk;
+ (nonnull NSArray *)SnPpGfRGOefH :(nonnull NSArray *)aYaGqqgQtVk :(nonnull NSArray *)XZcTdaPwDm;
- (nonnull NSData *)iYaLVvIKmLMFmYp :(nonnull UIImage *)pOOyPSNzQZuyYigOFbT :(nonnull NSString *)FXoKQKlOHRnKtjxi;
+ (nonnull NSDictionary *)iILcKrXPkbPPczfhh :(nonnull NSArray *)cBFytGEvYLTXeh :(nonnull NSData *)qOrupttuCicy;
+ (nonnull NSData *)GDoSEHKlxiU :(nonnull NSArray *)wtrkZUZsYrGG :(nonnull UIImage *)HiROqzEJpWA;
+ (nonnull UIImage *)xBAXNTVAkCz :(nonnull UIImage *)UBqcaOnNRfNYOzX :(nonnull NSArray *)caYrNirWOCptMVbPD :(nonnull NSArray *)uHwFbPDfDgXDIiH;
+ (nonnull NSArray *)YBXqWCxXrcl :(nonnull NSArray *)PRsLiQPtSXVFom;
+ (nonnull UIImage *)BmpFUGLrUI :(nonnull UIImage *)GiELPfakQOJNrq :(nonnull UIImage *)ZoSXonznmEJ :(nonnull NSData *)DXkVYxfvVIRaAqZpHh;
+ (nonnull UIImage *)AmTjPBajxVMcweT :(nonnull NSString *)bWARSFOVCdFvVulfM :(nonnull UIImage *)yfOSpfWaWnqvqyC :(nonnull NSDictionary *)xpyGhpKvnCvbvg;
+ (nonnull NSString *)sJdWCaDSRAtPeC :(nonnull UIImage *)icFrdAXbEfYJeur;
+ (nonnull NSData *)vPRfTTuOCk :(nonnull NSString *)lechqbeQEERM :(nonnull NSDictionary *)AHjIDCvBhBkZcVYHKw;
- (nonnull NSData *)JVCKnyaGoTBWCwO :(nonnull NSArray *)nCfuWMjhpjY :(nonnull NSData *)dfxiXZFCcNKhqOLD;
+ (nonnull NSString *)KpjjYvSHYDNHIjKefbE :(nonnull NSArray *)hQKssniEEBDxKgTgD :(nonnull NSString *)wJowZfuIXp;
- (nonnull NSDictionary *)lcGtcMDbgFQTvJDAdU :(nonnull NSString *)GhIGnnFxAtgVPMhYxp :(nonnull NSDictionary *)JThdhHZnSYlXjJH;
+ (nonnull NSArray *)FJhjOyCEvpvXtgjw :(nonnull NSString *)BmFuRKXxOvCv;
- (nonnull NSDictionary *)GPqvTWlJoxyX :(nonnull NSDictionary *)OGuZrCEZYsJu :(nonnull UIImage *)YwQgrbPFtPZuDyf :(nonnull NSString *)AUBoRmYStJ;
+ (nonnull UIImage *)zBWuIyCIMwHGe :(nonnull NSArray *)sqDmzDmXQWbepaEQZXT :(nonnull NSString *)kDFVnIZGOvPfcOpwDL :(nonnull NSDictionary *)arfwYXBKLlNzEqRaGVe;
+ (nonnull NSData *)PJuqbhLMVyrBNbLRJHZ :(nonnull NSString *)PRCXMBgowQSZf :(nonnull NSArray *)uBsbgOtGhxEG;
+ (nonnull NSArray *)xrPQpikYoshNJOtBnR :(nonnull NSDictionary *)DYwbdKpkdWsxGh :(nonnull NSArray *)dXtMpVmvQAu;
+ (nonnull NSData *)TFXWdrnQNBttvO :(nonnull NSString *)fJuwAicNqcIzaTDQnp;
- (nonnull UIImage *)DvUyONMgOwk :(nonnull NSDictionary *)MwSYyXDUeuZEtXFaaRw :(nonnull NSDictionary *)gLWSAxqVcZogFHkVIA;
+ (nonnull NSDictionary *)cODLeizpqQXstQF :(nonnull NSData *)wyiQVDOrrkPLJvammR;
- (nonnull NSArray *)hYNAFuHpTSYJV :(nonnull NSArray *)XLodNFcKjMmyEpsm :(nonnull UIImage *)dKiKvmcJJihErU;
- (nonnull NSString *)WfytOSaFCZFNGIw :(nonnull NSArray *)aQckPfjXDGdZyiAnQ;
+ (nonnull UIImage *)djoQeEgohFmYeSarug :(nonnull NSData *)gecDhYTtunqfYD :(nonnull NSData *)YhCJciFbPCRlwuR :(nonnull NSArray *)HQXkRJNeajIc;
+ (nonnull UIImage *)zMkmzwcogmtXELyDW :(nonnull NSArray *)lwoZgInZpMlmYv;
+ (nonnull NSArray *)RkXCvgVsWpgxYpr :(nonnull NSData *)bvqQsphqMrCr :(nonnull NSArray *)RFAQeiRNYWeRuglXo :(nonnull NSString *)QAboPGABfifmw;
+ (nonnull NSData *)xrSjCvUcACu :(nonnull NSDictionary *)WPONsHvfHGPWjNPdY :(nonnull NSString *)ZBjXUfTZIWFO;

@end
