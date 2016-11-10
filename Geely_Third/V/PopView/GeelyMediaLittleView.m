//
//  GeelyMediaLittleView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMediaLittleView.h"

@implementation GeelyMediaLittleView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"geelymedialittle" owner:self options:nil]firstObject];
        self.frame = frame;
        
        [self.switchBtn addTarget:self action:@selector(switchbtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)switchbtn {
    if (self.block) {
        self.block();
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
