//
//  XLFormViewQuickBuilder.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "XLFormViewQuickBuilder.h"
NSString *const noAction = @"no_action";
NSString *const noColor = @"no_color";

@interface XLFormViewQuickBuilder () <XLFormViewDataSource,XLFormViewDelegate>
@property (nonatomic, strong) XLFormView *formView;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) NSMutableArray *records;
@property (nonatomic, strong) NSMutableArray *actions;
@property (nonatomic, strong) NSMutableArray *bgColors;
@property (nonatomic, strong) NSMutableArray *textColors;
@property (nonatomic, strong) NSMutableArray *widths;
@property (nonatomic, strong) id target;
@end

@implementation XLFormViewQuickBuilder

- (XLFormView *)formView
{
    if (!_formView) {
        _formView = [[XLFormView alloc] init];
        _formView.dataSource = self;
        _formView.delegate = self;
    }
    return _formView;
}

- (XLFormView *)startCreatWithWidths:(NSArray *)widths startPoint:(CGPoint)point
{
    self.widths = [widths mutableCopy];
    self.formView.frame = CGRectOffset(self.formView.frame, point.x, point.y);
    return self.formView;
}

- (void)setTextColor:(UIColor *)tcolor backgroundColor:(UIColor *)bcolor forRow:(NSInteger)row
{
    NSString *info = [NSString stringWithFormat:@"您操作的第%ld行不存在，目前有%lu行",(long)row ,(unsigned long)self.records.count];
    NSAssert(row < self.records.count, info);
    
    if (!self.textColors) {
        self.textColors = [@[] mutableCopy];
        self.bgColors = [@[] mutableCopy];
    }
    if (row == self.textColors.count) { // 1   1
        [self.textColors addObject:tcolor];
    }else if (row > self.textColors.count) { // 2  1
        NSInteger margin = row - self.textColors.count;
        for (NSInteger i = 0; i < margin; i++) {
            [self.textColors addObject:noColor];
        }
        [self.textColors addObject:tcolor];
    }else{
        [self.textColors replaceObjectAtIndex:row withObject:tcolor];
    }
    
    if (row == self.bgColors.count) {
        [self.bgColors addObject:bcolor];
    }else if (row > self.bgColors.count) {
        NSInteger margin = row - self.bgColors.count;
        for (NSInteger i = 0; i < margin; i++) {
            [self.bgColors addObject:noColor];
        }
        [self.bgColors addObject:bcolor];
    }else{
        [self.bgColors replaceObjectAtIndex:row withObject:bcolor];
    }
}

- (void)setActionTarget:(id)target
{
    self.target = target;
}

- (void)setBorderColor:(UIColor *)color
{
    _borderColor = color;
}

- (void)addRecord:(NSArray *)record SELNames:(NSArray *)SELs
{
    if (!self.records) {
        self.records = [@[] mutableCopy];
        self.actions = [@[] mutableCopy];
    }
    [self.records addObject:record];
    [self.actions addObject:SELs];
}

- (void)addRecord:(NSArray *)record
{
    NSInteger count = record.count;
    NSMutableArray *temp = [@[] mutableCopy];
    for (NSInteger i = 0; i < count; i++) {
        [temp addObject:noAction];
    }
    [self addRecord:record SELNames:[temp mutableCopy]];
}

- (NSString *)valueAtcolumn:(NSInteger)column InRow:(NSInteger)row
{
    UIButton *btn = [self.formView itemAtColumn:column inRow:row];
    return btn.currentTitle;
}

# pragma mark - formView dataSource
- (NSInteger)numberOfRowsInFormView:(XLFormView *)formView
{
    return self.records.count;
}

- (NSInteger)formViewColumnsInRow:(XLFormView *)formView
{
    return [self.records.firstObject count];
}

- (NSString *)formView:(XLFormView *)formView textForColumn:(NSInteger)column inRow:(NSInteger)row
{
    return self.records[row][column];
}

- (UIColor *)formViewBorderColor:(XLFormView *)formView
{
    return self.borderColor;
}

- (UIColor *)formView:(XLFormView *)formView colorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    if ([self.bgColors[row] isKindOfClass:[NSString class]]) {
        return nil;
    }
    return self.bgColors[row];
}

- (UIColor *)formView:(XLFormView *)formView contentColorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    if ([self.textColors[row] isKindOfClass:[NSString class]]) {
        return nil;
    }
    return self.textColors[row];
}

- (BOOL)formView:(XLFormView *)formView addActionForColumn:(NSInteger)column inRow:(NSInteger)row
{
    if ([self.actions[row][column] isEqualToString:noAction]) {
        return NO;
    }else
    {
        return YES;
    }
}

- (CGFloat)formView:(XLFormView *)formView widthForColumn:(NSInteger)column
{
    return [self.widths[column] floatValue];
}

- (void)formView:(XLFormView *)formView didSelectColumn:(NSInteger)column inRow:(NSInteger)row
{
    if (![self.actions[row][column] isEqualToString:noAction]) {
        SEL sel= NSSelectorFromString(self.actions[row][column]);
        if ([self.target respondsToSelector:sel]) {
            UIButton *btn = [self.formView itemAtColumn:column inRow:row];
            [self.target performSelector:sel withObject:btn];
        }
    }
}
@end
