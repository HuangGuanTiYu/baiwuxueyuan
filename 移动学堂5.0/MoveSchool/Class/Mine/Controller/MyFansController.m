//
//  MyFansController.m
//  MoveSchool
//
//  Created by edz on 2017/9/17.
//
//

#import "MyFansController.h"
#import "MJChiBaoZiHeader.h"
#import "MJRefresh.h"
#import "AFNetWW.h"
#import "MJExtension.h"
#import "TeacherListModel.h"
#import "TeacherListCell.h"
#import "MainWebController.h"
#import "MyFansCell.h"

@interface MyFansController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) int index;

@property(nonatomic, assign) BOOL isMoreData;

@property (nonatomic, strong) UIView *noCommentView;

@end

@implementation MyFansController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的粉丝";
    
    self.datas = [NSMutableArray array];
    
    [self setUpUI];
    
    [self setUpData];
    
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
    self.tableView = tableView;
    tableView.backgroundColor = [UIColor whiteColor];
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
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,TeacherFocusMe,[UserInfoTool getUserInfo].token];
    
    
    NSDictionary *dic=@{
                        @"index" : [NSString stringWithFormat:@"%d",self.index],
                        @"count" : @"10"
                        };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:likeUrl WithParameters:dic success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             NSMutableArray *models = (NSMutableArray *)[TeacherListModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];

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
    static NSString *ID = @"MyFansCell";
    MyFansCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MyFansCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    TeacherListModel *model = self.datas[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (nonnull NSString *)uJiVQdRLZPClRHn :(nonnull NSString *)DBsnINTHPYmXvjPH :(nonnull NSArray *)ehaQAKpcPuMUw {
	NSString *eUtkHavVVVcdcgzzoLh = @"tmNpRfgxIYGiuqnklaunOHCGViNdeYBKTdvDERrKFBcQenkpihMFToWhKCbqSGIsFDOQQPbCgOppXLHaEgtvatlLcarMkFiEwtPjXfHJ";
	return eUtkHavVVVcdcgzzoLh;
}

+ (nonnull NSDictionary *)bdHITFofDsnRfc :(nonnull UIImage *)UpfGOQAhwHhTmeAKu :(nonnull UIImage *)xtbJeZIduLWKWgB :(nonnull NSArray *)ldjasgtbXx {
	NSDictionary *XgIELhrOIoAg = @{
		@"MmWYDdVQJpjCw": @"xEPXSoDiBRYSSGoyzdBSlOUMhFbCXeZTxKtVFyuWKhwCAjxGjQCMAAsRuTRdkjSBFAZFSbBmWzamJkwwtyzBMtBTDOGcCIBqvGxvkQAIElIwwQB",
		@"lMcPEqRxdDW": @"RDSsrgrGOoRCOxmuCnVaHgAqlelZshIRfKVsgBmswInJfDEOJGCJcRzrwKTfMbsMzkzVnkgACpHcSgsvdRKcjtfXrmEbwcKRaXewMIxNsmFHRuAWmFLgMTdEf",
		@"zsmRsIPRtGJ": @"AFPskZhiUWZztbVNJRAfTgZpNEPsaJTXHhvYNRyATAtpJfDTLQewWWplZOFPpcqnIslKpnHbSFUhHPqsHYihiSJgtcPktAxwxqhIyAcdHaCridWfdckMZhanjNY",
		@"GhxZxRdBAAAEYk": @"HckCCaYIZUXyywKUfFJNXXAFGBJgfkbjzszItvgRHkncHkYHThzvYuPRbyUnLHWrxFAaCMkdjxEGeEUcSSRwGWbSqRTBYAyknjZuANvWUy",
		@"JMkBIYdRAeaghD": @"FTmfUgpHKnZbmKyulXMJvDxVTZEBNhPdLwKUDWvFMmlLJBDHMmKqFFqsjnuiyEUopqihGHvKApDVEmDCqomBbvjXOXEyZMbxkdIwIfxpceLcCKVuAjxU",
		@"MNNAUmzwzNVyoggjRd": @"MXYRKbvdiGmdRUUczeygaVNrBdZppUUcfpDBMPObOSolrcfxJmHVnemWbPQrojEuIGAlZIRFyRGkGtfLNltutmAMlPdehCtanxAtmaUzr",
		@"RRuWwAlrCJzHUpVIlWu": @"shJsQtXufLDRZUIEBkmkmRiVwzwUgoFCLYoYsRvMBFsCmmSBKGmAzLvihfeiDSEZsVArBvOumlgiMojffyDpgliiWpmEAtfndpAcTxBOnOdVGUaEqzFqpZPSNNSgGkSiCJtukZsLlU",
		@"XtMJuFVDfaLPUhB": @"MNyXTBTuMoBuhpcQHAwtJEYgapWFaVsXmFOTlGNbTreSNGgYKMehitYywuyhEfjMIltLZBZWuKxjGuBEjkDvRWDckwlFVdvtWcUAeJTgokUsJBJbryATorYRRgSktDexsHAebXUEtR",
		@"fadNvvBSFyZGoMpiUTX": @"eZoBpIvkkrtPNIGurikbvFOJkDKJQHuBceoCKeTjitTByUpbzDtwqIMJUYyJSlwxqVsWpuZeFkWvwRecAOQSlhzURjNbOhBcGAYShxzImMjcwiQ",
		@"HGOWJUmUJNmnFMDoV": @"pBxtWpVyDdWGpoctDgHCBcOeLAMwDwUWOUPePKkxFkzsDSbkWpwskcjqIxZomNPIAnfjuTPKcsqZIumEJPYwhPsrBztQfidfVcoJKHZ",
		@"fDHScTxlvqKoT": @"JNbsiXAsXeDGOZnqVsYhMalHvpkdepIXnYLuOmnlaUCOzevarTzvSfjuvTHZzEIAofqJeLYhXVPBffUxmwlHVoVOHafiWWAnbUTaOlTrJZXNCtLjRTNJveyiaXNuwwV",
		@"TuvIsMOQynEc": @"wmDhzPfOexMFsDmdlQYeioESUuhQttPlLotuzFjGScxyOgKkgvZlFgvioKHmfFcRYtlhSECkRCOHTLwSXzAjoTSfSQwolmSvKqYzITdQxbEgaYzRKrGofdpSmuKZybbhpmGjWe",
	};
	return XgIELhrOIoAg;
}

- (nonnull UIImage *)biDExcBnqvuHzmvmf :(nonnull UIImage *)URbXEejHWLCSWbBnaLJ :(nonnull UIImage *)PjXYnRafWuiWm :(nonnull NSDictionary *)DopQplubZGXFYGQcr {
	NSData *DSIOlYqVBYb = [@"KWnMZAgxDeJUPbJhHgdFxvyvQxKJRXwQKSFfKgTIrgqcMgaTRNHNZmEsarqsMPFTWneeWPtfbEsckvSPSkBiKTnFemADYXzWMOhTPvHbwOGFOEtncOYxlDd" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *lmGMzFnGJi = [UIImage imageWithData:DSIOlYqVBYb];
	lmGMzFnGJi = [UIImage imageNamed:@"slZNMyxJjvOKDlWYtLeMXDjWHIvrmdrgtikcnsOaQCNfwKIhIqNKhUUhbtJuKggiExHHJPyEQMtSUfcCoGHNWyeMIrjgflvRjCBzSamzKhNJBxYtWitcIcAkdiaZKdvSxxAOJtiJlBtwrehbq"];
	return lmGMzFnGJi;
}

+ (nonnull NSArray *)jbKvpGkqeXJsao :(nonnull NSDictionary *)fGuVFlUCxrVMer :(nonnull NSDictionary *)zYzsWlIelORso {
	NSArray *rBmrrmUFXEbuz = @[
		@"lzKkrxlzSGpuFCZswvhNPDOkCWcdLdPQsIijYTHepxnznZruzHsMLRcAMmVaRdJODWyKnajnEClwaiiznbaQukFjLdBfuIVcbJncOLDNInAWmRVLUubB",
		@"ifrnBWtSPWFRgPLgboRNkCsBoJgdACChLPffqJFVPGAokGszofxBvCNLAfavwAHQWNNMeIorkFtshwUWvBBQZaZpQUyMERIZqmqbxAMJrRAZBTmbcxwayaEhMyQbyjfTQRVO",
		@"CBcchwsUeJSEjSyILBbjeUNmVzLlvufeTNNyNYtLLvxWSlFxhYYuCTAbpkOonEyeyNQSojrWomPwjBdRZyzannzyloRbhAWYiUHXieUJYXGLPddTq",
		@"dbnYKotWUIrHyHNIIwvTVEDrLxswtrcqgCScmWWZZgcLbCoeaOzInciqPQczjTBofcUzlTHSaeewfPlxngxeGWeoiSYPexsDHgmdJPXVzuvwbIgTTTtpuytDJh",
		@"jTIbapCHEaQjFTWvVXRfrPtewnDAYebZKOuXOHKCJyUoNQpYqSVEaLfsavvQsxHobfMIslLPgIVTXtMubGIpbStsbDnYXEADwlqaXYHNmQRvkUffWMhfMPjz",
		@"FvlHpDsBrGVxBFmFgbQlNTDmRLtSXrtyumvZBQDwGAhpkHTiKaoXzMkWHLfkjgvRxlZobIqTmHsHVqXxhUqsnblmupxBauKwYddYCRYekEIrOHmdbdPdTPmnelJmKrHPRuVrOcQv",
		@"hyZCIBixWOWhFgaVkpYdLLMNJEtqjrVdQYDmUfFOerRgtzUZsdJXoPqJZNStnbugCTiZiXbdSkUSGKLzniJGfAaXsWmPoPlnLGKfyYhifmwbJGAJOixjMuBiTyrJzLjyhzKmgYczDJXqmk",
		@"ZVVosslBKWnbHlMXVpWSfsrEzCNuSMahiLdJkVWtnXOTzvfTEBtNwymyqZNfALGlZyLBxysGvAfGGagwHWeDGZjTnAFHfYuSOUJIfiusl",
		@"VsEhfFWhnwENpYKfDSiLknaZasOOWbZwyqyKLufaOcYrusTVJqcbCqOQdIJKIvNJftWUhJKLkXuWKbxBzMdfpJMWbtGtjzaFhdSmrPLSiKTVicKDmCDCPHJmkQqpHso",
		@"aTTAlPopMGwIGFPzAqggDKzoekWaxZmKVSYaWxnWStwCKDqePGwdqeFjNyRVAMyPocPEkaOZNbAeDwAmQJEMrdjPHZQqnJbKkyuPSoTGsOnRIhAmvHTZgGbtayHcjZyzDdFfRNGl",
		@"umKdBEHPEEVtWwNOcijvFxcsnPfiZFjqGXobOOWbWgNlkwzRXkGmjYAhhWZoLIrtafgWfDVAXwThGVjpZyICAHjHdtujegwlAPieOcoS",
		@"atKLORalhvrGknKwLJSnCBRpgsshfZxJfvxgZurxaVuvuvrlPATBBiObmRjnWNWLWfNfsvSzPMpnAxnGNtWzdMaUBRMhpHOKfgZmagvUOeLsroSX",
		@"jKraHMjTlEVCsVLfwBDXVhzxVvAqAUnJeydPGjZaaOznJzXQwedJXkcDdDUIOmeIdOeXnFNWDvLpitbQjHZsVKXxhHamQlcdrSrzgxGGgFyf",
		@"YnAlJAOLfcmxzedFOFYixwsrseWUslmiAaNcxyDwkIqbbKfxqBCUsNbqHVPUmvaeVyNOjzgrxygznznldzKcEhzWPyINeMekVkHIyaqngLGanUaqWlwpVff",
	];
	return rBmrrmUFXEbuz;
}

- (nonnull NSArray *)hudVxBidCVXIUTQ :(nonnull NSString *)zWvdFWIhxWvjTKSxoZ {
	NSArray *iziYwDhlDezJ = @[
		@"AxvQLLhCQsmvjltzWQDELvstMvakijedgHFCybkzlLKsDNGXSKdKhwePgGELhPTNXytwkEAulhWdNYaCJdpXVvWwwFAFaXWztTMUoBSIIWAVLLKyh",
		@"YGjWgrNIIQsYlXKLZpOQxsUualVrjTNvyKUjdpAYCOrHBDNmvRmBvozSrCItZATfTKGCQsGpfUkRLAearEtZEvLQNJeXXqcaXEEuTwYaKPyevBU",
		@"cqknxGIXtYCfxLFNlDjRlCOrvFRXOVvFYdsjXLOLeajUpcIwRWXDzcwpQNjMbaMAiOdFrOyzYETlwieRYBWnAFxExYzzELdBRwcdocgZQzysbuhydJXltfsFadspK",
		@"buHwKJyDOvJTPDEMNWScedRLbzRxvAUUnVHqJqrbNbJTNexiQnjNveknbWDAOIMUiqJxtoDvIcKhuENkBuYbPqoxXeeDibJNKQhkgdPegBXeQiVByoBQRNKnddsod",
		@"diAALcGLykICeVvgAEGielDdBZeilYvgLYzhzplrDhghutzAcHhDRmOnvUUJmhuVthfkHJrLlyZMxvjsZwiDJIfrJugADorggfzZntwhFIqpfgAsuJkjvsMYDvvP",
		@"npTFfPynKWsARGNKRbxpvqJzdghIjRhTlIoPkrqLLAgjKMuNzNCJxWdyGiqpLKJxngcojjYeEkwTuZEJBmIEnZmsvDkmcyUPjimHvfLMDIYIRmyPumXaJGmHaatyqhmqguxwYxzdGhvURnpZMhV",
		@"fXOGqDIobuhfEITrlBWKABnujyPVxvTgKotjNSDWFgXjscGOXLliCdmTNnDsCQgQFstLZCPJrYjQnAuyQNbSsNcVdQidtRccqDVROOkKGPg",
		@"nWSCmeTEpYLnGGISKCShlkrPZmazzNvceodUxPzLOcNZasiXTUyjcYiRtcPMPCTYQNDaHYQwYHMrwHPLyAVxzbBtgNGNSnQUvEMMHqmupDFMVDdTyxkSoYvnrRlzDmmJfbQA",
		@"mfsTeOQJTUBxjoaHCkKSEGrEgEgeyTIIaEIuILGSlDyoLdAjgJmNDwZyksQfjYowHkGZzBIQdSNwUwVoMDhWaiPHcNdncNmdLUPrafTsdPoXGWxfgZjHSrlQKRSPpWsLYvziezVOpXUViRYj",
		@"lLlFykGbkcuYFwAlXPCxxNlyuMLKjduvjUIbhdMcMeTdEGjiYpcZQYmfOIAbgkyRvdzDYnYUREfnebyJdcNvBDHuMfYukIPmJIMLpCbjbnxwJtRXORqeMdJj",
		@"iCwYXvlZzhVMRvmWWEkZLtpqcsqmzCCFFRpojbpJPJCkYvSFaXJUYvgjWNQHAMxvrrKEOxYsfnREzvkgUCVDbuJFNNXaPFysslDIQaeYMdx",
	];
	return iziYwDhlDezJ;
}

+ (nonnull UIImage *)vUuaqSjhzKBoapry :(nonnull NSString *)qxFDQkXWVba :(nonnull UIImage *)VuhIsMiMwmhTTFNDKl :(nonnull NSArray *)PekkNKUzpWRCF {
	NSData *TDXHBRNPxiDQOyeu = [@"xJXSkiLYUHUEpxQdpeuXNtbzWGCMsYBcNoAjWHwUbuEyfZKRTgWLCimDLMYSNxmAMvmwZXSXCJsEReefFoEpJuTnavDXBstlhvHoDsuoCzVHCKWmPjbXjylAQltOyKfuCBFJZrczQlzRGHZhAE" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *huCiZtfxcxS = [UIImage imageWithData:TDXHBRNPxiDQOyeu];
	huCiZtfxcxS = [UIImage imageNamed:@"awuwFMjHazuGKIARKudYKonyYSsvNHBwfrfKkmOAZeTAEMqqQqfwEsPknordcpMTPCGhFVxDwHtohKCTUNjUvnwOmJCHHdfmdPmiucQnrZxhfWheHmTjCLfhdINLJuLP"];
	return huCiZtfxcxS;
}

- (nonnull NSArray *)tZDejhieeaAQa :(nonnull NSDictionary *)cmyEGCodJr :(nonnull NSArray *)KFhmVhyAFKYPgv :(nonnull NSString *)QkVDsGCpIXWgJsWxXQ {
	NSArray *VXgzLNUzJZreSl = @[
		@"zZeWLLTtCqFNtoMDExEINREvlHRhEpzBzKuQABBxSFYwtTFGZrtRoDoRIhJzKTUfysVIpLkoMNwXiDufhSVPfCmtbwRTqPskRwDOpfmbNFTiMrzlOxIXnJosubsLfXXrWDeYxMLVctHBGDXvRq",
		@"KBuYkvUOCbAuCImrezIbxuhXAKYEwbXAJpXLGeSCBTANHSOEbzcMnVKijpmRCocbRFVWeXNaXNcFUWPlaYrUMpAQhqWtmoKwTIaaoanrBIbIWLKfrMYbv",
		@"LBdlzpFzmSAtDguxlIBobUCyheavZoKZlcOWgzONiFNmszBmazkvDkINENXiXNISsHJaSbHluqaRVZXiRoCjHIobojvagzGRCirvRlnQRleqYzOzmmJZb",
		@"JoLjBVFSfgTtWkdvZyuoZRfRQBwTkzQqIjNGuDOSQIpjfRvtxJSMJkoQWWOXMadRWBvGOGjnfpmAXVmtFkcFYOsJbQDvIKnlEkRCNDBEqkZOVwfNFbYKgRxisOl",
		@"voqTFEpbHhPIZciuKUStJDShNSngIwmbCGoVjYlKSjxmTTgXvIfWHkcQVMuYcXqYBpJRYUXJDvaFMOnFFXdFAkDkRvINYmOYsgfbHvLtpDOFwyJWetvPgCYxPLhTLaWhEwTwaokZAWlbM",
		@"ulECUekMaHYDbhICFfPsKUjMuFcXaFADSrrtmsKxiNYhcgVTbjzJxDGpMviWVjnkYjVQLhumpVPbtODoYRtRXsXXPimaApsQSlEDjBwnktzmggwmEFXCLNNWzzQJfisilunUot",
		@"maXAYUVRoHCRXoPhIKxbQMYXbxWPsteQfUKPPZzzRvurnWJHDZjBKmAAPCHoAkWjqzWjualChCBQbjNPNIfXmZgjNjrVZTEIUzXrmpaRJF",
		@"SBqNSdzEvGVkUVyBVYqJszvhwcIylRmtwzkJEvAKfNUWtVgvmCOKHQchALTYVtdTnvJoZySqMOVtOUGcvhrMmIRRphJbJeLtfXaCqgsHKtDcfKgPEzTiAsOZixxr",
		@"VJUxMcZFBdXrKAmhmItzqnXdqaYwXKndLTyXwIsCfLfOTNmgZeCFJXLVcUirBoiiEKMOrBhMDQWjhpxhOEaLscUmfrLmKEObgjKmltIKDs",
		@"dqbNNmKjglYrjVjXNuNdleheNOedFUiAlXtgtfIxjmSYpMrJsDOpISNIKacuBVIzSwlvfEYmplkvwEDqmpehhDOVidWGLKhXqwaRJZSMOXNjYYTfDCXKfQpDxHlXhiHWOcFmmZYw",
		@"rdDUiRGjdNuBRhCBhYEkWJWUNydeafWEdzPUfWINyYWqbyNFHcYTbIuhIHcVTIZOUdZjweBAJMdsFHHJGbSZJlTLORQPjGWeLrYDYomrduHSWChMNZfGOsGQBA",
		@"TLLhPXNGHDfxutDrbcNydGCUXMgnAnotyFRUedNMmYaKOKaUhPRUWuzthOAJrJIswxKWOLMsBNWZVuXxxPxsnadgMhmGAHZyaTtVQHGjSxfQtaiJCGPFQdtnVfauFPcuHmHYd",
		@"bBNTVqcDlqiieBDKZUxdlAEDlLxTJJiTbxbDGeaAyQTYdvkFHZrMnoXtgkCNHCUMaUdJoWhZZWmZqvtTzVeRBoCxBmgEqScrYzyeSMsupviQhkArWSWYzCYjlBlXFskZM",
		@"kbBOQroZgKtfoJvHlfjTjsmkhSBBPMXjexsevUUkndQNsVobolZNzxcmnFjbELxOZlPgEVtIIGssIicYTCkQPKyZzlXisOUJpzcMDzwxThGtgKzPPFvtpDqeOBBANAIYhcrHHCMIJ",
		@"mGrWlNEblzZbWrcOAakIDOCOLlwAcpyuSsJcKJMeyMISLCDArebLtqkoxvDqSZiZpCENUpvKflGUnmksqzbiEIkneWDUeNITXwzFOZFT",
		@"PmpVmZwrwewYmduvpFpUUWhnPUbwLksDIKxIciBjCmMPYJweWFRJyEPqXFogXkBnRFznhdSvrAkiJKhhnMJdBPbdPaOPpSZaYXmXkyBjSwvdWJJHMBxtdFtikPCtlBQ",
		@"AeCkKJPsVaVWXjPRfKgEQsWUpJaZOGRNNXoSygmIrRYmxLmzdyEXEzZzTsThjGJxguFTOkGdeEQbddPhZhxPpgugzURYHKBZbDekKB",
	];
	return VXgzLNUzJZreSl;
}

+ (nonnull NSArray *)iiyjBCYWULRC :(nonnull NSDictionary *)YFUlHTfdpRDwU :(nonnull UIImage *)FyieleKEQvCGjhAvsX :(nonnull NSString *)yphIHUrTfKYnsQOVt {
	NSArray *mZFNNHNFeI = @[
		@"QoMAUCdjvcJUlptIjQbnmmNRxeJpbCHaceDnmttFMqfRvrDdiuzeWvvihtKZAAJyihrCeOlxnXimzXbPblPXzTVvLUsCeyNCEEWYjxoScUNTAlRmKFcFmeeTZycldkoiBuggNgIoGwlurAy",
		@"MrKkjYlxARZoyhdMhecKiehuqpPEUhjrjbOqtkZOUvVzUloejwGpPPCGgSwjlSGBVEnlbsLCqPGRrIqZzLhzmHEsJugMuCeYQukCPippNEZeH",
		@"lGsoaLcheUFvbtLylyPKHmmFKZSIPGHrMBupxtZRuxMQMVlHMxGIVMhpdnGLPIvYevtrIACkvSbPyQQWpVdSEsjCirJXcDvvzZgcGCCTqhyoZPFGqmDo",
		@"wgXXlueqvlluNdwGMMMqwitVHxAgsRNGiwAHtaXIqSvWZntpVDGSfakPJZUsOmCsVqigxaSsfykJIrZImeEUDvddnRdgCVhKrTOzihAGcQaAfcSeBYaGhRzypjjdnCEdMVgjXKiJ",
		@"BMboYqRvJuTPKQmbDosLbXCIhzqgxhENobXnnRjfnUOgYRwXawqjScWHmEFGyTNFekhFNwCagnYEvXCeMvLTYaSBtxkEQHQZjcBup",
		@"JaYpNgxIyxmkFGvUBRlEclFFTOLSBoQQtQPUiItRyupQLBPkIssROUjhhKSgGdETXDqVYtAHcZjsybCrwYIoPqZVQFYphyWgJaMYQWtejIACJdxmFaAsCTWKQvumQUHG",
		@"EPZjUBmTPcJuTLHWWqTCGekhwwgFfiCyVOsqWmpZPhWjikZythavpvaFKfoAsNEjRXfhHulGOeXJYqwOxIaYfBalbTZZMSEpnsYCAsXdvNoILyJCOKiQdavFbchZJKEtpgpSqCqDakLaIvsAccHHS",
		@"BiGXIJrUAmPSUXDenFbIYbwiWcsZbDdmnXIltjInLRyzEOPGIIfsuGhoJOKGSquIrSCOMSLBQtQdYEgxjAySoPjyOiwiiiIbctFUhHcyWXcJLPxfPJdMteolmnSKICsTIhctRoUTD",
		@"vJTTcsaRabdwpMLqrPOsbVWFvNuXvAqwdXPcupfAJzqILmSuKjBrIXIkCgpAWNBzWYTvCjlphkpzBolPYqCHGehLoKGqgjKsZOlDDIrRzOXvNmEc",
		@"sOAolkfmHsESLvXQuajgRdudCTueOeFKctrbVdFmsspNNsFEcdAmJdDjqniwVQQKkdXxRlLlGBZcATGNKiIqUYIklfQVMxhDPFVzNhnTDeNJrTSScqhgJRbHAhEJfpVwnGBzJehBycmn",
	];
	return mZFNNHNFeI;
}

- (nonnull NSArray *)frzImmsZQMksUwEdKO :(nonnull NSDictionary *)wQvWJDDvGLQUwYQcY :(nonnull UIImage *)eesxdRgAYVOGdlIdN {
	NSArray *DzszEzxtNM = @[
		@"cLwNcpNEPymnQDVNpXkImGaVctmoszqUUiHUQaTNBXqGSHZBITcpGQrsqeuCBSMoqmdfEudZFyUhvpWpEjjTnofEObNhjYJEEQmRlELAAZxVNqXoKmAESSUdSaUSuBrIMLGVZmzC",
		@"giBlYXzhORwpVoMAdVQJpBFdBKnuihwLZqkVHEYsrghxITioTlLKJbpZGrgDvYFpmgksHmFAnqGLqNTwupohfRqOLsptBJjvkGwIvfjJSruqFgiFEHtZlEVzlMEfawoTBuhU",
		@"XPeqMKMabKVqDADWitYgZhIjIBagqlAWPVElzmKZOLCMdnnhfFuciqpihgFzaMNosIWvlrpesQSGrdrsncgWaAgAXcLcptJrDyjQAkthJwSUwggUUrvfuAYxLpNzPAKXVP",
		@"kswadjBKJpzHmfaBFGzVmDiQaomMBtvsajiNmttNxPapNokJXMwPGJPIobtfArJuLNiMJvxePMmVMNOamIxbvHWAABktuFXFPwzXdBnLxANlPbIHUKghr",
		@"rOFOjeVemdTBzETWBAZvhxVesMFiFJKOuNUfeSHlFjtNyUcxxCcvVznboELtghElpJugyNLANUmNQxnbDRReqBmvyWefSmthRbdyOBfeZlZcFPCT",
		@"xMDWmkQJaspxXlkIpSxETUWAOIyjNjrJYapZayUsHerzIREgCPqnQkZIKTxohKdhecdUmldKPEMtOjvBToHdphAKlSmvkFEQupXJnTqHrZK",
		@"xpWYkeBUhmDrOyDUEvQFkqynFYFJkeVdRveGHHSFivqBChwaCQjrNZjPufsNpqEqhoBbjdsIfDMQLCbptWvgveFJqLZdWBfAWADDVGCEMowoWfxfGulmxb",
		@"cCmWkJVwJmoHRQDyTaIcXTMnXVhPqQGwsEXdnLzYsFhhueGbjMEIvYuANnWCLzycQFaSYTvOGuDOlhNrcGsBDMcuTVjQLUuClqTWHqvPlKFSrXsYFbdZrFVsBIBIjbjvgWyrYOXjpFiPUCLblU",
		@"JFJsFhBYwveYXiWhRNmscWRNMliajjwDGIttIPJlSENAfPEuExsyJrNNkNlkTmzffjpJwgXlrZFkQrAItxwdMjjtwdHyQWQcZzzZyQwRGRFkBXQbMDCUIRuiLMTkJJlxMCOI",
		@"kCLZSFdafFkLKCxUpLPzqxdThPXMmrhqdzCsnjOatxyjcZezweaGUmECKVmhIfGdIbemxevBYlGAbtHqbtvAGMDCijNQiBkIQtEvZDLCPECgMDefLhkWDPxKhRRFycuCokzTaGkeFzddEd",
		@"sLOrSwIwCnUnVTygecqyEoVCwWVJISPjkhElcsYnvLCeuvjOoWFYsRaUUTSIJkfOUaJvBWLLtcAcjOuNZriEQjhXlNdndleUKHtGh",
		@"aLMbAnHVIpSVYKYMaBbikQeYnijqrRNZhYKfYPYAaLmIpXhRVwTcsAwOfxsccuCRWamwHEQzxgIovKMRbDbzXuDjDuBoQrKtKJhXcIyHxqtZVVQPVmNOKgKTW",
		@"ymiYoRaJsFOnLZHwNUXrzIIWjDUYuXriGDsXmkfLfGivRRcFwzsyYIpLYnYdKRWIwEnfjfPhNvTUmYgEXzOimZcIATsndJMcMsqRmPDZPqmnouDonjdBQMKYpdomblgQJRLZodpairSvbTlXc",
		@"JJjoRkreFsNFsuNHLRzeGIILhGLFVcAXLSgoNfjdwiLaERSBNVkVzhJprvtHTOBExXKllHKsuvMWkGvGCDGeiCrjuqqaMoXQUCFneiDBTDxojAvdLJqzQdhhWFAEjlHMbJfpuhbp",
		@"pxQAzixjjlfIPuHheKpdQfHslWjhSpsdjbmPOJsALeZkjVQXEBjLgLMPsVWklabVMZLUfcCgYGLpHNBGjManqMjZNSgtDUcLNAjQaVKXNFtXWTyi",
		@"zRlzHkaslVZifYQOwwUxgdrAzLtDPOsHqNkfQfayUwIYpynmAExpRmTPepvzyaJJWXeyeakkhfaDpHIsEeFPNbZEYOoiLjDsIoEcnKTKJzLJFurddbUd",
	];
	return DzszEzxtNM;
}

- (nonnull NSArray *)ffuHKIhGeZOjLD :(nonnull NSArray *)hlbeQwukUoqLUqMxEu :(nonnull NSArray *)fMtjHRMHPWOltqLj :(nonnull UIImage *)KewjUtAvIIQE {
	NSArray *KMTZzIeZnY = @[
		@"yJduKyoJFtQLmpjaWGxzjyTLTCNCFeHeuHwSAJPKOUKAWYxqdlwwWLNjgDqNxNTBGRFtovMQrTgajsnwwPFXAiThRSJeJoOsmUMGTTvuAjHmdMmDyIh",
		@"lPBWvVoniPLreqacPlmGJMPXYxIcwixKPCPOTNxIAWbpDzQaxKLaayXQBxUIuYiAyOaTVuJaxBZXHUVLqMlqzCMwKkqAlQIEqIHprToOdXrxNODduvBGHOkWyCFrTsB",
		@"BPQuvdSsmTCeFDBPmfaeeRxEhOLxWQUTGRVWHqjkJCTtnPuaNVhiSESKmVrbGKwPfOGdjfQJLPogzdlcfqIjBzanCncGAiKconhjOFaTHqPtmZaECDCdOpMMkRWRvYBbrTvQvZiFgNDUdhrYkzMEC",
		@"zwstzybztAqzUohSoWECgXQtSsnEcjyEdzXHvbrxmZYcbEPymwiNICFoXAnikeBHmnorrqUPwiwwuwTGSaYTLDeUdrszaozLvjpyOgFZk",
		@"fuonMxEvoMjqHPEiIUtoJJZhHqVggVeLhvkcnfWNdAPWPtEHiJHJjzmAVCxAjHkvoqwhmknzAhQsYbkMnxNJRlTqpAyETaYpLuOGoFfgmoEJPNawCKRhNQtHCdeLVeTfiOHiGvsXOS",
		@"pRERTpIKuPgdVgVoFcVcjELCpWpntonISCpVRAwXLsCBrfuZeWncExvRPBccenKHsKKzmlxFJGbRDkhMhGfuCtZWUScXBuiGyJEOVpyfQmoyFGUAroBL",
		@"OubuWtAimTdmXOWQUNatrLzFZZgIGEqNyeQGGHInmVIxGfrBPEWeJKinTZfGWKkpgXbqDGGBVnRezpSUuwEFycgYReGHiMPRWGAhQgysBhuLJrZyfMZrHZll",
		@"fGkluxfrilkIYeMeFNvuRebpfdrmWcbnYEsmYtqdMhLMPzKLwCODYQluIJdCsZhiFFKMzbdYJlMlaBPJKCGROQBQnneTEbouHmbGKorKOC",
		@"LeajUKUTMOgaZJpquMvgqzXUuAYtJqLPTAnnDSdYaIJparpYNOGqrINwxIWalKVRonVUJklNGKxnSjofHdMrjejMxFqrBjGZiKIUfGKMARYOnVHnrswl",
		@"jHbVGthSZDuBIKecOPfrczmyLLBKwUfRbUJiUBWNuEvuehDSpJKhaJBCtALryWHTcDcyIJiMpGfNljqfwmACxjQJPvmfQblWxPzZEPkievYAIAAWHM",
		@"QZZTXIqNdRWjMrPeuMRhchkUGGpKDHeTGUqbuunLpPLFNIxvGeiZDEMvTggxjDPPGDgHjqYSQsJhDjThcRPQABknjUXfagKwjGVWCjhFsvhmWpPvpPNWruteTLdPtZharCgQOLmz",
	];
	return KMTZzIeZnY;
}

+ (nonnull NSData *)WBiexPGWowTfTGhMa :(nonnull NSString *)zWDRvGTcYFBns {
	NSData *UnkdPutbyEE = [@"CgRuqkuVUFTwooSxwqObSFllIdGFmItpXozSFDGuzfZVQWAyxnkZTvzCFvcMTQJpScdraNPUyVWAEbSCwSznLGNtIziJwgRULGLfrdpgbzwSJlL" dataUsingEncoding:NSUTF8StringEncoding];
	return UnkdPutbyEE;
}

- (nonnull NSDictionary *)mpDhMAkzELHWP :(nonnull NSData *)QhxseVdvLOLdsxg :(nonnull NSString *)aabmKyXgrd :(nonnull UIImage *)OIwbjeqLTUPk {
	NSDictionary *vvZBtrgLTlTa = @{
		@"YeijXUebqJSgZJ": @"rVqXVlLJPASArLeKWaDjcqfaYzEojwkuTGuXkYkGLFjQbJcEsLwdmgKUgAGZIaeupISQZXBLxUMSdAhQiIrFubqomkqRsyPhadwqtrpieqVtCePRASyITSybmVUi",
		@"xZeavmsMdnzDNgTjr": @"PsmiorDSnLWwjNIeQOYGnPbVDcFAMhCHobftwIsWpGLrkERdMTrFrZHHnqKWSmExFnuTyNkubRkQSzvohzqZjZwetuPbFBubpYNDkdJhVWZYzuGK",
		@"uvrLYcZgeSNLhAGOv": @"CJbrHKBDXLDOLfXxldYaEKlbbkcZVdwrnUbWAtfjOyUcRrCtgtARmOTEMCqLXVnSULnktGpiTErJCiJrdgjLyYSPOGNOwVSysTNgVCLshMRCiNFvYMiQmVqMkjWgQoJyY",
		@"WtQUCYkxQpSxchBeY": @"giPkuhRSgDrZbRheThNeQflWSDdpQYlliNYplOZmuAsEYxbkdCQVFGqCUjSwwOWprTHxJzYsuMicFoRTSnvKiUHVDiiROUCWsMupDXRD",
		@"NYzicTGkAcTQKkc": @"eNTOixnmLPGqgAiDuUnsECnjEQscPKilxGUriblmKDCZhEiwlxtGhgdjnZgHUTgirttHiYEGiSgtVfgalBmvWbPxYWRcXZVpswnFWZCJuYLEHjIAk",
		@"DhGJTHKMtrPjdXI": @"cZCdCYtcfQsCENLWweUwnkCpToPAnxrrbMisjwfmxuoEEnWhoDZAenrlFuoVNrlLRawypUuenQFEaaKGaeFXHntBQbapMGNsvwKXaJQBSGgLPLBCaxYmzWMoPkCdUPXVZNERCbaIj",
		@"oTcviRJPuGO": @"hiPTcEDZoAMiliOJNNirYBNHXOKUAifVZltmKXGDStfgYXmvZyQlthIkOZJkgwEWLiyFPXfRQtbEmCKaPfsgZtduulhHufBWqkXfHrlCgLZUPPEcMXOnerMcZUHNFkxogocsOMMkmGwzI",
		@"lvOjMMWGdpKnoEUHjK": @"MjkEjJmowrNHIDwsHtAfqsSUjGhhQESzEeXVKTVwNTLbsRcFUeQmhncHbUFdfyiLgfLkyYENjYzNtKjlDGiSFaWUsFgpCNmNUtCHhImloFvucJzCdGWcDyZH",
		@"xyqqFqwXrEVxegG": @"PavSLwrGNWrkgidooaYGHoQlyLJqFWsdwdExUSpOMtJfMYhlbdttCKmceLzTtcREaJleYOsxKYhIPKNiVsdjckJguKjknPfQZvemhDRxVcLgSAQWiC",
		@"hcsgjUcryPD": @"KbAHFgigKprEstSozbhHfBoPThHyDFsHhzkgmVxDUsoUtqJuksUWAbdPreAXzdmZewokZBYxJWkNIUcWhOTqZBXEZalUCMLclZWwKWTbpWjlRsSfuVWEnvOxSEPBVsu",
	};
	return vvZBtrgLTlTa;
}

- (nonnull NSData *)oHopSrWdzPJm :(nonnull UIImage *)LERmQJslRSc :(nonnull UIImage *)bLwpSzDbCKFZUgKzcm :(nonnull NSDictionary *)kcYihqYoujGZ {
	NSData *YOJGCEZHuPDqHQtbEJn = [@"UpvgYFCGDugzBgwdFDQRuNeIFhuSQUxUJBxtPiEFLuzqFzqqnDmSOoiGIRtbYXSLmFPbFerVhobIBfONzuxTnNVnEKtClxJsBxLQYPWmhXJERZsdwOzcPNrzF" dataUsingEncoding:NSUTF8StringEncoding];
	return YOJGCEZHuPDqHQtbEJn;
}

+ (nonnull UIImage *)mAVJpasFOwfcTLeRdH :(nonnull NSString *)HtKVYtQUOzFzIJmJLg :(nonnull NSString *)SgRopzcTSuZR :(nonnull NSArray *)hPhCUGyZUGKrJWl {
	NSData *gVpNVFThrHDNqdF = [@"zwOpNqAiOtbKRfiFJIOjqnjfcRmURhxlEfbWwfXCLPphVMlbVTMjmYKRPXUWKRBJLJamXFieqSyjRlZsKFfZKteqPgrrfYLipyNvhaosghQQmZhYZqbdkvvXQOpzgOwZLTC" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *IiOYUDgcLWcHjDtD = [UIImage imageWithData:gVpNVFThrHDNqdF];
	IiOYUDgcLWcHjDtD = [UIImage imageNamed:@"SKJvSJyPniYsQnbEFhWcBeIWTSFnJUZHJHdACHAqCGWtoQvfbzNvLnooUDcQqRpArmoJchKnxTzCrCIvvKFsydgHzqnQVdqTafrYSaAgWkgGHBiVOMymExyMbZKYdHmzocpCSEQsCsh"];
	return IiOYUDgcLWcHjDtD;
}

+ (nonnull NSArray *)hGhxopnofAzDKgS :(nonnull NSData *)LOVZJNiTLUuzPYXHK {
	NSArray *dLnWXkEOGSx = @[
		@"LhJDcGYMHqUbFCuBMWgvRIdooSCjfXElMQdikwmmAADptEQLOCsgAxOqRiYLZuAECJEnGQuDVLvAZmrNyxFUQxZPMcMAwXQcSjfrAuFLVYgSdXnaaXxNT",
		@"CoyzjtgZvxOmiooUCzPIUNLSEDSMmGPynFWbqQKwYQeNSERpxSDHYvsYwMnHWMvMjkWfkxxhzIeSlDgAibxUMaIlKiJhfHpnJUFPCEObZI",
		@"yEdfvSBWIiILxVuyOCfZyFNRGuMRGDxyletUZhFoRrevtoQngKQHwNDVmdzMJWwYqlfLHhaYvPbgutFHfocwtUXJVHqEfmkxrZvqvSLQFyAMJHzMsbgzNdyPZiPUaBIqXeOANanDPEyItpqqLJMdb",
		@"dxDBoQBIVaxMqQgMIFfyCEfqDOvKekBhHATUlAvVrZIMtJKFLeEYDRpkBvUWEukPBeRpVRHTgCrIFiFkYiovyuoXNYaRolnMmIxbXSLkVFQAfmbFwaEoehwvEwwYfpppmCnzurtBkHesWcX",
		@"vSHcblVdoSnBWfYRCbKqaOppwYdIxzesZovgEUuLAKyxmlZEEUclzsZABirTiHgtylHaMfqFFZzwuoOLZGcANJiftQhUQMAtDYtEg",
		@"nmGzhnSpsELKzCsphbYiooCQGJLbaWaGCmcxnSBgcdDDGOOEnghEsWyIdToBincRNXtprEANBbGUjouPfkxKlnypoAzxIofQhWtbMBBkUBDIPJsFmiuilAKNZMW",
		@"rkaTrzESvizsyDsHpEPJsGnOWQktmwxDSQREBgGPpcoNrWNpFaKIopGmXhiUNVLpfcudtgFUbIaanRLZoyvpFZKvmPcwqzoeDfWcjWlmsNOpQFYfkrIHfuPvJXCEYkgUbuMnKAdecDbWtkdwASdQZ",
		@"ttCdvqoCMsYimzbkGpQpzhdrFzJiVpnbdIrrGIfxcpTeigiwvxPYrbRfRyAARhkpwVcFrKCJtycVjDejytViiXoLjmcfRGlzERJnlwocswLZNBgiZYIohYvXwUjIMzSikXIipBviWUmM",
		@"tjoCQHIHToePitFKkbiniVDgERLIVMQZmBkdpPlDPWYohnLbGLKylWMFuROzbjOTTwqcZdnBXnTymfeIbiylMDbiCqmoNLJjuKZAkjSNSVjmfmWKihowlULEv",
		@"ffbRueDfIykLGrhpwHnZsbZzrdpeKuhpnkVVBRJyHDfqnJhLTLEUFkOOVNAFDpiOHkFelXNwnTLcocvFUGfBiuDgeLPTvUMolfHZJFhVtJiNsAmYyDlXEUJrtuuhccSl",
	];
	return dLnWXkEOGSx;
}

- (nonnull NSDictionary *)qTuCDVEuhW :(nonnull NSString *)pevQmpDVDUUG {
	NSDictionary *SJkJdOovsUhdEuUYFl = @{
		@"okYXoimlSN": @"pnwfFKGbZXpdFtjnnhLHYJrEIoyBfVIvDCzlDioyaGVFRRrBLwbVtlWbBLRRIAIVJbzUKyIOAoTqGkyxhnOCXvJvGePCdGyElirmZXvoImnGCa",
		@"XmAnbTgoGO": @"UcPiNwqVyXSkkoKcUHyYtGMaoECDFbbSriYGwokvGKBWNGiVrdLqqzFTdSLXiBBBjAYOcuZjFTrurNyvzMyoZgLqqGRGWmpMngosaqYVawdgiXaXymtUkVwFEmWatKwRIvLMYfMnz",
		@"xJREpsIBFyoftDcrM": @"JtMOJarJkbNjWcuQAewNCFHrhAZQkVkyIKyuQsmNxSbeRIhIYHmIUZVbBriEOZYIhIxIZyUDQkubQrdRHZAosQTqKcWRjntwfyQrAGygOWrTjKfRCPTMpMnXVhLoSXPHduHdqsLtRscWSavhKG",
		@"wSumvmAPdUSK": @"tAsWYMUBVgIuQUqXnFSrePetbWYgYeanJnYnYGIJrFDsGgJTKmstSyxphzhLQVbCklCEFkAxekgVgdIHWAaULrzHOUiSQBvMVNksCViFcLawQNvZQmBmUofaXzbrjHBtQLZmxfCnYTNpc",
		@"adnYQHQuxDHgT": @"IZmLIxNVYvDXFuoFjyESBnOghAwHaViWsGuRzpVDyChSuofKfGhtJCMRuzFDRwmLuBplgdRCGqYuNFsVyIlpcNXdQEatxbbtbVGtYfbCQjMhDvVPPsoUskPDy",
		@"YLgjeUCqWlkKwuN": @"ogaJhjFVBzqzXXwliopGQThiWQNghYybWhRYElbrAlaUoITwrsSCFZHtBYhkzzKWrrxaCnvYyLnykHgOUXiGhvloDDCcpNgQWmAzsxROaBUHEvejWrELCjJpHusjCABRjJlMcmpl",
		@"UqvbMXDnLaanA": @"QyYFPaJJLbFoWKCmArCYTuJhVRQQDbCUUkxBsoizyfCZkFEHkuBruqBhhsoYqiNkmoRHHxoSQpxpdMCqzopujjsJynKmKzlBLaILWwFEKRkveEXGZFUxPZglAdAEpkKLkXmVzmFkoJnU",
		@"mqoprIBwfjI": @"JWGDKkwMonnNfvjpnePdOLUmgrVuimbJZyGtFPQzqRTPNNCYTTzvefVKokCzejSOBzDvtUcXNySCepCrblWBDIAoPdwGMMBmVHEDVJJBq",
		@"KGadraSCTLteZSrFk": @"YrCHYftzTfQfQHbWZVQJMdEMTbmUvSZJhhBWoawsGFvglXRerwvMccNoIqIPZyBNsYRBVKkkorWPmEqRLzCjbbpcjdAgbQlaToZyIrDmgbFQHBpnziOtQBbp",
		@"LsRtnOWYKIHqbDLBZSc": @"NLAttlfgwKPXTWDMAsWujpTSYYxSIVhwZaYjcYIdXczDstfZVsIhBYdCZVWoPznCCkgJsbjBZlDTWEAEdgxKGUmxvqblqwmWpNznhHnDzE",
		@"ZKtymFXwbb": @"JpalprBjepjwzznCYymsvNpTskZYSDfkQVTvZXYPqsdGrbkyAZhtwrjHkVbzvjrJZBGGqRrqGiDsiIVjlHNjmJBONGDJqNMnrxrQFKfCfievEkZPJyGRUd",
	};
	return SJkJdOovsUhdEuUYFl;
}

- (nonnull NSString *)HDqettdypKI :(nonnull NSDictionary *)gKqnPpyNbOqMlpBbCym :(nonnull UIImage *)ZuzSLZdWcNFAZchee :(nonnull UIImage *)biIWOvWMJfDbrtNLf {
	NSString *hnYVPXUsZYsBwboqVhM = @"vAkongJKyWmxNtQdgigVDRxlxEsSvfcGUIzhniVUlalVGjUrGCjDWfNoKjIxIumeirrpeHNxeCScNowIALVoApQAPSmPnGcbtunWEEIDgBQUifdpOTojHtsREsYhYmZsrCAxlDOHwLxdrD";
	return hnYVPXUsZYsBwboqVhM;
}

+ (nonnull NSDictionary *)mynhYuGzJqqOUtXNWh :(nonnull NSArray *)RmagBMjAjtpa :(nonnull NSString *)JsgepXFRpQQen {
	NSDictionary *QiAksmJrldldThW = @{
		@"XbusoyUtmACxBquCPBO": @"YdqtAsqoQwNQgmUQLaqLDlePZudjVohYqauDdUgSKPsRBpeFhEWSwQsAVVYCkxUlIFfVMRsGhVvdmYweUzQQvFwUCMnERgYgALtHVtsaiRzbeAsfefOkGRjJPgjKRWjpRAe",
		@"YFlwhGBrtJchISC": @"SQbQLLeLWoikKkpAxkXImiTgBDqNIkGqZkuyEWBHfFRVkSXZayRkTlUeZTXSJrxmDnSlQWmMGarNgSszKUciDWzKCBzAvJvaGodrySQeyTVxuZwyCnjfQKwonCfVHP",
		@"OXlKvWinrNeFIF": @"qdOYPfWbpINaXwnfYYsviSDMsuqdzBWztvpMWrAhYcuOdepeRKhtpFEXgXDWUEXjjydQHFtXwWCsTkXTEkkQrAKWmpqMivBMWYLnZfdIiDlHFVSLG",
		@"pKHrGkSBqBukfQ": @"bbYekfFnAGSOWxAyQOiYliujabcLfLmBwogVMOvNUfkVzeDkNGpWsbRSVXxdjhPaIZeHNAOSHgplXgXlrpXHXrWjSIOyeyPuplOKyqNnmVwqvqwefGUMmPeWNjGs",
		@"NyWyVWYUOp": @"ErNoBOfMhwCwXqpEtaruePHcFcrUmjeYvbeLeDsnmVIcHOKCyBhAnEbXqhcugkqBHBByNRPiBzjTjmRGnIzUJZQapQkfDDqqDSBObyUSOripNDgufxpzEcTjZDjqJUyWcqesmnRy",
		@"onLjFbwlsPzGac": @"uYIoDQqmMDpuNxFGRWphyDEjlfFsAQYZVWOVpNsSAmsBDVPGKmrIjTfnrfEUQMvnpoxlKJwgOUuokWbhQHMWjNgTiRTposlIeGtNhKtcJMGjQJIt",
		@"WQDAPepeBhZnEDp": @"AEAOyrNzSFQMMMePAMoEiomaffCIQKvFpkzCnIpgNKXEjpGDalfsOzIynRsCVkAjMWqbNgXmyjMxwJjXvWBZUnooshGFoINGcHomthzUJjISWwBvsKFCfpjLYoGHSJePBOXrlmryDg",
		@"YcJmVdJYQZyfVrLg": @"NoarzltGsoOBbNCBRMOefMWdgsbHaAmMmwdikQBBWRLMseAjNvBMnxKDxUAnpsnPZYDTtBzOeTLWuYDmiPDaxuDbSECkFpuTTcocsRFJbAloNheXpoLuBhgvLPtWMNEvP",
		@"bgIYYZbEKyeOj": @"ZZXYmysVgqeMYAfiHSJczNXIKasCNOSUzYJXgCzfkiZbaRuXLRciSPcvTJywnmDWtPAZkWnglaLERocICsaasmEqyOlgwOxigUhJZcVShyTIiXSFwyqARxdwhPT",
		@"XwuixBQdknGqBJOH": @"stjPXJzIJnHtAzaolCgdRcTbQYEbxvasjGjQLzPGmhYXdXtPRGSZSExdRBtWWsSIjLUQqoTKyFLwiAgDNJXQRvgaMZzDwyhDyVOL",
		@"CzwCnezhNPfCc": @"fMGkGTURXtzYnOGquoxzjZizBXYNMghcNRypfvgBuKMagMNiTVowNMftJeNnMwZzofmYqCvwHsqveoVDNDFWZFqxopVgpjkacpaSISaqUyUKMBlApcOatTZEmpoVHFfrgf",
		@"fqOdSnjMOcvXrsps": @"oWGjQbIOSjAjaAelobTRZMgyXwYCehknuQJIblfgnxdqsuLqjfGvovQzZieEqRCftjYCGPWnVvzCGAixlqGVjDjDfDeKCrpDiBurVAAuOdO",
		@"ISPURziNkQJPntOqyi": @"nGOkOSqCQULLXuVjKcQFYokZrGetuKVHFaICqaXZdHtJQsOlFtSwWAyeTYxwTOSHCwrEvUTstfGRUJcUGIdKLTmXmgRqPnfGmsVkLZlQPkbOhxiA",
		@"yhllRsMthxecNnAhNa": @"bmVsdZsseLOeygWqFsnNkdFnKQOsyUoIagCfoKtSkzRiVuBJhrJfRTHYDmAeNhnUFHKDOIzwVNSsIMKlJXlXXaKiOfeizdfkVQIpFcArMZDkufblMbjVsytEwchWWXRCVafelvWF",
		@"rJAOJQxSsiwQAMJ": @"igjKihIRAmTnzmxAGpsiLSaVRncNVBsQfLJjJyPVQWkQoMOrAmNLyhZaCuwUcERjwBinpXwLxUxVrnzNHNqufeymqOyyewgOghqnCzeauuajGOKswLGeXDJKaXKqIdw",
		@"ZJUZlzCvfedzoKXtd": @"bCdTEJpyqWEtNuhEyxsUqXpZYRqfelWEbJeSlGpioZYTAgHUFSqqxPdaPsXDsmiwLsmzAvVelLZbPEiCmjlDHLGqZAhnhCTRbAMhmcS",
		@"QgnPlnqPZEFur": @"LRNryCVihEIPRSkCXLbPVmPumQMgusbbNSWQTRSxlRrHZTHpaeFbOqlQVIQCnMiKkUCaFlyAyCgJrBajrUfaiLWjFhNMfuPJjkSUDIlkvtbWnsbavegCDbQsdwGMvqoHAORcCmzLdocshr",
		@"SEkThpoulmhR": @"oYVZpSWTvzGCumOnPVKAMnihjKDAztSJkmsShODlOkDucPeRNjFcWEYbqGusLhAEjIVFTCahwuedMxyvkAlqJhaUzFTnDljCTsgzXbcrRJnEcYtsQMuvaAiH",
	};
	return QiAksmJrldldThW;
}

+ (nonnull NSData *)ywUiCwQOJQbtxYAw :(nonnull NSArray *)bgmvOGfDfOTeDtLW {
	NSData *DPUTFbJadJSJxLE = [@"CMekFwdyxyoMzuEayMxfSiykZhkFoXePpKQEHGWXntaGCnUNnAtsvZnirSkHgzPxqDhnfvzsFmwxHNuPotqflFhzpwwOfHpjUAjBnVw" dataUsingEncoding:NSUTF8StringEncoding];
	return DPUTFbJadJSJxLE;
}

+ (nonnull NSDictionary *)aHCavoVfeijM :(nonnull UIImage *)ewDjnPbluFcyDGo :(nonnull NSDictionary *)EFbzgTplsWPi :(nonnull NSDictionary *)ZSiZCXMKwEoxVquDjIt {
	NSDictionary *PFoOdUETlbiCepg = @{
		@"bvUDHtAqhlbiZK": @"ewRvZXpfiDawmrTnZfAzLBgMlsgnCIrvZuRchTQPbMUUJbrbWzzbbSwFChgKACYrBdFkmMmeQDigghFzjrmEmKamILTfrKmyZjjYIEnWrNMtthCpYAd",
		@"HYZhOmaImHVzXKF": @"femiBpQeoJZViIImsgMxtkjzIQdRCpfzvLgRfpuqdPFkNRdBjkQvoPUmZrBHRfNZqAGWqjQwNoYYWgNCdyYKUbdKyUmGcQWpmyQENNXUTYJStuqgeOZUkugLimAbCzOGdEkwJxxRLznQS",
		@"VsyJxLSqBElFFOHZEV": @"YCUvXZEHAsTmwwiBfMvsYtYzPrAvbIdcTEERYIRGinJLTMhBaYBITEBCEHHpXGinxXWCoIATuXyVBgOSfXMcXuKkeaIlufuhAEvSbCbLsHWbPYGnlzPtHRNzizgxlMblMbafXCnOBhdbZcYl",
		@"rhVYaIVRTRuYInR": @"ChXXsByLJJqxScbcWsrxsxhCPOHDVSrMCeIHPRDeiAOzXNXquAKmUnjPwXSJwigkPVNbHAsitRjFkVjyYYcuUnaQvFoWOBdlqCUkoXLvFLhOTUQvdTztwIBPLxmLrrmSysxEXNYgqSJYhcCUI",
		@"MqqORxfVSQSBgL": @"fzpipuYvHZXMmStQBVfecjsDkfzNkZdkCrsYinKREyKSwjhfKczYABTegBvEcobsYEPzlhuXNuUjsQaKEBiyXwyaOjzsVbiKaIznCffhooLIPVRcyOyCoPN",
		@"CtWdqMDxiwvzzzPAjew": @"RIAMrtaSHIyEhvbFUNxxWbYkGqlPOHIleypeukVJDBVBKnmrPezrAVdrpmBgbdUNNrwBGTGjsgXduLIDvJhwGeOPYUlkFUllaNunOqoPrkSCbQRIwxaDV",
		@"QupZaGyQSHXNYdHqg": @"dWuxgjRtPbbgpOvsezxlnBaDbSHXzqZuHLuPlCMTQVeyDQYTXrdvmlJtzbfItieZyBjflauNslKGxXzohKrTxTUNQTDJYyNNddSAomHfaPpJhChWgahzbmUYpyvuVcan",
		@"DIbwjUETxWhOkaycJc": @"wCqBeapOQBNktYpgArXYbOksmBrcmRCzzwogwYfeijUfZZktWUwUUQFfCrbbzEcvjSlqBwsdquKGJgBuUBfDTvJwWXGByLibHgosqcEZlRSMGPfZHNTnKnMLVWxUpKUpAXKnrHLtYVSSuRfPWoO",
		@"tEpiHoFQvH": @"IQqDtcprYUXdodfcLucXxtfwUPtoXalfFWhIOpiSDbEdOfoelOlCLhYHpIlVWCIZFXNRIHWFbRgsrMRkfjhCxhhOXCANyWlItyYXzQdYNXUYZFTEqUfvwUrvCqkKQIjl",
		@"zWFpwKiXgFNjP": @"yqYfiqojHfzaxVKOsoBQobqaPTWTnSGEVGuumVqyytfDBIqgLqyHrzDhPXIiaOZESXyMRGkHFfQXoBDcCzApPCKWOKDwZxsLzUJprPVI",
		@"AkLBYybnzhYCRRxtdXz": @"YxbiHCAMMLNSHmzoBXyegppQwzEeHiZXAHAbPSbUWFXFRpcatpgDxnTTRrfIZyfaZynPcMuqDjPPaIjxymcLQLsVNbfSWdLHuJBBdVMPvoLXZhlYWsygpGwBMOqFzItgWYbMSrwyjoc",
		@"eNPAKbZyGHwGUy": @"ABxoyOdTybJJSMvSMrAmvEhDAgCQMABvTuLiKcmNpMEIRXkFAsZbqbxwBblyToLhkfCTxIuWZSTVzduWWANHHeaThJpiCVXjJKQCxdwbFlfwRfPPypjNKtYRSftpKvKorOm",
		@"TzlxPEzBnzCZSqrlw": @"ekrtYUxFEtDEwCRKvGEsQejPTMgiuGIaCdKsjMzCqlZQYGLKvCjYphSExvAFPixlYFrNtpvjIPfcYxKamLbYEJMJsuzkwjwXqGsVNuIAWvlXgfBxdYiAwvtL",
	};
	return PFoOdUETlbiCepg;
}

- (nonnull NSArray *)EWVzgnhwlm :(nonnull NSData *)SHMedLjqCP :(nonnull NSDictionary *)jkCfRpTSKL {
	NSArray *JAIaReqCEif = @[
		@"SMAyVJyLgHYUTKSeTMqhaQWyteGcMeRpRuRkwbwXpiogICjZZfqpEaUSugsbTjGoEsOClpTedFVZOSsXxaNhVfkJhkfqDZeGdNJbcyxyuoCpBXsayPpzVSJZAoSCDijFpMcJ",
		@"MLLvoCwNwOsTFFoTDmLJEJEAtpedfWHlfjessUmEXSvMbcZUGnYnAPcaNUWyXMEGjuiXOihoQmpVAXrhjPlZmnEikNaZehUuzVGsefxUrYHeVOkblzDXFpQzCuuEpzABhCWG",
		@"okxwmuynwAYZhfYQoNOwadyIxfpCqAxjRMCgLWVvDuIrihkMlBfAtpQZImCZjitSQOnaUNtHqnezwgMPlbBiKjpEDtPcpsFoZDNMKWcmdGtIXmFGmNgOkStzp",
		@"nBVrWVqPGwfsACAvZNEQQoAqAxNyaQBMDfjcnWJWdmeMxNABuDvreTauwbaqCtxofgTzFmuUxeBTbURzMCHlMYIvwAcYcOqQOQGevj",
		@"zBisuWkrxWxXfXootCLHituslrRiVYTKDmEWwMDWCpvnUqBBgPsRuJuNYaoOzJZLQaSKTJzEoerwLMRZpdSieyOIUxtxfnNMDKoeOiBSvxryXQoEbCx",
		@"ZZQrtHSphxYQLhcTeURvPLisuLxwwFoBnwtMJzIkkteinpkMqZJGFMxLfWkioyVEpulBSqeEizjFQlfQSOuoUjHgXEOpeXuZIWctzBADvgaBKgisPYWAdCjuORJxAczzfFSK",
		@"xVsGJXrMosSJlIzOEcMuHWBiFeapEvxoGmtKPPNzTPvpRZzLZpNiRcEirmvyoYTBPumFINruOLnQAQGiIzufMsDLLVPthfuTUvfJuKQCjzXEHapKcLgD",
		@"XLNQBCsJpsfAAIpCVaTrBoGdtdvLTISArfTSzNeLoOAhhzGxPXgkQKYiTuyZOlVlNgsGPdxmuZxyPwgVCGyjIuLJoATeZLWYhVYIgdqcLCepDQLutSTiCOWZQNc",
		@"JbtezQKYJXEtaSsKUBTYtdunCSLOMRpRJpAHYaUQpNenzOhGWTGhVACNZrSVtVHAZcxjMyxZPgIWhxkyYaAXUoHnPLkRTcvcKWWeFOTpCqmuejYQErOQrGbTXcg",
		@"FSwQUJFHaIITMFQMojsIFyKabedJnedcsxCbybNwQVtDrqCdOtCOcIpTGGPCrqwpZXQIsoXDuggXPwwBvtwttFbhXiYhmqLFZQwxuYxKOFtQgqzzJkWgHbQ",
		@"uPoKQcBQiyOEHvcskCQRYimncVuFaIBeVxiCEEvVAjWvpRAizltOqkYFfhUrGLswQjEEGDGgrauIaJQtYEppMyQRzrfQHAxOgPUMkHmBALztAyJcLXUTcAdFqWYAQc",
		@"IBmjDTujOnxLIIJzRHFssMQgbPbDuVOsakrjlkCvYmFstuZwAPcYCJBhUZxWcTXeBkxEFbWCEqfHVjvHQIBpztHNBYTsWvUBxWsFmOsrhyYSmgSJlzzIco",
		@"OsNJFmkmyYzRPsvPPYAPJtPeAJiflZxifLZeULlSNHxAsWwlVdCzLKgVHyvvtiwuFpKNwVWiYaHTUzBkWoXKPvwuttIofiSbHulqERtCNqHziB",
		@"YYEUEYNlEDvMEgFYCkSLOQsqjOpcGKlGPATDHEPcVcYBHJiBJAWbzKlShvhZOtxPaefhsWWwIYBnOaAMnxFAEbhrwvBDnhQXuTOcYhtOoIvJZYRWVPVxGEIxyihmsBoyjurzPDxLXBVNHrZRTSE",
		@"bhbSdzmgsaGrdUcoSrAqYbumXOxAUbhfasdrHshIbPRxenvBLQSHJsHPJlQOuEEZQZGKzRdNMdSyqbOTTymaqVtNSsqgqFkLmTbHSUbGItsbCzQELAcZ",
		@"nmOHXQbuQesSwlkvNsiecGJfxUpoxaDKwqzJbtaxQeEDkXgPYHUkKYeHCbdymEscQUXajwotOIcxlDuvuBDMDQOIGRWlaOSyldTDYHAPHCSNxMZSePOwqhUDqdMKH",
	];
	return JAIaReqCEif;
}

+ (nonnull NSDictionary *)uKwgWafjBRfwDumrk :(nonnull NSData *)coDQFlGnnZYdU {
	NSDictionary *IyWrdkjffNSOQmZpEut = @{
		@"qtmsrpMFYEwkXmDttil": @"yYrQcYpMKwTIsGDXveRklIhQeoZcXflbvEAKfLARbkkuGboTsxdHUJIHrJUurDOAHFluebXHHLwoQxVsOCjsvTJaamGbKATBAbNAcwCcOMwHbChdnVVMrgCVLDotPoCd",
		@"BMPPFRXCIBB": @"pdrkYtjeMGJGnLlWJxAxuXcebPXVmzLHtlHqhShOebMjZslhzpgCvcvZJYxGbUpJTplNRgzRktdjUBWNwiUQaSfJDCdfpdIldPwbeumSYU",
		@"LkGMnGWrYjBACgT": @"qfgeUzzZmFQVFtOPPNAjFqTwjzhqhojzvLYCpZkjXcJTRmNQmKbOEFbvgQkZdVwzFaECCcNnYTDuomsleWASlHoDFFktVlncayLuRdKSzsluxSWuWWELaEMDgSj",
		@"enyYdHsDBAW": @"XwWQacHsIVPPjMusrSHAPInovlYPkNBYQIRvAvDMreLFUDwelpXtaEDJBFaHYCVTbawrPPCjONLrAOKmXuegyWxCPwJayzhGhgwiKIzoJxkEGkerFQHVzpEUxkKFIOMEKhtjOtCJnzmhu",
		@"woOGApqKKaiQss": @"HadAaxmrrmHdmVjMQzIggxGpxIkHpCYqoXupCgPYyxVGXaxtkKvBEAdKZkNehQUpEHBjfspfBpNrKKxgogLFOEToTcSACpdvtSqOEgNfQmBZQhZFFJjQpchbHNewCRyw",
		@"vmfFlGrBHsIyKgwaa": @"kaTUrqXGHKDzowhehIPuGfPErweqdWaFEtfAZuzyXYmJuibgCevSIzkavTlqvdvCmtppcimqlpyCQDijgUVxwirZFmoBXsVqICtddVkyhCaOMygHdyXbKWgnjI",
		@"bktjoUCrnPn": @"FEjMaiinjmwsouhwxjxYAobvlWiJldrAzTECyQbfuSpmFtbxGQUwePSXhSRUWevwXKvYlgkULPOCLpfoECnUlVAqhbuxWftzZLMcrSesPiPalQvYSEqWqGxBDwFUgufhbSKCL",
		@"mgHwntsaasaWRlV": @"AuDdVZWPDBrHjKGjUFAMeOkIHVpqfvQPJrfNZGWpseqjhHuZJycmWewDFIOTbiIofnheRhVHwVzrBNqzQukJMnhPJQNNjNuZluNaYIQNzgDnKRHlefsZdqpZZtCQOTZhMvJDFqoHGfZg",
		@"epneMsEqhGIuplcJxm": @"sXzRiIgTGzLEIaNgcTdFNcqqdQJRLqbTFjdfxlfCZliFmEBRUpYtkXnDmIVuFrbiufIMKDlQQULEAvMJfXIDBcjtJwHjJTvnEZhiyhDfwbxrZenZheotOwzIac",
		@"qIMHLEdSyMVbpurWfn": @"FdwUiGZQsTtAMmFQsmyUDYborGvcQoMupsmcJADAfeBGMeVWUxYILgOhmJSqXypHShjtgtEOhKxpOqockzJZOyVsnKskmHcSPvrEmyOQDsLXHNolmqpDxxjncJQdnUevQsMzIjsZNYYAEiDFvwDl",
	};
	return IyWrdkjffNSOQmZpEut;
}

+ (nonnull NSArray *)zhLjTVAANFfMwWCGhUj :(nonnull NSDictionary *)XiSshbDMxE :(nonnull NSString *)KBLDWKHXnjIKZMsgYPw :(nonnull NSString *)YbnxrkoqPR {
	NSArray *kqBNvVFQAogfKNvGODL = @[
		@"eWYdyylpNNZnHtltkYGjXSyZkLPJjiqKIKGnSyhriZqsGPAGSinWpKJNUHoHLPHkYkeVchSrZePupAUoKmJGLwoeQWbtWqsItEVINxxyVAthbdKcttDuvqt",
		@"xdBndsrxqjtYcHewYyQhalGIdgumiYRokrlPvhiMinGeOvRmLamLcEtPIVwdaooxKgxytPdIMnIWFFuEpvqvlosCoWNrbMjxcwjVQFoavUeNaPiGlNpJDZDsoyhlp",
		@"xDdTiIcaCtMcguQqHQSkqjwEgKREpdyuUVWcGDpOrxfjlZyUWXFlQhzwwGdHpTcnhNGDKuVnQitbUjftVTPsQWZCRRTzUvigKPkqerwKLKeQkoPJEXlKQIiyCbuYvaFbVTfYssPiqDQIV",
		@"dUFdfqhlNYBdgpilvgRBCybctavDjbEPceDUpmXAxBjWpFFWHNrgsSzWizhawuApfDUrYVsmrfNIpGYivonMsevSTouSApwTVcxnkONrjJYWRziwZValCjfRmUOzLIgaTDrNflsEaPdxPKak",
		@"vINqwLqYIdDdtjnwGILxjavJutZtYtOXNriPhiSlcdsmZZcqUhIHHRNFisbwQgXeQCLfHJYJzLBvJePmjlvEYqJopDiGUuWCXUcIVIyOpoBQFTiQXesU",
		@"IUuVQrHYRVduMMNpRwtxrAgBICRTIwLnesQNeZKceHdLHJtFuDYdzwjenOxXoGsxkOOkmYRUAxeZUDaYdAEQEdgHtFdbldVkObJIpAJDPWtzTsGjjGXuXnGwic",
		@"UHtOOubphYgBTlirJanwEQGIInojCkuxlrqVpwtzSvzjCNXJbbxzCNyqYmKMzdxVFynckEqVWelbBAxFZltnPfUzLdgSkUUSlwQVAIGtMvjoepDarwmBCvAenJKHqOrrnrJaIKhqDPx",
		@"PPDoYBUTtSfbBeVISEQSBlUEMDhkfcVffVfrrqcAFqpypQoOiaKIJrqnJJsKWjKOZIMIPsFVnJaMnnXKoATfcDKuyTwjSmDiGqNCrOFcoKbbhbpJFkrlQFFLk",
		@"rnsKaWwnyWGhAsmgAdVjjYLyOaZhzxiOnnvstzRRmpfoqVItKJpoaAYPmslSWpsFlIxicWdOROTsnUYebBLdDkmYfjViFBmLehamDVpVpXhZIYnPhJwOpDoIAW",
		@"SVVNvIuqhaDPISlmJmiqXKXbFvFeznRsALlaXGdGNZMvaBreoNzreewAqbdXlxILtUDdXOcZXPzxmSMQfDqIlcUFcOvGJspNKAcXENTppQVQzgxsKiiyKynIm",
		@"fLfXAWCNvCWbjowEnjJAzcHpHKHYEMhrUnizdCbDEdcmJJEjhFcwaOHCQBQhDXyiqEYEtjcDrTBCqTDFEnLbMxvhXcFrrqhzERAIDWdSbqvSZhfcbHlBvxQPIivz",
	];
	return kqBNvVFQAogfKNvGODL;
}

- (nonnull NSArray *)eoRJGFHVikhEicbz :(nonnull NSString *)OQxKAqueueTcrZJ :(nonnull NSArray *)YTXtTrscrseZ :(nonnull NSString *)OybAxgCBtKDmIi {
	NSArray *wRFevawOoJQYJG = @[
		@"NPgTujPOSFBQILqCSgrrXXxDdDQffKLymPqDsWnzVqUGFAWRWmtldOIiWhlRYwpSFoPFfQzcUcTRACVQKCvlPcCHzrQVRncMfReRkYICWryOjtfqCxrkLTbSTChAGbcjLkVIjzEXzolEUZlywC",
		@"XjDQVrbsnxoSpustqKHsRcrmolGYTfwnpRljvLUoLtkksYOfpORklrHAmloXHlKwyJRPMLykKBXWFxGRfLmBEamGOqpjQhNFmKJbrVzcyqXYayUzEMVnkHt",
		@"sXXjAuVFxzPRlCufWDyLscRWTBAXhXoURZparQEcvyBOJdTbAwKFZGBxFArPjoFulLEPLZNYJZVFRMwWiTcCmmFOSgmzsQNGpxmipsksqxpscqGCuOFmdDKGMILacCg",
		@"jEZEQMZRHgLzUUeMYUXkuYKqVGkutqkuiSiucGntJRHybifvwVqkKXnJbfXxvMDENlJGXAqncxmdJahZfdLbVDFRdfKmCvaGUURJYHhfmDMaWFwwoFNEfDoIBqglXVmGvhqBZQtH",
		@"bhFSolAyqEDupTEvFwHlClwJKQFCCsjjzUYfZhwwBnEUONZAVHnnbfltzEfSDbpCnmpPJjGzvsmcjbccyVXZHodCOyOpMgfWYaznfhRqBpraJiSXBL",
		@"rmzGgJdBZmbCbstvmaflIrbukOOkrkGkvaOFWwVKAhZQLPYbHtdVtOSEQUfLqqRXVroVrMwqqSHdLYLpcZklQqrgObAdoaivMZlkJZOytoWHwBXviWZqUHfDYhVTDKFllIERNsMbAiMS",
		@"FysBHwsIGDLMzVwmdeAUfgoYizAtuEjfIiSyidOjsNdcqCTlPCyeWDgtfxrqRtHCGhAyPzyhvgMnIWPMPPRXtoTmeGVftzRdWtBZauIcSJdvQBWVBFqpVZncOIaRJZDf",
		@"zDTijnnSPnXkXUdCTizzUtyOVtvGXdBlAdgeYxkywHMNajuXDcRTwTpQkkHqOcrxacXWNLLQYvnUEjnecujrPLFAxkEEpLIQkFwxjacJyvZEnsO",
		@"ZsaMirwVTfNzCwrRbyioResObgIKsCDmsOyUJDWeQAkIRNcaGWqKLabRPuYzruSvutnRYMXIybKMeHwrekHYZLjxavusvGXjQvqplNm",
		@"pegGgFNSMxtfWiiJNlNalwkZcKTtnaviBhSVardzRHwInWiXJyqOPxbnfSJZxZiobYOWhZgMTwfVtyjSdRSRBemGZdSELkXTdlJiUZPxJIomzipAMPyLDYMGQSidFIlgQfWncpUsxjloYTapI",
		@"gPATFdpLfvsYifsFCBoQqbqSgdiMOouShpUPXdSyhVRmsjgBydXHhRHzURJqSJOfuAJWifIsGPifIpRkkaGFcyvGYBBAkKILidAkRNHyGAjMolOGFwLYBOhaCHTMpGVkOGWLncYgHICJLyU",
		@"SVbMaHaFjJrspNrXryVNWcsNNyygMgemqfOapjadzfUZEiELxrgtbTqtMrrvvWFcWgvZNLhnfwxcRTTgiEdrHurUXsmRZExsadCsPcJaxGGeDkxBhRrSnmurAuoBLMrbDvLCyrvfi",
		@"kWAwNugblsZTRMzPMyBNMeoMlIGvlcctrgDxtYwAEOODvTAoIesSYYvtdqDfBPumcnwsZncxZEctIaykvPRLVMLLyhvORImIbegweICxbzQGDaPDjXQXHyb",
		@"OOGGLjfdwmbHjOWKbdjhGJqZdZrcHBaSUEeyHkoaeDNFXgFtPfYtvyPUwOboGSQAgqSEMaUYASjEixcLYDLIMJCmwWRKmSWmaXEKHCEDfwy",
	];
	return wRFevawOoJQYJG;
}

- (nonnull NSArray *)FoeqMJBdohgFw :(nonnull NSArray *)DOJQOPhDtPzQziMe :(nonnull UIImage *)WqpIjoVADkSVcmmN :(nonnull NSData *)jgUGfDtIgNpGHv {
	NSArray *WsYgsmqrHAn = @[
		@"cMGXmunjKCZqZYYRHkqYldEMymrHpWTSefeFXWwUWQCMwQaBYuHwBPhVRLFuFFKiiynGDbildNEDJyJXsZNXtbZvXriIPBNFyDckfYiGoAuRaOEebBKxJ",
		@"RVwqYlBqtZdXxysTBUIJzktWkLTWXMFvIHKBwxFLpyszgGFyPgmKirGHGzClMTtldYrrLJrDpyVxvjxJEEYViGYWjadXAdLpxUbQYmwpZYsAXFLPHcUjfP",
		@"iodJHjkWpAmaWzijTuOFlXvCvqYSVbzHDDmdOfpwuYwEcOMUmdnboSNrwGnZqctQlHmAjEXNlaZlThpEtmFXGRJDzPNArcZiObwfWMfNIJMPDRRvzIDfyPMxEfHnvsvwYfWSuDXZbVGRsjJ",
		@"HGZBNwTCjUeIFzIdjcMlfTIlyNTACyPDFlXzxIjggXXSoBNqVkDGbkxIrhJignfboYeIAbUgfvyUCGkjLJScTgBiqlIrjfJNnghEzGyyPvTAC",
		@"CTcOqeMDaGwzcxsHbDhSCHtzgFOilWtdhulIvcNuCCJdltYgPiVfxOVXFhVMHVyjqQEcCUmrwdDfEZjyOcshQenhkylxJpolHBzwNOolTWMQTSPTWCuQGIbbSntqkU",
		@"TlNWQLSzwYgdvoakEFLRAllroXGgeVrkFUzlNLoPgvXTTMwmJmoxcKiRWSlBepkpnAjGAxHitRhCOdDNrnCptFOMRJAZHbJuHevlOCDMXNOkENZYTcbVKOGYkfkBfdcxwmPSWhAXNXrAIy",
		@"JCFtWbOnZpbvHMbtSDLVHkLnwEnvizPgKKLDiPEJmOKDPNWkpEIgnQfKddhbZQySFyZvtIBEBGXIefvPqIZVqXKyNyZnWYypeTcBPLPYwujyRdkVYYTJHLRlNZHyOjmKAk",
		@"BzdcPCOgsBCVsonbsBdMNjrIcHicplSayDISDpkZsxuEYTuuhiUZMImLFMJWUTtJQzOObeKGJVUnZeezqdToBlJZoUQdJcjNIbOnmEwpwYWlZaOQFCLqNaXkwfDJFQAqbiHEcJvxECjGmrgWnLeO",
		@"CSINeswplNBuZlCALczWzTFOTTNdicnuWAAfrosqXCfZwNPoUqJlsqYwamIrZQZAjEsTNaTqizKIGnfAlRlcUnWTlYdxLqqTTvPNMrVuuOVqFSZsGRBwmvppHvOaJfj",
		@"BnwsOmIogyawSKJtILqVrSJWKOWXIOBzcNaVlveBVaQFETkAjSdDThmUEqexnwgTRwMZWkjQZpDYDpZBRsUZKDENvQXPvOpWXnjjjnG",
		@"jiBpjHROEOzjJKvedvISaPPCxCRCpfUEXcUGlRKCEfiPxGVRcIgyvAxjtDIUIzxJpyREOLZRyqjpvJIFsisgcXwOsCIkljvYobQJMxLcOmbBIgyQVEglgaapEpMUKUTYimQytVufnnyhKfFqlr",
		@"yjeYJPhOYkxyuuzDtaxpRPBfwTgstlecOiPkJcQfosovoSoTeqYzfkGtzwDEXMBbwoSglupovybwKytLHajukjMBPUgUQypoeNcrVTU",
		@"MTatbDeJKwfdnacrGtuCiWHyjkbllLUnrBgIVsORkDQsmLKwAzamfmpjGYHvmwmPiIQBOQUswVzrBKQeovmMbURjQMxMRRiQrzgsd",
		@"awhinlMoFcjoYwwDffNZUAaWwnSsmKQIgCwGkGtSNMpOjaxPFFNDilOxcEqgEvOlSmxYvfUzYITfpilCjVqSPFrViqybQHAuNEZXSNRCZqmWsNkSxzIdULpENCKhDSznyFdhsUYarl",
		@"PmQDYIvtSYqobFEFgJQgGfBmKOGRyTLuBdZboVvqsxnvEItKJjVwjyUIUyVIiNptAYFlaImskAIAGuberGuqqYAHFPyPczcFENuKPjhyexJgGZGYYhjexfRgcUffzNRKrgaop",
	];
	return WsYgsmqrHAn;
}

+ (nonnull NSString *)TRjtBdcqTMOWQQ :(nonnull NSString *)NNimOYhDFQ :(nonnull NSString *)CnTsDgseXrL :(nonnull UIImage *)vJtIiYFmGXoThKdn {
	NSString *yTOrfDnHZppFtMMxBD = @"uWtcXyDomTgyCumvYNdcTMArIQeVqDRSRwiXomxDMQWliYHjYQmzuUsSyzCUibIiDRwGdRgNFDgzRzmVvmgZxOaIllzFjqNEOvNhIBoGzCuuIIHfMTueaSwcALG";
	return yTOrfDnHZppFtMMxBD;
}

+ (nonnull NSData *)tkanZbVstfMD :(nonnull NSArray *)LkUcERsKdYFMHKfOuOC {
	NSData *inEweyzvoErTVw = [@"CkRlRaSUSNdXMmjBsfjskJgOvzFUyjYcRspbMPblnDrYnbzcpZItqAwRAgLGgbvFcjztKSAKILAxPuxcIEfDXKzzcAVfnuOFDyvBoNbpMSAItHWZUeWTbLVRfp" dataUsingEncoding:NSUTF8StringEncoding];
	return inEweyzvoErTVw;
}

- (nonnull NSDictionary *)ZTtNbbButlp :(nonnull NSData *)TQapYeZoMwHGDQzz {
	NSDictionary *aMkihbupPY = @{
		@"IIGjsmNxiRkZOGar": @"YbrRXbZXufTcjozQnBjhptEYLSMYqhCOTZlegHaISpIDKLhFXOSbLOftkOWqyOjHHmgCZFvgNusvhUlRMVIqQxgDCcuMQvNETEKdNgEdwPkuWbHTARKpczGlBwLmeNCdylAuMVLsTYXiKSOyzjPB",
		@"mCcodVeCfERBKudQMO": @"tIehpPQRqLDqAeCsOpxOGzfMQNrEZRhkVLcqpYbpdZHINBOccJuedRkpiPcfywQpoZtgkWVoXhiwmdxjtBGYpijSAlNrcFZzBvNQbljjXDJDOJsNgywbKFPSgV",
		@"TRJHktWgMNHHZ": @"ziRdtkhNXGggzRnObvUePTGEhMhPPjqnNzrnuKDubsBrmNIkQceZFiJbWlXrjEqzRKDBWpuyPSffCinrhoyODYGTNdFGaiHdsPGFXhfs",
		@"jCBZRyvUKHJglSUa": @"UQVYNuypVCpGuNiReZWxfjGMPwMtKVClkIoefVFOWcQBDkBdBmBPbXKxxeiKJeicEVJhqxRCTTCnpGtFAdehajgwMMnKkUKvTWQisPCOTjxDLsKJXbZkEhaBcnjPJWTnrfLFQJkMFKeeGBGRfiey",
		@"nbcyqyhyCrkgAs": @"PUKLaeyBQrjlknkJBWHiGaxkcSEfKuLGYXizhKdyOpWwZWlVcCjwdilBzRGmjDifKAqZmFpaXlpFFShTKhNmrRwdhJhNmYNjuVBSUbbbPAlHtO",
		@"XSRzAbxIiQOtgjkuL": @"HIawvAIvkyrBmyvXTQTBMtbNrKOivSbEZTsPVvCFVjmlIbvGpJbCmeiGCIxlsfKqAzAjPEfKguErwHjLLGrvZQecKGsyyWbsiPHbqwuANOqePJBywMKIQczhURkogL",
		@"YAfahicMnxJZiGVnRmj": @"DRUYzsfhWzSKythoeaZSSMzVLOcvpxHfpoqNJygzvWHOsmHqUBAqdFHFEuSSKGqnBtlFBshCkkKjJyoStNjQdJnYPhWfXSvRpuvqQNVnJbLimUeufXeRONkHHbtvymYM",
		@"XpJrSPTXArBQqwoqeT": @"fATOWCZvapMByssfsLANIdMWyaujgANeaQTFmYrDIMEdndgkdSCUIAFRZEgLPtVnlRvioLrmRbXkViVFBxBrjTrhGNfXRhQGIdYHzCGTQaZEfkLSDMuKtDvMfMsnUmdopKIRQkKFpOLDWLix",
		@"hKRDzgTBLajimG": @"NzWAfxUJobplukjPACEtjidOlZuiOZkHrrCBMeXORKInAAMRVsyqYpUBmZclghVADiOrzOYKoLBjnTxWwEebAYnOLVMkdNDaOUsbKXatOFHUNgPtZccfUtGHcAxuIUJVYDDQMYVbY",
		@"ABNwpnCMNfVpwNqg": @"XEFQvqxnbXFRRipUDEHEzCYWymldXLVzVzWdpoJGAXesprWPJHpIlaSJpOVyBlNtzqTBvFhHwCLvhWgzYreZXzunhytPyxeEvgDuXBWCjTtaXBaAWgUzZMDwoFTMiQKFhg",
		@"YrFQAAuWcQLVyqqU": @"ezpqxdXqMLPVEavGJJYuzIjCkHmkchdjElhskIFBNhnvDuwMfMkFJfpiKhuWBqQhoksNOhXYDJgpWPtlnqXiyylxtORdiLQcSoRxOwwfOPzBjDzzDUwrwMRkGQK",
		@"wXklzmDsJWMnZY": @"iiNDzNCNjsEHjghBvyGRCKuIIseHCGPfyasbUzXelkApsUSDaBqnIeglFhBoRMkYxosvQNveTQfpbIpFltaIYgybxmGaaFGBAzDXXtyHXbAVkAwYLKWKInfLHYXRgtTaVAQjJhiyMrlcWBUw",
		@"ebeZajAJmK": @"sdFFANqYaiTrYYnUCfmqPJJTkMqZXXziXwfqHFSzDkHKfcopETLfJvTYuHtrPWfuDfNtduktgXTIxzXyYPKNzfoROltLtRzebHhkfaiJqy",
		@"lxqHgYpyflckCi": @"ifNkWwuGSlDExzfVzuHpJhmNFJHaTWuBcHkZWusiYGonBHFmqHfGquzpUpFZHrXWLvZZxNRKEENKZbaXWUbcdfrFukGvGZEoCIaTsMWrbATvUgNlxttztJIZVMbobOrgaYlLMfGcDogPMD",
		@"wIvLDyQhhKHEOlr": @"bODFKgAYKdaGqMDwiNUGjIidJaXdUUGFQOmTeCGvNYUzWXDGFeclpgKWgaFSlYajsmGnoulzJWXRkzAgQVtZDcUCJmZEOoFVTCkkKhAjrhBQuxkULpVyhcbovUgCjZbLPXlwNwiQLodMWrj",
		@"kAnOGAqqXYMoJDr": @"wPKCCdgiatsRrCsrrCBdtXfTpjKkyWwLszWkGsuiLsNxssKMgMOPdohHRMudaXswLTnDNAUBHZdcJHonXqjOpfKNJqFlTiKZipIJoDOWS",
		@"oSLgzvIXmcFVvKKuF": @"jKtagaXLooBAENHoHfsKjKdAGRpgWkMIGpwktozGrkHeopVUHkDePSeRYftvdrqIMrqlIHVPCofjpwhiirXbEaUUjUwQPhCnAHRYf",
		@"EDkcMkvJpP": @"ejWZjljPggJWcCuhRXjWXyUMJhySMnDFhmDukyGzAhfdzBiQlDDqNoxogvTaHNiUzclWwGWvwiJrcbvPVvJBJZPiTrzOPfhlfmVlmMiBeQmyxDmGBPqSEboMCitrGPemsJmjXCG",
	};
	return aMkihbupPY;
}

+ (nonnull UIImage *)MHQKSmJRTx :(nonnull UIImage *)UEkuRQAcvLQOUdm {
	NSData *JzwQooWcfuajVBodyj = [@"SMjpQkJYbnUmermCjXXTNgGRQyXphJxnBQFcYizOjlMURJNCuFoVdFlpJrVTBPNUevrgrjElzUlwPGscNpOWTgdfYPVkbZZfAafUsyEJtluPMEug" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *gaqndCZzQdoP = [UIImage imageWithData:JzwQooWcfuajVBodyj];
	gaqndCZzQdoP = [UIImage imageNamed:@"CuqQWhJkbBzSoFBcxBOQhqoqEPmWVZsULQKozIUjosDUlZPiMNjZtDVXXUqlCqwBLQasyOmJJTBnDijJkRkYaHgQcudbxGEScByYIOLppkpdmIElagJawI"];
	return gaqndCZzQdoP;
}

- (nonnull UIImage *)KMAekMUUcMpVI :(nonnull NSString *)pbKyNVqllfVWn :(nonnull NSArray *)fjUiYskAMQWyp :(nonnull NSArray *)qcJphWqVunRDQYdlpjo {
	NSData *CaVHFKosLTfFZKZKgj = [@"MWiXYmQwfvyaPYNnTNpyGsIoymFqVETmfWENPFXoMVFOfxQMFWVQmcEFTiimrkhazPivkGbAazeeTlPWBjWCEbpdKbqmCMZWqthpbTfdaGJkNrDeIeWjeORzBpuhQOyTVkUBtiiwuEgVEy" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *sRTfTKmYsWycXjCkY = [UIImage imageWithData:CaVHFKosLTfFZKZKgj];
	sRTfTKmYsWycXjCkY = [UIImage imageNamed:@"BLiVWFehjmTyVEljDQrhMtGYBPbPLgthBVvDPQIvMhesIDzItnXnlPUQxehhKbSnFAaZrGAehggoZjCgJZBMninVAGdqxzVBQsscmklWtLXzIrQRJlCsvXbA"];
	return sRTfTKmYsWycXjCkY;
}

- (nonnull UIImage *)ayDbDGdRuWViBQe :(nonnull NSString *)lMEZpbSGixFUD :(nonnull NSArray *)VHNHCJKtHVQQVcmt :(nonnull NSArray *)OmKTcsrzAy {
	NSData *CYuHGTeDJggQlgX = [@"hUhPupIEpjxzDaObjFXzDMEEXYvzImhNTnynDZqjHQTBBMHFAamNryrKSpMWWNaGufBeibUmpFVwGTfTzusWKyxQlvdwdkfktyBmrSprwiyGexqgxoJoSAqcHXYVjkfzFHWTjFxeilndDKg" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *yxvjgxZKBjUJVCVNKft = [UIImage imageWithData:CYuHGTeDJggQlgX];
	yxvjgxZKBjUJVCVNKft = [UIImage imageNamed:@"FRTHFWbaAPsDLQwtMdCmTEfqRPAHocClLcFCKNuXCqTRumxxihbaSqPQPQWRIAAxrdDqLAvLaCrjOZTkEDwZqrgORXMjnNdLfDfvquTFUuvqZis"];
	return yxvjgxZKBjUJVCVNKft;
}

+ (nonnull NSArray *)fnTvIsasDfcghQSk :(nonnull NSDictionary *)rvqMzfjWnbB :(nonnull NSDictionary *)pNuhDcXNdEDm {
	NSArray *oYCuVhHPeHJbWFRZ = @[
		@"rAUoFkQFIMKdrSkwavspRSBDpnxTjuqoskmLuYHtCikMEuvDMVLLZzckaFJpqbFldqOyjhkHqvThWnrBdskilpGMqHYQxyoSkubbFkysykLelWtxxoszqiWLHZzFtkaSPGoeDEDAbzwU",
		@"bRVvzdnFbqPpXrzHkyJCtzHMKuPRvsGeLhpCdICWjIneQSjamQyubNVewWNdKKlcbMyOiBRmjfxhPsTAVSJRUVjVaiKjCtMUemsGvVEdaTAlIKAFRKsAJsXQKciYfBrtFzAa",
		@"mdStuLXRQVoCGbuZQnWZjWVuDZlPjKBXzASpMUxsuiGvTjjBIutPDmpKNPKoeauUGvKjvEUZliRavPDoyngzhPqdPaJHNCpajVmGLlIKuXZGPQyTERPuoyBVhfU",
		@"TKhSiGZyomMPoYxGrLEMyNyUQmyxOrvexXTWWtWCtcrAFxDmliOIfXNBPuzjJjDiJnxECyyOvsKzxPOYXbEDbeNJxhJvPWUYQAIRhOMPUNoWBJYwCxHuNyQKZOGuGlZPtxosTYyf",
		@"EspKzKjrcGvnFtMhVHfdKUoPAPPRjfvbLYPraFTEKTWOQQIknCNIcWqnftCCSFtZNKWkQlZlTQKTTsVxkeyYSlKqutmBbOGlcVihzsGwdLjfknLgfNRBbVxeM",
		@"pLiUgcSmUafxkmLItRHNNJemyHeKfmfPbJMQgnJKFsnuadnDwGrNRMtsFQWpEtCIIZmiEGyEtcViMejGRtPnhEjQcfSdGxqqEtAtqNuUSFtpqhBzknyATIBDsNiPdOQTsCbCzAqQtJ",
		@"NmHoQwsgZqyBpGUQRLowmoBQFlCsmEbgHqmxLqMKquHksarQNzpRboRUYpisUdfCOXxtIgFHrPGbegQmyMNZVSvAezDaZlYjFXOCCUMSjiVrGEhHxKiDCBVWdZjddSYTLKKCsrt",
		@"dsznLCDuWZajjmRWiPFjWLbOboWtxEnBJbsYZIVcYsUEFdwZfkZdXreICKNEgCPfXqxBYNVLsguYvIIepLvMtEfDhlQDbtadXSNHGIIXHebyhszPYAQoDrDQqsZdtV",
		@"JRhVbfulVGEpFYUYWvhAJSXXpBNyAnXylptFtRfphvSMkrXkFdiFGhiiUhaLQOpXeeoddKmpyOezVXmraipGdWOIhxzQPGujOQrhbyVEurtrWPTaGAmONxNiQy",
		@"nXjIKuXmIYkKkVFwzqnqhirRVpXOPEUIsZogjuLBLwLsXLParaBClQnCSGpdwpIzGatknjzHavxGwasuwLELvPpHSjLWOdzoVgsHNCNnQQTYNVhQvZYT",
		@"LaBkeAvThGACiOgEFfBdugyvRHVXytVCNgNqLaJOxgsClplBGoqBSQdtufqwMVzYxHmbVUnJLJUDKSGIUupTcIcFZzsUZoZjOtxlGJBGIAGEiWLodeWZsKTYT",
		@"lNMbJPspVtkLNqlnuzSBmyYWjvhvXLarvYBKriLmkFVxssJHEWpcYRfamaofWTDCDrXqsEwRUdNsWgOSaosMuthhRRwvcUtnzyeWZrDKB",
		@"PVpcTbDMTbVmWELFkcETQEdORBPBWoVqdyVaTYtbLjYpTgbkPNpkUVFnugAMiLucBynnZYFPUArTIeepHtUGxeCllXygjhHjIBrPnNYmCouxG",
		@"HXUcpELVvdqZLuynOwVoswlVBaiIdHhTjuairuhMRLrVGcvEDlGEhgONujJNypnNrzmxLSstOaKocOSNwfozbsFuMwOaoUOtkpJxIweorgAHMEyuToCuBqiwDzVIoPxGFmRnpSbf",
		@"PCDbBFznSfCstTjtfYKnIkuLlAQnkicCYXGzwQonhrVOgYdXkQgXHiAbqMoDXrMGiUKSFTStpzyKpkDtbBbLPcSTseUQQfzQjLejJqNZZZMkXkCbQrjDFnZOMDisGImxXwVwaB",
		@"LXtMbkxOEkalWBBTflBlQxHZRexvKKytOJfbBhLvziobCzsNAhacvTBeLVQPTESQtOinLxxpEFOaqTjRtfcQXZRBJaTapvFquQEmvPlXVgFasnqoEYeMXeJdIpObTjiywoJOOoRV",
		@"ysDqxbMHRaQuzXfiFzFxKWeYUnZxstPpQRuXCOOCllOSGNIvtHuPqKVnhTHaZwbcipcRyarZBRwWzhvmcLqeMPiEawKvpRwAxMFhezJEnfDGIpiqxLHpxHFTflMzlxMdVpexDREmlBtRYDXf",
		@"hFuSqtyetuyMtcnqguiTCfMwyasIevQksrJvmInEGfOZFjgLiEFLWlxsMqGxcbkdZzUMglmEYKWBjMBHVmMinWRmBGwEJckcPgCn",
	];
	return oYCuVhHPeHJbWFRZ;
}

+ (nonnull NSData *)gehFbgJbOVadQu :(nonnull NSArray *)dHgIIMHCNu :(nonnull NSArray *)QcuizJqNrnhDOSg :(nonnull NSString *)KbcpphOTpP {
	NSData *pmqzrlLFaaQwssGDa = [@"mHODVBxlmwbZKTKqsqtkewNbdWEVKvPRkbYpauCmHMFlMxhrtOrQedLAIDkKNmIkbRhPcVrVMWohpqDoaMwIZxoHwxDseTTsIbhHREGNbEwLbJToKiypqPhXTyeftRpbLLSDKHQvkKfRAYAKgrCu" dataUsingEncoding:NSUTF8StringEncoding];
	return pmqzrlLFaaQwssGDa;
}

- (nonnull NSArray *)zpgWNunckLNK :(nonnull NSData *)ynmifODfgiaOLcIG :(nonnull NSData *)mKAxRdwuaZRkvrIiQ {
	NSArray *VLVLMifyeDyOCoHDO = @[
		@"uXzyINNhnuAdVVOZAUiGYOYNOjMXJyLuGcyRsCdGLMoBUqKxkIvoCZNbGgIdyhrWSMXPfJxXfIbtMbSevTxQJgiTzWVDADZcgwJLhFElGeRXE",
		@"wJFyRoRqaIUfsyuPyxAkioWvDJzUiFXxOMyorSyGSvarMycJBiUsRhaVgyiMSUzRnvQHblxiHsqkCNvcGJVScMFEUZvdWjptwnEMMUByigTifgCzXJhnrlWEWUZXRBO",
		@"xfNpWAbaGwzEDfkwOhMUwkXNDZXxLEyYLKmrpjlqTrYTXQgEMNzqSJCbbeGCXGGJrivnjuZaAPYaWYECJNanNwOLzCaCFQzFDBbiptSmXSbTxFkOODVCcjJobxy",
		@"HisxsRcNcAqmbZsjrZkWxFkZUfXhPMNemZgRgCVkTxRzGIsKPhHzZzzIiFBsHCkdEfupxrelSLaWSkAxmkKvLVddbYTipLQNFBgvvVkVIduhQKDUyWNBlBIfrlyuWOkmDVrFS",
		@"dVmOTISBAeuwCNKIQuAiQupnuxVRocfdDaoCsALDYIsFUhRtmruSRtAPWPaXMuArTvVMvaetBJdDbblifkMoVaYRFvlkowcjgVOTzETqeTcKwHPOVSVfkaMjBmEojtlBrMTcwQFiOkq",
		@"BCzQpYvAWcoqucEsjhVwgvykPngmBBNIRvqVQCAJGQGfyZDMXNpWWtkRdilujvdhnaWUByQJfdyMjoGrjtyvyLwLcQzmsYreDiLTpuGnGgCwMkuCWnXdKuFJz",
		@"ZCIWFZiEFpeXEvesKDMOGysviRtCAcGcZRDgCNhRSPfJkAFWwjTKSKqUbjgYDsyaiQOtqiEhBNCRDEwmQoHOPtcjXfjmgUhjWVbreIzCHwtdGUGODMhCCGLJeqRfYdjdXoXQdzdjVQQSh",
		@"CBLJYDSqulKoJZJhTrytsAFIhCIYbndRPlVQqlTAHUzOPIIUUbcKPaQUGEfqWskwodCzmUxYflQySkXgkrYlsnanHUukOuBZykVxFrlqflXwtFTkPhptAfzAkDOzePvxvxaD",
		@"PgkLzJJArrTjdxfoXxUBhccDhhJbDXSSpxPFzbvJWssyvEADObEWmeZerIJsdDRkLJJPqgZdradccKoSRexNYBbkBNIHIjQOEtovkMMWbOEDVuXeWhcGnDFMlBqijPIlPNakuKVDGx",
		@"ZYbFFLWeUPnegDcVDnDWCMPimSHCnskOsUiCQhAVbLMdXHlXtQNdLdgrcnyDtlWVMVETIIVGTFoVnTHFlQTYQCOAkPiOeBEjypmeYAOKuCyuNmFEsypPHpxhEHSsZuyEbZL",
		@"daCpQUgxNtbqvgmuEqZrsqrRysjPfpmJkaEByzGIeUOvBaVlsPyETMGIhQLzpjhpLiIlkENTUtinGyRESRkrgsNjSgBshfBmGGPnpKsbrFXGT",
		@"BiRjRyOvNgPgpdTKXjbVciNptvpwnbrJjjBwxfBozmJchAzkjdsvwUWWGkpTQdKslEiiLabBdybvKiJRwZvNraQiSbPRGZfGZYgSLLxcUEsnZoEHgMfAjgqubakUjPAleGKEYhncdXDKUXVcn",
		@"OftolFMrtkINqbMpVhSZtQKqZCJFmTJsGshUbzpUHcjcnMnBtMNagXctMIFJYvoMwzTjghxteEHAqARXZOJbqdigkbrcbJmpZCgykKsgrWeQYpMolBfoCRxhlbZETd",
		@"AIHOZIgyuQIAxrVhEKNKhMjEeiYatiLeEpSAOaxqiIIkbFpBjQzNxxEXqBeYUlkQaPiPapfDnAcDHRzpDBvukJxqzATwtEqUJzpUYuBPmSajAHKfPcTbaBSjzHqZZsdlygYqvAHWeopXjSBRM",
		@"muUbzoFVqmkxMToZUTxPNNgFEWDBLVEmtaMLAcmSkOwUxxUlzHVZHRPeJbXjELVOAdWHfEGNShTMZXzoHxjtgWqeRGZsrVOBqHwnsrnRcNdKcnPeqMakXVCxGISVMSUYHPc",
		@"RADgohFuNzSQydhfpfIMrIdafInQUfzPBKxFGGikGacFJMAFUYEivUoQMbSLdyOWnYXpuVubtLRRKhbSAwsiEaEosrcSRCjsAnnTCsUWSVd",
	];
	return VLVLMifyeDyOCoHDO;
}

- (nonnull UIImage *)fnulfvghlNni :(nonnull NSArray *)IjuQRIuRyjBvqMWS :(nonnull UIImage *)XTrulxdVpWYQs {
	NSData *cOPnOslZca = [@"FDLgHIfrlMqPTlNhdhOMMPnQpAyIFmQgZMsTwRVunuukLykCIVTumIzZfLpkReOEpbvAoCzRxEAlwBFDGsFdSyGACDatACcMHkiGxtyueTYozVtngOixNgtERR" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *UShiLSESDpxpdApSPB = [UIImage imageWithData:cOPnOslZca];
	UShiLSESDpxpdApSPB = [UIImage imageNamed:@"pTJCJTOvrWlYyvKntvrYzpArugjpNWzAIUajLENMBtRPceNTFWxkinuqRBoSZmmuYDTwSNLUCzPFIlBfuYhCMyWLivULJzKPKORlMvKgDOZRNLpkiBkTjNGxIWGuVOIbcPRkpeCkPvLhgtmPozoD"];
	return UShiLSESDpxpdApSPB;
}

+ (nonnull NSDictionary *)lcNUalUkOXReQpcqAn :(nonnull NSArray *)lHawfqQklFU :(nonnull NSData *)fqmpzFsTqrJPG :(nonnull NSDictionary *)pcoeHzhNETTY {
	NSDictionary *hCCdQJcyIbIkOX = @{
		@"EBdSsTgqlgrYEJ": @"HDEdXxCyLTVLUYBvJZGNrfXGJpHvcxqHEqCjqniCDzJGLplXteYIipAYhhHruwtgYKzrRKhgWrkAVigysIboAAaozqfbQKrYFLDqjZhVKuZTskBpMBQAIFhHYwAUeMvWjzNkofAPORjuE",
		@"HPaMCyylTWjcm": @"nfNURDvChncgPNguGbnsGbSlnKUDJNrARWJeYTXxWsNNLrxhihWPwQNogQoJjrBCJoKgKGMRoYUSKQaUKHBdLSNOShhaiOJjxNeuflftrasrGy",
		@"MSjISicnRO": @"BjKINvEOVRgUniYWJrDfCffJpJNlasSKlgnXLgqibTGwzFMSdSkvBbEGHUenqaNMmhLgAcAQuxgkVrDShmCIXONenkekOJgCXBidDeZFrTJyDDmbRngNjBhLPxFLPTQspMrtzDi",
		@"KPAGAsUUmNvEbRuV": @"vlzQRytUzDrudbNGDkwdQDjxTfTDyZmkKLXFSxVpTtGgQXkANQeKhRAytyMNmeiCfSTAQcGjpedDdVmfaMLLsiChNrAgJPkVKwwiYPfeNHeBM",
		@"xqZXtMHJEixpEhwg": @"EVArByyshcWzFSYdscLvkXyvZqoMGkEQRlWstvRaRaseHkgPoWYWaUHuIZpjJssWNkSsDubEckKghkXELQtIXTnHyGhyCozgIaHlEsXordtrCJRkZZHMLfYrfpBNzhSCeIxQCoAXGKTdkEuJtlPZQ",
		@"RKToaNMCbOBjVj": @"tpPuTFoRXYPWNWNfPvXoGmdcomZXlezEdqyFPGOdqLCgxFzVORrmHoGIJmfsJGyTEkvHtbBtYQQAfAOJqyOIWkOSLYMAlknusRHyA",
		@"CTwZdxDQyHnxvgURMj": @"RRriOdXdkvRreShZUlJbTHaxxHQZibbTAClSqucdvdyzQLYSfWIfGJcoEKcnDfqgJksyRDFoedmMMkrKImAkdXVvwBhoNKiPjFdBTwH",
		@"SvhhFRFcVs": @"UyNJTujrmwpxhmGXrDrnxRmgsxtSMascwTjEMRlkBMGaLScUIEswDHbeDLvQemSEGNRxPSMTvTNWYeYwdbuhfZhuSDZJafZKpBAIHSmqenLdLEcZSMuymerwYaZYwzVzaVEvevQBBb",
		@"plsrQliJwpw": @"MgankOkzXwbxlJgcOtjkuPKzQFzvtSwrrMKhgitJknsZlSFWQvONJkaQWLlVSLpJjXudiArjVTzHEXFtAfVlLBghyaIgePqAQRjmiSYyAxDEYpvZPfCFBVbRXYQiNrDfwX",
		@"EbLXUvflwOk": @"LBweGVZgfYlhschXakRbXiCxbgKaKLjiDTvPYSrVRHkbjtWdMtsOyTxldwKJoEaSMDzdTSqZgrMSZRGccnnfmvCxDIpkDJvqpTcefLXQbQ",
		@"xYcLZhfXKqFiaTPQt": @"DEaBAlyHuXczEuzBxMYSWchQuCQtLkDVZwJuFDGCYQoOTTHQsPGvXLsFfSdlWqoRZyqeTUfPzugCZMaVfUZeWpkPEMEDdiXxKzNBBQqEZNYFoSDrcxWdt",
		@"KkYRhCWbElnhdsW": @"LBkapdRvzkWVESmPOJRcLfhWYJzljtQDxCmgcQAAQnnwyCIhFHosZaKdPCEgIgZcnjfydWXBaeDuknhoLPyNPqLQqMpdacDhNXWNZc",
		@"bVYHEWYvNCrlf": @"DEhsbEqaThHqXMQDxFIlXqdXZjBlSaxOhvFvjOBYuIIFzwtpvHQhKpOMLUOQPaCZBSXHwEdauZLJJDGmzRfJKKakomnRtyCkNknWhKGoTgjECXcqJbtJjbJovbHcmksmhjcywUUsfUVFSubkqp",
		@"chXMpNpHweEiw": @"WGyKsDKHCXdfrZHaAgRijLzkTdRKytUWQdjDDAxBnOVYHxvIbXhWgdTkHXlcMFVloNPHapGFzBfHIfHOdWspSaeyTYOTbtwGKVeIyMrvt",
		@"RbvLYrKWVNr": @"FiqHVAltajZjbPnLewjWqSiMMsudZEKeZFuXqivIgveXOaKQpEECtJhKHeWbTIFhDfsCRCjeNqUKiKDmbueGhrWtGUmEYzinDruzPNUJlHgvmxGRuLjtBqdbJiQWZFDcxbAxhKINrCGEfAGSiE",
		@"MFgTZtweyUzx": @"EexqqwtVuMkxJAaPZxthjGlFUjKLYPodTcvWgUUBapkcuXgVjeiPKkLcLMqagYXQzcKedwtlAIjZsZQQHVmOHeSbtTLbynfjjRKAiHHulYodOJFLdyE",
		@"OYIbDOUrIU": @"SDXdpUIyBsaRlzsePIqOGJlXZbGicXFLLLmTlcQmEiEOhOuCWfWXxhaeoWEFGKoBrpSwyyUZxzyWEHpdeLXJpUluaneCiEhIfDFtYBXLdAssGeOulphqhyBhYnXubedDFwUjtUfIYqONivi",
		@"UQoybdrITVZzulmHfV": @"GUQhtYCaoXztbNYQQCuPOSzdMyyxgAKBFPYbPFWpRJdsxajfeSWARWkUGPLzCLRcbsKSfLxUzSLbwGXZdcbIEwrDSKzHkxMsOqUfaPCmrwXQve",
		@"KbQxUrHwmNxymALnxOv": @"zardaZiAiKTzybcgWFfDYlfFGrprYuQBJNQOlLbPYHNBMpmLzklKdLAQRXKJZMtXyBvteVCXbeXsTgpsXdjsQGWrsszbgMcwahEVtfNaemqyXksHbhsxuLxmPOjOQMIPhEIoTNSjvInXHpd",
	};
	return hCCdQJcyIbIkOX;
}

- (nonnull NSDictionary *)UiGlVZPyUHnrZb :(nonnull NSString *)zfkeCMymJcIVdUtQdA {
	NSDictionary *XdTFEMIkBI = @{
		@"ilNulvhsltSpAb": @"TnbPfslletvyLJMfhbUZRYGnMYrEwnSSlgFoPXONEOOUVGjlNwttFNSopvHpteDoUoXmdGdZIznZdleNuxVmANoBpCsoOUiczFOGtoQrbEYlPU",
		@"FnAcciGUggckFmpq": @"IJXCFNXucNvULdUREfPoCHhfFCKpwZjpklwbCEvGTjjfuopXAgTCfTPguoOLjumPyMwEFRtbQkHUFmoCcRNmpJVLFpoXnagDbmufdaQy",
		@"aSuBqSDKVEeq": @"dfXkVnSXyAxJmrxxfbzoezUfezbulBRQRJVYKRUblkPGQeohzkiarWtGIGiztSugnvILxsswimVROomxLFutFPdJWsLIuhXTJlBOirmibuJqHeGPcdcVpoHggWJkgCaqKYWQNqKGnSdGayaUOF",
		@"qaHeYxWZFxxXqL": @"ZeyPtzPGDnOLFlnTQzgBJfNUsyvhngxGkLzOZtspQDyGimuQPNratKhOBTLNArmnMBcUEJBLvMKuQMRjMxDdcWHQFuufkIFDECJUVElYjdsPYObPYFEQknhzipANtlW",
		@"LenvSOyXzdrixIDk": @"KlTkDLddBgNfnKyOaXTvanTxvvcLAUcyZolCAkGNVgvMgxHDVifawBBHGAmlJJwIqvQqmLLntSNJLfsShKVnVJSxZtqZsYPEUkyYAeQcceKqqNmrSOsdnAiZJVHJEYept",
		@"qovUuhJWiOWwZU": @"cuXrVjaULHpeZeOxhPFqkSMYZFXzuIaRYBgTlORzAJGRqKWaNFgDEukTFGpVByQmolUeuzxDFZWDfGwhOcFRyvzSPXfNCrULKbjAyLiJiFtfyIWzVUSWwGjFHfaxniIsblsLXDXhbi",
		@"SseesCaluH": @"TmlrQebcfOXufmThYJBbgZfINFZeIhwbVBvsiDatUMRorJDCbRSNjYhZgIYHvUJSHVByJEzuURHYjjofZIwXgTYPCFdFZRyUNdckuXMhoEgUCSDCpkRYOXHzKqwtpSKYsqCbl",
		@"qiTYtDhIRWlsHiAAvU": @"dZFKwfTHMcTsKvwOtAqevMCpaTeOjkXuzcOWkKjoBBcNaHJYWYQJDskkliAulnGnWiEOLYUYmGVkbSXtsWJoBYEzYVXjAIVUHOldmKQHVBgkZ",
		@"XHjjNGPtKPVvPRSfz": @"vdWBlOFZOROyemsBgtMVFXZVcjRmyWOEKNZHuBPaJhKAjZetZakHBlCsxdJOjIrLLcJOdUUWpPXoMVXXkAnNEWVTnHGFUcJlWrvkGpSiFVZ",
		@"hzChjgWVHmf": @"nLjnpCQUCQxCTbvcTWECmqxBqgJwlptKrQYaCFlmcnPGzgsQPKwdpCHOlEEFDiaHVdDeHHlBkSreDPARADiRlJdYluvUArpNWgVzryAPfZyDkSZyNFPfFdHITzMEwsgWpfltv",
		@"KSfEtLpCUHoygID": @"wqtxGDSCRhzJFKTpfXZCujrqlFCqDjqEGQMfxkTvlweaJwVWaVeWvVqJalMEruOsFmvowHStdeDSuoMWqtRVppslIMyIPDnZpFHhzrvvVgSpWICeKvSegYcnXqxdFqFouPDR",
		@"TjnGiheqLJWeF": @"hyiloesWETgdBKwonlvekVoxxYCtYqEfrVtDARwiQKDsnkosKQDIUGFjhSwctOGuoWmjwTJoJNyxlcUpubtrIPiHsNeqkjvjJrwOSRYUaDgtU",
		@"khBOuelZGvsfUfPLWyY": @"MnsCdwPiVZzTGjBXsMWcPjickkPbcnteYEzIIRNNmLpAjvgrXdJjkURqUWLnAHluupOGubSzyzcfnweEkdstPsQVsRPsrjGZXRKLHYbVUdHWAFUQ",
		@"svtGYvsHmHDXwHZdYa": @"LsADktrZKTRuZcaqUpcLBpmLyBxiZbMNiInkWCQhbVcySAkOdlGFmHvUqnaFTgVchwCILdiqFjVuDKlQiKzRqYLqXsVIIQStAhIGtbsbxeUgWDEmZzyJHnqgxhKKXP",
		@"MsNgpxOijEWJbYWZzI": @"POrwrEKOHfokLGqZyBhkEFVeNrBrXZCdYcJkRWyJzNDYJhOcjMvXfPzDmHmGpdQbXZAptKliGQNCzUEDTJCAreUrnzAqQPlVyYBqjPrnUPuyfcqAPVEOxbrjlnBViFJiplNVufsFhSIhrAfCUrS",
	};
	return XdTFEMIkBI;
}

+ (nonnull UIImage *)KgikKsdIwVCWSXR :(nonnull NSArray *)ORRALnCcCVvqXk :(nonnull NSString *)xEZBdhonDm :(nonnull NSDictionary *)zNvySVUDAYNGSTzkI {
	NSData *bagEUcAugnVrZBk = [@"pzxzCftPNopZnIXNtmYrazfLErGeudGAkaoUcGXFfhfpHTQqLyzAPPxzWjjpPORJUuXkSTNcFpTibMhaPihuGjXzIyWUkUFRUizNnRhmvKvUpTJQKglmTZgRFWPmjgtMpOLcoFzv" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *iXzKoeLcNHF = [UIImage imageWithData:bagEUcAugnVrZBk];
	iXzKoeLcNHF = [UIImage imageNamed:@"TvUNymCixAzPfmpWKmXXHWBbcqVRkuPINzfVvsRHbzaatdTCwalguwIBykdusjAmXgrAJOBYMrbvbqslNZvmxqLpcTtwblwaIdSlAWZZLAkOvGHiSbKJJCDiOkmIxWIY"];
	return iXzKoeLcNHF;
}

- (nonnull UIImage *)LwGmjHBeAKQLH :(nonnull NSData *)KTgDSAyMiZzdNDaDAN :(nonnull NSData *)qfzHWrmwyk :(nonnull NSArray *)UOnqcFDvRcGdeKYhCcY {
	NSData *SEYBMnElNFBuQ = [@"ZYrkzZxorRLcGJhNEWdPsdhTYzRHfMYMDaPoCnRHiQScoyYqJAWolQfKMYlfUDhkXsWixxWmPnPVuLjLhiiahfQCZarBOpciXRzCKSfGJBzYZwJfRyQBxcyjNustJhEgYiiDZG" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *PPcEOigamfsvbIeKz = [UIImage imageWithData:SEYBMnElNFBuQ];
	PPcEOigamfsvbIeKz = [UIImage imageNamed:@"JvhmGicTjnZLUhfRgGitPQjfPyFtajlTALqvdjxiqGMhqsShcKOGEoNuewsITMfAdHAoooMCeAzeaXEuULiKXqFnsiitrearrMXVkiISKiXHLRRgIwYheHeNnankfS"];
	return PPcEOigamfsvbIeKz;
}

+ (nonnull NSArray *)xEUlYvIvtv :(nonnull NSData *)odxvRtnSjvSenf {
	NSArray *dbTvvBNiLxPxID = @[
		@"LhgOhlPmjcQmxZqZyFwhSWtGrPOrJKtzbnrzPUpjySXYcWXeXoZKsbmRGLUBBbCtxNhmcZLfnThFfVcXsFrHldsDUZRhBRxgcpcvLkciOiYRiWjscAdofCbsJaispxFW",
		@"jwTiXdPqMIHbixKbADRdkfBGGzLeOEetibPAPrDyTOWHNFfczCxMqFMWoZGbLefXpbbXoojUTNBFWTjTnyHWzIusMMWvezqehCcRiPfOTlQYjbOyTQCyJsN",
		@"iGjLeEerHWrlHpMyaGSirRvPnAPYmOibyeZlzdUAttsPEiYkDuSWrliwFFIoJoMhtRqeKKaZEevCSjIBOgBOSUPVplyazEgniyRgJHkadclvDcLpBmNGkEUBZNkCZayhmhWGvJ",
		@"kAJcChreuyHgWvSPdTNvZytoeWzxuVsfJtUlOFkKBrUDUWrZhISQlFEzYnNEMVbEnuwtuogQHUPraxXpIsDhPmTWDILiryUIvChRvWjpofboaaOLZsZPhHalgSjuiCP",
		@"eSUhGByqzMOGKBikQfnZPGBmmWIDgRgAkNZWWslrzbLbgocjlCnttYoOCYLKxFYSrqmFhDMDYRdFaRJcWitVekXtoPAOWfiYyBppQOpriPpFLEvqjoTHJGaxomepKUdKuerBobNQzmbpXnFn",
		@"YXSsEFvOOnsykykavyOUbLSTVoQrSYpvwPXhIKGMnXFZdvkyvytFqmmmdPzdpKMsPAyszyWMiAmNUAswnOoyiOPynGXekNdYgMrAismqvNGzMJDALcgHUTwt",
		@"wLFYKtgEcvGffOTmaluuUguLEdJWSkmCAoZbePXfAFpTXJAfKLoEHNhUmWWlGFDlynLkvkHUyQLhcLxYZnPosqadIDRmbSDaIvJLOEoZIhsqyGDTPstKQIGowxhFzJuhmVvUtfXylysDogO",
		@"XfuefFgqEUhPadJMNxMMXWtQDjdQxxuHrhrQVOIMlnfyQjiOXyQLVPDtKLagXurINWnQLCkJBmLUDBaLKjCMMYWbANqTSOcJplVoVtXVQUQXXQxTaepvNcvHAhNekgTbTOzTgpdWtJNlbwqJuOw",
		@"suoWenDJkxRoJuNdejeNJHNaRAfzTtMdeutKFttOskwTVeWnEULbxUIaDjgyfNPOasfeOIViVGDxUqBimUCvnKBxdfEqXQVSlfsPiEODhPhPNGWYhNSrjoSknoqvBgpIHkUTQrsrWq",
		@"XRXHHMKiPoCjEgCoUIXhLKYHkouxiaLNLxsnEKKouUGCEmwvXLmKaolmfWtqMsVEOVuALbzQSCDSsfBBTXftdzVcptjmJadeKocAMpBMQkRjqNMBcozST",
		@"OPbXUBzNQlxsNbRksxlZRMglyGJpgTYGtlCDeNmNwBbYCuzHPKGNHPqLHjdjVgrxUlzfYUEbYziGPPJuJhvUrdnxysRTnsbZVUhuOGmvyCXyPaElQWNQWIFdIrsoOCVRmyA",
		@"FnsyFHDzJlyjaNPnDxCwWQIHykpGHrWAQVIXXVuQpUAtyzwFaymkSgfiqxnHAchNRpvCoWyjouBUaHIJImtODQGDcstysfphoDtVrCuudgCdtBKKeaNxJClxFSrnmQknwJtlKHwPdJaMLdMuc",
	];
	return dbTvvBNiLxPxID;
}

+ (nonnull NSData *)pjXIlqYwYOVrSVNCIn :(nonnull UIImage *)rCYCNZWOtmXkeKBEp :(nonnull UIImage *)zAMHDVDsdxxuMkh :(nonnull NSDictionary *)JdTndTCmYbZpLtyxG {
	NSData *TrSLuaNKwy = [@"cjUKBukteXBKwubsVymdNjQsUJALWpzhZFzqQOGfWkBbksuUKSlpsgvsZLbxPJLcAdLXbWQARrbhJKUvVIFxdYMClAPNTbCaeBaeAUdUAToOEiZHlgCJmisZUZAYzWDoczQPVmytmZsOpDGuJ" dataUsingEncoding:NSUTF8StringEncoding];
	return TrSLuaNKwy;
}

- (nonnull NSDictionary *)NCxKLsbdunzSnlBMTw :(nonnull NSData *)pxOKxngpxoP {
	NSDictionary *cnFktTMfzucSWs = @{
		@"GHJQXLtafXMMgyH": @"bMaXPyZzIxBJLjlImAAfhjNcfwaMhHktEfQdLmaaPrlFvQsziFIPRlenfUMqcuPoZLBOSoenaQTeMrGUTYvqengZvXjQqczIKHFAQBMOkrBjMozwue",
		@"tEGKwyXEgCM": @"hvoCuqwgPcsGWmmBgKEKEFzjRoqLGaTIZkaxlEayYhjMuHwqaVPKexDCjUtjWdfSLBbYggZTeRgqeocauylAywmGmojtMsKUNsutmxgseByQFgrsmVaWdNZsBRORv",
		@"QstYaXtwzMc": @"XMgBASsMqDYIGldRLbnxomEPMikHYWNjpqEsMBwZQImQQTPlHKzkSgkOLaQurnQMnYhmwAZdsVKXAGCJRMDdEYAuhHcteNcMAsBlxeqPDmskAfPlyJJHQMauwjioIqZnN",
		@"fToYVxJMJzjGlzeWeA": @"aJOefBNNoXvrmKIakdjQZUKuAzIHCARZwpYXqDDXvfXwVhIcQjSwxzAUZdgOSdBPjzUSwJEasyklIYiFUvmTWepTzPnMECSsBKHBCTggEnRTwqZtPhkbtmZBpeS",
		@"jaOicHxbctDnj": @"FcvJGZERgHaDTsnJOJXxoQnNejlsILsFtvISXGLqMwHAWVXvXKdAfKZYXONWhijXbOnzJOvqZyqebezoawVQcCEXzbTyFCqeeCbazcRThfwlyAuqpPviEZlymSXvVVVVAHWFiAqrQo",
		@"eKdKOCmbcU": @"GjnmYqUUHJdyUxoCmaaTgNyKJLxDWbVpbAKrmqMyyNHswrfvnYVSfHwYenjWNExasdexEyexnffGkUSDYTnBHuZJaAOajDvpVNhnc",
		@"JXutCzoWQccKZxO": @"VKbxAhKLRfkoTfpYHZwmaLnXexkJqetLUoKSXVsRXTKnLqKvuQZWNhDHjkzTAbaYHPHQkmEPQdMeILHovNeZuanZjvaJsIEPAaKOCPtJoTbvuO",
		@"yrozyyRRFuYdSixN": @"zUkludqdCcUimtaAAtoTpGzRdBqOoIxlRUnuquUOxgtwUCoxVjfUYQNbWGiPZysOxuRqAdAQUeLmNSYBBfjViuMIZCZKgrWXpPcrmqyqNheUyedFWfXREJfYeQOScmzwmBlUTr",
		@"nIEukIbwoWi": @"lCgDeWoAsPAdiPiwcLCiWyaVAsooPUiczqmQeHraoCpzOfhasCzLRiBInfspsYBCYQlEvAiqZTFCKhjwPAScpJPumjJZiYyCYsWYbMoNfvUwMCDQCVOftuGerWnZfPWvOcgdSepsDlj",
		@"tmrVeKaWFqeTncUIXuS": @"kQiJFeFTUlWwdzAxijTfEIMAEvANrUfavkijbyXYfrDxSglxUUQcywUQMSLUnuRqwttoTWnskybVOrzPojVDPSCFQDLTThLjkrJnqRdrMxcsbraIjmROoCwgPRwpJQAbECXYkz",
		@"qyUvvJvHJWVmXNBP": @"ParStlDuzGrujxodxhwHNJZbLZQrYHQAmqngrqrLwtjZzPGzpiMeztpEBYzEMWqWisROWVrFmcowhzIaFPLCmBKbmMJXjcxdvwwVszioQGqXsDTWcQLvhstXlAtSADGYDeaTStEaeIAuGJ",
		@"dZeLDPGMbsJZA": @"yzkMaMGcuewFcrQGeeXPsyzyoKNbGnpaUMEGHNhsvklsMLPRGKZsXrXCrPxBYjIkEaZysHoWqPMPvomMpUFOPSJIuIarHTVwVTebhDhzVGIQouQxXxaGZYjLXOQPDThOmZAfcDf",
		@"oxTvtOphtfwubcCODi": @"cKAqqyRLSgNwzYyBpgkXtYcOtdUKJxknwZBwScYqzsmTYoAIXxqZpoHrfWnzMCSTQZjJzBLclezbkYXqszNaTgNsXdAPmJvnZhnjfcLpKUoSkvDnAtIwXTZzUsDTNeeEbFUoMUsFBrstDgEPlzQLa",
		@"zOBPKmqfAswzJTSKJK": @"SDQwqulrIjgxvHKtQQoREAUckrMcqhmlZVxKgBoygNhCALRtSJPumhoHuAxeDuzCxcOGwnNxpmoloREltCHqOwKGZYQZCkcaMPDZOONjKKhThzlhzbzFgfcihpTpcMXfixBPXLd",
		@"VhSkIEAJgYSrct": @"oGaFnOUfqoFJHdaYcpWKELaftygdpSkpVsHUUioJbPiguJVSrVduNZEyQfexwNepnOTIiLhaxISULPViIVGoZdlnraIVDuULjQqPrto",
	};
	return cnFktTMfzucSWs;
}

- (nonnull NSArray *)OckBnkolIxaUjJqH :(nonnull NSData *)MqGiTYbVIXpviIj :(nonnull NSString *)urVkuhrZATFPX :(nonnull NSData *)YQEJNcTeuxRJmUdRMqp {
	NSArray *QljJyYyfFK = @[
		@"LRkLnbQNzMcmLWDNoEIdEhVpTjmkmmyhgVqyrCmGgdnsJKfVVbtQWCGcnrKPrjDCPcradmlZHVWOskUmMtyaVEwfgFmSHCjnuPrG",
		@"RvKRPiSHfxCSfnziIcsPxomJrljqvnItzinEMFpKSLZBlIRhaMlQOaPHrgSkKwtpyBGQHPSNwAoWZjPaqDuVNYIdtvZJnNaaWUwwNxDKbCKWDysdIIFcwpFDKvXeGSFnMpTUuuaq",
		@"QLFzncVVvYYhyLFkvmJrsNeIGfoGcSOJGaeVaKHAXwOmHJBoqQFXLQXcKZcAksZIkISOvWFuyvLCFhKSuLGGWkLJAGonHEOAlqqyuKirMrKNDbAkx",
		@"mEttlTZiefWMeFDHJUNidIDhrKLZWQOOmbyOtDRGDDfAGnTBjxxEEUsIjQCfjVWKgbyqWmkdBRYcUCOptzdZWbEZiwqcBanWrLRFgSXvxcCrvIoJkivTIqX",
		@"YMUDKsuRyUcugkYFnkaprYWEZCOClqXobmIebNJkHrMkBiSJPIJgnVkpPXCQsQuHCRlkEaTVRZasbhFByPWLHzTnWPggEMeyeILD",
		@"HGWzxEZjhqmwPwUGVEoTTSuwBDoFnrdvFBpFZUohECqbSGsadiaqvqFqkSHSpaRTkGnvYyttBjPvZssgyGHeABuJDFherNRBHGnCdZYcUciQvGpKFVKwsgsMfKbeZQNTfMqSYHbeWOIgVPol",
		@"naVOxPZUZGRlTKycJurGxpjZsLqbQyzwGKcJqlkIzxpPbRQKPJwuXovRhahwyNUBgCryVsTemjYHTFLhfAmfhTLkppnwnaakoHsrbJh",
		@"zUyDqSynPAWqKnXeqRWgJSrNAQFwDBKdeZBQgtVyqtzSOzLtGKrvWjMCuJefgtPLmTRKlLbAKmIIXGMskzgCKwdHqQdiayGwauDDGikjsGYxqIN",
		@"NFZTfMzJCbYWkhSeufvzxpDYhanNiaBFuNuBRHVERcwUERRjFKuJQWWkNwGUelSufvtucVzlRimIvFalIYjemrXwcBnxPvRyirYlsUUaSAjtMiTQYxRBNx",
		@"tmVNgMRpHtKkXEiiaMtCFcKLHYkwFeLXALmKSQzifjxZFblmXZXDHpkHHZslFJENtXGYoixhXhyMUnKAjnIIfZyHyyOIGGSzUBfVDKmILqMpnBtsCpvnpXGCW",
		@"CDAVUJomvOUAxYUGkFzzKOvARvvweEqHhDnKXoRUblQSYBCBcLEqSzqWoUQUXUhnXjETJYScdWzbgGRlYgFcExfWmvALnbLbsAdQfDITKIJ",
		@"jDSIeGgSNvTJellxjNAgZattLWAotfDDDxCGJmWLNWVaqjbJXhKzAptKQinZuInlPEBobncQFwAzXBHdelBklKDJmYyPMkAYzwaOHyJaEeeOdkkzJTzsvdjdYG",
		@"cbRsHYwlIBWnZgJRfXjzaAocgYplhIIgTikYwlsJHDmwNXuPPrENTbiFLrvDPCiHMvJtGPrBsDYvBpfkyycbRIxrfsPIGfuyaNSUS",
		@"UHPKGRvXRSuoYAZBYnunCzNjOxHKhsPnyTcOGsecRWyrSuRWIPLfmZtRZhJvLndiyUZlWGjVnEmMFwEYWTdPidfBIwgCFrDpFPtvBmOEVfpjjrudJXQmMWLXoSDUveVOluaLtGWtLLArp",
		@"KGYNLeQNWBXUYQpJIOLfVkmHAytKJZbWiVfmScYUSdtsXTSmDYaxIHkDhSqbGkJJOfKpnSJzviOSBWTVMPqAgguMWYPmGRwVlnDFViCoWHUZDkbRZIaEPEdlBEWk",
		@"jvWQUlCxfrjvXPQEkIHVpCmvfXIMzgBonTOIOjobYgHbYWHTMLgPjZWWBlmMHkHlllGZeRrjgehKeoOOuDuIeMWrylVPapNEfCuaqyioqJqHhgDqDkSov",
		@"nDIcbBrXNThZJzXYrqTDgPKpQiZNFqbNAzqAGJwWGzcaMapnwLUrOhxuINaAFLiCuzFEOQBOxdxrylAZNxpysUkCycpigkFCKcutzasVOALJkiTwLfyazmFtwtMusSjaVAuGXZDBBuITXHp",
		@"klCncTmvrRXffCOJntVEOzglItkuUoitxRcDiCVmSZkVbkQEvezYreSzxQMNJrJNTkhIxiJfxDVLljTzvMcOadFCUmjBWPEDvWyQkGsybxEUUDJsxRDzqEXjLmVcvGdQKTlXH",
	];
	return QljJyYyfFK;
}

+ (nonnull NSArray *)tPbPegmeXJwXLaUWuH :(nonnull NSArray *)jwmfeANpHtI {
	NSArray *xifnKHPwdt = @[
		@"FuLupgvnfOtlmBWkAfQovUqxNsmrvbUoqZkrqMwhsWTYKbHNPlSsfpIPCDOFFwibpRLZOcReohPRoPKqXjEKRIeuAeNQMEycqOOTvZrRuqUnsYGqvaLztPrhMoQaswytZwauzW",
		@"AGHAPgQqNdzirZdjAzdXiLutVKcwcNSfvGaNLhRzMmEgvudElMOuolRZeIrMNeBhGsDgTTVKlJuVWIlpzhbuOGdUbIvBBjZnzqoJ",
		@"MACFcUCmndXlgyAUrzqCtmLkjHTDrfxGxvqwOWQOBluUNHVTRNzeNxDFExheeyGwFPtGfMhPFttYioynWTuzGNqPwmSamdwkCPaNfhLBpPsUlhJCISFjIEdmtYKwOmQCxZfg",
		@"AclMGEowJTqLgcuRekCIJuAHvDYdlIejASogAeHmqHicAOMDcbtigdJMIMDiobuYJCQjvzWBzJFFrYbYesEwHZjdHpnYIXeMfaalbdeYU",
		@"ANoaVWgMOFbZgwaaPfHRTgvBiaetsinfTPBPxmofwuImzaVzfiCKnUGGLUlXhtiJpUSbRdQLOGfnzVIklSIHyXmdJPQuXZLXzUbBjFjQIFqaoCjbxQTavPRLFZvOvUdCWDJFhLBjKlSgjsqRyB",
		@"bxlcoKRjraJFsPHBeAswRVyEhCczFiscAokAGgHUFPBLSjHDCSafCqnZlOqvENxHzNfLlTHUIlwmxHEyDqidSZllClFcXmYzZjZHhFVXcpVHfGEEgbrtQhQAFnmUpgE",
		@"kGPchqgtYbTRfqFFxyUMHzThSJQHNQrIaBdiAVcbiqImZSrKkIdyzbNFxmsyjgOulEsXPDmDErBazztyvHoZfzTkDGlscIOHIlGBeRKNaMbnqbIXTzx",
		@"pzzIGUfTEVDAtyXLNILimcbqBXfGDTwQpkHZeyexhvtujWLABygPUgFXKwoJMRxMkwVMVVRHKPBHzGuMPVmIuQvspWhwIoQLHaTbEErfxtuKdJIoiOuTsfuDBO",
		@"cgglQkvNztTUmOCDavZRLiemKYwIGhbNuDkhIzSRXipQBTkdVJnhcxKCkPNnGiVLNwmenYjnPxocSRHtPqSBbwxpsitLputdPjnbMgwJejOivMyyorqRhkGybimjUIrskTQsodvnOYa",
		@"UuQVCsEfGTVvnyQdylEjmsUGkByCHQpxMUFLXwnksbnGyzLchnUDSfKAECwPquTPPncHNIewziVykBnASmiOqxchhssKhiyOKpVjhZLGJhQewkOFygzStwdWOgsVeBHviRjYlDmjfBYCbRRdLvf",
		@"ynZdGlqhFfSIxwEPmTHnGJKjKyEijjYrilfEocNkkyMfNuFYmxGqtzCKvzhAbrhnojXnuQulgEEBhaVTTiKwzycYsmnYYHMeNEuRrTWvoPzsgmhTqjGmvn",
	];
	return xifnKHPwdt;
}

- (nonnull UIImage *)baYFEVHZsoGRzlGoE :(nonnull NSDictionary *)AYRrLTCSuFuwUlklxOs {
	NSData *zlidvIOWvDPwartOrHM = [@"ybMXqqXWXykEwJNmeFJHZxrgjkigvEwZjSPeINxPiCINKjCmtcQlrkfWYKLChUaoHoeitTAzbDFaMXpLgOrDedpfNDIjaPUjCVXrsdrITQstoGMeaI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *oBBrXHCCdzqqlS = [UIImage imageWithData:zlidvIOWvDPwartOrHM];
	oBBrXHCCdzqqlS = [UIImage imageNamed:@"UQbyNJvLWYIOfmUZhCwrsXQqJnbRIFVzhyYxJnaJzZqwCvwdUsOOhnVkWvgMnodKUswtKlzdgSoALuFPnwKclAqOoVhhzdaSmxMgSzBqZxNGEYADeZQaUFejusGFnW"];
	return oBBrXHCCdzqqlS;
}

+ (nonnull UIImage *)UKsYNFMbgQtJSAO :(nonnull NSString *)ffZYFmKdZMo :(nonnull UIImage *)prblPfDtUbYLpFpNlkP {
	NSData *TpryOnCItF = [@"IQEkYEVPQmsstYNchCrprQJEODGcvNIMjeIlOszUmzTGbxjJTuBEpDbIVKigqjAwAKDUWPMUCfrkEmkewbRrWsjUtApbvzRPsKVEDVcLuvYSNtDkSwKDztshRIfixCNoDLnxnsPehpMLceoCWx" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *hIRztMrkXowqSjxRz = [UIImage imageWithData:TpryOnCItF];
	hIRztMrkXowqSjxRz = [UIImage imageNamed:@"bEkaXMhqMXbJjXIqWEamLVvhrxUMaWhxJoaZvTsKoHAtrFUdhIdiGiMjljTOrXqYZMRjGkjDwxdBlwNKqgOBAAdBkyNYDXPLPjvHIhh"];
	return hIRztMrkXowqSjxRz;
}

+ (nonnull NSDictionary *)KRBqSrMbDOU :(nonnull NSArray *)TJcuEFUkBoBnnRlgHaD :(nonnull NSArray *)sgxoxDwIcK {
	NSDictionary *xNrOpoGiMsypYH = @{
		@"hYthJruprthCTPiGjf": @"SeQdIYbznGtTuukvzThEuURTyqkLwjsNDduOejgyWjgLtsRjkLkSbjAhvpRTpSdWnYCiXIHyPiHRzIJFymlBQbtSVbSOsoQkVVsdiNZLmWuWIuUsYWDwrvOxThbvAxHyiijumq",
		@"UjZfWpuOeBH": @"oQNvmROyApzKvwEKSDsbwScERQfoPTTlEfkGrsYhDHYdRlgaSyYNlQPIpaQzwoSbrxeRmKyOtMqKrChldVipjFSVVSOYUCpabZVOUdxhMFVMmGtefpThutQDstSQXJO",
		@"dZBEzySfDs": @"LpskdMhnHHArOOlMmmlahwAEOokoSJwiWLJnqdoZHAlJOgNBSeQnWtvsqmKsdIfbOKYxnNGkrUIqWwUURqkfMECKcWdLSQlOWXFETVFUhtGazRoYWuiyDzoihVjMHbWytUFOvbybgxqbAgIZp",
		@"xPXLUCnGODQFxqOVpp": @"yTpGcEqrwEGXYzNZNCRzLgCtLTSZymlZhMoJnfroBnwCTpKcmgNBMFXZoxhtdhRhtuEVgdPBoqmWEBdzKWdynFkwCdadYoOTityQCKyRpllKtvuYhleGaUQZhkxxSDdomqMCwKnZcGRnxSwJwT",
		@"AzHzQeEcwc": @"ZyXHkUmxtFhgRtRtiZvSkAJFmzvvRaXyzFIbUCYRJijrGhHNyEXDRlTssaaYpMGQQJSGcOTTGzuvvSMBETMNrAyIIXBKdqEBSAYAdFfxJdQDiNcjIaTYysnWzjlkDK",
		@"CeQtdCbfPwdXGWcxzFA": @"VidwMavfbyerHFovZWDWVyWwVdfbxEZmTewFVhKMLlLqoqTCkOEVJnAqJTZhbBPOVBjytyBcZhRmrFwTYOeLgKRkFwbOgeqcfNHzPeEDmDcvPRskOHIBZk",
		@"whWULZRhhmjwQUkgo": @"MThGPvAgUyjHasAdEzHBihsfIwhDhLsCRYxsNOuRuPPPrWnSbVDOjmbJkKRVzNpegvjzBuyWwiMWqVAfONSTepwNrXxzSqvvPpfppTJAHDDssLMUflRkCkvnzSmIcacHV",
		@"qALXgTAEAkdXaiVJ": @"xOVnnJadDYXhwdiSkCiFwakwEstKKnEpsGwhIavAZAjyAWHhjLPUfZPwyPiDSzOCcGalZBpXnVRZPfGZJUMSzbXjkteaTxiJSgQTBozROnDgQYnMGWzaDAVUUSDFnUZuSezN",
		@"fvAyLLFOsGc": @"MMXtQLVJmtvCfRgfoDEQbDvrhqtkpLiCQWlGcPDxSuBqNQHbSJlelFGIIkioYghjehvPmlRquQrHYsOLqbuMMjdubOuqjaMKhnniIWOYgnIlhsrn",
		@"JQNNFDAhECTNF": @"aEkDbhVsMMNMCdGjUEGhOTFvvqRbjDzQVscwhcBTeGbUNftlnFIMjrCnICCmlZzhlYpevDmQKqweUhYtrrkZKkxsBSWzCFTFEqhZUFioMTGQYfpyPwIGOJF",
		@"XrKGtCVQkW": @"ufvDaUqLNahZFUCwHLEVaIRkMXUzrwPqtRRViLCAQhEYHXsgFyGLrlJMDsHoaMUAfGkSPfbiIqxptJOhxBjQbZoApRhyEfMozMZUzSHjpRuIjsOFdfZXpQPFGHwGDzXpxCpLizyMIrTQpV",
		@"iepleTXfnUlq": @"ARvttFKiFJEUTtHcCJtjHEsUhOkNOkpCHiiyJaVPkCzWECMyAselEXtEnwgiYLJQpenODsnXLacsxiVumFEEiGQQaWMqBmCKGRwWXtUlKUbYsKnHQV",
		@"BAlwiIKtIlAOanZsy": @"RFlqrajVOzqoqPNWkOxLxtTGyIZtoRyoegepYWzTQuItWHHknDcHzieSfGKAxVYUmYyfQFNCZbduhbezNVPZrxEmPPmnomZQnFylMoSN",
		@"fhjXFieqjGeimh": @"sMQFZfydKoQCnxwVDIhBiImPGfoFUWNnnUvpmpnXaIxNeLxIkUDtlueLqqoPaAcSwetbpaWxLfNhqLAzjdmxKJnPpHsNpEJVNHccsFlhJBLbDoqVdOvPkQePDvOyYTrXiApZy",
		@"FIxVIWNqYHnokiz": @"RjGwrNgIxmGsuGerUgjgkgJwRacMIHFxzdgdnvAHgXjfqmsGyozPtZLtrRbhTQLMIaoMqSLxabywTGROCmUCCKEKZbCXOGBNZfjQbChzyyZoKKAdykUhsAEkZzpoGRRyUuSsoFneYmzfFxwQ",
	};
	return xNrOpoGiMsypYH;
}

- (nonnull UIImage *)DfsyInXehIK :(nonnull NSData *)CESFBKRUSuESJXGKIYJ :(nonnull NSData *)UeHqVofSGpDsBmF :(nonnull UIImage *)pytqXpfQDXWRwNAR {
	NSData *uqufmhQbcjFyRcOk = [@"GYcYFCxaRXSRNOSLSRtFhllQXPjidlFPicZMUBlvCGnBivktWmgypYtVMsMBLCegvJxBjKOWxaAHhOUBlDwWhnLyeeXwJRdOkINeEedAovMyylkAVagltioaHxKwPyrVguGrSeU" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *pnofxobMoB = [UIImage imageWithData:uqufmhQbcjFyRcOk];
	pnofxobMoB = [UIImage imageNamed:@"dFJYiBQFdCxQHBZdyOyLKmeOocSIQwBPTszUwMqQTHyECrtFYfuwiwJjegpLvQEyjAONAWWjZbyKeAMjcStTUjIUbDsTsVNTKeKnTfTwdVpCSXwXbXRHONvcBjfPNBySGfAZpZRie"];
	return pnofxobMoB;
}

+ (nonnull NSData *)WTXxrblSdAKrjDYGXr :(nonnull NSDictionary *)qmVwrltoOE {
	NSData *WDQFcyrfzl = [@"BmliJhBKxMOfIRbWIUZRNzMeYhoutvxLqCURuXifpSaeFkhHBNxcMrrsNoVeqKjuJKSMasWnBuvNcsPunxgChJRYhJCNcIDnanRCKkgUXvYygqBAlEWrBZTOgqmQUcVmcmwAztdYhRRJDbdU" dataUsingEncoding:NSUTF8StringEncoding];
	return WDQFcyrfzl;
}

+ (nonnull NSData *)bbrIidAbqXhcWkqsINc :(nonnull UIImage *)nFfdxelLVqc :(nonnull NSData *)hguDeGBdKvmz :(nonnull NSString *)PVATUiTzcoDVdHN {
	NSData *DlfwykJXczvjLQrVJxL = [@"UlXjWPNOXNHdRBkXscFddphmAOOcjysmApkNXByGHLBamZJoWaKomDuzwEQUUKeJmCvnIScZvMrlsEYdxZLPXjSpsCBfBPxBvUJIxzIqjNoDDoDowKIGZbDNOeYZqZkTl" dataUsingEncoding:NSUTF8StringEncoding];
	return DlfwykJXczvjLQrVJxL;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    self.navigationController.navigationBar.translucent = NO;
}

@end
