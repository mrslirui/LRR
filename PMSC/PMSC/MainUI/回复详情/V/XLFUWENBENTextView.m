//
//  XLFUWENBENTextView.m
//  富文本带点击事件
//
//  Created by 杨晓龙 on 16/8/19.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "XLFUWENBENTextView.h"
#define Font 14

@interface XLFUWENBENTextView ()<UITextViewDelegate>
@property (nonatomic, strong) NSArray *arr;
@end

@implementation XLFUWENBENTextView


- (void)getFuwenbenWithText:(NSString *)text rangOfstring:(NSArray *)pattran color:(UIColor *)color highColor:(UIColor *)highColor
{
    self.editable = NO;
    self.scrollEnabled = NO;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    self.arr = pattran;
    for (NSString *con in pattran) {
        
        [attributedString addAttribute:NSLinkAttributeName
                                 value:[NSString stringWithFormat:@"%@://",[[[self class] transform:[con substringWithRange:NSMakeRange(0, con.length)]] stringByReplacingOccurrencesOfString:@" " withString:@""]]
                                 range:[[attributedString string] rangeOfString:con]];
    }
    
    

    CGSize size = CGSizeMake(Font + 2, Font + 2);
    UIGraphicsBeginImageContextWithOptions(size, false, 0);
 
    UIImage *resizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = resizeImage;
//    NSMutableAttributedString *imageString = [NSMutableAttributedString attributedStringWithAttachment:textAttachment];
//    [imageString addAttribute:NSLinkAttributeName
//                        value:@"checkbox://"
//                        range:NSMakeRange(0, imageString.length)];
//    [attributedString insertAttributedString:imageString atIndex:0];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:Font] range:NSMakeRange(0, attributedString.length)];
    
    self.attributedText = attributedString;
    self.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor],NSUnderlineColorAttributeName: [UIColor lightGrayColor],NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    
    self.delegate = self;
    self.editable = NO;        //必须禁止输入，否则点击将弹出输入键盘
    self.scrollEnabled = NO;

}
+ (NSString *)transform:(NSString *)string
{
    
    /*复制出一个可变的对象*/
    NSMutableString *preString = [string mutableCopy];
    /*转换成成带音 调的拼音*/
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformMandarinLatin, NO);
    /*去掉音调*/
    CFStringTransform((CFMutableStringRef)preString, NULL, kCFStringTransformStripDiacritics, NO);
    
    /*多音字处理*/
    if ([[(NSString *)string substringToIndex:1] compare:@"长"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 5) withString:@"chang"];
    }
    if ([[(NSString *)string substringToIndex:1] compare:@"沈"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 4) withString:@"shen"];
    }
    if ([[(NSString *)string substringToIndex:1] compare:@"厦"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 3) withString:@"xia"];
    }
    if ([[(NSString *)string substringToIndex:1] compare:@"地"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 3) withString:@"di"];
    }
    if ([[(NSString *)string substringToIndex:1] compare:@"重"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 5) withString:@"chong"];
    }
    if ([(NSString *)string compare:@"建行"] == NSOrderedSame)
    {
        [preString replaceCharactersInRange:NSMakeRange(0, 8) withString:@"jianhang"];
    }
    
    return preString;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {

    for (NSString *s in self.arr) {
        NSString *s1 = [[[self class] transform:[s substringWithRange:NSMakeRange(0, s.length)]] stringByReplacingOccurrencesOfString:@" " withString:@""];
        if ([[URL scheme] isEqualToString:s1]) {
            [self.dele didSelectText:s];
            return NO;
        }
    }
        return YES;
}

@end
