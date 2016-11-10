//
//  GeelyCalledListlistView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyCalledListlistView.h"

#import "CallListTableViewCell.h"

@interface GeelyCalledListlistView () <UITableViewDataSource,UITableViewDelegate> {
    UITableView *tableView_;
    
}

@end

@implementation GeelyCalledListlistView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        tableView_ = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        tableView_.backgroundColor = [UIColor clearColor];
        tableView_.delegate = self;
        tableView_.dataSource = self;
        tableView_.rowHeight = 60;
        tableView_.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:tableView_];
//        [tableView_ registerNib:[UINib nibWithNibName:@"CalledListTableViewCell" bundle:nil] forCellReuseIdentifier:@"listlist"];
        [tableView_ registerNib:[UINib nibWithNibName:@"CallListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"listforcall"];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CallListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listforcall" forIndexPath:indexPath];
//    if (!cell) {
//        cell = [[CalledListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"listlist"];
//    }
    cell.backgroundColor = [UIColor clearColor];
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
