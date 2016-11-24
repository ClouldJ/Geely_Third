//
//  GeelyMusicTransProgress.m
//  ProgressMusic
//
//  Created by WillyZhao on 16/11/3.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMusicTransProgress.h"

@interface GeelyMusicTransProgress () {
    UIImageView *imageView_left;
    UIImageView *imageView_right;
}

@end

@implementation GeelyMusicTransProgress
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self subViewLoad];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
        [self subViewLoad];
    }
    return self;
}

-(void)subViewLoad {
    imageView_left = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"进度条左边"]];
    imageView_left.userInteractionEnabled = YES;
    imageView_left.frame = CGRectMake(0, ((self.frame.size.height - 7/2)/2)-10, 721/2, 7/2);
    [self addSubview:imageView_left];
    
    imageView_right = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"进度条右边"]];
    imageView_right.userInteractionEnabled = YES;
    imageView_right.frame = CGRectMake(721/2-100, -1, 689/2, 5);
    [imageView_left addSubview:imageView_right];
    
    UIImageView *imageLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"musicprogressLight1"]];
    imageLeft.userInteractionEnabled = YES;
    imageLeft.frame = CGRectMake(-65, (self.frame.size.height - 7/2)/2-48, 1435/2, 189/2);
    [self addSubview:imageLeft];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(imageXpointChanged:)];
    [imageLeft addGestureRecognizer:pan];
}

-(void)imageXpointChanged:(UIPanGestureRecognizer *)pan {
    UIImageView *im = (UIImageView *)[pan view];
    if (pan.state == UIGestureRecognizerStateBegan) {
        NSLog(@"移动开始");
    }else if (pan.state == UIGestureRecognizerStateChanged) {
        CGFloat trans = [pan locationInView:self].x;
        if (trans>=50&&trans<=515) {
            im.center = CGPointMake(trans, im.center.y);
            imageView_left.frame = CGRectMake(0, ((self.frame.size.height - 7/2)/2)-10, 721/2+trans-487/2+8, 7/2);
            imageView_right.frame = CGRectMake(721/2-100+trans-487/2+8-25, -1, 689/2-trans+487/2-8+25, 5);
        }

    }else if (pan.state == UIGestureRecognizerStateEnded) {
        NSLog(@"移动结束");
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
