//
//  AllDuobaoViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AllDuobaoViewController.h"
#import "AllDuoBaoTableViewCell.h"
#import "AllDuoBaoModel.h"
@interface AllDuobaoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSMutableArray *dataArr;
@property(nonatomic,assign) int p; //总页数
@end
static int i=1;
@implementation AllDuobaoViewController

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        
    }
    return _dataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"所有夺宝记录";
    [self.tableView registerClass:[AllDuoBaoTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self loadData];
    
    
    
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
    [self loadData];
}
- (void)footerRereshing
{
    if (i != _p) {
        i++;
        [self loadData];
        
    } else {
        [self.tableView.mj_footer setState:MJRefreshStateNoMoreData];
    }
}

-(void)loadData
{
    __weak typeof (AllDuobaoViewController ) *wes = self;
    [AllDuoBaoModel setDuobaoWithid:[self.dId intValue] withP:i block:^(id value,id page) {
        if (i == 1) {
            [wes.dataArr removeAllObjects];
        }
        [wes.dataArr addObjectsFromArray: value];
        _p = [[NSString stringWithFormat:@"%@",page] intValue];
        NSLog(@"%d",_p);
        [wes.tableView reloadData];
        [wes.tableView.mj_footer endRefreshing];
        [wes.tableView.mj_header endRefreshing];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AllDuoBaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
       AllDuoBaoModel *model = _dataArr[indexPath.row];
    cell.title .text = model.username;
    cell.people.text = [NSString stringWithFormat:@"参与了%@人次",model.part];
    cell.time.text =[XLMethod changeTime:[model.time floatValue] formatter:@"yyyy-MM-dd hh:mm"];
    cell.head.image = [UIImage imageNamed:model.uphoto];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 165*kScreenHeight;
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
