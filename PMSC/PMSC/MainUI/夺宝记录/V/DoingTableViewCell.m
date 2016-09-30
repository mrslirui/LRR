//
//  DoingTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "DoingTableViewCell.h"

@implementation DoingTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView =[ UIImageView new];
        [self.contentView addSubview:_imgView];
        self.duobaoing = [UIImageView new];
        [self.contentView addSubview:_duobaoing];
        self.titleLabel = [UILabel new];
        [self.contentView addSubview:_titleLabel];
       
        _duobaoing.image =[UIImage imageNamed:@"夺宝中@3x"];
        _imgView.backgroundColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:26*kScreenWidth];
     
        self.progressView.leftColor = [UIColor redColor];
        self.progressView.rightColor = [UIColor yellowColor];

    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imgView.frame = CGRectMake(19*kScreenWidth, 16*kScreenHeight, 133*kScreenHeight, 133*kScreenHeight);
    self.duobaoing.frame = CGRectMake(_imgView.right+ 15*kScreenWidth, _imgView.top-5*kScreenHeight, 90*kScreenWidth, (133-32)*kScreenHeight /3+5*kScreenHeight);
    self.titleLabel.frame = CGRectMake(_duobaoing.left, _duobaoing.bottom+ 16*kScreenHeight, self.contentView.size.width - (19+133+15)*kScreenWidth, (133-32)*kScreenHeight /3);
    self.progressView = [[LRProgress alloc ] initWithFrame:CGRectMake(_duobaoing.left, _titleLabel.bottom+15*kScreenHeight, self.contentView.size.width - (19+133+15+15)*kScreenWidth, _titleLabel.height)];
    [self.contentView addSubview:_progressView];
    _progressView.progress = _pro;
    _progressView.leftColor = kHexColor(0xfed230);
    _progressView.rightColor = [UIColor lightGrayColor];
//    _progressView.leftView.text = _progressStr;
   _progressView.leftView.font = [UIFont systemFontOfSize:22*kScreenWidth];
    UILabel *slabel = [[UILabel alloc] initWithFrame:CGRectMake(_duobaoing.left, _titleLabel.bottom+15*kScreenHeight, self.contentView.size.width - (19+133+15+15)*kScreenWidth, _titleLabel.height)];
    [self.contentView addSubview:slabel];
    slabel.text = _progressStr;
    slabel.font = [UIFont systemFontOfSize:21*kScreenWidth];
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
@end
