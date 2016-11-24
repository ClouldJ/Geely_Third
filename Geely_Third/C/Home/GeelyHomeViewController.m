//
//  GeelyHomeViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/9/27.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyHomeViewController.h"

#import "GeelyContentBottomView.h"
#import "GeelyAutoViewController.h"
#import "GeelyMusciViewController.h"
#import "GeelySettingViewController.h"

#import "GeelyPhoneInputView.h"
#import "GeelyPhoneCalledView.h"

#import "GeelySettingLittleView.h"
#import "GeelyMusicLittleView.h"
#import "GeelyMediaLittleView.h"
#import "GeelyCalledListView.h"

#import "GeelyCallViewController.h"
#import "GeelyBottomAirAutoView.h"
#import "GeelyNoVoliceView.h"
#import "GeelyNo.h"
#import <MediaPlayer/MediaPlayer.h>
#import "GeelyScreenView.h"
#import "GeelyWeatherViewController.h"
#import "GeelyDisplayPowerView.h"
#import "GeelyPowerDisplayView.h"
#import "GeelyMusicAViewController.h"
#import "GeelyCallAViewController.h"
#import "GeelyMusicAViewController.h"
#import "GeelySettingAViewController.h"

#define DEV_H [UIScreen mainScreen].bounds.size.height
#define DEV_W [UIScreen mainScreen].bounds.size.width
#define BASEHEIGHT ((2732*720)/1920)/2

@interface GeelyHomeViewController () <GeelyLeftContainsDelegate,GeelyMusicCDAnimationViewDelegate,GeelyPhoneInputViewDelegate,GeelyDisplayPowerViewDelegate,GeelyPhoneCalledViewDelegate,GeelyContentInfoViewDelegate,GeelyMusicLittleViewDelegate,UIGestureRecognizerDelegate,GeelyRightContainsViewMoveDelegate> {
    /**
     **leftView    左侧视图容器**
     **contentView 中间视图容器**
     **rightView   右边视图容器**
     **/
    MPMusicPlayerController *vvlioce;

    UIView *baseView;
    GelelyLeftContainsView *leftView;
    GeelyContentContainsView *contentView;
    GeelyRightContainsView *rightView;
    
    //拖动的view手势
    UIPanGestureRecognizer *panGesture;
    
    GeelyContentBottomView *bottomView;
    UIView *phoneView;
    UIView *phoneCalledView;
    
    AVAudioPlayer *acPlayer;
    
    /**
     **
     **/
    CGPoint leftPoint;
    CGPoint contentPoint;
    CGPoint rightPoint;
        
    BOOL isLeftMove;
    BOOL isRightMove;
    BOOL isLeftBtn;
    
    BOOL leftMoved;
    BOOL music;
    BOOL rightMoved;
    BOOL phone;
    GeelyScreenView *screenView;

    BOOL didClicked;
    UIView *presentScrollView;
    UIScrollView *viewScroll;
    GeelyMusicLittleView *musica;
    CGFloat singTime;
    BOOL isShowing;
    NSMutableArray *checkShowArray;
    CGFloat volume;
    GeelyBottomAirAutoView *vv_bottom;
    MainRequest *mainRequest;
    
    UIImageView *imageViewContentBG;
    
    GeelyLeftFrameDynamicView *dynamicView;
    
    GeelyLeftFrameDynamicView *dynamicViewMusic;

    GeelyLeftFrameDynamicView *dynamicViewCall;

    GeelyLeftFrameDynamicView *dynamicViewSet;

    
    UIView *dynamicCurrentView;

}


@end


@implementation GeelyHomeViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissPresentView:) name:DISMISS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dididididdididi) name:@"geelyfin" object:nil];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"left" forKey:@"dismiss"];
    [[NSNotificationCenter defaultCenter] postNotificationName:DISMISS object:nil userInfo:dic];
    //添加驾驶模式转换通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeRed) name:MODE_RED object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeBlue) name:MODE_BLUE object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomegold) name:MODE_GOLD object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backDynamicView) name:SLIDEDISMISS object:nil];
}



#pragma mark 首页返回事件处理
-(void)backDynamicView{
    
    [self leftHiden];
    [dynamicView dismissAnimationView:dynamicView.currentView animationFinish:^{
        NSLog(@"收到通知并做出了处理");
    }];
    
}

-(void)becomeBlue{

    [imageViewContentBG animationImage:[UIImage imageNamed:@"Geely_home_bg_blue"]];
    [SingleModel sharedInstance].displayType = BLUE;
}

-(void)becomeRed {

    [imageViewContentBG animationImage:[UIImage imageNamed:@"Geely_home_bg_red"]];
    [SingleModel sharedInstance].displayType = RED;
}

