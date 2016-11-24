//
//  GeelyLightViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/14.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyLightViewController.h"

@interface GeelyLightViewController ()

@end

@implementation GeelyLightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    WithImage:[UIImage imageNamed:@"12.3_ts_comfort_setting_energy_20161009_4_01"]
    UIImageView *da = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"12.3_ts_comfort_setting_energy_20161009_4_0111"]];
    da.frame = CGRectMake(0, 0, 1228, 435);
    [self.scrollView_ addSubview:da];
    
    UIImageView *im = [[UIImageView alloc] init];
    im.frame = CGRectMake(-50, 0, 1228, 435);
    im.contentMode = UIViewContentModeScaleAspectFill;
    [self.scrollView_ addSubview:im];
    NSMutableArray *arr = [NSMutableArray array];


    
    [NSThread detachNewThreadWithBlock:^{
        for (int i = 0; i<=73; i++) {
            if (i<10) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"能量流动_0000%d",i]];
                [arr addObject:image];
            }else{
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"能量流动_000%d",i]];
                [arr addObject:image];
            }
        }
        [im startImageSequenceWithArray:arr repeatCount:1000000 duration:1.5];
    }];

    
//    self.childContentImageView.image = [UIImage imageNamed:@"12.3_ts_comfort_setting_energy_20161009_4_01"];
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
