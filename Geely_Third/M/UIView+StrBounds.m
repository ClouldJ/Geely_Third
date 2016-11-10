//
//  UIView+StrBounds.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "UIView+StrBounds.h"

@implementation UIView (StrBounds)

/**
 ***计算文本宽度***
 **/

-(CGFloat)getWidthValueWith:(NSString *)str andFont:(CGFloat)font{
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:font] constrainedToSize:CGSizeMake(MAXFLOAT, 30)];
    
    return size.width;
}

/**
 ***计算文本高度***
 **/

-(CGFloat)getHeightValueWith:(NSString *)str andFont:(CGFloat)font{
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:font] constrainedToSize:CGSizeMake([self getWidthValueWith:str andFont:font], MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
    return size.height;
}

@end
