//
//  SpecialDetailModel.h
//  MoveSchool
//
//  Created by edz on 2017/10/24.
//
//

#import <Foundation/Foundation.h>

@interface SpecialDetailModel : NSObject

@property(nonatomic,copy) NSString *title;

@property(nonatomic,assign) int businessid;

@property(nonatomic,copy) NSString *image;

@property(nonatomic,copy) NSString *desc;

@property(nonatomic,copy) NSString *learnNum;

@property(nonatomic,assign) int isfavorited; //0未收藏，1已收藏


@end
