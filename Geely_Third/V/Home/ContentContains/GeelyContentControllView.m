//
//  GeelyContentControllView.m
//  Geely_Third
//
//  Created by WillyZhao on 16/10/8.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyContentControllView.h"

#import "GeelyControllCollectionViewCell.h"

@interface GeelyContentControllView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    UICollectionView *collectionView_;
}

@end

@implementation GeelyContentControllView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews {
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.minimumLineSpacing = 0;
//    flowLayout.minimumInteritemSpacing = 0;
//    
//    collectionView_ = [[UICollectionView alloc] initWithFrame:CGRectMake(95, 90, self.frame.size.width-190, 200) collectionViewLayout:flowLayout];
//    collectionView_.delegate = self;
//    collectionView_.dataSource = self;
//    collectionView_.backgroundColor = [UIColor clearColor];
//    [self addSubview:collectionView_];
//    
//    
//    [collectionView_ registerNib:[UINib nibWithNibName:@"GeelyControllCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"collection"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"geelyhomeapp"]];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.frame = CGRectMake((self.frame.size.width - 1605/2)/2, (self.frame.size.height - 670/2)/2+70, 1605/2, 670/2);
//    imageView.center = self.center;
    [self addSubview:imageView];
}

#pragma mark UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((collectionView_.frame.size.width-50)/5, (collectionView_.frame.size.height - 45)/2);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GeelyControllCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collection" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
