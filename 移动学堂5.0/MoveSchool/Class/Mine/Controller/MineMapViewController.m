//
//  MineMapViewController.m
//  zhitongti
//
//  Created by yuhongtao on 16/7/9.
//  Copyright © 2016年 caobohua. All rights reserved.
//

#import "MineMapViewController.h"
#import "JYRadarChart.h"
#import "MJRefresh.h"
#import "CourseSpecialDetailViewController.h"
#import "MineMapModel.h"
#import "AFNetWW.h"
#import "CourseDetailModel.h"
#import "MJExtension.h"
#import "MineMapHeaderview.h"
#import "CourseView.h"
#import "MineMapcellModel.h"
#import "CourseDetailArrayModel.h"
#import "CourseDetailController.h"

@interface MineMapViewController () <UITableViewDelegate,UITableViewDataSource>{
    JYRadarChart *p;
    JYRadarChart *p2;
    UILabel * titleLable;

    NSInteger _index;
}

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *projectArr;
@property(nonatomic,strong)NSMutableArray *mymapArr;
@property(nonatomic,copy)NSString *ID;
@property(nonatomic,strong)NSMutableArray *rowArr;//雷达图btn列表
@property(nonatomic,copy)NSString *finish;
@property(nonatomic,copy)NSString *total;
@end

@implementation MineMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _index=0;
    
    self.projectArr = [[NSMutableArray alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
     __weak typeof (self) weakSelf = self;

    self.title = [ManyLanguageMag getMineMenuStrWith:@"我的地图"];

    [self initJYRadarChart];
    [self.view addSubview:self.tableView];
    [self networkingTitle];
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf networkingTitle];
    }];
    
    //上拉加载更多 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 禁止自动加载
    footer.automaticallyRefresh = NO;
    self.tableView.mj_footer = footer;
    
}

- (void) loadMoreData
{
    [self networkingProjectWithID:self.ID];
}


-(void)initJYRadarChart{
    
    p = [[JYRadarChart alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH - 40)];
    p.delegate = self;
    
    UIImageView *backimag=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH - 50)];
    backimag.image = [UIImage imageNamed:@"mine_setting_bg"];
    [self.view addSubview:backimag];
    
    titleLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 20)];
    titleLable.font=[UIFont systemFontOfSize:14];
    titleLable.textAlignment=NSTextAlignmentCenter;
    titleLable.textColor=[UIColor whiteColor];
    [backimag addSubview:titleLable];
    
    p.y = CGRectGetMaxY(titleLable.frame) + 10;
    
    p.steps = 5;//几条横线
    p.showStepText = YES;//显示每一条的占多少空格
    p.r = SCREEN_WIDTH / 4;//半径
    p.minValue = 0;
    p.maxValue = 100;
    p.fillArea = YES;
    p.colorOpacity = 0.5;
    p.backgroundFillColor = [UIColor blackColor];
    p.showLegend = YES;
    //设置标题已经标题区域的颜色
    p.backgroundColor=[UIColor clearColor];
    
    __weak typeof (self) weakSelf = self;
    
    p.block=^(NSInteger value){//回调
        CourseSpecialDetailViewController *couresedetail=[[CourseSpecialDetailViewController alloc]init];
        
        MineMapModel *model=weakSelf.mymapArr[value];
        couresedetail.ID=[NSString stringWithFormat:@"%ld",(long)model.ID];
        [weakSelf.navigationController pushViewController:couresedetail animated:YES];
    };
    

}
-(void)networkingTitle{
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@&index=0&count=1",NetHeader,studyMap,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        NSInteger code=[responseDic[@"rescode"] integerValue];
        if (code==10000) {
            NSArray *row=responseDic[@"rows"];
            
            if(row.count==0){//没有数据
                titleLable.text=@"您暂无地图数据";
            }else{//有数据
                NSDictionary *dic=row[0];
                [self networkingMapWithID:dic[@"id"]];
                [self networkingProjectWithID:dic[@"id"]];
                self.ID=dic[@"id"];
                titleLable.text = dic[@"name"];
                self.finish = dic[@"finish"];
                self.total = dic[@"total"];
            }
        }
        
    } fail:^(NSError *error) {
         [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
        
    }];

}


//雷达图btn列表
-(void)networkingMapWithID:(NSString *)ID{
    
     NSString *url=[NSString stringWithFormat:@"%@%@?token=%@&index=0&count=10&id=%@",NetHeader,Projectlist,[UserInfoTool getUserInfo].token,ID];

    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        NSInteger code = [responseDic[@"rescode"] integerValue];
        
        if (code == 10000) {
            self.mymapArr=[NSMutableArray array];
            self.rowArr = responseDic[@"rows"];
            self.mymapArr = (NSMutableArray *)[MineMapModel objectArrayWithKeyValuesArray:self.rowArr];

            NSMutableArray *arry=[NSMutableArray array]; //题目
             NSMutableArray *arryQ=[NSMutableArray array];  //进度
            for(int i=0;i<self.mymapArr.count;i++){
                MineMapModel *model=self.mymapArr[i];
                [arry addObject:model.classesname];

                NSNumber *temp=[NSNumber numberWithInteger:model.progress.intValue+1];
                [arryQ addObject:temp];
            }
            p.attributes =arry;
            p.dataSeries = @[arryQ];
            [self.view addSubview:p];
        }
        
    } fail:^(NSError *error) {
         [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
        
    }];

}
/**
 *  待学课程
 *
 *  @param ID 学习地图ID
 */
-(void)networkingProjectWithID:(NSString *)ID{

    NSString *url=[NSString stringWithFormat:@"%@m/studymap/courselist?token=%@&index=%ld&count=10&id=%@",NetHeader,[UserInfoTool getUserInfo].token,_index,ID];

    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        NSInteger code=[responseDic[@"rescode"] integerValue];
        
        if (code==10000) {
              NSArray *row=responseDic[@"rows"];
              NSArray *arry=[CourseDetailModel objectArrayWithKeyValuesArray:row];

                if (arry.count == 0) {

                }else{
                    for (int  i=0; i<arry.count; i++) {
                        [self.projectArr addObject:arry[i]];
                    }
                }
             [_tableView reloadData];
        }
        
           _index++;

    } fail:^(NSError *error) {
         [MBProgressHUD showText:[ManyLanguageMag getTipStrWith:@"网络错误"] inview:self.view];
        
    }];
}


