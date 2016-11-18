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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageToRight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headImageToLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelToHeadImage;

-(void)cellForRow:(NSIndexPath *)indexPath;

@end
