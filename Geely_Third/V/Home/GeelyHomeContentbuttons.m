//
//  GeelyHomeContentbuttons.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/2.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyHomeContentbuttons.h"

@interface GeelyHomeContentbuttons () {
    UIImageView *imageView;
}

@end

@implementation GeelyHomeContentbuttons

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        //添加驾驶模式转换通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeRed) name:MODE_RED object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeBlue) name:MODE_BLUE object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomegold) name:MODE_GOLD object:nil];
        
        UIView *bot = [[[NSBundle mainBundle] loadNibNamed:@"homecontentbtns" owner:self options:nil]firstObject];
        bot.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:bot];
        
        imageView = (UIImageView *)[bot viewWithTag:98789];
        
    }
    return self;
}

-(void)becomeBlue{
    NSLog(@"变换为经济模式");
    imageView.image = [UIImage imageNamed:@"Geely_home_content_controlBlue"];
}

-(void)becomeRed {
    NSLog(@"变换为运动模式");
    imageView.image = [UIImage imageNamed:@"Geely_home_content_controlRed"];
}

-(void)becomegold{
    NSLog(@"变换为舒适模式");
    imageView.image = [UIImage imageNamed:@"apphomecontent"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
