//
//  ShareShaidanViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/6.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShareShaidanViewController.h"
#import "ShaidanTableViewCell.h"
#import "ShareShaidanModel.h"
@interface ShareShaidanViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int j;
}
@property(nonatomic,retain)NSMutableArray *dataArr;
@property(nonatomic,retain)NSString *dStr;
@property(nonatomic,assign)BOOL isrefrsh;
@end
static int i = 1;

@implementation ShareShaidanViewController
-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        self.dataArr = [NSMutableArray array];
 
    }
    return _dataArr;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   }
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"晒单分享";

    [self.tableView registerClass:[ShaidanTableViewCell class] forCellReuseIdentifier:@"cell"];
     [self loadData];
    
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
    [self loadData];
}
- (void)footerRereshing
{
    if (i != j) {
        i++;
        [self loadData];
        
    } else {
        [self.tableView.mj_footer setState:MJRefreshStateNoMoreData];
    }
}

-(void)loadData
{
    [ShareShaidanModel setShareShaidanWithLimit:i BLOCK:^(id returnValue,id p) {

        if (i == 1) {
            [self.dataArr removeAllObjects];
        }
        
        [self.dataArr addObjectsFromArray:returnValue];
        j = [[NSString stringWithFormat:@"%@",p] intValue];
        NSLog(@"%d",j);
        [self.tableView reloadData];
      
        [self.tableView.mj_header endRefreshing];
        
        [self.tableView.mj_footer endRefreshing];
    }];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
       ShaidanTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
    ShareShaidanModel *m = _dataArr[indexPath.section];
    cell.nick .text = m.username;
    cell.title.text =[NSString stringWithFormat:@"(第%@期)%@",m.periods,m.title];
    cell.shuomingLb.text = m.content;
    cell.date.text = [XLMethod changeTime:[m.time floatValue] formatter:@"yy-mm-dd"];
    [cell.imgView  sd_setImageWithURL:[NSURL URLWithString:@"http://gangmaduobao.com/statics/uploads/photo/member.jpg"]];
    cell.fenLabel.text = m.comments;
    cell.fenxiang.image = [UIImage imageNamed:@"pinglun@3x_1"];
    cell.xin.hidden  =YES;
    cell.xinlabel.hidden = YES;
    self.dStr = cell.shuomingLb.text;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.photoArr = m.photplist;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20 *kScreenHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat h = [ShaidanTableViewCell heightWithText:_dStr];
    return 431*kScreenHeight+h;
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
