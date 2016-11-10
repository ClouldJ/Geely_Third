//
//  GeelyLittleSettingACell.h
//  Geely_Third
//
//  Created by WillyZhao on 16/11/10.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeelyLittleSettingACell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *contentCustomView;
//@property (weak, nonatomic) IBOutlet UIView *contentCustomView;
@property (weak, nonatomic) IBOutlet UIImageView *bottonLine;

-(void)viewAddSelectedImage:(NSIndexPath *)indexPath cancleImage:(UIImage *)cImage;

@property (nonatomic, assign) BOOL Wselected;

@property (nonatomic, strong) UIImageView *contentImageView;
@end
