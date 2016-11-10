//
//  GeelyMediaLittleView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MediaBlock)();
@interface GeelyMediaLittleView : UIView
@property (nonatomic, strong) MediaBlock block;
@property (weak, nonatomic) IBOutlet UIButton *switchBtn;

@end
