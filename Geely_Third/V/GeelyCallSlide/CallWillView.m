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

@interface CallWillView () {
    UILabel *label_num;
    BOOL check;
}

@property (nonatomic, strong) UIImageView *keyboardImageView;

@property (nonatomic, strong) UIImageView *backgroundImageView;

@property (nonatomic, strong) UIImageView *backgroundImageView1;




@property (nonatomic, strong) UIButton *callButton;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UIView *callWillContentView;

@property (nonatomic, strong) UIView *callingContentView;
@property (nonatomic, strong) UIButton *fooButton;


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
        check = YES;
        self.frame = CGRectMake(0, 0, 340, 435);
        [self backgroundConfig];
        [self backButtonConfig];
        [self numberLabelConfig];
        [self callButtonConfig];
        [self keyboardConfig];
        
        [self backgroundConfigCalling];
        [self numberLabeladd];
        [self fooButtonConfig];
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
    _keyboardImageView.frame = CGRectMake(-25, 435 - size.height - self.callButton.frame.size.height - 10, size.width, size.height);
    _keyboardImageView.userInteractionEnabled = YES;
    [self.callWillContentView addSubview:_keyboardImageView];
    
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
    self.numberLabel.frame = CGRectMake(10, self.backButton.frame.origin.y - 10, self.contentView.bounds.size.width - self.backButton.bounds.size.width - 45,self.backButton.frame.size.height + 20);
//    self.numberLabel.backgroundColor = [UIColor redColor];
    self.numberLabel.textColor = [UIColor whiteColor];
    self.numberLabel.font = [UIFont fontWithName:@"GEELY Narrow regular 20151114" size:21];
    self.numberLabel.textAlignment = NSTextAlignmentRight;
    self.numberLabel.text = @"";
    [self.callWillContentView addSubview:self.numberLabel];
}

- (void)backButtonConfig {
    UIImage *backImage = [UIImage imageNamed:@"keyboard_back@2x.jpg"];
    CGFloat width = backImage.size.width;
    CGFloat height = backImage.size.height;
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backButton.frame = CGRectMake(self.contentView.bounds.size.width - width-25 , 100, width, height);
    [self.backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.callWillContentView addSubview:self.backButton];
    
    UIImage *rightImage = [UIImage imageNamed:@"组-2123geelyslidecallwillright"];
    CGFloat width1 = rightImage.size.width;
    CGFloat height1 = rightImage.size.height;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:rightImage];
    imageView.frame = CGRectMake(self.contentView.bounds.size.width-width1, (435 - height1)/2-14, width1, height1);
    imageView.userInteractionEnabled = YES;
    [self.callWillContentView addSubview:imageView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.contentView.bounds.size.width-width1, (435 - height1)/2-14, width1, height1);
//    [btn setBackgroundImage:rightImage forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor redColor];
    [self.callWillContentView addSubview:btn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoFrequentContacts:)];
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gotoFrequentContacts:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [btn addGestureRecognizer:tap];
    [btn addGestureRecognizer:swipe];
    [tap requireGestureRecognizerToFail:swipe];
    
//    [btn addTarget:self action:@selector(gotoFrequentContacts:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark 切换到常用联系人
-(void)gotoFrequentContacts:(UIGestureRecognizer *)btn {
    if ([self.delegate respondsToSelector:@selector(frequentContactsButtonClicked)]&&self.delegate) {
        [self.delegate frequentContactsButtonClicked];
    }
}

- (void)backgroundConfig {
    
    self.callingContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 340, 435)];
    self.callingContentView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.callingContentView];
    self.callingContentView.hidden = YES;
    
    self.callWillContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 340, 435)];
    self.callWillContentView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.callWillContentView];
    self.callWillContentView.hidden = NO;
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
    self.callButton.frame = CGRectMake((self.frame.size.width - width) / 2-15, self.frame.size.height - height - 10, width, height);
    
    [self.callButton setBackgroundImage:callImage forState:UIControlStateNormal];
    [self.callButton addTarget:self action:@selector(callButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.callWillContentView addSubview:self.callButton];
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
    
    if ([self.numberLabel.text length] %5==0 && [self.numberLabel.text length]>2) {
        self.numberLabel.text = [NSString stringWithFormat:@"%@%@ ", self.numberLabel.text, indexString];
    }else{
        self.numberLabel.text = [NSString stringWithFormat:@"%@%@", self.numberLabel.text, indexString];
    }
    
    label_num.text = self.numberLabel.text;
}


- (void)callButtonClicked:(UIButton *)sender {
//    NSLog(@"拨号");
//    [self.delegate cellPhoneViewButtonClicked:self.callButton];
    
    if (check) {
        self.callWillContentView.hidden = YES;
        self.callingContentView.hidden = NO;
        check =!check;
    }
}

- (void)backButtonClicked:(UIButton *)sender {
    if (self.numberLabel.text.length == 0) {
        return;
    }
    
    NSRange range = {0, self.numberLabel.text.length - 1};
    NSString *string = [self.numberLabel.text substringWithRange:range];
    self.numberLabel.text = string;
    
}


#pragma mark 正在拨号
- (void)backgroundConfigCalling {
    self.backgroundImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(-15, 0, 340, 435)];
    self.backgroundImageView1.image = [UIImage imageNamed:@"多功能卡片calling_bg"];
    self.backgroundImageView1.userInteractionEnabled = YES;
    [self.callingContentView addSubview:self.backgroundImageView1];
}

- (void)fooButtonClicked:(UIButton *)sender {
    NSLog(@"挂断");
    if (!check) {
        self.callingContentView.hidden = YES;
        self.callWillContentView.hidden = NO;
        check = !check;
    }
}

- (void)numberLabeladd {
   
    label_num = [[UILabel alloc] init];
    label_num.frame = CGRectMake(-15, 130, self.bounds.size.width, 50);
    label_num.textAlignment = NSTextAlignmentCenter;
    label_num.textColor = [UIColor whiteColor];
    label_num.font = [UIFont fontWithName:@"GEELY Narrow regular 20151114" size:21];

    [self.callingContentView addSubview:label_num];
}

- (void)fooButtonConfig {
    self.fooButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.fooButton.frame = CGRectMake(0, 435 - 60, 340, 60);
    [self.fooButton addTarget:self action:@selector(fooButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.fooButton.backgroundColor = [UIColor clearColor];
    
    [self.callingContentView addSubview:self.fooButton];
    
}


@end
