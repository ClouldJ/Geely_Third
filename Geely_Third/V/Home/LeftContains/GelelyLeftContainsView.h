//
//  GelelyLeftContainsView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/9/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GeelyLeftContainsTableView.h"

@interface GelelyLeftContainsView : UIView

@property (nonatomic ,strong) GeelyLeftContainsTableView *tableView_;

@property (nonatomic ,strong) UITableView *tableView_right_down;

@property (nonatomic ,strong) UITableView *tableView_left_down;

@property (nonatomic, strong) UIView *bbb;

@property (nonatomic, strong) UIView *keyBoardView;

@property (nonatomic ,strong) UITextField *textField;


/**
 **加载视图**
 **/
-(void)reloadViewDirection:(BOOL)direction;

@end
