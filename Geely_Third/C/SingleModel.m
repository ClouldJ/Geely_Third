//
//  SingleModel.m
//  RepeaceFriends
//
//  Created by WillyZhao on 16/8/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "SingleModel.h"

@implementation SingleModel

static id _instance;


static NSString *FMDB_name;

static NSString *path;

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
