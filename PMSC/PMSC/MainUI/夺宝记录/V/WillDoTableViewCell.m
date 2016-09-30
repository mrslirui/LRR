//
//  WillDoTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "WillDoTableViewCell.h"

@implementation WillDoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView =[ UIImageView new];
        [self.contentView addSubview:_imgView];
            self.titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
        self.progressView = [LRProgress new];
        [self.contentView addSubview:_progressView];
              self.valueLabel = [UILabel new];
        [self.contentView addSubview:_valueLabel];
              _imgView.backgroundColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:26*kScreenWidth];
        self.valueLabel.textColor = kHexColor(0xbdbdbd);
        _valueLabel.font = [UIFont systemFontOfSize:24*kScreenWidth];
        self.progressView = [LRProgress new ];
        [self.contentView addSubview:_progressView];

    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imgView.frame = CGRectMake(19*kScreenWidth, 16*kScreenHeight, 133*kScreenHeight, 133*kScreenHeight);
    self.titleLabel.frame = CGRectMake(_imgView.right + 15*kScreenWidth,16*kScreenHeight, self.contentView.size.width - (19+133+15)*kScreenWidth, (133-32)*kScreenHeight /3);
    self.valueLabel.frame = CGRectMake(_titleLabel.left, _titleLabel.bottom+ 16*kScreenHeight, _titleLabel.width, _titleLabel.height);
    
    
    self.progressView.frame = CGRectMake(_titleLabel.left, _valueLabel.bottom+15*kScreenHeight, self.contentView.size.width - (19+133+15+15)*kScreenWidth, _titleLabel.height);
    _progressView.progress = _pro;
    _progressView.leftColor = kHexColor(0xfed230);
    _progressView.rightColor = [UIColor lightGrayColor];
    _progressView.leftView.text = _progressStr;
    _progressView.leftView.font = [UIFont systemFontOfSize:22*kScreenWidth];
//    _progressView.leftView.textAlignment = NSTextAlignmentCenter;
    
    
//    UIImageView *clock = [[UIImageView alloc]initWithFrame:CGRectMake(_progressView.leftView.centerX - 40*kScreenWidth, 0, 20*kScreenWidth, 20*kScreenWidth)];
//    clock.image = [UIImage imageNamed:@""];
//    clock.backgroundColor = [UIColor redColor];
//    [_progressView.leftView addSubview:clock];


}
-(void)setProgressStr:(NSString *)progressStr
{
    
    _progressStr = progressStr;
    NSLog(@"%@ %@",progressStr,_progressStr);
    
    
}
-(void)setPro:(CGFloat)pro
{
    _pro = pro;
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
