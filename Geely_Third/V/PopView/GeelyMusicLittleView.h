//
//  GeelyMusicLittleView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GeelyMusicCDAnimationView.h"

#import "GeelyMusicAudioManager.h"
@class GeelyMusicLittleView;
@protocol GeelyMusicLittleViewDelegate <NSObject>

-(void)didSwitch:(GeelyMusicLittleView *)view;

@end

@interface GeelyMusicLittleView : UIView <GeelyMusicCDAnimationViewDelegate> {
    AVAudioPlayer *acPlayer;
    MainRequest *mainRequest;
}
@property (weak, nonatomic) IBOutlet GeelyMusicCDAnimationView *animationImage;
@property (weak, nonatomic) IBOutlet UILabel *currentTime;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (strong, nonatomic) IBOutlet UIButton *musicAndMedia;
@property (nonatomic ,assign) BOOL musicmedia;
@property (weak, nonatomic) IBOutlet UIImageView *forBgImage;

@property (nonatomic, assign) id<GeelyMusicLittleViewDelegate> delegate;

//@property (nonatomic, strong) GeelyMusicCDAnimationView *animationImageView;

-(void)startMusicAnimation;

@end
