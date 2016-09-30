//
//  CoreAnimationEffect.h
//  赛马
//
//  Created by 杨晓龙 on 16/8/15.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^Block)(id value);
@interface CoreAnimationEffect : NSObject
//@property (nonatomic, assign) CGFloat allTime;
+ (CoreAnimationEffect *)share;
+ (void)postRank:(Block)block;
//#pragma mark - Custom Animation
//
///**
// *   @brief 快速构建一个你自定义的动画,有以下参数供你设置.
// *
// *   @note  调用系统预置Type需要在调用类引入下句
// *
// *          #import <QuartzCore/QuartzCore.h>
// *
// *   @param type                动画过渡类型
// *   @param subType             动画过渡方向(子类型)
// *   @param duration            动画持续时间
// *   @param timingFunction      动画定时函数属性
// *   @param theView             需要添加动画的view.
// *
// *
// */
//
//+ (void)showAnimationType:(NSString *)type
//              withSubType:(NSString *)subType
//                 duration:(CFTimeInterval)duration
//           timingFunction:(NSString *)timingFunction
//                     view:(UIView *)theView;
//
//#pragma mark - Preset Animation
//
///**
// *  下面是一些常用的动画效果
// */
//
//// reveal
//+ (void)animationRevealFromBottom:(UIView *)view;
//+ (void)animationRevealFromTop:(UIView *)view;
//+ (void)animationRevealFromLeft:(UIView *)view;
//+ (void)animationRevealFromRight:(UIView *)view;
//
//// 渐隐渐消
//+ (void)animationEaseIn:(UIView *)view;
//+ (void)animationEaseOut:(UIView *)view;
//
//// 翻转
//+ (void)animationFlipFromLeft:(UIView *)view;
//+ (void)animationFlipFromRigh:(UIView *)view;
//
//// 翻页
//+ (void)animationCurlUp:(UIView *)view;
//+ (void)animationCurlDown:(UIView *)view;
//
//// push
//+ (void)animationPushUp:(UIView *)view;
//+ (void)animationPushDown:(UIView *)view;
//+ (void)animationPushLeft:(UIView *)view;
//+ (void)animationPushRight:(UIView *)view;
//
//// move
//+ (void)animationMoveUp:(UIView *)view duration:(CFTimeInterval)duration;
//+ (void)animationMoveDown:(UIView *)view duration:(CFTimeInterval)duration;
+ (void)animationMoveLeft:(UIImageView *)view1 duration:(CFTimeInterval)duration endPoint:(CGFloat)endPoint rank:(NSString *)rank;
//+ (void)animationMoveRight:(UIView *)view duration:(CFTimeInterval)duration;
//
//// 旋转缩放
//
//// 各种旋转缩放效果
//+ (void)animationRotateAndScaleEffects:(UIView *)view;
//
//// 旋转同时缩小放大效果
//+ (void)animationRotateAndScaleDownUp:(UIView *)view;

@end
