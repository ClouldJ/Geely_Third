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
    UIImageView *topSelectView = [[UIImageView alloc] initWithFrame:CGRectMake(82,0,819,65)];
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
    UIImageView *usbImgView = [[UIImageView alloc] initWithFrame:CGRectMake(topSelectView.frame.origin.x+80,topSelectView.frame.origin.y+topSelectView.frame.size.height+18,115,53)];
    usbImgView.image = [UIImage imageNamed:@"mediaPlayer_icon_usb2"];
    usbImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:usbImgView];
    //
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(topSelectView.frame.origin.x+40,topSelectView.frame.origin.y+topSelectView.frame.size.height+5, 819-40,360.5-5)];
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
    [self.contentView insertSubview:scroll belowSubview:usbImgView];
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
    [self.contentView addSubview:bottomTool];
    //
    UIImageView *rightImgs = [[UIImageView alloc] initWithFrame:CGRectMake(scroll.frame.origin.x+scroll.frame.size.width+55, scroll.frame.origin.y, 260, 320)];
    rightImgs.image = [UIImage imageNamed:@"picture_right_imgs_03"];
    [self.contentView addSubview:rightImgs];
    //
    countLabel = [[UILabel alloc] initWithFrame:CGRectMake(rightImgs.frame.origin.x, rightImgs.frame.origin.y+rightImgs.frame.size.height-10, rightImgs.frame.size.width,30)];
    countLabel.text = @"1/10";
    page = 1;
    countLabel.font = [UIFont systemFontOfSize:18];
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.textColor = RGB(171, 171, 171);
    //countLabel.contentMode = UIViewContentModeTop;
    [self.contentView addSubview:countLabel];
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
