//
//  MyPostedView.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "MyPostedView.h"

@implementation MyPostedView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self load];
    }
    return self;
}
- (void)load
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 49 * kScreenWidth)];
    bgView.backgroundColor = kAppColor;
    [self addSubview:bgView];
    
    self.passButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.passButton setTitle:@"已通过" forState:UIControlStateNormal];
    self.passButton.frame = CGRectMake(130 * kScreenWidth, 6 * kScreenWidth, 196 * kScreenWidth, 34 * kScreenWidth);
    self.passButton.titleLabel.font = [UIFont systemFontOfSize:34 * kScreenWidth];

    [self.passButton setTitleColor:[UIColor colorWithRed:0.9922 green:0.9843 blue:0.6353 alpha:1.0] forState:UIControlStateNormal];
    [bgView addSubview:_passButton];
    
    self.typeIamgeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"矩形-2@3x"]];
    self.typeIamgeView.frame = CGRectMake(130 * kScreenWidth, 40 * kScreenWidth, 196  *kScreenWidth, 9 * kScreenWidth);
    [bgView addSubview:_typeIamgeView];
    
    self.checkButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [self.checkButton setTitle:@"待审核" forState:UIControlStateNormal];
    self.checkButton.frame = CGRectMake((720 - 130 - 196) * kScreenWidth, 6 * kScreenWidth, 196 * kScreenWidth, 34 * kScreenWidth);
    self.checkButton.titleLabel.font = [UIFont systemFontOfSize:34 * kScreenWidth];
    
    [self.checkButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [bgView addSubview:_checkButton];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(bgView.frame))];
    self.scrollView.scrollEnabled = NO;
    self.scrollView.contentSize = CGSizeMake(2 * CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(bgView.frame));
    [self addSubview:self.scrollView];
    
    self.passTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, CGRectGetHeight(self.scrollView.frame)) style:UITableViewStylePlain];
    [self.scrollView addSubview:self.passTableView];
    
    self.checkTableView = [[UITableView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame), 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.scrollView.frame)) style:UITableViewStylePlain];
    [self.scrollView addSubview:_checkTableView];
    
}

@end
