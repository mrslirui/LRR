//
//  MyPostedTableViewCell.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "MyPostedTableViewCell.h"

@implementation MyPostedTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self load];
    }
    return self;
}
- (void)load
{
    self.typeImageView = [UIImageView new];
    [self.contentView addSubview:_typeImageView];
    self.typeImageView.backgroundColor = [UIColor redColor];
    self.typeImageView.sd_layout
    .topSpaceToView(self.contentView,18 * kScreenWidth)
    .leftSpaceToView(self.contentView,20 * kScreenWidth)
    .widthIs(178 * kScreenWidth)
    .heightIs(178 *kScreenWidth);
    
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont systemFontOfSize:32 * kScreenWidth];
    self.titleLabel.textColor = kHexColor(0xfd522f);
    [self.contentView addSubview:_titleLabel];
    self.titleLabel.text = @"新手必看 赛马教程";
    
    self.titleLabel.sd_layout
    .topEqualToView(self.typeImageView)
    .leftSpaceToView(self.typeImageView,20 * kScreenWidth)
    .rightSpaceToView(self.contentView,34 * kScreenWidth)
    .heightIs(32 * kScreenWidth);
    self.insMessageLabel = [UILabel new];
    self.insMessageLabel.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.insMessageLabel.textColor = kHexColor(0x707070);
    self.insMessageLabel.numberOfLines = 4;
    self.insMessageLabel.text = @"你好记录 建安费纠纷了看见饭 阿里积分阿来得及覅确认是都放假啦我偶然亲爱的附件 旧日期激发了；就发送卡到了；发";
    [self.contentView addSubview:_insMessageLabel];
    
    self.insMessageLabel.sd_layout
    .topSpaceToView(self.titleLabel,22 * kScreenWidth)
    .leftEqualToView(self.titleLabel)
    .rightEqualToView(self.titleLabel)
    .heightIs(28 * 4 * kScreenWidth);
    
    
    self.voteButton = [TitleAndImageView new];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.voteButton.imageView.image = [UIImage imageNamed:@"faxian2"];
        self.voteButton.label.text = @"100";
    });
    
    self.voteButton.label.textColor = kHexColor(0x707070);
    self.voteButton.userInteractionEnabled = YES;
    [self.contentView addSubview:_voteButton];
    
    self.voteButton.sd_layout
    .topSpaceToView(self.typeImageView,42 * kScreenWidth)
    .rightSpaceToView(self.contentView,20 * kScreenWidth)
    .widthIs(82 * kScreenWidth)
    .heightIs(32 * kScreenWidth);
    
    self.shangButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.shangButton setBackgroundImage:[UIImage imageNamed:@"赏@3x_1"] forState:UIControlStateNormal];
    self.shangButton.userInteractionEnabled = NO;
    [self.contentView addSubview:_shangButton];
    self.shangButton.sd_layout
    .topEqualToView(self.voteButton)
    .leftSpaceToView(self.contentView,20 * kScreenWidth)
    .widthIs(34 * kScreenWidth)
    .heightIs(34 * kScreenWidth);
    
    self.shangNameLabel = [UILabel new];
    self.shangNameLabel.font = [UIFont systemFontOfSize:24 * kScreenWidth];
    self.shangNameLabel.textColor = kHexColor(0x00255b);
    self.shangNameLabel.text = @"张三，李四，王二麻子";
    [self.contentView addSubview:_shangNameLabel];
    
    self.shangNameLabel.sd_layout
    .topSpaceToView(self.typeImageView,46 * kScreenWidth)
    .leftSpaceToView(self.shangButton,14 * kScreenWidth)
    .rightSpaceToView(self.voteButton,14 * kScreenWidth)
    .heightIs(24 * kScreenWidth);
    
    self.timeAndNameLabel = [UILabel new];
    self.timeAndNameLabel.font = [UIFont systemFontOfSize:24 * kScreenWidth];
    self.timeAndNameLabel.text = @"追风筝的人 2016-05-21 11：00";
    self.timeAndNameLabel.textColor = kHexColor(0x323232);
    [self.contentView addSubview:_timeAndNameLabel];
    self.timeAndNameLabel.sd_layout
    .topSpaceToView(self.shangButton,18 * kScreenWidth)
    .leftSpaceToView(self.contentView,20 * kScreenWidth)
    .rightSpaceToView(self.contentView,20 * kScreenWidth)
    .heightIs(24* kScreenWidth);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
