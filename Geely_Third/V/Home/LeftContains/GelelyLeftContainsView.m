//
//  GelelyLeftContainsView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/9/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GelelyLeftContainsView.h"

@interface GelelyLeftContainsView () <UITableViewDelegate,UITableViewDataSource> {
    NSMutableArray *stringArray;
}

@end

@implementation GelelyLeftContainsView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadSubViews];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.frame = CGRectMake(0, 0, 82, 410);
        self.backgroundColor = [UIColor clearColor];
        [self loadByADecoder];
    }
    return self;
}



-(void)loadByADecoder {
    NSMutableArray *arr = [NSMutableArray array];
    stringArray = [NSMutableArray array];
    
    for (int i = 0; i<5; i++) {
        [arr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height/5, self.frame.size.width, self.frame.size.height*3/5)];
    imageView.backgroundColor = [UIColor greenColor];
    imageView.image = [UIImage imageNamed:@"Geely_home_leftBG"];
    [self addSubview:imageView];
    
    self.tableView_ = [[GeelyLeftContainsTableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];        
    self.tableView_.dataSource_array = arr;
    
    
    [self addSubview:self.tableView_];
}

-(void)loadSubViews {
    
    NSMutableArray *arr = [NSMutableArray array];
    stringArray = [NSMutableArray array];
    
    for (int i = 0; i<5; i++) {
        [arr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    [self reloadViewDirection:YES];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height/5, self.frame.size.width, self.frame.size.height*3/5)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"Geely_home_leftBG"];
    [self addSubview:imageView];
    
    
    self.tableView_ = [[GeelyLeftContainsTableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.tableView_.dataSource_ = arr;
    self.tableView_.backgroundColor = [UIColor clearColor];
    [self addSubview:self.tableView_];
    
//    UIView *view_dy = [UIView alloc] initWithFrame:<#(CGRect)#>
//    
//    self.dynamicView = [[GeelyLeftFrameDynamicView alloc] initWithFrame:CGRectMake(0, 0, 0, self.frame.size.height)];
    
}

-(void)reloadViewDirection:(BOOL)direction {

    self.tableView_left_down = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.size.width-((2732*556)/1920)/2, 0, ((2732*556)/1920)/2, self.frame.size.height)];
    self.tableView_left_down.backgroundColor = [UIColor clearColor];
    self.tableView_left_down.delegate = self;
    self.tableView_left_down.dataSource = self;
    self.tableView_left_down.tag = 1;
    self.tableView_left_down.userInteractionEnabled = YES;
    self.tableView_left_down.hidden = YES;
    self.tableView_left_down.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView_left_down];
    
    _bbb = [[[NSBundle mainBundle] loadNibNamed:@"aiusdadnasinu" owner:self options:nil]firstObject];
    _bbb.backgroundColor = [UIColor clearColor];
    _bbb.frame = CGRectMake(self.frame.size.width-((2732*556)/1920)/2, 0, ((2732*556)/1920)/2, self.frame.size.height);
    [self addSubview:_bbb];
    self.bbb.userInteractionEnabled = YES;
    _bbb.hidden = YES;
    
    self.keyBoardView = [[[NSBundle mainBundle] loadNibNamed:@"nsdnanodoasdin" owner:self options:nil]firstObject];
    self.keyBoardView.frame = CGRectMake(self.frame.size.width-((2732*556)/1920)/2, 0, ((2732*556)/1920)/2, self.frame.size.height);
    self.keyBoardView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.keyBoardView];
    self.keyBoardView.hidden = YES;
    self.textField = (UITextField *)[self.keyBoardView viewWithTag:301];
//    self.textField.text = @"";
    self.userInteractionEnabled = YES;
    
    UIButton *btn_delete = (UIButton *)[self.keyBoardView viewWithTag:302];
    [btn_delete addTarget:self action:@selector(keyBoardAction:) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i = 200; i<212; i++) {
        UIButton *btn = (UIButton *)[self.keyBoardView viewWithTag:i];
        btn.tag = i;
        [btn addTarget:self action:@selector(keyBoardAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
        
    self.tableView_right_down = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ((2732*556)/1920)/2, self.frame.size.height)];
    self.tableView_right_down.userInteractionEnabled = YES;
    self.tableView_right_down.backgroundColor = [UIColor clearColor];
    self.tableView_right_down.delegate = self;
    self.tableView_right_down.dataSource = self;
    self.tableView_right_down.tag = 2;
    self.tableView_right_down.hidden = YES;
    self.tableView_right_down.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView_right_down];

    [self bringSubviewToFront:self.tableView_];

}

-(void)keyBoardAction:(UIButton *)btn {
    NSInteger index = btn.tag - 200;
    if (index>=0||index<=9) {
        [stringArray addObject:[NSString stringWithFormat:@"%ld",index]];
    }
    NSString *str = [stringArray componentsJoinedByString:@""];
    self.textField.text = str;
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_a"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell_a"];
        cell.textLabel.text = @"测试侧滑视图";
        cell.backgroundColor = [UIColor clearColor];
    }
    return cell;
}

#pragma mark UITableViewDelegate
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
