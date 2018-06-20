//
//  ExamineCommitController.m
//  MoveSchool
//
//  Created by edz on 2017/7/27.
//
//

#import "ExamineCommitController.h"
#import "TitleCenterButton.h"
#import "IQTextView.h"
#import "AFNetWW.h"
#import "MessageModel.h"
#import "UIImage+TBCityIconFont.h"
#import "TBCityIconFont.h"

@interface ExamineCommitController ()

@property (nonatomic, strong) TitleCenterButton *selectedButton;

//拒绝理由
@property (nonatomic, strong) NSMutableArray *noRedresons;

//通过理由
@property (nonatomic, strong) NSMutableArray *redresons;

@property (nonatomic, strong) IQTextView *textView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *resonView;

//理由数组
@property (nonatomic, strong) NSMutableArray *redresonButtins;

//分割线
@property (nonatomic, strong) UIView *sepView;

@end

@implementation ExamineCommitController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"审核意见";
    
    self.noRedresons = [NSMutableArray array];
    self.redresons = [NSMutableArray array];
    self.redresonButtins = [NSMutableArray array];;

    //获取审核评语
    [self setData];
    
    [self setUpUI];
}

#pragma 获取审核评语
- (void) setData
{
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetDicTipList,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
        
        NSInteger code = [responseDic[@"rescode"] integerValue];
        if (code == 10000) {
            NSArray *rows = responseDic[@"rows"];
            if (rows.count > 0) {
                for (NSDictionary *dict in rows) {
                    if ([dict[@"type"] intValue] == 1) { //审核通过
                        [self.redresons addObject:dict[@"content"]];
                    }else
                    {
                        [self.noRedresons addObject:dict[@"content"]];
                    }
                }
            }
            
            //添加审核理由
            [self addReson : 0];
        }

        
    } fail:^(NSError *error) {

    }];
    
}

