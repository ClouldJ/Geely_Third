//
//  Voice.h
//  Request
//
//  Created by haigui on 16/10/25.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Voice : NSObject

@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSNumber *type;

- (void)changeType;

@end
