//
//  MainRequest.m
//  Request
//
//  Created by haigui on 16/10/25.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "MainRequest.h"
#import "MJExtension.h"
#import "Music.h"
#import "Radio.h"
#import "Phone.h"
#import "Voice.h"
#import "Volume.h"
#import "Mute.h"
#import "YYModel.h"

@implementation MainRequest

- (NSString *)requestUrl {
//    return @"http://115.29.160.160/tr.php";
    
    NSString *urlString = @"http://115.29.160.160/tr.php";
    
    if (self.requestMusic) {
        urlString = [HGNetworkPrivate anotherUrlStringWithOriginUrlString:urlString appendParameters:[self.requestMusic mj_keyValues] keyString:@"music"];
        
    }
    if (self.requestRadio) {
        urlString = [HGNetworkPrivate anotherUrlStringWithOriginUrlString:urlString appendParameters:[self.requestRadio mj_keyValues] keyString:@"radio"];
    }
    
    if (self.requestPhone) {
        urlString = [HGNetworkPrivate anotherUrlStringWithOriginUrlString:urlString appendParameters:[self.requestPhone mj_keyValues] keyString:@"phone"];
        
    }
    if (self.requestVolume) {
        urlString = [HGNetworkPrivate anotherUrlStringWithOriginUrlString:urlString appendParameters:[self.requestVolume mj_keyValues] keyString:@"volume"];
    }
    
    if (self.requestMute) {
        urlString = [HGNetworkPrivate anotherUrlStringWithOriginUrlString:urlString appendParameters:[self.requestMute mj_keyValues] keyString:@"mute"];
        
    }
    if (self.requestVoice) {
        urlString = [HGNetworkPrivate anotherUrlStringWithOriginUrlString:urlString appendParameters:[self.requestVoice mj_keyValues] keyString:@"voice"];
    }
    if (self.requestCar) {
        
        urlString = [HGNetworkPrivate anotherUrlStringWithOriginUrlString:urlString appendParameters:[self.requestCar mj_keyValues] keyString:@"car"];
    }
    
    return urlString;
}

- (HGRequestMethod)requestMethod {
    return HGRequestMethodGet;
}

#pragma mark - response

- (Music *)responseMusic {
    if ([[self.data allKeys] containsObject:@"music"]) {
        return [Music yy_modelWithJSON:self.data[@"music"]];
    }
    return nil;
}

- (Radio *)responseRadio {
    if ([[self.data allKeys] containsObject:@"radio"]) {
        return [Radio yy_modelWithJSON:self.data[@"radio"]];
    }
    return nil;
}

- (Phone *)responsePhone {
    if ([[self.data allKeys] containsObject:@"phone"]) {
        return [Phone yy_modelWithJSON:self.data[@"phone"]];
    }
    return nil;
}

- (Mute *)responseMute {
    if ([[self.data allKeys] containsObject:@"mute"]) {
        return [Mute yy_modelWithJSON:self.data[@"mute"]];
    }
    return nil;
}

- (Voice *)responseVoice {
    if ([[self.data allKeys] containsObject:@"voice"]) {
        return [Voice yy_modelWithJSON:self.data[@"voice"]];
    }
    return nil;
}

- (Volume *)responseVolume {
    if ([[self.data allKeys] containsObject:@"volume"]) {
        return [Volume yy_modelWithJSON:self.data[@"volume"]];
    }
    return nil;
}

- (Car *)responseCar {
    if ([[self.data allKeys] containsObject:@"car"]) {
        return [Car yy_modelWithJSON:self.data[@"car"]];
    }
    return nil;
}

@end
