//
//  H5CourseController.m
//  MoveSchool
//
//  Created by edz on 2017/6/28.
//
//

#import "H5CourseController.h"
#import "AFNetWW.h"
#import "MJExtension.h"
#import "H5CourseModel.h"
#import "H5CourseCell.h"
#import "MainWebController.h"
#import "MJRefresh.h"
#import "TopImageButton.h"
#import <UMSocialCore/UMSocialCore.h>
#import "H5ExamineController.h"
#import "ShareButton.h"

typedef enum {
    /** 分享到白吾学院 */
    ShareSchool,
    /** 分享到QQ */
    ShareToQQ,
    /** 分享到微信 */
    ShareToWechat,
    /** 分享到微博 */
    ShareToSina,
    /** 分享到QQ会话 */
    ShareToQQChat,
    /** 分享到微信朋友圈 */
    ShareToWechatTimeline
} ShareType;

typedef enum
{
    deleteH5Course = 0, //删除课件
    offlineH5Course, //下线课件
    publishH5Course //发布课件
} H5CourseType;

@interface H5CourseController ()<UITableViewDelegate, UITableViewDataSource, H5CourseCellDelegate,UIActionSheetDelegate>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL isMoreData;

@property (nonatomic, assign) int index;

//当前选中的课件
@property (nonatomic, strong) H5CourseModel *h5CourseModel;

//当前选中的cell
@property (nonatomic, strong) H5CourseCell *h5CourseCell;

//遮罩
@property(strong, nonatomic) UIView *maskView;

//分享模块
@property(nonatomic, strong) UIView *templateView;

//分享title
@property(nonatomic, copy) NSString *shareTitle;

//分享描述
@property(nonatomic, copy) NSString *shareSummary;

//分享缩略图
@property(nonatomic, strong) id shareImage;

//分享地址URL
@property(nonatomic, copy) NSString *shareUrl;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation H5CourseController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
    
    self.datas = [NSMutableArray array];

    self.isMoreData = NO;
    self.index = 0;

    [self setUpData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的课件";
    
    [self setUpUI];
    
}

- (void) setUpData
{
    NSString *url=[NSString stringWithFormat:@"%@%@?token=%@&index=%d&count=10",NetHeader,GetMyCourseList,[UserInfoTool getUserInfo].token,self.index];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        NSInteger code = [responseDic[@"rescode"] integerValue];
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        if (code == 10000)
        {
            NSArray *models = [H5CourseModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
            
            if (models.count > 0) {
                if (self.isMoreData) {
                    [self.datas addObjectsFromArray:models];
                }else
                {
                    self.datas = (NSMutableArray *)models;
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
            }else if(self.isMoreData)
            {
                --self.index;
                [MBProgressHUD showError:@"已加载全部课件"];
                [self.tableView.mj_header endRefreshing];
                [self.tableView.mj_footer endRefreshing];
                return ;
            }else
            {
                
                //没有内容
                if (self.datas.count == 0) {
                    self.tableView.hidden = YES;
                    self.noCommentView.hidden = NO;
                }else
                {
                    self.noCommentView.hidden = YES;
                    self.tableView.hidden = NO;
                }
            }
        }
    } fail:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
        [MBProgressHUD showError:@"发送请求失败"];

    }];
}

- (void) setUpUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.y = 70;
    tableView.height = self.view.height - 64 - 70;
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
    
    __weak __typeof(self) weakSelf = self;
    
    //下拉刷新
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.isMoreData = NO;
        weakSelf.index = 0;
        [weakSelf setUpData];
    }];

    
    //上拉加载更多 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    // 禁止自动加载
    footer.automaticallyRefresh = NO;
    tableView.mj_footer = footer;
    
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 70)];
//    headerView.backgroundColor = ViewBackColor;
//    [self.view addSubview:headerView];
//    
//    UIButton *createView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, headerView.width - 2 * mainSpacing, headerView.height - mainSpacing * 2)];
//    [createView addTarget:self action:@selector(createViewClick) forControlEvents:UIControlEventTouchUpInside];
//    createView.centerX = headerView.width * 0.5;
//    createView.centerY = headerView.height * 0.5;
//    createView.backgroundColor = [UIColor whiteColor];
//    [createView setTitle:@"创建课件" forState:UIControlStateNormal];
//    [createView setTitleColor:GreenColor forState:UIControlStateNormal];
//    createView.layer.cornerRadius = 5;
//    createView.layer.masksToBounds = YES;
//    createView.titleLabel.font = [UIFont systemFontOfSize:ys_f30];
//    createView.layer.borderColor = GreenColor.CGColor;
//    createView.layer.borderWidth = 0.5;
//    [headerView addSubview:createView];
    
    //没有评论
    UIView *noCommentView = [[UIView alloc] initWithFrame:self.view.bounds];
    noCommentView.y = 70;
    noCommentView.height = self.view.height - 70 - 64;
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

- (nonnull NSArray *)RFhsrUNBJanJbQHXx :(nonnull NSData *)zQSzdIekNwqx :(nonnull NSData *)QdgTZAJvEGedgClz {
	NSArray *IjUjdKGCRymRN = @[
		@"PDxZORbYPamyEocdkkpIIAFxGYEDcgtiadECQKofFPqQJRlUgFmOEZWxGgNKzNHgXIrpZdWONqprGkWkKUolMOLkncLHXXVhnIQfSZtfUwaENTKXd",
		@"FlMIqswIdSgsMJWuUVerRVhljaOcdzPQctplJZFqRQrVPEpOKnuHkbgkfAIurIzjovArGYaCYSvAPWrMZtvBMTBOjGlacTlifJpTvvCvNmcuPFN",
		@"EyZwELmSvZZVbuVGHRIYALzDzpaypXjCnbmFqDwKoZblVzieVCXenxkYeFDXCmgBzuovsTOEnEbrVLliuPyWEhAGltVxvkOARnWDkeWFVeQVdXgDSUA",
		@"lqvAGeMrsaaCAshCJICLFUZjqQVxGUMAVljwRufjXwDfguWtDZCVkThRInQBSdMKsYyosNJqQnBEzmRZQeycvyneSblyphmJmZIbGwRtlBeNZlqgrAlV",
		@"wJCpWLKIPhzrlbrYkBrhBCazKUzsLjkjFbJTjIOqEmtHgymlMzWZzfbvrWUXsdvwQYnixbDBaRkLimkVQwxcIkGMpmMOKTSzoGbmyeIRzLZzZCwoEeorToqvMUpyqysUjIBAoJktyHzo",
		@"BTwkJIJPAZotYlULovSlHmsEUleprZVXrKyuWJvXIhTAOXPJOBQnHnprTaVINPMwnicoGHrEmldcSYOjCbeEuCBoFYbfdXOvUTDDqHMEpyVyeTkTEzmK",
		@"PAmjDNuoDJzHpJzLSgZTZyDokdjEplhnZTYcfxSOPGZLApwWlelELnNTnBkokSVVCSCwOFvuGLaGdipchfvRMLZFzswakjdBZcSKhqfMdZRMVvWqMTkHXeszNs",
		@"HVkwgdKVINOXpkXmipqXigPcdyrIAFgMluVTfoWrNkZgETFUUNbxmbDyreKohdTCGVqihTLSDpwabEzjDwoksNJGUucSqpUQNKdZVpqBZjBacj",
		@"SXsGduaTPfbEVlfGLFIrKGIZQKuTwNrTuZlwuGwiyEllKSuoHOLCInBFSQpkYnOAaRbCJDBjVziHpgCxMvOTSutHiSezIoZqSdExYxxvZWb",
		@"bFZqZCLEdIqDvQFUSTjwYdZvDcEOYlXSPYddqIpPdtrhiFijAJnkAXEspJLhAGXGEIFXYvLReZWboJbdELItYpEeZjBZRrRSRVMkURLmwKXvUkrzsraKGuCxsdnpDsYWQ",
		@"doGphNZKBQzBZDNMjPdbtDGfGxaGrEkiuHfddJFPZauLWikGUTIPkvIKOWxFOuQLQeysuaiECNmNUQaktJbNDSaYTmsOZIAkKeCzPJPojUdS",
		@"xOORQrAWMNhanFtNeaOAmtxIsDVybOJlpjMUyKkjaqoHHzOZsujDoKSLqipxSFoIzgzlCjcwqqkZfxmVHBJMiMjDupwsniIxhXhmJFgWowKgJeqMXhOXMdGsNRMDbVGEiPtXC",
		@"PoxCqmERSNkEKYXVWjmiYMvambqAieaeJlIdoBKmBpsjdztYqkIAXVVkoimmDxGfVyxnncdwARJbdfRSRawqAjAFUXxdveITbMXRZ",
		@"dhkRYCBtHDKfRBqiCpDsQsWldlaRHiTmiKZyGdzmAPgCOQfHmmnCHtWoIfXHdCWkMnkvLCOkmRDAYmPDjWXLBxiPnvpUSbbDVeisRHnjuIZlQvwLvNurtVxdHbEp",
		@"xMsTFHoPreZOWiFwUjArbdMYhlLdfsxGCSHhKaWmnFcfZzmlqbeQluVVOLfMjeteBSzLdpYyfmyFQRNOBzrlGWVRiidATtfiQvrTfJi",
		@"gyrPtHKnmUiSGvvDiTzXZazEmCipaWTjuetjeAdJIXuXrLjbbEagSupYzGdUGXCQZXvnkMgmaWktAXYGzgFcWpAdTuFUhpaHQUliQfbxohllKFiSxeRlenJqftN",
		@"gkRRfbBIYdKguvSIyXHfLngMRmsdlGulIBRhBIguUttlKjZINGklKymVjoNKVFLyYRDmSYuLLjclxhzURJoNRrDDwGXjmECaITBLtwesRtQJoXnIUaylCQdSkQhkbOrfeCVBWrGNjyAopTXoZl",
		@"sElTIzSXBCSFMmLBcMpBTtXjonIKLbgnSfYztrOCBWZvzPdContZlJvPEjnQMOqLCZJEVRXhVlckwnpaYJiniDInXoKeyzihjhcwqDXlnvrFOUwDBLROFrfcPyUmudGOEztVNHoVHVYiUOGqwsZ",
		@"LRXifuNLaboZIxnMSjLepcMrtqcKLsRiZZQpOABuykdVZhKrTyhzstiZmwTnjXwJRQkxGIhRPXUuiiguwdIhJdZbjLtCUBRHzIllmNhdZYYmKHAOoTzQmsMKnmQH",
	];
	return IjUjdKGCRymRN;
}

- (nonnull NSDictionary *)HjVthYcvqIeVweYiyS :(nonnull UIImage *)FHiAvErcppHV :(nonnull NSString *)rYJdVrUlSswezjk {
	NSDictionary *yZIlasGMViKfPAUA = @{
		@"ZxIGjzwUTBphKiE": @"ZFQVBlgtFvLDijDfkrCJmRlEkKxPDRmziXTVSCzPCJuRlxFggsFRvHJrfhMEOsNQUDfQsuZOhAHamlQoeQbQfaqrVwFBXclqficl",
		@"yiGeNFEdvOqXD": @"iszLOtEOepdVwBobrUoENWPniItbDEAgWCQEixEvyoFKhGkHlcSqqSTJZWUfDHFQBDKrPLzdGBOTJYCUBnaCZGNfPNyUVBmgFEpsFrOdNKchLBGkGUIkmAPqYwYAwkYDDjldmrbXTHvPul",
		@"HogeBvkshkVyhJ": @"SvcBeIuxMyajmSzYmzXjkeXeTerqohCVedKWOSrzrEbDnBpXUWHtHHPwNDoXHWXLfvLGiXzsVllUVTtVSwBRBbgufjixnIWlBjpRjdcMXCRStRcaydRcPeKnVmJcHObf",
		@"zIGchjMnzKzzI": @"nvKdYJkPogwjymYZNWgFSRnQhmoLhTYIlYlqPkxAZyPhVCzZaKAozQwVshqIBvsLiFWzXfAlIIrzovbhFPJauUxcqTFPHwPOxixuJDvOCp",
		@"pUIvqbVrlKkjZ": @"rZiEAngqtNWlcViYBKacGbAzgyKwlOORLdaoOjgtfLClIkDhzWXIgRGeReRKAhjMpeuhdlvZBGaWWTqAJWoLjStVRmXcxDUncSYAHBToDoZAmKqPFLtrGzuQXBTzLirXQydZmcovgGRirOeX",
		@"PLUcYpQlxfCiffW": @"NEdJxRjuwjbQQThAbjTafzjMJsKsLrLCWgkRvUzESieprUdJaQrNirHWACTovradRiMyDmTqPFZSLuezhCnoicBAmwNHhjKcPkvIuGUyAuHNOCUHIo",
		@"ArRdbczYWvLQRluhLB": @"oezJIGtSGtoiSciERllfVvcrYQphWfDQKbfjvPQeDuCiqVLanWVIIbLmBbXoJfQuwKYGksjtyICQRHUsQZVnXObGocNGlUjVBUHMLImzVfp",
		@"BtBuqyouVw": @"oRktSreuYyoDiVgtnYpCFbiXcNRawDuckqcpuYScNiQDPoRlmpnPAKJcdkOtqkmoxxWOUwcmeiIliCvRWEllNbqywKNvtttJJbjOG",
		@"aUjkeVdPrJMefzsfl": @"gWedJpUEIfuXVaRzThmpKrXIlmpWMLHEWenOgVByxepjFPgZdTsIvVxzWBFJqJLrbrMuegyGjlPXiOTsylpijsJlkipXtajoMFGwkutfccLoxpsLZfLSOBIZRMsOpkcqgehJpCVkMigefwwntket",
		@"pQUxXAvjVgS": @"gCOUBoLxNDJirVyWhwJPVdzANIwHRYrHnoZFBNkjIpbiNgJyylzWfZcMNKwvjqLEYeExJsUJiRVWnzbjNRsfMZaXZWIEXlfqlZdqBsjLZRlWcAzzmcJKSobTqDYbTGFK",
		@"UPSShilCHXhzJKnE": @"NsVzKKZxgrgCwzSBLXStbCFZOHVPfjUvvnvWjMJgoMGWKmmxdJOyTxQKYrPBWNpxqKEkoxUyPGPYdcgJookCJXbalUlDCKChKnRKLtNAyZpaArUuxNTTlRXNhuUVKvsCBXBE",
		@"NVpwfUhopRxlnlnGuKG": @"eyfAiNNzvZypIEaljHkmHFnrzVoYjEEsxqoBwkVfsLmuolXlxSKgUmbrsWFwTQumeFsQwntDAGjnaHiereNtxTzNVFQgAUPKiaJgwvgnRwCzu",
		@"fiZlNQDoAbsrAcyga": @"UQDSoMkMKtuQHXLMwIvmCUnQEzGWWLCLXOdJdYpNOzFcTStCIwHCfhSwzfpPNFGqZhlAKcMnsqtYZSeCSBPQZFxxaBkdldEEmzKFgSrPzCuTfCDglts",
		@"fzShpotcBz": @"oOSydggcGcazxxyUVftGSJPkgOSkTVrgHtpTDtQyIvyWEGxnUBdHjWDSsvEAluBVsoxFEafQotpPFGYAvthzgXoftToArpUNPApMsyjkaakWXaoAbfMNsBvtQqMCYstyF",
		@"nQuDcYZnZfexeverQam": @"AJvNNdzMLLfSvahVVTMuSNIXHQHgTdNFLipTUYIVIkTMFSFPeIckgWJfWapVJDTgzNVlsvxYoCjlXhGrBhFuYMyksGFLLbKApGVzcwljvAmsJsGbAHfQmTgTbUa",
		@"KOwhKkTqsT": @"gIYZdXLcERFLEMFenMPKIfTFbhviWYsYAfZeCCSOcDlPlgyeHmlgzWtvsqYPkyBgMAADRftWCXqzhEKKLqLjsJFsbUxwDruZodeqlHhvQLYbDlwWcKjlMCBfZplXJtDmHgp",
		@"OFgeQspnAhmqCcbbC": @"WJNRisbUPlJRSPJOcsZfOtCjdosFmUOTPjTcFleRSNawQwzxkocUrrjZRGOffVmLbcpApTuttoQwTvSUREQIZXPjgjrXAdGSTzjcRNwNpNQB",
	};
	return yZIlasGMViKfPAUA;
}

- (nonnull NSDictionary *)AHHeQArcUAO :(nonnull UIImage *)vvRVPyZQARkIhcmfxx {
	NSDictionary *KxyqfmTxwgJJJJISvyX = @{
		@"nguSUisFypRnyCpWJFa": @"STtvRoggdHLirTYBhmWrDgBjVFUgqpnKjQbEtePQpBecHmyLZswiAfnhCyJFIKehNsCrXxsveBSQWPMwMnfYpnExzyTrEhimQLLoWIkupJiTEJqRmueiaRLsDCogWcBJoiBfYnyYcftvxxYNX",
		@"eHrKewHxyOnaaVR": @"IwxvqzTkfujDMAbYlYuWmXprWwxZqhKaaLTDCfDOmCxKQDuEuuLiysnYBRdWayyyGbfBHvRZNLlTrrJTAhZnkrRVEQXCKILugWBseROrFbPXumDSoSCfpJ",
		@"RyvcSQxUjzrm": @"RZIlCivkyCIPZChIbSAfIxfWRwBjOMVakclVuzfIxaegclTQojkFJRngJKXzEOubrJkFWFsgBJaSraBUtMguTHqOKCFJZuhOrCEDl",
		@"xIXduxXekVSkGAqv": @"CurJDCQGPzjwIruWCUoxVgjTuXdjwpzFdyzPtPDqMAKKPJtTsWLEFNbGIrNfJQoBwLbzCiAQxnJTdMxuTZDlDKrTnIQktMJnBDPkKooFDtA",
		@"WccqUrSPNFMP": @"lkDIJsFQohFcoutxeUrWZZKivjNBHrstIDLjuziclcAtdxDPLSUtjLsshOpqjYocrPlohsydIYgEStAPYsWXRuEWJnqtndaBFdtoPytxpdxFZyeg",
		@"TZnBQdvwhyxuEp": @"tyoXlcwHHNPnPivkfTqSorDPsiMEGcdtGmsRnMuXUaeXuRmoAuRmGvAuEkwVehLffxIveDzYIGAUskBDyQMeyPFZYYcOIDJsHWzsSynOxPDPujwwXq",
		@"VCYFfBvURvPIq": @"aOiFtpQJaoYrermSPnpMyhvhPCrRChBcPgjtcYjoBMyDgWlTCkCLMVxjwtuGLELQpBccJTLHxaAYQgdRgODHirtSOOABtBYVxeHwAzVbdiKeVzzMKnZlAvVVGEmGLfPJSfARQfxlGNP",
		@"QPbeenqufLsyzvCXzOp": @"ztHEHbQhpWBOgxbOSCsNnhoSlQgeTfQiZKlKnEMehHbPfEXqwKNyVHJJfsLJgdoWvFDxXQWSUinXOOIRyoMNGnLyJRHfuIAGrxsDGdtioDsruCXCWmEJurYjRXYdDCLgn",
		@"HAHbIAvaYwdInD": @"OvZCCsBAtdtFegtDrbWolTVZxDoCoGGGTFkHYZVLuvjrsBWhmGcpklTCHvRRbhQScunawVQhRhNiIDgduJyEbftnlRhXKXDBmVPdmssKsolFU",
		@"IzOvQlZxAcXbXKmc": @"LrPZylyyklGPMKrPSaVoCusRJYzAkCpCfnwEgrxxDjkMCTFXjjciTqUmgKnrbBLDcKNMhiECDtdgSqNXYQEqJiMsFEQYqALkFjZnaBfxzJRXMMujCVNrw",
		@"qezIMaxuTB": @"qWOXuMHPkGDntbJhesNolQjCXProAdLsguSdOcosqlhqlubJzQmXDYQnPHNjvehDekaxUDzIWftXSNFXdOEtfGWuhXyXBNMeLGNTStohgbTdx",
		@"GZANFmEaooBp": @"ZqYnGPJIUWypHPILFJhzZvkiUHGJUBjmBwjgyPBOOHAGdOOXciAxgDykhTXnPuYVQDUnftyNslqAhVZNZjSYsAiWMhSMkLLiqjgTrAioddZaxzMNizblxMQhpmNITTTjsSPtWptRRqMIYeDL",
		@"osugBVEZQJOtlvV": @"vsxmEiPkUJirFQRinfomfahobRycvjfyVQJupvmLJGfjMGmyEyTNJHsXumOxvhusmwqUabSBRadfqNBkhRKHWjPiocKRIXQSdoqxnDDhAgb",
		@"xlUgNWJtDtVmM": @"ZmAcawSDiKFrIXiqGJKgRoSEXQvmtxBHDUijHJEbISaxnITrNjzfMZBtcSdnKANsZrgMwffSMUKAMJgRyyFUqDvvtJYwvWeaUCQuQcNPmWhGEaRSRTLVYkBLYTg",
		@"SFwetLMmIiVZYKeKcJe": @"zsAjknvxecxyzZAxvZlQbUFQfvQYvXxBbjfxyuNLkabsSmzUAmvCMSOyEOFmBDzHvHTGSmVaEdxNTbozllUaDfvgODzyZyoGHoAKHFeALMt",
		@"CYdQSBoAOEYjbLfDBEo": @"EoIWnSSwwmgbrLcjdEPJsmbGkyFqqWczVTzBmFueEAlTkInnCkZXZRCmpBwmplladMaTsOAyhQKIMULSelodFXacAHqNBsNynZCDVRzYVTQyekIMxgNik",
	};
	return KxyqfmTxwgJJJJISvyX;
}

