//
//  courseBean.h
//  MoveSchool
//
//  Created by edz on 2017/8/28.
//
//

#import <Foundation/Foundation.h>

@interface CourseBean : NSObject

@property (nonatomic, copy) NSString *courseid;

@property (nonatomic, copy) NSString *mainid;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *title; //课程名

@property (nonatomic, copy) NSString *learnNum;//评论数

@property (nonatomic, copy) NSString *duration;//课程时长

@property (nonatomic, copy) NSString *showDuration;//课程时长

@property (nonatomic, copy) NSString *progress;//学习进度

@property (nonatomic, copy) NSString *desc;//课程描述

@property (nonatomic, assign) int format; ////课程格式 0 cc video 1 pdf 2 ztt video 4 h5课程

@property (nonatomic, copy) NSString *ccid;

@property (nonatomic, copy) NSString *isFavorited; //是否被收藏，0未收藏，1收藏

@property (nonatomic, strong) NSDictionary *priceView;

@property (nonatomic, assign) int cur_duration;

@end
