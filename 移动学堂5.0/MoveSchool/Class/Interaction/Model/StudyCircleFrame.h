//
//  StudyCircleFrame.h
//  MoveSchool
//
//  Created by edz on 2017/5/8.
//
//

#import <Foundation/Foundation.h>
@class StudyCircleModel;

@interface StudyCircleFrame : NSObject<NSCoding>

//数据model
@property(nonatomic, strong) StudyCircleModel *studyCircleModel;

//头像
@property(nonatomic, assign) CGRect headerFrame;

//名字
@property(nonatomic, assign) CGRect nameFrame;

//文字内容
@property(nonatomic, assign) CGRect contentFrame;

//图片 (1~9 张)
@property(nonatomic, assign) CGRect imagesFrame;

//每张图片的Frame
@property(nonatomic, assign) CGRect oneImageFrame;

//分享出来的 标题
@property(nonatomic, assign) CGRect titleFrame;

//全文
@property(nonatomic, assign) CGRect allFrame;

//课程或者沙龙 描述
@property(nonatomic, assign) CGRect describeFrame;

//时间
@property(nonatomic, assign) CGRect timeFrame;


//评论 + 赞 区
@property(nonatomic, assign) CGRect commentViewFrame;

//赞列表 Frame
@property(nonatomic, assign) CGRect praiseListFrame;

//评论 Frame数组
@property(nonatomic, strong) NSMutableArray *commentsF;

//cell高度
@property(nonatomic, assign) CGFloat cellHeight;

//是否大于6行
@property(nonatomic, assign) BOOL isMoreThanSix;

//刷新数据
- (void) reloadData;

//是否需要 全部展示
@property(nonatomic, assign) BOOL needShowAllContent;

//cell分割线
@property(nonatomic, assign) CGRect cellSepaViewFrame;

//赞列表 富文本
@property(nonatomic, copy) NSMutableAttributedString *praiseAttribute;

//删除按钮
@property(nonatomic, assign) CGRect deleteFrame;

//评论按钮
@property(nonatomic, assign) CGRect commentFrame;

//点赞按钮
@property(nonatomic, assign) CGRect goodFrame;

//中间分割线
@property(nonatomic, assign) CGRect centerSepaViewFrame;

//查看全部评论
@property(nonatomic, assign) CGRect lookAllCommentFrame;

@property (nonatomic, strong) UIImage *image;

@end
