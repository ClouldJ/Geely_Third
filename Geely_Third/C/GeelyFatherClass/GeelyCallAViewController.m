//
//  GeelyCallAViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/9.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyCallAViewController.h"
#import "GeelyCallViewToInput.h"
#import "GeelyCalledListlistView.h"
#import "PersonListView.h"

#import "GeelyDisplayPowerView.h"
#import "GeelyPowerDisplayView.h"
#import "GeelyScreenView.h"

#import "GeelyCallingActionView.h"
#import "UIScrollView+AnimationOffSet.h"

@interface GeelyCallAViewController () {
    UIImageView *imageView;
}

@end

@implementation GeelyCallAViewController

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
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoRootVC)];
    
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnAction1)];
    
    [tapGR requireGestureRecognizerToFail:longPressGR];
    
    [home addGestureRecognizer:tapGR];
    [home addGestureRecognizer:longPressGR];
    
    self.dataSource = self;
    self.contentScrollView.delegate = self;
    self.contentImageView.image = [UIImage imageNamed:@"Geely_father_bg_effert"];
    [self addFixedView];
    
    __block __weak GeelyCallAViewController *weakself = self;
    
    [self addImageViewAnimate:^{
        //动画完成后执行
        
        UIView *view_input = [[[NSBundle mainBundle] loadNibNamed:@"GeelyCallToInputA" owner:weakself options:nil]firstObject];
        view_input.frame = CGRectMake(0, 0, 1228, 373.5);
        [weakself.contentScrollView addSubview:view_input];
        
        GeelyCallViewToInput *vv = [[GeelyCallViewToInput alloc] initWithFrame:CGRectMake(0, -20, 852.5, 373.5)];
        [view_input addSubview:vv];
        
        //加载第二页
        UIView *view_list = [[[NSBundle mainBundle] loadNibNamed:@"GeelyCalllistA" owner:weakself options:nil]firstObject];
        view_list.frame = CGRectMake(1228, 0, 1228, 373.5);
        [weakself.contentScrollView addSubview:view_list];
        
        GeelyCalledListlistView *listView = [[GeelyCalledListlistView alloc] initWithFrame:CGRectMake(0, 0, 852.5, 373.5)];
        listView.backgroundColor = [UIColor clearColor];
        [view_list addSubview:listView];
        
        //加载第三页
        UIView *view_person = [[[NSBundle mainBundle] loadNibNamed:@"GeelyPersonlistA" owner:weakself options:nil]firstObject];
        view_person.frame = CGRectMake(1228*2, 0, 1228, 373.5);
        [weakself.contentScrollView addSubview:view_person];
        
        PersonListView *personList = [[PersonListView alloc] initWithFrame:CGRectMake(0, 0, 852.5, 373.5)];
        personList.backgroundColor = [UIColor clearColor];
        [view_person addSubview:personList];
        
        weakself.contentScrollView.contentSize = CGSizeMake(1228*3, 0);
        
         view_input.alpha = 0;
        [UIView animateWithDuration:.2f animations:^{
            view_input.alpha = 1;
        }];
        
    }];
    
    
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

-(void)dealloc {
    NSLog(@"%@ child will dealloc",NSStringFromClass([self class]));
}

-(void)btnAction1{
    [self showPopAnimation];
}
- (void)gotoRootVC{
    [SingleModel sharedInstance].indexPathHome = nil;
    [self.navigationController popToRootViewControllerAnimated:NO];
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

#pragma mark DataSource
-(UIView *)geelyTopAnimateView {
    UIView *vb = [[[NSBundle mainBundle] loadNibNamed:@"callTopview" owner:self options:nil]firstObject];
    vb.frame = CGRectMake(82, 0, 1860/2, 62.5);
    vb.backgroundColor = [UIColor clearColor];
    
    UIButton *BTN_1 = (UIButton *)[vb viewWithTag:567];
    UIButton *BTN_2 = (UIButton *)[vb viewWithTag:568];
    UIButton *BTN_3 = (UIButton *)[vb viewWithTag:569];
    
    NSArray *arr = [NSArray arrayWithObjects:BTN_1,BTN_2,BTN_3, nil];
    for (int i = 0; i<arr.count; i++) {
        UIButton *bb = arr[i];
        bb.tag = i+1;
        [bb addTarget:self action:@selector(topBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    imageView = (UIImageView *)[vb viewWithTag:972];
    imageView.image = [UIImage imageNamed:@"1callinput"];
    
    return vb;
}

#pragma mark TOP栏切换逻辑
-(void)topBtnAction:(UIButton *)btn {
    if (btn.tag == 1) {
        NSLog(@"拨号盘");
        imageView.image = [UIImage imageNamed:@"1callinput"];
        [self.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 0)];
    }else if (btn.tag == 2) {
        NSLog(@"通话记录");
        imageView.image = [UIImage imageNamed:@"2calllist"];
        [self.contentScrollView scrollAnimationToOffSet:CGPointMake(1228, 0)];
    }else if (btn.tag == 3) {
        NSLog(@"通讯录");
        imageView.image = [UIImage imageNamed:@"3callconstract"];
        [self.contentScrollView scrollAnimationToOffSet:CGPointMake(1228*2, 0)];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    scrollView scrollan
    if (scrollView.contentOffset.x == 0) {
        imageView.image = [UIImage imageNamed:@"topcallgeely"];
    }else if (scrollView.contentOffset.x == 1228) {
        imageView.image = [UIImage imageNamed:@"123123123123toptop"];
    }else if (scrollView.contentOffset.x == 1228*2) {
        imageView.image = [UIImage imageNamed:@"top_0dasdaadio13i"];
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