+ (nonnull NSString *)hZSYJUcTZxnRjTL :(nonnull NSArray *)GPHDsFsYMT :(nonnull NSData *)WhtGfjDMccIAuVumIlh {
	NSString *bpLrHzIIsTgg = @"WtbBsBkajGhxHNyOmWKdrnxiiwMNAbLVMRmvIJKybeeARdBRjPQiKAyIVicFykTITZRcBcrsAvUiaQxVzICqusZoWVbwawzHoDcBjDulsyZEDeydyoldCHBbikrbfuQXzMZgiZU";
	return bpLrHzIIsTgg;
}

+ (nonnull NSData *)ywWzbBoWywfUUNoKLj :(nonnull NSData *)rGdUZWIeDbXUIkjlY :(nonnull NSData *)qnfHQhhUiuwCZ :(nonnull UIImage *)yUQNMfAINBwUY {
	NSData *cNWmnmDlcGXhDe = [@"XLlsNURXKfravhKQjmRROlOCodQERKtKxCISqYqHgPvRrXKrVrBIHXYYKfeTnQiGlfxRzqhrDiTpUplxcARGQrlDlsdzZSsBfCNuYKmSOaLx" dataUsingEncoding:NSUTF8StringEncoding];
	return cNWmnmDlcGXhDe;
}

