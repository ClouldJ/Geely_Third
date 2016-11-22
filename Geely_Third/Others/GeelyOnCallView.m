//
//  GeelyOnCallView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/14.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyOnCallView.h"

@implementation GeelyOnCallView

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ( self = [super initWithCoder:aDecoder]) {
//        self.frame = cgrectmake
        [self load_view];
    }
    return self;
}

-(void)load_view {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    imageView.backgroundColor = [UIColor clearColor];
    [self addSubview:imageView];
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i<29; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"phone on call_0000%d",i]];
            [arr addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"phone on call_000%d",i]];
            [arr addObject:image];
        }
    }
    NSLog(@"数组的数量:%ld",arr.count);
    [imageView startImageSequenceWithArray:arr repeatCount:1000000 duration:1];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