-(void)becomegold{

    [imageViewContentBG animationImage:[UIImage imageNamed:@"Geely_11-17home_bg"]];
    [SingleModel sharedInstance].displayType = GOLD;
}

-(void)dididididdididi {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!isLeftBtn) {
            [self leftHiden];
        }else{
            [self rightHiden];
        }
    });
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    //TODO
//    [self leftHiden];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"进来了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    vvlioce = [[MPMusicPlayerController alloc] init];
    volume = vvlioce.volume;
    
    isShowing = NO;
    music = NO;
    phone = NO;
    didClicked = NO;
    checkShowArray = [NSMutableArray array];
    
    UIImageView *imageView_BG = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView_BG.image = [UIImage imageNamed:@"0930-IPAD-底图V2"];
    imageView_BG.userInteractionEnabled = YES;
    [self.view addSubview:imageView_BG];
    
    baseView = [[UIView alloc] initWithFrame:CGRectMake((DEV_W - 1310)/2,(DEV_H - 492)/2, 1310, 492)];
    baseView.backgroundColor = [UIColor clearColor];
    baseView.center = self.view.center;
    [self.view addSubview:baseView];
    
#pragma mark 首页逻辑需调整位置
    //TODO 先加载需要推出的视图，再加载那张背景图，接着加载左右按钮
//    dynamicViewMusic = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(110-340, 0, 340, 435) animateStyle:DYNAMIC_MUSIC];
//    dynamicViewCall = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(110-340, 0, 340, 435) animateStyle:DYNAMIC_CALLZ];
//    dynamicViewSet = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(110-340, 0, 340, 435) animateStyle:DYNAMIC_SETTZ];

    
    self.view.backgroundColor = [UIColor whiteColor];
    imageViewContentBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, baseView.frame.size.width, baseView.frame.size.height)];
    imageViewContentBG.image = [UIImage imageNamed:@"Geely_11-17home_bg"];
    [baseView addSubview:imageViewContentBG];
    
    dynamicViewMusic = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(110-340, 0, 340, 435)];
    [baseView addSubview:dynamicViewMusic];
    
    dynamicViewSet = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(110-340, 0, 340, 435)];
    [baseView addSubview:dynamicViewSet];
    
    dynamicViewCall = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(110-340, 0, 340, 435)];
    [baseView addSubview:dynamicViewCall];
    
    UIImageView *imageNewBg = [[UIImageView alloc] initWithFrame:CGRectMake(82-110, 0, 110, 870/2)];
    imageNewBg.userInteractionEnabled = YES;
    imageNewBg.image = [UIImage imageNamed:@"imageNewBg"];
    [baseView addSubview:imageNewBg];
    
//    UIImageView *imageView_bottom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"空调wqqweqw"]];
//    imageView_bottom.frame = CGRectMake(0, baseView.frame.size.height - 57, 1310, 57);
//    imageView_bottom.backgroundColor = [UIColor clearColor];
//    imageView_bottom.userInteractionEnabled = YES;
//    [baseView addSubview:imageView_bottom];
    
    
    vv_bottom = [[GeelyBottomAirAutoView alloc] initWithFrame:CGRectMake(0, baseView.frame.size.height - 57, 1310, 57)];
    vv_bottom.backgroundColor = [UIColor clearColor];
    [baseView addSubview:vv_bottom];
    
    UIButton *air_button = [[UIButton alloc] initWithFrame:CGRectMake(1180/2-212, 0, 552, 57)];
    air_button.backgroundColor = [UIColor clearColor];
//    [air_button addTarget:self action:@selector(buttonAUTOAction:) forControlEvents:UIControlEventTouchUpInside];
    [vv_bottom addSubview:air_button];
    
    UISwipeGestureRecognizer *sw_air = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureAir:)];
    sw_air.direction = UISwipeGestureRecognizerDirectionUp;
    UITapGestureRecognizer *tap_air = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAir:)];
    
    [air_button addGestureRecognizer:sw_air];
    [air_button addGestureRecognizer:tap_air];
    [tap_air requireGestureRecognizerToFail:sw_air];
    
    [self loadleftView:leftView contentView:contentView rightView:rightView];
    
