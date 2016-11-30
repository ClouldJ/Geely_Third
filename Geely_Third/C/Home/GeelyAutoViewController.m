//
//  GeelyAutoViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyAutoViewController.h"


#import "CWStarRateView.h"


@interface GeelyAutoViewController () <CWStarRateViewDelegate> {
    UIImageView *wenduji_right;
    UIImageView *wenduji;
    NSMutableArray *image_level_one;
    NSMutableArray *image_level_two;
    NSMutableArray *image_level_three;
    NSMutableArray *image_level_four;
    NSMutableArray *image_level_five;
    NSMutableArray *image_level_six;
    NSMutableArray *image_level_seven;
    NSMutableArray *image_level_eight;

}
@property (weak, nonatomic) IBOutlet UIButton *rightShow;
@property (weak, nonatomic) IBOutlet UIButton *leftShow;
@property (weak, nonatomic) IBOutlet UIButton *leftHidden;
@property (weak, nonatomic) IBOutlet UIButton *rightHidden;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@property (strong, nonatomic) IBOutlet UIImageView *rightBig;
@property (strong, nonatomic) IBOutlet UIImageView *rightSmall;
@property (strong, nonatomic) IBOutlet UIImageView *leftBig;
@property (strong, nonatomic) IBOutlet UIImageView *leftSmall;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *animationImageView;

@end

@implementation GeelyAutoViewController
-(void)viewWillAppear:(BOOL)animated {
//    self.navigationController.navigationBar.alpha = 0;
}

-(void)actionOne{
    for (int i =0; i<76; i++) {
        
//        if (i%2!=0) {
            if (i<10) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"一级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_one addObject:image];
            }else{
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"一级_000%d",i]];
                [[SingleModel sharedInstance].image_level_one addObject:image];
            }
//        }
        

    }
    [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_one repeatCount:1000000 duration:2];
    
    [NSThread detachNewThreadSelector:@selector(actionTwo) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionThree) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionFour) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionFive) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionSix) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionSeven) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionEight) toTarget:self withObject:nil];
}

-(void)actionTwo{
    for (int i =0; i<76; i++) {
        
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"二级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_two addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"二级_000%d",i]];
            [[SingleModel sharedInstance].image_level_two addObject:image];
        }
    }
}

-(void)actionThree {
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"三级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_three addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"三级_000%d",i]];
            [[SingleModel sharedInstance].image_level_three addObject:image];
        }
    }
}

-(void)actionFour {
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"四级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_four addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"四级_000%d",i]];
            [[SingleModel sharedInstance].image_level_four addObject:image];
        }
    }
}

-(void)actionFive {
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"五级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_five addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"五级_000%d",i]];
            [[SingleModel sharedInstance].image_level_five addObject:image];
        }
    }
}

-(void)actionSix {
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"六级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_six addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"六级_000%d",i]];
            [[SingleModel sharedInstance].image_level_six addObject:image];
        }
    }
}

-(void)actionSeven {
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"七级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_seven addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"七级_000%d",i]];
            [[SingleModel sharedInstance].image_level_seven addObject:image];
        }
    }
}

-(void)actionEight {
    for (int i =0; i<76; i++) {
        
//        if (i%2!=0) {
            if (i<10) {
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"八级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_eight addObject:image];
            }else{
                UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"八级_000%d",i]];
                [[SingleModel sharedInstance].image_level_eight addObject:image];
            }
