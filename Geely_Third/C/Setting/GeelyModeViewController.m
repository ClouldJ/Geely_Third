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
    
    [self addFixedView];
    
    //添加背景图片
    [self bg_imageInit];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)bg_imageInit {
    imageView_contentBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Geely_mode_yellow"]];
    imageView_contentBG.frame = CGRectMake(82, 0, 1228, 435);
    imageView_contentBG.userInteractionEnabled = YES;
    [self.contentView addSubview:imageView_contentBG];
    
    UIButton *btn_yellow = [[UIButton alloc] initWithFrame:CGRectMake(82+52, 320, 170/2, 170/2)];
    btn_yellow.backgroundColor = [UIColor clearColor];
    btn_yellow.tag = 1;
    [self.contentView addSubview:btn_yellow];
    
    UIButton *btn_red = [[UIButton alloc] initWithFrame:CGRectMake(btn_yellow.frame.origin.x+170/2+58, 320, 170/2, 170/2)];
    btn_red.backgroundColor = [UIColor clearColor];
    btn_red.tag = 2;
    [self.contentView addSubview:btn_red];
    
    UIButton *btn_blue = [[UIButton alloc] initWithFrame:CGRectMake(btn_red.frame.origin.x+170/2+68, 320, 170/2, 170/2)];
    btn_blue.tag = 3;
    btn_blue.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:btn_blue];
    
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
    }else if (index == 2) {
        NSLog(@"哄");
        [[NSNotificationCenter defaultCenter] postNotificationName:MODE_RED object:nil];
        imageView_contentBG.image = [UIImage imageNamed:@"Geely_mode_red"];
    }else{
        NSLog(@"蓝");
        [[NSNotificationCenter defaultCenter] postNotificationName:MODE_BLUE object:nil];
        imageView_contentBG.image = [UIImage imageNamed:@"Geely_mode_blue"];
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
