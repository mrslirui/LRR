//
//  AddCountryTableViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/9/22.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AddCountryTableViewCell.h"

@implementation AddCountryTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.prolabel = [[UILabel alloc] init];
        [self.contentView addSubview:_prolabel];
        self.province = [[BaseTextField alloc] init];
        [self.contentView addSubview:_province];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.prolabel.frame = CGRectMake(30*kScreenWidth, 0, 30*kScreenWidth, self.contentView.height);
    self.province.frame = CGRectMake(_prolabel.right+ 20*kScreenWidth, _prolabel.top, self.contentView.width -60*kScreenWidth , _prolabel.height);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
