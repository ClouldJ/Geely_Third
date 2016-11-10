//
//  GeelyPhoneCalledView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyPhoneCalledView.h"

@implementation GeelyPhoneCalledView

-(instancetype)initWithFrame:(CGRect)frame andPhone:(NSString *)str {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"geelyphonecalled" owner:self options:nil]firstObject];
        self.frame = frame;
        self.phonelabel.text = str;
        
        [self.calledbtn addTarget:self action:@selector(endAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.backbtn addTarget:self action:@selector(bbbbbbAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)endAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(calledEnd)]&&self.delegate) {
        [self.delegate calledEnd];
    }
}

-(void)bbbbbbAction {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"left" forKey:@"dismiss"];
    [[NSNotificationCenter defaultCenter] postNotificationName:DISMISS object:nil userInfo:dic];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
