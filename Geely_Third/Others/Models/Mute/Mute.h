//
//  Mute.h
//  Request
//
//  Created by haigui on 16/10/25.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 type :
 
 1菜单
 2返回
 3左
 4右
 5上
 6下
 
 */
@interface Mute : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber *index;

//0 正常 1 仪表  2 菜单
@property (nonatomic, strong) NSNumber *state;
//0 无 1打开
@property (nonatomic, strong) NSNumber *menuState;
@property (nonatomic, strong) NSNumber *menuIndex;
@property (nonatomic, strong) NSNumber *settingIndex;

@end
