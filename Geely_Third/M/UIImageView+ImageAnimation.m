//
//  UIImageView+ImageAnimation.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/14.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "UIImageView+ImageAnimation.h"

@implementation UIImageView (ImageAnimation)

-(void)animationImage:(UIImage *)image {
    [UIView animateWithDuration:1.0f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.image = image;
        [UIView animateWithDuration:1.0f animations:^{
            self.alpha = 1;
        }];
    }];
}

@end
