//
//  CellPhoneView.h
//  CellPhoneView
//
//  Created by haigui on 16/11/21.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"

@protocol CellPhoneViewDelegate <NSObject>

- (void)callingButtonClicked;

- (void)addressSelected;

- (void)callingOffButtonClicked;

@end

/**
 initWithFrame设置为
 340*435
 */
@interface CellPhoneView : UIView


- (void)scrollToCallingView;
- (void)scrollToAddressView;
- (void)scrollToCallWillView;

@property (nonatomic, strong) UITableView *cellPhoneTableView;


@property (nonatomic, weak) id<CellPhoneViewDelegate> delegate;


@end
