//
//  TableViewProgressView.h
//  sdonad ansdoinads
//
//  Created by WillyZhao on 16/10/25.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewProgressView : UIView

-(instancetype)initWithFrame:(CGRect)frame andBottomSize:(CGSize)b_size andupBottomSize:(CGSize)ub_size;

@property (nonatomic, assign) CGFloat heightPercent;

@property (nonatomic ,strong) UIView *bottomView;

@property (nonatomic, strong) UIView *upBottomView;

@property (nonatomic ,strong) UIColor *bottomViewC;

@property (nonatomic, strong) UIColor *upBottomViewC;

@property (nonatomic, assign) CGFloat viewCoradius;

@end