//        }
    }
    
    NSLog(@"数组数量:%ld",[SingleModel sharedInstance].image_level_eight.count);

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(actionGesture:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
//    UIPanGestureRecognizer
    [self.contentImage addGestureRecognizer:swipe];
    
    [self.rightShow addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.leftShow addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.leftHidden addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightHidden addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //左侧，未展开的座椅
    self.leftSmall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"座椅autoauto"]];
    self.leftSmall.frame = CGRectMake(0, 290, self.leftSmall.image.size.width, self.leftSmall.image.size.height);
    [self.contentImage addSubview:self.leftSmall];
    
    //左侧，展开后的座椅
    self.leftBig = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"左侧座椅设置airauto"]];
    self.leftBig.frame = CGRectMake(0, 290, self.leftBig.image.size.width, self.leftBig.image.size.height);
    [self.contentImage addSubview:self.leftBig];
    
    wenduji = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"温度计"]];
    wenduji.frame = CGRectMake(16.5, 395, 121/2, 121/2);
    wenduji.userInteractionEnabled = YES;
    [self.contentImage addSubview:wenduji];
    
    
    UIPanGestureRecognizer *pan_left = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(leftPanGesture:)];
    [wenduji addGestureRecognizer:pan_left];
    
    
    //右侧座椅,未展开的座椅
    self.rightBig = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"右侧座椅设置airauto"]];
    self.rightBig.frame = CGRectMake(1310-self.rightBig.image.size.width, 290, self.rightBig.image.size.width, self.rightBig.image.size.height);
    [self.contentImage addSubview:self.rightBig];
    
    self.rightSmall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"副驾座椅autoauto"]];
    self.rightSmall.frame = CGRectMake(1310-self.rightSmall.image.size.width, 290, self.rightSmall.image.size.width, self.rightSmall.image.size.height);
    [self.contentImage addSubview:self.rightSmall];
    
    wenduji_right = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"温度计"]];
    wenduji_right.frame = CGRectMake((D_W-116-18), 395, 121/2, 121/2);
    wenduji_right.userInteractionEnabled = YES;
    [self.contentImage addSubview:wenduji_right];
    
    UIPanGestureRecognizer *pan_right = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(rightGesture:)];
    [wenduji_right addGestureRecognizer:pan_right];
    
    self.rightSmall.hidden = NO;
    self.rightBig.hidden = YES;
    self.rightSmall.userInteractionEnabled = YES;
    self.rightBig.userInteractionEnabled = YES;
    
    self.leftBig.hidden = YES;
    self.leftSmall.hidden = NO;
    
    self.leftLabel.font = [UIFont fontWithName:@"GEELY Narrow regular 20151114" size:55];
    self.rightLabel.font = [UIFont fontWithName:@"GEELY Narrow regular 20151114" size:55];
    
    
    CWStarRateView *ss = [[CWStarRateView alloc] initWithFrame:CGRectMake(505, 492-(57/2)-33, (81/2)*8, 57/2)];
    ss.allowTouch = YES;
    ss.backgroundColor = [UIColor clearColor];
    ss.delegate = self;
    ss.scorePercent = 0;
    [self.contentImage addSubview:ss];


    
    //初始化数据源
    if ([SingleModel sharedInstance].image_level_one.count==0) {
        [SingleModel sharedInstance].image_level_one = [NSMutableArray array];
        [SingleModel sharedInstance].image_level_two = [NSMutableArray array];
        [SingleModel sharedInstance].image_level_three = [NSMutableArray array];
        [SingleModel sharedInstance].image_level_four = [NSMutableArray array];
        [SingleModel sharedInstance].image_level_five = [NSMutableArray array];
        [SingleModel sharedInstance].image_level_six = [NSMutableArray array];
        [SingleModel sharedInstance].image_level_seven = [NSMutableArray array];
        [SingleModel sharedInstance].image_level_eight = [NSMutableArray array];
        
        //异步加载数据源
        [NSThread detachNewThreadSelector:@selector(actionOne) toTarget:self withObject:nil];
        
    }
    

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([SingleModel sharedInstance].image_level_one.count==76) {
        NSLog(@"单例中存的数据已经有了 ，不需要再进行存储");
        [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_one repeatCount:1000000 duration:2];
    }
}


-(void)rightGesture:(UIPanGestureRecognizer *)pan {
    CGFloat ffl = [pan locationInView:self.contentImage].y;
    UIImageView *imageView = (UIImageView *)[pan view];
    
    [self.view bringSubviewToFront:imageView];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        imageView.transform = CGAffineTransformScale(imageView.transform, 1.3f, 1.3f);
    }else if (pan.state == UIGestureRecognizerStateEnded) {
        imageView.transform = CGAffineTransformIdentity;
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        if (ffl>=81.5&&ffl<=395) {
            imageView.frame = CGRectMake(imageView.frame.origin.x, ffl, imageView.frame.size.width, imageView.frame.size.height);
            self.rightLabel.text = [NSString stringWithFormat:@"%.1f",40-ffl/20];
        }
    }
}

-(void)leftPanGesture:(UIPanGestureRecognizer *)pan {
    CGFloat ffl = [pan locationInView:self.contentImage].y;
    UIImageView *imageView = (UIImageView *)[pan view];
    UIImageView *imaaa = (UIImageView *)[pan view];
    [self.view bringSubviewToFront:imageView];
    if (pan.state == UIGestureRecognizerStateBegan) {
        imaaa.transform = CGAffineTransformScale(imaaa.transform, 1.3f, 1.3f);
    }else if (pan.state == UIGestureRecognizerStateEnded) {
        imaaa.transform = CGAffineTransformIdentity;
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        if (ffl>=81.5&&ffl<=395) {
            imageView.frame = CGRectMake(imageView.frame.origin.x, ffl, imageView.frame.size.width, imageView.frame.size.height);
            
            if (imageView == wenduji) {
                self.leftLabel.text = [NSString stringWithFormat:@"%.1f",40-ffl/20];
            }else if(imageView == wenduji_right){
            }
        }
    }

}

