//
//  SettingView.m
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "SettingView.h"

@implementation SettingView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.conttView = [[[NSBundle mainBundle] loadNibNamed:@"setting" owner:self options:nil]firstObject];
        self.conttView.frame = CGRectMake(0, 0, 0, self.frame.size.height);
        [self addSubview:self.conttView];
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
