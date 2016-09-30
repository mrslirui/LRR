//
//  MyView.m
//  PMSC
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}
-(void)creatView
{
    self.tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 0*kScreenHeight, self.frame.size.width, self.frame.size.height-64 ) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.backgroundColor = kHexColor(0xffffff);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 40, 0);
   
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 345 *kScreenHeight)];
    self.headView.backgroundColor = kHexColor(0xffffff);

    self.headView.userInteractionEnabled = YES;
    self.bgView = [UIView new];
    [self.headView addSubview:self.bgView];
   self.bgView1 =[ UIView new];
    [self.headView  addSubview:self.bgView1];
   
//    UIView *bgView2 = [UIView new];
//    [self.headView addSubview:bgView2];
//    UIView *line = [UIView new];
////    [bgView2 addSubview:line];
//    line.backgroundColor = kHexColor(0xeeeeee);

    self.bgView.sd_layout
    .topSpaceToView(self.headView,0*kScreenHeight)
    .leftSpaceToView(self.headView,0 *kScreenWidth)
    .rightSpaceToView(self.headView,0)
    .heightIs(133 *kScreenHeight);
    
    self.bgView1.sd_layout
    .topSpaceToView(self.bgView,0)
    .leftEqualToView(self.bgView)
    .rightEqualToView(self.bgView)
    .heightIs(212*kScreenHeight);
//    bgView2.sd_layout
//    .topSpaceToView(bgView1,0.5)
//    .leftEqualToView(bgView1)
//    .rightEqualToView(bgView1)
//    .heightRatioToView(bgView1,1);
    self.bgView.backgroundColor = kHexColor(0xeeeeee);
    self.bgView1.backgroundColor = kHexColor(0xffffff);
//    bgView2.backgroundColor = kHexColor(0xffffff);

    
    self.head = [UIImageView new];
    [self.headView addSubview:_head];
    _head.sd_layout
.topSpaceToView(self.headView,31.5*kScreenHeight)
    .leftSpaceToView(self.headView,19*kScreenWidth)
    .widthIs(70 *kScreenHeight)
    .heightIs(70  *kScreenHeight);
    self.phonelb =[UILabel new];
    [self.headView addSubview:_phonelb];
    _phonelb.sd_layout
    .topSpaceToView(self.headView,0)
    .leftSpaceToView(_head,30 *kScreenWidth)
    .heightRatioToView(self.bgView,1)
    .widthIs(300 *kScreenWidth);
    _phonelb.text = @"3245566677";
    self.duobaoLb = [UILabel new];
    [self.headView addSubview:_duobaoLb];
    _duobaoLb.sd_layout
    .topSpaceToView(self.bgView,0)
    .leftSpaceToView(self.headView,21 *kScreenWidth)
    .widthIs(500 *kScreenWidth)
    .heightRatioToView(self.bgView1,0.5);
    self.jifenLb = [UILabel new];
    [self.headView addSubview:_jifenLb];
    _jifenLb.sd_layout
    .topSpaceToView(_duobaoLb,0)
    .leftSpaceToView(self.headView,21 *kScreenWidth)
    .widthIs(340 *kScreenWidth)
    .heightRatioToView(self.bgView1,0.5);
    self.shangLb= [UILabel new];
//    [headView addSubview:_shangLb];
    _shangLb.sd_layout
    .topEqualToView(_jifenLb)
    .leftSpaceToView(_jifenLb,21*kScreenWidth)
    .widthRatioToView(_jifenLb,1)
    .heightRatioToView(_jifenLb,1);
//    line.sd_layout
//    .topEqualToView(bgView2)
//    .leftSpaceToView(_jifenLb,0)
//    .widthIs(0.5)
//    .heightRatioToView(_jifenLb,1);
    _duobaoLb.text = @"余额:100夺宝币";
    _jifenLb.text = @"积分: 100000";
    _shangLb.text = @"赏: 10000";
    _jifenLb.font = [UIFont systemFontOfSize:30  *kScreenWidth];
    _shangLb.font = [UIFont systemFontOfSize:26  *kScreenWidth];
    _duobaoLb.font = [UIFont systemFontOfSize:30  *kScreenWidth];

    self.rightArrow = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.headView addSubview:_rightArrow];
    [_rightArrow setImage:[UIImage imageNamed:@"大"] forState:0];
    _rightArrow.sd_layout
    .topSpaceToView(self.headView,53.5 *kScreenHeight)
    .rightSpaceToView(self.headView,20*kScreenHeight)
    .widthIs(13 *kScreenHeight)
    .heightIs(26 *kScreenHeight);
    self.chongzhiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.headView addSubview:_chongzhiBtn];
    _chongzhiBtn.backgroundColor = kAppColor;
    [_chongzhiBtn setTitle:@"去充值" forState:UIControlStateNormal];
    _chongzhiBtn.sd_layout
    .topEqualToView(_duobaoLb)
    .leftSpaceToView(_duobaoLb,0)
    .heightIs(106*kScreenHeight)
    .rightSpaceToView(self.headView,2);
    _chongzhiBtn.titleLabel.font = [UIFont systemFontOfSize:30*kScreenWidth];
      [_chongzhiBtn setEnabled:YES];
    
    
    
    
    
    self.head.layer.cornerRadius = _head.width/2;
    self.head.layer.masksToBounds  =YES;
    _head.backgroundColor = [UIColor redColor];

    self.headView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0*kScreenHeight, Screen_WIDTH, 110 * kScreenHeight)];
    UILabel *wecoLabel = [[UILabel alloc] initWithFrame:CGRectMake(20*kScreenWidth, 0, 30*8*kScreenWidth, _headView1.height)];
    [_headView1 addSubview:wecoLabel];
    wecoLabel.text = @"欢迎来到赛马商城";
    wecoLabel.font = [UIFont systemFontOfSize:29 * kScreenWidth];
    self.login = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.headView1 addSubview:_login];
    [_login setImage:[UIImage imageNamed:@"登录2"] forState:UIControlStateNormal];
    _login.frame = CGRectMake(self.right - 200 * kScreenWidth, 30 *kScreenHeight, 183*kScreenHeight, 51*kScreenHeight);
    _headView1.backgroundColor = [UIColor whiteColor];
    
}
@end
