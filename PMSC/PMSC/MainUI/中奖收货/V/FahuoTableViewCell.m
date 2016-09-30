//
//  FahuoTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "FahuoTableViewCell.h"

@implementation FahuoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView =[ UIImageView new];
        [self.contentView addSubview:_imgView];
        self.titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
        _imgView.backgroundColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:30*kScreenWidth];
        self.time = [UILabel new];
        [self.contentView addSubview:_time];
        self.codeLabel = [UILabel new];
        [self.contentView addSubview:_codeLabel];
        self.fahuoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_fahuoBtn];
        _time.font = [UIFont systemFontOfSize:24*kScreenWidth];
        _codeLabel.font = [UIFont systemFontOfSize:24 *kScreenWidth];
        _time.textColor = kHexColor(0x727272);
        _codeLabel.textColor = kHexColor(0x727272);
        _titleLabel.numberOfLines = 0;

    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat h = [[self class] heightWithText:_titleLabel.text];
    self.imgView.frame = CGRectMake(19*kScreenWidth, 16*kScreenHeight, 133*kScreenHeight, 133*kScreenHeight);
    self.titleLabel.frame = CGRectMake(_imgView.right + 15*kScreenWidth,16*kScreenHeight, 552*kScreenWidth, h);
    self.time .frame = CGRectMake(_titleLabel.left, _titleLabel.bottom+5*kScreenHeight, _titleLabel.width, 30*kScreenHeight);
    self.codeLabel.frame = CGRectMake(_titleLabel.left, _time.bottom+5*kScreenHeight, _time.width, _time.height);
    self.fahuoBtn.frame = CGRectMake(self.contentView.right - 211*kScreenWidth, _codeLabel.bottom , 183*kScreenHeight, 51*kScreenHeight);
}
+(CGFloat)heightWithText:(NSString *)text
{
    //保存文本属性(大小)
    NSDictionary *dic = @{NSFontAttributeName:[ UIFont systemFontOfSize:30 *kScreenWidth]};
    //预设尺寸 文本最大不超过这个尺寸
    //根据设置的高度计算高度(宽度和label保持一致)
    CGSize size = CGSizeMake(552 *kScreenWidth , 1000);
    //根据文本 计算出cgrect
    //参数1 尺寸范围
    //参数2 文本属性
    //参数3 按照什么方式获取rect
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //返回得到的高度
    return rect.size.height;
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
