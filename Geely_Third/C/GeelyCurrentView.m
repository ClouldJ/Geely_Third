//
//  GeelyCurrentView.m
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/30.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyCurrentView.h"
static id _instance;

@implementation GeelyCurrentView
+(instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+(instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

-(id)copyWithZone:(NSZone *)zone {
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

@end
