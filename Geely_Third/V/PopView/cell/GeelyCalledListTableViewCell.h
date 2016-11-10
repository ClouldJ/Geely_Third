//
//  GeelyCalledListTableViewCell.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/22.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeelyCalledListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(void)cellForIndexPath:(NSIndexPath *)indexPath;

@end
