//
//  CallingView.h
//  CellPhoneView
//
//  Created by haigui on 16/11/22.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CallingViewDelegate <NSObject>

@optional

- (void)callingViewButtonClicked:(UIButton *)button;

@end


@interface CallingView : UITableViewCell

@property (nonatomic, weak) id<CallingViewDelegate> delegate;

/**
 使用numberLabel.text进行改值
 */
@property (nonatomic, strong, readonly) UILabel *numberLabel;

@end
