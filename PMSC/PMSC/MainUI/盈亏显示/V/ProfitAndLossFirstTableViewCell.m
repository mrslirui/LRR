//
//  ProfitAndLossFirstTableViewCell.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/29.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ProfitAndLossFirstTableViewCell.h"

@implementation ProfitAndLossFirstTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self load];
    }
    return self;
}
- (void)load
{
    self.label1 = [UILabel new];
    self.label1.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.label1.textColor = kHexColor(0x646464);
    self.label1.text = @"期号";
    self.label1.backgroundColor = kHexColor(0xcacaca);
    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label1];
    self.label1.sd_layout
    .topSpaceToView(self.contentView,0)
    .leftSpaceToView(self.contentView,0)
    .widthIs(180 * kScreenWidth)
    .heightIs(72 *kScreenWidth);
    
    self.label2 = [UILabel new];
    self.label2.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.label2.textColor = kHexColor(0x646464);
    self.label2.text = @"投注数";
    self.label2.backgroundColor = kHexColor(0xcacaca);
    self.label2.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label2];
    self.label2.sd_layout
    .topSpaceToView(self.contentView,0)
    .leftSpaceToView(self.label1,1 * kScreenWidth)
    .widthIs(178 * kScreenWidth)
    .heightIs(72 *kScreenWidth);
    
    self.label3 = [UILabel new];
    self.label3.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.label3.textColor = kHexColor(0x646464);
    self.label3.text = @"盈亏金额";
    self.label3.backgroundColor = kHexColor(0xcacaca);
    self.label3.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label3];
    self.label3.sd_layout
    .topSpaceToView(self.contentView,0)
    .leftSpaceToView(self.label2,1 * kScreenWidth)
    .widthIs(360 * kScreenWidth)
    .heightIs(72 *kScreenWidth);
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
