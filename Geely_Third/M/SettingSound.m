//
//  SettingSound.m
//  控制系统的音量
//
//  Created by 吴德文 on 16/10/12.
//  Copyright © 2016年 XiangYuKeJi. All rights reserved.
//

#import "SettingSound.h"
#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@implementation SettingSound

/*
 *获取系统音量滑块
 */
+(UISlider*)getSystemVolumSlider{
    static UISlider * volumeViewSlider = nil;
    if (volumeViewSlider == nil) {
        MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:CGRectMake(10, 50, 200, 4)];
        
        for (UIView* newView in volumeView.subviews) {
            if ([newView.class.description isEqualToString:@"MPVolumeSlider"]){
                volumeViewSlider = (UISlider*)newView;
                break;
            }
        }
    }
    return volumeViewSlider;
}

/*
 *获取系统音量大小
 */
+(CGFloat)getSystemVolumValue{
    NSLog(@"%f %s, line = %d",[[self getSystemVolumSlider] value], __FUNCTION__, __LINE__);

    return [[self getSystemVolumSlider] value];
}

/*
 *设置系统音量大小
 */
+(void)setSysVolumWith:(double)value{
    [self getSystemVolumSlider].value = value;
}
@end
