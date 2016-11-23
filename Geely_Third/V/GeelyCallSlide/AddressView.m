//
//  AddressView.m
//  CellPhoneView
//
//  Created by haigui on 16/11/22.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "AddressView.h"
#import "AddressCell.h"
#import "Address.h"


static NSString *const AddressCellIdentifier = @"AddressCell";

@interface AddressView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *maintableView;

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, strong) NSArray *addressArray;

@end

@implementation AddressView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.frame = CGRectMake(0, 0, 340, 435);
        [self initialize];
        
        

        
    }
    return self;
}


#pragma mark - instance


#pragma mark - private
- (void)backgroundConfig {
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.backgroundImageView.image = [UIImage imageNamed:@"Callinglist"];
    self.backgroundImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.backgroundImageView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.addressArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AddressCell *cell = [tableView dequeueReusableCellWithIdentifier:AddressCellIdentifier forIndexPath:indexPath];
    
    cell.address = self.addressArray[indexPath.row];
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _maintableView.frame.size.height/5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AddressCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self.delegate addressViewCellSelected:cell.address];
    
}

- (void)initialize {
    [self backgroundConfig];
    [self.contentView addSubview:self.maintableView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(340-45, (435-60)/2-10, 30, 60);
    btn.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:btn];
    
    [btn addTarget:self action:@selector(gotoCallWill:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)gotoCallWill:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(gotoCallWillView:)]&&self.delegate) {
        [self.delegate gotoCallWillView:btn];
    }
}


#pragma mark - setter and getter

- (UITableView *)maintableView {
    if (!_maintableView) {
        _maintableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 130, 290, 290) style:UITableViewStylePlain];
        _maintableView.showsHorizontalScrollIndicator = NO;
        _maintableView.showsVerticalScrollIndicator = NO;
        _maintableView.delegate = self;
        _maintableView.dataSource = self;
        _maintableView.backgroundColor = [UIColor clearColor];
        _maintableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_maintableView registerClass:[AddressCell class] forCellReuseIdentifier:AddressCellIdentifier];
        
    }
    return _maintableView;
}


- (NSArray *)addressArray {
    if (!_addressArray) {
        
        Address *address1 = [Address new];
        
        address1.name = @"海龟";
        address1.count = @1;
        address1.red = @1;
        address1.called = @0;
        
        Address *address2 = [Address new];
        
        address2.name = @"霸王别姬";
        address2.count = @2;
        address2.red = @0;
        address2.called = @1;
        
        Address *address3 = [Address new];
        
        address3.name = @"13922112211";
        address3.count = @2;
        address3.red = @0;
        address3.called = @0;
        
        
        Address *address4 = [Address new];
        
        address4.name = @"流金哇卡呀酷烈";
        address4.count = @1;
        address4.red = @1;
        address4.called = @0;
        
        
        Address *address5 = [Address new];
        
        address5.name = @"流金哇卡呀酷烈";
        address5.count = @3;
        address5.red = @1;
        address5.called = @1;
        
        
        Address *address6 = [Address new];
        
        address6.name = @"028-87331231";
        address6.count = @1;
        address6.red = @1;
        address6.called = @0;
        
        
        Address *address7 = [Address new];
        
        address7.name = @"新不了情";
        address7.count = @3;
        address7.red = @1;
        address7.called = @1;
        
        _addressArray = @[address1,address2,address3,address4,address5,address6,address7];
    }
    return _addressArray;
}




@end
