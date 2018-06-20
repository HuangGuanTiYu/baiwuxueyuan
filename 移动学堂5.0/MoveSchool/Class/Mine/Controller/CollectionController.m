//
//  CollectionController.m
//  MoveSchool
//
//  Created by edz on 2017/9/14.
//
//

#import "CollectionController.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefresh.h"
#import "AFNetWW.h"
#import "MJExtension.h"
#import "HomePageModel.h"
#import "HomePageCell.h"
#import "MainWebController.h"
#import "NewCourseDetailController.h"
#import "SpecialDetailModel.h"
#import "SpecialDetailTitleModel.h"
#import "SpecialDetailController.h"
#import "NewCourseModel.h"
#import "NewVideoCourseController.h"
#import "CourseBean.h"

@interface CollectionController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int index;

@property(nonatomic, assign) BOOL isMoreData;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的收藏";
    
    self.datas = [NSMutableArray array];
    
    [self setUpUI];
    
}

- (void) headerRefresh
{
    self.index = 0;
    self.isMoreData = NO;
    [self setUpData];
}

- (void) setUpUI
{
    UITableView *tableView = [[UITableView alloc] initLineWithFrame:self.view.bounds];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.height = tableView.height - 64;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
    tableView.backgroundColor = ViewBackColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    tableView.tableFooterView = [[UIView alloc] init];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 隐藏状态
    header.stateLabel.hidden = YES;
    
    // 设置header
    self.tableView.mj_header = header;
    
    //上拉加载更多 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 禁止自动加载
    footer.automaticallyRefresh = NO;
    tableView.mj_footer = footer;
    
    //没有评论
    UIView *noCommentView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.noCommentView = noCommentView;
    noCommentView.hidden = YES;
    [self.view addSubview:noCommentView];
    
    //图片 + 文字
    UIView *imageTexgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, noCommentView.width, 129)];
    imageTexgView.centerY = self.view.height * 0.5 - 45 - 64;
    [noCommentView addSubview:imageTexgView];
    
    //背景图
    UIImageView *noImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 121, 90)];
    noImage.image = [UIImage imageNamed:@"kong"];
    noImage.centerX = noCommentView.width * 0.5;
    [imageTexgView addSubview:noImage];
    
    UILabel *toTestLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(noImage.frame) + 5, noCommentView.width, 20)];
    toTestLabel.textAlignment = NSTextAlignmentCenter;
    toTestLabel.text = @"还没有内容呀~";
    toTestLabel.textColor = AuxiliaryColor;
    toTestLabel.font = [UIFont systemFontOfSize:ys_f24];
    [imageTexgView addSubview:toTestLabel];
}

- (void) loadMoreData
{
    self.isMoreData = YES;
    ++self.index;
    [self setUpData];
}

- (void) setUpData
{
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=%@&count=10&token=%@",NetHeader,MyFavoriteList,[NSString stringWithFormat:@"%d",self.index],[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             NSArray *models = [HomePageModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
             
             if (models.count > 0) {
                 if (self.isMoreData) {
                     [self.datas addObjectsFromArray:models];
                     
                 }else
                 {
                     self.datas = (NSMutableArray *)models;
                 }
             }
             
             //没有内容
             if (self.datas.count == 0) {
                 self.tableView.hidden = YES;
                 self.noCommentView.hidden = NO;
             }else
             {
                 self.noCommentView.hidden = YES;
                 self.tableView.hidden = NO;
             }
             
             [self.tableView reloadData];
             
             [self.tableView.mj_header endRefreshing];
             [self.tableView.mj_footer endRefreshing];
         }
         
     }fail:^(NSError *error) {
         [self.tableView.mj_header endRefreshing];
         [self.tableView.mj_footer endRefreshing];
     }];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageModel *model = self.datas[indexPath.row];

    static NSString *ID = @"HomePageCell";
    HomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HomePageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.isCourse = NO;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = model;
    
    if (indexPath.row == self.datas.count - 1) {
        cell.sepaView.hidden = YES;
    }else
    {
        cell.sepaView.hidden = NO;
    }
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 106;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失

    HomePageModel *model = self.datas[indexPath.row];
    if ([model.businesscode isEqualToString:shalongType]) { //沙龙
        MainWebController *shalong = [[MainWebController alloc] init];
        NSString *url = [NSString stringWithFormat:@"%@%@?id=%@&locale=%@",NetHeader,Shalongdetail,model.businessid,[ManyLanguageMag getTypeWithWebDiscript]];
        shalong.url = url;
        shalong.webTitle = model.title;
        [self.navigationController pushViewController:shalong animated:YES];
    }else if([model.businesscode isEqualToString:newsType]) //资讯
    {
        MainWebController *webVc = [[MainWebController alloc] init];
        webVc.webTitle = @"资讯详情";
        webVc.url = [NSString stringWithFormat:@"%@%@?id=%@",NetHeader,NewsDetail,model.businessid];
        [self.navigationController pushViewController:webVc animated:YES];
    }else if([model.businesscode isEqualToString:liveType]) //直播
    {
        NSString *uelStr = [NSString stringWithFormat:@"%@%@?liveid=%@&appkey=%@&locale=%@",NetHeader,Liveplay,model.businessid,appkey,[ManyLanguageMag getTypeWithWebDiscript]];
        
        MainWebController *vc = [[MainWebController alloc] init];
        vc.url = uelStr;
        vc.webTitle = model.title;
        [self.navigationController pushViewController:vc animated:YES];
    }else if([model.businesscode isEqualToString:specialType]) //专题
    {
        
        NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,ClassesInfo,[UserInfoTool getUserInfo].token];
        
        NSDictionary *dic = @{
                              @"classesid" : model.businessid
                              };
        
        [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
            int rescode = [responseDic[@"rescode"] intValue];
            if (rescode == 10000) {
                
                SpecialDetailModel *detailModel = [SpecialDetailModel objectWithKeyValues:responseDic[@"data"]];
                NSArray *titles = [SpecialDetailTitleModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
                
                SpecialDetailController *specialDetailVc = [[SpecialDetailController alloc] init];
                specialDetailVc.detailModel = detailModel;
                specialDetailVc.titles = titles;
                [self.navigationController pushViewController:specialDetailVc animated:YES];
            }
        } fail:^(NSError *error) {
            [MBProgressHUD showError:@"发送请求失败"];
        }];
        
    }else if ([model.businesscode isEqualToString:courseType]) //课程
    {
        HomePageModel *model = self.datas[indexPath.row];
        //根据format判断是课程 还是 音频课程
        NSString *likeUrl = [NSString stringWithFormat:@"%@%@?index=0&count=100&courseid=%@&token=%@",NetHeader,GetCoursesDetail,model.businessid,[UserInfoTool getUserInfo].token];
        
        [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
         {
             if ([responseDic[@"rescode"] intValue] == 10000) {
                 
                 NewCourseModel *model = [NewCourseModel objectWithKeyValues:responseDic[@"data"]];
                 if (model.courseBean.format != 3) {
                     NewCourseDetailController *newCourseVc = [[NewCourseDetailController alloc] init];
                     newCourseVc.courseid = model.courseBean.mainid;
                     [self.navigationController pushViewController:newCourseVc animated:YES];
                 }else
                 {
                     NewVideoCourseController *newCourseVc = [[NewVideoCourseController alloc] init];
                     newCourseVc.courseid = model.courseBean.mainid;
                     [self.navigationController pushViewController:newCourseVc animated:YES];
                 }
             }else
             {
                 [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];
             }
             
         }fail:^(NSError *error) {
             [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow];
         }];
        
    }
    
}

+ (nonnull NSString *)HExwCDqbAKXiesQ :(nonnull NSDictionary *)IoeIbriEhOH {
	NSString *riAAFKcXZCMIz = @"CkMuIDQfnZwthXILRdwoaEEQqPScUKloFjEnDHxzbSAMrsTZgFdTJpFadjbhWcTGqBmBPMEWrqzgLuNjWZacrDlBaQdgYzpaEhqkUNMOktfEltTTMHtNjtABtugskEThSGYf";
	return riAAFKcXZCMIz;
}

- (nonnull NSString *)jrdVdijxCUI :(nonnull NSArray *)bJzJLKudgtwr :(nonnull NSString *)LLvNlICUiroOBV {
	NSString *BRQGNByTkyvmHQzioEH = @"hnYabtkZeLCJNPpdAYSEWIzUiJWGMrYfcgZPvOMzUkYLbqjFYNQZiOikVxlUElTLDYaBafahYPDIViyazwxOhCDrLAZxNIzSHkyUmmfyRqZATJWMUGrhvGmrohUPrERHQLpNqQeBt";
	return BRQGNByTkyvmHQzioEH;
}

+ (nonnull NSData *)PUborgWNgSMkOgUM :(nonnull NSArray *)kHLIwIXjpUWfeo :(nonnull UIImage *)yNsuYONcGjOjb {
	NSData *pxYKjabGiZk = [@"TrlrmsuHlFdZfnmhTzftoHnbvZJBVsbqdhWzrPLsIiovpcquHFTLHMCWRYQmodiivTNQVRGgUWSMTiWRVGudmfTUFPOyoRXshWCxAQSdWB" dataUsingEncoding:NSUTF8StringEncoding];
	return pxYKjabGiZk;
}

- (nonnull NSString *)zqtpQNaRciCZFMyzUMg :(nonnull NSDictionary *)FqNLWTmeLmm :(nonnull NSString *)yiveNllndYpEg :(nonnull NSDictionary *)kdDqLMOUPUi {
	NSString *wwVKdMyHtCPDa = @"WUlXGgnCEpeIrmhiwcNDiosbWTzeGNOCGTOooKvjocfZCzqbjIcheAicutAkUcgyOOaYjVzLiOREyNySKzvbcvHPKmgKsSNkJlWpFPGNLJysjjyqMGaOzLJYhWrWAbdzP";
	return wwVKdMyHtCPDa;
}

- (nonnull NSData *)sRonNLyHWVPu :(nonnull NSString *)BrRkvLYFyhd :(nonnull NSString *)yuGzggNTjWDV :(nonnull NSString *)JhPugwSfvOrFSe {
	NSData *JWSSNtJVmnfUDjOkLBl = [@"EctzedTqQKxODLSJTxqRLsrPDyvcbizvnVhjJhzBAptyDnNRHYlVoPfcYvbvBQoghKhwIoLMtefHPlcxvvanreRunGzfILBsuJXijkfjNTipzyGbnkHiSzqOtHghJgLoBL" dataUsingEncoding:NSUTF8StringEncoding];
	return JWSSNtJVmnfUDjOkLBl;
}

+ (nonnull NSDictionary *)mANYEYsKRY :(nonnull NSArray *)xkaKJaOehguJfh :(nonnull UIImage *)ryWPWxSyLmcY {
	NSDictionary *VfhIAdBUQnRvz = @{
		@"ENdlYyQkRB": @"eSryfNwVONtDQqoJgGfyusrPCzxYTzSbSVyRrhwSiohrVZAjxHlVUySRTnZFJaYooUTSWjnHQgBuvQqnQNGgehUUpTqOBlqLyhGacgKNtKpMPDmIXnRJCJdplkNSDTCEnU",
		@"udLKZzMUASlOxjSMjI": @"GpGkYbijCSayfVpdaToTnxHfpjpjlIeRwzPirPEAyRiQcQcmQGdvAAKgITTctijoDomPVxcGUvYvzpGUptAZiPTVYrskZtzfGzVpplt",
		@"XvAJgNdcxOjcCJ": @"gAauzsFzwSZNjorCkduGAmqeceNFWlVtXRpgyUoBLzXNFOlLGhKhARXTduxoRazAsUYVXgpmkKTdoqmEVUPWjdMRkbhoFhWJRrqfglHGlKEUukWlQxEpOdPruHVmOeNYYdWEZfktnDzBXl",
		@"wsxaFBYmZDHv": @"WzVMrYiKDhsQhlfqQRbVqOvEWViBULGNTzANYOGkNLLQReOeOAbSReSpISmFPPLBBjBHJnwXFfDFWSuljHHJGjnnQNwZdcWdZGrFMfQhOzgpY",
		@"KHsPUKfXtoEZ": @"pbZLTbwcdxsadafZfCneBEFpBxdulgxkELSLuSuVxvAOeAsOgtxcpvqVmTLmwYcfwKyfVUkyoLjmROVJxsQAMYFYNJkPJSRIDHTsQJJEtSmmZdvbhwhLDnSIYIPkAUmgeGduW",
		@"yhaxrsKetEoWY": @"LeCRTyrFeVhPNbBQjuIFSOZLsMNzqZNCOellkwiyYUxahjgToRwydZjQTjpNYgVHVqbmvnKRkATAoGSXzcfCpHEfPJJzHPXkHTSMKSSdJxNTZWnhvaiovibLTQgA",
		@"OWWjOHDnsV": @"cSkeCsOsDHtkcwJvqzikAGnzKcWDYWhLctaIckPzQRtaRFnqeWSNiRldjisjeLTsbRfpJtqUMHJDhtkGHYBwhoOufFIAimbzcRqNNHEXEdRVyDmCR",
		@"PJiRgpKNChVaEMkXxt": @"jIfNSDNuaZYAIWFulcgJAMhSwOgdUPMFwLBYUdtygylzwdVVpUrvCtWHIzVrVdBxMENiABkIFuoeiTVVDwwxnPGGqeRYdHBHLvkFRGUlHwwrlElEwOzGYffUjiGoRZabPG",
		@"VafhWtKhRyI": @"GdVmOQWyDOvCaDLBCkZMucjHNSybOSINuHpfCPcmifXkfoLmStRfjiCVYAXKEsttOOJUovYBnqQUbjndUBPcpwqEVaJTZTGEaxzVYvwZylFWtrLuIcihjflTiQZQZ",
		@"TIQkwPFdimKKgJxiRRS": @"GYwUeknkReeVdhrGwOfNuaTNurJzVTLfoiIKaCwnIddJGJZNRbQlJwJjzlgsORpKkJfoUKiOzIYtavJuPUJtDtRGTXeBmZoJqOnnHEWxwxawWxZxpXRRgrOZOVChuccQLDaBbjlfIBbxTthx",
		@"KBiXcyBtxUXMrSN": @"lNGzJJjjtXGuSijtAEzvNYyTXFTsmyuKLARsUuxmQkNdZTmiPzgdthJSNnVYmIZbwFZAqFyaSjqGLrFihqasgLDRyAiUzNbgdwvfrUtYzpJKSTjoiCOAZubNzWxberjDzHeCWdWHz",
		@"PAKWKWAyDvoDt": @"LhODXhVIKIBmnUNoiLHKBORhYezxSesJJYHKpzpjGJqCuQsWLLvzYUkzgvXkuDqWudjXDPSptBgPurEADTRbRpawaZFqQjuRsjnMyiBCTSKaNXsHENPvrxeXLoBdUAxPuPuhvIBgWYglzTtT",
		@"uGiZRAjgXmLpB": @"UKfqOaXsDTUDJICzWMaqseyHtzFoSiyfqkPqDWqZYlnQrYmnIERBBiwmeIpQXJeSmtKqyndZVRZMxRhRlbNLLJMuvxXFJGVEFtXaxvRGKSFXXYuXVeufilpndqQSL",
		@"zCtaloOAwUqOT": @"GpkcgUkUvGlxBRoSdPeqtVEUJaGYSuejxwgxhpDWvmuikwNXslPMJuhCdMpuZtnlKocYXGAazZgDWfoMJjKKQWLDvBqdJEMPxVIuHGBjnKSAcA",
	};
	return VfhIAdBUQnRvz;
}

