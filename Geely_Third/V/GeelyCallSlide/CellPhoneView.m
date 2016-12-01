//
//  CellPhoneView.m
//  CellPhoneView
//
//  Created by haigui on 16/11/21.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "CellPhoneView.h"
#import "CallingView.h"
#import "AddressView.h"
#import "CallWillView.h"

#define backgroundImage [UIImage imageNamed:@"menu_background@2x.jpg"]

#define AddressRow 0
#define CallWillRow 1
#define CallingRow 2

static NSString *const AddressViewIdentifier = @"AddressView";
static NSString *const CallingViewIdentifier = @"CallingView";
static NSString *const CallWillViewIdentifier = @"CallWillView";


@interface CellPhoneView () <UITableViewDelegate, UITableViewDataSource, AddressViewDelegate, CallWillViewDelegate, CallingViewDelegate>

@property (nonatomic, strong) UIImageView *backgroundView;


@property (nonatomic, strong) UIImageView *keyboardImageView;



@property (nonatomic, strong) UIButton *callButton;


@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation CellPhoneView

/**
 340*435
 */
#pragma mark - init

- (instancetype)init {
    if (self = [[CellPhoneView alloc] initWithFrame:CGRectMake(0, 0, 0, 435)]) {


    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

#pragma mark - instance
- (void)scrollToAddressView {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:AddressRow inSection:0];
    [self.cellPhoneTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void)scrollToCallingView {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:CallingRow inSection:0];
    [self.cellPhoneTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

- (void)scrollToCallWillView {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:CallWillRow inSection:0];
    [self.cellPhoneTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:YES];
}

#pragma mark - private

- (void)initialize {
    
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor clearColor];
    [self cellPhoneTableViewConfig];
//    [self backgroundConfig];
    
}

- (void)cellPhoneTableViewConfig {
    self.cellPhoneTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 340, 435) style:UITableViewStylePlain];
    self.cellPhoneTableView.showsHorizontalScrollIndicator = NO;
    self.cellPhoneTableView.showsVerticalScrollIndicator = NO;
    self.cellPhoneTableView.delegate = self;
    self.cellPhoneTableView.dataSource = self;
    self.cellPhoneTableView.rowHeight = 435;
    self.cellPhoneTableView.backgroundColor = [UIColor clearColor];
    self.cellPhoneTableView.userInteractionEnabled = YES;
    self.cellPhoneTableView.scrollEnabled = NO;
    self.cellPhoneTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.cellPhoneTableView registerClass:[AddressView class] forCellReuseIdentifier:AddressViewIdentifier];
    [self.cellPhoneTableView registerClass:[CallingView class] forCellReuseIdentifier:CallingViewIdentifier];
    [self.cellPhoneTableView registerClass:[CallWillView class] forCellReuseIdentifier:CallWillViewIdentifier];
    
    [self addSubview:self.cellPhoneTableView];
 

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == AddressRow) {
        AddressView *addressView = [tableView dequeueReusableCellWithIdentifier:AddressViewIdentifier forIndexPath:indexPath];
        addressView.backgroundColor = [UIColor clearColor];
        addressView.delegate = self;
        return addressView;
    }
    
    if (indexPath.row == CallWillRow) {
        CallWillView *callWillView = [tableView dequeueReusableCellWithIdentifier:CallWillViewIdentifier forIndexPath:indexPath];
        callWillView.backgroundColor = [UIColor clearColor];
        callWillView.delegate = self;
        return callWillView;
    }
    
    if (indexPath.row == CallingRow) {
        CallingView *callingView = [tableView dequeueReusableCellWithIdentifier:CallingViewIdentifier forIndexPath:indexPath];
        callingView.backgroundColor = [UIColor clearColor];
        callingView.delegate = self;
        return callingView;
    }
    
    
    return [UITableViewCell new];
}


- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)backgroundConfig {
    self.backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.backgroundView.image = backgroundImage;
    self.backgroundView.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.backgroundView];
    [self sendSubviewToBack:self.backgroundView];
}

#pragma mark - event response

-(void)frequentContactsButtonClicked {
    [self scrollToAddressView];
}

//- (void)addressViewCellSelected:(Address *)address {
//    [self.delegate addressSelected];
//}
//
//- (void)callingViewButtonClicked:(UIButton *)button {
//    [self.delegate callingButtonClicked];
//}
//
//- (void)cellPhoneViewButtonClicked:(UIButton *)button {
//    [self.delegate callingOffButtonClicked];
//}
//
-(void)gotoCallWillView {
    [self scrollToCallWillView];
}
//
#pragma mark - setter and getter


@end
