//
//  GeelyMusicLittleView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMusicLittleView.h"
#import "GeelyMusicAudioManager.h"

@interface GeelyMusicLittleView () {
    CGFloat singTime;
}

@end

@implementation GeelyMusicLittleView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"geelymusiclittle" owner:self options:nil]firstObject];
        self.frame = frame;
        self.musicmedia = NO;
        [self.closeBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        [self.musicAndMedia addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventTouchUpInside];
        __block __weak GeelyMusicLittleView *weakself = self;
        self.animationImage.block = ^() {
            self.animationImage.delegate = weakself;
            GeelyMusicAudioManager *manager = [GeelyMusicAudioManager defaultManager];
            acPlayer = [manager playMusic:@"Zki & Dobre-Listen To The Talk"];
            singTime = (CGFloat)acPlayer.duration;
        };
        

    }
    return self;
}

-(void)switchAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(didSwitch:)] && self.delegate) {
        [self.delegate didSwitch:self];
    }
}

-(float)musicTime{
    return singTime;
}

-(void)musciCDAnimationRunning:(GeelyMusicCDAnimationView *)musciView currentPosition:(CGFloat)currenttime{
    NSLog(@"再跑");
}

-(void)dismiss {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"left" forKey:@"dismiss"];
    [[NSNotificationCenter defaultCenter] postNotificationName:DISMISS object:nil userInfo:dic];
}

-(void)startMusicAnimation {
    [self.animationImage showAnimation];
//    self.currentTime.text = [self convertTime:[GeelyMusicAudioManager defaultManager].player.currentTime];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
