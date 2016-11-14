//
//  GeelyPhoneInputView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GeelyPhoneInputView;
@protocol GeelyPhoneInputViewDelegate <NSObject>

-(void)calledPhone:(NSString *)str;

-(void)listBtnClicked:(GeelyPhoneInputView *)inputView;

@end

@interface GeelyPhoneInputView : UIView
@property (weak, nonatomic) IBOutlet UIButton *phoneCallBtn;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btnjing;
@property (weak, nonatomic) IBOutlet UIButton *btnxin;
@property (weak, nonatomic) IBOutlet UIButton *btn0;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btndelete;
@property (weak, nonatomic) IBOutlet UIButton *btnback;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *listBtn;

@property (nonatomic ,assign) id<GeelyPhoneInputViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end
