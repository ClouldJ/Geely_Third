//
//  GeelyLeftContainsTableView.h
//  Geely_Third
//
//  Created by WillyZhao on 16/9/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GeelyLeftContainsDelegate <NSObject>
-(void)geelyOneTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath;

-(void)geelySecTapLeftContainsTableView:(UITableView *)tableView didClickedIndexPath:(NSIndexPath *)indexPath;


@end

@interface GeelyLeftContainsTableView : UIView

@property (nonatomic ,assign) id<GeelyLeftContainsDelegate> delegate;

@property (nonatomic, strong) NSMutableArray *dataSource_;                                  //数据源

@property (nonatomic, strong) NSMutableArray *dataSource_array;                                  //数据源


@property (nonatomic, strong)     UITableView *tableView_;

@property (nonatomic, strong)     UITableView *tableView_two;




@end
