//
//  GeelyMusciViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/20.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMusciViewController.h"

#import "GeelyMusicTableViewCell.h"
#import "GeelyMusicAudioManager.h"

#import "GeelyFmAmView.h"
#import "GelelyLeftContainsView.h"
#import "GeelyCallViewController.h"
#import "GeelySettingViewController.h"

@interface GeelyMusciViewController () <UITableViewDelegate,GeelyLeftContainsDelegate,UITableViewDataSource> {
    UIScrollView *scrollView_;
    UITableView *tableView_;
    
    UIButton *nextMusicBtn;
    UIButton *stopMusicBtn;
    UIButton *backMusciBtn;
    NSMutableArray *buttons;
    GeelyMusicAudioManager *manager;
    BOOL music;
    NSMutableArray *buttons_array;
    GelelyLeftContainsView *leftView;
    MainRequest *mainRequest;
    UIImageView *contentImage;
    MainRequest *mainRequest1;
    
    UIView *forTopShow;
}
@property (weak, nonatomic) IBOutlet UIView *contentView;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLeftContains;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollLeftContains;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topLeftContains;

@end

@implementation GeelyMusciViewController

-(void)swipeGesture:(UISwipeGestureRecognizer *)ges {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

    scrollView_ = (UIScrollView *)[self.view viewWithTag:98712];
    
    forTopShow = [[[NSBundle mainBundle] loadNibNamed:@"forshow" owner:self options:nil]firstObject];
    forTopShow.frame = CGRectMake(133, 266-61.5, 857.5, 0);
    forTopShow.backgroundColor = [UIColor clearColor];
    forTopShow.alpha = 0;
    [self.view addSubview:forTopShow];
    leftView = [[GelelyLeftContainsView alloc] initWithFrame:CGRectMake(0, 0, 82, 492-57)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.tableView_.delegate = self;
    [self.contentView addSubview:leftView];

    [UIView animateWithDuration:.5f animations:^{
        forTopShow.frame = CGRectMake(133, 266, 857.5, 61.5);
        forTopShow.alpha = 1;
    } completion:^(BOOL finished) {
        UISwipeGestureRecognizer *swipeG = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
        swipeG.direction = UISwipeGestureRecognizerDirectionRight;
        [self.view addGestureRecognizer:swipeG];
        
        //音乐播放
        UIView *view_first = [[[NSBundle mainBundle] loadNibNamed:@"musicScrollFirst" owner:self options:nil]firstObject];
        view_first.frame = CGRectMake(0, 0, 1228, 364.5);
        view_first.backgroundColor = [UIColor clearColor];
        [scrollView_ addSubview:view_first];
        
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
        
        scrollView_.pagingEnabled = YES;
        scrollView_.scrollEnabled = NO;
        scrollView_.showsVerticalScrollIndicator = NO;
        scrollView_.showsHorizontalScrollIndicator = NO;
        scrollView_.contentSize = CGSizeMake(1228*3, 364.5*2);
        
        //电台
        UIView *view_sec = [[[NSBundle mainBundle] loadNibNamed:@"GeelyMediaView" owner:self options:nil]firstObject];
        view_sec.frame = CGRectMake(1228,0 , 1228, 364.5);
        view_sec.backgroundColor = [UIColor clearColor];
        [scrollView_ addSubview:view_sec];
        tableView_ = (UITableView *)[view_sec viewWithTag:103987];
        tableView_.delegate = self;
        tableView_.backgroundColor = [UIColor clearColor];
        tableView_.dataSource = self;
        tableView_.rowHeight = 45;
        tableView_.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [tableView_ registerNib:[UINib nibWithNibName:@"GeelyMusicTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellmusic"];
        buttons_array = [NSMutableArray array];
        for (int i = 101; i<106; i++) {
            UIButton *btn = (UIButton *)[forTopShow viewWithTag:i];
            btn.tag = i;
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            [buttons_array addObject:btn];
        }
        
        manager = [GeelyMusicAudioManager defaultManager];
        
        GeelyFmAmView *fm = [[GeelyFmAmView alloc] initWithFrame:CGRectMake(1228*2, 0, 1228, 364.5)];
        fm.backgroundColor = [UIColor clearColor];
        [scrollView_ addSubview:fm];
        
        view_first.alpha = 0;
        [UIView animateWithDuration:.5f animations:^{
            view_first.alpha = 1;
        }];

    }];
    
    
    // Do any additional setup after loading the view from its nib.
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

-(void)btnAction:(UIButton *)btn {
    NSLog(@"进来了点击");
    NSInteger index = btn.tag - 100;
    switch (index) {
        case 1:
        {
            UIButton *btn = buttons_array[3];
            [btn setBackgroundImage:[UIImage imageNamed:@"音频检索"] forState:UIControlStateNormal];
            scrollView_.contentOffset = CGPointMake(0, 0);
        }
            break;
        case 4:
        {
            scrollView_.contentOffset = CGPointMake(1228, 0);
        }
            break;
        case 2:
        {
            UIButton *btn = buttons_array[3];
            [btn setBackgroundImage:[UIImage imageNamed:@"电台列表musci"] forState:UIControlStateNormal];
            scrollView_.contentOffset = CGPointMake(1228*2, 0);
            
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

#pragma mark tableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeelyMusicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellmusic" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }else if (indexPath.row == 1) {
        [UIView animateWithDuration:.3f animations:^{
            self.topLeftContains.constant = self.topLeftContains.constant+3400;
            self.scrollLeftContains.constant = self.scrollLeftContains.constant+340;
        }];
    }
}

-(void)geelySecTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        GeelyCallViewController *call = [[GeelyCallViewController alloc] init];
        [self.navigationController pushViewController:call animated:NO];
    }else if (indexPath.row == 3) {
        GeelySettingViewController *set = [[GeelySettingViewController alloc] init];
        [self.navigationController pushViewController:set animated:NO];
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
