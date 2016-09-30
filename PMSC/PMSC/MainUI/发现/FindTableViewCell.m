//
//  FindTableViewCell.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "FindTableViewCell.h"

@implementation FindTableViewCell
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
    
    
    self.titleLabel.sd_layout
    .topEqualToView(self.typeImageView)
    .leftSpaceToView(self.typeImageView,20 * kScreenWidth)
    .rightSpaceToView(self.contentView,34 * kScreenWidth)
    .heightIs(32 * kScreenWidth);
    self.insMessageLabel = [UILabel new];
    self.insMessageLabel.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.insMessageLabel.textColor = kHexColor(0x707070);
    self.insMessageLabel.numberOfLines = 3;
    [self.contentView addSubview:_insMessageLabel];
    
//    self.insMessageLabel.sd_layout
//    .topSpaceToView(self.titleLabel,10 * kScreenWidth)
//    .leftEqualToView(self.titleLabel)
//    .rightEqualToView(self.titleLabel)
//    .heightIs(28 * 4 * kScreenWidth + 12 * kScreenWidth);
    
    
    self.voteButton = [[TitleAndImageView alloc] initWithFrame:CGRectMake(720 * kScreenWidth - 102 * kScreenWidth, 196 * kScreenWidth + 42 * kScreenWidth, 82 * kScreenWidth, 32 * kScreenWidth)];
    self.voteButton.label.textColor = kHexColor(0x707070);
    self.voteButton.userInteractionEnabled = YES;
    [self.contentView addSubview:_voteButton];
    

    
    self.shangButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.shangButton setBackgroundImage:[UIImage imageNamed:@"赏@3x_1"] forState:UIControlStateNormal];
   
    [self.contentView addSubview:_shangButton];
 
    
    self.timeAndNameLabel = [UILabel new];
    self.timeAndNameLabel.font = [UIFont systemFontOfSize:24 * kScreenWidth];
    
    self.timeAndNameLabel.textColor = kHexColor(0x323232);
    [self.contentView addSubview:_timeAndNameLabel];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat a1 = [[self class] heightWithText:self.insMessageLabel.text];
    CGFloat f = 0;
    if (a1 >= 28 * kScreenWidth && a1 < 28 * kScreenWidth * 2) {
        f = 28 * kScreenWidth * 2;
    }else if (a1 >= 28 * kScreenWidth * 2 && a1 < 28 * kScreenWidth * 3)
    {
        f = 28 * kScreenWidth * 3;
    }else
    {
        f = 28 * kScreenWidth * 4;
    }
    self.insMessageLabel.frame = CGRectMake(218 * kScreenWidth, CGRectGetMaxY(self.titleLabel.frame) + 10 * kScreenWidth, CGRectGetWidth(self.frame) - 54 * kScreenWidth - 198 * kScreenWidth, f);
    self.voteButton.frame = CGRectMake(720 * kScreenWidth - 102 * kScreenWidth, 196 * kScreenWidth + 42 * kScreenWidth, 82 * kScreenWidth, 32 * kScreenWidth);
    self.shangButton.frame = CGRectMake(720 * kScreenWidth - 156 * kScreenWidth, CGRectGetMinY(self.voteButton.frame), 34 * kScreenWidth, 34 * kScreenWidth);
    self.timeAndNameLabel.frame = CGRectMake(18 * kScreenWidth, CGRectGetMinY(self.voteButton.frame), 720 * kScreenWidth - 183 * kScreenWidth, 24 * kScreenWidth);
}
+(CGFloat)heightWithText:(NSString *)text
{
    //保存文本属性(大小)
    NSDictionary *dic = @{NSFontAttributeName:[ UIFont systemFontOfSize:28 *kScreenWidth]};
    //预设尺寸 文本最大不超过这个尺寸
    //根据设置的高度计算高度(宽度和label保持一致)
    CGSize size = CGSizeMake(720 * kScreenWidth - 54 * kScreenWidth - 198 * kScreenWidth, 1000);
    //根据文本 计算出cgrect
    //参数1 尺寸范围
    //参数2 文本属性
    //参数3 按照什么方式获取rect
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //返回得到的高度
    return rect.size.height;
}

- (void)setFindM:(FindViewModel *)findM
{
    _findM = findM;
    self.titleLabel.text = _findM.title;
    self.insMessageLabel.text = _findM.content;
    self.voteButton.imageView.image = [UIImage imageNamed:@"faxian2"];
    self.voteButton.label.text = [NSString stringWithFormat:@"%d",self.findM.total];
    
    
    
    self.timeAndNameLabel.text = [NSString stringWithFormat:@"%@ %@",_findM.username,[XLMethod changeTime:_findM.time formatter:@"yyyy-MM-dd HH:mm"]];
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
