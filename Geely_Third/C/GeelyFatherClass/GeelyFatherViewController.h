//
//  GeelyFatherViewController.h
//  Geely_Third
//
//  Created by WillyZhao on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyPublicViewController.h"

#import "UIImageView+LevelAnimation.h"
#import "UIView+LevelAnimation.h"
#import "GeelyFatherViewController+PopAnimation.h"
#import "GeelyDisplayPowerView.h"
#import "GeelyPowerDisplayView.h"
#import "GeelyScreenView.h"
#import <MediaPlayer/MediaPlayer.h>

typedef void(^TopViewAnimationSuccessful)();

@class GeelyFatherViewController;
@protocol GeelyFatherViewDatasource <NSObject>

-(UIView *)geelyTopAnimateView;

@end

@interface GeelyFatherViewController : GeelyPublicViewController <GeelyFatherViewDatasource,UIScrollViewDelegate,GeelyDisplayPowerViewDelegate>{
    MainRequest *mainRequest;
    MPMusicPlayerController *vvlioce;
    CGFloat volume;
}
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, assign) id<GeelyFatherViewDatasource> dataSource;

-(void)addImageViewAnimate:(TopViewAnimationSuccessful)animation;

-(void)addFixedView;

@end