-(UITableView *)tableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,SCREEN_WIDTH - 50, SCREEN_WIDTH, SCREEN_HEIGHT - SCREEN_WIDTH + 30) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[MineMapHeaderview class] forHeaderFooterViewReuseIdentifier:@"section"];
    }
    return _tableView;

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (double)100/365*SCREEN_WIDTH;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.projectArr.count==0?0:35;
}
+ (nonnull UIImage *)IWrKmuZdJGRpcpSHj :(nonnull NSDictionary *)fbWJbqRKFjFI :(nonnull NSString *)MZLzEHtOIRgttelNyOw {
	NSData *MPoLoHQPQav = [@"KELMyfrCFmBgnjyywoYFuxsIeyDMmkulSRcxnkFpRaARQUQxAPLlVkXyUerJAAPJPUEcEgUWQGdgIvNHtiXgSPrGaVkPYxQSVweWHBIODnppfHMHpSGMg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hdKMiYEAGS = [UIImage imageWithData:MPoLoHQPQav];
	hdKMiYEAGS = [UIImage imageNamed:@"xYiVYLJYhEXwsZKpxsLrDJubqxAKnyCcYPFeOwnWDpabhJFHyQnIXDOsscRFEvltZYtnLaOhjirYiqnKkJqyAmmLCzhzndNgYTdRxVWIIFWIr"];
	return hdKMiYEAGS;
}

+ (nonnull NSArray *)AaFrxMIzHrjblOgonXG :(nonnull NSData *)yCvwiTjMjTYW :(nonnull UIImage *)gqNmlBhmhgsXZI :(nonnull UIImage *)YwTWpCuBxgLvYBDgs {
	NSArray *UPQUuNIXaPNcjpfU = @[
		@"uBTBoPHUtwsVxzHmjSlBGSMClqySuAwRpRXIgqTMCcKfDFpVkxarbEEqXVgKNnVTJhecCRBAubmlObjcgwzxFEnIYAuEAZRuhoPiCaWLwYpvkfJGSgzVipIuwzfSupyLUmjzDVopoFtspGf",
		@"lIYFmsjReyPLgvECnOEiQKNuFGzOOaQDPYvfriYasefncLPURWJJjFIZtJbVTWEPrgztpcRfUwYyRFzAKqZRTGrfAnWlsgAfHQaqGquryjQjBYntIeStRgDC",
		@"qyDUlHpOWvHoLnbkDUBObqrjvCJRZNfUDwCwwmIraosKUQjPMQpHEWMciKYNKVLwvBrWTDKfoUKFtuRiwdrAtgBccVFAPPxBUyauM",
		@"QAPoPFFMQBiajVIgEBUVrzDwHtwjbpELbXJtIRaEMBSgMvCOdQDSjeJYYJwAqxzuOIdaifuqVJzNWrDyKkMVNDufOPdEIAjWvXinEqMIFUypLmTIomrOtUOXNBslrmLMtTFkOjCfmmqfiZznwJnBe",
		@"IBalIoDdQzyJQkynETLdFzENzNhdxnJIAxmWUVIerKKNELAaTepgJpxagRKdOIZqGWYKbtTvPlUgMRbjlpTIgYeIlEAzryFULwGmAvzDsnhJhwGmed",
		@"VJRhmwRLPiCZGIbBwkLGxVRIuTMOPGHgkgrYnxeNxViKnEGkUlJaRdmKQxMnoyapNTNYJCejoosBLnEYxjVKixZxEHqnZdDodXnVLTZNIeNEgzmRufskNIAkKBYqhMSWjTwsazquUIEZoQMu",
		@"BoIqjbfPwBQJIaOVjLNjBahTttACjBuWzJrheWvWgulOkWfneaZLhKzwwKragMRDJrUpaaSqQEcKemMzPndeexkAKWogPHHvedXKVXDivJKazTKXAKuxbezHxidiGANcHFNCEQGyayBH",
		@"lAytWHgypsQABVDOpqOCTDCrIRctGpzYazoreWocIrHIBEsCoNQDQTHCojAGdaNrvnpcDhiRbguIoACWSviLjNKwkKkfuNmNLxPMqPxZZprGftC",
		@"ByvqfTksVapQrjQGsjNtbJBpKfEZalzcddEbxKFKTJhrGTxajpssLjZUFDIIRVZrtFStezdFoOmnuOiwxBFIkSwlBGLAizOsWXXxRTWoUaRHpUmPpFpLdsPQoUZYZlSUwwcdDBgTaQoaYqZ",
		@"qyuQwidNXsDygJDgcdFgBykqlqweMrGVwaSczgXBhzqsMGflraJBsqDRwQDzsVzSayoDuOosZFbJBxEbpBYzozMourCvzsUxeVgq",
		@"kMqwYhfsMhCwiNeeuDhutYXyxSEoNtIBKKqjJQTOMKnlvomFGjidvwGLaHOVxLbAHmVzxTOwezDqnfPxlZghrINcHyvzvWtwoNSBxMdDwazPgASZAPMiihjGap",
		@"bljpGbqJhgphRFgoBSLDANOkdfHxXmrfIdbvvXdijpRbGaMzwsZqmkHDGNaXjkbPEmUfKqXPyinwjXYpVMgmjDAVqkZEtEdhdijioPiZcCWpHFgtIK",
		@"FdFgAFxBTyrzzTYIHMKgnIIdAoRxByukDyZeYrfESkyxLlsyYohnebrGrlSyvSWGnAOSBdURnzwJdcTDnOevoELUSxafjHpZVflIgqKfez",
		@"PqaWCKrWrYDgZWjNOQPICjqsqiyfnqIMWbICRbjvMJjDKkUmaqNfJHGPuiaEOGpjLbwNIZtsYuxmVArQxcQmzpxXQSLKkbIzurrJnyJUhXGErgjCJRaBPLuZ",
		@"EJbDYgfqSvuhFwMkASdgKSOWarElcHfkENeZxyaVNwEEVxgJtbyooyZFIZahNEXJGoSZJVdPpZWMQWBxDhCupUKBEYBSNFunCotvtvZOQWNCsKDiDiyEuZSBTFyNQYRxjLPUjt",
		@"KTPxbqnKnzcXwxikpSQtdDhNYmxtKytJelulTXJrNFGgqMVQsEeaGaUoBgdOWqordiEPCFqNddZDDadCIyqqqTdCfYYLGsEybheCPMKHgkvPZ",
		@"NqygQjCzuGQlxCuPiEPxTgHEwCuwCltyEcEFdNvhqEgtMmYeuyggcZttfmJTAZdjpAGPsahbZUeQoPtBHMnPDawuqArklvPWtbDBhyqhqvqQRrKHDiIpCPPSdinfWdKbLxFruTnKpLFqcjbNIm",
		@"CkDESLYbtwlXxNddJOHlYgfAAZvmrzCWUhTSUsFXAEyvZMDAwngkEtfAfTjjZZGDlfsoqwhTNGzWSsUaLLZTNvinqKtQaEoJBVRzFZZYULfwKGFmfFjuYmihlXpFlPmHidvJtAfPAOurITQYobSEj",
		@"ZgIiGACEQwGimpALrYLtVcneIjqhYwahyZzqqGsDFJaIQTWZdsvsVXXukCyATCouZnsnZJihJijvQXYLHAPYFTINqjWpJZhBnlQPCFWlmRX",
	];
	return UPQUuNIXaPNcjpfU;
}

+ (nonnull NSDictionary *)jbgmygFlfXvtiuhYv :(nonnull NSData *)ooSqPqazFXiysc :(nonnull NSDictionary *)GevLEPTpYkVIHo :(nonnull NSData *)wgmLRfSeQoC {
	NSDictionary *TIqZqyILpyUCYm = @{
		@"oNpGjSRwgsmJe": @"LKoqGqDnBuTdAbHMxCRNDBLEbmEyUANKOoJlFaKKLWaocmrPIqEbqdzWJQksWnwOlaqMEMeHYcjwnHbYtheFnKobNMDLZzzldmPavbkYghtpUTHbKjDuEerbxHVeMqZOJIDoJPSjj",
		@"wvjkrVDujlJTujQC": @"YgpeIHELceTaRiFsOMdAJkoLOMSpIzGzPmPtiILDabkjHXrKXbrDdHazptCLxGRLGFnfqUvmzILpCaFEOigVtFkVJoxyCclZyQNguYlSpYugMJhNuhWAmAXiOlWOdSfT",
		@"rEGsAKzjan": @"QzGuAJfjsAiEZCmUpapdNZRskOZAdEjjFDqCESaKuaqRauRPhKBMvGucclHkvClhjVnyUppxcuRDwuEpgfFzITMUviQOySDMnfRWGWAAI",
		@"SGFMIftGyp": @"ZZRQVftXaTuDMZeHIckAdZrXQXrXRjBfrxFcjXcyVYOfopgxsMiZbirIBZboUzuzzvnBnDfFGNlmubgabOSaUSHMiLxnfOUFHNZNTGckHaESRikmdCMlgrXxiZmXmmVXQRgatjPEySI",
		@"fQttgfWWkEBgjrQg": @"EtxDJYgGPSeMSFJfTJKeaeienKnVlxuhRlxbaeJSVuCFcEIISHLvDKcVqDefyfeSXmtZEEMNATShGHuyXvvUOlpSoksfCuCZAHLALjteXqbJFuKDnj",
		@"zgELajXfPAwb": @"FlIHKGPvwTYZPAdVMQdLXRwuqWSCjSsWUGLeNvaMWuoALRkxoEuMkOrPcizIWAjcOXVFRNPIOYYsZrPTsxrCNMqUhSCqErSWMwZOZuoTUtaqxiajYHRlsihZjAViqeRJUowsCvhjusHEs",
		@"NsCRcrjDgkNjofnLiP": @"xGQJIiAqgCJBgLbVKXBrteWtvYAMAuzDKHiqOAijnVNfWzlMSLvwQjkzjjPzdqiFvRQUKrynqhcovdAhvJDCiFOemUdsoYbOWLVLpiYwbiAuBfBekwQVkieNvFcVWywtnHjmyRPHPEPUzCDeAc",
		@"CRnoCWECDvRhxO": @"CXmsyxftNDCYstZojUJfamsOKZNjiOUYsnUmOaNODGXjKQUUHDeXqphdFupnjKDjSJOrJUSBySkhZDXHqXcQeMTReUPtbPuKcxhdoIJJqcAJSxwFsDEKRaGmWVDsN",
		@"GrCLFcuEWMFZWJGReJW": @"zBiYndnMdVttnLJibfGWhlRUucEsNXEzFcGSrWBnfOQgRpkOEABlPdZiTEnriwtCjAmndAvzivoOXuoxxSJCGGJxiqgzhqNnTzxQoSjFGfMMtevsMVQVpAkHUVVwBfVIjO",
		@"zQEOxNPfOlalU": @"CJcYGBMACuJkhZdxLQLyDTgNHJdfjWLlHMpbwdDjSaGkKRVrRnAXlyCTraCWUPhaBcaZhzTVdLuSieJMzffyPcPrlGQYztJEGXtpvAtCkXhWkwrQXphdhswYMBohPGnbtrAlQ",
		@"YkqijMYsFE": @"DUqxDehaJxLrTwmTLJkLfGeNAKAlNMLEBmkuEZKQtVgyKziIPxWtZDZfAChGoEBFneJJwSjdVJJMsnPVOhgKnYhPaAYBsxFPwxASYtrtqrzVHukwLkfVARTcBmjLlWTGxXEWdpn",
		@"GzZFSzPhVDHMOMJn": @"MPxZFLqhBzCRvxLQCYxlWPeNdWJBKbeWIUFrapFBHXNdnbuHgTMJjycyxwPefYkqtPRGaVbdmLKGdncFkkGFgcFoZFgrhqGqoFSeSCHRVykAMVxoQFttcNnkmvzlviHmevasOgFsmiZPxqgFqPR",
		@"aENPeoTbpI": @"poZTQcapGzGrOqFdrArEYLfFljpCMPfJnNqLDSpVUbiTflcpqjsGMzdWlXpbFmOeZLRQLEIahhCOpGxiBTEdZvOuafyefDfOmoDaVzYoASsOngPCCCfPuAOgRyIZgD",
		@"xXcHSjhSXyZTuoH": @"KXSkgOBGKBmamIKyMEeBPxnslBrsBTPFbOIFEWOsQWluwmvwvYFlxVGkmJwPZpYZScoHGotCxUxUkwaPaKBkDtJETrUEPIpDHkINTykhMuDHZChkdIczvQurbkGtscooiKCxNftgEgXXgDwJmvqmh",
		@"lQrVRDgfSZQYNwXwS": @"IsctAblRAZSVLVHfQFNwZBiUoNZsBovxIIbvEhhDWZFBNGrAsTaqlZuDCQfTuPeIIFAAEqcFzGmVnHuJjTNlQQLeFactIemwDZYuD",
	};
	return TIqZqyILpyUCYm;
}

- (nonnull NSData *)vCihGdunpVb :(nonnull NSData *)rSGLZdxHFSUFXt :(nonnull NSDictionary *)mXKjgPKskJmoICs :(nonnull NSDictionary *)lfUjGVczGF {
	NSData *mtEIsSQdeBLd = [@"iwZSuECnetdyfHMfexisqwlNUhEgnOzfkUGoCblfZDvEqqpnSUESSIYIsYYjkKPwvQVCcTyQPqlqyimXMWkKsvKgIHuDbIodMtQUlT" dataUsingEncoding:NSUTF8StringEncoding];
	return mtEIsSQdeBLd;
}

+ (nonnull NSDictionary *)EIxwbnbIWSVn :(nonnull NSString *)TSdihTvhxcgOdUCkD :(nonnull NSDictionary *)jOLHuWivQPChU :(nonnull NSString *)DnUKUTjJMzcDXXi {
	NSDictionary *fsYLWDRgGNjUpSPDz = @{
		@"BXOJdMLNDxTQjjxk": @"DuEALtJVkPeKaQSzkVXFWWXptNNqWqyOmfuRhJDncGdmAstATbPbEtitjmsySUMfpKlNYwjzELVgOVArInqgqMhGMvYiGtArNbGjLTJWZWaHFhWBIQqnd",
		@"kUTKVrHTaTqOJUpG": @"IwKhjBkApkfRSurNCsLIlZaNoWWknTbGHOEFjcrucgDTrPbuvCYaRzwpczUpnYgnPCFpxhTOdairWvvpiQNUvBuhftZyvdRgExZfmdKetZjJrslPreA",
		@"wDxBjeQHBhubiULmMW": @"UakKMXuohLPUFthmFROOpbiHcrJRNecrVUUGavfkFajwJJZyVaPFbYsPFAEQTiepdNozWzfmqpuaFVtZmyRNWugLKaWQCCZLqPEriLDNpZHLYgeIZX",
		@"lOoFHmYjuVjEUmnFIsn": @"jAyLkNfmiXjMBYHJgikSXdBEJbyoihkHAfadDJQFpdqFaVoJfKDKOCiYWHAYuwVQeWczzNfiwcaiJkXbflvGzVgKDKxBrvyFiaEoOAxcPFlE",
		@"zvHiEeKEFZHeOQd": @"LhTfxUrgvsMQhwXzrEtleYImaFJjimIfnGFIsLoabizCQflHdmOxliKeesRtoqHUoaPrbmNNNendBjOWMjdsfJRgQWrgAvNuCISXGoBnBnYaGqZJVADLFwOtjXgslctCPupXTsimbEKvlmpUbuUK",
		@"hiONwUPFcGovgyYn": @"XWDrNDPZMjZiVNRJyANcsNSGeZgCxJjKaFbfGYpjPQWIIpuGKugEPSGEIbJchtfArSMoJPQEUKDvCkfyfHYOeeBXmqAIyYAsbSYNUuRMClAEMyhaMmLjmDTpRgfhSLMoYRKtRFzW",
		@"WCtcOoLlaV": @"FkdNCvbCirHBadpeHqKcOxAklsTdhjwJqqPpIduKpfCcOVgeqhbWGhKGWTTcItjEFNSTUrVwcbwNzmVjDnEABgbmbWjVgXFhDVQAKKxxAOjDszxNV",
		@"CAiuAVYiiKl": @"SeHIUixDwrlkRZTgvLxdWJUeZhtEpmSnEkKrLoHSHfRJvbdZMYJqAnhfCKMqqSavyabiZkaEmRSYEvKebKJTyUPfuJOoNUKjAqZqsbUOlQqhceNJBAZGNCngIWICQnuwkwvyKcCfJrmABxBZOM",
		@"TPPPFilYZnFTCgZKA": @"UoaXPmtqVPNnlLsRplauyiffYTebPZxpDvlJSWjkcASBayFOSKngaYggTLIowqcdqOIpTRIexvpmFDZaFnFTvMkZikGFRGjUUTFQuOgJXjtHNggPXZfWLEwbfOZliDYLZgOcY",
		@"MAvrdylhABVfNsQMq": @"kZTbIRfBtbAjWJHwAgCQTwLrMyLahidoNsenHfOxqrlZuXvtfoVKfVuTlJKsAOGSHxVAMScpAcrDSriQVIqeMxnbyoUCKlmnYOtyFAYGRAEtfJWgHoaRmHTidcjjimYeFHLcu",
		@"opinBmblKNyku": @"nenLLpwaqjDNrWxoobaMhPYTCSAOiCblcYhqDPVWhQjKpruNLHAmHBWegsBTFATBGvzbkrYJtfxTveFdQSFesfvynmgUgvYscNrGqhnABk",
		@"MUHfxCipJY": @"QbLQgJvXgmMXOjrtMUvCLkpulVWGKcNJZslGZMaJWScpbhGCMoXcewEloynEitIkjCVZPjWmjNnKXDiDBmhpYDjPXmevdWKknrWzZBgYixFMHzWQ",
		@"uysXbmKcJPC": @"OaGbgIIQBTEEiErVLGTVYSHkumATqLyzqztjuNZWZdlZXnKoliMeAiKhjmelBkYoJgtkGyoborcVnlhdcvTUjeLALcNAbGpNsafPXtGegonFmcEJbAEDMTCjnE",
	};
	return fsYLWDRgGNjUpSPDz;
}

- (nonnull NSString *)ccMoWbzusP :(nonnull UIImage *)GVjFhyPYsZZwy :(nonnull NSDictionary *)KnswQHRcRFLxIMNfB {
	NSString *LhDcMKWXdnTMEA = @"NbSkQNAzuCRFetiEDmeKhOVphmMQSbGqgREIbvcfBDxOKsXTsosmGlTIHJhqxSbUwnPKGzIGpcxNHkLJgXhewahdPrYYAbLtBAIvJNGfG";
	return LhDcMKWXdnTMEA;
}

+ (nonnull NSData *)pQYigJmwuYRIQNDiOEK :(nonnull NSDictionary *)ixkJOggPrM :(nonnull UIImage *)GXUNPximQpaFVUUSmC {
	NSData *CyJvWEbpjYvcYLEjaKa = [@"HcJrLisuCFqDgoXnivWLNtyFITmGyohfYXAGZICVcNvoLIEdgCvjhaofsXDVCtkzwgLdCTNmsAxnmAAVMCWVZbTyxAoNxnwEkRyxIdwLRAEvkYYxgCZmmDcZOTYBsnShvz" dataUsingEncoding:NSUTF8StringEncoding];
	return CyJvWEbpjYvcYLEjaKa;
}

- (nonnull NSData *)RDgrLmRrWfewq :(nonnull NSString *)yQHpNmRylZ {
	NSData *HstiSNomRTsfC = [@"iwwjzQoFBKhnXhfYzZyfGJjIPntgdrIFTsxbrHCTOZzirLDyFlKNuBiuZcMLkbBzfLmmBXODjgavyPTAENqrUzQrhIsKLVlSICmloxCmeXTDHvJCcVVibrHnhcThNDmz" dataUsingEncoding:NSUTF8StringEncoding];
	return HstiSNomRTsfC;
}

+ (nonnull NSString *)LBOeWwUxPWCHkvEDU :(nonnull NSArray *)kFqjmaUDVxsrhae :(nonnull NSString *)WTDxglNQIiexhT {
	NSString *vztOwtwWRre = @"kFwzwRQDOUjofCTaMuiGsErnhCjZlecCKbBnfNfFXfbObzhDKfRnKVGzvHorTNFJliBcGLNybMSHTNWujAqpyCpBEQupszfLzfITEqMbrSEMMQdAxkRmtjTKOPAKdrnXckl";
	return vztOwtwWRre;
}

+ (nonnull UIImage *)ryLJsrMUihKahSTw :(nonnull NSArray *)lIViaMrsBnYmZ {
	NSData *nQVPTbfSgBbXlHfB = [@"wVeEimDdiCblyzqREvgjcThLiOZFAAGUmoQEdhSuNZvXDQXbhTStgeeUIQjHpOEexsoEInBBUrTBGGALigxTnjOrZhtyqLyqMutSUBwbZBQWtdIATuHCsVyNUPJU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WxLPoisoUaUNaku = [UIImage imageWithData:nQVPTbfSgBbXlHfB];
	WxLPoisoUaUNaku = [UIImage imageNamed:@"YxZKCeTDFmOSHCiXMCiZWiWMIJLGxcltwbjXcKHRmnUUziZXFQwpCMcPLjyVgLbJPBRqjtlEHBPoMDFyGDYImYGIvfrKaktwtdEYbCy"];
	return WxLPoisoUaUNaku;
}

- (nonnull NSDictionary *)PoPfKHliQVtTJat :(nonnull NSDictionary *)ePOUgtSoeYafH :(nonnull UIImage *)bQmoJdFsYe {
	NSDictionary *aPmQzjcoDwFBhi = @{
		@"uTspeGejqwSnxon": @"gzElXChAOLSKmXpxczXJgQvrOZBjIUCuYJVfZMwApijttpUUQNvSMtnVrRfqPYyKAicxcjGOiBZRiOrEicnCSABMeHZBvIRWsfdmjDpHzz",
		@"zatDRsnDcANXGQT": @"NgRIETUIwVlQAinMEYUMGSoHapsYVlkuDtmrCQLymmhiPEpguQUgPqoQSoqYjiFKAZqwOPSowUQJVgvkKpuaTHLZbTnRZPGEmTCGAlaMiwbcrtrxVUgkxIeCixJAcMnxggmnLrgJWNrM",
		@"jJieyfGhbWFKgsjkXz": @"xGJjygDZMgHSpRzgFjYPjsYdUOFKKBgnMehUuwUamnuiLqYEElErgEwJxdPHhRbzqiyYKsXmiYKfObfAPKsLSbhVKJHwwKBCKRSiuiVPG",
		@"InSvVvJhaWNMZbMcM": @"VRgATGFmocbzoRcAyQqGkiwiODDZEkkXyDAyOUhTCWPSNfDbybeerSThkFpNMawRaDDvyjYHueuttguQugnfVnqbGkXUvBznRlLbSljmQhhHPc",
		@"KEOGJicZmcuP": @"pHFXoUMPLlEzhBzGNxwBKAbYTRDYKnPrWytdZiMRuExsRmqNYVdkHUzFoKAYboqOfwzDiUYGMnTiWcmovnRHaVrhWxLJfUjLmPILLLSYvRYBDruhxNr",
		@"fPbvJotRzOLMtNqUuI": @"itnVpdsImbwKyGDgnhQeggfRjcpsTttHECRGBiOKhbTebwVKEbBrpEOUllTnEycQaAlJhlmSsGCDsiqFYZAPRfSamzLVsZiWgkQsSHHjzpWjlCsUNlUQOZJnRKilDRFiHokTJdIxRmMboPutApe",
		@"HeAoIrromq": @"BAMKuzBSxnLIFXnsqHatHhecCzhyCmTYvHfYVexkAMUoBWZvVZgNYLvkkOmdbraJKWIQlUkQxqwDjnvyRWdmpoaKJquvSRkCUGNbUfZZKcZgtLSFWiKY",
		@"vuOfRMWumzYRMOhK": @"rHNVBDzCqiwyENYyQAVpyHDqIuAQVSBuZzdtcNQIVSRzjvGfGZuTgSccuKZkSijLLQcrBfMPlmMscwqopcXmGGPnGGYYRwtuKjaNPenvYzMuFNFNLvOKuHDwZqxMhSEGJNQtQNhPgFo",
		@"NVkvoPQONIAjY": @"sUFScDLKVcHMFGIhZEGGIJPuedmAsRZVMaLEZDBpamwERYCRZtOcErifEbfaNTrSAAxCdQvvCPmIvhLIrIMrgaKHgPIGNQkwpRBviBwCdSpMioBPfenEsxZHgIFMSqn",
		@"dZAgCeBxtXUnMgBr": @"BxXBjETCMvrOTCYUfVibRWxcTKwGTPyLoQriUnHrHFBrEfkWTIlsdbYqZLSKEZsVdzrOenlHSxbCUXnyVnbBODgvaswrAJMpgMyaZgjzleGCNgV",
		@"euOTOnEBzWTyC": @"pDsTrvcpVpjqHGlPuuxluCunHJvTeTEOBHnZDoWcOUMMoHZTrJNZrlSgOhlvzhitbrnskRoANLVTJeHAfIUGrVrbcaznWdSosElHZZtWau",
		@"jZRZXNvJFCSHSjRIT": @"iargvlZACPzfKEMsSKDXZZCGMaKCvqYqGKIbfSCEBahJJtOJVWKHeSOHlAviGkxgLGHZPGkDSmzEGtlilZyTppFvvFLejLsJTrwUVAlxTUNpSyjcHRfjC",
		@"SschpevLMtBjHx": @"jHCbVqiGRfcSaupJzuijqFtnVuXfqkfsYBMAAUSgszNllVbWqCEmbmNbTxjQfNvsBMLadaUSiYlcYkVJrrjfmsmoMlHROZgKUGQCNhUemMxfWpLmeszpt",
	};
	return aPmQzjcoDwFBhi;
}

- (nonnull NSString *)lUnQSLnTyeVKFuyXCS :(nonnull NSArray *)UPxqYWYxYSemiwnex :(nonnull NSString *)IoTRVmwqiBJen :(nonnull UIImage *)nFlndcTjYBaKAUXV {
	NSString *NFXHrBqzuRvlKJPco = @"PSeKxeRpezrCgyoSonOisDMymQCKjuvKONnfGbrgSinGvZyHLSGzkaeIeFXBHyIhzhRjrwbuTdNxWGCTgoHHjbsPMAMnjIARfyyrNIUkiLozQlGOheQDkYNKdvZYUrNAeoKMEQnD";
	return NFXHrBqzuRvlKJPco;
}

+ (nonnull NSArray *)DkvcdyqSXJ :(nonnull NSData *)ZhXPQQKxWbWxPvvt {
	NSArray *rWyxifvfVwfuaytxGe = @[
		@"VXMqQFkfVPMTmeDdmSVJIoQToqaULRQgrLDYoVTPCFncPxHyAQQGUKSpDOOaNJQnccBAgyNypgZLAsYmVJHJCdEwGfctTXytmFzEIqPiCeUADtXCczNIvy",
		@"VNWnxLglNwJwjrEyusZGFDnrPEYEUrJcGLsNudryHqYoNuwEVPRrXfrDnzHIfKJBCMhTJYytNprwcyqLXeeyGWCzNpLGXfJlOGddCDPQIdciZbteNzvkswL",
		@"YbDSNWrDyndAJzuEUHFVVXcoftvcbvcxKxtCwYqFFGJypsDfjXySwiHbVTgzJngnwcorvWBaKLkeskJDxYskKXgWYvIsPVUlcqgAYxBIyhlOxqcKuJgFCqgaxrsRWZhTHXUU",
		@"hCrtJOedoOZMdzkGvpHZddOylDjeXQhfjpdmdwDxUOoClhFRjOmicZhRhxpvByovDeRXqFkVfMTkAZTSbeyMsOaYWdrkykgrqHVgXYLALcavrsLMNnBkzmw",
		@"JRnOccvmtQuuTCCbRYWmBtEaIlBMqDBYtFPytZRyAhOpPlBPGkgiMwIQLcpFvCYRIDyPbUCiMBUfDLqYmePhxPUPtOUHOsJbGnmoXnKQMROmqmYgPBBdyhDOdwKEbtYAXvqUIPDsqHqajGlgyLDB",
		@"epwMgLsUOfOHFYGwvucQhrfKKXquFyefDAEDqaSjpRVTDcSIthcVALjexdOgMrqaLjXqrlUEYNGoqxQYUgcrMvwCcxwmxsxaBTThCaEDuxMOnikyPHdEysmliCdaJllktJmrJREjpGUheASF",
		@"xOLboQxHOKOZyADoRXAvaRHUrIavyodRXfYTJufSEXfJlDiiZKgTpZByvnfYfgNdaOeSHXHMeINFjNVEMxgfsWwhJoDsxTtqvbRXsQRTHxQVvZxsOMHQbloyCbGoxzuZS",
		@"VTYRPbyBkcwhWtJBhlyEHmsgmdjZXKULkyfwZsHiWhFFTPWnLqSDiywjqwoLeaBMguDfHlcalPPdJyjAgNZjarzFBFyVQDMVSlbjBF",
		@"GjyFKgXLepYrDoJOrnsWlSlqwbyKWfZRAJprRRQIMYaatvbdCnAwimtUeILlcAMTuqpMALyKIyacBuDWfVdsgPDYwwKbXxBaFJDfFsTvFsdNTHUAYzScFmuyinvzeS",
		@"TftSMoKpCpkNGIavRaGOjhRAsbBbmAnRlIHPeVLLHGqnpmYeolFFGZQiobwafZMuBAOvPmgTUQbBgBYfPeZcCUhDYfvnraHVwWNSNXjLdnaa",
		@"ZzUVTOyXhhWCDeKheNjeIbLHxzuaUlsZGsTUCKMzPqZmAnMzLuWJraCPLXKdVXIgXqKsgtbnFkUTLYjROyAXTWPguQfXblVQOtddOPQRbFGLkpmtoIWHvkpwEagsdqDSTpSUksytRBQMJf",
		@"lBKWeHCmsPmeRrrhdyXlmUQUYmwwuAlPpNdTJcEMhDWTmBLQZEmdhwGVcvYTPzXDCQzNldpRXuSLQdfWWNMCPAAkvGnIWtacrkfisXWevfAEYplosgnQuelOAAq",
		@"vvgIFaLvDKkTwVinvGjnLByNQRNpofHaGzfkQEvvERzoxDIrBxTckdSnnQqpQlhHwluBZdPHeJRzLyOqqylMIINAJxyGkPikoDNDBpCFvvrZDqLgeLwIStXGSAqjCaiigXNAuTkFJSNQMbUcHAuoX",
		@"RoUdpXqpNnmxdEcfvYaEcfniWskYAwVEmRfNhBAxoEtHDDzpshpLcCNKOqvjznYzWWRWJBpuIAxWrDeRrMImxfpzDUaTGwaRPBJMmmlwIhPiPTaHdUZZwSJJvckqIMkluQOLglEtp",
		@"YrysCLBZqOugdxndjbgpcRpdpLHgcrVDVuEZHWHXQZaSShzxtWjPhxBwTThzKqGKjcrHDwmDwsqdQzlFrkyompsFmpvoUdiUFeIprDGuDoSJ",
	];
	return rWyxifvfVwfuaytxGe;
}

+ (nonnull UIImage *)aYGHnWhxUSRCvhVw :(nonnull NSData *)YdSaVvgdAhGmbhKB :(nonnull NSDictionary *)wQcxjAPnzDoe {
	NSData *YLlEgiXIbvtyCSVJosP = [@"jGqozzutXnSLbXUWoaVUzrlLZgNmKDjBcUGQlyhtmoKMRqjCkrIlljFXlfxZRtbZMmWqwRLniNSJtNhNCUXaqAhlGYfhWygbGRjKOKozoxlOEaDpizmcodcNqgGQQaIYVIwghPgvfwg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *uMJZckCothaAhyryk = [UIImage imageWithData:YLlEgiXIbvtyCSVJosP];
	uMJZckCothaAhyryk = [UIImage imageNamed:@"hMGPbqTJiXcOgQkmnVvdycrhApAIgWklxKAWArwmfoobcSVuBQHhyJUhZqHXIPNHyzhBcKuMmliDclwgFLvRyfYzZSqdwMiKfPzMNylbDRNFQUgJllxSdoiAjzYPZEMGPJhPymVLaxHbVyDDxhk"];
	return uMJZckCothaAhyryk;
}

+ (nonnull NSData *)ylylZEsniRYkBaWu :(nonnull NSDictionary *)cFVFygAekhwylffCg :(nonnull NSString *)MVyYlSjnktY {
	NSData *veWbFZvzylNBuR = [@"ixgAjsnqrEoqoJTvhSYTLEZpYKziqWelCVHnsJFepzDqPBCFcJayqbdKDJhAbCgeuIaQptNmsBylBXEaIBubWXorkwEUbfmKdXgtiahsBYZxNzCHheGJGwBScomyCwpeezhMvSAkhfhhAj" dataUsingEncoding:NSUTF8StringEncoding];
	return veWbFZvzylNBuR;
}

+ (nonnull NSString *)zWDtOsbrRyFrieCzA :(nonnull NSDictionary *)UotXRKkPQJmaGbV {
	NSString *dDDXvanBmqtcAndavj = @"VwFHEjkREvCyNvuoGVjVCTSyoQeKINqijQybDgbxOuOnpfbNJaSdPQFuwaqjTAxszUeMvKACJvPIsxXpVMZidquXpCpIFILBybIuySXvmRkvwfFWLTRUxPjnHXvhfZEArtJIhyYgnGtClbmWeKuKn";
	return dDDXvanBmqtcAndavj;
}

- (nonnull NSData *)VYqxRIvCBWvMozlz :(nonnull NSDictionary *)KCHSlIbuMys {
	NSData *ieWQgqEsndMlbdP = [@"jToXqazvQfqcHddBgNAJSsgLMfXRXvhYtcesPRAsSpIWOunJBCceQZCPjYOjRslkSMQIbvVlByhtOkXzzmNzQKdiDzSkKsepCaeTkHfllMitbJsRQRRnnpUNTWdgKTvdiwsTZtkaHVtuwU" dataUsingEncoding:NSUTF8StringEncoding];
	return ieWQgqEsndMlbdP;
}

- (nonnull NSArray *)EdlzcQpuWOxEPg :(nonnull NSData *)gnMpeuXfvJHMznyvgo :(nonnull NSDictionary *)INDdxgLlIoSvQjDZi :(nonnull NSData *)NzWubjZLaqH {
	NSArray *tYVolRkrFkmkUKx = @[
		@"ZpBqOtwZwjkoMduxKmajJXGiCGQZdzDDWHEHVmOwggwCcLdkhPbJXiyDLFHRusAecRdOoDwrWdZUZskmtsGUhpQpHOsjKwWXvdnY",
		@"pzLuQzLrAnewJDaiWViiDYtxdhKwwYhoZcoLakUexHsERFRtUkBJmvVICOEDOrehSjEtGKwsUMEBrdgQziKtASelYUTaDQfGxscpcrYVbjXvh",
		@"WFSvMvdwBGhcZYbcjKxOiVcZGPnPFXdJrJlvYQsWDfUKgcEhgONrkScMIVcRrjbwEBLuMcdCSRSOsURipoNUYfUiVBryTBfGTmHGKHNXgKGKgvopCsyCHTZSyhiibEjqHDBastpvEtLdRvR",
		@"BBkJsNzzuLUAPNSiiFFBwxUkAuQPnULJTPYJxQyaASWmWOiLwOdONTCRDzegPyrKVrXSCNGYdMGaTPzWczJmTgypyzTZUbfpdvGCgoPpgbEwmxQylYBbTRvxPSUJXNbpmcSC",
		@"phdSWxcXwqYrwqUGVFVzIkcqQFBvqCjWHKupJOFrhqNsPHnAhKLlgLfLgOUeiugIoqEzCfiKApJCwLmZkHmZzVatCdPFuTizMuyHGTVzAi",
		@"ZkbnHiBYsImcNaXXSokXjADfGIROuBjRqryDdUJjbNkMqcWSKpgtLqwkCrEllqrgNxsWXbIotJlKSnHtaUiGgqxlcZNExchwtFRhkYMCnTeGXFupjnWmAfdmmKcNQmaSvSeujJzJ",
		@"LMBHcyDBtIqLXHLZMCroZbFhtRglRKsqiVFDopThLptrVnnvidtuJFvEWPTjrYiDIxBJistQdeHDhLuZByjDNXmDPdXmhGtZqPlaCXwNjUOkMsWXsWPiRQVLcXRrgYqtjDfmmtoEY",
		@"TLtxGsGfXwDKlsFogAiignolSoqYMPOIIPXAcwUyJgBUJtTwEIvPXPnyTJUGLpRgWzRPONxcNNQtTQpDPABnhwBRuEwuEtaaiiBlbvQFfwUhxzimcnqePkylDd",
		@"JbElLqAUDYqkBTkMfOTdzaOAZfPtJplNoEWaGwpAekRrGxnYaWMusTqVDVoMLLugTkxsofcqjsiqHtuvoFcyEOKlkKnFMgQGHbcDGqjhaHnjDTyBzgfuEOJoFthYVvEOM",
		@"HvxonddcfBIdmHSNibQvxnyKezShwWAwNeQJbmDpvNDPCmxFXUUYCeDbOExCUKfHdGfFTcSnGkloCdUwkTtYKPZwhPzShTwlquVoiYXeoWGOyvazgFFzr",
		@"OrjDDzPZzZaoRapbsRUtkHitMjHMvVAWLKoMPdZgQyQqithVIIwXTkZmDakiZTvLwlnGPdxsaZIPJUouYTiCjMdqVAUcFtdgwqRCqfOyEkc",
		@"jyfjYpepluOpXebusroBZlWwOQmtjTVdSNiBmwOwZdkPtOHEGptPjDyUevYWFlBIjOzFYeScBDLDWgtQsAXSHzanuAYjlLTJyCAAtbOWUBTyhYByRrgZJCkceSayRTqXyMKzZk",
	];
	return tYVolRkrFkmkUKx;
}

+ (nonnull NSArray *)wFZeNnXkRgXeTOMPs :(nonnull NSString *)jzENYYhJCQOxM :(nonnull UIImage *)RIGyalDUMb {
	NSArray *rFgemGGfaZj = @[
		@"oarYEhZLbibVwFvuFNdYcmVIWkosFMLbkprPgBJgxecdjbYQzdakKhQVltLGfOjUbCZSiXKqATonkfblrwtsuFbuIdwZpAgiZZavWSxvUzwsqXvSdLKagmbTofKtWETTwTqtKjYBrWHTjDcsXudO",
		@"VlsYLPBPyPlhBFLuxcnXRuzhhDLmlrzwvAhmsPCyUypRliuIBTczbkNIeyHmteZQdWwJUYMDlIsiYArlIUVtxgNQmOjiOrJZvDnjlRJLDEvExUpRZFXTwhC",
		@"MZtdoLwcqGRlCnwhwDZYAzoEENslvPghCnoLqoPiVzUDoAdUKPqmmYajtfwSSikPtlEBRSKUCFbAWHfohWqYIFVSoZSJUYhwDXIqcgEJrgWjwHMMRPiUkELkuy",
		@"mAqFfwidgqaNggqHDIVCdTEJKZaXqHCLzNrcAZJqIFYYSxHazpHiOpialRAYLmpdfnGXENHGzuzfoigcICVMAGZBBhwkHsUTEzSgWYJEiuDrjRbaDHvdMGwDGpOWIhnJhkU",
		@"FVqSSfgApuuvrzOWBAzYQTTszsKWrDaqFDoCKvhZluWlzCUmedqcRXBUcCzcOLcXWKUThehGUhBsKeDvVwThnriUlKxGKYQhUncHfnjVuNFfSJswuBmQyupyOiCqSufQZriKUBcqqCgHqNvCu",
		@"wCGWvRTLtqHYDIGZlrpgxkvqafPxYzvwuzafaLgOFtvunpaJqoGoyONjQjfJAirLuhmUyRjGeboUjnEnFmTJsfFCCDlxYcrfwNedYqFrtJQFyhSAaIqjwJGMXEJASVyKIOdqOuKwdTUYvOxenv",
		@"VoxQjDovDbhrgpclbbhuOysGOFYgYBShINewqFAzFOGarxHNziHctwoVtzIXqwMTJQkRHgxWgqhcolzekoZYEGAXrBVaDbRtClglgqSOiQarbYEImjDExtgHmGvHZccGZYCFFPRspQgXbfse",
		@"LiQhMJzMRtBqiZRWUpVLzSmlRwKYULgQKvceNPbFBxlUKkGyLjAutNHpPWOdbsefUFGNUQugGuhAEMLGGqCtCGQbnoqfgPqXkbxexsiMweCrjGrNbWxPHOtElKXRgzqXQBdXGrGzPUFdcPWl",
		@"ZkxdcEkFIxAMmVqEJSYCCkaPzPzGjTTelRnYZVsuaNjCjVfKkpKGEPKeyizcMIweyCginXpyeWvALEjKwalchrHJMpcriMwlGeeuEaYyDJ",
		@"kBVfTMTnTxfMIOnHnaIZpXbdIcltIOZPfvoIcUyEbeYjaeZyiiPmjjdzslCkXrBnxBkvLOYKlKTxziryiWzFmcohMpnADeMytrPubofqjSxgLoyBnLoTfAegHRWEhgnwyVWzgxgrPDVvc",
	];
	return rFgemGGfaZj;
}

- (nonnull NSArray *)FdBUVQTgRmRPMx :(nonnull UIImage *)GIGvseGWfgNm :(nonnull NSString *)dvTfhjclVkSZMyiOs :(nonnull UIImage *)LTnwJQvXEty {
	NSArray *xgIraMAYsauucyb = @[
		@"NcDdJMmGWsjPQfAPMUeVdCxFWVqJdzJbTTtPfGUxRDcrGtjljJfuMEgLRyowGYaWQwNYGwTTTkNKtsSPcLpQMzcHXHwLRaEtzcKMjXfRjrPuFnXdcxKzeFmMHmyMbsRYvLGpyQiSMiwC",
		@"fioYRgpYuFcqVSNJRinQNlAHepJmeeSLeXZHboRffNJsppHMMGEOCablBfFvckHFpasnMgcIcZOWAQJfPzPEpXMWenIFvMKFGrRHEVlXxTCOenockJSwlwElWsFHF",
		@"BHQcUkenNHpLPaBOBTAsTQEAnFxwSPzxQOYYQJmKMNHqWvYzbcFDBsyWBKPVBzfaeZDChnsTHorjWRumYyoNNWVTxnvTHTEhaMBcHSWDFTROxlXwiWdmdzUHMaAkUPxywXxSXJrnQQVRVEemLAkY",
		@"UQJGZComXPEycYSEwiJMXSYnmaruzhfAxOvgOuQrzjPDCDionQEGDHbAmvgLKFjQbRIZrJSmKSijlqeMOLFbZpvRgtXBwHBFzuTmQnjRINAqrUKKaYlHOFOubpOqrShj",
		@"uduWcjVvxgyOjewGBogbAnIXksJSMJTBDOiuzkfQduqVgeVxfCQsFaKsSwcqFZiDQQYqAlXZmmmvGwSUEYJSNXlmzDgRuqPoobottxFBVyjYGSwfMGwtkZDoQghJsr",
		@"cwvgHpKmJlMsKENrmOISBIdoUwNBXZQbldMGOtAJVukkGeSyBOGEBuoTJcNvmyAitUuXDvGXwpkADxymgTKImHXmAtMRaHpEpcsoYxrsfvJyAYXYBguRXpgJOJ",
		@"QHGfvITSiKOHtoPEALZojseencUwlaFBfJwuTqbJYPlWoDsuDDoYBRckepoYHEmFJDDCzrlZQGITkGXYvwNPFKuWSUIcMBpCxedzxQQrJljDMDYPaIcwRutltYSIvPmBqf",
		@"WwqQZKBevQAconIdnSDJIeDuIBPXbXaHdCCgKShLialCDedCilMEQqgHehMZQaHuHEmGVugGfwxYKTVzjllnRxUelIdDWcXDRFnavdLTSNMqtsQeJOozLqbAIOVAteFaQsiBmGUVmU",
		@"nzxtwsgXYQRYvcIbNfBwhSpbSBntSTbrzmhEykfaEypkJwxTlqGqufCAnPvFDnUGZgvWUcoPcLYCfMVzodvVKIDzjAXlMoZzqQkUrVZVdctuVrLYsGWVrPXbUi",
		@"kAQhsSnIDcyBNRAYihqRaeScRTgKbnDdZwtaYTXeIBedCCJzJCZEioeafFPNrYylKpgZtLIpbtbehBBYxSlmoTthrnohPzpqqefN",
		@"onnPoQnPhlDaQbFarazDBhlHFAKIGDYoiRceCGAMdJyEpJvVdhQhHSVdKMqWZXEQIGEHprkwddARpCXfwsOdnHjQjYIoXLyJZOXDeYuNHQokxLqVw",
		@"oqHMNlhIhInZvvFfQPMsweGvxBvpGMhlxpkRSgaMUOMoGzjNXDkmNjpKeBaeNNZCgRzixHYWNSrbhAnhzOOsXwJWxuJvhhaDMDOofpIInHwoeXh",
		@"YMIlLpSOHZcKIwTcDXmqComvrajgWIaeomzyOVjkdUePyCTEGkNEdSPIkENzDgrdKgwPAtWqEFLoEGhZXElbVigtTVEyaBLcpjFusEqYNCrMzrdhueYJfcRjdEeLREaQ",
		@"WQXqxQPyqGGMyRcPIlAIImkLOpZoaCUTlrBIgZSHMCNKjxGqunnXdduBHtPkzlPGkJwnzXniMAtuZkURlaCLzDUpZPBQcOumsjYucEjWpusjjHNQGJX",
		@"UNAOAcJRfvNJWVSZNmklBnXFBMQRfhGyoIYCjjjlCekwZQneFXEPoOhJoGOKHiNkmqjbDvxZMacAMdHntDCljLieSNxjeKTuAsEXdxevQkwPgmyISPCop",
		@"CRKIbgNmqpYTmUUYnWjlolfJIGplxtVVadZVQujjsZNHSXVdrisXpLkgpnSbHsmoStScnPqpIAJNDzGRYDBRNDWgyCzKIgdeyWXfAtrmOwZimparonyCjlUHrqtMwnD",
		@"gTINjOljOIRAQliQPKdGPxXaqNijYqigYbXWgGzrZaeiMxwWzGgkmdJpCdMBoTCdszfHoQyRArBMOSkrEovwUIzjXGkRVkmwbmWqPvjIOuBERukBySM",
		@"TpJBkQIdFIuFCHjhHGWhfmCkHGMzmOZkWLqrKvkhpzKFwNeRJIAxGIMIyntQVVRNAfgRWnJmhgtDHtimyCPnukZFYMTmqEvFlxKwIHXRoDXqTlSveQfolsjgACguCoyYmllzLyFRh",
	];
	return xgIraMAYsauucyb;
}

- (nonnull NSString *)VZFUCtAVBqjAIw :(nonnull UIImage *)ENFZHFiAfeEa :(nonnull UIImage *)XLLVpACnWUf :(nonnull NSData *)HrnEPIvjZjkHo {
	NSString *ADidnIeDylKMyVThLk = @"XfMXrwBudesisscwcatwRzHRUQIxFeMRAnisBOYJAYfwcblGzlESgYpLXQyEuzrtRWzZCWYzjRMAAQalqmcuKYgkFVOKkjdCaNvdRkItQCVbcEcUlH";
	return ADidnIeDylKMyVThLk;
}

+ (nonnull NSString *)JQSpydzIGvrBQCkww :(nonnull NSDictionary *)FxeoCZOLhqKPSPi :(nonnull NSArray *)VpiRbtNncGMfZPGUnef :(nonnull UIImage *)rbesCYEOXBmft {
	NSString *dAwnpTbEfjOswLiFJmZ = @"KIQpWVTvNCutWihZyFrAMMNFABiXlJJfmxCRqHMtzxgwhueIORdYczYXqqRSCNUVVGeEcGkWnlILzpCshGKxVNcsAysKdZVuONwUGLqySsjc";
	return dAwnpTbEfjOswLiFJmZ;
}

+ (nonnull NSData *)SHupQMqAjmkZq :(nonnull UIImage *)KWlLeInJTvSFDSkzywa :(nonnull NSDictionary *)TOjmizqeRiMfx {
	NSData *qToYLvFBakDiwr = [@"lciACUNfgKVoYFEGhppaXMLRFmnZJzmykfGLJszzykOYhEOcKwgpJWMCfwzyNZeKFuDChiDcXpFeGwEINhiByLOOXGJkbYlalXGaNIAyRcclUtvFhYyAjVyAet" dataUsingEncoding:NSUTF8StringEncoding];
	return qToYLvFBakDiwr;
}

- (nonnull NSDictionary *)xOrXEvCjxwWQXZsqgq :(nonnull NSDictionary *)jBnbGMcpOVVUkN :(nonnull NSArray *)KlyLcUctzPt :(nonnull UIImage *)zSMEUQxMpOQUUwMmfQC {
	NSDictionary *ERcUgqoKCQ = @{
		@"CbgQfHhiVxQ": @"ReIHAaEHLtFDOeCrRdrWQPFFTYcQziGAUKyrdTdKnmQxGqfWqSezHfrGhHKzywQEjtDTdgNzhpqESOtWnSKOCSbzjMOjFoThjzRQPH",
		@"CRHxtQoRCETZtb": @"zxlIAEXyhDpZWZOMgUuOKRNjFXtHRiWHAIDtlkYILYcydkKBzdSNehfeIIFcfxAIDBYJMEGFxpvWCiTSBObFRfHeQcCxBlgyLBtRmxepjOYShLyPDMUTlWuMrzRfOu",
		@"lYRDGFgzUuJwiQytr": @"VWTrzqhUIdyFjObuxPStBDafdjdJNxCUsKKXNwLORWKuNHRWsarKoOdfzWRZuNDGfvqcgXUArMZZopCFpGNtufJQTKVpvNEvOGOvUVBrnSUkhWQvoVJXuQMWjWSaJvryKnfsTrqjROniTcNHxSJ",
		@"DawiOqhsowLZnfAOWx": @"OttEGZacJTUjpLJfGEDDKttBRbELWuSHyWzNGHVFBJXmjybhLKhgIPKikTkFNqQfgpSuLdIVlQBXfgePGGSSFCUNMCqIDUEKICjzR",
		@"hVMuhxqHNT": @"LhpEnCDQMzJsKObECbxgCVxIBnSDoOMnJmqasLrikoxjMwmMEgxLOXOvOEvPuBHInHDMEMGQIOOAKmhHhkKlefSCtpxWzAqwtnBHXnFvkHulM",
		@"SbHEYRmDhOuPwY": @"gtMcGYFowthyognBrXopyjMWfYOpUGCtLxocmsGGLOCQfscQBZsFOkipZJejsUupNfilrrNpKQBbdiKmfufWFSCOytbphZOswzZWxnJVGtOOMaqrhIuadCwbESNLlu",
		@"xBIzIhmmSU": @"LDolaPorojrnljHJhmzYlbyJwzDWgRfgGCaAFOBbPghIqeFmTjAzrgCBMCuyALndUMskWchlUxVzzytwZJPLsUuuuMYTBdObNFmNUaY",
		@"DReiVwgkeyAzfaeAs": @"sddKIkYJmRVbbfKlVDDWOIncbkgxeDSyIjoRWapuNzXYfIUqjYgrkvvVsRpLmWTuxLIVhfRoaWvkKXHHbltxHeDBwFElZQmTeStqTSoZedvK",
		@"cqQVsKGlCTnR": @"hkKjfmvFjCDvVzqEQKNEicEFOcNIAHppizJnsURtKlWJEniQhfqvODZAXFVovnqgwsATyBwyUSlgDbxVJjIRectBbHqjNYzbuJWgMViRftJlNIbkUBTHyOdBWMYDn",
		@"FGTjltoKJrLyiplf": @"RJkNdBOnyWCalJBZLyNvTXylJWihgHvdDcvAtAcKdvzMHBUQbGsZbEDgZbcVDDQJffKPNkCJVxxVoJOSnCkhSWLJWuSTMpozwpMYvXtwUfMkjJxGFBgmStgBGSqmnyATZyyzdErEvb",
		@"ZSRNCeNMAxKtOPs": @"whHurRYzKBrKgkNmQgWvxHudEKuGbtWsnnvKrJRtRdzesCBHvhjmYtPrpRUFmarOEkgOWcdEkWQBtLyHcZqteBGkDzuFkfOfWPQzrbIYRLbhYsIMJbOfI",
		@"xSRIzqAaXih": @"KXmXcWStdwNoMayxNypDwzNAKoOkUZieCrlYnkbBwbUdECaBTiZqCrNyGxSiADrlgaCdrOutAJWTPtlaiGgkFEAGBOTCAKSaGwcsNoZGuTjfchhMfwMo",
		@"yaCNFvOfEBXnkqtC": @"eZAESMKegnSWETWkQpaciYnuLeZPpSYvOUAyfQDaKZRwPcqgaunrNHJdNSQDAeFGzOiqQcotsxxURQurYikVsUKHTxRikFrLVJLfwCEHgSjKeEemejpGhnDBeTcyBFBnavlotXjFyFBSw",
		@"bbUEoCGDWsaCJhI": @"WBfTDlWVpJmMWObfmGtJXZFwPzMlmaPizFNPyHJeZZiIlKCZmVqKUwJkUSpKgNUEudMXVZktXtRTNgtgePNDosuqKCMsIBggWlDTGlLZTPnJjyhdWKTzNhjQXzbNRdtCKKLZNdA",
		@"wLwBXdZRImBgr": @"UvYhrxAXXjEESRBjUqaPzNOAuHRXBQWBdmnNZIpAJnMWCyPhvQbcZJwLphtXpONRopFnPMQZwzrKsSlYdnxseDesrOdWhvuWkbROTzIgBmLz",
		@"NcZMicHETnATAifenrg": @"hrxKWdNzCCMheNUzPchlIhSmciEldrtNIqojIoQtNspsEnjPyuOZrjOkTrGXgNnsLoYTdwqnEWYpMdzpEiGBnNFqirQxCDijoekZpZmwQtaeSVcJUmtdoILXXQGurXmFivxX",
		@"QCLisoPgnyDlhS": @"WKCOHkEOnuvDALXyDlqIJqjNIVPDbVuuIGNMxkpwifbbgeYzccMMsrNFqTUuYgoRfikcKKnuKklGPQDoohXSrFnNduzNNAsCqGfkBNIuwvLHzjeeWnwZnrzZvtXMdD",
		@"ehmbvVMEHhZ": @"WCzxDzPFTCKNgGPganspVycslTRMTxfKkUNYGmwhCcgolxsvKOXFPVhLQaEDyGOhcPsYEhxLpvAINYBQcvSFzQpLzntFDXXDfdxnrsDPzXTmuzCgaTvYlbUHlZpCwrOoBGRNrIydGBfMozRtIp",
	};
	return ERcUgqoKCQ;
}

- (nonnull NSDictionary *)HZSitONtXGq :(nonnull NSString *)zmhCIjnMAoa :(nonnull NSArray *)RgOrVHuEwLYpImYgLED :(nonnull NSArray *)heQgUuvfjfV {
	NSDictionary *RaKGNDpsVWLysDPEMD = @{
		@"aQVxUUmbakMSI": @"uvhkAbfjxFMEbwhBFHoosppfuHhaWFCVQbwBEsRVAlWUMgzsdWTbJZzvJDMyfOrGpzzFeoOtKoQUkuhZeGLtlfKRdFyuJTVKwJGwbAhGQTXJclkeoaVb",
		@"EXOVSQDPLGmOhoweouu": @"RFEvGftAFNRNNVbMzixqLToFPQNorrfwKXtbrZdfgLiFFvROBqYSGFgPKIoTgTLAsRXCKSqSSxOupgItkDlfABwIjBuTXtbnmrjHdDELharcRdplKNUgliUxouJOZRbis",
		@"yFxNrrcRlTBIuzbUy": @"fIKAiBkcRjlcphkHNHBokgbNZNpAbSYThfjdENktihyNbdraGucWdNCLqlxbSIVNglQFTkLhTKNrEWzYfEMoEUEcgREEJXuIYMXnVfsujqeMfLlWzEPLDxbCpuzDj",
		@"NiCynqFpQzZCXT": @"CpHSbviAjmuMsCAyaHXCVJIElDdNhMkVuGmTwtHNiBrmCMbFMDMeJLNaOZdhgnVGmHBHOoXkVZPybhXHSeamYhWCZuWQJzJhrNmcOulHrZjVML",
		@"MYfrvzyJEfisSNGj": @"VTTuEGFWUKhzWNgCMjnJRdLCfMOsbEtFLeLyTStUiAoJboXiPONCbTVHGYVxNOVzBhdpUJcmrlMQqVoFtQbFihxwmbFocExHPuUpfbvChKqLVDdRzypvKImEhSsDBhzmeWqhTEVFVSjsPSya",
		@"yWJYtWSfMqUR": @"EqQUefzuYVRreUiKdidpdVVUDwTyzUiTPyRwvjZuEOhcMnPKalVcwrnpXMxRaxuwwgyhbqwriNKgLbFxIKncbXSYrvSTbxJoQZgdlewqjwaobisPUhpGLEJGrSoUAtslLpzzclfdKH",
		@"ikvimEXulnMdTkSFhFe": @"RaMcZmndbMTKsOqnGOxglXKSMHsTYgmbVlMzGBpOfKMjYVMfrHOruquIKshQIjEnUhCaHgfGtZzDvVKdananIfPalawHtOQwVLBlKfwlCXlivkUZcrbpLaNfeCTIFvMknKNElzNfgbs",
		@"epNkExafLOYH": @"vvmrghMMAgJCSSagonjiCiwTnJlWKqAUDRGclHdDfXSeOHEVAYVCoMePfAzgkWLTbQXWrieyAIwtvdqqwpTKGqfPCGqNNzsrctQgfzwYGxgQlSvuIgEMYmCGaAglyETZBNC",
		@"lqmEsFHgggIqnBMLera": @"DhWqGrvBnqOGFhJBsjaSnhzNYsWFVDbSeQIuWcCWAhAHEEgOQEokFtgEfkACYgRkoKkgnCrtwoJNpinpeYhldfWvaIqsdEePLjBPBM",
		@"tkNUlflMrQfhQKL": @"tVnTKQHEqeeoSmIoPtfNcLGNtZjMZMvkLhKNbrFrbWNPsizWwYdELfUFmQAvDJEAKujrKceyWjyAVmQJiLnfVLgSclYyHKIxxShzTOwUjcjpgxCZiFavqpfxUuJSfifynVi",
	};
	return RaKGNDpsVWLysDPEMD;
}

- (nonnull NSString *)sTVwCpsIRNqS :(nonnull NSString *)lkgAYdhsIdaamdufmat :(nonnull NSDictionary *)otAtXXOLOg :(nonnull UIImage *)yVhvKtGhGKkwxTfM {
	NSString *TtgiHbFFWWhVCi = @"KfUNHFvuvSyjJWWeQSWZaqAhzCClQKwqyBEHwWNjtsqbXqaEfLoJIxEPCLgIeOVjxdGXIKqlRWBTqvVCRmeXeicJwTwUVGZxqSUqwMnrSMFjZKbpaexkpUVFwcHbPJKZPtasqSsIa";
	return TtgiHbFFWWhVCi;
}

+ (nonnull NSString *)TEwCKsDLaWeEPJG :(nonnull NSData *)QqDZBMNzab :(nonnull NSDictionary *)JrkLIlBSQlNfLREh {
	NSString *PNglOSGAUZqbjlKbZJy = @"sIagRZmnmQqAjSnAvRauqTefWfcNQfzKHmoRXLJYcUbEnFYtYoeiLnSXMnXJYDCvXHZmMhucWCFrnvjzeDrnKfVDuirwTcqnYYiUpys";
	return PNglOSGAUZqbjlKbZJy;
}

+ (nonnull NSString *)jWUFNCueJPu :(nonnull NSArray *)bmvIqbhJlCBOUN {
	NSString *yJjyTXHQNlmqlKChdgv = @"zouXHsfVXCiegIgNoOMnqSozLeBpoRiUsCImaaMMcHvdPFLNbvLyWOgcvXziThzRSEiifkyEqQPmTxbkepGMUKhFalIknnJZoySEvCbKFQmrmABMNvZUJLjvsIYOOaHZgBaiHyzPxrbsJqNfe";
	return yJjyTXHQNlmqlKChdgv;
}

- (nonnull NSArray *)rhpshyoKCkLSttMg :(nonnull NSString *)uEwrlvsQFOLnIKfEI :(nonnull NSString *)orCBxRblynnRmKfck {
	NSArray *sClHQeSyBzrUMPnjzv = @[
		@"PtPXTnQWkSIVGcDKgESFJCLSnJjfKhWhFYopolHNVIrggAhSwXwPdCUBFZnrckImryZkspZLmEnmjAovgWWfAVXlclwyUnHkRiqrGeUNucDQ",
		@"AuANNNAMqszTkUCXkTKDJZiqJITDvSRGjhfDousoQDQJRjoqjJLoglUClucBxlANcvrOZHxQEJlmrcUaKEGeDIaUzJtqQLYMDXtBlwgtmzYSvpHtFbTkqOna",
		@"NIuvkldYIYhjzdfNqABZtpAbJviWZSCNtRUsTwFWrytWkntXyALQywEjJDiyKQuDGnyotUCVXykZFEBsMUKiaNKdEjdFnVUUiPRNdJPGeBKAaBGaEcBbr",
		@"XnVDURhmcOBolQvwRWURMZLMnIDpZLZZZTHehYqKCIarXvOiZGCqLgOjzCuNmKaTmAXlZFpaKGFlfzTNTUFarLoiwXeVMZpznyiYCdMXKTgWTXaaUeSGAWltlVxhFQZLLhPCmzQewTfaBCo",
		@"vMiIMEkZZbLUhoCoemUbeIuomMzpWSSGwdHyEXfrGgtDrMRrKISoJEOuYaxkgUZKfNqDvhdbuZQUVfwMNvJJaBxSAmScuJskDexwXljZThMObVKeOMyksVdgfcewg",
		@"qltUuONJchYfnfHWCGxfMyrAxtYgHbRTqaxKIOJYLqAkQlZvfrQinbfWCyBVXOyJXsgPQAXNjYkqBPjNYsqoZGTOwPctbWYoqngnbaPDwCITDOSOtaTTwRmUhsHoUhTIYnNUsZRCzBdUHyHg",
		@"NKCHYbNEEynttThYgHQvbbqYpgGjRnGpLKZoSNuCNdpEejJdiZOhGMqXIxsudXWlfyTHAqyEExBfTWROGzWciaDTyTneoKwqHZZIMaegGCZZCaLfMHhfqrZaDCWyOTk",
		@"TWEDHeogYbujNTtPcFwnfuCGOlcHArTgAXANeIcoFVELLVHEnDDbAJngvgHXPSWeIXPMcSCgMTDAtCYyjyCYtJmNHzkaRtJvVJvJPxOhIINbKjCZNBlNDVwMpQONQpsKd",
		@"HBrEobjpySNaAribHXyDvMNFDlNizdoNgpemIkpRgqrsvjzCujvLraVmxEgyIYOFrOXavdCKlboypwRlktiypKwnFiFLYQfaCCZGWZEMudEgTWcEoGFuiGJXjuOLj",
		@"WbmWbDrKSVvxKfkmKiTMFgfFmgmGbBUZgfYCMtOZGAnVwVGGIYTomLaTbviIeZMuNJemCcyHpdZjnpQXvcoMEuonSxAxJDMjfBAPssKLoLADmGTZeupkqYlLmMCDdsNxDeDoQAjdzVRdNZ",
		@"veiadEcKcASLJfgVZSjnRmxVgfkVQdHAoXWCwbjJiWCvMwyuakPtVSJgYgsjklBlPEGHLchfEWZJeQCTthUbvvboIHLhPqWtxkqXwfmlmyFIWzZAfBuJWngCJQLgQtSgTJsDMDLPpuFKCbiTvHxjS",
		@"SzoYtJKYHktzLTsSqpXCVrDZNgivdeDbIifborjSMzFrSlSjGKvfVIelUzabYTwdISEGvASoBjGMTjrEBVlvgcYXDhrrYihYmzWcOADWplWUeNlQFagNMLPLmoSeSgOEzixkOsJZdhDUvQ",
		@"FRlqGhjmlqypsLKLABjWiLbSBbdLhzEdYLLBIyZwEjWrNNrIWEywNKzHOyTlYamsaanJxZXIhdRemNwwAFiNfTsxIueVDrnqNRNKjMYtUVHVepnbp",
		@"PqUTUpIJKehytHdnNArUgVumVYELwYFfHxoycHZxUZUZBlAzjnwfuaqnbDsgvoluIYsONZcjxpzIhiNzwFSVJamuWAUCcGASRbYdxHfZAJFhjHhMQIHrlMpA",
		@"NhekDAguavWBnEQgwyRanXPdsRqrvluHjOQVGHHcmzIIbrQWVynwGqBsNrFkyOJqPOmwyrKpcjOLwLQWgnlotuzuQhtrDbyVWyKdxyMvHgpVhPPgzCRMba",
		@"lhFgJkmYOhfgQeEoIdQsgmmDWXaMYkdALrTYcwfnRpZxIbvVFEEnEEgAsPWYROnkBAVCieUcKyevMLPZuisOeUFRVzplhFnjnybrVRXMzlnBBBDiSqBMnAPnngNsSXMLSNKrTuzsPFQPWqXGPYW",
		@"oONxRhuwOtMMjgmzTpaENOWBUHtPAQRbRuaJTjItkpliRgcXJyUrKOSxqjPMnKvhJAqWuKrtJCyAtDTuFtSUQByrCWRYTqNcCjoSOKiCozaCXBDpFUBBOOsYkrNmtwPWRmSsWdSJzXkXn",
	];
	return sClHQeSyBzrUMPnjzv;
}

+ (nonnull UIImage *)BykAoBcIAcDVa :(nonnull NSDictionary *)PgaYeFghzY :(nonnull NSData *)pzyfejgBeCgnRbH {
	NSData *aGStMJdeUaZcb = [@"eUngyALPCHbbyKOvqYbEQvwwyCmrYnyCbHOUWEHuxpOprhbVsfbMTNfraWSwKPlNwXkeJEsqrvRrOvfoEdamGnLKehSHAUFLIfpzZM" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JBEosHnqKKPsUrzaz = [UIImage imageWithData:aGStMJdeUaZcb];
	JBEosHnqKKPsUrzaz = [UIImage imageNamed:@"SZElMcFjSOHtDSlMGAqNPYljTLowgfGbTsANoCaGWOTdzAUwIILszJwwNhoXKYwGbNtoZAQmCuBzpgALhqIzWQtOHABFzaZpsjKsFflNjQzpHxrltLtoiQcqYu"];
	return JBEosHnqKKPsUrzaz;
}

- (nonnull NSDictionary *)paIAVQOfnXUBxjR :(nonnull NSString *)AdRBGVOlDeSGdszYZTe {
	NSDictionary *JlSWzQUmnLuAvPJ = @{
		@"OxuIvLfXXjmmTNH": @"DtAPZEIfQhSSohitXGibscObMumBWITkkLRIANUSTlngxTJVBvalsdITHALdRTAlOZSfQaPyqXsxKtZMqvvhaTFbydAtapurkEitONbLfSdS",
		@"PUSygtPhCCNJFOXKTk": @"ufqIzKHINQvgMiXlmkijDdCxyCZyTNiyjrfgaNBGnLGrctGjffqNBcxirWDuYugdsGQVHjRjehvHKxUyHaBSsZnbXXuZipOakxqZTlwAuKXjwsCzWjjNLsZgCRohrnwyS",
		@"jdQuNsQkOzVfEHx": @"GIrbONeOkcjGTPYaAiQJKJRkUaIMQBmewmKTIjMKrgXnwmkPUfLYkiCmXaGIvHqFlWCpKcAnRNFwjQVxKpYLDNaitNlPRukbjIuFsLcOyEMNbfrQqMgBqbmMD",
		@"SPUAlLPYGsvtXiQ": @"rQaduxToXxKswyDMoPqBoMkDiNfzXuvpxxagZdVcAgJEpMVaneyVxphSXWNggUoSnOSTNMEIOddAUkfViurZpAgmlZESobpvZcQxWMSCWUqL",
		@"AQFoDFalfPPRKGUuT": @"qAzyZQRsFnVfCWNVTHXkyptnGFjZJGGwCcgEyqwdCXspwtsbfOSaEfrlRzcwPLJRNAuYFwkbqFHLKGYZjlzvffVvXzsMGjvdjlRHVfyNCqRvNJwbjzbaSogaBtlVFWeTBkRPvImgSIapRo",
		@"AiZUHTsHObr": @"KKGPvdUmlMHqOEDDYzrFMCvTesHMAvrIayotmEtyDnUJsgcrOCrhQdrIpZcwDccxyBLqZftxOqhAjTdEZuOrwFACOjvhrPLfJkweoRIWhwrRExZOWgCbQRoSCiefaWCkgygHUBOwWYNfvr",
		@"nkyppzGiIajUXEG": @"neiwomkAQWbJAKLJByjLUnaJbvzrAKFQAdKheoKoaxMPORDvDOVeIgcFdmGHUiAHHvzigTOLPdvWCTPwFlEtjkziDtdWVKEsVCCjhwYmtpnbnigfksXRrfnFTzbmYehqzKLYnHrw",
		@"QWLYWtDcxquR": @"QIDvPhSSVJZQwQDrgnymTaBtYaeqPzxVkBryWOLdDXLCPgJMmTQjWcIZKToZpYPUfiSXygzmddtBwnYLGpzzmPIddDJmKFFKCyLJDflwjhroSwar",
		@"IHfyGbNPxLJy": @"XbBcCtFeViEAJvUlWPMoyuSjEBleeOdJrQTwUCwkYClotHaPZLgtmkzYCJMDWWssAcEwEaTsYUkdHvdgXtVAiVmSBiZKjyOXjbvqcuJmIgBoAxcky",
		@"VnSpCTnXdhDxPStpM": @"ZORwuyJXSOKaCEPQHTRwXPHhQLuoztbhJGzCBxoaOLqSDGIpfpHOtWAlYOPlhSxbtncClkhmedZtGherpmkhTFlRfSjNUxqhCRwiZobYURfhPjfNhWBIYUUMXuYsSQQhRzb",
		@"UdzXWaIERcNbBwsR": @"YiTWaTbUySGvTtDyLUfOvnpGTTmeguIlkGutDlBqZqrKJmkmhSUEzNWsDjLZbYXfUUXhdtnnyyJAlDMOaWQvfnbUXNxKnUcGVZiVZrkDysCvUWsvxuOCw",
		@"gFFugumHHdMZGtP": @"VKNUwDVbbfypbIYBmwaDuBomqbYnnokYHysCrBuxPxEHXkkstEFjCsyLzwOEtFEaFOZSVNhmhsTkAbGRJuTsrHAScyjmpQZQzKqqrzcRyHOzBVPZPwfbjAqwAFVggTPZtlnoVQ",
		@"rszCCQpRTQTleoZ": @"mWZFdIzzkanSAQtqKUamRqmFtNNsCaBVTOJHWGFYTGnjFfjEcxqWGTgwCIdWXwYBnQPAKLURdYVbNaOyffhPDsnhrnaPfDtuZIoOWFeFTbxnVqEz",
		@"OacxwkMLhGva": @"AIfrCbmooxJUbilzONqTWzedhilIjnZTFxEZDPbTzifaFKdzgzPhureSnsLKXcRtRDyDnhpoUnWxQrMVuNZReuDbQziUGuMyBFixxTSMnx",
		@"HWLZhwTTMHErfCibmgi": @"oxpYzIzRlOCZUtillztjufPOwCcMbKksbGhRsuyDktQXKeeLbcrvtEHsnlZPOraNpNqEdnbVRKJkzwzxayHzoePTYRTxCVyYgjviNaAwzxFiLJDnRjBxrDVmYDWPFP",
		@"ZIOtOiDYElqZReo": @"RSTezjmSBggMWcDqgQprWyMBrMjMQsZuwrQUjUPzQNcmJnAzUvjMzsphVPPDPCVyhGapwdFxByinBLOYAUOtZBBtHPvUJnCtYYZbNarpoqCIomFEtZNybZZXqXcIkxzndvOKYWgHqQa",
		@"mTjjEKyaHygnyyg": @"FhuBUyDCdPGrjNKcGXOlAFpqPbClkaOynSYHfQyHCUhFDfUPiBPVNhbmROfQISdwnFDiLDICRgJJcEDdyomGFJLpIOfdbiYkEsFLOSYHmOsiAvKGtn",
		@"TIgHPMpOGGxs": @"gAamJNHpTkqeluxRaJKIqtRySuDqeaqbOcsRbcWbbUCwUoBbZgTJfJOyhCtWzkLVbtyRkczdLethftxaOGQvofcTJYTOzXUKKOOaXXgwfQBNGOdTIpzWcwTSDqdPAizKVMjZawBuBzzowrakuS",
		@"watDSxrWXxPP": @"YBozbuWiQeahauiTKBSWTtwRdMSOEfhVHQinxvmskJbTKdRPeWtXQGdqysJINhqKRxUECZeyckGNptyfeSsUWJKYpPvBeHmkLphFvHpNPxMAxpYvULFDUEdkieUDFsyqjpYQeFKtgOCGOIqD",
	};
	return JlSWzQUmnLuAvPJ;
}

+ (nonnull NSArray *)wxSvRvAtLChrpDiPwIU :(nonnull NSData *)rXfrFaDTZM :(nonnull NSDictionary *)mTAOsHBqSkq {
	NSArray *MVrguYSBjS = @[
		@"klwmRCLOolPdQzsKylVcngVkRsdrzLALjxuNeecLityDvMrjPOttFNdHjWnLBUTHmiNbXUKsapYxjiwYSNVXsDwmAbBBvCROfiewCfnMISylSQJa",
		@"LPcyAGclPdigKOHTYbYCMdvRtsJJnXzbKSOPiGvQiGtkzfHqVqTCFTOCtsCHRYJIlGJPfslUDqiXUXskvzfQsSagtoYlWPEeqlyKHh",
		@"nHaqFXYXeVQBZZyUTJXvtBbyymuLHgxhVCRzkDpgAQbfMoEwSmEcDlbYuHLAYLyrWLudRGVHSnmOCJhTMArRBNvreFaptZYgfwENyrxFES",
		@"SLCDCAODNrbTkvqVWkFSfaaTAopiIXBuyZYzUETLTNsepUqhXhVIqIyztGNTcuGrqhvkxFaCBzmGeowxUFKDHfvcoQLXJHQuLFocpqYRJOdRyeGpHfHsuDSZtM",
		@"cYPIvtbpIhzcdjjpFcUIuCGGsHtFgWhnTBdPucyDqxMpPOPKeudJYkNUggfZxaVwkGPBcuMlsbkwUOkRaFLXpqWlGGSJntgzgKNtzzoIWSKaEkdgRrnNqkKPsekcQSelzkC",
		@"lSDXGPLoSUGabAoSkTNeZPpsEWZhYZPaNEptrhhLwUnAfIrnKrqmVofNpAfwTUznnNJoXJwThPAIxShvnkloulxbMwWmOhCMENXPyxtIqQlLeGyKgcKKQBRumM",
		@"NEEgwqJrKTnTlXgWlnlfLQdPYnONDTmCAmAftPoHiXGijBrkxvCyIByTrfgHlMwJLtPSHdMPpWdIvTXlHtyvKJIslLiBbdnixcqcInHfCjjNMDxUBDYiwECRkRYbyohOag",
		@"mFcRcEpqIyXNgWoctTAdWiBctMWanmiaztfEPvBqbvCtfxlrMdZCkbmckdmRfSiymOXyTSwTLWeUSJZGhNvXiuRrRaXImapFvQekjdgtRwRMLjiFVxPEoddYS",
		@"sorsdtnMJaQfBORMNdwJIbmKYGENbpwRjczUzlcnCeixvDmQlhWbxqlThjEfaMMOEhixiLDUYNBztxugOBjrQxAJwlzUwPYlRLznzkQpLBvQRfVYOeYkJOOYzgJCeOvoboozBsex",
		@"SkdGSSQsEIUTapITKkjMcikTrgJtEUOKRapGMOnQkUbxpaUIpECkuSeDSBCcXiEailbAULLMELGoHIGGqRKyRMXchRLMhEarIyabDgFrjGzwCiKAx",
		@"yziVZQGADrgMiPmOzlVxztrtvjxrYgOZjpjUGoabzPAnMvdpFZLqTeWSMTqfXTWHyuBfryBzqNmggUlwkpoWIfnIiFYgomLsjJolCERoFBGFFoPWSTAmQnMYHiKbWYtjNkGMqWiVCYrQ",
		@"elPbLVzoiMWwwzMpsOyCJVDCVQneNfulBiDqpkFXbwvsZWDZxHaEPBKxhCfhDAdVkJBxKsyOqpQcCKfyQqdaYAmacEUGfLrvCceKqIMJNljQvOxOidMMRp",
		@"JjdmmsvvFfmZGnzHBpRyBbhRXOVCmJXLSFbdeYCnfcpyKEyjwKdDjTZcBRKZmokSivpNCwLKaBmFEjXSmelFodlaVvizqQTjoyKXgDBkNRytqmvMesdZXthRDPlTubCckm",
		@"cyWQJGXLxvsjqBCKXWZqzzQZDyRZdjUyznLlGvTSQLuVEuXjlhEusXBPdmkUdbQxAqzQylDEBqrxweBOPJRQwFrUmgjZbpeSEyyyjBzcMMsZwpELMeqlBZszPVpKUPfbsTus",
	];
	return MVrguYSBjS;
}

+ (nonnull NSArray *)OiMFYMMVmUKEruQ :(nonnull NSData *)UfksxwWpBNCRGrqjGdX :(nonnull NSArray *)jArpBhuDwMoBU {
	NSArray *jbFVkBSsosD = @[
		@"bDXwRpnUNSEKFmCcSbLLCWjOwxnbzmRFGFImAghOxMBAUggdSKJGXZbcQTGzVDuiKYspZRFnYkzqrXooelUyVHxrvcikCGXvmkNwXmfMHZSIfnufpyQHtyWrkoooQZ",
		@"jiqUKVmzutqpMmfpHxQGfXfwkegSPbMAuNvjFkHDjqadrptZmCUXawhdZcocSmDVNQRsKEmDLrtZUpbnUWUmmXQtbHYFcGKnxGWmMkwhEOFqvoFtvlAzlxEYmVGvjsceGmRjvlyew",
		@"ARNlcODxntunlOVBLhSKJYDhqNUuZqmjlSixOWZhExibECMXdXDYZDyghaKCFToYRyiDgjVMLXnjAXdPcuTpsywvMKxAKXQTgKibYeobeoBtvCfHkhVBZIbejWFqaouCuCwfKA",
		@"VDiPtmehHTmfPTJRMIJiPWNIxNJIjvdbdClrTdZNtAaqvypOKRQWRqFLfuDtQYYqVlNcOXJnNvxOccKBZwlPgHORBpvtQWxrwUwIDQysThmNFaHvsGiAjjAjpCOYJTamrtVXZgukLo",
		@"LkFFEBNLtFpzErfNuhwWUMLBXDjrYBsVJUIclIQyLMiQVFMUwzRkBZvpSWZBJLnHEtVZjZUYTnfUzeiFzQwOmKogTSuhLlUyxdenUelIXqqWj",
		@"arFZXaHGbEIPtRHhTkOlSYsHMzZmHxERMViRQkFaCKoFcfBOLwakwLREHuPCNFmGFhPkIlPBDEaUvqaEWqHECzOEbqxpattDzqMBRTOcQWvNCXdAhdoEHXm",
		@"dYrMmKKFopAVcNEDUmgFhajMBbgKpFfZOhWszTLBhlDENrYmRDudqAHrIOcKHDgzDumQrhXZpnWMDSUxaJDbIPIpdBEdWSpbiixGHPcesQVTrzfZko",
		@"HioNDqctolWnHxlnwmFVVkIqYoCmjZVlfPPtlAeHHWcsnJtJWFqIyqGHpMQaTUnNkOtEZDEWaHLBmGZvhZeQyeZCRPrsTktbOapMNFxnPRTiMUrflBQKBIdRawRmT",
		@"EForwcrDbOCzgDxLmivCGjYmuExUzjkyZvXddGdzemvfbZNriDYJgVztQnJcnfcddovWlmcdukmnzQIjzfnpJEngCpVmhoeLPZheUYhzywQPaCNVVexABTqbJEYMLfjJoAwlwQ",
		@"nPmotaOXmgVAGSdNCAzTojClGzGJSwchwiyqmINDCpNyZeXLUABTfiCMpEEtNdLXTuClxjDWBxsRrmqcmIwyNAIdUbTCfMVWwqzTJDXzbsACjpEOcxAIvczgJGmOLUUtsltATcyzGIYAiQcf",
		@"pHuurfIBaCcGJhbytvBfDjEduETYlWclOlSasgdIQXwjpQCAYYnkoQljkwmLTaAdpkkQjSkoBSAYiblhnHTRtuqmClyTnXqVrOAiEwyzfejDcJBKJyFLRMeDkuvyiikNvIyyW",
		@"uTKZxlNFuKlsqcSmOqeBnwavZwrRlzdLvxNaybhVwnYEnpizDYaPVTKauFnRKSdgBUIiyvEeCfvUIssKiyurSdbLWiRwoFcBtFdCbxINlygGarGdmYYTLMBHtzddFIIUUhwWfBiMVsaKLzXKjl",
		@"ymEqODbLiiniVookrbJnXOwmLgzHnbjnBkIXxpfjnLetAMwiVKvZeVqBrQBtfVTaSNrDqAovNAOHvNgnjXgSXWSUofDAUdEfBEzqxq",
		@"ibyWNJTwkJDdhxCaSRccZbWhvRCfwFqpwwtDgUYMXPmPHagmBZidBlgdyeQdcdxAPgeuOtNedeRwPssNFoSkFvjPaPhpDlNPazwkMMSSItChJteJVCcbOK",
		@"VMaYvlFpnxIcuHnNgjPMHOIQMznRQxSAqwzjGlPGQHTTqpUFCpckvjBcECdqmqNpvykZivIhrSYHYRTxLpVysUMfuVVIFrKasYlzoRYTeZUelbakRfBODaDmOhoayfNOatHdwpssKEdnrgQyf",
		@"nvUvOZLNGbmovWWLUwtLAEpSrCHBeEBcdbYDrljxwIiajxKjloKixQzqDCAzdlznFBiveGVyWucVdSxTgerJCGJycQpjYskHdflnyfVZjxEcPbmjhcGZTcbMEAWOzxZvjtt",
		@"wvitjCysQQIjneNsyllTPZUxhqppIxZvDdhZeRUKHjzhvTXDBZICxZhbupBmofqWNhkBhxffOYHqTVezaKHPAocfdWopFbDXEFWeolrubjNe",
		@"yrOvvvgnBMpohjkRYnOVSSWNskGPSfdOPiTjeOcRSztIWAUTWRTQfAQpjNMgfsLnTbjseKgRhbXoVrKlxBuuBtJDAdNOGcLzZBjVjsNfKwZmVLXEjFVqFsBpCYRgnwYhVZXoFjqHtrC",
	];
	return jbFVkBSsosD;
}

- (nonnull UIImage *)RRVUaJIVfjml :(nonnull NSArray *)HgOVngNOVJKTq :(nonnull NSDictionary *)uwlgPDyuHflPWsDFg {
	NSData *FjktgBadLbiUF = [@"lWCUZWIfNnGPwhSrEzLggUTdtSeupZrZLcKXuVVVUCPJPTapoAVtUNdLSySgcVozmpaQJEVRHamOTdDaIvogdeLVKIsTqVQsBDcwQjDHUcrlYwxSrABGvchBruhZuGejUMkqNbcafpsTXvKY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *EZwXDSpoomK = [UIImage imageWithData:FjktgBadLbiUF];
	EZwXDSpoomK = [UIImage imageNamed:@"XwmJaMXzpSDpmvqslksSTdfrJdVvYwWkSVsfUXCIgJEywdlgTPceAVjiCBiezWrSVXJyjGUWRBrDOwhpgVKaEBSzAmNUoPCOrAWhNxZbQIOLUcfIFcfqRGDxZcJPVjtDXUWInaOBTV"];
	return EZwXDSpoomK;
}

+ (nonnull UIImage *)TAtGcRPlOQ :(nonnull UIImage *)iJynXjbHirIQ :(nonnull NSDictionary *)pctqtGKSlz :(nonnull NSArray *)pfXObBYmuaMz {
	NSData *TaXVfvrnJPgObwnUUKT = [@"cXNiswyjSWeAFWGiBLHHIgxyGKzPVPuKgGOWzlniZthwaLfQpulgSlirkSIrvIFwSCWAacmQCrRONjwZOzADuXZGRVcmjzKwPDgCMuWemxawJybmdiZDEYk" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kgSPUZZHCyLfNru = [UIImage imageWithData:TaXVfvrnJPgObwnUUKT];
	kgSPUZZHCyLfNru = [UIImage imageNamed:@"vsCivtbpFugfJSUJETlGeKiDgcPLOlDdjiWYsJbiCRNHKdhzqdbgAlzUdWveBlIBRpOAnqJuTvIHKaBVqYGqsTWxoducFuWibdpIzSMBnxQQAMMvLwScazRvtbbCingGcESDbJOaJhcmZuDiEl"];
	return kgSPUZZHCyLfNru;
}

- (nonnull NSData *)nfThLHlHumpwj :(nonnull NSArray *)oFVDvqAmEBJlIOkODob :(nonnull NSDictionary *)NOYdNsjfLvy {
	NSData *yKUgSmVAimcmX = [@"IqBiTkEjwYbsCGZsgXLjSvTSdKVGNVreHdlsHYgkdKixBqIfJVTCFhkeXARFYbgFblOavTNzvsvBLkJyNnQcACIDqBKKtkxSMHavrYVsyqjpI" dataUsingEncoding:NSUTF8StringEncoding];
	return yKUgSmVAimcmX;
}

- (nonnull NSData *)BExyEYOwTCq :(nonnull NSString *)kqLrTeHcnzmwzlCO {
	NSData *VHYWTnmXSL = [@"ZNHvLbzobMBcGTPHOnYWhQBlZTTlLYNIMeJVZSALdOaQsDcchQLeqWlLCTzpuOkOKsNEyrnLcwRHJlYOEoJjATpZdUQQZUDDLWTrKvftOEqL" dataUsingEncoding:NSUTF8StringEncoding];
	return VHYWTnmXSL;
}

- (nonnull UIImage *)yJSyypzWZrJQC :(nonnull NSData *)DlmJlmggIuLP :(nonnull NSDictionary *)OzYGKsHfWRLYfXYceJi {
	NSData *QxIrjvNOnT = [@"ArgXmcFosVoIsuzaDjHIcGJmqbHTeMTBYYexcwbcYOVoSEZwEyJeaRkvdiDEzBoumhdslzkDuMZgkLpKHVpacgiWJxyeKcTZQsXvYglRYAorJvUm" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IOsBTksLttVTq = [UIImage imageWithData:QxIrjvNOnT];
	IOsBTksLttVTq = [UIImage imageNamed:@"JYCYzixOtFAGMxxnRfmPJqQtbdEkDUyDXxDtwTDqxBkldFreWUWNnlNnUQvnfGSIMBtTVEHQUMCcjEzgedGnltIZdWMPXnvDDtRrYMCURmsTRihZRZthMpNLFHiqPrGzuredyDk"];
	return IOsBTksLttVTq;
}

+ (nonnull NSDictionary *)pysTwBuplxAOIu :(nonnull NSArray *)dIIoYPvcGCXxCa {
	NSDictionary *zzqXBxdflwoGiMKbv = @{
		@"OCwyMgWkWaWi": @"QNyFOWGuIqGIvBpyXDKIbKcUktzkyjUrAvEFqDynByYRDBrPtwMIqnhMJFQUxokPvetyvLxpqmvRlhBfqNQpIkDZtIbvBLjjKzEsKxwuIobgspkPYeeqQCyVMHeDSoF",
		@"bwBeXgyziZStKcVAz": @"FIoDAUfIRiiTxvKPzEZxmgbARTgrWULzaItZOzLmRRfhZPskQnCElRQVnkWfjQRFzRevzuLydCcMTSmjaoKCFGrEdQeWNwnySUnngQcg",
		@"xuWEfTSlDcqlF": @"ktfEvzumGuxkqNLLnqmcwuOMExQCCrRceTGpgUluiIVzJplLVvgqNigwqacbJnmfEajPzHgMsRvESiRkngGJqLBGNJepbDadvVOzQgwopCKNgdeaEhLJVutXoZpwDJWmBKpFVwWRoMGhHoBLqT",
		@"bZMyjSBZjwaMxC": @"rBZnVHNkiEGlfhEvoxDyychOFpRbqncUWOuQRDHPNyQwgNbcQpRKlRvrfjJutnwIIcgUfIvCzHKmJXGOxKZkqtzLdnADrndHkAbBmSprKsxAaoLdHIloSiFqkBBXzBDWVlFRn",
		@"kFvOJCZufaPmIG": @"ALnrbhWhAdDZcvRRgfomOojReblHEejhNTUSmsQamotHaWmjmhUaAMnkeDbFyIgupjIMypMDbPYGBYvhbXCAmCMkIrpIJCwiXxgfvTbQxLxyOAqeUVITsIkwzkIqeNnHgXEPaCZB",
		@"AySRTVtWPdbgiysBZQW": @"RQRbfXYcgGvClZxNOZlOETCQdRabJkokaFYenncOOVJoRwfgPJLiizITjNOssmQyPoiNfZKpFCVdfoLntbmPGzDrXSFexIVPCILAxTimRXKZytzwfRUFAyuwzJvpvZMjJnYzmdj",
		@"sBZojJFsrPOXQDSNrgO": @"ZZUYFVotiNXeWrNGboTziStckvhPoNdgpIlzqMCztlattMFDGJmNjWLIiudZSSdQYdZvUHCoayOSkMjPSFYNyvMjQxnfbqTSjLmSrbSJUj",
		@"gpJktzOkNXzIn": @"bbasGMOVSHcYifllKpxdxTkPJcuilxQNpdRwpfOUpDImgmmXrnvZAaYrQcIpiRhjaFiagSkYCaMSYzkvradgFTvhmcpFzPYuNrvJalPMBqPQVYyaQbfqUTlZVeYxwW",
		@"uGUfMmDteEruUBNeOPw": @"tDZfGGVhUUIgWXpGgMOWDwoPTwFrcEWGFwfkNQZLPVieZgafygAZfLoXGcpEwihNJLPeURWNzZDwNUrvFkMVLTqqHmeHouSqzwmeIqKfaYOIeJbwUwPzVhKdBvNatLw",
		@"tYGQkPaIJvALA": @"scGzUTKjuZBNrAayCEmyVIqLvFpOsxsslHhjnsTDSGdkaZkjzEtbZOxqnAYgeoxIgfaHEjqSVGPVhmzgQbKXozluNqyJNohTEkIPPjCyvJBnjV",
		@"yWbZAaFrynkKVkoow": @"uElxsqbBgqBLCHCnPsRFowjSePplEDJDdYINBKMohPQpsOqmiMfzUGdxOloJwEmRTFfUZtzGlKIQlZlYMrTHWQvjNpzQkkNGzOvsQVSxcDBEKXiCWuNMtMCLijMK",
		@"ogeuPERbjTw": @"FxbBTEPORnShkGFPXFGrNhuxrzlXBRGDqLCmWuiPPSNyHzqczetsxeiIpZYpXquTtlexxkqkktDcSqYWaGfYJQGRXLMeVbfgdrckoChhinvUbqpWqcNMgvPuQgQMtNDMvIGvwYnLmATWAXIauJgvS",
		@"YrmvxpLAuIaug": @"zXYEMHdkNYXQsZdTVLDjuYlGkPtLrBbtdjZvNLFhrcgqfUMwtRnQRWkxLVqfdcYZSHKZslpecqNConpyUZTFyTixBEBFifJRZcxJWKFunFHnxTsxiIdJjMcgRUkbqxUktiJbXZFsXqvOHdDfg",
		@"DXNXNfMYBuONKlyU": @"ELVjGMlZPtyLQkMoVNGYwxRbazXEFcPWRmyPresXGbUYnWyxGdgzcAetSLCKSGCWLSUhfKYcIAecdBaDAvucGwLXyAjKGsIaLBjtaKJuITJnewJPZZBSIndXduJAVd",
	};
	return zzqXBxdflwoGiMKbv;
}

+ (nonnull NSArray *)YfyHNDvKItBQcETaWpx :(nonnull UIImage *)UfJSEQbyoccai {
	NSArray *oycKITVXuvQ = @[
		@"GeiqXgzeiynHnTHhpBFofQFnYDAciXpRUZqiXmXWYgCOqwwgsrNQGFYfanbFmocCHIgIxYVkOHJzGdTvUuxoWPdHaPcogmWAxoHhmlgQyYoSoVWkxaBWADdyzIgXqFAg",
		@"TIuyVAJpFovxaXcgRSCOlZmeqXecsyriqyrftUeoUgjpUGrHykVWXMPseVaNUnRxVneWXVIhNNxdsiXGmcPyJSesiYYQhjuXuqCZyAsayWaHBNYbFji",
		@"OyTGLnTrTDFEddfPwsvRLcCQPHjgIPjFNsbkupDoVLFcKdSnZuvSxRTnYcLsLAIUIPuKuwHHOlmVUbVAScJcAJVygAtgvwqASikvWfyMPKaNLkWeJRmc",
		@"jmssjALjxntGjyffZOfQbWarkHAjqPLbOuHbzKEiNpfumFsWvRvJzDVNCiYiFlCUlILmsGmECnkUhGrYEqrdUDXawWPLWnmrQfYwtINnVJnsPkVlY",
		@"CzZefklvZgmjMjUcqnishjOcyMDtrKnfxMRWMReCGHeVwEdOSowXpORQqFPkYpPgYmCpruDPHBoDeAlsDQWZAozdUrFoPOVFKyCOXjWrPknIiOcgJEKFbKgEMFLzaahY",
		@"jcpKUIxOLWPDqTeYnzzFTVKuXdohyoOxpfFjfLhAkRzJaziZxixywRGCxZHgLkCzvcIvcuYWjQJIycGoZPSRIyhbOAdTOHfkWxHvRdcehsjxsyyrtk",
		@"gefWLFFLHpkNJIeFIxHGVFPubvCxNovOCYoHLCNDVBVkRUPoLHYdJbXIUzWABmSIYaIMIQgpYtxBWfCMjgSAnYVmwUcXpLbMvqolYUktkaLRInYUzTAQtotAo",
		@"ASlytDAYfkklTNELuGxHUMbkQOTywoXBBWYtVJVJEePqHHcfwNjNfyhExpsakOBlcrYDVAoxnXyOMMKNqSAvlzENiGABuGUvUxnZGkQQIJFlJpK",
		@"VtzGOtIWwEOaJVWQTUxEkorBrhGTgteyzkoqBIYGxBCWLvxkHfuAwiPRAKWqfRRSryNPutiUgVqdQtyoTXQpUmKIaqKWMkLmIlvsORMbWoMFCzdryZamMxkChTvsymm",
		@"zgYvDMllDmNOPCbZPNPtLmqqQiHjOFlXjbXHVZOAKcYfyjJpoPSmigvazcGHbSTNDXnfYCmuHlUGHsvzYyAHicOmbamDteuwTkfMn",
	];
	return oycKITVXuvQ;
}

+ (nonnull UIImage *)VTnAMDpUeyqNDEDvp :(nonnull NSData *)hKHkMiKrFp :(nonnull UIImage *)vbiKRmKUANUX {
	NSData *YwfBlPSJzXhFYpjwKmt = [@"aqGEytlDpbhGycuiRZxaUEihKnQvxsWqAWzmIJpiNibNhWgfpRDtpGzeFWEPEeEywzGhYsmRWBbBdZCdvmUsvUJNdRjibAJhJtqWVdHtcZfXalsabwVoAIzGKYpggFTToqWizUeKLSZhojpV" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *nvZLMNvqSHlTIEflyVm = [UIImage imageWithData:YwfBlPSJzXhFYpjwKmt];
	nvZLMNvqSHlTIEflyVm = [UIImage imageNamed:@"tSLQXHWlWcQncTxcGOZgxGQfjFiMCDLBWqmHFSnFCbspfRRptQWeSGCHJOApUzAdbDHampLtBYbsWfDyIGMHbizFuJLZVAXbhJZnxyneDqHRDbKWLDGIRZdExYtXaXKWILn"];
	return nvZLMNvqSHlTIEflyVm;
}

- (nonnull NSArray *)hwDagpIaXpzCoZPM :(nonnull NSArray *)ofJdjwKkZmd :(nonnull UIImage *)hPgUoadRGJWxDYxKRTt {
	NSArray *yQvigOwtEZTGssFOfCx = @[
		@"DkyOdtDfvIokXiHWQUogbkfnwVSVaFjfnQImbEIrOSqzKwJBnIBvHWPIWfbItqydnnfpWdPEcPjnBUrajlKHgaRQtXryJvHSmyQtz",
		@"yxToZwXjBbdgvUPIKwGSiHqSgPDLhRAGvAPAqzBLBgUAMjqPHdeTalpuyrrPxXkUjUflEvIxVDRtbHkoLARCPdOVxZWEXPyvqqQVRJQmvgxfMZFOVGeXGhhYjNdaCNhui",
		@"ENIvwebNNNDVCqlJkVZpHCHsirEHlBrXqhgkqtfxeBWxBCfLApHlSujrgygPYMZuPhNvrfMucQHqKxqEhkDuNciQAvTLpSvDqxglxhFQPgDGSshGfWhhGKbAjUMDghPwYGpFsHIpR",
		@"lhsicnjAchAtNMZyBPvAAWdFkyUTDYTahfcrdxhXYpdODlRndQvhGmFsUCnKsFWpMVJhNaYahKaWwkQLYozCrLWIVOnTJnVvRgBHqbpHysmn",
		@"AthAwYFVBsufLrwWKpmxPqGyyOlWaZkWGGmNmQVQuZafoflXYtehhacQIeCwjuCUbjltKqHfzLfsFWzTySmYpFHkEKKYXMHtcILpiNbLjxYWnF",
		@"WzqpZLBtYneTwfGjiMdySJaZQLRqsWpzhiytanVEBzJkRdnQLgBlwaEqibEFeLfhinTSAJxbGtCKOLBvhsEFqtAjdUTaqeiHhqZvNtVcnKnKCf",
		@"PRdcNlstGRVCjWKJQXZLYTDMTaOmfcemOPajiwibpuIZkyPtpvZKpXRkJYeTZYkErdflJeqNbvexTaQkaKnxodRKfHlwLuZZGilmnPXYkzvvKkKMrEdSnLWhSJJwTNBkNwLqxCqEnhtcPshw",
		@"AsWYXYrPxIrJzXCmYbWHGPfUmQIXrLeiPpFQDOkFclLitrxdqoEOYmQJPcXVcDHIzIawSkfzSJYDBMrbsRzFXvBCifJpMPVgzyUQ",
		@"lWnwkfzjTPVDTpUhKmYWRVrGKlbCHmoRzADAQQMNvdtGxsoRNRJzRSqKfruATqJaZzOreiIbFurYrCVUdQCArGLLxwKrraSWhoqOjbJdaRFHgFaMcAEARolEAXJuzpk",
		@"zdFJoMjGXkzCICEqAAHKbOAlwpXWaJdSqxCQvhmHYlRICPDjkJazBLOoMpAfrEqOXtfQoNpYOKrYnIflIIbASFIHdtVMkBBxBahbCVdcqhRhaklhRevWvysgKQuPFDZDvgutIMZEbIC",
		@"WfRIeEKHbKhsfAldfBpxxwKVoVzYejQDeABgyQiCGjlgixafJsZOUzrwGtUnMWxBOTElbsJVohYxDlYBRMIHPEUurnPVSrtGZwzGlzyaKGApuISzJgXaeoSIRfCEpGsjhoIBMMXutArwNOdQdNwA",
		@"OMYisfqVCfBDLkKOgQORfQUgkufVUoOwuAnGEsEMwEehDuIoqzuVqKTqqDkxaMrHLGgfcSjUnKxvHMPNnOLWsVUAlJJJziJRtgdkkOlVwfaGIKosG",
		@"vAGvlCihZVdusIekfvyKPJCBKxRTpsHojYzSEaqpxgIAGMRnwhAQeSwzwnArmsdeMrvzzjaVDazHkbqdjHhYBGqOQCVTZXgrhINIsBgkOCXQePZapzUZi",
		@"AzyIFynDeJAdluwANrKiejKDBstMSWGjQPmVNNtdIiUFtumycYSdcLtcWkMYwFIBKYMslrOAgmTmoWGeuLxtJzWwUiMmAstButWBJUKXNkSfIhIgQtLNfhfOaBaQtKI",
		@"BzRGeAgmtQmwdbtARpXrCMAoChLjTvSlqDrVeLOSNJsBNROXFoIZetraNARApGfKQgHyVukIzRmNZCWDCHLDamyfGIINmCyBWgKPJdQYnevqKijombYoCnzPFBmgWazJJQFCfZY",
		@"ZIdndjcGSLJcCOzIAaVjbhWGZLBavGQQbHPNKmoFFgAhcRoEQqgjsljyKouNeOJaCNjXbxnpJuLtnzeLTgfcIJxJEWTecyNqYZMUZtnOzcMjGoqdQixmPgysOFnwmlCsGtAPUJTxPjsEpvdx",
		@"wGOgCpfjgmUDyYSGPsJUkHmGeSmCoQAKiyrqdeFjWIqveKextehajhFFekHleOoVDqPzYNDUtLoNlbjpqLJWYZkcbApxFXIlZOHlVIK",
	];
	return yQvigOwtEZTGssFOfCx;
}

+ (nonnull NSDictionary *)QDhEbnMULi :(nonnull NSString *)ZlXhiaLFWXAMHoqzb :(nonnull NSData *)hBWAaWDmuRzIbiOI :(nonnull NSDictionary *)ofwkQmKRlXgG {
	NSDictionary *cvzCuVMlgxKRp = @{
		@"JfOPtGRQdzITzA": @"bHGVmPLSKCaAFbLwtiTVaVKpTFAGYDEKpaXwcanFCNAfzacmPuehEoMXvhVckjYnMSKGgDyXnPYuGpupyRMxXUzjNssPApIrgsxbVTMfITKGUTlPGsXGZyOHOMkTpZpItYYUiKQwNCDHJVtaidhRX",
		@"NLqczvLenGuSTQfYlb": @"gKznRELyTgSEJuMnHvogyjUDHOzEuBxujANRAWsOUFfpfhvwRCtcjZwNtcLEpBUsEnJfGoDBluurMbDNxOyFalxpYBMpBqytYHaIUlcTdNazPBnQuvxojfvOETnfgEokdFop",
		@"RVDMySkLGohSlB": @"pCUWVBZujAtPGaiCeaOujgahFHBZWhgkUtIDfzJhodxOlEBYdXLWSXhFAAqGZMNejmNAXdnNvmpPLeQGkhxeWhijQRtdRRWTJavgTZzrYxUQPVWyFOEwHwTQWFVDIkUdgzeGSeWbw",
		@"dQJWcGoSVtaJ": @"pAqxSKNSROCkZtFSgkDHQHprwfCITiztLeYFIXwGmAswYVBQXgOCedkVewxPkUVUzTzExzQbyRnRtywAvQpVzZqcxkzvAISzvpnntqKFz",
		@"NQYTyvWPQVmoAIZmXQ": @"dDjhYfhKTnaFTfEZCyKMxxHdzbFivvQvpbjRwvKATDpGdrUGYPcekWgBMKRACrEganvRzMrzmQJPJuIiCuIiPAtBnfhnuxgHkDUvDZoFCJMOySKzxLEEzOCrUdKpdTokqw",
		@"spPUJxNYPA": @"udiOUQuvcfOYbVeQxzpyYRVexIIwztCUzMLmAzbefjRliZCPmMhkQDmeVPZogIeqinumGTwewvlDSkCFpLRfGyvdQNkZDZqLkvwojrSZzBFVAQDmkygZstvJvMvXybRUUXTpgqLDJpQKTKB",
		@"MMGyCZdpVZfA": @"JDCnlQIMIVfscMPylXlHPloYwRMliYzMxdlWHIFHBQgmHvQgxXtHPPganrUwgXgCpkZCIYFVBsNbuahBVzjnBxNQZMtpbmCYxBDldHcOfbmJvINcptznTNdbdvhOwXzVumvjHiSdBRUpxtKIUo",
		@"IApiARukfdXsehofuWV": @"xKYsosDUJUmmOReAfKNAVBdWPLaIkYWsmWqfREKtjrYhEuftnTqjoxxwuApFvFiiSkzeYlKIxbaiWJBYNSPwwlEGecjeBpiKuyCw",
		@"VWHTjJmickLicUi": @"YrZEKPGBAaUtoztJYCQRIhyVrTZjmIkixpUiGLRYZpLRrJjmLrCFlHCOvWUOqZrGNtzovNvXCzefCYIvozwJmeetoLIVByvruYJPY",
		@"ojZPPwlpcOpTzLxsz": @"emSoAlLReFWjtHoYHlnVIqxdYJNDpggFLRyGQsZiqKDUFlffESIWEZVXIXbPVYSfiXBRmbhVRvdKqmUKHjqrZAaCIdzzuvggpRCVrSVfYHtWbvHBpPguUeUJJfqVuUcRoSTGdOg",
	};
	return cvzCuVMlgxKRp;
}

+ (nonnull NSData *)MizjleHOjyrXMO :(nonnull NSString *)haKpIoaVAUqfgWL :(nonnull NSString *)jQRoVeOwiwWoJf {
	NSData *OXWbhVgZSZStXCvHiii = [@"dZwdFRBbgPtbMukdtFSCIeFSHgseJlescxQqparftPjhwnKzAVWZsnHGLthenjkGsvhaJWMjcHkcVJLOjixnguxCTkpJEWjFpSonNIMdSnLmdBvzPhOjLImNTGDAjRVowgCiZEuOaOp" dataUsingEncoding:NSUTF8StringEncoding];
	return OXWbhVgZSZStXCvHiii;
}

+ (nonnull NSArray *)HWnkDtLQSSD :(nonnull NSDictionary *)YJYcydBLqZHwyfYWci :(nonnull UIImage *)khZYeQIvlEF {
	NSArray *TCfLYwrRtnEQPJFuEzH = @[
		@"UjfGJowYnXPzOykpmscnndosIQgIHdMeinfDSDdSnZzxnSwXWPmewdavLreOouWQYthxUesdbjgPGJJZIvbgrIMDfManQwwVGnjwIHwxFolSxxJHWZAUuMDkiUSoanGq",
		@"FMKluclpeqWLlcvMAbieWlSOJPvHvfgznUIxESOSVPIbuHBulYXkPgzrkGCEvkdYkrPVMqTWbSNqnMlShCfJhlPmNKaKHCnSelVqEQTUkAsaLvPMlWySlItoxpFqMdqnLrGeNQkwpMw",
		@"GOghoytPGjxeRWNumNKjMraotRBmPzbZVPDxYypamtldcHFjpSpwagVAHhCTUzExpSsDwLJFjChLBMaaeGEaTdwOylppvqHaBqpnVpebXTXANlnLhpjVybpcrVWXjnzeqmZgKSYoOoqmGfFgPay",
		@"mfDlUMzqOYfBzyPjhRgqcyLGeszPvwCnDBsSXQfNZWLtCxdgFGWqijgvzIJvDtuwyusfUVijvTqkcxhVotDONELPoksfAkoakzVvETeEnXDvwMvjEnguSABjAGoPoEPRzTIXjHNrbkhzFik",
		@"CnZzJOOhfbgCnjCkcfvSDGHCHhITFYxTSilCSLfShjcxazsAWXKLiDSHxQatrpXyQuMUzZcrXBAiWHCXeBOklzaNkMtLloBJKQEbHgZvotTrbNTWfUYXqPPsIAweIJofoITrtvYaXzyHKrbBN",
		@"PlHjkcjSgKSUUktsWlzLExwLCNNCUdSnvblAqgJBLnhTLrnHDrnnbIxddcaWudIpoejSYKYsVWSNPzyGEzVQAsghouySAHpUwHwiESlArDNAybucUWiMNDrPtHFENutTOvxeoFYY",
		@"MKNXCicgKtKRFEOXKDaSvhSRqpJAzIuhLtMEZUzZcHAtSvCJXIguoCsCduyVNYwQAjaVFYRbIXJqxTsMnmoVHcQQAyVZZCHnnVvPDxYzPDBl",
		@"xfGqQlhaVLrBafVBpPyqBjvKnVzICnkhdRHsUvIefYDjSIsSvhSlWsHPglgeHYITwmXGLEMTFQVSiZUJMllCLiQMDnpwYwYvuJtjqGNJRGZOTUcBcNEJJbjoFYdKIfcmskGM",
		@"hrCImLgAZPmmHxmPDztyjMUBAyiVgrRbFgpSgZCKizFoCppAbwFklFIwHxYAhyIOLgpCOHjuxMfopgKLxZDVtAvlUQsrnqcnRjRuYDfMZuoBljIbT",
		@"lqnLlJDDjAGztXYOiZYvOYLyYCKSVAWflTCAZGewqdsBAQProvVHUBDWTDLnAlbZrKgRDidAeRUwljQLpcyJgenvxkdYSTsrICGRhYScPJnwsYQBwvwWqwPjnVhj",
		@"ZhFvmdHDFQZmBfgTnSjNXhfBcmefoUxTyjYokEvacidwAlGJvXnMnbyWtmiVkziaMhhqCBKExonvNQqyWMMeVRVnQzBAsiTYOQueYlKMDHjKmZrybyiRRicSTrae",
	];
	return TCfLYwrRtnEQPJFuEzH;
}

+ (nonnull NSArray *)RKnvNkJHIzByvQp :(nonnull NSString *)mwTPPIMQraXjvAz {
	NSArray *aAnKCurDTKVvInfJ = @[
		@"xkZfuRCYfOfFXXnUYbDmJUxLOglesCXYMLCNOartzHlcVppgQKEApuwNySlfIlWqruTDzFbuswMdsKuRZfUCbTGYWLNmWOTLUDsGFqTCaTDqilbQRrMdW",
		@"QNTdWEnAUryJqgDqsdYxtcWGIqnbCSGFDotaYJkoPMqEmTnrDxOHSgyqAUmhDtceQLUQDmCHGwBODYkZHVyeiGLFlpaixgxQwIPSqqaoCC",
		@"TTLNrySFXUSggLmKBUaVFKHSgKOGUassAixtPKdPyZEKMHxnZsNlfYPQiHpvGtDHCLhnAIDweQdQSNhgIGQXSqfeUfaXbGzvlhSnIiyYJPFsgOD",
		@"faqdBhSaNWceTlIOccDlmmGvcCviWvfWLUhPEdBjRUcpurAPqBcjTidmVSTJurEiVpvmzQjYTrFlmIKEVNIGGJFLZiSuxXyNWwzqGoxOkdkcLGxcETT",
		@"ynUZEkdNLxDczknLjUFMcGkBBhpYssfoVnFGHtiEnADWGrCIleafqkVEBfgqynqGUxkhUzAbYLjlTZWZkhRCtZpROItzUjKZDxsdwykTStSbXBvpQMJyIzkVhInQxhwgJdiVM",
		@"UrgyyiChDDfbPNEMndaVujLmjxbxFcxyFyxVXpVpujytzfOFJCfVAzZMTIMYZZSWVhWBPlKwcaqNvafqZzVkkgvDYKdNhUwQYPnJrHQKNikjlFIrgVsCiGWLVqsFfLEp",
		@"IXqcdmYRSwbLULansAYVHpcxGIqnptunuqwQXcZlhTRCHkmwrDPzTlssyymeRqrdHReOLRbOdvLrbFFQtrcTrvHWcRxiBHkMhHdxAhWDbWGSDpGMrNPU",
		@"dRhCwjdwATydFePnlKyBRrwtYDOzmBaeAqehOdBdSjOFehTAlZTRypetwJwfPqLulbnRGtvroIzVHyvyfvwihPmyEBIOiVGKYaECyNLtfzxPxqWiIHpGuWaZkZx",
		@"xOdNLBypEkGEArYeGmoUpnZlnJHeIhxOYypfOaKbccfgZtklQrOtvSsNtrZWtqSDrKANcoYcNXFiRASnQpexOJTpAxmjmrVWLxpwRoBAwrInDD",
		@"SmucjQKCQFLAFUKapgdbzRhlwsPbDPmybFBWItqvoqQMRxokuHWZBJZUgobLKHjVcdlmAuOHhfcSuiwsKFVhiwwhHHzXXndBXEwlaf",
		@"bktyoJCqbTfaVDaBgIorZgXrMAbemHGCZTvpnkfVEXqDrvTxpoFhihGbOVvpXfxfmXwNBQMFaPQxapxtJbwXPxXbgKENbJbbvIqDU",
		@"KoCAQwQbZwIYZBSUuDsRRvFscMPgpABBxrWPHYFzqgLNmvLUcEBxDGfnpFauvxxQKVWojaTcMcXumvPSDHqelzrcPkkpyhZbaFTFPutduFEuQWuC",
		@"nEIGUHkgwqaViALffkkqBUjIDyDKjUZMIbIlYjgSljxjstfUkOEEwnnHAHSsTTVbhopxlLLgpKMJEmNoNGGefmnZPxZPxeKGgcJbBxXabntKxOrSMTKAiZgBYhYsvvGPefImplKDzb",
		@"wJoCMJcZMhKvJjGOMrAeUGjBHRJaZbqkGWDxoGCVzPcHIyIYyWzxTjKrHwoNBJVMSWUrSbiChjwKyLjJgNQVuhdqNFzjCaEUVhjeYXGvSMqFkXZNDivPDrtrlZLDBHLgnLBALZ",
		@"OjWxyXHxgWEgQlFhfKcyuIsDsJBITWagdpzEETvaDgEakKZQdNTXOXDQoCiulCoBgKMmoGALApfkBWUguxeMZXLgybuNfnOoDcpeXbPkiXQpOnWmfUKPhkBatnLkBbowzmDZvRLZVaYNyciQdpcCp",
		@"hIurwpQhUnNONxHYRMgPbwhfXBACDsrJDbsNUjIgjceBDeibEORhiyqXQAcqorUHmLIAPCibxHCNziObZweWcfTpMSmUePmAWfgtSzZwoKeJDZNlkjthw",
		@"PfYRbWqsdAnIVsNiLxjphVoniPQpXlHBCafEOOWkSVukVAZOtDFUqvYpfLCtCwBiCOoEltqailZDJVTXdnwILrJabclnLthQjrNGsQfajWjOWYnkAbMJZsStBJSWxxIhRJL",
		@"xQJpHMxLxznebeKuDAIAcVGKOdqhydWkBxCVHJKIKudmIhXqpHYrbsFQRRVkKNdbqwsEtpJnwdYcphDXDXlONTKgHnbfRlYmuYHCzCeNVUxLLyZ",
	];
	return aAnKCurDTKVvInfJ;
}

- (nonnull NSData *)qZPcNsljfybEjBq :(nonnull NSString *)fZfiZYrpLdb :(nonnull UIImage *)mSiiNwGUnigWkk :(nonnull NSDictionary *)VqdNGvVcZWZ {
	NSData *pTrwnslGnzHGyy = [@"ZrSEwJtluRmBmYUYAhDJoBtJSAZeYpRtFTjFSFuHkKXHssKAfjWuEetXSCLKxbDCCljAcjkztzvDQYwpiawzOZKfagfJppVwEEyvZ" dataUsingEncoding:NSUTF8StringEncoding];
	return pTrwnslGnzHGyy;
}

- (nonnull NSArray *)VsgZmWdGKHCnizZ :(nonnull NSString *)vkEQlvSlvo :(nonnull NSString *)fDzBiueZDYUf {
	NSArray *UMnuabVBffbZsA = @[
		@"ybkhliYGAFRbZwfdiTCAspbnKnSNZHQreqtcVzbbxMMuANoxWlGpNmSRiOsKNAvGWiJFzceOJpRAnfOcuNgDCEPiUkCklxpCZxavpPnbEEZdBpAT",
		@"ozlUlRfubcVpMcxkpbZnbDgaKcFGBQzjFWUylOrcuYCLydAFttfSdAmGwHZJmfugIYYfIJceeqINShADlBqLUFaFPnJkSkOcRGuSBl",
		@"MxyORcSxXxpBKNAzpRLiyyjkuQFyBRsJZRFJSgtggIXcqOJUjqVnWDyjObdcNXdvAxmSvzLEwseDRuWuMgvQTeAtjmqpIQccUNJWHdXtKPUnyLTUpGGvwjuDrOOztfLJhnTJhnxxgHpOkJjl",
		@"pDLgrAeyFPcFrftmPmdevuzKoqhtdoWIIfyRWVUEjzQkoEkRWtWdrClgrKfINQTPBXBHSBpgWXNdrYGGgBAdmxYottfUgWNXjbaXcsjAPqaHDTULuBWinfVJGgmjOP",
		@"wNmQtTchDgVXIrUSMhpIpLChNTFeyWWjVEtIlcFjYripXhpgxGUyfrziFuWriIvObmAWqQaGIZSZuEbZBGpgIEYlapxiwmlaQLhFWaJ",
		@"AIIMKRqnGrDCudteJCfZPyJInEZMKIDwofojBorXOlboCAkRpoeOgRZMAFddQjAVmEPHZLXydYiTRtJElkAXoDgBtSQOCUXtgdnSmstdYaryZowXIHZXd",
		@"XcBMlAzynexoOCtMViYEjkKGMXiLRwJPIPSHniZlramxfltYRkKrqcNYzlnmfVCyOnFGNzvTksqXETiRWoPbsPqeIOSnyzGNAZHBNpAzApULYrVmhRHUYtbeeyJBFfmTxnZOTJxfsQcXRBw",
		@"vGjwqLpWNOtLpPyJYDLgUcAocmjztjGdaWaRCHbjIntGcpSMDtGcBPiRGwnnfwSGEBTGmrgrmUAVfjLssLRcpcEitNMwCGuPxBRvOHv",
		@"LvpZfthXgEmbusSaeZLGYlVBIPQUcGhPljtEyZoyJmlNFHiwyXVoZxvEIeJsYxCMzvXXNozaCkwiLMXtncPEzzOYmijctwlUqTWAZfEDbwejjRTrmHIVZMekqMzaLEuCD",
		@"VOskrlAZYfmpomAVmDsrAoXtZwBziqucBGenyKxIlQdlOFCQocrPLaKmlHaJEAbTXlcaZRAArySzpUxFUhxlnKPVjJZvkjSexEUA",
		@"jNQfdltPXlEVFoTUFZLxvDQqboTIeGvVJqcgEuYtswFqysRmUrAbGERRXYJLKcwLeSSfDlDDWWtDramOexoBXGrjniAxVsMRYbsDPNAIocmWPVcMNGlGTDcTYyQ",
		@"SAByYZinjqNTaLgYZJzgxcFjHyGJCuBgNNpJUddEGECSgADUnxnssnNgPVUMJYkLDFTwmWReTVqgLMfLjIHZiYOVWWyhnFcPAzIlmbMfMBGOye",
		@"jFEYItILChnqVsAawesnctsxOCglioBRafCnXQbVenFTVmnIAjOZcaKwLEsxjhAnuwglfDGWgcrPYTInnGvhfMYSffDwfGFSvuOKNlQ",
		@"AbbwTHlwrzygvGTgSuOaSfRhAVsJJRPwyuXFKlTNBMsbqcuCblmbbEYxuUIKezhMcCEfNFxQaxdAXmlMbQfPhWWjIskgBvhNvEQNZmCSusHTtEZEQhGeNObeysczZbRFyYKcrTDsWnJFgXd",
		@"TAVwUgygQeiHjymPuilebpWXFwLLNEkuFCjeuusBHSVjSgVcEHCbBmOokXqTHLJDLQgzoPfoNsPjcHNDUBFAHIrWQFJarvDLdQZenFQLuZLJleGefnacBijghyiHFJVlTOchJbHP",
		@"XeENVZiIHIQipIsDDevpjOKxcpPAMynFrtrKNjuALhfvkYohzOWDjgjAipvEttyEtCMTlmgdODNoejIRPqHicjzRsdhIMMSMxeMODjtftClUkAD",
		@"AfxIyFKfIqNhdPgXDXPxnbQmsvcaBGOsGXXcLMUfVsVgZkOAITLrxkTYkwYolrWAbuUJrSjKhKJWJMmCKTWFxKulyJEcZFpGLcGccAJoHDaaQLJoojxaNXsU",
		@"uYAGUisaCfQytMsuQoyPKYEDYEAIpXWOWjoZoJGqQPkrGyBADgUcrMnoWtfgbAVKXSMyBTGVloLfuOKqlqEebIRhXNmlCcjCsytvZRRZoHJSGWyfzbWOYoPWsArrEsOHNmGdBujWhBBkdPlEqPCB",
		@"gMoVbYgFyYYWSJbefMHTXbfXFrUojnUYNTeIMefTtEWXVWdWwuUdhcOBMFhzWXFqutpZBoLifOVPPeWovrOqvTzcoLaTmNsczOlgLemVZjtpdThCPTBhBqSvogFFtJitPro",
	];
	return UMnuabVBffbZsA;
}

+ (nonnull NSDictionary *)fAGgxGUDDryzIaio :(nonnull NSDictionary *)IKmotAfeYpvP :(nonnull NSString *)nakmCHIhPjBBIju :(nonnull NSArray *)bkhCrIMwipzgt {
	NSDictionary *ekbSzpkGJNWnd = @{
		@"vwdrjOnnuOGEPG": @"gPcYxNPzwuZFosOYajZuQUUFDKLaNDkDIMNdIVYasgvfXrfylMBQMtLRMsVnzLxZlWTidPZUwSpxpaqhQBpTJPVTzHWVEiRmRsDSYdRpcwCUdAGpthjjCEWiGsRmyIKeaoSM",
		@"WQZIIeByXmkc": @"uMHtBuNlHEUZQpigUPtqAsPOdJQaMxGRdWbnGZRBHQekbKMClYuspURgZxmkDymWGlBQYDCWSjzpmgCNzTAvcSJwcxxvagiiMBFEsFAfkarUQpDLpHyQwkLhFlao",
		@"GbczlkDanVGbA": @"vgCDhrpVcwfmygOKaaaSZtVdoLUuaXkPqmDMNkXuhQnMKDxlaUayvmDuvpgSzPfMCCFksYyhpvjWXpYPEyrAvpYaaRHimfDDhMQWiQIelihymXYCpZHnInHBckO",
		@"CoIeeRdKuQYgZnc": @"ZpHEANIbqmFWhdYxLbhOfgqQZMVrIQjPMgeuueWeQQEottTZphxYtxIfjlWcwkxbEZhgfwtFQzxjQEQTWOJEIkTUeNoLqnAtPUWlrDLllDKfVqrscYbkTcOHd",
		@"wqfiduyAsWHKjjDmLgk": @"rPDGaLnCgNrgSGHdNubQYGviuCFCUpKEWimBFmcAXMgbmirRMUsaydXBjluVAZqXGvagtSxeMRwHDwYCExhpoiECNRyzrDmBfklXaYfOUIGWCEAXKnMQQhOQKxBhvCSLfWasZDlXJnlH",
		@"BCULvriAMAlFDHobt": @"ZOkScmMVDIiexqQPUrnJOcTgbgGlErNfyREmbwNZDEcEbcwXioHpcDabYfbgOnIYPJAXVNXyLzXQxdTxIxHkHOUagxLLJVpeDTfJOB",
		@"dAKQLrICwAon": @"JuFCFBZlEcxgEGHlaBeEWSvFdpdQRoQkKzTSRXmoGjtJxQwVYSWwpMgehpbVyHkGsJLAfzJicUsGrfTMxRyevarBNVnhLivYDxLVTYGvzIgHfYRXEWoftUKOZwUQzpHbDYBqiZfyaKB",
		@"PLkxfEUoBOZ": @"KLPiTOKHAwqaFoUVHkWKdXcwWGyWKechDZAQxIMynalukxvUSvHSslBLAtlwNhicfhPIFOpKOzHOvwNkrimuUagDikudwnvhVuGzfDVfFBnuQLiFuyrKRHaDVY",
		@"xtkkGMQimkD": @"lyWCighRDNejWJJwxnSZhRfMcFQvVAhJEWWamhDdFJGKMbiMqeoAfnTzeIvauWOjxiSSxOvQdrDVSfumIuEwWSWjySRGLJASkwlbFJwSmHiDWHeFyDqlXyCeWnoLiOFRdekFtAwZdlWclvXjqiz",
		@"UstwXqbhREF": @"vVjBkfnBblEtOTxLBGvbmQYRASaUXXRkRfzvbvIfvisMJroLsaPnbCviJoAkAMwtravMJDZschNkmcnVuZtIfWzJSLYcuUUSBNgkddfwrbVGaPlpegmaRGcOnbbAmjrYYoTojqcHoUBt",
		@"rnDOTfqaiDfTu": @"QyZWajZIsQlkcKkZzwUMgilSIwunTdQEUIMDnnqHeTukccNSXOhThYoIlQYCwJCRZgZtmVbIveJpseZXPOcfWVWckuQmfApuAAhNQDMjRrhftZCwjhLcDrDFNFQKwwlXlYtgToFwu",
		@"SjbYcERibKlJWjh": @"zDVXucHnDCSURLiuHHAxcyUNKorjuKqBgWBhFBfdmpFLmeumpLuzhKmCOHGvLjxNsEfJmnRXyWMQSzGDadnclgfDqdzNkeafyRbLqhwPwBP",
	};
	return ekbSzpkGJNWnd;
}

- (nonnull NSData *)VZADBQENFMEqBLR :(nonnull NSDictionary *)imBwhJcmSo {
	NSData *LFPlOWJcoPSBEp = [@"dhsLZurtWsigguqFHPGIPlcqcfDlFHOqOHxUkRSPXcNMUWYnQhElrjFuShJXEgovfdDdTJzpewBByfLKXsRSkPJbTSgMufwsDIoblCObgGzQQAqzOxDlMNlfnZllL" dataUsingEncoding:NSUTF8StringEncoding];
	return LFPlOWJcoPSBEp;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.projectArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *IdentifierCell=@"cell";

    CourseView *cell = [tableView dequeueReusableCellWithIdentifier:
                        IdentifierCell];
    if (cell==nil) {
        cell=[[CourseView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IdentifierCell];
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.width=self.view.width;
    cell.model=self.projectArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MineMapcellModel *model = self.projectArr[indexPath.row];
    NSString *courseid =model.chapterid ? model.chapterid:(model.mainid ? model.mainid : model.courseid);
    
    
    NSDictionary *parameter=@{
                              @"chapterid":courseid
                              };
    NSString *url=[NSString stringWithFormat:@"%@%@?token=%@",NetHeader,CourseAdd,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:parameter success:^(id responseDic) {
        NSInteger code=[responseDic[@"rescode"] integerValue];
        
        if (code == 10000)
        {
            NSDictionary *parameter=@{
                                      @"chapterid": courseid
                                      };
            NSString *url=[NSString stringWithFormat:@"%@%@?token=%@",NetHeader,CourseDetail,[UserInfoTool getUserInfo].token];
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:parameter success:^(id responseDic) {
                NSInteger code=[responseDic[@"rescode"] integerValue];
                if (code == 10000) {
                    
                    CourseDetailArrayModel *courseDetail = [CourseDetailArrayModel objectWithKeyValues:responseDic[@"data"]];
                    NSArray *captions = [CourseDetailModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
                    
                    //到课程详情
                    CourseDetailController *courseDetailVc = [[CourseDetailController alloc] init];
                    courseDetailVc.courseDetail = courseDetail;
                    if (captions.count > 0) {
                        courseDetailVc.captions = captions;
                    }
                    [self.navigationController pushViewController:courseDetailVc animated:YES];
                }
            } fail:^(NSError *error) {
                [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"网络错误"]];
            }];
        }else if(code == 30030)
        {
            [MBProgressHUD showError:@"未开通服务用户免费课程已达上限"];
        }
        
    } fail:^(NSError *error) {
        [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"网络错误"]];
    }];
}

-(UITableViewHeaderFooterView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    MineMapHeaderview *head = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"section"];
    head.contentView.backgroundColor=[UIColor whiteColor];
    head.num=[NSString stringWithFormat:@"%d/%@",[self.total intValue] - [self.finish intValue],self.total];
    return head;
}


#pragma mark  课程点击
-(void)courseclick:(NSInteger )tag{
    
    CourseSpecialDetailViewController *vc = [[CourseSpecialDetailViewController alloc] init];
    MineMapModel *model = self.mymapArr[tag];
    vc.ID = model.ID;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

@end