//    presentScrollView = [[[NSBundle mainBundle] loadNibNamed:@"presentPhoneView" owner:self options:nil]firstObject];
//    presentScrollView.backgroundColor = [UIColor clearColor];
//    presentScrollView.frame = CGRectMake(82, 0, 0, 0);
//    [baseView addSubview:presentScrollView];
//    
//    [SingleModel sharedInstance].didView = presentScrollView;
//    
//    viewScroll = (UIScrollView *)[presentScrollView viewWithTag:20160129];
//    viewScroll.pagingEnabled = YES;
//    viewScroll.scrollEnabled = NO;
//    viewScroll.contentSize = CGSizeMake(340*3, 435*3);

    
//    //给侧面弹出视图添加view
//    GeelyPhoneInputView *phoneInputView = [[GeelyPhoneInputView alloc] initWithFrame:CGRectMake(0, 0, 340, 435)];
//    phoneInputView.backgroundColor = [UIColor clearColor];
//    phoneInputView.delegate = self;
//    [viewScroll addSubview:phoneInputView];
//    
//    //setting
//    GeelySettingLittleView *setting = [[GeelySettingLittleView alloc] initWithFrame:CGRectMake(340, 0, 340, 435)];
//    [viewScroll addSubview:setting];
//    
//    //music
//    musica = [[GeelyMusicLittleView alloc] initWithFrame:CGRectMake(340*2, 0, 340, 435)];
//    musica.delegate = self;
//    [viewScroll addSubview:musica];
    
//    GeelyMediaLittleView *media = [[GeelyMediaLittleView alloc] initWithFrame:CGRectMake(340*3, 0, 340, 435)];
//    media.block = ^(){
//        [acPlayer play];
//        viewScroll.contentOffset = CGPointMake(340*2, 0);
//        [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
//        
//        mainRequest.requestMusic.type = @1;
//        mainRequest.requestPhone.type = @0;
//        mainRequest.requestVoice.type = @0;
//        mainRequest.requestRadio.type = @0;
//        mainRequest.requestVolume.type = @1;
//        mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
//        
//        
//        [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
//        } failure:^(__kindof HGBaseRequest *request, NSError *error) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
//        }];
//
//    };
//    [viewScroll addSubview:media];
    
//    GeelyCalledListView *calledList = [[GeelyCalledListView alloc] initWithFrame:CGRectMake(340*4, 0, 340, 435)];
//    [viewScroll addSubview:calledList];
    
    UIButton *button_volume_ = [[UIButton alloc] initWithFrame:CGRectMake(WWWWWWWWWWW/2 - 160, HHHHHHHHHHH-180, 60, 60)];
    button_volume_.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button_volume_];
    [button_volume_ addTarget:self action:@selector(volumeLes) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button_vo = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+280, button_volume_.frame.origin.y, 60, 60)];
    button_vo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button_vo];
    [button_vo addTarget:self action:@selector(volumeAdd) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *homeBtn = [[UIButton alloc] initWithFrame:CGRectMake(button_volume_.frame.origin.x+60+40, HHHHHHHHHHH-180, 120, 70)];
    homeBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:homeBtn];
    
    UITapGestureRecognizer *home_tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(homeAction:)];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longAction:)];
    
    [home_tap requireGestureRecognizerToFail:longPress];
    
    [homeBtn addGestureRecognizer:home_tap];
    [homeBtn addGestureRecognizer:longPress];
    
    dynamicView = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(82, 0, 0, 435)];
    dynamicView.backgroundColor = [UIColor clearColor];
    [baseView addSubview:dynamicView];
    dynamicCurrentView = [[UIView alloc] init];
    
//    [homeBtn addTarget:self action:@selector(homeViewShow:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)swipeGestureAir:(UISwipeGestureRecognizer *)ss {

    if (ss.direction == UISwipeGestureRecognizerDirectionUp) {
        GeelyAutoViewController *va = [[GeelyAutoViewController alloc] init];
        [self.navigationController pushViewController:va animated:NO];
    }
}

-(void)tapGestureAir:(UITapGestureRecognizer *)tap {
    GeelyAutoViewController *va = [[GeelyAutoViewController alloc] init];
    [self.navigationController pushViewController:va animated:NO];
}

-(void)homeAction:(UITapGestureRecognizer *)tap {
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    window.rootViewController = [[GeelyHomeViewController alloc] init];
    NSLog(@"单击处理");
    [self leftHiden];
    [dynamicView dismissAnimationView:dynamicView.currentView animationFinish:^{
        NSLog(@"首页home建单击处理");
    }];
}

