//
//  GeelyMediaPlayerVC.m
//  Geely_Third
//
//  Created by 胡亚明 on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMediaPlayerVC.h"
#import "GeelyMediaListCell.h"
#import "CLAVPlayerView.h"
#import "TableViewProgressView.h"
#import "GeelyMusicTransProgress.h"


@interface GeelyMediaPlayerVC ()<UICollectionViewDelegate,UICollectionViewDataSource,GeelyFatherViewDatasource>
{
    NSIndexPath *index;
    //列表右侧滑条
    TableViewProgressView *rightSliderLine;
    UILabel *rightLabel;
    UILabel *tipLabel;
    UILabel *leftTime;
    UILabel *rightTime;
    GeelyMusicTransProgress *pro;
    //
    CLAVPlayerView *mplayerView;
    UIView *rightPlayerView;
    UIImageView *topView;
}
//@property (strong, nonatomic) UIView *contentView;
@end

@implementation GeelyMediaPlayerVC

-(void)volumeAdd{
    [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
    
    [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
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
            
            [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@0] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
            
        }else{
            [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
            
            [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
            
        }
    }
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



- (void)viewDidLoad {
    [super viewDidLoad];
    [self addFixedView];
    
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
    
    // Do any additional setup after loading the view.
    self.dataSource = self;
    __block __weak GeelyMediaPlayerVC *weakself = self;
    [self addImageViewAnimate:^{
        [weakself setupSubViews];
    }];
    //
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeMediaPlayer) name:@"closeMediaPlayer" object:nil];
    //
}
- (void)closeMediaPlayer{
    [mplayerView.player pause];
    [mplayerView.playerLayer removeFromSuperlayer];
    [mplayerView.player.currentItem cancelPendingSeeks];
    [mplayerView.player.currentItem.asset cancelLoading];
}
-(UIView *)geelyTopAnimateView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(82, 0, 819,57)];
    topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 819,57)];
    topView.image = [UIImage imageNamed:@"mediaPlayer_icon_top_select1"];
    topView.userInteractionEnabled = YES;
    UIButton *topLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, topView.bounds.size.width*0.5, topView.bounds.size.height)];
    topLeftBtn.backgroundColor = [UIColor clearColor];
    [topLeftBtn addTarget:self action:@selector(showCurrentMediaList:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:topLeftBtn];
    UIButton *topRightBtn = [[UIButton alloc] initWithFrame:CGRectMake(topView.bounds.size.width*0.5, 0, topView.bounds.size.width*0.5, topView.bounds.size.height)];
    topRightBtn.backgroundColor = [UIColor clearColor];
    [topRightBtn addTarget:self action:@selector(showAllMediaList:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:topRightBtn];
    [view addSubview:topView];
    return view;
}
- (void)setupSubViews{
//    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,1310,492)];
//    self.contentView.backgroundColor = [UIColor clearColor];
//    self.contentView.backgroundColor = [UIColor clearColor];
//    self.contentView.center = self.view.center;
//[self.contentView addSubview:self.contentView];
    //
    //顶部选择
    UIImageView *topSelectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 819,57)];
