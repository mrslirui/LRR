//
//  StoreBaskCollectionViewCell.m
//  PMSC
//
//  Created by 杨晓龙 on 16/9/21.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "StoreBaskCollectionViewCell.h"

@implementation StoreBaskCollectionViewCell
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
    [self.contentView addSubview:self.imgView];
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    self.imgView.frame = CGRectMake(0, 0, 167 * kScreenWidth, 113 * kScreenWidth);
}
@end
