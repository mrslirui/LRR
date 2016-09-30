//
//  ZhongjiangCollectionViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ZhongjiangCollectionViewCell.h"
#import "FahuoTableViewCell.h"
#import "ZhongjiangModel.h"
@interface ZhongjiangCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSMutableArray *dataArr;
@property(nonatomic,retain)NSString *titleStr;
@end
@implementation ZhongjiangCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    if (self) {
        [self  creatView];
        self.backgroundColor = kHexColor(0xeeeeee);
    }
    return self;
}
-(void)creatView
{
    self.tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 1, Screen_WIDTH, Screen_HEIGHT ) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.backgroundColor =kHexColor(0xeeeeee);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    [_tableView registerClass:[FahuoTableViewCell class] forCellReuseIdentifier:@"cell"];
   
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorColor =kHexColor(0xeeeeee);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FahuoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ZhongjiangModel *m = _dataArr[indexPath.row];
    self.titleStr = [NSString stringWithFormat:@"第(%@)期%@",m.shopqishu,m.shopname];
    if(self.type == 1)
    {
        
        cell.titleLabel.text =[NSString stringWithFormat:@"第(%@)期%@",m.shopqishu,m.shopname];
        cell.time.text =[NSString stringWithFormat:@"中奖时间: %@",[XLMethod changeTime:[m.q_end_time floatValue] formatter:@"YYYY-MM-dd"]];
        cell.codeLabel.text = [NSString stringWithFormat:@"中奖期号: %@",[XLMethod changeTime:[m.q_end_time floatValue] formatter:@"YYYYMMdd"]];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:m.thumb] placeholderImage:[UIImage imageNamed:@"占位图方"]];

        [cell.fahuoBtn setImage:[UIImage imageNamed:@"发货请求@3x"] forState:0];
    }
    else if(self.type == 2)
    {
        cell.titleLabel.text =[NSString stringWithFormat:@"第(%@)期%@",m.shopqishu,m.shopname];
        cell.time.text =[NSString stringWithFormat:@"中奖时间: %@",[XLMethod changeTime:[m.q_end_time floatValue] formatter:@"YYYY-MM-dd"]];
        cell.codeLabel.text = [NSString stringWithFormat:@"中奖期号: %@",[XLMethod changeTime:[m.q_end_time floatValue] formatter:@"YYYYMMdd"]];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:m.thumb] placeholderImage:[UIImage imageNamed:@"占位图方"]];

        [cell.fahuoBtn setImage:[UIImage imageNamed:@"发货请求"] forState:0];

        [cell.fahuoBtn setImage:[UIImage imageNamed:@"收货@3x"] forState:0];

        
    }
    else
    {
        cell.titleLabel.text =[NSString stringWithFormat:@"第(%@)期%@",m.shopqishu,m.shopname];
        cell.time.text =[NSString stringWithFormat:@"中奖时间: %@",[XLMethod changeTime:[m.q_end_time floatValue] formatter:@"YYYY-MM-dd"]];
        cell.codeLabel.text = [NSString stringWithFormat:@"中奖期号: %@",[XLMethod changeTime:[m.q_end_time floatValue] formatter:@"YYYYMMdd"]];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:m.thumb] placeholderImage:[UIImage imageNamed:@"占位图方"]];
        
        [cell.fahuoBtn setImage:[UIImage imageNamed:@"晒单"] forState:0];

        [cell.fahuoBtn addTarget:self action:@selector(shaidan) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = [FahuoTableViewCell heightWithText:_titleStr];
    return 145*kScreenHeight + h;
}
-(void)shaidan
{
    self.clickBtn();
}
-(void)setType:(int)type
{   _type = type;
    NSLog(@"%d",_type);   
    [ZhongjiangModel setWithType:self.type Withname:TOKEN withBlock:^(id value) {
        self.dataArr = value;
        [self.tableView reloadData];
    }];
}
@end
