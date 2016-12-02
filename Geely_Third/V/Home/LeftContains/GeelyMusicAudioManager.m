//
//  GeelyMusicAudioManager.m
//  Geely_Beizar
//
//  Created by WillyZhao on 16/10/17.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMusicAudioManager.h"

@interface GeelyMusicAudioManager () {
    AVPlayerItem *playerItem;
    AudioPlayerMode playMode;       //播放模式
    NSArray *musicArray;
    id _playTimeObserver; // 播放进度观察者
}

@property (nonatomic, strong) NSMutableDictionary *musicPlayers;

@property (nonatomic, strong) NSMutableDictionary *soundIDs;

@property (nonatomic, strong)     AVPlayer *musicPlayer;


@end

static GeelyMusicAudioManager *instance_ = nil;

@implementation GeelyMusicAudioManager

+(void)initialize {
    //音频会话
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    //设置会话类型
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    //激活会话
    [session setActive:YES error:nil];
}

+(instancetype)defaultManager {
    static dispatch_once_t onceToken;
    _dispatch_once(&onceToken, ^{
        instance_ = [[self alloc] init];
    });
    return instance_;
}

-(instancetype)init {
    __block GeelyMusicAudioManager *temp = self;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ((temp = [super init]) != nil) {
            self.musicPlayers = [NSMutableDictionary dictionary];
            self.soundIDs = [NSMutableDictionary dictionary];
        }
    });
    self = temp;
    return self;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [super allocWithZone:zone];
    });
    return instance_;
}

//播放音乐
-(AVAudioPlayer *)playMusic:(NSString *)filename {
    if (filename == nil || filename.length == 0) return nil;
    
    //先检查对象是否缓存了
    

    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@".mp3"];
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
 
    
    [self.player prepareToPlay];
    [self.player play];
    //设置锁屏仍能继续播放
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance] setActive: YES error: nil];
    
    return self.player;
}

-(void)pauseMusic:(NSString *)filename {
    if (filename == nil || filename.length == 0) return;
    AVAudioPlayer *player = self.musicPlayers[filename];
    if ([player isPlaying]) {
        [player pause];
    }
}

-(void)stopMusic:(NSString *)filename {
    if (filename == nil || filename.length == 0) return;
    AVAudioPlayer *player = self.musicPlayers[filename];
    [player stop];
    [self.musicPlayers removeObjectForKey:filename];
}

//摧毁音效
-(void)disposeSound:(NSString *)filename {
    if(!filename) return;
    
    SystemSoundID soundID = (int)[self.soundIDs[filename] unsignedLongLongValue];
    
    if (soundID) {
        AudioServicesDisposeSystemSoundID(soundID);
        
        //移除被摧毁的音效其对象的缓存
        [self.soundIDs removeObjectForKey:filename];
    }
    
}

//播放音效
-(void)playSound:(NSString *)filename {
    if (!filename) return;

    //取出对应的音效ID
    SystemSoundID soundID = (int)[self.soundIDs[filename] unsignedLongLongValue];
    
    if (!soundID) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:filename withExtension:nil];
        if (!url) return;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &soundID);
        self.soundIDs[filename] = @(soundID);
    }
    //播放
    AudioServicesPlaySystemSound(soundID);
}


+(instancetype)musicAudionPlayer {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [[GeelyMusicAudioManager alloc] init];
        instance_.musicPlayer = [[AVPlayer alloc] init];
        //后台播放
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    });
    return instance_;
}

-(AVPlayer *)setMusicData:(NSString *)string {
    [self updatePlayerItem:string];
    return instance_.musicPlayer;
}

-(void)updatePlayerItem:(NSString *)fileName {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@".mp3"];
    playerItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:path]];
    [self.musicPlayer replaceCurrentItemWithPlayerItem:playerItem];
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self monitoringPlayback:playerItem];   //监听播放状态
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [self.musicPlayer play];
}

-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
    if (playMode == AudioPlayerModeSinglePlay) {
        playerItem = [notification object];
        [playerItem seekToTime:kCMTimeZero];
        [self.musicPlayer play];
    }else{
//        [self nextIndexAdd];
//        [self updateAudioPlayer];
    }
}

-(void)monitoringPlayback:(AVPlayerItem *)item {
//    __block __weak GeelyMusicAudioManager *weakself = self;
    //每秒执行30次
    _playTimeObserver = [self.musicPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 30) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        //计算当前在第几秒
//        float currentPlayTime = (double)item.currentTime.value/item.currentTime.timescale;
        //更新slider
    }];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    AVPlayerItem *item = (AVPlayerItem *)object;
    if ([keyPath isEqualToString:@"status"]) {
        if ([playerItem status] == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayerStatusReadyToPlay");
            CMTime duration = item.duration;// 获取视频总长度
            CMTimeGetSeconds(duration);
//            [self setMaxDuratuin:CMTimeGetSeconds(duration)];
//            [self play];
        }else if([playerItem status] == AVPlayerStatusFailed) {
            NSLog(@"AVPlayerStatusFailed");
//            [self stop];
        }
    }
}

@end
