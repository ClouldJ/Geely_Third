//
//  AddressCell.m
//  CellPhoneView
//
//  Created by haigui on 16/11/22.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "AddressCell.h"

@interface AddressCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *calledView;


@end

@implementation AddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self subViewConfig];
    }
    return self;
}

- (void)reloadCellView {
    self.calledView.hidden = _address.called.integerValue;
    NSString *countString;
    countString = _address.count.integerValue == 1? @"" : [NSString stringWithFormat:@"(%@)", _address.count];
    self.nameLabel.text = [NSString stringWithFormat:@"%@%@", _address.name, countString];
    
    self.nameLabel.textColor = _address.red.integerValue == 1? [UIColor redColor]:[UIColor whiteColor];
    
}

- (void)subViewConfig {
    self.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.calledView];
    [self.contentView addSubview:self.nameLabel];
}

- (void)setAddress:(Address *)address {
    _address = address;
    [self reloadCellView];
}

- (UIImageView *)calledView {
    if (!_calledView) {
        _calledView = [[UIImageView alloc] init];
        _calledView.image = [UIImage imageNamed:@"calledView@2x.jpg"];
        _calledView.frame = CGRectMake(10, 20, 25, 20);

    }
    return _calledView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.frame = CGRectMake(50, 0, 300, 60);
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:18.0f];
//        _nameLabel.backgroundColor = [UIColor redColor];
    }
    return _nameLabel;
}

@end