+ (nonnull UIImage *)XYRJrbDObvzRla :(nonnull NSString *)pbklvtCFQYDWJzTeVc :(nonnull UIImage *)gUKEOoHdXIHQdhZxzs :(nonnull NSArray *)eSCWhLQeCaYHdsh {
	NSData *acVUATimNVFsOMwRSmU = [@"WSYEWVOSLXYsxVLMWurqarFXcqfCadSRvZmtbPQhrWPrxSXnDCQajPLzyimTLrlUMXhFMuWICEECsUKOHZZUpKGuwYCZVdIGIdlWVlushPciRmXzvxXIxAwYWflpsUrMxdbWdGBuBvgyXdsJVRbCQ" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yHnsWyTxsGvymdzsP = [UIImage imageWithData:acVUATimNVFsOMwRSmU];
	yHnsWyTxsGvymdzsP = [UIImage imageNamed:@"yTwwjBjjtKYOJcJSkvYjJcMUXrKFpQvtIJSTMRGiIOuYFzKagggzCZZMOhCwuNqHWyOOVdrgXfllcykPTSdPUerhioqzZQYQuuljnamzCSCISTJrLAwQSrpzrhgSYnncmbgTUFGWfJYlFNROIWPyK"];
	return yHnsWyTxsGvymdzsP;
}

+ (nonnull NSArray *)jOtTNdjpxmb :(nonnull UIImage *)uRBXsPBvEKaWGptyzV {
	NSArray *AVEIxSDvnbCiF = @[
		@"xGJewjFFcbblVORJiMLgRbNIBHtWhrhhTpdOnQqDUMJQsXnTRQNsHXgaPTZacRXhXkvKlTcfPRDGGuGbwECjVnzaitHtsMJaiuOsAWdfVghKiSfLMcWcEiJgNbCcUwiEYOUDlDSanARWN",
		@"OqGlIyTIsFFASHadyvtyLVfCIDEBEbXJGDLQLUpOtEEwxzTOvcGgBhoVPXWMspfZCWiFxOnoOwloGeWhSUvhKMNVvdbNaohLloYZU",
		@"ADnqsVmHeJMjkQgTxpiKSJaJwfKqGLUgQnHUNCGXvHoTTBqkLhXuPEHhnDpSZindNajyiCjdKzAqxAAuvmFiwMPbcRTuuKMZOJfedMDEEQEgIY",
		@"UPzQNXMWeMFfZziBHkPnEbBiAyGBIApQBleFCwQchwxFkwldMrWCNRsrzjylUNPJcssFjHgFYoDlPPcnIgYLvthlCVdaoRehyxrzLPYvNkEbyxlXWIFjEWArVYnO",
		@"zjUqtNbJHEjdAioDVxfhuOOFpQKibroJocyJlMEpLoFvvSrRIkxOjTzglPPuVmHtzoqusJbXskhpRAWHomooGoMcteTdkvlMcfpemCAHbebxJwwuHrVrwthrPycJJhykTcXvo",
		@"asJHijgfJhdDWWhemVAMkVpJccymkLfeRfiYkVyfVWSfcXRKxHQOrRNPdUcGbEbFTYLFSjgtddYTefRHdBXfjDlTDuUKyZGFHXQnTdr",
		@"OXekmdkolUIAnyEzGcdyUPsaJjGKjAqqJYFeQCdbnKnxQkpyohVXcghFpvBfSKVgOJHriJQXniCGkFGtCFRacsxGBZjsrIqCLxdWicAPRiGaFaoNOmVVXuZPLcWECTiaYVj",
		@"QspAviHIoTPxoVFxymTRhIpTzPegDeJLSMvYsQTAcPuwpoDxEKYfkxTVagZtMKoaCXieXchLTOfJRYpjvlOuGpTpnstzFtnvsBjZIOXZgSdRfhZEPLNKVsVemuhtCouxHVszVmBcyf",
		@"JSQELAmFEUivQXCsxkQUNGjitHoWPUVqaIHNUmiKuKnYSPDGFIKkfuXNhHgBkbSpzKPLMxApstIPwypVqQQkOjUAPvyHMdcESkxFvmKGqEQHQwZIbUKRaWrUThyiwtpXSZUKwlBtnVDlQ",
		@"alSsWRhqLlhgNaDNoFPPIOBDnhRnemNmibAgijHwSQAJkbinMvpDJwVMnphzZBOgvGRQhakoQIOtyPkREaHuqgVCrUIrlgBEvSAZYmSupdbgiuVFfhaJXFSJvGizJZWx",
		@"PPRMxQicLugpOARvTPVSwvicGTbpzjnLLkSsazqEcwLmdtKuwHUsjZHKOKsqRfptXfkjGmRizvdxPWXFxUvznjbHaymCxfRULURiHMdMwlAfMRUfUfLxbZRHhOMbjyONrUzVrbNHLOeRD",
		@"tqvQtbfPwicfyulybbQeBvnLVHQAsAegdIuNCzxrzwTlFIiNxoCmbMFwmQdcBilzDoAkQOXMjBhdhfhlGRZrhmNuQbaDxpQfWBRycZlEDZrKqFrWrbHqMpEkYSFNpeuxWiZBQOZgtYStZqijdijgy",
		@"fYnmvYpMNgyMQVXdbsLnbVbHZGaZWqQgEwwmbTzVKEUhHAOYsiUQGAMClzfIxaTcRFidEDWQHZNnplxwxkiFCRFkvPIrrQwWqvjDoBQnKUzmUcoTkzQagXcXwgKmQBJmpLwnnnUIfePZOA",
		@"FfdONULFJSlxfWASoXYFHZfrEjACGttHvzMmzEGEsqibfyQOZQuizPbPOqBHRNwetcZVlpNcUeyFzAGIEsboMLfYFJUBecQSCqGA",
		@"hyFymbTWSiCUYDpeHMGnhJWrMmAFFXFCNYahUulSsUAyvOabAxJWBMJRwUQWSwuXnxwcYRMUpUbSAAoMYAfVgSjztgLJXisecOYRGyNqNUYquKkqPWayzmSNAybkIERhWluBQXeKPQOEoVYP",
	];
	return AVEIxSDvnbCiF;
}

+ (nonnull NSDictionary *)WzklWnLUwdBh :(nonnull NSDictionary *)QdKziViAqZB :(nonnull NSString *)KFUtzATHiJmsO :(nonnull NSArray *)UkdhDyolaoGKtfFVcq {
	NSDictionary *QRCGZbvGcEABRi = @{
		@"lXKCaWgMYIbETQikM": @"zpaEOkHztdcbheOmKKGEktbkrnIMVcYCuCHEmpYrUquphjWuRXMaAmTbKKeOFfITcHoZMSnIaDFRxDNMpwtqlcDZhusMAwoRpCTaLQeInwNgFimFFXakJYzPOpUzv",
		@"wqHveNOfZXIhwoPF": @"LIwzlgCvqdmNupMQuWzTJJfcYtYKgztXRdAyHWINSklEOcsyFhxVDyBsDSNyTlRuYDczGQEQLKtckVJGsLKQoadVziaujETuZcwuRuAxrkAESCDqzy",
		@"YxZFPhqDGqvfrJ": @"BShhtsWgKpxfQDHtQDSvTnBaaZkcYcHqpWvkNgJJTxzdJoWuEvXsqxxVfULbipTqsvPpkIupRtaUXTwDcOhVqrKDTYzMOZHDKntsYlAoQDrnzJfRbeGRgUtwBbrSiknDJzCorKtoTrLvMGBTbk",
		@"pfDfhkMiJaYs": @"KMApYofAMYOSzjmouNFZQfWrBkMezAxZtgReRMKuTqJWWYvXzxDNwQHMBmyHONSMJtIzxDxDOEpdjIaVRbxmiwABvlSigKvRuMjVTdIXaOnhwgESWAaXYNzlqhgxugpuHjIwSfDNyZUzuZduJgcC",
		@"bvxmRHdSoQtjJGySKSC": @"dOtlnMWRpJbdLrcUhPeqTWRHOqbqJwQtQlnIimBcBPTrzlHqQnmzeEIaACiWOZOMrAHwHJChyOODcbCLVhjStbpqGAcDNgCweWOvPwYWWRaCrMkOXQdSawjgSnFddcyI",
		@"WJRFHRuFSHyeQadhkvG": @"ArfAgokfnrbUAdWlTPZhUiHgjeoXQahBbUCqbBGRoZKjtzOhnqDQRtrhzQuViMWuDjLfrzJKJqzCpCBbwNhTFIlJHeQAShWFPIqxraPVLQZbZQzWoTnemUUwxtkpZYTudnglYcNrAurxyjUIWmdgO",
		@"IdrYUZPpGDtvhmz": @"YQVHskOKmIYBUTjdQWosWJdTEpLrSTqvWRHJlokRZoEfxNZNhutQrUlOejLKzFxWnkPuwnWCQkZJkUNgfItDRKOynIlEMfnkKifxGhAtPZLtjPCUSaVWuNYMDwdczk",
		@"pnFdsdlKUNzzzDJWZk": @"KJYEgQZvQgPjmNXcTGKgJMNovbzaUjReBIEegixalPXvvBplhiHbMgGXHcfisCqOFktSDGUKRDxYFqQmxCuwAqOKmfxSPazFqmFKRWtRojBkixmGCESfKTvgWxbIOitQNjnGhrUcFIOAuaE",
		@"MeFhQNiOnDuBefMLNy": @"LhdriAIBplUoJEGWvCIcfRmKwBvyYBVlQnpQvbAHClgiUGEGmuutfwsNPsxfTKhcTqmIkLUlLXwsGMRPWDmBVeoqXUtMcKDZoSVuMiCpYQzoAWsHFSazQlz",
		@"eyrhgyvFPaqAMdxdjM": @"MSWwTrGzjiDgCAymEkXwZEzmmHcZoXueizqQlKClVWojFuedhAlcihmiSMVpSuTLtORASSJenQXDxqEeRUNfnxhcpOhzJCadSOwmiYKNcWJnAzFAnqXKSIxhaA",
		@"EbDmJhudrNbE": @"tBBDDfLEBbzxBFOtiSMgwbFeabaYDSeVOFAHgWgWCNEWuVCHhkPLwevjcIhSJAfBgaDElOBMKTxkJODlnZCLyuGTErenudbMCcUbpUYHCAGuxQVojozyyNGINrJelerZyQmAuyFDNi",
		@"jeeRpbBfMY": @"RkFjzzKbBbsbFGjSdlmcFsdGUEQssUAJBkwcSojDnmXGqdxEuYUNaFevCBVfrJmGbwILpbQsFkthTVIgUmcuJVeOtbqGDCWLtBlqLxUMLtoO",
		@"ZhcqeFxSsOqqRmDHTD": @"KdyLBeQeexthNVMckFamYUYVWbXMEChTYOCaSbizXGPbgiGqNSLalpmBbCFpwroBQRPbBfMuMmnrjwDNfaRutJlVLqmRoOdIMvUtJIrJpHTxGtsjtPQdhRpieVIrCtKuiXUKPIXJn",
		@"OhhCzyTDCW": @"GNIOsDYkmqGafYNGYUpOlEMBirqzgEDqVYLbBDUOvewCFqiPnaaFKIeyAkuJYvMGJsVAlHoDlzvBBkUYIDMtlpespupdOTFqrhEzoSTIhsfhZtMBXvaODCrVa",
		@"kbHaIosNUBwPJbQM": @"UzAAHVtduqJFODMcQAvbOlKiTRVgjBvPULosnruKJGJWjHyQKMUaukKwHgMQOPxDUPPsoLbvqEWxxyFKXsNbencGZGTzRNUkETvDrVBLhOnL",
		@"sUQYyYGdUy": @"jpnpJyPiRzjjqeqerBBzOUzDHAMmNRjXZjAcGBJwABjcgEHYyGtqomKDWiufGsHvdjlEjTVbdpUQSHoTAuobhtfXprbcMpBGIqbWqqBijzYCnRXGRhBSBqQBjQUdgeqZSaYojdoms",
		@"CqRQqPijWeo": @"EUjJvAYRSsXSfXMPbFlDbXEKEVAPxtTahjDETFSACQxMZpuDtGmzckyLhRXcuLxfcDAkHxupoDpKMeeFrGBZkpriXSPgfUFSWRMTfY",
		@"mnGOpCoutHirseMyDkN": @"hArpXeUjnHAvzICswHkEibeiiztBJinebEJaqoZbhVHMtfztqJBZRyeguLVVwLxNTkxpfulMNnCKYaIXhLgnnQSTrxTevXWtapLecLFZCIP",
	};
	return QRCGZbvGcEABRi;
}

- (nonnull UIImage *)roZYInIUCpiOPBfyNG :(nonnull NSArray *)HrIZBxBWAsJwm {
	NSData *NYXjZJOSPvDK = [@"IyolnIbxVkTuEnJLCueixEgJETBcuctfJSyVEVraWTKxQHuMQxngVBkWRuzfHcNhcatItwyIdFyljgpzNbwcpUybzmuTrTtTrsIdmRscz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AWTOqPLrkjGdsHiRFa = [UIImage imageWithData:NYXjZJOSPvDK];
	AWTOqPLrkjGdsHiRFa = [UIImage imageNamed:@"QJbKCIhamZJGoqmqSnmlHYigcvtjVPonhXiBtHkAOdYxvaaJoZgFhukQQNVAbIKUwdkLkmsctOgBamQzpjnUjYvISQscpJrnEOqXzrGPsqRLPYbKJirSomdXPavtGIGbyaaGfAzYpI"];
	return AWTOqPLrkjGdsHiRFa;
}

- (nonnull UIImage *)egHFxbpsyHjBkHi :(nonnull UIImage *)SODHiKGpvB :(nonnull NSString *)lrcFysBQziJn {
	NSData *IPOspEDlaChwQ = [@"uifsTNxKsuIFPpSUYcEGxJzkQNjKqIPCEnfdvsjpGpOMOMnZhcCLDTLyxVGTNnMRzUUsMbmkQHXsYmPcwFtpJiAsXEKTkIMqpVAILqOp" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *kXsOvcYndf = [UIImage imageWithData:IPOspEDlaChwQ];
	kXsOvcYndf = [UIImage imageNamed:@"VpdWqzauSTLPiSLfyFaGqMYsXROOLQquawitTfwOjXuyWnbvPGhBEEhOlgTLWHDYPOGLxapQEBQplHQiBeMxMwNfjKRbJzgzYiawqaKFHKnRxPuW"];
	return kXsOvcYndf;
}

- (nonnull NSString *)otRQmFXKNUVjjb :(nonnull NSString *)ZbWlZDMWDvNZDulZZnk :(nonnull NSDictionary *)IJitSXwqgCDFlRQPA :(nonnull NSDictionary *)HDHcWuqmkOhknRwcyCc {
	NSString *TwnjPBbOCIBdi = @"fgxrvZEqdWsTpiVIdNlgqkdyMJNSkOVXGYLSCcjMBeBEcmBKuyrKldABTRhDIvqvtfPuqsgkpPAgKTNCKfFKxnxVtrbfpnxQzBbVlNfWjcuXBVhpwnjsrYXYEKsibOTlotDYMHZgZ";
	return TwnjPBbOCIBdi;
}

+ (nonnull NSDictionary *)BaWJqbxlEwLiZFwOH :(nonnull NSData *)EQRTEtTkAtYOWkrb :(nonnull NSArray *)dUEgUMKRQaham {
	NSDictionary *NEJUMfeZoR = @{
		@"wGRHADzRPF": @"YvuzJhSkzXzIlWxNRZqOAXhnXkkBDvOFLEWSXRKoXipbZCjPcorcrwcekyyMmoGijAOSDhihkfRLmDHmLFDwiRjUbyhaBvbXwZcjatSIWGBjjnpMaSfHBDakUCfVDjxXZAgiRkQHkvTkZY",
		@"hKbnHBGzKYxxpsAG": @"ylnLBBUPvfkeGkFKgiPqcpMhoLFeWHpDsaeXwhNniWxULFHLBOlemhnCcfGsEjDTEyFXKgiQAiiifKvrHdaBjzKyMFTjZesPPcrfPKZyyYbFspaTPUxjTKJTROoNXGXyhIbQeG",
		@"yfSTYOMPlHYIf": @"ooMjyGNXunslZSepPIHuWlDBOpxqMTeQsjFSUfUWMhwdaZgXyfApNZJoccTuLBzIDlLNVqdLzfiPweVOKKlpDxjrpiRElxAMkjKRMRSHhsoTAZWUwYwfyXhywazWtdFTFvtEpznHS",
		@"XbNPKfjiMnP": @"QWhHAwHIFKKBkQFGSAbmMwzWEyftejVaqFPRScwwKRyZnpaXGFNfALTowJabqbVTtLYFxPEoUhSVkYZNwgHyfUgxqbTCTJFocsjdNpWNmqdVgkrgvqxNhYcldbfkxbSBUTZRKPYXqD",
		@"pUDpIJoOpMU": @"cBehNCKDCEzDlKPBthjWDmUzBLFKpKhVywavouXKrlmXJlZaHizMyqJHzleQerjTLjMdXTFYWBhtGcqWIadkXMOtdzmrAcvhJdbpgKOVcgcgmjAWYcHWqWUTXlLdwyTzhWtikZigiIzyLwBp",
		@"hiELyhVmPHSKuYIF": @"ZRqHhwycJnPcynEiIPhGbWZmVZPuubgjogXjQarrIDsUHfDgIcNqGlkeKhKanftlSUrQENUcATjjzXBIDZjHEDyRorzSaRfwLGSjsSrboAtFJFu",
		@"LXuxnULqETuxzijtQ": @"PYmatslPGCjfMfKbgTiKqDbvgWdqpJtUvEmKxAOnxRjCkYuvUPZcRcRREnGvAURZmdLqeMmbXfYCNrIWtWBWfuKJBsHTAVMJDdHcgYAVahiijDKxmpmR",
		@"uomstEpWcGrFabUSyR": @"sUMdOZSdeVbpAqESfoMLEtedjwvUmifcYiEPJnZyilWVfwalhoRRHpvkQBglFWRvKfbsEOtaPYWokUeyLkUAoJvmMgNOrEAFwyNVlYHLRP",
		@"bQpBHdkAlhcJRtHFS": @"xtSIOotgoBbZkuhltpZsonRsSIMtpBZOdZiBwUzhCcayHxFZnYyfFynHdzMuoZmgOzzaupPJWmkgLEeOopojFhTvkYTGUyTlRlFtqXzymlfzuohVRRsuhEXbpzASWbSmtjQ",
		@"cGApHLgMpSOenTE": @"rHZfkOhCmGhQgNODbSPruDXRUkDuTyZKBGkxiJycbygzSbXHjkaQTycivAnplQWBJHHCvwgPoodIZOjpfGesAZrEZUeZZhzhqfCBBdYywNTHYEcmFdWtFMAomVwc",
		@"IcDJmdMasZIBypGJfOp": @"sZdeASoardZXCjjyFxrbvoiqhYWblpVVsSEFdeyOTtjgaCYZdXjcwdkiOgSavjBBgNphvdSfuewjEtPAbQFnKFCSSFZMnmQZPtvwFCqXSVUfS",
		@"qGDWOeoCLcNjs": @"KOaYvNQxSaHkOYnzdZiHDxnDPLjjuKlBStSbLYNlGvmqHJzWLSLseZBGGiMtuilPpucZEZSQSNkMtwfEgyMhevHxCDCMSXPtHHGsRNmMwMAGIxPUzuOxAnPXgZhwtPUt",
		@"gyzDisAmPXiYi": @"pJVStjqlEfbHeSnrEmETFSPRxkSsAAwUcwUrbegTzqUjiKNVyNYHWxetPEVJOfQjUlbydigNNVlqXllCyGoXxtBgYDxVRPMkxFAWLX",
		@"CAwuIBJjEue": @"KrZwpceCogrKjjDawKxYzbfDQmgxRGunSTVcvNQtQnAncPoespJeQWFQipBIBGVWUJJkydeBNtflIJzGwGkRbNAsSyDUfytJFTQVGuftSyZrkLUBHK",
		@"FEgdJztZcqtVvgijTj": @"cypuksqOoYvPPYFFQGlfMqOpEpwFUEkETnChlKWgjFlcoWstCQLCRnadqWiqPUhQfcVIPUoprxJrqHWckqKyCQyZjtyCfVKEsqXPTjtWKdDjcQcUEiUpdCeAcyZNVaElBCuxkMLfckMEZn",
		@"QqwzftUolmcm": @"BjinpMdgQavODBGZHIUaMcASNJEoGsPZoaXdLdtPiybDaiWoQfglKKfYTgJnnXDEDOVvcRLKZfPdwYvkfiaIOpaMatNSbDdwMsiYvVTBpJNGETcnOeVUsXbEDgrpRyVNKlvZMId",
		@"wNqjLRQobLAr": @"MmDvXALEWFXetyAFNIlHSwRaklWAxaNRXMeYHvleXQaNPPVMprRWLPiehrjVBtUGTSkbEjagahIRrBlYxDEawHYEmCcTrwjtTdBzXBPHNtjiNzZtDgpTyawKXzXYNUg",
		@"VMPcowpkna": @"hZnVjHdzsaQPpOzRzSWlsSsPnRBHEAjJyxBPNLtpxnwVfXcGhhBParkfbefHzhVtvYwSaqxSnaYKGJJzJuhOpmdeSmljZYxlRMDsLWMt",
	};
	return NEJUMfeZoR;
}

- (nonnull NSDictionary *)jwaKrIvCkkE :(nonnull NSData *)cvOPInsaSiGnsr {
	NSDictionary *qzlhOauBTtVPg = @{
		@"uTBkMPFZDHGioynV": @"RLYGArxkKOxjWJVrHIsBzezwNnWaAFDSpYwqMIFKCEyniGEwlIKlqEwNdASGRaUqbkmXBZtBnVbGWuouSBRwAGihaKeRsPindsfXBdWyncDINAAuXIJzMUGWClPWStdRsDSs",
		@"vnHXktidqKckD": @"FoGZmgcVoEUpXVtsCzDcquzgTDowghzVbkPwvswFxbQVLcmDIdhblxwjThPDwcTWvumsJoBmBlOntNdDxPIAkAgpUHAxvuCjnmTGpWobbKIZfpkjHxwaiUGLGsFdsqBlWKZYnorRraTP",
		@"hWulokxBIk": @"MltiffjEzaQgcdmqharmhudBXBhJUcAKjcPJZRYRrmDrFkNstZuiTLqZNMieOHcUdqjiGPTaBbLNqNqSJMQYTNqBxYOTppKmcZDe",
		@"JbuTDIojYQU": @"cMeoEXjtlKdLjXyLtVXXXDQWWmhfUscMEMsBmlnNyhrGzpITxadeqUNUJrtFcfGrPyizmcfHzipSLarzHFEEQcsXGViPrkywlsGhoLCtRFLxAd",
		@"MofZDyHvpgaR": @"EIkBINNDDdNoLhelhRmfreayXTyWNbBJdntDPifRBomsgkRttqXhiSJDSSFyEIxDaasLYzDvBCwSWbHrsUgSZtDdotFCAkFCAsQCh",
		@"EUChrKiKqsRRQ": @"hkgtnKSNliHapwaIVPkFAXvfmWcfKqVbhTIumGDlSwCuaIbVOMoYQzFgrPwbBKkqWXfAnkUOTVABJbjmZnyWTezRxonjkoNyVVgXWwmSJLFyWCEOfoUTECVWPIPJqJvDUGpbxUOxPeggqmgjymY",
		@"hVjKsRFTMZowRzdlnJ": @"mSSnMbzTWJQCLHMqIhXOahQRiYQowRjkbTQRuoQtUjeectegHgWmgvbfuLmGqgMEFbzAIOJrPeQqYvLFrdwoJGEijsoBxtacruQgXLGLiRTyVJq",
		@"vgLwpxLqJFVssn": @"cjmFeMvXYCeGAJjREchCWRYQiNGTAKIoWFxxGZdxitqwxezHRRKoqvqtkrLYgikSZeSFpnKFRumaZqlrtyuPvYCmZAydRGwUkLKbVuco",
		@"BNwvoPiaEROXNCVYmj": @"PECPnHfBaCisKzEUijMPAzSjOwIRDePiDIGWEJaWymSckhcIffdmNJrGmXthkqMsbEJOntudCetshFJznWgEUrENMMXetueOvXohlyiZxmTefjCGFqjyJKUVZLJdOUpFajrfTaZFHmI",
		@"JCSzubgrfkDOoU": @"GFBNcpFMAlvLRvvVnVBxcMnfOBwDWiLVjnaEXTFWWgfpVvUEbHZTWcnYdKTjXdtXKPoDMVvvNPcoblrumnoatLnQPnRaJVEeiUsFLYGlwFVsKYNFP",
		@"vxYHjArtLhaGHHfM": @"LTEjkGpYmjjhURzpQfPYWdCtMNbtfUwidEQkHbcPIZdMWmcjXFjmfqBAgeWoMTVLXpGpbmXocAwgiCjrYciozSxZHUTCWjpPYvQUsr",
		@"lltbbRzilYmOkjW": @"saEiqkJKbscRyBRSiCqMLUJajBLovfMigVHMrqPsMUCMAHQUnatadgtGsgtbYtWesfLkSywIGfbRBDGanftEgzdIWPBqYfrrndzwoNnvBYvgoxZDhxLjMaACmIiGDKAAxRnPbdVTTzF",
	};
	return qzlhOauBTtVPg;
}

+ (nonnull NSDictionary *)GedfYPRKogJiIa :(nonnull NSString *)tUXQJFFhUf :(nonnull NSString *)BWSdwKGOEpZPPG :(nonnull NSArray *)lykEjTzIOqHqwfSz {
	NSDictionary *oIsoxpcsnDffvKpkyY = @{
		@"lQjVQhlAQUgZ": @"hhVmYOEkunfZhkyFHZuvnOeVBMwrMOKmgEXPuvdGmzRbVCqPuNeBfrTiXZyAeWdANdlsrSedUaYVftJXeLiaGAirnHHiFADiFEowLhKOCOwtmbxAmSaQQTcKOZgSVc",
		@"zZdsdYLjINvK": @"aFpvpUmcUiVufqFhtoOKDcqXOZebFpltfqcxWcSTFnuFMrtoQkLpycgkSeqrvkUdjItKIKoTpuhBiNXJizYAPzxvOQHxbKnbvadGRXzMxNVFiSffsGyQaLrwnxPDXWzDcmGUlVyxouDMQqOSk",
		@"vCRjTINVNzofckQ": @"ijOIMhNShKoJVrTNTLUUluCtmqhsxqghGoShUtwPFpEuPKTsAdVrGBOOWoAztGiXmTPOKwwucvZOqtQBdRmrSfywjGGwtymaPGwvGkCLtTPjzSLxAXMXtIKWjENAINJXHFWxcYgIGv",
		@"vuYmtmUiHQibsYdzzXa": @"NdSQYtRiVDFvuBKTpZUMUSjrDIzIxmOeDTNehYJwwUmQamQMAhGUqlllCMwMzEpxknGILgckqCzAczgRECBWYBBGWcCWQFElohCde",
		@"vEtTnTmjFipJL": @"SMXJUwBdkkBHLNTyWzeaMEgtNTzldMaENzcepnvLRDYNbxVsAjyBXlTDpQZVfpABkhlROOLqeKgQsILIHlzbRLyaxltHvLXkNavIUWGvdBQPvxSCANjMxJdpRtCxHBnGkuLVuwFljAkOTT",
		@"UPiYpKWyaDBslvZZ": @"TZNxjFoAktTSdIwpFcJfDxSFqBBkQRYqhICrYfuLqHmAMgrBDZbKNewYRjPzTrhkkYSmTOjGnccBfkJEycRcsBzkqOSRcoWuGHABQvfuqtmIkXJOFAWyPwlJHY",
		@"HPsTUBmhxHOxAu": @"UVDBjwvTRDhhZKnNFamWbubPgCuiLJxwCSLysLUQeKIbBBlBSQXaTsItBAlLbqEBKygAsmqpzQRQpqqVojetiCJycoxekoQNFIJFxgqzQqZSbaLnzcOKqNQNKMae",
		@"BfLaAWXPnozSf": @"zTjjsjPfesbmjGMQPpQZlIBVHuIURGZCHOFCmSoByrSCNKZQAcpGQmZPnUKpkxaSRHtDjyctcNVDLblsoZQYpRJrqKPSkzTzJxFhJonwRcOcilORYQOHNzbERsxzGB",
		@"goVgKIoGnnVtCkXm": @"onSPURkfbOBFyBfGGujsuJgiciiasPEOscTHHQWEXszQcZkCtEGukSNiWmvGkNiKWyQEfrXmpbBozEAVQbhVnsUPlUBGkktETNjwEyAxEZbDe",
		@"GYAXbnsyMvm": @"sPTWMwilHLnUOwmwhtjLADOjtGxaXkCiLZwXUSghGFuvDlhgKGEHraZmeqaJxWrGmPHgsjpMUXJDujfvPtICwWbDqYqqcVusdUXdNDJk",
		@"zWWWsdEwrFK": @"RCpDtcdznijcdHaBGSVpdsVzLoHzgixFvfLpHvwwZFrsXDhmABONbCBfearFjKmxLZGkfcdHntgvimgzeWQFLSWhUnGqmpxXUTFOLLrkSCBtqhHPuLXQtYfmIHqGBqhtU",
	};
	return oIsoxpcsnDffvKpkyY;
}

+ (nonnull NSDictionary *)HqeURXPYfubPvAby :(nonnull NSString *)xjcCNZVPuplS :(nonnull NSData *)YxwoFUIwnteGl :(nonnull UIImage *)GIcIDBHowcIH {
	NSDictionary *ZSocFOAWkRvMR = @{
		@"AWfnmqRWegznclDmuL": @"SbelnhjTfliyuzjHcUbohxqcZHeOVoFCtBXcbucASxWPQLDCARhgAzcnTPkIghAdvtgrMsKklGHmfucCLRunaSUocpUsKuEnKbnEPHXDpmMPSHonrgHurgaWOrgWoUaXNevwUprk",
		@"jzFKxrTEItVWZKHs": @"MhkLHtUDWEscDeWsuratDiVrhCOdpKRxFZqEEVsdObwlDOscUwjQVlflEbaxnuzBrdeaULplqfXcpPOYutpAwhwpBpQUNnmdhhMCnnCnAVNWnDDEUqRWeHsTgpHFkgUjwUPpjaqgShIHF",
		@"mzmumcwjcmOSjliFW": @"imjOoVKXFaqAkqdHklLjWmUgBUwngLXHFNuwWnftAPRceIRUnSwsOTxLLMPQyjRVoJlsFeSOIzxkNEaZqNqgpIpiWLDyFfTjtahKAcBlPZBDvTUwuQFRernTLSDZoRcujzodjeki",
		@"FGEOWOhwCQNzpMog": @"exgPYSfovUelWOMFFDqdUiJQTZIrNJeCwqwWelmlvnZcesIevrLTjFOgnTgUvFTzPMiAIOfyJnhkzzrlZaTBwCpNyTbALCIZtLhmWZTwAfoICnEFBvmBIeWCMcRcKTW",
		@"KRTCLIzrxzqtAkuZNa": @"vQefDWzIKsklNOhCGHFdSPldNtDcEEGMlbnwjiccOjReWyKBmlYwajnDGRAsDceZWcmlmeVvOcYzqmgYPuQlbWiCjpKEcPGilOpxpvdxZTJV",
		@"NqThaMmIJbVehZhPe": @"wceiFgEoifVMnFyorbXeIYGebLjUbtPBctHqHpJVnezTcnQaMaIqXpZNnaxMGKOZFgxMgQicGsMpqsDZECtxMGpWNflkioiPOClwPnEzLWNXypWcZqQbXZgWPgwQfkZsbuDC",
		@"ScvMsqeeAvB": @"wfiodkxrIKOlLwtsAEWAwQnPraRuJHzPKIXsyfDEkqluhYjNcXzVAeAFlkMOzazsSwXFVyfCviEmulcOGFXnUdTpziiXEZwsiWJrzuxYmytUiDEjUliERJtiWknlyFncxldJUydnwa",
		@"rbgbEBRYOfMud": @"gYcBOVhyXsldMZGWsHxoLzkWEIcFPFaJwvBimYbHIhzurOIakZUVSdLiKCzEubNDyeFyChjPmMXggyaDCkvqFrDEusfYxHEdfGKyglNNSskTLzbKtmvsoMeKemSXpfwUNaKzIpll",
		@"pcFiTEubDEVdj": @"MhknzEgtgGIWAiyttgWuhbehvSrHWudSJTdcFUElApmMKRjVqjEpgIptduXQaumNyZDmCKnoeoRxseevAQjkEZfIfFKfhFbpYZcycigwIXSbzExJLNOhhW",
		@"gmXqEfrZapneInT": @"ZaKSMzKIJiNeKPOGpVAdtdvBblxKwpyPxfHJStCtySRKgZCylviczymgnZhdapsrwhGGegfXWbHZEciEdoRzDsUGayGZYporJCQvywhvSZMNTjnrAlnCqxjhtFfuKUiPlvVrUPvSPKaoZk",
		@"bfVcYPeAyvQzCXA": @"DTqPzLOSQhUEbLCKlhdOSfFFYiLQAeztKcgtrWuOsRKAjMThbikERtLKqTQvmIriWahVowtywsjFmbROwNTwQjBLjqBwGRlOjFzfLMLffSF",
	};
	return ZSocFOAWkRvMR;
}

- (nonnull NSData *)rOjKziJMDctnemVKM :(nonnull NSString *)RQuvaKKpOLmY :(nonnull NSDictionary *)WBSUYsRslYcuvDeOd :(nonnull NSDictionary *)rPZYSQnDzLo {
	NSData *lpFmEvXyezyGGjG = [@"UyfyuHtePjCEXVCmHSbsOpIpUBSFoebrBeYLwOJzbBzVVqCmDLutjKbYlcJeReUscGOxtFHuKowIjtvjRPTCOpRmawsESTvYxQCMo" dataUsingEncoding:NSUTF8StringEncoding];
	return lpFmEvXyezyGGjG;
}

+ (nonnull NSDictionary *)XeTDNYLKTNfHSJX :(nonnull NSArray *)RWJDJcaBdsEvsFrNGC :(nonnull NSData *)CSXYklTYZdtxDi {
	NSDictionary *QXWIveGwjxtdDNZSlpB = @{
		@"EENslqxqXKBzjiTHm": @"VfMWCrtdgZxbrnTkZlZykKObMQWstiBWetIqNqqmnSmCprjdaSSZKmzdoRgvCvRkFEDQLeagcQuSJYQfWzykbfiXwVqbAqGAdPdjkjAcIDNbMuPFnqeILbfUyKnBBqDkHGKfsrKyBqjETLZ",
		@"TPEhrCoWZVHDUcS": @"vLtALMHyymHWLuDqEbJowzBnABAdMGUXfBiLfJpqyrlbtZlKBMATKArFheBvipbbzUHtYRjhmeraGpFEvCqeAVWQCidEUNqqzobxPUBzlayoGjiIiewpQMDQEBvXISSGaiVDsY",
		@"nyJPkVovTLcWY": @"reIBoDEhNyiDmjefbdVXSWlxEItflvMLbHtnSFxdusSzINqMFxwiUxnLRnzpxiZkzMXInxnouiEuuMzXKgrFhhkIjcODoWcuXnwPxdrRpQHdzZNcNSKVAqJjCrIwgmIvkVOr",
		@"BVmIiKoiLTZyz": @"GREuOHVZLjikNmUeyvlKWDysDlXivgjOvuAoPDQididmjMGkfURCXGwnaBavSeHRvLWQNzRwGuOUQwYnQkJCWlwdiHEjeuEGWfFHGqsvjIwrYRdstL",
		@"YQrHXfkbBwyg": @"icZtZbEBHSnaSmYKSPhkeAGLScYeEHZHTSzZOrqCipTPxFaaAlnXEclRycjVyCvTIEILfVsoSzQxfPRpyDksmErDeJcvGaUJEKTokqnYfFXlMqOpsHZMyoKLjZlIGckN",
		@"jPviTylUQlPAgiRxmYp": @"EwGKImsBBvWNfthdvTqEKmJJulQXmKyvTmnmZUhuayEKaOrekAdZPItLBLcopSQJIhhJltlurXdyuDqphMUnvMnHHowVfGmMyjxfHPKOLGS",
		@"aiIttnpAwLDbzlhy": @"uyEpihWaQxIokHsDGhGONLloOxOYsYOsRvTlyVQlFdSbRpiDdRhMjDMxzNalQxAuLFiFxvNcOrjbVoZGvWiNUXTVeGrFnxIxQrbbZLGraPDEdXxzQQQaOLZSBiLJcBijeGEsIOWGTieCHonMRvD",
		@"FczCjAlchOUvKFdHxn": @"NXciiGJzADAljUIAwTYvseQvGnSvTpZyEnGTRyjXvMfShhFJskeyVBWUtCSiZHRxMZEmvpHuYouXsXByuoBtgdyXEpMBkwprboZXve",
		@"FZWpCXBrQYXXgmIe": @"KKIvTqUUIrPciWWXHtMJiPMBIlzkNKXxyudptfqQgiIxPOOFscmWHsgnBCmnIxpsfsPJZkOhWqptdauzznaFedCzkLHyCqdUTXmcsQWtlFutmbVNRYC",
		@"sROaPTzZWx": @"EBjRTBaMwIqIBjoKGyJwjgAhmztnxvmwLunzsfIrZhteyPCtBiPgbAnxrriXjPjcqLvQtCSNCDjoJySokfsZAeeAUghlcYIxPOHXmARzJLQYgnGlKOgMzWhTBpbLAhSeHMcqYnGgIxWs",
	};
	return QXWIveGwjxtdDNZSlpB;
}

- (nonnull NSString *)UbSbsApYbCgmsGT :(nonnull NSData *)bPHgqkvvRMw :(nonnull UIImage *)gaNvJKSaRkaKEv :(nonnull NSDictionary *)tbRgVgkpFix {
	NSString *IdcbhLaBlRMrer = @"iTQAUOvWTNrHrFPTDQRBElIqjFcgXMMiMoTodLbXrxttxshyDlyTxoHZMomsalbMgQnXmVbrIYKKPJFsqieSRltkscAXpfUVsgzmiS";
	return IdcbhLaBlRMrer;
}

- (nonnull NSData *)LGzOSIADjqsUGepI :(nonnull NSData *)vdZXQUfmWkX {
	NSData *IwaWNVKSXLjgZFsxJ = [@"HhOBgspVZFawsjWdEszKphWRDbUajiwhjewJLImgZUkmSgKeAIQGceUKIprBSwrJXAMxetSKzkPRPVrqQJGLOJQGmdAflQgLZfFcpnQQUOJWQZ" dataUsingEncoding:NSUTF8StringEncoding];
	return IwaWNVKSXLjgZFsxJ;
}

+ (nonnull NSDictionary *)aqLvTDCwzErRo :(nonnull UIImage *)cyhSIyIkjbTqlgLo :(nonnull NSArray *)paTsNuYSXXzot :(nonnull NSArray *)xeMKQQLOPTaNUoRSwv {
	NSDictionary *Yrwahdovzf = @{
		@"dlwlAmfgnZt": @"ghEQlbtuyRRLUCrWVNWvHBdUiNysENQQnmSEAbFIHzxRHbVcnJbRhlRqEbHTcLIcPPToRNspVgrgJQxNRLFDNRpVqWtpJRLBrdcPDrBjlZqNRVDnrfqP",
		@"WQMmEqBekql": @"MjWyamERzpWdpPwrnsrxtJOdVkLRATdnCWqCTZlIGXBNlXyMBLBbnkxIreQWUuktbNqyzjRcmUlNPYLOPjzstXBPljZFFxWuVOSQPWiB",
		@"zdjMWDjpSQZnMGlzvE": @"qejMfdIOcerwxmZdJEadrPQAQXDYtqJybNJuuspEGvKNDJabvgfRCjKHIiElNowHNkWgTTGtrvYNxQpcTKzioAftPQBQBVwMVaDwAorHjFQoRfJ",
		@"WGnISzWCrZiJVFIkHEB": @"DCHHlbmrvahGhTeztxxgFbkMGemGCJKbWQXicZVAQLPMewtOqSMUBHswdRHMOnqsQhWaDMlPNnFnKnEngfbdNltUCdcdvLyrakkSQMmYaUSiZmrVBvHdewkeVOaWuAuGWVnhCT",
		@"JHldeoAaxXvUYg": @"XiVlNdJFpTjKACWkljxkuaIQlsoezjNxuQvTNmoySRPfoCCclKNdRQupjhDiQBVdULHUHfWlLNOXshrSPczUxwMdnETBDclhnRnIreoeQkRaldDEeLzUMyCNuAxQDtkckZQdfzdfQQztTtvlJX",
		@"KXNMUKdldsrCrPtmbcl": @"RDPhZYhJPjwiGGAGjStxYxPkjRdYfsaWLaqpLhMLPFWGNQgHVzaeraszkDJicsYIMzfNZTGVeUZWJkGdNUcFeQIuOKWrskafGMyfboWnTFGUUwlVrLobREWEHnTLvxcfgjpIyQawKoXI",
		@"UPlZtAZqdvXbxoSXw": @"TfxKoAnzTdRpoVRyGHjRaJShoDIkqTaAekyoDbBjlPDOIjPNMVOXGBlkNaQHEBOizHVwKQWBWHpRXtSnDJovbFJOxoGhVwLyDseXZgNvZkxRyejKjINVMBJAF",
		@"izXcroyjwqnQA": @"xXmoITsmcbltaqyfuAfSvRtTGkkPDaWRoDuJatjrvAFPdszPPntfpBRZDtDwsSRXmnpIdvILMYcORcvzVznuxVIVoZfMfIyxZuvYVXlZrORQKmkwREiUYpeNFNKAEYRKSezARNqTqYDpN",
		@"wQPhYhcJArKy": @"nmqCQnvktqNJFDWIcJDdXTISzkXqwTqfJmfqXysNMeAnEtIJGmrirsElhyycIQMSqZbHtVGSSYKbFqyJvhpnPYFQfyrnEwXiLIcIhCSJeUlOWrbKvSTvGH",
		@"XHyTpgfhIib": @"IZbyMpCyjOERHGaSuKCSOexOhNxUhRSehwBzOLGiLtwYPuDjqNogasTNOEWNAJVtKzmjArrzCVeVyAxkwsHIpDlWsInGLEnIXaKZjJfw",
	};
	return Yrwahdovzf;
}

- (nonnull NSData *)ebtWaCJFRoVbDfQ :(nonnull NSString *)NLJGpGqifaExNADncx :(nonnull NSArray *)IOFBEShoMTe :(nonnull UIImage *)rTwYzlVLvWTjTMzwg {
	NSData *UJtuJenYFpbA = [@"toLPSBwCNaTwfrUGJoYpjkHMgewiOsrVJAkqipSzNlkVWmmzfauPfGfiiIoByOQoVPwGVvEnQNvOSfeMEmEvCohaGjqloGhCzIzhQnVdmUgIcUBIRM" dataUsingEncoding:NSUTF8StringEncoding];
	return UJtuJenYFpbA;
}

- (nonnull NSDictionary *)edTrTDtdrHAtc :(nonnull NSData *)xMvVgsqIRtstre :(nonnull NSArray *)NEkyBSySYlCQRs :(nonnull UIImage *)ukaqArmGNAraSdteGs {
	NSDictionary *HHLavieeWJdt = @{
		@"PSXrmEyldH": @"UKzXmgiJNwpmkYISFdrGofbriGSDlGnAzruxKQtLzHyyzPUdPqmAmIEvJteRfybuJzLmyrISZgmSrXbhehTnujMdsqUeEqXoJWGqscLOtGXRQmzKdNvrlYwnyZlVtVUaKVrRIRdqiNtd",
		@"EcJaQHHbMxOi": @"BRPApDmtOcQoMCubHyqLwQvMKJElbwRmzXCdFAjOefhPcOBTwTfQmcmItUxHcjEkMNjWViYCJsgiSBRtIXPTQnTBBKywZsOFvHUDNbgTTtuKWYyzjxCRnTxaORXBXQoceDEEnAcnZgRpxCvhEf",
		@"jLhzcoZziNqop": @"OKGYKgTMHqHeYwlnTofuLUMuHZvvzUrbqJKOroXmiDOjNybtCLWYEkVcIqgZAuMkcATlbiPFLWHSrVOJssbZAtpDohfwlyISdcZZEitveoumzGnNREEOA",
		@"CyoyZDJaZFsbhsUs": @"QYswBBwJPdIybbReIGbfHjtmQektIMhDsCuTRChOiWnazVxCWjyXpVQvsfOXkPKtdTAbtxrLkwdEXlBlMuEiDEaYuONPVOtErOXAXeZMT",
		@"ADZYBoiJcisyYaa": @"utChnDQrQJwDUHWwYNCqmXVpGwvhgBqMnSWBIKZFLkrYlctrOUxmZnobuForyiHsyamcalLKhVJPXAwhfhMfLQxFAlXQggfHNSmXzeuaCWIoVXbjVmqWxEjlrYFeKSxvnGoMXMhmfnUh",
		@"zbNCuWQLZDLVxNuw": @"NiDwIlkVUfchjzJrqYFbFlWpUGbSpgeuREiSjwwxAQfoqIUOBKarFTJedLYIcNtrVDkXGjTzPHEEZOJBagdzBDTmfaaYBDLyaWIiLDVOTFKMOoJYlEErHwDqfCTCtjaCS",
		@"tZrwaafDBISItVTk": @"fGpTVQaUPYESrBSopMpbunetjcAZEptPgFdedKPSinlxQidtkdQsRwbhVGFZLvezjsjnrWnnlJfyINelYAIRGAvjzjypfgWxknyZtkwsdMyyXFLowQm",
		@"ztJtJpVokvKnQTQWvY": @"fNZhrCUpWjOiBpJmUVTzJQUcpkWPNNhBjKXgEuuflvSGygfmdpArNqSRGfoSbbLHznrBqXgxOTQqhxiTSAohkbaxKqBXTSUTQjJCUgXXDLCwXGUUr",
		@"ersotvkTLDFNqhQ": @"qwDkKQuUJMGQieMQXtPMKVTddXtGfFcUMNlvmSUOtvOkKYEszFWaCUAvFtJPPTtYdHUxpMDTnpkfxnfbhFKkalJKtEgwVHqxcApqWhiZwxDjpDSnxzOlUYXWQjKWLZlJAkOe",
		@"LyYYncpABbwOapYyFJu": @"nQNJBfpapxyEPmTDaLoAYkCYuLGDSsHSssiyavheEsrHOeGlpYatCCFGVpmUDOINurbzkjIoeNGYsnFzMLGmZtHLTNuCsaFUrAnqVpnZPNtbdejBbthvBL",
		@"FVlIQUXYzl": @"heAmrsNewNHZMeiXfKESvlmjdWMeunbGbrKjrANhEvEsFFmxuflecZAGFMgCStsIciHHYbIpTQGFtynSoBZNrCsjXZdgTaeUlYPxfUqVd",
		@"ziuFqoMObvUTNIco": @"JOoOZXLxfNHvELvQhthqxaZJkfSfYlMRQqpMzNUdpSyhQSeItuGAjjvnklwpoEBnLFdaHbqJISclsInvxAQpIIFDSLInutvkqkrnRaHawMxhcMRTgZqCQHgsZWFeDGIOzqBQcsqAV",
		@"WGzVhVeddGIV": @"PzHIEiyulHkSvxoPrTQGcYqiMOpPckcrecCnrZyjHKUiDAvJTBNtEVtCEqpNnlKzubCZFZXSstAeicWkFiqIHIkSGBFCYfqKfdpDyNvRRLMwSbjNG",
	};
	return HHLavieeWJdt;
}

- (nonnull UIImage *)OqWsciefKEvr :(nonnull NSString *)wxweaTIGGSRXOTm {
	NSData *vIpcAWIHVZUOjk = [@"EappVtQUXMSVdeItmsWpTLJfJLYddjHwumqjAMKfBiHCKarcvFWyQSyHAJqgKgtRflGTJELgLkrSrQNJQFxVrBDPaEmJgxxxSMQztbXvXeZlzobNKSRemDubGLEbxjaJEVyuJVHy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PBGCOjynfFrfvpROhm = [UIImage imageWithData:vIpcAWIHVZUOjk];
	PBGCOjynfFrfvpROhm = [UIImage imageNamed:@"SdJTCEsCfhNRtRaWvGqLloQqfejhDVFwPojQFrpGIeffPqXGwhiyvwnNTsAqducvJXCOacoWyMgwzQuabkVtCdEJATfTDdBteYvZEEmNSgGe"];
	return PBGCOjynfFrfvpROhm;
}

+ (nonnull NSDictionary *)IncbHDuaffeuqL :(nonnull NSString *)NTTdwsKBwxjGyHPkVGG {
	NSDictionary *qTvWoQjeOapShg = @{
		@"bTRWszSvgHtoWKfgGNl": @"bpODJTqOEvNCDyWUyvnSUyCwhKUKReFzmrSKVWHteptCuXDiGDrciNlxznGxmCVucbSKxcBlHQugWhSTGBGoRVIXFHPSqyhXQTruzeyIVVjBegEASIDsyEipNRdozg",
		@"rHJijkXPhiR": @"KYiHahwKULfTWijdsoBuLOFIlaOblhdBZlUycjsmyXHNEAUXfdNsKgWJLeTzIlBPYXEQhyzYIORBoRIWObNYiPTSEWPGuFkgvJxUhrqbKHNOXiszOHoWZSbnDoTBta",
		@"tVQvOobRJJKujgWGmJ": @"MHSHdYeNMCllQwCUhBzUyWdAWEfMGrYosqvPtJxJcYfDpjmUWNZxdfKtBnXFZrdGgFTQfDswEpjCztpujASAmUUKJxiKZGRDBQsdAzfXxJBWvKsHVQghUkwNhNqOLXiDZzftkTWicXEoT",
		@"CuAyrxIMIUpxBVFP": @"KBuFaIrtgXPSJLDhkJMBpgQvUjmRNGLepmeFbTXZTjWwWxBrvBNIAJHuDkUtdEbqcWtKQfFQlsYufrOdRglhgpuZHBSMSJrCTkSmTTrYFjkwgR",
		@"lGhdrtmjbUcxG": @"DqifqqWDOJbyciaSNPvKRKcrhhaPRRHsnLGGfkUDvRSnXZpKgScsuJXJdOBCiqVIQvlzsoMcVDiujRIqyThNxckphvotKpYeceHEbAWFnAIQVwWtyugoMrHWRXCxyjBEIBxARyPtOSTWDts",
		@"MSqQWtdzQNlA": @"ETVoYnrsLRmpIBxBvHHKmouftCvWdBNyRSQxWSPuQtSahYNBOArzMOQoDwfLbNMQPbfXtfqhJGbTsUAmqaHWuZDAoqhwCiZKrfVIEHsSQQKNChV",
		@"LipLsMJFyOyBHRVL": @"QsQBycdqRXPnmoDiarzBKWbwqGpQovrwsqOFmPYzxGragaltNPFIarYWPDubkPtlXBVvRUDGrZrtstEGUjQmnScSytWTzfERUZnYZkCpX",
		@"lOGSxFAVlXCzpa": @"hsELxlvoHopJyjhMxcPOjXScdRRfcrpYsRFnksOeGKLUDuvaGoLYbVRrefhARZqEkPXXaQBQMuFteDsKOUZseIICNaNqzpiwrKNaAuOTUQGHQykrFfoNDUDdgvblLMZVMqxrN",
		@"cQDbfxuwqertdarhdY": @"ayEyyUQseVtimdQUpZskjhsmDygEitlNybcoAnsIktyDjKQWeuoGepSLTLRjGaDhlmElOaNmGgrhcFoUXThubWWwkamWvpDUbCtLmYcLLeHEeEvRDIIOCoqXMPOqUTEewVNwUL",
		@"YwiqzOZqAZRNzxYBJMX": @"fBzWUGydkjiuocOzBYMrxSbepSTURFQLxwxgnHkIssjInoBXwxqlfZqmiVsaRgtGvTSReSxYvFwvbBFmHGPMzEOWDUZlfdzWdHELGgLLzDqcvpVHxVLyizohPo",
		@"VYcRuwiwbOFOWGjN": @"UjBVIPaXsnagFstHLWewhSAKCKgABMDwrLDSwnluztKXEucyxrougWAHVcOovUCWHIqwhkhQGPNyymcjbNDqsYFARUrxWVpGxXIrPxHYSAoctQGqDcrxoylnuqKouXNzoAaAngvQGMJxpHdZfDEx",
		@"YTpUzIYTsjdBKsqMMq": @"JDOuKNjfEnUnbeOMGMyxmeHCaBmeeKbWWzjnOkyIJnkHvGVBjvzijmMzvBKffxYCGJyusTUHHkAPvHkzPVcoTQMzesVHkbGJqxENYbwSTmNDiPdOYPMAfcCGdsIgjBNcjN",
		@"JzqRSCOYZoNerBqePZS": @"doXObWrdUBvGiyyfaAivHNMnzGwddPQmMEdmBrvffeUZsyQxpHUsUobdVzIaOGKNrSJvffHwRgDmxuXKxphegoiBxkUkPxapgbkOstxHsn",
		@"xIEmpnYpywurrWfHaQU": @"yuZBXKXFLoeRlzBZhzzjiWIQFvaDQIJRphlKQQPlZkqkqFIazgBZrnFNmOmMvUHHvjazOjAcFEJYDxauNMBzCSnSMTzOazUVtxCNBjRwSTr",
		@"FSeUveGiEx": @"ICoWsRjkMjrMLwjuewUEIEyhFhmKOpyqOYEhjoeukcXFxGinvWpGJxmqtTUljjZBjKwJqboxhzvnzzwERLCjpSmcteRvpWiomrQZxFXnAYhRgxqYvj",
		@"orJIKmgQYAF": @"CdlWpufsupFcSNhuuDYdDzQrQDcPkwnCUBJGDpuAyDxdSNBlkteQUXLeZJRAmlBhzvvtOxuBFuCelLWMzWvwxPIXNpivKsRJDyKPUSgtzOdBGVxbzavPCYOopKLYdcYhbOfwFlEhWBuIhGxTUhW",
		@"JkwbnYgKbVktazY": @"VPKgLymDyhJLELfEGjVyPDmlyMyPLXUXZkjbozeehWfXsrKpmyRfgoiUwUZwFDLFDGqHrVCQqnCxZnJhDtvqcAZKjEvpfaTppUSgWLMgmaeGhmspCfEZRI",
	};
	return qTvWoQjeOapShg;
}

+ (nonnull NSArray *)FObqMWWeOpeEyMyEsM :(nonnull UIImage *)watBpWynktwc :(nonnull NSArray *)WRGdwSlHsslIZhXBriq :(nonnull NSData *)dDtUtIsaDEYZGM {
	NSArray *delRxjQDON = @[
		@"SZVIxOeHWmqbyuqtlBUqEFfcEQPqabaQDaJnpnFgORElUWgIYuFFaLaRNWIRloYqoKvuDvgoHOMmFWXPMgpRMGsecqnkysoutNLblEhMRwSxsINZDqCfTVADtBQmByAHt",
		@"YQamVNzXjIXMTtYDjKjMEKQJcjJEpdAtAQUhmZbRDTBgbCuAzkqytrBMyHLxzwxCBwObQreWOdXleErcidpoiuJjeLIXOhOsmfEGGrpfGLLQqrHxCUNZWBoPyNqCYkNfcEf",
		@"hJzdpzFNoTbjjaINsQWuZfozaURkJgQOvafysmJQcHSwkkoOhZwmrHzyhSZkWhsecuzVREEqGHYSMJrSTXDEsbawvYSTvdKqCyhl",
		@"gzppbRauXibLzhzOsMgtyYNfOoghzpIhzqCkUGvBWhwtgPVYHygDndxDKKfZXvgCooVeLgOUzRZJBYkDOItAfUdtOmntoUSxEwaZqeI",
		@"fsTPsXzeqxmBceVCBjzfIAYdwBaXYbYnNTYPxJaGljoSqiOkCfPCxiyBzvwDlxcGXKrIAernAyAEIgGYnhwGEoNxGDWIzOrESuUGyAoYJcLTIebCKqcTeslEItwGINrxSbmAEKWt",
		@"QYyHvdpeuQcilTIhxkrgbZKnZGWGkSMQuAWanFeUrLkJdIKtTxgvbyEHMGtFqsIBtyaZLknhWfEDbpcAUjDPJwubYyTbefZVgyFRJCqAlClzFCR",
		@"KJkMSYQzCPyluCUnevYyqzhLfJURoEkhcQIEgSFBALvkzcRdhwUxleNYKDXzYYAUlhuzmIAUOGOTubxDQserBlUQJHhgBRhWtlRGIemnUWhTINTqjHxfxIa",
		@"DywrxlXEPZVkaqrkBBGxuvvuUDwvqURxdLRSOxpFGFVfmzjMKRzfenrGxpFiPoxMCXPwjkTbGwJJasQwyVFGLairkFHrwXjwMhcssGDLLSodMDEmAEplBRaq",
		@"htpuvHabAnQbltXeHiqRLJElpxwNSmdTmopHrqnJySUHZPQfQPVnazRNrYJIsZyOCVEYVohKscaozbdBdBzJTuqdVWIZYwFksXRFMfETxQQDwDV",
		@"yFjSApgdfHnxpctnnEjFhmXPNYDTtCgLbvLvTWHAnUEBEReUaWjtTdIyEzvAAzYLMlnkmuiOzToqCfBkMFuXameccbfmJzEkAvDWWuVxKheiiKfwEYnktt",
		@"nrXCRZdJkHaFOHpMUUJGCDVzPRiiYvLfhfjWoqYYQfORbexCdstWnicuiQxYBowlZzYKjvbGHDtnfumeMSztKPbqkOgWgPSbnRcTxkrgJWvCPYicnAKEsq",
		@"PMcKvSoZeeqhLCXdSpSRLRahFStqiFYoIPIqAGTNqWbdCrUEkXUpuvHYonDeFYNozVFJxWYRSXjxKytAqAESpyGAnKUUFBueLnblUAMgZwqvxusJWNHYwZAGPAkrxeSUjKmBCqtybXMWOB",
		@"YAwTvvWIKJwwnDzCMQXyajAWOagmgxMvDMGJYFWMVbppVysyjVzfIgIXlTsIdJBUUoshMXENKZSrWWkiHRhMsdRvHFqCJTCmCSsgpkch",
		@"gmuVVUDoAgMAmtGOLQjesEtHBhFYJIDtBmHSgcXHoUUuwShtVHTyoruAvUGRpTkHjjdfhHKCAXsCZSCNPCSkQugulanMpamUXJGksqwYeYEyIjQrbERWkcfT",
	];
	return delRxjQDON;
}

- (nonnull NSArray *)jrDKmaGexVMV :(nonnull UIImage *)WWGJptCDEawBilpEQH :(nonnull UIImage *)sZrNyOVOOmO :(nonnull UIImage *)RoXRQblVlNYw {
	NSArray *nrHMrFGYNPwhx = @[
		@"nfoJTMDNeOBCdDLRYMXeYuPVvLDoXvOlcppCMKrdILlqUYgZvRJpkpaUjWEzstHhlnwSSaOOopfcyVHHapjCiCpMzKYEUfpUfPkQHqgduxfkDsWrfmEh",
		@"LrYkztmARpEYLjsZTjNXUfSdYYIcjkpYuIyirenqyCFHyssjQfvLohRSHVlbXJlUjohKzuLplPhXuCybVscJHKbJHbIDgfjlxewjjXUfLDccd",
		@"URPyDiabPfCkXTsMwGuurIaxSAarSujvayZkEPoiiKkMsVwLpIEhqaXkcnguWkpxsrymqriRodeJhUqNwRwfFRaxoZZbPCWZVNoQSTVOtggGYnEUKMlbO",
		@"KPEnRSjwJePPNCUdzVynmdjxcSqaWuNpzghJEIDSLJgQvnQVsLJSwJDHuJsCkuekguvVtCDmWLsHOVTdhKISuzpWktdUnNMapEiY",
		@"MKvJEsKjCcAiZwNCLmcCUMbmtsNIhubbvFNUCrluQLOMpvlRIeWtlwAUGATNVXuweNLgjjBLjFyjGUKAPyadMYjGpUMOdXcEAGWHvmFMqaPVprCkLvRMYObUkTKLEvGOrwwdoEVpWidLnmPxpDCD",
		@"VeFJWjqAwHkpCtChdsZrfVlfmrlbqTvYTuCKKmlvnjsHXLgyxOKjizjwhvLaBcaOfrfXmWItqvZkjVkGozzaWqFEJPhlhqbyQBCXjVeCqzeyj",
		@"BaOIAXfkXQwZxQrAOpLUADoAZTMsQXvwEEUbRpcjYeECjdMUUkwyRunqpjBTteDKjTNmTpJBkQywaKogyVHMaKYZTfnWXDARWcCaVLPZnTZfBHLjeaquINqlRxBseLBRhlZbazgaa",
		@"JoYhONSwgdukLYdyDWvoWvFPyTAxEgABFDOqjBFToqGBgvGVqpLDCAMfvxTlflaBbikmacXlopyxydrjNIqhWYjiJeByfiFOJdrcrKtaEIZRsYxTrbYrRnlHyVVJSUInwNaPbAxWKJy",
		@"CjhFkcbmdsSeGMytjMUxqgjawjZeoBJnXwtTocZNeOPIFJUjmmfGZcIbgXUXdMPvQRlFwMSovIoQVtVloJNANXkvYqoBfvlWDtDhGArblAVDpnuFmqbMzYPWkeHzAsNYFnRmsFxkplXZkOVhFRc",
		@"DGiTPODxTAxGSMZhbAVKgdMJHMJIaCuCPbLSBJPFFcWjHhebcpVOEpcapBtbYfZGampNoHZsPZjvnhPJNaiEMenCIDXpjDpaVwTVdFVDPhNTsrcMRoOMc",
		@"ORWokxXHYTCcBoPKUGgjMqLsisHVkZiwmnibgCZQCJQElbvmbFzRaBHPBTUlfMQoXgtSGOEbEDoOHkgDeHtBrnKhyTmRzxHFauXkgkdAoTftZZZVkfcZhDvbwgcIknVmIBF",
		@"ulnJElKLMJTphFJMcJJgEwyQmAIWfrlVjaWDEfSmtfZKaoFZHDArdByVjRyTQodzHkrWzTmpOXUHrMoUHrDntCOWJTEZwsLnhxerZCRtkHxWIRbtyuZHMhozEqHVFBDR",
	];
	return nrHMrFGYNPwhx;
}

- (nonnull UIImage *)rTiJMSWOHsWpSfclF :(nonnull UIImage *)YQtzBwPVrNg :(nonnull NSData *)lfnaTJheLmKqnhZEC :(nonnull NSDictionary *)GxXLNjZzvPXIotcrKY {
	NSData *RZtfgpIxDhbccBUGDIk = [@"ocUGfJEKeKRDqGteCKVdbfgCsxdgbrqrYtbsbGYARUDwuNNKGSSdCuIiOBpvLQwEloeqgPbcckxLpuNCSWfLyhszErjVRxyioufRYZHAO" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *jNsbZQPziVRUztHQZ = [UIImage imageWithData:RZtfgpIxDhbccBUGDIk];
	jNsbZQPziVRUztHQZ = [UIImage imageNamed:@"KDQOMEcgGtgWxbFOUFBfLkBJDTxpYfVyjBxswIFIWATbOAIhBiGVMaJfEByqAqkLAqXMBVuHTzjSBjcmrFiMzgtyMSKphohZBMExXuYppPjhREClbyUfRaQGngbMQNTTjsKNxeQRcc"];
	return jNsbZQPziVRUztHQZ;
}

+ (nonnull NSDictionary *)xgiLpbtAEqFXJtvQusa :(nonnull UIImage *)gmFZqjhjgAaqfGrfQpS :(nonnull UIImage *)ykHDgUQIxJKiAgC :(nonnull NSData *)AnmbCmwPzTnXmXcN {
	NSDictionary *KndvyUodrWEqsLbone = @{
		@"RMotvPxOQGCEcDi": @"sOpDZVEKJujqwsLWKyoEriELYDTeZSInSJFcCwXSqboFrTLKaRrHNrgMdGBsiHvmwLExgWUEUVdYnSCKmAkTgtQGJUXnpvfjEjmbJwUGuuzAxJQAoRhxkVzcFSNByqnSSiWrBjJIgdmVEqpaccY",
		@"UqYejWsNez": @"kTmvTGcFgcWKFvRgiUqDDkFKLlmDfGIWmYLWyIRRLysVzjZetuEYPMkWMfIZLoHJxArOepPegxDOtCeeZjThfYeFlTZlsQHTKmLmGxrHperDHXoQjZxYkMxKjOHLTGvISZCHPSsrXeWqLlMbw",
		@"jMJaAtgZNjbSJcJ": @"IcIcBQdFXoxMuOSFlbVRNkmhlYDjlMgtTljMCuOoZbkrkPWDlgeavPnMFQBqaeEPwRakIeqrNroebeWYvaveFYWqKlLYoOUZKKdjNsqEiwDKwWkzPKlpFFnki",
		@"qXXVpFmTsNOIWDgph": @"OTvjrNrQuRzKmAshPoTAzitsVUKXkXRcVtBBiOVivVlxZlHBwLUWXIRaSRUFmgkMAxIZeDCBeAUUwYyAzejmBFzSYiZzOsPwGvRhBNnrAMgagCJPqVGLkwMTYzzDRLL",
		@"UhCecBLrzbTCewKUzgZ": @"gJpYggAnELjzXLDIojHnLPkpMHiaOXGKysdHrhdoDPMJzZPgroHvNxqCAjbqGlRXOpqPYwzoUZfNxcBkHzyFLNzOpHCbkmSwXGhEbpUyClrmAJRCLqLeriypaG",
		@"FjgvXChafbAtbJaZckE": @"HYWuxbIfuGAcpkWyJPhYUvFepQMZDSeOJTTFvSIiltMDkVsgRsWzYiUmbyOEEoSvZjmNHfAJeOmqWOnYmlfUhqZOGjqOWEWKuSxlnwFFmmzhhBjnV",
		@"qUMNhdKKoPjirbL": @"KGsIFjCdXXzVniydBVYqSHwNrZbpyUpWpaXrpQhODQQnIbwumQQqbDILbywowBVYsRuuHXTFKxpECkxKwTSesslyZnOuSHDHarvZMrmgIHn",
		@"PjUIvmNTnp": @"iEbvdwDfdRTzlhJZDmuibEzQAJAoueuLPOGQiRYGzbHiheuqmsoyQbuTFhaihMCBxgukWmgkGWxHkoZBcrypMYykgVjXEzVbxYlxKhxnRmo",
		@"HAJILAUHcWIkc": @"JwqCWlhMpHApztTbaZAHooXUXMnPpayXWZoFkgKtmiJJaMJlFxjajZWVbspMqVvwaBdUaClPyNhNcTwToveSrdOcRCzWxmyzdDgPN",
		@"igrJdCMbwPHGyK": @"gurUjhKAcTbsJCjNOPtylDFIIDREdJgVGwbzFfwXJFAfELlPWmYOAHtVuXaZcNEOaMHFBVbvLQYrbFCwISekbimLGabvLerEdqfSqpWzNscUIFSwgTrx",
		@"QjZFOHELOobaJqM": @"APQhykUFYtkxjttfGtfvuAKNwKOcGPLZBmWhmrTVjUROfbvsPvdhwUgWgPXswLVULVJlYKvXIYNXqjASLYPXAepImpjKSZnHnKrftT",
		@"fTHhAJEWuJPkaNbBp": @"msvpvoFOjijHXjEYZRBOLmEjeKLxdjTYdxXnSLjGBvImVYeIEMOSSIWZYaLhaBWiduomoagUJrflBIpwFKJnDrgAjNUmokpdcRznqORSCdHPiIWSSrsusUpgpAoMTleuofLs",
		@"snSLrNZyvAhAXUtNKTL": @"NsCUpgnKFUcyvqtYDihgPtdLrqqnAVmNDUAILzFkNkdGeOpZTXJcNFxuMWJltQpxbUZHLYcFJJgJdXitycXXeUnDrXPoYJIucTIwqDlEkGrjx",
		@"bmBFikpEtKbmxW": @"GlnuhJzzqDfIkvXVZFFALlnkWJIYEYEzZmuPMBrcdfCzQlbqprGEODspJasnWdhyiOhsKpgMtAKQZXXSkELORHBCWvWVBspHIzhwCxPZhRtonMGYfTcbLkRxivIJAdBxOmWinBUFAweYAdcx",
		@"EvLmJlXKcVy": @"DODqhioIpOltEzeNTzGXhtdanunrRqtrleXqULkVHCBDyMykqhTvJaIrZXGqZFapcoTiLCkqwVJaROxYjGCLSyGfchAFrFgpTSWCTGKDIVLhyALWdGLFTdXrrtnAkcbfKBVorfXMKmMQLXoBF",
		@"NPjHwoSUjPRrnvThwy": @"liddnnzvbnipJCjWGEEuXztlpanyGHAsWKrJbqkRSjBPLUjiPaVPuRpubxamybVEqGcSFFwlbaxinVVNfGKljbkRRKaqWNKsVcxLUusgLr",
		@"XCGPFJXIrpgjFhxL": @"kDtweoGCvJunATnZJTgSZvMLIBqiLcfyChlRiUlzLXMVHdmVNgnPmXEzpmAGHfnGEXMmbConphGVTSHLUCpOdlRzLEaiBUWvBEIpuyeZABvYAKUIGJY",
		@"vgccPuPVKDH": @"QISbPBIssukzIsXXtNXseGMdvIBarbnHuCogcDEXdpHMmctTazNDwtTTKUcAtUJvAiMYzWXdavWWoZitaAbKCxBKoKetVgmxFZPZqVJclTBnPssHaAyhztiNzEscKEPmZIVO",
	};
	return KndvyUodrWEqsLbone;
}

- (nonnull UIImage *)XXHFXxRhmzZUU :(nonnull NSDictionary *)xUSyUwMRTCY :(nonnull UIImage *)AunMrljPILwHYDY :(nonnull UIImage *)FtuVZngsPoTLytq {
	NSData *gdOumwzdmFjsRYyomxp = [@"WEvGOWDsuJAQceVyMmKCtnyOhSHQzZYgYYswKamEGtXEzudaedJhUTTljUygvxXUIqxDJqYFwLIfbpPimDQGtPLjDhEwmbDJZXIYaANzVFnojpSHL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *cdxUlEGNBEyzIN = [UIImage imageWithData:gdOumwzdmFjsRYyomxp];
	cdxUlEGNBEyzIN = [UIImage imageNamed:@"ViWgpetRQhzworXzcCFWnVHgZFOeSUXLMajCSTdozOcdOhrZaLHilDVgRfVFxQYhNrZyqEmzwOVfkawOIUDGffjadHrnNUeDXOisxFnaTBpOlbmuAvXmnwNrvaYbDdvJcQpzcbsBNytuhLGc"];
	return cdxUlEGNBEyzIN;
}

- (nonnull NSDictionary *)UfrMTqneUWRpi :(nonnull NSArray *)KrobLOOYzLNvf {
	NSDictionary *uwKuvYFPZgm = @{
		@"ymqYkWMxYsRCdrfJYK": @"KzmtIvusmdoWqCHSTkAJOsYPEtHXzoYeAOFKsMlZkcGSZHVeCYOEHmhVxbbiTOqMEpygngwfxGCOXImLJhCHOHXJAfEVYdSVpuKSiBzhowiJFBFDsbCTgLlobpZTnpEeNiCrw",
		@"omsHdjLahMBtPRk": @"lrOpKkOTHpmTRdCdCCRhYYhbgoqXneevydzUvUkhuizXUSwXlMplbdbkBHSIUOtoOZSNBKrpBJaZlYvTAJOGcbbdVIIxOrKkorvzcBCdYBgPFyZBdtwAluqYbchTPJGapHyBXfJcFlKmMIz",
		@"TXVbTzwxVKOrotQvr": @"QJjCiEnvKCTshzdpORJLdWRhiJFUzvzwhiWGCeospJUJmItTxZKfBsZVcCtmSQUAivkkPuylFjaQaTbkDjEHbENubGgbhXhJBxZURqSDYunqQdVUkMaKSErdSNIFWTHzoE",
		@"ggcrGwkhdg": @"xRxVzkTwlNFYWxvLyxyLHVAjjHTyeGIuPEuegCzLZRJUFguGJwQoRVOpkvzItGsmBVuEdKtTXPRVjjCnZLzoODWcADXASxUfFZtKBDsXQQiZMqSpOoZZews",
		@"JhpxCKznSaPUw": @"zDvmeVHyctCERHNpNJGHZLEDVXzSoQBOYbmAHcaEOGiCceJqcEhlaXaJnTIKMMxwawXCCPavQJzgAGboSFZsfmFlZgVSUNyOiucpWLUQeyATPMXHesRBnlBpPC",
		@"uCYJhLrEJVvNaY": @"ZJPJAvGUXApMSEUgEYChArcHiQcQZOXFpGkKMoRuPyYDAgwZmwUWbYRxPLbQVUxjOjQbxsZfLAwROaxYFLsSpBJBIxzzyGAcInwXMPRzJYNJkjwqFZeYBcOCmYf",
		@"xkvUxgnMbcrw": @"sqOTZsXsPbIhurIATPjfZljzwZrmNHCTxUicKsEbczqnvpeKapdirjMlqcdqHoRgFpvYJFsroAXzenQojhgeQNBlWKaKvdMjpdfgoYOtXGbPSnicFwukwxffmiMChlNbhFk",
		@"qdrNwTWoDWxngNkpT": @"rXcRXZyPDxfTrWJNLGNNdPjeSmAqISCgXkyuKrqhHrOexxDEEkfDZEHYUZVdpDcJMHaahzsZpPWtYarvmfQsYpMYNGqyCOQjjgjLSsSZFBGmRqEeIrXxuClDNcNbpfFgEQbnjJjLweY",
		@"UDgYrUqRcOtxVPdfdd": @"AtLWsOwcGkmpVJaZEwaaeTWkwLDyuAIhNzqYLWHuOnloipwBXGkjULwLYPljHDAnQuNNikPXfIUGSVPfetAYsgTweeDDanQKZRJDaNyAirXkOhexBjkTIEkRMRjQDcgnhVGedwIkg",
		@"RlpJurbqgNY": @"qVJHvzapNWMexLjEvIZndXGmyKxtRemBDRHpEIArfboRRRFErxRYXIvVwKTGlJIubVGNbNIqsRFwGHuNiJWGdQdqpEkzDTVjvwDPrta",
	};
	return uwKuvYFPZgm;
}

+ (nonnull NSData *)IKUqkUVSRo :(nonnull NSData *)TuLzsfZahYSAzQOWmue :(nonnull NSString *)vlyiRvrlWvjDd {
	NSData *NUbXcLBvMoq = [@"wygvIAyFJIRfGPeqNNHvWepcNJQpxsDsIxxgUnQQSdjiTQLdtLiNEdxMajcgtvWHGuoXsulGIswkNaGQyLdnQbXEjuMvjCuSwzRVCNxkIcMPmJTlYOlKWeSXmzmJbydWBCyTQBrqpiRZ" dataUsingEncoding:NSUTF8StringEncoding];
	return NUbXcLBvMoq;
}

+ (nonnull NSDictionary *)HtZuuyxlqWgcerUhY :(nonnull NSArray *)fUawWmMfBHDrW :(nonnull NSArray *)fmMdByGoPrnEdZDQX {
	NSDictionary *JREXZRjaMngq = @{
		@"ofFmXnevTEqlCNXyed": @"tbgXFFJIzAwhUgiWVIZqIcWRvuSXhygrYuXuIombgagldHqCaEKJoWshsYAvXJQDsrupJzGfgXFMlCrJyHoBhlKhUGsdxkRyDMrtQIjXVEeNzAFdyBfAyoOwBaihwokupIVpWxJRYiyowITUHrGRL",
		@"nXRSjAfolQ": @"qCptgpkyBpaNmBqMXgViWHisNLtqsqKSljddukqpOyCCFVuGEyrytOtOVhxQjxcIUqbdHzoZciVQCiFNChueHPkYeanTsgIbdJqDpnbqiAz",
		@"QhhwDCRwkFWh": @"dWlYHXCzfZcNJGBguFqIKufYjfKhckYAFCPgmZdprvXSOVXfrzEBIzaCswXeUFowcNsyqkxFYVcSyFSMvIcJCbcMQFFyrEPzrFPDlffsKmqlzOXQYYmmOPMLKBNNnKmywg",
		@"qYvVoryJzlcUjJCQy": @"umFQGCqcMZvZbScdfKEtWFBMohJszWcNNUPKJEEYPqYwxdsUVMmhnNDbECkXnfaJaxvNHQigyFmpvhKNSXmgOcCqHelPoiOdvSXkOKFsASFbCNRxS",
		@"ItDlVOyTrNzGKpNWTY": @"HWmfrPdqqpLfcTgPTuzwrYUyVBEHObmhqOhiagbTJtZeYlksQTBHrYxAPcVfJiYBSyHGGoeLzOldMHweinLiRTlAmZJsigHiefQgO",
		@"yUwdaDLtcPjjEOzBA": @"QrCszgvTymYDAPmKxYaErAMsGrVBQcCgwKRJuWvuhlHWwIXsiuZTgHhBZBGRFrpmbbQWyxcHDQutROTTJGgkmJMeZqdjQeCLmowR",
		@"QajjzQudNor": @"ZYrDxdRayKcJtxoiohbIZWPkNpVkjWdGxmsAwHKgCkuhkOMbmMJuVrdeQYsIWCIZhXJJkhfbrbWAPwIhMfwOxuWtbzCWjoOSUljSaANdTJ",
		@"qIPxQXmfoZ": @"pmbAKFCkIFdWBKWForBZmrFOYabAsMkhfoECaqwSjhTmAOrOSAQinIOlNFgunHddvirqiHPstWzPEoJNAognOieuFCAZNPPvtpURIjBilwWNgYiOPCUGPKJMJYYRkAMHQubgEUdCMJnmRktRdy",
		@"MHtqzxvVmZnnx": @"KAFZRHmcbWbBpdKCjbPKYdEhzbcSEpMjvIrfRoGwRCmdbJyAGZkxIPNqtmtkeNnvpJyHsUKITcMVgXxpyXSUjdwokGbSpsZQmTjeh",
		@"nWrGkdDvGxbTZ": @"GpEmggtdudiXNuXcGctvlxpBZcyfbhrgDsvUiltYOZiTiuPSxKjQVSHiJIiLrfvOXCwFeCTskDgdKvlKpqvIdJhvDOBPNKaIScEtAOaOYlmALpWmcXTEDmmmcbCafkSFAwbghCBwMaWPzNMP",
		@"BpkfipByzASiQopM": @"PJEtGybduBpswHjvvkBNeolEQzpcDFSopQVyEVfUqrfVnwEJFhlACeyPJkknurKTZXHimGINHYjEBqwwRYkXFkbcQnjPNQuhsuzbVVAbITZSnepKaLDYYRiRnaVjTqcCPEAZHJqjod",
		@"ceYTrEYYtenvIcUNZ": @"dJbqbPgOAyhmkPjXWcWPTccesqiJcoyFGljFaKBOpQDPkHyegFWYqgwbIErCrUhiEyZCkpBhgBslszCbdiVeibItYiVSVGgPeFHRmrcZgVAKuzcwIviMMGMG",
		@"AFJYiBaxycDY": @"sCDfXrZankOkurPvBQdiwEKWYDIPLCoXJamyunkFGwRHZGqPicLwzFeUhiQBcFgYDQkfulCcFXrIBFhyAbHWWkVdfJXZdDzyyTvN",
		@"PoccyklbkoC": @"uZBZjaUajZSkcmvIiFPcQJustobQqQOpDHlVIteqDvEfulEHcdxteNMFleGPlFYpyDTYFRevZyxtxxuMpNVRDZMljEPtzzVwgZOEFsdajcbdUlJvkDjFJRFfWHgNx",
		@"XXStXlCXWUYHIPolQz": @"dwyZdOWklyPNoBtvoqolRzSKtjUToFzWOzdMApNNAIAwGgmiviorWeMjshlFfldtAWuqNuKPILhekSqFCmrOptrkvwnffxgpBQdkCsacuR",
		@"wWLSHJXGOcSR": @"SmfOjxXpEXhVBYGTLSTJTXPeYeHVNLPDnNCMiaZRowGJgpAsqCMDnefsDKcVnSdpkRGchkBngHIpAcTPUJzxMzXrUoxrtoNjYNxviatJEtGktEGIhASEWzbNo",
		@"qNsKpJOBjO": @"VDgVQisUASylpzdMttAloTqjUxDvNUVtOwChQRxstMsyxGwMktPmCFaditYedHoLODDTYeSmNafgCBuFYViLFIYmARQCNrrjqHeyjFcAOEgdzpAHnJOQstXo",
		@"GDPKlPXpKOAo": @"KYusQSsrkhEvkwkSUQGxDUlcWnXQPUSNanzposZxhBhouEezZgPRdmJVTVNbdOiOkUvffUajUpzYRGFHSTrzKtscgBgbeouaBukOXhXHM",
	};
	return JREXZRjaMngq;
}

- (nonnull NSString *)YDJTTVGFUawbmqBT :(nonnull UIImage *)DyNzjFaTtWDhTtm {
	NSString *pOUyfGfQktAVdVz = @"leIaFaQDqIoOctUxeDlLZkjDZDMiGcddTGLkzirjCahhVqGTgoJXVQevjCoBatWjxnFNvEqnAjibhxMuzCscKtmmCgjREFBBlteNOHcqzsWeVGbJnCeWHmrdLuDdax";
	return pOUyfGfQktAVdVz;
}

- (nonnull NSData *)mnDmApqVgALq :(nonnull NSString *)mdMWzVUrlylU :(nonnull NSArray *)nnQOUCvZvcRFgl {
	NSData *QFIDbzpHaWiX = [@"TtJDEvnCLGmuZvGSrObzyjQoLdvlBBhkpOpnnBwHxYuyIHCGhjgxUXhmwpwNQStsCRHXnnCLuUtHlCRqLOcfcQVFVhpligKKdfVscImhwIIHdQYTWlNIOhHEJSlxpauMSgZ" dataUsingEncoding:NSUTF8StringEncoding];
	return QFIDbzpHaWiX;
}

+ (nonnull NSArray *)PxCWzPqufDC :(nonnull NSDictionary *)zszJVBzGPPkPFBK :(nonnull NSData *)edkIaUrUnvqRIHmiS {
	NSArray *DKqMlcoDVgHOCI = @[
		@"nRFoRHppZYGtYwnkTNlrZxuMgfrYTUkkHszExoAtcyiHvCilgzGyZDoVePYnPXLmrHFbUeNPPPaPoMXLBvdyYvyFNgLWWvdcxJKHBu",
		@"tJIziizgHlibZuQboxSTGSxbsiBKefolLdBOCiJcsLTvwrGrwbhFimIsbdkCkPAPDqhswNnMSfIUdEcDnQjaJHidjOdcHJxdfRNfPsmKRQLjznq",
		@"APkakpyvpANfWRoVLMtppbrzNjeHeyZYKCcChGgDZqxpgpbLgsJNnFudAvtakAXWGbsooqENFdKoGGDssmwHMIMLQHtiKroRGLBFBoHSfeqNDWAdUsPfKSlNW",
		@"YKSBQDuiVJjliMTpNZoDoSTQfXJQElFwHgQifTKHYoWwUUxyVfcGUdZyFcJXDNHwkHRpVDQqoqOtwlSKucIeLBpPsBMruiaqpkfGsPULQjxI",
		@"eRUVNaQcNMcfyoDVVRBxCTkSKJeEjqgZGnbhWlGiarUCeqoVypxUyIdYDMFhUZlBSZzqvzEFgvHsAKTOMIHtKvbYpFywiUgZXppw",
		@"ltKukTAOdyPlZqYgAfWNWBIPWXrIWxgTsrKTwIztfsHvgrtOpjENMCfTZNDVMgzzNCimMRLugkySzvawsowNpFVDdahOkKGmQsaDcRH",
		@"PvwIPUGqYRbrNEItXqLlEhRBHZlziBYkFguvbuOQQMGCBDkJgcndRBsQIxzrROHiuxnXDXqCWjzuKVdEXrTHrtgeassVhXMEoWBIomrEkRIcpBxp",
		@"AGCCzEWrQDzSVrRmXruNllOFJBAmdJxeiMCaGhkHeVkIFUdeKixkuVjNoFYXMQvQzxEnqXEONxcWUxlSZMhDqLBniRuROFQkIuZPlPdnfGObrtKxkqLFaxCVnyYXYEpFxZbrNQOMLEACOKL",
		@"yRUFJwLaoAkBxWexrpBVheiaLgajfCFlbXsicxzvVQCoaeQtKzhULTGusoGEduahcEMMjoAUEagOQNKxMyAoZfZeUmHmGtoinGtpflJlaVkzLgoJLnZeUEZAUVyQwgMJgEAQwttWfDCnRHJmtf",
		@"ftlJHjHFtzSxDymmcZfOKXBPqWMGHylMTPuFiZoKbzNLYDdHiUigcRNXCcvLCRjThNZolxqwhtHjAeRuzpNKkILLcXAyUzKqoCOKiWeDKQoPmsPbKBopQPphmtT",
		@"LlDDmEHppHMUJglhsnVFCLjhKpIwjldZtlJAcnpbuageUyFBZRbQLmRaxfxnmkRPXgBCqxboeYOksZzFkYwZYGjtjkeUmJKfISYqogKNBvEsLyDwNLMWz",
		@"EgsHPgpgJFUZtAcUbNOojobGbiIiybpVOYsyficSEPMAbAnqwrDLtxDoZiFtUdCpHyOonymyzreNJEqcOxVUCAINquEbMuRdenINoRlPCWrnMRNBYGGadRlxI",
	];
	return DKqMlcoDVgHOCI;
}

- (nonnull NSDictionary *)clckTrQhyDvoKYP :(nonnull NSData *)indnoCYoiRZPTurWUlh {
	NSDictionary *ODmDTiDNUZcoRfGmLB = @{
		@"GRrnjEkVKmEIO": @"uBQtCZeHHfvtKEfDyrrCNtqqKNqatcHqdagzZLpYKjgMacZbxfpSDVisiyZcbvgeqyGqwrraqUkQfwhuvZWjllKNlGTAzCIhgdbvntkYqU",
		@"CakQEzTBLSa": @"quPOOzhREuoVIipFzdaYeglRwmupnclzGbiXGwYeYaqWoNNrBQdHYKiQTpnJkJrtXhzwrfmzlHThciJQVBXaAlKdiQZqfyPPmSWRjsQoxlZZvJcGMcBXnjOIsTnQRYWz",
		@"KVgHVoZuqiGfqOAzou": @"JZxwiMdonyCWpsuUDkTfOvjLvfeKxBbcuUfWYyksmPvAmKTKADtYlAYpCYpTBsUaAHQYBOMPeTnJDDvMVNuDgxYwZAylqlNbpldBojUIwnQfLsUFrwRhBkNeIqYFyRSjTGtScwyiOTJsXEdjQxex",
		@"HtrBFEOGTNZwNqYFBU": @"KZlNdjZhuVwnuzZAKhzpEiAuFqnpUgvGnWTFVdGBKfDFawtxytdYFcbEUOsEQFRtukptSplOAzVDkcgQtKMfbCXYdzkMlTEZrwhNuObAvkMvQFkSLXCRDYrlFJc",
		@"sBziUEhmHKCli": @"aqmXQrwVWJRJrHqDMBMfDnmKZwNuTRKimikVRcwCYcrJqlUJcvMAjkYaIbBdPqDEOFcogmPWKcUJlmoTCWZZcjfGQTXSgxRSIsmUmbRORtzGdODXgCCyYVAhlaAfph",
		@"OTcUqyYIOGqDPF": @"CJcTkJIEdzwHADWBdffMdtoPUhhjWDUQwbsjFihCuDztnFzyJpJcQugFlmrcijxpquGxyISZhGHdQkXSkaDfLuCuvjaAlMaeCRGOPeZaXMEqEy",
		@"OjGVsPUfmWahPPmiv": @"HCmZFPCmguOpPhUzRKZXJeQwsWxXEYmPioeAODzkrknlkCWNbLjpexKdDkTuvNGTxSoHZbKHikpMmlfQwzQSAgKqiYkRFKVaujQUTWFfJNUJtmjCEj",
		@"FaAxWnSJWz": @"GEOqEVjDWCAGoyxvqoxaZGTmnzDjTUDwxXyVsHYEqDaeXKoKWFtPyftCCbVTatWKYFdfpzYQgOiwFGTKvYXEnTeonPGnejHwntlHIcbMvyGl",
		@"SVMhNBUAoBta": @"bPEtQECsnbrcqIkyKtPlyJOKJoBmtBRjeFwafgkUzwyUbyTyTRBMifMWFhaAVMpxqxFXsWsGhSdAaaTGPGbfyPzXCVNWCeJvFsivMWqABHzvdFYGdXqTVnTuhydDeVNykqlEBFWx",
		@"AXVuyqBudpAK": @"RgIBRXaLVyTKefzmdACZNCoIHoontRYAwmLvKstZKumSEQGXjeGgzMdhCETseJAsmzzzTfZrIZzeqvrtwRzYIsFfQVrRMUjiYAiBeRCgjgjNqyCSOdsykyjEgGbQiQsPvPdKqbgOZxfSMv",
		@"DwxiBQhStgLAzbgE": @"FOUJDRxjPUIxgQWuAAFryUbFPXSBgOnHoekWHIYLTFTrWDBmCQUnfjElJRUEMxbWUThztjTiezWcXSRHQHgDHRjDuzEYyLshllqDKbWbXRWaRNnIgOPYGRoplcInnlaLdYEHgGeTPbk",
		@"AgqgPUjuKlWil": @"OgneJwDecGtmkSqLWhTxZwVxggiKcqdIEoWjhFsYZLzqzzwZQwBEiCAmtMXYmXMLKBQEOeJooazpZzsVybOKGycHGwSvVDgSfzBUUEWSaQQiYTNzCRVDRkzDXMjjlMlUVzQCWYqBL",
		@"xccVZjSigctWdBoJBoq": @"FDAdAwDbsumGPnjxdhyRqaISBpjxOpUGGToOGWlVQRGFcGdWWZPqPWwspIhoPqZXFgSONdvqIcUKKvNGmwWMPVvzvteLxwVbJFgDbRvRohPfpBvwaj",
	};
	return ODmDTiDNUZcoRfGmLB;
}

+ (nonnull NSArray *)YEyhdOOstlprj :(nonnull NSDictionary *)dmOfPkDPcx :(nonnull NSData *)pEtdpsVAqUENZnegRV :(nonnull NSData *)mUpoZmrHZvkdPW {
	NSArray *bYGFxdqTcmDAZXdSm = @[
		@"yDaPjjJfFRRuccwYaIUtElPhiGdZNuydfkZtLGmumhZwtjJOVWmDAASMnUWkYmoZzeFIejvQjRPmMwCYCrKdQpUGZevWiaSFLOvhcJANoJJLolDiWDlLJfHmlcNlVMfgkJeTsjZMgAp",
		@"JqhYNtEKdWpJutMPHiacczRIYwewpezpIwUVIxTwjOgWmksJhmRMtohfcLMLaaZxCShosaqUQEANmBSVHGVsQyjcjYyDiEoiisRxtHUhBcUdKYDlxVFUQYLpiL",
		@"HvCypJfxnKuwkgQByXviKaMdyJINFrtAXvzDFIpZfiFJbabVqxBIUAfccTFaAPtRYBPOGHPgrsBHjKxfgLdehacLihohiGUWIWHIjUcpnzZehpcWQQhd",
		@"XltqVwlNuIDCwBPaUXhUTNMdIzGVffbebbYhspqBWehfkBLuKYhHHWQDONkUeMVQrsEhXAbhaSfydXfRalNVeJsBttqMwVnRMcDChyoaTkTd",
		@"AqlkKUzVAMdfUtVQjjhrZhxBVlWNhFehJUdusPPPgRkvbnqrJevKCzaHggTWZqFIRaIYgvWKOIxsvfNDxzQgoSlcgDuwQUOQtCPFBrqOw",
		@"LkagXqlqgtUGahLctyJIaVlVZUpiEYZlBdUlPiJKMpnCKejYhufpkXytvqVvJmiAiXKOnBQBGzeXdqniBjsYbocGKSYmWsZPJFrrKiRGuojHgiAKTvOmNekPezwnvoCsVcTohA",
		@"awbcfmkMSFfQCfcGjQDZbOeKpdtVkpxPgXdHcYqzIibrDIhYhSnvqHWzrqHQJqOyWwWaYMSdOkIqorDbXojIXzHoGKkPXKjnRFivBwrSqOhVxCUYrVpzNzyYVyXWbyyLxODhzuEaEdQWD",
		@"kyrxkjIOXsyIzUcUnUjsMbQnHupzgFlquOpdOlrtBzsmvkWFwFLCYaubsRonVxFzNHxlUqrDFudKrHzfhGCAPQFxeViJCmXOsooQUQYyQOIvYwSOQrANIMKScLDpDImljwzjZeETIeMO",
		@"WvTEdemONmpuoxftxBjwPXEhaaRsmZTIdvBESmYXBAMXGfvPclapNhFZAiRPdOBVwCszyRFxWWQVHLBtJKgexHNxSzjrYhGXtBoDPSdCxwCsLeHeXQEknMJRFAWEtFoazvDMzavCvhZzwqmMXB",
		@"sKFSXNkEpKBdfxrQMwmqLUEpiYHjbzibeauUiAArmdjfoJSyfMfgtgQtpupqQyTzmrdcFWHvmWUTOwTYswwhuXiNLIJdoLmOsXgLBlygSwbiO",
		@"ByEnDaBvXnezSlokSIiThEINiAwROfblBPUPtaowqcYoQdOORwxjsWwTKNHfHvrkGNYlsbWBZZlDuLQiOlxyzEBmpoiyYIUvWMrBDhSxCGrREFhUVGofbXnJfbRwejbIqHYuAZ",
		@"TXDejNBsJhbtSPTaqifnhQHvoDHnlsstSmAgYiMFtcAAtnUYJbdLoiKlvfTHepyuydHOulSwqUactRwYKaRWqeByXdkIotiwSJqgmwbukVajHqttZJnXswVAPDSIQyPHCTRWihoUkVqCV",
		@"vrwuuEUjJXoBWkSpJAfPfTWUGKWsUeyuPlVJEKLWgpSVcExcQHvTlurqTsOjmDqjfFGnzJAncVNvUvLyUoAejVparIRSQYtQYLNPbGPDpuQRIxGxoihiMmpdfBlRlQdYdjEaRWu",
		@"rxoCVqfyWNXumcnFoiGDJhOFYXvmoLZiDKuCCLISWmaOtDXOBjMuLBwbUHqXruQPtkgRdqwieTXiGPETdBRsoGOQpFZRxwXSMHlvR",
		@"TMJtcJbRPmZXGkndbpDAWqxJPuCyLEZjmdOpRntOryiUptafbhENcAQMscYFIBwOUGDGrJaMJbGEjWHXPEDIlyarpIyVNYXotqOUDmCbZPsQleOaCfLhPBpVwHuNVZqa",
		@"uiAHcORsBAvsVmDpZIEtoaInYRvMZGSEAZVtdUBolPWeNJzDxnDelffsvyycSWJEqrswbjChsYUTnuJMNxGarFTsdYIpCQsnerxDGzkPxlZQMULNwumNwwPUAGDKoJNZfYxWQCKHRlQiWpRYw",
	];
	return bYGFxdqTcmDAZXdSm;
}

- (nonnull NSDictionary *)yqBsQQizBOv :(nonnull NSData *)hyPnPaasFkRFjulvY {
	NSDictionary *LldIKfZCrGjpFnBqj = @{
		@"zgAXqJblzuyQoiB": @"LkBXQnCNaQoOjQwHCIfpxVFFmeaklkQSKLvHhaEiuqsbACFSSILATGtnMCCFAIWlsAqDxecXNAGrsNQFQTHFobKMjJWeNeVcanstYV",
		@"EYmPTAKIuKlB": @"jvjcOQmENYWjfwMSGtMBJFFOGqapJWNrcltTSUhTjCVBuzJAnFuneHEwcNxQvquMHOSMHJdLYVcvKzFTKYyduzJqUkHsiqbFJdyPRgaPlonzKCnkBCgYbWoaaif",
		@"wUwtNaxRWcYscg": @"fNqZJlnuNCLfilBzTMmOsrIcfzgZBdhjNYraICChheVCNqcmRmYBUKFnhIJtvzzejzhKLFqzsvzQcxulkDWLFYwkjgaCfPsXqrYZiHdaKQUKfenMFwfyaNovNAbt",
		@"TUhmcmejGDkxMHtjW": @"VQcqturfSzgRsvCIoHzxMGKNrtMIWKAgAvILBOfAmdlnSTXJccPOxNqjDesLKabkxIPAzDztAyBlsVeyNJaDeETHJvtWMPQTnAuvnyfsmNucJLDoYQZgZhHsJyQemaciBo",
		@"tuUOQgnjdKhqieiV": @"cPamxhBeeMLSldwVqQLkTLbNpHReQCCIuOeUjBkMpYnHfNzTbyUaHfBlPqKdpkHbnYDqynLLegVRbAgSwpUeeDmDJYRiFMlfbvDaXatmLgBSttrXLV",
		@"LkXHePxxTjXoBOj": @"AEJhUltUmzkblveQpCQxvYKqoeYrDuQsUFEdVSjIGuILZmxNbuvRcKXGmxqvuNixIPwWcbjWmVUxhGznNhkymsGNnDozYVYdMukQVdAGQzOQjixFpctA",
		@"sqnytrvMnoaaESxt": @"fpKRbiTLZRKmFnfoBinlWRDLDzSEDlxeytZNPGvwizvKtWqSgXQLMtLhYCKJFUnMNnRwsuBLYoWpqVFdUjZBvMyCpulxZYKrizSVvvDpBHjDDobXAsZujdwTLLtrjiEeiYimakwLTyZA",
		@"ggTagdruMjeQWojIp": @"zFudrMBObJZouQlBdzlPuASoCkLegwqoAstzXvKOSShNBgMjOdKeVlNorbbEOedGKrVzyepJNFbZKwqpOUwLsSmvfCZzqnzXjDXPkbVGzhRgOqyMPPaeZ",
		@"awHoMYAGzGDNNpFHrv": @"ojoEmXIBBJYPXnylMdUsAhSeUBKyIzUPqRuIxxWHTwnpbBYCstrRDISJLOwoLzbgQWqHtVCOlruqGQXglWwzEItqblmVWjmHuwouhLdQHTxWSw",
		@"dyfppgqeBKTaS": @"pJMfEwGkWcUzhhbPsrWGoRuIcWtcGhoelbhnOIcOJqufqjKKVzPmjBmrbZnIXhwlxauPrVnbllFvilifiDxZUbZaySdxPOJfSDisxdJhyFnpCynRGLAGJJwhhSTSzCUcrlzURtMGI",
		@"YXkBMDKYOrzKcfQug": @"KvKXFwbQyVkVVluPjtIRjmNDUWKzBKYjNoccKXRdhfhuOiBHsvlEDbMKmtYZmuIgWETHnNkelEKvsHbltgmFZMWnPIFlctgTdduCNrcXeNZeqZWRtCxTHORMzPKdnHQVPwxrSo",
		@"pGQNLtHCeyqUmnYPd": @"BeIyYITWiUOkQgQTKyBsXWLqJuGZBLawplBRDDssaWvZFDXQVboixMqtFxHMeAwmdJcbzzZHqFjljCcKcKHWRkhgxMgxPhyGvgDwEDaHkBLIowApFbTvoW",
		@"gfJBPcNxKXd": @"KSbUtWVLOgrrkDhEaFmjrLkdMHzApJETeFxZQZgwWGbaDxEekCzrXrRreXFPpBnyuiSrvIyBeWinJDLMmtzGAKHRFDkhHlFlBEbEMJlRoXKoZBDfvCYSgAauVYFnqlrv",
		@"KwgChvbowxPuZEZd": @"pEcMKCEkjkZXRQkPICzjpxzryvBqdfsaalTMIMSRcnVXQdxZZyRAkuSnhsIWBJBkLlTINRDEcROrfteGeLZewAElZTKqcKlxZPWrnCKfoAalhvyzPcsUZhxnAxl",
		@"uNYOVmydlqwEvYY": @"CawdRyJVwpMUfngtyXyzhjKjsIUnkHtvyrHthSPSaqucBgSzVbiLzymOMUShMLgjgvyGMpsCOToqbKlovfcxsiXMqcyQRSzGjeZGNroraFOyLvONrLsJNBcaAL",
		@"yVuxsgyySrwKlilel": @"DlvOJhFyJLIQJBCeUWGHtRlnKksKIvyCraXiqHZqKgfpukjgKgTSrtBpuHkxqoAAZwyhrfEPCNSYuKIhAaXlhLkDVORYSBCHCTYqFycKDSJIRWVZNuwWVnEbOaghImCvrkAwTqXCmPNlcERYlN",
	};
	return LldIKfZCrGjpFnBqj;
}

+ (nonnull NSArray *)TXOahByBVgDIm :(nonnull NSData *)xEglSjfjYEoQsQnHwii :(nonnull NSData *)ZCRLzOrblpF {
	NSArray *raPWEpOleP = @[
		@"GqcuhoCEJwVbnEOeKbLyFAYayvbtuaMUwAfwwouAvvVevOopzzsSbqgRbIeSdZHnjtByyHJqPbijksRpquxcpaOmaqXIIYLnPZvaSRCgafGKsOCBxbHqDuacQdwcJM",
		@"jGGdtMPXfGNengdSPPcyhpviskWUDeNRDSVFvJjJpMYWndjlfYlMxkdtIcaYgfngpjdBCEWUeKsjeBeiFAjYHrbamYVKEOFSvAEXeHrJyDkYHD",
		@"bZHHUqscZuhmrujYANkDOfDMkupQpBvZWoeQWPrIeWnVwhUqmWMTBnyRWPeNMTbeXplyZehjTkAzQrNSIdKNWeloykCanCcOogCsQfCsipJbPGQYHPVAHVHs",
		@"KAoLVSPHcqxDFIuoVEqPMyfAZTVwjpzbuiumKfnNUnZQFzZPHZGqHCMVmZPSoXoBIzTKHjhQyeEPCfqZZYcMMeoAhZwoWYUrwNuKaZkvTxksHJPgNZgVyvbUsLB",
		@"TrMxZjvlSezbMcTwkjsyDAkIMmEyMcOVsjRVaIlPZODNexrlusbdxqygIbucjEpqzoaAuGzkZaMHWIKYHlpYRnDqZEKitAsJMpVzSPVFmYTLldEpaIBwMQFAxLbQmZXvtanKaNC",
		@"IPiJjBujWiIYJYdRVGmDKSsTNSwGflQVMmCaGJPSSlhciGOeTrwCpWoLJtHeurCYWhyphxszZDTQQEXOoqwMlnuBXehgMBGCkzatcDhCRTJmwTIffjjbdiPmFPrpmqjLxGvQWUTSbpGv",
		@"LkRNhqAbrCcgnSXaUenxHHLdVBzNWlyvudPnWBZLihkVKuSDxNytAZmkXjWzNjlHGIRTLFWNhXXwwKUJSAGRniVblvvTjOwwatFOUZBqIeibzGthwniOkFXeipzRleeGktzIfSBZ",
		@"kbdzdgYPLpksVfkTldhVxfwtuZkArfPyYVGRDotQTSbrNhMCgjVQYLmMHZbBdKfddStdpdFfQBuhBqzBbyvpqOCEBRRMyuxaQcbXslVA",
		@"fItblERyNPbBgJfziLMxzSwCsrDawzoBcakNllDMBPHkBNQadVAYVXZVgrBNKEiQDjdJmvcxNcxOqIRtviuCTJJkhjRhMaFYuLFtWHChau",
		@"EvurSvaRKpbKELTSgFkigLtkeJfWKVHyQYLerwfzOHzUeDaKSukaMyhrzddAVWEeLvNeaydpINcUVpEQvRqcPkUoyDASqNAJqvCYSLHqYxcUDWpBpcamuWwWGSIgHQnkdgjjUnLrZPH",
		@"aFbKRsSrNEmLcHJjdlNNGVsFXUqLrEvyPpbEkspRgiWnkCqxlKsmShNPryFoIyZlIuhYOJluKJQEsJLukfPBltOzDyehCigGgeiWkZBUiJmXdhfRnxcLROxvRrsxRVfCiXebItmCFpTmR",
		@"oONrKJCyWcGqHNaBDfhTljkTMqPqeowmxUYwEPnbbgEPuUkxDMeEXuucMpNyGfmGiRcNCBqlzXFyFPuvbJnzZnROsdefRqircXUIebBZKqedxejuolJWghOBpZkkLVifQOZvKtcfsXzBzzZ",
		@"hKTkAVDeBjFAExCRHoPmaqItaBqCYGuCsvQsGpjfBeNzXKGBrnZhFbvdJyUvcUjXqljUHHxLGImnxvWuGMfgzJfnOHSaqLnIodPeCDnqiaeTvdGOEytyndkXMdm",
		@"WYAEoLLEzQpkGAqtPaKsJfxvdrNjGYMrtIjWElwGrVgsPrRctypdygWDqNgPasmRJijSdxYyojcQmwkqnFVUYyItVtyPbZsDhuUhEhNBjcNqDqETxnrCXVfKsczzEwwiK",
		@"bxxnsRSoGlfOAmyNbWQQhjanqivMiGYMyCEKDCsOifUgJhMiOSjOvhfIKkJeiEKPZigTvJGfmuQBNwwpAABkLEgaRgotcmkjSgdMgUKBcTJBULvqLVTZNzx",
	];
	return raPWEpOleP;
}

+ (nonnull UIImage *)UGoXygCsSzdYACY :(nonnull NSArray *)ECDeUPDrdSZPELwdJ :(nonnull NSData *)GKTAwRaPbYOjuTb :(nonnull NSArray *)FXELeyeGkeOY {
	NSData *WKjWNfongpEO = [@"FWLHKKQZYaakifQiWyaakiZsaeRdTnJfeVZflFMFNSdQHkdlYErCjwOWlLgRTQZQrjfMWrbjXWJNRJcegtWdrOKVTgzVTzSHXrLBYIXyaPpZQKsePuYxbIQGaNuVEuLQFlC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CIpabTajwzEuaSLUy = [UIImage imageWithData:WKjWNfongpEO];
	CIpabTajwzEuaSLUy = [UIImage imageNamed:@"oyWAULNZSdjsrHMLKWGQunHwHzbkmwelJiHomWgEnduySgQJUFHXsQwlLVSelRUUxNEZvlEgIsnMBEuFFVZeAFAbcPpkHtajSBZnFjXtpkQgdwygeaEPj"];
	return CIpabTajwzEuaSLUy;
}

+ (nonnull NSArray *)BWfhtzBoNyYYjGlVG :(nonnull NSString *)lbSUKTqtbMZ :(nonnull NSString *)ILBPqRRdsxY {
	NSArray *eWaRtrgthgAnbZJQgT = @[
		@"gTvBfnsTFXNErENpHeIvvOaRmOGDzqZsJiPduIirGQtuvmQuBaPRWpbvHGqIJVwtwwVKFjgIkuDuDlFpsKivBRiyXTBVKnhMCGpgucqyBWgFBOiPx",
		@"jcfEASJRBHgMWNOXLxBtWEDLZBlLdpgQndqopMbQTnnJDpBtAiimbPOnwROJASSFXLwHvWATKNNrwknHTyyJMJYltLfagdznoUAJGnaEIqCMRUN",
		@"aUumrKAzoOZTHrEttmakbSZFowMHglrmKqzKRjYFjxkZDGjLOBdOXwlGABsXpsauvPNwljeAwLzitAZLkdvtnCiklCrrXNHYfEEQjgVbHTKZlSAdTxWRaAn",
		@"NejUUXlEaBlgrtaTmHljeqSluGwXWGdMyveUCCnqmOucIkRoMnOincfsmvVMZjGLbUEKjhNAyqEXiKQmLtnIaMutOmyWwkLULXqNkdIAZcFzaceqyQmRC",
		@"PpsddHCOfDHlSKtiuSelBPpIXNypyaPEeCZItLnAepNDvtCjgajuelKdBjttQcKFdysuADoqwefsIqbJnlhtPYbMCwyqfRonSTFbNFNTrRCwFFCh",
		@"wcCJOJIEkAnvaPPkPlgdKHswuKzsoQKLaSnPjpDPhPqPXhXVuTFtyQFhlpLSLandKMfXTRuejlOvKvYZReiDafoBpzTLyOwKcrfVjltLvolXeezVNLNLnrCeZA",
		@"RPdgfbLVHcmQRixlJrGZbwgyyKCQUTzgCBDUxOcoHWDhwTXxPQZOTyggKojMgZzxRwDyHpbyHREfxFaCVeSRYfkegtXkUhYRlYSGzqqQlwvGKUTqdMpjx",
		@"uSJVRxrrIOpIGTVeVwPNEmFoszFmmWMjBRyULnLiBgzGyUQHKQfIsYTlJrAvbYtroCFEfwGTBLgdBGuHvUbqQqxOjUXXqHKousCPGpNXTr",
		@"NuZEsVSMmuXQEDPLDLxeTURMltozzRTJxTakxozdgmJpFhuAPRXfbAwUnavwRaknwzpaQIzornzflThyRJPlrjfYnuvTwDYvqLekiYerWaaWmlYScVfd",
		@"MLvbXPcgXxeecgLwYcNDBQaykPJgeVIZBJGrmsvZfcKWKSAwByhuXYnVgWRGCpzsPIaiPwKTuQvMsUTKqjAapXRReeAZfbvoXuFfPcigpV",
		@"hEdsZdjsDKrWqfCWDRIGNzygBIzivdWhUsSdEDxioVKjhhQAqGyJcpiTBdxrrkSNeqbjncPVoEnhBGowKShgpAIjGgFmsBrnjGJVRCNHMpMEwzRRBLbfaXvdyAkSZk",
		@"huYPtixHYhoipbMNEhtBiMXXIVAuetPnVPRPnYDWvmHIeLnwaglpfIrxelsVVOOiIelpgxnxvccMtzcFQESGDZlWixIaXWGsDUHvmYIHFytHQPkmdYKhlqcJAQkoIRA",
		@"xbmtroIFcjtDhTqusKARgenMJwzAaHLcZRqhyKljuSzQDvyqiCMVLYlVGTUlrUkXzTlAYgLoPrCteGElxhLkiBJBvPmYYwoCBMOREwNXYINidiSmFguwmGRlOLyWlxiRfbwzoszSHGuvfY",
		@"kFZjEfUQAXyNhBAECJhicxruYMCjmPDVxTxkAtbwtJvgcfhiqjhdJTvPdQhDSYiNkhVZTybJqvvnANjhuzJCkhzHLQhRDAZZwHZDjTb",
		@"xpTbjhgwrgymoICEIpDetuztxvtCjzMZvVHghwTrDLtsFRcEWxkrJkinsXqOLBbDMEEbcNGBVqGXdIFDjzewUPBcwJANKLDTZaEMCYyzxiqDEAakSZUhHpIXwasmIGWOBwdc",
		@"XjBRHCyMJDoOYDVkjXkXvtdSSBNtmokuziSpUTQKMnsHTUQnMkjblIOkgDBOPQjrdBDnpCSNitTdvjBzXbVAuIIgSjnBOmsWxiVTMEXNZUbhhgfgGcnXCgtg",
	];
	return eWaRtrgthgAnbZJQgT;
}

- (nonnull NSData *)WEYIMVelAKWzWuur :(nonnull NSString *)biIWgpkzkGbb :(nonnull NSArray *)yCboNXxzHmwUpqG :(nonnull NSData *)uOqJXnpRweMOEaPG {
	NSData *FwnfzUIOWVmyPNkCS = [@"dXfUCklfeuxgHIscucBqnzmuorvixkfVKCmyNfmWTVstampgeiYJxSuWtInhdphIrytBkpXEVxBWKHBbHfvZDKkshmPyboIBWJQIDYYTFzMIvOimFJfQeNPoiCblcFpGFTsoGjfppxSM" dataUsingEncoding:NSUTF8StringEncoding];
	return FwnfzUIOWVmyPNkCS;
}

- (nonnull NSDictionary *)PRrVyedUVspFhSrxh :(nonnull NSDictionary *)GQTgLJcGXBcoTzV :(nonnull NSDictionary *)GhDrAAAHVkbqBEZWRv {
	NSDictionary *fYDlxdwyuGb = @{
		@"DrSQyYpSYjJbuFdMqp": @"gxYJLrtYFnCmMuJAQPIHxGcWYhLUgJHEGfMbalpSoInwCiUpdTlrkvduWJXXrNJyhjiDcdEOcAsMyEINbBwVghDSnLrXlCvsTwEcCrx",
		@"hSgMgsSylWwRhuCtbg": @"oYCnXnteZhKbiWotSuszJmeeAuLEPmoZABhljsWwcggxFTYiAJfkUyZOwRwxbZjTDvEPVpZpvbwSpJYwnyQlZXiVlfYfocwxoJTBUsLxzxsUsCkqLFkBgKQyS",
		@"CHxyTkfpXV": @"KdILIWXzfcRdtzLAVsXMPTgbuqAIBDLtZvBMVtUUZoPcGzyTcibugDJJOgHuDDnKOuUuledyHtcyPEjopWaCpehuvVQyUeKbWCTOxeBdXVfzxjqkm",
		@"qwSXtqVZeeaqoxfKL": @"oXkEmqyvzeHbwdDmOHzDpAexDXEXoCUyJkZwwXKUMEgkyMDXaTWGdtaqsSQRvGBoKUQvVCEZeONLvQoWwvTeozdzFITWzQFUCjvrJAzcPWpxdNsBBaKWqFXyvPMDkJXNKdRGpWsQ",
		@"ahugJpJptUDGUCxIVbe": @"YGNDtSsruSpOlqNkJqpLBsKwLDnFRWHsVGFqrsMKQioWPdLVvnlPqJqdLPVnIuREKEUxyiWSGqzjDchnKmigvmsmRHoIZCoiQYWyBTkYKkpYSHdxrKOuGFiRvuMUs",
		@"vTTdMlVSmFpTBu": @"esxtoIPWBIStnmJTsrLDxKWBErMcGooRKqiRfMCEUOYeHCeNxSuFegvDHeaWiCsVhFCYlGnnOyUgiWHunJudyldhReZxprMHfXawnkfqwYkXkIWUUBXmZrhmZJAKuhfRCHOLsGZHJdOiNHe",
		@"AQFmbrkWaJDSaDY": @"FvVbtJFIEZDrLbZIMTdpqiPQOItvOKhnMuRWCDNNwlSmZikEGwOXwErMWBAknmMUUFMNwHcZlrCxWwXwPfeOnZdGyhNwVcOgLkNvvneoHGKyJZeAf",
		@"LCPHytLYAQAcbW": @"WKCjwghQmTaxuukJCcHpCYRarJQUoHBtlLrMiJMfeXdDmakicqVPCHuIAhDgTvwGWjrcixWAeBnRQIjfZDTsYDFvzCflzzdoaGOZmEniohRyZBrOcRTBlKThQfIqKKOkewzYoJxrcTmwC",
		@"kUzXkoAhJZ": @"VmUSDVyOuZBfcgmviXyArSZYpLJcUDTLrVbbgGXulMrrksJdtPpGsROYWCMNoSBNBPzCHZtWTVepFlWQAfdGsJgXaHapbxSWkabyhiegMOBRVQAGKfndkkvHufpFcony",
		@"sTkBHfbLHS": @"TXtizOwYyTGkhdKVevCKSOCHcKZcpqXCuPsQudSmUCouHnXynNsLhoiCiWJoilqjJtMreUXaEeYXQXEVgJWolWJhnxNtKtaklqPTZpabpNc",
		@"wHyEQptVJpAu": @"ghTBgyOdgwhDiymCMHDJaxykTifqWtBvLgebLqsSgZVmGbDeOMMKPqDlOIbKlJSjxyVdTbggZgWDatkWvEeSuUpEfMPbiaValGZHjtZ",
		@"CWxkmvUhScwW": @"GhAYreTyBHZOaRYMKgtuMoCJctbydZwgXXLOXhnmeCtmbHCnmDvnQdoktbQVdstLhxXjJKJXFbuxVaVcrhGMIBfoylkbDxqKmEaFbePApXSzcGcHjOovSlRLbvRwIvFIK",
		@"LtnxhTRiOcpeeDkFfkw": @"reIZqpRrFxWdUdvARWkEKpKBCJjqbTsxpmQZKjyLWOGiaoGtJDqgrwTdhpIsJLHdcCXyulTgvSeTWklVeTltQwDaQSuQWJDjRDOBfBuZLukYOcLw",
	};
	return fYDlxdwyuGb;
}

+ (nonnull NSArray *)rWEDhLQFFmdyn :(nonnull NSArray *)FIKlBwwNizrofBdzRs :(nonnull NSDictionary *)kOUAtseplWr {
	NSArray *sGcqDNIBcUeSlTUK = @[
		@"gCnltoKEYHbWDHhwZMadWgjIHYJFhdxIPQNRAfGKFrswdbtAdcQKoRzSzKVDPCfJUlWeVCzeTHgClgPsFZdlBaeLIUjdaONfuWuEjpmgniIFxcNZlUpEcWWOfuoRkxJqCbMAXlHMEksjcnk",
		@"JSYnjdwvBDAaBzREiuCdbGKPdrLKKMbLqSDeXQdnQFVWsMWrmFFEYlzwWfXEVDdRhvxTdYrCHdCzONtaRZPgFLdXGkoaxEwEYiUxkYikHCFKBb",
		@"tSbQeRtFgKZsenCGQBhMImadBXOmPtAMbTkJzhVLSsStohrKhaBQXElgnUBgCEvvineSaSSDfiBZwYJbCfrKYACatWGEfouzOzQQkoSBrJUHhIAtjRrLxgYkLdUF",
		@"XBgegnrQqxbkZVbRpBkkMkpgZtCDUMMtlhQvZMKoVVdYlYoKkWisPSqZFYkjiooemvaXYVAWqNxtSfYuSGMcwXrSvBahHtujHkLUOgEdqSfilrDHlxWYcxbc",
		@"UtVhPnWrebVMFUaHjdqbwpJFguyyNANhmAWQWCqQsUfsIsTRkJaPOwFYLHomyDvCrdXLexSUPYOUKYAjIsESZdfPwYhvjHWiTzNFVxSiIeyCFWQoiYO",
		@"dLOnKOuexDcANOhYJrwKSoVnFfBhYrCnBdzoIKoWLbKSXfxVUTEuyKUSkJzfyrPihtOHsjVdmUDCyjMxgCcxihjGbflCGuZvVqKvExoAaNpAbHQqQGZOPhPWuSZjTXjQg",
		@"kxOOfAwXYDAOUvAghovcUmMkQbFvPSKCAkPgKUXWiGWNfvrHhUcrBawCpQQLBmCBdkvmHdWcJsuxCoOMExUbvGBSELudtiHLzyVpNuuDvflwZtaKumyL",
		@"bVLcxWmipUzgtTADFMwZViLMmTtloHTuoQUhvnivzRyFfwzOdGelJubGrDStFalMbzAkmANXmlVChoLxNiSKZVXQvDvDxbmjsUgANnaYsfVGfSqQnJwqKxljpiFFtwzG",
		@"hnwxEUDWQWVlTzHyiREwWaXZoPshYlFrLKRlesZnHcXtwmvbAJjsiSYUslrrnFjwSWGeSpZnRWLwLBNAJvDmoEyblCoYQQcMqkmXikCqhrFptxsQlLvVUnxEbtUAFIkA",
		@"nJROieDUGgNQbYJuhTwmmrKFFUKZJXMnpkGNPHZgavBRKiwcCLImFewwoyjtXYWPcIwCfETvObeDzluOWsTpmnQUzaAVPOKOYgPnVdeOwuIdOntq",
		@"inbNnHltyrHMtCEPWZbWCDEumRRLYeSBbHXLWYRrFjLIgspxVWRvNmDaqlZwFcWNriLmGATadAMgJizgOuYWeWTNYTzbNUFZrwuSHBwIGmvjCxPTgcWoQVkfDBbscmoEM",
		@"jDmjEaNrgGlkRCDxnsZWZucCobUdOTUrRMCFQXUESwqTlouEFlAvNbGpXdykDxabkWvDtVFRhjAMKRwcdkTmZTRACrwexoxKhAhcdgrjXbuNGbkqm",
		@"uprcliijjMyCvQGbzLmoloPTnbWEdJGymEfTTcnrJmbWllWFqsJBfONZIRHxZwbFWpSzITjZpUeVwClAkHpOoWcCOuNPghoozbOyjQnmkbBramIKZjmIDrImEXCHrxFs",
		@"NLvlEAOMoqyVgMrqoUNyaIhsAooDMcRpqLwofnBRBSGisAXfjxQgcIoCELnWsTPuUwJoEnrbdALylrLfZfnecKIOssVfjxnEqMpng",
		@"ACLeoUHTlkSqMoSdrpfSsgxlIbtczurpwEONnMnwvSfadlOdoZnrAFvJHWGdczgwnsEqXDcLYjInjNsowkozkDeFHIXbpYxzhvnfqwzMPdXRVtyChXSLeDGAKB",
	];
	return sGcqDNIBcUeSlTUK;
}

+ (nonnull NSString *)IxiJBOGGOLoqXnb :(nonnull UIImage *)OyBfZdlFCooz :(nonnull NSData *)vJpzwdRfshAhocQRyqC :(nonnull NSData *)lyYInCKPPX {
	NSString *eCWueXfgqVUqaVKTgss = @"AhCERyMQkksziUVfZBFhTcDmbfclTwZwUTGGYWjMOSMRxQbntEwXiECxGyFZwnkWWeGrWEKWXnIvYKNalWXWsGfmqliUABPOjTvoIZiYkDy";
	return eCWueXfgqVUqaVKTgss;
}

- (nonnull NSDictionary *)IyEylqQWIBb :(nonnull NSData *)dqdwonrwlLLQt :(nonnull NSArray *)SVOJiwNPDn {
	NSDictionary *YVBeaoSenhCMDlxj = @{
		@"AQOuZOZZIR": @"GOdUCQsjUjYhlMliloInxMzQnZnGjOsqqamZUCicwBJypPeVBnLlUvtSumaZbJGCUtsDTrtQayJTUCnXKVaPiGUMDPpqHUoVdmCllAtmaRbKovxLZpfoHfzalVuGjSegGyWClLIzyZp",
		@"WmiwFEdQsM": @"XHcywtvSfkcLhzfpjHAlxwXIDzudQMKUFYALVcgocpLhGgZadTnjYbsYlXUwXBYoLrJipHkeqxBnihotfRChhWjKLDFIfLsIYINGctdJFZSEcGW",
		@"RMTIPleYYAWb": @"xNxVSiNauzQqWwUHyUjmdaEJMyepNDnOdZIjhsZOUzSghCnEYjQlLTKYRVlemkFeYpHGcKCHDIRbFsBqKfgmgFnwCuvOYFsbkHctJtyJOcwILIVrxpdsvuKPluxzEBaCurqGxRAXBsuxgEzsaq",
		@"tbpYNSoTJzRyJX": @"KwXlCxzvyGIvRjEVXNCVQDSGKwnjaFQhVGLWWfkxTBJQIStGfhJTcoUGJueEAgtPmLXsMuqFlHEOFMclxIIRjUtfiwGSRDCsUSjDnJjwyhxOO",
		@"nfUgPniVYwWS": @"PWTAVWSQYuKSOXZyYjQrwkLIMIUaABOHzxNVwWNoNwKShwQCkzsyjdtprhTQbCHtQRXBPRnxlzYwBLuJoOWawOoMlXhcDsONvNFqhsRFo",
		@"yTHXcvVaxt": @"AxfusRnrBOQmnNEEyIeZHiijiJXvaEbDMZfNzgxHWzrSQqsEMEeLkdrKsTdCiBsdmNBQyNTALognTFfKhyshjzxWbDlZzUdSggyQJnXLnwcDuJGBtCp",
		@"xUbLkubdHDsclGFjJd": @"DMuUjlUtJGSJjlMtQpbsCvAHckEHLCVSDUCpLJxZTjcfpEbuPlGODpbbuckgaGpKUrwZeOAMyHtWgOvQbaiNbcqxlfNlRZaOAzNlzQ",
		@"GCqwBYHcvxPl": @"tipuQcOUkYgxssLyWHQmPlGRyteRbArgiluRTJzcLSTseOsfoovNpwPWjetrTQCayFfAxWOlhMffPlAHUlHaupajsnVecWCHsoENrWmBpWKUcqlhuyxAdiNRr",
		@"hJCpCukLeSrd": @"PFhgYwCdEfaJglzkWuLxQHcGTaTrPUfJNaOLgCCGQLUeojmbTsKBiohFVsfZqEgUPsYdQCrzCQKvmNWoLJLfsTaOVUmUCzhUjWkycewxFgJucorkubJLlpLTHgYiDZPiUnLgXhemxVJcZW",
		@"jtzArWetxQisANRzo": @"aPtzMythUbigIYOgVcQuGoEltzwStkFqxDTHxSmZaVQtxtWygnZTitPVDdiFESgBJPVKQOCukrzBRgTAjvPifWvqIxFxUFgdzgelmXptEOrreZKRGxklkYD",
		@"GkMKdnIMSqlHeOok": @"wEQNFNihfbHJgOUqNzaZzTMqeGzVIHUWZyQmQShivgEpfEWCRktuaWQOhPBmZoLmYfiMUDprCzYniJWXpXwtbNmANHTMoldyoaztTZufNRoTjHJlxbTxopfwuhqYgBLSVjgZ",
		@"kOWbMHsUCBffmmvY": @"JsLfkgJSnZyzAZpqpBLptAAaioeBzFYansWZAuoVWlthBhsbYrCxxjdjGzuAMhYsyitxqlOiRerKrCJjNdNLZPQMSfdsjSUtBfThMDhvCLzyqGeltaqEQlnkuhNcQSizOWKbvwDOSBMTaOISpdlRr",
		@"WZLbsSRrNbgSS": @"YFWXTrOhYMBHIASKZzMSsFcMXKTmXGCWhlsWNmEnaXGOEVpDTaZITsFoBguBaWSGZqgqPZkWUEFoNAQUMDETPDfiakMbVuWyfSxlM",
		@"ggSsjDKjplONuAFGeKc": @"VEmeLxfooCxBAflvKIkfQysnyEdKKPHQgDSYabZlTubPFozwkPvlCyuvGVnsbRJkZszlVIVliZVJqviPluQgHQSrHwUaFQeiFqCeWKWVknlBrrEd",
		@"FOSaabvPCFINh": @"ojfrHoroyBufFevCicwvSwcyhVhAoZrETRVoCKbmkkGTBEkqCrLqMcZbGiWIyhxmgThBHXhHeMxOflqzkcNRCGmDoCMlHCHLftHVFfahCGOEKRlBsPEyGAPjWcmOZYGF",
		@"hNyZtYrKlzfAEOVeuyi": @"yKVMRnaeCvwCxBPWPzVShlrSdzwSRYojdHNEizPoPMYTXhtteuLBVPRzHpkOFNxfyzvTgGGSzpMOsnLgGFsfrDuOQNPIXqZLqEIiukXeTcWrPdTJ",
		@"FiAZwWSSKScZzpFGHRA": @"jDDTvJqpdzzXUlqygHmjDiHgUcclXklzGMDdYFMLIVOtNjoRLOtBMrxNTBTFSPJCytMQWoIiclfbuPPQGkwgLfyGLPaBirbJrKRWnnFkQjXpBhmnAPmU",
		@"rRirQwdjDYIMyutk": @"JXgvyTdNIcVSPxuibdpHpIPrfpAZoLBMhlEDtFZAmOOYhiZBtpsKpJtTwJtCTGytUeJKPbOxqTtYYIvRRmHZgPiEIXQOPUXANPpnWzNxymhZzKXlVzWDroxaq",
	};
	return YVBeaoSenhCMDlxj;
}

- (nonnull NSString *)GOTUhyQapS :(nonnull NSArray *)SeFzUhBjXSi {
	NSString *WCsXMMKHnngRkgkWBl = @"SdgRIyvrmtxcCHpfbcPSqclLBkirbwNvMHohIQtccvtCVkiFsKIjppukXkekTXOwfZQzPKTRbIcMJSdrtCLQdQMBttdaTHoKFmrcIZNZtUxXsvkIAcQBqrUTmrFkLF";
	return WCsXMMKHnngRkgkWBl;
}

- (nonnull NSArray *)adyPTNKhwSfhcIPvM :(nonnull UIImage *)aKNmZFzbxhn {
	NSArray *maZXFMOsRVTjRsHlCzA = @[
		@"heytacAOfhVpOxrATVaGgncViqMsaXPlEISLoCGipANgcKuTbJSxfltfZZBvtrKcLatPtxImtSDxmpRVaxytxdtrAYCbZvtMqDWBgMEfUgJnYCQJjLWIKrJHMruTETbAoMaclFlfxwiiEsXzu",
		@"PwESdtjtFznDYOVWySdYPPwudtbjbjhQUWjFevOvdaAmleJkuxRGwsIYSSVllBOhwMgjJcoetfpPkEDvmGyNInjhVNZUOpUEZnjbVSFPgwhEmdsLEJrMoigdhbpM",
		@"xFpZHctKfaPTaGjJuwJWYRlbkIbroErtfHpnTHnyULWqTrwwmXdhYvzltbQtPGCutqRRdZtcEnyqHQieBhAnaVuFdfSmXKhXRvNHCVVpwhVopvTVhaNvEPWtQ",
		@"QMtYqsHlzIgkNScHTKoFTbpXvfgSbuaTLhEmEPwQEYknIeRgqoIIsKHXgBquLfhlAgQuiDPTRXokCsHZNXVkTluXBeDuGWoIMwzctiyUIjYNWVTwrMJaRQOTewpR",
		@"XDxVhZHTcxWfADECbFPQudrvebvSxUSgIbnYfhOWoJjqNjLnDnqexqyRnieeCWZDImMpYEwWFVQekaKQBorYqHPPuZLCHuSMpyCorBBDQmouIUadeoOSjCfdipMCMzbHfqQJezWCgihirocE",
		@"OzTqJzSsedQkyoqiRsdAOaRMINMUcAUweOOwfYXaAWbqUkZkVWzhBnMleRxNqTyYwtFSOwfGuQMtLQMGZLRjLidGxzLBYQBaCAdyjjJVwjBpGWqzGOLqCoQICtOKnCYzfDHKRuPSVHvLoLywoUQX",
		@"iTiUZgoOLNpWvHyJpuQsRXcGwfwAyVRwrjtJaJMiUEDVErvMLzVqSWfHRwmJXrFzaKMNjQHBAHkZCdAGwaQteEeSuWFJjAcfWRLTDEViSEwALZykpsBYYFZWkROvUJTDlYMDvsxeNgJHal",
		@"MTuSEYezZVzVTIbamaDVFOHuuKYzBwRmaiTWpRNwsSnczspbsouBFeakUcUiaZXlRVJhUBTCyebzDNkKlvCZkjaXeZEvYAvhDTSpMwvEZZbxwA",
		@"cgPZZemdNdHzjdWPWbIHSpUyzkSaPhFdQUJdrjXDCnduqKdFmmgrnBeSTZzHtDATxbvYSgFngEzTxLeCgTkOFhDyFxHHIonsrqOYsHYQuzwWUTjXhvltXVTgAXdaGJosUezMou",
		@"TcIxAxTFmLbeoeWoxItdeBZOiTdVKAyWIeuxiYoblbBzVgoccXBbOjVdyjLHYVilaTfietOznPkxRowEPHCfaBucQRMkYyDtuqkrGroeD",
		@"FjMoBeslaSzCclBTgKQpCYROVhhZNfdWskDFIeSqgotOJzEOXAIlkbBTqhzUUeKTgumJIVViMMvQyjreNhaRkYEUPetqpfiYbeEWUNqwufkSVzvQBKvlvvZbDIUuMMrxr",
		@"WMtXTXKzKbshRGhbaqPueddWcvlOqARIlwJzvxEGIAJXqaMlTtcyygkmTcqZhwIDVbAIlFfyqjGtlWWdCWoTrtJLrJpVvNFNJAFvLqPgEWvRJ",
		@"zkOYpxLjmCazfGzAszKAReKTDijMQdtKMQDLXDIfJKrsMJbCKxsknmcQBzgNKNZgMrxKQHjoFyZluyppCjJGYNzjUzBAGFPhtMyMNwAoGwtoqbfKMkPpbHvLfAyWGV",
		@"xWooFdgBGTqLDZHTCsPcPihxtOujlcKpISYsqojOieUoKhjmqNVPzTBMPEktRsZUuARraSHbqPAzviYgcilYpghZIrIhEvVbkZsYZCFLiWpfsdFJqdsCmfYiQcgoUcMRggR",
		@"ayIMVnINzXignzghYMLOMxyiotZgPhguyizyeDfvgkEeyzfVHbrLbnJRvhpbcDMCXwiHwklavkTFmMAWNLTNFQESDvGuYXXAWBMPdYZgSuKWyRlqAW",
		@"FwtAiOfgaXHTppiEdSVTwWstVORrwqtATGjZrKZTTsZnoXoJvrHLOcgoiFoOOoBEdNBIxdWmTFwWGvceNNGNvomomTsPKoWuNNbuURqBJTDooDdgBddmXyFLcYoptCr",
		@"zeMKEWzSbdhWqgSwjRdaDbmLAdOxLrsnQqlqDbKnnrDCrJjZpvLwIcCjBkrOwUaVLxteGOLrMWKyvpfaDBLMjHmneAZmaEGCquxzrytiuKZghELPVqwbHZhmJorVLSrrSdrQiBkycmkGc",
	];
	return maZXFMOsRVTjRsHlCzA;
}

- (nonnull UIImage *)udaJPDOhMlJtNWoIaq :(nonnull NSData *)KwvINjNGijDaDNyr :(nonnull NSData *)EEQUZsjMMR :(nonnull NSData *)fcDKsiZKeoUfN {
	NSData *EdMkfshLRgCqCQPwdMJ = [@"heAQGkgEeYYlfDEwWTMlLLZDZTgtwjOqVzeLVeUJyQqbdJCLhlVQMpnCbNBuLKaZFznQCOiSloqQFUdGhjCCUoPMNrJhvqbgBLlfyACgMMsmtmpAbSxHpBPxGiwFwNLYfaChKRzreTe" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *BDDzOuXglmAjTMcU = [UIImage imageWithData:EdMkfshLRgCqCQPwdMJ];
	BDDzOuXglmAjTMcU = [UIImage imageNamed:@"uzPCijaMkHPlLqYbfzAmQAgXqPqYlOhbhKVhAdYoNSXIgPrPBHHeGtdPXZszZfmhIrQEFvnPCHMYmWhrIhYdtOaAxzszQBxtcApqqmqVxDbzbYELwnZcgqVNmyMJVLiYUJbhyCzXRjmx"];
	return BDDzOuXglmAjTMcU;
}

+ (nonnull NSData *)xoYuCKofaxDfwFk :(nonnull NSDictionary *)DPscLXHOZYYfIiiY :(nonnull NSArray *)BWvMclBGMSJBRP :(nonnull NSData *)TqRUDmvkLJpIOX {
	NSData *vlIXOGyovs = [@"ywGpFowpinJJKfaDMVaOjFsNMkNTMtidIlfLJUGRprtskTgKuUePghCohqHBqGddsaMaHmTerDlpCxjsjiUgVUjpEwtOQyzQAApjVxNrlFvRVjGZQkbAuklLnrhXKttGXHgv" dataUsingEncoding:NSUTF8StringEncoding];
	return vlIXOGyovs;
}

- (void) loadMoreData
{
    self.isMoreData = YES;
    ++self.index;
    [self setUpData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    H5CourseCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[H5CourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.h5CourseModel = self.datas[indexPath.row];
    cell.delegate = self;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    H5CourseModel *model = self.datas[indexPath.row];
    [self pushEditView:model isEdit:NO];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}

#pragma mark 创建课件
- (void) createViewClick
{
    MainWebController *webVc = [[MainWebController alloc] init];
    webVc.isFromH5Course = YES;
    webVc.webTitle = @"创建课件";
    NSString *header = [MainUserDefaults objectForKey:FileServerUrl];
    webVc.url = [NSString stringWithFormat:@"%@/%@",header,CreateH5Course];
    [self.navigationController pushViewController:webVc animated:YES];
}

- (void)editButtonClick:(H5CourseCell *)h5CourseCell
{
    NSInteger index = [self.tableView indexPathForCell:h5CourseCell].row;
    H5CourseModel *model = self.datas[index];
    self.h5CourseModel = model;
    
    self.h5CourseCell = h5CourseCell;
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"", nil];
    
    switch (model.status) {
        case 6: //待发布
            sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"编辑",@"发布",@"删除", nil];
            break;
        case 2: //审核中
        case 4:
        case 7: //未通过
        case 8: //已下线
            sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"编辑",@"删除", nil];
            break;
            
        case 1: //已上线
            sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"编辑",@"下线",@"分享",@"删除", nil];
            break;
        default:
            sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"编辑",@"删除", nil];
            break;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [sheet showInView:self.view];
    });
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self pushEditView:self.h5CourseModel isEdit:YES];
    }
    
    switch (self.h5CourseModel.status) {
        case 6: //待发布
            if (buttonIndex == 1) { //发布
                [self publishH5Course];
            }else if (buttonIndex == 2) //删除
            {
                [self deleteH5Course];
            }
            break;
        case 1: //已上线
            if (buttonIndex == 1) { //下线
                [self deleteH5Course:offlineH5Course];
            }else if (buttonIndex == 2) //分享
            {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self shareCourse];
                });
            }else if (buttonIndex == 3) //删除
            {
                [self deleteH5Course];
            }
            break;
        case 2: //审核中
        case 4:
        case 7: //未通过
        case 8: //已下线
            if (buttonIndex == 1) { //删除
                [self deleteH5Course];
            }
            break;
        default:
            break;
    }
}

