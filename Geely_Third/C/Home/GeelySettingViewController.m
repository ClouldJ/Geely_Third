//
//  GeelySettingViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/20.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelySettingViewController.h"

#import "DemoView.h"

#import "TableViewProgressView.h"
#import "GeelyMusciViewController.h"
#import "GeelyCallViewController.h"
#import "GeelySettingTableViewCell.h"
@interface GeelySettingViewController () <UITableViewDataSource,GeelyLeftContainsDelegate,UITableViewDelegate> {
    UITableView *tableView_;
    GelelyLeftContainsView *leftView;
    UIView *topSettingView;
}
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet TableViewProgressView *progress;
@property (weak, nonatomic) IBOutlet UIImageView *rightGeelyImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLeftContains;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topContains;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightContains;

@end

@implementation GeelySettingViewController
-(void)swipeGesture:(UISwipeGestureRecognizer *)ges {
    [self.navigationController popToRootViewControllerAnimated:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    topSettingView = [[[NSBundle mainBundle] loadNibNamed:@"settingTopview" owner:self options:nil]firstObject];
    topSettingView.backgroundColor = [UIColor clearColor];
    topSettingView.frame = CGRectMake(82, 266-61, 991.5, 0);
    topSettingView.alpha = 0;
    [self.view addSubview:topSettingView];
    self.rightGeelyImage.alpha = 0;
    self.progress.alpha = 0;
    
    leftView = [[GelelyLeftContainsView alloc] initWithFrame:CGRectMake(0, 0, 82, 492-57)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.tableView_.delegate = self;
    [self.contentView addSubview:leftView];
    DemoView *demo = [[DemoView alloc] initWithFrame:CGRectMake(0, (492-57), 1310, 57)];
    demo.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:demo];
    [UIView animateWithDuration:.5f animations:^{
        topSettingView.alpha = 1;
        topSettingView.frame = CGRectMake(82, 266, 991.5, 61);
    } completion:^(BOOL finished) {
        
        UISwipeGestureRecognizer *swipeG = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
        swipeG.direction = UISwipeGestureRecognizerDirectionRight;
        [self.view addGestureRecognizer:swipeG];
        
        tableView_ = (UITableView *)[self.view viewWithTag:67598];
        tableView_.delegate = self;
        tableView_.dataSource = self;
        tableView_.rowHeight = 60;
        tableView_.backgroundColor = [UIColor clearColor];
        tableView_.showsVerticalScrollIndicator = NO;
        
        [tableView_ registerNib:[UINib nibWithNibName:@"GeelySettingTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellsettingbtn"];
        [tableView_ registerNib:[UINib nibWithNibName:@"GeelySettingTableViewCellWord" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellsettingword"];
        [tableView_ registerNib:[UINib nibWithNibName:@"GeelySettingTableViewCellwordi" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellsettingwordi"];
        tableView_.alpha = 0;

        [UIView animateWithDuration:.5f animations:^{
            self.rightGeelyImage.alpha = 1;
            self.progress.alpha = 1;
            tableView_.alpha = 1;
        }];
    }];

    
    // Do any additional setup after loading the view from its nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = [GeelySettingTableViewCell cellWithIndexPath:indexPath];
    GeelySettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [cell cellForRowWith:indexPath];
    [cell.statusBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.statusBtn setBackgroundImage:[UIImage imageNamed:@"开切换-拷贝setting"] forState:UIControlStateNormal];
    [cell.statusBtn setBackgroundImage:[UIImage imageNamed:@"开切换huanhduanda"] forState:UIControlStateSelected];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat xx = (scrollView.contentOffset.y)/(scrollView.contentSize.height - self.view.bounds.size.height+20);
    self.progress.heightPercent = xx;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

-(void)btnAction:(UIButton *)btn {
    btn.selected = !btn.selected;
}

-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 4) {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }else if (indexPath.row == 1) {
        self.contentLeftContains.constant = self.contentLeftContains.constant+340;
        self.topContains.constant = self.topContains.constant+340;
    }
}

-(void)geelySecTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        GeelyMusciViewController *mm = [[GeelyMusciViewController alloc] init];
        [self.navigationController pushViewController:mm animated:NO];
    }else if (indexPath.row == 2) {
        GeelyCallViewController *call = [[GeelyCallViewController alloc] init];
        [self.navigationController pushViewController:call animated:NO];
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
