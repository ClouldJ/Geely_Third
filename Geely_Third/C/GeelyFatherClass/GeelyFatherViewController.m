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

@interface GeelyFatherViewController () <GeelyLeftContainsDelegate> {
    GelelyLeftContainsView *leftView;
    UIView *scrollViewContent;
    GeelyLittleShowView *leftFrameScroll;
    UIView *topView;
    NSIndexPath *indexPathLast;
}

@end

@implementation GeelyFatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
- (IBAction)homeBtn:(id)sender {
    NSLog(@"首页");
}
- (IBAction)vlumeAdd:(id)sender {
    NSLog(@"音量加");
}
- (IBAction)volumeLess:(id)sender {
    NSLog(@"音量减");
}

#pragma mark GeelyLeftContainsDelegate
-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }else {
        if (!leftFrameScroll.show) {
            indexPathLast =[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section];
            [scrollViewContent geelyContentViewFrameAnimation:^{
                leftFrameScroll.frame = CGRectMake(82, 0, 340, 492-57);
                leftFrameScroll.show = YES;
                
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
    if (indexPath.row == 1) {
        GeelyMusicAViewController *mm = [[GeelyMusicAViewController alloc] init];
        [self.navigationController pushViewController:mm animated:NO];
    }else if (indexPath.row == 3) {
        GeelySettingAViewController *call = [[GeelySettingAViewController alloc] init];
        [self.navigationController pushViewController:call animated:NO];
    }else if (indexPath.row == 2) {
        GeelyCallAViewController *setting = [[GeelyCallAViewController alloc] init];
        [self.navigationController pushViewController:setting animated:NO];
    }
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
