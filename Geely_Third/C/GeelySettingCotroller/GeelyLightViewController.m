//
//  GeelyLightViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/14.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyLightViewController.h"

@interface GeelyLightViewController () {
    NSMutableArray *arr;
    UIImageView *im;
}

@end

@implementation GeelyLightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    WithImage:[UIImage imageNamed:@"12.3_ts_comfort_setting_energy_20161009_4_01"]
    UIImageView *da = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"12.3_ts_comfort_setting_energy_20161009_4_0111"]];
    da.frame = CGRectMake(0, 0, 1228, 435);
    [self.scrollView_ addSubview:da];
    
    im = [[UIImageView alloc] init];
    im.frame = CGRectMake(-50, 0, 1228, 435);
    im.contentMode = UIViewContentModeScaleAspectFill;
    [self.scrollView_ addSubview:im];
    arr = [NSMutableArray array];
    
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
//    []
    
    if ([SingleModel sharedInstance].energyFlowDatas.count>0) {
        [im startImageSequenceWithArray: [SingleModel sharedInstance].energyFlowDatas repeatCount:1000000 duration:1.5];
    }else{
        [NSThread detachNewThreadSelector:@selector(asyncTheadAction) toTarget:self withObject:nil];

    }
    
//    self.childContentImageView.image = [UIImage imageNamed:@"12.3_ts_comfort_setting_energy_20161009_4_01"];
    // Do any additional setup after loading the view from its nib.
}

-(void)volumeAdd{
    [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
    
    [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    }];
    
//    if (vvlioce.volume<=1) {
        volume = volume+0.1;
        vvlioce.volume = volume;
        //        [vv_bottom.vv autoMakeViewFrame:vvlioce.volume*2];
//    }
}

-(void)volumeLes {
    if (vvlioce.volume>=0) {
        volume = volume-0.1;
        vvlioce.volume = volume;
        //        [vv_bottom.vv autoMakeViewFrame:vvlioce.volume*2];
        
        if (vvlioce.volume == 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            
            [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@0] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
            
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            
            [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
            
        }
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

-(void)asyncTheadAction{
    
    if ([SingleModel sharedInstance].energyFlowDatas.count == 0) {
        
        for (int i = 0; i<=73; i++) {
            if (i<10) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"能量流动_0000%d",i]];
                [ [SingleModel sharedInstance].energyFlowDatas addObject:image];
            }else{
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"能量流动_000%d",i]];
                [ [SingleModel sharedInstance].energyFlowDatas addObject:image];
            }
        }
        [im startImageSequenceWithArray: [SingleModel sharedInstance].energyFlowDatas repeatCount:1000000 duration:1.5];
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
