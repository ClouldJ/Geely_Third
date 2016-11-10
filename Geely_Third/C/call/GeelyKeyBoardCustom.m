//
//  GeelyKeyBoardCustom.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyKeyBoardCustom.h"

#import "ZXPAutoLayout.h"

@interface GeelyKeyBoardCustom () {
    UIView *backGroundView;             //背景
    UIView *centerView;                 //内容
    UIImageView *imageView1;
    UIImageView *imageView2;
    UIButton *btn;
}

@end

@implementation GeelyKeyBoardCustom

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        [self loadSubViews];
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"keyBoard" owner:self options:nil]firstObject];
        view.frame = frame;
        [self addSubview:view];
        
        imageView1 = (UIImageView *)[view viewWithTag:977];
        imageView2 = (UIImageView *)[view viewWithTag:978];
        imageView2.hidden = YES;
        imageView1.hidden = NO;
        
        btn = (UIButton *)[view viewWithTag:976];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *ccBtn = (UIButton *)[view viewWithTag:945];
        [ccBtn addTarget:self action:@selector(btnAAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *bvBtn = (UIButton *)[view viewWithTag:845];
        [bvBtn addTarget:self action:@selector(bvBtnAvtion:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)bvBtnAvtion:(UIButton *)btn {
    [self removeFromSuperview];
}

-(void)btnAction:(UIButton *)btn1 {
    imageView1.hidden = !imageView1.hidden;
    imageView2.hidden = !imageView2.hidden;
    btn.hidden = !btn.hidden;
}

-(void)btnAAction:(UIButton *)btn1 {
    imageView1.hidden = !imageView1.hidden;
    imageView2.hidden = !imageView2.hidden;
    btn.hidden = !btn.hidden;
}

-(void)loadSubViews {
    
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self removeFromSuperview];
}

-(void)showAnimation {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
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