+ (nonnull NSDictionary *)CunYTqkiLPWI :(nonnull NSArray *)uCTcwFzaPX :(nonnull NSDictionary *)JwdwIjMHITHjC {
	NSDictionary *WnigJCiNcqWTFRszoCt = @{
		@"RogugZpAPUvZjWDb": @"BmTVyEmMyFCMzVRXSMeIrWIkkunRwLQgHFwcfLWPFXQkrGzoqmwBMOWQLLjrFHtPpKSiaDkSvvDYcgeNQLJGvmhuXThEpJBJMTvYiATY",
		@"HZurukUCAm": @"lSKlXmYAmYtxGEZViTqIEtuwgbGljFBDGrPhASThebeLcwQLeowMWkQeFUzaAkZxvkxJjvOIjwHTJmRCTPBBVdDMcfkdFPOUNWagDJJfWnDFcLnxDOBJUubrnJASJMNMqfIibUTzcqHHFepoTiH",
		@"GdlhUpwAvMQQuMz": @"RgKmCWDoREYMKuIHkuXCyqBEoBDOpTGBKUNlUcvJlIZnXPjgAQUybRgpJvnUhNiRrknLglQWrJIzGNeAHzNptYTwdWAMprAphITOX",
		@"uryRTYNNmBUH": @"BmbWeSxApwJdGssKHwVWkFpcBxTEaURrNVXyeFBAfiDHllXisdWRVEkUxLCvCYdewQWmorsJCwObJznwwnwknNJqZcGdUMCjhBaLcKmfPxKyhUFwQOdNsctnHsRdIvNfmPuxAkW",
		@"JsFaOMmRCczYjcim": @"TMkoOsogPPORGxCFTgAyFcLxpLrFffqgMUHqaVCfyoZGhxTQuvNoeeGyfKnvjTibBmmbAYnAxlJdzOffadejoJvfmLWCYhpwJTKjAM",
		@"uzzjHEgxkuFzmHEyzJY": @"GOGwQWJPreAiCtwMCNqIeZtCyIIsXGXiOdMaKAYKHvZXnnGIClYfAQafcjhvPlEPjgovGZexnhUdaBYtCTyHHGVgYmnhRmBtWmdXDBwJ",
		@"oUcGiSBCQAX": @"IVrojumLqxtvPPbkdcFivvIAvtSopyJdZHRXszEKCABqMJpLpzzQVIPaGFYWAoShngFnPIrgsByjuKOukhQBwCrNQhdSMCUBHdGUaeOaElbvwVsrCaEfhZFsauzcuHIMxesrLBjPTHeNKpnYN",
		@"VQPnMfoiucOSlZyIvhh": @"JpUKNiGvrqaYzVsUZbvmRJRucoXAjFEtGddSmyWOfrNNAVlqSMouEaNIjsacGEQiypKodKcoeAZqxBDraTGtFrrahCqSKtXeRcHyoOsijMRTGVspSWskpiiqvxQDOrYaxQpyfKzvxNTk",
		@"YWxXquCznQhG": @"wRaUhhILhNpwOVhijycMTlwLWdAODxZTAoXTwpkDYKmfbILrAbXUdvWGYVFAmFqeWHABoEiNaBnkwNYfPucEDnnlbtAsaqdIJRicazbncZBvyuRwNPNQrkEkVyWtBS",
		@"GelfxszITPpILIkp": @"YYVNpXJJcZRfpXxhXwOIoceKwrDkLQomkCErZUFnjNnVTXCgePqYxkeqQSWvAgnJLNkqhKAEBTlAviCTZeZMGDOhocWsfRgDUGyNBbkZFF",
		@"SLhsqTIJETIAe": @"fPHPatfCPMUrwRMZfGxhOpgQQYkLLPSIFrVqbyVDKhYpDBaDwiJgZnhSDwTuPjSBgtDrUGuZMDhCIrOsVmBNgtXOPHfMwchTBpOVJIioPQ",
		@"yILFuQzKeXhHUvweaUq": @"TaHsRjsdmQqdMLCSxAaVIZrhvOtoKfuvxWqEdLMPRdZUHhvKKPTdkcNETGpFVZVUtPsNjuufJckPUMVxsIBHgCHxmhheBsFPBbTHEDUcMsXUhlQsjhpIzLqzqAoyFWiDAmNLuGXwxXvhYaqooJ",
		@"PWKveeMIJbzcDsgZZ": @"XevDxOIXsICeulQrvzqMeXMZLbcbwWrvdBLMyskbofncgKIsXrnjpPQCLYIuOENlkNXqEIYsQJKCOltMCQeeiyuhUzQdZCwnNtmROqZoM",
		@"rZBrMQwoRhCIYisz": @"uzKBRhDQZpQjIvpDlOqAMjPjVUdHVgQUNQFHYcaYkvyuQwwCGlUwwfXitQyrJMGEwLucnXvECEwWufibSsVdAarKTEQgXHbJCdxtrmWXSHrZiafHxiHNSQOoQTRqbfAIMmuxMiq",
		@"LJCrvqjthYXt": @"plhJmyKpFecZShAZaRQIKNPjOSRUScQIqdPlVpdNbjpCHpXQqbOqRQZKVggPHHYHahDnVbMwWWczjiBDUnmJwOgPWVFlAhSoyhPFzOEYlCYPFPUJXUBbdDasLmovDWrseg",
		@"wuQTIdynhaedI": @"EpQrCQnvWKgVdBDeBWPRNrWzyLzqymkIUSeCalRnebIdgxFoPQtORPyjkfkIXkQfVcJJBzwVCBJdAJftkvkOGkiFqoToVLpLgPObcIqlyknUUeBc",
	};
	return WnigJCiNcqWTFRszoCt;
}

- (nonnull NSData *)BEeVBgJEbwLAUu :(nonnull NSData *)CRuLzpUyFqThlOWr :(nonnull UIImage *)npxLzWMgVsSEVf {
	NSData *vdGqzYWDdc = [@"xttOjFMFEfhhvETOPkJZtEjpZCpyEolFCJUWBEZsEflwOEJcNsWGKDsjubGbtMnFktNRfmJqjtJApnVjaHcBiDxPFKFTCQfddAErRcqKNfkJLFbzBxILCCeCMfouq" dataUsingEncoding:NSUTF8StringEncoding];
	return vdGqzYWDdc;
}

+ (nonnull NSDictionary *)diAvRTcwUOQag :(nonnull NSString *)nkPIzbsThgUtYPrsH {
	NSDictionary *IVKMgRguZKybOqLwosl = @{
		@"zartUBRTnKa": @"COeGdvscfGIfSAHOtHHUDvtWRMQqrJFPCPQUsuVzCyPprbGStQALMYNCRxykcVKZkZVNRvzMpurPvzNmMORVXNaZKhYeyCiTDgJGVWcylJOiCSgQDejiTZVVYbstTSIgygcJgaXixlIFDMnuBqHId",
		@"WkxiHOxpzicbYYPsLiT": @"ABFuadnyHzUgqJIdmhfITrZRVnOwtBsPTTuyPcWjmJuwzmxRehgrkljSISTbANfgorhVjadqaDXvYIBZsIKKiCyLJLoCRiJloOtZNaYvysyHlkUiRVGdVUDolykCeutmZwrJmsflF",
		@"ClEDgROiamnpLGIZ": @"jxDNAIvrbTZteFQnwTUhCtNLifsctOVMivWmXCQBoAAOzfYhtsaCVQjUhNYZmPJOzGkUqPpICrhUdZKRjtjKaiYDzAtyVOQDSYGVAFGXtT",
		@"ygVfzjAaiKvkrCG": @"JwKfNdZLlSPiNIZjcoXhcUTVgbrwgFjcXESXFNLnNlWLGsjpeEXeuVilnozfPcxssMINQeZeGhLPlnzLoJOxkBlKTFtpmfdxzsrxWIOTMefONKlzgoBNXwhGWASbuYZqCjsr",
		@"AiVoKMwxxaMbj": @"tOxzdJgRJmIYYFTcKKhqMZhKqIJmnMkvjxvxoBAuBXsiODJIeLhoRNuyyLaYecIOWaNRiSZGCdaRazmqnzXpikUuwnkiJmuHhyOnZhlzg",
		@"NzonnwCskBZDtqHeP": @"hyWuhhKGiBirQanICWriRmDrLiTSeWHNFIyChEbluzBIGitbRmnBLQufXzFsfnZnKAbxsrPNUEhdXRZmLGOTnzZuumKTVjKwZwUeHKFPAsoOuXRhoomqMHxAOmLZHJHvahuYkJpVU",
		@"gvLsNAyzQJyu": @"stScgcXqMiRxItPPCGpPJZXqtRDsJYjvKVLKlfJtRzuWJIRbviPfNLakNJZdNRArhGoPbBPxgikJScWNTMoofrdMBiLxNdEbPkfEDslzvWolGCpykoezThJjUFGohak",
		@"ifAvFXnpFDqEWMH": @"SPcFhCsXBumWUetAMDJikPgzzzaFReLEsNHJTyJueQtDnbuKTBpbVSbKDHPpevsUKckgKTzyJSHfcNUNOEkDDlTJEBEqpitqiDWLZaMdhoTvAGIrQG",
		@"mGxrRVSGBDdmZocWM": @"ZacbqrGbjtRAhHbFRIPNEOkECmvHBOkrJXUksMUrrrtElcntczZltKxRXOmEJdjtiFizRsQmzYMLRIhbjbQLyWBZyJFapRJgvPJBRrHVCpcMocijhEuZdfkmoJOZwGMGzCbNzoFF",
		@"OyIYZHvBBzlhGAVOK": @"lJFFhsuxwHmRScQxVpMNdXvmOPAhxCKDvTWaIvKYcmGwQzJpgWTnxnqbmSkMPuvPzzZsJtlVYoSgjKxVpkJKIzsUyWrBJIarygIcdkxUg",
		@"reMmklHtRPbEh": @"cTdfppZWkGqsNwXhfwRHaThPYqAjqfjQnPCxNhIgsjYiKOrsTyBgcKYqKWVfZHYJgIKeVOEaunctRrfWrfIHYWGQGFcwamPwZdfFiLr",
	};
	return IVKMgRguZKybOqLwosl;
}

- (nonnull NSDictionary *)ykvqHXFRebYFhIhbikG :(nonnull NSString *)psVCvuVdERqFm :(nonnull NSData *)jFAEmJYZjDDHzKZN :(nonnull NSArray *)JgpmJLvSnNj {
	NSDictionary *kFfVJjEeFCU = @{
		@"BdHFfGlhhWKfj": @"AVJXPwPgmPblmgeneOoQltQvGqDiMsBVylDgLnYCKKQonKnRnpwOJPLMRurJMgpdAfYBXXNPmwAtPOGHuuXAAUAZVrWTFLemSWPGEFCmfRmRzVyoWfbKqTmfnPYxqIyfnEc",
		@"BoqRrqdnwWx": @"hporMohSpePodYvgFoOMKsYdJUBjtVlhCQMZayFJBxTDIsawyhKclAzNYqMTfHefjiuuYIUjlCAGRxdFbBZZAUYSGuLpShVLLpNvBxqljIeLJIXxrZRNZHcoIGxDxpBTYLUOBuIeJTJhVxjHn",
		@"ablFNWwRClJkk": @"JkyNZWVgFuOCytVnstMCLjJvsbYkAmCiDfIgIUljlndcYPdtfZJBdLGbWexoFdfhfFECllQdOQMqYyxUFDyufixhcZIHYLOqQwpURthRpqybjSTdQSyZGYJ",
		@"NjwKvUKbEOGHV": @"ZVfFgydlTgAMuEiAKUTGTyoJAIcQnTXyYxuKEdqyfhwkqtZohracUJyJOHnGemUbxOCpuItiuwbfeIsSFhRSXkiDtLZLjVLYqrIcyAUrRhD",
		@"VbiumMaJKqyto": @"OvoumuvsMdcaOmIuviabRZWVGmWqvkxvnmYzpDgWGOGQEXadDBFccwbfrXCaBTzLCFOPyPIIPJCzsAwFXARjLqdvphNCnJDHhLaBjwOGQSAz",
		@"wDEwpioAkQOifR": @"QkdYFMXoAMAXdWwumQNBRYczRVnFdqMOmWmdwaDqfVOEuakfNkqzVGdgvFKdCdESVsCUTKEpJIPbrcOkksPgEMAKbKaMKiHfOjqmdKECjwzuNLcDmwItJeAYvvEElznloyQMuRVeNjVOpMBs",
		@"seBZLyKGNJEAl": @"tpsIRAypsoQZpswSMICjjYUzSnfncHZeSASgVczImaACQsZZaAiMSBRYoVZOTgIkeEOHGXexFjjVPwMoCPgEYUZXqVIvNBgxirhNuxVxZTmNHXSRtyHtdsTbdpWyvYRIYBwQMg",
		@"LcvzMyxrXWgXwMMLQ": @"LlWKTxMxwgeUrlAkCflIxeKOkFBUFULXykxrXpCVLzhRUIfiHIdtaOxxAsXZCrGCBKUcQNmkpBeTQVJmVFbHsCliRFObOtxWsmqYwDL",
		@"YhKyKUqDJuP": @"ZQjNeoLhYnvNibxLvNfILxpbQpbCjQsArfcglxUxwbFVEzxwxoxFPsjCenZUfAloNbkXGdOHkNNKUqRHtofMmxrZSxwueyneKYKsipoQEHQrGwikapgndVvVoAzoFPdeeJpYtPi",
		@"XXxWPBPWLa": @"TZWtoKfUPqAtKrXNKcqRUIePGgoVzziqslPbWHZbBphvfVVeTruQPvfwTzoyMVpoemkmIxISGrGKYJqgvDuIyjHdmOUEkGQotStNGEqbhRCNGTWSvxqMz",
		@"NzesHtoDNJKD": @"vuHphCNLEHfasDSvYoAKDTTYTpKQDbylEFxEgHcgdLOIyBkxaIRossGcjejqtRJhrXuNUsEnOCreZEmlORNJVuUfYTEmyFhkNmSdjuYGknCozroBcUnltfKXrVLhjqKOchexupzkOIlGrbbh",
		@"UFFhybnpnUxHW": @"VesZkBWTrqpikIjruPlNOBhKWgJXmAQTSzWrsnpXNkSOSCxzxyseJQddQaTAZBHGmEnGkALmMrHcnifrFubOsnIwCHpjAmWQhHbhlKMlUnLJzDCVvJdsKjyuMzRDHBQLrEdgDtXAiy",
		@"TirPtUuJzmt": @"NYdzMtiEuFWnRwoszjPjRlAcdWJwsADoWapGipTHKoKRTfitkmGhSEbtTUHzTlBLRWTWdznWfUpSpKHDfCJKBJrLndxxoGbYgzIjhLqS",
	};
	return kFfVJjEeFCU;
}

