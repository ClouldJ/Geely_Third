//
//  HGNetworkConfig.m
//  HGToolKit
//
//  Created by haigui on 16/2/17.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "HGNetworkConfig.h"

@interface HGNetworkConfig () {
    NSMutableDictionary *_requestArgument;
    NSMutableDictionary *_requestHeaderFieldValueDictionary;
}

@end

@implementation HGNetworkConfig

+ (instancetype)sharedInstance {
    static HGNetworkConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        _acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain", nil];
        _requestHeaderFieldValueDictionary = nil;
        _requestArgument = nil;
    }
    return self;
}

- (void)setAcceptableContentTypes:(NSSet *)acceptableContentTypes {
    _acceptableContentTypes = [_acceptableContentTypes setByAddingObject:acceptableContentTypes];
}

- (void)addRequestArgument:(NSDictionary *)argument {
    if (!_requestArgument) {
        _requestArgument = [NSMutableDictionary dictionary];
    }

    [_requestArgument setValuesForKeysWithDictionary:argument];
}
- (void)addRequestHeaderFieldValueDictionary:(NSDictionary *)argument {
    if (!_requestHeaderFieldValueDictionary) {
        _requestHeaderFieldValueDictionary = [NSMutableDictionary dictionary];
    }
    [_requestHeaderFieldValueDictionary addEntriesFromDictionary:argument];
}



@end
