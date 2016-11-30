//
//  SingleModel.h
//  RepeaceFriends
//
//  Created by WillyZhao on 16/8/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainRequest.h"
#import "Mute.h"
#import "GeelyLeftContainsTableViewCell.h"
#import "Car.h"
//#import "GeelySildeBarView.h"

typedef enum {
    RED,
    BLUE,
    GOLD
}DisplayType;

@interface SingleModel : NSObject

@property (nonatomic, assign) BOOL isDisplay;

@property (nonatomic, strong) Mute *muteSingle;

//@property (nonatomic, strong) GeelySildeBarView *dynamicSingleView;

@property (nonatomic, strong) Car *carSingle;

@property (nonatomic, strong) MainRequest *currentRequest;

@property (nonatomic , assign) NSInteger carState;

@property (nonatomic, strong) GeelyLeftContainsTableViewCell *oldCell;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIView *didView;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) NSIndexPath *indexPathHome;

@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, strong) NSMutableArray *arr_data;

@property (nonatomic, copy) NSString *checkString;

//保存多选部分选取的indexPath
@property (nonatomic, strong) NSMutableArray *indexPaths;

@property (nonatomic, strong) NSArray *cellImages;


@property (nonatomic, assign) BOOL isMusic;

@property (nonatomic, assign) BOOL isRel;

@property (nonatomic, assign) NSInteger dataCount;

@property (nonatomic, assign) NSInteger index_cellImage;

@property (nonatomic ,assign)DisplayType displayType;

-(MainRequest *)singleMainRequest:(NSString *)request type_value:(NSNumber *)value;

+(instancetype)sharedInstance;

@property (nonatomic, strong) NSMutableArray *dynamicViews;

@property (nonatomic, strong) NSMutableArray *dynamicViews1;


@property (nonatomic, strong) NSMutableArray *dynamicViews2;

/**
 以下为单例保存icon的选中状态
 */

@property (nonatomic, strong) NSMutableArray *iconDataArr;

@property (nonatomic, strong) NSArray *iconData_Image;

@property (nonatomic, strong) NSMutableArray *iconIndexArray;

@property (nonatomic, assign) BOOL bluetooth;


/**
 以下为空调方面帧动画数据源
 */

@property (nonatomic, strong) NSMutableArray *image_level_one;

@property (nonatomic, strong) NSMutableArray *image_level_two;

@property (nonatomic, strong) NSMutableArray *image_level_three;;

@property (nonatomic, strong) NSMutableArray *image_level_four;

@property (nonatomic, strong) NSMutableArray *image_level_five;

@property (nonatomic, strong) NSMutableArray *image_level_six;

@property (nonatomic, strong) NSMutableArray *image_level_seven;

@property (nonatomic, strong) NSMutableArray *image_level_eight;

@property (nonatomic, strong) GeelyLeftFrameDynamicView *currentDynamic;

//-(void)dynamicAnimationView:(GeelyLeftFrameDynamicView *)

@end
