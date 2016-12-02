//
//  GeelyMapViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 2016/12/2.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMapViewController.h"

@interface GeelyMapViewController ()

@end

@implementation GeelyMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"12.3_ts_comfort_navigation_20161202_01"]];
    im.frame = CGRectMake(0, 0, 1310-82, 435);
    [self.scrollView_ addSubview:im];
    
    volume = [SettingSound getSystemVolumValue];
    
    
    UIButton *button_volume_ = [[UIButton alloc] initWithFrame:CGRectMake(WWWWWWWWWWW/2 - 160, HHHHHHHHHHH-180, 60, 60)];
    button_volume_.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button_volume_];
    [button_volume_ addTarget:self action:@selector(volumeLes6) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button_vo = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+280, button_volume_.frame.origin.y, 60, 60)];
    button_vo.backgroundColor = [UIColor clearColor];
    [button_vo addTarget:self action:@selector(volumeAdd6) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_vo];
    
    UIButton *home = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+60+40, HHHHHHHHHHH-180, 120, 70)];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoRootVC)];
    
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnAction1)];
    
    [tapGR requireGestureRecognizerToFail:longPressGR];
    
    [home addGestureRecognizer:tapGR];
    [home addGestureRecognizer:longPressGR];
    
    // Do any additional setup after loading the view.
}
-(void)volumeAdd6{
    if (volume<1) {
        volume += 0.1;
        [SettingSound setSysVolumWith:volume];
        [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
        [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        } failure:^(__kindof HGBaseRequest *request, NSError *error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        }];
    }}

-(void)volumeLes6 {
    if (volume <= 0) {
        //静音
        [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
        [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@0] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        } failure:^(__kindof HGBaseRequest *request, NSError *error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        }];
        
    }else{
        volume -= 0.1;
        [SettingSound setSysVolumWith:volume];
        [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
        [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        } failure:^(__kindof HGBaseRequest *request, NSError *error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        }];
    }
}

-(void)dealloc {
    NSLog(@"%@ child will dealloc",NSStringFromClass([self class]));
}

-(void)btnAction1{
    [self showPopAnimation];
}
- (void)gotoRootVC{
    [SingleModel sharedInstance].indexPathHome = nil;
    [self.navigationController popToRootViewControllerAnimated:NO];
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
