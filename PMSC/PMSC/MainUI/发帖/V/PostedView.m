//
//  PostedView.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PostedView.h"
#define leftSpacing 19
@implementation PostedView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self load];
    }
    return self;
}
- (void)load
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(leftSpacing * kScreenWidth, 0, 28 * 2 * kScreenWidth, 86 * kScreenWidth)];
    label.text = @"标题";
    label.font = [UIFont systemFontOfSize:27 * kScreenWidth];
    label.textColor = kHexColor(0x313131);
    [self addSubview:label];
    
    self.titleField = [[BaseTextField alloc] initWithFrame:CGRectMake(112 * kScreenWidth, 0, 500 * kScreenWidth, 86 * kScreenWidth)];
    self.titleField.font = [UIFont systemFontOfSize:27 * kScreenWidth];
    self.titleField.placeholder = @"输入发帖标题";
    [self addSubview:_titleField];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleField.frame), self.frame.size.width, 0.5)];
    view.backgroundColor = [UIColor colorWithRed:0.8902 green:0.8902 blue:0.8902 alpha:1.0];
    [self addSubview:view];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(leftSpacing * kScreenWidth, CGRectGetMaxY(view.frame) + 31 * kScreenWidth, 56 * kScreenWidth, 28 * kScreenWidth)];
    label1.font = [UIFont systemFontOfSize:27 * kScreenWidth];
    label.textColor = kHexColor(0x313131);
    label1.text = @"图片";
    [self addSubview:label1];
    
    self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"矩形-1-副本-2@3x"]];
    self.imgView.frame = CGRectMake(112 * kScreenWidth, CGRectGetMaxY(view.frame) + 33 * kScreenWidth, 241 * kScreenWidth, 173 * kScreenWidth);
    self.imgView.userInteractionEnabled = YES;
    [self addSubview:_imgView];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imgView.frame) + 38 * kScreenWidth, self.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:0.8902 green:0.8902 blue:0.8902 alpha:1.0];
    [self addSubview:line];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(leftSpacing * kScreenWidth, CGRectGetMaxY(line.frame) + 31 * kScreenWidth, 56 * kScreenWidth, 28 * kScreenWidth)];
    label2.text = @"内容";
    label2.font = [UIFont systemFontOfSize:27 * kScreenWidth];
    label2.textColor = kHexColor(0x313131);
    [self addSubview:label2];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.imgView.frame), CGRectGetMaxY(line.frame) + 23 * kScreenWidth, 500 * kScreenWidth, 213 * kScreenWidth)];
    self.textView.font = [UIFont systemFontOfSize:24 * kScreenWidth];
    self.textView.textColor = [UIColor lightGrayColor];
    self.textView.text = @"输入你想说的内容……";
    [self addSubview:self.textView];
    self.textView.layer.borderColor = [UIColor colorWithRed:0.8902 green:0.8902 blue:0.8902 alpha:1.0].CGColor;
    self.textView.layer.borderWidth = 0.5;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
