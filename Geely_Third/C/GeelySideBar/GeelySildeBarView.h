//
//  GeelySildeBarView.h
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CellPhoneView.h"
#import "GeelyMusicCDAnimationView.h"
#import "GeelyLeftFrameDynamicView.h"
@class GeelyLeftFrameDynamicView;


FOUNDATION_EXTERN NSString *const SLIDESETTINGSTYLE_NOTICE;

@protocol GeelySildeBarViewDelegate <NSObject>

-(void)geelySettingSlideViewSelectedWith:(NSInteger)index;

@end

@interface GeelySildeBarView : UIView

@property (nonatomic, assign) id<GeelySildeBarViewDelegate> delegate;

@property (nonatomic, strong) UIImageView *bg_imageView;            //背景
@property (nonatomic, strong) UITableView *setting_tableView;       //设置内容

@property (nonatomic, strong) UIImageView *image_musciTitle;        //音乐标题
@property (nonatomic, strong) UIButton *store_btn;                  //收藏按钮
@property (nonatomic, strong) GeelyMusicCDAnimationView *animaeCD;  //CD旋转View
@property (nonatomic, strong) UILabel *timeLabel;                   //音乐进度时间
@property (nonatomic, strong) UIImageView *imageViewradio;          //电台操作

@property (nonatomic, strong) CellPhoneView *phoneView;

-(instancetype)initWithFrame:(CGRect)frame customStyle:(GeelyDynamicViewStyle)style;

@end
