//
//  UploadListController.h
//  MoveSchool
//
//  Created by edz on 2018/1/5.
//

#import <UIKit/UIKit.h>
@class VideoModel;

@interface UploadListController : UIViewController

//音频地址
@property (nonatomic, copy) NSString *videoPath;

@property (nonatomic, strong) VideoModel *model;

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, copy) NSString *titles;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) NSMutableArray *datas;


@end
