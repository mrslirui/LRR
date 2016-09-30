//
//  MyPostedViewController.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "MyPostedViewController.h"
#import "MyPostedView.h"
#import "MyPostedTableViewCell.h"
@interface MyPostedViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL flag;
}
@property (nonatomic, strong) MyPostedView *myPostedView;
@end

@implementation MyPostedViewController
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
    flag = NO;
    self.navigationItem.title = @"我的帖子";
        
    self.myPostedView = [[MyPostedView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [self.view addSubview:self.myPostedView];
    [self.myPostedView.passTableView registerClass:[MyPostedTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.myPostedView.checkTableView registerClass:[MyPostedTableViewCell class] forCellReuseIdentifier:@"cell2"];
    self.myPostedView.passTableView.dataSource = self;
    self.myPostedView.checkTableView.dataSource = self;
    self.myPostedView.passTableView.delegate = self;
    self.myPostedView.checkTableView.delegate = self;
    [self.myPostedView.passButton addTarget:self action:@selector(passButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.myPostedView.checkButton addTarget:self action:@selector(checkButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.myPostedView.passTableView) {
        MyPostedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        
        return cell;
    }else
    {
        MyPostedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        cell.shangNameLabel.text = @"朱武，仙洞";
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 340 * kScreenWidth;
}
#pragma mark 已通过
- (void)passButtonAction:(UIButton *)sender
{
    if (flag) {
        
        [self.myPostedView.passButton setTitleColor:[UIColor colorWithRed:0.9922 green:0.9843 blue:0.6353 alpha:1.0] forState:UIControlStateNormal];
        [self.myPostedView.checkButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.myPostedView.typeIamgeView.frame = CGRectMake(130 * kScreenWidth, 40 * kScreenWidth, 196  *kScreenWidth, 9 * kScreenWidth);
        self.myPostedView.scrollView.contentOffset = CGPointMake(0, 0);
        flag = NO;
    }
}
#pragma mark 待审核
- (void)checkButtonAction:(UIButton *)sender
{
    if (!flag) {
        [self.myPostedView.passButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.myPostedView.checkButton setTitleColor:[UIColor colorWithRed:0.9922 green:0.9843 blue:0.6353 alpha:1.0] forState:UIControlStateNormal];
        self.myPostedView.typeIamgeView.frame = CGRectMake((720 - 130 - 196) * kScreenWidth, 40 * kScreenWidth, 196 * kScreenWidth, 9 * kScreenWidth);
        self.myPostedView.scrollView.contentOffset = CGPointMake(self.view.frame.size.width, 0);
        flag = YES;
    }
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
