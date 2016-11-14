//
//  GeelyCallViewToInput.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/24.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyCallViewToInput.h"

#import "GeelyCallViewTableViewCell.h"
#import "GeelyPhoneCalledView.h"
#import "GeelyCallingActionView.h"

@interface GeelyCallViewToInput () <UITableViewDelegate,UITableViewDataSource,GeelyPhoneCalledViewDelegate> {
    NSMutableArray *buttons;
    MainRequest *mainRequest;
    UIView *callInputView;
    UIScrollView *scrollView;
    GeelyPhoneCalledView *vc;
}

@end

@implementation GeelyCallViewToInput

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"geelycallviewdemo" owner:self options:nil]firstObject];
        self.frame = frame;
        
//        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,340, 435)];
//        scrollView.scrollEnabled=NO;
//        [self addSubview:scrollView];
//        [scrollView addSubview:callInputView];
        [self actionButtons];
    }
    return self;
}

- (IBAction)ONCALL:(id)sender {
    NSLog(@"进来了呢");
    GeelyCallingActionView *vb = [[GeelyCallingActionView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [vb showAnimation];
}

-(void)actionButtons {
    buttons = [NSMutableArray array];

    self.call0.tag = 1;
    [self.call0 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.call1.tag = 2;
    [self.call1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.call2.tag = 3;
    [self.call2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.call3.tag = 4;
    [self.call3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.call4.tag = 5;
    [self.call4 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.call5.tag = 6;
    [self.call5 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.call6.tag = 7;
    [self.call6 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.call7.tag = 8;
    [self.call7 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.call8.tag = 9;
    [self.call8 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.call9.tag = 10;
    [self.call9 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.call addTarget:self action:@selector(callBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.closeBtn addTarget:self action:@selector(closeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView_.backgroundColor = [UIColor clearColor];
    self.tableView_.delegate =self;
    self.tableView_.dataSource = self;

    [self.tableView_ registerNib:[UINib nibWithNibName:@"GeelyCallViewTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"callview"];
    
    self.tableView_.rowHeight = 60;
    
}

-(void)btnAction:(UIButton *)btn {

    NSInteger index = btn.tag - 1;
    [buttons addObject:[NSString stringWithFormat:@"%ld",index]];
    self.phoneTextField.text = [buttons componentsJoinedByString:@""];
}

-(void)callBtnAction:(UIButton *)btn {
    NSLog(@"call call call");
    vc = [[GeelyPhoneCalledView alloc] initWithFrame:CGRectMake(-20,0, 340,self.frame.size.height) andPhone:self.phoneTextField.text];
    vc.delegate = self;
    [vc.backbtn removeFromSuperview];
    [UIView animateWithDuration:0.3 animations:^{
        [self addSubview:vc];
        self.bgImageView.hidden=YES;
        self.phoneTextField.hidden=YES;
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
    mainRequest.requestRadio.type = @0;
    mainRequest.requestPhone.type = @2;
    mainRequest.requestMusic.type = @0;
    mainRequest.requestVoice.type = @0;
    mainRequest.requestVolume.type = @1;
    mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
    
    [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    }];
}
- (void)calledEnd{
    self.bgImageView.hidden=NO;
    self.phoneTextField.hidden=NO;
    [vc removeFromSuperview];
    
}

-(void)closeBtnAction:(UIButton *)btn {
    if (buttons.count == 1) {
        [buttons removeObjectAtIndex:buttons.count - 1];
    }else if(buttons.count>0){
        [buttons removeObjectAtIndex:buttons.count-2];
    }
    self.phoneTextField.text = [buttons componentsJoinedByString:@""];

}

#pragma mark table view delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeelyCallViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"callview" forIndexPath:indexPath];
    cell.titleLabel.font = [UIFont fontWithName:@"Noto Sans CJK SC" size:18];

    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat xx = (scrollView.contentOffset.y)/(scrollView.contentSize.height - self.bounds.size.height+20);

    
    if ([self.delegate respondsToSelector:@selector(didScrollHeightPercent:tableView:)]&&self.delegate) {
        [self.delegate didScrollHeightPercent:xx tableView:self.tableView_];
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
