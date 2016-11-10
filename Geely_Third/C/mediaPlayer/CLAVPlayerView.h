//
//  CLAVPlayerView.h
//  Geely_Third
//
//  Created by 胡亚明 on 16/11/9.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CLAVPlayerView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
/** playerLayer */
@property(nonatomic,strong)AVPlayerLayer *playerLayer;
/** player */
@property(nonatomic,strong)AVPlayer *player;
/** playerItem */
@property(nonatomic,strong)AVPlayerItem *playerItem;
@property (weak, nonatomic) IBOutlet UIView *bottomView;


/** 需要播放的视频资源 */
@property(nonatomic,strong)NSString *urlString;

/* 包含在哪一个控制器中 */
@property (nonatomic, weak) UIViewController *contrainerViewController;

/** 快速创建 */
+ (instancetype)videoPlayView;



@end
