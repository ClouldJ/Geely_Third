//
//  Car.h
//  SteeringWheel
//
//  Created by haigui on 16/11/14.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

// 1.Yellow 2.Red 3.Blue
@property (nonatomic, strong) NSNumber *state;

// 1(selected) or 0(normal)
@property (nonatomic, strong) NSNumber *notice;


@end
