//
//  AddSetTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AddSetTableViewCell.h"

@implementation AddSetTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if (self ) {
        self.label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
       
    }
    return  self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.label.frame = CGRectMake(10, 0, 200*kScreenWidth, 80*kScreenHeight);
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
