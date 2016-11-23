//
//  GeelyPViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/14.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyPViewController.h"

@interface GeelyPViewController ()

@end

@implementation GeelyPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *im = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"12.3_ts_comfort_setting-sound_balance-attenuation_20161012_01"]];
    im.frame = CGRectMake(0, 0, 1228, 435);
    [self.scrollView_ addSubview:im];
    
    
    // Do any additional setup after loading the view from its nib.
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
