//
//  HGBaseRequest+Response.m
//  MyHome
//
//  Created by haigui on 16/5/3.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "HGBaseRequest+Response.h"

@implementation HGBaseRequest (Response)

- (NSNumber *)code {
    return self.responseJSONObject[@"code"];
}

- (NSString *)msg {
    return self.responseJSONObject[@"msg"];
}

- (id)data {
    return self.responseJSONObject[@"data"];
}

- (BOOL)success {
    return self.code.boolValue;
}

@end
