//
//  GeelyWeatherViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/7.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyWeatherViewController.h"

#import "GeelyMusicAViewController.h"
#import "DemoView.h"
#import "GeelySettingAViewController.h"
#import "GeelyCallAViewController.h"


@interface GeelyWeatherViewController () <GeelyLeftContainsDelegate,GeelyDisplayPowerViewDelegate,UIScrollViewDelegate> {
    GelelyLeftContainsView *leftView;
    UIScrollView *scrollView_;
    UIImageView *top;
    UIImageView *bottom;
    UIImageView *right;
    UIImageView *top1;
    UIImageView *bottom1;
    UIImageView *right1;
    UIImageView *imageView;
    UIView *contentAsScroll;
    
    UIImageView *progressImageView;
    NSInteger currentIndex;
    UIImageView *imageView1;
    UIImageView *imageView2;
    UIImageView *top2;
    UIImageView *bottom2;
    UIImageView *right2;
}
//@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation GeelyWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    currentIndex =1;
    
    volume = [SettingSound getSystemVolumValue];

    
    UIButton *button_volume_ = [[UIButton alloc] initWithFrame:CGRectMake(WWWWWWWWWWW/2 - 160, HHHHHHHHHHH-180, 60, 60)];
    button_volume_.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button_volume_];
    [button_volume_ addTarget:self action:@selector(volumeLes1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button_vo = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+280, button_volume_.frame.origin.y, 60, 60)];
    button_vo.backgroundColor = [UIColor clearColor];
    [button_vo addTarget:self action:@selector(volumeAdd1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_vo];
    
    UIButton *home = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+60+40, HHHHHHHHHHH-180, 120, 70)];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoRootVC)];
    
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnAction1)];
    
    [tapGR requireGestureRecognizerToFail:longPressGR];
    
    [home addGestureRecognizer:tapGR];
    [home addGestureRecognizer:longPressGR];
    
    self.scrollView_.contentSize = CGSizeMake((1310-82)*3, 492-57);
    self.scrollView_.showsHorizontalScrollIndicator = NO;
    self.scrollView_.delegate = self;
    self.scrollView_.pagingEnabled = YES;
    
    [self add];
    [self addTwo];
    [self addThree];
    
    [self viewAnimation];
    
    [self.view bringSubviewToFront:self.volumeLes];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)add {
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1310-82, 492-57)];
    imageView.image = [UIImage imageNamed:@"Geely_weather_bg_white"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.scrollView_ addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    //    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    //    [imageView addGestureRecognizer:tap];
    
    top = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"天气信息固定位置"]];
    top.frame = CGRectMake(40, 20, 1514/2, 392/2);
    [imageView addSubview:top];
    
    bottom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"日期天气"]];
    bottom.frame = CGRectMake(20, 492-57-259/2, 1720/2, 259/2);
    [imageView addSubview:bottom];
    
    right = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Geely_weather_right_white"]];
    right.frame = CGRectMake(1310-82-683/2, 0, 464/2, 617/2);
    //    right.contentMode = UIViewContentModeScaleAspectFit;
    [imageView addSubview:right];
    
    progressImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"天气进度1"]];
    progressImageView.frame = CGRectMake(1310/2-206/2-72, 492-57-21/2, 206/2, 6/2);
    [self.contentView addSubview:progressImageView];
}

-(void)addTwo {
    imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake((1310-82), 0, 1310-82, 492-57)];
    imageView1.image = [UIImage imageNamed:@"Geely_weather_bg_white"];
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    [self.scrollView_ addSubview:imageView1];
    imageView1.userInteractionEnabled = YES;
    
    top1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"天气信息固定位置"]];
    top1.frame = CGRectMake(40, 20, 1514/2, 392/2);
    [imageView1 addSubview:top1];
    
    bottom1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"日期天气"]];
    bottom1.frame = CGRectMake(20, 492-57-259/2-35, 1720/2, 259/2);
    [imageView1 addSubview:bottom1];
    
    right1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Geely_weather_right_white"]];
    right1.frame = CGRectMake(1310-82-683/2+50, (492-57-617/2)/2, 464/2, 617/2);
    [imageView1 addSubview:right1];
}

-(void)addThree {
    imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake((1310-82)*2, 0, 1310-82, 492-57)];
    imageView2.image = [UIImage imageNamed:@"Geely_weather_bg_black"];
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    [self.scrollView_ addSubview:imageView2];
    imageView2.userInteractionEnabled = YES;
    
    top2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"天气信息固定位置"]];
    top2.frame = CGRectMake(40, 20, 1514/2, 392/2);
    [imageView2 addSubview:top2];
    
    bottom2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"日期天气"]];
    bottom2.frame = CGRectMake(20, 492-57-259/2-35, 1720/2, 259/2);
    [imageView2 addSubview:bottom2];
    
    right2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Geely_weather_right_white"]];
    right2.frame = CGRectMake(1310-82-683/2+50, (492-57-617/2)/2, 464/2, 617/2);
    [imageView2 addSubview:right2];
}

