//
//  SingleModel.h
//  RepeaceFriends
//
//  Created by WillyZhao on 16/8/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Mute.h"
#import "GeelyLeftContainsTableViewCell.h"


typedef enum {
    RED,
    BLUE,
    GOLD
}DisplayType;

@interface SingleModel : NSObject

@property (nonatomic, strong) Mute *muteSingle;

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



+(instancetype)sharedInstance;

@end
