//
//  GeelySettingAViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelySettingAViewController.h"

#import "GeelySettingTableViewCell.h"
#import "TableViewProgressView.h"

@interface GeelySettingAViewController () <UITableViewDelegate,UITableViewDataSource> {
    UITableView *tableView_;
    TableViewProgressView *progress;
}

@end

@implementation GeelySettingAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = self;
    self.contentImageView.image = [UIImage imageNamed:@"12.3_ts_comfort_audio-text_20160928"];
    [self addFixedView];
    
    __block __weak GeelySettingAViewController *weakself = self;
    
    [self addImageViewAnimate:^{
        
        UIView *view_setting = [[[NSBundle mainBundle] loadNibNamed:@"GeelySettingviewA" owner:weakself options:nil]firstObject];
        view_setting.frame = CGRectMake(0, 0, 1228, 435);
        [weakself.contentScrollView addSubview:view_setting];
        
        progress = (TableViewProgressView *)[view_setting viewWithTag:8945];
        
        tableView_ = (UITableView *)[view_setting viewWithTag:67598];
        tableView_.delegate = weakself;
        tableView_.dataSource = weakself;
        tableView_.rowHeight = 60;
        tableView_.backgroundColor = [UIColor clearColor];
        tableView_.showsVerticalScrollIndicator = NO;
        
        [tableView_ registerNib:[UINib nibWithNibName:@"GeelySettingTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellsettingbtn"];
        [tableView_ registerNib:[UINib nibWithNibName:@"GeelySettingTableViewCellWord" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellsettingword"];
        [tableView_ registerNib:[UINib nibWithNibName:@"GeelySettingTableViewCellwordi" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cellsettingwordi"];
        
        view_setting.alpha = 0;
        [UIView animateWithDuration:.5f animations:^{
            view_setting.alpha = 1;
        }];
        
        
    }];
    
    
    
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
    progress.heightPercent = xx;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

-(void)btnAction:(UIButton *)btn {
    btn.selected = !btn.selected;
}



-(UIView *)geelyTopAnimateView {
    UIView *vb = [[[NSBundle mainBundle] loadNibNamed:@"settingTopview" owner:self options:nil]firstObject];
    vb.frame = CGRectMake(82, 0, 991.5, 61.5);
    vb.backgroundColor = [UIColor clearColor];
    return vb;
}

-(UIImageView *)geelyTopAnimateImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(82, 0, 1451/2, 91/2)];
    imageView.backgroundColor = [UIColor redColor];
    return imageView;
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
