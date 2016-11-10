//
//  GeelyCallAViewController.m
//  Geely_Third
//
//  Created by WillyZhao on 16/11/9.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyCallAViewController.h"
#import "GeelyCallViewToInput.h"
#import "GeelyCalledListlistView.h"
#import "PersonListView.h"

@interface GeelyCallAViewController () {
    UIImageView *imageView;
}

@end

@implementation GeelyCallAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = self;
    self.contentScrollView.delegate = self;
    self.contentImageView.image = [UIImage imageNamed:@"12.3_ts_comfort_audio-text_20160928"];
    [self addFixedView];
    
    __block __weak GeelyCallAViewController *weakself = self;
    
    [self addImageViewAnimate:^{
        //动画完成后执行
        
        UIView *view_input = [[[NSBundle mainBundle] loadNibNamed:@"GeelyCallToInputA" owner:weakself options:nil]firstObject];
        view_input.frame = CGRectMake(0, 0, 1228, 373.5);
        [weakself.contentScrollView addSubview:view_input];
        
        GeelyCallViewToInput *vv = [[GeelyCallViewToInput alloc] initWithFrame:CGRectMake(0, -20, 852.5, 373.5)];
        [view_input addSubview:vv];
        
        //加载第二页
        UIView *view_list = [[[NSBundle mainBundle] loadNibNamed:@"GeelyCalllistA" owner:weakself options:nil]firstObject];
        view_list.frame = CGRectMake(1228, 0, 1228, 373.5);
        [weakself.contentScrollView addSubview:view_list];
        
        GeelyCalledListlistView *listView = [[GeelyCalledListlistView alloc] initWithFrame:CGRectMake(0, 0, 852.5, 373.5)];
        listView.backgroundColor = [UIColor clearColor];
        [view_list addSubview:listView];
        
        //加载第三页
        UIView *view_person = [[[NSBundle mainBundle] loadNibNamed:@"GeelyPersonlistA" owner:weakself options:nil]firstObject];
        view_person.frame = CGRectMake(1228*2, 0, 1228, 373.5);
        [weakself.contentScrollView addSubview:view_person];
        
        PersonListView *personList = [[PersonListView alloc] initWithFrame:CGRectMake(0, 0, 852.5, 373.5)];
        personList.backgroundColor = [UIColor clearColor];
        [view_person addSubview:personList];
        
        weakself.contentScrollView.contentSize = CGSizeMake(1228*3, 0);
        
         view_input.alpha = 0;
        [UIView animateWithDuration:.5f animations:^{
            view_input.alpha = 1;
        }];
        
    }];
    
    
}
-(UIView *)geelyTopAnimateView {
    UIView *vb = [[[NSBundle mainBundle] loadNibNamed:@"callTopview" owner:self options:nil]firstObject];
    vb.frame = CGRectMake(82, 0, 991.5, 61.5);
    vb.backgroundColor = [UIColor clearColor];
    
    imageView = (UIImageView *)[vb viewWithTag:972];
    
    return vb;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        imageView.image = [UIImage imageNamed:@"topcallgeely"];
    }else if (scrollView.contentOffset.x == 1228) {
        imageView.image = [UIImage imageNamed:@"123123123123toptop"];
    }else if (scrollView.contentOffset.x == 1228*2) {
        imageView.image = [UIImage imageNamed:@"top_0dasdaadio13i"];
    }
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
