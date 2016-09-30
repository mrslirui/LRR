//
//  AddContactTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AddContactTableViewCell.h"

@implementation AddContactTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if (self ) {
        self.imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgView];
        self.contLb = [UILabel new];
        [self.contentView addSubview:_contLb];
        self.phone =  [BaseTextField new];
        [self.contentView addSubview:_phone];
        self.arrBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_arrBtn];
        [_arrBtn setImage:[UIImage imageNamed:@"大"] forState:0];
        _contLb.font = [UIFont systemFontOfSize:30 *kScreenHeight];
        _phone.font = [UIFont systemFontOfSize:30 *kScreenHeight];

    }
    return  self;
}
-(void)layoutSubviews
{ [ super layoutSubviews];
    self.imgView.frame = CGRectMake(10*kScreenWidth, 20*kScreenHeight, 45*kScreenHeight, 45*kScreenHeight);
    self.contLb.frame = CGRectMake(_imgView.right + 10,0 , 100, self.contentView.frame.size.height);
    self.phone.frame = CGRectMake(_contLb.right + 10, 0, 300*kScreenWidth,_contLb.height );
    _arrBtn.sd_layout
    .topSpaceToView(self.contentView,(87-13) *kScreenHeight /2)
    .rightSpaceToView(self.contentView,25*kScreenHeight)
    .widthIs(13 *kScreenHeight)
    .heightIs(26 *kScreenHeight);}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
