//
//  tableViewHeader.m
//  FriendRound
//
//  Created by 杨晓龙 on 16/8/19.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "tableViewHeader.h"
#import "UIView+SDAutoLayout.h"

@implementation tableViewHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self load];
    }
    return self;
}
- (void)load
{
    UIView *bg1 = [UIView new];
    bg1.backgroundColor = kHexColor(0xeeeeee);
    [self addSubview:bg1];
    bg1.sd_layout
    .topSpaceToView(self,0)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(20 * kScreenWidth);
    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:34 * kScreenWidth];
    self.titleLabel.textColor = kHexColor(0xff5333);
    [self addSubview:_titleLabel];
    _titleLabel.sd_layout
    .topSpaceToView(bg1,20 * kScreenWidth)
    .leftSpaceToView(self,20 * kScreenWidth)
    .rightSpaceToView(self,20 * kScreenWidth)
    .heightIs(34 * kScreenWidth);
    
    self.nameLabel = [UILabel new];
    self.nameLabel.font = [UIFont systemFontOfSize:24 * kScreenWidth];
    [self addSubview:_nameLabel];
    
    _nameLabel.sd_layout
    .topSpaceToView(_titleLabel,28 * kScreenWidth)
    .leftEqualToView(_titleLabel)
    .rightEqualToView(_titleLabel)
    .heightIs(24 * kScreenWidth);
    
    self.imgView = [UIImageView new];
    [self addSubview:_imgView];
    _imgView.backgroundColor = [UIColor redColor];
    _imgView.sd_layout
    .topSpaceToView(_nameLabel,15 * kScreenWidth)
    .leftEqualToView(_nameLabel)
    .rightEqualToView(_nameLabel)
    .heightIs(222 * kScreenWidth);
    
    self.contentLabel = [UILabel new];
    self.contentLabel.font = [UIFont systemFontOfSize:16];
    self.contentLabel.numberOfLines = 0;
    [self addSubview:self.contentLabel];
    
    self.contentLabel.sd_layout
    .topSpaceToView(_imgView,31)
    .leftEqualToView(_nameLabel)
    .rightEqualToView(_nameLabel)
    .autoHeightRatio(0);
    
    self.voteButton = [[TitleAndImageView alloc] initWithFrame:CGRectMake(0, 0, 82 * kScreenWidth, 32 * kScreenWidth)];
    
    self.voteButton.userInteractionEnabled = YES;
    [self addSubview:_voteButton];
    
    _voteButton.sd_layout
    .topSpaceToView(self.contentLabel,15 * kScreenWidth)
    .rightSpaceToView(self,10 * kScreenWidth)
    .widthIs(82 * kScreenWidth)
    .heightIs(32 * kScreenWidth);
    
    
    self.voteButton.imageView.image = [UIImage imageNamed:@"faxian2"];
    self.voteButton.label.text = @"100";
    
    
    self.rewardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.rewardButton setBackgroundImage:[UIImage imageNamed:@"赏@3x_1"] forState:UIControlStateNormal];
    
    [self addSubview:_rewardButton];
    
    _rewardButton.sd_layout
    .topEqualToView(_voteButton)
    .rightSpaceToView(_voteButton,15 * kScreenWidth)
    .widthIs(34 * kScreenWidth)
    .heightIs(34 * kScreenWidth);
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    line.sd_layout
    .topSpaceToView(_voteButton,10 * kScreenWidth)
    .leftEqualToView(_nameLabel)
    .rightEqualToView(_nameLabel)
    .heightIs(0.5);
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = kHexColor(0xeeeeee);
    [self addSubview:bgView];
    
    bgView.sd_layout
    .topSpaceToView(line,0)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(25 * kScreenWidth);
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jiantou"]];
    [bgView addSubview:img];
    
    img.sd_layout
    .leftSpaceToView(bgView,33 * kScreenWidth)
    .widthIs(20 * kScreenWidth)
    .heightIs(17 * kScreenWidth)
    .bottomSpaceToView(bgView,0);
    
    
}
- (void)setContentString:(NSString *)contentString
{
    _contentString = contentString;
    self.contentLabel.text = _contentString;
    [self setupAutoHeightWithBottomView:_voteButton bottomMargin:35 * kScreenWidth];
}
@end