#pragma mark 删除课件
- (void) deleteH5Course
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定删除吗?" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:[ManyLanguageMag getLOginStrWith:@"确定"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self deleteH5Course:deleteH5Course];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark 跳转到提交审核界面
- (void) publishH5Course
{
    H5ExamineController *examineVc = [[H5ExamineController alloc] init];
    examineVc.h5CourseModel = self.h5CourseModel;
    [self.navigationController pushViewController:examineVc animated:YES];
}

#pragma mark 删除课件
- (void) deleteH5Course : (H5CourseType) type
{
    
    NSDictionary *dic = @{
                        @"id" : self.h5CourseModel.ID
                        };
    
    NSString *urlString = DeleteH5Course;
    
    if (type == publishH5Course) {
        urlString = PublishH5Course;
    }else if (type == offlineH5Course)
    {
        urlString = OfflineH5Course;
    }
    
    NSString *url = [NSString stringWithFormat:@"%@%@",NetHeader,urlString];
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        NSNumber * code = responseDic[@"rescode"];
        
        if (code.integerValue == 10000)
        {
            H5CourseModel *resModel = [H5CourseModel objectWithKeyValues:responseDic[@"data"]];
            
            if (type == deleteH5Course) {
                [MBProgressHUD showSuccess:@"删除成功"];
                if ([self.datas containsObject:self.h5CourseModel]) {
                    [self.datas removeObject:self.h5CourseModel];
                }
            }else if (type == publishH5Course)
            {
                [MBProgressHUD showSuccess:@"发布成功"];
                H5CourseModel *model = self.h5CourseModel;
                model.status = resModel.status;
                [self.datas replaceObjectAtIndex:[self.datas indexOfObject:self.h5CourseModel] withObject:model];
                
            }else if (type == offlineH5Course)
            {
                [MBProgressHUD showSuccess:@"下线成功"];
                
                H5CourseModel *model = self.h5CourseModel;
                model.status = resModel.status;
                [self.datas replaceObjectAtIndex:[self.datas indexOfObject:self.h5CourseModel] withObject:model];
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
        }
    } fail:^(NSError *error) {

        [MBProgressHUD showError:[ManyLanguageMag getTipStrWith:@"网络错误"]];
    }];
}


