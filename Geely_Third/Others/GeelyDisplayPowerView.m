//
//  GeelyDisplayPowerView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyDisplayPowerView.h"

@interface GeelyDisplayPowerView () {
    UIView *dis;
}

@end

@implementation GeelyDisplayPowerView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        dis = [[[NSBundle mainBundle] loadNibNamed:@"displaypower" owner:self options:nil]firstObject];
        dis.frame = frame;
        [self addSubview:dis];
        
        UIButton *powerBtn = (UIButton *)[dis viewWithTag:1101];
        powerBtn.tag = 1;
        UIButton *displBtn = (UIButton *)[dis viewWithTag:1102];
        displBtn.tag = 2;
        UIButton *backBtn = (UIButton *)[dis viewWithTag:1103];
        backBtn.tag = 3;
        
        [powerBtn addTarget:self action:@selector(powerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [displBtn addTarget:self action:@selector(displBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [backBtn addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)showAnimation {
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    [win addSubview:self];
    dis.alpha = 0;
    [UIView animateWithDuration:1.0f animations:^{
        dis.alpha = 1;
    }];
}

-(void)powerBtnAction:(UIButton *)btn {
    [self backBtnAction:btn];
}

-(void)displBtnAction:(UIButton *)btn {
    [self backBtnAction:btn];
}

-(void)backBtnAction:(UIButton *)btn {
        if (btn.tag == 1) {
            if ([self.delegate respondsToSelector:@selector(showPowerView:)]&&self.delegate) {
                [self.delegate showPowerView:self];
            }
        }else if (btn.tag == 2) {
            if ([self.delegate respondsToSelector:@selector(showDisplayView:)]&&self.delegate) {
                [self.delegate showDisplayView:self];
            }
        }
        
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
