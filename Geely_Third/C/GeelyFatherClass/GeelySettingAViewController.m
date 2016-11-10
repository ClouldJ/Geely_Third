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
#import "GeelyPictureShowVC.h"
#import "GeelyMediaPlayerVC.h"

#import "GeelyModeViewController.h"

@interface GeelySettingAViewController () <UITableViewDelegate,UITableViewDataSource> {
    UITableView *tableView_;
    TableViewProgressView *progress;
}

@end

@implementation GeelySettingAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button_volume_ = [[UIButton alloc] initWithFrame:CGRectMake(WWWWWWWWWWW/2 - 160, HHHHHHHHHHH-180, 60, 60)];
    button_volume_.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button_volume_];
    [button_volume_ addTarget:self action:@selector(volumeLes) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button_vo = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+280, button_volume_.frame.origin.y, 60, 60)];
    button_vo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button_vo];
    
    UIButton *home = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+60+40, HHHHHHHHHHH-180, 120, 70)];
    home.backgroundColor = [UIColor clearColor];
    [self.view addSubview:home];
    [home addTarget:self action:@selector(btnAction1:) forControlEvents:UIControlEventTouchUpInside];
    
    
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

#pragma mark GeelyDisplayPowerViewDelegate
-(void)showDisplayView:(GeelyDisplayPowerView *)view {
    GeelyScreenView *screenView = [[GeelyScreenView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [screenView showAnimate];
}

-(void)showPowerView:(GeelyDisplayPowerView *)view  {
    GeelyPowerDisplayView *vb = [[GeelyPowerDisplayView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [vb showAnimation];
}
-(void)volumeAdd{
    [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
    mainRequest.requestVolume.type = @2;
    mainRequest.requestPhone.type = @0;
    mainRequest.requestRadio.type = @0;
    mainRequest.requestVoice.type = @0;
    mainRequest.requestMusic.type = @0;
    mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
    [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    }];
    if (vvlioce.volume<=1) {
        volume = volume+0.1;
        vvlioce.volume = volume;
        //        [vv_bottom.vv autoMakeViewFrame:vvlioce.volume*2];
    }
}

-(void)volumeLes {
    if (vvlioce.volume>=0) {
        volume = volume-0.1;
        vvlioce.volume = volume;
        //        [vv_bottom.vv autoMakeViewFrame:vvlioce.volume*2];
        
        if (vvlioce.volume == 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            mainRequest.requestVolume.type = @0;
            mainRequest.requestPhone.type = @0;
            mainRequest.requestRadio.type = @0;
            mainRequest.requestVoice.type = @0;
            mainRequest.requestMusic.type = @0;
            mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
            [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            mainRequest.requestVolume.type = @2;
            mainRequest.requestPhone.type = @0;
            mainRequest.requestRadio.type = @0;
            mainRequest.requestVoice.type = @0;
            mainRequest.requestMusic.type = @0;
            mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
            [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }
    }
}


-(void)btnAction1:(UIButton *)btn {
    [self showPopAnimation];
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            //@"音量随车速调节";
            break;
        case 1:
            //@"车辆故障查看";
            break;
        case 2:
            //@"无线充电";
            break;
        case 3:
            //@"氛围灯";
            break;
        case 4:
            //@"主题颜色";
            break;
        case 5:
            //@"储存空间";
            break;
        case 6:
            //@"驾驶模式";
        {
            GeelyModeViewController *vc = [[GeelyModeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
        }
            break;
        case 7:
            //@"能量流";
            break;
        case 8:
            //@"平衡衰减";
            break;
        case 9:
            //@"视频浏览";
        {
            GeelyMediaPlayerVC *vc = [[GeelyMediaPlayerVC alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
        }
            break;
        case 10:
            //@"图片浏览";
        {
            GeelyPictureShowVC *vc = [[GeelyPictureShowVC alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
        }
            break;
            
        default:
            break;
    }

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat xx = (scrollView.contentOffset.y)/(scrollView.contentSize.height - self.view.bounds.size.height+20);
    progress.heightPercent = xx;
}

//-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
//    return NO;
//}

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
