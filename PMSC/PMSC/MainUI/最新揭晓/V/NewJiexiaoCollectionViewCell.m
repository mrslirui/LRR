//
//  NewJiexiaoCollectionViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "NewJiexiaoCollectionViewCell.h"
#import "WillDoTableViewCell.h"
#import "NewJieTableViewCell.h"
#import "NewJiexiaoModel.h"
@interface NewJiexiaoCollectionViewCell ()<UITableViewDataSource,UITableViewDelegate>
{
    int pagelimt; //总页数
   }
@property(nonatomic,retain)NSMutableArray *dataArr;

@end
static int i = 1;
@implementation NewJiexiaoCollectionViewCell

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self load];
        [self loadData];
        
       
    }
    return self;
}

- (void)headerRereshing
{
    i = 1;
    [self loadData];
}
- (void)footerRereshing
{
    if (i != pagelimt) {
        i++;
        [self loadData];
        
    } else {
        [self.tableView.mj_footer setState:MJRefreshStateNoMoreData];
    }
}

-(void)load
{
    self.tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 1, Screen_WIDTH, Screen_HEIGHT ) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.backgroundColor =kHexColor(0xeeeeee);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);

    [_tableView registerClass:[WillDoTableViewCell class] forCellReuseIdentifier:@"cell"];
  
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorColor =kHexColor(0xeeeeee);

    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //刷新表格
        [self headerRereshing];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //加载表格
        [self footerRereshing];
    }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
           return _dataArr.count;
   }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
            WillDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NewJiexiaoModel *m = _dataArr[indexPath.row];
        cell.titleLabel.text = m.title;
        cell.valueLabel.text = [NSString stringWithFormat:@"价值:%@",m.money];
    cell.progressStr =[NSString stringWithFormat:@"总需:%@ 剩余:%@",m.canyurenshu,m.shenyurenshu];
    if ([m.canyurenshu floatValue] < [m.shenyurenshu floatValue]||[m.canyurenshu floatValue] == 0 || [m.canyurenshu floatValue] -[m.shenyurenshu floatValue] == 0) {
        cell.pro = 0.0;
    }
    else{
    CGFloat f = ([m.canyurenshu floatValue] -[m.shenyurenshu floatValue]) /[m.canyurenshu floatValue];
       cell.pro  =f;
    }
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:m.thumb] placeholderImage:[UIImage imageNamed:@"占位图方"]];
        return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 165*kScreenHeight;
}
-(void)loadData
{ [NewJiexiaoModel setWithtype:1 Withpage:i WithBlock:^(id value) {
    if (i== 1) {
        
        [self.dataArr removeAllObjects];
    }
    
    
    [self.dataArr addObjectsFromArray:[NewJiexiaoModel modelHanderWithArray:value[@"data"]]];
    NSString *str = [NSString stringWithFormat:@"%@",value[@"ptotal"]];
    pagelimt = [str intValue];
    [self.tableView reloadData];
    
    
    NSLog(@"%d ",pagelimt);
    [self.tableView.mj_header endRefreshing];
    
    [self.tableView.mj_footer endRefreshing];
    

  }];
    
}
@end
