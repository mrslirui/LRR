//
//  ProfitAndLossViewDetailViewController.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/29.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ProfitAndLossViewDetailViewController.h"
#import "ProfitAndLossViewDetailViewFirstTableViewCell.h"
#import "ProfitAndLossViewDetailViewSecondTableViewCell.h"
@interface ProfitAndLossViewDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ProfitAndLossViewDetailViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"历史记录";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    [self.tableView registerClass:[ProfitAndLossViewDetailViewFirstTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerClass:[ProfitAndLossViewDetailViewSecondTableViewCell class] forCellReuseIdentifier:@"cell2"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    self.tableView.tableFooterView = [UIView new];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ProfitAndLossViewDetailViewFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        return cell;
    }else
    {
        ProfitAndLossViewDetailViewSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        cell.rankArray = @[@"2",@"3",@"1",@"10",@"4",@"8",@"6",@"5",@"7",@"9"];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75 * kScreenWidth;
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
