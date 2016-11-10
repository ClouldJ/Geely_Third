//
//  GeelyNoVoliceView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/25.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyNoVoliceView.h"

@interface GeelyNoVoliceView () {
    UIView *bgView;
    UIImageView *bgImage;
}

@end

@implementation GeelyNoVoliceView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.did = NO;
        UIView *vc = [[[NSBundle mainBundle] loadNibNamed:@"novolice" owner:self options:nil]firstObject];
        vc.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:vc];
//        bgView = [[UIView alloc] initWithFrame:CGRectMake((WWWWWWWWWWW - 1310)/2, (HHHHHHHHHHH - 492)/2, 1310, 49)];
//        bgView.
//        [self addSubview:bgView];
    }
    return self;
}

- (void)showA {
    NSLog(@"111111");
}

-(void)showAnimation {
    self.did = YES;
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    [win addSubview:self];
//    [UIView animateWithDuration:0 animations:^{
//        [win addSubview:self];
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:1.0f delay:3.0f options:UIViewAnimationOptionLayoutSubviews animations:^{
//            NSLog(@"关闭");
//        } completion:^(BOOL finished) {
//            [self removeFromSuperview];
//        }];
//    }];
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
//
//    NSLog(@"diuanudnuasoundaondonaodnasondonadooadonsad");
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
