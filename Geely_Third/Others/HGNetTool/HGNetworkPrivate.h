//
//  HGNetworkPrivate.h
//  network
//
//  Created by haigui on 16/3/29.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGNetworkPrivate : NSObject

+ (NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString
                          appendParameters:(NSDictionary *)parameters;

+ (NSString *)anotherUrlParametersStringFromParameters:(NSDictionary *)parameters keyString:(NSString *)keyString;

+ (NSString *)anotherUrlStringWithOriginUrlString:(NSString *)originUrlString appendParameters:(NSDictionary *)parameters keyString:(NSString *)keyString;

@end
