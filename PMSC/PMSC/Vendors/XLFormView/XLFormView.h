//
//  XLFormView.h
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLFormView;

typedef NS_ENUM(NSInteger, XLFormViewMode)
{
    XLFormViewModeDefault,
    XLFormViewModeLeft,
    XLFormViewModeRight,
    XLFormViewModeMiddle,
};

@protocol XLFormViewDataSource <NSObject>
- (NSInteger)numberOfRowsInFormView:(XLFormView *)formView;
- (NSInteger)formViewColumnsInRow:(XLFormView *)formView;
- (CGFloat)formView:(XLFormView *)formView widthForColumn:(NSInteger)column;
- (NSString *)formView:(XLFormView *)formView textForColumn:(NSInteger)column inRow:(NSInteger)row;

@optional
- (CGFloat)formView:(XLFormView *)formView heightForRow:(NSInteger)row;
- (BOOL)getColumn:(NSInteger)column;
- (void)getEditArray:(NSArray *)editArray formView:(XLFormView *)formView;
- (UIColor *)formView:(XLFormView *)formView colorOfColumn:(NSInteger)column inRow:(NSInteger)row;
- (UIColor *)formView:(XLFormView *)formView contentColorOfColumn:(NSInteger)column inRow:(NSInteger)row;
- (UIColor *)formViewBorderColor:(XLFormView *)formView;
- (UIView *)formViewViewForFooter:(XLFormView *)formView;
- (UIFont *)formViewFontOfContent:(XLFormView *)formView;
- (BOOL)formView:(XLFormView *)formView addActionForColumn:(NSInteger)column inRow:(NSInteger)row;
@end
@protocol XLFormViewDelegate <NSObject>
@optional
- (void)formView:(XLFormView *)formView didSelectColumn:(NSInteger)column inRow:(NSInteger)row;
@end

@interface XLFormView : UIView
@property (nonatomic, weak) id<XLFormViewDataSource> dataSource;
@property (nonatomic, weak) id<XLFormViewDelegate> delegate;
@property (nonatomic, assign) BOOL thickBorder;
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, assign ,readonly) XLFormViewMode mode;
- (void)setMode:(XLFormViewMode)mode withMargin:(CGFloat)margin;
- (void)reloadExcelData;
- (void)clearTextInputData;
- (UIButton *)itemAtColumn:(NSInteger)column inRow:(NSInteger)row;
@end

@interface UIImage (XLFormView)
- (BOOL)hasAlpha;
- (UIImage *)imageWithAlpha;
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;
+ (UIImage *)imageFromColor:(UIColor *)color;
@end


