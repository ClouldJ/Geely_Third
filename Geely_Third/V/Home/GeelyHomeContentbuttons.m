//
//  GeelyHomeContentbuttons.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/2.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyHomeContentbuttons.h"

@implementation GeelyHomeContentbuttons

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIView *bot = [[[NSBundle mainBundle] loadNibNamed:@"homecontentbtns" owner:self options:nil]firstObject];
        bot.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:bot];
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
