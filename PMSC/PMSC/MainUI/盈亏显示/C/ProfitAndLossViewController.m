//
//  ProfitAndLossViewController.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/29.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ProfitAndLossViewController.h"
#import "ProfitAndLossFirstTableViewCell.h"
#import "ProfitAndLossSecondTableViewCell.h"
#import "HorseRacingHistoryViewController.h"
@interface ProfitAndLossViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation ProfitAndLossViewController
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
    self.title = @"盈亏";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[ProfitAndLossFirstTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerClass:[ProfitAndLossSecondTableViewCell class] forCellReuseIdentifier:@"cell2"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ProfitAndLossFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        return cell;
    }else
    {
        ProfitAndLossSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        cell.lookButton.tag = 1000 + indexPath.row;
        [cell.lookButton addTarget:self action:@selector(lookButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 72 * kScreenWidth;
    }else
    {
        return 68 * kScreenWidth;
    }
}
- (void)lookButtonAction:(UIButton *)sender
{
    NSLog(@"查看第%ld行",(sender.tag - 1000));
    [self.navigationController pushViewController:[HorseRacingHistoryViewController new] animated:YES];
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