//    topSelectView.image = [UIImage imageNamed:@"mediaPlayer_icon_top_select1"];
//    topSelectView.userInteractionEnabled = YES;
//    UIButton *topLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, topSelectView.bounds.size.width*0.5, topSelectView.bounds.size.height)];
//    topLeftBtn.backgroundColor = [UIColor clearColor];
//    [topLeftBtn addTarget:self action:@selector(showCurrentMediaList:) forControlEvents:UIControlEventTouchUpInside];
//    [topSelectView addSubview:topLeftBtn];
//    UIButton *topRightBtn = [[UIButton alloc] initWithFrame:CGRectMake(topSelectView.bounds.size.width*0.5, 0, topSelectView.bounds.size.width*0.5, topSelectView.bounds.size.height)];
//    topRightBtn.backgroundColor = [UIColor clearColor];
//    [topRightBtn addTarget:self action:@selector(showAllMediaList:) forControlEvents:UIControlEventTouchUpInside];
//    [topSelectView addSubview:topRightBtn];
    //[self.content addSubview:topSelectView];
    //
    UIImageView *usbImgView = [[UIImageView alloc] initWithFrame:CGRectMake(topSelectView.frame.origin.x+80,0,115,53)];
    usbImgView.image = [UIImage imageNamed:@"mediaPlayer_icon_usb2"];
    usbImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentScrollView addSubview:usbImgView];
    UIButton *editBtn = [[UIButton alloc] initWithFrame:CGRectMake(topSelectView.frame.size.width+topSelectView.frame.origin.x -usbImgView.frame.size.width-80, usbImgView.frame.origin.y, usbImgView.frame.size.width, usbImgView.frame.size.height)];
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    editBtn.titleLabel.font = [UIFont systemFontOfSize:19];
    [editBtn setTitleColor:[UIColor colorWithRed:149.0/255.0 green:149.0/255.0 blue:149.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    editBtn.backgroundColor = [UIColor clearColor];
    [self.contentScrollView addSubview:editBtn];
    //列表collectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(198-15,140);
    layout.minimumLineSpacing = 14.5;
    layout.minimumInteritemSpacing = 0;
    UICollectionView *listView = [[UICollectionView alloc] initWithFrame:CGRectMake(topSelectView.frame.origin.x+40,usbImgView.frame.origin.y+usbImgView.frame.size.height,819-60,293) collectionViewLayout:layout];
    listView.tag = 99;
    listView.delegate = self;
    listView.dataSource = self;
    listView.showsVerticalScrollIndicator = NO;
    listView.showsHorizontalScrollIndicator = NO;
    [listView registerNib:[UINib nibWithNibName:@"GeelyMediaListCell" bundle:nil] forCellWithReuseIdentifier:@"GeelyMediaListCell"];
    [self.contentScrollView addSubview:listView];
    // 右侧滑条
    rightSliderLine = [[TableViewProgressView alloc] initWithFrame:CGRectMake(listView.frame.origin.x+listView.frame.size.width +35, listView.frame.origin.y,2, listView.frame.size.height) andBottomSize:CGSizeMake(2, 297) andupBottomSize:CGSizeMake(3, 400)];
//    rightSliderLine.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"sliderLine_normal_icon"]];
    rightSliderLine.heightPercent = 0.4;
    [self.contentScrollView addSubview:rightSliderLine];
    
    // = [[UIImageView alloc] initWithFrame:CGRectMake(rightSliderLine.frame.origin.x-2, rightSliderLine.frame.origin.y,8, rightSliderLine.frame.size.height*0.4)];
    //rightSliderLightLine.image = [UIImage imageNamed:@"sliderLine_light_icon"];
    //[self.contentView addSubview:leftSliderLightLine];
    
    //右侧播放
    rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(rightSliderLine.frame.origin.x +55, editBtn.frame.origin.y, 287, editBtn.frame.size.height)];
    rightLabel.textColor = [UIColor colorWithRed:180.0/255.0 green:156.0/255.0 blue:102.0/255.0 alpha:1];
    rightLabel.font = [UIFont systemFontOfSize:19];
    rightLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentScrollView addSubview:rightLabel];
    //
    
    //
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mediaPlayerClosed) name:@"mediaPlayerClosed" object:nil];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat xx = (scrollView.contentOffset.y)/(scrollView.contentSize.height) +0.4;
    rightSliderLine.heightPercent = xx;
}
//
- (void)mediaPlayerClosed{
    //清除上一次播放
    [rightPlayerView removeFromSuperview];
    [mplayerView removeFromSuperview];
    [tipLabel removeFromSuperview];
    [pro removeFromSuperview];
    [leftTime removeFromSuperview];
    [rightTime removeFromSuperview];
    //
    //
    rightLabel.text = @"釜山行-国语中字2016";
    rightPlayerView = [[UIView alloc] initWithFrame:CGRectMake(rightLabel.frame.origin.x,rightSliderLine.frame.origin.y, rightLabel.frame.size.width, 161.5)];
    //[self.contentView addSubview:rightPlayerView];
    mplayerView = [CLAVPlayerView videoPlayView];
    mplayerView.frame = rightPlayerView.frame;
    mplayerView.contrainerViewController = self;
    [self.contentScrollView addSubview:mplayerView];
    //
    tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(rightLabel.frame.origin.x,mplayerView.frame.origin.y+mplayerView.frame.size.height,rightLabel.frame.size.width,56)];
    tipLabel.text= @"正在播放中";
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.textColor = RGBAAAABBB(128, 125, 118, 1.0);
    tipLabel.font = [UIFont systemFontOfSize:16];
    //
    leftTime = [[UILabel alloc]initWithFrame:CGRectMake(rightLabel.frame.origin.x, tipLabel.frame.origin.y+tipLabel.frame.size.height-10, 45, 35)];
    leftTime.textColor = [UIColor whiteColor];
    leftTime.font = [UIFont systemFontOfSize:13];
    [self.contentScrollView addSubview:leftTime];
    //
    rightTime = [[UILabel alloc]initWithFrame:CGRectMake(rightLabel.frame.origin.x+rightLabel.frame.size.width-35, tipLabel.frame.origin.y+tipLabel.frame.size.height-10, 45, 35)];
    rightTime.textColor = [UIColor whiteColor];
    rightTime.font = [UIFont systemFontOfSize:13];
    [self.contentScrollView addSubview:rightTime];
    //
    NSURL *URL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"f4v" ofType:@"mp4"]];
    NSString *urlstring = [URL absoluteString];
    mplayerView.urlString = urlstring;
    mplayerView.leftTime = leftTime;
    mplayerView.rightTime = rightTime;
    mplayerView.titleLabel.hidden=YES;
    mplayerView.bottomView.hidden=YES;
    [self.contentScrollView addSubview:tipLabel];
    
    pro = [[GeelyMusicTransProgress alloc] initWithFrame:CGRectMake(tipLabel.frame.origin.x,tipLabel.frame.origin.y+tipLabel.frame.size.height,tipLabel.frame.size.width,53)];
    pro.clipsToBounds=YES;
    [self.contentScrollView addSubview:pro];
    
}
//
#pragma mark -
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    if(scrollView.tag == 99){
//        float percent = (scrollView.contentOffset.y/scrollView.contentSize.height) +0.4;
//        percent = percent>=1?1:percent;
//        percent = percent<=0.4?0.4:percent;
//        NSLog(@"%f",percent);
//        CGRect frame = rightSliderLine.frame;
//        frame.size.height = scrollView.frame.size.height*percent;
//        rightSliderLightLine.frame = frame;
//    }
//}
#pragma mark - collectionView代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 18;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GeelyMediaListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GeelyMediaListCell" forIndexPath:indexPath];
    cell.imgView.image = [UIImage imageNamed:@"mediaPlayer_icon_cell_banner"];
    cell.titleLabel.text = @"釜山行-国语中字2016";
    cell.titleLabel.font = [UIFont systemFontOfSize:13.5];
    cell.titleLabel.textAlignment = NSTextAlignmentCenter;
    cell.titleLabel.textColor = [UIColor colorWithRed:128.0/255.0 green:125.0/255.0 blue:118.0/255.0 alpha:1];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(index){
        GeelyMediaListCell *cell = (GeelyMediaListCell *)[collectionView cellForItemAtIndexPath:index];
        cell.edgeImgView.hidden = YES;
        cell.titleLabel.textColor = [UIColor colorWithRed:128.0/255.0 green:125.0/255.0 blue:118.0/255.0 alpha:1];
    }
    GeelyMediaListCell *cell = (GeelyMediaListCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.titleLabel.textColor = [UIColor colorWithRed:180.0/255.0 green:156.0/255.0 blue:102.0/255.0 alpha:1];
    cell.edgeImgView.hidden = NO;
    index = indexPath;
    //播放视频
    //清除上一次播放
    [rightPlayerView removeFromSuperview];
    [mplayerView removeFromSuperview];
    [tipLabel removeFromSuperview];
    [pro removeFromSuperview];
    [leftTime removeFromSuperview];
    [rightTime removeFromSuperview];
    //
    
    CLAVPlayerView *playerView = [CLAVPlayerView videoPlayView];
    playerView.frame = CGRectMake(0, 0,1310,492);
    playerView.center = self.view.center;
    playerView.contrainerViewController = self;
    [self.view addSubview:playerView];
    NSURL *URL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"f4v" ofType:@"mp4"]];
    NSString *urlstring = [URL absoluteString];
    playerView.urlString = urlstring;
    playerView.titleLabel.text = cell.titleLabel.text;
    //
}
#pragma mark - 当前播放列表
- (void)showCurrentMediaList:(UIButton*)sender{
    [(UIImageView*)sender.superview setImage:[UIImage imageNamed:@"mediaPlayer_icon_top_select1"]];
}
#pragma mark - 所有视频列表
- (void)showAllMediaList:(UIButton*)sender{
   [(UIImageView*)sender.superview setImage:[UIImage imageNamed:@"mediaPlayer_icon_top_select2"]]; 
}
#pragma mark - 
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[UIApplication sharedApplication].statusBarStyle =UIStatusBarStyleDefault;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [mplayerView removeFromSuperview];
}
- (void)dealloc{
    [mplayerView removeFromSuperview];
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
