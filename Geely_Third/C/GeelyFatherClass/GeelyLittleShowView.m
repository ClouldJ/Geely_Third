//
//  GeelyLittleShowView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/9.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyLittleShowView.h"

#import "GeelyMusicLittleView.h"
#import "UIScrollView+AnimationOffSet.h"

#import "GeelyPhoneInputView.h"
#import "GeelyPhoneCalledView.h"
#import "GeelyCalledListView.h"
#import "GeelyLittleSettingAView.h"

@interface GeelyLittleShowView () <GeelyMusicLittleViewDelegate,GeelyPhoneCalledViewDelegate,GeelyPhoneInputViewDelegate> {
    GeelyMusicLittleView *musica;
    AVAudioPlayer *acPlayer;
    MainRequest *mainRequest;
    BOOL listOrNo;
}

@end

@implementation GeelyLittleShowView



-(void)addScrollView {
    
    mainRequest = [[MainRequest alloc] init];
    mainRequest.requestVolume = [[Volume alloc] init];
    mainRequest.requestVoice = [[Voice alloc] init];
    mainRequest.requestPhone = [[Phone alloc] init];
    mainRequest.requestMusic = [[Music alloc] init];
    mainRequest.requestRadio = [[Radio alloc] init];
    mainRequest.requestMute = [[Mute alloc] init];
    
    listOrNo = YES;
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 435)];
    self.contentScrollView.backgroundColor = [UIColor clearColor];
    self.contentScrollView.pagingEnabled = YES;
    [self addSubview:self.contentScrollView];
    
    
    //添加各种视图到视图中
    //music
    musica = [[GeelyMusicLittleView alloc] initWithFrame:CGRectMake(0, 0, 340, 435)];
    musica.delegate = self;
    [self.contentScrollView addSubview:musica];
    
    //media
    media = [[GeelyMediaLittleView alloc] initWithFrame:CGRectMake(0, 435, 340, 435)];
    media.block = ^(){
        [acPlayer play];
        [self.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 0)];
        [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
        
        mainRequest.requestMusic.type = @1;
        mainRequest.requestPhone.type = @0;
        mainRequest.requestVoice.type = @0;
        mainRequest.requestRadio.type = @0;
        mainRequest.requestVolume.type = @1;
        mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
        
        
        [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        } failure:^(__kindof HGBaseRequest *request, NSError *error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
        }];
        
    };
    [self.contentScrollView addSubview:media];
    
    //电话输入
    //给侧面弹出视图添加view
    GeelyPhoneInputView *phoneInputView = [[GeelyPhoneInputView alloc] initWithFrame:CGRectMake(0, 435*2, 340, 435)];
    phoneInputView.backgroundColor = [UIColor clearColor];
    phoneInputView.delegate = self;
    [self.contentScrollView addSubview:phoneInputView];
    
    //联系人
    GeelyCalledListView *calledList = [[GeelyCalledListView alloc] initWithFrame:CGRectMake(0, 435*4, 340, 435)];
    [self.contentScrollView addSubview:calledList];
    
    //setting
    //setting
    GeelyLittleSettingAView *setting = [[GeelyLittleSettingAView alloc] initWithFrame:CGRectMake(0, 435*5, 340, 435)];
    [self.contentScrollView addSubview:setting];
    
}


#pragma mark GeelyMusicLittleViewDelegate
-(void)didSwitch:(GeelyMusicLittleView *)view {
    NSLog(@"点击了选择音乐");
    [self.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 435)];
    [media startAnimation];
}

#pragma mark GeelyPhoneInputViewDelegate
-(void)calledPhone:(NSString *)str {
    GeelyPhoneCalledView *vc = [[GeelyPhoneCalledView alloc] initWithFrame:CGRectMake(0, 435*3, 340, 435) andPhone:str];
    vc.delegate = self;
    [self.contentScrollView addSubview:vc];
    
    [self.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 435*3)];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
    mainRequest.requestRadio.type = @0;
    mainRequest.requestPhone.type = @2;
    mainRequest.requestMusic.type = @0;
    mainRequest.requestVoice.type = @0;
    mainRequest.requestVolume.type = @1;
    mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
    
    [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    }];
    
}

-(void)listBtnClicked:(GeelyPhoneInputView *)inputView {
    if (listOrNo) {
        [self.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 435*4)];
        listOrNo = !listOrNo;
    }else{
        [self.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 435*2)];
        listOrNo = !listOrNo;
    }
}

#pragma mark GeelyPhoneCalledViewDelegate
-(void)calledEnd {
    
    [self.contentScrollView scrollAnimationToOffSet:CGPointMake(0, 435*2)];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:URLSTOP object:nil];
    mainRequest.requestRadio.type = @0;
    mainRequest.requestPhone.type = @0;
    mainRequest.requestMusic.type = @0;
    mainRequest.requestVoice.type = @0;
    mainRequest.requestVolume.type = @1;
    mainRequest.requestMute = [SingleModel sharedInstance].muteSingle;
    
    [mainRequest startWithBlockSuccess:^(__kindof HGBaseRequest *request) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        [[NSNotificationCenter defaultCenter] postNotificationName:urlstart object:nil];
    }];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
