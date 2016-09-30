//
//  XLFormView.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "XLFormView.h"
#import "XLFormViewQuickBuilder.h"
#import "BaseTextField.h"
@interface XLFormView ()<UITextFieldDelegate>
{
    NSInteger rowCount;
    NSInteger columnCount;
}
@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, strong) XLFormViewQuickBuilder *builder;
@property (nonatomic, strong) NSMutableArray *arr;
@property (nonatomic, strong) BaseTextField *btf;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) NSMutableArray *textFieldArray;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@end

@implementation XLFormView
- (NSMutableArray *)textFieldArray
{
    if (!_textFieldArray) {
        self.textFieldArray = [NSMutableArray array];
    }
    return _textFieldArray;
}
- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        self.buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}
- (NSMutableArray *)arr
{
    if (!_arr) {
        self.arr = [NSMutableArray array];
    }
    return _arr;
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];

     rowCount = [self.dataSource numberOfRowsInFormView:self];
     columnCount = [self.dataSource formViewColumnsInRow:self];
    CGFloat y = 0.f;
    CGFloat lwidth = 0.f;
    CGFloat lheight = 0.f;
    UIColor *borderColor = nil;
    UIImage *backImage = nil;
    UIColor *titleColor = nil;
    UIFont *font = nil;
    
    for (NSInteger i = 0; i < rowCount; i++) {
        CGFloat height = 20;
        if ([self.dataSource respondsToSelector:@selector(formView:heightForRow:)]) {
            height = [self.dataSource formView:self heightForRow:i];
        }
        CGFloat x = 0.f;
        NSMutableArray *sTextFieldArr = [NSMutableArray array];
        NSMutableArray *sButtonArr = [NSMutableArray array];
        for (NSInteger j = 0; j < columnCount; j++) {
            CGFloat width = [self.dataSource formView:self widthForColumn:j];
            if ([self getC:j]) {
                self.btf = [[BaseTextField alloc] initWithFrame:CGRectMake(x, y, width, height)];
                //                btn.delegate = self;
                self.btf.keyboardType = UIKeyboardTypeNumberPad;
                [_btf addTarget:self action:@selector(textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
                if ([self.dataSource respondsToSelector:@selector(formView:colorOfColumn:inRow:)]) {
                    UIColor *bgColor = [self.dataSource formView:self colorOfColumn:j inRow:i];
                    if (bgColor == nil) {
                        if (i == 0) {
                            backImage = [UIImage imageFromColor:[self colorWithHexString:@"dce6f3"]];
                        }else if (i % 2) {
                            backImage = [UIImage imageFromColor:[self colorWithHexString:@"f7fbff"]];
                        }else{
                            backImage = [UIImage imageFromColor:[self colorWithHexString:@"f0f7fe"]];
                        }
                    }else{
                        backImage = [UIImage imageFromColor:bgColor];
                    }
                }else{
                    if (i == 0) {
                        backImage = [UIImage imageFromColor:[self colorWithHexString:@"dce6f3"]];
                    }else if (i % 2) {
                        backImage = [UIImage imageFromColor:[self colorWithHexString:@"f7fbff"]];
                    }else{
                        backImage = [UIImage imageFromColor:[self colorWithHexString:@"f0f7fe"]];
                    }
                }
                self.btf.background = backImage;
                //                [btn setBackgroundImage:backImage forState:UIControlStateNormal];
                if ([self.dataSource respondsToSelector:@selector(formViewBorderColor:)]) {
                    borderColor = [self.dataSource formViewBorderColor:self];
                }else{
                    borderColor = [UIColor colorWithWhite:0.9 alpha:1.000];
                }
                [self.btf.layer setBorderColor:borderColor.CGColor];
                BOOL action = NO;
                if ([self.dataSource respondsToSelector:@selector(formView:addActionForColumn:inRow:)]) {
                    action = [self.dataSource formView:self addActionForColumn:j inRow:i];
                }
                
                self.btf.text = [self.dataSource formView:self textForColumn:j inRow:i];
                if ([self.dataSource respondsToSelector:@selector(formView:contentColorOfColumn:inRow:)]) {
                    titleColor = [self.dataSource formView:self contentColorOfColumn:j inRow:i];
                }
                if (titleColor == nil)
                {
                    if (action) {
                        titleColor = [self colorWithHexString:@"3e98b5"];
                    }else{
                        titleColor = [UIColor colorWithRed:75/255.f green:55/255.f blue:39/255.f alpha:1.0];
                    }
                }
                self.btf.textColor = titleColor;
                if ([self.dataSource respondsToSelector:@selector(formViewFontOfContent:)]) {
                    font = [self.dataSource formViewFontOfContent:self];
                }else{
                    font = [UIFont systemFontOfSize:12];
                }
                [self.btf setFont:font];
                //                CGFloat textWidth = [btn.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.width;
                self.btf.textAlignment = NSTextAlignmentCenter;
                if (self.mode == XLFormViewModeLeft) {
                    self.btf.textAlignment = NSTextAlignmentLeft;
                }else if (self.mode == XLFormViewModeRight) {
                    self.btf.textAlignment = NSTextAlignmentRight;
                }
                
                
                [self.btf.layer setBorderWidth:0.5];
                self.btf.tag = 10000 + i * 100 + j;
                [self addSubview:self.btf];
                
                if (action) {
                    //                    [btn addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
                }else{
                    self.btf.userInteractionEnabled = NO;
                }
                x += width;
                lwidth = x;
                [sTextFieldArr addObject:self.btf];
            }else
            {
                self.btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
                
                if ([self.dataSource respondsToSelector:@selector(formView:colorOfColumn:inRow:)]) {
                    UIColor *bgColor = [self.dataSource formView:self colorOfColumn:j inRow:i];
                    if (bgColor == nil) {
                        if (i == 0) {
                            backImage = [UIImage imageFromColor:[self colorWithHexString:@"dce6f3"]];
                        }else if (i % 2) {
                            backImage = [UIImage imageFromColor:[self colorWithHexString:@"f7fbff"]];
                        }else{
                            backImage = [UIImage imageFromColor:[self colorWithHexString:@"f0f7fe"]];
                        }
                    }else{
                        backImage = [UIImage imageFromColor:bgColor];
                    }
                }else{
                    if (i == 0) {
                        backImage = [UIImage imageFromColor:[self colorWithHexString:@"dce6f3"]];
                    }else if (i % 2) {
                        backImage = [UIImage imageFromColor:[self colorWithHexString:@"f7fbff"]];
                    }else{
                        backImage = [UIImage imageFromColor:[self colorWithHexString:@"f0f7fe"]];
                    }
                }
                [self.btn setBackgroundImage:backImage forState:UIControlStateNormal];
                [self.btn setBackgroundImage:[backImage imageByApplyingAlpha:0.4] forState:UIControlStateHighlighted];
                
                if ([self.dataSource respondsToSelector:@selector(formViewBorderColor:)]) {
                    borderColor = [self.dataSource formViewBorderColor:self];
                }else{
                    borderColor = [UIColor colorWithWhite:0.9 alpha:1.000];
                }
                [self.btn.layer setBorderColor:borderColor.CGColor];
                
                BOOL action = NO;
                if ([self.dataSource respondsToSelector:@selector(formView:addActionForColumn:inRow:)]) {
                    action = [self.dataSource formView:self addActionForColumn:j inRow:i];
                }
                
                if ([self.dataSource respondsToSelector:@selector(formView:contentColorOfColumn:inRow:)]) {
                    titleColor = [self.dataSource formView:self contentColorOfColumn:j inRow:i];
                }
                if (titleColor == nil)
                {
                    if (action) {
                        titleColor = [self colorWithHexString:@"3e98b5"];
                    }else{
                        titleColor = [UIColor colorWithRed:75/255.f green:55/255.f blue:39/255.f alpha:1.0];
                    }
                }
                [self.btn setTitleColor:titleColor forState:UIControlStateNormal];
                [self.btn setTitleColor:[titleColor colorWithAlphaComponent:0.4f] forState:UIControlStateHighlighted];
                
                [self.btn setTitle:[self.dataSource formView:self textForColumn:j inRow:i] forState:UIControlStateNormal];
                
                if ([self.dataSource respondsToSelector:@selector(formViewFontOfContent:)]) {
                    font = [self.dataSource formViewFontOfContent:self];
                }else{
                    font = [UIFont systemFontOfSize:12];
                }
                [self.btn.titleLabel setFont:font];
                CGFloat textWidth = [self.btn.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size.width;
                if (self.mode == XLFormViewModeLeft) {
                    self.btn.titleEdgeInsets = UIEdgeInsetsMake(0, self.margin, 0, width - self.margin - textWidth);
                }else if (self.mode == XLFormViewModeRight) {
                    self.btn.titleEdgeInsets = UIEdgeInsetsMake(0, width - self.margin - textWidth, 0, self.margin);
                }
                
                
                [self.btn.layer setBorderWidth:0.5];
                self.btn.tag = 10000 + i * 100 + j;
                [self addSubview:self.btn];
                
                if (action) {
                    [self.btn addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
                }else{
                    self.btn.userInteractionEnabled = NO;
                }
                x += width;
                lwidth = x;
                [sButtonArr addObject:self.btn];
            }
            
        }
        [self.buttonArray addObject:sButtonArr];
        [self.textFieldArray addObject:sTextFieldArr];
        y += height;
        lheight = y;
    }
    self.frame = (CGRect){self.frame.origin , CGSizeMake(lwidth, lheight)};
    if ([self.dataSource respondsToSelector:@selector(formViewViewForFooter:)]) {
        UIView *view = [self.dataSource formViewViewForFooter:self];
        if (view) {
            view.layer.borderWidth = 0.5f;
            view.layer.borderColor = borderColor.CGColor;
            view.frame = (CGRect){{0,self.frame.size.height},{self.frame.size.width,view.frame.size.height}};
            [self addSubview:view];
            self.frame = (CGRect){self.frame.origin,CGSizeMake(self.frame.size.width, self.frame.size.height + view.bounds.size.height)};
        }
    }
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = 1.f;
    if (self.thickBorder) {
        
    }
}
- (void)textFieldEditChanged:(UITextField *)textField
{

    NSInteger dTag = (textField.tag - 10000) / 100;
    NSDictionary *dic = @{@"index":[NSString stringWithFormat:@"%ld",(long)dTag],@"title":textField.text};
    if (self.arr.count == 0) {
        [self.arr addObject:dic];
    }else
    {
        for (int i = 0; i < _arr.count; i++) {
            NSDictionary *dict = _arr[i];
            if ([dict[@"index"] isEqualToString:dic[@"index"]]) {
                [self.arr removeObject:dict];
                [self.arr addObject:dic];
            }else
            {
                [self.arr addObject:dic];
            }
        }
    }
    [self.dataSource getEditArray:self.arr formView:self];
}

- (void)reloadExcelData
{
    for (int i = 0; i < rowCount; i++) {
        NSMutableArray *acc = [self.buttonArray objectAtIndex:i];
        for (int j = 0; j < columnCount; j++) {
            
            if ([self getC:j]) {
               
                
            }else
            {
                UIButton *button = [acc objectAtIndex:j];
                [button setTitle:[self.dataSource formView:self textForColumn:j inRow:i] forState:UIControlStateNormal];
            }
        }
    }
}
- (void)clearTextInputData
{
    for (int i = 0; i < rowCount; i++) {
        NSMutableArray *acc = [self.textFieldArray objectAtIndex:i];
        for (int j = 0; j < columnCount; j++) {
            
            if ([self getC:j]) {
                
                BaseTextField *text = [acc objectAtIndex:0];
                text.text = @"";
            }else
            {
                
            }
        }
    }

}
- (BOOL)getC:(NSInteger)column
{
    return [self.dataSource getColumn:column];
}
- (void)itemClicked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(formView:didSelectColumn:inRow:)]) {
        NSInteger row = (sender.tag - 10000) / 100;
        NSInteger col = (sender.tag - 10000) - row * 100;
        [self.delegate formView:self didSelectColumn:col inRow:row];
    }
}

