//
//  CoreAnimationEffect.m
//  赛马
//
//  Created by 杨晓龙 on 16/8/15.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "CoreAnimationEffect.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width / 720.
#define kScreenHeight [UIScreen mainScreen].bounds.size.height / 1280.
#define xloffset (38 * kScreenWidth)

@interface CoreAnimationEffect ()
@property (nonatomic, strong) NSTimer *rankTimer;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) int index;
@property (nonatomic, assign) float times;
@property (nonatomic, strong) NSMutableArray *arr1;
@property (nonatomic, strong) NSMutableArray *arr2;
@property (nonatomic, strong) NSMutableArray *arr3;
@property (nonatomic, strong) NSMutableArray *arr4;
@property (nonatomic, strong) NSMutableArray *arr5;
@property (nonatomic, strong) NSMutableArray *arr6;
@property (nonatomic, strong) NSMutableArray *arr7;
@property (nonatomic, strong) NSMutableArray *arr8;
@property (nonatomic, strong) NSMutableArray *arr9;
@property (nonatomic, strong) NSMutableArray *arr10;

@end

@implementation CoreAnimationEffect
+(CoreAnimationEffect *)share
{
    static CoreAnimationEffect *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}
- (NSMutableArray *)arr1
{
    if (!_arr1) {
        self.arr1 = [NSMutableArray array];
    }
    return _arr1;
}
- (NSMutableArray *)arr2
{
    if (!_arr2) {
        self.arr2 = [NSMutableArray array];
    }
    return _arr2;
}
- (NSMutableArray *)arr3
{
    if (!_arr3) {
        self.arr3 = [NSMutableArray array];
    }
    return _arr3;
}
- (NSMutableArray *)arr4
{
    if (!_arr4) {
        self.arr4 = [NSMutableArray array];
    }
    return _arr4;
}
- (NSMutableArray *)arr5
{
    if (!_arr5) {
        self.arr5 = [NSMutableArray array];
    }
    return _arr5;
}
- (NSMutableArray *)arr6
{
    if (!_arr6) {
        self.arr6 = [NSMutableArray array];
    }
    return _arr6;
}
- (NSMutableArray *)arr7
{
    if (!_arr7) {
        self.arr7 = [NSMutableArray array];
    }
    return _arr7;
}
- (NSMutableArray *)arr8
{
    if (!_arr8) {
        self.arr8 = [NSMutableArray array];
    }
    return _arr8;
}
- (NSMutableArray *)arr9
{
    if (!_arr9) {
        self.arr9 = [NSMutableArray array];
    }
    return _arr9;
}
- (NSMutableArray *)arr10
{
    if (!_arr10) {
        self.arr10 = [NSMutableArray array];
    }
    return _arr10;
}


