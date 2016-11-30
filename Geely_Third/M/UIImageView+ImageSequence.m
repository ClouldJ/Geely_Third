//
//  UIImageView+ImageSequence.m
//  TheDashboard
//
//  Created by haigui on 16/11/14.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "UIImageView+ImageSequence.h"

@implementation UIImageView (ImageSequence)

+ (UIImageView *)ImageSequenceWithArray:(NSArray *)array repeatCount:(NSUInteger)count duration:(CGFloat)duration {
    UIImageView *imageView = [[self alloc] init];
    imageView.animationImages = array;// 序列帧动画的uiimage数组
    imageView.animationDuration = duration;// 序列帧全部播放完所用时间
    imageView.animationRepeatCount = count;// 序列帧动画重复次数
    return imageView;
}

- (void)startImageSequenceWithArray:(NSArray *)array repeatCount:(NSUInteger)count duration:(CGFloat)duration  {
        self.animationImages = array;// 序列帧动画的uiimage数组
        self.animationDuration = duration;// 序列帧全部播放完所用时间
        self.animationRepeatCount = LONG_MAX;// 序列帧动画重复次数
        [self startAnimating];//开始动画
}

@end
