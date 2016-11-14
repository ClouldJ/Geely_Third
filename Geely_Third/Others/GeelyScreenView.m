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
    
    UIImageView *app_ImageView;
    UIImageView *bigBG;
}



@end

@implementation GeelyScreenView



-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        screenView = [[[NSBundle mainBundle] loadNibNamed:@"screenview" owner:self options:nil]firstObject];
        screenView.frame = frame;
        [self addSubview:screenView];
        bigBG = (UIImageView *)[screenView viewWithTag:10187];
        contentView = (UIView *)[screenView viewWithTag:109];
        
        [self loadSubview];
    }
    return self;
}

-(void)becomeBlue{
    if ([SingleModel sharedInstance].isDisplay) {
        [imageView animationImage:[UIImage imageNamed:@"时间display_red"]];
        [sunImageView animationImage:[UIImage imageNamed:@"天气信息geelydisplay"]];
        [app_ImageView animationImage:[UIImage imageNamed:@"appdisplay_red"]];
        [bigBG animationImage:[UIImage imageNamed:@"Geely_displayforred1"]];
    }
}

-(void)becomeRed {
    if ([SingleModel sharedInstance].isDisplay) {
        [imageView animationImage:[UIImage imageNamed:@"时间display_red"]];
        [sunImageView animationImage:[UIImage imageNamed:@"天气信息geelydisplay"]];
        [app_ImageView animationImage:[UIImage imageNamed:@"appdisplay_red"]];
        [bigBG animationImage:[UIImage imageNamed:@"Geely_displayforred1"]];
    }
    
}

-(void)becomegold{
    if ([SingleModel sharedInstance].isDisplay) {
        [imageView animationImage:[UIImage imageNamed:@"时间geelydisplay"]];
        [sunImageView animationImage:[UIImage imageNamed:@"天气信息geelydisplay"]];
        [app_ImageView animationImage:[UIImage imageNamed:@"语音助手geelydisspaly"]];
        [bigBG animationImage:[UIImage imageNamed:@"GeelyDisplayBackground"]];
    }
    
}

-(void)loadSubview {
    [SingleModel sharedInstance].isDisplay = YES;;

    //添加驾驶模式转换通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeRed) name:MODE_RED object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeBlue) name:MODE_BLUE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomegold) name:MODE_GOLD object:nil];
    
    imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.frame = CGRectMake(845+36, 123+257, 660/2, 434/2);
    [screenView addSubview:imageView];
    
    sunImageView = [[UIImageView alloc] init];
    sunImageView.userInteractionEnabled = YES;
    sunImageView.frame = CGRectMake(160, 123+250, 697/2, 236/2);
    [screenView addSubview:sunImageView];
    
    btnView = [[[NSBundle mainBundle] loadNibNamed:@"screenbottombtn" owner:self options:nil]firstObject];
    btnView.frame = CGRectMake(35, 123+465, 1295/2, 357/2);
    [screenView addSubview:btnView];
    app_ImageView = (UIImageView *)[btnView viewWithTag:7896];
    
    switch ([SingleModel sharedInstance].displayType) {
        case RED:
        {
            imageView.image = [UIImage imageNamed:@"时间display_red"];
            sunImageView.image = [UIImage imageNamed:@"天气信息geelydisplay"];
            app_ImageView.image = [UIImage imageNamed:@"appdisplay_red"];
            bigBG.image = [UIImage imageNamed:@"Geely_displayforred1"];
        }
            break;
        case BLUE:
        {
            imageView.image = [UIImage imageNamed:@"时间geelydisplay"];
            sunImageView.image = [UIImage imageNamed:@"天气信息geelydisplay"];
            app_ImageView.image = [UIImage imageNamed:@"语音助手geelydisspaly"];
        }
            break;
        case GOLD:
        {
            imageView.image = [UIImage imageNamed:@"时间geelydisplay"];
            sunImageView.image = [UIImage imageNamed:@"天气信息geelydisplay"];
            app_ImageView.image = [UIImage imageNamed:@"语音助手geelydisspaly"];
            bigBG.image = [UIImage imageNamed:@"GeelyDisplayBackground"];
        }
            break;
        default:
            break;
    }
    
}

-(void)dealloc {
    [SingleModel sharedInstance].isDisplay = NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
