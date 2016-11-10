//
//  GeelyHomePageControll.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyHomePageControll.h"

@implementation GeelyHomePageControll

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews {
    
    UIImageView *imageView_a = [[UIImageView alloc] initWithFrame:CGRectMake(0, (self.frame.size.height - 2)/2, 27/2, 2)];
    imageView_a.image = [UIImage imageNamed:@"Geely_home_imageControl_GG"];
    imageView_a.tag = 0;
    [self addSubview:imageView_a];
    
    UIImageView *imageView_b = [[UIImageView alloc] initWithFrame:CGRectMake(imageView_a.frame.origin.x+imageView_a.frame.size.width+20, 0, 8, 7)];
    imageView_b.image = [UIImage imageNamed:@"Geely_home_imageControl_G"];
    imageView_b.tag = 1;
    [self addSubview:imageView_b];
    
    UIImageView *imageView_c = [[UIImageView alloc] initWithFrame:CGRectMake(imageView_b.frame.origin.x+imageView_b.frame.size.width+20, (self.frame.size.height - 2)/2, 27/2, 2)];
    imageView_c.image = [UIImage imageNamed:@"Geely_home_imageControl_GG"];
    imageView_c.tag = 2;
    [self addSubview:imageView_c];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
