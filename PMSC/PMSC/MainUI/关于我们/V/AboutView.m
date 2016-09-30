//
//  AboutView.m
//  PMSC
//
//  Created by 李锐 on 16/9/3.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AboutView.h"

@implementation AboutView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
 */- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self load];
    }
    return self;
}
-(void)setDic:(NSDictionary *)dic
{
    _dic = dic;
    [self load];
   
}
-(void)load
{
    UIScrollView  *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) )];
    
   scroll.contentSize = CGSizeMake(CGRectGetWidth(self.frame) , (CGRectGetHeight(self.frame)  )*3);
    [self addSubview:scroll];
    scroll.backgroundColor = [UIColor whiteColor];
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:@"关于我们标"];
    [scroll addSubview:imgView];
    UILabel *label = [UILabel new];
    label.textColor = kAppColor;
    label.text = @"跑马商城";
    label.font = [UIFont systemFontOfSize:29 * kScreenWidth];
    [scroll addSubview:label];
    
    UILabel *label1 =[ UILabel new];
    label1.text = @"iOS版1.0.1";
    label1.textColor = kHexColor(0xa3a3a3);
    label1.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    [scroll addSubview:label1];
    
    UILabel *label2 = [UILabel new];
    label2.text = _dic[@"count"];
    [scroll addSubview:label2];
    label2.textColor = kHexColor(0x707070);
    label2.font = [UIFont systemFontOfSize:30 * kScreenWidth];

    
    imgView.sd_layout
    .topSpaceToView(scroll,107 * kScreenHeight)
    .leftSpaceToView(scroll,180 * kScreenWidth)
    .widthIs(340 * kScreenWidth)
    .heightIs(132 * kScreenWidth);
    
    
    label.sd_layout
    .topSpaceToView(imgView,31 * kScreenHeight)
    .leftSpaceToView(scroll,280 * kScreenWidth)
    .widthIs(30 * 4 * kScreenWidth)
    .heightIs(46 * kScreenWidth);
    
    label1.sd_layout
    .topSpaceToView(label,26*kScreenHeight)
    .leftSpaceToView(scroll,275*kScreenWidth)
    .widthIs(28*9*kScreenWidth)
    .heightIs(46*kScreenHeight);
    
    label2.sd_layout
    .topSpaceToView(label1,77*kScreenHeight)
    .leftSpaceToView(scroll,22*kScreenWidth)
    .rightSpaceToView(scroll,22*kScreenWidth)
    .autoHeightRatio(0);
    
    
}

@end
