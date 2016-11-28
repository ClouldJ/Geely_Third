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
#import "GeelyMusicTableViewCell.h"

@interface GeelyMusicAViewController () <UITableViewDelegate,UITableViewDataSource> {
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
    UITableView *tableView_;
    BOOL fmAm;
}

@end

@implementation GeelyMusicAViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    fmAm = YES;
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
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoRootVC)];
    
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnAction1)];
    
    [tapGR requireGestureRecognizerToFail:longPressGR];
    
    [home addGestureRecognizer:tapGR];
    [home addGestureRecognizer:longPressGR];
    
    manager = [GeelyMusicAudioManager defaultManager];
    music = YES;

    
    self.dataSource = self;
    self.contentScrollView.delegate = self;
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.scrollEnabled = YES;
    self.contentScrollView.contentSize = CGSizeMake(1228*2, 0);
    self.contentScrollView.bounces = NO;
    self.contentImageView.image = [UIImage imageNamed:@"12.3_ts_comfort_audio-text_20160928"];
    [self addFixedView];
    
    __block __weak GeelyMusicAViewController *weakself = self;
    
    [self addImageViewAnimate:^{
        UIView *view_first = [[[NSBundle mainBundle] loadNibNamed:@"musicScrollFirst" owner:weakself options:nil]firstObject];
        view_first.backgroundColor = [UIColor clearColor];
        view_first.frame = CGRectMake(0, 0, weakself.contentScrollView.bounds.size.width, weakself.contentScrollView.bounds.size.height);
        [weakself.contentScrollView addSubview:view_first];
        
        UIButton *storeBtn = (UIButton *)[view_first viewWithTag:9527];
        [storeBtn setBackgroundImage:[UIImage imageNamed:@"收藏-拷贝-2"] forState:UIControlStateNormal];
        [storeBtn setBackgroundImage:[UIImage imageNamed:@"收藏-拷贝-2_music"] forState:UIControlStateSelected];
        [storeBtn addTarget:weakself action:@selector(storeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
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
        
        UIView *view_sec = [[[NSBundle mainBundle] loadNibNamed:@"GeelyMediaView" owner:self options:nil]firstObject];
        view_sec.frame = CGRectMake(1228*2,0 , 1228, 364.5);
        view_sec.backgroundColor = [UIColor clearColor];
        [self.contentScrollView addSubview:view_sec];
        tableView_ = (UITableView *)[view_sec viewWithTag:103987];
        tableView_.delegate = self;
        tableView_.backgroundColor = [UIColor clearColor];
        tableView_.dataSource = self;
        tableView_.rowHeight = 45;
        tableView_.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [tableView_ registerNib:[UINib nibWithNibName:@"GeelyMusicTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellmusic"];
        
        view_first.alpha = 0;
        [UIView animateWithDuration:.2f animations:^{
            view_first.alpha = 1;
        }];
    }];
}

-(void)storeBtnAction:(UIButton *)btn {
    NSLog(@"搜藏按钮");
    btn.selected = !btn.selected;
}

-(void)volumeAdd{
    [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
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
            [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@0] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }else{
            [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
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


-(void)btnAction1{
    [self showPopAnimation];
}
- (void)gotoRootVC{
    [self.navigationController popToRootViewControllerAnimated:NO];
    [SingleModel sharedInstance].indexPathHome = nil;
}

-(void)musicControl:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
        {
            
            [manager.player stop];
            [manager playMusic:@"Sam Smith-Writing's On The Wall"];
            
            [[[SingleModel sharedInstance] singleMainRequest:@"Music" type_value:@1] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
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
                
                [[[SingleModel sharedInstance] singleMainRequest:@"Music" type_value:@0] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
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
                
                [[[SingleModel sharedInstance] singleMainRequest:@"Music" type_value:@1] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
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
            [[[SingleModel sharedInstance] singleMainRequest:@"Music" type_value:@1] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
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
    topView.frame = CGRectMake(82+20, 0, 857.5, 61.5);
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
            [btn setBackgroundImage:[UIImage imageNamed:@"music_hui_s"] forState:UIControlStateNormal];

            UIButton *radio_btn = buttons_array[1];
            [radio_btn setBackgroundImage:[UIImage imageNamed:@"diantai_hui"] forState:UIControlStateNormal];
            
            fmAm = YES;
            UIButton *btn = buttons_array[3];
            [btn setBackgroundImage:[UIImage imageNamed:@"ypjs_hui"] forState:UIControlStateNormal];
            [self.contentScrollView scollAnimationAlphaOffSet:CGPointMake(0, 0)];
            
            UIButton *btn3 = buttons_array[2];
            UIButton *btn4 = buttons_array[4];
            [btn3 setBackgroundImage:[UIImage imageNamed:@"dqbf_dianji"] forState:UIControlStateNormal];
            [btn4 setBackgroundImage:[UIImage imageNamed:@"wdsc_hui"] forState:UIControlStateNormal];
            
        }
            break;
        case 4:
        {
            
            UIButton *rightNow = buttons_array[2];
            [rightNow setBackgroundImage:[UIImage imageNamed:@"rightNowPlaying"] forState:UIControlStateNormal];
            if (fmAm) {
                [btn setBackgroundImage:[UIImage imageNamed:@"ypjs_dianjis"] forState:UIControlStateNormal];
                [self.contentScrollView scrollAnimationToOffSet:CGPointMake(1228*2, 0)];
            }else{
                [btn setBackgroundImage:[UIImage imageNamed:@"diantai_dianji_lists"] forState:UIControlStateNormal];
            }
            
            UIButton *btn_4 = buttons_array[4];
            [btn_4 setBackgroundImage:[UIImage imageNamed:@"wdsc_hui"] forState:UIControlStateNormal];
        }
            break;
        case 2:
        {
            UIButton *music_btn = buttons_array[0];
            [music_btn setBackgroundImage:[UIImage imageNamed:@"music_hui"] forState:UIControlStateNormal];
            
            UIButton *btn3 = buttons_array[2];
            UIButton *btn4 = buttons_array[4];
            [btn3 setBackgroundImage:[UIImage imageNamed:@"dqbf_dianji"] forState:UIControlStateNormal];
            [btn4 setBackgroundImage:[UIImage imageNamed:@"wdsc_hui"] forState:UIControlStateNormal];
            //TODO,改变电台颜色
            [btn setBackgroundImage:[UIImage imageNamed:@"diantai_hui_s"] forState:UIControlStateNormal];
            
            fmAm = NO;
            UIButton *btn1 = buttons_array[3];
            [btn1 setBackgroundImage:[UIImage imageNamed:@"diantai_hui_list"] forState:UIControlStateNormal];
            [self.contentScrollView scollAnimationAlphaOffSet:CGPointMake(1228, 0)];
//            [self.contentScrollView scrollAnimationToOffSet:CGPointMake(1228, 0)];
            
#pragma mark 电台操作
            [[[SingleModel sharedInstance] singleMainRequest:@"Radio" type_value:@1] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }
            break;
        case 3:
        {
            if (fmAm) {
                [self.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 0)];
            }else{
                [self.contentScrollView scrollAnimationToOffSet:CGPointMake(1228, 0)];
            }
            [btn setBackgroundImage:[UIImage imageNamed:@"dqbf_dianji"] forState:UIControlStateNormal];
            UIButton *btn_3 = buttons_array[3];
            if (fmAm) {
                [btn_3 setBackgroundImage:[UIImage imageNamed:@"ypjs_hui"] forState:UIControlStateNormal];
            }else{
                [btn_3 setBackgroundImage:[UIImage imageNamed:@"diantai_hui_list"] forState:UIControlStateNormal];
            }
            UIButton *btn_4 = buttons_array[4];
            [btn_4 setBackgroundImage:[UIImage imageNamed:@"wdsc_hui"] forState:UIControlStateNormal];
        }
            break;
        case 5:
        {
            [btn setBackgroundImage:[UIImage imageNamed:@"wdsc_dianji"] forState:UIControlStateNormal];
            UIButton *btn2 = buttons_array[2];
            UIButton *btn3 = buttons_array[3];
            [btn2 setBackgroundImage:[UIImage imageNamed:@"rightNowPlaying"] forState:UIControlStateNormal];
            if (fmAm) {
                [btn3 setBackgroundImage:[UIImage imageNamed:@"ypjs_hui"] forState:UIControlStateNormal];
            }else{
                [btn3 setBackgroundImage:[UIImage imageNamed:@"diantai_hui_list"] forState:UIControlStateNormal];
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark scrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSLog(@"移动的距离:%f",scrollView.contentOffset.x);
    if (scrollView.contentOffset.x == 1228) {
        UIButton *music_btn = buttons_array[0];
        [music_btn setBackgroundImage:[UIImage imageNamed:@"music_hui"] forState:UIControlStateNormal];
        UIButton *btn = buttons_array[1];
        [btn setBackgroundImage:[UIImage imageNamed:@"diantai_hui_s"] forState:UIControlStateNormal];
        
        fmAm = NO;
        UIButton *btn1 = buttons_array[3];
        [btn1 setBackgroundImage:[UIImage imageNamed:@"diantai_hui_list"] forState:UIControlStateNormal];
    }else{
        UIButton *music_btn = buttons_array[0];
        [music_btn setBackgroundImage:[UIImage imageNamed:@"music_hui_s"] forState:UIControlStateNormal];
        UIButton *btn = buttons_array[1];
        [btn setBackgroundImage:[UIImage imageNamed:@"diantai_hui"] forState:UIControlStateNormal];
        
        fmAm = YES;
        UIButton *btn1 = buttons_array[3];
        [btn1 setBackgroundImage:[UIImage imageNamed:@"ypjs_hui"] forState:UIControlStateNormal];
    }
}

#pragma mark tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeelyMusicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellmusic" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
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
