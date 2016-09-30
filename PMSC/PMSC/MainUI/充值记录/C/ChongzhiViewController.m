//
//  ChongzhiViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChongzhiViewController.h"
#import "ChongzhiView.h"
#import "ChongzhiTableViewCell.h"
#import "ChongzhiModel.h"
@interface ChongzhiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)ChongzhiView*chongzhiView;
@property(nonatomic,retain)NSMutableArray *dataArr;
@end

@implementation ChongzhiViewController
//-(NSMutableArray *)dataArr
//{
//    if (!_dataArr) {
//        _dataArr =[NSMutableArray array];
//    }
//    return _dataArr;
//}
-(ChongzhiView *)chongzhiView
{
    if(!_chongzhiView)
        
    {
        _chongzhiView = [[ChongzhiView alloc] initWithFrame:self.view.bounds];
        self.chongzhiView.tableView.delegate = self;
        self.chongzhiView.tableView.dataSource  =self;
    }
    return _chongzhiView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.chongzhiView];
    [self.chongzhiView .tableView registerClass:[ChongzhiTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.navigationItem.title = @"充值记录";
    [self laodData];
}
-(void)laodData
{
    [ChongzhiModel setWithUid:TOKEN WithBLock:^(id value) {
       
        self.dataArr = [ChongzhiModel modelHanderWithArray:value[@"data"]];
        self.chongzhiView.totalLb.text = value[@"moneytoal"][@"money"];
        NSLog(@"%@",value[@"data"]);
        [self.chongzhiView.tableView reloadData];
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ChongzhiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ChongzhiModel *m = _dataArr[indexPath.row];
    NSString *str = [XLMethod changeTime:[m.time floatValue] formatter:@"yyyy.MM.dd HH:mm:ss"];
    NSLog(@"%@",str);
    NSString *str1 = [str substringToIndex:10];
    NSString *str2 =[ str substringFromIndex:11];
    cell.timeLb.text = str1;
    cell.qudaoLb.text  = m.pay_type;
    cell.moneyLb.text = m.money;
    cell.detail.text = str2;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     return  104 *kScreenHeight;
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
