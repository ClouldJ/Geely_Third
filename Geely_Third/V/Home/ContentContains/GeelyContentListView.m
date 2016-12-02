//
//  GeelyContentListView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyContentListView.h"

#import "UIView+StrBounds.h"
#define RGBAAAA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

typedef enum {
    Left,
    Center,
    Right
}ButtonType;

@interface GeelyCustomPromptView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UILabel *label;
@end

@implementation GeelyCustomPromptView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.title = @"任意门开启锁车报警";
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, ([self getHeightValueWith:self.title andFont:17] - 10)/2, 1.5, 10)];
        imageView.image = [UIImage imageNamed:@"Geely_Custom_btnprompt"];
        [self addSubview:imageView];
        
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(6, 0, [self getWidthValueWith:self.title andFont:17], [self getHeightValueWith:self.title andFont:17])];
        self.label.text = self.title;
        self.label.font = [UIFont fontWithName:@"Noto Sans CJK SC Regular" size:16];
        self.label.textColor = [UIColor whiteColor];
        [self addSubview:self.label];
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.label.frame.size.width+6, self.label.frame.size.height);
    }
    return self;
}

@end

@interface GeelyContentCustomButton : UIView

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, assign) ButtonType type;

@property (nonatomic, strong) GeelyCustomPromptView *topView;

//-(instancetype)initWithCustomType:(ButtonType)type andFrame:(CGRect)frame;
@end

@implementation GeelyContentCustomButton

-(instancetype)initWithCustomType:(ButtonType)type andFrame:(CGRect)frame direction:(NSInteger)index{
    if (self = [super initWithFrame:frame]) {
        [self loadSubViewsWith:type direction:index];
    }
    return self;
}

-(void)loadSubViewsWith:(ButtonType)type direction:(NSInteger)index{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 5, self.frame.size.width, 5)];
    imageView.image = [UIImage imageNamed:@"Geely_Custom_btnbottom"];
    [self addSubview:imageView];
    NSString *str = @"任意门开启锁车报警";
    switch (type) {
        case Left:
        {
            self.topView = [[GeelyCustomPromptView alloc] initWithFrame:CGRectMake(self.frame.size.width-[self getWidthValueWith:str andFont:17], 0, 100, 100)];
        }
            break;
        case Center:
        {
            self.topView = [[GeelyCustomPromptView alloc] initWithFrame:CGRectMake((self.frame.size.width - [self getWidthValueWith:str andFont:17]-6)/2, 0, 100, 100)];
        }
            break;
        case Right:
        {
            self.topView = [[GeelyCustomPromptView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        }
            break;
        default:
            break;
    }
    self.topView.title = str;
    [self addSubview:self.topView];
    
}

@end

@interface GeelyContentListView () {
    GeelyContentCustomButton *customBtn;
}

@end

@implementation GeelyContentListView


-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat w = (self.frame.size.width - 220)/3;
        
        for (int i = 0; i<9; i++) {
            if (i%3 == 0) {
                customBtn = [[GeelyContentCustomButton alloc] initWithCustomType:Left andFrame:CGRectMake(55+(i%3)*30+(i%3)*w, (100+(i/3)*(50+50))*(2620/1920), w, 25) direction:i];
//                customBtn.backgroundColor = [UIColor redColor];
            }else if (i%3 == 1) {
                customBtn = [[GeelyContentCustomButton alloc] initWithCustomType:Center andFrame:CGRectMake(85+(i%3)*30+(i%3)*w, (100+(i/3)*(50+50))*(2620/1920), w, 25) direction:i];
//                customBtn.backgroundColor = [UIColor greenColor];
            }else if (i%3 == 2) {
                customBtn = [[GeelyContentCustomButton alloc] initWithCustomType:Right andFrame:CGRectMake(85+(i%3)*30+(i%3)*w, (100+(i/3)*(50+50))*(2620/1920), w, 25) direction:i];
//                customBtn.backgroundColor = [UIColor blueColor];
            }else{
                
            }
            
            switch (i) {
                case 0:
                    customBtn.topView.label.textColor = RGBAAAA(219, 191, 126, 1);
                    break;
                case 4:
                    customBtn.topView.label.textColor = RGBAAAA(219, 191, 126, 1);
                    break;
                case 8:
                    customBtn.topView.label.textColor = RGBAAAA(219, 191, 126, 1);
                    break;
                default:
                    customBtn.topView.label.textColor = [UIColor lightGrayColor];
                    break;
            }
            
            [self addSubview:customBtn];
        }
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
