//
//  UIImageView+ImageSequence.h
//  TheDashboard
//
//  Created by haigui on 16/11/14.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ImageSequence)

+ (UIImageView *)ImageSequenceWithArray:(NSArray *)array repeatCount:(NSUInteger)count duration:(CGFloat)duration;

- (void)startImageSequenceWithArray:(NSArray *)array repeatCount:(NSUInteger)count duration:(CGFloat)duration;

@end
