//
//  ShowCollectionViewCell.m
//  yasin
//
//  Created by 杨晓龙 on 16/5/27.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "ShowCollectionViewCell.h"

@implementation ShowCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgView = [UIImageView new];
        [self.contentView addSubview:_imgView];
        _imgView.backgroundColor = [UIColor greenColor];
        self.title = [UILabel new];
        [self.contentView addSubview:_title];
        _title.textColor = kHexColor(0x616161);
        self.total = [UILabel new];
        [self.contentView addSubview:_total];
        _total.textColor = kHexColor(0xa1a1a1);
        self.valueLb = [UILabel new];
        [self.contentView addSubview:_valueLb];
        _valueLb.textColor = kHexColor(0xff5230);
      
        self.quantityImg =[UIImageView new];
        [self.contentView addSubview:_quantityImg];
        _quantityImg.image = [ UIImage imageNamed:@"r_frame_ios"];
       
        self.quantity = [UILabel new];
        [self.contentView addSubview:_quantity];
        _quantity.textAlignment = NSTextAlignmentCenter;
        _quantity.font = [UIFont systemFontOfSize:30 *kScreenWidth];
        
        self.buttonSubtract = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_buttonSubtract setImage:[UIImage imageNamed:@"图层-25-副本@3x"] forState:0];
        [self.contentView addSubview:_buttonSubtract];
        _total.font = [UIFont systemFontOfSize:30*kScreenWidth];
        _title.font = [UIFont systemFontOfSize:30*kScreenWidth];
        _valueLb.font = [UIFont systemFontOfSize:30*kScreenWidth];
        self.buttonAdd = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_buttonAdd setImage:[UIImage imageNamed:@"图层-26-副本@3x"] forState:0];
        [self.contentView addSubview:_buttonAdd];
        
        _quantity.layer.borderWidth = 1;
        _quantity.layer.borderColor = kHexColor(0xdedede).CGColor;
        
    }
    return self;
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    _imgView.frame = CGRectMake((layoutAttributes.size.width -220 *kScreenHeight)/2, 20*kScreenHeight, 220*kScreenHeight, 220 *kScreenHeight);
    _title.frame = CGRectMake(19*kScreenWidth, _imgView.bottom + 20*kScreenHeight,layoutAttributes.size.width- 40*kScreenHeight, 30*kScreenHeight);
    _total.frame = CGRectMake(_title.left, _title.bottom+ 10*kScreenHeight , _title.size.width, 30*kScreenHeight);
    _valueLb.frame = CGRectMake(_title.left, _total.bottom+ 10*kScreenHeight, _total.size.width, 30*kScreenHeight);
//    _buttonSubtract.sd_layout
//    .topSpaceToView(self.valueLb,34 *kScreenHeight)
//    .leftSpaceToView(self.contentView,80 *kScreenWidth)
//    .widthIs(89 *kScreenHeight)
//    .heightIs(63 *kScreenHeight);
//    _quantityImg.sd_layout
//    .topSpaceToView(self.valueLb,34 *kScreenHeight)
//    .leftSpaceToView(_buttonSubtract,-1*kScreenWidth)
//    .widthIs(104 *kScreenHeight)
//    .heightIs(43 *kScreenHeight);
//    
//    _quantity.sd_layout
//    .topSpaceToView(self.valueLb,44 *kScreenHeight)
//    .leftSpaceToView(_buttonSubtract,-18*kScreenWidth)
//    .widthIs(75 *kScreenHeight)
//    .heightIs(43 *kScreenHeight);
//
//    _buttonAdd.sd_layout
//    .topSpaceToView(self.valueLb,34 *kScreenHeight)
//    .leftSpaceToView(_quantity,-18 *kScreenWidth)
//    .widthIs(89 *kScreenHeight)
//    .heightIs(63 *kScreenHeight);
    
    _buttonSubtract.sd_layout
    .topSpaceToView(self.valueLb,34 *kScreenHeight)
    .leftSpaceToView(self.contentView,60 *kScreenWidth)
    .widthIs(60 *kScreenHeight)
    .heightIs(43 *kScreenHeight);
    
    
    _quantityImg.sd_layout
    .topSpaceToView(self.valueLb,34 *kScreenHeight)
    .leftSpaceToView(_buttonSubtract,-2*kScreenWidth)
    .widthIs(104 *kScreenHeight)
    .heightIs(43 *kScreenHeight);
    _quantity.sd_layout
    .topEqualToView(_quantityImg)
    .leftEqualToView(_quantityImg)
    .widthRatioToView(_quantityImg,1)
    .heightRatioToView(_quantityImg,1);
    
    _buttonAdd.sd_layout
    .topSpaceToView(self.valueLb,34 *kScreenHeight)
    .leftSpaceToView(_quantityImg,-2 *kScreenWidth)
    .widthIs(60 *kScreenHeight)
    .heightIs(43 *kScreenHeight);

    
}

@end
