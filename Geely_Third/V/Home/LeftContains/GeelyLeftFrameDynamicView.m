//
//  GeelyLeftFrameDynamicView.m
//  Geely_Third
//
//  Created by WillyZhao on 2016/11/17.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyLeftFrameDynamicView.h"

@interface GeelyLeftFrameDynamicView () <UITableViewDelegate,UITableViewDataSource> {
    
}

@end

@implementation GeelyLeftFrameDynamicView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}


-(void)startAnimationViewStyle:(GeelyDynamicViewStyle)style finish:(GeelyDynamicFinish)finish{
    self.style = style;
    
    switch (self.style) {
        case DYNAMIC_MUSIC:
        {
            //音乐
            UIView *vc = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 435)];
            vc.backgroundColor = [UIColor redColor];
            [self addSubview:vc];
            [self animationView:vc finish:finish];
            
        }
            break;
        case DYNAMIC_RADIO:
        {
            //电台
        }
            break;
        case DYNAMIC_CALLZ:
        {
            //输入电话
            UIView *vd = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 435)];
            vd.backgroundColor = [UIColor greenColor];
            [self addSubview:vd];
            [self animationView:vd finish:finish];
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
            UIView *vf = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 435)];
            vf.backgroundColor = [UIColor blueColor];
            [self addSubview:vf];
            [self animationView:vf finish:finish];
        }
            break;
        default:
            break;
    }
    
}

-(void)animationView:(UIView *)view finish:(GeelyDynamicFinishView)finish{
    [UIView animateWithDuration:.5f animations:^{
        //todo
        view.frame = CGRectMake(0, 0, 340, 435);
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 340, 435);
    } completion:^(BOOL finished) {
        if (self.currentView) {
            [self.currentView removeFromSuperview];
            self.currentView = nil;
        }
        self.currentView = view;
        finish(self.currentView);
    }];
}



-(void)dismissAnimationView:(UIView *)animaView animationFinish:(GeelyDynamicFinish)finish {
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
