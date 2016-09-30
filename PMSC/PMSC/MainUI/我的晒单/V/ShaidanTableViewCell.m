//
//  ShaidanTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShaidanTableViewCell.h"

@implementation ShaidanTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView = [UIImageView new];
        [self.contentView addSubview:_imgView];
        self.nick = [UILabel new];
        [self.contentView addSubview:_nick];
        self.title = [UILabel new];
        [self.contentView addSubview:_title];
        self.shuomingLb = [UILabel new];
        [self.contentView addSubview:_shuomingLb];
        self.date = [UILabel new];
        [self.contentView addSubview:_date];
        self.xin = [UIImageView new];
        [self.contentView addSubview:_xin];
        self.xinlabel = [UILabel new];
        [self.contentView addSubview:_xinlabel];
        self.fenxiang = [UIImageView new];
        [self.contentView addSubview:_fenxiang];
        self.fenLabel = [UILabel new];
        [self.contentView addSubview:_fenLabel];
                _xin.image = [ UIImage imageNamed:@"xin"];
        self.imgView.layer.cornerRadius = 70*kScreenHeight /2;
        self.imgView.layer.masksToBounds = YES;
        self.imgView.backgroundColor = [UIColor redColor];
        self.line = [UIView new];
        [self.contentView addSubview:_line];
        self.line1 = [UIView new];
        [self.contentView addSubview:_line1];
        _line.backgroundColor = kHexColor(0xeeeeee);
        _line1.backgroundColor = kHexColor(0xeeeeee);
        _nick.font = [UIFont systemFontOfSize:28*kScreenWidth];
        
        _title.font = [UIFont systemFontOfSize:28*kScreenWidth];
        _title.textColor = kHexColor(0xaeaeae);
        _shuomingLb.textColor = kHexColor(0x313131);
        _shuomingLb.font = [ UIFont systemFontOfSize:26*kScreenWidth];
        _date.font = [UIFont systemFontOfSize:26*kScreenWidth];
        _fenLabel.font = [UIFont systemFontOfSize:24*kScreenWidth];
        _xinlabel.font = [ UIFont systemFontOfSize:24*kScreenWidth];
        _date.textColor = kHexColor(0xaeaeaeae);
        _xinlabel.textColor = kHexColor(0xaeaeae);
        _fenLabel.textColor = kHexColor(0xaeaeae);
       
        _shuomingLb.numberOfLines = 0;
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat h = [ ShaidanTableViewCell heightWithText:_shuomingLb.text];
    self.imgView .frame = CGRectMake(19*kScreenWidth, 27*kScreenHeight, 70*kScreenHeight, 70*kScreenHeight);
    self.nick.frame = CGRectMake(_imgView.right + 10*kScreenHeight, _imgView.top, self.contentView.self.width, 35*kScreenHeight);
    _title.frame = CGRectMake(_nick.left, _nick.bottom+10*kScreenHeight, _nick.width, 35*kScreenHeight);
    _shuomingLb.frame = CGRectMake(_imgView.left, 154*kScreenHeight, 660*kScreenWidth, h);
    self.date .frame = CGRectMake(_imgView.left, (194+22 +32.5+124)*kScreenHeight+h, 200*kScreenWidth, 58*kScreenHeight);
    self.xin.frame = CGRectMake(530*kScreenWidth, _date.top+14*kScreenHeight, 30*kScreenHeight, 30*kScreenHeight);
    self.xinlabel.frame = CGRectMake(_xin.right+5, _xin.top, 40*kScreenWidth, _xin.height);
    self.fenxiang.frame = CGRectMake(_xinlabel.right+5, _xinlabel.top, _xin.width, _xin.height);
    _fenLabel.frame = CGRectMake(_fenxiang.right+5, _fenxiang.top, 40*kScreenWidth, _fenxiang.height);
    self.line.frame = CGRectMake(0, 124*kScreenHeight, self.contentView.frame.size.width, 0.5);
    self.line1.frame = CGRectMake(0, (194+22 +32.5+124)*kScreenHeight+h, _line.width, _line.height);
    for(int i= 0; i< _photoArr.count;i++)
    {
        self.tupian = [[UIImageView alloc] initWithFrame:CGRectMake(i*206*kScreenWidth +i*32 *kScreenWidth + 19*kScreenWidth, 124*kScreenHeight+ 22 *kScreenHeight+32.5*kScreenHeight +h, 206 *kScreenWidth, 162 *kScreenHeight)];
        [self.contentView addSubview:_tupian];
        _tupian.backgroundColor = [UIColor redColor];
        [_tupian sd_setImageWithURL:[NSURL URLWithString:_photoArr[i]] placeholderImage:[UIImage imageNamed:@"占位图方"]];
    }

   
}



+(CGFloat)heightWithText:(NSString *)text
{
    //保存文本属性(大小)
    NSDictionary *dic = @{NSFontAttributeName:[ UIFont systemFontOfSize:26 *kScreenWidth]};
    //预设尺寸 文本最大不超过这个尺寸
    //根据设置的高度计算高度(宽度和label保持一致)
    CGSize size = CGSizeMake(660 *kScreenWidth , 1000);
    //根据文本 计算出cgrect
    //参数1 尺寸范围
    //参数2 文本属性
    //参数3 按照什么方式获取rect
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //返回得到的高度
    return rect.size.height;
}

-(void)setPhotoArr:(NSArray *)photoArr
{ NSLog(@"%@",_photoArr);
    _photoArr = photoArr;
    
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
