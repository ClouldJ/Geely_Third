//
//  GeelyPhoneInputView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyPhoneInputView.h"


@interface GeelyPhoneInputView () {
    NSMutableArray *buttons;
}

@end

@implementation GeelyPhoneInputView

//-(instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super initWithCoder:aDecoder]) {
//        
//        self = [[[NSBundle mainBundle] loadNibNamed:@"geelyphoneinput" owner:self options:nil] firstObject];
//        self.frame = frame;
//        buttons = [NSMutableArray array];
//        [self action];
//    }
//    return self;
//}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"geelyphoneinput" owner:self options:nil] firstObject];
        self.frame = frame;
        self.backgroundColor = [UIColor clearColor];
        buttons = [NSMutableArray array];
        [self action];
    }
    return self;
}

-(void)action {
    
    
    self.btn0.tag = 1;
    [self.btn0 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn1.tag = 2;
    [self.btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn2.tag = 3;
    [self.btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn3.tag = 4;
    [self.btn3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn4.tag = 5;
    [self.btn4 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn5.tag = 6;
    [self.btn5 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn6.tag = 7;
    [self.btn6 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn7.tag = 8;
    [self.btn7 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn8.tag = 9;
    [self.btn8 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn9.tag = 10;
    [self.btn9 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.btndelete addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.phoneCallBtn addTarget:self action:@selector(phonecallAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnback addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.listBtn addTarget:self action:@selector(listBtnAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)btnAction:(UIButton *)btn {
    NSInteger index = btn.tag - 1;
    [buttons addObject:[NSString stringWithFormat:@"%ld",index]];
    self.nameTitle.text = [buttons componentsJoinedByString:@""];
}

-(void)deleteAction:(UIButton *)btn {
    
    if (buttons.count == 1) {
        [buttons removeObjectAtIndex:buttons.count - 1];
    }else{
        [buttons removeObjectAtIndex:buttons.count-2];
    }
//    self.nameTitle.font = [UIFont fontWithName:@"GEELY Narrow regular 20151114" size:21];
    self.nameTitle.text = [buttons componentsJoinedByString:@""];
}

-(void)phonecallAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(calledPhone:)]&&self.delegate) {
        [self.delegate calledPhone:self.phoneTextField.text];
    }
}

-(void)backAction {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"left" forKey:@"dismiss"];
    [[NSNotificationCenter defaultCenter] postNotificationName:DISMISS object:nil userInfo:dic];
}

-(void)listBtnAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(listBtnClicked:)] && self.delegate) {
        [self.delegate listBtnClicked:self];
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
