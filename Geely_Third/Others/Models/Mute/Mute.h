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
@property (nonatomic, strong) NSNumber *state;

@end
