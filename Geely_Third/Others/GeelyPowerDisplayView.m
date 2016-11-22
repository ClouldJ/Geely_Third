//
//  GeelyPowerDisplayView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyPowerDisplayView.h"

@interface GeelyPowerDisplayView () {
    UIView *vdd;
    UIImageView *image;
}

@end

@implementation GeelyPowerDisplayView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        vdd = [[[NSBundle mainBundle] loadNibNamed:@"power" owner:self options:nil]firstObject];
        vdd.frame = frame;
        [self addSubview:vdd];
        image = (UIImageView *)[vdd viewWithTag:101];
        UIButton *btn = (UIButton *)[vdd viewWithTag:1986];
        [btn addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)dismiss:(UIButton *)btn {
    [self removeFromSuperview];
}

-(void)showAnimation {
    UIWindow *win  =[[UIApplication sharedApplication] keyWindow];
    [win addSubview:self];
    image.alpha = 0;
    [UIView animateWithDuration:1.0f animations:^{
        image.alpha = 1;
    }];
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self removeFromSuperview];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
