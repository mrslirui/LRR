//
//  NewCollectionViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "NewCollectionViewCell.h"

@implementation NewCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kHexColor(0xffffff);

        self.imgView = [UIImageView new];
        [self.contentView addSubview:_imgView];
        _imgView.backgroundColor = [UIColor greenColor];
        self.title = [UILabel new];
        [self.contentView addSubview:_title];
        _title.textColor = kHexColor(0x313131);
        _title.font = [UIFont systemFontOfSize:30 *kScreenWidth];
        self.getPeople = [UILabel new];
        [self.contentView addSubview:_getPeople];
        self.getPeople.font = [UIFont systemFontOfSize:23*kScreenWidth];
        self.luckCode =[ UILabel new];
        [self.contentView addSubview:_luckCode];
        self.time =[ UILabel new];
        [self.contentView addSubview:_time];
        self.luckCode.font = [UIFont systemFontOfSize:23*kScreenWidth];
        self.time.font = [UIFont systemFontOfSize:23*kScreenWidth];
        _luckCode.textColor = kHexColor(0x616161);
        _time.textColor = kHexColor(0x616161);

    }
    return self;
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
  
    _imgView.frame = CGRectMake((layoutAttributes.size.width -220 *kScreenHeight)/2, 20*kScreenHeight, 220*kScreenHeight, 220 *kScreenHeight);
    _title.frame = CGRectMake(10*kScreenWidth, _imgView.bottom + 20*kScreenHeight,layoutAttributes.size.width- 20*kScreenHeight, 30*kScreenHeight);
    _getPeople .frame = CGRectMake(_title.left, _title.bottom +10*kScreenHeight, 362*kScreenWidth, 30*kScreenHeight);
    _luckCode.frame = CGRectMake(_title.left, _getPeople.bottom + 10*kScreenHeight, _getPeople.width, _getPeople.height);
    _time.frame = CGRectMake(_title.left, _luckCode.bottom + 10*kScreenHeight, _getPeople.width, _getPeople.height);
}
@end
