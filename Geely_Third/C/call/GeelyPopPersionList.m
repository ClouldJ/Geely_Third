//
//  GeelyPopPersionList.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/4.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyPopPersionList.h"

@implementation GeelyPopPersionList

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *vb = [[[NSBundle mainBundle] loadNibNamed:@"Geelypersonlll" owner:self options:nil]firstObject];
        vb.frame = frame;
        [self addSubview:vb];
        
        UIButton *btn = (UIButton *)[vb viewWithTag:272];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)btnAction:(UIButton *)btn {
    [self removeFromSuperview];
}


-(void)showAnimation {
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    [win addSubview:self];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
