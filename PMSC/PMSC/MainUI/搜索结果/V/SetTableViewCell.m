//
//  SetTableViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/9/9.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SetTableViewCell.h"

@implementation SetTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.outLogin = [[UILabel alloc]init];
        [self.contentView addSubview:_outLogin];
        _outLogin.textAlignment = NSTextAlignmentCenter;
        _outLogin.font = [UIFont systemFontOfSize:30 *kScreenWidth];
        _outLogin.textColor = kAppColor;
        

    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.outLogin.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
