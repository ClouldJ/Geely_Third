//
//  GeelyNo.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/25.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyNo.h"

@implementation GeelyNo
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *vc = [[[NSBundle mainBundle] loadNibNamed:@"noadd" owner:self options:nil]firstObject];
        vc.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:vc];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showaaaa)];
        [self addGestureRecognizer: tap];
        
    }
    return self;
}

-(void)setIndex:(NSInteger)index {
    NSLog(@"11");
}

-(void)sssShowAnimate {
    UIWindow *WIN = [[UIApplication sharedApplication] keyWindow];
    [WIN addSubview:self];
}

-(void)dismisss {
    [self removeFromSuperview];
}

-(void)showaaaa {
    NSLog(@"未来");
    
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
