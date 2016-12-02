//
//  VoliceView.m
//  sdonad ansdoinads
//
//  Created by WillyZhao on 16/10/25.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "VoliceView.h"

#import <MediaPlayer/MediaPlayer.h>

@interface VoliceView () {
    UIImageView *image_down;
    UIImageView *image_gesture;
    MPMusicPlayerController *vvlioce;
    UIButton *btn;
    MainRequest *mainRequest;
}

@end

@implementation VoliceView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadubView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)loadubView {

    
     btn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 21, (self.frame.size.height - 33/2)/2, 21, 33/2)];
    [btn setBackgroundImage:[UIImage imageNamed:@"音量auto"] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    image_down = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"底auto"]];
    image_down.frame  = CGRectMake(self.frame.size.width - 301/2, self.frame.size.height/2+5-5, 301/2, 21/1);
    image_down.userInteractionEnabled = YES;
    [self addSubview:image_down];
    image_down.hidden = YES;
    
    image_gesture = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"亮光auto"]];
    image_gesture.userInteractionEnabled = YES;
    image_gesture.frame = CGRectMake(self.frame.size.width - 301/2, self.frame.size.height/2-10-5, 451/2, 75/2);
    [self addSubview:image_gesture];
    image_gesture.hidden = YES;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureAction:)];
    [image_gesture addGestureRecognizer:pan];
    
    [self btnAction:btn];
    //
//    [btn setBackgroundImage:[UIImage imageNamed:@"音量blue"] forState:UIControlStateNormal];
//    image_down.image =[UIImage imageNamed:@"底blue"];
//    image_gesture.image =[UIImage imageNamed:@"亮光blue"];
    //
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeImgToGold) name:MODE_GOLD object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeImgToBlue) name:MODE_BLUE object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeImgToRed) name:MODE_RED object:nil];
    
}
- (void)changeImgToGold{
    [btn setBackgroundImage:[UIImage imageNamed:@"音量auto"] forState:UIControlStateNormal];
    image_down.image =[UIImage imageNamed:@"底auto"];
    image_gesture.image =[UIImage imageNamed:@"亮光auto"];
}
- (void)changeImgToBlue{
    [btn setBackgroundImage:[UIImage imageNamed:@"音量blue"] forState:UIControlStateNormal];
    image_down.image =[UIImage imageNamed:@"底blue"];
    image_gesture.image =[UIImage imageNamed:@"亮光blue"];
    
}
- (void)changeImgToRed{
    [btn setBackgroundImage:[UIImage imageNamed:@"音量red"] forState:UIControlStateNormal];
    image_down.image =[UIImage imageNamed:@"底red"];
    image_gesture.image =[UIImage imageNamed:@"亮光red"];
}
-(void)panGestureAction:(UIPanGestureRecognizer *)pan {
    CGFloat transX =[pan locationInView:self].x;
    UIImageView *image = (UIImageView *)[pan view];
    [self bringSubviewToFront:image];
    if (pan.state == UIGestureRecognizerStateChanged) {
        if (transX>=-59&&transX<=251.5) {
            image.frame = CGRectMake(image.frame.origin.x, image.frame.origin.y, transX+image.frame.origin.x*2, 75/2);
            CGFloat vol = (transX*1.25)/image.frame.size.width;
            if (vol<=0) {
                vol = 0;
            }
            [SettingSound setSysVolumWith:vol];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            
            [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }
    }
}

-(void)autoMakeViewFrame:(CGFloat)percent{
    [UIView animateWithDuration:.3f animations:^{
        btn.frame = CGRectMake(0, btn.frame.origin.y, 21, 33/2);
    } completion:^(BOOL finished) {
        image_down.hidden = NO;
        image_gesture.hidden = NO;
    }];

    image_gesture.frame = CGRectMake(image_gesture.frame.origin.x, image_gesture.frame.origin.y, image_down.frame.size.width*percent, 75/2);

    
}

-(void)btnAction:(UIButton *)btn1 {
    
//    if (image_gesture.hidden) {
//        [UIView animateWithDuration:.3f animations:^{
            btn1.frame = CGRectMake(0, btn1.frame.origin.y, 21, 33/2);
//        } completion:^(BOOL finished) {
            image_down.hidden = NO;
            image_gesture.hidden = NO;
//        }];
//    }else{
//        image_down.hidden = YES;
//        image_gesture.hidden = YES;
//        [UIView animateWithDuration:.3f animations:^{
//            btn1.frame = CGRectMake(self.frame.size.width - 21, (self.frame.size.height - 33/2)/2, 21, 33/2);
//        } completion:^(BOOL finished) {
//            
//        }];
//    }
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
