//
//  GeelyFmAmView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyFmAmView.h"

@interface GeelyFmAmView ()

@end

@implementation GeelyFmAmView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"geelyfman" owner:self options:nil]firstObject];
        self.frame = frame;
//        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews {
//    NSLog(@"未来未来");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
