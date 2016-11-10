//
//  GeelyRightTableViewCell.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeelyRightTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;

-(void)cellForRow:(NSIndexPath *)indexPath;

@end
