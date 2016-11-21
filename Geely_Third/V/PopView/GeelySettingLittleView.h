//
//  GeelySettingLittleView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeelySettingLittleView : UIView
@property (weak, nonatomic) IBOutlet UIButton *closebtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightContains;
@property (nonatomic, strong) UIView *conttView;
@end