- (void)setMode:(XLFormViewMode)mode withMargin:(CGFloat)margin
{
    _mode = mode;
    _margin = margin;
}

- (UIColor *)colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

- (void)setDataSource:(id<XLFormViewDataSource>)dataSource
{
    NSAssert(![_dataSource isKindOfClass:[XLFormViewQuickBuilder class]], @"您已使用QuickBuilder创建，不可设置dataSource");
    if ([dataSource isKindOfClass:[XLFormViewQuickBuilder class]]) {
        self.builder = (XLFormViewQuickBuilder *)dataSource;
    }
    _dataSource = dataSource;
}

- (UIButton *)itemAtColumn:(NSInteger)column inRow:(NSInteger)row
{
    return (UIButton *)[self viewWithTag:10000 + row * 100 + column];
}
@end

@interface UIImage ()
- (CGImageRef)newBorderMask:(NSUInteger)borderSize size:(CGSize)size;
@end

@implementation UIImage (Alpha)

- (BOOL)hasAlpha
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(self.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}

- (UIImage *)imageWithAlpha
{
    if ([self hasAlpha]) {
        return self;
    }
    
    CGImageRef imageRef = self.CGImage;
    size_t width = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    
    // The bitsPerComponent and bitmapInfo values are hard-coded to prevent an "unsupported parameter combination" error
    CGContextRef offscreenContext = CGBitmapContextCreate(NULL,
                                                          width,
                                                          height,
                                                          8,
                                                          0,
                                                          CGImageGetColorSpace(imageRef),
                                                          kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst);
    
    // Draw the image into the context and retrieve the new image, which will now have an alpha layer
    CGContextDrawImage(offscreenContext, CGRectMake(0, 0, width, height), imageRef);
    CGImageRef imageRefWithAlpha = CGBitmapContextCreateImage(offscreenContext);
    UIImage *imageWithAlpha = [UIImage imageWithCGImage:imageRefWithAlpha];
    
    // Clean up
    CGContextRelease(offscreenContext);
    CGImageRelease(imageRefWithAlpha);
    
    return imageWithAlpha;
}