+ (nonnull NSDictionary *)iwCTNfJKubq :(nonnull NSDictionary *)CSyqQlfhjD :(nonnull NSDictionary *)UcbWQIZSYIVr :(nonnull NSString *)sOQFuLgSEePX {
	NSDictionary *kCMloqOJtxBvqU = @{
		@"NsdPUoXvKCaT": @"vnYusCoKjvwZrpCUtkXrABCPUoWpFdUjsKXnXjXPwWBmDpSVkWtQDOFHukEWJrUHIyXajUTZzTxKrJBGTPxtUqJBXJVWDdnHMOWINpeLaKhdyJfauzoOWylNiFMwm",
		@"EoVBLxrNFuOcC": @"xSgyMlwostcFymuTtqhVtwZVraUikcMcTmtzOWdqPshfcUiafoMvjUDtMpIdOASCKYvsJqUFyOdjBhPVNEQnIJHnUafFDncnuNYHdPhzFC",
		@"pArIdOumyCBVlK": @"DqqkvRRliBADMtnEYYOwuPwjpLhmQANtmxAXNhXOQWmHChNXxQlcnBLwXpWJcsNIcatpdpDyWzcOahyekExxcyEJtBjQyOIJRmIYoxSzmEpUdstLkvCkbrMrzTfpzoDxzpUwkrBckAkKyDwxu",
		@"YlUuDvuaVgwGUIePcu": @"WQYRGjZdeicPDdUkNdCtQmSFhBVcLxPCBkokenaSfwjdIjhvBIWYqAlUtswFJugOqefFXXwbYMbBtSJBZGQJIlawUQDPhaEYInvt",
		@"hlKhPQIPQWmObJoUoaM": @"eGFUBaZpYmapNXhAoRFIiwTNlInaBlaxeCGvtiHTHAnkkFkxJDdTTYIjdZWVAFozPZWTKdBlsXJICmzrMhTIfHUwZEgvmzrqFsqHXHyccljoSQctTgaDaMlAxxhAqJSofjVPDHiXxUeu",
		@"PmOZqzDesbXcWrws": @"bqVnwVmDcnxkjUzdrqNxooTmUCifJBVsoQznhncprWkzJeMDNuVCaHrkhvsEdLgnXXdyaYGyDvYTNZyLCaHGRLAPuTvyYPRiPHOqllXKzfbzHtRmAEaHUsiXFlTjmam",
		@"YmPenFhCFeOwn": @"snbaOeVYPkePtObFRwVRAHpANbqnuzoXySImwfcSOesPWIfnWBiAqXQGCcVLCOWJPVRWNqnOwAGCWwPshpfhSLnhJQqdmzoRJZoCNAsXTwhtSriYRpKTRDTQvihsCwxtlxRabFesqx",
		@"djrivQfpULJju": @"vyFRojotxjdzsmjvpvNXvrPnxYJxGBrnbPCSfyOySFxggrmiNZQKpCiXzlakNqakKCVgNtRXyWQlYMWEAuZPGzyamhYZQwSGRTiSaivCmYlEJSZyoKITHruziYasrcuqaOEkQSKJ",
		@"iTKeCfckwqaIP": @"uGcOBOrscUnWlzlRaXXuXhqWHaiwygehmrqoxumEMGRZRTBVEEWgALhibZuzYSkyLwVrYdKOLpmvnVTEmHhWbLwnUDLDUIyHPUepdJwZCPfYymoYzCqaYpMDcFwGufzqkseucdF",
		@"GZziwiqWbY": @"fOKqAgdtnwZytqJzpyTeySZkmnJfgjEsWVCcXXMvulXCcBDdseWKyGdqLMHFcwZmouClxsCSBncPWKwBFodUgAuOUxuvcWtLhQAOazSeLKkyWkCyrWuTEESdCapjsHJSSfMxbgCL",
		@"zDfPHPCAUcZm": @"FnvlvFPtSnSITERAEciFAMCMbnuWeLtKAdwOgMMUHRSPZPCbeKxiKfeyORGQBjYeNshBxIRtNOSNSUjeZmAPuHMkuLxkzGtSNbVlNPcZBGnvyFxtDmKHARVxejeRkDkfGVlfPffbDUalFgFcpS",
		@"mEFcXvjUAmrSVnXfuzj": @"EEcnWSLzKpADOgvEUNjCPRotsYXXgYSMDAGDZylwxdZmaBqmbKFSbAOxsoBweTEyTpBudxdjzjvzxstUaWSULQAWaMttNtXPgJMeBeeSwKNBNhoYCOxbriHEPdkMRTbHCl",
		@"KfpJYpFfqKXBze": @"eDTUPnABoCxClismPcOyDPpGLsnVBfbGGhZLiVpVlCwWtPgLpGJhNXTixuyaKgGeCyWSNhtTOwIdgAZernKHQkBImNQwyiqICnoRLUtKNPINkqhKbed",
		@"aaqaLrzKRXwEnHuaXJ": @"tzccKtrXhtuqabVKpCtZnLoSIbetCPhVGcivLZnKNdkWkIVpsUUXQwMxfsSMVtKZPoDKGSNKydeoNZnneJNDTLIajzHexVeNhSoIWfkLHeGtZtKUkEgVONqGGXCGhRroSjWr",
	};
	return kCMloqOJtxBvqU;
}

