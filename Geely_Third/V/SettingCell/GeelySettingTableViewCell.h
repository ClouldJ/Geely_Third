//
//  GeelySettingTableViewCell.h
//  Geely_Third
//
//  Created by WillyZhao on 16/10/20.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeelySettingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;
@property (weak, nonatomic) IBOutlet UIImageView *oneIMGView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;
@property (weak, nonatomic) IBOutlet UIButton *statusBtn;

+(NSString *)cellWithIndexPath:(NSIndexPath *)indexPath;

-(void)cellForRowWith:(NSIndexPath *)indexPath;

@end
