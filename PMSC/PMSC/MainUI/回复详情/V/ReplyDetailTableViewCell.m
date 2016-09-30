//
//  ReplyDetailTableViewCell.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ReplyDetailTableViewCell.h"

@interface ReplyDetailTableViewCell ()<UITextViewDelegate>

@end

@implementation ReplyDetailTableViewCell
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
    self.backgroundColor = kHexColor(0xeeeeee);
    self.nickNameLabel = [XLFUWENBENTextView new];
    self.nickNameLabel.font = [UIFont systemFontOfSize:14];
    self.nickNameLabel.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.nickNameLabel.delegate = self;
    self.nickNameLabel.backgroundColor = kHexColor(0xdedede);
    [self.contentView addSubview:_nickNameLabel];
    //    self.nickNameLabel.sd_layout
    //    .topSpaceToView(self.contentView,1)
    //    .leftSpaceToView(self.contentView,5)
    //    .rightSpaceToView(self.contentView,5)
    //    .autoHeightRatio(0);
    //
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat f = [[self class] heightWithText:self.nickNameLabel.attributedText];
    
    //    self.nickNameLabel.frame = CGRectMake(5, 1, 300, f);
    self.nickNameLabel.sd_layout
    .topSpaceToView(self.contentView,0)
    .leftSpaceToView(self.contentView,19 * kScreenWidth)
    .rightSpaceToView(self.contentView,19 * kScreenWidth)
    .heightIs(f);
    
}

+(CGFloat)heightWithText:(NSAttributedString *)text
{
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    //保存文本属性(大小)
    NSDictionary *attributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:14], NSParagraphStyleAttributeName:style};    //预设尺寸 文本最大不超过这个尺寸
    //根据设置的高度计算高度(宽度和label保持一致)
    CGSize size = CGSizeMake(300 , CGFLOAT_MAX);
    
    NSString *s = [NSString stringWithFormat:@"%@",text.string];
    
    //根据文本 计算出cgrect
    //参数1 尺寸范围
    //参数2 文本属性
    //参数3 按照什么方式获取rect
    CGSize rect = [s boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    CGFloat titleHeight;
    
    titleHeight = ceil(rect.height);
    //返回得到的高度
    return titleHeight + 16;
}

- (void)setModel:(ReplyMessageModel *)model
{
    _model = model;
    
    if (_model.pname.length == 0) {
        NSMutableArray *ar = [NSMutableArray array];
        [ar addObject:_model.name];
        [self.nickNameLabel getFuwenbenWithText:[NSString stringWithFormat:@"%@回复%@：%@",_model.name,_model.pname,_model.con] rangOfstring:ar color:[UIColor blueColor] highColor:[UIColor lightGrayColor]];
    }else
    {
        NSMutableArray *ar = [NSMutableArray array];
        [ar addObject:_model.name];
        [ar addObject:_model.pname];
       [self.nickNameLabel getFuwenbenWithText:[NSString stringWithFormat:@"%@回复%@：%@",_model.name,_model.pname,_model.con] rangOfstring:ar color:[UIColor blueColor] highColor:[UIColor lightGrayColor]];
    }
    
    [self setupAutoHeightWithBottomView:_nickNameLabel bottomMargin:5];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
