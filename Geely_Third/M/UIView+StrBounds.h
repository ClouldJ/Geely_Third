//
//  UIView+StrBounds.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (StrBounds)

-(CGFloat)getWidthValueWith:(NSString *)str andFont:(CGFloat)font;

-(CGFloat)getHeightValueWith:(NSString *)str andFont:(CGFloat)font;

@end
