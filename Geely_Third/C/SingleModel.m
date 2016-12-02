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


-(MainRequest *)singleMainRequest:(NSString *)request type_value:(NSNumber *)value{
    MainRequest *re = [[MainRequest alloc] init];
    re.requestVolume = [[Volume alloc] init];
    re.requestVoice = [[Voice alloc] init];
    re.requestPhone = [[Phone alloc] init];
    re.requestMusic = [[Music alloc] init];
    re.requestRadio = [[Radio alloc] init];
    re.requestMute = [[Mute alloc] init];
    re.requestCar = [[Car alloc] init];
    
    re.requestVoice.type = @0;
    re.requestPhone.type = @0;
    re.requestMusic.type = @0;
    re.requestRadio.type = @0;
    re.requestVolume.type = @1;
    re.requestCar.state = @1;
    
    if (![SingleModel sharedInstance].carSingle.notice) {
        re.requestCar.notice = @0;
    }else{
        re.requestCar.notice = [SingleModel sharedInstance].carSingle.notice;
    }
    
    re.requestMute = [SingleModel sharedInstance].muteSingle;
    
    Class class = NSClassFromString(request);
    if (class == [Volume class]) {
        re.requestVolume.type = value;
    }else if (class == [Radio class]) {
        re.requestRadio.type = value;
    }else if (class == [Phone class]) {
        re.requestPhone.type = value;
    }else if (class == [Voice class]) {
        re.requestVoice.type = value;
    }else if (class == [Car class]) {
        re.requestCar.state = value;
    }else if (class == [Music class]) {
        re.requestMusic.type = value;
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
    return re;
}


@end
