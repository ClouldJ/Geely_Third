//
//  GeelyRightContainsView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GeelyRightContainsViewMoveDelegate <NSObject>

-(void)rightContainsViewMoved:(UIButton *)btn;

@end

@interface GeelyRightContainsView : UIView

@property (nonatomic, assign) id<GeelyRightContainsViewMoveDelegate> delegate;

@end
