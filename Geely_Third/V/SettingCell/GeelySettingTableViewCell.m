//
//  GeelySettingTableViewCell.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/20.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelySettingTableViewCell.h"

@implementation GeelySettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(NSString *)cellWithIndexPath:(NSIndexPath *)indexPath {
    NSString *str;
    switch (indexPath.row) {
        case 2:
            str = @"cellsettingbtn";
            break;
        case 3:
            str = @"cellsettingbtn";
            break;
        case 1:
            str = @"cellsettingwordi";
            break;
        case 5:
            str = @"cellsettingwordi";
            break;
        case 0:
            str = @"cellsettingwordi";
            break;
        default:
            str = @"cellsettingword";
            break;
    }
    return str;
}

-(void)cellForRowWith:(NSIndexPath *)indexPath {
    self.titleLabel.font = [UIFont fontWithName:@"Noto Sans CJK SC" size:18];
    self.titleLabel.textColor = [UIColor whiteColor];
    if (indexPath.row == 0) {
//        self.oneIMGView.image = [UIImage imageNamed:@"箭头-拷贝-5"];
        self.statusImage.hidden = NO;
        self.oneIMGView.hidden = YES;
        self.oneLabel.text = @"无";
    }else if (indexPath.row == 1) {
        self.oneIMGView.hidden = NO;
        self.statusImage.hidden = YES;
        self.oneIMGView.image = [UIImage imageNamed:@"箭头-拷贝-4"];
        self.oneLabel.text = @"6个";
    }
    
    if (indexPath.row == 5) {
        self.oneLabel.hidden = YES;
    }else{
        self.oneLabel.hidden = NO;
    }
    
    switch (indexPath.row) {
        case 0:
            self.titleLabel.text = @"音量随车速调节";
            break;
        case 1:
            self.titleLabel.text = @"车辆故障查看";
            break;
        case 2:
            self.titleLabel.text = @"无线充电";
            break;
        case 3:
            self.titleLabel.text = @"氛围灯";
            break;
        case 4:
            self.titleLabel.text = @"主题颜色";
            break;
        case 5:
            self.titleLabel.text =@"储存空间";
            break;
        case 6:
            self.titleLabel.text =@"驾驶模式";
            break;
        case 7:
            self.titleLabel.text =@"能量流";
            break;
        case 8:
            self.titleLabel.text =@"平衡衰减";
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
