//
//  LastTableViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "LastTableViewCell.h"

@implementation LastTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[ super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.title = [UILabel new];
        [self.contentView addSubview:_title];
        self.huojiang = [UILabel new];
        [self.contentView addSubview:_huojiang];
        self.dizhi = [UILabel new];
        [self.contentView addSubview:_dizhi];
        self.luckCode  =[UILabel new];
        [self.contentView addSubview:_luckCode];
        self.join = [UILabel new];
        [self.contentView addSubview:_join];
        self.hView = [UIImageView new];
        [self.contentView addSubview:_hView];
        self.dView = [UIImageView new];
        [self.contentView addSubview:_dView];
        self.lView =[UIImageView new];
        [self.contentView addSubview:_lView];
        self.jView = [UIImageView new];
        [self.contentView addSubview:_jView];
        self.head = [UIImageView new];
        [self.contentView addSubview:_head];
        _head.backgroundColor = [UIColor redColor];
        _head.layer.cornerRadius = 84*kScreenHeight/2;
        _hView.image = [UIImage imageNamed:@"wangqi5@3x"];
        _dView.image = [UIImage imageNamed:@"wangqi6"];
        _lView.image = [UIImage imageNamed:@"wangqi3@3x_2"];
        _jView.image =[UIImage imageNamed:@"wangqi4@3x_3"];
        
        _huojiang.textColor = kHexColor(0x303030);
        _huojiang.font = [UIFont systemFontOfSize:28*kScreenWidth];
        _dizhi.textColor = kHexColor(0x303030);
        _dizhi.font = [UIFont systemFontOfSize:28*kScreenWidth];
        _luckCode.textColor = kHexColor(0x303030);
        _luckCode.font = [UIFont systemFontOfSize:28*kScreenWidth];
        _join.textColor = kHexColor(0x303030);
        _join.font = [UIFont systemFontOfSize:28*kScreenWidth];
        
        _title.textColor = kHexColor(0x303030);
        _title.font = [UIFont systemFontOfSize:32*kScreenWidth];
       
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.title.frame = CGRectMake(10*kScreenWidth, 0, Screen_WIDTH - 50*kScreenWidth, 70*kScreenHeight);
    self.head.frame = CGRectMake(20*kScreenWidth, _title.bottom+10*kScreenHeight, 84*kScreenHeight, 84*kScreenHeight);
    self.hView.frame = CGRectMake(_head.right +10*kScreenWidth, _head.top, 38*kScreenHeight, 38*kScreenHeight);
    self.huojiang.frame = CGRectMake(_hView.right +10*kScreenWidth, _hView.top, 517*kScreenWidth, _hView.height);
    self.dView.frame = CGRectMake(_hView.left, _hView.bottom+10*kScreenHeight,35*kScreenWidth, 47*kScreenHeight);
    self.dizhi .frame = CGRectMake(_dView.right+10*kScreenWidth, _dView.top, _huojiang.width,_dView.height);
    self.lView.frame  =CGRectMake(_hView.left, _dView.bottom+10*kScreenHeight, _hView.width, _hView.height);
    self.luckCode.frame  =CGRectMake(_lView.right + 10*kScreenWidth, _lView.top, _huojiang.width, _huojiang.height);
    self.jView.frame = CGRectMake(_hView.left, _lView.bottom+10*kScreenHeight, _hView.width, _hView.height);
    self.join.frame = CGRectMake(_jView.right + 10*kScreenWidth, _jView.top, _huojiang.width, _huojiang.height);
    
    UIView *line = [UIView new];
    [self.contentView addSubview:line];
    line.frame = CGRectMake(20*kScreenWidth, _title.bottom, Screen_WIDTH - 40*kScreenWidth,0.5);
    line.backgroundColor = kHexColor(0xeaeaea);
    
    self.right = [[UIImageView alloc] initWithFrame:CGRectMake(_title.right, (70-(45/2))*kScreenHeight/2, 23/2*kScreenWidth, 45/2*kScreenHeight)];
    [self.contentView addSubview:_right];
    _right.image = [UIImage imageNamed:@"wangqi1@3x"];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
