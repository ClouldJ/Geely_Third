//
//  GeelyContentContainsView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/9/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyContentContainsView.h"

#import "GeelyHomePageControll.h"
#import "GeelyContentControllView.h"
#import "GeelyContentListView.h"

@interface GeelyContentContainsView () <UIScrollViewDelegate> {
    UIScrollView *scrollView_;
    GeelyHomePageControll *imageViewControll;
}

@end

@implementation GeelyContentContainsView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadingViews];
    }
    return self;
}


-(void)loadingViews {
    
    
    scrollView_ = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scrollView_.pagingEnabled = YES;
    
    scrollView_.bounces = NO;
    scrollView_.backgroundColor = [UIColor clearColor];
    scrollView_.delegate = self;
    scrollView_.showsHorizontalScrollIndicator = NO;
    scrollView_.contentSize = CGSizeMake(self.frame.size.width*3, self.frame.size.height);
    scrollView_.contentOffset = CGPointMake(self.frame.size.width, 0);
    self.currentIndex = 1;
    
    [self addSubview:scrollView_];
    
    imageViewControll = [[GeelyHomePageControll alloc] initWithFrame:CGRectMake((self.frame.size.width - 75)/2, self.frame.size.height - 22, 75, 7)];
    [self addSubview:imageViewControll];
    
    //添加视图到scrollView中

    GeelyContentListView *view_d = [[GeelyContentListView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [scrollView_ addSubview:view_d];

    
    self.view_ddd = [[GeelyContentInfoView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    [scrollView_ addSubview:self.view_ddd];
    
    GeelyContentControllView *view_dd = [[GeelyContentControllView alloc] initWithFrame:CGRectMake(2*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
    [scrollView_ addSubview:view_dd];
    
}


#pragma mark UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"移动的x值:%f",scrollView.contentOffset.x);
    if (scrollView.contentOffset.x < 888) {
        self.currentIndex = 0;
    }else if (scrollView.contentOffset.x>888) {
        self.currentIndex = 2;
    }else{
        self.currentIndex = 1;
    }

    for (UIImageView *imageView in imageViewControll.subviews) {
        if (imageView.tag == self.currentIndex) {
            imageView.image = [UIImage imageNamed:@"Geely_home_imageControl_G"];
            imageView.frame = CGRectMake(imageView.frame.origin.x, 0, 8, 7);
        }else{
            imageView.image = [UIImage imageNamed:@"Geely_home_imageControl_GG"];
            imageView.frame = CGRectMake(imageView.frame.origin.x, (imageViewControll.frame.size.height - 2)/2, 27/2, 2);
        }
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
