//
//  InformationListController.h
//  MoveSchool
//
//  Created by edz on 2017/8/21.
//
//

#import <UIKit/UIKit.h>
#import "XLPagerTabStripViewController.h"
#import "XLPhotoBrowser.h"

@interface InformationListController : UIViewController<XLPagerTabStripChildItem,XLPhotoBrowserDelegate, XLPhotoBrowserDatasource>

@property(nonatomic, copy) NSString *studyTitle;

@property(nonatomic,copy) NSString *ID;

@end