-(void)longAction:(UILongPressGestureRecognizer *)longpres {
    GeelyDisplayPowerView *cc = [[GeelyDisplayPowerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cc.delegate = self;
    [cc showAnimation];
}

-(void)homeViewShow:(UIButton *)btn {
    GeelyDisplayPowerView *cc = [[GeelyDisplayPowerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cc.delegate = self;
    [cc showAnimation];
}
#pragma mark displayView delegate
-(void)showDisplayView:(GeelyDisplayPowerView *)view {
    screenView = [[GeelyScreenView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [screenView showAnimate];
}

-(void)showPowerView:(GeelyDisplayPowerView *)view {
    NSLog(@"电源");
    GeelyPowerDisplayView *vb = [[GeelyPowerDisplayView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [vb showAnimation];
}

-(void)volumeAdd{
    [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    }];
    
    if (vvlioce.volume<=1) {
        volume = volume+0.1;
        vvlioce.volume = volume;
        [vv_bottom.vv autoMakeViewFrame:vvlioce.volume*2];
    }
}

-(void)volumeLes {
    if (vvlioce.volume>=0) {
        volume = volume-0.1;
        vvlioce.volume = volume;
        [vv_bottom.vv autoMakeViewFrame:vvlioce.volume*2];
        
        if (vvlioce.volume == 0) {
            [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@0] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }else{
            [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            } failure:^(__kindof HGBaseRequest *request, NSError *error) {
                [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
            }];
        }
    }
}

-(void)buttonAUTOAction:(UIButton *)btn {
    GeelyAutoViewController *va = [[GeelyAutoViewController alloc] init];
    [self.navigationController pushViewController:va animated:NO];
}

#pragma mark public views
-(void)loadleftView:(GelelyLeftContainsView *)lView contentView:(GeelyContentContainsView *)cView rightView:(GeelyRightContainsView *)rView {
    for (int i = 0; i<3; i++) {
//        panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
        panGesture.delegate = self;
        if (i == 0) {
            lView = [[GelelyLeftContainsView alloc] initWithFrame:CGRectMake(0, 0, 82, baseView.frame.size.height - 57)];
            lView.backgroundColor = [UIColor clearColor];
            [baseView addSubview:lView];
//            [lView addGestureRecognizer:panGesture];
            leftView = lView;
//            [self.view bringSubviewToFront:leftView];
            leftView.tableView_.delegate = self;
            leftPoint = lView.center;
        }else if (i == 1) {
            cView = [[GeelyContentContainsView alloc] initWithFrame:CGRectMake(lView.frame.origin.x+lView.frame.size.width, 0, 1310-340-82, baseView.frame.size.height - 57)];
            cView.backgroundColor = [UIColor clearColor];
            cView.view_ddd.delegate = self;
            [baseView addSubview:cView];
//            [cView addGestureRecognizer:panGesture];
            contentView = cView;
            contentPoint = cView.center;
        }else{
            rView = [[GeelyRightContainsView alloc] initWithFrame:CGRectMake(cView.frame.origin.x+cView.frame.size.width, 0, 340, baseView.frame.size.height - 57)];
            rView.backgroundColor = [UIColor clearColor];
            [baseView addSubview:rView];
//            [rView addGestureRecognizer:panGesture];
            rightView = rView;
            rightView.delegate = self;
            rightPoint = rView.center;
        }
    }
    isLeftMove = NO;
    isRightMove = NO;
    isLeftBtn = NO;
    
    leftMoved = NO;
    rightMoved = NO;
}

-(void)swipeGesture:(UIPanGestureRecognizer *)gesture {
    UIView *responsView = gesture.view;
    [self.view bringSubviewToFront:responsView];
        if (gesture.state == UIGestureRecognizerStateBegan) {
        

    }else if (gesture.state == UIGestureRecognizerStateChanged) {
        if (responsView == leftView) {
            responsView.center = [gesture locationInView:baseView];
            
            if (!isLeftMove) {
                if (leftView.frame.origin.x+leftView.frame.size.width>=rightView.frame.origin.x) {
                    [self leftViewMoveToLeft:leftView];
                }
            }else{

                if (leftView.frame.origin.x<=340) {
                    [self leftViewMoveToRight];
//                    UIProgressView
                }
            }
            
        }else if (responsView ==contentView) {
        }else{
            responsView.center = [gesture locationInView:baseView];
            
            if (!isRightMove) {
                if (rightView.frame.origin.x<=82) {
                    [self rightViewMoveToLeft];
                }
            }else{
                if (rightView.frame.origin.x+rightView.frame.size.width>=leftView.frame.origin.x) {
                    [self rightViewMoveToRight];
                }
            }
            
        }

    }else if (gesture.state == UIGestureRecognizerStateEnded) {
        if (responsView == leftView) {
            
            if (!isLeftMove) {
                if (rightView.frame.origin.x == 0) {
                    [UIView animateWithDuration:.3f animations:^{
                        leftView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, responsView.frame.size.width, baseView.frame.size.height - 57);
                    } completion:^(BOOL finished) {
                    }];
                }else{
                    [UIView animateWithDuration:.3f animations:^{
                        leftView.frame = CGRectMake(0, 0, 82, baseView.frame.size.height - 57);
                    }];
                }
                
            }else{
                if (rightView.frame.origin.x == contentView.frame.origin.x+contentView.frame.size.width) {
                    [UIView animateWithDuration:.3f animations:^{
                        leftView.frame = CGRectMake(0, 0, leftView.frame.size.width, baseView.frame.size.height - 57);
                    } completion:^(BOOL finished) {
                    }];
                }else{
                    [UIView animateWithDuration:.3f animations:^{
                        leftView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, responsView.frame.size.width, baseView.frame.size.height - 57);
                    }];
                }
                
            }
        }else if (responsView == rightView) {
            if (!isRightMove) {
                if (leftView.frame.origin.x==contentView.frame.origin.x+contentView.frame.size.width) {
                    [UIView animateWithDuration:.3f animations:^{
                        rightView.frame = CGRectMake(0, 0, 340, rightView.frame.size.height);
                    }];
                }else{
                    [UIView animateWithDuration:.3f animations:^{
                        rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, 340, baseView.frame.size.height - 57);
                    }];
                }
            }else{
                if (leftView.frame.origin.x == 0) {
                    [UIView animateWithDuration:.3f animations:^{
                        rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, rightView.frame.size.width, baseView.frame.size.height - 57);
                    }];
                }else{
                    [UIView animateWithDuration:.3f animations:^{
                        rightView.frame = CGRectMake(0, 0, 340, rightView.frame.size.height);
                    }];
                }
            }
        }

        

        
        leftPoint = leftView.center;
        contentPoint = contentView.center;
        rightPoint = rightView.center;


        if (isLeftMove) {
            if (leftView.frame.origin.x<rightView.frame.origin.x) {
                isLeftMove = NO;
            }
        }else{
            if (leftView.frame.origin.x > rightView.frame.origin.x) {
                isLeftMove = YES;
            }
        }
        
        if (isRightMove) {
            if (rightPoint.x>leftPoint.x) {
                isRightMove = NO;
            }
        }else{
            if (rightPoint.x < leftPoint.x) {
                isRightMove = YES;
            }
        }
}else{
        NSLog(@"会不会进来呢");
    }

}


#pragma mark GeelyLeftContainsDelegate

-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"首页单击");
//
//    
//    switch (indexPath.row) {
//        case 0:
//        {
////            if (!isLeftBtn) {
////                [self leftHiden];
////            }else{
////                [self rightHiden];
////            }
////            
////
////            
////            GeelyNo *geely = [[GeelyNo alloc] initWithFrame:CGRectMake(0, 0, WWWWWWWWWWW, HHHHHHHHHHH)];
////            [geely sssShowAnimate];


    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"右边侧边栏应该显示什么呢");
        }
            break;
        case 1:
        {
            [self leftShow];
            
            [dynamicViewMusic showAnimationStyle:DYNAMIC_MUSIC finish:^(UIView *amicView) {
                NSLog(@"音乐移动完成");
            }];
            
            
            [UIView animateWithDuration:.5f animations:^{
                dynamicViewMusic.frame = CGRectMake(82, 0, 340, 435);
            } completion:^(BOOL finished) {
                
            }];
            
        }
            break;
        case 2:
        {
            [self leftShow];

//            [dynamicView startAnimationViewStyle:DYNAMIC_CALLZ finish:^(UIView *amicView) {
//                dynamicCurrentView = amicView;
//            }];
            
            [dynamicViewCall showAnimationStyle:DYNAMIC_CALLZ finish:^(UIView *amicView) {
                NSLog(@"新动画执行完成");
            }];
            
            [UIView animateWithDuration:.5f animations:^{
                dynamicViewCall.frame = CGRectMake(82, 0, 340, 435);
            }];
            
        }
            break;
        case 3:
        {
            [self leftShow];
//            [dynamicView startAnimationViewStyle:DYNAMIC_SETTZ finish:^(UIView *amicView) {
//                dynamicCurrentView = amicView;
//            }];
            [dynamicViewSet showAnimationStyle:DYNAMIC_SETTZ finish:nil];
//            dynamicViewSet.backgroundColor = [UIColor orangeColor];

            [UIView animateWithDuration:.5f animations:^{
                dynamicViewSet.frame = CGRectMake(82, 0, 340, 435);
            }];
        }
            break;
        case 4:
        {
            [self leftHiden];
            [dynamicView dismissAnimationView:dynamicView.currentView animationFinish:^{
                NSLog(@"隐藏成功");
            }];
        }
            break;
        case 5:
            break;
        default:
            break;
    }

