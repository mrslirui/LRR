//
//  ProfitAndLossViewDetailViewSecondTableViewCell.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/29.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ProfitAndLossViewDetailViewSecondTableViewCell.h"

@implementation ProfitAndLossViewDetailViewSecondTableViewCell
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
    self.label1.text = @"5";

    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label1];
    
    
    self.label2 = [UILabel new];
    self.label2.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.label2.textColor = kHexColor(0x646464);
    self.label2.text = @"100";

    self.label2.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label2];
    
    self.label3 = [UILabel new];
    self.label3.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.label3.textColor = kHexColor(0x646464);
    self.label3.text = @"5 小 单";

    self.label3.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_label3];
    self.imgView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm1"]];
    [self.contentView addSubview:self.imgView1];
    self.imgView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm2"]];
    [self.contentView addSubview:self.imgView2];
    self.imgView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm3"]];
    [self.contentView addSubview:self.imgView3];
    
    self.imgView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm4"]];
    [self.contentView addSubview:self.imgView4];
    self.imgView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm5"]];
    [self.contentView addSubview:self.imgView5];
    self.imgView6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm6"]];
    [self.contentView addSubview:self.imgView6];
    
    self.imgView7 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm7"]];
    [self.contentView addSubview:self.imgView7];
    self.imgView8 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm8"]];
    [self.contentView addSubview:self.imgView8];
    self.imgView9 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm9"]];
    [self.contentView addSubview:self.imgView9];
    
    self.imgView10 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hm10"]];
    [self.contentView addSubview:self.imgView10];
    
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.label1.frame = CGRectMake(0, 0, 125 * kScreenWidth, 75 * kScreenWidth);
    self.label2.frame = CGRectMake(CGRectGetMaxX(self.label1.frame) + 1 * kScreenWidth, 0, 122 * kScreenWidth, 75 * kScreenWidth);
    self.label3.frame = CGRectMake(CGRectGetMaxX(self.label2.frame) + 327 * kScreenWidth, 0, 144 * kScreenWidth, 75 * kScreenWidth);
}
- (void)setRankArray:(NSArray *)rankArray
{
    _rankArray = rankArray;
    CGFloat f = 250 * kScreenWidth;
    for (int i = 0; i < rankArray.count; i++) {

        if ([rankArray[i] isEqualToString:@"1"]) {
            self.imgView1.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }else if ([rankArray[i] isEqualToString:@"2"]) {
            self.imgView2.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }else if ([rankArray[i] isEqualToString:@"3"]) {
            self.imgView3.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }else if ([rankArray[i] isEqualToString:@"4"]) {
            self.imgView4.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }else if ([rankArray[i] isEqualToString:@"5"]) {
            self.imgView5.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }else if ([rankArray[i] isEqualToString:@"6"]) {
            self.imgView6.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }else if ([rankArray[i] isEqualToString:@"7"]) {
            self.imgView7.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }else if ([rankArray[i] isEqualToString:@"8"]) {
            self.imgView8.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }else if ([rankArray[i] isEqualToString:@"9"]) {
            self.imgView9.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }else
        {
            self.imgView10.frame = CGRectMake(i *32 * kScreenWidth + f, 22.5 * kScreenWidth, 30 * kScreenWidth, 30 * kScreenWidth);
        }
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