- (UIImage *)transparentBorderImage:(NSUInteger)borderSize
{
    // If the image does not have an alpha layer, add one
    UIImage *image = [self imageWithAlpha];
    
    CGRect newRect = CGRectMake(0, 0, image.size.width + borderSize * 2, image.size.height + borderSize * 2);
    
    // Build a context that's the same dimensions as the new size
    CGContextRef bitmap = CGBitmapContextCreate(NULL,
                                                newRect.size.width,
                                                newRect.size.height,
                                                CGImageGetBitsPerComponent(self.CGImage),
                                                0,
                                                CGImageGetColorSpace(self.CGImage),
                                                CGImageGetBitmapInfo(self.CGImage));
    
    // Draw the image in the center of the context, leaving a gap around the edges
    CGRect imageLocation = CGRectMake(borderSize, borderSize, image.size.width, image.size.height);
    CGContextDrawImage(bitmap, imageLocation, self.CGImage);
    CGImageRef borderImageRef = CGBitmapContextCreateImage(bitmap);
    
    // Create a mask to make the border transparent, and combine it with the image
    CGImageRef maskImageRef = [self newBorderMask:borderSize size:newRect.size];
    CGImageRef transparentBorderImageRef = CGImageCreateWithMask(borderImageRef, maskImageRef);
    UIImage *transparentBorderImage = [UIImage imageWithCGImage:transparentBorderImageRef];
    
    // Clean up
    CGContextRelease(bitmap);
    CGImageRelease(borderImageRef);
    CGImageRelease(maskImageRef);
    CGImageRelease(transparentBorderImageRef);
    
    return transparentBorderImage;
}

