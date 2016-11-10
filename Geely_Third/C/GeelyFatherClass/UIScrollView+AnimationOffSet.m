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

@end
