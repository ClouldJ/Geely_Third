//
//  GeelyCallingActionView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/14.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyCallingActionView.h"


@interface GeelyCallingActionView () {
    UIView *screenView;
}

@end

@implementation GeelyCallingActionView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        screenView = [[[NSBundle mainBundle] loadNibNamed:@"oncall" owner:self options:nil]firstObject];
        screenView.frame = frame;
        [self addSubview:screenView];
        
        UIButton *btn = (UIButton *)[screenView viewWithTag:7869];
        [btn addTarget:self action:@selector(callFailAction:) forControlEvents:UIControlEventTouchUpInside];
        
//        contentView = (UIView *)[screenView viewWithTag:109];
//        
//        [self loadSubview];
    }
    return self;
}

-(void)callFailAction:(UIButton *)btn {
    [UIView animateWithDuration:.5f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)showAnimation {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