#pragma mark 跳转到课件 编辑或者 预览界面
//isEdit 是否是 编辑
- (void) pushEditView : (H5CourseModel *) model isEdit : (BOOL) isEdit
{
    MainWebController *webVc = [[MainWebController alloc] init];
    webVc.webTitle = isEdit ? @"编辑课件" : model.title;
    webVc.isFromH5Course = YES;
    NSString *header = [MainUserDefaults objectForKey:FileServerUrl];
    webVc.url = [NSString stringWithFormat:@"%@/%@?id=%@",header,isEdit ? EditH5Course : ViewH5Course,model.ccid];
    [self.navigationController pushViewController:webVc animated:YES];
}

#pragma mark 分享课件
- (void) shareCourse
{
    BOOL isInstallQQ = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_QQ];
    
    BOOL isInstallWecha = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_WechatSession];
    
    BOOL isInstallSina = [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina];
    
    NSMutableArray *shareArray = [NSMutableArray array];
    
    if (isInstallWecha) {
        
        ShareButton *weChatButton = [[ShareButton alloc] init];
        weChatButton.tag = ShareToWechat;
        [weChatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weChatButton setTitle:@"微信好友" forState:UIControlStateNormal];
        [weChatButton setImage:[UIImage imageNamed:@"share_02"] forState:UIControlStateNormal];
        [shareArray addObject:weChatButton];
        
        ShareButton *weChatButtonTimeline = [[ShareButton alloc] init];
        weChatButtonTimeline.tag = ShareToWechatTimeline;
        [weChatButtonTimeline setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weChatButtonTimeline setTitle:@"朋友圈" forState:UIControlStateNormal];
        [weChatButtonTimeline setImage:[UIImage imageNamed:@"share_03"] forState:UIControlStateNormal];
        [shareArray addObject:weChatButtonTimeline];
    }
    
    if (isInstallQQ) {
        
        ShareButton *qqButton = [[ShareButton alloc] init];
        qqButton.tag = ShareToQQChat;
        [qqButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [qqButton setTitle:@"QQ好友" forState:UIControlStateNormal];
        [qqButton setImage:[UIImage imageNamed:@"share_04"] forState:UIControlStateNormal];
        [shareArray addObject:qqButton];
        
        ShareButton *qqZoneButton = [[ShareButton alloc] init];
        qqZoneButton.tag = ShareToQQ;
        [qqZoneButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [qqZoneButton setTitle:@"QQ空间" forState:UIControlStateNormal];
        [qqZoneButton setImage:[UIImage imageNamed:@"share_05"] forState:UIControlStateNormal];
        [shareArray addObject:qqZoneButton];
    }
    
    if (isInstallSina) {
        ShareButton *sinaButton = [[ShareButton alloc] init];
        sinaButton.tag = ShareToSina;
        [sinaButton setTitle:@"微博" forState:UIControlStateNormal];
        [sinaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [sinaButton setImage:[UIImage imageNamed:@"share_06"] forState:UIControlStateNormal];
        [shareArray addObject:sinaButton];
    }
    
    if (shareArray.count > 0) {
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        UIView *shareView = [[UIView alloc] initWithFrame:window.bounds];
        self.maskView = shareView;
        [shareView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shareViewClick)]];
        [window addSubview:shareView];
        
        //遮罩
        UIView *maskView = [[UIView alloc] initWithFrame:shareView.bounds];
        maskView.backgroundColor = [UIColor blackColor];
        maskView.alpha = 0.7;
        [shareView addSubview:maskView];
        
        //分享模块
        UIView *templateView = [[UIView alloc] initWithFrame:CGRectMake(0, shareView.height, shareView.width, 110)];
        self.templateView = templateView;
        templateView.backgroundColor = [UIColor whiteColor];
        [shareView addSubview:templateView];
        
        //按钮宽高
        CGFloat buttonSize = 55;
        
        //间距
        CGFloat spaing = (templateView.width - (shareArray.count) * buttonSize) / (shareArray.count + 1);
        
        for (int i = 0; i < shareArray.count; i ++) {
            TopImageButton *button = shareArray[i];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.frame = CGRectMake(i * (buttonSize + spaing) + spaing, 0, buttonSize, buttonSize * 2);
            button.centerY = templateView.height * 0.5;
            [templateView addSubview:button];
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            templateView.y = shareView.height - templateView.height;
        }];
    }
}

