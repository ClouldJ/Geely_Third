//
//  Radio.h
//  Request
//
//  Created by haigui on 16/10/25.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Radio : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSString *spectrum;
@property (nonatomic, strong) NSString *channel;
@property (nonatomic, strong) NSString *name;

@end
