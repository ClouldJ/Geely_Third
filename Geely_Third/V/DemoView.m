//
//  DemoView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/25.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "DemoView.h"

#import "VoliceView.h"


@implementation DemoView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *im = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        im.userInteractionEnabled = YES;
        im.image = [UIImage imageNamed:@"空调11_29image"];
        [self addSubview:im];
        
        self.iconView = [[GeelyIconSelectedView alloc] initWithFrame:CGRectMake(0, 20, 300, (self.frame.size.height-39/2)/2)];
        self.iconView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.iconView];
        

        
        VoliceView *vv = [[VoliceView alloc] initWithFrame:CGRectMake(1940/2, 0, 185, 57)];
        [self addSubview:vv];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        UIImageView *im = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1310, 57)];
        im.userInteractionEnabled = YES;
        im.image = [UIImage imageNamed:@"空调11_29image"];
        [self addSubview:im];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.iconView = [[GeelyIconSelectedView alloc] initWithFrame:CGRectMake(0, 20, 300, (57-39/2)/2)];
        self.iconView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.iconView];
    
        
        VoliceView *vv = [[VoliceView alloc] initWithFrame:CGRectMake(1940/2, 0, 185, 57)];
        [self addSubview:vv];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
