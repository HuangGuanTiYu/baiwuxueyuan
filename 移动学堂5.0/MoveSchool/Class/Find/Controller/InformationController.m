//
//  InformationController.m
//  MoveSchool
//
//  Created by edz on 2017/8/21.
//
//

#import "InformationController.h"
#import "InformationListController.h"
#import "FindClassifyModel.h"

@interface InformationController ()

@end

@implementation InformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置buttonBarView属性 选中文字变大 文字颜色
    [self setButtonBarView];
    
    self.title = @"资讯";
}


- (void) setButtonBarView
{
    self.isProgressiveIndicator = YES;
    
    self.changeCurrentIndexProgressiveBlock = ^void(XLButtonBarViewCell *oldCell, XLButtonBarViewCell *newCell, CGFloat progressPercentage, BOOL changeCurrentIndex, BOOL animated){
        if (changeCurrentIndex) {
            [oldCell.label setTextColor:AuxiliaryColor];
            [newCell.label setTextColor:MainColor];
            
            if (animated) {
                [UIView animateWithDuration:0.1
                                 animations:^(){
                                     oldCell.label.font = [UIFont systemFontOfSize:14];
                                     newCell.label.font = [UIFont systemFontOfSize:14];
                                     
                                 }
                                 completion:nil];
            }
            else{
                oldCell.label.font = [UIFont systemFontOfSize:14];
                newCell.label.font = [UIFont systemFontOfSize:14];
            }
        }
    };
}

-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController
{
    self.buttonBarView.shouldCellsFillAvailableWidth = YES;
    self.buttonBarView.backgroundColor = [UIColor whiteColor];
    self.buttonBarView.selectedBarAlignment = XLSelectedBarAlignmentCenter;
    
    NSMutableArray *childVcArray = [NSMutableArray array];
        
    for (FindClassifyModel *model in self.classifys) {
        
        InformationListController *study = [[InformationListController alloc] init];
        study.ID = model.ID;
        study.studyTitle = model.name;
        [childVcArray addObject:study];
    }

    
    return childVcArray;
}


@end
