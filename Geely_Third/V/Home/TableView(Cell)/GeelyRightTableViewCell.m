//
//  GeelyRightTableViewCell.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyRightTableViewCell.h"

@implementation GeelyRightTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)cellForRow:(NSIndexPath *)indexPath {
    self.title.textColor = [UIColor lightGrayColor];
    switch (indexPath.row) {
        case 0:
        {
            self.headImg.image = [UIImage imageNamed:@"Geely_right_cell_cloud"];
            self.title.text = @"雷暴橙色预警";
        }
            break;
        case 1:
        {
            self.headImg.image = [UIImage imageNamed:@"Geely_right_cell_prompt"];
            self.title.text = @"车辆清洗液含量低";
        }
            break;
        case 2:
        {
            self.headImg.image = [UIImage imageNamed:@"Geely_right_cell_pages"];
            self.title.text = @"武汉男子等公交未果意外...";
        }
            break;
        default:
            break;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