-(void)swipeAction:(UISwipeGestureRecognizer *)swipe {
//    NSLog(@"进啦");
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        if (currentIndex>1) {
            currentIndex -=1;
            [UIView animateWithDuration:.2f animations:^{
                imageView.alpha = 0;
            } completion:^(BOOL finished) {
                imageView.image = [UIImage imageNamed:@"Geely_weather_bg_white"];
                [UIView animateWithDuration:.2f animations:^{
                    imageView.alpha = 1;
                }];
                
            }];
        }

    }else if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (currentIndex<3) {
            currentIndex+=1;
            [UIView animateWithDuration:.2f animations:^{
                imageView.alpha = 0;
            } completion:^(BOOL finished) {
                imageView.image = [UIImage imageNamed:@"Geely_weather_bg_black"];
                [UIView animateWithDuration:.2f animations:^{
                    imageView.alpha = 1;
                }];
                
            }];
        }

    }
    
    if (currentIndex == 1) {
        progressImageView.image = [UIImage imageNamed:@"天气进度1"];
    }else if (currentIndex == 2) {
        progressImageView.image = [UIImage imageNamed:@"天气进度2"];
    }else if (currentIndex == 3) {
        progressImageView.image = [UIImage imageNamed:@"天气进度3"];
    }
    
}

-(void)btnAction1{
    [self showPopAnimation];
}
- (void)gotoRootVC{
    [self.navigationController popToRootViewControllerAnimated:NO];
    [SingleModel sharedInstance].indexPathHome = nil;
}

-(void)tapAction {
    [UIView animateWithDuration:.5f animations:^{
        right.frame = CGRectMake(1310-82-683/2+50, -617/2, 464/2, 617/2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.5f animations:^{
            bottom.frame = CGRectMake(-1720/2, 492-57-259/2-35, 1720/2, 259/2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.5f animations:^{
                top.alpha = 0;
            } completion:^(BOOL finished) {
                imageView.image = [UIImage imageNamed:@"Geely_weather_bg_black"];
                
                bottom.image = [UIImage imageNamed:@"组-2155absdiasdubu"];
                right.image = [UIImage imageNamed:@"星期b"];
                
                [UIView animateWithDuration:1.0f animations:^{
                    top.alpha = 1;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:1.0f animations:^{
                        bottom.frame = CGRectMake(20, 492-57-259/2-35, 1720/2, 259/2);
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:1.0f animations:^{
                            right.frame = CGRectMake(1310-82-683/2+50, (492-57-617/2)/2, 464/2, 617/2);
                        } completion:^(BOOL finished) {
                            NSLog(@"动画完成");
                        }];
                    }];
                }];
            }];
        }];
    }];
}

//-(void)

-(void)viewAnimation {
    top.alpha = 0;
    bottom.frame = CGRectMake(-1720/2, 492-57-259/2-35, 1720/2, 259/2);
    right.frame = CGRectMake(1310-82-683/2+50, -617/2-400, 464/2, 617/2);

    [UIView animateWithDuration:1.0f animations:^{
        top.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.5f animations:^{
            bottom.frame = CGRectMake(20, 492-57-259/2-35, 1720/2, 259/2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.5f animations:^{
                right.frame = CGRectMake(1310-82-683/2+50, (492-57-617/2)/2, 464/2, 617/2);
            } completion:^(BOOL finished) {
                NSLog(@"动画完成");
            }];
        }];
    }];
    
}

//-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 4) {
//        [self.navigationController popToRootViewControllerAnimated:NO];
//    }
//}
//
//-(void)geelySecTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 1) {
//        GeelyMusicAViewController *mu = [[GeelyMusicAViewController alloc] init];
//        [self.navigationController pushViewController:mu animated:NO];
//    }else if (indexPath.row == 3) {
//        GeelySettingAViewController *set = [[GeelySettingAViewController alloc] init];
//        [self.navigationController pushViewController:set animated:NO];
//    }else if (indexPath.row == 4) {
//        [self.navigationController popToRootViewControllerAnimated:NO];
//    }else if (indexPath.row == 2) {
//        GeelyCallAViewController *vb = [[GeelyCallAViewController alloc] init];
//        [self.navigationController pushViewController:vb animated:NO];
//    }
//}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        progressImageView.image = [UIImage imageNamed:@"天气进度1"];
    }else if (scrollView.contentOffset.x == 1310-82) {
        progressImageView.image = [UIImage imageNamed:@"天气进度2"];
    }else if(scrollView.contentOffset.x == (1310-82)*2) {
        progressImageView.image = [UIImage imageNamed:@"天气进度3"];
    }
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


-(void)volumeLes1{
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

-(void)volumeAdd1 {
    if (volume<1) {
        volume += 0.1;
        [SettingSound setSysVolumWith:volume];
        [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
        [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
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
