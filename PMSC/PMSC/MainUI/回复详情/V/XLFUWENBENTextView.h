//
//  XLFUWENBENTextView.h
//  富文本带点击事件
//
//  Created by 杨晓龙 on 16/8/19.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XLFuwenbenTextViewDelegate <NSObject>

- (void)didSelectText:(NSString *)text;

@end


@interface XLFUWENBENTextView : UITextView
@property (nonatomic, assign) id<XLFuwenbenTextViewDelegate> dele;
- (void)getFuwenbenWithText:(NSString *)text rangOfstring:(NSArray *)pattran color:(UIColor *)color highColor:(UIColor *)highColor;
@end
