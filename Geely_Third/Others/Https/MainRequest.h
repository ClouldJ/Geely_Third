//
//  MainRequest.h
//  Request
//
//  Created by haigui on 16/10/25.
//  Copyright © 2016年 haigui. All rights reserved.
//

#import "HGRequest.h"
#import "HGBaseRequest+Response.h"
#import "Music.h"
#import "Radio.h"
#import "Phone.h"
#import "Voice.h"
#import "Volume.h"
#import "Mute.h"

/*
 eg:
 Music *music = [[Music alloc] init];
 music.id = @"123";
 music.name = @"hahahahahahah";
 
 Radio *radio = [[Radio alloc] init];
 radio.id = @"151515";
 radio.type = @1;
 
 
 _mainRequest = [[MainRequest alloc] init];
 _mainRequest.requestMusic = music;
 _mainRequest.requestRadio = radio;
 
 [_mainRequest startWithBlockSuccess:^(MainRequest *request) {
 NSLog(@"%@", request.responseJSONObject);
 } failure:^(MainRequest *request, NSError *error) {
 
 }];
 
 */
@interface MainRequest : HGRequest

@property (nonatomic, strong) Music *requestMusic;
@property (nonatomic, strong) Music *responseMusic;

@property (nonatomic, strong) Radio *requestRadio;
@property (nonatomic, strong) Radio *responseRadio;

@property (nonatomic, strong) Phone *requestPhone;
@property (nonatomic, strong) Phone *responsePhone;

@property (nonatomic, strong) Mute *requestMute;
@property (nonatomic, strong) Mute *responseMute;

@property (nonatomic, strong) Voice *requestVoice;
@property (nonatomic, strong) Voice *responseVoice;

@property (nonatomic, strong) Volume *requestVolume;
@property (nonatomic, strong) Volume *responseVolume;


@end
