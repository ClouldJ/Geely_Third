//
//  GeelyCalledListView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/22.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyCalledListView.h"

#import "GeelyCalledListTableViewCell.h"

@interface GeelyCalledListView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation GeelyCalledListView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"geelycalledlist" owner:self options:nil] firstObject];
        self.frame = frame;
        self.tableView_.backgroundColor = [UIColor clearColor];
        self.tableView_.delegate= self;
        self.tableView_.dataSource = self;
        self.tableView_.rowHeight = 60;
        self.tableView_.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self.tableView_ registerNib:[UINib nibWithNibName:@"GeelyCalledListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"calledlist"];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeelyCalledListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"calledlist" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [cell cellForIndexPath:indexPath];
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
