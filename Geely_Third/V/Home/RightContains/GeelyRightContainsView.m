//
//  GeelyRightContainsView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyRightContainsView.h"

#import "GeelyRightContainTop.h"
#import "GeelyRightContainBottom.h"

@implementation GeelyRightContainsView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        GeelyRightContainTop *topView = [[GeelyRightContainTop alloc] initWithFrame:CGRectMake(14, 0, self.frame.size.width, self.frame.size.height/2)];
        topView.backgroundColor = [UIColor clearColor];
        [self addSubview:topView];
        
        GeelyRightContainBottom *bottomView = [[GeelyRightContainBottom alloc] initWithFrame:CGRectMake(14,20+ self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2)];
        bottomView.backgroundColor = [UIColor clearColor];
        [self addSubview:bottomView];
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
