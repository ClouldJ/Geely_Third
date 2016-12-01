//
//  CallWillView.h
//  CellPhoneView
//
//  Created by haigui on 16/11/22.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CallWillViewDelegate <NSObject>

@optional

- (void)frequentContactsButtonClicked;

@end


@interface CallWillView : UITableViewCell

@property (nonatomic, weak) id<CallWillViewDelegate> delegate;

@end
