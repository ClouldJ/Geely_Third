//
//  GeelyPhoneCalledView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GeelyPhoneCalledViewDelegate <NSObject>

-(void)calledEnd;

@end

@interface GeelyPhoneCalledView : UIView
@property (weak, nonatomic) IBOutlet UIButton *backbtn;
@property (weak, nonatomic) IBOutlet UIButton *calledbtn;
@property (weak, nonatomic) IBOutlet UILabel *phonelabel;

-(instancetype)initWithFrame:(CGRect)frame andPhone:(NSString *)str;
@property (nonatomic, assign) id<GeelyPhoneCalledViewDelegate> delegate;

@end
