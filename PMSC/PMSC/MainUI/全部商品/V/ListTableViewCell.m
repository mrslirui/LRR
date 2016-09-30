//
//  ListTableViewCell.m
//  yasin
//
//  Created by 杨晓龙 on 16/5/27.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self load];
    }
    return self;
}
- (void)load
{
    self.contentView.backgroundColor = RGBA(249, 249, 249, 1);
    self.selectView = [UIView new];
    self.selectView.backgroundColor = kAppColor;
    self.selectView.hidden = YES;
    [self.contentView addSubview:self.selectView];
    
    self.selectView.sd_layout
    .topSpaceToView(self.contentView,0)
    .leftSpaceToView(self.contentView,0)
    .widthIs(6 * kScreenWidth)
    .bottomSpaceToView(self.contentView,0);
    
    self.nameLabel = [UILabel new];
    self.nameLabel.font = [UIFont systemFontOfSize:26 * kScreenWidth];
    self.nameLabel.textColor = RGBA(143, 143, 143, 1);
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.nameLabel];
    
    self.nameLabel.sd_layout
    .topSpaceToView(self.contentView,39 * kScreenWidth)
    .leftSpaceToView(self.selectView,0)
    .rightSpaceToView(self.contentView,0)
    .heightIs(26 * kScreenWidth);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
