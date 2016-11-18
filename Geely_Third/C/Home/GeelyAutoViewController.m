//
//  GeelyAutoViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyAutoViewController.h"

@interface GeelyAutoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *rightShow;
@property (weak, nonatomic) IBOutlet UIButton *leftShow;
@property (weak, nonatomic) IBOutlet UIButton *leftHidden;
@property (weak, nonatomic) IBOutlet UIButton *rightHidden;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;

@end

@implementation GeelyAutoViewController
-(void)viewWillAppear:(BOOL)animated {
//    self.navigationController.navigationBar.alpha = 0;
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
    
    
    UIImageView *wenduji = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"温度计"]];
    wenduji.frame = CGRectMake(16.5, 395, 121/2, 121/2);
    wenduji.userInteractionEnabled = YES;
    [self.contentImage addSubview:wenduji];
    
    UIPanGestureRecognizer *pan_left = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(leftPanGesture:)];
    [wenduji addGestureRecognizer:pan_left];
    
    UIImageView *wenduji_right = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"温度计"]];
    wenduji_right.frame = CGRectMake((D_W-116-18), 395, 121/2, 121/2);
    wenduji_right.userInteractionEnabled = YES;
    [self.contentImage addSubview:wenduji_right];
    
    UIPanGestureRecognizer *pan_right = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(rightGesture:)];
    [wenduji_right addGestureRecognizer:pan_right];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)rightGesture:(UIPanGestureRecognizer *)pan {
    CGFloat ffl = [pan locationInView:self.contentImage].y;
    UIImageView *imageView = (UIImageView *)[pan view];
    

    
    if (pan.state == UIGestureRecognizerStateBegan) {
        imageView.transform = CGAffineTransformScale(imageView.transform, 1.3f, 1.3f);
    }else if (pan.state == UIGestureRecognizerStateEnded) {
        imageView.transform = CGAffineTransformIdentity;
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        if (ffl>=81.5&&ffl<=395) {
            imageView.frame = CGRectMake(imageView.frame.origin.x, ffl, imageView.frame.size.width, imageView.frame.size.height);
        }
    }
}

-(void)leftPanGesture:(UIPanGestureRecognizer *)pan {
    CGFloat ffl = [pan locationInView:self.contentImage].y;
    UIImageView *imageView = (UIImageView *)[pan view];
    UIImageView *imaaa = (UIImageView *)[pan view];
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        imaaa.transform = CGAffineTransformScale(imaaa.transform, 1.3f, 1.3f);
    }else if (pan.state == UIGestureRecognizerStateEnded) {
        imaaa.transform = CGAffineTransformIdentity;
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        if (ffl>=81.5&&ffl<=395) {
            imageView.frame = CGRectMake(imageView.frame.origin.x, ffl, imageView.frame.size.width, imageView.frame.size.height);
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
        [self.navigationController popToRootViewControllerAnimated:NO];
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
