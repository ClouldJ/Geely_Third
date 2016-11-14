//
//  GeelySettingCustomViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/14.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelySettingCustomViewController.h"

@interface GeelySettingCustomViewController ()

@end

@implementation GeelySettingCustomViewController

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFixedView];
//    leftView.tableView_.delegate = self;
    
    scrollViewContent.frame = CGRectMake(82, 0, 1310-82, 492-57);
    self.contentScrollView.frame = CGRectMake(0, 0, 1310-82, 492-57);
    
    self.childContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1310-82, 492-57)];
    self.childContentView.backgroundColor = [UIColor clearColor];
    [self.contentScrollView addSubview:self.childContentView];
//    [self.childContentView setNeedsDisplay];
    
    self.childContentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1310-82, 492-57)];
    self.childContentImageView.userInteractionEnabled = YES;
    [self.childContentView addSubview:self.childContentImageView];
//    [self.view bringSubviewToFront:self.childContentView];
    // Do any additional setup after loading the view from its nib.
}

//-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
//    [UIView animateWithDuration:.5f animations:^{
//        self.childContentView.frame = CGRectMake(82+340, 0, 1310-82, 492-57);
//    }];
//}
//
//-(void)geelySecTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
//    
//}

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
