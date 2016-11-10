//
//  PersonListView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "PersonListView.h"

#import "PersonListTableViewCell.h"
#import "GeelyKeyBoardCustom.h"
@interface PersonListView () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate> {
    NSMutableArray *data_arr;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView_;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIImageView *searchImage;

@end

@implementation PersonListView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"PersonListTable" owner:self options:nil]firstObject];
        self.frame = frame;
        
        data_arr = [NSMutableArray arrayWithObjects:@"爸爸",@"保修",@"毕福建",@"才哦",@"才不",@"崔道离",@"crab",@"除了可拿到", nil];
        self.searchTextField.delegate = self;
        
        [self viewsAction];
    }
    return self;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    //弹出键盘
    NSLog(@"应该弹出键盘了");
    
    GeelyKeyBoardCustom *keyBoard = [[GeelyKeyBoardCustom alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [keyBoard showAnimation];
    return NO;
}

-(void)viewsAction {
    
    self.tableView_.delegate = self;
    self.tableView_.dataSource = self;
    self.tableView_.rowHeight = 60;
    self.tableView_.backgroundColor = [UIColor clearColor];
    
    [self.tableView_ registerNib:[UINib nibWithNibName:@"PersonListTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"personlistf"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return data_arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personlistf" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    [cell cellForIndexPath:indexPath andData:data_arr];
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
