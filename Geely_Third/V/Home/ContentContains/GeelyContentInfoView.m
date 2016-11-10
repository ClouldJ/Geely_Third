//
//  GeelyContentInfoView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyContentInfoView.h"
#import "GeelyHomeContentbuttons.h"

@implementation GeelyContentInfoView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(80*(2732/1920), 54*(2732/1920), (268/2)*(2732/1920), (203/2)*(2732/1920))];
    imageView.image = [UIImage imageNamed:@"Geely_home_sun"];
    [self addSubview:imageView];
    imageView.hidden = YES;
    
    UILabel *promptLabel = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.origin.x+imageView.frame.size.width+10, imageView.frame.origin.y, 120, 15)];
    promptLabel.textColor = [UIColor lightGrayColor];
    promptLabel.text = @"更新于一小时前";
    promptLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:promptLabel];
    promptLabel.hidden = YES;
    
    UIImageView *imageView_sun = [[UIImageView alloc] initWithFrame:CGRectMake(80, 55, 697/2, 236/2)];
    imageView_sun.image = [UIImage imageNamed:@"天气信息geelyhome"];
    imageView_sun.userInteractionEnabled = YES;
    [self addSubview:imageView_sun];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [imageView_sun addGestureRecognizer:tap];
    
//    UILabel *temperatureLabel = [UILabel alloc] initWithFrame:CGRectMake(promptLabel.frame.origin.x, promptLabel.frame.origin.y+promptLabel.frame.size.height+20, <#CGFloat width#>, <#CGFloat height#>)
    
//    UIButton *siriBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    siriBtn.frame = CGRectMake(85+25, imageView.frame.origin.y+imageView.frame.size.height+210*(2732/1920)-80, (215/2)*(2732/1920), (130/2)*(2732/1920));
//    [siriBtn setBackgroundImage:[UIImage imageNamed:@"Geely_home_conten_siri"] forState:UIControlStateNormal];
//    [self addSubview:siriBtn];
//    
//    UIButton *fmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    fmBtn.frame = CGRectMake(siriBtn.frame.origin.x+siriBtn.frame.size.width+30, siriBtn.frame.origin.y, (215/2)*(2732/1920), (130/2)*(2732/1920));
//    [fmBtn setBackgroundImage:[UIImage imageNamed:@"Geely_home_content_fm"] forState:UIControlStateNormal];
//    [self addSubview:fmBtn];
//    
//    UIButton *recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    recordBtn.frame = CGRectMake(fmBtn.frame.origin.x+fmBtn.frame.size.width+30, fmBtn.frame.origin.y+5, (215/2)*(2732/1920), (130/2)*(2732/1920));
//    [recordBtn setBackgroundImage:[UIImage imageNamed:@"Geely_home_content_record"] forState:UIControlStateNormal];
//    [self addSubview:recordBtn];
//    
//    UIButton *carPlayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [carPlayBtn setBackgroundImage:[UIImage imageNamed:@"Geely_home_content_cayplay"] forState:UIControlStateNormal];
//    carPlayBtn.frame = CGRectMake(recordBtn.frame.origin.x+recordBtn.frame.size.width+30, recordBtn.frame.origin.y, (215/2)*(2732/1920), (130/2)*(2732/1920));
//    [self addSubview:carPlayBtn];
//    
//    UIButton *musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    musicBtn.frame = CGRectMake(carPlayBtn.frame.origin.x+carPlayBtn.frame.size.width+30, carPlayBtn.frame.origin.y, (215/2)*(2732/1920), (130/2)*(2732/1920));
//    [musicBtn setBackgroundImage:[UIImage imageNamed:@"Geely_home_content_music"] forState:UIControlStateNormal];
//    [self addSubview:musicBtn];
    
    
    GeelyHomeContentbuttons *imageView_btn = [[GeelyHomeContentbuttons alloc] initWithFrame:CGRectMake(50, self.frame.size.height-357/2+30, 1605/2, 357/2)];
    imageView_btn.userInteractionEnabled = YES;
    [self addSubview:imageView_btn];
    
}

-(void)tapAction:(UITapGestureRecognizer *)tap {
    if ([self.delegate respondsToSelector:@selector(theWeatherClicked:)]&&self.delegate) {
        [self.delegate theWeatherClicked:self];
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
