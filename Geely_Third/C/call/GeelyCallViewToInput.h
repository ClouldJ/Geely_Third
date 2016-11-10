//
//  GeelyCallViewToInput.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GeelyCallViewToInputDelegate <NSObject>

-(void)didScrollHeightPercent:(CGFloat)heightPercent tableView:(UITableView *)tableView;

@end

@interface GeelyCallViewToInput : UIView
@property (nonatomic, assign) id<GeelyCallViewToInputDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *call1;
@property (weak, nonatomic) IBOutlet UIButton *call2;
@property (weak, nonatomic) IBOutlet UIButton *call3;
@property (weak, nonatomic) IBOutlet UIButton *call4;
@property (weak, nonatomic) IBOutlet UIButton *call5;
@property (weak, nonatomic) IBOutlet UIButton *call6;
@property (weak, nonatomic) IBOutlet UIButton *call7;
@property (weak, nonatomic) IBOutlet UIButton *call8;
@property (weak, nonatomic) IBOutlet UIButton *call9;
@property (weak, nonatomic) IBOutlet UIButton *call0;
@property (weak, nonatomic) IBOutlet UIButton *callxin;
@property (weak, nonatomic) IBOutlet UIButton *calljing;
@property (weak, nonatomic) IBOutlet UIButton *call;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView_;

@end
