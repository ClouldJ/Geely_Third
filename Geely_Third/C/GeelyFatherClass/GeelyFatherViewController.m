//
//  GeelyFatherViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyFatherViewController.h"

#import "DemoView.h"
#import "GeelySettingAViewController.h"
#import "GeelyLittleShowView.h"
#import "UIScrollView+AnimationOffSet.h"
#import "GeelyCallAViewController.h"
#import "GeelyMusicAViewController.h"


@interface GeelyFatherViewController ()  {
    GeelyLittleShowView *leftFrameScroll;
    UIView *topView;
    NSIndexPath *indexPathLast;
    GeelyScreenView *screenView;
}

@end

@implementation GeelyFatherViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(littleShowDismiss:) name:DISMISS object:nil];
}

-(void)littleShowDismiss:(NSNotification *)na {
        if ([na.userInfo[@"dismiss"] isEqualToString:@"left"]) {
            CGPoint pp = leftFrameScroll.contentScrollView.contentOffset;
            [scrollViewContent geelyContentViewDismiss:^{
                leftFrameScroll.frame = CGRectMake(82, 0, 0, 492-57);
                leftFrameScroll.show = NO;
                self.contentImageView.frame = CGRectMake(340-340, 0, 1310, 492);
                leftFrameScroll.contentScrollView.frame = CGRectMake(0, 0, 0, 435);
                topView.frame = CGRectMake(topView.frame.origin.x-340, topView.frame.origin.y, topView.frame.size.width, topView.frame.size.height);
            } successful:^{
                leftFrameScroll.contentScrollView.contentOffset = pp;
            }];
        }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    vvlioce = [[MPMusicPlayerController alloc] init];
    volume = vvlioce.volume;
    
    mainRequest = [[MainRequest alloc] init];
    mainRequest.requestVolume = [[Volume alloc] init];
    mainRequest.requestVoice = [[Voice alloc] init];
    mainRequest.requestPhone = [[Phone alloc] init];
    mainRequest.requestMusic = [[Music alloc] init];
    mainRequest.requestRadio = [[Radio alloc] init];
    mainRequest.requestMute = [[Mute alloc] init];

    
//    UIButton *button_volume_ = [[UIButton alloc] initWithFrame:CGRectMake(WWWWWWWWWWW/2 - 160, HHHHHHHHHHH-180, 60, 60)];
//    button_volume_.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:button_volume_];
//    [button_volume_ addTarget:self action:@selector(volumeLes) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIButton *button_vo = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+280, button_volume_.frame.origin.y, 60, 60)];
//    button_vo.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:button_vo];
//    
//    UIButton *home = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+60+40, HHHHHHHHHHH-180, 120, 70)];
//    home.backgroundColor = [UIColor redColor];
//    [self.view addSubview:home];
//    [home addTarget:self action:@selector(btnAction1:) forControlEvents:UIControlEventTouchUpInside];
//    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"0930-IPAD-底图V2"];
    [self.view addSubview:imageView];
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake((WWWWWWWWWWW - 1310)/2, (HHHHHHHHHHH - 492)/2, 1310, 492)];
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.contentView];
    
    self.contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1310, 492)];
    self.contentImageView.userInteractionEnabled = YES;
    self.contentImageView.backgroundColor = [UIColor clearColor];
    self.contentImageView.image = [UIImage imageNamed:@"Geely_father_bg_effert"];
    [self.contentView addSubview:self.contentImageView];
    
    
    
    scrollViewContent = [[UIView alloc] initWithFrame:CGRectMake(82, 61.5, 1310-82, 492-57-61.5)];
    scrollViewContent.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:scrollViewContent];
    
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1310-82, 492-57-61.5)];
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.backgroundColor = [UIColor clearColor];
    [scrollViewContent addSubview:self.contentScrollView];
    
    // Do any additional setup after loading the view.
}

#pragma mark setter


