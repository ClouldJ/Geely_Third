//
//  UIScrollView+AnimationOffSet.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/9.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "UIScrollView+AnimationOffSet.h"

@implementation UIScrollView (AnimationOffSet)

-(void)scrollAnimationToOffSet:(CGPoint)offset {
    [UIView animateWithDuration:.5f animations:^{
        self.contentOffset = offset;
    }];
}

-(void)scollAnimationAlphaOffSet:(CGPoint)point{
    [UIView animateWithDuration:.5f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.contentOffset = point;
        [UIView animateWithDuration:.5f animations:^{
            self.alpha = 1;
        }];
    }];
}

@end
