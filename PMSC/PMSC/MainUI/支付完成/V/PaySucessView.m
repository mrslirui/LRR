//
//  PaySucessView.m
//  PMSC
//
//  Created by 李锐 on 16/9/3.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PaySucessView.h"

@implementation PaySucessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self load];
    }
    return self;
}
- (void)load
{
    self.imgView = [UIImageView new];
    self.imgView.image = [UIImage imageNamed:@"支付完成"];
    [self addSubview:self.imgView];
        self.label = [UILabel new];
    self.label.textColor = kAppColor;
    self.label.text = @"支付完成";
    self.label.font = [UIFont systemFontOfSize:40 * kScreenWidth];
    [self addSubview:self.label];
   
    
    self.shopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.shopButton setBackgroundImage:[UIImage imageNamed:@"查看我的夺宝记录@3x"] forState:UIControlStateNormal];
    [self addSubview:self.shopButton];
    
    self.lookButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.lookButton setBackgroundImage:[UIImage imageNamed:@"返回首页@3x"] forState:UIControlStateNormal];
    [self addSubview:self.lookButton];
    
    
    
    self.imgView.sd_layout
    .topSpaceToView(self,121 * kScreenHeight)
    .leftSpaceToView(self,231 * kScreenWidth)
    .widthIs(308 * kScreenWidth)
    .heightIs(364 * kScreenWidth);
    
    
    self.label.sd_layout
    .topSpaceToView(self.imgView,60 * kScreenHeight)
    .leftSpaceToView(self,280 * kScreenWidth)
    .widthIs(40 * 4 * kScreenWidth)
    .heightIs(46 * kScreenWidth);
    
    self.shopButton.sd_layout
    .topSpaceToView(self.label,109 * kScreenHeight)
    .leftSpaceToView(self,19 * kScreenWidth)
    .widthIs(331 * kScreenWidth)
    .heightIs(72 * kScreenWidth);
    
    self.lookButton.sd_layout
    .topEqualToView(self.shopButton)
    .leftSpaceToView(self.shopButton,19 * kScreenWidth)
    .widthIs(331 * kScreenWidth)
    .heightIs(72 * kScreenWidth);
    
    
}

@end