#pragma mark - Private helper methods

- (CGImageRef)newBorderMask:(NSUInteger)borderSize size:(CGSize)size
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    
    // Build a context that's the same dimensions as the new size
    CGContextRef maskContext = CGBitmapContextCreate(NULL,
                                                     size.width,
                                                     size.height,
                                                     8, // 8-bit grayscale
                                                     0,
                                                     colorSpace,
                                                     kCGBitmapByteOrderDefault | kCGImageAlphaNone);
    
    // Start with a mask that's entirely transparent
    CGContextSetFillColorWithColor(maskContext, [UIColor blackColor].CGColor);
    CGContextFillRect(maskContext, CGRectMake(0, 0, size.width, size.height));
    
    // Make the inner part (within the border) opaque
    CGContextSetFillColorWithColor(maskContext, [UIColor whiteColor].CGColor);
    CGContextFillRect(maskContext, CGRectMake(borderSize, borderSize, size.width - borderSize * 2, size.height - borderSize * 2));
    
    // Get an image of the context
    CGImageRef maskImageRef = CGBitmapContextCreateImage(maskContext);
    
    // Clean up
    CGContextRelease(maskContext);
    CGColorSpaceRelease(colorSpace);
    
    return maskImageRef;
}

- (UIImage *)imageByApplyingAlpha:(CGFloat) alpha
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageFromColor:(UIColor *)color
{
    CGSize size = CGSizeMake(20, 20);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, (CGRect){CGPointZero,size});
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