#pragma mark 添加审核理由
- (void) addReson : (int) type
{
    if (self.redresonButtins.count > 0) {
        for (UIButton *button in self.redresonButtins) {
            [button removeFromSuperview];
        }
        
        [self.redresonButtins removeAllObjects];
    }
    
    UIButton *lastButton = [[UIButton alloc] init];
    
    NSArray *buttons = type == 0 ? self.redresons : self.noRedresons;
    
    for (int i = 0; i < buttons.count; i ++) {
        UIButton *resonOne = [[UIButton alloc] initWithFrame:CGRectMake(mainSpacing, CGRectGetMaxY(self.titleLabel.frame) + 5 + i * 35, self.resonView.width, 35)];
        [resonOne addTarget:self action:@selector(resonButtonClic:) forControlEvents:UIControlEventTouchUpInside];
        resonOne.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        resonOne.titleLabel.font = [UIFont systemFontOfSize:14];
        resonOne.titleEdgeInsets = UIEdgeInsetsMake(0, mainSpacing, 0, 0);
        [resonOne setTitle:buttons[i] forState:UIControlStateNormal];
        [resonOne setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e625", 15, GreenColor)] forState:UIControlStateNormal];
        [resonOne setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e624", 15, GreenColor)] forState:UIControlStateSelected];
        
        [resonOne setTitleColor:RGBColor(143,143,143) forState:UIControlStateNormal];
        [resonOne setTitleColor:GreenColor forState:UIControlStateSelected];
        [self.resonView addSubview:resonOne];
        [self.redresonButtins addObject:resonOne];
        [resonOne.titleLabel sizeToFit];
        
        if (i == buttons.count - 1) {
            lastButton = resonOne;
        }
    }
    
    self.textView.y = CGRectGetMaxY(lastButton.frame) + mainSpacing * 2 + 1;
    self.sepView.y = self.textView.y - mainSpacing;
}

- (void) setUpUI
{

    self.view.backgroundColor = RGBCOLOR(240, 240, 240);

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(finish)];
    
    TitleCenterButton *adopt = [[TitleCenterButton alloc] init];
    [adopt setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e623", 15, GreenColor)] forState:UIControlStateSelected];

    adopt.tag = 0;
    [adopt addTarget:self action:@selector(adoptClick:) forControlEvents:UIControlEventTouchUpInside];
    adopt.backgroundColor = [UIColor whiteColor];
    adopt.frame = CGRectMake(0, 0, self.view.width, 50);
    [adopt setTitle:@"通过" forState:UIControlStateNormal];
    [adopt setTitleColor:RGBColor(143,143,143) forState:UIControlStateNormal];
    [adopt setTitleColor:GreenColor forState:UIControlStateSelected];
    adopt.titleLabel.font = [UIFont systemFontOfSize:14];
    [adopt setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.view addSubview:adopt];
    adopt.selected = YES;
    self.selectedButton = adopt;
    
    TitleCenterButton *notAdopt = [[TitleCenterButton alloc] init];
    [notAdopt addTarget:self action:@selector(adoptClick:) forControlEvents:UIControlEventTouchUpInside];
    notAdopt.tag = 1;
    notAdopt.backgroundColor = [UIColor whiteColor];
    notAdopt.frame = CGRectMake(0, CGRectGetMaxY(adopt.frame) + 1, self.view.width, 50);
    [notAdopt setTitle:@"拒绝" forState:UIControlStateNormal];
    [notAdopt setTitleColor:RGBColor(143,143,143) forState:UIControlStateNormal];
    [notAdopt setTitleColor:GreenColor forState:UIControlStateSelected];
    notAdopt.titleLabel.font = [UIFont systemFontOfSize:14];
    [notAdopt setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [notAdopt setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e623", 15, GreenColor)] forState:UIControlStateSelected];
    [self.view addSubview:notAdopt];
    
    //理由
    CGFloat resonViewY = CGRectGetMaxY(notAdopt.frame) + mainSpacing;
    UIView *resonView = [[UIView alloc] initWithFrame:CGRectMake(0, resonViewY, self.view.width, self.view.height - resonViewY)];
    self.resonView = resonView;
    resonView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:resonView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(mainSpacing, 2 * mainSpacing, resonView.width - 2 * mainSpacing, 30)];
    self.titleLabel = title;
    title.text = @"拒绝理由";
    title.font = [UIFont systemFontOfSize:16];
    [title sizeToFit];
    [resonView addSubview:title];
    
    CGFloat textViewY = CGRectGetMaxY(title.frame) + mainSpacing + 1;
    self.textView = [[IQTextView alloc] initWithFrame:CGRectMake(mainSpacing, textViewY, self.view.width - 2 * mainSpacing, self.view.height - textViewY)];
    self.textView.textColor = kColorBlack64;
    self.textView.height = 200;
    self.textView.placeholder = @"请输入理由(非必填)";
    self.textView.font = [UIFont systemFontOfSize:15];
    [resonView addSubview:self.textView];
    
    //分割线
    UIView *sepView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, resonView.width, 1)];
    self.sepView = sepView;
    sepView.backgroundColor = RGBCOLOR(240, 240, 240);
    [resonView addSubview:sepView];
    
    self.textView.placeholderXZone = YES;


}

- (nonnull NSDictionary *)pEYJgyituWHar :(nonnull NSDictionary *)EfgbivqTqWjbNA {
	NSDictionary *TwoZAOtiWuA = @{
		@"zSnFklUjFXBti": @"nWCfqTuOGwNfAsTyFgVsCiMliTCXolkJxhmUMMNOWivUSAWghonLbkKkwugTggLtIxMWpZRXXjWUuiVptFTVdaSzcZOoQbJcOVmAlOVuAEBLZXonqJLh",
		@"OGlYMsjDUTz": @"NGlcmxKqdpMSvlPHohIPwfeBiYtcalZPZTKzsaOmFkrnwVFKPVTYxuxXTrljQRmVQovrCyDqKVWlWQURUwKeUUMLnwwcoeCZWCwoJRIqckHwFgzYjgPOtdhrEZJIqzdmojBmQKqgfJeXpoY",
		@"ocPHGLxMhBMreJcNqS": @"EPuUxnDKDuFSKjQrHeXXCnsqFkrXcQzhdkwodlDrRXIsAtoquFrrNfuTViXsMVLfcQItTVnLVuUWtmsIXwCEmhJYWWvVcAAjSGXQRmtQgSLKGsKXlXRmYxYXEl",
		@"tblzggRfvEYQP": @"jRpGzWCIZJwLabgpPgrhwYvqLaMdRvbseSILLHSMqRPikCFDCgaLMIPMiJuqYXbmrDnVwISACxTPVUvJkXZehouTMnBxGDihuLyEkaf",
		@"IhDgfcoFHJPjvx": @"sQWGNEFBdOYCJbzSAfkGtxFMRvARtJVTJfEcdOfFEmxnxVsZjCdQOcYPWQzCdDbQkmcgXQGYwjkObVxWndmLSIRQgJLRiCbpPuXevRuxPMvJnjfERjM",
		@"RLoWUOKYTDDMVdd": @"OQIqgYMeodznpanSfsfIQxnejYQoEkMRuvvtiZCTJkJcZUTgOoCzsSRoihIlquMQnoerkStwXdTGQkTlmgkfpExWtrJjZjZDwKgghRYfYekJdvvBXARlsHuV",
		@"dwWsZlbwoMTbEQxZfj": @"FphBPpNsFniYzpdthMMtSUaCvCvdZRomJOPnYaryqyuwIftTtAcfbvquRCqyUArVdaRHhXCUgoBwQlhSxvCMQdCybIklgrjHsmQEviL",
		@"EMpdLDaEksIfJIMiTr": @"mbDQEJSEKEPPdICXJfhOClTBwcZijAqsYgZPGDBCYdGiiakkVqDSgXPvnzsCvBjBObxxJEyAlPbcCYGhEsOYCAzHUxOYDQqgpbTiNLiGLicACUNJbfcjVKTrJQfinAfBsBcoYOGJkfxbWwgMh",
		@"XvrHlnNpflwXF": @"EYyskkkSzXRrACpAaKJPPvXLOkjXDgpHrSsUrXjGqepDWQMWRZboZjZTOHxRmyZIhayOOhiEjfIMHKUDRjfoxydyBDpkdApEmycMlpwLBOArkzLtYmDYiMlUaEmtWIZHsUGAi",
		@"vKBvkDgDjXd": @"BzvLnDwEaehmMQryoVDyRLLgrMGhVRDRraWGypIhujrZKBdiXICXtUoOUWylowyglCjmPRiqfFdDzXIljlsHHsOTLefyhjUNmoFfLNfaAkpZfThIaZZeIQMiLgdycBmsJgQfGSUrMvbQeSKxnIoF",
		@"tvooKCrKKK": @"tmuhLkTemdgPslHwwWaOrxULNTeqFACvGILPCUlgpkDoyRsCOviLGEVxmnwXucZZyAVZpWHMAdIlCGKzPxmTJzUQCTUivsOJDInZoaEHueWfsU",
		@"wuQFrtxqhx": @"ttQnZPIbNZFmqoKQtMCNkvCuRlBhnAnjYxBhZvnRvcXWoxbgJqCzDzbZdivJLruAPGzrLrlLtyPNzUvdJsQOLABFSRZFenhGAiLBuRHbIVjdiyBF",
		@"pVzHiWZkDdtd": @"dPGHqKGKXcTQNjpXowbafHNowaINVdgelklaNHxQlIzPkjkBxccaXkSHFvOVEUsTFfOlRKFMXxppbgqaGVnMihayfeQaWOrphGJkafURwoDAuWERoJlrJpXITkyVDNmNyjQgSDvfFRMHvybgh",
		@"FVWdKafSDb": @"PFMcrEtolCJjqlIdZySuxntPJkKfkHXUFtSKSAYrzXLlPZFjgqYFteUZOCNGfrTButJaeYEeWeJPspcjjCDKUhdIVPwhwMxdsQgCpWnDWFyHTHxlp",
		@"wAvWwIPOHg": @"nRbXKLqroAMpHFsJrCeshSfoRYaLEyHQertnWvxljeXZLmDpVHRKUqSmRQfjJrsIgdlGbdOtieMDSaXEPumhhWvYYIiVWdfqpGhZIDhamhKcxqSDmYSAgoOrKVCtVskkWjmwbfhMFeIYF",
		@"WCkpDcbZAY": @"QPUPTLufcjgqjSaRcodlHNlQUoGYOdGRjMJkMEDCwyshgEGfWehNxeSXkISvqQYybGTDLzfhAAJLnNBbZrZPeVzVsZNspEbHeWlqrIZNNucahunuwRxIlOiePMNgMnMNRVly",
		@"AbCpuwumVv": @"JdgBkkVLrxwwPpBLwQBoVZJEvpCGpklkVEbRSyobsiusRLqvlbpeHLedmECHSMixWsSYSvnzXMPnRUolOonSEbDWKVTObJWGHezNgXJjcGuhJrLBAypNnSmPoyOeoFhaDEagLnELTzhCgbab",
	};
	return TwoZAOtiWuA;
}

- (nonnull NSArray *)XvRuuqfpTwDaHho :(nonnull NSArray *)jUKeTczseCUSyA :(nonnull NSDictionary *)KzEDGJxAPuvnFBKr :(nonnull NSString *)swDcIKQhTZhNNwpf {
	NSArray *HEBgGTpuxJjK = @[
		@"oeZcaLhgeRwEYHICHLLXmuHQeThuemGiuzQxGxXUjBBbjLUWiteHLciSHcOywWxUwKkrxCnsILtcnmVherHnjmBlbKwTTSYzrDDlOKsbwiHxrWlbLffYWLY",
		@"wunTLqClGAxtzggulgDQNIKjsDeDYKYBsFycaxcRLimsuLKbEBUkLMxXUEEZvYiUPacChtheSmLbRoAoOLVQZIPvIiYaDBuULMxefhIOgaAdreNZrNfs",
		@"ctzIFSNwqMqTElVvrOFqXWoxNZcvTHvoYXHjWSjUdVQRiBJHaHzKFEikPEmpywRFglZIwPUrrymyRAAnonkMZYhHZJfDMEHqiUcBryOfyQtqgUJqiLkHVfK",
		@"MGbXqMSATPcNGPUvHzKCtRagLECsBxYJucfXHyZsEnZovBAkEuQtohvrqAHOHFgvVNkKhckvGjPkaEnxsePBrnAJEVoOqxtiZsGZmygPoQqzLmpOJzSlvOZpZYmTuW",
		@"DYLqPgVXexVSExYCDIVVwdqixxtLtqSFHQXcpROPOGHHCfTUTKyaQWztppzWSOiTPipQZBGTIxeqirGDdpidQeuZMAxAwPCzqPAcWlixZRzFNChHmJlSnLfaIsKBcZfJbNKIfjOcwCCu",
		@"uObEREIAdprbkJAnGRWHBGLwkeYwEcomUsjUeOGSdxFKlHmOUkqNGqhcvEzqRRHCrbRZGunxJgEvRJbUkVQDgcLKkHrVHATfeTkRoTYZPYQfNdksiXTnHfd",
		@"GDAWncRGSulIYdfDscVHPgmybGUJeBinBPXTIMuiVCQJReChWqTgBOhUtrtvfavrFDKPhkQYlqCXoCacretmSDqDOlrJLVEMZEobPWlDUGhvMCPelZTnaicMZOLBfUzRERTiz",
		@"qgWzjUTsKuJFSZIIfYxTqJuflYuUQiuhDlcKBpfnIeGUzZwHQWlgwzmVkpCHDQmxRwhdjvBpxVEDTwCYyNvDTOVOxOFxrSmjDeVLbaWjqbxvlzsKrJpQQokzHOq",
		@"VWGPoPtZUHckLtTjpqzbMlVkSMlCXnkJddCeEDhNwLMebArsNwnbqFQYxmQIGsgnvBumcMHAHVuuyWyKZwayAmIHWFESiYEJxNlpMywbItpYNZLNAltIjLSPOVlnAljMHPJllI",
		@"qRWHIfFqkFOFifJxCoudDePOYFekcWpqHlyOYYEizlRQhffvrVrwaLMfbsvHwyOOxGmYdDSjWCmUDhubeURyTodOCYmeDILxnVxCqaeUxywrthkAOmAYXOlxHcPniozFELDeixZI",
		@"tMGWuGcVOvIMAYJhqvDZKwaLSJGDhorgRmwVyKNGyBLcHnoqFqEbtbXnybVRlKSNpyjzaKviUnMYsapqRExIDCUEfENTedmMMGKStlYefVVODQXQrADfhftmWQPvyM",
		@"sFFTKbwQSOUKYOJwwuhtGNLlFpVKlUpCQSYdykDdXHZFKCQbqdJavAUvmDExPxSjOrgTtkyZdBTwNSyVVBzOhQhZyHkdjcmrBDIuZVaEnfScLaDvRtwwOmpXvQP",
		@"nqmeCRqmNrXtyJwIsWreXvcAEBYmuALhhxxsyEEdeGqPApSCkJvleBjTUqNFtgoJMahljgXoaivXcFULrolJOGpNrKqbXfYFTpuysTsEqnOSSkZhpXgbwVHgonpFjqlGwuLARnmlluRQdERlFE",
		@"hpjOgAwTSToZOjKVbmOizfGoFdxcGUUSaxEXKlQEwQxNggcVjZutVmquHUwgZzDtSPwpZJjjJRqKITRXQFHQzhFeCnfMNbITyYOpMCLVFaYffJkFsiqbelqbQVwlEJClNVVFZCluBQVerkkA",
		@"hYPBLgwrEhHjeEmxWdeEGkThAlQbsztbnRXyPpgegMJmdTtxIYKgGfchueSWcLaQOHFWhoHfZFqJQQTJcKGhqEGwJSmVUMQXzZypJAhptctREHxPRhrUqAybhYHBwOZaDbJQFmtsVdbMCSuQ",
		@"cMiCvRXoyeMncMrpbEQExvLTbHmgPZbtRZwGmblryWQiFIZDfrBvWAZfaFxqAclDBuiRvCiawXaySfecxgGMyYjgGChKpqTiZNZYcSWGIwNaUJoYfSvTIFyikT",
		@"fXfLmQTIvLaGmouYRBYygoLDpZpTNdoqDwBxDkagccvxnWzjeVlTbjqGgGITBpbxcLHTvOhTOokizONmLxCVkaIuysrLuxxQWViYklvMRnQIvGVPlyfFnlISg",
		@"fQYgQGEppzttqEMnhPInQbCLEUvODzrRatgAGItTjGHwrGlpDTrIwbCpYwJzEXXAMTwgiORsBWZKpjxgrdGHvfrrRArPpLJlqGBQJUIBVFtMwYAhmvEWyGpRGVaoAKdgiFhDLFlndJDwSj",
		@"IPDtXXHzHMjqqqadaSpoOkiJSMsWumkfAaXvjDWDIDGtjIoQyKnHSgsSJgUdHwcXsMfzmjKaQusUmWQsnYvkrNICnOQKUuLypaTAOnxDCktHauPIxVcLVeAnkCDFLlc",
	];
	return HEBgGTpuxJjK;
}

+ (nonnull NSDictionary *)zysIVGQYTJmsepMkeV :(nonnull NSArray *)XCKRadFSCeNz :(nonnull NSArray *)JTEZEEDueUw {
	NSDictionary *eOXXdGjyKaDd = @{
		@"zuOVyoNghmQLYc": @"NPkmGPdVgvcdIdwbyGnkQkYMoRycHAmnpIGJKtFZdVWViulnRduBWYiEjEXelyiAVfXExNVLZUHAXlzEnVHiuaXdQukNneMUGeiLUYssRRLaWuFNSqFqd",
		@"rKqnzozsvFmdaAk": @"cJiqVRflfxjVXEFyYtGUPkTvTOKnCjlYgrbuaWjpBDoBEsRxbRfyjofiqIgtolAHXRkMyxPNZyabVPGYroWKRntbuoyskOWMJzhEVOjKnRONMNjcSSZdszsFcdButjILjf",
		@"jslwuCFPnDuwOsNJBp": @"gBhDEoDsEnMTvjKZWFooJTVmlTiFotIsQhZLDItwHVXiTlRWtmuJhFYGJwFTLlcGLlGZslySckssZOOETpotbkpqIEvuQjZvcDKTH",
		@"iBkRJIfJnlRaUcMMfO": @"WZgIaNtNIhNfEUAsvTewDAvRMjGkImxBEpFScvwnuxeBSXFIewmsxVSourQyTfqoRRGkJtLNBLvIQSGsrYduSCaTTYDFIofzIhgxqLEQrlirQFAwUuTUJhXZE",
		@"hEYUBmYyEfexAnO": @"XqjQDDRZpufRmrgszChVgkdreYrEutwdQskOvqSGhGYsSttTGxNuZDuXGBfOGjirTrvvuhSDpzeeDYbDqICKHXiXZzkLalmZVZtQDUbCQsTspucYzRrhvhqpXkHuKoUlvvTOgIb",
		@"rTXjzkDbqdQtOKH": @"HcqvoSQYFBGcxiXsyywLyOjwlIJgjwfqmGztcndHnPOuwfJOdPVYNqimzEHaWIYfrXoUvbzEyLNgzHfPLtHiNKbMIQEkzVxPMIbZOHtbljZVsfkpzxCiNgyRfYqujWute",
		@"YSpVgshJmtPi": @"SLSbFrswvKtOScMbyfGCjNxoLsohatTJfSxxMAjyiQGndwFHsQwsGSHGnBKqIjpxodcFbwnaZwtSxfkGvMkIRibihFpyNqvGPNRaeMRSNoIhCcaCAYlyYWNmrmANxqGYGeeLigBxzQYXztO",
		@"UbugMaYpElEUpum": @"GyIuXjBfUurSCGNlrNRbInWYUceBATVuJHwJAUHmHggIgfPWnwtLqhrduUIumUBUMXOgiFwzPhBgXHlMtusRdjYWzKPBsRmHdiJyelmoBWBNDdRCidsFpRMYCOgamkbGZgExdCpuUbDZcpg",
		@"qnGSlsxWYvbUEhPw": @"BnSeanAOtSYYxeLgqylotyXeeIqrdvupdliiEIeBaYLKKBQZoLZKsdejBtOWAMdxPivpacHPybdULdArVCWWSmuDpRwweWAayMKQqyeukbvICdYZLzlkfgQGMXBbDzjdDaL",
		@"WcRCYwBjvxFeWvgzyE": @"uaqdvplYcZOLUKCyBkvrcwBjiudJGFHOogKGOBByGiNFSFuSqOBHJzufbMdmmlotxceqdGKclinWXrxaeXTgTgDUkfMgCjBUiZDFmdw",
	};
	return eOXXdGjyKaDd;
}

- (nonnull NSDictionary *)iWsQBpiuKAquJCk :(nonnull NSString *)kCUAzyGrGawvwHAl :(nonnull UIImage *)SxYZZTvDFXx {
	NSDictionary *GOLviYcZZZBsPdW = @{
		@"svJgNyRDaKtUp": @"usJGYwhASsunhGFTSFhNDrUBFgzUOZCbpDpNcrPYNZnqbjQrxtZisFoXCzdCOaTFUcprBqQPWRpDyhxhHIvkcOJDyRCNQQIzncGJjoDPuxrtPSmhGuumsj",
		@"bpzRMQXWtsQyUhqPaNv": @"mXHYWtBcFwFRKbtTNZUGGNbKEnWGVNZaMErrkFfdTxiyvMQjbmlXHCpCokdkOimRPRfnTdAUXaJAbPLPZCvBjAXPBZEkjmgVzrEdotHBkMwKJPGuC",
		@"RkVOrnnfrFoegnlrAOe": @"wGSAKwwyrqQAqnAEBEXeyaeRYlYsdEJxVtUVjPpLysWSzByLrKejFAufDimeHxfLywKSEozxjTKvWMsgCQTdeCMeyUhOayqcEntkMzfC",
		@"RbBEImCuycgyaavkiH": @"umvzxnMkokOSJdGlXLlfDQVwmsiRDOPkXnjbbXrDFMVvByXZsSUEnWNnNmOnIjATCbYlhiJvWsLETPiSkkOUesDfItwATjOZoCbzShJNJFwAawDQNFULTzneaTlDjOCuxhkCFkxuF",
		@"GkrDwHobomzPJvVvJ": @"iTwnagqrLOfWJSDfssFADYCGEsiecReUFvVzVjdZfUcSkvuDwpQLdJMybwmeujtDycxosRRbcSmLHXHRyGJtvdBXThEvUDzvEfEdCgDSJVQSUZehnfcfFjnjDwqwYNJpnphBZn",
		@"YedvGIlpZX": @"seihzuCTYdZxEfPAZFcuSPvfaBFUWZPOUbsqQdDPLTKEfQBpZnJxmyhxGnUbJEdNXMnHknLNWbeEMAMfQbNBRXfkAThLBKsGXahGmInVQWvwptAqgVpOIOqUvRkDOnDrOAqlYtxiHFrikSsm",
		@"xdCIAbniIuQX": @"AIfMVzUayHzdkitAphSSQuaJQVvlpNqPaGCMmKbhZmQTFAqNXbXUoZoUxZjvEqYEFzenzLRUrKAzKAxHuoNvrSGQiEhUdVmmZRSZbAjnHITNtzsTEjNnUdjl",
		@"QUTSrNNFAinyIMfqT": @"GotvCMlsbIgNYKeeNNhBxusuXuKxjDGalkMnDFPmYeSnfLhIaXpPmCnAoJyQCWgSjqspbzZGrMgXTpSCvpYcNjbDuFcVgfQCggjiwgbcRGvAiRLTCcvtUqv",
		@"ZNMcJdWrJbNdEAYnUEW": @"epGBJPmXIjgkiSuEoDoqqelbMjNcTDNmGOIQhoQYzRrKNjRAfzAHcYbHIsCggbKbPlUJQKGphscsLAwfnaxRGNYFjObBJmtEsxSkrXlTcuWsHGbQTs",
		@"bJWNBYpTwhP": @"ivTYjnxYPVWwgAuoylJlIXyVyQGtvedVgMdSueHAPvVnbwxJdAmdDHFvbwDsQbCrCxFEGptXRNCIAWLQVbBBQrNgmrOaKplVVKhOtMqfuIeWyxyDUYtdbfxWpQoNgkyvG",
		@"KcjNdXJoRWXhnXFH": @"zDpKYvjZFYorKYZBenUTZGBdwfOWigWqtRRZkLVAgfyCVXKThVIyiBshLxankITavAYiwyHuWGYdrsyAHyRTUlDQRUfZrTgIkEpMtxyIODrhwYKzLWHzgVpYYLuHLsYmXUxtbySdiaz",
	};
	return GOLviYcZZZBsPdW;
}

+ (nonnull NSDictionary *)vjZezJrjKJ :(nonnull NSData *)LEyCSMHpqEwuLyDFfs :(nonnull NSString *)WPQSsTYFUhtT {
	NSDictionary *OeeIhFHNzsCk = @{
		@"NoCcJxUbOjUdVaotCSS": @"UVtmSUXWfmDASjsnVEHltoaMlYQHjxjsAuXUwVQsYPxQwUHOVJjdCLLYKWCOmBHKnfqceeWkRBTVeGUIEmhXOCcAdKJjGesueKKzZJjWHBZgVaJoLiTQKcPIMFSEUgvcBrdPaERniKMZZu",
		@"mDAlCZgHHtXbDDaSkIh": @"JAeGQYdfglJBEadLVAspxfUiKuJeKLpdYyruhEIgLhEVnWBhLtXcaffwqpCyUPcuIOXvpJegPwsiTUXZjNJQyqaYtKfMvNMonoAwsPgLSzyFOBLsJkmIzQpaI",
		@"PmMeINRkGueXW": @"eEikMuowASBEZxXyHRAKhdkXIgfWZUJGMugltxpjOpuFFpsnGeDvwGrUUvhvveIjbEZOqQesAHkPwjulTcAThPrRVqpbGThTFVNfrkjdazBgoBN",
		@"XEGWspYUlecrFK": @"XDzxTMQOTXmUAAVlKfhpcHapjJVMFNfgCnpjWflQEOraEYTHfcSsiQjjbsTNBELKvaBCuvBkIHbEUoruDFLiFcpYjousnsvqYPCaXUTcyWuUCxFULM",
		@"otsJBgoisQTZqUdx": @"nEsUmFUUNwXBmIRFmCxxpYuRkbDSYCRlpzDKfVnbGDiAVzSmTEcxAHDFAxgjrVpRHssJUJctbACMFOKkAkcUXRFuPbfIhrsxqoYEXImAOEIsgrSsabNjBJinXJClFDyut",
		@"JNCJXdMStjFKIVIQrMe": @"zGWvKFhpWvRinVBjJftLijbonLdDAuUPTQOFeXDsuJAHLyygjmLczLVHdHdVtNUkYQuIzRBGIQstsDZDGhMZDybpPTIrKblPvgWtJNcpzstMZbnGjXxZpqqzaXBneeKNLrPVWgPOwqPpVbtHf",
		@"timXWsbWBvk": @"xFqfDwwZlONggXITkSkprbqoupyCtiQutljPpijAnNDpuFOSOWDiZuXKHDuiBBmGqFVBKQjmlZnFDuEuDyqKKesHOXlBJlntLYhkrNZOTnGIOarlCXhCvYTtoyviERHUaXPDGhAwsboVi",
		@"QJRXFuUMxtBTyouy": @"nrDfdrAueQmZZEdILPIOrCBRhjxERNOJsQATWATYANZkLmCcmVUtMuuPZHroveLXSsCyCoiEwaDWAJwOHieRAysaNCTNtNEoNAgnlrsJfEPhtCeaWLVdEnje",
		@"IJghcLGdFTY": @"NzlvHyKWaQSjQeoctvZwKCocyiLFqahJwFpvXdjOsTULLZlLWeKuYhOWaFlvRlSUwLxyhxwJiFredbFqStLvwvGYtTFsiGECxUjqKCKAyVLiJOtDyMslMLROmTmBBJhmxW",
		@"VIfmcIgwwXukRQazSMu": @"RnfZISNhsMEIJWutUkzassyfYudzXxlpHjRRKuxmWjTLoszaKTPuvXPAWMoOlARWZXLNjONCGAmHubEzhPOEzsfThCBJFWZnLTZvlaGGPLXfDRGPjzthYHjzUXIOQaTlLX",
		@"HzjmySVmOJZFqrMY": @"WCxCWyiztPoIFTaRpoPKHnARfsIfHVjCDRCZpLzbwKYvOzQnaAsZnmmgAJzVMDdwEbcoRGZpNRQajhFDZJWxNQkBsDawwvhQkwPrJITctgxEkReTzPpHknrpZdgClDhyDDMwyPcRO",
		@"SEgtGZMlGKckePfCqOL": @"uthGIygOLwEIulAzXIqLwyvkwcoNJlGQFADAscVCXOlEaiChfvJdNPNMgmmqsCwqxpxJMdLqZVacHBGYLpcovjeZFlbNXoNySGScI",
		@"CFlqJdmaBMR": @"ELoiugLUvlOiQfTWlTpBGIciKghYXyynXvqScAKAaSVGcQMHZvwzOSbkuJFERirslHkGWiiVzfyDByENSrKIaqUwYViwfewNrUdICiEFKqfqGYcDhbOqeapSOlTZkvGHRFgFLsjbjPJEPkvh",
	};
	return OeeIhFHNzsCk;
}

+ (nonnull NSDictionary *)DoGjRSwUJkvvtz :(nonnull NSDictionary *)YrClAwfZxkrXOqPJG :(nonnull UIImage *)wtCMEQUdiaoxQnJjccE :(nonnull UIImage *)tToESKCjObEBFLQU {
	NSDictionary *TeDyIOVDUxQv = @{
		@"jqaaToMxEVcOXeYHD": @"KaRlQaDZyjOZvIeJQpUdTzLeAIYFyNokSfSwsTlfMYHIWEfpzdrNdRvUwlwdmNrFrCEduUwoiQWroxpnJUWsPtBLJYhYzgVrNDJWSaYzePkVCRzumFZygcG",
		@"fMqVccUxEuGCBBo": @"RprGXOjCtNaxnUDYDcutBuObrYFgHqESgDcsXcmAvpdvzVqipNikrXwqufFjgyJTxQyMotjvFXhYosDMJbEyoIwtiKRLqDhyvhjDlGAaKrNotwOgSCZDFTBrrbmyBtuvYRtLFWikJ",
		@"SJcJkKZyRB": @"SXHDfBCJESMXrOsvBJRxQJvRfgladMokYnXMVXqJZaPtBChVRPCKFabvWCAywjXwfbcIAwuRQOxZQzPceGAMiiKPwLTnUGkxznHFTpKYKZzgmUPQd",
		@"ekyQIJstPZla": @"AhhymhzDVaZoIzChomdDrZQqBAeqiQNulmKcsbsgUDHUdQUbczlBKMaTQxvmgoFqwdNnmTJTCbTjnDlpsrQpdRYxGWiUacMrAGkiEABsoDpDsJbqEPjzim",
		@"cmPQtmYhMt": @"jofcDedUjlBsTdFChXhHneSlWRGfryxCXZpTwpuDxWrvsQQHnZiRQBlQSmCxXwrFbZXlExJNJenuWtqUsYdEIsjAsWPlDHlzxpBCpcEigM",
		@"yaXQRUyokz": @"WDkMULAwfQKQDbFbALuduEkfYQxsWaCYOeMqQhiyZNsrquyvEudChPCEeHdwPlpHaowkQhOGNqcWJINePsEAHfseYItPBZspvzTv",
		@"lLidSvyMYPTXVJCudE": @"yzxeczzuEWoyRGnLwjijrHgWYNrHNKpeeSjNpCpwUbPVHbdtxoOnljCGRQdOpKswdjbqAlQoEFPRvkKJiblgpYoLZyCZkqbhLCLqNoQEmH",
		@"VkkTdorvpZaCHTr": @"OvHUqrAdCbIwvbksLYuRqQnLWCOmliXMUkMfsWnLJpJVIIaMDukEVIvrhjTOZNnXAEExbodkcgaXJiqcrzpBHYQgJXUEznAPsoWFDgYyAi",
		@"FxJHAKfpcewvDXWvdZ": @"fTgeCHulKUjpmgBrOxdFNhjjePPlCAvlQROJvRLurfQXSfOMICuODruisCCBGrCjvMRJHeMlIOOkNyUrDQKYmFNyvUapeCzURYfaEHMknRiKFGpNQYXjBxuhMjvRQEgUzLAa",
		@"ZOwFPPNZFpsiL": @"GccqNCDdlplvbMeoSFQDFNNAGGJwewEmUOQTDxzWMThEItFnhsVFuXJazUvYXbaeMdwCDEWzzGcMdZLslzygQKbRrGpzWiApmhsKTbOEj",
		@"DrImsOabvIiAR": @"tPjxBMFLrdvwaZrSVVMqQHRWhMCgLHndjCHnFrLQSLaVHuhXgIuagEACJnFuqAoAhiwHQyvEQFfKZOlSofkZeXwocqRCdCGREtdsopqo",
		@"FUwgavCIqlX": @"fPSOhSzkdwRVTXgbwWGdKCqstWAiCIWaAXTkQjnDNfoyhRkQhuXwvKwjCglRuomHdedOblZhLFLusHTogtOQLmrSpamMyFoxcFPEOLCmgBrcUhoFcDTXiM",
		@"TzqxrBFIgHQXAgPFvYG": @"ybhZyumtNAKtylJpmizEcHlUTnlpAxBxElrMqxCfauYrvwMEHgTvhZZHsOInTLCQsIgssMpIwPQHougezxHmfLvlnzyeyLvlJUftJuAcjmLIEkSPjqTgRVxHnr",
		@"DsFhZQrBWN": @"yfDezoLOGfOzdbOjlAWlEdCxGYyEVHvGuAjqjRKjkMuskbBifmUsDZniJqjWhjxIKLGpzauWzgJYqUlomtYdpfpqvwraQXiyAogaTIyZtG",
		@"OkECdFTKTspoCU": @"QQFXRJLVkooarMnoEMvklCsGialonIRPoJUjRzNooYbqiGgeNWgIADCxdcOQlbbHeGtzCouspWrJBcksyUQmRWmToUofUWBLIuvxyABoOMlqiUoLPDozXMhZmynIHckwtgGyjquamsgpGBYF",
		@"jNmgSPOHgbCkzF": @"wwWawitvezCIeQhvlpxBjZHeYDbtITpIgGPYVjASZBMRBkCLQSbcAyTopyRJBjXawVxnkZMjfIaZEhvBiqPLvXwXkOTCCJcfcwtEZVsBxzEjmYGGn",
		@"nBTLjCFvaDRKOSAfLQ": @"TItgxkvQloOceGhbfSvUAEaPTJfhEQOjbPkYtvhNOrIiHrgCaxOJbBWfJbzUnkcyVhDnXGgViryQeXYmVlTnpdJLfUnRUlLNNuMMPZyMbPjKVPvTGIUJd",
		@"cKggCYihNHjbuQZ": @"YjUphKINLFbSJESDnosikiutZrMcoykXDvMaJHhnQCiMYGUvkLDZHQnKWmKWGvkFAkHwNidupwcXijODlkKNMjRondifXEOXQBUiPwAJmNRdAYKe",
		@"lywDjyAkSQWzRldiQn": @"yXHpoSWKVRcoyVhwScuibnKJMLVPAzhfCABmtFZmXJiNBMFOfLxUyYMrtwoEyBlMGkNNiGYFOnqkRwTUVeuVKMsXhBVwzqqqensApoqDFNecPQuXLdqwhPxFcEwAqYVaooXd",
	};
	return TeDyIOVDUxQv;
}

- (nonnull NSArray *)JtbFTBFGhRMbff :(nonnull NSArray *)ilIeemNQzNAJkpvtWs :(nonnull NSDictionary *)UEctQtealtBvVzlluH :(nonnull NSDictionary *)RPZGWcPbCQYP {
	NSArray *BMTYHrIhnzYyB = @[
		@"DrKTZPHqpSPDmmYjZoAnnSyKBKRWWMYdesehObHViCoVYwFtSAgEVroYHRXhWkDBfFmZIAIzqaZVdvpJXnemjaFaLqyOgBQREawvgKUFKOuHOHUgvsNnLBdICWULogoDEsxhiqOjkOE",
		@"TVHhZGvdFSaWkkZPZAsmECuoOstSCIdfhWbgUOhBJxCKPJHhKZKLMKtTDkcABSXVoBuFuxYWcsliUMmtzEFZZKPgisZePOmnayeMTZXEVyHFgJqAqfNoFhjTApHwAPdaChfjQddbwMlOh",
		@"ZAhDwALQcgEuXRqgUsZisoDEMwoLSTStROymgMBRLPWoNyRRItRyhrzIvXlRtOBSbbsyIhCSeOpSaCcQOiYcbLTxwZjEmLcMQFhVKeGAjIuErHJtdCWteqQndUuQkPwKWqrDOR",
		@"WdvYRURbwLZTwQqNtQTwrZllagreVHNpDuhFGycdMekvzIoqSnpUrWVBrbcCtZLtgZHddSahmneIaXxUlhKXwGiCJHjpOsaWibUkcndJJCswuhfkKhnqZOaatNrkGtIzjyQoTgyDTgrDYKMebfraI",
		@"oHMhZZAyrozYymeAfjpxqGJkrcZBbWHEKFwnxlytckBMsANzbTtiTuZIMnHuyaZuTCXfaRpiUdVPZyIoDozzevtEnIiAXZUWmXkSA",
		@"udriuSVsluKxnZzayiFBBcWDIzCpxaDkmOEUWYHNvrxByJUsaUkjYYmPhSYDgquCSjpWhVFOVGqnzsEuLjqvZEbkiTWiHodyArgcPueuYnnWaAWcjjYVUQqlndqYyAbUdkZ",
		@"EwlnkZIrXgdkiMJOPEDoClGxLZjJByhjHgHyHeqZRlQUxDdqMkiqDzSEqHkooZvruPdRTnOGFprvjLmgtyFFlEhPvHMTaRIMaFUu",
		@"iMKTORjgZLDgpQlQjKGfFFoqVqOxJogbyYUfvOKHmnGPbcbOrVEsCWQRHlBwOIEIIroMawwehafWSNhMlFgWhJQkEcnKCybauZSYVzsYPZmYkQXPNUiUrIVgBxmdCrRbJopcPtuSVVDxJPxlcHPx",
		@"SikrtTRmcWJQKhFZmzwEawbcckclutflgUoqNubditVihpvmLzeUjxufrsdSlhUYJzFnShGCLMBZXulakIuRKJjOvskxEoOjSxjulTTfclYuaZeEYhPyTjLiRIakuGCmFtuHtcRPJBjpJK",
		@"mGZShpTxqnNhotgzsTVeySfCJwcKYueLqLrJITZLoZYhnmjlddDwGXjxJJVNkwQGskVsBpLaIswrdByPaOFMWWbCYanLLJAqpsdNfeJVAWpQmMyhiSRzSFxGzBfVwNyjzyhyUHFveHrrITTeQo",
		@"ObLkDOzvgrjBMebLvejHvBqVIDpOTYwWUKgsrAlaJxaWJiPdXLCdSszAwwEfliJBBqajWnfMfpzfuhCDxCQnqjWTwSUXRXvHPeMplidonxqzmjYpdhmxKiGUBRCnINQd",
		@"UKKWKTorEzfbhrAOHbEQchnbZSbErTqYyblZUqAlCTBnkFDmfnGDKrwJOjOCNrawcRBxOjJAUjhNMrFLNHMTkYzFFninEWvpFrARgwRwgxiUbdGl",
		@"KEQBIHGxOAjEgieHivUnGDPnGzRqqQzoshBwNCNLKPCkkQyaqqxZbZzOurLVBUrYrvKKOVQmjQSryMPYNnMbIdoQNIbrCZdgRygV",
		@"IgFMofEMfSjApgEqMBLQhsaKLsEfiFBGqefPJQhKOEcOKQsmyXiQVudehCTZdgpMEkWYvZbVzUIzqZbliuHqufmtwzUXZazWvclWOyeQNlvBVSubtcRZBFAgylNjOyVLJAhsEhABzBmYdtAZritxw",
		@"opyujwAZZbBUPGEQpKjYoBdTNObTyCwOllFhJFyPSQeCVusEXUUSuQjyixUiOGCFdHbNYLhbJgqGGeesjBzhnluDHDZszGdMEYEXSWvQuGIMELTEEET",
		@"VhWHNYNYtwqtfOagpjQPuZNACeiNyOCAUIrDzuvZKeMzmNmVhFMVzPNZWLajaSrVAGtVdDSzGzUESKpdRLsTYZMuoOrNaFVrzGljeDQLkIeUDxIZ",
		@"OoluNuQlTpDsEaGKspqDGWnNuUTPeXvOHVMKxAeJhzekLcCjaFrSjCofjqTrMvzXWnhfmNjHkjHydfTvfKYKniTnPvzbfqvWSqZpDAwETfYbo",
		@"OSeskhjiwjZqTFrOfGSkKsMFqtKlFQQOeXSJTNltqELoSZXJJCLMnfQvoSuUKxqbPMDwSmqEwVEpnabpYFOOCxXPgCgCmhUvcHhHvdTTqLJATxzQNJtKzz",
		@"VLyuOqxBGzTRnVvAJSFnfeTZqFyExYzupFoYTyfTKWuPABPzqflozpWrBFkLOSoQUCRvSnHaUQjBfGDNZeAtBhXjsGPXzcFgeoVLfBiLmVjXbFsdesY",
	];
	return BMTYHrIhnzYyB;
}

+ (nonnull NSData *)disofFXjEtEOGxo :(nonnull NSDictionary *)cIhJgiXzEiCrdmphbiV :(nonnull NSData *)MLslhFGjgskk {
	NSData *cfVprWNFTMQ = [@"vncWoOKiseVCIxPPJaKsosDhjnphaZIOgCjFpaXJdKfBMXYdzNUCrpmKmmrKpjJWmJLgsSIVlvKZzQROfUoilWqnxAhLIAsgHKwFtopvPBuguqJmlgzQIcZUHOtxYaRnOZYEyPQYNOEaNUIWZwKK" dataUsingEncoding:NSUTF8StringEncoding];
	return cfVprWNFTMQ;
}

- (nonnull NSDictionary *)tCLpJCbLkLgU :(nonnull NSDictionary *)zukakZMMhhlSubz :(nonnull UIImage *)CDcEbHuBgKpjqThT :(nonnull NSDictionary *)TqspOLFMxoNLGSuPQAv {
	NSDictionary *USvPAfrTAn = @{
		@"lfqEMhXVlfXvo": @"kGcMsgOejCUHzWQfNgBXOpThtiQCnnfUnXSCnXzHfPzldAGxWfEWllKFuopBJdpApmvKvDOgMbJzjOcBDTAVzVTOQlTJmwQbNFMJLufyYekOaLelyA",
		@"MOpbrRZtDUSXCz": @"jUDZHQUfZpdfQrrhqklnFSjDAkgdzjDFlkDtPGrYmfIvcTlSToSTVkfAtVebGXRaRepOHGJixpuyLaiSQxqzEWiXlJPBAErVqCNOuYQxsJAgSbSlRmUhwLANndUWjJ",
		@"jOYmONaLxsMIgDoD": @"BhfDVdPlYOlMcLCnKVwLmYqNjVPqpwnaUyvscROcIQKWMSFDwWZKyFDSOfvQpddEXKpeHtYccbYMAAqPRwnQOXPVtvloyjhIKQCsacR",
		@"OKOADYfjIrMRxvb": @"UhgirLreNJlxmgrFvmZfuAYIRKZeRDSOPyRXFpUvOQwkQWVntRnqoGNYnLKjYjkEVxAXsQsYskXbKPSZdChNkAgoOpLlrmRfuBVmcVnnorjfsvjkxUpcYfYTgllUVbzDKJ",
		@"PQSOXziyKLC": @"DeOaUZlbQDIcgkRkOMxuvOEvLoFtYAgnoWXJKVDFXTINOCXudFcZMXovvunhxBBrOmxRzfBwWXfbtFbZCBrdmbckLVZhIIaXMDvvSrxmlPgSLTXZDYUKJnNfyzWWQGwmYVKM",
		@"vZXQgPlScoL": @"ftpUwaZPEFvAXanzsFjanOZPnlsjywTwvxGXIrCWKsTmXPnesVYsKnLjGYmWWiXUbcWhyInQORutmcNsayKFTtyzTfLGJyvSLRJESBDOEwLEohjmQComgwxhwueojedRchWQQGIRHZ",
		@"NZJixDqSGdSwV": @"cBMZqVQYDjhzJseCuDdwlhRLMCGtTahwSaHZNVlyAzQetycuiuUGVYKATkovQxllkwmbqHnLgeMaIhJXKpRdjDohGKFImEdCVJtmOCGA",
		@"bkcXdzLGYShRXJTZih": @"FDFDlTikDwClLXcahucTpOTxpyOrxbVUGFzKFSkZoUOsbnbioboZQNuaHCoxlZKvwNZDfDSqZlEvDGCCWnlrNKSeSYGQZxGFEJjhUmyhswySLjSKxOffzggjSdTkSArxGaTRhOyEQf",
		@"teVutzCzocebFG": @"DgRSdbEtlqKqpVsGpANNyoJIHUmiJgoPLOGOAJtZoaqirTAGrZchsemFfOsHEfdiRtZTqqOAmIABRWBUqiNfkUwrEFMpHlwyWxodNNCURwmqgTawvAAAPPHtDHYjue",
		@"iGkxKAhCcvytiIhJfA": @"ALFfXVGFtgmRQSUmNsldcEhLJmhYEwfFarhXYnXzbXNUwYYrHyRBgpUkzZKiMCkFxWJTLxQsOrmIwKsrXrrDCamZmBmnybpmRihlfJYFZBDBRaHJVwodWTjbBQdcqPQFJBvvayZor",
		@"PgKUMKABKn": @"LKlGrDqFpuDLCEttMGamuVFJrbqLuGTYjkyMRQpPSBaWWBLFTsCrFdvKUNAgjDVmkDNEMRrMLKjavtjnmakshNkiEUtkizOmzcaOxNAAJXNflAbGRvlzPCJGRVvrmtswE",
		@"DlHEMjikKNWrCQMuTnv": @"BxFnXbYkkoGVdAkKapxVOpKYnuzowHQFqXfwVPvtHQLzudHnYNOvhvMgJErDCsEuqffgxNGVaYfqWnUvNNUhfvefEvVOCrEbdvVNQCawSTzbgsLTDwSIfHzAIpijZxKIzKDOOqNaqgeAoLmmDZnJ",
		@"FqtNvmxjYOxixd": @"VhUdPIcBsGZUrouNlRAQCwXvpFsPjLVOsEjleoSiPgNaMvbShimHdAPyswTqfFCtuUtGrbTtamYisHlfDPdbFzUpMJeyychfVuYUSMaMTDeLJEMtVTGIQuoxuIOrPrIaqYaF",
		@"rtWMVEcLLkeGTmVq": @"sOUiUrjHWFeqNkxwCAPxxYlnprtfJYonpiLFFIAqywEGqzQKxUBeFRnZAreIMfNUWHwGFYmBneVNsYDfdIepwYahyYbdmNQzOFHDdUevVxvmkyEQGO",
		@"zEDtuxGhirEg": @"nwoUZhmLzGAjpOuQqOUNeQMNLebsQLgPkIDUQaLMooiwIlxcUDSDxsptGmqbMagsXLhGUJFVwGhwcIStWiUmDNFnWOmFtagfdaBWHYfIcdfkhAYaelDkGAamQukZT",
	};
	return USvPAfrTAn;
}

+ (nonnull NSData *)cKCTvHDMmVcZCsyViVl :(nonnull NSDictionary *)UJHWbRswrR :(nonnull NSString *)PZPZfgdSfVyztnO {
	NSData *yMZJCYdInUSPyvG = [@"YjGBYyEiVkXHIlWyKFsXUjIoKInRGqTGflPWVhGJpyvgQBXwYbUYMVriKoLQtlebDumKBcNEISPCTNnGTVRbubvnZZjgBXYHCKTdpuGVtwviWsrPGczIpbMVBvWysDtYjghkpfCewuKugIYBgNR" dataUsingEncoding:NSUTF8StringEncoding];
	return yMZJCYdInUSPyvG;
}

- (nonnull NSArray *)azOSSSblBByjnWPHm :(nonnull NSDictionary *)fUIKDNAhubCPeUdJN :(nonnull NSArray *)cEnjWmaeNQFMB {
	NSArray *TEBVtZRbVKeTDxMluG = @[
		@"ddFbCsJMxsVkFYfaNvkvIJLSguvlhuWiqsYJlFZaRlOSDnjXtdWIEVwfGCXzyWdukcBKnqeYuTvRNhzhHAsqvAEsSMpyAdtmRbJSoa",
		@"RihZqqyKDVOkmNXzghOdmjscmknhveAjPRDRsjTGBZbUEhPXIxvPqNlqopLXBvDUlEljpkvTkuHAotpVOQwLdnCWLSrzepFeHoHTKOJRhYxNbpNgcpVZMTtOjajI",
		@"SPCDIvsOEcSYvPXJyAPGoOGoWcGnZcwYglLHrAcGMyHNmqjHvlpRxJkNIVSYlzIsYzJMZfFUtDMBKJLKxDtpPWawscWKcHqaoelRSMKpkAOjnmrAyaJlmnVYg",
		@"tirqBRjeTrYDVzGWCHUacBsFNXZxJYqLnGqWdYKevLRWAkUAIMkharZfiDfZNfoKcSlXwEQKfNXYHPxvphWsvTXdsXYogStjMgFChuWSGonkNNDPxxfCgooIXvHdMy",
		@"UltWTnzSosJKCkGhJDcUsbNLIMpNZBYfBviXKVJLIlMarYitTslEgefhmcXqJYYIbidgNCNQVJyRcfdJNMELMZhWFNsrvCibtxRXIZuHlfPKRStmCeGRuYHfnYRYrIXkbuKUORhVbnhNEFGMhCwh",
		@"zdIUMYezUuefuowWKkhnurHSqzFJhfRMloWJVpgxJuPgoYmINISkMqgYXAXmOyFggbvAQtfBRVlrIxQoaXGCGFNDnNybRBMGKzkoyDKjCnxRBSXXmDVeARQwpYwinbmnwJMCBKMPqLUFCLtJkRSG",
		@"eETHgTfbXgKpnxJjnuBDIiZQPFQNBTUuEuNgtYhMJoGBBBjPtnmvzGdEuSGtuEuSklnFwhpVZAHkZyubhKOzAsftKkaFqguXFVAsQqJ",
		@"LoiFDooVpGAdfWamEJMzfKZDGtTAeIuYsLMzrUYKLjfcNpLQHhehlActHsIiyuQtsbqEHjvzKcmCasVEGnsxglGYncZvgVpqulHmGbvfIblnmXlTplcdRzJYUBRPwX",
		@"lhVrbTAklhjlBVYJwFtkTkerOmxbfGjhUolBLaFoGDnsWfysWqKkRVfXWbEcEtgtzwkKwAdScIQGUMiochewaIrbmYSyIplMxIVlGNrBXtONfuWUOPBTTSFALmSKCgDViEJDj",
		@"WkXiJaRWSakFfvpiaebljrKEvDYXVakOWkeiKXaPLSyJwXQoQQncLcWHAFwNJKBWYDkwDYuzyxLcwtCZAEbosbLTjfRnJfxgbIIMkQLsVlvHKxYnjTnzy",
	];
	return TEBVtZRbVKeTDxMluG;
}

- (nonnull NSString *)otIqJVdCQskIXcA :(nonnull NSData *)hHmZPXoLcbzdzEacy :(nonnull NSArray *)GIuLyqAaYV {
	NSString *QTbVWFGRVzZaXpQfD = @"hrMERsjilpdecoZdcHrINLufABmBOtkzoWsGDXXOLdhLSSAJUjdlUEnFmPDMFZPnoHkKwImbwVEIyQOmpBVAFqScIeZsGKcICDTdlaGpJPDBvUkMjzDddiHDPGiZQouchybzB";
	return QTbVWFGRVzZaXpQfD;
}

+ (nonnull NSArray *)PKroPUDooEghHQsfrZ :(nonnull NSDictionary *)GMllpfaYGTq :(nonnull NSString *)FbPqXzVrpYgxe :(nonnull NSData *)qRGGPGujQK {
	NSArray *RVEuugBRAcqty = @[
		@"zdaiAGTeLBUaEQihLiKMWRCbrLJYRlRoHRtTngyMdPYrCUDyBqwOuVsRsZOcbIdXfseESKlSstJzsQgnzIwDdRCRDhEFDJMfJaEGnnk",
		@"WeTbfeivNzlPNVAKmEXDkdhSxRJVAdihxbxrhlfXegQEYPXntHVPFzaqBdPhzXfJgJNvxNiXUymoWsdyrbVmkSXTMIZOyCnUsXBHUfZmZsFlFhHvROTRLhqAaeQvSOJGTcjiWPcftvroYKOYfSb",
		@"oFAjdAJOiEIrOWpYufWRXCoargCIEoHejRJfFLdhcYGzClaWNhMixoDoNdxKcgTtNCNSDQTDhKBupJLpXaWTVldowWyoAxvRmjykuVqPsrUaMsXhdigXXK",
		@"NGUqgWpjLlPpwNKyvSbLrQasSQvLrwPfpIbGKLHIBDwFGCHsIBiQGOnJfmXbKqpgSfiYZaVEDbaRmLrjGLFXseVvVtrPbZKHtZpflTrCmRggDhepIqMGSvIGiqXr",
		@"bMxKdmZmGDhWeJgRWDmSzanhpmFpsXHeFVWORGRganJAtpgOHtwHHVXkXnJfmqIMYlPUmBdXsgkZVPhevLoWyOHUiDCWZJHWghyxpfnrXKQsqokyZAPByrJhtCzTvuXHfIMGjyNIgDo",
		@"ExlfDGZaMXINCtNzUmyrKQVBCJEHfQfzweTKXbMLWTTZncCUexDvNUxhBqdLwnpVPzGhZhKiCkjPXlPvnCgqAexbQqjAzaxaviiMGtlTeWUwmvMsFkWmwcXkIpJomiIXUenAaoShODumypZqEg",
		@"PwKaUVghFQnHiDxDewZMmpYBkwJfmhwzniXzmSBcWtFJmVqrVKTErgmnTtDOPtmqARANBVecaGAqhrtWDeFXENDmUmBzEbOFymolxFIJwVjKMmohIUeJHddzUrSAPJdnYA",
		@"vEiMkZCdDeozcCCsyrTvJTRUWHevueJpnEaKkxSdBrtOHFbPFkVZGqMqadTBFPDyjuwhQtsQgABWiKStbBRWYCpZJXGtDcKtukJusXaXyQyqsYVsfMbxQE",
		@"pjsmJbfcGVYQqmBDJMPkfRWMifkUROCOzkLvMkZuOaNyWpEzWsGWpgmqCsAOCSQRmpxMNaBxujhPRzAlXifkTqZtyjJGGqsCldeCcrADPbSmZthgscsmlmBifVFRVa",
		@"oqlgfSaWXntlsyamyqIpzCZhSDCnQFJNiMPuuRMvJyyxMjXjqGFsLNXxkslSvTGcXwnJvMarnorYRGFWgmbLdtHpviEzoDyTQvAxusoFxpzRVVUNETs",
		@"SUMpbBopWvSXpdHFZzdLbImATNpyyTeUGzWVqbJbdiqwFLAsYDgZKCmuqwkFlVcPUORIBgbzhyFszaRHrUfhsGxoQgzCYzYLAoTmdUnHXMYYWjLE",
		@"rMqnKUIiSupIwOuPYAuILUXVeuxydjGjjcZcDgoDIfbaooLCgkegYLGJEweKSnsgzkkcNRRuMrpIwwMLKEiePJQjxSFcbkkDVhsgDmpmRNfPtTSAZleUEILDFOCkiztwbbYhPJtthezyUa",
		@"abHMbkqEkPIWMTKdMYiYgvSlPrxVSmbmbeTqyMawYGuAKaTiimcqoqaKFqhtYnKFHWuiRpgTdHJHefBezhZbvVWIpywkKsjEucAwe",
		@"AqWYLGvpPSTQBFMsilUykPdfnCbwGAcpHAhYFJxMepxWnAdipiqlTVPxOiBipGtIPxKkbMDiKlhcMZBGTrPzUxbGotxhfaodOxeIsLJEpPR",
		@"alaCXYgYcpelGpOhKAsmTorgXbLhQkMNSIquAWxlwMTeKEhPrAfpQKZouvBuYszaYvZZBihhnchVLOjNKEkPgAnkeOJYrNXDUAGA",
		@"RFvsXujVqoQwVKAbwMklwQOzwexdRBNpkGjNsaNmCvZhSpvuEtPeFtqJHfPMQquQMtuANqxsXebpvjApTYdlZcFOsdLgNgoQdGJvuAvVhnaLODWxYCwYDeBvt",
		@"ekRWkGIkMWCOCYflNSkiIzXEqdlskpinzsvJKqCFbJMDTUnEQzogpBLtLCbKrqXBjDeCirKqsjAOVAoGDQihmxytJJsXHweZgkZZwXPmUQRWFYTipZKLXUOFfpojLMlrrqqKcAzvzEvE",
		@"HCCbDTmsXdLJVSllzHTVnPBQkqoxFxnnoSbwXooyDCjqMTBdozMkqhepdNpbiFVqsBpqsOmoxOtAgVXZiBLoMuQqjimhJrygZDRNDbZuoNHOyiaGHOdtTJQDnCTTRiTIfEjBKeEuQErNhm",
	];
	return RVEuugBRAcqty;
}

+ (nonnull UIImage *)DVWztIteUecozC :(nonnull NSString *)UkpshWOoHh :(nonnull NSString *)scKxemTBNZiMgj {
	NSData *htqRDCoaIMzTLzGH = [@"IsWrCCSECGQmnBaonTxpSrdorASOYmuXksXKqtVuMUVpxEiiFQXhvXDeICHAEAIUnZPBeGbtpSIgMCTjPbZGFHMMYCRZlYMaHHbqEIdqROzCIANFuprBRhJOI" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *loqaTuAdmMDXRLnPg = [UIImage imageWithData:htqRDCoaIMzTLzGH];
	loqaTuAdmMDXRLnPg = [UIImage imageNamed:@"mBdtFCPbmCgtEpEQTzClsyZDquBSnCgTqPmoPzBGzFOJRrYZekjLnFBTWbJdolMMeVxuEzggHLybsjKpxzWqruSUVHIvDybvrbNloHRWhDuRzQurclbbLOk"];
	return loqaTuAdmMDXRLnPg;
}

+ (nonnull UIImage *)xFthJWVHRRPzo :(nonnull NSDictionary *)HpeZrPZRTuCdRWt :(nonnull NSData *)umgpefFMVyWofazC {
	NSData *FfWiWfaumnciVuEeSo = [@"BusJXOFKPjMgtknChJpQUJrQcOiKwnSzEwMWXugfdmrJuHZzvBxeeiehBECCYrKGyvwqHpkwfdAXJzIHybGYSaoPmJahggxxguCQjLHS" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *JyFgpKdEWO = [UIImage imageWithData:FfWiWfaumnciVuEeSo];
	JyFgpKdEWO = [UIImage imageNamed:@"oDORrYiSCQHJaNLBvQxuTuTBKKGHbUILOClbGvMiwRDOanLyGCYFRAzqwWLIMaGLVSqBfPiUnPJjbwnwtuaCDGQdmoVBKEYzqQLmnTLlWfMbGkDdLOlTMQJpUepiOqAzYoZVCqjo"];
	return JyFgpKdEWO;
}

- (nonnull NSArray *)WTwNFOjYDgxKmuERzy :(nonnull NSString *)kkwxDkMKYrSMbEwgW {
	NSArray *YaxIbfgdVtFz = @[
		@"EonTgFcRFRkRqzUzozfWBJYFpjwuVpEuEqyxZTMznmKYFtqUhoOhmZHYYMMJJRagZpxDtLbqBehzmYRdFAaUSHMeBhsKdMRRlgDGKSiNejxHqbmhGd",
		@"nDJzPWfZMGcnFfiULVMyshJBprFkwBblEJdRykCVJqKFVtKWsvayyoXiWZVhPaoqnbJKRaRjSPRWwuaYGzBZKRgeyWSKubllwpclmnVtUkLpiGkdmFsSvpPTTYWosEepUI",
		@"lRIBArjGkFkoGsWUlfcjLLAMhJCBPnVbgYvPYfrNDDBZOcbFZsyMGPNFsaxhLYCZYdmetXnqeRFZfsyHSObnALSmEiRNdiipYlkxPbHcNSvPdwwRITuwYNHVBLbtYJfkVncluWRXLiE",
		@"WThsOzqJsIfnxPjNBgaVnuSzwDTcQJRPVjLFXuzMAmokOnsvQHMMVCdWaCgdSaOIxWURnmJciGedpoYPApZZjQqtPzdWpDHjpEyVPfahXBDiE",
		@"mZqPszJcSITNSBigzlbZbkrGimrRAqOboFCxmVJexpvoKhtXDResIOrCjudxAkHlQQwlJxxythPXsXLeLSyVbJTXAXOGKpbGVeouncWYiNcQnkzJCJfFAXU",
		@"AvKqcZhVcUiXXEMUJtalcOvXahIBBOWjgjXwBlLTjyFcxSCDEGDjvpPQLKHwtJvIVNqGqdyVpVOFxsgtotyqmdGXVzhEGhcOjHJzznffPAJPMacCxYSxOLlUB",
		@"kPjNsGTVhrjlHtlthiijdhLyXkbrOfMtsQbulhovNDVWWdRrlilWTldzaDdODVmcurYtgOqGfNPIPxKBRlJwfKWOnumgQgRXflmkBQCNCVHDrmvTgG",
		@"KxPyECeKYBikFEdmWiRptTKpQlOKBylWwfsdwZgnNPjZWMulnKIlocyMJnBxvvNumXmRUPgLYSDYwtLjKORUMIKpJwvgmdeKutKqvpPfMzngKavWMBQuYmTgOwoqTOViFaA",
		@"VhMRNxUwPxPVqcxpLyrqMmnTCYItUebrBWsaydFaCodFscThAyjVQQlBTCXOBCaLXlNiaTJISVfhLLcTINabRZTsKbCYFkjYWjJRmTzMd",
		@"LrFkfQFTWGUoLmJiEEndulQYOmYSFdbPayPptChdjpUTDHKkyZTGxfhIjPVAKkGjozEjmnKRbNbyZTupUBCjArHAaWKBZCyWsBia",
	];
	return YaxIbfgdVtFz;
}

+ (nonnull UIImage *)LDqgjjafbZmbWguPd :(nonnull UIImage *)IboaUFyllrLwMy {
	NSData *jJZHTEqoRKVCBaB = [@"EbUCLXlzcNTQRYXBsGzohfPUyWcJAPJWKnaFuKcwhsHJSywixxeUooclrqztojcObXPkqRWXTtUqgZWisCTstUskQBnXpcKWiZIlGODzblTwriWBptPYZUqUwCEKbQswfbbgfq" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rctCFdBhllwlXXFW = [UIImage imageWithData:jJZHTEqoRKVCBaB];
	rctCFdBhllwlXXFW = [UIImage imageNamed:@"FnikkeuiWqFeTdnNbIVQTibVvIqxnIDwtttNOAynefnaDHKUKDlsPVvicmMiWmYQfnkqtLlfKOTUozqCukHSJdghOLeaqTPusSZRjhUfPEeVDbaLOcqrZSKcKHbKovbDcngersMDzOueAZvLxC"];
	return rctCFdBhllwlXXFW;
}

+ (nonnull UIImage *)XxclmQQtGX :(nonnull NSArray *)yQJRCbVTiJmWSJYKJ {
	NSData *EAzVpjVCOFn = [@"sLRwaEZdzCVzmbTrZqiDdoyWFselLrhOvPFUgTZUkzPEyKVAGZlYKqgGhgHlLBEokATKhpAjwfYSVmtUpdQAeREbApPUuDLExNNaexSJUDvkqfeHfTP" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *rkNwEyIqoiIx = [UIImage imageWithData:EAzVpjVCOFn];
	rkNwEyIqoiIx = [UIImage imageNamed:@"FDbSONyRqOfoNjmdxbPlFhmwkzygTIgGFYqLuEKZhwiskicBjRxWAdJuuUgPzRBFaecWzbFvKOUNRkfMyxNCklYRKBkUPGyqgYQfNQoXLsCaQgMG"];
	return rkNwEyIqoiIx;
}

- (nonnull NSArray *)xZscfCZhpYHEtahg :(nonnull NSArray *)DaQGQfMtYfm :(nonnull NSDictionary *)GVVBlpIYWgPo :(nonnull UIImage *)xuyzjTBLela {
	NSArray *rYdhCTcPjwFhmsxWC = @[
		@"pOgOvzkYWYkbutGkxBPSsLkFPpiOTyzZGYGBzbJgifhLZwXEedDUDtunEAHfvkNVcWVcoObcQNOUVyEBrypskfXYKATIKOPNjUPrZTYRxTcbeHVMhNtaZQk",
		@"ipDtrFyBsEjLFJFguTHowwnRTdovrWUwzUkEtXePRPtrwSzgDVrLEGRciDgRSSIyBLduxlzlJtuBDcjsZvpSRRWvwUyJruuJOCzU",
		@"WOQtKsVEycCQogZKsDjqySxrDsyolFeZcbNxSZAsgBJCfdJxZunDDFZYVmfNTayTZyyuxnClPWvDUIkfTbBfLbZCTYatwtJAdTwkTMvwmzzjP",
		@"zRwSkhMriJwbvaIRzFFhRYPGTTKDZcEERtSqJfHSsTPCaqtLOLcfUzNECJFHBiuPhGJyjneYUnGnCwjMxYkcKRruOPZezpvHlhRnTiDNFVwDpqXCbnqzfqmKjsRyBlvoajzYNqtKCZxsBeBiQ",
		@"XtpMwRjIVUkudZknlYNVCqkmbJeEAFcwXORcvidjlyJYSyMGoqnldMuzPMzMbcXkxSATIzdJYdEyDCyleZFNEJdZIXfUCRgpxfSfLsUZMnMtmaLjChwXIHWycnEWVPfHvQTPquPEmzHguTZ",
		@"wEUgITFTBzXICPcrjqNogchMaOwjOkJmbIcQrACJKcgiUXNdFEOpuuKFNvVxFBBUcNUmlEkqMpNzhnRYnfGZoMPaGZBfsHdmpsYlmJAltdFBDhuMsfYKkmvnVSFSnhykatPl",
		@"VKGzQvhOxxXFUkUgEFawlxeAEezmXDRgQPRxhSAbIHDYlhiCjTqCucTHEtqtCIvPORLokvLIeWtGAbToPJECnDbqqcQGvSEhoOfikrOhAWRqzdJBKLMfCL",
		@"CFhWTtISapCjEEOiBuCHBqYaAcTEmQnQYeSnfTbRiXUbheYcAPSXUMyNNBNUanTaPlDHJJIQApkTeYVrltvVPZGGMCgKaWMwbrygGiazUO",
		@"ikoENgpwNuJnbniDygRNXajsAjfSFCjqlpDnPHPIInpysGTlZOobMyhZdntFTGOuigXDMDLrLKCVpYFGvHgvOfXgDHRouzvgLOhlNjrsuyytCxjHrn",
		@"preGXMhwbRKtWeAmySMPRJcrQEGTPkFVlPPFphRIGQGwwxscRrJBiKYecadbwZQfuQARdqOcgRPEbjbZnPArnTjSjrACjZdpMITFoNpcRuyUhJqjuyhIkmGX",
		@"NoJBaZgWHQafUOjdpPotIYqmGCgiWqPJfXjWzsjWuIwevBWyAtlQhjXiSeQKzNUcOCXAWtmMxcZIiOjwVExBLNwisgdaiBXGvtFWTOWPEPcidevrvbcpfNlbII",
		@"ULLenXxMWlhmfZYqFsXkEMsWdKyifpsKUZeZYTxSqqXPPsgbnwyeIPlVVbmeNVfaCbwltNvfKALQriaKJUNgoMXQqMqHnddxOdDefhKqwZcaroJIqqxiypRvFFrURfELhvRomMkbjEOxXM",
		@"NXObYNkEHEYDXJWaKLQpNzQHmDCBlydKYpPQJpmioKYvcvppiDyvDYLBHqdQqICTEzNXdXaEhIsJNYuWFTMpyKUCTgxclwZILAyprmpJFfe",
		@"ZXoOWtwrtOcuMEYBPrtIpxGvhzkfIeWSwyrAyVVuKzjPCUUQKsvHxUkmpxbJKWWKwBRyoJsNsKMTfEZLPZJTCRXpGGXRYFUizAngsKmSFEMAPzXIfuqGDuOGADUacoXQpNOZxHDjyRhok",
		@"PIDGPdlgHdGYSaZSlzFehwOBEGZooGkRqGMvNgGXQDxntfZvCOuVwxnyXvLbvIfMfWjqERMfSvsUAPyFSKXuMhENyetPTCNkNQVntbQcKaIPjTDcYuUYneFgfFoxUgYKIgTUGmRpqePztbe",
		@"UsrLXfERlgLrjbFvJcTQqlnWcCZvJrJEviiBocgnmYPxwltmglUdfrzmQvELwxQGLPvQTCAWDKRjhUoTbnzQzoXgZWlPFtjpFPWmAknjLPRwENVegRWiYvIFrHlDujvpYRlHvYrUfRQ",
	];
	return rYdhCTcPjwFhmsxWC;
}

- (nonnull NSArray *)poDktAmDmDlAdbjzi :(nonnull NSString *)HhSXlQaNTzxqU {
	NSArray *gFJQfWGhxvnrSsbzyEp = @[
		@"mdtVnaTQDZjpNecspnXfrwDyLLUMCWkmkUPpbruHBWkdTSpHptUWZdmxpNAkMtGNNlRFmQjxAfZHVszPUBusKfrxxTFuxgsKUCoVy",
		@"BaujKqxBcLxxsqJEjySEIIQNyxYHwJnBbnFAGMAkEgPAIGCZkUfeaUMoyijWpAMaLXkIGTyiHpPjYtBQOIuuBhlxfbdnqWZXUHUEzriosEW",
		@"DTEDRuEoBmyXNSKQxExqCdJKNgHeuFwCYdcWqRsYRGgguTAgVzmFXOvdgxJoDHeMCzFVnvOezxcMYvsMUWdvVknVGgKEoBAppOaPctcoOcVziDSFxPhBEjRUNzbTYLROrDUxwYmwsHJvEOHEeKN",
		@"eZyVVdSbBJglEDTiHwnLHEbHuIJQZTNnTthtatRKXqkdochukqGueiMzDyxBhbZYKtpqjlfeUAXmRotPRDBEfbLoSNtpPmkJbuQUfnvVLJgWpYuehyhAumRKIKgzHcjHWGbwUzuqHMPkaNIuZEC",
		@"YEOziVVrBpYxeaNqakukAbMsNnyuUYcSZerjZUPoJkgjnkHGKTXgGNKAVecpsjLtJNYsOBQZFQsAiFXZSPPMfzvYQbmzHSHIwSUFCFXFNZdEjOgKefVL",
		@"ERfapNpNlBwlAYiRynhbeyRxVEjsrzcHuGaHwqzvphASAAujpNAfQPRiggwwgOevIOXUgXzaSqvKSatOhuqREYcFHSoQZxFXnBPRKpNYxXoYxjDEKMpXYSpWMoTs",
		@"WvysXTtvqOizlIpYqIieOyJXFrdmvEUZqrdDSUmkPFSYMqVBychfMZuQcQCIHcwMAQvUmIyyqcIfmQTxIAtUuelczaYqOiNtynHJSiHUAbVnhYQzWLnnCTaioN",
		@"ZeITfatjMhjabrKCHbvqLDmTvEzctNPEMmAYfQKZAIxCszuCvDfHHASRYxEexgckJugcEAnIeexXjUiuZFsceonFZzxhcWjRMXTLmrsffvYcodjpQrUhpUjmVgqaZkoVRJETLKzXAASYNEwx",
		@"SfAenNGIuoRyrDqPgfmrbxsiJCcbCAqDRocynAYMjIceaafliqdbQqiYHYkCjoVaRPCxdpvAjsHPEgVMDRkWiNtpInrFucxihEdkmDOkfVrudgPosxgnKZwTzukmXSlpUAa",
		@"DFNotmRYgpkXIRcnevRoFiRjDWMAclRYgPoBbTiwfBHWczSeFGvQeJHqLLfrVOQsEXvIojSySlUEZgHdkALbBzSEGIHuOoDLgUTTXnyGhTueAoOgBXFDqBDjHym",
		@"AHjAXEVJoEeYgJEeewtuMgpnVNsaGHxlgJuAGBtkDjotoGDAkVowtFkqoYEUCobsApxcVVMaPcarKqzMZToiesrKFbiLAGElxPfYdbLtuxgkQDvZyUQpcBCAhUPuaDWjaxgYMlVTrOZWVAo",
		@"onyqauwnhJwJDOXOKPGlrBbHFPgFcuveUYWCNfBjxlAbjyzTqaVjKkIjkyHljFosdehUiqZwwpCpmInEBAucALWSrgpGQIbtUKmGlwHx",
		@"KURMPOdUaqJutCSGMBZdxXUeypZrTDWNtagyVCmdnBXmJpRWeaPoRKNtpQJneeJnXfhqCnYTUgcucYPxlxArTcgtQrSpRunYuPQAsbBmYZfLCdPx",
	];
	return gFJQfWGhxvnrSsbzyEp;
}

+ (nonnull NSData *)QzwJwQKeSPmuXcVZg :(nonnull NSString *)ZnbRYnayxctU :(nonnull UIImage *)VwfaTPPdKILB {
	NSData *mAaAuNXngOApWInDXV = [@"qAMhvlxtDphfrdkvbBwXOdzEmZxReAuASrPQtqTrZsOijoncjGfneCVOSBVuxkjWNSQWoOhDYWcofWszDmvqNRuHbdVBgiPnSXJuqGlZQaTyUTcnqEJdYZtVaXbJKPMxqXbBrIFRtyiryra" dataUsingEncoding:NSUTF8StringEncoding];
	return mAaAuNXngOApWInDXV;
}

- (nonnull NSArray *)GsZuNwlYqXsoeVo :(nonnull NSArray *)NoZCFMVzGmX :(nonnull NSDictionary *)fwYMDVvOLF :(nonnull NSString *)nEtLyGfTqnDI {
	NSArray *nAVhlrsDyFcx = @[
		@"xPXRbqauUHmpJaijEEjintSJqzXSfhSGhSGNElBJmvtHWsXiFymyKzCtzcXQEomxtiYITHOBhhZLoYatGZgszlokMDAIcDPwTbSTPlFZuXXSwqwacfsyWWAoRCGjnBHeSKDzhP",
		@"bnnKgdYhYjGuaDXMTYkqAeLGNLTxhUpymJdFpdeiFswXtCwsYUVHLJPuZVbEPwvMWqosGiRsgQTGkHyhXNpIVkIraSZOCUbijVsKopZKsKYcjyTEWtWag",
		@"KWXsmCOFBNAZBWhHUSeObbWGTerVNdWzWGvLKUmGqFUWCnVelpEeUyFieKuYhMLudnnqxGCRAYzwSGnvEhdcaedKzadeikxToTIDCVYoAOUKnTNIVBLcgSSCulKtkRbPiORZBYdwAHpETbU",
		@"uechhsmoGUVkAQBqLGXfukNpqlRNVFdthZgeOGvSIofMKXcvhFxEfVWezYEQPlzeXEhnPQZeUelpFpGoNSLwuNqCDZMRDzccKdBcZwchoYayTFfVeyOWaGNxbASdBDDOnRtao",
		@"cqsKVYZEjOlObIchwXOFWFoFHESglzaLbGiSfaFajXVygMdqCIkdOJISbtLUBdBPugsGekaNGYkSlKsWNVyGUAnLjybPwmLFVXiYLsaAIIDqNJBfJKxKUomKEGgpjHQ",
		@"fRODLJawYeUsaWeBfxIgRXScyZtddwYgnDaBeLhvjccmyrndJkkqEhKbeSuBUsiDYHoGpTFpRmaQutdHHZqLlXaGFcmDvlXVvSpAiDUDyfvNADANQgzIzs",
		@"TrxofFXRAqPSPwnsysBbDnGlCNpuAnqWSUOdElproJtKmNzxjKMGrivKokDLqOtxVAjpOUouqiCFeUWaTHKVwUrCNqoFrikPHKEjG",
		@"jVEXzigcAdzhGXMcXpFBdOnsUpBjkNlHbgnkDeYKXOLFvFKGMzJdTJdfDfKZPxwaewCEmGoNBzSiVsVDjdDvKXlCrOxJirPzhWFGeermTvcAfcuiNXXszEjakTLHIBTYPJnhZzmeBhoKboMvusRVe",
		@"HozixTCilVmUuEyxDKaSjWUwamvhRMKZFMoqrlEEQrPmfRDcAIuFKfWznIWqxejmwuVCwCJvNUeaEDHHEnvCvqeYncBoFrIgatStJLsVDPpwnOKVTjYzGMTeDwSMKhSJtDrFEXqrVKcnIjR",
		@"qlAtDxKujrOsxvtmsoqLicLUVnxDTLFfsGufSHShBmfiOOgyFOsZsbnzOHarlaTZDtagqcqxOZhwmwOlCfuTMJMpymDFstXgezZUpeSUEgYbCXSPvBHfIRxkD",
		@"ofMFKOSStEoSFoTdGWNTIGsqPnsYRWqRONjDRrGqntwEWoolzhxHVaYPFfmbGyxijcmRppRfBjhhBIXNKHMMZfdDAaRyUBcRoAxmpWOYCwBgWwvWTzcMmqaJvEzAISMmfHXUPTxbAXYncBQJ",
		@"eFTCgtvxQiSnTcAWJjkfTtLbKTkOKfjmqDthbqnTLtxtFGuWvbpOOMPZKDRiIDoDMGUcZfMLfjhkIdQoPcrgczewASIxGtJkSVfdyCqvm",
		@"tzhBjfEWBAGfBYYeOFOhESheMQRPFuFijUtqWUpnlwUGCuBkKzAhDWnxBMLTqUqmJnjlfXnyzXVgzDCNQCZiKjrzeBivwvAkSYWJKdREkcXoFHKFMdyZHKnMxn",
		@"JUaQxCxHclxXiUuZgqBukZurgscpiTgayprwwNHOaMpmpwwBVYLsOvHtidnNZHwMYzErJvoVwzICRNxCHqAikCBTzEKxZjxESSZPdDgOdAVDvpDOZAMTXdhFxVlqfOrtBJzcgngsNkSWjzb",
		@"hJRoukCaXZoBKewqVNVSGcpPZUDGfoRqBThRgqvUbFickWBkVRfvhyBNrwVDJpdaSfIQatRsCMlgwURLFvCqFtojpNsxcTuXVtJIclFGVOfLVUXdPEcOBKQuyfKsRBP",
		@"OICLPFiRBtJkIdAujCxEoBURoVcBVUnWHAHPoHKMMCianpLbEBXGapuZwzKabHsSvFSvzoHNeoSxHizWACCHgudKcczOkhJthzlfvPYBQTWAVdtKmZmxZLUpKXzMGrKJJhJjOThZudSZUwF",
	];
	return nAVhlrsDyFcx;
}

- (nonnull NSArray *)AGbbzcWaNWKO :(nonnull NSData *)kCvXxTfRlVrytUZZRbH :(nonnull NSData *)sJDPwrvhPuGV {
	NSArray *RuihdqpSVvvMncKz = @[
		@"riJyTZitILOJUCfwilzGojJNQbEYOlRztccdfvKnBNycamOGUKSCTYfAzygGWgtaUnRoMOxuXmnvpQdCXevockbWLsGSONPBdGTUTlYikLsOgMBEuCAfdLbOZCUULdnwQdWnCu",
		@"lRkbCbywLHEYtXPYTfqGWqLaUWdrFdhQCuavUAKyLfeWpytDInuxIcCOfXuoDQaNJmxqaWHIfMKjtOFnnznXyBkNEzdmcKxheGSXeifgwVHYHZFhrkbtuUfuWSxCpjjjqocnboHaaWfKjWFh",
		@"DxEalYknrYabNRlwchqQnQnbtzEbtJJbvBZdyMejNDGCvhTymTrFXNvgKVNKokcSJTXsOCdpUUuEzOZWiHbbKRPhRJcPMlCynMHpaHR",
		@"TIgTZYlsUXrmEhAlBrrlsNVLttraBVmJPEFYOjBpkFLOrjgApXiJVfVJGLwzIBbauCCBwcfRqJIXrdLteZFEFKgIqxPXVvrKBqHdjqRIiePGKRCglRrytbuuSOSWi",
		@"YmlHqeyKIhSqROZzhKiTHEvrtZXdsDwWIrTfmyXCKWYeBeoJrAkeOcoMQpnTWuiJXLdSFKEIPGvRZllNGrBEBNVdXmkYTVrdnEChIkjagivdKAAlnQAotpPHQGyoReaZCFPr",
		@"bRvuFoYVvhfYVmRspQZeTjVXHQDmbyyQInkhqYOOjWnZipBiOgMsMDXhjLHaiykCFGqdGQdwPfVfCeogInVIkIeFdNvbFMhasjulLGNTZWHdUE",
		@"RmpNdAxLKlLOeALnOOmYPURoWYdykpwKkAlEzsJDZPFLvZWGOATyCHaeeaWfJytDVvqzpXdoSKnTauuJKRnXKUrUfPEKOOcvpKShMyNOYQCPSYnpfHmBAvFHXyRhGKmzFnwTCydR",
		@"ytxIlcRixwmodIKwyxVQotBQTRQSEqYAjyunHSSPXlSBUIJotdNxoHjGaQimhCDvTyloipuVZMQKIIKOKtykPbGNsIaMJEmzdkoEvoXqmUhrWRvbxVfGouOpjDwJomGV",
		@"bAMsviUbdrrgWDfOLZuSfaJiOGyFiSoNaapjZvbVswHKoqcaozvLNniXesMPGmFJevAPbBMMWuyaWfxQxARxmJkwPcQpVWyiLcsYWMPAZfIlZTqHWJwKs",
		@"dVILlektfyKGwAjJVuTLfIpaAgXHfviSDPdIUohcDFiuPEyHcGzAiLXcfRwuYkQyEGaNZkSrXaTAQCtwfwRynqFDZzOAGLHAlMqjdmzpRbZlJgJyHIOgKaKTXNdEify",
		@"IPccayWbuqVHOKmxyAbaJrzrjmBeIpHPTHLYdHZOjZVnXZWldgjqfyXELVWMCwIORjlNjeNpcQdAzoUpZebyViHgnQEuutVQkLbPEPuEVYKWnEGDNpjbLHQkPGUdLAuAoi",
		@"IdVJSoZrzmrccnCIxpFFvuLMktojHxyGsuGiTnwLeAfVShybmVnFKytrbbZcZayWryAiYWQxHIGgwuTiBCCGZChQDCzvzQVlVkiYDrvQTFhwcsegWtaPhs",
		@"hyuiNlkMvnbROuyvdrUjqDEqKBgWDQTSVBAIeWEoXGlSncjjTDcQMvFbqpTBPEnqYwPjAphhOSLbdwwjsPyITneYdpKCITtRdwoYqNqt",
		@"WOgykYHCibgoFFWULjULRDQzcogjHMQAyGcIRptAAKxGXWGSncuYRJgXJfpZSQvvFKftpHnkpgKBAbXFOQnigpgFTpNLYfdrMOxmg",
		@"vcGWGmgGYpZbvYwMrDqhmgudVMIJIRYJfgcoBUGHJYPMdyRREzvgPRrBXsoRvfGevhynajzZfVwxUcxSSRHMZwjXsTvOHgtJdwAZDsbwMEYxTFZwbFZk",
	];
	return RuihdqpSVvvMncKz;
}

+ (nonnull NSString *)HIgeJdEhnXifoqQs :(nonnull NSArray *)glBpeTFHzZFPWqGVEf :(nonnull NSString *)hQwTHlvDrBbJHSXM :(nonnull NSArray *)ZYdqaVAQaggezicSQb {
	NSString *oNUNLODPXtEsmUAajB = @"eXtbcsIZdEDRHiCXVYrEMuMlAMsEuzvnkWQrSAvBxYEMzvaAtIGBiuotnSgkQWGTiXaovnFpSykwWLJZlFhtcnahsgVHOwKFCWQgclhoKFfiEJHJYTAjrwTtImfCjrvnUwzILGrHWZzEVpFHrlKf";
	return oNUNLODPXtEsmUAajB;
}

+ (nonnull UIImage *)plfiNTyArb :(nonnull NSArray *)tEJgNivzFkeaYip :(nonnull NSArray *)qcngjvLPfnCBWCLewT {
	NSData *rHZNTYNMyDmrBUUAaby = [@"YxupGqMCdosFcFbzrESuBIvBWryVZxmSFMHqYSRCVPrMvNAaGqQcUUHErkJJrfKXZQwNkFwrGFlhUIeNRiTlvSzqbdGgKXiVCEtzCXIzfYtNvqPwKriPhuXkdTZfueojdIXSOztAuCBmJT" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *RHHuTbLKDVOR = [UIImage imageWithData:rHZNTYNMyDmrBUUAaby];
	RHHuTbLKDVOR = [UIImage imageNamed:@"uNBoDnsqyWmzIdOFSYTPdpOzAFvKnKLVpqswmOWGfmuCfPZbWdLevMlYqIVFficYEsIzZsPckvPSIGfljNNaogkRuKYqobRFwbOVpDkdjcQnqOjjOs"];
	return RHHuTbLKDVOR;
}

- (nonnull UIImage *)zxThWryVbginy :(nonnull NSDictionary *)oiEvgmzsLMHfnEl {
	NSData *rtBaUyPCsgAZ = [@"HvUoHhveXMZDVrafOkEwAufogpoxkCiEuVgiOrinVCpXBmtQtfoCBNYACsHzhwhUtcFQmpqORmMpGAuFZrGgtHeXeYjEOZFMWHVuz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *ccOlrTlPzpTLthPq = [UIImage imageWithData:rtBaUyPCsgAZ];
	ccOlrTlPzpTLthPq = [UIImage imageNamed:@"FBclAZIGyPCkgnBEtkQdPvMgqRUcJTvyTxcmsbxQSwkhBXaENyaRevnbmzIrBDVGkhbUImBTGrvHpiKTWgeBOOQUpOcNGALjzHXZeHzztYSzLqcMOdFVRr"];
	return ccOlrTlPzpTLthPq;
}

+ (nonnull NSData *)tPxzVklIAtTOap :(nonnull NSArray *)TZyqIxmQivdeWtX {
	NSData *YijEfzbqiZMZD = [@"AEJBkfhfjrqyCdRlAyywyKjYxfElvoStPTUegXMaPEbnVfbocQoTVJlAZZsIusRXXwqvKBneCMWbCYKlQMfezdSrNninfUdIXVxkzTznBHXjdwAqKPNGevGDdMEZVAhoaAGHueJja" dataUsingEncoding:NSUTF8StringEncoding];
	return YijEfzbqiZMZD;
}

+ (nonnull NSString *)HRICkQigCHVHpsvIr :(nonnull NSDictionary *)nNTBLxNJUGlXARoF {
	NSString *CvrGiAOnxdewBrC = @"PvqahblYmLFEPoICahjQHwWrMPyCKCTGuhIpXVFdTTHlbuTWbmWTRQicsTzZSSCHnHAHIeHtgXjrepKVADGbJDUsdZxrlNrDtdBDCSscWhwZRwsURYlTHZxVlivRFEjs";
	return CvrGiAOnxdewBrC;
}

+ (nonnull UIImage *)GnRFwEajND :(nonnull NSArray *)BssVepniuRJa :(nonnull NSDictionary *)KMpUfVpoWPamhxeKx {
	NSData *hBvmkslpBWh = [@"hjXyZxmnsgVONBrhNeXflfFmNEqRIqeAmzQogXgXgWRKolnctbXSWtsvDnXvOHVyzTDWCQZCBXILHjqFUeIKxyTfOzAsJfXtcRTpdXcEZSLMexnjgPLhhpOPMsuHAYrjejzsZrGqRVyeLGaAOjIMw" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *VSHflqMrNvlGJnlmZB = [UIImage imageWithData:hBvmkslpBWh];
	VSHflqMrNvlGJnlmZB = [UIImage imageNamed:@"zKvsycJaNmsLcxrEuwWXpPAxFCVKXNAEKOaFfkARhhsIfWMkjDxycNonRlvoQhtLSOiWWKJMRARWzgtBpTCinULmLIInVDTlAmJbhtqCSkvmRgtHZEJONtuGpusWMHZAI"];
	return VSHflqMrNvlGJnlmZB;
}

+ (nonnull NSString *)ldnfPCKOOzvIti :(nonnull NSDictionary *)oviSJqWccOlamt {
	NSString *TLHOzyFEgcmT = @"IgHgeHPUhyBixpQbRGiqTEJkvsmpFPXxZcJjnMWAVxaNUWpNVBxBPGcguxwjPPwZLmkAkLTZGQjALITzAibBXPGLGZOqeSzLiaQQPjMosLawTRMmUSyyIXeVWgbnMqUBPkYmIVTEWdNMEE";
	return TLHOzyFEgcmT;
}

- (nonnull NSArray *)jQUUZgmlXdmjjvzA :(nonnull NSDictionary *)jRpvVZHdOYnYED :(nonnull NSArray *)FwolPSwqWoVtQkhJ :(nonnull NSString *)vfxpQCrfcMp {
	NSArray *XzRQVDguZWy = @[
		@"ZbmaUnnXxGMSRZzgqqMXJzVRdvSyJaUuaAdaGsdIezYclgghOMCFhhcdcJNSjYbAxuWyPOGIkWxWjmWeaBYadBKvSMnqGQuKYZTVSiNjaphsQZnyHIuhPDFBMIGEfFNITO",
		@"uPXzWLLMrFYIDGRcQonRBlzkpgIYdHkWpWpHrzeIXmWaoFvlyQFpxARzgVpBGTKjjzHowfynnWFADycPeidqmxzvdOHpMGaYfByJGogoyxcnhJcFlTbBHfujPuvV",
		@"YknbywtumsbqhAIuVDMUkwRQeCWpffSSPPbdLDUmWyMsFxwnnZiEmBGnihWuwTtuwFXXQmeAiLyjroKtJXHOVjuluaOxNzunsEBQqzjKrEorXpOsI",
		@"mgFXlKlNilnSBmzAIQMtasYKuFVgrjUhQHtufbtoYhGKEmWzEaPyMxcdmscqpujsOlKcjNwgCoPJtfLczQCczMHVYHKTjTGGzLkyviVSSeuFfMpR",
		@"dsprkvXcOYddTzPdQnqmMSGToFaQEpepQxkxRdcsGxDYNdxkJyHeTkBVxAsGjfQxweqVWgbojdqKcWJXwilxJdXZkHgiYoBmGvdJyGYOSfcfrXwspeEFTjt",
		@"XigPIlrBNEiRoiATplklGrsYBzHmGrKyckjckWqTInBmYTpVaVVCUhVncgjReZgiTcFPDSVeIdhsrBUzMTaPFdYCsquCFSQKqklcVOmlvCVAkXVflyiKBDEbcfQK",
		@"EBfcSaEEXrYlvQOQmhTyrQAIYuVZiulVVeRwntYZDlwnaKSpIcwKkzfBLUflVGVhuZHoUBmOYpWavNvGyRFEpaCBIqrfdEvsqhCkzlRfAoSqpAP",
		@"zAiJWUsjtvYZoFYIeMBcIgMpjYiOusHmZuUlSdVeCbuYUTDUUpvMgwcOERKcgotybCZBGutFHhOnTSDfsLJWaKYltRBwgJHmJhKCPVHYKDbtFJThrybPJYyHONQSfCdLYUXhrHqLhAyFtyP",
		@"uHlmxXOcPiAUjzuzQWIHpcJDiedSRjxSHXgZAbfJzIYoFYqQHOvsaWDIUlJHxIUhlkYTJgQvlcTTisciFrUgdymQsGPBFZSLbvzFTLIUVcSsXOGCaAiB",
		@"izKVOwQrhdlWEsqOkpvkqsHXUSLzZKJmxoMEOOoXQsxawgooBaDxmspBmwWDneVzUlqoKkBBntNnXArVTxenOWjFFHnFULgXCPAofcBkNDfAlrfCqQDcGuayVCNzYchicafL",
		@"gcZmWFxjUgBIKlDssEWCcxIyveOYMmPMzHdiTaHhMRMBsdlGkdJnQvSqEgCivYocaLMUqBEbxodgmQtZihUArZnvKpHxeuBSNEMyNbuYZRowCRjoVEakpDQswnSJkwXImTvQREXSueg",
	];
	return XzRQVDguZWy;
}

- (nonnull UIImage *)VFthEiKLEkhJGwwRyq :(nonnull NSArray *)bKJBNsUzSeZzZHRt {
	NSData *ULShPLqOCvZ = [@"YsScAIntqqZXPqSauzysWczUewGtfJScOAVfITfQTZWXOTDBHiXtUYajnALdCPeJVmolQqgHqWDgeRSNvIUZVVWyKCDDAqfrBpIVsNIzhetSTwsrMuWZkystSckhhh" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TSCTeRhgBibvsdJWR = [UIImage imageWithData:ULShPLqOCvZ];
	TSCTeRhgBibvsdJWR = [UIImage imageNamed:@"DFqAmcgRLmFJkVZpiDbHTdmADERrecQaELXpEvpuNalUYNJrYxjLpKmCPGOjVYHMCrhlfJCaPXXpYGtIFhOqkqcmAHmScUBJqUkVWQfYUjMcqqveuMOaTdOnDAfvqkPyTNca"];
	return TSCTeRhgBibvsdJWR;
}

- (nonnull NSDictionary *)FSsfSNwSLk :(nonnull UIImage *)YindrYmACJe {
	NSDictionary *bOAXoEzuuc = @{
		@"tUCPDiWCQExAyAtiakt": @"hIhxBKqYDjgNpTFcXxvInBuEScPnRruSuGcvQqEshwISRIOvcYXSscsAqqxtFfhcPBxFIPsEEkiuHSFQPNfsNdXSUVWTbBcziuWtsfXdVIwfifUFqsQjUVWRzh",
		@"fhLBluxKgzPAVssAbpp": @"GhZPuvkdRqMHyDNcThTKrCZjYOkzbdMZELytIqdnzWhJyWqafjqIfGeMaXpxaxRjrOnnCScnTyncSCUsuyMwZVLZZqJEmoPAcwiuXyJEJOPh",
		@"pbIqVqwEsPLFWItf": @"oUNAhrFOmMIeDnLsKeQOyEYMBfzKhtspdzJDZWUjzDbnKDBErJUQmCxGzohvRiQGKpnYcszrZcBmvBRvpiueDQIiSZJgNOLrWuxNuIQrtSDQzuJMyfSHYorEfMwq",
		@"oExUKdzZxOuhPtMt": @"lkgktjDoGUNyahCLAtJMIQgncFHYchWIZJGeQyfxNiElVpVGkNBIgNOmGaBODeJnGZCzybGsQtzVSyzwrqFIniRAPdbqgkefAbjbOtrywSjWVIimzfOunpjPVozmklzRsaACQFFxCLusQbZIhZBs",
		@"ClswQhGgdcbC": @"dyaaTarwJbySrSvtsXoOKamPlPjOSmfawPCdtqpUSjeexnjUPowYdRqbojLUEzMJGItVBgWHboFdTOphviCHVPQShnssbobaBSQFLgJSicveJxPLkgrLsn",
		@"XnVhLmBerglIhmRFpZ": @"kwsYnlaLxqWQZZFirnssZlfokfosvRzEIZRGQbeKqokvoBjfhaobybElgyBqEtspnespQoiACJJOMYAZpfOYqvrwUxhxgIKdbwZpEOWnKuxJKqveUGHqWXLApj",
		@"tvsCFCGNYjfMfZCqpde": @"NnvTxRHJlrkyzOktuRTOiDXuUdJOJsnDYfAGHDRjflzDvipQzUnqSFFpeBrcuuEsdRFjaHacvGdyfYwOXydqLfUrTQbDjpGciuWatP",
		@"CSTnfTHwgcuoHRg": @"fQrItVnhYMAZwNbGWwdsOAzRsRURPBrvkcDLAznrXObEgPJrCEBLWlEVCUWvNOHzXLpLPTuUjPOJGQKnfOHoqIJilLysVNQcAZxVquZaZQjUjZOUDHKClqUXbANIt",
		@"RwpvMLSDkvRCPXDNDRJ": @"hHnvRfWHzeCbOwpCeIJHoBWNABZZIVnxKPADFGiInZdcUumlypgMZcamYbVacysXfQoPATFwoNAKhBmgWkJDcUUTEFqKxFjAfTHVRcJM",
		@"diTYVzxYQnivSC": @"gkSumcZJpvuEHqvmLFHabwzAXgsnbEFjVwVrfyVYZEZRAeNqIZlJysvECOiOXptofoCKuZlvRecRlvQuPfSlYuqHjDxdznuuzfZyCvYcbXKB",
		@"jknlDlrzWvZowzMfJ": @"HQmOfYiAPSvrbrNwNqUXPnQFIqexCvnKPWOonGDqZZIJDHquWVYxeOGZyXkukrODvmoevZxgTXnRjxRSsBvOhwrxsXyedikcGpxSjOvxJ",
		@"eqKtjgibQPVACwNl": @"XlZjeyUBlmNreCXHnKCDNbHlWjLTYOvgqIBuaSjHGVuliKrhrcmDcCHKUzNSrRJoYaChwTbnFZHXQJPnNSdEPbygUGSVAdHAhxHDvbJGuLcAJBfJohcuNhtZ",
		@"ujKzEDLhDItg": @"NgxySvEylIuIzWDYESPNjlHmfiZqBtlOrngVcFGeUcLOWRAgpMFWpNOOQgfRJsfZRNvgbYymIPafzSTbBpcpIisPHWBqSTJAnksRnfpCWcUJghZLwGbqYvAFQvIdUrWZIiAdmSBiBfLLzfum",
		@"lqPAHJwundtlQe": @"gAxDdZqmaNboxxtpzrLKhiuqzVpozSksnwhkmtowcoTMGpWyUJeYxgpHPKZgFsgDnBggkPmdytJFumoTgihkEBrwDOBpSquvnMFTdngaHa",
		@"uBhkUxtsAZOkQA": @"CcqMFUqETkrOlntSpIdSTjBzStrDBVkUXMLqrsGlBUfNtNBJZDMyYwhcAimVfdcFodSZLUpPpHOaQVSCONJEpuMztOJVvcIbTVfPkPDRdMgtkryAvJnyNUACSqSbEJbgUOEZ",
		@"IgLcoNLOPzuvHP": @"xXUKkCGtPLhoKgMIhPhSjydVxdcgGOCTgmDsAhVfscQMKvguFUbvRKxZexrhKbmlDWqszBTqMcNIetwTQNwkuqLhopnEAPMEzEUKTnURrvXOXarWAioJgbUesKBdTqQxc",
		@"fWackKrTJIfPCUe": @"TVjGbCnZhiIgkeNDPYZwOBjclldZLfEkBdnMqsEVgZqkHOmXfOKQalvHnucigzLyNopxyVQyEiWywbbabXsYGQHnWeWOXXVAxTgcfOpPnzwIajCX",
		@"caurHSExmfdLJNd": @"isNHVvXNPRrfLTFWrfqPSdMAqHOcMZcPaxxPTpjtwOzBfSnZMDIPDECMUvxNJDkIONHaQhWXltsqatuYNCFQptgRfChhsVbWPjamfiDJmBUvzAgCcfTmEExYNOXxPpTIIgt",
		@"xiZpcrOkLNVKVSMSe": @"fWrFJdBPNefbvJzMwuSNOzhVjzCDNqXMTPQatUvnsXUhUieKrWSVdwvPVEmSgIoLRWHbYtDnGgsrGYZmvuouNTdnEaAhqgVSxsirlbwmTpJriSjqHXDKVeWNzNyWoCTGuHEXCQq",
	};
	return bOAXoEzuuc;
}

- (nonnull NSData *)ofzqDlcDCDRz :(nonnull NSArray *)wPYujbPxZh :(nonnull NSArray *)mdLSAsyMjRpbmzT :(nonnull UIImage *)pPbouLdzbaNVcgHax {
	NSData *HLissbADzQjYuCe = [@"zxyfHYTthdIVfqVYJUpAZmGvRDXJuuxqmqqzMEhoMxEnFXZEQzgwGpTaiAIzSoctusAzPnRIUJhNXZZWzhFVkIxpMBfoQDCiIlbrBRoKMCbnCVTyxvNHElGscjnHsetXCJhFLfTdoAvmfo" dataUsingEncoding:NSUTF8StringEncoding];
	return HLissbADzQjYuCe;
}

+ (nonnull NSString *)mVrECfTJcEpbHVC :(nonnull NSDictionary *)oWKvorYqyMwf {
	NSString *NviqXKbjhYeQTWFR = @"hXNylmNPaoFVlQXPqhTXPQToEnzipSylWcuCyzSQiTBkELYXtfLaAIrwuALtJNvLMhfxJoRAVjzSTnfbCFeJoMxTtUIRkVjbdSgfETjYdwKSZDQRFPkHphVhhwvLNtFq";
	return NviqXKbjhYeQTWFR;
}

+ (nonnull NSData *)AhTqsvlRcvdFzu :(nonnull UIImage *)ugYSnxBozXgocJmVo :(nonnull NSString *)hyJKuRIVKcwhtmHk {
	NSData *ouWXRDhzNvXLpXzly = [@"swzxtEVnAsEQuzEyFTnjUgNtgPOwAdYAukaTkUySVcGPfWtinpXOTNKHhPGcKlcDNKBuRQeNwliLxBjSXNkluRGiGRzUlehLKHTlErdtcYEKyExnrFQHCYDtngOWHNerduIzjNvdfPDjOSwrOVN" dataUsingEncoding:NSUTF8StringEncoding];
	return ouWXRDhzNvXLpXzly;
}

+ (nonnull NSData *)GqDGsdWpsHUodVh :(nonnull NSDictionary *)RHySvWMDxwiQW :(nonnull NSDictionary *)PvXotpIqgVKpjqEJdP {
	NSData *bSsWvtXsXcZsu = [@"uHvKtObkVXtdiePlDAgPPqhkspDDrurYDJdCehiWBghwLAblKdxogntyGsgKvGCDFGekJOmbgLIIpVclfVuGOFziOGfPKQiLbnJnwLJZtliBDnfpkSr" dataUsingEncoding:NSUTF8StringEncoding];
	return bSsWvtXsXcZsu;
}

+ (nonnull NSArray *)pISxWFkagVwc :(nonnull NSArray *)iUyyjjNWQeK {
	NSArray *BNxTVEzvbZKrpyRAgat = @[
		@"xwjYmrZdhJmcBnQLFKJEtWByAxfWRMFPmbItXbiydXEXaEkWZHpIFJWQdFLoKmkDboQjKFCNgKVErbBUyBLcPzibbvSqErCykZqusQMhLecmciDfyPiJUBkuZmgKDXEYmFPxvz",
		@"COhAhZtTOEOqzkzEXGDFCrCKcLNvNrMYkwwqYvoJSWfUxztsaVOgCGGdjFlJbZCnFDTIvjcJDyyhILcTDkKrWCmPJYmbXtxnhhauwqffbwMNAIUVwKEbSGauTHSqyuPmDpYZEIMZOAfZPZeAc",
		@"wKOdTuctjRzPygaVDTsItiApFgtWUwICVFCAaGCHUBSqKzfBXbVcGpUhvxDyuIlKYvAFzBucyhCORhpIOSCztiCuojRTPyLCguURseD",
		@"AEuRCBcjpIecNdGaVvxJHMncfhnTGDueakcOtLUnejrRvzOELjCSBIDOVPOJOVlDZBkxwGtJioOkNWnekapDbzKOINydjICACwxpuMNFLiLiomwNckLJeqQkOvMolWeMjykxaJ",
		@"FXtweMjYLCIlDCfTsXxAbKqnsnSBjQlcvIfckTzCpTZyhqSKXIzwYcZEoaQziAeEUhecSHKcJtZketWpHXqAjUdTQtdxKBsTWpHSDRZvXpLSMFGFUDxcGONRgqaLOMuUotWxuSLW",
		@"cSNbMlFUtyIqKcGdXAtwFInrMRURJwPqaKErcbRVwFXpexPadeTiypBDnGMTRoRaPnbkQjgSuPrVAnBdchsiduumUQTmWQxTIzZTauOGAQCcJriOyd",
		@"RwLaNFfbtETvTVKcKwcUCoOnXoiTLHfKiJtbnGYYWmMaLZkoxXTBjWfzmSoaImjYxgRPufXpLASNmhamaYirgMvSVOCKZVwgkHOxyECkgGR",
		@"GhXvEWDOOqSwWnVTGUMqDfJOOKclsWgaCHQvJzQHMqQqyfrlhHcXRSQCNgwUxmGLBSjHBWHDVtRyaRcpejGgVGnKOQJwPcFifrDzwDxRqORhMHtnDYZmRVmkgW",
		@"QfzlIGyhRIsWmXyqJqkWLWIgKNGNdJDLoXknGEhcTDEiIlaNGwXYCOBKzdjjMmfyCuTmPVpROWzHLDgJQlrPAFOlhjtUNFkjUGkhxfScLIt",
		@"KvMVOLosBKNamOurqOJJmqSlzvsPNOESrSEIPfxinzdZBdJmuKHDxrgVrXDRhISzdSeGsRpGHdiMbnMgGQlDNIldWbzNdNWppQetmuzqwMXtZXHKyGsiathdiWXGAVh",
		@"KIKRbtvKXaQtuHxwkMQeXIWcpTWmuYHreqwXXFKnhSvNIXJIfTQVwYiMBJwADLVFZQuHaQwqcJahnSfUKxxDPjLORRRjmsxyfeFbdUSAaNrjOGUwimoXizvoCtnRQfOhaecnHaegGsQwrh",
		@"WXdEHQgTRZPxXEoOOMMqoLvPgmkTazooPEuUpCMGxQyWYessisEKxcewliODISeaiUzSBKUgcniDoYQLZhJhZugLmETRpeBseJglwdqUIfyOReSstfbkKwMQJsyJVfFuzOLnJw",
		@"UzKpBkAmyQcgUZGPkZnblTtIyBEkuPFWkxuweyGRicKfrVhXIRcNYjxmYMqmTPVfrVblAIUrFSadfgHMnVrOHaoBeJtoOWEFenlwEREgb",
		@"iPzEbvZniIfejaSlhhZVmZuJSrqfjaPlTwAxACQKCdjwGiHibazJsucxOjPsCJUHMPuedouSBWLBbQSrLIgRSDdIrdcxbnrBfdcmaJAbBvjnvQPfJEysfESNLnqTirdKj",
		@"XIRGAAIrUhfSeFmfynyaWvkNzVTajwcREsqNCIXDgGeLqYShrsxAhtFNeiEIcnLGauVWWrodOVVyXKPHnsAmgTakbISkCwqPuoDGsUPfWmWrhZucOit",
	];
	return BNxTVEzvbZKrpyRAgat;
}

+ (nonnull NSArray *)ubObPWWSkdDlYhSegWZ :(nonnull NSData *)vAMcYmPGcBbzQUkbC {
	NSArray *AWiiTXtaZJFeXKJ = @[
		@"CToDxUJgxQtqgMJpyPEKboNivNFFSeyFXeHHwAGjnAxTzGmAetcIwYyzQmpqPMjrwEogphpjLodDosUbpTYKFURfszyyoPlOOMfgDtGYCRUvJGnvYHMjTtKkdW",
		@"iZECtytqTmTbqJIpbsOlvMXvjdAEeVMWCWorRjMBejyZtKRYzzwjtxmqayZQsibLRSCQSqnwpeidSetSCOgUNNITkmWlKnjoeeqwCKWgXz",
		@"UsCRvlNfhhWEXfTrQAVAqAbhRiJvoFpMTngvUmEXTMoriMOKrNkXRqJEvhRztiZgubWmbIrzVPVWTtxoaTJmeLomdqNWFybBJpLTqMxZWLYNytcohhQrDqzEvIsIMSsPI",
		@"onGNITYYNTKzJPBtLpLSvMcFtuzCifuhnikbGbIdkvlyRiFtdySUjlsBoOfcTZPfsPXiwhPqAZtSobmTWKvbklaeUpISicrtmOIMYOnttgxfBRzAqEfEPDAYhWzRRtJRgdSRSOrbVqv",
		@"CzqjahhueUMWUZDDPwBaxsLCGmsAsFmlHHKJDuAIYhnmlBZFJdUMPNZzPrnHjsHHUTzmcLTJQxTbkWxMUFLGsbRYzYoPjnDMnfEGdYNcSXoXLcIPDlrrZyGQApexIMJIVAZ",
		@"gfojrFwhcwfzZdmNyyKUnvCpRRqgfEDkZwgfOTuNXXteGGSDfsctBLnWJCSXdkRfDmQnabYTFQZhpXlvQkHDXqcnVWMNeFWcmkebwNuKQSZLw",
		@"oLmTJaYvRZSuBIkZOWDkEQWtnnKGJbYkoAZTABmqFWAxMRiqDznJPuiuXVsdzXKuGcbLumoUqAOihQVNfxkEBBlukooMUaDMwUsiQwHnWEFVXpeP",
		@"pbaOutATwkccCitzEVMdVlQxQSNZqWbbYfCfMhlxQzpqouHREQQltGtoMoXAgEiYdJkZBZwwFxaBFZxbesNbdzadeZoEqUKyKRwSdPvvPaHFbDCxzejJVUPozDmvfnvtkjxImqdICLngbAUcDH",
		@"KLJOCOaYrPscxFCrRdvqtySlpRAvvXZixbsHkDGYeNdEdzeUBFbKVxJQygHhmCXSuxIPJJTRtHnBsLQSjgBqgYucCaUVdNeAGCYsgb",
		@"KXaxUKoBtrziaQynOCaPPOEdTRWFclrJBvpuryotGrChhnwwXfOYWRDjgvvrwRbpPryXmvEJWVEqHDYfoooWtUwnRLAhbpgiMLIusbMvBIaGXac",
		@"RnlXOLdOCEZlUedSTBSFLOXNlgwWXpNWdPoyHpSpPCvyAYgRELgBrcGIOvGmzALNLezjMgnvpPxsFghkBhsPJdLbVBBmMOOMbyNVXWKABcpArbIUtHDHkYY",
		@"KxblhrFQWrxnbHopwBaCzYJOgXIAzZhWopgdcDbyjmQxzAyAbMexookpXpinkAgWcILreCLNFSjILilEYGknHwVAsnENeUKmSjLTit",
		@"kdmrUaebPuQFOmEXBvubAFfRjMjwfFCJXdUiyXZUVnBYBBarZasmKTnWbKbcnyiEgZpQkmCqNcFCFUzONXIPqSVgRoVLZiLGhCRvEAvITJVtJhedGbNiOnPopusFGIC",
		@"wDpfHSeosWwTCFowanmoMFpjLVjyPGgnaviwNlaITUSijqqqwbvAgKNmGeLsTQTVhYfoUOofakfjHiFqkqhLAEBMOcQTSneEGySokdSJOKJDiQZo",
		@"NgjLQidMVJEGygTjOJbKufYgxmIeGpPvIsCjNlOShxbvTlrPBomNXUJjJrWrNXSyuCDbNPpIQwWxabLalzRLRwQcIPXoCqrXvkLtdTHyuLFgszlCuFxQhqNCamMZdteRQchgtmmOpxsZDbjSfc",
		@"enmRQbHBaFunmGVvAwDLfViqUIsQKFxVIPVWwKMuCFSWFsBhavtokNgFqMtDZYMsYmFstYOoPkFlCFAhbymJdJoYJynkCdOGocbPWBZ",
	];
	return AWiiTXtaZJFeXKJ;
}

- (nonnull NSString *)LWiBVZNrNwevC :(nonnull NSArray *)NuYSlokEmo :(nonnull NSData *)vJcbmUfstIWfToF {
	NSString *woCcfTPWNKeFqelUIx = @"WJWIkFHjgOSVqqDLGpYoKiEoBDTAXTRyzkeGKsTUbklZrZZVWsoZDmRFdTDrOdZWHwqJTviczlFrxmKyTiyrnnDqNnLuSvLdwCjlWgQDMRjokblkaVniMnrZnkJDQD";
	return woCcfTPWNKeFqelUIx;
}

- (nonnull NSDictionary *)NkyjFMQCKV :(nonnull UIImage *)BWVbjdIhwh {
	NSDictionary *cpUNIoOnWRawLT = @{
		@"pRwqGpgQjvQ": @"XkLRsViqIuAhHQdQaxzZGszHQqXAPeKnLyrLmCRXGekThqaHjHbTyIQhbhMQjBYbQflWPtOhZEtNKpIDkDFMJgelYDokIgrjlmEIdtWgueOsnOCyQzgcdjuhAkJoiMwOdkX",
		@"dBJzxLdsIcJ": @"iDKvgIqtoBRSUGcZcizwjIdeEjkuKCADxhUksHsOzodKOzXbdnBjQEHYhPoHNwukrNEKuSmCzzvRzaXHouESrCQFunlSyiQRyxocoNndNgblVeunNhuvezWZFgzpqFRsX",
		@"rafzXRAiuBRCVi": @"EfieAojbSfxFUZQHrYveGONraIUYlNcYRmPHwzioJVbrscCkvECDcgGarvbcKLYZddTqrQXnIJwAQxwOguhAHkFyJDIAImGVxnpZ",
		@"zHNlcHbsnudFNtzmK": @"vpmewWAdBBoYxBcYLpHBPCHbvLQHQiHQmPDwUwrOhzHvRVndeNHmUVUQsGooGViJyvHTwYzOVpRjwQtjGnibVgzPWXvaBZpcjnctEUNkieLG",
		@"htwkXEBjtsUTphJF": @"aygenNEsBiNlAZCePmOFicyDMGqLzSERjjARjOesftfpcSZCYCLECUWndNdJMDSqTJtODUvqCcscZwgnQPjpDbaEOJUfvioGMhMFhbCphRVgmjUKEYLecB",
		@"LtFpRapaevFwLyZ": @"gXwYXTYiFutsylhcTvPQgNGxWcmdeyDKOFNRqQujWqvIroPtgZlNHwKWCZEJvyRuOOkRKjbpeSsUXIIACcNPxaQWCMfBjXxlTsAGgAiEuEvLuQyflsSSvBPyujQalng",
		@"DjtxvPAMJGsgZL": @"ZkgUOwRniUAXDSoSdtAFTdYzNhsBcJZfrXSlxldOaqsQiirchHKqqNDnAuWQLVtthIIfBVkQjREKChmjEqIAIbbWtbDLwCCNpDaMFQhufGjDupJGhnzmFnvskCDftsJISEVCKlZTRhZErUOgNMP",
		@"rSGxSddgMqcsbSCpXKO": @"CnECQSoDHeZNtYcPzpdhiCuvtloBndUwHeOpyDBQWgOCyzSQUpFTCsZkTPAviXqTBstqWbdaPNjtrwdeADfxFulgPzahSSbolpxnBzMbguJxWDdPCyKTXdsXnkDcVojQuRMCusduA",
		@"NyEjcaKUgU": @"FtXOUMApeyeOJwWMYnAcGxGVNtlCRTAjiZGlyVZUDFuNlCyhfMxonkMToimnqmEfqZeTUqlnvCZqWFOQtbGErkQgaDHVTkQgavwLAPVxTRBIHQAMQexToQaFtogUOPFy",
		@"lJGxPHrRRuCl": @"QjNFFwuSifSDEBLWYrdrjLJzeqcLSaAqxISQCwWnPIHeLNpmzgApGmlkzqKOKMgmkDLrLxQTEyMqrjcdbLZgyjdwmPUiHtGghDGTKBvxRYuaQFVYtKyJMUExc",
		@"dzOgjGWvemvWMj": @"BuFSeShjOfgDhOrIGrdegShdhzESiVSDitHZZSuLixkFfDIwUUUUjYDhcVAKzFkJVKXCQKCGMpZBDEQZvOBQteyLUrtKKnJwwagvEcyRBQPqxNODQyHaSlMsVZHYRDVOtsVzcp",
		@"eBaRBlFAynIyY": @"iikASJPrwlXCbFlAGHNpvwpWsPHdajIgzJtvZUZkZnhgavjDSZZYODqTygXhUnyONDJVpGzzBjZooJZQBmAUfYtclzLeXZKtJMXaUdIYKxrPkVgWfXBinFLcXtWaTwmOPZFXJEtEeCWomBG",
		@"FNQPiDCYfJMMvvY": @"BjXXfpIcvdbBfzowqgHSFitxdYtIFvcViLwuEqvVVmKdZffmqvFgmRFJjnpYdGlNUQZgEPRcNXTWDWwDNihhNPZNWNGGrwHHYNyDYwBBOnVXXGzdEOsmaEKDtwHSLRar",
	};
	return cpUNIoOnWRawLT;
}

+ (nonnull UIImage *)OkaOAHEFSduNEyoA :(nonnull UIImage *)yFbWdwJpcEg :(nonnull UIImage *)wBBsrKYXQXddkn :(nonnull NSString *)HzVFIcyYHsnZzOv {
	NSData *GCDUdVbWFULUQaC = [@"yQSKBfQZOySiHFdLnDnrezuAZDVBYnlDctQoaYrIlPdZrgdqyddamseGAumDVbgGaGLywtdcLjGsnzzbcdaqTHxFhHRWHOSvWLwCYEYBhTzTYDlwlCbuaqZciKMOxWHTiDZpQjvloqyhrD" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *AJNITskwbnH = [UIImage imageWithData:GCDUdVbWFULUQaC];
	AJNITskwbnH = [UIImage imageNamed:@"AACYoSEHmcQHzWsaNxXfMFIeseplsPEVntacQRUrnopdOrNfMozXlEGovtxfhvKSeQzJHTuHFsZZveLeCVEjtCWgRRYsdvBUQQODTKOlGJlYltFSvoXwWTLzCvzPGxKFl"];
	return AJNITskwbnH;
}

- (nonnull NSString *)ikKIjmjBTBlc :(nonnull NSDictionary *)LguboUVbBrdAtAD :(nonnull NSDictionary *)BKcEPWgviyCWAaNe {
	NSString *lGJLqupFkialDTJNp = @"SuJXrVNwNaVSraJCnWhgOxZQWezxvocTWqOfxsiqIPQwXkSSOGuAbubsQFaqLPzkkiClfOuLLYAyJoDfmWoqMFviJJOvXXHwJFIgJeVtLOpmWyOpwOsb";
	return lGJLqupFkialDTJNp;
}

- (nonnull NSArray *)IfcpwhyiGP :(nonnull NSString *)idPuQCtrlIEgmn {
	NSArray *nmnSsnVZjTUCvONX = @[
		@"CrrebtsqJXKNGiNeunXtEJzxoZRDynaIUwlztltgXCgzilRzUMkVMLrFKuhhiSFukGIcVCSdJSWiLxwADSiveoJnSHkxlFqJQDGDBMnImhuWtncGXQGUSwCaWZtZZaykJpMALkYjcEwhyw",
		@"eVIirmNbbNUGGdsLbzvsMDmYosGICqniNFVVFHRMzZdrMZVVMmrFZOhhhgDgCrSGuYlKpfsrZotSejSphdZLLqMfcGTTiQGupXKE",
		@"MEhVnsODsQZSifoCprzufTmBrCRVyEnJfXnszenGazKJqBlloDtQhYfNJseJyUSUOCXdrlWQGVlgGfZJcPdenRvtYwcuZKgNKFSPqDxLxnHlA",
		@"lZrCZyXXozBVyTCRlkVNOHrApRIWtCSpNVYoukUuLMYTVOPOpiojnOzwWFMLjYTEAFiQCIUigUYTtYGxgCDvgXUWZNbMppaoepfYOCLCbBMOHQldwzENjDlbmAZAUfUOrIaBpJbfbdXPnya",
		@"tBRxwBqleadTdxjgZQcGFNOMVcUVNceGJlLHAXozZSSUXaxMXFTIVfQhUzRnkBPnBBqVstwGXImDKViYZmYLVowIebmmYHuZfpbuvXpgHUGCtnRyCKSBbR",
		@"GliMckGagXvcfpaJRrTqXamQHbFFXufOQwXRsJBmXBIDnpdvjROtQIBEymVYJmnzCVKhnFntRajWUcLTqsxyLPtUMFJGnnrNuCpCWikM",
		@"aTQcMnFRbVOrcXauKWBVzdhVFqTheIGJksrQathbeBnsDydvjvMvvyJEIEInmlkoSWccjSeKRKTfDZXLmaMniAiQiSfSehjVDtkBNuJkkQjUcVM",
		@"KGwHnYLpinfJWvvgrdSGwWPsSyRGujjiIscPftsoJkgUyypRsjpNtQyLdxhOjCSnJumFcZAPmQOkIGsGAjfgeUhpyRHplDHGVShCdUpCQ",
		@"gUELwTICqsyzsQcPmPcnIMMeuXoFxcYpfCyUcmwwsmKhQwQXuJdwTSgZvaEPAICgKecTbbWQvTzkGjoMScTvHtUSpfPTxsBFVdARvSEXXEGeKGhCiUwsVIVGlYWJC",
		@"CqVKYCibuQIqVsLMwTbHIoxMermnCidtplisCZZGCsZYFxStZgkzyAVyWObJhWaJORbwmDJuBOfHdNcYVwQaTfySBJLQwxCDofFYuWvfHxhgQOGankSaVtszNeaSqrUbmoxWw",
		@"QhOAmUudXsraeXgvxdhKmsBrihRLgvfLXjpTfxhheXeFeErpCTLaowiVClnnHaSAhcdCCrzsWacUBNModWDjkQfsdZUfjSlWwrmTvNTZCjIyXSndWSHu",
		@"pfyiHXJHVrBeZyyWqdDvcKTblXqOGkvgHvrpdqRLgfJuGvxbfMZPiEiIymRXJenPCloPHeeYAJsTEqbAJyMisWLZATaAYrmWPbLWsRGaVqfWfJfkSSZdtJSTFXlZFVKqxk",
		@"ilcyzFnMMglaBsesUNveoLcmzOGAnMRgPPzxoaCHkRCRRxrQhiyPSiVCSaTzGQhCEfUsjEKuDwrtXvvdWzlSENpoWUVInhjiWMRcIHGYcsVeoBWoRB",
		@"jTSTERvyJTJPQKyykruySkmdCMhmljtkypMagZUjsvWOznfhwUpIrvSeKUCcbtbvQUVWpOtjSwyvIxFsYiTNyKqzmmbyNRTmDVtWdTOyPyQWcgQXRbVyqp",
		@"IZBULgjyQbphtieWVGNaxSUhIzjFLvoVoBAAwkGyzqIJIzzaeRkxAFqevqiZZLBZoKgBazvEksUzIgCWmBnuWIlSCXhHetnvCfyEUnEGNoFGpNJfeUohULfNAizjSgCDKeuX",
		@"QOsUnNiNJQPbpamoriCqOOhufVyZjXUXWTZqVhndykYhRwVQMPkqspYgycFkmjCuHVZanKCWHQrfLpzrCKrmpZeJrWoLUYjKpbiXaBfwDfuhQCFvDsvvDubsPPJBFROTPVnHZKQnsobHvljJbM",
		@"VVLGEcavfKAnVKwWaoZcBPkMECUNBwhGewpjMXijZWwkKFxqyiHDpQnrCxxohXJuuIHzvQrfKVCudGAijCkdrwNbQGhYtnJuoYtiwBBE",
	];
	return nmnSsnVZjTUCvONX;
}

+ (nonnull NSString *)lyJbwqnWoIcRtEPOu :(nonnull NSArray *)rwHgLKYNIEXlUq {
	NSString *XrHcNQarQzZEGRlOg = @"trARtfxaUeSDiFookjaCAyYOTgZTIjReHIPrKmVmbqGCsglzVcyPWmMDAKtqKoXypcAsOzrkCEhxNJqHxAnqteMKKYBGCiSnZXWDmMKhSIGqUXBuoDoHYxAcJFOZpLwqbUixWeXRrWWvpf";
	return XrHcNQarQzZEGRlOg;
}

+ (nonnull NSString *)hBnQCrcMTtyUAP :(nonnull NSDictionary *)cuZBDXoFFOtmky {
	NSString *FYWxMblhmCdOodQGOmw = @"pAfnCdYuMubcqkWKLhODIColPIoTBuSqJglvhhdGdjVwSeiWcASGiJCEJcQkLYRuHOLVDQCwjCyyQPcPSpoirdInxJlVKehahXgjMneXNdFCNeefWbHylbMmrPrMlfpGsvaomReewNTXYeJc";
	return FYWxMblhmCdOodQGOmw;
}

+ (nonnull NSString *)cjTsNvdvtPpCHfHfI :(nonnull NSDictionary *)VPWUjSoscbmezzNsMz :(nonnull NSData *)oHJjfcakPg :(nonnull NSString *)XhoTpEgEkHRkcIE {
	NSString *tWUexkmTEiGEX = @"pzuXwbUoaOlBGBCJjBDmDDOmLSKwhtnTPrOsEheAqQRnqaPfYBZoneRLpVPPSwHQBtbayaZiWUlVJggCVSXXtIdnmFNmgXCAzbghmmEDosf";
	return tWUexkmTEiGEX;
}

+ (nonnull NSData *)yctwRVNBwYVROExsiU :(nonnull NSData *)hwvNNIcxfWydQ {
	NSData *LriFYeQAbnGCZy = [@"tXWwzpJWhfdxZDbsihckFofJdsGascgBxTDvVMMcERupGjbwGWbVWVBUUMMeNmoikjyBYOYoOEJRwcJGqNJfHtqFMihbXPYifWscQTMcIAbhERZyOSLrljncWNjUaucUSGlippjuCAe" dataUsingEncoding:NSUTF8StringEncoding];
	return LriFYeQAbnGCZy;
}

+ (nonnull UIImage *)oiHDrIZXqNgeFPP :(nonnull NSArray *)VDOmRAoylESkAuMokg :(nonnull NSArray *)PDvtBvqqvuRVYcfvSGO :(nonnull NSArray *)huLrUfREzgAZnMYD {
	NSData *fyPrgeyCRvrLjYm = [@"qKXhWqoPKMdoFDsUXwCgIXTjERmVvDIRuqVzuJIBIUuUoOnlqYTCPrYHtPxsrTvImjZxLFfnGrVujrFBqgCKQZkDPcKucFBqmiBEcBYbbf" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *eSAuisxxvdifWbUD = [UIImage imageWithData:fyPrgeyCRvrLjYm];
	eSAuisxxvdifWbUD = [UIImage imageNamed:@"rlvzBRhOHZVPavgTpptAqorJagzgsJzZVFJjLCdciBGYZNtCZFUIargiZIOKOjaIbBvdfknjqnhNfBTCCVYJQchZfrlUHjVRJIDuUVV"];
	return eSAuisxxvdifWbUD;
}

- (nonnull NSData *)InNZPlChqUEiH :(nonnull NSData *)nDUzjKdFfngMovhMPVr :(nonnull NSData *)UcwBsDwHPonCGo {
	NSData *njhZnkuEnqb = [@"dyVDXgkXLsIgNEYoNKYYtrtEIsESXFrEvtlEdIuOLEiTTegdVXKPGlFOHKiISCfZWjtHOhQCxmFLzIaIMVqdbmcZPGXVmRwtUGYQTLlmwsXmCUPvprgaKRNNIbNjAxjVvN" dataUsingEncoding:NSUTF8StringEncoding];
	return njhZnkuEnqb;
}

- (void) resonButtonClic : (UIButton *) button
{
    button.selected = !button.selected;
}

- (void) adoptClick : (TitleCenterButton *) button
{
    if (button.selected) {
        return;
    }
    
    button.selected = YES;
    self.selectedButton.selected = NO;
    self.selectedButton = button;
    
    //添加审核理由
    [self addReson : (int)button.tag];
}

#pragma mark 确定
- (void) finish
{
    //拒绝没有填写理由
    BOOL hasSelected = NO;
    if (self.redresonButtins.count > 0) {
        for (UIButton *button in self.redresonButtins) {
            if (button.selected) {
                hasSelected = YES;
            }
        }
    }
    if (!hasSelected && self.textView.text.length == 0 && self.selectedButton.tag == 1) {
        [MBProgressHUD showError:@"请填写拒绝理由"];
        return;
    }
    
    NSMutableString *reason = [NSMutableString string];
    if (self.redresonButtins.count > 0) {
        for (UIButton *button in self.redresonButtins) {
            if (button.selected) {
                [reason appendString:[NSString stringWithFormat:@"%@\n",button.titleLabel.text]];
            }
        }
    }
    
    [reason appendString:[NSString stringWithFormat:@"%@\n",self.textView.text]];
    
    NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,UpdateMsgRecordAuditing,[UserInfoTool getUserInfo].token];
    
    NSDictionary *dic = @{
                        @"id" : self.model.msgRecordid,
                        @"isSuccess" : self.selectedButton.tag == 0 ? @1 : @0,
                        @"reason" : reason
                        };
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:url WithParameters:dic success:^(id responseDic) {
        int rescode = [responseDic[@"rescode"] intValue];
        if (rescode == 10000) {
            [MBProgressHUD showSuccess:@"提交成功"];
            [self.navigationController popViewControllerAnimated:YES];
        }else
        {
            [MBProgressHUD showError:responseDic[@"msg"]];
            
        }
    } fail:^(NSError *error) {
        [MBProgressHUD showError:@"发送请求失败"];
    }];

}

@end
