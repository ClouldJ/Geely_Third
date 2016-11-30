//
//  AppDelegate.m
//  Geely_Third
//
//  Created by WillyZhao on 16/9/27.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "AppDelegate.h"
#import "GeelyHomeViewController.h"
#import "GeelyNaViewController.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate

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


-(void)actionOne{
    [SingleModel sharedInstance].image_level_one = [NSMutableArray array];
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"一级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_one addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"一级_000%d",i]];
            [[SingleModel sharedInstance].image_level_one addObject:image];
        }
    }
    
    [NSThread detachNewThreadSelector:@selector(actionTwo) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionThree) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionFour) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionFive) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionSix) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionSeven) toTarget:self withObject:nil];
    [NSThread detachNewThreadSelector:@selector(actionEight) toTarget:self withObject:nil];
    
}

-(void)actionTwo{
    [SingleModel sharedInstance].image_level_two = [NSMutableArray array];
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"二级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_two addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"二级_000%d",i]];
            [[SingleModel sharedInstance].image_level_two addObject:image];
        }
    }
}

-(void)actionThree {
    [SingleModel sharedInstance].image_level_three = [NSMutableArray array];
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"三级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_three addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"三级_000%d",i]];
            [[SingleModel sharedInstance].image_level_three addObject:image];
        }
    }
}

-(void)actionFour {
    [SingleModel sharedInstance].image_level_four = [NSMutableArray array];
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"四级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_four addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"四级_000%d",i]];
            [[SingleModel sharedInstance].image_level_four addObject:image];
        }
    }
}

-(void)actionFive {
    [SingleModel sharedInstance].image_level_five = [NSMutableArray array];
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"五级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_five addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"五级_000%d",i]];
            [[SingleModel sharedInstance].image_level_five addObject:image];
        }
    }
}

-(void)actionSix {
    [SingleModel sharedInstance].image_level_six = [NSMutableArray array];
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"六级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_six addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"六级_000%d",i]];
            [[SingleModel sharedInstance].image_level_six addObject:image];
        }
    }
}

-(void)actionSeven {
    [SingleModel sharedInstance].image_level_seven = [NSMutableArray array];
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"七级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_seven addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"七级_000%d",i]];
            [[SingleModel sharedInstance].image_level_seven addObject:image];
        }
    }
}

-(void)actionEight {
    [SingleModel sharedInstance].image_level_eight = [NSMutableArray array];
    for (int i =0; i<76; i++) {
        if (i<10) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"八级_0000%d",i]];
            [[SingleModel sharedInstance].image_level_eight addObject:image];
        }else{
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"八级_000%d",i]];
            [[SingleModel sharedInstance].image_level_eight addObject:image];
        }
    }
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    GeelyHomeViewController *home_vc = [[GeelyHomeViewController alloc] init];
    GeelyNaViewController *na = [[GeelyNaViewController alloc] initWithRootViewController:home_vc];
    self.window.rootViewController = na;
    [self.window makeKeyAndVisible];
    
    //初始化单例中的数据源

    
    //开启异步任务初始化数据源
//    [NSThread detachNewThreadSelector:@selector(actionOne) toTarget:self withObject:nil];
//    [self asyncAddImageData];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
