//
//  GeelySildeBarView.m
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/21.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelySildeBarView.h"

#import "GeelySlideSettingCell.h"


@interface GeelySildeBarView () <UITableViewDelegate,UITableViewDataSource,GeelyMusicCDAnimationViewDelegate> {
    NSMutableArray *images;
    BOOL FMAM;
}

@end

@implementation GeelySildeBarView

-(instancetype)initWithFrame:(CGRect)frame customStyle:(GeelyDynamicViewStyle)style {
    if (self = [super initWithFrame:frame]) {
        [self loadSubViewStyle:style];
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)loadSubViewStyle:(GeelyDynamicViewStyle)style {
    
    FMAM = NO;
    
    self.bg_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 435)];
    self.bg_imageView.backgroundColor = [UIColor clearColor];
    self.bg_imageView.userInteractionEnabled = YES;
    [self addSubview:self.bg_imageView];
    

    UIButton *btn_btn = [[UIButton alloc] initWithFrame:CGRectMake(340-47, 32, 30, 30)];
    btn_btn.backgroundColor = [UIColor clearColor];
    [btn_btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn_btn];
    
    switch (style) {
        case DYNAMIC_SETTZ:
        {
            self.backgroundColor = [UIColor clearColor];
            self.bg_imageView.image = [UIImage imageNamed:@"bg_sildeBar_setting"];
            //设置
            self.setting_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 435-357.5, 0, 357.5)];
            self.setting_tableView.delegate = self;
            self.setting_tableView.dataSource = self;
            self.setting_tableView.scrollEnabled = NO;
            self.setting_tableView.rowHeight = 59.6;
            self.setting_tableView.backgroundColor = [UIColor clearColor];
            self.setting_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            [self.bg_imageView addSubview:self.setting_tableView];
            
            [self.setting_tableView registerNib:[UINib nibWithNibName:@"GeelySlideSettingCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cella"];
            
        }
            break;
        case DYNAMIC_MUSIC:
        {
            self.backgroundColor = [UIColor clearColor];
            self.bg_imageView.image = [UIImage imageNamed:@"bg_sliderBar_music"];
            //音乐
            
            self.image_musciTitle = [[UIImageView alloc] initWithFrame:CGRectMake((340-169)/2-20, 100, 0, 45)];
            self.image_musciTitle.image = [UIImage imageNamed:@"歌名收藏littlemusicg"];
            self.image_musciTitle.contentMode = UIViewContentModeScaleAspectFit;
            [self.bg_imageView addSubview:self.image_musciTitle];
            
            self.store_btn = [[UIButton alloc] initWithFrame:CGRectMake((340-169)/2+160, 97.5, 0, 24.5)];
            self.store_btn.backgroundColor = [UIColor clearColor];
            [self.store_btn setBackgroundImage:[UIImage imageNamed:@"收藏-拷贝-2"] forState:UIControlStateNormal];
            [self.store_btn setBackgroundImage:[UIImage imageNamed:@"收藏-拷贝-2_music"] forState:UIControlStateSelected];
            [self.store_btn addTarget:self action:@selector(storeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.bg_imageView addSubview:self.store_btn];
            
            self.animaeCD = [[GeelyMusicCDAnimationView alloc] initWithFrame:CGRectMake((340-180)/2-15, 170, 180, 180)];
            self.animaeCD.delegate = self;
            self.animaeCD.alpha = 0;
            [self.bg_imageView addSubview:self.animaeCD];
            
            images = [NSMutableArray array];
            for (int i = 0; i<34; i++) {
                if (i<10) {
                    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"中控-电台_0000%d",i]];
                    [images addObject:image];
                }else{
                    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"中控-电台_000%d",i]];
                    [images addObject:image];
                }
            }
            
            self.imageViewradio = [[UIImageView alloc] initWithFrame:CGRectMake((340-180)/2-35, 170, 220, 220)];
            self.imageViewradio.hidden = YES;
            self.imageViewradio.userInteractionEnabled = YES;
            [self.bg_imageView addSubview:self.imageViewradio];
            
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake((340-120)/2+20, 170+180+10, 60, 15)];
            self.timeLabel.textColor = [UIColor lightGrayColor];
            self.timeLabel.font = [UIFont fontWithName:@"GEELY Light 20151114" size:11];
            self.timeLabel.text = @"00:00";
            [self.bg_imageView addSubview:self.timeLabel];
            
            UIButton *titleBtn = [[UIButton alloc] initWithFrame:CGRectMake(90, 30, 115, 38)];
            titleBtn.backgroundColor = [UIColor clearColor];
            [titleBtn addTarget:self action:@selector(titleBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.bg_imageView addSubview:titleBtn];
            
        }
            break;
        case DYNAMIC_CALLZ:
        {
            self.backgroundColor = [UIColor clearColor];
            self.bg_imageView.image = [UIImage imageNamed:@"geely_slidebar_callingbg"];
            
            self.phoneView = [[CellPhoneView alloc] initWithFrame:CGRectMake(0, 0, 0, self.frame.size.height)];
            self.phoneView.backgroundColor = [UIColor clearColor];
            [self.phoneView scrollToCallWillView];
            [self.bg_imageView addSubview:self.phoneView];
        }
            break;
        default:
            break;
    }
}

#pragma mark 音乐电台切换
-(void)titleBtnAction:(UIButton *)btn {
    if (!FMAM) {
        self.bg_imageView.image = [UIImage imageNamed:@"bg_slideBar_radio"];
        self.image_musciTitle.image = [UIImage imageNamed:@"歌名收藏radio_selected"];
        //TODO,操作音乐
        self.animaeCD.hidden = YES;
        self.imageViewradio.hidden = NO;
        self.timeLabel.hidden = YES;
        [self.imageViewradio startImageSequenceWithArray:images repeatCount:100000 duration:1];
        FMAM = YES;
    }else{
        FMAM = NO;
        [self.imageViewradio stopAnimating];
        self.imageViewradio.hidden = YES;
        self.animaeCD.hidden = NO;
        self.timeLabel.hidden = NO;
        self.bg_imageView.image = [UIImage imageNamed:@"bg_sliderBar_music"];
        self.image_musciTitle.image= [UIImage imageNamed:@"歌名收藏littlemusicg"];
    }
}

#pragma mark 收藏按钮事件
-(void)storeBtnAction:(UIButton *)btn {
    btn.selected = !btn.selected;
}

#pragma mark 返回按钮事件
-(void)backAction:(UIButton *)btn {
    [[NSNotificationCenter defaultCenter] postNotificationName:SLIDEDISMISS object:nil];
}

#pragma mark 设置的代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GeelySlideSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cella" forIndexPath:indexPath];
    [cell cellModel:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GeelySlideSettingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.cell_selected = !cell.cell_selected;
    [cell cellReset:indexPath];
}

#pragma mark GeelyMusicCDAnimationViewDelegate
-(float)musicTime {
    return 191;
}

-(void)musciCDAnimationRunning:(GeelyMusicCDAnimationView *)musciView currentPosition:(CGFloat)currenttime {
    self.timeLabel.text = [NSString stringWithFormat:@"%@",[self convertTime:currenttime]];
}

- (NSString *)convertTime:(CGFloat)second{
    NSDate *d = [NSDate dateWithTimeIntervalSince1970:second];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (second/3600 >= 1) {
        [formatter setDateFormat:@"HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"mm:ss"];
    }
    NSString *showtimeNew = [formatter stringFromDate:d];
    return showtimeNew;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
