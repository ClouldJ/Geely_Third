//
//  GeelyIconSelectedView.m
//  ICONShowDemo
//
//  Created by WillyZhao on 2016/11/29.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyIconSelectedView.h"
#import "ImageIconModel.h"

@interface GeelyIconSelectedView () {
    NSMutableArray *dataArr;
    NSArray *data_Image;
    NSMutableArray *indexArray;
}

@end

@implementation GeelyIconSelectedView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addImageViewWithIndex:[SingleModel sharedInstance].iconData_Image.count];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
//        [SingleModel sharedInstance].iconDataArr = [NSMutableArray array];
//        [SingleModel sharedInstance].iconData_Image = [NSMutableArray array];
//        [SingleModel sharedInstance].iconIndexArray = [NSMutableArray array];
    }
    return self;
}

#pragma mark 数据源操作

-(void)btnCheckTags:(NSInteger)tag dataIndex:(NSInteger)index {
    //用于选中与非选中判断
    if ([[SingleModel sharedInstance].iconIndexArray containsObject:[NSString stringWithFormat:@"%ld",tag]]) {
        [[SingleModel sharedInstance].iconIndexArray removeObject:[NSString stringWithFormat:@"%ld",tag]];
    }else{
        [[SingleModel sharedInstance].iconIndexArray addObject:[NSString stringWithFormat:@"%ld",tag]];
    }
    
    NSLog(@"需要查看的索引源:%@",[SingleModel sharedInstance].iconIndexArray);
    
    //每次都清空数据源
    [[SingleModel sharedInstance].iconDataArr removeAllObjects];
    
    //编列数组，进行数据源的初始化
    for (NSString *str in [SingleModel sharedInstance].iconIndexArray) {
        ImageIconModel *model = [[ImageIconModel alloc] init];
        model.tag = [str integerValue];
        switch ([str integerValue]) {
            case 1:
                model.imageName = @"WIFIicon";
                break;
            case 2:
                model.imageName = @"手机信号icon";
                break;
            case 3:
                model.imageName = @"手机电量icon";
                break;
            case 4:
                model.imageName = @"行车记录仪icon";
                break;
            case 5:
                model.imageName = @"无线充电icon";
                break;
            case 6:
                model.imageName = @"环绕声icon";
                break;
            case 7:
                model.imageName = @"行驶中视频限制icon";
                break;
            default:
                break;
                
        }
        [[SingleModel sharedInstance].iconDataArr addObject:model];
    }
    
    //数据源排序得到新的数组
    [SingleModel sharedInstance].iconData_Image = [[SingleModel sharedInstance].iconDataArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        ImageIconModel *model1 = (ImageIconModel *)obj1;
        ImageIconModel *model2 = (ImageIconModel *)obj2;
        if (model1.tag<model2.tag) {
            return NSOrderedAscending;
        }else{
            return NSOrderedDescending;
        }
    }];
    
    NSLog(@"需查看的数据源:%@",[SingleModel sharedInstance].iconData_Image);
    
    //传入数据进行初始化视图
    [self addImageViewWithIndex:[SingleModel sharedInstance].iconData_Image.count];
    
}



#pragma mark 视图添加操作
-(void)addImageViewWithIndex:(NSInteger)index {
    //移除视图中的子视图
    if (self.subviews.count>0) {
        for (UIImageView *imageView in self.subviews) {
            [imageView removeFromSuperview];
        }
    }
    //创建新视图
    for (int i = 0; i<index; i++) {
        
        if (i<4) {
            ImageIconModel *model = [SingleModel sharedInstance].iconData_Image[i];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:model.imageName]];
            imageView.frame = CGRectMake(10+8*i+((45/2)*i), 0, 45/2, 39/2);
            [self addSubview:imageView];
        }else if (i==4){
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"省略号"]];
            imageView.userInteractionEnabled = YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
            [imageView addGestureRecognizer:tap];
            
            imageView.frame = CGRectMake(10+10*i+((45/2)*i), 0, 45/2, 39/2);
            [self addSubview:imageView];
        }else{
            NSLog(@"大于五  不作处理");
        }
        
        
    }
}


-(void)tapGesture:(UITapGestureRecognizer *)tap {
    [self addImageViewWith:[SingleModel sharedInstance].iconData_Image.count];
    [self performSelector:@selector(delayTime) withObject:nil afterDelay:3];
}

-(void)delayTime{
    [self addImageViewWithIndex:[SingleModel sharedInstance].iconData_Image.count];
}

-(void)addImageViewWith:(NSInteger)index {
    //移除视图中的子视图
    if (self.subviews.count>0) {
        for (UIImageView *imageView in self.subviews) {
            [imageView removeFromSuperview];
        }
    }
    //创建新视图
    for (int i = 0; i<index; i++) {

            ImageIconModel *model = [SingleModel sharedInstance].iconData_Image[i];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:model.imageName]];
            imageView.frame = CGRectMake(10+8*i+((45/2)*i), 0, 45/2, 39/2);
            [self addSubview:imageView];
  
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
