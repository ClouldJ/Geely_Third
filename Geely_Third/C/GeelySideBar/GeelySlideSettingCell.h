//
//  GeelySlideSettingCell.h
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeelySlideSettingCell : UITableViewCell

-(void)cellModel:(NSIndexPath *)indexPath;
@property (weak, nonatomic) IBOutlet UIImageView *imageVV;
@property(nonatomic, assign) BOOL cell_selected;

-(void)cellReset:(NSIndexPath *)indexPath;

@end
