//
//  GeelyPictureShowVC.m
//  Geely_Third
//
//  Created by 胡亚明 on 16/11/9.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyPictureShowVC.h"
#define RGB(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

@interface GeelyPictureShowVC () <UIScrollViewDelegate,GeelyFatherViewDatasource>
{
    UIScrollView *scroll;
    UILabel *countLabel;
    NSInteger page;
    UIView *fullView;
}

@end

@implementation GeelyPictureShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self;
    [self addFixedView];
    __block __weak GeelyPictureShowVC *weakself = self;
    [self addImageViewAnimate:^{
        [weakself setupSubViews];
    }];
    //
}
-(UIView *)geelyTopAnimateView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(82, 0, 819,57)];
    UIImageView *topSelectView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,819,65)];
    topSelectView.image = [UIImage imageNamed:@"picture_top_icon_02"];
    [view addSubview:topSelectView];
    return view;
}
- (void)setupSubViews{
    UIImageView *topSelectView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,819,65)];
    topSelectView.image = [UIImage imageNamed:@"picture_top_icon_02"];
//    topSelectView.userInteractionEnabled = YES;
//    UIButton *topLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, topSelectView.bounds.size.width*0.5, topSelectView.bounds.size.height)];
//    topLeftBtn.backgroundColor = [UIColor clearColor];
//    [topLeftBtn addTarget:self action:@selector(showCurrentMediaList:) forControlEvents:UIControlEventTouchUpInside];
//    [topSelectView addSubview:topLeftBtn];
//    UIButton *topRightBtn = [[UIButton alloc] initWithFrame:CGRectMake(topSelectView.bounds.size.width*0.5, 0, topSelectView.bounds.size.width*0.5, topSelectView.bounds.size.height)];
//    topRightBtn.backgroundColor = [UIColor clearColor];
//    [topRightBtn addTarget:self action:@selector(showAllMediaList:) forControlEvents:UIControlEventTouchUpInside];
//    [topSelectView addSubview:topRightBtn];
    //[self.contentView addSubview:topSelectView];
    //
    UIImageView *usbImgView = [[UIImageView alloc] initWithFrame:CGRectMake(topSelectView.frame.origin.x+80,0,115,53)];
    usbImgView.image = [UIImage imageNamed:@"mediaPlayer_icon_usb2"];
    usbImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentScrollView addSubview:usbImgView];
    //
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(topSelectView.frame.origin.x+40,0, 819-40,360.5-5)];
    scroll.contentSize = CGSizeMake(scroll.frame.size.width*3,scroll.frame.size.height);
    scroll.pagingEnabled=YES;
    scroll.showsVerticalScrollIndicator=NO;
    scroll.showsHorizontalScrollIndicator=YES;
    scroll.userInteractionEnabled=NO;
    scroll.delegate = self;
    for (NSInteger i=0; i<3; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(scroll.frame.size.width*i, 0,scroll.frame.size.width, scroll.frame.size.height)];
        img.image = [UIImage imageNamed:@"picture_bg"];
        [scroll addSubview:img];
    }
    [self.contentScrollView insertSubview:scroll belowSubview:usbImgView];
    //
    UIImageView *bottomTool = [[UIImageView alloc] initWithFrame:CGRectMake(scroll.frame.origin.x-5, scroll.frame.origin.y+scroll.frame.size.height-62, 829-40,71.5)];
    bottomTool.image = [UIImage imageNamed:@"picture_bottom_toolView"];
    bottomTool.userInteractionEnabled=YES;
    bottomTool.contentMode = UIViewContentModeScaleAspectFit;
    //
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,72,62)];
    [leftBtn addTarget:self action:@selector(showPrecedingPic:) forControlEvents:UIControlEventTouchUpInside];
    //leftBtn.backgroundColor = [UIColor redColor];
    [bottomTool addSubview:leftBtn];
    //
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(110,0,72,62)];
    [rightBtn addTarget:self action:@selector(showNextPic:) forControlEvents:UIControlEventTouchUpInside];
    //rightBtn.backgroundColor = [UIColor redColor];
    [bottomTool addSubview:rightBtn];
    [self.contentScrollView addSubview:bottomTool];
    //
    UIButton *showFullBtn = [[UIButton alloc] initWithFrame:CGRectMake(bottomTool.frame.size.width-72, 0, 72,62)];
    [showFullBtn addTarget:self action:@selector(showFullPic:) forControlEvents:UIControlEventTouchUpInside];
    //showFullBtn.backgroundColor = [UIColor redColor];
    [bottomTool addSubview:showFullBtn];
    //
    UIImageView *rightImgs = [[UIImageView alloc] initWithFrame:CGRectMake(scroll.frame.origin.x+scroll.frame.size.width+55, scroll.frame.origin.y, 260, 320)];
    rightImgs.image = [UIImage imageNamed:@"picture_right_imgs_03"];
    [self.contentScrollView addSubview:rightImgs];
    //
    countLabel = [[UILabel alloc] initWithFrame:CGRectMake(rightImgs.frame.origin.x, rightImgs.frame.origin.y+rightImgs.frame.size.height-10, rightImgs.frame.size.width,30)];
    countLabel.text = @"1/10";
    page = 1;
    countLabel.font = [UIFont systemFontOfSize:18];
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.textColor = RGB(171, 171, 171);
    //countLabel.contentMode = UIViewContentModeTop;
    [self.contentScrollView addSubview:countLabel];
}
- (void)showFullPic:(UIButton*)sender{
    fullView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,1310,492)];
    fullView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
    fullView.center = self.view.center;
    [self.view addSubview:fullView];
    //
    UIScrollView *sclView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,fullView.frame.size.width,fullView.frame.size.height)];
    sclView.contentSize = CGSizeMake(sclView.frame.size.width*3,sclView.frame.size.height);
    sclView.tag=999;
    sclView.pagingEnabled=YES;
    sclView.showsVerticalScrollIndicator=NO;
    sclView.showsHorizontalScrollIndicator=YES;
    sclView.userInteractionEnabled=NO;
    sclView.delegate = self;
    for (NSInteger i=0; i<3; i++) {
        UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(sclView.frame.size.width*i, 0,sclView.frame.size.width, sclView.frame.size.height)];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 874, bg.frame.size.height)];
        img.center = CGPointMake(bg.frame.size.width*0.5,img.center.y);
        img.image = [UIImage imageNamed:@"picture_bg"];
        [bg addSubview:img];
        [sclView addSubview:bg];
    }
    [sclView setContentOffset:CGPointMake(sclView.frame.size.width,sclView.contentOffset.y) animated:NO];
    [fullView addSubview:sclView];
    //
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(22.5+35, 0, 1310-53, 48)];
    titleLabel.text = @"午后阳光.png";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:16.5];
    titleLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [fullView addSubview:titleLabel];
    //
    UIImageView *bottomBg = [[UIImageView alloc] initWithFrame:CGRectMake(titleLabel.frame.origin.x-35,fullView.frame.size.height-62-10, fullView.frame.size.width-53, 62)];
    bottomBg.image = [UIImage imageNamed:@"picture_full_bg"];
    bottomBg.userInteractionEnabled = YES;
    [fullView addSubview:bottomBg];
    //
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,72,62)];
    [leftBtn addTarget:self action:@selector(showPrecedingPic) forControlEvents:UIControlEventTouchUpInside];
    //leftBtn.backgroundColor = [UIColor redColor];
    [bottomBg addSubview:leftBtn];
    //
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(110,0,72,62)];
    [rightBtn addTarget:self action:@selector(showNextPic) forControlEvents:UIControlEventTouchUpInside];
    //rightBtn.backgroundColor = [UIColor redColor];
    [bottomBg addSubview:rightBtn];
    //
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(bottomBg.frame.size.width-72, 0, 72,62)];
    [closeBtn addTarget:self action:@selector(showFullPic) forControlEvents:UIControlEventTouchUpInside];
    //showFullBtn.backgroundColor = [UIColor redColor];
    [bottomBg addSubview:closeBtn];
}
- (void)showPrecedingPic:(UIButton*)sender{
    if(page>1){
        page--;
        [scroll setContentOffset:CGPointMake(scroll.contentOffset.x-scroll.frame.size.width, scroll.contentOffset.y) animated:YES];
    }
    countLabel.text = [NSString stringWithFormat:@"%ld/10",page];
}
- (void)showNextPic:(UIButton*)sender{
    if(page<10){
        countLabel.text = [NSString stringWithFormat:@"%ld/10",++page];
        [scroll setContentOffset:CGPointMake(scroll.contentOffset.x+scroll.frame.size.width, scroll.contentOffset.y) animated:YES];
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width,scrollView.contentOffset.y) animated:NO];
}
#pragma mark - 全屏浏览事件
- (void)showPrecedingPic{
    UIScrollView*sclView = [fullView viewWithTag:999];
    [sclView setContentOffset:CGPointMake(sclView.contentOffset.x-sclView.frame.size.width, sclView.contentOffset.y) animated:YES];
    
}
- (void)showNextPic{
    UIScrollView*sclView = [fullView viewWithTag:999];
    [sclView setContentOffset:CGPointMake(sclView.contentOffset.x+sclView.frame.size.width, sclView.contentOffset.y) animated:YES];
}
- (void)showFullPic{
    [fullView removeFromSuperview];
    fullView=nil;
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
