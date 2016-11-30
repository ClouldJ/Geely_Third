//
//  GeelyCurrentView.h
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/30.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeelySildeBarView.h"

@interface GeelyCurrentView : NSObject

+(instancetype)sharedInstance;

@property (nonatomic, strong) GeelySildeBarView *slideView;

@end
