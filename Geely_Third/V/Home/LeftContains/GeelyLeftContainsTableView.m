//
//  GeelyLeftContainsTableView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/9/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyLeftContainsTableView.h"

#import "GeelyLeftContainsTableViewCell.h"

@interface GeelyLeftContainsTableView () <UITableViewDelegate,UITableViewDataSource,GeelyLeftContainsTableViewCellDelegate> {
    NSMutableArray *dataAccept;
}

@end

@implementation GeelyLeftContainsTableView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        [self loadSubViews];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
//        [self loadSubViews];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//- (void)changeGeelyHomeLeftHomeToGold{
//    //    if ([SingleModel sharedInstance].indexPathHome.row == 4) {
//    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:0];
//    GeelyLeftContainsTableViewCell *cell = [self.tableView_ cellForRowAtIndexPath:indexPath];
//    
//    [cell.imageView_ animationImage:[UIImage imageNamed:@"Geely_home_left_home"]];
//    //    }
//    
//}
//- (void)changeGeelyHomeLeftHomeToBlue{
//    //    if ([SingleModel sharedInstance].indexPathHome.row == 4) {
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:0];
//    GeelyLeftContainsTableViewCell *cell = [self.tableView_ cellForRowAtIndexPath:indexPath];
//    [cell.imageView_ animationImage:[UIImage imageNamed:@"Geely_homeBtn_blue"]];
//    //    }
//    
//}
//- (void)changeGeelyHomeLeftHomeToRed{
//    //    if ([SingleModel sharedInstance].indexPathHome.row == 4) {
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:0];
//    GeelyLeftContainsTableViewCell *cell = [self.tableView_ cellForRowAtIndexPath:indexPath];
//    [cell.imageView_ animationImage:[UIImage imageNamed:@"Geely_home_red"]];
//    //    }
//    
//}

-(void)loadVVVViews {
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeGeelyHomeLeftHomeToGold) name:MODE_GOLD object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeGeelyHomeLeftHomeToBlue) name:MODE_BLUE object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeGeelyHomeLeftHomeToRed) name:MODE_RED object:nil];
    
    self.backgroundColor = [UIColor clearColor];
    self.tableView_two = [[UITableView alloc] initWithFrame:self.frame];
    self.tableView_two.scrollEnabled = NO;
    self.tableView_two.delegate = self;
    self.tableView_two.dataSource = self;
    self.tableView_two.rowHeight = self.frame.size.height/5;
    self.tableView_two.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView_two.tag = 2;
    [self addSubview:self.tableView_two];
    self.tableView_two.backgroundColor = [UIColor clearColor];

    
    [self.tableView_two registerNib:[UINib nibWithNibName:@"GeelyLeftContainsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}

-(void)loadSubViews {
    self.backgroundColor = [UIColor clearColor];
    self.tableView_ = [[UITableView alloc] initWithFrame:self.frame];
    self.tableView_.backgroundColor = [UIColor clearColor];
    self.tableView_.scrollEnabled = NO;
    self.tableView_.delegate = self;
    self.tableView_.tag = 1;
    self.tableView_.dataSource = self;
    self.tableView_.rowHeight = self.frame.size.height/5;
    self.tableView_.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView_];
    
    [self.tableView_ registerNib:[UINib nibWithNibName:@"GeelyLeftContainsTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataAccept.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeelyLeftContainsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell cellForIndexPath:indexPath];
    cell.delegate = self;
    if (tableView.tag == 1) {
        cell.backgroundColor = [UIColor clearColor];
    }else if (tableView.tag == 2) {
        cell.backgroundColor = [UIColor clearColor];
    }
    
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

//#pragma mark UITableViewDelegate
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    if (self.delegate) {
//        [self.delegate geelyLeftContainsTableView:tableView didClickedIndexPath:indexPath];
//    }
//    
//}

#pragma mark Public
-(void)setDataSource_:(NSMutableArray *)dataSource_ {
    dataAccept = [NSMutableArray arrayWithArray:dataSource_];
    [self loadSubViews];
}

-(void)setDataSource_array:(NSMutableArray *)dataSource_array {
    dataAccept = [NSMutableArray arrayWithArray:dataSource_array];
    [self loadVVVViews];
}


#pragma mark cell delegate
-(void)cellSecTapGesture:(UITapGestureRecognizer *)tap touchCell:(GeelyLeftContainsTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView_ indexPathForCell:cell];
    [self.tableView_ deselectRowAtIndexPath:indexPath animated:YES];

    
    [SingleModel sharedInstance].indexPathHome = [self.tableView_ indexPathForCell:cell];
    
    if ([self.delegate respondsToSelector:@selector(geelySecTapLeftContainsTableView:didClickedIndexPath:)]&&self.delegate) {
        [self.delegate geelySecTapLeftContainsTableView:self.tableView_ didClickedIndexPath:indexPath];
    }
    
}

-(void)cellOneTapGesture:(UITapGestureRecognizer *)tap touchCell:(GeelyLeftContainsTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView_ indexPathForCell:cell];
    [self.tableView_ deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row != [SingleModel sharedInstance].indexPathHome.row) {
        [self cellAction:cell];
        
        if ([self.delegate respondsToSelector:@selector(geelyOneTapLeftContainsTableView:didClickedIndexPath:)]&&self.delegate) {
            [self.delegate geelyOneTapLeftContainsTableView:self.tableView_ didClickedIndexPath:indexPath];
        }
    }
    

}

-(void)cellAction:(GeelyLeftContainsTableViewCell *)cellBack {
    
    if ([SingleModel sharedInstance].oldCell != cellBack) {
        [SingleModel sharedInstance].oldCell = cellBack;
        for (GeelyLeftContainsTableViewCell *cell in self.tableView_.visibleCells) {
            NSIndexPath *indexPath = [self.tableView_ indexPathForCell:cell];
            if (cell == cellBack) {
                cell.indexPathCell = indexPath;
                cell.didClicked = YES;
            }else{
                cell.indexPathCell = indexPath;
                cell.didClicked = NO;
            }
        }
    }else{
        //TODO;
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"geelyfin" object:nil];
        
        NSLog(@"未知情况");
//        return;
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
