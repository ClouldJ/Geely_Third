//
//  PersonListTableViewCell.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "PersonListTableViewCell.h"
#import "GeelyPopPersionList.h"
@implementation PersonListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.titleLabel.font = [UIFont fontWithName:@"Noto Sans CJK SC" size:18];

    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:longPress];
    
}

-(void)longPress:(UILongPressGestureRecognizer *)longPres {
    GeelyPopPersionList *list = [[GeelyPopPersionList alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [list showAnimation];
}

-(void)cellForIndexPath:(NSIndexPath *)indexPath andData:(NSArray *)data{
    if (indexPath.row == 0) {
        self.status.image = [UIImage imageNamed:@"B_personlist"];
        self.status.hidden = NO;
    }else if (indexPath.row == 3) {
        self.status.hidden = NO;
        self.status.image = [UIImage imageNamed:@"C_personlist"];
    }else{
        self.status.hidden = YES;
    }
    self.nameLabel.text = data[indexPath.row];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
