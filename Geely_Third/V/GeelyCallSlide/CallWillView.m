//
//  CallWillView.m
//  CellPhoneView
//
//  Created by haigui on 16/11/22.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "CallWillView.h"

#define NUMBER_FONT [UIFont systemFontOfSize:14.0f]
#define backgroundImage [UIImage imageNamed:@"menu_background@2x.jpg"]

@interface CallWillView ()

@property (nonatomic, strong) UIImageView *keyboardImageView;

@property (nonatomic, strong) UIImageView *backgroundImageView;



@property (nonatomic, strong) UIButton *callButton;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIButton *backButton;


@end

@implementation CallWillView

#pragma mark - init

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.frame = CGRectMake(0, 0, 340, 435);
        [self backgroundConfig];
        [self backButtonConfig];
        [self numberLabelConfig];
        [self callButtonConfig];
        [self keyboardConfig];
        
        
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        self.contentView.userInteractionEnabled = YES;
    }
    return self;
}


#pragma mark - subviewsConfig
- (void)keyboardConfig {
    UIImage *keyboardImage = [UIImage imageNamed:@"keyboard_5_selected@2x.jpg"];
    CGSize size = keyboardImage.size;
    _keyboardImageView = [[UIImageView alloc] init];
    _keyboardImageView.image = [UIImage imageNamed:@"keyboard_5_selected@2x.jpg"];
    _keyboardImageView.frame = CGRectMake(0, 435 - size.height - self.callButton.frame.size.height - 30, size.width, size.height);
    _keyboardImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:_keyboardImageView];
    
    CGFloat distance = 30;
    CGFloat length = (self.keyboardImageView.frame.size.width - distance) / 3;
    CGFloat height = self.keyboardImageView.frame.size.height / 4;
    for (NSInteger i = 0; i < 4; i++) {
        for (NSInteger j = 0; j < 3; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(distance + j * length, height * i, length, height);
            
            button.tag = 2000 + i * 3 + j;
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            
            
            [_keyboardImageView addSubview:button];
            
            
            
        }
    }
    
}

- (void)numberLabelConfig {
    self.numberLabel = [[UILabel alloc] init];
    self.numberLabel.frame = CGRectMake(10, self.backButton.frame.origin.y - 10, self.contentView.bounds.size.width - self.backButton.bounds.size.width - 20,self.backButton.frame.size.height + 20);
//    self.numberLabel.backgroundColor = [UIColor redColor];
    self.numberLabel.textColor = [UIColor whiteColor];
    self.numberLabel.textAlignment = NSTextAlignmentRight;
    self.numberLabel.text = @"";
    [self.contentView addSubview:self.numberLabel];
}

- (void)backButtonConfig {
    UIImage *backImage = [UIImage imageNamed:@"keyboard_back@2x.jpg"];
    CGFloat width = backImage.size.width;
    CGFloat height = backImage.size.height;
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(self.contentView.bounds.size.width - width, 80, width, height);
    [self.backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.backButton];
    
    
}

- (void)backgroundConfig {
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    self.backgroundImageView.image = backgroundImage;
    self.backgroundImageView.userInteractionEnabled = YES;
    [self.contentView addSubview:self.backgroundImageView];
}



#pragma mark - event response

/**
 下方按钮。
 */
- (void)callButtonConfig {
    UIImage *callImage = [UIImage imageNamed:@"keyboard_call@2x.jpg"];
    
//    CGFloat width = 300;
    CGFloat width = callImage.size.width;
//    CGFloat height = 50;
    CGFloat height = callImage.size.height;
    self.callButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.callButton.frame = CGRectMake((self.frame.size.width - width) / 2, self.frame.size.height - height - 20, width, height);
    
    [self.callButton setBackgroundImage:callImage forState:UIControlStateNormal];
    [self.callButton addTarget:self action:@selector(callButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.callButton];
}

- (void)buttonClicked:(UIButton *)sender {
    NSInteger index = sender.tag - 2000;
    //    _keyboardImageView.image = nil;
    _keyboardImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"keyboard_%lu_selected@2x.jpg", index + 1]];
    
    NSString *indexString;
    if (index == 9) {
        indexString = @"*";
    } else if (index == 10) {
        indexString = @"0";
    } else if (index == 11) {
        indexString = @"#";
    } else {
        indexString = [NSString stringWithFormat:@"%lu", index + 1];
    }
    
    self.numberLabel.text = [NSString stringWithFormat:@"%@%@", self.numberLabel.text, indexString];
    
}


- (void)callButtonClicked:(UIButton *)sender {
    NSLog(@"拨号");
    [self.delegate cellPhoneViewButtonClicked:self.callButton];
}

- (void)backButtonClicked:(UIButton *)sender {
    if (self.numberLabel.text.length == 0) {
        return;
    }
    
    NSRange range = {0, self.numberLabel.text.length - 1};
    NSString *string = [self.numberLabel.text substringWithRange:range];
    self.numberLabel.text = string;
    
}

@end