+ (void)animationMoveLeft:(UIImageView *)view1 duration:(CFTimeInterval)duration endPoint:(CGFloat)endPoint rank:(NSString *)rank
{
    
    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    [self share].count++;
    
    CGFloat startPoint = view1.frame.origin.x ;
    
    //设定关键帧位置，必须含起始与终止位置
    
    CGFloat f1 = 0;
    CGFloat f2 = 0;
    CGFloat f3 = 0;
    CGFloat f4 = 0;
    CGFloat f5 = 0;
    CGFloat f6 = 0;
    CGFloat f7 = 0;
    CGFloat f8 = 0;
    
    endPoint = endPoint + 150 * kScreenWidth;
    f1 = [self randomFloatBetween:startPoint andLargerFloat:endPoint];
    f2 = [self randomFloatBetween:startPoint andLargerFloat:endPoint];
    f3 = [self randomFloatBetween:startPoint  andLargerFloat:endPoint];
    f4 = [self randomFloatBetween:startPoint andLargerFloat:endPoint];
    f5 = [self randomFloatBetween:startPoint  andLargerFloat:endPoint];
    f6 = [self randomFloatBetween:startPoint  andLargerFloat:endPoint];
    f7 = [self randomFloatBetween:startPoint  andLargerFloat:endPoint];
    f8 = [self randomFloatBetween:endPoint + 110 * kScreenWidth * [rank intValue] andLargerFloat:endPoint + 100 * kScreenWidth * [rank intValue]];
    
    
    rectRunAnimation.values = @[
                                [NSValue valueWithCGPoint:CGPointMake(view1.origin.x,
                                                                      view1.frame.origin.y + xloffset)],
                                [NSValue valueWithCGPoint:CGPointMake(f1,
                                                                      view1.frame.origin.y + xloffset)],
                                [NSValue valueWithCGPoint:CGPointMake(f2,
                                                                      view1.frame.origin.y + xloffset)],
                                [NSValue valueWithCGPoint:CGPointMake(f3,
                                                                      view1.frame.origin.y + xloffset)],
                                [NSValue valueWithCGPoint:CGPointMake(f4, view1.frame.origin.y + xloffset)],
                                [NSValue valueWithCGPoint:CGPointMake(f5,
                                                                      view1.frame.origin.y + xloffset)],
                                [NSValue valueWithCGPoint:CGPointMake(f6,
                                                                      view1.frame.origin.y + xloffset)],
                                [NSValue valueWithCGPoint:CGPointMake(f7,
                                                                      view1.frame.origin.y + xloffset)],
                                [NSValue valueWithCGPoint:CGPointMake(f8,
                                                                      view1.frame.origin.y + xloffset)],
                                
                                [NSValue valueWithCGPoint:CGPointMake(- 2200 * kScreenWidth,
                                                                      view1.frame.origin.y + xloffset)]];
    rectRunAnimation.removedOnCompletion = NO;
    rectRunAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                         [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    //        rectRunAnimation.repeatCount = 1;
    rectRunAnimation.autoreverses = NO;
    
    rectRunAnimation.calculationMode = kCAAnimationLinear;
    //        rectRunAnimation.duration = duration;
    //        [view1.layer addAnimation:rectRunAnimation forKey:@"rectRunAnimation"];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.values = view1.animationImages;
    keyAnimation.removedOnCompletion=NO;
    
    
    view1.frame = CGRectMake(- 2200 * kScreenWidth, view1.frame.origin.y, view1.frame.size.width, view1.frame.size.height);
    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
    
    groupAnima.animations = @[keyAnimation,rectRunAnimation];
    
    //设置组动画的时间
    groupAnima.duration = duration * 0.5;
    //    groupAnima.duration = duration ;
    groupAnima.fillMode = kCAFillModeForwards;
    groupAnima.removedOnCompletion = NO;
    
    [view1.layer addAnimation:groupAnima forKey:nil];
    view1.layer.speed = 2;
    CGFloat f0a= [[self share] getmiddle:startPoint f2:f1 i:1 all:5 allt:duration];
    CGFloat f0b = [[self share] getmiddle:startPoint f2:f1 i:2 all:5 allt:duration];
    CGFloat f0c = [[self share] getmiddle:startPoint f2:f1 i:3 all:5 allt:duration];
    CGFloat f0d = [[self share] getmiddle:startPoint f2:f1 i:4 all:5 allt:duration];
    
    CGFloat f1a = [[self share] getmiddle:f1 f2:f2 i:1 all:5 allt:duration];
    CGFloat f1b = [[self share] getmiddle:f1 f2:f2 i:2 all:5 allt:duration];
    CGFloat f1c = [[self share] getmiddle:f1 f2:f2 i:3 all:5 allt:duration];
    CGFloat f1d = [[self share] getmiddle:f1 f2:f2 i:4 all:5 allt:duration];
    
    CGFloat f2a = [[self share] getmiddle:f2 f2:f3 i:1 all:5 allt:duration];
    CGFloat f2b = [[self share] getmiddle:f2 f2:f3 i:2 all:5 allt:duration];
    CGFloat f2c = [[self share] getmiddle:f2 f2:f3 i:3 all:5 allt:duration];
    CGFloat f2d = [[self share] getmiddle:f2 f2:f3 i:4 all:5 allt:duration];
    
    CGFloat f3a = [[self share] getmiddle:f3 f2:f4 i:1 all:5 allt:duration];
    CGFloat f3b = [[self share] getmiddle:f3 f2:f4 i:2 all:5 allt:duration];
    CGFloat f3c = [[self share] getmiddle:f3 f2:f4 i:3 all:5 allt:duration];
    CGFloat f3d = [[self share] getmiddle:f3 f2:f4 i:4 all:5 allt:duration];
    
    CGFloat f4a = [[self share] getmiddle:f4 f2:f5 i:1 all:5 allt:duration];
    CGFloat f4b = [[self share] getmiddle:f4 f2:f5 i:2 all:5 allt:duration];
    CGFloat f4c = [[self share] getmiddle:f4 f2:f5 i:3 all:5 allt:duration];
    CGFloat f4d = [[self share] getmiddle:f4 f2:f5 i:4 all:5 allt:duration];
    
    CGFloat f5a = [[self share] getmiddle:f5 f2:f6 i:1 all:5 allt:duration];
    CGFloat f5b = [[self share] getmiddle:f5 f2:f6 i:2 all:5 allt:duration];
    CGFloat f5c = [[self share] getmiddle:f5 f2:f6 i:3 all:5 allt:duration];
    CGFloat f5d = [[self share] getmiddle:f5 f2:f6 i:4 all:5 allt:duration];
    
    CGFloat f6a = [[self share] getmiddle:f6 f2:f7 i:1 all:5 allt:duration];
    CGFloat f6b = [[self share] getmiddle:f6 f2:f7 i:2 all:5 allt:duration];
    CGFloat f6c = [[self share] getmiddle:f6 f2:f7 i:3 all:5 allt:duration];
    CGFloat f6d = [[self share] getmiddle:f6 f2:f7 i:4 all:5 allt:duration];
    
    CGFloat f7a = [[self share] getmiddle:f7 f2:f8 i:1 all:5 allt:duration];
    CGFloat f7b = [[self share] getmiddle:f7 f2:f8 i:2 all:5 allt:duration];
    CGFloat f7c = [[self share] getmiddle:f7 f2:f8 i:3 all:5 allt:duration];
    CGFloat f7d = [[self share] getmiddle:f7 f2:f8 i:4 all:5 allt:duration];
    
//    CGFloat f8a = [[self share] getmiddle:f8 f2:-2200 * kScreenWidth i:1 all:5 allt:duration];
//    CGFloat f8b = [[self share] getmiddle:f8 f2:-2200 * kScreenWidth i:2 all:5 allt:duration];
//    CGFloat f8c = [[self share] getmiddle:f8 f2:-2200 * kScreenWidth i:3 all:5 allt:duration];
//    CGFloat f8d = [[self share] getmiddle:f8 f2:-2200 * kScreenWidth i:4 all:5 allt:duration];
    
    
    NSMutableArray *ac = [NSMutableArray arrayWithObjects:
                          [NSNumber numberWithFloat:f0a],
                          [NSNumber numberWithFloat:f0b],
                          [NSNumber numberWithFloat:f0c],
                          [NSNumber numberWithFloat:f0d],
                          
                          [NSNumber numberWithFloat:f1],
                          [NSNumber numberWithFloat:f1a],
                          [NSNumber numberWithFloat:f1b],
                          [NSNumber numberWithFloat:f1c],
                          [NSNumber numberWithFloat:f1d],
                          
                          [NSNumber numberWithFloat:f2],
                          [NSNumber numberWithFloat:f2a],
                          [NSNumber numberWithFloat:f2b],
                          [NSNumber numberWithFloat:f2c],
                          [NSNumber numberWithFloat:f2d],
                          
                          [NSNumber numberWithFloat:f3],
                          [NSNumber numberWithFloat:f3a],
                          [NSNumber numberWithFloat:f3b],
                          [NSNumber numberWithFloat:f3c],
                          [NSNumber numberWithFloat:f3d],
                          
                          [NSNumber numberWithFloat:f4],
                          [NSNumber numberWithFloat:f4a],
                          [NSNumber numberWithFloat:f4b],
                          [NSNumber numberWithFloat:f4c],
                          [NSNumber numberWithFloat:f4d],
                          
                          [NSNumber numberWithFloat:f5],
                          [NSNumber numberWithFloat:f5a],
                          [NSNumber numberWithFloat:f5b],
                          [NSNumber numberWithFloat:f5c],
                          [NSNumber numberWithFloat:f5d],
                          
                          [NSNumber numberWithFloat:f6],
                          [NSNumber numberWithFloat:f6a],
                          [NSNumber numberWithFloat:f6b],
                          [NSNumber numberWithFloat:f6c],
                          [NSNumber numberWithFloat:f6d],
                          
                          [NSNumber numberWithFloat:f7],
                          [NSNumber numberWithFloat:f7a],
                          [NSNumber numberWithFloat:f7b],
                          [NSNumber numberWithFloat:f7c],
                          [NSNumber numberWithFloat:f7d],
                          
                          [NSNumber numberWithFloat:f8], nil];
    if ([rank intValue] == 1) {
        [[self share].arr1 removeAllObjects];
        [[self share].arr1 addObjectsFromArray:ac];
        
    }else if ([rank intValue] == 2) {
        [[self share].arr2 removeAllObjects];
        [[self share].arr2 addObjectsFromArray:ac];
        
    } else if ([rank intValue] == 3)
    {
        [[self share].arr3 removeAllObjects];
        [[self share].arr3 addObjectsFromArray:ac];
    }else if ([rank intValue] == 4) {
        [[self share].arr4 removeAllObjects];
        [[self share].arr4 addObjectsFromArray:ac];
    }else if ([rank intValue] == 5) {
        [[self share].arr5 removeAllObjects];
        [[self share].arr5 addObjectsFromArray:ac];
    }else if ([rank intValue] == 6) {
        [[self share].arr6 removeAllObjects];
        [[self share].arr6 addObjectsFromArray:ac];
    }else if ([rank intValue] == 7) {
        [[self share].arr7 removeAllObjects];
        [[self share].arr7 addObjectsFromArray:ac];
    }else if ([rank intValue] == 8) {
        [[self share].arr8 removeAllObjects];
        [[self share].arr8 addObjectsFromArray:ac];
    }else if ([rank intValue] == 9) {
        [[self share].arr9 removeAllObjects];
        [[self share].arr9 addObjectsFromArray:ac];
        
    }else if ([rank intValue] == 10) {
        [[self share].arr10 removeAllObjects];
        [[self share].arr10 addObjectsFromArray:ac];
        
    }
    [self share].times = duration / 10;
    if ([self share].count == 10) {
        [self share].count = 0;
        
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"排序" object:nil userInfo:@{@"1":[self share].arr1,@"2":[self share].arr2,@"3":[self share].arr3,@"4":[self share].arr4,@"5":[self share].arr5,@"6":[self share].arr6,@"7":[self share].arr7,@"8":[self share].arr8,@"9":[self share].arr9,@"10":[self share].arr10}];
    }
}
+ (void)postRank:(Block)block
{
    block(@{@"1":[self share].arr1,@"2":[self share].arr2,@"3":[self share].arr3,@"4":[self share].arr4,@"5":[self share].arr5,@"6":[self share].arr6,@"7":[self share].arr7,@"8":[self share].arr8,@"9":[self share].arr9,@"10":[self share].arr10});
}
- (CGFloat)getmiddle:(CGFloat)f1 f2:(CGFloat)f2 i:(int)i all:(int)all allt:(CGFloat)allt
{
    CGFloat f1a;
    CGFloat f1t;
    if (f1 > f2) {
        f1t = (f1 - f2) / (allt / 10);
        f1a = f1 - (f1t * ((allt - 10) / 40) * i);
    }else
    {
        f1t = (f2 - f1)/ (allt / 10);
        f1a = f1 + (f1t * ((allt - 10) / 40) * i);
    }
    return f1a;
}
+ (float)randomFloatBetween:(float)num1 andLargerFloat:(float)num2
{
    float diff = num1 - num2;
    float a = num1 - (((float) rand() / RAND_MAX) * diff);
    return a;
}
@end
