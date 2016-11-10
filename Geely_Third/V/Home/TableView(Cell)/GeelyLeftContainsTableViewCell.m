//
//  GeelyLeftContainsTableViewCell.m
//  Geely_Third
//
//  Created by WillyZhao on 16/9/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyLeftContainsTableViewCell.h"
static NSInteger i = 0;
@implementation GeelyLeftContainsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    
//    self.imageView_ = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (((636*2048)/1440)/6)/3, (((636*2048)/1440)/6)/3)];
//    self.imageView_.center = self.center;
//    self.imageView_.backgroundColor = [UIColor redColor];
//    [self addSubview:self.imageView_];
//    
    // Initialization code
    self.imageView_.contentMode = UIViewContentModeScaleAspectFit;
//    [self.imageView_ setNeedsLayout];
//    [self.imageView_ layoutIfNeeded];
    

    
    self.topImageView_.hidden = YES;
    
    self.tap_one = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneAction:)];
    self.tap_one.numberOfTapsRequired = 1;
    [self addGestureRecognizer:self.tap_one];
    
    self.swe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiAction:)];
    self.swe.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:self.swe];
    
    UITapGestureRecognizer *tap_sec = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(secAction:)];
    tap_sec.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tap_sec];
    
    
    [self.tap_one requireGestureRecognizerToFail:tap_sec];
    i+=1;
}

-(void)oneAction:(UITapGestureRecognizer *)tap {
    
    if ([self.delegate respondsToSelector:@selector(cellSecTapGesture:touchCell:)]&&self.delegate) {
        [self.delegate cellSecTapGesture:tap touchCell:self];
    }
    
}

-(void)swiAction:(UISwipeGestureRecognizer *)swi{
    if ([self.delegate respondsToSelector:@selector(cellOneTapGesture:touchCell:)]&&self.delegate) {
        [self.delegate cellOneTapGesture:nil touchCell:self];
    }
}

-(void)secAction:(UITapGestureRecognizer *)tap {

//    if (self.indexPathCell.row == [SingleModel sharedInstance].indexPathHome.row) {
//        return;
//    }
    
    if ([self.delegate respondsToSelector:@selector(cellOneTapGesture:touchCell:)]&&self.delegate) {
        [self.delegate cellOneTapGesture:tap touchCell:self];
    }
}

-(void)cellForIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 0||indexPath.row == 4) {
        self.status.hidden = YES;
//    }
    if ([SingleModel sharedInstance].indexPathHome !=nil) {
        if (indexPath.row == [SingleModel sharedInstance].indexPathHome.row) {
            switch (indexPath.row) {
                case 0:
                    self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_na"];
                    break;
                case 1:
                    self.imageView_.image = [UIImage imageNamed:@"娱乐sGeely"];
                    break;
                case 2:
                    self.imageView_.image = [UIImage imageNamed:@"电话sGeely"];
                    break;
                case 3:
                    self.imageView_.image = [UIImage imageNamed:@"设置sGeely"];
                    break;
                case 4:
                    self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_home"];
                    break;
                default:
                    break;
            }
        }else{
            switch (indexPath.row) {
                case 0:
                    self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_na"];
                    break;
                case 1:
                    self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_funy"];
                    break;
                case 2:
                    self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_phone"];
                    break;
                case 3:
                    self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_setting"];
                    break;
                case 4:
                    self.imageView_.image = [UIImage imageNamed:@"首页sGeely"];
                    break;
                default:
                    break;
            }
        }
    }else{
        switch (indexPath.row) {
            case 0:
                self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_na"];
                break;
            case 1:
                self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_funy"];
                break;
            case 2:
                self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_phone"];
                break;
            case 3:
                self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_setting"];
                break;
            case 4:
                self.imageView_.image = [UIImage imageNamed:@"Geely_home_left_home"];
                break;
            default:
                break;
        }
    }
    NSLog(@"11");
}

-(void)setDidClicked:(BOOL)didClicked {
    
//    if (didClicked) {
//        if (self.indexPathCell.row == [SingleModel sharedInstance].indexPathHome.row) {
//            NSLog(@"双击的cell与单击的cell一致，不做处理");
//            return;
//        }else{
//            NSLog(@"双击的cell与单击的cell不一致，做处理");
//            [self switchIndexPath:self.indexPathCell bingo:didClicked];
//        }
//    }else{
//        if (self.indexPathCell.row == [SingleModel sharedInstance].indexPathHome.row) {
//            NSLog(@"未双击的cell与单击的cell一致，不做处理");
//        }else{
//            NSLog(@"未双击的cell与单击的cell不一致，做处理");
//            [self switchIndexPath:self.indexPathCell bingo:didClicked];
//        }
//    }
    
    if (self.indexPathCell.row == [SingleModel sharedInstance].indexPathHome.row) {
        
    }else{
        if (self.indexPathCell.row == 0||self.indexPathCell.row == 4) {
            
        }else{
            self.status.hidden = !didClicked;
        }
    }
    
}

-(void)switchIndexPath:(NSIndexPath *)indexPath bingo:(BOOL)bingo{
    if (indexPath.row == 0||indexPath.row == 4) {
        
    }else{
        self.status.hidden = bingo;
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
