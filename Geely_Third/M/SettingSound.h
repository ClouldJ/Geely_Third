//
//  SettingSound.h
//  控制系统的音量
//
//  Created by 吴德文 on 16/10/12.
//  Copyright © 2016年 XiangYuKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SettingSound : NSObject

/*
 *获取系统音量滑块
 */
+(UISlider*)getSystemVolumSlider;
    
/*
 *获取系统音量大小
 */
+(CGFloat)getSystemVolumValue;

/*
 *设置系统音量大小
 */
+(void)setSysVolumWith:(double)value;
@end
