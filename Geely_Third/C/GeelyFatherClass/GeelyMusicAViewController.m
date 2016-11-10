//
//  GeelyMusicAViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMusicAViewController.h"

#import "GeelySettingAViewController.h"
#import "GeelyMusicAudioManager.h"
#import "UIScrollView+AnimationOffSet.h"
#import "GeelyFmAmView.h"

@interface GeelyMusicAViewController () {
    UIImageView *contentImage;
    UIButton *nextMusicBtn;
    UIButton *stopMusicBtn;
    UIButton *backMusciBtn;
    NSMutableArray *buttons;
    GeelyMusicAudioManager *manager;
    BOOL music;
    MainRequest *mainRequest;
    MainRequest *mainRequest1;
    NSMutableArray *buttons_array;
}

@end

@implementation GeelyMusicAViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button_volume_ = [[UIButton alloc] initWithFrame:CGRectMake(WWWWWWWWWWW/2 - 160, HHHHHHHHHHH-180, 60, 60)];
    button_volume_.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button_volume_];
    [button_volume_ addTarget:self action:@selector(volumeLes) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button_vo = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+280, button_volume_.frame.origin.y, 60, 60)];
    button_vo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button_vo];
    
    UIButton *home = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+60+40, HHHHHHHHHHH-180, 120, 70)];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    [home addTarget:self action:@selector(btnAction1:) forControlEvents:UIControlEventTouchUpInside];
    
    music = YES;
    mainRequest = [[MainRequest alloc] init];
    mainRequest.requestMusic = [[Music alloc] init];
    mainRequest.requestVolume = [[Volume alloc] init];
    mainRequest.requestMute = [[Mute alloc] init];
    mainRequest.requestPhone = [[Phone alloc] init];
    mainRequest.requestRadio = [[Radio alloc] init];
    mainRequest.requestMute = [[Mute alloc] init];
    
    mainRequest1 = [[MainRequest alloc] init];
    mainRequest1.requestMusic = [[Music alloc] init];
    mainRequest1.requestVolume = [[Volume alloc] init];
    mainRequest1.requestMute = [[Mute alloc] init];
    mainRequest1.requestPhone = [[Phone alloc] init];
    mainRequest1.requestRadio = [[Radio alloc] init];
    mainRequest1.requestMute = [[Mute alloc] init];
    
    self.dataSource = self;
    self.contentImageView.image = [UIImage imageNamed:@"12.3_ts_comfort_audio-text_20160928"];
    [self addFixedView];
    
    __block __weak GeelyMusicAViewController *weakself = self;
    
    [self addImageViewAnimate:^{
        UIView *view_first = [[[NSBundle mainBundle] loadNibNamed:@"musicScrollFirst" owner:weakself options:nil]firstObject];
        view_first.backgroundColor = [UIColor clearColor];
        view_first.frame = CGRectMake(0, 0, weakself.contentScrollView.bounds.size.width, weakself.contentScrollView.bounds.size.height);
        [weakself.contentScrollView addSubview:view_first];
        
        UILabel *label_eq = (UILabel *)[view_first viewWithTag:71771];
        label_eq.textColor = RGBAAAABBB(219, 191, 126, 1);
        contentImage = (UIImageView *)[view_first viewWithTag:20998];
        
        if ([SingleModel sharedInstance].isMusic) {
            contentImage.image = [UIImage imageNamed:@"暂停musciBG"];
        }else{
            contentImage.image = [UIImage imageNamed:@"icon213123iundoinadoin1"];
        }
        
        backMusciBtn = (UIButton *)[view_first viewWithTag:2010];
        stopMusicBtn = (UIButton *)[view_first viewWithTag:2011];
        nextMusicBtn = (UIButton *)[view_first viewWithTag:2012];
        
        buttons = [NSMutableArray arrayWithObjects:backMusciBtn,stopMusicBtn,nextMusicBtn, nil];
        
        for (int i = 0; i<buttons.count; i++) {
            UIButton *btn = buttons[i];
            btn.tag = i;
            [btn addTarget:self action:@selector(musicControl:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
        GeelyFmAmView *fm = [[GeelyFmAmView alloc] initWithFrame:CGRectMake(1228, 0, 1228, 364.5)];
        fm.backgroundColor = [UIColor clearColor];
        [self.contentScrollView addSubview:fm];
        
        
        view_first.alpha = 0;
        [UIView animateWithDuration:.5f animations:^{
            view_first.alpha = 1;
        }];
    }];
}

-(void)volumeAdd{
    [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
    mainRequest.requestVolume.type = @2;
    mainRequest.requestPhone.type = @0;
    mainRequest.requestRadio.type = @0;
    mainRequest.requestVoice.type = @0;
    mainRequest.requestMusic.type = @0;
    mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
    [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    }];
    if (vvlioce.volume<=1) {
        volume = volume+0.1;
        vvlioce.volume = volume;
        //        [vv_bottom.vv autoMakeViewFrame:vvlioce.volume*2];
    }
}

-(void)volumeLes {
    if (vvlioce.volume>=0) {
        volume = volume-0.1;
        vvlioce.volume = volume;
        //        [vv_bottom.vv autoMakeViewFrame:vvlioce.volume*2];
        
        if (vvlioce.volume == 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            mainRequest.requestVolume.type = @0;
            mainRequest.requestPhone.type = @0;
            mainRequest.requestRadio.type = @0;
            mainRequest.requestVoice.type = @0;
            mainRequest.requestMusic.type = @0;
            mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
            [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            mainRequest.requestVolume.type = @2;
            mainRequest.requestPhone.type = @0;
            mainRequest.requestRadio.type = @0;
            mainRequest.requestVoice.type = @0;
            mainRequest.requestMusic.type = @0;
            mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
            [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }
    }
}

#pragma mark GeelyDisplayPowerViewDelegate
-(void)showDisplayView:(GeelyDisplayPowerView *)view {
    GeelyScreenView *screenView = [[GeelyScreenView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [screenView showAnimate];
}

-(void)showPowerView:(GeelyDisplayPowerView *)view  {
    GeelyPowerDisplayView *vb = [[GeelyPowerDisplayView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [vb showAnimation];
}


-(void)btnAction1:(UIButton *)btn {
    [self showPopAnimation];
}


-(void)musicControl:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
        {
            
            
            
            [manager.player stop];
            [manager playMusic:@"Sam Smith-Writing's On The Wall"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            mainRequest.requestMusic.type = @1;
            mainRequest.requestPhone.type = @0;
            mainRequest.requestVoice.type = @0;
            mainRequest.requestVolume.type = @1;
            mainRequest.requestRadio.type = @0;
            mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
            [mainRequest startWithBlockSuccess:^(__kindof MainRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
            
        }
            break;
        case 1:
        {
            if (manager.player.playing) {
                
                [manager.player pause];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
                mainRequest.requestMusic.type = @0;
                mainRequest.requestRadio.type = @0;
                mainRequest.requestPhone.type = @0;
                mainRequest.requestVoice.type = @0;
                mainRequest.requestVolume.type = @1;
                mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
                
                [mainRequest startWithBlockSuccess:^(__kindof MainRequest *request) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
                } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
                }];
                contentImage.image = [UIImage imageNamed:@"icon213123iundoinadoin1"];
            }else{
                
                if ([SingleModel sharedInstance].isMusic) {
                    [manager.player play];
                }else{
                    [manager playMusic:@"Sam Smith-Writing's On The Wall"];
                }
                contentImage.image = [UIImage imageNamed:@"暂停musciBG"];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
                mainRequest.requestMusic.type = @1;
                mainRequest.requestPhone.type = @0;
                mainRequest.requestRadio.type = @0;
                mainRequest.requestVoice.type = @0;
                mainRequest.requestVolume.type = @1;
                mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
                
                [mainRequest startWithBlockSuccess:^(__kindof MainRequest *request) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
                } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
                }];
            }
        }
            break;
        case 2:
        {
            [manager.player stop];
            [manager playMusic:@"Sam Smith-Writing's On The Wall"];
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            mainRequest.requestMusic.type = @1;
            mainRequest.requestPhone.type = @0;
            mainRequest.requestVoice.type = @0;
            mainRequest.requestRadio.type = @0;
            mainRequest.requestVolume.type = @1;
            mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
            
            [mainRequest startWithBlockSuccess:^(__kindof MainRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }
            break;
        default:
            break;
    }
}


-(void)btnAction{
    GeelySettingAViewController *vc = [[GeelySettingAViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

#pragma mark DataSource
-(UIImageView *)geelyTopAnimateImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    imageView.backgroundColor = [UIColor orangeColor];
    return imageView;
}

-(UIView *)geelyTopAnimateView {
    UIView *topView = [[[NSBundle mainBundle] loadNibNamed:@"forshow" owner:self options:nil]firstObject];
    topView.frame = CGRectMake(82+50, 0, 857.5, 61.5);
    topView.backgroundColor = [UIColor clearColor];
    
    buttons_array = [NSMutableArray array];
    for (int i = 101; i<106; i++) {
        UIButton *btn = (UIButton *)[topView viewWithTag:i];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [buttons_array addObject:btn];
    }
    
    return topView;
}

-(void)btnAction:(UIButton *)btn {
    NSLog(@"进来了点击");
    NSInteger index = btn.tag - 100;
    switch (index) {
        case 1:
        {
            UIButton *btn = buttons_array[3];
            [btn setBackgroundImage:[UIImage imageNamed:@"音频检索"] forState:UIControlStateNormal];
            [self.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 0)];
        }
            break;
        case 4:
        {
//            self.
        }
            break;
        case 2:
        {
            UIButton *btn = buttons_array[3];
            [btn setBackgroundImage:[UIImage imageNamed:@"电台列表musci"] forState:UIControlStateNormal];
            [self.contentScrollView scrollAnimationToOffSet:CGPointMake(1228, 0)];
            
#pragma mark 电台操作
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            
            mainRequest1.requestMusic.type = @0;
            mainRequest1.requestPhone.type = @0;
            mainRequest1.requestVoice.type = @0;
            mainRequest1.requestRadio.type = @1;
            mainRequest1.requestVolume.type = @1;
            mainRequest1.requestMute = [SingleModel sharedInstance].muteSingle;
            
            
            [mainRequest1 startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
            
        }
            break;
        default:
            break;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
