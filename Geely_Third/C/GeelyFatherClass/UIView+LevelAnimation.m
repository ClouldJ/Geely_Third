//
//  UIView+LevelAnimation.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "UIView+LevelAnimation.h"

@implementation UIView (LevelAnimation)

-(void)geelyContentViewFrameAnimation:(AnimationBlock)block successful:(AnimationCompletedBlock)success{
    CGRect frameOld = self.frame;
    
    [UIView animateWithDuration:.5f animations:^{
        block();
        self.frame = CGRectMake(frameOld.origin.x+340, frameOld.origin.y, frameOld.size.width, frameOld.size.height);

    } completion:^(BOOL finished) {
        success();
    }];
    
}

-(void)resumeGeelyContentViewFrame {
    CGRect frameOld = self.frame;
    
    [UIView animateWithDuration:.5f animations:^{
        self.frame = CGRectMake(frameOld.origin.x-340, frameOld.origin.y, frameOld.size.width, frameOld.size.height);
    }];
}

-(void)geelyAirborneViewAnimation:(AnimationBlock)block {
    CGRect frameOld = self.frame;
    self.frame = CGRectMake(frameOld.origin.x, -frameOld.size.height, frameOld.size.width, frameOld.size.height);
    
    [UIView animateWithDuration:.5f animations:^{
        self.frame = CGRectMake(frameOld.origin.x, frameOld.origin.y, frameOld.size.width, frameOld.size.height);
    } completion:^(BOOL finished) {
        block();
    }];
    
}

@end
