//
//  GeelyRightContainBottom.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyRightContainBottom.h"

#import "GeelyRightTableViewCell.h"

@interface GeelyRightContainBottom () <UITableViewDelegate,UITableViewDataSource> {
    UITableView *tableView_;
    UIImageView *badgeView;
    UILabel *label_b;
    UILabel *label_prompt;
}

@end

@implementation GeelyRightContainBottom

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toLeft) name:TOLEFT object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toRight) name:TORIGHT object:nil];
        
        [self loadSubViews];
    }
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)toLeft{
    
    for (GeelyRightTableViewCell *cell in [tableView_ visibleCells]) {
        cell.imageToRight.constant = 0;
        cell.headImageToLeft.constant = 55;
        cell.labelToHeadImage.constant = 10;
    }
    
    badgeView.frame = CGRectMake(2+55, 2, 24, 18);
    label_b.frame = CGRectMake(35/2+55, 0, 12, 12);
    label_prompt.frame = CGRectMake(badgeView.frame.origin.x+badgeView.frame.size.width+12, badgeView.frame.origin.y, 300, 20);
    
}

-(void)toRight {
    for (GeelyRightTableViewCell *cell in [tableView_ visibleCells]) {
        cell.imageToRight.constant = 55;
        cell.headImageToLeft.constant = 0;
        cell.labelToHeadImage.constant = 10;
    }
    
    badgeView.frame = CGRectMake(2, 2, 24, 18);
    label_b.frame = CGRectMake(35/2, 0, 12, 12);
    label_prompt.frame = CGRectMake(badgeView.frame.origin.x+badgeView.frame.size.width+12, badgeView.frame.origin.y, 300, 20);
    
}

-(void)loadSubViews {
//    CGFloat index = 2620/1920;
    badgeView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, 24, 18)];
    badgeView.image = [UIImage imageNamed:@"Geely_right_email"];
    [self addSubview:badgeView];
    
    label_b = [[UILabel alloc] initWithFrame:CGRectMake(35/2, 0, 12, 12)];
    label_b.textColor = [UIColor whiteColor];
    label_b.backgroundColor = [UIColor redColor];
    label_b.text = @"1";
    label_b.textAlignment = NSTextAlignmentCenter;
    label_b.font = [UIFont systemFontOfSize:10];
    label_b.layer.masksToBounds = YES;
    label_b.layer.cornerRadius = 6;
    [self addSubview:label_b];
    
    label_prompt = [[UILabel alloc] initWithFrame:CGRectMake(badgeView.frame.origin.x+badgeView.frame.size.width+12, badgeView.frame.origin.y, 300, 20)];
    label_prompt.textColor = [UIColor whiteColor];
    label_prompt.text = @"信息中心";
    [self addSubview:label_prompt];
    
    
    tableView_ = [[UITableView alloc] initWithFrame:CGRectMake(0, badgeView.frame.origin.y+badgeView.frame.size.height+20, self.frame.size.width, self.frame.size.height-35)];
    tableView_.backgroundColor = [UIColor clearColor];
    tableView_.delegate = self;
    tableView_.dataSource = self;
    tableView_.rowHeight = 40;
    tableView_.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:tableView_];
    
    [tableView_ registerNib:[UINib nibWithNibName:@"GeelyRightTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];

}

#pragma mark UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeelyRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    
    [cell cellForRow:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
