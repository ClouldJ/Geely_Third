//
//  GeelyMusicCDAnimationView.h
//  Geely_Beizar
//
//  Created by WillyZhao on 16/10/17.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GeelyMusicCDAnimationView;
typedef void(^check)( );
@protocol GeelyMusicCDAnimationViewDelegate <NSObject>

-(float)musicTime;

-(void)musicCDAnimationDidFinish:(GeelyMusicCDAnimationView *)musicView;

-(void)musicCDAnimationWillStart:(GeelyMusicCDAnimationView *)musicView;

-(void)musciCDAnimationRunning:(GeelyMusicCDAnimationView *)musciView currentPosition:(CGFloat)currenttime;


-(void)musicCDAnimationPaused:(GeelyMusicCDAnimationView *)musicView;
-(void)musicCDAnimationResumed:(GeelyMusicCDAnimationView *)musicView;

@end

@interface GeelyMusicCDAnimationView : UIView

@property (nonatomic, assign) id<GeelyMusicCDAnimationViewDelegate> delegate;

@property (nonatomic, assign) check block;

@property (nonatomic, strong) UIColor *trackLayerColor;

@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, assign) CGFloat repeatCount;

@property (nonatomic, strong)     UIImageView *imageView_;


-(void)showAnimation;

-(void)reloadWith:(CGFloat)musicTime;

-(void)pauseLayer:(CALayer *)layer;

-(void)resumeLayer:(CALayer *)layer;

@end
