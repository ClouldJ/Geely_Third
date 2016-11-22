//
//  CallingView.m
//  CellPhoneView
//
//  Created by haigui on 16/11/22.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "CallingView.h"

#define numberLabelFont [UIFont systemFontOfSize:18.0f]

@interface CallingView ()


@property (nonatomic, strong, readwrite) UILabel *numberLabel;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIButton *fooButton;

@end

@implementation CallingView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.frame = CGRectMake(0, 0, 340, 435);
        [self backgroundConfig];
        [self fooButtonConfig];
        
        [self.backgroundImageView addSubview:self.numberLabel];
        
    }
    return self;
}

- (void)fooButtonConfig {
    self.fooButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.fooButton.frame = CGRectMake(0, self.bounds.size.height - 60, self.bounds.size.width, 60);
    [self.fooButton addTarget:self action:@selector(fooButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.backgroundImageView addSubview:self.fooButton];
    
}

- (void)backgroundConfig {
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.backgroundImageView.image = [UIImage imageNamed:@"CallingView@2x.jpg"];
    self.backgroundImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.backgroundImageView];
}

- (void)fooButtonClicked:(UIButton *)sender {
    NSLog(@"挂断");
    [self.delegate callingViewButtonClicked:sender];
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.frame = CGRectMake(0, 130, self.bounds.size.width, 50);
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.font = numberLabelFont;
        _numberLabel.textColor = [UIColor whiteColor];
    }
    return _numberLabel;
}


@end