//        }
//            break;
//        case 1:
//        {
//            if (![SingleModel sharedInstance].isMusic) {
//                [SingleModel sharedInstance].isMusic = YES;
//                viewScroll.contentOffset = CGPointMake(340*2, 0);
//                [musica startMusicAnimation];
//                GeelyMusicAudioManager *manager = [GeelyMusicAudioManager defaultManager];
//                acPlayer = [manager playMusic:@"Zki & Dobre-Listen To The Talk"];
//                musica.animationImage.delegate = self;
//                singTime = (float)acPlayer.duration;
//                
//                [[[SingleModel sharedInstance] singleMainRequest:@"Music" type_value:@1] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
//                    [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
//                } failure:^(__kindof HGBaseRequest *request, NSError *error) {
//                    [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
//                }];
//            }else{
//                viewScroll.contentOffset = CGPointMake(340*2, 0);
//                [musica startMusicAnimation];
//                musica.animationImage.delegate = self;
//                singTime = 230;
//            }
//            
//        }
//            break;
//        case 2:
//        {
//            [UIView animateWithDuration:.3f animations:^{
//                viewScroll.contentOffset =CGPointMake(0, 0);
//            }];
//        }
//            break;
//        case 3:
//            viewScroll.contentOffset = CGPointMake(340, 0);
//            break;
//        case 4:
//            //回到主菜单
//        {
//                if (!isLeftBtn) {
//                    [self leftHiden];
//                }else{
//                    [self rightHiden];
//                }
//        }
//            return;
//            break;
//        default:
//            break;
//    }
//    
////    [SingleModel sharedInstance].isRel = isLeftBtn;
////    
////    if ([checkShowArray containsObject:indexPath]) {
////        [checkShowArray removeObject:indexPath];
////        
////        if (!isLeftBtn) {
////            [self leftHiden];
////        }else{
////            [self rightHiden];
////        }
////    }else{
////        for (NSIndexPath *index in checkShowArray) {
////            if (index == indexPath) {
////                [checkShowArray addObject:indexPath];
////            }else{
////                [checkShowArray removeObject:index];
////            }
////        }
////        
////        if (!isLeftBtn) {
////        }else{
////            [self rightShow];
////        }
////    }
//

}

