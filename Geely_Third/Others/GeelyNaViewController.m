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
#import "ImageIconModel.h"

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

-(void)asyncAddImageData {
    
    [SingleModel sharedInstance].image_level_one = [NSMutableArray array];
    [SingleModel sharedInstance].image_level_two = [NSMutableArray array];
    [SingleModel sharedInstance].image_level_three = [NSMutableArray array];
    [SingleModel sharedInstance].image_level_four = [NSMutableArray array];
    [SingleModel sharedInstance].image_level_five = [NSMutableArray array];
    [SingleModel sharedInstance].image_level_six = [NSMutableArray array];
    [SingleModel sharedInstance].image_level_seven = [NSMutableArray array];
    [SingleModel sharedInstance].image_level_eight = [NSMutableArray array];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (int i = 0; i<76; i++) {
        dispatch_async(queue, ^{
            if (i<10) {
                
                UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"一级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_one addObject:image1];
                
                UIImage *image2 = [UIImage imageNamed:[NSString stringWithFormat:@"二级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_two addObject:image2];
                
                UIImage *image3 = [UIImage imageNamed:[NSString stringWithFormat:@"三级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_three addObject:image3];
                
                UIImage *image4 = [UIImage imageNamed:[NSString stringWithFormat:@"四级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_four addObject:image4];
                
                UIImage *image5 = [UIImage imageNamed:[NSString stringWithFormat:@"五级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_five addObject:image5];
                
                UIImage *image6 = [UIImage imageNamed:[NSString stringWithFormat:@"六级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_six addObject:image6];
                
                UIImage *image7 = [UIImage imageNamed:[NSString stringWithFormat:@"七级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_seven addObject:image7];
                
                UIImage *image8 = [UIImage imageNamed:[NSString stringWithFormat:@"八级_0000%d",i]];
                [[SingleModel sharedInstance].image_level_eight addObject:image8];
                
            }else{
                UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"一级_000%d",i]];
                [[SingleModel sharedInstance].image_level_one addObject:image1];
                
                UIImage *image2 = [UIImage imageNamed:[NSString stringWithFormat:@"二级_000%d",i]];
                [[SingleModel sharedInstance].image_level_two addObject:image2];
                
                UIImage *image3 = [UIImage imageNamed:[NSString stringWithFormat:@"三级_000%d",i]];
                [[SingleModel sharedInstance].image_level_three addObject:image3];
                
                UIImage *image4 = [UIImage imageNamed:[NSString stringWithFormat:@"四级_000%d",i]];
                [[SingleModel sharedInstance].image_level_four addObject:image4];
                
                UIImage *image5 = [UIImage imageNamed:[NSString stringWithFormat:@"五级_000%d",i]];
                [[SingleModel sharedInstance].image_level_five addObject:image5];
                
                UIImage *image6 = [UIImage imageNamed:[NSString stringWithFormat:@"六级_000%d",i]];
                [[SingleModel sharedInstance].image_level_six addObject:image6];
                
                UIImage *image7 = [UIImage imageNamed:[NSString stringWithFormat:@"七级_000%d",i]];
                [[SingleModel sharedInstance].image_level_seven addObject:image7];
                
                UIImage *image8 = [UIImage imageNamed:[NSString stringWithFormat:@"八级_000%d",i]];
                [[SingleModel sharedInstance].image_level_eight addObject:image8];
                
            }
        });
    }
    
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
    
    //初始化设置侧边栏icon需要的数据
    
    ImageIconModel *model1 = [[ImageIconModel alloc] init];
    ImageIconModel *model2 = [[ImageIconModel alloc] init];
    ImageIconModel *model3 = [[ImageIconModel alloc] init];
    ImageIconModel *model4 = [[ImageIconModel alloc] init];
    
    model1.tag = 1;
    model1.imageName = @"WIFIicon";
    
    model2.tag = 2;
    model2.imageName = @"手机信号icon";
    
    model3.tag = 3;
    model3.imageName = @"手机电量icon";
    
    model4.tag = 4;
    model4.imageName = @"行车记录仪icon";

    
    [SingleModel sharedInstance].iconDataArr = [NSMutableArray array];
    [SingleModel sharedInstance].iconData_Image = [NSMutableArray arrayWithObjects:model1,model2,model3,model4, nil];
    [SingleModel sharedInstance].iconIndexArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    // Do any additional setup after loading the view.
    
    
//    [self asyncAddImageData];
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
//            NSLog(@"没有此驾驶模式");
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
