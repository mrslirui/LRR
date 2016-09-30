//
//  FindViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "FindViewController.h"
#import "FindTableViewCell.h"
#import "ReplyDetailViewController.h"
#import "PostedViewController.h"
#import "XLMethod.h"
#import "FindViewModel.h"
@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    int a;
    int alla;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *alertLabel;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *selectArray;
@end

@implementation FindViewController
- (NSMutableArray *)selectArray
{
    if (!_selectArray) {
        self.selectArray = [NSMutableArray array];
    }
    return _selectArray;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    a = 1;
    [self loadData];
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"矢量智能对象@3x_1"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItem:)];
    self.navigationItem.title = @"发现";
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, CGRectGetHeight([UIScreen mainScreen].bounds) - 64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = kHexColor(0xeeeeee);
    [self.tableView registerClass:[FindTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 720 * kScreenWidth, 121 * kScreenWidth)];
    _headerView.backgroundColor = kHexColor(0xeeeeee);
    //    self.tableView.tableHeaderView = _headerView;
    UIView *bgView = [UIView new];
    bgView.frame = CGRectMake(170 * kScreenWidth, 25 * kScreenWidth, CGRectGetWidth(self.view.frame) - 340 * kScreenWidth, 71 * kScreenWidth);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lookDetailVote:)];
    [bgView addGestureRecognizer:tap];
    bgView.backgroundColor = kHexColor(0x494949);
    [_headerView addSubview:bgView];
   
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"矢量智能对象@3x"]];
    
    imgView.frame = CGRectMake(20 * kScreenWidth, 20 * kScreenWidth, 33 * kScreenWidth, 30 * kScreenWidth);
    [bgView addSubview:imgView];
    
    self.alertLabel = [UILabel new];
    self.alertLabel.frame = CGRectMake(CGRectGetMaxX(imgView.frame) + 5 * kScreenWidth, CGRectGetMinY(imgView.frame), 300 * kScreenWidth, CGRectGetHeight(imgView.frame));
    self.alertLabel.font = [UIFont systemFontOfSize:23 * kScreenWidth];
    self.alertLabel.textAlignment = NSTextAlignmentCenter;
    //    self.alertLabel.attributedText = [XLMethod fuwenbenString:@"张三回复了你阿尔斯通" FontNumber:[UIFont systemFontOfSize:23 * kScreenWidth] andRange:NSMakeRange(0, 2) AndColor:kHexColor(0xfd522f) andAllColor:[UIColor whiteColor]];
    [bgView addSubview:_alertLabel];
    
    self.alertLabel.sd_layout
    .topEqualToView(imgView)
    .leftSpaceToView(imgView,20 * kScreenWidth)
    .widthIs(100 * kScreenWidth)
    .heightIs(30 * kScreenWidth);
    [self.alertLabel setSingleLineAutoResizeWithMaxWidth:240 * kScreenWidth];
    self.alertLabel.didFinishAutoLayoutBlock = ^(CGRect frame){
        CGFloat wid = 93 * kScreenWidth + frame.size.width;
        bgView.frame = CGRectMake(350 * kScreenWidth - wid / 2, 25 * kScreenWidth, wid, 71 * kScreenWidth);
        bgView.layer.cornerRadius = wid / 20;
        bgView.layer.masksToBounds = YES;
    };
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        a = 1;
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        
        if (a == alla) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            [self.tableView.mj_header endRefreshing];
        }else
        {
            a++;
            [self loadData];
        }
        
    }];

    
}

- (void)loadData
{
    
        [FindViewModel setFindViewP:a block:^(id value) {
            NSMutableArray *arr = [NSMutableArray array];
            for (NSDictionary *dic in value[@"data"]) {
                [arr addObject:[FindViewModel getDic:[XLMethod changeDicForkey:dic]]];
            }
            alla = [value[@"ptotal"] intValue];
            if (a != 1) {
                [self.dataArray addObjectsFromArray:arr];
            }else
            {
                [self.dataArray removeAllObjects];
                [self.dataArray addObjectsFromArray:arr];
                
            }
            [self.tableView.mj_footer endRefreshing];
            [self.tableView.mj_header endRefreshing];
            if ([NSString stringWithFormat:@"%@",value[@"reply"]].length == 0) {
                self.tableView.tableHeaderView = nil;
                self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, CGRectGetHeight(self.view.frame));
            }else
            {
                self.tableView.tableHeaderView = self.headerView;
                self.alertLabel.text = value[@"reply"];
            }
            [self.selectArray removeAllObjects];
            for (int i = 0; i < self.dataArray.count; i++) {
                FindViewModel *findM = _dataArray[i];
                if (findM.reward == 0) {
                    [self.selectArray addObject:@"0"];
                }else
                {
                    [self.selectArray addObject:@"1"];
                }
            }
            [self.tableView reloadData];
        }];
    
}
#pragma mark 快速查看谁回复
- (void)lookDetailVote:(UITapGestureRecognizer *)tap
{
    NSLog(@"你你你");
}
#pragma mark 发帖
- (void)rightBarButtonItem:(UIBarButtonItem *)sender
{
    [self.navigationController pushViewController:[PostedViewController new] animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FindTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [cell.voteButton addGestureRecognizer:tap];
    cell.voteButton.tag = 1000 + indexPath.row;
    [cell.shangButton addTarget:self action:@selector(shangButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([[NSString stringWithFormat:@"%@",self.selectArray[indexPath.row]] isEqualToString:@"0"]) {
        [cell.shangButton setBackgroundImage:[UIImage imageNamed:@"赏@3x_1"] forState:UIControlStateNormal];
    }else
    {
        [cell.shangButton setBackgroundImage:[UIImage imageNamed:@"赏@3x"] forState:UIControlStateNormal];
    }
    cell.findM = _dataArray[indexPath.row];
    cell.shangButton.tag = 10000 + indexPath.row;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 280 * kScreenWidth;
}
#pragma mark 评论
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    [Address pushLoginWithBlock:^{
        TitleAndImageView *t = (TitleAndImageView *)tap.view;
        NSInteger index = t.tag - 1000;
        FindViewModel *findM = _dataArray[index];
        ReplyDetailViewController *re = [ReplyDetailViewController new];
        re.ID = findM.ID;
        [self.navigationController pushViewController:re animated:YES];    }];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [Address pushLoginWithBlock:^{
        FindViewModel *findM = _dataArray[indexPath.row];
        ReplyDetailViewController *re = [ReplyDetailViewController new];
        re.ID = findM.ID;
        [self.navigationController pushViewController:re animated:YES];
    }];
    
}
#pragma mark 赏
- (void)shangButtonAction:(UIButton *)sender
{
    NSInteger index = sender.tag - 10000;
    FindViewModel *findM = _dataArray[index];
    NSString *name = findM.username;
    [FindViewModel setReward:findM.ID block:^() {
        [self.selectArray replaceObjectAtIndex:index withObject:@"1"];
        [self.tableView reloadData];
        [XLToast showCenterWithText:[NSString stringWithFormat:@"您打赏了%@",name] duration:2];
    }];
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
