//
//  GeelyLeftFrameDynamicView.m
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/17.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyLeftFrameDynamicView.h"

#import "GeelySildeBarView.h"
#import "CellPhoneView.h"

@interface GeelyLeftFrameDynamicView () <UITableViewDelegate,GeelySildeBarViewDelegate,UITableViewDataSource> {
    GeelySildeBarView *currentSlide;
}

@end

@implementation GeelyLeftFrameDynamicView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(frameDynamicViewSwipe:)];
        swipe.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:swipe];
        
    }
    return self;
}

#pragma mark 推出的SlideView添加返回手势
-(void)frameDynamicViewSwipe:(UISwipeGestureRecognizer *)swipe {
    [[NSNotificationCenter defaultCenter] postNotificationName:SLIDEDISMISS object:nil];
}


-(void)startAnimationViewStyle:(GeelyDynamicViewStyle)style finish:(GeelyDynamicFinish)finish{
    self.style = style;
    
    switch (self.style) {
        case DYNAMIC_MUSIC:
        {
            //音乐
            GeelySildeBarView *vc = [[GeelySildeBarView alloc] initWithFrame:CGRectMake(0, 0, 0, 435) customStyle:DYNAMIC_MUSIC];
            [self addSubview:vc];
            [self animationView:vc finish:finish style:DYNAMIC_MUSIC];
            
        }
            break;
        case DYNAMIC_RADIO:
        {
            //电台
            GeelySildeBarView *df = [[GeelySildeBarView alloc] initWithFrame:CGRectMake(0, 0, 0, 435) customStyle:DYNAMIC_RADIO];
//            df.delegate = self;
            [self addSubview:df];
            [self animationView:df finish:finish style:DYNAMIC_RADIO];
        }
            break;
        case DYNAMIC_CALLZ:
        {
            //输入电话
            GeelySildeBarView *vd = [[GeelySildeBarView alloc] initWithFrame:CGRectMake(0, 0, 0, 435) customStyle:DYNAMIC_CALLZ];
//            vd.delegate = self;
            [self addSubview:vd];
            [self animationView:vd finish:finish style:DYNAMIC_CALLZ];
        }
            break;
        case DYNAMIC_CALLD:
        {
            //呼出电话
        }
            break;
        case DYNAMIC_CALLL:
        {
            //常用联系人
        }
            break;
        case DYNAMIC_SETTZ:
        {
            //设置
            GeelySildeBarView *vf = [[GeelySildeBarView alloc] initWithFrame:CGRectMake(0, 0, 0, 435) customStyle:DYNAMIC_SETTZ];
//            vf.delegate = self;
            [self addSubview:vf];
            [self animationView:vf finish:finish style:DYNAMIC_SETTZ];
        }
            break;
        default:
            break;
    }
    
}

#pragma mark 设置点击效果
-(void)geelySettingSlideViewSelectedWith:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(didSelectedDynamciSetView:selectedIndex:)]&&self.delegate) {
            }
}

-(void)animationView:(GeelySildeBarView *)view finish:(GeelyDynamicFinishView)finish style:(GeelyDynamicViewStyle)style{
    NSLog(@"1111------------------------:%@",NSStringFromClass([view class]));
    self.currentView.hidden = YES;
    [UIView animateWithDuration:.5f animations:^{
        //todo
        view.frame = CGRectMake(0, 0, 340, 435);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 340, 435);
        view.bg_imageView.frame = CGRectMake(0, 0, 340, 435);
        switch (style) {
            case DYNAMIC_SETTZ:
            {
                //设置动画
                view.setting_tableView.frame = CGRectMake(view.setting_tableView.frame.origin.x, view.setting_tableView.frame.origin.y, 340, view.setting_tableView.frame.size.height);
            }
                break;
            case DYNAMIC_MUSIC:
            {
                view.image_musciTitle.frame = CGRectMake((340-169)/2-20, 100, 169, 45);
                view.store_btn.frame = CGRectMake((340-169)/2+160, 97.5, 26.5, 24.5);
                view.animaeCD.frame = CGRectMake((340-180)/2-15, 170, 180, 180);
                view.animaeCD.alpha = 1;
            }
                break;
            case DYNAMIC_CALLZ:
            {
                view.phoneView.frame = CGRectMake(0, 0, 340, 435);
                view.phoneView.cellPhoneTableView.frame = CGRectMake(0, 0, 340, 435);
            }
                break;
            default:
                break;
        }
    } completion:^(BOOL finished) {
        if (self.currentView) {
            [self.currentView removeFromSuperview];
            self.currentView = nil;
        }
        self.currentView = view;
        finish(self.currentView);
    }];
}

-(void)showAnimationStyle:(GeelyDynamicViewStyle)style finish:(GeelyDynamicFinishView)finish {
    
    if (currentSlide) {
        [currentSlide removeFromSuperview];
        currentSlide = nil;
    }
    
    switch (style) {
        case DYNAMIC_MUSIC:
        {
            GeelySildeBarView *na = [[GeelySildeBarView alloc] initWithFrame:CGRectMake(0, 0, 340, 435) customStyle:DYNAMIC_MUSIC];
            na.backgroundColor = [UIColor clearColor];
            [self addSubview:na];
            currentSlide = na;
//            [SingleModel sharedInstance].dynamicSingleView = na;
        }
            break;
        case DYNAMIC_CALLZ:
        {
            GeelySildeBarView *na1 = [[GeelySildeBarView alloc] initWithFrame:CGRectMake(0, 0, 340, 435) customStyle:DYNAMIC_CALLZ];
            na1.backgroundColor = [UIColor clearColor];
            [self addSubview:na1];
            currentSlide = na1;
//            [SingleModel sharedInstance].dynamicSingleView = na1;
        }
            break;
        case DYNAMIC_SETTZ:
        {
            GeelySildeBarView *na2 = [[GeelySildeBarView alloc] initWithFrame:CGRectMake(0, 0, 340, 435) customStyle:DYNAMIC_SETTZ];
            na2.backgroundColor = [UIColor clearColor];
            [self addSubview:na2];
            currentSlide = na2;

//            [SingleModel sharedInstance].dynamicSingleView = na2;
        }
            break;
        default:
            break;
    }
}

//-(void)showAnimationView:(GeelySildeBarView *)slideView finishBlock:(GeelyDynamicFinishView)finish {
//    [UIView animateWithDuration:.5f animations:^{
//        slideView.frame =
//    } completion:^(BOOL finished) {
//        finish(self);
//    }];
//}

-(void)dismissAnimationView:(UIView *)animaView animationFinish:(GeelyDynamicFinish)finish {
    animaView.hidden = YES;
    [UIView animateWithDuration:.5f animations:^{
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 0, 435);
        animaView.frame = CGRectMake(0, 0, 0, 435);
    } completion:^(BOOL finished) {
        if (finish) {
            finish();
        }
        [animaView removeFromSuperview];
    }];
}

//-(void)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
