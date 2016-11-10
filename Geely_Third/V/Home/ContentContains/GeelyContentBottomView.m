//
//  GeelyContentBottomView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/9/30.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyContentBottomView.h"

@implementation GeelyContentBottomView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"GeelyContentBottomView" owner:self options:nil]firstObject];
        self.frame = frame;
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
