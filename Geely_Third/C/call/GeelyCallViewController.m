
//
//  GeelyCallViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyCallViewController.h"

#import "GeelyCallViewToInput.h"
#import "GeelyCalledListlistView.h"

#import "PersonListView.h"
#import "DemoView.h"
#import "TableViewProgressView.h"
#import "GeelyMusciViewController.h"
#import "GeelySettingViewController.h"
@interface GeelyCallViewController () <GeelyCallViewToInputDelegate,GeelyLeftContainsDelegate,UIScrollViewDelegate> {
    GelelyLeftContainsView *leftView;
    UIView *topShowView;
}
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (weak, nonatomic) IBOutlet UIButton *callView;
@property (weak, nonatomic) IBOutlet UIButton *callList;
@property (weak, nonatomic) IBOutlet UIButton *callPersonList;
@property (weak, nonatomic) IBOutlet UIButton *message;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet TableViewProgressView *progress;
@property (strong, nonatomic)  UIImageView *topGeelyView;
@property (weak, nonatomic) IBOutlet UIImageView *rightBlueView;

@end

@implementation GeelyCallViewController

-(void)didScrollHeightPercent:(CGFloat)heightPercent tableView:(UITableView *)tableView{
    self.progress.heightPercent = heightPercent;
}

-(void)swipeGesture:(UISwipeGestureRecognizer *)ges {
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

//    self.contentScrollView.backgroundColor = [UIColor orangeColor];
    
    leftView = [[GelelyLeftContainsView alloc] initWithFrame:CGRectMake(0, 0, 82, 492-57)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.tableView_.delegate = self;
    [self.contentView addSubview:leftView];
    
    DemoView *demo = [[DemoView alloc] initWithFrame:CGRectMake(0, (492-57), 1310, 57)];
    demo.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:demo];
    
    topShowView = [[[NSBundle mainBundle] loadNibNamed:@"callTopview" owner:self options:nil]firstObject];
    topShowView.frame = CGRectMake(82+10, 266-62.5, 990, 0);
    topShowView.backgroundColor = [UIColor clearColor];
    topShowView.alpha = 0;
    self.topGeelyView = (UIImageView *)[topShowView viewWithTag:972];
    [self.view addSubview:topShowView];
    self.rightBlueView.alpha = 0;
    self.progress.alpha = 0;
    [UIView animateWithDuration:.5f animations:^{
        topShowView.alpha = 1;
        topShowView.frame = CGRectMake(82+10, 266, 990, 62.5);
    } completion:^(BOOL finished) {
        self.contentScrollView.pagingEnabled = YES;
        self.contentScrollView.delegate = self;
        UISwipeGestureRecognizer *swipeG = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
        swipeG.direction = UISwipeGestureRecognizerDirectionRight;
        [self.view addGestureRecognizer:swipeG];
        
        GeelyCallViewToInput *callView = [[GeelyCallViewToInput alloc] initWithFrame:CGRectMake(0,-30,830, 372.5)];
        //    callView.backgroundColor = [UIColor redColor];
        callView.delegate = self;
        [self.contentScrollView addSubview:callView];
        
        GeelyCalledListlistView *listView = [[GeelyCalledListlistView alloc] initWithFrame:CGRectMake(830, 0, 830, 372.5)];
        listView.backgroundColor = [UIColor clearColor];
        [self.contentScrollView addSubview:listView];
        
        PersonListView *personList = [[PersonListView alloc] initWithFrame:CGRectMake(830*2, -50, 830, 372.5)];
        personList.backgroundColor = [UIColor clearColor];
        [self.contentScrollView addSubview:personList];
        
        self.contentScrollView.contentSize = CGSizeMake(830*3, 0);
    
        callView.alpha = 0;
        [UIView animateWithDuration:.5f animations:^{
            self.rightBlueView.alpha = 1;
            self.progress.alpha = 1;
            callView.alpha = 1;
        }];
        
        
    }];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.progress.heightPercent = 0;
    if (scrollView.contentOffset.x == 0) {
        self.topGeelyView.image = [UIImage imageNamed:@"1callinput"];
    }else if (scrollView.contentOffset.x == 830.5) {
        self.topGeelyView.image = [UIImage imageNamed:@"2calllist"];
    }else if (scrollView.contentOffset.x == 1659.5) {
        self.topGeelyView.image = [UIImage imageNamed:@"3callconstract"];
    }
}

-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
}

-(void)geelySecTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        GeelyMusciViewController *mu = [[GeelyMusciViewController alloc] init];
        [self.navigationController pushViewController:mu animated:NO];
    }else if (indexPath.row == 3) {
        GeelySettingViewController *set = [[GeelySettingViewController alloc] init];
        [self.navigationController pushViewController:set animated:NO];
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
