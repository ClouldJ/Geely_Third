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
//        bot.backgroundColor = [UIColor redColor];
        bot.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:bot];
        imageView = (UIImageView *)[bot viewWithTag:98789];
        imageView.userInteractionEnabled = YES;
        UIButton *btn_o = [[UIButton alloc] initWithFrame:CGRectMake(55, 13, 150, 73)];
        UIButton *btn_t = [[UIButton alloc] initWithFrame:CGRectMake(219, 13, 108, 73)];
        UIButton *btn_3 = [[UIButton alloc] initWithFrame:CGRectMake(346, 13, 108, 73)];
        UIButton *btn_f = [[UIButton alloc] initWithFrame:CGRectMake(454, 13, 123.5, 73)];
        UIButton *btn_5 = [[UIButton alloc] initWithFrame:CGRectMake(577.5, 13, 133.5, 73)];
        
        [self addSubview:btn_o];
        [self addSubview:btn_t];
        [self addSubview:btn_3];
        [self addSubview:btn_f];
        [self addSubview:btn_5];
        
        
        btn_o.tag = 1;
        [btn_o addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn_t.tag = 2;
        [btn_t addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn_3.tag = 3;
        [btn_3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn_f.tag = 4;
        [btn_f addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn_5.tag = 5;
        [btn_5 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)btnAction:(UIButton *)BTN {
    NSString *str = nil;
    switch (BTN.tag) {
        case 1:
            str = @"语音助手";
            break;
        case 2:
            str = @"在线FM";
            break;
        case 3:
            str = @"行车记录";
            break;
        case 4:
            str = @"CarPlay";
            break;
        case 5:
            str = @"在线音乐";
            break;
        default:
            break;
    }
    
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:str message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [al show];
}

-(void)becomeBlue{
    NSLog(@"变换为经济模式");
    [imageView animationImage:[UIImage imageNamed:@"Geely_home_content_controlBlue"]];
}

-(void)becomeRed {
    NSLog(@"变换为运动模式");
    [imageView animationImage:[UIImage imageNamed:@"Geely_home_content_controlRed"]];
}

-(void)becomegold{
    NSLog(@"变换为舒适模式");
    [imageView animationImage:[UIImage imageNamed:@"apphomecontent"]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
