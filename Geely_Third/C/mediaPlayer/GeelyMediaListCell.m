//
//  GeelyMediaListCell.m
//  Geely_Third
//
//  Created by 胡亚明 on 16/11/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMediaListCell.h"

@implementation GeelyMediaListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imgView.layer.masksToBounds=YES;
    self.imgView.layer.cornerRadius=1;
}

@end