-(void)btnAction:(UIButton *)btn {
    if (btn == self.leftShow) {
        self.leftHidden.hidden = NO;
        self.leftShow.hidden = YES;
    }else if (btn == self.leftHidden) {
        self.leftHidden.hidden = YES;
        self.leftShow.hidden = NO;
    }else if (btn == self.rightHidden) {
        self.rightHidden.hidden = YES;
        self.rightShow.hidden = NO;
    }else if (btn == self.rightShow) {
        self.rightShow.hidden = YES;
        self.rightHidden.hidden = NO;
    }
}

-(void)actionGesture:(UISwipeGestureRecognizer *)gesture {
    if (gesture.direction == UISwipeGestureRecognizerDirectionDown) {
//        NSLog(@"向上");
//        [self.navigationController popViewControllerAnimated:NO];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (IBAction)rightAirControl:(id)sender {
    self.rightBig.hidden = !self.rightBig.hidden;
    self.rightSmall.hidden = !self.rightSmall.hidden;
}
- (IBAction)leftAirControll:(id)sender {
    self.leftSmall.hidden = !self.leftSmall.hidden;
    self.leftBig.hidden = !self.leftBig.hidden;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)starRateView:(CWStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent {
    NSLog(@"点击的分数:%f",newScorePercent);
    
    [self.animationImageView stopAnimating];
    if (newScorePercent == 1) {
        [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_one repeatCount:100000 duration:3];
    }else if (newScorePercent == 2) {
        [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_two repeatCount:100000 duration:3];

    }else if (newScorePercent == 3) {
        [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_three repeatCount:100000 duration:3];

    }else if (newScorePercent == 4) {
        [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_four repeatCount:100000 duration:3];

    }else if (newScorePercent == 5) {
        [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_five repeatCount:100000 duration:3];

    }else if (newScorePercent == 6) {
        [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_six repeatCount:100000 duration:3];

    }else if (newScorePercent == 7) {
        [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_seven repeatCount:100000 duration:3];

    }else if (newScorePercent == 8) {
        [self.animationImageView startImageSequenceWithArray:[SingleModel sharedInstance].image_level_eight repeatCount:100000 duration:3];
    }
}

-(void)asyncAddImageData {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i = 0; i<76; i++) {
        dispatch_async(queue, ^{
            if (i<10) {
                
                UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"一级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_one addObject:image1];
                
                UIImage *image2 = [UIImage imageNamed:[NSString stringWithFormat:@"二级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_two addObject:image2];
                
                UIImage *image3 = [UIImage imageNamed:[NSString stringWithFormat:@"三级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_three addObject:image3];
                
                UIImage *image4 = [UIImage imageNamed:[NSString stringWithFormat:@"四级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_four addObject:image4];
                
                UIImage *image5 = [UIImage imageNamed:[NSString stringWithFormat:@"五级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_five addObject:image5];
                
                UIImage *image6 = [UIImage imageNamed:[NSString stringWithFormat:@"六级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_six addObject:image6];
                
                UIImage *image7 = [UIImage imageNamed:[NSString stringWithFormat:@"七级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_seven addObject:image7];
                
                UIImage *image8 = [UIImage imageNamed:[NSString stringWithFormat:@"八级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_eight addObject:image8];
                
            }else{
                UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"一级_000%d",i]];
                [[SingleModel sharedInstance].image_level_one addObject:image1];
                
                UIImage *image2 = [UIImage imageNamed:[NSString stringWithFormat:@"二级_000%d",i]];
                [[SingleModel sharedInstance].image_level_two addObject:image2];
                
                UIImage *image3 = [UIImage imageNamed:[NSString stringWithFormat:@"三级_000%d",i]];
                [[SingleModel sharedInstance].image_level_three addObject:image3];
                
                UIImage *image4 = [UIImage imageNamed:[NSString stringWithFormat:@"四级_000%d",i]];
                [[SingleModel sharedInstance].image_level_four addObject:image4];
                
                UIImage *image5 = [UIImage imageNamed:[NSString stringWithFormat:@"五级_000%d",i]];
                [[SingleModel sharedInstance].image_level_five addObject:image5];
                
                UIImage *image6 = [UIImage imageNamed:[NSString stringWithFormat:@"六级_000%d",i]];
                [[SingleModel sharedInstance].image_level_six addObject:image6];
                
                UIImage *image7 = [UIImage imageNamed:[NSString stringWithFormat:@"七级_000%d",i]];
                [[SingleModel sharedInstance].image_level_seven addObject:image7];
                
                UIImage *image8 = [UIImage imageNamed:[NSString stringWithFormat:@"八级_000%d",i]];
                [[SingleModel sharedInstance].image_level_eight addObject:image8];
                
            }
        });
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
