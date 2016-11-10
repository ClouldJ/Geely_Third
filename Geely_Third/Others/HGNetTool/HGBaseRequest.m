//
//  HGBaseRequest.m
//  HGToolKit
//
//  Created by haigui on 16/2/16.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "HGBaseRequest.h"
#import "HGNetworkAgent.h"

@implementation HGBaseRequest

- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    _requestUrl = @"";
    _baseUrl = @"";
    _cdnUrl = @"";
    _useCDN = NO;
    _useArgument = YES;
    _useHeaderFieldValueDictionary = YES;
    _requestMethod = HGRequestMethodGet;
    _requestSerializerType = HGRequestSerializerTypeHTTP;
    _requestArgument = nil;
    _requestTimeoutInterval = 60;
    _buildCustomUrlRequest = nil;
}

- (void)start {
    [[HGNetworkAgent sharedInstance] addRequest:self];
}

/// remove self from request queue
- (void)stop {
    self.delegate = nil;
    [[HGNetworkAgent sharedInstance] cancelRequest:self];
}

- (void)clearCompletionBlock {
    self.successCompletionBlock = nil;
    self.failureCompletionBlock = nil;
    self.progressBlock = nil;
}

- (void)startWithBlockSuccess:(HGRequestCompletionBlock)success
                      failure:(HGRequestFailureBlock)failure{
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
    [self start];
}

- (void)startWithBlockProgress:(void (^)(NSProgress *))progress
                       success:(HGRequestCompletionBlock)success
                       failure:(HGRequestFailureBlock)failure{
    self.progressBlock = progress;
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
    [self start];
}


@end
