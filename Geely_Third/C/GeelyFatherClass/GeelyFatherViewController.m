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
#import "GeelyAutoViewController.h"


@interface GeelyFatherViewController ()  {
    GeelyLittleShowView *leftFrameScroll;
    UIView *topView;
    NSIndexPath *indexPathLast;
    GeelyScreenView *screenView;
    GeelyLeftFrameDynamicView *dynamicView;
    ;
    
    GeelyLeftFrameDynamicView *dynamicViewMusic;
    
    GeelyLeftFrameDynamicView *dynamicViewCall;
    
    GeelyLeftFrameDynamicView *dynamicViewSet;
    
    BOOL showED;
    
    DemoView *vv_bottom;
}

@end

@implementation GeelyFatherViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];


    NSLog(@"%@ will appear",NSStringFromClass([self class]));
}

#pragma mark 状态栏图标切换
-(void)iconSelected1:(NSNotification *)na {
    NSDictionary *dic = na.userInfo;
    
//    NSString *str = NSStringFromClass([[[GeelyCurrentViewController new] topViewController] class]);
    
    if ([dic[@"classCurrent"] isEqualToString:@"2"]) {
//        NSLog(@"收到通知的controller:%@",str);

        [vv_bottom.iconView btnCheckTags:[dic[@"style"] integerValue] dataIndex:[dic[@"style"] integerValue]];
        if ([dic[@"style"] integerValue] == 2) {
            [vv_bottom.iconView btnCheckTags:3 dataIndex:3];
        }
    }
}

-(void)littleShowDismiss:(NSNotification *)na {
    [scrollViewContent geelyContentViewDismiss:^{
        self.contentImageView.frame = CGRectMake(0, 0, 1310, 492);
        topView.frame = CGRectMake(topView.frame.origin.x-340, topView.frame.origin.y, topView.frame.size.width, topView.frame.size.height);
    } successful:^{
        
    }];
    [self dynamicdismissView];
    showED = NO;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(littleShowDismiss:) name:SLIDEDISMISS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iconSelected1:) name:SLIDESETTINGSTYLE object:nil];
    

    
    showED = NO;
    
//    mainRequest = [[MainRequest alloc] init];
//    mainRequest.requestVolume = [[Volume alloc] init];
//    mainRequest.requestVoice = [[Voice alloc] init];
//    mainRequest.requestPhone = [[Phone alloc] init];
//    mainRequest.requestMusic = [[Music alloc] init];
//    mainRequest.requestRadio = [[Radio alloc] init];
//    mainRequest.requestMute = [[Mute alloc] init];

    
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
    
#pragma mark 初始化需要侧滑弹出的view
    dynamicViewMusic = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(110-340, 0, 340, 435)];
    [self.contentView addSubview:dynamicViewMusic];
    
    dynamicViewSet = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(110-340, 0, 340, 435)];
    [self.contentView addSubview:dynamicViewSet];
    
    dynamicViewCall = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(110-340, 0, 340, 435)];
    [self.contentView addSubview:dynamicViewCall];
    
    //将初始化出来的侧滑视图加载到单例数据源中
    [SingleModel sharedInstance].dynamicViews1 = [NSMutableArray arrayWithObjects:dynamicViewMusic,dynamicViewCall,dynamicViewSet, nil];
    
    
    UIImageView *imageNewBg = [[UIImageView alloc] initWithFrame:CGRectMake(82-110, 0, 110, 870/2)];
    imageNewBg.userInteractionEnabled = YES;
    imageNewBg.image = [UIImage imageNamed:@"imageNewBg"];
    [self.contentView addSubview:imageNewBg];
    
    
    
    scrollViewContent = [[UIView alloc] initWithFrame:CGRectMake(82, 61.5, 1310-82, 492-57-61.5)];
    scrollViewContent.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:scrollViewContent];
    
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 1310-82, 492-57-61.5)];
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.backgroundColor = [UIColor clearColor];
    [scrollViewContent addSubview:self.contentScrollView];
    dynamicView = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(82, 0, 0, 435)];
    dynamicView.backgroundColor = [UIColor clearColor];
    dynamicView.userInteractionEnabled = YES;
    [self.contentView addSubview:dynamicView];
    
    // Do any additional setup after loading the view.
}

#pragma mark setter


