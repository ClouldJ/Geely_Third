//
//  GeelyModeViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/10.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyModeViewController.h"

@interface GeelyModeViewController () {
    UIImageView *imageView_contentBG;
}

@end

@implementation GeelyModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self addFixedView];
    self.view.backgroundColor = [UIColor clearColor];

    //添加背景图片
    [self bg_imageInit];
    
    
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
    
}

-(void)btnAction1{
    GeelyDisplayPowerView *cc = [[GeelyDisplayPowerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cc.delegate = self;
    [cc showAnimation];
}
- (void)gotoRootVC{
    [self.navigationController popToRootViewControllerAnimated:NO];
    [SingleModel sharedInstance].indexPathHome = nil;
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

-(void)bg_imageInit {
    imageView_contentBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Geely_mode_yellow"]];
    imageView_contentBG.frame = CGRectMake(82, 0, 1228, 435);
    imageView_contentBG.userInteractionEnabled = YES;
    [self.scrollView_ addSubview: imageView_contentBG];
    
    UIButton *btn_yellow = [[UIButton alloc] initWithFrame:CGRectMake(52+82, 320, 170/2, 170/2)];
    btn_yellow.backgroundColor = [UIColor clearColor];
    btn_yellow.tag = 1;
    [self.scrollView_ addSubview:btn_yellow];
    
    UIButton *btn_red = [[UIButton alloc] initWithFrame:CGRectMake(btn_yellow.frame.origin.x+170/2+58, 320, 170/2, 170/2)];
    btn_red.backgroundColor = [UIColor clearColor];
    btn_red.tag = 2;
    [self.scrollView_ addSubview:btn_red];
    
    UIButton *btn_blue = [[UIButton alloc] initWithFrame:CGRectMake(btn_red.frame.origin.x+170/2+68, 320, 170/2, 170/2)];
    btn_blue.tag = 3;
    btn_blue.backgroundColor = [UIColor clearColor];
    [self.scrollView_ addSubview:btn_blue];
    
    [btn_yellow addTarget:self action:@selector(modeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn_blue addTarget:self action:@selector(modeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn_red addTarget:self action:@selector(modeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)modeBtnAction:(UIButton *)btn {
    NSInteger index = btn.tag;
    if (index == 1) {
        NSLog(@"黄");
        [[NSNotificationCenter defaultCenter] postNotificationName:MODE_GOLD object:nil];
        imageView_contentBG.image = [UIImage imageNamed:@"Geely_mode_yellow"];
        [[[SingleModel sharedInstance] singleMainRequest:@"Car" type_value:@1] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        } failure:^(__kindof HGBaseRequest *request, NSError *error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        }];
    }else if (index == 2) {
        NSLog(@"哄");
        [[NSNotificationCenter defaultCenter] postNotificationName:MODE_RED object:nil];
        imageView_contentBG.image = [UIImage imageNamed:@"Geely_mode_red"];
        [[[SingleModel sharedInstance] singleMainRequest:@"Car" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        } failure:^(__kindof HGBaseRequest *request, NSError *error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        }];
    }else{
        NSLog(@"蓝");
        [[NSNotificationCenter defaultCenter] postNotificationName:MODE_BLUE object:nil];
        imageView_contentBG.image = [UIImage imageNamed:@"Geely_mode_blue"];
        [[[SingleModel sharedInstance] singleMainRequest:@"Car" type_value:@3] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        } failure:^(__kindof HGBaseRequest *request, NSError *error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        }];
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
