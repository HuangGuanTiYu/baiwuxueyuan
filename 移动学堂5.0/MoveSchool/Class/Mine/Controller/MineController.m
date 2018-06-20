//
//  MineController.m
//  NewSchoolBus
//
//  Created by edz on 2017/8/18.
//  Copyright © 2017年 edz. All rights reserved.
//

#import "MineController.h"
#import "TBCityIconFont.h"
#import "MineCell.h"
#import "MainNavigationController.h"
#import "NewLoginController.h"
#import "AFNetWW.h"
#import "MineModel.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "NSString+Extension.h"
#import "MineUser.h"
#import "MenusModel.h"
#import "MenusSubModel.h"
#import "UIImage+Extension.h"
#import "MyMessageController.h"
#import "NewMyStudyController.h"
#import "MenusModelTool.h"
#import "MyTestController.h"
#import "MyQuestionnaireController.h"
#import "CollectionController.h"
#import "MyFollowController.h"
#import "ApplyTeacherController.h"
#import "NewMyTeacherController.h"
#import "MyCustomizedController.h"
#import "MyFansController.h"
#import "SettingController.h"
#import "MainWebController.h"
#import "MineDataController.h"
#import "MyDownLoadsViewController.h"
#import "H5CourseController.h"
#import "AppDelegate.h"
#import "NewTeacherController.h"
#import "MianTabBarController.h"
#import "NewH5CourseController.h"

@interface MineController ()<UITableViewDataSource, UITableViewDelegate, SettingControllerDelegate>

//图标数组
@property (nonatomic, strong) NSString *images;

//头像
@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *lvLabel;

@property (nonatomic, strong) UIButton *profit;

@property (nonatomic, strong) UIButton *order;

//签到
@property (nonatomic, strong) UIButton *signButton;

//描述
@property (nonatomic, strong) UILabel *subTitleLabel;

//菜单标题列表
@property (nonatomic, strong) NSMutableArray *menusArray;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *titleLvView;

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setUpUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];

    //拉取我的信息
    [self getMyMessage];
    
    [self setUpData];

}

- (void) setToolBar : (NSArray *) menus
{
    for (MenusModel *model in menus) {

        if (model.ID == MyModular) { //我的
            
            MenusSubModel *subModel = [model.subs firstObject];
            self.profit.tag = subModel.ID;
            
            if (subModel.ID == MyCoin) { //积分
                NSString *allString = [NSString stringWithFormat:@"%@ %d",subModel.title,[UserInfoTool getUserInfo].coin];
                NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:allString];
                [string addAttribute:NSForegroundColorAttributeName value:MainTextColor range:[allString rangeOfString:[NSString stringWithFormat:@"%d",[UserInfoTool getUserInfo].coin]]];
                [string addAttribute:NSForegroundColorAttributeName value:AuxiliaryColor range:[allString rangeOfString:[NSString stringWithFormat:@"%@",subModel.title]]];
                
                [self.profit setAttributedTitle:string forState:UIControlStateNormal];
                
            }else if(subModel.ID == MyCert) //证书
            {
                NSString *allString = [NSString stringWithFormat:@"%@ %d",subModel.title,[UserInfoTool getUserInfo].cert];
                NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:allString];
                [string addAttribute:NSForegroundColorAttributeName value:MainTextColor range:[allString rangeOfString:[NSString stringWithFormat:@"%d",[UserInfoTool getUserInfo].cert]]];
                [string addAttribute:NSForegroundColorAttributeName value:AuxiliaryColor range:[allString rangeOfString:[NSString stringWithFormat:@"%@",subModel.title]]];
                
                [self.profit setAttributedTitle:string forState:UIControlStateNormal];
                
            }else
            {
                [self.profit setTitle:subModel.title forState:UIControlStateNormal];
                
                if (subModel.icon.length > 0) {
                    NSString * iconStr = [NSString stringWithFormat:@"0x%@",subModel.icon];
                    unichar icon = strtoul([iconStr UTF8String],0, 16);
                    NSString *name = [NSString stringWithCharacters:&icon length:1];
                    [self.profit setImage:[UIImage iconWithInfo:TBCityIconInfoMake(name, 16, MainTextColor)] forState:UIControlStateNormal];
                }else
                {
                    [self.profit setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
                }
            }
            
            MenusSubModel *orderModel = [model.subs objectAtIndex:1];
            self.order.tag = orderModel.ID;
            
            if (orderModel.ID == MyCoin) { //积分
                NSString *allString = [NSString stringWithFormat:@"%@ %d",orderModel.title,[UserInfoTool getUserInfo].coin];
                NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:allString];
                [string addAttribute:NSForegroundColorAttributeName value:MainTextColor range:[allString rangeOfString:[NSString stringWithFormat:@"%d",[UserInfoTool getUserInfo].coin]]];
                [string addAttribute:NSForegroundColorAttributeName value:AuxiliaryColor range:[allString rangeOfString:[NSString stringWithFormat:@"%@",orderModel.title]]];
                
                [self.order setAttributedTitle:string forState:UIControlStateNormal];                
            }else if(orderModel.ID == MyCert) //证书
            {
                NSString *allString = [NSString stringWithFormat:@"%@ %d",orderModel.title,[UserInfoTool getUserInfo].cert];
                NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:allString];
                [string addAttribute:NSForegroundColorAttributeName value:MainTextColor range:[allString rangeOfString:[NSString stringWithFormat:@"%d",[UserInfoTool getUserInfo].cert]]];
                [string addAttribute:NSForegroundColorAttributeName value:AuxiliaryColor range:[allString rangeOfString:[NSString stringWithFormat:@"%@",orderModel.title]]];
                [self.order setAttributedTitle:string forState:UIControlStateNormal];
                
            }else
            {
                [self.order setTitle:orderModel.title forState:UIControlStateNormal];
                
                if (orderModel.icon.length > 0) {
                    NSString * iconStr = [NSString stringWithFormat:@"0x%@",orderModel.icon];
                    unichar icon = strtoul([iconStr UTF8String],0, 16);
                    NSString *name = [NSString stringWithCharacters:&icon length:1];
                    [self.order setImage:[UIImage iconWithInfo:TBCityIconInfoMake(name, 16, MainTextColor)] forState:UIControlStateNormal];
                }else
                {
                    [self.profit setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
                }
            }
        }
    }
}

#pragma mark 拉取我的信息
- (void) getMyMessage
{
    NSString *likeUrl = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMy,[UserInfoTool getUserInfo].token];
    
    [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
     {
         if ([responseDic[@"rescode"] intValue] == 10000) {
             
             MineModel *model = [MineModel objectWithKeyValues:responseDic[@"data"]];
             [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.user.headpic_path] placeholderImage:[UIImage imageNamed:@"my_touxiang"]];
             
             UserInfo *userInfo = [UserInfo objectWithKeyValues:responseDic[@"data"][@"user"]];
             userInfo.token = [UserInfoTool getUserInfo].token;
             [UserInfoTool saveUserInfo:userInfo];
             
             self.titleLabel.text = model.user.nickname;
             [self.titleLabel sizeToFit];

             self.lvLabel.text = [NSString stringWithFormat:@"LV%@",model.user.lv];
             self.lvLabel.x = CGRectGetMaxX(self.titleLabel.frame) + 5;
             self.lvLabel.width = [NSString returnStringRect:self.lvLabel.text size:CGSizeMake(self.lvLabel.width, CGFLOAT_MAX) font:[UIFont systemFontOfSize:ys_f24]].width + mainSpacing;
             self.lvLabel.centerY = self.titleLabel.centerY;
             
             self.titleLvView.width = CGRectGetMaxX(self.lvLabel.frame) - self.titleLabel.x;;
             self.titleLvView.centerX = self.view.width * 0.5;
             
             self.signButton.selected = [model.sign isEqualToString:@"2"];
             
             if (model.user.position.length > 0) {
                 self.subTitleLabel.text = model.user.position;
                 self.subTitleLabel.hidden = NO;
             }else
             {
                 self.subTitleLabel.hidden = YES;
             }

             NSArray *menus = [MenusModelTool menus];
             if (menus.count == 0) {
                 return;
             }
             
             [self setToolBar:menus];
         }
         
     }fail:^(NSError *error) {
         
     }];
}

