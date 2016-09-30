//
//  XLToast.h
//  XLToast
//
//  Created by 杨晓龙 on 16/8/28.
//  Copyright © 2016年 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface XLToast : NSObject
#pragma mark 中间显示
/**
 *  中间显示
 *
 *  @param text 内容
 */
+ (void)showCenterWithText:(NSString *)text;
/**
 *  中间显示+自定义停留时间
 *
 *  @param text      内容
 *  @param duration  停留时间
 */
+ (void)showCenterWithText:(NSString *)text duration:(CGFloat)duration;

#pragma mark 上方显示
/**
 *  上方显示
 *
 *  @param text  内容
 */
+ (void)showTopWithText:(NSString *)text;
/**
 *  上方显示＋自定义停留时间
 *
 *  @param text       内容
 *  @param duration   停留时间
 */
+ (void)showTopWithText:(NSString *)text duration:(CGFloat)duration;
/**
 *  上方显示＋自定义距顶端距离
 *
 *  @param text       内容
 *  @param topOffset  到顶端距离
 */
+ (void)showTopWithText:(NSString *)text topOffset:(CGFloat)topOffset;
/**
 *  上方显示＋自定义距上方距离＋ 停留时间
 *
 *  @param text        内容
 *  @param topOffset   到顶端距离
 *  @param duration    停留时间
 */
+ (void)showTopWithText:(NSString *)text topOffset:(CGFloat)topOffset duration:(CGFloat)duration;
#pragma mark 下方显示
/**
 *  下方显示
 * 
 *  @param text  内容
 */
+ (void)showBottomWithText:(NSString *)text;
/**
 *  下方显示＋自定义停留时间
 *
 *  @param text     内容
 *  @param duration 停留时间
 */
+ (void)showBottomWithText:(NSString *)text duration:(CGFloat)duration;
/**
 *  下方显示 ＋ 自定义距底端距离
 *
 *  @param text       内容
 *  @param topOffset  距底端距离
 */
+ (void)showBottomWithText:(NSString *)text bottomOffset:(CGFloat)bottomOffset;
/**
 *  下方显示 ＋ 自定义距底端距离 ＋ 自定义停留时间
 *
 *  @param text       内容
 *  @param topOffset  距底端的距离
 *  @param duration   停留时间
 */
+ (void)showBottomWithText:(NSString *)text bottomOffset:(CGFloat)bottomOffset duration:(CGFloat)duration;
@end
