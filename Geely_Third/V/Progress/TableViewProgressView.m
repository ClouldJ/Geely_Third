//
//  TableViewProgressView.m
//  sdonad ansdoinads
//
//  Created by WillyZhao on 16/10/25.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "TableViewProgressView.h"
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface TableViewProgressView () {
//    UIView *view
    CAGradientLayer *layer;
}

@end

@implementation TableViewProgressView

-(instancetype)initWithFrame:(CGRect)frame andBottomSize:(CGSize)b_size andupBottomSize:(CGSize)ub_size {
    if (self = [super initWithFrame:frame]) {
        [self loadBottomView:b_size upBottomView:ub_size];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.frame = CGRectMake(0, 0, 50,300);
        CGSize b_size = CGSizeMake(2, 297);
        CGSize ub_size = CGSizeMake(3, 400);
        [self loadBottomView:b_size upBottomView:ub_size];
    }
    return self;
}

-(void)loadBottomView:(CGSize)b_size upBottomView:(CGSize )ub_size {
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width - b_size.width)/2-20, (self.frame.size.height - b_size.height)/2, b_size.width, b_size.height)];
    self.bottomView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bottomView];
    
    UIImageView *bg_image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"progressbackground"]];
    bg_image.frame = self.bottomView.frame;
    [self addSubview:bg_image];
    
    self.upBottomView = [[UIView alloc] initWithFrame:CGRectMake((self.frame.size.width - ub_size.width)/2-20, (self.frame.size.height - b_size.height)/2, ub_size.width, 5)];

    
    layer = [CAGradientLayer layer];
    layer.cornerRadius = 2.0f;
    layer.startPoint  = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(0, 1);
    layer.colors = @[(__bridge id)[RGBA(115, 81, 4, 1) CGColor],(__bridge id)[RGBA(248, 207, 83, 1) CGColor],(__bridge id)[RGBA(192, 160, 85, 1) CGColor]];
    layer.locations = @[@0.0f,@0.5f,@1.0f];
    layer.frame = self.upBottomView.bounds;
    [self.upBottomView.layer addSublayer:layer];
    
    [self addSubview:self.upBottomView];
}

-(void)setHeightPercent:(CGFloat)heightPercent {
    if (heightPercent<=0) {
        self.upBottomView.frame = CGRectMake(self.upBottomView.frame.origin.x, self.upBottomView.frame.origin.y, self.upBottomView.frame.size.width, 5);
    }else if (heightPercent>=1) {
        self.upBottomView.frame = CGRectMake(self.upBottomView.frame.origin.x, self.upBottomView.frame.origin.y, self.upBottomView.frame.size.width, self.bottomView.frame.size.height);
    }else{
        self.upBottomView.frame = CGRectMake(self.upBottomView.frame.origin.x, self.upBottomView.frame.origin.y, self.upBottomView.frame.size.width, self.bottomView.frame.size.height*heightPercent);
    }
    layer.frame = self.upBottomView.bounds;

}

//-(void)set

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
