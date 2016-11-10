//
//  GeelyMusicAudioManager.h
//  Geely_Beizar
//
//  Created by WillyZhao on 16/10/17.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <AVFoundation/AVFoundation.h>


/**
 *  AudioPlayerMode 播放模式
 */
typedef NS_ENUM(NSInteger, AudioPlayerMode) {
    /**
     *  顺序播放
     */
    AudioPlayerModeOrderPlay,
    /**
     *  随机播放
     */
    AudioPlayerModeRandomPlay,
    /**
     *  单曲循环
     */
    AudioPlayerModeSinglePlay,
};

@interface GeelyMusicAudioManager : NSObject

+(instancetype)defaultManager;

//播放音乐
-(AVAudioPlayer *)playMusic:(NSString *)filename;

-(void)pauseMusic:(NSString *)filename;

-(void)stopMusic:(NSString *)filename;

//播放音效
-(void)playSound:(NSString *)filename;

-(void)disposeSound:(NSString *)filename;

+(instancetype)musicAudionPlayer;
-(AVPlayer *)setMusicData:(NSString *)string;

@property (nonatomic, strong) AVAudioPlayer *player;


@end
