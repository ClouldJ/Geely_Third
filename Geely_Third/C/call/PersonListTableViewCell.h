//
//  PersonListTableViewCell.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *status;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(void)cellForIndexPath:(NSIndexPath *)indexPath andData:(NSArray *)data;

@end
