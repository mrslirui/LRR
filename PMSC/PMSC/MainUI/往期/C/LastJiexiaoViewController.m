//
//  LastJiexiaoViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//
#import "LastJiexiaoViewController.h"
#import "LastTableViewCell.h"
#import "LastJiexiaoModel.h"
@interface LastJiexiaoViewController ()<UITableViewDataSource,UITableViewDelegate>
{
   
}
@property(nonatomic,retain)NSMutableArray *dataArr;
@property(nonatomic,assign)int pagelimit;
@end
static int i = 1;
static int j = 3;
@implementation LastJiexiaoViewController
-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
     
        self.dataArr = [NSMutableArray array];

    }
    return _dataArr;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"往期揭晓";
    [self.tableView registerClass:[LastTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor = RGBA(239, 239, 239, 1);
    NSLog(@"%@",self.goodId);
    
    [self loadWithId:self.goodId];
    
    [self.tableView.mj_header beginRefreshing];
    
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //刷新表格
        [self headerRereshing];
    }];
    
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //刷新表格
        [self footerRereshing];
    }];

}
- (void)headerRereshing
{
    i = 1;
    [self loadWithId:self.goodId];
}
- (void)footerRereshing
{
    if (i != _pagelimit) {
        i++;
        [self loadWithId:self.goodId];

    } else {
        [self.tableView.mj_footer setState:MJRefreshStateNoMoreData];
    }
}
-(void)loadWithId:(NSString *)gId
{
    

    
    [LastJiexiaoModel setjiexiaoWithId:[gId intValue] Withp:i withblock:^(id value,id page) {
        if (i== 1) {
            
            [self.dataArr removeAllObjects];
        }
    
        
        [self.dataArr addObjectsFromArray:value];
        NSString *str = [NSString stringWithFormat:@"%@",page];
        _pagelimit = [str intValue];
        [self.tableView reloadData];
        
      
        NSLog(@"%d ",_pagelimit);
        [self.tableView.mj_header endRefreshing];

        [self.tableView.mj_footer endRefreshing];

    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LastTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    LastJiexiaoModel * m = _dataArr[indexPath.section];
    cell.title.text = [NSString stringWithFormat:@"第%@期 揭晓时间:%@",m.periods, [XLMethod changeTime:[m.etime floatValue] formatter:@"yy-MM-dd hh:mm:ss"]];
    
    cell.huojiang.text =[NSString stringWithFormat:@"获奖者: %@",m.username];
    cell.dizhi.text = [NSString stringWithFormat:@"IP地址: %@",m.ip ];
    cell.luckCode.text = [NSString stringWithFormat:@"幸运号码:%@",m.gcode];
    cell.join.text = [NSString stringWithFormat:@"本期参与:%@人次",m.part ];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (214+70)*kScreenHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 21*kScreenHeight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
