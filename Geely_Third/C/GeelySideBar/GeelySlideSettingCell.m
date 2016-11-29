//
//  GeelySlideSettingCell.m
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelySlideSettingCell.h"

@implementation GeelySlideSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)cellReset:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            if (self.cell_selected) {
                self.imageVV.image = [UIImage imageNamed:@"dianji_01"];
            }else{
                self.imageVV.image = [UIImage imageNamed:@"hui_01"];
            }
            break;
        case 1:
        {
            if (self.cell_selected) {
                self.imageVV.image = [UIImage imageNamed:@"dianji_02"];
            }else{
                self.imageVV.image = [UIImage imageNamed:@"hui_02"];
            }
        }
            break;
        case 2:
        {
            if (self.cell_selected) {
                self.imageVV.image = [UIImage imageNamed:@"dianji_03"];
            }else{
                self.imageVV.image = [UIImage imageNamed:@"hui_03"];
            }
        }
            break;
        case 3:
        {
            if (self.cell_selected) {
                self.imageVV.image = [UIImage imageNamed:@"dianji_04"];
            }else{
                self.imageVV.image = [UIImage imageNamed:@"hui_04"];
            }
        }
            break;
        case 4:
        {
            if (self.cell_selected) {
                self.imageVV.image = [UIImage imageNamed:@"dianji_05"];
            }else{
                self.imageVV.image = [UIImage imageNamed:@"hui_05"];
            }
        }
            break;
        case 5:
        {
            if (self.cell_selected) {
                self.imageVV.image = [UIImage imageNamed:@"dianji_06"];
            }else{
                self.imageVV.image = [UIImage imageNamed:@"hui_06"];
            }
        }
            break;
        default:
            break;
    }

}

-(void)cellModel:(NSIndexPath *)indexPath {
    
    for (NSString *str in [SingleModel sharedInstance].iconIndexArray) {
        NSInteger ii = [str integerValue];
        
        
        if (ii == 1&&indexPath.row==3) {
            self.imageVV.image = [UIImage imageNamed:@"dianji_04"];
            self.cell_selected = YES;
            break;
        }else if (((ii == 2)||(ii == 3))&&(indexPath.row == 2)){
            self.imageVV.image = [UIImage imageNamed:@"dianji_03"];
            self.cell_selected = YES;
            break;
        }else if (ii == 4&&indexPath.row == 5){
            self.imageVV.image = [UIImage imageNamed:@"dianji_06"];
            self.cell_selected = YES;
            break;
        }else if (ii == 5 &&indexPath.row == 0){
            self.imageVV.image = [UIImage imageNamed:@"dianji_01"];
            self.cell_selected = YES;
            break;
        }else if (ii == 6&&indexPath.row == 1){
            self.imageVV.image = [UIImage imageNamed:@"dianji_02"];
            self.cell_selected = YES;
            break;
        }else if (ii == 7&&indexPath.row == 4){
            self.imageVV.image = [UIImage imageNamed:@"dianji_05"];
            self.cell_selected = YES;
            break;
        }else{
            switch (indexPath.row) {
                case 0:
                    self.imageVV.image = [UIImage imageNamed:@"hui_01"];
                    break;
                case 1:
                    self.imageVV.image = [UIImage imageNamed:@"hui_02"];
                    break;
                case 2:
                    self.imageVV.image = [UIImage imageNamed:@"hui_03"];
                    break;
                case 3:
                    self.imageVV.image = [UIImage imageNamed:@"hui_04"];
                    break;
                case 4:
                    self.imageVV.image = [UIImage imageNamed:@"hui_05"];
                    break;
                case 5:
                    self.imageVV.image = [UIImage imageNamed:@"hui_06"];
                    break;
                default:
                    break;
            }
        }
 
    }
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