-(void)geelySecTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"首页双击");
    
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"点击的第一个图表，不做任何反应");
        }
            break;
        case 1:
        {
            GeelyMusicAViewController *vc = [[GeelyMusicAViewController alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
        }
            break;
        case 2:
        {
            GeelyCallAViewController *vc = [[GeelyCallAViewController alloc] init];
            [self.navigationController pushViewController:vc  animated:NO];
        }
            break;
        case 3:
        {
            GeelySettingAViewController *vc = [[GeelySettingAViewController alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
        }
            break;
        case 4:
        {
            if (!isLeftBtn) {
                [self leftHiden];
            }else{
                [self rightHiden];
            }
            [dynamicView dismissAnimationView:dynamicView.currentView animationFinish:^{
                NSLog(@"隐藏成功");
            }];
        }
            break;
        default:
            break;
    }
    
}

-(void)geelyLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 4:
        {

        }
            break;
            
        case 1:
        {
            if (!music) {
                leftView.bbb.hidden = YES;
                [UIView animateWithDuration:.5f animations:^{
                    leftView.bbb.frame = CGRectMake(leftView.frame.size.width, 0, leftView.tableView_left_down.frame.size.width, leftView.tableView_left_down.frame.size.height);
                    [self.view bringSubviewToFront:leftView.tableView_left_down];
                    
                    contentView.frame = CGRectMake(contentView.frame.origin.x+340, 0, contentView.frame.size.width, baseView.frame.size.height - 40);
                    rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, rightView.frame.size.width, rightView.frame.size.height);
                } completion:^(BOOL finished) {
                    leftView.bbb.hidden = NO;
                    music = YES;
                }];
            }else{
                [UIView animateWithDuration:.5f animations:^{
                    leftView.bbb.frame = CGRectMake(leftView.frame.size.width-340, 0, 340, baseView.frame.size.height - 40);
                    contentView.frame = CGRectMake(leftView.frame.origin.x+leftView.frame.size.width, 0, contentView.frame.size.width, baseView.frame.size.height - 40);
                    rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, rightView.frame.size.width, rightView.frame.size.height);
                } completion:^(BOOL finished) {
                    leftView.bbb.hidden = YES;
                    music = NO;
                }];
            }
        }
            break;
        case 2:
        {
            if (!phone) {
                leftView.keyBoardView.hidden = YES;
                [UIView animateWithDuration:.5f animations:^{
                    leftView.keyBoardView.frame = CGRectMake(leftView.frame.size.width, 0, leftView.tableView_left_down.frame.size.width, leftView.tableView_left_down.frame.size.height);
                    [self.view bringSubviewToFront:leftView.tableView_left_down];
                    
                    contentView.frame = CGRectMake(contentView.frame.origin.x+340, 0, contentView.frame.size.width, baseView.frame.size.height - 40);
                    rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, rightView.frame.size.width, rightView.frame.size.height);
                } completion:^(BOOL finished) {
                    leftView.keyBoardView.hidden = NO;
                    phone = YES;
                }];
            }else{
                [UIView animateWithDuration:.5f animations:^{
                    leftView.keyBoardView.frame = CGRectMake(leftView.frame.size.width-340, 0, 340, baseView.frame.size.height - 40);
                    contentView.frame = CGRectMake(leftView.frame.origin.x+leftView.frame.size.width, 0, contentView.frame.size.width, baseView.frame.size.height - 40);
                    rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, rightView.frame.size.width, rightView.frame.size.height);
                } completion:^(BOOL finished) {
                    leftView.keyBoardView.hidden = YES;
                    phone = NO;
                }];
            }
        }
            break;
        case 0:
        {
            if (!didClicked) {
                NSLog(@"单击");
            }
            
            GeelyMusciViewController *vc = [[GeelyMusciViewController alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
            
        }
            break;
        default:
        {
            GeelySettingViewController *vc = [[GeelySettingViewController alloc] init];
            [self.navigationController pushViewController:vc animated:NO];
        }
            break;
    }
}

