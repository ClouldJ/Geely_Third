//
//  GeelyFatherViewController+PopAnimation.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/10.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyFatherViewController+PopAnimation.h"

@implementation GeelyPublicViewController (PopAnimation)

-(void)showPopAnimation {
    NSLog(@"首页");
    GeelyDisplayPowerView *cc = [[GeelyDisplayPowerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cc.delegate = self;
    [cc showAnimation];
}



@end


