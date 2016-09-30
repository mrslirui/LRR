//
//  XLFormViewQuickBuilder.h
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XLFormView.h"

extern NSString *const noAction;
extern NSString *const noColor;

@interface XLFormViewQuickBuilder : NSObject
- (XLFormView *)startCreatWithWidths:(NSArray *)widths startPoint:(CGPoint)point;

- (void)setTextColor:(UIColor *)tcolor backgroundColor:(UIColor *)bcolor forRow:(NSInteger)row;

- (void)setBorderColor:(UIColor *)color;

- (void)setActionTarget:(id)target;

- (void)addRecord:(NSArray *)record SELNames:(NSArray *)SELs;

- (void)addRecord:(NSArray *)record;

- (NSString *)valueAtcolumn:(NSInteger)column InRow:(NSInteger)row;
@end
