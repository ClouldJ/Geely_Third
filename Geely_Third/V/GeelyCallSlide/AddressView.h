//
//  AddressView.h
//  CellPhoneView
//
//  Created by haigui on 16/11/22.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"

@protocol AddressViewDelegate <NSObject>

- (void)addressViewCellSelected:(Address *)address;

-(void)gotoCallWillView:(UIButton *)btn;

@end

@interface AddressView : UITableViewCell

@property (nonatomic, weak) id<AddressViewDelegate> delegate;


@end