-(void)addFixedView {
    leftView = [[GelelyLeftContainsView alloc] initWithFrame:CGRectMake(0, 0, 82, 492-57)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.tableView_.delegate = self;
    [self.contentView addSubview:leftView];
    
//    leftFrameScroll = [[GeelyLittleShowView alloc] initWithFrame:CGRectMake(82, 0, 0, 492-57)];
//    leftFrameScroll.backgroundColor = [UIColor clearColor];
//    [leftFrameScroll addScrollView];
//    [self.contentView addSubview:leftFrameScroll];
    
    vv_bottom = [[DemoView alloc] initWithFrame:CGRectMake(0, (492-57), 1310, 57)];
    vv_bottom.backgroundColor = [UIColor clearColor];
    UISwipeGestureRecognizer *sw_air = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureAir:)];
    sw_air.direction = UISwipeGestureRecognizerDirectionUp;
    [vv_bottom addGestureRecognizer:sw_air];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [vv_bottom addGestureRecognizer:tap];
    
    [self.contentView addSubview:vv_bottom];
    [tap requireGestureRecognizerToFail:sw_air];

}

-(void)swipeGestureAir:(UISwipeGestureRecognizer *)ss {
    
    if (ss.direction == UISwipeGestureRecognizerDirectionUp) {
        GeelyAutoViewController *va = [[GeelyAutoViewController alloc] init];
        [self.navigationController presentViewController:va animated:YES completion:nil];
    }
}

-(void)tapAction:(UITapGestureRecognizer *)tap {
    GeelyAutoViewController *va = [[GeelyAutoViewController alloc] init];
    [self.navigationController presentViewController:va animated:YES completion:nil];
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

-(void)dynamicAnimationView:(GeelyLeftFrameDynamicView *)frameDynamic {
    for (GeelyLeftFrameDynamicView *viewSingle in [SingleModel sharedInstance].dynamicViews1) {
        if (viewSingle.showSingle) {
            if (viewSingle  == frameDynamic) {
                NSLog(@"显示的就是当前view，不需要再次进行推出操作");
            }else{
                viewSingle.showSingle = NO;
                viewSingle.frame = CGRectMake(110-340-50, 0, 340, 435);
                [UIView animateWithDuration:.5f animations:^{
                    frameDynamic.frame = CGRectMake(82, 0, 340, 435);
                } completion:^(BOOL finished) {
                    frameDynamic.showSingle = YES;
                }];
            }
        }else{
            [UIView animateWithDuration:.5f animations:^{
                frameDynamic.frame = CGRectMake(82, 0, 340, 435);
            } completion:^(BOOL finished) {
                frameDynamic.showSingle = YES;
            }];
        }
    }
    
    if (!showED) {
        showED = YES;
        [scrollViewContent geelyContentViewFrameAnimation:^{
            
            self.contentImageView.frame = CGRectMake(340, 0, 1310, 492);
            topView.frame = CGRectMake(topView.frame.origin.x+340, topView.frame.origin.y, topView.frame.size.width, topView.frame.size.height);
        } successful:^{
            //TODO   侧边栏完全显示后
        }];
    }
    
}

#pragma mark GeelyLeftContainsDelegate
-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeMediaPlayer" object:nil];
//    if (!dynamicView.show) {
        switch (indexPath.row) {
            case 0:
            {
                NSLog(@"双击点击了第一个图标");
            }
                break;
            case 1:
            {
                
                [dynamicViewMusic showAnimationStyle:DYNAMIC_MUSIC finish:^(UIView *amicView) {
                    NSLog(@"音乐移动完成");
                }];
                [self dynamicAnimationView:dynamicViewMusic];
            }
                break;
            case 2:
            {
                
                [dynamicViewCall showAnimationStyle:DYNAMIC_CALLZ finish:^(UIView *amicView) {
                    NSLog(@"新动画执行完成");
                }];
                [self dynamicAnimationView:dynamicViewCall];
            }
                break;
            case 3:
            {
                [dynamicViewSet showAnimationStyle:DYNAMIC_SETTZ finish:^(UIView *amicView) {
                }];
                [self dynamicAnimationView:dynamicViewSet];
            }
                break;
            case 4:
            {
                [scrollViewContent geelyContentViewDismiss:^{
                    self.contentImageView.frame = CGRectMake(0, 0, 1310, 492);
                    topView.frame = CGRectMake(topView.frame.origin.x-340, topView.frame.origin.y, topView.frame.size.width, topView.frame.size.height);
                } successful:^{
                    
                }];
                [self dynamicdismissView];
            }
                break;
            case 5:
                break;
            default:
                break;
        }

}

-(void)dynamicdismissView{
    showED = NO;
    for (GeelyLeftFrameDynamicView *viewSingle in [SingleModel sharedInstance].dynamicViews1) {
        if (viewSingle.showSingle) {
            viewSingle.showSingle = NO;
            [UIView animateWithDuration:.5f animations:^{
                viewSingle.frame = CGRectMake(110-340-50, 0, 340, 435);
            }];
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
    [[NSNotificationCenter defaultCenter] postNotificationName:SLIDEDISMISS object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%@ will dealloc",NSStringFromClass([self class]));
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
