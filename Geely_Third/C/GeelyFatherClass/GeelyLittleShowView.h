//
//  GeelyLittleShowView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/11/9.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeelyMediaLittleView.h"


@interface GeelyLittleShowView : UIView {
    GeelyMediaLittleView *media;
}

@property (nonatomic ,assign) BOOL show;

@property (nonatomic, strong) UIScrollView *contentScrollView;

-(void)addScrollView;

@end
