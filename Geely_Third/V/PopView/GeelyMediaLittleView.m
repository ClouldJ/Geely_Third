//
//  GeelyMediaLittleView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMediaLittleView.h"

@interface GeelyMediaLittleView () {
    NSMutableArray *images;
}

@end

@implementation GeelyMediaLittleView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"geelymedialittle" owner:self options:nil]firstObject];
        self.frame = frame;
        
        [self.switchBtn addTarget:self action:@selector(switchbtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)startAnimation {
    images = [NSMutableArray array];
    for (int i = 0; i<34; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"中控-电台_0000%d",i]];
            [images addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"中控-电台_000%d",i]];
            [images addObject:image];
        }
    }
    
    [self.animationImage startImageSequenceWithArray:images repeatCount:MAXFLOAT duration:1];
    
}

-(void)switchbtn {
    [self.animationImage stopAnimating];
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
