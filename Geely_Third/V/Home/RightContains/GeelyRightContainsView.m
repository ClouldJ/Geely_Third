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

@interface GeelyRightContainsView () {
    UIButton *btn_right;
}

@end

@implementation GeelyRightContainsView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toLeft) name:TOLEFT object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toRight) name:TORIGHT object:nil];
        
        GeelyRightContainTop *topView = [[GeelyRightContainTop alloc] initWithFrame:CGRectMake(14, 0, self.frame.size.width, self.frame.size.height/2)];
        topView.backgroundColor = [UIColor clearColor];
        [self addSubview:topView];
        
        GeelyRightContainBottom *bottomView = [[GeelyRightContainBottom alloc] initWithFrame:CGRectMake(14,20+ self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2)];
        bottomView.backgroundColor = [UIColor clearColor];
        [self addSubview:bottomView];
        
        btn_right = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-35, (self.frame.size.height-100)/2, 35, 140)];
        btn_right.backgroundColor = [UIColor clearColor];
        [self addSubview:btn_right];
        
        [btn_right addTarget:self action:@selector(reloadFrameAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)toLeft{
    btn_right.frame = CGRectMake(0, (self.frame.size.height-100)/2, 35, 140);
}

-(void)toRight {
    btn_right.frame = CGRectMake(self.frame.size.width-35, (self.frame.size.height-100)/2, 35, 140);
}


-(void)reloadFrameAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(rightContainsViewMoved:)]&&self.delegate) {
        [self.delegate rightContainsViewMoved:btn];
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
