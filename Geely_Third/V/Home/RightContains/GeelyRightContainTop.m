//
//  GeelyRightContainTop.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyRightContainTop.h"

@interface GeelyRightContainTop () {
    UIImageView *im;
}

@end

@implementation GeelyRightContainTop

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"个人信息userinfo"]];
        [self addSubview:im];
        im.frame = CGRectMake(0, 114/2+20, 551/2, 161/2);
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toLeft) name:TOLEFT object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toRight) name:TORIGHT object:nil];
        
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(void)toLeft{
    
    im.frame = CGRectMake(55, 114/2+20, 551/2, 161/2);

    
}

-(void)toRight {
    im.frame = CGRectMake(0, 114/2+20, 551/2, 161/2);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
