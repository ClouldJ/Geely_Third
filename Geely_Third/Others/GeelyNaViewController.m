//
//  GeelyNaViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/25.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyNaViewController.h"
#import "MainRequest.h"

#import "GeelyNoVoliceView.h"
#import "GeelyNo.h"
#import "GeelyScreenView.h"

@interface GeelyNaViewController () {
    MainRequest *request;
    NSTimer *timer;
    GeelyNoVoliceView *noVolce;
    GeelyNo *NONONONO;
    NSInteger screenIndex;
    GeelyScreenView *screenView;
}

@end

@implementation GeelyNaViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopAction) name:URLSTOP object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statAction) name:urlstart object:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:urlstart object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:URLSTOP object:nil];
}
-(void)statAction{
    [timer setFireDate:[NSDate date]];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    screenIndex = 0;
}

-(void)stopAction {
    [timer setFireDate:[NSDate distantFuture]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [SingleModel sharedInstance].index_cellImage = 6;
    [SingleModel sharedInstance].isDisplay = NO;
    [SingleModel sharedInstance].displayType = GOLD;
    noVolce = [[GeelyNoVoliceView alloc] initWithFrame:CGRectMake(0, 0, WWWWWWWWWWW, HHHHHHHHHHH)];
    NONONONO = [[GeelyNo alloc] initWithFrame:CGRectMake(0, 0, WWWWWWWWWWW, HHHHHHHHHHH)];
    request = [[MainRequest alloc] init];
    [SingleModel sharedInstance].isMusic = NO;
   timer =  [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(urlAction) userInfo:nil repeats:YES];
    
    
    
    // Do any additional setup after loading the view.
}



-(void)urlAction {
    screenIndex +=1;
    
//    if (screenIndex == 3) {
//        NSLog(@"该显示了");
//        screenView = [[GeelyScreenView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        [screenView showAnimate];
//    }
//    
    [request startWithBlockSuccess:^(MainRequest *request) {
        [SingleModel sharedInstance].currentRequest = request;
        NSDictionary *dic = (NSDictionary *)request.responseJSONObject;
//        NSLog(@"数据接收状态:%@",dic);
        if ([dic[@"data"][@"volume"][@"type"] integerValue] == 0) {
            if (!noVolce.did) {
                [noVolce showAnimation];
            }

        }else if([dic[@"data"][@"volume"][@"type"] integerValue] == 1){
            noVolce.did = NO;
        }
        
        if (request.responseMute) {
            [SingleModel sharedInstance].muteSingle = request.responseMute;
        }
        
        if (request.responseCar) {
            [SingleModel sharedInstance].carSingle = request.responseCar;
        }
        
        if ([dic[@"data"][@"voice"][@"type"] integerValue] == 1) {
            [NONONONO sssShowAnimate];
        }else if ([dic[@"data"][@"voice"][@"type"] integerValue] == 0) {
            [NONONONO dismisss];
        }
        
        if ([request.responseCar.state integerValue] == 1 && [request.responseCar.state integerValue]!=[SingleModel sharedInstance].carState) {
            
            [SingleModel sharedInstance].carState = [request.responseCar.state integerValue];
            [[NSNotificationCenter defaultCenter] postNotificationName:MODE_GOLD object:nil];
        }else if ([request.responseCar.state integerValue] == 2 && [request.responseCar.state integerValue]!=[SingleModel sharedInstance].carState) {
            [SingleModel sharedInstance].carState = [request.responseCar.state integerValue];

            [[NSNotificationCenter defaultCenter] postNotificationName:MODE_RED object:nil];
        }else if ([request.responseCar.state integerValue] == 3 && [request.responseCar.state integerValue]!=[SingleModel sharedInstance].carState) {
            [SingleModel sharedInstance].carState = [request.responseCar.state integerValue];

            [[NSNotificationCenter defaultCenter] postNotificationName:MODE_BLUE object:nil];
        }else{
            NSLog(@"没有此驾驶模式");
        }
        
    } failure:^(__kindof HGBaseRequest *request, NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