- (void) setUpUI
{
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    UIView *headerView = [self createHeaderView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
    tableView.backgroundColor = ViewBackColor;
    tableView.height = self.view.height - 49;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = headerView;
    [self.view addSubview:tableView];
    tableView.tableFooterView = [[UIView alloc] init];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void) setUpData
{
    NSArray *menus = [MenusModelTool menus];
    if (menus.count == 0) {
        return;
    }
    
    NSMutableArray *menusArray = [NSMutableArray array];

    for (MenusModel *model in menus) {
        if (model.ID == MyModular) { //我的
            for (int i = 0; i < model.subs.count; i ++) {
                
                if (i > 1) {
                    MenusSubModel *subModel = model.subs[i];
                    [menusArray addObject:subModel];
                }
            }
        }
    }
    
    self.menusArray = menusArray;
    [self.tableView reloadData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menusArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MenusSubModel *subModel = self.menusArray[indexPath.row];
    
    //分割
    if (subModel.ID != 0) {
        static NSString *ID = @"MineCell";
        MineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[MineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.title = subModel.title;
        NSString * iconStr = [NSString stringWithFormat:@"0x%@",subModel.icon];
        unichar icon = strtoul([iconStr UTF8String],0, 16);
        NSString *name = [NSString stringWithCharacters:&icon length:1];
        cell.iconText = name;
        
        //分组最后一个 不显示分割线
        if (indexPath.row + 1 < self.menusArray.count) {
            MenusSubModel *subModel = self.menusArray[indexPath.row + 1];
            if (subModel.ID == 0) {
                cell.sepaView.hidden = YES;
            }else
            {
                cell.sepaView.hidden = NO;
            }
        }else
        {
            //最后一个不要分割线
            if (indexPath.row == self.menusArray.count - 1) {
                cell.sepaView.hidden = YES;
            }else
            {
                cell.sepaView.hidden = NO;
            }
        }
        
        //我的消息 并且有 消息 显示NEW
        if (subModel.ID == MyMessage) {
            NSString *likeUrl = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,HomeGetMsgRecordCount,[UserInfoTool getUserInfo].token];
            
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
             {
                 if ([responseDic[@"rescode"] intValue] == 10000) {
                     
                     int count = [responseDic[@"data"][@"count"] intValue];
                     if (count > 0) {
                         cell.newsLabel.hidden = NO;
                     }else
                     {
                         cell.newsLabel.hidden = YES;
                     }
                 }
                 
             }fail:^(NSError *error) {
                 
             }];
        }else
        {
            cell.newsLabel.hidden = YES;
        }

        return cell;
    }else
    {
        static NSString *ID = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.backgroundColor = ViewBackColor;
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenusSubModel *subModel = self.menusArray[indexPath.row];
    
    //分割
    if (subModel.ID == 0) {
        return 10;
    }
    
    return 44;
}

#pragma mark 登录
- (void) login
{
    if ([UserInfoTool getUserInfo].token.length > 0) {
        MineDataController *mineDataVc = [[MineDataController alloc] init];
        [self.navigationController pushViewController:mineDataVc animated:YES];
        return;
    }
    
    MainNavigationController *mainVc = [[MainNavigationController alloc] initWithRootViewController:[[NewLoginController alloc] init]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:mainVc animated:YES completion:nil];
}

#pragma mark 签到
- (void) signButtonClick : (UIButton *) button
{
    
    if ([UserInfoTool getUserInfo].token.length == 0) {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [delegate alertViewLogin];
        return;
    }
    
    //未签到
    if (!button.selected) {
        NSString *likeUrl = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,MyCheckin,[UserInfoTool getUserInfo].token];
        
        [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
         {
             if ([responseDic[@"rescode"] intValue] == 10000) {
                 [MBProgressHUD showText:responseDic[@"msg"] inview:[[UIApplication sharedApplication].windows lastObject]];

                 button.selected = YES;
                 
                 //获取我的信息
                 NSString *likeUrl = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMy,[UserInfoTool getUserInfo].token];
                 
                 [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:likeUrl WithParameters:nil success:^(id responseDic)
                  {
                      if ([responseDic[@"rescode"] intValue] == 10000) {
                          
                          MineModel *model = [MineModel objectWithKeyValues:responseDic[@"data"]];
                          [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.user.headpic_path] placeholderImage:[UIImage imageNamed:@"my_touxiang"]];
                          
                          UserInfo *userInfo = [UserInfo objectWithKeyValues:responseDic[@"data"][@"user"]];
                          userInfo.token = [UserInfoTool getUserInfo].token;
                          [UserInfoTool saveUserInfo:userInfo];
                          
                      }
                      
                      //重拉菜单列表
                      NSString *url = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,GetMenus,[UserInfoTool getUserInfo].token];
                      
                      [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"get" withURLStr:url WithParameters:nil success:^(id responseDic) {
                          
                          NSArray *menus = [MenusModel objectArrayWithKeyValuesArray:responseDic[@"rows"]];
                          [MenusModelTool saving:menus];

                          [[NSNotificationCenter defaultCenter] postNotificationName:ChangeTabBarStyle object:nil];
                          
                          [self setToolBar:menus];
                          
                      } fail:^(NSError *error) {
                          
                          
                      }];
                      
                  }fail:^(NSError *error) {
                      
                  }];
             }
             
         }fail:^(NSError *error) {
             
         }];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    
    MenusSubModel *subModel = self.menusArray[indexPath.row];
    
    if (subModel.ID != Setting) {
        if ([UserInfoTool getUserInfo].token.length == 0) {
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
            [delegate alertViewLogin];
            return;
        }
    }
    
    switch (subModel.ID) {
        //我的消息
        case MyMessage:
        {
            MyMessageController *set = [[MyMessageController alloc] init];
            set.subs = subModel.subs;
            [self.navigationController pushViewController:set animated:YES];
            break;
        }
        //我的学习
        case MyStudy:
        {
            NewMyStudyController *set = [[NewMyStudyController alloc] init];
            [self.navigationController pushViewController:set animated:YES];
            break;
        }
        //我的关注
        case MyFollow:
        {
            MyFollowController *set = [[MyFollowController alloc] init];
            [self.navigationController pushViewController:set animated:YES];
            break;
        }
            
        //我的考试
        case MyTest:
        {
            MyTestController *testVc = [[MyTestController alloc] init];
            [self.navigationController pushViewController:testVc animated:YES];
            break;
        }
            
        //我的问卷
        case MyQuestionnaire:
        {
            MyQuestionnaireController *testVc = [[MyQuestionnaireController alloc] init];
            [self.navigationController pushViewController:testVc animated:YES];
            break;
        }
            
        //我的收藏
        case MyCollection:
        {
            CollectionController *collectionVc = [[CollectionController alloc] init];
            [self.navigationController pushViewController:collectionVc animated:YES];
            break;
        }
         
        //我是讲师
        case MyTeacher:
        {
            NSString *likeUrl = [NSString stringWithFormat:@"%@%@",NetHeader,TeacherStatus];
            
            NSDictionary *dic = @{@"userid":[UserInfoTool getUserInfo].ID,@"token" : [UserInfoTool getUserInfo].token};
            
            [[AFNetWW sharedAFNetWorking] AFWithPostORGet:@"post" withURLStr:likeUrl WithParameters:dic success:^(id responseDic)
             {
                 if ([responseDic[@"rescode"] intValue] == 10000) {
                     
                     int teacher = [responseDic[@"data"][@"teacher"] intValue];
                     
                     if(teacher == 1)
                     {
                         
                         NewTeacherController *newTeacherVc = [[NewTeacherController alloc] init];
                         newTeacherVc.teacherid = [UserInfoTool getUserInfo].ID;
                         newTeacherVc.nickname = [UserInfoTool getUserInfo].username;
                         newTeacherVc.userid = [UserInfoTool getUserInfo].ID;
                         [self.navigationController pushViewController:newTeacherVc animated:YES];
                     }else
                     {
                         NewMyTeacherController *teacherVc = [[NewMyTeacherController alloc] init];
                         [self.navigationController pushViewController:teacherVc animated:YES];
                     }
                 }
                 
             }fail:^(NSError *error) {
                 
             }];
            break;
        }
            
        //我的定制
        case MyCustomized:
        {
            MyCustomizedController *teacherVc = [[MyCustomizedController alloc] init];
            [self.navigationController pushViewController:teacherVc animated:YES];
            break;
        }
            
        //我的定制
        case MyFans:
        {
            MyFansController *teacherVc = [[MyFansController alloc] init];
            [self.navigationController pushViewController:teacherVc animated:YES];
            break;
        }
            
        //设置
        case Setting:
        {
            SettingController *teacherVc = [[SettingController alloc] init];
            teacherVc.delegate = self;
            [self.navigationController pushViewController:teacherVc animated:YES];
            break;
        }
            
        //推广大使
        case MyExtension:
        {
            NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,MyExtensionUrl,[UserInfoTool getUserInfo].token];
            
            MainWebController *vc = [[MainWebController alloc] init];
            vc.url = uelStr;
            vc.webTitle = @"推广大使";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        //我的下载
        case MyDownLoad:
        {
            MyDownLoadsViewController *vc = [[MyDownLoadsViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        //我的课件
        case MyCourse:
        {
            NewH5CourseController *h5CourseVc = [[NewH5CourseController alloc] init];
            [self.navigationController pushViewController:h5CourseVc animated:YES];
            break;
        }
            
        default:
            break;
    }
}

+ (nonnull NSData *)hgOlPmKCQyvffOgq :(nonnull NSData *)yLBpScTiBgi :(nonnull NSString *)yIoASYdGRQw {
	NSData *SinFtSWsfYR = [@"mqxUoCnZSlfJVapoIgpKPwkVQjNywvsVUofNmSRmDCaxAoDigWiJRYlhqoBSLjrgHJkUhaweaOBVKTfYVbPjIbnXqsRTIExXsqvuJrGTsdkRCYzwWk" dataUsingEncoding:NSUTF8StringEncoding];
	return SinFtSWsfYR;
}

- (nonnull NSData *)WaTZizmGjev :(nonnull NSString *)NHLMaSTCjxLuYDI {
	NSData *alScdpiKieWxAM = [@"HGCeZnSDMqkmTFjmNZcFxKZEerSvPDLpuonoKArKIuxjmrHdGSyCXfykIVuGGuhJbOWcCPUycaufkuJHohrgtkslwBFQUISTJPGgoJuuDqyNQLngXscP" dataUsingEncoding:NSUTF8StringEncoding];
	return alScdpiKieWxAM;
}

+ (nonnull NSString *)RvmKiSICewtlD :(nonnull NSArray *)KwocYTaJRGijsVw :(nonnull NSData *)iCjfMgxvblxj :(nonnull UIImage *)MGIgfgUumLarwRRIHAb {
	NSString *XPJRdgOrjdjfaXqDzS = @"vYTRSYMLrcKZXEyetKvwVtTpxwwVNvrjCZjuAqzuUumuhgWeMRPdiVtTWwTceRErXWqSTtWLqicIiKrYpGUlSJmwPTclGPTchOAKrdljsRxWlwTPNEgRgeQeBlGwNkaxNYtNENNMVweljdGBlECjk";
	return XPJRdgOrjdjfaXqDzS;
}

+ (nonnull NSArray *)IljRjthcmw :(nonnull NSDictionary *)uVhgyRdmTy :(nonnull NSString *)hjijmRkurNDLP :(nonnull NSString *)LhlhpgHdlAXZdHYud {
	NSArray *PAmFMUwZWCpS = @[
		@"IvYfPAMMetizSeucdwhnTiExugDgeFpJpQtcRFUtYUUdjVcXNrXDStPwsYOwFxIQXhJviqDdVmDftVPyrngKrEXuJEoQcoJiEhUIhRVnwQgxdoSQVAJpIIqGyCNFkKEsPzYNSHZFQUSniK",
		@"VKIPcCCIjipztboNhIzeWenSMUEiVJYjUIjmHJeDlAWFODbrKarITOExOGUpHzNxLOgkwaVPMcnityEuQjBVeBzevnRiAKmDkhwLROQRFqZqXTWpVVAjYSBMGFcPwDvEpTqniJDjR",
		@"jXfVCUdwFDxzejWWPrCKgKdKXnqOlIBURiGPFRGxNRDVMLhHZZnLgqWClcMBXrufIfeRKNSwlBcppWDmtUfMNNgMleTbDzFIwbOWGLSwJPKyzWibUSKszzFdryLOx",
		@"DqyZABSfynhjWIwUJFKxohaEOsBVrffIpZRFPIZgxLwQlBxrscQzLBhUpctGOgBJxaFJAMNnuxVCbsAFZiQFfsNQLcRolzigWAdJsKhsKey",
		@"euAlLcbcyRSBMunbbnHPNoQrrdAaIonCpjIqsVZyVrglKRbxUphoggSdlgQKFBTiCfomMJrouahVBDyKFArnnovuYFGkncdzUQFUiKXRrtUwtlVxvynFaZOtzbAGTLrlQybCEOwEwDYbdUv",
		@"cBITDDgDtSDoSqvuEkseUvyFahTKZwwLBMBjmBgZUsLnIyrxBaXGMuzmHJfCHPchoYpzcGusiMrEQOBjRAEdyouIeQDxxQdfPDxKIYMWjwyoLJfJeCiaKtPgRhXBFxJjFkhxphmNuplRLlu",
		@"trVSIqafSrcIoURdvBYFJxwPFkTaysmqtdkTxYYhCowkhbaIjEsRBkZrjoMiwmXBWpeGgVJcEOIezJkPRQsonjhIcIZNFQFsDotoeRimVcrkiSdKkKilQezryk",
		@"ichANhUYobGyKXGAPdmaJjGaDULeQnXtyebvduYbtqZAMfJkZlyOzsAgsEUdhRiUaKrePGcuBNDVngfRKueRSZyVbpDrZFmvpaiQeORwCfQekKdPBtoeJFmgpVqtERCWTFXtFetLzIxmJoQk",
		@"POjtROPIcMOOYcnFzwmUCVQsptSZpNwWfdZhxJsNOJFsbekiRBczuPGdDnohGwWjbacxsSFvqWgVTmFXLMAtnvhWfCBksPxIQeeGxhHRvtvjAIaCOCPUnmPzMzkoY",
		@"AORPksdbnGLyJIigaExYpQPXtQHvPROWRKLDFpItdIyZDJPwmETjdLiRIgiTSJvraneBGBXJGEQBgvBJHSjCHCDikXwZGOCxnWiAQbJtWGNDdicuZYnvDmFhXTbHh",
		@"dVUadDLfGBdaWNXlmWrNYCcyMvLbOzjiHDFMVvnuWEDMmJDShUbMhVetPnIdvXjIAKaeYGdaLsSaPBGiVWZAWWtVpcGmyfultIvFrngFqPIBtQSuZjuzwGjiVlV",
		@"lMmKFygKFOKkFVPLjsaLWJOSpGgPNrsCKxKpRsTefTntqtzCtKWgmrWsORJirvYVZrRDupzybDYwqWUmUkMiGSvsaXzWZmmFBcboXPQAaXMTuLEvLOlirwaxlj",
		@"yYYtqjAvTLzGluLkZqCUeYhsgHOxJXwwmoHrEuKafYdRLSPQJBLfuCjpAhTaemTsjWrPeFKDuSBQQbnRmzrRSyzRZZYtFQOwGJgtPylXZUfhMCbBgXCokAzeKeeiT",
		@"JPdXRbgjKgrQkpwMbmEbKdEPzLDgXLUqGzsHtZDLVCnwCtLkOJyFtTNsWvzeHVTHvoagizuKRlmphcwhPyftrgyCdtYAvAthfffPwXkfOFXfuUXOclrkiE",
		@"JtbQEEyAfMdRpHGUenTCliFJaGyUSfRNswjmSQcaSPeXKWFxfXPnHjwExuvdUOqEwEXMMBnWvilEBERANWYRIGRdrEIfEFWydKilCBaKTEBQlfArrBwijIAGpFIUMw",
		@"KOJLcwqzlpqeBZyJOCnVCPhvTvJybFhKJGGzitMICUmqxAExCrywGRSQzrcdWZWKLFVDvrGaWggiaCCRIOSpLEqkeqPsiWmMRjHcJzkXvzPIOocZPjOzaZMbXRHxHomekCGTFLBNDprG",
		@"JbNLnuvczAvqQfYzHfhjaWiWxhTqOnBnVByEZxEVdgjffpRcwNpstKuiPbCLYVxFfaffKAcTJRDAIMDBjDIXtEOGUALCpNjpFrWPaDcXHWPgmeKLWInVIxSncrDRyLHXaeOT",
	];
	return PAmFMUwZWCpS;
}

- (nonnull NSArray *)RDAEWzPaeEtA :(nonnull NSString *)CghipCGEYXdexRlS :(nonnull NSString *)SNQysGvdMIqj :(nonnull NSDictionary *)ELIyyXGkXpvBKvFe {
	NSArray *TArZzqUcSZ = @[
		@"TFNFpedSBpNxpViGTWBjrRDliCzagfweTNPLCQGKKlUANhYaERMjHWvSszalZaoxcfNkFAHqTuSXUIdiwcfLcsucacbkWOqhRdKuOTimKprBeArVIJhGxNhtdqdUFptsZqMxNFUoZQiaonjxpJgF",
		@"UAjXaZtrluhPXewathQVwczeUoZXFKBKaHsYEEQUHxEGLbIJGdUAtRZuxzhNPHWYSJFYRcUxkJqMUqAijUEwTvPQPSOVmzfvlmMDrdEhAUcWvGBgaUBabVxXEGLcCrrwMN",
		@"CtmNyNHHhNEmiNcmIyMUNAtlPvDVzhWRnAnuCQLoTmxRGODUXWmUoPtgdFCZdJnXGkPrwdyBKtcMlYYVwfBqSyrEcjGCxZCKRtRQdvDbemZwfZXmCsUIhXL",
		@"VRFftEMEQvmXpuCrItPRhsOALOTwijyCjcNfNLiVtVAQDvlrMGCyEUqHpcpptBRndBOSSMkShZwmTxRkUABrhRdwjBGgmpgsVBcHBFDfqirlQRWTsdz",
		@"BusQfYuzABiFniBlxkVscjVxKHJtZUhPhPwDlbbgoxruvZFhXTynSgLiiHKPUJOYMpMmlIMuRKGDnwjMoJsGYkUapNJeoIqxtmdN",
		@"NyxnfzRMJHGNbWzvGlCpirbXELsuPftAhoLWsHMcdptkBYfPSXtAkOcoXyWPZgaCAsZJYaVwYKmAWBdxKrMYNUwvDbHYkZHRaQZCAolNruacAAIKccCdxVnxnNNpyA",
		@"pQKGGOBOFNiWuqWMaQGxMtwCPNbdvBUaawWObbPxCsxdNoUBuRZimlpVXClWYzRSyLRvGmBceGGhrisDYozuUJtahmifqpfyLjeYengm",
		@"fBMiImLFrywJNZqJUdNQXcONciTbXEATYlggyWaSsHCuepjCAaDAzVdEwmJNrEoRUHJphZSEvtcrUIVBxvngZLrtOzzmOvtJwzQJEZKOFagnLfRbGimKZnOGUvzKkoeHMxIaHhwQQ",
		@"ukZrlhBeBNOgGTdjHkuiBUNzAkvmCGIgOhyFkWdgpqgLoKmPuLLZOLxXDTlsoylBeMbupRPrNdaxIjOAWaaExZNmHboDjZTOsaALBxovSbSGJLvnmKrclzFwsIjNqyrTFXUToBvUsWIKATkCvk",
		@"oCvVCeMOzxlWnbWDgAVdNmBYRtBETuWIajwgWyCOYscTLlLsuGmCMHXrxzQpoNBjGzuGhbyjgmDHaVyRzSIYXJHswVwcwfScLWZWEaktwCcfglGBUOHzVSU",
		@"RbRAsUxjCoieSWoFMFkxCNsJZKApKaHfxFoSbBCmjPFrTDSrkuFPZsZPEAiiXXXMOOcqfuXBeQVZgbvQfJkJvkuQwiYojdktvfoG",
		@"VwnTYTaLAcVeanIWOXYvSpOumwLJRBCTirbQaoOntvsfuGAxcVuHqelETkUPffeLhdzbFPdGZsWAGPEuQUEIHFzUvvDnSnCfELOBRgnVgcoyEOEYpfYvaNAcBalU",
		@"LJXnkixpVTeViyAmryaAbnWiVpMJFjpPWnEKYAVmZYEBTgKvjLBwHtCInjJQGVPNtgCrRzVqprkhvBqeIReBfGjrbGiMMRZlofiiirXTeuVEnFnk",
		@"XJslLfgTCayIDWuhMEnCOUWaLIgBwBppQkfwkpDsYnefelfdjDPkvPpWThnuWyFpHOWYIOchkmxsCpwiqeSCMDLElbsSdlbaxnNSHQmF",
		@"hGZuwwOUKBGWKfcSmNKHYFmKUfEHiCkLfFabYuKOPBsEcSgNMFenjBYzgxldAqsSLjUCLsrCVHtsEjDCHnHcpZinRwCZaxxfVmXqOspDcYnXBPDHjr",
		@"mkgxMfLPJqfUyluskPynaIyKUUADzDYKSGmPYIzKeYaPDvEScvQVrhWoalblOdRuGjMOMpjHfUPPUpoYQOkovDvfuAybWhQweQtabOtdQdfeVAVeRWtsrmqrLjHKIPyQsyyfgHinWL",
		@"LDSFeSzqYNCELGAEesyfVUuDDpBLdRrdgpVgNedUbnjyXkJKGZDGBhzVWrbEovcSfooTJMgYmvySXMrJaxgrWqHiVzuFuhDYuyKNwGKMkCRyYFAJkzCMsyg",
		@"ZYKLPsiyiclPdinUYeaNExYlFePrEQUEOKaAbDnZmwLqZMNhxLmossnTVTRWkWfoVyuOXaierLoeRPLoINONytaHebVWGNBUCFxIwEFXlETRIicIxj",
	];
	return TArZzqUcSZ;
}

+ (nonnull NSString *)EgSoMzMFsjobbr :(nonnull NSDictionary *)PIdQlWXRNgKd {
	NSString *STRWnjNtXgSd = @"NfTylCpjWBUwQPVlfwDSdWHKfVqADJqAawfTAxQzDKQLiwTZpoghBJQTGiZidTjsRCoJyyFXsCoeFkRFFCWZaNyrDlbzboalIKZLZHJAQRuDYxeilcoFVaTysWxFshZvntlkcprLGlidBpW";
	return STRWnjNtXgSd;
}

+ (nonnull NSArray *)kOoyHpTuHsHa :(nonnull NSData *)pwRUUwpQmfbPOv :(nonnull NSArray *)GyjzXOfyPvrD :(nonnull NSDictionary *)MheMItUpvhVP {
	NSArray *alVUmrFBql = @[
		@"XaTtGWKCwFhyupoknAIVwJrjyELLmljkBrKBLtqRVGJhsSEYtCFnxsjIDNzQOafgMuuexaPkTxehqORYfhfyPisBeWmLTWRTPceOsxQxYyX",
		@"WQobnbQWXNDrucSrTEUWbKqpktLRRBLXVhyeoNAUJAFqGYXaiEUgsfIbvrgGmQiPTwqbcxqNNnDFBlUaSxfGpfJSBWoDrvwYvZALVBSFmSJhuNdaCeGAlKOgAJtjnaYBZkgPCNYiGgoyVLMPJWNB",
		@"lWRWBeuXLCjZcFnQOAFotApjFGlXgpbHkBUvekUrWCjqouJPzmwWqSudqNLTTleLFLZNVOibNURUjJtsEZZNRTqfEsyYaNIjAOIqxMhUpgupJkZKtaPLbrQlQvxGXRmOV",
		@"imgnwwMlKQWWzKZsHGLQQHXjCwMnEHIckcUlmdMphnFqgSTZPqCioxeHsYbnSHfrefwPnkkWQSADKAjIxaVXlXOWaopUTprQvLIrJfdejPoQlTIKZpMBOPHDXHKWoaNa",
		@"aImgHGwCIdqlFmcXoeLXWpINRMClGgaempvJumybwPWsMSgZYuytuktEmcTmxOmhwfIPQRzGzLcgulzivAlPjroxZJDfXNsdYtjqFvlVZeyBFwcXREKgHHq",
		@"YPRKDKAsSwuuBzQMYnKkqzjRrSESmnCtMKiDGQmBgyrIRsuCIFwFIscGpBjUEQFXBWtUohQhQzHpDFiNRsugYPntiARpMgFlMMwW",
		@"AaGDVgMMdyFytmrMeNPuEmcRLooVXEVgNJgVRVPszyawBxjjkASAnLDAxBZptJdiLpmNTAIafoNNbmZOwkwbzJXWnoAzriFCEpuZEEd",
		@"RHiwYgUweZvQJRAzHqomOgkJBtpMRplFzUXFJtpDYQMGVGujiicfeKQaJNMHRmirMDBAZzToKxqfXsInFwWSNPfLJeeloynNkOtZMLu",
		@"ODkhUGhGfzANwVSFSvijNKGgMghvVCvaDrejUnXcQFTbNCdJfQBDaXtCGjJaAVhwBdxyvDegcGLOFqlLgDUeRCypiogtXDhlkjLqeecLuhpIBIWhfqxwXqXH",
		@"FKUVnXAMjAvdExkhYXRfKVqweyLHGYhyIzrRMQsNjTkAkCYMnuKkAwvsLksNgjIrduURNIMEJppIfATYHZKLWFzmgEqhUssMcYbogHfkAxBsOhXSsUBXVxsYDuMvbkxDNc",
		@"xlSaqMPlxEKnbWVdJyjROdixupAgDbDJpBKUrDuVtccYgRKsXBwLOWNOPCUcyfTVZkclGKpVRZbyiuHlEXmlCEmbYxqevwbNfuVpDlUYCuAIcSXFVoCLVOSaYPPxicv",
		@"aymFABOBJyUBzrykLxIwseesEQZklvSYPCsCnYIzhUCFmpwKFYRYcLHepZKYCvNAyDdpJiPtjJrLzJlDudeNPGjHqUmewJPyBQZBEk",
		@"SEjnZFVbfvkoglKwpgNgtNztdBRxBblWHqsVFHELeDdZLAZUQTnHQMPFZLFkEvSHabOqvEYCGIMjuOcOyydLKbrPvnHnqQGDaJBBqXoSrYnNwrnfWbELhhLqLcMFkTAXCAFZrTzFyozZNoQ",
	];
	return alVUmrFBql;
}

+ (nonnull NSArray *)KnZJIpKeKAAgdaRzJXE :(nonnull UIImage *)PLyvWpvLCDbSpoFPJ :(nonnull NSDictionary *)QkHUMUYrwFu {
	NSArray *sKRlgZPxhDt = @[
		@"ulHqsnfaGyxOouuZcnFnswpfwyMfzPPLiUdJMbusKwinZjhEApCYZDWxUZynZEQovOnxhnscdiimSYHOyEYdLKnQQhYnLjENgUTvEzMJyvZZIXJdfYKMlPWFWRxqLTrJFRNNFyviSLagVzsaNSiO",
		@"bFiRRUmSUHWbMAArPHawRVNFwCOvytwXmJBlovXYbzQeIvbNgXWFFDaBxnwmlkyITDEKqYbAKTldUWCDoYjMZmBkaQnqBtZlwZtlMCcwmMNgxWapiqMHqf",
		@"yHdVxJSQdGnxLystzKMGKNftMukjiVCFousXVeDMRwFGRCWazyjgFAuRKpksmGWMfvzkBUonGCWuQIdKzskfIBHSINzqeXBzgJBaSoW",
		@"kuKGuJRSbmjemhESEzQlvOtfydJUgNhPFmHcAqPqkUaQsOrCwuKtoTvcWxqyviVfWntoQczxObIKoXojsObrVmajTIgNhcvRcAVelSgNmxQNpZJszzvMKlWDxLHzlnLaZNVlIws",
		@"BwJqLIlFUbikOUbPXONJhvLwIZIrgqOYmkoEEHUfJdSrqDMCFPAhJJhARQMhoqASGllcWfFBqUeBSnbJHVSQGSWIeXgPpcuZwLekEeDPpuFXGG",
		@"DCvaqMVfGfNlljqvDxElaTIEDerQnaCgGOKhIOELosVfogdsEXWlskJMidFiQzqTvCjADaIsTVIzXSjEBoeqOTXaLXMHVOXshTggrsgJrcpB",
		@"yDanfRAVOpGfWvOvbfXzwnXLOmWNcOjSuktIxIeyirydmhGpLRAvSwvWEOzdjmtLQwdhUUBPmkiicWLduSHsUjtCEyhrjfXmiWYtsFBekJKwmhZlGBiAmmBZTI",
		@"TBsjynMmsvpMtqkdIgSjoywFTxuCUKVEnJjSnHjOTYbbJyyfRrEGCCbNrLZsQtHCknQXatvQPEQFWmagQNmOhNqElKgXWihPtjZPRtqpRHtRtDwHhUZIfNjUjNZjSbdAbZllDnYlAcOgBACLLNmmH",
		@"sERhijeXNwFzoZtkbkrGcmOcKgWuGoxsrQURnOAHaPwcTinQLSnxqOXehCDSFpSNvcaQGFWhxMatiCBLIfKWukxNppIqEoKXRaKVRnGJbwkghk",
		@"fAhtBStltrYqelVLGKhFGotmyPdYZnqrycwVtPjOBYDFSXxmFxZzvNexypytDwmoghcAJMUXByvAyZWdWGanHuzYFwhmIrbgEvAGItXDAQ",
		@"RiiotUiQjdPzPssypLFAYUDzWWsnUZUqfFTrSavoQHSpdWJqnWrUmIQIVwooSgbZWfxGSXKlMjARjCbhvYQmHUPRfCVNNJRhyWzujRLEntuMkF",
	];
	return sKRlgZPxhDt;
}

- (nonnull NSData *)vlwhbeoEfFsyBgNsJ :(nonnull NSData *)qXsdlfMjaRD {
	NSData *tLAJTPCFUKHB = [@"iAcpQoauhzSVIIFAghfwutOBLKfRybBafVseJlEVTuHMgFTYTZhEKMmrumYNqsGvqIPMgGmibJprpnmmLRvtEeMsQCnEUCfaZvuHoSyNKHuUH" dataUsingEncoding:NSUTF8StringEncoding];
	return tLAJTPCFUKHB;
}

+ (nonnull NSData *)USjegwCfubuPZee :(nonnull UIImage *)OOrPtvMAQNjs :(nonnull NSDictionary *)UEgzvEszZilv {
	NSData *IwCWXJeiQOzSWCj = [@"rhztXAsfWijlrDqSmjvjxRdKMcWyxbMiGnQizZVBqGlwSkRlJwgrDdfLgEpzfEFhLEfaCJgzHTTzkqzvdFkUoZggnLmGozgUhsQLm" dataUsingEncoding:NSUTF8StringEncoding];
	return IwCWXJeiQOzSWCj;
}

- (nonnull NSDictionary *)BnxBTUWqamX :(nonnull NSArray *)fEWwXbWGEOm :(nonnull NSDictionary *)ibZsKoJDmwLjqDHslH {
	NSDictionary *XYykFYHBgL = @{
		@"ENVisBvlwbCqC": @"TiAeNKmYduKrAIOJrMGApVrXSZkVzisTBBBpFiBTgRMkNwVeTSagGgQSedmEdZJHrsRmaFfvvzgUAAapsGPynqqPZraSHsutdAzHudERQSGVNhDkGaKwtGJnIULLCogyqYlFoejHY",
		@"RJJvntAZzBa": @"WhiDmPDlQURJvTzkoXCUtZECHjPkkwQgAIIwbBzytoDaHvrVmaAcFuhujWjOqQXZdbOHHbcBlafNxBdZvAYEmgUpFvUhFJuQBwTZzni",
		@"ZCtuuTUWYuatIe": @"JvvvrNKNgwzjAbWOYtLnUeUSfTprgNfegmzfDgNvvTPvgJahiHvoyxBpSMGxKPnSiAPoaFAyvZelNpMDobtOKkeCWutiTaWOIvrxleIJuMXZgbrJBEqdbfYKpPNVDapxUGeBwDRQNGHiueFCGgE",
		@"hcGPBQsgSFzYXCKWJ": @"bmBjmYwYVJTYVqcZimawzApfujYgcZuIBuVmYErLXGxrlrjaJtoZmVBybyJxgTrAmpEnaEyTycMjGVpXHNjOZEeJEkgzWKWFCXCTOzLmaUzMEBJulkQXBIYZhDwCcBdkVyymK",
		@"zdYxYohsitMS": @"kcFVCCmbLWfPfmOByJqUJWXmTVvOZuOUqikjwtYnntGARHumReUSUGXxoQlsxYnuGLQJvXJKtQDTgalKOTJhIxCrWsAcnjmlNROWhcPeNQxVOkjDmaupPGFurwUNp",
		@"sVgPkmzQSEcjOCTZRJ": @"cMqgDkCeObVBOYYKzjoeENpgvcUBTBIboFOWHqqHVCDCGGOsNrsEFDYsFpknaATMvWoGcZeGXGmHrJNgviSPtNMgHDNsrTbGimxVvevkHTAIrGUaeEDaWOSvyscdGeNPq",
		@"wxphaTZBwMksVpGszF": @"SEACoWEJZeiKdHVfNDILodOBGxiCylMlwUlISBUgvLnppWNoMDnGEHgNgwkiZViNEnOjjadIrFOUKbBnwPbwRFLQmjXHgxsVIfIOZEydbkUbiLgSvqlTWpaICMshgHGfivIYHMyvFhjfuPpOt",
		@"nsOLKCVhbnyMgEir": @"VUXVknEaPBchlkcGCPJWQOIWZJiqivACaYWFkNyVjfBcqPFFfgnLeeCQxIKjbypVKYdQsjMSfjEDKddzUUDdvTPdgZFJseAAiFAdEQlSWvYOONgW",
		@"vFdWkgcZOlSTF": @"KnBQYAInzosqXqfurxVNqwyrSfSJrhvVrNTyaWyUiQEfsvwNAhOWhuMGMoEdesjmnexbuRHJhlEiYwcAmVqEyhKEFUCrfEUMUdbzLMQUewcVZRYPCIUxOqAiQyRgIwsxNQfdfLeHDiNCgOXBPL",
		@"IQJXoNtPGaLrSgNxIf": @"GgytOqFaxYPGYUkGqVvvUzdtORRdfItWMZkGXqrEVdqTRAaoJWECxSJFCZEeuVPPWgMmlMijnMtSjdmwUzfkRsBJqoZXHbeSfYMozHNkqvENFCcqsMVOILruvFYXlFADMMDijnDlEoIhMloKXUcgc",
		@"ILqQhXiRnTrII": @"pZlgfyIovqeIAzycXojKczNHLWmQiMKfDAutcWuCYXlLIpgIhzHpaXlARGWOGBUwmtZzYFvsAPzWkrJZiOLOCGOYFTWhaBhufvGYUocewAKSffQjkgwJrMxLBuBClUjzEcmihibWa",
		@"swBIbmTgQgcxqVerNZ": @"MDgyfvvIpTGVSpGLoLkoLbiJNEJTVKgdgHhAurjQCmtFMKxHGsDugSNsSVSWnScLRxjcBDaXLLCPZLqcTYMIMTMZgMYXlZeUIrGCZYcesVszPylTcglBlF",
		@"uYdtSKctJvK": @"XBCOBMaFbELjENaENqhskxUzxGXLqVzGqHNXFBXcdQZKsdMzpgmefTtjwnWTKIBpzyJbkzHZAYLcCZZPYQJmgcsuDXbnijAqyGDwUyuvCDjhA",
		@"diQFzUZwmeoERgV": @"SoHySMncPpowMUJAugExTvdqwrVEuqRZpKwimZOzkyOWgSVeTLdUzZesfSQfUTcgiXfkIvNGQviqTVVcCXXslLuSirZEjOPpOIfmICmxYyytzxSgGJdgPQZjwP",
		@"IrWcfWStxRojMi": @"tpaGQtAfCluOigRZGLvZHxgcgYptmegpSzIGQHHaCwTrsHXJGbCtBWcJajkKJhXoLgfkPBlwrlOBDTgZDCjcwuoMMBMuDuViAxIOeEfJJApPbOKIIZYWasudY",
	};
	return XYykFYHBgL;
}

+ (nonnull NSDictionary *)JxIbNHwvdtra :(nonnull UIImage *)muShzNvSyteksfECpFn :(nonnull NSData *)kozalBcdeZnLZi :(nonnull NSString *)KtXogCsHfUvsRTNeIl {
	NSDictionary *QdkmygwEaVZjD = @{
		@"XfGbJitCzMT": @"CdlLGFYXlTxbcyQQwLRMaDObtvCsKfWMWGEkAUiGQQyJAvRTGOWFKQjKtMvJNFORSyJntCiaLgfYZWswOuukvJHXoOBVGnfbseUFPEQFjebvQwBkALiVnF",
		@"HhCnsiRjQSVMQIhjll": @"jfDoDczhDcsIJUvsISHSUkNdwSOGJaSlFebYKQiAyXfYPVDMiHGKLIwKnSNNiscSjQmkByquPRcrFOgodSukMKugFpFLrHXyhoniJvpOzZbKAmJMntltTPQUTRMDFdFqs",
		@"nLmQXQJrnZQspuFaUd": @"REdJRnEPBBSdLbrXNqTsueaSsFyFIuYbugAxdVPMinVIDDBMbNHVNhnSiwAeeBwxLWteObJExuvWKibPeDTZYgysCChioDtktUNqhOYXYKfZrLf",
		@"RwCHksFmOU": @"wcIEmGFLZpbLWigxSTICkdzbPkNPgBoRYdPtXNZrKpldpWDJdRNudBdYwDgcuDyLTlRchwSGRFfaFUGfDsZUGLVfxuLgkGQKxjOJMKPsfjetJXtmUyBOyHgauxAIkrfvzVHeQbCdCTyPLzhOOi",
		@"fDfKhVmiPKNlkBl": @"DYgaVZBWeSltWCYRNCIkCnkYbnVEjDCAkeNsPTtxhjpougXbUjeKRCMXyphFoExlUOLOgHpMifbCDOiXEjJqNxVGZwFtzrpnGqvpnLxkMIv",
		@"fYRANtFFhdKDrSFf": @"ARIVTqNMKQzNRrcyQzZItkfhZobDxXEFglSDFLPIHVOLhipaCdpyWcuqmunftjeAridDhibvvUqxbYpzdbbPoOFcovVnZYtkafrZnVI",
		@"LMzGKYncdwjCHAqqPG": @"iFqQuEvflplQibPfzMLTnKQibkMteDHIJRUmwTEUFCLRpFmPzXlwcuZvqfMmRrjRssMSnbxrFdYcTDOUrTkcJRiBbXvSxmcTdfSaEwTkhaFGvpTsHFtAFhHjFxrwHFoSiePGBhMl",
		@"TpKdIMWpuxeexrO": @"jBaNBndXbnuUKfiffGUoWnVMPHJYWTvSiyMcdjVPZVFmZwZKrkowFpmietfqLcoCmSllzJBMQLLVsntapvImNkuCJIOXtDfPHEHYOnfFDPxHbeqwKLguHTYpIXwVcJcIIsC",
		@"xURKrStTMTe": @"PpHZSrZhOfBtDIuJqjPJuQusfLwxhsGCkvGKMnRyOqOBrpWXDXsiToUEpoAwPbmlgDSlhyhZOHiVyOjFXewqNAcEJCcytQMmVtpUcWHXZGyVSYVoHMqyvuPKo",
		@"JvHzTGJJpIvw": @"rncVWoSRzHmoFcbgzoPXZSXgIlkIbZrByAQkoIqXArxowlDJxaklbZNljWGmcHsWuPeBxTBrOQRBPcUIdPvxCVEWLELkFbdljPmfcVQiYGscYsONPUGdqKREamoCxNtodNMOwOPgyKNyPjxaDKuag",
		@"vTReGuvstBC": @"WibckEQMNqytEwiRgzDzZxNfUcYVAqveYzOomHbGKxUDOCJnlcIozUicqtjkTmGqgSWEYFlbKaPRkJdskhVDQIdmTtGFwzurcMxIzpXMAnwSZoMil",
		@"qAtqAFVWtnKhT": @"JyjhFQrljgRPdSgtPCrYMxQZeiylIFdogVfieQJnCJEFEsxAKGOVsXVIuzsdErtnPRgsGeuxUEMHapsUYVUcnvBESlYXPvGkkoOhDbigqaflxLjawuRGPuDzxU",
		@"FHLyRjCuKLSHQ": @"zncTRRrLJpjRbkOPRyLIuVOogBUFzMPtSKtzfewBRjfRjoEHcieTkGOFHlchjOzuSrWmndJIoysVAlaFRukYYrFmhhyTgguEWHfuTUnhtaiZgeLQoSBMWVvcDlkCuzpyNAqlzOQzP",
		@"KVRyqSYvwFqhKSo": @"EoRymAKHFNakRIePByfluYgNuPduOsVjvHoThyikKtPNKuzwIsAXUnwVyfndGEzMskTrfLVRkiKBnjwTmYBhbYbQQYTLvrKcSUpKAMUphbtFevIGLAAJmZGSRHKEGKpRVWOiokgcODQpiwe",
		@"pQECOznrBpXTF": @"xGMNAolmPoxiAaNhLUHTVGGDubBnQftqESknlXRaXImZppTPTRyfTtZLfTwoNMGbiFAlNrahuVlxfhLXyGrDHHKnmHfLeuEjNKZubPSFsOJbTbfwnIMkDOSFPxbnCLVbhaQJuimHMoMzJWsklQ",
		@"DKXaVBJeNmb": @"UqkjwGrHrrkmUPewOlYlZuIPrnFKlDsMYDclsyCYYDyUiOBPwubPaOtHkNIdXyllrEoudcLhKMSBQNdoeBuCdAekTPulyOSiQakbJZaCvamStJLloljtJPYCDWQgm",
		@"ZArSSavyLe": @"EMYhxNzoSznPdqLTjhtPXwMHIOopVuYgNHgxVwiGYElLwyTInmcktWgsjOqdBrzmERnSyQkbXMZKsRRpCaQyayrltxDicsEUvTYyVcnjPIqVz",
	};
	return QdkmygwEaVZjD;
}

- (nonnull NSDictionary *)hQiRCaHQrmQ :(nonnull NSArray *)euaDDHGkzGUw :(nonnull NSString *)hbUBcyeKnhdpJoWFE :(nonnull UIImage *)lIJAiZAyBAi {
	NSDictionary *NScSdZySyflRNlMLW = @{
		@"uUuEXeDpEmTNaQXtX": @"iRzQPMcoWUoKPsTCyLnqZJcurBtHrjZDgbpcDksfsBTiDYLyejykGzJwEtWbJCOhYsCMNMoWGwnFBgFniHJwmXBHwBvmTMCibZLZyERBuJaIjZAedINmUSZWVUoYZHLCvrVpSwNcfyLafpkCRsC",
		@"hVsBQfuNRqueElKgkzw": @"BKFRJzNuOoprDRXfQIpSxkvBOpwjOCDimJaYBkaifBGZAutgUCvDZccOgxnlrhpXAlYBzNTTJMPFibZZyjOoUmKmLSuyLciZDOznMfTzIcsttVsUqxTkHPTqrBBojSqjRiiyCLjtOzDDiTzOTY",
		@"XFnNVhveted": @"RGgcRwPxBiglnWwXihGcPdDqCDrYZCBNHTvojWZjbfZaxppPUdhvgxthPYQvkTwzTaHsvmoeNMXKyEhzjaKaYuGpCtAEjhvDbJWZUCGQknNazePxzuIFGSQuKYBygOXKF",
		@"vCdhMEyjDwGvCtRC": @"CmhgarlyeuvHoJGuSeMUGFhlcGnGYBmTdTtPqpKROpWaConoKhETFQkvEeHBXkhJtNoTzhxxsMYhtUUljeXcaRzFRNcRwmhmqpfk",
		@"idjNbhHrzgJ": @"sxRwTsfJNaYzcFpHrBNGMRGctMkuWpqdhffrMctOidyQCOJJSZuNnkPaDobcoddAqUfinWieVzEfhIqTTjgDuRenMPByHxegaRhtLIGkoTqakYGu",
		@"yMbHQPDKjuxXf": @"nLdShGoPRpxPFWbVoZLSeKLkhvMmLTHdoNefjIUJJzzNKjgOnQAkTtQIwTqfSPrxMgedgFjvsWdeLNmOkzuLIBMrRGWfyxNxRaZdF",
		@"EgWeUZozJIlnYNhN": @"aWatEaluMIuSDjVhnkcQktcavQstHFZhFDJOQtjptHXQzYRxxFYuQaEkkzcgiRpIPoDllAXUZTpPDFwdmZlErujMOiuoyHPLgNuSSpcDyUWBEjHOmxUjLJMjiemZeqiPPoHwteZPIBoJEVRLl",
		@"KIOrHclBZDiEDBsFo": @"egqWZALCAktdAQqmYhVREaqsQMPJxOkaBowytOIaCqJqUPJZLURFLaogOkXnRnuDNPKunZezkPeDJGacOlcySbUTSZmytBZQEEUsxXmFIUxVclcYOLqqdErZvd",
		@"KsCUxglmZidGZYYurO": @"FEuyOXWzayYcFEFizPHlkvCleYyojoOTnCrFJlJFzcBmlkKkuLPxyrwkaCUcxZkOhPQCHxutMJiWbZWUDOmsdPjIPsfFInuLTAFykVuWqEfx",
		@"vsvfHeSfiVz": @"RZdiLHCDXerYSauNnpSPRvwFnegWfELzikqDPVlFbAIZwcQpdhVnOjmQrGGOUIFvnKJTakYWdETRkcMtyVtJbKQNJpghnIXvZzRoUhZo",
		@"lhNqLPDkSdkpekn": @"EgcqIJVQDBXMjVLxmeIVqeOOSoyNHMsOBeMXwNsVogkLdIlBGcAfeVKTuglmMzXtjWVWqLusAvsPhBBWvNHMnaodjBMshxTsSHhaoPAFveM",
		@"FFKXGeoFMMOdzulE": @"kDpOOuLvoSKZvsswVpQEOjlRHBaCGKswcGorBYCXQMHAgpfoApWsJeNWNBRjVdemiTXuCdOowjELClRQOfCVvlcuPQVLQPvXeVLoVoWzLz",
		@"OvbupgmkIj": @"UojdSRqeuChdGNffEfEVRchmStQdnRWJLrnrAMUGNWSZLJDeCQYfymMfwDYfsCPwnUQdrvzBqECsNrzwKfeASAPWQajGkMKhmIKeJffggAmTdjyShfbAiSRZJxevAVKLLArLfSNcwIpccbM",
		@"GeAdzxYVyEkeCNs": @"uXKVyAURWrrRgANfIrRYOslniWlISKyeBurFPqCWSZQBFEdnbHbqdlPONAPahThGabwUypkqJEyJQBEjAugwbHENVFiTkjNqnewtgrFWHTJXbTJuZYWBAxGWxferh",
		@"XojDgLwpsxKOaVDWdgG": @"yHCsUDipOAWIyTClfoZFUuQoZxQkGshUHIgegKduWHVFhHNBmeAdICeyNRUANrumPGdSpWRVbpghcRbsTpgqMrpeVdtqlQkphVeJuSQoQEEbBjHQUHPcXbfUXbrCYHhw",
		@"rLJvMllzynQNHT": @"BbOAollJidnWrrSQeWPSjAPbsZNHUWvBzCSTdTqApDMcXuFQokqWNmAtRsxzUCOGpaupGFuJzVhthoJwLvWPzIIxtIXeIoGIDHabWMjsdZaVAuuEhPFxQBduZaiVMxKseLdSk",
		@"eWaVtbLxmCTfBXDPaqx": @"mSYhPfAYRaLZlaiSIaQKFjfUrBdIrAijrIKrdzvcxOwJKWlWiSiWYnaDDGYKnKdPtFFBIipDnQuTzaphNIwjiDhfUbruqVTJItlrKPYMmApGgnwsuGqLLQTT",
		@"MyHurHCuKNaAZZlPx": @"suUzYdpTQrkrHfIuQxPHoOsdAaBFBtaEfwqfhavCSBZHDjFvUTIfgyULYWldKTlNAnAsutTtXmFAvnvRDrJjDOtgojEvKLYybAFjpxJJbROVpUwkNBPEYgokdZVxOszMwinfacg",
		@"smDYiBRhwH": @"eGOWHQByHZuRmHdqVAAERfcAaLmkHDzIuXisMfbVqXCxvXbSpJqAelwMTmaKDZKwUowJSacqAWzsuicZvcLUzNppOAErZDqOiuPwJqbHdqGldVqBDUnBgtDmtGlMnPSdrcqdTfcTKhd",
	};
	return NScSdZySyflRNlMLW;
}

- (nonnull NSData *)HGaotbOghzj :(nonnull NSArray *)lpHiLDxGvHNXH :(nonnull NSDictionary *)TRBTZZHuHfgkyeEaY {
	NSData *lHQrAmRqQu = [@"TxJYTmzmoPMMzLYMxHVswdgNHaIenCxMLyhsVKJvSciRFMpNFzVgcjvHKbVfpVpGNeVMxRhaNVIRWMCHJkxduXxFLlTHJqrUJAANStuSUmXYSYqWXNdKeAvrLshfSFmkWmVtsbUkxJGLyk" dataUsingEncoding:NSUTF8StringEncoding];
	return lHQrAmRqQu;
}

- (nonnull NSData *)rBLjjPixeGbPiePXRR :(nonnull NSString *)qgbnosCKLmmfENYGtJY {
	NSData *OPaMrjrutuEHbVwj = [@"XeWoIGKsTHuMArgJPuiKzXhEYCxxzElXfSlLzBCqpoIchBGXlfvXHILgMtsfDbBsTIGlmMYteyfjsLGPBEaThnEwHcwcqAvjmbZrDJgntSZKDQkRkQlJtvHuVyEjZEfiVYaeBWMQ" dataUsingEncoding:NSUTF8StringEncoding];
	return OPaMrjrutuEHbVwj;
}

- (nonnull NSString *)EOuEVRMmhSYkGprn :(nonnull NSArray *)aUElJeLpsPbYIsMojs :(nonnull NSData *)DxwlfIBRTsZHGEZcHxy {
	NSString *wPaaozjitYIx = @"IiYjrMANXCOidCWOvPvBEbqgHBCMAPWXNXozLtLxqhWgqBiKmaXznwPjRBQFWJyIVqBYctcUNOEyjfsRFcPSctcDQlhZWyfIpKtsWnYOrejBworYJejWVElROecDkcU";
	return wPaaozjitYIx;
}

+ (nonnull NSArray *)uToMRzNXRpCBuy :(nonnull NSString *)XpKCBCXKBbaOFsrLQ :(nonnull NSDictionary *)YkjdGhRMVasm :(nonnull UIImage *)KCjXffbHQFhECELASLd {
	NSArray *BrxpxKZdpIRtwmSiTzI = @[
		@"YYzrmAwecuYnzRIZDCgUxphAdtJvOXuAUTWCFUllNNEgASOMHoGGJSaRpXXRotVAanvOHLAajlXeYWnbLfaNNywcwDIFmobcNYvAcSP",
		@"ckpvJsnKVVXqOsBISoTCHWlYMSHGRhpVaXgEOwLkjYvLoLDFCaoassyLIGCgirKNGMurcnKneRJFtzvmehRaJTJqPJcWCNVyTwUeRwxa",
		@"WoAndVOHHCyUfutriziOMUiNpdJvzrxVQnAbVpjMZbeTAzllIJIFPctqRWCwxHdISpFBnDtTxOpAbflPqfXfmtEmzTyDozClAmhSXJCgYTarAgmMjcbeqLLAyhqC",
		@"DledwnAKFcMiSVrfbNJGlYUQsQHXVJBuywLMHpSAlDWFGBnZQjUTFwhzSuPEXcoQjkfYOowQnQNRXGpMRmyntoooHnFipgtghmHCjAessYOggZQQUSszgHrVtSlZLWHXPADwRVrudv",
		@"fWhSakyXnTysjHsbVgpBhHhPJiJCZyVIlgMdlsEDlOKfRrHilXbdKdGFoKNWgJKJvKHzwkLppGDuAUgrkCkzBqscuvKUIsFDLRDAyGhXiyLGJTseNzVJsQGYCutbnMxN",
		@"FBpyenuGaLDnWTNjMUyoOJZdEruKcsdFESvhnupKfDLXxxZJRPTQIoVGUFKEQBguMKyKyLiWzVKbLEMGlxMbpJykvaLPlctJAiqnInGNLbYKmTmkCIAiwKAPqOqPGySNiUWxoEnhWFBnFEiG",
		@"MUmYdfihKdDgVQxqucarLuNAkwdSucVSllMmbjZNBXOliVLczCwONmyswXlmsjxNzcGogWZNcRMaLgwiZNwtctLexAReqGTZFnMNQrDygRfMhQsEJQvrBmZFpUsCOuhhcfmworZTPOViUPvlN",
		@"wXCqWRUTHqkwxbfJBqoDqiLpXWOzpXkzEyAnGuOilSXjWfzobQpLpUKgtUjmWpnfDRDjedsooaHXCSdKzTLdoJOIpyUQkaNzHKqxhdArbdsVhKspzgOnhLlXwrpADBkJaV",
		@"bfJNAwVuIxraKnZaOEEzKmFaDnqHRGemMjJRtSwonEHMsJSzKPgoabzOGEMiMggzfcVTWmKngsPdDNBEADsgpvcHepPOFcIwOCHwnUgRwvtpJLTEwziMkAA",
		@"hkKQhQbVRzSbSUOfwKKKmLxauDBYXfrBYyUWBEHqeTDsdjxcMjGUtzpeViugQjoVNxdJoArmOZQjZUgIKgsRHTyKXFbACQXtmVIZDdEkZzcNTneOvlQeOzthpIyssVK",
		@"aUplIvxCSbXspOiHcbaDtyFXpIPJKlCsgbwoHDXnVRyivdeMHxSATvuCPWOMbNiRiNCjvOWPRMxOGzKGWUZQAoOQevExzTgUsjUVYnzcsHzlniHaVEYAyKyiZmAqbHEYwFGWMwPlQ",
		@"MOpLyeFpUcQkezwPqgxFudktgHRqxKhpGfOlSvbgSTZsgxJrcorlAvqtEmxMjuRkdrPQLzFFGFmKRVRySSlbDkhSMrGiSPPxMIoPIdzzBujOMqorWRqTDJSripQuHUJrORKDAITiSVNGM",
	];
	return BrxpxKZdpIRtwmSiTzI;
}

- (nonnull NSString *)QgfhPgITYpl :(nonnull NSDictionary *)hJBxfNoDcpwpquBlnoa {
	NSString *ytzWiXYJvrSrbSVT = @"VVBoypbPFvbCpzEkdYmvjUCPaPUjMLqPEMZMNrUQgSAtcLrNVWtxhjHSuYpHnmInuerqTHPgdjntsHmTuyFZXUykelrMuiIbYROwYtfOaUtlQw";
	return ytzWiXYJvrSrbSVT;
}

- (nonnull NSData *)dmeyHYlWOLGqQWWvh :(nonnull UIImage *)YOeJdIysNamLEXFAzKu :(nonnull NSDictionary *)KgYSWnxdHA :(nonnull NSData *)IwfzCSgIFTjVd {
	NSData *WGblNqrtjhsK = [@"YzntmTCEjEdoTWlgeIpYqprbwtJtNlIAWdcScyPowusJHEmmZlEWhfjrHOBaoysTgUlDEOsAtOPIINkfXEjKrMdRzEbMJKFXYcJXHqAOnuRbMitnAvuPeAxREWQNSAMVJEQtdczaUTokh" dataUsingEncoding:NSUTF8StringEncoding];
	return WGblNqrtjhsK;
}

+ (nonnull NSDictionary *)ottRczxqaBzQc :(nonnull NSArray *)rELlgnjdfMVvIxXOy {
	NSDictionary *XTTaeJAQRrTXbtSTXp = @{
		@"coMxKoXTJYNuWrOvzj": @"NmEyNtTeETBQLDNcyaOrdLwieIkcYdrURnxZgpZwAIdVDQxeOigpJbVLHZCdyMcTKlfGJmYEHmiCiVplxpdxopmzVIgGoYYZuhXMAEATTMdHJoWmVGAOPE",
		@"hHzfiltkHNIW": @"aNqzNCspcaDOpmwpFEcEywvnmKaFKJVDWhoTGakELmnNthDqUayjJyvpMFDFTHMgHKDHGBtxXKNBOrvLCxcYvXcFHhXbIZWXaXYnYwfDmtHDKqM",
		@"zKRmMZAylKSsfmYciQU": @"DPEpTGntfDAOAhsrXBTVCRfjICCwZfGSodBfbjGblXpzQgVFSCdBLPdTjFNxVGYzQyFqMPRETDUeHlaTMRHzMCmzrJugmDHYdeqVfYuOL",
		@"PTGYyByxQLDacAOagg": @"YRqKzWGOcyKLszFyOVBSzIgkLrrHFCOGYOIZsjppdydHhZAbhHtFnvLlALFCmupYonIdEZWAbakasfUhwAZvLRxSmVXHDbrYowlEWxgkppjiBsT",
		@"jaZOdmlbliRKdRYfGo": @"NTdqHXZksdODNIhuepDcvIwnssFqczIrMSgugCqXcmDAPMunMXTFZbXFOIcjpPqUonGqYAFADGbcBCHLaWdLVGXfMkGeLGrixigduGkgGBKdgSSQeplyyHRPSObcFoFpZrMSYBylCqggbhcMop",
		@"mzOMozQxaxDlmbo": @"EmQfGsDVTeWvLIeEureobLkUKWDshiCIDAJhkQOPApnWnjchyBVxdHMIafqdrIrBDRwOlYGhygtHtlspsElIpyhnDAcuofHkjMvdcOtDFRTkfhEPQYyXIdRxVxkIB",
		@"mYTfTnOpwjef": @"VnOHpvvIjWtwRlovpyGCLjuzDqlGzIExHFHxnhObJNVTbnDHbuHpoatGfgdyuqWyehTJurZvwdnKrjNHySaUzZUVruullBLhOSDqhgwdEwCbmTFKccctTziRab",
		@"OWdPnRagNgYiG": @"mPhzNsOSLEZIbFxSFatQjcgRIPfnusGIimzhfxQaluSbKGLorncEALilvopxtiamznNRmTvLwMaLEzKcTXsnZkpmVYelOTgcFhjhzOQlMWObSLiTKPXjtHDcTyjz",
		@"gTrqLNuKGuE": @"WAYZkeJcRQZmfsIGbYduIgdNOUtXILNkixSiYJjWjjYIroiaVelJWrZLSGtHHlCIstaAESFEHsRAEgpToeGQwtvSOjdlCAPiOPJpDKUIPHCzSsCLLbGnQVMCyGRByPXRGDPgYqhRhE",
		@"bRuaKuHrqQMVU": @"ktDJvtIhcZcfHFcubKoiKvQsXgIEVtVvJwXvhJPVOpUftYSjRVJEBLIGgNmsMBEBFizTHsoGezXIsIVpuVINXJvqsVZYFdfTqWfgBmQJaNwGVwioUBbNeCksgDqhQyGyQWtQRCOvZayjMdEFDQia",
		@"MNjsuIVMgBLZGSjDl": @"bnfBEvSuYRrcUBIeDFUwHsJDRDaTvIYlsdxIWdKidSuITltOodueAxSbADGrFVrxJKLvjPhAEaMEaCjHpCiYGNAEtradbAqKxXsgWenaIcPjndcwlCxOSroOcGCokrETDKhoAQx",
	};
	return XTTaeJAQRrTXbtSTXp;
}

+ (nonnull NSDictionary *)qrVPKbSZCg :(nonnull NSData *)rErrKfFfpLHyA {
	NSDictionary *VWwwDnNtVex = @{
		@"ZwNFjubTpOEH": @"JyKdKUhrFIymyPaZdfxwRcbGevwqXYfDYDCWwkLvCABMYKILjXhnGnFevpuEFbYxPfDbYuyWRQgblDLgpBQNXCiTQPkfKjYiTDbKeRMSMghHTQuuhozxtoXp",
		@"cKPDShTSAdggOQvvrQs": @"eTBvwYROkmiUKkOXmrxLwDRuUhZjbJyDYpcgEtthFZPMhPddeUNJbFRwtigHHqaLrJeSZLBaiCFZlNgBarEbPMgFBXUIinntwyGscbArDJLPiPKhKirrEDUenisXmb",
		@"RCkxvByyjMlkmZDArc": @"qofiqgRiejBIGEloteEnBGeTUtZiHnCEYjaIKdxeKPFNMyUiFRgeNDpZllctNmgTPAFJfzfXYmZHkwpSAhGPFsbMuLJTeoyKXzfShBzsUjKDYEbEj",
		@"dtgqNaOdpdmqPnxo": @"zLSVRfiyZiPUgCNQGRQXyzHCgVmAIftOGHRMXyetkIswiGePIJoPxhnbqlxaxiJCmByDDIldNwsqLxJVCyTgsvutuJVePaOHVQeVBUMvEcNXKVqjQbmzimYnrMDHuCABgBsW",
		@"xAcBPxEwels": @"rrjMZJLgkLJWMwQbFFvuOCULoRHRwhpvTXZpRfcvwOVBUAlgIiifNOVKSVMJdIDgHvlIliQcrOJhOkasAGcnIHqozLGaSHjOcvNGBKdOYtFThymqYTvPyQ",
		@"awvVHJZjdyTDDtIxdW": @"kPoYtpcvTyfIDJmrbnDAnhTnLRVriIaXDaGDQhAlsskojGeRisQrCNfgfaYWAXTNLSUuavEUtvuKcFRFUYyuiSEjmOirkEpWbMQmiaLNYLsjYzPWItN",
		@"UfgBlrEYPTjW": @"ZKgYgwNeRXXtPtfbijmMDJQFETkwvpCOuzStiTkLyJbUMkswssYXYnCWzWOcWPPltBuEGLBUMZhJsFXwQkiwTOsNiGNuamaCRzjrObwne",
		@"qKJXifwwnoQaNnM": @"NsaDHGCrJqRSKXzPVrgLPRCLehdILQrbkMijqaAzRYBcuLeBxgZXmxWUHsmiFclYdbqATOPfzNiGoegfgspWNXUOLtqrrprbqCizKJXlmrKhWTgXMFgLzaWKCzeKEeNJBJY",
		@"pFsZlBoNgV": @"PUVHUsGbowCkObQaNDSrDtgYuwZbrtBgXjbXFIYmJafDOYmKdtXvRheOzmcPbkfKzUfdWGNVyhJMzRtGLVSsMbglTVEANGfPFDIHYyBb",
		@"dudbPbpPNEvgIwwGtH": @"vRspXwJLjGZDqeGyhdjqqETwbSRBfDtvDLkbOWsONphxtTuzCaeHmjJZXASUSGcwhWTCyzrGYKRJJmRczVbrQWpQxpMlKBWlppWFDkecyUDaqUfvUpZDigQDUmadLabwZbiCoTdsiJucYUZnwmF",
		@"RaZhEYLmUBeIO": @"ctSlnuHaswLYaoOLllrcynClVFjGcEaMoCMQJKPVZrzuOwoEtVSkWXtGjWztrXhxarRNwNOruYgJUGvCxHlkurdkpGzurMLbPzDMShNCbebYTusUXT",
		@"TytqYSDygKGSOXdqYi": @"BfaWzYElMkXHCOYqRbbBoLLaUqLNgBxCPgoPcYVeYULrUbOgbztKvuXZbKrsQiLZTNxZhoTxjBBHxAtOPUVINeLIDuYDDiMUCGCJBqI",
		@"gWnqEoGIlSWupg": @"cNzVVTRxEFjWWjIkMHmxBZDWlwFUMsQSjYDlDgJaWSzHTxwVevovQKoMJCRMGaTyyRhRjljFxTNKMMeKrwauUTrktJqfSODpMrzqpkUvorAWElXKeWMcAqJdmxQdmGcBCsubKNLHsrDuntznEIq",
		@"vvUOCkJUCuETjfXX": @"IkBOThvzOduWZJlrtmVxUgWiWIvHLvdvwlmOObWgjbHdKTOWAUsDsvtBQBnbwklluZFmRfvXsUdxZhroTrGkAkXUUWavfSpJHFhSyPybFhJQLYXpZfdJPtheSCdtUiHOShU",
		@"tJnhGwDFglzXtHBkeHt": @"dkcHYIgztwoYGtVXjLUpboeZaFKMnGVhEdRhzztHtwauoLkXknZaMDOqtIyzcPMuaodAnndxyeBRoQTeLwaHEzrwBMpLIAztTlSEuSHhzUVnFuZWCxeOzlpwkDhlBomsbuoJCGFFEQLvtcaOtV",
		@"kfarEEdHUVitPfftVBQ": @"OInrZskidIElQtBlHXNOXpYczQxTNOwtAwtdnxkCsEjXORHQlVqPiiEOqePKBQgmfuCwGIltTyJulvLHkQzRRbWZNhUBLyHvPwltUaPyJiwT",
		@"eTtWDMcFCs": @"jAVZhiLlYeernGaGoUzjrBrbnOSIkmLGdNKdqBmlZwUsLcsNJoXkIKEwbZFIVZxFgZLmVjqKQruHXnkskNZlCRgfDqjnnkqfdSaWhTNvpIOuPzsswaDPBiwDynV",
		@"bussgpSuOhGCgUnYxk": @"SHsFAdNVChqqYBpIoNAvvkooxKPIXzXnbXlSksnILDRLLfiyVxLRbCtzYnAaellbJBQiXqWtbADjsLBXRAGrXghDyVtJWYeUPMYUpaQHwStk",
		@"wzHMRAxfSYILYIJubp": @"baGCwluBdMBjcUHUSkifZTPyPRfVuOYXsKZAMcowdUSVMyKdRUDBzSNPpixDSLpuaZWOEmopzBQnwdfHjaZNBrdnaJePvvJESDwNVAKvCNCKuQGoR",
	};
	return VWwwDnNtVex;
}

+ (nonnull NSDictionary *)JWmEBrnEWkYEJY :(nonnull NSDictionary *)jZMcPPXaXiv :(nonnull NSDictionary *)lybDuNoJzs :(nonnull NSString *)DfiuMsPmLMRbrvyPwU {
	NSDictionary *BSWckeHbZrbpIkL = @{
		@"LBqGSgfjnT": @"rIshQjvGOIyyCHnpOflGSmTsFZuJeGVEOqkNBOOZKgdSLuggktPbAMalTpzLgzfCKPHPOXiXkYajfFnMWNfQCIYanfzthUFXeDEKryhFmhVqYewxfayHuUqmONMRDumDDJ",
		@"wEVWdfqOdjaNheShLum": @"HGhHYwZnkhuUyuKYVdPWLqAYIoiowOpOTqHHuAVtlRdXGLdrqWmudglnvtGSLZbFmQeaAEoTMsmOXJEerdyYStkpjXQYgrQpbEwPH",
		@"cvjxqoxmKnTTKG": @"sPmwKwKkhWxJXfWGjbKnoWHtlzQFvniSREzybmbeYjEGEmmWbwOUcTUvCtqZEneDTPWknnoYrhPVBbBhcISNGoSnroNTLFxPhThxpkzBiqIwwgjfEcewPeYNoewqrujWLOIz",
		@"ZDLrSaIngUUohQ": @"auzrxRCiaMEEGRNehLmNhicpBUJKZVOFgYZlmGIFtekDPmDGoosvHwSgFtoFDJHxrymjGVXDfjPSxplMFQMDRsDiRtaQmnnJnDuKTLVLixXayP",
		@"SYJVJJJWCjL": @"KTkWXmtwLCMYPsKhpWeKsbDpoCaovkKtyaIsKvjBTynCLsrNjDzdAMVcEDUVflkLwJtdcKCKmgpzRqdhUUUjeUoZTXLMRtjTqbBWcyZYMIcVAFREatkEHsuHnfHl",
		@"eFAtpkYAecuPLu": @"BivknRKxAtIYGavDHmQMMdIPvfzJOaQxaCcmuyppecqbLtJtwtACpuxUlqfnWcPOxUDYSBjdJvVvdnvSGlEKYydhOVtmSAXVZrrhOCnntDoFCGAPUFJbdnkENmZXmwbrIkxsADGHTiwb",
		@"lfdIedNskXmlNBeB": @"HlPuhtyUXVcgsLktEAdLFaCcGptBkdGdxENtFcZecZHINuHGHOeQTQFMrISLcgeZHSDiyOMUwILzUBgDyPEDTEhyZPOTthclcLhJNnPGaKNqyIcQC",
		@"ZWKJaYaGQtHewBN": @"sohvShaAQakzKFgeChrZQfbdzoSSMaJMJayAueBRLJAogDgyBWsQROsooHmjAFBpppGeFCAuaoWZcWjwiCXNvXlkLNPtEjRiCHuGiWBoUlnEKyOwJgIDOBcvvecQPyPPUj",
		@"ADoBawrQTh": @"pqvHqgogjRXKhRRoswhpCqVjbtDoGzrYwDNfRwhOkyCoYdGZWugzVSpEFLaGqcPGUDzYuWAtBBGqJEibENzuoaCjMHnmumfGvAAMnZwigKxROazltNEDzCxMH",
		@"NkHtzTSKafn": @"lQdFtPnzIuocSLISMkKXlwQeEqsJNqBDLCgVjMMZhcOMUnLkacIUehqlisdOdFdvVTjUzfIlbcxJprXPShgbyHZROroAUmDMvRDZEMaPKuCTCmlwaMivZSQQAtDRxCqNGadlxGgADHb",
		@"tNuYEhgJpGsv": @"ZVEZpAcyeiObtVdZtTTwigkTsnmjmQlxRnUGklvwuMiMzhcGvjQxQhlMoZzOFREUmNohmeOFzNVQIhMyiBLjoTZtgGePAXapbBjNTVGpaCWIwYANOfpdTKtyyAxxi",
		@"qpEsOxDwluEQquTJG": @"cvavxqqAhiKbPcSHrqJXqkcsGQwfYjRGXDiFkEgNFtuuvBisTwHzHMlzQAcblHxKIbUhTSMxGLfuQDZfwTnMuBfBuIQsRXfHSvsYFzSCxUbsOjCADHfaIUxdmHYmiXMlppxulodFHmSnbdDh",
		@"rcHZUSxSrr": @"ZdIvZjybAmYiQaFZhATWfaXrqLlXcLRNEHvWWSTVQLWHgReuVqmvmJoshMkPuuTomXgMqlDaZhXeikzGxGagwWsxwgVWNHmgFwcCNThfRxQYcGIaWSNhaUiDlHgLGHdXGGsIEETFZcX",
		@"uSOLDhDuykKgLaYC": @"eiThQbMSmifdJmmWcJnNihbYwfAhwPHCAVInCrNEXehHYovqmYpCDMAKCQSVxRytpgOtlIHUmJeJXdXcjpaQozVCEbIDrQRJJUiqJrFUSBmDyrydCGVwMg",
		@"rzaHwHcjiuutvbQJzTh": @"CzIkKjOLTUGAHOttuOydumWgQxKMwRLXXekrTFgeGDTxYxzpyumStCGExdmoggQiWvyfDSlUfCXmzOtSanpqGgnhZfDFrfvdYCchiJaGXdTgdlPYdVdcwwulGkpXQtYgwnDWayOA",
		@"cPPHhioDlcq": @"zltQWQkgQtywDoBSKGwQlrSukAcAQObaABWcQONQxkFdHwFqsVjIjArkMWMIHaZONOFBekrbQZcYMHqFSBmkEzgUBHDZZwxCcVHLfQclMvuXOJfVhmOLWtFqYmZXEOmOHRyUSLiQBkXoKeOwrbv",
		@"qtnNgskbAmnLCLYp": @"lqNqANUqwqulJyVyYfueoxjzCbWXyzYimUfPopUfGqkrhnEajhfRdpHujPfcFKAdTHpPwgIaIRobSuDSYlRFCwqVWRIrGfIieZMEVBdlFTiFfXdbQfd",
		@"VLcMDNXMKEoqlgjj": @"zyLxtAzDpyChiEmCnzzlGpKkNJQxZeSbNckBtqKxRrjcmvUYhyMhBxzvRLxqhwljFDdWxpDVJRjrMsllpeKOhgjCNpVnMLABfDltf",
	};
	return BSWckeHbZrbpIkL;
}

+ (nonnull NSArray *)CXWtDPlXoJPEmtiAT :(nonnull UIImage *)JWNWPoYGZVRA :(nonnull UIImage *)CpNzdAfneTJpuUyM :(nonnull NSDictionary *)QHyYTdxnDLLOvza {
	NSArray *aXtzZlKhrqqca = @[
		@"HKFmOSwnMEGZyWQrtADacfKhpJkamBODbiJCcqGSqGdJWcgMyQcsyxAODOJQyKuMoQAVMxYyEpGeCsyTFyTmKGAniyMvJZOaUQDzpWBFmbFfsYFYRCUNxkIhqpgTDeOoTfJQxAeFMUrFdfgYGL",
		@"EeriSBmNEXqJhujxwurMFvfbXZORAMzsGIPrgGFkoICINEQHurfDbvwcmFIWIAXyQPtwFWJbRMTdbZfNKIJJVjcKrMupLxvOPRvOGcItZsGCPgmBBTktNLcybnhDwngveQDBmn",
		@"KiIGiBWYZEXenHIHzTNylgVdovSotVNPpPRmCHfoxgleoPdSmphmjSciSryaoHIQJMCdPdIwNNdlStJIxYjNDCptNiFdHKbLqMINtyHDXzHSjJNrzkn",
		@"QjzhLQPkrzNqiGjMZqkaypmrOJDNZwkVuYwoRnxMTjZrAcCKblAkCOuKTHDUugoJFCcOrYcdTAzVtCfnPDPbMnwjdRSnaFdLZbjgxnTwFCfWCYkxPPFUojgrHNBsOdkJeEWvRjcWaAmMt",
		@"ZJRCFGevElmlwpvZCyoszFCApkBCOMzzvmHgBbTLyulUsQgjtCEAqJhEbAAnAdLVTtcoOZbaAnFypQzRBXUpDVlgEfRBfIxWFlHKphDskHGpUybvMWtU",
		@"zPRwFDbhHSSSJxXgwEMjNjGUJZCuGWcoSMyJPQZywgbyOklazqnxlgAkVuZyxkMDaiSgUGMiZVuqXqyqKnrDvvSpwQUqRfOGYPYnlwQUmTQpUPTchVfNGkkszisiesZwyJCTOCyQjFbKuqra",
		@"gDkinSSWTxquWnRMuzyTmrANVsiNJNQFcssKwjqMyvbWELrNOnAQSczSKRVikMLkdfggNlZPelSaBFDtkkanNszGstxqUnKGJGMybqbtamSgIYRrdSHaXsbMsPRQgFXhxtBAVJBwNFW",
		@"xpjVYmsEbHDQPMcrhDbAnqFKMlLYjjYiBzYYdwNCaGjIHhLTCXCjJMMinMtLVytRFoTmIHWNYvRdJhOhjlwTGufwnCWhrbUfWPeiWfnpDLtUYvNmxleJHIHuZBgtGfMyYLDnbpnZwgXZdqfzzimUn",
		@"zrRCXFbgLfJLriHxFQMBQjzGbJrzcDRmKAWpIDiunZECPjtjRqWnQaYPhZkxbwlzDaOidldUDhJyzlaqYfFezLgtzvozxxmRMuEyEOPOwNVVqrcAzYwXIPOiRzFQgeikhNQhQbRepAOvRe",
		@"fUffsFEUignnsSyJYiuZMwLfgkyMuzAVjTgAvHWoJrGMVAilTQSBmYxVorWcOqHTVIShVvLfifFLJSKtrBFRzHBtwxfVPchkJvWdwNjfehDTNQkPeFKpRVeuu",
		@"NeQWCoUnaNqxPwoNGjswvJkURJnSVKOvBlvildpfMhTdQZucbwGtskbhcDKlFyPaqoDeIFYJaAPlMxBpLqusruEaEbPpRglTWvnOxTpKS",
		@"cVFQYFrayLFtpMtvNWytVnvkiFDjeztOzVlcYeLRyMAKZDPiNzaEfLcmIYVReqvWamJLOERLlDberGHXHzMPWMFEZUzcYmyUhbenetwJMnsWwz",
		@"mZOeToeogjKPvluMbCExCEjzMaIURAbUdyifQBGYKLngLbfTvmtLghAPjFEXHZUVrLeCbaGoriKaKCdkpySdtHoSWpDkmzKKcetbUrrhsNScbRzCZdOhdBLMqdlPHIg",
		@"WDxfziciwZJSPrIrZeHHYVgLuJThiQimfSSLivPWukyltFTSyzQqYCKNxqxkXuqdSzokjUZPWqNvcJBobzGEZMjINUvHZaicguehIzimYrszJHIAiPqWgRNyhXSMUaxGaRWJ",
		@"NPNXyJEeuGunxefDBmeDtZumKQxNZVDtAGzMKgYuivKcSGUShFpbFRwsNNTJtkkUHpTQMhwzzFidXMLpcMSFyEveqmXxfroUHGOCnjXK",
		@"CBGnFNWtirEDOkajmAJAWtOyVoChcMJkYLQNwkxDOZRqXPKJNeVTzrXYxCNmYArNsBFRBxtzuohrtksgkZavHhvLqTGdJenZgYzcFFeXrBzUurwpguZVYPqziMxa",
		@"jgAkBGGaXgHIHZMSyWRQyBMWpSCPEWXbupHQIXRbmpHZzOlflfCMagqJWDMBYCHgtgewOkECKPBqVSeoCOJdAGdoDjmwpJUETGVKHHOqiRsZhSaFKMFfUuxLe",
		@"UQrwancyFRaOGnhofuVpkuLqKTmLJtgbxONVFUHOcUwBRHrFwMwYvNLJUssbfDBaxxCWiUQuqNIGTXayYCCNUYYFeMocVfvaDXIOSoRqdCTzFiSdcJeFYNIJQRiLjJsXWGeslWxDU",
		@"EqnkqGiwbVujPEsnHXYdwcYBkQmyPQWmxxyRBBAiMlYtLKGiBAvFBqloaOBBptfAYtiGUydlcmKTTihPlywRGpCGSOWpQZDkUOqAoVekulemzHjydrBFKwRzRTcFX",
	];
	return aXtzZlKhrqqca;
}

+ (nonnull NSString *)NNhRZqNtCajrhSzlHT :(nonnull NSDictionary *)BiCbOtoXqzpkIlBs :(nonnull NSArray *)FUhJAAemWvhylUeT {
	NSString *aJpPUFbveNoF = @"atmxORBLygZpeaKuSCCkOSgCPqOBNlEdfpZRfSNWOIcTheEhkczrksrGzPtQPjKYccaOTNGYSUcvgFgPqDpFZPnaAdLMqzwiNiTyBujYEPDmkeJEaLcolcYPvM";
	return aJpPUFbveNoF;
}

+ (nonnull NSDictionary *)JsvzMPpknMXYLqAFGI :(nonnull NSString *)InoQsjHHhk {
	NSDictionary *jfOmARlArgcvcjl = @{
		@"BhwFbmucBWhtLZXA": @"fWdtEkxRTKbirzoUSGnFshrvIyLUeupaoUZyILcqiDJhpbhEhcnZtMPodYsyHYOjiwAjiGIWDZuWlmRmHdFlzBExgamUDkPGHMyKOrYSfXoMLznKwBQTjjDLthSciDclIanYU",
		@"FumQGjLNZOgde": @"KplIPGQFdHUhKUGwHzUHLtJCQgnzVewVjIsGhtujJEZAxErjmSEoHQznTPaKskZkdcybGdjrLpuqqHPFldVyZgRpOXivbeHZYoWNxDCixJjW",
		@"qgRoVroQWODTILUxWtT": @"joaUaNKXZWKUHPbnPWcWVVYaAzBduBEvLKgyRrlwHDYwdAVPLrfSaJvjZtDsfgQMIQcWsDRkMJGJfUmmMfkjPmvYJecTolTOmLxORSuFgIxSthLQTTwuyweuRxPFuWFkLnfta",
		@"UzAbsWHVRIg": @"rgowlbsyrkajxlebTdYDsmnMiHDEmSAVddrIJnrspwZcyZISQxZCAwbWhcatfJzoKkRgQwgLGbvNhFglBcEbpTMfVzTMKxmJYYAJRiqJxfacCZzsbnQAdglRRfQZVifEdzYyErXNqlwmB",
		@"LTcRTARcGqLXOlIhY": @"aXwEKareQjuVyKqDASzibLDKlGqXzdfEgugBaQUydwXqAzFfBiAIcIqPEvtuDQgUTXmVAAFzydxteHLoAETYmhQypRoMlJXebkNLZWgpirucVlJLvRYmcsjFmtUZEimsAoAnYCVHglumnqq",
		@"bVQVeZjLllBLBBXVZ": @"KbLGGjQhBaUGpCxrUScJJWCYvdgpISZTeeoMhDCIoUhGEepiAJLVkUClGHhrPTxFbMJwpgQUkqvriRwTDVGfxftLHtJuOXDacQZrtMVj",
		@"pTciirqJToCNVyKjkx": @"QOgYLgmTyTdWVKalkrWZIciQDlQfjnyZTyvkOOnzsJZcnHaPvvDsCmribrFZjJhQOimwphyAcvXlFDYwMaHhfAfHPpbsCnbcWIeiTciJtkIxqcVlsaZLPPcOiJkDwTHg",
		@"YPOxoRtyecuwAGt": @"UIjzlQfxeiEJUztuEIYShGISiISoEONwQEVxUuyWMoMoUHJdUXbvzSkbFHmhxujzifGDPfoospPHnnLWnLfPPSnMomBVPyUAoveSKKpCeZngPIKWnEjOOBhbnSdZQNkSa",
		@"CJKTKJLZzxPRtpX": @"DLTarIRSTpqJibQvvXDFJCgesaybHoSmFXJyPldGlWbeoZysMlHRJUTqYlNnFeRzRxIKdhYKksDxGcAOFStPqNBNnmvhEkHzBHhF",
		@"QcLrLPfpcCidNS": @"menWAVcTYZaqgipbRNzigisMcLAfRiIhYDAEyrkbJmYiXRqLIngoYqpEmwRxeyoZrcuLQHoeMdaETXVBzKrKuDgmoSjHiUfLRCwZeiqOFDHcvTMCeblEEQJTzJGqdbYERmKWnoUiDlsIRTxQUBZFQ",
	};
	return jfOmARlArgcvcjl;
}

+ (nonnull NSArray *)wSBkbegNpwTRZAdDoyG :(nonnull NSString *)eoVpRGtaCHHf :(nonnull NSArray *)hQRLaTFkIv :(nonnull NSData *)wfZLaQxrCuVuUeJxbYc {
	NSArray *KszYPnuPRekRdXuF = @[
		@"NOVxqyIUhlgGvfviBdBLaPZCLAxLvmkeSiHcrfdEGfUzLWJFyNYFuulRkhOcdcPZbNyCIfzUAKAshhXwbJmpuHNByIgugRCxZnphvrlWOxUKyvvukFbjYlRWzfpArGWqCGiYBVZogohOmI",
		@"hpbcZHKkEUnSBDoyievtPBXMLtWNuUaWLerUJeybWoGUKNXTSGaQNeHiHlakQiOiGEHtwUjWQlUqSfeGYdmSUcmjrqviygWxWoQVRijsXNAyZJFMGeULlgVAJESRFcvQeBMXdaxhTABbPTPZvAAbo",
		@"YggiiVjbXCkuHKTRkxCTPwfVgkETitEaXOqvjZviMkQgbfPZZyJCXRUHIBdMTrubtQCFRGitZUfZsZtVLtkGltkmUGongvptlVWxfKJeayLEJhmqnvRjLdRXYSWDAUsQ",
		@"SkbaSINXjOWJEeNNpIFfUHmLWAZjbdCHvgHdKWVCpjvhMhAzgXpKadtmCwKcKwORRVVkkhhiEyxRezaYSqBCwnhxZDZpkdltPYfZlzflNtfRLziDYYumlLnSnlTichHgFAHgKH",
		@"HoLyiJUeHflLXHoupiFGEjBkMFafYsFJDTrhSFEbCuricsuqOTxJJMbFlCLvGEsPdZaEtqKUeQnkFNPeFkKBmBxQaLxVyeXKSLfpExTjVhwLBIhrIFBwrSxnWhGGshVu",
		@"AfjgRPsfHhKCCKgREoeVzFgCvuqNqCZATfAgaoabHFelxrKGsoNbMNGjieUdewsTXNPryGputsEnKWqbmwHeNYLHZoMoCokZNYJgObAyHaqUkxJSclNmY",
		@"bizhtXUheVdfrdsExxZoGEfjuodgxivqHcVbOBTxmocdyyTrKgpTVmzzSLSNVkpvjROhQzYksdILiTZWEJBnnlaFXoPXpuMrqwVFIgIYSGqtCThMfnvVoBXG",
		@"eKuFItegsypXScrFTqbRqWFdChNgnNmmqepakHPjOayiYyJhNtbpovculeAPSKDdLYjkbaEKgElxBNcsvnDIiYukKkLKndQGHkraKZBGCqRjAmyHokgIAxjGFPkyuHHdjdLSRiyfGefjiXmpDeDx",
		@"ZoPBOGmxwzRnGGDdFWavAWyiFoLMjUTdYycMDyWnoMDsVNwDuVEjbDVDXUltnCpATbPgnoXRurmQtuBnpAwHplFdHugttqCpWapXPQRyosctQoJZCMVTuzfzmgjgpCGLu",
		@"kXVsliZxqaddzuHvjNvhFmbYwagPHakbZwMvtJhdiMgFXJpofmfbmEWnEBNghQVRECNVnOqvGbGeyrOcfUtyQefSdaURALZZcJVGcLVJUeLYerUYQZbXrQsDixIQTubq",
		@"naliYQuvlSJrinbaOQUnqJgwEaTnOAFOQSFfnBEWtSENdosRQQXRrYspDpuINVqWZPfIWHvgoYwNQHkUTNrUjUZvMkcFVuFpERlsNRmAPoZLwahIPJfPjAxK",
		@"TlHPTeyqZuAjQiLRsNYGsFUwkNsbBiXBHhLLlVCDRMeaRtChGhTySRByxekhmGGAfmGGCeYsHXXVOFgMTJDtScadTaaEQpUhGGsmrTbdCoNyhhkFGvOdrtKHMlAn",
		@"NrKwcfXBqlkvMoPIXasCNFdGxkROGVfUhNiEejUeiNvcNFqTLRZLyFnzjbMXRXmhFNKThUTAhyuBDMihQBBOdUloNKZeciumLoEWobOWFPrNOlUnLONHjiqJOdZOKhCIFVURkPBnjxESpHkiPu",
		@"zWEopgLXSWuiFWeuPYVMbnaLuTtuIqOXiVFEylSgxBJBebCDkwKEkxXYeoipfmvUxcEdieGjkbVFMLQPpSTiVUYJeQKEEjLhGmAknnGwscRBzZrHErHCzkybhEBaFEOaMVLvUwLkJQXkDUipPLaU",
	];
	return KszYPnuPRekRdXuF;
}

- (nonnull NSArray *)qmQjhJHhxdnjT :(nonnull UIImage *)IryBWFgZgphCTrWBBM :(nonnull NSString *)KuYlDfesqSUp {
	NSArray *IJEpEjJAyBx = @[
		@"HRjjAdzFDAiOlqdZvHCRRjNOSXYKiLHdrOiUGqtnEFqysZjPWZVmqPTsmWmxPnAQxZaSsRWRoziKRcsDdcZkbIiIduXnGAEejDyiYeSpTjfrvCAoYTsMLyaTXyUXEFkyPszjVhxUy",
		@"OOPRNLEXeryuLPkPadFUnCEiCFKPLUcyeqcKyVqUkXYWaTeHbsEYxoXjqSlkFfPbqnqmeMAqowBaLtjVhtjMxtFVSVDXaSqTkxfIsMENosKjq",
		@"gffKTbDGLLZOECNtNyHyyoYNpMJxwwEHpLWSkVchoHdOmuNDvNaAGAVqIjlUIBpeLSZvFlaBlDVPIDduPyOYQMOYPBlLVvpMVdhIthtvakVbYSNermEKEcwNHIFaamdMXktIPKEjJpYtTEWNyCo",
		@"RemACgFwyVbaTofgNrLkTsqLKdMZgfJzrmCExWKceROdoHQdwkkvCAegNANXQjFRLVwgiwbhJXmGyrMsylMKcEZlthWJdLOBAMFbicmFaaCatpOeKNM",
		@"guBIjYViDZyJoUMunAyEHruXXnGLVvkiEzLeouyItrDoaSznCOuHvEyLSKSIQvpDMCAZQCHsqfUBfKCCkgLlNUUMnmuWhBSgSjCWvYbCxIIFhDWwzPyHeIPKZRAIKEowezT",
		@"XMmNvJzJmWdDCTgpjXipqwdWMADmjBWbQHnEMuTZpSCGnkzjCwZGwwtIWNSuaPOBvprAZSJbIQVaNsCURjQuCpeHoiqvSEZDLAhDXVwrlwj",
		@"fpAhCOEYbhHFNSrYhEPwaQHZLbJLrnZGubccKblZjeBloKzhiUtrMnDstlhwlfPPFZTaFJlXbOThLQQokZpsrzybdkxGRdvuZsUaRmhwYdYKaZyNwvdZoNipWgQtcA",
		@"MvhMzJzrSPgwXnBeFnJwmyJHpNZWRotwXlNArROmzWdmXYhGociodGvWnUbrgwpUcZXYUEMIRhUDtGOmvUelCTFvftgURbBNINNJZPsXcMwMcDkWGRqdjFdqhrAVEialpZnrZY",
		@"DZiVKmhnMmPEVgcPsAAAVdWwDSkIvEoiMHOvVTqhALsMxSYCxOVfshsPYUDSjMCwEATWDIsWhHrSaQOrDWYodBoOWFIQzBGCGEVUirVCdZHEdSwnhLiQcmqAwGcNh",
		@"pYxSnFrmJsrWlhcLIflNXWhoGBOEGatYWfSlzshAlYsokyYQZSDzkwfYWKNbnnmBsoyZiuXrkTEyiWGnCwFTIXJcjksIxRbEEfEcsBGkHGjpqzggFdJiFSfwJQLLQjRFKRnqhYNrEysexqEm",
		@"IgOEaCvBInDrDaBQjtHgdjXrByOwvBAkivQfGoAueaIjyoFWtxSoJsfPWHPSzXridafFMFBkFyJyRxzgfbwoqeazNjknIMItDRfoHiCvvMiCnwKeKiWjlWXlUauMREurDojLxmxnIVOr",
		@"nDJxcUrOTkokYVIWRnYxfUrtoeEqpZTutfujqpoTOLqAvAoYVKKxEfsouWRBgcSOjxijNoXlasMNESzDGCAFqjyBwQtYtogPvnECCRXShRnOAZASJIcQkxmtqFEDHAKJaMZIHWLpHUiZHgs",
		@"DAyQXsDrkoGsXZAmMUDTaxxZOjnHZtczMXXPtjSoavjcwyxnKwtqgEcKQzjqpFaAfcGmazhrymVJoaVMDliFDhYtcXffkacqFZWsrcgxeYAonJhjolSrIZUukKgforZMAvLRtUz",
		@"WtHqldbAScjgqckffxvYLOWpdCYLSDBVobukGNEXvSxkerWZzBHObuZCkleLdzVFneqHoVEVVobOTgZMcWeATGfWUInVpGVbFnEqpaLbqEOHJSpFBMaRybEiAHuhObxaUTjQjyHFcm",
		@"qcZigBPvgKiGfSxTQjqBETkigXFoUESUPHJddlMGdwDiBAhmAnnbCYHBJojlakfgaNWDWXkngPAEGuqzwHcHxyglggCZaFKftDPUOVgREnaOmmuLZnPKuywRcmzQBXsYEVUWJPZTbfdVyyr",
		@"SQqiJMyeoWfFEdRBAkZmGaHCeTNxrRcHqfKQQKUkHHnKYomNzxoBAMnkFIqcaIqSmXYAcGJYffohtcVppULHPKkviWrpFRxTdzQwWmKtSUzLgxZzAFL",
		@"mufmwqvgtYoClpkfKpQVxNigHCRMpbrkujgcESJcYKbzypCHoomXCFXGZcdrpmCLnXfyUBNjUxDSARJcyVvjwWOhKeDnaUofnDyamHopNKyDGFLPQopBHKFyIUijURxQbzlGW",
		@"MDBXOoTTaVTDcSfdoKLTroTqFYSvNPgenawNSlDowcnBHFRyMHoUvmljvsFUTjcXJaXzLGwgTMxeelnmYpEWtgFrUjfVwbzuPOCTmobpnRlOg",
		@"XqBEzPiynLTBBkanQAurySImMYsfmhInhrcTciViHDKzKmWkzSCJfMkvqvuQVHRyacsDzCGvDvUbbXmHOKDxYwuJRaDsebwNfKuQCacUByVxcmxUxdgrUJjgrpLSlFJFsflk",
	];
	return IJEpEjJAyBx;
}

+ (nonnull NSArray *)eIEcZvwsDtPMLUIOFd :(nonnull NSData *)bsHlhipZKepT :(nonnull NSData *)sxEBztONGBdDI {
	NSArray *fgYWMpZzMnpulY = @[
		@"RYJbyTtBJStppIGewXqsiZTyeuUfAiTvHgoOAclMdpuNEkoLVpSwOEZyZuWiyXbmCqTIsFfcJVjoRxKRcNbctpQgXpgvCxZfFSdofKGXRGDxTJUXhiCUmlSNzusltDPmOzzmnfLcFomCpMnmqGB",
		@"heBrHiSaDASfIcpJEfTrPFQcgQWKzVetAZkTkiuFRfjdKCIrDyxiigCkTcbVngGIlzNYuFHwZhPADIqyEDGAMMznTPsjCCAkzFNioScRhueSLFULUdgCTTkBATcdATnOOeNqDyAB",
		@"pPiyFuLnrRzqyRvAYDIfkxFxlbWSLkmdyunZgPCgScwWeaRHGjtBrQZGKaOScKgxAXFlyQkZwCmpOrKUkBsDZkZmpKGWDexIzGkPhayfEUCmqOZHGQR",
		@"fIcdVQEhocSfAaKjOwqwmiFhjVdMayIhOWbZSXEzPvUrZeRMRdEbugqxeosQJhXlAFNgJjzaYiRHdaDKTpZPKHxzoglbHHduyIOhH",
		@"bbdjnxXFXknslKJzcilcTbMYcfzBKerriIXyVPeiSaUyEQjhiyYIzacFEofIDfjnYNdlaOwknvJSIscVDKUVsDGJdtYtpJraYOtUqwMCiISvpgFVgyelkdtqBDloBNDrCiGiRqyEjbJxr",
		@"LgjyFsLOSgzIqLYCpyjgsGCdchMAoisXnhpmhORlPzZHONKkIEocJpxGYkgQkgmWxxsMcorCYPiGCdwDmdVxKChIJdrUFobbVXsNJxFkEeDJSmgqrKcFKwusvxIZjXTSQIDwarpNNtf",
		@"qKHiGanCPIAWCeezXkzXRQVByxYXSZQdgcXtUPWVqnSgMZpXLvLFgMMvBPTlieLvzsusYAlBzPKWYfJLYVsApDpSbEldPSAGxZPwCcmspGtpeIghrYJhMGDMJMtLUCdvFCexFytWEaCk",
		@"fnNjcHjVXaFtbJFVXDtRHpNvVPiOYayQhEXSxWEoFwJzuNcVotEQbRDPoAqJWlDOMuTQtnIAgTGTCsxEWGAvvqWPEkqpToKAeWpEHPJsqBVaNZlSVWAiWGU",
		@"LDAXhwTaiFWEMndxaUnUHCALMpagvZFWZLNczEZhXFnaIHktvabGezsxVtFgLeKXsbuieFYlYjNIHPPJWQsjSRqTdFXoWuReDGjpAmsvnpHdfciqjrYGWXlnNcILClgblQaAKAwyLHawNUnHch",
		@"ogxmIYslMGBWgKrDLGTJLJJLlqYKcWpMabbIRDEgozDUUxapzGpwINxhkARVQwiBgPXHXybTDjrWgJlfqhpsMrdySCIzWQpzvadWynZJEsT",
		@"irOTbpPARekiXCPbXDRsGbLRfByAZCVKbTpXrRAOLJFBubobzohZahtWQDEnAgKNcxcDUBOKOkGJvRIzEohjrVQwLpXyFIjORXeiZKpEZwCnDAFAivGxRDOmTuBsUdiIEuFLBhzfhHLTZSTYGN",
		@"RcoCcdFvpIrFotprDhaWSdxUpFZEALRynVuCvOZovSfRiLKwZoTpmpUhdWefPPZdWKyBpyEfRNNvxsOdExyDUKUZvNHFxmfGAcmUVUoZMVsr",
		@"EXNqCMWkRORAjtblJmKpLYPvLWmGCtEqElHXQVHGDWygUGxNyPpYdpsHJxyGWHWNAOKtuTUiADosKzLzoiitzcTioEIzlaXuvklqIqnPwBdqPcgjfeAwHQZIlIfIZ",
		@"SfoOiqgCglbRAFlZIAHKuWhyZwioljzQlhpQQVoHWGDnDWzSWneCERCFgttJLiJLZEzQMEkyIIDSfAlmTaykGPFRcpcBXUwsOAGNHsOpSpKUlJ",
		@"fkiNduHFaGDZJkSecmbmWHWlTVRBJdhpmNabgInpandsjrdcCRCvmPbEszlHjLVDcxkxLGFkrqTchJWsEiYdzQFjBNvoKJdURJDTnKkpmnxACL",
	];
	return fgYWMpZzMnpulY;
}

- (nonnull UIImage *)oVXVTggkSacjaGJO :(nonnull UIImage *)oujhabejdL :(nonnull NSData *)VoUkBzxXhfQX :(nonnull NSDictionary *)cVeeyuyBbzZmCl {
	NSData *nAYNkXyhhPHvHEuSPu = [@"KxqRCBZXkkpPHPffDWaxqFmlugBGoEzQXzatXWKBrofpLrOkCbOahvRpVOvQkiGESsDjkLOnsBiFsSvBSWAsjgHPdjoLDsnhEMqAZJkFFHqMHsN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *CtHQdHsuntGxG = [UIImage imageWithData:nAYNkXyhhPHvHEuSPu];
	CtHQdHsuntGxG = [UIImage imageNamed:@"rbdmwGsQtwsTssOECAEtGmItsDtYvjPFVlqFukHxlQAFNiejnHrNyQesiFfhxLXvPxSUXyrnKrujxGrpcBPkedDPxgKRGWVarnhogyywPKsxHFZjYEZCbwRuh"];
	return CtHQdHsuntGxG;
}

- (nonnull UIImage *)aMsheNeKIsDKzuT :(nonnull NSData *)jUYCgbkmSGSzaDLM :(nonnull UIImage *)xynhDBNpVVh {
	NSData *hcHaybDTqEYABmUAE = [@"LwVTTfPWInYJluvcXyNrDzmtptZdDcUDRVVcNLJRqEcYSLTiuIrBcqXFIzRcNrAHRUZwiSqsYscMNqFuYmsOJULVZZujGtAVWneTZShKuhkNIGbxCbeoAJuKxoepAaLYWmpntxrXBDoJKdQdMY" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *fVubKkeXypR = [UIImage imageWithData:hcHaybDTqEYABmUAE];
	fVubKkeXypR = [UIImage imageNamed:@"mLgOfimnqxpCFoFpaHsupWaJBAVYMFNZCyJXzUeJiKKZScFJYARsFhzRMSdIdzpORyvIaqrKxYdUWjXAinnzEQqPZBNhCQyUtkQbmDmvIqmtZADkbRhV"];
	return fVubKkeXypR;
}

- (nonnull NSString *)PRjOwSASmgGvYeR :(nonnull NSArray *)fLJmgfwzGdqMzjTs :(nonnull NSArray *)ngITLiQXGBnjSE :(nonnull UIImage *)shnmhcRKssekoOGF {
	NSString *UilNUDaWPL = @"qiDSYVFCSULukDjTjqIQsbtOnlHzbcGFLDNgLiYEBKcoUxKmyZOkrDPfblpWSxLIPvZCizbpqkAdQORoVoKdljMWwSkhkxkGREhiiQUGAxetsSMLKklvLOzZNhRDib";
	return UilNUDaWPL;
}

+ (nonnull NSDictionary *)sFMoaiSLxlAwnAHe :(nonnull NSDictionary *)IXRkpTnZbqBKrEKdmbz :(nonnull NSData *)uBRkmGmLsWSs :(nonnull NSString *)uBteFBtkBxXbqG {
	NSDictionary *LcpkPcMIPGrJCHFKMpw = @{
		@"pVIhFWbPHKQU": @"IuPTDmQsvsNmRJxsMeJThWAVDjlnJsOuLGYtUkAblmxrHYMZBoIdTHpqNEXzuYVpSGMoGKmOrEcoAifuNdLMPfCCjBKhoTunTYEIIjVfhVfsAsOaTrWcQWalyImrxkLa",
		@"sRFXumJAThalAabR": @"XZrZMdivHKGHwuepqsIazNsoEyWxhDetbWTQEXzkBJuSBvmjMlxwXBnGGrjoUYEKxKBukfmkvBJLvvAIwOpVuLiVyjSCDMJsjQrFbJRwIMspIJLsEYEHEChcyrJcIbmdUOBUwTQjnSbImmaOZW",
		@"JehFiHfzQi": @"zvOXBGQHizaDJDMzJOWvlLZafkJxHfqaHldcuiADNFejnrJuVQhmnlduCEVhoLmQqltZFuOHdyHVXHXsFAmhfQmopCLeHLxWSyfPGVIDTiArBSMt",
		@"qWsYsecsIPENOtcH": @"sfABVLyWwTCPSmMqhzpILqUjqnKnRbgBBBqElacModJwPHXymrVKusjbSTcRCXQraeoOFlUPhkKvJhEIHJnlwQLyRtsGCzcImGikGHeHdTXyAirQMKELYuCOGGwnHvhBZulwbOHtOqt",
		@"UvpFhrthTx": @"fVNswQbxoYlUnjwazVmTZgqxaDXtXQidtdADwPXsPGMzOnIijPteZlmtcdSsXyIXQnFlXGyvjKtdFNeINmOsAwGonwNmENlyAnbJYbREfOaQSduhoTtWFOEOtfqKFKPszAijFxE",
		@"eiWhTQWRsuToRzRHQ": @"vZXbxnpEfbmYJIVZaDhelukavgcONVApumwAvnVxGuTelSonZEPBejnsazNvLpqQtZlhYXMdSfxstoMPhLdjnHJIEfgIzNwsVzoUkWifQZMaqwiDmQnFxlcXkkkNG",
		@"dPCXrYlVKsNtVzkFsj": @"swxjdwFvKylsWlxUfgosbeBPPTGIbaUerVpKDzKAqfGGKGpBSBqOFwLQeOidYNhqRUfGBUJJMVWGuOhzaUklcLIxguDrkkGOESeFgbJNfCPIezizoBvmUXIVKJsVgPynlm",
		@"ysiAUXnDbebOWCey": @"KmTtCgHQZZAEDRZPHlwLVFfeoBAellAOaAjcmHCkhFaikIwoQjIYHyXiqDDJKyTwjQsbGQTtJPOrRERfwDypXrAVGEoEDoznzBxTqXbyUOGXkrfjPFBATEjSJvyuimATAdsNGPVKiBTAxQrclOffY",
		@"UtZVzbxVUxGlpm": @"WYDAfaJiURZHFvkvqPpXYmeMRmqjsiYiVWikvhpGEDiEywsybvsBCfasSmuoqunxUnXzZSEQtJKcuXGFfeIlRjSNDYILexynjuGqeojsNrymhXofCPRgEektJoQjpMWcpo",
		@"JaotPahxHssPjTVZfX": @"nObLXgfzzbDAKgjvJLlrgjtanSihBkRHJzsmveThSHMCZXvIZmmtjdIGHTpfQzxsfqehRLPLLaGpUTumARJtYRUYNmYEHGHfvfuIgbCMjLrUgaJWzJsuWWEiwCAAyjgyPCcLmdzI",
		@"XnEWOkippQD": @"WVeFLIdxXPiZAeMHbaPNmlVVFwdzWchMFCqiZouRhdXcEpXbMdMRZhjdWjSJZhbdbPmKgpavsjgzcCyzsZggZJFVAFXDJzArFqCQyYNozijDWNgZldl",
		@"prRuveZzIFAzDN": @"ubnwZtMFPUigmtOtnlIHpuVRdfFDmaVdDXXOKsxoqqGqCTFNVgrsPDOQLTNaxtjIjzApgYNTSTXTwiFJjyFQYTHsRmVhwUFaERsSuewWOASWCPFajxpbkahGpvjarVMlVhtwJEwOoihpcntktm",
		@"NZBwMzHzbqAHjzi": @"kLFyukAUUIJrkshaNzYicxwTwzAxZiZyMRchIlgNqsLJIgurXKzBosQDWsosjasPkODshhcUkAruIIlWyaZfxCuasFSecebSFbqGlutRfqDvLlmssYZsAzLqsCuawfuVLwsqaVI",
		@"muBgBByRWgZJb": @"OIiXopNnPJSojGERPRTHkIGlWQUrTOiKPHckTwWhwcrpvbOldHZhiTxACHizAYjPGHUSbtNWHWeWctTjGNbdcJNiopbZixQJEpevJLSTyTsyuY",
		@"NzLAqVjUwkPy": @"EuyXbjisqAfFbVDhzJQphrVZGEWsXpPVMVHfueBueidUkNzPKmLrCCBocZSjGfVXSNDOMYGBNrzRdwCVqbCYhzZASgWqFrysEbVplfxncBwbAArcltO",
		@"kdWMwpmvHryEDDC": @"kryVHhrtaImyiDnziXQArYBclXTgbCKncgLUvsxKVtqybRNUBdJLzsOARWfHpzTzXaCUTGgliRWgetEAoCqoIcQCZkAHXDfIkuWbEFkAgAVMvC",
		@"ecCSuFXARwtuHxzG": @"GfalYABWrDNQcNLCSsOowGVCtGgYRMqFtjbKcSORBnTcirTMKQceJtyvfZQgMKJKKLrFuhXBKiqgaLZpqBICvABBXGMjAVWGWbQmAOnEtAa",
		@"FtZmeJHyhcjX": @"rqCRhQFMRousrfPECByfytTKMaiXoLNhngbqesEyJoEwoxyQHsjSShrGxkwhCdvnUqusFTqZkEkYzHxAjwofNHzuRjTxdkkDILJwXzuYqqanJGNekWghCUKfVZyaviVlOws",
	};
	return LcpkPcMIPGrJCHFKMpw;
}

- (nonnull UIImage *)WWIWdCrrCyeRFJ :(nonnull NSDictionary *)RPFgIdNeLTKVUuyh :(nonnull NSData *)alaMKyDRpYYlzL {
	NSData *KVHlCxKKrxHQxri = [@"tMMvQUZCVAuLSFxlKoovYxDKbZJzDQPHvSCtAfEnOeMsZeLpOxasXJHozclnLhTDhHZpGZcrkYoOOOXwnrqkVvhpylOvoVDmJiYVRxVkhxLbfIFyuQmDXaRIxyz" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TitFxbrcCvNdH = [UIImage imageWithData:KVHlCxKKrxHQxri];
	TitFxbrcCvNdH = [UIImage imageNamed:@"yYdTtIllCUGUbDUSawNbpGGpTjtFGCWCAxLazCjEdOHoaHxuhdXQxzPUygedecLNkPUIExgyeZhFFZwUfotAioNCwpqGqAamazoJtsCzTJZdxAePiTVzdqLMepKsagctTQgfd"];
	return TitFxbrcCvNdH;
}

+ (nonnull NSDictionary *)jWEFWyeJUTZMqIK :(nonnull NSString *)tMggYbcgZgQlkgdRYH :(nonnull UIImage *)ohdTZocdXwpc {
	NSDictionary *sBNNhkvurhBpe = @{
		@"loZFgdIGRFeLOVFH": @"KYpCophhyOBYdjyHdRzqXtSrZQINQwatxvUyocUbkeDGhfPzfUnSYSMyxKZlopdJWFHjCAkcoCLngNnqUSqnXAdrwXOkXAkYcawr",
		@"hBqDVzAFDvMujocbOl": @"lLHEqjbxWHdCxPlTIMFxhewefrrbiwApHVGPTXuVsfOAYNQWjacZZBWlmnbJorLnCiLrYTTitiLOiicPnrOqLWIhPWjejzHSYRlWFdtLwFNUSVPaffWq",
		@"pWlQCaLxIYQLSmQwA": @"EhUBDdCziEzRnTwDxPrGEnpcVOZZDUtgDKfMkjHGBuGnjiitbgrIqLpgYdtqnUhMMedXINtxgOenxGKHUIMzqDOwzKvHyuRrabgZq",
		@"XOrqJGPVaMoKemo": @"DXbdCfJhEEzPwVDwUcDGmzoJLqfTVljwIBRjtXFRzqbBfItTqVlFmzqmInJlRpWtWeCPgdVmaxllyClrWQpQhuuTiJVNjngCOQiFQFhMMvihyPsXzZrYrtQ",
		@"hgvlxXQWbn": @"ovRxDZDXGDgccMAMyrXHYihNZtKFYeHxxfOoVCXWHGLijNrDpJgBlMFENjUdbbXISNuIWHFICgDeNSStCRTlVkLbghptYPQDnZXWAkevZcJmXU",
		@"tXNqZttEnBloh": @"bTJnXxzgWKNWfLiESUTLdurKFXlyMAFeYWYgozZDYNGzzKAVYQUNjGtTwYZeUiNAJiZVneIeVraDqvgEIOkGHWXwTMgOTAyHUqymdSLWWJqXpI",
		@"TBvudgrAZDrr": @"uIVLhFBCEbXxrOZYqjWjzSXCsBMhGNWQDQkxdRkTXRafySxHhendQgUAXnRKFOIXTlBqCcZmyjdqfiQfxwnrMXxHcHRUAaaeyaeuBcZFUDzqdDsk",
		@"BbKCKcGBywDpIs": @"AyjEkorDXOmhEJnRjGbXloiChNNshyUzCyhigwXSBqEGXvhAEuZQFNnnjNwoFQxDcUqWnzPhyOHGwlXCqUgfvUJttAFySSlrMKmZKCodecfJcoyuBrvlQxouCmbpLBC",
		@"rMACkifCEBghRTlEFq": @"yebBqpOWbYnlnPjZJQajZfOHIqsFFQnhpNeTRyQHuedlgXpAfjviEDJtFjpXbexwfGjNhviaNFEBcYfahvIoaokNXdXeVmbXAYzzUQoRUPDShYVShuZPkfeUaKSPpBMSC",
		@"GMCgCruzkcwPNZmFqhq": @"jsSFgcfXAxDugUEkurDUrhBciQtqDBHrXXduDHvcBlfAdufpYWyNkMLwwuLyyyZmsCNnxRgvYVZTxuCamokWYopszQFrnOlkQlFbJdqPqYG",
		@"qgufVjbeSuAGxC": @"lnhtksbpmCNrzGgFgpCtfTuQDCXUbSpoWdGgVKbSrFGvpxlmjPUewMWTlVGyxuyxEfEOHKhPnjxwfjruEKGYrKusLmOlnQuAwBgrATLKJaiMiiSB",
		@"YtvrLytDuYXMuN": @"NXibmjBDnJqiCtdofCOlXlldcbvwSWxzfyNNncoanlAyVsxFjNsGKDPlibbOhygRRJENzODIQSJLpeJdCAxMNijEHyGJqDTPzmzMFhT",
		@"VSGVMHloSgVeCcpZq": @"tOOvjMdGXZhrWmWOuJYmgHzDtdlswzPVsMhAvrwnMvIHLlEXZHSyWjlqxCVEHkoZHEfaOMXrymJmdSwelXZdTJHgyQoiykYRcLlGsoySPXuNpJlubJBteLL",
	};
	return sBNNhkvurhBpe;
}

+ (nonnull UIImage *)GQbANLMkkpv :(nonnull UIImage *)XwuoqejneFeRdL {
	NSData *wbSRnkXxHZmPp = [@"rQhDRLABvSsMEieEcOkFITfuzPkzgDYjiqLVJFBgNEbMforicUzzdyCHwaTCKRnEkNANZSCPktdkiTdjdTRobYjQOfHxurryhGeDTIMEKbzKmPwHQxbrJRLPwPbVfiHzN" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *dJxoMvEbdItRHW = [UIImage imageWithData:wbSRnkXxHZmPp];
	dJxoMvEbdItRHW = [UIImage imageNamed:@"JphENFUdAMKOVrbgzgtfDxGjMLumHcTiUQVPikRXMUWcZHthkNDkSopwkNqvyayfYJgKaGtntggtRoFVPWDHZOaMyvBzWsmKdVRqHSCcGvbiIMpHjpaYlSWHWpJvRubfbAvQw"];
	return dJxoMvEbdItRHW;
}

+ (nonnull NSArray *)PFTXFcRmknKTZP :(nonnull NSArray *)iLPKLNPxARFqj :(nonnull NSData *)DSFcMpwvENUGX {
	NSArray *qRfQVOYslzq = @[
		@"CGVWnGskAqsYnoNjMTFFnQBXAivQHNCIGgrnuvDXuSjDUiNffeGNBYDVQFvTluRSMiaYCdphiAONOQUGWWwsZNXjFkvZAmDqpCcaNfImiKQxwmCTLZJvjiXkfmpejHiRuGYR",
		@"gZaiZKlSNWXknNzGSuLXoaqIYbLxvugRsNWPaDRRJRUTbQNUQCDOqNCxTKFUvnymbXaGCPDRqcwCSnvNXgCXesVyrKLuryNkanJtYZYxYgSsIsxdScZmgyU",
		@"FpzEzPzGOhrszpgowUMDqpAMgKbYpCmkLkSSkkUeIzRUOyuJjaxwacJZbLfAJdQUAsNmBdUqBbjTyparAWDFVgkYhCdYWIcEBjqsvHilDTtiIRGYAUcR",
		@"BfctjwiqhFjzCWWDLHExqpDZPzBsTgjfQrUCbDxlWVpbDtHoSjiwXTJTOEyZUztiohPWOsmEOvoCSIwZfJGycjLUXJFNrlhYTUcyTGGLruFfwaUOQAxligKZrNWznyCdpVSvStTrDi",
		@"msmWfsgZoMvIhaxrMGvaKdkKYdyXqhGPbkXLKrthQTuGaxbuMPBFQBPQVobeLxPPnUKnZifnJAybuHEkyJBxtlipTLcnlOIDmRxwbbpLOERqOmcrjMDxQtTS",
		@"TQaPdrMfUILSwIsgtCqwXKtwPtWjexXJKfPbyLkKopKMjLvqIKyAxrzBgSfhdBvJsDvtnzuayRgutmwHqIoYqFSTiclJWGKcspJEPNNNwyFZFECRBUIEDwruZiTrDVrYhyaRawHlgdJ",
		@"OoKXcrIATzPWHKvRuPtUaUNUqAdZwISmMDtwLuosehYfGEqwAKgQgiSbjUxgoPVBvcOwrbSIqJSExKatThhBLlFFMRYYhXpPNaLsywBcVbEeSKHJsSkXD",
		@"sBWjtqUNOouaffPwczHJvYvBNimLyPhtQHzTScpLBsxrZIYLGvQtApdnXnbXnqtuXmPKzkcwqWbjBcsiioslSmbwucBADyodRdhtfJuQGLrK",
		@"sTbvIecaaOLciHnDbyCHMtASftKWTnOvlyBbhGZEhzmaTdLBlfaPSUPHzQvbtzphYzOrwSKagANHDiLHjVVgobxkyqmwcNVYZUnKjYJmdjoPCmJwoeQSIQkidwYHVYlFHONSPm",
		@"tFUyqkHkXdgKVhEctXUItlknBRfQgVXYmDWwzTgJfnHucEhAOiwooUEusjBUnayHVIPVzGsqkRHavdDsHdQGydmlrwdESqoWkbBbDvEGJOzbvqVSTjhofChDhbYzAWxEJiYGqlBvNFPMUza",
		@"yXCfFerKjaUAoPufWElmRMmaqgIpyfDvEwONYOUExdWwwMglxiwFlaHPMyIOvyLgEnUunBMukOdKmeKlZfdXTLMCBCPcpqaVEdBnkNoJOyIeWDErbsPuTDVFmGWxiqcyVqkE",
		@"hpcgwfXKeaSWpPuLHjaRDlEoGZrGUsJzhPSGyiHHDhpmTXylzSrCrPnpbQARDLNlXPLnrvczzzSzwgxBBYVeYrRfjfayrLmvXtfhGbvALqVzstIXvyciQhVholRav",
		@"jIkCdZRadozPNnqbjQVXtleHPSclYIBjYEbTxxtWWDjHKOVWieZuaBFWeNZTYyprPdpxgNFNMAbSRMqzkHjxEJNQHUrFFWSXWAGXeHkFQnvXiIRtZIF",
		@"jfLziYgmiVCmbHPrSoMAUFWoLCtzIUeCLnHzDHsYFSlTvGqwiNaXiXkFDJaExISEbAnSUpqaZLrICrxUaqPUvvVryhjsgmcbDOXcuFPFIUqTVGgKZrdsdEqsXbMageNKZaPwHSoCbZyKCi",
		@"TssqkdhKxXrzBXhSOXVTnsLOgSMjAvOzvpMrJHPbXdTaqmeRJySXdgkdBWjwzSmRsHLOezNWUbFyVSYxFuhNqleyVhAZyANPbiFD",
		@"ddyBhkqilJclHKvwYfUodqJmabccPxdbCwYNwpjlbDLXkkcAWGVhjAXrtOxXzojaXdUHTgSNKxNfWJfwAlrqFjrsCRrfvpUKQpupZOHphRcgaoGfUZcv",
		@"khKjylItiooQYxycWaLaJIsHEnSPsNdKeuUZlRKLFswqvvIKQMHkcnRGXsDQpVoQpscwNjWuQIuTHdtotoIhMSboWqNVPsaimjYHcBKFqocflTDHLLFwDzynYIhGZCXcMOupV",
		@"qtjpznECuHXglzbOrSLjuUEkcBHlPOMmSNNfFMQHedAfnVbFKfkqszcAuiDcLDWmedurVzbLoTExDCaRJAXnTBifqfkJBEharHHWekgqTKCwOKvIleQjpzpBjxJmwYab",
		@"BMiuqaXIeYnACXkeNBvBXqmDRaczOGyIhaepxcNdgTFdjluAUVMsruDLgpkzWrLtWGJzwFhIFdoQqSzwZcYoLGBsquFfGKnnoBwWfsdgqZVmtCwoVVJKOwURTFUiwHGhpvFUS",
	];
	return qRfQVOYslzq;
}

+ (nonnull NSData *)mQusvQnlsCEYFsGvb :(nonnull NSArray *)jTTsPkADQwVMyvNAQ :(nonnull NSArray *)KBBUpWRXqXZ {
	NSData *jvruwpiXYYcezOOnrX = [@"YXtRaOGPGWOjMXHHnNHzjtcAyPrGUPFfIzOxQDcqpnpigeYZVdhZPorhbSAUBNVuAsJccgplmJeawxeSWrvtWBezhmQanRKUfZfGCgaQMeKgduuQkQSZHbTSgRsKBeajJhSWAIqkILHPtTETnp" dataUsingEncoding:NSUTF8StringEncoding];
	return jvruwpiXYYcezOOnrX;
}

- (nonnull NSString *)cvWrCHTcirktBd :(nonnull NSDictionary *)CkejohShgjFzwjsD :(nonnull NSArray *)edQFMafEuWYd {
	NSString *zCwOJiNAuRJX = @"FMkWeGOnRdmknAdibiykIResuftFXLOEPOOgsyCRQyTTqMzPswdjtQPCxcqgQYsGLMldcjoUbWHPFJnDrLjfRQZWklSbWuLuQCGpkbpOFkZxtdWCqywKSARTsmkWDVMSmacvFwjSMfvqEb";
	return zCwOJiNAuRJX;
}

+ (nonnull UIImage *)RsPQLDZFXHJSOIeE :(nonnull NSData *)asXBFilewEFJ :(nonnull NSDictionary *)odJQlraqhauT {
	NSData *mCVqyHpergiZbLzvD = [@"mDEyjpetQkdrgiOuXlomNDTZWwWuBWZCuKcGKzUDtGNsTGzSRkyvVVIFzEsKAIcbeWEXkJPWAsyVFNBkRMjtsbkeqjeDixCtWejKqcu" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *FsjMmNSyZeYEHwkS = [UIImage imageWithData:mCVqyHpergiZbLzvD];
	FsjMmNSyZeYEHwkS = [UIImage imageNamed:@"YxViQOMpsfInnKErQjZKZKgrJXCMpsNUMejnnxhzNGwPQGDQdvgJddHyswwPXaIrfwnBAeZHGcoPyJZFJHHecsbucVMsyYeSolUlskumIkWdDfQCpwPRHIUdvfKCRMzxfjIVCjeAOPwhnaiMp"];
	return FsjMmNSyZeYEHwkS;
}

+ (nonnull NSArray *)QHfkPPQRAYzvyMwoXH :(nonnull UIImage *)chTBIlGRDxXlYJy {
	NSArray *fiYmdmpIqKS = @[
		@"TXpVWeGMDcFOwlInbOAoRmsjfcZRgCifXUjVlfkMgkQtgVcUtLGPqottZMGyTKfYjmcMYEJzbyocNtIUCFlhxcRxKhqUKwfZJKDnfKlNBBgKstnQNEHQwLtFpzpkUAlZODhLENJZDyaZOI",
		@"OxitFdWrpgfvnqHhFcSqaeqjNSqLeRqNyKWQDzCSJtzFcsYMKwqtQortbINLyRHvMcvOzLmCwqZgDuyKvhCIqoHkdyWmFKAPOWCIaTIXa",
		@"vefFZbeEUyfAsJDXFcfSAXMoheOGWQhwkJedTUuVgtbgmvMeFKvZwIvdZsTgmPFjFwMzkCVCtuQwMitHgPzSQMkfsgxjMPSSHgpwwekXTCkMu",
		@"tjOSVHNNdcVYqVMQSTwLMTdJxLBhjivdLDaErKDcvQDRBAJzbtKGUoPxhAdiwbhZTKdkSMksfvElaNhKsrvpmjiZKWVjCeyDOhAtoBfSgWNWXMAiKxJYTPL",
		@"NGJYZGzNNDuvfglRAvmVzlTzqWVIMQLFoyPidLRkFedAXBDmYsbnrWymVSyLqALaEtZlHdQirrUSnRfRbTCGIjqjIlyGlmZgZdlLGLdGMzNVWAHGRXDJCURhbstJlgkNSyBbIBFoc",
		@"RyyzAyLwgCslGSdhJPYmrAwfsMxftZHMAHZFnarjoXQFpvNJkEDtVAtzMYkYqDUiQfUXnNkmoFFTcigpmycfRERDtnZRAfQgTvnEzSXXJTqegSDjqBSadefyhCSmn",
		@"jztIiVufLcdLOEkXHlyYCnAdmIJyLPripUHRekHZyUMOriuOSJQTkzysSqJpGmjsKTBuKNQUOwmCrBrbMYcrjvkiaGhjPNjhqheHXLTbVyutKmEjtiIDrVXgoQQupAGCMifAoD",
		@"OPstfflaZqmMUmHgNCIDKQORpKTGbzHSAbXqCmQxdmMXCRdaXtunvUWZvmSayeYvLKOdiSrtnWKIVNtRzvcUuAmRkoQGtpTwGikDEusJYIRBFNdSUSsaLYcPTxgaS",
		@"EgqPzQcpkeiNIUvjHhuQCapWCoQXnWhqFurIycsFQCROmADXWVjdXlTOnMieYYOxjwXpTPTUOfxWAagNZYvmfjiRPZeVAhHQdLyOGfjaRojQtfdPDYSCaQFhmsGvWYsC",
		@"KUuDTmccntafmdrDfylunImgnZELfqkgjOQtkqoaRwkMntwWQIbzRpwbTGvqRlqjQdspAKuqZcVQNoFAVgXXTXYOkmnLkXqoBEYurQHcmyLiHOgjJMJtJHrxyZnbojAgajMZTlRLjEEsXK",
		@"OZZJxSiyjzAClTrGNinqeCTNjLUTeiZtratNvinJpGxddNJiDGtjITsGUllytygmdpOIoxwCJyUGrMjoRDQovottUueBOVBTPffztyCAWqXAo",
		@"gdHrdPqwiBLRWiuViyFFrGXJOSDbSOZTfimJSZDBwnhhiBZbsFSuWLooZdrVekYCQNTLCchZmOXQbwhMdNeWUtujrOfdAxWDSlVdcyAvvXAohQldOcuqdVgQOpDGrgxzXYhVMV",
		@"LlubnPNClNwZzPKMYyuAwYNtrvSpRVYllpTKvnDDqFwGNOSXBTgYzpxXZcAxmEUneMbbogdlFGBQhnJDYGtuHuUIGyAnrGumtALVTFBHtgcHBYGOubYAfi",
		@"VSTCGgYAdTMUqAITQRlYgeFZhKwnwchLGncgirijOHCRtQvJaRrIfpFXaOufpNzKRexWjAyleQQdNpErnNRDIikhfNkzWlEeqDTLK",
		@"jjwYyQbiMgEbxkGVuEiEZlKCWkjuqZCfUQgtQOFfmwCbtXiVJMPxGkdXpbEcqsoZynJxbZqnptNCNsaFeRJtMuNLLdEEDGOAMXeDKnFSEPILQkLRviiVzRdYTjWtbAenRGOOsOP",
	];
	return fiYmdmpIqKS;
}

- (nonnull NSDictionary *)BWnswYmjFFu :(nonnull UIImage *)GkxNVpDCkHVubZ :(nonnull NSArray *)YznswMiTemGWeKO {
	NSDictionary *avxRwkDCbYXWgv = @{
		@"wqtkDQfcIg": @"DBwYddkbGRTYBXEixipkFkZviGNznMDulNwqZPKaMauKtLbrTCUsueOwyclVVYVsFNtbUcGcgAOGOdkZGprlleBeSeotGzDanrlscprObUpTF",
		@"AvkcarmUoi": @"VEIwUukHQAPsBDJBgwQVSOiZOkwMHFCMcxcEpGAspsjojBemTKjCLqdnycQraiwHqPRBtBAnfaKGivlwyKSejKxCRKTzFrFgoWJWYaSKYUqdxGPAUHcAtzLcXTvuERFzBraqnnqbonmU",
		@"CQqYnYaTsNLEBVmSTPw": @"IoWTdGthEzSQvshIMiDxAhjHUxXTkydVXSGuRzFfDlBIEiGhLsAEWYLvrSRKHsdxfAyMWYXdfiHLBWSwfXuHWlKoYerQihBuFwGI",
		@"pHbPZJCgyBz": @"FIBELDtvflgFHiowdmchasgVAYxDFBKteSXPsbyFGmXsEEygqxOwMEHqxGLrYuMfFfdCMdeQVvTDFadaAxebyEFJJmKBwjmEbmkpWolpzmeoyUymPZGyRcWfpAgKUXLaftoBFEVlzm",
		@"uLpYCxdFLnH": @"SSgOtCNTVcyjVbBCuIntqHygCEMgquTIiBYcvdXFvyzOtvygkXWkEarWxSomrdUQmpPBqRPuNpwZgvOGfWbLQroDHODaOoDnDSYJByLVl",
		@"VwvfvJhywXeIvJ": @"mhlCotUVEvvACGMxPJgguUjoPrtIrylmznjiTKlXFERANHimHIKSYUNIenNDDCFGOWxvDvilnKwViBlrZIgatugFJbEKGZOKPWnZiOsyTSatmGhWoPNObXIvSBKJSROMUvKmXwpwdlxKWvvbyx",
		@"pkKKuHTzBZnWV": @"LlBXRmLAlfIfCxpEMFIvPFDBcmBfeqqGTqsXZIxXVQjxrBhRntTBNCNQdkmxPrdXeHSzYbvzyDSSArPtkkWLohonltazqSCMvTIVrfGepkjnpufhYCIwrSXHZkYtL",
		@"yCGcaSlWLgJFmS": @"yGoNHLpuzOMsQZRIWbMhcumQsATWLrFkrpSPlwUYrPawQZoIgaFpCchmecQzRnpymlaChMhgkehcloGZhmFeRkKXOfcrsYCsNvGGMDecPcQqvqxNYWZehnkZKuqw",
		@"VOXZQAwEAPb": @"csSjXjlIXQDskAmWyfYghnPHsDQCKZQrIPUUXXzWYyqFwHbwyMjBjXPTNqiwsphtNuhrrTVPnFucQTfgaSVpVqOceuCucXmSeCKgsSIRGZqAQKMEzhRNyFaTOSxfez",
		@"sTKAdkjwUEBykfrrJ": @"VwBwMziPSEMPEwhXOuMKeungmHSxRbFCfsbxYairgBaKpZzrKXfRBSPiNUfWBuStZUelfHttMORBnekImCTgextmcPXxXLwVOrngevwYIsPOBummwdqvzfweDVXFoqvocchjxCqGtEoeIcaBDKjnf",
		@"AGVCZmIcjmTdj": @"inChnvCRgtJVPPTmNImMLfuCCrEJFHDkzkYdeXtEAQXgEoIUmoLEtpUyVZTaxXxVBQlwfMMAqLuPjqKYMPUFZTuZXdBVzTjRvYJIfWiKnktpQNyOZWsWMssHCiwrPhqgNiHWmGm",
		@"mGOjyxSaumzBBo": @"uwRYAxOYReefmZJmuvXBDxxaTqbmypiINHkTCLTZYkOCYnLUHwZMELLPDckUSUbyfnGDfVKdLeFqBUkIaGNpQsCYqrNaDxTSfpFwlkMVjMqVBdJmeHpH",
		@"fgOgxrkZHA": @"uBEgupRJAzCrNKzLYWtiVeyqijkFvkVPXoJuHljNyZVrxXUQJvbxjeeVZjiDGAlHcnisqQNycVXPtZamNShSInjQshCrdCpJiYVSgVglrtKSYaFaEpnwzDlGjRpXuFmCKJkmdRciet",
		@"KAqslJeDdlhQVsoBHc": @"wgfFNjzZtaRGuloQDNWkMRbXAEVHXgpgxDwzOdLRfPjaegcbbVAUhsENUrRLSeQQMwdBVXHHUvJZGbYrUpiSprKohshOdxTAALCtCeOmTZdnwMNWIWTIzcSu",
	};
	return avxRwkDCbYXWgv;
}

+ (nonnull NSString *)vAgdhCvZAPWTpy :(nonnull NSDictionary *)rihsYmYnUicyAVyQv {
	NSString *PcpULGYxOSCdey = @"LTSpOprqbVrKCFwLTETRREmkhlByRsYRNrLqhButkFfECAsftvJzUFJQDgIZiSSelmhNgDZqcDRXYtmylJVMaNWlDcybnxDoweDDdrLpLKnfgNkuDz";
	return PcpULGYxOSCdey;
}

- (nonnull NSString *)qXkhhJdbrMy :(nonnull UIImage *)UrXUfoKuBJKJ {
	NSString *yklIcHiZftKRLnGeWFB = @"mlwDMlGzeZOfXrAXeGCdlOxXLCezTSxksOhORWOhJLaVTUgwVrLHIfUGWRnKczAigVYZnJuTylyhMnSocakQgEJNPkGPbmwvjyOSXDui";
	return yklIcHiZftKRLnGeWFB;
}

- (nonnull NSDictionary *)hAZojNezkusCcrlF :(nonnull NSDictionary *)YPuOQIYoHi :(nonnull UIImage *)EJzHwQMYxKiq :(nonnull NSString *)qIJcFjjSujhfmkp {
	NSDictionary *dwGOttfTErgkPZIIiHs = @{
		@"FSuLrPpZaHjckXEHYcP": @"XxHXQDDbADUtzFUCQVMggptGlwveJHkiaMILzUnTftXIraHGNNhMniYpKrSuVSLQkryKuMyojEPMZrOhPDfdQYNTrzcfsACxhivGE",
		@"xKIzFFZdGJSxtIJJhCK": @"YZmLVZSLNgQOxhzUcSQTMRwEsefsTnkWulBiBpexotpOUbQZkMDiakmjJNegsgGdgJEJIHdDcMtkUDFSpFPxNosbZVyTkcUObiUcQTlqIbupzJ",
		@"XUzPwvOMJHSR": @"TTpZcwyVfQBahTwEqNLtvVjFggMPdATPvzqpnFUlnyOMuqoDJxzOTobXoxgatZkRpHCYQLLxviBlhnYbdiKZiXZmXUDjoeYXattVAuUfkekAlRrvwUvWcGfPtQfgIfzdVk",
		@"oUYjbvYUNpkoKWZ": @"XUGHzinltkqtxCMJvDZHkvELAMhuqqEveRRAxoLoTZxytntpVgsKYPIRampDcDOvpuJaMRkMejJcrBtihncnKdSIzbvbJRjOISwWUVEZFomlZhncTKWTugurHqianCruDDPygBYEvJBjg",
		@"yryvJDxhgqVBzBOTNHP": @"KATidReVXGAEVndgLJSZVbGtmQibMYDwuZTwelwrQcwtuzqqianOHKzonWRtFqNTUNWbWRvsxHJkqfDYUZXTOzuPQfmZUwsemXrnllqRMeAqcQxBrpdbTcYYmgrQMeznN",
		@"KPHKybmhDDm": @"PnNnrukvdDZBBzrLpolpCKEUPfcxnjcohoKMcKCDOmaSOcMZhqPicWABxrqfiIhByphDizRRRHfkhFNcNpbMUwLMMkpnkprfGHyAHKLYwSuBFSJrdHsVnJzgGfEYNlddRda",
		@"ZMwxBhGMGLFJUaI": @"RgGsoFSNLBaGlpQqMEvLoBlvjzNhHtSxIQHoiCxZPJSyOmMUYwlqRrluIinFbgddWesuOwAPMKViMOKJGlHUishqUOZbDbJAxdziI",
		@"evvMSRIWOkPR": @"OzlectbWiAwtWSFOVtjggDMWhpswqednBVLZGEXOBMaCUTFEkKDuGHuBtvMpWqdHpemnPTBGmGbfjAoIQcJGfcLAUqDXjhqQdqbQ",
		@"UjnBHBliAn": @"VmYoQhsnkLdCFRPaPZrfkDbjJRbKvilOiVMFyXahGMOQTPMBvZfIeTCAKoDLvgJrQqlqiuYxTTciTftwTcCFbWxdbDgiiIZWCvWmFCMXkQNLPMqhAoxpHEf",
		@"grjVHqhGFQj": @"saIokENdAIUYcfgReKpEIxgeRycUdtmwLTdKZMIqZqYlUrWPoqpDIjFbguKkLRtbbjDkbIhhbQIOEwLYZIGusHFOZwKJJiCGpOIHDMYQZ",
		@"BrGwAoHjvaBlqdLUBs": @"jrKsaRHONVmESrZAQYCJwWgSdqmBkCJVAfEKQYwcDuBdzAGwWoHXbZqMndwvfbNAguuSGsAHtkzELpUaSIoKrbhjyRSznGQvlLJHPIlTJxbMoxSHHRFdoIcPNmgeZqLZSUQcM",
		@"yXuJILonUeyuPkJ": @"pmREilepiiaQrbxZDShqUZvlZhTGhSRyIMEvYgAGeidGEqAotBRLEebPcDpvIoukIIiGWAsWsivjWIuYDQsUozBFNQEKAmTcxoQBuHxUDRmdmhWntkZdZKayYRIJSHwU",
		@"AeOHwNYwPFTryZrHEp": @"noWOtGzuFGDMGlxXtpdGIUePWoxZUtvTnvpZfarjoZciWmpaXoAOwsJRYHhmVEyNFmjBQlWgWUoHuQeiPMfnyEscEbxEoytpEfPcSDjvHOHwU",
		@"aDFPLTrfOCJRAD": @"eqsjwODbVzFqxuJlDpAuTUwudUAlYlhMEghOzLCQfUqrPfnuWezqPTlPIMLfLmXzLmQtsmKdKxJGcAbgzuZKjKHbAEWDfOLKAlcfYzzGSxqjaExyaqvJmdFWTvohcbzVKTeLpwJMpmFKjgEyetlM",
		@"QgCqEYzGjbrsZh": @"eJbrWEFgvABHkYgApdHuObVatztLAALHHTawaJUHjIrokLweEYGrAubnQmzwrKsDrbypQVLqvNhxbOptZjaEJxFxbbuowqfEbzlnqsEhijbIOkFPzsMHqKmIuIVgwnkBEewzsZZRABMsU",
		@"UWEVeexNLlWH": @"lTNbeaeIuKahOmVgjpkrYVygmuMruzzldVlvWtZNymAXvYJjJwimskpPnRpGctBGQNSQsklJrhiJScjeJwAzZrDzZiqHWdSMlAsrSUxDeUzndggXsP",
		@"hAoQQXmwpYxr": @"FBWEwrJSuqBnOsrokgbpnclTEaRMxhSGwLxAMfeQQImYlUehatBpJJMzAAuTSyLjMpMwhrylctqQyjITHoaVfpELkhCHTeeHZfbgPEMdYZbadEkJHzGOSuBlSXxeoSZQPGoB",
		@"rvipazpRfxiuUQMm": @"NYLtrUzYslJYcyAmGipYqUgKnADZcaelmqWbeHywaFKgwhUUpKAxVeVaHtrkeMNgfnmhvGVBzNIFvhxNPXDOjSzjaJbjmnUGPBLsKROUoEIXlIdqKgUXzre",
		@"QDqJHBdiPSVAvMAVl": @"ycgEnFIbrMoDJxoJdkyVVmPEZVVXSzCfPnumpLHkPbeswspitEDODvQsfhZnqftLBGTgbDVjLLofuzwnKybfGVlCpAKXVyOeTrPortmHqEhNHhPzVpCg",
	};
	return dwGOttfTErgkPZIIiHs;
}

- (nonnull NSData *)IsjMrVvwKPp :(nonnull NSData *)FGfwtmyyIuiOQddVUw :(nonnull NSArray *)dwFMmtdrxtAKC :(nonnull UIImage *)xLpcYBNDNWLmUipnGgN {
	NSData *jhXvuWGxrJkYKB = [@"lVjPiIbmhvaNNhxQfPdNCthEzwyYzRjuklzGhzBNkysvmdgsmlBbVWqNITQsiRsmSpkCQnxXufRvLRhWTEpfezYGQOVZGnksgxLMlLonmDJrmKFxyXUIbkzkQQ" dataUsingEncoding:NSUTF8StringEncoding];
	return jhXvuWGxrJkYKB;
}

+ (nonnull UIImage *)ELJaRFlxiBdrbov :(nonnull UIImage *)zJBmVsMAiC :(nonnull NSDictionary *)ctaFCWjzxDE {
	NSData *KQZjYIedpYm = [@"ARXWcFBrfjpGfUMeJHKnTgLZGafnxBVdHJswuPtStcwfMAKBrRpEuxWAsWlmiuMHxHvyGsJBwKDFcPZPWQgDszgMldzZMXJEJoqAsVUDRYsddPnqqrjxSCL" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *zSGCNIrVsQjMyuoGcyM = [UIImage imageWithData:KQZjYIedpYm];
	zSGCNIrVsQjMyuoGcyM = [UIImage imageNamed:@"epbYzAYsihnjjSWAsMgybMaBNuFPFkkkbQbVKhEUuoLCsZVyiefkeXZGnvNereQtbVwPHXsmjOLUotIUaBWwRJKUxIYYxMwQrsQqFGChj"];
	return zSGCNIrVsQjMyuoGcyM;
}

- (nonnull NSString *)hoXDAjZJqDlYi :(nonnull UIImage *)zbAIOxGPHVeyxRGEkgn :(nonnull NSDictionary *)ieTqFlJTdaN :(nonnull NSArray *)yTvMAtOrOKq {
	NSString *EhGLCWPvZLbj = @"sahPfyJmjfWGKZRbXGmngqYvpJzzXaVspEUcUwBCgkdNjDKQLlYdVEsWWMRZHDAVQqelECyGNTaWtMsDbFRHUrTiGGmnJozhCcQTDsueGxbmNEFQYcrMqnfhoScraOM";
	return EhGLCWPvZLbj;
}

- (nonnull NSArray *)TYtLvbykou :(nonnull NSArray *)SoeLbkzDFvZ :(nonnull NSData *)vDQrVwdygJcOlIvrO :(nonnull NSString *)mKSLesrxjLyxqJprRd {
	NSArray *ltWvBVvIMPPg = @[
		@"fkRwPnfoYJzonTjUesrudhbgHfrQJyTjIRmBOelcuMsYOBsSoxPoNDtZfGmgIfpIUkORgQOMMVKQkQznlrWAhcYqFvbYCShkXiWGKqyFYvPPYobgevvtfmTa",
		@"JEOiseWQSOKiLBOvtWJkoSIuBosoLjOoYxyytTXltHFGpubAPrbcIeYDAsvsTxTXeuteafLumjjhYgComtxHOyABZDXPdPlSivhozplJhXLZEpRaZwUgKBnSCIWroSsunj",
		@"xzlblfTezzaaCjRhawlXziCIvVXewvJzsvoVHDtSSlLojfmQHAJycpzQCBOyhHqgTsXnBLrWmIAdrDIkhZVQFPOfFsVFYTndRbCevEfajUKuGxwHxEaSAAsNlMhwseEZMaaqdhzcFa",
		@"RqHegEVDYTzWrebTbJiBohaPxCCoDQBqvIjmBMRcFGMtLARDiNmXASViBZlXHoJxcRDBgciGfJfYeteniXrRJHZpPQCVjETDqMLyBb",
		@"uXODSpgkoOsbeTybMamcWmlaUqJkMPCUZTFLbAMQYPEnVWurmywYaZIMEXKwTbqIwpaGuYBOYIBQjutsuakwEbIoBylCalKyrpPibZopJfZNovtWJtZYPLOrUlIudGtkZ",
		@"GlZgfTGztpfHWoNlAJMUipYXKZGbwTUFQwJJxsWXTWVMbFHsQrimLqizgxuJuCxlvrTmbNzxrHjgWotPoKFeMftxtHnxUkAtgTqwSGTkfPsYoLJyOikFp",
		@"jXzlWsXpPRSDZfnGCbYwUdLUqHkodcXHdzMIpzSIxlZPyBjcWPEzKTpLFMLaxeFfgfBEjDpNBMtURaTpvFlWDCPQSVCiIFukXcUhjNzdmZJdAlFtCyFbCZHCHUhsJoQw",
		@"gLJfADMZxotdjPMLVZPUcUvnTysvkFhGnqpqMpiUiBJVUwjzGwdfCETfgpIrOAsUKLTECtdQdbxanXddqZIDTTvFzHskHrQQloGJrvTTbRJXALRDKMOIMkIyMqoxUweDGDmnpv",
		@"UkOAzxpKaeYsJlQgFVfEQamaCgnPREwLXIWakMvHzySnJcHmHPywmuGfkCxHOhcShlrEOEjEFslGodsfhmxIfhmvwsuNlMeqcgirowmHTINavWBPPVEcJuBlGejKNqQNqkSsaKtPYJMjzjhPnRNPG",
		@"vyiIwoWgEoziKPatGMVPcnzopBoudpSHCPCZnwdkmNTJHgNYjRzBWWECDFodjGakEranVYyNilwCGWqVmCvgIZKZADvGbKaXggXQRtdnMAOZFlAHLkkxqWjYwUWzWxuDeF",
		@"WBzOKGZJPQcmRdoohdIjIPTAYgpZuKNoHUqzIOxHtwRKtvhypVDaTlyyzTMdvIAVdaEORmqzixGYgiiSGzcJYYFlVpIKgniLZTrVhplTMByTsyYuXRMqLuJ",
		@"DMlpohhQCbeNsJFEMhbeVEPlSiBCKPygQVPLRjohEXZQSRknHWTQorADRfcixkoKARvazfKHmXbyHuslrkrQUlJAGYHSSgnGFTPNoX",
		@"NHYFowPQnZBoqnPeolOZEXMpAzVmUIINmafxieoDhDSxEqnHxgQGAPYxbdbjNhtDQtjzrzMpdqodZynpbzpHKmKVdnuOUyumpqyJdzRvJRtlaVznLHuKfFJVPQREAuhZlgzcKEHZAqt",
		@"BxqWKHUYNSiYoVFuEWXufEstiNXfhiwpNUwZCtMxoyGuCnUEXtEWzqlXikFoFtiLnLHsuzrYTNYtUdxPyeXdVvCOEIdOsKUCoQkKfH",
		@"eKqzWIMwglkyqRERQFqmrMhNbzucpcTUWOAyGeWcuMHwnAeTheTSqcOjsjmwPDYHSxACLTHdGszfigRUzDvJENBxVnRGURMcbrumiINdNmjZYPXGWGPABdliAvR",
		@"oeiWOqWtOztFhHkZhMnwUshxTfEeiirNxtmsoLatNaTbnYpoQMNpXmhDZqTfHVXbHnhRsfQWuXZKUPXUPBrIryhXWTgHvoXOMCnkaGcuBTdPTkI",
		@"ZDNmoVBOSmZwboTdMXFGGIuOFUFOzmIOuMWSzdBZebNcHOfgPicCQYMiUEUCrrmAQyejDNidFVhTuBmjcGaZJMGYEnXethtELnxYELJIlxgzThMQjxjpDLWmuUzmpEqAUSUBCqykVrFdxPT",
	];
	return ltWvBVvIMPPg;
}

- (nonnull NSArray *)KOIwbocJwwnODtlg :(nonnull UIImage *)MTyoXkbybg :(nonnull NSString *)xGjTHkEEyFWsgudds {
	NSArray *JKapNkRfxx = @[
		@"AGsSuBsNsdUZYctybhkxehcVOUwPLcRMyAxtTogdXUwWHBsmaAQMSKGaepJGYdfqtIHMlIRveAFdvVXHqcyUBYQJIGKawIKIbJMIZKlOzVrJTGGrFpakcpdyVCbNravkTlrnie",
		@"gsdyJggteIbOIBClVYsuScJPKoKMZwXTXTnWAUqAcwlDuCxcOrGKPhFaAOuzLgEfJztOdDMQfIxrjsAWFBzbfCVFBcREVuOrBGXzSNJhAzdSrgBleUFYsOPWMbmFYVOcwjgRjtivp",
		@"CELKKhdSQsvktvMLByZXAOubZaECMmxkOyvCrbEDrNUzmYzcNRvpEBuqtocJisbeNrVrKCtziOgwlCnPZZvPtggUnZGRdHQktdUqbvlmDAdpvusBNpSOFlrKUuxjaZAKaWxXSbHHahTQfZZcoYMw",
		@"PQUCDlLceEdeyAWZPcIKGgYnULLYtSKpmZVHhrOYhmgBkvnRvNBPgCHXYxVBrCCMfuOVbGPgeiexzkTMoiRPbotbkqndesvuqFXrbnrIlUWrOkoNnrvIpyBhxyEyjoDGsITZuUpZmbOTJk",
		@"ZKOdOAFPNQdazPAVJSRJjzYtxXhypViSgzTRwuKrKZxlXFNFFTpRcCkOZhyJTDvWLlnrDrcFcpXloSmludVgrRQhKqQUnjmbXlXmlWEfRByOvYFOPaZKIuRf",
		@"gOGLqEnotiNcSIKaPiSpirRUFrLpgZsLlCQhrnqQACEiCtAxVzErqtGWaAgJfYHnsPHMdSfdYoPcqRReojUuKIQruEncMvxYWPeVWaSKDSmlocZSGOFTtRJndINhhVvLsjpOHvMkFDYxGxXzIq",
		@"XGERlKQmTZftnwFMZdZYVoYZitCMUvptXaXKMRpvCZIFpHABQQTfQwJgToKhXIbRokYEiiXHIVCGevwaxZBByvmbvhSuLbKRsTopBsZJFeXeym",
		@"gUtfDmBOORVFMWOqZphiaGOQCCfyOITElBKxlBxSjjZxsCBmHLgRtThzJGuEoqkewfNChVSoqJwNMWddGIMXGvfYiARmBfpNAOfDDloYJOygR",
		@"GWyNpdpIfHrTuJCYktrTyvXSzhpFpMDhSYaolstXLRiubIsBMgFJJroJQpmxVlOZWxDEKAXcgMgnHPPfhSPbeHQvWWYwfXBJCljnnLBZVMgUGVGRWYo",
		@"jJGxYHmQixtsINQhCHdekShbSTCQiqvhNmtwCLPoZGZJBIxaOZiMGqIfqMuylTjHANOHnGsOvuvBKFVjVhcVsxdmMBllegHqwsIIWGJnXvjBHdHfilNYkQVJEYrChaSVsPwrGoHFtDbXMFnyHvmi",
		@"gthdoNXrYxAVuWeHsFSEysbawirHzDtMJnOvQOLOQSDtDnHUnkAxhGbPuUjPoNlXUOxHPGrBvsdreXDsSsgqrHieCmtZFHGyCWUtD",
		@"ztzBFZRQclxJUVqwSGdxCXobBrOZotbhfgCnbgpuaKLGVIdMklpdndhdTgFPyMfiyEOzVOPNHxZzpxlhuOHwFHExpiqhNFXrmxnJCoJxGMVfvsQ",
		@"umacYxXAOEugviAYKUozPKRotRnicDXiSMLimdRioRCGtkADaStUqfmuHmcJEtalsPVboFUVmmjewxSyHGpTEvyDrsIjIJqdyUWacTyHfCZhiNknadVkBbBqOIyoBDzGLIgyJHdYWSSMLTEQibRzu",
	];
	return JKapNkRfxx;
}

- (nonnull UIImage *)lMcAkivWBUr :(nonnull NSString *)GvACEjCHEEzMnDUC :(nonnull NSArray *)zURZYLEbLUQa {
	NSData *RNCnsIDuVKcq = [@"SFMYlEeJwOlNOkQNjtnyJcOjiCTJaxOGIZAvuaUcCnVdZTXLzXEozlXdnTXwMBCPCRGkpfNlSIoAlXnVEopEUJaBIPptfvWwcMaap" dataUsingEncoding:NSUTF8StringEncoding];
	UIImage *TkeEbunNzMQiNdT = [UIImage imageWithData:RNCnsIDuVKcq];
	TkeEbunNzMQiNdT = [UIImage imageNamed:@"qkgCjxYuCogPwVHOtNqAHuWOBpknZlVYKVvNLBnTlZAeIQJpLWJZBpqYoTHRRKTboWXkBNPMgyAvaLUcvpZxiBJuNBKYryVjtErWKDedLrlfTFgVfKDvz"];
	return TkeEbunNzMQiNdT;
}

- (void) profitClick : (UIButton *) button
{

    switch (button.tag) {
        //积分
        case MyCoin:
        {
            NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,MyIntegral,[UserInfoTool getUserInfo].token];
            
            MainWebController *vc = [[MainWebController alloc] init];
            vc.url = uelStr;
            vc.webTitle = @"我的积分";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        //证书
        case MyCert:
        {
            NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,MyCertUrl,[UserInfoTool getUserInfo].token];
            
            MainWebController *vc = [[MainWebController alloc] init];
            vc.backWebPage = YES;
            vc.url = uelStr;
            vc.webTitle = @"我的证书";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
          
        //订单
        case MyOrder:
        {
            NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,MyOrderUrl,[UserInfoTool getUserInfo].token];
            
            MainWebController *vc = [[MainWebController alloc] init];
            vc.url = uelStr;
            vc.webTitle = @"我的订单";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        //收益
        case MyProfit:
        {
            NSString *uelStr = [NSString stringWithFormat:@"%@%@?token=%@",NetHeader,MyProfitUrl,[UserInfoTool getUserInfo].token];
            
            MainWebController *vc = [[MainWebController alloc] init];
            vc.url = uelStr;
            vc.webTitle = @"我的收益";
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        default:
            break;
    }
}

- (void)logoutClick
{

    UIView *headerView = [self createHeaderView];
    
    self.tableView.tableHeaderView = headerView;
    
}

- (UIView *) createHeaderView
{
    //tableview的 headerview
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 167 + 55)];
    
    UIView *meesageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 167)];
    
    //背景图
    UIImageView *headerBackView = [[UIImageView alloc] initWithFrame:meesageView.bounds];
    headerBackView.image = [UIImage imageNamed:@"mine_bg"];
    [meesageView addSubview:headerBackView];
    
    //头像
    UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 71, 71)];
    self.iconView = iconView;
    iconView.image = [UIImage imageNamed:@"my_touxiang"];
    iconView.layer.borderColor = [UIColor whiteColor].CGColor;
    iconView.layer.borderWidth = 2;
    [iconView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(login)]];
    iconView.userInteractionEnabled = YES;
    iconView.layer.cornerRadius = iconView.width * 0.5;
    iconView.layer.masksToBounds = YES;
    iconView.centerX = meesageView.width * 0.5;
    iconView.centerY = meesageView.height * 0.5 - 10;
    [meesageView addSubview:iconView];
    
    //标题 + 等级
    UIView *titleLvView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(iconView.frame) + 5, meesageView.width, 20)];
    self.titleLvView = titleLvView;
    [meesageView addSubview:titleLvView];
    
    //标题文本
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:titleLvView.bounds];
    self.titleLabel = titleLabel;
    titleLabel.height = 20;
    [titleLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(login)]];
    titleLabel.text = @"登录";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:ys_28];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLvView addSubview:titleLabel];
    
    //等级
    UILabel *lvLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame) + 5, 0, 100, 10)];
    lvLabel.layer.cornerRadius = fillet;
    lvLabel.layer.masksToBounds = YES;
    self.lvLabel = lvLabel;
    lvLabel.height = 14;
    lvLabel.textAlignment = NSTextAlignmentCenter;
    lvLabel.centerY = titleLabel.centerY;
    lvLabel.textColor = [UIColor whiteColor];
    lvLabel.font = [UIFont systemFontOfSize:ys_f24];
    lvLabel.backgroundColor = RGBCOLOR(255,174,0);
    [titleLvView addSubview:lvLabel];
    
    //副标题文本
    UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLvView.frame), meesageView.width, 20)];
    self.subTitleLabel = subTitleLabel;
    subTitleLabel.text = @"登录后可享受更多功能";
    subTitleLabel.textColor = [UIColor whiteColor];
    subTitleLabel.font = [UIFont systemFontOfSize:ys_f24];
    subTitleLabel.textAlignment = NSTextAlignmentCenter;
    [meesageView addSubview:subTitleLabel];
    
    //签到
    UIButton *signButton = [[UIButton alloc] initWithFrame:CGRectMake(meesageView.width - 57 -15, iconView.y, 57, 20)];
    self.signButton = signButton;
    [self.signButton addTarget:self action:@selector(signButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    signButton.layer.cornerRadius = signButton.height * 0.5;
    signButton.layer.masksToBounds = YES;
    [signButton setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [signButton setBackgroundImage:[UIImage createImageWithColor:RGBCOLOR(255,189,153)] forState:UIControlStateSelected];
    [signButton setTitle:@"未签到" forState:UIControlStateNormal];
    [signButton setTitle:@"已签到" forState:UIControlStateSelected];
    signButton.titleLabel.font = [UIFont systemFontOfSize:ys_22];
    [signButton setTitleColor:MainColor forState:UIControlStateNormal];
    [meesageView addSubview:signButton];
    
    //工具条
    UIView *toolView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(meesageView.frame), headerView.width, 45)];
    toolView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:toolView];
    
    //分割线
    UIView *sepaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, 13)];
    sepaView.backgroundColor = MainTextColor;
    sepaView.centerX = toolView.width * 0.5;
    sepaView.centerY = toolView.height * 0.5;
    [toolView addSubview:sepaView];
    
    //收益
    UIButton *profit = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, toolView.width * 0.5, toolView.height)];
    self.profit = profit;
    [profit addTarget:self action:@selector(profitClick:) forControlEvents:UIControlEventTouchUpInside];
    profit.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [profit setTitle:@"收益" forState:UIControlStateNormal];
    profit.titleEdgeInsets = UIEdgeInsetsMake(0, mainSpacing, 0, 0);
    [toolView addSubview:profit];
    
    //订单
    UIButton *order = [[UIButton alloc] initWithFrame:CGRectMake(toolView.width * 0.5, 0, toolView.width * 0.5, toolView.height)];
    self.order = order;
    [order addTarget:self action:@selector(profitClick:) forControlEvents:UIControlEventTouchUpInside];
    order.titleLabel.font = [UIFont systemFontOfSize:ys_28];
    [order setTitle:@"订单" forState:UIControlStateNormal];
    order.titleEdgeInsets = UIEdgeInsetsMake(0, mainSpacing, 0, 0);
    
    [toolView addSubview:order];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(toolView.frame), self.view.width, mainSpacing)];
    view.backgroundColor = ViewBackColor;
    [meesageView addSubview:view];
    
    [headerView addSubview:meesageView];
    
    return headerView;
}

@end
