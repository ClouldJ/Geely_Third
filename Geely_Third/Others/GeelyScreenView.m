//
//  GeelyScreenView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/1.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyScreenView.h"

@interface GeelyScreenView () {
    UIView *screenView;
    UIImageView *imageView;
    
    UIImageView *sunImageView;
    UIView *btnView;
    UIView *contentView;
}

@end

@implementation GeelyScreenView


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        screenView = [[[NSBundle mainBundle] loadNibNamed:@"screenview" owner:self options:nil]firstObject];
        screenView.frame = frame;
        [self addSubview:screenView];
        
        contentView = (UIView *)[screenView viewWithTag:109];
        
        [self loadSubview];
    }
    return self;
}

-(void)loadSubview {
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"时间geelydisplay"]];
    imageView.userInteractionEnabled = YES;
    imageView.frame = CGRectMake(845+36, 123+257, 660/2, 434/2);
    [screenView addSubview:imageView];
    
    sunImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"天气信息geelydisplay"]];
    sunImageView.userInteractionEnabled = YES;
    sunImageView.frame = CGRectMake(160, 123+250, 697/2, 236/2);
    [screenView addSubview:sunImageView];
    
    btnView = [[[NSBundle mainBundle] loadNibNamed:@"screenbottombtn" owner:self options:nil]firstObject];
    btnView.frame = CGRectMake(35, 123+465, 1295/2, 357/2);
    [screenView addSubview:btnView];
    
}

-(void)showAnimate {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:self];
    contentView.alpha = 0;
    imageView.alpha = 0;
    sunImageView.frame = CGRectMake(160, 123+250+50, 697/2, 236/2);
    sunImageView.alpha = 0;
    btnView.alpha = 0;

    
    [UIView animateWithDuration:1.0f animations:^{
        contentView.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.5f animations:^{
            imageView.alpha = 1;
            sunImageView.alpha = 1;
            sunImageView.frame = CGRectMake(160, 123+250, 697/2, 236/2);
            btnView.alpha = 1;
        }];
    }];
    
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
