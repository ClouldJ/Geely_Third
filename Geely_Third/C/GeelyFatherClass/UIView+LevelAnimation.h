//
//  UIView+LevelAnimation.h
//  Geely_Third
//
//  Created by WillyZhao on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^AnimationBlock)();
typedef void (^AnimationCompletedBlock)();
@interface UIView (LevelAnimation)
-(void)geelyContentViewFrameAnimation:(AnimationBlock)block successful:(AnimationCompletedBlock)success;

-(void)geelyContentViewDismiss:(AnimationBlock)running successful:(AnimationCompletedBlock)compelete;

-(void)resumeGeelyContentViewFrame;

-(void)geelyAirborneViewAnimation:(AnimationBlock)block;

@end
