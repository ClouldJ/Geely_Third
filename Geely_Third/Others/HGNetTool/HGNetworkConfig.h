//
//  HGNetworkConfig.h
//  HGToolKit
//
//  Created by haigui on 16/2/17.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGBaseRequest.h"



@interface HGNetworkConfig : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, copy) NSString *baseUrl;
@property (nonatomic, copy) NSString *cdnUrl;
@property (nonatomic, copy) NSMutableDictionary *requestArgument;
@property (nonatomic, copy) NSMutableDictionary<NSString *, NSString *> *requestHeaderFieldValueDictionary;

@property (strong, nonatomic) NSSet *acceptableContentTypes;

@end
