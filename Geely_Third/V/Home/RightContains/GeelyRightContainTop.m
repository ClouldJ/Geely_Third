//
//  GeelyRightContainTop.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyRightContainTop.h"

@implementation GeelyRightContainTop

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人信息userinfo"]];
        [self addSubview:im];
        im.frame = CGRectMake(0, 114/2+20, 551/2, 161/2);
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