#pragma mark views animation

-(void)leftShow {
    [UIView animateWithDuration:.5f animations:^{
        contentView.frame = CGRectMake(82+340, 0, contentView.frame.size.width, baseView.frame.size.height - 57);
        rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, rightView.frame.size.width, rightView.frame.size.height);
        
        imageViewContentBG.frame = CGRectMake(340, imageViewContentBG.frame.origin.y, imageViewContentBG.frame.size.width, imageViewContentBG.frame.size.height);
    } completion:^(BOOL finished) {
        leftMoved = YES;
    }];
}

-(void)leftHiden {
    [UIView animateWithDuration:.5f animations:^{
        contentView.frame = CGRectMake(leftView.frame.origin.x+leftView.frame.size.width, 0, contentView.frame.size.width, baseView.frame.size.height - 57);
        rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, rightView.frame.size.width, rightView.frame.size.height);
        imageViewContentBG.frame = CGRectMake(0, imageViewContentBG.frame.origin.y, imageViewContentBG.frame.size.width, imageViewContentBG.frame.size.height);
    } completion:^(BOOL finished) {
        leftMoved = NO;
    }];
}

-(void)leftViewMoveToRight {
    [UIView animateWithDuration:.3f animations:^{
        isLeftBtn = NO;
//        leftPoint = leftView.center;
        contentView.frame = CGRectMake(82, 0, contentView.frame.size.width, baseView.frame.size.height - 57);
//        contentPoint = contentView.center;
        rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, rightView.frame.size.width, baseView.frame.size.height - 57);
        presentScrollView.frame = CGRectMake(82, 0, 0, 435);
//        rightPoint = rightView.center;
    }];
}

-(void)leftViewMoveToLeft:(GelelyLeftContainsView *)responsView {

    
    [UIView animateWithDuration:.3f animations:^{
        isLeftBtn = YES;
        rightView.frame = CGRectMake(0, 0, rightView.frame.size.width, rightView.frame.size.height);
        contentView.frame = CGRectMake(rightView.frame.origin.x+rightView.frame.size.width, 0, contentView.frame.size.width, contentView.frame.size.height);
//        rightPoint = rightView.center;
        contentPoint = contentView.center;

        presentScrollView.frame = CGRectMake(leftView.frame.origin.x, 0, 0, 435);
//        [self.view sendSubviewToBack:leftView];
    }];
}

-(void)rightViewMoveToLeft {

    
    [UIView animateWithDuration:.3f animations:^{
        isLeftBtn = YES;
        contentView.frame = CGRectMake(340, 0, contentView.frame.size.width, baseView.frame.size.height - 57);
        leftView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, leftView.frame.size.width, baseView.frame.size.height - 57);
        presentScrollView.frame = CGRectMake(leftView.frame.origin.x, 0, 0, 435);
        rightView.frame = CGRectMake(0, 0, rightView.frame.size.width, rightView.frame.size.height);
    }];
}

-(void)rightViewMoveToRight {
    [UIView animateWithDuration:.3f animations:^{
        isLeftBtn = NO;
        leftView.frame = CGRectMake(0, 0, leftView.frame.size.width, baseView.frame.size.height - 40);
        contentView.frame = CGRectMake(leftView.frame.origin.x+leftView.frame.size.width, 0, contentView.frame.size.width, baseView.frame.size.height - 57);
        rightView.frame = CGRectMake(contentView.frame.origin.x+contentView.frame.size.width, 0, rightView.frame.size.width, rightView.frame.size.height);
        presentScrollView.frame = CGRectMake(82, 0, 0, 435);
    }];
}

-(void)rightShow {
    [UIView animateWithDuration:.5f animations:^{
        presentScrollView.frame = CGRectMake(leftView.frame.origin.x-340, 0, 340, baseView.frame.size.height - 57);
        rightView.frame = CGRectMake(-340, 0, 340, baseView.frame.size.height - 57);
        contentView.frame = CGRectMake(0, 0, contentView.frame.size.width, contentView.frame.size.height);
    } completion:^(BOOL finished) {
        rightMoved = YES;
    }];
}

