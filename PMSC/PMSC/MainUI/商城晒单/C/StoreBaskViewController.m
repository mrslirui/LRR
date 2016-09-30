//
//  StoreBaskViewController.m
//  PMSC
//
//  Created by 杨晓龙 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "StoreBaskViewController.h"
#import "StoreBaskTableViewCell.h"
#import "StoreBaskModel.h"
@interface StoreBaskViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *acc;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation StoreBaskViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)loadData
{
    [StoreBaskModel setStoreBaskP:1 id:self.ID block:^(id value) {
        [self.dataArray addObjectsFromArray:value];
        [self.tableView reloadData];
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"晒单";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight([UIScreen mainScreen].bounds) - 64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = kHexColor(0xeeeeee);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[StoreBaskTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.acc = @[@[@1,@5,@1,@1],@[],@[@1,@5,@1,@1],@[],@[@1,@5,@1,@1],@[],@[@1,@5,@1,@1,@1,@5,@1,@1],@[],@[@1,@5,@1],@[]];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreBaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    StoreBaskModel *s = _dataArray[indexPath.row];
    cell.imgArray = s.photolist;
    cell.contentLabel.text = s.content;
    cell.nameLabel.text = s.username;
    [cell.headImgView sd_setImageWithURL:[NSURL URLWithString:s.img] placeholderImage:[UIImage imageNamed:@"占位图方"]];
    cell.titleLabel.text = s.title;
    cell.dateLabel.text = [XLMethod changeTime:s.time formatter:@"MM月dd日 HH:mm"];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreBaskModel *s = _dataArray[indexPath.row];
    return [StoreBaskTableViewCell heightWithText:s.content] + 70 * kScreenWidth + 124 * kScreenWidth + [StoreBaskTableViewCell imgHeight:s.photolist];
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
