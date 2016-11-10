//
//  HGNetworkAgent.h
//  HGToolKit
//
//  Created by haigui on 16/2/17.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <Foundation/Foundation.h>


@class HGBaseRequest;

@interface HGNetworkAgent : NSObject

@property (nonatomic, strong) NSOutputStream *outputStream;

+ (instancetype)sharedInstance;

- (void)addRequest:(HGBaseRequest *)request;

- (void)cancelRequest:(HGBaseRequest *)request;

/// 根据request和networkConfig构建url
- (NSString *)buildRequestUrl:(HGBaseRequest *)request;




@end
