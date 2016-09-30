//
//  SignInCollectionViewCell.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SignInCollectionViewCell.h"

@implementation SignInCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self load];
    }
    return self;
}
- (void)load
{
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.dateLabel = [UILabel new];
    self.dateLabel.backgroundColor = kHexColor(0xeeeeee);
    self.dateLabel.textColor = [UIColor colorWithRed:0.5059 green:0.5059 blue:0.5059 alpha:1.0];
    self.dateLabel.text = @"07/11";
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.dateLabel];
    self.imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"矢量智能对象-副本-5@3x"]];
    [self.contentView addSubview:self.imgView];
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    self.dateLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), 44 * kScreenWidth);
    self.imgView.frame = CGRectMake(44 * kScreenWidth, CGRectGetMaxY(self.dateLabel.frame) + 22 * kScreenWidth, 63 * kScreenWidth, 58 * kScreenWidth);
    
}
@end