#pragma mark 遮罩点击
- (void) shareViewClick
{
    if (self.maskView!= nil && self.maskView.superview != nil) {
        [UIView animateWithDuration:0.3 animations:^{
            self.templateView.y = self.maskView.height;
        } completion:^(BOOL finished) {
            [self.templateView removeFromSuperview];
            [self.maskView removeFromSuperview];
        }];
    }
}

#pragma mark 分享按钮点击
- (void) buttonClick : (UIButton *) button
{
    [self shareViewClickWithNoAnimate];
    
    NSString *header = [MainUserDefaults objectForKey:FileServerUrl];

    self.shareUrl = [NSString stringWithFormat:@"%@/%@?id=%@",header,ViewH5Course,self.h5CourseModel.ccid];
    
    self.shareTitle = self.h5CourseModel.title;
    self.shareImage = self.h5CourseCell.headerView.image;
    self.shareSummary = self.h5CourseModel.descClearHtml;
    
    switch (button.tag) {
        case ShareToQQ:
            [self shareWebPageToPlatformType:UMSocialPlatformType_Qzone];
            break;
        case ShareToSina:
            [self shareWebPageToPlatformType:UMSocialPlatformType_Sina];
            break;
        case ShareToWechatTimeline:
            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
            break;
        case ShareToQQChat:
            [self shareWebPageToPlatformType:UMSocialPlatformType_QQ];
        case ShareToWechat:
            [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
            break;
        default:
            break;
    }
}

#pragma mark 分享到平台
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:self.shareTitle descr:self.shareSummary thumImage:self.shareImage];
    
    //设置网页地址
    shareObject.webpageUrl = self.shareUrl;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            
        }else{
            
        }
    }];
}


#pragma mark 删除分享平台不加动画
- (void) shareViewClickWithNoAnimate
{
    if (self.maskView!= nil && self.maskView.superview != nil) {
        [self.templateView removeFromSuperview];
        [self.maskView removeFromSuperview];
    }
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    return self.pageTitle;
}

@end
