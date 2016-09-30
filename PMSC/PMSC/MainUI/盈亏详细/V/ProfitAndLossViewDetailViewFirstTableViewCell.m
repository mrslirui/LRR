//
//  ProfitAndLossViewDetailViewFirstTableViewCell.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/29.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ProfitAndLossViewDetailViewFirstTableViewCell.h"

@implementation ProfitAndLossViewDetailViewFirstTableViewCell
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
    self.label1.text = @"时间";
    self.label1.backgroundColor = kHexColor(0xcacaca);
    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label1];
    
    
    self.label2 = [UILabel new];
    self.label2.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.label2.textColor = kHexColor(0x646464);
    self.label2.text = @"期数";
    self.label2.backgroundColor = kHexColor(0xcacaca);
    self.label2.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label2];
    
    
    self.label3 = [UILabel new];
    self.label3.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.label3.textColor = kHexColor(0x646464);
    self.label3.text = @"开奖号码";
    self.label3.backgroundColor = kHexColor(0xcacaca);
    self.label3.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label3];
    
    self.label4 = [UILabel new];
    self.label4.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.label4.textColor = kHexColor(0x646464);
    self.label4.text = @"冠亚";
    self.label4.backgroundColor = kHexColor(0xcacaca);
    self.label4.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label4];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.label1.frame = CGRectMake(0, 0, 125 * kScreenWidth, 75 * kScreenWidth);
    self.label2.frame = CGRectMake(CGRectGetMaxX(self.label1.frame) + 1 * kScreenWidth, 0, 122 * kScreenWidth, 75 * kScreenWidth);
    self.label3.frame = CGRectMake(CGRectGetMaxX(self.label2.frame) + 1 * kScreenWidth, 0, 326 * kScreenWidth, 75 * kScreenWidth);
    self.label4.frame = CGRectMake(CGRectGetMaxX(self.label3.frame) + 1 * kScreenWidth, 0, 144 * kScreenWidth, 75 * kScreenWidth);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
