//
//  GeelyMusicCDAnimationView.m
//  Geely_Beizar
//
//  Created by WillyZhao on 16/10/17.
//  Copyright © 2016年 WillyZhao. All rights reserved.
//

#import "GeelyMusicCDAnimationView.h"

#import "GeelyMusicAudioManager.h"

#define WWWWW [UIScreen mainScreen].bounds.size.width
#define HHHHH [UIScreen mainScreen].bounds.size.height
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface GeelyMusicCDAnimationView () {
    CGFloat angle;
    float singTime;                               //歌曲时间
    CGFloat repeatCount_;
    CGFloat duration_;
    BOOL stop;
    AVAudioPlayer *acPlayer;
}

@property(nonatomic, strong) dispatch_source_t timer;

@property (nonatomic, strong) UIBezierPath *trackPath;

@property (nonatomic, strong) CAShapeLayer *trackLayer;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic ,strong) NSTimer *timer_circle;

@end

@implementation GeelyMusicCDAnimationView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadAllSubViews];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.frame = CGRectMake(0, 0, 180, 180);
        [self loadAllSubViews];
    }
    return self;
}

-(void)loadAllSubViews {
    stop = NO;
    self.imageView_ = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width-9, self.frame.size.height-9)];
    self.imageView_.layer.cornerRadius = (self.frame.size.width-9)/2;
    self.imageView_.layer.masksToBounds = YES;
    [self addSubview:self.imageView_];
    self.imageView_.image = [UIImage imageNamed:@"Geely_third_CD"];
    
    self.imageView_.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.imageView_ addGestureRecognizer:tap];
    
    //外圆
    self.trackPath = [UIBezierPath bezierPathWithArcCenter:self.imageView_.center radius:(self.frame.size.width-2)/2 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    self.trackLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.trackLayer];
    self.trackLayer.fillColor = [UIColor clearColor].CGColor;
    self.trackLayer.strokeColor = [RGBA(75, 61, 5, 1) CGColor];
    
    self.trackLayer.path = self.trackPath.CGPath;
    
    self.trackLayer.lineWidth = 1;
    self.trackLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    //创建出CAShapeLayer
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    //设置线条的宽度和颜色
    self.shapeLayer.lineWidth = 3.0f;
    self.shapeLayer.strokeColor = [RGBA(113, 71, 7, 1) CGColor];
    
    //设置stroke起始点
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0;
    self.shapeLayer.lineCap = @"kCGLineCapRound";
    
    //创建出圆形贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:self.imageView_.center radius:(self.frame.size.width-6)/2 startAngle:-M_PI_2 endAngle:(M_PI * 2)-M_PI_2 clockwise:YES];
    
    //让贝塞尔曲线与CAShapeLayer产生联系
    self.shapeLayer.path = circlePath.CGPath;
    self.shapeLayer.lineCap = kCALineCapRound;
    
    [self.layer addSublayer:self.shapeLayer];
}
#pragma mark 单击cd停止或开始音乐
-(void)tapAction:(UITapGestureRecognizer *)tap {
    
    
    
    if (![SingleModel sharedInstance].isMusic) {
        [SingleModel sharedInstance].isMusic = YES;
        [self showAnimation];
        
        GeelyMusicAudioManager *manager = [GeelyMusicAudioManager defaultManager];
        acPlayer = [manager playMusic:@"Zki & Dobre-Listen To The Talk"];
        
    }else{
        if (!stop) {
            [self pauseLayer:self.imageView_.layer];
            stop = YES;
            if (acPlayer) {
                [acPlayer stop];
            }
            if ([self.delegate respondsToSelector:@selector(musicCDAnimationPaused:)]&&self.delegate) {
                [self.delegate musicCDAnimationPaused:self];
            }
            
        }else{
            stop = NO;
            [self resumeLayer:self.imageView_.layer];
            if (acPlayer) {
                [acPlayer play];
            }
            if ([self.delegate respondsToSelector:@selector(musicCDAnimationResumed:)]&&self.delegate) {
                [self.delegate musicCDAnimationResumed:self];
            }
            
        }
    }
}

-(void)showAnimation {
    if ([self.delegate respondsToSelector:@selector(musicTime)]&&self.delegate) {
        singTime = [self.delegate musicTime];
    }else{
        singTime = 191;
    }
    if ([self.delegate respondsToSelector:@selector(musicCDAnimationWillStart:)] && self.delegate) {
        [self.delegate musicCDAnimationWillStart:self];
    }
    [self startAnimation];
    self.timer_circle = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(circleAnimationTypeOne) userInfo:nil repeats:YES];
}

-(void)circleAnimationTypeOne {
    
    self.shapeLayer.strokeEnd += 1/(singTime*10);
    if (self.shapeLayer.strokeEnd >= 1) {
        [self.timer_circle invalidate];
        if ([self.delegate respondsToSelector:@selector(musicCDAnimationDidFinish:)]&&self.delegate) {
            [self.delegate musicCDAnimationDidFinish:self];
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(musciCDAnimationRunning:currentPosition:)]&& self.delegate) {
            [self.delegate musciCDAnimationRunning:self currentPosition:self.shapeLayer.strokeEnd*singTime];
        }
    }
    
}

-(void)reloadWith:(CGFloat)musicTime {
    singTime = musicTime;
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd = 0;
    [self showAnimation];
}

-(void)startAnimation {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 5.0f;
    rotationAnimation.cumulative = NO;
    rotationAnimation.repeatCount = MAXFLOAT;
    
    [self.imageView_.layer addAnimation:rotationAnimation forKey:@"rotation"];
}

-(void)setDuration:(CGFloat)duration {
    duration_ = duration;
}

-(void)setRepeatCount:(CGFloat)repeatCount {
    repeatCount_ = repeatCount;
}

#pragma mark 停止旋转动画
-(void)pauseLayer:(CALayer *)layer {
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() toLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
    [self.timer_circle setFireDate:[NSDate distantFuture]];
}

#pragma mark 继续layer上面的动画
-(void)resumeLayer:(CALayer *)layer {
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() toLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
    
    [self.timer_circle setFireDate:[NSDate date]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