-(void)rightHiden {
    [UIView animateWithDuration:.5f animations:^{
        presentScrollView.frame = CGRectMake(leftView.frame.origin.x, 0, 0, 435);
        rightView.frame = CGRectMake(0, 0, rightView.frame.size.width, rightView.frame.size.height);
        contentView.frame = CGRectMake(rightView.frame.origin.x+rightView.frame.size.width, 0, contentView.frame.size.width, baseView.frame.size.height - 40);
    } completion:^(BOOL finished) {
        rightMoved = NO;
        leftView.tableView_right_down.hidden = YES;
    }];
}

-(void)dismissPresentView:(NSNotification *)na {
    if ([na.userInfo[@"dismiss"] isEqualToString:@"left"]) {
        [self leftHiden];
    }else{
        [self rightHiden];
    }
}

#pragma mark 拨号
-(void)calledPhone:(NSString *)str {
    //TODO
//    if ([str length] == 11) {
        GeelyPhoneCalledView *vc = [[GeelyPhoneCalledView alloc] initWithFrame:CGRectMake(0, 435*2, 340, 435) andPhone:str];
        vc.delegate = self;
        [viewScroll addSubview:vc];
        viewScroll.contentOffset = CGPointMake(0, 435*2);
    //todo
    
    [[[SingleModel sharedInstance] singleMainRequest:@"Phone" type_value:@2] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];

    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];

    }];

     
    
//    }
}

-(void)calledEnd {
    viewScroll.contentOffset = CGPointMake(0, 0);
    [[[SingleModel sharedInstance] singleMainRequest:@"Volume" type_value:@1] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    }];
}


#pragma mark GeelyMusicAnimationDelegate
//获取音乐需要的总时长
-(float)musicTime {
    return singTime;
}
//应用播放时会调用
-(void)musciCDAnimationRunning:(GeelyMusicCDAnimationView *)musciView currentPosition:(CGFloat)currenttime {
    musica.currentTime.text = [self convertTime:currenttime];
}
//音乐播放结束
-(void)musicCDAnimationDidFinish:(GeelyMusicCDAnimationView *)musicView {
    [musicView pauseLayer:musicView.imageView_.layer];
}
//音乐播放即将开始
-(void)musicCDAnimationWillStart:(GeelyMusicCDAnimationView *)musicView {
    
}
//音乐播放暂停
-(void)musicCDAnimationPaused:(GeelyMusicCDAnimationView *)musicView {
    [acPlayer pause];
}
//音乐播放开始
-(void)musicCDAnimationResumed:(GeelyMusicCDAnimationView *)musicView {
    [acPlayer play];
}

- (NSString *)convertTime:(CGFloat)second{
    NSDate *d = [NSDate dateWithTimeIntervalSince1970:second];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (second/3600 >= 1) {
        [formatter setDateFormat:@"HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"mm:ss"];
    }
    NSString *showtimeNew = [formatter stringFromDate:d];
    return showtimeNew;
}

#pragma mark musicDelegate
-(void)didSwitch:(GeelyMusicLittleView *)view {
//    if (!view.musicmedia) {
//        view.musicmedia = YES;
//        view.forBgImage.image = [UIImage imageNamed:@"AM切换musiclittle"];
        [acPlayer pause];
        viewScroll.contentOffset = CGPointMake(340*3, 0);
        
    [[[SingleModel sharedInstance] singleMainRequest:@"Radio" type_value:@1] startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    }];
//    }else{
//        view.musicmedia = NO;
////        view.forBgImage.image = [UIImage imageNamed:@"多功能卡片musicmusicarf"];
//        [acPlayer play];
////        viewScroll.contentOffset = CGPointMake(340*2, 0);
//            }
}

-(void)listBtnClicked:(GeelyPhoneInputView *)inputView {
    viewScroll.contentOffset = CGPointMake(340*4, 0);
}

#pragma mark 退出天气详细页面
-(void)theWeatherClicked:(GeelyContentInfoView *)infoView {
    NSLog(@"推出天气详情");
    GeelyWeatherViewController *vc = [[GeelyWeatherViewController alloc] init];
    [self.navigationController pushViewController:vc animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark GeelyRightContainsViewMoveDelegate
-(void)rightContainsViewMoved:(UIButton *)btn {
    NSLog(@"回到首页移动");
    if (!isLeftBtn) {
        [[NSNotificationCenter defaultCenter] postNotificationName:TOLEFT object:nil];
        imageViewContentBG.image = [UIImage imageNamed:@"Geely_11-17home_bgLeft"];
        [self rightViewMoveToLeft];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:TORIGHT object:nil];
        imageViewContentBG.image = [UIImage imageNamed:@"Geely_11-17home_bg"];
        [self rightViewMoveToRight];
    }
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
