//
//  HGBaseRequest+Response.h
//  MyHome
//
//  Created by haigui on 16/5/3.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "HGBaseRequest.h"

@interface HGBaseRequest (Response)

@property (nonatomic, strong, readonly) NSNumber *code;
@property (nonatomic, strong, readonly) NSString *msg;
@property (nonatomic, strong, readonly) id data;

@property (nonatomic, assign, readonly) BOOL success;

@end
