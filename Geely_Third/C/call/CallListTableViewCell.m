//
//  CallListTableViewCell.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "CallListTableViewCell.h"

@implementation CallListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.font = [UIFont fontWithName:@"Noto Sans CJK SC" size:18];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