-(void)addFixedView {
    leftView = [[GelelyLeftContainsView alloc] initWithFrame:CGRectMake(0, 0, 82, 492-57)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.tableView_.delegate = self;
    [self.contentView addSubview:leftView];
    
    leftFrameScroll = [[GeelyLittleShowView alloc] initWithFrame:CGRectMake(82, 0, 0, 492-57)];
    leftFrameScroll.backgroundColor = [UIColor clearColor];
    [leftFrameScroll addScrollView];
    [self.contentView addSubview:leftFrameScroll];
    
    DemoView *demo = [[DemoView alloc] initWithFrame:CGRectMake(0, (492-57), 1310, 57)];
    demo.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:demo];
}

-(void)addImageViewAnimate:(TopViewAnimationSuccessful)animation {
    topView = [self.dataSource geelyTopAnimateView];
    [self.contentView addSubview:topView];
    
    [topView geelyAirborneViewAnimation:^{
        NSLog(@"完成");
        animation();
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)btnAction1:(UIButton *)btn {
    NSLog(@"1");
}

- (IBAction)homeBtn:(id)sender {
    NSLog(@"首页");
    GeelyDisplayPowerView *cc = [[GeelyDisplayPowerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cc.delegate = self;
    [cc showAnimation];
}
- (IBAction)home:(id)sender {
    NSLog(@"首页");
    GeelyDisplayPowerView *cc = [[GeelyDisplayPowerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cc.delegate = self;
    [cc showAnimation];
}
- (IBAction)vlumeAdd:(id)sender {
    NSLog(@"音量加");
}
- (IBAction)volumeLess:(id)sender {
    NSLog(@"音量减");
}
- (IBAction)less:(id)sender {
}



#pragma mark GeelyLeftContainsDelegate
-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeMediaPlayer" object:nil];
    if (indexPath.row == 4) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }else {
        if (!leftFrameScroll.show) {
            indexPathLast =[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            [scrollViewContent geelyContentViewFrameAnimation:^{
                leftFrameScroll.frame = CGRectMake(82, 0, 340, 492-57);
                leftFrameScroll.show = YES;
                self.contentImageView.frame = CGRectMake(340, 0, 1310, 492);
                leftFrameScroll.contentScrollView.frame = CGRectMake(0, 0, 340, 435);
                topView.frame = CGRectMake(topView.frame.origin.x+340, topView.frame.origin.y, topView.frame.size.width, topView.frame.size.height);
            } successful:^{
                //TODO   侧边栏完全显示后
                if (indexPath.row == 1) {
                    [leftFrameScroll.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 0)];
                }else if (indexPath.row == 2) {
                    [leftFrameScroll.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 435*2)];
                }else if (indexPath.row == 3) {
                    [leftFrameScroll.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 435*5)];
                }
                
            }];
        }else{
            if ((indexPathLast.row !=indexPath.row) && (indexPath.row!=[SingleModel sharedInstance].indexPathHome.row)) {
                if (indexPath.row == 1) {
                    [leftFrameScroll.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 0)];
                }else if (indexPath.row == 2) {
                    [leftFrameScroll.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 435*2)];
                }else if (indexPath.row == 3) {
                    [leftFrameScroll.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 435*5)];
                }
                indexPathLast =[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            }
        }
    }
}

-(void)geelySecTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeMediaPlayer" object:nil];
    if (indexPath.row == 1) {
        GeelyMusicAViewController *mm = [[GeelyMusicAViewController alloc] init];
        [self.navigationController pushViewController:mm animated:NO];
    }else if (indexPath.row == 3) {
        GeelySettingAViewController *call = [[GeelySettingAViewController alloc] init];
        [self.navigationController pushViewController:call animated:NO];
    }else if (indexPath.row == 2) {
        GeelyCallAViewController *setting = [[GeelyCallAViewController alloc] init];
        [self.navigationController pushViewController:setting animated:NO];
    }else if (indexPath.row == 4) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
}


-(void)dealloc {
    NSLog(@"父类消失");
    [SingleModel sharedInstance].isRel = NO;
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
