//
//  GeelyBluetoothView.m
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyBluetoothView.h"

@implementation GeelyBluetoothView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"bluetooth" owner:self options:nil]firstObject];
        view.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:view];
    }
    return self;
}

-(void)showAnimation {
    UIWindow *win = [UIApplication sharedApplication].keyWindow;
    [win addSubview:self];
    self.alpha = 0;
    [UIView animateWithDuration:.2f animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.2f delay:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
