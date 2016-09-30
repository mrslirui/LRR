//
//  AdressViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/25.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AdressViewController.h"
#import "AdressView.h"
#import "AdressTableViewCell.h"
#import "AddAdressViewController.h"
#import "PayViewController.h"
#import "AdressModel.h"
@interface AdressViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)AdressView *adressView;
@property(nonatomic,retain)NSString *addrstring;
@property(nonatomic,retain)NSMutableArray *dataArr;

@end

@implementation AdressViewController
-(AdressView *)adressView
{
if(!_adressView)
    
{
    _adressView = [[AdressView alloc] initWithFrame:self.view.bounds];
    _adressView.tableView.delegate  =self;
    _adressView.tableView.dataSource = self;
    
}
    return _adressView;
    }
-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        
    }
    return _dataArr;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.adressView];
    if ([self.name isEqualToString:@"地址管理"]) {
        self.navigationItem.title = self.name;
[_adressView.tiwenBtn setImage:[UIImage imageNamed:@"添加收货地址@3x"] forState:0];
    }
    else
    {
        self.navigationItem.title = @"地址选择";
        [_adressView.tiwenBtn setImage:[UIImage imageNamed:@"下一步"] forState:0];

    }
    [self.adressView.tableView registerClass:[AdressTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.adressView.tiwenBtn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)loadData
{
    NSLog(@"%@",[NSString stringWithFormat:@"%@",TOKEN ] );
    [AdressModel setWithId:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"]  withBLOCK:^(id returnValue) {
        self.dataArr = returnValue;
        [self.adressView.tableView reloadData];
    }];
}
//底部按钮
-(void)add:(UIButton *)sender
{ if([self.name isEqualToString:@"地址管理"])
{
    
    [self.navigationController pushViewController:[AddAdressViewController new] animated:YES];
}
    else
    {
        [self.navigationController pushViewController:[PayViewController new] animated:YES];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   return 1;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ AdressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    AdressModel *m = _dataArr[indexPath.section];
    cell.nameLb.text= m.shouhuoren;
    [cell.phoneLb setTitle:m.mobile forState:0] ;
    cell.dizhiLb.text = [NSString stringWithFormat:@"%@%@%@",m.sheng,m.shi,m.jiedao];
    self.addrstring = cell.dizhiLb.text;
    [cell.rightArrow addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.rightArrow.tag = [m.ID intValue] ;
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGFloat h = [AdressTableViewCell heightWithText:self.addrstring];
    return 150*kScreenHeight + h;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return  20 *kScreenHeight;
}
#pragma mark -删除方法
-(void)deleteAction:(UIButton *)btn
{
    NSLog(@"%ld",btn.tag);
    
    [xl_HttpManager httpManagerPostParameter:@{@"uid":[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] ,@"id":[NSNumber numberWithInteger:btn.tag]} toHttpUrlStr:AddressDelete isCacheorNot:NO targetViewController:self andUrlFunctionName:@"dizhidelete" isValidate:YES success:^(id responseObject) {
        [ AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"删除成功" AndViewController:self];

        [self loadData];
        
    } orFail:^(NSError *error) {
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