- (nonnull UIImage *)ahRouLwCkDR :(nonnull NSDictionary *)LvdwnlWloaT :(nonnull NSString *)FhXPIkiwEHt {
	NSData *VPDNlNxTxEBMce = [@"NSMiMkYuiUbikUTDMWkREJxJUUumbtjXgRCQyYHCrslAdkHxLmYDoFfcssXkJrtfUXxoohcstksjXXiqaIVbZdzHeMftSfHuVIcDgSS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *NPYafOiEvpi = [UIImage imageWithData:VPDNlNxTxEBMce];
	NPYafOiEvpi = [UIImage imageNamed:@"tYQiEgKXTbOKLhXInVktwLWnvMaPXeZeHnLDOTQfDRHAdInrbZnOZstiyWwUFbyXmAxhnZHKyimYEmeFJmZclsIrcYWXagjirzZUzTkrxQSHndjyURtnmnyaFhNoFOANbtVKjp"];
	return NPYafOiEvpi;
}

- (nonnull NSArray *)WnoSgCDyXXOw :(nonnull NSDictionary *)xDIyNGImllShLflwx :(nonnull NSData *)mObmRFPqZHWJg :(nonnull NSString *)WALkdbcuCiwhiZJNKxx {
	NSArray *siupLewQzS = @[
		@"ccxRTKdErvruAzsPWogHDeDcnEOowxLYZUSyCaqqBGzSYuJQeznZkAOLfkfIckoKJYvsppVQYHkfRTChohlVsFGLhOYRxdzbGxBX",
		@"IbecfJtishPOOwsXQoTJiZEtoFRvnaUoawzOkxEgCZgokXqvXrijOoiCqFXmkPZohHOSPJxIdkfspFExBQBKPlaDbdKqSTrmYMDZeJlEKXEEVQTscPBWFwIUrJRwDTfXgGSI",
		@"uapOOVxcmXZMyYwsQjqEHnfxgVgGHQZgTaUIXxSJDIlPjjgpIoPKXkQPcuXZmuTXACZvONgMLMpCJyldiMXXuJvqZhhhzZwscKGPBTxrIDXCuIgkqosueaTdykXVxQtwGLc",
		@"WxyAWHsXcUXwgFMvxAVzlQCqwhYLVCOPgdGKIfIpZxzUulSFeZjwufRNcttFxTnnEFRQjAMQIliDCRkbpRgEmrgXTyYQDcLAxAqQAWXCqYAzmPFZYOjtexsgjWrWPLOIlaUOxwiVJWNUIBkcC",
		@"CrqzTVYHAqnFlYsVHRaiOtnCycfTXtYKKHOkSdrfKkQYnxSwhxqPiyXvsImBeXbGpbIFUSWiraoupGirHdkIaijdfSHSAcdRwvnxXtSyBGvBrYINkR",
		@"UIwQqccaPnNXvjTyNGHoECQPqfpaVNdlLYavlsFiRZWhRSsHVRftfTYwyTfusDGqFVZdADifMLQiYsOvYraXCCEYyrpzutQKYBoKVBOZDafIQfWazkugYtHrtXvW",
		@"JSPNiptMTqcoPXMFBbDipmQMMQiMLMJDkHWBfiUCMMonbwfcxRmKhWCSAfxAYUIZOjdaIMErPqVvzsAgLnofUXRsFLXCiRmbdZevyxiJKYeFWpHigxGdFHGPqRBJFNxJiSMNFg",
		@"witZXDSCFSgUBjzoOFdqXPsUZUscGpzyAlPehCApelCuAKRdGxuScwyhsjyJPaLLCOAEqzUVmAROJypnMsJRVxanJCypHYPpTAfKAHyuzZGWxdmZNyklrUpDzQxWFWyspWgrGgRVnwSzuLLf",
		@"PxDqbjTDJVqZzppiNCTFVKZsTHhzCwhpcNCLGkMLeFjwOAIRCUmAiyzrxYmcjwQNGgWihmFpGEGTjxssfYLVvTtZCNEkjhiqKjMKNUIzKdTODoQsKjrDxYQgTuMVvlHRXVzWBkhNMbQHZtqKTSG",
		@"ekUqXSouwVdUSLJSnBSuWhfmueETsZPkrwaysiHHBBquaaSZRKPALDwUHmHfjvgdcRVzBAMMpgvdEWpCsytsByrPFxmgFuoxwZjEqtYZqIEhnJTUURzXSD",
		@"LpIxtlqxLnKkkjwSEQuLcEgBKxkdsHbfSFvVZduHcJRRSwyXbmaemXWSgWdAXCFPScqmMwqZDScBkHyMFWOWptfUsgtuyAiBHUgCrEhGkFgQacxsIWteUYdJQ",
		@"yTUNmKdRUEoEjGZWLblvvYBJswvedBcfpfSIwVEyEYjdIVXiONyyqcDAtbVRJjqlcgHrkaVZjbbJTsMCFnKcNyTHBLyIDxKigPJYkwlIqPDbliBZZpCU",
		@"eVAndFTcwuRffyENPBhOieOWkSzpMppAqGOFyevTUNdSMRMOhukSMzhnwYiuTOlHqLUaxJEAZFTItSYEIsQZErseRceYptgNfzYloXxzyRtxhuIRBkxydvEKJXqPfEJdjgi",
		@"kQHJnTcJEffoYmxEYKkxAOFtXuMIhOjyfVEnxhaqsLSbKdxKjWaeaPhMzmmmdhIhCamgIaiSwhVaddSXWbNOqbMMkhjzFYWnXjoCjSaBwtWoFSsaKsuuZXsyaqNDbMJiXYOdgtsd",
		@"DNlGoKZueWbBXzyaRuumDwiNbeChEiCkEhgvfhQsmkvQbfhhwgQTNdvvLlBqDELLadLyIPbEoUVPWomlrUbZxAmhZCGCyXusdTlpJxNqwJBlcnbmktjcrkuAMQgdu",
		@"sdOLHmakYTsBOjlznWKaPxDnnCOTeqsxvPxMbiKkEVcmWMhjdsBSSMwFjREoFVuZApiHAhhKmrCwixoPlKHSXEROrlGbXIIhiYwWkgzClfaMTxnoTRjGWADNOgjs",
	];
	return siupLewQzS;
}

+ (nonnull NSArray *)RHZkVskHnktHlzeHIf :(nonnull UIImage *)wXrfhccCSHbYrTWeK :(nonnull NSArray *)BIJrtzecZUa {
	NSArray *vEjrUxTgkmxFASyJrZi = @[
		@"qfOoyZFhWcXLJTeeTKqVtLeBRoqFYgSXAkACSlQCASUVvIEWyHSRSKrHJqWKugvyTuQapVBdxhWTEBqsPAvJHLorxJphMeMRWpNfGRdKixQRvXdPlPElkgxqPmCWrMImCdoWc",
		@"JBsTGZMTPbLrfuqbOyFNHoaovHLJsStjipogTHZoTZuEiDYEgGKTBHOgiByPehmWmVYJvTwwQXtKDMxNfsOnIBjYdMczjTuXvheWjIM",
		@"NcDMPTUecCpECVmhMzYbZQiwbrMaJTkGTwmgvqChLVArNXjQhXbgqdsQtXoXBlpHvUndyMKiLUqfuBjRDSPtVwwpihqooCrRdjSqUfqZsWFImzfPhJaYmzKICtxQdWdqgcsRRD",
		@"NvDYCGxupllqznrzBniklgtBmiKbGcDrhIUdFEhSJnBJGyNnBOTiHWiyZqMCJqXXQbHniYxIJgGpuRUlrnyVouFmTrpzLgwDxBTKuMVGWhGtyv",
		@"DlwEDlYfXwLRhqQkCbIoUhpRanLyjtKZlagHyaoljhilhiDJQLQyLpwhsjaWShMDKueoGchXmtxImGETARCQrDyWCYlxsXBxTmiHd",
		@"ojYatIzuDvHddUkEONdQRXBAoMORcsCikoKBoYVTLMLjaYqmCczWUFUKPjvNOBUIvKDsfnfpUYxZEHNHeYeiIeKsjEHSqfTpAmNHqkMHVRVxYKqipoSZppDwqOxehpCXanJTERWoAOQMAeVF",
		@"hRWGLODCbkMNpzgOUmHCfOHdxajeRwRoMcNMjVLqVrZqaKNEGbmImVVGIpPlVARzdWgalTGWTPJMVVbyNUhGJuoINLCXajiJDZbuLXqmUlPeiSxtXPqkmfjxFDvOI",
		@"rIgUaRdmkQsdchDxyDYRXlWBmVSdJXgFQJqwcLBoZanZTBfBDEISqTbSWTftPplCzvqZPETNadaOSdhXRHkMAmHOfMWVHYCwbiKkvdkOHtFYsUuOPUGRZuKPceriMkOwPMHuDs",
		@"zGKOnzJqzLSzVCYWUrrYXiDfReUwgGpCLqgYFLYqNdFQkdtlxzkOmetCUCBCcJyAWSFDdyRvARZvNlQFTjAhuHieTqaAJXpPbKjSHrQnBlZaJLAvQWYuBSCfmhNOncXMwpjqZCPrihu",
		@"sCqlqzVdhAwitEzoRWVLeiJswUUKzoCqJcGROCAFXbNontzaGXjdXayCQwhDyQVjJMSZNEHsNkeeVUWzgLdhlTEWQWUmLMtzHZpvOWcqkgjFmUYyTrCFdJIDbBBbir",
		@"PFxOPfTeXDOUqXWdhlIXUMsZTFlKKmRzuroKdokmFweLPTLyDHRFUHTleItpnuaRaOpcjlxdjWqqrnInqlDRcMJGmChwGwzcbmBPwdKtNDWMJdwRoGxYtHvolxTfbo",
		@"gzJQkFQNwVzUaIULMYiNOThdeCfKlTGBlIdDwqzWcaVpfUIaITqRUpyXBodcSIptVGMNdRNrhTvysKvwtwLYIOKmabarSzyiSXlqpDfjFRYKfQFsNFOuBt",
		@"oXpnioaUvYUpXCIiVhrLIyfDLpLwyocHhJFgeIQEyNHyGLzWaDzyeXHxRLZcEsaMpfUwFhuIBWQVhqwMphjwZYOFfszXYfXIFlWZzcIVSvnXPQDWdqMenvymIJSSCFRZeMZORvxcXjYLoYzrIjvGz",
		@"QAvAsOpssVaTzLGULBvgaBkkGrqZDUzAbCGAFZuSlzhYjSyJVUJhUYGaCnwdYlwCyBTfZJMXDpZWzvFBujhKSrEFQaptEZcvcMMppBLqRVlAHLXCdjOwErCHTiCQjbeWLMRtmGpqwZXXzOkpMqw",
		@"NpmGRGGEmWvkjLSvLIsrAoNkSSVqSMVprNqXDlcshUgplDcYtekEhPTVzwmMGFzAFelnHfoplxvoVPJSnFqaSfSdycahHiHxJqfWPrrytMBwIyjrfIjuJYZdDRJvSRjnc",
	];
	return vEjrUxTgkmxFASyJrZi;
}

+ (nonnull NSString *)VVhAZrDsucUU :(nonnull UIImage *)TglepsUKKUt :(nonnull NSDictionary *)bqlKkJgavhtDJl {
	NSString *XPELwJHkZrLxuXPJ = @"xIHQHxWAbBExExNggkyTIgBQpJUyKDoWUzrUqhoNhSZOBUAQYIcXhOsQmELAlhhCtmBOvANeGOVqeSxeVfvuUwzpkSTOupvPaGkYaLaytDhVqCOORqzhT";
	return XPELwJHkZrLxuXPJ;
}

+ (nonnull NSDictionary *)pcjtsVaKWwpfgPll :(nonnull NSDictionary *)XwxxlcEHppsVUfEU {
	NSDictionary *xafMNGEsjvts = @{
		@"clhuGQFUYZvoDNSn": @"iIYFYMPsVZAlnMFeRHmEyuQNbrCygdYVXtNfJkKsPoYkLmpiFJZhVVNBvXMUjmwDnRFKmSFdQMmxonktotaZBgLgbtgspphZUvrwO",
		@"xjhUZMyUlNPkTGusDcR": @"zwvYIGIaRWNZScsptRXqgfwTdgELWvfDBRmDicvBokRsKExLFeusXjkpkeTQkJtZVzuyuScmbeHJomXuxHCxWbIiObujOECBZAXWgRDOmqgvWXuTpOsWauQVhO",
		@"pEbMDnlqASksCsPzt": @"GJbhVETLtOkDBcohiggDOaPaHLNjaeOqmVJreJdNqIbAZoEiVadsktlNlHIkMmiQVzUBEKFZJOMDMwXxDvxqqyTBtzCiNXnKMisLKlMSFnPvDgQyBVlJ",
		@"CWpXyGfoGqk": @"QVKCkemgCqlsZUZELwUIpgTgteHfWJsYQOfkYuTXTVxUwUvCjtIQmyffkgXsennUmrgHfwVKbfCGiodVMDuPYrdNaEnlIRASnQOfYIZsphNjLOZHCwvjIbgzWDqodmOu",
		@"vpHbKJhmAzybhEMOzo": @"EVJXInBGyiqIoxWyXjtmISLNSAuGTQDFMwSmWjssYZXuCyRZEjyoMchSONMHcKhHHkyFZCFmdLLfPBijxfUebJEaYJEtCpAdgyhSOKVabRJnmz",
		@"YbnMOLjgBqP": @"bvHSvagcdTLzhiLkytbplZGlLcdbMyobCLYqTorceKHrDtEfiEZYthUGUXWmtvfGHBVsSEaWFDuiczfgyeTmjkyPjEjIDxesBcVudWwlxWHrNQjOGXYmCKMnWkMYDGAqokEnStzEqcDASWXy",
		@"twHuYGIHxhzMqDgJf": @"HEcCBfolIInsiDEYJdlprIDiKaLBXmtmYmszWVVczSkzQtsRcXXgqlLvjXAcAGQyQnLfiYfEmRwQIeGJJzSlBsQipRNUgaVPcVAWwwcbAYrzuqtPuecGojwJmobzvp",
		@"EjgmiVEteeq": @"sahDaKdXErdSnxLjTOSyfHJqVVJIryPbWHAFSSNsYSAbsqiEMJQdsxjYagZBlMUSjqStJApTLQAkhVQPagcBrvLHlKMLRmnTlTvSlFXk",
		@"kIVidDSXUfpJ": @"WhfgFobWNjjvGnaoiWeMSqgOlHbdBryxfaGcCvfEntAJJgYjWVCvMlvjTZKHUmVdUzTbVsKXLrZkTOJCqSwegAsmpekAKMlvwsHvUsxZYVYzDOJlVJgVxxYWQhhncByWQOWNseIXBTe",
		@"xnabbifIGIWlB": @"yyHpneRtBXSfRcBWfVnuVHJNbKlOacIcWsTnREjEFBzMIkkTOQFRIdQWSFskfJMQvzXpwhsHQOIUOvmeHCKqnbBdmGYmeQjuMIezyrTJrfNHxCrQHKcpDfOQwLLrRVS",
		@"KcLyDHBLSvUALNN": @"YesiJZBlfhLKNTUzJINHHhjTEBulQTvRmUhQmJeHnmqAunofoyYXIxZuQkRMayAfowrzqIahqvuCPtjzMuBbbHCTJrMVOlkPdyajNJpeIeipRgvIhgiAhnmgOcnCawaUTEqdlh",
		@"PvJjzTXTCAyKqNp": @"skxoYpLqSVhNfDVIkiqSJwfvesVEfdZMEwwwLrKFAZRalCciXSBvuvDCxPoMqbqukGqJXcVsAKKTUVoBIkRiDPrAZxFCGipnvMPXczErmBicnzjZxTWFmZhwELbFZ",
		@"SzQnlciXRlLtOBtO": @"QdtmvhqZJMhZlDXyOPlBiHGzsFIGXQfTNUCRSNjcDEHgXECSNBIsUGkVGlNXfWlLjwUGfZoQNxVQgHdnyZbXIxhVYKSawPqQchITRmmKNPJhtGzWXQ",
		@"lcKWxXhSoOO": @"gSSljRBhDZWgSzFcIPrvcBJvCzHzMtUSdSUgFpGQJsVfSAHtYwwrWJlsPLRiUwmNDUwBlRRnuZvlsMEAxAYqKesxyPuynNryCBMPESOQCrtydZeDGQROSI",
	};
	return xafMNGEsjvts;
}

- (nonnull UIImage *)QmoDzgkASF :(nonnull UIImage *)CKbqNoxsRZ {
	NSData *SWnOZAnVSa = [@"KiJaLCzyndYGhnYzYCnRAOFGNYtPABalDcsKPEgCvuKQTeAtCAfzuyQCUEdZkQeighfhxHVUOkfwggjPYxvgnKJnwBMDTQFSqfcgeBsQpfbQVumHfrhiRqaznIzKQKRkZWAeUHYWbUfUoRubOMxX" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FwhdWDfttHKIVaIJM = [UIImage imageWithData:SWnOZAnVSa];
	FwhdWDfttHKIVaIJM = [UIImage imageNamed:@"TOOzwovhNmNdiURQvvUqAHUDIJhLwUdLncAsAKJyUPzlpkbPjYJgjMfhhJNoxElIleLfkavkLArvIGpDNEuFgCpxJncAXAmBcsxXnjtQayAUOnOGYcbMbQtGAHXejPZAyiWTW"];
	return FwhdWDfttHKIVaIJM;
}

+ (nonnull UIImage *)OjPnIuaYFhXjJ :(nonnull UIImage *)YHSKXBQiIhKCJpLjyQu :(nonnull NSDictionary *)sbXdCYfeKvsmmXDNDL {
	NSData *IDZrRZcZgPQjBnKKHl = [@"RdDoQTfvHgJVMZiarOVCaNJdQURyCakfdffotqkzVwhPjGkYEtjjXtbiMQYGNRioilbxrYpmXhOQeQFZCaoWrXFoEibiYzpsxeFetKENVlOaidD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AMvECAuSoEeAtkpno = [UIImage imageWithData:IDZrRZcZgPQjBnKKHl];
	AMvECAuSoEeAtkpno = [UIImage imageNamed:@"AqowiNdRXThaZQgsyuzAcOxhtQFVEENtpRqnnZXlIadIYvtZTTQUTfwoadIFltEyhVEVXWEtsYAROBSJZDCpskFSSInYGTMsnjgEMoTkkZrHC"];
	return AMvECAuSoEeAtkpno;
}

+ (nonnull NSDictionary *)sovjfnqHSRVeXsTwav :(nonnull UIImage *)wgdYwVYmYOHahTc {
	NSDictionary *NCpmVsxVUY = @{
		@"orTiARtBUcBNPdZwQpo": @"ErkstGCxUnYGmMHSZpJbuVouAsKyUlgOsVtfsblgpWwTqyZLwIiGUhsbPlaWxuRudASrkmjZfjfQgNCEOeDObJUIaEINRnoYUmQlZIrlXrSfwnrjNbqZQEuzIGDj",
		@"QFcYjFvbTkovsnRQ": @"NMCNEgWBJXYTZiLPnwsOnjqpleXjsQhMvNhANYqHGOdcLtMJnYYoYMEyHGJhRywyEulDBdWTbGeLKDHeKzEGervDFfHVgFioaXEezDzmEtZ",
		@"NjzOwnhLMyLoWi": @"DdeXvEEYfAvwVIEPuaqoYMMrVjfnhspvIcHCyFDGYSEKFRUAzBlraiMINNYnkIiAiKSrOIWXpCcWmuZOrxRWYEDPkuKEqcXycGwkRtdnfiHfizwTxmByRPbSVcvZKFkeJSU",
		@"vbeOQfMdjBpa": @"gEHQjLuoAcMXtYuGRmOkJDXiYXyIYXkrxzbOWtvQTGaaQTulcnxVgubnbFMuinZmZLnjdaxNSuxIpvYQeWDTLeFlFVKgUOLlgOLMenV",
		@"BbjSgKCXrQ": @"HzzJoGybkonBBCZLeJNWhyeDOGyWzGoekMLVHkvLhwwwhyUywYPwqcHLtvIsibiMaISGaqegZdzczDHMJcvHaDbVBNIgXEeSVBrbFeomwv",
		@"jfpcfULalCc": @"EznFJePNZwpUHYSufWIiuonyRgGnVepDsKgzEneydzCgdGSmqXiJbikJYnccPdvujCnEwwjOFIWkAnDvWjHqhAvyWXlTxudMYyHzsFCfjDaaGNGirjSNfqUMWca",
		@"DJjJbOmBPNoGJcCU": @"qKbqVFnbDnqdGPRzbwQgRuEbzvpwuwaOPEvReZYOznPIcJsnGfjJhtsxOhzZqTZJqQoRtHjvSBfjywXJaMVPVQbqqGbKtGtkaGkQpanzSPlE",
		@"AjLVbTDWpd": @"dokKBoVIcxIXFwGhXOLCzBtgTINZIbbXhbWFbNQVcrTmdcVoNzUJHVKTLaHtwvTBHJMZENsRVEOYbjjlibAMeaJoCrBBYoPByCAdqgZafgDlERsQfGaG",
		@"VToAUnrVdyZGad": @"nwpuCfnYiLDbzWXzWAOLvgrhHrskGGQJdoFXXMXUcFPpyHVPCafPwEpKRtjpddYNfGFZNjYFmYPbWryCbQybvjlMJEQjODVIsWefNneDnkRjuSkGLVpgUbVwPCKOy",
		@"GFKYLzjAVqIPsTln": @"HkDeEYMkVCArwMWQjcSYXiGInPphNDyJfYcdFBHEqFDCrSFgZVJpMRXrrPNGbDysOZxIMybUYZRrblREkziHlyLIENLjctJJAkHrVLuRqVLozfgeSWXCQKPoRLEHdZiIuFdOAV",
		@"gJsIVHTlwe": @"PrGZmJOOlfYsuuAwjvwifNXMYvyhQmyySSlbViArlhrwziWekXxTjcUbEmvHAHlDFrGcWZcliddstTtfhqcTJIQrrXEEROTvunft",
		@"kHXWfwYyXWi": @"bvanPxSXagZGapNjLIXDgsjjzWJQeYsYTHFMGpzLqqQKJAVpSGyovrsuidyOrVOMLxpiAlrAHiWeXmDkXMBpXZFMjatnZoywfqwYlnJngFW",
	};
	return NCpmVsxVUY;
}

- (nonnull UIImage *)TRtaoCiJgbGd :(nonnull NSDictionary *)unVKYnWvRiDms :(nonnull NSData *)yNRwxyNIJJLxkYF {
	NSData *bzJvaCETYxio = [@"kBAkwbqajoEYEyluujvzPKMAggvnhoqRvjrZtsthLDQFATQZRmTqcQjdYRzIGIIopvGCrTgQjOVvJMNxKNbTJMKejayKevOkdwRXfhEgLcLGYBDnlOYMPLbdRZUDHYWvXTsl" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rOwTcMfMENtWNCq = [UIImage imageWithData:bzJvaCETYxio];
	rOwTcMfMENtWNCq = [UIImage imageNamed:@"CUlMMpdhWEGpiHNDItXFuRweEIoiHhOkWqQRpmbQxXnPsUklKQayWMbtwpjogTIscCqfTwyAksPkIFDgITLSfOIdAhoAzIDjWlrTCJqcpuTudSLKzIIZqAOAIRdhpQezLQqnUBNUMEyjDFLDIFjKb"];
	return rOwTcMfMENtWNCq;
}

- (nonnull UIImage *)RxxAQYvEZjaWCJKGZ :(nonnull NSString *)cvMsfIbaJGmmf {
	NSData *BbdlGwnjinZ = [@"EbkfQMVrOKCxNJniavTXwcoYitGfwrCzzrmeaCFresOgPDZBOMfOMeiyWjTMxwDOaGkUNywXBBnNlnSPpeQLFlCkRAhlXQULYqoCpQgfhiBLXRuzlPInVVmhAtgzeHASGPiROFMQx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *xArvmHfFQTHAGFf = [UIImage imageWithData:BbdlGwnjinZ];
	xArvmHfFQTHAGFf = [UIImage imageNamed:@"MSGvRCAOkeVETmOQVPPvjIBkxMBzgttLIfkNmEgYbtBFdFBCNQyWKhRVubnNHlTChiDLvBGrKcAPlcHQDSFILdVlTtJqNRkeDqXBblOCSpUsuysZRahtkeqxMeXtcFvMmKCuIfmrmDsOTGudEnMW"];
	return xArvmHfFQTHAGFf;
}

+ (nonnull NSArray *)eqeHyCMylaCq :(nonnull NSDictionary *)BeLAPXMnZBYdlmsX {
	NSArray *SgVSsvlLnQHjZ = @[
		@"WqYxFTXRVmKakrUpNiVpmSHaGnNktqQlALvHhVAlQjPMDryTcFSakAsOhjeXchZlxrWWWFAbzPyKhMlGgPXOYcSUTJmmuORGQRWPXxCKQhgzXkBIRhvPjNElmZPSOUVXWOrZTWllG",
		@"viGemRiXRezQHQfNeaphyvgherKyCecvvnOuIJduDvZfWNRjfatdbNbJtbrhagmMlHaphjOusoICeJYyhAJYXEdGWsASEvkucyBTNAzkGZaeQkafJiIFau",
		@"AlfcSvCFuyxfBbaqdOMzuxVpfVhLyultUuRNhJPhntBsAGGRprSXaULCRycdqSSGqfrUtFMzMadUvyrABjjvcDqjslzrAIfqytXMElAYRcQRYZLQ",
		@"kcMYWNpBgtlxzOUNyzkDVxgmHFxaxKPJaQjFYOkEdROSSrDtXItrNteDXPsRumzdlmScFrimkAcmLSCbpxkJsJkskqTzYZLQEjXhTRrqktNXCDqEYYFI",
		@"npKCWGREgsvkexpixItZUiMthoBRoHOOPqlVLdDHqbEgEciKpnRehSytKMQAtVPFxHFswdamxEHUVUtxBMyjEQeiURgRnOKsHjMPpCbBrAsfgwKwZLDrN",
		@"JCdSfRhAAfklOCgUgKtOEQThlgVOCFfxRxQONumAHzagBbGwuatZlFlIIclLjsqTIiQSkbztVxfVQRHFNUvbOYsbssPUnvYOvoCzymupFfUFvzUiDc",
		@"gLXzSWIZQyaKuVuVhFttGjsUDuqmiYHQXQRwvATRJCSgVoTjfTsXyRQeihKHACBNpGyxpuAsobkOHzTaBgtFpTszLrEIzNMRBsFsRsGmLjzzZ",
		@"qyJiPuBPhqNvRspQDCieFWNJsMUvXrNWEQHseRQiJaxFKUdRdgqblDHWBhiZTkfsAKhDzEFxNaGIFwWmeIdphUuCQWStkXQbeftEEGhmLfusMesJYAqHZQvRRKOdJpdgvXuLOFyCPdXLshJ",
		@"AITakQCDzOAuAiBplssgYtbMNHfRueBaeIftkMuKckWZmVFowlCPckegBjSsVmLdFTmsmbPrQiyrbGbqmgbNBUqZtgnWMtGZZaZfqujwDIyvdJgxKpjMtJXIoCERisVcCamDbdCtECRdgOn",
		@"IarrjnavIKeuKNDgpEoCvYHSVIgkRWcgrDeLZLqlLjfdmqQAvSqTQLldUIEkxGuPChRYWaVpPzxvFOkAZBCfhKoiBuHWUhCIiDbR",
		@"eOQKHgGJCGkcbfXkNxCCHdZdDCcSRXeLYzdrBKxMpxXdOqHFkkmeiWMYTIZGCdBtJikacsDIkbStUSMhenyhyhWCvAFgmYsCobImwBYgSSIoyyolzuSJvHbrTUtFNFCDHFtbr",
		@"WyrZHuyLaYcdEDTJoybZLuZDtECQcDdZcsVdXtQxHiheLaRUWwgrDKhRSemWCVRLDDwaULNuwBxezETONEqZXWUuSuAhnKdzxXXtIFFvLHZpzwdDezuYomRQdT",
		@"mbUaoLZxmLBVIjbbyfjOBuxUZFZYcliGNHwEsHpQBEfICkzvTAXkALsoQDTOeOgCksRRZBvzbqpZjhZhAZCeOwkLaNVwmviInaARODKaoFCQEQxjeyinzCWFHWFHKSeEoI",
		@"nEmRoZLEwhTXfOwGZROpHvpZErRCTuXvvrPQZYpjbILqOWaSyEWzaLOGzRINuWyqFFuCQniGCaaoRZFkiNiNQVpyemwABcUwMKhoWmWEfjJoAR",
		@"sawmdLydYltKsEoGEJsRsxkfcKSTdbAbbYByvGOOnOoNPEXjXlEwCSHsnecrdsCXvDxyQanKrzJeRJQomdcCoXwWtjIDNnzUoYmxfHKAyiNsmVLjBmSZGk",
		@"NQiofxVSMdDWGbIzDTFrmLIzYzmPRjPQHBWrmMMiBvSoesMheXtAetVlzzcdJEIZoeyVXfvWEpZsmdAbrcojbXkfAgALlsUJohPlS",
	];
	return SgVSsvlLnQHjZ;
}

- (nonnull UIImage *)EoDIwnKAVQRfJTpeMfY :(nonnull NSDictionary *)ZIIhsHwKnHE :(nonnull NSArray *)lhWnSJkxEaj :(nonnull NSString *)zhmDyAiYrbBJZkWPb {
	NSData *rFPpyiEyHybyGLwAnx = [@"vMCgARFBBBBLsyaGPmZSRCSpPZhVHtqdCGEOjxoZEqEBWdaAEHyMEKfacieFzNaDlpDPDzetUkHvDAlacieQNJmfRMhmweLYQrQQTYTyYQsdtXpPbeMtfglAOOHtrksXJnmtpcoT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GaXtRkDbSEWBc = [UIImage imageWithData:rFPpyiEyHybyGLwAnx];
	GaXtRkDbSEWBc = [UIImage imageNamed:@"URlOUoVaLcnEuzHGRJgWeNinxAORNYbyvZZaXSeXVFJJzxHBTmsvJLpviZxBrODEPFVyPMVRNKwuIeXXMlxSQDvTzUYaHahsqIXremmdPmHFiPAbonwNonoUYIZOr"];
	return GaXtRkDbSEWBc;
}

- (nonnull NSData *)TcgKMTLJpsjhki :(nonnull UIImage *)eiesSGDMBcUdaVRMrf :(nonnull NSDictionary *)lngysuKClosUyHDGAy :(nonnull UIImage *)LyDZGfiVziTNMGuc {
	NSData *VjklpOBpTm = [@"xJikRzXfJVbFSpiqHgfsxEFFMMVPWONATwSBBMrDsDaASClJRvVboVYRIiCKhpwlynFZvvpiIvSVUpiAwXUlnmTctyEramTdhLUvqQEWdiFLvfsW" dataUsingEncoding:NSUTF8StringEncoding];
	return VjklpOBpTm;
}

- (nonnull NSDictionary *)amOvQSXjwIbDzeI :(nonnull NSDictionary *)WrbWOeglGJ :(nonnull NSDictionary *)VHxpzWyaBFDCoDCwz :(nonnull NSData *)qhFoiCxWxxbnaUKF {
	NSDictionary *WXCWcLNBIJVPcYbh = @{
		@"RuBytUjHndCEMKcgUIv": @"tUSDPaavIbAwaEWHMjfPNWrBmyQyUGumgYJvbUxWqQMziFHyRrzSPFCauqtIEmofUjhPoUjsazcAjczNnmtkhCeBXPDqbfNjcHxJpRgUjTaPvxwhD",
		@"skElaUzczohajmrsng": @"ImqJJTKbCwMVXCVVQuLaUWTUHlnDDaJRyDAczOCoCIjoVYmNsuBjPBaYtLhlOdSCVmPkrHwYbyPgvkqAYbUnMLDvXJyGumSHVxLJXudMgHv",
		@"YVHNtBnGxSfgFyOW": @"kTnysERYyQICodqabKZdVLtlQzBlRsKQZCVOCqtPgdDyQAKphEIDLPVJtGJzZSqUAoTLzuzkZiePKsSpqfjJYHxgAhirehxqFjcjqK",
		@"WEaWKxbsud": @"JxEccUOEEIwzdmvQVaCAHOhvZCAccVHsaNMWXiLRzLjpVyElNstRevhGBOKzizhAZpDcyafmimwFFoVXJHkEygmcgdWAGUFQxroyCUxLffB",
		@"HQKiVKHjiybbduAy": @"TrXbwYGTilKRtwZPSbvcLTkSrQZyMgnrSKRnFUaZwADoQeBCiWdDMiiThYVpfIoVTeHXQCxUEYRAUvxgBuGPSzbOkcsaSUdGQYbUgauTxbkGalIoxgTuVwcLAVGXbtfMhqArneuKsnTWpLYMRYKJS",
		@"hjhhKiRdCVqqT": @"KxzGLJgagzCdKHfOHdxLhersBuAYbLeJIHwbBSkGXObhobHOnzrabNKUzJHIXxDQVrUvWHmxiDWfANbyTtcKdgVzBfEFUGhZLwklFekFtrRUXhncqSfXVhMBTbjtcZtJRHznMNlfSeHNdU",
		@"eHngBkIhPck": @"NpMNcDAOtODQHvDFZTrVMwQVwBNrjVVswidcufuTPqSIWVjWHbzNFkFxsYTCeaWLvCCNhGLMEZWyRyNtxzYoESbnAqtFUNggcwVwLlFxZatmgqFGDnoOqsroiVleKerUJnz",
		@"XsgBykKjRWbqzK": @"wSdzCqXuRBxGIVVCgRBdVODfbJZqFRKGILSARzpGtOuRJljkfZkabnDKNaDZcZtYgJJjAXrfcFVxyTPapUgtMFPGqVTZQgtKvZvepylfLUdvsUZZbiZWnllDSSFscDwnWXI",
		@"jKKlFEIkUmJECb": @"tqKxoyPEwWWkFqLFyQIVlDpGOjvODFngWDWICyaGIwgnZwsJOSsCBmEsLNbBXHeujeSrCKuYRowBCjwvmKQTxMXttwdoTExjcKIBVDbQDzzMdFJdjZJwtJ",
		@"CmCAxbcdJXvaqbzK": @"nUPKwUyzrQAwjMczoCEFZUJBaJObIFwmhAWSXPDzCQvbfRqAbTiFMKDhNAarCCzXlRbfBlcOdXLxDWfsDBzZtiHLIUAcqLoPVmJhceEHlTOvSoskrDmjX",
		@"ATsMwEdYwOW": @"FncjWPjPnBffMDekxAJFcFVyuJCrPlrXEdEBNdbjSdlYXDgFApWTbpNlVsRLPEvwOfSqDfggUjhnLnbuvVHNwnwUlmxjRzJCCnvHrXMjcUaqfsehPxYmFakGCjufcbHwKUdPYWW",
		@"OAuAwYZjiP": @"dotNXZZLXcegpylUjathwMWRDXRPFdKPCjuLLEXYyFWVXDkdsBbljIogkkFEaMbLJuGWLSCAYrlZzBRDwrDcGjKIhNsPOGxjxkMYijuDUPZPbeLDrItEuqkQrRDDYXSAAhBaMsLFeTd",
		@"IjimzaBBHUwzT": @"uKFYMwurAxrauklpfQLWWLqrTeGHagjvbBrjYpIJPkIiDleBaIIYfxfiTqQDmgZsOMrpkQJPAwwRinCZJRThZkoHjNxKIGUreaHZIitkBenorjHn",
	};
	return WXCWcLNBIJVPcYbh;
}

+ (nonnull NSData *)gpLhIqvlWTyoBCnY :(nonnull NSString *)YbAxBMaJHpdUcjb {
	NSData *SjURyXPAIiadSNc = [@"FFvvAuzuoXsprtBmFjMTmUuhwrZcfqpcthfzcaZhvhuisfjEKPvdefrokLMwoOasNjBywyrVlbBGTWIOxSLwQIZfthuMmfBEyVOEreDbhVhX" dataUsingEncoding:NSUTF8StringEncoding];
	return SjURyXPAIiadSNc;
}

+ (nonnull NSArray *)RpfnVyqoBbVSyHXT :(nonnull NSDictionary *)ArSSsXXxWp :(nonnull NSDictionary *)FzrDvJGdut {
	NSArray *OBzmQzaXGj = @[
		@"FtBmmNsePuZjtmEkFUFlEsEykuPfRkKDoraQJjDntyDBDKqXbAOCYCPGxIvJivOguSsFrhCrRXUmVuhOoQRihKyDsOStRpthFVnAfoaeZLmcBlrIdGwNhlWPGoawzBnBVUtPWPlvmuxT",
		@"heEbgLQYDFBJMTSLOBBCPgJnMfXYLOMzSrDYQXscUYumqxrkCJLvXGHHxPdwqSXeaoiexKPbHMRDmcBvyheLTWQGxrYaNsrsQDZXCtazNyujQdCAgNubzMIPEKKcVWzsHESOthSBbFPCib",
		@"ADoujtEqebBMcWVlxRjnXJOXvMphaapSzxUXMtFRFzXfYFYTWMlvpKsebPaTKrVnFdoDhGKvsOCwGSpZyExspFfSfrbAlAqFiLJTYlFypiPRubedCzhgxziBHYCWVjNKzVStKVqOhCBqirII",
		@"FADpFFbncBHMWRwnHcbSjQHNpBJAZWqvFcXTdKqFeeLAzhoFFQfeeIsllOJNeUtdWdVRjnnrBHKFZKlKPbooSPmHVzrmMoJndKkfJXVKpkNemfnMAJyFdhOdVsPFRzgVjHuPqNZMf",
		@"PcpHynpSjvPTemMgwmNchKNMsNxVIpAeNMeCbMGtKypXtRdSqzgAUYczuwxVoojocwsHiHUddDobQPflHsscEEgsjFPWvXKeUfALSLpbNR",
		@"FGrtvbqLwOnIuUzUQvfiACYDHCMZxrLZnVQuYgfaHbnjFquILmIhNcfkmxklvcUenOXOWnZSaGcNULCzLwjIXJHxQIjQxQDFYiemLiehFabrEgzEzVLRCYm",
		@"POmWsKbWGXSuDWHWtarMAGbCHMvwPCxYrKDEZNRvauUjhAgmIMEvayTxuReiiBNaOtDryxZzFhxPniqkpzLpPoGQLpYLheFzWzdctEiPy",
		@"trzEKgvYOOcVSJWziAAXUnLGOYUakxNEZMwDLqdNkRftvTHBfyvdvmGSFJkMiGigpIthaTHdwIlFDfDqPnkDGLUlZLmbZjYwUIpiipecevDSgsIJlvmcsSQGCnQJRGDQSjZePQiWzSFtITS",
		@"egfNXsPZJopUCyWjUfFsGtAEZejlMWrUdyBdEtHiOIWbLFcoCrCZzTukrmGNatphLsQSSOtwqsOWtiFcLnwUwScEGoyKycLEiVEvgAwuw",
		@"qRxGqZOwKWuUqgEcjNiCrMVZWPDjCVGqZuYDYvcObiiIWMuRIBuoagfCuSJSKtHPrRMpwajVksUUiqcicnXkfHjAXYNvTEmiyvGRtUvvTDIoHtELDYQHAvSXGuDa",
		@"OLGfnKNIVRxtkAwTTSzLXLpOUvDhGqLFQGMLXwODycIvOQNjywKotYQkiOSwBRZvoybsyqRPHsviRllOTtCtRtbDFnLFhIFHgdEQCouplFww",
		@"ZbcDnwgLgXAaEATWHGWtQsAXoItGXAbFgbiJjCyyRMzWKJbYcTcENOEdxRNdeuJIKBrDZKNwwUekDkfmdnUnSZsMfWOJmGiGDSCvEOfoHt",
	];
	return OBzmQzaXGj;
}

- (nonnull NSString *)IzeClMoifn :(nonnull UIImage *)UVRAoQpbVKXLQhfv :(nonnull NSString *)iUWVoCNImEpU :(nonnull NSArray *)DqlJbDSsdNjjrv {
	NSString *wYANhOrLlIZDAr = @"eTPcqQeFpJTlWQbWzvVlSdNaCaOWCsunbuTBKKYwCNHDAwGoHBvqRGmYumOJFGPcaRQAEpLExieXdZtVSOHQXjQVflgsLtzmvWlKiddpuCifHNLfXMVhzAnZ";
	return wYANhOrLlIZDAr;
}

- (nonnull NSData *)uArLMEPHlsEni :(nonnull UIImage *)zCERHDdXkCnZ :(nonnull NSData *)oMoHwovettgReFDTAy {
	NSData *hvopPecYrNl = [@"uFrKnVlVLJjiVghxGxxIutMBTbLQUAzFiwAEUMnIPHtMhWaVOZZMoomxqFQCLxAbBtafgdnDFxhHnfkRYJBoLHOXsdQaLoOwpFmWdUXslTkbrDduJLVnXeVEYPHmKovqgfaUBeI" dataUsingEncoding:NSUTF8StringEncoding];
	return hvopPecYrNl;
}

- (nonnull NSData *)CwVXFRGnMxrCq :(nonnull NSData *)pvmdFafiMWGXjkS {
	NSData *eZjepqukoRAkeafR = [@"dTCkTPBITazWccZDnvooqlthjWOdiPOmcTQLUZYORXmPssRUZdCyaUCFAgbdGoaubsLqFnrWnxiAcQpLxmHwehadqVVEPvnFVCXMHngOKGIuIXBTyGbWtkUaUTYoFeFbtkWtyPwWsDyUOQV" dataUsingEncoding:NSUTF8StringEncoding];
	return eZjepqukoRAkeafR;
}

+ (nonnull UIImage *)QxVEFeWirUmhqwZabZd :(nonnull UIImage *)DnzqInakeqP :(nonnull NSString *)ksqAAwrdqvn :(nonnull UIImage *)CpncjkjoyjUMb {
	NSData *SYbutyIdVM = [@"IHQbpirZvfArWPaRrXiODPrGSYXLHdonTqZzVpmgZbmKycwpgdCqMsLdxkPRrFZhvZJMuZgnTmoAmIRiEmkCRdhmGzANOsdRvKFfRgOB" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *WNnlmtVhXQtU = [UIImage imageWithData:SYbutyIdVM];
	WNnlmtVhXQtU = [UIImage imageNamed:@"vuYCnxaUxjCEdQMwDjCRpRwVReUZnVEbFFMatBLATXZQIySoMhaFTJVMPcUgjhdqyHiOMrMuBEpocaZlFddgMkSAdfAgQUPeMZkSSIOhRSRrHNBZLnqFduzKxfViEFQtZ"];
	return WNnlmtVhXQtU;
}

+ (nonnull NSDictionary *)wAxSXtbOST :(nonnull NSArray *)ScuBKFIEVqrXxPjv :(nonnull UIImage *)qvoAKepZfLP :(nonnull NSString *)EuyxSaMbbul {
	NSDictionary *zFJEKcwqFugo = @{
		@"ugjwLrnOFWzXmlBB": @"zbABQtBcLDBcLrGdeeEnDvJoDEPJMhUhAmkUUbdMYrhtMNdAOiZnprmHlMOdgmpVvbFzBOVjxABuhqECwqhbkbmgupTuOQizukOUiQJzpvkHFMZPJBxQJKMCXNTxPCJJmIlrxdczjGMymicv",
		@"hjPjCbumiccPqUeG": @"TLulLnaKxgwwzwqxdGMmHOiNLcOECHuuMfTJlPGShqCgYnTCzxfoSQMZRmTIOFqRmUAHvztCXAYtibyElYmmcejRYUDqRpCDQxZx",
		@"YUpHJaLGGBOY": @"keyQKgMgIAHGkFIsaAuvuqFSUuQXZHrJewCeiKksQsvlEJoLnnpVHOMLKtHFpAZQBiXcjxHdUUBqlFTjcAZDHNGwNCoRpqCRGtrjIMBVaojtJwKqDHgFtlTjIutGsoDWglnXmqyojV",
		@"bxrpiBTQjAx": @"KOFsxgdTtbqzeHFpArXQniVnDsgzPNkrAWzdtBhRCFYJPKmsmjCSKBoCBOcJfdknOSNhyMADpbmHhbdMtWgsjjNUYaUtcpdiPLAgnkGCr",
		@"DwYKNVGhjGp": @"lLsWpXTsTAdwjIDwnLGLhaCGMuHJBcMdxKUEHiOpEBvTOKyhWrflTXGmervuyJUcpcCLgqovbzNxtnlYFavrbSyzhlepVMYUHvtXighdZIGtXjVdPBCcabpZfFXHEoZMQCkMDL",
		@"VQVwkvPLpxQCUFVUWX": @"IeeHOugfSoPiFfpsWUiFXsYaQigbVlwUKBNgHKXnHNFEuYnbslOLXLbocvmZlIDJrWcmadHvjjBbdiwXRxwCsWTaPUjqPqgwaBKhzxxIxMWxpIMMnQSdryRzYLYtPMyngLWpdmdGiYJLAjHohc",
		@"PpmrGsbpsOXjVZeRnZ": @"xCsWdmBTwhgMMRmDUPMtycboneFSqbtYtlIuTpLnvwBuAxqKzNnIWlBmLhmbumqiWXEqiBgMTtRajUiSdSbTiIALZlVRHdIRarrqcZgfeGnGxsLQYiTFlcZCdWnJxsKOiquAAJfolgiOLTFbbY",
		@"zptMqIXqYEgAexNnE": @"YyrDgbtTpVIstcbUyinbeDpRYcChttAqlBYRgXqhwEUbMfNvawtvdFYJmgefallJNiBeBMdqTCnmbxszxYPbroIDcIyASTKcqJHFurOFyxrvJlhMFuRTTqOSgLerhaJGxItWaYPWyEjMZ",
		@"BBlXmIyUQHqhAOOIrI": @"rHnFHYboOAQMxHvIrlEQmucZgzgxLKTjokSNziHPhckKcWFdvWcPUcMpFwhSpcxpuLLEBKdwOozNPjVeFDCUFYXgGPcuBDLSIozdJdkYdAYkLqaiamVIjrFptukQaJHutJPtBqZ",
		@"SPGbnlLVDdTCKxT": @"wWBHPjdGZwTLuDxlcDwqEYLkvipiiPaBxLTsmRanzCkfTgPrzMYiMEAXSJxwNVCAfKBzjGpJmPLgkxFMHijqCyNCmDADJGeAHbumuVtVnFbTziHtqrTtjuXSIrmaahHUENkdTpqg",
		@"xhbgBfTMcfjimawjl": @"qiFgzslPMhIBmmLggcqXNveCSIFAHZNRaJUeOzVPGglNhYHwXLFbAwxoBtudAWptFeuQZvfOWNcoqHgMbmxCnsOcLNbnyrhgjZMGXGGXwa",
		@"JguITsDriPxKEfEeWzA": @"wBHKaXPxCCdogUttwrNadWZeTAkyZUIHyZQeavGMqAntnWAonZcTuNhoOsnNXDOXJfzyJTwfCQlOrcfILBFsPvHGhzrorfVryeXFACZWoGqCbfyzHXO",
		@"ftiOikCMXICTzZup": @"HNcUxOjnaXlBGimmehLiVCupSjvxElrNldSCjuTXeUAEPUWOHITjaaorUuzketTqvrwaRcasjTHkiWmrsbHXGsyhOHiCytURbenSSWdHx",
		@"gitcHpBRUDHHIqMiedU": @"XJohPrcWrulxoepgEZKUDLipoNEuueEJjMESRCFERxMdgntfPRiGZAKZYveDfNaHAIGcISJaxGtNZdyHtxOyWpLZuYovfAZGgcmFyTBqqmWaZCRPlXCLPtuFNxgyrJ",
	};
	return zFJEKcwqFugo;
}

- (nonnull NSArray *)rkLVFSFaGwcXRMYlV :(nonnull UIImage *)AMjHXbpPWH :(nonnull NSData *)eZIyRtDWHCtnZ {
	NSArray *VlGDdbwkfcsg = @[
		@"YHqDVHdHVwZHwiVPHazozAdiRdzvAFygyrvirGIKqLlyEYMxrBJbNDqZBAoOnxlgyNzErobCLRfRpQMbFPpekzoQYASewkRQJJzxffY",
		@"StapLohgHVUTRNJeLsRbLAvzfEIFAjXuQmTlqXcQyokUcojJUokZkYvfvgkAalRuoFJXomQndHFdDzoKbtrcFMopgltGuaBMXYfjZeWVgRWlhqdBsbjCUSuAKkieZotYXzuQqlasSRKZmbEpyEMV",
		@"PBGOCitNBsBbuflctwuWSXSHoJyDcAzGsBZvzlhLpkyZHlYMTsdLwwFkZZOVPiiRojXnTfZeufqZXkLJYaezQLUTPDJznCqcVHwsGBlexempeoRIWPfpIDIcjwdYRrXL",
		@"lDLstWViCJaJGXBEWQhhhDOYbFoytJnJqGAWhaLNTqGzioAlUWQqBlPjupBReIKXNvRhBVEPWAaabfRMQPIZncFbCgVDIfGjADZwJGCQEUFXRQm",
		@"wDaMxMjwsHPFBahjujeZkStqrjvSepoGvpSvYStZuVlaTYscKyszmKAUiDvLXPPteIMGlOrCnxGqxBPulvbWJxVAzamXUWQeLbfwsrmciGjRhcpthJatXEpvKCmSfymvZNHQYaBNM",
		@"STWVsiXaeUannRgCyOpguCrWIFQIUJfpSnIIbauRFZLGJLdWFLDHeAvQBZFwTLaNehpjZhHMYsVschlVyDwxRnLRRwdXdKLIWJFWHyywbFaYvnmxodDIDlwySyr",
		@"zSYTKBwErkyhzMVmNHunGGLIoaGZTsklOPkAdxbUfiOlEEioZQaqsMKLTrtpGElenmnDUgOmdWjdtqyZcuHQepWvZijQnwBiezGKTLmhElhPWBkRIGeOEAfCPDmclQ",
		@"uqgefnEJBevQpYMzJiCKBUKKDULwbKoSGTeFpWAJTCFbfqbIQskCVEwTDSYkgBDLDbthbZzynOHhLOhIFULwYqUoyNmEnGsFZhkJnMPEwUbSDSPJB",
		@"OBZggoKsVaofMCvmREYoVCAQpzrNlxvJuAVSSbgBaBDzxPVgUokhxmqQmjczteZtHpqXwWjohoDjkECyQMtqpfqFckvntvrwaWGtwYzmvFAEyqShOp",
		@"QryvigOMXVXPtjywbUFWVjHgZzFhnpRvrteowhfRMlrSLLcUlVBGWZNNbcSAVEuZRxirYZpcnepbuxbfCIvwIbOGMpwvBHsfgJrXKpKLuRGsdCuQjLkJLockIBbzbrPClSYQSZLXAvv",
		@"qWsIzcxEJsQhpGOCiUOcGquszFuRukqvpUgsDHLUxDIVBNCMbXycxsHuezUZHheCdslvtjnNmsuhmqtVlMfGlpDGxSbhzpgkxZPqhzwDxRSKGCw",
		@"hbulKoLPaiPKrSWYZVIKuMDPWqdSrfHpizVUDgaLvKwWUmAkwNMJemikxxvbxtcMNjeSthTRhxlUFCfnPamEXGBZEtlrHhZynFNpNGJJaDnQuiHPaI",
		@"TJoBOLbAEyEoHRfXoZudgTtYeFVFUdxrhqeCFscntDomvwReRXgPwqdOjvQvkWadMfpreRuIHlqDYHFbYBxeUYfxXNTCieLBDMepyvqiusvNQQJiKylwvpoxtu",
		@"ScvesYzYdGUnrPjgINVLhAABHYAJqjibpxLBBxwrDWAPSAIHBuYEwfenhHimxKsinDQvAQFqNcSLbdomEljTlzOfCbqwltLkIysWrgEJJDlyMPEhhUNHQvcARQYbYHFvsFOMJhyqdRYBGNAQiDnPi",
		@"MyajXYshrXABLmsCOSGmNmCoCHZYvSrnIuGrNlKoUpglcxRPuClKXLDzGmmEbMqwzHXZoNofZcHyQIjhVHwcByXUeJujAeKWfMJkVKfhPnJqVgibBdaGIpYWGZXxBrzc",
		@"tERdLUbfvWFmOycosRIFnHdlMxmmmuDOOEAeRCNpTQdSbndmTieaaGeNcrFJMcRCOoQuDYrWmKvfqIlASQOjbBUSvBbybqDjmCVOBRSLwyvGHQSubmsQncSCHibTyhPmKiqUAbHiGyJHLmOp",
		@"LayDDtoPapmcGeuNrYSVGKaDXrKFZPdekhWvkYWguUEpszViRyKwzhCBMZVrtKUPiGlfAisIQKqTdFSAdvIIjwHLNVLNuQOUdUQrFiniQdjQEwUNyMcvPbUnTEtbTtdmd",
		@"NuhAbYHvMCmjdiNAhtLSkhkXWmINDXtXSOVeFfWsVNevIYFcFcbdoqDKEkAKulRgrcuNeEmOmRTncThbxzuYnXRylVPgHKDtyqoKfffgvYLqNaNWJSZGRfPicEZJtCYLIrJiPvxbloI",
		@"cOagTBOBNwnARKazsXkGbECLEShcKqzuMODwEtpQEyKDLAMBBgHArxKiXbYoTmBpoFvvAcjAmCZvLaEiHMgSlcrgOmyjPNQDbDnEyYzku",
	];
	return VlGDdbwkfcsg;
}

- (nonnull UIImage *)JHwLaTGLTPpDjLMQI :(nonnull NSArray *)qopSVZunpZmWOiZVl :(nonnull NSArray *)OuLxHjanWHellV :(nonnull UIImage *)JxcgqRJojQrKH {
	NSData *JrNtHUimhCcgTu = [@"ihutPHoibpsahaBLAZBQgsETPTLneotcenJXbkHFDDTQAHmHdjLaDZCZEiESsQekaWxiJQfTJLNzVSSsqYBUKkYoNhBeQNYmLtCiZCceZeofwQKnFWvooIIWbJKXjPyzOQdKQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *GagaZrhErjgvBwSPiln = [UIImage imageWithData:JrNtHUimhCcgTu];
	GagaZrhErjgvBwSPiln = [UIImage imageNamed:@"EFwHqTnhTfNjeMqgyGmVJcLwYymHayXodaHjbHZIiJuuPMUdQJYSpXQsUKoPIFTBWRprJXsXyEClkrSQixvpjiGmZpTwAXbNABAFhhKvWteCRORukvQVpVUvzTmrcdOVKjiRbczYEDRziAofmKCW"];
	return GagaZrhErjgvBwSPiln;
}

+ (nonnull NSString *)aHmYNcodvhcbFcmtSY :(nonnull UIImage *)MdDGYFcSLFZcZ {
	NSString *aPZkMUnVmdue = @"WgaVPeobvcemGSbFgHUiadrbZRAxKsJhWqYmNagaXephEWNmfMiGKXjpyieCUdMOjIsWfnANWtDOyzHtuKorqaUKQytMGpxMUQWpee";
	return aPZkMUnVmdue;
}

+ (nonnull NSArray *)hRibKIerwaDtbifnmP :(nonnull NSArray *)VTtPtZNgcPjg :(nonnull NSData *)hlSvCMwSyR {
	NSArray *sCRKxVIOvOSu = @[
		@"ASCTZgDzluIyKKTqZphPEKbnNcpAkXLQqGhYpxZlsVUJmjnijngyhLZQqpJKjUpwWlwhNNUepxlQNIlonZyOjIzlzwGDMCsHTEwKMIPGOWdUEZpXTs",
		@"ouGKfZGekhoyeVqGfYwsXRyKRdSZEteCeOfWVobZbHymfnKtrxoMXTPbHarVkMbjrTTTqPxdduursEqfjIcIqASjUXkONMUwXmjPfOsisUchBwtXQsEbiqUQksSIpzBSIocXoNAzGarPPrpnRt",
		@"CnyrzYXqAWKlUQJmOkChWIpXezpZvgPdJLwjjerzrCAooCpQPiirDFQwaxllCNfxcrDQXRCSdGGAMWFXqrTPiJkqPWJbjFzxwzzllAhimcZiyZ",
		@"aDxtxAOMBXsqgowEYpidzjuedbUmRiJqykyMaUXboiaRIzheossTxLazNbhoMEHqjAhClNAifaVoOUeDyhXcXDYHVXWJJSnBuwVQnAuyerquNISJPjYgFpeRwHbVCCqMKUQSXZvKyLKcGkvbVcqUs",
		@"JZFAyDUsXqOnZwTDkBKfWuUYAasbGxatMGgZUqklQHwmXuDnhumKFHiyiMBQuYJcepyXeoYaXlhcWbjwbBCGgsLRthAEkFtrrDptYuuFuOamKlGCzTyEKotJnqfiSUEBVuHdFyVgSGXWvsBjUNmB",
		@"tTZREFhJowDMyBqDgFdgBFMIPzyWvdrFhcHnPZUXAteFaUZOYlqDQoXEtHsYxSvvtyMMdKcWsNFfbRSohBCJxOAAWZCUAIKUwwYXASDGjBSSd",
		@"rFLTXUqcWBmTqwNeyJVhiGmTybWUozrsUXVxnoWrqNnRpeqBmcQoGCEYTpmasQUTGwjdpXUIsmvTSSbAAZampywdaLnNTEBpqGKARRUurQAgHwMukbgOqKXqcmpyYSMymehbXZdCmVNA",
		@"NETzupdWaAYecuAIwOGkMUmZLAXddwrJhQOruXJBQVNRgqHAwmFTXRdCZLwTzcoinPYtGiykfFMsZClbAKWCypYKkEasylTwPdeyCBvtpnykfaPSksasZrgvvmfw",
		@"BaebTfUgxrhmpxWQRlqKPngtxLNHNOYadpVwURrfqeOtuBEjDUMRwReETSVjLyzczZdIfIRrKJdOzVddgHBbAfSMuItnhjXaQbjxdPBujvtPJolGLinZuMOzvyJUAhFopxYYbSOcbzmjrjAQsIJIm",
		@"WnVUnIJNwBtEORgrWUMWoqXEVkieqcwHYbGyGrxIDiKzLADHepeUlvPNheRfBCSXHsLopmRrFLntphjoPpJaLVFDijrHOiUzsEtVLiPIvpZJfgIVyKKqI",
		@"DtOZRAVbLWduBGmykzulakYtWFtbnCZelZjXXcDCkkvpygBuGkQLJGiSJYFZOGCnGHbCGXYUUDdswDFQcitVWItuTjuqWlJKbkOoucxUERweOtAAGaVWgZNDJXuCfVrwaENPlljSPjBrwVInmK",
		@"lMlXfQCVLzupzfrWqyPKhgIBlhxgigUQFtdxvyiJUOdGZXyjZHsoSiOsEMMPWLHLGFWwjwKgUKPUSBmVlRhkMcxRGcaFUJUgvEKamyDFXY",
		@"NRVYCGbhYtfCRuXsdKcXJKSKeDKTIPKVXFWrcsbRyFKMLMjWENtOuiaEiObYhItpsNYoibpiLNmsQxGbUhOmvlEVLKDViKkEGabmFoyTsEivrvbwribxD",
	];
	return sCRKxVIOvOSu;
}

- (nonnull NSString *)kuYAfftEQPisXDm :(nonnull NSString *)tAYmcwPSOyD :(nonnull NSData *)bVhdiVbKiVuauc :(nonnull NSData *)iQArNuCZDNrm {
	NSString *fhbpwfdQmZqJy = @"nEXPTwJSRJzjeVWYXUMkbiosAiGLlLxrYIBiEgphETbWpCcDlXLsUhZYzYpfCHUboMUtGqzXMxFeDYMbUzQWOotxGiWiVmOadWQgUctdArhSltFZEdzww";
	return fhbpwfdQmZqJy;
}

- (nonnull NSArray *)vBuQnNGArQJELLeAkF :(nonnull NSString *)vvFXxikOnYgDWEEthx {
	NSArray *gqQdPdlWDNbwet = @[
		@"vIoctwDAsfvcVcFbaqaaGLvPaeLiaRzQSSXhkBuDFMdERWqREwMJVHhzoOpDtwFTqpVuqiaQwssqsmDeDOxsMnCnOwYjupNbObQesWDAYBEI",
		@"vyEBZKQZKbubSUKfBgjHdIeelzkcpjDPoWEqsRdlewFbyyEMLjUDHygcZVVmLfrhpWQVvInbcATfijkxhVvpwqwQbHBLzeHMGvZZNgJHMdBXafbygPQpQdlXAZfGHraxRxIoXsKCogSjz",
		@"BUlTklozQJyUXmiPWbZQPpAZEhGqsDZDfGqyMgnpYvrQYMMVMGsoLHUhtQwKYsYVHUGuUCRbiIzlaizGUhRjOtBmsvhlZRHLJlAsBYfFQqRBgtkmjgODLWHLqULQVHNXhwupLOUzPHhKPxRWV",
		@"jAozJHqexueBRyLFRmQvzrIeLkrfBpOidrZyDjkSiOKvxMAOyTDongtLwnbqRhbVjiThTQobwcTWCMvPsiibapRKjPCbdyHfwTLmubSQiThbQWjOPg",
		@"pdWRUXVQOrzqakmGRCIRntLJHbMNvPimjOuUVbTgSESfgUoiQgsjYOmzsMUHKrioOEXQwqSEQHRSIDeQVUUKOiNZTqqwbpvNWRaehnBAgrjrihOEmmODZooyg",
		@"yvQDrdCOZXXknbgMDwBuASvMbWHYzhaxmpqfuWbPVzsMisTbLtWahRhlxVmBgwwVDoGigybtHiXcoITfPGGCOWcaSFcLlnTPAEBFvOypANLtAZdhmcDvdRL",
		@"fMIDWagCdfbAWaZjumHfhVXEMJGLQcXHlXmiyDtmmneftQVkAlImIzMKgUnQJYRMfxAJEYZPTZSRSHKVJRDfGpwvYsRINpuJWPyxYhDUiMQEmSnutxnQvkJGQNrmgdHRrcVFg",
		@"LrgPseedMrpzzxdTFunRgZTMlMVpAindnondYkSObtIBOHfiTvnZfGFtTuelFMlkcUHHGFXjGIAVkHZkaJSKBdToSMVnlyKrcuKvslYHlNpDZAvtXrTWNBTQSnKXPihRfUNFQnmImi",
		@"YMSsLftcgeDuAynSFrTbovystQggCbTksFruNdbiAuNYraulUWJmVDlWejdwQOJqnjuMVTbZuYxwLxufDOaMsYXOlOivGAZDAxvBzU",
		@"kaWZqbsoSvBHrcACZimebATtcVIdebhCvCJMJHDuHZjrdEncxHEqVbUUHFoeEJDtXUvtlEpsRpikkhcnxjxiwpUbzoQZeohbjJCZtDuuKyDPucwmCXbeSzJDGNrnUZKSsSYAJA",
		@"JtSZwYTIERxfIyPeMWZMxbgUeShqGQnvAfXKXjxcmIIkMNGFbSLjEvIKPYHgZjslMOjusSOYHzVtaMoROEfVwGYHEPsGjbNJUzsqwAnJXokbYhnKJtRENkfKEnXUMHHzqVEMyGH",
		@"jCPEPsxeTIasMkpzdCalFhDFCgfVdCirkNhwPcCtyTCLOqAWTYyFapnklmCDQnniEmZqfkApiKRPXFRqGaAOlghTSzvnddyMBGMPBGrpPfwTTnlFTZYdmHCdDtshFRPdverROkDV",
		@"ppsQMuulnKvvEoXgXsPebzeJfdjOINBQxnqRYWytEwZkEYsXjdMvUEFpHAkwxrzqCiSetBjqraXxLjetyjevbJmEtkmguRpeBugfejsdEEltCtAcpuJExxGIHRHfTFurDpzZCEzoLiDn",
		@"hxVeTSlycgxWFfQnzMWLJGDstwrLWWQfbeGADcHikCtnORlGXZMPVRVTsLsEwCrYKwoDYRtzaJsdkoAQEtIxxVIXXbNjFSynRPbQIyU",
		@"MmyiHTSdlvdgeOIxmmulCBIipQjgNbiaLCMxHwRUnxFYfJcVytNgkMWaxCJouxxEjrTfvGIBewcgCsonFODbkGJWbAVtyKNFAsEUNpVLdwvEriVwXiDmsaMGqAO",
	];
	return gqQdPdlWDNbwet;
}

- (nonnull UIImage *)AROizvwCBrgeymFZTv :(nonnull NSDictionary *)MmudFhCbBMhUdJRT :(nonnull UIImage *)sXfSOLehGTZIEAl {
	NSData *RkKLzCtRpoRMLQ = [@"jeXyGoADrHrenUXmPiPhflSIplslBpAtUZQszGtreLFyJqJsLwiNVRbZiSKpjbOLEnSsYkNdafMMWNDAIoBmWJVZnZGNSCwiLlkmYntxFuMEQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kzNURBogZjd = [UIImage imageWithData:RkKLzCtRpoRMLQ];
	kzNURBogZjd = [UIImage imageNamed:@"RCfBnzCmxsIJeHATTIjcdegMtfjSegqBAnqKiwQILaquqomEtMJJCOsbnRkjBGXPtheYNilXIIGQZDEJFpdwZTvcgzgtTUMAFOfysQnRxxLrqsMHYQGEPpUhTWBSPc"];
	return kzNURBogZjd;
}

+ (nonnull NSDictionary *)qQdfeNEFrVSbD :(nonnull NSData *)wROtbncIyvzX {
	NSDictionary *yciUkNAvyDal = @{
		@"hLVVOBAmClfztrXxngq": @"rKodYPsXDoymALaoTVnnGWgOobYZBWCnoCrWAmWlfnvmBkHUAQQJNtIPckJDRneEUHKWiSlWesCVANyjZVtrKCgIuQKlOSdrCddANyDZHp",
		@"rqxInyIPOVHeLkykzq": @"YojZeBCDBeLbBiQwNrbehpENWltiBcnqdeCxlkEvLfczgMKJjpfCnRnWFqWdCbjxnRscWHIBvhUHWudvSfbgabDtUAGUQBLFQIeAKuwpgdKzxNTIjsBvKRjrasi",
		@"gpUkxSFnobAQxkZG": @"eosvCpTuFIKAXkqNmJEJGeasiXgBLDzUQFlwgxRjxZOCXffbppyVumcqpNFAXibOkWLSqjgzaKPaimCmlzyxtyfhkDnYOWsPRFqdevhcjL",
		@"XQuXDOfRHHDewVr": @"tRpcTbDDuToUBdEsJtxXzpQcjNiAiREZvSgJIZYjONeZvMYHwoAPUlhbPORMZhfkoNbJfvvPTVGdMobOiYOYpptCQlkQXHfpqVJGXCYKLgrdwKOVRBWnZKAWXLGQXcyozpIhSba",
		@"ZxhBvUaHrnouulJ": @"zwxDNVsNxVQgQKmtXhiWhYitQCIVxaLiWIugffeFYDLPzNnDVIxDDRgQsZyZzTGlXvuDeKjSNSDNDtDGfhNVZthIYDASTeqdOQVBhGSmHfoFBoFE",
		@"yUSfbKZiAOKVxJJPo": @"CydoLHRTOaumaGdDTKOBmZuYYgAhxbEuKyHyjkZhkAnpAcRVOQtXoTefKrXxJKAXEGnAErKTIzSePjeOrrLnuERgApJBzvisJEgNdrMTYfExJucwlBTtpZUMzCaaKWtBpbkzbITwhrdAsZEiy",
		@"AAUDOKiIsVeY": @"ejDNqZUyDxfRGOQhtqpvSGvIasQYcKmSSGAIWMTvSGACZnWdLTCxcGIznXwSLIVFAVIvMApPNzrzzopyTdWxfCVNoaeXjIWwNBMAuhsEpVFNTHquZoTEa",
		@"TvBKYnqdNLfZH": @"GpnBbFqiKkAaDHVibFxuThZfUmqyjuUqrePIdMNbCvSzUIlRwPTERAADCQdjFoqbvaYPBKgsKWuymNzJCBhrRvEgtvXmyZWuWwPNXaGJDMSUYdPKxZMxR",
		@"vnbqHiwzxkwY": @"OIohUBykSCKsIsFPObPjSVYKoZiTRunXemhZcsIihvvAhWorAWUUGzkIEnGVjZXfAZQVKOSTNMtwgcSGbXQwlvpwLufkjumUXAUtYfLFaDPGzWudzAOseFYviERlZYZxxgAGZRFKyv",
		@"hjQDihCLxpm": @"HCmPShEjnaroJAWIXfVqjOmQXiGwXsdluEijHkbrhSSRvJAqOCpbGkgpviKVOaDfTjIYmihGmAkcuAhCRbIDndpiRggckFmqHaXyVgJzUaSkhdnweArVTSPUv",
	};
	return yciUkNAvyDal;
}

+ (nonnull NSArray *)mEVQxfzlEipP :(nonnull NSData *)ucDaEKeJHqE {
	NSArray *ZcJcuFaqipcfn = @[
		@"jbRnQDTJofmojSPAbEHQzwOkBzqhTVtocywLebpklLOyEYilHakeSlDNnuFIDnLbhjKNkAujtwpgUkQUkjqySPMeHMiwAzYGxOXPf",
		@"lOxQrdvXxsXQvzYFkLqBaPKMTaFfeSgAurnNoSrkcpLUmjmTVrBlNCspKQERLutogUlbTzTRhdHuxvQTGLgVaOGBbRIuWfCUMIBMseZfqGDPObEny",
		@"bWzApRpqBGLoYMgoxGrGlwhJyAIJAApELCEklZJbZvUDJNrftdZHsNfeipXBjZfcgkyIZwxMkcwnnrGStjsoLnScxPyroiiodaVfsbGxwPadYvewwoskvVATTAQolQfVwgDbMsDxnUbVBmtPXZN",
		@"tOkArzIVvECkixAXzuwSiGtpqZqNyRVLKRAPsdGXWmOtFNgdobFjiZAnfBZiuUKftyFcGkSfEaZTOphzMyXAukiquMEHoptcouqnifLznKQxIiVhfvoaHk",
		@"nmWHyVHtGXkYYkvBqYXTEACZTKYCFejQdGPYQaNVxRvHabkkuYSfwRjybpnyeCvYeWEBdLyihzXSsufwZlKzQEiTaSGeieCZFBnNBQzCHMmskoMaOFyrYNVXsHJADFSXkJJJwRcBIOE",
		@"CxBaexZPzuJrouoYtnSQjlTlwvhomZMUgQmFsSugzCMDxQnvELJUmiZBWrfydWJvIpdZDJjzxOILQdBLvpmEeCvoQIwuToExuYYxLwtxXAJVytobUBeyhMPtXyxuEDobjbYIKAfcqlkSB",
		@"PmGgfCJFJyqnuWQNZzKRWJYBLgwfOnewLGrJcVvfeStPdKXxPvAhoCKcjuMvjEzgtqXyeMmGLHXVEomViGGNrQVGNshxNIHzGzNbmcdfTMarlLek",
		@"xSqvjsJwgDJQblAunLnOPUMlEknRmtQYsOuqayzqaKbdaQdpaMRgqkfnyRoHRoxzMhJIAYDAfgbxuxiiOctKwRDimBcdEQKjgjQMcCdflniZ",
		@"ryGvwphYAmKhdSETUJgubVkesSUxmscOkZNCgXBKvnmfMAeGbWHHCwfVcUULtCJPIkroZilkzvWMFVlhBGXNaLMeTbTNekKUeGbatTBXgIBwEsZgZXnFHBIkktIOjGjsAVzOQTnBr",
		@"JjUFUnVmqVHVPQjRVAJyoLgfyPfJsgWuGJbhJqMDUxdCASGkPwMROdgObcIfXNYtMKTDmgHqNwGglsqPNOWdvEzrWZiUvWHDydIcFcMAWiwKYpYiiGlxSADFcHzhreZSBmHxl",
		@"LoTdAzkKhwyqTKXZfiiqaNlUYQulMMYhdZkjUMPQSIOPwnlMJasGJdRmozrsbpdTHGJqWdNsUzNYFWSnfzfKSUHCDImBsuHCqCkiUWIHr",
	];
	return ZcJcuFaqipcfn;
}

- (nonnull NSData *)HQmyNrMXXP :(nonnull NSData *)kfpupLFouNuJToA {
	NSData *OxsDpcSTfDiOWc = [@"cPfbqrpWRsQVHzGVNoLBCIlVZnQdIhAJAwwnEafuzxEDhuYrKwzPeWjLkSBNTLSZItoXSGkQHWpjoewNCcQUteVJkmwxVkWpQIJlXwdecleYZ" dataUsingEncoding:NSUTF8StringEncoding];
	return OxsDpcSTfDiOWc;
}

- (nonnull NSArray *)CcvChINszgEywlm :(nonnull UIImage *)MahWoWjLMBOySnuI :(nonnull NSArray *)JGxLIwZserHmtjfGfuv {
	NSArray *HZhzNVpvAUWYysYbwbL = @[
		@"fPWrecnlOxAjfWQoZxmtMVuUprByQJlewQasByAbQKePHVmYrczEgiCqXaBFAqEMonzKOQmwckAYInevOEntJHwlIbCmzWUCVpJaPONiTAXrCFlVVcYfLTMuVFIUDJCkPOJSIfrSgKWOpatflbqRX",
		@"ekVgmdnRLITofxfRjdgXfhmMXoLJKKQQSjlKlIBBefDJgSdISngotOjPabcHYQqRotUflgRBJaMqEQQAbWxOkfsgIPVXtODhUgsdIQGOPmjUwwTgz",
		@"DrKRHxQlqEIEOKGyvRqMIdtIwtYfNiUEFiVYCwnenIjLwavObAEkWhtDzqLBweVvdcerAqWXqSKyQRtpyrZiZmpCLeuhkjSkkMzApuUdboKQgNXgfMhHq",
		@"HkuhyDCvtHFKafWBwUQXPTMHQNlcIUyaQoplaoFyQAFrtoMnIqxiRjCqwpDiKvzUbZORDwOrRCBTTZhCjukPilPIfkZWLAoMmqIYWTzCowUubsHztEiePomBIiNEBy",
		@"EhwLpdXAGmbOcRaPcnFHSgANRQFlSXGDBqUBdglgwZwrOWdWoBdbSJqmBnqmYChIWrcqGAjobmQddAleXIPbEhLRnEWPFnxSIFpUtvLVPPUdgghpuEeMPoHcpqjcIewTDOCuZNk",
		@"mQryNNELGwarZFdAGMcsPoVXmDLBLrVSJvygUMwJPQkOVOqFPZkelnwmBoaZiTHSqTCGrxsdBqGiumqiVLZiExAKZDFPMnMNuAGydpS",
		@"pDERlTUpXogASecxFzJdwDjvEGrtUoGcPSLBLIiCxuaKfaOhrMBoHeVraERdADiudHUaFOhhMiZlKXwhaUsMNLyuiFkncjyiHhaqvyGCUbvUHmvtClvmwowfcA",
		@"mfSBmJeYTAfvCOiLoSRClCSPsSRXaXGFuUNwWeypBIWbAuyHbLIdUJLJUdjrHJJwxAQboefcpnelQkBWBDaRBNzSygyNkmHiXWdwRtwkAFuwjruiGKnHMqYhNiENyVNbwYbBlolFDtcBeXert",
		@"xzCNptmhmjWMvjCXDCXAUdzPbCBYYfcCBTUdUnTAiFEhngFeabTOGGZqiPXNlZlBVFiMNcqQyTMzwrZkyTgciqzhNpLKrJEbljvJnvnnsCoFCktSO",
		@"vKteQKdsNFtnHqnpGwhrOMYPiwCgsQQTYPOKHPiTBMmhYFZYcYSslLuXdBGadebLvQiwyMuVLZQJeQCYGiQGQaJPERavppGRFAFlMqolPzKEFOTtNJRcoZpLXcyTrNkuaRfsONLlOPGUTpkzZm",
		@"ymOIEWcaoJDzswJlJwMwlNZZWwNerHLzzdnodScgTPVEwkOBsNaJsXmZMzKMyGihJfuolbIToLnplwjJIiNQnAOkYFUFailwKbxzMadAPwCazzobOFvAMCRKFwIonAJeR",
	];
	return HZhzNVpvAUWYysYbwbL;
}

- (nonnull NSDictionary *)NpCrPfYrTjZlglOL :(nonnull NSString *)bQshZhZumMakms :(nonnull NSDictionary *)tVdvlvoxykxsFy :(nonnull NSArray *)wCEaqZSlnHQogRrm {
	NSDictionary *YbEVUuTniy = @{
		@"EIbPwDSlopEUFz": @"zaETDeaprxdbZbqZbfldloCwTobKNigYcoGYuDAZWpkvIKcbQweioUFVvuhmOTSibNgUxbuVzzOlkQRNYmVZVIbADavJQkmnTHiaHhBGjoTcpeINEwsZiKSdJeiAPHepIuUUyaYBUluq",
		@"UpFsZZtQuvTTOqTu": @"jBUeRivveTZuupRxVrrFOhjJYOtbStBXurBJABeCtPZpAaOcDUUgqimQALbzCIiAWNzRnxLUQulUUJOlFqXucGWvsIzFvCqmeDbFjFdgjERolOReAffXltdnSzbSfMIcMLekhOhOSVvr",
		@"hVvrsbHutSDVe": @"SGbsGdRCfnWZWDMynzhBmRhJAelmdIkmOWrTMAoSksHJnQLhiKNzkPKuXjArjWscVltkdDiXMQUVbcnBhqfpYObbTVZGQCJdjNodXwTFQlHYBjfPRbwjYVKPZagzZh",
		@"zPHcndOWINqLYeBk": @"gGAVgUMnMRzlxnlRWbadyQSBBmDyGylHgErFOLrlxmidIpEfDqBRqxBFJeMDfEyfSFnTWBcyjJWrqRvfQFThSpgBtsqrIHnjvZgsPPRFYYdqvZqmuZkyMlWjvBeVOzLWvhtKOYx",
		@"lkzpeWgcvdPxC": @"JWzKWVkXYBLECQIfeUqNMkOKtgDLomnJEPQhaLXwPavtukmxFXsStDnfiORmGVgOZKsZqDiCisMWTsfPMzhdMxDhZOAXLIxeIwlHrfvFwVCYFwGQKCObFdOzAOLfsOBI",
		@"dyQlVTwEfMhA": @"AzQscCohVtbRHTnUlBArAkyIdgHvLtZjesQpjTCUXJkXmzYAzcsvTLhgVwxHAOKMohzFVFtwulbOAESfXSrvELHWlyFcyyXAPkwYgDYBBBGxfynLqezxHkaztaiJfwOTKljLtaRj",
		@"iCPxcAFvuHze": @"CbeakTcIPsuktcKNwogGqhsmFkBKOkXiQVAgGRoZeizsashNVbfGNdwCsgbLmqzUjxOefIQGBNBSjWiCoJLMYeGGfjtcFhgLPmRJtIyxLYzjLr",
		@"HRStgzWZoNdR": @"rTUlLULSLIANxpujUOFBRbjFQfTbwTqCKcdASUKcIgZwaMywUlwqKWcVmzvXmYOMfjOiUccyjYdBVRNHCoHaZOyEsWBCvlkCEzsloCLGFAAyHLkKBGAHIsdMIhRVmDlSYRZjLQaZOFPx",
		@"ZfcSOeQgZsWi": @"VqMTeyOhulDAWKImpKpIGwJbUFPsRaoRYtfxOrFpKprjlPHNuOcRoZTUuTYnVXTKbobuGLleEOUxaspTWxyiuiUffoTUpkMKOBVTuRupWxMGRpDVKySdpUfixcsariAakB",
		@"CLBtySOJIruyVyfjo": @"oppqrERDWGYNyGfyRDzUDYMcuDTGvHjtxlBLGwsLYHcWMwhfqnXOFQvWVQqNnjYjsqoIMBROwndPGuDumEdHlLcaPltpXgtXLqirclqcJIUFWpdiKbJKWvEduCFrsgioHhJ",
		@"flDSFvxBeVlKBi": @"cpJfblbKUkYPXYZmobcXNdUSnVPcdjMvAdcrTYjvHwsRAVEyTPoFearVgAdoFKBmErEnKSbFoHIthBPSoSvVIOMOoJeJoLMmIygsuQouzTrOBSBpiwGtPIznvv",
		@"TvLjIrmiGYbNdTppR": @"sNUNrScllrfaCznZgtLjXHgFdvEBFldjiBoRVylwDwlISHWGvYDWKlusRXTireiaXGybTvlkMYDILWCeKICvBooLQQkRsJdnANRWlfDkNWBXckvWge",
		@"HiqlLlxoHWQTuIJpdV": @"GSeweWVqmMkOepfBFseabUEOLocwXZXiejOnKoUPmKHetzmrNITxyuLHlBoepZuZFeZGqvgbxIKeIaSijCULDkWeITxtkGvHFIcGpynOVUsyjhsMMbnwvdpy",
	};
	return YbEVUuTniy;
}

- (nonnull NSString *)LlLcKaSXbjPbq :(nonnull UIImage *)JxcPsAbjhDg :(nonnull NSString *)NdBWVzXEdbwXvXQiwyn {
	NSString *MTKawHAZiyI = @"uxJXVgFCzwKeAhCLlotFyFZelbKxOhFzJMDQkxCiiydUvsAihQHMeeJgrlSdSgqbzmbBFrlQiEfvFyMQctEMzXKbOfTKuHWWIiQWniQRCscdVQjwWJFGggsFD";
	return MTKawHAZiyI;
}

+ (nonnull NSString *)MmksPlATxxzngmugqM :(nonnull NSString *)ZBFSvsUXSGo :(nonnull NSData *)LQjjcrqCEIZiGJW {
	NSString *PeDgqdjMaNe = @"nqTtUbQArBTVZQIcQEiPQdZFGbRKVYnFzxbhIzqKLqexDmEDiCEiXuUzQYDJiinoZnoPfeQulUfgoekznKqZoXuqHoYURoFoOaJbUJrLtChDIWtYfgKiYDSeSmKqfDLbGK";
	return PeDgqdjMaNe;
}

+ (nonnull NSData *)kOQyVqXFuJzug :(nonnull NSArray *)AroZzcBLvWXrK :(nonnull NSData *)OuGQRWRjmAWEGQx :(nonnull NSData *)jVseBOdPigmGY {
	NSData *veRSTjEaIlhckjgTQks = [@"LuMoFEXoEeTLUiyzzZtXHZNTDOyVKObJXBzUJNTplsxXvXHqRIgYxwYDdfuWlGiJKTgMkxDdkjXAHSbKalprYQhBbOxqsckEvpeLWD" dataUsingEncoding:NSUTF8StringEncoding];
	return veRSTjEaIlhckjgTQks;
}

+ (nonnull NSDictionary *)xNttNTqKEphLTlKFmx :(nonnull NSDictionary *)EGjyOZqtXmzR :(nonnull NSDictionary *)WElLaiDqUEkKEtHcJOb {
	NSDictionary *EiyIthtDrvoJ = @{
		@"LfxmerAjxoGboyVgb": @"ulQPyNwfVkwDgdRUqmrCVAMNwRZilFVRaxafhmXBZcUDWJBmFtkjKjAscdtSFMdSODzTOyuzYucQVOzrKwuuQHHvjRmCRfjtDAaGOQADvjTkcWXrusfWFRdncWrUUYwFjvRvIQDiSfwstkDU",
		@"dFwgrZAZmaFMEV": @"wiXWnwjzbBuPVWJEIozgbQFHAJZYuCacRDulXqgVVxOVsamziTCOLWgzPlxxAKdLvkSsOYxcRFslFdFvcLqYXAlapDfZTTYXPdtKUbVnkYZjYNLoWd",
		@"AAQoTaLaBFgiKAWob": @"aiDkQPUIHjdbbyPixDjJSxFAWQBDVgWkUEtAhpPvSFKbBbHcSWescYRDbUlhoqbqbUAnwdKCCKXPgmAcxTlwuhBWSMFAaMMdrGLlqpDALLDo",
		@"KlLsMILaENiQW": @"NHzcYFWuNnwjbFdhrWjlJEbJqkrXlHROgmYntfbLKmCQQVzHWaBlLcudblWHAIkDpemEIYbeYOOVBcKeeXIIBYyTTYbGKJZuGSmCxibFwkWUmiJuQOTyt",
		@"JlrhPgTzAzgfmyNk": @"JMhgWHzIuCOppxBBrlOKEEAJzHFwvvENKwSvkHNkIqDdAVTZdQRMQXqCJCeZFepoenUhdfAmeKGiiFYnkgACAtuIfbeyQkirVPrjbiRimHbRXacUSBYwRHUZOsxQRczLBgNoCcZfQQsujPfvOKfrg",
		@"nXKOVsTQXcjQtt": @"SiUkIavmHwbHtiETwolFGTluCYfjrNimGoyOpsTSjZiMPdbiQbGNALHnqMLzBqndpqdXqsWKQJMNvlDxqsHEtbFyOxWRdXPrGZKteemRUoqtQCDWCQcFXeTMNJtwwXCORc",
		@"XQcOFyHmyWSPKpVF": @"tlxPDwMkSogjFFjXHdNQokREUewMLiYXDeiKtwQLyPAFeieqPrFAoGafJzCYJaRsZEymqbEVSuqTzXKzOcIITCluTlLjaipIetzbbPVXT",
		@"vSesJHeTsMrt": @"YqmvmyzENTxknXyoHJNZKAACgMDkmLFsdavdLquDeDpKqoGjgBftdJMCqhzTlWcynBIfoEzxgKBalcsmCRrixoeStBFFmYViEBsPZobQfkwbxoMEixMcsAJcqKLmaDfUSjHacBsVMZiTOusoTm",
		@"EEbGWDFjsCwOqODh": @"cJFJPoXRRnrEQifUWwnYpOvlKAFLYjedxQfEirtDbVKDckHNhHTnvWmrPZivThikDpLjeYTDcMcbeYcUgoyShGNXSYFjDmwJVYHySUmczMZLkAhUPlXappdEDrVXrfNKdMjCxfHIAsbIVWUO",
		@"tYKNozMxmYtckkmTk": @"jOSxRlpVISwVIYvkDJgdNHQTmZpKNMzAsvZhnwMhgrQoYnYtUqhLBLLNsgYfVzrfxFEZQItKWiNhKvxcRbgwxAAVbQodklMVdXHXJHbQsQdItvxsHH",
		@"VFMWbFZssoTzCBuUEK": @"CjOVLgnNVSxfmtORtiyszEkGAtsjYqiMJcossedsYkahUdWrYHvWrJZdIwvMyzxDuMobIyupiRUaplAisqEwStNUrOZyUpmwvDdEGtqhHHnLA",
		@"UfLwQvnZksspAZaH": @"xYuuNCYXYoyrQvjJGNCIuiEJsmWURdTraWEtBsMCKHYHGeEmWHksxamOlVvoreJZiniilVhhnAYDBbqdeoXnjdrCMLemPzZyDJbslOfiThSwCQQSMcTmXSU",
		@"pIuQSWUXdxJtUF": @"EXtvpTbUoedQgOcwJGKHpFtkLtoYIsbZsgaBoSFzpnUGwAdoAXerjqtzrFTTqgZrEUovVlErmOJkQEowWAzOGmouZvILVUMKbBSNoioSqOIqkHQJOlxxcHKOnfBmQRbwemskmkSg",
		@"EnGSvSQSvGuYTSQHEeb": @"teWgLUQlVRelJRKKJSqfSuNilQKLRhKLfCrXNitMkMlZibGEKXwhndIyZRfrCVSQiXiACLZIuqaSBjtsGVwIGSivryGAotXerhCIbHAsgRDWXs",
		@"mphUKkwcvCBCmOBKVK": @"dOjqHLPCAvyWefzAlFhOUqPCWBAkRtbUfEoaJgjEsMIhEkRmfMsFqLChbHxnoHTQWittlhFSVHIqtPlcJcpLbkepZrkWdBMqpMrDWxPyqAxXwYh",
		@"ABTSWpLrBQOEJiVVj": @"dPmaZAkhCIzqtgVmyCojFwIGKWatEPzvMfoSCVMxLBOUymyjBbpYqHwCnsrwZmSovTbVvfKvhljqPNYhyribJIhOfPTcXJsLWuRHnJqGpcOOLnsZzuIGwHFeSVm",
		@"visgXbikFakt": @"WFiOfxitkxNeYRVsoWLYLwrKxIKCrapCyQbTYVtHLzcJjCwhIuPVlpXgGTFQAoDwCqOgPCenQzTCoNGFwoMJRveUUYbbIwcApDBbiNxdwBhKgiPWBw",
	};
	return EiyIthtDrvoJ;
}

- (nonnull NSString *)SgEBkqTlhEgVCSZ :(nonnull NSDictionary *)CblvuxBbaH :(nonnull NSData *)RUDLDzpBcrbeuTGkhl :(nonnull NSData *)UNALsSlbNC {
	NSString *vODnDDCehFs = @"UbAgynnqEYDFwKoHuOTGeFkPkcUHSqSAMHpYRmAQvzFQTfmvcOtGEVEWeYGiFVQPRTdlESrJaYNLYlaklqeppaaoYDkoAcfgOSAGLjfCPMIkrQoiU";
	return vODnDDCehFs;
}

+ (nonnull NSData *)GrVednmzTrFI :(nonnull UIImage *)rMVRGceApIpY :(nonnull NSString *)WVJMuvhhzRRoEiEJ {
	NSData *RbQZYkqozFSVKQSStf = [@"NbeVKAQgWycxvXAIKUdtgTYathpSdpxXHdUqFwmUQreKKXNvJvAKrqQKiNKKtxpLaoTgrMPwiLlERGWDnlNNZSzeiAYbljtqRqVG" dataUsingEncoding:NSUTF8StringEncoding];
	return RbQZYkqozFSVKQSStf;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setUpData];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

@end
