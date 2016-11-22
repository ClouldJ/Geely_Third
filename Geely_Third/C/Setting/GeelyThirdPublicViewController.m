//
//  GeelyThirdPublicViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/22.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyThirdPublicViewController.h"

#import "DemoView.h"
#import "GeelyAutoViewController.h"
#import "GeelyMusicAViewController.h"
#import "GeelySettingAViewController.h"
#import "GeelyCallAViewController.h"

typedef void(^Finish)(void);

@interface GeelyThirdPublicViewController () <GeelyLeftContainsDelegate> {
    
}
//@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation GeelyThirdPublicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    [self addFixedView];
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark 添加归固定的View
-(void)addFixedView {
    self.leftViewContains = [[GelelyLeftContainsView alloc] initWithFrame:CGRectMake(0, 0, 82, 492-57)];
    self.leftViewContains.backgroundColor = [UIColor clearColor];
    self.leftViewContains.tableView_.delegate = self;
    [self.contentView addSubview:self.leftViewContains];
    
    DemoView *demo = [[DemoView alloc] initWithFrame:CGRectMake(0, (492-57), 1310, 57)];
    demo.backgroundColor = [UIColor clearColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [demo addGestureRecognizer:tap];
    
    [self.contentView addSubview:demo];
    
    self.scrollView_ = [[UIScrollView alloc] initWithFrame:CGRectMake(82, 0, 1310-82, 435)];
    self.scrollView_.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.scrollView_];
    
    self.slideView = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(82, 0, 0, 435)];
    self.slideView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.slideView];
    
    
    [self.volumeAdd addTarget:self action:@selector(volumeAddd:) forControlEvents:UIControlEventTouchUpInside];
    [self.volumeLes addTarget:self action:@selector(volumeLedd:) forControlEvents:UIControlEventTouchUpInside];
    [self.homeBtn addTarget:self action:@selector(homeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)tapAction:(UITapGestureRecognizer *)tap {
    GeelyAutoViewController *va = [[GeelyAutoViewController alloc] init];
    [self.navigationController pushViewController:va animated:NO];
}


#pragma mark 双击
-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            
            [self.slideView dismissAnimationView:self.slideView.currentView animationFinish:^{
                NSLog(@"隐藏成功");
            }];
            [self contentViewAnimation:^{
                NSLog(@"scrollView移动成功");
            }];
        }
            break;
        case 1:
        {
            
            [self.slideView startAnimationViewStyle:DYNAMIC_MUSIC finish:^(UIView *amicView) {
            }];
            [self contentViewAnimation:^{
                NSLog(@"scrollView移动成功");
            }];
        }
            break;
        case 2:
        {
            
            [self.slideView startAnimationViewStyle:DYNAMIC_CALLZ finish:^(UIView *amicView) {
            }];
            [self contentViewAnimation:^{
                NSLog(@"scrollView移动成功");
            }];
        }
            break;
        case 3:
        {
            [self.slideView startAnimationViewStyle:DYNAMIC_SETTZ finish:^(UIView *amicView) {
            }];
            [self contentViewAnimation:^{
                NSLog(@"scrollView移动成功");
            }];
        }
            break;
        case 4:
        {
            [self.slideView dismissAnimationView:self.slideView.currentView animationFinish:^{
                self.slideView.show = NO;
            }];
            [self contentViewDismiss:^{
                NSLog(@"消失");
            }];
        }
            break;
        case 5:
            break;
        default:
            break;
    }
}

-(void)contentViewAnimation:(Finish)finish{
    [UIView animateWithDuration:.5f animations:^{
        self.scrollView_.frame = CGRectMake(82+340, 0, 1310-82, 435);
    } completion:^(BOOL finished) {
        finish();
    }];
}

-(void)contentViewDismiss:(Finish)finish {
    [UIView animateWithDuration:.5f animations:^{
        self.scrollView_.frame = CGRectMake(82, 0, 1310-82, 435);
    } completion:^(BOOL finished) {
        finish();
    }];
}

-(void)volumeLedd:(UIButton *)btn {
    NSLog(@"减");
}

-(void)volumeAddd:(UIButton *)btn {
    NSLog(@"加");
}

-(void)homeBtnAction:(UIButton *)btn {
    NSLog(@"首页");
}

#pragma mark 单击
-(void)geelySecTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeMediaPlayer" object:nil];
    if (indexPath.row == 1) {
        GeelyMusicAViewController *mm = [[GeelyMusicAViewController alloc] init];
        [self.navigationController pushViewController:mm animated:NO];
    }else if (indexPath.row == 3) {
        GeelySettingAViewController *call = [[GeelySettingAViewController alloc] init];
        [self.navigationController pushViewController:call animated:NO];
    }else if (indexPath.row == 2) {
        GeelyCallAViewController *setting = [[GeelyCallAViewController alloc] init];
        [self.navigationController pushViewController:setting animated:NO];
    }else if (indexPath.row == 4) {
        [self.navigationController popToRootViewControllerAnimated:NO];
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
