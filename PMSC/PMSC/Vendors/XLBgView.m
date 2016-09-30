//
//  XLBgView.m
//  SegmentControl封装
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 彭彬. All rights reserved.
//

#import "XLBgView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width / 720.
#define kScreenHeight [UIScreen mainScreen].bounds.size.height / 1280.
@implementation XLBgView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self load];
    }
    return self;
}
- (void)load
{
    self.imgView = [UIImageView new];
    self.imgView.frame = CGRectMake(20 * kScreenWidth, 23 * kScreenWidth, 28 * kScreenWidth, 16 * kScreenWidth);
    [self addSubview:_imgView];
    self.titleLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.imgView.frame) + 22 * kScreenWidth, 20 * kScreenWidth, 26 * kScreenWidth * 3, 26 * kScreenWidth)];
    self.titleLabel1.font = [UIFont systemFontOfSize:25 * kScreenWidth];
    [self addSubview:self.titleLabel1];
}
@end
