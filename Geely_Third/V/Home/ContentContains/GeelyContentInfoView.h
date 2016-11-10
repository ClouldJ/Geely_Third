//
//  GeelyContentInfoView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GeelyContentInfoView;
@protocol GeelyContentInfoViewDelegate <NSObject>

-(void)theWeatherClicked:(GeelyContentInfoView *)infoView;

@end

@interface GeelyContentInfoView : UIView

@property (nonatomic, assign) id<GeelyContentInfoViewDelegate> delegate;

@end
