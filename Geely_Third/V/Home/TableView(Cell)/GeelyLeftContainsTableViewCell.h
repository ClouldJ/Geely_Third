//
//  GeelyLeftContainsTableViewCell.h
//  Geely_Third
//
//  Created by WillyZhao on 16/9/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GeelyLeftContainsTableViewCell;
@protocol GeelyLeftContainsTableViewCellDelegate <NSObject>

-(void)cellOneTapGesture:(UITapGestureRecognizer *)tap touchCell:(GeelyLeftContainsTableViewCell *)cell;

-(void)cellSecTapGesture:(UITapGestureRecognizer *)tap touchCell:(GeelyLeftContainsTableViewCell *)cell;

@end

@interface GeelyLeftContainsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView_;

//@property (nonatomic, strong) UIImageView *imageView_;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView_;

@property (nonatomic, strong) UISwipeGestureRecognizer *swe;

@property (nonatomic, strong) UITapGestureRecognizer *tap_one;

@property (nonatomic, assign) id<GeelyLeftContainsTableViewCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *status;

-(void)cellForIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, assign) BOOL didClicked;

@property (nonatomic, strong) NSIndexPath *indexPathCell;



@end
