//
//  GeelyCalledListTableViewCell.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/22.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyCalledListTableViewCell.h"

@implementation GeelyCalledListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)cellForIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 3:
        {
            self.statusImage.hidden = NO;
            self.titleLabel.text = @"老大(3)";
        }
            break;
        case 4:
        {
            self.statusImage.hidden = NO;
            self.titleLabel.text = @"王超(2)";
        }
            break;
        default:
        {
            self.titleLabel.text = @"021-8080-2651";
            self.statusImage.hidden = YES;
        }
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
