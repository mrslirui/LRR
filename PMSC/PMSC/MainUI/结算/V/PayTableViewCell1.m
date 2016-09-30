//
//  PayTableViewCell1.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PayTableViewCell1.h"

@implementation PayTableViewCell1
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [UILabel new];
        [self.contentView addSubview:_label];
        self.detailLbel = [UILabel new];
        [self.contentView addSubview:_detailLbel];
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_rightBtn];
        _label.textColor = kHexColor(0x313131);
        _detailLbel.textColor = kHexColor(0x9a9a9a);
        
        _detailLbel.font =[ UIFont systemFontOfSize:24*kScreenWidth];
        _label.font = [UIFont systemFontOfSize:28*kScreenWidth];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.label.frame = CGRectMake(20*kScreenWidth, 0, 200*kScreenWidth, 88*kScreenHeight);
    self.detailLbel.frame = CGRectMake(_label.right -50*kScreenWidth, 0, 300*kScreenWidth, 88*kScreenHeight);
    self.rightBtn.frame = CGRectMake(self.contentView.right- 50 *kScreenHeight, 21.5*kScreenHeight, 42 *kScreenHeight , 42*kScreenHeight);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
