//
//  GeelyAutoViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/19.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyAutoViewController1.h"

@interface GeelyAutoViewController1 () {
    UIImageView *im;
    CGPoint im_center;
}

@end

@implementation GeelyAutoViewController1

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    im = [[UIImageView alloc] init];
    im.frame = CGRectMake((D_W-WWWW_GEELY)/2, (D_H-HHHH_GEELY)/2, WWWW_GEELY, HHHH_GEELY);
    im.image = [UIImage imageNamed:@"Geely_auto_bg"];
    im.userInteractionEnabled = YES;
    [self.view addSubview:im];
    
    UIButton *r_btn = [UIButton new];
    [r_btn setBackgroundImage:[UIImage imageNamed:@"Geely_seat_right"] forState:UIControlStateNormal];
    [im addSubview:r_btn];
    [r_btn zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.heightValue(100);
        layout.widthValue(250);
        layout.rightSpace(105);
        layout.bottomSpace(105);
    }];
    
    UIButton *l_btn = [UIButton new];
    [l_btn setBackgroundImage:[UIImage imageNamed:@"Geely_seat_left"] forState:UIControlStateNormal];
    [im addSubview:l_btn];
    [l_btn zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.heightValue(100);
        layout.widthValue(250);
        layout.leftSpace(105);
        layout.bottomSpace(105);
    }];
    
    UIImageView *im_cc = [UIImageView new];
    im_cc.image = [UIImage imageNamed:@"温度计"];
    [im addSubview:im_cc];
    [im_cc zxp_addConstraints:^(ZXPAutoLayoutMaker *layout) {
        layout.widthValue(121/2);
        layout.heightValue(121/2);
        layout.bottomSpace(40);
        layout.leftSpace(17);
    }];
    
    im_cc.userInteractionEnabled = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [im_cc addGestureRecognizer:pan];
    im_center = im_cc.center;
    
    // Do any additional setup after loading the view.
}

-(void)panAction:(UIPanGestureRecognizer *)pan {
    
    UIImageView *imaaa = (UIImageView *)[pan view];

    
    if (pan.state == UIGestureRecognizerStateBegan) {
        imaaa.transform = CGAffineTransformScale(imaaa.transform, 1.3f, 1.3f);
    }else if (pan.state == UIGestureRecognizerStateEnded) {
        imaaa.transform = CGAffineTransformScale(imaaa.transform, 1.0f, 1.0f);
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        CGFloat yyy = [pan translationInView:im].y;
        imaaa.center = CGPointMake(imaaa.center.x, yyy+im_center.y);
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
