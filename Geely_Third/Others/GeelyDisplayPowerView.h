//
//  GeelyDisplayPowerView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GeelyDisplayPowerView;
@protocol GeelyDisplayPowerViewDelegate <NSObject>

-(void)showPowerView:(GeelyDisplayPowerView *)view;

-(void)showDisplayView:(GeelyDisplayPowerView *)view;

@end

@interface GeelyDisplayPowerView : UIView

@property (nonatomic, assign) id<GeelyDisplayPowerViewDelegate> delegate;

-(void)showAnimation;

@end
