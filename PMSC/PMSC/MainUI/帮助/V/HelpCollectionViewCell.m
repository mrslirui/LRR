//
//  HelpCollectionViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/9/7.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "HelpCollectionViewCell.h"

@implementation HelpCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
        [self creatTable];
        self.backgroundColor = kHexColor(0xeeeeee);
        self.hArr = [NSMutableArray array];
        self.mArr = [NSMutableArray array];
    }
    return self;
}
-(void)creatView
{
    self.tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0*kScreenHeight, self.frame.size.width,self.frame.size.height ) style:UITableViewStylePlain];
    [self.contentView addSubview:_tableView];
    
    _tableView.dataSource = self;
    _tableView.delegate =self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
 [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell1"];
    
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.type == 0)
    {
    return  _mArr.count;
    }
    else{
        return  _hArr.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.type == 0)
    {
        UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:@"cell"];
                HelpModel *m = _mArr[indexPath.row];
        
              cell.textLabel.text = m.issue;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
        
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        HelpModel *modle = _hArr[indexPath.row];
        cell.textLabel.text = modle.issue;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
      
        return cell;
        
    }
}
-(void)creatTable
{
    
    
    UIView *foot =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1000*kScreenHeight)];
    foot.backgroundColor = kHexColor(0xeeeeee);
    self.tableView.tableFooterView = foot;
   
    self.tiwenBtn = [ UIButton buttonWithType:UIButtonTypeCustom];
    [foot addSubview:_tiwenBtn];
    [_tiwenBtn setImage:[UIImage imageNamed:@"提问@3x"] forState:UIControlStateNormal ];
    _tiwenBtn.sd_layout
    .topSpaceToView(foot,100 *kScreenHeight)
    .leftSpaceToView(foot,-150 *kScreenWidth)
    .widthIs(1020 *kScreenWidth)
    .heightIs(111*kScreenHeight);
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        if(self.type == 0)
    {
    HelpModel *m =_mArr[indexPath.row];

    self.Qblock(m.ID );
           }
    else{
        HelpModel *m =_hArr[indexPath.row];

        self.Qblock(m.ID );
    }
}

-(void)setHArr:(NSMutableArray *)hArr
{
    _hArr = hArr;
   
    [_tableView reloadData];
}
-(void)setMArr:(NSMutableArray *)mArr
{
    _mArr = mArr;
    [_tableView reloadData];
}
@end
