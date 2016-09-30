//
//  PostShaidanView.m
//  PMSC
//
//  Created by 李锐 on 16/9/6.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PostShaidanView.h"
#define leftSpacing 19

@implementation PostShaidanView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self load];
    }
    return self;
}
-(void)load
{

    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(leftSpacing * kScreenWidth,  40*kScreenHeight, 56 * kScreenWidth, 28 * kScreenWidth)];
    label2.text = @"内容";
    label2.font = [UIFont systemFontOfSize:27 * kScreenWidth];
    label2.textColor = kHexColor(0x313131);
    [self addSubview:label2];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(label2.right +20*kScreenWidth, label2.top, 500 * kScreenWidth, 213 * kScreenWidth)];
    self.textView.font = [UIFont systemFontOfSize:24 * kScreenWidth];
    self.textView.textColor = [UIColor lightGrayColor];
    self.textView.text = @"输入你想说的内容……";
    [self addSubview:self.textView];
    self.textView.layer.borderColor = [UIColor colorWithRed:0.8902 green:0.8902 blue:0.8902 alpha:1.0].CGColor;
    self.textView.layer.borderWidth = 0.5;
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, _textView.bottom + 35 * kScreenWidth, self.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:0.8902 green:0.8902 blue:0.8902 alpha:1.0];
    [self addSubview:line];

    
UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(leftSpacing * kScreenWidth, line.bottom, 28 * 2 * kScreenWidth, 86 * kScreenWidth)];
label1.font = [UIFont systemFontOfSize:27 * kScreenWidth];
label1.textColor = kHexColor(0x313131);
label1.text = @"图片";
[self addSubview:label1];

//self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"矩形-1-副本-2@3x"]];
//self.imgView.frame = CGRectMake(112 * kScreenWidth, line.bottom+ 33 * kScreenWidth, 241 * kScreenWidth, 173 * kScreenWidth);
//self.imgView.userInteractionEnabled = YES;
//[self addSubview:_imgView];




}
@end
