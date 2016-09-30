//
//  StageBGView.m
//  PMSC
//
//  Created by 杨晓龙 on 16/9/12.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "StageBGView.h"

@interface StageBGView ()
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *flowerImageView;
@property (nonatomic, strong) UIImageView *firstImageView;
@property (nonatomic, strong) UIImageView *secondImageView;
@property (nonatomic, strong) UIImageView *thirdImageView;
@end

@implementation StageBGView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self load];
    }
    return self;
}
- (void)load
{
    self.bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景1.jpg"]];
    self.bgImageView.frame = self.frame;
    [self addSubview:self.bgImageView];
    
    self.flowerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"花1"]];

    self.flowerImageView.frame = CGRectMake(0, 0, self.frame.size.width,self.frame.size.height);
    [self.bgImageView addSubview:self.flowerImageView];
    
    UIImageView *rankSecond = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"结束名次_02"]];
    rankSecond.frame = CGRectMake(188 * kScreenWidth, 94 * kScreenWidth, 67 * kScreenWidth, 32 * kScreenWidth);
    [self.flowerImageView addSubview:rankSecond];
    
    self.secondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(180 * kScreenWidth, CGRectGetMaxY(rankSecond.frame) + 20 * kScreenWidth, 90 * kScreenWidth, 237* kScreenWidth)];

    [self.flowerImageView addSubview:self.secondImageView];
    
    UIImageView *rankFirst = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"结束名次_01"]];
    rankFirst.frame = CGRectMake(311 * kScreenWidth, 28 * kScreenWidth, 100 * kScreenWidth, 58 * kScreenWidth);
    [self.flowerImageView addSubview:rankFirst];
    
    self.firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(303 * kScreenWidth, CGRectGetMaxY(rankFirst.frame) + 29 * kScreenWidth, 116 * kScreenWidth, 307 * kScreenWidth)];

    [self.flowerImageView addSubview:self.firstImageView];
    
    UIImageView *rankThird = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"结束名次_03"]];
    rankThird.frame = CGRectMake((720 - 188 - 67) * kScreenWidth, CGRectGetMinY(rankSecond.frame), 67 * kScreenWidth, 32 * kScreenWidth);
    [self.flowerImageView addSubview:rankThird];
    
    self.thirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(452 * kScreenWidth, CGRectGetMinY(self.secondImageView.frame), 90 * kScreenWidth, 237 * kScreenWidth)];

    [self.flowerImageView addSubview:self.thirdImageView];
    [self startAnimation];
}
- (void)getStageBGViewWithfirst:(NSString *)first second:(NSString *)second third:(NSString *)third
{
    
    self.firstImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"正面%d",[first intValue]]];
    self.secondImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"正面%d",[second intValue]]];
    self.thirdImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"正面%d",[third intValue]]];

    
}
- (void)startAnimation
{
    NSMutableArray *arrc1 = [NSMutableArray array];
    for (int i = 1; i < 7; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"背景%d.jpg",i]];
        [arrc1 addObject:img];
    }
    [self setAnimateion1:arrc1 imgView:self.bgImageView Duration:3 speed:0.3 repeatCount:0];
    NSMutableArray *arrc2 = [NSMutableArray array];
    for (int i = 1; i < 5; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"花%d",i]];
        [arrc2 addObject:img];
    }
    [self setAnimateion1:arrc2 imgView:self.flowerImageView Duration:3 speed:0.6 repeatCount:1];
   
}
- (void)setAnimateion1:(NSArray*)imageArray imgView:(UIImageView *)imgView Duration:(NSInteger)duration speed:(CGFloat)speed repeatCount:(NSInteger)repeatCount
{
    //    float a = 10;
    imgView.animationImages = imageArray;
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.values = imageArray;
    keyAnimation.removedOnCompletion=NO;
    keyAnimation.fillMode=kCAFillModeForwards;
    keyAnimation.duration = duration;
    keyAnimation.repeatCount = repeatCount;
    keyAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    [imgView.layer addAnimation:keyAnimation forKey:nil];
    [imgView startAnimating];
    imgView.layer.speed = speed;
    //    imgView.layer.speed = 0.4;
    //    imgView.animationImages = imageArray;
    //    [imgView setAnimationDuration:(imageArray.count / a)];
    //    [imgView setAnimationRepeatCount:(duration/(imageArray.count / a))];
}

@end
